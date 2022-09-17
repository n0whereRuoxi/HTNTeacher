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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15800 - SURFACE
      ?auto_15801 - SURFACE
    )
    :vars
    (
      ?auto_15802 - HOIST
      ?auto_15803 - PLACE
      ?auto_15805 - PLACE
      ?auto_15806 - HOIST
      ?auto_15807 - SURFACE
      ?auto_15804 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15802 ?auto_15803 ) ( SURFACE-AT ?auto_15800 ?auto_15803 ) ( CLEAR ?auto_15800 ) ( IS-CRATE ?auto_15801 ) ( AVAILABLE ?auto_15802 ) ( not ( = ?auto_15805 ?auto_15803 ) ) ( HOIST-AT ?auto_15806 ?auto_15805 ) ( AVAILABLE ?auto_15806 ) ( SURFACE-AT ?auto_15801 ?auto_15805 ) ( ON ?auto_15801 ?auto_15807 ) ( CLEAR ?auto_15801 ) ( TRUCK-AT ?auto_15804 ?auto_15803 ) ( not ( = ?auto_15800 ?auto_15801 ) ) ( not ( = ?auto_15800 ?auto_15807 ) ) ( not ( = ?auto_15801 ?auto_15807 ) ) ( not ( = ?auto_15802 ?auto_15806 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15804 ?auto_15803 ?auto_15805 )
      ( !LIFT ?auto_15806 ?auto_15801 ?auto_15807 ?auto_15805 )
      ( !LOAD ?auto_15806 ?auto_15801 ?auto_15804 ?auto_15805 )
      ( !DRIVE ?auto_15804 ?auto_15805 ?auto_15803 )
      ( !UNLOAD ?auto_15802 ?auto_15801 ?auto_15804 ?auto_15803 )
      ( !DROP ?auto_15802 ?auto_15801 ?auto_15800 ?auto_15803 )
      ( MAKE-1CRATE-VERIFY ?auto_15800 ?auto_15801 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15810 - SURFACE
      ?auto_15811 - SURFACE
    )
    :vars
    (
      ?auto_15812 - HOIST
      ?auto_15813 - PLACE
      ?auto_15815 - PLACE
      ?auto_15816 - HOIST
      ?auto_15817 - SURFACE
      ?auto_15814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15812 ?auto_15813 ) ( SURFACE-AT ?auto_15810 ?auto_15813 ) ( CLEAR ?auto_15810 ) ( IS-CRATE ?auto_15811 ) ( AVAILABLE ?auto_15812 ) ( not ( = ?auto_15815 ?auto_15813 ) ) ( HOIST-AT ?auto_15816 ?auto_15815 ) ( AVAILABLE ?auto_15816 ) ( SURFACE-AT ?auto_15811 ?auto_15815 ) ( ON ?auto_15811 ?auto_15817 ) ( CLEAR ?auto_15811 ) ( TRUCK-AT ?auto_15814 ?auto_15813 ) ( not ( = ?auto_15810 ?auto_15811 ) ) ( not ( = ?auto_15810 ?auto_15817 ) ) ( not ( = ?auto_15811 ?auto_15817 ) ) ( not ( = ?auto_15812 ?auto_15816 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15814 ?auto_15813 ?auto_15815 )
      ( !LIFT ?auto_15816 ?auto_15811 ?auto_15817 ?auto_15815 )
      ( !LOAD ?auto_15816 ?auto_15811 ?auto_15814 ?auto_15815 )
      ( !DRIVE ?auto_15814 ?auto_15815 ?auto_15813 )
      ( !UNLOAD ?auto_15812 ?auto_15811 ?auto_15814 ?auto_15813 )
      ( !DROP ?auto_15812 ?auto_15811 ?auto_15810 ?auto_15813 )
      ( MAKE-1CRATE-VERIFY ?auto_15810 ?auto_15811 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15821 - SURFACE
      ?auto_15822 - SURFACE
      ?auto_15823 - SURFACE
    )
    :vars
    (
      ?auto_15825 - HOIST
      ?auto_15827 - PLACE
      ?auto_15828 - PLACE
      ?auto_15826 - HOIST
      ?auto_15829 - SURFACE
      ?auto_15831 - PLACE
      ?auto_15832 - HOIST
      ?auto_15830 - SURFACE
      ?auto_15824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15825 ?auto_15827 ) ( IS-CRATE ?auto_15823 ) ( not ( = ?auto_15828 ?auto_15827 ) ) ( HOIST-AT ?auto_15826 ?auto_15828 ) ( AVAILABLE ?auto_15826 ) ( SURFACE-AT ?auto_15823 ?auto_15828 ) ( ON ?auto_15823 ?auto_15829 ) ( CLEAR ?auto_15823 ) ( not ( = ?auto_15822 ?auto_15823 ) ) ( not ( = ?auto_15822 ?auto_15829 ) ) ( not ( = ?auto_15823 ?auto_15829 ) ) ( not ( = ?auto_15825 ?auto_15826 ) ) ( SURFACE-AT ?auto_15821 ?auto_15827 ) ( CLEAR ?auto_15821 ) ( IS-CRATE ?auto_15822 ) ( AVAILABLE ?auto_15825 ) ( not ( = ?auto_15831 ?auto_15827 ) ) ( HOIST-AT ?auto_15832 ?auto_15831 ) ( AVAILABLE ?auto_15832 ) ( SURFACE-AT ?auto_15822 ?auto_15831 ) ( ON ?auto_15822 ?auto_15830 ) ( CLEAR ?auto_15822 ) ( TRUCK-AT ?auto_15824 ?auto_15827 ) ( not ( = ?auto_15821 ?auto_15822 ) ) ( not ( = ?auto_15821 ?auto_15830 ) ) ( not ( = ?auto_15822 ?auto_15830 ) ) ( not ( = ?auto_15825 ?auto_15832 ) ) ( not ( = ?auto_15821 ?auto_15823 ) ) ( not ( = ?auto_15821 ?auto_15829 ) ) ( not ( = ?auto_15823 ?auto_15830 ) ) ( not ( = ?auto_15828 ?auto_15831 ) ) ( not ( = ?auto_15826 ?auto_15832 ) ) ( not ( = ?auto_15829 ?auto_15830 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15821 ?auto_15822 )
      ( MAKE-1CRATE ?auto_15822 ?auto_15823 )
      ( MAKE-2CRATE-VERIFY ?auto_15821 ?auto_15822 ?auto_15823 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15835 - SURFACE
      ?auto_15836 - SURFACE
    )
    :vars
    (
      ?auto_15837 - HOIST
      ?auto_15838 - PLACE
      ?auto_15840 - PLACE
      ?auto_15841 - HOIST
      ?auto_15842 - SURFACE
      ?auto_15839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15837 ?auto_15838 ) ( SURFACE-AT ?auto_15835 ?auto_15838 ) ( CLEAR ?auto_15835 ) ( IS-CRATE ?auto_15836 ) ( AVAILABLE ?auto_15837 ) ( not ( = ?auto_15840 ?auto_15838 ) ) ( HOIST-AT ?auto_15841 ?auto_15840 ) ( AVAILABLE ?auto_15841 ) ( SURFACE-AT ?auto_15836 ?auto_15840 ) ( ON ?auto_15836 ?auto_15842 ) ( CLEAR ?auto_15836 ) ( TRUCK-AT ?auto_15839 ?auto_15838 ) ( not ( = ?auto_15835 ?auto_15836 ) ) ( not ( = ?auto_15835 ?auto_15842 ) ) ( not ( = ?auto_15836 ?auto_15842 ) ) ( not ( = ?auto_15837 ?auto_15841 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15839 ?auto_15838 ?auto_15840 )
      ( !LIFT ?auto_15841 ?auto_15836 ?auto_15842 ?auto_15840 )
      ( !LOAD ?auto_15841 ?auto_15836 ?auto_15839 ?auto_15840 )
      ( !DRIVE ?auto_15839 ?auto_15840 ?auto_15838 )
      ( !UNLOAD ?auto_15837 ?auto_15836 ?auto_15839 ?auto_15838 )
      ( !DROP ?auto_15837 ?auto_15836 ?auto_15835 ?auto_15838 )
      ( MAKE-1CRATE-VERIFY ?auto_15835 ?auto_15836 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15847 - SURFACE
      ?auto_15848 - SURFACE
      ?auto_15849 - SURFACE
      ?auto_15850 - SURFACE
    )
    :vars
    (
      ?auto_15855 - HOIST
      ?auto_15853 - PLACE
      ?auto_15851 - PLACE
      ?auto_15856 - HOIST
      ?auto_15852 - SURFACE
      ?auto_15858 - PLACE
      ?auto_15861 - HOIST
      ?auto_15862 - SURFACE
      ?auto_15860 - PLACE
      ?auto_15857 - HOIST
      ?auto_15859 - SURFACE
      ?auto_15854 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15855 ?auto_15853 ) ( IS-CRATE ?auto_15850 ) ( not ( = ?auto_15851 ?auto_15853 ) ) ( HOIST-AT ?auto_15856 ?auto_15851 ) ( AVAILABLE ?auto_15856 ) ( SURFACE-AT ?auto_15850 ?auto_15851 ) ( ON ?auto_15850 ?auto_15852 ) ( CLEAR ?auto_15850 ) ( not ( = ?auto_15849 ?auto_15850 ) ) ( not ( = ?auto_15849 ?auto_15852 ) ) ( not ( = ?auto_15850 ?auto_15852 ) ) ( not ( = ?auto_15855 ?auto_15856 ) ) ( IS-CRATE ?auto_15849 ) ( not ( = ?auto_15858 ?auto_15853 ) ) ( HOIST-AT ?auto_15861 ?auto_15858 ) ( AVAILABLE ?auto_15861 ) ( SURFACE-AT ?auto_15849 ?auto_15858 ) ( ON ?auto_15849 ?auto_15862 ) ( CLEAR ?auto_15849 ) ( not ( = ?auto_15848 ?auto_15849 ) ) ( not ( = ?auto_15848 ?auto_15862 ) ) ( not ( = ?auto_15849 ?auto_15862 ) ) ( not ( = ?auto_15855 ?auto_15861 ) ) ( SURFACE-AT ?auto_15847 ?auto_15853 ) ( CLEAR ?auto_15847 ) ( IS-CRATE ?auto_15848 ) ( AVAILABLE ?auto_15855 ) ( not ( = ?auto_15860 ?auto_15853 ) ) ( HOIST-AT ?auto_15857 ?auto_15860 ) ( AVAILABLE ?auto_15857 ) ( SURFACE-AT ?auto_15848 ?auto_15860 ) ( ON ?auto_15848 ?auto_15859 ) ( CLEAR ?auto_15848 ) ( TRUCK-AT ?auto_15854 ?auto_15853 ) ( not ( = ?auto_15847 ?auto_15848 ) ) ( not ( = ?auto_15847 ?auto_15859 ) ) ( not ( = ?auto_15848 ?auto_15859 ) ) ( not ( = ?auto_15855 ?auto_15857 ) ) ( not ( = ?auto_15847 ?auto_15849 ) ) ( not ( = ?auto_15847 ?auto_15862 ) ) ( not ( = ?auto_15849 ?auto_15859 ) ) ( not ( = ?auto_15858 ?auto_15860 ) ) ( not ( = ?auto_15861 ?auto_15857 ) ) ( not ( = ?auto_15862 ?auto_15859 ) ) ( not ( = ?auto_15847 ?auto_15850 ) ) ( not ( = ?auto_15847 ?auto_15852 ) ) ( not ( = ?auto_15848 ?auto_15850 ) ) ( not ( = ?auto_15848 ?auto_15852 ) ) ( not ( = ?auto_15850 ?auto_15862 ) ) ( not ( = ?auto_15850 ?auto_15859 ) ) ( not ( = ?auto_15851 ?auto_15858 ) ) ( not ( = ?auto_15851 ?auto_15860 ) ) ( not ( = ?auto_15856 ?auto_15861 ) ) ( not ( = ?auto_15856 ?auto_15857 ) ) ( not ( = ?auto_15852 ?auto_15862 ) ) ( not ( = ?auto_15852 ?auto_15859 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15847 ?auto_15848 ?auto_15849 )
      ( MAKE-1CRATE ?auto_15849 ?auto_15850 )
      ( MAKE-3CRATE-VERIFY ?auto_15847 ?auto_15848 ?auto_15849 ?auto_15850 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15865 - SURFACE
      ?auto_15866 - SURFACE
    )
    :vars
    (
      ?auto_15867 - HOIST
      ?auto_15868 - PLACE
      ?auto_15870 - PLACE
      ?auto_15871 - HOIST
      ?auto_15872 - SURFACE
      ?auto_15869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15867 ?auto_15868 ) ( SURFACE-AT ?auto_15865 ?auto_15868 ) ( CLEAR ?auto_15865 ) ( IS-CRATE ?auto_15866 ) ( AVAILABLE ?auto_15867 ) ( not ( = ?auto_15870 ?auto_15868 ) ) ( HOIST-AT ?auto_15871 ?auto_15870 ) ( AVAILABLE ?auto_15871 ) ( SURFACE-AT ?auto_15866 ?auto_15870 ) ( ON ?auto_15866 ?auto_15872 ) ( CLEAR ?auto_15866 ) ( TRUCK-AT ?auto_15869 ?auto_15868 ) ( not ( = ?auto_15865 ?auto_15866 ) ) ( not ( = ?auto_15865 ?auto_15872 ) ) ( not ( = ?auto_15866 ?auto_15872 ) ) ( not ( = ?auto_15867 ?auto_15871 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15869 ?auto_15868 ?auto_15870 )
      ( !LIFT ?auto_15871 ?auto_15866 ?auto_15872 ?auto_15870 )
      ( !LOAD ?auto_15871 ?auto_15866 ?auto_15869 ?auto_15870 )
      ( !DRIVE ?auto_15869 ?auto_15870 ?auto_15868 )
      ( !UNLOAD ?auto_15867 ?auto_15866 ?auto_15869 ?auto_15868 )
      ( !DROP ?auto_15867 ?auto_15866 ?auto_15865 ?auto_15868 )
      ( MAKE-1CRATE-VERIFY ?auto_15865 ?auto_15866 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15878 - SURFACE
      ?auto_15879 - SURFACE
      ?auto_15880 - SURFACE
      ?auto_15881 - SURFACE
      ?auto_15882 - SURFACE
    )
    :vars
    (
      ?auto_15886 - HOIST
      ?auto_15884 - PLACE
      ?auto_15885 - PLACE
      ?auto_15888 - HOIST
      ?auto_15887 - SURFACE
      ?auto_15890 - PLACE
      ?auto_15897 - HOIST
      ?auto_15894 - SURFACE
      ?auto_15893 - PLACE
      ?auto_15891 - HOIST
      ?auto_15889 - SURFACE
      ?auto_15892 - PLACE
      ?auto_15895 - HOIST
      ?auto_15896 - SURFACE
      ?auto_15883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15886 ?auto_15884 ) ( IS-CRATE ?auto_15882 ) ( not ( = ?auto_15885 ?auto_15884 ) ) ( HOIST-AT ?auto_15888 ?auto_15885 ) ( AVAILABLE ?auto_15888 ) ( SURFACE-AT ?auto_15882 ?auto_15885 ) ( ON ?auto_15882 ?auto_15887 ) ( CLEAR ?auto_15882 ) ( not ( = ?auto_15881 ?auto_15882 ) ) ( not ( = ?auto_15881 ?auto_15887 ) ) ( not ( = ?auto_15882 ?auto_15887 ) ) ( not ( = ?auto_15886 ?auto_15888 ) ) ( IS-CRATE ?auto_15881 ) ( not ( = ?auto_15890 ?auto_15884 ) ) ( HOIST-AT ?auto_15897 ?auto_15890 ) ( AVAILABLE ?auto_15897 ) ( SURFACE-AT ?auto_15881 ?auto_15890 ) ( ON ?auto_15881 ?auto_15894 ) ( CLEAR ?auto_15881 ) ( not ( = ?auto_15880 ?auto_15881 ) ) ( not ( = ?auto_15880 ?auto_15894 ) ) ( not ( = ?auto_15881 ?auto_15894 ) ) ( not ( = ?auto_15886 ?auto_15897 ) ) ( IS-CRATE ?auto_15880 ) ( not ( = ?auto_15893 ?auto_15884 ) ) ( HOIST-AT ?auto_15891 ?auto_15893 ) ( AVAILABLE ?auto_15891 ) ( SURFACE-AT ?auto_15880 ?auto_15893 ) ( ON ?auto_15880 ?auto_15889 ) ( CLEAR ?auto_15880 ) ( not ( = ?auto_15879 ?auto_15880 ) ) ( not ( = ?auto_15879 ?auto_15889 ) ) ( not ( = ?auto_15880 ?auto_15889 ) ) ( not ( = ?auto_15886 ?auto_15891 ) ) ( SURFACE-AT ?auto_15878 ?auto_15884 ) ( CLEAR ?auto_15878 ) ( IS-CRATE ?auto_15879 ) ( AVAILABLE ?auto_15886 ) ( not ( = ?auto_15892 ?auto_15884 ) ) ( HOIST-AT ?auto_15895 ?auto_15892 ) ( AVAILABLE ?auto_15895 ) ( SURFACE-AT ?auto_15879 ?auto_15892 ) ( ON ?auto_15879 ?auto_15896 ) ( CLEAR ?auto_15879 ) ( TRUCK-AT ?auto_15883 ?auto_15884 ) ( not ( = ?auto_15878 ?auto_15879 ) ) ( not ( = ?auto_15878 ?auto_15896 ) ) ( not ( = ?auto_15879 ?auto_15896 ) ) ( not ( = ?auto_15886 ?auto_15895 ) ) ( not ( = ?auto_15878 ?auto_15880 ) ) ( not ( = ?auto_15878 ?auto_15889 ) ) ( not ( = ?auto_15880 ?auto_15896 ) ) ( not ( = ?auto_15893 ?auto_15892 ) ) ( not ( = ?auto_15891 ?auto_15895 ) ) ( not ( = ?auto_15889 ?auto_15896 ) ) ( not ( = ?auto_15878 ?auto_15881 ) ) ( not ( = ?auto_15878 ?auto_15894 ) ) ( not ( = ?auto_15879 ?auto_15881 ) ) ( not ( = ?auto_15879 ?auto_15894 ) ) ( not ( = ?auto_15881 ?auto_15889 ) ) ( not ( = ?auto_15881 ?auto_15896 ) ) ( not ( = ?auto_15890 ?auto_15893 ) ) ( not ( = ?auto_15890 ?auto_15892 ) ) ( not ( = ?auto_15897 ?auto_15891 ) ) ( not ( = ?auto_15897 ?auto_15895 ) ) ( not ( = ?auto_15894 ?auto_15889 ) ) ( not ( = ?auto_15894 ?auto_15896 ) ) ( not ( = ?auto_15878 ?auto_15882 ) ) ( not ( = ?auto_15878 ?auto_15887 ) ) ( not ( = ?auto_15879 ?auto_15882 ) ) ( not ( = ?auto_15879 ?auto_15887 ) ) ( not ( = ?auto_15880 ?auto_15882 ) ) ( not ( = ?auto_15880 ?auto_15887 ) ) ( not ( = ?auto_15882 ?auto_15894 ) ) ( not ( = ?auto_15882 ?auto_15889 ) ) ( not ( = ?auto_15882 ?auto_15896 ) ) ( not ( = ?auto_15885 ?auto_15890 ) ) ( not ( = ?auto_15885 ?auto_15893 ) ) ( not ( = ?auto_15885 ?auto_15892 ) ) ( not ( = ?auto_15888 ?auto_15897 ) ) ( not ( = ?auto_15888 ?auto_15891 ) ) ( not ( = ?auto_15888 ?auto_15895 ) ) ( not ( = ?auto_15887 ?auto_15894 ) ) ( not ( = ?auto_15887 ?auto_15889 ) ) ( not ( = ?auto_15887 ?auto_15896 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_15878 ?auto_15879 ?auto_15880 ?auto_15881 )
      ( MAKE-1CRATE ?auto_15881 ?auto_15882 )
      ( MAKE-4CRATE-VERIFY ?auto_15878 ?auto_15879 ?auto_15880 ?auto_15881 ?auto_15882 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15900 - SURFACE
      ?auto_15901 - SURFACE
    )
    :vars
    (
      ?auto_15902 - HOIST
      ?auto_15903 - PLACE
      ?auto_15905 - PLACE
      ?auto_15906 - HOIST
      ?auto_15907 - SURFACE
      ?auto_15904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15902 ?auto_15903 ) ( SURFACE-AT ?auto_15900 ?auto_15903 ) ( CLEAR ?auto_15900 ) ( IS-CRATE ?auto_15901 ) ( AVAILABLE ?auto_15902 ) ( not ( = ?auto_15905 ?auto_15903 ) ) ( HOIST-AT ?auto_15906 ?auto_15905 ) ( AVAILABLE ?auto_15906 ) ( SURFACE-AT ?auto_15901 ?auto_15905 ) ( ON ?auto_15901 ?auto_15907 ) ( CLEAR ?auto_15901 ) ( TRUCK-AT ?auto_15904 ?auto_15903 ) ( not ( = ?auto_15900 ?auto_15901 ) ) ( not ( = ?auto_15900 ?auto_15907 ) ) ( not ( = ?auto_15901 ?auto_15907 ) ) ( not ( = ?auto_15902 ?auto_15906 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15904 ?auto_15903 ?auto_15905 )
      ( !LIFT ?auto_15906 ?auto_15901 ?auto_15907 ?auto_15905 )
      ( !LOAD ?auto_15906 ?auto_15901 ?auto_15904 ?auto_15905 )
      ( !DRIVE ?auto_15904 ?auto_15905 ?auto_15903 )
      ( !UNLOAD ?auto_15902 ?auto_15901 ?auto_15904 ?auto_15903 )
      ( !DROP ?auto_15902 ?auto_15901 ?auto_15900 ?auto_15903 )
      ( MAKE-1CRATE-VERIFY ?auto_15900 ?auto_15901 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_15914 - SURFACE
      ?auto_15915 - SURFACE
      ?auto_15916 - SURFACE
      ?auto_15917 - SURFACE
      ?auto_15918 - SURFACE
      ?auto_15919 - SURFACE
    )
    :vars
    (
      ?auto_15923 - HOIST
      ?auto_15925 - PLACE
      ?auto_15924 - PLACE
      ?auto_15922 - HOIST
      ?auto_15921 - SURFACE
      ?auto_15937 - PLACE
      ?auto_15936 - HOIST
      ?auto_15927 - SURFACE
      ?auto_15928 - PLACE
      ?auto_15932 - HOIST
      ?auto_15934 - SURFACE
      ?auto_15926 - PLACE
      ?auto_15929 - HOIST
      ?auto_15931 - SURFACE
      ?auto_15935 - PLACE
      ?auto_15933 - HOIST
      ?auto_15930 - SURFACE
      ?auto_15920 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15923 ?auto_15925 ) ( IS-CRATE ?auto_15919 ) ( not ( = ?auto_15924 ?auto_15925 ) ) ( HOIST-AT ?auto_15922 ?auto_15924 ) ( AVAILABLE ?auto_15922 ) ( SURFACE-AT ?auto_15919 ?auto_15924 ) ( ON ?auto_15919 ?auto_15921 ) ( CLEAR ?auto_15919 ) ( not ( = ?auto_15918 ?auto_15919 ) ) ( not ( = ?auto_15918 ?auto_15921 ) ) ( not ( = ?auto_15919 ?auto_15921 ) ) ( not ( = ?auto_15923 ?auto_15922 ) ) ( IS-CRATE ?auto_15918 ) ( not ( = ?auto_15937 ?auto_15925 ) ) ( HOIST-AT ?auto_15936 ?auto_15937 ) ( AVAILABLE ?auto_15936 ) ( SURFACE-AT ?auto_15918 ?auto_15937 ) ( ON ?auto_15918 ?auto_15927 ) ( CLEAR ?auto_15918 ) ( not ( = ?auto_15917 ?auto_15918 ) ) ( not ( = ?auto_15917 ?auto_15927 ) ) ( not ( = ?auto_15918 ?auto_15927 ) ) ( not ( = ?auto_15923 ?auto_15936 ) ) ( IS-CRATE ?auto_15917 ) ( not ( = ?auto_15928 ?auto_15925 ) ) ( HOIST-AT ?auto_15932 ?auto_15928 ) ( AVAILABLE ?auto_15932 ) ( SURFACE-AT ?auto_15917 ?auto_15928 ) ( ON ?auto_15917 ?auto_15934 ) ( CLEAR ?auto_15917 ) ( not ( = ?auto_15916 ?auto_15917 ) ) ( not ( = ?auto_15916 ?auto_15934 ) ) ( not ( = ?auto_15917 ?auto_15934 ) ) ( not ( = ?auto_15923 ?auto_15932 ) ) ( IS-CRATE ?auto_15916 ) ( not ( = ?auto_15926 ?auto_15925 ) ) ( HOIST-AT ?auto_15929 ?auto_15926 ) ( AVAILABLE ?auto_15929 ) ( SURFACE-AT ?auto_15916 ?auto_15926 ) ( ON ?auto_15916 ?auto_15931 ) ( CLEAR ?auto_15916 ) ( not ( = ?auto_15915 ?auto_15916 ) ) ( not ( = ?auto_15915 ?auto_15931 ) ) ( not ( = ?auto_15916 ?auto_15931 ) ) ( not ( = ?auto_15923 ?auto_15929 ) ) ( SURFACE-AT ?auto_15914 ?auto_15925 ) ( CLEAR ?auto_15914 ) ( IS-CRATE ?auto_15915 ) ( AVAILABLE ?auto_15923 ) ( not ( = ?auto_15935 ?auto_15925 ) ) ( HOIST-AT ?auto_15933 ?auto_15935 ) ( AVAILABLE ?auto_15933 ) ( SURFACE-AT ?auto_15915 ?auto_15935 ) ( ON ?auto_15915 ?auto_15930 ) ( CLEAR ?auto_15915 ) ( TRUCK-AT ?auto_15920 ?auto_15925 ) ( not ( = ?auto_15914 ?auto_15915 ) ) ( not ( = ?auto_15914 ?auto_15930 ) ) ( not ( = ?auto_15915 ?auto_15930 ) ) ( not ( = ?auto_15923 ?auto_15933 ) ) ( not ( = ?auto_15914 ?auto_15916 ) ) ( not ( = ?auto_15914 ?auto_15931 ) ) ( not ( = ?auto_15916 ?auto_15930 ) ) ( not ( = ?auto_15926 ?auto_15935 ) ) ( not ( = ?auto_15929 ?auto_15933 ) ) ( not ( = ?auto_15931 ?auto_15930 ) ) ( not ( = ?auto_15914 ?auto_15917 ) ) ( not ( = ?auto_15914 ?auto_15934 ) ) ( not ( = ?auto_15915 ?auto_15917 ) ) ( not ( = ?auto_15915 ?auto_15934 ) ) ( not ( = ?auto_15917 ?auto_15931 ) ) ( not ( = ?auto_15917 ?auto_15930 ) ) ( not ( = ?auto_15928 ?auto_15926 ) ) ( not ( = ?auto_15928 ?auto_15935 ) ) ( not ( = ?auto_15932 ?auto_15929 ) ) ( not ( = ?auto_15932 ?auto_15933 ) ) ( not ( = ?auto_15934 ?auto_15931 ) ) ( not ( = ?auto_15934 ?auto_15930 ) ) ( not ( = ?auto_15914 ?auto_15918 ) ) ( not ( = ?auto_15914 ?auto_15927 ) ) ( not ( = ?auto_15915 ?auto_15918 ) ) ( not ( = ?auto_15915 ?auto_15927 ) ) ( not ( = ?auto_15916 ?auto_15918 ) ) ( not ( = ?auto_15916 ?auto_15927 ) ) ( not ( = ?auto_15918 ?auto_15934 ) ) ( not ( = ?auto_15918 ?auto_15931 ) ) ( not ( = ?auto_15918 ?auto_15930 ) ) ( not ( = ?auto_15937 ?auto_15928 ) ) ( not ( = ?auto_15937 ?auto_15926 ) ) ( not ( = ?auto_15937 ?auto_15935 ) ) ( not ( = ?auto_15936 ?auto_15932 ) ) ( not ( = ?auto_15936 ?auto_15929 ) ) ( not ( = ?auto_15936 ?auto_15933 ) ) ( not ( = ?auto_15927 ?auto_15934 ) ) ( not ( = ?auto_15927 ?auto_15931 ) ) ( not ( = ?auto_15927 ?auto_15930 ) ) ( not ( = ?auto_15914 ?auto_15919 ) ) ( not ( = ?auto_15914 ?auto_15921 ) ) ( not ( = ?auto_15915 ?auto_15919 ) ) ( not ( = ?auto_15915 ?auto_15921 ) ) ( not ( = ?auto_15916 ?auto_15919 ) ) ( not ( = ?auto_15916 ?auto_15921 ) ) ( not ( = ?auto_15917 ?auto_15919 ) ) ( not ( = ?auto_15917 ?auto_15921 ) ) ( not ( = ?auto_15919 ?auto_15927 ) ) ( not ( = ?auto_15919 ?auto_15934 ) ) ( not ( = ?auto_15919 ?auto_15931 ) ) ( not ( = ?auto_15919 ?auto_15930 ) ) ( not ( = ?auto_15924 ?auto_15937 ) ) ( not ( = ?auto_15924 ?auto_15928 ) ) ( not ( = ?auto_15924 ?auto_15926 ) ) ( not ( = ?auto_15924 ?auto_15935 ) ) ( not ( = ?auto_15922 ?auto_15936 ) ) ( not ( = ?auto_15922 ?auto_15932 ) ) ( not ( = ?auto_15922 ?auto_15929 ) ) ( not ( = ?auto_15922 ?auto_15933 ) ) ( not ( = ?auto_15921 ?auto_15927 ) ) ( not ( = ?auto_15921 ?auto_15934 ) ) ( not ( = ?auto_15921 ?auto_15931 ) ) ( not ( = ?auto_15921 ?auto_15930 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_15914 ?auto_15915 ?auto_15916 ?auto_15917 ?auto_15918 )
      ( MAKE-1CRATE ?auto_15918 ?auto_15919 )
      ( MAKE-5CRATE-VERIFY ?auto_15914 ?auto_15915 ?auto_15916 ?auto_15917 ?auto_15918 ?auto_15919 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15940 - SURFACE
      ?auto_15941 - SURFACE
    )
    :vars
    (
      ?auto_15942 - HOIST
      ?auto_15943 - PLACE
      ?auto_15945 - PLACE
      ?auto_15946 - HOIST
      ?auto_15947 - SURFACE
      ?auto_15944 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15942 ?auto_15943 ) ( SURFACE-AT ?auto_15940 ?auto_15943 ) ( CLEAR ?auto_15940 ) ( IS-CRATE ?auto_15941 ) ( AVAILABLE ?auto_15942 ) ( not ( = ?auto_15945 ?auto_15943 ) ) ( HOIST-AT ?auto_15946 ?auto_15945 ) ( AVAILABLE ?auto_15946 ) ( SURFACE-AT ?auto_15941 ?auto_15945 ) ( ON ?auto_15941 ?auto_15947 ) ( CLEAR ?auto_15941 ) ( TRUCK-AT ?auto_15944 ?auto_15943 ) ( not ( = ?auto_15940 ?auto_15941 ) ) ( not ( = ?auto_15940 ?auto_15947 ) ) ( not ( = ?auto_15941 ?auto_15947 ) ) ( not ( = ?auto_15942 ?auto_15946 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15944 ?auto_15943 ?auto_15945 )
      ( !LIFT ?auto_15946 ?auto_15941 ?auto_15947 ?auto_15945 )
      ( !LOAD ?auto_15946 ?auto_15941 ?auto_15944 ?auto_15945 )
      ( !DRIVE ?auto_15944 ?auto_15945 ?auto_15943 )
      ( !UNLOAD ?auto_15942 ?auto_15941 ?auto_15944 ?auto_15943 )
      ( !DROP ?auto_15942 ?auto_15941 ?auto_15940 ?auto_15943 )
      ( MAKE-1CRATE-VERIFY ?auto_15940 ?auto_15941 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_15955 - SURFACE
      ?auto_15956 - SURFACE
      ?auto_15957 - SURFACE
      ?auto_15958 - SURFACE
      ?auto_15959 - SURFACE
      ?auto_15961 - SURFACE
      ?auto_15960 - SURFACE
    )
    :vars
    (
      ?auto_15965 - HOIST
      ?auto_15966 - PLACE
      ?auto_15964 - PLACE
      ?auto_15962 - HOIST
      ?auto_15963 - SURFACE
      ?auto_15980 - PLACE
      ?auto_15978 - HOIST
      ?auto_15977 - SURFACE
      ?auto_15971 - PLACE
      ?auto_15968 - HOIST
      ?auto_15981 - SURFACE
      ?auto_15982 - PLACE
      ?auto_15974 - HOIST
      ?auto_15979 - SURFACE
      ?auto_15969 - PLACE
      ?auto_15972 - HOIST
      ?auto_15975 - SURFACE
      ?auto_15970 - PLACE
      ?auto_15973 - HOIST
      ?auto_15976 - SURFACE
      ?auto_15967 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15965 ?auto_15966 ) ( IS-CRATE ?auto_15960 ) ( not ( = ?auto_15964 ?auto_15966 ) ) ( HOIST-AT ?auto_15962 ?auto_15964 ) ( AVAILABLE ?auto_15962 ) ( SURFACE-AT ?auto_15960 ?auto_15964 ) ( ON ?auto_15960 ?auto_15963 ) ( CLEAR ?auto_15960 ) ( not ( = ?auto_15961 ?auto_15960 ) ) ( not ( = ?auto_15961 ?auto_15963 ) ) ( not ( = ?auto_15960 ?auto_15963 ) ) ( not ( = ?auto_15965 ?auto_15962 ) ) ( IS-CRATE ?auto_15961 ) ( not ( = ?auto_15980 ?auto_15966 ) ) ( HOIST-AT ?auto_15978 ?auto_15980 ) ( AVAILABLE ?auto_15978 ) ( SURFACE-AT ?auto_15961 ?auto_15980 ) ( ON ?auto_15961 ?auto_15977 ) ( CLEAR ?auto_15961 ) ( not ( = ?auto_15959 ?auto_15961 ) ) ( not ( = ?auto_15959 ?auto_15977 ) ) ( not ( = ?auto_15961 ?auto_15977 ) ) ( not ( = ?auto_15965 ?auto_15978 ) ) ( IS-CRATE ?auto_15959 ) ( not ( = ?auto_15971 ?auto_15966 ) ) ( HOIST-AT ?auto_15968 ?auto_15971 ) ( AVAILABLE ?auto_15968 ) ( SURFACE-AT ?auto_15959 ?auto_15971 ) ( ON ?auto_15959 ?auto_15981 ) ( CLEAR ?auto_15959 ) ( not ( = ?auto_15958 ?auto_15959 ) ) ( not ( = ?auto_15958 ?auto_15981 ) ) ( not ( = ?auto_15959 ?auto_15981 ) ) ( not ( = ?auto_15965 ?auto_15968 ) ) ( IS-CRATE ?auto_15958 ) ( not ( = ?auto_15982 ?auto_15966 ) ) ( HOIST-AT ?auto_15974 ?auto_15982 ) ( AVAILABLE ?auto_15974 ) ( SURFACE-AT ?auto_15958 ?auto_15982 ) ( ON ?auto_15958 ?auto_15979 ) ( CLEAR ?auto_15958 ) ( not ( = ?auto_15957 ?auto_15958 ) ) ( not ( = ?auto_15957 ?auto_15979 ) ) ( not ( = ?auto_15958 ?auto_15979 ) ) ( not ( = ?auto_15965 ?auto_15974 ) ) ( IS-CRATE ?auto_15957 ) ( not ( = ?auto_15969 ?auto_15966 ) ) ( HOIST-AT ?auto_15972 ?auto_15969 ) ( AVAILABLE ?auto_15972 ) ( SURFACE-AT ?auto_15957 ?auto_15969 ) ( ON ?auto_15957 ?auto_15975 ) ( CLEAR ?auto_15957 ) ( not ( = ?auto_15956 ?auto_15957 ) ) ( not ( = ?auto_15956 ?auto_15975 ) ) ( not ( = ?auto_15957 ?auto_15975 ) ) ( not ( = ?auto_15965 ?auto_15972 ) ) ( SURFACE-AT ?auto_15955 ?auto_15966 ) ( CLEAR ?auto_15955 ) ( IS-CRATE ?auto_15956 ) ( AVAILABLE ?auto_15965 ) ( not ( = ?auto_15970 ?auto_15966 ) ) ( HOIST-AT ?auto_15973 ?auto_15970 ) ( AVAILABLE ?auto_15973 ) ( SURFACE-AT ?auto_15956 ?auto_15970 ) ( ON ?auto_15956 ?auto_15976 ) ( CLEAR ?auto_15956 ) ( TRUCK-AT ?auto_15967 ?auto_15966 ) ( not ( = ?auto_15955 ?auto_15956 ) ) ( not ( = ?auto_15955 ?auto_15976 ) ) ( not ( = ?auto_15956 ?auto_15976 ) ) ( not ( = ?auto_15965 ?auto_15973 ) ) ( not ( = ?auto_15955 ?auto_15957 ) ) ( not ( = ?auto_15955 ?auto_15975 ) ) ( not ( = ?auto_15957 ?auto_15976 ) ) ( not ( = ?auto_15969 ?auto_15970 ) ) ( not ( = ?auto_15972 ?auto_15973 ) ) ( not ( = ?auto_15975 ?auto_15976 ) ) ( not ( = ?auto_15955 ?auto_15958 ) ) ( not ( = ?auto_15955 ?auto_15979 ) ) ( not ( = ?auto_15956 ?auto_15958 ) ) ( not ( = ?auto_15956 ?auto_15979 ) ) ( not ( = ?auto_15958 ?auto_15975 ) ) ( not ( = ?auto_15958 ?auto_15976 ) ) ( not ( = ?auto_15982 ?auto_15969 ) ) ( not ( = ?auto_15982 ?auto_15970 ) ) ( not ( = ?auto_15974 ?auto_15972 ) ) ( not ( = ?auto_15974 ?auto_15973 ) ) ( not ( = ?auto_15979 ?auto_15975 ) ) ( not ( = ?auto_15979 ?auto_15976 ) ) ( not ( = ?auto_15955 ?auto_15959 ) ) ( not ( = ?auto_15955 ?auto_15981 ) ) ( not ( = ?auto_15956 ?auto_15959 ) ) ( not ( = ?auto_15956 ?auto_15981 ) ) ( not ( = ?auto_15957 ?auto_15959 ) ) ( not ( = ?auto_15957 ?auto_15981 ) ) ( not ( = ?auto_15959 ?auto_15979 ) ) ( not ( = ?auto_15959 ?auto_15975 ) ) ( not ( = ?auto_15959 ?auto_15976 ) ) ( not ( = ?auto_15971 ?auto_15982 ) ) ( not ( = ?auto_15971 ?auto_15969 ) ) ( not ( = ?auto_15971 ?auto_15970 ) ) ( not ( = ?auto_15968 ?auto_15974 ) ) ( not ( = ?auto_15968 ?auto_15972 ) ) ( not ( = ?auto_15968 ?auto_15973 ) ) ( not ( = ?auto_15981 ?auto_15979 ) ) ( not ( = ?auto_15981 ?auto_15975 ) ) ( not ( = ?auto_15981 ?auto_15976 ) ) ( not ( = ?auto_15955 ?auto_15961 ) ) ( not ( = ?auto_15955 ?auto_15977 ) ) ( not ( = ?auto_15956 ?auto_15961 ) ) ( not ( = ?auto_15956 ?auto_15977 ) ) ( not ( = ?auto_15957 ?auto_15961 ) ) ( not ( = ?auto_15957 ?auto_15977 ) ) ( not ( = ?auto_15958 ?auto_15961 ) ) ( not ( = ?auto_15958 ?auto_15977 ) ) ( not ( = ?auto_15961 ?auto_15981 ) ) ( not ( = ?auto_15961 ?auto_15979 ) ) ( not ( = ?auto_15961 ?auto_15975 ) ) ( not ( = ?auto_15961 ?auto_15976 ) ) ( not ( = ?auto_15980 ?auto_15971 ) ) ( not ( = ?auto_15980 ?auto_15982 ) ) ( not ( = ?auto_15980 ?auto_15969 ) ) ( not ( = ?auto_15980 ?auto_15970 ) ) ( not ( = ?auto_15978 ?auto_15968 ) ) ( not ( = ?auto_15978 ?auto_15974 ) ) ( not ( = ?auto_15978 ?auto_15972 ) ) ( not ( = ?auto_15978 ?auto_15973 ) ) ( not ( = ?auto_15977 ?auto_15981 ) ) ( not ( = ?auto_15977 ?auto_15979 ) ) ( not ( = ?auto_15977 ?auto_15975 ) ) ( not ( = ?auto_15977 ?auto_15976 ) ) ( not ( = ?auto_15955 ?auto_15960 ) ) ( not ( = ?auto_15955 ?auto_15963 ) ) ( not ( = ?auto_15956 ?auto_15960 ) ) ( not ( = ?auto_15956 ?auto_15963 ) ) ( not ( = ?auto_15957 ?auto_15960 ) ) ( not ( = ?auto_15957 ?auto_15963 ) ) ( not ( = ?auto_15958 ?auto_15960 ) ) ( not ( = ?auto_15958 ?auto_15963 ) ) ( not ( = ?auto_15959 ?auto_15960 ) ) ( not ( = ?auto_15959 ?auto_15963 ) ) ( not ( = ?auto_15960 ?auto_15977 ) ) ( not ( = ?auto_15960 ?auto_15981 ) ) ( not ( = ?auto_15960 ?auto_15979 ) ) ( not ( = ?auto_15960 ?auto_15975 ) ) ( not ( = ?auto_15960 ?auto_15976 ) ) ( not ( = ?auto_15964 ?auto_15980 ) ) ( not ( = ?auto_15964 ?auto_15971 ) ) ( not ( = ?auto_15964 ?auto_15982 ) ) ( not ( = ?auto_15964 ?auto_15969 ) ) ( not ( = ?auto_15964 ?auto_15970 ) ) ( not ( = ?auto_15962 ?auto_15978 ) ) ( not ( = ?auto_15962 ?auto_15968 ) ) ( not ( = ?auto_15962 ?auto_15974 ) ) ( not ( = ?auto_15962 ?auto_15972 ) ) ( not ( = ?auto_15962 ?auto_15973 ) ) ( not ( = ?auto_15963 ?auto_15977 ) ) ( not ( = ?auto_15963 ?auto_15981 ) ) ( not ( = ?auto_15963 ?auto_15979 ) ) ( not ( = ?auto_15963 ?auto_15975 ) ) ( not ( = ?auto_15963 ?auto_15976 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_15955 ?auto_15956 ?auto_15957 ?auto_15958 ?auto_15959 ?auto_15961 )
      ( MAKE-1CRATE ?auto_15961 ?auto_15960 )
      ( MAKE-6CRATE-VERIFY ?auto_15955 ?auto_15956 ?auto_15957 ?auto_15958 ?auto_15959 ?auto_15961 ?auto_15960 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15985 - SURFACE
      ?auto_15986 - SURFACE
    )
    :vars
    (
      ?auto_15987 - HOIST
      ?auto_15988 - PLACE
      ?auto_15990 - PLACE
      ?auto_15991 - HOIST
      ?auto_15992 - SURFACE
      ?auto_15989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15987 ?auto_15988 ) ( SURFACE-AT ?auto_15985 ?auto_15988 ) ( CLEAR ?auto_15985 ) ( IS-CRATE ?auto_15986 ) ( AVAILABLE ?auto_15987 ) ( not ( = ?auto_15990 ?auto_15988 ) ) ( HOIST-AT ?auto_15991 ?auto_15990 ) ( AVAILABLE ?auto_15991 ) ( SURFACE-AT ?auto_15986 ?auto_15990 ) ( ON ?auto_15986 ?auto_15992 ) ( CLEAR ?auto_15986 ) ( TRUCK-AT ?auto_15989 ?auto_15988 ) ( not ( = ?auto_15985 ?auto_15986 ) ) ( not ( = ?auto_15985 ?auto_15992 ) ) ( not ( = ?auto_15986 ?auto_15992 ) ) ( not ( = ?auto_15987 ?auto_15991 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15989 ?auto_15988 ?auto_15990 )
      ( !LIFT ?auto_15991 ?auto_15986 ?auto_15992 ?auto_15990 )
      ( !LOAD ?auto_15991 ?auto_15986 ?auto_15989 ?auto_15990 )
      ( !DRIVE ?auto_15989 ?auto_15990 ?auto_15988 )
      ( !UNLOAD ?auto_15987 ?auto_15986 ?auto_15989 ?auto_15988 )
      ( !DROP ?auto_15987 ?auto_15986 ?auto_15985 ?auto_15988 )
      ( MAKE-1CRATE-VERIFY ?auto_15985 ?auto_15986 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_16001 - SURFACE
      ?auto_16002 - SURFACE
      ?auto_16003 - SURFACE
      ?auto_16004 - SURFACE
      ?auto_16005 - SURFACE
      ?auto_16007 - SURFACE
      ?auto_16006 - SURFACE
      ?auto_16008 - SURFACE
    )
    :vars
    (
      ?auto_16009 - HOIST
      ?auto_16010 - PLACE
      ?auto_16013 - PLACE
      ?auto_16012 - HOIST
      ?auto_16014 - SURFACE
      ?auto_16024 - PLACE
      ?auto_16026 - HOIST
      ?auto_16023 - SURFACE
      ?auto_16019 - PLACE
      ?auto_16016 - HOIST
      ?auto_16021 - SURFACE
      ?auto_16027 - PLACE
      ?auto_16030 - HOIST
      ?auto_16018 - SURFACE
      ?auto_16029 - PLACE
      ?auto_16025 - HOIST
      ?auto_16020 - SURFACE
      ?auto_16022 - SURFACE
      ?auto_16028 - PLACE
      ?auto_16017 - HOIST
      ?auto_16015 - SURFACE
      ?auto_16011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16009 ?auto_16010 ) ( IS-CRATE ?auto_16008 ) ( not ( = ?auto_16013 ?auto_16010 ) ) ( HOIST-AT ?auto_16012 ?auto_16013 ) ( SURFACE-AT ?auto_16008 ?auto_16013 ) ( ON ?auto_16008 ?auto_16014 ) ( CLEAR ?auto_16008 ) ( not ( = ?auto_16006 ?auto_16008 ) ) ( not ( = ?auto_16006 ?auto_16014 ) ) ( not ( = ?auto_16008 ?auto_16014 ) ) ( not ( = ?auto_16009 ?auto_16012 ) ) ( IS-CRATE ?auto_16006 ) ( not ( = ?auto_16024 ?auto_16010 ) ) ( HOIST-AT ?auto_16026 ?auto_16024 ) ( AVAILABLE ?auto_16026 ) ( SURFACE-AT ?auto_16006 ?auto_16024 ) ( ON ?auto_16006 ?auto_16023 ) ( CLEAR ?auto_16006 ) ( not ( = ?auto_16007 ?auto_16006 ) ) ( not ( = ?auto_16007 ?auto_16023 ) ) ( not ( = ?auto_16006 ?auto_16023 ) ) ( not ( = ?auto_16009 ?auto_16026 ) ) ( IS-CRATE ?auto_16007 ) ( not ( = ?auto_16019 ?auto_16010 ) ) ( HOIST-AT ?auto_16016 ?auto_16019 ) ( AVAILABLE ?auto_16016 ) ( SURFACE-AT ?auto_16007 ?auto_16019 ) ( ON ?auto_16007 ?auto_16021 ) ( CLEAR ?auto_16007 ) ( not ( = ?auto_16005 ?auto_16007 ) ) ( not ( = ?auto_16005 ?auto_16021 ) ) ( not ( = ?auto_16007 ?auto_16021 ) ) ( not ( = ?auto_16009 ?auto_16016 ) ) ( IS-CRATE ?auto_16005 ) ( not ( = ?auto_16027 ?auto_16010 ) ) ( HOIST-AT ?auto_16030 ?auto_16027 ) ( AVAILABLE ?auto_16030 ) ( SURFACE-AT ?auto_16005 ?auto_16027 ) ( ON ?auto_16005 ?auto_16018 ) ( CLEAR ?auto_16005 ) ( not ( = ?auto_16004 ?auto_16005 ) ) ( not ( = ?auto_16004 ?auto_16018 ) ) ( not ( = ?auto_16005 ?auto_16018 ) ) ( not ( = ?auto_16009 ?auto_16030 ) ) ( IS-CRATE ?auto_16004 ) ( not ( = ?auto_16029 ?auto_16010 ) ) ( HOIST-AT ?auto_16025 ?auto_16029 ) ( AVAILABLE ?auto_16025 ) ( SURFACE-AT ?auto_16004 ?auto_16029 ) ( ON ?auto_16004 ?auto_16020 ) ( CLEAR ?auto_16004 ) ( not ( = ?auto_16003 ?auto_16004 ) ) ( not ( = ?auto_16003 ?auto_16020 ) ) ( not ( = ?auto_16004 ?auto_16020 ) ) ( not ( = ?auto_16009 ?auto_16025 ) ) ( IS-CRATE ?auto_16003 ) ( AVAILABLE ?auto_16012 ) ( SURFACE-AT ?auto_16003 ?auto_16013 ) ( ON ?auto_16003 ?auto_16022 ) ( CLEAR ?auto_16003 ) ( not ( = ?auto_16002 ?auto_16003 ) ) ( not ( = ?auto_16002 ?auto_16022 ) ) ( not ( = ?auto_16003 ?auto_16022 ) ) ( SURFACE-AT ?auto_16001 ?auto_16010 ) ( CLEAR ?auto_16001 ) ( IS-CRATE ?auto_16002 ) ( AVAILABLE ?auto_16009 ) ( not ( = ?auto_16028 ?auto_16010 ) ) ( HOIST-AT ?auto_16017 ?auto_16028 ) ( AVAILABLE ?auto_16017 ) ( SURFACE-AT ?auto_16002 ?auto_16028 ) ( ON ?auto_16002 ?auto_16015 ) ( CLEAR ?auto_16002 ) ( TRUCK-AT ?auto_16011 ?auto_16010 ) ( not ( = ?auto_16001 ?auto_16002 ) ) ( not ( = ?auto_16001 ?auto_16015 ) ) ( not ( = ?auto_16002 ?auto_16015 ) ) ( not ( = ?auto_16009 ?auto_16017 ) ) ( not ( = ?auto_16001 ?auto_16003 ) ) ( not ( = ?auto_16001 ?auto_16022 ) ) ( not ( = ?auto_16003 ?auto_16015 ) ) ( not ( = ?auto_16013 ?auto_16028 ) ) ( not ( = ?auto_16012 ?auto_16017 ) ) ( not ( = ?auto_16022 ?auto_16015 ) ) ( not ( = ?auto_16001 ?auto_16004 ) ) ( not ( = ?auto_16001 ?auto_16020 ) ) ( not ( = ?auto_16002 ?auto_16004 ) ) ( not ( = ?auto_16002 ?auto_16020 ) ) ( not ( = ?auto_16004 ?auto_16022 ) ) ( not ( = ?auto_16004 ?auto_16015 ) ) ( not ( = ?auto_16029 ?auto_16013 ) ) ( not ( = ?auto_16029 ?auto_16028 ) ) ( not ( = ?auto_16025 ?auto_16012 ) ) ( not ( = ?auto_16025 ?auto_16017 ) ) ( not ( = ?auto_16020 ?auto_16022 ) ) ( not ( = ?auto_16020 ?auto_16015 ) ) ( not ( = ?auto_16001 ?auto_16005 ) ) ( not ( = ?auto_16001 ?auto_16018 ) ) ( not ( = ?auto_16002 ?auto_16005 ) ) ( not ( = ?auto_16002 ?auto_16018 ) ) ( not ( = ?auto_16003 ?auto_16005 ) ) ( not ( = ?auto_16003 ?auto_16018 ) ) ( not ( = ?auto_16005 ?auto_16020 ) ) ( not ( = ?auto_16005 ?auto_16022 ) ) ( not ( = ?auto_16005 ?auto_16015 ) ) ( not ( = ?auto_16027 ?auto_16029 ) ) ( not ( = ?auto_16027 ?auto_16013 ) ) ( not ( = ?auto_16027 ?auto_16028 ) ) ( not ( = ?auto_16030 ?auto_16025 ) ) ( not ( = ?auto_16030 ?auto_16012 ) ) ( not ( = ?auto_16030 ?auto_16017 ) ) ( not ( = ?auto_16018 ?auto_16020 ) ) ( not ( = ?auto_16018 ?auto_16022 ) ) ( not ( = ?auto_16018 ?auto_16015 ) ) ( not ( = ?auto_16001 ?auto_16007 ) ) ( not ( = ?auto_16001 ?auto_16021 ) ) ( not ( = ?auto_16002 ?auto_16007 ) ) ( not ( = ?auto_16002 ?auto_16021 ) ) ( not ( = ?auto_16003 ?auto_16007 ) ) ( not ( = ?auto_16003 ?auto_16021 ) ) ( not ( = ?auto_16004 ?auto_16007 ) ) ( not ( = ?auto_16004 ?auto_16021 ) ) ( not ( = ?auto_16007 ?auto_16018 ) ) ( not ( = ?auto_16007 ?auto_16020 ) ) ( not ( = ?auto_16007 ?auto_16022 ) ) ( not ( = ?auto_16007 ?auto_16015 ) ) ( not ( = ?auto_16019 ?auto_16027 ) ) ( not ( = ?auto_16019 ?auto_16029 ) ) ( not ( = ?auto_16019 ?auto_16013 ) ) ( not ( = ?auto_16019 ?auto_16028 ) ) ( not ( = ?auto_16016 ?auto_16030 ) ) ( not ( = ?auto_16016 ?auto_16025 ) ) ( not ( = ?auto_16016 ?auto_16012 ) ) ( not ( = ?auto_16016 ?auto_16017 ) ) ( not ( = ?auto_16021 ?auto_16018 ) ) ( not ( = ?auto_16021 ?auto_16020 ) ) ( not ( = ?auto_16021 ?auto_16022 ) ) ( not ( = ?auto_16021 ?auto_16015 ) ) ( not ( = ?auto_16001 ?auto_16006 ) ) ( not ( = ?auto_16001 ?auto_16023 ) ) ( not ( = ?auto_16002 ?auto_16006 ) ) ( not ( = ?auto_16002 ?auto_16023 ) ) ( not ( = ?auto_16003 ?auto_16006 ) ) ( not ( = ?auto_16003 ?auto_16023 ) ) ( not ( = ?auto_16004 ?auto_16006 ) ) ( not ( = ?auto_16004 ?auto_16023 ) ) ( not ( = ?auto_16005 ?auto_16006 ) ) ( not ( = ?auto_16005 ?auto_16023 ) ) ( not ( = ?auto_16006 ?auto_16021 ) ) ( not ( = ?auto_16006 ?auto_16018 ) ) ( not ( = ?auto_16006 ?auto_16020 ) ) ( not ( = ?auto_16006 ?auto_16022 ) ) ( not ( = ?auto_16006 ?auto_16015 ) ) ( not ( = ?auto_16024 ?auto_16019 ) ) ( not ( = ?auto_16024 ?auto_16027 ) ) ( not ( = ?auto_16024 ?auto_16029 ) ) ( not ( = ?auto_16024 ?auto_16013 ) ) ( not ( = ?auto_16024 ?auto_16028 ) ) ( not ( = ?auto_16026 ?auto_16016 ) ) ( not ( = ?auto_16026 ?auto_16030 ) ) ( not ( = ?auto_16026 ?auto_16025 ) ) ( not ( = ?auto_16026 ?auto_16012 ) ) ( not ( = ?auto_16026 ?auto_16017 ) ) ( not ( = ?auto_16023 ?auto_16021 ) ) ( not ( = ?auto_16023 ?auto_16018 ) ) ( not ( = ?auto_16023 ?auto_16020 ) ) ( not ( = ?auto_16023 ?auto_16022 ) ) ( not ( = ?auto_16023 ?auto_16015 ) ) ( not ( = ?auto_16001 ?auto_16008 ) ) ( not ( = ?auto_16001 ?auto_16014 ) ) ( not ( = ?auto_16002 ?auto_16008 ) ) ( not ( = ?auto_16002 ?auto_16014 ) ) ( not ( = ?auto_16003 ?auto_16008 ) ) ( not ( = ?auto_16003 ?auto_16014 ) ) ( not ( = ?auto_16004 ?auto_16008 ) ) ( not ( = ?auto_16004 ?auto_16014 ) ) ( not ( = ?auto_16005 ?auto_16008 ) ) ( not ( = ?auto_16005 ?auto_16014 ) ) ( not ( = ?auto_16007 ?auto_16008 ) ) ( not ( = ?auto_16007 ?auto_16014 ) ) ( not ( = ?auto_16008 ?auto_16023 ) ) ( not ( = ?auto_16008 ?auto_16021 ) ) ( not ( = ?auto_16008 ?auto_16018 ) ) ( not ( = ?auto_16008 ?auto_16020 ) ) ( not ( = ?auto_16008 ?auto_16022 ) ) ( not ( = ?auto_16008 ?auto_16015 ) ) ( not ( = ?auto_16014 ?auto_16023 ) ) ( not ( = ?auto_16014 ?auto_16021 ) ) ( not ( = ?auto_16014 ?auto_16018 ) ) ( not ( = ?auto_16014 ?auto_16020 ) ) ( not ( = ?auto_16014 ?auto_16022 ) ) ( not ( = ?auto_16014 ?auto_16015 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_16001 ?auto_16002 ?auto_16003 ?auto_16004 ?auto_16005 ?auto_16007 ?auto_16006 )
      ( MAKE-1CRATE ?auto_16006 ?auto_16008 )
      ( MAKE-7CRATE-VERIFY ?auto_16001 ?auto_16002 ?auto_16003 ?auto_16004 ?auto_16005 ?auto_16007 ?auto_16006 ?auto_16008 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16033 - SURFACE
      ?auto_16034 - SURFACE
    )
    :vars
    (
      ?auto_16035 - HOIST
      ?auto_16036 - PLACE
      ?auto_16038 - PLACE
      ?auto_16039 - HOIST
      ?auto_16040 - SURFACE
      ?auto_16037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16035 ?auto_16036 ) ( SURFACE-AT ?auto_16033 ?auto_16036 ) ( CLEAR ?auto_16033 ) ( IS-CRATE ?auto_16034 ) ( AVAILABLE ?auto_16035 ) ( not ( = ?auto_16038 ?auto_16036 ) ) ( HOIST-AT ?auto_16039 ?auto_16038 ) ( AVAILABLE ?auto_16039 ) ( SURFACE-AT ?auto_16034 ?auto_16038 ) ( ON ?auto_16034 ?auto_16040 ) ( CLEAR ?auto_16034 ) ( TRUCK-AT ?auto_16037 ?auto_16036 ) ( not ( = ?auto_16033 ?auto_16034 ) ) ( not ( = ?auto_16033 ?auto_16040 ) ) ( not ( = ?auto_16034 ?auto_16040 ) ) ( not ( = ?auto_16035 ?auto_16039 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16037 ?auto_16036 ?auto_16038 )
      ( !LIFT ?auto_16039 ?auto_16034 ?auto_16040 ?auto_16038 )
      ( !LOAD ?auto_16039 ?auto_16034 ?auto_16037 ?auto_16038 )
      ( !DRIVE ?auto_16037 ?auto_16038 ?auto_16036 )
      ( !UNLOAD ?auto_16035 ?auto_16034 ?auto_16037 ?auto_16036 )
      ( !DROP ?auto_16035 ?auto_16034 ?auto_16033 ?auto_16036 )
      ( MAKE-1CRATE-VERIFY ?auto_16033 ?auto_16034 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_16050 - SURFACE
      ?auto_16051 - SURFACE
      ?auto_16052 - SURFACE
      ?auto_16053 - SURFACE
      ?auto_16054 - SURFACE
      ?auto_16056 - SURFACE
      ?auto_16055 - SURFACE
      ?auto_16058 - SURFACE
      ?auto_16057 - SURFACE
    )
    :vars
    (
      ?auto_16061 - HOIST
      ?auto_16059 - PLACE
      ?auto_16060 - PLACE
      ?auto_16064 - HOIST
      ?auto_16062 - SURFACE
      ?auto_16081 - SURFACE
      ?auto_16073 - PLACE
      ?auto_16074 - HOIST
      ?auto_16071 - SURFACE
      ?auto_16080 - PLACE
      ?auto_16066 - HOIST
      ?auto_16078 - SURFACE
      ?auto_16075 - PLACE
      ?auto_16070 - HOIST
      ?auto_16065 - SURFACE
      ?auto_16068 - PLACE
      ?auto_16072 - HOIST
      ?auto_16079 - SURFACE
      ?auto_16077 - SURFACE
      ?auto_16076 - PLACE
      ?auto_16067 - HOIST
      ?auto_16069 - SURFACE
      ?auto_16063 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16061 ?auto_16059 ) ( IS-CRATE ?auto_16057 ) ( not ( = ?auto_16060 ?auto_16059 ) ) ( HOIST-AT ?auto_16064 ?auto_16060 ) ( SURFACE-AT ?auto_16057 ?auto_16060 ) ( ON ?auto_16057 ?auto_16062 ) ( CLEAR ?auto_16057 ) ( not ( = ?auto_16058 ?auto_16057 ) ) ( not ( = ?auto_16058 ?auto_16062 ) ) ( not ( = ?auto_16057 ?auto_16062 ) ) ( not ( = ?auto_16061 ?auto_16064 ) ) ( IS-CRATE ?auto_16058 ) ( SURFACE-AT ?auto_16058 ?auto_16060 ) ( ON ?auto_16058 ?auto_16081 ) ( CLEAR ?auto_16058 ) ( not ( = ?auto_16055 ?auto_16058 ) ) ( not ( = ?auto_16055 ?auto_16081 ) ) ( not ( = ?auto_16058 ?auto_16081 ) ) ( IS-CRATE ?auto_16055 ) ( not ( = ?auto_16073 ?auto_16059 ) ) ( HOIST-AT ?auto_16074 ?auto_16073 ) ( AVAILABLE ?auto_16074 ) ( SURFACE-AT ?auto_16055 ?auto_16073 ) ( ON ?auto_16055 ?auto_16071 ) ( CLEAR ?auto_16055 ) ( not ( = ?auto_16056 ?auto_16055 ) ) ( not ( = ?auto_16056 ?auto_16071 ) ) ( not ( = ?auto_16055 ?auto_16071 ) ) ( not ( = ?auto_16061 ?auto_16074 ) ) ( IS-CRATE ?auto_16056 ) ( not ( = ?auto_16080 ?auto_16059 ) ) ( HOIST-AT ?auto_16066 ?auto_16080 ) ( AVAILABLE ?auto_16066 ) ( SURFACE-AT ?auto_16056 ?auto_16080 ) ( ON ?auto_16056 ?auto_16078 ) ( CLEAR ?auto_16056 ) ( not ( = ?auto_16054 ?auto_16056 ) ) ( not ( = ?auto_16054 ?auto_16078 ) ) ( not ( = ?auto_16056 ?auto_16078 ) ) ( not ( = ?auto_16061 ?auto_16066 ) ) ( IS-CRATE ?auto_16054 ) ( not ( = ?auto_16075 ?auto_16059 ) ) ( HOIST-AT ?auto_16070 ?auto_16075 ) ( AVAILABLE ?auto_16070 ) ( SURFACE-AT ?auto_16054 ?auto_16075 ) ( ON ?auto_16054 ?auto_16065 ) ( CLEAR ?auto_16054 ) ( not ( = ?auto_16053 ?auto_16054 ) ) ( not ( = ?auto_16053 ?auto_16065 ) ) ( not ( = ?auto_16054 ?auto_16065 ) ) ( not ( = ?auto_16061 ?auto_16070 ) ) ( IS-CRATE ?auto_16053 ) ( not ( = ?auto_16068 ?auto_16059 ) ) ( HOIST-AT ?auto_16072 ?auto_16068 ) ( AVAILABLE ?auto_16072 ) ( SURFACE-AT ?auto_16053 ?auto_16068 ) ( ON ?auto_16053 ?auto_16079 ) ( CLEAR ?auto_16053 ) ( not ( = ?auto_16052 ?auto_16053 ) ) ( not ( = ?auto_16052 ?auto_16079 ) ) ( not ( = ?auto_16053 ?auto_16079 ) ) ( not ( = ?auto_16061 ?auto_16072 ) ) ( IS-CRATE ?auto_16052 ) ( AVAILABLE ?auto_16064 ) ( SURFACE-AT ?auto_16052 ?auto_16060 ) ( ON ?auto_16052 ?auto_16077 ) ( CLEAR ?auto_16052 ) ( not ( = ?auto_16051 ?auto_16052 ) ) ( not ( = ?auto_16051 ?auto_16077 ) ) ( not ( = ?auto_16052 ?auto_16077 ) ) ( SURFACE-AT ?auto_16050 ?auto_16059 ) ( CLEAR ?auto_16050 ) ( IS-CRATE ?auto_16051 ) ( AVAILABLE ?auto_16061 ) ( not ( = ?auto_16076 ?auto_16059 ) ) ( HOIST-AT ?auto_16067 ?auto_16076 ) ( AVAILABLE ?auto_16067 ) ( SURFACE-AT ?auto_16051 ?auto_16076 ) ( ON ?auto_16051 ?auto_16069 ) ( CLEAR ?auto_16051 ) ( TRUCK-AT ?auto_16063 ?auto_16059 ) ( not ( = ?auto_16050 ?auto_16051 ) ) ( not ( = ?auto_16050 ?auto_16069 ) ) ( not ( = ?auto_16051 ?auto_16069 ) ) ( not ( = ?auto_16061 ?auto_16067 ) ) ( not ( = ?auto_16050 ?auto_16052 ) ) ( not ( = ?auto_16050 ?auto_16077 ) ) ( not ( = ?auto_16052 ?auto_16069 ) ) ( not ( = ?auto_16060 ?auto_16076 ) ) ( not ( = ?auto_16064 ?auto_16067 ) ) ( not ( = ?auto_16077 ?auto_16069 ) ) ( not ( = ?auto_16050 ?auto_16053 ) ) ( not ( = ?auto_16050 ?auto_16079 ) ) ( not ( = ?auto_16051 ?auto_16053 ) ) ( not ( = ?auto_16051 ?auto_16079 ) ) ( not ( = ?auto_16053 ?auto_16077 ) ) ( not ( = ?auto_16053 ?auto_16069 ) ) ( not ( = ?auto_16068 ?auto_16060 ) ) ( not ( = ?auto_16068 ?auto_16076 ) ) ( not ( = ?auto_16072 ?auto_16064 ) ) ( not ( = ?auto_16072 ?auto_16067 ) ) ( not ( = ?auto_16079 ?auto_16077 ) ) ( not ( = ?auto_16079 ?auto_16069 ) ) ( not ( = ?auto_16050 ?auto_16054 ) ) ( not ( = ?auto_16050 ?auto_16065 ) ) ( not ( = ?auto_16051 ?auto_16054 ) ) ( not ( = ?auto_16051 ?auto_16065 ) ) ( not ( = ?auto_16052 ?auto_16054 ) ) ( not ( = ?auto_16052 ?auto_16065 ) ) ( not ( = ?auto_16054 ?auto_16079 ) ) ( not ( = ?auto_16054 ?auto_16077 ) ) ( not ( = ?auto_16054 ?auto_16069 ) ) ( not ( = ?auto_16075 ?auto_16068 ) ) ( not ( = ?auto_16075 ?auto_16060 ) ) ( not ( = ?auto_16075 ?auto_16076 ) ) ( not ( = ?auto_16070 ?auto_16072 ) ) ( not ( = ?auto_16070 ?auto_16064 ) ) ( not ( = ?auto_16070 ?auto_16067 ) ) ( not ( = ?auto_16065 ?auto_16079 ) ) ( not ( = ?auto_16065 ?auto_16077 ) ) ( not ( = ?auto_16065 ?auto_16069 ) ) ( not ( = ?auto_16050 ?auto_16056 ) ) ( not ( = ?auto_16050 ?auto_16078 ) ) ( not ( = ?auto_16051 ?auto_16056 ) ) ( not ( = ?auto_16051 ?auto_16078 ) ) ( not ( = ?auto_16052 ?auto_16056 ) ) ( not ( = ?auto_16052 ?auto_16078 ) ) ( not ( = ?auto_16053 ?auto_16056 ) ) ( not ( = ?auto_16053 ?auto_16078 ) ) ( not ( = ?auto_16056 ?auto_16065 ) ) ( not ( = ?auto_16056 ?auto_16079 ) ) ( not ( = ?auto_16056 ?auto_16077 ) ) ( not ( = ?auto_16056 ?auto_16069 ) ) ( not ( = ?auto_16080 ?auto_16075 ) ) ( not ( = ?auto_16080 ?auto_16068 ) ) ( not ( = ?auto_16080 ?auto_16060 ) ) ( not ( = ?auto_16080 ?auto_16076 ) ) ( not ( = ?auto_16066 ?auto_16070 ) ) ( not ( = ?auto_16066 ?auto_16072 ) ) ( not ( = ?auto_16066 ?auto_16064 ) ) ( not ( = ?auto_16066 ?auto_16067 ) ) ( not ( = ?auto_16078 ?auto_16065 ) ) ( not ( = ?auto_16078 ?auto_16079 ) ) ( not ( = ?auto_16078 ?auto_16077 ) ) ( not ( = ?auto_16078 ?auto_16069 ) ) ( not ( = ?auto_16050 ?auto_16055 ) ) ( not ( = ?auto_16050 ?auto_16071 ) ) ( not ( = ?auto_16051 ?auto_16055 ) ) ( not ( = ?auto_16051 ?auto_16071 ) ) ( not ( = ?auto_16052 ?auto_16055 ) ) ( not ( = ?auto_16052 ?auto_16071 ) ) ( not ( = ?auto_16053 ?auto_16055 ) ) ( not ( = ?auto_16053 ?auto_16071 ) ) ( not ( = ?auto_16054 ?auto_16055 ) ) ( not ( = ?auto_16054 ?auto_16071 ) ) ( not ( = ?auto_16055 ?auto_16078 ) ) ( not ( = ?auto_16055 ?auto_16065 ) ) ( not ( = ?auto_16055 ?auto_16079 ) ) ( not ( = ?auto_16055 ?auto_16077 ) ) ( not ( = ?auto_16055 ?auto_16069 ) ) ( not ( = ?auto_16073 ?auto_16080 ) ) ( not ( = ?auto_16073 ?auto_16075 ) ) ( not ( = ?auto_16073 ?auto_16068 ) ) ( not ( = ?auto_16073 ?auto_16060 ) ) ( not ( = ?auto_16073 ?auto_16076 ) ) ( not ( = ?auto_16074 ?auto_16066 ) ) ( not ( = ?auto_16074 ?auto_16070 ) ) ( not ( = ?auto_16074 ?auto_16072 ) ) ( not ( = ?auto_16074 ?auto_16064 ) ) ( not ( = ?auto_16074 ?auto_16067 ) ) ( not ( = ?auto_16071 ?auto_16078 ) ) ( not ( = ?auto_16071 ?auto_16065 ) ) ( not ( = ?auto_16071 ?auto_16079 ) ) ( not ( = ?auto_16071 ?auto_16077 ) ) ( not ( = ?auto_16071 ?auto_16069 ) ) ( not ( = ?auto_16050 ?auto_16058 ) ) ( not ( = ?auto_16050 ?auto_16081 ) ) ( not ( = ?auto_16051 ?auto_16058 ) ) ( not ( = ?auto_16051 ?auto_16081 ) ) ( not ( = ?auto_16052 ?auto_16058 ) ) ( not ( = ?auto_16052 ?auto_16081 ) ) ( not ( = ?auto_16053 ?auto_16058 ) ) ( not ( = ?auto_16053 ?auto_16081 ) ) ( not ( = ?auto_16054 ?auto_16058 ) ) ( not ( = ?auto_16054 ?auto_16081 ) ) ( not ( = ?auto_16056 ?auto_16058 ) ) ( not ( = ?auto_16056 ?auto_16081 ) ) ( not ( = ?auto_16058 ?auto_16071 ) ) ( not ( = ?auto_16058 ?auto_16078 ) ) ( not ( = ?auto_16058 ?auto_16065 ) ) ( not ( = ?auto_16058 ?auto_16079 ) ) ( not ( = ?auto_16058 ?auto_16077 ) ) ( not ( = ?auto_16058 ?auto_16069 ) ) ( not ( = ?auto_16081 ?auto_16071 ) ) ( not ( = ?auto_16081 ?auto_16078 ) ) ( not ( = ?auto_16081 ?auto_16065 ) ) ( not ( = ?auto_16081 ?auto_16079 ) ) ( not ( = ?auto_16081 ?auto_16077 ) ) ( not ( = ?auto_16081 ?auto_16069 ) ) ( not ( = ?auto_16050 ?auto_16057 ) ) ( not ( = ?auto_16050 ?auto_16062 ) ) ( not ( = ?auto_16051 ?auto_16057 ) ) ( not ( = ?auto_16051 ?auto_16062 ) ) ( not ( = ?auto_16052 ?auto_16057 ) ) ( not ( = ?auto_16052 ?auto_16062 ) ) ( not ( = ?auto_16053 ?auto_16057 ) ) ( not ( = ?auto_16053 ?auto_16062 ) ) ( not ( = ?auto_16054 ?auto_16057 ) ) ( not ( = ?auto_16054 ?auto_16062 ) ) ( not ( = ?auto_16056 ?auto_16057 ) ) ( not ( = ?auto_16056 ?auto_16062 ) ) ( not ( = ?auto_16055 ?auto_16057 ) ) ( not ( = ?auto_16055 ?auto_16062 ) ) ( not ( = ?auto_16057 ?auto_16081 ) ) ( not ( = ?auto_16057 ?auto_16071 ) ) ( not ( = ?auto_16057 ?auto_16078 ) ) ( not ( = ?auto_16057 ?auto_16065 ) ) ( not ( = ?auto_16057 ?auto_16079 ) ) ( not ( = ?auto_16057 ?auto_16077 ) ) ( not ( = ?auto_16057 ?auto_16069 ) ) ( not ( = ?auto_16062 ?auto_16081 ) ) ( not ( = ?auto_16062 ?auto_16071 ) ) ( not ( = ?auto_16062 ?auto_16078 ) ) ( not ( = ?auto_16062 ?auto_16065 ) ) ( not ( = ?auto_16062 ?auto_16079 ) ) ( not ( = ?auto_16062 ?auto_16077 ) ) ( not ( = ?auto_16062 ?auto_16069 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_16050 ?auto_16051 ?auto_16052 ?auto_16053 ?auto_16054 ?auto_16056 ?auto_16055 ?auto_16058 )
      ( MAKE-1CRATE ?auto_16058 ?auto_16057 )
      ( MAKE-8CRATE-VERIFY ?auto_16050 ?auto_16051 ?auto_16052 ?auto_16053 ?auto_16054 ?auto_16056 ?auto_16055 ?auto_16058 ?auto_16057 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16084 - SURFACE
      ?auto_16085 - SURFACE
    )
    :vars
    (
      ?auto_16086 - HOIST
      ?auto_16087 - PLACE
      ?auto_16089 - PLACE
      ?auto_16090 - HOIST
      ?auto_16091 - SURFACE
      ?auto_16088 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16086 ?auto_16087 ) ( SURFACE-AT ?auto_16084 ?auto_16087 ) ( CLEAR ?auto_16084 ) ( IS-CRATE ?auto_16085 ) ( AVAILABLE ?auto_16086 ) ( not ( = ?auto_16089 ?auto_16087 ) ) ( HOIST-AT ?auto_16090 ?auto_16089 ) ( AVAILABLE ?auto_16090 ) ( SURFACE-AT ?auto_16085 ?auto_16089 ) ( ON ?auto_16085 ?auto_16091 ) ( CLEAR ?auto_16085 ) ( TRUCK-AT ?auto_16088 ?auto_16087 ) ( not ( = ?auto_16084 ?auto_16085 ) ) ( not ( = ?auto_16084 ?auto_16091 ) ) ( not ( = ?auto_16085 ?auto_16091 ) ) ( not ( = ?auto_16086 ?auto_16090 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16088 ?auto_16087 ?auto_16089 )
      ( !LIFT ?auto_16090 ?auto_16085 ?auto_16091 ?auto_16089 )
      ( !LOAD ?auto_16090 ?auto_16085 ?auto_16088 ?auto_16089 )
      ( !DRIVE ?auto_16088 ?auto_16089 ?auto_16087 )
      ( !UNLOAD ?auto_16086 ?auto_16085 ?auto_16088 ?auto_16087 )
      ( !DROP ?auto_16086 ?auto_16085 ?auto_16084 ?auto_16087 )
      ( MAKE-1CRATE-VERIFY ?auto_16084 ?auto_16085 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_16102 - SURFACE
      ?auto_16103 - SURFACE
      ?auto_16104 - SURFACE
      ?auto_16105 - SURFACE
      ?auto_16106 - SURFACE
      ?auto_16109 - SURFACE
      ?auto_16107 - SURFACE
      ?auto_16111 - SURFACE
      ?auto_16110 - SURFACE
      ?auto_16108 - SURFACE
    )
    :vars
    (
      ?auto_16115 - HOIST
      ?auto_16114 - PLACE
      ?auto_16113 - PLACE
      ?auto_16117 - HOIST
      ?auto_16112 - SURFACE
      ?auto_16134 - SURFACE
      ?auto_16132 - SURFACE
      ?auto_16121 - PLACE
      ?auto_16123 - HOIST
      ?auto_16128 - SURFACE
      ?auto_16120 - PLACE
      ?auto_16131 - HOIST
      ?auto_16126 - SURFACE
      ?auto_16122 - PLACE
      ?auto_16129 - HOIST
      ?auto_16119 - SURFACE
      ?auto_16118 - PLACE
      ?auto_16127 - HOIST
      ?auto_16135 - SURFACE
      ?auto_16125 - SURFACE
      ?auto_16124 - PLACE
      ?auto_16133 - HOIST
      ?auto_16130 - SURFACE
      ?auto_16116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16115 ?auto_16114 ) ( IS-CRATE ?auto_16108 ) ( not ( = ?auto_16113 ?auto_16114 ) ) ( HOIST-AT ?auto_16117 ?auto_16113 ) ( SURFACE-AT ?auto_16108 ?auto_16113 ) ( ON ?auto_16108 ?auto_16112 ) ( CLEAR ?auto_16108 ) ( not ( = ?auto_16110 ?auto_16108 ) ) ( not ( = ?auto_16110 ?auto_16112 ) ) ( not ( = ?auto_16108 ?auto_16112 ) ) ( not ( = ?auto_16115 ?auto_16117 ) ) ( IS-CRATE ?auto_16110 ) ( SURFACE-AT ?auto_16110 ?auto_16113 ) ( ON ?auto_16110 ?auto_16134 ) ( CLEAR ?auto_16110 ) ( not ( = ?auto_16111 ?auto_16110 ) ) ( not ( = ?auto_16111 ?auto_16134 ) ) ( not ( = ?auto_16110 ?auto_16134 ) ) ( IS-CRATE ?auto_16111 ) ( SURFACE-AT ?auto_16111 ?auto_16113 ) ( ON ?auto_16111 ?auto_16132 ) ( CLEAR ?auto_16111 ) ( not ( = ?auto_16107 ?auto_16111 ) ) ( not ( = ?auto_16107 ?auto_16132 ) ) ( not ( = ?auto_16111 ?auto_16132 ) ) ( IS-CRATE ?auto_16107 ) ( not ( = ?auto_16121 ?auto_16114 ) ) ( HOIST-AT ?auto_16123 ?auto_16121 ) ( AVAILABLE ?auto_16123 ) ( SURFACE-AT ?auto_16107 ?auto_16121 ) ( ON ?auto_16107 ?auto_16128 ) ( CLEAR ?auto_16107 ) ( not ( = ?auto_16109 ?auto_16107 ) ) ( not ( = ?auto_16109 ?auto_16128 ) ) ( not ( = ?auto_16107 ?auto_16128 ) ) ( not ( = ?auto_16115 ?auto_16123 ) ) ( IS-CRATE ?auto_16109 ) ( not ( = ?auto_16120 ?auto_16114 ) ) ( HOIST-AT ?auto_16131 ?auto_16120 ) ( AVAILABLE ?auto_16131 ) ( SURFACE-AT ?auto_16109 ?auto_16120 ) ( ON ?auto_16109 ?auto_16126 ) ( CLEAR ?auto_16109 ) ( not ( = ?auto_16106 ?auto_16109 ) ) ( not ( = ?auto_16106 ?auto_16126 ) ) ( not ( = ?auto_16109 ?auto_16126 ) ) ( not ( = ?auto_16115 ?auto_16131 ) ) ( IS-CRATE ?auto_16106 ) ( not ( = ?auto_16122 ?auto_16114 ) ) ( HOIST-AT ?auto_16129 ?auto_16122 ) ( AVAILABLE ?auto_16129 ) ( SURFACE-AT ?auto_16106 ?auto_16122 ) ( ON ?auto_16106 ?auto_16119 ) ( CLEAR ?auto_16106 ) ( not ( = ?auto_16105 ?auto_16106 ) ) ( not ( = ?auto_16105 ?auto_16119 ) ) ( not ( = ?auto_16106 ?auto_16119 ) ) ( not ( = ?auto_16115 ?auto_16129 ) ) ( IS-CRATE ?auto_16105 ) ( not ( = ?auto_16118 ?auto_16114 ) ) ( HOIST-AT ?auto_16127 ?auto_16118 ) ( AVAILABLE ?auto_16127 ) ( SURFACE-AT ?auto_16105 ?auto_16118 ) ( ON ?auto_16105 ?auto_16135 ) ( CLEAR ?auto_16105 ) ( not ( = ?auto_16104 ?auto_16105 ) ) ( not ( = ?auto_16104 ?auto_16135 ) ) ( not ( = ?auto_16105 ?auto_16135 ) ) ( not ( = ?auto_16115 ?auto_16127 ) ) ( IS-CRATE ?auto_16104 ) ( AVAILABLE ?auto_16117 ) ( SURFACE-AT ?auto_16104 ?auto_16113 ) ( ON ?auto_16104 ?auto_16125 ) ( CLEAR ?auto_16104 ) ( not ( = ?auto_16103 ?auto_16104 ) ) ( not ( = ?auto_16103 ?auto_16125 ) ) ( not ( = ?auto_16104 ?auto_16125 ) ) ( SURFACE-AT ?auto_16102 ?auto_16114 ) ( CLEAR ?auto_16102 ) ( IS-CRATE ?auto_16103 ) ( AVAILABLE ?auto_16115 ) ( not ( = ?auto_16124 ?auto_16114 ) ) ( HOIST-AT ?auto_16133 ?auto_16124 ) ( AVAILABLE ?auto_16133 ) ( SURFACE-AT ?auto_16103 ?auto_16124 ) ( ON ?auto_16103 ?auto_16130 ) ( CLEAR ?auto_16103 ) ( TRUCK-AT ?auto_16116 ?auto_16114 ) ( not ( = ?auto_16102 ?auto_16103 ) ) ( not ( = ?auto_16102 ?auto_16130 ) ) ( not ( = ?auto_16103 ?auto_16130 ) ) ( not ( = ?auto_16115 ?auto_16133 ) ) ( not ( = ?auto_16102 ?auto_16104 ) ) ( not ( = ?auto_16102 ?auto_16125 ) ) ( not ( = ?auto_16104 ?auto_16130 ) ) ( not ( = ?auto_16113 ?auto_16124 ) ) ( not ( = ?auto_16117 ?auto_16133 ) ) ( not ( = ?auto_16125 ?auto_16130 ) ) ( not ( = ?auto_16102 ?auto_16105 ) ) ( not ( = ?auto_16102 ?auto_16135 ) ) ( not ( = ?auto_16103 ?auto_16105 ) ) ( not ( = ?auto_16103 ?auto_16135 ) ) ( not ( = ?auto_16105 ?auto_16125 ) ) ( not ( = ?auto_16105 ?auto_16130 ) ) ( not ( = ?auto_16118 ?auto_16113 ) ) ( not ( = ?auto_16118 ?auto_16124 ) ) ( not ( = ?auto_16127 ?auto_16117 ) ) ( not ( = ?auto_16127 ?auto_16133 ) ) ( not ( = ?auto_16135 ?auto_16125 ) ) ( not ( = ?auto_16135 ?auto_16130 ) ) ( not ( = ?auto_16102 ?auto_16106 ) ) ( not ( = ?auto_16102 ?auto_16119 ) ) ( not ( = ?auto_16103 ?auto_16106 ) ) ( not ( = ?auto_16103 ?auto_16119 ) ) ( not ( = ?auto_16104 ?auto_16106 ) ) ( not ( = ?auto_16104 ?auto_16119 ) ) ( not ( = ?auto_16106 ?auto_16135 ) ) ( not ( = ?auto_16106 ?auto_16125 ) ) ( not ( = ?auto_16106 ?auto_16130 ) ) ( not ( = ?auto_16122 ?auto_16118 ) ) ( not ( = ?auto_16122 ?auto_16113 ) ) ( not ( = ?auto_16122 ?auto_16124 ) ) ( not ( = ?auto_16129 ?auto_16127 ) ) ( not ( = ?auto_16129 ?auto_16117 ) ) ( not ( = ?auto_16129 ?auto_16133 ) ) ( not ( = ?auto_16119 ?auto_16135 ) ) ( not ( = ?auto_16119 ?auto_16125 ) ) ( not ( = ?auto_16119 ?auto_16130 ) ) ( not ( = ?auto_16102 ?auto_16109 ) ) ( not ( = ?auto_16102 ?auto_16126 ) ) ( not ( = ?auto_16103 ?auto_16109 ) ) ( not ( = ?auto_16103 ?auto_16126 ) ) ( not ( = ?auto_16104 ?auto_16109 ) ) ( not ( = ?auto_16104 ?auto_16126 ) ) ( not ( = ?auto_16105 ?auto_16109 ) ) ( not ( = ?auto_16105 ?auto_16126 ) ) ( not ( = ?auto_16109 ?auto_16119 ) ) ( not ( = ?auto_16109 ?auto_16135 ) ) ( not ( = ?auto_16109 ?auto_16125 ) ) ( not ( = ?auto_16109 ?auto_16130 ) ) ( not ( = ?auto_16120 ?auto_16122 ) ) ( not ( = ?auto_16120 ?auto_16118 ) ) ( not ( = ?auto_16120 ?auto_16113 ) ) ( not ( = ?auto_16120 ?auto_16124 ) ) ( not ( = ?auto_16131 ?auto_16129 ) ) ( not ( = ?auto_16131 ?auto_16127 ) ) ( not ( = ?auto_16131 ?auto_16117 ) ) ( not ( = ?auto_16131 ?auto_16133 ) ) ( not ( = ?auto_16126 ?auto_16119 ) ) ( not ( = ?auto_16126 ?auto_16135 ) ) ( not ( = ?auto_16126 ?auto_16125 ) ) ( not ( = ?auto_16126 ?auto_16130 ) ) ( not ( = ?auto_16102 ?auto_16107 ) ) ( not ( = ?auto_16102 ?auto_16128 ) ) ( not ( = ?auto_16103 ?auto_16107 ) ) ( not ( = ?auto_16103 ?auto_16128 ) ) ( not ( = ?auto_16104 ?auto_16107 ) ) ( not ( = ?auto_16104 ?auto_16128 ) ) ( not ( = ?auto_16105 ?auto_16107 ) ) ( not ( = ?auto_16105 ?auto_16128 ) ) ( not ( = ?auto_16106 ?auto_16107 ) ) ( not ( = ?auto_16106 ?auto_16128 ) ) ( not ( = ?auto_16107 ?auto_16126 ) ) ( not ( = ?auto_16107 ?auto_16119 ) ) ( not ( = ?auto_16107 ?auto_16135 ) ) ( not ( = ?auto_16107 ?auto_16125 ) ) ( not ( = ?auto_16107 ?auto_16130 ) ) ( not ( = ?auto_16121 ?auto_16120 ) ) ( not ( = ?auto_16121 ?auto_16122 ) ) ( not ( = ?auto_16121 ?auto_16118 ) ) ( not ( = ?auto_16121 ?auto_16113 ) ) ( not ( = ?auto_16121 ?auto_16124 ) ) ( not ( = ?auto_16123 ?auto_16131 ) ) ( not ( = ?auto_16123 ?auto_16129 ) ) ( not ( = ?auto_16123 ?auto_16127 ) ) ( not ( = ?auto_16123 ?auto_16117 ) ) ( not ( = ?auto_16123 ?auto_16133 ) ) ( not ( = ?auto_16128 ?auto_16126 ) ) ( not ( = ?auto_16128 ?auto_16119 ) ) ( not ( = ?auto_16128 ?auto_16135 ) ) ( not ( = ?auto_16128 ?auto_16125 ) ) ( not ( = ?auto_16128 ?auto_16130 ) ) ( not ( = ?auto_16102 ?auto_16111 ) ) ( not ( = ?auto_16102 ?auto_16132 ) ) ( not ( = ?auto_16103 ?auto_16111 ) ) ( not ( = ?auto_16103 ?auto_16132 ) ) ( not ( = ?auto_16104 ?auto_16111 ) ) ( not ( = ?auto_16104 ?auto_16132 ) ) ( not ( = ?auto_16105 ?auto_16111 ) ) ( not ( = ?auto_16105 ?auto_16132 ) ) ( not ( = ?auto_16106 ?auto_16111 ) ) ( not ( = ?auto_16106 ?auto_16132 ) ) ( not ( = ?auto_16109 ?auto_16111 ) ) ( not ( = ?auto_16109 ?auto_16132 ) ) ( not ( = ?auto_16111 ?auto_16128 ) ) ( not ( = ?auto_16111 ?auto_16126 ) ) ( not ( = ?auto_16111 ?auto_16119 ) ) ( not ( = ?auto_16111 ?auto_16135 ) ) ( not ( = ?auto_16111 ?auto_16125 ) ) ( not ( = ?auto_16111 ?auto_16130 ) ) ( not ( = ?auto_16132 ?auto_16128 ) ) ( not ( = ?auto_16132 ?auto_16126 ) ) ( not ( = ?auto_16132 ?auto_16119 ) ) ( not ( = ?auto_16132 ?auto_16135 ) ) ( not ( = ?auto_16132 ?auto_16125 ) ) ( not ( = ?auto_16132 ?auto_16130 ) ) ( not ( = ?auto_16102 ?auto_16110 ) ) ( not ( = ?auto_16102 ?auto_16134 ) ) ( not ( = ?auto_16103 ?auto_16110 ) ) ( not ( = ?auto_16103 ?auto_16134 ) ) ( not ( = ?auto_16104 ?auto_16110 ) ) ( not ( = ?auto_16104 ?auto_16134 ) ) ( not ( = ?auto_16105 ?auto_16110 ) ) ( not ( = ?auto_16105 ?auto_16134 ) ) ( not ( = ?auto_16106 ?auto_16110 ) ) ( not ( = ?auto_16106 ?auto_16134 ) ) ( not ( = ?auto_16109 ?auto_16110 ) ) ( not ( = ?auto_16109 ?auto_16134 ) ) ( not ( = ?auto_16107 ?auto_16110 ) ) ( not ( = ?auto_16107 ?auto_16134 ) ) ( not ( = ?auto_16110 ?auto_16132 ) ) ( not ( = ?auto_16110 ?auto_16128 ) ) ( not ( = ?auto_16110 ?auto_16126 ) ) ( not ( = ?auto_16110 ?auto_16119 ) ) ( not ( = ?auto_16110 ?auto_16135 ) ) ( not ( = ?auto_16110 ?auto_16125 ) ) ( not ( = ?auto_16110 ?auto_16130 ) ) ( not ( = ?auto_16134 ?auto_16132 ) ) ( not ( = ?auto_16134 ?auto_16128 ) ) ( not ( = ?auto_16134 ?auto_16126 ) ) ( not ( = ?auto_16134 ?auto_16119 ) ) ( not ( = ?auto_16134 ?auto_16135 ) ) ( not ( = ?auto_16134 ?auto_16125 ) ) ( not ( = ?auto_16134 ?auto_16130 ) ) ( not ( = ?auto_16102 ?auto_16108 ) ) ( not ( = ?auto_16102 ?auto_16112 ) ) ( not ( = ?auto_16103 ?auto_16108 ) ) ( not ( = ?auto_16103 ?auto_16112 ) ) ( not ( = ?auto_16104 ?auto_16108 ) ) ( not ( = ?auto_16104 ?auto_16112 ) ) ( not ( = ?auto_16105 ?auto_16108 ) ) ( not ( = ?auto_16105 ?auto_16112 ) ) ( not ( = ?auto_16106 ?auto_16108 ) ) ( not ( = ?auto_16106 ?auto_16112 ) ) ( not ( = ?auto_16109 ?auto_16108 ) ) ( not ( = ?auto_16109 ?auto_16112 ) ) ( not ( = ?auto_16107 ?auto_16108 ) ) ( not ( = ?auto_16107 ?auto_16112 ) ) ( not ( = ?auto_16111 ?auto_16108 ) ) ( not ( = ?auto_16111 ?auto_16112 ) ) ( not ( = ?auto_16108 ?auto_16134 ) ) ( not ( = ?auto_16108 ?auto_16132 ) ) ( not ( = ?auto_16108 ?auto_16128 ) ) ( not ( = ?auto_16108 ?auto_16126 ) ) ( not ( = ?auto_16108 ?auto_16119 ) ) ( not ( = ?auto_16108 ?auto_16135 ) ) ( not ( = ?auto_16108 ?auto_16125 ) ) ( not ( = ?auto_16108 ?auto_16130 ) ) ( not ( = ?auto_16112 ?auto_16134 ) ) ( not ( = ?auto_16112 ?auto_16132 ) ) ( not ( = ?auto_16112 ?auto_16128 ) ) ( not ( = ?auto_16112 ?auto_16126 ) ) ( not ( = ?auto_16112 ?auto_16119 ) ) ( not ( = ?auto_16112 ?auto_16135 ) ) ( not ( = ?auto_16112 ?auto_16125 ) ) ( not ( = ?auto_16112 ?auto_16130 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_16102 ?auto_16103 ?auto_16104 ?auto_16105 ?auto_16106 ?auto_16109 ?auto_16107 ?auto_16111 ?auto_16110 )
      ( MAKE-1CRATE ?auto_16110 ?auto_16108 )
      ( MAKE-9CRATE-VERIFY ?auto_16102 ?auto_16103 ?auto_16104 ?auto_16105 ?auto_16106 ?auto_16109 ?auto_16107 ?auto_16111 ?auto_16110 ?auto_16108 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16138 - SURFACE
      ?auto_16139 - SURFACE
    )
    :vars
    (
      ?auto_16140 - HOIST
      ?auto_16141 - PLACE
      ?auto_16143 - PLACE
      ?auto_16144 - HOIST
      ?auto_16145 - SURFACE
      ?auto_16142 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16140 ?auto_16141 ) ( SURFACE-AT ?auto_16138 ?auto_16141 ) ( CLEAR ?auto_16138 ) ( IS-CRATE ?auto_16139 ) ( AVAILABLE ?auto_16140 ) ( not ( = ?auto_16143 ?auto_16141 ) ) ( HOIST-AT ?auto_16144 ?auto_16143 ) ( AVAILABLE ?auto_16144 ) ( SURFACE-AT ?auto_16139 ?auto_16143 ) ( ON ?auto_16139 ?auto_16145 ) ( CLEAR ?auto_16139 ) ( TRUCK-AT ?auto_16142 ?auto_16141 ) ( not ( = ?auto_16138 ?auto_16139 ) ) ( not ( = ?auto_16138 ?auto_16145 ) ) ( not ( = ?auto_16139 ?auto_16145 ) ) ( not ( = ?auto_16140 ?auto_16144 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16142 ?auto_16141 ?auto_16143 )
      ( !LIFT ?auto_16144 ?auto_16139 ?auto_16145 ?auto_16143 )
      ( !LOAD ?auto_16144 ?auto_16139 ?auto_16142 ?auto_16143 )
      ( !DRIVE ?auto_16142 ?auto_16143 ?auto_16141 )
      ( !UNLOAD ?auto_16140 ?auto_16139 ?auto_16142 ?auto_16141 )
      ( !DROP ?auto_16140 ?auto_16139 ?auto_16138 ?auto_16141 )
      ( MAKE-1CRATE-VERIFY ?auto_16138 ?auto_16139 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_16157 - SURFACE
      ?auto_16158 - SURFACE
      ?auto_16159 - SURFACE
      ?auto_16160 - SURFACE
      ?auto_16161 - SURFACE
      ?auto_16164 - SURFACE
      ?auto_16162 - SURFACE
      ?auto_16166 - SURFACE
      ?auto_16165 - SURFACE
      ?auto_16163 - SURFACE
      ?auto_16167 - SURFACE
    )
    :vars
    (
      ?auto_16172 - HOIST
      ?auto_16171 - PLACE
      ?auto_16170 - PLACE
      ?auto_16168 - HOIST
      ?auto_16173 - SURFACE
      ?auto_16179 - PLACE
      ?auto_16183 - HOIST
      ?auto_16175 - SURFACE
      ?auto_16182 - SURFACE
      ?auto_16176 - SURFACE
      ?auto_16178 - PLACE
      ?auto_16191 - HOIST
      ?auto_16181 - SURFACE
      ?auto_16186 - PLACE
      ?auto_16188 - HOIST
      ?auto_16174 - SURFACE
      ?auto_16192 - PLACE
      ?auto_16194 - HOIST
      ?auto_16185 - SURFACE
      ?auto_16180 - PLACE
      ?auto_16193 - HOIST
      ?auto_16177 - SURFACE
      ?auto_16189 - SURFACE
      ?auto_16190 - PLACE
      ?auto_16184 - HOIST
      ?auto_16187 - SURFACE
      ?auto_16169 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16172 ?auto_16171 ) ( IS-CRATE ?auto_16167 ) ( not ( = ?auto_16170 ?auto_16171 ) ) ( HOIST-AT ?auto_16168 ?auto_16170 ) ( AVAILABLE ?auto_16168 ) ( SURFACE-AT ?auto_16167 ?auto_16170 ) ( ON ?auto_16167 ?auto_16173 ) ( CLEAR ?auto_16167 ) ( not ( = ?auto_16163 ?auto_16167 ) ) ( not ( = ?auto_16163 ?auto_16173 ) ) ( not ( = ?auto_16167 ?auto_16173 ) ) ( not ( = ?auto_16172 ?auto_16168 ) ) ( IS-CRATE ?auto_16163 ) ( not ( = ?auto_16179 ?auto_16171 ) ) ( HOIST-AT ?auto_16183 ?auto_16179 ) ( SURFACE-AT ?auto_16163 ?auto_16179 ) ( ON ?auto_16163 ?auto_16175 ) ( CLEAR ?auto_16163 ) ( not ( = ?auto_16165 ?auto_16163 ) ) ( not ( = ?auto_16165 ?auto_16175 ) ) ( not ( = ?auto_16163 ?auto_16175 ) ) ( not ( = ?auto_16172 ?auto_16183 ) ) ( IS-CRATE ?auto_16165 ) ( SURFACE-AT ?auto_16165 ?auto_16179 ) ( ON ?auto_16165 ?auto_16182 ) ( CLEAR ?auto_16165 ) ( not ( = ?auto_16166 ?auto_16165 ) ) ( not ( = ?auto_16166 ?auto_16182 ) ) ( not ( = ?auto_16165 ?auto_16182 ) ) ( IS-CRATE ?auto_16166 ) ( SURFACE-AT ?auto_16166 ?auto_16179 ) ( ON ?auto_16166 ?auto_16176 ) ( CLEAR ?auto_16166 ) ( not ( = ?auto_16162 ?auto_16166 ) ) ( not ( = ?auto_16162 ?auto_16176 ) ) ( not ( = ?auto_16166 ?auto_16176 ) ) ( IS-CRATE ?auto_16162 ) ( not ( = ?auto_16178 ?auto_16171 ) ) ( HOIST-AT ?auto_16191 ?auto_16178 ) ( AVAILABLE ?auto_16191 ) ( SURFACE-AT ?auto_16162 ?auto_16178 ) ( ON ?auto_16162 ?auto_16181 ) ( CLEAR ?auto_16162 ) ( not ( = ?auto_16164 ?auto_16162 ) ) ( not ( = ?auto_16164 ?auto_16181 ) ) ( not ( = ?auto_16162 ?auto_16181 ) ) ( not ( = ?auto_16172 ?auto_16191 ) ) ( IS-CRATE ?auto_16164 ) ( not ( = ?auto_16186 ?auto_16171 ) ) ( HOIST-AT ?auto_16188 ?auto_16186 ) ( AVAILABLE ?auto_16188 ) ( SURFACE-AT ?auto_16164 ?auto_16186 ) ( ON ?auto_16164 ?auto_16174 ) ( CLEAR ?auto_16164 ) ( not ( = ?auto_16161 ?auto_16164 ) ) ( not ( = ?auto_16161 ?auto_16174 ) ) ( not ( = ?auto_16164 ?auto_16174 ) ) ( not ( = ?auto_16172 ?auto_16188 ) ) ( IS-CRATE ?auto_16161 ) ( not ( = ?auto_16192 ?auto_16171 ) ) ( HOIST-AT ?auto_16194 ?auto_16192 ) ( AVAILABLE ?auto_16194 ) ( SURFACE-AT ?auto_16161 ?auto_16192 ) ( ON ?auto_16161 ?auto_16185 ) ( CLEAR ?auto_16161 ) ( not ( = ?auto_16160 ?auto_16161 ) ) ( not ( = ?auto_16160 ?auto_16185 ) ) ( not ( = ?auto_16161 ?auto_16185 ) ) ( not ( = ?auto_16172 ?auto_16194 ) ) ( IS-CRATE ?auto_16160 ) ( not ( = ?auto_16180 ?auto_16171 ) ) ( HOIST-AT ?auto_16193 ?auto_16180 ) ( AVAILABLE ?auto_16193 ) ( SURFACE-AT ?auto_16160 ?auto_16180 ) ( ON ?auto_16160 ?auto_16177 ) ( CLEAR ?auto_16160 ) ( not ( = ?auto_16159 ?auto_16160 ) ) ( not ( = ?auto_16159 ?auto_16177 ) ) ( not ( = ?auto_16160 ?auto_16177 ) ) ( not ( = ?auto_16172 ?auto_16193 ) ) ( IS-CRATE ?auto_16159 ) ( AVAILABLE ?auto_16183 ) ( SURFACE-AT ?auto_16159 ?auto_16179 ) ( ON ?auto_16159 ?auto_16189 ) ( CLEAR ?auto_16159 ) ( not ( = ?auto_16158 ?auto_16159 ) ) ( not ( = ?auto_16158 ?auto_16189 ) ) ( not ( = ?auto_16159 ?auto_16189 ) ) ( SURFACE-AT ?auto_16157 ?auto_16171 ) ( CLEAR ?auto_16157 ) ( IS-CRATE ?auto_16158 ) ( AVAILABLE ?auto_16172 ) ( not ( = ?auto_16190 ?auto_16171 ) ) ( HOIST-AT ?auto_16184 ?auto_16190 ) ( AVAILABLE ?auto_16184 ) ( SURFACE-AT ?auto_16158 ?auto_16190 ) ( ON ?auto_16158 ?auto_16187 ) ( CLEAR ?auto_16158 ) ( TRUCK-AT ?auto_16169 ?auto_16171 ) ( not ( = ?auto_16157 ?auto_16158 ) ) ( not ( = ?auto_16157 ?auto_16187 ) ) ( not ( = ?auto_16158 ?auto_16187 ) ) ( not ( = ?auto_16172 ?auto_16184 ) ) ( not ( = ?auto_16157 ?auto_16159 ) ) ( not ( = ?auto_16157 ?auto_16189 ) ) ( not ( = ?auto_16159 ?auto_16187 ) ) ( not ( = ?auto_16179 ?auto_16190 ) ) ( not ( = ?auto_16183 ?auto_16184 ) ) ( not ( = ?auto_16189 ?auto_16187 ) ) ( not ( = ?auto_16157 ?auto_16160 ) ) ( not ( = ?auto_16157 ?auto_16177 ) ) ( not ( = ?auto_16158 ?auto_16160 ) ) ( not ( = ?auto_16158 ?auto_16177 ) ) ( not ( = ?auto_16160 ?auto_16189 ) ) ( not ( = ?auto_16160 ?auto_16187 ) ) ( not ( = ?auto_16180 ?auto_16179 ) ) ( not ( = ?auto_16180 ?auto_16190 ) ) ( not ( = ?auto_16193 ?auto_16183 ) ) ( not ( = ?auto_16193 ?auto_16184 ) ) ( not ( = ?auto_16177 ?auto_16189 ) ) ( not ( = ?auto_16177 ?auto_16187 ) ) ( not ( = ?auto_16157 ?auto_16161 ) ) ( not ( = ?auto_16157 ?auto_16185 ) ) ( not ( = ?auto_16158 ?auto_16161 ) ) ( not ( = ?auto_16158 ?auto_16185 ) ) ( not ( = ?auto_16159 ?auto_16161 ) ) ( not ( = ?auto_16159 ?auto_16185 ) ) ( not ( = ?auto_16161 ?auto_16177 ) ) ( not ( = ?auto_16161 ?auto_16189 ) ) ( not ( = ?auto_16161 ?auto_16187 ) ) ( not ( = ?auto_16192 ?auto_16180 ) ) ( not ( = ?auto_16192 ?auto_16179 ) ) ( not ( = ?auto_16192 ?auto_16190 ) ) ( not ( = ?auto_16194 ?auto_16193 ) ) ( not ( = ?auto_16194 ?auto_16183 ) ) ( not ( = ?auto_16194 ?auto_16184 ) ) ( not ( = ?auto_16185 ?auto_16177 ) ) ( not ( = ?auto_16185 ?auto_16189 ) ) ( not ( = ?auto_16185 ?auto_16187 ) ) ( not ( = ?auto_16157 ?auto_16164 ) ) ( not ( = ?auto_16157 ?auto_16174 ) ) ( not ( = ?auto_16158 ?auto_16164 ) ) ( not ( = ?auto_16158 ?auto_16174 ) ) ( not ( = ?auto_16159 ?auto_16164 ) ) ( not ( = ?auto_16159 ?auto_16174 ) ) ( not ( = ?auto_16160 ?auto_16164 ) ) ( not ( = ?auto_16160 ?auto_16174 ) ) ( not ( = ?auto_16164 ?auto_16185 ) ) ( not ( = ?auto_16164 ?auto_16177 ) ) ( not ( = ?auto_16164 ?auto_16189 ) ) ( not ( = ?auto_16164 ?auto_16187 ) ) ( not ( = ?auto_16186 ?auto_16192 ) ) ( not ( = ?auto_16186 ?auto_16180 ) ) ( not ( = ?auto_16186 ?auto_16179 ) ) ( not ( = ?auto_16186 ?auto_16190 ) ) ( not ( = ?auto_16188 ?auto_16194 ) ) ( not ( = ?auto_16188 ?auto_16193 ) ) ( not ( = ?auto_16188 ?auto_16183 ) ) ( not ( = ?auto_16188 ?auto_16184 ) ) ( not ( = ?auto_16174 ?auto_16185 ) ) ( not ( = ?auto_16174 ?auto_16177 ) ) ( not ( = ?auto_16174 ?auto_16189 ) ) ( not ( = ?auto_16174 ?auto_16187 ) ) ( not ( = ?auto_16157 ?auto_16162 ) ) ( not ( = ?auto_16157 ?auto_16181 ) ) ( not ( = ?auto_16158 ?auto_16162 ) ) ( not ( = ?auto_16158 ?auto_16181 ) ) ( not ( = ?auto_16159 ?auto_16162 ) ) ( not ( = ?auto_16159 ?auto_16181 ) ) ( not ( = ?auto_16160 ?auto_16162 ) ) ( not ( = ?auto_16160 ?auto_16181 ) ) ( not ( = ?auto_16161 ?auto_16162 ) ) ( not ( = ?auto_16161 ?auto_16181 ) ) ( not ( = ?auto_16162 ?auto_16174 ) ) ( not ( = ?auto_16162 ?auto_16185 ) ) ( not ( = ?auto_16162 ?auto_16177 ) ) ( not ( = ?auto_16162 ?auto_16189 ) ) ( not ( = ?auto_16162 ?auto_16187 ) ) ( not ( = ?auto_16178 ?auto_16186 ) ) ( not ( = ?auto_16178 ?auto_16192 ) ) ( not ( = ?auto_16178 ?auto_16180 ) ) ( not ( = ?auto_16178 ?auto_16179 ) ) ( not ( = ?auto_16178 ?auto_16190 ) ) ( not ( = ?auto_16191 ?auto_16188 ) ) ( not ( = ?auto_16191 ?auto_16194 ) ) ( not ( = ?auto_16191 ?auto_16193 ) ) ( not ( = ?auto_16191 ?auto_16183 ) ) ( not ( = ?auto_16191 ?auto_16184 ) ) ( not ( = ?auto_16181 ?auto_16174 ) ) ( not ( = ?auto_16181 ?auto_16185 ) ) ( not ( = ?auto_16181 ?auto_16177 ) ) ( not ( = ?auto_16181 ?auto_16189 ) ) ( not ( = ?auto_16181 ?auto_16187 ) ) ( not ( = ?auto_16157 ?auto_16166 ) ) ( not ( = ?auto_16157 ?auto_16176 ) ) ( not ( = ?auto_16158 ?auto_16166 ) ) ( not ( = ?auto_16158 ?auto_16176 ) ) ( not ( = ?auto_16159 ?auto_16166 ) ) ( not ( = ?auto_16159 ?auto_16176 ) ) ( not ( = ?auto_16160 ?auto_16166 ) ) ( not ( = ?auto_16160 ?auto_16176 ) ) ( not ( = ?auto_16161 ?auto_16166 ) ) ( not ( = ?auto_16161 ?auto_16176 ) ) ( not ( = ?auto_16164 ?auto_16166 ) ) ( not ( = ?auto_16164 ?auto_16176 ) ) ( not ( = ?auto_16166 ?auto_16181 ) ) ( not ( = ?auto_16166 ?auto_16174 ) ) ( not ( = ?auto_16166 ?auto_16185 ) ) ( not ( = ?auto_16166 ?auto_16177 ) ) ( not ( = ?auto_16166 ?auto_16189 ) ) ( not ( = ?auto_16166 ?auto_16187 ) ) ( not ( = ?auto_16176 ?auto_16181 ) ) ( not ( = ?auto_16176 ?auto_16174 ) ) ( not ( = ?auto_16176 ?auto_16185 ) ) ( not ( = ?auto_16176 ?auto_16177 ) ) ( not ( = ?auto_16176 ?auto_16189 ) ) ( not ( = ?auto_16176 ?auto_16187 ) ) ( not ( = ?auto_16157 ?auto_16165 ) ) ( not ( = ?auto_16157 ?auto_16182 ) ) ( not ( = ?auto_16158 ?auto_16165 ) ) ( not ( = ?auto_16158 ?auto_16182 ) ) ( not ( = ?auto_16159 ?auto_16165 ) ) ( not ( = ?auto_16159 ?auto_16182 ) ) ( not ( = ?auto_16160 ?auto_16165 ) ) ( not ( = ?auto_16160 ?auto_16182 ) ) ( not ( = ?auto_16161 ?auto_16165 ) ) ( not ( = ?auto_16161 ?auto_16182 ) ) ( not ( = ?auto_16164 ?auto_16165 ) ) ( not ( = ?auto_16164 ?auto_16182 ) ) ( not ( = ?auto_16162 ?auto_16165 ) ) ( not ( = ?auto_16162 ?auto_16182 ) ) ( not ( = ?auto_16165 ?auto_16176 ) ) ( not ( = ?auto_16165 ?auto_16181 ) ) ( not ( = ?auto_16165 ?auto_16174 ) ) ( not ( = ?auto_16165 ?auto_16185 ) ) ( not ( = ?auto_16165 ?auto_16177 ) ) ( not ( = ?auto_16165 ?auto_16189 ) ) ( not ( = ?auto_16165 ?auto_16187 ) ) ( not ( = ?auto_16182 ?auto_16176 ) ) ( not ( = ?auto_16182 ?auto_16181 ) ) ( not ( = ?auto_16182 ?auto_16174 ) ) ( not ( = ?auto_16182 ?auto_16185 ) ) ( not ( = ?auto_16182 ?auto_16177 ) ) ( not ( = ?auto_16182 ?auto_16189 ) ) ( not ( = ?auto_16182 ?auto_16187 ) ) ( not ( = ?auto_16157 ?auto_16163 ) ) ( not ( = ?auto_16157 ?auto_16175 ) ) ( not ( = ?auto_16158 ?auto_16163 ) ) ( not ( = ?auto_16158 ?auto_16175 ) ) ( not ( = ?auto_16159 ?auto_16163 ) ) ( not ( = ?auto_16159 ?auto_16175 ) ) ( not ( = ?auto_16160 ?auto_16163 ) ) ( not ( = ?auto_16160 ?auto_16175 ) ) ( not ( = ?auto_16161 ?auto_16163 ) ) ( not ( = ?auto_16161 ?auto_16175 ) ) ( not ( = ?auto_16164 ?auto_16163 ) ) ( not ( = ?auto_16164 ?auto_16175 ) ) ( not ( = ?auto_16162 ?auto_16163 ) ) ( not ( = ?auto_16162 ?auto_16175 ) ) ( not ( = ?auto_16166 ?auto_16163 ) ) ( not ( = ?auto_16166 ?auto_16175 ) ) ( not ( = ?auto_16163 ?auto_16182 ) ) ( not ( = ?auto_16163 ?auto_16176 ) ) ( not ( = ?auto_16163 ?auto_16181 ) ) ( not ( = ?auto_16163 ?auto_16174 ) ) ( not ( = ?auto_16163 ?auto_16185 ) ) ( not ( = ?auto_16163 ?auto_16177 ) ) ( not ( = ?auto_16163 ?auto_16189 ) ) ( not ( = ?auto_16163 ?auto_16187 ) ) ( not ( = ?auto_16175 ?auto_16182 ) ) ( not ( = ?auto_16175 ?auto_16176 ) ) ( not ( = ?auto_16175 ?auto_16181 ) ) ( not ( = ?auto_16175 ?auto_16174 ) ) ( not ( = ?auto_16175 ?auto_16185 ) ) ( not ( = ?auto_16175 ?auto_16177 ) ) ( not ( = ?auto_16175 ?auto_16189 ) ) ( not ( = ?auto_16175 ?auto_16187 ) ) ( not ( = ?auto_16157 ?auto_16167 ) ) ( not ( = ?auto_16157 ?auto_16173 ) ) ( not ( = ?auto_16158 ?auto_16167 ) ) ( not ( = ?auto_16158 ?auto_16173 ) ) ( not ( = ?auto_16159 ?auto_16167 ) ) ( not ( = ?auto_16159 ?auto_16173 ) ) ( not ( = ?auto_16160 ?auto_16167 ) ) ( not ( = ?auto_16160 ?auto_16173 ) ) ( not ( = ?auto_16161 ?auto_16167 ) ) ( not ( = ?auto_16161 ?auto_16173 ) ) ( not ( = ?auto_16164 ?auto_16167 ) ) ( not ( = ?auto_16164 ?auto_16173 ) ) ( not ( = ?auto_16162 ?auto_16167 ) ) ( not ( = ?auto_16162 ?auto_16173 ) ) ( not ( = ?auto_16166 ?auto_16167 ) ) ( not ( = ?auto_16166 ?auto_16173 ) ) ( not ( = ?auto_16165 ?auto_16167 ) ) ( not ( = ?auto_16165 ?auto_16173 ) ) ( not ( = ?auto_16167 ?auto_16175 ) ) ( not ( = ?auto_16167 ?auto_16182 ) ) ( not ( = ?auto_16167 ?auto_16176 ) ) ( not ( = ?auto_16167 ?auto_16181 ) ) ( not ( = ?auto_16167 ?auto_16174 ) ) ( not ( = ?auto_16167 ?auto_16185 ) ) ( not ( = ?auto_16167 ?auto_16177 ) ) ( not ( = ?auto_16167 ?auto_16189 ) ) ( not ( = ?auto_16167 ?auto_16187 ) ) ( not ( = ?auto_16170 ?auto_16179 ) ) ( not ( = ?auto_16170 ?auto_16178 ) ) ( not ( = ?auto_16170 ?auto_16186 ) ) ( not ( = ?auto_16170 ?auto_16192 ) ) ( not ( = ?auto_16170 ?auto_16180 ) ) ( not ( = ?auto_16170 ?auto_16190 ) ) ( not ( = ?auto_16168 ?auto_16183 ) ) ( not ( = ?auto_16168 ?auto_16191 ) ) ( not ( = ?auto_16168 ?auto_16188 ) ) ( not ( = ?auto_16168 ?auto_16194 ) ) ( not ( = ?auto_16168 ?auto_16193 ) ) ( not ( = ?auto_16168 ?auto_16184 ) ) ( not ( = ?auto_16173 ?auto_16175 ) ) ( not ( = ?auto_16173 ?auto_16182 ) ) ( not ( = ?auto_16173 ?auto_16176 ) ) ( not ( = ?auto_16173 ?auto_16181 ) ) ( not ( = ?auto_16173 ?auto_16174 ) ) ( not ( = ?auto_16173 ?auto_16185 ) ) ( not ( = ?auto_16173 ?auto_16177 ) ) ( not ( = ?auto_16173 ?auto_16189 ) ) ( not ( = ?auto_16173 ?auto_16187 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_16157 ?auto_16158 ?auto_16159 ?auto_16160 ?auto_16161 ?auto_16164 ?auto_16162 ?auto_16166 ?auto_16165 ?auto_16163 )
      ( MAKE-1CRATE ?auto_16163 ?auto_16167 )
      ( MAKE-10CRATE-VERIFY ?auto_16157 ?auto_16158 ?auto_16159 ?auto_16160 ?auto_16161 ?auto_16164 ?auto_16162 ?auto_16166 ?auto_16165 ?auto_16163 ?auto_16167 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16197 - SURFACE
      ?auto_16198 - SURFACE
    )
    :vars
    (
      ?auto_16199 - HOIST
      ?auto_16200 - PLACE
      ?auto_16202 - PLACE
      ?auto_16203 - HOIST
      ?auto_16204 - SURFACE
      ?auto_16201 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16199 ?auto_16200 ) ( SURFACE-AT ?auto_16197 ?auto_16200 ) ( CLEAR ?auto_16197 ) ( IS-CRATE ?auto_16198 ) ( AVAILABLE ?auto_16199 ) ( not ( = ?auto_16202 ?auto_16200 ) ) ( HOIST-AT ?auto_16203 ?auto_16202 ) ( AVAILABLE ?auto_16203 ) ( SURFACE-AT ?auto_16198 ?auto_16202 ) ( ON ?auto_16198 ?auto_16204 ) ( CLEAR ?auto_16198 ) ( TRUCK-AT ?auto_16201 ?auto_16200 ) ( not ( = ?auto_16197 ?auto_16198 ) ) ( not ( = ?auto_16197 ?auto_16204 ) ) ( not ( = ?auto_16198 ?auto_16204 ) ) ( not ( = ?auto_16199 ?auto_16203 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16201 ?auto_16200 ?auto_16202 )
      ( !LIFT ?auto_16203 ?auto_16198 ?auto_16204 ?auto_16202 )
      ( !LOAD ?auto_16203 ?auto_16198 ?auto_16201 ?auto_16202 )
      ( !DRIVE ?auto_16201 ?auto_16202 ?auto_16200 )
      ( !UNLOAD ?auto_16199 ?auto_16198 ?auto_16201 ?auto_16200 )
      ( !DROP ?auto_16199 ?auto_16198 ?auto_16197 ?auto_16200 )
      ( MAKE-1CRATE-VERIFY ?auto_16197 ?auto_16198 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_16217 - SURFACE
      ?auto_16218 - SURFACE
      ?auto_16219 - SURFACE
      ?auto_16220 - SURFACE
      ?auto_16221 - SURFACE
      ?auto_16224 - SURFACE
      ?auto_16222 - SURFACE
      ?auto_16226 - SURFACE
      ?auto_16225 - SURFACE
      ?auto_16223 - SURFACE
      ?auto_16228 - SURFACE
      ?auto_16227 - SURFACE
    )
    :vars
    (
      ?auto_16232 - HOIST
      ?auto_16230 - PLACE
      ?auto_16233 - PLACE
      ?auto_16234 - HOIST
      ?auto_16229 - SURFACE
      ?auto_16246 - PLACE
      ?auto_16236 - HOIST
      ?auto_16238 - SURFACE
      ?auto_16240 - PLACE
      ?auto_16235 - HOIST
      ?auto_16256 - SURFACE
      ?auto_16239 - SURFACE
      ?auto_16251 - SURFACE
      ?auto_16254 - PLACE
      ?auto_16250 - HOIST
      ?auto_16244 - SURFACE
      ?auto_16247 - PLACE
      ?auto_16237 - HOIST
      ?auto_16241 - SURFACE
      ?auto_16249 - PLACE
      ?auto_16245 - HOIST
      ?auto_16253 - SURFACE
      ?auto_16257 - PLACE
      ?auto_16243 - HOIST
      ?auto_16242 - SURFACE
      ?auto_16255 - SURFACE
      ?auto_16252 - PLACE
      ?auto_16248 - HOIST
      ?auto_16258 - SURFACE
      ?auto_16231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16232 ?auto_16230 ) ( IS-CRATE ?auto_16227 ) ( not ( = ?auto_16233 ?auto_16230 ) ) ( HOIST-AT ?auto_16234 ?auto_16233 ) ( AVAILABLE ?auto_16234 ) ( SURFACE-AT ?auto_16227 ?auto_16233 ) ( ON ?auto_16227 ?auto_16229 ) ( CLEAR ?auto_16227 ) ( not ( = ?auto_16228 ?auto_16227 ) ) ( not ( = ?auto_16228 ?auto_16229 ) ) ( not ( = ?auto_16227 ?auto_16229 ) ) ( not ( = ?auto_16232 ?auto_16234 ) ) ( IS-CRATE ?auto_16228 ) ( not ( = ?auto_16246 ?auto_16230 ) ) ( HOIST-AT ?auto_16236 ?auto_16246 ) ( AVAILABLE ?auto_16236 ) ( SURFACE-AT ?auto_16228 ?auto_16246 ) ( ON ?auto_16228 ?auto_16238 ) ( CLEAR ?auto_16228 ) ( not ( = ?auto_16223 ?auto_16228 ) ) ( not ( = ?auto_16223 ?auto_16238 ) ) ( not ( = ?auto_16228 ?auto_16238 ) ) ( not ( = ?auto_16232 ?auto_16236 ) ) ( IS-CRATE ?auto_16223 ) ( not ( = ?auto_16240 ?auto_16230 ) ) ( HOIST-AT ?auto_16235 ?auto_16240 ) ( SURFACE-AT ?auto_16223 ?auto_16240 ) ( ON ?auto_16223 ?auto_16256 ) ( CLEAR ?auto_16223 ) ( not ( = ?auto_16225 ?auto_16223 ) ) ( not ( = ?auto_16225 ?auto_16256 ) ) ( not ( = ?auto_16223 ?auto_16256 ) ) ( not ( = ?auto_16232 ?auto_16235 ) ) ( IS-CRATE ?auto_16225 ) ( SURFACE-AT ?auto_16225 ?auto_16240 ) ( ON ?auto_16225 ?auto_16239 ) ( CLEAR ?auto_16225 ) ( not ( = ?auto_16226 ?auto_16225 ) ) ( not ( = ?auto_16226 ?auto_16239 ) ) ( not ( = ?auto_16225 ?auto_16239 ) ) ( IS-CRATE ?auto_16226 ) ( SURFACE-AT ?auto_16226 ?auto_16240 ) ( ON ?auto_16226 ?auto_16251 ) ( CLEAR ?auto_16226 ) ( not ( = ?auto_16222 ?auto_16226 ) ) ( not ( = ?auto_16222 ?auto_16251 ) ) ( not ( = ?auto_16226 ?auto_16251 ) ) ( IS-CRATE ?auto_16222 ) ( not ( = ?auto_16254 ?auto_16230 ) ) ( HOIST-AT ?auto_16250 ?auto_16254 ) ( AVAILABLE ?auto_16250 ) ( SURFACE-AT ?auto_16222 ?auto_16254 ) ( ON ?auto_16222 ?auto_16244 ) ( CLEAR ?auto_16222 ) ( not ( = ?auto_16224 ?auto_16222 ) ) ( not ( = ?auto_16224 ?auto_16244 ) ) ( not ( = ?auto_16222 ?auto_16244 ) ) ( not ( = ?auto_16232 ?auto_16250 ) ) ( IS-CRATE ?auto_16224 ) ( not ( = ?auto_16247 ?auto_16230 ) ) ( HOIST-AT ?auto_16237 ?auto_16247 ) ( AVAILABLE ?auto_16237 ) ( SURFACE-AT ?auto_16224 ?auto_16247 ) ( ON ?auto_16224 ?auto_16241 ) ( CLEAR ?auto_16224 ) ( not ( = ?auto_16221 ?auto_16224 ) ) ( not ( = ?auto_16221 ?auto_16241 ) ) ( not ( = ?auto_16224 ?auto_16241 ) ) ( not ( = ?auto_16232 ?auto_16237 ) ) ( IS-CRATE ?auto_16221 ) ( not ( = ?auto_16249 ?auto_16230 ) ) ( HOIST-AT ?auto_16245 ?auto_16249 ) ( AVAILABLE ?auto_16245 ) ( SURFACE-AT ?auto_16221 ?auto_16249 ) ( ON ?auto_16221 ?auto_16253 ) ( CLEAR ?auto_16221 ) ( not ( = ?auto_16220 ?auto_16221 ) ) ( not ( = ?auto_16220 ?auto_16253 ) ) ( not ( = ?auto_16221 ?auto_16253 ) ) ( not ( = ?auto_16232 ?auto_16245 ) ) ( IS-CRATE ?auto_16220 ) ( not ( = ?auto_16257 ?auto_16230 ) ) ( HOIST-AT ?auto_16243 ?auto_16257 ) ( AVAILABLE ?auto_16243 ) ( SURFACE-AT ?auto_16220 ?auto_16257 ) ( ON ?auto_16220 ?auto_16242 ) ( CLEAR ?auto_16220 ) ( not ( = ?auto_16219 ?auto_16220 ) ) ( not ( = ?auto_16219 ?auto_16242 ) ) ( not ( = ?auto_16220 ?auto_16242 ) ) ( not ( = ?auto_16232 ?auto_16243 ) ) ( IS-CRATE ?auto_16219 ) ( AVAILABLE ?auto_16235 ) ( SURFACE-AT ?auto_16219 ?auto_16240 ) ( ON ?auto_16219 ?auto_16255 ) ( CLEAR ?auto_16219 ) ( not ( = ?auto_16218 ?auto_16219 ) ) ( not ( = ?auto_16218 ?auto_16255 ) ) ( not ( = ?auto_16219 ?auto_16255 ) ) ( SURFACE-AT ?auto_16217 ?auto_16230 ) ( CLEAR ?auto_16217 ) ( IS-CRATE ?auto_16218 ) ( AVAILABLE ?auto_16232 ) ( not ( = ?auto_16252 ?auto_16230 ) ) ( HOIST-AT ?auto_16248 ?auto_16252 ) ( AVAILABLE ?auto_16248 ) ( SURFACE-AT ?auto_16218 ?auto_16252 ) ( ON ?auto_16218 ?auto_16258 ) ( CLEAR ?auto_16218 ) ( TRUCK-AT ?auto_16231 ?auto_16230 ) ( not ( = ?auto_16217 ?auto_16218 ) ) ( not ( = ?auto_16217 ?auto_16258 ) ) ( not ( = ?auto_16218 ?auto_16258 ) ) ( not ( = ?auto_16232 ?auto_16248 ) ) ( not ( = ?auto_16217 ?auto_16219 ) ) ( not ( = ?auto_16217 ?auto_16255 ) ) ( not ( = ?auto_16219 ?auto_16258 ) ) ( not ( = ?auto_16240 ?auto_16252 ) ) ( not ( = ?auto_16235 ?auto_16248 ) ) ( not ( = ?auto_16255 ?auto_16258 ) ) ( not ( = ?auto_16217 ?auto_16220 ) ) ( not ( = ?auto_16217 ?auto_16242 ) ) ( not ( = ?auto_16218 ?auto_16220 ) ) ( not ( = ?auto_16218 ?auto_16242 ) ) ( not ( = ?auto_16220 ?auto_16255 ) ) ( not ( = ?auto_16220 ?auto_16258 ) ) ( not ( = ?auto_16257 ?auto_16240 ) ) ( not ( = ?auto_16257 ?auto_16252 ) ) ( not ( = ?auto_16243 ?auto_16235 ) ) ( not ( = ?auto_16243 ?auto_16248 ) ) ( not ( = ?auto_16242 ?auto_16255 ) ) ( not ( = ?auto_16242 ?auto_16258 ) ) ( not ( = ?auto_16217 ?auto_16221 ) ) ( not ( = ?auto_16217 ?auto_16253 ) ) ( not ( = ?auto_16218 ?auto_16221 ) ) ( not ( = ?auto_16218 ?auto_16253 ) ) ( not ( = ?auto_16219 ?auto_16221 ) ) ( not ( = ?auto_16219 ?auto_16253 ) ) ( not ( = ?auto_16221 ?auto_16242 ) ) ( not ( = ?auto_16221 ?auto_16255 ) ) ( not ( = ?auto_16221 ?auto_16258 ) ) ( not ( = ?auto_16249 ?auto_16257 ) ) ( not ( = ?auto_16249 ?auto_16240 ) ) ( not ( = ?auto_16249 ?auto_16252 ) ) ( not ( = ?auto_16245 ?auto_16243 ) ) ( not ( = ?auto_16245 ?auto_16235 ) ) ( not ( = ?auto_16245 ?auto_16248 ) ) ( not ( = ?auto_16253 ?auto_16242 ) ) ( not ( = ?auto_16253 ?auto_16255 ) ) ( not ( = ?auto_16253 ?auto_16258 ) ) ( not ( = ?auto_16217 ?auto_16224 ) ) ( not ( = ?auto_16217 ?auto_16241 ) ) ( not ( = ?auto_16218 ?auto_16224 ) ) ( not ( = ?auto_16218 ?auto_16241 ) ) ( not ( = ?auto_16219 ?auto_16224 ) ) ( not ( = ?auto_16219 ?auto_16241 ) ) ( not ( = ?auto_16220 ?auto_16224 ) ) ( not ( = ?auto_16220 ?auto_16241 ) ) ( not ( = ?auto_16224 ?auto_16253 ) ) ( not ( = ?auto_16224 ?auto_16242 ) ) ( not ( = ?auto_16224 ?auto_16255 ) ) ( not ( = ?auto_16224 ?auto_16258 ) ) ( not ( = ?auto_16247 ?auto_16249 ) ) ( not ( = ?auto_16247 ?auto_16257 ) ) ( not ( = ?auto_16247 ?auto_16240 ) ) ( not ( = ?auto_16247 ?auto_16252 ) ) ( not ( = ?auto_16237 ?auto_16245 ) ) ( not ( = ?auto_16237 ?auto_16243 ) ) ( not ( = ?auto_16237 ?auto_16235 ) ) ( not ( = ?auto_16237 ?auto_16248 ) ) ( not ( = ?auto_16241 ?auto_16253 ) ) ( not ( = ?auto_16241 ?auto_16242 ) ) ( not ( = ?auto_16241 ?auto_16255 ) ) ( not ( = ?auto_16241 ?auto_16258 ) ) ( not ( = ?auto_16217 ?auto_16222 ) ) ( not ( = ?auto_16217 ?auto_16244 ) ) ( not ( = ?auto_16218 ?auto_16222 ) ) ( not ( = ?auto_16218 ?auto_16244 ) ) ( not ( = ?auto_16219 ?auto_16222 ) ) ( not ( = ?auto_16219 ?auto_16244 ) ) ( not ( = ?auto_16220 ?auto_16222 ) ) ( not ( = ?auto_16220 ?auto_16244 ) ) ( not ( = ?auto_16221 ?auto_16222 ) ) ( not ( = ?auto_16221 ?auto_16244 ) ) ( not ( = ?auto_16222 ?auto_16241 ) ) ( not ( = ?auto_16222 ?auto_16253 ) ) ( not ( = ?auto_16222 ?auto_16242 ) ) ( not ( = ?auto_16222 ?auto_16255 ) ) ( not ( = ?auto_16222 ?auto_16258 ) ) ( not ( = ?auto_16254 ?auto_16247 ) ) ( not ( = ?auto_16254 ?auto_16249 ) ) ( not ( = ?auto_16254 ?auto_16257 ) ) ( not ( = ?auto_16254 ?auto_16240 ) ) ( not ( = ?auto_16254 ?auto_16252 ) ) ( not ( = ?auto_16250 ?auto_16237 ) ) ( not ( = ?auto_16250 ?auto_16245 ) ) ( not ( = ?auto_16250 ?auto_16243 ) ) ( not ( = ?auto_16250 ?auto_16235 ) ) ( not ( = ?auto_16250 ?auto_16248 ) ) ( not ( = ?auto_16244 ?auto_16241 ) ) ( not ( = ?auto_16244 ?auto_16253 ) ) ( not ( = ?auto_16244 ?auto_16242 ) ) ( not ( = ?auto_16244 ?auto_16255 ) ) ( not ( = ?auto_16244 ?auto_16258 ) ) ( not ( = ?auto_16217 ?auto_16226 ) ) ( not ( = ?auto_16217 ?auto_16251 ) ) ( not ( = ?auto_16218 ?auto_16226 ) ) ( not ( = ?auto_16218 ?auto_16251 ) ) ( not ( = ?auto_16219 ?auto_16226 ) ) ( not ( = ?auto_16219 ?auto_16251 ) ) ( not ( = ?auto_16220 ?auto_16226 ) ) ( not ( = ?auto_16220 ?auto_16251 ) ) ( not ( = ?auto_16221 ?auto_16226 ) ) ( not ( = ?auto_16221 ?auto_16251 ) ) ( not ( = ?auto_16224 ?auto_16226 ) ) ( not ( = ?auto_16224 ?auto_16251 ) ) ( not ( = ?auto_16226 ?auto_16244 ) ) ( not ( = ?auto_16226 ?auto_16241 ) ) ( not ( = ?auto_16226 ?auto_16253 ) ) ( not ( = ?auto_16226 ?auto_16242 ) ) ( not ( = ?auto_16226 ?auto_16255 ) ) ( not ( = ?auto_16226 ?auto_16258 ) ) ( not ( = ?auto_16251 ?auto_16244 ) ) ( not ( = ?auto_16251 ?auto_16241 ) ) ( not ( = ?auto_16251 ?auto_16253 ) ) ( not ( = ?auto_16251 ?auto_16242 ) ) ( not ( = ?auto_16251 ?auto_16255 ) ) ( not ( = ?auto_16251 ?auto_16258 ) ) ( not ( = ?auto_16217 ?auto_16225 ) ) ( not ( = ?auto_16217 ?auto_16239 ) ) ( not ( = ?auto_16218 ?auto_16225 ) ) ( not ( = ?auto_16218 ?auto_16239 ) ) ( not ( = ?auto_16219 ?auto_16225 ) ) ( not ( = ?auto_16219 ?auto_16239 ) ) ( not ( = ?auto_16220 ?auto_16225 ) ) ( not ( = ?auto_16220 ?auto_16239 ) ) ( not ( = ?auto_16221 ?auto_16225 ) ) ( not ( = ?auto_16221 ?auto_16239 ) ) ( not ( = ?auto_16224 ?auto_16225 ) ) ( not ( = ?auto_16224 ?auto_16239 ) ) ( not ( = ?auto_16222 ?auto_16225 ) ) ( not ( = ?auto_16222 ?auto_16239 ) ) ( not ( = ?auto_16225 ?auto_16251 ) ) ( not ( = ?auto_16225 ?auto_16244 ) ) ( not ( = ?auto_16225 ?auto_16241 ) ) ( not ( = ?auto_16225 ?auto_16253 ) ) ( not ( = ?auto_16225 ?auto_16242 ) ) ( not ( = ?auto_16225 ?auto_16255 ) ) ( not ( = ?auto_16225 ?auto_16258 ) ) ( not ( = ?auto_16239 ?auto_16251 ) ) ( not ( = ?auto_16239 ?auto_16244 ) ) ( not ( = ?auto_16239 ?auto_16241 ) ) ( not ( = ?auto_16239 ?auto_16253 ) ) ( not ( = ?auto_16239 ?auto_16242 ) ) ( not ( = ?auto_16239 ?auto_16255 ) ) ( not ( = ?auto_16239 ?auto_16258 ) ) ( not ( = ?auto_16217 ?auto_16223 ) ) ( not ( = ?auto_16217 ?auto_16256 ) ) ( not ( = ?auto_16218 ?auto_16223 ) ) ( not ( = ?auto_16218 ?auto_16256 ) ) ( not ( = ?auto_16219 ?auto_16223 ) ) ( not ( = ?auto_16219 ?auto_16256 ) ) ( not ( = ?auto_16220 ?auto_16223 ) ) ( not ( = ?auto_16220 ?auto_16256 ) ) ( not ( = ?auto_16221 ?auto_16223 ) ) ( not ( = ?auto_16221 ?auto_16256 ) ) ( not ( = ?auto_16224 ?auto_16223 ) ) ( not ( = ?auto_16224 ?auto_16256 ) ) ( not ( = ?auto_16222 ?auto_16223 ) ) ( not ( = ?auto_16222 ?auto_16256 ) ) ( not ( = ?auto_16226 ?auto_16223 ) ) ( not ( = ?auto_16226 ?auto_16256 ) ) ( not ( = ?auto_16223 ?auto_16239 ) ) ( not ( = ?auto_16223 ?auto_16251 ) ) ( not ( = ?auto_16223 ?auto_16244 ) ) ( not ( = ?auto_16223 ?auto_16241 ) ) ( not ( = ?auto_16223 ?auto_16253 ) ) ( not ( = ?auto_16223 ?auto_16242 ) ) ( not ( = ?auto_16223 ?auto_16255 ) ) ( not ( = ?auto_16223 ?auto_16258 ) ) ( not ( = ?auto_16256 ?auto_16239 ) ) ( not ( = ?auto_16256 ?auto_16251 ) ) ( not ( = ?auto_16256 ?auto_16244 ) ) ( not ( = ?auto_16256 ?auto_16241 ) ) ( not ( = ?auto_16256 ?auto_16253 ) ) ( not ( = ?auto_16256 ?auto_16242 ) ) ( not ( = ?auto_16256 ?auto_16255 ) ) ( not ( = ?auto_16256 ?auto_16258 ) ) ( not ( = ?auto_16217 ?auto_16228 ) ) ( not ( = ?auto_16217 ?auto_16238 ) ) ( not ( = ?auto_16218 ?auto_16228 ) ) ( not ( = ?auto_16218 ?auto_16238 ) ) ( not ( = ?auto_16219 ?auto_16228 ) ) ( not ( = ?auto_16219 ?auto_16238 ) ) ( not ( = ?auto_16220 ?auto_16228 ) ) ( not ( = ?auto_16220 ?auto_16238 ) ) ( not ( = ?auto_16221 ?auto_16228 ) ) ( not ( = ?auto_16221 ?auto_16238 ) ) ( not ( = ?auto_16224 ?auto_16228 ) ) ( not ( = ?auto_16224 ?auto_16238 ) ) ( not ( = ?auto_16222 ?auto_16228 ) ) ( not ( = ?auto_16222 ?auto_16238 ) ) ( not ( = ?auto_16226 ?auto_16228 ) ) ( not ( = ?auto_16226 ?auto_16238 ) ) ( not ( = ?auto_16225 ?auto_16228 ) ) ( not ( = ?auto_16225 ?auto_16238 ) ) ( not ( = ?auto_16228 ?auto_16256 ) ) ( not ( = ?auto_16228 ?auto_16239 ) ) ( not ( = ?auto_16228 ?auto_16251 ) ) ( not ( = ?auto_16228 ?auto_16244 ) ) ( not ( = ?auto_16228 ?auto_16241 ) ) ( not ( = ?auto_16228 ?auto_16253 ) ) ( not ( = ?auto_16228 ?auto_16242 ) ) ( not ( = ?auto_16228 ?auto_16255 ) ) ( not ( = ?auto_16228 ?auto_16258 ) ) ( not ( = ?auto_16246 ?auto_16240 ) ) ( not ( = ?auto_16246 ?auto_16254 ) ) ( not ( = ?auto_16246 ?auto_16247 ) ) ( not ( = ?auto_16246 ?auto_16249 ) ) ( not ( = ?auto_16246 ?auto_16257 ) ) ( not ( = ?auto_16246 ?auto_16252 ) ) ( not ( = ?auto_16236 ?auto_16235 ) ) ( not ( = ?auto_16236 ?auto_16250 ) ) ( not ( = ?auto_16236 ?auto_16237 ) ) ( not ( = ?auto_16236 ?auto_16245 ) ) ( not ( = ?auto_16236 ?auto_16243 ) ) ( not ( = ?auto_16236 ?auto_16248 ) ) ( not ( = ?auto_16238 ?auto_16256 ) ) ( not ( = ?auto_16238 ?auto_16239 ) ) ( not ( = ?auto_16238 ?auto_16251 ) ) ( not ( = ?auto_16238 ?auto_16244 ) ) ( not ( = ?auto_16238 ?auto_16241 ) ) ( not ( = ?auto_16238 ?auto_16253 ) ) ( not ( = ?auto_16238 ?auto_16242 ) ) ( not ( = ?auto_16238 ?auto_16255 ) ) ( not ( = ?auto_16238 ?auto_16258 ) ) ( not ( = ?auto_16217 ?auto_16227 ) ) ( not ( = ?auto_16217 ?auto_16229 ) ) ( not ( = ?auto_16218 ?auto_16227 ) ) ( not ( = ?auto_16218 ?auto_16229 ) ) ( not ( = ?auto_16219 ?auto_16227 ) ) ( not ( = ?auto_16219 ?auto_16229 ) ) ( not ( = ?auto_16220 ?auto_16227 ) ) ( not ( = ?auto_16220 ?auto_16229 ) ) ( not ( = ?auto_16221 ?auto_16227 ) ) ( not ( = ?auto_16221 ?auto_16229 ) ) ( not ( = ?auto_16224 ?auto_16227 ) ) ( not ( = ?auto_16224 ?auto_16229 ) ) ( not ( = ?auto_16222 ?auto_16227 ) ) ( not ( = ?auto_16222 ?auto_16229 ) ) ( not ( = ?auto_16226 ?auto_16227 ) ) ( not ( = ?auto_16226 ?auto_16229 ) ) ( not ( = ?auto_16225 ?auto_16227 ) ) ( not ( = ?auto_16225 ?auto_16229 ) ) ( not ( = ?auto_16223 ?auto_16227 ) ) ( not ( = ?auto_16223 ?auto_16229 ) ) ( not ( = ?auto_16227 ?auto_16238 ) ) ( not ( = ?auto_16227 ?auto_16256 ) ) ( not ( = ?auto_16227 ?auto_16239 ) ) ( not ( = ?auto_16227 ?auto_16251 ) ) ( not ( = ?auto_16227 ?auto_16244 ) ) ( not ( = ?auto_16227 ?auto_16241 ) ) ( not ( = ?auto_16227 ?auto_16253 ) ) ( not ( = ?auto_16227 ?auto_16242 ) ) ( not ( = ?auto_16227 ?auto_16255 ) ) ( not ( = ?auto_16227 ?auto_16258 ) ) ( not ( = ?auto_16233 ?auto_16246 ) ) ( not ( = ?auto_16233 ?auto_16240 ) ) ( not ( = ?auto_16233 ?auto_16254 ) ) ( not ( = ?auto_16233 ?auto_16247 ) ) ( not ( = ?auto_16233 ?auto_16249 ) ) ( not ( = ?auto_16233 ?auto_16257 ) ) ( not ( = ?auto_16233 ?auto_16252 ) ) ( not ( = ?auto_16234 ?auto_16236 ) ) ( not ( = ?auto_16234 ?auto_16235 ) ) ( not ( = ?auto_16234 ?auto_16250 ) ) ( not ( = ?auto_16234 ?auto_16237 ) ) ( not ( = ?auto_16234 ?auto_16245 ) ) ( not ( = ?auto_16234 ?auto_16243 ) ) ( not ( = ?auto_16234 ?auto_16248 ) ) ( not ( = ?auto_16229 ?auto_16238 ) ) ( not ( = ?auto_16229 ?auto_16256 ) ) ( not ( = ?auto_16229 ?auto_16239 ) ) ( not ( = ?auto_16229 ?auto_16251 ) ) ( not ( = ?auto_16229 ?auto_16244 ) ) ( not ( = ?auto_16229 ?auto_16241 ) ) ( not ( = ?auto_16229 ?auto_16253 ) ) ( not ( = ?auto_16229 ?auto_16242 ) ) ( not ( = ?auto_16229 ?auto_16255 ) ) ( not ( = ?auto_16229 ?auto_16258 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_16217 ?auto_16218 ?auto_16219 ?auto_16220 ?auto_16221 ?auto_16224 ?auto_16222 ?auto_16226 ?auto_16225 ?auto_16223 ?auto_16228 )
      ( MAKE-1CRATE ?auto_16228 ?auto_16227 )
      ( MAKE-11CRATE-VERIFY ?auto_16217 ?auto_16218 ?auto_16219 ?auto_16220 ?auto_16221 ?auto_16224 ?auto_16222 ?auto_16226 ?auto_16225 ?auto_16223 ?auto_16228 ?auto_16227 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16261 - SURFACE
      ?auto_16262 - SURFACE
    )
    :vars
    (
      ?auto_16263 - HOIST
      ?auto_16264 - PLACE
      ?auto_16266 - PLACE
      ?auto_16267 - HOIST
      ?auto_16268 - SURFACE
      ?auto_16265 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16263 ?auto_16264 ) ( SURFACE-AT ?auto_16261 ?auto_16264 ) ( CLEAR ?auto_16261 ) ( IS-CRATE ?auto_16262 ) ( AVAILABLE ?auto_16263 ) ( not ( = ?auto_16266 ?auto_16264 ) ) ( HOIST-AT ?auto_16267 ?auto_16266 ) ( AVAILABLE ?auto_16267 ) ( SURFACE-AT ?auto_16262 ?auto_16266 ) ( ON ?auto_16262 ?auto_16268 ) ( CLEAR ?auto_16262 ) ( TRUCK-AT ?auto_16265 ?auto_16264 ) ( not ( = ?auto_16261 ?auto_16262 ) ) ( not ( = ?auto_16261 ?auto_16268 ) ) ( not ( = ?auto_16262 ?auto_16268 ) ) ( not ( = ?auto_16263 ?auto_16267 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16265 ?auto_16264 ?auto_16266 )
      ( !LIFT ?auto_16267 ?auto_16262 ?auto_16268 ?auto_16266 )
      ( !LOAD ?auto_16267 ?auto_16262 ?auto_16265 ?auto_16266 )
      ( !DRIVE ?auto_16265 ?auto_16266 ?auto_16264 )
      ( !UNLOAD ?auto_16263 ?auto_16262 ?auto_16265 ?auto_16264 )
      ( !DROP ?auto_16263 ?auto_16262 ?auto_16261 ?auto_16264 )
      ( MAKE-1CRATE-VERIFY ?auto_16261 ?auto_16262 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_16282 - SURFACE
      ?auto_16283 - SURFACE
      ?auto_16284 - SURFACE
      ?auto_16285 - SURFACE
      ?auto_16286 - SURFACE
      ?auto_16289 - SURFACE
      ?auto_16287 - SURFACE
      ?auto_16291 - SURFACE
      ?auto_16290 - SURFACE
      ?auto_16288 - SURFACE
      ?auto_16293 - SURFACE
      ?auto_16292 - SURFACE
      ?auto_16294 - SURFACE
    )
    :vars
    (
      ?auto_16296 - HOIST
      ?auto_16300 - PLACE
      ?auto_16299 - PLACE
      ?auto_16295 - HOIST
      ?auto_16298 - SURFACE
      ?auto_16307 - PLACE
      ?auto_16308 - HOIST
      ?auto_16317 - SURFACE
      ?auto_16313 - PLACE
      ?auto_16325 - HOIST
      ?auto_16324 - SURFACE
      ?auto_16319 - PLACE
      ?auto_16304 - HOIST
      ?auto_16314 - SURFACE
      ?auto_16305 - SURFACE
      ?auto_16322 - SURFACE
      ?auto_16326 - PLACE
      ?auto_16301 - HOIST
      ?auto_16318 - SURFACE
      ?auto_16312 - PLACE
      ?auto_16321 - HOIST
      ?auto_16310 - SURFACE
      ?auto_16327 - PLACE
      ?auto_16315 - HOIST
      ?auto_16323 - SURFACE
      ?auto_16303 - PLACE
      ?auto_16302 - HOIST
      ?auto_16311 - SURFACE
      ?auto_16316 - SURFACE
      ?auto_16309 - PLACE
      ?auto_16306 - HOIST
      ?auto_16320 - SURFACE
      ?auto_16297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16296 ?auto_16300 ) ( IS-CRATE ?auto_16294 ) ( not ( = ?auto_16299 ?auto_16300 ) ) ( HOIST-AT ?auto_16295 ?auto_16299 ) ( AVAILABLE ?auto_16295 ) ( SURFACE-AT ?auto_16294 ?auto_16299 ) ( ON ?auto_16294 ?auto_16298 ) ( CLEAR ?auto_16294 ) ( not ( = ?auto_16292 ?auto_16294 ) ) ( not ( = ?auto_16292 ?auto_16298 ) ) ( not ( = ?auto_16294 ?auto_16298 ) ) ( not ( = ?auto_16296 ?auto_16295 ) ) ( IS-CRATE ?auto_16292 ) ( not ( = ?auto_16307 ?auto_16300 ) ) ( HOIST-AT ?auto_16308 ?auto_16307 ) ( AVAILABLE ?auto_16308 ) ( SURFACE-AT ?auto_16292 ?auto_16307 ) ( ON ?auto_16292 ?auto_16317 ) ( CLEAR ?auto_16292 ) ( not ( = ?auto_16293 ?auto_16292 ) ) ( not ( = ?auto_16293 ?auto_16317 ) ) ( not ( = ?auto_16292 ?auto_16317 ) ) ( not ( = ?auto_16296 ?auto_16308 ) ) ( IS-CRATE ?auto_16293 ) ( not ( = ?auto_16313 ?auto_16300 ) ) ( HOIST-AT ?auto_16325 ?auto_16313 ) ( AVAILABLE ?auto_16325 ) ( SURFACE-AT ?auto_16293 ?auto_16313 ) ( ON ?auto_16293 ?auto_16324 ) ( CLEAR ?auto_16293 ) ( not ( = ?auto_16288 ?auto_16293 ) ) ( not ( = ?auto_16288 ?auto_16324 ) ) ( not ( = ?auto_16293 ?auto_16324 ) ) ( not ( = ?auto_16296 ?auto_16325 ) ) ( IS-CRATE ?auto_16288 ) ( not ( = ?auto_16319 ?auto_16300 ) ) ( HOIST-AT ?auto_16304 ?auto_16319 ) ( SURFACE-AT ?auto_16288 ?auto_16319 ) ( ON ?auto_16288 ?auto_16314 ) ( CLEAR ?auto_16288 ) ( not ( = ?auto_16290 ?auto_16288 ) ) ( not ( = ?auto_16290 ?auto_16314 ) ) ( not ( = ?auto_16288 ?auto_16314 ) ) ( not ( = ?auto_16296 ?auto_16304 ) ) ( IS-CRATE ?auto_16290 ) ( SURFACE-AT ?auto_16290 ?auto_16319 ) ( ON ?auto_16290 ?auto_16305 ) ( CLEAR ?auto_16290 ) ( not ( = ?auto_16291 ?auto_16290 ) ) ( not ( = ?auto_16291 ?auto_16305 ) ) ( not ( = ?auto_16290 ?auto_16305 ) ) ( IS-CRATE ?auto_16291 ) ( SURFACE-AT ?auto_16291 ?auto_16319 ) ( ON ?auto_16291 ?auto_16322 ) ( CLEAR ?auto_16291 ) ( not ( = ?auto_16287 ?auto_16291 ) ) ( not ( = ?auto_16287 ?auto_16322 ) ) ( not ( = ?auto_16291 ?auto_16322 ) ) ( IS-CRATE ?auto_16287 ) ( not ( = ?auto_16326 ?auto_16300 ) ) ( HOIST-AT ?auto_16301 ?auto_16326 ) ( AVAILABLE ?auto_16301 ) ( SURFACE-AT ?auto_16287 ?auto_16326 ) ( ON ?auto_16287 ?auto_16318 ) ( CLEAR ?auto_16287 ) ( not ( = ?auto_16289 ?auto_16287 ) ) ( not ( = ?auto_16289 ?auto_16318 ) ) ( not ( = ?auto_16287 ?auto_16318 ) ) ( not ( = ?auto_16296 ?auto_16301 ) ) ( IS-CRATE ?auto_16289 ) ( not ( = ?auto_16312 ?auto_16300 ) ) ( HOIST-AT ?auto_16321 ?auto_16312 ) ( AVAILABLE ?auto_16321 ) ( SURFACE-AT ?auto_16289 ?auto_16312 ) ( ON ?auto_16289 ?auto_16310 ) ( CLEAR ?auto_16289 ) ( not ( = ?auto_16286 ?auto_16289 ) ) ( not ( = ?auto_16286 ?auto_16310 ) ) ( not ( = ?auto_16289 ?auto_16310 ) ) ( not ( = ?auto_16296 ?auto_16321 ) ) ( IS-CRATE ?auto_16286 ) ( not ( = ?auto_16327 ?auto_16300 ) ) ( HOIST-AT ?auto_16315 ?auto_16327 ) ( AVAILABLE ?auto_16315 ) ( SURFACE-AT ?auto_16286 ?auto_16327 ) ( ON ?auto_16286 ?auto_16323 ) ( CLEAR ?auto_16286 ) ( not ( = ?auto_16285 ?auto_16286 ) ) ( not ( = ?auto_16285 ?auto_16323 ) ) ( not ( = ?auto_16286 ?auto_16323 ) ) ( not ( = ?auto_16296 ?auto_16315 ) ) ( IS-CRATE ?auto_16285 ) ( not ( = ?auto_16303 ?auto_16300 ) ) ( HOIST-AT ?auto_16302 ?auto_16303 ) ( AVAILABLE ?auto_16302 ) ( SURFACE-AT ?auto_16285 ?auto_16303 ) ( ON ?auto_16285 ?auto_16311 ) ( CLEAR ?auto_16285 ) ( not ( = ?auto_16284 ?auto_16285 ) ) ( not ( = ?auto_16284 ?auto_16311 ) ) ( not ( = ?auto_16285 ?auto_16311 ) ) ( not ( = ?auto_16296 ?auto_16302 ) ) ( IS-CRATE ?auto_16284 ) ( AVAILABLE ?auto_16304 ) ( SURFACE-AT ?auto_16284 ?auto_16319 ) ( ON ?auto_16284 ?auto_16316 ) ( CLEAR ?auto_16284 ) ( not ( = ?auto_16283 ?auto_16284 ) ) ( not ( = ?auto_16283 ?auto_16316 ) ) ( not ( = ?auto_16284 ?auto_16316 ) ) ( SURFACE-AT ?auto_16282 ?auto_16300 ) ( CLEAR ?auto_16282 ) ( IS-CRATE ?auto_16283 ) ( AVAILABLE ?auto_16296 ) ( not ( = ?auto_16309 ?auto_16300 ) ) ( HOIST-AT ?auto_16306 ?auto_16309 ) ( AVAILABLE ?auto_16306 ) ( SURFACE-AT ?auto_16283 ?auto_16309 ) ( ON ?auto_16283 ?auto_16320 ) ( CLEAR ?auto_16283 ) ( TRUCK-AT ?auto_16297 ?auto_16300 ) ( not ( = ?auto_16282 ?auto_16283 ) ) ( not ( = ?auto_16282 ?auto_16320 ) ) ( not ( = ?auto_16283 ?auto_16320 ) ) ( not ( = ?auto_16296 ?auto_16306 ) ) ( not ( = ?auto_16282 ?auto_16284 ) ) ( not ( = ?auto_16282 ?auto_16316 ) ) ( not ( = ?auto_16284 ?auto_16320 ) ) ( not ( = ?auto_16319 ?auto_16309 ) ) ( not ( = ?auto_16304 ?auto_16306 ) ) ( not ( = ?auto_16316 ?auto_16320 ) ) ( not ( = ?auto_16282 ?auto_16285 ) ) ( not ( = ?auto_16282 ?auto_16311 ) ) ( not ( = ?auto_16283 ?auto_16285 ) ) ( not ( = ?auto_16283 ?auto_16311 ) ) ( not ( = ?auto_16285 ?auto_16316 ) ) ( not ( = ?auto_16285 ?auto_16320 ) ) ( not ( = ?auto_16303 ?auto_16319 ) ) ( not ( = ?auto_16303 ?auto_16309 ) ) ( not ( = ?auto_16302 ?auto_16304 ) ) ( not ( = ?auto_16302 ?auto_16306 ) ) ( not ( = ?auto_16311 ?auto_16316 ) ) ( not ( = ?auto_16311 ?auto_16320 ) ) ( not ( = ?auto_16282 ?auto_16286 ) ) ( not ( = ?auto_16282 ?auto_16323 ) ) ( not ( = ?auto_16283 ?auto_16286 ) ) ( not ( = ?auto_16283 ?auto_16323 ) ) ( not ( = ?auto_16284 ?auto_16286 ) ) ( not ( = ?auto_16284 ?auto_16323 ) ) ( not ( = ?auto_16286 ?auto_16311 ) ) ( not ( = ?auto_16286 ?auto_16316 ) ) ( not ( = ?auto_16286 ?auto_16320 ) ) ( not ( = ?auto_16327 ?auto_16303 ) ) ( not ( = ?auto_16327 ?auto_16319 ) ) ( not ( = ?auto_16327 ?auto_16309 ) ) ( not ( = ?auto_16315 ?auto_16302 ) ) ( not ( = ?auto_16315 ?auto_16304 ) ) ( not ( = ?auto_16315 ?auto_16306 ) ) ( not ( = ?auto_16323 ?auto_16311 ) ) ( not ( = ?auto_16323 ?auto_16316 ) ) ( not ( = ?auto_16323 ?auto_16320 ) ) ( not ( = ?auto_16282 ?auto_16289 ) ) ( not ( = ?auto_16282 ?auto_16310 ) ) ( not ( = ?auto_16283 ?auto_16289 ) ) ( not ( = ?auto_16283 ?auto_16310 ) ) ( not ( = ?auto_16284 ?auto_16289 ) ) ( not ( = ?auto_16284 ?auto_16310 ) ) ( not ( = ?auto_16285 ?auto_16289 ) ) ( not ( = ?auto_16285 ?auto_16310 ) ) ( not ( = ?auto_16289 ?auto_16323 ) ) ( not ( = ?auto_16289 ?auto_16311 ) ) ( not ( = ?auto_16289 ?auto_16316 ) ) ( not ( = ?auto_16289 ?auto_16320 ) ) ( not ( = ?auto_16312 ?auto_16327 ) ) ( not ( = ?auto_16312 ?auto_16303 ) ) ( not ( = ?auto_16312 ?auto_16319 ) ) ( not ( = ?auto_16312 ?auto_16309 ) ) ( not ( = ?auto_16321 ?auto_16315 ) ) ( not ( = ?auto_16321 ?auto_16302 ) ) ( not ( = ?auto_16321 ?auto_16304 ) ) ( not ( = ?auto_16321 ?auto_16306 ) ) ( not ( = ?auto_16310 ?auto_16323 ) ) ( not ( = ?auto_16310 ?auto_16311 ) ) ( not ( = ?auto_16310 ?auto_16316 ) ) ( not ( = ?auto_16310 ?auto_16320 ) ) ( not ( = ?auto_16282 ?auto_16287 ) ) ( not ( = ?auto_16282 ?auto_16318 ) ) ( not ( = ?auto_16283 ?auto_16287 ) ) ( not ( = ?auto_16283 ?auto_16318 ) ) ( not ( = ?auto_16284 ?auto_16287 ) ) ( not ( = ?auto_16284 ?auto_16318 ) ) ( not ( = ?auto_16285 ?auto_16287 ) ) ( not ( = ?auto_16285 ?auto_16318 ) ) ( not ( = ?auto_16286 ?auto_16287 ) ) ( not ( = ?auto_16286 ?auto_16318 ) ) ( not ( = ?auto_16287 ?auto_16310 ) ) ( not ( = ?auto_16287 ?auto_16323 ) ) ( not ( = ?auto_16287 ?auto_16311 ) ) ( not ( = ?auto_16287 ?auto_16316 ) ) ( not ( = ?auto_16287 ?auto_16320 ) ) ( not ( = ?auto_16326 ?auto_16312 ) ) ( not ( = ?auto_16326 ?auto_16327 ) ) ( not ( = ?auto_16326 ?auto_16303 ) ) ( not ( = ?auto_16326 ?auto_16319 ) ) ( not ( = ?auto_16326 ?auto_16309 ) ) ( not ( = ?auto_16301 ?auto_16321 ) ) ( not ( = ?auto_16301 ?auto_16315 ) ) ( not ( = ?auto_16301 ?auto_16302 ) ) ( not ( = ?auto_16301 ?auto_16304 ) ) ( not ( = ?auto_16301 ?auto_16306 ) ) ( not ( = ?auto_16318 ?auto_16310 ) ) ( not ( = ?auto_16318 ?auto_16323 ) ) ( not ( = ?auto_16318 ?auto_16311 ) ) ( not ( = ?auto_16318 ?auto_16316 ) ) ( not ( = ?auto_16318 ?auto_16320 ) ) ( not ( = ?auto_16282 ?auto_16291 ) ) ( not ( = ?auto_16282 ?auto_16322 ) ) ( not ( = ?auto_16283 ?auto_16291 ) ) ( not ( = ?auto_16283 ?auto_16322 ) ) ( not ( = ?auto_16284 ?auto_16291 ) ) ( not ( = ?auto_16284 ?auto_16322 ) ) ( not ( = ?auto_16285 ?auto_16291 ) ) ( not ( = ?auto_16285 ?auto_16322 ) ) ( not ( = ?auto_16286 ?auto_16291 ) ) ( not ( = ?auto_16286 ?auto_16322 ) ) ( not ( = ?auto_16289 ?auto_16291 ) ) ( not ( = ?auto_16289 ?auto_16322 ) ) ( not ( = ?auto_16291 ?auto_16318 ) ) ( not ( = ?auto_16291 ?auto_16310 ) ) ( not ( = ?auto_16291 ?auto_16323 ) ) ( not ( = ?auto_16291 ?auto_16311 ) ) ( not ( = ?auto_16291 ?auto_16316 ) ) ( not ( = ?auto_16291 ?auto_16320 ) ) ( not ( = ?auto_16322 ?auto_16318 ) ) ( not ( = ?auto_16322 ?auto_16310 ) ) ( not ( = ?auto_16322 ?auto_16323 ) ) ( not ( = ?auto_16322 ?auto_16311 ) ) ( not ( = ?auto_16322 ?auto_16316 ) ) ( not ( = ?auto_16322 ?auto_16320 ) ) ( not ( = ?auto_16282 ?auto_16290 ) ) ( not ( = ?auto_16282 ?auto_16305 ) ) ( not ( = ?auto_16283 ?auto_16290 ) ) ( not ( = ?auto_16283 ?auto_16305 ) ) ( not ( = ?auto_16284 ?auto_16290 ) ) ( not ( = ?auto_16284 ?auto_16305 ) ) ( not ( = ?auto_16285 ?auto_16290 ) ) ( not ( = ?auto_16285 ?auto_16305 ) ) ( not ( = ?auto_16286 ?auto_16290 ) ) ( not ( = ?auto_16286 ?auto_16305 ) ) ( not ( = ?auto_16289 ?auto_16290 ) ) ( not ( = ?auto_16289 ?auto_16305 ) ) ( not ( = ?auto_16287 ?auto_16290 ) ) ( not ( = ?auto_16287 ?auto_16305 ) ) ( not ( = ?auto_16290 ?auto_16322 ) ) ( not ( = ?auto_16290 ?auto_16318 ) ) ( not ( = ?auto_16290 ?auto_16310 ) ) ( not ( = ?auto_16290 ?auto_16323 ) ) ( not ( = ?auto_16290 ?auto_16311 ) ) ( not ( = ?auto_16290 ?auto_16316 ) ) ( not ( = ?auto_16290 ?auto_16320 ) ) ( not ( = ?auto_16305 ?auto_16322 ) ) ( not ( = ?auto_16305 ?auto_16318 ) ) ( not ( = ?auto_16305 ?auto_16310 ) ) ( not ( = ?auto_16305 ?auto_16323 ) ) ( not ( = ?auto_16305 ?auto_16311 ) ) ( not ( = ?auto_16305 ?auto_16316 ) ) ( not ( = ?auto_16305 ?auto_16320 ) ) ( not ( = ?auto_16282 ?auto_16288 ) ) ( not ( = ?auto_16282 ?auto_16314 ) ) ( not ( = ?auto_16283 ?auto_16288 ) ) ( not ( = ?auto_16283 ?auto_16314 ) ) ( not ( = ?auto_16284 ?auto_16288 ) ) ( not ( = ?auto_16284 ?auto_16314 ) ) ( not ( = ?auto_16285 ?auto_16288 ) ) ( not ( = ?auto_16285 ?auto_16314 ) ) ( not ( = ?auto_16286 ?auto_16288 ) ) ( not ( = ?auto_16286 ?auto_16314 ) ) ( not ( = ?auto_16289 ?auto_16288 ) ) ( not ( = ?auto_16289 ?auto_16314 ) ) ( not ( = ?auto_16287 ?auto_16288 ) ) ( not ( = ?auto_16287 ?auto_16314 ) ) ( not ( = ?auto_16291 ?auto_16288 ) ) ( not ( = ?auto_16291 ?auto_16314 ) ) ( not ( = ?auto_16288 ?auto_16305 ) ) ( not ( = ?auto_16288 ?auto_16322 ) ) ( not ( = ?auto_16288 ?auto_16318 ) ) ( not ( = ?auto_16288 ?auto_16310 ) ) ( not ( = ?auto_16288 ?auto_16323 ) ) ( not ( = ?auto_16288 ?auto_16311 ) ) ( not ( = ?auto_16288 ?auto_16316 ) ) ( not ( = ?auto_16288 ?auto_16320 ) ) ( not ( = ?auto_16314 ?auto_16305 ) ) ( not ( = ?auto_16314 ?auto_16322 ) ) ( not ( = ?auto_16314 ?auto_16318 ) ) ( not ( = ?auto_16314 ?auto_16310 ) ) ( not ( = ?auto_16314 ?auto_16323 ) ) ( not ( = ?auto_16314 ?auto_16311 ) ) ( not ( = ?auto_16314 ?auto_16316 ) ) ( not ( = ?auto_16314 ?auto_16320 ) ) ( not ( = ?auto_16282 ?auto_16293 ) ) ( not ( = ?auto_16282 ?auto_16324 ) ) ( not ( = ?auto_16283 ?auto_16293 ) ) ( not ( = ?auto_16283 ?auto_16324 ) ) ( not ( = ?auto_16284 ?auto_16293 ) ) ( not ( = ?auto_16284 ?auto_16324 ) ) ( not ( = ?auto_16285 ?auto_16293 ) ) ( not ( = ?auto_16285 ?auto_16324 ) ) ( not ( = ?auto_16286 ?auto_16293 ) ) ( not ( = ?auto_16286 ?auto_16324 ) ) ( not ( = ?auto_16289 ?auto_16293 ) ) ( not ( = ?auto_16289 ?auto_16324 ) ) ( not ( = ?auto_16287 ?auto_16293 ) ) ( not ( = ?auto_16287 ?auto_16324 ) ) ( not ( = ?auto_16291 ?auto_16293 ) ) ( not ( = ?auto_16291 ?auto_16324 ) ) ( not ( = ?auto_16290 ?auto_16293 ) ) ( not ( = ?auto_16290 ?auto_16324 ) ) ( not ( = ?auto_16293 ?auto_16314 ) ) ( not ( = ?auto_16293 ?auto_16305 ) ) ( not ( = ?auto_16293 ?auto_16322 ) ) ( not ( = ?auto_16293 ?auto_16318 ) ) ( not ( = ?auto_16293 ?auto_16310 ) ) ( not ( = ?auto_16293 ?auto_16323 ) ) ( not ( = ?auto_16293 ?auto_16311 ) ) ( not ( = ?auto_16293 ?auto_16316 ) ) ( not ( = ?auto_16293 ?auto_16320 ) ) ( not ( = ?auto_16313 ?auto_16319 ) ) ( not ( = ?auto_16313 ?auto_16326 ) ) ( not ( = ?auto_16313 ?auto_16312 ) ) ( not ( = ?auto_16313 ?auto_16327 ) ) ( not ( = ?auto_16313 ?auto_16303 ) ) ( not ( = ?auto_16313 ?auto_16309 ) ) ( not ( = ?auto_16325 ?auto_16304 ) ) ( not ( = ?auto_16325 ?auto_16301 ) ) ( not ( = ?auto_16325 ?auto_16321 ) ) ( not ( = ?auto_16325 ?auto_16315 ) ) ( not ( = ?auto_16325 ?auto_16302 ) ) ( not ( = ?auto_16325 ?auto_16306 ) ) ( not ( = ?auto_16324 ?auto_16314 ) ) ( not ( = ?auto_16324 ?auto_16305 ) ) ( not ( = ?auto_16324 ?auto_16322 ) ) ( not ( = ?auto_16324 ?auto_16318 ) ) ( not ( = ?auto_16324 ?auto_16310 ) ) ( not ( = ?auto_16324 ?auto_16323 ) ) ( not ( = ?auto_16324 ?auto_16311 ) ) ( not ( = ?auto_16324 ?auto_16316 ) ) ( not ( = ?auto_16324 ?auto_16320 ) ) ( not ( = ?auto_16282 ?auto_16292 ) ) ( not ( = ?auto_16282 ?auto_16317 ) ) ( not ( = ?auto_16283 ?auto_16292 ) ) ( not ( = ?auto_16283 ?auto_16317 ) ) ( not ( = ?auto_16284 ?auto_16292 ) ) ( not ( = ?auto_16284 ?auto_16317 ) ) ( not ( = ?auto_16285 ?auto_16292 ) ) ( not ( = ?auto_16285 ?auto_16317 ) ) ( not ( = ?auto_16286 ?auto_16292 ) ) ( not ( = ?auto_16286 ?auto_16317 ) ) ( not ( = ?auto_16289 ?auto_16292 ) ) ( not ( = ?auto_16289 ?auto_16317 ) ) ( not ( = ?auto_16287 ?auto_16292 ) ) ( not ( = ?auto_16287 ?auto_16317 ) ) ( not ( = ?auto_16291 ?auto_16292 ) ) ( not ( = ?auto_16291 ?auto_16317 ) ) ( not ( = ?auto_16290 ?auto_16292 ) ) ( not ( = ?auto_16290 ?auto_16317 ) ) ( not ( = ?auto_16288 ?auto_16292 ) ) ( not ( = ?auto_16288 ?auto_16317 ) ) ( not ( = ?auto_16292 ?auto_16324 ) ) ( not ( = ?auto_16292 ?auto_16314 ) ) ( not ( = ?auto_16292 ?auto_16305 ) ) ( not ( = ?auto_16292 ?auto_16322 ) ) ( not ( = ?auto_16292 ?auto_16318 ) ) ( not ( = ?auto_16292 ?auto_16310 ) ) ( not ( = ?auto_16292 ?auto_16323 ) ) ( not ( = ?auto_16292 ?auto_16311 ) ) ( not ( = ?auto_16292 ?auto_16316 ) ) ( not ( = ?auto_16292 ?auto_16320 ) ) ( not ( = ?auto_16307 ?auto_16313 ) ) ( not ( = ?auto_16307 ?auto_16319 ) ) ( not ( = ?auto_16307 ?auto_16326 ) ) ( not ( = ?auto_16307 ?auto_16312 ) ) ( not ( = ?auto_16307 ?auto_16327 ) ) ( not ( = ?auto_16307 ?auto_16303 ) ) ( not ( = ?auto_16307 ?auto_16309 ) ) ( not ( = ?auto_16308 ?auto_16325 ) ) ( not ( = ?auto_16308 ?auto_16304 ) ) ( not ( = ?auto_16308 ?auto_16301 ) ) ( not ( = ?auto_16308 ?auto_16321 ) ) ( not ( = ?auto_16308 ?auto_16315 ) ) ( not ( = ?auto_16308 ?auto_16302 ) ) ( not ( = ?auto_16308 ?auto_16306 ) ) ( not ( = ?auto_16317 ?auto_16324 ) ) ( not ( = ?auto_16317 ?auto_16314 ) ) ( not ( = ?auto_16317 ?auto_16305 ) ) ( not ( = ?auto_16317 ?auto_16322 ) ) ( not ( = ?auto_16317 ?auto_16318 ) ) ( not ( = ?auto_16317 ?auto_16310 ) ) ( not ( = ?auto_16317 ?auto_16323 ) ) ( not ( = ?auto_16317 ?auto_16311 ) ) ( not ( = ?auto_16317 ?auto_16316 ) ) ( not ( = ?auto_16317 ?auto_16320 ) ) ( not ( = ?auto_16282 ?auto_16294 ) ) ( not ( = ?auto_16282 ?auto_16298 ) ) ( not ( = ?auto_16283 ?auto_16294 ) ) ( not ( = ?auto_16283 ?auto_16298 ) ) ( not ( = ?auto_16284 ?auto_16294 ) ) ( not ( = ?auto_16284 ?auto_16298 ) ) ( not ( = ?auto_16285 ?auto_16294 ) ) ( not ( = ?auto_16285 ?auto_16298 ) ) ( not ( = ?auto_16286 ?auto_16294 ) ) ( not ( = ?auto_16286 ?auto_16298 ) ) ( not ( = ?auto_16289 ?auto_16294 ) ) ( not ( = ?auto_16289 ?auto_16298 ) ) ( not ( = ?auto_16287 ?auto_16294 ) ) ( not ( = ?auto_16287 ?auto_16298 ) ) ( not ( = ?auto_16291 ?auto_16294 ) ) ( not ( = ?auto_16291 ?auto_16298 ) ) ( not ( = ?auto_16290 ?auto_16294 ) ) ( not ( = ?auto_16290 ?auto_16298 ) ) ( not ( = ?auto_16288 ?auto_16294 ) ) ( not ( = ?auto_16288 ?auto_16298 ) ) ( not ( = ?auto_16293 ?auto_16294 ) ) ( not ( = ?auto_16293 ?auto_16298 ) ) ( not ( = ?auto_16294 ?auto_16317 ) ) ( not ( = ?auto_16294 ?auto_16324 ) ) ( not ( = ?auto_16294 ?auto_16314 ) ) ( not ( = ?auto_16294 ?auto_16305 ) ) ( not ( = ?auto_16294 ?auto_16322 ) ) ( not ( = ?auto_16294 ?auto_16318 ) ) ( not ( = ?auto_16294 ?auto_16310 ) ) ( not ( = ?auto_16294 ?auto_16323 ) ) ( not ( = ?auto_16294 ?auto_16311 ) ) ( not ( = ?auto_16294 ?auto_16316 ) ) ( not ( = ?auto_16294 ?auto_16320 ) ) ( not ( = ?auto_16299 ?auto_16307 ) ) ( not ( = ?auto_16299 ?auto_16313 ) ) ( not ( = ?auto_16299 ?auto_16319 ) ) ( not ( = ?auto_16299 ?auto_16326 ) ) ( not ( = ?auto_16299 ?auto_16312 ) ) ( not ( = ?auto_16299 ?auto_16327 ) ) ( not ( = ?auto_16299 ?auto_16303 ) ) ( not ( = ?auto_16299 ?auto_16309 ) ) ( not ( = ?auto_16295 ?auto_16308 ) ) ( not ( = ?auto_16295 ?auto_16325 ) ) ( not ( = ?auto_16295 ?auto_16304 ) ) ( not ( = ?auto_16295 ?auto_16301 ) ) ( not ( = ?auto_16295 ?auto_16321 ) ) ( not ( = ?auto_16295 ?auto_16315 ) ) ( not ( = ?auto_16295 ?auto_16302 ) ) ( not ( = ?auto_16295 ?auto_16306 ) ) ( not ( = ?auto_16298 ?auto_16317 ) ) ( not ( = ?auto_16298 ?auto_16324 ) ) ( not ( = ?auto_16298 ?auto_16314 ) ) ( not ( = ?auto_16298 ?auto_16305 ) ) ( not ( = ?auto_16298 ?auto_16322 ) ) ( not ( = ?auto_16298 ?auto_16318 ) ) ( not ( = ?auto_16298 ?auto_16310 ) ) ( not ( = ?auto_16298 ?auto_16323 ) ) ( not ( = ?auto_16298 ?auto_16311 ) ) ( not ( = ?auto_16298 ?auto_16316 ) ) ( not ( = ?auto_16298 ?auto_16320 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_16282 ?auto_16283 ?auto_16284 ?auto_16285 ?auto_16286 ?auto_16289 ?auto_16287 ?auto_16291 ?auto_16290 ?auto_16288 ?auto_16293 ?auto_16292 )
      ( MAKE-1CRATE ?auto_16292 ?auto_16294 )
      ( MAKE-12CRATE-VERIFY ?auto_16282 ?auto_16283 ?auto_16284 ?auto_16285 ?auto_16286 ?auto_16289 ?auto_16287 ?auto_16291 ?auto_16290 ?auto_16288 ?auto_16293 ?auto_16292 ?auto_16294 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16330 - SURFACE
      ?auto_16331 - SURFACE
    )
    :vars
    (
      ?auto_16332 - HOIST
      ?auto_16333 - PLACE
      ?auto_16335 - PLACE
      ?auto_16336 - HOIST
      ?auto_16337 - SURFACE
      ?auto_16334 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16332 ?auto_16333 ) ( SURFACE-AT ?auto_16330 ?auto_16333 ) ( CLEAR ?auto_16330 ) ( IS-CRATE ?auto_16331 ) ( AVAILABLE ?auto_16332 ) ( not ( = ?auto_16335 ?auto_16333 ) ) ( HOIST-AT ?auto_16336 ?auto_16335 ) ( AVAILABLE ?auto_16336 ) ( SURFACE-AT ?auto_16331 ?auto_16335 ) ( ON ?auto_16331 ?auto_16337 ) ( CLEAR ?auto_16331 ) ( TRUCK-AT ?auto_16334 ?auto_16333 ) ( not ( = ?auto_16330 ?auto_16331 ) ) ( not ( = ?auto_16330 ?auto_16337 ) ) ( not ( = ?auto_16331 ?auto_16337 ) ) ( not ( = ?auto_16332 ?auto_16336 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16334 ?auto_16333 ?auto_16335 )
      ( !LIFT ?auto_16336 ?auto_16331 ?auto_16337 ?auto_16335 )
      ( !LOAD ?auto_16336 ?auto_16331 ?auto_16334 ?auto_16335 )
      ( !DRIVE ?auto_16334 ?auto_16335 ?auto_16333 )
      ( !UNLOAD ?auto_16332 ?auto_16331 ?auto_16334 ?auto_16333 )
      ( !DROP ?auto_16332 ?auto_16331 ?auto_16330 ?auto_16333 )
      ( MAKE-1CRATE-VERIFY ?auto_16330 ?auto_16331 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_16352 - SURFACE
      ?auto_16353 - SURFACE
      ?auto_16354 - SURFACE
      ?auto_16355 - SURFACE
      ?auto_16356 - SURFACE
      ?auto_16359 - SURFACE
      ?auto_16357 - SURFACE
      ?auto_16361 - SURFACE
      ?auto_16360 - SURFACE
      ?auto_16358 - SURFACE
      ?auto_16363 - SURFACE
      ?auto_16362 - SURFACE
      ?auto_16364 - SURFACE
      ?auto_16365 - SURFACE
    )
    :vars
    (
      ?auto_16368 - HOIST
      ?auto_16370 - PLACE
      ?auto_16367 - PLACE
      ?auto_16369 - HOIST
      ?auto_16371 - SURFACE
      ?auto_16389 - PLACE
      ?auto_16398 - HOIST
      ?auto_16380 - SURFACE
      ?auto_16399 - PLACE
      ?auto_16390 - HOIST
      ?auto_16391 - SURFACE
      ?auto_16396 - PLACE
      ?auto_16377 - HOIST
      ?auto_16401 - SURFACE
      ?auto_16395 - PLACE
      ?auto_16375 - HOIST
      ?auto_16378 - SURFACE
      ?auto_16400 - SURFACE
      ?auto_16394 - SURFACE
      ?auto_16379 - PLACE
      ?auto_16376 - HOIST
      ?auto_16392 - SURFACE
      ?auto_16381 - PLACE
      ?auto_16382 - HOIST
      ?auto_16372 - SURFACE
      ?auto_16386 - PLACE
      ?auto_16387 - HOIST
      ?auto_16393 - SURFACE
      ?auto_16373 - PLACE
      ?auto_16385 - HOIST
      ?auto_16397 - SURFACE
      ?auto_16384 - SURFACE
      ?auto_16383 - PLACE
      ?auto_16374 - HOIST
      ?auto_16388 - SURFACE
      ?auto_16366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16368 ?auto_16370 ) ( IS-CRATE ?auto_16365 ) ( not ( = ?auto_16367 ?auto_16370 ) ) ( HOIST-AT ?auto_16369 ?auto_16367 ) ( AVAILABLE ?auto_16369 ) ( SURFACE-AT ?auto_16365 ?auto_16367 ) ( ON ?auto_16365 ?auto_16371 ) ( CLEAR ?auto_16365 ) ( not ( = ?auto_16364 ?auto_16365 ) ) ( not ( = ?auto_16364 ?auto_16371 ) ) ( not ( = ?auto_16365 ?auto_16371 ) ) ( not ( = ?auto_16368 ?auto_16369 ) ) ( IS-CRATE ?auto_16364 ) ( not ( = ?auto_16389 ?auto_16370 ) ) ( HOIST-AT ?auto_16398 ?auto_16389 ) ( AVAILABLE ?auto_16398 ) ( SURFACE-AT ?auto_16364 ?auto_16389 ) ( ON ?auto_16364 ?auto_16380 ) ( CLEAR ?auto_16364 ) ( not ( = ?auto_16362 ?auto_16364 ) ) ( not ( = ?auto_16362 ?auto_16380 ) ) ( not ( = ?auto_16364 ?auto_16380 ) ) ( not ( = ?auto_16368 ?auto_16398 ) ) ( IS-CRATE ?auto_16362 ) ( not ( = ?auto_16399 ?auto_16370 ) ) ( HOIST-AT ?auto_16390 ?auto_16399 ) ( AVAILABLE ?auto_16390 ) ( SURFACE-AT ?auto_16362 ?auto_16399 ) ( ON ?auto_16362 ?auto_16391 ) ( CLEAR ?auto_16362 ) ( not ( = ?auto_16363 ?auto_16362 ) ) ( not ( = ?auto_16363 ?auto_16391 ) ) ( not ( = ?auto_16362 ?auto_16391 ) ) ( not ( = ?auto_16368 ?auto_16390 ) ) ( IS-CRATE ?auto_16363 ) ( not ( = ?auto_16396 ?auto_16370 ) ) ( HOIST-AT ?auto_16377 ?auto_16396 ) ( AVAILABLE ?auto_16377 ) ( SURFACE-AT ?auto_16363 ?auto_16396 ) ( ON ?auto_16363 ?auto_16401 ) ( CLEAR ?auto_16363 ) ( not ( = ?auto_16358 ?auto_16363 ) ) ( not ( = ?auto_16358 ?auto_16401 ) ) ( not ( = ?auto_16363 ?auto_16401 ) ) ( not ( = ?auto_16368 ?auto_16377 ) ) ( IS-CRATE ?auto_16358 ) ( not ( = ?auto_16395 ?auto_16370 ) ) ( HOIST-AT ?auto_16375 ?auto_16395 ) ( SURFACE-AT ?auto_16358 ?auto_16395 ) ( ON ?auto_16358 ?auto_16378 ) ( CLEAR ?auto_16358 ) ( not ( = ?auto_16360 ?auto_16358 ) ) ( not ( = ?auto_16360 ?auto_16378 ) ) ( not ( = ?auto_16358 ?auto_16378 ) ) ( not ( = ?auto_16368 ?auto_16375 ) ) ( IS-CRATE ?auto_16360 ) ( SURFACE-AT ?auto_16360 ?auto_16395 ) ( ON ?auto_16360 ?auto_16400 ) ( CLEAR ?auto_16360 ) ( not ( = ?auto_16361 ?auto_16360 ) ) ( not ( = ?auto_16361 ?auto_16400 ) ) ( not ( = ?auto_16360 ?auto_16400 ) ) ( IS-CRATE ?auto_16361 ) ( SURFACE-AT ?auto_16361 ?auto_16395 ) ( ON ?auto_16361 ?auto_16394 ) ( CLEAR ?auto_16361 ) ( not ( = ?auto_16357 ?auto_16361 ) ) ( not ( = ?auto_16357 ?auto_16394 ) ) ( not ( = ?auto_16361 ?auto_16394 ) ) ( IS-CRATE ?auto_16357 ) ( not ( = ?auto_16379 ?auto_16370 ) ) ( HOIST-AT ?auto_16376 ?auto_16379 ) ( AVAILABLE ?auto_16376 ) ( SURFACE-AT ?auto_16357 ?auto_16379 ) ( ON ?auto_16357 ?auto_16392 ) ( CLEAR ?auto_16357 ) ( not ( = ?auto_16359 ?auto_16357 ) ) ( not ( = ?auto_16359 ?auto_16392 ) ) ( not ( = ?auto_16357 ?auto_16392 ) ) ( not ( = ?auto_16368 ?auto_16376 ) ) ( IS-CRATE ?auto_16359 ) ( not ( = ?auto_16381 ?auto_16370 ) ) ( HOIST-AT ?auto_16382 ?auto_16381 ) ( AVAILABLE ?auto_16382 ) ( SURFACE-AT ?auto_16359 ?auto_16381 ) ( ON ?auto_16359 ?auto_16372 ) ( CLEAR ?auto_16359 ) ( not ( = ?auto_16356 ?auto_16359 ) ) ( not ( = ?auto_16356 ?auto_16372 ) ) ( not ( = ?auto_16359 ?auto_16372 ) ) ( not ( = ?auto_16368 ?auto_16382 ) ) ( IS-CRATE ?auto_16356 ) ( not ( = ?auto_16386 ?auto_16370 ) ) ( HOIST-AT ?auto_16387 ?auto_16386 ) ( AVAILABLE ?auto_16387 ) ( SURFACE-AT ?auto_16356 ?auto_16386 ) ( ON ?auto_16356 ?auto_16393 ) ( CLEAR ?auto_16356 ) ( not ( = ?auto_16355 ?auto_16356 ) ) ( not ( = ?auto_16355 ?auto_16393 ) ) ( not ( = ?auto_16356 ?auto_16393 ) ) ( not ( = ?auto_16368 ?auto_16387 ) ) ( IS-CRATE ?auto_16355 ) ( not ( = ?auto_16373 ?auto_16370 ) ) ( HOIST-AT ?auto_16385 ?auto_16373 ) ( AVAILABLE ?auto_16385 ) ( SURFACE-AT ?auto_16355 ?auto_16373 ) ( ON ?auto_16355 ?auto_16397 ) ( CLEAR ?auto_16355 ) ( not ( = ?auto_16354 ?auto_16355 ) ) ( not ( = ?auto_16354 ?auto_16397 ) ) ( not ( = ?auto_16355 ?auto_16397 ) ) ( not ( = ?auto_16368 ?auto_16385 ) ) ( IS-CRATE ?auto_16354 ) ( AVAILABLE ?auto_16375 ) ( SURFACE-AT ?auto_16354 ?auto_16395 ) ( ON ?auto_16354 ?auto_16384 ) ( CLEAR ?auto_16354 ) ( not ( = ?auto_16353 ?auto_16354 ) ) ( not ( = ?auto_16353 ?auto_16384 ) ) ( not ( = ?auto_16354 ?auto_16384 ) ) ( SURFACE-AT ?auto_16352 ?auto_16370 ) ( CLEAR ?auto_16352 ) ( IS-CRATE ?auto_16353 ) ( AVAILABLE ?auto_16368 ) ( not ( = ?auto_16383 ?auto_16370 ) ) ( HOIST-AT ?auto_16374 ?auto_16383 ) ( AVAILABLE ?auto_16374 ) ( SURFACE-AT ?auto_16353 ?auto_16383 ) ( ON ?auto_16353 ?auto_16388 ) ( CLEAR ?auto_16353 ) ( TRUCK-AT ?auto_16366 ?auto_16370 ) ( not ( = ?auto_16352 ?auto_16353 ) ) ( not ( = ?auto_16352 ?auto_16388 ) ) ( not ( = ?auto_16353 ?auto_16388 ) ) ( not ( = ?auto_16368 ?auto_16374 ) ) ( not ( = ?auto_16352 ?auto_16354 ) ) ( not ( = ?auto_16352 ?auto_16384 ) ) ( not ( = ?auto_16354 ?auto_16388 ) ) ( not ( = ?auto_16395 ?auto_16383 ) ) ( not ( = ?auto_16375 ?auto_16374 ) ) ( not ( = ?auto_16384 ?auto_16388 ) ) ( not ( = ?auto_16352 ?auto_16355 ) ) ( not ( = ?auto_16352 ?auto_16397 ) ) ( not ( = ?auto_16353 ?auto_16355 ) ) ( not ( = ?auto_16353 ?auto_16397 ) ) ( not ( = ?auto_16355 ?auto_16384 ) ) ( not ( = ?auto_16355 ?auto_16388 ) ) ( not ( = ?auto_16373 ?auto_16395 ) ) ( not ( = ?auto_16373 ?auto_16383 ) ) ( not ( = ?auto_16385 ?auto_16375 ) ) ( not ( = ?auto_16385 ?auto_16374 ) ) ( not ( = ?auto_16397 ?auto_16384 ) ) ( not ( = ?auto_16397 ?auto_16388 ) ) ( not ( = ?auto_16352 ?auto_16356 ) ) ( not ( = ?auto_16352 ?auto_16393 ) ) ( not ( = ?auto_16353 ?auto_16356 ) ) ( not ( = ?auto_16353 ?auto_16393 ) ) ( not ( = ?auto_16354 ?auto_16356 ) ) ( not ( = ?auto_16354 ?auto_16393 ) ) ( not ( = ?auto_16356 ?auto_16397 ) ) ( not ( = ?auto_16356 ?auto_16384 ) ) ( not ( = ?auto_16356 ?auto_16388 ) ) ( not ( = ?auto_16386 ?auto_16373 ) ) ( not ( = ?auto_16386 ?auto_16395 ) ) ( not ( = ?auto_16386 ?auto_16383 ) ) ( not ( = ?auto_16387 ?auto_16385 ) ) ( not ( = ?auto_16387 ?auto_16375 ) ) ( not ( = ?auto_16387 ?auto_16374 ) ) ( not ( = ?auto_16393 ?auto_16397 ) ) ( not ( = ?auto_16393 ?auto_16384 ) ) ( not ( = ?auto_16393 ?auto_16388 ) ) ( not ( = ?auto_16352 ?auto_16359 ) ) ( not ( = ?auto_16352 ?auto_16372 ) ) ( not ( = ?auto_16353 ?auto_16359 ) ) ( not ( = ?auto_16353 ?auto_16372 ) ) ( not ( = ?auto_16354 ?auto_16359 ) ) ( not ( = ?auto_16354 ?auto_16372 ) ) ( not ( = ?auto_16355 ?auto_16359 ) ) ( not ( = ?auto_16355 ?auto_16372 ) ) ( not ( = ?auto_16359 ?auto_16393 ) ) ( not ( = ?auto_16359 ?auto_16397 ) ) ( not ( = ?auto_16359 ?auto_16384 ) ) ( not ( = ?auto_16359 ?auto_16388 ) ) ( not ( = ?auto_16381 ?auto_16386 ) ) ( not ( = ?auto_16381 ?auto_16373 ) ) ( not ( = ?auto_16381 ?auto_16395 ) ) ( not ( = ?auto_16381 ?auto_16383 ) ) ( not ( = ?auto_16382 ?auto_16387 ) ) ( not ( = ?auto_16382 ?auto_16385 ) ) ( not ( = ?auto_16382 ?auto_16375 ) ) ( not ( = ?auto_16382 ?auto_16374 ) ) ( not ( = ?auto_16372 ?auto_16393 ) ) ( not ( = ?auto_16372 ?auto_16397 ) ) ( not ( = ?auto_16372 ?auto_16384 ) ) ( not ( = ?auto_16372 ?auto_16388 ) ) ( not ( = ?auto_16352 ?auto_16357 ) ) ( not ( = ?auto_16352 ?auto_16392 ) ) ( not ( = ?auto_16353 ?auto_16357 ) ) ( not ( = ?auto_16353 ?auto_16392 ) ) ( not ( = ?auto_16354 ?auto_16357 ) ) ( not ( = ?auto_16354 ?auto_16392 ) ) ( not ( = ?auto_16355 ?auto_16357 ) ) ( not ( = ?auto_16355 ?auto_16392 ) ) ( not ( = ?auto_16356 ?auto_16357 ) ) ( not ( = ?auto_16356 ?auto_16392 ) ) ( not ( = ?auto_16357 ?auto_16372 ) ) ( not ( = ?auto_16357 ?auto_16393 ) ) ( not ( = ?auto_16357 ?auto_16397 ) ) ( not ( = ?auto_16357 ?auto_16384 ) ) ( not ( = ?auto_16357 ?auto_16388 ) ) ( not ( = ?auto_16379 ?auto_16381 ) ) ( not ( = ?auto_16379 ?auto_16386 ) ) ( not ( = ?auto_16379 ?auto_16373 ) ) ( not ( = ?auto_16379 ?auto_16395 ) ) ( not ( = ?auto_16379 ?auto_16383 ) ) ( not ( = ?auto_16376 ?auto_16382 ) ) ( not ( = ?auto_16376 ?auto_16387 ) ) ( not ( = ?auto_16376 ?auto_16385 ) ) ( not ( = ?auto_16376 ?auto_16375 ) ) ( not ( = ?auto_16376 ?auto_16374 ) ) ( not ( = ?auto_16392 ?auto_16372 ) ) ( not ( = ?auto_16392 ?auto_16393 ) ) ( not ( = ?auto_16392 ?auto_16397 ) ) ( not ( = ?auto_16392 ?auto_16384 ) ) ( not ( = ?auto_16392 ?auto_16388 ) ) ( not ( = ?auto_16352 ?auto_16361 ) ) ( not ( = ?auto_16352 ?auto_16394 ) ) ( not ( = ?auto_16353 ?auto_16361 ) ) ( not ( = ?auto_16353 ?auto_16394 ) ) ( not ( = ?auto_16354 ?auto_16361 ) ) ( not ( = ?auto_16354 ?auto_16394 ) ) ( not ( = ?auto_16355 ?auto_16361 ) ) ( not ( = ?auto_16355 ?auto_16394 ) ) ( not ( = ?auto_16356 ?auto_16361 ) ) ( not ( = ?auto_16356 ?auto_16394 ) ) ( not ( = ?auto_16359 ?auto_16361 ) ) ( not ( = ?auto_16359 ?auto_16394 ) ) ( not ( = ?auto_16361 ?auto_16392 ) ) ( not ( = ?auto_16361 ?auto_16372 ) ) ( not ( = ?auto_16361 ?auto_16393 ) ) ( not ( = ?auto_16361 ?auto_16397 ) ) ( not ( = ?auto_16361 ?auto_16384 ) ) ( not ( = ?auto_16361 ?auto_16388 ) ) ( not ( = ?auto_16394 ?auto_16392 ) ) ( not ( = ?auto_16394 ?auto_16372 ) ) ( not ( = ?auto_16394 ?auto_16393 ) ) ( not ( = ?auto_16394 ?auto_16397 ) ) ( not ( = ?auto_16394 ?auto_16384 ) ) ( not ( = ?auto_16394 ?auto_16388 ) ) ( not ( = ?auto_16352 ?auto_16360 ) ) ( not ( = ?auto_16352 ?auto_16400 ) ) ( not ( = ?auto_16353 ?auto_16360 ) ) ( not ( = ?auto_16353 ?auto_16400 ) ) ( not ( = ?auto_16354 ?auto_16360 ) ) ( not ( = ?auto_16354 ?auto_16400 ) ) ( not ( = ?auto_16355 ?auto_16360 ) ) ( not ( = ?auto_16355 ?auto_16400 ) ) ( not ( = ?auto_16356 ?auto_16360 ) ) ( not ( = ?auto_16356 ?auto_16400 ) ) ( not ( = ?auto_16359 ?auto_16360 ) ) ( not ( = ?auto_16359 ?auto_16400 ) ) ( not ( = ?auto_16357 ?auto_16360 ) ) ( not ( = ?auto_16357 ?auto_16400 ) ) ( not ( = ?auto_16360 ?auto_16394 ) ) ( not ( = ?auto_16360 ?auto_16392 ) ) ( not ( = ?auto_16360 ?auto_16372 ) ) ( not ( = ?auto_16360 ?auto_16393 ) ) ( not ( = ?auto_16360 ?auto_16397 ) ) ( not ( = ?auto_16360 ?auto_16384 ) ) ( not ( = ?auto_16360 ?auto_16388 ) ) ( not ( = ?auto_16400 ?auto_16394 ) ) ( not ( = ?auto_16400 ?auto_16392 ) ) ( not ( = ?auto_16400 ?auto_16372 ) ) ( not ( = ?auto_16400 ?auto_16393 ) ) ( not ( = ?auto_16400 ?auto_16397 ) ) ( not ( = ?auto_16400 ?auto_16384 ) ) ( not ( = ?auto_16400 ?auto_16388 ) ) ( not ( = ?auto_16352 ?auto_16358 ) ) ( not ( = ?auto_16352 ?auto_16378 ) ) ( not ( = ?auto_16353 ?auto_16358 ) ) ( not ( = ?auto_16353 ?auto_16378 ) ) ( not ( = ?auto_16354 ?auto_16358 ) ) ( not ( = ?auto_16354 ?auto_16378 ) ) ( not ( = ?auto_16355 ?auto_16358 ) ) ( not ( = ?auto_16355 ?auto_16378 ) ) ( not ( = ?auto_16356 ?auto_16358 ) ) ( not ( = ?auto_16356 ?auto_16378 ) ) ( not ( = ?auto_16359 ?auto_16358 ) ) ( not ( = ?auto_16359 ?auto_16378 ) ) ( not ( = ?auto_16357 ?auto_16358 ) ) ( not ( = ?auto_16357 ?auto_16378 ) ) ( not ( = ?auto_16361 ?auto_16358 ) ) ( not ( = ?auto_16361 ?auto_16378 ) ) ( not ( = ?auto_16358 ?auto_16400 ) ) ( not ( = ?auto_16358 ?auto_16394 ) ) ( not ( = ?auto_16358 ?auto_16392 ) ) ( not ( = ?auto_16358 ?auto_16372 ) ) ( not ( = ?auto_16358 ?auto_16393 ) ) ( not ( = ?auto_16358 ?auto_16397 ) ) ( not ( = ?auto_16358 ?auto_16384 ) ) ( not ( = ?auto_16358 ?auto_16388 ) ) ( not ( = ?auto_16378 ?auto_16400 ) ) ( not ( = ?auto_16378 ?auto_16394 ) ) ( not ( = ?auto_16378 ?auto_16392 ) ) ( not ( = ?auto_16378 ?auto_16372 ) ) ( not ( = ?auto_16378 ?auto_16393 ) ) ( not ( = ?auto_16378 ?auto_16397 ) ) ( not ( = ?auto_16378 ?auto_16384 ) ) ( not ( = ?auto_16378 ?auto_16388 ) ) ( not ( = ?auto_16352 ?auto_16363 ) ) ( not ( = ?auto_16352 ?auto_16401 ) ) ( not ( = ?auto_16353 ?auto_16363 ) ) ( not ( = ?auto_16353 ?auto_16401 ) ) ( not ( = ?auto_16354 ?auto_16363 ) ) ( not ( = ?auto_16354 ?auto_16401 ) ) ( not ( = ?auto_16355 ?auto_16363 ) ) ( not ( = ?auto_16355 ?auto_16401 ) ) ( not ( = ?auto_16356 ?auto_16363 ) ) ( not ( = ?auto_16356 ?auto_16401 ) ) ( not ( = ?auto_16359 ?auto_16363 ) ) ( not ( = ?auto_16359 ?auto_16401 ) ) ( not ( = ?auto_16357 ?auto_16363 ) ) ( not ( = ?auto_16357 ?auto_16401 ) ) ( not ( = ?auto_16361 ?auto_16363 ) ) ( not ( = ?auto_16361 ?auto_16401 ) ) ( not ( = ?auto_16360 ?auto_16363 ) ) ( not ( = ?auto_16360 ?auto_16401 ) ) ( not ( = ?auto_16363 ?auto_16378 ) ) ( not ( = ?auto_16363 ?auto_16400 ) ) ( not ( = ?auto_16363 ?auto_16394 ) ) ( not ( = ?auto_16363 ?auto_16392 ) ) ( not ( = ?auto_16363 ?auto_16372 ) ) ( not ( = ?auto_16363 ?auto_16393 ) ) ( not ( = ?auto_16363 ?auto_16397 ) ) ( not ( = ?auto_16363 ?auto_16384 ) ) ( not ( = ?auto_16363 ?auto_16388 ) ) ( not ( = ?auto_16396 ?auto_16395 ) ) ( not ( = ?auto_16396 ?auto_16379 ) ) ( not ( = ?auto_16396 ?auto_16381 ) ) ( not ( = ?auto_16396 ?auto_16386 ) ) ( not ( = ?auto_16396 ?auto_16373 ) ) ( not ( = ?auto_16396 ?auto_16383 ) ) ( not ( = ?auto_16377 ?auto_16375 ) ) ( not ( = ?auto_16377 ?auto_16376 ) ) ( not ( = ?auto_16377 ?auto_16382 ) ) ( not ( = ?auto_16377 ?auto_16387 ) ) ( not ( = ?auto_16377 ?auto_16385 ) ) ( not ( = ?auto_16377 ?auto_16374 ) ) ( not ( = ?auto_16401 ?auto_16378 ) ) ( not ( = ?auto_16401 ?auto_16400 ) ) ( not ( = ?auto_16401 ?auto_16394 ) ) ( not ( = ?auto_16401 ?auto_16392 ) ) ( not ( = ?auto_16401 ?auto_16372 ) ) ( not ( = ?auto_16401 ?auto_16393 ) ) ( not ( = ?auto_16401 ?auto_16397 ) ) ( not ( = ?auto_16401 ?auto_16384 ) ) ( not ( = ?auto_16401 ?auto_16388 ) ) ( not ( = ?auto_16352 ?auto_16362 ) ) ( not ( = ?auto_16352 ?auto_16391 ) ) ( not ( = ?auto_16353 ?auto_16362 ) ) ( not ( = ?auto_16353 ?auto_16391 ) ) ( not ( = ?auto_16354 ?auto_16362 ) ) ( not ( = ?auto_16354 ?auto_16391 ) ) ( not ( = ?auto_16355 ?auto_16362 ) ) ( not ( = ?auto_16355 ?auto_16391 ) ) ( not ( = ?auto_16356 ?auto_16362 ) ) ( not ( = ?auto_16356 ?auto_16391 ) ) ( not ( = ?auto_16359 ?auto_16362 ) ) ( not ( = ?auto_16359 ?auto_16391 ) ) ( not ( = ?auto_16357 ?auto_16362 ) ) ( not ( = ?auto_16357 ?auto_16391 ) ) ( not ( = ?auto_16361 ?auto_16362 ) ) ( not ( = ?auto_16361 ?auto_16391 ) ) ( not ( = ?auto_16360 ?auto_16362 ) ) ( not ( = ?auto_16360 ?auto_16391 ) ) ( not ( = ?auto_16358 ?auto_16362 ) ) ( not ( = ?auto_16358 ?auto_16391 ) ) ( not ( = ?auto_16362 ?auto_16401 ) ) ( not ( = ?auto_16362 ?auto_16378 ) ) ( not ( = ?auto_16362 ?auto_16400 ) ) ( not ( = ?auto_16362 ?auto_16394 ) ) ( not ( = ?auto_16362 ?auto_16392 ) ) ( not ( = ?auto_16362 ?auto_16372 ) ) ( not ( = ?auto_16362 ?auto_16393 ) ) ( not ( = ?auto_16362 ?auto_16397 ) ) ( not ( = ?auto_16362 ?auto_16384 ) ) ( not ( = ?auto_16362 ?auto_16388 ) ) ( not ( = ?auto_16399 ?auto_16396 ) ) ( not ( = ?auto_16399 ?auto_16395 ) ) ( not ( = ?auto_16399 ?auto_16379 ) ) ( not ( = ?auto_16399 ?auto_16381 ) ) ( not ( = ?auto_16399 ?auto_16386 ) ) ( not ( = ?auto_16399 ?auto_16373 ) ) ( not ( = ?auto_16399 ?auto_16383 ) ) ( not ( = ?auto_16390 ?auto_16377 ) ) ( not ( = ?auto_16390 ?auto_16375 ) ) ( not ( = ?auto_16390 ?auto_16376 ) ) ( not ( = ?auto_16390 ?auto_16382 ) ) ( not ( = ?auto_16390 ?auto_16387 ) ) ( not ( = ?auto_16390 ?auto_16385 ) ) ( not ( = ?auto_16390 ?auto_16374 ) ) ( not ( = ?auto_16391 ?auto_16401 ) ) ( not ( = ?auto_16391 ?auto_16378 ) ) ( not ( = ?auto_16391 ?auto_16400 ) ) ( not ( = ?auto_16391 ?auto_16394 ) ) ( not ( = ?auto_16391 ?auto_16392 ) ) ( not ( = ?auto_16391 ?auto_16372 ) ) ( not ( = ?auto_16391 ?auto_16393 ) ) ( not ( = ?auto_16391 ?auto_16397 ) ) ( not ( = ?auto_16391 ?auto_16384 ) ) ( not ( = ?auto_16391 ?auto_16388 ) ) ( not ( = ?auto_16352 ?auto_16364 ) ) ( not ( = ?auto_16352 ?auto_16380 ) ) ( not ( = ?auto_16353 ?auto_16364 ) ) ( not ( = ?auto_16353 ?auto_16380 ) ) ( not ( = ?auto_16354 ?auto_16364 ) ) ( not ( = ?auto_16354 ?auto_16380 ) ) ( not ( = ?auto_16355 ?auto_16364 ) ) ( not ( = ?auto_16355 ?auto_16380 ) ) ( not ( = ?auto_16356 ?auto_16364 ) ) ( not ( = ?auto_16356 ?auto_16380 ) ) ( not ( = ?auto_16359 ?auto_16364 ) ) ( not ( = ?auto_16359 ?auto_16380 ) ) ( not ( = ?auto_16357 ?auto_16364 ) ) ( not ( = ?auto_16357 ?auto_16380 ) ) ( not ( = ?auto_16361 ?auto_16364 ) ) ( not ( = ?auto_16361 ?auto_16380 ) ) ( not ( = ?auto_16360 ?auto_16364 ) ) ( not ( = ?auto_16360 ?auto_16380 ) ) ( not ( = ?auto_16358 ?auto_16364 ) ) ( not ( = ?auto_16358 ?auto_16380 ) ) ( not ( = ?auto_16363 ?auto_16364 ) ) ( not ( = ?auto_16363 ?auto_16380 ) ) ( not ( = ?auto_16364 ?auto_16391 ) ) ( not ( = ?auto_16364 ?auto_16401 ) ) ( not ( = ?auto_16364 ?auto_16378 ) ) ( not ( = ?auto_16364 ?auto_16400 ) ) ( not ( = ?auto_16364 ?auto_16394 ) ) ( not ( = ?auto_16364 ?auto_16392 ) ) ( not ( = ?auto_16364 ?auto_16372 ) ) ( not ( = ?auto_16364 ?auto_16393 ) ) ( not ( = ?auto_16364 ?auto_16397 ) ) ( not ( = ?auto_16364 ?auto_16384 ) ) ( not ( = ?auto_16364 ?auto_16388 ) ) ( not ( = ?auto_16389 ?auto_16399 ) ) ( not ( = ?auto_16389 ?auto_16396 ) ) ( not ( = ?auto_16389 ?auto_16395 ) ) ( not ( = ?auto_16389 ?auto_16379 ) ) ( not ( = ?auto_16389 ?auto_16381 ) ) ( not ( = ?auto_16389 ?auto_16386 ) ) ( not ( = ?auto_16389 ?auto_16373 ) ) ( not ( = ?auto_16389 ?auto_16383 ) ) ( not ( = ?auto_16398 ?auto_16390 ) ) ( not ( = ?auto_16398 ?auto_16377 ) ) ( not ( = ?auto_16398 ?auto_16375 ) ) ( not ( = ?auto_16398 ?auto_16376 ) ) ( not ( = ?auto_16398 ?auto_16382 ) ) ( not ( = ?auto_16398 ?auto_16387 ) ) ( not ( = ?auto_16398 ?auto_16385 ) ) ( not ( = ?auto_16398 ?auto_16374 ) ) ( not ( = ?auto_16380 ?auto_16391 ) ) ( not ( = ?auto_16380 ?auto_16401 ) ) ( not ( = ?auto_16380 ?auto_16378 ) ) ( not ( = ?auto_16380 ?auto_16400 ) ) ( not ( = ?auto_16380 ?auto_16394 ) ) ( not ( = ?auto_16380 ?auto_16392 ) ) ( not ( = ?auto_16380 ?auto_16372 ) ) ( not ( = ?auto_16380 ?auto_16393 ) ) ( not ( = ?auto_16380 ?auto_16397 ) ) ( not ( = ?auto_16380 ?auto_16384 ) ) ( not ( = ?auto_16380 ?auto_16388 ) ) ( not ( = ?auto_16352 ?auto_16365 ) ) ( not ( = ?auto_16352 ?auto_16371 ) ) ( not ( = ?auto_16353 ?auto_16365 ) ) ( not ( = ?auto_16353 ?auto_16371 ) ) ( not ( = ?auto_16354 ?auto_16365 ) ) ( not ( = ?auto_16354 ?auto_16371 ) ) ( not ( = ?auto_16355 ?auto_16365 ) ) ( not ( = ?auto_16355 ?auto_16371 ) ) ( not ( = ?auto_16356 ?auto_16365 ) ) ( not ( = ?auto_16356 ?auto_16371 ) ) ( not ( = ?auto_16359 ?auto_16365 ) ) ( not ( = ?auto_16359 ?auto_16371 ) ) ( not ( = ?auto_16357 ?auto_16365 ) ) ( not ( = ?auto_16357 ?auto_16371 ) ) ( not ( = ?auto_16361 ?auto_16365 ) ) ( not ( = ?auto_16361 ?auto_16371 ) ) ( not ( = ?auto_16360 ?auto_16365 ) ) ( not ( = ?auto_16360 ?auto_16371 ) ) ( not ( = ?auto_16358 ?auto_16365 ) ) ( not ( = ?auto_16358 ?auto_16371 ) ) ( not ( = ?auto_16363 ?auto_16365 ) ) ( not ( = ?auto_16363 ?auto_16371 ) ) ( not ( = ?auto_16362 ?auto_16365 ) ) ( not ( = ?auto_16362 ?auto_16371 ) ) ( not ( = ?auto_16365 ?auto_16380 ) ) ( not ( = ?auto_16365 ?auto_16391 ) ) ( not ( = ?auto_16365 ?auto_16401 ) ) ( not ( = ?auto_16365 ?auto_16378 ) ) ( not ( = ?auto_16365 ?auto_16400 ) ) ( not ( = ?auto_16365 ?auto_16394 ) ) ( not ( = ?auto_16365 ?auto_16392 ) ) ( not ( = ?auto_16365 ?auto_16372 ) ) ( not ( = ?auto_16365 ?auto_16393 ) ) ( not ( = ?auto_16365 ?auto_16397 ) ) ( not ( = ?auto_16365 ?auto_16384 ) ) ( not ( = ?auto_16365 ?auto_16388 ) ) ( not ( = ?auto_16367 ?auto_16389 ) ) ( not ( = ?auto_16367 ?auto_16399 ) ) ( not ( = ?auto_16367 ?auto_16396 ) ) ( not ( = ?auto_16367 ?auto_16395 ) ) ( not ( = ?auto_16367 ?auto_16379 ) ) ( not ( = ?auto_16367 ?auto_16381 ) ) ( not ( = ?auto_16367 ?auto_16386 ) ) ( not ( = ?auto_16367 ?auto_16373 ) ) ( not ( = ?auto_16367 ?auto_16383 ) ) ( not ( = ?auto_16369 ?auto_16398 ) ) ( not ( = ?auto_16369 ?auto_16390 ) ) ( not ( = ?auto_16369 ?auto_16377 ) ) ( not ( = ?auto_16369 ?auto_16375 ) ) ( not ( = ?auto_16369 ?auto_16376 ) ) ( not ( = ?auto_16369 ?auto_16382 ) ) ( not ( = ?auto_16369 ?auto_16387 ) ) ( not ( = ?auto_16369 ?auto_16385 ) ) ( not ( = ?auto_16369 ?auto_16374 ) ) ( not ( = ?auto_16371 ?auto_16380 ) ) ( not ( = ?auto_16371 ?auto_16391 ) ) ( not ( = ?auto_16371 ?auto_16401 ) ) ( not ( = ?auto_16371 ?auto_16378 ) ) ( not ( = ?auto_16371 ?auto_16400 ) ) ( not ( = ?auto_16371 ?auto_16394 ) ) ( not ( = ?auto_16371 ?auto_16392 ) ) ( not ( = ?auto_16371 ?auto_16372 ) ) ( not ( = ?auto_16371 ?auto_16393 ) ) ( not ( = ?auto_16371 ?auto_16397 ) ) ( not ( = ?auto_16371 ?auto_16384 ) ) ( not ( = ?auto_16371 ?auto_16388 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_16352 ?auto_16353 ?auto_16354 ?auto_16355 ?auto_16356 ?auto_16359 ?auto_16357 ?auto_16361 ?auto_16360 ?auto_16358 ?auto_16363 ?auto_16362 ?auto_16364 )
      ( MAKE-1CRATE ?auto_16364 ?auto_16365 )
      ( MAKE-13CRATE-VERIFY ?auto_16352 ?auto_16353 ?auto_16354 ?auto_16355 ?auto_16356 ?auto_16359 ?auto_16357 ?auto_16361 ?auto_16360 ?auto_16358 ?auto_16363 ?auto_16362 ?auto_16364 ?auto_16365 ) )
  )

)

