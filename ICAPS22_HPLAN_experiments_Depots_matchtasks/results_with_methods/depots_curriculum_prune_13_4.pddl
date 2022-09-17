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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15821 - SURFACE
      ?auto_15822 - SURFACE
      ?auto_15823 - SURFACE
    )
    :vars
    (
      ?auto_15827 - HOIST
      ?auto_15828 - PLACE
      ?auto_15829 - PLACE
      ?auto_15825 - HOIST
      ?auto_15826 - SURFACE
      ?auto_15832 - PLACE
      ?auto_15831 - HOIST
      ?auto_15830 - SURFACE
      ?auto_15824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15827 ?auto_15828 ) ( IS-CRATE ?auto_15823 ) ( not ( = ?auto_15829 ?auto_15828 ) ) ( HOIST-AT ?auto_15825 ?auto_15829 ) ( AVAILABLE ?auto_15825 ) ( SURFACE-AT ?auto_15823 ?auto_15829 ) ( ON ?auto_15823 ?auto_15826 ) ( CLEAR ?auto_15823 ) ( not ( = ?auto_15822 ?auto_15823 ) ) ( not ( = ?auto_15822 ?auto_15826 ) ) ( not ( = ?auto_15823 ?auto_15826 ) ) ( not ( = ?auto_15827 ?auto_15825 ) ) ( SURFACE-AT ?auto_15821 ?auto_15828 ) ( CLEAR ?auto_15821 ) ( IS-CRATE ?auto_15822 ) ( AVAILABLE ?auto_15827 ) ( not ( = ?auto_15832 ?auto_15828 ) ) ( HOIST-AT ?auto_15831 ?auto_15832 ) ( AVAILABLE ?auto_15831 ) ( SURFACE-AT ?auto_15822 ?auto_15832 ) ( ON ?auto_15822 ?auto_15830 ) ( CLEAR ?auto_15822 ) ( TRUCK-AT ?auto_15824 ?auto_15828 ) ( not ( = ?auto_15821 ?auto_15822 ) ) ( not ( = ?auto_15821 ?auto_15830 ) ) ( not ( = ?auto_15822 ?auto_15830 ) ) ( not ( = ?auto_15827 ?auto_15831 ) ) ( not ( = ?auto_15821 ?auto_15823 ) ) ( not ( = ?auto_15821 ?auto_15826 ) ) ( not ( = ?auto_15823 ?auto_15830 ) ) ( not ( = ?auto_15829 ?auto_15832 ) ) ( not ( = ?auto_15825 ?auto_15831 ) ) ( not ( = ?auto_15826 ?auto_15830 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15821 ?auto_15822 )
      ( MAKE-1CRATE ?auto_15822 ?auto_15823 )
      ( MAKE-2CRATE-VERIFY ?auto_15821 ?auto_15822 ?auto_15823 ) )
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
      ?auto_15852 - HOIST
      ?auto_15855 - PLACE
      ?auto_15854 - PLACE
      ?auto_15853 - HOIST
      ?auto_15856 - SURFACE
      ?auto_15861 - PLACE
      ?auto_15862 - HOIST
      ?auto_15858 - SURFACE
      ?auto_15859 - PLACE
      ?auto_15857 - HOIST
      ?auto_15860 - SURFACE
      ?auto_15851 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15852 ?auto_15855 ) ( IS-CRATE ?auto_15850 ) ( not ( = ?auto_15854 ?auto_15855 ) ) ( HOIST-AT ?auto_15853 ?auto_15854 ) ( AVAILABLE ?auto_15853 ) ( SURFACE-AT ?auto_15850 ?auto_15854 ) ( ON ?auto_15850 ?auto_15856 ) ( CLEAR ?auto_15850 ) ( not ( = ?auto_15849 ?auto_15850 ) ) ( not ( = ?auto_15849 ?auto_15856 ) ) ( not ( = ?auto_15850 ?auto_15856 ) ) ( not ( = ?auto_15852 ?auto_15853 ) ) ( IS-CRATE ?auto_15849 ) ( not ( = ?auto_15861 ?auto_15855 ) ) ( HOIST-AT ?auto_15862 ?auto_15861 ) ( AVAILABLE ?auto_15862 ) ( SURFACE-AT ?auto_15849 ?auto_15861 ) ( ON ?auto_15849 ?auto_15858 ) ( CLEAR ?auto_15849 ) ( not ( = ?auto_15848 ?auto_15849 ) ) ( not ( = ?auto_15848 ?auto_15858 ) ) ( not ( = ?auto_15849 ?auto_15858 ) ) ( not ( = ?auto_15852 ?auto_15862 ) ) ( SURFACE-AT ?auto_15847 ?auto_15855 ) ( CLEAR ?auto_15847 ) ( IS-CRATE ?auto_15848 ) ( AVAILABLE ?auto_15852 ) ( not ( = ?auto_15859 ?auto_15855 ) ) ( HOIST-AT ?auto_15857 ?auto_15859 ) ( AVAILABLE ?auto_15857 ) ( SURFACE-AT ?auto_15848 ?auto_15859 ) ( ON ?auto_15848 ?auto_15860 ) ( CLEAR ?auto_15848 ) ( TRUCK-AT ?auto_15851 ?auto_15855 ) ( not ( = ?auto_15847 ?auto_15848 ) ) ( not ( = ?auto_15847 ?auto_15860 ) ) ( not ( = ?auto_15848 ?auto_15860 ) ) ( not ( = ?auto_15852 ?auto_15857 ) ) ( not ( = ?auto_15847 ?auto_15849 ) ) ( not ( = ?auto_15847 ?auto_15858 ) ) ( not ( = ?auto_15849 ?auto_15860 ) ) ( not ( = ?auto_15861 ?auto_15859 ) ) ( not ( = ?auto_15862 ?auto_15857 ) ) ( not ( = ?auto_15858 ?auto_15860 ) ) ( not ( = ?auto_15847 ?auto_15850 ) ) ( not ( = ?auto_15847 ?auto_15856 ) ) ( not ( = ?auto_15848 ?auto_15850 ) ) ( not ( = ?auto_15848 ?auto_15856 ) ) ( not ( = ?auto_15850 ?auto_15858 ) ) ( not ( = ?auto_15850 ?auto_15860 ) ) ( not ( = ?auto_15854 ?auto_15861 ) ) ( not ( = ?auto_15854 ?auto_15859 ) ) ( not ( = ?auto_15853 ?auto_15862 ) ) ( not ( = ?auto_15853 ?auto_15857 ) ) ( not ( = ?auto_15856 ?auto_15858 ) ) ( not ( = ?auto_15856 ?auto_15860 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15847 ?auto_15848 ?auto_15849 )
      ( MAKE-1CRATE ?auto_15849 ?auto_15850 )
      ( MAKE-3CRATE-VERIFY ?auto_15847 ?auto_15848 ?auto_15849 ?auto_15850 ) )
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
      ?auto_15888 - HOIST
      ?auto_15887 - PLACE
      ?auto_15884 - PLACE
      ?auto_15883 - HOIST
      ?auto_15886 - SURFACE
      ?auto_15894 - PLACE
      ?auto_15893 - HOIST
      ?auto_15890 - SURFACE
      ?auto_15889 - PLACE
      ?auto_15892 - HOIST
      ?auto_15891 - SURFACE
      ?auto_15897 - PLACE
      ?auto_15895 - HOIST
      ?auto_15896 - SURFACE
      ?auto_15885 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15888 ?auto_15887 ) ( IS-CRATE ?auto_15882 ) ( not ( = ?auto_15884 ?auto_15887 ) ) ( HOIST-AT ?auto_15883 ?auto_15884 ) ( AVAILABLE ?auto_15883 ) ( SURFACE-AT ?auto_15882 ?auto_15884 ) ( ON ?auto_15882 ?auto_15886 ) ( CLEAR ?auto_15882 ) ( not ( = ?auto_15881 ?auto_15882 ) ) ( not ( = ?auto_15881 ?auto_15886 ) ) ( not ( = ?auto_15882 ?auto_15886 ) ) ( not ( = ?auto_15888 ?auto_15883 ) ) ( IS-CRATE ?auto_15881 ) ( not ( = ?auto_15894 ?auto_15887 ) ) ( HOIST-AT ?auto_15893 ?auto_15894 ) ( AVAILABLE ?auto_15893 ) ( SURFACE-AT ?auto_15881 ?auto_15894 ) ( ON ?auto_15881 ?auto_15890 ) ( CLEAR ?auto_15881 ) ( not ( = ?auto_15880 ?auto_15881 ) ) ( not ( = ?auto_15880 ?auto_15890 ) ) ( not ( = ?auto_15881 ?auto_15890 ) ) ( not ( = ?auto_15888 ?auto_15893 ) ) ( IS-CRATE ?auto_15880 ) ( not ( = ?auto_15889 ?auto_15887 ) ) ( HOIST-AT ?auto_15892 ?auto_15889 ) ( AVAILABLE ?auto_15892 ) ( SURFACE-AT ?auto_15880 ?auto_15889 ) ( ON ?auto_15880 ?auto_15891 ) ( CLEAR ?auto_15880 ) ( not ( = ?auto_15879 ?auto_15880 ) ) ( not ( = ?auto_15879 ?auto_15891 ) ) ( not ( = ?auto_15880 ?auto_15891 ) ) ( not ( = ?auto_15888 ?auto_15892 ) ) ( SURFACE-AT ?auto_15878 ?auto_15887 ) ( CLEAR ?auto_15878 ) ( IS-CRATE ?auto_15879 ) ( AVAILABLE ?auto_15888 ) ( not ( = ?auto_15897 ?auto_15887 ) ) ( HOIST-AT ?auto_15895 ?auto_15897 ) ( AVAILABLE ?auto_15895 ) ( SURFACE-AT ?auto_15879 ?auto_15897 ) ( ON ?auto_15879 ?auto_15896 ) ( CLEAR ?auto_15879 ) ( TRUCK-AT ?auto_15885 ?auto_15887 ) ( not ( = ?auto_15878 ?auto_15879 ) ) ( not ( = ?auto_15878 ?auto_15896 ) ) ( not ( = ?auto_15879 ?auto_15896 ) ) ( not ( = ?auto_15888 ?auto_15895 ) ) ( not ( = ?auto_15878 ?auto_15880 ) ) ( not ( = ?auto_15878 ?auto_15891 ) ) ( not ( = ?auto_15880 ?auto_15896 ) ) ( not ( = ?auto_15889 ?auto_15897 ) ) ( not ( = ?auto_15892 ?auto_15895 ) ) ( not ( = ?auto_15891 ?auto_15896 ) ) ( not ( = ?auto_15878 ?auto_15881 ) ) ( not ( = ?auto_15878 ?auto_15890 ) ) ( not ( = ?auto_15879 ?auto_15881 ) ) ( not ( = ?auto_15879 ?auto_15890 ) ) ( not ( = ?auto_15881 ?auto_15891 ) ) ( not ( = ?auto_15881 ?auto_15896 ) ) ( not ( = ?auto_15894 ?auto_15889 ) ) ( not ( = ?auto_15894 ?auto_15897 ) ) ( not ( = ?auto_15893 ?auto_15892 ) ) ( not ( = ?auto_15893 ?auto_15895 ) ) ( not ( = ?auto_15890 ?auto_15891 ) ) ( not ( = ?auto_15890 ?auto_15896 ) ) ( not ( = ?auto_15878 ?auto_15882 ) ) ( not ( = ?auto_15878 ?auto_15886 ) ) ( not ( = ?auto_15879 ?auto_15882 ) ) ( not ( = ?auto_15879 ?auto_15886 ) ) ( not ( = ?auto_15880 ?auto_15882 ) ) ( not ( = ?auto_15880 ?auto_15886 ) ) ( not ( = ?auto_15882 ?auto_15890 ) ) ( not ( = ?auto_15882 ?auto_15891 ) ) ( not ( = ?auto_15882 ?auto_15896 ) ) ( not ( = ?auto_15884 ?auto_15894 ) ) ( not ( = ?auto_15884 ?auto_15889 ) ) ( not ( = ?auto_15884 ?auto_15897 ) ) ( not ( = ?auto_15883 ?auto_15893 ) ) ( not ( = ?auto_15883 ?auto_15892 ) ) ( not ( = ?auto_15883 ?auto_15895 ) ) ( not ( = ?auto_15886 ?auto_15890 ) ) ( not ( = ?auto_15886 ?auto_15891 ) ) ( not ( = ?auto_15886 ?auto_15896 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_15878 ?auto_15879 ?auto_15880 ?auto_15881 )
      ( MAKE-1CRATE ?auto_15881 ?auto_15882 )
      ( MAKE-4CRATE-VERIFY ?auto_15878 ?auto_15879 ?auto_15880 ?auto_15881 ?auto_15882 ) )
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
      ?auto_15922 - PLACE
      ?auto_15921 - PLACE
      ?auto_15924 - HOIST
      ?auto_15925 - SURFACE
      ?auto_15926 - PLACE
      ?auto_15927 - HOIST
      ?auto_15932 - SURFACE
      ?auto_15934 - PLACE
      ?auto_15931 - HOIST
      ?auto_15929 - SURFACE
      ?auto_15936 - PLACE
      ?auto_15928 - HOIST
      ?auto_15930 - SURFACE
      ?auto_15937 - PLACE
      ?auto_15935 - HOIST
      ?auto_15933 - SURFACE
      ?auto_15920 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15923 ?auto_15922 ) ( IS-CRATE ?auto_15919 ) ( not ( = ?auto_15921 ?auto_15922 ) ) ( HOIST-AT ?auto_15924 ?auto_15921 ) ( AVAILABLE ?auto_15924 ) ( SURFACE-AT ?auto_15919 ?auto_15921 ) ( ON ?auto_15919 ?auto_15925 ) ( CLEAR ?auto_15919 ) ( not ( = ?auto_15918 ?auto_15919 ) ) ( not ( = ?auto_15918 ?auto_15925 ) ) ( not ( = ?auto_15919 ?auto_15925 ) ) ( not ( = ?auto_15923 ?auto_15924 ) ) ( IS-CRATE ?auto_15918 ) ( not ( = ?auto_15926 ?auto_15922 ) ) ( HOIST-AT ?auto_15927 ?auto_15926 ) ( AVAILABLE ?auto_15927 ) ( SURFACE-AT ?auto_15918 ?auto_15926 ) ( ON ?auto_15918 ?auto_15932 ) ( CLEAR ?auto_15918 ) ( not ( = ?auto_15917 ?auto_15918 ) ) ( not ( = ?auto_15917 ?auto_15932 ) ) ( not ( = ?auto_15918 ?auto_15932 ) ) ( not ( = ?auto_15923 ?auto_15927 ) ) ( IS-CRATE ?auto_15917 ) ( not ( = ?auto_15934 ?auto_15922 ) ) ( HOIST-AT ?auto_15931 ?auto_15934 ) ( AVAILABLE ?auto_15931 ) ( SURFACE-AT ?auto_15917 ?auto_15934 ) ( ON ?auto_15917 ?auto_15929 ) ( CLEAR ?auto_15917 ) ( not ( = ?auto_15916 ?auto_15917 ) ) ( not ( = ?auto_15916 ?auto_15929 ) ) ( not ( = ?auto_15917 ?auto_15929 ) ) ( not ( = ?auto_15923 ?auto_15931 ) ) ( IS-CRATE ?auto_15916 ) ( not ( = ?auto_15936 ?auto_15922 ) ) ( HOIST-AT ?auto_15928 ?auto_15936 ) ( AVAILABLE ?auto_15928 ) ( SURFACE-AT ?auto_15916 ?auto_15936 ) ( ON ?auto_15916 ?auto_15930 ) ( CLEAR ?auto_15916 ) ( not ( = ?auto_15915 ?auto_15916 ) ) ( not ( = ?auto_15915 ?auto_15930 ) ) ( not ( = ?auto_15916 ?auto_15930 ) ) ( not ( = ?auto_15923 ?auto_15928 ) ) ( SURFACE-AT ?auto_15914 ?auto_15922 ) ( CLEAR ?auto_15914 ) ( IS-CRATE ?auto_15915 ) ( AVAILABLE ?auto_15923 ) ( not ( = ?auto_15937 ?auto_15922 ) ) ( HOIST-AT ?auto_15935 ?auto_15937 ) ( AVAILABLE ?auto_15935 ) ( SURFACE-AT ?auto_15915 ?auto_15937 ) ( ON ?auto_15915 ?auto_15933 ) ( CLEAR ?auto_15915 ) ( TRUCK-AT ?auto_15920 ?auto_15922 ) ( not ( = ?auto_15914 ?auto_15915 ) ) ( not ( = ?auto_15914 ?auto_15933 ) ) ( not ( = ?auto_15915 ?auto_15933 ) ) ( not ( = ?auto_15923 ?auto_15935 ) ) ( not ( = ?auto_15914 ?auto_15916 ) ) ( not ( = ?auto_15914 ?auto_15930 ) ) ( not ( = ?auto_15916 ?auto_15933 ) ) ( not ( = ?auto_15936 ?auto_15937 ) ) ( not ( = ?auto_15928 ?auto_15935 ) ) ( not ( = ?auto_15930 ?auto_15933 ) ) ( not ( = ?auto_15914 ?auto_15917 ) ) ( not ( = ?auto_15914 ?auto_15929 ) ) ( not ( = ?auto_15915 ?auto_15917 ) ) ( not ( = ?auto_15915 ?auto_15929 ) ) ( not ( = ?auto_15917 ?auto_15930 ) ) ( not ( = ?auto_15917 ?auto_15933 ) ) ( not ( = ?auto_15934 ?auto_15936 ) ) ( not ( = ?auto_15934 ?auto_15937 ) ) ( not ( = ?auto_15931 ?auto_15928 ) ) ( not ( = ?auto_15931 ?auto_15935 ) ) ( not ( = ?auto_15929 ?auto_15930 ) ) ( not ( = ?auto_15929 ?auto_15933 ) ) ( not ( = ?auto_15914 ?auto_15918 ) ) ( not ( = ?auto_15914 ?auto_15932 ) ) ( not ( = ?auto_15915 ?auto_15918 ) ) ( not ( = ?auto_15915 ?auto_15932 ) ) ( not ( = ?auto_15916 ?auto_15918 ) ) ( not ( = ?auto_15916 ?auto_15932 ) ) ( not ( = ?auto_15918 ?auto_15929 ) ) ( not ( = ?auto_15918 ?auto_15930 ) ) ( not ( = ?auto_15918 ?auto_15933 ) ) ( not ( = ?auto_15926 ?auto_15934 ) ) ( not ( = ?auto_15926 ?auto_15936 ) ) ( not ( = ?auto_15926 ?auto_15937 ) ) ( not ( = ?auto_15927 ?auto_15931 ) ) ( not ( = ?auto_15927 ?auto_15928 ) ) ( not ( = ?auto_15927 ?auto_15935 ) ) ( not ( = ?auto_15932 ?auto_15929 ) ) ( not ( = ?auto_15932 ?auto_15930 ) ) ( not ( = ?auto_15932 ?auto_15933 ) ) ( not ( = ?auto_15914 ?auto_15919 ) ) ( not ( = ?auto_15914 ?auto_15925 ) ) ( not ( = ?auto_15915 ?auto_15919 ) ) ( not ( = ?auto_15915 ?auto_15925 ) ) ( not ( = ?auto_15916 ?auto_15919 ) ) ( not ( = ?auto_15916 ?auto_15925 ) ) ( not ( = ?auto_15917 ?auto_15919 ) ) ( not ( = ?auto_15917 ?auto_15925 ) ) ( not ( = ?auto_15919 ?auto_15932 ) ) ( not ( = ?auto_15919 ?auto_15929 ) ) ( not ( = ?auto_15919 ?auto_15930 ) ) ( not ( = ?auto_15919 ?auto_15933 ) ) ( not ( = ?auto_15921 ?auto_15926 ) ) ( not ( = ?auto_15921 ?auto_15934 ) ) ( not ( = ?auto_15921 ?auto_15936 ) ) ( not ( = ?auto_15921 ?auto_15937 ) ) ( not ( = ?auto_15924 ?auto_15927 ) ) ( not ( = ?auto_15924 ?auto_15931 ) ) ( not ( = ?auto_15924 ?auto_15928 ) ) ( not ( = ?auto_15924 ?auto_15935 ) ) ( not ( = ?auto_15925 ?auto_15932 ) ) ( not ( = ?auto_15925 ?auto_15929 ) ) ( not ( = ?auto_15925 ?auto_15930 ) ) ( not ( = ?auto_15925 ?auto_15933 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_15914 ?auto_15915 ?auto_15916 ?auto_15917 ?auto_15918 )
      ( MAKE-1CRATE ?auto_15918 ?auto_15919 )
      ( MAKE-5CRATE-VERIFY ?auto_15914 ?auto_15915 ?auto_15916 ?auto_15917 ?auto_15918 ?auto_15919 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_15955 - SURFACE
      ?auto_15956 - SURFACE
      ?auto_15957 - SURFACE
      ?auto_15958 - SURFACE
      ?auto_15959 - SURFACE
      ?auto_15960 - SURFACE
      ?auto_15961 - SURFACE
    )
    :vars
    (
      ?auto_15963 - HOIST
      ?auto_15967 - PLACE
      ?auto_15964 - PLACE
      ?auto_15966 - HOIST
      ?auto_15965 - SURFACE
      ?auto_15982 - PLACE
      ?auto_15973 - HOIST
      ?auto_15977 - SURFACE
      ?auto_15978 - PLACE
      ?auto_15975 - HOIST
      ?auto_15969 - SURFACE
      ?auto_15979 - PLACE
      ?auto_15970 - HOIST
      ?auto_15974 - SURFACE
      ?auto_15972 - PLACE
      ?auto_15976 - HOIST
      ?auto_15971 - SURFACE
      ?auto_15981 - PLACE
      ?auto_15980 - HOIST
      ?auto_15968 - SURFACE
      ?auto_15962 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15963 ?auto_15967 ) ( IS-CRATE ?auto_15961 ) ( not ( = ?auto_15964 ?auto_15967 ) ) ( HOIST-AT ?auto_15966 ?auto_15964 ) ( AVAILABLE ?auto_15966 ) ( SURFACE-AT ?auto_15961 ?auto_15964 ) ( ON ?auto_15961 ?auto_15965 ) ( CLEAR ?auto_15961 ) ( not ( = ?auto_15960 ?auto_15961 ) ) ( not ( = ?auto_15960 ?auto_15965 ) ) ( not ( = ?auto_15961 ?auto_15965 ) ) ( not ( = ?auto_15963 ?auto_15966 ) ) ( IS-CRATE ?auto_15960 ) ( not ( = ?auto_15982 ?auto_15967 ) ) ( HOIST-AT ?auto_15973 ?auto_15982 ) ( AVAILABLE ?auto_15973 ) ( SURFACE-AT ?auto_15960 ?auto_15982 ) ( ON ?auto_15960 ?auto_15977 ) ( CLEAR ?auto_15960 ) ( not ( = ?auto_15959 ?auto_15960 ) ) ( not ( = ?auto_15959 ?auto_15977 ) ) ( not ( = ?auto_15960 ?auto_15977 ) ) ( not ( = ?auto_15963 ?auto_15973 ) ) ( IS-CRATE ?auto_15959 ) ( not ( = ?auto_15978 ?auto_15967 ) ) ( HOIST-AT ?auto_15975 ?auto_15978 ) ( AVAILABLE ?auto_15975 ) ( SURFACE-AT ?auto_15959 ?auto_15978 ) ( ON ?auto_15959 ?auto_15969 ) ( CLEAR ?auto_15959 ) ( not ( = ?auto_15958 ?auto_15959 ) ) ( not ( = ?auto_15958 ?auto_15969 ) ) ( not ( = ?auto_15959 ?auto_15969 ) ) ( not ( = ?auto_15963 ?auto_15975 ) ) ( IS-CRATE ?auto_15958 ) ( not ( = ?auto_15979 ?auto_15967 ) ) ( HOIST-AT ?auto_15970 ?auto_15979 ) ( AVAILABLE ?auto_15970 ) ( SURFACE-AT ?auto_15958 ?auto_15979 ) ( ON ?auto_15958 ?auto_15974 ) ( CLEAR ?auto_15958 ) ( not ( = ?auto_15957 ?auto_15958 ) ) ( not ( = ?auto_15957 ?auto_15974 ) ) ( not ( = ?auto_15958 ?auto_15974 ) ) ( not ( = ?auto_15963 ?auto_15970 ) ) ( IS-CRATE ?auto_15957 ) ( not ( = ?auto_15972 ?auto_15967 ) ) ( HOIST-AT ?auto_15976 ?auto_15972 ) ( AVAILABLE ?auto_15976 ) ( SURFACE-AT ?auto_15957 ?auto_15972 ) ( ON ?auto_15957 ?auto_15971 ) ( CLEAR ?auto_15957 ) ( not ( = ?auto_15956 ?auto_15957 ) ) ( not ( = ?auto_15956 ?auto_15971 ) ) ( not ( = ?auto_15957 ?auto_15971 ) ) ( not ( = ?auto_15963 ?auto_15976 ) ) ( SURFACE-AT ?auto_15955 ?auto_15967 ) ( CLEAR ?auto_15955 ) ( IS-CRATE ?auto_15956 ) ( AVAILABLE ?auto_15963 ) ( not ( = ?auto_15981 ?auto_15967 ) ) ( HOIST-AT ?auto_15980 ?auto_15981 ) ( AVAILABLE ?auto_15980 ) ( SURFACE-AT ?auto_15956 ?auto_15981 ) ( ON ?auto_15956 ?auto_15968 ) ( CLEAR ?auto_15956 ) ( TRUCK-AT ?auto_15962 ?auto_15967 ) ( not ( = ?auto_15955 ?auto_15956 ) ) ( not ( = ?auto_15955 ?auto_15968 ) ) ( not ( = ?auto_15956 ?auto_15968 ) ) ( not ( = ?auto_15963 ?auto_15980 ) ) ( not ( = ?auto_15955 ?auto_15957 ) ) ( not ( = ?auto_15955 ?auto_15971 ) ) ( not ( = ?auto_15957 ?auto_15968 ) ) ( not ( = ?auto_15972 ?auto_15981 ) ) ( not ( = ?auto_15976 ?auto_15980 ) ) ( not ( = ?auto_15971 ?auto_15968 ) ) ( not ( = ?auto_15955 ?auto_15958 ) ) ( not ( = ?auto_15955 ?auto_15974 ) ) ( not ( = ?auto_15956 ?auto_15958 ) ) ( not ( = ?auto_15956 ?auto_15974 ) ) ( not ( = ?auto_15958 ?auto_15971 ) ) ( not ( = ?auto_15958 ?auto_15968 ) ) ( not ( = ?auto_15979 ?auto_15972 ) ) ( not ( = ?auto_15979 ?auto_15981 ) ) ( not ( = ?auto_15970 ?auto_15976 ) ) ( not ( = ?auto_15970 ?auto_15980 ) ) ( not ( = ?auto_15974 ?auto_15971 ) ) ( not ( = ?auto_15974 ?auto_15968 ) ) ( not ( = ?auto_15955 ?auto_15959 ) ) ( not ( = ?auto_15955 ?auto_15969 ) ) ( not ( = ?auto_15956 ?auto_15959 ) ) ( not ( = ?auto_15956 ?auto_15969 ) ) ( not ( = ?auto_15957 ?auto_15959 ) ) ( not ( = ?auto_15957 ?auto_15969 ) ) ( not ( = ?auto_15959 ?auto_15974 ) ) ( not ( = ?auto_15959 ?auto_15971 ) ) ( not ( = ?auto_15959 ?auto_15968 ) ) ( not ( = ?auto_15978 ?auto_15979 ) ) ( not ( = ?auto_15978 ?auto_15972 ) ) ( not ( = ?auto_15978 ?auto_15981 ) ) ( not ( = ?auto_15975 ?auto_15970 ) ) ( not ( = ?auto_15975 ?auto_15976 ) ) ( not ( = ?auto_15975 ?auto_15980 ) ) ( not ( = ?auto_15969 ?auto_15974 ) ) ( not ( = ?auto_15969 ?auto_15971 ) ) ( not ( = ?auto_15969 ?auto_15968 ) ) ( not ( = ?auto_15955 ?auto_15960 ) ) ( not ( = ?auto_15955 ?auto_15977 ) ) ( not ( = ?auto_15956 ?auto_15960 ) ) ( not ( = ?auto_15956 ?auto_15977 ) ) ( not ( = ?auto_15957 ?auto_15960 ) ) ( not ( = ?auto_15957 ?auto_15977 ) ) ( not ( = ?auto_15958 ?auto_15960 ) ) ( not ( = ?auto_15958 ?auto_15977 ) ) ( not ( = ?auto_15960 ?auto_15969 ) ) ( not ( = ?auto_15960 ?auto_15974 ) ) ( not ( = ?auto_15960 ?auto_15971 ) ) ( not ( = ?auto_15960 ?auto_15968 ) ) ( not ( = ?auto_15982 ?auto_15978 ) ) ( not ( = ?auto_15982 ?auto_15979 ) ) ( not ( = ?auto_15982 ?auto_15972 ) ) ( not ( = ?auto_15982 ?auto_15981 ) ) ( not ( = ?auto_15973 ?auto_15975 ) ) ( not ( = ?auto_15973 ?auto_15970 ) ) ( not ( = ?auto_15973 ?auto_15976 ) ) ( not ( = ?auto_15973 ?auto_15980 ) ) ( not ( = ?auto_15977 ?auto_15969 ) ) ( not ( = ?auto_15977 ?auto_15974 ) ) ( not ( = ?auto_15977 ?auto_15971 ) ) ( not ( = ?auto_15977 ?auto_15968 ) ) ( not ( = ?auto_15955 ?auto_15961 ) ) ( not ( = ?auto_15955 ?auto_15965 ) ) ( not ( = ?auto_15956 ?auto_15961 ) ) ( not ( = ?auto_15956 ?auto_15965 ) ) ( not ( = ?auto_15957 ?auto_15961 ) ) ( not ( = ?auto_15957 ?auto_15965 ) ) ( not ( = ?auto_15958 ?auto_15961 ) ) ( not ( = ?auto_15958 ?auto_15965 ) ) ( not ( = ?auto_15959 ?auto_15961 ) ) ( not ( = ?auto_15959 ?auto_15965 ) ) ( not ( = ?auto_15961 ?auto_15977 ) ) ( not ( = ?auto_15961 ?auto_15969 ) ) ( not ( = ?auto_15961 ?auto_15974 ) ) ( not ( = ?auto_15961 ?auto_15971 ) ) ( not ( = ?auto_15961 ?auto_15968 ) ) ( not ( = ?auto_15964 ?auto_15982 ) ) ( not ( = ?auto_15964 ?auto_15978 ) ) ( not ( = ?auto_15964 ?auto_15979 ) ) ( not ( = ?auto_15964 ?auto_15972 ) ) ( not ( = ?auto_15964 ?auto_15981 ) ) ( not ( = ?auto_15966 ?auto_15973 ) ) ( not ( = ?auto_15966 ?auto_15975 ) ) ( not ( = ?auto_15966 ?auto_15970 ) ) ( not ( = ?auto_15966 ?auto_15976 ) ) ( not ( = ?auto_15966 ?auto_15980 ) ) ( not ( = ?auto_15965 ?auto_15977 ) ) ( not ( = ?auto_15965 ?auto_15969 ) ) ( not ( = ?auto_15965 ?auto_15974 ) ) ( not ( = ?auto_15965 ?auto_15971 ) ) ( not ( = ?auto_15965 ?auto_15968 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_15955 ?auto_15956 ?auto_15957 ?auto_15958 ?auto_15959 ?auto_15960 )
      ( MAKE-1CRATE ?auto_15960 ?auto_15961 )
      ( MAKE-6CRATE-VERIFY ?auto_15955 ?auto_15956 ?auto_15957 ?auto_15958 ?auto_15959 ?auto_15960 ?auto_15961 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_16001 - SURFACE
      ?auto_16002 - SURFACE
      ?auto_16003 - SURFACE
      ?auto_16004 - SURFACE
      ?auto_16005 - SURFACE
      ?auto_16006 - SURFACE
      ?auto_16007 - SURFACE
      ?auto_16008 - SURFACE
    )
    :vars
    (
      ?auto_16013 - HOIST
      ?auto_16011 - PLACE
      ?auto_16014 - PLACE
      ?auto_16010 - HOIST
      ?auto_16009 - SURFACE
      ?auto_16028 - PLACE
      ?auto_16026 - HOIST
      ?auto_16030 - SURFACE
      ?auto_16016 - PLACE
      ?auto_16027 - HOIST
      ?auto_16019 - SURFACE
      ?auto_16018 - PLACE
      ?auto_16023 - HOIST
      ?auto_16025 - SURFACE
      ?auto_16020 - PLACE
      ?auto_16015 - HOIST
      ?auto_16029 - SURFACE
      ?auto_16024 - SURFACE
      ?auto_16022 - PLACE
      ?auto_16021 - HOIST
      ?auto_16017 - SURFACE
      ?auto_16012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16013 ?auto_16011 ) ( IS-CRATE ?auto_16008 ) ( not ( = ?auto_16014 ?auto_16011 ) ) ( HOIST-AT ?auto_16010 ?auto_16014 ) ( SURFACE-AT ?auto_16008 ?auto_16014 ) ( ON ?auto_16008 ?auto_16009 ) ( CLEAR ?auto_16008 ) ( not ( = ?auto_16007 ?auto_16008 ) ) ( not ( = ?auto_16007 ?auto_16009 ) ) ( not ( = ?auto_16008 ?auto_16009 ) ) ( not ( = ?auto_16013 ?auto_16010 ) ) ( IS-CRATE ?auto_16007 ) ( not ( = ?auto_16028 ?auto_16011 ) ) ( HOIST-AT ?auto_16026 ?auto_16028 ) ( AVAILABLE ?auto_16026 ) ( SURFACE-AT ?auto_16007 ?auto_16028 ) ( ON ?auto_16007 ?auto_16030 ) ( CLEAR ?auto_16007 ) ( not ( = ?auto_16006 ?auto_16007 ) ) ( not ( = ?auto_16006 ?auto_16030 ) ) ( not ( = ?auto_16007 ?auto_16030 ) ) ( not ( = ?auto_16013 ?auto_16026 ) ) ( IS-CRATE ?auto_16006 ) ( not ( = ?auto_16016 ?auto_16011 ) ) ( HOIST-AT ?auto_16027 ?auto_16016 ) ( AVAILABLE ?auto_16027 ) ( SURFACE-AT ?auto_16006 ?auto_16016 ) ( ON ?auto_16006 ?auto_16019 ) ( CLEAR ?auto_16006 ) ( not ( = ?auto_16005 ?auto_16006 ) ) ( not ( = ?auto_16005 ?auto_16019 ) ) ( not ( = ?auto_16006 ?auto_16019 ) ) ( not ( = ?auto_16013 ?auto_16027 ) ) ( IS-CRATE ?auto_16005 ) ( not ( = ?auto_16018 ?auto_16011 ) ) ( HOIST-AT ?auto_16023 ?auto_16018 ) ( AVAILABLE ?auto_16023 ) ( SURFACE-AT ?auto_16005 ?auto_16018 ) ( ON ?auto_16005 ?auto_16025 ) ( CLEAR ?auto_16005 ) ( not ( = ?auto_16004 ?auto_16005 ) ) ( not ( = ?auto_16004 ?auto_16025 ) ) ( not ( = ?auto_16005 ?auto_16025 ) ) ( not ( = ?auto_16013 ?auto_16023 ) ) ( IS-CRATE ?auto_16004 ) ( not ( = ?auto_16020 ?auto_16011 ) ) ( HOIST-AT ?auto_16015 ?auto_16020 ) ( AVAILABLE ?auto_16015 ) ( SURFACE-AT ?auto_16004 ?auto_16020 ) ( ON ?auto_16004 ?auto_16029 ) ( CLEAR ?auto_16004 ) ( not ( = ?auto_16003 ?auto_16004 ) ) ( not ( = ?auto_16003 ?auto_16029 ) ) ( not ( = ?auto_16004 ?auto_16029 ) ) ( not ( = ?auto_16013 ?auto_16015 ) ) ( IS-CRATE ?auto_16003 ) ( AVAILABLE ?auto_16010 ) ( SURFACE-AT ?auto_16003 ?auto_16014 ) ( ON ?auto_16003 ?auto_16024 ) ( CLEAR ?auto_16003 ) ( not ( = ?auto_16002 ?auto_16003 ) ) ( not ( = ?auto_16002 ?auto_16024 ) ) ( not ( = ?auto_16003 ?auto_16024 ) ) ( SURFACE-AT ?auto_16001 ?auto_16011 ) ( CLEAR ?auto_16001 ) ( IS-CRATE ?auto_16002 ) ( AVAILABLE ?auto_16013 ) ( not ( = ?auto_16022 ?auto_16011 ) ) ( HOIST-AT ?auto_16021 ?auto_16022 ) ( AVAILABLE ?auto_16021 ) ( SURFACE-AT ?auto_16002 ?auto_16022 ) ( ON ?auto_16002 ?auto_16017 ) ( CLEAR ?auto_16002 ) ( TRUCK-AT ?auto_16012 ?auto_16011 ) ( not ( = ?auto_16001 ?auto_16002 ) ) ( not ( = ?auto_16001 ?auto_16017 ) ) ( not ( = ?auto_16002 ?auto_16017 ) ) ( not ( = ?auto_16013 ?auto_16021 ) ) ( not ( = ?auto_16001 ?auto_16003 ) ) ( not ( = ?auto_16001 ?auto_16024 ) ) ( not ( = ?auto_16003 ?auto_16017 ) ) ( not ( = ?auto_16014 ?auto_16022 ) ) ( not ( = ?auto_16010 ?auto_16021 ) ) ( not ( = ?auto_16024 ?auto_16017 ) ) ( not ( = ?auto_16001 ?auto_16004 ) ) ( not ( = ?auto_16001 ?auto_16029 ) ) ( not ( = ?auto_16002 ?auto_16004 ) ) ( not ( = ?auto_16002 ?auto_16029 ) ) ( not ( = ?auto_16004 ?auto_16024 ) ) ( not ( = ?auto_16004 ?auto_16017 ) ) ( not ( = ?auto_16020 ?auto_16014 ) ) ( not ( = ?auto_16020 ?auto_16022 ) ) ( not ( = ?auto_16015 ?auto_16010 ) ) ( not ( = ?auto_16015 ?auto_16021 ) ) ( not ( = ?auto_16029 ?auto_16024 ) ) ( not ( = ?auto_16029 ?auto_16017 ) ) ( not ( = ?auto_16001 ?auto_16005 ) ) ( not ( = ?auto_16001 ?auto_16025 ) ) ( not ( = ?auto_16002 ?auto_16005 ) ) ( not ( = ?auto_16002 ?auto_16025 ) ) ( not ( = ?auto_16003 ?auto_16005 ) ) ( not ( = ?auto_16003 ?auto_16025 ) ) ( not ( = ?auto_16005 ?auto_16029 ) ) ( not ( = ?auto_16005 ?auto_16024 ) ) ( not ( = ?auto_16005 ?auto_16017 ) ) ( not ( = ?auto_16018 ?auto_16020 ) ) ( not ( = ?auto_16018 ?auto_16014 ) ) ( not ( = ?auto_16018 ?auto_16022 ) ) ( not ( = ?auto_16023 ?auto_16015 ) ) ( not ( = ?auto_16023 ?auto_16010 ) ) ( not ( = ?auto_16023 ?auto_16021 ) ) ( not ( = ?auto_16025 ?auto_16029 ) ) ( not ( = ?auto_16025 ?auto_16024 ) ) ( not ( = ?auto_16025 ?auto_16017 ) ) ( not ( = ?auto_16001 ?auto_16006 ) ) ( not ( = ?auto_16001 ?auto_16019 ) ) ( not ( = ?auto_16002 ?auto_16006 ) ) ( not ( = ?auto_16002 ?auto_16019 ) ) ( not ( = ?auto_16003 ?auto_16006 ) ) ( not ( = ?auto_16003 ?auto_16019 ) ) ( not ( = ?auto_16004 ?auto_16006 ) ) ( not ( = ?auto_16004 ?auto_16019 ) ) ( not ( = ?auto_16006 ?auto_16025 ) ) ( not ( = ?auto_16006 ?auto_16029 ) ) ( not ( = ?auto_16006 ?auto_16024 ) ) ( not ( = ?auto_16006 ?auto_16017 ) ) ( not ( = ?auto_16016 ?auto_16018 ) ) ( not ( = ?auto_16016 ?auto_16020 ) ) ( not ( = ?auto_16016 ?auto_16014 ) ) ( not ( = ?auto_16016 ?auto_16022 ) ) ( not ( = ?auto_16027 ?auto_16023 ) ) ( not ( = ?auto_16027 ?auto_16015 ) ) ( not ( = ?auto_16027 ?auto_16010 ) ) ( not ( = ?auto_16027 ?auto_16021 ) ) ( not ( = ?auto_16019 ?auto_16025 ) ) ( not ( = ?auto_16019 ?auto_16029 ) ) ( not ( = ?auto_16019 ?auto_16024 ) ) ( not ( = ?auto_16019 ?auto_16017 ) ) ( not ( = ?auto_16001 ?auto_16007 ) ) ( not ( = ?auto_16001 ?auto_16030 ) ) ( not ( = ?auto_16002 ?auto_16007 ) ) ( not ( = ?auto_16002 ?auto_16030 ) ) ( not ( = ?auto_16003 ?auto_16007 ) ) ( not ( = ?auto_16003 ?auto_16030 ) ) ( not ( = ?auto_16004 ?auto_16007 ) ) ( not ( = ?auto_16004 ?auto_16030 ) ) ( not ( = ?auto_16005 ?auto_16007 ) ) ( not ( = ?auto_16005 ?auto_16030 ) ) ( not ( = ?auto_16007 ?auto_16019 ) ) ( not ( = ?auto_16007 ?auto_16025 ) ) ( not ( = ?auto_16007 ?auto_16029 ) ) ( not ( = ?auto_16007 ?auto_16024 ) ) ( not ( = ?auto_16007 ?auto_16017 ) ) ( not ( = ?auto_16028 ?auto_16016 ) ) ( not ( = ?auto_16028 ?auto_16018 ) ) ( not ( = ?auto_16028 ?auto_16020 ) ) ( not ( = ?auto_16028 ?auto_16014 ) ) ( not ( = ?auto_16028 ?auto_16022 ) ) ( not ( = ?auto_16026 ?auto_16027 ) ) ( not ( = ?auto_16026 ?auto_16023 ) ) ( not ( = ?auto_16026 ?auto_16015 ) ) ( not ( = ?auto_16026 ?auto_16010 ) ) ( not ( = ?auto_16026 ?auto_16021 ) ) ( not ( = ?auto_16030 ?auto_16019 ) ) ( not ( = ?auto_16030 ?auto_16025 ) ) ( not ( = ?auto_16030 ?auto_16029 ) ) ( not ( = ?auto_16030 ?auto_16024 ) ) ( not ( = ?auto_16030 ?auto_16017 ) ) ( not ( = ?auto_16001 ?auto_16008 ) ) ( not ( = ?auto_16001 ?auto_16009 ) ) ( not ( = ?auto_16002 ?auto_16008 ) ) ( not ( = ?auto_16002 ?auto_16009 ) ) ( not ( = ?auto_16003 ?auto_16008 ) ) ( not ( = ?auto_16003 ?auto_16009 ) ) ( not ( = ?auto_16004 ?auto_16008 ) ) ( not ( = ?auto_16004 ?auto_16009 ) ) ( not ( = ?auto_16005 ?auto_16008 ) ) ( not ( = ?auto_16005 ?auto_16009 ) ) ( not ( = ?auto_16006 ?auto_16008 ) ) ( not ( = ?auto_16006 ?auto_16009 ) ) ( not ( = ?auto_16008 ?auto_16030 ) ) ( not ( = ?auto_16008 ?auto_16019 ) ) ( not ( = ?auto_16008 ?auto_16025 ) ) ( not ( = ?auto_16008 ?auto_16029 ) ) ( not ( = ?auto_16008 ?auto_16024 ) ) ( not ( = ?auto_16008 ?auto_16017 ) ) ( not ( = ?auto_16009 ?auto_16030 ) ) ( not ( = ?auto_16009 ?auto_16019 ) ) ( not ( = ?auto_16009 ?auto_16025 ) ) ( not ( = ?auto_16009 ?auto_16029 ) ) ( not ( = ?auto_16009 ?auto_16024 ) ) ( not ( = ?auto_16009 ?auto_16017 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_16001 ?auto_16002 ?auto_16003 ?auto_16004 ?auto_16005 ?auto_16006 ?auto_16007 )
      ( MAKE-1CRATE ?auto_16007 ?auto_16008 )
      ( MAKE-7CRATE-VERIFY ?auto_16001 ?auto_16002 ?auto_16003 ?auto_16004 ?auto_16005 ?auto_16006 ?auto_16007 ?auto_16008 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_16050 - SURFACE
      ?auto_16051 - SURFACE
      ?auto_16052 - SURFACE
      ?auto_16053 - SURFACE
      ?auto_16054 - SURFACE
      ?auto_16055 - SURFACE
      ?auto_16056 - SURFACE
      ?auto_16057 - SURFACE
      ?auto_16058 - SURFACE
    )
    :vars
    (
      ?auto_16061 - HOIST
      ?auto_16063 - PLACE
      ?auto_16060 - PLACE
      ?auto_16059 - HOIST
      ?auto_16064 - SURFACE
      ?auto_16077 - SURFACE
      ?auto_16073 - PLACE
      ?auto_16071 - HOIST
      ?auto_16076 - SURFACE
      ?auto_16065 - PLACE
      ?auto_16072 - HOIST
      ?auto_16080 - SURFACE
      ?auto_16081 - PLACE
      ?auto_16068 - HOIST
      ?auto_16069 - SURFACE
      ?auto_16079 - PLACE
      ?auto_16075 - HOIST
      ?auto_16067 - SURFACE
      ?auto_16070 - SURFACE
      ?auto_16074 - PLACE
      ?auto_16078 - HOIST
      ?auto_16066 - SURFACE
      ?auto_16062 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16061 ?auto_16063 ) ( IS-CRATE ?auto_16058 ) ( not ( = ?auto_16060 ?auto_16063 ) ) ( HOIST-AT ?auto_16059 ?auto_16060 ) ( SURFACE-AT ?auto_16058 ?auto_16060 ) ( ON ?auto_16058 ?auto_16064 ) ( CLEAR ?auto_16058 ) ( not ( = ?auto_16057 ?auto_16058 ) ) ( not ( = ?auto_16057 ?auto_16064 ) ) ( not ( = ?auto_16058 ?auto_16064 ) ) ( not ( = ?auto_16061 ?auto_16059 ) ) ( IS-CRATE ?auto_16057 ) ( SURFACE-AT ?auto_16057 ?auto_16060 ) ( ON ?auto_16057 ?auto_16077 ) ( CLEAR ?auto_16057 ) ( not ( = ?auto_16056 ?auto_16057 ) ) ( not ( = ?auto_16056 ?auto_16077 ) ) ( not ( = ?auto_16057 ?auto_16077 ) ) ( IS-CRATE ?auto_16056 ) ( not ( = ?auto_16073 ?auto_16063 ) ) ( HOIST-AT ?auto_16071 ?auto_16073 ) ( AVAILABLE ?auto_16071 ) ( SURFACE-AT ?auto_16056 ?auto_16073 ) ( ON ?auto_16056 ?auto_16076 ) ( CLEAR ?auto_16056 ) ( not ( = ?auto_16055 ?auto_16056 ) ) ( not ( = ?auto_16055 ?auto_16076 ) ) ( not ( = ?auto_16056 ?auto_16076 ) ) ( not ( = ?auto_16061 ?auto_16071 ) ) ( IS-CRATE ?auto_16055 ) ( not ( = ?auto_16065 ?auto_16063 ) ) ( HOIST-AT ?auto_16072 ?auto_16065 ) ( AVAILABLE ?auto_16072 ) ( SURFACE-AT ?auto_16055 ?auto_16065 ) ( ON ?auto_16055 ?auto_16080 ) ( CLEAR ?auto_16055 ) ( not ( = ?auto_16054 ?auto_16055 ) ) ( not ( = ?auto_16054 ?auto_16080 ) ) ( not ( = ?auto_16055 ?auto_16080 ) ) ( not ( = ?auto_16061 ?auto_16072 ) ) ( IS-CRATE ?auto_16054 ) ( not ( = ?auto_16081 ?auto_16063 ) ) ( HOIST-AT ?auto_16068 ?auto_16081 ) ( AVAILABLE ?auto_16068 ) ( SURFACE-AT ?auto_16054 ?auto_16081 ) ( ON ?auto_16054 ?auto_16069 ) ( CLEAR ?auto_16054 ) ( not ( = ?auto_16053 ?auto_16054 ) ) ( not ( = ?auto_16053 ?auto_16069 ) ) ( not ( = ?auto_16054 ?auto_16069 ) ) ( not ( = ?auto_16061 ?auto_16068 ) ) ( IS-CRATE ?auto_16053 ) ( not ( = ?auto_16079 ?auto_16063 ) ) ( HOIST-AT ?auto_16075 ?auto_16079 ) ( AVAILABLE ?auto_16075 ) ( SURFACE-AT ?auto_16053 ?auto_16079 ) ( ON ?auto_16053 ?auto_16067 ) ( CLEAR ?auto_16053 ) ( not ( = ?auto_16052 ?auto_16053 ) ) ( not ( = ?auto_16052 ?auto_16067 ) ) ( not ( = ?auto_16053 ?auto_16067 ) ) ( not ( = ?auto_16061 ?auto_16075 ) ) ( IS-CRATE ?auto_16052 ) ( AVAILABLE ?auto_16059 ) ( SURFACE-AT ?auto_16052 ?auto_16060 ) ( ON ?auto_16052 ?auto_16070 ) ( CLEAR ?auto_16052 ) ( not ( = ?auto_16051 ?auto_16052 ) ) ( not ( = ?auto_16051 ?auto_16070 ) ) ( not ( = ?auto_16052 ?auto_16070 ) ) ( SURFACE-AT ?auto_16050 ?auto_16063 ) ( CLEAR ?auto_16050 ) ( IS-CRATE ?auto_16051 ) ( AVAILABLE ?auto_16061 ) ( not ( = ?auto_16074 ?auto_16063 ) ) ( HOIST-AT ?auto_16078 ?auto_16074 ) ( AVAILABLE ?auto_16078 ) ( SURFACE-AT ?auto_16051 ?auto_16074 ) ( ON ?auto_16051 ?auto_16066 ) ( CLEAR ?auto_16051 ) ( TRUCK-AT ?auto_16062 ?auto_16063 ) ( not ( = ?auto_16050 ?auto_16051 ) ) ( not ( = ?auto_16050 ?auto_16066 ) ) ( not ( = ?auto_16051 ?auto_16066 ) ) ( not ( = ?auto_16061 ?auto_16078 ) ) ( not ( = ?auto_16050 ?auto_16052 ) ) ( not ( = ?auto_16050 ?auto_16070 ) ) ( not ( = ?auto_16052 ?auto_16066 ) ) ( not ( = ?auto_16060 ?auto_16074 ) ) ( not ( = ?auto_16059 ?auto_16078 ) ) ( not ( = ?auto_16070 ?auto_16066 ) ) ( not ( = ?auto_16050 ?auto_16053 ) ) ( not ( = ?auto_16050 ?auto_16067 ) ) ( not ( = ?auto_16051 ?auto_16053 ) ) ( not ( = ?auto_16051 ?auto_16067 ) ) ( not ( = ?auto_16053 ?auto_16070 ) ) ( not ( = ?auto_16053 ?auto_16066 ) ) ( not ( = ?auto_16079 ?auto_16060 ) ) ( not ( = ?auto_16079 ?auto_16074 ) ) ( not ( = ?auto_16075 ?auto_16059 ) ) ( not ( = ?auto_16075 ?auto_16078 ) ) ( not ( = ?auto_16067 ?auto_16070 ) ) ( not ( = ?auto_16067 ?auto_16066 ) ) ( not ( = ?auto_16050 ?auto_16054 ) ) ( not ( = ?auto_16050 ?auto_16069 ) ) ( not ( = ?auto_16051 ?auto_16054 ) ) ( not ( = ?auto_16051 ?auto_16069 ) ) ( not ( = ?auto_16052 ?auto_16054 ) ) ( not ( = ?auto_16052 ?auto_16069 ) ) ( not ( = ?auto_16054 ?auto_16067 ) ) ( not ( = ?auto_16054 ?auto_16070 ) ) ( not ( = ?auto_16054 ?auto_16066 ) ) ( not ( = ?auto_16081 ?auto_16079 ) ) ( not ( = ?auto_16081 ?auto_16060 ) ) ( not ( = ?auto_16081 ?auto_16074 ) ) ( not ( = ?auto_16068 ?auto_16075 ) ) ( not ( = ?auto_16068 ?auto_16059 ) ) ( not ( = ?auto_16068 ?auto_16078 ) ) ( not ( = ?auto_16069 ?auto_16067 ) ) ( not ( = ?auto_16069 ?auto_16070 ) ) ( not ( = ?auto_16069 ?auto_16066 ) ) ( not ( = ?auto_16050 ?auto_16055 ) ) ( not ( = ?auto_16050 ?auto_16080 ) ) ( not ( = ?auto_16051 ?auto_16055 ) ) ( not ( = ?auto_16051 ?auto_16080 ) ) ( not ( = ?auto_16052 ?auto_16055 ) ) ( not ( = ?auto_16052 ?auto_16080 ) ) ( not ( = ?auto_16053 ?auto_16055 ) ) ( not ( = ?auto_16053 ?auto_16080 ) ) ( not ( = ?auto_16055 ?auto_16069 ) ) ( not ( = ?auto_16055 ?auto_16067 ) ) ( not ( = ?auto_16055 ?auto_16070 ) ) ( not ( = ?auto_16055 ?auto_16066 ) ) ( not ( = ?auto_16065 ?auto_16081 ) ) ( not ( = ?auto_16065 ?auto_16079 ) ) ( not ( = ?auto_16065 ?auto_16060 ) ) ( not ( = ?auto_16065 ?auto_16074 ) ) ( not ( = ?auto_16072 ?auto_16068 ) ) ( not ( = ?auto_16072 ?auto_16075 ) ) ( not ( = ?auto_16072 ?auto_16059 ) ) ( not ( = ?auto_16072 ?auto_16078 ) ) ( not ( = ?auto_16080 ?auto_16069 ) ) ( not ( = ?auto_16080 ?auto_16067 ) ) ( not ( = ?auto_16080 ?auto_16070 ) ) ( not ( = ?auto_16080 ?auto_16066 ) ) ( not ( = ?auto_16050 ?auto_16056 ) ) ( not ( = ?auto_16050 ?auto_16076 ) ) ( not ( = ?auto_16051 ?auto_16056 ) ) ( not ( = ?auto_16051 ?auto_16076 ) ) ( not ( = ?auto_16052 ?auto_16056 ) ) ( not ( = ?auto_16052 ?auto_16076 ) ) ( not ( = ?auto_16053 ?auto_16056 ) ) ( not ( = ?auto_16053 ?auto_16076 ) ) ( not ( = ?auto_16054 ?auto_16056 ) ) ( not ( = ?auto_16054 ?auto_16076 ) ) ( not ( = ?auto_16056 ?auto_16080 ) ) ( not ( = ?auto_16056 ?auto_16069 ) ) ( not ( = ?auto_16056 ?auto_16067 ) ) ( not ( = ?auto_16056 ?auto_16070 ) ) ( not ( = ?auto_16056 ?auto_16066 ) ) ( not ( = ?auto_16073 ?auto_16065 ) ) ( not ( = ?auto_16073 ?auto_16081 ) ) ( not ( = ?auto_16073 ?auto_16079 ) ) ( not ( = ?auto_16073 ?auto_16060 ) ) ( not ( = ?auto_16073 ?auto_16074 ) ) ( not ( = ?auto_16071 ?auto_16072 ) ) ( not ( = ?auto_16071 ?auto_16068 ) ) ( not ( = ?auto_16071 ?auto_16075 ) ) ( not ( = ?auto_16071 ?auto_16059 ) ) ( not ( = ?auto_16071 ?auto_16078 ) ) ( not ( = ?auto_16076 ?auto_16080 ) ) ( not ( = ?auto_16076 ?auto_16069 ) ) ( not ( = ?auto_16076 ?auto_16067 ) ) ( not ( = ?auto_16076 ?auto_16070 ) ) ( not ( = ?auto_16076 ?auto_16066 ) ) ( not ( = ?auto_16050 ?auto_16057 ) ) ( not ( = ?auto_16050 ?auto_16077 ) ) ( not ( = ?auto_16051 ?auto_16057 ) ) ( not ( = ?auto_16051 ?auto_16077 ) ) ( not ( = ?auto_16052 ?auto_16057 ) ) ( not ( = ?auto_16052 ?auto_16077 ) ) ( not ( = ?auto_16053 ?auto_16057 ) ) ( not ( = ?auto_16053 ?auto_16077 ) ) ( not ( = ?auto_16054 ?auto_16057 ) ) ( not ( = ?auto_16054 ?auto_16077 ) ) ( not ( = ?auto_16055 ?auto_16057 ) ) ( not ( = ?auto_16055 ?auto_16077 ) ) ( not ( = ?auto_16057 ?auto_16076 ) ) ( not ( = ?auto_16057 ?auto_16080 ) ) ( not ( = ?auto_16057 ?auto_16069 ) ) ( not ( = ?auto_16057 ?auto_16067 ) ) ( not ( = ?auto_16057 ?auto_16070 ) ) ( not ( = ?auto_16057 ?auto_16066 ) ) ( not ( = ?auto_16077 ?auto_16076 ) ) ( not ( = ?auto_16077 ?auto_16080 ) ) ( not ( = ?auto_16077 ?auto_16069 ) ) ( not ( = ?auto_16077 ?auto_16067 ) ) ( not ( = ?auto_16077 ?auto_16070 ) ) ( not ( = ?auto_16077 ?auto_16066 ) ) ( not ( = ?auto_16050 ?auto_16058 ) ) ( not ( = ?auto_16050 ?auto_16064 ) ) ( not ( = ?auto_16051 ?auto_16058 ) ) ( not ( = ?auto_16051 ?auto_16064 ) ) ( not ( = ?auto_16052 ?auto_16058 ) ) ( not ( = ?auto_16052 ?auto_16064 ) ) ( not ( = ?auto_16053 ?auto_16058 ) ) ( not ( = ?auto_16053 ?auto_16064 ) ) ( not ( = ?auto_16054 ?auto_16058 ) ) ( not ( = ?auto_16054 ?auto_16064 ) ) ( not ( = ?auto_16055 ?auto_16058 ) ) ( not ( = ?auto_16055 ?auto_16064 ) ) ( not ( = ?auto_16056 ?auto_16058 ) ) ( not ( = ?auto_16056 ?auto_16064 ) ) ( not ( = ?auto_16058 ?auto_16077 ) ) ( not ( = ?auto_16058 ?auto_16076 ) ) ( not ( = ?auto_16058 ?auto_16080 ) ) ( not ( = ?auto_16058 ?auto_16069 ) ) ( not ( = ?auto_16058 ?auto_16067 ) ) ( not ( = ?auto_16058 ?auto_16070 ) ) ( not ( = ?auto_16058 ?auto_16066 ) ) ( not ( = ?auto_16064 ?auto_16077 ) ) ( not ( = ?auto_16064 ?auto_16076 ) ) ( not ( = ?auto_16064 ?auto_16080 ) ) ( not ( = ?auto_16064 ?auto_16069 ) ) ( not ( = ?auto_16064 ?auto_16067 ) ) ( not ( = ?auto_16064 ?auto_16070 ) ) ( not ( = ?auto_16064 ?auto_16066 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_16050 ?auto_16051 ?auto_16052 ?auto_16053 ?auto_16054 ?auto_16055 ?auto_16056 ?auto_16057 )
      ( MAKE-1CRATE ?auto_16057 ?auto_16058 )
      ( MAKE-8CRATE-VERIFY ?auto_16050 ?auto_16051 ?auto_16052 ?auto_16053 ?auto_16054 ?auto_16055 ?auto_16056 ?auto_16057 ?auto_16058 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_16102 - SURFACE
      ?auto_16103 - SURFACE
      ?auto_16104 - SURFACE
      ?auto_16105 - SURFACE
      ?auto_16106 - SURFACE
      ?auto_16107 - SURFACE
      ?auto_16108 - SURFACE
      ?auto_16109 - SURFACE
      ?auto_16110 - SURFACE
      ?auto_16111 - SURFACE
    )
    :vars
    (
      ?auto_16112 - HOIST
      ?auto_16114 - PLACE
      ?auto_16113 - PLACE
      ?auto_16116 - HOIST
      ?auto_16117 - SURFACE
      ?auto_16122 - SURFACE
      ?auto_16125 - SURFACE
      ?auto_16130 - PLACE
      ?auto_16118 - HOIST
      ?auto_16135 - SURFACE
      ?auto_16127 - PLACE
      ?auto_16131 - HOIST
      ?auto_16128 - SURFACE
      ?auto_16120 - PLACE
      ?auto_16124 - HOIST
      ?auto_16132 - SURFACE
      ?auto_16119 - PLACE
      ?auto_16134 - HOIST
      ?auto_16121 - SURFACE
      ?auto_16133 - SURFACE
      ?auto_16129 - PLACE
      ?auto_16126 - HOIST
      ?auto_16123 - SURFACE
      ?auto_16115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16112 ?auto_16114 ) ( IS-CRATE ?auto_16111 ) ( not ( = ?auto_16113 ?auto_16114 ) ) ( HOIST-AT ?auto_16116 ?auto_16113 ) ( SURFACE-AT ?auto_16111 ?auto_16113 ) ( ON ?auto_16111 ?auto_16117 ) ( CLEAR ?auto_16111 ) ( not ( = ?auto_16110 ?auto_16111 ) ) ( not ( = ?auto_16110 ?auto_16117 ) ) ( not ( = ?auto_16111 ?auto_16117 ) ) ( not ( = ?auto_16112 ?auto_16116 ) ) ( IS-CRATE ?auto_16110 ) ( SURFACE-AT ?auto_16110 ?auto_16113 ) ( ON ?auto_16110 ?auto_16122 ) ( CLEAR ?auto_16110 ) ( not ( = ?auto_16109 ?auto_16110 ) ) ( not ( = ?auto_16109 ?auto_16122 ) ) ( not ( = ?auto_16110 ?auto_16122 ) ) ( IS-CRATE ?auto_16109 ) ( SURFACE-AT ?auto_16109 ?auto_16113 ) ( ON ?auto_16109 ?auto_16125 ) ( CLEAR ?auto_16109 ) ( not ( = ?auto_16108 ?auto_16109 ) ) ( not ( = ?auto_16108 ?auto_16125 ) ) ( not ( = ?auto_16109 ?auto_16125 ) ) ( IS-CRATE ?auto_16108 ) ( not ( = ?auto_16130 ?auto_16114 ) ) ( HOIST-AT ?auto_16118 ?auto_16130 ) ( AVAILABLE ?auto_16118 ) ( SURFACE-AT ?auto_16108 ?auto_16130 ) ( ON ?auto_16108 ?auto_16135 ) ( CLEAR ?auto_16108 ) ( not ( = ?auto_16107 ?auto_16108 ) ) ( not ( = ?auto_16107 ?auto_16135 ) ) ( not ( = ?auto_16108 ?auto_16135 ) ) ( not ( = ?auto_16112 ?auto_16118 ) ) ( IS-CRATE ?auto_16107 ) ( not ( = ?auto_16127 ?auto_16114 ) ) ( HOIST-AT ?auto_16131 ?auto_16127 ) ( AVAILABLE ?auto_16131 ) ( SURFACE-AT ?auto_16107 ?auto_16127 ) ( ON ?auto_16107 ?auto_16128 ) ( CLEAR ?auto_16107 ) ( not ( = ?auto_16106 ?auto_16107 ) ) ( not ( = ?auto_16106 ?auto_16128 ) ) ( not ( = ?auto_16107 ?auto_16128 ) ) ( not ( = ?auto_16112 ?auto_16131 ) ) ( IS-CRATE ?auto_16106 ) ( not ( = ?auto_16120 ?auto_16114 ) ) ( HOIST-AT ?auto_16124 ?auto_16120 ) ( AVAILABLE ?auto_16124 ) ( SURFACE-AT ?auto_16106 ?auto_16120 ) ( ON ?auto_16106 ?auto_16132 ) ( CLEAR ?auto_16106 ) ( not ( = ?auto_16105 ?auto_16106 ) ) ( not ( = ?auto_16105 ?auto_16132 ) ) ( not ( = ?auto_16106 ?auto_16132 ) ) ( not ( = ?auto_16112 ?auto_16124 ) ) ( IS-CRATE ?auto_16105 ) ( not ( = ?auto_16119 ?auto_16114 ) ) ( HOIST-AT ?auto_16134 ?auto_16119 ) ( AVAILABLE ?auto_16134 ) ( SURFACE-AT ?auto_16105 ?auto_16119 ) ( ON ?auto_16105 ?auto_16121 ) ( CLEAR ?auto_16105 ) ( not ( = ?auto_16104 ?auto_16105 ) ) ( not ( = ?auto_16104 ?auto_16121 ) ) ( not ( = ?auto_16105 ?auto_16121 ) ) ( not ( = ?auto_16112 ?auto_16134 ) ) ( IS-CRATE ?auto_16104 ) ( AVAILABLE ?auto_16116 ) ( SURFACE-AT ?auto_16104 ?auto_16113 ) ( ON ?auto_16104 ?auto_16133 ) ( CLEAR ?auto_16104 ) ( not ( = ?auto_16103 ?auto_16104 ) ) ( not ( = ?auto_16103 ?auto_16133 ) ) ( not ( = ?auto_16104 ?auto_16133 ) ) ( SURFACE-AT ?auto_16102 ?auto_16114 ) ( CLEAR ?auto_16102 ) ( IS-CRATE ?auto_16103 ) ( AVAILABLE ?auto_16112 ) ( not ( = ?auto_16129 ?auto_16114 ) ) ( HOIST-AT ?auto_16126 ?auto_16129 ) ( AVAILABLE ?auto_16126 ) ( SURFACE-AT ?auto_16103 ?auto_16129 ) ( ON ?auto_16103 ?auto_16123 ) ( CLEAR ?auto_16103 ) ( TRUCK-AT ?auto_16115 ?auto_16114 ) ( not ( = ?auto_16102 ?auto_16103 ) ) ( not ( = ?auto_16102 ?auto_16123 ) ) ( not ( = ?auto_16103 ?auto_16123 ) ) ( not ( = ?auto_16112 ?auto_16126 ) ) ( not ( = ?auto_16102 ?auto_16104 ) ) ( not ( = ?auto_16102 ?auto_16133 ) ) ( not ( = ?auto_16104 ?auto_16123 ) ) ( not ( = ?auto_16113 ?auto_16129 ) ) ( not ( = ?auto_16116 ?auto_16126 ) ) ( not ( = ?auto_16133 ?auto_16123 ) ) ( not ( = ?auto_16102 ?auto_16105 ) ) ( not ( = ?auto_16102 ?auto_16121 ) ) ( not ( = ?auto_16103 ?auto_16105 ) ) ( not ( = ?auto_16103 ?auto_16121 ) ) ( not ( = ?auto_16105 ?auto_16133 ) ) ( not ( = ?auto_16105 ?auto_16123 ) ) ( not ( = ?auto_16119 ?auto_16113 ) ) ( not ( = ?auto_16119 ?auto_16129 ) ) ( not ( = ?auto_16134 ?auto_16116 ) ) ( not ( = ?auto_16134 ?auto_16126 ) ) ( not ( = ?auto_16121 ?auto_16133 ) ) ( not ( = ?auto_16121 ?auto_16123 ) ) ( not ( = ?auto_16102 ?auto_16106 ) ) ( not ( = ?auto_16102 ?auto_16132 ) ) ( not ( = ?auto_16103 ?auto_16106 ) ) ( not ( = ?auto_16103 ?auto_16132 ) ) ( not ( = ?auto_16104 ?auto_16106 ) ) ( not ( = ?auto_16104 ?auto_16132 ) ) ( not ( = ?auto_16106 ?auto_16121 ) ) ( not ( = ?auto_16106 ?auto_16133 ) ) ( not ( = ?auto_16106 ?auto_16123 ) ) ( not ( = ?auto_16120 ?auto_16119 ) ) ( not ( = ?auto_16120 ?auto_16113 ) ) ( not ( = ?auto_16120 ?auto_16129 ) ) ( not ( = ?auto_16124 ?auto_16134 ) ) ( not ( = ?auto_16124 ?auto_16116 ) ) ( not ( = ?auto_16124 ?auto_16126 ) ) ( not ( = ?auto_16132 ?auto_16121 ) ) ( not ( = ?auto_16132 ?auto_16133 ) ) ( not ( = ?auto_16132 ?auto_16123 ) ) ( not ( = ?auto_16102 ?auto_16107 ) ) ( not ( = ?auto_16102 ?auto_16128 ) ) ( not ( = ?auto_16103 ?auto_16107 ) ) ( not ( = ?auto_16103 ?auto_16128 ) ) ( not ( = ?auto_16104 ?auto_16107 ) ) ( not ( = ?auto_16104 ?auto_16128 ) ) ( not ( = ?auto_16105 ?auto_16107 ) ) ( not ( = ?auto_16105 ?auto_16128 ) ) ( not ( = ?auto_16107 ?auto_16132 ) ) ( not ( = ?auto_16107 ?auto_16121 ) ) ( not ( = ?auto_16107 ?auto_16133 ) ) ( not ( = ?auto_16107 ?auto_16123 ) ) ( not ( = ?auto_16127 ?auto_16120 ) ) ( not ( = ?auto_16127 ?auto_16119 ) ) ( not ( = ?auto_16127 ?auto_16113 ) ) ( not ( = ?auto_16127 ?auto_16129 ) ) ( not ( = ?auto_16131 ?auto_16124 ) ) ( not ( = ?auto_16131 ?auto_16134 ) ) ( not ( = ?auto_16131 ?auto_16116 ) ) ( not ( = ?auto_16131 ?auto_16126 ) ) ( not ( = ?auto_16128 ?auto_16132 ) ) ( not ( = ?auto_16128 ?auto_16121 ) ) ( not ( = ?auto_16128 ?auto_16133 ) ) ( not ( = ?auto_16128 ?auto_16123 ) ) ( not ( = ?auto_16102 ?auto_16108 ) ) ( not ( = ?auto_16102 ?auto_16135 ) ) ( not ( = ?auto_16103 ?auto_16108 ) ) ( not ( = ?auto_16103 ?auto_16135 ) ) ( not ( = ?auto_16104 ?auto_16108 ) ) ( not ( = ?auto_16104 ?auto_16135 ) ) ( not ( = ?auto_16105 ?auto_16108 ) ) ( not ( = ?auto_16105 ?auto_16135 ) ) ( not ( = ?auto_16106 ?auto_16108 ) ) ( not ( = ?auto_16106 ?auto_16135 ) ) ( not ( = ?auto_16108 ?auto_16128 ) ) ( not ( = ?auto_16108 ?auto_16132 ) ) ( not ( = ?auto_16108 ?auto_16121 ) ) ( not ( = ?auto_16108 ?auto_16133 ) ) ( not ( = ?auto_16108 ?auto_16123 ) ) ( not ( = ?auto_16130 ?auto_16127 ) ) ( not ( = ?auto_16130 ?auto_16120 ) ) ( not ( = ?auto_16130 ?auto_16119 ) ) ( not ( = ?auto_16130 ?auto_16113 ) ) ( not ( = ?auto_16130 ?auto_16129 ) ) ( not ( = ?auto_16118 ?auto_16131 ) ) ( not ( = ?auto_16118 ?auto_16124 ) ) ( not ( = ?auto_16118 ?auto_16134 ) ) ( not ( = ?auto_16118 ?auto_16116 ) ) ( not ( = ?auto_16118 ?auto_16126 ) ) ( not ( = ?auto_16135 ?auto_16128 ) ) ( not ( = ?auto_16135 ?auto_16132 ) ) ( not ( = ?auto_16135 ?auto_16121 ) ) ( not ( = ?auto_16135 ?auto_16133 ) ) ( not ( = ?auto_16135 ?auto_16123 ) ) ( not ( = ?auto_16102 ?auto_16109 ) ) ( not ( = ?auto_16102 ?auto_16125 ) ) ( not ( = ?auto_16103 ?auto_16109 ) ) ( not ( = ?auto_16103 ?auto_16125 ) ) ( not ( = ?auto_16104 ?auto_16109 ) ) ( not ( = ?auto_16104 ?auto_16125 ) ) ( not ( = ?auto_16105 ?auto_16109 ) ) ( not ( = ?auto_16105 ?auto_16125 ) ) ( not ( = ?auto_16106 ?auto_16109 ) ) ( not ( = ?auto_16106 ?auto_16125 ) ) ( not ( = ?auto_16107 ?auto_16109 ) ) ( not ( = ?auto_16107 ?auto_16125 ) ) ( not ( = ?auto_16109 ?auto_16135 ) ) ( not ( = ?auto_16109 ?auto_16128 ) ) ( not ( = ?auto_16109 ?auto_16132 ) ) ( not ( = ?auto_16109 ?auto_16121 ) ) ( not ( = ?auto_16109 ?auto_16133 ) ) ( not ( = ?auto_16109 ?auto_16123 ) ) ( not ( = ?auto_16125 ?auto_16135 ) ) ( not ( = ?auto_16125 ?auto_16128 ) ) ( not ( = ?auto_16125 ?auto_16132 ) ) ( not ( = ?auto_16125 ?auto_16121 ) ) ( not ( = ?auto_16125 ?auto_16133 ) ) ( not ( = ?auto_16125 ?auto_16123 ) ) ( not ( = ?auto_16102 ?auto_16110 ) ) ( not ( = ?auto_16102 ?auto_16122 ) ) ( not ( = ?auto_16103 ?auto_16110 ) ) ( not ( = ?auto_16103 ?auto_16122 ) ) ( not ( = ?auto_16104 ?auto_16110 ) ) ( not ( = ?auto_16104 ?auto_16122 ) ) ( not ( = ?auto_16105 ?auto_16110 ) ) ( not ( = ?auto_16105 ?auto_16122 ) ) ( not ( = ?auto_16106 ?auto_16110 ) ) ( not ( = ?auto_16106 ?auto_16122 ) ) ( not ( = ?auto_16107 ?auto_16110 ) ) ( not ( = ?auto_16107 ?auto_16122 ) ) ( not ( = ?auto_16108 ?auto_16110 ) ) ( not ( = ?auto_16108 ?auto_16122 ) ) ( not ( = ?auto_16110 ?auto_16125 ) ) ( not ( = ?auto_16110 ?auto_16135 ) ) ( not ( = ?auto_16110 ?auto_16128 ) ) ( not ( = ?auto_16110 ?auto_16132 ) ) ( not ( = ?auto_16110 ?auto_16121 ) ) ( not ( = ?auto_16110 ?auto_16133 ) ) ( not ( = ?auto_16110 ?auto_16123 ) ) ( not ( = ?auto_16122 ?auto_16125 ) ) ( not ( = ?auto_16122 ?auto_16135 ) ) ( not ( = ?auto_16122 ?auto_16128 ) ) ( not ( = ?auto_16122 ?auto_16132 ) ) ( not ( = ?auto_16122 ?auto_16121 ) ) ( not ( = ?auto_16122 ?auto_16133 ) ) ( not ( = ?auto_16122 ?auto_16123 ) ) ( not ( = ?auto_16102 ?auto_16111 ) ) ( not ( = ?auto_16102 ?auto_16117 ) ) ( not ( = ?auto_16103 ?auto_16111 ) ) ( not ( = ?auto_16103 ?auto_16117 ) ) ( not ( = ?auto_16104 ?auto_16111 ) ) ( not ( = ?auto_16104 ?auto_16117 ) ) ( not ( = ?auto_16105 ?auto_16111 ) ) ( not ( = ?auto_16105 ?auto_16117 ) ) ( not ( = ?auto_16106 ?auto_16111 ) ) ( not ( = ?auto_16106 ?auto_16117 ) ) ( not ( = ?auto_16107 ?auto_16111 ) ) ( not ( = ?auto_16107 ?auto_16117 ) ) ( not ( = ?auto_16108 ?auto_16111 ) ) ( not ( = ?auto_16108 ?auto_16117 ) ) ( not ( = ?auto_16109 ?auto_16111 ) ) ( not ( = ?auto_16109 ?auto_16117 ) ) ( not ( = ?auto_16111 ?auto_16122 ) ) ( not ( = ?auto_16111 ?auto_16125 ) ) ( not ( = ?auto_16111 ?auto_16135 ) ) ( not ( = ?auto_16111 ?auto_16128 ) ) ( not ( = ?auto_16111 ?auto_16132 ) ) ( not ( = ?auto_16111 ?auto_16121 ) ) ( not ( = ?auto_16111 ?auto_16133 ) ) ( not ( = ?auto_16111 ?auto_16123 ) ) ( not ( = ?auto_16117 ?auto_16122 ) ) ( not ( = ?auto_16117 ?auto_16125 ) ) ( not ( = ?auto_16117 ?auto_16135 ) ) ( not ( = ?auto_16117 ?auto_16128 ) ) ( not ( = ?auto_16117 ?auto_16132 ) ) ( not ( = ?auto_16117 ?auto_16121 ) ) ( not ( = ?auto_16117 ?auto_16133 ) ) ( not ( = ?auto_16117 ?auto_16123 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_16102 ?auto_16103 ?auto_16104 ?auto_16105 ?auto_16106 ?auto_16107 ?auto_16108 ?auto_16109 ?auto_16110 )
      ( MAKE-1CRATE ?auto_16110 ?auto_16111 )
      ( MAKE-9CRATE-VERIFY ?auto_16102 ?auto_16103 ?auto_16104 ?auto_16105 ?auto_16106 ?auto_16107 ?auto_16108 ?auto_16109 ?auto_16110 ?auto_16111 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_16157 - SURFACE
      ?auto_16158 - SURFACE
      ?auto_16159 - SURFACE
      ?auto_16160 - SURFACE
      ?auto_16161 - SURFACE
      ?auto_16162 - SURFACE
      ?auto_16163 - SURFACE
      ?auto_16164 - SURFACE
      ?auto_16165 - SURFACE
      ?auto_16166 - SURFACE
      ?auto_16167 - SURFACE
    )
    :vars
    (
      ?auto_16169 - HOIST
      ?auto_16172 - PLACE
      ?auto_16173 - PLACE
      ?auto_16171 - HOIST
      ?auto_16170 - SURFACE
      ?auto_16179 - PLACE
      ?auto_16177 - HOIST
      ?auto_16193 - SURFACE
      ?auto_16190 - SURFACE
      ?auto_16175 - SURFACE
      ?auto_16187 - PLACE
      ?auto_16180 - HOIST
      ?auto_16192 - SURFACE
      ?auto_16182 - PLACE
      ?auto_16181 - HOIST
      ?auto_16183 - SURFACE
      ?auto_16184 - PLACE
      ?auto_16188 - HOIST
      ?auto_16176 - SURFACE
      ?auto_16178 - PLACE
      ?auto_16185 - HOIST
      ?auto_16191 - SURFACE
      ?auto_16174 - SURFACE
      ?auto_16194 - PLACE
      ?auto_16186 - HOIST
      ?auto_16189 - SURFACE
      ?auto_16168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16169 ?auto_16172 ) ( IS-CRATE ?auto_16167 ) ( not ( = ?auto_16173 ?auto_16172 ) ) ( HOIST-AT ?auto_16171 ?auto_16173 ) ( AVAILABLE ?auto_16171 ) ( SURFACE-AT ?auto_16167 ?auto_16173 ) ( ON ?auto_16167 ?auto_16170 ) ( CLEAR ?auto_16167 ) ( not ( = ?auto_16166 ?auto_16167 ) ) ( not ( = ?auto_16166 ?auto_16170 ) ) ( not ( = ?auto_16167 ?auto_16170 ) ) ( not ( = ?auto_16169 ?auto_16171 ) ) ( IS-CRATE ?auto_16166 ) ( not ( = ?auto_16179 ?auto_16172 ) ) ( HOIST-AT ?auto_16177 ?auto_16179 ) ( SURFACE-AT ?auto_16166 ?auto_16179 ) ( ON ?auto_16166 ?auto_16193 ) ( CLEAR ?auto_16166 ) ( not ( = ?auto_16165 ?auto_16166 ) ) ( not ( = ?auto_16165 ?auto_16193 ) ) ( not ( = ?auto_16166 ?auto_16193 ) ) ( not ( = ?auto_16169 ?auto_16177 ) ) ( IS-CRATE ?auto_16165 ) ( SURFACE-AT ?auto_16165 ?auto_16179 ) ( ON ?auto_16165 ?auto_16190 ) ( CLEAR ?auto_16165 ) ( not ( = ?auto_16164 ?auto_16165 ) ) ( not ( = ?auto_16164 ?auto_16190 ) ) ( not ( = ?auto_16165 ?auto_16190 ) ) ( IS-CRATE ?auto_16164 ) ( SURFACE-AT ?auto_16164 ?auto_16179 ) ( ON ?auto_16164 ?auto_16175 ) ( CLEAR ?auto_16164 ) ( not ( = ?auto_16163 ?auto_16164 ) ) ( not ( = ?auto_16163 ?auto_16175 ) ) ( not ( = ?auto_16164 ?auto_16175 ) ) ( IS-CRATE ?auto_16163 ) ( not ( = ?auto_16187 ?auto_16172 ) ) ( HOIST-AT ?auto_16180 ?auto_16187 ) ( AVAILABLE ?auto_16180 ) ( SURFACE-AT ?auto_16163 ?auto_16187 ) ( ON ?auto_16163 ?auto_16192 ) ( CLEAR ?auto_16163 ) ( not ( = ?auto_16162 ?auto_16163 ) ) ( not ( = ?auto_16162 ?auto_16192 ) ) ( not ( = ?auto_16163 ?auto_16192 ) ) ( not ( = ?auto_16169 ?auto_16180 ) ) ( IS-CRATE ?auto_16162 ) ( not ( = ?auto_16182 ?auto_16172 ) ) ( HOIST-AT ?auto_16181 ?auto_16182 ) ( AVAILABLE ?auto_16181 ) ( SURFACE-AT ?auto_16162 ?auto_16182 ) ( ON ?auto_16162 ?auto_16183 ) ( CLEAR ?auto_16162 ) ( not ( = ?auto_16161 ?auto_16162 ) ) ( not ( = ?auto_16161 ?auto_16183 ) ) ( not ( = ?auto_16162 ?auto_16183 ) ) ( not ( = ?auto_16169 ?auto_16181 ) ) ( IS-CRATE ?auto_16161 ) ( not ( = ?auto_16184 ?auto_16172 ) ) ( HOIST-AT ?auto_16188 ?auto_16184 ) ( AVAILABLE ?auto_16188 ) ( SURFACE-AT ?auto_16161 ?auto_16184 ) ( ON ?auto_16161 ?auto_16176 ) ( CLEAR ?auto_16161 ) ( not ( = ?auto_16160 ?auto_16161 ) ) ( not ( = ?auto_16160 ?auto_16176 ) ) ( not ( = ?auto_16161 ?auto_16176 ) ) ( not ( = ?auto_16169 ?auto_16188 ) ) ( IS-CRATE ?auto_16160 ) ( not ( = ?auto_16178 ?auto_16172 ) ) ( HOIST-AT ?auto_16185 ?auto_16178 ) ( AVAILABLE ?auto_16185 ) ( SURFACE-AT ?auto_16160 ?auto_16178 ) ( ON ?auto_16160 ?auto_16191 ) ( CLEAR ?auto_16160 ) ( not ( = ?auto_16159 ?auto_16160 ) ) ( not ( = ?auto_16159 ?auto_16191 ) ) ( not ( = ?auto_16160 ?auto_16191 ) ) ( not ( = ?auto_16169 ?auto_16185 ) ) ( IS-CRATE ?auto_16159 ) ( AVAILABLE ?auto_16177 ) ( SURFACE-AT ?auto_16159 ?auto_16179 ) ( ON ?auto_16159 ?auto_16174 ) ( CLEAR ?auto_16159 ) ( not ( = ?auto_16158 ?auto_16159 ) ) ( not ( = ?auto_16158 ?auto_16174 ) ) ( not ( = ?auto_16159 ?auto_16174 ) ) ( SURFACE-AT ?auto_16157 ?auto_16172 ) ( CLEAR ?auto_16157 ) ( IS-CRATE ?auto_16158 ) ( AVAILABLE ?auto_16169 ) ( not ( = ?auto_16194 ?auto_16172 ) ) ( HOIST-AT ?auto_16186 ?auto_16194 ) ( AVAILABLE ?auto_16186 ) ( SURFACE-AT ?auto_16158 ?auto_16194 ) ( ON ?auto_16158 ?auto_16189 ) ( CLEAR ?auto_16158 ) ( TRUCK-AT ?auto_16168 ?auto_16172 ) ( not ( = ?auto_16157 ?auto_16158 ) ) ( not ( = ?auto_16157 ?auto_16189 ) ) ( not ( = ?auto_16158 ?auto_16189 ) ) ( not ( = ?auto_16169 ?auto_16186 ) ) ( not ( = ?auto_16157 ?auto_16159 ) ) ( not ( = ?auto_16157 ?auto_16174 ) ) ( not ( = ?auto_16159 ?auto_16189 ) ) ( not ( = ?auto_16179 ?auto_16194 ) ) ( not ( = ?auto_16177 ?auto_16186 ) ) ( not ( = ?auto_16174 ?auto_16189 ) ) ( not ( = ?auto_16157 ?auto_16160 ) ) ( not ( = ?auto_16157 ?auto_16191 ) ) ( not ( = ?auto_16158 ?auto_16160 ) ) ( not ( = ?auto_16158 ?auto_16191 ) ) ( not ( = ?auto_16160 ?auto_16174 ) ) ( not ( = ?auto_16160 ?auto_16189 ) ) ( not ( = ?auto_16178 ?auto_16179 ) ) ( not ( = ?auto_16178 ?auto_16194 ) ) ( not ( = ?auto_16185 ?auto_16177 ) ) ( not ( = ?auto_16185 ?auto_16186 ) ) ( not ( = ?auto_16191 ?auto_16174 ) ) ( not ( = ?auto_16191 ?auto_16189 ) ) ( not ( = ?auto_16157 ?auto_16161 ) ) ( not ( = ?auto_16157 ?auto_16176 ) ) ( not ( = ?auto_16158 ?auto_16161 ) ) ( not ( = ?auto_16158 ?auto_16176 ) ) ( not ( = ?auto_16159 ?auto_16161 ) ) ( not ( = ?auto_16159 ?auto_16176 ) ) ( not ( = ?auto_16161 ?auto_16191 ) ) ( not ( = ?auto_16161 ?auto_16174 ) ) ( not ( = ?auto_16161 ?auto_16189 ) ) ( not ( = ?auto_16184 ?auto_16178 ) ) ( not ( = ?auto_16184 ?auto_16179 ) ) ( not ( = ?auto_16184 ?auto_16194 ) ) ( not ( = ?auto_16188 ?auto_16185 ) ) ( not ( = ?auto_16188 ?auto_16177 ) ) ( not ( = ?auto_16188 ?auto_16186 ) ) ( not ( = ?auto_16176 ?auto_16191 ) ) ( not ( = ?auto_16176 ?auto_16174 ) ) ( not ( = ?auto_16176 ?auto_16189 ) ) ( not ( = ?auto_16157 ?auto_16162 ) ) ( not ( = ?auto_16157 ?auto_16183 ) ) ( not ( = ?auto_16158 ?auto_16162 ) ) ( not ( = ?auto_16158 ?auto_16183 ) ) ( not ( = ?auto_16159 ?auto_16162 ) ) ( not ( = ?auto_16159 ?auto_16183 ) ) ( not ( = ?auto_16160 ?auto_16162 ) ) ( not ( = ?auto_16160 ?auto_16183 ) ) ( not ( = ?auto_16162 ?auto_16176 ) ) ( not ( = ?auto_16162 ?auto_16191 ) ) ( not ( = ?auto_16162 ?auto_16174 ) ) ( not ( = ?auto_16162 ?auto_16189 ) ) ( not ( = ?auto_16182 ?auto_16184 ) ) ( not ( = ?auto_16182 ?auto_16178 ) ) ( not ( = ?auto_16182 ?auto_16179 ) ) ( not ( = ?auto_16182 ?auto_16194 ) ) ( not ( = ?auto_16181 ?auto_16188 ) ) ( not ( = ?auto_16181 ?auto_16185 ) ) ( not ( = ?auto_16181 ?auto_16177 ) ) ( not ( = ?auto_16181 ?auto_16186 ) ) ( not ( = ?auto_16183 ?auto_16176 ) ) ( not ( = ?auto_16183 ?auto_16191 ) ) ( not ( = ?auto_16183 ?auto_16174 ) ) ( not ( = ?auto_16183 ?auto_16189 ) ) ( not ( = ?auto_16157 ?auto_16163 ) ) ( not ( = ?auto_16157 ?auto_16192 ) ) ( not ( = ?auto_16158 ?auto_16163 ) ) ( not ( = ?auto_16158 ?auto_16192 ) ) ( not ( = ?auto_16159 ?auto_16163 ) ) ( not ( = ?auto_16159 ?auto_16192 ) ) ( not ( = ?auto_16160 ?auto_16163 ) ) ( not ( = ?auto_16160 ?auto_16192 ) ) ( not ( = ?auto_16161 ?auto_16163 ) ) ( not ( = ?auto_16161 ?auto_16192 ) ) ( not ( = ?auto_16163 ?auto_16183 ) ) ( not ( = ?auto_16163 ?auto_16176 ) ) ( not ( = ?auto_16163 ?auto_16191 ) ) ( not ( = ?auto_16163 ?auto_16174 ) ) ( not ( = ?auto_16163 ?auto_16189 ) ) ( not ( = ?auto_16187 ?auto_16182 ) ) ( not ( = ?auto_16187 ?auto_16184 ) ) ( not ( = ?auto_16187 ?auto_16178 ) ) ( not ( = ?auto_16187 ?auto_16179 ) ) ( not ( = ?auto_16187 ?auto_16194 ) ) ( not ( = ?auto_16180 ?auto_16181 ) ) ( not ( = ?auto_16180 ?auto_16188 ) ) ( not ( = ?auto_16180 ?auto_16185 ) ) ( not ( = ?auto_16180 ?auto_16177 ) ) ( not ( = ?auto_16180 ?auto_16186 ) ) ( not ( = ?auto_16192 ?auto_16183 ) ) ( not ( = ?auto_16192 ?auto_16176 ) ) ( not ( = ?auto_16192 ?auto_16191 ) ) ( not ( = ?auto_16192 ?auto_16174 ) ) ( not ( = ?auto_16192 ?auto_16189 ) ) ( not ( = ?auto_16157 ?auto_16164 ) ) ( not ( = ?auto_16157 ?auto_16175 ) ) ( not ( = ?auto_16158 ?auto_16164 ) ) ( not ( = ?auto_16158 ?auto_16175 ) ) ( not ( = ?auto_16159 ?auto_16164 ) ) ( not ( = ?auto_16159 ?auto_16175 ) ) ( not ( = ?auto_16160 ?auto_16164 ) ) ( not ( = ?auto_16160 ?auto_16175 ) ) ( not ( = ?auto_16161 ?auto_16164 ) ) ( not ( = ?auto_16161 ?auto_16175 ) ) ( not ( = ?auto_16162 ?auto_16164 ) ) ( not ( = ?auto_16162 ?auto_16175 ) ) ( not ( = ?auto_16164 ?auto_16192 ) ) ( not ( = ?auto_16164 ?auto_16183 ) ) ( not ( = ?auto_16164 ?auto_16176 ) ) ( not ( = ?auto_16164 ?auto_16191 ) ) ( not ( = ?auto_16164 ?auto_16174 ) ) ( not ( = ?auto_16164 ?auto_16189 ) ) ( not ( = ?auto_16175 ?auto_16192 ) ) ( not ( = ?auto_16175 ?auto_16183 ) ) ( not ( = ?auto_16175 ?auto_16176 ) ) ( not ( = ?auto_16175 ?auto_16191 ) ) ( not ( = ?auto_16175 ?auto_16174 ) ) ( not ( = ?auto_16175 ?auto_16189 ) ) ( not ( = ?auto_16157 ?auto_16165 ) ) ( not ( = ?auto_16157 ?auto_16190 ) ) ( not ( = ?auto_16158 ?auto_16165 ) ) ( not ( = ?auto_16158 ?auto_16190 ) ) ( not ( = ?auto_16159 ?auto_16165 ) ) ( not ( = ?auto_16159 ?auto_16190 ) ) ( not ( = ?auto_16160 ?auto_16165 ) ) ( not ( = ?auto_16160 ?auto_16190 ) ) ( not ( = ?auto_16161 ?auto_16165 ) ) ( not ( = ?auto_16161 ?auto_16190 ) ) ( not ( = ?auto_16162 ?auto_16165 ) ) ( not ( = ?auto_16162 ?auto_16190 ) ) ( not ( = ?auto_16163 ?auto_16165 ) ) ( not ( = ?auto_16163 ?auto_16190 ) ) ( not ( = ?auto_16165 ?auto_16175 ) ) ( not ( = ?auto_16165 ?auto_16192 ) ) ( not ( = ?auto_16165 ?auto_16183 ) ) ( not ( = ?auto_16165 ?auto_16176 ) ) ( not ( = ?auto_16165 ?auto_16191 ) ) ( not ( = ?auto_16165 ?auto_16174 ) ) ( not ( = ?auto_16165 ?auto_16189 ) ) ( not ( = ?auto_16190 ?auto_16175 ) ) ( not ( = ?auto_16190 ?auto_16192 ) ) ( not ( = ?auto_16190 ?auto_16183 ) ) ( not ( = ?auto_16190 ?auto_16176 ) ) ( not ( = ?auto_16190 ?auto_16191 ) ) ( not ( = ?auto_16190 ?auto_16174 ) ) ( not ( = ?auto_16190 ?auto_16189 ) ) ( not ( = ?auto_16157 ?auto_16166 ) ) ( not ( = ?auto_16157 ?auto_16193 ) ) ( not ( = ?auto_16158 ?auto_16166 ) ) ( not ( = ?auto_16158 ?auto_16193 ) ) ( not ( = ?auto_16159 ?auto_16166 ) ) ( not ( = ?auto_16159 ?auto_16193 ) ) ( not ( = ?auto_16160 ?auto_16166 ) ) ( not ( = ?auto_16160 ?auto_16193 ) ) ( not ( = ?auto_16161 ?auto_16166 ) ) ( not ( = ?auto_16161 ?auto_16193 ) ) ( not ( = ?auto_16162 ?auto_16166 ) ) ( not ( = ?auto_16162 ?auto_16193 ) ) ( not ( = ?auto_16163 ?auto_16166 ) ) ( not ( = ?auto_16163 ?auto_16193 ) ) ( not ( = ?auto_16164 ?auto_16166 ) ) ( not ( = ?auto_16164 ?auto_16193 ) ) ( not ( = ?auto_16166 ?auto_16190 ) ) ( not ( = ?auto_16166 ?auto_16175 ) ) ( not ( = ?auto_16166 ?auto_16192 ) ) ( not ( = ?auto_16166 ?auto_16183 ) ) ( not ( = ?auto_16166 ?auto_16176 ) ) ( not ( = ?auto_16166 ?auto_16191 ) ) ( not ( = ?auto_16166 ?auto_16174 ) ) ( not ( = ?auto_16166 ?auto_16189 ) ) ( not ( = ?auto_16193 ?auto_16190 ) ) ( not ( = ?auto_16193 ?auto_16175 ) ) ( not ( = ?auto_16193 ?auto_16192 ) ) ( not ( = ?auto_16193 ?auto_16183 ) ) ( not ( = ?auto_16193 ?auto_16176 ) ) ( not ( = ?auto_16193 ?auto_16191 ) ) ( not ( = ?auto_16193 ?auto_16174 ) ) ( not ( = ?auto_16193 ?auto_16189 ) ) ( not ( = ?auto_16157 ?auto_16167 ) ) ( not ( = ?auto_16157 ?auto_16170 ) ) ( not ( = ?auto_16158 ?auto_16167 ) ) ( not ( = ?auto_16158 ?auto_16170 ) ) ( not ( = ?auto_16159 ?auto_16167 ) ) ( not ( = ?auto_16159 ?auto_16170 ) ) ( not ( = ?auto_16160 ?auto_16167 ) ) ( not ( = ?auto_16160 ?auto_16170 ) ) ( not ( = ?auto_16161 ?auto_16167 ) ) ( not ( = ?auto_16161 ?auto_16170 ) ) ( not ( = ?auto_16162 ?auto_16167 ) ) ( not ( = ?auto_16162 ?auto_16170 ) ) ( not ( = ?auto_16163 ?auto_16167 ) ) ( not ( = ?auto_16163 ?auto_16170 ) ) ( not ( = ?auto_16164 ?auto_16167 ) ) ( not ( = ?auto_16164 ?auto_16170 ) ) ( not ( = ?auto_16165 ?auto_16167 ) ) ( not ( = ?auto_16165 ?auto_16170 ) ) ( not ( = ?auto_16167 ?auto_16193 ) ) ( not ( = ?auto_16167 ?auto_16190 ) ) ( not ( = ?auto_16167 ?auto_16175 ) ) ( not ( = ?auto_16167 ?auto_16192 ) ) ( not ( = ?auto_16167 ?auto_16183 ) ) ( not ( = ?auto_16167 ?auto_16176 ) ) ( not ( = ?auto_16167 ?auto_16191 ) ) ( not ( = ?auto_16167 ?auto_16174 ) ) ( not ( = ?auto_16167 ?auto_16189 ) ) ( not ( = ?auto_16173 ?auto_16179 ) ) ( not ( = ?auto_16173 ?auto_16187 ) ) ( not ( = ?auto_16173 ?auto_16182 ) ) ( not ( = ?auto_16173 ?auto_16184 ) ) ( not ( = ?auto_16173 ?auto_16178 ) ) ( not ( = ?auto_16173 ?auto_16194 ) ) ( not ( = ?auto_16171 ?auto_16177 ) ) ( not ( = ?auto_16171 ?auto_16180 ) ) ( not ( = ?auto_16171 ?auto_16181 ) ) ( not ( = ?auto_16171 ?auto_16188 ) ) ( not ( = ?auto_16171 ?auto_16185 ) ) ( not ( = ?auto_16171 ?auto_16186 ) ) ( not ( = ?auto_16170 ?auto_16193 ) ) ( not ( = ?auto_16170 ?auto_16190 ) ) ( not ( = ?auto_16170 ?auto_16175 ) ) ( not ( = ?auto_16170 ?auto_16192 ) ) ( not ( = ?auto_16170 ?auto_16183 ) ) ( not ( = ?auto_16170 ?auto_16176 ) ) ( not ( = ?auto_16170 ?auto_16191 ) ) ( not ( = ?auto_16170 ?auto_16174 ) ) ( not ( = ?auto_16170 ?auto_16189 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_16157 ?auto_16158 ?auto_16159 ?auto_16160 ?auto_16161 ?auto_16162 ?auto_16163 ?auto_16164 ?auto_16165 ?auto_16166 )
      ( MAKE-1CRATE ?auto_16166 ?auto_16167 )
      ( MAKE-10CRATE-VERIFY ?auto_16157 ?auto_16158 ?auto_16159 ?auto_16160 ?auto_16161 ?auto_16162 ?auto_16163 ?auto_16164 ?auto_16165 ?auto_16166 ?auto_16167 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_16217 - SURFACE
      ?auto_16218 - SURFACE
      ?auto_16219 - SURFACE
      ?auto_16220 - SURFACE
      ?auto_16221 - SURFACE
      ?auto_16222 - SURFACE
      ?auto_16223 - SURFACE
      ?auto_16224 - SURFACE
      ?auto_16225 - SURFACE
      ?auto_16226 - SURFACE
      ?auto_16227 - SURFACE
      ?auto_16228 - SURFACE
    )
    :vars
    (
      ?auto_16232 - HOIST
      ?auto_16234 - PLACE
      ?auto_16233 - PLACE
      ?auto_16230 - HOIST
      ?auto_16231 - SURFACE
      ?auto_16236 - PLACE
      ?auto_16258 - HOIST
      ?auto_16247 - SURFACE
      ?auto_16249 - PLACE
      ?auto_16241 - HOIST
      ?auto_16252 - SURFACE
      ?auto_16245 - SURFACE
      ?auto_16235 - SURFACE
      ?auto_16244 - PLACE
      ?auto_16257 - HOIST
      ?auto_16254 - SURFACE
      ?auto_16248 - PLACE
      ?auto_16251 - HOIST
      ?auto_16239 - SURFACE
      ?auto_16255 - PLACE
      ?auto_16243 - HOIST
      ?auto_16246 - SURFACE
      ?auto_16238 - PLACE
      ?auto_16253 - HOIST
      ?auto_16237 - SURFACE
      ?auto_16242 - SURFACE
      ?auto_16250 - PLACE
      ?auto_16240 - HOIST
      ?auto_16256 - SURFACE
      ?auto_16229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16232 ?auto_16234 ) ( IS-CRATE ?auto_16228 ) ( not ( = ?auto_16233 ?auto_16234 ) ) ( HOIST-AT ?auto_16230 ?auto_16233 ) ( AVAILABLE ?auto_16230 ) ( SURFACE-AT ?auto_16228 ?auto_16233 ) ( ON ?auto_16228 ?auto_16231 ) ( CLEAR ?auto_16228 ) ( not ( = ?auto_16227 ?auto_16228 ) ) ( not ( = ?auto_16227 ?auto_16231 ) ) ( not ( = ?auto_16228 ?auto_16231 ) ) ( not ( = ?auto_16232 ?auto_16230 ) ) ( IS-CRATE ?auto_16227 ) ( not ( = ?auto_16236 ?auto_16234 ) ) ( HOIST-AT ?auto_16258 ?auto_16236 ) ( AVAILABLE ?auto_16258 ) ( SURFACE-AT ?auto_16227 ?auto_16236 ) ( ON ?auto_16227 ?auto_16247 ) ( CLEAR ?auto_16227 ) ( not ( = ?auto_16226 ?auto_16227 ) ) ( not ( = ?auto_16226 ?auto_16247 ) ) ( not ( = ?auto_16227 ?auto_16247 ) ) ( not ( = ?auto_16232 ?auto_16258 ) ) ( IS-CRATE ?auto_16226 ) ( not ( = ?auto_16249 ?auto_16234 ) ) ( HOIST-AT ?auto_16241 ?auto_16249 ) ( SURFACE-AT ?auto_16226 ?auto_16249 ) ( ON ?auto_16226 ?auto_16252 ) ( CLEAR ?auto_16226 ) ( not ( = ?auto_16225 ?auto_16226 ) ) ( not ( = ?auto_16225 ?auto_16252 ) ) ( not ( = ?auto_16226 ?auto_16252 ) ) ( not ( = ?auto_16232 ?auto_16241 ) ) ( IS-CRATE ?auto_16225 ) ( SURFACE-AT ?auto_16225 ?auto_16249 ) ( ON ?auto_16225 ?auto_16245 ) ( CLEAR ?auto_16225 ) ( not ( = ?auto_16224 ?auto_16225 ) ) ( not ( = ?auto_16224 ?auto_16245 ) ) ( not ( = ?auto_16225 ?auto_16245 ) ) ( IS-CRATE ?auto_16224 ) ( SURFACE-AT ?auto_16224 ?auto_16249 ) ( ON ?auto_16224 ?auto_16235 ) ( CLEAR ?auto_16224 ) ( not ( = ?auto_16223 ?auto_16224 ) ) ( not ( = ?auto_16223 ?auto_16235 ) ) ( not ( = ?auto_16224 ?auto_16235 ) ) ( IS-CRATE ?auto_16223 ) ( not ( = ?auto_16244 ?auto_16234 ) ) ( HOIST-AT ?auto_16257 ?auto_16244 ) ( AVAILABLE ?auto_16257 ) ( SURFACE-AT ?auto_16223 ?auto_16244 ) ( ON ?auto_16223 ?auto_16254 ) ( CLEAR ?auto_16223 ) ( not ( = ?auto_16222 ?auto_16223 ) ) ( not ( = ?auto_16222 ?auto_16254 ) ) ( not ( = ?auto_16223 ?auto_16254 ) ) ( not ( = ?auto_16232 ?auto_16257 ) ) ( IS-CRATE ?auto_16222 ) ( not ( = ?auto_16248 ?auto_16234 ) ) ( HOIST-AT ?auto_16251 ?auto_16248 ) ( AVAILABLE ?auto_16251 ) ( SURFACE-AT ?auto_16222 ?auto_16248 ) ( ON ?auto_16222 ?auto_16239 ) ( CLEAR ?auto_16222 ) ( not ( = ?auto_16221 ?auto_16222 ) ) ( not ( = ?auto_16221 ?auto_16239 ) ) ( not ( = ?auto_16222 ?auto_16239 ) ) ( not ( = ?auto_16232 ?auto_16251 ) ) ( IS-CRATE ?auto_16221 ) ( not ( = ?auto_16255 ?auto_16234 ) ) ( HOIST-AT ?auto_16243 ?auto_16255 ) ( AVAILABLE ?auto_16243 ) ( SURFACE-AT ?auto_16221 ?auto_16255 ) ( ON ?auto_16221 ?auto_16246 ) ( CLEAR ?auto_16221 ) ( not ( = ?auto_16220 ?auto_16221 ) ) ( not ( = ?auto_16220 ?auto_16246 ) ) ( not ( = ?auto_16221 ?auto_16246 ) ) ( not ( = ?auto_16232 ?auto_16243 ) ) ( IS-CRATE ?auto_16220 ) ( not ( = ?auto_16238 ?auto_16234 ) ) ( HOIST-AT ?auto_16253 ?auto_16238 ) ( AVAILABLE ?auto_16253 ) ( SURFACE-AT ?auto_16220 ?auto_16238 ) ( ON ?auto_16220 ?auto_16237 ) ( CLEAR ?auto_16220 ) ( not ( = ?auto_16219 ?auto_16220 ) ) ( not ( = ?auto_16219 ?auto_16237 ) ) ( not ( = ?auto_16220 ?auto_16237 ) ) ( not ( = ?auto_16232 ?auto_16253 ) ) ( IS-CRATE ?auto_16219 ) ( AVAILABLE ?auto_16241 ) ( SURFACE-AT ?auto_16219 ?auto_16249 ) ( ON ?auto_16219 ?auto_16242 ) ( CLEAR ?auto_16219 ) ( not ( = ?auto_16218 ?auto_16219 ) ) ( not ( = ?auto_16218 ?auto_16242 ) ) ( not ( = ?auto_16219 ?auto_16242 ) ) ( SURFACE-AT ?auto_16217 ?auto_16234 ) ( CLEAR ?auto_16217 ) ( IS-CRATE ?auto_16218 ) ( AVAILABLE ?auto_16232 ) ( not ( = ?auto_16250 ?auto_16234 ) ) ( HOIST-AT ?auto_16240 ?auto_16250 ) ( AVAILABLE ?auto_16240 ) ( SURFACE-AT ?auto_16218 ?auto_16250 ) ( ON ?auto_16218 ?auto_16256 ) ( CLEAR ?auto_16218 ) ( TRUCK-AT ?auto_16229 ?auto_16234 ) ( not ( = ?auto_16217 ?auto_16218 ) ) ( not ( = ?auto_16217 ?auto_16256 ) ) ( not ( = ?auto_16218 ?auto_16256 ) ) ( not ( = ?auto_16232 ?auto_16240 ) ) ( not ( = ?auto_16217 ?auto_16219 ) ) ( not ( = ?auto_16217 ?auto_16242 ) ) ( not ( = ?auto_16219 ?auto_16256 ) ) ( not ( = ?auto_16249 ?auto_16250 ) ) ( not ( = ?auto_16241 ?auto_16240 ) ) ( not ( = ?auto_16242 ?auto_16256 ) ) ( not ( = ?auto_16217 ?auto_16220 ) ) ( not ( = ?auto_16217 ?auto_16237 ) ) ( not ( = ?auto_16218 ?auto_16220 ) ) ( not ( = ?auto_16218 ?auto_16237 ) ) ( not ( = ?auto_16220 ?auto_16242 ) ) ( not ( = ?auto_16220 ?auto_16256 ) ) ( not ( = ?auto_16238 ?auto_16249 ) ) ( not ( = ?auto_16238 ?auto_16250 ) ) ( not ( = ?auto_16253 ?auto_16241 ) ) ( not ( = ?auto_16253 ?auto_16240 ) ) ( not ( = ?auto_16237 ?auto_16242 ) ) ( not ( = ?auto_16237 ?auto_16256 ) ) ( not ( = ?auto_16217 ?auto_16221 ) ) ( not ( = ?auto_16217 ?auto_16246 ) ) ( not ( = ?auto_16218 ?auto_16221 ) ) ( not ( = ?auto_16218 ?auto_16246 ) ) ( not ( = ?auto_16219 ?auto_16221 ) ) ( not ( = ?auto_16219 ?auto_16246 ) ) ( not ( = ?auto_16221 ?auto_16237 ) ) ( not ( = ?auto_16221 ?auto_16242 ) ) ( not ( = ?auto_16221 ?auto_16256 ) ) ( not ( = ?auto_16255 ?auto_16238 ) ) ( not ( = ?auto_16255 ?auto_16249 ) ) ( not ( = ?auto_16255 ?auto_16250 ) ) ( not ( = ?auto_16243 ?auto_16253 ) ) ( not ( = ?auto_16243 ?auto_16241 ) ) ( not ( = ?auto_16243 ?auto_16240 ) ) ( not ( = ?auto_16246 ?auto_16237 ) ) ( not ( = ?auto_16246 ?auto_16242 ) ) ( not ( = ?auto_16246 ?auto_16256 ) ) ( not ( = ?auto_16217 ?auto_16222 ) ) ( not ( = ?auto_16217 ?auto_16239 ) ) ( not ( = ?auto_16218 ?auto_16222 ) ) ( not ( = ?auto_16218 ?auto_16239 ) ) ( not ( = ?auto_16219 ?auto_16222 ) ) ( not ( = ?auto_16219 ?auto_16239 ) ) ( not ( = ?auto_16220 ?auto_16222 ) ) ( not ( = ?auto_16220 ?auto_16239 ) ) ( not ( = ?auto_16222 ?auto_16246 ) ) ( not ( = ?auto_16222 ?auto_16237 ) ) ( not ( = ?auto_16222 ?auto_16242 ) ) ( not ( = ?auto_16222 ?auto_16256 ) ) ( not ( = ?auto_16248 ?auto_16255 ) ) ( not ( = ?auto_16248 ?auto_16238 ) ) ( not ( = ?auto_16248 ?auto_16249 ) ) ( not ( = ?auto_16248 ?auto_16250 ) ) ( not ( = ?auto_16251 ?auto_16243 ) ) ( not ( = ?auto_16251 ?auto_16253 ) ) ( not ( = ?auto_16251 ?auto_16241 ) ) ( not ( = ?auto_16251 ?auto_16240 ) ) ( not ( = ?auto_16239 ?auto_16246 ) ) ( not ( = ?auto_16239 ?auto_16237 ) ) ( not ( = ?auto_16239 ?auto_16242 ) ) ( not ( = ?auto_16239 ?auto_16256 ) ) ( not ( = ?auto_16217 ?auto_16223 ) ) ( not ( = ?auto_16217 ?auto_16254 ) ) ( not ( = ?auto_16218 ?auto_16223 ) ) ( not ( = ?auto_16218 ?auto_16254 ) ) ( not ( = ?auto_16219 ?auto_16223 ) ) ( not ( = ?auto_16219 ?auto_16254 ) ) ( not ( = ?auto_16220 ?auto_16223 ) ) ( not ( = ?auto_16220 ?auto_16254 ) ) ( not ( = ?auto_16221 ?auto_16223 ) ) ( not ( = ?auto_16221 ?auto_16254 ) ) ( not ( = ?auto_16223 ?auto_16239 ) ) ( not ( = ?auto_16223 ?auto_16246 ) ) ( not ( = ?auto_16223 ?auto_16237 ) ) ( not ( = ?auto_16223 ?auto_16242 ) ) ( not ( = ?auto_16223 ?auto_16256 ) ) ( not ( = ?auto_16244 ?auto_16248 ) ) ( not ( = ?auto_16244 ?auto_16255 ) ) ( not ( = ?auto_16244 ?auto_16238 ) ) ( not ( = ?auto_16244 ?auto_16249 ) ) ( not ( = ?auto_16244 ?auto_16250 ) ) ( not ( = ?auto_16257 ?auto_16251 ) ) ( not ( = ?auto_16257 ?auto_16243 ) ) ( not ( = ?auto_16257 ?auto_16253 ) ) ( not ( = ?auto_16257 ?auto_16241 ) ) ( not ( = ?auto_16257 ?auto_16240 ) ) ( not ( = ?auto_16254 ?auto_16239 ) ) ( not ( = ?auto_16254 ?auto_16246 ) ) ( not ( = ?auto_16254 ?auto_16237 ) ) ( not ( = ?auto_16254 ?auto_16242 ) ) ( not ( = ?auto_16254 ?auto_16256 ) ) ( not ( = ?auto_16217 ?auto_16224 ) ) ( not ( = ?auto_16217 ?auto_16235 ) ) ( not ( = ?auto_16218 ?auto_16224 ) ) ( not ( = ?auto_16218 ?auto_16235 ) ) ( not ( = ?auto_16219 ?auto_16224 ) ) ( not ( = ?auto_16219 ?auto_16235 ) ) ( not ( = ?auto_16220 ?auto_16224 ) ) ( not ( = ?auto_16220 ?auto_16235 ) ) ( not ( = ?auto_16221 ?auto_16224 ) ) ( not ( = ?auto_16221 ?auto_16235 ) ) ( not ( = ?auto_16222 ?auto_16224 ) ) ( not ( = ?auto_16222 ?auto_16235 ) ) ( not ( = ?auto_16224 ?auto_16254 ) ) ( not ( = ?auto_16224 ?auto_16239 ) ) ( not ( = ?auto_16224 ?auto_16246 ) ) ( not ( = ?auto_16224 ?auto_16237 ) ) ( not ( = ?auto_16224 ?auto_16242 ) ) ( not ( = ?auto_16224 ?auto_16256 ) ) ( not ( = ?auto_16235 ?auto_16254 ) ) ( not ( = ?auto_16235 ?auto_16239 ) ) ( not ( = ?auto_16235 ?auto_16246 ) ) ( not ( = ?auto_16235 ?auto_16237 ) ) ( not ( = ?auto_16235 ?auto_16242 ) ) ( not ( = ?auto_16235 ?auto_16256 ) ) ( not ( = ?auto_16217 ?auto_16225 ) ) ( not ( = ?auto_16217 ?auto_16245 ) ) ( not ( = ?auto_16218 ?auto_16225 ) ) ( not ( = ?auto_16218 ?auto_16245 ) ) ( not ( = ?auto_16219 ?auto_16225 ) ) ( not ( = ?auto_16219 ?auto_16245 ) ) ( not ( = ?auto_16220 ?auto_16225 ) ) ( not ( = ?auto_16220 ?auto_16245 ) ) ( not ( = ?auto_16221 ?auto_16225 ) ) ( not ( = ?auto_16221 ?auto_16245 ) ) ( not ( = ?auto_16222 ?auto_16225 ) ) ( not ( = ?auto_16222 ?auto_16245 ) ) ( not ( = ?auto_16223 ?auto_16225 ) ) ( not ( = ?auto_16223 ?auto_16245 ) ) ( not ( = ?auto_16225 ?auto_16235 ) ) ( not ( = ?auto_16225 ?auto_16254 ) ) ( not ( = ?auto_16225 ?auto_16239 ) ) ( not ( = ?auto_16225 ?auto_16246 ) ) ( not ( = ?auto_16225 ?auto_16237 ) ) ( not ( = ?auto_16225 ?auto_16242 ) ) ( not ( = ?auto_16225 ?auto_16256 ) ) ( not ( = ?auto_16245 ?auto_16235 ) ) ( not ( = ?auto_16245 ?auto_16254 ) ) ( not ( = ?auto_16245 ?auto_16239 ) ) ( not ( = ?auto_16245 ?auto_16246 ) ) ( not ( = ?auto_16245 ?auto_16237 ) ) ( not ( = ?auto_16245 ?auto_16242 ) ) ( not ( = ?auto_16245 ?auto_16256 ) ) ( not ( = ?auto_16217 ?auto_16226 ) ) ( not ( = ?auto_16217 ?auto_16252 ) ) ( not ( = ?auto_16218 ?auto_16226 ) ) ( not ( = ?auto_16218 ?auto_16252 ) ) ( not ( = ?auto_16219 ?auto_16226 ) ) ( not ( = ?auto_16219 ?auto_16252 ) ) ( not ( = ?auto_16220 ?auto_16226 ) ) ( not ( = ?auto_16220 ?auto_16252 ) ) ( not ( = ?auto_16221 ?auto_16226 ) ) ( not ( = ?auto_16221 ?auto_16252 ) ) ( not ( = ?auto_16222 ?auto_16226 ) ) ( not ( = ?auto_16222 ?auto_16252 ) ) ( not ( = ?auto_16223 ?auto_16226 ) ) ( not ( = ?auto_16223 ?auto_16252 ) ) ( not ( = ?auto_16224 ?auto_16226 ) ) ( not ( = ?auto_16224 ?auto_16252 ) ) ( not ( = ?auto_16226 ?auto_16245 ) ) ( not ( = ?auto_16226 ?auto_16235 ) ) ( not ( = ?auto_16226 ?auto_16254 ) ) ( not ( = ?auto_16226 ?auto_16239 ) ) ( not ( = ?auto_16226 ?auto_16246 ) ) ( not ( = ?auto_16226 ?auto_16237 ) ) ( not ( = ?auto_16226 ?auto_16242 ) ) ( not ( = ?auto_16226 ?auto_16256 ) ) ( not ( = ?auto_16252 ?auto_16245 ) ) ( not ( = ?auto_16252 ?auto_16235 ) ) ( not ( = ?auto_16252 ?auto_16254 ) ) ( not ( = ?auto_16252 ?auto_16239 ) ) ( not ( = ?auto_16252 ?auto_16246 ) ) ( not ( = ?auto_16252 ?auto_16237 ) ) ( not ( = ?auto_16252 ?auto_16242 ) ) ( not ( = ?auto_16252 ?auto_16256 ) ) ( not ( = ?auto_16217 ?auto_16227 ) ) ( not ( = ?auto_16217 ?auto_16247 ) ) ( not ( = ?auto_16218 ?auto_16227 ) ) ( not ( = ?auto_16218 ?auto_16247 ) ) ( not ( = ?auto_16219 ?auto_16227 ) ) ( not ( = ?auto_16219 ?auto_16247 ) ) ( not ( = ?auto_16220 ?auto_16227 ) ) ( not ( = ?auto_16220 ?auto_16247 ) ) ( not ( = ?auto_16221 ?auto_16227 ) ) ( not ( = ?auto_16221 ?auto_16247 ) ) ( not ( = ?auto_16222 ?auto_16227 ) ) ( not ( = ?auto_16222 ?auto_16247 ) ) ( not ( = ?auto_16223 ?auto_16227 ) ) ( not ( = ?auto_16223 ?auto_16247 ) ) ( not ( = ?auto_16224 ?auto_16227 ) ) ( not ( = ?auto_16224 ?auto_16247 ) ) ( not ( = ?auto_16225 ?auto_16227 ) ) ( not ( = ?auto_16225 ?auto_16247 ) ) ( not ( = ?auto_16227 ?auto_16252 ) ) ( not ( = ?auto_16227 ?auto_16245 ) ) ( not ( = ?auto_16227 ?auto_16235 ) ) ( not ( = ?auto_16227 ?auto_16254 ) ) ( not ( = ?auto_16227 ?auto_16239 ) ) ( not ( = ?auto_16227 ?auto_16246 ) ) ( not ( = ?auto_16227 ?auto_16237 ) ) ( not ( = ?auto_16227 ?auto_16242 ) ) ( not ( = ?auto_16227 ?auto_16256 ) ) ( not ( = ?auto_16236 ?auto_16249 ) ) ( not ( = ?auto_16236 ?auto_16244 ) ) ( not ( = ?auto_16236 ?auto_16248 ) ) ( not ( = ?auto_16236 ?auto_16255 ) ) ( not ( = ?auto_16236 ?auto_16238 ) ) ( not ( = ?auto_16236 ?auto_16250 ) ) ( not ( = ?auto_16258 ?auto_16241 ) ) ( not ( = ?auto_16258 ?auto_16257 ) ) ( not ( = ?auto_16258 ?auto_16251 ) ) ( not ( = ?auto_16258 ?auto_16243 ) ) ( not ( = ?auto_16258 ?auto_16253 ) ) ( not ( = ?auto_16258 ?auto_16240 ) ) ( not ( = ?auto_16247 ?auto_16252 ) ) ( not ( = ?auto_16247 ?auto_16245 ) ) ( not ( = ?auto_16247 ?auto_16235 ) ) ( not ( = ?auto_16247 ?auto_16254 ) ) ( not ( = ?auto_16247 ?auto_16239 ) ) ( not ( = ?auto_16247 ?auto_16246 ) ) ( not ( = ?auto_16247 ?auto_16237 ) ) ( not ( = ?auto_16247 ?auto_16242 ) ) ( not ( = ?auto_16247 ?auto_16256 ) ) ( not ( = ?auto_16217 ?auto_16228 ) ) ( not ( = ?auto_16217 ?auto_16231 ) ) ( not ( = ?auto_16218 ?auto_16228 ) ) ( not ( = ?auto_16218 ?auto_16231 ) ) ( not ( = ?auto_16219 ?auto_16228 ) ) ( not ( = ?auto_16219 ?auto_16231 ) ) ( not ( = ?auto_16220 ?auto_16228 ) ) ( not ( = ?auto_16220 ?auto_16231 ) ) ( not ( = ?auto_16221 ?auto_16228 ) ) ( not ( = ?auto_16221 ?auto_16231 ) ) ( not ( = ?auto_16222 ?auto_16228 ) ) ( not ( = ?auto_16222 ?auto_16231 ) ) ( not ( = ?auto_16223 ?auto_16228 ) ) ( not ( = ?auto_16223 ?auto_16231 ) ) ( not ( = ?auto_16224 ?auto_16228 ) ) ( not ( = ?auto_16224 ?auto_16231 ) ) ( not ( = ?auto_16225 ?auto_16228 ) ) ( not ( = ?auto_16225 ?auto_16231 ) ) ( not ( = ?auto_16226 ?auto_16228 ) ) ( not ( = ?auto_16226 ?auto_16231 ) ) ( not ( = ?auto_16228 ?auto_16247 ) ) ( not ( = ?auto_16228 ?auto_16252 ) ) ( not ( = ?auto_16228 ?auto_16245 ) ) ( not ( = ?auto_16228 ?auto_16235 ) ) ( not ( = ?auto_16228 ?auto_16254 ) ) ( not ( = ?auto_16228 ?auto_16239 ) ) ( not ( = ?auto_16228 ?auto_16246 ) ) ( not ( = ?auto_16228 ?auto_16237 ) ) ( not ( = ?auto_16228 ?auto_16242 ) ) ( not ( = ?auto_16228 ?auto_16256 ) ) ( not ( = ?auto_16233 ?auto_16236 ) ) ( not ( = ?auto_16233 ?auto_16249 ) ) ( not ( = ?auto_16233 ?auto_16244 ) ) ( not ( = ?auto_16233 ?auto_16248 ) ) ( not ( = ?auto_16233 ?auto_16255 ) ) ( not ( = ?auto_16233 ?auto_16238 ) ) ( not ( = ?auto_16233 ?auto_16250 ) ) ( not ( = ?auto_16230 ?auto_16258 ) ) ( not ( = ?auto_16230 ?auto_16241 ) ) ( not ( = ?auto_16230 ?auto_16257 ) ) ( not ( = ?auto_16230 ?auto_16251 ) ) ( not ( = ?auto_16230 ?auto_16243 ) ) ( not ( = ?auto_16230 ?auto_16253 ) ) ( not ( = ?auto_16230 ?auto_16240 ) ) ( not ( = ?auto_16231 ?auto_16247 ) ) ( not ( = ?auto_16231 ?auto_16252 ) ) ( not ( = ?auto_16231 ?auto_16245 ) ) ( not ( = ?auto_16231 ?auto_16235 ) ) ( not ( = ?auto_16231 ?auto_16254 ) ) ( not ( = ?auto_16231 ?auto_16239 ) ) ( not ( = ?auto_16231 ?auto_16246 ) ) ( not ( = ?auto_16231 ?auto_16237 ) ) ( not ( = ?auto_16231 ?auto_16242 ) ) ( not ( = ?auto_16231 ?auto_16256 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_16217 ?auto_16218 ?auto_16219 ?auto_16220 ?auto_16221 ?auto_16222 ?auto_16223 ?auto_16224 ?auto_16225 ?auto_16226 ?auto_16227 )
      ( MAKE-1CRATE ?auto_16227 ?auto_16228 )
      ( MAKE-11CRATE-VERIFY ?auto_16217 ?auto_16218 ?auto_16219 ?auto_16220 ?auto_16221 ?auto_16222 ?auto_16223 ?auto_16224 ?auto_16225 ?auto_16226 ?auto_16227 ?auto_16228 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_16282 - SURFACE
      ?auto_16283 - SURFACE
      ?auto_16284 - SURFACE
      ?auto_16285 - SURFACE
      ?auto_16286 - SURFACE
      ?auto_16287 - SURFACE
      ?auto_16288 - SURFACE
      ?auto_16289 - SURFACE
      ?auto_16290 - SURFACE
      ?auto_16291 - SURFACE
      ?auto_16292 - SURFACE
      ?auto_16293 - SURFACE
      ?auto_16294 - SURFACE
    )
    :vars
    (
      ?auto_16299 - HOIST
      ?auto_16298 - PLACE
      ?auto_16300 - PLACE
      ?auto_16295 - HOIST
      ?auto_16297 - SURFACE
      ?auto_16323 - PLACE
      ?auto_16322 - HOIST
      ?auto_16321 - SURFACE
      ?auto_16319 - PLACE
      ?auto_16308 - HOIST
      ?auto_16327 - SURFACE
      ?auto_16301 - PLACE
      ?auto_16326 - HOIST
      ?auto_16325 - SURFACE
      ?auto_16314 - SURFACE
      ?auto_16310 - SURFACE
      ?auto_16315 - PLACE
      ?auto_16317 - HOIST
      ?auto_16312 - SURFACE
      ?auto_16311 - PLACE
      ?auto_16307 - HOIST
      ?auto_16306 - SURFACE
      ?auto_16313 - PLACE
      ?auto_16302 - HOIST
      ?auto_16320 - SURFACE
      ?auto_16309 - PLACE
      ?auto_16303 - HOIST
      ?auto_16304 - SURFACE
      ?auto_16305 - SURFACE
      ?auto_16324 - PLACE
      ?auto_16318 - HOIST
      ?auto_16316 - SURFACE
      ?auto_16296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16299 ?auto_16298 ) ( IS-CRATE ?auto_16294 ) ( not ( = ?auto_16300 ?auto_16298 ) ) ( HOIST-AT ?auto_16295 ?auto_16300 ) ( AVAILABLE ?auto_16295 ) ( SURFACE-AT ?auto_16294 ?auto_16300 ) ( ON ?auto_16294 ?auto_16297 ) ( CLEAR ?auto_16294 ) ( not ( = ?auto_16293 ?auto_16294 ) ) ( not ( = ?auto_16293 ?auto_16297 ) ) ( not ( = ?auto_16294 ?auto_16297 ) ) ( not ( = ?auto_16299 ?auto_16295 ) ) ( IS-CRATE ?auto_16293 ) ( not ( = ?auto_16323 ?auto_16298 ) ) ( HOIST-AT ?auto_16322 ?auto_16323 ) ( AVAILABLE ?auto_16322 ) ( SURFACE-AT ?auto_16293 ?auto_16323 ) ( ON ?auto_16293 ?auto_16321 ) ( CLEAR ?auto_16293 ) ( not ( = ?auto_16292 ?auto_16293 ) ) ( not ( = ?auto_16292 ?auto_16321 ) ) ( not ( = ?auto_16293 ?auto_16321 ) ) ( not ( = ?auto_16299 ?auto_16322 ) ) ( IS-CRATE ?auto_16292 ) ( not ( = ?auto_16319 ?auto_16298 ) ) ( HOIST-AT ?auto_16308 ?auto_16319 ) ( AVAILABLE ?auto_16308 ) ( SURFACE-AT ?auto_16292 ?auto_16319 ) ( ON ?auto_16292 ?auto_16327 ) ( CLEAR ?auto_16292 ) ( not ( = ?auto_16291 ?auto_16292 ) ) ( not ( = ?auto_16291 ?auto_16327 ) ) ( not ( = ?auto_16292 ?auto_16327 ) ) ( not ( = ?auto_16299 ?auto_16308 ) ) ( IS-CRATE ?auto_16291 ) ( not ( = ?auto_16301 ?auto_16298 ) ) ( HOIST-AT ?auto_16326 ?auto_16301 ) ( SURFACE-AT ?auto_16291 ?auto_16301 ) ( ON ?auto_16291 ?auto_16325 ) ( CLEAR ?auto_16291 ) ( not ( = ?auto_16290 ?auto_16291 ) ) ( not ( = ?auto_16290 ?auto_16325 ) ) ( not ( = ?auto_16291 ?auto_16325 ) ) ( not ( = ?auto_16299 ?auto_16326 ) ) ( IS-CRATE ?auto_16290 ) ( SURFACE-AT ?auto_16290 ?auto_16301 ) ( ON ?auto_16290 ?auto_16314 ) ( CLEAR ?auto_16290 ) ( not ( = ?auto_16289 ?auto_16290 ) ) ( not ( = ?auto_16289 ?auto_16314 ) ) ( not ( = ?auto_16290 ?auto_16314 ) ) ( IS-CRATE ?auto_16289 ) ( SURFACE-AT ?auto_16289 ?auto_16301 ) ( ON ?auto_16289 ?auto_16310 ) ( CLEAR ?auto_16289 ) ( not ( = ?auto_16288 ?auto_16289 ) ) ( not ( = ?auto_16288 ?auto_16310 ) ) ( not ( = ?auto_16289 ?auto_16310 ) ) ( IS-CRATE ?auto_16288 ) ( not ( = ?auto_16315 ?auto_16298 ) ) ( HOIST-AT ?auto_16317 ?auto_16315 ) ( AVAILABLE ?auto_16317 ) ( SURFACE-AT ?auto_16288 ?auto_16315 ) ( ON ?auto_16288 ?auto_16312 ) ( CLEAR ?auto_16288 ) ( not ( = ?auto_16287 ?auto_16288 ) ) ( not ( = ?auto_16287 ?auto_16312 ) ) ( not ( = ?auto_16288 ?auto_16312 ) ) ( not ( = ?auto_16299 ?auto_16317 ) ) ( IS-CRATE ?auto_16287 ) ( not ( = ?auto_16311 ?auto_16298 ) ) ( HOIST-AT ?auto_16307 ?auto_16311 ) ( AVAILABLE ?auto_16307 ) ( SURFACE-AT ?auto_16287 ?auto_16311 ) ( ON ?auto_16287 ?auto_16306 ) ( CLEAR ?auto_16287 ) ( not ( = ?auto_16286 ?auto_16287 ) ) ( not ( = ?auto_16286 ?auto_16306 ) ) ( not ( = ?auto_16287 ?auto_16306 ) ) ( not ( = ?auto_16299 ?auto_16307 ) ) ( IS-CRATE ?auto_16286 ) ( not ( = ?auto_16313 ?auto_16298 ) ) ( HOIST-AT ?auto_16302 ?auto_16313 ) ( AVAILABLE ?auto_16302 ) ( SURFACE-AT ?auto_16286 ?auto_16313 ) ( ON ?auto_16286 ?auto_16320 ) ( CLEAR ?auto_16286 ) ( not ( = ?auto_16285 ?auto_16286 ) ) ( not ( = ?auto_16285 ?auto_16320 ) ) ( not ( = ?auto_16286 ?auto_16320 ) ) ( not ( = ?auto_16299 ?auto_16302 ) ) ( IS-CRATE ?auto_16285 ) ( not ( = ?auto_16309 ?auto_16298 ) ) ( HOIST-AT ?auto_16303 ?auto_16309 ) ( AVAILABLE ?auto_16303 ) ( SURFACE-AT ?auto_16285 ?auto_16309 ) ( ON ?auto_16285 ?auto_16304 ) ( CLEAR ?auto_16285 ) ( not ( = ?auto_16284 ?auto_16285 ) ) ( not ( = ?auto_16284 ?auto_16304 ) ) ( not ( = ?auto_16285 ?auto_16304 ) ) ( not ( = ?auto_16299 ?auto_16303 ) ) ( IS-CRATE ?auto_16284 ) ( AVAILABLE ?auto_16326 ) ( SURFACE-AT ?auto_16284 ?auto_16301 ) ( ON ?auto_16284 ?auto_16305 ) ( CLEAR ?auto_16284 ) ( not ( = ?auto_16283 ?auto_16284 ) ) ( not ( = ?auto_16283 ?auto_16305 ) ) ( not ( = ?auto_16284 ?auto_16305 ) ) ( SURFACE-AT ?auto_16282 ?auto_16298 ) ( CLEAR ?auto_16282 ) ( IS-CRATE ?auto_16283 ) ( AVAILABLE ?auto_16299 ) ( not ( = ?auto_16324 ?auto_16298 ) ) ( HOIST-AT ?auto_16318 ?auto_16324 ) ( AVAILABLE ?auto_16318 ) ( SURFACE-AT ?auto_16283 ?auto_16324 ) ( ON ?auto_16283 ?auto_16316 ) ( CLEAR ?auto_16283 ) ( TRUCK-AT ?auto_16296 ?auto_16298 ) ( not ( = ?auto_16282 ?auto_16283 ) ) ( not ( = ?auto_16282 ?auto_16316 ) ) ( not ( = ?auto_16283 ?auto_16316 ) ) ( not ( = ?auto_16299 ?auto_16318 ) ) ( not ( = ?auto_16282 ?auto_16284 ) ) ( not ( = ?auto_16282 ?auto_16305 ) ) ( not ( = ?auto_16284 ?auto_16316 ) ) ( not ( = ?auto_16301 ?auto_16324 ) ) ( not ( = ?auto_16326 ?auto_16318 ) ) ( not ( = ?auto_16305 ?auto_16316 ) ) ( not ( = ?auto_16282 ?auto_16285 ) ) ( not ( = ?auto_16282 ?auto_16304 ) ) ( not ( = ?auto_16283 ?auto_16285 ) ) ( not ( = ?auto_16283 ?auto_16304 ) ) ( not ( = ?auto_16285 ?auto_16305 ) ) ( not ( = ?auto_16285 ?auto_16316 ) ) ( not ( = ?auto_16309 ?auto_16301 ) ) ( not ( = ?auto_16309 ?auto_16324 ) ) ( not ( = ?auto_16303 ?auto_16326 ) ) ( not ( = ?auto_16303 ?auto_16318 ) ) ( not ( = ?auto_16304 ?auto_16305 ) ) ( not ( = ?auto_16304 ?auto_16316 ) ) ( not ( = ?auto_16282 ?auto_16286 ) ) ( not ( = ?auto_16282 ?auto_16320 ) ) ( not ( = ?auto_16283 ?auto_16286 ) ) ( not ( = ?auto_16283 ?auto_16320 ) ) ( not ( = ?auto_16284 ?auto_16286 ) ) ( not ( = ?auto_16284 ?auto_16320 ) ) ( not ( = ?auto_16286 ?auto_16304 ) ) ( not ( = ?auto_16286 ?auto_16305 ) ) ( not ( = ?auto_16286 ?auto_16316 ) ) ( not ( = ?auto_16313 ?auto_16309 ) ) ( not ( = ?auto_16313 ?auto_16301 ) ) ( not ( = ?auto_16313 ?auto_16324 ) ) ( not ( = ?auto_16302 ?auto_16303 ) ) ( not ( = ?auto_16302 ?auto_16326 ) ) ( not ( = ?auto_16302 ?auto_16318 ) ) ( not ( = ?auto_16320 ?auto_16304 ) ) ( not ( = ?auto_16320 ?auto_16305 ) ) ( not ( = ?auto_16320 ?auto_16316 ) ) ( not ( = ?auto_16282 ?auto_16287 ) ) ( not ( = ?auto_16282 ?auto_16306 ) ) ( not ( = ?auto_16283 ?auto_16287 ) ) ( not ( = ?auto_16283 ?auto_16306 ) ) ( not ( = ?auto_16284 ?auto_16287 ) ) ( not ( = ?auto_16284 ?auto_16306 ) ) ( not ( = ?auto_16285 ?auto_16287 ) ) ( not ( = ?auto_16285 ?auto_16306 ) ) ( not ( = ?auto_16287 ?auto_16320 ) ) ( not ( = ?auto_16287 ?auto_16304 ) ) ( not ( = ?auto_16287 ?auto_16305 ) ) ( not ( = ?auto_16287 ?auto_16316 ) ) ( not ( = ?auto_16311 ?auto_16313 ) ) ( not ( = ?auto_16311 ?auto_16309 ) ) ( not ( = ?auto_16311 ?auto_16301 ) ) ( not ( = ?auto_16311 ?auto_16324 ) ) ( not ( = ?auto_16307 ?auto_16302 ) ) ( not ( = ?auto_16307 ?auto_16303 ) ) ( not ( = ?auto_16307 ?auto_16326 ) ) ( not ( = ?auto_16307 ?auto_16318 ) ) ( not ( = ?auto_16306 ?auto_16320 ) ) ( not ( = ?auto_16306 ?auto_16304 ) ) ( not ( = ?auto_16306 ?auto_16305 ) ) ( not ( = ?auto_16306 ?auto_16316 ) ) ( not ( = ?auto_16282 ?auto_16288 ) ) ( not ( = ?auto_16282 ?auto_16312 ) ) ( not ( = ?auto_16283 ?auto_16288 ) ) ( not ( = ?auto_16283 ?auto_16312 ) ) ( not ( = ?auto_16284 ?auto_16288 ) ) ( not ( = ?auto_16284 ?auto_16312 ) ) ( not ( = ?auto_16285 ?auto_16288 ) ) ( not ( = ?auto_16285 ?auto_16312 ) ) ( not ( = ?auto_16286 ?auto_16288 ) ) ( not ( = ?auto_16286 ?auto_16312 ) ) ( not ( = ?auto_16288 ?auto_16306 ) ) ( not ( = ?auto_16288 ?auto_16320 ) ) ( not ( = ?auto_16288 ?auto_16304 ) ) ( not ( = ?auto_16288 ?auto_16305 ) ) ( not ( = ?auto_16288 ?auto_16316 ) ) ( not ( = ?auto_16315 ?auto_16311 ) ) ( not ( = ?auto_16315 ?auto_16313 ) ) ( not ( = ?auto_16315 ?auto_16309 ) ) ( not ( = ?auto_16315 ?auto_16301 ) ) ( not ( = ?auto_16315 ?auto_16324 ) ) ( not ( = ?auto_16317 ?auto_16307 ) ) ( not ( = ?auto_16317 ?auto_16302 ) ) ( not ( = ?auto_16317 ?auto_16303 ) ) ( not ( = ?auto_16317 ?auto_16326 ) ) ( not ( = ?auto_16317 ?auto_16318 ) ) ( not ( = ?auto_16312 ?auto_16306 ) ) ( not ( = ?auto_16312 ?auto_16320 ) ) ( not ( = ?auto_16312 ?auto_16304 ) ) ( not ( = ?auto_16312 ?auto_16305 ) ) ( not ( = ?auto_16312 ?auto_16316 ) ) ( not ( = ?auto_16282 ?auto_16289 ) ) ( not ( = ?auto_16282 ?auto_16310 ) ) ( not ( = ?auto_16283 ?auto_16289 ) ) ( not ( = ?auto_16283 ?auto_16310 ) ) ( not ( = ?auto_16284 ?auto_16289 ) ) ( not ( = ?auto_16284 ?auto_16310 ) ) ( not ( = ?auto_16285 ?auto_16289 ) ) ( not ( = ?auto_16285 ?auto_16310 ) ) ( not ( = ?auto_16286 ?auto_16289 ) ) ( not ( = ?auto_16286 ?auto_16310 ) ) ( not ( = ?auto_16287 ?auto_16289 ) ) ( not ( = ?auto_16287 ?auto_16310 ) ) ( not ( = ?auto_16289 ?auto_16312 ) ) ( not ( = ?auto_16289 ?auto_16306 ) ) ( not ( = ?auto_16289 ?auto_16320 ) ) ( not ( = ?auto_16289 ?auto_16304 ) ) ( not ( = ?auto_16289 ?auto_16305 ) ) ( not ( = ?auto_16289 ?auto_16316 ) ) ( not ( = ?auto_16310 ?auto_16312 ) ) ( not ( = ?auto_16310 ?auto_16306 ) ) ( not ( = ?auto_16310 ?auto_16320 ) ) ( not ( = ?auto_16310 ?auto_16304 ) ) ( not ( = ?auto_16310 ?auto_16305 ) ) ( not ( = ?auto_16310 ?auto_16316 ) ) ( not ( = ?auto_16282 ?auto_16290 ) ) ( not ( = ?auto_16282 ?auto_16314 ) ) ( not ( = ?auto_16283 ?auto_16290 ) ) ( not ( = ?auto_16283 ?auto_16314 ) ) ( not ( = ?auto_16284 ?auto_16290 ) ) ( not ( = ?auto_16284 ?auto_16314 ) ) ( not ( = ?auto_16285 ?auto_16290 ) ) ( not ( = ?auto_16285 ?auto_16314 ) ) ( not ( = ?auto_16286 ?auto_16290 ) ) ( not ( = ?auto_16286 ?auto_16314 ) ) ( not ( = ?auto_16287 ?auto_16290 ) ) ( not ( = ?auto_16287 ?auto_16314 ) ) ( not ( = ?auto_16288 ?auto_16290 ) ) ( not ( = ?auto_16288 ?auto_16314 ) ) ( not ( = ?auto_16290 ?auto_16310 ) ) ( not ( = ?auto_16290 ?auto_16312 ) ) ( not ( = ?auto_16290 ?auto_16306 ) ) ( not ( = ?auto_16290 ?auto_16320 ) ) ( not ( = ?auto_16290 ?auto_16304 ) ) ( not ( = ?auto_16290 ?auto_16305 ) ) ( not ( = ?auto_16290 ?auto_16316 ) ) ( not ( = ?auto_16314 ?auto_16310 ) ) ( not ( = ?auto_16314 ?auto_16312 ) ) ( not ( = ?auto_16314 ?auto_16306 ) ) ( not ( = ?auto_16314 ?auto_16320 ) ) ( not ( = ?auto_16314 ?auto_16304 ) ) ( not ( = ?auto_16314 ?auto_16305 ) ) ( not ( = ?auto_16314 ?auto_16316 ) ) ( not ( = ?auto_16282 ?auto_16291 ) ) ( not ( = ?auto_16282 ?auto_16325 ) ) ( not ( = ?auto_16283 ?auto_16291 ) ) ( not ( = ?auto_16283 ?auto_16325 ) ) ( not ( = ?auto_16284 ?auto_16291 ) ) ( not ( = ?auto_16284 ?auto_16325 ) ) ( not ( = ?auto_16285 ?auto_16291 ) ) ( not ( = ?auto_16285 ?auto_16325 ) ) ( not ( = ?auto_16286 ?auto_16291 ) ) ( not ( = ?auto_16286 ?auto_16325 ) ) ( not ( = ?auto_16287 ?auto_16291 ) ) ( not ( = ?auto_16287 ?auto_16325 ) ) ( not ( = ?auto_16288 ?auto_16291 ) ) ( not ( = ?auto_16288 ?auto_16325 ) ) ( not ( = ?auto_16289 ?auto_16291 ) ) ( not ( = ?auto_16289 ?auto_16325 ) ) ( not ( = ?auto_16291 ?auto_16314 ) ) ( not ( = ?auto_16291 ?auto_16310 ) ) ( not ( = ?auto_16291 ?auto_16312 ) ) ( not ( = ?auto_16291 ?auto_16306 ) ) ( not ( = ?auto_16291 ?auto_16320 ) ) ( not ( = ?auto_16291 ?auto_16304 ) ) ( not ( = ?auto_16291 ?auto_16305 ) ) ( not ( = ?auto_16291 ?auto_16316 ) ) ( not ( = ?auto_16325 ?auto_16314 ) ) ( not ( = ?auto_16325 ?auto_16310 ) ) ( not ( = ?auto_16325 ?auto_16312 ) ) ( not ( = ?auto_16325 ?auto_16306 ) ) ( not ( = ?auto_16325 ?auto_16320 ) ) ( not ( = ?auto_16325 ?auto_16304 ) ) ( not ( = ?auto_16325 ?auto_16305 ) ) ( not ( = ?auto_16325 ?auto_16316 ) ) ( not ( = ?auto_16282 ?auto_16292 ) ) ( not ( = ?auto_16282 ?auto_16327 ) ) ( not ( = ?auto_16283 ?auto_16292 ) ) ( not ( = ?auto_16283 ?auto_16327 ) ) ( not ( = ?auto_16284 ?auto_16292 ) ) ( not ( = ?auto_16284 ?auto_16327 ) ) ( not ( = ?auto_16285 ?auto_16292 ) ) ( not ( = ?auto_16285 ?auto_16327 ) ) ( not ( = ?auto_16286 ?auto_16292 ) ) ( not ( = ?auto_16286 ?auto_16327 ) ) ( not ( = ?auto_16287 ?auto_16292 ) ) ( not ( = ?auto_16287 ?auto_16327 ) ) ( not ( = ?auto_16288 ?auto_16292 ) ) ( not ( = ?auto_16288 ?auto_16327 ) ) ( not ( = ?auto_16289 ?auto_16292 ) ) ( not ( = ?auto_16289 ?auto_16327 ) ) ( not ( = ?auto_16290 ?auto_16292 ) ) ( not ( = ?auto_16290 ?auto_16327 ) ) ( not ( = ?auto_16292 ?auto_16325 ) ) ( not ( = ?auto_16292 ?auto_16314 ) ) ( not ( = ?auto_16292 ?auto_16310 ) ) ( not ( = ?auto_16292 ?auto_16312 ) ) ( not ( = ?auto_16292 ?auto_16306 ) ) ( not ( = ?auto_16292 ?auto_16320 ) ) ( not ( = ?auto_16292 ?auto_16304 ) ) ( not ( = ?auto_16292 ?auto_16305 ) ) ( not ( = ?auto_16292 ?auto_16316 ) ) ( not ( = ?auto_16319 ?auto_16301 ) ) ( not ( = ?auto_16319 ?auto_16315 ) ) ( not ( = ?auto_16319 ?auto_16311 ) ) ( not ( = ?auto_16319 ?auto_16313 ) ) ( not ( = ?auto_16319 ?auto_16309 ) ) ( not ( = ?auto_16319 ?auto_16324 ) ) ( not ( = ?auto_16308 ?auto_16326 ) ) ( not ( = ?auto_16308 ?auto_16317 ) ) ( not ( = ?auto_16308 ?auto_16307 ) ) ( not ( = ?auto_16308 ?auto_16302 ) ) ( not ( = ?auto_16308 ?auto_16303 ) ) ( not ( = ?auto_16308 ?auto_16318 ) ) ( not ( = ?auto_16327 ?auto_16325 ) ) ( not ( = ?auto_16327 ?auto_16314 ) ) ( not ( = ?auto_16327 ?auto_16310 ) ) ( not ( = ?auto_16327 ?auto_16312 ) ) ( not ( = ?auto_16327 ?auto_16306 ) ) ( not ( = ?auto_16327 ?auto_16320 ) ) ( not ( = ?auto_16327 ?auto_16304 ) ) ( not ( = ?auto_16327 ?auto_16305 ) ) ( not ( = ?auto_16327 ?auto_16316 ) ) ( not ( = ?auto_16282 ?auto_16293 ) ) ( not ( = ?auto_16282 ?auto_16321 ) ) ( not ( = ?auto_16283 ?auto_16293 ) ) ( not ( = ?auto_16283 ?auto_16321 ) ) ( not ( = ?auto_16284 ?auto_16293 ) ) ( not ( = ?auto_16284 ?auto_16321 ) ) ( not ( = ?auto_16285 ?auto_16293 ) ) ( not ( = ?auto_16285 ?auto_16321 ) ) ( not ( = ?auto_16286 ?auto_16293 ) ) ( not ( = ?auto_16286 ?auto_16321 ) ) ( not ( = ?auto_16287 ?auto_16293 ) ) ( not ( = ?auto_16287 ?auto_16321 ) ) ( not ( = ?auto_16288 ?auto_16293 ) ) ( not ( = ?auto_16288 ?auto_16321 ) ) ( not ( = ?auto_16289 ?auto_16293 ) ) ( not ( = ?auto_16289 ?auto_16321 ) ) ( not ( = ?auto_16290 ?auto_16293 ) ) ( not ( = ?auto_16290 ?auto_16321 ) ) ( not ( = ?auto_16291 ?auto_16293 ) ) ( not ( = ?auto_16291 ?auto_16321 ) ) ( not ( = ?auto_16293 ?auto_16327 ) ) ( not ( = ?auto_16293 ?auto_16325 ) ) ( not ( = ?auto_16293 ?auto_16314 ) ) ( not ( = ?auto_16293 ?auto_16310 ) ) ( not ( = ?auto_16293 ?auto_16312 ) ) ( not ( = ?auto_16293 ?auto_16306 ) ) ( not ( = ?auto_16293 ?auto_16320 ) ) ( not ( = ?auto_16293 ?auto_16304 ) ) ( not ( = ?auto_16293 ?auto_16305 ) ) ( not ( = ?auto_16293 ?auto_16316 ) ) ( not ( = ?auto_16323 ?auto_16319 ) ) ( not ( = ?auto_16323 ?auto_16301 ) ) ( not ( = ?auto_16323 ?auto_16315 ) ) ( not ( = ?auto_16323 ?auto_16311 ) ) ( not ( = ?auto_16323 ?auto_16313 ) ) ( not ( = ?auto_16323 ?auto_16309 ) ) ( not ( = ?auto_16323 ?auto_16324 ) ) ( not ( = ?auto_16322 ?auto_16308 ) ) ( not ( = ?auto_16322 ?auto_16326 ) ) ( not ( = ?auto_16322 ?auto_16317 ) ) ( not ( = ?auto_16322 ?auto_16307 ) ) ( not ( = ?auto_16322 ?auto_16302 ) ) ( not ( = ?auto_16322 ?auto_16303 ) ) ( not ( = ?auto_16322 ?auto_16318 ) ) ( not ( = ?auto_16321 ?auto_16327 ) ) ( not ( = ?auto_16321 ?auto_16325 ) ) ( not ( = ?auto_16321 ?auto_16314 ) ) ( not ( = ?auto_16321 ?auto_16310 ) ) ( not ( = ?auto_16321 ?auto_16312 ) ) ( not ( = ?auto_16321 ?auto_16306 ) ) ( not ( = ?auto_16321 ?auto_16320 ) ) ( not ( = ?auto_16321 ?auto_16304 ) ) ( not ( = ?auto_16321 ?auto_16305 ) ) ( not ( = ?auto_16321 ?auto_16316 ) ) ( not ( = ?auto_16282 ?auto_16294 ) ) ( not ( = ?auto_16282 ?auto_16297 ) ) ( not ( = ?auto_16283 ?auto_16294 ) ) ( not ( = ?auto_16283 ?auto_16297 ) ) ( not ( = ?auto_16284 ?auto_16294 ) ) ( not ( = ?auto_16284 ?auto_16297 ) ) ( not ( = ?auto_16285 ?auto_16294 ) ) ( not ( = ?auto_16285 ?auto_16297 ) ) ( not ( = ?auto_16286 ?auto_16294 ) ) ( not ( = ?auto_16286 ?auto_16297 ) ) ( not ( = ?auto_16287 ?auto_16294 ) ) ( not ( = ?auto_16287 ?auto_16297 ) ) ( not ( = ?auto_16288 ?auto_16294 ) ) ( not ( = ?auto_16288 ?auto_16297 ) ) ( not ( = ?auto_16289 ?auto_16294 ) ) ( not ( = ?auto_16289 ?auto_16297 ) ) ( not ( = ?auto_16290 ?auto_16294 ) ) ( not ( = ?auto_16290 ?auto_16297 ) ) ( not ( = ?auto_16291 ?auto_16294 ) ) ( not ( = ?auto_16291 ?auto_16297 ) ) ( not ( = ?auto_16292 ?auto_16294 ) ) ( not ( = ?auto_16292 ?auto_16297 ) ) ( not ( = ?auto_16294 ?auto_16321 ) ) ( not ( = ?auto_16294 ?auto_16327 ) ) ( not ( = ?auto_16294 ?auto_16325 ) ) ( not ( = ?auto_16294 ?auto_16314 ) ) ( not ( = ?auto_16294 ?auto_16310 ) ) ( not ( = ?auto_16294 ?auto_16312 ) ) ( not ( = ?auto_16294 ?auto_16306 ) ) ( not ( = ?auto_16294 ?auto_16320 ) ) ( not ( = ?auto_16294 ?auto_16304 ) ) ( not ( = ?auto_16294 ?auto_16305 ) ) ( not ( = ?auto_16294 ?auto_16316 ) ) ( not ( = ?auto_16300 ?auto_16323 ) ) ( not ( = ?auto_16300 ?auto_16319 ) ) ( not ( = ?auto_16300 ?auto_16301 ) ) ( not ( = ?auto_16300 ?auto_16315 ) ) ( not ( = ?auto_16300 ?auto_16311 ) ) ( not ( = ?auto_16300 ?auto_16313 ) ) ( not ( = ?auto_16300 ?auto_16309 ) ) ( not ( = ?auto_16300 ?auto_16324 ) ) ( not ( = ?auto_16295 ?auto_16322 ) ) ( not ( = ?auto_16295 ?auto_16308 ) ) ( not ( = ?auto_16295 ?auto_16326 ) ) ( not ( = ?auto_16295 ?auto_16317 ) ) ( not ( = ?auto_16295 ?auto_16307 ) ) ( not ( = ?auto_16295 ?auto_16302 ) ) ( not ( = ?auto_16295 ?auto_16303 ) ) ( not ( = ?auto_16295 ?auto_16318 ) ) ( not ( = ?auto_16297 ?auto_16321 ) ) ( not ( = ?auto_16297 ?auto_16327 ) ) ( not ( = ?auto_16297 ?auto_16325 ) ) ( not ( = ?auto_16297 ?auto_16314 ) ) ( not ( = ?auto_16297 ?auto_16310 ) ) ( not ( = ?auto_16297 ?auto_16312 ) ) ( not ( = ?auto_16297 ?auto_16306 ) ) ( not ( = ?auto_16297 ?auto_16320 ) ) ( not ( = ?auto_16297 ?auto_16304 ) ) ( not ( = ?auto_16297 ?auto_16305 ) ) ( not ( = ?auto_16297 ?auto_16316 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_16282 ?auto_16283 ?auto_16284 ?auto_16285 ?auto_16286 ?auto_16287 ?auto_16288 ?auto_16289 ?auto_16290 ?auto_16291 ?auto_16292 ?auto_16293 )
      ( MAKE-1CRATE ?auto_16293 ?auto_16294 )
      ( MAKE-12CRATE-VERIFY ?auto_16282 ?auto_16283 ?auto_16284 ?auto_16285 ?auto_16286 ?auto_16287 ?auto_16288 ?auto_16289 ?auto_16290 ?auto_16291 ?auto_16292 ?auto_16293 ?auto_16294 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_16352 - SURFACE
      ?auto_16353 - SURFACE
      ?auto_16354 - SURFACE
      ?auto_16355 - SURFACE
      ?auto_16356 - SURFACE
      ?auto_16357 - SURFACE
      ?auto_16358 - SURFACE
      ?auto_16359 - SURFACE
      ?auto_16360 - SURFACE
      ?auto_16361 - SURFACE
      ?auto_16362 - SURFACE
      ?auto_16363 - SURFACE
      ?auto_16364 - SURFACE
      ?auto_16365 - SURFACE
    )
    :vars
    (
      ?auto_16367 - HOIST
      ?auto_16368 - PLACE
      ?auto_16366 - PLACE
      ?auto_16371 - HOIST
      ?auto_16370 - SURFACE
      ?auto_16388 - PLACE
      ?auto_16387 - HOIST
      ?auto_16393 - SURFACE
      ?auto_16383 - PLACE
      ?auto_16373 - HOIST
      ?auto_16377 - SURFACE
      ?auto_16376 - PLACE
      ?auto_16389 - HOIST
      ?auto_16390 - SURFACE
      ?auto_16374 - PLACE
      ?auto_16397 - HOIST
      ?auto_16386 - SURFACE
      ?auto_16385 - SURFACE
      ?auto_16372 - SURFACE
      ?auto_16394 - PLACE
      ?auto_16379 - HOIST
      ?auto_16382 - SURFACE
      ?auto_16401 - PLACE
      ?auto_16381 - HOIST
      ?auto_16398 - SURFACE
      ?auto_16375 - PLACE
      ?auto_16380 - HOIST
      ?auto_16384 - SURFACE
      ?auto_16378 - PLACE
      ?auto_16400 - HOIST
      ?auto_16399 - SURFACE
      ?auto_16391 - SURFACE
      ?auto_16396 - PLACE
      ?auto_16395 - HOIST
      ?auto_16392 - SURFACE
      ?auto_16369 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16367 ?auto_16368 ) ( IS-CRATE ?auto_16365 ) ( not ( = ?auto_16366 ?auto_16368 ) ) ( HOIST-AT ?auto_16371 ?auto_16366 ) ( AVAILABLE ?auto_16371 ) ( SURFACE-AT ?auto_16365 ?auto_16366 ) ( ON ?auto_16365 ?auto_16370 ) ( CLEAR ?auto_16365 ) ( not ( = ?auto_16364 ?auto_16365 ) ) ( not ( = ?auto_16364 ?auto_16370 ) ) ( not ( = ?auto_16365 ?auto_16370 ) ) ( not ( = ?auto_16367 ?auto_16371 ) ) ( IS-CRATE ?auto_16364 ) ( not ( = ?auto_16388 ?auto_16368 ) ) ( HOIST-AT ?auto_16387 ?auto_16388 ) ( AVAILABLE ?auto_16387 ) ( SURFACE-AT ?auto_16364 ?auto_16388 ) ( ON ?auto_16364 ?auto_16393 ) ( CLEAR ?auto_16364 ) ( not ( = ?auto_16363 ?auto_16364 ) ) ( not ( = ?auto_16363 ?auto_16393 ) ) ( not ( = ?auto_16364 ?auto_16393 ) ) ( not ( = ?auto_16367 ?auto_16387 ) ) ( IS-CRATE ?auto_16363 ) ( not ( = ?auto_16383 ?auto_16368 ) ) ( HOIST-AT ?auto_16373 ?auto_16383 ) ( AVAILABLE ?auto_16373 ) ( SURFACE-AT ?auto_16363 ?auto_16383 ) ( ON ?auto_16363 ?auto_16377 ) ( CLEAR ?auto_16363 ) ( not ( = ?auto_16362 ?auto_16363 ) ) ( not ( = ?auto_16362 ?auto_16377 ) ) ( not ( = ?auto_16363 ?auto_16377 ) ) ( not ( = ?auto_16367 ?auto_16373 ) ) ( IS-CRATE ?auto_16362 ) ( not ( = ?auto_16376 ?auto_16368 ) ) ( HOIST-AT ?auto_16389 ?auto_16376 ) ( AVAILABLE ?auto_16389 ) ( SURFACE-AT ?auto_16362 ?auto_16376 ) ( ON ?auto_16362 ?auto_16390 ) ( CLEAR ?auto_16362 ) ( not ( = ?auto_16361 ?auto_16362 ) ) ( not ( = ?auto_16361 ?auto_16390 ) ) ( not ( = ?auto_16362 ?auto_16390 ) ) ( not ( = ?auto_16367 ?auto_16389 ) ) ( IS-CRATE ?auto_16361 ) ( not ( = ?auto_16374 ?auto_16368 ) ) ( HOIST-AT ?auto_16397 ?auto_16374 ) ( SURFACE-AT ?auto_16361 ?auto_16374 ) ( ON ?auto_16361 ?auto_16386 ) ( CLEAR ?auto_16361 ) ( not ( = ?auto_16360 ?auto_16361 ) ) ( not ( = ?auto_16360 ?auto_16386 ) ) ( not ( = ?auto_16361 ?auto_16386 ) ) ( not ( = ?auto_16367 ?auto_16397 ) ) ( IS-CRATE ?auto_16360 ) ( SURFACE-AT ?auto_16360 ?auto_16374 ) ( ON ?auto_16360 ?auto_16385 ) ( CLEAR ?auto_16360 ) ( not ( = ?auto_16359 ?auto_16360 ) ) ( not ( = ?auto_16359 ?auto_16385 ) ) ( not ( = ?auto_16360 ?auto_16385 ) ) ( IS-CRATE ?auto_16359 ) ( SURFACE-AT ?auto_16359 ?auto_16374 ) ( ON ?auto_16359 ?auto_16372 ) ( CLEAR ?auto_16359 ) ( not ( = ?auto_16358 ?auto_16359 ) ) ( not ( = ?auto_16358 ?auto_16372 ) ) ( not ( = ?auto_16359 ?auto_16372 ) ) ( IS-CRATE ?auto_16358 ) ( not ( = ?auto_16394 ?auto_16368 ) ) ( HOIST-AT ?auto_16379 ?auto_16394 ) ( AVAILABLE ?auto_16379 ) ( SURFACE-AT ?auto_16358 ?auto_16394 ) ( ON ?auto_16358 ?auto_16382 ) ( CLEAR ?auto_16358 ) ( not ( = ?auto_16357 ?auto_16358 ) ) ( not ( = ?auto_16357 ?auto_16382 ) ) ( not ( = ?auto_16358 ?auto_16382 ) ) ( not ( = ?auto_16367 ?auto_16379 ) ) ( IS-CRATE ?auto_16357 ) ( not ( = ?auto_16401 ?auto_16368 ) ) ( HOIST-AT ?auto_16381 ?auto_16401 ) ( AVAILABLE ?auto_16381 ) ( SURFACE-AT ?auto_16357 ?auto_16401 ) ( ON ?auto_16357 ?auto_16398 ) ( CLEAR ?auto_16357 ) ( not ( = ?auto_16356 ?auto_16357 ) ) ( not ( = ?auto_16356 ?auto_16398 ) ) ( not ( = ?auto_16357 ?auto_16398 ) ) ( not ( = ?auto_16367 ?auto_16381 ) ) ( IS-CRATE ?auto_16356 ) ( not ( = ?auto_16375 ?auto_16368 ) ) ( HOIST-AT ?auto_16380 ?auto_16375 ) ( AVAILABLE ?auto_16380 ) ( SURFACE-AT ?auto_16356 ?auto_16375 ) ( ON ?auto_16356 ?auto_16384 ) ( CLEAR ?auto_16356 ) ( not ( = ?auto_16355 ?auto_16356 ) ) ( not ( = ?auto_16355 ?auto_16384 ) ) ( not ( = ?auto_16356 ?auto_16384 ) ) ( not ( = ?auto_16367 ?auto_16380 ) ) ( IS-CRATE ?auto_16355 ) ( not ( = ?auto_16378 ?auto_16368 ) ) ( HOIST-AT ?auto_16400 ?auto_16378 ) ( AVAILABLE ?auto_16400 ) ( SURFACE-AT ?auto_16355 ?auto_16378 ) ( ON ?auto_16355 ?auto_16399 ) ( CLEAR ?auto_16355 ) ( not ( = ?auto_16354 ?auto_16355 ) ) ( not ( = ?auto_16354 ?auto_16399 ) ) ( not ( = ?auto_16355 ?auto_16399 ) ) ( not ( = ?auto_16367 ?auto_16400 ) ) ( IS-CRATE ?auto_16354 ) ( AVAILABLE ?auto_16397 ) ( SURFACE-AT ?auto_16354 ?auto_16374 ) ( ON ?auto_16354 ?auto_16391 ) ( CLEAR ?auto_16354 ) ( not ( = ?auto_16353 ?auto_16354 ) ) ( not ( = ?auto_16353 ?auto_16391 ) ) ( not ( = ?auto_16354 ?auto_16391 ) ) ( SURFACE-AT ?auto_16352 ?auto_16368 ) ( CLEAR ?auto_16352 ) ( IS-CRATE ?auto_16353 ) ( AVAILABLE ?auto_16367 ) ( not ( = ?auto_16396 ?auto_16368 ) ) ( HOIST-AT ?auto_16395 ?auto_16396 ) ( AVAILABLE ?auto_16395 ) ( SURFACE-AT ?auto_16353 ?auto_16396 ) ( ON ?auto_16353 ?auto_16392 ) ( CLEAR ?auto_16353 ) ( TRUCK-AT ?auto_16369 ?auto_16368 ) ( not ( = ?auto_16352 ?auto_16353 ) ) ( not ( = ?auto_16352 ?auto_16392 ) ) ( not ( = ?auto_16353 ?auto_16392 ) ) ( not ( = ?auto_16367 ?auto_16395 ) ) ( not ( = ?auto_16352 ?auto_16354 ) ) ( not ( = ?auto_16352 ?auto_16391 ) ) ( not ( = ?auto_16354 ?auto_16392 ) ) ( not ( = ?auto_16374 ?auto_16396 ) ) ( not ( = ?auto_16397 ?auto_16395 ) ) ( not ( = ?auto_16391 ?auto_16392 ) ) ( not ( = ?auto_16352 ?auto_16355 ) ) ( not ( = ?auto_16352 ?auto_16399 ) ) ( not ( = ?auto_16353 ?auto_16355 ) ) ( not ( = ?auto_16353 ?auto_16399 ) ) ( not ( = ?auto_16355 ?auto_16391 ) ) ( not ( = ?auto_16355 ?auto_16392 ) ) ( not ( = ?auto_16378 ?auto_16374 ) ) ( not ( = ?auto_16378 ?auto_16396 ) ) ( not ( = ?auto_16400 ?auto_16397 ) ) ( not ( = ?auto_16400 ?auto_16395 ) ) ( not ( = ?auto_16399 ?auto_16391 ) ) ( not ( = ?auto_16399 ?auto_16392 ) ) ( not ( = ?auto_16352 ?auto_16356 ) ) ( not ( = ?auto_16352 ?auto_16384 ) ) ( not ( = ?auto_16353 ?auto_16356 ) ) ( not ( = ?auto_16353 ?auto_16384 ) ) ( not ( = ?auto_16354 ?auto_16356 ) ) ( not ( = ?auto_16354 ?auto_16384 ) ) ( not ( = ?auto_16356 ?auto_16399 ) ) ( not ( = ?auto_16356 ?auto_16391 ) ) ( not ( = ?auto_16356 ?auto_16392 ) ) ( not ( = ?auto_16375 ?auto_16378 ) ) ( not ( = ?auto_16375 ?auto_16374 ) ) ( not ( = ?auto_16375 ?auto_16396 ) ) ( not ( = ?auto_16380 ?auto_16400 ) ) ( not ( = ?auto_16380 ?auto_16397 ) ) ( not ( = ?auto_16380 ?auto_16395 ) ) ( not ( = ?auto_16384 ?auto_16399 ) ) ( not ( = ?auto_16384 ?auto_16391 ) ) ( not ( = ?auto_16384 ?auto_16392 ) ) ( not ( = ?auto_16352 ?auto_16357 ) ) ( not ( = ?auto_16352 ?auto_16398 ) ) ( not ( = ?auto_16353 ?auto_16357 ) ) ( not ( = ?auto_16353 ?auto_16398 ) ) ( not ( = ?auto_16354 ?auto_16357 ) ) ( not ( = ?auto_16354 ?auto_16398 ) ) ( not ( = ?auto_16355 ?auto_16357 ) ) ( not ( = ?auto_16355 ?auto_16398 ) ) ( not ( = ?auto_16357 ?auto_16384 ) ) ( not ( = ?auto_16357 ?auto_16399 ) ) ( not ( = ?auto_16357 ?auto_16391 ) ) ( not ( = ?auto_16357 ?auto_16392 ) ) ( not ( = ?auto_16401 ?auto_16375 ) ) ( not ( = ?auto_16401 ?auto_16378 ) ) ( not ( = ?auto_16401 ?auto_16374 ) ) ( not ( = ?auto_16401 ?auto_16396 ) ) ( not ( = ?auto_16381 ?auto_16380 ) ) ( not ( = ?auto_16381 ?auto_16400 ) ) ( not ( = ?auto_16381 ?auto_16397 ) ) ( not ( = ?auto_16381 ?auto_16395 ) ) ( not ( = ?auto_16398 ?auto_16384 ) ) ( not ( = ?auto_16398 ?auto_16399 ) ) ( not ( = ?auto_16398 ?auto_16391 ) ) ( not ( = ?auto_16398 ?auto_16392 ) ) ( not ( = ?auto_16352 ?auto_16358 ) ) ( not ( = ?auto_16352 ?auto_16382 ) ) ( not ( = ?auto_16353 ?auto_16358 ) ) ( not ( = ?auto_16353 ?auto_16382 ) ) ( not ( = ?auto_16354 ?auto_16358 ) ) ( not ( = ?auto_16354 ?auto_16382 ) ) ( not ( = ?auto_16355 ?auto_16358 ) ) ( not ( = ?auto_16355 ?auto_16382 ) ) ( not ( = ?auto_16356 ?auto_16358 ) ) ( not ( = ?auto_16356 ?auto_16382 ) ) ( not ( = ?auto_16358 ?auto_16398 ) ) ( not ( = ?auto_16358 ?auto_16384 ) ) ( not ( = ?auto_16358 ?auto_16399 ) ) ( not ( = ?auto_16358 ?auto_16391 ) ) ( not ( = ?auto_16358 ?auto_16392 ) ) ( not ( = ?auto_16394 ?auto_16401 ) ) ( not ( = ?auto_16394 ?auto_16375 ) ) ( not ( = ?auto_16394 ?auto_16378 ) ) ( not ( = ?auto_16394 ?auto_16374 ) ) ( not ( = ?auto_16394 ?auto_16396 ) ) ( not ( = ?auto_16379 ?auto_16381 ) ) ( not ( = ?auto_16379 ?auto_16380 ) ) ( not ( = ?auto_16379 ?auto_16400 ) ) ( not ( = ?auto_16379 ?auto_16397 ) ) ( not ( = ?auto_16379 ?auto_16395 ) ) ( not ( = ?auto_16382 ?auto_16398 ) ) ( not ( = ?auto_16382 ?auto_16384 ) ) ( not ( = ?auto_16382 ?auto_16399 ) ) ( not ( = ?auto_16382 ?auto_16391 ) ) ( not ( = ?auto_16382 ?auto_16392 ) ) ( not ( = ?auto_16352 ?auto_16359 ) ) ( not ( = ?auto_16352 ?auto_16372 ) ) ( not ( = ?auto_16353 ?auto_16359 ) ) ( not ( = ?auto_16353 ?auto_16372 ) ) ( not ( = ?auto_16354 ?auto_16359 ) ) ( not ( = ?auto_16354 ?auto_16372 ) ) ( not ( = ?auto_16355 ?auto_16359 ) ) ( not ( = ?auto_16355 ?auto_16372 ) ) ( not ( = ?auto_16356 ?auto_16359 ) ) ( not ( = ?auto_16356 ?auto_16372 ) ) ( not ( = ?auto_16357 ?auto_16359 ) ) ( not ( = ?auto_16357 ?auto_16372 ) ) ( not ( = ?auto_16359 ?auto_16382 ) ) ( not ( = ?auto_16359 ?auto_16398 ) ) ( not ( = ?auto_16359 ?auto_16384 ) ) ( not ( = ?auto_16359 ?auto_16399 ) ) ( not ( = ?auto_16359 ?auto_16391 ) ) ( not ( = ?auto_16359 ?auto_16392 ) ) ( not ( = ?auto_16372 ?auto_16382 ) ) ( not ( = ?auto_16372 ?auto_16398 ) ) ( not ( = ?auto_16372 ?auto_16384 ) ) ( not ( = ?auto_16372 ?auto_16399 ) ) ( not ( = ?auto_16372 ?auto_16391 ) ) ( not ( = ?auto_16372 ?auto_16392 ) ) ( not ( = ?auto_16352 ?auto_16360 ) ) ( not ( = ?auto_16352 ?auto_16385 ) ) ( not ( = ?auto_16353 ?auto_16360 ) ) ( not ( = ?auto_16353 ?auto_16385 ) ) ( not ( = ?auto_16354 ?auto_16360 ) ) ( not ( = ?auto_16354 ?auto_16385 ) ) ( not ( = ?auto_16355 ?auto_16360 ) ) ( not ( = ?auto_16355 ?auto_16385 ) ) ( not ( = ?auto_16356 ?auto_16360 ) ) ( not ( = ?auto_16356 ?auto_16385 ) ) ( not ( = ?auto_16357 ?auto_16360 ) ) ( not ( = ?auto_16357 ?auto_16385 ) ) ( not ( = ?auto_16358 ?auto_16360 ) ) ( not ( = ?auto_16358 ?auto_16385 ) ) ( not ( = ?auto_16360 ?auto_16372 ) ) ( not ( = ?auto_16360 ?auto_16382 ) ) ( not ( = ?auto_16360 ?auto_16398 ) ) ( not ( = ?auto_16360 ?auto_16384 ) ) ( not ( = ?auto_16360 ?auto_16399 ) ) ( not ( = ?auto_16360 ?auto_16391 ) ) ( not ( = ?auto_16360 ?auto_16392 ) ) ( not ( = ?auto_16385 ?auto_16372 ) ) ( not ( = ?auto_16385 ?auto_16382 ) ) ( not ( = ?auto_16385 ?auto_16398 ) ) ( not ( = ?auto_16385 ?auto_16384 ) ) ( not ( = ?auto_16385 ?auto_16399 ) ) ( not ( = ?auto_16385 ?auto_16391 ) ) ( not ( = ?auto_16385 ?auto_16392 ) ) ( not ( = ?auto_16352 ?auto_16361 ) ) ( not ( = ?auto_16352 ?auto_16386 ) ) ( not ( = ?auto_16353 ?auto_16361 ) ) ( not ( = ?auto_16353 ?auto_16386 ) ) ( not ( = ?auto_16354 ?auto_16361 ) ) ( not ( = ?auto_16354 ?auto_16386 ) ) ( not ( = ?auto_16355 ?auto_16361 ) ) ( not ( = ?auto_16355 ?auto_16386 ) ) ( not ( = ?auto_16356 ?auto_16361 ) ) ( not ( = ?auto_16356 ?auto_16386 ) ) ( not ( = ?auto_16357 ?auto_16361 ) ) ( not ( = ?auto_16357 ?auto_16386 ) ) ( not ( = ?auto_16358 ?auto_16361 ) ) ( not ( = ?auto_16358 ?auto_16386 ) ) ( not ( = ?auto_16359 ?auto_16361 ) ) ( not ( = ?auto_16359 ?auto_16386 ) ) ( not ( = ?auto_16361 ?auto_16385 ) ) ( not ( = ?auto_16361 ?auto_16372 ) ) ( not ( = ?auto_16361 ?auto_16382 ) ) ( not ( = ?auto_16361 ?auto_16398 ) ) ( not ( = ?auto_16361 ?auto_16384 ) ) ( not ( = ?auto_16361 ?auto_16399 ) ) ( not ( = ?auto_16361 ?auto_16391 ) ) ( not ( = ?auto_16361 ?auto_16392 ) ) ( not ( = ?auto_16386 ?auto_16385 ) ) ( not ( = ?auto_16386 ?auto_16372 ) ) ( not ( = ?auto_16386 ?auto_16382 ) ) ( not ( = ?auto_16386 ?auto_16398 ) ) ( not ( = ?auto_16386 ?auto_16384 ) ) ( not ( = ?auto_16386 ?auto_16399 ) ) ( not ( = ?auto_16386 ?auto_16391 ) ) ( not ( = ?auto_16386 ?auto_16392 ) ) ( not ( = ?auto_16352 ?auto_16362 ) ) ( not ( = ?auto_16352 ?auto_16390 ) ) ( not ( = ?auto_16353 ?auto_16362 ) ) ( not ( = ?auto_16353 ?auto_16390 ) ) ( not ( = ?auto_16354 ?auto_16362 ) ) ( not ( = ?auto_16354 ?auto_16390 ) ) ( not ( = ?auto_16355 ?auto_16362 ) ) ( not ( = ?auto_16355 ?auto_16390 ) ) ( not ( = ?auto_16356 ?auto_16362 ) ) ( not ( = ?auto_16356 ?auto_16390 ) ) ( not ( = ?auto_16357 ?auto_16362 ) ) ( not ( = ?auto_16357 ?auto_16390 ) ) ( not ( = ?auto_16358 ?auto_16362 ) ) ( not ( = ?auto_16358 ?auto_16390 ) ) ( not ( = ?auto_16359 ?auto_16362 ) ) ( not ( = ?auto_16359 ?auto_16390 ) ) ( not ( = ?auto_16360 ?auto_16362 ) ) ( not ( = ?auto_16360 ?auto_16390 ) ) ( not ( = ?auto_16362 ?auto_16386 ) ) ( not ( = ?auto_16362 ?auto_16385 ) ) ( not ( = ?auto_16362 ?auto_16372 ) ) ( not ( = ?auto_16362 ?auto_16382 ) ) ( not ( = ?auto_16362 ?auto_16398 ) ) ( not ( = ?auto_16362 ?auto_16384 ) ) ( not ( = ?auto_16362 ?auto_16399 ) ) ( not ( = ?auto_16362 ?auto_16391 ) ) ( not ( = ?auto_16362 ?auto_16392 ) ) ( not ( = ?auto_16376 ?auto_16374 ) ) ( not ( = ?auto_16376 ?auto_16394 ) ) ( not ( = ?auto_16376 ?auto_16401 ) ) ( not ( = ?auto_16376 ?auto_16375 ) ) ( not ( = ?auto_16376 ?auto_16378 ) ) ( not ( = ?auto_16376 ?auto_16396 ) ) ( not ( = ?auto_16389 ?auto_16397 ) ) ( not ( = ?auto_16389 ?auto_16379 ) ) ( not ( = ?auto_16389 ?auto_16381 ) ) ( not ( = ?auto_16389 ?auto_16380 ) ) ( not ( = ?auto_16389 ?auto_16400 ) ) ( not ( = ?auto_16389 ?auto_16395 ) ) ( not ( = ?auto_16390 ?auto_16386 ) ) ( not ( = ?auto_16390 ?auto_16385 ) ) ( not ( = ?auto_16390 ?auto_16372 ) ) ( not ( = ?auto_16390 ?auto_16382 ) ) ( not ( = ?auto_16390 ?auto_16398 ) ) ( not ( = ?auto_16390 ?auto_16384 ) ) ( not ( = ?auto_16390 ?auto_16399 ) ) ( not ( = ?auto_16390 ?auto_16391 ) ) ( not ( = ?auto_16390 ?auto_16392 ) ) ( not ( = ?auto_16352 ?auto_16363 ) ) ( not ( = ?auto_16352 ?auto_16377 ) ) ( not ( = ?auto_16353 ?auto_16363 ) ) ( not ( = ?auto_16353 ?auto_16377 ) ) ( not ( = ?auto_16354 ?auto_16363 ) ) ( not ( = ?auto_16354 ?auto_16377 ) ) ( not ( = ?auto_16355 ?auto_16363 ) ) ( not ( = ?auto_16355 ?auto_16377 ) ) ( not ( = ?auto_16356 ?auto_16363 ) ) ( not ( = ?auto_16356 ?auto_16377 ) ) ( not ( = ?auto_16357 ?auto_16363 ) ) ( not ( = ?auto_16357 ?auto_16377 ) ) ( not ( = ?auto_16358 ?auto_16363 ) ) ( not ( = ?auto_16358 ?auto_16377 ) ) ( not ( = ?auto_16359 ?auto_16363 ) ) ( not ( = ?auto_16359 ?auto_16377 ) ) ( not ( = ?auto_16360 ?auto_16363 ) ) ( not ( = ?auto_16360 ?auto_16377 ) ) ( not ( = ?auto_16361 ?auto_16363 ) ) ( not ( = ?auto_16361 ?auto_16377 ) ) ( not ( = ?auto_16363 ?auto_16390 ) ) ( not ( = ?auto_16363 ?auto_16386 ) ) ( not ( = ?auto_16363 ?auto_16385 ) ) ( not ( = ?auto_16363 ?auto_16372 ) ) ( not ( = ?auto_16363 ?auto_16382 ) ) ( not ( = ?auto_16363 ?auto_16398 ) ) ( not ( = ?auto_16363 ?auto_16384 ) ) ( not ( = ?auto_16363 ?auto_16399 ) ) ( not ( = ?auto_16363 ?auto_16391 ) ) ( not ( = ?auto_16363 ?auto_16392 ) ) ( not ( = ?auto_16383 ?auto_16376 ) ) ( not ( = ?auto_16383 ?auto_16374 ) ) ( not ( = ?auto_16383 ?auto_16394 ) ) ( not ( = ?auto_16383 ?auto_16401 ) ) ( not ( = ?auto_16383 ?auto_16375 ) ) ( not ( = ?auto_16383 ?auto_16378 ) ) ( not ( = ?auto_16383 ?auto_16396 ) ) ( not ( = ?auto_16373 ?auto_16389 ) ) ( not ( = ?auto_16373 ?auto_16397 ) ) ( not ( = ?auto_16373 ?auto_16379 ) ) ( not ( = ?auto_16373 ?auto_16381 ) ) ( not ( = ?auto_16373 ?auto_16380 ) ) ( not ( = ?auto_16373 ?auto_16400 ) ) ( not ( = ?auto_16373 ?auto_16395 ) ) ( not ( = ?auto_16377 ?auto_16390 ) ) ( not ( = ?auto_16377 ?auto_16386 ) ) ( not ( = ?auto_16377 ?auto_16385 ) ) ( not ( = ?auto_16377 ?auto_16372 ) ) ( not ( = ?auto_16377 ?auto_16382 ) ) ( not ( = ?auto_16377 ?auto_16398 ) ) ( not ( = ?auto_16377 ?auto_16384 ) ) ( not ( = ?auto_16377 ?auto_16399 ) ) ( not ( = ?auto_16377 ?auto_16391 ) ) ( not ( = ?auto_16377 ?auto_16392 ) ) ( not ( = ?auto_16352 ?auto_16364 ) ) ( not ( = ?auto_16352 ?auto_16393 ) ) ( not ( = ?auto_16353 ?auto_16364 ) ) ( not ( = ?auto_16353 ?auto_16393 ) ) ( not ( = ?auto_16354 ?auto_16364 ) ) ( not ( = ?auto_16354 ?auto_16393 ) ) ( not ( = ?auto_16355 ?auto_16364 ) ) ( not ( = ?auto_16355 ?auto_16393 ) ) ( not ( = ?auto_16356 ?auto_16364 ) ) ( not ( = ?auto_16356 ?auto_16393 ) ) ( not ( = ?auto_16357 ?auto_16364 ) ) ( not ( = ?auto_16357 ?auto_16393 ) ) ( not ( = ?auto_16358 ?auto_16364 ) ) ( not ( = ?auto_16358 ?auto_16393 ) ) ( not ( = ?auto_16359 ?auto_16364 ) ) ( not ( = ?auto_16359 ?auto_16393 ) ) ( not ( = ?auto_16360 ?auto_16364 ) ) ( not ( = ?auto_16360 ?auto_16393 ) ) ( not ( = ?auto_16361 ?auto_16364 ) ) ( not ( = ?auto_16361 ?auto_16393 ) ) ( not ( = ?auto_16362 ?auto_16364 ) ) ( not ( = ?auto_16362 ?auto_16393 ) ) ( not ( = ?auto_16364 ?auto_16377 ) ) ( not ( = ?auto_16364 ?auto_16390 ) ) ( not ( = ?auto_16364 ?auto_16386 ) ) ( not ( = ?auto_16364 ?auto_16385 ) ) ( not ( = ?auto_16364 ?auto_16372 ) ) ( not ( = ?auto_16364 ?auto_16382 ) ) ( not ( = ?auto_16364 ?auto_16398 ) ) ( not ( = ?auto_16364 ?auto_16384 ) ) ( not ( = ?auto_16364 ?auto_16399 ) ) ( not ( = ?auto_16364 ?auto_16391 ) ) ( not ( = ?auto_16364 ?auto_16392 ) ) ( not ( = ?auto_16388 ?auto_16383 ) ) ( not ( = ?auto_16388 ?auto_16376 ) ) ( not ( = ?auto_16388 ?auto_16374 ) ) ( not ( = ?auto_16388 ?auto_16394 ) ) ( not ( = ?auto_16388 ?auto_16401 ) ) ( not ( = ?auto_16388 ?auto_16375 ) ) ( not ( = ?auto_16388 ?auto_16378 ) ) ( not ( = ?auto_16388 ?auto_16396 ) ) ( not ( = ?auto_16387 ?auto_16373 ) ) ( not ( = ?auto_16387 ?auto_16389 ) ) ( not ( = ?auto_16387 ?auto_16397 ) ) ( not ( = ?auto_16387 ?auto_16379 ) ) ( not ( = ?auto_16387 ?auto_16381 ) ) ( not ( = ?auto_16387 ?auto_16380 ) ) ( not ( = ?auto_16387 ?auto_16400 ) ) ( not ( = ?auto_16387 ?auto_16395 ) ) ( not ( = ?auto_16393 ?auto_16377 ) ) ( not ( = ?auto_16393 ?auto_16390 ) ) ( not ( = ?auto_16393 ?auto_16386 ) ) ( not ( = ?auto_16393 ?auto_16385 ) ) ( not ( = ?auto_16393 ?auto_16372 ) ) ( not ( = ?auto_16393 ?auto_16382 ) ) ( not ( = ?auto_16393 ?auto_16398 ) ) ( not ( = ?auto_16393 ?auto_16384 ) ) ( not ( = ?auto_16393 ?auto_16399 ) ) ( not ( = ?auto_16393 ?auto_16391 ) ) ( not ( = ?auto_16393 ?auto_16392 ) ) ( not ( = ?auto_16352 ?auto_16365 ) ) ( not ( = ?auto_16352 ?auto_16370 ) ) ( not ( = ?auto_16353 ?auto_16365 ) ) ( not ( = ?auto_16353 ?auto_16370 ) ) ( not ( = ?auto_16354 ?auto_16365 ) ) ( not ( = ?auto_16354 ?auto_16370 ) ) ( not ( = ?auto_16355 ?auto_16365 ) ) ( not ( = ?auto_16355 ?auto_16370 ) ) ( not ( = ?auto_16356 ?auto_16365 ) ) ( not ( = ?auto_16356 ?auto_16370 ) ) ( not ( = ?auto_16357 ?auto_16365 ) ) ( not ( = ?auto_16357 ?auto_16370 ) ) ( not ( = ?auto_16358 ?auto_16365 ) ) ( not ( = ?auto_16358 ?auto_16370 ) ) ( not ( = ?auto_16359 ?auto_16365 ) ) ( not ( = ?auto_16359 ?auto_16370 ) ) ( not ( = ?auto_16360 ?auto_16365 ) ) ( not ( = ?auto_16360 ?auto_16370 ) ) ( not ( = ?auto_16361 ?auto_16365 ) ) ( not ( = ?auto_16361 ?auto_16370 ) ) ( not ( = ?auto_16362 ?auto_16365 ) ) ( not ( = ?auto_16362 ?auto_16370 ) ) ( not ( = ?auto_16363 ?auto_16365 ) ) ( not ( = ?auto_16363 ?auto_16370 ) ) ( not ( = ?auto_16365 ?auto_16393 ) ) ( not ( = ?auto_16365 ?auto_16377 ) ) ( not ( = ?auto_16365 ?auto_16390 ) ) ( not ( = ?auto_16365 ?auto_16386 ) ) ( not ( = ?auto_16365 ?auto_16385 ) ) ( not ( = ?auto_16365 ?auto_16372 ) ) ( not ( = ?auto_16365 ?auto_16382 ) ) ( not ( = ?auto_16365 ?auto_16398 ) ) ( not ( = ?auto_16365 ?auto_16384 ) ) ( not ( = ?auto_16365 ?auto_16399 ) ) ( not ( = ?auto_16365 ?auto_16391 ) ) ( not ( = ?auto_16365 ?auto_16392 ) ) ( not ( = ?auto_16366 ?auto_16388 ) ) ( not ( = ?auto_16366 ?auto_16383 ) ) ( not ( = ?auto_16366 ?auto_16376 ) ) ( not ( = ?auto_16366 ?auto_16374 ) ) ( not ( = ?auto_16366 ?auto_16394 ) ) ( not ( = ?auto_16366 ?auto_16401 ) ) ( not ( = ?auto_16366 ?auto_16375 ) ) ( not ( = ?auto_16366 ?auto_16378 ) ) ( not ( = ?auto_16366 ?auto_16396 ) ) ( not ( = ?auto_16371 ?auto_16387 ) ) ( not ( = ?auto_16371 ?auto_16373 ) ) ( not ( = ?auto_16371 ?auto_16389 ) ) ( not ( = ?auto_16371 ?auto_16397 ) ) ( not ( = ?auto_16371 ?auto_16379 ) ) ( not ( = ?auto_16371 ?auto_16381 ) ) ( not ( = ?auto_16371 ?auto_16380 ) ) ( not ( = ?auto_16371 ?auto_16400 ) ) ( not ( = ?auto_16371 ?auto_16395 ) ) ( not ( = ?auto_16370 ?auto_16393 ) ) ( not ( = ?auto_16370 ?auto_16377 ) ) ( not ( = ?auto_16370 ?auto_16390 ) ) ( not ( = ?auto_16370 ?auto_16386 ) ) ( not ( = ?auto_16370 ?auto_16385 ) ) ( not ( = ?auto_16370 ?auto_16372 ) ) ( not ( = ?auto_16370 ?auto_16382 ) ) ( not ( = ?auto_16370 ?auto_16398 ) ) ( not ( = ?auto_16370 ?auto_16384 ) ) ( not ( = ?auto_16370 ?auto_16399 ) ) ( not ( = ?auto_16370 ?auto_16391 ) ) ( not ( = ?auto_16370 ?auto_16392 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_16352 ?auto_16353 ?auto_16354 ?auto_16355 ?auto_16356 ?auto_16357 ?auto_16358 ?auto_16359 ?auto_16360 ?auto_16361 ?auto_16362 ?auto_16363 ?auto_16364 )
      ( MAKE-1CRATE ?auto_16364 ?auto_16365 )
      ( MAKE-13CRATE-VERIFY ?auto_16352 ?auto_16353 ?auto_16354 ?auto_16355 ?auto_16356 ?auto_16357 ?auto_16358 ?auto_16359 ?auto_16360 ?auto_16361 ?auto_16362 ?auto_16363 ?auto_16364 ?auto_16365 ) )
  )

)

