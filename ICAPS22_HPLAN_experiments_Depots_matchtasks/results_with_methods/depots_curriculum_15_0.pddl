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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19819 - SURFACE
      ?auto_19820 - SURFACE
    )
    :vars
    (
      ?auto_19821 - HOIST
      ?auto_19822 - PLACE
      ?auto_19824 - PLACE
      ?auto_19825 - HOIST
      ?auto_19826 - SURFACE
      ?auto_19823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19821 ?auto_19822 ) ( SURFACE-AT ?auto_19819 ?auto_19822 ) ( CLEAR ?auto_19819 ) ( IS-CRATE ?auto_19820 ) ( AVAILABLE ?auto_19821 ) ( not ( = ?auto_19824 ?auto_19822 ) ) ( HOIST-AT ?auto_19825 ?auto_19824 ) ( AVAILABLE ?auto_19825 ) ( SURFACE-AT ?auto_19820 ?auto_19824 ) ( ON ?auto_19820 ?auto_19826 ) ( CLEAR ?auto_19820 ) ( TRUCK-AT ?auto_19823 ?auto_19822 ) ( not ( = ?auto_19819 ?auto_19820 ) ) ( not ( = ?auto_19819 ?auto_19826 ) ) ( not ( = ?auto_19820 ?auto_19826 ) ) ( not ( = ?auto_19821 ?auto_19825 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19823 ?auto_19822 ?auto_19824 )
      ( !LIFT ?auto_19825 ?auto_19820 ?auto_19826 ?auto_19824 )
      ( !LOAD ?auto_19825 ?auto_19820 ?auto_19823 ?auto_19824 )
      ( !DRIVE ?auto_19823 ?auto_19824 ?auto_19822 )
      ( !UNLOAD ?auto_19821 ?auto_19820 ?auto_19823 ?auto_19822 )
      ( !DROP ?auto_19821 ?auto_19820 ?auto_19819 ?auto_19822 )
      ( MAKE-1CRATE-VERIFY ?auto_19819 ?auto_19820 ) )
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
      ?auto_19834 - HOIST
      ?auto_19835 - PLACE
      ?auto_19838 - PLACE
      ?auto_19837 - HOIST
      ?auto_19836 - SURFACE
      ?auto_19840 - PLACE
      ?auto_19841 - HOIST
      ?auto_19839 - SURFACE
      ?auto_19833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19834 ?auto_19835 ) ( IS-CRATE ?auto_19832 ) ( not ( = ?auto_19838 ?auto_19835 ) ) ( HOIST-AT ?auto_19837 ?auto_19838 ) ( AVAILABLE ?auto_19837 ) ( SURFACE-AT ?auto_19832 ?auto_19838 ) ( ON ?auto_19832 ?auto_19836 ) ( CLEAR ?auto_19832 ) ( not ( = ?auto_19831 ?auto_19832 ) ) ( not ( = ?auto_19831 ?auto_19836 ) ) ( not ( = ?auto_19832 ?auto_19836 ) ) ( not ( = ?auto_19834 ?auto_19837 ) ) ( SURFACE-AT ?auto_19830 ?auto_19835 ) ( CLEAR ?auto_19830 ) ( IS-CRATE ?auto_19831 ) ( AVAILABLE ?auto_19834 ) ( not ( = ?auto_19840 ?auto_19835 ) ) ( HOIST-AT ?auto_19841 ?auto_19840 ) ( AVAILABLE ?auto_19841 ) ( SURFACE-AT ?auto_19831 ?auto_19840 ) ( ON ?auto_19831 ?auto_19839 ) ( CLEAR ?auto_19831 ) ( TRUCK-AT ?auto_19833 ?auto_19835 ) ( not ( = ?auto_19830 ?auto_19831 ) ) ( not ( = ?auto_19830 ?auto_19839 ) ) ( not ( = ?auto_19831 ?auto_19839 ) ) ( not ( = ?auto_19834 ?auto_19841 ) ) ( not ( = ?auto_19830 ?auto_19832 ) ) ( not ( = ?auto_19830 ?auto_19836 ) ) ( not ( = ?auto_19832 ?auto_19839 ) ) ( not ( = ?auto_19838 ?auto_19840 ) ) ( not ( = ?auto_19837 ?auto_19841 ) ) ( not ( = ?auto_19836 ?auto_19839 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19830 ?auto_19831 )
      ( MAKE-1CRATE ?auto_19831 ?auto_19832 )
      ( MAKE-2CRATE-VERIFY ?auto_19830 ?auto_19831 ?auto_19832 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19844 - SURFACE
      ?auto_19845 - SURFACE
    )
    :vars
    (
      ?auto_19846 - HOIST
      ?auto_19847 - PLACE
      ?auto_19849 - PLACE
      ?auto_19850 - HOIST
      ?auto_19851 - SURFACE
      ?auto_19848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19846 ?auto_19847 ) ( SURFACE-AT ?auto_19844 ?auto_19847 ) ( CLEAR ?auto_19844 ) ( IS-CRATE ?auto_19845 ) ( AVAILABLE ?auto_19846 ) ( not ( = ?auto_19849 ?auto_19847 ) ) ( HOIST-AT ?auto_19850 ?auto_19849 ) ( AVAILABLE ?auto_19850 ) ( SURFACE-AT ?auto_19845 ?auto_19849 ) ( ON ?auto_19845 ?auto_19851 ) ( CLEAR ?auto_19845 ) ( TRUCK-AT ?auto_19848 ?auto_19847 ) ( not ( = ?auto_19844 ?auto_19845 ) ) ( not ( = ?auto_19844 ?auto_19851 ) ) ( not ( = ?auto_19845 ?auto_19851 ) ) ( not ( = ?auto_19846 ?auto_19850 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19848 ?auto_19847 ?auto_19849 )
      ( !LIFT ?auto_19850 ?auto_19845 ?auto_19851 ?auto_19849 )
      ( !LOAD ?auto_19850 ?auto_19845 ?auto_19848 ?auto_19849 )
      ( !DRIVE ?auto_19848 ?auto_19849 ?auto_19847 )
      ( !UNLOAD ?auto_19846 ?auto_19845 ?auto_19848 ?auto_19847 )
      ( !DROP ?auto_19846 ?auto_19845 ?auto_19844 ?auto_19847 )
      ( MAKE-1CRATE-VERIFY ?auto_19844 ?auto_19845 ) )
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
      ?auto_19864 - HOIST
      ?auto_19863 - PLACE
      ?auto_19865 - PLACE
      ?auto_19860 - HOIST
      ?auto_19862 - SURFACE
      ?auto_19870 - PLACE
      ?auto_19866 - HOIST
      ?auto_19871 - SURFACE
      ?auto_19868 - PLACE
      ?auto_19869 - HOIST
      ?auto_19867 - SURFACE
      ?auto_19861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19864 ?auto_19863 ) ( IS-CRATE ?auto_19859 ) ( not ( = ?auto_19865 ?auto_19863 ) ) ( HOIST-AT ?auto_19860 ?auto_19865 ) ( AVAILABLE ?auto_19860 ) ( SURFACE-AT ?auto_19859 ?auto_19865 ) ( ON ?auto_19859 ?auto_19862 ) ( CLEAR ?auto_19859 ) ( not ( = ?auto_19858 ?auto_19859 ) ) ( not ( = ?auto_19858 ?auto_19862 ) ) ( not ( = ?auto_19859 ?auto_19862 ) ) ( not ( = ?auto_19864 ?auto_19860 ) ) ( IS-CRATE ?auto_19858 ) ( not ( = ?auto_19870 ?auto_19863 ) ) ( HOIST-AT ?auto_19866 ?auto_19870 ) ( AVAILABLE ?auto_19866 ) ( SURFACE-AT ?auto_19858 ?auto_19870 ) ( ON ?auto_19858 ?auto_19871 ) ( CLEAR ?auto_19858 ) ( not ( = ?auto_19857 ?auto_19858 ) ) ( not ( = ?auto_19857 ?auto_19871 ) ) ( not ( = ?auto_19858 ?auto_19871 ) ) ( not ( = ?auto_19864 ?auto_19866 ) ) ( SURFACE-AT ?auto_19856 ?auto_19863 ) ( CLEAR ?auto_19856 ) ( IS-CRATE ?auto_19857 ) ( AVAILABLE ?auto_19864 ) ( not ( = ?auto_19868 ?auto_19863 ) ) ( HOIST-AT ?auto_19869 ?auto_19868 ) ( AVAILABLE ?auto_19869 ) ( SURFACE-AT ?auto_19857 ?auto_19868 ) ( ON ?auto_19857 ?auto_19867 ) ( CLEAR ?auto_19857 ) ( TRUCK-AT ?auto_19861 ?auto_19863 ) ( not ( = ?auto_19856 ?auto_19857 ) ) ( not ( = ?auto_19856 ?auto_19867 ) ) ( not ( = ?auto_19857 ?auto_19867 ) ) ( not ( = ?auto_19864 ?auto_19869 ) ) ( not ( = ?auto_19856 ?auto_19858 ) ) ( not ( = ?auto_19856 ?auto_19871 ) ) ( not ( = ?auto_19858 ?auto_19867 ) ) ( not ( = ?auto_19870 ?auto_19868 ) ) ( not ( = ?auto_19866 ?auto_19869 ) ) ( not ( = ?auto_19871 ?auto_19867 ) ) ( not ( = ?auto_19856 ?auto_19859 ) ) ( not ( = ?auto_19856 ?auto_19862 ) ) ( not ( = ?auto_19857 ?auto_19859 ) ) ( not ( = ?auto_19857 ?auto_19862 ) ) ( not ( = ?auto_19859 ?auto_19871 ) ) ( not ( = ?auto_19859 ?auto_19867 ) ) ( not ( = ?auto_19865 ?auto_19870 ) ) ( not ( = ?auto_19865 ?auto_19868 ) ) ( not ( = ?auto_19860 ?auto_19866 ) ) ( not ( = ?auto_19860 ?auto_19869 ) ) ( not ( = ?auto_19862 ?auto_19871 ) ) ( not ( = ?auto_19862 ?auto_19867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19856 ?auto_19857 ?auto_19858 )
      ( MAKE-1CRATE ?auto_19858 ?auto_19859 )
      ( MAKE-3CRATE-VERIFY ?auto_19856 ?auto_19857 ?auto_19858 ?auto_19859 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19874 - SURFACE
      ?auto_19875 - SURFACE
    )
    :vars
    (
      ?auto_19876 - HOIST
      ?auto_19877 - PLACE
      ?auto_19879 - PLACE
      ?auto_19880 - HOIST
      ?auto_19881 - SURFACE
      ?auto_19878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19876 ?auto_19877 ) ( SURFACE-AT ?auto_19874 ?auto_19877 ) ( CLEAR ?auto_19874 ) ( IS-CRATE ?auto_19875 ) ( AVAILABLE ?auto_19876 ) ( not ( = ?auto_19879 ?auto_19877 ) ) ( HOIST-AT ?auto_19880 ?auto_19879 ) ( AVAILABLE ?auto_19880 ) ( SURFACE-AT ?auto_19875 ?auto_19879 ) ( ON ?auto_19875 ?auto_19881 ) ( CLEAR ?auto_19875 ) ( TRUCK-AT ?auto_19878 ?auto_19877 ) ( not ( = ?auto_19874 ?auto_19875 ) ) ( not ( = ?auto_19874 ?auto_19881 ) ) ( not ( = ?auto_19875 ?auto_19881 ) ) ( not ( = ?auto_19876 ?auto_19880 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19878 ?auto_19877 ?auto_19879 )
      ( !LIFT ?auto_19880 ?auto_19875 ?auto_19881 ?auto_19879 )
      ( !LOAD ?auto_19880 ?auto_19875 ?auto_19878 ?auto_19879 )
      ( !DRIVE ?auto_19878 ?auto_19879 ?auto_19877 )
      ( !UNLOAD ?auto_19876 ?auto_19875 ?auto_19878 ?auto_19877 )
      ( !DROP ?auto_19876 ?auto_19875 ?auto_19874 ?auto_19877 )
      ( MAKE-1CRATE-VERIFY ?auto_19874 ?auto_19875 ) )
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
      ?auto_19897 - HOIST
      ?auto_19892 - PLACE
      ?auto_19896 - PLACE
      ?auto_19894 - HOIST
      ?auto_19895 - SURFACE
      ?auto_19900 - PLACE
      ?auto_19899 - HOIST
      ?auto_19904 - SURFACE
      ?auto_19898 - PLACE
      ?auto_19903 - HOIST
      ?auto_19901 - SURFACE
      ?auto_19902 - PLACE
      ?auto_19906 - HOIST
      ?auto_19905 - SURFACE
      ?auto_19893 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19897 ?auto_19892 ) ( IS-CRATE ?auto_19891 ) ( not ( = ?auto_19896 ?auto_19892 ) ) ( HOIST-AT ?auto_19894 ?auto_19896 ) ( AVAILABLE ?auto_19894 ) ( SURFACE-AT ?auto_19891 ?auto_19896 ) ( ON ?auto_19891 ?auto_19895 ) ( CLEAR ?auto_19891 ) ( not ( = ?auto_19890 ?auto_19891 ) ) ( not ( = ?auto_19890 ?auto_19895 ) ) ( not ( = ?auto_19891 ?auto_19895 ) ) ( not ( = ?auto_19897 ?auto_19894 ) ) ( IS-CRATE ?auto_19890 ) ( not ( = ?auto_19900 ?auto_19892 ) ) ( HOIST-AT ?auto_19899 ?auto_19900 ) ( AVAILABLE ?auto_19899 ) ( SURFACE-AT ?auto_19890 ?auto_19900 ) ( ON ?auto_19890 ?auto_19904 ) ( CLEAR ?auto_19890 ) ( not ( = ?auto_19889 ?auto_19890 ) ) ( not ( = ?auto_19889 ?auto_19904 ) ) ( not ( = ?auto_19890 ?auto_19904 ) ) ( not ( = ?auto_19897 ?auto_19899 ) ) ( IS-CRATE ?auto_19889 ) ( not ( = ?auto_19898 ?auto_19892 ) ) ( HOIST-AT ?auto_19903 ?auto_19898 ) ( AVAILABLE ?auto_19903 ) ( SURFACE-AT ?auto_19889 ?auto_19898 ) ( ON ?auto_19889 ?auto_19901 ) ( CLEAR ?auto_19889 ) ( not ( = ?auto_19888 ?auto_19889 ) ) ( not ( = ?auto_19888 ?auto_19901 ) ) ( not ( = ?auto_19889 ?auto_19901 ) ) ( not ( = ?auto_19897 ?auto_19903 ) ) ( SURFACE-AT ?auto_19887 ?auto_19892 ) ( CLEAR ?auto_19887 ) ( IS-CRATE ?auto_19888 ) ( AVAILABLE ?auto_19897 ) ( not ( = ?auto_19902 ?auto_19892 ) ) ( HOIST-AT ?auto_19906 ?auto_19902 ) ( AVAILABLE ?auto_19906 ) ( SURFACE-AT ?auto_19888 ?auto_19902 ) ( ON ?auto_19888 ?auto_19905 ) ( CLEAR ?auto_19888 ) ( TRUCK-AT ?auto_19893 ?auto_19892 ) ( not ( = ?auto_19887 ?auto_19888 ) ) ( not ( = ?auto_19887 ?auto_19905 ) ) ( not ( = ?auto_19888 ?auto_19905 ) ) ( not ( = ?auto_19897 ?auto_19906 ) ) ( not ( = ?auto_19887 ?auto_19889 ) ) ( not ( = ?auto_19887 ?auto_19901 ) ) ( not ( = ?auto_19889 ?auto_19905 ) ) ( not ( = ?auto_19898 ?auto_19902 ) ) ( not ( = ?auto_19903 ?auto_19906 ) ) ( not ( = ?auto_19901 ?auto_19905 ) ) ( not ( = ?auto_19887 ?auto_19890 ) ) ( not ( = ?auto_19887 ?auto_19904 ) ) ( not ( = ?auto_19888 ?auto_19890 ) ) ( not ( = ?auto_19888 ?auto_19904 ) ) ( not ( = ?auto_19890 ?auto_19901 ) ) ( not ( = ?auto_19890 ?auto_19905 ) ) ( not ( = ?auto_19900 ?auto_19898 ) ) ( not ( = ?auto_19900 ?auto_19902 ) ) ( not ( = ?auto_19899 ?auto_19903 ) ) ( not ( = ?auto_19899 ?auto_19906 ) ) ( not ( = ?auto_19904 ?auto_19901 ) ) ( not ( = ?auto_19904 ?auto_19905 ) ) ( not ( = ?auto_19887 ?auto_19891 ) ) ( not ( = ?auto_19887 ?auto_19895 ) ) ( not ( = ?auto_19888 ?auto_19891 ) ) ( not ( = ?auto_19888 ?auto_19895 ) ) ( not ( = ?auto_19889 ?auto_19891 ) ) ( not ( = ?auto_19889 ?auto_19895 ) ) ( not ( = ?auto_19891 ?auto_19904 ) ) ( not ( = ?auto_19891 ?auto_19901 ) ) ( not ( = ?auto_19891 ?auto_19905 ) ) ( not ( = ?auto_19896 ?auto_19900 ) ) ( not ( = ?auto_19896 ?auto_19898 ) ) ( not ( = ?auto_19896 ?auto_19902 ) ) ( not ( = ?auto_19894 ?auto_19899 ) ) ( not ( = ?auto_19894 ?auto_19903 ) ) ( not ( = ?auto_19894 ?auto_19906 ) ) ( not ( = ?auto_19895 ?auto_19904 ) ) ( not ( = ?auto_19895 ?auto_19901 ) ) ( not ( = ?auto_19895 ?auto_19905 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_19887 ?auto_19888 ?auto_19889 ?auto_19890 )
      ( MAKE-1CRATE ?auto_19890 ?auto_19891 )
      ( MAKE-4CRATE-VERIFY ?auto_19887 ?auto_19888 ?auto_19889 ?auto_19890 ?auto_19891 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19909 - SURFACE
      ?auto_19910 - SURFACE
    )
    :vars
    (
      ?auto_19911 - HOIST
      ?auto_19912 - PLACE
      ?auto_19914 - PLACE
      ?auto_19915 - HOIST
      ?auto_19916 - SURFACE
      ?auto_19913 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19911 ?auto_19912 ) ( SURFACE-AT ?auto_19909 ?auto_19912 ) ( CLEAR ?auto_19909 ) ( IS-CRATE ?auto_19910 ) ( AVAILABLE ?auto_19911 ) ( not ( = ?auto_19914 ?auto_19912 ) ) ( HOIST-AT ?auto_19915 ?auto_19914 ) ( AVAILABLE ?auto_19915 ) ( SURFACE-AT ?auto_19910 ?auto_19914 ) ( ON ?auto_19910 ?auto_19916 ) ( CLEAR ?auto_19910 ) ( TRUCK-AT ?auto_19913 ?auto_19912 ) ( not ( = ?auto_19909 ?auto_19910 ) ) ( not ( = ?auto_19909 ?auto_19916 ) ) ( not ( = ?auto_19910 ?auto_19916 ) ) ( not ( = ?auto_19911 ?auto_19915 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19913 ?auto_19912 ?auto_19914 )
      ( !LIFT ?auto_19915 ?auto_19910 ?auto_19916 ?auto_19914 )
      ( !LOAD ?auto_19915 ?auto_19910 ?auto_19913 ?auto_19914 )
      ( !DRIVE ?auto_19913 ?auto_19914 ?auto_19912 )
      ( !UNLOAD ?auto_19911 ?auto_19910 ?auto_19913 ?auto_19912 )
      ( !DROP ?auto_19911 ?auto_19910 ?auto_19909 ?auto_19912 )
      ( MAKE-1CRATE-VERIFY ?auto_19909 ?auto_19910 ) )
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
      ?auto_19929 - HOIST
      ?auto_19932 - PLACE
      ?auto_19934 - PLACE
      ?auto_19930 - HOIST
      ?auto_19931 - SURFACE
      ?auto_19944 - PLACE
      ?auto_19937 - HOIST
      ?auto_19940 - SURFACE
      ?auto_19938 - PLACE
      ?auto_19939 - HOIST
      ?auto_19942 - SURFACE
      ?auto_19936 - PLACE
      ?auto_19943 - HOIST
      ?auto_19945 - SURFACE
      ?auto_19946 - PLACE
      ?auto_19935 - HOIST
      ?auto_19941 - SURFACE
      ?auto_19933 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19929 ?auto_19932 ) ( IS-CRATE ?auto_19928 ) ( not ( = ?auto_19934 ?auto_19932 ) ) ( HOIST-AT ?auto_19930 ?auto_19934 ) ( AVAILABLE ?auto_19930 ) ( SURFACE-AT ?auto_19928 ?auto_19934 ) ( ON ?auto_19928 ?auto_19931 ) ( CLEAR ?auto_19928 ) ( not ( = ?auto_19927 ?auto_19928 ) ) ( not ( = ?auto_19927 ?auto_19931 ) ) ( not ( = ?auto_19928 ?auto_19931 ) ) ( not ( = ?auto_19929 ?auto_19930 ) ) ( IS-CRATE ?auto_19927 ) ( not ( = ?auto_19944 ?auto_19932 ) ) ( HOIST-AT ?auto_19937 ?auto_19944 ) ( AVAILABLE ?auto_19937 ) ( SURFACE-AT ?auto_19927 ?auto_19944 ) ( ON ?auto_19927 ?auto_19940 ) ( CLEAR ?auto_19927 ) ( not ( = ?auto_19926 ?auto_19927 ) ) ( not ( = ?auto_19926 ?auto_19940 ) ) ( not ( = ?auto_19927 ?auto_19940 ) ) ( not ( = ?auto_19929 ?auto_19937 ) ) ( IS-CRATE ?auto_19926 ) ( not ( = ?auto_19938 ?auto_19932 ) ) ( HOIST-AT ?auto_19939 ?auto_19938 ) ( AVAILABLE ?auto_19939 ) ( SURFACE-AT ?auto_19926 ?auto_19938 ) ( ON ?auto_19926 ?auto_19942 ) ( CLEAR ?auto_19926 ) ( not ( = ?auto_19925 ?auto_19926 ) ) ( not ( = ?auto_19925 ?auto_19942 ) ) ( not ( = ?auto_19926 ?auto_19942 ) ) ( not ( = ?auto_19929 ?auto_19939 ) ) ( IS-CRATE ?auto_19925 ) ( not ( = ?auto_19936 ?auto_19932 ) ) ( HOIST-AT ?auto_19943 ?auto_19936 ) ( AVAILABLE ?auto_19943 ) ( SURFACE-AT ?auto_19925 ?auto_19936 ) ( ON ?auto_19925 ?auto_19945 ) ( CLEAR ?auto_19925 ) ( not ( = ?auto_19924 ?auto_19925 ) ) ( not ( = ?auto_19924 ?auto_19945 ) ) ( not ( = ?auto_19925 ?auto_19945 ) ) ( not ( = ?auto_19929 ?auto_19943 ) ) ( SURFACE-AT ?auto_19923 ?auto_19932 ) ( CLEAR ?auto_19923 ) ( IS-CRATE ?auto_19924 ) ( AVAILABLE ?auto_19929 ) ( not ( = ?auto_19946 ?auto_19932 ) ) ( HOIST-AT ?auto_19935 ?auto_19946 ) ( AVAILABLE ?auto_19935 ) ( SURFACE-AT ?auto_19924 ?auto_19946 ) ( ON ?auto_19924 ?auto_19941 ) ( CLEAR ?auto_19924 ) ( TRUCK-AT ?auto_19933 ?auto_19932 ) ( not ( = ?auto_19923 ?auto_19924 ) ) ( not ( = ?auto_19923 ?auto_19941 ) ) ( not ( = ?auto_19924 ?auto_19941 ) ) ( not ( = ?auto_19929 ?auto_19935 ) ) ( not ( = ?auto_19923 ?auto_19925 ) ) ( not ( = ?auto_19923 ?auto_19945 ) ) ( not ( = ?auto_19925 ?auto_19941 ) ) ( not ( = ?auto_19936 ?auto_19946 ) ) ( not ( = ?auto_19943 ?auto_19935 ) ) ( not ( = ?auto_19945 ?auto_19941 ) ) ( not ( = ?auto_19923 ?auto_19926 ) ) ( not ( = ?auto_19923 ?auto_19942 ) ) ( not ( = ?auto_19924 ?auto_19926 ) ) ( not ( = ?auto_19924 ?auto_19942 ) ) ( not ( = ?auto_19926 ?auto_19945 ) ) ( not ( = ?auto_19926 ?auto_19941 ) ) ( not ( = ?auto_19938 ?auto_19936 ) ) ( not ( = ?auto_19938 ?auto_19946 ) ) ( not ( = ?auto_19939 ?auto_19943 ) ) ( not ( = ?auto_19939 ?auto_19935 ) ) ( not ( = ?auto_19942 ?auto_19945 ) ) ( not ( = ?auto_19942 ?auto_19941 ) ) ( not ( = ?auto_19923 ?auto_19927 ) ) ( not ( = ?auto_19923 ?auto_19940 ) ) ( not ( = ?auto_19924 ?auto_19927 ) ) ( not ( = ?auto_19924 ?auto_19940 ) ) ( not ( = ?auto_19925 ?auto_19927 ) ) ( not ( = ?auto_19925 ?auto_19940 ) ) ( not ( = ?auto_19927 ?auto_19942 ) ) ( not ( = ?auto_19927 ?auto_19945 ) ) ( not ( = ?auto_19927 ?auto_19941 ) ) ( not ( = ?auto_19944 ?auto_19938 ) ) ( not ( = ?auto_19944 ?auto_19936 ) ) ( not ( = ?auto_19944 ?auto_19946 ) ) ( not ( = ?auto_19937 ?auto_19939 ) ) ( not ( = ?auto_19937 ?auto_19943 ) ) ( not ( = ?auto_19937 ?auto_19935 ) ) ( not ( = ?auto_19940 ?auto_19942 ) ) ( not ( = ?auto_19940 ?auto_19945 ) ) ( not ( = ?auto_19940 ?auto_19941 ) ) ( not ( = ?auto_19923 ?auto_19928 ) ) ( not ( = ?auto_19923 ?auto_19931 ) ) ( not ( = ?auto_19924 ?auto_19928 ) ) ( not ( = ?auto_19924 ?auto_19931 ) ) ( not ( = ?auto_19925 ?auto_19928 ) ) ( not ( = ?auto_19925 ?auto_19931 ) ) ( not ( = ?auto_19926 ?auto_19928 ) ) ( not ( = ?auto_19926 ?auto_19931 ) ) ( not ( = ?auto_19928 ?auto_19940 ) ) ( not ( = ?auto_19928 ?auto_19942 ) ) ( not ( = ?auto_19928 ?auto_19945 ) ) ( not ( = ?auto_19928 ?auto_19941 ) ) ( not ( = ?auto_19934 ?auto_19944 ) ) ( not ( = ?auto_19934 ?auto_19938 ) ) ( not ( = ?auto_19934 ?auto_19936 ) ) ( not ( = ?auto_19934 ?auto_19946 ) ) ( not ( = ?auto_19930 ?auto_19937 ) ) ( not ( = ?auto_19930 ?auto_19939 ) ) ( not ( = ?auto_19930 ?auto_19943 ) ) ( not ( = ?auto_19930 ?auto_19935 ) ) ( not ( = ?auto_19931 ?auto_19940 ) ) ( not ( = ?auto_19931 ?auto_19942 ) ) ( not ( = ?auto_19931 ?auto_19945 ) ) ( not ( = ?auto_19931 ?auto_19941 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_19923 ?auto_19924 ?auto_19925 ?auto_19926 ?auto_19927 )
      ( MAKE-1CRATE ?auto_19927 ?auto_19928 )
      ( MAKE-5CRATE-VERIFY ?auto_19923 ?auto_19924 ?auto_19925 ?auto_19926 ?auto_19927 ?auto_19928 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19949 - SURFACE
      ?auto_19950 - SURFACE
    )
    :vars
    (
      ?auto_19951 - HOIST
      ?auto_19952 - PLACE
      ?auto_19954 - PLACE
      ?auto_19955 - HOIST
      ?auto_19956 - SURFACE
      ?auto_19953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19951 ?auto_19952 ) ( SURFACE-AT ?auto_19949 ?auto_19952 ) ( CLEAR ?auto_19949 ) ( IS-CRATE ?auto_19950 ) ( AVAILABLE ?auto_19951 ) ( not ( = ?auto_19954 ?auto_19952 ) ) ( HOIST-AT ?auto_19955 ?auto_19954 ) ( AVAILABLE ?auto_19955 ) ( SURFACE-AT ?auto_19950 ?auto_19954 ) ( ON ?auto_19950 ?auto_19956 ) ( CLEAR ?auto_19950 ) ( TRUCK-AT ?auto_19953 ?auto_19952 ) ( not ( = ?auto_19949 ?auto_19950 ) ) ( not ( = ?auto_19949 ?auto_19956 ) ) ( not ( = ?auto_19950 ?auto_19956 ) ) ( not ( = ?auto_19951 ?auto_19955 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19953 ?auto_19952 ?auto_19954 )
      ( !LIFT ?auto_19955 ?auto_19950 ?auto_19956 ?auto_19954 )
      ( !LOAD ?auto_19955 ?auto_19950 ?auto_19953 ?auto_19954 )
      ( !DRIVE ?auto_19953 ?auto_19954 ?auto_19952 )
      ( !UNLOAD ?auto_19951 ?auto_19950 ?auto_19953 ?auto_19952 )
      ( !DROP ?auto_19951 ?auto_19950 ?auto_19949 ?auto_19952 )
      ( MAKE-1CRATE-VERIFY ?auto_19949 ?auto_19950 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_19964 - SURFACE
      ?auto_19965 - SURFACE
      ?auto_19966 - SURFACE
      ?auto_19967 - SURFACE
      ?auto_19968 - SURFACE
      ?auto_19970 - SURFACE
      ?auto_19969 - SURFACE
    )
    :vars
    (
      ?auto_19976 - HOIST
      ?auto_19973 - PLACE
      ?auto_19974 - PLACE
      ?auto_19975 - HOIST
      ?auto_19971 - SURFACE
      ?auto_19984 - PLACE
      ?auto_19983 - HOIST
      ?auto_19987 - SURFACE
      ?auto_19980 - PLACE
      ?auto_19977 - HOIST
      ?auto_19990 - SURFACE
      ?auto_19986 - PLACE
      ?auto_19991 - HOIST
      ?auto_19988 - SURFACE
      ?auto_19982 - PLACE
      ?auto_19985 - HOIST
      ?auto_19978 - SURFACE
      ?auto_19981 - PLACE
      ?auto_19979 - HOIST
      ?auto_19989 - SURFACE
      ?auto_19972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19976 ?auto_19973 ) ( IS-CRATE ?auto_19969 ) ( not ( = ?auto_19974 ?auto_19973 ) ) ( HOIST-AT ?auto_19975 ?auto_19974 ) ( AVAILABLE ?auto_19975 ) ( SURFACE-AT ?auto_19969 ?auto_19974 ) ( ON ?auto_19969 ?auto_19971 ) ( CLEAR ?auto_19969 ) ( not ( = ?auto_19970 ?auto_19969 ) ) ( not ( = ?auto_19970 ?auto_19971 ) ) ( not ( = ?auto_19969 ?auto_19971 ) ) ( not ( = ?auto_19976 ?auto_19975 ) ) ( IS-CRATE ?auto_19970 ) ( not ( = ?auto_19984 ?auto_19973 ) ) ( HOIST-AT ?auto_19983 ?auto_19984 ) ( AVAILABLE ?auto_19983 ) ( SURFACE-AT ?auto_19970 ?auto_19984 ) ( ON ?auto_19970 ?auto_19987 ) ( CLEAR ?auto_19970 ) ( not ( = ?auto_19968 ?auto_19970 ) ) ( not ( = ?auto_19968 ?auto_19987 ) ) ( not ( = ?auto_19970 ?auto_19987 ) ) ( not ( = ?auto_19976 ?auto_19983 ) ) ( IS-CRATE ?auto_19968 ) ( not ( = ?auto_19980 ?auto_19973 ) ) ( HOIST-AT ?auto_19977 ?auto_19980 ) ( AVAILABLE ?auto_19977 ) ( SURFACE-AT ?auto_19968 ?auto_19980 ) ( ON ?auto_19968 ?auto_19990 ) ( CLEAR ?auto_19968 ) ( not ( = ?auto_19967 ?auto_19968 ) ) ( not ( = ?auto_19967 ?auto_19990 ) ) ( not ( = ?auto_19968 ?auto_19990 ) ) ( not ( = ?auto_19976 ?auto_19977 ) ) ( IS-CRATE ?auto_19967 ) ( not ( = ?auto_19986 ?auto_19973 ) ) ( HOIST-AT ?auto_19991 ?auto_19986 ) ( AVAILABLE ?auto_19991 ) ( SURFACE-AT ?auto_19967 ?auto_19986 ) ( ON ?auto_19967 ?auto_19988 ) ( CLEAR ?auto_19967 ) ( not ( = ?auto_19966 ?auto_19967 ) ) ( not ( = ?auto_19966 ?auto_19988 ) ) ( not ( = ?auto_19967 ?auto_19988 ) ) ( not ( = ?auto_19976 ?auto_19991 ) ) ( IS-CRATE ?auto_19966 ) ( not ( = ?auto_19982 ?auto_19973 ) ) ( HOIST-AT ?auto_19985 ?auto_19982 ) ( AVAILABLE ?auto_19985 ) ( SURFACE-AT ?auto_19966 ?auto_19982 ) ( ON ?auto_19966 ?auto_19978 ) ( CLEAR ?auto_19966 ) ( not ( = ?auto_19965 ?auto_19966 ) ) ( not ( = ?auto_19965 ?auto_19978 ) ) ( not ( = ?auto_19966 ?auto_19978 ) ) ( not ( = ?auto_19976 ?auto_19985 ) ) ( SURFACE-AT ?auto_19964 ?auto_19973 ) ( CLEAR ?auto_19964 ) ( IS-CRATE ?auto_19965 ) ( AVAILABLE ?auto_19976 ) ( not ( = ?auto_19981 ?auto_19973 ) ) ( HOIST-AT ?auto_19979 ?auto_19981 ) ( AVAILABLE ?auto_19979 ) ( SURFACE-AT ?auto_19965 ?auto_19981 ) ( ON ?auto_19965 ?auto_19989 ) ( CLEAR ?auto_19965 ) ( TRUCK-AT ?auto_19972 ?auto_19973 ) ( not ( = ?auto_19964 ?auto_19965 ) ) ( not ( = ?auto_19964 ?auto_19989 ) ) ( not ( = ?auto_19965 ?auto_19989 ) ) ( not ( = ?auto_19976 ?auto_19979 ) ) ( not ( = ?auto_19964 ?auto_19966 ) ) ( not ( = ?auto_19964 ?auto_19978 ) ) ( not ( = ?auto_19966 ?auto_19989 ) ) ( not ( = ?auto_19982 ?auto_19981 ) ) ( not ( = ?auto_19985 ?auto_19979 ) ) ( not ( = ?auto_19978 ?auto_19989 ) ) ( not ( = ?auto_19964 ?auto_19967 ) ) ( not ( = ?auto_19964 ?auto_19988 ) ) ( not ( = ?auto_19965 ?auto_19967 ) ) ( not ( = ?auto_19965 ?auto_19988 ) ) ( not ( = ?auto_19967 ?auto_19978 ) ) ( not ( = ?auto_19967 ?auto_19989 ) ) ( not ( = ?auto_19986 ?auto_19982 ) ) ( not ( = ?auto_19986 ?auto_19981 ) ) ( not ( = ?auto_19991 ?auto_19985 ) ) ( not ( = ?auto_19991 ?auto_19979 ) ) ( not ( = ?auto_19988 ?auto_19978 ) ) ( not ( = ?auto_19988 ?auto_19989 ) ) ( not ( = ?auto_19964 ?auto_19968 ) ) ( not ( = ?auto_19964 ?auto_19990 ) ) ( not ( = ?auto_19965 ?auto_19968 ) ) ( not ( = ?auto_19965 ?auto_19990 ) ) ( not ( = ?auto_19966 ?auto_19968 ) ) ( not ( = ?auto_19966 ?auto_19990 ) ) ( not ( = ?auto_19968 ?auto_19988 ) ) ( not ( = ?auto_19968 ?auto_19978 ) ) ( not ( = ?auto_19968 ?auto_19989 ) ) ( not ( = ?auto_19980 ?auto_19986 ) ) ( not ( = ?auto_19980 ?auto_19982 ) ) ( not ( = ?auto_19980 ?auto_19981 ) ) ( not ( = ?auto_19977 ?auto_19991 ) ) ( not ( = ?auto_19977 ?auto_19985 ) ) ( not ( = ?auto_19977 ?auto_19979 ) ) ( not ( = ?auto_19990 ?auto_19988 ) ) ( not ( = ?auto_19990 ?auto_19978 ) ) ( not ( = ?auto_19990 ?auto_19989 ) ) ( not ( = ?auto_19964 ?auto_19970 ) ) ( not ( = ?auto_19964 ?auto_19987 ) ) ( not ( = ?auto_19965 ?auto_19970 ) ) ( not ( = ?auto_19965 ?auto_19987 ) ) ( not ( = ?auto_19966 ?auto_19970 ) ) ( not ( = ?auto_19966 ?auto_19987 ) ) ( not ( = ?auto_19967 ?auto_19970 ) ) ( not ( = ?auto_19967 ?auto_19987 ) ) ( not ( = ?auto_19970 ?auto_19990 ) ) ( not ( = ?auto_19970 ?auto_19988 ) ) ( not ( = ?auto_19970 ?auto_19978 ) ) ( not ( = ?auto_19970 ?auto_19989 ) ) ( not ( = ?auto_19984 ?auto_19980 ) ) ( not ( = ?auto_19984 ?auto_19986 ) ) ( not ( = ?auto_19984 ?auto_19982 ) ) ( not ( = ?auto_19984 ?auto_19981 ) ) ( not ( = ?auto_19983 ?auto_19977 ) ) ( not ( = ?auto_19983 ?auto_19991 ) ) ( not ( = ?auto_19983 ?auto_19985 ) ) ( not ( = ?auto_19983 ?auto_19979 ) ) ( not ( = ?auto_19987 ?auto_19990 ) ) ( not ( = ?auto_19987 ?auto_19988 ) ) ( not ( = ?auto_19987 ?auto_19978 ) ) ( not ( = ?auto_19987 ?auto_19989 ) ) ( not ( = ?auto_19964 ?auto_19969 ) ) ( not ( = ?auto_19964 ?auto_19971 ) ) ( not ( = ?auto_19965 ?auto_19969 ) ) ( not ( = ?auto_19965 ?auto_19971 ) ) ( not ( = ?auto_19966 ?auto_19969 ) ) ( not ( = ?auto_19966 ?auto_19971 ) ) ( not ( = ?auto_19967 ?auto_19969 ) ) ( not ( = ?auto_19967 ?auto_19971 ) ) ( not ( = ?auto_19968 ?auto_19969 ) ) ( not ( = ?auto_19968 ?auto_19971 ) ) ( not ( = ?auto_19969 ?auto_19987 ) ) ( not ( = ?auto_19969 ?auto_19990 ) ) ( not ( = ?auto_19969 ?auto_19988 ) ) ( not ( = ?auto_19969 ?auto_19978 ) ) ( not ( = ?auto_19969 ?auto_19989 ) ) ( not ( = ?auto_19974 ?auto_19984 ) ) ( not ( = ?auto_19974 ?auto_19980 ) ) ( not ( = ?auto_19974 ?auto_19986 ) ) ( not ( = ?auto_19974 ?auto_19982 ) ) ( not ( = ?auto_19974 ?auto_19981 ) ) ( not ( = ?auto_19975 ?auto_19983 ) ) ( not ( = ?auto_19975 ?auto_19977 ) ) ( not ( = ?auto_19975 ?auto_19991 ) ) ( not ( = ?auto_19975 ?auto_19985 ) ) ( not ( = ?auto_19975 ?auto_19979 ) ) ( not ( = ?auto_19971 ?auto_19987 ) ) ( not ( = ?auto_19971 ?auto_19990 ) ) ( not ( = ?auto_19971 ?auto_19988 ) ) ( not ( = ?auto_19971 ?auto_19978 ) ) ( not ( = ?auto_19971 ?auto_19989 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_19964 ?auto_19965 ?auto_19966 ?auto_19967 ?auto_19968 ?auto_19970 )
      ( MAKE-1CRATE ?auto_19970 ?auto_19969 )
      ( MAKE-6CRATE-VERIFY ?auto_19964 ?auto_19965 ?auto_19966 ?auto_19967 ?auto_19968 ?auto_19970 ?auto_19969 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19994 - SURFACE
      ?auto_19995 - SURFACE
    )
    :vars
    (
      ?auto_19996 - HOIST
      ?auto_19997 - PLACE
      ?auto_19999 - PLACE
      ?auto_20000 - HOIST
      ?auto_20001 - SURFACE
      ?auto_19998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19996 ?auto_19997 ) ( SURFACE-AT ?auto_19994 ?auto_19997 ) ( CLEAR ?auto_19994 ) ( IS-CRATE ?auto_19995 ) ( AVAILABLE ?auto_19996 ) ( not ( = ?auto_19999 ?auto_19997 ) ) ( HOIST-AT ?auto_20000 ?auto_19999 ) ( AVAILABLE ?auto_20000 ) ( SURFACE-AT ?auto_19995 ?auto_19999 ) ( ON ?auto_19995 ?auto_20001 ) ( CLEAR ?auto_19995 ) ( TRUCK-AT ?auto_19998 ?auto_19997 ) ( not ( = ?auto_19994 ?auto_19995 ) ) ( not ( = ?auto_19994 ?auto_20001 ) ) ( not ( = ?auto_19995 ?auto_20001 ) ) ( not ( = ?auto_19996 ?auto_20000 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19998 ?auto_19997 ?auto_19999 )
      ( !LIFT ?auto_20000 ?auto_19995 ?auto_20001 ?auto_19999 )
      ( !LOAD ?auto_20000 ?auto_19995 ?auto_19998 ?auto_19999 )
      ( !DRIVE ?auto_19998 ?auto_19999 ?auto_19997 )
      ( !UNLOAD ?auto_19996 ?auto_19995 ?auto_19998 ?auto_19997 )
      ( !DROP ?auto_19996 ?auto_19995 ?auto_19994 ?auto_19997 )
      ( MAKE-1CRATE-VERIFY ?auto_19994 ?auto_19995 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_20010 - SURFACE
      ?auto_20011 - SURFACE
      ?auto_20012 - SURFACE
      ?auto_20013 - SURFACE
      ?auto_20014 - SURFACE
      ?auto_20016 - SURFACE
      ?auto_20015 - SURFACE
      ?auto_20017 - SURFACE
    )
    :vars
    (
      ?auto_20022 - HOIST
      ?auto_20018 - PLACE
      ?auto_20019 - PLACE
      ?auto_20020 - HOIST
      ?auto_20023 - SURFACE
      ?auto_20037 - PLACE
      ?auto_20038 - HOIST
      ?auto_20041 - SURFACE
      ?auto_20028 - PLACE
      ?auto_20029 - HOIST
      ?auto_20035 - SURFACE
      ?auto_20039 - PLACE
      ?auto_20033 - HOIST
      ?auto_20027 - SURFACE
      ?auto_20024 - PLACE
      ?auto_20032 - HOIST
      ?auto_20025 - SURFACE
      ?auto_20030 - PLACE
      ?auto_20034 - HOIST
      ?auto_20040 - SURFACE
      ?auto_20031 - PLACE
      ?auto_20036 - HOIST
      ?auto_20026 - SURFACE
      ?auto_20021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20022 ?auto_20018 ) ( IS-CRATE ?auto_20017 ) ( not ( = ?auto_20019 ?auto_20018 ) ) ( HOIST-AT ?auto_20020 ?auto_20019 ) ( AVAILABLE ?auto_20020 ) ( SURFACE-AT ?auto_20017 ?auto_20019 ) ( ON ?auto_20017 ?auto_20023 ) ( CLEAR ?auto_20017 ) ( not ( = ?auto_20015 ?auto_20017 ) ) ( not ( = ?auto_20015 ?auto_20023 ) ) ( not ( = ?auto_20017 ?auto_20023 ) ) ( not ( = ?auto_20022 ?auto_20020 ) ) ( IS-CRATE ?auto_20015 ) ( not ( = ?auto_20037 ?auto_20018 ) ) ( HOIST-AT ?auto_20038 ?auto_20037 ) ( AVAILABLE ?auto_20038 ) ( SURFACE-AT ?auto_20015 ?auto_20037 ) ( ON ?auto_20015 ?auto_20041 ) ( CLEAR ?auto_20015 ) ( not ( = ?auto_20016 ?auto_20015 ) ) ( not ( = ?auto_20016 ?auto_20041 ) ) ( not ( = ?auto_20015 ?auto_20041 ) ) ( not ( = ?auto_20022 ?auto_20038 ) ) ( IS-CRATE ?auto_20016 ) ( not ( = ?auto_20028 ?auto_20018 ) ) ( HOIST-AT ?auto_20029 ?auto_20028 ) ( AVAILABLE ?auto_20029 ) ( SURFACE-AT ?auto_20016 ?auto_20028 ) ( ON ?auto_20016 ?auto_20035 ) ( CLEAR ?auto_20016 ) ( not ( = ?auto_20014 ?auto_20016 ) ) ( not ( = ?auto_20014 ?auto_20035 ) ) ( not ( = ?auto_20016 ?auto_20035 ) ) ( not ( = ?auto_20022 ?auto_20029 ) ) ( IS-CRATE ?auto_20014 ) ( not ( = ?auto_20039 ?auto_20018 ) ) ( HOIST-AT ?auto_20033 ?auto_20039 ) ( AVAILABLE ?auto_20033 ) ( SURFACE-AT ?auto_20014 ?auto_20039 ) ( ON ?auto_20014 ?auto_20027 ) ( CLEAR ?auto_20014 ) ( not ( = ?auto_20013 ?auto_20014 ) ) ( not ( = ?auto_20013 ?auto_20027 ) ) ( not ( = ?auto_20014 ?auto_20027 ) ) ( not ( = ?auto_20022 ?auto_20033 ) ) ( IS-CRATE ?auto_20013 ) ( not ( = ?auto_20024 ?auto_20018 ) ) ( HOIST-AT ?auto_20032 ?auto_20024 ) ( AVAILABLE ?auto_20032 ) ( SURFACE-AT ?auto_20013 ?auto_20024 ) ( ON ?auto_20013 ?auto_20025 ) ( CLEAR ?auto_20013 ) ( not ( = ?auto_20012 ?auto_20013 ) ) ( not ( = ?auto_20012 ?auto_20025 ) ) ( not ( = ?auto_20013 ?auto_20025 ) ) ( not ( = ?auto_20022 ?auto_20032 ) ) ( IS-CRATE ?auto_20012 ) ( not ( = ?auto_20030 ?auto_20018 ) ) ( HOIST-AT ?auto_20034 ?auto_20030 ) ( AVAILABLE ?auto_20034 ) ( SURFACE-AT ?auto_20012 ?auto_20030 ) ( ON ?auto_20012 ?auto_20040 ) ( CLEAR ?auto_20012 ) ( not ( = ?auto_20011 ?auto_20012 ) ) ( not ( = ?auto_20011 ?auto_20040 ) ) ( not ( = ?auto_20012 ?auto_20040 ) ) ( not ( = ?auto_20022 ?auto_20034 ) ) ( SURFACE-AT ?auto_20010 ?auto_20018 ) ( CLEAR ?auto_20010 ) ( IS-CRATE ?auto_20011 ) ( AVAILABLE ?auto_20022 ) ( not ( = ?auto_20031 ?auto_20018 ) ) ( HOIST-AT ?auto_20036 ?auto_20031 ) ( AVAILABLE ?auto_20036 ) ( SURFACE-AT ?auto_20011 ?auto_20031 ) ( ON ?auto_20011 ?auto_20026 ) ( CLEAR ?auto_20011 ) ( TRUCK-AT ?auto_20021 ?auto_20018 ) ( not ( = ?auto_20010 ?auto_20011 ) ) ( not ( = ?auto_20010 ?auto_20026 ) ) ( not ( = ?auto_20011 ?auto_20026 ) ) ( not ( = ?auto_20022 ?auto_20036 ) ) ( not ( = ?auto_20010 ?auto_20012 ) ) ( not ( = ?auto_20010 ?auto_20040 ) ) ( not ( = ?auto_20012 ?auto_20026 ) ) ( not ( = ?auto_20030 ?auto_20031 ) ) ( not ( = ?auto_20034 ?auto_20036 ) ) ( not ( = ?auto_20040 ?auto_20026 ) ) ( not ( = ?auto_20010 ?auto_20013 ) ) ( not ( = ?auto_20010 ?auto_20025 ) ) ( not ( = ?auto_20011 ?auto_20013 ) ) ( not ( = ?auto_20011 ?auto_20025 ) ) ( not ( = ?auto_20013 ?auto_20040 ) ) ( not ( = ?auto_20013 ?auto_20026 ) ) ( not ( = ?auto_20024 ?auto_20030 ) ) ( not ( = ?auto_20024 ?auto_20031 ) ) ( not ( = ?auto_20032 ?auto_20034 ) ) ( not ( = ?auto_20032 ?auto_20036 ) ) ( not ( = ?auto_20025 ?auto_20040 ) ) ( not ( = ?auto_20025 ?auto_20026 ) ) ( not ( = ?auto_20010 ?auto_20014 ) ) ( not ( = ?auto_20010 ?auto_20027 ) ) ( not ( = ?auto_20011 ?auto_20014 ) ) ( not ( = ?auto_20011 ?auto_20027 ) ) ( not ( = ?auto_20012 ?auto_20014 ) ) ( not ( = ?auto_20012 ?auto_20027 ) ) ( not ( = ?auto_20014 ?auto_20025 ) ) ( not ( = ?auto_20014 ?auto_20040 ) ) ( not ( = ?auto_20014 ?auto_20026 ) ) ( not ( = ?auto_20039 ?auto_20024 ) ) ( not ( = ?auto_20039 ?auto_20030 ) ) ( not ( = ?auto_20039 ?auto_20031 ) ) ( not ( = ?auto_20033 ?auto_20032 ) ) ( not ( = ?auto_20033 ?auto_20034 ) ) ( not ( = ?auto_20033 ?auto_20036 ) ) ( not ( = ?auto_20027 ?auto_20025 ) ) ( not ( = ?auto_20027 ?auto_20040 ) ) ( not ( = ?auto_20027 ?auto_20026 ) ) ( not ( = ?auto_20010 ?auto_20016 ) ) ( not ( = ?auto_20010 ?auto_20035 ) ) ( not ( = ?auto_20011 ?auto_20016 ) ) ( not ( = ?auto_20011 ?auto_20035 ) ) ( not ( = ?auto_20012 ?auto_20016 ) ) ( not ( = ?auto_20012 ?auto_20035 ) ) ( not ( = ?auto_20013 ?auto_20016 ) ) ( not ( = ?auto_20013 ?auto_20035 ) ) ( not ( = ?auto_20016 ?auto_20027 ) ) ( not ( = ?auto_20016 ?auto_20025 ) ) ( not ( = ?auto_20016 ?auto_20040 ) ) ( not ( = ?auto_20016 ?auto_20026 ) ) ( not ( = ?auto_20028 ?auto_20039 ) ) ( not ( = ?auto_20028 ?auto_20024 ) ) ( not ( = ?auto_20028 ?auto_20030 ) ) ( not ( = ?auto_20028 ?auto_20031 ) ) ( not ( = ?auto_20029 ?auto_20033 ) ) ( not ( = ?auto_20029 ?auto_20032 ) ) ( not ( = ?auto_20029 ?auto_20034 ) ) ( not ( = ?auto_20029 ?auto_20036 ) ) ( not ( = ?auto_20035 ?auto_20027 ) ) ( not ( = ?auto_20035 ?auto_20025 ) ) ( not ( = ?auto_20035 ?auto_20040 ) ) ( not ( = ?auto_20035 ?auto_20026 ) ) ( not ( = ?auto_20010 ?auto_20015 ) ) ( not ( = ?auto_20010 ?auto_20041 ) ) ( not ( = ?auto_20011 ?auto_20015 ) ) ( not ( = ?auto_20011 ?auto_20041 ) ) ( not ( = ?auto_20012 ?auto_20015 ) ) ( not ( = ?auto_20012 ?auto_20041 ) ) ( not ( = ?auto_20013 ?auto_20015 ) ) ( not ( = ?auto_20013 ?auto_20041 ) ) ( not ( = ?auto_20014 ?auto_20015 ) ) ( not ( = ?auto_20014 ?auto_20041 ) ) ( not ( = ?auto_20015 ?auto_20035 ) ) ( not ( = ?auto_20015 ?auto_20027 ) ) ( not ( = ?auto_20015 ?auto_20025 ) ) ( not ( = ?auto_20015 ?auto_20040 ) ) ( not ( = ?auto_20015 ?auto_20026 ) ) ( not ( = ?auto_20037 ?auto_20028 ) ) ( not ( = ?auto_20037 ?auto_20039 ) ) ( not ( = ?auto_20037 ?auto_20024 ) ) ( not ( = ?auto_20037 ?auto_20030 ) ) ( not ( = ?auto_20037 ?auto_20031 ) ) ( not ( = ?auto_20038 ?auto_20029 ) ) ( not ( = ?auto_20038 ?auto_20033 ) ) ( not ( = ?auto_20038 ?auto_20032 ) ) ( not ( = ?auto_20038 ?auto_20034 ) ) ( not ( = ?auto_20038 ?auto_20036 ) ) ( not ( = ?auto_20041 ?auto_20035 ) ) ( not ( = ?auto_20041 ?auto_20027 ) ) ( not ( = ?auto_20041 ?auto_20025 ) ) ( not ( = ?auto_20041 ?auto_20040 ) ) ( not ( = ?auto_20041 ?auto_20026 ) ) ( not ( = ?auto_20010 ?auto_20017 ) ) ( not ( = ?auto_20010 ?auto_20023 ) ) ( not ( = ?auto_20011 ?auto_20017 ) ) ( not ( = ?auto_20011 ?auto_20023 ) ) ( not ( = ?auto_20012 ?auto_20017 ) ) ( not ( = ?auto_20012 ?auto_20023 ) ) ( not ( = ?auto_20013 ?auto_20017 ) ) ( not ( = ?auto_20013 ?auto_20023 ) ) ( not ( = ?auto_20014 ?auto_20017 ) ) ( not ( = ?auto_20014 ?auto_20023 ) ) ( not ( = ?auto_20016 ?auto_20017 ) ) ( not ( = ?auto_20016 ?auto_20023 ) ) ( not ( = ?auto_20017 ?auto_20041 ) ) ( not ( = ?auto_20017 ?auto_20035 ) ) ( not ( = ?auto_20017 ?auto_20027 ) ) ( not ( = ?auto_20017 ?auto_20025 ) ) ( not ( = ?auto_20017 ?auto_20040 ) ) ( not ( = ?auto_20017 ?auto_20026 ) ) ( not ( = ?auto_20019 ?auto_20037 ) ) ( not ( = ?auto_20019 ?auto_20028 ) ) ( not ( = ?auto_20019 ?auto_20039 ) ) ( not ( = ?auto_20019 ?auto_20024 ) ) ( not ( = ?auto_20019 ?auto_20030 ) ) ( not ( = ?auto_20019 ?auto_20031 ) ) ( not ( = ?auto_20020 ?auto_20038 ) ) ( not ( = ?auto_20020 ?auto_20029 ) ) ( not ( = ?auto_20020 ?auto_20033 ) ) ( not ( = ?auto_20020 ?auto_20032 ) ) ( not ( = ?auto_20020 ?auto_20034 ) ) ( not ( = ?auto_20020 ?auto_20036 ) ) ( not ( = ?auto_20023 ?auto_20041 ) ) ( not ( = ?auto_20023 ?auto_20035 ) ) ( not ( = ?auto_20023 ?auto_20027 ) ) ( not ( = ?auto_20023 ?auto_20025 ) ) ( not ( = ?auto_20023 ?auto_20040 ) ) ( not ( = ?auto_20023 ?auto_20026 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_20010 ?auto_20011 ?auto_20012 ?auto_20013 ?auto_20014 ?auto_20016 ?auto_20015 )
      ( MAKE-1CRATE ?auto_20015 ?auto_20017 )
      ( MAKE-7CRATE-VERIFY ?auto_20010 ?auto_20011 ?auto_20012 ?auto_20013 ?auto_20014 ?auto_20016 ?auto_20015 ?auto_20017 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20044 - SURFACE
      ?auto_20045 - SURFACE
    )
    :vars
    (
      ?auto_20046 - HOIST
      ?auto_20047 - PLACE
      ?auto_20049 - PLACE
      ?auto_20050 - HOIST
      ?auto_20051 - SURFACE
      ?auto_20048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20046 ?auto_20047 ) ( SURFACE-AT ?auto_20044 ?auto_20047 ) ( CLEAR ?auto_20044 ) ( IS-CRATE ?auto_20045 ) ( AVAILABLE ?auto_20046 ) ( not ( = ?auto_20049 ?auto_20047 ) ) ( HOIST-AT ?auto_20050 ?auto_20049 ) ( AVAILABLE ?auto_20050 ) ( SURFACE-AT ?auto_20045 ?auto_20049 ) ( ON ?auto_20045 ?auto_20051 ) ( CLEAR ?auto_20045 ) ( TRUCK-AT ?auto_20048 ?auto_20047 ) ( not ( = ?auto_20044 ?auto_20045 ) ) ( not ( = ?auto_20044 ?auto_20051 ) ) ( not ( = ?auto_20045 ?auto_20051 ) ) ( not ( = ?auto_20046 ?auto_20050 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20048 ?auto_20047 ?auto_20049 )
      ( !LIFT ?auto_20050 ?auto_20045 ?auto_20051 ?auto_20049 )
      ( !LOAD ?auto_20050 ?auto_20045 ?auto_20048 ?auto_20049 )
      ( !DRIVE ?auto_20048 ?auto_20049 ?auto_20047 )
      ( !UNLOAD ?auto_20046 ?auto_20045 ?auto_20048 ?auto_20047 )
      ( !DROP ?auto_20046 ?auto_20045 ?auto_20044 ?auto_20047 )
      ( MAKE-1CRATE-VERIFY ?auto_20044 ?auto_20045 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_20061 - SURFACE
      ?auto_20062 - SURFACE
      ?auto_20063 - SURFACE
      ?auto_20064 - SURFACE
      ?auto_20065 - SURFACE
      ?auto_20067 - SURFACE
      ?auto_20066 - SURFACE
      ?auto_20069 - SURFACE
      ?auto_20068 - SURFACE
    )
    :vars
    (
      ?auto_20073 - HOIST
      ?auto_20075 - PLACE
      ?auto_20071 - PLACE
      ?auto_20074 - HOIST
      ?auto_20072 - SURFACE
      ?auto_20094 - PLACE
      ?auto_20095 - HOIST
      ?auto_20096 - SURFACE
      ?auto_20083 - PLACE
      ?auto_20092 - HOIST
      ?auto_20093 - SURFACE
      ?auto_20087 - PLACE
      ?auto_20086 - HOIST
      ?auto_20081 - SURFACE
      ?auto_20077 - PLACE
      ?auto_20080 - HOIST
      ?auto_20089 - SURFACE
      ?auto_20076 - PLACE
      ?auto_20078 - HOIST
      ?auto_20090 - SURFACE
      ?auto_20085 - PLACE
      ?auto_20079 - HOIST
      ?auto_20088 - SURFACE
      ?auto_20084 - PLACE
      ?auto_20082 - HOIST
      ?auto_20091 - SURFACE
      ?auto_20070 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20073 ?auto_20075 ) ( IS-CRATE ?auto_20068 ) ( not ( = ?auto_20071 ?auto_20075 ) ) ( HOIST-AT ?auto_20074 ?auto_20071 ) ( AVAILABLE ?auto_20074 ) ( SURFACE-AT ?auto_20068 ?auto_20071 ) ( ON ?auto_20068 ?auto_20072 ) ( CLEAR ?auto_20068 ) ( not ( = ?auto_20069 ?auto_20068 ) ) ( not ( = ?auto_20069 ?auto_20072 ) ) ( not ( = ?auto_20068 ?auto_20072 ) ) ( not ( = ?auto_20073 ?auto_20074 ) ) ( IS-CRATE ?auto_20069 ) ( not ( = ?auto_20094 ?auto_20075 ) ) ( HOIST-AT ?auto_20095 ?auto_20094 ) ( AVAILABLE ?auto_20095 ) ( SURFACE-AT ?auto_20069 ?auto_20094 ) ( ON ?auto_20069 ?auto_20096 ) ( CLEAR ?auto_20069 ) ( not ( = ?auto_20066 ?auto_20069 ) ) ( not ( = ?auto_20066 ?auto_20096 ) ) ( not ( = ?auto_20069 ?auto_20096 ) ) ( not ( = ?auto_20073 ?auto_20095 ) ) ( IS-CRATE ?auto_20066 ) ( not ( = ?auto_20083 ?auto_20075 ) ) ( HOIST-AT ?auto_20092 ?auto_20083 ) ( AVAILABLE ?auto_20092 ) ( SURFACE-AT ?auto_20066 ?auto_20083 ) ( ON ?auto_20066 ?auto_20093 ) ( CLEAR ?auto_20066 ) ( not ( = ?auto_20067 ?auto_20066 ) ) ( not ( = ?auto_20067 ?auto_20093 ) ) ( not ( = ?auto_20066 ?auto_20093 ) ) ( not ( = ?auto_20073 ?auto_20092 ) ) ( IS-CRATE ?auto_20067 ) ( not ( = ?auto_20087 ?auto_20075 ) ) ( HOIST-AT ?auto_20086 ?auto_20087 ) ( AVAILABLE ?auto_20086 ) ( SURFACE-AT ?auto_20067 ?auto_20087 ) ( ON ?auto_20067 ?auto_20081 ) ( CLEAR ?auto_20067 ) ( not ( = ?auto_20065 ?auto_20067 ) ) ( not ( = ?auto_20065 ?auto_20081 ) ) ( not ( = ?auto_20067 ?auto_20081 ) ) ( not ( = ?auto_20073 ?auto_20086 ) ) ( IS-CRATE ?auto_20065 ) ( not ( = ?auto_20077 ?auto_20075 ) ) ( HOIST-AT ?auto_20080 ?auto_20077 ) ( AVAILABLE ?auto_20080 ) ( SURFACE-AT ?auto_20065 ?auto_20077 ) ( ON ?auto_20065 ?auto_20089 ) ( CLEAR ?auto_20065 ) ( not ( = ?auto_20064 ?auto_20065 ) ) ( not ( = ?auto_20064 ?auto_20089 ) ) ( not ( = ?auto_20065 ?auto_20089 ) ) ( not ( = ?auto_20073 ?auto_20080 ) ) ( IS-CRATE ?auto_20064 ) ( not ( = ?auto_20076 ?auto_20075 ) ) ( HOIST-AT ?auto_20078 ?auto_20076 ) ( AVAILABLE ?auto_20078 ) ( SURFACE-AT ?auto_20064 ?auto_20076 ) ( ON ?auto_20064 ?auto_20090 ) ( CLEAR ?auto_20064 ) ( not ( = ?auto_20063 ?auto_20064 ) ) ( not ( = ?auto_20063 ?auto_20090 ) ) ( not ( = ?auto_20064 ?auto_20090 ) ) ( not ( = ?auto_20073 ?auto_20078 ) ) ( IS-CRATE ?auto_20063 ) ( not ( = ?auto_20085 ?auto_20075 ) ) ( HOIST-AT ?auto_20079 ?auto_20085 ) ( AVAILABLE ?auto_20079 ) ( SURFACE-AT ?auto_20063 ?auto_20085 ) ( ON ?auto_20063 ?auto_20088 ) ( CLEAR ?auto_20063 ) ( not ( = ?auto_20062 ?auto_20063 ) ) ( not ( = ?auto_20062 ?auto_20088 ) ) ( not ( = ?auto_20063 ?auto_20088 ) ) ( not ( = ?auto_20073 ?auto_20079 ) ) ( SURFACE-AT ?auto_20061 ?auto_20075 ) ( CLEAR ?auto_20061 ) ( IS-CRATE ?auto_20062 ) ( AVAILABLE ?auto_20073 ) ( not ( = ?auto_20084 ?auto_20075 ) ) ( HOIST-AT ?auto_20082 ?auto_20084 ) ( AVAILABLE ?auto_20082 ) ( SURFACE-AT ?auto_20062 ?auto_20084 ) ( ON ?auto_20062 ?auto_20091 ) ( CLEAR ?auto_20062 ) ( TRUCK-AT ?auto_20070 ?auto_20075 ) ( not ( = ?auto_20061 ?auto_20062 ) ) ( not ( = ?auto_20061 ?auto_20091 ) ) ( not ( = ?auto_20062 ?auto_20091 ) ) ( not ( = ?auto_20073 ?auto_20082 ) ) ( not ( = ?auto_20061 ?auto_20063 ) ) ( not ( = ?auto_20061 ?auto_20088 ) ) ( not ( = ?auto_20063 ?auto_20091 ) ) ( not ( = ?auto_20085 ?auto_20084 ) ) ( not ( = ?auto_20079 ?auto_20082 ) ) ( not ( = ?auto_20088 ?auto_20091 ) ) ( not ( = ?auto_20061 ?auto_20064 ) ) ( not ( = ?auto_20061 ?auto_20090 ) ) ( not ( = ?auto_20062 ?auto_20064 ) ) ( not ( = ?auto_20062 ?auto_20090 ) ) ( not ( = ?auto_20064 ?auto_20088 ) ) ( not ( = ?auto_20064 ?auto_20091 ) ) ( not ( = ?auto_20076 ?auto_20085 ) ) ( not ( = ?auto_20076 ?auto_20084 ) ) ( not ( = ?auto_20078 ?auto_20079 ) ) ( not ( = ?auto_20078 ?auto_20082 ) ) ( not ( = ?auto_20090 ?auto_20088 ) ) ( not ( = ?auto_20090 ?auto_20091 ) ) ( not ( = ?auto_20061 ?auto_20065 ) ) ( not ( = ?auto_20061 ?auto_20089 ) ) ( not ( = ?auto_20062 ?auto_20065 ) ) ( not ( = ?auto_20062 ?auto_20089 ) ) ( not ( = ?auto_20063 ?auto_20065 ) ) ( not ( = ?auto_20063 ?auto_20089 ) ) ( not ( = ?auto_20065 ?auto_20090 ) ) ( not ( = ?auto_20065 ?auto_20088 ) ) ( not ( = ?auto_20065 ?auto_20091 ) ) ( not ( = ?auto_20077 ?auto_20076 ) ) ( not ( = ?auto_20077 ?auto_20085 ) ) ( not ( = ?auto_20077 ?auto_20084 ) ) ( not ( = ?auto_20080 ?auto_20078 ) ) ( not ( = ?auto_20080 ?auto_20079 ) ) ( not ( = ?auto_20080 ?auto_20082 ) ) ( not ( = ?auto_20089 ?auto_20090 ) ) ( not ( = ?auto_20089 ?auto_20088 ) ) ( not ( = ?auto_20089 ?auto_20091 ) ) ( not ( = ?auto_20061 ?auto_20067 ) ) ( not ( = ?auto_20061 ?auto_20081 ) ) ( not ( = ?auto_20062 ?auto_20067 ) ) ( not ( = ?auto_20062 ?auto_20081 ) ) ( not ( = ?auto_20063 ?auto_20067 ) ) ( not ( = ?auto_20063 ?auto_20081 ) ) ( not ( = ?auto_20064 ?auto_20067 ) ) ( not ( = ?auto_20064 ?auto_20081 ) ) ( not ( = ?auto_20067 ?auto_20089 ) ) ( not ( = ?auto_20067 ?auto_20090 ) ) ( not ( = ?auto_20067 ?auto_20088 ) ) ( not ( = ?auto_20067 ?auto_20091 ) ) ( not ( = ?auto_20087 ?auto_20077 ) ) ( not ( = ?auto_20087 ?auto_20076 ) ) ( not ( = ?auto_20087 ?auto_20085 ) ) ( not ( = ?auto_20087 ?auto_20084 ) ) ( not ( = ?auto_20086 ?auto_20080 ) ) ( not ( = ?auto_20086 ?auto_20078 ) ) ( not ( = ?auto_20086 ?auto_20079 ) ) ( not ( = ?auto_20086 ?auto_20082 ) ) ( not ( = ?auto_20081 ?auto_20089 ) ) ( not ( = ?auto_20081 ?auto_20090 ) ) ( not ( = ?auto_20081 ?auto_20088 ) ) ( not ( = ?auto_20081 ?auto_20091 ) ) ( not ( = ?auto_20061 ?auto_20066 ) ) ( not ( = ?auto_20061 ?auto_20093 ) ) ( not ( = ?auto_20062 ?auto_20066 ) ) ( not ( = ?auto_20062 ?auto_20093 ) ) ( not ( = ?auto_20063 ?auto_20066 ) ) ( not ( = ?auto_20063 ?auto_20093 ) ) ( not ( = ?auto_20064 ?auto_20066 ) ) ( not ( = ?auto_20064 ?auto_20093 ) ) ( not ( = ?auto_20065 ?auto_20066 ) ) ( not ( = ?auto_20065 ?auto_20093 ) ) ( not ( = ?auto_20066 ?auto_20081 ) ) ( not ( = ?auto_20066 ?auto_20089 ) ) ( not ( = ?auto_20066 ?auto_20090 ) ) ( not ( = ?auto_20066 ?auto_20088 ) ) ( not ( = ?auto_20066 ?auto_20091 ) ) ( not ( = ?auto_20083 ?auto_20087 ) ) ( not ( = ?auto_20083 ?auto_20077 ) ) ( not ( = ?auto_20083 ?auto_20076 ) ) ( not ( = ?auto_20083 ?auto_20085 ) ) ( not ( = ?auto_20083 ?auto_20084 ) ) ( not ( = ?auto_20092 ?auto_20086 ) ) ( not ( = ?auto_20092 ?auto_20080 ) ) ( not ( = ?auto_20092 ?auto_20078 ) ) ( not ( = ?auto_20092 ?auto_20079 ) ) ( not ( = ?auto_20092 ?auto_20082 ) ) ( not ( = ?auto_20093 ?auto_20081 ) ) ( not ( = ?auto_20093 ?auto_20089 ) ) ( not ( = ?auto_20093 ?auto_20090 ) ) ( not ( = ?auto_20093 ?auto_20088 ) ) ( not ( = ?auto_20093 ?auto_20091 ) ) ( not ( = ?auto_20061 ?auto_20069 ) ) ( not ( = ?auto_20061 ?auto_20096 ) ) ( not ( = ?auto_20062 ?auto_20069 ) ) ( not ( = ?auto_20062 ?auto_20096 ) ) ( not ( = ?auto_20063 ?auto_20069 ) ) ( not ( = ?auto_20063 ?auto_20096 ) ) ( not ( = ?auto_20064 ?auto_20069 ) ) ( not ( = ?auto_20064 ?auto_20096 ) ) ( not ( = ?auto_20065 ?auto_20069 ) ) ( not ( = ?auto_20065 ?auto_20096 ) ) ( not ( = ?auto_20067 ?auto_20069 ) ) ( not ( = ?auto_20067 ?auto_20096 ) ) ( not ( = ?auto_20069 ?auto_20093 ) ) ( not ( = ?auto_20069 ?auto_20081 ) ) ( not ( = ?auto_20069 ?auto_20089 ) ) ( not ( = ?auto_20069 ?auto_20090 ) ) ( not ( = ?auto_20069 ?auto_20088 ) ) ( not ( = ?auto_20069 ?auto_20091 ) ) ( not ( = ?auto_20094 ?auto_20083 ) ) ( not ( = ?auto_20094 ?auto_20087 ) ) ( not ( = ?auto_20094 ?auto_20077 ) ) ( not ( = ?auto_20094 ?auto_20076 ) ) ( not ( = ?auto_20094 ?auto_20085 ) ) ( not ( = ?auto_20094 ?auto_20084 ) ) ( not ( = ?auto_20095 ?auto_20092 ) ) ( not ( = ?auto_20095 ?auto_20086 ) ) ( not ( = ?auto_20095 ?auto_20080 ) ) ( not ( = ?auto_20095 ?auto_20078 ) ) ( not ( = ?auto_20095 ?auto_20079 ) ) ( not ( = ?auto_20095 ?auto_20082 ) ) ( not ( = ?auto_20096 ?auto_20093 ) ) ( not ( = ?auto_20096 ?auto_20081 ) ) ( not ( = ?auto_20096 ?auto_20089 ) ) ( not ( = ?auto_20096 ?auto_20090 ) ) ( not ( = ?auto_20096 ?auto_20088 ) ) ( not ( = ?auto_20096 ?auto_20091 ) ) ( not ( = ?auto_20061 ?auto_20068 ) ) ( not ( = ?auto_20061 ?auto_20072 ) ) ( not ( = ?auto_20062 ?auto_20068 ) ) ( not ( = ?auto_20062 ?auto_20072 ) ) ( not ( = ?auto_20063 ?auto_20068 ) ) ( not ( = ?auto_20063 ?auto_20072 ) ) ( not ( = ?auto_20064 ?auto_20068 ) ) ( not ( = ?auto_20064 ?auto_20072 ) ) ( not ( = ?auto_20065 ?auto_20068 ) ) ( not ( = ?auto_20065 ?auto_20072 ) ) ( not ( = ?auto_20067 ?auto_20068 ) ) ( not ( = ?auto_20067 ?auto_20072 ) ) ( not ( = ?auto_20066 ?auto_20068 ) ) ( not ( = ?auto_20066 ?auto_20072 ) ) ( not ( = ?auto_20068 ?auto_20096 ) ) ( not ( = ?auto_20068 ?auto_20093 ) ) ( not ( = ?auto_20068 ?auto_20081 ) ) ( not ( = ?auto_20068 ?auto_20089 ) ) ( not ( = ?auto_20068 ?auto_20090 ) ) ( not ( = ?auto_20068 ?auto_20088 ) ) ( not ( = ?auto_20068 ?auto_20091 ) ) ( not ( = ?auto_20071 ?auto_20094 ) ) ( not ( = ?auto_20071 ?auto_20083 ) ) ( not ( = ?auto_20071 ?auto_20087 ) ) ( not ( = ?auto_20071 ?auto_20077 ) ) ( not ( = ?auto_20071 ?auto_20076 ) ) ( not ( = ?auto_20071 ?auto_20085 ) ) ( not ( = ?auto_20071 ?auto_20084 ) ) ( not ( = ?auto_20074 ?auto_20095 ) ) ( not ( = ?auto_20074 ?auto_20092 ) ) ( not ( = ?auto_20074 ?auto_20086 ) ) ( not ( = ?auto_20074 ?auto_20080 ) ) ( not ( = ?auto_20074 ?auto_20078 ) ) ( not ( = ?auto_20074 ?auto_20079 ) ) ( not ( = ?auto_20074 ?auto_20082 ) ) ( not ( = ?auto_20072 ?auto_20096 ) ) ( not ( = ?auto_20072 ?auto_20093 ) ) ( not ( = ?auto_20072 ?auto_20081 ) ) ( not ( = ?auto_20072 ?auto_20089 ) ) ( not ( = ?auto_20072 ?auto_20090 ) ) ( not ( = ?auto_20072 ?auto_20088 ) ) ( not ( = ?auto_20072 ?auto_20091 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_20061 ?auto_20062 ?auto_20063 ?auto_20064 ?auto_20065 ?auto_20067 ?auto_20066 ?auto_20069 )
      ( MAKE-1CRATE ?auto_20069 ?auto_20068 )
      ( MAKE-8CRATE-VERIFY ?auto_20061 ?auto_20062 ?auto_20063 ?auto_20064 ?auto_20065 ?auto_20067 ?auto_20066 ?auto_20069 ?auto_20068 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20099 - SURFACE
      ?auto_20100 - SURFACE
    )
    :vars
    (
      ?auto_20101 - HOIST
      ?auto_20102 - PLACE
      ?auto_20104 - PLACE
      ?auto_20105 - HOIST
      ?auto_20106 - SURFACE
      ?auto_20103 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20101 ?auto_20102 ) ( SURFACE-AT ?auto_20099 ?auto_20102 ) ( CLEAR ?auto_20099 ) ( IS-CRATE ?auto_20100 ) ( AVAILABLE ?auto_20101 ) ( not ( = ?auto_20104 ?auto_20102 ) ) ( HOIST-AT ?auto_20105 ?auto_20104 ) ( AVAILABLE ?auto_20105 ) ( SURFACE-AT ?auto_20100 ?auto_20104 ) ( ON ?auto_20100 ?auto_20106 ) ( CLEAR ?auto_20100 ) ( TRUCK-AT ?auto_20103 ?auto_20102 ) ( not ( = ?auto_20099 ?auto_20100 ) ) ( not ( = ?auto_20099 ?auto_20106 ) ) ( not ( = ?auto_20100 ?auto_20106 ) ) ( not ( = ?auto_20101 ?auto_20105 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20103 ?auto_20102 ?auto_20104 )
      ( !LIFT ?auto_20105 ?auto_20100 ?auto_20106 ?auto_20104 )
      ( !LOAD ?auto_20105 ?auto_20100 ?auto_20103 ?auto_20104 )
      ( !DRIVE ?auto_20103 ?auto_20104 ?auto_20102 )
      ( !UNLOAD ?auto_20101 ?auto_20100 ?auto_20103 ?auto_20102 )
      ( !DROP ?auto_20101 ?auto_20100 ?auto_20099 ?auto_20102 )
      ( MAKE-1CRATE-VERIFY ?auto_20099 ?auto_20100 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_20117 - SURFACE
      ?auto_20118 - SURFACE
      ?auto_20119 - SURFACE
      ?auto_20120 - SURFACE
      ?auto_20121 - SURFACE
      ?auto_20124 - SURFACE
      ?auto_20122 - SURFACE
      ?auto_20126 - SURFACE
      ?auto_20125 - SURFACE
      ?auto_20123 - SURFACE
    )
    :vars
    (
      ?auto_20128 - HOIST
      ?auto_20132 - PLACE
      ?auto_20131 - PLACE
      ?auto_20130 - HOIST
      ?auto_20127 - SURFACE
      ?auto_20140 - PLACE
      ?auto_20152 - HOIST
      ?auto_20154 - SURFACE
      ?auto_20143 - PLACE
      ?auto_20145 - HOIST
      ?auto_20144 - SURFACE
      ?auto_20133 - PLACE
      ?auto_20142 - HOIST
      ?auto_20136 - SURFACE
      ?auto_20149 - PLACE
      ?auto_20147 - HOIST
      ?auto_20134 - SURFACE
      ?auto_20139 - PLACE
      ?auto_20135 - HOIST
      ?auto_20151 - SURFACE
      ?auto_20141 - PLACE
      ?auto_20153 - HOIST
      ?auto_20138 - SURFACE
      ?auto_20148 - PLACE
      ?auto_20137 - HOIST
      ?auto_20150 - SURFACE
      ?auto_20146 - SURFACE
      ?auto_20129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20128 ?auto_20132 ) ( IS-CRATE ?auto_20123 ) ( not ( = ?auto_20131 ?auto_20132 ) ) ( HOIST-AT ?auto_20130 ?auto_20131 ) ( SURFACE-AT ?auto_20123 ?auto_20131 ) ( ON ?auto_20123 ?auto_20127 ) ( CLEAR ?auto_20123 ) ( not ( = ?auto_20125 ?auto_20123 ) ) ( not ( = ?auto_20125 ?auto_20127 ) ) ( not ( = ?auto_20123 ?auto_20127 ) ) ( not ( = ?auto_20128 ?auto_20130 ) ) ( IS-CRATE ?auto_20125 ) ( not ( = ?auto_20140 ?auto_20132 ) ) ( HOIST-AT ?auto_20152 ?auto_20140 ) ( AVAILABLE ?auto_20152 ) ( SURFACE-AT ?auto_20125 ?auto_20140 ) ( ON ?auto_20125 ?auto_20154 ) ( CLEAR ?auto_20125 ) ( not ( = ?auto_20126 ?auto_20125 ) ) ( not ( = ?auto_20126 ?auto_20154 ) ) ( not ( = ?auto_20125 ?auto_20154 ) ) ( not ( = ?auto_20128 ?auto_20152 ) ) ( IS-CRATE ?auto_20126 ) ( not ( = ?auto_20143 ?auto_20132 ) ) ( HOIST-AT ?auto_20145 ?auto_20143 ) ( AVAILABLE ?auto_20145 ) ( SURFACE-AT ?auto_20126 ?auto_20143 ) ( ON ?auto_20126 ?auto_20144 ) ( CLEAR ?auto_20126 ) ( not ( = ?auto_20122 ?auto_20126 ) ) ( not ( = ?auto_20122 ?auto_20144 ) ) ( not ( = ?auto_20126 ?auto_20144 ) ) ( not ( = ?auto_20128 ?auto_20145 ) ) ( IS-CRATE ?auto_20122 ) ( not ( = ?auto_20133 ?auto_20132 ) ) ( HOIST-AT ?auto_20142 ?auto_20133 ) ( AVAILABLE ?auto_20142 ) ( SURFACE-AT ?auto_20122 ?auto_20133 ) ( ON ?auto_20122 ?auto_20136 ) ( CLEAR ?auto_20122 ) ( not ( = ?auto_20124 ?auto_20122 ) ) ( not ( = ?auto_20124 ?auto_20136 ) ) ( not ( = ?auto_20122 ?auto_20136 ) ) ( not ( = ?auto_20128 ?auto_20142 ) ) ( IS-CRATE ?auto_20124 ) ( not ( = ?auto_20149 ?auto_20132 ) ) ( HOIST-AT ?auto_20147 ?auto_20149 ) ( AVAILABLE ?auto_20147 ) ( SURFACE-AT ?auto_20124 ?auto_20149 ) ( ON ?auto_20124 ?auto_20134 ) ( CLEAR ?auto_20124 ) ( not ( = ?auto_20121 ?auto_20124 ) ) ( not ( = ?auto_20121 ?auto_20134 ) ) ( not ( = ?auto_20124 ?auto_20134 ) ) ( not ( = ?auto_20128 ?auto_20147 ) ) ( IS-CRATE ?auto_20121 ) ( not ( = ?auto_20139 ?auto_20132 ) ) ( HOIST-AT ?auto_20135 ?auto_20139 ) ( AVAILABLE ?auto_20135 ) ( SURFACE-AT ?auto_20121 ?auto_20139 ) ( ON ?auto_20121 ?auto_20151 ) ( CLEAR ?auto_20121 ) ( not ( = ?auto_20120 ?auto_20121 ) ) ( not ( = ?auto_20120 ?auto_20151 ) ) ( not ( = ?auto_20121 ?auto_20151 ) ) ( not ( = ?auto_20128 ?auto_20135 ) ) ( IS-CRATE ?auto_20120 ) ( not ( = ?auto_20141 ?auto_20132 ) ) ( HOIST-AT ?auto_20153 ?auto_20141 ) ( AVAILABLE ?auto_20153 ) ( SURFACE-AT ?auto_20120 ?auto_20141 ) ( ON ?auto_20120 ?auto_20138 ) ( CLEAR ?auto_20120 ) ( not ( = ?auto_20119 ?auto_20120 ) ) ( not ( = ?auto_20119 ?auto_20138 ) ) ( not ( = ?auto_20120 ?auto_20138 ) ) ( not ( = ?auto_20128 ?auto_20153 ) ) ( IS-CRATE ?auto_20119 ) ( not ( = ?auto_20148 ?auto_20132 ) ) ( HOIST-AT ?auto_20137 ?auto_20148 ) ( AVAILABLE ?auto_20137 ) ( SURFACE-AT ?auto_20119 ?auto_20148 ) ( ON ?auto_20119 ?auto_20150 ) ( CLEAR ?auto_20119 ) ( not ( = ?auto_20118 ?auto_20119 ) ) ( not ( = ?auto_20118 ?auto_20150 ) ) ( not ( = ?auto_20119 ?auto_20150 ) ) ( not ( = ?auto_20128 ?auto_20137 ) ) ( SURFACE-AT ?auto_20117 ?auto_20132 ) ( CLEAR ?auto_20117 ) ( IS-CRATE ?auto_20118 ) ( AVAILABLE ?auto_20128 ) ( AVAILABLE ?auto_20130 ) ( SURFACE-AT ?auto_20118 ?auto_20131 ) ( ON ?auto_20118 ?auto_20146 ) ( CLEAR ?auto_20118 ) ( TRUCK-AT ?auto_20129 ?auto_20132 ) ( not ( = ?auto_20117 ?auto_20118 ) ) ( not ( = ?auto_20117 ?auto_20146 ) ) ( not ( = ?auto_20118 ?auto_20146 ) ) ( not ( = ?auto_20117 ?auto_20119 ) ) ( not ( = ?auto_20117 ?auto_20150 ) ) ( not ( = ?auto_20119 ?auto_20146 ) ) ( not ( = ?auto_20148 ?auto_20131 ) ) ( not ( = ?auto_20137 ?auto_20130 ) ) ( not ( = ?auto_20150 ?auto_20146 ) ) ( not ( = ?auto_20117 ?auto_20120 ) ) ( not ( = ?auto_20117 ?auto_20138 ) ) ( not ( = ?auto_20118 ?auto_20120 ) ) ( not ( = ?auto_20118 ?auto_20138 ) ) ( not ( = ?auto_20120 ?auto_20150 ) ) ( not ( = ?auto_20120 ?auto_20146 ) ) ( not ( = ?auto_20141 ?auto_20148 ) ) ( not ( = ?auto_20141 ?auto_20131 ) ) ( not ( = ?auto_20153 ?auto_20137 ) ) ( not ( = ?auto_20153 ?auto_20130 ) ) ( not ( = ?auto_20138 ?auto_20150 ) ) ( not ( = ?auto_20138 ?auto_20146 ) ) ( not ( = ?auto_20117 ?auto_20121 ) ) ( not ( = ?auto_20117 ?auto_20151 ) ) ( not ( = ?auto_20118 ?auto_20121 ) ) ( not ( = ?auto_20118 ?auto_20151 ) ) ( not ( = ?auto_20119 ?auto_20121 ) ) ( not ( = ?auto_20119 ?auto_20151 ) ) ( not ( = ?auto_20121 ?auto_20138 ) ) ( not ( = ?auto_20121 ?auto_20150 ) ) ( not ( = ?auto_20121 ?auto_20146 ) ) ( not ( = ?auto_20139 ?auto_20141 ) ) ( not ( = ?auto_20139 ?auto_20148 ) ) ( not ( = ?auto_20139 ?auto_20131 ) ) ( not ( = ?auto_20135 ?auto_20153 ) ) ( not ( = ?auto_20135 ?auto_20137 ) ) ( not ( = ?auto_20135 ?auto_20130 ) ) ( not ( = ?auto_20151 ?auto_20138 ) ) ( not ( = ?auto_20151 ?auto_20150 ) ) ( not ( = ?auto_20151 ?auto_20146 ) ) ( not ( = ?auto_20117 ?auto_20124 ) ) ( not ( = ?auto_20117 ?auto_20134 ) ) ( not ( = ?auto_20118 ?auto_20124 ) ) ( not ( = ?auto_20118 ?auto_20134 ) ) ( not ( = ?auto_20119 ?auto_20124 ) ) ( not ( = ?auto_20119 ?auto_20134 ) ) ( not ( = ?auto_20120 ?auto_20124 ) ) ( not ( = ?auto_20120 ?auto_20134 ) ) ( not ( = ?auto_20124 ?auto_20151 ) ) ( not ( = ?auto_20124 ?auto_20138 ) ) ( not ( = ?auto_20124 ?auto_20150 ) ) ( not ( = ?auto_20124 ?auto_20146 ) ) ( not ( = ?auto_20149 ?auto_20139 ) ) ( not ( = ?auto_20149 ?auto_20141 ) ) ( not ( = ?auto_20149 ?auto_20148 ) ) ( not ( = ?auto_20149 ?auto_20131 ) ) ( not ( = ?auto_20147 ?auto_20135 ) ) ( not ( = ?auto_20147 ?auto_20153 ) ) ( not ( = ?auto_20147 ?auto_20137 ) ) ( not ( = ?auto_20147 ?auto_20130 ) ) ( not ( = ?auto_20134 ?auto_20151 ) ) ( not ( = ?auto_20134 ?auto_20138 ) ) ( not ( = ?auto_20134 ?auto_20150 ) ) ( not ( = ?auto_20134 ?auto_20146 ) ) ( not ( = ?auto_20117 ?auto_20122 ) ) ( not ( = ?auto_20117 ?auto_20136 ) ) ( not ( = ?auto_20118 ?auto_20122 ) ) ( not ( = ?auto_20118 ?auto_20136 ) ) ( not ( = ?auto_20119 ?auto_20122 ) ) ( not ( = ?auto_20119 ?auto_20136 ) ) ( not ( = ?auto_20120 ?auto_20122 ) ) ( not ( = ?auto_20120 ?auto_20136 ) ) ( not ( = ?auto_20121 ?auto_20122 ) ) ( not ( = ?auto_20121 ?auto_20136 ) ) ( not ( = ?auto_20122 ?auto_20134 ) ) ( not ( = ?auto_20122 ?auto_20151 ) ) ( not ( = ?auto_20122 ?auto_20138 ) ) ( not ( = ?auto_20122 ?auto_20150 ) ) ( not ( = ?auto_20122 ?auto_20146 ) ) ( not ( = ?auto_20133 ?auto_20149 ) ) ( not ( = ?auto_20133 ?auto_20139 ) ) ( not ( = ?auto_20133 ?auto_20141 ) ) ( not ( = ?auto_20133 ?auto_20148 ) ) ( not ( = ?auto_20133 ?auto_20131 ) ) ( not ( = ?auto_20142 ?auto_20147 ) ) ( not ( = ?auto_20142 ?auto_20135 ) ) ( not ( = ?auto_20142 ?auto_20153 ) ) ( not ( = ?auto_20142 ?auto_20137 ) ) ( not ( = ?auto_20142 ?auto_20130 ) ) ( not ( = ?auto_20136 ?auto_20134 ) ) ( not ( = ?auto_20136 ?auto_20151 ) ) ( not ( = ?auto_20136 ?auto_20138 ) ) ( not ( = ?auto_20136 ?auto_20150 ) ) ( not ( = ?auto_20136 ?auto_20146 ) ) ( not ( = ?auto_20117 ?auto_20126 ) ) ( not ( = ?auto_20117 ?auto_20144 ) ) ( not ( = ?auto_20118 ?auto_20126 ) ) ( not ( = ?auto_20118 ?auto_20144 ) ) ( not ( = ?auto_20119 ?auto_20126 ) ) ( not ( = ?auto_20119 ?auto_20144 ) ) ( not ( = ?auto_20120 ?auto_20126 ) ) ( not ( = ?auto_20120 ?auto_20144 ) ) ( not ( = ?auto_20121 ?auto_20126 ) ) ( not ( = ?auto_20121 ?auto_20144 ) ) ( not ( = ?auto_20124 ?auto_20126 ) ) ( not ( = ?auto_20124 ?auto_20144 ) ) ( not ( = ?auto_20126 ?auto_20136 ) ) ( not ( = ?auto_20126 ?auto_20134 ) ) ( not ( = ?auto_20126 ?auto_20151 ) ) ( not ( = ?auto_20126 ?auto_20138 ) ) ( not ( = ?auto_20126 ?auto_20150 ) ) ( not ( = ?auto_20126 ?auto_20146 ) ) ( not ( = ?auto_20143 ?auto_20133 ) ) ( not ( = ?auto_20143 ?auto_20149 ) ) ( not ( = ?auto_20143 ?auto_20139 ) ) ( not ( = ?auto_20143 ?auto_20141 ) ) ( not ( = ?auto_20143 ?auto_20148 ) ) ( not ( = ?auto_20143 ?auto_20131 ) ) ( not ( = ?auto_20145 ?auto_20142 ) ) ( not ( = ?auto_20145 ?auto_20147 ) ) ( not ( = ?auto_20145 ?auto_20135 ) ) ( not ( = ?auto_20145 ?auto_20153 ) ) ( not ( = ?auto_20145 ?auto_20137 ) ) ( not ( = ?auto_20145 ?auto_20130 ) ) ( not ( = ?auto_20144 ?auto_20136 ) ) ( not ( = ?auto_20144 ?auto_20134 ) ) ( not ( = ?auto_20144 ?auto_20151 ) ) ( not ( = ?auto_20144 ?auto_20138 ) ) ( not ( = ?auto_20144 ?auto_20150 ) ) ( not ( = ?auto_20144 ?auto_20146 ) ) ( not ( = ?auto_20117 ?auto_20125 ) ) ( not ( = ?auto_20117 ?auto_20154 ) ) ( not ( = ?auto_20118 ?auto_20125 ) ) ( not ( = ?auto_20118 ?auto_20154 ) ) ( not ( = ?auto_20119 ?auto_20125 ) ) ( not ( = ?auto_20119 ?auto_20154 ) ) ( not ( = ?auto_20120 ?auto_20125 ) ) ( not ( = ?auto_20120 ?auto_20154 ) ) ( not ( = ?auto_20121 ?auto_20125 ) ) ( not ( = ?auto_20121 ?auto_20154 ) ) ( not ( = ?auto_20124 ?auto_20125 ) ) ( not ( = ?auto_20124 ?auto_20154 ) ) ( not ( = ?auto_20122 ?auto_20125 ) ) ( not ( = ?auto_20122 ?auto_20154 ) ) ( not ( = ?auto_20125 ?auto_20144 ) ) ( not ( = ?auto_20125 ?auto_20136 ) ) ( not ( = ?auto_20125 ?auto_20134 ) ) ( not ( = ?auto_20125 ?auto_20151 ) ) ( not ( = ?auto_20125 ?auto_20138 ) ) ( not ( = ?auto_20125 ?auto_20150 ) ) ( not ( = ?auto_20125 ?auto_20146 ) ) ( not ( = ?auto_20140 ?auto_20143 ) ) ( not ( = ?auto_20140 ?auto_20133 ) ) ( not ( = ?auto_20140 ?auto_20149 ) ) ( not ( = ?auto_20140 ?auto_20139 ) ) ( not ( = ?auto_20140 ?auto_20141 ) ) ( not ( = ?auto_20140 ?auto_20148 ) ) ( not ( = ?auto_20140 ?auto_20131 ) ) ( not ( = ?auto_20152 ?auto_20145 ) ) ( not ( = ?auto_20152 ?auto_20142 ) ) ( not ( = ?auto_20152 ?auto_20147 ) ) ( not ( = ?auto_20152 ?auto_20135 ) ) ( not ( = ?auto_20152 ?auto_20153 ) ) ( not ( = ?auto_20152 ?auto_20137 ) ) ( not ( = ?auto_20152 ?auto_20130 ) ) ( not ( = ?auto_20154 ?auto_20144 ) ) ( not ( = ?auto_20154 ?auto_20136 ) ) ( not ( = ?auto_20154 ?auto_20134 ) ) ( not ( = ?auto_20154 ?auto_20151 ) ) ( not ( = ?auto_20154 ?auto_20138 ) ) ( not ( = ?auto_20154 ?auto_20150 ) ) ( not ( = ?auto_20154 ?auto_20146 ) ) ( not ( = ?auto_20117 ?auto_20123 ) ) ( not ( = ?auto_20117 ?auto_20127 ) ) ( not ( = ?auto_20118 ?auto_20123 ) ) ( not ( = ?auto_20118 ?auto_20127 ) ) ( not ( = ?auto_20119 ?auto_20123 ) ) ( not ( = ?auto_20119 ?auto_20127 ) ) ( not ( = ?auto_20120 ?auto_20123 ) ) ( not ( = ?auto_20120 ?auto_20127 ) ) ( not ( = ?auto_20121 ?auto_20123 ) ) ( not ( = ?auto_20121 ?auto_20127 ) ) ( not ( = ?auto_20124 ?auto_20123 ) ) ( not ( = ?auto_20124 ?auto_20127 ) ) ( not ( = ?auto_20122 ?auto_20123 ) ) ( not ( = ?auto_20122 ?auto_20127 ) ) ( not ( = ?auto_20126 ?auto_20123 ) ) ( not ( = ?auto_20126 ?auto_20127 ) ) ( not ( = ?auto_20123 ?auto_20154 ) ) ( not ( = ?auto_20123 ?auto_20144 ) ) ( not ( = ?auto_20123 ?auto_20136 ) ) ( not ( = ?auto_20123 ?auto_20134 ) ) ( not ( = ?auto_20123 ?auto_20151 ) ) ( not ( = ?auto_20123 ?auto_20138 ) ) ( not ( = ?auto_20123 ?auto_20150 ) ) ( not ( = ?auto_20123 ?auto_20146 ) ) ( not ( = ?auto_20127 ?auto_20154 ) ) ( not ( = ?auto_20127 ?auto_20144 ) ) ( not ( = ?auto_20127 ?auto_20136 ) ) ( not ( = ?auto_20127 ?auto_20134 ) ) ( not ( = ?auto_20127 ?auto_20151 ) ) ( not ( = ?auto_20127 ?auto_20138 ) ) ( not ( = ?auto_20127 ?auto_20150 ) ) ( not ( = ?auto_20127 ?auto_20146 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_20117 ?auto_20118 ?auto_20119 ?auto_20120 ?auto_20121 ?auto_20124 ?auto_20122 ?auto_20126 ?auto_20125 )
      ( MAKE-1CRATE ?auto_20125 ?auto_20123 )
      ( MAKE-9CRATE-VERIFY ?auto_20117 ?auto_20118 ?auto_20119 ?auto_20120 ?auto_20121 ?auto_20124 ?auto_20122 ?auto_20126 ?auto_20125 ?auto_20123 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20157 - SURFACE
      ?auto_20158 - SURFACE
    )
    :vars
    (
      ?auto_20159 - HOIST
      ?auto_20160 - PLACE
      ?auto_20162 - PLACE
      ?auto_20163 - HOIST
      ?auto_20164 - SURFACE
      ?auto_20161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20159 ?auto_20160 ) ( SURFACE-AT ?auto_20157 ?auto_20160 ) ( CLEAR ?auto_20157 ) ( IS-CRATE ?auto_20158 ) ( AVAILABLE ?auto_20159 ) ( not ( = ?auto_20162 ?auto_20160 ) ) ( HOIST-AT ?auto_20163 ?auto_20162 ) ( AVAILABLE ?auto_20163 ) ( SURFACE-AT ?auto_20158 ?auto_20162 ) ( ON ?auto_20158 ?auto_20164 ) ( CLEAR ?auto_20158 ) ( TRUCK-AT ?auto_20161 ?auto_20160 ) ( not ( = ?auto_20157 ?auto_20158 ) ) ( not ( = ?auto_20157 ?auto_20164 ) ) ( not ( = ?auto_20158 ?auto_20164 ) ) ( not ( = ?auto_20159 ?auto_20163 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20161 ?auto_20160 ?auto_20162 )
      ( !LIFT ?auto_20163 ?auto_20158 ?auto_20164 ?auto_20162 )
      ( !LOAD ?auto_20163 ?auto_20158 ?auto_20161 ?auto_20162 )
      ( !DRIVE ?auto_20161 ?auto_20162 ?auto_20160 )
      ( !UNLOAD ?auto_20159 ?auto_20158 ?auto_20161 ?auto_20160 )
      ( !DROP ?auto_20159 ?auto_20158 ?auto_20157 ?auto_20160 )
      ( MAKE-1CRATE-VERIFY ?auto_20157 ?auto_20158 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_20176 - SURFACE
      ?auto_20177 - SURFACE
      ?auto_20178 - SURFACE
      ?auto_20179 - SURFACE
      ?auto_20180 - SURFACE
      ?auto_20183 - SURFACE
      ?auto_20181 - SURFACE
      ?auto_20185 - SURFACE
      ?auto_20184 - SURFACE
      ?auto_20182 - SURFACE
      ?auto_20186 - SURFACE
    )
    :vars
    (
      ?auto_20188 - HOIST
      ?auto_20191 - PLACE
      ?auto_20192 - PLACE
      ?auto_20189 - HOIST
      ?auto_20190 - SURFACE
      ?auto_20215 - PLACE
      ?auto_20205 - HOIST
      ?auto_20197 - SURFACE
      ?auto_20208 - PLACE
      ?auto_20198 - HOIST
      ?auto_20200 - SURFACE
      ?auto_20195 - PLACE
      ?auto_20202 - HOIST
      ?auto_20213 - SURFACE
      ?auto_20207 - PLACE
      ?auto_20209 - HOIST
      ?auto_20217 - SURFACE
      ?auto_20204 - PLACE
      ?auto_20216 - HOIST
      ?auto_20214 - SURFACE
      ?auto_20210 - PLACE
      ?auto_20196 - HOIST
      ?auto_20203 - SURFACE
      ?auto_20201 - PLACE
      ?auto_20194 - HOIST
      ?auto_20211 - SURFACE
      ?auto_20199 - PLACE
      ?auto_20212 - HOIST
      ?auto_20193 - SURFACE
      ?auto_20206 - SURFACE
      ?auto_20187 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20188 ?auto_20191 ) ( IS-CRATE ?auto_20186 ) ( not ( = ?auto_20192 ?auto_20191 ) ) ( HOIST-AT ?auto_20189 ?auto_20192 ) ( AVAILABLE ?auto_20189 ) ( SURFACE-AT ?auto_20186 ?auto_20192 ) ( ON ?auto_20186 ?auto_20190 ) ( CLEAR ?auto_20186 ) ( not ( = ?auto_20182 ?auto_20186 ) ) ( not ( = ?auto_20182 ?auto_20190 ) ) ( not ( = ?auto_20186 ?auto_20190 ) ) ( not ( = ?auto_20188 ?auto_20189 ) ) ( IS-CRATE ?auto_20182 ) ( not ( = ?auto_20215 ?auto_20191 ) ) ( HOIST-AT ?auto_20205 ?auto_20215 ) ( SURFACE-AT ?auto_20182 ?auto_20215 ) ( ON ?auto_20182 ?auto_20197 ) ( CLEAR ?auto_20182 ) ( not ( = ?auto_20184 ?auto_20182 ) ) ( not ( = ?auto_20184 ?auto_20197 ) ) ( not ( = ?auto_20182 ?auto_20197 ) ) ( not ( = ?auto_20188 ?auto_20205 ) ) ( IS-CRATE ?auto_20184 ) ( not ( = ?auto_20208 ?auto_20191 ) ) ( HOIST-AT ?auto_20198 ?auto_20208 ) ( AVAILABLE ?auto_20198 ) ( SURFACE-AT ?auto_20184 ?auto_20208 ) ( ON ?auto_20184 ?auto_20200 ) ( CLEAR ?auto_20184 ) ( not ( = ?auto_20185 ?auto_20184 ) ) ( not ( = ?auto_20185 ?auto_20200 ) ) ( not ( = ?auto_20184 ?auto_20200 ) ) ( not ( = ?auto_20188 ?auto_20198 ) ) ( IS-CRATE ?auto_20185 ) ( not ( = ?auto_20195 ?auto_20191 ) ) ( HOIST-AT ?auto_20202 ?auto_20195 ) ( AVAILABLE ?auto_20202 ) ( SURFACE-AT ?auto_20185 ?auto_20195 ) ( ON ?auto_20185 ?auto_20213 ) ( CLEAR ?auto_20185 ) ( not ( = ?auto_20181 ?auto_20185 ) ) ( not ( = ?auto_20181 ?auto_20213 ) ) ( not ( = ?auto_20185 ?auto_20213 ) ) ( not ( = ?auto_20188 ?auto_20202 ) ) ( IS-CRATE ?auto_20181 ) ( not ( = ?auto_20207 ?auto_20191 ) ) ( HOIST-AT ?auto_20209 ?auto_20207 ) ( AVAILABLE ?auto_20209 ) ( SURFACE-AT ?auto_20181 ?auto_20207 ) ( ON ?auto_20181 ?auto_20217 ) ( CLEAR ?auto_20181 ) ( not ( = ?auto_20183 ?auto_20181 ) ) ( not ( = ?auto_20183 ?auto_20217 ) ) ( not ( = ?auto_20181 ?auto_20217 ) ) ( not ( = ?auto_20188 ?auto_20209 ) ) ( IS-CRATE ?auto_20183 ) ( not ( = ?auto_20204 ?auto_20191 ) ) ( HOIST-AT ?auto_20216 ?auto_20204 ) ( AVAILABLE ?auto_20216 ) ( SURFACE-AT ?auto_20183 ?auto_20204 ) ( ON ?auto_20183 ?auto_20214 ) ( CLEAR ?auto_20183 ) ( not ( = ?auto_20180 ?auto_20183 ) ) ( not ( = ?auto_20180 ?auto_20214 ) ) ( not ( = ?auto_20183 ?auto_20214 ) ) ( not ( = ?auto_20188 ?auto_20216 ) ) ( IS-CRATE ?auto_20180 ) ( not ( = ?auto_20210 ?auto_20191 ) ) ( HOIST-AT ?auto_20196 ?auto_20210 ) ( AVAILABLE ?auto_20196 ) ( SURFACE-AT ?auto_20180 ?auto_20210 ) ( ON ?auto_20180 ?auto_20203 ) ( CLEAR ?auto_20180 ) ( not ( = ?auto_20179 ?auto_20180 ) ) ( not ( = ?auto_20179 ?auto_20203 ) ) ( not ( = ?auto_20180 ?auto_20203 ) ) ( not ( = ?auto_20188 ?auto_20196 ) ) ( IS-CRATE ?auto_20179 ) ( not ( = ?auto_20201 ?auto_20191 ) ) ( HOIST-AT ?auto_20194 ?auto_20201 ) ( AVAILABLE ?auto_20194 ) ( SURFACE-AT ?auto_20179 ?auto_20201 ) ( ON ?auto_20179 ?auto_20211 ) ( CLEAR ?auto_20179 ) ( not ( = ?auto_20178 ?auto_20179 ) ) ( not ( = ?auto_20178 ?auto_20211 ) ) ( not ( = ?auto_20179 ?auto_20211 ) ) ( not ( = ?auto_20188 ?auto_20194 ) ) ( IS-CRATE ?auto_20178 ) ( not ( = ?auto_20199 ?auto_20191 ) ) ( HOIST-AT ?auto_20212 ?auto_20199 ) ( AVAILABLE ?auto_20212 ) ( SURFACE-AT ?auto_20178 ?auto_20199 ) ( ON ?auto_20178 ?auto_20193 ) ( CLEAR ?auto_20178 ) ( not ( = ?auto_20177 ?auto_20178 ) ) ( not ( = ?auto_20177 ?auto_20193 ) ) ( not ( = ?auto_20178 ?auto_20193 ) ) ( not ( = ?auto_20188 ?auto_20212 ) ) ( SURFACE-AT ?auto_20176 ?auto_20191 ) ( CLEAR ?auto_20176 ) ( IS-CRATE ?auto_20177 ) ( AVAILABLE ?auto_20188 ) ( AVAILABLE ?auto_20205 ) ( SURFACE-AT ?auto_20177 ?auto_20215 ) ( ON ?auto_20177 ?auto_20206 ) ( CLEAR ?auto_20177 ) ( TRUCK-AT ?auto_20187 ?auto_20191 ) ( not ( = ?auto_20176 ?auto_20177 ) ) ( not ( = ?auto_20176 ?auto_20206 ) ) ( not ( = ?auto_20177 ?auto_20206 ) ) ( not ( = ?auto_20176 ?auto_20178 ) ) ( not ( = ?auto_20176 ?auto_20193 ) ) ( not ( = ?auto_20178 ?auto_20206 ) ) ( not ( = ?auto_20199 ?auto_20215 ) ) ( not ( = ?auto_20212 ?auto_20205 ) ) ( not ( = ?auto_20193 ?auto_20206 ) ) ( not ( = ?auto_20176 ?auto_20179 ) ) ( not ( = ?auto_20176 ?auto_20211 ) ) ( not ( = ?auto_20177 ?auto_20179 ) ) ( not ( = ?auto_20177 ?auto_20211 ) ) ( not ( = ?auto_20179 ?auto_20193 ) ) ( not ( = ?auto_20179 ?auto_20206 ) ) ( not ( = ?auto_20201 ?auto_20199 ) ) ( not ( = ?auto_20201 ?auto_20215 ) ) ( not ( = ?auto_20194 ?auto_20212 ) ) ( not ( = ?auto_20194 ?auto_20205 ) ) ( not ( = ?auto_20211 ?auto_20193 ) ) ( not ( = ?auto_20211 ?auto_20206 ) ) ( not ( = ?auto_20176 ?auto_20180 ) ) ( not ( = ?auto_20176 ?auto_20203 ) ) ( not ( = ?auto_20177 ?auto_20180 ) ) ( not ( = ?auto_20177 ?auto_20203 ) ) ( not ( = ?auto_20178 ?auto_20180 ) ) ( not ( = ?auto_20178 ?auto_20203 ) ) ( not ( = ?auto_20180 ?auto_20211 ) ) ( not ( = ?auto_20180 ?auto_20193 ) ) ( not ( = ?auto_20180 ?auto_20206 ) ) ( not ( = ?auto_20210 ?auto_20201 ) ) ( not ( = ?auto_20210 ?auto_20199 ) ) ( not ( = ?auto_20210 ?auto_20215 ) ) ( not ( = ?auto_20196 ?auto_20194 ) ) ( not ( = ?auto_20196 ?auto_20212 ) ) ( not ( = ?auto_20196 ?auto_20205 ) ) ( not ( = ?auto_20203 ?auto_20211 ) ) ( not ( = ?auto_20203 ?auto_20193 ) ) ( not ( = ?auto_20203 ?auto_20206 ) ) ( not ( = ?auto_20176 ?auto_20183 ) ) ( not ( = ?auto_20176 ?auto_20214 ) ) ( not ( = ?auto_20177 ?auto_20183 ) ) ( not ( = ?auto_20177 ?auto_20214 ) ) ( not ( = ?auto_20178 ?auto_20183 ) ) ( not ( = ?auto_20178 ?auto_20214 ) ) ( not ( = ?auto_20179 ?auto_20183 ) ) ( not ( = ?auto_20179 ?auto_20214 ) ) ( not ( = ?auto_20183 ?auto_20203 ) ) ( not ( = ?auto_20183 ?auto_20211 ) ) ( not ( = ?auto_20183 ?auto_20193 ) ) ( not ( = ?auto_20183 ?auto_20206 ) ) ( not ( = ?auto_20204 ?auto_20210 ) ) ( not ( = ?auto_20204 ?auto_20201 ) ) ( not ( = ?auto_20204 ?auto_20199 ) ) ( not ( = ?auto_20204 ?auto_20215 ) ) ( not ( = ?auto_20216 ?auto_20196 ) ) ( not ( = ?auto_20216 ?auto_20194 ) ) ( not ( = ?auto_20216 ?auto_20212 ) ) ( not ( = ?auto_20216 ?auto_20205 ) ) ( not ( = ?auto_20214 ?auto_20203 ) ) ( not ( = ?auto_20214 ?auto_20211 ) ) ( not ( = ?auto_20214 ?auto_20193 ) ) ( not ( = ?auto_20214 ?auto_20206 ) ) ( not ( = ?auto_20176 ?auto_20181 ) ) ( not ( = ?auto_20176 ?auto_20217 ) ) ( not ( = ?auto_20177 ?auto_20181 ) ) ( not ( = ?auto_20177 ?auto_20217 ) ) ( not ( = ?auto_20178 ?auto_20181 ) ) ( not ( = ?auto_20178 ?auto_20217 ) ) ( not ( = ?auto_20179 ?auto_20181 ) ) ( not ( = ?auto_20179 ?auto_20217 ) ) ( not ( = ?auto_20180 ?auto_20181 ) ) ( not ( = ?auto_20180 ?auto_20217 ) ) ( not ( = ?auto_20181 ?auto_20214 ) ) ( not ( = ?auto_20181 ?auto_20203 ) ) ( not ( = ?auto_20181 ?auto_20211 ) ) ( not ( = ?auto_20181 ?auto_20193 ) ) ( not ( = ?auto_20181 ?auto_20206 ) ) ( not ( = ?auto_20207 ?auto_20204 ) ) ( not ( = ?auto_20207 ?auto_20210 ) ) ( not ( = ?auto_20207 ?auto_20201 ) ) ( not ( = ?auto_20207 ?auto_20199 ) ) ( not ( = ?auto_20207 ?auto_20215 ) ) ( not ( = ?auto_20209 ?auto_20216 ) ) ( not ( = ?auto_20209 ?auto_20196 ) ) ( not ( = ?auto_20209 ?auto_20194 ) ) ( not ( = ?auto_20209 ?auto_20212 ) ) ( not ( = ?auto_20209 ?auto_20205 ) ) ( not ( = ?auto_20217 ?auto_20214 ) ) ( not ( = ?auto_20217 ?auto_20203 ) ) ( not ( = ?auto_20217 ?auto_20211 ) ) ( not ( = ?auto_20217 ?auto_20193 ) ) ( not ( = ?auto_20217 ?auto_20206 ) ) ( not ( = ?auto_20176 ?auto_20185 ) ) ( not ( = ?auto_20176 ?auto_20213 ) ) ( not ( = ?auto_20177 ?auto_20185 ) ) ( not ( = ?auto_20177 ?auto_20213 ) ) ( not ( = ?auto_20178 ?auto_20185 ) ) ( not ( = ?auto_20178 ?auto_20213 ) ) ( not ( = ?auto_20179 ?auto_20185 ) ) ( not ( = ?auto_20179 ?auto_20213 ) ) ( not ( = ?auto_20180 ?auto_20185 ) ) ( not ( = ?auto_20180 ?auto_20213 ) ) ( not ( = ?auto_20183 ?auto_20185 ) ) ( not ( = ?auto_20183 ?auto_20213 ) ) ( not ( = ?auto_20185 ?auto_20217 ) ) ( not ( = ?auto_20185 ?auto_20214 ) ) ( not ( = ?auto_20185 ?auto_20203 ) ) ( not ( = ?auto_20185 ?auto_20211 ) ) ( not ( = ?auto_20185 ?auto_20193 ) ) ( not ( = ?auto_20185 ?auto_20206 ) ) ( not ( = ?auto_20195 ?auto_20207 ) ) ( not ( = ?auto_20195 ?auto_20204 ) ) ( not ( = ?auto_20195 ?auto_20210 ) ) ( not ( = ?auto_20195 ?auto_20201 ) ) ( not ( = ?auto_20195 ?auto_20199 ) ) ( not ( = ?auto_20195 ?auto_20215 ) ) ( not ( = ?auto_20202 ?auto_20209 ) ) ( not ( = ?auto_20202 ?auto_20216 ) ) ( not ( = ?auto_20202 ?auto_20196 ) ) ( not ( = ?auto_20202 ?auto_20194 ) ) ( not ( = ?auto_20202 ?auto_20212 ) ) ( not ( = ?auto_20202 ?auto_20205 ) ) ( not ( = ?auto_20213 ?auto_20217 ) ) ( not ( = ?auto_20213 ?auto_20214 ) ) ( not ( = ?auto_20213 ?auto_20203 ) ) ( not ( = ?auto_20213 ?auto_20211 ) ) ( not ( = ?auto_20213 ?auto_20193 ) ) ( not ( = ?auto_20213 ?auto_20206 ) ) ( not ( = ?auto_20176 ?auto_20184 ) ) ( not ( = ?auto_20176 ?auto_20200 ) ) ( not ( = ?auto_20177 ?auto_20184 ) ) ( not ( = ?auto_20177 ?auto_20200 ) ) ( not ( = ?auto_20178 ?auto_20184 ) ) ( not ( = ?auto_20178 ?auto_20200 ) ) ( not ( = ?auto_20179 ?auto_20184 ) ) ( not ( = ?auto_20179 ?auto_20200 ) ) ( not ( = ?auto_20180 ?auto_20184 ) ) ( not ( = ?auto_20180 ?auto_20200 ) ) ( not ( = ?auto_20183 ?auto_20184 ) ) ( not ( = ?auto_20183 ?auto_20200 ) ) ( not ( = ?auto_20181 ?auto_20184 ) ) ( not ( = ?auto_20181 ?auto_20200 ) ) ( not ( = ?auto_20184 ?auto_20213 ) ) ( not ( = ?auto_20184 ?auto_20217 ) ) ( not ( = ?auto_20184 ?auto_20214 ) ) ( not ( = ?auto_20184 ?auto_20203 ) ) ( not ( = ?auto_20184 ?auto_20211 ) ) ( not ( = ?auto_20184 ?auto_20193 ) ) ( not ( = ?auto_20184 ?auto_20206 ) ) ( not ( = ?auto_20208 ?auto_20195 ) ) ( not ( = ?auto_20208 ?auto_20207 ) ) ( not ( = ?auto_20208 ?auto_20204 ) ) ( not ( = ?auto_20208 ?auto_20210 ) ) ( not ( = ?auto_20208 ?auto_20201 ) ) ( not ( = ?auto_20208 ?auto_20199 ) ) ( not ( = ?auto_20208 ?auto_20215 ) ) ( not ( = ?auto_20198 ?auto_20202 ) ) ( not ( = ?auto_20198 ?auto_20209 ) ) ( not ( = ?auto_20198 ?auto_20216 ) ) ( not ( = ?auto_20198 ?auto_20196 ) ) ( not ( = ?auto_20198 ?auto_20194 ) ) ( not ( = ?auto_20198 ?auto_20212 ) ) ( not ( = ?auto_20198 ?auto_20205 ) ) ( not ( = ?auto_20200 ?auto_20213 ) ) ( not ( = ?auto_20200 ?auto_20217 ) ) ( not ( = ?auto_20200 ?auto_20214 ) ) ( not ( = ?auto_20200 ?auto_20203 ) ) ( not ( = ?auto_20200 ?auto_20211 ) ) ( not ( = ?auto_20200 ?auto_20193 ) ) ( not ( = ?auto_20200 ?auto_20206 ) ) ( not ( = ?auto_20176 ?auto_20182 ) ) ( not ( = ?auto_20176 ?auto_20197 ) ) ( not ( = ?auto_20177 ?auto_20182 ) ) ( not ( = ?auto_20177 ?auto_20197 ) ) ( not ( = ?auto_20178 ?auto_20182 ) ) ( not ( = ?auto_20178 ?auto_20197 ) ) ( not ( = ?auto_20179 ?auto_20182 ) ) ( not ( = ?auto_20179 ?auto_20197 ) ) ( not ( = ?auto_20180 ?auto_20182 ) ) ( not ( = ?auto_20180 ?auto_20197 ) ) ( not ( = ?auto_20183 ?auto_20182 ) ) ( not ( = ?auto_20183 ?auto_20197 ) ) ( not ( = ?auto_20181 ?auto_20182 ) ) ( not ( = ?auto_20181 ?auto_20197 ) ) ( not ( = ?auto_20185 ?auto_20182 ) ) ( not ( = ?auto_20185 ?auto_20197 ) ) ( not ( = ?auto_20182 ?auto_20200 ) ) ( not ( = ?auto_20182 ?auto_20213 ) ) ( not ( = ?auto_20182 ?auto_20217 ) ) ( not ( = ?auto_20182 ?auto_20214 ) ) ( not ( = ?auto_20182 ?auto_20203 ) ) ( not ( = ?auto_20182 ?auto_20211 ) ) ( not ( = ?auto_20182 ?auto_20193 ) ) ( not ( = ?auto_20182 ?auto_20206 ) ) ( not ( = ?auto_20197 ?auto_20200 ) ) ( not ( = ?auto_20197 ?auto_20213 ) ) ( not ( = ?auto_20197 ?auto_20217 ) ) ( not ( = ?auto_20197 ?auto_20214 ) ) ( not ( = ?auto_20197 ?auto_20203 ) ) ( not ( = ?auto_20197 ?auto_20211 ) ) ( not ( = ?auto_20197 ?auto_20193 ) ) ( not ( = ?auto_20197 ?auto_20206 ) ) ( not ( = ?auto_20176 ?auto_20186 ) ) ( not ( = ?auto_20176 ?auto_20190 ) ) ( not ( = ?auto_20177 ?auto_20186 ) ) ( not ( = ?auto_20177 ?auto_20190 ) ) ( not ( = ?auto_20178 ?auto_20186 ) ) ( not ( = ?auto_20178 ?auto_20190 ) ) ( not ( = ?auto_20179 ?auto_20186 ) ) ( not ( = ?auto_20179 ?auto_20190 ) ) ( not ( = ?auto_20180 ?auto_20186 ) ) ( not ( = ?auto_20180 ?auto_20190 ) ) ( not ( = ?auto_20183 ?auto_20186 ) ) ( not ( = ?auto_20183 ?auto_20190 ) ) ( not ( = ?auto_20181 ?auto_20186 ) ) ( not ( = ?auto_20181 ?auto_20190 ) ) ( not ( = ?auto_20185 ?auto_20186 ) ) ( not ( = ?auto_20185 ?auto_20190 ) ) ( not ( = ?auto_20184 ?auto_20186 ) ) ( not ( = ?auto_20184 ?auto_20190 ) ) ( not ( = ?auto_20186 ?auto_20197 ) ) ( not ( = ?auto_20186 ?auto_20200 ) ) ( not ( = ?auto_20186 ?auto_20213 ) ) ( not ( = ?auto_20186 ?auto_20217 ) ) ( not ( = ?auto_20186 ?auto_20214 ) ) ( not ( = ?auto_20186 ?auto_20203 ) ) ( not ( = ?auto_20186 ?auto_20211 ) ) ( not ( = ?auto_20186 ?auto_20193 ) ) ( not ( = ?auto_20186 ?auto_20206 ) ) ( not ( = ?auto_20192 ?auto_20215 ) ) ( not ( = ?auto_20192 ?auto_20208 ) ) ( not ( = ?auto_20192 ?auto_20195 ) ) ( not ( = ?auto_20192 ?auto_20207 ) ) ( not ( = ?auto_20192 ?auto_20204 ) ) ( not ( = ?auto_20192 ?auto_20210 ) ) ( not ( = ?auto_20192 ?auto_20201 ) ) ( not ( = ?auto_20192 ?auto_20199 ) ) ( not ( = ?auto_20189 ?auto_20205 ) ) ( not ( = ?auto_20189 ?auto_20198 ) ) ( not ( = ?auto_20189 ?auto_20202 ) ) ( not ( = ?auto_20189 ?auto_20209 ) ) ( not ( = ?auto_20189 ?auto_20216 ) ) ( not ( = ?auto_20189 ?auto_20196 ) ) ( not ( = ?auto_20189 ?auto_20194 ) ) ( not ( = ?auto_20189 ?auto_20212 ) ) ( not ( = ?auto_20190 ?auto_20197 ) ) ( not ( = ?auto_20190 ?auto_20200 ) ) ( not ( = ?auto_20190 ?auto_20213 ) ) ( not ( = ?auto_20190 ?auto_20217 ) ) ( not ( = ?auto_20190 ?auto_20214 ) ) ( not ( = ?auto_20190 ?auto_20203 ) ) ( not ( = ?auto_20190 ?auto_20211 ) ) ( not ( = ?auto_20190 ?auto_20193 ) ) ( not ( = ?auto_20190 ?auto_20206 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_20176 ?auto_20177 ?auto_20178 ?auto_20179 ?auto_20180 ?auto_20183 ?auto_20181 ?auto_20185 ?auto_20184 ?auto_20182 )
      ( MAKE-1CRATE ?auto_20182 ?auto_20186 )
      ( MAKE-10CRATE-VERIFY ?auto_20176 ?auto_20177 ?auto_20178 ?auto_20179 ?auto_20180 ?auto_20183 ?auto_20181 ?auto_20185 ?auto_20184 ?auto_20182 ?auto_20186 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20220 - SURFACE
      ?auto_20221 - SURFACE
    )
    :vars
    (
      ?auto_20222 - HOIST
      ?auto_20223 - PLACE
      ?auto_20225 - PLACE
      ?auto_20226 - HOIST
      ?auto_20227 - SURFACE
      ?auto_20224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20222 ?auto_20223 ) ( SURFACE-AT ?auto_20220 ?auto_20223 ) ( CLEAR ?auto_20220 ) ( IS-CRATE ?auto_20221 ) ( AVAILABLE ?auto_20222 ) ( not ( = ?auto_20225 ?auto_20223 ) ) ( HOIST-AT ?auto_20226 ?auto_20225 ) ( AVAILABLE ?auto_20226 ) ( SURFACE-AT ?auto_20221 ?auto_20225 ) ( ON ?auto_20221 ?auto_20227 ) ( CLEAR ?auto_20221 ) ( TRUCK-AT ?auto_20224 ?auto_20223 ) ( not ( = ?auto_20220 ?auto_20221 ) ) ( not ( = ?auto_20220 ?auto_20227 ) ) ( not ( = ?auto_20221 ?auto_20227 ) ) ( not ( = ?auto_20222 ?auto_20226 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20224 ?auto_20223 ?auto_20225 )
      ( !LIFT ?auto_20226 ?auto_20221 ?auto_20227 ?auto_20225 )
      ( !LOAD ?auto_20226 ?auto_20221 ?auto_20224 ?auto_20225 )
      ( !DRIVE ?auto_20224 ?auto_20225 ?auto_20223 )
      ( !UNLOAD ?auto_20222 ?auto_20221 ?auto_20224 ?auto_20223 )
      ( !DROP ?auto_20222 ?auto_20221 ?auto_20220 ?auto_20223 )
      ( MAKE-1CRATE-VERIFY ?auto_20220 ?auto_20221 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_20240 - SURFACE
      ?auto_20241 - SURFACE
      ?auto_20242 - SURFACE
      ?auto_20243 - SURFACE
      ?auto_20244 - SURFACE
      ?auto_20247 - SURFACE
      ?auto_20245 - SURFACE
      ?auto_20249 - SURFACE
      ?auto_20248 - SURFACE
      ?auto_20246 - SURFACE
      ?auto_20251 - SURFACE
      ?auto_20250 - SURFACE
    )
    :vars
    (
      ?auto_20252 - HOIST
      ?auto_20255 - PLACE
      ?auto_20257 - PLACE
      ?auto_20254 - HOIST
      ?auto_20256 - SURFACE
      ?auto_20272 - PLACE
      ?auto_20279 - HOIST
      ?auto_20271 - SURFACE
      ?auto_20269 - PLACE
      ?auto_20280 - HOIST
      ?auto_20266 - SURFACE
      ?auto_20278 - PLACE
      ?auto_20259 - HOIST
      ?auto_20268 - SURFACE
      ?auto_20264 - PLACE
      ?auto_20281 - HOIST
      ?auto_20273 - SURFACE
      ?auto_20283 - PLACE
      ?auto_20263 - HOIST
      ?auto_20267 - SURFACE
      ?auto_20275 - SURFACE
      ?auto_20265 - PLACE
      ?auto_20262 - HOIST
      ?auto_20282 - SURFACE
      ?auto_20258 - PLACE
      ?auto_20276 - HOIST
      ?auto_20261 - SURFACE
      ?auto_20277 - PLACE
      ?auto_20274 - HOIST
      ?auto_20260 - SURFACE
      ?auto_20270 - SURFACE
      ?auto_20253 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20252 ?auto_20255 ) ( IS-CRATE ?auto_20250 ) ( not ( = ?auto_20257 ?auto_20255 ) ) ( HOIST-AT ?auto_20254 ?auto_20257 ) ( SURFACE-AT ?auto_20250 ?auto_20257 ) ( ON ?auto_20250 ?auto_20256 ) ( CLEAR ?auto_20250 ) ( not ( = ?auto_20251 ?auto_20250 ) ) ( not ( = ?auto_20251 ?auto_20256 ) ) ( not ( = ?auto_20250 ?auto_20256 ) ) ( not ( = ?auto_20252 ?auto_20254 ) ) ( IS-CRATE ?auto_20251 ) ( not ( = ?auto_20272 ?auto_20255 ) ) ( HOIST-AT ?auto_20279 ?auto_20272 ) ( AVAILABLE ?auto_20279 ) ( SURFACE-AT ?auto_20251 ?auto_20272 ) ( ON ?auto_20251 ?auto_20271 ) ( CLEAR ?auto_20251 ) ( not ( = ?auto_20246 ?auto_20251 ) ) ( not ( = ?auto_20246 ?auto_20271 ) ) ( not ( = ?auto_20251 ?auto_20271 ) ) ( not ( = ?auto_20252 ?auto_20279 ) ) ( IS-CRATE ?auto_20246 ) ( not ( = ?auto_20269 ?auto_20255 ) ) ( HOIST-AT ?auto_20280 ?auto_20269 ) ( SURFACE-AT ?auto_20246 ?auto_20269 ) ( ON ?auto_20246 ?auto_20266 ) ( CLEAR ?auto_20246 ) ( not ( = ?auto_20248 ?auto_20246 ) ) ( not ( = ?auto_20248 ?auto_20266 ) ) ( not ( = ?auto_20246 ?auto_20266 ) ) ( not ( = ?auto_20252 ?auto_20280 ) ) ( IS-CRATE ?auto_20248 ) ( not ( = ?auto_20278 ?auto_20255 ) ) ( HOIST-AT ?auto_20259 ?auto_20278 ) ( AVAILABLE ?auto_20259 ) ( SURFACE-AT ?auto_20248 ?auto_20278 ) ( ON ?auto_20248 ?auto_20268 ) ( CLEAR ?auto_20248 ) ( not ( = ?auto_20249 ?auto_20248 ) ) ( not ( = ?auto_20249 ?auto_20268 ) ) ( not ( = ?auto_20248 ?auto_20268 ) ) ( not ( = ?auto_20252 ?auto_20259 ) ) ( IS-CRATE ?auto_20249 ) ( not ( = ?auto_20264 ?auto_20255 ) ) ( HOIST-AT ?auto_20281 ?auto_20264 ) ( AVAILABLE ?auto_20281 ) ( SURFACE-AT ?auto_20249 ?auto_20264 ) ( ON ?auto_20249 ?auto_20273 ) ( CLEAR ?auto_20249 ) ( not ( = ?auto_20245 ?auto_20249 ) ) ( not ( = ?auto_20245 ?auto_20273 ) ) ( not ( = ?auto_20249 ?auto_20273 ) ) ( not ( = ?auto_20252 ?auto_20281 ) ) ( IS-CRATE ?auto_20245 ) ( not ( = ?auto_20283 ?auto_20255 ) ) ( HOIST-AT ?auto_20263 ?auto_20283 ) ( AVAILABLE ?auto_20263 ) ( SURFACE-AT ?auto_20245 ?auto_20283 ) ( ON ?auto_20245 ?auto_20267 ) ( CLEAR ?auto_20245 ) ( not ( = ?auto_20247 ?auto_20245 ) ) ( not ( = ?auto_20247 ?auto_20267 ) ) ( not ( = ?auto_20245 ?auto_20267 ) ) ( not ( = ?auto_20252 ?auto_20263 ) ) ( IS-CRATE ?auto_20247 ) ( AVAILABLE ?auto_20254 ) ( SURFACE-AT ?auto_20247 ?auto_20257 ) ( ON ?auto_20247 ?auto_20275 ) ( CLEAR ?auto_20247 ) ( not ( = ?auto_20244 ?auto_20247 ) ) ( not ( = ?auto_20244 ?auto_20275 ) ) ( not ( = ?auto_20247 ?auto_20275 ) ) ( IS-CRATE ?auto_20244 ) ( not ( = ?auto_20265 ?auto_20255 ) ) ( HOIST-AT ?auto_20262 ?auto_20265 ) ( AVAILABLE ?auto_20262 ) ( SURFACE-AT ?auto_20244 ?auto_20265 ) ( ON ?auto_20244 ?auto_20282 ) ( CLEAR ?auto_20244 ) ( not ( = ?auto_20243 ?auto_20244 ) ) ( not ( = ?auto_20243 ?auto_20282 ) ) ( not ( = ?auto_20244 ?auto_20282 ) ) ( not ( = ?auto_20252 ?auto_20262 ) ) ( IS-CRATE ?auto_20243 ) ( not ( = ?auto_20258 ?auto_20255 ) ) ( HOIST-AT ?auto_20276 ?auto_20258 ) ( AVAILABLE ?auto_20276 ) ( SURFACE-AT ?auto_20243 ?auto_20258 ) ( ON ?auto_20243 ?auto_20261 ) ( CLEAR ?auto_20243 ) ( not ( = ?auto_20242 ?auto_20243 ) ) ( not ( = ?auto_20242 ?auto_20261 ) ) ( not ( = ?auto_20243 ?auto_20261 ) ) ( not ( = ?auto_20252 ?auto_20276 ) ) ( IS-CRATE ?auto_20242 ) ( not ( = ?auto_20277 ?auto_20255 ) ) ( HOIST-AT ?auto_20274 ?auto_20277 ) ( AVAILABLE ?auto_20274 ) ( SURFACE-AT ?auto_20242 ?auto_20277 ) ( ON ?auto_20242 ?auto_20260 ) ( CLEAR ?auto_20242 ) ( not ( = ?auto_20241 ?auto_20242 ) ) ( not ( = ?auto_20241 ?auto_20260 ) ) ( not ( = ?auto_20242 ?auto_20260 ) ) ( not ( = ?auto_20252 ?auto_20274 ) ) ( SURFACE-AT ?auto_20240 ?auto_20255 ) ( CLEAR ?auto_20240 ) ( IS-CRATE ?auto_20241 ) ( AVAILABLE ?auto_20252 ) ( AVAILABLE ?auto_20280 ) ( SURFACE-AT ?auto_20241 ?auto_20269 ) ( ON ?auto_20241 ?auto_20270 ) ( CLEAR ?auto_20241 ) ( TRUCK-AT ?auto_20253 ?auto_20255 ) ( not ( = ?auto_20240 ?auto_20241 ) ) ( not ( = ?auto_20240 ?auto_20270 ) ) ( not ( = ?auto_20241 ?auto_20270 ) ) ( not ( = ?auto_20240 ?auto_20242 ) ) ( not ( = ?auto_20240 ?auto_20260 ) ) ( not ( = ?auto_20242 ?auto_20270 ) ) ( not ( = ?auto_20277 ?auto_20269 ) ) ( not ( = ?auto_20274 ?auto_20280 ) ) ( not ( = ?auto_20260 ?auto_20270 ) ) ( not ( = ?auto_20240 ?auto_20243 ) ) ( not ( = ?auto_20240 ?auto_20261 ) ) ( not ( = ?auto_20241 ?auto_20243 ) ) ( not ( = ?auto_20241 ?auto_20261 ) ) ( not ( = ?auto_20243 ?auto_20260 ) ) ( not ( = ?auto_20243 ?auto_20270 ) ) ( not ( = ?auto_20258 ?auto_20277 ) ) ( not ( = ?auto_20258 ?auto_20269 ) ) ( not ( = ?auto_20276 ?auto_20274 ) ) ( not ( = ?auto_20276 ?auto_20280 ) ) ( not ( = ?auto_20261 ?auto_20260 ) ) ( not ( = ?auto_20261 ?auto_20270 ) ) ( not ( = ?auto_20240 ?auto_20244 ) ) ( not ( = ?auto_20240 ?auto_20282 ) ) ( not ( = ?auto_20241 ?auto_20244 ) ) ( not ( = ?auto_20241 ?auto_20282 ) ) ( not ( = ?auto_20242 ?auto_20244 ) ) ( not ( = ?auto_20242 ?auto_20282 ) ) ( not ( = ?auto_20244 ?auto_20261 ) ) ( not ( = ?auto_20244 ?auto_20260 ) ) ( not ( = ?auto_20244 ?auto_20270 ) ) ( not ( = ?auto_20265 ?auto_20258 ) ) ( not ( = ?auto_20265 ?auto_20277 ) ) ( not ( = ?auto_20265 ?auto_20269 ) ) ( not ( = ?auto_20262 ?auto_20276 ) ) ( not ( = ?auto_20262 ?auto_20274 ) ) ( not ( = ?auto_20262 ?auto_20280 ) ) ( not ( = ?auto_20282 ?auto_20261 ) ) ( not ( = ?auto_20282 ?auto_20260 ) ) ( not ( = ?auto_20282 ?auto_20270 ) ) ( not ( = ?auto_20240 ?auto_20247 ) ) ( not ( = ?auto_20240 ?auto_20275 ) ) ( not ( = ?auto_20241 ?auto_20247 ) ) ( not ( = ?auto_20241 ?auto_20275 ) ) ( not ( = ?auto_20242 ?auto_20247 ) ) ( not ( = ?auto_20242 ?auto_20275 ) ) ( not ( = ?auto_20243 ?auto_20247 ) ) ( not ( = ?auto_20243 ?auto_20275 ) ) ( not ( = ?auto_20247 ?auto_20282 ) ) ( not ( = ?auto_20247 ?auto_20261 ) ) ( not ( = ?auto_20247 ?auto_20260 ) ) ( not ( = ?auto_20247 ?auto_20270 ) ) ( not ( = ?auto_20257 ?auto_20265 ) ) ( not ( = ?auto_20257 ?auto_20258 ) ) ( not ( = ?auto_20257 ?auto_20277 ) ) ( not ( = ?auto_20257 ?auto_20269 ) ) ( not ( = ?auto_20254 ?auto_20262 ) ) ( not ( = ?auto_20254 ?auto_20276 ) ) ( not ( = ?auto_20254 ?auto_20274 ) ) ( not ( = ?auto_20254 ?auto_20280 ) ) ( not ( = ?auto_20275 ?auto_20282 ) ) ( not ( = ?auto_20275 ?auto_20261 ) ) ( not ( = ?auto_20275 ?auto_20260 ) ) ( not ( = ?auto_20275 ?auto_20270 ) ) ( not ( = ?auto_20240 ?auto_20245 ) ) ( not ( = ?auto_20240 ?auto_20267 ) ) ( not ( = ?auto_20241 ?auto_20245 ) ) ( not ( = ?auto_20241 ?auto_20267 ) ) ( not ( = ?auto_20242 ?auto_20245 ) ) ( not ( = ?auto_20242 ?auto_20267 ) ) ( not ( = ?auto_20243 ?auto_20245 ) ) ( not ( = ?auto_20243 ?auto_20267 ) ) ( not ( = ?auto_20244 ?auto_20245 ) ) ( not ( = ?auto_20244 ?auto_20267 ) ) ( not ( = ?auto_20245 ?auto_20275 ) ) ( not ( = ?auto_20245 ?auto_20282 ) ) ( not ( = ?auto_20245 ?auto_20261 ) ) ( not ( = ?auto_20245 ?auto_20260 ) ) ( not ( = ?auto_20245 ?auto_20270 ) ) ( not ( = ?auto_20283 ?auto_20257 ) ) ( not ( = ?auto_20283 ?auto_20265 ) ) ( not ( = ?auto_20283 ?auto_20258 ) ) ( not ( = ?auto_20283 ?auto_20277 ) ) ( not ( = ?auto_20283 ?auto_20269 ) ) ( not ( = ?auto_20263 ?auto_20254 ) ) ( not ( = ?auto_20263 ?auto_20262 ) ) ( not ( = ?auto_20263 ?auto_20276 ) ) ( not ( = ?auto_20263 ?auto_20274 ) ) ( not ( = ?auto_20263 ?auto_20280 ) ) ( not ( = ?auto_20267 ?auto_20275 ) ) ( not ( = ?auto_20267 ?auto_20282 ) ) ( not ( = ?auto_20267 ?auto_20261 ) ) ( not ( = ?auto_20267 ?auto_20260 ) ) ( not ( = ?auto_20267 ?auto_20270 ) ) ( not ( = ?auto_20240 ?auto_20249 ) ) ( not ( = ?auto_20240 ?auto_20273 ) ) ( not ( = ?auto_20241 ?auto_20249 ) ) ( not ( = ?auto_20241 ?auto_20273 ) ) ( not ( = ?auto_20242 ?auto_20249 ) ) ( not ( = ?auto_20242 ?auto_20273 ) ) ( not ( = ?auto_20243 ?auto_20249 ) ) ( not ( = ?auto_20243 ?auto_20273 ) ) ( not ( = ?auto_20244 ?auto_20249 ) ) ( not ( = ?auto_20244 ?auto_20273 ) ) ( not ( = ?auto_20247 ?auto_20249 ) ) ( not ( = ?auto_20247 ?auto_20273 ) ) ( not ( = ?auto_20249 ?auto_20267 ) ) ( not ( = ?auto_20249 ?auto_20275 ) ) ( not ( = ?auto_20249 ?auto_20282 ) ) ( not ( = ?auto_20249 ?auto_20261 ) ) ( not ( = ?auto_20249 ?auto_20260 ) ) ( not ( = ?auto_20249 ?auto_20270 ) ) ( not ( = ?auto_20264 ?auto_20283 ) ) ( not ( = ?auto_20264 ?auto_20257 ) ) ( not ( = ?auto_20264 ?auto_20265 ) ) ( not ( = ?auto_20264 ?auto_20258 ) ) ( not ( = ?auto_20264 ?auto_20277 ) ) ( not ( = ?auto_20264 ?auto_20269 ) ) ( not ( = ?auto_20281 ?auto_20263 ) ) ( not ( = ?auto_20281 ?auto_20254 ) ) ( not ( = ?auto_20281 ?auto_20262 ) ) ( not ( = ?auto_20281 ?auto_20276 ) ) ( not ( = ?auto_20281 ?auto_20274 ) ) ( not ( = ?auto_20281 ?auto_20280 ) ) ( not ( = ?auto_20273 ?auto_20267 ) ) ( not ( = ?auto_20273 ?auto_20275 ) ) ( not ( = ?auto_20273 ?auto_20282 ) ) ( not ( = ?auto_20273 ?auto_20261 ) ) ( not ( = ?auto_20273 ?auto_20260 ) ) ( not ( = ?auto_20273 ?auto_20270 ) ) ( not ( = ?auto_20240 ?auto_20248 ) ) ( not ( = ?auto_20240 ?auto_20268 ) ) ( not ( = ?auto_20241 ?auto_20248 ) ) ( not ( = ?auto_20241 ?auto_20268 ) ) ( not ( = ?auto_20242 ?auto_20248 ) ) ( not ( = ?auto_20242 ?auto_20268 ) ) ( not ( = ?auto_20243 ?auto_20248 ) ) ( not ( = ?auto_20243 ?auto_20268 ) ) ( not ( = ?auto_20244 ?auto_20248 ) ) ( not ( = ?auto_20244 ?auto_20268 ) ) ( not ( = ?auto_20247 ?auto_20248 ) ) ( not ( = ?auto_20247 ?auto_20268 ) ) ( not ( = ?auto_20245 ?auto_20248 ) ) ( not ( = ?auto_20245 ?auto_20268 ) ) ( not ( = ?auto_20248 ?auto_20273 ) ) ( not ( = ?auto_20248 ?auto_20267 ) ) ( not ( = ?auto_20248 ?auto_20275 ) ) ( not ( = ?auto_20248 ?auto_20282 ) ) ( not ( = ?auto_20248 ?auto_20261 ) ) ( not ( = ?auto_20248 ?auto_20260 ) ) ( not ( = ?auto_20248 ?auto_20270 ) ) ( not ( = ?auto_20278 ?auto_20264 ) ) ( not ( = ?auto_20278 ?auto_20283 ) ) ( not ( = ?auto_20278 ?auto_20257 ) ) ( not ( = ?auto_20278 ?auto_20265 ) ) ( not ( = ?auto_20278 ?auto_20258 ) ) ( not ( = ?auto_20278 ?auto_20277 ) ) ( not ( = ?auto_20278 ?auto_20269 ) ) ( not ( = ?auto_20259 ?auto_20281 ) ) ( not ( = ?auto_20259 ?auto_20263 ) ) ( not ( = ?auto_20259 ?auto_20254 ) ) ( not ( = ?auto_20259 ?auto_20262 ) ) ( not ( = ?auto_20259 ?auto_20276 ) ) ( not ( = ?auto_20259 ?auto_20274 ) ) ( not ( = ?auto_20259 ?auto_20280 ) ) ( not ( = ?auto_20268 ?auto_20273 ) ) ( not ( = ?auto_20268 ?auto_20267 ) ) ( not ( = ?auto_20268 ?auto_20275 ) ) ( not ( = ?auto_20268 ?auto_20282 ) ) ( not ( = ?auto_20268 ?auto_20261 ) ) ( not ( = ?auto_20268 ?auto_20260 ) ) ( not ( = ?auto_20268 ?auto_20270 ) ) ( not ( = ?auto_20240 ?auto_20246 ) ) ( not ( = ?auto_20240 ?auto_20266 ) ) ( not ( = ?auto_20241 ?auto_20246 ) ) ( not ( = ?auto_20241 ?auto_20266 ) ) ( not ( = ?auto_20242 ?auto_20246 ) ) ( not ( = ?auto_20242 ?auto_20266 ) ) ( not ( = ?auto_20243 ?auto_20246 ) ) ( not ( = ?auto_20243 ?auto_20266 ) ) ( not ( = ?auto_20244 ?auto_20246 ) ) ( not ( = ?auto_20244 ?auto_20266 ) ) ( not ( = ?auto_20247 ?auto_20246 ) ) ( not ( = ?auto_20247 ?auto_20266 ) ) ( not ( = ?auto_20245 ?auto_20246 ) ) ( not ( = ?auto_20245 ?auto_20266 ) ) ( not ( = ?auto_20249 ?auto_20246 ) ) ( not ( = ?auto_20249 ?auto_20266 ) ) ( not ( = ?auto_20246 ?auto_20268 ) ) ( not ( = ?auto_20246 ?auto_20273 ) ) ( not ( = ?auto_20246 ?auto_20267 ) ) ( not ( = ?auto_20246 ?auto_20275 ) ) ( not ( = ?auto_20246 ?auto_20282 ) ) ( not ( = ?auto_20246 ?auto_20261 ) ) ( not ( = ?auto_20246 ?auto_20260 ) ) ( not ( = ?auto_20246 ?auto_20270 ) ) ( not ( = ?auto_20266 ?auto_20268 ) ) ( not ( = ?auto_20266 ?auto_20273 ) ) ( not ( = ?auto_20266 ?auto_20267 ) ) ( not ( = ?auto_20266 ?auto_20275 ) ) ( not ( = ?auto_20266 ?auto_20282 ) ) ( not ( = ?auto_20266 ?auto_20261 ) ) ( not ( = ?auto_20266 ?auto_20260 ) ) ( not ( = ?auto_20266 ?auto_20270 ) ) ( not ( = ?auto_20240 ?auto_20251 ) ) ( not ( = ?auto_20240 ?auto_20271 ) ) ( not ( = ?auto_20241 ?auto_20251 ) ) ( not ( = ?auto_20241 ?auto_20271 ) ) ( not ( = ?auto_20242 ?auto_20251 ) ) ( not ( = ?auto_20242 ?auto_20271 ) ) ( not ( = ?auto_20243 ?auto_20251 ) ) ( not ( = ?auto_20243 ?auto_20271 ) ) ( not ( = ?auto_20244 ?auto_20251 ) ) ( not ( = ?auto_20244 ?auto_20271 ) ) ( not ( = ?auto_20247 ?auto_20251 ) ) ( not ( = ?auto_20247 ?auto_20271 ) ) ( not ( = ?auto_20245 ?auto_20251 ) ) ( not ( = ?auto_20245 ?auto_20271 ) ) ( not ( = ?auto_20249 ?auto_20251 ) ) ( not ( = ?auto_20249 ?auto_20271 ) ) ( not ( = ?auto_20248 ?auto_20251 ) ) ( not ( = ?auto_20248 ?auto_20271 ) ) ( not ( = ?auto_20251 ?auto_20266 ) ) ( not ( = ?auto_20251 ?auto_20268 ) ) ( not ( = ?auto_20251 ?auto_20273 ) ) ( not ( = ?auto_20251 ?auto_20267 ) ) ( not ( = ?auto_20251 ?auto_20275 ) ) ( not ( = ?auto_20251 ?auto_20282 ) ) ( not ( = ?auto_20251 ?auto_20261 ) ) ( not ( = ?auto_20251 ?auto_20260 ) ) ( not ( = ?auto_20251 ?auto_20270 ) ) ( not ( = ?auto_20272 ?auto_20269 ) ) ( not ( = ?auto_20272 ?auto_20278 ) ) ( not ( = ?auto_20272 ?auto_20264 ) ) ( not ( = ?auto_20272 ?auto_20283 ) ) ( not ( = ?auto_20272 ?auto_20257 ) ) ( not ( = ?auto_20272 ?auto_20265 ) ) ( not ( = ?auto_20272 ?auto_20258 ) ) ( not ( = ?auto_20272 ?auto_20277 ) ) ( not ( = ?auto_20279 ?auto_20280 ) ) ( not ( = ?auto_20279 ?auto_20259 ) ) ( not ( = ?auto_20279 ?auto_20281 ) ) ( not ( = ?auto_20279 ?auto_20263 ) ) ( not ( = ?auto_20279 ?auto_20254 ) ) ( not ( = ?auto_20279 ?auto_20262 ) ) ( not ( = ?auto_20279 ?auto_20276 ) ) ( not ( = ?auto_20279 ?auto_20274 ) ) ( not ( = ?auto_20271 ?auto_20266 ) ) ( not ( = ?auto_20271 ?auto_20268 ) ) ( not ( = ?auto_20271 ?auto_20273 ) ) ( not ( = ?auto_20271 ?auto_20267 ) ) ( not ( = ?auto_20271 ?auto_20275 ) ) ( not ( = ?auto_20271 ?auto_20282 ) ) ( not ( = ?auto_20271 ?auto_20261 ) ) ( not ( = ?auto_20271 ?auto_20260 ) ) ( not ( = ?auto_20271 ?auto_20270 ) ) ( not ( = ?auto_20240 ?auto_20250 ) ) ( not ( = ?auto_20240 ?auto_20256 ) ) ( not ( = ?auto_20241 ?auto_20250 ) ) ( not ( = ?auto_20241 ?auto_20256 ) ) ( not ( = ?auto_20242 ?auto_20250 ) ) ( not ( = ?auto_20242 ?auto_20256 ) ) ( not ( = ?auto_20243 ?auto_20250 ) ) ( not ( = ?auto_20243 ?auto_20256 ) ) ( not ( = ?auto_20244 ?auto_20250 ) ) ( not ( = ?auto_20244 ?auto_20256 ) ) ( not ( = ?auto_20247 ?auto_20250 ) ) ( not ( = ?auto_20247 ?auto_20256 ) ) ( not ( = ?auto_20245 ?auto_20250 ) ) ( not ( = ?auto_20245 ?auto_20256 ) ) ( not ( = ?auto_20249 ?auto_20250 ) ) ( not ( = ?auto_20249 ?auto_20256 ) ) ( not ( = ?auto_20248 ?auto_20250 ) ) ( not ( = ?auto_20248 ?auto_20256 ) ) ( not ( = ?auto_20246 ?auto_20250 ) ) ( not ( = ?auto_20246 ?auto_20256 ) ) ( not ( = ?auto_20250 ?auto_20271 ) ) ( not ( = ?auto_20250 ?auto_20266 ) ) ( not ( = ?auto_20250 ?auto_20268 ) ) ( not ( = ?auto_20250 ?auto_20273 ) ) ( not ( = ?auto_20250 ?auto_20267 ) ) ( not ( = ?auto_20250 ?auto_20275 ) ) ( not ( = ?auto_20250 ?auto_20282 ) ) ( not ( = ?auto_20250 ?auto_20261 ) ) ( not ( = ?auto_20250 ?auto_20260 ) ) ( not ( = ?auto_20250 ?auto_20270 ) ) ( not ( = ?auto_20256 ?auto_20271 ) ) ( not ( = ?auto_20256 ?auto_20266 ) ) ( not ( = ?auto_20256 ?auto_20268 ) ) ( not ( = ?auto_20256 ?auto_20273 ) ) ( not ( = ?auto_20256 ?auto_20267 ) ) ( not ( = ?auto_20256 ?auto_20275 ) ) ( not ( = ?auto_20256 ?auto_20282 ) ) ( not ( = ?auto_20256 ?auto_20261 ) ) ( not ( = ?auto_20256 ?auto_20260 ) ) ( not ( = ?auto_20256 ?auto_20270 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_20240 ?auto_20241 ?auto_20242 ?auto_20243 ?auto_20244 ?auto_20247 ?auto_20245 ?auto_20249 ?auto_20248 ?auto_20246 ?auto_20251 )
      ( MAKE-1CRATE ?auto_20251 ?auto_20250 )
      ( MAKE-11CRATE-VERIFY ?auto_20240 ?auto_20241 ?auto_20242 ?auto_20243 ?auto_20244 ?auto_20247 ?auto_20245 ?auto_20249 ?auto_20248 ?auto_20246 ?auto_20251 ?auto_20250 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20286 - SURFACE
      ?auto_20287 - SURFACE
    )
    :vars
    (
      ?auto_20288 - HOIST
      ?auto_20289 - PLACE
      ?auto_20291 - PLACE
      ?auto_20292 - HOIST
      ?auto_20293 - SURFACE
      ?auto_20290 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20288 ?auto_20289 ) ( SURFACE-AT ?auto_20286 ?auto_20289 ) ( CLEAR ?auto_20286 ) ( IS-CRATE ?auto_20287 ) ( AVAILABLE ?auto_20288 ) ( not ( = ?auto_20291 ?auto_20289 ) ) ( HOIST-AT ?auto_20292 ?auto_20291 ) ( AVAILABLE ?auto_20292 ) ( SURFACE-AT ?auto_20287 ?auto_20291 ) ( ON ?auto_20287 ?auto_20293 ) ( CLEAR ?auto_20287 ) ( TRUCK-AT ?auto_20290 ?auto_20289 ) ( not ( = ?auto_20286 ?auto_20287 ) ) ( not ( = ?auto_20286 ?auto_20293 ) ) ( not ( = ?auto_20287 ?auto_20293 ) ) ( not ( = ?auto_20288 ?auto_20292 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20290 ?auto_20289 ?auto_20291 )
      ( !LIFT ?auto_20292 ?auto_20287 ?auto_20293 ?auto_20291 )
      ( !LOAD ?auto_20292 ?auto_20287 ?auto_20290 ?auto_20291 )
      ( !DRIVE ?auto_20290 ?auto_20291 ?auto_20289 )
      ( !UNLOAD ?auto_20288 ?auto_20287 ?auto_20290 ?auto_20289 )
      ( !DROP ?auto_20288 ?auto_20287 ?auto_20286 ?auto_20289 )
      ( MAKE-1CRATE-VERIFY ?auto_20286 ?auto_20287 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_20307 - SURFACE
      ?auto_20308 - SURFACE
      ?auto_20309 - SURFACE
      ?auto_20310 - SURFACE
      ?auto_20311 - SURFACE
      ?auto_20314 - SURFACE
      ?auto_20312 - SURFACE
      ?auto_20316 - SURFACE
      ?auto_20315 - SURFACE
      ?auto_20313 - SURFACE
      ?auto_20318 - SURFACE
      ?auto_20317 - SURFACE
      ?auto_20319 - SURFACE
    )
    :vars
    (
      ?auto_20322 - HOIST
      ?auto_20320 - PLACE
      ?auto_20325 - PLACE
      ?auto_20324 - HOIST
      ?auto_20321 - SURFACE
      ?auto_20341 - PLACE
      ?auto_20327 - HOIST
      ?auto_20350 - SURFACE
      ?auto_20326 - PLACE
      ?auto_20342 - HOIST
      ?auto_20352 - SURFACE
      ?auto_20338 - PLACE
      ?auto_20349 - HOIST
      ?auto_20330 - SURFACE
      ?auto_20347 - PLACE
      ?auto_20351 - HOIST
      ?auto_20346 - SURFACE
      ?auto_20335 - PLACE
      ?auto_20354 - HOIST
      ?auto_20339 - SURFACE
      ?auto_20337 - PLACE
      ?auto_20340 - HOIST
      ?auto_20328 - SURFACE
      ?auto_20334 - SURFACE
      ?auto_20336 - PLACE
      ?auto_20353 - HOIST
      ?auto_20331 - SURFACE
      ?auto_20345 - PLACE
      ?auto_20329 - HOIST
      ?auto_20344 - SURFACE
      ?auto_20348 - PLACE
      ?auto_20333 - HOIST
      ?auto_20332 - SURFACE
      ?auto_20343 - SURFACE
      ?auto_20323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20322 ?auto_20320 ) ( IS-CRATE ?auto_20319 ) ( not ( = ?auto_20325 ?auto_20320 ) ) ( HOIST-AT ?auto_20324 ?auto_20325 ) ( AVAILABLE ?auto_20324 ) ( SURFACE-AT ?auto_20319 ?auto_20325 ) ( ON ?auto_20319 ?auto_20321 ) ( CLEAR ?auto_20319 ) ( not ( = ?auto_20317 ?auto_20319 ) ) ( not ( = ?auto_20317 ?auto_20321 ) ) ( not ( = ?auto_20319 ?auto_20321 ) ) ( not ( = ?auto_20322 ?auto_20324 ) ) ( IS-CRATE ?auto_20317 ) ( not ( = ?auto_20341 ?auto_20320 ) ) ( HOIST-AT ?auto_20327 ?auto_20341 ) ( SURFACE-AT ?auto_20317 ?auto_20341 ) ( ON ?auto_20317 ?auto_20350 ) ( CLEAR ?auto_20317 ) ( not ( = ?auto_20318 ?auto_20317 ) ) ( not ( = ?auto_20318 ?auto_20350 ) ) ( not ( = ?auto_20317 ?auto_20350 ) ) ( not ( = ?auto_20322 ?auto_20327 ) ) ( IS-CRATE ?auto_20318 ) ( not ( = ?auto_20326 ?auto_20320 ) ) ( HOIST-AT ?auto_20342 ?auto_20326 ) ( AVAILABLE ?auto_20342 ) ( SURFACE-AT ?auto_20318 ?auto_20326 ) ( ON ?auto_20318 ?auto_20352 ) ( CLEAR ?auto_20318 ) ( not ( = ?auto_20313 ?auto_20318 ) ) ( not ( = ?auto_20313 ?auto_20352 ) ) ( not ( = ?auto_20318 ?auto_20352 ) ) ( not ( = ?auto_20322 ?auto_20342 ) ) ( IS-CRATE ?auto_20313 ) ( not ( = ?auto_20338 ?auto_20320 ) ) ( HOIST-AT ?auto_20349 ?auto_20338 ) ( SURFACE-AT ?auto_20313 ?auto_20338 ) ( ON ?auto_20313 ?auto_20330 ) ( CLEAR ?auto_20313 ) ( not ( = ?auto_20315 ?auto_20313 ) ) ( not ( = ?auto_20315 ?auto_20330 ) ) ( not ( = ?auto_20313 ?auto_20330 ) ) ( not ( = ?auto_20322 ?auto_20349 ) ) ( IS-CRATE ?auto_20315 ) ( not ( = ?auto_20347 ?auto_20320 ) ) ( HOIST-AT ?auto_20351 ?auto_20347 ) ( AVAILABLE ?auto_20351 ) ( SURFACE-AT ?auto_20315 ?auto_20347 ) ( ON ?auto_20315 ?auto_20346 ) ( CLEAR ?auto_20315 ) ( not ( = ?auto_20316 ?auto_20315 ) ) ( not ( = ?auto_20316 ?auto_20346 ) ) ( not ( = ?auto_20315 ?auto_20346 ) ) ( not ( = ?auto_20322 ?auto_20351 ) ) ( IS-CRATE ?auto_20316 ) ( not ( = ?auto_20335 ?auto_20320 ) ) ( HOIST-AT ?auto_20354 ?auto_20335 ) ( AVAILABLE ?auto_20354 ) ( SURFACE-AT ?auto_20316 ?auto_20335 ) ( ON ?auto_20316 ?auto_20339 ) ( CLEAR ?auto_20316 ) ( not ( = ?auto_20312 ?auto_20316 ) ) ( not ( = ?auto_20312 ?auto_20339 ) ) ( not ( = ?auto_20316 ?auto_20339 ) ) ( not ( = ?auto_20322 ?auto_20354 ) ) ( IS-CRATE ?auto_20312 ) ( not ( = ?auto_20337 ?auto_20320 ) ) ( HOIST-AT ?auto_20340 ?auto_20337 ) ( AVAILABLE ?auto_20340 ) ( SURFACE-AT ?auto_20312 ?auto_20337 ) ( ON ?auto_20312 ?auto_20328 ) ( CLEAR ?auto_20312 ) ( not ( = ?auto_20314 ?auto_20312 ) ) ( not ( = ?auto_20314 ?auto_20328 ) ) ( not ( = ?auto_20312 ?auto_20328 ) ) ( not ( = ?auto_20322 ?auto_20340 ) ) ( IS-CRATE ?auto_20314 ) ( AVAILABLE ?auto_20327 ) ( SURFACE-AT ?auto_20314 ?auto_20341 ) ( ON ?auto_20314 ?auto_20334 ) ( CLEAR ?auto_20314 ) ( not ( = ?auto_20311 ?auto_20314 ) ) ( not ( = ?auto_20311 ?auto_20334 ) ) ( not ( = ?auto_20314 ?auto_20334 ) ) ( IS-CRATE ?auto_20311 ) ( not ( = ?auto_20336 ?auto_20320 ) ) ( HOIST-AT ?auto_20353 ?auto_20336 ) ( AVAILABLE ?auto_20353 ) ( SURFACE-AT ?auto_20311 ?auto_20336 ) ( ON ?auto_20311 ?auto_20331 ) ( CLEAR ?auto_20311 ) ( not ( = ?auto_20310 ?auto_20311 ) ) ( not ( = ?auto_20310 ?auto_20331 ) ) ( not ( = ?auto_20311 ?auto_20331 ) ) ( not ( = ?auto_20322 ?auto_20353 ) ) ( IS-CRATE ?auto_20310 ) ( not ( = ?auto_20345 ?auto_20320 ) ) ( HOIST-AT ?auto_20329 ?auto_20345 ) ( AVAILABLE ?auto_20329 ) ( SURFACE-AT ?auto_20310 ?auto_20345 ) ( ON ?auto_20310 ?auto_20344 ) ( CLEAR ?auto_20310 ) ( not ( = ?auto_20309 ?auto_20310 ) ) ( not ( = ?auto_20309 ?auto_20344 ) ) ( not ( = ?auto_20310 ?auto_20344 ) ) ( not ( = ?auto_20322 ?auto_20329 ) ) ( IS-CRATE ?auto_20309 ) ( not ( = ?auto_20348 ?auto_20320 ) ) ( HOIST-AT ?auto_20333 ?auto_20348 ) ( AVAILABLE ?auto_20333 ) ( SURFACE-AT ?auto_20309 ?auto_20348 ) ( ON ?auto_20309 ?auto_20332 ) ( CLEAR ?auto_20309 ) ( not ( = ?auto_20308 ?auto_20309 ) ) ( not ( = ?auto_20308 ?auto_20332 ) ) ( not ( = ?auto_20309 ?auto_20332 ) ) ( not ( = ?auto_20322 ?auto_20333 ) ) ( SURFACE-AT ?auto_20307 ?auto_20320 ) ( CLEAR ?auto_20307 ) ( IS-CRATE ?auto_20308 ) ( AVAILABLE ?auto_20322 ) ( AVAILABLE ?auto_20349 ) ( SURFACE-AT ?auto_20308 ?auto_20338 ) ( ON ?auto_20308 ?auto_20343 ) ( CLEAR ?auto_20308 ) ( TRUCK-AT ?auto_20323 ?auto_20320 ) ( not ( = ?auto_20307 ?auto_20308 ) ) ( not ( = ?auto_20307 ?auto_20343 ) ) ( not ( = ?auto_20308 ?auto_20343 ) ) ( not ( = ?auto_20307 ?auto_20309 ) ) ( not ( = ?auto_20307 ?auto_20332 ) ) ( not ( = ?auto_20309 ?auto_20343 ) ) ( not ( = ?auto_20348 ?auto_20338 ) ) ( not ( = ?auto_20333 ?auto_20349 ) ) ( not ( = ?auto_20332 ?auto_20343 ) ) ( not ( = ?auto_20307 ?auto_20310 ) ) ( not ( = ?auto_20307 ?auto_20344 ) ) ( not ( = ?auto_20308 ?auto_20310 ) ) ( not ( = ?auto_20308 ?auto_20344 ) ) ( not ( = ?auto_20310 ?auto_20332 ) ) ( not ( = ?auto_20310 ?auto_20343 ) ) ( not ( = ?auto_20345 ?auto_20348 ) ) ( not ( = ?auto_20345 ?auto_20338 ) ) ( not ( = ?auto_20329 ?auto_20333 ) ) ( not ( = ?auto_20329 ?auto_20349 ) ) ( not ( = ?auto_20344 ?auto_20332 ) ) ( not ( = ?auto_20344 ?auto_20343 ) ) ( not ( = ?auto_20307 ?auto_20311 ) ) ( not ( = ?auto_20307 ?auto_20331 ) ) ( not ( = ?auto_20308 ?auto_20311 ) ) ( not ( = ?auto_20308 ?auto_20331 ) ) ( not ( = ?auto_20309 ?auto_20311 ) ) ( not ( = ?auto_20309 ?auto_20331 ) ) ( not ( = ?auto_20311 ?auto_20344 ) ) ( not ( = ?auto_20311 ?auto_20332 ) ) ( not ( = ?auto_20311 ?auto_20343 ) ) ( not ( = ?auto_20336 ?auto_20345 ) ) ( not ( = ?auto_20336 ?auto_20348 ) ) ( not ( = ?auto_20336 ?auto_20338 ) ) ( not ( = ?auto_20353 ?auto_20329 ) ) ( not ( = ?auto_20353 ?auto_20333 ) ) ( not ( = ?auto_20353 ?auto_20349 ) ) ( not ( = ?auto_20331 ?auto_20344 ) ) ( not ( = ?auto_20331 ?auto_20332 ) ) ( not ( = ?auto_20331 ?auto_20343 ) ) ( not ( = ?auto_20307 ?auto_20314 ) ) ( not ( = ?auto_20307 ?auto_20334 ) ) ( not ( = ?auto_20308 ?auto_20314 ) ) ( not ( = ?auto_20308 ?auto_20334 ) ) ( not ( = ?auto_20309 ?auto_20314 ) ) ( not ( = ?auto_20309 ?auto_20334 ) ) ( not ( = ?auto_20310 ?auto_20314 ) ) ( not ( = ?auto_20310 ?auto_20334 ) ) ( not ( = ?auto_20314 ?auto_20331 ) ) ( not ( = ?auto_20314 ?auto_20344 ) ) ( not ( = ?auto_20314 ?auto_20332 ) ) ( not ( = ?auto_20314 ?auto_20343 ) ) ( not ( = ?auto_20341 ?auto_20336 ) ) ( not ( = ?auto_20341 ?auto_20345 ) ) ( not ( = ?auto_20341 ?auto_20348 ) ) ( not ( = ?auto_20341 ?auto_20338 ) ) ( not ( = ?auto_20327 ?auto_20353 ) ) ( not ( = ?auto_20327 ?auto_20329 ) ) ( not ( = ?auto_20327 ?auto_20333 ) ) ( not ( = ?auto_20327 ?auto_20349 ) ) ( not ( = ?auto_20334 ?auto_20331 ) ) ( not ( = ?auto_20334 ?auto_20344 ) ) ( not ( = ?auto_20334 ?auto_20332 ) ) ( not ( = ?auto_20334 ?auto_20343 ) ) ( not ( = ?auto_20307 ?auto_20312 ) ) ( not ( = ?auto_20307 ?auto_20328 ) ) ( not ( = ?auto_20308 ?auto_20312 ) ) ( not ( = ?auto_20308 ?auto_20328 ) ) ( not ( = ?auto_20309 ?auto_20312 ) ) ( not ( = ?auto_20309 ?auto_20328 ) ) ( not ( = ?auto_20310 ?auto_20312 ) ) ( not ( = ?auto_20310 ?auto_20328 ) ) ( not ( = ?auto_20311 ?auto_20312 ) ) ( not ( = ?auto_20311 ?auto_20328 ) ) ( not ( = ?auto_20312 ?auto_20334 ) ) ( not ( = ?auto_20312 ?auto_20331 ) ) ( not ( = ?auto_20312 ?auto_20344 ) ) ( not ( = ?auto_20312 ?auto_20332 ) ) ( not ( = ?auto_20312 ?auto_20343 ) ) ( not ( = ?auto_20337 ?auto_20341 ) ) ( not ( = ?auto_20337 ?auto_20336 ) ) ( not ( = ?auto_20337 ?auto_20345 ) ) ( not ( = ?auto_20337 ?auto_20348 ) ) ( not ( = ?auto_20337 ?auto_20338 ) ) ( not ( = ?auto_20340 ?auto_20327 ) ) ( not ( = ?auto_20340 ?auto_20353 ) ) ( not ( = ?auto_20340 ?auto_20329 ) ) ( not ( = ?auto_20340 ?auto_20333 ) ) ( not ( = ?auto_20340 ?auto_20349 ) ) ( not ( = ?auto_20328 ?auto_20334 ) ) ( not ( = ?auto_20328 ?auto_20331 ) ) ( not ( = ?auto_20328 ?auto_20344 ) ) ( not ( = ?auto_20328 ?auto_20332 ) ) ( not ( = ?auto_20328 ?auto_20343 ) ) ( not ( = ?auto_20307 ?auto_20316 ) ) ( not ( = ?auto_20307 ?auto_20339 ) ) ( not ( = ?auto_20308 ?auto_20316 ) ) ( not ( = ?auto_20308 ?auto_20339 ) ) ( not ( = ?auto_20309 ?auto_20316 ) ) ( not ( = ?auto_20309 ?auto_20339 ) ) ( not ( = ?auto_20310 ?auto_20316 ) ) ( not ( = ?auto_20310 ?auto_20339 ) ) ( not ( = ?auto_20311 ?auto_20316 ) ) ( not ( = ?auto_20311 ?auto_20339 ) ) ( not ( = ?auto_20314 ?auto_20316 ) ) ( not ( = ?auto_20314 ?auto_20339 ) ) ( not ( = ?auto_20316 ?auto_20328 ) ) ( not ( = ?auto_20316 ?auto_20334 ) ) ( not ( = ?auto_20316 ?auto_20331 ) ) ( not ( = ?auto_20316 ?auto_20344 ) ) ( not ( = ?auto_20316 ?auto_20332 ) ) ( not ( = ?auto_20316 ?auto_20343 ) ) ( not ( = ?auto_20335 ?auto_20337 ) ) ( not ( = ?auto_20335 ?auto_20341 ) ) ( not ( = ?auto_20335 ?auto_20336 ) ) ( not ( = ?auto_20335 ?auto_20345 ) ) ( not ( = ?auto_20335 ?auto_20348 ) ) ( not ( = ?auto_20335 ?auto_20338 ) ) ( not ( = ?auto_20354 ?auto_20340 ) ) ( not ( = ?auto_20354 ?auto_20327 ) ) ( not ( = ?auto_20354 ?auto_20353 ) ) ( not ( = ?auto_20354 ?auto_20329 ) ) ( not ( = ?auto_20354 ?auto_20333 ) ) ( not ( = ?auto_20354 ?auto_20349 ) ) ( not ( = ?auto_20339 ?auto_20328 ) ) ( not ( = ?auto_20339 ?auto_20334 ) ) ( not ( = ?auto_20339 ?auto_20331 ) ) ( not ( = ?auto_20339 ?auto_20344 ) ) ( not ( = ?auto_20339 ?auto_20332 ) ) ( not ( = ?auto_20339 ?auto_20343 ) ) ( not ( = ?auto_20307 ?auto_20315 ) ) ( not ( = ?auto_20307 ?auto_20346 ) ) ( not ( = ?auto_20308 ?auto_20315 ) ) ( not ( = ?auto_20308 ?auto_20346 ) ) ( not ( = ?auto_20309 ?auto_20315 ) ) ( not ( = ?auto_20309 ?auto_20346 ) ) ( not ( = ?auto_20310 ?auto_20315 ) ) ( not ( = ?auto_20310 ?auto_20346 ) ) ( not ( = ?auto_20311 ?auto_20315 ) ) ( not ( = ?auto_20311 ?auto_20346 ) ) ( not ( = ?auto_20314 ?auto_20315 ) ) ( not ( = ?auto_20314 ?auto_20346 ) ) ( not ( = ?auto_20312 ?auto_20315 ) ) ( not ( = ?auto_20312 ?auto_20346 ) ) ( not ( = ?auto_20315 ?auto_20339 ) ) ( not ( = ?auto_20315 ?auto_20328 ) ) ( not ( = ?auto_20315 ?auto_20334 ) ) ( not ( = ?auto_20315 ?auto_20331 ) ) ( not ( = ?auto_20315 ?auto_20344 ) ) ( not ( = ?auto_20315 ?auto_20332 ) ) ( not ( = ?auto_20315 ?auto_20343 ) ) ( not ( = ?auto_20347 ?auto_20335 ) ) ( not ( = ?auto_20347 ?auto_20337 ) ) ( not ( = ?auto_20347 ?auto_20341 ) ) ( not ( = ?auto_20347 ?auto_20336 ) ) ( not ( = ?auto_20347 ?auto_20345 ) ) ( not ( = ?auto_20347 ?auto_20348 ) ) ( not ( = ?auto_20347 ?auto_20338 ) ) ( not ( = ?auto_20351 ?auto_20354 ) ) ( not ( = ?auto_20351 ?auto_20340 ) ) ( not ( = ?auto_20351 ?auto_20327 ) ) ( not ( = ?auto_20351 ?auto_20353 ) ) ( not ( = ?auto_20351 ?auto_20329 ) ) ( not ( = ?auto_20351 ?auto_20333 ) ) ( not ( = ?auto_20351 ?auto_20349 ) ) ( not ( = ?auto_20346 ?auto_20339 ) ) ( not ( = ?auto_20346 ?auto_20328 ) ) ( not ( = ?auto_20346 ?auto_20334 ) ) ( not ( = ?auto_20346 ?auto_20331 ) ) ( not ( = ?auto_20346 ?auto_20344 ) ) ( not ( = ?auto_20346 ?auto_20332 ) ) ( not ( = ?auto_20346 ?auto_20343 ) ) ( not ( = ?auto_20307 ?auto_20313 ) ) ( not ( = ?auto_20307 ?auto_20330 ) ) ( not ( = ?auto_20308 ?auto_20313 ) ) ( not ( = ?auto_20308 ?auto_20330 ) ) ( not ( = ?auto_20309 ?auto_20313 ) ) ( not ( = ?auto_20309 ?auto_20330 ) ) ( not ( = ?auto_20310 ?auto_20313 ) ) ( not ( = ?auto_20310 ?auto_20330 ) ) ( not ( = ?auto_20311 ?auto_20313 ) ) ( not ( = ?auto_20311 ?auto_20330 ) ) ( not ( = ?auto_20314 ?auto_20313 ) ) ( not ( = ?auto_20314 ?auto_20330 ) ) ( not ( = ?auto_20312 ?auto_20313 ) ) ( not ( = ?auto_20312 ?auto_20330 ) ) ( not ( = ?auto_20316 ?auto_20313 ) ) ( not ( = ?auto_20316 ?auto_20330 ) ) ( not ( = ?auto_20313 ?auto_20346 ) ) ( not ( = ?auto_20313 ?auto_20339 ) ) ( not ( = ?auto_20313 ?auto_20328 ) ) ( not ( = ?auto_20313 ?auto_20334 ) ) ( not ( = ?auto_20313 ?auto_20331 ) ) ( not ( = ?auto_20313 ?auto_20344 ) ) ( not ( = ?auto_20313 ?auto_20332 ) ) ( not ( = ?auto_20313 ?auto_20343 ) ) ( not ( = ?auto_20330 ?auto_20346 ) ) ( not ( = ?auto_20330 ?auto_20339 ) ) ( not ( = ?auto_20330 ?auto_20328 ) ) ( not ( = ?auto_20330 ?auto_20334 ) ) ( not ( = ?auto_20330 ?auto_20331 ) ) ( not ( = ?auto_20330 ?auto_20344 ) ) ( not ( = ?auto_20330 ?auto_20332 ) ) ( not ( = ?auto_20330 ?auto_20343 ) ) ( not ( = ?auto_20307 ?auto_20318 ) ) ( not ( = ?auto_20307 ?auto_20352 ) ) ( not ( = ?auto_20308 ?auto_20318 ) ) ( not ( = ?auto_20308 ?auto_20352 ) ) ( not ( = ?auto_20309 ?auto_20318 ) ) ( not ( = ?auto_20309 ?auto_20352 ) ) ( not ( = ?auto_20310 ?auto_20318 ) ) ( not ( = ?auto_20310 ?auto_20352 ) ) ( not ( = ?auto_20311 ?auto_20318 ) ) ( not ( = ?auto_20311 ?auto_20352 ) ) ( not ( = ?auto_20314 ?auto_20318 ) ) ( not ( = ?auto_20314 ?auto_20352 ) ) ( not ( = ?auto_20312 ?auto_20318 ) ) ( not ( = ?auto_20312 ?auto_20352 ) ) ( not ( = ?auto_20316 ?auto_20318 ) ) ( not ( = ?auto_20316 ?auto_20352 ) ) ( not ( = ?auto_20315 ?auto_20318 ) ) ( not ( = ?auto_20315 ?auto_20352 ) ) ( not ( = ?auto_20318 ?auto_20330 ) ) ( not ( = ?auto_20318 ?auto_20346 ) ) ( not ( = ?auto_20318 ?auto_20339 ) ) ( not ( = ?auto_20318 ?auto_20328 ) ) ( not ( = ?auto_20318 ?auto_20334 ) ) ( not ( = ?auto_20318 ?auto_20331 ) ) ( not ( = ?auto_20318 ?auto_20344 ) ) ( not ( = ?auto_20318 ?auto_20332 ) ) ( not ( = ?auto_20318 ?auto_20343 ) ) ( not ( = ?auto_20326 ?auto_20338 ) ) ( not ( = ?auto_20326 ?auto_20347 ) ) ( not ( = ?auto_20326 ?auto_20335 ) ) ( not ( = ?auto_20326 ?auto_20337 ) ) ( not ( = ?auto_20326 ?auto_20341 ) ) ( not ( = ?auto_20326 ?auto_20336 ) ) ( not ( = ?auto_20326 ?auto_20345 ) ) ( not ( = ?auto_20326 ?auto_20348 ) ) ( not ( = ?auto_20342 ?auto_20349 ) ) ( not ( = ?auto_20342 ?auto_20351 ) ) ( not ( = ?auto_20342 ?auto_20354 ) ) ( not ( = ?auto_20342 ?auto_20340 ) ) ( not ( = ?auto_20342 ?auto_20327 ) ) ( not ( = ?auto_20342 ?auto_20353 ) ) ( not ( = ?auto_20342 ?auto_20329 ) ) ( not ( = ?auto_20342 ?auto_20333 ) ) ( not ( = ?auto_20352 ?auto_20330 ) ) ( not ( = ?auto_20352 ?auto_20346 ) ) ( not ( = ?auto_20352 ?auto_20339 ) ) ( not ( = ?auto_20352 ?auto_20328 ) ) ( not ( = ?auto_20352 ?auto_20334 ) ) ( not ( = ?auto_20352 ?auto_20331 ) ) ( not ( = ?auto_20352 ?auto_20344 ) ) ( not ( = ?auto_20352 ?auto_20332 ) ) ( not ( = ?auto_20352 ?auto_20343 ) ) ( not ( = ?auto_20307 ?auto_20317 ) ) ( not ( = ?auto_20307 ?auto_20350 ) ) ( not ( = ?auto_20308 ?auto_20317 ) ) ( not ( = ?auto_20308 ?auto_20350 ) ) ( not ( = ?auto_20309 ?auto_20317 ) ) ( not ( = ?auto_20309 ?auto_20350 ) ) ( not ( = ?auto_20310 ?auto_20317 ) ) ( not ( = ?auto_20310 ?auto_20350 ) ) ( not ( = ?auto_20311 ?auto_20317 ) ) ( not ( = ?auto_20311 ?auto_20350 ) ) ( not ( = ?auto_20314 ?auto_20317 ) ) ( not ( = ?auto_20314 ?auto_20350 ) ) ( not ( = ?auto_20312 ?auto_20317 ) ) ( not ( = ?auto_20312 ?auto_20350 ) ) ( not ( = ?auto_20316 ?auto_20317 ) ) ( not ( = ?auto_20316 ?auto_20350 ) ) ( not ( = ?auto_20315 ?auto_20317 ) ) ( not ( = ?auto_20315 ?auto_20350 ) ) ( not ( = ?auto_20313 ?auto_20317 ) ) ( not ( = ?auto_20313 ?auto_20350 ) ) ( not ( = ?auto_20317 ?auto_20352 ) ) ( not ( = ?auto_20317 ?auto_20330 ) ) ( not ( = ?auto_20317 ?auto_20346 ) ) ( not ( = ?auto_20317 ?auto_20339 ) ) ( not ( = ?auto_20317 ?auto_20328 ) ) ( not ( = ?auto_20317 ?auto_20334 ) ) ( not ( = ?auto_20317 ?auto_20331 ) ) ( not ( = ?auto_20317 ?auto_20344 ) ) ( not ( = ?auto_20317 ?auto_20332 ) ) ( not ( = ?auto_20317 ?auto_20343 ) ) ( not ( = ?auto_20350 ?auto_20352 ) ) ( not ( = ?auto_20350 ?auto_20330 ) ) ( not ( = ?auto_20350 ?auto_20346 ) ) ( not ( = ?auto_20350 ?auto_20339 ) ) ( not ( = ?auto_20350 ?auto_20328 ) ) ( not ( = ?auto_20350 ?auto_20334 ) ) ( not ( = ?auto_20350 ?auto_20331 ) ) ( not ( = ?auto_20350 ?auto_20344 ) ) ( not ( = ?auto_20350 ?auto_20332 ) ) ( not ( = ?auto_20350 ?auto_20343 ) ) ( not ( = ?auto_20307 ?auto_20319 ) ) ( not ( = ?auto_20307 ?auto_20321 ) ) ( not ( = ?auto_20308 ?auto_20319 ) ) ( not ( = ?auto_20308 ?auto_20321 ) ) ( not ( = ?auto_20309 ?auto_20319 ) ) ( not ( = ?auto_20309 ?auto_20321 ) ) ( not ( = ?auto_20310 ?auto_20319 ) ) ( not ( = ?auto_20310 ?auto_20321 ) ) ( not ( = ?auto_20311 ?auto_20319 ) ) ( not ( = ?auto_20311 ?auto_20321 ) ) ( not ( = ?auto_20314 ?auto_20319 ) ) ( not ( = ?auto_20314 ?auto_20321 ) ) ( not ( = ?auto_20312 ?auto_20319 ) ) ( not ( = ?auto_20312 ?auto_20321 ) ) ( not ( = ?auto_20316 ?auto_20319 ) ) ( not ( = ?auto_20316 ?auto_20321 ) ) ( not ( = ?auto_20315 ?auto_20319 ) ) ( not ( = ?auto_20315 ?auto_20321 ) ) ( not ( = ?auto_20313 ?auto_20319 ) ) ( not ( = ?auto_20313 ?auto_20321 ) ) ( not ( = ?auto_20318 ?auto_20319 ) ) ( not ( = ?auto_20318 ?auto_20321 ) ) ( not ( = ?auto_20319 ?auto_20350 ) ) ( not ( = ?auto_20319 ?auto_20352 ) ) ( not ( = ?auto_20319 ?auto_20330 ) ) ( not ( = ?auto_20319 ?auto_20346 ) ) ( not ( = ?auto_20319 ?auto_20339 ) ) ( not ( = ?auto_20319 ?auto_20328 ) ) ( not ( = ?auto_20319 ?auto_20334 ) ) ( not ( = ?auto_20319 ?auto_20331 ) ) ( not ( = ?auto_20319 ?auto_20344 ) ) ( not ( = ?auto_20319 ?auto_20332 ) ) ( not ( = ?auto_20319 ?auto_20343 ) ) ( not ( = ?auto_20325 ?auto_20341 ) ) ( not ( = ?auto_20325 ?auto_20326 ) ) ( not ( = ?auto_20325 ?auto_20338 ) ) ( not ( = ?auto_20325 ?auto_20347 ) ) ( not ( = ?auto_20325 ?auto_20335 ) ) ( not ( = ?auto_20325 ?auto_20337 ) ) ( not ( = ?auto_20325 ?auto_20336 ) ) ( not ( = ?auto_20325 ?auto_20345 ) ) ( not ( = ?auto_20325 ?auto_20348 ) ) ( not ( = ?auto_20324 ?auto_20327 ) ) ( not ( = ?auto_20324 ?auto_20342 ) ) ( not ( = ?auto_20324 ?auto_20349 ) ) ( not ( = ?auto_20324 ?auto_20351 ) ) ( not ( = ?auto_20324 ?auto_20354 ) ) ( not ( = ?auto_20324 ?auto_20340 ) ) ( not ( = ?auto_20324 ?auto_20353 ) ) ( not ( = ?auto_20324 ?auto_20329 ) ) ( not ( = ?auto_20324 ?auto_20333 ) ) ( not ( = ?auto_20321 ?auto_20350 ) ) ( not ( = ?auto_20321 ?auto_20352 ) ) ( not ( = ?auto_20321 ?auto_20330 ) ) ( not ( = ?auto_20321 ?auto_20346 ) ) ( not ( = ?auto_20321 ?auto_20339 ) ) ( not ( = ?auto_20321 ?auto_20328 ) ) ( not ( = ?auto_20321 ?auto_20334 ) ) ( not ( = ?auto_20321 ?auto_20331 ) ) ( not ( = ?auto_20321 ?auto_20344 ) ) ( not ( = ?auto_20321 ?auto_20332 ) ) ( not ( = ?auto_20321 ?auto_20343 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_20307 ?auto_20308 ?auto_20309 ?auto_20310 ?auto_20311 ?auto_20314 ?auto_20312 ?auto_20316 ?auto_20315 ?auto_20313 ?auto_20318 ?auto_20317 )
      ( MAKE-1CRATE ?auto_20317 ?auto_20319 )
      ( MAKE-12CRATE-VERIFY ?auto_20307 ?auto_20308 ?auto_20309 ?auto_20310 ?auto_20311 ?auto_20314 ?auto_20312 ?auto_20316 ?auto_20315 ?auto_20313 ?auto_20318 ?auto_20317 ?auto_20319 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20357 - SURFACE
      ?auto_20358 - SURFACE
    )
    :vars
    (
      ?auto_20359 - HOIST
      ?auto_20360 - PLACE
      ?auto_20362 - PLACE
      ?auto_20363 - HOIST
      ?auto_20364 - SURFACE
      ?auto_20361 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20359 ?auto_20360 ) ( SURFACE-AT ?auto_20357 ?auto_20360 ) ( CLEAR ?auto_20357 ) ( IS-CRATE ?auto_20358 ) ( AVAILABLE ?auto_20359 ) ( not ( = ?auto_20362 ?auto_20360 ) ) ( HOIST-AT ?auto_20363 ?auto_20362 ) ( AVAILABLE ?auto_20363 ) ( SURFACE-AT ?auto_20358 ?auto_20362 ) ( ON ?auto_20358 ?auto_20364 ) ( CLEAR ?auto_20358 ) ( TRUCK-AT ?auto_20361 ?auto_20360 ) ( not ( = ?auto_20357 ?auto_20358 ) ) ( not ( = ?auto_20357 ?auto_20364 ) ) ( not ( = ?auto_20358 ?auto_20364 ) ) ( not ( = ?auto_20359 ?auto_20363 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20361 ?auto_20360 ?auto_20362 )
      ( !LIFT ?auto_20363 ?auto_20358 ?auto_20364 ?auto_20362 )
      ( !LOAD ?auto_20363 ?auto_20358 ?auto_20361 ?auto_20362 )
      ( !DRIVE ?auto_20361 ?auto_20362 ?auto_20360 )
      ( !UNLOAD ?auto_20359 ?auto_20358 ?auto_20361 ?auto_20360 )
      ( !DROP ?auto_20359 ?auto_20358 ?auto_20357 ?auto_20360 )
      ( MAKE-1CRATE-VERIFY ?auto_20357 ?auto_20358 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_20379 - SURFACE
      ?auto_20380 - SURFACE
      ?auto_20381 - SURFACE
      ?auto_20382 - SURFACE
      ?auto_20383 - SURFACE
      ?auto_20386 - SURFACE
      ?auto_20384 - SURFACE
      ?auto_20388 - SURFACE
      ?auto_20387 - SURFACE
      ?auto_20385 - SURFACE
      ?auto_20390 - SURFACE
      ?auto_20389 - SURFACE
      ?auto_20391 - SURFACE
      ?auto_20392 - SURFACE
    )
    :vars
    (
      ?auto_20394 - HOIST
      ?auto_20396 - PLACE
      ?auto_20397 - PLACE
      ?auto_20393 - HOIST
      ?auto_20395 - SURFACE
      ?auto_20422 - PLACE
      ?auto_20411 - HOIST
      ?auto_20404 - SURFACE
      ?auto_20416 - PLACE
      ?auto_20417 - HOIST
      ?auto_20421 - SURFACE
      ?auto_20401 - SURFACE
      ?auto_20399 - PLACE
      ?auto_20403 - HOIST
      ?auto_20410 - SURFACE
      ?auto_20427 - PLACE
      ?auto_20400 - HOIST
      ?auto_20414 - SURFACE
      ?auto_20426 - PLACE
      ?auto_20412 - HOIST
      ?auto_20428 - SURFACE
      ?auto_20413 - PLACE
      ?auto_20406 - HOIST
      ?auto_20424 - SURFACE
      ?auto_20415 - SURFACE
      ?auto_20423 - PLACE
      ?auto_20419 - HOIST
      ?auto_20425 - SURFACE
      ?auto_20407 - PLACE
      ?auto_20420 - HOIST
      ?auto_20405 - SURFACE
      ?auto_20409 - PLACE
      ?auto_20402 - HOIST
      ?auto_20418 - SURFACE
      ?auto_20408 - SURFACE
      ?auto_20398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20394 ?auto_20396 ) ( IS-CRATE ?auto_20392 ) ( not ( = ?auto_20397 ?auto_20396 ) ) ( HOIST-AT ?auto_20393 ?auto_20397 ) ( SURFACE-AT ?auto_20392 ?auto_20397 ) ( ON ?auto_20392 ?auto_20395 ) ( CLEAR ?auto_20392 ) ( not ( = ?auto_20391 ?auto_20392 ) ) ( not ( = ?auto_20391 ?auto_20395 ) ) ( not ( = ?auto_20392 ?auto_20395 ) ) ( not ( = ?auto_20394 ?auto_20393 ) ) ( IS-CRATE ?auto_20391 ) ( not ( = ?auto_20422 ?auto_20396 ) ) ( HOIST-AT ?auto_20411 ?auto_20422 ) ( AVAILABLE ?auto_20411 ) ( SURFACE-AT ?auto_20391 ?auto_20422 ) ( ON ?auto_20391 ?auto_20404 ) ( CLEAR ?auto_20391 ) ( not ( = ?auto_20389 ?auto_20391 ) ) ( not ( = ?auto_20389 ?auto_20404 ) ) ( not ( = ?auto_20391 ?auto_20404 ) ) ( not ( = ?auto_20394 ?auto_20411 ) ) ( IS-CRATE ?auto_20389 ) ( not ( = ?auto_20416 ?auto_20396 ) ) ( HOIST-AT ?auto_20417 ?auto_20416 ) ( SURFACE-AT ?auto_20389 ?auto_20416 ) ( ON ?auto_20389 ?auto_20421 ) ( CLEAR ?auto_20389 ) ( not ( = ?auto_20390 ?auto_20389 ) ) ( not ( = ?auto_20390 ?auto_20421 ) ) ( not ( = ?auto_20389 ?auto_20421 ) ) ( not ( = ?auto_20394 ?auto_20417 ) ) ( IS-CRATE ?auto_20390 ) ( AVAILABLE ?auto_20393 ) ( SURFACE-AT ?auto_20390 ?auto_20397 ) ( ON ?auto_20390 ?auto_20401 ) ( CLEAR ?auto_20390 ) ( not ( = ?auto_20385 ?auto_20390 ) ) ( not ( = ?auto_20385 ?auto_20401 ) ) ( not ( = ?auto_20390 ?auto_20401 ) ) ( IS-CRATE ?auto_20385 ) ( not ( = ?auto_20399 ?auto_20396 ) ) ( HOIST-AT ?auto_20403 ?auto_20399 ) ( SURFACE-AT ?auto_20385 ?auto_20399 ) ( ON ?auto_20385 ?auto_20410 ) ( CLEAR ?auto_20385 ) ( not ( = ?auto_20387 ?auto_20385 ) ) ( not ( = ?auto_20387 ?auto_20410 ) ) ( not ( = ?auto_20385 ?auto_20410 ) ) ( not ( = ?auto_20394 ?auto_20403 ) ) ( IS-CRATE ?auto_20387 ) ( not ( = ?auto_20427 ?auto_20396 ) ) ( HOIST-AT ?auto_20400 ?auto_20427 ) ( AVAILABLE ?auto_20400 ) ( SURFACE-AT ?auto_20387 ?auto_20427 ) ( ON ?auto_20387 ?auto_20414 ) ( CLEAR ?auto_20387 ) ( not ( = ?auto_20388 ?auto_20387 ) ) ( not ( = ?auto_20388 ?auto_20414 ) ) ( not ( = ?auto_20387 ?auto_20414 ) ) ( not ( = ?auto_20394 ?auto_20400 ) ) ( IS-CRATE ?auto_20388 ) ( not ( = ?auto_20426 ?auto_20396 ) ) ( HOIST-AT ?auto_20412 ?auto_20426 ) ( AVAILABLE ?auto_20412 ) ( SURFACE-AT ?auto_20388 ?auto_20426 ) ( ON ?auto_20388 ?auto_20428 ) ( CLEAR ?auto_20388 ) ( not ( = ?auto_20384 ?auto_20388 ) ) ( not ( = ?auto_20384 ?auto_20428 ) ) ( not ( = ?auto_20388 ?auto_20428 ) ) ( not ( = ?auto_20394 ?auto_20412 ) ) ( IS-CRATE ?auto_20384 ) ( not ( = ?auto_20413 ?auto_20396 ) ) ( HOIST-AT ?auto_20406 ?auto_20413 ) ( AVAILABLE ?auto_20406 ) ( SURFACE-AT ?auto_20384 ?auto_20413 ) ( ON ?auto_20384 ?auto_20424 ) ( CLEAR ?auto_20384 ) ( not ( = ?auto_20386 ?auto_20384 ) ) ( not ( = ?auto_20386 ?auto_20424 ) ) ( not ( = ?auto_20384 ?auto_20424 ) ) ( not ( = ?auto_20394 ?auto_20406 ) ) ( IS-CRATE ?auto_20386 ) ( AVAILABLE ?auto_20417 ) ( SURFACE-AT ?auto_20386 ?auto_20416 ) ( ON ?auto_20386 ?auto_20415 ) ( CLEAR ?auto_20386 ) ( not ( = ?auto_20383 ?auto_20386 ) ) ( not ( = ?auto_20383 ?auto_20415 ) ) ( not ( = ?auto_20386 ?auto_20415 ) ) ( IS-CRATE ?auto_20383 ) ( not ( = ?auto_20423 ?auto_20396 ) ) ( HOIST-AT ?auto_20419 ?auto_20423 ) ( AVAILABLE ?auto_20419 ) ( SURFACE-AT ?auto_20383 ?auto_20423 ) ( ON ?auto_20383 ?auto_20425 ) ( CLEAR ?auto_20383 ) ( not ( = ?auto_20382 ?auto_20383 ) ) ( not ( = ?auto_20382 ?auto_20425 ) ) ( not ( = ?auto_20383 ?auto_20425 ) ) ( not ( = ?auto_20394 ?auto_20419 ) ) ( IS-CRATE ?auto_20382 ) ( not ( = ?auto_20407 ?auto_20396 ) ) ( HOIST-AT ?auto_20420 ?auto_20407 ) ( AVAILABLE ?auto_20420 ) ( SURFACE-AT ?auto_20382 ?auto_20407 ) ( ON ?auto_20382 ?auto_20405 ) ( CLEAR ?auto_20382 ) ( not ( = ?auto_20381 ?auto_20382 ) ) ( not ( = ?auto_20381 ?auto_20405 ) ) ( not ( = ?auto_20382 ?auto_20405 ) ) ( not ( = ?auto_20394 ?auto_20420 ) ) ( IS-CRATE ?auto_20381 ) ( not ( = ?auto_20409 ?auto_20396 ) ) ( HOIST-AT ?auto_20402 ?auto_20409 ) ( AVAILABLE ?auto_20402 ) ( SURFACE-AT ?auto_20381 ?auto_20409 ) ( ON ?auto_20381 ?auto_20418 ) ( CLEAR ?auto_20381 ) ( not ( = ?auto_20380 ?auto_20381 ) ) ( not ( = ?auto_20380 ?auto_20418 ) ) ( not ( = ?auto_20381 ?auto_20418 ) ) ( not ( = ?auto_20394 ?auto_20402 ) ) ( SURFACE-AT ?auto_20379 ?auto_20396 ) ( CLEAR ?auto_20379 ) ( IS-CRATE ?auto_20380 ) ( AVAILABLE ?auto_20394 ) ( AVAILABLE ?auto_20403 ) ( SURFACE-AT ?auto_20380 ?auto_20399 ) ( ON ?auto_20380 ?auto_20408 ) ( CLEAR ?auto_20380 ) ( TRUCK-AT ?auto_20398 ?auto_20396 ) ( not ( = ?auto_20379 ?auto_20380 ) ) ( not ( = ?auto_20379 ?auto_20408 ) ) ( not ( = ?auto_20380 ?auto_20408 ) ) ( not ( = ?auto_20379 ?auto_20381 ) ) ( not ( = ?auto_20379 ?auto_20418 ) ) ( not ( = ?auto_20381 ?auto_20408 ) ) ( not ( = ?auto_20409 ?auto_20399 ) ) ( not ( = ?auto_20402 ?auto_20403 ) ) ( not ( = ?auto_20418 ?auto_20408 ) ) ( not ( = ?auto_20379 ?auto_20382 ) ) ( not ( = ?auto_20379 ?auto_20405 ) ) ( not ( = ?auto_20380 ?auto_20382 ) ) ( not ( = ?auto_20380 ?auto_20405 ) ) ( not ( = ?auto_20382 ?auto_20418 ) ) ( not ( = ?auto_20382 ?auto_20408 ) ) ( not ( = ?auto_20407 ?auto_20409 ) ) ( not ( = ?auto_20407 ?auto_20399 ) ) ( not ( = ?auto_20420 ?auto_20402 ) ) ( not ( = ?auto_20420 ?auto_20403 ) ) ( not ( = ?auto_20405 ?auto_20418 ) ) ( not ( = ?auto_20405 ?auto_20408 ) ) ( not ( = ?auto_20379 ?auto_20383 ) ) ( not ( = ?auto_20379 ?auto_20425 ) ) ( not ( = ?auto_20380 ?auto_20383 ) ) ( not ( = ?auto_20380 ?auto_20425 ) ) ( not ( = ?auto_20381 ?auto_20383 ) ) ( not ( = ?auto_20381 ?auto_20425 ) ) ( not ( = ?auto_20383 ?auto_20405 ) ) ( not ( = ?auto_20383 ?auto_20418 ) ) ( not ( = ?auto_20383 ?auto_20408 ) ) ( not ( = ?auto_20423 ?auto_20407 ) ) ( not ( = ?auto_20423 ?auto_20409 ) ) ( not ( = ?auto_20423 ?auto_20399 ) ) ( not ( = ?auto_20419 ?auto_20420 ) ) ( not ( = ?auto_20419 ?auto_20402 ) ) ( not ( = ?auto_20419 ?auto_20403 ) ) ( not ( = ?auto_20425 ?auto_20405 ) ) ( not ( = ?auto_20425 ?auto_20418 ) ) ( not ( = ?auto_20425 ?auto_20408 ) ) ( not ( = ?auto_20379 ?auto_20386 ) ) ( not ( = ?auto_20379 ?auto_20415 ) ) ( not ( = ?auto_20380 ?auto_20386 ) ) ( not ( = ?auto_20380 ?auto_20415 ) ) ( not ( = ?auto_20381 ?auto_20386 ) ) ( not ( = ?auto_20381 ?auto_20415 ) ) ( not ( = ?auto_20382 ?auto_20386 ) ) ( not ( = ?auto_20382 ?auto_20415 ) ) ( not ( = ?auto_20386 ?auto_20425 ) ) ( not ( = ?auto_20386 ?auto_20405 ) ) ( not ( = ?auto_20386 ?auto_20418 ) ) ( not ( = ?auto_20386 ?auto_20408 ) ) ( not ( = ?auto_20416 ?auto_20423 ) ) ( not ( = ?auto_20416 ?auto_20407 ) ) ( not ( = ?auto_20416 ?auto_20409 ) ) ( not ( = ?auto_20416 ?auto_20399 ) ) ( not ( = ?auto_20417 ?auto_20419 ) ) ( not ( = ?auto_20417 ?auto_20420 ) ) ( not ( = ?auto_20417 ?auto_20402 ) ) ( not ( = ?auto_20417 ?auto_20403 ) ) ( not ( = ?auto_20415 ?auto_20425 ) ) ( not ( = ?auto_20415 ?auto_20405 ) ) ( not ( = ?auto_20415 ?auto_20418 ) ) ( not ( = ?auto_20415 ?auto_20408 ) ) ( not ( = ?auto_20379 ?auto_20384 ) ) ( not ( = ?auto_20379 ?auto_20424 ) ) ( not ( = ?auto_20380 ?auto_20384 ) ) ( not ( = ?auto_20380 ?auto_20424 ) ) ( not ( = ?auto_20381 ?auto_20384 ) ) ( not ( = ?auto_20381 ?auto_20424 ) ) ( not ( = ?auto_20382 ?auto_20384 ) ) ( not ( = ?auto_20382 ?auto_20424 ) ) ( not ( = ?auto_20383 ?auto_20384 ) ) ( not ( = ?auto_20383 ?auto_20424 ) ) ( not ( = ?auto_20384 ?auto_20415 ) ) ( not ( = ?auto_20384 ?auto_20425 ) ) ( not ( = ?auto_20384 ?auto_20405 ) ) ( not ( = ?auto_20384 ?auto_20418 ) ) ( not ( = ?auto_20384 ?auto_20408 ) ) ( not ( = ?auto_20413 ?auto_20416 ) ) ( not ( = ?auto_20413 ?auto_20423 ) ) ( not ( = ?auto_20413 ?auto_20407 ) ) ( not ( = ?auto_20413 ?auto_20409 ) ) ( not ( = ?auto_20413 ?auto_20399 ) ) ( not ( = ?auto_20406 ?auto_20417 ) ) ( not ( = ?auto_20406 ?auto_20419 ) ) ( not ( = ?auto_20406 ?auto_20420 ) ) ( not ( = ?auto_20406 ?auto_20402 ) ) ( not ( = ?auto_20406 ?auto_20403 ) ) ( not ( = ?auto_20424 ?auto_20415 ) ) ( not ( = ?auto_20424 ?auto_20425 ) ) ( not ( = ?auto_20424 ?auto_20405 ) ) ( not ( = ?auto_20424 ?auto_20418 ) ) ( not ( = ?auto_20424 ?auto_20408 ) ) ( not ( = ?auto_20379 ?auto_20388 ) ) ( not ( = ?auto_20379 ?auto_20428 ) ) ( not ( = ?auto_20380 ?auto_20388 ) ) ( not ( = ?auto_20380 ?auto_20428 ) ) ( not ( = ?auto_20381 ?auto_20388 ) ) ( not ( = ?auto_20381 ?auto_20428 ) ) ( not ( = ?auto_20382 ?auto_20388 ) ) ( not ( = ?auto_20382 ?auto_20428 ) ) ( not ( = ?auto_20383 ?auto_20388 ) ) ( not ( = ?auto_20383 ?auto_20428 ) ) ( not ( = ?auto_20386 ?auto_20388 ) ) ( not ( = ?auto_20386 ?auto_20428 ) ) ( not ( = ?auto_20388 ?auto_20424 ) ) ( not ( = ?auto_20388 ?auto_20415 ) ) ( not ( = ?auto_20388 ?auto_20425 ) ) ( not ( = ?auto_20388 ?auto_20405 ) ) ( not ( = ?auto_20388 ?auto_20418 ) ) ( not ( = ?auto_20388 ?auto_20408 ) ) ( not ( = ?auto_20426 ?auto_20413 ) ) ( not ( = ?auto_20426 ?auto_20416 ) ) ( not ( = ?auto_20426 ?auto_20423 ) ) ( not ( = ?auto_20426 ?auto_20407 ) ) ( not ( = ?auto_20426 ?auto_20409 ) ) ( not ( = ?auto_20426 ?auto_20399 ) ) ( not ( = ?auto_20412 ?auto_20406 ) ) ( not ( = ?auto_20412 ?auto_20417 ) ) ( not ( = ?auto_20412 ?auto_20419 ) ) ( not ( = ?auto_20412 ?auto_20420 ) ) ( not ( = ?auto_20412 ?auto_20402 ) ) ( not ( = ?auto_20412 ?auto_20403 ) ) ( not ( = ?auto_20428 ?auto_20424 ) ) ( not ( = ?auto_20428 ?auto_20415 ) ) ( not ( = ?auto_20428 ?auto_20425 ) ) ( not ( = ?auto_20428 ?auto_20405 ) ) ( not ( = ?auto_20428 ?auto_20418 ) ) ( not ( = ?auto_20428 ?auto_20408 ) ) ( not ( = ?auto_20379 ?auto_20387 ) ) ( not ( = ?auto_20379 ?auto_20414 ) ) ( not ( = ?auto_20380 ?auto_20387 ) ) ( not ( = ?auto_20380 ?auto_20414 ) ) ( not ( = ?auto_20381 ?auto_20387 ) ) ( not ( = ?auto_20381 ?auto_20414 ) ) ( not ( = ?auto_20382 ?auto_20387 ) ) ( not ( = ?auto_20382 ?auto_20414 ) ) ( not ( = ?auto_20383 ?auto_20387 ) ) ( not ( = ?auto_20383 ?auto_20414 ) ) ( not ( = ?auto_20386 ?auto_20387 ) ) ( not ( = ?auto_20386 ?auto_20414 ) ) ( not ( = ?auto_20384 ?auto_20387 ) ) ( not ( = ?auto_20384 ?auto_20414 ) ) ( not ( = ?auto_20387 ?auto_20428 ) ) ( not ( = ?auto_20387 ?auto_20424 ) ) ( not ( = ?auto_20387 ?auto_20415 ) ) ( not ( = ?auto_20387 ?auto_20425 ) ) ( not ( = ?auto_20387 ?auto_20405 ) ) ( not ( = ?auto_20387 ?auto_20418 ) ) ( not ( = ?auto_20387 ?auto_20408 ) ) ( not ( = ?auto_20427 ?auto_20426 ) ) ( not ( = ?auto_20427 ?auto_20413 ) ) ( not ( = ?auto_20427 ?auto_20416 ) ) ( not ( = ?auto_20427 ?auto_20423 ) ) ( not ( = ?auto_20427 ?auto_20407 ) ) ( not ( = ?auto_20427 ?auto_20409 ) ) ( not ( = ?auto_20427 ?auto_20399 ) ) ( not ( = ?auto_20400 ?auto_20412 ) ) ( not ( = ?auto_20400 ?auto_20406 ) ) ( not ( = ?auto_20400 ?auto_20417 ) ) ( not ( = ?auto_20400 ?auto_20419 ) ) ( not ( = ?auto_20400 ?auto_20420 ) ) ( not ( = ?auto_20400 ?auto_20402 ) ) ( not ( = ?auto_20400 ?auto_20403 ) ) ( not ( = ?auto_20414 ?auto_20428 ) ) ( not ( = ?auto_20414 ?auto_20424 ) ) ( not ( = ?auto_20414 ?auto_20415 ) ) ( not ( = ?auto_20414 ?auto_20425 ) ) ( not ( = ?auto_20414 ?auto_20405 ) ) ( not ( = ?auto_20414 ?auto_20418 ) ) ( not ( = ?auto_20414 ?auto_20408 ) ) ( not ( = ?auto_20379 ?auto_20385 ) ) ( not ( = ?auto_20379 ?auto_20410 ) ) ( not ( = ?auto_20380 ?auto_20385 ) ) ( not ( = ?auto_20380 ?auto_20410 ) ) ( not ( = ?auto_20381 ?auto_20385 ) ) ( not ( = ?auto_20381 ?auto_20410 ) ) ( not ( = ?auto_20382 ?auto_20385 ) ) ( not ( = ?auto_20382 ?auto_20410 ) ) ( not ( = ?auto_20383 ?auto_20385 ) ) ( not ( = ?auto_20383 ?auto_20410 ) ) ( not ( = ?auto_20386 ?auto_20385 ) ) ( not ( = ?auto_20386 ?auto_20410 ) ) ( not ( = ?auto_20384 ?auto_20385 ) ) ( not ( = ?auto_20384 ?auto_20410 ) ) ( not ( = ?auto_20388 ?auto_20385 ) ) ( not ( = ?auto_20388 ?auto_20410 ) ) ( not ( = ?auto_20385 ?auto_20414 ) ) ( not ( = ?auto_20385 ?auto_20428 ) ) ( not ( = ?auto_20385 ?auto_20424 ) ) ( not ( = ?auto_20385 ?auto_20415 ) ) ( not ( = ?auto_20385 ?auto_20425 ) ) ( not ( = ?auto_20385 ?auto_20405 ) ) ( not ( = ?auto_20385 ?auto_20418 ) ) ( not ( = ?auto_20385 ?auto_20408 ) ) ( not ( = ?auto_20410 ?auto_20414 ) ) ( not ( = ?auto_20410 ?auto_20428 ) ) ( not ( = ?auto_20410 ?auto_20424 ) ) ( not ( = ?auto_20410 ?auto_20415 ) ) ( not ( = ?auto_20410 ?auto_20425 ) ) ( not ( = ?auto_20410 ?auto_20405 ) ) ( not ( = ?auto_20410 ?auto_20418 ) ) ( not ( = ?auto_20410 ?auto_20408 ) ) ( not ( = ?auto_20379 ?auto_20390 ) ) ( not ( = ?auto_20379 ?auto_20401 ) ) ( not ( = ?auto_20380 ?auto_20390 ) ) ( not ( = ?auto_20380 ?auto_20401 ) ) ( not ( = ?auto_20381 ?auto_20390 ) ) ( not ( = ?auto_20381 ?auto_20401 ) ) ( not ( = ?auto_20382 ?auto_20390 ) ) ( not ( = ?auto_20382 ?auto_20401 ) ) ( not ( = ?auto_20383 ?auto_20390 ) ) ( not ( = ?auto_20383 ?auto_20401 ) ) ( not ( = ?auto_20386 ?auto_20390 ) ) ( not ( = ?auto_20386 ?auto_20401 ) ) ( not ( = ?auto_20384 ?auto_20390 ) ) ( not ( = ?auto_20384 ?auto_20401 ) ) ( not ( = ?auto_20388 ?auto_20390 ) ) ( not ( = ?auto_20388 ?auto_20401 ) ) ( not ( = ?auto_20387 ?auto_20390 ) ) ( not ( = ?auto_20387 ?auto_20401 ) ) ( not ( = ?auto_20390 ?auto_20410 ) ) ( not ( = ?auto_20390 ?auto_20414 ) ) ( not ( = ?auto_20390 ?auto_20428 ) ) ( not ( = ?auto_20390 ?auto_20424 ) ) ( not ( = ?auto_20390 ?auto_20415 ) ) ( not ( = ?auto_20390 ?auto_20425 ) ) ( not ( = ?auto_20390 ?auto_20405 ) ) ( not ( = ?auto_20390 ?auto_20418 ) ) ( not ( = ?auto_20390 ?auto_20408 ) ) ( not ( = ?auto_20397 ?auto_20399 ) ) ( not ( = ?auto_20397 ?auto_20427 ) ) ( not ( = ?auto_20397 ?auto_20426 ) ) ( not ( = ?auto_20397 ?auto_20413 ) ) ( not ( = ?auto_20397 ?auto_20416 ) ) ( not ( = ?auto_20397 ?auto_20423 ) ) ( not ( = ?auto_20397 ?auto_20407 ) ) ( not ( = ?auto_20397 ?auto_20409 ) ) ( not ( = ?auto_20393 ?auto_20403 ) ) ( not ( = ?auto_20393 ?auto_20400 ) ) ( not ( = ?auto_20393 ?auto_20412 ) ) ( not ( = ?auto_20393 ?auto_20406 ) ) ( not ( = ?auto_20393 ?auto_20417 ) ) ( not ( = ?auto_20393 ?auto_20419 ) ) ( not ( = ?auto_20393 ?auto_20420 ) ) ( not ( = ?auto_20393 ?auto_20402 ) ) ( not ( = ?auto_20401 ?auto_20410 ) ) ( not ( = ?auto_20401 ?auto_20414 ) ) ( not ( = ?auto_20401 ?auto_20428 ) ) ( not ( = ?auto_20401 ?auto_20424 ) ) ( not ( = ?auto_20401 ?auto_20415 ) ) ( not ( = ?auto_20401 ?auto_20425 ) ) ( not ( = ?auto_20401 ?auto_20405 ) ) ( not ( = ?auto_20401 ?auto_20418 ) ) ( not ( = ?auto_20401 ?auto_20408 ) ) ( not ( = ?auto_20379 ?auto_20389 ) ) ( not ( = ?auto_20379 ?auto_20421 ) ) ( not ( = ?auto_20380 ?auto_20389 ) ) ( not ( = ?auto_20380 ?auto_20421 ) ) ( not ( = ?auto_20381 ?auto_20389 ) ) ( not ( = ?auto_20381 ?auto_20421 ) ) ( not ( = ?auto_20382 ?auto_20389 ) ) ( not ( = ?auto_20382 ?auto_20421 ) ) ( not ( = ?auto_20383 ?auto_20389 ) ) ( not ( = ?auto_20383 ?auto_20421 ) ) ( not ( = ?auto_20386 ?auto_20389 ) ) ( not ( = ?auto_20386 ?auto_20421 ) ) ( not ( = ?auto_20384 ?auto_20389 ) ) ( not ( = ?auto_20384 ?auto_20421 ) ) ( not ( = ?auto_20388 ?auto_20389 ) ) ( not ( = ?auto_20388 ?auto_20421 ) ) ( not ( = ?auto_20387 ?auto_20389 ) ) ( not ( = ?auto_20387 ?auto_20421 ) ) ( not ( = ?auto_20385 ?auto_20389 ) ) ( not ( = ?auto_20385 ?auto_20421 ) ) ( not ( = ?auto_20389 ?auto_20401 ) ) ( not ( = ?auto_20389 ?auto_20410 ) ) ( not ( = ?auto_20389 ?auto_20414 ) ) ( not ( = ?auto_20389 ?auto_20428 ) ) ( not ( = ?auto_20389 ?auto_20424 ) ) ( not ( = ?auto_20389 ?auto_20415 ) ) ( not ( = ?auto_20389 ?auto_20425 ) ) ( not ( = ?auto_20389 ?auto_20405 ) ) ( not ( = ?auto_20389 ?auto_20418 ) ) ( not ( = ?auto_20389 ?auto_20408 ) ) ( not ( = ?auto_20421 ?auto_20401 ) ) ( not ( = ?auto_20421 ?auto_20410 ) ) ( not ( = ?auto_20421 ?auto_20414 ) ) ( not ( = ?auto_20421 ?auto_20428 ) ) ( not ( = ?auto_20421 ?auto_20424 ) ) ( not ( = ?auto_20421 ?auto_20415 ) ) ( not ( = ?auto_20421 ?auto_20425 ) ) ( not ( = ?auto_20421 ?auto_20405 ) ) ( not ( = ?auto_20421 ?auto_20418 ) ) ( not ( = ?auto_20421 ?auto_20408 ) ) ( not ( = ?auto_20379 ?auto_20391 ) ) ( not ( = ?auto_20379 ?auto_20404 ) ) ( not ( = ?auto_20380 ?auto_20391 ) ) ( not ( = ?auto_20380 ?auto_20404 ) ) ( not ( = ?auto_20381 ?auto_20391 ) ) ( not ( = ?auto_20381 ?auto_20404 ) ) ( not ( = ?auto_20382 ?auto_20391 ) ) ( not ( = ?auto_20382 ?auto_20404 ) ) ( not ( = ?auto_20383 ?auto_20391 ) ) ( not ( = ?auto_20383 ?auto_20404 ) ) ( not ( = ?auto_20386 ?auto_20391 ) ) ( not ( = ?auto_20386 ?auto_20404 ) ) ( not ( = ?auto_20384 ?auto_20391 ) ) ( not ( = ?auto_20384 ?auto_20404 ) ) ( not ( = ?auto_20388 ?auto_20391 ) ) ( not ( = ?auto_20388 ?auto_20404 ) ) ( not ( = ?auto_20387 ?auto_20391 ) ) ( not ( = ?auto_20387 ?auto_20404 ) ) ( not ( = ?auto_20385 ?auto_20391 ) ) ( not ( = ?auto_20385 ?auto_20404 ) ) ( not ( = ?auto_20390 ?auto_20391 ) ) ( not ( = ?auto_20390 ?auto_20404 ) ) ( not ( = ?auto_20391 ?auto_20421 ) ) ( not ( = ?auto_20391 ?auto_20401 ) ) ( not ( = ?auto_20391 ?auto_20410 ) ) ( not ( = ?auto_20391 ?auto_20414 ) ) ( not ( = ?auto_20391 ?auto_20428 ) ) ( not ( = ?auto_20391 ?auto_20424 ) ) ( not ( = ?auto_20391 ?auto_20415 ) ) ( not ( = ?auto_20391 ?auto_20425 ) ) ( not ( = ?auto_20391 ?auto_20405 ) ) ( not ( = ?auto_20391 ?auto_20418 ) ) ( not ( = ?auto_20391 ?auto_20408 ) ) ( not ( = ?auto_20422 ?auto_20416 ) ) ( not ( = ?auto_20422 ?auto_20397 ) ) ( not ( = ?auto_20422 ?auto_20399 ) ) ( not ( = ?auto_20422 ?auto_20427 ) ) ( not ( = ?auto_20422 ?auto_20426 ) ) ( not ( = ?auto_20422 ?auto_20413 ) ) ( not ( = ?auto_20422 ?auto_20423 ) ) ( not ( = ?auto_20422 ?auto_20407 ) ) ( not ( = ?auto_20422 ?auto_20409 ) ) ( not ( = ?auto_20411 ?auto_20417 ) ) ( not ( = ?auto_20411 ?auto_20393 ) ) ( not ( = ?auto_20411 ?auto_20403 ) ) ( not ( = ?auto_20411 ?auto_20400 ) ) ( not ( = ?auto_20411 ?auto_20412 ) ) ( not ( = ?auto_20411 ?auto_20406 ) ) ( not ( = ?auto_20411 ?auto_20419 ) ) ( not ( = ?auto_20411 ?auto_20420 ) ) ( not ( = ?auto_20411 ?auto_20402 ) ) ( not ( = ?auto_20404 ?auto_20421 ) ) ( not ( = ?auto_20404 ?auto_20401 ) ) ( not ( = ?auto_20404 ?auto_20410 ) ) ( not ( = ?auto_20404 ?auto_20414 ) ) ( not ( = ?auto_20404 ?auto_20428 ) ) ( not ( = ?auto_20404 ?auto_20424 ) ) ( not ( = ?auto_20404 ?auto_20415 ) ) ( not ( = ?auto_20404 ?auto_20425 ) ) ( not ( = ?auto_20404 ?auto_20405 ) ) ( not ( = ?auto_20404 ?auto_20418 ) ) ( not ( = ?auto_20404 ?auto_20408 ) ) ( not ( = ?auto_20379 ?auto_20392 ) ) ( not ( = ?auto_20379 ?auto_20395 ) ) ( not ( = ?auto_20380 ?auto_20392 ) ) ( not ( = ?auto_20380 ?auto_20395 ) ) ( not ( = ?auto_20381 ?auto_20392 ) ) ( not ( = ?auto_20381 ?auto_20395 ) ) ( not ( = ?auto_20382 ?auto_20392 ) ) ( not ( = ?auto_20382 ?auto_20395 ) ) ( not ( = ?auto_20383 ?auto_20392 ) ) ( not ( = ?auto_20383 ?auto_20395 ) ) ( not ( = ?auto_20386 ?auto_20392 ) ) ( not ( = ?auto_20386 ?auto_20395 ) ) ( not ( = ?auto_20384 ?auto_20392 ) ) ( not ( = ?auto_20384 ?auto_20395 ) ) ( not ( = ?auto_20388 ?auto_20392 ) ) ( not ( = ?auto_20388 ?auto_20395 ) ) ( not ( = ?auto_20387 ?auto_20392 ) ) ( not ( = ?auto_20387 ?auto_20395 ) ) ( not ( = ?auto_20385 ?auto_20392 ) ) ( not ( = ?auto_20385 ?auto_20395 ) ) ( not ( = ?auto_20390 ?auto_20392 ) ) ( not ( = ?auto_20390 ?auto_20395 ) ) ( not ( = ?auto_20389 ?auto_20392 ) ) ( not ( = ?auto_20389 ?auto_20395 ) ) ( not ( = ?auto_20392 ?auto_20404 ) ) ( not ( = ?auto_20392 ?auto_20421 ) ) ( not ( = ?auto_20392 ?auto_20401 ) ) ( not ( = ?auto_20392 ?auto_20410 ) ) ( not ( = ?auto_20392 ?auto_20414 ) ) ( not ( = ?auto_20392 ?auto_20428 ) ) ( not ( = ?auto_20392 ?auto_20424 ) ) ( not ( = ?auto_20392 ?auto_20415 ) ) ( not ( = ?auto_20392 ?auto_20425 ) ) ( not ( = ?auto_20392 ?auto_20405 ) ) ( not ( = ?auto_20392 ?auto_20418 ) ) ( not ( = ?auto_20392 ?auto_20408 ) ) ( not ( = ?auto_20395 ?auto_20404 ) ) ( not ( = ?auto_20395 ?auto_20421 ) ) ( not ( = ?auto_20395 ?auto_20401 ) ) ( not ( = ?auto_20395 ?auto_20410 ) ) ( not ( = ?auto_20395 ?auto_20414 ) ) ( not ( = ?auto_20395 ?auto_20428 ) ) ( not ( = ?auto_20395 ?auto_20424 ) ) ( not ( = ?auto_20395 ?auto_20415 ) ) ( not ( = ?auto_20395 ?auto_20425 ) ) ( not ( = ?auto_20395 ?auto_20405 ) ) ( not ( = ?auto_20395 ?auto_20418 ) ) ( not ( = ?auto_20395 ?auto_20408 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_20379 ?auto_20380 ?auto_20381 ?auto_20382 ?auto_20383 ?auto_20386 ?auto_20384 ?auto_20388 ?auto_20387 ?auto_20385 ?auto_20390 ?auto_20389 ?auto_20391 )
      ( MAKE-1CRATE ?auto_20391 ?auto_20392 )
      ( MAKE-13CRATE-VERIFY ?auto_20379 ?auto_20380 ?auto_20381 ?auto_20382 ?auto_20383 ?auto_20386 ?auto_20384 ?auto_20388 ?auto_20387 ?auto_20385 ?auto_20390 ?auto_20389 ?auto_20391 ?auto_20392 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20431 - SURFACE
      ?auto_20432 - SURFACE
    )
    :vars
    (
      ?auto_20433 - HOIST
      ?auto_20434 - PLACE
      ?auto_20436 - PLACE
      ?auto_20437 - HOIST
      ?auto_20438 - SURFACE
      ?auto_20435 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20433 ?auto_20434 ) ( SURFACE-AT ?auto_20431 ?auto_20434 ) ( CLEAR ?auto_20431 ) ( IS-CRATE ?auto_20432 ) ( AVAILABLE ?auto_20433 ) ( not ( = ?auto_20436 ?auto_20434 ) ) ( HOIST-AT ?auto_20437 ?auto_20436 ) ( AVAILABLE ?auto_20437 ) ( SURFACE-AT ?auto_20432 ?auto_20436 ) ( ON ?auto_20432 ?auto_20438 ) ( CLEAR ?auto_20432 ) ( TRUCK-AT ?auto_20435 ?auto_20434 ) ( not ( = ?auto_20431 ?auto_20432 ) ) ( not ( = ?auto_20431 ?auto_20438 ) ) ( not ( = ?auto_20432 ?auto_20438 ) ) ( not ( = ?auto_20433 ?auto_20437 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20435 ?auto_20434 ?auto_20436 )
      ( !LIFT ?auto_20437 ?auto_20432 ?auto_20438 ?auto_20436 )
      ( !LOAD ?auto_20437 ?auto_20432 ?auto_20435 ?auto_20436 )
      ( !DRIVE ?auto_20435 ?auto_20436 ?auto_20434 )
      ( !UNLOAD ?auto_20433 ?auto_20432 ?auto_20435 ?auto_20434 )
      ( !DROP ?auto_20433 ?auto_20432 ?auto_20431 ?auto_20434 )
      ( MAKE-1CRATE-VERIFY ?auto_20431 ?auto_20432 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_20454 - SURFACE
      ?auto_20455 - SURFACE
      ?auto_20456 - SURFACE
      ?auto_20457 - SURFACE
      ?auto_20458 - SURFACE
      ?auto_20461 - SURFACE
      ?auto_20459 - SURFACE
      ?auto_20463 - SURFACE
      ?auto_20462 - SURFACE
      ?auto_20460 - SURFACE
      ?auto_20465 - SURFACE
      ?auto_20464 - SURFACE
      ?auto_20466 - SURFACE
      ?auto_20467 - SURFACE
      ?auto_20468 - SURFACE
    )
    :vars
    (
      ?auto_20470 - HOIST
      ?auto_20473 - PLACE
      ?auto_20469 - PLACE
      ?auto_20474 - HOIST
      ?auto_20471 - SURFACE
      ?auto_20497 - PLACE
      ?auto_20507 - HOIST
      ?auto_20488 - SURFACE
      ?auto_20504 - PLACE
      ?auto_20485 - HOIST
      ?auto_20478 - SURFACE
      ?auto_20503 - PLACE
      ?auto_20495 - HOIST
      ?auto_20496 - SURFACE
      ?auto_20481 - SURFACE
      ?auto_20506 - PLACE
      ?auto_20492 - HOIST
      ?auto_20501 - SURFACE
      ?auto_20490 - PLACE
      ?auto_20493 - HOIST
      ?auto_20484 - SURFACE
      ?auto_20500 - PLACE
      ?auto_20476 - HOIST
      ?auto_20494 - SURFACE
      ?auto_20487 - PLACE
      ?auto_20502 - HOIST
      ?auto_20477 - SURFACE
      ?auto_20483 - SURFACE
      ?auto_20479 - PLACE
      ?auto_20480 - HOIST
      ?auto_20489 - SURFACE
      ?auto_20475 - PLACE
      ?auto_20482 - HOIST
      ?auto_20499 - SURFACE
      ?auto_20486 - PLACE
      ?auto_20491 - HOIST
      ?auto_20505 - SURFACE
      ?auto_20498 - SURFACE
      ?auto_20472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20470 ?auto_20473 ) ( IS-CRATE ?auto_20468 ) ( not ( = ?auto_20469 ?auto_20473 ) ) ( HOIST-AT ?auto_20474 ?auto_20469 ) ( AVAILABLE ?auto_20474 ) ( SURFACE-AT ?auto_20468 ?auto_20469 ) ( ON ?auto_20468 ?auto_20471 ) ( CLEAR ?auto_20468 ) ( not ( = ?auto_20467 ?auto_20468 ) ) ( not ( = ?auto_20467 ?auto_20471 ) ) ( not ( = ?auto_20468 ?auto_20471 ) ) ( not ( = ?auto_20470 ?auto_20474 ) ) ( IS-CRATE ?auto_20467 ) ( not ( = ?auto_20497 ?auto_20473 ) ) ( HOIST-AT ?auto_20507 ?auto_20497 ) ( SURFACE-AT ?auto_20467 ?auto_20497 ) ( ON ?auto_20467 ?auto_20488 ) ( CLEAR ?auto_20467 ) ( not ( = ?auto_20466 ?auto_20467 ) ) ( not ( = ?auto_20466 ?auto_20488 ) ) ( not ( = ?auto_20467 ?auto_20488 ) ) ( not ( = ?auto_20470 ?auto_20507 ) ) ( IS-CRATE ?auto_20466 ) ( not ( = ?auto_20504 ?auto_20473 ) ) ( HOIST-AT ?auto_20485 ?auto_20504 ) ( AVAILABLE ?auto_20485 ) ( SURFACE-AT ?auto_20466 ?auto_20504 ) ( ON ?auto_20466 ?auto_20478 ) ( CLEAR ?auto_20466 ) ( not ( = ?auto_20464 ?auto_20466 ) ) ( not ( = ?auto_20464 ?auto_20478 ) ) ( not ( = ?auto_20466 ?auto_20478 ) ) ( not ( = ?auto_20470 ?auto_20485 ) ) ( IS-CRATE ?auto_20464 ) ( not ( = ?auto_20503 ?auto_20473 ) ) ( HOIST-AT ?auto_20495 ?auto_20503 ) ( SURFACE-AT ?auto_20464 ?auto_20503 ) ( ON ?auto_20464 ?auto_20496 ) ( CLEAR ?auto_20464 ) ( not ( = ?auto_20465 ?auto_20464 ) ) ( not ( = ?auto_20465 ?auto_20496 ) ) ( not ( = ?auto_20464 ?auto_20496 ) ) ( not ( = ?auto_20470 ?auto_20495 ) ) ( IS-CRATE ?auto_20465 ) ( AVAILABLE ?auto_20507 ) ( SURFACE-AT ?auto_20465 ?auto_20497 ) ( ON ?auto_20465 ?auto_20481 ) ( CLEAR ?auto_20465 ) ( not ( = ?auto_20460 ?auto_20465 ) ) ( not ( = ?auto_20460 ?auto_20481 ) ) ( not ( = ?auto_20465 ?auto_20481 ) ) ( IS-CRATE ?auto_20460 ) ( not ( = ?auto_20506 ?auto_20473 ) ) ( HOIST-AT ?auto_20492 ?auto_20506 ) ( SURFACE-AT ?auto_20460 ?auto_20506 ) ( ON ?auto_20460 ?auto_20501 ) ( CLEAR ?auto_20460 ) ( not ( = ?auto_20462 ?auto_20460 ) ) ( not ( = ?auto_20462 ?auto_20501 ) ) ( not ( = ?auto_20460 ?auto_20501 ) ) ( not ( = ?auto_20470 ?auto_20492 ) ) ( IS-CRATE ?auto_20462 ) ( not ( = ?auto_20490 ?auto_20473 ) ) ( HOIST-AT ?auto_20493 ?auto_20490 ) ( AVAILABLE ?auto_20493 ) ( SURFACE-AT ?auto_20462 ?auto_20490 ) ( ON ?auto_20462 ?auto_20484 ) ( CLEAR ?auto_20462 ) ( not ( = ?auto_20463 ?auto_20462 ) ) ( not ( = ?auto_20463 ?auto_20484 ) ) ( not ( = ?auto_20462 ?auto_20484 ) ) ( not ( = ?auto_20470 ?auto_20493 ) ) ( IS-CRATE ?auto_20463 ) ( not ( = ?auto_20500 ?auto_20473 ) ) ( HOIST-AT ?auto_20476 ?auto_20500 ) ( AVAILABLE ?auto_20476 ) ( SURFACE-AT ?auto_20463 ?auto_20500 ) ( ON ?auto_20463 ?auto_20494 ) ( CLEAR ?auto_20463 ) ( not ( = ?auto_20459 ?auto_20463 ) ) ( not ( = ?auto_20459 ?auto_20494 ) ) ( not ( = ?auto_20463 ?auto_20494 ) ) ( not ( = ?auto_20470 ?auto_20476 ) ) ( IS-CRATE ?auto_20459 ) ( not ( = ?auto_20487 ?auto_20473 ) ) ( HOIST-AT ?auto_20502 ?auto_20487 ) ( AVAILABLE ?auto_20502 ) ( SURFACE-AT ?auto_20459 ?auto_20487 ) ( ON ?auto_20459 ?auto_20477 ) ( CLEAR ?auto_20459 ) ( not ( = ?auto_20461 ?auto_20459 ) ) ( not ( = ?auto_20461 ?auto_20477 ) ) ( not ( = ?auto_20459 ?auto_20477 ) ) ( not ( = ?auto_20470 ?auto_20502 ) ) ( IS-CRATE ?auto_20461 ) ( AVAILABLE ?auto_20495 ) ( SURFACE-AT ?auto_20461 ?auto_20503 ) ( ON ?auto_20461 ?auto_20483 ) ( CLEAR ?auto_20461 ) ( not ( = ?auto_20458 ?auto_20461 ) ) ( not ( = ?auto_20458 ?auto_20483 ) ) ( not ( = ?auto_20461 ?auto_20483 ) ) ( IS-CRATE ?auto_20458 ) ( not ( = ?auto_20479 ?auto_20473 ) ) ( HOIST-AT ?auto_20480 ?auto_20479 ) ( AVAILABLE ?auto_20480 ) ( SURFACE-AT ?auto_20458 ?auto_20479 ) ( ON ?auto_20458 ?auto_20489 ) ( CLEAR ?auto_20458 ) ( not ( = ?auto_20457 ?auto_20458 ) ) ( not ( = ?auto_20457 ?auto_20489 ) ) ( not ( = ?auto_20458 ?auto_20489 ) ) ( not ( = ?auto_20470 ?auto_20480 ) ) ( IS-CRATE ?auto_20457 ) ( not ( = ?auto_20475 ?auto_20473 ) ) ( HOIST-AT ?auto_20482 ?auto_20475 ) ( AVAILABLE ?auto_20482 ) ( SURFACE-AT ?auto_20457 ?auto_20475 ) ( ON ?auto_20457 ?auto_20499 ) ( CLEAR ?auto_20457 ) ( not ( = ?auto_20456 ?auto_20457 ) ) ( not ( = ?auto_20456 ?auto_20499 ) ) ( not ( = ?auto_20457 ?auto_20499 ) ) ( not ( = ?auto_20470 ?auto_20482 ) ) ( IS-CRATE ?auto_20456 ) ( not ( = ?auto_20486 ?auto_20473 ) ) ( HOIST-AT ?auto_20491 ?auto_20486 ) ( AVAILABLE ?auto_20491 ) ( SURFACE-AT ?auto_20456 ?auto_20486 ) ( ON ?auto_20456 ?auto_20505 ) ( CLEAR ?auto_20456 ) ( not ( = ?auto_20455 ?auto_20456 ) ) ( not ( = ?auto_20455 ?auto_20505 ) ) ( not ( = ?auto_20456 ?auto_20505 ) ) ( not ( = ?auto_20470 ?auto_20491 ) ) ( SURFACE-AT ?auto_20454 ?auto_20473 ) ( CLEAR ?auto_20454 ) ( IS-CRATE ?auto_20455 ) ( AVAILABLE ?auto_20470 ) ( AVAILABLE ?auto_20492 ) ( SURFACE-AT ?auto_20455 ?auto_20506 ) ( ON ?auto_20455 ?auto_20498 ) ( CLEAR ?auto_20455 ) ( TRUCK-AT ?auto_20472 ?auto_20473 ) ( not ( = ?auto_20454 ?auto_20455 ) ) ( not ( = ?auto_20454 ?auto_20498 ) ) ( not ( = ?auto_20455 ?auto_20498 ) ) ( not ( = ?auto_20454 ?auto_20456 ) ) ( not ( = ?auto_20454 ?auto_20505 ) ) ( not ( = ?auto_20456 ?auto_20498 ) ) ( not ( = ?auto_20486 ?auto_20506 ) ) ( not ( = ?auto_20491 ?auto_20492 ) ) ( not ( = ?auto_20505 ?auto_20498 ) ) ( not ( = ?auto_20454 ?auto_20457 ) ) ( not ( = ?auto_20454 ?auto_20499 ) ) ( not ( = ?auto_20455 ?auto_20457 ) ) ( not ( = ?auto_20455 ?auto_20499 ) ) ( not ( = ?auto_20457 ?auto_20505 ) ) ( not ( = ?auto_20457 ?auto_20498 ) ) ( not ( = ?auto_20475 ?auto_20486 ) ) ( not ( = ?auto_20475 ?auto_20506 ) ) ( not ( = ?auto_20482 ?auto_20491 ) ) ( not ( = ?auto_20482 ?auto_20492 ) ) ( not ( = ?auto_20499 ?auto_20505 ) ) ( not ( = ?auto_20499 ?auto_20498 ) ) ( not ( = ?auto_20454 ?auto_20458 ) ) ( not ( = ?auto_20454 ?auto_20489 ) ) ( not ( = ?auto_20455 ?auto_20458 ) ) ( not ( = ?auto_20455 ?auto_20489 ) ) ( not ( = ?auto_20456 ?auto_20458 ) ) ( not ( = ?auto_20456 ?auto_20489 ) ) ( not ( = ?auto_20458 ?auto_20499 ) ) ( not ( = ?auto_20458 ?auto_20505 ) ) ( not ( = ?auto_20458 ?auto_20498 ) ) ( not ( = ?auto_20479 ?auto_20475 ) ) ( not ( = ?auto_20479 ?auto_20486 ) ) ( not ( = ?auto_20479 ?auto_20506 ) ) ( not ( = ?auto_20480 ?auto_20482 ) ) ( not ( = ?auto_20480 ?auto_20491 ) ) ( not ( = ?auto_20480 ?auto_20492 ) ) ( not ( = ?auto_20489 ?auto_20499 ) ) ( not ( = ?auto_20489 ?auto_20505 ) ) ( not ( = ?auto_20489 ?auto_20498 ) ) ( not ( = ?auto_20454 ?auto_20461 ) ) ( not ( = ?auto_20454 ?auto_20483 ) ) ( not ( = ?auto_20455 ?auto_20461 ) ) ( not ( = ?auto_20455 ?auto_20483 ) ) ( not ( = ?auto_20456 ?auto_20461 ) ) ( not ( = ?auto_20456 ?auto_20483 ) ) ( not ( = ?auto_20457 ?auto_20461 ) ) ( not ( = ?auto_20457 ?auto_20483 ) ) ( not ( = ?auto_20461 ?auto_20489 ) ) ( not ( = ?auto_20461 ?auto_20499 ) ) ( not ( = ?auto_20461 ?auto_20505 ) ) ( not ( = ?auto_20461 ?auto_20498 ) ) ( not ( = ?auto_20503 ?auto_20479 ) ) ( not ( = ?auto_20503 ?auto_20475 ) ) ( not ( = ?auto_20503 ?auto_20486 ) ) ( not ( = ?auto_20503 ?auto_20506 ) ) ( not ( = ?auto_20495 ?auto_20480 ) ) ( not ( = ?auto_20495 ?auto_20482 ) ) ( not ( = ?auto_20495 ?auto_20491 ) ) ( not ( = ?auto_20495 ?auto_20492 ) ) ( not ( = ?auto_20483 ?auto_20489 ) ) ( not ( = ?auto_20483 ?auto_20499 ) ) ( not ( = ?auto_20483 ?auto_20505 ) ) ( not ( = ?auto_20483 ?auto_20498 ) ) ( not ( = ?auto_20454 ?auto_20459 ) ) ( not ( = ?auto_20454 ?auto_20477 ) ) ( not ( = ?auto_20455 ?auto_20459 ) ) ( not ( = ?auto_20455 ?auto_20477 ) ) ( not ( = ?auto_20456 ?auto_20459 ) ) ( not ( = ?auto_20456 ?auto_20477 ) ) ( not ( = ?auto_20457 ?auto_20459 ) ) ( not ( = ?auto_20457 ?auto_20477 ) ) ( not ( = ?auto_20458 ?auto_20459 ) ) ( not ( = ?auto_20458 ?auto_20477 ) ) ( not ( = ?auto_20459 ?auto_20483 ) ) ( not ( = ?auto_20459 ?auto_20489 ) ) ( not ( = ?auto_20459 ?auto_20499 ) ) ( not ( = ?auto_20459 ?auto_20505 ) ) ( not ( = ?auto_20459 ?auto_20498 ) ) ( not ( = ?auto_20487 ?auto_20503 ) ) ( not ( = ?auto_20487 ?auto_20479 ) ) ( not ( = ?auto_20487 ?auto_20475 ) ) ( not ( = ?auto_20487 ?auto_20486 ) ) ( not ( = ?auto_20487 ?auto_20506 ) ) ( not ( = ?auto_20502 ?auto_20495 ) ) ( not ( = ?auto_20502 ?auto_20480 ) ) ( not ( = ?auto_20502 ?auto_20482 ) ) ( not ( = ?auto_20502 ?auto_20491 ) ) ( not ( = ?auto_20502 ?auto_20492 ) ) ( not ( = ?auto_20477 ?auto_20483 ) ) ( not ( = ?auto_20477 ?auto_20489 ) ) ( not ( = ?auto_20477 ?auto_20499 ) ) ( not ( = ?auto_20477 ?auto_20505 ) ) ( not ( = ?auto_20477 ?auto_20498 ) ) ( not ( = ?auto_20454 ?auto_20463 ) ) ( not ( = ?auto_20454 ?auto_20494 ) ) ( not ( = ?auto_20455 ?auto_20463 ) ) ( not ( = ?auto_20455 ?auto_20494 ) ) ( not ( = ?auto_20456 ?auto_20463 ) ) ( not ( = ?auto_20456 ?auto_20494 ) ) ( not ( = ?auto_20457 ?auto_20463 ) ) ( not ( = ?auto_20457 ?auto_20494 ) ) ( not ( = ?auto_20458 ?auto_20463 ) ) ( not ( = ?auto_20458 ?auto_20494 ) ) ( not ( = ?auto_20461 ?auto_20463 ) ) ( not ( = ?auto_20461 ?auto_20494 ) ) ( not ( = ?auto_20463 ?auto_20477 ) ) ( not ( = ?auto_20463 ?auto_20483 ) ) ( not ( = ?auto_20463 ?auto_20489 ) ) ( not ( = ?auto_20463 ?auto_20499 ) ) ( not ( = ?auto_20463 ?auto_20505 ) ) ( not ( = ?auto_20463 ?auto_20498 ) ) ( not ( = ?auto_20500 ?auto_20487 ) ) ( not ( = ?auto_20500 ?auto_20503 ) ) ( not ( = ?auto_20500 ?auto_20479 ) ) ( not ( = ?auto_20500 ?auto_20475 ) ) ( not ( = ?auto_20500 ?auto_20486 ) ) ( not ( = ?auto_20500 ?auto_20506 ) ) ( not ( = ?auto_20476 ?auto_20502 ) ) ( not ( = ?auto_20476 ?auto_20495 ) ) ( not ( = ?auto_20476 ?auto_20480 ) ) ( not ( = ?auto_20476 ?auto_20482 ) ) ( not ( = ?auto_20476 ?auto_20491 ) ) ( not ( = ?auto_20476 ?auto_20492 ) ) ( not ( = ?auto_20494 ?auto_20477 ) ) ( not ( = ?auto_20494 ?auto_20483 ) ) ( not ( = ?auto_20494 ?auto_20489 ) ) ( not ( = ?auto_20494 ?auto_20499 ) ) ( not ( = ?auto_20494 ?auto_20505 ) ) ( not ( = ?auto_20494 ?auto_20498 ) ) ( not ( = ?auto_20454 ?auto_20462 ) ) ( not ( = ?auto_20454 ?auto_20484 ) ) ( not ( = ?auto_20455 ?auto_20462 ) ) ( not ( = ?auto_20455 ?auto_20484 ) ) ( not ( = ?auto_20456 ?auto_20462 ) ) ( not ( = ?auto_20456 ?auto_20484 ) ) ( not ( = ?auto_20457 ?auto_20462 ) ) ( not ( = ?auto_20457 ?auto_20484 ) ) ( not ( = ?auto_20458 ?auto_20462 ) ) ( not ( = ?auto_20458 ?auto_20484 ) ) ( not ( = ?auto_20461 ?auto_20462 ) ) ( not ( = ?auto_20461 ?auto_20484 ) ) ( not ( = ?auto_20459 ?auto_20462 ) ) ( not ( = ?auto_20459 ?auto_20484 ) ) ( not ( = ?auto_20462 ?auto_20494 ) ) ( not ( = ?auto_20462 ?auto_20477 ) ) ( not ( = ?auto_20462 ?auto_20483 ) ) ( not ( = ?auto_20462 ?auto_20489 ) ) ( not ( = ?auto_20462 ?auto_20499 ) ) ( not ( = ?auto_20462 ?auto_20505 ) ) ( not ( = ?auto_20462 ?auto_20498 ) ) ( not ( = ?auto_20490 ?auto_20500 ) ) ( not ( = ?auto_20490 ?auto_20487 ) ) ( not ( = ?auto_20490 ?auto_20503 ) ) ( not ( = ?auto_20490 ?auto_20479 ) ) ( not ( = ?auto_20490 ?auto_20475 ) ) ( not ( = ?auto_20490 ?auto_20486 ) ) ( not ( = ?auto_20490 ?auto_20506 ) ) ( not ( = ?auto_20493 ?auto_20476 ) ) ( not ( = ?auto_20493 ?auto_20502 ) ) ( not ( = ?auto_20493 ?auto_20495 ) ) ( not ( = ?auto_20493 ?auto_20480 ) ) ( not ( = ?auto_20493 ?auto_20482 ) ) ( not ( = ?auto_20493 ?auto_20491 ) ) ( not ( = ?auto_20493 ?auto_20492 ) ) ( not ( = ?auto_20484 ?auto_20494 ) ) ( not ( = ?auto_20484 ?auto_20477 ) ) ( not ( = ?auto_20484 ?auto_20483 ) ) ( not ( = ?auto_20484 ?auto_20489 ) ) ( not ( = ?auto_20484 ?auto_20499 ) ) ( not ( = ?auto_20484 ?auto_20505 ) ) ( not ( = ?auto_20484 ?auto_20498 ) ) ( not ( = ?auto_20454 ?auto_20460 ) ) ( not ( = ?auto_20454 ?auto_20501 ) ) ( not ( = ?auto_20455 ?auto_20460 ) ) ( not ( = ?auto_20455 ?auto_20501 ) ) ( not ( = ?auto_20456 ?auto_20460 ) ) ( not ( = ?auto_20456 ?auto_20501 ) ) ( not ( = ?auto_20457 ?auto_20460 ) ) ( not ( = ?auto_20457 ?auto_20501 ) ) ( not ( = ?auto_20458 ?auto_20460 ) ) ( not ( = ?auto_20458 ?auto_20501 ) ) ( not ( = ?auto_20461 ?auto_20460 ) ) ( not ( = ?auto_20461 ?auto_20501 ) ) ( not ( = ?auto_20459 ?auto_20460 ) ) ( not ( = ?auto_20459 ?auto_20501 ) ) ( not ( = ?auto_20463 ?auto_20460 ) ) ( not ( = ?auto_20463 ?auto_20501 ) ) ( not ( = ?auto_20460 ?auto_20484 ) ) ( not ( = ?auto_20460 ?auto_20494 ) ) ( not ( = ?auto_20460 ?auto_20477 ) ) ( not ( = ?auto_20460 ?auto_20483 ) ) ( not ( = ?auto_20460 ?auto_20489 ) ) ( not ( = ?auto_20460 ?auto_20499 ) ) ( not ( = ?auto_20460 ?auto_20505 ) ) ( not ( = ?auto_20460 ?auto_20498 ) ) ( not ( = ?auto_20501 ?auto_20484 ) ) ( not ( = ?auto_20501 ?auto_20494 ) ) ( not ( = ?auto_20501 ?auto_20477 ) ) ( not ( = ?auto_20501 ?auto_20483 ) ) ( not ( = ?auto_20501 ?auto_20489 ) ) ( not ( = ?auto_20501 ?auto_20499 ) ) ( not ( = ?auto_20501 ?auto_20505 ) ) ( not ( = ?auto_20501 ?auto_20498 ) ) ( not ( = ?auto_20454 ?auto_20465 ) ) ( not ( = ?auto_20454 ?auto_20481 ) ) ( not ( = ?auto_20455 ?auto_20465 ) ) ( not ( = ?auto_20455 ?auto_20481 ) ) ( not ( = ?auto_20456 ?auto_20465 ) ) ( not ( = ?auto_20456 ?auto_20481 ) ) ( not ( = ?auto_20457 ?auto_20465 ) ) ( not ( = ?auto_20457 ?auto_20481 ) ) ( not ( = ?auto_20458 ?auto_20465 ) ) ( not ( = ?auto_20458 ?auto_20481 ) ) ( not ( = ?auto_20461 ?auto_20465 ) ) ( not ( = ?auto_20461 ?auto_20481 ) ) ( not ( = ?auto_20459 ?auto_20465 ) ) ( not ( = ?auto_20459 ?auto_20481 ) ) ( not ( = ?auto_20463 ?auto_20465 ) ) ( not ( = ?auto_20463 ?auto_20481 ) ) ( not ( = ?auto_20462 ?auto_20465 ) ) ( not ( = ?auto_20462 ?auto_20481 ) ) ( not ( = ?auto_20465 ?auto_20501 ) ) ( not ( = ?auto_20465 ?auto_20484 ) ) ( not ( = ?auto_20465 ?auto_20494 ) ) ( not ( = ?auto_20465 ?auto_20477 ) ) ( not ( = ?auto_20465 ?auto_20483 ) ) ( not ( = ?auto_20465 ?auto_20489 ) ) ( not ( = ?auto_20465 ?auto_20499 ) ) ( not ( = ?auto_20465 ?auto_20505 ) ) ( not ( = ?auto_20465 ?auto_20498 ) ) ( not ( = ?auto_20497 ?auto_20506 ) ) ( not ( = ?auto_20497 ?auto_20490 ) ) ( not ( = ?auto_20497 ?auto_20500 ) ) ( not ( = ?auto_20497 ?auto_20487 ) ) ( not ( = ?auto_20497 ?auto_20503 ) ) ( not ( = ?auto_20497 ?auto_20479 ) ) ( not ( = ?auto_20497 ?auto_20475 ) ) ( not ( = ?auto_20497 ?auto_20486 ) ) ( not ( = ?auto_20507 ?auto_20492 ) ) ( not ( = ?auto_20507 ?auto_20493 ) ) ( not ( = ?auto_20507 ?auto_20476 ) ) ( not ( = ?auto_20507 ?auto_20502 ) ) ( not ( = ?auto_20507 ?auto_20495 ) ) ( not ( = ?auto_20507 ?auto_20480 ) ) ( not ( = ?auto_20507 ?auto_20482 ) ) ( not ( = ?auto_20507 ?auto_20491 ) ) ( not ( = ?auto_20481 ?auto_20501 ) ) ( not ( = ?auto_20481 ?auto_20484 ) ) ( not ( = ?auto_20481 ?auto_20494 ) ) ( not ( = ?auto_20481 ?auto_20477 ) ) ( not ( = ?auto_20481 ?auto_20483 ) ) ( not ( = ?auto_20481 ?auto_20489 ) ) ( not ( = ?auto_20481 ?auto_20499 ) ) ( not ( = ?auto_20481 ?auto_20505 ) ) ( not ( = ?auto_20481 ?auto_20498 ) ) ( not ( = ?auto_20454 ?auto_20464 ) ) ( not ( = ?auto_20454 ?auto_20496 ) ) ( not ( = ?auto_20455 ?auto_20464 ) ) ( not ( = ?auto_20455 ?auto_20496 ) ) ( not ( = ?auto_20456 ?auto_20464 ) ) ( not ( = ?auto_20456 ?auto_20496 ) ) ( not ( = ?auto_20457 ?auto_20464 ) ) ( not ( = ?auto_20457 ?auto_20496 ) ) ( not ( = ?auto_20458 ?auto_20464 ) ) ( not ( = ?auto_20458 ?auto_20496 ) ) ( not ( = ?auto_20461 ?auto_20464 ) ) ( not ( = ?auto_20461 ?auto_20496 ) ) ( not ( = ?auto_20459 ?auto_20464 ) ) ( not ( = ?auto_20459 ?auto_20496 ) ) ( not ( = ?auto_20463 ?auto_20464 ) ) ( not ( = ?auto_20463 ?auto_20496 ) ) ( not ( = ?auto_20462 ?auto_20464 ) ) ( not ( = ?auto_20462 ?auto_20496 ) ) ( not ( = ?auto_20460 ?auto_20464 ) ) ( not ( = ?auto_20460 ?auto_20496 ) ) ( not ( = ?auto_20464 ?auto_20481 ) ) ( not ( = ?auto_20464 ?auto_20501 ) ) ( not ( = ?auto_20464 ?auto_20484 ) ) ( not ( = ?auto_20464 ?auto_20494 ) ) ( not ( = ?auto_20464 ?auto_20477 ) ) ( not ( = ?auto_20464 ?auto_20483 ) ) ( not ( = ?auto_20464 ?auto_20489 ) ) ( not ( = ?auto_20464 ?auto_20499 ) ) ( not ( = ?auto_20464 ?auto_20505 ) ) ( not ( = ?auto_20464 ?auto_20498 ) ) ( not ( = ?auto_20496 ?auto_20481 ) ) ( not ( = ?auto_20496 ?auto_20501 ) ) ( not ( = ?auto_20496 ?auto_20484 ) ) ( not ( = ?auto_20496 ?auto_20494 ) ) ( not ( = ?auto_20496 ?auto_20477 ) ) ( not ( = ?auto_20496 ?auto_20483 ) ) ( not ( = ?auto_20496 ?auto_20489 ) ) ( not ( = ?auto_20496 ?auto_20499 ) ) ( not ( = ?auto_20496 ?auto_20505 ) ) ( not ( = ?auto_20496 ?auto_20498 ) ) ( not ( = ?auto_20454 ?auto_20466 ) ) ( not ( = ?auto_20454 ?auto_20478 ) ) ( not ( = ?auto_20455 ?auto_20466 ) ) ( not ( = ?auto_20455 ?auto_20478 ) ) ( not ( = ?auto_20456 ?auto_20466 ) ) ( not ( = ?auto_20456 ?auto_20478 ) ) ( not ( = ?auto_20457 ?auto_20466 ) ) ( not ( = ?auto_20457 ?auto_20478 ) ) ( not ( = ?auto_20458 ?auto_20466 ) ) ( not ( = ?auto_20458 ?auto_20478 ) ) ( not ( = ?auto_20461 ?auto_20466 ) ) ( not ( = ?auto_20461 ?auto_20478 ) ) ( not ( = ?auto_20459 ?auto_20466 ) ) ( not ( = ?auto_20459 ?auto_20478 ) ) ( not ( = ?auto_20463 ?auto_20466 ) ) ( not ( = ?auto_20463 ?auto_20478 ) ) ( not ( = ?auto_20462 ?auto_20466 ) ) ( not ( = ?auto_20462 ?auto_20478 ) ) ( not ( = ?auto_20460 ?auto_20466 ) ) ( not ( = ?auto_20460 ?auto_20478 ) ) ( not ( = ?auto_20465 ?auto_20466 ) ) ( not ( = ?auto_20465 ?auto_20478 ) ) ( not ( = ?auto_20466 ?auto_20496 ) ) ( not ( = ?auto_20466 ?auto_20481 ) ) ( not ( = ?auto_20466 ?auto_20501 ) ) ( not ( = ?auto_20466 ?auto_20484 ) ) ( not ( = ?auto_20466 ?auto_20494 ) ) ( not ( = ?auto_20466 ?auto_20477 ) ) ( not ( = ?auto_20466 ?auto_20483 ) ) ( not ( = ?auto_20466 ?auto_20489 ) ) ( not ( = ?auto_20466 ?auto_20499 ) ) ( not ( = ?auto_20466 ?auto_20505 ) ) ( not ( = ?auto_20466 ?auto_20498 ) ) ( not ( = ?auto_20504 ?auto_20503 ) ) ( not ( = ?auto_20504 ?auto_20497 ) ) ( not ( = ?auto_20504 ?auto_20506 ) ) ( not ( = ?auto_20504 ?auto_20490 ) ) ( not ( = ?auto_20504 ?auto_20500 ) ) ( not ( = ?auto_20504 ?auto_20487 ) ) ( not ( = ?auto_20504 ?auto_20479 ) ) ( not ( = ?auto_20504 ?auto_20475 ) ) ( not ( = ?auto_20504 ?auto_20486 ) ) ( not ( = ?auto_20485 ?auto_20495 ) ) ( not ( = ?auto_20485 ?auto_20507 ) ) ( not ( = ?auto_20485 ?auto_20492 ) ) ( not ( = ?auto_20485 ?auto_20493 ) ) ( not ( = ?auto_20485 ?auto_20476 ) ) ( not ( = ?auto_20485 ?auto_20502 ) ) ( not ( = ?auto_20485 ?auto_20480 ) ) ( not ( = ?auto_20485 ?auto_20482 ) ) ( not ( = ?auto_20485 ?auto_20491 ) ) ( not ( = ?auto_20478 ?auto_20496 ) ) ( not ( = ?auto_20478 ?auto_20481 ) ) ( not ( = ?auto_20478 ?auto_20501 ) ) ( not ( = ?auto_20478 ?auto_20484 ) ) ( not ( = ?auto_20478 ?auto_20494 ) ) ( not ( = ?auto_20478 ?auto_20477 ) ) ( not ( = ?auto_20478 ?auto_20483 ) ) ( not ( = ?auto_20478 ?auto_20489 ) ) ( not ( = ?auto_20478 ?auto_20499 ) ) ( not ( = ?auto_20478 ?auto_20505 ) ) ( not ( = ?auto_20478 ?auto_20498 ) ) ( not ( = ?auto_20454 ?auto_20467 ) ) ( not ( = ?auto_20454 ?auto_20488 ) ) ( not ( = ?auto_20455 ?auto_20467 ) ) ( not ( = ?auto_20455 ?auto_20488 ) ) ( not ( = ?auto_20456 ?auto_20467 ) ) ( not ( = ?auto_20456 ?auto_20488 ) ) ( not ( = ?auto_20457 ?auto_20467 ) ) ( not ( = ?auto_20457 ?auto_20488 ) ) ( not ( = ?auto_20458 ?auto_20467 ) ) ( not ( = ?auto_20458 ?auto_20488 ) ) ( not ( = ?auto_20461 ?auto_20467 ) ) ( not ( = ?auto_20461 ?auto_20488 ) ) ( not ( = ?auto_20459 ?auto_20467 ) ) ( not ( = ?auto_20459 ?auto_20488 ) ) ( not ( = ?auto_20463 ?auto_20467 ) ) ( not ( = ?auto_20463 ?auto_20488 ) ) ( not ( = ?auto_20462 ?auto_20467 ) ) ( not ( = ?auto_20462 ?auto_20488 ) ) ( not ( = ?auto_20460 ?auto_20467 ) ) ( not ( = ?auto_20460 ?auto_20488 ) ) ( not ( = ?auto_20465 ?auto_20467 ) ) ( not ( = ?auto_20465 ?auto_20488 ) ) ( not ( = ?auto_20464 ?auto_20467 ) ) ( not ( = ?auto_20464 ?auto_20488 ) ) ( not ( = ?auto_20467 ?auto_20478 ) ) ( not ( = ?auto_20467 ?auto_20496 ) ) ( not ( = ?auto_20467 ?auto_20481 ) ) ( not ( = ?auto_20467 ?auto_20501 ) ) ( not ( = ?auto_20467 ?auto_20484 ) ) ( not ( = ?auto_20467 ?auto_20494 ) ) ( not ( = ?auto_20467 ?auto_20477 ) ) ( not ( = ?auto_20467 ?auto_20483 ) ) ( not ( = ?auto_20467 ?auto_20489 ) ) ( not ( = ?auto_20467 ?auto_20499 ) ) ( not ( = ?auto_20467 ?auto_20505 ) ) ( not ( = ?auto_20467 ?auto_20498 ) ) ( not ( = ?auto_20488 ?auto_20478 ) ) ( not ( = ?auto_20488 ?auto_20496 ) ) ( not ( = ?auto_20488 ?auto_20481 ) ) ( not ( = ?auto_20488 ?auto_20501 ) ) ( not ( = ?auto_20488 ?auto_20484 ) ) ( not ( = ?auto_20488 ?auto_20494 ) ) ( not ( = ?auto_20488 ?auto_20477 ) ) ( not ( = ?auto_20488 ?auto_20483 ) ) ( not ( = ?auto_20488 ?auto_20489 ) ) ( not ( = ?auto_20488 ?auto_20499 ) ) ( not ( = ?auto_20488 ?auto_20505 ) ) ( not ( = ?auto_20488 ?auto_20498 ) ) ( not ( = ?auto_20454 ?auto_20468 ) ) ( not ( = ?auto_20454 ?auto_20471 ) ) ( not ( = ?auto_20455 ?auto_20468 ) ) ( not ( = ?auto_20455 ?auto_20471 ) ) ( not ( = ?auto_20456 ?auto_20468 ) ) ( not ( = ?auto_20456 ?auto_20471 ) ) ( not ( = ?auto_20457 ?auto_20468 ) ) ( not ( = ?auto_20457 ?auto_20471 ) ) ( not ( = ?auto_20458 ?auto_20468 ) ) ( not ( = ?auto_20458 ?auto_20471 ) ) ( not ( = ?auto_20461 ?auto_20468 ) ) ( not ( = ?auto_20461 ?auto_20471 ) ) ( not ( = ?auto_20459 ?auto_20468 ) ) ( not ( = ?auto_20459 ?auto_20471 ) ) ( not ( = ?auto_20463 ?auto_20468 ) ) ( not ( = ?auto_20463 ?auto_20471 ) ) ( not ( = ?auto_20462 ?auto_20468 ) ) ( not ( = ?auto_20462 ?auto_20471 ) ) ( not ( = ?auto_20460 ?auto_20468 ) ) ( not ( = ?auto_20460 ?auto_20471 ) ) ( not ( = ?auto_20465 ?auto_20468 ) ) ( not ( = ?auto_20465 ?auto_20471 ) ) ( not ( = ?auto_20464 ?auto_20468 ) ) ( not ( = ?auto_20464 ?auto_20471 ) ) ( not ( = ?auto_20466 ?auto_20468 ) ) ( not ( = ?auto_20466 ?auto_20471 ) ) ( not ( = ?auto_20468 ?auto_20488 ) ) ( not ( = ?auto_20468 ?auto_20478 ) ) ( not ( = ?auto_20468 ?auto_20496 ) ) ( not ( = ?auto_20468 ?auto_20481 ) ) ( not ( = ?auto_20468 ?auto_20501 ) ) ( not ( = ?auto_20468 ?auto_20484 ) ) ( not ( = ?auto_20468 ?auto_20494 ) ) ( not ( = ?auto_20468 ?auto_20477 ) ) ( not ( = ?auto_20468 ?auto_20483 ) ) ( not ( = ?auto_20468 ?auto_20489 ) ) ( not ( = ?auto_20468 ?auto_20499 ) ) ( not ( = ?auto_20468 ?auto_20505 ) ) ( not ( = ?auto_20468 ?auto_20498 ) ) ( not ( = ?auto_20469 ?auto_20497 ) ) ( not ( = ?auto_20469 ?auto_20504 ) ) ( not ( = ?auto_20469 ?auto_20503 ) ) ( not ( = ?auto_20469 ?auto_20506 ) ) ( not ( = ?auto_20469 ?auto_20490 ) ) ( not ( = ?auto_20469 ?auto_20500 ) ) ( not ( = ?auto_20469 ?auto_20487 ) ) ( not ( = ?auto_20469 ?auto_20479 ) ) ( not ( = ?auto_20469 ?auto_20475 ) ) ( not ( = ?auto_20469 ?auto_20486 ) ) ( not ( = ?auto_20474 ?auto_20507 ) ) ( not ( = ?auto_20474 ?auto_20485 ) ) ( not ( = ?auto_20474 ?auto_20495 ) ) ( not ( = ?auto_20474 ?auto_20492 ) ) ( not ( = ?auto_20474 ?auto_20493 ) ) ( not ( = ?auto_20474 ?auto_20476 ) ) ( not ( = ?auto_20474 ?auto_20502 ) ) ( not ( = ?auto_20474 ?auto_20480 ) ) ( not ( = ?auto_20474 ?auto_20482 ) ) ( not ( = ?auto_20474 ?auto_20491 ) ) ( not ( = ?auto_20471 ?auto_20488 ) ) ( not ( = ?auto_20471 ?auto_20478 ) ) ( not ( = ?auto_20471 ?auto_20496 ) ) ( not ( = ?auto_20471 ?auto_20481 ) ) ( not ( = ?auto_20471 ?auto_20501 ) ) ( not ( = ?auto_20471 ?auto_20484 ) ) ( not ( = ?auto_20471 ?auto_20494 ) ) ( not ( = ?auto_20471 ?auto_20477 ) ) ( not ( = ?auto_20471 ?auto_20483 ) ) ( not ( = ?auto_20471 ?auto_20489 ) ) ( not ( = ?auto_20471 ?auto_20499 ) ) ( not ( = ?auto_20471 ?auto_20505 ) ) ( not ( = ?auto_20471 ?auto_20498 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_20454 ?auto_20455 ?auto_20456 ?auto_20457 ?auto_20458 ?auto_20461 ?auto_20459 ?auto_20463 ?auto_20462 ?auto_20460 ?auto_20465 ?auto_20464 ?auto_20466 ?auto_20467 )
      ( MAKE-1CRATE ?auto_20467 ?auto_20468 )
      ( MAKE-14CRATE-VERIFY ?auto_20454 ?auto_20455 ?auto_20456 ?auto_20457 ?auto_20458 ?auto_20461 ?auto_20459 ?auto_20463 ?auto_20462 ?auto_20460 ?auto_20465 ?auto_20464 ?auto_20466 ?auto_20467 ?auto_20468 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20510 - SURFACE
      ?auto_20511 - SURFACE
    )
    :vars
    (
      ?auto_20512 - HOIST
      ?auto_20513 - PLACE
      ?auto_20515 - PLACE
      ?auto_20516 - HOIST
      ?auto_20517 - SURFACE
      ?auto_20514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20512 ?auto_20513 ) ( SURFACE-AT ?auto_20510 ?auto_20513 ) ( CLEAR ?auto_20510 ) ( IS-CRATE ?auto_20511 ) ( AVAILABLE ?auto_20512 ) ( not ( = ?auto_20515 ?auto_20513 ) ) ( HOIST-AT ?auto_20516 ?auto_20515 ) ( AVAILABLE ?auto_20516 ) ( SURFACE-AT ?auto_20511 ?auto_20515 ) ( ON ?auto_20511 ?auto_20517 ) ( CLEAR ?auto_20511 ) ( TRUCK-AT ?auto_20514 ?auto_20513 ) ( not ( = ?auto_20510 ?auto_20511 ) ) ( not ( = ?auto_20510 ?auto_20517 ) ) ( not ( = ?auto_20511 ?auto_20517 ) ) ( not ( = ?auto_20512 ?auto_20516 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20514 ?auto_20513 ?auto_20515 )
      ( !LIFT ?auto_20516 ?auto_20511 ?auto_20517 ?auto_20515 )
      ( !LOAD ?auto_20516 ?auto_20511 ?auto_20514 ?auto_20515 )
      ( !DRIVE ?auto_20514 ?auto_20515 ?auto_20513 )
      ( !UNLOAD ?auto_20512 ?auto_20511 ?auto_20514 ?auto_20513 )
      ( !DROP ?auto_20512 ?auto_20511 ?auto_20510 ?auto_20513 )
      ( MAKE-1CRATE-VERIFY ?auto_20510 ?auto_20511 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_20534 - SURFACE
      ?auto_20535 - SURFACE
      ?auto_20536 - SURFACE
      ?auto_20537 - SURFACE
      ?auto_20538 - SURFACE
      ?auto_20541 - SURFACE
      ?auto_20539 - SURFACE
      ?auto_20543 - SURFACE
      ?auto_20542 - SURFACE
      ?auto_20540 - SURFACE
      ?auto_20545 - SURFACE
      ?auto_20544 - SURFACE
      ?auto_20546 - SURFACE
      ?auto_20548 - SURFACE
      ?auto_20549 - SURFACE
      ?auto_20547 - SURFACE
    )
    :vars
    (
      ?auto_20555 - HOIST
      ?auto_20551 - PLACE
      ?auto_20553 - PLACE
      ?auto_20552 - HOIST
      ?auto_20554 - SURFACE
      ?auto_20570 - PLACE
      ?auto_20563 - HOIST
      ?auto_20558 - SURFACE
      ?auto_20557 - PLACE
      ?auto_20583 - HOIST
      ?auto_20587 - SURFACE
      ?auto_20556 - PLACE
      ?auto_20562 - HOIST
      ?auto_20579 - SURFACE
      ?auto_20571 - PLACE
      ?auto_20561 - HOIST
      ?auto_20581 - SURFACE
      ?auto_20575 - SURFACE
      ?auto_20586 - PLACE
      ?auto_20569 - HOIST
      ?auto_20591 - SURFACE
      ?auto_20590 - PLACE
      ?auto_20560 - HOIST
      ?auto_20565 - SURFACE
      ?auto_20564 - PLACE
      ?auto_20582 - HOIST
      ?auto_20585 - SURFACE
      ?auto_20573 - PLACE
      ?auto_20568 - HOIST
      ?auto_20574 - SURFACE
      ?auto_20576 - SURFACE
      ?auto_20567 - PLACE
      ?auto_20566 - HOIST
      ?auto_20580 - SURFACE
      ?auto_20559 - PLACE
      ?auto_20584 - HOIST
      ?auto_20588 - SURFACE
      ?auto_20572 - PLACE
      ?auto_20589 - HOIST
      ?auto_20578 - SURFACE
      ?auto_20577 - SURFACE
      ?auto_20550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20555 ?auto_20551 ) ( IS-CRATE ?auto_20547 ) ( not ( = ?auto_20553 ?auto_20551 ) ) ( HOIST-AT ?auto_20552 ?auto_20553 ) ( AVAILABLE ?auto_20552 ) ( SURFACE-AT ?auto_20547 ?auto_20553 ) ( ON ?auto_20547 ?auto_20554 ) ( CLEAR ?auto_20547 ) ( not ( = ?auto_20549 ?auto_20547 ) ) ( not ( = ?auto_20549 ?auto_20554 ) ) ( not ( = ?auto_20547 ?auto_20554 ) ) ( not ( = ?auto_20555 ?auto_20552 ) ) ( IS-CRATE ?auto_20549 ) ( not ( = ?auto_20570 ?auto_20551 ) ) ( HOIST-AT ?auto_20563 ?auto_20570 ) ( AVAILABLE ?auto_20563 ) ( SURFACE-AT ?auto_20549 ?auto_20570 ) ( ON ?auto_20549 ?auto_20558 ) ( CLEAR ?auto_20549 ) ( not ( = ?auto_20548 ?auto_20549 ) ) ( not ( = ?auto_20548 ?auto_20558 ) ) ( not ( = ?auto_20549 ?auto_20558 ) ) ( not ( = ?auto_20555 ?auto_20563 ) ) ( IS-CRATE ?auto_20548 ) ( not ( = ?auto_20557 ?auto_20551 ) ) ( HOIST-AT ?auto_20583 ?auto_20557 ) ( SURFACE-AT ?auto_20548 ?auto_20557 ) ( ON ?auto_20548 ?auto_20587 ) ( CLEAR ?auto_20548 ) ( not ( = ?auto_20546 ?auto_20548 ) ) ( not ( = ?auto_20546 ?auto_20587 ) ) ( not ( = ?auto_20548 ?auto_20587 ) ) ( not ( = ?auto_20555 ?auto_20583 ) ) ( IS-CRATE ?auto_20546 ) ( not ( = ?auto_20556 ?auto_20551 ) ) ( HOIST-AT ?auto_20562 ?auto_20556 ) ( AVAILABLE ?auto_20562 ) ( SURFACE-AT ?auto_20546 ?auto_20556 ) ( ON ?auto_20546 ?auto_20579 ) ( CLEAR ?auto_20546 ) ( not ( = ?auto_20544 ?auto_20546 ) ) ( not ( = ?auto_20544 ?auto_20579 ) ) ( not ( = ?auto_20546 ?auto_20579 ) ) ( not ( = ?auto_20555 ?auto_20562 ) ) ( IS-CRATE ?auto_20544 ) ( not ( = ?auto_20571 ?auto_20551 ) ) ( HOIST-AT ?auto_20561 ?auto_20571 ) ( SURFACE-AT ?auto_20544 ?auto_20571 ) ( ON ?auto_20544 ?auto_20581 ) ( CLEAR ?auto_20544 ) ( not ( = ?auto_20545 ?auto_20544 ) ) ( not ( = ?auto_20545 ?auto_20581 ) ) ( not ( = ?auto_20544 ?auto_20581 ) ) ( not ( = ?auto_20555 ?auto_20561 ) ) ( IS-CRATE ?auto_20545 ) ( AVAILABLE ?auto_20583 ) ( SURFACE-AT ?auto_20545 ?auto_20557 ) ( ON ?auto_20545 ?auto_20575 ) ( CLEAR ?auto_20545 ) ( not ( = ?auto_20540 ?auto_20545 ) ) ( not ( = ?auto_20540 ?auto_20575 ) ) ( not ( = ?auto_20545 ?auto_20575 ) ) ( IS-CRATE ?auto_20540 ) ( not ( = ?auto_20586 ?auto_20551 ) ) ( HOIST-AT ?auto_20569 ?auto_20586 ) ( SURFACE-AT ?auto_20540 ?auto_20586 ) ( ON ?auto_20540 ?auto_20591 ) ( CLEAR ?auto_20540 ) ( not ( = ?auto_20542 ?auto_20540 ) ) ( not ( = ?auto_20542 ?auto_20591 ) ) ( not ( = ?auto_20540 ?auto_20591 ) ) ( not ( = ?auto_20555 ?auto_20569 ) ) ( IS-CRATE ?auto_20542 ) ( not ( = ?auto_20590 ?auto_20551 ) ) ( HOIST-AT ?auto_20560 ?auto_20590 ) ( AVAILABLE ?auto_20560 ) ( SURFACE-AT ?auto_20542 ?auto_20590 ) ( ON ?auto_20542 ?auto_20565 ) ( CLEAR ?auto_20542 ) ( not ( = ?auto_20543 ?auto_20542 ) ) ( not ( = ?auto_20543 ?auto_20565 ) ) ( not ( = ?auto_20542 ?auto_20565 ) ) ( not ( = ?auto_20555 ?auto_20560 ) ) ( IS-CRATE ?auto_20543 ) ( not ( = ?auto_20564 ?auto_20551 ) ) ( HOIST-AT ?auto_20582 ?auto_20564 ) ( AVAILABLE ?auto_20582 ) ( SURFACE-AT ?auto_20543 ?auto_20564 ) ( ON ?auto_20543 ?auto_20585 ) ( CLEAR ?auto_20543 ) ( not ( = ?auto_20539 ?auto_20543 ) ) ( not ( = ?auto_20539 ?auto_20585 ) ) ( not ( = ?auto_20543 ?auto_20585 ) ) ( not ( = ?auto_20555 ?auto_20582 ) ) ( IS-CRATE ?auto_20539 ) ( not ( = ?auto_20573 ?auto_20551 ) ) ( HOIST-AT ?auto_20568 ?auto_20573 ) ( AVAILABLE ?auto_20568 ) ( SURFACE-AT ?auto_20539 ?auto_20573 ) ( ON ?auto_20539 ?auto_20574 ) ( CLEAR ?auto_20539 ) ( not ( = ?auto_20541 ?auto_20539 ) ) ( not ( = ?auto_20541 ?auto_20574 ) ) ( not ( = ?auto_20539 ?auto_20574 ) ) ( not ( = ?auto_20555 ?auto_20568 ) ) ( IS-CRATE ?auto_20541 ) ( AVAILABLE ?auto_20561 ) ( SURFACE-AT ?auto_20541 ?auto_20571 ) ( ON ?auto_20541 ?auto_20576 ) ( CLEAR ?auto_20541 ) ( not ( = ?auto_20538 ?auto_20541 ) ) ( not ( = ?auto_20538 ?auto_20576 ) ) ( not ( = ?auto_20541 ?auto_20576 ) ) ( IS-CRATE ?auto_20538 ) ( not ( = ?auto_20567 ?auto_20551 ) ) ( HOIST-AT ?auto_20566 ?auto_20567 ) ( AVAILABLE ?auto_20566 ) ( SURFACE-AT ?auto_20538 ?auto_20567 ) ( ON ?auto_20538 ?auto_20580 ) ( CLEAR ?auto_20538 ) ( not ( = ?auto_20537 ?auto_20538 ) ) ( not ( = ?auto_20537 ?auto_20580 ) ) ( not ( = ?auto_20538 ?auto_20580 ) ) ( not ( = ?auto_20555 ?auto_20566 ) ) ( IS-CRATE ?auto_20537 ) ( not ( = ?auto_20559 ?auto_20551 ) ) ( HOIST-AT ?auto_20584 ?auto_20559 ) ( AVAILABLE ?auto_20584 ) ( SURFACE-AT ?auto_20537 ?auto_20559 ) ( ON ?auto_20537 ?auto_20588 ) ( CLEAR ?auto_20537 ) ( not ( = ?auto_20536 ?auto_20537 ) ) ( not ( = ?auto_20536 ?auto_20588 ) ) ( not ( = ?auto_20537 ?auto_20588 ) ) ( not ( = ?auto_20555 ?auto_20584 ) ) ( IS-CRATE ?auto_20536 ) ( not ( = ?auto_20572 ?auto_20551 ) ) ( HOIST-AT ?auto_20589 ?auto_20572 ) ( AVAILABLE ?auto_20589 ) ( SURFACE-AT ?auto_20536 ?auto_20572 ) ( ON ?auto_20536 ?auto_20578 ) ( CLEAR ?auto_20536 ) ( not ( = ?auto_20535 ?auto_20536 ) ) ( not ( = ?auto_20535 ?auto_20578 ) ) ( not ( = ?auto_20536 ?auto_20578 ) ) ( not ( = ?auto_20555 ?auto_20589 ) ) ( SURFACE-AT ?auto_20534 ?auto_20551 ) ( CLEAR ?auto_20534 ) ( IS-CRATE ?auto_20535 ) ( AVAILABLE ?auto_20555 ) ( AVAILABLE ?auto_20569 ) ( SURFACE-AT ?auto_20535 ?auto_20586 ) ( ON ?auto_20535 ?auto_20577 ) ( CLEAR ?auto_20535 ) ( TRUCK-AT ?auto_20550 ?auto_20551 ) ( not ( = ?auto_20534 ?auto_20535 ) ) ( not ( = ?auto_20534 ?auto_20577 ) ) ( not ( = ?auto_20535 ?auto_20577 ) ) ( not ( = ?auto_20534 ?auto_20536 ) ) ( not ( = ?auto_20534 ?auto_20578 ) ) ( not ( = ?auto_20536 ?auto_20577 ) ) ( not ( = ?auto_20572 ?auto_20586 ) ) ( not ( = ?auto_20589 ?auto_20569 ) ) ( not ( = ?auto_20578 ?auto_20577 ) ) ( not ( = ?auto_20534 ?auto_20537 ) ) ( not ( = ?auto_20534 ?auto_20588 ) ) ( not ( = ?auto_20535 ?auto_20537 ) ) ( not ( = ?auto_20535 ?auto_20588 ) ) ( not ( = ?auto_20537 ?auto_20578 ) ) ( not ( = ?auto_20537 ?auto_20577 ) ) ( not ( = ?auto_20559 ?auto_20572 ) ) ( not ( = ?auto_20559 ?auto_20586 ) ) ( not ( = ?auto_20584 ?auto_20589 ) ) ( not ( = ?auto_20584 ?auto_20569 ) ) ( not ( = ?auto_20588 ?auto_20578 ) ) ( not ( = ?auto_20588 ?auto_20577 ) ) ( not ( = ?auto_20534 ?auto_20538 ) ) ( not ( = ?auto_20534 ?auto_20580 ) ) ( not ( = ?auto_20535 ?auto_20538 ) ) ( not ( = ?auto_20535 ?auto_20580 ) ) ( not ( = ?auto_20536 ?auto_20538 ) ) ( not ( = ?auto_20536 ?auto_20580 ) ) ( not ( = ?auto_20538 ?auto_20588 ) ) ( not ( = ?auto_20538 ?auto_20578 ) ) ( not ( = ?auto_20538 ?auto_20577 ) ) ( not ( = ?auto_20567 ?auto_20559 ) ) ( not ( = ?auto_20567 ?auto_20572 ) ) ( not ( = ?auto_20567 ?auto_20586 ) ) ( not ( = ?auto_20566 ?auto_20584 ) ) ( not ( = ?auto_20566 ?auto_20589 ) ) ( not ( = ?auto_20566 ?auto_20569 ) ) ( not ( = ?auto_20580 ?auto_20588 ) ) ( not ( = ?auto_20580 ?auto_20578 ) ) ( not ( = ?auto_20580 ?auto_20577 ) ) ( not ( = ?auto_20534 ?auto_20541 ) ) ( not ( = ?auto_20534 ?auto_20576 ) ) ( not ( = ?auto_20535 ?auto_20541 ) ) ( not ( = ?auto_20535 ?auto_20576 ) ) ( not ( = ?auto_20536 ?auto_20541 ) ) ( not ( = ?auto_20536 ?auto_20576 ) ) ( not ( = ?auto_20537 ?auto_20541 ) ) ( not ( = ?auto_20537 ?auto_20576 ) ) ( not ( = ?auto_20541 ?auto_20580 ) ) ( not ( = ?auto_20541 ?auto_20588 ) ) ( not ( = ?auto_20541 ?auto_20578 ) ) ( not ( = ?auto_20541 ?auto_20577 ) ) ( not ( = ?auto_20571 ?auto_20567 ) ) ( not ( = ?auto_20571 ?auto_20559 ) ) ( not ( = ?auto_20571 ?auto_20572 ) ) ( not ( = ?auto_20571 ?auto_20586 ) ) ( not ( = ?auto_20561 ?auto_20566 ) ) ( not ( = ?auto_20561 ?auto_20584 ) ) ( not ( = ?auto_20561 ?auto_20589 ) ) ( not ( = ?auto_20561 ?auto_20569 ) ) ( not ( = ?auto_20576 ?auto_20580 ) ) ( not ( = ?auto_20576 ?auto_20588 ) ) ( not ( = ?auto_20576 ?auto_20578 ) ) ( not ( = ?auto_20576 ?auto_20577 ) ) ( not ( = ?auto_20534 ?auto_20539 ) ) ( not ( = ?auto_20534 ?auto_20574 ) ) ( not ( = ?auto_20535 ?auto_20539 ) ) ( not ( = ?auto_20535 ?auto_20574 ) ) ( not ( = ?auto_20536 ?auto_20539 ) ) ( not ( = ?auto_20536 ?auto_20574 ) ) ( not ( = ?auto_20537 ?auto_20539 ) ) ( not ( = ?auto_20537 ?auto_20574 ) ) ( not ( = ?auto_20538 ?auto_20539 ) ) ( not ( = ?auto_20538 ?auto_20574 ) ) ( not ( = ?auto_20539 ?auto_20576 ) ) ( not ( = ?auto_20539 ?auto_20580 ) ) ( not ( = ?auto_20539 ?auto_20588 ) ) ( not ( = ?auto_20539 ?auto_20578 ) ) ( not ( = ?auto_20539 ?auto_20577 ) ) ( not ( = ?auto_20573 ?auto_20571 ) ) ( not ( = ?auto_20573 ?auto_20567 ) ) ( not ( = ?auto_20573 ?auto_20559 ) ) ( not ( = ?auto_20573 ?auto_20572 ) ) ( not ( = ?auto_20573 ?auto_20586 ) ) ( not ( = ?auto_20568 ?auto_20561 ) ) ( not ( = ?auto_20568 ?auto_20566 ) ) ( not ( = ?auto_20568 ?auto_20584 ) ) ( not ( = ?auto_20568 ?auto_20589 ) ) ( not ( = ?auto_20568 ?auto_20569 ) ) ( not ( = ?auto_20574 ?auto_20576 ) ) ( not ( = ?auto_20574 ?auto_20580 ) ) ( not ( = ?auto_20574 ?auto_20588 ) ) ( not ( = ?auto_20574 ?auto_20578 ) ) ( not ( = ?auto_20574 ?auto_20577 ) ) ( not ( = ?auto_20534 ?auto_20543 ) ) ( not ( = ?auto_20534 ?auto_20585 ) ) ( not ( = ?auto_20535 ?auto_20543 ) ) ( not ( = ?auto_20535 ?auto_20585 ) ) ( not ( = ?auto_20536 ?auto_20543 ) ) ( not ( = ?auto_20536 ?auto_20585 ) ) ( not ( = ?auto_20537 ?auto_20543 ) ) ( not ( = ?auto_20537 ?auto_20585 ) ) ( not ( = ?auto_20538 ?auto_20543 ) ) ( not ( = ?auto_20538 ?auto_20585 ) ) ( not ( = ?auto_20541 ?auto_20543 ) ) ( not ( = ?auto_20541 ?auto_20585 ) ) ( not ( = ?auto_20543 ?auto_20574 ) ) ( not ( = ?auto_20543 ?auto_20576 ) ) ( not ( = ?auto_20543 ?auto_20580 ) ) ( not ( = ?auto_20543 ?auto_20588 ) ) ( not ( = ?auto_20543 ?auto_20578 ) ) ( not ( = ?auto_20543 ?auto_20577 ) ) ( not ( = ?auto_20564 ?auto_20573 ) ) ( not ( = ?auto_20564 ?auto_20571 ) ) ( not ( = ?auto_20564 ?auto_20567 ) ) ( not ( = ?auto_20564 ?auto_20559 ) ) ( not ( = ?auto_20564 ?auto_20572 ) ) ( not ( = ?auto_20564 ?auto_20586 ) ) ( not ( = ?auto_20582 ?auto_20568 ) ) ( not ( = ?auto_20582 ?auto_20561 ) ) ( not ( = ?auto_20582 ?auto_20566 ) ) ( not ( = ?auto_20582 ?auto_20584 ) ) ( not ( = ?auto_20582 ?auto_20589 ) ) ( not ( = ?auto_20582 ?auto_20569 ) ) ( not ( = ?auto_20585 ?auto_20574 ) ) ( not ( = ?auto_20585 ?auto_20576 ) ) ( not ( = ?auto_20585 ?auto_20580 ) ) ( not ( = ?auto_20585 ?auto_20588 ) ) ( not ( = ?auto_20585 ?auto_20578 ) ) ( not ( = ?auto_20585 ?auto_20577 ) ) ( not ( = ?auto_20534 ?auto_20542 ) ) ( not ( = ?auto_20534 ?auto_20565 ) ) ( not ( = ?auto_20535 ?auto_20542 ) ) ( not ( = ?auto_20535 ?auto_20565 ) ) ( not ( = ?auto_20536 ?auto_20542 ) ) ( not ( = ?auto_20536 ?auto_20565 ) ) ( not ( = ?auto_20537 ?auto_20542 ) ) ( not ( = ?auto_20537 ?auto_20565 ) ) ( not ( = ?auto_20538 ?auto_20542 ) ) ( not ( = ?auto_20538 ?auto_20565 ) ) ( not ( = ?auto_20541 ?auto_20542 ) ) ( not ( = ?auto_20541 ?auto_20565 ) ) ( not ( = ?auto_20539 ?auto_20542 ) ) ( not ( = ?auto_20539 ?auto_20565 ) ) ( not ( = ?auto_20542 ?auto_20585 ) ) ( not ( = ?auto_20542 ?auto_20574 ) ) ( not ( = ?auto_20542 ?auto_20576 ) ) ( not ( = ?auto_20542 ?auto_20580 ) ) ( not ( = ?auto_20542 ?auto_20588 ) ) ( not ( = ?auto_20542 ?auto_20578 ) ) ( not ( = ?auto_20542 ?auto_20577 ) ) ( not ( = ?auto_20590 ?auto_20564 ) ) ( not ( = ?auto_20590 ?auto_20573 ) ) ( not ( = ?auto_20590 ?auto_20571 ) ) ( not ( = ?auto_20590 ?auto_20567 ) ) ( not ( = ?auto_20590 ?auto_20559 ) ) ( not ( = ?auto_20590 ?auto_20572 ) ) ( not ( = ?auto_20590 ?auto_20586 ) ) ( not ( = ?auto_20560 ?auto_20582 ) ) ( not ( = ?auto_20560 ?auto_20568 ) ) ( not ( = ?auto_20560 ?auto_20561 ) ) ( not ( = ?auto_20560 ?auto_20566 ) ) ( not ( = ?auto_20560 ?auto_20584 ) ) ( not ( = ?auto_20560 ?auto_20589 ) ) ( not ( = ?auto_20560 ?auto_20569 ) ) ( not ( = ?auto_20565 ?auto_20585 ) ) ( not ( = ?auto_20565 ?auto_20574 ) ) ( not ( = ?auto_20565 ?auto_20576 ) ) ( not ( = ?auto_20565 ?auto_20580 ) ) ( not ( = ?auto_20565 ?auto_20588 ) ) ( not ( = ?auto_20565 ?auto_20578 ) ) ( not ( = ?auto_20565 ?auto_20577 ) ) ( not ( = ?auto_20534 ?auto_20540 ) ) ( not ( = ?auto_20534 ?auto_20591 ) ) ( not ( = ?auto_20535 ?auto_20540 ) ) ( not ( = ?auto_20535 ?auto_20591 ) ) ( not ( = ?auto_20536 ?auto_20540 ) ) ( not ( = ?auto_20536 ?auto_20591 ) ) ( not ( = ?auto_20537 ?auto_20540 ) ) ( not ( = ?auto_20537 ?auto_20591 ) ) ( not ( = ?auto_20538 ?auto_20540 ) ) ( not ( = ?auto_20538 ?auto_20591 ) ) ( not ( = ?auto_20541 ?auto_20540 ) ) ( not ( = ?auto_20541 ?auto_20591 ) ) ( not ( = ?auto_20539 ?auto_20540 ) ) ( not ( = ?auto_20539 ?auto_20591 ) ) ( not ( = ?auto_20543 ?auto_20540 ) ) ( not ( = ?auto_20543 ?auto_20591 ) ) ( not ( = ?auto_20540 ?auto_20565 ) ) ( not ( = ?auto_20540 ?auto_20585 ) ) ( not ( = ?auto_20540 ?auto_20574 ) ) ( not ( = ?auto_20540 ?auto_20576 ) ) ( not ( = ?auto_20540 ?auto_20580 ) ) ( not ( = ?auto_20540 ?auto_20588 ) ) ( not ( = ?auto_20540 ?auto_20578 ) ) ( not ( = ?auto_20540 ?auto_20577 ) ) ( not ( = ?auto_20591 ?auto_20565 ) ) ( not ( = ?auto_20591 ?auto_20585 ) ) ( not ( = ?auto_20591 ?auto_20574 ) ) ( not ( = ?auto_20591 ?auto_20576 ) ) ( not ( = ?auto_20591 ?auto_20580 ) ) ( not ( = ?auto_20591 ?auto_20588 ) ) ( not ( = ?auto_20591 ?auto_20578 ) ) ( not ( = ?auto_20591 ?auto_20577 ) ) ( not ( = ?auto_20534 ?auto_20545 ) ) ( not ( = ?auto_20534 ?auto_20575 ) ) ( not ( = ?auto_20535 ?auto_20545 ) ) ( not ( = ?auto_20535 ?auto_20575 ) ) ( not ( = ?auto_20536 ?auto_20545 ) ) ( not ( = ?auto_20536 ?auto_20575 ) ) ( not ( = ?auto_20537 ?auto_20545 ) ) ( not ( = ?auto_20537 ?auto_20575 ) ) ( not ( = ?auto_20538 ?auto_20545 ) ) ( not ( = ?auto_20538 ?auto_20575 ) ) ( not ( = ?auto_20541 ?auto_20545 ) ) ( not ( = ?auto_20541 ?auto_20575 ) ) ( not ( = ?auto_20539 ?auto_20545 ) ) ( not ( = ?auto_20539 ?auto_20575 ) ) ( not ( = ?auto_20543 ?auto_20545 ) ) ( not ( = ?auto_20543 ?auto_20575 ) ) ( not ( = ?auto_20542 ?auto_20545 ) ) ( not ( = ?auto_20542 ?auto_20575 ) ) ( not ( = ?auto_20545 ?auto_20591 ) ) ( not ( = ?auto_20545 ?auto_20565 ) ) ( not ( = ?auto_20545 ?auto_20585 ) ) ( not ( = ?auto_20545 ?auto_20574 ) ) ( not ( = ?auto_20545 ?auto_20576 ) ) ( not ( = ?auto_20545 ?auto_20580 ) ) ( not ( = ?auto_20545 ?auto_20588 ) ) ( not ( = ?auto_20545 ?auto_20578 ) ) ( not ( = ?auto_20545 ?auto_20577 ) ) ( not ( = ?auto_20557 ?auto_20586 ) ) ( not ( = ?auto_20557 ?auto_20590 ) ) ( not ( = ?auto_20557 ?auto_20564 ) ) ( not ( = ?auto_20557 ?auto_20573 ) ) ( not ( = ?auto_20557 ?auto_20571 ) ) ( not ( = ?auto_20557 ?auto_20567 ) ) ( not ( = ?auto_20557 ?auto_20559 ) ) ( not ( = ?auto_20557 ?auto_20572 ) ) ( not ( = ?auto_20583 ?auto_20569 ) ) ( not ( = ?auto_20583 ?auto_20560 ) ) ( not ( = ?auto_20583 ?auto_20582 ) ) ( not ( = ?auto_20583 ?auto_20568 ) ) ( not ( = ?auto_20583 ?auto_20561 ) ) ( not ( = ?auto_20583 ?auto_20566 ) ) ( not ( = ?auto_20583 ?auto_20584 ) ) ( not ( = ?auto_20583 ?auto_20589 ) ) ( not ( = ?auto_20575 ?auto_20591 ) ) ( not ( = ?auto_20575 ?auto_20565 ) ) ( not ( = ?auto_20575 ?auto_20585 ) ) ( not ( = ?auto_20575 ?auto_20574 ) ) ( not ( = ?auto_20575 ?auto_20576 ) ) ( not ( = ?auto_20575 ?auto_20580 ) ) ( not ( = ?auto_20575 ?auto_20588 ) ) ( not ( = ?auto_20575 ?auto_20578 ) ) ( not ( = ?auto_20575 ?auto_20577 ) ) ( not ( = ?auto_20534 ?auto_20544 ) ) ( not ( = ?auto_20534 ?auto_20581 ) ) ( not ( = ?auto_20535 ?auto_20544 ) ) ( not ( = ?auto_20535 ?auto_20581 ) ) ( not ( = ?auto_20536 ?auto_20544 ) ) ( not ( = ?auto_20536 ?auto_20581 ) ) ( not ( = ?auto_20537 ?auto_20544 ) ) ( not ( = ?auto_20537 ?auto_20581 ) ) ( not ( = ?auto_20538 ?auto_20544 ) ) ( not ( = ?auto_20538 ?auto_20581 ) ) ( not ( = ?auto_20541 ?auto_20544 ) ) ( not ( = ?auto_20541 ?auto_20581 ) ) ( not ( = ?auto_20539 ?auto_20544 ) ) ( not ( = ?auto_20539 ?auto_20581 ) ) ( not ( = ?auto_20543 ?auto_20544 ) ) ( not ( = ?auto_20543 ?auto_20581 ) ) ( not ( = ?auto_20542 ?auto_20544 ) ) ( not ( = ?auto_20542 ?auto_20581 ) ) ( not ( = ?auto_20540 ?auto_20544 ) ) ( not ( = ?auto_20540 ?auto_20581 ) ) ( not ( = ?auto_20544 ?auto_20575 ) ) ( not ( = ?auto_20544 ?auto_20591 ) ) ( not ( = ?auto_20544 ?auto_20565 ) ) ( not ( = ?auto_20544 ?auto_20585 ) ) ( not ( = ?auto_20544 ?auto_20574 ) ) ( not ( = ?auto_20544 ?auto_20576 ) ) ( not ( = ?auto_20544 ?auto_20580 ) ) ( not ( = ?auto_20544 ?auto_20588 ) ) ( not ( = ?auto_20544 ?auto_20578 ) ) ( not ( = ?auto_20544 ?auto_20577 ) ) ( not ( = ?auto_20581 ?auto_20575 ) ) ( not ( = ?auto_20581 ?auto_20591 ) ) ( not ( = ?auto_20581 ?auto_20565 ) ) ( not ( = ?auto_20581 ?auto_20585 ) ) ( not ( = ?auto_20581 ?auto_20574 ) ) ( not ( = ?auto_20581 ?auto_20576 ) ) ( not ( = ?auto_20581 ?auto_20580 ) ) ( not ( = ?auto_20581 ?auto_20588 ) ) ( not ( = ?auto_20581 ?auto_20578 ) ) ( not ( = ?auto_20581 ?auto_20577 ) ) ( not ( = ?auto_20534 ?auto_20546 ) ) ( not ( = ?auto_20534 ?auto_20579 ) ) ( not ( = ?auto_20535 ?auto_20546 ) ) ( not ( = ?auto_20535 ?auto_20579 ) ) ( not ( = ?auto_20536 ?auto_20546 ) ) ( not ( = ?auto_20536 ?auto_20579 ) ) ( not ( = ?auto_20537 ?auto_20546 ) ) ( not ( = ?auto_20537 ?auto_20579 ) ) ( not ( = ?auto_20538 ?auto_20546 ) ) ( not ( = ?auto_20538 ?auto_20579 ) ) ( not ( = ?auto_20541 ?auto_20546 ) ) ( not ( = ?auto_20541 ?auto_20579 ) ) ( not ( = ?auto_20539 ?auto_20546 ) ) ( not ( = ?auto_20539 ?auto_20579 ) ) ( not ( = ?auto_20543 ?auto_20546 ) ) ( not ( = ?auto_20543 ?auto_20579 ) ) ( not ( = ?auto_20542 ?auto_20546 ) ) ( not ( = ?auto_20542 ?auto_20579 ) ) ( not ( = ?auto_20540 ?auto_20546 ) ) ( not ( = ?auto_20540 ?auto_20579 ) ) ( not ( = ?auto_20545 ?auto_20546 ) ) ( not ( = ?auto_20545 ?auto_20579 ) ) ( not ( = ?auto_20546 ?auto_20581 ) ) ( not ( = ?auto_20546 ?auto_20575 ) ) ( not ( = ?auto_20546 ?auto_20591 ) ) ( not ( = ?auto_20546 ?auto_20565 ) ) ( not ( = ?auto_20546 ?auto_20585 ) ) ( not ( = ?auto_20546 ?auto_20574 ) ) ( not ( = ?auto_20546 ?auto_20576 ) ) ( not ( = ?auto_20546 ?auto_20580 ) ) ( not ( = ?auto_20546 ?auto_20588 ) ) ( not ( = ?auto_20546 ?auto_20578 ) ) ( not ( = ?auto_20546 ?auto_20577 ) ) ( not ( = ?auto_20556 ?auto_20571 ) ) ( not ( = ?auto_20556 ?auto_20557 ) ) ( not ( = ?auto_20556 ?auto_20586 ) ) ( not ( = ?auto_20556 ?auto_20590 ) ) ( not ( = ?auto_20556 ?auto_20564 ) ) ( not ( = ?auto_20556 ?auto_20573 ) ) ( not ( = ?auto_20556 ?auto_20567 ) ) ( not ( = ?auto_20556 ?auto_20559 ) ) ( not ( = ?auto_20556 ?auto_20572 ) ) ( not ( = ?auto_20562 ?auto_20561 ) ) ( not ( = ?auto_20562 ?auto_20583 ) ) ( not ( = ?auto_20562 ?auto_20569 ) ) ( not ( = ?auto_20562 ?auto_20560 ) ) ( not ( = ?auto_20562 ?auto_20582 ) ) ( not ( = ?auto_20562 ?auto_20568 ) ) ( not ( = ?auto_20562 ?auto_20566 ) ) ( not ( = ?auto_20562 ?auto_20584 ) ) ( not ( = ?auto_20562 ?auto_20589 ) ) ( not ( = ?auto_20579 ?auto_20581 ) ) ( not ( = ?auto_20579 ?auto_20575 ) ) ( not ( = ?auto_20579 ?auto_20591 ) ) ( not ( = ?auto_20579 ?auto_20565 ) ) ( not ( = ?auto_20579 ?auto_20585 ) ) ( not ( = ?auto_20579 ?auto_20574 ) ) ( not ( = ?auto_20579 ?auto_20576 ) ) ( not ( = ?auto_20579 ?auto_20580 ) ) ( not ( = ?auto_20579 ?auto_20588 ) ) ( not ( = ?auto_20579 ?auto_20578 ) ) ( not ( = ?auto_20579 ?auto_20577 ) ) ( not ( = ?auto_20534 ?auto_20548 ) ) ( not ( = ?auto_20534 ?auto_20587 ) ) ( not ( = ?auto_20535 ?auto_20548 ) ) ( not ( = ?auto_20535 ?auto_20587 ) ) ( not ( = ?auto_20536 ?auto_20548 ) ) ( not ( = ?auto_20536 ?auto_20587 ) ) ( not ( = ?auto_20537 ?auto_20548 ) ) ( not ( = ?auto_20537 ?auto_20587 ) ) ( not ( = ?auto_20538 ?auto_20548 ) ) ( not ( = ?auto_20538 ?auto_20587 ) ) ( not ( = ?auto_20541 ?auto_20548 ) ) ( not ( = ?auto_20541 ?auto_20587 ) ) ( not ( = ?auto_20539 ?auto_20548 ) ) ( not ( = ?auto_20539 ?auto_20587 ) ) ( not ( = ?auto_20543 ?auto_20548 ) ) ( not ( = ?auto_20543 ?auto_20587 ) ) ( not ( = ?auto_20542 ?auto_20548 ) ) ( not ( = ?auto_20542 ?auto_20587 ) ) ( not ( = ?auto_20540 ?auto_20548 ) ) ( not ( = ?auto_20540 ?auto_20587 ) ) ( not ( = ?auto_20545 ?auto_20548 ) ) ( not ( = ?auto_20545 ?auto_20587 ) ) ( not ( = ?auto_20544 ?auto_20548 ) ) ( not ( = ?auto_20544 ?auto_20587 ) ) ( not ( = ?auto_20548 ?auto_20579 ) ) ( not ( = ?auto_20548 ?auto_20581 ) ) ( not ( = ?auto_20548 ?auto_20575 ) ) ( not ( = ?auto_20548 ?auto_20591 ) ) ( not ( = ?auto_20548 ?auto_20565 ) ) ( not ( = ?auto_20548 ?auto_20585 ) ) ( not ( = ?auto_20548 ?auto_20574 ) ) ( not ( = ?auto_20548 ?auto_20576 ) ) ( not ( = ?auto_20548 ?auto_20580 ) ) ( not ( = ?auto_20548 ?auto_20588 ) ) ( not ( = ?auto_20548 ?auto_20578 ) ) ( not ( = ?auto_20548 ?auto_20577 ) ) ( not ( = ?auto_20587 ?auto_20579 ) ) ( not ( = ?auto_20587 ?auto_20581 ) ) ( not ( = ?auto_20587 ?auto_20575 ) ) ( not ( = ?auto_20587 ?auto_20591 ) ) ( not ( = ?auto_20587 ?auto_20565 ) ) ( not ( = ?auto_20587 ?auto_20585 ) ) ( not ( = ?auto_20587 ?auto_20574 ) ) ( not ( = ?auto_20587 ?auto_20576 ) ) ( not ( = ?auto_20587 ?auto_20580 ) ) ( not ( = ?auto_20587 ?auto_20588 ) ) ( not ( = ?auto_20587 ?auto_20578 ) ) ( not ( = ?auto_20587 ?auto_20577 ) ) ( not ( = ?auto_20534 ?auto_20549 ) ) ( not ( = ?auto_20534 ?auto_20558 ) ) ( not ( = ?auto_20535 ?auto_20549 ) ) ( not ( = ?auto_20535 ?auto_20558 ) ) ( not ( = ?auto_20536 ?auto_20549 ) ) ( not ( = ?auto_20536 ?auto_20558 ) ) ( not ( = ?auto_20537 ?auto_20549 ) ) ( not ( = ?auto_20537 ?auto_20558 ) ) ( not ( = ?auto_20538 ?auto_20549 ) ) ( not ( = ?auto_20538 ?auto_20558 ) ) ( not ( = ?auto_20541 ?auto_20549 ) ) ( not ( = ?auto_20541 ?auto_20558 ) ) ( not ( = ?auto_20539 ?auto_20549 ) ) ( not ( = ?auto_20539 ?auto_20558 ) ) ( not ( = ?auto_20543 ?auto_20549 ) ) ( not ( = ?auto_20543 ?auto_20558 ) ) ( not ( = ?auto_20542 ?auto_20549 ) ) ( not ( = ?auto_20542 ?auto_20558 ) ) ( not ( = ?auto_20540 ?auto_20549 ) ) ( not ( = ?auto_20540 ?auto_20558 ) ) ( not ( = ?auto_20545 ?auto_20549 ) ) ( not ( = ?auto_20545 ?auto_20558 ) ) ( not ( = ?auto_20544 ?auto_20549 ) ) ( not ( = ?auto_20544 ?auto_20558 ) ) ( not ( = ?auto_20546 ?auto_20549 ) ) ( not ( = ?auto_20546 ?auto_20558 ) ) ( not ( = ?auto_20549 ?auto_20587 ) ) ( not ( = ?auto_20549 ?auto_20579 ) ) ( not ( = ?auto_20549 ?auto_20581 ) ) ( not ( = ?auto_20549 ?auto_20575 ) ) ( not ( = ?auto_20549 ?auto_20591 ) ) ( not ( = ?auto_20549 ?auto_20565 ) ) ( not ( = ?auto_20549 ?auto_20585 ) ) ( not ( = ?auto_20549 ?auto_20574 ) ) ( not ( = ?auto_20549 ?auto_20576 ) ) ( not ( = ?auto_20549 ?auto_20580 ) ) ( not ( = ?auto_20549 ?auto_20588 ) ) ( not ( = ?auto_20549 ?auto_20578 ) ) ( not ( = ?auto_20549 ?auto_20577 ) ) ( not ( = ?auto_20570 ?auto_20557 ) ) ( not ( = ?auto_20570 ?auto_20556 ) ) ( not ( = ?auto_20570 ?auto_20571 ) ) ( not ( = ?auto_20570 ?auto_20586 ) ) ( not ( = ?auto_20570 ?auto_20590 ) ) ( not ( = ?auto_20570 ?auto_20564 ) ) ( not ( = ?auto_20570 ?auto_20573 ) ) ( not ( = ?auto_20570 ?auto_20567 ) ) ( not ( = ?auto_20570 ?auto_20559 ) ) ( not ( = ?auto_20570 ?auto_20572 ) ) ( not ( = ?auto_20563 ?auto_20583 ) ) ( not ( = ?auto_20563 ?auto_20562 ) ) ( not ( = ?auto_20563 ?auto_20561 ) ) ( not ( = ?auto_20563 ?auto_20569 ) ) ( not ( = ?auto_20563 ?auto_20560 ) ) ( not ( = ?auto_20563 ?auto_20582 ) ) ( not ( = ?auto_20563 ?auto_20568 ) ) ( not ( = ?auto_20563 ?auto_20566 ) ) ( not ( = ?auto_20563 ?auto_20584 ) ) ( not ( = ?auto_20563 ?auto_20589 ) ) ( not ( = ?auto_20558 ?auto_20587 ) ) ( not ( = ?auto_20558 ?auto_20579 ) ) ( not ( = ?auto_20558 ?auto_20581 ) ) ( not ( = ?auto_20558 ?auto_20575 ) ) ( not ( = ?auto_20558 ?auto_20591 ) ) ( not ( = ?auto_20558 ?auto_20565 ) ) ( not ( = ?auto_20558 ?auto_20585 ) ) ( not ( = ?auto_20558 ?auto_20574 ) ) ( not ( = ?auto_20558 ?auto_20576 ) ) ( not ( = ?auto_20558 ?auto_20580 ) ) ( not ( = ?auto_20558 ?auto_20588 ) ) ( not ( = ?auto_20558 ?auto_20578 ) ) ( not ( = ?auto_20558 ?auto_20577 ) ) ( not ( = ?auto_20534 ?auto_20547 ) ) ( not ( = ?auto_20534 ?auto_20554 ) ) ( not ( = ?auto_20535 ?auto_20547 ) ) ( not ( = ?auto_20535 ?auto_20554 ) ) ( not ( = ?auto_20536 ?auto_20547 ) ) ( not ( = ?auto_20536 ?auto_20554 ) ) ( not ( = ?auto_20537 ?auto_20547 ) ) ( not ( = ?auto_20537 ?auto_20554 ) ) ( not ( = ?auto_20538 ?auto_20547 ) ) ( not ( = ?auto_20538 ?auto_20554 ) ) ( not ( = ?auto_20541 ?auto_20547 ) ) ( not ( = ?auto_20541 ?auto_20554 ) ) ( not ( = ?auto_20539 ?auto_20547 ) ) ( not ( = ?auto_20539 ?auto_20554 ) ) ( not ( = ?auto_20543 ?auto_20547 ) ) ( not ( = ?auto_20543 ?auto_20554 ) ) ( not ( = ?auto_20542 ?auto_20547 ) ) ( not ( = ?auto_20542 ?auto_20554 ) ) ( not ( = ?auto_20540 ?auto_20547 ) ) ( not ( = ?auto_20540 ?auto_20554 ) ) ( not ( = ?auto_20545 ?auto_20547 ) ) ( not ( = ?auto_20545 ?auto_20554 ) ) ( not ( = ?auto_20544 ?auto_20547 ) ) ( not ( = ?auto_20544 ?auto_20554 ) ) ( not ( = ?auto_20546 ?auto_20547 ) ) ( not ( = ?auto_20546 ?auto_20554 ) ) ( not ( = ?auto_20548 ?auto_20547 ) ) ( not ( = ?auto_20548 ?auto_20554 ) ) ( not ( = ?auto_20547 ?auto_20558 ) ) ( not ( = ?auto_20547 ?auto_20587 ) ) ( not ( = ?auto_20547 ?auto_20579 ) ) ( not ( = ?auto_20547 ?auto_20581 ) ) ( not ( = ?auto_20547 ?auto_20575 ) ) ( not ( = ?auto_20547 ?auto_20591 ) ) ( not ( = ?auto_20547 ?auto_20565 ) ) ( not ( = ?auto_20547 ?auto_20585 ) ) ( not ( = ?auto_20547 ?auto_20574 ) ) ( not ( = ?auto_20547 ?auto_20576 ) ) ( not ( = ?auto_20547 ?auto_20580 ) ) ( not ( = ?auto_20547 ?auto_20588 ) ) ( not ( = ?auto_20547 ?auto_20578 ) ) ( not ( = ?auto_20547 ?auto_20577 ) ) ( not ( = ?auto_20553 ?auto_20570 ) ) ( not ( = ?auto_20553 ?auto_20557 ) ) ( not ( = ?auto_20553 ?auto_20556 ) ) ( not ( = ?auto_20553 ?auto_20571 ) ) ( not ( = ?auto_20553 ?auto_20586 ) ) ( not ( = ?auto_20553 ?auto_20590 ) ) ( not ( = ?auto_20553 ?auto_20564 ) ) ( not ( = ?auto_20553 ?auto_20573 ) ) ( not ( = ?auto_20553 ?auto_20567 ) ) ( not ( = ?auto_20553 ?auto_20559 ) ) ( not ( = ?auto_20553 ?auto_20572 ) ) ( not ( = ?auto_20552 ?auto_20563 ) ) ( not ( = ?auto_20552 ?auto_20583 ) ) ( not ( = ?auto_20552 ?auto_20562 ) ) ( not ( = ?auto_20552 ?auto_20561 ) ) ( not ( = ?auto_20552 ?auto_20569 ) ) ( not ( = ?auto_20552 ?auto_20560 ) ) ( not ( = ?auto_20552 ?auto_20582 ) ) ( not ( = ?auto_20552 ?auto_20568 ) ) ( not ( = ?auto_20552 ?auto_20566 ) ) ( not ( = ?auto_20552 ?auto_20584 ) ) ( not ( = ?auto_20552 ?auto_20589 ) ) ( not ( = ?auto_20554 ?auto_20558 ) ) ( not ( = ?auto_20554 ?auto_20587 ) ) ( not ( = ?auto_20554 ?auto_20579 ) ) ( not ( = ?auto_20554 ?auto_20581 ) ) ( not ( = ?auto_20554 ?auto_20575 ) ) ( not ( = ?auto_20554 ?auto_20591 ) ) ( not ( = ?auto_20554 ?auto_20565 ) ) ( not ( = ?auto_20554 ?auto_20585 ) ) ( not ( = ?auto_20554 ?auto_20574 ) ) ( not ( = ?auto_20554 ?auto_20576 ) ) ( not ( = ?auto_20554 ?auto_20580 ) ) ( not ( = ?auto_20554 ?auto_20588 ) ) ( not ( = ?auto_20554 ?auto_20578 ) ) ( not ( = ?auto_20554 ?auto_20577 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_20534 ?auto_20535 ?auto_20536 ?auto_20537 ?auto_20538 ?auto_20541 ?auto_20539 ?auto_20543 ?auto_20542 ?auto_20540 ?auto_20545 ?auto_20544 ?auto_20546 ?auto_20548 ?auto_20549 )
      ( MAKE-1CRATE ?auto_20549 ?auto_20547 )
      ( MAKE-15CRATE-VERIFY ?auto_20534 ?auto_20535 ?auto_20536 ?auto_20537 ?auto_20538 ?auto_20541 ?auto_20539 ?auto_20543 ?auto_20542 ?auto_20540 ?auto_20545 ?auto_20544 ?auto_20546 ?auto_20548 ?auto_20549 ?auto_20547 ) )
  )

)

