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
      ?auto_19809 - SURFACE
      ?auto_19810 - SURFACE
    )
    :vars
    (
      ?auto_19811 - HOIST
      ?auto_19812 - PLACE
      ?auto_19814 - PLACE
      ?auto_19815 - HOIST
      ?auto_19816 - SURFACE
      ?auto_19813 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19811 ?auto_19812 ) ( SURFACE-AT ?auto_19809 ?auto_19812 ) ( CLEAR ?auto_19809 ) ( IS-CRATE ?auto_19810 ) ( AVAILABLE ?auto_19811 ) ( not ( = ?auto_19814 ?auto_19812 ) ) ( HOIST-AT ?auto_19815 ?auto_19814 ) ( AVAILABLE ?auto_19815 ) ( SURFACE-AT ?auto_19810 ?auto_19814 ) ( ON ?auto_19810 ?auto_19816 ) ( CLEAR ?auto_19810 ) ( TRUCK-AT ?auto_19813 ?auto_19812 ) ( not ( = ?auto_19809 ?auto_19810 ) ) ( not ( = ?auto_19809 ?auto_19816 ) ) ( not ( = ?auto_19810 ?auto_19816 ) ) ( not ( = ?auto_19811 ?auto_19815 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19813 ?auto_19812 ?auto_19814 )
      ( !LIFT ?auto_19815 ?auto_19810 ?auto_19816 ?auto_19814 )
      ( !LOAD ?auto_19815 ?auto_19810 ?auto_19813 ?auto_19814 )
      ( !DRIVE ?auto_19813 ?auto_19814 ?auto_19812 )
      ( !UNLOAD ?auto_19811 ?auto_19810 ?auto_19813 ?auto_19812 )
      ( !DROP ?auto_19811 ?auto_19810 ?auto_19809 ?auto_19812 )
      ( MAKE-1CRATE-VERIFY ?auto_19809 ?auto_19810 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19830 - SURFACE
      ?auto_19831 - SURFACE
      ?auto_19832 - SURFACE
    )
    :vars
    (
      ?auto_19835 - HOIST
      ?auto_19837 - PLACE
      ?auto_19833 - PLACE
      ?auto_19836 - HOIST
      ?auto_19838 - SURFACE
      ?auto_19841 - PLACE
      ?auto_19840 - HOIST
      ?auto_19839 - SURFACE
      ?auto_19834 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19835 ?auto_19837 ) ( IS-CRATE ?auto_19832 ) ( not ( = ?auto_19833 ?auto_19837 ) ) ( HOIST-AT ?auto_19836 ?auto_19833 ) ( AVAILABLE ?auto_19836 ) ( SURFACE-AT ?auto_19832 ?auto_19833 ) ( ON ?auto_19832 ?auto_19838 ) ( CLEAR ?auto_19832 ) ( not ( = ?auto_19831 ?auto_19832 ) ) ( not ( = ?auto_19831 ?auto_19838 ) ) ( not ( = ?auto_19832 ?auto_19838 ) ) ( not ( = ?auto_19835 ?auto_19836 ) ) ( SURFACE-AT ?auto_19830 ?auto_19837 ) ( CLEAR ?auto_19830 ) ( IS-CRATE ?auto_19831 ) ( AVAILABLE ?auto_19835 ) ( not ( = ?auto_19841 ?auto_19837 ) ) ( HOIST-AT ?auto_19840 ?auto_19841 ) ( AVAILABLE ?auto_19840 ) ( SURFACE-AT ?auto_19831 ?auto_19841 ) ( ON ?auto_19831 ?auto_19839 ) ( CLEAR ?auto_19831 ) ( TRUCK-AT ?auto_19834 ?auto_19837 ) ( not ( = ?auto_19830 ?auto_19831 ) ) ( not ( = ?auto_19830 ?auto_19839 ) ) ( not ( = ?auto_19831 ?auto_19839 ) ) ( not ( = ?auto_19835 ?auto_19840 ) ) ( not ( = ?auto_19830 ?auto_19832 ) ) ( not ( = ?auto_19830 ?auto_19838 ) ) ( not ( = ?auto_19832 ?auto_19839 ) ) ( not ( = ?auto_19833 ?auto_19841 ) ) ( not ( = ?auto_19836 ?auto_19840 ) ) ( not ( = ?auto_19838 ?auto_19839 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19830 ?auto_19831 )
      ( MAKE-1CRATE ?auto_19831 ?auto_19832 )
      ( MAKE-2CRATE-VERIFY ?auto_19830 ?auto_19831 ?auto_19832 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19856 - SURFACE
      ?auto_19857 - SURFACE
      ?auto_19858 - SURFACE
      ?auto_19859 - SURFACE
    )
    :vars
    (
      ?auto_19863 - HOIST
      ?auto_19861 - PLACE
      ?auto_19864 - PLACE
      ?auto_19865 - HOIST
      ?auto_19860 - SURFACE
      ?auto_19871 - PLACE
      ?auto_19867 - HOIST
      ?auto_19869 - SURFACE
      ?auto_19868 - PLACE
      ?auto_19870 - HOIST
      ?auto_19866 - SURFACE
      ?auto_19862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19863 ?auto_19861 ) ( IS-CRATE ?auto_19859 ) ( not ( = ?auto_19864 ?auto_19861 ) ) ( HOIST-AT ?auto_19865 ?auto_19864 ) ( AVAILABLE ?auto_19865 ) ( SURFACE-AT ?auto_19859 ?auto_19864 ) ( ON ?auto_19859 ?auto_19860 ) ( CLEAR ?auto_19859 ) ( not ( = ?auto_19858 ?auto_19859 ) ) ( not ( = ?auto_19858 ?auto_19860 ) ) ( not ( = ?auto_19859 ?auto_19860 ) ) ( not ( = ?auto_19863 ?auto_19865 ) ) ( IS-CRATE ?auto_19858 ) ( not ( = ?auto_19871 ?auto_19861 ) ) ( HOIST-AT ?auto_19867 ?auto_19871 ) ( AVAILABLE ?auto_19867 ) ( SURFACE-AT ?auto_19858 ?auto_19871 ) ( ON ?auto_19858 ?auto_19869 ) ( CLEAR ?auto_19858 ) ( not ( = ?auto_19857 ?auto_19858 ) ) ( not ( = ?auto_19857 ?auto_19869 ) ) ( not ( = ?auto_19858 ?auto_19869 ) ) ( not ( = ?auto_19863 ?auto_19867 ) ) ( SURFACE-AT ?auto_19856 ?auto_19861 ) ( CLEAR ?auto_19856 ) ( IS-CRATE ?auto_19857 ) ( AVAILABLE ?auto_19863 ) ( not ( = ?auto_19868 ?auto_19861 ) ) ( HOIST-AT ?auto_19870 ?auto_19868 ) ( AVAILABLE ?auto_19870 ) ( SURFACE-AT ?auto_19857 ?auto_19868 ) ( ON ?auto_19857 ?auto_19866 ) ( CLEAR ?auto_19857 ) ( TRUCK-AT ?auto_19862 ?auto_19861 ) ( not ( = ?auto_19856 ?auto_19857 ) ) ( not ( = ?auto_19856 ?auto_19866 ) ) ( not ( = ?auto_19857 ?auto_19866 ) ) ( not ( = ?auto_19863 ?auto_19870 ) ) ( not ( = ?auto_19856 ?auto_19858 ) ) ( not ( = ?auto_19856 ?auto_19869 ) ) ( not ( = ?auto_19858 ?auto_19866 ) ) ( not ( = ?auto_19871 ?auto_19868 ) ) ( not ( = ?auto_19867 ?auto_19870 ) ) ( not ( = ?auto_19869 ?auto_19866 ) ) ( not ( = ?auto_19856 ?auto_19859 ) ) ( not ( = ?auto_19856 ?auto_19860 ) ) ( not ( = ?auto_19857 ?auto_19859 ) ) ( not ( = ?auto_19857 ?auto_19860 ) ) ( not ( = ?auto_19859 ?auto_19869 ) ) ( not ( = ?auto_19859 ?auto_19866 ) ) ( not ( = ?auto_19864 ?auto_19871 ) ) ( not ( = ?auto_19864 ?auto_19868 ) ) ( not ( = ?auto_19865 ?auto_19867 ) ) ( not ( = ?auto_19865 ?auto_19870 ) ) ( not ( = ?auto_19860 ?auto_19869 ) ) ( not ( = ?auto_19860 ?auto_19866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19856 ?auto_19857 ?auto_19858 )
      ( MAKE-1CRATE ?auto_19858 ?auto_19859 )
      ( MAKE-3CRATE-VERIFY ?auto_19856 ?auto_19857 ?auto_19858 ?auto_19859 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19887 - SURFACE
      ?auto_19888 - SURFACE
      ?auto_19889 - SURFACE
      ?auto_19890 - SURFACE
      ?auto_19891 - SURFACE
    )
    :vars
    (
      ?auto_19894 - HOIST
      ?auto_19893 - PLACE
      ?auto_19895 - PLACE
      ?auto_19897 - HOIST
      ?auto_19896 - SURFACE
      ?auto_19904 - PLACE
      ?auto_19902 - HOIST
      ?auto_19900 - SURFACE
      ?auto_19899 - PLACE
      ?auto_19905 - HOIST
      ?auto_19898 - SURFACE
      ?auto_19906 - PLACE
      ?auto_19903 - HOIST
      ?auto_19901 - SURFACE
      ?auto_19892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19894 ?auto_19893 ) ( IS-CRATE ?auto_19891 ) ( not ( = ?auto_19895 ?auto_19893 ) ) ( HOIST-AT ?auto_19897 ?auto_19895 ) ( AVAILABLE ?auto_19897 ) ( SURFACE-AT ?auto_19891 ?auto_19895 ) ( ON ?auto_19891 ?auto_19896 ) ( CLEAR ?auto_19891 ) ( not ( = ?auto_19890 ?auto_19891 ) ) ( not ( = ?auto_19890 ?auto_19896 ) ) ( not ( = ?auto_19891 ?auto_19896 ) ) ( not ( = ?auto_19894 ?auto_19897 ) ) ( IS-CRATE ?auto_19890 ) ( not ( = ?auto_19904 ?auto_19893 ) ) ( HOIST-AT ?auto_19902 ?auto_19904 ) ( AVAILABLE ?auto_19902 ) ( SURFACE-AT ?auto_19890 ?auto_19904 ) ( ON ?auto_19890 ?auto_19900 ) ( CLEAR ?auto_19890 ) ( not ( = ?auto_19889 ?auto_19890 ) ) ( not ( = ?auto_19889 ?auto_19900 ) ) ( not ( = ?auto_19890 ?auto_19900 ) ) ( not ( = ?auto_19894 ?auto_19902 ) ) ( IS-CRATE ?auto_19889 ) ( not ( = ?auto_19899 ?auto_19893 ) ) ( HOIST-AT ?auto_19905 ?auto_19899 ) ( AVAILABLE ?auto_19905 ) ( SURFACE-AT ?auto_19889 ?auto_19899 ) ( ON ?auto_19889 ?auto_19898 ) ( CLEAR ?auto_19889 ) ( not ( = ?auto_19888 ?auto_19889 ) ) ( not ( = ?auto_19888 ?auto_19898 ) ) ( not ( = ?auto_19889 ?auto_19898 ) ) ( not ( = ?auto_19894 ?auto_19905 ) ) ( SURFACE-AT ?auto_19887 ?auto_19893 ) ( CLEAR ?auto_19887 ) ( IS-CRATE ?auto_19888 ) ( AVAILABLE ?auto_19894 ) ( not ( = ?auto_19906 ?auto_19893 ) ) ( HOIST-AT ?auto_19903 ?auto_19906 ) ( AVAILABLE ?auto_19903 ) ( SURFACE-AT ?auto_19888 ?auto_19906 ) ( ON ?auto_19888 ?auto_19901 ) ( CLEAR ?auto_19888 ) ( TRUCK-AT ?auto_19892 ?auto_19893 ) ( not ( = ?auto_19887 ?auto_19888 ) ) ( not ( = ?auto_19887 ?auto_19901 ) ) ( not ( = ?auto_19888 ?auto_19901 ) ) ( not ( = ?auto_19894 ?auto_19903 ) ) ( not ( = ?auto_19887 ?auto_19889 ) ) ( not ( = ?auto_19887 ?auto_19898 ) ) ( not ( = ?auto_19889 ?auto_19901 ) ) ( not ( = ?auto_19899 ?auto_19906 ) ) ( not ( = ?auto_19905 ?auto_19903 ) ) ( not ( = ?auto_19898 ?auto_19901 ) ) ( not ( = ?auto_19887 ?auto_19890 ) ) ( not ( = ?auto_19887 ?auto_19900 ) ) ( not ( = ?auto_19888 ?auto_19890 ) ) ( not ( = ?auto_19888 ?auto_19900 ) ) ( not ( = ?auto_19890 ?auto_19898 ) ) ( not ( = ?auto_19890 ?auto_19901 ) ) ( not ( = ?auto_19904 ?auto_19899 ) ) ( not ( = ?auto_19904 ?auto_19906 ) ) ( not ( = ?auto_19902 ?auto_19905 ) ) ( not ( = ?auto_19902 ?auto_19903 ) ) ( not ( = ?auto_19900 ?auto_19898 ) ) ( not ( = ?auto_19900 ?auto_19901 ) ) ( not ( = ?auto_19887 ?auto_19891 ) ) ( not ( = ?auto_19887 ?auto_19896 ) ) ( not ( = ?auto_19888 ?auto_19891 ) ) ( not ( = ?auto_19888 ?auto_19896 ) ) ( not ( = ?auto_19889 ?auto_19891 ) ) ( not ( = ?auto_19889 ?auto_19896 ) ) ( not ( = ?auto_19891 ?auto_19900 ) ) ( not ( = ?auto_19891 ?auto_19898 ) ) ( not ( = ?auto_19891 ?auto_19901 ) ) ( not ( = ?auto_19895 ?auto_19904 ) ) ( not ( = ?auto_19895 ?auto_19899 ) ) ( not ( = ?auto_19895 ?auto_19906 ) ) ( not ( = ?auto_19897 ?auto_19902 ) ) ( not ( = ?auto_19897 ?auto_19905 ) ) ( not ( = ?auto_19897 ?auto_19903 ) ) ( not ( = ?auto_19896 ?auto_19900 ) ) ( not ( = ?auto_19896 ?auto_19898 ) ) ( not ( = ?auto_19896 ?auto_19901 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_19887 ?auto_19888 ?auto_19889 ?auto_19890 )
      ( MAKE-1CRATE ?auto_19890 ?auto_19891 )
      ( MAKE-4CRATE-VERIFY ?auto_19887 ?auto_19888 ?auto_19889 ?auto_19890 ?auto_19891 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19923 - SURFACE
      ?auto_19924 - SURFACE
      ?auto_19925 - SURFACE
      ?auto_19926 - SURFACE
      ?auto_19927 - SURFACE
      ?auto_19928 - SURFACE
    )
    :vars
    (
      ?auto_19932 - HOIST
      ?auto_19934 - PLACE
      ?auto_19930 - PLACE
      ?auto_19931 - HOIST
      ?auto_19933 - SURFACE
      ?auto_19937 - PLACE
      ?auto_19940 - HOIST
      ?auto_19941 - SURFACE
      ?auto_19943 - PLACE
      ?auto_19946 - HOIST
      ?auto_19936 - SURFACE
      ?auto_19945 - PLACE
      ?auto_19944 - HOIST
      ?auto_19938 - SURFACE
      ?auto_19939 - PLACE
      ?auto_19942 - HOIST
      ?auto_19935 - SURFACE
      ?auto_19929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19932 ?auto_19934 ) ( IS-CRATE ?auto_19928 ) ( not ( = ?auto_19930 ?auto_19934 ) ) ( HOIST-AT ?auto_19931 ?auto_19930 ) ( AVAILABLE ?auto_19931 ) ( SURFACE-AT ?auto_19928 ?auto_19930 ) ( ON ?auto_19928 ?auto_19933 ) ( CLEAR ?auto_19928 ) ( not ( = ?auto_19927 ?auto_19928 ) ) ( not ( = ?auto_19927 ?auto_19933 ) ) ( not ( = ?auto_19928 ?auto_19933 ) ) ( not ( = ?auto_19932 ?auto_19931 ) ) ( IS-CRATE ?auto_19927 ) ( not ( = ?auto_19937 ?auto_19934 ) ) ( HOIST-AT ?auto_19940 ?auto_19937 ) ( AVAILABLE ?auto_19940 ) ( SURFACE-AT ?auto_19927 ?auto_19937 ) ( ON ?auto_19927 ?auto_19941 ) ( CLEAR ?auto_19927 ) ( not ( = ?auto_19926 ?auto_19927 ) ) ( not ( = ?auto_19926 ?auto_19941 ) ) ( not ( = ?auto_19927 ?auto_19941 ) ) ( not ( = ?auto_19932 ?auto_19940 ) ) ( IS-CRATE ?auto_19926 ) ( not ( = ?auto_19943 ?auto_19934 ) ) ( HOIST-AT ?auto_19946 ?auto_19943 ) ( AVAILABLE ?auto_19946 ) ( SURFACE-AT ?auto_19926 ?auto_19943 ) ( ON ?auto_19926 ?auto_19936 ) ( CLEAR ?auto_19926 ) ( not ( = ?auto_19925 ?auto_19926 ) ) ( not ( = ?auto_19925 ?auto_19936 ) ) ( not ( = ?auto_19926 ?auto_19936 ) ) ( not ( = ?auto_19932 ?auto_19946 ) ) ( IS-CRATE ?auto_19925 ) ( not ( = ?auto_19945 ?auto_19934 ) ) ( HOIST-AT ?auto_19944 ?auto_19945 ) ( AVAILABLE ?auto_19944 ) ( SURFACE-AT ?auto_19925 ?auto_19945 ) ( ON ?auto_19925 ?auto_19938 ) ( CLEAR ?auto_19925 ) ( not ( = ?auto_19924 ?auto_19925 ) ) ( not ( = ?auto_19924 ?auto_19938 ) ) ( not ( = ?auto_19925 ?auto_19938 ) ) ( not ( = ?auto_19932 ?auto_19944 ) ) ( SURFACE-AT ?auto_19923 ?auto_19934 ) ( CLEAR ?auto_19923 ) ( IS-CRATE ?auto_19924 ) ( AVAILABLE ?auto_19932 ) ( not ( = ?auto_19939 ?auto_19934 ) ) ( HOIST-AT ?auto_19942 ?auto_19939 ) ( AVAILABLE ?auto_19942 ) ( SURFACE-AT ?auto_19924 ?auto_19939 ) ( ON ?auto_19924 ?auto_19935 ) ( CLEAR ?auto_19924 ) ( TRUCK-AT ?auto_19929 ?auto_19934 ) ( not ( = ?auto_19923 ?auto_19924 ) ) ( not ( = ?auto_19923 ?auto_19935 ) ) ( not ( = ?auto_19924 ?auto_19935 ) ) ( not ( = ?auto_19932 ?auto_19942 ) ) ( not ( = ?auto_19923 ?auto_19925 ) ) ( not ( = ?auto_19923 ?auto_19938 ) ) ( not ( = ?auto_19925 ?auto_19935 ) ) ( not ( = ?auto_19945 ?auto_19939 ) ) ( not ( = ?auto_19944 ?auto_19942 ) ) ( not ( = ?auto_19938 ?auto_19935 ) ) ( not ( = ?auto_19923 ?auto_19926 ) ) ( not ( = ?auto_19923 ?auto_19936 ) ) ( not ( = ?auto_19924 ?auto_19926 ) ) ( not ( = ?auto_19924 ?auto_19936 ) ) ( not ( = ?auto_19926 ?auto_19938 ) ) ( not ( = ?auto_19926 ?auto_19935 ) ) ( not ( = ?auto_19943 ?auto_19945 ) ) ( not ( = ?auto_19943 ?auto_19939 ) ) ( not ( = ?auto_19946 ?auto_19944 ) ) ( not ( = ?auto_19946 ?auto_19942 ) ) ( not ( = ?auto_19936 ?auto_19938 ) ) ( not ( = ?auto_19936 ?auto_19935 ) ) ( not ( = ?auto_19923 ?auto_19927 ) ) ( not ( = ?auto_19923 ?auto_19941 ) ) ( not ( = ?auto_19924 ?auto_19927 ) ) ( not ( = ?auto_19924 ?auto_19941 ) ) ( not ( = ?auto_19925 ?auto_19927 ) ) ( not ( = ?auto_19925 ?auto_19941 ) ) ( not ( = ?auto_19927 ?auto_19936 ) ) ( not ( = ?auto_19927 ?auto_19938 ) ) ( not ( = ?auto_19927 ?auto_19935 ) ) ( not ( = ?auto_19937 ?auto_19943 ) ) ( not ( = ?auto_19937 ?auto_19945 ) ) ( not ( = ?auto_19937 ?auto_19939 ) ) ( not ( = ?auto_19940 ?auto_19946 ) ) ( not ( = ?auto_19940 ?auto_19944 ) ) ( not ( = ?auto_19940 ?auto_19942 ) ) ( not ( = ?auto_19941 ?auto_19936 ) ) ( not ( = ?auto_19941 ?auto_19938 ) ) ( not ( = ?auto_19941 ?auto_19935 ) ) ( not ( = ?auto_19923 ?auto_19928 ) ) ( not ( = ?auto_19923 ?auto_19933 ) ) ( not ( = ?auto_19924 ?auto_19928 ) ) ( not ( = ?auto_19924 ?auto_19933 ) ) ( not ( = ?auto_19925 ?auto_19928 ) ) ( not ( = ?auto_19925 ?auto_19933 ) ) ( not ( = ?auto_19926 ?auto_19928 ) ) ( not ( = ?auto_19926 ?auto_19933 ) ) ( not ( = ?auto_19928 ?auto_19941 ) ) ( not ( = ?auto_19928 ?auto_19936 ) ) ( not ( = ?auto_19928 ?auto_19938 ) ) ( not ( = ?auto_19928 ?auto_19935 ) ) ( not ( = ?auto_19930 ?auto_19937 ) ) ( not ( = ?auto_19930 ?auto_19943 ) ) ( not ( = ?auto_19930 ?auto_19945 ) ) ( not ( = ?auto_19930 ?auto_19939 ) ) ( not ( = ?auto_19931 ?auto_19940 ) ) ( not ( = ?auto_19931 ?auto_19946 ) ) ( not ( = ?auto_19931 ?auto_19944 ) ) ( not ( = ?auto_19931 ?auto_19942 ) ) ( not ( = ?auto_19933 ?auto_19941 ) ) ( not ( = ?auto_19933 ?auto_19936 ) ) ( not ( = ?auto_19933 ?auto_19938 ) ) ( not ( = ?auto_19933 ?auto_19935 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_19923 ?auto_19924 ?auto_19925 ?auto_19926 ?auto_19927 )
      ( MAKE-1CRATE ?auto_19927 ?auto_19928 )
      ( MAKE-5CRATE-VERIFY ?auto_19923 ?auto_19924 ?auto_19925 ?auto_19926 ?auto_19927 ?auto_19928 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_19964 - SURFACE
      ?auto_19965 - SURFACE
      ?auto_19966 - SURFACE
      ?auto_19967 - SURFACE
      ?auto_19968 - SURFACE
      ?auto_19969 - SURFACE
      ?auto_19970 - SURFACE
    )
    :vars
    (
      ?auto_19974 - HOIST
      ?auto_19976 - PLACE
      ?auto_19973 - PLACE
      ?auto_19971 - HOIST
      ?auto_19975 - SURFACE
      ?auto_19978 - PLACE
      ?auto_19982 - HOIST
      ?auto_19991 - SURFACE
      ?auto_19985 - PLACE
      ?auto_19989 - HOIST
      ?auto_19988 - SURFACE
      ?auto_19979 - PLACE
      ?auto_19986 - HOIST
      ?auto_19984 - SURFACE
      ?auto_19980 - PLACE
      ?auto_19977 - HOIST
      ?auto_19983 - SURFACE
      ?auto_19990 - PLACE
      ?auto_19987 - HOIST
      ?auto_19981 - SURFACE
      ?auto_19972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19974 ?auto_19976 ) ( IS-CRATE ?auto_19970 ) ( not ( = ?auto_19973 ?auto_19976 ) ) ( HOIST-AT ?auto_19971 ?auto_19973 ) ( AVAILABLE ?auto_19971 ) ( SURFACE-AT ?auto_19970 ?auto_19973 ) ( ON ?auto_19970 ?auto_19975 ) ( CLEAR ?auto_19970 ) ( not ( = ?auto_19969 ?auto_19970 ) ) ( not ( = ?auto_19969 ?auto_19975 ) ) ( not ( = ?auto_19970 ?auto_19975 ) ) ( not ( = ?auto_19974 ?auto_19971 ) ) ( IS-CRATE ?auto_19969 ) ( not ( = ?auto_19978 ?auto_19976 ) ) ( HOIST-AT ?auto_19982 ?auto_19978 ) ( AVAILABLE ?auto_19982 ) ( SURFACE-AT ?auto_19969 ?auto_19978 ) ( ON ?auto_19969 ?auto_19991 ) ( CLEAR ?auto_19969 ) ( not ( = ?auto_19968 ?auto_19969 ) ) ( not ( = ?auto_19968 ?auto_19991 ) ) ( not ( = ?auto_19969 ?auto_19991 ) ) ( not ( = ?auto_19974 ?auto_19982 ) ) ( IS-CRATE ?auto_19968 ) ( not ( = ?auto_19985 ?auto_19976 ) ) ( HOIST-AT ?auto_19989 ?auto_19985 ) ( AVAILABLE ?auto_19989 ) ( SURFACE-AT ?auto_19968 ?auto_19985 ) ( ON ?auto_19968 ?auto_19988 ) ( CLEAR ?auto_19968 ) ( not ( = ?auto_19967 ?auto_19968 ) ) ( not ( = ?auto_19967 ?auto_19988 ) ) ( not ( = ?auto_19968 ?auto_19988 ) ) ( not ( = ?auto_19974 ?auto_19989 ) ) ( IS-CRATE ?auto_19967 ) ( not ( = ?auto_19979 ?auto_19976 ) ) ( HOIST-AT ?auto_19986 ?auto_19979 ) ( AVAILABLE ?auto_19986 ) ( SURFACE-AT ?auto_19967 ?auto_19979 ) ( ON ?auto_19967 ?auto_19984 ) ( CLEAR ?auto_19967 ) ( not ( = ?auto_19966 ?auto_19967 ) ) ( not ( = ?auto_19966 ?auto_19984 ) ) ( not ( = ?auto_19967 ?auto_19984 ) ) ( not ( = ?auto_19974 ?auto_19986 ) ) ( IS-CRATE ?auto_19966 ) ( not ( = ?auto_19980 ?auto_19976 ) ) ( HOIST-AT ?auto_19977 ?auto_19980 ) ( AVAILABLE ?auto_19977 ) ( SURFACE-AT ?auto_19966 ?auto_19980 ) ( ON ?auto_19966 ?auto_19983 ) ( CLEAR ?auto_19966 ) ( not ( = ?auto_19965 ?auto_19966 ) ) ( not ( = ?auto_19965 ?auto_19983 ) ) ( not ( = ?auto_19966 ?auto_19983 ) ) ( not ( = ?auto_19974 ?auto_19977 ) ) ( SURFACE-AT ?auto_19964 ?auto_19976 ) ( CLEAR ?auto_19964 ) ( IS-CRATE ?auto_19965 ) ( AVAILABLE ?auto_19974 ) ( not ( = ?auto_19990 ?auto_19976 ) ) ( HOIST-AT ?auto_19987 ?auto_19990 ) ( AVAILABLE ?auto_19987 ) ( SURFACE-AT ?auto_19965 ?auto_19990 ) ( ON ?auto_19965 ?auto_19981 ) ( CLEAR ?auto_19965 ) ( TRUCK-AT ?auto_19972 ?auto_19976 ) ( not ( = ?auto_19964 ?auto_19965 ) ) ( not ( = ?auto_19964 ?auto_19981 ) ) ( not ( = ?auto_19965 ?auto_19981 ) ) ( not ( = ?auto_19974 ?auto_19987 ) ) ( not ( = ?auto_19964 ?auto_19966 ) ) ( not ( = ?auto_19964 ?auto_19983 ) ) ( not ( = ?auto_19966 ?auto_19981 ) ) ( not ( = ?auto_19980 ?auto_19990 ) ) ( not ( = ?auto_19977 ?auto_19987 ) ) ( not ( = ?auto_19983 ?auto_19981 ) ) ( not ( = ?auto_19964 ?auto_19967 ) ) ( not ( = ?auto_19964 ?auto_19984 ) ) ( not ( = ?auto_19965 ?auto_19967 ) ) ( not ( = ?auto_19965 ?auto_19984 ) ) ( not ( = ?auto_19967 ?auto_19983 ) ) ( not ( = ?auto_19967 ?auto_19981 ) ) ( not ( = ?auto_19979 ?auto_19980 ) ) ( not ( = ?auto_19979 ?auto_19990 ) ) ( not ( = ?auto_19986 ?auto_19977 ) ) ( not ( = ?auto_19986 ?auto_19987 ) ) ( not ( = ?auto_19984 ?auto_19983 ) ) ( not ( = ?auto_19984 ?auto_19981 ) ) ( not ( = ?auto_19964 ?auto_19968 ) ) ( not ( = ?auto_19964 ?auto_19988 ) ) ( not ( = ?auto_19965 ?auto_19968 ) ) ( not ( = ?auto_19965 ?auto_19988 ) ) ( not ( = ?auto_19966 ?auto_19968 ) ) ( not ( = ?auto_19966 ?auto_19988 ) ) ( not ( = ?auto_19968 ?auto_19984 ) ) ( not ( = ?auto_19968 ?auto_19983 ) ) ( not ( = ?auto_19968 ?auto_19981 ) ) ( not ( = ?auto_19985 ?auto_19979 ) ) ( not ( = ?auto_19985 ?auto_19980 ) ) ( not ( = ?auto_19985 ?auto_19990 ) ) ( not ( = ?auto_19989 ?auto_19986 ) ) ( not ( = ?auto_19989 ?auto_19977 ) ) ( not ( = ?auto_19989 ?auto_19987 ) ) ( not ( = ?auto_19988 ?auto_19984 ) ) ( not ( = ?auto_19988 ?auto_19983 ) ) ( not ( = ?auto_19988 ?auto_19981 ) ) ( not ( = ?auto_19964 ?auto_19969 ) ) ( not ( = ?auto_19964 ?auto_19991 ) ) ( not ( = ?auto_19965 ?auto_19969 ) ) ( not ( = ?auto_19965 ?auto_19991 ) ) ( not ( = ?auto_19966 ?auto_19969 ) ) ( not ( = ?auto_19966 ?auto_19991 ) ) ( not ( = ?auto_19967 ?auto_19969 ) ) ( not ( = ?auto_19967 ?auto_19991 ) ) ( not ( = ?auto_19969 ?auto_19988 ) ) ( not ( = ?auto_19969 ?auto_19984 ) ) ( not ( = ?auto_19969 ?auto_19983 ) ) ( not ( = ?auto_19969 ?auto_19981 ) ) ( not ( = ?auto_19978 ?auto_19985 ) ) ( not ( = ?auto_19978 ?auto_19979 ) ) ( not ( = ?auto_19978 ?auto_19980 ) ) ( not ( = ?auto_19978 ?auto_19990 ) ) ( not ( = ?auto_19982 ?auto_19989 ) ) ( not ( = ?auto_19982 ?auto_19986 ) ) ( not ( = ?auto_19982 ?auto_19977 ) ) ( not ( = ?auto_19982 ?auto_19987 ) ) ( not ( = ?auto_19991 ?auto_19988 ) ) ( not ( = ?auto_19991 ?auto_19984 ) ) ( not ( = ?auto_19991 ?auto_19983 ) ) ( not ( = ?auto_19991 ?auto_19981 ) ) ( not ( = ?auto_19964 ?auto_19970 ) ) ( not ( = ?auto_19964 ?auto_19975 ) ) ( not ( = ?auto_19965 ?auto_19970 ) ) ( not ( = ?auto_19965 ?auto_19975 ) ) ( not ( = ?auto_19966 ?auto_19970 ) ) ( not ( = ?auto_19966 ?auto_19975 ) ) ( not ( = ?auto_19967 ?auto_19970 ) ) ( not ( = ?auto_19967 ?auto_19975 ) ) ( not ( = ?auto_19968 ?auto_19970 ) ) ( not ( = ?auto_19968 ?auto_19975 ) ) ( not ( = ?auto_19970 ?auto_19991 ) ) ( not ( = ?auto_19970 ?auto_19988 ) ) ( not ( = ?auto_19970 ?auto_19984 ) ) ( not ( = ?auto_19970 ?auto_19983 ) ) ( not ( = ?auto_19970 ?auto_19981 ) ) ( not ( = ?auto_19973 ?auto_19978 ) ) ( not ( = ?auto_19973 ?auto_19985 ) ) ( not ( = ?auto_19973 ?auto_19979 ) ) ( not ( = ?auto_19973 ?auto_19980 ) ) ( not ( = ?auto_19973 ?auto_19990 ) ) ( not ( = ?auto_19971 ?auto_19982 ) ) ( not ( = ?auto_19971 ?auto_19989 ) ) ( not ( = ?auto_19971 ?auto_19986 ) ) ( not ( = ?auto_19971 ?auto_19977 ) ) ( not ( = ?auto_19971 ?auto_19987 ) ) ( not ( = ?auto_19975 ?auto_19991 ) ) ( not ( = ?auto_19975 ?auto_19988 ) ) ( not ( = ?auto_19975 ?auto_19984 ) ) ( not ( = ?auto_19975 ?auto_19983 ) ) ( not ( = ?auto_19975 ?auto_19981 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_19964 ?auto_19965 ?auto_19966 ?auto_19967 ?auto_19968 ?auto_19969 )
      ( MAKE-1CRATE ?auto_19969 ?auto_19970 )
      ( MAKE-6CRATE-VERIFY ?auto_19964 ?auto_19965 ?auto_19966 ?auto_19967 ?auto_19968 ?auto_19969 ?auto_19970 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_20010 - SURFACE
      ?auto_20011 - SURFACE
      ?auto_20012 - SURFACE
      ?auto_20013 - SURFACE
      ?auto_20014 - SURFACE
      ?auto_20015 - SURFACE
      ?auto_20016 - SURFACE
      ?auto_20017 - SURFACE
    )
    :vars
    (
      ?auto_20022 - HOIST
      ?auto_20019 - PLACE
      ?auto_20020 - PLACE
      ?auto_20023 - HOIST
      ?auto_20021 - SURFACE
      ?auto_20033 - PLACE
      ?auto_20032 - HOIST
      ?auto_20027 - SURFACE
      ?auto_20035 - PLACE
      ?auto_20030 - HOIST
      ?auto_20037 - SURFACE
      ?auto_20039 - PLACE
      ?auto_20025 - HOIST
      ?auto_20026 - SURFACE
      ?auto_20036 - PLACE
      ?auto_20041 - HOIST
      ?auto_20029 - SURFACE
      ?auto_20034 - PLACE
      ?auto_20038 - HOIST
      ?auto_20024 - SURFACE
      ?auto_20028 - PLACE
      ?auto_20040 - HOIST
      ?auto_20031 - SURFACE
      ?auto_20018 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20022 ?auto_20019 ) ( IS-CRATE ?auto_20017 ) ( not ( = ?auto_20020 ?auto_20019 ) ) ( HOIST-AT ?auto_20023 ?auto_20020 ) ( AVAILABLE ?auto_20023 ) ( SURFACE-AT ?auto_20017 ?auto_20020 ) ( ON ?auto_20017 ?auto_20021 ) ( CLEAR ?auto_20017 ) ( not ( = ?auto_20016 ?auto_20017 ) ) ( not ( = ?auto_20016 ?auto_20021 ) ) ( not ( = ?auto_20017 ?auto_20021 ) ) ( not ( = ?auto_20022 ?auto_20023 ) ) ( IS-CRATE ?auto_20016 ) ( not ( = ?auto_20033 ?auto_20019 ) ) ( HOIST-AT ?auto_20032 ?auto_20033 ) ( AVAILABLE ?auto_20032 ) ( SURFACE-AT ?auto_20016 ?auto_20033 ) ( ON ?auto_20016 ?auto_20027 ) ( CLEAR ?auto_20016 ) ( not ( = ?auto_20015 ?auto_20016 ) ) ( not ( = ?auto_20015 ?auto_20027 ) ) ( not ( = ?auto_20016 ?auto_20027 ) ) ( not ( = ?auto_20022 ?auto_20032 ) ) ( IS-CRATE ?auto_20015 ) ( not ( = ?auto_20035 ?auto_20019 ) ) ( HOIST-AT ?auto_20030 ?auto_20035 ) ( AVAILABLE ?auto_20030 ) ( SURFACE-AT ?auto_20015 ?auto_20035 ) ( ON ?auto_20015 ?auto_20037 ) ( CLEAR ?auto_20015 ) ( not ( = ?auto_20014 ?auto_20015 ) ) ( not ( = ?auto_20014 ?auto_20037 ) ) ( not ( = ?auto_20015 ?auto_20037 ) ) ( not ( = ?auto_20022 ?auto_20030 ) ) ( IS-CRATE ?auto_20014 ) ( not ( = ?auto_20039 ?auto_20019 ) ) ( HOIST-AT ?auto_20025 ?auto_20039 ) ( AVAILABLE ?auto_20025 ) ( SURFACE-AT ?auto_20014 ?auto_20039 ) ( ON ?auto_20014 ?auto_20026 ) ( CLEAR ?auto_20014 ) ( not ( = ?auto_20013 ?auto_20014 ) ) ( not ( = ?auto_20013 ?auto_20026 ) ) ( not ( = ?auto_20014 ?auto_20026 ) ) ( not ( = ?auto_20022 ?auto_20025 ) ) ( IS-CRATE ?auto_20013 ) ( not ( = ?auto_20036 ?auto_20019 ) ) ( HOIST-AT ?auto_20041 ?auto_20036 ) ( AVAILABLE ?auto_20041 ) ( SURFACE-AT ?auto_20013 ?auto_20036 ) ( ON ?auto_20013 ?auto_20029 ) ( CLEAR ?auto_20013 ) ( not ( = ?auto_20012 ?auto_20013 ) ) ( not ( = ?auto_20012 ?auto_20029 ) ) ( not ( = ?auto_20013 ?auto_20029 ) ) ( not ( = ?auto_20022 ?auto_20041 ) ) ( IS-CRATE ?auto_20012 ) ( not ( = ?auto_20034 ?auto_20019 ) ) ( HOIST-AT ?auto_20038 ?auto_20034 ) ( AVAILABLE ?auto_20038 ) ( SURFACE-AT ?auto_20012 ?auto_20034 ) ( ON ?auto_20012 ?auto_20024 ) ( CLEAR ?auto_20012 ) ( not ( = ?auto_20011 ?auto_20012 ) ) ( not ( = ?auto_20011 ?auto_20024 ) ) ( not ( = ?auto_20012 ?auto_20024 ) ) ( not ( = ?auto_20022 ?auto_20038 ) ) ( SURFACE-AT ?auto_20010 ?auto_20019 ) ( CLEAR ?auto_20010 ) ( IS-CRATE ?auto_20011 ) ( AVAILABLE ?auto_20022 ) ( not ( = ?auto_20028 ?auto_20019 ) ) ( HOIST-AT ?auto_20040 ?auto_20028 ) ( AVAILABLE ?auto_20040 ) ( SURFACE-AT ?auto_20011 ?auto_20028 ) ( ON ?auto_20011 ?auto_20031 ) ( CLEAR ?auto_20011 ) ( TRUCK-AT ?auto_20018 ?auto_20019 ) ( not ( = ?auto_20010 ?auto_20011 ) ) ( not ( = ?auto_20010 ?auto_20031 ) ) ( not ( = ?auto_20011 ?auto_20031 ) ) ( not ( = ?auto_20022 ?auto_20040 ) ) ( not ( = ?auto_20010 ?auto_20012 ) ) ( not ( = ?auto_20010 ?auto_20024 ) ) ( not ( = ?auto_20012 ?auto_20031 ) ) ( not ( = ?auto_20034 ?auto_20028 ) ) ( not ( = ?auto_20038 ?auto_20040 ) ) ( not ( = ?auto_20024 ?auto_20031 ) ) ( not ( = ?auto_20010 ?auto_20013 ) ) ( not ( = ?auto_20010 ?auto_20029 ) ) ( not ( = ?auto_20011 ?auto_20013 ) ) ( not ( = ?auto_20011 ?auto_20029 ) ) ( not ( = ?auto_20013 ?auto_20024 ) ) ( not ( = ?auto_20013 ?auto_20031 ) ) ( not ( = ?auto_20036 ?auto_20034 ) ) ( not ( = ?auto_20036 ?auto_20028 ) ) ( not ( = ?auto_20041 ?auto_20038 ) ) ( not ( = ?auto_20041 ?auto_20040 ) ) ( not ( = ?auto_20029 ?auto_20024 ) ) ( not ( = ?auto_20029 ?auto_20031 ) ) ( not ( = ?auto_20010 ?auto_20014 ) ) ( not ( = ?auto_20010 ?auto_20026 ) ) ( not ( = ?auto_20011 ?auto_20014 ) ) ( not ( = ?auto_20011 ?auto_20026 ) ) ( not ( = ?auto_20012 ?auto_20014 ) ) ( not ( = ?auto_20012 ?auto_20026 ) ) ( not ( = ?auto_20014 ?auto_20029 ) ) ( not ( = ?auto_20014 ?auto_20024 ) ) ( not ( = ?auto_20014 ?auto_20031 ) ) ( not ( = ?auto_20039 ?auto_20036 ) ) ( not ( = ?auto_20039 ?auto_20034 ) ) ( not ( = ?auto_20039 ?auto_20028 ) ) ( not ( = ?auto_20025 ?auto_20041 ) ) ( not ( = ?auto_20025 ?auto_20038 ) ) ( not ( = ?auto_20025 ?auto_20040 ) ) ( not ( = ?auto_20026 ?auto_20029 ) ) ( not ( = ?auto_20026 ?auto_20024 ) ) ( not ( = ?auto_20026 ?auto_20031 ) ) ( not ( = ?auto_20010 ?auto_20015 ) ) ( not ( = ?auto_20010 ?auto_20037 ) ) ( not ( = ?auto_20011 ?auto_20015 ) ) ( not ( = ?auto_20011 ?auto_20037 ) ) ( not ( = ?auto_20012 ?auto_20015 ) ) ( not ( = ?auto_20012 ?auto_20037 ) ) ( not ( = ?auto_20013 ?auto_20015 ) ) ( not ( = ?auto_20013 ?auto_20037 ) ) ( not ( = ?auto_20015 ?auto_20026 ) ) ( not ( = ?auto_20015 ?auto_20029 ) ) ( not ( = ?auto_20015 ?auto_20024 ) ) ( not ( = ?auto_20015 ?auto_20031 ) ) ( not ( = ?auto_20035 ?auto_20039 ) ) ( not ( = ?auto_20035 ?auto_20036 ) ) ( not ( = ?auto_20035 ?auto_20034 ) ) ( not ( = ?auto_20035 ?auto_20028 ) ) ( not ( = ?auto_20030 ?auto_20025 ) ) ( not ( = ?auto_20030 ?auto_20041 ) ) ( not ( = ?auto_20030 ?auto_20038 ) ) ( not ( = ?auto_20030 ?auto_20040 ) ) ( not ( = ?auto_20037 ?auto_20026 ) ) ( not ( = ?auto_20037 ?auto_20029 ) ) ( not ( = ?auto_20037 ?auto_20024 ) ) ( not ( = ?auto_20037 ?auto_20031 ) ) ( not ( = ?auto_20010 ?auto_20016 ) ) ( not ( = ?auto_20010 ?auto_20027 ) ) ( not ( = ?auto_20011 ?auto_20016 ) ) ( not ( = ?auto_20011 ?auto_20027 ) ) ( not ( = ?auto_20012 ?auto_20016 ) ) ( not ( = ?auto_20012 ?auto_20027 ) ) ( not ( = ?auto_20013 ?auto_20016 ) ) ( not ( = ?auto_20013 ?auto_20027 ) ) ( not ( = ?auto_20014 ?auto_20016 ) ) ( not ( = ?auto_20014 ?auto_20027 ) ) ( not ( = ?auto_20016 ?auto_20037 ) ) ( not ( = ?auto_20016 ?auto_20026 ) ) ( not ( = ?auto_20016 ?auto_20029 ) ) ( not ( = ?auto_20016 ?auto_20024 ) ) ( not ( = ?auto_20016 ?auto_20031 ) ) ( not ( = ?auto_20033 ?auto_20035 ) ) ( not ( = ?auto_20033 ?auto_20039 ) ) ( not ( = ?auto_20033 ?auto_20036 ) ) ( not ( = ?auto_20033 ?auto_20034 ) ) ( not ( = ?auto_20033 ?auto_20028 ) ) ( not ( = ?auto_20032 ?auto_20030 ) ) ( not ( = ?auto_20032 ?auto_20025 ) ) ( not ( = ?auto_20032 ?auto_20041 ) ) ( not ( = ?auto_20032 ?auto_20038 ) ) ( not ( = ?auto_20032 ?auto_20040 ) ) ( not ( = ?auto_20027 ?auto_20037 ) ) ( not ( = ?auto_20027 ?auto_20026 ) ) ( not ( = ?auto_20027 ?auto_20029 ) ) ( not ( = ?auto_20027 ?auto_20024 ) ) ( not ( = ?auto_20027 ?auto_20031 ) ) ( not ( = ?auto_20010 ?auto_20017 ) ) ( not ( = ?auto_20010 ?auto_20021 ) ) ( not ( = ?auto_20011 ?auto_20017 ) ) ( not ( = ?auto_20011 ?auto_20021 ) ) ( not ( = ?auto_20012 ?auto_20017 ) ) ( not ( = ?auto_20012 ?auto_20021 ) ) ( not ( = ?auto_20013 ?auto_20017 ) ) ( not ( = ?auto_20013 ?auto_20021 ) ) ( not ( = ?auto_20014 ?auto_20017 ) ) ( not ( = ?auto_20014 ?auto_20021 ) ) ( not ( = ?auto_20015 ?auto_20017 ) ) ( not ( = ?auto_20015 ?auto_20021 ) ) ( not ( = ?auto_20017 ?auto_20027 ) ) ( not ( = ?auto_20017 ?auto_20037 ) ) ( not ( = ?auto_20017 ?auto_20026 ) ) ( not ( = ?auto_20017 ?auto_20029 ) ) ( not ( = ?auto_20017 ?auto_20024 ) ) ( not ( = ?auto_20017 ?auto_20031 ) ) ( not ( = ?auto_20020 ?auto_20033 ) ) ( not ( = ?auto_20020 ?auto_20035 ) ) ( not ( = ?auto_20020 ?auto_20039 ) ) ( not ( = ?auto_20020 ?auto_20036 ) ) ( not ( = ?auto_20020 ?auto_20034 ) ) ( not ( = ?auto_20020 ?auto_20028 ) ) ( not ( = ?auto_20023 ?auto_20032 ) ) ( not ( = ?auto_20023 ?auto_20030 ) ) ( not ( = ?auto_20023 ?auto_20025 ) ) ( not ( = ?auto_20023 ?auto_20041 ) ) ( not ( = ?auto_20023 ?auto_20038 ) ) ( not ( = ?auto_20023 ?auto_20040 ) ) ( not ( = ?auto_20021 ?auto_20027 ) ) ( not ( = ?auto_20021 ?auto_20037 ) ) ( not ( = ?auto_20021 ?auto_20026 ) ) ( not ( = ?auto_20021 ?auto_20029 ) ) ( not ( = ?auto_20021 ?auto_20024 ) ) ( not ( = ?auto_20021 ?auto_20031 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_20010 ?auto_20011 ?auto_20012 ?auto_20013 ?auto_20014 ?auto_20015 ?auto_20016 )
      ( MAKE-1CRATE ?auto_20016 ?auto_20017 )
      ( MAKE-7CRATE-VERIFY ?auto_20010 ?auto_20011 ?auto_20012 ?auto_20013 ?auto_20014 ?auto_20015 ?auto_20016 ?auto_20017 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_20061 - SURFACE
      ?auto_20062 - SURFACE
      ?auto_20063 - SURFACE
      ?auto_20064 - SURFACE
      ?auto_20065 - SURFACE
      ?auto_20066 - SURFACE
      ?auto_20067 - SURFACE
      ?auto_20068 - SURFACE
      ?auto_20069 - SURFACE
    )
    :vars
    (
      ?auto_20072 - HOIST
      ?auto_20071 - PLACE
      ?auto_20075 - PLACE
      ?auto_20074 - HOIST
      ?auto_20070 - SURFACE
      ?auto_20093 - PLACE
      ?auto_20090 - HOIST
      ?auto_20095 - SURFACE
      ?auto_20079 - PLACE
      ?auto_20077 - HOIST
      ?auto_20084 - SURFACE
      ?auto_20080 - PLACE
      ?auto_20076 - HOIST
      ?auto_20082 - SURFACE
      ?auto_20092 - PLACE
      ?auto_20085 - HOIST
      ?auto_20086 - SURFACE
      ?auto_20081 - PLACE
      ?auto_20088 - HOIST
      ?auto_20094 - SURFACE
      ?auto_20078 - PLACE
      ?auto_20087 - HOIST
      ?auto_20091 - SURFACE
      ?auto_20096 - PLACE
      ?auto_20089 - HOIST
      ?auto_20083 - SURFACE
      ?auto_20073 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20072 ?auto_20071 ) ( IS-CRATE ?auto_20069 ) ( not ( = ?auto_20075 ?auto_20071 ) ) ( HOIST-AT ?auto_20074 ?auto_20075 ) ( AVAILABLE ?auto_20074 ) ( SURFACE-AT ?auto_20069 ?auto_20075 ) ( ON ?auto_20069 ?auto_20070 ) ( CLEAR ?auto_20069 ) ( not ( = ?auto_20068 ?auto_20069 ) ) ( not ( = ?auto_20068 ?auto_20070 ) ) ( not ( = ?auto_20069 ?auto_20070 ) ) ( not ( = ?auto_20072 ?auto_20074 ) ) ( IS-CRATE ?auto_20068 ) ( not ( = ?auto_20093 ?auto_20071 ) ) ( HOIST-AT ?auto_20090 ?auto_20093 ) ( AVAILABLE ?auto_20090 ) ( SURFACE-AT ?auto_20068 ?auto_20093 ) ( ON ?auto_20068 ?auto_20095 ) ( CLEAR ?auto_20068 ) ( not ( = ?auto_20067 ?auto_20068 ) ) ( not ( = ?auto_20067 ?auto_20095 ) ) ( not ( = ?auto_20068 ?auto_20095 ) ) ( not ( = ?auto_20072 ?auto_20090 ) ) ( IS-CRATE ?auto_20067 ) ( not ( = ?auto_20079 ?auto_20071 ) ) ( HOIST-AT ?auto_20077 ?auto_20079 ) ( AVAILABLE ?auto_20077 ) ( SURFACE-AT ?auto_20067 ?auto_20079 ) ( ON ?auto_20067 ?auto_20084 ) ( CLEAR ?auto_20067 ) ( not ( = ?auto_20066 ?auto_20067 ) ) ( not ( = ?auto_20066 ?auto_20084 ) ) ( not ( = ?auto_20067 ?auto_20084 ) ) ( not ( = ?auto_20072 ?auto_20077 ) ) ( IS-CRATE ?auto_20066 ) ( not ( = ?auto_20080 ?auto_20071 ) ) ( HOIST-AT ?auto_20076 ?auto_20080 ) ( AVAILABLE ?auto_20076 ) ( SURFACE-AT ?auto_20066 ?auto_20080 ) ( ON ?auto_20066 ?auto_20082 ) ( CLEAR ?auto_20066 ) ( not ( = ?auto_20065 ?auto_20066 ) ) ( not ( = ?auto_20065 ?auto_20082 ) ) ( not ( = ?auto_20066 ?auto_20082 ) ) ( not ( = ?auto_20072 ?auto_20076 ) ) ( IS-CRATE ?auto_20065 ) ( not ( = ?auto_20092 ?auto_20071 ) ) ( HOIST-AT ?auto_20085 ?auto_20092 ) ( AVAILABLE ?auto_20085 ) ( SURFACE-AT ?auto_20065 ?auto_20092 ) ( ON ?auto_20065 ?auto_20086 ) ( CLEAR ?auto_20065 ) ( not ( = ?auto_20064 ?auto_20065 ) ) ( not ( = ?auto_20064 ?auto_20086 ) ) ( not ( = ?auto_20065 ?auto_20086 ) ) ( not ( = ?auto_20072 ?auto_20085 ) ) ( IS-CRATE ?auto_20064 ) ( not ( = ?auto_20081 ?auto_20071 ) ) ( HOIST-AT ?auto_20088 ?auto_20081 ) ( AVAILABLE ?auto_20088 ) ( SURFACE-AT ?auto_20064 ?auto_20081 ) ( ON ?auto_20064 ?auto_20094 ) ( CLEAR ?auto_20064 ) ( not ( = ?auto_20063 ?auto_20064 ) ) ( not ( = ?auto_20063 ?auto_20094 ) ) ( not ( = ?auto_20064 ?auto_20094 ) ) ( not ( = ?auto_20072 ?auto_20088 ) ) ( IS-CRATE ?auto_20063 ) ( not ( = ?auto_20078 ?auto_20071 ) ) ( HOIST-AT ?auto_20087 ?auto_20078 ) ( AVAILABLE ?auto_20087 ) ( SURFACE-AT ?auto_20063 ?auto_20078 ) ( ON ?auto_20063 ?auto_20091 ) ( CLEAR ?auto_20063 ) ( not ( = ?auto_20062 ?auto_20063 ) ) ( not ( = ?auto_20062 ?auto_20091 ) ) ( not ( = ?auto_20063 ?auto_20091 ) ) ( not ( = ?auto_20072 ?auto_20087 ) ) ( SURFACE-AT ?auto_20061 ?auto_20071 ) ( CLEAR ?auto_20061 ) ( IS-CRATE ?auto_20062 ) ( AVAILABLE ?auto_20072 ) ( not ( = ?auto_20096 ?auto_20071 ) ) ( HOIST-AT ?auto_20089 ?auto_20096 ) ( AVAILABLE ?auto_20089 ) ( SURFACE-AT ?auto_20062 ?auto_20096 ) ( ON ?auto_20062 ?auto_20083 ) ( CLEAR ?auto_20062 ) ( TRUCK-AT ?auto_20073 ?auto_20071 ) ( not ( = ?auto_20061 ?auto_20062 ) ) ( not ( = ?auto_20061 ?auto_20083 ) ) ( not ( = ?auto_20062 ?auto_20083 ) ) ( not ( = ?auto_20072 ?auto_20089 ) ) ( not ( = ?auto_20061 ?auto_20063 ) ) ( not ( = ?auto_20061 ?auto_20091 ) ) ( not ( = ?auto_20063 ?auto_20083 ) ) ( not ( = ?auto_20078 ?auto_20096 ) ) ( not ( = ?auto_20087 ?auto_20089 ) ) ( not ( = ?auto_20091 ?auto_20083 ) ) ( not ( = ?auto_20061 ?auto_20064 ) ) ( not ( = ?auto_20061 ?auto_20094 ) ) ( not ( = ?auto_20062 ?auto_20064 ) ) ( not ( = ?auto_20062 ?auto_20094 ) ) ( not ( = ?auto_20064 ?auto_20091 ) ) ( not ( = ?auto_20064 ?auto_20083 ) ) ( not ( = ?auto_20081 ?auto_20078 ) ) ( not ( = ?auto_20081 ?auto_20096 ) ) ( not ( = ?auto_20088 ?auto_20087 ) ) ( not ( = ?auto_20088 ?auto_20089 ) ) ( not ( = ?auto_20094 ?auto_20091 ) ) ( not ( = ?auto_20094 ?auto_20083 ) ) ( not ( = ?auto_20061 ?auto_20065 ) ) ( not ( = ?auto_20061 ?auto_20086 ) ) ( not ( = ?auto_20062 ?auto_20065 ) ) ( not ( = ?auto_20062 ?auto_20086 ) ) ( not ( = ?auto_20063 ?auto_20065 ) ) ( not ( = ?auto_20063 ?auto_20086 ) ) ( not ( = ?auto_20065 ?auto_20094 ) ) ( not ( = ?auto_20065 ?auto_20091 ) ) ( not ( = ?auto_20065 ?auto_20083 ) ) ( not ( = ?auto_20092 ?auto_20081 ) ) ( not ( = ?auto_20092 ?auto_20078 ) ) ( not ( = ?auto_20092 ?auto_20096 ) ) ( not ( = ?auto_20085 ?auto_20088 ) ) ( not ( = ?auto_20085 ?auto_20087 ) ) ( not ( = ?auto_20085 ?auto_20089 ) ) ( not ( = ?auto_20086 ?auto_20094 ) ) ( not ( = ?auto_20086 ?auto_20091 ) ) ( not ( = ?auto_20086 ?auto_20083 ) ) ( not ( = ?auto_20061 ?auto_20066 ) ) ( not ( = ?auto_20061 ?auto_20082 ) ) ( not ( = ?auto_20062 ?auto_20066 ) ) ( not ( = ?auto_20062 ?auto_20082 ) ) ( not ( = ?auto_20063 ?auto_20066 ) ) ( not ( = ?auto_20063 ?auto_20082 ) ) ( not ( = ?auto_20064 ?auto_20066 ) ) ( not ( = ?auto_20064 ?auto_20082 ) ) ( not ( = ?auto_20066 ?auto_20086 ) ) ( not ( = ?auto_20066 ?auto_20094 ) ) ( not ( = ?auto_20066 ?auto_20091 ) ) ( not ( = ?auto_20066 ?auto_20083 ) ) ( not ( = ?auto_20080 ?auto_20092 ) ) ( not ( = ?auto_20080 ?auto_20081 ) ) ( not ( = ?auto_20080 ?auto_20078 ) ) ( not ( = ?auto_20080 ?auto_20096 ) ) ( not ( = ?auto_20076 ?auto_20085 ) ) ( not ( = ?auto_20076 ?auto_20088 ) ) ( not ( = ?auto_20076 ?auto_20087 ) ) ( not ( = ?auto_20076 ?auto_20089 ) ) ( not ( = ?auto_20082 ?auto_20086 ) ) ( not ( = ?auto_20082 ?auto_20094 ) ) ( not ( = ?auto_20082 ?auto_20091 ) ) ( not ( = ?auto_20082 ?auto_20083 ) ) ( not ( = ?auto_20061 ?auto_20067 ) ) ( not ( = ?auto_20061 ?auto_20084 ) ) ( not ( = ?auto_20062 ?auto_20067 ) ) ( not ( = ?auto_20062 ?auto_20084 ) ) ( not ( = ?auto_20063 ?auto_20067 ) ) ( not ( = ?auto_20063 ?auto_20084 ) ) ( not ( = ?auto_20064 ?auto_20067 ) ) ( not ( = ?auto_20064 ?auto_20084 ) ) ( not ( = ?auto_20065 ?auto_20067 ) ) ( not ( = ?auto_20065 ?auto_20084 ) ) ( not ( = ?auto_20067 ?auto_20082 ) ) ( not ( = ?auto_20067 ?auto_20086 ) ) ( not ( = ?auto_20067 ?auto_20094 ) ) ( not ( = ?auto_20067 ?auto_20091 ) ) ( not ( = ?auto_20067 ?auto_20083 ) ) ( not ( = ?auto_20079 ?auto_20080 ) ) ( not ( = ?auto_20079 ?auto_20092 ) ) ( not ( = ?auto_20079 ?auto_20081 ) ) ( not ( = ?auto_20079 ?auto_20078 ) ) ( not ( = ?auto_20079 ?auto_20096 ) ) ( not ( = ?auto_20077 ?auto_20076 ) ) ( not ( = ?auto_20077 ?auto_20085 ) ) ( not ( = ?auto_20077 ?auto_20088 ) ) ( not ( = ?auto_20077 ?auto_20087 ) ) ( not ( = ?auto_20077 ?auto_20089 ) ) ( not ( = ?auto_20084 ?auto_20082 ) ) ( not ( = ?auto_20084 ?auto_20086 ) ) ( not ( = ?auto_20084 ?auto_20094 ) ) ( not ( = ?auto_20084 ?auto_20091 ) ) ( not ( = ?auto_20084 ?auto_20083 ) ) ( not ( = ?auto_20061 ?auto_20068 ) ) ( not ( = ?auto_20061 ?auto_20095 ) ) ( not ( = ?auto_20062 ?auto_20068 ) ) ( not ( = ?auto_20062 ?auto_20095 ) ) ( not ( = ?auto_20063 ?auto_20068 ) ) ( not ( = ?auto_20063 ?auto_20095 ) ) ( not ( = ?auto_20064 ?auto_20068 ) ) ( not ( = ?auto_20064 ?auto_20095 ) ) ( not ( = ?auto_20065 ?auto_20068 ) ) ( not ( = ?auto_20065 ?auto_20095 ) ) ( not ( = ?auto_20066 ?auto_20068 ) ) ( not ( = ?auto_20066 ?auto_20095 ) ) ( not ( = ?auto_20068 ?auto_20084 ) ) ( not ( = ?auto_20068 ?auto_20082 ) ) ( not ( = ?auto_20068 ?auto_20086 ) ) ( not ( = ?auto_20068 ?auto_20094 ) ) ( not ( = ?auto_20068 ?auto_20091 ) ) ( not ( = ?auto_20068 ?auto_20083 ) ) ( not ( = ?auto_20093 ?auto_20079 ) ) ( not ( = ?auto_20093 ?auto_20080 ) ) ( not ( = ?auto_20093 ?auto_20092 ) ) ( not ( = ?auto_20093 ?auto_20081 ) ) ( not ( = ?auto_20093 ?auto_20078 ) ) ( not ( = ?auto_20093 ?auto_20096 ) ) ( not ( = ?auto_20090 ?auto_20077 ) ) ( not ( = ?auto_20090 ?auto_20076 ) ) ( not ( = ?auto_20090 ?auto_20085 ) ) ( not ( = ?auto_20090 ?auto_20088 ) ) ( not ( = ?auto_20090 ?auto_20087 ) ) ( not ( = ?auto_20090 ?auto_20089 ) ) ( not ( = ?auto_20095 ?auto_20084 ) ) ( not ( = ?auto_20095 ?auto_20082 ) ) ( not ( = ?auto_20095 ?auto_20086 ) ) ( not ( = ?auto_20095 ?auto_20094 ) ) ( not ( = ?auto_20095 ?auto_20091 ) ) ( not ( = ?auto_20095 ?auto_20083 ) ) ( not ( = ?auto_20061 ?auto_20069 ) ) ( not ( = ?auto_20061 ?auto_20070 ) ) ( not ( = ?auto_20062 ?auto_20069 ) ) ( not ( = ?auto_20062 ?auto_20070 ) ) ( not ( = ?auto_20063 ?auto_20069 ) ) ( not ( = ?auto_20063 ?auto_20070 ) ) ( not ( = ?auto_20064 ?auto_20069 ) ) ( not ( = ?auto_20064 ?auto_20070 ) ) ( not ( = ?auto_20065 ?auto_20069 ) ) ( not ( = ?auto_20065 ?auto_20070 ) ) ( not ( = ?auto_20066 ?auto_20069 ) ) ( not ( = ?auto_20066 ?auto_20070 ) ) ( not ( = ?auto_20067 ?auto_20069 ) ) ( not ( = ?auto_20067 ?auto_20070 ) ) ( not ( = ?auto_20069 ?auto_20095 ) ) ( not ( = ?auto_20069 ?auto_20084 ) ) ( not ( = ?auto_20069 ?auto_20082 ) ) ( not ( = ?auto_20069 ?auto_20086 ) ) ( not ( = ?auto_20069 ?auto_20094 ) ) ( not ( = ?auto_20069 ?auto_20091 ) ) ( not ( = ?auto_20069 ?auto_20083 ) ) ( not ( = ?auto_20075 ?auto_20093 ) ) ( not ( = ?auto_20075 ?auto_20079 ) ) ( not ( = ?auto_20075 ?auto_20080 ) ) ( not ( = ?auto_20075 ?auto_20092 ) ) ( not ( = ?auto_20075 ?auto_20081 ) ) ( not ( = ?auto_20075 ?auto_20078 ) ) ( not ( = ?auto_20075 ?auto_20096 ) ) ( not ( = ?auto_20074 ?auto_20090 ) ) ( not ( = ?auto_20074 ?auto_20077 ) ) ( not ( = ?auto_20074 ?auto_20076 ) ) ( not ( = ?auto_20074 ?auto_20085 ) ) ( not ( = ?auto_20074 ?auto_20088 ) ) ( not ( = ?auto_20074 ?auto_20087 ) ) ( not ( = ?auto_20074 ?auto_20089 ) ) ( not ( = ?auto_20070 ?auto_20095 ) ) ( not ( = ?auto_20070 ?auto_20084 ) ) ( not ( = ?auto_20070 ?auto_20082 ) ) ( not ( = ?auto_20070 ?auto_20086 ) ) ( not ( = ?auto_20070 ?auto_20094 ) ) ( not ( = ?auto_20070 ?auto_20091 ) ) ( not ( = ?auto_20070 ?auto_20083 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_20061 ?auto_20062 ?auto_20063 ?auto_20064 ?auto_20065 ?auto_20066 ?auto_20067 ?auto_20068 )
      ( MAKE-1CRATE ?auto_20068 ?auto_20069 )
      ( MAKE-8CRATE-VERIFY ?auto_20061 ?auto_20062 ?auto_20063 ?auto_20064 ?auto_20065 ?auto_20066 ?auto_20067 ?auto_20068 ?auto_20069 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_20117 - SURFACE
      ?auto_20118 - SURFACE
      ?auto_20119 - SURFACE
      ?auto_20120 - SURFACE
      ?auto_20121 - SURFACE
      ?auto_20122 - SURFACE
      ?auto_20123 - SURFACE
      ?auto_20124 - SURFACE
      ?auto_20125 - SURFACE
      ?auto_20126 - SURFACE
    )
    :vars
    (
      ?auto_20127 - HOIST
      ?auto_20128 - PLACE
      ?auto_20130 - PLACE
      ?auto_20132 - HOIST
      ?auto_20129 - SURFACE
      ?auto_20147 - PLACE
      ?auto_20133 - HOIST
      ?auto_20134 - SURFACE
      ?auto_20154 - PLACE
      ?auto_20135 - HOIST
      ?auto_20136 - SURFACE
      ?auto_20152 - PLACE
      ?auto_20146 - HOIST
      ?auto_20138 - SURFACE
      ?auto_20150 - PLACE
      ?auto_20151 - HOIST
      ?auto_20148 - SURFACE
      ?auto_20153 - PLACE
      ?auto_20140 - HOIST
      ?auto_20139 - SURFACE
      ?auto_20149 - PLACE
      ?auto_20142 - HOIST
      ?auto_20145 - SURFACE
      ?auto_20144 - PLACE
      ?auto_20141 - HOIST
      ?auto_20137 - SURFACE
      ?auto_20143 - SURFACE
      ?auto_20131 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20127 ?auto_20128 ) ( IS-CRATE ?auto_20126 ) ( not ( = ?auto_20130 ?auto_20128 ) ) ( HOIST-AT ?auto_20132 ?auto_20130 ) ( SURFACE-AT ?auto_20126 ?auto_20130 ) ( ON ?auto_20126 ?auto_20129 ) ( CLEAR ?auto_20126 ) ( not ( = ?auto_20125 ?auto_20126 ) ) ( not ( = ?auto_20125 ?auto_20129 ) ) ( not ( = ?auto_20126 ?auto_20129 ) ) ( not ( = ?auto_20127 ?auto_20132 ) ) ( IS-CRATE ?auto_20125 ) ( not ( = ?auto_20147 ?auto_20128 ) ) ( HOIST-AT ?auto_20133 ?auto_20147 ) ( AVAILABLE ?auto_20133 ) ( SURFACE-AT ?auto_20125 ?auto_20147 ) ( ON ?auto_20125 ?auto_20134 ) ( CLEAR ?auto_20125 ) ( not ( = ?auto_20124 ?auto_20125 ) ) ( not ( = ?auto_20124 ?auto_20134 ) ) ( not ( = ?auto_20125 ?auto_20134 ) ) ( not ( = ?auto_20127 ?auto_20133 ) ) ( IS-CRATE ?auto_20124 ) ( not ( = ?auto_20154 ?auto_20128 ) ) ( HOIST-AT ?auto_20135 ?auto_20154 ) ( AVAILABLE ?auto_20135 ) ( SURFACE-AT ?auto_20124 ?auto_20154 ) ( ON ?auto_20124 ?auto_20136 ) ( CLEAR ?auto_20124 ) ( not ( = ?auto_20123 ?auto_20124 ) ) ( not ( = ?auto_20123 ?auto_20136 ) ) ( not ( = ?auto_20124 ?auto_20136 ) ) ( not ( = ?auto_20127 ?auto_20135 ) ) ( IS-CRATE ?auto_20123 ) ( not ( = ?auto_20152 ?auto_20128 ) ) ( HOIST-AT ?auto_20146 ?auto_20152 ) ( AVAILABLE ?auto_20146 ) ( SURFACE-AT ?auto_20123 ?auto_20152 ) ( ON ?auto_20123 ?auto_20138 ) ( CLEAR ?auto_20123 ) ( not ( = ?auto_20122 ?auto_20123 ) ) ( not ( = ?auto_20122 ?auto_20138 ) ) ( not ( = ?auto_20123 ?auto_20138 ) ) ( not ( = ?auto_20127 ?auto_20146 ) ) ( IS-CRATE ?auto_20122 ) ( not ( = ?auto_20150 ?auto_20128 ) ) ( HOIST-AT ?auto_20151 ?auto_20150 ) ( AVAILABLE ?auto_20151 ) ( SURFACE-AT ?auto_20122 ?auto_20150 ) ( ON ?auto_20122 ?auto_20148 ) ( CLEAR ?auto_20122 ) ( not ( = ?auto_20121 ?auto_20122 ) ) ( not ( = ?auto_20121 ?auto_20148 ) ) ( not ( = ?auto_20122 ?auto_20148 ) ) ( not ( = ?auto_20127 ?auto_20151 ) ) ( IS-CRATE ?auto_20121 ) ( not ( = ?auto_20153 ?auto_20128 ) ) ( HOIST-AT ?auto_20140 ?auto_20153 ) ( AVAILABLE ?auto_20140 ) ( SURFACE-AT ?auto_20121 ?auto_20153 ) ( ON ?auto_20121 ?auto_20139 ) ( CLEAR ?auto_20121 ) ( not ( = ?auto_20120 ?auto_20121 ) ) ( not ( = ?auto_20120 ?auto_20139 ) ) ( not ( = ?auto_20121 ?auto_20139 ) ) ( not ( = ?auto_20127 ?auto_20140 ) ) ( IS-CRATE ?auto_20120 ) ( not ( = ?auto_20149 ?auto_20128 ) ) ( HOIST-AT ?auto_20142 ?auto_20149 ) ( AVAILABLE ?auto_20142 ) ( SURFACE-AT ?auto_20120 ?auto_20149 ) ( ON ?auto_20120 ?auto_20145 ) ( CLEAR ?auto_20120 ) ( not ( = ?auto_20119 ?auto_20120 ) ) ( not ( = ?auto_20119 ?auto_20145 ) ) ( not ( = ?auto_20120 ?auto_20145 ) ) ( not ( = ?auto_20127 ?auto_20142 ) ) ( IS-CRATE ?auto_20119 ) ( not ( = ?auto_20144 ?auto_20128 ) ) ( HOIST-AT ?auto_20141 ?auto_20144 ) ( AVAILABLE ?auto_20141 ) ( SURFACE-AT ?auto_20119 ?auto_20144 ) ( ON ?auto_20119 ?auto_20137 ) ( CLEAR ?auto_20119 ) ( not ( = ?auto_20118 ?auto_20119 ) ) ( not ( = ?auto_20118 ?auto_20137 ) ) ( not ( = ?auto_20119 ?auto_20137 ) ) ( not ( = ?auto_20127 ?auto_20141 ) ) ( SURFACE-AT ?auto_20117 ?auto_20128 ) ( CLEAR ?auto_20117 ) ( IS-CRATE ?auto_20118 ) ( AVAILABLE ?auto_20127 ) ( AVAILABLE ?auto_20132 ) ( SURFACE-AT ?auto_20118 ?auto_20130 ) ( ON ?auto_20118 ?auto_20143 ) ( CLEAR ?auto_20118 ) ( TRUCK-AT ?auto_20131 ?auto_20128 ) ( not ( = ?auto_20117 ?auto_20118 ) ) ( not ( = ?auto_20117 ?auto_20143 ) ) ( not ( = ?auto_20118 ?auto_20143 ) ) ( not ( = ?auto_20117 ?auto_20119 ) ) ( not ( = ?auto_20117 ?auto_20137 ) ) ( not ( = ?auto_20119 ?auto_20143 ) ) ( not ( = ?auto_20144 ?auto_20130 ) ) ( not ( = ?auto_20141 ?auto_20132 ) ) ( not ( = ?auto_20137 ?auto_20143 ) ) ( not ( = ?auto_20117 ?auto_20120 ) ) ( not ( = ?auto_20117 ?auto_20145 ) ) ( not ( = ?auto_20118 ?auto_20120 ) ) ( not ( = ?auto_20118 ?auto_20145 ) ) ( not ( = ?auto_20120 ?auto_20137 ) ) ( not ( = ?auto_20120 ?auto_20143 ) ) ( not ( = ?auto_20149 ?auto_20144 ) ) ( not ( = ?auto_20149 ?auto_20130 ) ) ( not ( = ?auto_20142 ?auto_20141 ) ) ( not ( = ?auto_20142 ?auto_20132 ) ) ( not ( = ?auto_20145 ?auto_20137 ) ) ( not ( = ?auto_20145 ?auto_20143 ) ) ( not ( = ?auto_20117 ?auto_20121 ) ) ( not ( = ?auto_20117 ?auto_20139 ) ) ( not ( = ?auto_20118 ?auto_20121 ) ) ( not ( = ?auto_20118 ?auto_20139 ) ) ( not ( = ?auto_20119 ?auto_20121 ) ) ( not ( = ?auto_20119 ?auto_20139 ) ) ( not ( = ?auto_20121 ?auto_20145 ) ) ( not ( = ?auto_20121 ?auto_20137 ) ) ( not ( = ?auto_20121 ?auto_20143 ) ) ( not ( = ?auto_20153 ?auto_20149 ) ) ( not ( = ?auto_20153 ?auto_20144 ) ) ( not ( = ?auto_20153 ?auto_20130 ) ) ( not ( = ?auto_20140 ?auto_20142 ) ) ( not ( = ?auto_20140 ?auto_20141 ) ) ( not ( = ?auto_20140 ?auto_20132 ) ) ( not ( = ?auto_20139 ?auto_20145 ) ) ( not ( = ?auto_20139 ?auto_20137 ) ) ( not ( = ?auto_20139 ?auto_20143 ) ) ( not ( = ?auto_20117 ?auto_20122 ) ) ( not ( = ?auto_20117 ?auto_20148 ) ) ( not ( = ?auto_20118 ?auto_20122 ) ) ( not ( = ?auto_20118 ?auto_20148 ) ) ( not ( = ?auto_20119 ?auto_20122 ) ) ( not ( = ?auto_20119 ?auto_20148 ) ) ( not ( = ?auto_20120 ?auto_20122 ) ) ( not ( = ?auto_20120 ?auto_20148 ) ) ( not ( = ?auto_20122 ?auto_20139 ) ) ( not ( = ?auto_20122 ?auto_20145 ) ) ( not ( = ?auto_20122 ?auto_20137 ) ) ( not ( = ?auto_20122 ?auto_20143 ) ) ( not ( = ?auto_20150 ?auto_20153 ) ) ( not ( = ?auto_20150 ?auto_20149 ) ) ( not ( = ?auto_20150 ?auto_20144 ) ) ( not ( = ?auto_20150 ?auto_20130 ) ) ( not ( = ?auto_20151 ?auto_20140 ) ) ( not ( = ?auto_20151 ?auto_20142 ) ) ( not ( = ?auto_20151 ?auto_20141 ) ) ( not ( = ?auto_20151 ?auto_20132 ) ) ( not ( = ?auto_20148 ?auto_20139 ) ) ( not ( = ?auto_20148 ?auto_20145 ) ) ( not ( = ?auto_20148 ?auto_20137 ) ) ( not ( = ?auto_20148 ?auto_20143 ) ) ( not ( = ?auto_20117 ?auto_20123 ) ) ( not ( = ?auto_20117 ?auto_20138 ) ) ( not ( = ?auto_20118 ?auto_20123 ) ) ( not ( = ?auto_20118 ?auto_20138 ) ) ( not ( = ?auto_20119 ?auto_20123 ) ) ( not ( = ?auto_20119 ?auto_20138 ) ) ( not ( = ?auto_20120 ?auto_20123 ) ) ( not ( = ?auto_20120 ?auto_20138 ) ) ( not ( = ?auto_20121 ?auto_20123 ) ) ( not ( = ?auto_20121 ?auto_20138 ) ) ( not ( = ?auto_20123 ?auto_20148 ) ) ( not ( = ?auto_20123 ?auto_20139 ) ) ( not ( = ?auto_20123 ?auto_20145 ) ) ( not ( = ?auto_20123 ?auto_20137 ) ) ( not ( = ?auto_20123 ?auto_20143 ) ) ( not ( = ?auto_20152 ?auto_20150 ) ) ( not ( = ?auto_20152 ?auto_20153 ) ) ( not ( = ?auto_20152 ?auto_20149 ) ) ( not ( = ?auto_20152 ?auto_20144 ) ) ( not ( = ?auto_20152 ?auto_20130 ) ) ( not ( = ?auto_20146 ?auto_20151 ) ) ( not ( = ?auto_20146 ?auto_20140 ) ) ( not ( = ?auto_20146 ?auto_20142 ) ) ( not ( = ?auto_20146 ?auto_20141 ) ) ( not ( = ?auto_20146 ?auto_20132 ) ) ( not ( = ?auto_20138 ?auto_20148 ) ) ( not ( = ?auto_20138 ?auto_20139 ) ) ( not ( = ?auto_20138 ?auto_20145 ) ) ( not ( = ?auto_20138 ?auto_20137 ) ) ( not ( = ?auto_20138 ?auto_20143 ) ) ( not ( = ?auto_20117 ?auto_20124 ) ) ( not ( = ?auto_20117 ?auto_20136 ) ) ( not ( = ?auto_20118 ?auto_20124 ) ) ( not ( = ?auto_20118 ?auto_20136 ) ) ( not ( = ?auto_20119 ?auto_20124 ) ) ( not ( = ?auto_20119 ?auto_20136 ) ) ( not ( = ?auto_20120 ?auto_20124 ) ) ( not ( = ?auto_20120 ?auto_20136 ) ) ( not ( = ?auto_20121 ?auto_20124 ) ) ( not ( = ?auto_20121 ?auto_20136 ) ) ( not ( = ?auto_20122 ?auto_20124 ) ) ( not ( = ?auto_20122 ?auto_20136 ) ) ( not ( = ?auto_20124 ?auto_20138 ) ) ( not ( = ?auto_20124 ?auto_20148 ) ) ( not ( = ?auto_20124 ?auto_20139 ) ) ( not ( = ?auto_20124 ?auto_20145 ) ) ( not ( = ?auto_20124 ?auto_20137 ) ) ( not ( = ?auto_20124 ?auto_20143 ) ) ( not ( = ?auto_20154 ?auto_20152 ) ) ( not ( = ?auto_20154 ?auto_20150 ) ) ( not ( = ?auto_20154 ?auto_20153 ) ) ( not ( = ?auto_20154 ?auto_20149 ) ) ( not ( = ?auto_20154 ?auto_20144 ) ) ( not ( = ?auto_20154 ?auto_20130 ) ) ( not ( = ?auto_20135 ?auto_20146 ) ) ( not ( = ?auto_20135 ?auto_20151 ) ) ( not ( = ?auto_20135 ?auto_20140 ) ) ( not ( = ?auto_20135 ?auto_20142 ) ) ( not ( = ?auto_20135 ?auto_20141 ) ) ( not ( = ?auto_20135 ?auto_20132 ) ) ( not ( = ?auto_20136 ?auto_20138 ) ) ( not ( = ?auto_20136 ?auto_20148 ) ) ( not ( = ?auto_20136 ?auto_20139 ) ) ( not ( = ?auto_20136 ?auto_20145 ) ) ( not ( = ?auto_20136 ?auto_20137 ) ) ( not ( = ?auto_20136 ?auto_20143 ) ) ( not ( = ?auto_20117 ?auto_20125 ) ) ( not ( = ?auto_20117 ?auto_20134 ) ) ( not ( = ?auto_20118 ?auto_20125 ) ) ( not ( = ?auto_20118 ?auto_20134 ) ) ( not ( = ?auto_20119 ?auto_20125 ) ) ( not ( = ?auto_20119 ?auto_20134 ) ) ( not ( = ?auto_20120 ?auto_20125 ) ) ( not ( = ?auto_20120 ?auto_20134 ) ) ( not ( = ?auto_20121 ?auto_20125 ) ) ( not ( = ?auto_20121 ?auto_20134 ) ) ( not ( = ?auto_20122 ?auto_20125 ) ) ( not ( = ?auto_20122 ?auto_20134 ) ) ( not ( = ?auto_20123 ?auto_20125 ) ) ( not ( = ?auto_20123 ?auto_20134 ) ) ( not ( = ?auto_20125 ?auto_20136 ) ) ( not ( = ?auto_20125 ?auto_20138 ) ) ( not ( = ?auto_20125 ?auto_20148 ) ) ( not ( = ?auto_20125 ?auto_20139 ) ) ( not ( = ?auto_20125 ?auto_20145 ) ) ( not ( = ?auto_20125 ?auto_20137 ) ) ( not ( = ?auto_20125 ?auto_20143 ) ) ( not ( = ?auto_20147 ?auto_20154 ) ) ( not ( = ?auto_20147 ?auto_20152 ) ) ( not ( = ?auto_20147 ?auto_20150 ) ) ( not ( = ?auto_20147 ?auto_20153 ) ) ( not ( = ?auto_20147 ?auto_20149 ) ) ( not ( = ?auto_20147 ?auto_20144 ) ) ( not ( = ?auto_20147 ?auto_20130 ) ) ( not ( = ?auto_20133 ?auto_20135 ) ) ( not ( = ?auto_20133 ?auto_20146 ) ) ( not ( = ?auto_20133 ?auto_20151 ) ) ( not ( = ?auto_20133 ?auto_20140 ) ) ( not ( = ?auto_20133 ?auto_20142 ) ) ( not ( = ?auto_20133 ?auto_20141 ) ) ( not ( = ?auto_20133 ?auto_20132 ) ) ( not ( = ?auto_20134 ?auto_20136 ) ) ( not ( = ?auto_20134 ?auto_20138 ) ) ( not ( = ?auto_20134 ?auto_20148 ) ) ( not ( = ?auto_20134 ?auto_20139 ) ) ( not ( = ?auto_20134 ?auto_20145 ) ) ( not ( = ?auto_20134 ?auto_20137 ) ) ( not ( = ?auto_20134 ?auto_20143 ) ) ( not ( = ?auto_20117 ?auto_20126 ) ) ( not ( = ?auto_20117 ?auto_20129 ) ) ( not ( = ?auto_20118 ?auto_20126 ) ) ( not ( = ?auto_20118 ?auto_20129 ) ) ( not ( = ?auto_20119 ?auto_20126 ) ) ( not ( = ?auto_20119 ?auto_20129 ) ) ( not ( = ?auto_20120 ?auto_20126 ) ) ( not ( = ?auto_20120 ?auto_20129 ) ) ( not ( = ?auto_20121 ?auto_20126 ) ) ( not ( = ?auto_20121 ?auto_20129 ) ) ( not ( = ?auto_20122 ?auto_20126 ) ) ( not ( = ?auto_20122 ?auto_20129 ) ) ( not ( = ?auto_20123 ?auto_20126 ) ) ( not ( = ?auto_20123 ?auto_20129 ) ) ( not ( = ?auto_20124 ?auto_20126 ) ) ( not ( = ?auto_20124 ?auto_20129 ) ) ( not ( = ?auto_20126 ?auto_20134 ) ) ( not ( = ?auto_20126 ?auto_20136 ) ) ( not ( = ?auto_20126 ?auto_20138 ) ) ( not ( = ?auto_20126 ?auto_20148 ) ) ( not ( = ?auto_20126 ?auto_20139 ) ) ( not ( = ?auto_20126 ?auto_20145 ) ) ( not ( = ?auto_20126 ?auto_20137 ) ) ( not ( = ?auto_20126 ?auto_20143 ) ) ( not ( = ?auto_20129 ?auto_20134 ) ) ( not ( = ?auto_20129 ?auto_20136 ) ) ( not ( = ?auto_20129 ?auto_20138 ) ) ( not ( = ?auto_20129 ?auto_20148 ) ) ( not ( = ?auto_20129 ?auto_20139 ) ) ( not ( = ?auto_20129 ?auto_20145 ) ) ( not ( = ?auto_20129 ?auto_20137 ) ) ( not ( = ?auto_20129 ?auto_20143 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_20117 ?auto_20118 ?auto_20119 ?auto_20120 ?auto_20121 ?auto_20122 ?auto_20123 ?auto_20124 ?auto_20125 )
      ( MAKE-1CRATE ?auto_20125 ?auto_20126 )
      ( MAKE-9CRATE-VERIFY ?auto_20117 ?auto_20118 ?auto_20119 ?auto_20120 ?auto_20121 ?auto_20122 ?auto_20123 ?auto_20124 ?auto_20125 ?auto_20126 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_20176 - SURFACE
      ?auto_20177 - SURFACE
      ?auto_20178 - SURFACE
      ?auto_20179 - SURFACE
      ?auto_20180 - SURFACE
      ?auto_20181 - SURFACE
      ?auto_20182 - SURFACE
      ?auto_20183 - SURFACE
      ?auto_20184 - SURFACE
      ?auto_20185 - SURFACE
      ?auto_20186 - SURFACE
    )
    :vars
    (
      ?auto_20188 - HOIST
      ?auto_20192 - PLACE
      ?auto_20187 - PLACE
      ?auto_20190 - HOIST
      ?auto_20191 - SURFACE
      ?auto_20194 - PLACE
      ?auto_20195 - HOIST
      ?auto_20216 - SURFACE
      ?auto_20215 - PLACE
      ?auto_20205 - HOIST
      ?auto_20197 - SURFACE
      ?auto_20206 - PLACE
      ?auto_20209 - HOIST
      ?auto_20198 - SURFACE
      ?auto_20196 - PLACE
      ?auto_20210 - HOIST
      ?auto_20213 - SURFACE
      ?auto_20199 - PLACE
      ?auto_20217 - HOIST
      ?auto_20207 - SURFACE
      ?auto_20204 - PLACE
      ?auto_20200 - HOIST
      ?auto_20212 - SURFACE
      ?auto_20211 - PLACE
      ?auto_20203 - HOIST
      ?auto_20193 - SURFACE
      ?auto_20202 - PLACE
      ?auto_20201 - HOIST
      ?auto_20214 - SURFACE
      ?auto_20208 - SURFACE
      ?auto_20189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20188 ?auto_20192 ) ( IS-CRATE ?auto_20186 ) ( not ( = ?auto_20187 ?auto_20192 ) ) ( HOIST-AT ?auto_20190 ?auto_20187 ) ( AVAILABLE ?auto_20190 ) ( SURFACE-AT ?auto_20186 ?auto_20187 ) ( ON ?auto_20186 ?auto_20191 ) ( CLEAR ?auto_20186 ) ( not ( = ?auto_20185 ?auto_20186 ) ) ( not ( = ?auto_20185 ?auto_20191 ) ) ( not ( = ?auto_20186 ?auto_20191 ) ) ( not ( = ?auto_20188 ?auto_20190 ) ) ( IS-CRATE ?auto_20185 ) ( not ( = ?auto_20194 ?auto_20192 ) ) ( HOIST-AT ?auto_20195 ?auto_20194 ) ( SURFACE-AT ?auto_20185 ?auto_20194 ) ( ON ?auto_20185 ?auto_20216 ) ( CLEAR ?auto_20185 ) ( not ( = ?auto_20184 ?auto_20185 ) ) ( not ( = ?auto_20184 ?auto_20216 ) ) ( not ( = ?auto_20185 ?auto_20216 ) ) ( not ( = ?auto_20188 ?auto_20195 ) ) ( IS-CRATE ?auto_20184 ) ( not ( = ?auto_20215 ?auto_20192 ) ) ( HOIST-AT ?auto_20205 ?auto_20215 ) ( AVAILABLE ?auto_20205 ) ( SURFACE-AT ?auto_20184 ?auto_20215 ) ( ON ?auto_20184 ?auto_20197 ) ( CLEAR ?auto_20184 ) ( not ( = ?auto_20183 ?auto_20184 ) ) ( not ( = ?auto_20183 ?auto_20197 ) ) ( not ( = ?auto_20184 ?auto_20197 ) ) ( not ( = ?auto_20188 ?auto_20205 ) ) ( IS-CRATE ?auto_20183 ) ( not ( = ?auto_20206 ?auto_20192 ) ) ( HOIST-AT ?auto_20209 ?auto_20206 ) ( AVAILABLE ?auto_20209 ) ( SURFACE-AT ?auto_20183 ?auto_20206 ) ( ON ?auto_20183 ?auto_20198 ) ( CLEAR ?auto_20183 ) ( not ( = ?auto_20182 ?auto_20183 ) ) ( not ( = ?auto_20182 ?auto_20198 ) ) ( not ( = ?auto_20183 ?auto_20198 ) ) ( not ( = ?auto_20188 ?auto_20209 ) ) ( IS-CRATE ?auto_20182 ) ( not ( = ?auto_20196 ?auto_20192 ) ) ( HOIST-AT ?auto_20210 ?auto_20196 ) ( AVAILABLE ?auto_20210 ) ( SURFACE-AT ?auto_20182 ?auto_20196 ) ( ON ?auto_20182 ?auto_20213 ) ( CLEAR ?auto_20182 ) ( not ( = ?auto_20181 ?auto_20182 ) ) ( not ( = ?auto_20181 ?auto_20213 ) ) ( not ( = ?auto_20182 ?auto_20213 ) ) ( not ( = ?auto_20188 ?auto_20210 ) ) ( IS-CRATE ?auto_20181 ) ( not ( = ?auto_20199 ?auto_20192 ) ) ( HOIST-AT ?auto_20217 ?auto_20199 ) ( AVAILABLE ?auto_20217 ) ( SURFACE-AT ?auto_20181 ?auto_20199 ) ( ON ?auto_20181 ?auto_20207 ) ( CLEAR ?auto_20181 ) ( not ( = ?auto_20180 ?auto_20181 ) ) ( not ( = ?auto_20180 ?auto_20207 ) ) ( not ( = ?auto_20181 ?auto_20207 ) ) ( not ( = ?auto_20188 ?auto_20217 ) ) ( IS-CRATE ?auto_20180 ) ( not ( = ?auto_20204 ?auto_20192 ) ) ( HOIST-AT ?auto_20200 ?auto_20204 ) ( AVAILABLE ?auto_20200 ) ( SURFACE-AT ?auto_20180 ?auto_20204 ) ( ON ?auto_20180 ?auto_20212 ) ( CLEAR ?auto_20180 ) ( not ( = ?auto_20179 ?auto_20180 ) ) ( not ( = ?auto_20179 ?auto_20212 ) ) ( not ( = ?auto_20180 ?auto_20212 ) ) ( not ( = ?auto_20188 ?auto_20200 ) ) ( IS-CRATE ?auto_20179 ) ( not ( = ?auto_20211 ?auto_20192 ) ) ( HOIST-AT ?auto_20203 ?auto_20211 ) ( AVAILABLE ?auto_20203 ) ( SURFACE-AT ?auto_20179 ?auto_20211 ) ( ON ?auto_20179 ?auto_20193 ) ( CLEAR ?auto_20179 ) ( not ( = ?auto_20178 ?auto_20179 ) ) ( not ( = ?auto_20178 ?auto_20193 ) ) ( not ( = ?auto_20179 ?auto_20193 ) ) ( not ( = ?auto_20188 ?auto_20203 ) ) ( IS-CRATE ?auto_20178 ) ( not ( = ?auto_20202 ?auto_20192 ) ) ( HOIST-AT ?auto_20201 ?auto_20202 ) ( AVAILABLE ?auto_20201 ) ( SURFACE-AT ?auto_20178 ?auto_20202 ) ( ON ?auto_20178 ?auto_20214 ) ( CLEAR ?auto_20178 ) ( not ( = ?auto_20177 ?auto_20178 ) ) ( not ( = ?auto_20177 ?auto_20214 ) ) ( not ( = ?auto_20178 ?auto_20214 ) ) ( not ( = ?auto_20188 ?auto_20201 ) ) ( SURFACE-AT ?auto_20176 ?auto_20192 ) ( CLEAR ?auto_20176 ) ( IS-CRATE ?auto_20177 ) ( AVAILABLE ?auto_20188 ) ( AVAILABLE ?auto_20195 ) ( SURFACE-AT ?auto_20177 ?auto_20194 ) ( ON ?auto_20177 ?auto_20208 ) ( CLEAR ?auto_20177 ) ( TRUCK-AT ?auto_20189 ?auto_20192 ) ( not ( = ?auto_20176 ?auto_20177 ) ) ( not ( = ?auto_20176 ?auto_20208 ) ) ( not ( = ?auto_20177 ?auto_20208 ) ) ( not ( = ?auto_20176 ?auto_20178 ) ) ( not ( = ?auto_20176 ?auto_20214 ) ) ( not ( = ?auto_20178 ?auto_20208 ) ) ( not ( = ?auto_20202 ?auto_20194 ) ) ( not ( = ?auto_20201 ?auto_20195 ) ) ( not ( = ?auto_20214 ?auto_20208 ) ) ( not ( = ?auto_20176 ?auto_20179 ) ) ( not ( = ?auto_20176 ?auto_20193 ) ) ( not ( = ?auto_20177 ?auto_20179 ) ) ( not ( = ?auto_20177 ?auto_20193 ) ) ( not ( = ?auto_20179 ?auto_20214 ) ) ( not ( = ?auto_20179 ?auto_20208 ) ) ( not ( = ?auto_20211 ?auto_20202 ) ) ( not ( = ?auto_20211 ?auto_20194 ) ) ( not ( = ?auto_20203 ?auto_20201 ) ) ( not ( = ?auto_20203 ?auto_20195 ) ) ( not ( = ?auto_20193 ?auto_20214 ) ) ( not ( = ?auto_20193 ?auto_20208 ) ) ( not ( = ?auto_20176 ?auto_20180 ) ) ( not ( = ?auto_20176 ?auto_20212 ) ) ( not ( = ?auto_20177 ?auto_20180 ) ) ( not ( = ?auto_20177 ?auto_20212 ) ) ( not ( = ?auto_20178 ?auto_20180 ) ) ( not ( = ?auto_20178 ?auto_20212 ) ) ( not ( = ?auto_20180 ?auto_20193 ) ) ( not ( = ?auto_20180 ?auto_20214 ) ) ( not ( = ?auto_20180 ?auto_20208 ) ) ( not ( = ?auto_20204 ?auto_20211 ) ) ( not ( = ?auto_20204 ?auto_20202 ) ) ( not ( = ?auto_20204 ?auto_20194 ) ) ( not ( = ?auto_20200 ?auto_20203 ) ) ( not ( = ?auto_20200 ?auto_20201 ) ) ( not ( = ?auto_20200 ?auto_20195 ) ) ( not ( = ?auto_20212 ?auto_20193 ) ) ( not ( = ?auto_20212 ?auto_20214 ) ) ( not ( = ?auto_20212 ?auto_20208 ) ) ( not ( = ?auto_20176 ?auto_20181 ) ) ( not ( = ?auto_20176 ?auto_20207 ) ) ( not ( = ?auto_20177 ?auto_20181 ) ) ( not ( = ?auto_20177 ?auto_20207 ) ) ( not ( = ?auto_20178 ?auto_20181 ) ) ( not ( = ?auto_20178 ?auto_20207 ) ) ( not ( = ?auto_20179 ?auto_20181 ) ) ( not ( = ?auto_20179 ?auto_20207 ) ) ( not ( = ?auto_20181 ?auto_20212 ) ) ( not ( = ?auto_20181 ?auto_20193 ) ) ( not ( = ?auto_20181 ?auto_20214 ) ) ( not ( = ?auto_20181 ?auto_20208 ) ) ( not ( = ?auto_20199 ?auto_20204 ) ) ( not ( = ?auto_20199 ?auto_20211 ) ) ( not ( = ?auto_20199 ?auto_20202 ) ) ( not ( = ?auto_20199 ?auto_20194 ) ) ( not ( = ?auto_20217 ?auto_20200 ) ) ( not ( = ?auto_20217 ?auto_20203 ) ) ( not ( = ?auto_20217 ?auto_20201 ) ) ( not ( = ?auto_20217 ?auto_20195 ) ) ( not ( = ?auto_20207 ?auto_20212 ) ) ( not ( = ?auto_20207 ?auto_20193 ) ) ( not ( = ?auto_20207 ?auto_20214 ) ) ( not ( = ?auto_20207 ?auto_20208 ) ) ( not ( = ?auto_20176 ?auto_20182 ) ) ( not ( = ?auto_20176 ?auto_20213 ) ) ( not ( = ?auto_20177 ?auto_20182 ) ) ( not ( = ?auto_20177 ?auto_20213 ) ) ( not ( = ?auto_20178 ?auto_20182 ) ) ( not ( = ?auto_20178 ?auto_20213 ) ) ( not ( = ?auto_20179 ?auto_20182 ) ) ( not ( = ?auto_20179 ?auto_20213 ) ) ( not ( = ?auto_20180 ?auto_20182 ) ) ( not ( = ?auto_20180 ?auto_20213 ) ) ( not ( = ?auto_20182 ?auto_20207 ) ) ( not ( = ?auto_20182 ?auto_20212 ) ) ( not ( = ?auto_20182 ?auto_20193 ) ) ( not ( = ?auto_20182 ?auto_20214 ) ) ( not ( = ?auto_20182 ?auto_20208 ) ) ( not ( = ?auto_20196 ?auto_20199 ) ) ( not ( = ?auto_20196 ?auto_20204 ) ) ( not ( = ?auto_20196 ?auto_20211 ) ) ( not ( = ?auto_20196 ?auto_20202 ) ) ( not ( = ?auto_20196 ?auto_20194 ) ) ( not ( = ?auto_20210 ?auto_20217 ) ) ( not ( = ?auto_20210 ?auto_20200 ) ) ( not ( = ?auto_20210 ?auto_20203 ) ) ( not ( = ?auto_20210 ?auto_20201 ) ) ( not ( = ?auto_20210 ?auto_20195 ) ) ( not ( = ?auto_20213 ?auto_20207 ) ) ( not ( = ?auto_20213 ?auto_20212 ) ) ( not ( = ?auto_20213 ?auto_20193 ) ) ( not ( = ?auto_20213 ?auto_20214 ) ) ( not ( = ?auto_20213 ?auto_20208 ) ) ( not ( = ?auto_20176 ?auto_20183 ) ) ( not ( = ?auto_20176 ?auto_20198 ) ) ( not ( = ?auto_20177 ?auto_20183 ) ) ( not ( = ?auto_20177 ?auto_20198 ) ) ( not ( = ?auto_20178 ?auto_20183 ) ) ( not ( = ?auto_20178 ?auto_20198 ) ) ( not ( = ?auto_20179 ?auto_20183 ) ) ( not ( = ?auto_20179 ?auto_20198 ) ) ( not ( = ?auto_20180 ?auto_20183 ) ) ( not ( = ?auto_20180 ?auto_20198 ) ) ( not ( = ?auto_20181 ?auto_20183 ) ) ( not ( = ?auto_20181 ?auto_20198 ) ) ( not ( = ?auto_20183 ?auto_20213 ) ) ( not ( = ?auto_20183 ?auto_20207 ) ) ( not ( = ?auto_20183 ?auto_20212 ) ) ( not ( = ?auto_20183 ?auto_20193 ) ) ( not ( = ?auto_20183 ?auto_20214 ) ) ( not ( = ?auto_20183 ?auto_20208 ) ) ( not ( = ?auto_20206 ?auto_20196 ) ) ( not ( = ?auto_20206 ?auto_20199 ) ) ( not ( = ?auto_20206 ?auto_20204 ) ) ( not ( = ?auto_20206 ?auto_20211 ) ) ( not ( = ?auto_20206 ?auto_20202 ) ) ( not ( = ?auto_20206 ?auto_20194 ) ) ( not ( = ?auto_20209 ?auto_20210 ) ) ( not ( = ?auto_20209 ?auto_20217 ) ) ( not ( = ?auto_20209 ?auto_20200 ) ) ( not ( = ?auto_20209 ?auto_20203 ) ) ( not ( = ?auto_20209 ?auto_20201 ) ) ( not ( = ?auto_20209 ?auto_20195 ) ) ( not ( = ?auto_20198 ?auto_20213 ) ) ( not ( = ?auto_20198 ?auto_20207 ) ) ( not ( = ?auto_20198 ?auto_20212 ) ) ( not ( = ?auto_20198 ?auto_20193 ) ) ( not ( = ?auto_20198 ?auto_20214 ) ) ( not ( = ?auto_20198 ?auto_20208 ) ) ( not ( = ?auto_20176 ?auto_20184 ) ) ( not ( = ?auto_20176 ?auto_20197 ) ) ( not ( = ?auto_20177 ?auto_20184 ) ) ( not ( = ?auto_20177 ?auto_20197 ) ) ( not ( = ?auto_20178 ?auto_20184 ) ) ( not ( = ?auto_20178 ?auto_20197 ) ) ( not ( = ?auto_20179 ?auto_20184 ) ) ( not ( = ?auto_20179 ?auto_20197 ) ) ( not ( = ?auto_20180 ?auto_20184 ) ) ( not ( = ?auto_20180 ?auto_20197 ) ) ( not ( = ?auto_20181 ?auto_20184 ) ) ( not ( = ?auto_20181 ?auto_20197 ) ) ( not ( = ?auto_20182 ?auto_20184 ) ) ( not ( = ?auto_20182 ?auto_20197 ) ) ( not ( = ?auto_20184 ?auto_20198 ) ) ( not ( = ?auto_20184 ?auto_20213 ) ) ( not ( = ?auto_20184 ?auto_20207 ) ) ( not ( = ?auto_20184 ?auto_20212 ) ) ( not ( = ?auto_20184 ?auto_20193 ) ) ( not ( = ?auto_20184 ?auto_20214 ) ) ( not ( = ?auto_20184 ?auto_20208 ) ) ( not ( = ?auto_20215 ?auto_20206 ) ) ( not ( = ?auto_20215 ?auto_20196 ) ) ( not ( = ?auto_20215 ?auto_20199 ) ) ( not ( = ?auto_20215 ?auto_20204 ) ) ( not ( = ?auto_20215 ?auto_20211 ) ) ( not ( = ?auto_20215 ?auto_20202 ) ) ( not ( = ?auto_20215 ?auto_20194 ) ) ( not ( = ?auto_20205 ?auto_20209 ) ) ( not ( = ?auto_20205 ?auto_20210 ) ) ( not ( = ?auto_20205 ?auto_20217 ) ) ( not ( = ?auto_20205 ?auto_20200 ) ) ( not ( = ?auto_20205 ?auto_20203 ) ) ( not ( = ?auto_20205 ?auto_20201 ) ) ( not ( = ?auto_20205 ?auto_20195 ) ) ( not ( = ?auto_20197 ?auto_20198 ) ) ( not ( = ?auto_20197 ?auto_20213 ) ) ( not ( = ?auto_20197 ?auto_20207 ) ) ( not ( = ?auto_20197 ?auto_20212 ) ) ( not ( = ?auto_20197 ?auto_20193 ) ) ( not ( = ?auto_20197 ?auto_20214 ) ) ( not ( = ?auto_20197 ?auto_20208 ) ) ( not ( = ?auto_20176 ?auto_20185 ) ) ( not ( = ?auto_20176 ?auto_20216 ) ) ( not ( = ?auto_20177 ?auto_20185 ) ) ( not ( = ?auto_20177 ?auto_20216 ) ) ( not ( = ?auto_20178 ?auto_20185 ) ) ( not ( = ?auto_20178 ?auto_20216 ) ) ( not ( = ?auto_20179 ?auto_20185 ) ) ( not ( = ?auto_20179 ?auto_20216 ) ) ( not ( = ?auto_20180 ?auto_20185 ) ) ( not ( = ?auto_20180 ?auto_20216 ) ) ( not ( = ?auto_20181 ?auto_20185 ) ) ( not ( = ?auto_20181 ?auto_20216 ) ) ( not ( = ?auto_20182 ?auto_20185 ) ) ( not ( = ?auto_20182 ?auto_20216 ) ) ( not ( = ?auto_20183 ?auto_20185 ) ) ( not ( = ?auto_20183 ?auto_20216 ) ) ( not ( = ?auto_20185 ?auto_20197 ) ) ( not ( = ?auto_20185 ?auto_20198 ) ) ( not ( = ?auto_20185 ?auto_20213 ) ) ( not ( = ?auto_20185 ?auto_20207 ) ) ( not ( = ?auto_20185 ?auto_20212 ) ) ( not ( = ?auto_20185 ?auto_20193 ) ) ( not ( = ?auto_20185 ?auto_20214 ) ) ( not ( = ?auto_20185 ?auto_20208 ) ) ( not ( = ?auto_20216 ?auto_20197 ) ) ( not ( = ?auto_20216 ?auto_20198 ) ) ( not ( = ?auto_20216 ?auto_20213 ) ) ( not ( = ?auto_20216 ?auto_20207 ) ) ( not ( = ?auto_20216 ?auto_20212 ) ) ( not ( = ?auto_20216 ?auto_20193 ) ) ( not ( = ?auto_20216 ?auto_20214 ) ) ( not ( = ?auto_20216 ?auto_20208 ) ) ( not ( = ?auto_20176 ?auto_20186 ) ) ( not ( = ?auto_20176 ?auto_20191 ) ) ( not ( = ?auto_20177 ?auto_20186 ) ) ( not ( = ?auto_20177 ?auto_20191 ) ) ( not ( = ?auto_20178 ?auto_20186 ) ) ( not ( = ?auto_20178 ?auto_20191 ) ) ( not ( = ?auto_20179 ?auto_20186 ) ) ( not ( = ?auto_20179 ?auto_20191 ) ) ( not ( = ?auto_20180 ?auto_20186 ) ) ( not ( = ?auto_20180 ?auto_20191 ) ) ( not ( = ?auto_20181 ?auto_20186 ) ) ( not ( = ?auto_20181 ?auto_20191 ) ) ( not ( = ?auto_20182 ?auto_20186 ) ) ( not ( = ?auto_20182 ?auto_20191 ) ) ( not ( = ?auto_20183 ?auto_20186 ) ) ( not ( = ?auto_20183 ?auto_20191 ) ) ( not ( = ?auto_20184 ?auto_20186 ) ) ( not ( = ?auto_20184 ?auto_20191 ) ) ( not ( = ?auto_20186 ?auto_20216 ) ) ( not ( = ?auto_20186 ?auto_20197 ) ) ( not ( = ?auto_20186 ?auto_20198 ) ) ( not ( = ?auto_20186 ?auto_20213 ) ) ( not ( = ?auto_20186 ?auto_20207 ) ) ( not ( = ?auto_20186 ?auto_20212 ) ) ( not ( = ?auto_20186 ?auto_20193 ) ) ( not ( = ?auto_20186 ?auto_20214 ) ) ( not ( = ?auto_20186 ?auto_20208 ) ) ( not ( = ?auto_20187 ?auto_20194 ) ) ( not ( = ?auto_20187 ?auto_20215 ) ) ( not ( = ?auto_20187 ?auto_20206 ) ) ( not ( = ?auto_20187 ?auto_20196 ) ) ( not ( = ?auto_20187 ?auto_20199 ) ) ( not ( = ?auto_20187 ?auto_20204 ) ) ( not ( = ?auto_20187 ?auto_20211 ) ) ( not ( = ?auto_20187 ?auto_20202 ) ) ( not ( = ?auto_20190 ?auto_20195 ) ) ( not ( = ?auto_20190 ?auto_20205 ) ) ( not ( = ?auto_20190 ?auto_20209 ) ) ( not ( = ?auto_20190 ?auto_20210 ) ) ( not ( = ?auto_20190 ?auto_20217 ) ) ( not ( = ?auto_20190 ?auto_20200 ) ) ( not ( = ?auto_20190 ?auto_20203 ) ) ( not ( = ?auto_20190 ?auto_20201 ) ) ( not ( = ?auto_20191 ?auto_20216 ) ) ( not ( = ?auto_20191 ?auto_20197 ) ) ( not ( = ?auto_20191 ?auto_20198 ) ) ( not ( = ?auto_20191 ?auto_20213 ) ) ( not ( = ?auto_20191 ?auto_20207 ) ) ( not ( = ?auto_20191 ?auto_20212 ) ) ( not ( = ?auto_20191 ?auto_20193 ) ) ( not ( = ?auto_20191 ?auto_20214 ) ) ( not ( = ?auto_20191 ?auto_20208 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_20176 ?auto_20177 ?auto_20178 ?auto_20179 ?auto_20180 ?auto_20181 ?auto_20182 ?auto_20183 ?auto_20184 ?auto_20185 )
      ( MAKE-1CRATE ?auto_20185 ?auto_20186 )
      ( MAKE-10CRATE-VERIFY ?auto_20176 ?auto_20177 ?auto_20178 ?auto_20179 ?auto_20180 ?auto_20181 ?auto_20182 ?auto_20183 ?auto_20184 ?auto_20185 ?auto_20186 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_20240 - SURFACE
      ?auto_20241 - SURFACE
      ?auto_20242 - SURFACE
      ?auto_20243 - SURFACE
      ?auto_20244 - SURFACE
      ?auto_20245 - SURFACE
      ?auto_20246 - SURFACE
      ?auto_20247 - SURFACE
      ?auto_20248 - SURFACE
      ?auto_20249 - SURFACE
      ?auto_20250 - SURFACE
      ?auto_20251 - SURFACE
    )
    :vars
    (
      ?auto_20257 - HOIST
      ?auto_20252 - PLACE
      ?auto_20256 - PLACE
      ?auto_20255 - HOIST
      ?auto_20253 - SURFACE
      ?auto_20281 - PLACE
      ?auto_20276 - HOIST
      ?auto_20277 - SURFACE
      ?auto_20262 - PLACE
      ?auto_20283 - HOIST
      ?auto_20271 - SURFACE
      ?auto_20266 - PLACE
      ?auto_20260 - HOIST
      ?auto_20261 - SURFACE
      ?auto_20269 - PLACE
      ?auto_20259 - HOIST
      ?auto_20275 - SURFACE
      ?auto_20258 - PLACE
      ?auto_20280 - HOIST
      ?auto_20267 - SURFACE
      ?auto_20270 - SURFACE
      ?auto_20278 - PLACE
      ?auto_20268 - HOIST
      ?auto_20272 - SURFACE
      ?auto_20279 - PLACE
      ?auto_20282 - HOIST
      ?auto_20265 - SURFACE
      ?auto_20264 - PLACE
      ?auto_20274 - HOIST
      ?auto_20273 - SURFACE
      ?auto_20263 - SURFACE
      ?auto_20254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20257 ?auto_20252 ) ( IS-CRATE ?auto_20251 ) ( not ( = ?auto_20256 ?auto_20252 ) ) ( HOIST-AT ?auto_20255 ?auto_20256 ) ( SURFACE-AT ?auto_20251 ?auto_20256 ) ( ON ?auto_20251 ?auto_20253 ) ( CLEAR ?auto_20251 ) ( not ( = ?auto_20250 ?auto_20251 ) ) ( not ( = ?auto_20250 ?auto_20253 ) ) ( not ( = ?auto_20251 ?auto_20253 ) ) ( not ( = ?auto_20257 ?auto_20255 ) ) ( IS-CRATE ?auto_20250 ) ( not ( = ?auto_20281 ?auto_20252 ) ) ( HOIST-AT ?auto_20276 ?auto_20281 ) ( AVAILABLE ?auto_20276 ) ( SURFACE-AT ?auto_20250 ?auto_20281 ) ( ON ?auto_20250 ?auto_20277 ) ( CLEAR ?auto_20250 ) ( not ( = ?auto_20249 ?auto_20250 ) ) ( not ( = ?auto_20249 ?auto_20277 ) ) ( not ( = ?auto_20250 ?auto_20277 ) ) ( not ( = ?auto_20257 ?auto_20276 ) ) ( IS-CRATE ?auto_20249 ) ( not ( = ?auto_20262 ?auto_20252 ) ) ( HOIST-AT ?auto_20283 ?auto_20262 ) ( SURFACE-AT ?auto_20249 ?auto_20262 ) ( ON ?auto_20249 ?auto_20271 ) ( CLEAR ?auto_20249 ) ( not ( = ?auto_20248 ?auto_20249 ) ) ( not ( = ?auto_20248 ?auto_20271 ) ) ( not ( = ?auto_20249 ?auto_20271 ) ) ( not ( = ?auto_20257 ?auto_20283 ) ) ( IS-CRATE ?auto_20248 ) ( not ( = ?auto_20266 ?auto_20252 ) ) ( HOIST-AT ?auto_20260 ?auto_20266 ) ( AVAILABLE ?auto_20260 ) ( SURFACE-AT ?auto_20248 ?auto_20266 ) ( ON ?auto_20248 ?auto_20261 ) ( CLEAR ?auto_20248 ) ( not ( = ?auto_20247 ?auto_20248 ) ) ( not ( = ?auto_20247 ?auto_20261 ) ) ( not ( = ?auto_20248 ?auto_20261 ) ) ( not ( = ?auto_20257 ?auto_20260 ) ) ( IS-CRATE ?auto_20247 ) ( not ( = ?auto_20269 ?auto_20252 ) ) ( HOIST-AT ?auto_20259 ?auto_20269 ) ( AVAILABLE ?auto_20259 ) ( SURFACE-AT ?auto_20247 ?auto_20269 ) ( ON ?auto_20247 ?auto_20275 ) ( CLEAR ?auto_20247 ) ( not ( = ?auto_20246 ?auto_20247 ) ) ( not ( = ?auto_20246 ?auto_20275 ) ) ( not ( = ?auto_20247 ?auto_20275 ) ) ( not ( = ?auto_20257 ?auto_20259 ) ) ( IS-CRATE ?auto_20246 ) ( not ( = ?auto_20258 ?auto_20252 ) ) ( HOIST-AT ?auto_20280 ?auto_20258 ) ( AVAILABLE ?auto_20280 ) ( SURFACE-AT ?auto_20246 ?auto_20258 ) ( ON ?auto_20246 ?auto_20267 ) ( CLEAR ?auto_20246 ) ( not ( = ?auto_20245 ?auto_20246 ) ) ( not ( = ?auto_20245 ?auto_20267 ) ) ( not ( = ?auto_20246 ?auto_20267 ) ) ( not ( = ?auto_20257 ?auto_20280 ) ) ( IS-CRATE ?auto_20245 ) ( AVAILABLE ?auto_20255 ) ( SURFACE-AT ?auto_20245 ?auto_20256 ) ( ON ?auto_20245 ?auto_20270 ) ( CLEAR ?auto_20245 ) ( not ( = ?auto_20244 ?auto_20245 ) ) ( not ( = ?auto_20244 ?auto_20270 ) ) ( not ( = ?auto_20245 ?auto_20270 ) ) ( IS-CRATE ?auto_20244 ) ( not ( = ?auto_20278 ?auto_20252 ) ) ( HOIST-AT ?auto_20268 ?auto_20278 ) ( AVAILABLE ?auto_20268 ) ( SURFACE-AT ?auto_20244 ?auto_20278 ) ( ON ?auto_20244 ?auto_20272 ) ( CLEAR ?auto_20244 ) ( not ( = ?auto_20243 ?auto_20244 ) ) ( not ( = ?auto_20243 ?auto_20272 ) ) ( not ( = ?auto_20244 ?auto_20272 ) ) ( not ( = ?auto_20257 ?auto_20268 ) ) ( IS-CRATE ?auto_20243 ) ( not ( = ?auto_20279 ?auto_20252 ) ) ( HOIST-AT ?auto_20282 ?auto_20279 ) ( AVAILABLE ?auto_20282 ) ( SURFACE-AT ?auto_20243 ?auto_20279 ) ( ON ?auto_20243 ?auto_20265 ) ( CLEAR ?auto_20243 ) ( not ( = ?auto_20242 ?auto_20243 ) ) ( not ( = ?auto_20242 ?auto_20265 ) ) ( not ( = ?auto_20243 ?auto_20265 ) ) ( not ( = ?auto_20257 ?auto_20282 ) ) ( IS-CRATE ?auto_20242 ) ( not ( = ?auto_20264 ?auto_20252 ) ) ( HOIST-AT ?auto_20274 ?auto_20264 ) ( AVAILABLE ?auto_20274 ) ( SURFACE-AT ?auto_20242 ?auto_20264 ) ( ON ?auto_20242 ?auto_20273 ) ( CLEAR ?auto_20242 ) ( not ( = ?auto_20241 ?auto_20242 ) ) ( not ( = ?auto_20241 ?auto_20273 ) ) ( not ( = ?auto_20242 ?auto_20273 ) ) ( not ( = ?auto_20257 ?auto_20274 ) ) ( SURFACE-AT ?auto_20240 ?auto_20252 ) ( CLEAR ?auto_20240 ) ( IS-CRATE ?auto_20241 ) ( AVAILABLE ?auto_20257 ) ( AVAILABLE ?auto_20283 ) ( SURFACE-AT ?auto_20241 ?auto_20262 ) ( ON ?auto_20241 ?auto_20263 ) ( CLEAR ?auto_20241 ) ( TRUCK-AT ?auto_20254 ?auto_20252 ) ( not ( = ?auto_20240 ?auto_20241 ) ) ( not ( = ?auto_20240 ?auto_20263 ) ) ( not ( = ?auto_20241 ?auto_20263 ) ) ( not ( = ?auto_20240 ?auto_20242 ) ) ( not ( = ?auto_20240 ?auto_20273 ) ) ( not ( = ?auto_20242 ?auto_20263 ) ) ( not ( = ?auto_20264 ?auto_20262 ) ) ( not ( = ?auto_20274 ?auto_20283 ) ) ( not ( = ?auto_20273 ?auto_20263 ) ) ( not ( = ?auto_20240 ?auto_20243 ) ) ( not ( = ?auto_20240 ?auto_20265 ) ) ( not ( = ?auto_20241 ?auto_20243 ) ) ( not ( = ?auto_20241 ?auto_20265 ) ) ( not ( = ?auto_20243 ?auto_20273 ) ) ( not ( = ?auto_20243 ?auto_20263 ) ) ( not ( = ?auto_20279 ?auto_20264 ) ) ( not ( = ?auto_20279 ?auto_20262 ) ) ( not ( = ?auto_20282 ?auto_20274 ) ) ( not ( = ?auto_20282 ?auto_20283 ) ) ( not ( = ?auto_20265 ?auto_20273 ) ) ( not ( = ?auto_20265 ?auto_20263 ) ) ( not ( = ?auto_20240 ?auto_20244 ) ) ( not ( = ?auto_20240 ?auto_20272 ) ) ( not ( = ?auto_20241 ?auto_20244 ) ) ( not ( = ?auto_20241 ?auto_20272 ) ) ( not ( = ?auto_20242 ?auto_20244 ) ) ( not ( = ?auto_20242 ?auto_20272 ) ) ( not ( = ?auto_20244 ?auto_20265 ) ) ( not ( = ?auto_20244 ?auto_20273 ) ) ( not ( = ?auto_20244 ?auto_20263 ) ) ( not ( = ?auto_20278 ?auto_20279 ) ) ( not ( = ?auto_20278 ?auto_20264 ) ) ( not ( = ?auto_20278 ?auto_20262 ) ) ( not ( = ?auto_20268 ?auto_20282 ) ) ( not ( = ?auto_20268 ?auto_20274 ) ) ( not ( = ?auto_20268 ?auto_20283 ) ) ( not ( = ?auto_20272 ?auto_20265 ) ) ( not ( = ?auto_20272 ?auto_20273 ) ) ( not ( = ?auto_20272 ?auto_20263 ) ) ( not ( = ?auto_20240 ?auto_20245 ) ) ( not ( = ?auto_20240 ?auto_20270 ) ) ( not ( = ?auto_20241 ?auto_20245 ) ) ( not ( = ?auto_20241 ?auto_20270 ) ) ( not ( = ?auto_20242 ?auto_20245 ) ) ( not ( = ?auto_20242 ?auto_20270 ) ) ( not ( = ?auto_20243 ?auto_20245 ) ) ( not ( = ?auto_20243 ?auto_20270 ) ) ( not ( = ?auto_20245 ?auto_20272 ) ) ( not ( = ?auto_20245 ?auto_20265 ) ) ( not ( = ?auto_20245 ?auto_20273 ) ) ( not ( = ?auto_20245 ?auto_20263 ) ) ( not ( = ?auto_20256 ?auto_20278 ) ) ( not ( = ?auto_20256 ?auto_20279 ) ) ( not ( = ?auto_20256 ?auto_20264 ) ) ( not ( = ?auto_20256 ?auto_20262 ) ) ( not ( = ?auto_20255 ?auto_20268 ) ) ( not ( = ?auto_20255 ?auto_20282 ) ) ( not ( = ?auto_20255 ?auto_20274 ) ) ( not ( = ?auto_20255 ?auto_20283 ) ) ( not ( = ?auto_20270 ?auto_20272 ) ) ( not ( = ?auto_20270 ?auto_20265 ) ) ( not ( = ?auto_20270 ?auto_20273 ) ) ( not ( = ?auto_20270 ?auto_20263 ) ) ( not ( = ?auto_20240 ?auto_20246 ) ) ( not ( = ?auto_20240 ?auto_20267 ) ) ( not ( = ?auto_20241 ?auto_20246 ) ) ( not ( = ?auto_20241 ?auto_20267 ) ) ( not ( = ?auto_20242 ?auto_20246 ) ) ( not ( = ?auto_20242 ?auto_20267 ) ) ( not ( = ?auto_20243 ?auto_20246 ) ) ( not ( = ?auto_20243 ?auto_20267 ) ) ( not ( = ?auto_20244 ?auto_20246 ) ) ( not ( = ?auto_20244 ?auto_20267 ) ) ( not ( = ?auto_20246 ?auto_20270 ) ) ( not ( = ?auto_20246 ?auto_20272 ) ) ( not ( = ?auto_20246 ?auto_20265 ) ) ( not ( = ?auto_20246 ?auto_20273 ) ) ( not ( = ?auto_20246 ?auto_20263 ) ) ( not ( = ?auto_20258 ?auto_20256 ) ) ( not ( = ?auto_20258 ?auto_20278 ) ) ( not ( = ?auto_20258 ?auto_20279 ) ) ( not ( = ?auto_20258 ?auto_20264 ) ) ( not ( = ?auto_20258 ?auto_20262 ) ) ( not ( = ?auto_20280 ?auto_20255 ) ) ( not ( = ?auto_20280 ?auto_20268 ) ) ( not ( = ?auto_20280 ?auto_20282 ) ) ( not ( = ?auto_20280 ?auto_20274 ) ) ( not ( = ?auto_20280 ?auto_20283 ) ) ( not ( = ?auto_20267 ?auto_20270 ) ) ( not ( = ?auto_20267 ?auto_20272 ) ) ( not ( = ?auto_20267 ?auto_20265 ) ) ( not ( = ?auto_20267 ?auto_20273 ) ) ( not ( = ?auto_20267 ?auto_20263 ) ) ( not ( = ?auto_20240 ?auto_20247 ) ) ( not ( = ?auto_20240 ?auto_20275 ) ) ( not ( = ?auto_20241 ?auto_20247 ) ) ( not ( = ?auto_20241 ?auto_20275 ) ) ( not ( = ?auto_20242 ?auto_20247 ) ) ( not ( = ?auto_20242 ?auto_20275 ) ) ( not ( = ?auto_20243 ?auto_20247 ) ) ( not ( = ?auto_20243 ?auto_20275 ) ) ( not ( = ?auto_20244 ?auto_20247 ) ) ( not ( = ?auto_20244 ?auto_20275 ) ) ( not ( = ?auto_20245 ?auto_20247 ) ) ( not ( = ?auto_20245 ?auto_20275 ) ) ( not ( = ?auto_20247 ?auto_20267 ) ) ( not ( = ?auto_20247 ?auto_20270 ) ) ( not ( = ?auto_20247 ?auto_20272 ) ) ( not ( = ?auto_20247 ?auto_20265 ) ) ( not ( = ?auto_20247 ?auto_20273 ) ) ( not ( = ?auto_20247 ?auto_20263 ) ) ( not ( = ?auto_20269 ?auto_20258 ) ) ( not ( = ?auto_20269 ?auto_20256 ) ) ( not ( = ?auto_20269 ?auto_20278 ) ) ( not ( = ?auto_20269 ?auto_20279 ) ) ( not ( = ?auto_20269 ?auto_20264 ) ) ( not ( = ?auto_20269 ?auto_20262 ) ) ( not ( = ?auto_20259 ?auto_20280 ) ) ( not ( = ?auto_20259 ?auto_20255 ) ) ( not ( = ?auto_20259 ?auto_20268 ) ) ( not ( = ?auto_20259 ?auto_20282 ) ) ( not ( = ?auto_20259 ?auto_20274 ) ) ( not ( = ?auto_20259 ?auto_20283 ) ) ( not ( = ?auto_20275 ?auto_20267 ) ) ( not ( = ?auto_20275 ?auto_20270 ) ) ( not ( = ?auto_20275 ?auto_20272 ) ) ( not ( = ?auto_20275 ?auto_20265 ) ) ( not ( = ?auto_20275 ?auto_20273 ) ) ( not ( = ?auto_20275 ?auto_20263 ) ) ( not ( = ?auto_20240 ?auto_20248 ) ) ( not ( = ?auto_20240 ?auto_20261 ) ) ( not ( = ?auto_20241 ?auto_20248 ) ) ( not ( = ?auto_20241 ?auto_20261 ) ) ( not ( = ?auto_20242 ?auto_20248 ) ) ( not ( = ?auto_20242 ?auto_20261 ) ) ( not ( = ?auto_20243 ?auto_20248 ) ) ( not ( = ?auto_20243 ?auto_20261 ) ) ( not ( = ?auto_20244 ?auto_20248 ) ) ( not ( = ?auto_20244 ?auto_20261 ) ) ( not ( = ?auto_20245 ?auto_20248 ) ) ( not ( = ?auto_20245 ?auto_20261 ) ) ( not ( = ?auto_20246 ?auto_20248 ) ) ( not ( = ?auto_20246 ?auto_20261 ) ) ( not ( = ?auto_20248 ?auto_20275 ) ) ( not ( = ?auto_20248 ?auto_20267 ) ) ( not ( = ?auto_20248 ?auto_20270 ) ) ( not ( = ?auto_20248 ?auto_20272 ) ) ( not ( = ?auto_20248 ?auto_20265 ) ) ( not ( = ?auto_20248 ?auto_20273 ) ) ( not ( = ?auto_20248 ?auto_20263 ) ) ( not ( = ?auto_20266 ?auto_20269 ) ) ( not ( = ?auto_20266 ?auto_20258 ) ) ( not ( = ?auto_20266 ?auto_20256 ) ) ( not ( = ?auto_20266 ?auto_20278 ) ) ( not ( = ?auto_20266 ?auto_20279 ) ) ( not ( = ?auto_20266 ?auto_20264 ) ) ( not ( = ?auto_20266 ?auto_20262 ) ) ( not ( = ?auto_20260 ?auto_20259 ) ) ( not ( = ?auto_20260 ?auto_20280 ) ) ( not ( = ?auto_20260 ?auto_20255 ) ) ( not ( = ?auto_20260 ?auto_20268 ) ) ( not ( = ?auto_20260 ?auto_20282 ) ) ( not ( = ?auto_20260 ?auto_20274 ) ) ( not ( = ?auto_20260 ?auto_20283 ) ) ( not ( = ?auto_20261 ?auto_20275 ) ) ( not ( = ?auto_20261 ?auto_20267 ) ) ( not ( = ?auto_20261 ?auto_20270 ) ) ( not ( = ?auto_20261 ?auto_20272 ) ) ( not ( = ?auto_20261 ?auto_20265 ) ) ( not ( = ?auto_20261 ?auto_20273 ) ) ( not ( = ?auto_20261 ?auto_20263 ) ) ( not ( = ?auto_20240 ?auto_20249 ) ) ( not ( = ?auto_20240 ?auto_20271 ) ) ( not ( = ?auto_20241 ?auto_20249 ) ) ( not ( = ?auto_20241 ?auto_20271 ) ) ( not ( = ?auto_20242 ?auto_20249 ) ) ( not ( = ?auto_20242 ?auto_20271 ) ) ( not ( = ?auto_20243 ?auto_20249 ) ) ( not ( = ?auto_20243 ?auto_20271 ) ) ( not ( = ?auto_20244 ?auto_20249 ) ) ( not ( = ?auto_20244 ?auto_20271 ) ) ( not ( = ?auto_20245 ?auto_20249 ) ) ( not ( = ?auto_20245 ?auto_20271 ) ) ( not ( = ?auto_20246 ?auto_20249 ) ) ( not ( = ?auto_20246 ?auto_20271 ) ) ( not ( = ?auto_20247 ?auto_20249 ) ) ( not ( = ?auto_20247 ?auto_20271 ) ) ( not ( = ?auto_20249 ?auto_20261 ) ) ( not ( = ?auto_20249 ?auto_20275 ) ) ( not ( = ?auto_20249 ?auto_20267 ) ) ( not ( = ?auto_20249 ?auto_20270 ) ) ( not ( = ?auto_20249 ?auto_20272 ) ) ( not ( = ?auto_20249 ?auto_20265 ) ) ( not ( = ?auto_20249 ?auto_20273 ) ) ( not ( = ?auto_20249 ?auto_20263 ) ) ( not ( = ?auto_20271 ?auto_20261 ) ) ( not ( = ?auto_20271 ?auto_20275 ) ) ( not ( = ?auto_20271 ?auto_20267 ) ) ( not ( = ?auto_20271 ?auto_20270 ) ) ( not ( = ?auto_20271 ?auto_20272 ) ) ( not ( = ?auto_20271 ?auto_20265 ) ) ( not ( = ?auto_20271 ?auto_20273 ) ) ( not ( = ?auto_20271 ?auto_20263 ) ) ( not ( = ?auto_20240 ?auto_20250 ) ) ( not ( = ?auto_20240 ?auto_20277 ) ) ( not ( = ?auto_20241 ?auto_20250 ) ) ( not ( = ?auto_20241 ?auto_20277 ) ) ( not ( = ?auto_20242 ?auto_20250 ) ) ( not ( = ?auto_20242 ?auto_20277 ) ) ( not ( = ?auto_20243 ?auto_20250 ) ) ( not ( = ?auto_20243 ?auto_20277 ) ) ( not ( = ?auto_20244 ?auto_20250 ) ) ( not ( = ?auto_20244 ?auto_20277 ) ) ( not ( = ?auto_20245 ?auto_20250 ) ) ( not ( = ?auto_20245 ?auto_20277 ) ) ( not ( = ?auto_20246 ?auto_20250 ) ) ( not ( = ?auto_20246 ?auto_20277 ) ) ( not ( = ?auto_20247 ?auto_20250 ) ) ( not ( = ?auto_20247 ?auto_20277 ) ) ( not ( = ?auto_20248 ?auto_20250 ) ) ( not ( = ?auto_20248 ?auto_20277 ) ) ( not ( = ?auto_20250 ?auto_20271 ) ) ( not ( = ?auto_20250 ?auto_20261 ) ) ( not ( = ?auto_20250 ?auto_20275 ) ) ( not ( = ?auto_20250 ?auto_20267 ) ) ( not ( = ?auto_20250 ?auto_20270 ) ) ( not ( = ?auto_20250 ?auto_20272 ) ) ( not ( = ?auto_20250 ?auto_20265 ) ) ( not ( = ?auto_20250 ?auto_20273 ) ) ( not ( = ?auto_20250 ?auto_20263 ) ) ( not ( = ?auto_20281 ?auto_20262 ) ) ( not ( = ?auto_20281 ?auto_20266 ) ) ( not ( = ?auto_20281 ?auto_20269 ) ) ( not ( = ?auto_20281 ?auto_20258 ) ) ( not ( = ?auto_20281 ?auto_20256 ) ) ( not ( = ?auto_20281 ?auto_20278 ) ) ( not ( = ?auto_20281 ?auto_20279 ) ) ( not ( = ?auto_20281 ?auto_20264 ) ) ( not ( = ?auto_20276 ?auto_20283 ) ) ( not ( = ?auto_20276 ?auto_20260 ) ) ( not ( = ?auto_20276 ?auto_20259 ) ) ( not ( = ?auto_20276 ?auto_20280 ) ) ( not ( = ?auto_20276 ?auto_20255 ) ) ( not ( = ?auto_20276 ?auto_20268 ) ) ( not ( = ?auto_20276 ?auto_20282 ) ) ( not ( = ?auto_20276 ?auto_20274 ) ) ( not ( = ?auto_20277 ?auto_20271 ) ) ( not ( = ?auto_20277 ?auto_20261 ) ) ( not ( = ?auto_20277 ?auto_20275 ) ) ( not ( = ?auto_20277 ?auto_20267 ) ) ( not ( = ?auto_20277 ?auto_20270 ) ) ( not ( = ?auto_20277 ?auto_20272 ) ) ( not ( = ?auto_20277 ?auto_20265 ) ) ( not ( = ?auto_20277 ?auto_20273 ) ) ( not ( = ?auto_20277 ?auto_20263 ) ) ( not ( = ?auto_20240 ?auto_20251 ) ) ( not ( = ?auto_20240 ?auto_20253 ) ) ( not ( = ?auto_20241 ?auto_20251 ) ) ( not ( = ?auto_20241 ?auto_20253 ) ) ( not ( = ?auto_20242 ?auto_20251 ) ) ( not ( = ?auto_20242 ?auto_20253 ) ) ( not ( = ?auto_20243 ?auto_20251 ) ) ( not ( = ?auto_20243 ?auto_20253 ) ) ( not ( = ?auto_20244 ?auto_20251 ) ) ( not ( = ?auto_20244 ?auto_20253 ) ) ( not ( = ?auto_20245 ?auto_20251 ) ) ( not ( = ?auto_20245 ?auto_20253 ) ) ( not ( = ?auto_20246 ?auto_20251 ) ) ( not ( = ?auto_20246 ?auto_20253 ) ) ( not ( = ?auto_20247 ?auto_20251 ) ) ( not ( = ?auto_20247 ?auto_20253 ) ) ( not ( = ?auto_20248 ?auto_20251 ) ) ( not ( = ?auto_20248 ?auto_20253 ) ) ( not ( = ?auto_20249 ?auto_20251 ) ) ( not ( = ?auto_20249 ?auto_20253 ) ) ( not ( = ?auto_20251 ?auto_20277 ) ) ( not ( = ?auto_20251 ?auto_20271 ) ) ( not ( = ?auto_20251 ?auto_20261 ) ) ( not ( = ?auto_20251 ?auto_20275 ) ) ( not ( = ?auto_20251 ?auto_20267 ) ) ( not ( = ?auto_20251 ?auto_20270 ) ) ( not ( = ?auto_20251 ?auto_20272 ) ) ( not ( = ?auto_20251 ?auto_20265 ) ) ( not ( = ?auto_20251 ?auto_20273 ) ) ( not ( = ?auto_20251 ?auto_20263 ) ) ( not ( = ?auto_20253 ?auto_20277 ) ) ( not ( = ?auto_20253 ?auto_20271 ) ) ( not ( = ?auto_20253 ?auto_20261 ) ) ( not ( = ?auto_20253 ?auto_20275 ) ) ( not ( = ?auto_20253 ?auto_20267 ) ) ( not ( = ?auto_20253 ?auto_20270 ) ) ( not ( = ?auto_20253 ?auto_20272 ) ) ( not ( = ?auto_20253 ?auto_20265 ) ) ( not ( = ?auto_20253 ?auto_20273 ) ) ( not ( = ?auto_20253 ?auto_20263 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_20240 ?auto_20241 ?auto_20242 ?auto_20243 ?auto_20244 ?auto_20245 ?auto_20246 ?auto_20247 ?auto_20248 ?auto_20249 ?auto_20250 )
      ( MAKE-1CRATE ?auto_20250 ?auto_20251 )
      ( MAKE-11CRATE-VERIFY ?auto_20240 ?auto_20241 ?auto_20242 ?auto_20243 ?auto_20244 ?auto_20245 ?auto_20246 ?auto_20247 ?auto_20248 ?auto_20249 ?auto_20250 ?auto_20251 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_20307 - SURFACE
      ?auto_20308 - SURFACE
      ?auto_20309 - SURFACE
      ?auto_20310 - SURFACE
      ?auto_20311 - SURFACE
      ?auto_20312 - SURFACE
      ?auto_20313 - SURFACE
      ?auto_20314 - SURFACE
      ?auto_20315 - SURFACE
      ?auto_20316 - SURFACE
      ?auto_20317 - SURFACE
      ?auto_20318 - SURFACE
      ?auto_20319 - SURFACE
    )
    :vars
    (
      ?auto_20322 - HOIST
      ?auto_20325 - PLACE
      ?auto_20323 - PLACE
      ?auto_20321 - HOIST
      ?auto_20320 - SURFACE
      ?auto_20351 - PLACE
      ?auto_20352 - HOIST
      ?auto_20327 - SURFACE
      ?auto_20341 - PLACE
      ?auto_20346 - HOIST
      ?auto_20340 - SURFACE
      ?auto_20334 - PLACE
      ?auto_20348 - HOIST
      ?auto_20333 - SURFACE
      ?auto_20328 - PLACE
      ?auto_20342 - HOIST
      ?auto_20335 - SURFACE
      ?auto_20350 - PLACE
      ?auto_20326 - HOIST
      ?auto_20347 - SURFACE
      ?auto_20336 - PLACE
      ?auto_20354 - HOIST
      ?auto_20338 - SURFACE
      ?auto_20343 - SURFACE
      ?auto_20339 - PLACE
      ?auto_20337 - HOIST
      ?auto_20345 - SURFACE
      ?auto_20353 - PLACE
      ?auto_20329 - HOIST
      ?auto_20344 - SURFACE
      ?auto_20330 - PLACE
      ?auto_20331 - HOIST
      ?auto_20349 - SURFACE
      ?auto_20332 - SURFACE
      ?auto_20324 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20322 ?auto_20325 ) ( IS-CRATE ?auto_20319 ) ( not ( = ?auto_20323 ?auto_20325 ) ) ( HOIST-AT ?auto_20321 ?auto_20323 ) ( AVAILABLE ?auto_20321 ) ( SURFACE-AT ?auto_20319 ?auto_20323 ) ( ON ?auto_20319 ?auto_20320 ) ( CLEAR ?auto_20319 ) ( not ( = ?auto_20318 ?auto_20319 ) ) ( not ( = ?auto_20318 ?auto_20320 ) ) ( not ( = ?auto_20319 ?auto_20320 ) ) ( not ( = ?auto_20322 ?auto_20321 ) ) ( IS-CRATE ?auto_20318 ) ( not ( = ?auto_20351 ?auto_20325 ) ) ( HOIST-AT ?auto_20352 ?auto_20351 ) ( SURFACE-AT ?auto_20318 ?auto_20351 ) ( ON ?auto_20318 ?auto_20327 ) ( CLEAR ?auto_20318 ) ( not ( = ?auto_20317 ?auto_20318 ) ) ( not ( = ?auto_20317 ?auto_20327 ) ) ( not ( = ?auto_20318 ?auto_20327 ) ) ( not ( = ?auto_20322 ?auto_20352 ) ) ( IS-CRATE ?auto_20317 ) ( not ( = ?auto_20341 ?auto_20325 ) ) ( HOIST-AT ?auto_20346 ?auto_20341 ) ( AVAILABLE ?auto_20346 ) ( SURFACE-AT ?auto_20317 ?auto_20341 ) ( ON ?auto_20317 ?auto_20340 ) ( CLEAR ?auto_20317 ) ( not ( = ?auto_20316 ?auto_20317 ) ) ( not ( = ?auto_20316 ?auto_20340 ) ) ( not ( = ?auto_20317 ?auto_20340 ) ) ( not ( = ?auto_20322 ?auto_20346 ) ) ( IS-CRATE ?auto_20316 ) ( not ( = ?auto_20334 ?auto_20325 ) ) ( HOIST-AT ?auto_20348 ?auto_20334 ) ( SURFACE-AT ?auto_20316 ?auto_20334 ) ( ON ?auto_20316 ?auto_20333 ) ( CLEAR ?auto_20316 ) ( not ( = ?auto_20315 ?auto_20316 ) ) ( not ( = ?auto_20315 ?auto_20333 ) ) ( not ( = ?auto_20316 ?auto_20333 ) ) ( not ( = ?auto_20322 ?auto_20348 ) ) ( IS-CRATE ?auto_20315 ) ( not ( = ?auto_20328 ?auto_20325 ) ) ( HOIST-AT ?auto_20342 ?auto_20328 ) ( AVAILABLE ?auto_20342 ) ( SURFACE-AT ?auto_20315 ?auto_20328 ) ( ON ?auto_20315 ?auto_20335 ) ( CLEAR ?auto_20315 ) ( not ( = ?auto_20314 ?auto_20315 ) ) ( not ( = ?auto_20314 ?auto_20335 ) ) ( not ( = ?auto_20315 ?auto_20335 ) ) ( not ( = ?auto_20322 ?auto_20342 ) ) ( IS-CRATE ?auto_20314 ) ( not ( = ?auto_20350 ?auto_20325 ) ) ( HOIST-AT ?auto_20326 ?auto_20350 ) ( AVAILABLE ?auto_20326 ) ( SURFACE-AT ?auto_20314 ?auto_20350 ) ( ON ?auto_20314 ?auto_20347 ) ( CLEAR ?auto_20314 ) ( not ( = ?auto_20313 ?auto_20314 ) ) ( not ( = ?auto_20313 ?auto_20347 ) ) ( not ( = ?auto_20314 ?auto_20347 ) ) ( not ( = ?auto_20322 ?auto_20326 ) ) ( IS-CRATE ?auto_20313 ) ( not ( = ?auto_20336 ?auto_20325 ) ) ( HOIST-AT ?auto_20354 ?auto_20336 ) ( AVAILABLE ?auto_20354 ) ( SURFACE-AT ?auto_20313 ?auto_20336 ) ( ON ?auto_20313 ?auto_20338 ) ( CLEAR ?auto_20313 ) ( not ( = ?auto_20312 ?auto_20313 ) ) ( not ( = ?auto_20312 ?auto_20338 ) ) ( not ( = ?auto_20313 ?auto_20338 ) ) ( not ( = ?auto_20322 ?auto_20354 ) ) ( IS-CRATE ?auto_20312 ) ( AVAILABLE ?auto_20352 ) ( SURFACE-AT ?auto_20312 ?auto_20351 ) ( ON ?auto_20312 ?auto_20343 ) ( CLEAR ?auto_20312 ) ( not ( = ?auto_20311 ?auto_20312 ) ) ( not ( = ?auto_20311 ?auto_20343 ) ) ( not ( = ?auto_20312 ?auto_20343 ) ) ( IS-CRATE ?auto_20311 ) ( not ( = ?auto_20339 ?auto_20325 ) ) ( HOIST-AT ?auto_20337 ?auto_20339 ) ( AVAILABLE ?auto_20337 ) ( SURFACE-AT ?auto_20311 ?auto_20339 ) ( ON ?auto_20311 ?auto_20345 ) ( CLEAR ?auto_20311 ) ( not ( = ?auto_20310 ?auto_20311 ) ) ( not ( = ?auto_20310 ?auto_20345 ) ) ( not ( = ?auto_20311 ?auto_20345 ) ) ( not ( = ?auto_20322 ?auto_20337 ) ) ( IS-CRATE ?auto_20310 ) ( not ( = ?auto_20353 ?auto_20325 ) ) ( HOIST-AT ?auto_20329 ?auto_20353 ) ( AVAILABLE ?auto_20329 ) ( SURFACE-AT ?auto_20310 ?auto_20353 ) ( ON ?auto_20310 ?auto_20344 ) ( CLEAR ?auto_20310 ) ( not ( = ?auto_20309 ?auto_20310 ) ) ( not ( = ?auto_20309 ?auto_20344 ) ) ( not ( = ?auto_20310 ?auto_20344 ) ) ( not ( = ?auto_20322 ?auto_20329 ) ) ( IS-CRATE ?auto_20309 ) ( not ( = ?auto_20330 ?auto_20325 ) ) ( HOIST-AT ?auto_20331 ?auto_20330 ) ( AVAILABLE ?auto_20331 ) ( SURFACE-AT ?auto_20309 ?auto_20330 ) ( ON ?auto_20309 ?auto_20349 ) ( CLEAR ?auto_20309 ) ( not ( = ?auto_20308 ?auto_20309 ) ) ( not ( = ?auto_20308 ?auto_20349 ) ) ( not ( = ?auto_20309 ?auto_20349 ) ) ( not ( = ?auto_20322 ?auto_20331 ) ) ( SURFACE-AT ?auto_20307 ?auto_20325 ) ( CLEAR ?auto_20307 ) ( IS-CRATE ?auto_20308 ) ( AVAILABLE ?auto_20322 ) ( AVAILABLE ?auto_20348 ) ( SURFACE-AT ?auto_20308 ?auto_20334 ) ( ON ?auto_20308 ?auto_20332 ) ( CLEAR ?auto_20308 ) ( TRUCK-AT ?auto_20324 ?auto_20325 ) ( not ( = ?auto_20307 ?auto_20308 ) ) ( not ( = ?auto_20307 ?auto_20332 ) ) ( not ( = ?auto_20308 ?auto_20332 ) ) ( not ( = ?auto_20307 ?auto_20309 ) ) ( not ( = ?auto_20307 ?auto_20349 ) ) ( not ( = ?auto_20309 ?auto_20332 ) ) ( not ( = ?auto_20330 ?auto_20334 ) ) ( not ( = ?auto_20331 ?auto_20348 ) ) ( not ( = ?auto_20349 ?auto_20332 ) ) ( not ( = ?auto_20307 ?auto_20310 ) ) ( not ( = ?auto_20307 ?auto_20344 ) ) ( not ( = ?auto_20308 ?auto_20310 ) ) ( not ( = ?auto_20308 ?auto_20344 ) ) ( not ( = ?auto_20310 ?auto_20349 ) ) ( not ( = ?auto_20310 ?auto_20332 ) ) ( not ( = ?auto_20353 ?auto_20330 ) ) ( not ( = ?auto_20353 ?auto_20334 ) ) ( not ( = ?auto_20329 ?auto_20331 ) ) ( not ( = ?auto_20329 ?auto_20348 ) ) ( not ( = ?auto_20344 ?auto_20349 ) ) ( not ( = ?auto_20344 ?auto_20332 ) ) ( not ( = ?auto_20307 ?auto_20311 ) ) ( not ( = ?auto_20307 ?auto_20345 ) ) ( not ( = ?auto_20308 ?auto_20311 ) ) ( not ( = ?auto_20308 ?auto_20345 ) ) ( not ( = ?auto_20309 ?auto_20311 ) ) ( not ( = ?auto_20309 ?auto_20345 ) ) ( not ( = ?auto_20311 ?auto_20344 ) ) ( not ( = ?auto_20311 ?auto_20349 ) ) ( not ( = ?auto_20311 ?auto_20332 ) ) ( not ( = ?auto_20339 ?auto_20353 ) ) ( not ( = ?auto_20339 ?auto_20330 ) ) ( not ( = ?auto_20339 ?auto_20334 ) ) ( not ( = ?auto_20337 ?auto_20329 ) ) ( not ( = ?auto_20337 ?auto_20331 ) ) ( not ( = ?auto_20337 ?auto_20348 ) ) ( not ( = ?auto_20345 ?auto_20344 ) ) ( not ( = ?auto_20345 ?auto_20349 ) ) ( not ( = ?auto_20345 ?auto_20332 ) ) ( not ( = ?auto_20307 ?auto_20312 ) ) ( not ( = ?auto_20307 ?auto_20343 ) ) ( not ( = ?auto_20308 ?auto_20312 ) ) ( not ( = ?auto_20308 ?auto_20343 ) ) ( not ( = ?auto_20309 ?auto_20312 ) ) ( not ( = ?auto_20309 ?auto_20343 ) ) ( not ( = ?auto_20310 ?auto_20312 ) ) ( not ( = ?auto_20310 ?auto_20343 ) ) ( not ( = ?auto_20312 ?auto_20345 ) ) ( not ( = ?auto_20312 ?auto_20344 ) ) ( not ( = ?auto_20312 ?auto_20349 ) ) ( not ( = ?auto_20312 ?auto_20332 ) ) ( not ( = ?auto_20351 ?auto_20339 ) ) ( not ( = ?auto_20351 ?auto_20353 ) ) ( not ( = ?auto_20351 ?auto_20330 ) ) ( not ( = ?auto_20351 ?auto_20334 ) ) ( not ( = ?auto_20352 ?auto_20337 ) ) ( not ( = ?auto_20352 ?auto_20329 ) ) ( not ( = ?auto_20352 ?auto_20331 ) ) ( not ( = ?auto_20352 ?auto_20348 ) ) ( not ( = ?auto_20343 ?auto_20345 ) ) ( not ( = ?auto_20343 ?auto_20344 ) ) ( not ( = ?auto_20343 ?auto_20349 ) ) ( not ( = ?auto_20343 ?auto_20332 ) ) ( not ( = ?auto_20307 ?auto_20313 ) ) ( not ( = ?auto_20307 ?auto_20338 ) ) ( not ( = ?auto_20308 ?auto_20313 ) ) ( not ( = ?auto_20308 ?auto_20338 ) ) ( not ( = ?auto_20309 ?auto_20313 ) ) ( not ( = ?auto_20309 ?auto_20338 ) ) ( not ( = ?auto_20310 ?auto_20313 ) ) ( not ( = ?auto_20310 ?auto_20338 ) ) ( not ( = ?auto_20311 ?auto_20313 ) ) ( not ( = ?auto_20311 ?auto_20338 ) ) ( not ( = ?auto_20313 ?auto_20343 ) ) ( not ( = ?auto_20313 ?auto_20345 ) ) ( not ( = ?auto_20313 ?auto_20344 ) ) ( not ( = ?auto_20313 ?auto_20349 ) ) ( not ( = ?auto_20313 ?auto_20332 ) ) ( not ( = ?auto_20336 ?auto_20351 ) ) ( not ( = ?auto_20336 ?auto_20339 ) ) ( not ( = ?auto_20336 ?auto_20353 ) ) ( not ( = ?auto_20336 ?auto_20330 ) ) ( not ( = ?auto_20336 ?auto_20334 ) ) ( not ( = ?auto_20354 ?auto_20352 ) ) ( not ( = ?auto_20354 ?auto_20337 ) ) ( not ( = ?auto_20354 ?auto_20329 ) ) ( not ( = ?auto_20354 ?auto_20331 ) ) ( not ( = ?auto_20354 ?auto_20348 ) ) ( not ( = ?auto_20338 ?auto_20343 ) ) ( not ( = ?auto_20338 ?auto_20345 ) ) ( not ( = ?auto_20338 ?auto_20344 ) ) ( not ( = ?auto_20338 ?auto_20349 ) ) ( not ( = ?auto_20338 ?auto_20332 ) ) ( not ( = ?auto_20307 ?auto_20314 ) ) ( not ( = ?auto_20307 ?auto_20347 ) ) ( not ( = ?auto_20308 ?auto_20314 ) ) ( not ( = ?auto_20308 ?auto_20347 ) ) ( not ( = ?auto_20309 ?auto_20314 ) ) ( not ( = ?auto_20309 ?auto_20347 ) ) ( not ( = ?auto_20310 ?auto_20314 ) ) ( not ( = ?auto_20310 ?auto_20347 ) ) ( not ( = ?auto_20311 ?auto_20314 ) ) ( not ( = ?auto_20311 ?auto_20347 ) ) ( not ( = ?auto_20312 ?auto_20314 ) ) ( not ( = ?auto_20312 ?auto_20347 ) ) ( not ( = ?auto_20314 ?auto_20338 ) ) ( not ( = ?auto_20314 ?auto_20343 ) ) ( not ( = ?auto_20314 ?auto_20345 ) ) ( not ( = ?auto_20314 ?auto_20344 ) ) ( not ( = ?auto_20314 ?auto_20349 ) ) ( not ( = ?auto_20314 ?auto_20332 ) ) ( not ( = ?auto_20350 ?auto_20336 ) ) ( not ( = ?auto_20350 ?auto_20351 ) ) ( not ( = ?auto_20350 ?auto_20339 ) ) ( not ( = ?auto_20350 ?auto_20353 ) ) ( not ( = ?auto_20350 ?auto_20330 ) ) ( not ( = ?auto_20350 ?auto_20334 ) ) ( not ( = ?auto_20326 ?auto_20354 ) ) ( not ( = ?auto_20326 ?auto_20352 ) ) ( not ( = ?auto_20326 ?auto_20337 ) ) ( not ( = ?auto_20326 ?auto_20329 ) ) ( not ( = ?auto_20326 ?auto_20331 ) ) ( not ( = ?auto_20326 ?auto_20348 ) ) ( not ( = ?auto_20347 ?auto_20338 ) ) ( not ( = ?auto_20347 ?auto_20343 ) ) ( not ( = ?auto_20347 ?auto_20345 ) ) ( not ( = ?auto_20347 ?auto_20344 ) ) ( not ( = ?auto_20347 ?auto_20349 ) ) ( not ( = ?auto_20347 ?auto_20332 ) ) ( not ( = ?auto_20307 ?auto_20315 ) ) ( not ( = ?auto_20307 ?auto_20335 ) ) ( not ( = ?auto_20308 ?auto_20315 ) ) ( not ( = ?auto_20308 ?auto_20335 ) ) ( not ( = ?auto_20309 ?auto_20315 ) ) ( not ( = ?auto_20309 ?auto_20335 ) ) ( not ( = ?auto_20310 ?auto_20315 ) ) ( not ( = ?auto_20310 ?auto_20335 ) ) ( not ( = ?auto_20311 ?auto_20315 ) ) ( not ( = ?auto_20311 ?auto_20335 ) ) ( not ( = ?auto_20312 ?auto_20315 ) ) ( not ( = ?auto_20312 ?auto_20335 ) ) ( not ( = ?auto_20313 ?auto_20315 ) ) ( not ( = ?auto_20313 ?auto_20335 ) ) ( not ( = ?auto_20315 ?auto_20347 ) ) ( not ( = ?auto_20315 ?auto_20338 ) ) ( not ( = ?auto_20315 ?auto_20343 ) ) ( not ( = ?auto_20315 ?auto_20345 ) ) ( not ( = ?auto_20315 ?auto_20344 ) ) ( not ( = ?auto_20315 ?auto_20349 ) ) ( not ( = ?auto_20315 ?auto_20332 ) ) ( not ( = ?auto_20328 ?auto_20350 ) ) ( not ( = ?auto_20328 ?auto_20336 ) ) ( not ( = ?auto_20328 ?auto_20351 ) ) ( not ( = ?auto_20328 ?auto_20339 ) ) ( not ( = ?auto_20328 ?auto_20353 ) ) ( not ( = ?auto_20328 ?auto_20330 ) ) ( not ( = ?auto_20328 ?auto_20334 ) ) ( not ( = ?auto_20342 ?auto_20326 ) ) ( not ( = ?auto_20342 ?auto_20354 ) ) ( not ( = ?auto_20342 ?auto_20352 ) ) ( not ( = ?auto_20342 ?auto_20337 ) ) ( not ( = ?auto_20342 ?auto_20329 ) ) ( not ( = ?auto_20342 ?auto_20331 ) ) ( not ( = ?auto_20342 ?auto_20348 ) ) ( not ( = ?auto_20335 ?auto_20347 ) ) ( not ( = ?auto_20335 ?auto_20338 ) ) ( not ( = ?auto_20335 ?auto_20343 ) ) ( not ( = ?auto_20335 ?auto_20345 ) ) ( not ( = ?auto_20335 ?auto_20344 ) ) ( not ( = ?auto_20335 ?auto_20349 ) ) ( not ( = ?auto_20335 ?auto_20332 ) ) ( not ( = ?auto_20307 ?auto_20316 ) ) ( not ( = ?auto_20307 ?auto_20333 ) ) ( not ( = ?auto_20308 ?auto_20316 ) ) ( not ( = ?auto_20308 ?auto_20333 ) ) ( not ( = ?auto_20309 ?auto_20316 ) ) ( not ( = ?auto_20309 ?auto_20333 ) ) ( not ( = ?auto_20310 ?auto_20316 ) ) ( not ( = ?auto_20310 ?auto_20333 ) ) ( not ( = ?auto_20311 ?auto_20316 ) ) ( not ( = ?auto_20311 ?auto_20333 ) ) ( not ( = ?auto_20312 ?auto_20316 ) ) ( not ( = ?auto_20312 ?auto_20333 ) ) ( not ( = ?auto_20313 ?auto_20316 ) ) ( not ( = ?auto_20313 ?auto_20333 ) ) ( not ( = ?auto_20314 ?auto_20316 ) ) ( not ( = ?auto_20314 ?auto_20333 ) ) ( not ( = ?auto_20316 ?auto_20335 ) ) ( not ( = ?auto_20316 ?auto_20347 ) ) ( not ( = ?auto_20316 ?auto_20338 ) ) ( not ( = ?auto_20316 ?auto_20343 ) ) ( not ( = ?auto_20316 ?auto_20345 ) ) ( not ( = ?auto_20316 ?auto_20344 ) ) ( not ( = ?auto_20316 ?auto_20349 ) ) ( not ( = ?auto_20316 ?auto_20332 ) ) ( not ( = ?auto_20333 ?auto_20335 ) ) ( not ( = ?auto_20333 ?auto_20347 ) ) ( not ( = ?auto_20333 ?auto_20338 ) ) ( not ( = ?auto_20333 ?auto_20343 ) ) ( not ( = ?auto_20333 ?auto_20345 ) ) ( not ( = ?auto_20333 ?auto_20344 ) ) ( not ( = ?auto_20333 ?auto_20349 ) ) ( not ( = ?auto_20333 ?auto_20332 ) ) ( not ( = ?auto_20307 ?auto_20317 ) ) ( not ( = ?auto_20307 ?auto_20340 ) ) ( not ( = ?auto_20308 ?auto_20317 ) ) ( not ( = ?auto_20308 ?auto_20340 ) ) ( not ( = ?auto_20309 ?auto_20317 ) ) ( not ( = ?auto_20309 ?auto_20340 ) ) ( not ( = ?auto_20310 ?auto_20317 ) ) ( not ( = ?auto_20310 ?auto_20340 ) ) ( not ( = ?auto_20311 ?auto_20317 ) ) ( not ( = ?auto_20311 ?auto_20340 ) ) ( not ( = ?auto_20312 ?auto_20317 ) ) ( not ( = ?auto_20312 ?auto_20340 ) ) ( not ( = ?auto_20313 ?auto_20317 ) ) ( not ( = ?auto_20313 ?auto_20340 ) ) ( not ( = ?auto_20314 ?auto_20317 ) ) ( not ( = ?auto_20314 ?auto_20340 ) ) ( not ( = ?auto_20315 ?auto_20317 ) ) ( not ( = ?auto_20315 ?auto_20340 ) ) ( not ( = ?auto_20317 ?auto_20333 ) ) ( not ( = ?auto_20317 ?auto_20335 ) ) ( not ( = ?auto_20317 ?auto_20347 ) ) ( not ( = ?auto_20317 ?auto_20338 ) ) ( not ( = ?auto_20317 ?auto_20343 ) ) ( not ( = ?auto_20317 ?auto_20345 ) ) ( not ( = ?auto_20317 ?auto_20344 ) ) ( not ( = ?auto_20317 ?auto_20349 ) ) ( not ( = ?auto_20317 ?auto_20332 ) ) ( not ( = ?auto_20341 ?auto_20334 ) ) ( not ( = ?auto_20341 ?auto_20328 ) ) ( not ( = ?auto_20341 ?auto_20350 ) ) ( not ( = ?auto_20341 ?auto_20336 ) ) ( not ( = ?auto_20341 ?auto_20351 ) ) ( not ( = ?auto_20341 ?auto_20339 ) ) ( not ( = ?auto_20341 ?auto_20353 ) ) ( not ( = ?auto_20341 ?auto_20330 ) ) ( not ( = ?auto_20346 ?auto_20348 ) ) ( not ( = ?auto_20346 ?auto_20342 ) ) ( not ( = ?auto_20346 ?auto_20326 ) ) ( not ( = ?auto_20346 ?auto_20354 ) ) ( not ( = ?auto_20346 ?auto_20352 ) ) ( not ( = ?auto_20346 ?auto_20337 ) ) ( not ( = ?auto_20346 ?auto_20329 ) ) ( not ( = ?auto_20346 ?auto_20331 ) ) ( not ( = ?auto_20340 ?auto_20333 ) ) ( not ( = ?auto_20340 ?auto_20335 ) ) ( not ( = ?auto_20340 ?auto_20347 ) ) ( not ( = ?auto_20340 ?auto_20338 ) ) ( not ( = ?auto_20340 ?auto_20343 ) ) ( not ( = ?auto_20340 ?auto_20345 ) ) ( not ( = ?auto_20340 ?auto_20344 ) ) ( not ( = ?auto_20340 ?auto_20349 ) ) ( not ( = ?auto_20340 ?auto_20332 ) ) ( not ( = ?auto_20307 ?auto_20318 ) ) ( not ( = ?auto_20307 ?auto_20327 ) ) ( not ( = ?auto_20308 ?auto_20318 ) ) ( not ( = ?auto_20308 ?auto_20327 ) ) ( not ( = ?auto_20309 ?auto_20318 ) ) ( not ( = ?auto_20309 ?auto_20327 ) ) ( not ( = ?auto_20310 ?auto_20318 ) ) ( not ( = ?auto_20310 ?auto_20327 ) ) ( not ( = ?auto_20311 ?auto_20318 ) ) ( not ( = ?auto_20311 ?auto_20327 ) ) ( not ( = ?auto_20312 ?auto_20318 ) ) ( not ( = ?auto_20312 ?auto_20327 ) ) ( not ( = ?auto_20313 ?auto_20318 ) ) ( not ( = ?auto_20313 ?auto_20327 ) ) ( not ( = ?auto_20314 ?auto_20318 ) ) ( not ( = ?auto_20314 ?auto_20327 ) ) ( not ( = ?auto_20315 ?auto_20318 ) ) ( not ( = ?auto_20315 ?auto_20327 ) ) ( not ( = ?auto_20316 ?auto_20318 ) ) ( not ( = ?auto_20316 ?auto_20327 ) ) ( not ( = ?auto_20318 ?auto_20340 ) ) ( not ( = ?auto_20318 ?auto_20333 ) ) ( not ( = ?auto_20318 ?auto_20335 ) ) ( not ( = ?auto_20318 ?auto_20347 ) ) ( not ( = ?auto_20318 ?auto_20338 ) ) ( not ( = ?auto_20318 ?auto_20343 ) ) ( not ( = ?auto_20318 ?auto_20345 ) ) ( not ( = ?auto_20318 ?auto_20344 ) ) ( not ( = ?auto_20318 ?auto_20349 ) ) ( not ( = ?auto_20318 ?auto_20332 ) ) ( not ( = ?auto_20327 ?auto_20340 ) ) ( not ( = ?auto_20327 ?auto_20333 ) ) ( not ( = ?auto_20327 ?auto_20335 ) ) ( not ( = ?auto_20327 ?auto_20347 ) ) ( not ( = ?auto_20327 ?auto_20338 ) ) ( not ( = ?auto_20327 ?auto_20343 ) ) ( not ( = ?auto_20327 ?auto_20345 ) ) ( not ( = ?auto_20327 ?auto_20344 ) ) ( not ( = ?auto_20327 ?auto_20349 ) ) ( not ( = ?auto_20327 ?auto_20332 ) ) ( not ( = ?auto_20307 ?auto_20319 ) ) ( not ( = ?auto_20307 ?auto_20320 ) ) ( not ( = ?auto_20308 ?auto_20319 ) ) ( not ( = ?auto_20308 ?auto_20320 ) ) ( not ( = ?auto_20309 ?auto_20319 ) ) ( not ( = ?auto_20309 ?auto_20320 ) ) ( not ( = ?auto_20310 ?auto_20319 ) ) ( not ( = ?auto_20310 ?auto_20320 ) ) ( not ( = ?auto_20311 ?auto_20319 ) ) ( not ( = ?auto_20311 ?auto_20320 ) ) ( not ( = ?auto_20312 ?auto_20319 ) ) ( not ( = ?auto_20312 ?auto_20320 ) ) ( not ( = ?auto_20313 ?auto_20319 ) ) ( not ( = ?auto_20313 ?auto_20320 ) ) ( not ( = ?auto_20314 ?auto_20319 ) ) ( not ( = ?auto_20314 ?auto_20320 ) ) ( not ( = ?auto_20315 ?auto_20319 ) ) ( not ( = ?auto_20315 ?auto_20320 ) ) ( not ( = ?auto_20316 ?auto_20319 ) ) ( not ( = ?auto_20316 ?auto_20320 ) ) ( not ( = ?auto_20317 ?auto_20319 ) ) ( not ( = ?auto_20317 ?auto_20320 ) ) ( not ( = ?auto_20319 ?auto_20327 ) ) ( not ( = ?auto_20319 ?auto_20340 ) ) ( not ( = ?auto_20319 ?auto_20333 ) ) ( not ( = ?auto_20319 ?auto_20335 ) ) ( not ( = ?auto_20319 ?auto_20347 ) ) ( not ( = ?auto_20319 ?auto_20338 ) ) ( not ( = ?auto_20319 ?auto_20343 ) ) ( not ( = ?auto_20319 ?auto_20345 ) ) ( not ( = ?auto_20319 ?auto_20344 ) ) ( not ( = ?auto_20319 ?auto_20349 ) ) ( not ( = ?auto_20319 ?auto_20332 ) ) ( not ( = ?auto_20323 ?auto_20351 ) ) ( not ( = ?auto_20323 ?auto_20341 ) ) ( not ( = ?auto_20323 ?auto_20334 ) ) ( not ( = ?auto_20323 ?auto_20328 ) ) ( not ( = ?auto_20323 ?auto_20350 ) ) ( not ( = ?auto_20323 ?auto_20336 ) ) ( not ( = ?auto_20323 ?auto_20339 ) ) ( not ( = ?auto_20323 ?auto_20353 ) ) ( not ( = ?auto_20323 ?auto_20330 ) ) ( not ( = ?auto_20321 ?auto_20352 ) ) ( not ( = ?auto_20321 ?auto_20346 ) ) ( not ( = ?auto_20321 ?auto_20348 ) ) ( not ( = ?auto_20321 ?auto_20342 ) ) ( not ( = ?auto_20321 ?auto_20326 ) ) ( not ( = ?auto_20321 ?auto_20354 ) ) ( not ( = ?auto_20321 ?auto_20337 ) ) ( not ( = ?auto_20321 ?auto_20329 ) ) ( not ( = ?auto_20321 ?auto_20331 ) ) ( not ( = ?auto_20320 ?auto_20327 ) ) ( not ( = ?auto_20320 ?auto_20340 ) ) ( not ( = ?auto_20320 ?auto_20333 ) ) ( not ( = ?auto_20320 ?auto_20335 ) ) ( not ( = ?auto_20320 ?auto_20347 ) ) ( not ( = ?auto_20320 ?auto_20338 ) ) ( not ( = ?auto_20320 ?auto_20343 ) ) ( not ( = ?auto_20320 ?auto_20345 ) ) ( not ( = ?auto_20320 ?auto_20344 ) ) ( not ( = ?auto_20320 ?auto_20349 ) ) ( not ( = ?auto_20320 ?auto_20332 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_20307 ?auto_20308 ?auto_20309 ?auto_20310 ?auto_20311 ?auto_20312 ?auto_20313 ?auto_20314 ?auto_20315 ?auto_20316 ?auto_20317 ?auto_20318 )
      ( MAKE-1CRATE ?auto_20318 ?auto_20319 )
      ( MAKE-12CRATE-VERIFY ?auto_20307 ?auto_20308 ?auto_20309 ?auto_20310 ?auto_20311 ?auto_20312 ?auto_20313 ?auto_20314 ?auto_20315 ?auto_20316 ?auto_20317 ?auto_20318 ?auto_20319 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_20379 - SURFACE
      ?auto_20380 - SURFACE
      ?auto_20381 - SURFACE
      ?auto_20382 - SURFACE
      ?auto_20383 - SURFACE
      ?auto_20384 - SURFACE
      ?auto_20385 - SURFACE
      ?auto_20386 - SURFACE
      ?auto_20387 - SURFACE
      ?auto_20388 - SURFACE
      ?auto_20389 - SURFACE
      ?auto_20390 - SURFACE
      ?auto_20391 - SURFACE
      ?auto_20392 - SURFACE
    )
    :vars
    (
      ?auto_20396 - HOIST
      ?auto_20393 - PLACE
      ?auto_20394 - PLACE
      ?auto_20395 - HOIST
      ?auto_20398 - SURFACE
      ?auto_20424 - PLACE
      ?auto_20409 - HOIST
      ?auto_20407 - SURFACE
      ?auto_20403 - PLACE
      ?auto_20408 - HOIST
      ?auto_20411 - SURFACE
      ?auto_20405 - SURFACE
      ?auto_20410 - PLACE
      ?auto_20402 - HOIST
      ?auto_20425 - SURFACE
      ?auto_20416 - PLACE
      ?auto_20427 - HOIST
      ?auto_20417 - SURFACE
      ?auto_20421 - PLACE
      ?auto_20426 - HOIST
      ?auto_20418 - SURFACE
      ?auto_20420 - PLACE
      ?auto_20422 - HOIST
      ?auto_20415 - SURFACE
      ?auto_20401 - SURFACE
      ?auto_20404 - PLACE
      ?auto_20423 - HOIST
      ?auto_20406 - SURFACE
      ?auto_20428 - PLACE
      ?auto_20413 - HOIST
      ?auto_20419 - SURFACE
      ?auto_20399 - PLACE
      ?auto_20412 - HOIST
      ?auto_20400 - SURFACE
      ?auto_20414 - SURFACE
      ?auto_20397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20396 ?auto_20393 ) ( IS-CRATE ?auto_20392 ) ( not ( = ?auto_20394 ?auto_20393 ) ) ( HOIST-AT ?auto_20395 ?auto_20394 ) ( SURFACE-AT ?auto_20392 ?auto_20394 ) ( ON ?auto_20392 ?auto_20398 ) ( CLEAR ?auto_20392 ) ( not ( = ?auto_20391 ?auto_20392 ) ) ( not ( = ?auto_20391 ?auto_20398 ) ) ( not ( = ?auto_20392 ?auto_20398 ) ) ( not ( = ?auto_20396 ?auto_20395 ) ) ( IS-CRATE ?auto_20391 ) ( not ( = ?auto_20424 ?auto_20393 ) ) ( HOIST-AT ?auto_20409 ?auto_20424 ) ( AVAILABLE ?auto_20409 ) ( SURFACE-AT ?auto_20391 ?auto_20424 ) ( ON ?auto_20391 ?auto_20407 ) ( CLEAR ?auto_20391 ) ( not ( = ?auto_20390 ?auto_20391 ) ) ( not ( = ?auto_20390 ?auto_20407 ) ) ( not ( = ?auto_20391 ?auto_20407 ) ) ( not ( = ?auto_20396 ?auto_20409 ) ) ( IS-CRATE ?auto_20390 ) ( not ( = ?auto_20403 ?auto_20393 ) ) ( HOIST-AT ?auto_20408 ?auto_20403 ) ( SURFACE-AT ?auto_20390 ?auto_20403 ) ( ON ?auto_20390 ?auto_20411 ) ( CLEAR ?auto_20390 ) ( not ( = ?auto_20389 ?auto_20390 ) ) ( not ( = ?auto_20389 ?auto_20411 ) ) ( not ( = ?auto_20390 ?auto_20411 ) ) ( not ( = ?auto_20396 ?auto_20408 ) ) ( IS-CRATE ?auto_20389 ) ( AVAILABLE ?auto_20395 ) ( SURFACE-AT ?auto_20389 ?auto_20394 ) ( ON ?auto_20389 ?auto_20405 ) ( CLEAR ?auto_20389 ) ( not ( = ?auto_20388 ?auto_20389 ) ) ( not ( = ?auto_20388 ?auto_20405 ) ) ( not ( = ?auto_20389 ?auto_20405 ) ) ( IS-CRATE ?auto_20388 ) ( not ( = ?auto_20410 ?auto_20393 ) ) ( HOIST-AT ?auto_20402 ?auto_20410 ) ( SURFACE-AT ?auto_20388 ?auto_20410 ) ( ON ?auto_20388 ?auto_20425 ) ( CLEAR ?auto_20388 ) ( not ( = ?auto_20387 ?auto_20388 ) ) ( not ( = ?auto_20387 ?auto_20425 ) ) ( not ( = ?auto_20388 ?auto_20425 ) ) ( not ( = ?auto_20396 ?auto_20402 ) ) ( IS-CRATE ?auto_20387 ) ( not ( = ?auto_20416 ?auto_20393 ) ) ( HOIST-AT ?auto_20427 ?auto_20416 ) ( AVAILABLE ?auto_20427 ) ( SURFACE-AT ?auto_20387 ?auto_20416 ) ( ON ?auto_20387 ?auto_20417 ) ( CLEAR ?auto_20387 ) ( not ( = ?auto_20386 ?auto_20387 ) ) ( not ( = ?auto_20386 ?auto_20417 ) ) ( not ( = ?auto_20387 ?auto_20417 ) ) ( not ( = ?auto_20396 ?auto_20427 ) ) ( IS-CRATE ?auto_20386 ) ( not ( = ?auto_20421 ?auto_20393 ) ) ( HOIST-AT ?auto_20426 ?auto_20421 ) ( AVAILABLE ?auto_20426 ) ( SURFACE-AT ?auto_20386 ?auto_20421 ) ( ON ?auto_20386 ?auto_20418 ) ( CLEAR ?auto_20386 ) ( not ( = ?auto_20385 ?auto_20386 ) ) ( not ( = ?auto_20385 ?auto_20418 ) ) ( not ( = ?auto_20386 ?auto_20418 ) ) ( not ( = ?auto_20396 ?auto_20426 ) ) ( IS-CRATE ?auto_20385 ) ( not ( = ?auto_20420 ?auto_20393 ) ) ( HOIST-AT ?auto_20422 ?auto_20420 ) ( AVAILABLE ?auto_20422 ) ( SURFACE-AT ?auto_20385 ?auto_20420 ) ( ON ?auto_20385 ?auto_20415 ) ( CLEAR ?auto_20385 ) ( not ( = ?auto_20384 ?auto_20385 ) ) ( not ( = ?auto_20384 ?auto_20415 ) ) ( not ( = ?auto_20385 ?auto_20415 ) ) ( not ( = ?auto_20396 ?auto_20422 ) ) ( IS-CRATE ?auto_20384 ) ( AVAILABLE ?auto_20408 ) ( SURFACE-AT ?auto_20384 ?auto_20403 ) ( ON ?auto_20384 ?auto_20401 ) ( CLEAR ?auto_20384 ) ( not ( = ?auto_20383 ?auto_20384 ) ) ( not ( = ?auto_20383 ?auto_20401 ) ) ( not ( = ?auto_20384 ?auto_20401 ) ) ( IS-CRATE ?auto_20383 ) ( not ( = ?auto_20404 ?auto_20393 ) ) ( HOIST-AT ?auto_20423 ?auto_20404 ) ( AVAILABLE ?auto_20423 ) ( SURFACE-AT ?auto_20383 ?auto_20404 ) ( ON ?auto_20383 ?auto_20406 ) ( CLEAR ?auto_20383 ) ( not ( = ?auto_20382 ?auto_20383 ) ) ( not ( = ?auto_20382 ?auto_20406 ) ) ( not ( = ?auto_20383 ?auto_20406 ) ) ( not ( = ?auto_20396 ?auto_20423 ) ) ( IS-CRATE ?auto_20382 ) ( not ( = ?auto_20428 ?auto_20393 ) ) ( HOIST-AT ?auto_20413 ?auto_20428 ) ( AVAILABLE ?auto_20413 ) ( SURFACE-AT ?auto_20382 ?auto_20428 ) ( ON ?auto_20382 ?auto_20419 ) ( CLEAR ?auto_20382 ) ( not ( = ?auto_20381 ?auto_20382 ) ) ( not ( = ?auto_20381 ?auto_20419 ) ) ( not ( = ?auto_20382 ?auto_20419 ) ) ( not ( = ?auto_20396 ?auto_20413 ) ) ( IS-CRATE ?auto_20381 ) ( not ( = ?auto_20399 ?auto_20393 ) ) ( HOIST-AT ?auto_20412 ?auto_20399 ) ( AVAILABLE ?auto_20412 ) ( SURFACE-AT ?auto_20381 ?auto_20399 ) ( ON ?auto_20381 ?auto_20400 ) ( CLEAR ?auto_20381 ) ( not ( = ?auto_20380 ?auto_20381 ) ) ( not ( = ?auto_20380 ?auto_20400 ) ) ( not ( = ?auto_20381 ?auto_20400 ) ) ( not ( = ?auto_20396 ?auto_20412 ) ) ( SURFACE-AT ?auto_20379 ?auto_20393 ) ( CLEAR ?auto_20379 ) ( IS-CRATE ?auto_20380 ) ( AVAILABLE ?auto_20396 ) ( AVAILABLE ?auto_20402 ) ( SURFACE-AT ?auto_20380 ?auto_20410 ) ( ON ?auto_20380 ?auto_20414 ) ( CLEAR ?auto_20380 ) ( TRUCK-AT ?auto_20397 ?auto_20393 ) ( not ( = ?auto_20379 ?auto_20380 ) ) ( not ( = ?auto_20379 ?auto_20414 ) ) ( not ( = ?auto_20380 ?auto_20414 ) ) ( not ( = ?auto_20379 ?auto_20381 ) ) ( not ( = ?auto_20379 ?auto_20400 ) ) ( not ( = ?auto_20381 ?auto_20414 ) ) ( not ( = ?auto_20399 ?auto_20410 ) ) ( not ( = ?auto_20412 ?auto_20402 ) ) ( not ( = ?auto_20400 ?auto_20414 ) ) ( not ( = ?auto_20379 ?auto_20382 ) ) ( not ( = ?auto_20379 ?auto_20419 ) ) ( not ( = ?auto_20380 ?auto_20382 ) ) ( not ( = ?auto_20380 ?auto_20419 ) ) ( not ( = ?auto_20382 ?auto_20400 ) ) ( not ( = ?auto_20382 ?auto_20414 ) ) ( not ( = ?auto_20428 ?auto_20399 ) ) ( not ( = ?auto_20428 ?auto_20410 ) ) ( not ( = ?auto_20413 ?auto_20412 ) ) ( not ( = ?auto_20413 ?auto_20402 ) ) ( not ( = ?auto_20419 ?auto_20400 ) ) ( not ( = ?auto_20419 ?auto_20414 ) ) ( not ( = ?auto_20379 ?auto_20383 ) ) ( not ( = ?auto_20379 ?auto_20406 ) ) ( not ( = ?auto_20380 ?auto_20383 ) ) ( not ( = ?auto_20380 ?auto_20406 ) ) ( not ( = ?auto_20381 ?auto_20383 ) ) ( not ( = ?auto_20381 ?auto_20406 ) ) ( not ( = ?auto_20383 ?auto_20419 ) ) ( not ( = ?auto_20383 ?auto_20400 ) ) ( not ( = ?auto_20383 ?auto_20414 ) ) ( not ( = ?auto_20404 ?auto_20428 ) ) ( not ( = ?auto_20404 ?auto_20399 ) ) ( not ( = ?auto_20404 ?auto_20410 ) ) ( not ( = ?auto_20423 ?auto_20413 ) ) ( not ( = ?auto_20423 ?auto_20412 ) ) ( not ( = ?auto_20423 ?auto_20402 ) ) ( not ( = ?auto_20406 ?auto_20419 ) ) ( not ( = ?auto_20406 ?auto_20400 ) ) ( not ( = ?auto_20406 ?auto_20414 ) ) ( not ( = ?auto_20379 ?auto_20384 ) ) ( not ( = ?auto_20379 ?auto_20401 ) ) ( not ( = ?auto_20380 ?auto_20384 ) ) ( not ( = ?auto_20380 ?auto_20401 ) ) ( not ( = ?auto_20381 ?auto_20384 ) ) ( not ( = ?auto_20381 ?auto_20401 ) ) ( not ( = ?auto_20382 ?auto_20384 ) ) ( not ( = ?auto_20382 ?auto_20401 ) ) ( not ( = ?auto_20384 ?auto_20406 ) ) ( not ( = ?auto_20384 ?auto_20419 ) ) ( not ( = ?auto_20384 ?auto_20400 ) ) ( not ( = ?auto_20384 ?auto_20414 ) ) ( not ( = ?auto_20403 ?auto_20404 ) ) ( not ( = ?auto_20403 ?auto_20428 ) ) ( not ( = ?auto_20403 ?auto_20399 ) ) ( not ( = ?auto_20403 ?auto_20410 ) ) ( not ( = ?auto_20408 ?auto_20423 ) ) ( not ( = ?auto_20408 ?auto_20413 ) ) ( not ( = ?auto_20408 ?auto_20412 ) ) ( not ( = ?auto_20408 ?auto_20402 ) ) ( not ( = ?auto_20401 ?auto_20406 ) ) ( not ( = ?auto_20401 ?auto_20419 ) ) ( not ( = ?auto_20401 ?auto_20400 ) ) ( not ( = ?auto_20401 ?auto_20414 ) ) ( not ( = ?auto_20379 ?auto_20385 ) ) ( not ( = ?auto_20379 ?auto_20415 ) ) ( not ( = ?auto_20380 ?auto_20385 ) ) ( not ( = ?auto_20380 ?auto_20415 ) ) ( not ( = ?auto_20381 ?auto_20385 ) ) ( not ( = ?auto_20381 ?auto_20415 ) ) ( not ( = ?auto_20382 ?auto_20385 ) ) ( not ( = ?auto_20382 ?auto_20415 ) ) ( not ( = ?auto_20383 ?auto_20385 ) ) ( not ( = ?auto_20383 ?auto_20415 ) ) ( not ( = ?auto_20385 ?auto_20401 ) ) ( not ( = ?auto_20385 ?auto_20406 ) ) ( not ( = ?auto_20385 ?auto_20419 ) ) ( not ( = ?auto_20385 ?auto_20400 ) ) ( not ( = ?auto_20385 ?auto_20414 ) ) ( not ( = ?auto_20420 ?auto_20403 ) ) ( not ( = ?auto_20420 ?auto_20404 ) ) ( not ( = ?auto_20420 ?auto_20428 ) ) ( not ( = ?auto_20420 ?auto_20399 ) ) ( not ( = ?auto_20420 ?auto_20410 ) ) ( not ( = ?auto_20422 ?auto_20408 ) ) ( not ( = ?auto_20422 ?auto_20423 ) ) ( not ( = ?auto_20422 ?auto_20413 ) ) ( not ( = ?auto_20422 ?auto_20412 ) ) ( not ( = ?auto_20422 ?auto_20402 ) ) ( not ( = ?auto_20415 ?auto_20401 ) ) ( not ( = ?auto_20415 ?auto_20406 ) ) ( not ( = ?auto_20415 ?auto_20419 ) ) ( not ( = ?auto_20415 ?auto_20400 ) ) ( not ( = ?auto_20415 ?auto_20414 ) ) ( not ( = ?auto_20379 ?auto_20386 ) ) ( not ( = ?auto_20379 ?auto_20418 ) ) ( not ( = ?auto_20380 ?auto_20386 ) ) ( not ( = ?auto_20380 ?auto_20418 ) ) ( not ( = ?auto_20381 ?auto_20386 ) ) ( not ( = ?auto_20381 ?auto_20418 ) ) ( not ( = ?auto_20382 ?auto_20386 ) ) ( not ( = ?auto_20382 ?auto_20418 ) ) ( not ( = ?auto_20383 ?auto_20386 ) ) ( not ( = ?auto_20383 ?auto_20418 ) ) ( not ( = ?auto_20384 ?auto_20386 ) ) ( not ( = ?auto_20384 ?auto_20418 ) ) ( not ( = ?auto_20386 ?auto_20415 ) ) ( not ( = ?auto_20386 ?auto_20401 ) ) ( not ( = ?auto_20386 ?auto_20406 ) ) ( not ( = ?auto_20386 ?auto_20419 ) ) ( not ( = ?auto_20386 ?auto_20400 ) ) ( not ( = ?auto_20386 ?auto_20414 ) ) ( not ( = ?auto_20421 ?auto_20420 ) ) ( not ( = ?auto_20421 ?auto_20403 ) ) ( not ( = ?auto_20421 ?auto_20404 ) ) ( not ( = ?auto_20421 ?auto_20428 ) ) ( not ( = ?auto_20421 ?auto_20399 ) ) ( not ( = ?auto_20421 ?auto_20410 ) ) ( not ( = ?auto_20426 ?auto_20422 ) ) ( not ( = ?auto_20426 ?auto_20408 ) ) ( not ( = ?auto_20426 ?auto_20423 ) ) ( not ( = ?auto_20426 ?auto_20413 ) ) ( not ( = ?auto_20426 ?auto_20412 ) ) ( not ( = ?auto_20426 ?auto_20402 ) ) ( not ( = ?auto_20418 ?auto_20415 ) ) ( not ( = ?auto_20418 ?auto_20401 ) ) ( not ( = ?auto_20418 ?auto_20406 ) ) ( not ( = ?auto_20418 ?auto_20419 ) ) ( not ( = ?auto_20418 ?auto_20400 ) ) ( not ( = ?auto_20418 ?auto_20414 ) ) ( not ( = ?auto_20379 ?auto_20387 ) ) ( not ( = ?auto_20379 ?auto_20417 ) ) ( not ( = ?auto_20380 ?auto_20387 ) ) ( not ( = ?auto_20380 ?auto_20417 ) ) ( not ( = ?auto_20381 ?auto_20387 ) ) ( not ( = ?auto_20381 ?auto_20417 ) ) ( not ( = ?auto_20382 ?auto_20387 ) ) ( not ( = ?auto_20382 ?auto_20417 ) ) ( not ( = ?auto_20383 ?auto_20387 ) ) ( not ( = ?auto_20383 ?auto_20417 ) ) ( not ( = ?auto_20384 ?auto_20387 ) ) ( not ( = ?auto_20384 ?auto_20417 ) ) ( not ( = ?auto_20385 ?auto_20387 ) ) ( not ( = ?auto_20385 ?auto_20417 ) ) ( not ( = ?auto_20387 ?auto_20418 ) ) ( not ( = ?auto_20387 ?auto_20415 ) ) ( not ( = ?auto_20387 ?auto_20401 ) ) ( not ( = ?auto_20387 ?auto_20406 ) ) ( not ( = ?auto_20387 ?auto_20419 ) ) ( not ( = ?auto_20387 ?auto_20400 ) ) ( not ( = ?auto_20387 ?auto_20414 ) ) ( not ( = ?auto_20416 ?auto_20421 ) ) ( not ( = ?auto_20416 ?auto_20420 ) ) ( not ( = ?auto_20416 ?auto_20403 ) ) ( not ( = ?auto_20416 ?auto_20404 ) ) ( not ( = ?auto_20416 ?auto_20428 ) ) ( not ( = ?auto_20416 ?auto_20399 ) ) ( not ( = ?auto_20416 ?auto_20410 ) ) ( not ( = ?auto_20427 ?auto_20426 ) ) ( not ( = ?auto_20427 ?auto_20422 ) ) ( not ( = ?auto_20427 ?auto_20408 ) ) ( not ( = ?auto_20427 ?auto_20423 ) ) ( not ( = ?auto_20427 ?auto_20413 ) ) ( not ( = ?auto_20427 ?auto_20412 ) ) ( not ( = ?auto_20427 ?auto_20402 ) ) ( not ( = ?auto_20417 ?auto_20418 ) ) ( not ( = ?auto_20417 ?auto_20415 ) ) ( not ( = ?auto_20417 ?auto_20401 ) ) ( not ( = ?auto_20417 ?auto_20406 ) ) ( not ( = ?auto_20417 ?auto_20419 ) ) ( not ( = ?auto_20417 ?auto_20400 ) ) ( not ( = ?auto_20417 ?auto_20414 ) ) ( not ( = ?auto_20379 ?auto_20388 ) ) ( not ( = ?auto_20379 ?auto_20425 ) ) ( not ( = ?auto_20380 ?auto_20388 ) ) ( not ( = ?auto_20380 ?auto_20425 ) ) ( not ( = ?auto_20381 ?auto_20388 ) ) ( not ( = ?auto_20381 ?auto_20425 ) ) ( not ( = ?auto_20382 ?auto_20388 ) ) ( not ( = ?auto_20382 ?auto_20425 ) ) ( not ( = ?auto_20383 ?auto_20388 ) ) ( not ( = ?auto_20383 ?auto_20425 ) ) ( not ( = ?auto_20384 ?auto_20388 ) ) ( not ( = ?auto_20384 ?auto_20425 ) ) ( not ( = ?auto_20385 ?auto_20388 ) ) ( not ( = ?auto_20385 ?auto_20425 ) ) ( not ( = ?auto_20386 ?auto_20388 ) ) ( not ( = ?auto_20386 ?auto_20425 ) ) ( not ( = ?auto_20388 ?auto_20417 ) ) ( not ( = ?auto_20388 ?auto_20418 ) ) ( not ( = ?auto_20388 ?auto_20415 ) ) ( not ( = ?auto_20388 ?auto_20401 ) ) ( not ( = ?auto_20388 ?auto_20406 ) ) ( not ( = ?auto_20388 ?auto_20419 ) ) ( not ( = ?auto_20388 ?auto_20400 ) ) ( not ( = ?auto_20388 ?auto_20414 ) ) ( not ( = ?auto_20425 ?auto_20417 ) ) ( not ( = ?auto_20425 ?auto_20418 ) ) ( not ( = ?auto_20425 ?auto_20415 ) ) ( not ( = ?auto_20425 ?auto_20401 ) ) ( not ( = ?auto_20425 ?auto_20406 ) ) ( not ( = ?auto_20425 ?auto_20419 ) ) ( not ( = ?auto_20425 ?auto_20400 ) ) ( not ( = ?auto_20425 ?auto_20414 ) ) ( not ( = ?auto_20379 ?auto_20389 ) ) ( not ( = ?auto_20379 ?auto_20405 ) ) ( not ( = ?auto_20380 ?auto_20389 ) ) ( not ( = ?auto_20380 ?auto_20405 ) ) ( not ( = ?auto_20381 ?auto_20389 ) ) ( not ( = ?auto_20381 ?auto_20405 ) ) ( not ( = ?auto_20382 ?auto_20389 ) ) ( not ( = ?auto_20382 ?auto_20405 ) ) ( not ( = ?auto_20383 ?auto_20389 ) ) ( not ( = ?auto_20383 ?auto_20405 ) ) ( not ( = ?auto_20384 ?auto_20389 ) ) ( not ( = ?auto_20384 ?auto_20405 ) ) ( not ( = ?auto_20385 ?auto_20389 ) ) ( not ( = ?auto_20385 ?auto_20405 ) ) ( not ( = ?auto_20386 ?auto_20389 ) ) ( not ( = ?auto_20386 ?auto_20405 ) ) ( not ( = ?auto_20387 ?auto_20389 ) ) ( not ( = ?auto_20387 ?auto_20405 ) ) ( not ( = ?auto_20389 ?auto_20425 ) ) ( not ( = ?auto_20389 ?auto_20417 ) ) ( not ( = ?auto_20389 ?auto_20418 ) ) ( not ( = ?auto_20389 ?auto_20415 ) ) ( not ( = ?auto_20389 ?auto_20401 ) ) ( not ( = ?auto_20389 ?auto_20406 ) ) ( not ( = ?auto_20389 ?auto_20419 ) ) ( not ( = ?auto_20389 ?auto_20400 ) ) ( not ( = ?auto_20389 ?auto_20414 ) ) ( not ( = ?auto_20394 ?auto_20410 ) ) ( not ( = ?auto_20394 ?auto_20416 ) ) ( not ( = ?auto_20394 ?auto_20421 ) ) ( not ( = ?auto_20394 ?auto_20420 ) ) ( not ( = ?auto_20394 ?auto_20403 ) ) ( not ( = ?auto_20394 ?auto_20404 ) ) ( not ( = ?auto_20394 ?auto_20428 ) ) ( not ( = ?auto_20394 ?auto_20399 ) ) ( not ( = ?auto_20395 ?auto_20402 ) ) ( not ( = ?auto_20395 ?auto_20427 ) ) ( not ( = ?auto_20395 ?auto_20426 ) ) ( not ( = ?auto_20395 ?auto_20422 ) ) ( not ( = ?auto_20395 ?auto_20408 ) ) ( not ( = ?auto_20395 ?auto_20423 ) ) ( not ( = ?auto_20395 ?auto_20413 ) ) ( not ( = ?auto_20395 ?auto_20412 ) ) ( not ( = ?auto_20405 ?auto_20425 ) ) ( not ( = ?auto_20405 ?auto_20417 ) ) ( not ( = ?auto_20405 ?auto_20418 ) ) ( not ( = ?auto_20405 ?auto_20415 ) ) ( not ( = ?auto_20405 ?auto_20401 ) ) ( not ( = ?auto_20405 ?auto_20406 ) ) ( not ( = ?auto_20405 ?auto_20419 ) ) ( not ( = ?auto_20405 ?auto_20400 ) ) ( not ( = ?auto_20405 ?auto_20414 ) ) ( not ( = ?auto_20379 ?auto_20390 ) ) ( not ( = ?auto_20379 ?auto_20411 ) ) ( not ( = ?auto_20380 ?auto_20390 ) ) ( not ( = ?auto_20380 ?auto_20411 ) ) ( not ( = ?auto_20381 ?auto_20390 ) ) ( not ( = ?auto_20381 ?auto_20411 ) ) ( not ( = ?auto_20382 ?auto_20390 ) ) ( not ( = ?auto_20382 ?auto_20411 ) ) ( not ( = ?auto_20383 ?auto_20390 ) ) ( not ( = ?auto_20383 ?auto_20411 ) ) ( not ( = ?auto_20384 ?auto_20390 ) ) ( not ( = ?auto_20384 ?auto_20411 ) ) ( not ( = ?auto_20385 ?auto_20390 ) ) ( not ( = ?auto_20385 ?auto_20411 ) ) ( not ( = ?auto_20386 ?auto_20390 ) ) ( not ( = ?auto_20386 ?auto_20411 ) ) ( not ( = ?auto_20387 ?auto_20390 ) ) ( not ( = ?auto_20387 ?auto_20411 ) ) ( not ( = ?auto_20388 ?auto_20390 ) ) ( not ( = ?auto_20388 ?auto_20411 ) ) ( not ( = ?auto_20390 ?auto_20405 ) ) ( not ( = ?auto_20390 ?auto_20425 ) ) ( not ( = ?auto_20390 ?auto_20417 ) ) ( not ( = ?auto_20390 ?auto_20418 ) ) ( not ( = ?auto_20390 ?auto_20415 ) ) ( not ( = ?auto_20390 ?auto_20401 ) ) ( not ( = ?auto_20390 ?auto_20406 ) ) ( not ( = ?auto_20390 ?auto_20419 ) ) ( not ( = ?auto_20390 ?auto_20400 ) ) ( not ( = ?auto_20390 ?auto_20414 ) ) ( not ( = ?auto_20411 ?auto_20405 ) ) ( not ( = ?auto_20411 ?auto_20425 ) ) ( not ( = ?auto_20411 ?auto_20417 ) ) ( not ( = ?auto_20411 ?auto_20418 ) ) ( not ( = ?auto_20411 ?auto_20415 ) ) ( not ( = ?auto_20411 ?auto_20401 ) ) ( not ( = ?auto_20411 ?auto_20406 ) ) ( not ( = ?auto_20411 ?auto_20419 ) ) ( not ( = ?auto_20411 ?auto_20400 ) ) ( not ( = ?auto_20411 ?auto_20414 ) ) ( not ( = ?auto_20379 ?auto_20391 ) ) ( not ( = ?auto_20379 ?auto_20407 ) ) ( not ( = ?auto_20380 ?auto_20391 ) ) ( not ( = ?auto_20380 ?auto_20407 ) ) ( not ( = ?auto_20381 ?auto_20391 ) ) ( not ( = ?auto_20381 ?auto_20407 ) ) ( not ( = ?auto_20382 ?auto_20391 ) ) ( not ( = ?auto_20382 ?auto_20407 ) ) ( not ( = ?auto_20383 ?auto_20391 ) ) ( not ( = ?auto_20383 ?auto_20407 ) ) ( not ( = ?auto_20384 ?auto_20391 ) ) ( not ( = ?auto_20384 ?auto_20407 ) ) ( not ( = ?auto_20385 ?auto_20391 ) ) ( not ( = ?auto_20385 ?auto_20407 ) ) ( not ( = ?auto_20386 ?auto_20391 ) ) ( not ( = ?auto_20386 ?auto_20407 ) ) ( not ( = ?auto_20387 ?auto_20391 ) ) ( not ( = ?auto_20387 ?auto_20407 ) ) ( not ( = ?auto_20388 ?auto_20391 ) ) ( not ( = ?auto_20388 ?auto_20407 ) ) ( not ( = ?auto_20389 ?auto_20391 ) ) ( not ( = ?auto_20389 ?auto_20407 ) ) ( not ( = ?auto_20391 ?auto_20411 ) ) ( not ( = ?auto_20391 ?auto_20405 ) ) ( not ( = ?auto_20391 ?auto_20425 ) ) ( not ( = ?auto_20391 ?auto_20417 ) ) ( not ( = ?auto_20391 ?auto_20418 ) ) ( not ( = ?auto_20391 ?auto_20415 ) ) ( not ( = ?auto_20391 ?auto_20401 ) ) ( not ( = ?auto_20391 ?auto_20406 ) ) ( not ( = ?auto_20391 ?auto_20419 ) ) ( not ( = ?auto_20391 ?auto_20400 ) ) ( not ( = ?auto_20391 ?auto_20414 ) ) ( not ( = ?auto_20424 ?auto_20403 ) ) ( not ( = ?auto_20424 ?auto_20394 ) ) ( not ( = ?auto_20424 ?auto_20410 ) ) ( not ( = ?auto_20424 ?auto_20416 ) ) ( not ( = ?auto_20424 ?auto_20421 ) ) ( not ( = ?auto_20424 ?auto_20420 ) ) ( not ( = ?auto_20424 ?auto_20404 ) ) ( not ( = ?auto_20424 ?auto_20428 ) ) ( not ( = ?auto_20424 ?auto_20399 ) ) ( not ( = ?auto_20409 ?auto_20408 ) ) ( not ( = ?auto_20409 ?auto_20395 ) ) ( not ( = ?auto_20409 ?auto_20402 ) ) ( not ( = ?auto_20409 ?auto_20427 ) ) ( not ( = ?auto_20409 ?auto_20426 ) ) ( not ( = ?auto_20409 ?auto_20422 ) ) ( not ( = ?auto_20409 ?auto_20423 ) ) ( not ( = ?auto_20409 ?auto_20413 ) ) ( not ( = ?auto_20409 ?auto_20412 ) ) ( not ( = ?auto_20407 ?auto_20411 ) ) ( not ( = ?auto_20407 ?auto_20405 ) ) ( not ( = ?auto_20407 ?auto_20425 ) ) ( not ( = ?auto_20407 ?auto_20417 ) ) ( not ( = ?auto_20407 ?auto_20418 ) ) ( not ( = ?auto_20407 ?auto_20415 ) ) ( not ( = ?auto_20407 ?auto_20401 ) ) ( not ( = ?auto_20407 ?auto_20406 ) ) ( not ( = ?auto_20407 ?auto_20419 ) ) ( not ( = ?auto_20407 ?auto_20400 ) ) ( not ( = ?auto_20407 ?auto_20414 ) ) ( not ( = ?auto_20379 ?auto_20392 ) ) ( not ( = ?auto_20379 ?auto_20398 ) ) ( not ( = ?auto_20380 ?auto_20392 ) ) ( not ( = ?auto_20380 ?auto_20398 ) ) ( not ( = ?auto_20381 ?auto_20392 ) ) ( not ( = ?auto_20381 ?auto_20398 ) ) ( not ( = ?auto_20382 ?auto_20392 ) ) ( not ( = ?auto_20382 ?auto_20398 ) ) ( not ( = ?auto_20383 ?auto_20392 ) ) ( not ( = ?auto_20383 ?auto_20398 ) ) ( not ( = ?auto_20384 ?auto_20392 ) ) ( not ( = ?auto_20384 ?auto_20398 ) ) ( not ( = ?auto_20385 ?auto_20392 ) ) ( not ( = ?auto_20385 ?auto_20398 ) ) ( not ( = ?auto_20386 ?auto_20392 ) ) ( not ( = ?auto_20386 ?auto_20398 ) ) ( not ( = ?auto_20387 ?auto_20392 ) ) ( not ( = ?auto_20387 ?auto_20398 ) ) ( not ( = ?auto_20388 ?auto_20392 ) ) ( not ( = ?auto_20388 ?auto_20398 ) ) ( not ( = ?auto_20389 ?auto_20392 ) ) ( not ( = ?auto_20389 ?auto_20398 ) ) ( not ( = ?auto_20390 ?auto_20392 ) ) ( not ( = ?auto_20390 ?auto_20398 ) ) ( not ( = ?auto_20392 ?auto_20407 ) ) ( not ( = ?auto_20392 ?auto_20411 ) ) ( not ( = ?auto_20392 ?auto_20405 ) ) ( not ( = ?auto_20392 ?auto_20425 ) ) ( not ( = ?auto_20392 ?auto_20417 ) ) ( not ( = ?auto_20392 ?auto_20418 ) ) ( not ( = ?auto_20392 ?auto_20415 ) ) ( not ( = ?auto_20392 ?auto_20401 ) ) ( not ( = ?auto_20392 ?auto_20406 ) ) ( not ( = ?auto_20392 ?auto_20419 ) ) ( not ( = ?auto_20392 ?auto_20400 ) ) ( not ( = ?auto_20392 ?auto_20414 ) ) ( not ( = ?auto_20398 ?auto_20407 ) ) ( not ( = ?auto_20398 ?auto_20411 ) ) ( not ( = ?auto_20398 ?auto_20405 ) ) ( not ( = ?auto_20398 ?auto_20425 ) ) ( not ( = ?auto_20398 ?auto_20417 ) ) ( not ( = ?auto_20398 ?auto_20418 ) ) ( not ( = ?auto_20398 ?auto_20415 ) ) ( not ( = ?auto_20398 ?auto_20401 ) ) ( not ( = ?auto_20398 ?auto_20406 ) ) ( not ( = ?auto_20398 ?auto_20419 ) ) ( not ( = ?auto_20398 ?auto_20400 ) ) ( not ( = ?auto_20398 ?auto_20414 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_20379 ?auto_20380 ?auto_20381 ?auto_20382 ?auto_20383 ?auto_20384 ?auto_20385 ?auto_20386 ?auto_20387 ?auto_20388 ?auto_20389 ?auto_20390 ?auto_20391 )
      ( MAKE-1CRATE ?auto_20391 ?auto_20392 )
      ( MAKE-13CRATE-VERIFY ?auto_20379 ?auto_20380 ?auto_20381 ?auto_20382 ?auto_20383 ?auto_20384 ?auto_20385 ?auto_20386 ?auto_20387 ?auto_20388 ?auto_20389 ?auto_20390 ?auto_20391 ?auto_20392 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_20454 - SURFACE
      ?auto_20455 - SURFACE
      ?auto_20456 - SURFACE
      ?auto_20457 - SURFACE
      ?auto_20458 - SURFACE
      ?auto_20459 - SURFACE
      ?auto_20460 - SURFACE
      ?auto_20461 - SURFACE
      ?auto_20462 - SURFACE
      ?auto_20463 - SURFACE
      ?auto_20464 - SURFACE
      ?auto_20465 - SURFACE
      ?auto_20466 - SURFACE
      ?auto_20467 - SURFACE
      ?auto_20468 - SURFACE
    )
    :vars
    (
      ?auto_20472 - HOIST
      ?auto_20471 - PLACE
      ?auto_20473 - PLACE
      ?auto_20474 - HOIST
      ?auto_20469 - SURFACE
      ?auto_20499 - PLACE
      ?auto_20505 - HOIST
      ?auto_20476 - SURFACE
      ?auto_20477 - PLACE
      ?auto_20504 - HOIST
      ?auto_20481 - SURFACE
      ?auto_20494 - PLACE
      ?auto_20485 - HOIST
      ?auto_20502 - SURFACE
      ?auto_20490 - SURFACE
      ?auto_20482 - PLACE
      ?auto_20493 - HOIST
      ?auto_20483 - SURFACE
      ?auto_20487 - PLACE
      ?auto_20484 - HOIST
      ?auto_20478 - SURFACE
      ?auto_20491 - PLACE
      ?auto_20507 - HOIST
      ?auto_20489 - SURFACE
      ?auto_20500 - PLACE
      ?auto_20488 - HOIST
      ?auto_20501 - SURFACE
      ?auto_20480 - SURFACE
      ?auto_20496 - PLACE
      ?auto_20498 - HOIST
      ?auto_20475 - SURFACE
      ?auto_20479 - PLACE
      ?auto_20492 - HOIST
      ?auto_20497 - SURFACE
      ?auto_20486 - PLACE
      ?auto_20506 - HOIST
      ?auto_20495 - SURFACE
      ?auto_20503 - SURFACE
      ?auto_20470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20472 ?auto_20471 ) ( IS-CRATE ?auto_20468 ) ( not ( = ?auto_20473 ?auto_20471 ) ) ( HOIST-AT ?auto_20474 ?auto_20473 ) ( AVAILABLE ?auto_20474 ) ( SURFACE-AT ?auto_20468 ?auto_20473 ) ( ON ?auto_20468 ?auto_20469 ) ( CLEAR ?auto_20468 ) ( not ( = ?auto_20467 ?auto_20468 ) ) ( not ( = ?auto_20467 ?auto_20469 ) ) ( not ( = ?auto_20468 ?auto_20469 ) ) ( not ( = ?auto_20472 ?auto_20474 ) ) ( IS-CRATE ?auto_20467 ) ( not ( = ?auto_20499 ?auto_20471 ) ) ( HOIST-AT ?auto_20505 ?auto_20499 ) ( SURFACE-AT ?auto_20467 ?auto_20499 ) ( ON ?auto_20467 ?auto_20476 ) ( CLEAR ?auto_20467 ) ( not ( = ?auto_20466 ?auto_20467 ) ) ( not ( = ?auto_20466 ?auto_20476 ) ) ( not ( = ?auto_20467 ?auto_20476 ) ) ( not ( = ?auto_20472 ?auto_20505 ) ) ( IS-CRATE ?auto_20466 ) ( not ( = ?auto_20477 ?auto_20471 ) ) ( HOIST-AT ?auto_20504 ?auto_20477 ) ( AVAILABLE ?auto_20504 ) ( SURFACE-AT ?auto_20466 ?auto_20477 ) ( ON ?auto_20466 ?auto_20481 ) ( CLEAR ?auto_20466 ) ( not ( = ?auto_20465 ?auto_20466 ) ) ( not ( = ?auto_20465 ?auto_20481 ) ) ( not ( = ?auto_20466 ?auto_20481 ) ) ( not ( = ?auto_20472 ?auto_20504 ) ) ( IS-CRATE ?auto_20465 ) ( not ( = ?auto_20494 ?auto_20471 ) ) ( HOIST-AT ?auto_20485 ?auto_20494 ) ( SURFACE-AT ?auto_20465 ?auto_20494 ) ( ON ?auto_20465 ?auto_20502 ) ( CLEAR ?auto_20465 ) ( not ( = ?auto_20464 ?auto_20465 ) ) ( not ( = ?auto_20464 ?auto_20502 ) ) ( not ( = ?auto_20465 ?auto_20502 ) ) ( not ( = ?auto_20472 ?auto_20485 ) ) ( IS-CRATE ?auto_20464 ) ( AVAILABLE ?auto_20505 ) ( SURFACE-AT ?auto_20464 ?auto_20499 ) ( ON ?auto_20464 ?auto_20490 ) ( CLEAR ?auto_20464 ) ( not ( = ?auto_20463 ?auto_20464 ) ) ( not ( = ?auto_20463 ?auto_20490 ) ) ( not ( = ?auto_20464 ?auto_20490 ) ) ( IS-CRATE ?auto_20463 ) ( not ( = ?auto_20482 ?auto_20471 ) ) ( HOIST-AT ?auto_20493 ?auto_20482 ) ( SURFACE-AT ?auto_20463 ?auto_20482 ) ( ON ?auto_20463 ?auto_20483 ) ( CLEAR ?auto_20463 ) ( not ( = ?auto_20462 ?auto_20463 ) ) ( not ( = ?auto_20462 ?auto_20483 ) ) ( not ( = ?auto_20463 ?auto_20483 ) ) ( not ( = ?auto_20472 ?auto_20493 ) ) ( IS-CRATE ?auto_20462 ) ( not ( = ?auto_20487 ?auto_20471 ) ) ( HOIST-AT ?auto_20484 ?auto_20487 ) ( AVAILABLE ?auto_20484 ) ( SURFACE-AT ?auto_20462 ?auto_20487 ) ( ON ?auto_20462 ?auto_20478 ) ( CLEAR ?auto_20462 ) ( not ( = ?auto_20461 ?auto_20462 ) ) ( not ( = ?auto_20461 ?auto_20478 ) ) ( not ( = ?auto_20462 ?auto_20478 ) ) ( not ( = ?auto_20472 ?auto_20484 ) ) ( IS-CRATE ?auto_20461 ) ( not ( = ?auto_20491 ?auto_20471 ) ) ( HOIST-AT ?auto_20507 ?auto_20491 ) ( AVAILABLE ?auto_20507 ) ( SURFACE-AT ?auto_20461 ?auto_20491 ) ( ON ?auto_20461 ?auto_20489 ) ( CLEAR ?auto_20461 ) ( not ( = ?auto_20460 ?auto_20461 ) ) ( not ( = ?auto_20460 ?auto_20489 ) ) ( not ( = ?auto_20461 ?auto_20489 ) ) ( not ( = ?auto_20472 ?auto_20507 ) ) ( IS-CRATE ?auto_20460 ) ( not ( = ?auto_20500 ?auto_20471 ) ) ( HOIST-AT ?auto_20488 ?auto_20500 ) ( AVAILABLE ?auto_20488 ) ( SURFACE-AT ?auto_20460 ?auto_20500 ) ( ON ?auto_20460 ?auto_20501 ) ( CLEAR ?auto_20460 ) ( not ( = ?auto_20459 ?auto_20460 ) ) ( not ( = ?auto_20459 ?auto_20501 ) ) ( not ( = ?auto_20460 ?auto_20501 ) ) ( not ( = ?auto_20472 ?auto_20488 ) ) ( IS-CRATE ?auto_20459 ) ( AVAILABLE ?auto_20485 ) ( SURFACE-AT ?auto_20459 ?auto_20494 ) ( ON ?auto_20459 ?auto_20480 ) ( CLEAR ?auto_20459 ) ( not ( = ?auto_20458 ?auto_20459 ) ) ( not ( = ?auto_20458 ?auto_20480 ) ) ( not ( = ?auto_20459 ?auto_20480 ) ) ( IS-CRATE ?auto_20458 ) ( not ( = ?auto_20496 ?auto_20471 ) ) ( HOIST-AT ?auto_20498 ?auto_20496 ) ( AVAILABLE ?auto_20498 ) ( SURFACE-AT ?auto_20458 ?auto_20496 ) ( ON ?auto_20458 ?auto_20475 ) ( CLEAR ?auto_20458 ) ( not ( = ?auto_20457 ?auto_20458 ) ) ( not ( = ?auto_20457 ?auto_20475 ) ) ( not ( = ?auto_20458 ?auto_20475 ) ) ( not ( = ?auto_20472 ?auto_20498 ) ) ( IS-CRATE ?auto_20457 ) ( not ( = ?auto_20479 ?auto_20471 ) ) ( HOIST-AT ?auto_20492 ?auto_20479 ) ( AVAILABLE ?auto_20492 ) ( SURFACE-AT ?auto_20457 ?auto_20479 ) ( ON ?auto_20457 ?auto_20497 ) ( CLEAR ?auto_20457 ) ( not ( = ?auto_20456 ?auto_20457 ) ) ( not ( = ?auto_20456 ?auto_20497 ) ) ( not ( = ?auto_20457 ?auto_20497 ) ) ( not ( = ?auto_20472 ?auto_20492 ) ) ( IS-CRATE ?auto_20456 ) ( not ( = ?auto_20486 ?auto_20471 ) ) ( HOIST-AT ?auto_20506 ?auto_20486 ) ( AVAILABLE ?auto_20506 ) ( SURFACE-AT ?auto_20456 ?auto_20486 ) ( ON ?auto_20456 ?auto_20495 ) ( CLEAR ?auto_20456 ) ( not ( = ?auto_20455 ?auto_20456 ) ) ( not ( = ?auto_20455 ?auto_20495 ) ) ( not ( = ?auto_20456 ?auto_20495 ) ) ( not ( = ?auto_20472 ?auto_20506 ) ) ( SURFACE-AT ?auto_20454 ?auto_20471 ) ( CLEAR ?auto_20454 ) ( IS-CRATE ?auto_20455 ) ( AVAILABLE ?auto_20472 ) ( AVAILABLE ?auto_20493 ) ( SURFACE-AT ?auto_20455 ?auto_20482 ) ( ON ?auto_20455 ?auto_20503 ) ( CLEAR ?auto_20455 ) ( TRUCK-AT ?auto_20470 ?auto_20471 ) ( not ( = ?auto_20454 ?auto_20455 ) ) ( not ( = ?auto_20454 ?auto_20503 ) ) ( not ( = ?auto_20455 ?auto_20503 ) ) ( not ( = ?auto_20454 ?auto_20456 ) ) ( not ( = ?auto_20454 ?auto_20495 ) ) ( not ( = ?auto_20456 ?auto_20503 ) ) ( not ( = ?auto_20486 ?auto_20482 ) ) ( not ( = ?auto_20506 ?auto_20493 ) ) ( not ( = ?auto_20495 ?auto_20503 ) ) ( not ( = ?auto_20454 ?auto_20457 ) ) ( not ( = ?auto_20454 ?auto_20497 ) ) ( not ( = ?auto_20455 ?auto_20457 ) ) ( not ( = ?auto_20455 ?auto_20497 ) ) ( not ( = ?auto_20457 ?auto_20495 ) ) ( not ( = ?auto_20457 ?auto_20503 ) ) ( not ( = ?auto_20479 ?auto_20486 ) ) ( not ( = ?auto_20479 ?auto_20482 ) ) ( not ( = ?auto_20492 ?auto_20506 ) ) ( not ( = ?auto_20492 ?auto_20493 ) ) ( not ( = ?auto_20497 ?auto_20495 ) ) ( not ( = ?auto_20497 ?auto_20503 ) ) ( not ( = ?auto_20454 ?auto_20458 ) ) ( not ( = ?auto_20454 ?auto_20475 ) ) ( not ( = ?auto_20455 ?auto_20458 ) ) ( not ( = ?auto_20455 ?auto_20475 ) ) ( not ( = ?auto_20456 ?auto_20458 ) ) ( not ( = ?auto_20456 ?auto_20475 ) ) ( not ( = ?auto_20458 ?auto_20497 ) ) ( not ( = ?auto_20458 ?auto_20495 ) ) ( not ( = ?auto_20458 ?auto_20503 ) ) ( not ( = ?auto_20496 ?auto_20479 ) ) ( not ( = ?auto_20496 ?auto_20486 ) ) ( not ( = ?auto_20496 ?auto_20482 ) ) ( not ( = ?auto_20498 ?auto_20492 ) ) ( not ( = ?auto_20498 ?auto_20506 ) ) ( not ( = ?auto_20498 ?auto_20493 ) ) ( not ( = ?auto_20475 ?auto_20497 ) ) ( not ( = ?auto_20475 ?auto_20495 ) ) ( not ( = ?auto_20475 ?auto_20503 ) ) ( not ( = ?auto_20454 ?auto_20459 ) ) ( not ( = ?auto_20454 ?auto_20480 ) ) ( not ( = ?auto_20455 ?auto_20459 ) ) ( not ( = ?auto_20455 ?auto_20480 ) ) ( not ( = ?auto_20456 ?auto_20459 ) ) ( not ( = ?auto_20456 ?auto_20480 ) ) ( not ( = ?auto_20457 ?auto_20459 ) ) ( not ( = ?auto_20457 ?auto_20480 ) ) ( not ( = ?auto_20459 ?auto_20475 ) ) ( not ( = ?auto_20459 ?auto_20497 ) ) ( not ( = ?auto_20459 ?auto_20495 ) ) ( not ( = ?auto_20459 ?auto_20503 ) ) ( not ( = ?auto_20494 ?auto_20496 ) ) ( not ( = ?auto_20494 ?auto_20479 ) ) ( not ( = ?auto_20494 ?auto_20486 ) ) ( not ( = ?auto_20494 ?auto_20482 ) ) ( not ( = ?auto_20485 ?auto_20498 ) ) ( not ( = ?auto_20485 ?auto_20492 ) ) ( not ( = ?auto_20485 ?auto_20506 ) ) ( not ( = ?auto_20485 ?auto_20493 ) ) ( not ( = ?auto_20480 ?auto_20475 ) ) ( not ( = ?auto_20480 ?auto_20497 ) ) ( not ( = ?auto_20480 ?auto_20495 ) ) ( not ( = ?auto_20480 ?auto_20503 ) ) ( not ( = ?auto_20454 ?auto_20460 ) ) ( not ( = ?auto_20454 ?auto_20501 ) ) ( not ( = ?auto_20455 ?auto_20460 ) ) ( not ( = ?auto_20455 ?auto_20501 ) ) ( not ( = ?auto_20456 ?auto_20460 ) ) ( not ( = ?auto_20456 ?auto_20501 ) ) ( not ( = ?auto_20457 ?auto_20460 ) ) ( not ( = ?auto_20457 ?auto_20501 ) ) ( not ( = ?auto_20458 ?auto_20460 ) ) ( not ( = ?auto_20458 ?auto_20501 ) ) ( not ( = ?auto_20460 ?auto_20480 ) ) ( not ( = ?auto_20460 ?auto_20475 ) ) ( not ( = ?auto_20460 ?auto_20497 ) ) ( not ( = ?auto_20460 ?auto_20495 ) ) ( not ( = ?auto_20460 ?auto_20503 ) ) ( not ( = ?auto_20500 ?auto_20494 ) ) ( not ( = ?auto_20500 ?auto_20496 ) ) ( not ( = ?auto_20500 ?auto_20479 ) ) ( not ( = ?auto_20500 ?auto_20486 ) ) ( not ( = ?auto_20500 ?auto_20482 ) ) ( not ( = ?auto_20488 ?auto_20485 ) ) ( not ( = ?auto_20488 ?auto_20498 ) ) ( not ( = ?auto_20488 ?auto_20492 ) ) ( not ( = ?auto_20488 ?auto_20506 ) ) ( not ( = ?auto_20488 ?auto_20493 ) ) ( not ( = ?auto_20501 ?auto_20480 ) ) ( not ( = ?auto_20501 ?auto_20475 ) ) ( not ( = ?auto_20501 ?auto_20497 ) ) ( not ( = ?auto_20501 ?auto_20495 ) ) ( not ( = ?auto_20501 ?auto_20503 ) ) ( not ( = ?auto_20454 ?auto_20461 ) ) ( not ( = ?auto_20454 ?auto_20489 ) ) ( not ( = ?auto_20455 ?auto_20461 ) ) ( not ( = ?auto_20455 ?auto_20489 ) ) ( not ( = ?auto_20456 ?auto_20461 ) ) ( not ( = ?auto_20456 ?auto_20489 ) ) ( not ( = ?auto_20457 ?auto_20461 ) ) ( not ( = ?auto_20457 ?auto_20489 ) ) ( not ( = ?auto_20458 ?auto_20461 ) ) ( not ( = ?auto_20458 ?auto_20489 ) ) ( not ( = ?auto_20459 ?auto_20461 ) ) ( not ( = ?auto_20459 ?auto_20489 ) ) ( not ( = ?auto_20461 ?auto_20501 ) ) ( not ( = ?auto_20461 ?auto_20480 ) ) ( not ( = ?auto_20461 ?auto_20475 ) ) ( not ( = ?auto_20461 ?auto_20497 ) ) ( not ( = ?auto_20461 ?auto_20495 ) ) ( not ( = ?auto_20461 ?auto_20503 ) ) ( not ( = ?auto_20491 ?auto_20500 ) ) ( not ( = ?auto_20491 ?auto_20494 ) ) ( not ( = ?auto_20491 ?auto_20496 ) ) ( not ( = ?auto_20491 ?auto_20479 ) ) ( not ( = ?auto_20491 ?auto_20486 ) ) ( not ( = ?auto_20491 ?auto_20482 ) ) ( not ( = ?auto_20507 ?auto_20488 ) ) ( not ( = ?auto_20507 ?auto_20485 ) ) ( not ( = ?auto_20507 ?auto_20498 ) ) ( not ( = ?auto_20507 ?auto_20492 ) ) ( not ( = ?auto_20507 ?auto_20506 ) ) ( not ( = ?auto_20507 ?auto_20493 ) ) ( not ( = ?auto_20489 ?auto_20501 ) ) ( not ( = ?auto_20489 ?auto_20480 ) ) ( not ( = ?auto_20489 ?auto_20475 ) ) ( not ( = ?auto_20489 ?auto_20497 ) ) ( not ( = ?auto_20489 ?auto_20495 ) ) ( not ( = ?auto_20489 ?auto_20503 ) ) ( not ( = ?auto_20454 ?auto_20462 ) ) ( not ( = ?auto_20454 ?auto_20478 ) ) ( not ( = ?auto_20455 ?auto_20462 ) ) ( not ( = ?auto_20455 ?auto_20478 ) ) ( not ( = ?auto_20456 ?auto_20462 ) ) ( not ( = ?auto_20456 ?auto_20478 ) ) ( not ( = ?auto_20457 ?auto_20462 ) ) ( not ( = ?auto_20457 ?auto_20478 ) ) ( not ( = ?auto_20458 ?auto_20462 ) ) ( not ( = ?auto_20458 ?auto_20478 ) ) ( not ( = ?auto_20459 ?auto_20462 ) ) ( not ( = ?auto_20459 ?auto_20478 ) ) ( not ( = ?auto_20460 ?auto_20462 ) ) ( not ( = ?auto_20460 ?auto_20478 ) ) ( not ( = ?auto_20462 ?auto_20489 ) ) ( not ( = ?auto_20462 ?auto_20501 ) ) ( not ( = ?auto_20462 ?auto_20480 ) ) ( not ( = ?auto_20462 ?auto_20475 ) ) ( not ( = ?auto_20462 ?auto_20497 ) ) ( not ( = ?auto_20462 ?auto_20495 ) ) ( not ( = ?auto_20462 ?auto_20503 ) ) ( not ( = ?auto_20487 ?auto_20491 ) ) ( not ( = ?auto_20487 ?auto_20500 ) ) ( not ( = ?auto_20487 ?auto_20494 ) ) ( not ( = ?auto_20487 ?auto_20496 ) ) ( not ( = ?auto_20487 ?auto_20479 ) ) ( not ( = ?auto_20487 ?auto_20486 ) ) ( not ( = ?auto_20487 ?auto_20482 ) ) ( not ( = ?auto_20484 ?auto_20507 ) ) ( not ( = ?auto_20484 ?auto_20488 ) ) ( not ( = ?auto_20484 ?auto_20485 ) ) ( not ( = ?auto_20484 ?auto_20498 ) ) ( not ( = ?auto_20484 ?auto_20492 ) ) ( not ( = ?auto_20484 ?auto_20506 ) ) ( not ( = ?auto_20484 ?auto_20493 ) ) ( not ( = ?auto_20478 ?auto_20489 ) ) ( not ( = ?auto_20478 ?auto_20501 ) ) ( not ( = ?auto_20478 ?auto_20480 ) ) ( not ( = ?auto_20478 ?auto_20475 ) ) ( not ( = ?auto_20478 ?auto_20497 ) ) ( not ( = ?auto_20478 ?auto_20495 ) ) ( not ( = ?auto_20478 ?auto_20503 ) ) ( not ( = ?auto_20454 ?auto_20463 ) ) ( not ( = ?auto_20454 ?auto_20483 ) ) ( not ( = ?auto_20455 ?auto_20463 ) ) ( not ( = ?auto_20455 ?auto_20483 ) ) ( not ( = ?auto_20456 ?auto_20463 ) ) ( not ( = ?auto_20456 ?auto_20483 ) ) ( not ( = ?auto_20457 ?auto_20463 ) ) ( not ( = ?auto_20457 ?auto_20483 ) ) ( not ( = ?auto_20458 ?auto_20463 ) ) ( not ( = ?auto_20458 ?auto_20483 ) ) ( not ( = ?auto_20459 ?auto_20463 ) ) ( not ( = ?auto_20459 ?auto_20483 ) ) ( not ( = ?auto_20460 ?auto_20463 ) ) ( not ( = ?auto_20460 ?auto_20483 ) ) ( not ( = ?auto_20461 ?auto_20463 ) ) ( not ( = ?auto_20461 ?auto_20483 ) ) ( not ( = ?auto_20463 ?auto_20478 ) ) ( not ( = ?auto_20463 ?auto_20489 ) ) ( not ( = ?auto_20463 ?auto_20501 ) ) ( not ( = ?auto_20463 ?auto_20480 ) ) ( not ( = ?auto_20463 ?auto_20475 ) ) ( not ( = ?auto_20463 ?auto_20497 ) ) ( not ( = ?auto_20463 ?auto_20495 ) ) ( not ( = ?auto_20463 ?auto_20503 ) ) ( not ( = ?auto_20483 ?auto_20478 ) ) ( not ( = ?auto_20483 ?auto_20489 ) ) ( not ( = ?auto_20483 ?auto_20501 ) ) ( not ( = ?auto_20483 ?auto_20480 ) ) ( not ( = ?auto_20483 ?auto_20475 ) ) ( not ( = ?auto_20483 ?auto_20497 ) ) ( not ( = ?auto_20483 ?auto_20495 ) ) ( not ( = ?auto_20483 ?auto_20503 ) ) ( not ( = ?auto_20454 ?auto_20464 ) ) ( not ( = ?auto_20454 ?auto_20490 ) ) ( not ( = ?auto_20455 ?auto_20464 ) ) ( not ( = ?auto_20455 ?auto_20490 ) ) ( not ( = ?auto_20456 ?auto_20464 ) ) ( not ( = ?auto_20456 ?auto_20490 ) ) ( not ( = ?auto_20457 ?auto_20464 ) ) ( not ( = ?auto_20457 ?auto_20490 ) ) ( not ( = ?auto_20458 ?auto_20464 ) ) ( not ( = ?auto_20458 ?auto_20490 ) ) ( not ( = ?auto_20459 ?auto_20464 ) ) ( not ( = ?auto_20459 ?auto_20490 ) ) ( not ( = ?auto_20460 ?auto_20464 ) ) ( not ( = ?auto_20460 ?auto_20490 ) ) ( not ( = ?auto_20461 ?auto_20464 ) ) ( not ( = ?auto_20461 ?auto_20490 ) ) ( not ( = ?auto_20462 ?auto_20464 ) ) ( not ( = ?auto_20462 ?auto_20490 ) ) ( not ( = ?auto_20464 ?auto_20483 ) ) ( not ( = ?auto_20464 ?auto_20478 ) ) ( not ( = ?auto_20464 ?auto_20489 ) ) ( not ( = ?auto_20464 ?auto_20501 ) ) ( not ( = ?auto_20464 ?auto_20480 ) ) ( not ( = ?auto_20464 ?auto_20475 ) ) ( not ( = ?auto_20464 ?auto_20497 ) ) ( not ( = ?auto_20464 ?auto_20495 ) ) ( not ( = ?auto_20464 ?auto_20503 ) ) ( not ( = ?auto_20499 ?auto_20482 ) ) ( not ( = ?auto_20499 ?auto_20487 ) ) ( not ( = ?auto_20499 ?auto_20491 ) ) ( not ( = ?auto_20499 ?auto_20500 ) ) ( not ( = ?auto_20499 ?auto_20494 ) ) ( not ( = ?auto_20499 ?auto_20496 ) ) ( not ( = ?auto_20499 ?auto_20479 ) ) ( not ( = ?auto_20499 ?auto_20486 ) ) ( not ( = ?auto_20505 ?auto_20493 ) ) ( not ( = ?auto_20505 ?auto_20484 ) ) ( not ( = ?auto_20505 ?auto_20507 ) ) ( not ( = ?auto_20505 ?auto_20488 ) ) ( not ( = ?auto_20505 ?auto_20485 ) ) ( not ( = ?auto_20505 ?auto_20498 ) ) ( not ( = ?auto_20505 ?auto_20492 ) ) ( not ( = ?auto_20505 ?auto_20506 ) ) ( not ( = ?auto_20490 ?auto_20483 ) ) ( not ( = ?auto_20490 ?auto_20478 ) ) ( not ( = ?auto_20490 ?auto_20489 ) ) ( not ( = ?auto_20490 ?auto_20501 ) ) ( not ( = ?auto_20490 ?auto_20480 ) ) ( not ( = ?auto_20490 ?auto_20475 ) ) ( not ( = ?auto_20490 ?auto_20497 ) ) ( not ( = ?auto_20490 ?auto_20495 ) ) ( not ( = ?auto_20490 ?auto_20503 ) ) ( not ( = ?auto_20454 ?auto_20465 ) ) ( not ( = ?auto_20454 ?auto_20502 ) ) ( not ( = ?auto_20455 ?auto_20465 ) ) ( not ( = ?auto_20455 ?auto_20502 ) ) ( not ( = ?auto_20456 ?auto_20465 ) ) ( not ( = ?auto_20456 ?auto_20502 ) ) ( not ( = ?auto_20457 ?auto_20465 ) ) ( not ( = ?auto_20457 ?auto_20502 ) ) ( not ( = ?auto_20458 ?auto_20465 ) ) ( not ( = ?auto_20458 ?auto_20502 ) ) ( not ( = ?auto_20459 ?auto_20465 ) ) ( not ( = ?auto_20459 ?auto_20502 ) ) ( not ( = ?auto_20460 ?auto_20465 ) ) ( not ( = ?auto_20460 ?auto_20502 ) ) ( not ( = ?auto_20461 ?auto_20465 ) ) ( not ( = ?auto_20461 ?auto_20502 ) ) ( not ( = ?auto_20462 ?auto_20465 ) ) ( not ( = ?auto_20462 ?auto_20502 ) ) ( not ( = ?auto_20463 ?auto_20465 ) ) ( not ( = ?auto_20463 ?auto_20502 ) ) ( not ( = ?auto_20465 ?auto_20490 ) ) ( not ( = ?auto_20465 ?auto_20483 ) ) ( not ( = ?auto_20465 ?auto_20478 ) ) ( not ( = ?auto_20465 ?auto_20489 ) ) ( not ( = ?auto_20465 ?auto_20501 ) ) ( not ( = ?auto_20465 ?auto_20480 ) ) ( not ( = ?auto_20465 ?auto_20475 ) ) ( not ( = ?auto_20465 ?auto_20497 ) ) ( not ( = ?auto_20465 ?auto_20495 ) ) ( not ( = ?auto_20465 ?auto_20503 ) ) ( not ( = ?auto_20502 ?auto_20490 ) ) ( not ( = ?auto_20502 ?auto_20483 ) ) ( not ( = ?auto_20502 ?auto_20478 ) ) ( not ( = ?auto_20502 ?auto_20489 ) ) ( not ( = ?auto_20502 ?auto_20501 ) ) ( not ( = ?auto_20502 ?auto_20480 ) ) ( not ( = ?auto_20502 ?auto_20475 ) ) ( not ( = ?auto_20502 ?auto_20497 ) ) ( not ( = ?auto_20502 ?auto_20495 ) ) ( not ( = ?auto_20502 ?auto_20503 ) ) ( not ( = ?auto_20454 ?auto_20466 ) ) ( not ( = ?auto_20454 ?auto_20481 ) ) ( not ( = ?auto_20455 ?auto_20466 ) ) ( not ( = ?auto_20455 ?auto_20481 ) ) ( not ( = ?auto_20456 ?auto_20466 ) ) ( not ( = ?auto_20456 ?auto_20481 ) ) ( not ( = ?auto_20457 ?auto_20466 ) ) ( not ( = ?auto_20457 ?auto_20481 ) ) ( not ( = ?auto_20458 ?auto_20466 ) ) ( not ( = ?auto_20458 ?auto_20481 ) ) ( not ( = ?auto_20459 ?auto_20466 ) ) ( not ( = ?auto_20459 ?auto_20481 ) ) ( not ( = ?auto_20460 ?auto_20466 ) ) ( not ( = ?auto_20460 ?auto_20481 ) ) ( not ( = ?auto_20461 ?auto_20466 ) ) ( not ( = ?auto_20461 ?auto_20481 ) ) ( not ( = ?auto_20462 ?auto_20466 ) ) ( not ( = ?auto_20462 ?auto_20481 ) ) ( not ( = ?auto_20463 ?auto_20466 ) ) ( not ( = ?auto_20463 ?auto_20481 ) ) ( not ( = ?auto_20464 ?auto_20466 ) ) ( not ( = ?auto_20464 ?auto_20481 ) ) ( not ( = ?auto_20466 ?auto_20502 ) ) ( not ( = ?auto_20466 ?auto_20490 ) ) ( not ( = ?auto_20466 ?auto_20483 ) ) ( not ( = ?auto_20466 ?auto_20478 ) ) ( not ( = ?auto_20466 ?auto_20489 ) ) ( not ( = ?auto_20466 ?auto_20501 ) ) ( not ( = ?auto_20466 ?auto_20480 ) ) ( not ( = ?auto_20466 ?auto_20475 ) ) ( not ( = ?auto_20466 ?auto_20497 ) ) ( not ( = ?auto_20466 ?auto_20495 ) ) ( not ( = ?auto_20466 ?auto_20503 ) ) ( not ( = ?auto_20477 ?auto_20494 ) ) ( not ( = ?auto_20477 ?auto_20499 ) ) ( not ( = ?auto_20477 ?auto_20482 ) ) ( not ( = ?auto_20477 ?auto_20487 ) ) ( not ( = ?auto_20477 ?auto_20491 ) ) ( not ( = ?auto_20477 ?auto_20500 ) ) ( not ( = ?auto_20477 ?auto_20496 ) ) ( not ( = ?auto_20477 ?auto_20479 ) ) ( not ( = ?auto_20477 ?auto_20486 ) ) ( not ( = ?auto_20504 ?auto_20485 ) ) ( not ( = ?auto_20504 ?auto_20505 ) ) ( not ( = ?auto_20504 ?auto_20493 ) ) ( not ( = ?auto_20504 ?auto_20484 ) ) ( not ( = ?auto_20504 ?auto_20507 ) ) ( not ( = ?auto_20504 ?auto_20488 ) ) ( not ( = ?auto_20504 ?auto_20498 ) ) ( not ( = ?auto_20504 ?auto_20492 ) ) ( not ( = ?auto_20504 ?auto_20506 ) ) ( not ( = ?auto_20481 ?auto_20502 ) ) ( not ( = ?auto_20481 ?auto_20490 ) ) ( not ( = ?auto_20481 ?auto_20483 ) ) ( not ( = ?auto_20481 ?auto_20478 ) ) ( not ( = ?auto_20481 ?auto_20489 ) ) ( not ( = ?auto_20481 ?auto_20501 ) ) ( not ( = ?auto_20481 ?auto_20480 ) ) ( not ( = ?auto_20481 ?auto_20475 ) ) ( not ( = ?auto_20481 ?auto_20497 ) ) ( not ( = ?auto_20481 ?auto_20495 ) ) ( not ( = ?auto_20481 ?auto_20503 ) ) ( not ( = ?auto_20454 ?auto_20467 ) ) ( not ( = ?auto_20454 ?auto_20476 ) ) ( not ( = ?auto_20455 ?auto_20467 ) ) ( not ( = ?auto_20455 ?auto_20476 ) ) ( not ( = ?auto_20456 ?auto_20467 ) ) ( not ( = ?auto_20456 ?auto_20476 ) ) ( not ( = ?auto_20457 ?auto_20467 ) ) ( not ( = ?auto_20457 ?auto_20476 ) ) ( not ( = ?auto_20458 ?auto_20467 ) ) ( not ( = ?auto_20458 ?auto_20476 ) ) ( not ( = ?auto_20459 ?auto_20467 ) ) ( not ( = ?auto_20459 ?auto_20476 ) ) ( not ( = ?auto_20460 ?auto_20467 ) ) ( not ( = ?auto_20460 ?auto_20476 ) ) ( not ( = ?auto_20461 ?auto_20467 ) ) ( not ( = ?auto_20461 ?auto_20476 ) ) ( not ( = ?auto_20462 ?auto_20467 ) ) ( not ( = ?auto_20462 ?auto_20476 ) ) ( not ( = ?auto_20463 ?auto_20467 ) ) ( not ( = ?auto_20463 ?auto_20476 ) ) ( not ( = ?auto_20464 ?auto_20467 ) ) ( not ( = ?auto_20464 ?auto_20476 ) ) ( not ( = ?auto_20465 ?auto_20467 ) ) ( not ( = ?auto_20465 ?auto_20476 ) ) ( not ( = ?auto_20467 ?auto_20481 ) ) ( not ( = ?auto_20467 ?auto_20502 ) ) ( not ( = ?auto_20467 ?auto_20490 ) ) ( not ( = ?auto_20467 ?auto_20483 ) ) ( not ( = ?auto_20467 ?auto_20478 ) ) ( not ( = ?auto_20467 ?auto_20489 ) ) ( not ( = ?auto_20467 ?auto_20501 ) ) ( not ( = ?auto_20467 ?auto_20480 ) ) ( not ( = ?auto_20467 ?auto_20475 ) ) ( not ( = ?auto_20467 ?auto_20497 ) ) ( not ( = ?auto_20467 ?auto_20495 ) ) ( not ( = ?auto_20467 ?auto_20503 ) ) ( not ( = ?auto_20476 ?auto_20481 ) ) ( not ( = ?auto_20476 ?auto_20502 ) ) ( not ( = ?auto_20476 ?auto_20490 ) ) ( not ( = ?auto_20476 ?auto_20483 ) ) ( not ( = ?auto_20476 ?auto_20478 ) ) ( not ( = ?auto_20476 ?auto_20489 ) ) ( not ( = ?auto_20476 ?auto_20501 ) ) ( not ( = ?auto_20476 ?auto_20480 ) ) ( not ( = ?auto_20476 ?auto_20475 ) ) ( not ( = ?auto_20476 ?auto_20497 ) ) ( not ( = ?auto_20476 ?auto_20495 ) ) ( not ( = ?auto_20476 ?auto_20503 ) ) ( not ( = ?auto_20454 ?auto_20468 ) ) ( not ( = ?auto_20454 ?auto_20469 ) ) ( not ( = ?auto_20455 ?auto_20468 ) ) ( not ( = ?auto_20455 ?auto_20469 ) ) ( not ( = ?auto_20456 ?auto_20468 ) ) ( not ( = ?auto_20456 ?auto_20469 ) ) ( not ( = ?auto_20457 ?auto_20468 ) ) ( not ( = ?auto_20457 ?auto_20469 ) ) ( not ( = ?auto_20458 ?auto_20468 ) ) ( not ( = ?auto_20458 ?auto_20469 ) ) ( not ( = ?auto_20459 ?auto_20468 ) ) ( not ( = ?auto_20459 ?auto_20469 ) ) ( not ( = ?auto_20460 ?auto_20468 ) ) ( not ( = ?auto_20460 ?auto_20469 ) ) ( not ( = ?auto_20461 ?auto_20468 ) ) ( not ( = ?auto_20461 ?auto_20469 ) ) ( not ( = ?auto_20462 ?auto_20468 ) ) ( not ( = ?auto_20462 ?auto_20469 ) ) ( not ( = ?auto_20463 ?auto_20468 ) ) ( not ( = ?auto_20463 ?auto_20469 ) ) ( not ( = ?auto_20464 ?auto_20468 ) ) ( not ( = ?auto_20464 ?auto_20469 ) ) ( not ( = ?auto_20465 ?auto_20468 ) ) ( not ( = ?auto_20465 ?auto_20469 ) ) ( not ( = ?auto_20466 ?auto_20468 ) ) ( not ( = ?auto_20466 ?auto_20469 ) ) ( not ( = ?auto_20468 ?auto_20476 ) ) ( not ( = ?auto_20468 ?auto_20481 ) ) ( not ( = ?auto_20468 ?auto_20502 ) ) ( not ( = ?auto_20468 ?auto_20490 ) ) ( not ( = ?auto_20468 ?auto_20483 ) ) ( not ( = ?auto_20468 ?auto_20478 ) ) ( not ( = ?auto_20468 ?auto_20489 ) ) ( not ( = ?auto_20468 ?auto_20501 ) ) ( not ( = ?auto_20468 ?auto_20480 ) ) ( not ( = ?auto_20468 ?auto_20475 ) ) ( not ( = ?auto_20468 ?auto_20497 ) ) ( not ( = ?auto_20468 ?auto_20495 ) ) ( not ( = ?auto_20468 ?auto_20503 ) ) ( not ( = ?auto_20473 ?auto_20499 ) ) ( not ( = ?auto_20473 ?auto_20477 ) ) ( not ( = ?auto_20473 ?auto_20494 ) ) ( not ( = ?auto_20473 ?auto_20482 ) ) ( not ( = ?auto_20473 ?auto_20487 ) ) ( not ( = ?auto_20473 ?auto_20491 ) ) ( not ( = ?auto_20473 ?auto_20500 ) ) ( not ( = ?auto_20473 ?auto_20496 ) ) ( not ( = ?auto_20473 ?auto_20479 ) ) ( not ( = ?auto_20473 ?auto_20486 ) ) ( not ( = ?auto_20474 ?auto_20505 ) ) ( not ( = ?auto_20474 ?auto_20504 ) ) ( not ( = ?auto_20474 ?auto_20485 ) ) ( not ( = ?auto_20474 ?auto_20493 ) ) ( not ( = ?auto_20474 ?auto_20484 ) ) ( not ( = ?auto_20474 ?auto_20507 ) ) ( not ( = ?auto_20474 ?auto_20488 ) ) ( not ( = ?auto_20474 ?auto_20498 ) ) ( not ( = ?auto_20474 ?auto_20492 ) ) ( not ( = ?auto_20474 ?auto_20506 ) ) ( not ( = ?auto_20469 ?auto_20476 ) ) ( not ( = ?auto_20469 ?auto_20481 ) ) ( not ( = ?auto_20469 ?auto_20502 ) ) ( not ( = ?auto_20469 ?auto_20490 ) ) ( not ( = ?auto_20469 ?auto_20483 ) ) ( not ( = ?auto_20469 ?auto_20478 ) ) ( not ( = ?auto_20469 ?auto_20489 ) ) ( not ( = ?auto_20469 ?auto_20501 ) ) ( not ( = ?auto_20469 ?auto_20480 ) ) ( not ( = ?auto_20469 ?auto_20475 ) ) ( not ( = ?auto_20469 ?auto_20497 ) ) ( not ( = ?auto_20469 ?auto_20495 ) ) ( not ( = ?auto_20469 ?auto_20503 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_20454 ?auto_20455 ?auto_20456 ?auto_20457 ?auto_20458 ?auto_20459 ?auto_20460 ?auto_20461 ?auto_20462 ?auto_20463 ?auto_20464 ?auto_20465 ?auto_20466 ?auto_20467 )
      ( MAKE-1CRATE ?auto_20467 ?auto_20468 )
      ( MAKE-14CRATE-VERIFY ?auto_20454 ?auto_20455 ?auto_20456 ?auto_20457 ?auto_20458 ?auto_20459 ?auto_20460 ?auto_20461 ?auto_20462 ?auto_20463 ?auto_20464 ?auto_20465 ?auto_20466 ?auto_20467 ?auto_20468 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_20534 - SURFACE
      ?auto_20535 - SURFACE
      ?auto_20536 - SURFACE
      ?auto_20537 - SURFACE
      ?auto_20538 - SURFACE
      ?auto_20539 - SURFACE
      ?auto_20540 - SURFACE
      ?auto_20541 - SURFACE
      ?auto_20542 - SURFACE
      ?auto_20543 - SURFACE
      ?auto_20544 - SURFACE
      ?auto_20545 - SURFACE
      ?auto_20546 - SURFACE
      ?auto_20547 - SURFACE
      ?auto_20548 - SURFACE
      ?auto_20549 - SURFACE
    )
    :vars
    (
      ?auto_20554 - HOIST
      ?auto_20552 - PLACE
      ?auto_20550 - PLACE
      ?auto_20553 - HOIST
      ?auto_20555 - SURFACE
      ?auto_20557 - PLACE
      ?auto_20584 - HOIST
      ?auto_20569 - SURFACE
      ?auto_20561 - PLACE
      ?auto_20564 - HOIST
      ?auto_20562 - SURFACE
      ?auto_20571 - PLACE
      ?auto_20565 - HOIST
      ?auto_20573 - SURFACE
      ?auto_20567 - PLACE
      ?auto_20563 - HOIST
      ?auto_20575 - SURFACE
      ?auto_20586 - SURFACE
      ?auto_20566 - PLACE
      ?auto_20560 - HOIST
      ?auto_20574 - SURFACE
      ?auto_20580 - PLACE
      ?auto_20585 - HOIST
      ?auto_20587 - SURFACE
      ?auto_20582 - PLACE
      ?auto_20578 - HOIST
      ?auto_20588 - SURFACE
      ?auto_20583 - PLACE
      ?auto_20576 - HOIST
      ?auto_20581 - SURFACE
      ?auto_20579 - SURFACE
      ?auto_20558 - PLACE
      ?auto_20568 - HOIST
      ?auto_20556 - SURFACE
      ?auto_20559 - PLACE
      ?auto_20577 - HOIST
      ?auto_20590 - SURFACE
      ?auto_20570 - PLACE
      ?auto_20572 - HOIST
      ?auto_20591 - SURFACE
      ?auto_20589 - SURFACE
      ?auto_20551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20554 ?auto_20552 ) ( IS-CRATE ?auto_20549 ) ( not ( = ?auto_20550 ?auto_20552 ) ) ( HOIST-AT ?auto_20553 ?auto_20550 ) ( AVAILABLE ?auto_20553 ) ( SURFACE-AT ?auto_20549 ?auto_20550 ) ( ON ?auto_20549 ?auto_20555 ) ( CLEAR ?auto_20549 ) ( not ( = ?auto_20548 ?auto_20549 ) ) ( not ( = ?auto_20548 ?auto_20555 ) ) ( not ( = ?auto_20549 ?auto_20555 ) ) ( not ( = ?auto_20554 ?auto_20553 ) ) ( IS-CRATE ?auto_20548 ) ( not ( = ?auto_20557 ?auto_20552 ) ) ( HOIST-AT ?auto_20584 ?auto_20557 ) ( AVAILABLE ?auto_20584 ) ( SURFACE-AT ?auto_20548 ?auto_20557 ) ( ON ?auto_20548 ?auto_20569 ) ( CLEAR ?auto_20548 ) ( not ( = ?auto_20547 ?auto_20548 ) ) ( not ( = ?auto_20547 ?auto_20569 ) ) ( not ( = ?auto_20548 ?auto_20569 ) ) ( not ( = ?auto_20554 ?auto_20584 ) ) ( IS-CRATE ?auto_20547 ) ( not ( = ?auto_20561 ?auto_20552 ) ) ( HOIST-AT ?auto_20564 ?auto_20561 ) ( SURFACE-AT ?auto_20547 ?auto_20561 ) ( ON ?auto_20547 ?auto_20562 ) ( CLEAR ?auto_20547 ) ( not ( = ?auto_20546 ?auto_20547 ) ) ( not ( = ?auto_20546 ?auto_20562 ) ) ( not ( = ?auto_20547 ?auto_20562 ) ) ( not ( = ?auto_20554 ?auto_20564 ) ) ( IS-CRATE ?auto_20546 ) ( not ( = ?auto_20571 ?auto_20552 ) ) ( HOIST-AT ?auto_20565 ?auto_20571 ) ( AVAILABLE ?auto_20565 ) ( SURFACE-AT ?auto_20546 ?auto_20571 ) ( ON ?auto_20546 ?auto_20573 ) ( CLEAR ?auto_20546 ) ( not ( = ?auto_20545 ?auto_20546 ) ) ( not ( = ?auto_20545 ?auto_20573 ) ) ( not ( = ?auto_20546 ?auto_20573 ) ) ( not ( = ?auto_20554 ?auto_20565 ) ) ( IS-CRATE ?auto_20545 ) ( not ( = ?auto_20567 ?auto_20552 ) ) ( HOIST-AT ?auto_20563 ?auto_20567 ) ( SURFACE-AT ?auto_20545 ?auto_20567 ) ( ON ?auto_20545 ?auto_20575 ) ( CLEAR ?auto_20545 ) ( not ( = ?auto_20544 ?auto_20545 ) ) ( not ( = ?auto_20544 ?auto_20575 ) ) ( not ( = ?auto_20545 ?auto_20575 ) ) ( not ( = ?auto_20554 ?auto_20563 ) ) ( IS-CRATE ?auto_20544 ) ( AVAILABLE ?auto_20564 ) ( SURFACE-AT ?auto_20544 ?auto_20561 ) ( ON ?auto_20544 ?auto_20586 ) ( CLEAR ?auto_20544 ) ( not ( = ?auto_20543 ?auto_20544 ) ) ( not ( = ?auto_20543 ?auto_20586 ) ) ( not ( = ?auto_20544 ?auto_20586 ) ) ( IS-CRATE ?auto_20543 ) ( not ( = ?auto_20566 ?auto_20552 ) ) ( HOIST-AT ?auto_20560 ?auto_20566 ) ( SURFACE-AT ?auto_20543 ?auto_20566 ) ( ON ?auto_20543 ?auto_20574 ) ( CLEAR ?auto_20543 ) ( not ( = ?auto_20542 ?auto_20543 ) ) ( not ( = ?auto_20542 ?auto_20574 ) ) ( not ( = ?auto_20543 ?auto_20574 ) ) ( not ( = ?auto_20554 ?auto_20560 ) ) ( IS-CRATE ?auto_20542 ) ( not ( = ?auto_20580 ?auto_20552 ) ) ( HOIST-AT ?auto_20585 ?auto_20580 ) ( AVAILABLE ?auto_20585 ) ( SURFACE-AT ?auto_20542 ?auto_20580 ) ( ON ?auto_20542 ?auto_20587 ) ( CLEAR ?auto_20542 ) ( not ( = ?auto_20541 ?auto_20542 ) ) ( not ( = ?auto_20541 ?auto_20587 ) ) ( not ( = ?auto_20542 ?auto_20587 ) ) ( not ( = ?auto_20554 ?auto_20585 ) ) ( IS-CRATE ?auto_20541 ) ( not ( = ?auto_20582 ?auto_20552 ) ) ( HOIST-AT ?auto_20578 ?auto_20582 ) ( AVAILABLE ?auto_20578 ) ( SURFACE-AT ?auto_20541 ?auto_20582 ) ( ON ?auto_20541 ?auto_20588 ) ( CLEAR ?auto_20541 ) ( not ( = ?auto_20540 ?auto_20541 ) ) ( not ( = ?auto_20540 ?auto_20588 ) ) ( not ( = ?auto_20541 ?auto_20588 ) ) ( not ( = ?auto_20554 ?auto_20578 ) ) ( IS-CRATE ?auto_20540 ) ( not ( = ?auto_20583 ?auto_20552 ) ) ( HOIST-AT ?auto_20576 ?auto_20583 ) ( AVAILABLE ?auto_20576 ) ( SURFACE-AT ?auto_20540 ?auto_20583 ) ( ON ?auto_20540 ?auto_20581 ) ( CLEAR ?auto_20540 ) ( not ( = ?auto_20539 ?auto_20540 ) ) ( not ( = ?auto_20539 ?auto_20581 ) ) ( not ( = ?auto_20540 ?auto_20581 ) ) ( not ( = ?auto_20554 ?auto_20576 ) ) ( IS-CRATE ?auto_20539 ) ( AVAILABLE ?auto_20563 ) ( SURFACE-AT ?auto_20539 ?auto_20567 ) ( ON ?auto_20539 ?auto_20579 ) ( CLEAR ?auto_20539 ) ( not ( = ?auto_20538 ?auto_20539 ) ) ( not ( = ?auto_20538 ?auto_20579 ) ) ( not ( = ?auto_20539 ?auto_20579 ) ) ( IS-CRATE ?auto_20538 ) ( not ( = ?auto_20558 ?auto_20552 ) ) ( HOIST-AT ?auto_20568 ?auto_20558 ) ( AVAILABLE ?auto_20568 ) ( SURFACE-AT ?auto_20538 ?auto_20558 ) ( ON ?auto_20538 ?auto_20556 ) ( CLEAR ?auto_20538 ) ( not ( = ?auto_20537 ?auto_20538 ) ) ( not ( = ?auto_20537 ?auto_20556 ) ) ( not ( = ?auto_20538 ?auto_20556 ) ) ( not ( = ?auto_20554 ?auto_20568 ) ) ( IS-CRATE ?auto_20537 ) ( not ( = ?auto_20559 ?auto_20552 ) ) ( HOIST-AT ?auto_20577 ?auto_20559 ) ( AVAILABLE ?auto_20577 ) ( SURFACE-AT ?auto_20537 ?auto_20559 ) ( ON ?auto_20537 ?auto_20590 ) ( CLEAR ?auto_20537 ) ( not ( = ?auto_20536 ?auto_20537 ) ) ( not ( = ?auto_20536 ?auto_20590 ) ) ( not ( = ?auto_20537 ?auto_20590 ) ) ( not ( = ?auto_20554 ?auto_20577 ) ) ( IS-CRATE ?auto_20536 ) ( not ( = ?auto_20570 ?auto_20552 ) ) ( HOIST-AT ?auto_20572 ?auto_20570 ) ( AVAILABLE ?auto_20572 ) ( SURFACE-AT ?auto_20536 ?auto_20570 ) ( ON ?auto_20536 ?auto_20591 ) ( CLEAR ?auto_20536 ) ( not ( = ?auto_20535 ?auto_20536 ) ) ( not ( = ?auto_20535 ?auto_20591 ) ) ( not ( = ?auto_20536 ?auto_20591 ) ) ( not ( = ?auto_20554 ?auto_20572 ) ) ( SURFACE-AT ?auto_20534 ?auto_20552 ) ( CLEAR ?auto_20534 ) ( IS-CRATE ?auto_20535 ) ( AVAILABLE ?auto_20554 ) ( AVAILABLE ?auto_20560 ) ( SURFACE-AT ?auto_20535 ?auto_20566 ) ( ON ?auto_20535 ?auto_20589 ) ( CLEAR ?auto_20535 ) ( TRUCK-AT ?auto_20551 ?auto_20552 ) ( not ( = ?auto_20534 ?auto_20535 ) ) ( not ( = ?auto_20534 ?auto_20589 ) ) ( not ( = ?auto_20535 ?auto_20589 ) ) ( not ( = ?auto_20534 ?auto_20536 ) ) ( not ( = ?auto_20534 ?auto_20591 ) ) ( not ( = ?auto_20536 ?auto_20589 ) ) ( not ( = ?auto_20570 ?auto_20566 ) ) ( not ( = ?auto_20572 ?auto_20560 ) ) ( not ( = ?auto_20591 ?auto_20589 ) ) ( not ( = ?auto_20534 ?auto_20537 ) ) ( not ( = ?auto_20534 ?auto_20590 ) ) ( not ( = ?auto_20535 ?auto_20537 ) ) ( not ( = ?auto_20535 ?auto_20590 ) ) ( not ( = ?auto_20537 ?auto_20591 ) ) ( not ( = ?auto_20537 ?auto_20589 ) ) ( not ( = ?auto_20559 ?auto_20570 ) ) ( not ( = ?auto_20559 ?auto_20566 ) ) ( not ( = ?auto_20577 ?auto_20572 ) ) ( not ( = ?auto_20577 ?auto_20560 ) ) ( not ( = ?auto_20590 ?auto_20591 ) ) ( not ( = ?auto_20590 ?auto_20589 ) ) ( not ( = ?auto_20534 ?auto_20538 ) ) ( not ( = ?auto_20534 ?auto_20556 ) ) ( not ( = ?auto_20535 ?auto_20538 ) ) ( not ( = ?auto_20535 ?auto_20556 ) ) ( not ( = ?auto_20536 ?auto_20538 ) ) ( not ( = ?auto_20536 ?auto_20556 ) ) ( not ( = ?auto_20538 ?auto_20590 ) ) ( not ( = ?auto_20538 ?auto_20591 ) ) ( not ( = ?auto_20538 ?auto_20589 ) ) ( not ( = ?auto_20558 ?auto_20559 ) ) ( not ( = ?auto_20558 ?auto_20570 ) ) ( not ( = ?auto_20558 ?auto_20566 ) ) ( not ( = ?auto_20568 ?auto_20577 ) ) ( not ( = ?auto_20568 ?auto_20572 ) ) ( not ( = ?auto_20568 ?auto_20560 ) ) ( not ( = ?auto_20556 ?auto_20590 ) ) ( not ( = ?auto_20556 ?auto_20591 ) ) ( not ( = ?auto_20556 ?auto_20589 ) ) ( not ( = ?auto_20534 ?auto_20539 ) ) ( not ( = ?auto_20534 ?auto_20579 ) ) ( not ( = ?auto_20535 ?auto_20539 ) ) ( not ( = ?auto_20535 ?auto_20579 ) ) ( not ( = ?auto_20536 ?auto_20539 ) ) ( not ( = ?auto_20536 ?auto_20579 ) ) ( not ( = ?auto_20537 ?auto_20539 ) ) ( not ( = ?auto_20537 ?auto_20579 ) ) ( not ( = ?auto_20539 ?auto_20556 ) ) ( not ( = ?auto_20539 ?auto_20590 ) ) ( not ( = ?auto_20539 ?auto_20591 ) ) ( not ( = ?auto_20539 ?auto_20589 ) ) ( not ( = ?auto_20567 ?auto_20558 ) ) ( not ( = ?auto_20567 ?auto_20559 ) ) ( not ( = ?auto_20567 ?auto_20570 ) ) ( not ( = ?auto_20567 ?auto_20566 ) ) ( not ( = ?auto_20563 ?auto_20568 ) ) ( not ( = ?auto_20563 ?auto_20577 ) ) ( not ( = ?auto_20563 ?auto_20572 ) ) ( not ( = ?auto_20563 ?auto_20560 ) ) ( not ( = ?auto_20579 ?auto_20556 ) ) ( not ( = ?auto_20579 ?auto_20590 ) ) ( not ( = ?auto_20579 ?auto_20591 ) ) ( not ( = ?auto_20579 ?auto_20589 ) ) ( not ( = ?auto_20534 ?auto_20540 ) ) ( not ( = ?auto_20534 ?auto_20581 ) ) ( not ( = ?auto_20535 ?auto_20540 ) ) ( not ( = ?auto_20535 ?auto_20581 ) ) ( not ( = ?auto_20536 ?auto_20540 ) ) ( not ( = ?auto_20536 ?auto_20581 ) ) ( not ( = ?auto_20537 ?auto_20540 ) ) ( not ( = ?auto_20537 ?auto_20581 ) ) ( not ( = ?auto_20538 ?auto_20540 ) ) ( not ( = ?auto_20538 ?auto_20581 ) ) ( not ( = ?auto_20540 ?auto_20579 ) ) ( not ( = ?auto_20540 ?auto_20556 ) ) ( not ( = ?auto_20540 ?auto_20590 ) ) ( not ( = ?auto_20540 ?auto_20591 ) ) ( not ( = ?auto_20540 ?auto_20589 ) ) ( not ( = ?auto_20583 ?auto_20567 ) ) ( not ( = ?auto_20583 ?auto_20558 ) ) ( not ( = ?auto_20583 ?auto_20559 ) ) ( not ( = ?auto_20583 ?auto_20570 ) ) ( not ( = ?auto_20583 ?auto_20566 ) ) ( not ( = ?auto_20576 ?auto_20563 ) ) ( not ( = ?auto_20576 ?auto_20568 ) ) ( not ( = ?auto_20576 ?auto_20577 ) ) ( not ( = ?auto_20576 ?auto_20572 ) ) ( not ( = ?auto_20576 ?auto_20560 ) ) ( not ( = ?auto_20581 ?auto_20579 ) ) ( not ( = ?auto_20581 ?auto_20556 ) ) ( not ( = ?auto_20581 ?auto_20590 ) ) ( not ( = ?auto_20581 ?auto_20591 ) ) ( not ( = ?auto_20581 ?auto_20589 ) ) ( not ( = ?auto_20534 ?auto_20541 ) ) ( not ( = ?auto_20534 ?auto_20588 ) ) ( not ( = ?auto_20535 ?auto_20541 ) ) ( not ( = ?auto_20535 ?auto_20588 ) ) ( not ( = ?auto_20536 ?auto_20541 ) ) ( not ( = ?auto_20536 ?auto_20588 ) ) ( not ( = ?auto_20537 ?auto_20541 ) ) ( not ( = ?auto_20537 ?auto_20588 ) ) ( not ( = ?auto_20538 ?auto_20541 ) ) ( not ( = ?auto_20538 ?auto_20588 ) ) ( not ( = ?auto_20539 ?auto_20541 ) ) ( not ( = ?auto_20539 ?auto_20588 ) ) ( not ( = ?auto_20541 ?auto_20581 ) ) ( not ( = ?auto_20541 ?auto_20579 ) ) ( not ( = ?auto_20541 ?auto_20556 ) ) ( not ( = ?auto_20541 ?auto_20590 ) ) ( not ( = ?auto_20541 ?auto_20591 ) ) ( not ( = ?auto_20541 ?auto_20589 ) ) ( not ( = ?auto_20582 ?auto_20583 ) ) ( not ( = ?auto_20582 ?auto_20567 ) ) ( not ( = ?auto_20582 ?auto_20558 ) ) ( not ( = ?auto_20582 ?auto_20559 ) ) ( not ( = ?auto_20582 ?auto_20570 ) ) ( not ( = ?auto_20582 ?auto_20566 ) ) ( not ( = ?auto_20578 ?auto_20576 ) ) ( not ( = ?auto_20578 ?auto_20563 ) ) ( not ( = ?auto_20578 ?auto_20568 ) ) ( not ( = ?auto_20578 ?auto_20577 ) ) ( not ( = ?auto_20578 ?auto_20572 ) ) ( not ( = ?auto_20578 ?auto_20560 ) ) ( not ( = ?auto_20588 ?auto_20581 ) ) ( not ( = ?auto_20588 ?auto_20579 ) ) ( not ( = ?auto_20588 ?auto_20556 ) ) ( not ( = ?auto_20588 ?auto_20590 ) ) ( not ( = ?auto_20588 ?auto_20591 ) ) ( not ( = ?auto_20588 ?auto_20589 ) ) ( not ( = ?auto_20534 ?auto_20542 ) ) ( not ( = ?auto_20534 ?auto_20587 ) ) ( not ( = ?auto_20535 ?auto_20542 ) ) ( not ( = ?auto_20535 ?auto_20587 ) ) ( not ( = ?auto_20536 ?auto_20542 ) ) ( not ( = ?auto_20536 ?auto_20587 ) ) ( not ( = ?auto_20537 ?auto_20542 ) ) ( not ( = ?auto_20537 ?auto_20587 ) ) ( not ( = ?auto_20538 ?auto_20542 ) ) ( not ( = ?auto_20538 ?auto_20587 ) ) ( not ( = ?auto_20539 ?auto_20542 ) ) ( not ( = ?auto_20539 ?auto_20587 ) ) ( not ( = ?auto_20540 ?auto_20542 ) ) ( not ( = ?auto_20540 ?auto_20587 ) ) ( not ( = ?auto_20542 ?auto_20588 ) ) ( not ( = ?auto_20542 ?auto_20581 ) ) ( not ( = ?auto_20542 ?auto_20579 ) ) ( not ( = ?auto_20542 ?auto_20556 ) ) ( not ( = ?auto_20542 ?auto_20590 ) ) ( not ( = ?auto_20542 ?auto_20591 ) ) ( not ( = ?auto_20542 ?auto_20589 ) ) ( not ( = ?auto_20580 ?auto_20582 ) ) ( not ( = ?auto_20580 ?auto_20583 ) ) ( not ( = ?auto_20580 ?auto_20567 ) ) ( not ( = ?auto_20580 ?auto_20558 ) ) ( not ( = ?auto_20580 ?auto_20559 ) ) ( not ( = ?auto_20580 ?auto_20570 ) ) ( not ( = ?auto_20580 ?auto_20566 ) ) ( not ( = ?auto_20585 ?auto_20578 ) ) ( not ( = ?auto_20585 ?auto_20576 ) ) ( not ( = ?auto_20585 ?auto_20563 ) ) ( not ( = ?auto_20585 ?auto_20568 ) ) ( not ( = ?auto_20585 ?auto_20577 ) ) ( not ( = ?auto_20585 ?auto_20572 ) ) ( not ( = ?auto_20585 ?auto_20560 ) ) ( not ( = ?auto_20587 ?auto_20588 ) ) ( not ( = ?auto_20587 ?auto_20581 ) ) ( not ( = ?auto_20587 ?auto_20579 ) ) ( not ( = ?auto_20587 ?auto_20556 ) ) ( not ( = ?auto_20587 ?auto_20590 ) ) ( not ( = ?auto_20587 ?auto_20591 ) ) ( not ( = ?auto_20587 ?auto_20589 ) ) ( not ( = ?auto_20534 ?auto_20543 ) ) ( not ( = ?auto_20534 ?auto_20574 ) ) ( not ( = ?auto_20535 ?auto_20543 ) ) ( not ( = ?auto_20535 ?auto_20574 ) ) ( not ( = ?auto_20536 ?auto_20543 ) ) ( not ( = ?auto_20536 ?auto_20574 ) ) ( not ( = ?auto_20537 ?auto_20543 ) ) ( not ( = ?auto_20537 ?auto_20574 ) ) ( not ( = ?auto_20538 ?auto_20543 ) ) ( not ( = ?auto_20538 ?auto_20574 ) ) ( not ( = ?auto_20539 ?auto_20543 ) ) ( not ( = ?auto_20539 ?auto_20574 ) ) ( not ( = ?auto_20540 ?auto_20543 ) ) ( not ( = ?auto_20540 ?auto_20574 ) ) ( not ( = ?auto_20541 ?auto_20543 ) ) ( not ( = ?auto_20541 ?auto_20574 ) ) ( not ( = ?auto_20543 ?auto_20587 ) ) ( not ( = ?auto_20543 ?auto_20588 ) ) ( not ( = ?auto_20543 ?auto_20581 ) ) ( not ( = ?auto_20543 ?auto_20579 ) ) ( not ( = ?auto_20543 ?auto_20556 ) ) ( not ( = ?auto_20543 ?auto_20590 ) ) ( not ( = ?auto_20543 ?auto_20591 ) ) ( not ( = ?auto_20543 ?auto_20589 ) ) ( not ( = ?auto_20574 ?auto_20587 ) ) ( not ( = ?auto_20574 ?auto_20588 ) ) ( not ( = ?auto_20574 ?auto_20581 ) ) ( not ( = ?auto_20574 ?auto_20579 ) ) ( not ( = ?auto_20574 ?auto_20556 ) ) ( not ( = ?auto_20574 ?auto_20590 ) ) ( not ( = ?auto_20574 ?auto_20591 ) ) ( not ( = ?auto_20574 ?auto_20589 ) ) ( not ( = ?auto_20534 ?auto_20544 ) ) ( not ( = ?auto_20534 ?auto_20586 ) ) ( not ( = ?auto_20535 ?auto_20544 ) ) ( not ( = ?auto_20535 ?auto_20586 ) ) ( not ( = ?auto_20536 ?auto_20544 ) ) ( not ( = ?auto_20536 ?auto_20586 ) ) ( not ( = ?auto_20537 ?auto_20544 ) ) ( not ( = ?auto_20537 ?auto_20586 ) ) ( not ( = ?auto_20538 ?auto_20544 ) ) ( not ( = ?auto_20538 ?auto_20586 ) ) ( not ( = ?auto_20539 ?auto_20544 ) ) ( not ( = ?auto_20539 ?auto_20586 ) ) ( not ( = ?auto_20540 ?auto_20544 ) ) ( not ( = ?auto_20540 ?auto_20586 ) ) ( not ( = ?auto_20541 ?auto_20544 ) ) ( not ( = ?auto_20541 ?auto_20586 ) ) ( not ( = ?auto_20542 ?auto_20544 ) ) ( not ( = ?auto_20542 ?auto_20586 ) ) ( not ( = ?auto_20544 ?auto_20574 ) ) ( not ( = ?auto_20544 ?auto_20587 ) ) ( not ( = ?auto_20544 ?auto_20588 ) ) ( not ( = ?auto_20544 ?auto_20581 ) ) ( not ( = ?auto_20544 ?auto_20579 ) ) ( not ( = ?auto_20544 ?auto_20556 ) ) ( not ( = ?auto_20544 ?auto_20590 ) ) ( not ( = ?auto_20544 ?auto_20591 ) ) ( not ( = ?auto_20544 ?auto_20589 ) ) ( not ( = ?auto_20561 ?auto_20566 ) ) ( not ( = ?auto_20561 ?auto_20580 ) ) ( not ( = ?auto_20561 ?auto_20582 ) ) ( not ( = ?auto_20561 ?auto_20583 ) ) ( not ( = ?auto_20561 ?auto_20567 ) ) ( not ( = ?auto_20561 ?auto_20558 ) ) ( not ( = ?auto_20561 ?auto_20559 ) ) ( not ( = ?auto_20561 ?auto_20570 ) ) ( not ( = ?auto_20564 ?auto_20560 ) ) ( not ( = ?auto_20564 ?auto_20585 ) ) ( not ( = ?auto_20564 ?auto_20578 ) ) ( not ( = ?auto_20564 ?auto_20576 ) ) ( not ( = ?auto_20564 ?auto_20563 ) ) ( not ( = ?auto_20564 ?auto_20568 ) ) ( not ( = ?auto_20564 ?auto_20577 ) ) ( not ( = ?auto_20564 ?auto_20572 ) ) ( not ( = ?auto_20586 ?auto_20574 ) ) ( not ( = ?auto_20586 ?auto_20587 ) ) ( not ( = ?auto_20586 ?auto_20588 ) ) ( not ( = ?auto_20586 ?auto_20581 ) ) ( not ( = ?auto_20586 ?auto_20579 ) ) ( not ( = ?auto_20586 ?auto_20556 ) ) ( not ( = ?auto_20586 ?auto_20590 ) ) ( not ( = ?auto_20586 ?auto_20591 ) ) ( not ( = ?auto_20586 ?auto_20589 ) ) ( not ( = ?auto_20534 ?auto_20545 ) ) ( not ( = ?auto_20534 ?auto_20575 ) ) ( not ( = ?auto_20535 ?auto_20545 ) ) ( not ( = ?auto_20535 ?auto_20575 ) ) ( not ( = ?auto_20536 ?auto_20545 ) ) ( not ( = ?auto_20536 ?auto_20575 ) ) ( not ( = ?auto_20537 ?auto_20545 ) ) ( not ( = ?auto_20537 ?auto_20575 ) ) ( not ( = ?auto_20538 ?auto_20545 ) ) ( not ( = ?auto_20538 ?auto_20575 ) ) ( not ( = ?auto_20539 ?auto_20545 ) ) ( not ( = ?auto_20539 ?auto_20575 ) ) ( not ( = ?auto_20540 ?auto_20545 ) ) ( not ( = ?auto_20540 ?auto_20575 ) ) ( not ( = ?auto_20541 ?auto_20545 ) ) ( not ( = ?auto_20541 ?auto_20575 ) ) ( not ( = ?auto_20542 ?auto_20545 ) ) ( not ( = ?auto_20542 ?auto_20575 ) ) ( not ( = ?auto_20543 ?auto_20545 ) ) ( not ( = ?auto_20543 ?auto_20575 ) ) ( not ( = ?auto_20545 ?auto_20586 ) ) ( not ( = ?auto_20545 ?auto_20574 ) ) ( not ( = ?auto_20545 ?auto_20587 ) ) ( not ( = ?auto_20545 ?auto_20588 ) ) ( not ( = ?auto_20545 ?auto_20581 ) ) ( not ( = ?auto_20545 ?auto_20579 ) ) ( not ( = ?auto_20545 ?auto_20556 ) ) ( not ( = ?auto_20545 ?auto_20590 ) ) ( not ( = ?auto_20545 ?auto_20591 ) ) ( not ( = ?auto_20545 ?auto_20589 ) ) ( not ( = ?auto_20575 ?auto_20586 ) ) ( not ( = ?auto_20575 ?auto_20574 ) ) ( not ( = ?auto_20575 ?auto_20587 ) ) ( not ( = ?auto_20575 ?auto_20588 ) ) ( not ( = ?auto_20575 ?auto_20581 ) ) ( not ( = ?auto_20575 ?auto_20579 ) ) ( not ( = ?auto_20575 ?auto_20556 ) ) ( not ( = ?auto_20575 ?auto_20590 ) ) ( not ( = ?auto_20575 ?auto_20591 ) ) ( not ( = ?auto_20575 ?auto_20589 ) ) ( not ( = ?auto_20534 ?auto_20546 ) ) ( not ( = ?auto_20534 ?auto_20573 ) ) ( not ( = ?auto_20535 ?auto_20546 ) ) ( not ( = ?auto_20535 ?auto_20573 ) ) ( not ( = ?auto_20536 ?auto_20546 ) ) ( not ( = ?auto_20536 ?auto_20573 ) ) ( not ( = ?auto_20537 ?auto_20546 ) ) ( not ( = ?auto_20537 ?auto_20573 ) ) ( not ( = ?auto_20538 ?auto_20546 ) ) ( not ( = ?auto_20538 ?auto_20573 ) ) ( not ( = ?auto_20539 ?auto_20546 ) ) ( not ( = ?auto_20539 ?auto_20573 ) ) ( not ( = ?auto_20540 ?auto_20546 ) ) ( not ( = ?auto_20540 ?auto_20573 ) ) ( not ( = ?auto_20541 ?auto_20546 ) ) ( not ( = ?auto_20541 ?auto_20573 ) ) ( not ( = ?auto_20542 ?auto_20546 ) ) ( not ( = ?auto_20542 ?auto_20573 ) ) ( not ( = ?auto_20543 ?auto_20546 ) ) ( not ( = ?auto_20543 ?auto_20573 ) ) ( not ( = ?auto_20544 ?auto_20546 ) ) ( not ( = ?auto_20544 ?auto_20573 ) ) ( not ( = ?auto_20546 ?auto_20575 ) ) ( not ( = ?auto_20546 ?auto_20586 ) ) ( not ( = ?auto_20546 ?auto_20574 ) ) ( not ( = ?auto_20546 ?auto_20587 ) ) ( not ( = ?auto_20546 ?auto_20588 ) ) ( not ( = ?auto_20546 ?auto_20581 ) ) ( not ( = ?auto_20546 ?auto_20579 ) ) ( not ( = ?auto_20546 ?auto_20556 ) ) ( not ( = ?auto_20546 ?auto_20590 ) ) ( not ( = ?auto_20546 ?auto_20591 ) ) ( not ( = ?auto_20546 ?auto_20589 ) ) ( not ( = ?auto_20571 ?auto_20567 ) ) ( not ( = ?auto_20571 ?auto_20561 ) ) ( not ( = ?auto_20571 ?auto_20566 ) ) ( not ( = ?auto_20571 ?auto_20580 ) ) ( not ( = ?auto_20571 ?auto_20582 ) ) ( not ( = ?auto_20571 ?auto_20583 ) ) ( not ( = ?auto_20571 ?auto_20558 ) ) ( not ( = ?auto_20571 ?auto_20559 ) ) ( not ( = ?auto_20571 ?auto_20570 ) ) ( not ( = ?auto_20565 ?auto_20563 ) ) ( not ( = ?auto_20565 ?auto_20564 ) ) ( not ( = ?auto_20565 ?auto_20560 ) ) ( not ( = ?auto_20565 ?auto_20585 ) ) ( not ( = ?auto_20565 ?auto_20578 ) ) ( not ( = ?auto_20565 ?auto_20576 ) ) ( not ( = ?auto_20565 ?auto_20568 ) ) ( not ( = ?auto_20565 ?auto_20577 ) ) ( not ( = ?auto_20565 ?auto_20572 ) ) ( not ( = ?auto_20573 ?auto_20575 ) ) ( not ( = ?auto_20573 ?auto_20586 ) ) ( not ( = ?auto_20573 ?auto_20574 ) ) ( not ( = ?auto_20573 ?auto_20587 ) ) ( not ( = ?auto_20573 ?auto_20588 ) ) ( not ( = ?auto_20573 ?auto_20581 ) ) ( not ( = ?auto_20573 ?auto_20579 ) ) ( not ( = ?auto_20573 ?auto_20556 ) ) ( not ( = ?auto_20573 ?auto_20590 ) ) ( not ( = ?auto_20573 ?auto_20591 ) ) ( not ( = ?auto_20573 ?auto_20589 ) ) ( not ( = ?auto_20534 ?auto_20547 ) ) ( not ( = ?auto_20534 ?auto_20562 ) ) ( not ( = ?auto_20535 ?auto_20547 ) ) ( not ( = ?auto_20535 ?auto_20562 ) ) ( not ( = ?auto_20536 ?auto_20547 ) ) ( not ( = ?auto_20536 ?auto_20562 ) ) ( not ( = ?auto_20537 ?auto_20547 ) ) ( not ( = ?auto_20537 ?auto_20562 ) ) ( not ( = ?auto_20538 ?auto_20547 ) ) ( not ( = ?auto_20538 ?auto_20562 ) ) ( not ( = ?auto_20539 ?auto_20547 ) ) ( not ( = ?auto_20539 ?auto_20562 ) ) ( not ( = ?auto_20540 ?auto_20547 ) ) ( not ( = ?auto_20540 ?auto_20562 ) ) ( not ( = ?auto_20541 ?auto_20547 ) ) ( not ( = ?auto_20541 ?auto_20562 ) ) ( not ( = ?auto_20542 ?auto_20547 ) ) ( not ( = ?auto_20542 ?auto_20562 ) ) ( not ( = ?auto_20543 ?auto_20547 ) ) ( not ( = ?auto_20543 ?auto_20562 ) ) ( not ( = ?auto_20544 ?auto_20547 ) ) ( not ( = ?auto_20544 ?auto_20562 ) ) ( not ( = ?auto_20545 ?auto_20547 ) ) ( not ( = ?auto_20545 ?auto_20562 ) ) ( not ( = ?auto_20547 ?auto_20573 ) ) ( not ( = ?auto_20547 ?auto_20575 ) ) ( not ( = ?auto_20547 ?auto_20586 ) ) ( not ( = ?auto_20547 ?auto_20574 ) ) ( not ( = ?auto_20547 ?auto_20587 ) ) ( not ( = ?auto_20547 ?auto_20588 ) ) ( not ( = ?auto_20547 ?auto_20581 ) ) ( not ( = ?auto_20547 ?auto_20579 ) ) ( not ( = ?auto_20547 ?auto_20556 ) ) ( not ( = ?auto_20547 ?auto_20590 ) ) ( not ( = ?auto_20547 ?auto_20591 ) ) ( not ( = ?auto_20547 ?auto_20589 ) ) ( not ( = ?auto_20562 ?auto_20573 ) ) ( not ( = ?auto_20562 ?auto_20575 ) ) ( not ( = ?auto_20562 ?auto_20586 ) ) ( not ( = ?auto_20562 ?auto_20574 ) ) ( not ( = ?auto_20562 ?auto_20587 ) ) ( not ( = ?auto_20562 ?auto_20588 ) ) ( not ( = ?auto_20562 ?auto_20581 ) ) ( not ( = ?auto_20562 ?auto_20579 ) ) ( not ( = ?auto_20562 ?auto_20556 ) ) ( not ( = ?auto_20562 ?auto_20590 ) ) ( not ( = ?auto_20562 ?auto_20591 ) ) ( not ( = ?auto_20562 ?auto_20589 ) ) ( not ( = ?auto_20534 ?auto_20548 ) ) ( not ( = ?auto_20534 ?auto_20569 ) ) ( not ( = ?auto_20535 ?auto_20548 ) ) ( not ( = ?auto_20535 ?auto_20569 ) ) ( not ( = ?auto_20536 ?auto_20548 ) ) ( not ( = ?auto_20536 ?auto_20569 ) ) ( not ( = ?auto_20537 ?auto_20548 ) ) ( not ( = ?auto_20537 ?auto_20569 ) ) ( not ( = ?auto_20538 ?auto_20548 ) ) ( not ( = ?auto_20538 ?auto_20569 ) ) ( not ( = ?auto_20539 ?auto_20548 ) ) ( not ( = ?auto_20539 ?auto_20569 ) ) ( not ( = ?auto_20540 ?auto_20548 ) ) ( not ( = ?auto_20540 ?auto_20569 ) ) ( not ( = ?auto_20541 ?auto_20548 ) ) ( not ( = ?auto_20541 ?auto_20569 ) ) ( not ( = ?auto_20542 ?auto_20548 ) ) ( not ( = ?auto_20542 ?auto_20569 ) ) ( not ( = ?auto_20543 ?auto_20548 ) ) ( not ( = ?auto_20543 ?auto_20569 ) ) ( not ( = ?auto_20544 ?auto_20548 ) ) ( not ( = ?auto_20544 ?auto_20569 ) ) ( not ( = ?auto_20545 ?auto_20548 ) ) ( not ( = ?auto_20545 ?auto_20569 ) ) ( not ( = ?auto_20546 ?auto_20548 ) ) ( not ( = ?auto_20546 ?auto_20569 ) ) ( not ( = ?auto_20548 ?auto_20562 ) ) ( not ( = ?auto_20548 ?auto_20573 ) ) ( not ( = ?auto_20548 ?auto_20575 ) ) ( not ( = ?auto_20548 ?auto_20586 ) ) ( not ( = ?auto_20548 ?auto_20574 ) ) ( not ( = ?auto_20548 ?auto_20587 ) ) ( not ( = ?auto_20548 ?auto_20588 ) ) ( not ( = ?auto_20548 ?auto_20581 ) ) ( not ( = ?auto_20548 ?auto_20579 ) ) ( not ( = ?auto_20548 ?auto_20556 ) ) ( not ( = ?auto_20548 ?auto_20590 ) ) ( not ( = ?auto_20548 ?auto_20591 ) ) ( not ( = ?auto_20548 ?auto_20589 ) ) ( not ( = ?auto_20557 ?auto_20561 ) ) ( not ( = ?auto_20557 ?auto_20571 ) ) ( not ( = ?auto_20557 ?auto_20567 ) ) ( not ( = ?auto_20557 ?auto_20566 ) ) ( not ( = ?auto_20557 ?auto_20580 ) ) ( not ( = ?auto_20557 ?auto_20582 ) ) ( not ( = ?auto_20557 ?auto_20583 ) ) ( not ( = ?auto_20557 ?auto_20558 ) ) ( not ( = ?auto_20557 ?auto_20559 ) ) ( not ( = ?auto_20557 ?auto_20570 ) ) ( not ( = ?auto_20584 ?auto_20564 ) ) ( not ( = ?auto_20584 ?auto_20565 ) ) ( not ( = ?auto_20584 ?auto_20563 ) ) ( not ( = ?auto_20584 ?auto_20560 ) ) ( not ( = ?auto_20584 ?auto_20585 ) ) ( not ( = ?auto_20584 ?auto_20578 ) ) ( not ( = ?auto_20584 ?auto_20576 ) ) ( not ( = ?auto_20584 ?auto_20568 ) ) ( not ( = ?auto_20584 ?auto_20577 ) ) ( not ( = ?auto_20584 ?auto_20572 ) ) ( not ( = ?auto_20569 ?auto_20562 ) ) ( not ( = ?auto_20569 ?auto_20573 ) ) ( not ( = ?auto_20569 ?auto_20575 ) ) ( not ( = ?auto_20569 ?auto_20586 ) ) ( not ( = ?auto_20569 ?auto_20574 ) ) ( not ( = ?auto_20569 ?auto_20587 ) ) ( not ( = ?auto_20569 ?auto_20588 ) ) ( not ( = ?auto_20569 ?auto_20581 ) ) ( not ( = ?auto_20569 ?auto_20579 ) ) ( not ( = ?auto_20569 ?auto_20556 ) ) ( not ( = ?auto_20569 ?auto_20590 ) ) ( not ( = ?auto_20569 ?auto_20591 ) ) ( not ( = ?auto_20569 ?auto_20589 ) ) ( not ( = ?auto_20534 ?auto_20549 ) ) ( not ( = ?auto_20534 ?auto_20555 ) ) ( not ( = ?auto_20535 ?auto_20549 ) ) ( not ( = ?auto_20535 ?auto_20555 ) ) ( not ( = ?auto_20536 ?auto_20549 ) ) ( not ( = ?auto_20536 ?auto_20555 ) ) ( not ( = ?auto_20537 ?auto_20549 ) ) ( not ( = ?auto_20537 ?auto_20555 ) ) ( not ( = ?auto_20538 ?auto_20549 ) ) ( not ( = ?auto_20538 ?auto_20555 ) ) ( not ( = ?auto_20539 ?auto_20549 ) ) ( not ( = ?auto_20539 ?auto_20555 ) ) ( not ( = ?auto_20540 ?auto_20549 ) ) ( not ( = ?auto_20540 ?auto_20555 ) ) ( not ( = ?auto_20541 ?auto_20549 ) ) ( not ( = ?auto_20541 ?auto_20555 ) ) ( not ( = ?auto_20542 ?auto_20549 ) ) ( not ( = ?auto_20542 ?auto_20555 ) ) ( not ( = ?auto_20543 ?auto_20549 ) ) ( not ( = ?auto_20543 ?auto_20555 ) ) ( not ( = ?auto_20544 ?auto_20549 ) ) ( not ( = ?auto_20544 ?auto_20555 ) ) ( not ( = ?auto_20545 ?auto_20549 ) ) ( not ( = ?auto_20545 ?auto_20555 ) ) ( not ( = ?auto_20546 ?auto_20549 ) ) ( not ( = ?auto_20546 ?auto_20555 ) ) ( not ( = ?auto_20547 ?auto_20549 ) ) ( not ( = ?auto_20547 ?auto_20555 ) ) ( not ( = ?auto_20549 ?auto_20569 ) ) ( not ( = ?auto_20549 ?auto_20562 ) ) ( not ( = ?auto_20549 ?auto_20573 ) ) ( not ( = ?auto_20549 ?auto_20575 ) ) ( not ( = ?auto_20549 ?auto_20586 ) ) ( not ( = ?auto_20549 ?auto_20574 ) ) ( not ( = ?auto_20549 ?auto_20587 ) ) ( not ( = ?auto_20549 ?auto_20588 ) ) ( not ( = ?auto_20549 ?auto_20581 ) ) ( not ( = ?auto_20549 ?auto_20579 ) ) ( not ( = ?auto_20549 ?auto_20556 ) ) ( not ( = ?auto_20549 ?auto_20590 ) ) ( not ( = ?auto_20549 ?auto_20591 ) ) ( not ( = ?auto_20549 ?auto_20589 ) ) ( not ( = ?auto_20550 ?auto_20557 ) ) ( not ( = ?auto_20550 ?auto_20561 ) ) ( not ( = ?auto_20550 ?auto_20571 ) ) ( not ( = ?auto_20550 ?auto_20567 ) ) ( not ( = ?auto_20550 ?auto_20566 ) ) ( not ( = ?auto_20550 ?auto_20580 ) ) ( not ( = ?auto_20550 ?auto_20582 ) ) ( not ( = ?auto_20550 ?auto_20583 ) ) ( not ( = ?auto_20550 ?auto_20558 ) ) ( not ( = ?auto_20550 ?auto_20559 ) ) ( not ( = ?auto_20550 ?auto_20570 ) ) ( not ( = ?auto_20553 ?auto_20584 ) ) ( not ( = ?auto_20553 ?auto_20564 ) ) ( not ( = ?auto_20553 ?auto_20565 ) ) ( not ( = ?auto_20553 ?auto_20563 ) ) ( not ( = ?auto_20553 ?auto_20560 ) ) ( not ( = ?auto_20553 ?auto_20585 ) ) ( not ( = ?auto_20553 ?auto_20578 ) ) ( not ( = ?auto_20553 ?auto_20576 ) ) ( not ( = ?auto_20553 ?auto_20568 ) ) ( not ( = ?auto_20553 ?auto_20577 ) ) ( not ( = ?auto_20553 ?auto_20572 ) ) ( not ( = ?auto_20555 ?auto_20569 ) ) ( not ( = ?auto_20555 ?auto_20562 ) ) ( not ( = ?auto_20555 ?auto_20573 ) ) ( not ( = ?auto_20555 ?auto_20575 ) ) ( not ( = ?auto_20555 ?auto_20586 ) ) ( not ( = ?auto_20555 ?auto_20574 ) ) ( not ( = ?auto_20555 ?auto_20587 ) ) ( not ( = ?auto_20555 ?auto_20588 ) ) ( not ( = ?auto_20555 ?auto_20581 ) ) ( not ( = ?auto_20555 ?auto_20579 ) ) ( not ( = ?auto_20555 ?auto_20556 ) ) ( not ( = ?auto_20555 ?auto_20590 ) ) ( not ( = ?auto_20555 ?auto_20591 ) ) ( not ( = ?auto_20555 ?auto_20589 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_20534 ?auto_20535 ?auto_20536 ?auto_20537 ?auto_20538 ?auto_20539 ?auto_20540 ?auto_20541 ?auto_20542 ?auto_20543 ?auto_20544 ?auto_20545 ?auto_20546 ?auto_20547 ?auto_20548 )
      ( MAKE-1CRATE ?auto_20548 ?auto_20549 )
      ( MAKE-15CRATE-VERIFY ?auto_20534 ?auto_20535 ?auto_20536 ?auto_20537 ?auto_20538 ?auto_20539 ?auto_20540 ?auto_20541 ?auto_20542 ?auto_20543 ?auto_20544 ?auto_20545 ?auto_20546 ?auto_20547 ?auto_20548 ?auto_20549 ) )
  )

)

