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
      ?auto_22863 - PLACE
      ?auto_22861 - HOIST
      ?auto_22860 - SURFACE
      ?auto_22866 - PLACE
      ?auto_22867 - HOIST
      ?auto_22865 - SURFACE
      ?auto_22862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22859 ?auto_22864 ) ( IS-CRATE ?auto_22858 ) ( not ( = ?auto_22863 ?auto_22864 ) ) ( HOIST-AT ?auto_22861 ?auto_22863 ) ( AVAILABLE ?auto_22861 ) ( SURFACE-AT ?auto_22858 ?auto_22863 ) ( ON ?auto_22858 ?auto_22860 ) ( CLEAR ?auto_22858 ) ( not ( = ?auto_22857 ?auto_22858 ) ) ( not ( = ?auto_22857 ?auto_22860 ) ) ( not ( = ?auto_22858 ?auto_22860 ) ) ( not ( = ?auto_22859 ?auto_22861 ) ) ( SURFACE-AT ?auto_22856 ?auto_22864 ) ( CLEAR ?auto_22856 ) ( IS-CRATE ?auto_22857 ) ( AVAILABLE ?auto_22859 ) ( not ( = ?auto_22866 ?auto_22864 ) ) ( HOIST-AT ?auto_22867 ?auto_22866 ) ( AVAILABLE ?auto_22867 ) ( SURFACE-AT ?auto_22857 ?auto_22866 ) ( ON ?auto_22857 ?auto_22865 ) ( CLEAR ?auto_22857 ) ( TRUCK-AT ?auto_22862 ?auto_22864 ) ( not ( = ?auto_22856 ?auto_22857 ) ) ( not ( = ?auto_22856 ?auto_22865 ) ) ( not ( = ?auto_22857 ?auto_22865 ) ) ( not ( = ?auto_22859 ?auto_22867 ) ) ( not ( = ?auto_22856 ?auto_22858 ) ) ( not ( = ?auto_22856 ?auto_22860 ) ) ( not ( = ?auto_22858 ?auto_22865 ) ) ( not ( = ?auto_22863 ?auto_22866 ) ) ( not ( = ?auto_22861 ?auto_22867 ) ) ( not ( = ?auto_22860 ?auto_22865 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22856 ?auto_22857 )
      ( MAKE-1CRATE ?auto_22857 ?auto_22858 )
      ( MAKE-2CRATE-VERIFY ?auto_22856 ?auto_22857 ?auto_22858 ) )
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
      ?auto_22891 - PLACE
      ?auto_22887 - PLACE
      ?auto_22889 - HOIST
      ?auto_22886 - SURFACE
      ?auto_22897 - PLACE
      ?auto_22892 - HOIST
      ?auto_22894 - SURFACE
      ?auto_22893 - PLACE
      ?auto_22896 - HOIST
      ?auto_22895 - SURFACE
      ?auto_22890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22888 ?auto_22891 ) ( IS-CRATE ?auto_22885 ) ( not ( = ?auto_22887 ?auto_22891 ) ) ( HOIST-AT ?auto_22889 ?auto_22887 ) ( AVAILABLE ?auto_22889 ) ( SURFACE-AT ?auto_22885 ?auto_22887 ) ( ON ?auto_22885 ?auto_22886 ) ( CLEAR ?auto_22885 ) ( not ( = ?auto_22884 ?auto_22885 ) ) ( not ( = ?auto_22884 ?auto_22886 ) ) ( not ( = ?auto_22885 ?auto_22886 ) ) ( not ( = ?auto_22888 ?auto_22889 ) ) ( IS-CRATE ?auto_22884 ) ( not ( = ?auto_22897 ?auto_22891 ) ) ( HOIST-AT ?auto_22892 ?auto_22897 ) ( AVAILABLE ?auto_22892 ) ( SURFACE-AT ?auto_22884 ?auto_22897 ) ( ON ?auto_22884 ?auto_22894 ) ( CLEAR ?auto_22884 ) ( not ( = ?auto_22883 ?auto_22884 ) ) ( not ( = ?auto_22883 ?auto_22894 ) ) ( not ( = ?auto_22884 ?auto_22894 ) ) ( not ( = ?auto_22888 ?auto_22892 ) ) ( SURFACE-AT ?auto_22882 ?auto_22891 ) ( CLEAR ?auto_22882 ) ( IS-CRATE ?auto_22883 ) ( AVAILABLE ?auto_22888 ) ( not ( = ?auto_22893 ?auto_22891 ) ) ( HOIST-AT ?auto_22896 ?auto_22893 ) ( AVAILABLE ?auto_22896 ) ( SURFACE-AT ?auto_22883 ?auto_22893 ) ( ON ?auto_22883 ?auto_22895 ) ( CLEAR ?auto_22883 ) ( TRUCK-AT ?auto_22890 ?auto_22891 ) ( not ( = ?auto_22882 ?auto_22883 ) ) ( not ( = ?auto_22882 ?auto_22895 ) ) ( not ( = ?auto_22883 ?auto_22895 ) ) ( not ( = ?auto_22888 ?auto_22896 ) ) ( not ( = ?auto_22882 ?auto_22884 ) ) ( not ( = ?auto_22882 ?auto_22894 ) ) ( not ( = ?auto_22884 ?auto_22895 ) ) ( not ( = ?auto_22897 ?auto_22893 ) ) ( not ( = ?auto_22892 ?auto_22896 ) ) ( not ( = ?auto_22894 ?auto_22895 ) ) ( not ( = ?auto_22882 ?auto_22885 ) ) ( not ( = ?auto_22882 ?auto_22886 ) ) ( not ( = ?auto_22883 ?auto_22885 ) ) ( not ( = ?auto_22883 ?auto_22886 ) ) ( not ( = ?auto_22885 ?auto_22894 ) ) ( not ( = ?auto_22885 ?auto_22895 ) ) ( not ( = ?auto_22887 ?auto_22897 ) ) ( not ( = ?auto_22887 ?auto_22893 ) ) ( not ( = ?auto_22889 ?auto_22892 ) ) ( not ( = ?auto_22889 ?auto_22896 ) ) ( not ( = ?auto_22886 ?auto_22894 ) ) ( not ( = ?auto_22886 ?auto_22895 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22882 ?auto_22883 ?auto_22884 )
      ( MAKE-1CRATE ?auto_22884 ?auto_22885 )
      ( MAKE-3CRATE-VERIFY ?auto_22882 ?auto_22883 ?auto_22884 ?auto_22885 ) )
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
      ?auto_22919 - HOIST
      ?auto_22921 - PLACE
      ?auto_22923 - PLACE
      ?auto_22918 - HOIST
      ?auto_22920 - SURFACE
      ?auto_22930 - PLACE
      ?auto_22924 - HOIST
      ?auto_22931 - SURFACE
      ?auto_22925 - PLACE
      ?auto_22932 - HOIST
      ?auto_22928 - SURFACE
      ?auto_22927 - PLACE
      ?auto_22926 - HOIST
      ?auto_22929 - SURFACE
      ?auto_22922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22919 ?auto_22921 ) ( IS-CRATE ?auto_22917 ) ( not ( = ?auto_22923 ?auto_22921 ) ) ( HOIST-AT ?auto_22918 ?auto_22923 ) ( AVAILABLE ?auto_22918 ) ( SURFACE-AT ?auto_22917 ?auto_22923 ) ( ON ?auto_22917 ?auto_22920 ) ( CLEAR ?auto_22917 ) ( not ( = ?auto_22916 ?auto_22917 ) ) ( not ( = ?auto_22916 ?auto_22920 ) ) ( not ( = ?auto_22917 ?auto_22920 ) ) ( not ( = ?auto_22919 ?auto_22918 ) ) ( IS-CRATE ?auto_22916 ) ( not ( = ?auto_22930 ?auto_22921 ) ) ( HOIST-AT ?auto_22924 ?auto_22930 ) ( AVAILABLE ?auto_22924 ) ( SURFACE-AT ?auto_22916 ?auto_22930 ) ( ON ?auto_22916 ?auto_22931 ) ( CLEAR ?auto_22916 ) ( not ( = ?auto_22915 ?auto_22916 ) ) ( not ( = ?auto_22915 ?auto_22931 ) ) ( not ( = ?auto_22916 ?auto_22931 ) ) ( not ( = ?auto_22919 ?auto_22924 ) ) ( IS-CRATE ?auto_22915 ) ( not ( = ?auto_22925 ?auto_22921 ) ) ( HOIST-AT ?auto_22932 ?auto_22925 ) ( AVAILABLE ?auto_22932 ) ( SURFACE-AT ?auto_22915 ?auto_22925 ) ( ON ?auto_22915 ?auto_22928 ) ( CLEAR ?auto_22915 ) ( not ( = ?auto_22914 ?auto_22915 ) ) ( not ( = ?auto_22914 ?auto_22928 ) ) ( not ( = ?auto_22915 ?auto_22928 ) ) ( not ( = ?auto_22919 ?auto_22932 ) ) ( SURFACE-AT ?auto_22913 ?auto_22921 ) ( CLEAR ?auto_22913 ) ( IS-CRATE ?auto_22914 ) ( AVAILABLE ?auto_22919 ) ( not ( = ?auto_22927 ?auto_22921 ) ) ( HOIST-AT ?auto_22926 ?auto_22927 ) ( AVAILABLE ?auto_22926 ) ( SURFACE-AT ?auto_22914 ?auto_22927 ) ( ON ?auto_22914 ?auto_22929 ) ( CLEAR ?auto_22914 ) ( TRUCK-AT ?auto_22922 ?auto_22921 ) ( not ( = ?auto_22913 ?auto_22914 ) ) ( not ( = ?auto_22913 ?auto_22929 ) ) ( not ( = ?auto_22914 ?auto_22929 ) ) ( not ( = ?auto_22919 ?auto_22926 ) ) ( not ( = ?auto_22913 ?auto_22915 ) ) ( not ( = ?auto_22913 ?auto_22928 ) ) ( not ( = ?auto_22915 ?auto_22929 ) ) ( not ( = ?auto_22925 ?auto_22927 ) ) ( not ( = ?auto_22932 ?auto_22926 ) ) ( not ( = ?auto_22928 ?auto_22929 ) ) ( not ( = ?auto_22913 ?auto_22916 ) ) ( not ( = ?auto_22913 ?auto_22931 ) ) ( not ( = ?auto_22914 ?auto_22916 ) ) ( not ( = ?auto_22914 ?auto_22931 ) ) ( not ( = ?auto_22916 ?auto_22928 ) ) ( not ( = ?auto_22916 ?auto_22929 ) ) ( not ( = ?auto_22930 ?auto_22925 ) ) ( not ( = ?auto_22930 ?auto_22927 ) ) ( not ( = ?auto_22924 ?auto_22932 ) ) ( not ( = ?auto_22924 ?auto_22926 ) ) ( not ( = ?auto_22931 ?auto_22928 ) ) ( not ( = ?auto_22931 ?auto_22929 ) ) ( not ( = ?auto_22913 ?auto_22917 ) ) ( not ( = ?auto_22913 ?auto_22920 ) ) ( not ( = ?auto_22914 ?auto_22917 ) ) ( not ( = ?auto_22914 ?auto_22920 ) ) ( not ( = ?auto_22915 ?auto_22917 ) ) ( not ( = ?auto_22915 ?auto_22920 ) ) ( not ( = ?auto_22917 ?auto_22931 ) ) ( not ( = ?auto_22917 ?auto_22928 ) ) ( not ( = ?auto_22917 ?auto_22929 ) ) ( not ( = ?auto_22923 ?auto_22930 ) ) ( not ( = ?auto_22923 ?auto_22925 ) ) ( not ( = ?auto_22923 ?auto_22927 ) ) ( not ( = ?auto_22918 ?auto_22924 ) ) ( not ( = ?auto_22918 ?auto_22932 ) ) ( not ( = ?auto_22918 ?auto_22926 ) ) ( not ( = ?auto_22920 ?auto_22931 ) ) ( not ( = ?auto_22920 ?auto_22928 ) ) ( not ( = ?auto_22920 ?auto_22929 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_22913 ?auto_22914 ?auto_22915 ?auto_22916 )
      ( MAKE-1CRATE ?auto_22916 ?auto_22917 )
      ( MAKE-4CRATE-VERIFY ?auto_22913 ?auto_22914 ?auto_22915 ?auto_22916 ?auto_22917 ) )
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
      ?auto_22959 - HOIST
      ?auto_22957 - PLACE
      ?auto_22955 - PLACE
      ?auto_22958 - HOIST
      ?auto_22960 - SURFACE
      ?auto_22962 - PLACE
      ?auto_22963 - HOIST
      ?auto_22966 - SURFACE
      ?auto_22964 - PLACE
      ?auto_22968 - HOIST
      ?auto_22961 - SURFACE
      ?auto_22971 - PLACE
      ?auto_22967 - HOIST
      ?auto_22965 - SURFACE
      ?auto_22969 - PLACE
      ?auto_22972 - HOIST
      ?auto_22970 - SURFACE
      ?auto_22956 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22959 ?auto_22957 ) ( IS-CRATE ?auto_22954 ) ( not ( = ?auto_22955 ?auto_22957 ) ) ( HOIST-AT ?auto_22958 ?auto_22955 ) ( AVAILABLE ?auto_22958 ) ( SURFACE-AT ?auto_22954 ?auto_22955 ) ( ON ?auto_22954 ?auto_22960 ) ( CLEAR ?auto_22954 ) ( not ( = ?auto_22953 ?auto_22954 ) ) ( not ( = ?auto_22953 ?auto_22960 ) ) ( not ( = ?auto_22954 ?auto_22960 ) ) ( not ( = ?auto_22959 ?auto_22958 ) ) ( IS-CRATE ?auto_22953 ) ( not ( = ?auto_22962 ?auto_22957 ) ) ( HOIST-AT ?auto_22963 ?auto_22962 ) ( AVAILABLE ?auto_22963 ) ( SURFACE-AT ?auto_22953 ?auto_22962 ) ( ON ?auto_22953 ?auto_22966 ) ( CLEAR ?auto_22953 ) ( not ( = ?auto_22952 ?auto_22953 ) ) ( not ( = ?auto_22952 ?auto_22966 ) ) ( not ( = ?auto_22953 ?auto_22966 ) ) ( not ( = ?auto_22959 ?auto_22963 ) ) ( IS-CRATE ?auto_22952 ) ( not ( = ?auto_22964 ?auto_22957 ) ) ( HOIST-AT ?auto_22968 ?auto_22964 ) ( AVAILABLE ?auto_22968 ) ( SURFACE-AT ?auto_22952 ?auto_22964 ) ( ON ?auto_22952 ?auto_22961 ) ( CLEAR ?auto_22952 ) ( not ( = ?auto_22951 ?auto_22952 ) ) ( not ( = ?auto_22951 ?auto_22961 ) ) ( not ( = ?auto_22952 ?auto_22961 ) ) ( not ( = ?auto_22959 ?auto_22968 ) ) ( IS-CRATE ?auto_22951 ) ( not ( = ?auto_22971 ?auto_22957 ) ) ( HOIST-AT ?auto_22967 ?auto_22971 ) ( AVAILABLE ?auto_22967 ) ( SURFACE-AT ?auto_22951 ?auto_22971 ) ( ON ?auto_22951 ?auto_22965 ) ( CLEAR ?auto_22951 ) ( not ( = ?auto_22950 ?auto_22951 ) ) ( not ( = ?auto_22950 ?auto_22965 ) ) ( not ( = ?auto_22951 ?auto_22965 ) ) ( not ( = ?auto_22959 ?auto_22967 ) ) ( SURFACE-AT ?auto_22949 ?auto_22957 ) ( CLEAR ?auto_22949 ) ( IS-CRATE ?auto_22950 ) ( AVAILABLE ?auto_22959 ) ( not ( = ?auto_22969 ?auto_22957 ) ) ( HOIST-AT ?auto_22972 ?auto_22969 ) ( AVAILABLE ?auto_22972 ) ( SURFACE-AT ?auto_22950 ?auto_22969 ) ( ON ?auto_22950 ?auto_22970 ) ( CLEAR ?auto_22950 ) ( TRUCK-AT ?auto_22956 ?auto_22957 ) ( not ( = ?auto_22949 ?auto_22950 ) ) ( not ( = ?auto_22949 ?auto_22970 ) ) ( not ( = ?auto_22950 ?auto_22970 ) ) ( not ( = ?auto_22959 ?auto_22972 ) ) ( not ( = ?auto_22949 ?auto_22951 ) ) ( not ( = ?auto_22949 ?auto_22965 ) ) ( not ( = ?auto_22951 ?auto_22970 ) ) ( not ( = ?auto_22971 ?auto_22969 ) ) ( not ( = ?auto_22967 ?auto_22972 ) ) ( not ( = ?auto_22965 ?auto_22970 ) ) ( not ( = ?auto_22949 ?auto_22952 ) ) ( not ( = ?auto_22949 ?auto_22961 ) ) ( not ( = ?auto_22950 ?auto_22952 ) ) ( not ( = ?auto_22950 ?auto_22961 ) ) ( not ( = ?auto_22952 ?auto_22965 ) ) ( not ( = ?auto_22952 ?auto_22970 ) ) ( not ( = ?auto_22964 ?auto_22971 ) ) ( not ( = ?auto_22964 ?auto_22969 ) ) ( not ( = ?auto_22968 ?auto_22967 ) ) ( not ( = ?auto_22968 ?auto_22972 ) ) ( not ( = ?auto_22961 ?auto_22965 ) ) ( not ( = ?auto_22961 ?auto_22970 ) ) ( not ( = ?auto_22949 ?auto_22953 ) ) ( not ( = ?auto_22949 ?auto_22966 ) ) ( not ( = ?auto_22950 ?auto_22953 ) ) ( not ( = ?auto_22950 ?auto_22966 ) ) ( not ( = ?auto_22951 ?auto_22953 ) ) ( not ( = ?auto_22951 ?auto_22966 ) ) ( not ( = ?auto_22953 ?auto_22961 ) ) ( not ( = ?auto_22953 ?auto_22965 ) ) ( not ( = ?auto_22953 ?auto_22970 ) ) ( not ( = ?auto_22962 ?auto_22964 ) ) ( not ( = ?auto_22962 ?auto_22971 ) ) ( not ( = ?auto_22962 ?auto_22969 ) ) ( not ( = ?auto_22963 ?auto_22968 ) ) ( not ( = ?auto_22963 ?auto_22967 ) ) ( not ( = ?auto_22963 ?auto_22972 ) ) ( not ( = ?auto_22966 ?auto_22961 ) ) ( not ( = ?auto_22966 ?auto_22965 ) ) ( not ( = ?auto_22966 ?auto_22970 ) ) ( not ( = ?auto_22949 ?auto_22954 ) ) ( not ( = ?auto_22949 ?auto_22960 ) ) ( not ( = ?auto_22950 ?auto_22954 ) ) ( not ( = ?auto_22950 ?auto_22960 ) ) ( not ( = ?auto_22951 ?auto_22954 ) ) ( not ( = ?auto_22951 ?auto_22960 ) ) ( not ( = ?auto_22952 ?auto_22954 ) ) ( not ( = ?auto_22952 ?auto_22960 ) ) ( not ( = ?auto_22954 ?auto_22966 ) ) ( not ( = ?auto_22954 ?auto_22961 ) ) ( not ( = ?auto_22954 ?auto_22965 ) ) ( not ( = ?auto_22954 ?auto_22970 ) ) ( not ( = ?auto_22955 ?auto_22962 ) ) ( not ( = ?auto_22955 ?auto_22964 ) ) ( not ( = ?auto_22955 ?auto_22971 ) ) ( not ( = ?auto_22955 ?auto_22969 ) ) ( not ( = ?auto_22958 ?auto_22963 ) ) ( not ( = ?auto_22958 ?auto_22968 ) ) ( not ( = ?auto_22958 ?auto_22967 ) ) ( not ( = ?auto_22958 ?auto_22972 ) ) ( not ( = ?auto_22960 ?auto_22966 ) ) ( not ( = ?auto_22960 ?auto_22961 ) ) ( not ( = ?auto_22960 ?auto_22965 ) ) ( not ( = ?auto_22960 ?auto_22970 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_22949 ?auto_22950 ?auto_22951 ?auto_22952 ?auto_22953 )
      ( MAKE-1CRATE ?auto_22953 ?auto_22954 )
      ( MAKE-5CRATE-VERIFY ?auto_22949 ?auto_22950 ?auto_22951 ?auto_22952 ?auto_22953 ?auto_22954 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_22990 - SURFACE
      ?auto_22991 - SURFACE
      ?auto_22992 - SURFACE
      ?auto_22993 - SURFACE
      ?auto_22994 - SURFACE
      ?auto_22995 - SURFACE
      ?auto_22996 - SURFACE
    )
    :vars
    (
      ?auto_23002 - HOIST
      ?auto_23001 - PLACE
      ?auto_22998 - PLACE
      ?auto_22997 - HOIST
      ?auto_22999 - SURFACE
      ?auto_23008 - PLACE
      ?auto_23009 - HOIST
      ?auto_23010 - SURFACE
      ?auto_23005 - PLACE
      ?auto_23006 - HOIST
      ?auto_23014 - SURFACE
      ?auto_23004 - PLACE
      ?auto_23012 - HOIST
      ?auto_23015 - SURFACE
      ?auto_23007 - PLACE
      ?auto_23013 - HOIST
      ?auto_23011 - SURFACE
      ?auto_23003 - PLACE
      ?auto_23017 - HOIST
      ?auto_23016 - SURFACE
      ?auto_23000 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23002 ?auto_23001 ) ( IS-CRATE ?auto_22996 ) ( not ( = ?auto_22998 ?auto_23001 ) ) ( HOIST-AT ?auto_22997 ?auto_22998 ) ( AVAILABLE ?auto_22997 ) ( SURFACE-AT ?auto_22996 ?auto_22998 ) ( ON ?auto_22996 ?auto_22999 ) ( CLEAR ?auto_22996 ) ( not ( = ?auto_22995 ?auto_22996 ) ) ( not ( = ?auto_22995 ?auto_22999 ) ) ( not ( = ?auto_22996 ?auto_22999 ) ) ( not ( = ?auto_23002 ?auto_22997 ) ) ( IS-CRATE ?auto_22995 ) ( not ( = ?auto_23008 ?auto_23001 ) ) ( HOIST-AT ?auto_23009 ?auto_23008 ) ( AVAILABLE ?auto_23009 ) ( SURFACE-AT ?auto_22995 ?auto_23008 ) ( ON ?auto_22995 ?auto_23010 ) ( CLEAR ?auto_22995 ) ( not ( = ?auto_22994 ?auto_22995 ) ) ( not ( = ?auto_22994 ?auto_23010 ) ) ( not ( = ?auto_22995 ?auto_23010 ) ) ( not ( = ?auto_23002 ?auto_23009 ) ) ( IS-CRATE ?auto_22994 ) ( not ( = ?auto_23005 ?auto_23001 ) ) ( HOIST-AT ?auto_23006 ?auto_23005 ) ( AVAILABLE ?auto_23006 ) ( SURFACE-AT ?auto_22994 ?auto_23005 ) ( ON ?auto_22994 ?auto_23014 ) ( CLEAR ?auto_22994 ) ( not ( = ?auto_22993 ?auto_22994 ) ) ( not ( = ?auto_22993 ?auto_23014 ) ) ( not ( = ?auto_22994 ?auto_23014 ) ) ( not ( = ?auto_23002 ?auto_23006 ) ) ( IS-CRATE ?auto_22993 ) ( not ( = ?auto_23004 ?auto_23001 ) ) ( HOIST-AT ?auto_23012 ?auto_23004 ) ( AVAILABLE ?auto_23012 ) ( SURFACE-AT ?auto_22993 ?auto_23004 ) ( ON ?auto_22993 ?auto_23015 ) ( CLEAR ?auto_22993 ) ( not ( = ?auto_22992 ?auto_22993 ) ) ( not ( = ?auto_22992 ?auto_23015 ) ) ( not ( = ?auto_22993 ?auto_23015 ) ) ( not ( = ?auto_23002 ?auto_23012 ) ) ( IS-CRATE ?auto_22992 ) ( not ( = ?auto_23007 ?auto_23001 ) ) ( HOIST-AT ?auto_23013 ?auto_23007 ) ( AVAILABLE ?auto_23013 ) ( SURFACE-AT ?auto_22992 ?auto_23007 ) ( ON ?auto_22992 ?auto_23011 ) ( CLEAR ?auto_22992 ) ( not ( = ?auto_22991 ?auto_22992 ) ) ( not ( = ?auto_22991 ?auto_23011 ) ) ( not ( = ?auto_22992 ?auto_23011 ) ) ( not ( = ?auto_23002 ?auto_23013 ) ) ( SURFACE-AT ?auto_22990 ?auto_23001 ) ( CLEAR ?auto_22990 ) ( IS-CRATE ?auto_22991 ) ( AVAILABLE ?auto_23002 ) ( not ( = ?auto_23003 ?auto_23001 ) ) ( HOIST-AT ?auto_23017 ?auto_23003 ) ( AVAILABLE ?auto_23017 ) ( SURFACE-AT ?auto_22991 ?auto_23003 ) ( ON ?auto_22991 ?auto_23016 ) ( CLEAR ?auto_22991 ) ( TRUCK-AT ?auto_23000 ?auto_23001 ) ( not ( = ?auto_22990 ?auto_22991 ) ) ( not ( = ?auto_22990 ?auto_23016 ) ) ( not ( = ?auto_22991 ?auto_23016 ) ) ( not ( = ?auto_23002 ?auto_23017 ) ) ( not ( = ?auto_22990 ?auto_22992 ) ) ( not ( = ?auto_22990 ?auto_23011 ) ) ( not ( = ?auto_22992 ?auto_23016 ) ) ( not ( = ?auto_23007 ?auto_23003 ) ) ( not ( = ?auto_23013 ?auto_23017 ) ) ( not ( = ?auto_23011 ?auto_23016 ) ) ( not ( = ?auto_22990 ?auto_22993 ) ) ( not ( = ?auto_22990 ?auto_23015 ) ) ( not ( = ?auto_22991 ?auto_22993 ) ) ( not ( = ?auto_22991 ?auto_23015 ) ) ( not ( = ?auto_22993 ?auto_23011 ) ) ( not ( = ?auto_22993 ?auto_23016 ) ) ( not ( = ?auto_23004 ?auto_23007 ) ) ( not ( = ?auto_23004 ?auto_23003 ) ) ( not ( = ?auto_23012 ?auto_23013 ) ) ( not ( = ?auto_23012 ?auto_23017 ) ) ( not ( = ?auto_23015 ?auto_23011 ) ) ( not ( = ?auto_23015 ?auto_23016 ) ) ( not ( = ?auto_22990 ?auto_22994 ) ) ( not ( = ?auto_22990 ?auto_23014 ) ) ( not ( = ?auto_22991 ?auto_22994 ) ) ( not ( = ?auto_22991 ?auto_23014 ) ) ( not ( = ?auto_22992 ?auto_22994 ) ) ( not ( = ?auto_22992 ?auto_23014 ) ) ( not ( = ?auto_22994 ?auto_23015 ) ) ( not ( = ?auto_22994 ?auto_23011 ) ) ( not ( = ?auto_22994 ?auto_23016 ) ) ( not ( = ?auto_23005 ?auto_23004 ) ) ( not ( = ?auto_23005 ?auto_23007 ) ) ( not ( = ?auto_23005 ?auto_23003 ) ) ( not ( = ?auto_23006 ?auto_23012 ) ) ( not ( = ?auto_23006 ?auto_23013 ) ) ( not ( = ?auto_23006 ?auto_23017 ) ) ( not ( = ?auto_23014 ?auto_23015 ) ) ( not ( = ?auto_23014 ?auto_23011 ) ) ( not ( = ?auto_23014 ?auto_23016 ) ) ( not ( = ?auto_22990 ?auto_22995 ) ) ( not ( = ?auto_22990 ?auto_23010 ) ) ( not ( = ?auto_22991 ?auto_22995 ) ) ( not ( = ?auto_22991 ?auto_23010 ) ) ( not ( = ?auto_22992 ?auto_22995 ) ) ( not ( = ?auto_22992 ?auto_23010 ) ) ( not ( = ?auto_22993 ?auto_22995 ) ) ( not ( = ?auto_22993 ?auto_23010 ) ) ( not ( = ?auto_22995 ?auto_23014 ) ) ( not ( = ?auto_22995 ?auto_23015 ) ) ( not ( = ?auto_22995 ?auto_23011 ) ) ( not ( = ?auto_22995 ?auto_23016 ) ) ( not ( = ?auto_23008 ?auto_23005 ) ) ( not ( = ?auto_23008 ?auto_23004 ) ) ( not ( = ?auto_23008 ?auto_23007 ) ) ( not ( = ?auto_23008 ?auto_23003 ) ) ( not ( = ?auto_23009 ?auto_23006 ) ) ( not ( = ?auto_23009 ?auto_23012 ) ) ( not ( = ?auto_23009 ?auto_23013 ) ) ( not ( = ?auto_23009 ?auto_23017 ) ) ( not ( = ?auto_23010 ?auto_23014 ) ) ( not ( = ?auto_23010 ?auto_23015 ) ) ( not ( = ?auto_23010 ?auto_23011 ) ) ( not ( = ?auto_23010 ?auto_23016 ) ) ( not ( = ?auto_22990 ?auto_22996 ) ) ( not ( = ?auto_22990 ?auto_22999 ) ) ( not ( = ?auto_22991 ?auto_22996 ) ) ( not ( = ?auto_22991 ?auto_22999 ) ) ( not ( = ?auto_22992 ?auto_22996 ) ) ( not ( = ?auto_22992 ?auto_22999 ) ) ( not ( = ?auto_22993 ?auto_22996 ) ) ( not ( = ?auto_22993 ?auto_22999 ) ) ( not ( = ?auto_22994 ?auto_22996 ) ) ( not ( = ?auto_22994 ?auto_22999 ) ) ( not ( = ?auto_22996 ?auto_23010 ) ) ( not ( = ?auto_22996 ?auto_23014 ) ) ( not ( = ?auto_22996 ?auto_23015 ) ) ( not ( = ?auto_22996 ?auto_23011 ) ) ( not ( = ?auto_22996 ?auto_23016 ) ) ( not ( = ?auto_22998 ?auto_23008 ) ) ( not ( = ?auto_22998 ?auto_23005 ) ) ( not ( = ?auto_22998 ?auto_23004 ) ) ( not ( = ?auto_22998 ?auto_23007 ) ) ( not ( = ?auto_22998 ?auto_23003 ) ) ( not ( = ?auto_22997 ?auto_23009 ) ) ( not ( = ?auto_22997 ?auto_23006 ) ) ( not ( = ?auto_22997 ?auto_23012 ) ) ( not ( = ?auto_22997 ?auto_23013 ) ) ( not ( = ?auto_22997 ?auto_23017 ) ) ( not ( = ?auto_22999 ?auto_23010 ) ) ( not ( = ?auto_22999 ?auto_23014 ) ) ( not ( = ?auto_22999 ?auto_23015 ) ) ( not ( = ?auto_22999 ?auto_23011 ) ) ( not ( = ?auto_22999 ?auto_23016 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_22990 ?auto_22991 ?auto_22992 ?auto_22993 ?auto_22994 ?auto_22995 )
      ( MAKE-1CRATE ?auto_22995 ?auto_22996 )
      ( MAKE-6CRATE-VERIFY ?auto_22990 ?auto_22991 ?auto_22992 ?auto_22993 ?auto_22994 ?auto_22995 ?auto_22996 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_23036 - SURFACE
      ?auto_23037 - SURFACE
      ?auto_23038 - SURFACE
      ?auto_23039 - SURFACE
      ?auto_23040 - SURFACE
      ?auto_23041 - SURFACE
      ?auto_23042 - SURFACE
      ?auto_23043 - SURFACE
    )
    :vars
    (
      ?auto_23045 - HOIST
      ?auto_23046 - PLACE
      ?auto_23047 - PLACE
      ?auto_23044 - HOIST
      ?auto_23049 - SURFACE
      ?auto_23058 - PLACE
      ?auto_23050 - HOIST
      ?auto_23063 - SURFACE
      ?auto_23056 - PLACE
      ?auto_23055 - HOIST
      ?auto_23054 - SURFACE
      ?auto_23059 - PLACE
      ?auto_23061 - HOIST
      ?auto_23051 - SURFACE
      ?auto_23062 - PLACE
      ?auto_23057 - HOIST
      ?auto_23052 - SURFACE
      ?auto_23064 - PLACE
      ?auto_23066 - HOIST
      ?auto_23065 - SURFACE
      ?auto_23067 - PLACE
      ?auto_23060 - HOIST
      ?auto_23053 - SURFACE
      ?auto_23048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23045 ?auto_23046 ) ( IS-CRATE ?auto_23043 ) ( not ( = ?auto_23047 ?auto_23046 ) ) ( HOIST-AT ?auto_23044 ?auto_23047 ) ( AVAILABLE ?auto_23044 ) ( SURFACE-AT ?auto_23043 ?auto_23047 ) ( ON ?auto_23043 ?auto_23049 ) ( CLEAR ?auto_23043 ) ( not ( = ?auto_23042 ?auto_23043 ) ) ( not ( = ?auto_23042 ?auto_23049 ) ) ( not ( = ?auto_23043 ?auto_23049 ) ) ( not ( = ?auto_23045 ?auto_23044 ) ) ( IS-CRATE ?auto_23042 ) ( not ( = ?auto_23058 ?auto_23046 ) ) ( HOIST-AT ?auto_23050 ?auto_23058 ) ( AVAILABLE ?auto_23050 ) ( SURFACE-AT ?auto_23042 ?auto_23058 ) ( ON ?auto_23042 ?auto_23063 ) ( CLEAR ?auto_23042 ) ( not ( = ?auto_23041 ?auto_23042 ) ) ( not ( = ?auto_23041 ?auto_23063 ) ) ( not ( = ?auto_23042 ?auto_23063 ) ) ( not ( = ?auto_23045 ?auto_23050 ) ) ( IS-CRATE ?auto_23041 ) ( not ( = ?auto_23056 ?auto_23046 ) ) ( HOIST-AT ?auto_23055 ?auto_23056 ) ( AVAILABLE ?auto_23055 ) ( SURFACE-AT ?auto_23041 ?auto_23056 ) ( ON ?auto_23041 ?auto_23054 ) ( CLEAR ?auto_23041 ) ( not ( = ?auto_23040 ?auto_23041 ) ) ( not ( = ?auto_23040 ?auto_23054 ) ) ( not ( = ?auto_23041 ?auto_23054 ) ) ( not ( = ?auto_23045 ?auto_23055 ) ) ( IS-CRATE ?auto_23040 ) ( not ( = ?auto_23059 ?auto_23046 ) ) ( HOIST-AT ?auto_23061 ?auto_23059 ) ( AVAILABLE ?auto_23061 ) ( SURFACE-AT ?auto_23040 ?auto_23059 ) ( ON ?auto_23040 ?auto_23051 ) ( CLEAR ?auto_23040 ) ( not ( = ?auto_23039 ?auto_23040 ) ) ( not ( = ?auto_23039 ?auto_23051 ) ) ( not ( = ?auto_23040 ?auto_23051 ) ) ( not ( = ?auto_23045 ?auto_23061 ) ) ( IS-CRATE ?auto_23039 ) ( not ( = ?auto_23062 ?auto_23046 ) ) ( HOIST-AT ?auto_23057 ?auto_23062 ) ( AVAILABLE ?auto_23057 ) ( SURFACE-AT ?auto_23039 ?auto_23062 ) ( ON ?auto_23039 ?auto_23052 ) ( CLEAR ?auto_23039 ) ( not ( = ?auto_23038 ?auto_23039 ) ) ( not ( = ?auto_23038 ?auto_23052 ) ) ( not ( = ?auto_23039 ?auto_23052 ) ) ( not ( = ?auto_23045 ?auto_23057 ) ) ( IS-CRATE ?auto_23038 ) ( not ( = ?auto_23064 ?auto_23046 ) ) ( HOIST-AT ?auto_23066 ?auto_23064 ) ( AVAILABLE ?auto_23066 ) ( SURFACE-AT ?auto_23038 ?auto_23064 ) ( ON ?auto_23038 ?auto_23065 ) ( CLEAR ?auto_23038 ) ( not ( = ?auto_23037 ?auto_23038 ) ) ( not ( = ?auto_23037 ?auto_23065 ) ) ( not ( = ?auto_23038 ?auto_23065 ) ) ( not ( = ?auto_23045 ?auto_23066 ) ) ( SURFACE-AT ?auto_23036 ?auto_23046 ) ( CLEAR ?auto_23036 ) ( IS-CRATE ?auto_23037 ) ( AVAILABLE ?auto_23045 ) ( not ( = ?auto_23067 ?auto_23046 ) ) ( HOIST-AT ?auto_23060 ?auto_23067 ) ( AVAILABLE ?auto_23060 ) ( SURFACE-AT ?auto_23037 ?auto_23067 ) ( ON ?auto_23037 ?auto_23053 ) ( CLEAR ?auto_23037 ) ( TRUCK-AT ?auto_23048 ?auto_23046 ) ( not ( = ?auto_23036 ?auto_23037 ) ) ( not ( = ?auto_23036 ?auto_23053 ) ) ( not ( = ?auto_23037 ?auto_23053 ) ) ( not ( = ?auto_23045 ?auto_23060 ) ) ( not ( = ?auto_23036 ?auto_23038 ) ) ( not ( = ?auto_23036 ?auto_23065 ) ) ( not ( = ?auto_23038 ?auto_23053 ) ) ( not ( = ?auto_23064 ?auto_23067 ) ) ( not ( = ?auto_23066 ?auto_23060 ) ) ( not ( = ?auto_23065 ?auto_23053 ) ) ( not ( = ?auto_23036 ?auto_23039 ) ) ( not ( = ?auto_23036 ?auto_23052 ) ) ( not ( = ?auto_23037 ?auto_23039 ) ) ( not ( = ?auto_23037 ?auto_23052 ) ) ( not ( = ?auto_23039 ?auto_23065 ) ) ( not ( = ?auto_23039 ?auto_23053 ) ) ( not ( = ?auto_23062 ?auto_23064 ) ) ( not ( = ?auto_23062 ?auto_23067 ) ) ( not ( = ?auto_23057 ?auto_23066 ) ) ( not ( = ?auto_23057 ?auto_23060 ) ) ( not ( = ?auto_23052 ?auto_23065 ) ) ( not ( = ?auto_23052 ?auto_23053 ) ) ( not ( = ?auto_23036 ?auto_23040 ) ) ( not ( = ?auto_23036 ?auto_23051 ) ) ( not ( = ?auto_23037 ?auto_23040 ) ) ( not ( = ?auto_23037 ?auto_23051 ) ) ( not ( = ?auto_23038 ?auto_23040 ) ) ( not ( = ?auto_23038 ?auto_23051 ) ) ( not ( = ?auto_23040 ?auto_23052 ) ) ( not ( = ?auto_23040 ?auto_23065 ) ) ( not ( = ?auto_23040 ?auto_23053 ) ) ( not ( = ?auto_23059 ?auto_23062 ) ) ( not ( = ?auto_23059 ?auto_23064 ) ) ( not ( = ?auto_23059 ?auto_23067 ) ) ( not ( = ?auto_23061 ?auto_23057 ) ) ( not ( = ?auto_23061 ?auto_23066 ) ) ( not ( = ?auto_23061 ?auto_23060 ) ) ( not ( = ?auto_23051 ?auto_23052 ) ) ( not ( = ?auto_23051 ?auto_23065 ) ) ( not ( = ?auto_23051 ?auto_23053 ) ) ( not ( = ?auto_23036 ?auto_23041 ) ) ( not ( = ?auto_23036 ?auto_23054 ) ) ( not ( = ?auto_23037 ?auto_23041 ) ) ( not ( = ?auto_23037 ?auto_23054 ) ) ( not ( = ?auto_23038 ?auto_23041 ) ) ( not ( = ?auto_23038 ?auto_23054 ) ) ( not ( = ?auto_23039 ?auto_23041 ) ) ( not ( = ?auto_23039 ?auto_23054 ) ) ( not ( = ?auto_23041 ?auto_23051 ) ) ( not ( = ?auto_23041 ?auto_23052 ) ) ( not ( = ?auto_23041 ?auto_23065 ) ) ( not ( = ?auto_23041 ?auto_23053 ) ) ( not ( = ?auto_23056 ?auto_23059 ) ) ( not ( = ?auto_23056 ?auto_23062 ) ) ( not ( = ?auto_23056 ?auto_23064 ) ) ( not ( = ?auto_23056 ?auto_23067 ) ) ( not ( = ?auto_23055 ?auto_23061 ) ) ( not ( = ?auto_23055 ?auto_23057 ) ) ( not ( = ?auto_23055 ?auto_23066 ) ) ( not ( = ?auto_23055 ?auto_23060 ) ) ( not ( = ?auto_23054 ?auto_23051 ) ) ( not ( = ?auto_23054 ?auto_23052 ) ) ( not ( = ?auto_23054 ?auto_23065 ) ) ( not ( = ?auto_23054 ?auto_23053 ) ) ( not ( = ?auto_23036 ?auto_23042 ) ) ( not ( = ?auto_23036 ?auto_23063 ) ) ( not ( = ?auto_23037 ?auto_23042 ) ) ( not ( = ?auto_23037 ?auto_23063 ) ) ( not ( = ?auto_23038 ?auto_23042 ) ) ( not ( = ?auto_23038 ?auto_23063 ) ) ( not ( = ?auto_23039 ?auto_23042 ) ) ( not ( = ?auto_23039 ?auto_23063 ) ) ( not ( = ?auto_23040 ?auto_23042 ) ) ( not ( = ?auto_23040 ?auto_23063 ) ) ( not ( = ?auto_23042 ?auto_23054 ) ) ( not ( = ?auto_23042 ?auto_23051 ) ) ( not ( = ?auto_23042 ?auto_23052 ) ) ( not ( = ?auto_23042 ?auto_23065 ) ) ( not ( = ?auto_23042 ?auto_23053 ) ) ( not ( = ?auto_23058 ?auto_23056 ) ) ( not ( = ?auto_23058 ?auto_23059 ) ) ( not ( = ?auto_23058 ?auto_23062 ) ) ( not ( = ?auto_23058 ?auto_23064 ) ) ( not ( = ?auto_23058 ?auto_23067 ) ) ( not ( = ?auto_23050 ?auto_23055 ) ) ( not ( = ?auto_23050 ?auto_23061 ) ) ( not ( = ?auto_23050 ?auto_23057 ) ) ( not ( = ?auto_23050 ?auto_23066 ) ) ( not ( = ?auto_23050 ?auto_23060 ) ) ( not ( = ?auto_23063 ?auto_23054 ) ) ( not ( = ?auto_23063 ?auto_23051 ) ) ( not ( = ?auto_23063 ?auto_23052 ) ) ( not ( = ?auto_23063 ?auto_23065 ) ) ( not ( = ?auto_23063 ?auto_23053 ) ) ( not ( = ?auto_23036 ?auto_23043 ) ) ( not ( = ?auto_23036 ?auto_23049 ) ) ( not ( = ?auto_23037 ?auto_23043 ) ) ( not ( = ?auto_23037 ?auto_23049 ) ) ( not ( = ?auto_23038 ?auto_23043 ) ) ( not ( = ?auto_23038 ?auto_23049 ) ) ( not ( = ?auto_23039 ?auto_23043 ) ) ( not ( = ?auto_23039 ?auto_23049 ) ) ( not ( = ?auto_23040 ?auto_23043 ) ) ( not ( = ?auto_23040 ?auto_23049 ) ) ( not ( = ?auto_23041 ?auto_23043 ) ) ( not ( = ?auto_23041 ?auto_23049 ) ) ( not ( = ?auto_23043 ?auto_23063 ) ) ( not ( = ?auto_23043 ?auto_23054 ) ) ( not ( = ?auto_23043 ?auto_23051 ) ) ( not ( = ?auto_23043 ?auto_23052 ) ) ( not ( = ?auto_23043 ?auto_23065 ) ) ( not ( = ?auto_23043 ?auto_23053 ) ) ( not ( = ?auto_23047 ?auto_23058 ) ) ( not ( = ?auto_23047 ?auto_23056 ) ) ( not ( = ?auto_23047 ?auto_23059 ) ) ( not ( = ?auto_23047 ?auto_23062 ) ) ( not ( = ?auto_23047 ?auto_23064 ) ) ( not ( = ?auto_23047 ?auto_23067 ) ) ( not ( = ?auto_23044 ?auto_23050 ) ) ( not ( = ?auto_23044 ?auto_23055 ) ) ( not ( = ?auto_23044 ?auto_23061 ) ) ( not ( = ?auto_23044 ?auto_23057 ) ) ( not ( = ?auto_23044 ?auto_23066 ) ) ( not ( = ?auto_23044 ?auto_23060 ) ) ( not ( = ?auto_23049 ?auto_23063 ) ) ( not ( = ?auto_23049 ?auto_23054 ) ) ( not ( = ?auto_23049 ?auto_23051 ) ) ( not ( = ?auto_23049 ?auto_23052 ) ) ( not ( = ?auto_23049 ?auto_23065 ) ) ( not ( = ?auto_23049 ?auto_23053 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_23036 ?auto_23037 ?auto_23038 ?auto_23039 ?auto_23040 ?auto_23041 ?auto_23042 )
      ( MAKE-1CRATE ?auto_23042 ?auto_23043 )
      ( MAKE-7CRATE-VERIFY ?auto_23036 ?auto_23037 ?auto_23038 ?auto_23039 ?auto_23040 ?auto_23041 ?auto_23042 ?auto_23043 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_23087 - SURFACE
      ?auto_23088 - SURFACE
      ?auto_23089 - SURFACE
      ?auto_23090 - SURFACE
      ?auto_23091 - SURFACE
      ?auto_23092 - SURFACE
      ?auto_23093 - SURFACE
      ?auto_23094 - SURFACE
      ?auto_23095 - SURFACE
    )
    :vars
    (
      ?auto_23097 - HOIST
      ?auto_23101 - PLACE
      ?auto_23098 - PLACE
      ?auto_23100 - HOIST
      ?auto_23099 - SURFACE
      ?auto_23121 - PLACE
      ?auto_23122 - HOIST
      ?auto_23108 - SURFACE
      ?auto_23112 - PLACE
      ?auto_23110 - HOIST
      ?auto_23103 - SURFACE
      ?auto_23118 - PLACE
      ?auto_23119 - HOIST
      ?auto_23120 - SURFACE
      ?auto_23105 - PLACE
      ?auto_23104 - HOIST
      ?auto_23115 - SURFACE
      ?auto_23116 - PLACE
      ?auto_23117 - HOIST
      ?auto_23102 - SURFACE
      ?auto_23107 - PLACE
      ?auto_23109 - HOIST
      ?auto_23111 - SURFACE
      ?auto_23106 - PLACE
      ?auto_23113 - HOIST
      ?auto_23114 - SURFACE
      ?auto_23096 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23097 ?auto_23101 ) ( IS-CRATE ?auto_23095 ) ( not ( = ?auto_23098 ?auto_23101 ) ) ( HOIST-AT ?auto_23100 ?auto_23098 ) ( AVAILABLE ?auto_23100 ) ( SURFACE-AT ?auto_23095 ?auto_23098 ) ( ON ?auto_23095 ?auto_23099 ) ( CLEAR ?auto_23095 ) ( not ( = ?auto_23094 ?auto_23095 ) ) ( not ( = ?auto_23094 ?auto_23099 ) ) ( not ( = ?auto_23095 ?auto_23099 ) ) ( not ( = ?auto_23097 ?auto_23100 ) ) ( IS-CRATE ?auto_23094 ) ( not ( = ?auto_23121 ?auto_23101 ) ) ( HOIST-AT ?auto_23122 ?auto_23121 ) ( AVAILABLE ?auto_23122 ) ( SURFACE-AT ?auto_23094 ?auto_23121 ) ( ON ?auto_23094 ?auto_23108 ) ( CLEAR ?auto_23094 ) ( not ( = ?auto_23093 ?auto_23094 ) ) ( not ( = ?auto_23093 ?auto_23108 ) ) ( not ( = ?auto_23094 ?auto_23108 ) ) ( not ( = ?auto_23097 ?auto_23122 ) ) ( IS-CRATE ?auto_23093 ) ( not ( = ?auto_23112 ?auto_23101 ) ) ( HOIST-AT ?auto_23110 ?auto_23112 ) ( AVAILABLE ?auto_23110 ) ( SURFACE-AT ?auto_23093 ?auto_23112 ) ( ON ?auto_23093 ?auto_23103 ) ( CLEAR ?auto_23093 ) ( not ( = ?auto_23092 ?auto_23093 ) ) ( not ( = ?auto_23092 ?auto_23103 ) ) ( not ( = ?auto_23093 ?auto_23103 ) ) ( not ( = ?auto_23097 ?auto_23110 ) ) ( IS-CRATE ?auto_23092 ) ( not ( = ?auto_23118 ?auto_23101 ) ) ( HOIST-AT ?auto_23119 ?auto_23118 ) ( AVAILABLE ?auto_23119 ) ( SURFACE-AT ?auto_23092 ?auto_23118 ) ( ON ?auto_23092 ?auto_23120 ) ( CLEAR ?auto_23092 ) ( not ( = ?auto_23091 ?auto_23092 ) ) ( not ( = ?auto_23091 ?auto_23120 ) ) ( not ( = ?auto_23092 ?auto_23120 ) ) ( not ( = ?auto_23097 ?auto_23119 ) ) ( IS-CRATE ?auto_23091 ) ( not ( = ?auto_23105 ?auto_23101 ) ) ( HOIST-AT ?auto_23104 ?auto_23105 ) ( AVAILABLE ?auto_23104 ) ( SURFACE-AT ?auto_23091 ?auto_23105 ) ( ON ?auto_23091 ?auto_23115 ) ( CLEAR ?auto_23091 ) ( not ( = ?auto_23090 ?auto_23091 ) ) ( not ( = ?auto_23090 ?auto_23115 ) ) ( not ( = ?auto_23091 ?auto_23115 ) ) ( not ( = ?auto_23097 ?auto_23104 ) ) ( IS-CRATE ?auto_23090 ) ( not ( = ?auto_23116 ?auto_23101 ) ) ( HOIST-AT ?auto_23117 ?auto_23116 ) ( AVAILABLE ?auto_23117 ) ( SURFACE-AT ?auto_23090 ?auto_23116 ) ( ON ?auto_23090 ?auto_23102 ) ( CLEAR ?auto_23090 ) ( not ( = ?auto_23089 ?auto_23090 ) ) ( not ( = ?auto_23089 ?auto_23102 ) ) ( not ( = ?auto_23090 ?auto_23102 ) ) ( not ( = ?auto_23097 ?auto_23117 ) ) ( IS-CRATE ?auto_23089 ) ( not ( = ?auto_23107 ?auto_23101 ) ) ( HOIST-AT ?auto_23109 ?auto_23107 ) ( AVAILABLE ?auto_23109 ) ( SURFACE-AT ?auto_23089 ?auto_23107 ) ( ON ?auto_23089 ?auto_23111 ) ( CLEAR ?auto_23089 ) ( not ( = ?auto_23088 ?auto_23089 ) ) ( not ( = ?auto_23088 ?auto_23111 ) ) ( not ( = ?auto_23089 ?auto_23111 ) ) ( not ( = ?auto_23097 ?auto_23109 ) ) ( SURFACE-AT ?auto_23087 ?auto_23101 ) ( CLEAR ?auto_23087 ) ( IS-CRATE ?auto_23088 ) ( AVAILABLE ?auto_23097 ) ( not ( = ?auto_23106 ?auto_23101 ) ) ( HOIST-AT ?auto_23113 ?auto_23106 ) ( AVAILABLE ?auto_23113 ) ( SURFACE-AT ?auto_23088 ?auto_23106 ) ( ON ?auto_23088 ?auto_23114 ) ( CLEAR ?auto_23088 ) ( TRUCK-AT ?auto_23096 ?auto_23101 ) ( not ( = ?auto_23087 ?auto_23088 ) ) ( not ( = ?auto_23087 ?auto_23114 ) ) ( not ( = ?auto_23088 ?auto_23114 ) ) ( not ( = ?auto_23097 ?auto_23113 ) ) ( not ( = ?auto_23087 ?auto_23089 ) ) ( not ( = ?auto_23087 ?auto_23111 ) ) ( not ( = ?auto_23089 ?auto_23114 ) ) ( not ( = ?auto_23107 ?auto_23106 ) ) ( not ( = ?auto_23109 ?auto_23113 ) ) ( not ( = ?auto_23111 ?auto_23114 ) ) ( not ( = ?auto_23087 ?auto_23090 ) ) ( not ( = ?auto_23087 ?auto_23102 ) ) ( not ( = ?auto_23088 ?auto_23090 ) ) ( not ( = ?auto_23088 ?auto_23102 ) ) ( not ( = ?auto_23090 ?auto_23111 ) ) ( not ( = ?auto_23090 ?auto_23114 ) ) ( not ( = ?auto_23116 ?auto_23107 ) ) ( not ( = ?auto_23116 ?auto_23106 ) ) ( not ( = ?auto_23117 ?auto_23109 ) ) ( not ( = ?auto_23117 ?auto_23113 ) ) ( not ( = ?auto_23102 ?auto_23111 ) ) ( not ( = ?auto_23102 ?auto_23114 ) ) ( not ( = ?auto_23087 ?auto_23091 ) ) ( not ( = ?auto_23087 ?auto_23115 ) ) ( not ( = ?auto_23088 ?auto_23091 ) ) ( not ( = ?auto_23088 ?auto_23115 ) ) ( not ( = ?auto_23089 ?auto_23091 ) ) ( not ( = ?auto_23089 ?auto_23115 ) ) ( not ( = ?auto_23091 ?auto_23102 ) ) ( not ( = ?auto_23091 ?auto_23111 ) ) ( not ( = ?auto_23091 ?auto_23114 ) ) ( not ( = ?auto_23105 ?auto_23116 ) ) ( not ( = ?auto_23105 ?auto_23107 ) ) ( not ( = ?auto_23105 ?auto_23106 ) ) ( not ( = ?auto_23104 ?auto_23117 ) ) ( not ( = ?auto_23104 ?auto_23109 ) ) ( not ( = ?auto_23104 ?auto_23113 ) ) ( not ( = ?auto_23115 ?auto_23102 ) ) ( not ( = ?auto_23115 ?auto_23111 ) ) ( not ( = ?auto_23115 ?auto_23114 ) ) ( not ( = ?auto_23087 ?auto_23092 ) ) ( not ( = ?auto_23087 ?auto_23120 ) ) ( not ( = ?auto_23088 ?auto_23092 ) ) ( not ( = ?auto_23088 ?auto_23120 ) ) ( not ( = ?auto_23089 ?auto_23092 ) ) ( not ( = ?auto_23089 ?auto_23120 ) ) ( not ( = ?auto_23090 ?auto_23092 ) ) ( not ( = ?auto_23090 ?auto_23120 ) ) ( not ( = ?auto_23092 ?auto_23115 ) ) ( not ( = ?auto_23092 ?auto_23102 ) ) ( not ( = ?auto_23092 ?auto_23111 ) ) ( not ( = ?auto_23092 ?auto_23114 ) ) ( not ( = ?auto_23118 ?auto_23105 ) ) ( not ( = ?auto_23118 ?auto_23116 ) ) ( not ( = ?auto_23118 ?auto_23107 ) ) ( not ( = ?auto_23118 ?auto_23106 ) ) ( not ( = ?auto_23119 ?auto_23104 ) ) ( not ( = ?auto_23119 ?auto_23117 ) ) ( not ( = ?auto_23119 ?auto_23109 ) ) ( not ( = ?auto_23119 ?auto_23113 ) ) ( not ( = ?auto_23120 ?auto_23115 ) ) ( not ( = ?auto_23120 ?auto_23102 ) ) ( not ( = ?auto_23120 ?auto_23111 ) ) ( not ( = ?auto_23120 ?auto_23114 ) ) ( not ( = ?auto_23087 ?auto_23093 ) ) ( not ( = ?auto_23087 ?auto_23103 ) ) ( not ( = ?auto_23088 ?auto_23093 ) ) ( not ( = ?auto_23088 ?auto_23103 ) ) ( not ( = ?auto_23089 ?auto_23093 ) ) ( not ( = ?auto_23089 ?auto_23103 ) ) ( not ( = ?auto_23090 ?auto_23093 ) ) ( not ( = ?auto_23090 ?auto_23103 ) ) ( not ( = ?auto_23091 ?auto_23093 ) ) ( not ( = ?auto_23091 ?auto_23103 ) ) ( not ( = ?auto_23093 ?auto_23120 ) ) ( not ( = ?auto_23093 ?auto_23115 ) ) ( not ( = ?auto_23093 ?auto_23102 ) ) ( not ( = ?auto_23093 ?auto_23111 ) ) ( not ( = ?auto_23093 ?auto_23114 ) ) ( not ( = ?auto_23112 ?auto_23118 ) ) ( not ( = ?auto_23112 ?auto_23105 ) ) ( not ( = ?auto_23112 ?auto_23116 ) ) ( not ( = ?auto_23112 ?auto_23107 ) ) ( not ( = ?auto_23112 ?auto_23106 ) ) ( not ( = ?auto_23110 ?auto_23119 ) ) ( not ( = ?auto_23110 ?auto_23104 ) ) ( not ( = ?auto_23110 ?auto_23117 ) ) ( not ( = ?auto_23110 ?auto_23109 ) ) ( not ( = ?auto_23110 ?auto_23113 ) ) ( not ( = ?auto_23103 ?auto_23120 ) ) ( not ( = ?auto_23103 ?auto_23115 ) ) ( not ( = ?auto_23103 ?auto_23102 ) ) ( not ( = ?auto_23103 ?auto_23111 ) ) ( not ( = ?auto_23103 ?auto_23114 ) ) ( not ( = ?auto_23087 ?auto_23094 ) ) ( not ( = ?auto_23087 ?auto_23108 ) ) ( not ( = ?auto_23088 ?auto_23094 ) ) ( not ( = ?auto_23088 ?auto_23108 ) ) ( not ( = ?auto_23089 ?auto_23094 ) ) ( not ( = ?auto_23089 ?auto_23108 ) ) ( not ( = ?auto_23090 ?auto_23094 ) ) ( not ( = ?auto_23090 ?auto_23108 ) ) ( not ( = ?auto_23091 ?auto_23094 ) ) ( not ( = ?auto_23091 ?auto_23108 ) ) ( not ( = ?auto_23092 ?auto_23094 ) ) ( not ( = ?auto_23092 ?auto_23108 ) ) ( not ( = ?auto_23094 ?auto_23103 ) ) ( not ( = ?auto_23094 ?auto_23120 ) ) ( not ( = ?auto_23094 ?auto_23115 ) ) ( not ( = ?auto_23094 ?auto_23102 ) ) ( not ( = ?auto_23094 ?auto_23111 ) ) ( not ( = ?auto_23094 ?auto_23114 ) ) ( not ( = ?auto_23121 ?auto_23112 ) ) ( not ( = ?auto_23121 ?auto_23118 ) ) ( not ( = ?auto_23121 ?auto_23105 ) ) ( not ( = ?auto_23121 ?auto_23116 ) ) ( not ( = ?auto_23121 ?auto_23107 ) ) ( not ( = ?auto_23121 ?auto_23106 ) ) ( not ( = ?auto_23122 ?auto_23110 ) ) ( not ( = ?auto_23122 ?auto_23119 ) ) ( not ( = ?auto_23122 ?auto_23104 ) ) ( not ( = ?auto_23122 ?auto_23117 ) ) ( not ( = ?auto_23122 ?auto_23109 ) ) ( not ( = ?auto_23122 ?auto_23113 ) ) ( not ( = ?auto_23108 ?auto_23103 ) ) ( not ( = ?auto_23108 ?auto_23120 ) ) ( not ( = ?auto_23108 ?auto_23115 ) ) ( not ( = ?auto_23108 ?auto_23102 ) ) ( not ( = ?auto_23108 ?auto_23111 ) ) ( not ( = ?auto_23108 ?auto_23114 ) ) ( not ( = ?auto_23087 ?auto_23095 ) ) ( not ( = ?auto_23087 ?auto_23099 ) ) ( not ( = ?auto_23088 ?auto_23095 ) ) ( not ( = ?auto_23088 ?auto_23099 ) ) ( not ( = ?auto_23089 ?auto_23095 ) ) ( not ( = ?auto_23089 ?auto_23099 ) ) ( not ( = ?auto_23090 ?auto_23095 ) ) ( not ( = ?auto_23090 ?auto_23099 ) ) ( not ( = ?auto_23091 ?auto_23095 ) ) ( not ( = ?auto_23091 ?auto_23099 ) ) ( not ( = ?auto_23092 ?auto_23095 ) ) ( not ( = ?auto_23092 ?auto_23099 ) ) ( not ( = ?auto_23093 ?auto_23095 ) ) ( not ( = ?auto_23093 ?auto_23099 ) ) ( not ( = ?auto_23095 ?auto_23108 ) ) ( not ( = ?auto_23095 ?auto_23103 ) ) ( not ( = ?auto_23095 ?auto_23120 ) ) ( not ( = ?auto_23095 ?auto_23115 ) ) ( not ( = ?auto_23095 ?auto_23102 ) ) ( not ( = ?auto_23095 ?auto_23111 ) ) ( not ( = ?auto_23095 ?auto_23114 ) ) ( not ( = ?auto_23098 ?auto_23121 ) ) ( not ( = ?auto_23098 ?auto_23112 ) ) ( not ( = ?auto_23098 ?auto_23118 ) ) ( not ( = ?auto_23098 ?auto_23105 ) ) ( not ( = ?auto_23098 ?auto_23116 ) ) ( not ( = ?auto_23098 ?auto_23107 ) ) ( not ( = ?auto_23098 ?auto_23106 ) ) ( not ( = ?auto_23100 ?auto_23122 ) ) ( not ( = ?auto_23100 ?auto_23110 ) ) ( not ( = ?auto_23100 ?auto_23119 ) ) ( not ( = ?auto_23100 ?auto_23104 ) ) ( not ( = ?auto_23100 ?auto_23117 ) ) ( not ( = ?auto_23100 ?auto_23109 ) ) ( not ( = ?auto_23100 ?auto_23113 ) ) ( not ( = ?auto_23099 ?auto_23108 ) ) ( not ( = ?auto_23099 ?auto_23103 ) ) ( not ( = ?auto_23099 ?auto_23120 ) ) ( not ( = ?auto_23099 ?auto_23115 ) ) ( not ( = ?auto_23099 ?auto_23102 ) ) ( not ( = ?auto_23099 ?auto_23111 ) ) ( not ( = ?auto_23099 ?auto_23114 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_23087 ?auto_23088 ?auto_23089 ?auto_23090 ?auto_23091 ?auto_23092 ?auto_23093 ?auto_23094 )
      ( MAKE-1CRATE ?auto_23094 ?auto_23095 )
      ( MAKE-8CRATE-VERIFY ?auto_23087 ?auto_23088 ?auto_23089 ?auto_23090 ?auto_23091 ?auto_23092 ?auto_23093 ?auto_23094 ?auto_23095 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_23143 - SURFACE
      ?auto_23144 - SURFACE
      ?auto_23145 - SURFACE
      ?auto_23146 - SURFACE
      ?auto_23147 - SURFACE
      ?auto_23148 - SURFACE
      ?auto_23149 - SURFACE
      ?auto_23150 - SURFACE
      ?auto_23151 - SURFACE
      ?auto_23152 - SURFACE
    )
    :vars
    (
      ?auto_23156 - HOIST
      ?auto_23155 - PLACE
      ?auto_23153 - PLACE
      ?auto_23157 - HOIST
      ?auto_23158 - SURFACE
      ?auto_23161 - PLACE
      ?auto_23159 - HOIST
      ?auto_23164 - SURFACE
      ?auto_23169 - PLACE
      ?auto_23168 - HOIST
      ?auto_23178 - SURFACE
      ?auto_23172 - PLACE
      ?auto_23171 - HOIST
      ?auto_23160 - SURFACE
      ?auto_23162 - PLACE
      ?auto_23165 - HOIST
      ?auto_23167 - SURFACE
      ?auto_23182 - PLACE
      ?auto_23166 - HOIST
      ?auto_23176 - SURFACE
      ?auto_23181 - PLACE
      ?auto_23170 - HOIST
      ?auto_23163 - SURFACE
      ?auto_23179 - PLACE
      ?auto_23177 - HOIST
      ?auto_23173 - SURFACE
      ?auto_23180 - PLACE
      ?auto_23174 - HOIST
      ?auto_23175 - SURFACE
      ?auto_23154 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23156 ?auto_23155 ) ( IS-CRATE ?auto_23152 ) ( not ( = ?auto_23153 ?auto_23155 ) ) ( HOIST-AT ?auto_23157 ?auto_23153 ) ( AVAILABLE ?auto_23157 ) ( SURFACE-AT ?auto_23152 ?auto_23153 ) ( ON ?auto_23152 ?auto_23158 ) ( CLEAR ?auto_23152 ) ( not ( = ?auto_23151 ?auto_23152 ) ) ( not ( = ?auto_23151 ?auto_23158 ) ) ( not ( = ?auto_23152 ?auto_23158 ) ) ( not ( = ?auto_23156 ?auto_23157 ) ) ( IS-CRATE ?auto_23151 ) ( not ( = ?auto_23161 ?auto_23155 ) ) ( HOIST-AT ?auto_23159 ?auto_23161 ) ( AVAILABLE ?auto_23159 ) ( SURFACE-AT ?auto_23151 ?auto_23161 ) ( ON ?auto_23151 ?auto_23164 ) ( CLEAR ?auto_23151 ) ( not ( = ?auto_23150 ?auto_23151 ) ) ( not ( = ?auto_23150 ?auto_23164 ) ) ( not ( = ?auto_23151 ?auto_23164 ) ) ( not ( = ?auto_23156 ?auto_23159 ) ) ( IS-CRATE ?auto_23150 ) ( not ( = ?auto_23169 ?auto_23155 ) ) ( HOIST-AT ?auto_23168 ?auto_23169 ) ( AVAILABLE ?auto_23168 ) ( SURFACE-AT ?auto_23150 ?auto_23169 ) ( ON ?auto_23150 ?auto_23178 ) ( CLEAR ?auto_23150 ) ( not ( = ?auto_23149 ?auto_23150 ) ) ( not ( = ?auto_23149 ?auto_23178 ) ) ( not ( = ?auto_23150 ?auto_23178 ) ) ( not ( = ?auto_23156 ?auto_23168 ) ) ( IS-CRATE ?auto_23149 ) ( not ( = ?auto_23172 ?auto_23155 ) ) ( HOIST-AT ?auto_23171 ?auto_23172 ) ( AVAILABLE ?auto_23171 ) ( SURFACE-AT ?auto_23149 ?auto_23172 ) ( ON ?auto_23149 ?auto_23160 ) ( CLEAR ?auto_23149 ) ( not ( = ?auto_23148 ?auto_23149 ) ) ( not ( = ?auto_23148 ?auto_23160 ) ) ( not ( = ?auto_23149 ?auto_23160 ) ) ( not ( = ?auto_23156 ?auto_23171 ) ) ( IS-CRATE ?auto_23148 ) ( not ( = ?auto_23162 ?auto_23155 ) ) ( HOIST-AT ?auto_23165 ?auto_23162 ) ( AVAILABLE ?auto_23165 ) ( SURFACE-AT ?auto_23148 ?auto_23162 ) ( ON ?auto_23148 ?auto_23167 ) ( CLEAR ?auto_23148 ) ( not ( = ?auto_23147 ?auto_23148 ) ) ( not ( = ?auto_23147 ?auto_23167 ) ) ( not ( = ?auto_23148 ?auto_23167 ) ) ( not ( = ?auto_23156 ?auto_23165 ) ) ( IS-CRATE ?auto_23147 ) ( not ( = ?auto_23182 ?auto_23155 ) ) ( HOIST-AT ?auto_23166 ?auto_23182 ) ( AVAILABLE ?auto_23166 ) ( SURFACE-AT ?auto_23147 ?auto_23182 ) ( ON ?auto_23147 ?auto_23176 ) ( CLEAR ?auto_23147 ) ( not ( = ?auto_23146 ?auto_23147 ) ) ( not ( = ?auto_23146 ?auto_23176 ) ) ( not ( = ?auto_23147 ?auto_23176 ) ) ( not ( = ?auto_23156 ?auto_23166 ) ) ( IS-CRATE ?auto_23146 ) ( not ( = ?auto_23181 ?auto_23155 ) ) ( HOIST-AT ?auto_23170 ?auto_23181 ) ( AVAILABLE ?auto_23170 ) ( SURFACE-AT ?auto_23146 ?auto_23181 ) ( ON ?auto_23146 ?auto_23163 ) ( CLEAR ?auto_23146 ) ( not ( = ?auto_23145 ?auto_23146 ) ) ( not ( = ?auto_23145 ?auto_23163 ) ) ( not ( = ?auto_23146 ?auto_23163 ) ) ( not ( = ?auto_23156 ?auto_23170 ) ) ( IS-CRATE ?auto_23145 ) ( not ( = ?auto_23179 ?auto_23155 ) ) ( HOIST-AT ?auto_23177 ?auto_23179 ) ( AVAILABLE ?auto_23177 ) ( SURFACE-AT ?auto_23145 ?auto_23179 ) ( ON ?auto_23145 ?auto_23173 ) ( CLEAR ?auto_23145 ) ( not ( = ?auto_23144 ?auto_23145 ) ) ( not ( = ?auto_23144 ?auto_23173 ) ) ( not ( = ?auto_23145 ?auto_23173 ) ) ( not ( = ?auto_23156 ?auto_23177 ) ) ( SURFACE-AT ?auto_23143 ?auto_23155 ) ( CLEAR ?auto_23143 ) ( IS-CRATE ?auto_23144 ) ( AVAILABLE ?auto_23156 ) ( not ( = ?auto_23180 ?auto_23155 ) ) ( HOIST-AT ?auto_23174 ?auto_23180 ) ( AVAILABLE ?auto_23174 ) ( SURFACE-AT ?auto_23144 ?auto_23180 ) ( ON ?auto_23144 ?auto_23175 ) ( CLEAR ?auto_23144 ) ( TRUCK-AT ?auto_23154 ?auto_23155 ) ( not ( = ?auto_23143 ?auto_23144 ) ) ( not ( = ?auto_23143 ?auto_23175 ) ) ( not ( = ?auto_23144 ?auto_23175 ) ) ( not ( = ?auto_23156 ?auto_23174 ) ) ( not ( = ?auto_23143 ?auto_23145 ) ) ( not ( = ?auto_23143 ?auto_23173 ) ) ( not ( = ?auto_23145 ?auto_23175 ) ) ( not ( = ?auto_23179 ?auto_23180 ) ) ( not ( = ?auto_23177 ?auto_23174 ) ) ( not ( = ?auto_23173 ?auto_23175 ) ) ( not ( = ?auto_23143 ?auto_23146 ) ) ( not ( = ?auto_23143 ?auto_23163 ) ) ( not ( = ?auto_23144 ?auto_23146 ) ) ( not ( = ?auto_23144 ?auto_23163 ) ) ( not ( = ?auto_23146 ?auto_23173 ) ) ( not ( = ?auto_23146 ?auto_23175 ) ) ( not ( = ?auto_23181 ?auto_23179 ) ) ( not ( = ?auto_23181 ?auto_23180 ) ) ( not ( = ?auto_23170 ?auto_23177 ) ) ( not ( = ?auto_23170 ?auto_23174 ) ) ( not ( = ?auto_23163 ?auto_23173 ) ) ( not ( = ?auto_23163 ?auto_23175 ) ) ( not ( = ?auto_23143 ?auto_23147 ) ) ( not ( = ?auto_23143 ?auto_23176 ) ) ( not ( = ?auto_23144 ?auto_23147 ) ) ( not ( = ?auto_23144 ?auto_23176 ) ) ( not ( = ?auto_23145 ?auto_23147 ) ) ( not ( = ?auto_23145 ?auto_23176 ) ) ( not ( = ?auto_23147 ?auto_23163 ) ) ( not ( = ?auto_23147 ?auto_23173 ) ) ( not ( = ?auto_23147 ?auto_23175 ) ) ( not ( = ?auto_23182 ?auto_23181 ) ) ( not ( = ?auto_23182 ?auto_23179 ) ) ( not ( = ?auto_23182 ?auto_23180 ) ) ( not ( = ?auto_23166 ?auto_23170 ) ) ( not ( = ?auto_23166 ?auto_23177 ) ) ( not ( = ?auto_23166 ?auto_23174 ) ) ( not ( = ?auto_23176 ?auto_23163 ) ) ( not ( = ?auto_23176 ?auto_23173 ) ) ( not ( = ?auto_23176 ?auto_23175 ) ) ( not ( = ?auto_23143 ?auto_23148 ) ) ( not ( = ?auto_23143 ?auto_23167 ) ) ( not ( = ?auto_23144 ?auto_23148 ) ) ( not ( = ?auto_23144 ?auto_23167 ) ) ( not ( = ?auto_23145 ?auto_23148 ) ) ( not ( = ?auto_23145 ?auto_23167 ) ) ( not ( = ?auto_23146 ?auto_23148 ) ) ( not ( = ?auto_23146 ?auto_23167 ) ) ( not ( = ?auto_23148 ?auto_23176 ) ) ( not ( = ?auto_23148 ?auto_23163 ) ) ( not ( = ?auto_23148 ?auto_23173 ) ) ( not ( = ?auto_23148 ?auto_23175 ) ) ( not ( = ?auto_23162 ?auto_23182 ) ) ( not ( = ?auto_23162 ?auto_23181 ) ) ( not ( = ?auto_23162 ?auto_23179 ) ) ( not ( = ?auto_23162 ?auto_23180 ) ) ( not ( = ?auto_23165 ?auto_23166 ) ) ( not ( = ?auto_23165 ?auto_23170 ) ) ( not ( = ?auto_23165 ?auto_23177 ) ) ( not ( = ?auto_23165 ?auto_23174 ) ) ( not ( = ?auto_23167 ?auto_23176 ) ) ( not ( = ?auto_23167 ?auto_23163 ) ) ( not ( = ?auto_23167 ?auto_23173 ) ) ( not ( = ?auto_23167 ?auto_23175 ) ) ( not ( = ?auto_23143 ?auto_23149 ) ) ( not ( = ?auto_23143 ?auto_23160 ) ) ( not ( = ?auto_23144 ?auto_23149 ) ) ( not ( = ?auto_23144 ?auto_23160 ) ) ( not ( = ?auto_23145 ?auto_23149 ) ) ( not ( = ?auto_23145 ?auto_23160 ) ) ( not ( = ?auto_23146 ?auto_23149 ) ) ( not ( = ?auto_23146 ?auto_23160 ) ) ( not ( = ?auto_23147 ?auto_23149 ) ) ( not ( = ?auto_23147 ?auto_23160 ) ) ( not ( = ?auto_23149 ?auto_23167 ) ) ( not ( = ?auto_23149 ?auto_23176 ) ) ( not ( = ?auto_23149 ?auto_23163 ) ) ( not ( = ?auto_23149 ?auto_23173 ) ) ( not ( = ?auto_23149 ?auto_23175 ) ) ( not ( = ?auto_23172 ?auto_23162 ) ) ( not ( = ?auto_23172 ?auto_23182 ) ) ( not ( = ?auto_23172 ?auto_23181 ) ) ( not ( = ?auto_23172 ?auto_23179 ) ) ( not ( = ?auto_23172 ?auto_23180 ) ) ( not ( = ?auto_23171 ?auto_23165 ) ) ( not ( = ?auto_23171 ?auto_23166 ) ) ( not ( = ?auto_23171 ?auto_23170 ) ) ( not ( = ?auto_23171 ?auto_23177 ) ) ( not ( = ?auto_23171 ?auto_23174 ) ) ( not ( = ?auto_23160 ?auto_23167 ) ) ( not ( = ?auto_23160 ?auto_23176 ) ) ( not ( = ?auto_23160 ?auto_23163 ) ) ( not ( = ?auto_23160 ?auto_23173 ) ) ( not ( = ?auto_23160 ?auto_23175 ) ) ( not ( = ?auto_23143 ?auto_23150 ) ) ( not ( = ?auto_23143 ?auto_23178 ) ) ( not ( = ?auto_23144 ?auto_23150 ) ) ( not ( = ?auto_23144 ?auto_23178 ) ) ( not ( = ?auto_23145 ?auto_23150 ) ) ( not ( = ?auto_23145 ?auto_23178 ) ) ( not ( = ?auto_23146 ?auto_23150 ) ) ( not ( = ?auto_23146 ?auto_23178 ) ) ( not ( = ?auto_23147 ?auto_23150 ) ) ( not ( = ?auto_23147 ?auto_23178 ) ) ( not ( = ?auto_23148 ?auto_23150 ) ) ( not ( = ?auto_23148 ?auto_23178 ) ) ( not ( = ?auto_23150 ?auto_23160 ) ) ( not ( = ?auto_23150 ?auto_23167 ) ) ( not ( = ?auto_23150 ?auto_23176 ) ) ( not ( = ?auto_23150 ?auto_23163 ) ) ( not ( = ?auto_23150 ?auto_23173 ) ) ( not ( = ?auto_23150 ?auto_23175 ) ) ( not ( = ?auto_23169 ?auto_23172 ) ) ( not ( = ?auto_23169 ?auto_23162 ) ) ( not ( = ?auto_23169 ?auto_23182 ) ) ( not ( = ?auto_23169 ?auto_23181 ) ) ( not ( = ?auto_23169 ?auto_23179 ) ) ( not ( = ?auto_23169 ?auto_23180 ) ) ( not ( = ?auto_23168 ?auto_23171 ) ) ( not ( = ?auto_23168 ?auto_23165 ) ) ( not ( = ?auto_23168 ?auto_23166 ) ) ( not ( = ?auto_23168 ?auto_23170 ) ) ( not ( = ?auto_23168 ?auto_23177 ) ) ( not ( = ?auto_23168 ?auto_23174 ) ) ( not ( = ?auto_23178 ?auto_23160 ) ) ( not ( = ?auto_23178 ?auto_23167 ) ) ( not ( = ?auto_23178 ?auto_23176 ) ) ( not ( = ?auto_23178 ?auto_23163 ) ) ( not ( = ?auto_23178 ?auto_23173 ) ) ( not ( = ?auto_23178 ?auto_23175 ) ) ( not ( = ?auto_23143 ?auto_23151 ) ) ( not ( = ?auto_23143 ?auto_23164 ) ) ( not ( = ?auto_23144 ?auto_23151 ) ) ( not ( = ?auto_23144 ?auto_23164 ) ) ( not ( = ?auto_23145 ?auto_23151 ) ) ( not ( = ?auto_23145 ?auto_23164 ) ) ( not ( = ?auto_23146 ?auto_23151 ) ) ( not ( = ?auto_23146 ?auto_23164 ) ) ( not ( = ?auto_23147 ?auto_23151 ) ) ( not ( = ?auto_23147 ?auto_23164 ) ) ( not ( = ?auto_23148 ?auto_23151 ) ) ( not ( = ?auto_23148 ?auto_23164 ) ) ( not ( = ?auto_23149 ?auto_23151 ) ) ( not ( = ?auto_23149 ?auto_23164 ) ) ( not ( = ?auto_23151 ?auto_23178 ) ) ( not ( = ?auto_23151 ?auto_23160 ) ) ( not ( = ?auto_23151 ?auto_23167 ) ) ( not ( = ?auto_23151 ?auto_23176 ) ) ( not ( = ?auto_23151 ?auto_23163 ) ) ( not ( = ?auto_23151 ?auto_23173 ) ) ( not ( = ?auto_23151 ?auto_23175 ) ) ( not ( = ?auto_23161 ?auto_23169 ) ) ( not ( = ?auto_23161 ?auto_23172 ) ) ( not ( = ?auto_23161 ?auto_23162 ) ) ( not ( = ?auto_23161 ?auto_23182 ) ) ( not ( = ?auto_23161 ?auto_23181 ) ) ( not ( = ?auto_23161 ?auto_23179 ) ) ( not ( = ?auto_23161 ?auto_23180 ) ) ( not ( = ?auto_23159 ?auto_23168 ) ) ( not ( = ?auto_23159 ?auto_23171 ) ) ( not ( = ?auto_23159 ?auto_23165 ) ) ( not ( = ?auto_23159 ?auto_23166 ) ) ( not ( = ?auto_23159 ?auto_23170 ) ) ( not ( = ?auto_23159 ?auto_23177 ) ) ( not ( = ?auto_23159 ?auto_23174 ) ) ( not ( = ?auto_23164 ?auto_23178 ) ) ( not ( = ?auto_23164 ?auto_23160 ) ) ( not ( = ?auto_23164 ?auto_23167 ) ) ( not ( = ?auto_23164 ?auto_23176 ) ) ( not ( = ?auto_23164 ?auto_23163 ) ) ( not ( = ?auto_23164 ?auto_23173 ) ) ( not ( = ?auto_23164 ?auto_23175 ) ) ( not ( = ?auto_23143 ?auto_23152 ) ) ( not ( = ?auto_23143 ?auto_23158 ) ) ( not ( = ?auto_23144 ?auto_23152 ) ) ( not ( = ?auto_23144 ?auto_23158 ) ) ( not ( = ?auto_23145 ?auto_23152 ) ) ( not ( = ?auto_23145 ?auto_23158 ) ) ( not ( = ?auto_23146 ?auto_23152 ) ) ( not ( = ?auto_23146 ?auto_23158 ) ) ( not ( = ?auto_23147 ?auto_23152 ) ) ( not ( = ?auto_23147 ?auto_23158 ) ) ( not ( = ?auto_23148 ?auto_23152 ) ) ( not ( = ?auto_23148 ?auto_23158 ) ) ( not ( = ?auto_23149 ?auto_23152 ) ) ( not ( = ?auto_23149 ?auto_23158 ) ) ( not ( = ?auto_23150 ?auto_23152 ) ) ( not ( = ?auto_23150 ?auto_23158 ) ) ( not ( = ?auto_23152 ?auto_23164 ) ) ( not ( = ?auto_23152 ?auto_23178 ) ) ( not ( = ?auto_23152 ?auto_23160 ) ) ( not ( = ?auto_23152 ?auto_23167 ) ) ( not ( = ?auto_23152 ?auto_23176 ) ) ( not ( = ?auto_23152 ?auto_23163 ) ) ( not ( = ?auto_23152 ?auto_23173 ) ) ( not ( = ?auto_23152 ?auto_23175 ) ) ( not ( = ?auto_23153 ?auto_23161 ) ) ( not ( = ?auto_23153 ?auto_23169 ) ) ( not ( = ?auto_23153 ?auto_23172 ) ) ( not ( = ?auto_23153 ?auto_23162 ) ) ( not ( = ?auto_23153 ?auto_23182 ) ) ( not ( = ?auto_23153 ?auto_23181 ) ) ( not ( = ?auto_23153 ?auto_23179 ) ) ( not ( = ?auto_23153 ?auto_23180 ) ) ( not ( = ?auto_23157 ?auto_23159 ) ) ( not ( = ?auto_23157 ?auto_23168 ) ) ( not ( = ?auto_23157 ?auto_23171 ) ) ( not ( = ?auto_23157 ?auto_23165 ) ) ( not ( = ?auto_23157 ?auto_23166 ) ) ( not ( = ?auto_23157 ?auto_23170 ) ) ( not ( = ?auto_23157 ?auto_23177 ) ) ( not ( = ?auto_23157 ?auto_23174 ) ) ( not ( = ?auto_23158 ?auto_23164 ) ) ( not ( = ?auto_23158 ?auto_23178 ) ) ( not ( = ?auto_23158 ?auto_23160 ) ) ( not ( = ?auto_23158 ?auto_23167 ) ) ( not ( = ?auto_23158 ?auto_23176 ) ) ( not ( = ?auto_23158 ?auto_23163 ) ) ( not ( = ?auto_23158 ?auto_23173 ) ) ( not ( = ?auto_23158 ?auto_23175 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_23143 ?auto_23144 ?auto_23145 ?auto_23146 ?auto_23147 ?auto_23148 ?auto_23149 ?auto_23150 ?auto_23151 )
      ( MAKE-1CRATE ?auto_23151 ?auto_23152 )
      ( MAKE-9CRATE-VERIFY ?auto_23143 ?auto_23144 ?auto_23145 ?auto_23146 ?auto_23147 ?auto_23148 ?auto_23149 ?auto_23150 ?auto_23151 ?auto_23152 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_23204 - SURFACE
      ?auto_23205 - SURFACE
      ?auto_23206 - SURFACE
      ?auto_23207 - SURFACE
      ?auto_23208 - SURFACE
      ?auto_23209 - SURFACE
      ?auto_23210 - SURFACE
      ?auto_23211 - SURFACE
      ?auto_23212 - SURFACE
      ?auto_23213 - SURFACE
      ?auto_23214 - SURFACE
    )
    :vars
    (
      ?auto_23219 - HOIST
      ?auto_23217 - PLACE
      ?auto_23216 - PLACE
      ?auto_23220 - HOIST
      ?auto_23218 - SURFACE
      ?auto_23226 - PLACE
      ?auto_23228 - HOIST
      ?auto_23231 - SURFACE
      ?auto_23243 - PLACE
      ?auto_23222 - HOIST
      ?auto_23236 - SURFACE
      ?auto_23242 - PLACE
      ?auto_23239 - HOIST
      ?auto_23241 - SURFACE
      ?auto_23235 - PLACE
      ?auto_23244 - HOIST
      ?auto_23245 - SURFACE
      ?auto_23234 - PLACE
      ?auto_23238 - HOIST
      ?auto_23221 - SURFACE
      ?auto_23237 - SURFACE
      ?auto_23230 - PLACE
      ?auto_23229 - HOIST
      ?auto_23233 - SURFACE
      ?auto_23227 - PLACE
      ?auto_23223 - HOIST
      ?auto_23232 - SURFACE
      ?auto_23225 - PLACE
      ?auto_23240 - HOIST
      ?auto_23224 - SURFACE
      ?auto_23215 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23219 ?auto_23217 ) ( IS-CRATE ?auto_23214 ) ( not ( = ?auto_23216 ?auto_23217 ) ) ( HOIST-AT ?auto_23220 ?auto_23216 ) ( SURFACE-AT ?auto_23214 ?auto_23216 ) ( ON ?auto_23214 ?auto_23218 ) ( CLEAR ?auto_23214 ) ( not ( = ?auto_23213 ?auto_23214 ) ) ( not ( = ?auto_23213 ?auto_23218 ) ) ( not ( = ?auto_23214 ?auto_23218 ) ) ( not ( = ?auto_23219 ?auto_23220 ) ) ( IS-CRATE ?auto_23213 ) ( not ( = ?auto_23226 ?auto_23217 ) ) ( HOIST-AT ?auto_23228 ?auto_23226 ) ( AVAILABLE ?auto_23228 ) ( SURFACE-AT ?auto_23213 ?auto_23226 ) ( ON ?auto_23213 ?auto_23231 ) ( CLEAR ?auto_23213 ) ( not ( = ?auto_23212 ?auto_23213 ) ) ( not ( = ?auto_23212 ?auto_23231 ) ) ( not ( = ?auto_23213 ?auto_23231 ) ) ( not ( = ?auto_23219 ?auto_23228 ) ) ( IS-CRATE ?auto_23212 ) ( not ( = ?auto_23243 ?auto_23217 ) ) ( HOIST-AT ?auto_23222 ?auto_23243 ) ( AVAILABLE ?auto_23222 ) ( SURFACE-AT ?auto_23212 ?auto_23243 ) ( ON ?auto_23212 ?auto_23236 ) ( CLEAR ?auto_23212 ) ( not ( = ?auto_23211 ?auto_23212 ) ) ( not ( = ?auto_23211 ?auto_23236 ) ) ( not ( = ?auto_23212 ?auto_23236 ) ) ( not ( = ?auto_23219 ?auto_23222 ) ) ( IS-CRATE ?auto_23211 ) ( not ( = ?auto_23242 ?auto_23217 ) ) ( HOIST-AT ?auto_23239 ?auto_23242 ) ( AVAILABLE ?auto_23239 ) ( SURFACE-AT ?auto_23211 ?auto_23242 ) ( ON ?auto_23211 ?auto_23241 ) ( CLEAR ?auto_23211 ) ( not ( = ?auto_23210 ?auto_23211 ) ) ( not ( = ?auto_23210 ?auto_23241 ) ) ( not ( = ?auto_23211 ?auto_23241 ) ) ( not ( = ?auto_23219 ?auto_23239 ) ) ( IS-CRATE ?auto_23210 ) ( not ( = ?auto_23235 ?auto_23217 ) ) ( HOIST-AT ?auto_23244 ?auto_23235 ) ( AVAILABLE ?auto_23244 ) ( SURFACE-AT ?auto_23210 ?auto_23235 ) ( ON ?auto_23210 ?auto_23245 ) ( CLEAR ?auto_23210 ) ( not ( = ?auto_23209 ?auto_23210 ) ) ( not ( = ?auto_23209 ?auto_23245 ) ) ( not ( = ?auto_23210 ?auto_23245 ) ) ( not ( = ?auto_23219 ?auto_23244 ) ) ( IS-CRATE ?auto_23209 ) ( not ( = ?auto_23234 ?auto_23217 ) ) ( HOIST-AT ?auto_23238 ?auto_23234 ) ( AVAILABLE ?auto_23238 ) ( SURFACE-AT ?auto_23209 ?auto_23234 ) ( ON ?auto_23209 ?auto_23221 ) ( CLEAR ?auto_23209 ) ( not ( = ?auto_23208 ?auto_23209 ) ) ( not ( = ?auto_23208 ?auto_23221 ) ) ( not ( = ?auto_23209 ?auto_23221 ) ) ( not ( = ?auto_23219 ?auto_23238 ) ) ( IS-CRATE ?auto_23208 ) ( AVAILABLE ?auto_23220 ) ( SURFACE-AT ?auto_23208 ?auto_23216 ) ( ON ?auto_23208 ?auto_23237 ) ( CLEAR ?auto_23208 ) ( not ( = ?auto_23207 ?auto_23208 ) ) ( not ( = ?auto_23207 ?auto_23237 ) ) ( not ( = ?auto_23208 ?auto_23237 ) ) ( IS-CRATE ?auto_23207 ) ( not ( = ?auto_23230 ?auto_23217 ) ) ( HOIST-AT ?auto_23229 ?auto_23230 ) ( AVAILABLE ?auto_23229 ) ( SURFACE-AT ?auto_23207 ?auto_23230 ) ( ON ?auto_23207 ?auto_23233 ) ( CLEAR ?auto_23207 ) ( not ( = ?auto_23206 ?auto_23207 ) ) ( not ( = ?auto_23206 ?auto_23233 ) ) ( not ( = ?auto_23207 ?auto_23233 ) ) ( not ( = ?auto_23219 ?auto_23229 ) ) ( IS-CRATE ?auto_23206 ) ( not ( = ?auto_23227 ?auto_23217 ) ) ( HOIST-AT ?auto_23223 ?auto_23227 ) ( AVAILABLE ?auto_23223 ) ( SURFACE-AT ?auto_23206 ?auto_23227 ) ( ON ?auto_23206 ?auto_23232 ) ( CLEAR ?auto_23206 ) ( not ( = ?auto_23205 ?auto_23206 ) ) ( not ( = ?auto_23205 ?auto_23232 ) ) ( not ( = ?auto_23206 ?auto_23232 ) ) ( not ( = ?auto_23219 ?auto_23223 ) ) ( SURFACE-AT ?auto_23204 ?auto_23217 ) ( CLEAR ?auto_23204 ) ( IS-CRATE ?auto_23205 ) ( AVAILABLE ?auto_23219 ) ( not ( = ?auto_23225 ?auto_23217 ) ) ( HOIST-AT ?auto_23240 ?auto_23225 ) ( AVAILABLE ?auto_23240 ) ( SURFACE-AT ?auto_23205 ?auto_23225 ) ( ON ?auto_23205 ?auto_23224 ) ( CLEAR ?auto_23205 ) ( TRUCK-AT ?auto_23215 ?auto_23217 ) ( not ( = ?auto_23204 ?auto_23205 ) ) ( not ( = ?auto_23204 ?auto_23224 ) ) ( not ( = ?auto_23205 ?auto_23224 ) ) ( not ( = ?auto_23219 ?auto_23240 ) ) ( not ( = ?auto_23204 ?auto_23206 ) ) ( not ( = ?auto_23204 ?auto_23232 ) ) ( not ( = ?auto_23206 ?auto_23224 ) ) ( not ( = ?auto_23227 ?auto_23225 ) ) ( not ( = ?auto_23223 ?auto_23240 ) ) ( not ( = ?auto_23232 ?auto_23224 ) ) ( not ( = ?auto_23204 ?auto_23207 ) ) ( not ( = ?auto_23204 ?auto_23233 ) ) ( not ( = ?auto_23205 ?auto_23207 ) ) ( not ( = ?auto_23205 ?auto_23233 ) ) ( not ( = ?auto_23207 ?auto_23232 ) ) ( not ( = ?auto_23207 ?auto_23224 ) ) ( not ( = ?auto_23230 ?auto_23227 ) ) ( not ( = ?auto_23230 ?auto_23225 ) ) ( not ( = ?auto_23229 ?auto_23223 ) ) ( not ( = ?auto_23229 ?auto_23240 ) ) ( not ( = ?auto_23233 ?auto_23232 ) ) ( not ( = ?auto_23233 ?auto_23224 ) ) ( not ( = ?auto_23204 ?auto_23208 ) ) ( not ( = ?auto_23204 ?auto_23237 ) ) ( not ( = ?auto_23205 ?auto_23208 ) ) ( not ( = ?auto_23205 ?auto_23237 ) ) ( not ( = ?auto_23206 ?auto_23208 ) ) ( not ( = ?auto_23206 ?auto_23237 ) ) ( not ( = ?auto_23208 ?auto_23233 ) ) ( not ( = ?auto_23208 ?auto_23232 ) ) ( not ( = ?auto_23208 ?auto_23224 ) ) ( not ( = ?auto_23216 ?auto_23230 ) ) ( not ( = ?auto_23216 ?auto_23227 ) ) ( not ( = ?auto_23216 ?auto_23225 ) ) ( not ( = ?auto_23220 ?auto_23229 ) ) ( not ( = ?auto_23220 ?auto_23223 ) ) ( not ( = ?auto_23220 ?auto_23240 ) ) ( not ( = ?auto_23237 ?auto_23233 ) ) ( not ( = ?auto_23237 ?auto_23232 ) ) ( not ( = ?auto_23237 ?auto_23224 ) ) ( not ( = ?auto_23204 ?auto_23209 ) ) ( not ( = ?auto_23204 ?auto_23221 ) ) ( not ( = ?auto_23205 ?auto_23209 ) ) ( not ( = ?auto_23205 ?auto_23221 ) ) ( not ( = ?auto_23206 ?auto_23209 ) ) ( not ( = ?auto_23206 ?auto_23221 ) ) ( not ( = ?auto_23207 ?auto_23209 ) ) ( not ( = ?auto_23207 ?auto_23221 ) ) ( not ( = ?auto_23209 ?auto_23237 ) ) ( not ( = ?auto_23209 ?auto_23233 ) ) ( not ( = ?auto_23209 ?auto_23232 ) ) ( not ( = ?auto_23209 ?auto_23224 ) ) ( not ( = ?auto_23234 ?auto_23216 ) ) ( not ( = ?auto_23234 ?auto_23230 ) ) ( not ( = ?auto_23234 ?auto_23227 ) ) ( not ( = ?auto_23234 ?auto_23225 ) ) ( not ( = ?auto_23238 ?auto_23220 ) ) ( not ( = ?auto_23238 ?auto_23229 ) ) ( not ( = ?auto_23238 ?auto_23223 ) ) ( not ( = ?auto_23238 ?auto_23240 ) ) ( not ( = ?auto_23221 ?auto_23237 ) ) ( not ( = ?auto_23221 ?auto_23233 ) ) ( not ( = ?auto_23221 ?auto_23232 ) ) ( not ( = ?auto_23221 ?auto_23224 ) ) ( not ( = ?auto_23204 ?auto_23210 ) ) ( not ( = ?auto_23204 ?auto_23245 ) ) ( not ( = ?auto_23205 ?auto_23210 ) ) ( not ( = ?auto_23205 ?auto_23245 ) ) ( not ( = ?auto_23206 ?auto_23210 ) ) ( not ( = ?auto_23206 ?auto_23245 ) ) ( not ( = ?auto_23207 ?auto_23210 ) ) ( not ( = ?auto_23207 ?auto_23245 ) ) ( not ( = ?auto_23208 ?auto_23210 ) ) ( not ( = ?auto_23208 ?auto_23245 ) ) ( not ( = ?auto_23210 ?auto_23221 ) ) ( not ( = ?auto_23210 ?auto_23237 ) ) ( not ( = ?auto_23210 ?auto_23233 ) ) ( not ( = ?auto_23210 ?auto_23232 ) ) ( not ( = ?auto_23210 ?auto_23224 ) ) ( not ( = ?auto_23235 ?auto_23234 ) ) ( not ( = ?auto_23235 ?auto_23216 ) ) ( not ( = ?auto_23235 ?auto_23230 ) ) ( not ( = ?auto_23235 ?auto_23227 ) ) ( not ( = ?auto_23235 ?auto_23225 ) ) ( not ( = ?auto_23244 ?auto_23238 ) ) ( not ( = ?auto_23244 ?auto_23220 ) ) ( not ( = ?auto_23244 ?auto_23229 ) ) ( not ( = ?auto_23244 ?auto_23223 ) ) ( not ( = ?auto_23244 ?auto_23240 ) ) ( not ( = ?auto_23245 ?auto_23221 ) ) ( not ( = ?auto_23245 ?auto_23237 ) ) ( not ( = ?auto_23245 ?auto_23233 ) ) ( not ( = ?auto_23245 ?auto_23232 ) ) ( not ( = ?auto_23245 ?auto_23224 ) ) ( not ( = ?auto_23204 ?auto_23211 ) ) ( not ( = ?auto_23204 ?auto_23241 ) ) ( not ( = ?auto_23205 ?auto_23211 ) ) ( not ( = ?auto_23205 ?auto_23241 ) ) ( not ( = ?auto_23206 ?auto_23211 ) ) ( not ( = ?auto_23206 ?auto_23241 ) ) ( not ( = ?auto_23207 ?auto_23211 ) ) ( not ( = ?auto_23207 ?auto_23241 ) ) ( not ( = ?auto_23208 ?auto_23211 ) ) ( not ( = ?auto_23208 ?auto_23241 ) ) ( not ( = ?auto_23209 ?auto_23211 ) ) ( not ( = ?auto_23209 ?auto_23241 ) ) ( not ( = ?auto_23211 ?auto_23245 ) ) ( not ( = ?auto_23211 ?auto_23221 ) ) ( not ( = ?auto_23211 ?auto_23237 ) ) ( not ( = ?auto_23211 ?auto_23233 ) ) ( not ( = ?auto_23211 ?auto_23232 ) ) ( not ( = ?auto_23211 ?auto_23224 ) ) ( not ( = ?auto_23242 ?auto_23235 ) ) ( not ( = ?auto_23242 ?auto_23234 ) ) ( not ( = ?auto_23242 ?auto_23216 ) ) ( not ( = ?auto_23242 ?auto_23230 ) ) ( not ( = ?auto_23242 ?auto_23227 ) ) ( not ( = ?auto_23242 ?auto_23225 ) ) ( not ( = ?auto_23239 ?auto_23244 ) ) ( not ( = ?auto_23239 ?auto_23238 ) ) ( not ( = ?auto_23239 ?auto_23220 ) ) ( not ( = ?auto_23239 ?auto_23229 ) ) ( not ( = ?auto_23239 ?auto_23223 ) ) ( not ( = ?auto_23239 ?auto_23240 ) ) ( not ( = ?auto_23241 ?auto_23245 ) ) ( not ( = ?auto_23241 ?auto_23221 ) ) ( not ( = ?auto_23241 ?auto_23237 ) ) ( not ( = ?auto_23241 ?auto_23233 ) ) ( not ( = ?auto_23241 ?auto_23232 ) ) ( not ( = ?auto_23241 ?auto_23224 ) ) ( not ( = ?auto_23204 ?auto_23212 ) ) ( not ( = ?auto_23204 ?auto_23236 ) ) ( not ( = ?auto_23205 ?auto_23212 ) ) ( not ( = ?auto_23205 ?auto_23236 ) ) ( not ( = ?auto_23206 ?auto_23212 ) ) ( not ( = ?auto_23206 ?auto_23236 ) ) ( not ( = ?auto_23207 ?auto_23212 ) ) ( not ( = ?auto_23207 ?auto_23236 ) ) ( not ( = ?auto_23208 ?auto_23212 ) ) ( not ( = ?auto_23208 ?auto_23236 ) ) ( not ( = ?auto_23209 ?auto_23212 ) ) ( not ( = ?auto_23209 ?auto_23236 ) ) ( not ( = ?auto_23210 ?auto_23212 ) ) ( not ( = ?auto_23210 ?auto_23236 ) ) ( not ( = ?auto_23212 ?auto_23241 ) ) ( not ( = ?auto_23212 ?auto_23245 ) ) ( not ( = ?auto_23212 ?auto_23221 ) ) ( not ( = ?auto_23212 ?auto_23237 ) ) ( not ( = ?auto_23212 ?auto_23233 ) ) ( not ( = ?auto_23212 ?auto_23232 ) ) ( not ( = ?auto_23212 ?auto_23224 ) ) ( not ( = ?auto_23243 ?auto_23242 ) ) ( not ( = ?auto_23243 ?auto_23235 ) ) ( not ( = ?auto_23243 ?auto_23234 ) ) ( not ( = ?auto_23243 ?auto_23216 ) ) ( not ( = ?auto_23243 ?auto_23230 ) ) ( not ( = ?auto_23243 ?auto_23227 ) ) ( not ( = ?auto_23243 ?auto_23225 ) ) ( not ( = ?auto_23222 ?auto_23239 ) ) ( not ( = ?auto_23222 ?auto_23244 ) ) ( not ( = ?auto_23222 ?auto_23238 ) ) ( not ( = ?auto_23222 ?auto_23220 ) ) ( not ( = ?auto_23222 ?auto_23229 ) ) ( not ( = ?auto_23222 ?auto_23223 ) ) ( not ( = ?auto_23222 ?auto_23240 ) ) ( not ( = ?auto_23236 ?auto_23241 ) ) ( not ( = ?auto_23236 ?auto_23245 ) ) ( not ( = ?auto_23236 ?auto_23221 ) ) ( not ( = ?auto_23236 ?auto_23237 ) ) ( not ( = ?auto_23236 ?auto_23233 ) ) ( not ( = ?auto_23236 ?auto_23232 ) ) ( not ( = ?auto_23236 ?auto_23224 ) ) ( not ( = ?auto_23204 ?auto_23213 ) ) ( not ( = ?auto_23204 ?auto_23231 ) ) ( not ( = ?auto_23205 ?auto_23213 ) ) ( not ( = ?auto_23205 ?auto_23231 ) ) ( not ( = ?auto_23206 ?auto_23213 ) ) ( not ( = ?auto_23206 ?auto_23231 ) ) ( not ( = ?auto_23207 ?auto_23213 ) ) ( not ( = ?auto_23207 ?auto_23231 ) ) ( not ( = ?auto_23208 ?auto_23213 ) ) ( not ( = ?auto_23208 ?auto_23231 ) ) ( not ( = ?auto_23209 ?auto_23213 ) ) ( not ( = ?auto_23209 ?auto_23231 ) ) ( not ( = ?auto_23210 ?auto_23213 ) ) ( not ( = ?auto_23210 ?auto_23231 ) ) ( not ( = ?auto_23211 ?auto_23213 ) ) ( not ( = ?auto_23211 ?auto_23231 ) ) ( not ( = ?auto_23213 ?auto_23236 ) ) ( not ( = ?auto_23213 ?auto_23241 ) ) ( not ( = ?auto_23213 ?auto_23245 ) ) ( not ( = ?auto_23213 ?auto_23221 ) ) ( not ( = ?auto_23213 ?auto_23237 ) ) ( not ( = ?auto_23213 ?auto_23233 ) ) ( not ( = ?auto_23213 ?auto_23232 ) ) ( not ( = ?auto_23213 ?auto_23224 ) ) ( not ( = ?auto_23226 ?auto_23243 ) ) ( not ( = ?auto_23226 ?auto_23242 ) ) ( not ( = ?auto_23226 ?auto_23235 ) ) ( not ( = ?auto_23226 ?auto_23234 ) ) ( not ( = ?auto_23226 ?auto_23216 ) ) ( not ( = ?auto_23226 ?auto_23230 ) ) ( not ( = ?auto_23226 ?auto_23227 ) ) ( not ( = ?auto_23226 ?auto_23225 ) ) ( not ( = ?auto_23228 ?auto_23222 ) ) ( not ( = ?auto_23228 ?auto_23239 ) ) ( not ( = ?auto_23228 ?auto_23244 ) ) ( not ( = ?auto_23228 ?auto_23238 ) ) ( not ( = ?auto_23228 ?auto_23220 ) ) ( not ( = ?auto_23228 ?auto_23229 ) ) ( not ( = ?auto_23228 ?auto_23223 ) ) ( not ( = ?auto_23228 ?auto_23240 ) ) ( not ( = ?auto_23231 ?auto_23236 ) ) ( not ( = ?auto_23231 ?auto_23241 ) ) ( not ( = ?auto_23231 ?auto_23245 ) ) ( not ( = ?auto_23231 ?auto_23221 ) ) ( not ( = ?auto_23231 ?auto_23237 ) ) ( not ( = ?auto_23231 ?auto_23233 ) ) ( not ( = ?auto_23231 ?auto_23232 ) ) ( not ( = ?auto_23231 ?auto_23224 ) ) ( not ( = ?auto_23204 ?auto_23214 ) ) ( not ( = ?auto_23204 ?auto_23218 ) ) ( not ( = ?auto_23205 ?auto_23214 ) ) ( not ( = ?auto_23205 ?auto_23218 ) ) ( not ( = ?auto_23206 ?auto_23214 ) ) ( not ( = ?auto_23206 ?auto_23218 ) ) ( not ( = ?auto_23207 ?auto_23214 ) ) ( not ( = ?auto_23207 ?auto_23218 ) ) ( not ( = ?auto_23208 ?auto_23214 ) ) ( not ( = ?auto_23208 ?auto_23218 ) ) ( not ( = ?auto_23209 ?auto_23214 ) ) ( not ( = ?auto_23209 ?auto_23218 ) ) ( not ( = ?auto_23210 ?auto_23214 ) ) ( not ( = ?auto_23210 ?auto_23218 ) ) ( not ( = ?auto_23211 ?auto_23214 ) ) ( not ( = ?auto_23211 ?auto_23218 ) ) ( not ( = ?auto_23212 ?auto_23214 ) ) ( not ( = ?auto_23212 ?auto_23218 ) ) ( not ( = ?auto_23214 ?auto_23231 ) ) ( not ( = ?auto_23214 ?auto_23236 ) ) ( not ( = ?auto_23214 ?auto_23241 ) ) ( not ( = ?auto_23214 ?auto_23245 ) ) ( not ( = ?auto_23214 ?auto_23221 ) ) ( not ( = ?auto_23214 ?auto_23237 ) ) ( not ( = ?auto_23214 ?auto_23233 ) ) ( not ( = ?auto_23214 ?auto_23232 ) ) ( not ( = ?auto_23214 ?auto_23224 ) ) ( not ( = ?auto_23218 ?auto_23231 ) ) ( not ( = ?auto_23218 ?auto_23236 ) ) ( not ( = ?auto_23218 ?auto_23241 ) ) ( not ( = ?auto_23218 ?auto_23245 ) ) ( not ( = ?auto_23218 ?auto_23221 ) ) ( not ( = ?auto_23218 ?auto_23237 ) ) ( not ( = ?auto_23218 ?auto_23233 ) ) ( not ( = ?auto_23218 ?auto_23232 ) ) ( not ( = ?auto_23218 ?auto_23224 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_23204 ?auto_23205 ?auto_23206 ?auto_23207 ?auto_23208 ?auto_23209 ?auto_23210 ?auto_23211 ?auto_23212 ?auto_23213 )
      ( MAKE-1CRATE ?auto_23213 ?auto_23214 )
      ( MAKE-10CRATE-VERIFY ?auto_23204 ?auto_23205 ?auto_23206 ?auto_23207 ?auto_23208 ?auto_23209 ?auto_23210 ?auto_23211 ?auto_23212 ?auto_23213 ?auto_23214 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_23268 - SURFACE
      ?auto_23269 - SURFACE
      ?auto_23270 - SURFACE
      ?auto_23271 - SURFACE
      ?auto_23272 - SURFACE
      ?auto_23273 - SURFACE
      ?auto_23274 - SURFACE
      ?auto_23275 - SURFACE
      ?auto_23276 - SURFACE
      ?auto_23277 - SURFACE
      ?auto_23278 - SURFACE
      ?auto_23279 - SURFACE
    )
    :vars
    (
      ?auto_23280 - HOIST
      ?auto_23281 - PLACE
      ?auto_23283 - PLACE
      ?auto_23285 - HOIST
      ?auto_23282 - SURFACE
      ?auto_23311 - PLACE
      ?auto_23305 - HOIST
      ?auto_23302 - SURFACE
      ?auto_23309 - PLACE
      ?auto_23312 - HOIST
      ?auto_23289 - SURFACE
      ?auto_23310 - PLACE
      ?auto_23299 - HOIST
      ?auto_23301 - SURFACE
      ?auto_23292 - PLACE
      ?auto_23307 - HOIST
      ?auto_23291 - SURFACE
      ?auto_23298 - PLACE
      ?auto_23293 - HOIST
      ?auto_23286 - SURFACE
      ?auto_23297 - PLACE
      ?auto_23303 - HOIST
      ?auto_23294 - SURFACE
      ?auto_23306 - SURFACE
      ?auto_23290 - PLACE
      ?auto_23308 - HOIST
      ?auto_23296 - SURFACE
      ?auto_23300 - PLACE
      ?auto_23288 - HOIST
      ?auto_23287 - SURFACE
      ?auto_23304 - PLACE
      ?auto_23313 - HOIST
      ?auto_23295 - SURFACE
      ?auto_23284 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23280 ?auto_23281 ) ( IS-CRATE ?auto_23279 ) ( not ( = ?auto_23283 ?auto_23281 ) ) ( HOIST-AT ?auto_23285 ?auto_23283 ) ( AVAILABLE ?auto_23285 ) ( SURFACE-AT ?auto_23279 ?auto_23283 ) ( ON ?auto_23279 ?auto_23282 ) ( CLEAR ?auto_23279 ) ( not ( = ?auto_23278 ?auto_23279 ) ) ( not ( = ?auto_23278 ?auto_23282 ) ) ( not ( = ?auto_23279 ?auto_23282 ) ) ( not ( = ?auto_23280 ?auto_23285 ) ) ( IS-CRATE ?auto_23278 ) ( not ( = ?auto_23311 ?auto_23281 ) ) ( HOIST-AT ?auto_23305 ?auto_23311 ) ( SURFACE-AT ?auto_23278 ?auto_23311 ) ( ON ?auto_23278 ?auto_23302 ) ( CLEAR ?auto_23278 ) ( not ( = ?auto_23277 ?auto_23278 ) ) ( not ( = ?auto_23277 ?auto_23302 ) ) ( not ( = ?auto_23278 ?auto_23302 ) ) ( not ( = ?auto_23280 ?auto_23305 ) ) ( IS-CRATE ?auto_23277 ) ( not ( = ?auto_23309 ?auto_23281 ) ) ( HOIST-AT ?auto_23312 ?auto_23309 ) ( AVAILABLE ?auto_23312 ) ( SURFACE-AT ?auto_23277 ?auto_23309 ) ( ON ?auto_23277 ?auto_23289 ) ( CLEAR ?auto_23277 ) ( not ( = ?auto_23276 ?auto_23277 ) ) ( not ( = ?auto_23276 ?auto_23289 ) ) ( not ( = ?auto_23277 ?auto_23289 ) ) ( not ( = ?auto_23280 ?auto_23312 ) ) ( IS-CRATE ?auto_23276 ) ( not ( = ?auto_23310 ?auto_23281 ) ) ( HOIST-AT ?auto_23299 ?auto_23310 ) ( AVAILABLE ?auto_23299 ) ( SURFACE-AT ?auto_23276 ?auto_23310 ) ( ON ?auto_23276 ?auto_23301 ) ( CLEAR ?auto_23276 ) ( not ( = ?auto_23275 ?auto_23276 ) ) ( not ( = ?auto_23275 ?auto_23301 ) ) ( not ( = ?auto_23276 ?auto_23301 ) ) ( not ( = ?auto_23280 ?auto_23299 ) ) ( IS-CRATE ?auto_23275 ) ( not ( = ?auto_23292 ?auto_23281 ) ) ( HOIST-AT ?auto_23307 ?auto_23292 ) ( AVAILABLE ?auto_23307 ) ( SURFACE-AT ?auto_23275 ?auto_23292 ) ( ON ?auto_23275 ?auto_23291 ) ( CLEAR ?auto_23275 ) ( not ( = ?auto_23274 ?auto_23275 ) ) ( not ( = ?auto_23274 ?auto_23291 ) ) ( not ( = ?auto_23275 ?auto_23291 ) ) ( not ( = ?auto_23280 ?auto_23307 ) ) ( IS-CRATE ?auto_23274 ) ( not ( = ?auto_23298 ?auto_23281 ) ) ( HOIST-AT ?auto_23293 ?auto_23298 ) ( AVAILABLE ?auto_23293 ) ( SURFACE-AT ?auto_23274 ?auto_23298 ) ( ON ?auto_23274 ?auto_23286 ) ( CLEAR ?auto_23274 ) ( not ( = ?auto_23273 ?auto_23274 ) ) ( not ( = ?auto_23273 ?auto_23286 ) ) ( not ( = ?auto_23274 ?auto_23286 ) ) ( not ( = ?auto_23280 ?auto_23293 ) ) ( IS-CRATE ?auto_23273 ) ( not ( = ?auto_23297 ?auto_23281 ) ) ( HOIST-AT ?auto_23303 ?auto_23297 ) ( AVAILABLE ?auto_23303 ) ( SURFACE-AT ?auto_23273 ?auto_23297 ) ( ON ?auto_23273 ?auto_23294 ) ( CLEAR ?auto_23273 ) ( not ( = ?auto_23272 ?auto_23273 ) ) ( not ( = ?auto_23272 ?auto_23294 ) ) ( not ( = ?auto_23273 ?auto_23294 ) ) ( not ( = ?auto_23280 ?auto_23303 ) ) ( IS-CRATE ?auto_23272 ) ( AVAILABLE ?auto_23305 ) ( SURFACE-AT ?auto_23272 ?auto_23311 ) ( ON ?auto_23272 ?auto_23306 ) ( CLEAR ?auto_23272 ) ( not ( = ?auto_23271 ?auto_23272 ) ) ( not ( = ?auto_23271 ?auto_23306 ) ) ( not ( = ?auto_23272 ?auto_23306 ) ) ( IS-CRATE ?auto_23271 ) ( not ( = ?auto_23290 ?auto_23281 ) ) ( HOIST-AT ?auto_23308 ?auto_23290 ) ( AVAILABLE ?auto_23308 ) ( SURFACE-AT ?auto_23271 ?auto_23290 ) ( ON ?auto_23271 ?auto_23296 ) ( CLEAR ?auto_23271 ) ( not ( = ?auto_23270 ?auto_23271 ) ) ( not ( = ?auto_23270 ?auto_23296 ) ) ( not ( = ?auto_23271 ?auto_23296 ) ) ( not ( = ?auto_23280 ?auto_23308 ) ) ( IS-CRATE ?auto_23270 ) ( not ( = ?auto_23300 ?auto_23281 ) ) ( HOIST-AT ?auto_23288 ?auto_23300 ) ( AVAILABLE ?auto_23288 ) ( SURFACE-AT ?auto_23270 ?auto_23300 ) ( ON ?auto_23270 ?auto_23287 ) ( CLEAR ?auto_23270 ) ( not ( = ?auto_23269 ?auto_23270 ) ) ( not ( = ?auto_23269 ?auto_23287 ) ) ( not ( = ?auto_23270 ?auto_23287 ) ) ( not ( = ?auto_23280 ?auto_23288 ) ) ( SURFACE-AT ?auto_23268 ?auto_23281 ) ( CLEAR ?auto_23268 ) ( IS-CRATE ?auto_23269 ) ( AVAILABLE ?auto_23280 ) ( not ( = ?auto_23304 ?auto_23281 ) ) ( HOIST-AT ?auto_23313 ?auto_23304 ) ( AVAILABLE ?auto_23313 ) ( SURFACE-AT ?auto_23269 ?auto_23304 ) ( ON ?auto_23269 ?auto_23295 ) ( CLEAR ?auto_23269 ) ( TRUCK-AT ?auto_23284 ?auto_23281 ) ( not ( = ?auto_23268 ?auto_23269 ) ) ( not ( = ?auto_23268 ?auto_23295 ) ) ( not ( = ?auto_23269 ?auto_23295 ) ) ( not ( = ?auto_23280 ?auto_23313 ) ) ( not ( = ?auto_23268 ?auto_23270 ) ) ( not ( = ?auto_23268 ?auto_23287 ) ) ( not ( = ?auto_23270 ?auto_23295 ) ) ( not ( = ?auto_23300 ?auto_23304 ) ) ( not ( = ?auto_23288 ?auto_23313 ) ) ( not ( = ?auto_23287 ?auto_23295 ) ) ( not ( = ?auto_23268 ?auto_23271 ) ) ( not ( = ?auto_23268 ?auto_23296 ) ) ( not ( = ?auto_23269 ?auto_23271 ) ) ( not ( = ?auto_23269 ?auto_23296 ) ) ( not ( = ?auto_23271 ?auto_23287 ) ) ( not ( = ?auto_23271 ?auto_23295 ) ) ( not ( = ?auto_23290 ?auto_23300 ) ) ( not ( = ?auto_23290 ?auto_23304 ) ) ( not ( = ?auto_23308 ?auto_23288 ) ) ( not ( = ?auto_23308 ?auto_23313 ) ) ( not ( = ?auto_23296 ?auto_23287 ) ) ( not ( = ?auto_23296 ?auto_23295 ) ) ( not ( = ?auto_23268 ?auto_23272 ) ) ( not ( = ?auto_23268 ?auto_23306 ) ) ( not ( = ?auto_23269 ?auto_23272 ) ) ( not ( = ?auto_23269 ?auto_23306 ) ) ( not ( = ?auto_23270 ?auto_23272 ) ) ( not ( = ?auto_23270 ?auto_23306 ) ) ( not ( = ?auto_23272 ?auto_23296 ) ) ( not ( = ?auto_23272 ?auto_23287 ) ) ( not ( = ?auto_23272 ?auto_23295 ) ) ( not ( = ?auto_23311 ?auto_23290 ) ) ( not ( = ?auto_23311 ?auto_23300 ) ) ( not ( = ?auto_23311 ?auto_23304 ) ) ( not ( = ?auto_23305 ?auto_23308 ) ) ( not ( = ?auto_23305 ?auto_23288 ) ) ( not ( = ?auto_23305 ?auto_23313 ) ) ( not ( = ?auto_23306 ?auto_23296 ) ) ( not ( = ?auto_23306 ?auto_23287 ) ) ( not ( = ?auto_23306 ?auto_23295 ) ) ( not ( = ?auto_23268 ?auto_23273 ) ) ( not ( = ?auto_23268 ?auto_23294 ) ) ( not ( = ?auto_23269 ?auto_23273 ) ) ( not ( = ?auto_23269 ?auto_23294 ) ) ( not ( = ?auto_23270 ?auto_23273 ) ) ( not ( = ?auto_23270 ?auto_23294 ) ) ( not ( = ?auto_23271 ?auto_23273 ) ) ( not ( = ?auto_23271 ?auto_23294 ) ) ( not ( = ?auto_23273 ?auto_23306 ) ) ( not ( = ?auto_23273 ?auto_23296 ) ) ( not ( = ?auto_23273 ?auto_23287 ) ) ( not ( = ?auto_23273 ?auto_23295 ) ) ( not ( = ?auto_23297 ?auto_23311 ) ) ( not ( = ?auto_23297 ?auto_23290 ) ) ( not ( = ?auto_23297 ?auto_23300 ) ) ( not ( = ?auto_23297 ?auto_23304 ) ) ( not ( = ?auto_23303 ?auto_23305 ) ) ( not ( = ?auto_23303 ?auto_23308 ) ) ( not ( = ?auto_23303 ?auto_23288 ) ) ( not ( = ?auto_23303 ?auto_23313 ) ) ( not ( = ?auto_23294 ?auto_23306 ) ) ( not ( = ?auto_23294 ?auto_23296 ) ) ( not ( = ?auto_23294 ?auto_23287 ) ) ( not ( = ?auto_23294 ?auto_23295 ) ) ( not ( = ?auto_23268 ?auto_23274 ) ) ( not ( = ?auto_23268 ?auto_23286 ) ) ( not ( = ?auto_23269 ?auto_23274 ) ) ( not ( = ?auto_23269 ?auto_23286 ) ) ( not ( = ?auto_23270 ?auto_23274 ) ) ( not ( = ?auto_23270 ?auto_23286 ) ) ( not ( = ?auto_23271 ?auto_23274 ) ) ( not ( = ?auto_23271 ?auto_23286 ) ) ( not ( = ?auto_23272 ?auto_23274 ) ) ( not ( = ?auto_23272 ?auto_23286 ) ) ( not ( = ?auto_23274 ?auto_23294 ) ) ( not ( = ?auto_23274 ?auto_23306 ) ) ( not ( = ?auto_23274 ?auto_23296 ) ) ( not ( = ?auto_23274 ?auto_23287 ) ) ( not ( = ?auto_23274 ?auto_23295 ) ) ( not ( = ?auto_23298 ?auto_23297 ) ) ( not ( = ?auto_23298 ?auto_23311 ) ) ( not ( = ?auto_23298 ?auto_23290 ) ) ( not ( = ?auto_23298 ?auto_23300 ) ) ( not ( = ?auto_23298 ?auto_23304 ) ) ( not ( = ?auto_23293 ?auto_23303 ) ) ( not ( = ?auto_23293 ?auto_23305 ) ) ( not ( = ?auto_23293 ?auto_23308 ) ) ( not ( = ?auto_23293 ?auto_23288 ) ) ( not ( = ?auto_23293 ?auto_23313 ) ) ( not ( = ?auto_23286 ?auto_23294 ) ) ( not ( = ?auto_23286 ?auto_23306 ) ) ( not ( = ?auto_23286 ?auto_23296 ) ) ( not ( = ?auto_23286 ?auto_23287 ) ) ( not ( = ?auto_23286 ?auto_23295 ) ) ( not ( = ?auto_23268 ?auto_23275 ) ) ( not ( = ?auto_23268 ?auto_23291 ) ) ( not ( = ?auto_23269 ?auto_23275 ) ) ( not ( = ?auto_23269 ?auto_23291 ) ) ( not ( = ?auto_23270 ?auto_23275 ) ) ( not ( = ?auto_23270 ?auto_23291 ) ) ( not ( = ?auto_23271 ?auto_23275 ) ) ( not ( = ?auto_23271 ?auto_23291 ) ) ( not ( = ?auto_23272 ?auto_23275 ) ) ( not ( = ?auto_23272 ?auto_23291 ) ) ( not ( = ?auto_23273 ?auto_23275 ) ) ( not ( = ?auto_23273 ?auto_23291 ) ) ( not ( = ?auto_23275 ?auto_23286 ) ) ( not ( = ?auto_23275 ?auto_23294 ) ) ( not ( = ?auto_23275 ?auto_23306 ) ) ( not ( = ?auto_23275 ?auto_23296 ) ) ( not ( = ?auto_23275 ?auto_23287 ) ) ( not ( = ?auto_23275 ?auto_23295 ) ) ( not ( = ?auto_23292 ?auto_23298 ) ) ( not ( = ?auto_23292 ?auto_23297 ) ) ( not ( = ?auto_23292 ?auto_23311 ) ) ( not ( = ?auto_23292 ?auto_23290 ) ) ( not ( = ?auto_23292 ?auto_23300 ) ) ( not ( = ?auto_23292 ?auto_23304 ) ) ( not ( = ?auto_23307 ?auto_23293 ) ) ( not ( = ?auto_23307 ?auto_23303 ) ) ( not ( = ?auto_23307 ?auto_23305 ) ) ( not ( = ?auto_23307 ?auto_23308 ) ) ( not ( = ?auto_23307 ?auto_23288 ) ) ( not ( = ?auto_23307 ?auto_23313 ) ) ( not ( = ?auto_23291 ?auto_23286 ) ) ( not ( = ?auto_23291 ?auto_23294 ) ) ( not ( = ?auto_23291 ?auto_23306 ) ) ( not ( = ?auto_23291 ?auto_23296 ) ) ( not ( = ?auto_23291 ?auto_23287 ) ) ( not ( = ?auto_23291 ?auto_23295 ) ) ( not ( = ?auto_23268 ?auto_23276 ) ) ( not ( = ?auto_23268 ?auto_23301 ) ) ( not ( = ?auto_23269 ?auto_23276 ) ) ( not ( = ?auto_23269 ?auto_23301 ) ) ( not ( = ?auto_23270 ?auto_23276 ) ) ( not ( = ?auto_23270 ?auto_23301 ) ) ( not ( = ?auto_23271 ?auto_23276 ) ) ( not ( = ?auto_23271 ?auto_23301 ) ) ( not ( = ?auto_23272 ?auto_23276 ) ) ( not ( = ?auto_23272 ?auto_23301 ) ) ( not ( = ?auto_23273 ?auto_23276 ) ) ( not ( = ?auto_23273 ?auto_23301 ) ) ( not ( = ?auto_23274 ?auto_23276 ) ) ( not ( = ?auto_23274 ?auto_23301 ) ) ( not ( = ?auto_23276 ?auto_23291 ) ) ( not ( = ?auto_23276 ?auto_23286 ) ) ( not ( = ?auto_23276 ?auto_23294 ) ) ( not ( = ?auto_23276 ?auto_23306 ) ) ( not ( = ?auto_23276 ?auto_23296 ) ) ( not ( = ?auto_23276 ?auto_23287 ) ) ( not ( = ?auto_23276 ?auto_23295 ) ) ( not ( = ?auto_23310 ?auto_23292 ) ) ( not ( = ?auto_23310 ?auto_23298 ) ) ( not ( = ?auto_23310 ?auto_23297 ) ) ( not ( = ?auto_23310 ?auto_23311 ) ) ( not ( = ?auto_23310 ?auto_23290 ) ) ( not ( = ?auto_23310 ?auto_23300 ) ) ( not ( = ?auto_23310 ?auto_23304 ) ) ( not ( = ?auto_23299 ?auto_23307 ) ) ( not ( = ?auto_23299 ?auto_23293 ) ) ( not ( = ?auto_23299 ?auto_23303 ) ) ( not ( = ?auto_23299 ?auto_23305 ) ) ( not ( = ?auto_23299 ?auto_23308 ) ) ( not ( = ?auto_23299 ?auto_23288 ) ) ( not ( = ?auto_23299 ?auto_23313 ) ) ( not ( = ?auto_23301 ?auto_23291 ) ) ( not ( = ?auto_23301 ?auto_23286 ) ) ( not ( = ?auto_23301 ?auto_23294 ) ) ( not ( = ?auto_23301 ?auto_23306 ) ) ( not ( = ?auto_23301 ?auto_23296 ) ) ( not ( = ?auto_23301 ?auto_23287 ) ) ( not ( = ?auto_23301 ?auto_23295 ) ) ( not ( = ?auto_23268 ?auto_23277 ) ) ( not ( = ?auto_23268 ?auto_23289 ) ) ( not ( = ?auto_23269 ?auto_23277 ) ) ( not ( = ?auto_23269 ?auto_23289 ) ) ( not ( = ?auto_23270 ?auto_23277 ) ) ( not ( = ?auto_23270 ?auto_23289 ) ) ( not ( = ?auto_23271 ?auto_23277 ) ) ( not ( = ?auto_23271 ?auto_23289 ) ) ( not ( = ?auto_23272 ?auto_23277 ) ) ( not ( = ?auto_23272 ?auto_23289 ) ) ( not ( = ?auto_23273 ?auto_23277 ) ) ( not ( = ?auto_23273 ?auto_23289 ) ) ( not ( = ?auto_23274 ?auto_23277 ) ) ( not ( = ?auto_23274 ?auto_23289 ) ) ( not ( = ?auto_23275 ?auto_23277 ) ) ( not ( = ?auto_23275 ?auto_23289 ) ) ( not ( = ?auto_23277 ?auto_23301 ) ) ( not ( = ?auto_23277 ?auto_23291 ) ) ( not ( = ?auto_23277 ?auto_23286 ) ) ( not ( = ?auto_23277 ?auto_23294 ) ) ( not ( = ?auto_23277 ?auto_23306 ) ) ( not ( = ?auto_23277 ?auto_23296 ) ) ( not ( = ?auto_23277 ?auto_23287 ) ) ( not ( = ?auto_23277 ?auto_23295 ) ) ( not ( = ?auto_23309 ?auto_23310 ) ) ( not ( = ?auto_23309 ?auto_23292 ) ) ( not ( = ?auto_23309 ?auto_23298 ) ) ( not ( = ?auto_23309 ?auto_23297 ) ) ( not ( = ?auto_23309 ?auto_23311 ) ) ( not ( = ?auto_23309 ?auto_23290 ) ) ( not ( = ?auto_23309 ?auto_23300 ) ) ( not ( = ?auto_23309 ?auto_23304 ) ) ( not ( = ?auto_23312 ?auto_23299 ) ) ( not ( = ?auto_23312 ?auto_23307 ) ) ( not ( = ?auto_23312 ?auto_23293 ) ) ( not ( = ?auto_23312 ?auto_23303 ) ) ( not ( = ?auto_23312 ?auto_23305 ) ) ( not ( = ?auto_23312 ?auto_23308 ) ) ( not ( = ?auto_23312 ?auto_23288 ) ) ( not ( = ?auto_23312 ?auto_23313 ) ) ( not ( = ?auto_23289 ?auto_23301 ) ) ( not ( = ?auto_23289 ?auto_23291 ) ) ( not ( = ?auto_23289 ?auto_23286 ) ) ( not ( = ?auto_23289 ?auto_23294 ) ) ( not ( = ?auto_23289 ?auto_23306 ) ) ( not ( = ?auto_23289 ?auto_23296 ) ) ( not ( = ?auto_23289 ?auto_23287 ) ) ( not ( = ?auto_23289 ?auto_23295 ) ) ( not ( = ?auto_23268 ?auto_23278 ) ) ( not ( = ?auto_23268 ?auto_23302 ) ) ( not ( = ?auto_23269 ?auto_23278 ) ) ( not ( = ?auto_23269 ?auto_23302 ) ) ( not ( = ?auto_23270 ?auto_23278 ) ) ( not ( = ?auto_23270 ?auto_23302 ) ) ( not ( = ?auto_23271 ?auto_23278 ) ) ( not ( = ?auto_23271 ?auto_23302 ) ) ( not ( = ?auto_23272 ?auto_23278 ) ) ( not ( = ?auto_23272 ?auto_23302 ) ) ( not ( = ?auto_23273 ?auto_23278 ) ) ( not ( = ?auto_23273 ?auto_23302 ) ) ( not ( = ?auto_23274 ?auto_23278 ) ) ( not ( = ?auto_23274 ?auto_23302 ) ) ( not ( = ?auto_23275 ?auto_23278 ) ) ( not ( = ?auto_23275 ?auto_23302 ) ) ( not ( = ?auto_23276 ?auto_23278 ) ) ( not ( = ?auto_23276 ?auto_23302 ) ) ( not ( = ?auto_23278 ?auto_23289 ) ) ( not ( = ?auto_23278 ?auto_23301 ) ) ( not ( = ?auto_23278 ?auto_23291 ) ) ( not ( = ?auto_23278 ?auto_23286 ) ) ( not ( = ?auto_23278 ?auto_23294 ) ) ( not ( = ?auto_23278 ?auto_23306 ) ) ( not ( = ?auto_23278 ?auto_23296 ) ) ( not ( = ?auto_23278 ?auto_23287 ) ) ( not ( = ?auto_23278 ?auto_23295 ) ) ( not ( = ?auto_23302 ?auto_23289 ) ) ( not ( = ?auto_23302 ?auto_23301 ) ) ( not ( = ?auto_23302 ?auto_23291 ) ) ( not ( = ?auto_23302 ?auto_23286 ) ) ( not ( = ?auto_23302 ?auto_23294 ) ) ( not ( = ?auto_23302 ?auto_23306 ) ) ( not ( = ?auto_23302 ?auto_23296 ) ) ( not ( = ?auto_23302 ?auto_23287 ) ) ( not ( = ?auto_23302 ?auto_23295 ) ) ( not ( = ?auto_23268 ?auto_23279 ) ) ( not ( = ?auto_23268 ?auto_23282 ) ) ( not ( = ?auto_23269 ?auto_23279 ) ) ( not ( = ?auto_23269 ?auto_23282 ) ) ( not ( = ?auto_23270 ?auto_23279 ) ) ( not ( = ?auto_23270 ?auto_23282 ) ) ( not ( = ?auto_23271 ?auto_23279 ) ) ( not ( = ?auto_23271 ?auto_23282 ) ) ( not ( = ?auto_23272 ?auto_23279 ) ) ( not ( = ?auto_23272 ?auto_23282 ) ) ( not ( = ?auto_23273 ?auto_23279 ) ) ( not ( = ?auto_23273 ?auto_23282 ) ) ( not ( = ?auto_23274 ?auto_23279 ) ) ( not ( = ?auto_23274 ?auto_23282 ) ) ( not ( = ?auto_23275 ?auto_23279 ) ) ( not ( = ?auto_23275 ?auto_23282 ) ) ( not ( = ?auto_23276 ?auto_23279 ) ) ( not ( = ?auto_23276 ?auto_23282 ) ) ( not ( = ?auto_23277 ?auto_23279 ) ) ( not ( = ?auto_23277 ?auto_23282 ) ) ( not ( = ?auto_23279 ?auto_23302 ) ) ( not ( = ?auto_23279 ?auto_23289 ) ) ( not ( = ?auto_23279 ?auto_23301 ) ) ( not ( = ?auto_23279 ?auto_23291 ) ) ( not ( = ?auto_23279 ?auto_23286 ) ) ( not ( = ?auto_23279 ?auto_23294 ) ) ( not ( = ?auto_23279 ?auto_23306 ) ) ( not ( = ?auto_23279 ?auto_23296 ) ) ( not ( = ?auto_23279 ?auto_23287 ) ) ( not ( = ?auto_23279 ?auto_23295 ) ) ( not ( = ?auto_23283 ?auto_23311 ) ) ( not ( = ?auto_23283 ?auto_23309 ) ) ( not ( = ?auto_23283 ?auto_23310 ) ) ( not ( = ?auto_23283 ?auto_23292 ) ) ( not ( = ?auto_23283 ?auto_23298 ) ) ( not ( = ?auto_23283 ?auto_23297 ) ) ( not ( = ?auto_23283 ?auto_23290 ) ) ( not ( = ?auto_23283 ?auto_23300 ) ) ( not ( = ?auto_23283 ?auto_23304 ) ) ( not ( = ?auto_23285 ?auto_23305 ) ) ( not ( = ?auto_23285 ?auto_23312 ) ) ( not ( = ?auto_23285 ?auto_23299 ) ) ( not ( = ?auto_23285 ?auto_23307 ) ) ( not ( = ?auto_23285 ?auto_23293 ) ) ( not ( = ?auto_23285 ?auto_23303 ) ) ( not ( = ?auto_23285 ?auto_23308 ) ) ( not ( = ?auto_23285 ?auto_23288 ) ) ( not ( = ?auto_23285 ?auto_23313 ) ) ( not ( = ?auto_23282 ?auto_23302 ) ) ( not ( = ?auto_23282 ?auto_23289 ) ) ( not ( = ?auto_23282 ?auto_23301 ) ) ( not ( = ?auto_23282 ?auto_23291 ) ) ( not ( = ?auto_23282 ?auto_23286 ) ) ( not ( = ?auto_23282 ?auto_23294 ) ) ( not ( = ?auto_23282 ?auto_23306 ) ) ( not ( = ?auto_23282 ?auto_23296 ) ) ( not ( = ?auto_23282 ?auto_23287 ) ) ( not ( = ?auto_23282 ?auto_23295 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_23268 ?auto_23269 ?auto_23270 ?auto_23271 ?auto_23272 ?auto_23273 ?auto_23274 ?auto_23275 ?auto_23276 ?auto_23277 ?auto_23278 )
      ( MAKE-1CRATE ?auto_23278 ?auto_23279 )
      ( MAKE-11CRATE-VERIFY ?auto_23268 ?auto_23269 ?auto_23270 ?auto_23271 ?auto_23272 ?auto_23273 ?auto_23274 ?auto_23275 ?auto_23276 ?auto_23277 ?auto_23278 ?auto_23279 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_23337 - SURFACE
      ?auto_23338 - SURFACE
      ?auto_23339 - SURFACE
      ?auto_23340 - SURFACE
      ?auto_23341 - SURFACE
      ?auto_23342 - SURFACE
      ?auto_23343 - SURFACE
      ?auto_23344 - SURFACE
      ?auto_23345 - SURFACE
      ?auto_23346 - SURFACE
      ?auto_23347 - SURFACE
      ?auto_23348 - SURFACE
      ?auto_23349 - SURFACE
    )
    :vars
    (
      ?auto_23353 - HOIST
      ?auto_23352 - PLACE
      ?auto_23351 - PLACE
      ?auto_23350 - HOIST
      ?auto_23355 - SURFACE
      ?auto_23385 - PLACE
      ?auto_23364 - HOIST
      ?auto_23366 - SURFACE
      ?auto_23376 - PLACE
      ?auto_23384 - HOIST
      ?auto_23367 - SURFACE
      ?auto_23369 - PLACE
      ?auto_23357 - HOIST
      ?auto_23362 - SURFACE
      ?auto_23368 - PLACE
      ?auto_23386 - HOIST
      ?auto_23371 - SURFACE
      ?auto_23374 - PLACE
      ?auto_23383 - HOIST
      ?auto_23360 - SURFACE
      ?auto_23377 - PLACE
      ?auto_23378 - HOIST
      ?auto_23373 - SURFACE
      ?auto_23363 - PLACE
      ?auto_23375 - HOIST
      ?auto_23356 - SURFACE
      ?auto_23380 - SURFACE
      ?auto_23382 - PLACE
      ?auto_23358 - HOIST
      ?auto_23379 - SURFACE
      ?auto_23372 - PLACE
      ?auto_23370 - HOIST
      ?auto_23365 - SURFACE
      ?auto_23361 - PLACE
      ?auto_23359 - HOIST
      ?auto_23381 - SURFACE
      ?auto_23354 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23353 ?auto_23352 ) ( IS-CRATE ?auto_23349 ) ( not ( = ?auto_23351 ?auto_23352 ) ) ( HOIST-AT ?auto_23350 ?auto_23351 ) ( AVAILABLE ?auto_23350 ) ( SURFACE-AT ?auto_23349 ?auto_23351 ) ( ON ?auto_23349 ?auto_23355 ) ( CLEAR ?auto_23349 ) ( not ( = ?auto_23348 ?auto_23349 ) ) ( not ( = ?auto_23348 ?auto_23355 ) ) ( not ( = ?auto_23349 ?auto_23355 ) ) ( not ( = ?auto_23353 ?auto_23350 ) ) ( IS-CRATE ?auto_23348 ) ( not ( = ?auto_23385 ?auto_23352 ) ) ( HOIST-AT ?auto_23364 ?auto_23385 ) ( AVAILABLE ?auto_23364 ) ( SURFACE-AT ?auto_23348 ?auto_23385 ) ( ON ?auto_23348 ?auto_23366 ) ( CLEAR ?auto_23348 ) ( not ( = ?auto_23347 ?auto_23348 ) ) ( not ( = ?auto_23347 ?auto_23366 ) ) ( not ( = ?auto_23348 ?auto_23366 ) ) ( not ( = ?auto_23353 ?auto_23364 ) ) ( IS-CRATE ?auto_23347 ) ( not ( = ?auto_23376 ?auto_23352 ) ) ( HOIST-AT ?auto_23384 ?auto_23376 ) ( SURFACE-AT ?auto_23347 ?auto_23376 ) ( ON ?auto_23347 ?auto_23367 ) ( CLEAR ?auto_23347 ) ( not ( = ?auto_23346 ?auto_23347 ) ) ( not ( = ?auto_23346 ?auto_23367 ) ) ( not ( = ?auto_23347 ?auto_23367 ) ) ( not ( = ?auto_23353 ?auto_23384 ) ) ( IS-CRATE ?auto_23346 ) ( not ( = ?auto_23369 ?auto_23352 ) ) ( HOIST-AT ?auto_23357 ?auto_23369 ) ( AVAILABLE ?auto_23357 ) ( SURFACE-AT ?auto_23346 ?auto_23369 ) ( ON ?auto_23346 ?auto_23362 ) ( CLEAR ?auto_23346 ) ( not ( = ?auto_23345 ?auto_23346 ) ) ( not ( = ?auto_23345 ?auto_23362 ) ) ( not ( = ?auto_23346 ?auto_23362 ) ) ( not ( = ?auto_23353 ?auto_23357 ) ) ( IS-CRATE ?auto_23345 ) ( not ( = ?auto_23368 ?auto_23352 ) ) ( HOIST-AT ?auto_23386 ?auto_23368 ) ( AVAILABLE ?auto_23386 ) ( SURFACE-AT ?auto_23345 ?auto_23368 ) ( ON ?auto_23345 ?auto_23371 ) ( CLEAR ?auto_23345 ) ( not ( = ?auto_23344 ?auto_23345 ) ) ( not ( = ?auto_23344 ?auto_23371 ) ) ( not ( = ?auto_23345 ?auto_23371 ) ) ( not ( = ?auto_23353 ?auto_23386 ) ) ( IS-CRATE ?auto_23344 ) ( not ( = ?auto_23374 ?auto_23352 ) ) ( HOIST-AT ?auto_23383 ?auto_23374 ) ( AVAILABLE ?auto_23383 ) ( SURFACE-AT ?auto_23344 ?auto_23374 ) ( ON ?auto_23344 ?auto_23360 ) ( CLEAR ?auto_23344 ) ( not ( = ?auto_23343 ?auto_23344 ) ) ( not ( = ?auto_23343 ?auto_23360 ) ) ( not ( = ?auto_23344 ?auto_23360 ) ) ( not ( = ?auto_23353 ?auto_23383 ) ) ( IS-CRATE ?auto_23343 ) ( not ( = ?auto_23377 ?auto_23352 ) ) ( HOIST-AT ?auto_23378 ?auto_23377 ) ( AVAILABLE ?auto_23378 ) ( SURFACE-AT ?auto_23343 ?auto_23377 ) ( ON ?auto_23343 ?auto_23373 ) ( CLEAR ?auto_23343 ) ( not ( = ?auto_23342 ?auto_23343 ) ) ( not ( = ?auto_23342 ?auto_23373 ) ) ( not ( = ?auto_23343 ?auto_23373 ) ) ( not ( = ?auto_23353 ?auto_23378 ) ) ( IS-CRATE ?auto_23342 ) ( not ( = ?auto_23363 ?auto_23352 ) ) ( HOIST-AT ?auto_23375 ?auto_23363 ) ( AVAILABLE ?auto_23375 ) ( SURFACE-AT ?auto_23342 ?auto_23363 ) ( ON ?auto_23342 ?auto_23356 ) ( CLEAR ?auto_23342 ) ( not ( = ?auto_23341 ?auto_23342 ) ) ( not ( = ?auto_23341 ?auto_23356 ) ) ( not ( = ?auto_23342 ?auto_23356 ) ) ( not ( = ?auto_23353 ?auto_23375 ) ) ( IS-CRATE ?auto_23341 ) ( AVAILABLE ?auto_23384 ) ( SURFACE-AT ?auto_23341 ?auto_23376 ) ( ON ?auto_23341 ?auto_23380 ) ( CLEAR ?auto_23341 ) ( not ( = ?auto_23340 ?auto_23341 ) ) ( not ( = ?auto_23340 ?auto_23380 ) ) ( not ( = ?auto_23341 ?auto_23380 ) ) ( IS-CRATE ?auto_23340 ) ( not ( = ?auto_23382 ?auto_23352 ) ) ( HOIST-AT ?auto_23358 ?auto_23382 ) ( AVAILABLE ?auto_23358 ) ( SURFACE-AT ?auto_23340 ?auto_23382 ) ( ON ?auto_23340 ?auto_23379 ) ( CLEAR ?auto_23340 ) ( not ( = ?auto_23339 ?auto_23340 ) ) ( not ( = ?auto_23339 ?auto_23379 ) ) ( not ( = ?auto_23340 ?auto_23379 ) ) ( not ( = ?auto_23353 ?auto_23358 ) ) ( IS-CRATE ?auto_23339 ) ( not ( = ?auto_23372 ?auto_23352 ) ) ( HOIST-AT ?auto_23370 ?auto_23372 ) ( AVAILABLE ?auto_23370 ) ( SURFACE-AT ?auto_23339 ?auto_23372 ) ( ON ?auto_23339 ?auto_23365 ) ( CLEAR ?auto_23339 ) ( not ( = ?auto_23338 ?auto_23339 ) ) ( not ( = ?auto_23338 ?auto_23365 ) ) ( not ( = ?auto_23339 ?auto_23365 ) ) ( not ( = ?auto_23353 ?auto_23370 ) ) ( SURFACE-AT ?auto_23337 ?auto_23352 ) ( CLEAR ?auto_23337 ) ( IS-CRATE ?auto_23338 ) ( AVAILABLE ?auto_23353 ) ( not ( = ?auto_23361 ?auto_23352 ) ) ( HOIST-AT ?auto_23359 ?auto_23361 ) ( AVAILABLE ?auto_23359 ) ( SURFACE-AT ?auto_23338 ?auto_23361 ) ( ON ?auto_23338 ?auto_23381 ) ( CLEAR ?auto_23338 ) ( TRUCK-AT ?auto_23354 ?auto_23352 ) ( not ( = ?auto_23337 ?auto_23338 ) ) ( not ( = ?auto_23337 ?auto_23381 ) ) ( not ( = ?auto_23338 ?auto_23381 ) ) ( not ( = ?auto_23353 ?auto_23359 ) ) ( not ( = ?auto_23337 ?auto_23339 ) ) ( not ( = ?auto_23337 ?auto_23365 ) ) ( not ( = ?auto_23339 ?auto_23381 ) ) ( not ( = ?auto_23372 ?auto_23361 ) ) ( not ( = ?auto_23370 ?auto_23359 ) ) ( not ( = ?auto_23365 ?auto_23381 ) ) ( not ( = ?auto_23337 ?auto_23340 ) ) ( not ( = ?auto_23337 ?auto_23379 ) ) ( not ( = ?auto_23338 ?auto_23340 ) ) ( not ( = ?auto_23338 ?auto_23379 ) ) ( not ( = ?auto_23340 ?auto_23365 ) ) ( not ( = ?auto_23340 ?auto_23381 ) ) ( not ( = ?auto_23382 ?auto_23372 ) ) ( not ( = ?auto_23382 ?auto_23361 ) ) ( not ( = ?auto_23358 ?auto_23370 ) ) ( not ( = ?auto_23358 ?auto_23359 ) ) ( not ( = ?auto_23379 ?auto_23365 ) ) ( not ( = ?auto_23379 ?auto_23381 ) ) ( not ( = ?auto_23337 ?auto_23341 ) ) ( not ( = ?auto_23337 ?auto_23380 ) ) ( not ( = ?auto_23338 ?auto_23341 ) ) ( not ( = ?auto_23338 ?auto_23380 ) ) ( not ( = ?auto_23339 ?auto_23341 ) ) ( not ( = ?auto_23339 ?auto_23380 ) ) ( not ( = ?auto_23341 ?auto_23379 ) ) ( not ( = ?auto_23341 ?auto_23365 ) ) ( not ( = ?auto_23341 ?auto_23381 ) ) ( not ( = ?auto_23376 ?auto_23382 ) ) ( not ( = ?auto_23376 ?auto_23372 ) ) ( not ( = ?auto_23376 ?auto_23361 ) ) ( not ( = ?auto_23384 ?auto_23358 ) ) ( not ( = ?auto_23384 ?auto_23370 ) ) ( not ( = ?auto_23384 ?auto_23359 ) ) ( not ( = ?auto_23380 ?auto_23379 ) ) ( not ( = ?auto_23380 ?auto_23365 ) ) ( not ( = ?auto_23380 ?auto_23381 ) ) ( not ( = ?auto_23337 ?auto_23342 ) ) ( not ( = ?auto_23337 ?auto_23356 ) ) ( not ( = ?auto_23338 ?auto_23342 ) ) ( not ( = ?auto_23338 ?auto_23356 ) ) ( not ( = ?auto_23339 ?auto_23342 ) ) ( not ( = ?auto_23339 ?auto_23356 ) ) ( not ( = ?auto_23340 ?auto_23342 ) ) ( not ( = ?auto_23340 ?auto_23356 ) ) ( not ( = ?auto_23342 ?auto_23380 ) ) ( not ( = ?auto_23342 ?auto_23379 ) ) ( not ( = ?auto_23342 ?auto_23365 ) ) ( not ( = ?auto_23342 ?auto_23381 ) ) ( not ( = ?auto_23363 ?auto_23376 ) ) ( not ( = ?auto_23363 ?auto_23382 ) ) ( not ( = ?auto_23363 ?auto_23372 ) ) ( not ( = ?auto_23363 ?auto_23361 ) ) ( not ( = ?auto_23375 ?auto_23384 ) ) ( not ( = ?auto_23375 ?auto_23358 ) ) ( not ( = ?auto_23375 ?auto_23370 ) ) ( not ( = ?auto_23375 ?auto_23359 ) ) ( not ( = ?auto_23356 ?auto_23380 ) ) ( not ( = ?auto_23356 ?auto_23379 ) ) ( not ( = ?auto_23356 ?auto_23365 ) ) ( not ( = ?auto_23356 ?auto_23381 ) ) ( not ( = ?auto_23337 ?auto_23343 ) ) ( not ( = ?auto_23337 ?auto_23373 ) ) ( not ( = ?auto_23338 ?auto_23343 ) ) ( not ( = ?auto_23338 ?auto_23373 ) ) ( not ( = ?auto_23339 ?auto_23343 ) ) ( not ( = ?auto_23339 ?auto_23373 ) ) ( not ( = ?auto_23340 ?auto_23343 ) ) ( not ( = ?auto_23340 ?auto_23373 ) ) ( not ( = ?auto_23341 ?auto_23343 ) ) ( not ( = ?auto_23341 ?auto_23373 ) ) ( not ( = ?auto_23343 ?auto_23356 ) ) ( not ( = ?auto_23343 ?auto_23380 ) ) ( not ( = ?auto_23343 ?auto_23379 ) ) ( not ( = ?auto_23343 ?auto_23365 ) ) ( not ( = ?auto_23343 ?auto_23381 ) ) ( not ( = ?auto_23377 ?auto_23363 ) ) ( not ( = ?auto_23377 ?auto_23376 ) ) ( not ( = ?auto_23377 ?auto_23382 ) ) ( not ( = ?auto_23377 ?auto_23372 ) ) ( not ( = ?auto_23377 ?auto_23361 ) ) ( not ( = ?auto_23378 ?auto_23375 ) ) ( not ( = ?auto_23378 ?auto_23384 ) ) ( not ( = ?auto_23378 ?auto_23358 ) ) ( not ( = ?auto_23378 ?auto_23370 ) ) ( not ( = ?auto_23378 ?auto_23359 ) ) ( not ( = ?auto_23373 ?auto_23356 ) ) ( not ( = ?auto_23373 ?auto_23380 ) ) ( not ( = ?auto_23373 ?auto_23379 ) ) ( not ( = ?auto_23373 ?auto_23365 ) ) ( not ( = ?auto_23373 ?auto_23381 ) ) ( not ( = ?auto_23337 ?auto_23344 ) ) ( not ( = ?auto_23337 ?auto_23360 ) ) ( not ( = ?auto_23338 ?auto_23344 ) ) ( not ( = ?auto_23338 ?auto_23360 ) ) ( not ( = ?auto_23339 ?auto_23344 ) ) ( not ( = ?auto_23339 ?auto_23360 ) ) ( not ( = ?auto_23340 ?auto_23344 ) ) ( not ( = ?auto_23340 ?auto_23360 ) ) ( not ( = ?auto_23341 ?auto_23344 ) ) ( not ( = ?auto_23341 ?auto_23360 ) ) ( not ( = ?auto_23342 ?auto_23344 ) ) ( not ( = ?auto_23342 ?auto_23360 ) ) ( not ( = ?auto_23344 ?auto_23373 ) ) ( not ( = ?auto_23344 ?auto_23356 ) ) ( not ( = ?auto_23344 ?auto_23380 ) ) ( not ( = ?auto_23344 ?auto_23379 ) ) ( not ( = ?auto_23344 ?auto_23365 ) ) ( not ( = ?auto_23344 ?auto_23381 ) ) ( not ( = ?auto_23374 ?auto_23377 ) ) ( not ( = ?auto_23374 ?auto_23363 ) ) ( not ( = ?auto_23374 ?auto_23376 ) ) ( not ( = ?auto_23374 ?auto_23382 ) ) ( not ( = ?auto_23374 ?auto_23372 ) ) ( not ( = ?auto_23374 ?auto_23361 ) ) ( not ( = ?auto_23383 ?auto_23378 ) ) ( not ( = ?auto_23383 ?auto_23375 ) ) ( not ( = ?auto_23383 ?auto_23384 ) ) ( not ( = ?auto_23383 ?auto_23358 ) ) ( not ( = ?auto_23383 ?auto_23370 ) ) ( not ( = ?auto_23383 ?auto_23359 ) ) ( not ( = ?auto_23360 ?auto_23373 ) ) ( not ( = ?auto_23360 ?auto_23356 ) ) ( not ( = ?auto_23360 ?auto_23380 ) ) ( not ( = ?auto_23360 ?auto_23379 ) ) ( not ( = ?auto_23360 ?auto_23365 ) ) ( not ( = ?auto_23360 ?auto_23381 ) ) ( not ( = ?auto_23337 ?auto_23345 ) ) ( not ( = ?auto_23337 ?auto_23371 ) ) ( not ( = ?auto_23338 ?auto_23345 ) ) ( not ( = ?auto_23338 ?auto_23371 ) ) ( not ( = ?auto_23339 ?auto_23345 ) ) ( not ( = ?auto_23339 ?auto_23371 ) ) ( not ( = ?auto_23340 ?auto_23345 ) ) ( not ( = ?auto_23340 ?auto_23371 ) ) ( not ( = ?auto_23341 ?auto_23345 ) ) ( not ( = ?auto_23341 ?auto_23371 ) ) ( not ( = ?auto_23342 ?auto_23345 ) ) ( not ( = ?auto_23342 ?auto_23371 ) ) ( not ( = ?auto_23343 ?auto_23345 ) ) ( not ( = ?auto_23343 ?auto_23371 ) ) ( not ( = ?auto_23345 ?auto_23360 ) ) ( not ( = ?auto_23345 ?auto_23373 ) ) ( not ( = ?auto_23345 ?auto_23356 ) ) ( not ( = ?auto_23345 ?auto_23380 ) ) ( not ( = ?auto_23345 ?auto_23379 ) ) ( not ( = ?auto_23345 ?auto_23365 ) ) ( not ( = ?auto_23345 ?auto_23381 ) ) ( not ( = ?auto_23368 ?auto_23374 ) ) ( not ( = ?auto_23368 ?auto_23377 ) ) ( not ( = ?auto_23368 ?auto_23363 ) ) ( not ( = ?auto_23368 ?auto_23376 ) ) ( not ( = ?auto_23368 ?auto_23382 ) ) ( not ( = ?auto_23368 ?auto_23372 ) ) ( not ( = ?auto_23368 ?auto_23361 ) ) ( not ( = ?auto_23386 ?auto_23383 ) ) ( not ( = ?auto_23386 ?auto_23378 ) ) ( not ( = ?auto_23386 ?auto_23375 ) ) ( not ( = ?auto_23386 ?auto_23384 ) ) ( not ( = ?auto_23386 ?auto_23358 ) ) ( not ( = ?auto_23386 ?auto_23370 ) ) ( not ( = ?auto_23386 ?auto_23359 ) ) ( not ( = ?auto_23371 ?auto_23360 ) ) ( not ( = ?auto_23371 ?auto_23373 ) ) ( not ( = ?auto_23371 ?auto_23356 ) ) ( not ( = ?auto_23371 ?auto_23380 ) ) ( not ( = ?auto_23371 ?auto_23379 ) ) ( not ( = ?auto_23371 ?auto_23365 ) ) ( not ( = ?auto_23371 ?auto_23381 ) ) ( not ( = ?auto_23337 ?auto_23346 ) ) ( not ( = ?auto_23337 ?auto_23362 ) ) ( not ( = ?auto_23338 ?auto_23346 ) ) ( not ( = ?auto_23338 ?auto_23362 ) ) ( not ( = ?auto_23339 ?auto_23346 ) ) ( not ( = ?auto_23339 ?auto_23362 ) ) ( not ( = ?auto_23340 ?auto_23346 ) ) ( not ( = ?auto_23340 ?auto_23362 ) ) ( not ( = ?auto_23341 ?auto_23346 ) ) ( not ( = ?auto_23341 ?auto_23362 ) ) ( not ( = ?auto_23342 ?auto_23346 ) ) ( not ( = ?auto_23342 ?auto_23362 ) ) ( not ( = ?auto_23343 ?auto_23346 ) ) ( not ( = ?auto_23343 ?auto_23362 ) ) ( not ( = ?auto_23344 ?auto_23346 ) ) ( not ( = ?auto_23344 ?auto_23362 ) ) ( not ( = ?auto_23346 ?auto_23371 ) ) ( not ( = ?auto_23346 ?auto_23360 ) ) ( not ( = ?auto_23346 ?auto_23373 ) ) ( not ( = ?auto_23346 ?auto_23356 ) ) ( not ( = ?auto_23346 ?auto_23380 ) ) ( not ( = ?auto_23346 ?auto_23379 ) ) ( not ( = ?auto_23346 ?auto_23365 ) ) ( not ( = ?auto_23346 ?auto_23381 ) ) ( not ( = ?auto_23369 ?auto_23368 ) ) ( not ( = ?auto_23369 ?auto_23374 ) ) ( not ( = ?auto_23369 ?auto_23377 ) ) ( not ( = ?auto_23369 ?auto_23363 ) ) ( not ( = ?auto_23369 ?auto_23376 ) ) ( not ( = ?auto_23369 ?auto_23382 ) ) ( not ( = ?auto_23369 ?auto_23372 ) ) ( not ( = ?auto_23369 ?auto_23361 ) ) ( not ( = ?auto_23357 ?auto_23386 ) ) ( not ( = ?auto_23357 ?auto_23383 ) ) ( not ( = ?auto_23357 ?auto_23378 ) ) ( not ( = ?auto_23357 ?auto_23375 ) ) ( not ( = ?auto_23357 ?auto_23384 ) ) ( not ( = ?auto_23357 ?auto_23358 ) ) ( not ( = ?auto_23357 ?auto_23370 ) ) ( not ( = ?auto_23357 ?auto_23359 ) ) ( not ( = ?auto_23362 ?auto_23371 ) ) ( not ( = ?auto_23362 ?auto_23360 ) ) ( not ( = ?auto_23362 ?auto_23373 ) ) ( not ( = ?auto_23362 ?auto_23356 ) ) ( not ( = ?auto_23362 ?auto_23380 ) ) ( not ( = ?auto_23362 ?auto_23379 ) ) ( not ( = ?auto_23362 ?auto_23365 ) ) ( not ( = ?auto_23362 ?auto_23381 ) ) ( not ( = ?auto_23337 ?auto_23347 ) ) ( not ( = ?auto_23337 ?auto_23367 ) ) ( not ( = ?auto_23338 ?auto_23347 ) ) ( not ( = ?auto_23338 ?auto_23367 ) ) ( not ( = ?auto_23339 ?auto_23347 ) ) ( not ( = ?auto_23339 ?auto_23367 ) ) ( not ( = ?auto_23340 ?auto_23347 ) ) ( not ( = ?auto_23340 ?auto_23367 ) ) ( not ( = ?auto_23341 ?auto_23347 ) ) ( not ( = ?auto_23341 ?auto_23367 ) ) ( not ( = ?auto_23342 ?auto_23347 ) ) ( not ( = ?auto_23342 ?auto_23367 ) ) ( not ( = ?auto_23343 ?auto_23347 ) ) ( not ( = ?auto_23343 ?auto_23367 ) ) ( not ( = ?auto_23344 ?auto_23347 ) ) ( not ( = ?auto_23344 ?auto_23367 ) ) ( not ( = ?auto_23345 ?auto_23347 ) ) ( not ( = ?auto_23345 ?auto_23367 ) ) ( not ( = ?auto_23347 ?auto_23362 ) ) ( not ( = ?auto_23347 ?auto_23371 ) ) ( not ( = ?auto_23347 ?auto_23360 ) ) ( not ( = ?auto_23347 ?auto_23373 ) ) ( not ( = ?auto_23347 ?auto_23356 ) ) ( not ( = ?auto_23347 ?auto_23380 ) ) ( not ( = ?auto_23347 ?auto_23379 ) ) ( not ( = ?auto_23347 ?auto_23365 ) ) ( not ( = ?auto_23347 ?auto_23381 ) ) ( not ( = ?auto_23367 ?auto_23362 ) ) ( not ( = ?auto_23367 ?auto_23371 ) ) ( not ( = ?auto_23367 ?auto_23360 ) ) ( not ( = ?auto_23367 ?auto_23373 ) ) ( not ( = ?auto_23367 ?auto_23356 ) ) ( not ( = ?auto_23367 ?auto_23380 ) ) ( not ( = ?auto_23367 ?auto_23379 ) ) ( not ( = ?auto_23367 ?auto_23365 ) ) ( not ( = ?auto_23367 ?auto_23381 ) ) ( not ( = ?auto_23337 ?auto_23348 ) ) ( not ( = ?auto_23337 ?auto_23366 ) ) ( not ( = ?auto_23338 ?auto_23348 ) ) ( not ( = ?auto_23338 ?auto_23366 ) ) ( not ( = ?auto_23339 ?auto_23348 ) ) ( not ( = ?auto_23339 ?auto_23366 ) ) ( not ( = ?auto_23340 ?auto_23348 ) ) ( not ( = ?auto_23340 ?auto_23366 ) ) ( not ( = ?auto_23341 ?auto_23348 ) ) ( not ( = ?auto_23341 ?auto_23366 ) ) ( not ( = ?auto_23342 ?auto_23348 ) ) ( not ( = ?auto_23342 ?auto_23366 ) ) ( not ( = ?auto_23343 ?auto_23348 ) ) ( not ( = ?auto_23343 ?auto_23366 ) ) ( not ( = ?auto_23344 ?auto_23348 ) ) ( not ( = ?auto_23344 ?auto_23366 ) ) ( not ( = ?auto_23345 ?auto_23348 ) ) ( not ( = ?auto_23345 ?auto_23366 ) ) ( not ( = ?auto_23346 ?auto_23348 ) ) ( not ( = ?auto_23346 ?auto_23366 ) ) ( not ( = ?auto_23348 ?auto_23367 ) ) ( not ( = ?auto_23348 ?auto_23362 ) ) ( not ( = ?auto_23348 ?auto_23371 ) ) ( not ( = ?auto_23348 ?auto_23360 ) ) ( not ( = ?auto_23348 ?auto_23373 ) ) ( not ( = ?auto_23348 ?auto_23356 ) ) ( not ( = ?auto_23348 ?auto_23380 ) ) ( not ( = ?auto_23348 ?auto_23379 ) ) ( not ( = ?auto_23348 ?auto_23365 ) ) ( not ( = ?auto_23348 ?auto_23381 ) ) ( not ( = ?auto_23385 ?auto_23376 ) ) ( not ( = ?auto_23385 ?auto_23369 ) ) ( not ( = ?auto_23385 ?auto_23368 ) ) ( not ( = ?auto_23385 ?auto_23374 ) ) ( not ( = ?auto_23385 ?auto_23377 ) ) ( not ( = ?auto_23385 ?auto_23363 ) ) ( not ( = ?auto_23385 ?auto_23382 ) ) ( not ( = ?auto_23385 ?auto_23372 ) ) ( not ( = ?auto_23385 ?auto_23361 ) ) ( not ( = ?auto_23364 ?auto_23384 ) ) ( not ( = ?auto_23364 ?auto_23357 ) ) ( not ( = ?auto_23364 ?auto_23386 ) ) ( not ( = ?auto_23364 ?auto_23383 ) ) ( not ( = ?auto_23364 ?auto_23378 ) ) ( not ( = ?auto_23364 ?auto_23375 ) ) ( not ( = ?auto_23364 ?auto_23358 ) ) ( not ( = ?auto_23364 ?auto_23370 ) ) ( not ( = ?auto_23364 ?auto_23359 ) ) ( not ( = ?auto_23366 ?auto_23367 ) ) ( not ( = ?auto_23366 ?auto_23362 ) ) ( not ( = ?auto_23366 ?auto_23371 ) ) ( not ( = ?auto_23366 ?auto_23360 ) ) ( not ( = ?auto_23366 ?auto_23373 ) ) ( not ( = ?auto_23366 ?auto_23356 ) ) ( not ( = ?auto_23366 ?auto_23380 ) ) ( not ( = ?auto_23366 ?auto_23379 ) ) ( not ( = ?auto_23366 ?auto_23365 ) ) ( not ( = ?auto_23366 ?auto_23381 ) ) ( not ( = ?auto_23337 ?auto_23349 ) ) ( not ( = ?auto_23337 ?auto_23355 ) ) ( not ( = ?auto_23338 ?auto_23349 ) ) ( not ( = ?auto_23338 ?auto_23355 ) ) ( not ( = ?auto_23339 ?auto_23349 ) ) ( not ( = ?auto_23339 ?auto_23355 ) ) ( not ( = ?auto_23340 ?auto_23349 ) ) ( not ( = ?auto_23340 ?auto_23355 ) ) ( not ( = ?auto_23341 ?auto_23349 ) ) ( not ( = ?auto_23341 ?auto_23355 ) ) ( not ( = ?auto_23342 ?auto_23349 ) ) ( not ( = ?auto_23342 ?auto_23355 ) ) ( not ( = ?auto_23343 ?auto_23349 ) ) ( not ( = ?auto_23343 ?auto_23355 ) ) ( not ( = ?auto_23344 ?auto_23349 ) ) ( not ( = ?auto_23344 ?auto_23355 ) ) ( not ( = ?auto_23345 ?auto_23349 ) ) ( not ( = ?auto_23345 ?auto_23355 ) ) ( not ( = ?auto_23346 ?auto_23349 ) ) ( not ( = ?auto_23346 ?auto_23355 ) ) ( not ( = ?auto_23347 ?auto_23349 ) ) ( not ( = ?auto_23347 ?auto_23355 ) ) ( not ( = ?auto_23349 ?auto_23366 ) ) ( not ( = ?auto_23349 ?auto_23367 ) ) ( not ( = ?auto_23349 ?auto_23362 ) ) ( not ( = ?auto_23349 ?auto_23371 ) ) ( not ( = ?auto_23349 ?auto_23360 ) ) ( not ( = ?auto_23349 ?auto_23373 ) ) ( not ( = ?auto_23349 ?auto_23356 ) ) ( not ( = ?auto_23349 ?auto_23380 ) ) ( not ( = ?auto_23349 ?auto_23379 ) ) ( not ( = ?auto_23349 ?auto_23365 ) ) ( not ( = ?auto_23349 ?auto_23381 ) ) ( not ( = ?auto_23351 ?auto_23385 ) ) ( not ( = ?auto_23351 ?auto_23376 ) ) ( not ( = ?auto_23351 ?auto_23369 ) ) ( not ( = ?auto_23351 ?auto_23368 ) ) ( not ( = ?auto_23351 ?auto_23374 ) ) ( not ( = ?auto_23351 ?auto_23377 ) ) ( not ( = ?auto_23351 ?auto_23363 ) ) ( not ( = ?auto_23351 ?auto_23382 ) ) ( not ( = ?auto_23351 ?auto_23372 ) ) ( not ( = ?auto_23351 ?auto_23361 ) ) ( not ( = ?auto_23350 ?auto_23364 ) ) ( not ( = ?auto_23350 ?auto_23384 ) ) ( not ( = ?auto_23350 ?auto_23357 ) ) ( not ( = ?auto_23350 ?auto_23386 ) ) ( not ( = ?auto_23350 ?auto_23383 ) ) ( not ( = ?auto_23350 ?auto_23378 ) ) ( not ( = ?auto_23350 ?auto_23375 ) ) ( not ( = ?auto_23350 ?auto_23358 ) ) ( not ( = ?auto_23350 ?auto_23370 ) ) ( not ( = ?auto_23350 ?auto_23359 ) ) ( not ( = ?auto_23355 ?auto_23366 ) ) ( not ( = ?auto_23355 ?auto_23367 ) ) ( not ( = ?auto_23355 ?auto_23362 ) ) ( not ( = ?auto_23355 ?auto_23371 ) ) ( not ( = ?auto_23355 ?auto_23360 ) ) ( not ( = ?auto_23355 ?auto_23373 ) ) ( not ( = ?auto_23355 ?auto_23356 ) ) ( not ( = ?auto_23355 ?auto_23380 ) ) ( not ( = ?auto_23355 ?auto_23379 ) ) ( not ( = ?auto_23355 ?auto_23365 ) ) ( not ( = ?auto_23355 ?auto_23381 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_23337 ?auto_23338 ?auto_23339 ?auto_23340 ?auto_23341 ?auto_23342 ?auto_23343 ?auto_23344 ?auto_23345 ?auto_23346 ?auto_23347 ?auto_23348 )
      ( MAKE-1CRATE ?auto_23348 ?auto_23349 )
      ( MAKE-12CRATE-VERIFY ?auto_23337 ?auto_23338 ?auto_23339 ?auto_23340 ?auto_23341 ?auto_23342 ?auto_23343 ?auto_23344 ?auto_23345 ?auto_23346 ?auto_23347 ?auto_23348 ?auto_23349 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_23411 - SURFACE
      ?auto_23412 - SURFACE
      ?auto_23413 - SURFACE
      ?auto_23414 - SURFACE
      ?auto_23415 - SURFACE
      ?auto_23416 - SURFACE
      ?auto_23417 - SURFACE
      ?auto_23418 - SURFACE
      ?auto_23419 - SURFACE
      ?auto_23420 - SURFACE
      ?auto_23421 - SURFACE
      ?auto_23422 - SURFACE
      ?auto_23423 - SURFACE
      ?auto_23424 - SURFACE
    )
    :vars
    (
      ?auto_23427 - HOIST
      ?auto_23425 - PLACE
      ?auto_23426 - PLACE
      ?auto_23430 - HOIST
      ?auto_23428 - SURFACE
      ?auto_23459 - PLACE
      ?auto_23446 - HOIST
      ?auto_23452 - SURFACE
      ?auto_23456 - PLACE
      ?auto_23438 - HOIST
      ?auto_23445 - SURFACE
      ?auto_23436 - SURFACE
      ?auto_23440 - PLACE
      ?auto_23441 - HOIST
      ?auto_23443 - SURFACE
      ?auto_23450 - PLACE
      ?auto_23439 - HOIST
      ?auto_23437 - SURFACE
      ?auto_23451 - PLACE
      ?auto_23442 - HOIST
      ?auto_23448 - SURFACE
      ?auto_23454 - PLACE
      ?auto_23462 - HOIST
      ?auto_23447 - SURFACE
      ?auto_23453 - PLACE
      ?auto_23431 - HOIST
      ?auto_23432 - SURFACE
      ?auto_23444 - SURFACE
      ?auto_23458 - PLACE
      ?auto_23434 - HOIST
      ?auto_23449 - SURFACE
      ?auto_23460 - PLACE
      ?auto_23461 - HOIST
      ?auto_23435 - SURFACE
      ?auto_23455 - PLACE
      ?auto_23433 - HOIST
      ?auto_23457 - SURFACE
      ?auto_23429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23427 ?auto_23425 ) ( IS-CRATE ?auto_23424 ) ( not ( = ?auto_23426 ?auto_23425 ) ) ( HOIST-AT ?auto_23430 ?auto_23426 ) ( SURFACE-AT ?auto_23424 ?auto_23426 ) ( ON ?auto_23424 ?auto_23428 ) ( CLEAR ?auto_23424 ) ( not ( = ?auto_23423 ?auto_23424 ) ) ( not ( = ?auto_23423 ?auto_23428 ) ) ( not ( = ?auto_23424 ?auto_23428 ) ) ( not ( = ?auto_23427 ?auto_23430 ) ) ( IS-CRATE ?auto_23423 ) ( not ( = ?auto_23459 ?auto_23425 ) ) ( HOIST-AT ?auto_23446 ?auto_23459 ) ( AVAILABLE ?auto_23446 ) ( SURFACE-AT ?auto_23423 ?auto_23459 ) ( ON ?auto_23423 ?auto_23452 ) ( CLEAR ?auto_23423 ) ( not ( = ?auto_23422 ?auto_23423 ) ) ( not ( = ?auto_23422 ?auto_23452 ) ) ( not ( = ?auto_23423 ?auto_23452 ) ) ( not ( = ?auto_23427 ?auto_23446 ) ) ( IS-CRATE ?auto_23422 ) ( not ( = ?auto_23456 ?auto_23425 ) ) ( HOIST-AT ?auto_23438 ?auto_23456 ) ( AVAILABLE ?auto_23438 ) ( SURFACE-AT ?auto_23422 ?auto_23456 ) ( ON ?auto_23422 ?auto_23445 ) ( CLEAR ?auto_23422 ) ( not ( = ?auto_23421 ?auto_23422 ) ) ( not ( = ?auto_23421 ?auto_23445 ) ) ( not ( = ?auto_23422 ?auto_23445 ) ) ( not ( = ?auto_23427 ?auto_23438 ) ) ( IS-CRATE ?auto_23421 ) ( SURFACE-AT ?auto_23421 ?auto_23426 ) ( ON ?auto_23421 ?auto_23436 ) ( CLEAR ?auto_23421 ) ( not ( = ?auto_23420 ?auto_23421 ) ) ( not ( = ?auto_23420 ?auto_23436 ) ) ( not ( = ?auto_23421 ?auto_23436 ) ) ( IS-CRATE ?auto_23420 ) ( not ( = ?auto_23440 ?auto_23425 ) ) ( HOIST-AT ?auto_23441 ?auto_23440 ) ( AVAILABLE ?auto_23441 ) ( SURFACE-AT ?auto_23420 ?auto_23440 ) ( ON ?auto_23420 ?auto_23443 ) ( CLEAR ?auto_23420 ) ( not ( = ?auto_23419 ?auto_23420 ) ) ( not ( = ?auto_23419 ?auto_23443 ) ) ( not ( = ?auto_23420 ?auto_23443 ) ) ( not ( = ?auto_23427 ?auto_23441 ) ) ( IS-CRATE ?auto_23419 ) ( not ( = ?auto_23450 ?auto_23425 ) ) ( HOIST-AT ?auto_23439 ?auto_23450 ) ( AVAILABLE ?auto_23439 ) ( SURFACE-AT ?auto_23419 ?auto_23450 ) ( ON ?auto_23419 ?auto_23437 ) ( CLEAR ?auto_23419 ) ( not ( = ?auto_23418 ?auto_23419 ) ) ( not ( = ?auto_23418 ?auto_23437 ) ) ( not ( = ?auto_23419 ?auto_23437 ) ) ( not ( = ?auto_23427 ?auto_23439 ) ) ( IS-CRATE ?auto_23418 ) ( not ( = ?auto_23451 ?auto_23425 ) ) ( HOIST-AT ?auto_23442 ?auto_23451 ) ( AVAILABLE ?auto_23442 ) ( SURFACE-AT ?auto_23418 ?auto_23451 ) ( ON ?auto_23418 ?auto_23448 ) ( CLEAR ?auto_23418 ) ( not ( = ?auto_23417 ?auto_23418 ) ) ( not ( = ?auto_23417 ?auto_23448 ) ) ( not ( = ?auto_23418 ?auto_23448 ) ) ( not ( = ?auto_23427 ?auto_23442 ) ) ( IS-CRATE ?auto_23417 ) ( not ( = ?auto_23454 ?auto_23425 ) ) ( HOIST-AT ?auto_23462 ?auto_23454 ) ( AVAILABLE ?auto_23462 ) ( SURFACE-AT ?auto_23417 ?auto_23454 ) ( ON ?auto_23417 ?auto_23447 ) ( CLEAR ?auto_23417 ) ( not ( = ?auto_23416 ?auto_23417 ) ) ( not ( = ?auto_23416 ?auto_23447 ) ) ( not ( = ?auto_23417 ?auto_23447 ) ) ( not ( = ?auto_23427 ?auto_23462 ) ) ( IS-CRATE ?auto_23416 ) ( not ( = ?auto_23453 ?auto_23425 ) ) ( HOIST-AT ?auto_23431 ?auto_23453 ) ( AVAILABLE ?auto_23431 ) ( SURFACE-AT ?auto_23416 ?auto_23453 ) ( ON ?auto_23416 ?auto_23432 ) ( CLEAR ?auto_23416 ) ( not ( = ?auto_23415 ?auto_23416 ) ) ( not ( = ?auto_23415 ?auto_23432 ) ) ( not ( = ?auto_23416 ?auto_23432 ) ) ( not ( = ?auto_23427 ?auto_23431 ) ) ( IS-CRATE ?auto_23415 ) ( AVAILABLE ?auto_23430 ) ( SURFACE-AT ?auto_23415 ?auto_23426 ) ( ON ?auto_23415 ?auto_23444 ) ( CLEAR ?auto_23415 ) ( not ( = ?auto_23414 ?auto_23415 ) ) ( not ( = ?auto_23414 ?auto_23444 ) ) ( not ( = ?auto_23415 ?auto_23444 ) ) ( IS-CRATE ?auto_23414 ) ( not ( = ?auto_23458 ?auto_23425 ) ) ( HOIST-AT ?auto_23434 ?auto_23458 ) ( AVAILABLE ?auto_23434 ) ( SURFACE-AT ?auto_23414 ?auto_23458 ) ( ON ?auto_23414 ?auto_23449 ) ( CLEAR ?auto_23414 ) ( not ( = ?auto_23413 ?auto_23414 ) ) ( not ( = ?auto_23413 ?auto_23449 ) ) ( not ( = ?auto_23414 ?auto_23449 ) ) ( not ( = ?auto_23427 ?auto_23434 ) ) ( IS-CRATE ?auto_23413 ) ( not ( = ?auto_23460 ?auto_23425 ) ) ( HOIST-AT ?auto_23461 ?auto_23460 ) ( AVAILABLE ?auto_23461 ) ( SURFACE-AT ?auto_23413 ?auto_23460 ) ( ON ?auto_23413 ?auto_23435 ) ( CLEAR ?auto_23413 ) ( not ( = ?auto_23412 ?auto_23413 ) ) ( not ( = ?auto_23412 ?auto_23435 ) ) ( not ( = ?auto_23413 ?auto_23435 ) ) ( not ( = ?auto_23427 ?auto_23461 ) ) ( SURFACE-AT ?auto_23411 ?auto_23425 ) ( CLEAR ?auto_23411 ) ( IS-CRATE ?auto_23412 ) ( AVAILABLE ?auto_23427 ) ( not ( = ?auto_23455 ?auto_23425 ) ) ( HOIST-AT ?auto_23433 ?auto_23455 ) ( AVAILABLE ?auto_23433 ) ( SURFACE-AT ?auto_23412 ?auto_23455 ) ( ON ?auto_23412 ?auto_23457 ) ( CLEAR ?auto_23412 ) ( TRUCK-AT ?auto_23429 ?auto_23425 ) ( not ( = ?auto_23411 ?auto_23412 ) ) ( not ( = ?auto_23411 ?auto_23457 ) ) ( not ( = ?auto_23412 ?auto_23457 ) ) ( not ( = ?auto_23427 ?auto_23433 ) ) ( not ( = ?auto_23411 ?auto_23413 ) ) ( not ( = ?auto_23411 ?auto_23435 ) ) ( not ( = ?auto_23413 ?auto_23457 ) ) ( not ( = ?auto_23460 ?auto_23455 ) ) ( not ( = ?auto_23461 ?auto_23433 ) ) ( not ( = ?auto_23435 ?auto_23457 ) ) ( not ( = ?auto_23411 ?auto_23414 ) ) ( not ( = ?auto_23411 ?auto_23449 ) ) ( not ( = ?auto_23412 ?auto_23414 ) ) ( not ( = ?auto_23412 ?auto_23449 ) ) ( not ( = ?auto_23414 ?auto_23435 ) ) ( not ( = ?auto_23414 ?auto_23457 ) ) ( not ( = ?auto_23458 ?auto_23460 ) ) ( not ( = ?auto_23458 ?auto_23455 ) ) ( not ( = ?auto_23434 ?auto_23461 ) ) ( not ( = ?auto_23434 ?auto_23433 ) ) ( not ( = ?auto_23449 ?auto_23435 ) ) ( not ( = ?auto_23449 ?auto_23457 ) ) ( not ( = ?auto_23411 ?auto_23415 ) ) ( not ( = ?auto_23411 ?auto_23444 ) ) ( not ( = ?auto_23412 ?auto_23415 ) ) ( not ( = ?auto_23412 ?auto_23444 ) ) ( not ( = ?auto_23413 ?auto_23415 ) ) ( not ( = ?auto_23413 ?auto_23444 ) ) ( not ( = ?auto_23415 ?auto_23449 ) ) ( not ( = ?auto_23415 ?auto_23435 ) ) ( not ( = ?auto_23415 ?auto_23457 ) ) ( not ( = ?auto_23426 ?auto_23458 ) ) ( not ( = ?auto_23426 ?auto_23460 ) ) ( not ( = ?auto_23426 ?auto_23455 ) ) ( not ( = ?auto_23430 ?auto_23434 ) ) ( not ( = ?auto_23430 ?auto_23461 ) ) ( not ( = ?auto_23430 ?auto_23433 ) ) ( not ( = ?auto_23444 ?auto_23449 ) ) ( not ( = ?auto_23444 ?auto_23435 ) ) ( not ( = ?auto_23444 ?auto_23457 ) ) ( not ( = ?auto_23411 ?auto_23416 ) ) ( not ( = ?auto_23411 ?auto_23432 ) ) ( not ( = ?auto_23412 ?auto_23416 ) ) ( not ( = ?auto_23412 ?auto_23432 ) ) ( not ( = ?auto_23413 ?auto_23416 ) ) ( not ( = ?auto_23413 ?auto_23432 ) ) ( not ( = ?auto_23414 ?auto_23416 ) ) ( not ( = ?auto_23414 ?auto_23432 ) ) ( not ( = ?auto_23416 ?auto_23444 ) ) ( not ( = ?auto_23416 ?auto_23449 ) ) ( not ( = ?auto_23416 ?auto_23435 ) ) ( not ( = ?auto_23416 ?auto_23457 ) ) ( not ( = ?auto_23453 ?auto_23426 ) ) ( not ( = ?auto_23453 ?auto_23458 ) ) ( not ( = ?auto_23453 ?auto_23460 ) ) ( not ( = ?auto_23453 ?auto_23455 ) ) ( not ( = ?auto_23431 ?auto_23430 ) ) ( not ( = ?auto_23431 ?auto_23434 ) ) ( not ( = ?auto_23431 ?auto_23461 ) ) ( not ( = ?auto_23431 ?auto_23433 ) ) ( not ( = ?auto_23432 ?auto_23444 ) ) ( not ( = ?auto_23432 ?auto_23449 ) ) ( not ( = ?auto_23432 ?auto_23435 ) ) ( not ( = ?auto_23432 ?auto_23457 ) ) ( not ( = ?auto_23411 ?auto_23417 ) ) ( not ( = ?auto_23411 ?auto_23447 ) ) ( not ( = ?auto_23412 ?auto_23417 ) ) ( not ( = ?auto_23412 ?auto_23447 ) ) ( not ( = ?auto_23413 ?auto_23417 ) ) ( not ( = ?auto_23413 ?auto_23447 ) ) ( not ( = ?auto_23414 ?auto_23417 ) ) ( not ( = ?auto_23414 ?auto_23447 ) ) ( not ( = ?auto_23415 ?auto_23417 ) ) ( not ( = ?auto_23415 ?auto_23447 ) ) ( not ( = ?auto_23417 ?auto_23432 ) ) ( not ( = ?auto_23417 ?auto_23444 ) ) ( not ( = ?auto_23417 ?auto_23449 ) ) ( not ( = ?auto_23417 ?auto_23435 ) ) ( not ( = ?auto_23417 ?auto_23457 ) ) ( not ( = ?auto_23454 ?auto_23453 ) ) ( not ( = ?auto_23454 ?auto_23426 ) ) ( not ( = ?auto_23454 ?auto_23458 ) ) ( not ( = ?auto_23454 ?auto_23460 ) ) ( not ( = ?auto_23454 ?auto_23455 ) ) ( not ( = ?auto_23462 ?auto_23431 ) ) ( not ( = ?auto_23462 ?auto_23430 ) ) ( not ( = ?auto_23462 ?auto_23434 ) ) ( not ( = ?auto_23462 ?auto_23461 ) ) ( not ( = ?auto_23462 ?auto_23433 ) ) ( not ( = ?auto_23447 ?auto_23432 ) ) ( not ( = ?auto_23447 ?auto_23444 ) ) ( not ( = ?auto_23447 ?auto_23449 ) ) ( not ( = ?auto_23447 ?auto_23435 ) ) ( not ( = ?auto_23447 ?auto_23457 ) ) ( not ( = ?auto_23411 ?auto_23418 ) ) ( not ( = ?auto_23411 ?auto_23448 ) ) ( not ( = ?auto_23412 ?auto_23418 ) ) ( not ( = ?auto_23412 ?auto_23448 ) ) ( not ( = ?auto_23413 ?auto_23418 ) ) ( not ( = ?auto_23413 ?auto_23448 ) ) ( not ( = ?auto_23414 ?auto_23418 ) ) ( not ( = ?auto_23414 ?auto_23448 ) ) ( not ( = ?auto_23415 ?auto_23418 ) ) ( not ( = ?auto_23415 ?auto_23448 ) ) ( not ( = ?auto_23416 ?auto_23418 ) ) ( not ( = ?auto_23416 ?auto_23448 ) ) ( not ( = ?auto_23418 ?auto_23447 ) ) ( not ( = ?auto_23418 ?auto_23432 ) ) ( not ( = ?auto_23418 ?auto_23444 ) ) ( not ( = ?auto_23418 ?auto_23449 ) ) ( not ( = ?auto_23418 ?auto_23435 ) ) ( not ( = ?auto_23418 ?auto_23457 ) ) ( not ( = ?auto_23451 ?auto_23454 ) ) ( not ( = ?auto_23451 ?auto_23453 ) ) ( not ( = ?auto_23451 ?auto_23426 ) ) ( not ( = ?auto_23451 ?auto_23458 ) ) ( not ( = ?auto_23451 ?auto_23460 ) ) ( not ( = ?auto_23451 ?auto_23455 ) ) ( not ( = ?auto_23442 ?auto_23462 ) ) ( not ( = ?auto_23442 ?auto_23431 ) ) ( not ( = ?auto_23442 ?auto_23430 ) ) ( not ( = ?auto_23442 ?auto_23434 ) ) ( not ( = ?auto_23442 ?auto_23461 ) ) ( not ( = ?auto_23442 ?auto_23433 ) ) ( not ( = ?auto_23448 ?auto_23447 ) ) ( not ( = ?auto_23448 ?auto_23432 ) ) ( not ( = ?auto_23448 ?auto_23444 ) ) ( not ( = ?auto_23448 ?auto_23449 ) ) ( not ( = ?auto_23448 ?auto_23435 ) ) ( not ( = ?auto_23448 ?auto_23457 ) ) ( not ( = ?auto_23411 ?auto_23419 ) ) ( not ( = ?auto_23411 ?auto_23437 ) ) ( not ( = ?auto_23412 ?auto_23419 ) ) ( not ( = ?auto_23412 ?auto_23437 ) ) ( not ( = ?auto_23413 ?auto_23419 ) ) ( not ( = ?auto_23413 ?auto_23437 ) ) ( not ( = ?auto_23414 ?auto_23419 ) ) ( not ( = ?auto_23414 ?auto_23437 ) ) ( not ( = ?auto_23415 ?auto_23419 ) ) ( not ( = ?auto_23415 ?auto_23437 ) ) ( not ( = ?auto_23416 ?auto_23419 ) ) ( not ( = ?auto_23416 ?auto_23437 ) ) ( not ( = ?auto_23417 ?auto_23419 ) ) ( not ( = ?auto_23417 ?auto_23437 ) ) ( not ( = ?auto_23419 ?auto_23448 ) ) ( not ( = ?auto_23419 ?auto_23447 ) ) ( not ( = ?auto_23419 ?auto_23432 ) ) ( not ( = ?auto_23419 ?auto_23444 ) ) ( not ( = ?auto_23419 ?auto_23449 ) ) ( not ( = ?auto_23419 ?auto_23435 ) ) ( not ( = ?auto_23419 ?auto_23457 ) ) ( not ( = ?auto_23450 ?auto_23451 ) ) ( not ( = ?auto_23450 ?auto_23454 ) ) ( not ( = ?auto_23450 ?auto_23453 ) ) ( not ( = ?auto_23450 ?auto_23426 ) ) ( not ( = ?auto_23450 ?auto_23458 ) ) ( not ( = ?auto_23450 ?auto_23460 ) ) ( not ( = ?auto_23450 ?auto_23455 ) ) ( not ( = ?auto_23439 ?auto_23442 ) ) ( not ( = ?auto_23439 ?auto_23462 ) ) ( not ( = ?auto_23439 ?auto_23431 ) ) ( not ( = ?auto_23439 ?auto_23430 ) ) ( not ( = ?auto_23439 ?auto_23434 ) ) ( not ( = ?auto_23439 ?auto_23461 ) ) ( not ( = ?auto_23439 ?auto_23433 ) ) ( not ( = ?auto_23437 ?auto_23448 ) ) ( not ( = ?auto_23437 ?auto_23447 ) ) ( not ( = ?auto_23437 ?auto_23432 ) ) ( not ( = ?auto_23437 ?auto_23444 ) ) ( not ( = ?auto_23437 ?auto_23449 ) ) ( not ( = ?auto_23437 ?auto_23435 ) ) ( not ( = ?auto_23437 ?auto_23457 ) ) ( not ( = ?auto_23411 ?auto_23420 ) ) ( not ( = ?auto_23411 ?auto_23443 ) ) ( not ( = ?auto_23412 ?auto_23420 ) ) ( not ( = ?auto_23412 ?auto_23443 ) ) ( not ( = ?auto_23413 ?auto_23420 ) ) ( not ( = ?auto_23413 ?auto_23443 ) ) ( not ( = ?auto_23414 ?auto_23420 ) ) ( not ( = ?auto_23414 ?auto_23443 ) ) ( not ( = ?auto_23415 ?auto_23420 ) ) ( not ( = ?auto_23415 ?auto_23443 ) ) ( not ( = ?auto_23416 ?auto_23420 ) ) ( not ( = ?auto_23416 ?auto_23443 ) ) ( not ( = ?auto_23417 ?auto_23420 ) ) ( not ( = ?auto_23417 ?auto_23443 ) ) ( not ( = ?auto_23418 ?auto_23420 ) ) ( not ( = ?auto_23418 ?auto_23443 ) ) ( not ( = ?auto_23420 ?auto_23437 ) ) ( not ( = ?auto_23420 ?auto_23448 ) ) ( not ( = ?auto_23420 ?auto_23447 ) ) ( not ( = ?auto_23420 ?auto_23432 ) ) ( not ( = ?auto_23420 ?auto_23444 ) ) ( not ( = ?auto_23420 ?auto_23449 ) ) ( not ( = ?auto_23420 ?auto_23435 ) ) ( not ( = ?auto_23420 ?auto_23457 ) ) ( not ( = ?auto_23440 ?auto_23450 ) ) ( not ( = ?auto_23440 ?auto_23451 ) ) ( not ( = ?auto_23440 ?auto_23454 ) ) ( not ( = ?auto_23440 ?auto_23453 ) ) ( not ( = ?auto_23440 ?auto_23426 ) ) ( not ( = ?auto_23440 ?auto_23458 ) ) ( not ( = ?auto_23440 ?auto_23460 ) ) ( not ( = ?auto_23440 ?auto_23455 ) ) ( not ( = ?auto_23441 ?auto_23439 ) ) ( not ( = ?auto_23441 ?auto_23442 ) ) ( not ( = ?auto_23441 ?auto_23462 ) ) ( not ( = ?auto_23441 ?auto_23431 ) ) ( not ( = ?auto_23441 ?auto_23430 ) ) ( not ( = ?auto_23441 ?auto_23434 ) ) ( not ( = ?auto_23441 ?auto_23461 ) ) ( not ( = ?auto_23441 ?auto_23433 ) ) ( not ( = ?auto_23443 ?auto_23437 ) ) ( not ( = ?auto_23443 ?auto_23448 ) ) ( not ( = ?auto_23443 ?auto_23447 ) ) ( not ( = ?auto_23443 ?auto_23432 ) ) ( not ( = ?auto_23443 ?auto_23444 ) ) ( not ( = ?auto_23443 ?auto_23449 ) ) ( not ( = ?auto_23443 ?auto_23435 ) ) ( not ( = ?auto_23443 ?auto_23457 ) ) ( not ( = ?auto_23411 ?auto_23421 ) ) ( not ( = ?auto_23411 ?auto_23436 ) ) ( not ( = ?auto_23412 ?auto_23421 ) ) ( not ( = ?auto_23412 ?auto_23436 ) ) ( not ( = ?auto_23413 ?auto_23421 ) ) ( not ( = ?auto_23413 ?auto_23436 ) ) ( not ( = ?auto_23414 ?auto_23421 ) ) ( not ( = ?auto_23414 ?auto_23436 ) ) ( not ( = ?auto_23415 ?auto_23421 ) ) ( not ( = ?auto_23415 ?auto_23436 ) ) ( not ( = ?auto_23416 ?auto_23421 ) ) ( not ( = ?auto_23416 ?auto_23436 ) ) ( not ( = ?auto_23417 ?auto_23421 ) ) ( not ( = ?auto_23417 ?auto_23436 ) ) ( not ( = ?auto_23418 ?auto_23421 ) ) ( not ( = ?auto_23418 ?auto_23436 ) ) ( not ( = ?auto_23419 ?auto_23421 ) ) ( not ( = ?auto_23419 ?auto_23436 ) ) ( not ( = ?auto_23421 ?auto_23443 ) ) ( not ( = ?auto_23421 ?auto_23437 ) ) ( not ( = ?auto_23421 ?auto_23448 ) ) ( not ( = ?auto_23421 ?auto_23447 ) ) ( not ( = ?auto_23421 ?auto_23432 ) ) ( not ( = ?auto_23421 ?auto_23444 ) ) ( not ( = ?auto_23421 ?auto_23449 ) ) ( not ( = ?auto_23421 ?auto_23435 ) ) ( not ( = ?auto_23421 ?auto_23457 ) ) ( not ( = ?auto_23436 ?auto_23443 ) ) ( not ( = ?auto_23436 ?auto_23437 ) ) ( not ( = ?auto_23436 ?auto_23448 ) ) ( not ( = ?auto_23436 ?auto_23447 ) ) ( not ( = ?auto_23436 ?auto_23432 ) ) ( not ( = ?auto_23436 ?auto_23444 ) ) ( not ( = ?auto_23436 ?auto_23449 ) ) ( not ( = ?auto_23436 ?auto_23435 ) ) ( not ( = ?auto_23436 ?auto_23457 ) ) ( not ( = ?auto_23411 ?auto_23422 ) ) ( not ( = ?auto_23411 ?auto_23445 ) ) ( not ( = ?auto_23412 ?auto_23422 ) ) ( not ( = ?auto_23412 ?auto_23445 ) ) ( not ( = ?auto_23413 ?auto_23422 ) ) ( not ( = ?auto_23413 ?auto_23445 ) ) ( not ( = ?auto_23414 ?auto_23422 ) ) ( not ( = ?auto_23414 ?auto_23445 ) ) ( not ( = ?auto_23415 ?auto_23422 ) ) ( not ( = ?auto_23415 ?auto_23445 ) ) ( not ( = ?auto_23416 ?auto_23422 ) ) ( not ( = ?auto_23416 ?auto_23445 ) ) ( not ( = ?auto_23417 ?auto_23422 ) ) ( not ( = ?auto_23417 ?auto_23445 ) ) ( not ( = ?auto_23418 ?auto_23422 ) ) ( not ( = ?auto_23418 ?auto_23445 ) ) ( not ( = ?auto_23419 ?auto_23422 ) ) ( not ( = ?auto_23419 ?auto_23445 ) ) ( not ( = ?auto_23420 ?auto_23422 ) ) ( not ( = ?auto_23420 ?auto_23445 ) ) ( not ( = ?auto_23422 ?auto_23436 ) ) ( not ( = ?auto_23422 ?auto_23443 ) ) ( not ( = ?auto_23422 ?auto_23437 ) ) ( not ( = ?auto_23422 ?auto_23448 ) ) ( not ( = ?auto_23422 ?auto_23447 ) ) ( not ( = ?auto_23422 ?auto_23432 ) ) ( not ( = ?auto_23422 ?auto_23444 ) ) ( not ( = ?auto_23422 ?auto_23449 ) ) ( not ( = ?auto_23422 ?auto_23435 ) ) ( not ( = ?auto_23422 ?auto_23457 ) ) ( not ( = ?auto_23456 ?auto_23426 ) ) ( not ( = ?auto_23456 ?auto_23440 ) ) ( not ( = ?auto_23456 ?auto_23450 ) ) ( not ( = ?auto_23456 ?auto_23451 ) ) ( not ( = ?auto_23456 ?auto_23454 ) ) ( not ( = ?auto_23456 ?auto_23453 ) ) ( not ( = ?auto_23456 ?auto_23458 ) ) ( not ( = ?auto_23456 ?auto_23460 ) ) ( not ( = ?auto_23456 ?auto_23455 ) ) ( not ( = ?auto_23438 ?auto_23430 ) ) ( not ( = ?auto_23438 ?auto_23441 ) ) ( not ( = ?auto_23438 ?auto_23439 ) ) ( not ( = ?auto_23438 ?auto_23442 ) ) ( not ( = ?auto_23438 ?auto_23462 ) ) ( not ( = ?auto_23438 ?auto_23431 ) ) ( not ( = ?auto_23438 ?auto_23434 ) ) ( not ( = ?auto_23438 ?auto_23461 ) ) ( not ( = ?auto_23438 ?auto_23433 ) ) ( not ( = ?auto_23445 ?auto_23436 ) ) ( not ( = ?auto_23445 ?auto_23443 ) ) ( not ( = ?auto_23445 ?auto_23437 ) ) ( not ( = ?auto_23445 ?auto_23448 ) ) ( not ( = ?auto_23445 ?auto_23447 ) ) ( not ( = ?auto_23445 ?auto_23432 ) ) ( not ( = ?auto_23445 ?auto_23444 ) ) ( not ( = ?auto_23445 ?auto_23449 ) ) ( not ( = ?auto_23445 ?auto_23435 ) ) ( not ( = ?auto_23445 ?auto_23457 ) ) ( not ( = ?auto_23411 ?auto_23423 ) ) ( not ( = ?auto_23411 ?auto_23452 ) ) ( not ( = ?auto_23412 ?auto_23423 ) ) ( not ( = ?auto_23412 ?auto_23452 ) ) ( not ( = ?auto_23413 ?auto_23423 ) ) ( not ( = ?auto_23413 ?auto_23452 ) ) ( not ( = ?auto_23414 ?auto_23423 ) ) ( not ( = ?auto_23414 ?auto_23452 ) ) ( not ( = ?auto_23415 ?auto_23423 ) ) ( not ( = ?auto_23415 ?auto_23452 ) ) ( not ( = ?auto_23416 ?auto_23423 ) ) ( not ( = ?auto_23416 ?auto_23452 ) ) ( not ( = ?auto_23417 ?auto_23423 ) ) ( not ( = ?auto_23417 ?auto_23452 ) ) ( not ( = ?auto_23418 ?auto_23423 ) ) ( not ( = ?auto_23418 ?auto_23452 ) ) ( not ( = ?auto_23419 ?auto_23423 ) ) ( not ( = ?auto_23419 ?auto_23452 ) ) ( not ( = ?auto_23420 ?auto_23423 ) ) ( not ( = ?auto_23420 ?auto_23452 ) ) ( not ( = ?auto_23421 ?auto_23423 ) ) ( not ( = ?auto_23421 ?auto_23452 ) ) ( not ( = ?auto_23423 ?auto_23445 ) ) ( not ( = ?auto_23423 ?auto_23436 ) ) ( not ( = ?auto_23423 ?auto_23443 ) ) ( not ( = ?auto_23423 ?auto_23437 ) ) ( not ( = ?auto_23423 ?auto_23448 ) ) ( not ( = ?auto_23423 ?auto_23447 ) ) ( not ( = ?auto_23423 ?auto_23432 ) ) ( not ( = ?auto_23423 ?auto_23444 ) ) ( not ( = ?auto_23423 ?auto_23449 ) ) ( not ( = ?auto_23423 ?auto_23435 ) ) ( not ( = ?auto_23423 ?auto_23457 ) ) ( not ( = ?auto_23459 ?auto_23456 ) ) ( not ( = ?auto_23459 ?auto_23426 ) ) ( not ( = ?auto_23459 ?auto_23440 ) ) ( not ( = ?auto_23459 ?auto_23450 ) ) ( not ( = ?auto_23459 ?auto_23451 ) ) ( not ( = ?auto_23459 ?auto_23454 ) ) ( not ( = ?auto_23459 ?auto_23453 ) ) ( not ( = ?auto_23459 ?auto_23458 ) ) ( not ( = ?auto_23459 ?auto_23460 ) ) ( not ( = ?auto_23459 ?auto_23455 ) ) ( not ( = ?auto_23446 ?auto_23438 ) ) ( not ( = ?auto_23446 ?auto_23430 ) ) ( not ( = ?auto_23446 ?auto_23441 ) ) ( not ( = ?auto_23446 ?auto_23439 ) ) ( not ( = ?auto_23446 ?auto_23442 ) ) ( not ( = ?auto_23446 ?auto_23462 ) ) ( not ( = ?auto_23446 ?auto_23431 ) ) ( not ( = ?auto_23446 ?auto_23434 ) ) ( not ( = ?auto_23446 ?auto_23461 ) ) ( not ( = ?auto_23446 ?auto_23433 ) ) ( not ( = ?auto_23452 ?auto_23445 ) ) ( not ( = ?auto_23452 ?auto_23436 ) ) ( not ( = ?auto_23452 ?auto_23443 ) ) ( not ( = ?auto_23452 ?auto_23437 ) ) ( not ( = ?auto_23452 ?auto_23448 ) ) ( not ( = ?auto_23452 ?auto_23447 ) ) ( not ( = ?auto_23452 ?auto_23432 ) ) ( not ( = ?auto_23452 ?auto_23444 ) ) ( not ( = ?auto_23452 ?auto_23449 ) ) ( not ( = ?auto_23452 ?auto_23435 ) ) ( not ( = ?auto_23452 ?auto_23457 ) ) ( not ( = ?auto_23411 ?auto_23424 ) ) ( not ( = ?auto_23411 ?auto_23428 ) ) ( not ( = ?auto_23412 ?auto_23424 ) ) ( not ( = ?auto_23412 ?auto_23428 ) ) ( not ( = ?auto_23413 ?auto_23424 ) ) ( not ( = ?auto_23413 ?auto_23428 ) ) ( not ( = ?auto_23414 ?auto_23424 ) ) ( not ( = ?auto_23414 ?auto_23428 ) ) ( not ( = ?auto_23415 ?auto_23424 ) ) ( not ( = ?auto_23415 ?auto_23428 ) ) ( not ( = ?auto_23416 ?auto_23424 ) ) ( not ( = ?auto_23416 ?auto_23428 ) ) ( not ( = ?auto_23417 ?auto_23424 ) ) ( not ( = ?auto_23417 ?auto_23428 ) ) ( not ( = ?auto_23418 ?auto_23424 ) ) ( not ( = ?auto_23418 ?auto_23428 ) ) ( not ( = ?auto_23419 ?auto_23424 ) ) ( not ( = ?auto_23419 ?auto_23428 ) ) ( not ( = ?auto_23420 ?auto_23424 ) ) ( not ( = ?auto_23420 ?auto_23428 ) ) ( not ( = ?auto_23421 ?auto_23424 ) ) ( not ( = ?auto_23421 ?auto_23428 ) ) ( not ( = ?auto_23422 ?auto_23424 ) ) ( not ( = ?auto_23422 ?auto_23428 ) ) ( not ( = ?auto_23424 ?auto_23452 ) ) ( not ( = ?auto_23424 ?auto_23445 ) ) ( not ( = ?auto_23424 ?auto_23436 ) ) ( not ( = ?auto_23424 ?auto_23443 ) ) ( not ( = ?auto_23424 ?auto_23437 ) ) ( not ( = ?auto_23424 ?auto_23448 ) ) ( not ( = ?auto_23424 ?auto_23447 ) ) ( not ( = ?auto_23424 ?auto_23432 ) ) ( not ( = ?auto_23424 ?auto_23444 ) ) ( not ( = ?auto_23424 ?auto_23449 ) ) ( not ( = ?auto_23424 ?auto_23435 ) ) ( not ( = ?auto_23424 ?auto_23457 ) ) ( not ( = ?auto_23428 ?auto_23452 ) ) ( not ( = ?auto_23428 ?auto_23445 ) ) ( not ( = ?auto_23428 ?auto_23436 ) ) ( not ( = ?auto_23428 ?auto_23443 ) ) ( not ( = ?auto_23428 ?auto_23437 ) ) ( not ( = ?auto_23428 ?auto_23448 ) ) ( not ( = ?auto_23428 ?auto_23447 ) ) ( not ( = ?auto_23428 ?auto_23432 ) ) ( not ( = ?auto_23428 ?auto_23444 ) ) ( not ( = ?auto_23428 ?auto_23449 ) ) ( not ( = ?auto_23428 ?auto_23435 ) ) ( not ( = ?auto_23428 ?auto_23457 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_23411 ?auto_23412 ?auto_23413 ?auto_23414 ?auto_23415 ?auto_23416 ?auto_23417 ?auto_23418 ?auto_23419 ?auto_23420 ?auto_23421 ?auto_23422 ?auto_23423 )
      ( MAKE-1CRATE ?auto_23423 ?auto_23424 )
      ( MAKE-13CRATE-VERIFY ?auto_23411 ?auto_23412 ?auto_23413 ?auto_23414 ?auto_23415 ?auto_23416 ?auto_23417 ?auto_23418 ?auto_23419 ?auto_23420 ?auto_23421 ?auto_23422 ?auto_23423 ?auto_23424 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_23488 - SURFACE
      ?auto_23489 - SURFACE
      ?auto_23490 - SURFACE
      ?auto_23491 - SURFACE
      ?auto_23492 - SURFACE
      ?auto_23493 - SURFACE
      ?auto_23494 - SURFACE
      ?auto_23495 - SURFACE
      ?auto_23496 - SURFACE
      ?auto_23497 - SURFACE
      ?auto_23498 - SURFACE
      ?auto_23499 - SURFACE
      ?auto_23500 - SURFACE
      ?auto_23501 - SURFACE
      ?auto_23502 - SURFACE
    )
    :vars
    (
      ?auto_23503 - HOIST
      ?auto_23506 - PLACE
      ?auto_23507 - PLACE
      ?auto_23505 - HOIST
      ?auto_23508 - SURFACE
      ?auto_23534 - PLACE
      ?auto_23529 - HOIST
      ?auto_23517 - SURFACE
      ?auto_23525 - PLACE
      ?auto_23519 - HOIST
      ?auto_23516 - SURFACE
      ?auto_23512 - PLACE
      ?auto_23511 - HOIST
      ?auto_23509 - SURFACE
      ?auto_23510 - SURFACE
      ?auto_23530 - PLACE
      ?auto_23521 - HOIST
      ?auto_23520 - SURFACE
      ?auto_23523 - PLACE
      ?auto_23532 - HOIST
      ?auto_23533 - SURFACE
      ?auto_23535 - PLACE
      ?auto_23542 - HOIST
      ?auto_23522 - SURFACE
      ?auto_23531 - PLACE
      ?auto_23528 - HOIST
      ?auto_23518 - SURFACE
      ?auto_23524 - PLACE
      ?auto_23540 - HOIST
      ?auto_23527 - SURFACE
      ?auto_23543 - SURFACE
      ?auto_23515 - PLACE
      ?auto_23526 - HOIST
      ?auto_23539 - SURFACE
      ?auto_23513 - PLACE
      ?auto_23538 - HOIST
      ?auto_23541 - SURFACE
      ?auto_23514 - PLACE
      ?auto_23536 - HOIST
      ?auto_23537 - SURFACE
      ?auto_23504 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23503 ?auto_23506 ) ( IS-CRATE ?auto_23502 ) ( not ( = ?auto_23507 ?auto_23506 ) ) ( HOIST-AT ?auto_23505 ?auto_23507 ) ( AVAILABLE ?auto_23505 ) ( SURFACE-AT ?auto_23502 ?auto_23507 ) ( ON ?auto_23502 ?auto_23508 ) ( CLEAR ?auto_23502 ) ( not ( = ?auto_23501 ?auto_23502 ) ) ( not ( = ?auto_23501 ?auto_23508 ) ) ( not ( = ?auto_23502 ?auto_23508 ) ) ( not ( = ?auto_23503 ?auto_23505 ) ) ( IS-CRATE ?auto_23501 ) ( not ( = ?auto_23534 ?auto_23506 ) ) ( HOIST-AT ?auto_23529 ?auto_23534 ) ( SURFACE-AT ?auto_23501 ?auto_23534 ) ( ON ?auto_23501 ?auto_23517 ) ( CLEAR ?auto_23501 ) ( not ( = ?auto_23500 ?auto_23501 ) ) ( not ( = ?auto_23500 ?auto_23517 ) ) ( not ( = ?auto_23501 ?auto_23517 ) ) ( not ( = ?auto_23503 ?auto_23529 ) ) ( IS-CRATE ?auto_23500 ) ( not ( = ?auto_23525 ?auto_23506 ) ) ( HOIST-AT ?auto_23519 ?auto_23525 ) ( AVAILABLE ?auto_23519 ) ( SURFACE-AT ?auto_23500 ?auto_23525 ) ( ON ?auto_23500 ?auto_23516 ) ( CLEAR ?auto_23500 ) ( not ( = ?auto_23499 ?auto_23500 ) ) ( not ( = ?auto_23499 ?auto_23516 ) ) ( not ( = ?auto_23500 ?auto_23516 ) ) ( not ( = ?auto_23503 ?auto_23519 ) ) ( IS-CRATE ?auto_23499 ) ( not ( = ?auto_23512 ?auto_23506 ) ) ( HOIST-AT ?auto_23511 ?auto_23512 ) ( AVAILABLE ?auto_23511 ) ( SURFACE-AT ?auto_23499 ?auto_23512 ) ( ON ?auto_23499 ?auto_23509 ) ( CLEAR ?auto_23499 ) ( not ( = ?auto_23498 ?auto_23499 ) ) ( not ( = ?auto_23498 ?auto_23509 ) ) ( not ( = ?auto_23499 ?auto_23509 ) ) ( not ( = ?auto_23503 ?auto_23511 ) ) ( IS-CRATE ?auto_23498 ) ( SURFACE-AT ?auto_23498 ?auto_23534 ) ( ON ?auto_23498 ?auto_23510 ) ( CLEAR ?auto_23498 ) ( not ( = ?auto_23497 ?auto_23498 ) ) ( not ( = ?auto_23497 ?auto_23510 ) ) ( not ( = ?auto_23498 ?auto_23510 ) ) ( IS-CRATE ?auto_23497 ) ( not ( = ?auto_23530 ?auto_23506 ) ) ( HOIST-AT ?auto_23521 ?auto_23530 ) ( AVAILABLE ?auto_23521 ) ( SURFACE-AT ?auto_23497 ?auto_23530 ) ( ON ?auto_23497 ?auto_23520 ) ( CLEAR ?auto_23497 ) ( not ( = ?auto_23496 ?auto_23497 ) ) ( not ( = ?auto_23496 ?auto_23520 ) ) ( not ( = ?auto_23497 ?auto_23520 ) ) ( not ( = ?auto_23503 ?auto_23521 ) ) ( IS-CRATE ?auto_23496 ) ( not ( = ?auto_23523 ?auto_23506 ) ) ( HOIST-AT ?auto_23532 ?auto_23523 ) ( AVAILABLE ?auto_23532 ) ( SURFACE-AT ?auto_23496 ?auto_23523 ) ( ON ?auto_23496 ?auto_23533 ) ( CLEAR ?auto_23496 ) ( not ( = ?auto_23495 ?auto_23496 ) ) ( not ( = ?auto_23495 ?auto_23533 ) ) ( not ( = ?auto_23496 ?auto_23533 ) ) ( not ( = ?auto_23503 ?auto_23532 ) ) ( IS-CRATE ?auto_23495 ) ( not ( = ?auto_23535 ?auto_23506 ) ) ( HOIST-AT ?auto_23542 ?auto_23535 ) ( AVAILABLE ?auto_23542 ) ( SURFACE-AT ?auto_23495 ?auto_23535 ) ( ON ?auto_23495 ?auto_23522 ) ( CLEAR ?auto_23495 ) ( not ( = ?auto_23494 ?auto_23495 ) ) ( not ( = ?auto_23494 ?auto_23522 ) ) ( not ( = ?auto_23495 ?auto_23522 ) ) ( not ( = ?auto_23503 ?auto_23542 ) ) ( IS-CRATE ?auto_23494 ) ( not ( = ?auto_23531 ?auto_23506 ) ) ( HOIST-AT ?auto_23528 ?auto_23531 ) ( AVAILABLE ?auto_23528 ) ( SURFACE-AT ?auto_23494 ?auto_23531 ) ( ON ?auto_23494 ?auto_23518 ) ( CLEAR ?auto_23494 ) ( not ( = ?auto_23493 ?auto_23494 ) ) ( not ( = ?auto_23493 ?auto_23518 ) ) ( not ( = ?auto_23494 ?auto_23518 ) ) ( not ( = ?auto_23503 ?auto_23528 ) ) ( IS-CRATE ?auto_23493 ) ( not ( = ?auto_23524 ?auto_23506 ) ) ( HOIST-AT ?auto_23540 ?auto_23524 ) ( AVAILABLE ?auto_23540 ) ( SURFACE-AT ?auto_23493 ?auto_23524 ) ( ON ?auto_23493 ?auto_23527 ) ( CLEAR ?auto_23493 ) ( not ( = ?auto_23492 ?auto_23493 ) ) ( not ( = ?auto_23492 ?auto_23527 ) ) ( not ( = ?auto_23493 ?auto_23527 ) ) ( not ( = ?auto_23503 ?auto_23540 ) ) ( IS-CRATE ?auto_23492 ) ( AVAILABLE ?auto_23529 ) ( SURFACE-AT ?auto_23492 ?auto_23534 ) ( ON ?auto_23492 ?auto_23543 ) ( CLEAR ?auto_23492 ) ( not ( = ?auto_23491 ?auto_23492 ) ) ( not ( = ?auto_23491 ?auto_23543 ) ) ( not ( = ?auto_23492 ?auto_23543 ) ) ( IS-CRATE ?auto_23491 ) ( not ( = ?auto_23515 ?auto_23506 ) ) ( HOIST-AT ?auto_23526 ?auto_23515 ) ( AVAILABLE ?auto_23526 ) ( SURFACE-AT ?auto_23491 ?auto_23515 ) ( ON ?auto_23491 ?auto_23539 ) ( CLEAR ?auto_23491 ) ( not ( = ?auto_23490 ?auto_23491 ) ) ( not ( = ?auto_23490 ?auto_23539 ) ) ( not ( = ?auto_23491 ?auto_23539 ) ) ( not ( = ?auto_23503 ?auto_23526 ) ) ( IS-CRATE ?auto_23490 ) ( not ( = ?auto_23513 ?auto_23506 ) ) ( HOIST-AT ?auto_23538 ?auto_23513 ) ( AVAILABLE ?auto_23538 ) ( SURFACE-AT ?auto_23490 ?auto_23513 ) ( ON ?auto_23490 ?auto_23541 ) ( CLEAR ?auto_23490 ) ( not ( = ?auto_23489 ?auto_23490 ) ) ( not ( = ?auto_23489 ?auto_23541 ) ) ( not ( = ?auto_23490 ?auto_23541 ) ) ( not ( = ?auto_23503 ?auto_23538 ) ) ( SURFACE-AT ?auto_23488 ?auto_23506 ) ( CLEAR ?auto_23488 ) ( IS-CRATE ?auto_23489 ) ( AVAILABLE ?auto_23503 ) ( not ( = ?auto_23514 ?auto_23506 ) ) ( HOIST-AT ?auto_23536 ?auto_23514 ) ( AVAILABLE ?auto_23536 ) ( SURFACE-AT ?auto_23489 ?auto_23514 ) ( ON ?auto_23489 ?auto_23537 ) ( CLEAR ?auto_23489 ) ( TRUCK-AT ?auto_23504 ?auto_23506 ) ( not ( = ?auto_23488 ?auto_23489 ) ) ( not ( = ?auto_23488 ?auto_23537 ) ) ( not ( = ?auto_23489 ?auto_23537 ) ) ( not ( = ?auto_23503 ?auto_23536 ) ) ( not ( = ?auto_23488 ?auto_23490 ) ) ( not ( = ?auto_23488 ?auto_23541 ) ) ( not ( = ?auto_23490 ?auto_23537 ) ) ( not ( = ?auto_23513 ?auto_23514 ) ) ( not ( = ?auto_23538 ?auto_23536 ) ) ( not ( = ?auto_23541 ?auto_23537 ) ) ( not ( = ?auto_23488 ?auto_23491 ) ) ( not ( = ?auto_23488 ?auto_23539 ) ) ( not ( = ?auto_23489 ?auto_23491 ) ) ( not ( = ?auto_23489 ?auto_23539 ) ) ( not ( = ?auto_23491 ?auto_23541 ) ) ( not ( = ?auto_23491 ?auto_23537 ) ) ( not ( = ?auto_23515 ?auto_23513 ) ) ( not ( = ?auto_23515 ?auto_23514 ) ) ( not ( = ?auto_23526 ?auto_23538 ) ) ( not ( = ?auto_23526 ?auto_23536 ) ) ( not ( = ?auto_23539 ?auto_23541 ) ) ( not ( = ?auto_23539 ?auto_23537 ) ) ( not ( = ?auto_23488 ?auto_23492 ) ) ( not ( = ?auto_23488 ?auto_23543 ) ) ( not ( = ?auto_23489 ?auto_23492 ) ) ( not ( = ?auto_23489 ?auto_23543 ) ) ( not ( = ?auto_23490 ?auto_23492 ) ) ( not ( = ?auto_23490 ?auto_23543 ) ) ( not ( = ?auto_23492 ?auto_23539 ) ) ( not ( = ?auto_23492 ?auto_23541 ) ) ( not ( = ?auto_23492 ?auto_23537 ) ) ( not ( = ?auto_23534 ?auto_23515 ) ) ( not ( = ?auto_23534 ?auto_23513 ) ) ( not ( = ?auto_23534 ?auto_23514 ) ) ( not ( = ?auto_23529 ?auto_23526 ) ) ( not ( = ?auto_23529 ?auto_23538 ) ) ( not ( = ?auto_23529 ?auto_23536 ) ) ( not ( = ?auto_23543 ?auto_23539 ) ) ( not ( = ?auto_23543 ?auto_23541 ) ) ( not ( = ?auto_23543 ?auto_23537 ) ) ( not ( = ?auto_23488 ?auto_23493 ) ) ( not ( = ?auto_23488 ?auto_23527 ) ) ( not ( = ?auto_23489 ?auto_23493 ) ) ( not ( = ?auto_23489 ?auto_23527 ) ) ( not ( = ?auto_23490 ?auto_23493 ) ) ( not ( = ?auto_23490 ?auto_23527 ) ) ( not ( = ?auto_23491 ?auto_23493 ) ) ( not ( = ?auto_23491 ?auto_23527 ) ) ( not ( = ?auto_23493 ?auto_23543 ) ) ( not ( = ?auto_23493 ?auto_23539 ) ) ( not ( = ?auto_23493 ?auto_23541 ) ) ( not ( = ?auto_23493 ?auto_23537 ) ) ( not ( = ?auto_23524 ?auto_23534 ) ) ( not ( = ?auto_23524 ?auto_23515 ) ) ( not ( = ?auto_23524 ?auto_23513 ) ) ( not ( = ?auto_23524 ?auto_23514 ) ) ( not ( = ?auto_23540 ?auto_23529 ) ) ( not ( = ?auto_23540 ?auto_23526 ) ) ( not ( = ?auto_23540 ?auto_23538 ) ) ( not ( = ?auto_23540 ?auto_23536 ) ) ( not ( = ?auto_23527 ?auto_23543 ) ) ( not ( = ?auto_23527 ?auto_23539 ) ) ( not ( = ?auto_23527 ?auto_23541 ) ) ( not ( = ?auto_23527 ?auto_23537 ) ) ( not ( = ?auto_23488 ?auto_23494 ) ) ( not ( = ?auto_23488 ?auto_23518 ) ) ( not ( = ?auto_23489 ?auto_23494 ) ) ( not ( = ?auto_23489 ?auto_23518 ) ) ( not ( = ?auto_23490 ?auto_23494 ) ) ( not ( = ?auto_23490 ?auto_23518 ) ) ( not ( = ?auto_23491 ?auto_23494 ) ) ( not ( = ?auto_23491 ?auto_23518 ) ) ( not ( = ?auto_23492 ?auto_23494 ) ) ( not ( = ?auto_23492 ?auto_23518 ) ) ( not ( = ?auto_23494 ?auto_23527 ) ) ( not ( = ?auto_23494 ?auto_23543 ) ) ( not ( = ?auto_23494 ?auto_23539 ) ) ( not ( = ?auto_23494 ?auto_23541 ) ) ( not ( = ?auto_23494 ?auto_23537 ) ) ( not ( = ?auto_23531 ?auto_23524 ) ) ( not ( = ?auto_23531 ?auto_23534 ) ) ( not ( = ?auto_23531 ?auto_23515 ) ) ( not ( = ?auto_23531 ?auto_23513 ) ) ( not ( = ?auto_23531 ?auto_23514 ) ) ( not ( = ?auto_23528 ?auto_23540 ) ) ( not ( = ?auto_23528 ?auto_23529 ) ) ( not ( = ?auto_23528 ?auto_23526 ) ) ( not ( = ?auto_23528 ?auto_23538 ) ) ( not ( = ?auto_23528 ?auto_23536 ) ) ( not ( = ?auto_23518 ?auto_23527 ) ) ( not ( = ?auto_23518 ?auto_23543 ) ) ( not ( = ?auto_23518 ?auto_23539 ) ) ( not ( = ?auto_23518 ?auto_23541 ) ) ( not ( = ?auto_23518 ?auto_23537 ) ) ( not ( = ?auto_23488 ?auto_23495 ) ) ( not ( = ?auto_23488 ?auto_23522 ) ) ( not ( = ?auto_23489 ?auto_23495 ) ) ( not ( = ?auto_23489 ?auto_23522 ) ) ( not ( = ?auto_23490 ?auto_23495 ) ) ( not ( = ?auto_23490 ?auto_23522 ) ) ( not ( = ?auto_23491 ?auto_23495 ) ) ( not ( = ?auto_23491 ?auto_23522 ) ) ( not ( = ?auto_23492 ?auto_23495 ) ) ( not ( = ?auto_23492 ?auto_23522 ) ) ( not ( = ?auto_23493 ?auto_23495 ) ) ( not ( = ?auto_23493 ?auto_23522 ) ) ( not ( = ?auto_23495 ?auto_23518 ) ) ( not ( = ?auto_23495 ?auto_23527 ) ) ( not ( = ?auto_23495 ?auto_23543 ) ) ( not ( = ?auto_23495 ?auto_23539 ) ) ( not ( = ?auto_23495 ?auto_23541 ) ) ( not ( = ?auto_23495 ?auto_23537 ) ) ( not ( = ?auto_23535 ?auto_23531 ) ) ( not ( = ?auto_23535 ?auto_23524 ) ) ( not ( = ?auto_23535 ?auto_23534 ) ) ( not ( = ?auto_23535 ?auto_23515 ) ) ( not ( = ?auto_23535 ?auto_23513 ) ) ( not ( = ?auto_23535 ?auto_23514 ) ) ( not ( = ?auto_23542 ?auto_23528 ) ) ( not ( = ?auto_23542 ?auto_23540 ) ) ( not ( = ?auto_23542 ?auto_23529 ) ) ( not ( = ?auto_23542 ?auto_23526 ) ) ( not ( = ?auto_23542 ?auto_23538 ) ) ( not ( = ?auto_23542 ?auto_23536 ) ) ( not ( = ?auto_23522 ?auto_23518 ) ) ( not ( = ?auto_23522 ?auto_23527 ) ) ( not ( = ?auto_23522 ?auto_23543 ) ) ( not ( = ?auto_23522 ?auto_23539 ) ) ( not ( = ?auto_23522 ?auto_23541 ) ) ( not ( = ?auto_23522 ?auto_23537 ) ) ( not ( = ?auto_23488 ?auto_23496 ) ) ( not ( = ?auto_23488 ?auto_23533 ) ) ( not ( = ?auto_23489 ?auto_23496 ) ) ( not ( = ?auto_23489 ?auto_23533 ) ) ( not ( = ?auto_23490 ?auto_23496 ) ) ( not ( = ?auto_23490 ?auto_23533 ) ) ( not ( = ?auto_23491 ?auto_23496 ) ) ( not ( = ?auto_23491 ?auto_23533 ) ) ( not ( = ?auto_23492 ?auto_23496 ) ) ( not ( = ?auto_23492 ?auto_23533 ) ) ( not ( = ?auto_23493 ?auto_23496 ) ) ( not ( = ?auto_23493 ?auto_23533 ) ) ( not ( = ?auto_23494 ?auto_23496 ) ) ( not ( = ?auto_23494 ?auto_23533 ) ) ( not ( = ?auto_23496 ?auto_23522 ) ) ( not ( = ?auto_23496 ?auto_23518 ) ) ( not ( = ?auto_23496 ?auto_23527 ) ) ( not ( = ?auto_23496 ?auto_23543 ) ) ( not ( = ?auto_23496 ?auto_23539 ) ) ( not ( = ?auto_23496 ?auto_23541 ) ) ( not ( = ?auto_23496 ?auto_23537 ) ) ( not ( = ?auto_23523 ?auto_23535 ) ) ( not ( = ?auto_23523 ?auto_23531 ) ) ( not ( = ?auto_23523 ?auto_23524 ) ) ( not ( = ?auto_23523 ?auto_23534 ) ) ( not ( = ?auto_23523 ?auto_23515 ) ) ( not ( = ?auto_23523 ?auto_23513 ) ) ( not ( = ?auto_23523 ?auto_23514 ) ) ( not ( = ?auto_23532 ?auto_23542 ) ) ( not ( = ?auto_23532 ?auto_23528 ) ) ( not ( = ?auto_23532 ?auto_23540 ) ) ( not ( = ?auto_23532 ?auto_23529 ) ) ( not ( = ?auto_23532 ?auto_23526 ) ) ( not ( = ?auto_23532 ?auto_23538 ) ) ( not ( = ?auto_23532 ?auto_23536 ) ) ( not ( = ?auto_23533 ?auto_23522 ) ) ( not ( = ?auto_23533 ?auto_23518 ) ) ( not ( = ?auto_23533 ?auto_23527 ) ) ( not ( = ?auto_23533 ?auto_23543 ) ) ( not ( = ?auto_23533 ?auto_23539 ) ) ( not ( = ?auto_23533 ?auto_23541 ) ) ( not ( = ?auto_23533 ?auto_23537 ) ) ( not ( = ?auto_23488 ?auto_23497 ) ) ( not ( = ?auto_23488 ?auto_23520 ) ) ( not ( = ?auto_23489 ?auto_23497 ) ) ( not ( = ?auto_23489 ?auto_23520 ) ) ( not ( = ?auto_23490 ?auto_23497 ) ) ( not ( = ?auto_23490 ?auto_23520 ) ) ( not ( = ?auto_23491 ?auto_23497 ) ) ( not ( = ?auto_23491 ?auto_23520 ) ) ( not ( = ?auto_23492 ?auto_23497 ) ) ( not ( = ?auto_23492 ?auto_23520 ) ) ( not ( = ?auto_23493 ?auto_23497 ) ) ( not ( = ?auto_23493 ?auto_23520 ) ) ( not ( = ?auto_23494 ?auto_23497 ) ) ( not ( = ?auto_23494 ?auto_23520 ) ) ( not ( = ?auto_23495 ?auto_23497 ) ) ( not ( = ?auto_23495 ?auto_23520 ) ) ( not ( = ?auto_23497 ?auto_23533 ) ) ( not ( = ?auto_23497 ?auto_23522 ) ) ( not ( = ?auto_23497 ?auto_23518 ) ) ( not ( = ?auto_23497 ?auto_23527 ) ) ( not ( = ?auto_23497 ?auto_23543 ) ) ( not ( = ?auto_23497 ?auto_23539 ) ) ( not ( = ?auto_23497 ?auto_23541 ) ) ( not ( = ?auto_23497 ?auto_23537 ) ) ( not ( = ?auto_23530 ?auto_23523 ) ) ( not ( = ?auto_23530 ?auto_23535 ) ) ( not ( = ?auto_23530 ?auto_23531 ) ) ( not ( = ?auto_23530 ?auto_23524 ) ) ( not ( = ?auto_23530 ?auto_23534 ) ) ( not ( = ?auto_23530 ?auto_23515 ) ) ( not ( = ?auto_23530 ?auto_23513 ) ) ( not ( = ?auto_23530 ?auto_23514 ) ) ( not ( = ?auto_23521 ?auto_23532 ) ) ( not ( = ?auto_23521 ?auto_23542 ) ) ( not ( = ?auto_23521 ?auto_23528 ) ) ( not ( = ?auto_23521 ?auto_23540 ) ) ( not ( = ?auto_23521 ?auto_23529 ) ) ( not ( = ?auto_23521 ?auto_23526 ) ) ( not ( = ?auto_23521 ?auto_23538 ) ) ( not ( = ?auto_23521 ?auto_23536 ) ) ( not ( = ?auto_23520 ?auto_23533 ) ) ( not ( = ?auto_23520 ?auto_23522 ) ) ( not ( = ?auto_23520 ?auto_23518 ) ) ( not ( = ?auto_23520 ?auto_23527 ) ) ( not ( = ?auto_23520 ?auto_23543 ) ) ( not ( = ?auto_23520 ?auto_23539 ) ) ( not ( = ?auto_23520 ?auto_23541 ) ) ( not ( = ?auto_23520 ?auto_23537 ) ) ( not ( = ?auto_23488 ?auto_23498 ) ) ( not ( = ?auto_23488 ?auto_23510 ) ) ( not ( = ?auto_23489 ?auto_23498 ) ) ( not ( = ?auto_23489 ?auto_23510 ) ) ( not ( = ?auto_23490 ?auto_23498 ) ) ( not ( = ?auto_23490 ?auto_23510 ) ) ( not ( = ?auto_23491 ?auto_23498 ) ) ( not ( = ?auto_23491 ?auto_23510 ) ) ( not ( = ?auto_23492 ?auto_23498 ) ) ( not ( = ?auto_23492 ?auto_23510 ) ) ( not ( = ?auto_23493 ?auto_23498 ) ) ( not ( = ?auto_23493 ?auto_23510 ) ) ( not ( = ?auto_23494 ?auto_23498 ) ) ( not ( = ?auto_23494 ?auto_23510 ) ) ( not ( = ?auto_23495 ?auto_23498 ) ) ( not ( = ?auto_23495 ?auto_23510 ) ) ( not ( = ?auto_23496 ?auto_23498 ) ) ( not ( = ?auto_23496 ?auto_23510 ) ) ( not ( = ?auto_23498 ?auto_23520 ) ) ( not ( = ?auto_23498 ?auto_23533 ) ) ( not ( = ?auto_23498 ?auto_23522 ) ) ( not ( = ?auto_23498 ?auto_23518 ) ) ( not ( = ?auto_23498 ?auto_23527 ) ) ( not ( = ?auto_23498 ?auto_23543 ) ) ( not ( = ?auto_23498 ?auto_23539 ) ) ( not ( = ?auto_23498 ?auto_23541 ) ) ( not ( = ?auto_23498 ?auto_23537 ) ) ( not ( = ?auto_23510 ?auto_23520 ) ) ( not ( = ?auto_23510 ?auto_23533 ) ) ( not ( = ?auto_23510 ?auto_23522 ) ) ( not ( = ?auto_23510 ?auto_23518 ) ) ( not ( = ?auto_23510 ?auto_23527 ) ) ( not ( = ?auto_23510 ?auto_23543 ) ) ( not ( = ?auto_23510 ?auto_23539 ) ) ( not ( = ?auto_23510 ?auto_23541 ) ) ( not ( = ?auto_23510 ?auto_23537 ) ) ( not ( = ?auto_23488 ?auto_23499 ) ) ( not ( = ?auto_23488 ?auto_23509 ) ) ( not ( = ?auto_23489 ?auto_23499 ) ) ( not ( = ?auto_23489 ?auto_23509 ) ) ( not ( = ?auto_23490 ?auto_23499 ) ) ( not ( = ?auto_23490 ?auto_23509 ) ) ( not ( = ?auto_23491 ?auto_23499 ) ) ( not ( = ?auto_23491 ?auto_23509 ) ) ( not ( = ?auto_23492 ?auto_23499 ) ) ( not ( = ?auto_23492 ?auto_23509 ) ) ( not ( = ?auto_23493 ?auto_23499 ) ) ( not ( = ?auto_23493 ?auto_23509 ) ) ( not ( = ?auto_23494 ?auto_23499 ) ) ( not ( = ?auto_23494 ?auto_23509 ) ) ( not ( = ?auto_23495 ?auto_23499 ) ) ( not ( = ?auto_23495 ?auto_23509 ) ) ( not ( = ?auto_23496 ?auto_23499 ) ) ( not ( = ?auto_23496 ?auto_23509 ) ) ( not ( = ?auto_23497 ?auto_23499 ) ) ( not ( = ?auto_23497 ?auto_23509 ) ) ( not ( = ?auto_23499 ?auto_23510 ) ) ( not ( = ?auto_23499 ?auto_23520 ) ) ( not ( = ?auto_23499 ?auto_23533 ) ) ( not ( = ?auto_23499 ?auto_23522 ) ) ( not ( = ?auto_23499 ?auto_23518 ) ) ( not ( = ?auto_23499 ?auto_23527 ) ) ( not ( = ?auto_23499 ?auto_23543 ) ) ( not ( = ?auto_23499 ?auto_23539 ) ) ( not ( = ?auto_23499 ?auto_23541 ) ) ( not ( = ?auto_23499 ?auto_23537 ) ) ( not ( = ?auto_23512 ?auto_23534 ) ) ( not ( = ?auto_23512 ?auto_23530 ) ) ( not ( = ?auto_23512 ?auto_23523 ) ) ( not ( = ?auto_23512 ?auto_23535 ) ) ( not ( = ?auto_23512 ?auto_23531 ) ) ( not ( = ?auto_23512 ?auto_23524 ) ) ( not ( = ?auto_23512 ?auto_23515 ) ) ( not ( = ?auto_23512 ?auto_23513 ) ) ( not ( = ?auto_23512 ?auto_23514 ) ) ( not ( = ?auto_23511 ?auto_23529 ) ) ( not ( = ?auto_23511 ?auto_23521 ) ) ( not ( = ?auto_23511 ?auto_23532 ) ) ( not ( = ?auto_23511 ?auto_23542 ) ) ( not ( = ?auto_23511 ?auto_23528 ) ) ( not ( = ?auto_23511 ?auto_23540 ) ) ( not ( = ?auto_23511 ?auto_23526 ) ) ( not ( = ?auto_23511 ?auto_23538 ) ) ( not ( = ?auto_23511 ?auto_23536 ) ) ( not ( = ?auto_23509 ?auto_23510 ) ) ( not ( = ?auto_23509 ?auto_23520 ) ) ( not ( = ?auto_23509 ?auto_23533 ) ) ( not ( = ?auto_23509 ?auto_23522 ) ) ( not ( = ?auto_23509 ?auto_23518 ) ) ( not ( = ?auto_23509 ?auto_23527 ) ) ( not ( = ?auto_23509 ?auto_23543 ) ) ( not ( = ?auto_23509 ?auto_23539 ) ) ( not ( = ?auto_23509 ?auto_23541 ) ) ( not ( = ?auto_23509 ?auto_23537 ) ) ( not ( = ?auto_23488 ?auto_23500 ) ) ( not ( = ?auto_23488 ?auto_23516 ) ) ( not ( = ?auto_23489 ?auto_23500 ) ) ( not ( = ?auto_23489 ?auto_23516 ) ) ( not ( = ?auto_23490 ?auto_23500 ) ) ( not ( = ?auto_23490 ?auto_23516 ) ) ( not ( = ?auto_23491 ?auto_23500 ) ) ( not ( = ?auto_23491 ?auto_23516 ) ) ( not ( = ?auto_23492 ?auto_23500 ) ) ( not ( = ?auto_23492 ?auto_23516 ) ) ( not ( = ?auto_23493 ?auto_23500 ) ) ( not ( = ?auto_23493 ?auto_23516 ) ) ( not ( = ?auto_23494 ?auto_23500 ) ) ( not ( = ?auto_23494 ?auto_23516 ) ) ( not ( = ?auto_23495 ?auto_23500 ) ) ( not ( = ?auto_23495 ?auto_23516 ) ) ( not ( = ?auto_23496 ?auto_23500 ) ) ( not ( = ?auto_23496 ?auto_23516 ) ) ( not ( = ?auto_23497 ?auto_23500 ) ) ( not ( = ?auto_23497 ?auto_23516 ) ) ( not ( = ?auto_23498 ?auto_23500 ) ) ( not ( = ?auto_23498 ?auto_23516 ) ) ( not ( = ?auto_23500 ?auto_23509 ) ) ( not ( = ?auto_23500 ?auto_23510 ) ) ( not ( = ?auto_23500 ?auto_23520 ) ) ( not ( = ?auto_23500 ?auto_23533 ) ) ( not ( = ?auto_23500 ?auto_23522 ) ) ( not ( = ?auto_23500 ?auto_23518 ) ) ( not ( = ?auto_23500 ?auto_23527 ) ) ( not ( = ?auto_23500 ?auto_23543 ) ) ( not ( = ?auto_23500 ?auto_23539 ) ) ( not ( = ?auto_23500 ?auto_23541 ) ) ( not ( = ?auto_23500 ?auto_23537 ) ) ( not ( = ?auto_23525 ?auto_23512 ) ) ( not ( = ?auto_23525 ?auto_23534 ) ) ( not ( = ?auto_23525 ?auto_23530 ) ) ( not ( = ?auto_23525 ?auto_23523 ) ) ( not ( = ?auto_23525 ?auto_23535 ) ) ( not ( = ?auto_23525 ?auto_23531 ) ) ( not ( = ?auto_23525 ?auto_23524 ) ) ( not ( = ?auto_23525 ?auto_23515 ) ) ( not ( = ?auto_23525 ?auto_23513 ) ) ( not ( = ?auto_23525 ?auto_23514 ) ) ( not ( = ?auto_23519 ?auto_23511 ) ) ( not ( = ?auto_23519 ?auto_23529 ) ) ( not ( = ?auto_23519 ?auto_23521 ) ) ( not ( = ?auto_23519 ?auto_23532 ) ) ( not ( = ?auto_23519 ?auto_23542 ) ) ( not ( = ?auto_23519 ?auto_23528 ) ) ( not ( = ?auto_23519 ?auto_23540 ) ) ( not ( = ?auto_23519 ?auto_23526 ) ) ( not ( = ?auto_23519 ?auto_23538 ) ) ( not ( = ?auto_23519 ?auto_23536 ) ) ( not ( = ?auto_23516 ?auto_23509 ) ) ( not ( = ?auto_23516 ?auto_23510 ) ) ( not ( = ?auto_23516 ?auto_23520 ) ) ( not ( = ?auto_23516 ?auto_23533 ) ) ( not ( = ?auto_23516 ?auto_23522 ) ) ( not ( = ?auto_23516 ?auto_23518 ) ) ( not ( = ?auto_23516 ?auto_23527 ) ) ( not ( = ?auto_23516 ?auto_23543 ) ) ( not ( = ?auto_23516 ?auto_23539 ) ) ( not ( = ?auto_23516 ?auto_23541 ) ) ( not ( = ?auto_23516 ?auto_23537 ) ) ( not ( = ?auto_23488 ?auto_23501 ) ) ( not ( = ?auto_23488 ?auto_23517 ) ) ( not ( = ?auto_23489 ?auto_23501 ) ) ( not ( = ?auto_23489 ?auto_23517 ) ) ( not ( = ?auto_23490 ?auto_23501 ) ) ( not ( = ?auto_23490 ?auto_23517 ) ) ( not ( = ?auto_23491 ?auto_23501 ) ) ( not ( = ?auto_23491 ?auto_23517 ) ) ( not ( = ?auto_23492 ?auto_23501 ) ) ( not ( = ?auto_23492 ?auto_23517 ) ) ( not ( = ?auto_23493 ?auto_23501 ) ) ( not ( = ?auto_23493 ?auto_23517 ) ) ( not ( = ?auto_23494 ?auto_23501 ) ) ( not ( = ?auto_23494 ?auto_23517 ) ) ( not ( = ?auto_23495 ?auto_23501 ) ) ( not ( = ?auto_23495 ?auto_23517 ) ) ( not ( = ?auto_23496 ?auto_23501 ) ) ( not ( = ?auto_23496 ?auto_23517 ) ) ( not ( = ?auto_23497 ?auto_23501 ) ) ( not ( = ?auto_23497 ?auto_23517 ) ) ( not ( = ?auto_23498 ?auto_23501 ) ) ( not ( = ?auto_23498 ?auto_23517 ) ) ( not ( = ?auto_23499 ?auto_23501 ) ) ( not ( = ?auto_23499 ?auto_23517 ) ) ( not ( = ?auto_23501 ?auto_23516 ) ) ( not ( = ?auto_23501 ?auto_23509 ) ) ( not ( = ?auto_23501 ?auto_23510 ) ) ( not ( = ?auto_23501 ?auto_23520 ) ) ( not ( = ?auto_23501 ?auto_23533 ) ) ( not ( = ?auto_23501 ?auto_23522 ) ) ( not ( = ?auto_23501 ?auto_23518 ) ) ( not ( = ?auto_23501 ?auto_23527 ) ) ( not ( = ?auto_23501 ?auto_23543 ) ) ( not ( = ?auto_23501 ?auto_23539 ) ) ( not ( = ?auto_23501 ?auto_23541 ) ) ( not ( = ?auto_23501 ?auto_23537 ) ) ( not ( = ?auto_23517 ?auto_23516 ) ) ( not ( = ?auto_23517 ?auto_23509 ) ) ( not ( = ?auto_23517 ?auto_23510 ) ) ( not ( = ?auto_23517 ?auto_23520 ) ) ( not ( = ?auto_23517 ?auto_23533 ) ) ( not ( = ?auto_23517 ?auto_23522 ) ) ( not ( = ?auto_23517 ?auto_23518 ) ) ( not ( = ?auto_23517 ?auto_23527 ) ) ( not ( = ?auto_23517 ?auto_23543 ) ) ( not ( = ?auto_23517 ?auto_23539 ) ) ( not ( = ?auto_23517 ?auto_23541 ) ) ( not ( = ?auto_23517 ?auto_23537 ) ) ( not ( = ?auto_23488 ?auto_23502 ) ) ( not ( = ?auto_23488 ?auto_23508 ) ) ( not ( = ?auto_23489 ?auto_23502 ) ) ( not ( = ?auto_23489 ?auto_23508 ) ) ( not ( = ?auto_23490 ?auto_23502 ) ) ( not ( = ?auto_23490 ?auto_23508 ) ) ( not ( = ?auto_23491 ?auto_23502 ) ) ( not ( = ?auto_23491 ?auto_23508 ) ) ( not ( = ?auto_23492 ?auto_23502 ) ) ( not ( = ?auto_23492 ?auto_23508 ) ) ( not ( = ?auto_23493 ?auto_23502 ) ) ( not ( = ?auto_23493 ?auto_23508 ) ) ( not ( = ?auto_23494 ?auto_23502 ) ) ( not ( = ?auto_23494 ?auto_23508 ) ) ( not ( = ?auto_23495 ?auto_23502 ) ) ( not ( = ?auto_23495 ?auto_23508 ) ) ( not ( = ?auto_23496 ?auto_23502 ) ) ( not ( = ?auto_23496 ?auto_23508 ) ) ( not ( = ?auto_23497 ?auto_23502 ) ) ( not ( = ?auto_23497 ?auto_23508 ) ) ( not ( = ?auto_23498 ?auto_23502 ) ) ( not ( = ?auto_23498 ?auto_23508 ) ) ( not ( = ?auto_23499 ?auto_23502 ) ) ( not ( = ?auto_23499 ?auto_23508 ) ) ( not ( = ?auto_23500 ?auto_23502 ) ) ( not ( = ?auto_23500 ?auto_23508 ) ) ( not ( = ?auto_23502 ?auto_23517 ) ) ( not ( = ?auto_23502 ?auto_23516 ) ) ( not ( = ?auto_23502 ?auto_23509 ) ) ( not ( = ?auto_23502 ?auto_23510 ) ) ( not ( = ?auto_23502 ?auto_23520 ) ) ( not ( = ?auto_23502 ?auto_23533 ) ) ( not ( = ?auto_23502 ?auto_23522 ) ) ( not ( = ?auto_23502 ?auto_23518 ) ) ( not ( = ?auto_23502 ?auto_23527 ) ) ( not ( = ?auto_23502 ?auto_23543 ) ) ( not ( = ?auto_23502 ?auto_23539 ) ) ( not ( = ?auto_23502 ?auto_23541 ) ) ( not ( = ?auto_23502 ?auto_23537 ) ) ( not ( = ?auto_23507 ?auto_23534 ) ) ( not ( = ?auto_23507 ?auto_23525 ) ) ( not ( = ?auto_23507 ?auto_23512 ) ) ( not ( = ?auto_23507 ?auto_23530 ) ) ( not ( = ?auto_23507 ?auto_23523 ) ) ( not ( = ?auto_23507 ?auto_23535 ) ) ( not ( = ?auto_23507 ?auto_23531 ) ) ( not ( = ?auto_23507 ?auto_23524 ) ) ( not ( = ?auto_23507 ?auto_23515 ) ) ( not ( = ?auto_23507 ?auto_23513 ) ) ( not ( = ?auto_23507 ?auto_23514 ) ) ( not ( = ?auto_23505 ?auto_23529 ) ) ( not ( = ?auto_23505 ?auto_23519 ) ) ( not ( = ?auto_23505 ?auto_23511 ) ) ( not ( = ?auto_23505 ?auto_23521 ) ) ( not ( = ?auto_23505 ?auto_23532 ) ) ( not ( = ?auto_23505 ?auto_23542 ) ) ( not ( = ?auto_23505 ?auto_23528 ) ) ( not ( = ?auto_23505 ?auto_23540 ) ) ( not ( = ?auto_23505 ?auto_23526 ) ) ( not ( = ?auto_23505 ?auto_23538 ) ) ( not ( = ?auto_23505 ?auto_23536 ) ) ( not ( = ?auto_23508 ?auto_23517 ) ) ( not ( = ?auto_23508 ?auto_23516 ) ) ( not ( = ?auto_23508 ?auto_23509 ) ) ( not ( = ?auto_23508 ?auto_23510 ) ) ( not ( = ?auto_23508 ?auto_23520 ) ) ( not ( = ?auto_23508 ?auto_23533 ) ) ( not ( = ?auto_23508 ?auto_23522 ) ) ( not ( = ?auto_23508 ?auto_23518 ) ) ( not ( = ?auto_23508 ?auto_23527 ) ) ( not ( = ?auto_23508 ?auto_23543 ) ) ( not ( = ?auto_23508 ?auto_23539 ) ) ( not ( = ?auto_23508 ?auto_23541 ) ) ( not ( = ?auto_23508 ?auto_23537 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_23488 ?auto_23489 ?auto_23490 ?auto_23491 ?auto_23492 ?auto_23493 ?auto_23494 ?auto_23495 ?auto_23496 ?auto_23497 ?auto_23498 ?auto_23499 ?auto_23500 ?auto_23501 )
      ( MAKE-1CRATE ?auto_23501 ?auto_23502 )
      ( MAKE-14CRATE-VERIFY ?auto_23488 ?auto_23489 ?auto_23490 ?auto_23491 ?auto_23492 ?auto_23493 ?auto_23494 ?auto_23495 ?auto_23496 ?auto_23497 ?auto_23498 ?auto_23499 ?auto_23500 ?auto_23501 ?auto_23502 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_23570 - SURFACE
      ?auto_23571 - SURFACE
      ?auto_23572 - SURFACE
      ?auto_23573 - SURFACE
      ?auto_23574 - SURFACE
      ?auto_23575 - SURFACE
      ?auto_23576 - SURFACE
      ?auto_23577 - SURFACE
      ?auto_23578 - SURFACE
      ?auto_23579 - SURFACE
      ?auto_23580 - SURFACE
      ?auto_23581 - SURFACE
      ?auto_23582 - SURFACE
      ?auto_23583 - SURFACE
      ?auto_23584 - SURFACE
      ?auto_23585 - SURFACE
    )
    :vars
    (
      ?auto_23588 - HOIST
      ?auto_23591 - PLACE
      ?auto_23586 - PLACE
      ?auto_23587 - HOIST
      ?auto_23589 - SURFACE
      ?auto_23597 - PLACE
      ?auto_23621 - HOIST
      ?auto_23613 - SURFACE
      ?auto_23612 - PLACE
      ?auto_23602 - HOIST
      ?auto_23610 - SURFACE
      ?auto_23617 - PLACE
      ?auto_23614 - HOIST
      ?auto_23624 - SURFACE
      ?auto_23600 - PLACE
      ?auto_23592 - HOIST
      ?auto_23607 - SURFACE
      ?auto_23608 - SURFACE
      ?auto_23595 - PLACE
      ?auto_23593 - HOIST
      ?auto_23604 - SURFACE
      ?auto_23596 - PLACE
      ?auto_23628 - HOIST
      ?auto_23622 - SURFACE
      ?auto_23606 - PLACE
      ?auto_23623 - HOIST
      ?auto_23620 - SURFACE
      ?auto_23629 - PLACE
      ?auto_23625 - HOIST
      ?auto_23626 - SURFACE
      ?auto_23599 - PLACE
      ?auto_23616 - HOIST
      ?auto_23601 - SURFACE
      ?auto_23611 - SURFACE
      ?auto_23609 - PLACE
      ?auto_23619 - HOIST
      ?auto_23615 - SURFACE
      ?auto_23594 - PLACE
      ?auto_23627 - HOIST
      ?auto_23603 - SURFACE
      ?auto_23598 - PLACE
      ?auto_23618 - HOIST
      ?auto_23605 - SURFACE
      ?auto_23590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23588 ?auto_23591 ) ( IS-CRATE ?auto_23585 ) ( not ( = ?auto_23586 ?auto_23591 ) ) ( HOIST-AT ?auto_23587 ?auto_23586 ) ( AVAILABLE ?auto_23587 ) ( SURFACE-AT ?auto_23585 ?auto_23586 ) ( ON ?auto_23585 ?auto_23589 ) ( CLEAR ?auto_23585 ) ( not ( = ?auto_23584 ?auto_23585 ) ) ( not ( = ?auto_23584 ?auto_23589 ) ) ( not ( = ?auto_23585 ?auto_23589 ) ) ( not ( = ?auto_23588 ?auto_23587 ) ) ( IS-CRATE ?auto_23584 ) ( not ( = ?auto_23597 ?auto_23591 ) ) ( HOIST-AT ?auto_23621 ?auto_23597 ) ( AVAILABLE ?auto_23621 ) ( SURFACE-AT ?auto_23584 ?auto_23597 ) ( ON ?auto_23584 ?auto_23613 ) ( CLEAR ?auto_23584 ) ( not ( = ?auto_23583 ?auto_23584 ) ) ( not ( = ?auto_23583 ?auto_23613 ) ) ( not ( = ?auto_23584 ?auto_23613 ) ) ( not ( = ?auto_23588 ?auto_23621 ) ) ( IS-CRATE ?auto_23583 ) ( not ( = ?auto_23612 ?auto_23591 ) ) ( HOIST-AT ?auto_23602 ?auto_23612 ) ( SURFACE-AT ?auto_23583 ?auto_23612 ) ( ON ?auto_23583 ?auto_23610 ) ( CLEAR ?auto_23583 ) ( not ( = ?auto_23582 ?auto_23583 ) ) ( not ( = ?auto_23582 ?auto_23610 ) ) ( not ( = ?auto_23583 ?auto_23610 ) ) ( not ( = ?auto_23588 ?auto_23602 ) ) ( IS-CRATE ?auto_23582 ) ( not ( = ?auto_23617 ?auto_23591 ) ) ( HOIST-AT ?auto_23614 ?auto_23617 ) ( AVAILABLE ?auto_23614 ) ( SURFACE-AT ?auto_23582 ?auto_23617 ) ( ON ?auto_23582 ?auto_23624 ) ( CLEAR ?auto_23582 ) ( not ( = ?auto_23581 ?auto_23582 ) ) ( not ( = ?auto_23581 ?auto_23624 ) ) ( not ( = ?auto_23582 ?auto_23624 ) ) ( not ( = ?auto_23588 ?auto_23614 ) ) ( IS-CRATE ?auto_23581 ) ( not ( = ?auto_23600 ?auto_23591 ) ) ( HOIST-AT ?auto_23592 ?auto_23600 ) ( AVAILABLE ?auto_23592 ) ( SURFACE-AT ?auto_23581 ?auto_23600 ) ( ON ?auto_23581 ?auto_23607 ) ( CLEAR ?auto_23581 ) ( not ( = ?auto_23580 ?auto_23581 ) ) ( not ( = ?auto_23580 ?auto_23607 ) ) ( not ( = ?auto_23581 ?auto_23607 ) ) ( not ( = ?auto_23588 ?auto_23592 ) ) ( IS-CRATE ?auto_23580 ) ( SURFACE-AT ?auto_23580 ?auto_23612 ) ( ON ?auto_23580 ?auto_23608 ) ( CLEAR ?auto_23580 ) ( not ( = ?auto_23579 ?auto_23580 ) ) ( not ( = ?auto_23579 ?auto_23608 ) ) ( not ( = ?auto_23580 ?auto_23608 ) ) ( IS-CRATE ?auto_23579 ) ( not ( = ?auto_23595 ?auto_23591 ) ) ( HOIST-AT ?auto_23593 ?auto_23595 ) ( AVAILABLE ?auto_23593 ) ( SURFACE-AT ?auto_23579 ?auto_23595 ) ( ON ?auto_23579 ?auto_23604 ) ( CLEAR ?auto_23579 ) ( not ( = ?auto_23578 ?auto_23579 ) ) ( not ( = ?auto_23578 ?auto_23604 ) ) ( not ( = ?auto_23579 ?auto_23604 ) ) ( not ( = ?auto_23588 ?auto_23593 ) ) ( IS-CRATE ?auto_23578 ) ( not ( = ?auto_23596 ?auto_23591 ) ) ( HOIST-AT ?auto_23628 ?auto_23596 ) ( AVAILABLE ?auto_23628 ) ( SURFACE-AT ?auto_23578 ?auto_23596 ) ( ON ?auto_23578 ?auto_23622 ) ( CLEAR ?auto_23578 ) ( not ( = ?auto_23577 ?auto_23578 ) ) ( not ( = ?auto_23577 ?auto_23622 ) ) ( not ( = ?auto_23578 ?auto_23622 ) ) ( not ( = ?auto_23588 ?auto_23628 ) ) ( IS-CRATE ?auto_23577 ) ( not ( = ?auto_23606 ?auto_23591 ) ) ( HOIST-AT ?auto_23623 ?auto_23606 ) ( AVAILABLE ?auto_23623 ) ( SURFACE-AT ?auto_23577 ?auto_23606 ) ( ON ?auto_23577 ?auto_23620 ) ( CLEAR ?auto_23577 ) ( not ( = ?auto_23576 ?auto_23577 ) ) ( not ( = ?auto_23576 ?auto_23620 ) ) ( not ( = ?auto_23577 ?auto_23620 ) ) ( not ( = ?auto_23588 ?auto_23623 ) ) ( IS-CRATE ?auto_23576 ) ( not ( = ?auto_23629 ?auto_23591 ) ) ( HOIST-AT ?auto_23625 ?auto_23629 ) ( AVAILABLE ?auto_23625 ) ( SURFACE-AT ?auto_23576 ?auto_23629 ) ( ON ?auto_23576 ?auto_23626 ) ( CLEAR ?auto_23576 ) ( not ( = ?auto_23575 ?auto_23576 ) ) ( not ( = ?auto_23575 ?auto_23626 ) ) ( not ( = ?auto_23576 ?auto_23626 ) ) ( not ( = ?auto_23588 ?auto_23625 ) ) ( IS-CRATE ?auto_23575 ) ( not ( = ?auto_23599 ?auto_23591 ) ) ( HOIST-AT ?auto_23616 ?auto_23599 ) ( AVAILABLE ?auto_23616 ) ( SURFACE-AT ?auto_23575 ?auto_23599 ) ( ON ?auto_23575 ?auto_23601 ) ( CLEAR ?auto_23575 ) ( not ( = ?auto_23574 ?auto_23575 ) ) ( not ( = ?auto_23574 ?auto_23601 ) ) ( not ( = ?auto_23575 ?auto_23601 ) ) ( not ( = ?auto_23588 ?auto_23616 ) ) ( IS-CRATE ?auto_23574 ) ( AVAILABLE ?auto_23602 ) ( SURFACE-AT ?auto_23574 ?auto_23612 ) ( ON ?auto_23574 ?auto_23611 ) ( CLEAR ?auto_23574 ) ( not ( = ?auto_23573 ?auto_23574 ) ) ( not ( = ?auto_23573 ?auto_23611 ) ) ( not ( = ?auto_23574 ?auto_23611 ) ) ( IS-CRATE ?auto_23573 ) ( not ( = ?auto_23609 ?auto_23591 ) ) ( HOIST-AT ?auto_23619 ?auto_23609 ) ( AVAILABLE ?auto_23619 ) ( SURFACE-AT ?auto_23573 ?auto_23609 ) ( ON ?auto_23573 ?auto_23615 ) ( CLEAR ?auto_23573 ) ( not ( = ?auto_23572 ?auto_23573 ) ) ( not ( = ?auto_23572 ?auto_23615 ) ) ( not ( = ?auto_23573 ?auto_23615 ) ) ( not ( = ?auto_23588 ?auto_23619 ) ) ( IS-CRATE ?auto_23572 ) ( not ( = ?auto_23594 ?auto_23591 ) ) ( HOIST-AT ?auto_23627 ?auto_23594 ) ( AVAILABLE ?auto_23627 ) ( SURFACE-AT ?auto_23572 ?auto_23594 ) ( ON ?auto_23572 ?auto_23603 ) ( CLEAR ?auto_23572 ) ( not ( = ?auto_23571 ?auto_23572 ) ) ( not ( = ?auto_23571 ?auto_23603 ) ) ( not ( = ?auto_23572 ?auto_23603 ) ) ( not ( = ?auto_23588 ?auto_23627 ) ) ( SURFACE-AT ?auto_23570 ?auto_23591 ) ( CLEAR ?auto_23570 ) ( IS-CRATE ?auto_23571 ) ( AVAILABLE ?auto_23588 ) ( not ( = ?auto_23598 ?auto_23591 ) ) ( HOIST-AT ?auto_23618 ?auto_23598 ) ( AVAILABLE ?auto_23618 ) ( SURFACE-AT ?auto_23571 ?auto_23598 ) ( ON ?auto_23571 ?auto_23605 ) ( CLEAR ?auto_23571 ) ( TRUCK-AT ?auto_23590 ?auto_23591 ) ( not ( = ?auto_23570 ?auto_23571 ) ) ( not ( = ?auto_23570 ?auto_23605 ) ) ( not ( = ?auto_23571 ?auto_23605 ) ) ( not ( = ?auto_23588 ?auto_23618 ) ) ( not ( = ?auto_23570 ?auto_23572 ) ) ( not ( = ?auto_23570 ?auto_23603 ) ) ( not ( = ?auto_23572 ?auto_23605 ) ) ( not ( = ?auto_23594 ?auto_23598 ) ) ( not ( = ?auto_23627 ?auto_23618 ) ) ( not ( = ?auto_23603 ?auto_23605 ) ) ( not ( = ?auto_23570 ?auto_23573 ) ) ( not ( = ?auto_23570 ?auto_23615 ) ) ( not ( = ?auto_23571 ?auto_23573 ) ) ( not ( = ?auto_23571 ?auto_23615 ) ) ( not ( = ?auto_23573 ?auto_23603 ) ) ( not ( = ?auto_23573 ?auto_23605 ) ) ( not ( = ?auto_23609 ?auto_23594 ) ) ( not ( = ?auto_23609 ?auto_23598 ) ) ( not ( = ?auto_23619 ?auto_23627 ) ) ( not ( = ?auto_23619 ?auto_23618 ) ) ( not ( = ?auto_23615 ?auto_23603 ) ) ( not ( = ?auto_23615 ?auto_23605 ) ) ( not ( = ?auto_23570 ?auto_23574 ) ) ( not ( = ?auto_23570 ?auto_23611 ) ) ( not ( = ?auto_23571 ?auto_23574 ) ) ( not ( = ?auto_23571 ?auto_23611 ) ) ( not ( = ?auto_23572 ?auto_23574 ) ) ( not ( = ?auto_23572 ?auto_23611 ) ) ( not ( = ?auto_23574 ?auto_23615 ) ) ( not ( = ?auto_23574 ?auto_23603 ) ) ( not ( = ?auto_23574 ?auto_23605 ) ) ( not ( = ?auto_23612 ?auto_23609 ) ) ( not ( = ?auto_23612 ?auto_23594 ) ) ( not ( = ?auto_23612 ?auto_23598 ) ) ( not ( = ?auto_23602 ?auto_23619 ) ) ( not ( = ?auto_23602 ?auto_23627 ) ) ( not ( = ?auto_23602 ?auto_23618 ) ) ( not ( = ?auto_23611 ?auto_23615 ) ) ( not ( = ?auto_23611 ?auto_23603 ) ) ( not ( = ?auto_23611 ?auto_23605 ) ) ( not ( = ?auto_23570 ?auto_23575 ) ) ( not ( = ?auto_23570 ?auto_23601 ) ) ( not ( = ?auto_23571 ?auto_23575 ) ) ( not ( = ?auto_23571 ?auto_23601 ) ) ( not ( = ?auto_23572 ?auto_23575 ) ) ( not ( = ?auto_23572 ?auto_23601 ) ) ( not ( = ?auto_23573 ?auto_23575 ) ) ( not ( = ?auto_23573 ?auto_23601 ) ) ( not ( = ?auto_23575 ?auto_23611 ) ) ( not ( = ?auto_23575 ?auto_23615 ) ) ( not ( = ?auto_23575 ?auto_23603 ) ) ( not ( = ?auto_23575 ?auto_23605 ) ) ( not ( = ?auto_23599 ?auto_23612 ) ) ( not ( = ?auto_23599 ?auto_23609 ) ) ( not ( = ?auto_23599 ?auto_23594 ) ) ( not ( = ?auto_23599 ?auto_23598 ) ) ( not ( = ?auto_23616 ?auto_23602 ) ) ( not ( = ?auto_23616 ?auto_23619 ) ) ( not ( = ?auto_23616 ?auto_23627 ) ) ( not ( = ?auto_23616 ?auto_23618 ) ) ( not ( = ?auto_23601 ?auto_23611 ) ) ( not ( = ?auto_23601 ?auto_23615 ) ) ( not ( = ?auto_23601 ?auto_23603 ) ) ( not ( = ?auto_23601 ?auto_23605 ) ) ( not ( = ?auto_23570 ?auto_23576 ) ) ( not ( = ?auto_23570 ?auto_23626 ) ) ( not ( = ?auto_23571 ?auto_23576 ) ) ( not ( = ?auto_23571 ?auto_23626 ) ) ( not ( = ?auto_23572 ?auto_23576 ) ) ( not ( = ?auto_23572 ?auto_23626 ) ) ( not ( = ?auto_23573 ?auto_23576 ) ) ( not ( = ?auto_23573 ?auto_23626 ) ) ( not ( = ?auto_23574 ?auto_23576 ) ) ( not ( = ?auto_23574 ?auto_23626 ) ) ( not ( = ?auto_23576 ?auto_23601 ) ) ( not ( = ?auto_23576 ?auto_23611 ) ) ( not ( = ?auto_23576 ?auto_23615 ) ) ( not ( = ?auto_23576 ?auto_23603 ) ) ( not ( = ?auto_23576 ?auto_23605 ) ) ( not ( = ?auto_23629 ?auto_23599 ) ) ( not ( = ?auto_23629 ?auto_23612 ) ) ( not ( = ?auto_23629 ?auto_23609 ) ) ( not ( = ?auto_23629 ?auto_23594 ) ) ( not ( = ?auto_23629 ?auto_23598 ) ) ( not ( = ?auto_23625 ?auto_23616 ) ) ( not ( = ?auto_23625 ?auto_23602 ) ) ( not ( = ?auto_23625 ?auto_23619 ) ) ( not ( = ?auto_23625 ?auto_23627 ) ) ( not ( = ?auto_23625 ?auto_23618 ) ) ( not ( = ?auto_23626 ?auto_23601 ) ) ( not ( = ?auto_23626 ?auto_23611 ) ) ( not ( = ?auto_23626 ?auto_23615 ) ) ( not ( = ?auto_23626 ?auto_23603 ) ) ( not ( = ?auto_23626 ?auto_23605 ) ) ( not ( = ?auto_23570 ?auto_23577 ) ) ( not ( = ?auto_23570 ?auto_23620 ) ) ( not ( = ?auto_23571 ?auto_23577 ) ) ( not ( = ?auto_23571 ?auto_23620 ) ) ( not ( = ?auto_23572 ?auto_23577 ) ) ( not ( = ?auto_23572 ?auto_23620 ) ) ( not ( = ?auto_23573 ?auto_23577 ) ) ( not ( = ?auto_23573 ?auto_23620 ) ) ( not ( = ?auto_23574 ?auto_23577 ) ) ( not ( = ?auto_23574 ?auto_23620 ) ) ( not ( = ?auto_23575 ?auto_23577 ) ) ( not ( = ?auto_23575 ?auto_23620 ) ) ( not ( = ?auto_23577 ?auto_23626 ) ) ( not ( = ?auto_23577 ?auto_23601 ) ) ( not ( = ?auto_23577 ?auto_23611 ) ) ( not ( = ?auto_23577 ?auto_23615 ) ) ( not ( = ?auto_23577 ?auto_23603 ) ) ( not ( = ?auto_23577 ?auto_23605 ) ) ( not ( = ?auto_23606 ?auto_23629 ) ) ( not ( = ?auto_23606 ?auto_23599 ) ) ( not ( = ?auto_23606 ?auto_23612 ) ) ( not ( = ?auto_23606 ?auto_23609 ) ) ( not ( = ?auto_23606 ?auto_23594 ) ) ( not ( = ?auto_23606 ?auto_23598 ) ) ( not ( = ?auto_23623 ?auto_23625 ) ) ( not ( = ?auto_23623 ?auto_23616 ) ) ( not ( = ?auto_23623 ?auto_23602 ) ) ( not ( = ?auto_23623 ?auto_23619 ) ) ( not ( = ?auto_23623 ?auto_23627 ) ) ( not ( = ?auto_23623 ?auto_23618 ) ) ( not ( = ?auto_23620 ?auto_23626 ) ) ( not ( = ?auto_23620 ?auto_23601 ) ) ( not ( = ?auto_23620 ?auto_23611 ) ) ( not ( = ?auto_23620 ?auto_23615 ) ) ( not ( = ?auto_23620 ?auto_23603 ) ) ( not ( = ?auto_23620 ?auto_23605 ) ) ( not ( = ?auto_23570 ?auto_23578 ) ) ( not ( = ?auto_23570 ?auto_23622 ) ) ( not ( = ?auto_23571 ?auto_23578 ) ) ( not ( = ?auto_23571 ?auto_23622 ) ) ( not ( = ?auto_23572 ?auto_23578 ) ) ( not ( = ?auto_23572 ?auto_23622 ) ) ( not ( = ?auto_23573 ?auto_23578 ) ) ( not ( = ?auto_23573 ?auto_23622 ) ) ( not ( = ?auto_23574 ?auto_23578 ) ) ( not ( = ?auto_23574 ?auto_23622 ) ) ( not ( = ?auto_23575 ?auto_23578 ) ) ( not ( = ?auto_23575 ?auto_23622 ) ) ( not ( = ?auto_23576 ?auto_23578 ) ) ( not ( = ?auto_23576 ?auto_23622 ) ) ( not ( = ?auto_23578 ?auto_23620 ) ) ( not ( = ?auto_23578 ?auto_23626 ) ) ( not ( = ?auto_23578 ?auto_23601 ) ) ( not ( = ?auto_23578 ?auto_23611 ) ) ( not ( = ?auto_23578 ?auto_23615 ) ) ( not ( = ?auto_23578 ?auto_23603 ) ) ( not ( = ?auto_23578 ?auto_23605 ) ) ( not ( = ?auto_23596 ?auto_23606 ) ) ( not ( = ?auto_23596 ?auto_23629 ) ) ( not ( = ?auto_23596 ?auto_23599 ) ) ( not ( = ?auto_23596 ?auto_23612 ) ) ( not ( = ?auto_23596 ?auto_23609 ) ) ( not ( = ?auto_23596 ?auto_23594 ) ) ( not ( = ?auto_23596 ?auto_23598 ) ) ( not ( = ?auto_23628 ?auto_23623 ) ) ( not ( = ?auto_23628 ?auto_23625 ) ) ( not ( = ?auto_23628 ?auto_23616 ) ) ( not ( = ?auto_23628 ?auto_23602 ) ) ( not ( = ?auto_23628 ?auto_23619 ) ) ( not ( = ?auto_23628 ?auto_23627 ) ) ( not ( = ?auto_23628 ?auto_23618 ) ) ( not ( = ?auto_23622 ?auto_23620 ) ) ( not ( = ?auto_23622 ?auto_23626 ) ) ( not ( = ?auto_23622 ?auto_23601 ) ) ( not ( = ?auto_23622 ?auto_23611 ) ) ( not ( = ?auto_23622 ?auto_23615 ) ) ( not ( = ?auto_23622 ?auto_23603 ) ) ( not ( = ?auto_23622 ?auto_23605 ) ) ( not ( = ?auto_23570 ?auto_23579 ) ) ( not ( = ?auto_23570 ?auto_23604 ) ) ( not ( = ?auto_23571 ?auto_23579 ) ) ( not ( = ?auto_23571 ?auto_23604 ) ) ( not ( = ?auto_23572 ?auto_23579 ) ) ( not ( = ?auto_23572 ?auto_23604 ) ) ( not ( = ?auto_23573 ?auto_23579 ) ) ( not ( = ?auto_23573 ?auto_23604 ) ) ( not ( = ?auto_23574 ?auto_23579 ) ) ( not ( = ?auto_23574 ?auto_23604 ) ) ( not ( = ?auto_23575 ?auto_23579 ) ) ( not ( = ?auto_23575 ?auto_23604 ) ) ( not ( = ?auto_23576 ?auto_23579 ) ) ( not ( = ?auto_23576 ?auto_23604 ) ) ( not ( = ?auto_23577 ?auto_23579 ) ) ( not ( = ?auto_23577 ?auto_23604 ) ) ( not ( = ?auto_23579 ?auto_23622 ) ) ( not ( = ?auto_23579 ?auto_23620 ) ) ( not ( = ?auto_23579 ?auto_23626 ) ) ( not ( = ?auto_23579 ?auto_23601 ) ) ( not ( = ?auto_23579 ?auto_23611 ) ) ( not ( = ?auto_23579 ?auto_23615 ) ) ( not ( = ?auto_23579 ?auto_23603 ) ) ( not ( = ?auto_23579 ?auto_23605 ) ) ( not ( = ?auto_23595 ?auto_23596 ) ) ( not ( = ?auto_23595 ?auto_23606 ) ) ( not ( = ?auto_23595 ?auto_23629 ) ) ( not ( = ?auto_23595 ?auto_23599 ) ) ( not ( = ?auto_23595 ?auto_23612 ) ) ( not ( = ?auto_23595 ?auto_23609 ) ) ( not ( = ?auto_23595 ?auto_23594 ) ) ( not ( = ?auto_23595 ?auto_23598 ) ) ( not ( = ?auto_23593 ?auto_23628 ) ) ( not ( = ?auto_23593 ?auto_23623 ) ) ( not ( = ?auto_23593 ?auto_23625 ) ) ( not ( = ?auto_23593 ?auto_23616 ) ) ( not ( = ?auto_23593 ?auto_23602 ) ) ( not ( = ?auto_23593 ?auto_23619 ) ) ( not ( = ?auto_23593 ?auto_23627 ) ) ( not ( = ?auto_23593 ?auto_23618 ) ) ( not ( = ?auto_23604 ?auto_23622 ) ) ( not ( = ?auto_23604 ?auto_23620 ) ) ( not ( = ?auto_23604 ?auto_23626 ) ) ( not ( = ?auto_23604 ?auto_23601 ) ) ( not ( = ?auto_23604 ?auto_23611 ) ) ( not ( = ?auto_23604 ?auto_23615 ) ) ( not ( = ?auto_23604 ?auto_23603 ) ) ( not ( = ?auto_23604 ?auto_23605 ) ) ( not ( = ?auto_23570 ?auto_23580 ) ) ( not ( = ?auto_23570 ?auto_23608 ) ) ( not ( = ?auto_23571 ?auto_23580 ) ) ( not ( = ?auto_23571 ?auto_23608 ) ) ( not ( = ?auto_23572 ?auto_23580 ) ) ( not ( = ?auto_23572 ?auto_23608 ) ) ( not ( = ?auto_23573 ?auto_23580 ) ) ( not ( = ?auto_23573 ?auto_23608 ) ) ( not ( = ?auto_23574 ?auto_23580 ) ) ( not ( = ?auto_23574 ?auto_23608 ) ) ( not ( = ?auto_23575 ?auto_23580 ) ) ( not ( = ?auto_23575 ?auto_23608 ) ) ( not ( = ?auto_23576 ?auto_23580 ) ) ( not ( = ?auto_23576 ?auto_23608 ) ) ( not ( = ?auto_23577 ?auto_23580 ) ) ( not ( = ?auto_23577 ?auto_23608 ) ) ( not ( = ?auto_23578 ?auto_23580 ) ) ( not ( = ?auto_23578 ?auto_23608 ) ) ( not ( = ?auto_23580 ?auto_23604 ) ) ( not ( = ?auto_23580 ?auto_23622 ) ) ( not ( = ?auto_23580 ?auto_23620 ) ) ( not ( = ?auto_23580 ?auto_23626 ) ) ( not ( = ?auto_23580 ?auto_23601 ) ) ( not ( = ?auto_23580 ?auto_23611 ) ) ( not ( = ?auto_23580 ?auto_23615 ) ) ( not ( = ?auto_23580 ?auto_23603 ) ) ( not ( = ?auto_23580 ?auto_23605 ) ) ( not ( = ?auto_23608 ?auto_23604 ) ) ( not ( = ?auto_23608 ?auto_23622 ) ) ( not ( = ?auto_23608 ?auto_23620 ) ) ( not ( = ?auto_23608 ?auto_23626 ) ) ( not ( = ?auto_23608 ?auto_23601 ) ) ( not ( = ?auto_23608 ?auto_23611 ) ) ( not ( = ?auto_23608 ?auto_23615 ) ) ( not ( = ?auto_23608 ?auto_23603 ) ) ( not ( = ?auto_23608 ?auto_23605 ) ) ( not ( = ?auto_23570 ?auto_23581 ) ) ( not ( = ?auto_23570 ?auto_23607 ) ) ( not ( = ?auto_23571 ?auto_23581 ) ) ( not ( = ?auto_23571 ?auto_23607 ) ) ( not ( = ?auto_23572 ?auto_23581 ) ) ( not ( = ?auto_23572 ?auto_23607 ) ) ( not ( = ?auto_23573 ?auto_23581 ) ) ( not ( = ?auto_23573 ?auto_23607 ) ) ( not ( = ?auto_23574 ?auto_23581 ) ) ( not ( = ?auto_23574 ?auto_23607 ) ) ( not ( = ?auto_23575 ?auto_23581 ) ) ( not ( = ?auto_23575 ?auto_23607 ) ) ( not ( = ?auto_23576 ?auto_23581 ) ) ( not ( = ?auto_23576 ?auto_23607 ) ) ( not ( = ?auto_23577 ?auto_23581 ) ) ( not ( = ?auto_23577 ?auto_23607 ) ) ( not ( = ?auto_23578 ?auto_23581 ) ) ( not ( = ?auto_23578 ?auto_23607 ) ) ( not ( = ?auto_23579 ?auto_23581 ) ) ( not ( = ?auto_23579 ?auto_23607 ) ) ( not ( = ?auto_23581 ?auto_23608 ) ) ( not ( = ?auto_23581 ?auto_23604 ) ) ( not ( = ?auto_23581 ?auto_23622 ) ) ( not ( = ?auto_23581 ?auto_23620 ) ) ( not ( = ?auto_23581 ?auto_23626 ) ) ( not ( = ?auto_23581 ?auto_23601 ) ) ( not ( = ?auto_23581 ?auto_23611 ) ) ( not ( = ?auto_23581 ?auto_23615 ) ) ( not ( = ?auto_23581 ?auto_23603 ) ) ( not ( = ?auto_23581 ?auto_23605 ) ) ( not ( = ?auto_23600 ?auto_23612 ) ) ( not ( = ?auto_23600 ?auto_23595 ) ) ( not ( = ?auto_23600 ?auto_23596 ) ) ( not ( = ?auto_23600 ?auto_23606 ) ) ( not ( = ?auto_23600 ?auto_23629 ) ) ( not ( = ?auto_23600 ?auto_23599 ) ) ( not ( = ?auto_23600 ?auto_23609 ) ) ( not ( = ?auto_23600 ?auto_23594 ) ) ( not ( = ?auto_23600 ?auto_23598 ) ) ( not ( = ?auto_23592 ?auto_23602 ) ) ( not ( = ?auto_23592 ?auto_23593 ) ) ( not ( = ?auto_23592 ?auto_23628 ) ) ( not ( = ?auto_23592 ?auto_23623 ) ) ( not ( = ?auto_23592 ?auto_23625 ) ) ( not ( = ?auto_23592 ?auto_23616 ) ) ( not ( = ?auto_23592 ?auto_23619 ) ) ( not ( = ?auto_23592 ?auto_23627 ) ) ( not ( = ?auto_23592 ?auto_23618 ) ) ( not ( = ?auto_23607 ?auto_23608 ) ) ( not ( = ?auto_23607 ?auto_23604 ) ) ( not ( = ?auto_23607 ?auto_23622 ) ) ( not ( = ?auto_23607 ?auto_23620 ) ) ( not ( = ?auto_23607 ?auto_23626 ) ) ( not ( = ?auto_23607 ?auto_23601 ) ) ( not ( = ?auto_23607 ?auto_23611 ) ) ( not ( = ?auto_23607 ?auto_23615 ) ) ( not ( = ?auto_23607 ?auto_23603 ) ) ( not ( = ?auto_23607 ?auto_23605 ) ) ( not ( = ?auto_23570 ?auto_23582 ) ) ( not ( = ?auto_23570 ?auto_23624 ) ) ( not ( = ?auto_23571 ?auto_23582 ) ) ( not ( = ?auto_23571 ?auto_23624 ) ) ( not ( = ?auto_23572 ?auto_23582 ) ) ( not ( = ?auto_23572 ?auto_23624 ) ) ( not ( = ?auto_23573 ?auto_23582 ) ) ( not ( = ?auto_23573 ?auto_23624 ) ) ( not ( = ?auto_23574 ?auto_23582 ) ) ( not ( = ?auto_23574 ?auto_23624 ) ) ( not ( = ?auto_23575 ?auto_23582 ) ) ( not ( = ?auto_23575 ?auto_23624 ) ) ( not ( = ?auto_23576 ?auto_23582 ) ) ( not ( = ?auto_23576 ?auto_23624 ) ) ( not ( = ?auto_23577 ?auto_23582 ) ) ( not ( = ?auto_23577 ?auto_23624 ) ) ( not ( = ?auto_23578 ?auto_23582 ) ) ( not ( = ?auto_23578 ?auto_23624 ) ) ( not ( = ?auto_23579 ?auto_23582 ) ) ( not ( = ?auto_23579 ?auto_23624 ) ) ( not ( = ?auto_23580 ?auto_23582 ) ) ( not ( = ?auto_23580 ?auto_23624 ) ) ( not ( = ?auto_23582 ?auto_23607 ) ) ( not ( = ?auto_23582 ?auto_23608 ) ) ( not ( = ?auto_23582 ?auto_23604 ) ) ( not ( = ?auto_23582 ?auto_23622 ) ) ( not ( = ?auto_23582 ?auto_23620 ) ) ( not ( = ?auto_23582 ?auto_23626 ) ) ( not ( = ?auto_23582 ?auto_23601 ) ) ( not ( = ?auto_23582 ?auto_23611 ) ) ( not ( = ?auto_23582 ?auto_23615 ) ) ( not ( = ?auto_23582 ?auto_23603 ) ) ( not ( = ?auto_23582 ?auto_23605 ) ) ( not ( = ?auto_23617 ?auto_23600 ) ) ( not ( = ?auto_23617 ?auto_23612 ) ) ( not ( = ?auto_23617 ?auto_23595 ) ) ( not ( = ?auto_23617 ?auto_23596 ) ) ( not ( = ?auto_23617 ?auto_23606 ) ) ( not ( = ?auto_23617 ?auto_23629 ) ) ( not ( = ?auto_23617 ?auto_23599 ) ) ( not ( = ?auto_23617 ?auto_23609 ) ) ( not ( = ?auto_23617 ?auto_23594 ) ) ( not ( = ?auto_23617 ?auto_23598 ) ) ( not ( = ?auto_23614 ?auto_23592 ) ) ( not ( = ?auto_23614 ?auto_23602 ) ) ( not ( = ?auto_23614 ?auto_23593 ) ) ( not ( = ?auto_23614 ?auto_23628 ) ) ( not ( = ?auto_23614 ?auto_23623 ) ) ( not ( = ?auto_23614 ?auto_23625 ) ) ( not ( = ?auto_23614 ?auto_23616 ) ) ( not ( = ?auto_23614 ?auto_23619 ) ) ( not ( = ?auto_23614 ?auto_23627 ) ) ( not ( = ?auto_23614 ?auto_23618 ) ) ( not ( = ?auto_23624 ?auto_23607 ) ) ( not ( = ?auto_23624 ?auto_23608 ) ) ( not ( = ?auto_23624 ?auto_23604 ) ) ( not ( = ?auto_23624 ?auto_23622 ) ) ( not ( = ?auto_23624 ?auto_23620 ) ) ( not ( = ?auto_23624 ?auto_23626 ) ) ( not ( = ?auto_23624 ?auto_23601 ) ) ( not ( = ?auto_23624 ?auto_23611 ) ) ( not ( = ?auto_23624 ?auto_23615 ) ) ( not ( = ?auto_23624 ?auto_23603 ) ) ( not ( = ?auto_23624 ?auto_23605 ) ) ( not ( = ?auto_23570 ?auto_23583 ) ) ( not ( = ?auto_23570 ?auto_23610 ) ) ( not ( = ?auto_23571 ?auto_23583 ) ) ( not ( = ?auto_23571 ?auto_23610 ) ) ( not ( = ?auto_23572 ?auto_23583 ) ) ( not ( = ?auto_23572 ?auto_23610 ) ) ( not ( = ?auto_23573 ?auto_23583 ) ) ( not ( = ?auto_23573 ?auto_23610 ) ) ( not ( = ?auto_23574 ?auto_23583 ) ) ( not ( = ?auto_23574 ?auto_23610 ) ) ( not ( = ?auto_23575 ?auto_23583 ) ) ( not ( = ?auto_23575 ?auto_23610 ) ) ( not ( = ?auto_23576 ?auto_23583 ) ) ( not ( = ?auto_23576 ?auto_23610 ) ) ( not ( = ?auto_23577 ?auto_23583 ) ) ( not ( = ?auto_23577 ?auto_23610 ) ) ( not ( = ?auto_23578 ?auto_23583 ) ) ( not ( = ?auto_23578 ?auto_23610 ) ) ( not ( = ?auto_23579 ?auto_23583 ) ) ( not ( = ?auto_23579 ?auto_23610 ) ) ( not ( = ?auto_23580 ?auto_23583 ) ) ( not ( = ?auto_23580 ?auto_23610 ) ) ( not ( = ?auto_23581 ?auto_23583 ) ) ( not ( = ?auto_23581 ?auto_23610 ) ) ( not ( = ?auto_23583 ?auto_23624 ) ) ( not ( = ?auto_23583 ?auto_23607 ) ) ( not ( = ?auto_23583 ?auto_23608 ) ) ( not ( = ?auto_23583 ?auto_23604 ) ) ( not ( = ?auto_23583 ?auto_23622 ) ) ( not ( = ?auto_23583 ?auto_23620 ) ) ( not ( = ?auto_23583 ?auto_23626 ) ) ( not ( = ?auto_23583 ?auto_23601 ) ) ( not ( = ?auto_23583 ?auto_23611 ) ) ( not ( = ?auto_23583 ?auto_23615 ) ) ( not ( = ?auto_23583 ?auto_23603 ) ) ( not ( = ?auto_23583 ?auto_23605 ) ) ( not ( = ?auto_23610 ?auto_23624 ) ) ( not ( = ?auto_23610 ?auto_23607 ) ) ( not ( = ?auto_23610 ?auto_23608 ) ) ( not ( = ?auto_23610 ?auto_23604 ) ) ( not ( = ?auto_23610 ?auto_23622 ) ) ( not ( = ?auto_23610 ?auto_23620 ) ) ( not ( = ?auto_23610 ?auto_23626 ) ) ( not ( = ?auto_23610 ?auto_23601 ) ) ( not ( = ?auto_23610 ?auto_23611 ) ) ( not ( = ?auto_23610 ?auto_23615 ) ) ( not ( = ?auto_23610 ?auto_23603 ) ) ( not ( = ?auto_23610 ?auto_23605 ) ) ( not ( = ?auto_23570 ?auto_23584 ) ) ( not ( = ?auto_23570 ?auto_23613 ) ) ( not ( = ?auto_23571 ?auto_23584 ) ) ( not ( = ?auto_23571 ?auto_23613 ) ) ( not ( = ?auto_23572 ?auto_23584 ) ) ( not ( = ?auto_23572 ?auto_23613 ) ) ( not ( = ?auto_23573 ?auto_23584 ) ) ( not ( = ?auto_23573 ?auto_23613 ) ) ( not ( = ?auto_23574 ?auto_23584 ) ) ( not ( = ?auto_23574 ?auto_23613 ) ) ( not ( = ?auto_23575 ?auto_23584 ) ) ( not ( = ?auto_23575 ?auto_23613 ) ) ( not ( = ?auto_23576 ?auto_23584 ) ) ( not ( = ?auto_23576 ?auto_23613 ) ) ( not ( = ?auto_23577 ?auto_23584 ) ) ( not ( = ?auto_23577 ?auto_23613 ) ) ( not ( = ?auto_23578 ?auto_23584 ) ) ( not ( = ?auto_23578 ?auto_23613 ) ) ( not ( = ?auto_23579 ?auto_23584 ) ) ( not ( = ?auto_23579 ?auto_23613 ) ) ( not ( = ?auto_23580 ?auto_23584 ) ) ( not ( = ?auto_23580 ?auto_23613 ) ) ( not ( = ?auto_23581 ?auto_23584 ) ) ( not ( = ?auto_23581 ?auto_23613 ) ) ( not ( = ?auto_23582 ?auto_23584 ) ) ( not ( = ?auto_23582 ?auto_23613 ) ) ( not ( = ?auto_23584 ?auto_23610 ) ) ( not ( = ?auto_23584 ?auto_23624 ) ) ( not ( = ?auto_23584 ?auto_23607 ) ) ( not ( = ?auto_23584 ?auto_23608 ) ) ( not ( = ?auto_23584 ?auto_23604 ) ) ( not ( = ?auto_23584 ?auto_23622 ) ) ( not ( = ?auto_23584 ?auto_23620 ) ) ( not ( = ?auto_23584 ?auto_23626 ) ) ( not ( = ?auto_23584 ?auto_23601 ) ) ( not ( = ?auto_23584 ?auto_23611 ) ) ( not ( = ?auto_23584 ?auto_23615 ) ) ( not ( = ?auto_23584 ?auto_23603 ) ) ( not ( = ?auto_23584 ?auto_23605 ) ) ( not ( = ?auto_23597 ?auto_23612 ) ) ( not ( = ?auto_23597 ?auto_23617 ) ) ( not ( = ?auto_23597 ?auto_23600 ) ) ( not ( = ?auto_23597 ?auto_23595 ) ) ( not ( = ?auto_23597 ?auto_23596 ) ) ( not ( = ?auto_23597 ?auto_23606 ) ) ( not ( = ?auto_23597 ?auto_23629 ) ) ( not ( = ?auto_23597 ?auto_23599 ) ) ( not ( = ?auto_23597 ?auto_23609 ) ) ( not ( = ?auto_23597 ?auto_23594 ) ) ( not ( = ?auto_23597 ?auto_23598 ) ) ( not ( = ?auto_23621 ?auto_23602 ) ) ( not ( = ?auto_23621 ?auto_23614 ) ) ( not ( = ?auto_23621 ?auto_23592 ) ) ( not ( = ?auto_23621 ?auto_23593 ) ) ( not ( = ?auto_23621 ?auto_23628 ) ) ( not ( = ?auto_23621 ?auto_23623 ) ) ( not ( = ?auto_23621 ?auto_23625 ) ) ( not ( = ?auto_23621 ?auto_23616 ) ) ( not ( = ?auto_23621 ?auto_23619 ) ) ( not ( = ?auto_23621 ?auto_23627 ) ) ( not ( = ?auto_23621 ?auto_23618 ) ) ( not ( = ?auto_23613 ?auto_23610 ) ) ( not ( = ?auto_23613 ?auto_23624 ) ) ( not ( = ?auto_23613 ?auto_23607 ) ) ( not ( = ?auto_23613 ?auto_23608 ) ) ( not ( = ?auto_23613 ?auto_23604 ) ) ( not ( = ?auto_23613 ?auto_23622 ) ) ( not ( = ?auto_23613 ?auto_23620 ) ) ( not ( = ?auto_23613 ?auto_23626 ) ) ( not ( = ?auto_23613 ?auto_23601 ) ) ( not ( = ?auto_23613 ?auto_23611 ) ) ( not ( = ?auto_23613 ?auto_23615 ) ) ( not ( = ?auto_23613 ?auto_23603 ) ) ( not ( = ?auto_23613 ?auto_23605 ) ) ( not ( = ?auto_23570 ?auto_23585 ) ) ( not ( = ?auto_23570 ?auto_23589 ) ) ( not ( = ?auto_23571 ?auto_23585 ) ) ( not ( = ?auto_23571 ?auto_23589 ) ) ( not ( = ?auto_23572 ?auto_23585 ) ) ( not ( = ?auto_23572 ?auto_23589 ) ) ( not ( = ?auto_23573 ?auto_23585 ) ) ( not ( = ?auto_23573 ?auto_23589 ) ) ( not ( = ?auto_23574 ?auto_23585 ) ) ( not ( = ?auto_23574 ?auto_23589 ) ) ( not ( = ?auto_23575 ?auto_23585 ) ) ( not ( = ?auto_23575 ?auto_23589 ) ) ( not ( = ?auto_23576 ?auto_23585 ) ) ( not ( = ?auto_23576 ?auto_23589 ) ) ( not ( = ?auto_23577 ?auto_23585 ) ) ( not ( = ?auto_23577 ?auto_23589 ) ) ( not ( = ?auto_23578 ?auto_23585 ) ) ( not ( = ?auto_23578 ?auto_23589 ) ) ( not ( = ?auto_23579 ?auto_23585 ) ) ( not ( = ?auto_23579 ?auto_23589 ) ) ( not ( = ?auto_23580 ?auto_23585 ) ) ( not ( = ?auto_23580 ?auto_23589 ) ) ( not ( = ?auto_23581 ?auto_23585 ) ) ( not ( = ?auto_23581 ?auto_23589 ) ) ( not ( = ?auto_23582 ?auto_23585 ) ) ( not ( = ?auto_23582 ?auto_23589 ) ) ( not ( = ?auto_23583 ?auto_23585 ) ) ( not ( = ?auto_23583 ?auto_23589 ) ) ( not ( = ?auto_23585 ?auto_23613 ) ) ( not ( = ?auto_23585 ?auto_23610 ) ) ( not ( = ?auto_23585 ?auto_23624 ) ) ( not ( = ?auto_23585 ?auto_23607 ) ) ( not ( = ?auto_23585 ?auto_23608 ) ) ( not ( = ?auto_23585 ?auto_23604 ) ) ( not ( = ?auto_23585 ?auto_23622 ) ) ( not ( = ?auto_23585 ?auto_23620 ) ) ( not ( = ?auto_23585 ?auto_23626 ) ) ( not ( = ?auto_23585 ?auto_23601 ) ) ( not ( = ?auto_23585 ?auto_23611 ) ) ( not ( = ?auto_23585 ?auto_23615 ) ) ( not ( = ?auto_23585 ?auto_23603 ) ) ( not ( = ?auto_23585 ?auto_23605 ) ) ( not ( = ?auto_23586 ?auto_23597 ) ) ( not ( = ?auto_23586 ?auto_23612 ) ) ( not ( = ?auto_23586 ?auto_23617 ) ) ( not ( = ?auto_23586 ?auto_23600 ) ) ( not ( = ?auto_23586 ?auto_23595 ) ) ( not ( = ?auto_23586 ?auto_23596 ) ) ( not ( = ?auto_23586 ?auto_23606 ) ) ( not ( = ?auto_23586 ?auto_23629 ) ) ( not ( = ?auto_23586 ?auto_23599 ) ) ( not ( = ?auto_23586 ?auto_23609 ) ) ( not ( = ?auto_23586 ?auto_23594 ) ) ( not ( = ?auto_23586 ?auto_23598 ) ) ( not ( = ?auto_23587 ?auto_23621 ) ) ( not ( = ?auto_23587 ?auto_23602 ) ) ( not ( = ?auto_23587 ?auto_23614 ) ) ( not ( = ?auto_23587 ?auto_23592 ) ) ( not ( = ?auto_23587 ?auto_23593 ) ) ( not ( = ?auto_23587 ?auto_23628 ) ) ( not ( = ?auto_23587 ?auto_23623 ) ) ( not ( = ?auto_23587 ?auto_23625 ) ) ( not ( = ?auto_23587 ?auto_23616 ) ) ( not ( = ?auto_23587 ?auto_23619 ) ) ( not ( = ?auto_23587 ?auto_23627 ) ) ( not ( = ?auto_23587 ?auto_23618 ) ) ( not ( = ?auto_23589 ?auto_23613 ) ) ( not ( = ?auto_23589 ?auto_23610 ) ) ( not ( = ?auto_23589 ?auto_23624 ) ) ( not ( = ?auto_23589 ?auto_23607 ) ) ( not ( = ?auto_23589 ?auto_23608 ) ) ( not ( = ?auto_23589 ?auto_23604 ) ) ( not ( = ?auto_23589 ?auto_23622 ) ) ( not ( = ?auto_23589 ?auto_23620 ) ) ( not ( = ?auto_23589 ?auto_23626 ) ) ( not ( = ?auto_23589 ?auto_23601 ) ) ( not ( = ?auto_23589 ?auto_23611 ) ) ( not ( = ?auto_23589 ?auto_23615 ) ) ( not ( = ?auto_23589 ?auto_23603 ) ) ( not ( = ?auto_23589 ?auto_23605 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_23570 ?auto_23571 ?auto_23572 ?auto_23573 ?auto_23574 ?auto_23575 ?auto_23576 ?auto_23577 ?auto_23578 ?auto_23579 ?auto_23580 ?auto_23581 ?auto_23582 ?auto_23583 ?auto_23584 )
      ( MAKE-1CRATE ?auto_23584 ?auto_23585 )
      ( MAKE-15CRATE-VERIFY ?auto_23570 ?auto_23571 ?auto_23572 ?auto_23573 ?auto_23574 ?auto_23575 ?auto_23576 ?auto_23577 ?auto_23578 ?auto_23579 ?auto_23580 ?auto_23581 ?auto_23582 ?auto_23583 ?auto_23584 ?auto_23585 ) )
  )

)

