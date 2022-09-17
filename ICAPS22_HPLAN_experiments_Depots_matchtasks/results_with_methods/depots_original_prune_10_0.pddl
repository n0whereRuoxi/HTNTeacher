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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264797 - SURFACE
      ?auto_264798 - SURFACE
    )
    :vars
    (
      ?auto_264799 - HOIST
      ?auto_264800 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264799 ?auto_264800 ) ( SURFACE-AT ?auto_264797 ?auto_264800 ) ( CLEAR ?auto_264797 ) ( LIFTING ?auto_264799 ?auto_264798 ) ( IS-CRATE ?auto_264798 ) ( not ( = ?auto_264797 ?auto_264798 ) ) )
    :subtasks
    ( ( !DROP ?auto_264799 ?auto_264798 ?auto_264797 ?auto_264800 )
      ( MAKE-1CRATE-VERIFY ?auto_264797 ?auto_264798 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264801 - SURFACE
      ?auto_264802 - SURFACE
    )
    :vars
    (
      ?auto_264803 - HOIST
      ?auto_264804 - PLACE
      ?auto_264805 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264803 ?auto_264804 ) ( SURFACE-AT ?auto_264801 ?auto_264804 ) ( CLEAR ?auto_264801 ) ( IS-CRATE ?auto_264802 ) ( not ( = ?auto_264801 ?auto_264802 ) ) ( TRUCK-AT ?auto_264805 ?auto_264804 ) ( AVAILABLE ?auto_264803 ) ( IN ?auto_264802 ?auto_264805 ) )
    :subtasks
    ( ( !UNLOAD ?auto_264803 ?auto_264802 ?auto_264805 ?auto_264804 )
      ( MAKE-1CRATE ?auto_264801 ?auto_264802 )
      ( MAKE-1CRATE-VERIFY ?auto_264801 ?auto_264802 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264806 - SURFACE
      ?auto_264807 - SURFACE
    )
    :vars
    (
      ?auto_264810 - HOIST
      ?auto_264809 - PLACE
      ?auto_264808 - TRUCK
      ?auto_264811 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264810 ?auto_264809 ) ( SURFACE-AT ?auto_264806 ?auto_264809 ) ( CLEAR ?auto_264806 ) ( IS-CRATE ?auto_264807 ) ( not ( = ?auto_264806 ?auto_264807 ) ) ( AVAILABLE ?auto_264810 ) ( IN ?auto_264807 ?auto_264808 ) ( TRUCK-AT ?auto_264808 ?auto_264811 ) ( not ( = ?auto_264811 ?auto_264809 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_264808 ?auto_264811 ?auto_264809 )
      ( MAKE-1CRATE ?auto_264806 ?auto_264807 )
      ( MAKE-1CRATE-VERIFY ?auto_264806 ?auto_264807 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264812 - SURFACE
      ?auto_264813 - SURFACE
    )
    :vars
    (
      ?auto_264817 - HOIST
      ?auto_264815 - PLACE
      ?auto_264816 - TRUCK
      ?auto_264814 - PLACE
      ?auto_264818 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_264817 ?auto_264815 ) ( SURFACE-AT ?auto_264812 ?auto_264815 ) ( CLEAR ?auto_264812 ) ( IS-CRATE ?auto_264813 ) ( not ( = ?auto_264812 ?auto_264813 ) ) ( AVAILABLE ?auto_264817 ) ( TRUCK-AT ?auto_264816 ?auto_264814 ) ( not ( = ?auto_264814 ?auto_264815 ) ) ( HOIST-AT ?auto_264818 ?auto_264814 ) ( LIFTING ?auto_264818 ?auto_264813 ) ( not ( = ?auto_264817 ?auto_264818 ) ) )
    :subtasks
    ( ( !LOAD ?auto_264818 ?auto_264813 ?auto_264816 ?auto_264814 )
      ( MAKE-1CRATE ?auto_264812 ?auto_264813 )
      ( MAKE-1CRATE-VERIFY ?auto_264812 ?auto_264813 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264819 - SURFACE
      ?auto_264820 - SURFACE
    )
    :vars
    (
      ?auto_264825 - HOIST
      ?auto_264822 - PLACE
      ?auto_264821 - TRUCK
      ?auto_264823 - PLACE
      ?auto_264824 - HOIST
      ?auto_264826 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264825 ?auto_264822 ) ( SURFACE-AT ?auto_264819 ?auto_264822 ) ( CLEAR ?auto_264819 ) ( IS-CRATE ?auto_264820 ) ( not ( = ?auto_264819 ?auto_264820 ) ) ( AVAILABLE ?auto_264825 ) ( TRUCK-AT ?auto_264821 ?auto_264823 ) ( not ( = ?auto_264823 ?auto_264822 ) ) ( HOIST-AT ?auto_264824 ?auto_264823 ) ( not ( = ?auto_264825 ?auto_264824 ) ) ( AVAILABLE ?auto_264824 ) ( SURFACE-AT ?auto_264820 ?auto_264823 ) ( ON ?auto_264820 ?auto_264826 ) ( CLEAR ?auto_264820 ) ( not ( = ?auto_264819 ?auto_264826 ) ) ( not ( = ?auto_264820 ?auto_264826 ) ) )
    :subtasks
    ( ( !LIFT ?auto_264824 ?auto_264820 ?auto_264826 ?auto_264823 )
      ( MAKE-1CRATE ?auto_264819 ?auto_264820 )
      ( MAKE-1CRATE-VERIFY ?auto_264819 ?auto_264820 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264827 - SURFACE
      ?auto_264828 - SURFACE
    )
    :vars
    (
      ?auto_264831 - HOIST
      ?auto_264829 - PLACE
      ?auto_264833 - PLACE
      ?auto_264830 - HOIST
      ?auto_264834 - SURFACE
      ?auto_264832 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264831 ?auto_264829 ) ( SURFACE-AT ?auto_264827 ?auto_264829 ) ( CLEAR ?auto_264827 ) ( IS-CRATE ?auto_264828 ) ( not ( = ?auto_264827 ?auto_264828 ) ) ( AVAILABLE ?auto_264831 ) ( not ( = ?auto_264833 ?auto_264829 ) ) ( HOIST-AT ?auto_264830 ?auto_264833 ) ( not ( = ?auto_264831 ?auto_264830 ) ) ( AVAILABLE ?auto_264830 ) ( SURFACE-AT ?auto_264828 ?auto_264833 ) ( ON ?auto_264828 ?auto_264834 ) ( CLEAR ?auto_264828 ) ( not ( = ?auto_264827 ?auto_264834 ) ) ( not ( = ?auto_264828 ?auto_264834 ) ) ( TRUCK-AT ?auto_264832 ?auto_264829 ) )
    :subtasks
    ( ( !DRIVE ?auto_264832 ?auto_264829 ?auto_264833 )
      ( MAKE-1CRATE ?auto_264827 ?auto_264828 )
      ( MAKE-1CRATE-VERIFY ?auto_264827 ?auto_264828 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264844 - SURFACE
      ?auto_264845 - SURFACE
      ?auto_264846 - SURFACE
    )
    :vars
    (
      ?auto_264847 - HOIST
      ?auto_264848 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264847 ?auto_264848 ) ( SURFACE-AT ?auto_264845 ?auto_264848 ) ( CLEAR ?auto_264845 ) ( LIFTING ?auto_264847 ?auto_264846 ) ( IS-CRATE ?auto_264846 ) ( not ( = ?auto_264845 ?auto_264846 ) ) ( ON ?auto_264845 ?auto_264844 ) ( not ( = ?auto_264844 ?auto_264845 ) ) ( not ( = ?auto_264844 ?auto_264846 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264845 ?auto_264846 )
      ( MAKE-2CRATE-VERIFY ?auto_264844 ?auto_264845 ?auto_264846 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264854 - SURFACE
      ?auto_264855 - SURFACE
      ?auto_264856 - SURFACE
    )
    :vars
    (
      ?auto_264857 - HOIST
      ?auto_264859 - PLACE
      ?auto_264858 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264857 ?auto_264859 ) ( SURFACE-AT ?auto_264855 ?auto_264859 ) ( CLEAR ?auto_264855 ) ( IS-CRATE ?auto_264856 ) ( not ( = ?auto_264855 ?auto_264856 ) ) ( TRUCK-AT ?auto_264858 ?auto_264859 ) ( AVAILABLE ?auto_264857 ) ( IN ?auto_264856 ?auto_264858 ) ( ON ?auto_264855 ?auto_264854 ) ( not ( = ?auto_264854 ?auto_264855 ) ) ( not ( = ?auto_264854 ?auto_264856 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264855 ?auto_264856 )
      ( MAKE-2CRATE-VERIFY ?auto_264854 ?auto_264855 ?auto_264856 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264860 - SURFACE
      ?auto_264861 - SURFACE
    )
    :vars
    (
      ?auto_264862 - HOIST
      ?auto_264864 - PLACE
      ?auto_264865 - TRUCK
      ?auto_264863 - SURFACE
      ?auto_264866 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264862 ?auto_264864 ) ( SURFACE-AT ?auto_264860 ?auto_264864 ) ( CLEAR ?auto_264860 ) ( IS-CRATE ?auto_264861 ) ( not ( = ?auto_264860 ?auto_264861 ) ) ( AVAILABLE ?auto_264862 ) ( IN ?auto_264861 ?auto_264865 ) ( ON ?auto_264860 ?auto_264863 ) ( not ( = ?auto_264863 ?auto_264860 ) ) ( not ( = ?auto_264863 ?auto_264861 ) ) ( TRUCK-AT ?auto_264865 ?auto_264866 ) ( not ( = ?auto_264866 ?auto_264864 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_264865 ?auto_264866 ?auto_264864 )
      ( MAKE-2CRATE ?auto_264863 ?auto_264860 ?auto_264861 )
      ( MAKE-1CRATE-VERIFY ?auto_264860 ?auto_264861 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264867 - SURFACE
      ?auto_264868 - SURFACE
      ?auto_264869 - SURFACE
    )
    :vars
    (
      ?auto_264873 - HOIST
      ?auto_264872 - PLACE
      ?auto_264871 - TRUCK
      ?auto_264870 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264873 ?auto_264872 ) ( SURFACE-AT ?auto_264868 ?auto_264872 ) ( CLEAR ?auto_264868 ) ( IS-CRATE ?auto_264869 ) ( not ( = ?auto_264868 ?auto_264869 ) ) ( AVAILABLE ?auto_264873 ) ( IN ?auto_264869 ?auto_264871 ) ( ON ?auto_264868 ?auto_264867 ) ( not ( = ?auto_264867 ?auto_264868 ) ) ( not ( = ?auto_264867 ?auto_264869 ) ) ( TRUCK-AT ?auto_264871 ?auto_264870 ) ( not ( = ?auto_264870 ?auto_264872 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264868 ?auto_264869 )
      ( MAKE-2CRATE-VERIFY ?auto_264867 ?auto_264868 ?auto_264869 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264874 - SURFACE
      ?auto_264875 - SURFACE
    )
    :vars
    (
      ?auto_264876 - HOIST
      ?auto_264880 - PLACE
      ?auto_264879 - SURFACE
      ?auto_264878 - TRUCK
      ?auto_264877 - PLACE
      ?auto_264881 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_264876 ?auto_264880 ) ( SURFACE-AT ?auto_264874 ?auto_264880 ) ( CLEAR ?auto_264874 ) ( IS-CRATE ?auto_264875 ) ( not ( = ?auto_264874 ?auto_264875 ) ) ( AVAILABLE ?auto_264876 ) ( ON ?auto_264874 ?auto_264879 ) ( not ( = ?auto_264879 ?auto_264874 ) ) ( not ( = ?auto_264879 ?auto_264875 ) ) ( TRUCK-AT ?auto_264878 ?auto_264877 ) ( not ( = ?auto_264877 ?auto_264880 ) ) ( HOIST-AT ?auto_264881 ?auto_264877 ) ( LIFTING ?auto_264881 ?auto_264875 ) ( not ( = ?auto_264876 ?auto_264881 ) ) )
    :subtasks
    ( ( !LOAD ?auto_264881 ?auto_264875 ?auto_264878 ?auto_264877 )
      ( MAKE-2CRATE ?auto_264879 ?auto_264874 ?auto_264875 )
      ( MAKE-1CRATE-VERIFY ?auto_264874 ?auto_264875 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264882 - SURFACE
      ?auto_264883 - SURFACE
      ?auto_264884 - SURFACE
    )
    :vars
    (
      ?auto_264885 - HOIST
      ?auto_264887 - PLACE
      ?auto_264889 - TRUCK
      ?auto_264886 - PLACE
      ?auto_264888 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_264885 ?auto_264887 ) ( SURFACE-AT ?auto_264883 ?auto_264887 ) ( CLEAR ?auto_264883 ) ( IS-CRATE ?auto_264884 ) ( not ( = ?auto_264883 ?auto_264884 ) ) ( AVAILABLE ?auto_264885 ) ( ON ?auto_264883 ?auto_264882 ) ( not ( = ?auto_264882 ?auto_264883 ) ) ( not ( = ?auto_264882 ?auto_264884 ) ) ( TRUCK-AT ?auto_264889 ?auto_264886 ) ( not ( = ?auto_264886 ?auto_264887 ) ) ( HOIST-AT ?auto_264888 ?auto_264886 ) ( LIFTING ?auto_264888 ?auto_264884 ) ( not ( = ?auto_264885 ?auto_264888 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264883 ?auto_264884 )
      ( MAKE-2CRATE-VERIFY ?auto_264882 ?auto_264883 ?auto_264884 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264890 - SURFACE
      ?auto_264891 - SURFACE
    )
    :vars
    (
      ?auto_264896 - HOIST
      ?auto_264897 - PLACE
      ?auto_264893 - SURFACE
      ?auto_264894 - TRUCK
      ?auto_264895 - PLACE
      ?auto_264892 - HOIST
      ?auto_264898 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264896 ?auto_264897 ) ( SURFACE-AT ?auto_264890 ?auto_264897 ) ( CLEAR ?auto_264890 ) ( IS-CRATE ?auto_264891 ) ( not ( = ?auto_264890 ?auto_264891 ) ) ( AVAILABLE ?auto_264896 ) ( ON ?auto_264890 ?auto_264893 ) ( not ( = ?auto_264893 ?auto_264890 ) ) ( not ( = ?auto_264893 ?auto_264891 ) ) ( TRUCK-AT ?auto_264894 ?auto_264895 ) ( not ( = ?auto_264895 ?auto_264897 ) ) ( HOIST-AT ?auto_264892 ?auto_264895 ) ( not ( = ?auto_264896 ?auto_264892 ) ) ( AVAILABLE ?auto_264892 ) ( SURFACE-AT ?auto_264891 ?auto_264895 ) ( ON ?auto_264891 ?auto_264898 ) ( CLEAR ?auto_264891 ) ( not ( = ?auto_264890 ?auto_264898 ) ) ( not ( = ?auto_264891 ?auto_264898 ) ) ( not ( = ?auto_264893 ?auto_264898 ) ) )
    :subtasks
    ( ( !LIFT ?auto_264892 ?auto_264891 ?auto_264898 ?auto_264895 )
      ( MAKE-2CRATE ?auto_264893 ?auto_264890 ?auto_264891 )
      ( MAKE-1CRATE-VERIFY ?auto_264890 ?auto_264891 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264899 - SURFACE
      ?auto_264900 - SURFACE
      ?auto_264901 - SURFACE
    )
    :vars
    (
      ?auto_264906 - HOIST
      ?auto_264902 - PLACE
      ?auto_264907 - TRUCK
      ?auto_264904 - PLACE
      ?auto_264903 - HOIST
      ?auto_264905 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264906 ?auto_264902 ) ( SURFACE-AT ?auto_264900 ?auto_264902 ) ( CLEAR ?auto_264900 ) ( IS-CRATE ?auto_264901 ) ( not ( = ?auto_264900 ?auto_264901 ) ) ( AVAILABLE ?auto_264906 ) ( ON ?auto_264900 ?auto_264899 ) ( not ( = ?auto_264899 ?auto_264900 ) ) ( not ( = ?auto_264899 ?auto_264901 ) ) ( TRUCK-AT ?auto_264907 ?auto_264904 ) ( not ( = ?auto_264904 ?auto_264902 ) ) ( HOIST-AT ?auto_264903 ?auto_264904 ) ( not ( = ?auto_264906 ?auto_264903 ) ) ( AVAILABLE ?auto_264903 ) ( SURFACE-AT ?auto_264901 ?auto_264904 ) ( ON ?auto_264901 ?auto_264905 ) ( CLEAR ?auto_264901 ) ( not ( = ?auto_264900 ?auto_264905 ) ) ( not ( = ?auto_264901 ?auto_264905 ) ) ( not ( = ?auto_264899 ?auto_264905 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264900 ?auto_264901 )
      ( MAKE-2CRATE-VERIFY ?auto_264899 ?auto_264900 ?auto_264901 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264908 - SURFACE
      ?auto_264909 - SURFACE
    )
    :vars
    (
      ?auto_264913 - HOIST
      ?auto_264914 - PLACE
      ?auto_264910 - SURFACE
      ?auto_264912 - PLACE
      ?auto_264916 - HOIST
      ?auto_264915 - SURFACE
      ?auto_264911 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264913 ?auto_264914 ) ( SURFACE-AT ?auto_264908 ?auto_264914 ) ( CLEAR ?auto_264908 ) ( IS-CRATE ?auto_264909 ) ( not ( = ?auto_264908 ?auto_264909 ) ) ( AVAILABLE ?auto_264913 ) ( ON ?auto_264908 ?auto_264910 ) ( not ( = ?auto_264910 ?auto_264908 ) ) ( not ( = ?auto_264910 ?auto_264909 ) ) ( not ( = ?auto_264912 ?auto_264914 ) ) ( HOIST-AT ?auto_264916 ?auto_264912 ) ( not ( = ?auto_264913 ?auto_264916 ) ) ( AVAILABLE ?auto_264916 ) ( SURFACE-AT ?auto_264909 ?auto_264912 ) ( ON ?auto_264909 ?auto_264915 ) ( CLEAR ?auto_264909 ) ( not ( = ?auto_264908 ?auto_264915 ) ) ( not ( = ?auto_264909 ?auto_264915 ) ) ( not ( = ?auto_264910 ?auto_264915 ) ) ( TRUCK-AT ?auto_264911 ?auto_264914 ) )
    :subtasks
    ( ( !DRIVE ?auto_264911 ?auto_264914 ?auto_264912 )
      ( MAKE-2CRATE ?auto_264910 ?auto_264908 ?auto_264909 )
      ( MAKE-1CRATE-VERIFY ?auto_264908 ?auto_264909 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264917 - SURFACE
      ?auto_264918 - SURFACE
      ?auto_264919 - SURFACE
    )
    :vars
    (
      ?auto_264923 - HOIST
      ?auto_264924 - PLACE
      ?auto_264920 - PLACE
      ?auto_264922 - HOIST
      ?auto_264921 - SURFACE
      ?auto_264925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264923 ?auto_264924 ) ( SURFACE-AT ?auto_264918 ?auto_264924 ) ( CLEAR ?auto_264918 ) ( IS-CRATE ?auto_264919 ) ( not ( = ?auto_264918 ?auto_264919 ) ) ( AVAILABLE ?auto_264923 ) ( ON ?auto_264918 ?auto_264917 ) ( not ( = ?auto_264917 ?auto_264918 ) ) ( not ( = ?auto_264917 ?auto_264919 ) ) ( not ( = ?auto_264920 ?auto_264924 ) ) ( HOIST-AT ?auto_264922 ?auto_264920 ) ( not ( = ?auto_264923 ?auto_264922 ) ) ( AVAILABLE ?auto_264922 ) ( SURFACE-AT ?auto_264919 ?auto_264920 ) ( ON ?auto_264919 ?auto_264921 ) ( CLEAR ?auto_264919 ) ( not ( = ?auto_264918 ?auto_264921 ) ) ( not ( = ?auto_264919 ?auto_264921 ) ) ( not ( = ?auto_264917 ?auto_264921 ) ) ( TRUCK-AT ?auto_264925 ?auto_264924 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264918 ?auto_264919 )
      ( MAKE-2CRATE-VERIFY ?auto_264917 ?auto_264918 ?auto_264919 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264926 - SURFACE
      ?auto_264927 - SURFACE
    )
    :vars
    (
      ?auto_264932 - HOIST
      ?auto_264931 - PLACE
      ?auto_264933 - SURFACE
      ?auto_264929 - PLACE
      ?auto_264928 - HOIST
      ?auto_264934 - SURFACE
      ?auto_264930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264932 ?auto_264931 ) ( IS-CRATE ?auto_264927 ) ( not ( = ?auto_264926 ?auto_264927 ) ) ( not ( = ?auto_264933 ?auto_264926 ) ) ( not ( = ?auto_264933 ?auto_264927 ) ) ( not ( = ?auto_264929 ?auto_264931 ) ) ( HOIST-AT ?auto_264928 ?auto_264929 ) ( not ( = ?auto_264932 ?auto_264928 ) ) ( AVAILABLE ?auto_264928 ) ( SURFACE-AT ?auto_264927 ?auto_264929 ) ( ON ?auto_264927 ?auto_264934 ) ( CLEAR ?auto_264927 ) ( not ( = ?auto_264926 ?auto_264934 ) ) ( not ( = ?auto_264927 ?auto_264934 ) ) ( not ( = ?auto_264933 ?auto_264934 ) ) ( TRUCK-AT ?auto_264930 ?auto_264931 ) ( SURFACE-AT ?auto_264933 ?auto_264931 ) ( CLEAR ?auto_264933 ) ( LIFTING ?auto_264932 ?auto_264926 ) ( IS-CRATE ?auto_264926 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264933 ?auto_264926 )
      ( MAKE-2CRATE ?auto_264933 ?auto_264926 ?auto_264927 )
      ( MAKE-1CRATE-VERIFY ?auto_264926 ?auto_264927 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264935 - SURFACE
      ?auto_264936 - SURFACE
      ?auto_264937 - SURFACE
    )
    :vars
    (
      ?auto_264940 - HOIST
      ?auto_264941 - PLACE
      ?auto_264943 - PLACE
      ?auto_264939 - HOIST
      ?auto_264938 - SURFACE
      ?auto_264942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264940 ?auto_264941 ) ( IS-CRATE ?auto_264937 ) ( not ( = ?auto_264936 ?auto_264937 ) ) ( not ( = ?auto_264935 ?auto_264936 ) ) ( not ( = ?auto_264935 ?auto_264937 ) ) ( not ( = ?auto_264943 ?auto_264941 ) ) ( HOIST-AT ?auto_264939 ?auto_264943 ) ( not ( = ?auto_264940 ?auto_264939 ) ) ( AVAILABLE ?auto_264939 ) ( SURFACE-AT ?auto_264937 ?auto_264943 ) ( ON ?auto_264937 ?auto_264938 ) ( CLEAR ?auto_264937 ) ( not ( = ?auto_264936 ?auto_264938 ) ) ( not ( = ?auto_264937 ?auto_264938 ) ) ( not ( = ?auto_264935 ?auto_264938 ) ) ( TRUCK-AT ?auto_264942 ?auto_264941 ) ( SURFACE-AT ?auto_264935 ?auto_264941 ) ( CLEAR ?auto_264935 ) ( LIFTING ?auto_264940 ?auto_264936 ) ( IS-CRATE ?auto_264936 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264936 ?auto_264937 )
      ( MAKE-2CRATE-VERIFY ?auto_264935 ?auto_264936 ?auto_264937 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264944 - SURFACE
      ?auto_264945 - SURFACE
    )
    :vars
    (
      ?auto_264948 - HOIST
      ?auto_264946 - PLACE
      ?auto_264950 - SURFACE
      ?auto_264951 - PLACE
      ?auto_264947 - HOIST
      ?auto_264949 - SURFACE
      ?auto_264952 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264948 ?auto_264946 ) ( IS-CRATE ?auto_264945 ) ( not ( = ?auto_264944 ?auto_264945 ) ) ( not ( = ?auto_264950 ?auto_264944 ) ) ( not ( = ?auto_264950 ?auto_264945 ) ) ( not ( = ?auto_264951 ?auto_264946 ) ) ( HOIST-AT ?auto_264947 ?auto_264951 ) ( not ( = ?auto_264948 ?auto_264947 ) ) ( AVAILABLE ?auto_264947 ) ( SURFACE-AT ?auto_264945 ?auto_264951 ) ( ON ?auto_264945 ?auto_264949 ) ( CLEAR ?auto_264945 ) ( not ( = ?auto_264944 ?auto_264949 ) ) ( not ( = ?auto_264945 ?auto_264949 ) ) ( not ( = ?auto_264950 ?auto_264949 ) ) ( TRUCK-AT ?auto_264952 ?auto_264946 ) ( SURFACE-AT ?auto_264950 ?auto_264946 ) ( CLEAR ?auto_264950 ) ( IS-CRATE ?auto_264944 ) ( AVAILABLE ?auto_264948 ) ( IN ?auto_264944 ?auto_264952 ) )
    :subtasks
    ( ( !UNLOAD ?auto_264948 ?auto_264944 ?auto_264952 ?auto_264946 )
      ( MAKE-2CRATE ?auto_264950 ?auto_264944 ?auto_264945 )
      ( MAKE-1CRATE-VERIFY ?auto_264944 ?auto_264945 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264953 - SURFACE
      ?auto_264954 - SURFACE
      ?auto_264955 - SURFACE
    )
    :vars
    (
      ?auto_264960 - HOIST
      ?auto_264958 - PLACE
      ?auto_264959 - PLACE
      ?auto_264956 - HOIST
      ?auto_264957 - SURFACE
      ?auto_264961 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264960 ?auto_264958 ) ( IS-CRATE ?auto_264955 ) ( not ( = ?auto_264954 ?auto_264955 ) ) ( not ( = ?auto_264953 ?auto_264954 ) ) ( not ( = ?auto_264953 ?auto_264955 ) ) ( not ( = ?auto_264959 ?auto_264958 ) ) ( HOIST-AT ?auto_264956 ?auto_264959 ) ( not ( = ?auto_264960 ?auto_264956 ) ) ( AVAILABLE ?auto_264956 ) ( SURFACE-AT ?auto_264955 ?auto_264959 ) ( ON ?auto_264955 ?auto_264957 ) ( CLEAR ?auto_264955 ) ( not ( = ?auto_264954 ?auto_264957 ) ) ( not ( = ?auto_264955 ?auto_264957 ) ) ( not ( = ?auto_264953 ?auto_264957 ) ) ( TRUCK-AT ?auto_264961 ?auto_264958 ) ( SURFACE-AT ?auto_264953 ?auto_264958 ) ( CLEAR ?auto_264953 ) ( IS-CRATE ?auto_264954 ) ( AVAILABLE ?auto_264960 ) ( IN ?auto_264954 ?auto_264961 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264954 ?auto_264955 )
      ( MAKE-2CRATE-VERIFY ?auto_264953 ?auto_264954 ?auto_264955 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264998 - SURFACE
      ?auto_264999 - SURFACE
    )
    :vars
    (
      ?auto_265005 - HOIST
      ?auto_265002 - PLACE
      ?auto_265006 - SURFACE
      ?auto_265000 - PLACE
      ?auto_265003 - HOIST
      ?auto_265004 - SURFACE
      ?auto_265001 - TRUCK
      ?auto_265007 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_265005 ?auto_265002 ) ( SURFACE-AT ?auto_264998 ?auto_265002 ) ( CLEAR ?auto_264998 ) ( IS-CRATE ?auto_264999 ) ( not ( = ?auto_264998 ?auto_264999 ) ) ( AVAILABLE ?auto_265005 ) ( ON ?auto_264998 ?auto_265006 ) ( not ( = ?auto_265006 ?auto_264998 ) ) ( not ( = ?auto_265006 ?auto_264999 ) ) ( not ( = ?auto_265000 ?auto_265002 ) ) ( HOIST-AT ?auto_265003 ?auto_265000 ) ( not ( = ?auto_265005 ?auto_265003 ) ) ( AVAILABLE ?auto_265003 ) ( SURFACE-AT ?auto_264999 ?auto_265000 ) ( ON ?auto_264999 ?auto_265004 ) ( CLEAR ?auto_264999 ) ( not ( = ?auto_264998 ?auto_265004 ) ) ( not ( = ?auto_264999 ?auto_265004 ) ) ( not ( = ?auto_265006 ?auto_265004 ) ) ( TRUCK-AT ?auto_265001 ?auto_265007 ) ( not ( = ?auto_265007 ?auto_265002 ) ) ( not ( = ?auto_265000 ?auto_265007 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_265001 ?auto_265007 ?auto_265002 )
      ( MAKE-1CRATE ?auto_264998 ?auto_264999 )
      ( MAKE-1CRATE-VERIFY ?auto_264998 ?auto_264999 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_265038 - SURFACE
      ?auto_265039 - SURFACE
      ?auto_265040 - SURFACE
      ?auto_265037 - SURFACE
    )
    :vars
    (
      ?auto_265041 - HOIST
      ?auto_265042 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_265041 ?auto_265042 ) ( SURFACE-AT ?auto_265040 ?auto_265042 ) ( CLEAR ?auto_265040 ) ( LIFTING ?auto_265041 ?auto_265037 ) ( IS-CRATE ?auto_265037 ) ( not ( = ?auto_265040 ?auto_265037 ) ) ( ON ?auto_265039 ?auto_265038 ) ( ON ?auto_265040 ?auto_265039 ) ( not ( = ?auto_265038 ?auto_265039 ) ) ( not ( = ?auto_265038 ?auto_265040 ) ) ( not ( = ?auto_265038 ?auto_265037 ) ) ( not ( = ?auto_265039 ?auto_265040 ) ) ( not ( = ?auto_265039 ?auto_265037 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_265040 ?auto_265037 )
      ( MAKE-3CRATE-VERIFY ?auto_265038 ?auto_265039 ?auto_265040 ?auto_265037 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_265055 - SURFACE
      ?auto_265056 - SURFACE
      ?auto_265057 - SURFACE
      ?auto_265054 - SURFACE
    )
    :vars
    (
      ?auto_265059 - HOIST
      ?auto_265058 - PLACE
      ?auto_265060 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265059 ?auto_265058 ) ( SURFACE-AT ?auto_265057 ?auto_265058 ) ( CLEAR ?auto_265057 ) ( IS-CRATE ?auto_265054 ) ( not ( = ?auto_265057 ?auto_265054 ) ) ( TRUCK-AT ?auto_265060 ?auto_265058 ) ( AVAILABLE ?auto_265059 ) ( IN ?auto_265054 ?auto_265060 ) ( ON ?auto_265057 ?auto_265056 ) ( not ( = ?auto_265056 ?auto_265057 ) ) ( not ( = ?auto_265056 ?auto_265054 ) ) ( ON ?auto_265056 ?auto_265055 ) ( not ( = ?auto_265055 ?auto_265056 ) ) ( not ( = ?auto_265055 ?auto_265057 ) ) ( not ( = ?auto_265055 ?auto_265054 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265056 ?auto_265057 ?auto_265054 )
      ( MAKE-3CRATE-VERIFY ?auto_265055 ?auto_265056 ?auto_265057 ?auto_265054 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_265076 - SURFACE
      ?auto_265077 - SURFACE
      ?auto_265078 - SURFACE
      ?auto_265075 - SURFACE
    )
    :vars
    (
      ?auto_265079 - HOIST
      ?auto_265080 - PLACE
      ?auto_265082 - TRUCK
      ?auto_265081 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_265079 ?auto_265080 ) ( SURFACE-AT ?auto_265078 ?auto_265080 ) ( CLEAR ?auto_265078 ) ( IS-CRATE ?auto_265075 ) ( not ( = ?auto_265078 ?auto_265075 ) ) ( AVAILABLE ?auto_265079 ) ( IN ?auto_265075 ?auto_265082 ) ( ON ?auto_265078 ?auto_265077 ) ( not ( = ?auto_265077 ?auto_265078 ) ) ( not ( = ?auto_265077 ?auto_265075 ) ) ( TRUCK-AT ?auto_265082 ?auto_265081 ) ( not ( = ?auto_265081 ?auto_265080 ) ) ( ON ?auto_265077 ?auto_265076 ) ( not ( = ?auto_265076 ?auto_265077 ) ) ( not ( = ?auto_265076 ?auto_265078 ) ) ( not ( = ?auto_265076 ?auto_265075 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265077 ?auto_265078 ?auto_265075 )
      ( MAKE-3CRATE-VERIFY ?auto_265076 ?auto_265077 ?auto_265078 ?auto_265075 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_265100 - SURFACE
      ?auto_265101 - SURFACE
      ?auto_265102 - SURFACE
      ?auto_265099 - SURFACE
    )
    :vars
    (
      ?auto_265107 - HOIST
      ?auto_265104 - PLACE
      ?auto_265103 - TRUCK
      ?auto_265106 - PLACE
      ?auto_265105 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_265107 ?auto_265104 ) ( SURFACE-AT ?auto_265102 ?auto_265104 ) ( CLEAR ?auto_265102 ) ( IS-CRATE ?auto_265099 ) ( not ( = ?auto_265102 ?auto_265099 ) ) ( AVAILABLE ?auto_265107 ) ( ON ?auto_265102 ?auto_265101 ) ( not ( = ?auto_265101 ?auto_265102 ) ) ( not ( = ?auto_265101 ?auto_265099 ) ) ( TRUCK-AT ?auto_265103 ?auto_265106 ) ( not ( = ?auto_265106 ?auto_265104 ) ) ( HOIST-AT ?auto_265105 ?auto_265106 ) ( LIFTING ?auto_265105 ?auto_265099 ) ( not ( = ?auto_265107 ?auto_265105 ) ) ( ON ?auto_265101 ?auto_265100 ) ( not ( = ?auto_265100 ?auto_265101 ) ) ( not ( = ?auto_265100 ?auto_265102 ) ) ( not ( = ?auto_265100 ?auto_265099 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265101 ?auto_265102 ?auto_265099 )
      ( MAKE-3CRATE-VERIFY ?auto_265100 ?auto_265101 ?auto_265102 ?auto_265099 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_265127 - SURFACE
      ?auto_265128 - SURFACE
      ?auto_265129 - SURFACE
      ?auto_265126 - SURFACE
    )
    :vars
    (
      ?auto_265132 - HOIST
      ?auto_265134 - PLACE
      ?auto_265131 - TRUCK
      ?auto_265130 - PLACE
      ?auto_265133 - HOIST
      ?auto_265135 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_265132 ?auto_265134 ) ( SURFACE-AT ?auto_265129 ?auto_265134 ) ( CLEAR ?auto_265129 ) ( IS-CRATE ?auto_265126 ) ( not ( = ?auto_265129 ?auto_265126 ) ) ( AVAILABLE ?auto_265132 ) ( ON ?auto_265129 ?auto_265128 ) ( not ( = ?auto_265128 ?auto_265129 ) ) ( not ( = ?auto_265128 ?auto_265126 ) ) ( TRUCK-AT ?auto_265131 ?auto_265130 ) ( not ( = ?auto_265130 ?auto_265134 ) ) ( HOIST-AT ?auto_265133 ?auto_265130 ) ( not ( = ?auto_265132 ?auto_265133 ) ) ( AVAILABLE ?auto_265133 ) ( SURFACE-AT ?auto_265126 ?auto_265130 ) ( ON ?auto_265126 ?auto_265135 ) ( CLEAR ?auto_265126 ) ( not ( = ?auto_265129 ?auto_265135 ) ) ( not ( = ?auto_265126 ?auto_265135 ) ) ( not ( = ?auto_265128 ?auto_265135 ) ) ( ON ?auto_265128 ?auto_265127 ) ( not ( = ?auto_265127 ?auto_265128 ) ) ( not ( = ?auto_265127 ?auto_265129 ) ) ( not ( = ?auto_265127 ?auto_265126 ) ) ( not ( = ?auto_265127 ?auto_265135 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265128 ?auto_265129 ?auto_265126 )
      ( MAKE-3CRATE-VERIFY ?auto_265127 ?auto_265128 ?auto_265129 ?auto_265126 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_265155 - SURFACE
      ?auto_265156 - SURFACE
      ?auto_265157 - SURFACE
      ?auto_265154 - SURFACE
    )
    :vars
    (
      ?auto_265159 - HOIST
      ?auto_265162 - PLACE
      ?auto_265160 - PLACE
      ?auto_265158 - HOIST
      ?auto_265161 - SURFACE
      ?auto_265163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265159 ?auto_265162 ) ( SURFACE-AT ?auto_265157 ?auto_265162 ) ( CLEAR ?auto_265157 ) ( IS-CRATE ?auto_265154 ) ( not ( = ?auto_265157 ?auto_265154 ) ) ( AVAILABLE ?auto_265159 ) ( ON ?auto_265157 ?auto_265156 ) ( not ( = ?auto_265156 ?auto_265157 ) ) ( not ( = ?auto_265156 ?auto_265154 ) ) ( not ( = ?auto_265160 ?auto_265162 ) ) ( HOIST-AT ?auto_265158 ?auto_265160 ) ( not ( = ?auto_265159 ?auto_265158 ) ) ( AVAILABLE ?auto_265158 ) ( SURFACE-AT ?auto_265154 ?auto_265160 ) ( ON ?auto_265154 ?auto_265161 ) ( CLEAR ?auto_265154 ) ( not ( = ?auto_265157 ?auto_265161 ) ) ( not ( = ?auto_265154 ?auto_265161 ) ) ( not ( = ?auto_265156 ?auto_265161 ) ) ( TRUCK-AT ?auto_265163 ?auto_265162 ) ( ON ?auto_265156 ?auto_265155 ) ( not ( = ?auto_265155 ?auto_265156 ) ) ( not ( = ?auto_265155 ?auto_265157 ) ) ( not ( = ?auto_265155 ?auto_265154 ) ) ( not ( = ?auto_265155 ?auto_265161 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265156 ?auto_265157 ?auto_265154 )
      ( MAKE-3CRATE-VERIFY ?auto_265155 ?auto_265156 ?auto_265157 ?auto_265154 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_265183 - SURFACE
      ?auto_265184 - SURFACE
      ?auto_265185 - SURFACE
      ?auto_265182 - SURFACE
    )
    :vars
    (
      ?auto_265190 - HOIST
      ?auto_265191 - PLACE
      ?auto_265188 - PLACE
      ?auto_265187 - HOIST
      ?auto_265186 - SURFACE
      ?auto_265189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265190 ?auto_265191 ) ( IS-CRATE ?auto_265182 ) ( not ( = ?auto_265185 ?auto_265182 ) ) ( not ( = ?auto_265184 ?auto_265185 ) ) ( not ( = ?auto_265184 ?auto_265182 ) ) ( not ( = ?auto_265188 ?auto_265191 ) ) ( HOIST-AT ?auto_265187 ?auto_265188 ) ( not ( = ?auto_265190 ?auto_265187 ) ) ( AVAILABLE ?auto_265187 ) ( SURFACE-AT ?auto_265182 ?auto_265188 ) ( ON ?auto_265182 ?auto_265186 ) ( CLEAR ?auto_265182 ) ( not ( = ?auto_265185 ?auto_265186 ) ) ( not ( = ?auto_265182 ?auto_265186 ) ) ( not ( = ?auto_265184 ?auto_265186 ) ) ( TRUCK-AT ?auto_265189 ?auto_265191 ) ( SURFACE-AT ?auto_265184 ?auto_265191 ) ( CLEAR ?auto_265184 ) ( LIFTING ?auto_265190 ?auto_265185 ) ( IS-CRATE ?auto_265185 ) ( ON ?auto_265184 ?auto_265183 ) ( not ( = ?auto_265183 ?auto_265184 ) ) ( not ( = ?auto_265183 ?auto_265185 ) ) ( not ( = ?auto_265183 ?auto_265182 ) ) ( not ( = ?auto_265183 ?auto_265186 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265184 ?auto_265185 ?auto_265182 )
      ( MAKE-3CRATE-VERIFY ?auto_265183 ?auto_265184 ?auto_265185 ?auto_265182 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_265211 - SURFACE
      ?auto_265212 - SURFACE
      ?auto_265213 - SURFACE
      ?auto_265210 - SURFACE
    )
    :vars
    (
      ?auto_265214 - HOIST
      ?auto_265215 - PLACE
      ?auto_265217 - PLACE
      ?auto_265216 - HOIST
      ?auto_265218 - SURFACE
      ?auto_265219 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265214 ?auto_265215 ) ( IS-CRATE ?auto_265210 ) ( not ( = ?auto_265213 ?auto_265210 ) ) ( not ( = ?auto_265212 ?auto_265213 ) ) ( not ( = ?auto_265212 ?auto_265210 ) ) ( not ( = ?auto_265217 ?auto_265215 ) ) ( HOIST-AT ?auto_265216 ?auto_265217 ) ( not ( = ?auto_265214 ?auto_265216 ) ) ( AVAILABLE ?auto_265216 ) ( SURFACE-AT ?auto_265210 ?auto_265217 ) ( ON ?auto_265210 ?auto_265218 ) ( CLEAR ?auto_265210 ) ( not ( = ?auto_265213 ?auto_265218 ) ) ( not ( = ?auto_265210 ?auto_265218 ) ) ( not ( = ?auto_265212 ?auto_265218 ) ) ( TRUCK-AT ?auto_265219 ?auto_265215 ) ( SURFACE-AT ?auto_265212 ?auto_265215 ) ( CLEAR ?auto_265212 ) ( IS-CRATE ?auto_265213 ) ( AVAILABLE ?auto_265214 ) ( IN ?auto_265213 ?auto_265219 ) ( ON ?auto_265212 ?auto_265211 ) ( not ( = ?auto_265211 ?auto_265212 ) ) ( not ( = ?auto_265211 ?auto_265213 ) ) ( not ( = ?auto_265211 ?auto_265210 ) ) ( not ( = ?auto_265211 ?auto_265218 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265212 ?auto_265213 ?auto_265210 )
      ( MAKE-3CRATE-VERIFY ?auto_265211 ?auto_265212 ?auto_265213 ?auto_265210 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_265395 - SURFACE
      ?auto_265396 - SURFACE
    )
    :vars
    (
      ?auto_265402 - HOIST
      ?auto_265399 - PLACE
      ?auto_265398 - SURFACE
      ?auto_265397 - TRUCK
      ?auto_265403 - PLACE
      ?auto_265400 - HOIST
      ?auto_265401 - SURFACE
      ?auto_265404 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_265402 ?auto_265399 ) ( SURFACE-AT ?auto_265395 ?auto_265399 ) ( CLEAR ?auto_265395 ) ( IS-CRATE ?auto_265396 ) ( not ( = ?auto_265395 ?auto_265396 ) ) ( AVAILABLE ?auto_265402 ) ( ON ?auto_265395 ?auto_265398 ) ( not ( = ?auto_265398 ?auto_265395 ) ) ( not ( = ?auto_265398 ?auto_265396 ) ) ( TRUCK-AT ?auto_265397 ?auto_265403 ) ( not ( = ?auto_265403 ?auto_265399 ) ) ( HOIST-AT ?auto_265400 ?auto_265403 ) ( not ( = ?auto_265402 ?auto_265400 ) ) ( SURFACE-AT ?auto_265396 ?auto_265403 ) ( ON ?auto_265396 ?auto_265401 ) ( CLEAR ?auto_265396 ) ( not ( = ?auto_265395 ?auto_265401 ) ) ( not ( = ?auto_265396 ?auto_265401 ) ) ( not ( = ?auto_265398 ?auto_265401 ) ) ( LIFTING ?auto_265400 ?auto_265404 ) ( IS-CRATE ?auto_265404 ) ( not ( = ?auto_265395 ?auto_265404 ) ) ( not ( = ?auto_265396 ?auto_265404 ) ) ( not ( = ?auto_265398 ?auto_265404 ) ) ( not ( = ?auto_265401 ?auto_265404 ) ) )
    :subtasks
    ( ( !LOAD ?auto_265400 ?auto_265404 ?auto_265397 ?auto_265403 )
      ( MAKE-1CRATE ?auto_265395 ?auto_265396 )
      ( MAKE-1CRATE-VERIFY ?auto_265395 ?auto_265396 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265504 - SURFACE
      ?auto_265505 - SURFACE
      ?auto_265506 - SURFACE
      ?auto_265503 - SURFACE
      ?auto_265507 - SURFACE
    )
    :vars
    (
      ?auto_265509 - HOIST
      ?auto_265508 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_265509 ?auto_265508 ) ( SURFACE-AT ?auto_265503 ?auto_265508 ) ( CLEAR ?auto_265503 ) ( LIFTING ?auto_265509 ?auto_265507 ) ( IS-CRATE ?auto_265507 ) ( not ( = ?auto_265503 ?auto_265507 ) ) ( ON ?auto_265505 ?auto_265504 ) ( ON ?auto_265506 ?auto_265505 ) ( ON ?auto_265503 ?auto_265506 ) ( not ( = ?auto_265504 ?auto_265505 ) ) ( not ( = ?auto_265504 ?auto_265506 ) ) ( not ( = ?auto_265504 ?auto_265503 ) ) ( not ( = ?auto_265504 ?auto_265507 ) ) ( not ( = ?auto_265505 ?auto_265506 ) ) ( not ( = ?auto_265505 ?auto_265503 ) ) ( not ( = ?auto_265505 ?auto_265507 ) ) ( not ( = ?auto_265506 ?auto_265503 ) ) ( not ( = ?auto_265506 ?auto_265507 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_265503 ?auto_265507 )
      ( MAKE-4CRATE-VERIFY ?auto_265504 ?auto_265505 ?auto_265506 ?auto_265503 ?auto_265507 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265529 - SURFACE
      ?auto_265530 - SURFACE
      ?auto_265531 - SURFACE
      ?auto_265528 - SURFACE
      ?auto_265532 - SURFACE
    )
    :vars
    (
      ?auto_265533 - HOIST
      ?auto_265535 - PLACE
      ?auto_265534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265533 ?auto_265535 ) ( SURFACE-AT ?auto_265528 ?auto_265535 ) ( CLEAR ?auto_265528 ) ( IS-CRATE ?auto_265532 ) ( not ( = ?auto_265528 ?auto_265532 ) ) ( TRUCK-AT ?auto_265534 ?auto_265535 ) ( AVAILABLE ?auto_265533 ) ( IN ?auto_265532 ?auto_265534 ) ( ON ?auto_265528 ?auto_265531 ) ( not ( = ?auto_265531 ?auto_265528 ) ) ( not ( = ?auto_265531 ?auto_265532 ) ) ( ON ?auto_265530 ?auto_265529 ) ( ON ?auto_265531 ?auto_265530 ) ( not ( = ?auto_265529 ?auto_265530 ) ) ( not ( = ?auto_265529 ?auto_265531 ) ) ( not ( = ?auto_265529 ?auto_265528 ) ) ( not ( = ?auto_265529 ?auto_265532 ) ) ( not ( = ?auto_265530 ?auto_265531 ) ) ( not ( = ?auto_265530 ?auto_265528 ) ) ( not ( = ?auto_265530 ?auto_265532 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265531 ?auto_265528 ?auto_265532 )
      ( MAKE-4CRATE-VERIFY ?auto_265529 ?auto_265530 ?auto_265531 ?auto_265528 ?auto_265532 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265559 - SURFACE
      ?auto_265560 - SURFACE
      ?auto_265561 - SURFACE
      ?auto_265558 - SURFACE
      ?auto_265562 - SURFACE
    )
    :vars
    (
      ?auto_265565 - HOIST
      ?auto_265563 - PLACE
      ?auto_265564 - TRUCK
      ?auto_265566 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_265565 ?auto_265563 ) ( SURFACE-AT ?auto_265558 ?auto_265563 ) ( CLEAR ?auto_265558 ) ( IS-CRATE ?auto_265562 ) ( not ( = ?auto_265558 ?auto_265562 ) ) ( AVAILABLE ?auto_265565 ) ( IN ?auto_265562 ?auto_265564 ) ( ON ?auto_265558 ?auto_265561 ) ( not ( = ?auto_265561 ?auto_265558 ) ) ( not ( = ?auto_265561 ?auto_265562 ) ) ( TRUCK-AT ?auto_265564 ?auto_265566 ) ( not ( = ?auto_265566 ?auto_265563 ) ) ( ON ?auto_265560 ?auto_265559 ) ( ON ?auto_265561 ?auto_265560 ) ( not ( = ?auto_265559 ?auto_265560 ) ) ( not ( = ?auto_265559 ?auto_265561 ) ) ( not ( = ?auto_265559 ?auto_265558 ) ) ( not ( = ?auto_265559 ?auto_265562 ) ) ( not ( = ?auto_265560 ?auto_265561 ) ) ( not ( = ?auto_265560 ?auto_265558 ) ) ( not ( = ?auto_265560 ?auto_265562 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265561 ?auto_265558 ?auto_265562 )
      ( MAKE-4CRATE-VERIFY ?auto_265559 ?auto_265560 ?auto_265561 ?auto_265558 ?auto_265562 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265593 - SURFACE
      ?auto_265594 - SURFACE
      ?auto_265595 - SURFACE
      ?auto_265592 - SURFACE
      ?auto_265596 - SURFACE
    )
    :vars
    (
      ?auto_265597 - HOIST
      ?auto_265601 - PLACE
      ?auto_265600 - TRUCK
      ?auto_265599 - PLACE
      ?auto_265598 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_265597 ?auto_265601 ) ( SURFACE-AT ?auto_265592 ?auto_265601 ) ( CLEAR ?auto_265592 ) ( IS-CRATE ?auto_265596 ) ( not ( = ?auto_265592 ?auto_265596 ) ) ( AVAILABLE ?auto_265597 ) ( ON ?auto_265592 ?auto_265595 ) ( not ( = ?auto_265595 ?auto_265592 ) ) ( not ( = ?auto_265595 ?auto_265596 ) ) ( TRUCK-AT ?auto_265600 ?auto_265599 ) ( not ( = ?auto_265599 ?auto_265601 ) ) ( HOIST-AT ?auto_265598 ?auto_265599 ) ( LIFTING ?auto_265598 ?auto_265596 ) ( not ( = ?auto_265597 ?auto_265598 ) ) ( ON ?auto_265594 ?auto_265593 ) ( ON ?auto_265595 ?auto_265594 ) ( not ( = ?auto_265593 ?auto_265594 ) ) ( not ( = ?auto_265593 ?auto_265595 ) ) ( not ( = ?auto_265593 ?auto_265592 ) ) ( not ( = ?auto_265593 ?auto_265596 ) ) ( not ( = ?auto_265594 ?auto_265595 ) ) ( not ( = ?auto_265594 ?auto_265592 ) ) ( not ( = ?auto_265594 ?auto_265596 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265595 ?auto_265592 ?auto_265596 )
      ( MAKE-4CRATE-VERIFY ?auto_265593 ?auto_265594 ?auto_265595 ?auto_265592 ?auto_265596 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265631 - SURFACE
      ?auto_265632 - SURFACE
      ?auto_265633 - SURFACE
      ?auto_265630 - SURFACE
      ?auto_265634 - SURFACE
    )
    :vars
    (
      ?auto_265638 - HOIST
      ?auto_265640 - PLACE
      ?auto_265637 - TRUCK
      ?auto_265639 - PLACE
      ?auto_265635 - HOIST
      ?auto_265636 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_265638 ?auto_265640 ) ( SURFACE-AT ?auto_265630 ?auto_265640 ) ( CLEAR ?auto_265630 ) ( IS-CRATE ?auto_265634 ) ( not ( = ?auto_265630 ?auto_265634 ) ) ( AVAILABLE ?auto_265638 ) ( ON ?auto_265630 ?auto_265633 ) ( not ( = ?auto_265633 ?auto_265630 ) ) ( not ( = ?auto_265633 ?auto_265634 ) ) ( TRUCK-AT ?auto_265637 ?auto_265639 ) ( not ( = ?auto_265639 ?auto_265640 ) ) ( HOIST-AT ?auto_265635 ?auto_265639 ) ( not ( = ?auto_265638 ?auto_265635 ) ) ( AVAILABLE ?auto_265635 ) ( SURFACE-AT ?auto_265634 ?auto_265639 ) ( ON ?auto_265634 ?auto_265636 ) ( CLEAR ?auto_265634 ) ( not ( = ?auto_265630 ?auto_265636 ) ) ( not ( = ?auto_265634 ?auto_265636 ) ) ( not ( = ?auto_265633 ?auto_265636 ) ) ( ON ?auto_265632 ?auto_265631 ) ( ON ?auto_265633 ?auto_265632 ) ( not ( = ?auto_265631 ?auto_265632 ) ) ( not ( = ?auto_265631 ?auto_265633 ) ) ( not ( = ?auto_265631 ?auto_265630 ) ) ( not ( = ?auto_265631 ?auto_265634 ) ) ( not ( = ?auto_265631 ?auto_265636 ) ) ( not ( = ?auto_265632 ?auto_265633 ) ) ( not ( = ?auto_265632 ?auto_265630 ) ) ( not ( = ?auto_265632 ?auto_265634 ) ) ( not ( = ?auto_265632 ?auto_265636 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265633 ?auto_265630 ?auto_265634 )
      ( MAKE-4CRATE-VERIFY ?auto_265631 ?auto_265632 ?auto_265633 ?auto_265630 ?auto_265634 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265670 - SURFACE
      ?auto_265671 - SURFACE
      ?auto_265672 - SURFACE
      ?auto_265669 - SURFACE
      ?auto_265673 - SURFACE
    )
    :vars
    (
      ?auto_265679 - HOIST
      ?auto_265674 - PLACE
      ?auto_265677 - PLACE
      ?auto_265675 - HOIST
      ?auto_265676 - SURFACE
      ?auto_265678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265679 ?auto_265674 ) ( SURFACE-AT ?auto_265669 ?auto_265674 ) ( CLEAR ?auto_265669 ) ( IS-CRATE ?auto_265673 ) ( not ( = ?auto_265669 ?auto_265673 ) ) ( AVAILABLE ?auto_265679 ) ( ON ?auto_265669 ?auto_265672 ) ( not ( = ?auto_265672 ?auto_265669 ) ) ( not ( = ?auto_265672 ?auto_265673 ) ) ( not ( = ?auto_265677 ?auto_265674 ) ) ( HOIST-AT ?auto_265675 ?auto_265677 ) ( not ( = ?auto_265679 ?auto_265675 ) ) ( AVAILABLE ?auto_265675 ) ( SURFACE-AT ?auto_265673 ?auto_265677 ) ( ON ?auto_265673 ?auto_265676 ) ( CLEAR ?auto_265673 ) ( not ( = ?auto_265669 ?auto_265676 ) ) ( not ( = ?auto_265673 ?auto_265676 ) ) ( not ( = ?auto_265672 ?auto_265676 ) ) ( TRUCK-AT ?auto_265678 ?auto_265674 ) ( ON ?auto_265671 ?auto_265670 ) ( ON ?auto_265672 ?auto_265671 ) ( not ( = ?auto_265670 ?auto_265671 ) ) ( not ( = ?auto_265670 ?auto_265672 ) ) ( not ( = ?auto_265670 ?auto_265669 ) ) ( not ( = ?auto_265670 ?auto_265673 ) ) ( not ( = ?auto_265670 ?auto_265676 ) ) ( not ( = ?auto_265671 ?auto_265672 ) ) ( not ( = ?auto_265671 ?auto_265669 ) ) ( not ( = ?auto_265671 ?auto_265673 ) ) ( not ( = ?auto_265671 ?auto_265676 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265672 ?auto_265669 ?auto_265673 )
      ( MAKE-4CRATE-VERIFY ?auto_265670 ?auto_265671 ?auto_265672 ?auto_265669 ?auto_265673 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265709 - SURFACE
      ?auto_265710 - SURFACE
      ?auto_265711 - SURFACE
      ?auto_265708 - SURFACE
      ?auto_265712 - SURFACE
    )
    :vars
    (
      ?auto_265717 - HOIST
      ?auto_265714 - PLACE
      ?auto_265715 - PLACE
      ?auto_265716 - HOIST
      ?auto_265718 - SURFACE
      ?auto_265713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265717 ?auto_265714 ) ( IS-CRATE ?auto_265712 ) ( not ( = ?auto_265708 ?auto_265712 ) ) ( not ( = ?auto_265711 ?auto_265708 ) ) ( not ( = ?auto_265711 ?auto_265712 ) ) ( not ( = ?auto_265715 ?auto_265714 ) ) ( HOIST-AT ?auto_265716 ?auto_265715 ) ( not ( = ?auto_265717 ?auto_265716 ) ) ( AVAILABLE ?auto_265716 ) ( SURFACE-AT ?auto_265712 ?auto_265715 ) ( ON ?auto_265712 ?auto_265718 ) ( CLEAR ?auto_265712 ) ( not ( = ?auto_265708 ?auto_265718 ) ) ( not ( = ?auto_265712 ?auto_265718 ) ) ( not ( = ?auto_265711 ?auto_265718 ) ) ( TRUCK-AT ?auto_265713 ?auto_265714 ) ( SURFACE-AT ?auto_265711 ?auto_265714 ) ( CLEAR ?auto_265711 ) ( LIFTING ?auto_265717 ?auto_265708 ) ( IS-CRATE ?auto_265708 ) ( ON ?auto_265710 ?auto_265709 ) ( ON ?auto_265711 ?auto_265710 ) ( not ( = ?auto_265709 ?auto_265710 ) ) ( not ( = ?auto_265709 ?auto_265711 ) ) ( not ( = ?auto_265709 ?auto_265708 ) ) ( not ( = ?auto_265709 ?auto_265712 ) ) ( not ( = ?auto_265709 ?auto_265718 ) ) ( not ( = ?auto_265710 ?auto_265711 ) ) ( not ( = ?auto_265710 ?auto_265708 ) ) ( not ( = ?auto_265710 ?auto_265712 ) ) ( not ( = ?auto_265710 ?auto_265718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265711 ?auto_265708 ?auto_265712 )
      ( MAKE-4CRATE-VERIFY ?auto_265709 ?auto_265710 ?auto_265711 ?auto_265708 ?auto_265712 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265748 - SURFACE
      ?auto_265749 - SURFACE
      ?auto_265750 - SURFACE
      ?auto_265747 - SURFACE
      ?auto_265751 - SURFACE
    )
    :vars
    (
      ?auto_265757 - HOIST
      ?auto_265756 - PLACE
      ?auto_265752 - PLACE
      ?auto_265753 - HOIST
      ?auto_265754 - SURFACE
      ?auto_265755 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265757 ?auto_265756 ) ( IS-CRATE ?auto_265751 ) ( not ( = ?auto_265747 ?auto_265751 ) ) ( not ( = ?auto_265750 ?auto_265747 ) ) ( not ( = ?auto_265750 ?auto_265751 ) ) ( not ( = ?auto_265752 ?auto_265756 ) ) ( HOIST-AT ?auto_265753 ?auto_265752 ) ( not ( = ?auto_265757 ?auto_265753 ) ) ( AVAILABLE ?auto_265753 ) ( SURFACE-AT ?auto_265751 ?auto_265752 ) ( ON ?auto_265751 ?auto_265754 ) ( CLEAR ?auto_265751 ) ( not ( = ?auto_265747 ?auto_265754 ) ) ( not ( = ?auto_265751 ?auto_265754 ) ) ( not ( = ?auto_265750 ?auto_265754 ) ) ( TRUCK-AT ?auto_265755 ?auto_265756 ) ( SURFACE-AT ?auto_265750 ?auto_265756 ) ( CLEAR ?auto_265750 ) ( IS-CRATE ?auto_265747 ) ( AVAILABLE ?auto_265757 ) ( IN ?auto_265747 ?auto_265755 ) ( ON ?auto_265749 ?auto_265748 ) ( ON ?auto_265750 ?auto_265749 ) ( not ( = ?auto_265748 ?auto_265749 ) ) ( not ( = ?auto_265748 ?auto_265750 ) ) ( not ( = ?auto_265748 ?auto_265747 ) ) ( not ( = ?auto_265748 ?auto_265751 ) ) ( not ( = ?auto_265748 ?auto_265754 ) ) ( not ( = ?auto_265749 ?auto_265750 ) ) ( not ( = ?auto_265749 ?auto_265747 ) ) ( not ( = ?auto_265749 ?auto_265751 ) ) ( not ( = ?auto_265749 ?auto_265754 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265750 ?auto_265747 ?auto_265751 )
      ( MAKE-4CRATE-VERIFY ?auto_265748 ?auto_265749 ?auto_265750 ?auto_265747 ?auto_265751 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_266248 - SURFACE
      ?auto_266249 - SURFACE
    )
    :vars
    (
      ?auto_266256 - HOIST
      ?auto_266255 - PLACE
      ?auto_266253 - SURFACE
      ?auto_266250 - PLACE
      ?auto_266252 - HOIST
      ?auto_266254 - SURFACE
      ?auto_266251 - TRUCK
      ?auto_266257 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_266256 ?auto_266255 ) ( SURFACE-AT ?auto_266248 ?auto_266255 ) ( CLEAR ?auto_266248 ) ( IS-CRATE ?auto_266249 ) ( not ( = ?auto_266248 ?auto_266249 ) ) ( ON ?auto_266248 ?auto_266253 ) ( not ( = ?auto_266253 ?auto_266248 ) ) ( not ( = ?auto_266253 ?auto_266249 ) ) ( not ( = ?auto_266250 ?auto_266255 ) ) ( HOIST-AT ?auto_266252 ?auto_266250 ) ( not ( = ?auto_266256 ?auto_266252 ) ) ( AVAILABLE ?auto_266252 ) ( SURFACE-AT ?auto_266249 ?auto_266250 ) ( ON ?auto_266249 ?auto_266254 ) ( CLEAR ?auto_266249 ) ( not ( = ?auto_266248 ?auto_266254 ) ) ( not ( = ?auto_266249 ?auto_266254 ) ) ( not ( = ?auto_266253 ?auto_266254 ) ) ( TRUCK-AT ?auto_266251 ?auto_266255 ) ( LIFTING ?auto_266256 ?auto_266257 ) ( IS-CRATE ?auto_266257 ) ( not ( = ?auto_266248 ?auto_266257 ) ) ( not ( = ?auto_266249 ?auto_266257 ) ) ( not ( = ?auto_266253 ?auto_266257 ) ) ( not ( = ?auto_266254 ?auto_266257 ) ) )
    :subtasks
    ( ( !LOAD ?auto_266256 ?auto_266257 ?auto_266251 ?auto_266255 )
      ( MAKE-1CRATE ?auto_266248 ?auto_266249 )
      ( MAKE-1CRATE-VERIFY ?auto_266248 ?auto_266249 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_266408 - SURFACE
      ?auto_266409 - SURFACE
      ?auto_266410 - SURFACE
      ?auto_266407 - SURFACE
      ?auto_266411 - SURFACE
      ?auto_266412 - SURFACE
    )
    :vars
    (
      ?auto_266413 - HOIST
      ?auto_266414 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_266413 ?auto_266414 ) ( SURFACE-AT ?auto_266411 ?auto_266414 ) ( CLEAR ?auto_266411 ) ( LIFTING ?auto_266413 ?auto_266412 ) ( IS-CRATE ?auto_266412 ) ( not ( = ?auto_266411 ?auto_266412 ) ) ( ON ?auto_266409 ?auto_266408 ) ( ON ?auto_266410 ?auto_266409 ) ( ON ?auto_266407 ?auto_266410 ) ( ON ?auto_266411 ?auto_266407 ) ( not ( = ?auto_266408 ?auto_266409 ) ) ( not ( = ?auto_266408 ?auto_266410 ) ) ( not ( = ?auto_266408 ?auto_266407 ) ) ( not ( = ?auto_266408 ?auto_266411 ) ) ( not ( = ?auto_266408 ?auto_266412 ) ) ( not ( = ?auto_266409 ?auto_266410 ) ) ( not ( = ?auto_266409 ?auto_266407 ) ) ( not ( = ?auto_266409 ?auto_266411 ) ) ( not ( = ?auto_266409 ?auto_266412 ) ) ( not ( = ?auto_266410 ?auto_266407 ) ) ( not ( = ?auto_266410 ?auto_266411 ) ) ( not ( = ?auto_266410 ?auto_266412 ) ) ( not ( = ?auto_266407 ?auto_266411 ) ) ( not ( = ?auto_266407 ?auto_266412 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_266411 ?auto_266412 )
      ( MAKE-5CRATE-VERIFY ?auto_266408 ?auto_266409 ?auto_266410 ?auto_266407 ?auto_266411 ?auto_266412 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_266442 - SURFACE
      ?auto_266443 - SURFACE
      ?auto_266444 - SURFACE
      ?auto_266441 - SURFACE
      ?auto_266445 - SURFACE
      ?auto_266446 - SURFACE
    )
    :vars
    (
      ?auto_266447 - HOIST
      ?auto_266449 - PLACE
      ?auto_266448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_266447 ?auto_266449 ) ( SURFACE-AT ?auto_266445 ?auto_266449 ) ( CLEAR ?auto_266445 ) ( IS-CRATE ?auto_266446 ) ( not ( = ?auto_266445 ?auto_266446 ) ) ( TRUCK-AT ?auto_266448 ?auto_266449 ) ( AVAILABLE ?auto_266447 ) ( IN ?auto_266446 ?auto_266448 ) ( ON ?auto_266445 ?auto_266441 ) ( not ( = ?auto_266441 ?auto_266445 ) ) ( not ( = ?auto_266441 ?auto_266446 ) ) ( ON ?auto_266443 ?auto_266442 ) ( ON ?auto_266444 ?auto_266443 ) ( ON ?auto_266441 ?auto_266444 ) ( not ( = ?auto_266442 ?auto_266443 ) ) ( not ( = ?auto_266442 ?auto_266444 ) ) ( not ( = ?auto_266442 ?auto_266441 ) ) ( not ( = ?auto_266442 ?auto_266445 ) ) ( not ( = ?auto_266442 ?auto_266446 ) ) ( not ( = ?auto_266443 ?auto_266444 ) ) ( not ( = ?auto_266443 ?auto_266441 ) ) ( not ( = ?auto_266443 ?auto_266445 ) ) ( not ( = ?auto_266443 ?auto_266446 ) ) ( not ( = ?auto_266444 ?auto_266441 ) ) ( not ( = ?auto_266444 ?auto_266445 ) ) ( not ( = ?auto_266444 ?auto_266446 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_266441 ?auto_266445 ?auto_266446 )
      ( MAKE-5CRATE-VERIFY ?auto_266442 ?auto_266443 ?auto_266444 ?auto_266441 ?auto_266445 ?auto_266446 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_266482 - SURFACE
      ?auto_266483 - SURFACE
      ?auto_266484 - SURFACE
      ?auto_266481 - SURFACE
      ?auto_266485 - SURFACE
      ?auto_266486 - SURFACE
    )
    :vars
    (
      ?auto_266487 - HOIST
      ?auto_266489 - PLACE
      ?auto_266488 - TRUCK
      ?auto_266490 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_266487 ?auto_266489 ) ( SURFACE-AT ?auto_266485 ?auto_266489 ) ( CLEAR ?auto_266485 ) ( IS-CRATE ?auto_266486 ) ( not ( = ?auto_266485 ?auto_266486 ) ) ( AVAILABLE ?auto_266487 ) ( IN ?auto_266486 ?auto_266488 ) ( ON ?auto_266485 ?auto_266481 ) ( not ( = ?auto_266481 ?auto_266485 ) ) ( not ( = ?auto_266481 ?auto_266486 ) ) ( TRUCK-AT ?auto_266488 ?auto_266490 ) ( not ( = ?auto_266490 ?auto_266489 ) ) ( ON ?auto_266483 ?auto_266482 ) ( ON ?auto_266484 ?auto_266483 ) ( ON ?auto_266481 ?auto_266484 ) ( not ( = ?auto_266482 ?auto_266483 ) ) ( not ( = ?auto_266482 ?auto_266484 ) ) ( not ( = ?auto_266482 ?auto_266481 ) ) ( not ( = ?auto_266482 ?auto_266485 ) ) ( not ( = ?auto_266482 ?auto_266486 ) ) ( not ( = ?auto_266483 ?auto_266484 ) ) ( not ( = ?auto_266483 ?auto_266481 ) ) ( not ( = ?auto_266483 ?auto_266485 ) ) ( not ( = ?auto_266483 ?auto_266486 ) ) ( not ( = ?auto_266484 ?auto_266481 ) ) ( not ( = ?auto_266484 ?auto_266485 ) ) ( not ( = ?auto_266484 ?auto_266486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_266481 ?auto_266485 ?auto_266486 )
      ( MAKE-5CRATE-VERIFY ?auto_266482 ?auto_266483 ?auto_266484 ?auto_266481 ?auto_266485 ?auto_266486 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_266527 - SURFACE
      ?auto_266528 - SURFACE
      ?auto_266529 - SURFACE
      ?auto_266526 - SURFACE
      ?auto_266530 - SURFACE
      ?auto_266531 - SURFACE
    )
    :vars
    (
      ?auto_266533 - HOIST
      ?auto_266536 - PLACE
      ?auto_266534 - TRUCK
      ?auto_266535 - PLACE
      ?auto_266532 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_266533 ?auto_266536 ) ( SURFACE-AT ?auto_266530 ?auto_266536 ) ( CLEAR ?auto_266530 ) ( IS-CRATE ?auto_266531 ) ( not ( = ?auto_266530 ?auto_266531 ) ) ( AVAILABLE ?auto_266533 ) ( ON ?auto_266530 ?auto_266526 ) ( not ( = ?auto_266526 ?auto_266530 ) ) ( not ( = ?auto_266526 ?auto_266531 ) ) ( TRUCK-AT ?auto_266534 ?auto_266535 ) ( not ( = ?auto_266535 ?auto_266536 ) ) ( HOIST-AT ?auto_266532 ?auto_266535 ) ( LIFTING ?auto_266532 ?auto_266531 ) ( not ( = ?auto_266533 ?auto_266532 ) ) ( ON ?auto_266528 ?auto_266527 ) ( ON ?auto_266529 ?auto_266528 ) ( ON ?auto_266526 ?auto_266529 ) ( not ( = ?auto_266527 ?auto_266528 ) ) ( not ( = ?auto_266527 ?auto_266529 ) ) ( not ( = ?auto_266527 ?auto_266526 ) ) ( not ( = ?auto_266527 ?auto_266530 ) ) ( not ( = ?auto_266527 ?auto_266531 ) ) ( not ( = ?auto_266528 ?auto_266529 ) ) ( not ( = ?auto_266528 ?auto_266526 ) ) ( not ( = ?auto_266528 ?auto_266530 ) ) ( not ( = ?auto_266528 ?auto_266531 ) ) ( not ( = ?auto_266529 ?auto_266526 ) ) ( not ( = ?auto_266529 ?auto_266530 ) ) ( not ( = ?auto_266529 ?auto_266531 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_266526 ?auto_266530 ?auto_266531 )
      ( MAKE-5CRATE-VERIFY ?auto_266527 ?auto_266528 ?auto_266529 ?auto_266526 ?auto_266530 ?auto_266531 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_266577 - SURFACE
      ?auto_266578 - SURFACE
      ?auto_266579 - SURFACE
      ?auto_266576 - SURFACE
      ?auto_266580 - SURFACE
      ?auto_266581 - SURFACE
    )
    :vars
    (
      ?auto_266583 - HOIST
      ?auto_266587 - PLACE
      ?auto_266585 - TRUCK
      ?auto_266582 - PLACE
      ?auto_266584 - HOIST
      ?auto_266586 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_266583 ?auto_266587 ) ( SURFACE-AT ?auto_266580 ?auto_266587 ) ( CLEAR ?auto_266580 ) ( IS-CRATE ?auto_266581 ) ( not ( = ?auto_266580 ?auto_266581 ) ) ( AVAILABLE ?auto_266583 ) ( ON ?auto_266580 ?auto_266576 ) ( not ( = ?auto_266576 ?auto_266580 ) ) ( not ( = ?auto_266576 ?auto_266581 ) ) ( TRUCK-AT ?auto_266585 ?auto_266582 ) ( not ( = ?auto_266582 ?auto_266587 ) ) ( HOIST-AT ?auto_266584 ?auto_266582 ) ( not ( = ?auto_266583 ?auto_266584 ) ) ( AVAILABLE ?auto_266584 ) ( SURFACE-AT ?auto_266581 ?auto_266582 ) ( ON ?auto_266581 ?auto_266586 ) ( CLEAR ?auto_266581 ) ( not ( = ?auto_266580 ?auto_266586 ) ) ( not ( = ?auto_266581 ?auto_266586 ) ) ( not ( = ?auto_266576 ?auto_266586 ) ) ( ON ?auto_266578 ?auto_266577 ) ( ON ?auto_266579 ?auto_266578 ) ( ON ?auto_266576 ?auto_266579 ) ( not ( = ?auto_266577 ?auto_266578 ) ) ( not ( = ?auto_266577 ?auto_266579 ) ) ( not ( = ?auto_266577 ?auto_266576 ) ) ( not ( = ?auto_266577 ?auto_266580 ) ) ( not ( = ?auto_266577 ?auto_266581 ) ) ( not ( = ?auto_266577 ?auto_266586 ) ) ( not ( = ?auto_266578 ?auto_266579 ) ) ( not ( = ?auto_266578 ?auto_266576 ) ) ( not ( = ?auto_266578 ?auto_266580 ) ) ( not ( = ?auto_266578 ?auto_266581 ) ) ( not ( = ?auto_266578 ?auto_266586 ) ) ( not ( = ?auto_266579 ?auto_266576 ) ) ( not ( = ?auto_266579 ?auto_266580 ) ) ( not ( = ?auto_266579 ?auto_266581 ) ) ( not ( = ?auto_266579 ?auto_266586 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_266576 ?auto_266580 ?auto_266581 )
      ( MAKE-5CRATE-VERIFY ?auto_266577 ?auto_266578 ?auto_266579 ?auto_266576 ?auto_266580 ?auto_266581 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_266628 - SURFACE
      ?auto_266629 - SURFACE
      ?auto_266630 - SURFACE
      ?auto_266627 - SURFACE
      ?auto_266631 - SURFACE
      ?auto_266632 - SURFACE
    )
    :vars
    (
      ?auto_266633 - HOIST
      ?auto_266637 - PLACE
      ?auto_266634 - PLACE
      ?auto_266636 - HOIST
      ?auto_266638 - SURFACE
      ?auto_266635 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_266633 ?auto_266637 ) ( SURFACE-AT ?auto_266631 ?auto_266637 ) ( CLEAR ?auto_266631 ) ( IS-CRATE ?auto_266632 ) ( not ( = ?auto_266631 ?auto_266632 ) ) ( AVAILABLE ?auto_266633 ) ( ON ?auto_266631 ?auto_266627 ) ( not ( = ?auto_266627 ?auto_266631 ) ) ( not ( = ?auto_266627 ?auto_266632 ) ) ( not ( = ?auto_266634 ?auto_266637 ) ) ( HOIST-AT ?auto_266636 ?auto_266634 ) ( not ( = ?auto_266633 ?auto_266636 ) ) ( AVAILABLE ?auto_266636 ) ( SURFACE-AT ?auto_266632 ?auto_266634 ) ( ON ?auto_266632 ?auto_266638 ) ( CLEAR ?auto_266632 ) ( not ( = ?auto_266631 ?auto_266638 ) ) ( not ( = ?auto_266632 ?auto_266638 ) ) ( not ( = ?auto_266627 ?auto_266638 ) ) ( TRUCK-AT ?auto_266635 ?auto_266637 ) ( ON ?auto_266629 ?auto_266628 ) ( ON ?auto_266630 ?auto_266629 ) ( ON ?auto_266627 ?auto_266630 ) ( not ( = ?auto_266628 ?auto_266629 ) ) ( not ( = ?auto_266628 ?auto_266630 ) ) ( not ( = ?auto_266628 ?auto_266627 ) ) ( not ( = ?auto_266628 ?auto_266631 ) ) ( not ( = ?auto_266628 ?auto_266632 ) ) ( not ( = ?auto_266628 ?auto_266638 ) ) ( not ( = ?auto_266629 ?auto_266630 ) ) ( not ( = ?auto_266629 ?auto_266627 ) ) ( not ( = ?auto_266629 ?auto_266631 ) ) ( not ( = ?auto_266629 ?auto_266632 ) ) ( not ( = ?auto_266629 ?auto_266638 ) ) ( not ( = ?auto_266630 ?auto_266627 ) ) ( not ( = ?auto_266630 ?auto_266631 ) ) ( not ( = ?auto_266630 ?auto_266632 ) ) ( not ( = ?auto_266630 ?auto_266638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_266627 ?auto_266631 ?auto_266632 )
      ( MAKE-5CRATE-VERIFY ?auto_266628 ?auto_266629 ?auto_266630 ?auto_266627 ?auto_266631 ?auto_266632 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_266679 - SURFACE
      ?auto_266680 - SURFACE
      ?auto_266681 - SURFACE
      ?auto_266678 - SURFACE
      ?auto_266682 - SURFACE
      ?auto_266683 - SURFACE
    )
    :vars
    (
      ?auto_266688 - HOIST
      ?auto_266686 - PLACE
      ?auto_266687 - PLACE
      ?auto_266685 - HOIST
      ?auto_266689 - SURFACE
      ?auto_266684 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_266688 ?auto_266686 ) ( IS-CRATE ?auto_266683 ) ( not ( = ?auto_266682 ?auto_266683 ) ) ( not ( = ?auto_266678 ?auto_266682 ) ) ( not ( = ?auto_266678 ?auto_266683 ) ) ( not ( = ?auto_266687 ?auto_266686 ) ) ( HOIST-AT ?auto_266685 ?auto_266687 ) ( not ( = ?auto_266688 ?auto_266685 ) ) ( AVAILABLE ?auto_266685 ) ( SURFACE-AT ?auto_266683 ?auto_266687 ) ( ON ?auto_266683 ?auto_266689 ) ( CLEAR ?auto_266683 ) ( not ( = ?auto_266682 ?auto_266689 ) ) ( not ( = ?auto_266683 ?auto_266689 ) ) ( not ( = ?auto_266678 ?auto_266689 ) ) ( TRUCK-AT ?auto_266684 ?auto_266686 ) ( SURFACE-AT ?auto_266678 ?auto_266686 ) ( CLEAR ?auto_266678 ) ( LIFTING ?auto_266688 ?auto_266682 ) ( IS-CRATE ?auto_266682 ) ( ON ?auto_266680 ?auto_266679 ) ( ON ?auto_266681 ?auto_266680 ) ( ON ?auto_266678 ?auto_266681 ) ( not ( = ?auto_266679 ?auto_266680 ) ) ( not ( = ?auto_266679 ?auto_266681 ) ) ( not ( = ?auto_266679 ?auto_266678 ) ) ( not ( = ?auto_266679 ?auto_266682 ) ) ( not ( = ?auto_266679 ?auto_266683 ) ) ( not ( = ?auto_266679 ?auto_266689 ) ) ( not ( = ?auto_266680 ?auto_266681 ) ) ( not ( = ?auto_266680 ?auto_266678 ) ) ( not ( = ?auto_266680 ?auto_266682 ) ) ( not ( = ?auto_266680 ?auto_266683 ) ) ( not ( = ?auto_266680 ?auto_266689 ) ) ( not ( = ?auto_266681 ?auto_266678 ) ) ( not ( = ?auto_266681 ?auto_266682 ) ) ( not ( = ?auto_266681 ?auto_266683 ) ) ( not ( = ?auto_266681 ?auto_266689 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_266678 ?auto_266682 ?auto_266683 )
      ( MAKE-5CRATE-VERIFY ?auto_266679 ?auto_266680 ?auto_266681 ?auto_266678 ?auto_266682 ?auto_266683 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_266730 - SURFACE
      ?auto_266731 - SURFACE
      ?auto_266732 - SURFACE
      ?auto_266729 - SURFACE
      ?auto_266733 - SURFACE
      ?auto_266734 - SURFACE
    )
    :vars
    (
      ?auto_266740 - HOIST
      ?auto_266737 - PLACE
      ?auto_266738 - PLACE
      ?auto_266735 - HOIST
      ?auto_266739 - SURFACE
      ?auto_266736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_266740 ?auto_266737 ) ( IS-CRATE ?auto_266734 ) ( not ( = ?auto_266733 ?auto_266734 ) ) ( not ( = ?auto_266729 ?auto_266733 ) ) ( not ( = ?auto_266729 ?auto_266734 ) ) ( not ( = ?auto_266738 ?auto_266737 ) ) ( HOIST-AT ?auto_266735 ?auto_266738 ) ( not ( = ?auto_266740 ?auto_266735 ) ) ( AVAILABLE ?auto_266735 ) ( SURFACE-AT ?auto_266734 ?auto_266738 ) ( ON ?auto_266734 ?auto_266739 ) ( CLEAR ?auto_266734 ) ( not ( = ?auto_266733 ?auto_266739 ) ) ( not ( = ?auto_266734 ?auto_266739 ) ) ( not ( = ?auto_266729 ?auto_266739 ) ) ( TRUCK-AT ?auto_266736 ?auto_266737 ) ( SURFACE-AT ?auto_266729 ?auto_266737 ) ( CLEAR ?auto_266729 ) ( IS-CRATE ?auto_266733 ) ( AVAILABLE ?auto_266740 ) ( IN ?auto_266733 ?auto_266736 ) ( ON ?auto_266731 ?auto_266730 ) ( ON ?auto_266732 ?auto_266731 ) ( ON ?auto_266729 ?auto_266732 ) ( not ( = ?auto_266730 ?auto_266731 ) ) ( not ( = ?auto_266730 ?auto_266732 ) ) ( not ( = ?auto_266730 ?auto_266729 ) ) ( not ( = ?auto_266730 ?auto_266733 ) ) ( not ( = ?auto_266730 ?auto_266734 ) ) ( not ( = ?auto_266730 ?auto_266739 ) ) ( not ( = ?auto_266731 ?auto_266732 ) ) ( not ( = ?auto_266731 ?auto_266729 ) ) ( not ( = ?auto_266731 ?auto_266733 ) ) ( not ( = ?auto_266731 ?auto_266734 ) ) ( not ( = ?auto_266731 ?auto_266739 ) ) ( not ( = ?auto_266732 ?auto_266729 ) ) ( not ( = ?auto_266732 ?auto_266733 ) ) ( not ( = ?auto_266732 ?auto_266734 ) ) ( not ( = ?auto_266732 ?auto_266739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_266729 ?auto_266733 ?auto_266734 )
      ( MAKE-5CRATE-VERIFY ?auto_266730 ?auto_266731 ?auto_266732 ?auto_266729 ?auto_266733 ?auto_266734 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_267939 - SURFACE
      ?auto_267940 - SURFACE
      ?auto_267941 - SURFACE
      ?auto_267938 - SURFACE
      ?auto_267942 - SURFACE
      ?auto_267944 - SURFACE
      ?auto_267943 - SURFACE
    )
    :vars
    (
      ?auto_267946 - HOIST
      ?auto_267945 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_267946 ?auto_267945 ) ( SURFACE-AT ?auto_267944 ?auto_267945 ) ( CLEAR ?auto_267944 ) ( LIFTING ?auto_267946 ?auto_267943 ) ( IS-CRATE ?auto_267943 ) ( not ( = ?auto_267944 ?auto_267943 ) ) ( ON ?auto_267940 ?auto_267939 ) ( ON ?auto_267941 ?auto_267940 ) ( ON ?auto_267938 ?auto_267941 ) ( ON ?auto_267942 ?auto_267938 ) ( ON ?auto_267944 ?auto_267942 ) ( not ( = ?auto_267939 ?auto_267940 ) ) ( not ( = ?auto_267939 ?auto_267941 ) ) ( not ( = ?auto_267939 ?auto_267938 ) ) ( not ( = ?auto_267939 ?auto_267942 ) ) ( not ( = ?auto_267939 ?auto_267944 ) ) ( not ( = ?auto_267939 ?auto_267943 ) ) ( not ( = ?auto_267940 ?auto_267941 ) ) ( not ( = ?auto_267940 ?auto_267938 ) ) ( not ( = ?auto_267940 ?auto_267942 ) ) ( not ( = ?auto_267940 ?auto_267944 ) ) ( not ( = ?auto_267940 ?auto_267943 ) ) ( not ( = ?auto_267941 ?auto_267938 ) ) ( not ( = ?auto_267941 ?auto_267942 ) ) ( not ( = ?auto_267941 ?auto_267944 ) ) ( not ( = ?auto_267941 ?auto_267943 ) ) ( not ( = ?auto_267938 ?auto_267942 ) ) ( not ( = ?auto_267938 ?auto_267944 ) ) ( not ( = ?auto_267938 ?auto_267943 ) ) ( not ( = ?auto_267942 ?auto_267944 ) ) ( not ( = ?auto_267942 ?auto_267943 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_267944 ?auto_267943 )
      ( MAKE-6CRATE-VERIFY ?auto_267939 ?auto_267940 ?auto_267941 ?auto_267938 ?auto_267942 ?auto_267944 ?auto_267943 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_267983 - SURFACE
      ?auto_267984 - SURFACE
      ?auto_267985 - SURFACE
      ?auto_267982 - SURFACE
      ?auto_267986 - SURFACE
      ?auto_267988 - SURFACE
      ?auto_267987 - SURFACE
    )
    :vars
    (
      ?auto_267989 - HOIST
      ?auto_267990 - PLACE
      ?auto_267991 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_267989 ?auto_267990 ) ( SURFACE-AT ?auto_267988 ?auto_267990 ) ( CLEAR ?auto_267988 ) ( IS-CRATE ?auto_267987 ) ( not ( = ?auto_267988 ?auto_267987 ) ) ( TRUCK-AT ?auto_267991 ?auto_267990 ) ( AVAILABLE ?auto_267989 ) ( IN ?auto_267987 ?auto_267991 ) ( ON ?auto_267988 ?auto_267986 ) ( not ( = ?auto_267986 ?auto_267988 ) ) ( not ( = ?auto_267986 ?auto_267987 ) ) ( ON ?auto_267984 ?auto_267983 ) ( ON ?auto_267985 ?auto_267984 ) ( ON ?auto_267982 ?auto_267985 ) ( ON ?auto_267986 ?auto_267982 ) ( not ( = ?auto_267983 ?auto_267984 ) ) ( not ( = ?auto_267983 ?auto_267985 ) ) ( not ( = ?auto_267983 ?auto_267982 ) ) ( not ( = ?auto_267983 ?auto_267986 ) ) ( not ( = ?auto_267983 ?auto_267988 ) ) ( not ( = ?auto_267983 ?auto_267987 ) ) ( not ( = ?auto_267984 ?auto_267985 ) ) ( not ( = ?auto_267984 ?auto_267982 ) ) ( not ( = ?auto_267984 ?auto_267986 ) ) ( not ( = ?auto_267984 ?auto_267988 ) ) ( not ( = ?auto_267984 ?auto_267987 ) ) ( not ( = ?auto_267985 ?auto_267982 ) ) ( not ( = ?auto_267985 ?auto_267986 ) ) ( not ( = ?auto_267985 ?auto_267988 ) ) ( not ( = ?auto_267985 ?auto_267987 ) ) ( not ( = ?auto_267982 ?auto_267986 ) ) ( not ( = ?auto_267982 ?auto_267988 ) ) ( not ( = ?auto_267982 ?auto_267987 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_267986 ?auto_267988 ?auto_267987 )
      ( MAKE-6CRATE-VERIFY ?auto_267983 ?auto_267984 ?auto_267985 ?auto_267982 ?auto_267986 ?auto_267988 ?auto_267987 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_268034 - SURFACE
      ?auto_268035 - SURFACE
      ?auto_268036 - SURFACE
      ?auto_268033 - SURFACE
      ?auto_268037 - SURFACE
      ?auto_268039 - SURFACE
      ?auto_268038 - SURFACE
    )
    :vars
    (
      ?auto_268041 - HOIST
      ?auto_268043 - PLACE
      ?auto_268040 - TRUCK
      ?auto_268042 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_268041 ?auto_268043 ) ( SURFACE-AT ?auto_268039 ?auto_268043 ) ( CLEAR ?auto_268039 ) ( IS-CRATE ?auto_268038 ) ( not ( = ?auto_268039 ?auto_268038 ) ) ( AVAILABLE ?auto_268041 ) ( IN ?auto_268038 ?auto_268040 ) ( ON ?auto_268039 ?auto_268037 ) ( not ( = ?auto_268037 ?auto_268039 ) ) ( not ( = ?auto_268037 ?auto_268038 ) ) ( TRUCK-AT ?auto_268040 ?auto_268042 ) ( not ( = ?auto_268042 ?auto_268043 ) ) ( ON ?auto_268035 ?auto_268034 ) ( ON ?auto_268036 ?auto_268035 ) ( ON ?auto_268033 ?auto_268036 ) ( ON ?auto_268037 ?auto_268033 ) ( not ( = ?auto_268034 ?auto_268035 ) ) ( not ( = ?auto_268034 ?auto_268036 ) ) ( not ( = ?auto_268034 ?auto_268033 ) ) ( not ( = ?auto_268034 ?auto_268037 ) ) ( not ( = ?auto_268034 ?auto_268039 ) ) ( not ( = ?auto_268034 ?auto_268038 ) ) ( not ( = ?auto_268035 ?auto_268036 ) ) ( not ( = ?auto_268035 ?auto_268033 ) ) ( not ( = ?auto_268035 ?auto_268037 ) ) ( not ( = ?auto_268035 ?auto_268039 ) ) ( not ( = ?auto_268035 ?auto_268038 ) ) ( not ( = ?auto_268036 ?auto_268033 ) ) ( not ( = ?auto_268036 ?auto_268037 ) ) ( not ( = ?auto_268036 ?auto_268039 ) ) ( not ( = ?auto_268036 ?auto_268038 ) ) ( not ( = ?auto_268033 ?auto_268037 ) ) ( not ( = ?auto_268033 ?auto_268039 ) ) ( not ( = ?auto_268033 ?auto_268038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_268037 ?auto_268039 ?auto_268038 )
      ( MAKE-6CRATE-VERIFY ?auto_268034 ?auto_268035 ?auto_268036 ?auto_268033 ?auto_268037 ?auto_268039 ?auto_268038 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_268091 - SURFACE
      ?auto_268092 - SURFACE
      ?auto_268093 - SURFACE
      ?auto_268090 - SURFACE
      ?auto_268094 - SURFACE
      ?auto_268096 - SURFACE
      ?auto_268095 - SURFACE
    )
    :vars
    (
      ?auto_268101 - HOIST
      ?auto_268100 - PLACE
      ?auto_268098 - TRUCK
      ?auto_268097 - PLACE
      ?auto_268099 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_268101 ?auto_268100 ) ( SURFACE-AT ?auto_268096 ?auto_268100 ) ( CLEAR ?auto_268096 ) ( IS-CRATE ?auto_268095 ) ( not ( = ?auto_268096 ?auto_268095 ) ) ( AVAILABLE ?auto_268101 ) ( ON ?auto_268096 ?auto_268094 ) ( not ( = ?auto_268094 ?auto_268096 ) ) ( not ( = ?auto_268094 ?auto_268095 ) ) ( TRUCK-AT ?auto_268098 ?auto_268097 ) ( not ( = ?auto_268097 ?auto_268100 ) ) ( HOIST-AT ?auto_268099 ?auto_268097 ) ( LIFTING ?auto_268099 ?auto_268095 ) ( not ( = ?auto_268101 ?auto_268099 ) ) ( ON ?auto_268092 ?auto_268091 ) ( ON ?auto_268093 ?auto_268092 ) ( ON ?auto_268090 ?auto_268093 ) ( ON ?auto_268094 ?auto_268090 ) ( not ( = ?auto_268091 ?auto_268092 ) ) ( not ( = ?auto_268091 ?auto_268093 ) ) ( not ( = ?auto_268091 ?auto_268090 ) ) ( not ( = ?auto_268091 ?auto_268094 ) ) ( not ( = ?auto_268091 ?auto_268096 ) ) ( not ( = ?auto_268091 ?auto_268095 ) ) ( not ( = ?auto_268092 ?auto_268093 ) ) ( not ( = ?auto_268092 ?auto_268090 ) ) ( not ( = ?auto_268092 ?auto_268094 ) ) ( not ( = ?auto_268092 ?auto_268096 ) ) ( not ( = ?auto_268092 ?auto_268095 ) ) ( not ( = ?auto_268093 ?auto_268090 ) ) ( not ( = ?auto_268093 ?auto_268094 ) ) ( not ( = ?auto_268093 ?auto_268096 ) ) ( not ( = ?auto_268093 ?auto_268095 ) ) ( not ( = ?auto_268090 ?auto_268094 ) ) ( not ( = ?auto_268090 ?auto_268096 ) ) ( not ( = ?auto_268090 ?auto_268095 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_268094 ?auto_268096 ?auto_268095 )
      ( MAKE-6CRATE-VERIFY ?auto_268091 ?auto_268092 ?auto_268093 ?auto_268090 ?auto_268094 ?auto_268096 ?auto_268095 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_268154 - SURFACE
      ?auto_268155 - SURFACE
      ?auto_268156 - SURFACE
      ?auto_268153 - SURFACE
      ?auto_268157 - SURFACE
      ?auto_268159 - SURFACE
      ?auto_268158 - SURFACE
    )
    :vars
    (
      ?auto_268165 - HOIST
      ?auto_268163 - PLACE
      ?auto_268160 - TRUCK
      ?auto_268164 - PLACE
      ?auto_268162 - HOIST
      ?auto_268161 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_268165 ?auto_268163 ) ( SURFACE-AT ?auto_268159 ?auto_268163 ) ( CLEAR ?auto_268159 ) ( IS-CRATE ?auto_268158 ) ( not ( = ?auto_268159 ?auto_268158 ) ) ( AVAILABLE ?auto_268165 ) ( ON ?auto_268159 ?auto_268157 ) ( not ( = ?auto_268157 ?auto_268159 ) ) ( not ( = ?auto_268157 ?auto_268158 ) ) ( TRUCK-AT ?auto_268160 ?auto_268164 ) ( not ( = ?auto_268164 ?auto_268163 ) ) ( HOIST-AT ?auto_268162 ?auto_268164 ) ( not ( = ?auto_268165 ?auto_268162 ) ) ( AVAILABLE ?auto_268162 ) ( SURFACE-AT ?auto_268158 ?auto_268164 ) ( ON ?auto_268158 ?auto_268161 ) ( CLEAR ?auto_268158 ) ( not ( = ?auto_268159 ?auto_268161 ) ) ( not ( = ?auto_268158 ?auto_268161 ) ) ( not ( = ?auto_268157 ?auto_268161 ) ) ( ON ?auto_268155 ?auto_268154 ) ( ON ?auto_268156 ?auto_268155 ) ( ON ?auto_268153 ?auto_268156 ) ( ON ?auto_268157 ?auto_268153 ) ( not ( = ?auto_268154 ?auto_268155 ) ) ( not ( = ?auto_268154 ?auto_268156 ) ) ( not ( = ?auto_268154 ?auto_268153 ) ) ( not ( = ?auto_268154 ?auto_268157 ) ) ( not ( = ?auto_268154 ?auto_268159 ) ) ( not ( = ?auto_268154 ?auto_268158 ) ) ( not ( = ?auto_268154 ?auto_268161 ) ) ( not ( = ?auto_268155 ?auto_268156 ) ) ( not ( = ?auto_268155 ?auto_268153 ) ) ( not ( = ?auto_268155 ?auto_268157 ) ) ( not ( = ?auto_268155 ?auto_268159 ) ) ( not ( = ?auto_268155 ?auto_268158 ) ) ( not ( = ?auto_268155 ?auto_268161 ) ) ( not ( = ?auto_268156 ?auto_268153 ) ) ( not ( = ?auto_268156 ?auto_268157 ) ) ( not ( = ?auto_268156 ?auto_268159 ) ) ( not ( = ?auto_268156 ?auto_268158 ) ) ( not ( = ?auto_268156 ?auto_268161 ) ) ( not ( = ?auto_268153 ?auto_268157 ) ) ( not ( = ?auto_268153 ?auto_268159 ) ) ( not ( = ?auto_268153 ?auto_268158 ) ) ( not ( = ?auto_268153 ?auto_268161 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_268157 ?auto_268159 ?auto_268158 )
      ( MAKE-6CRATE-VERIFY ?auto_268154 ?auto_268155 ?auto_268156 ?auto_268153 ?auto_268157 ?auto_268159 ?auto_268158 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_268218 - SURFACE
      ?auto_268219 - SURFACE
      ?auto_268220 - SURFACE
      ?auto_268217 - SURFACE
      ?auto_268221 - SURFACE
      ?auto_268223 - SURFACE
      ?auto_268222 - SURFACE
    )
    :vars
    (
      ?auto_268226 - HOIST
      ?auto_268224 - PLACE
      ?auto_268225 - PLACE
      ?auto_268227 - HOIST
      ?auto_268228 - SURFACE
      ?auto_268229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_268226 ?auto_268224 ) ( SURFACE-AT ?auto_268223 ?auto_268224 ) ( CLEAR ?auto_268223 ) ( IS-CRATE ?auto_268222 ) ( not ( = ?auto_268223 ?auto_268222 ) ) ( AVAILABLE ?auto_268226 ) ( ON ?auto_268223 ?auto_268221 ) ( not ( = ?auto_268221 ?auto_268223 ) ) ( not ( = ?auto_268221 ?auto_268222 ) ) ( not ( = ?auto_268225 ?auto_268224 ) ) ( HOIST-AT ?auto_268227 ?auto_268225 ) ( not ( = ?auto_268226 ?auto_268227 ) ) ( AVAILABLE ?auto_268227 ) ( SURFACE-AT ?auto_268222 ?auto_268225 ) ( ON ?auto_268222 ?auto_268228 ) ( CLEAR ?auto_268222 ) ( not ( = ?auto_268223 ?auto_268228 ) ) ( not ( = ?auto_268222 ?auto_268228 ) ) ( not ( = ?auto_268221 ?auto_268228 ) ) ( TRUCK-AT ?auto_268229 ?auto_268224 ) ( ON ?auto_268219 ?auto_268218 ) ( ON ?auto_268220 ?auto_268219 ) ( ON ?auto_268217 ?auto_268220 ) ( ON ?auto_268221 ?auto_268217 ) ( not ( = ?auto_268218 ?auto_268219 ) ) ( not ( = ?auto_268218 ?auto_268220 ) ) ( not ( = ?auto_268218 ?auto_268217 ) ) ( not ( = ?auto_268218 ?auto_268221 ) ) ( not ( = ?auto_268218 ?auto_268223 ) ) ( not ( = ?auto_268218 ?auto_268222 ) ) ( not ( = ?auto_268218 ?auto_268228 ) ) ( not ( = ?auto_268219 ?auto_268220 ) ) ( not ( = ?auto_268219 ?auto_268217 ) ) ( not ( = ?auto_268219 ?auto_268221 ) ) ( not ( = ?auto_268219 ?auto_268223 ) ) ( not ( = ?auto_268219 ?auto_268222 ) ) ( not ( = ?auto_268219 ?auto_268228 ) ) ( not ( = ?auto_268220 ?auto_268217 ) ) ( not ( = ?auto_268220 ?auto_268221 ) ) ( not ( = ?auto_268220 ?auto_268223 ) ) ( not ( = ?auto_268220 ?auto_268222 ) ) ( not ( = ?auto_268220 ?auto_268228 ) ) ( not ( = ?auto_268217 ?auto_268221 ) ) ( not ( = ?auto_268217 ?auto_268223 ) ) ( not ( = ?auto_268217 ?auto_268222 ) ) ( not ( = ?auto_268217 ?auto_268228 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_268221 ?auto_268223 ?auto_268222 )
      ( MAKE-6CRATE-VERIFY ?auto_268218 ?auto_268219 ?auto_268220 ?auto_268217 ?auto_268221 ?auto_268223 ?auto_268222 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_268282 - SURFACE
      ?auto_268283 - SURFACE
      ?auto_268284 - SURFACE
      ?auto_268281 - SURFACE
      ?auto_268285 - SURFACE
      ?auto_268287 - SURFACE
      ?auto_268286 - SURFACE
    )
    :vars
    (
      ?auto_268292 - HOIST
      ?auto_268291 - PLACE
      ?auto_268288 - PLACE
      ?auto_268290 - HOIST
      ?auto_268293 - SURFACE
      ?auto_268289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_268292 ?auto_268291 ) ( IS-CRATE ?auto_268286 ) ( not ( = ?auto_268287 ?auto_268286 ) ) ( not ( = ?auto_268285 ?auto_268287 ) ) ( not ( = ?auto_268285 ?auto_268286 ) ) ( not ( = ?auto_268288 ?auto_268291 ) ) ( HOIST-AT ?auto_268290 ?auto_268288 ) ( not ( = ?auto_268292 ?auto_268290 ) ) ( AVAILABLE ?auto_268290 ) ( SURFACE-AT ?auto_268286 ?auto_268288 ) ( ON ?auto_268286 ?auto_268293 ) ( CLEAR ?auto_268286 ) ( not ( = ?auto_268287 ?auto_268293 ) ) ( not ( = ?auto_268286 ?auto_268293 ) ) ( not ( = ?auto_268285 ?auto_268293 ) ) ( TRUCK-AT ?auto_268289 ?auto_268291 ) ( SURFACE-AT ?auto_268285 ?auto_268291 ) ( CLEAR ?auto_268285 ) ( LIFTING ?auto_268292 ?auto_268287 ) ( IS-CRATE ?auto_268287 ) ( ON ?auto_268283 ?auto_268282 ) ( ON ?auto_268284 ?auto_268283 ) ( ON ?auto_268281 ?auto_268284 ) ( ON ?auto_268285 ?auto_268281 ) ( not ( = ?auto_268282 ?auto_268283 ) ) ( not ( = ?auto_268282 ?auto_268284 ) ) ( not ( = ?auto_268282 ?auto_268281 ) ) ( not ( = ?auto_268282 ?auto_268285 ) ) ( not ( = ?auto_268282 ?auto_268287 ) ) ( not ( = ?auto_268282 ?auto_268286 ) ) ( not ( = ?auto_268282 ?auto_268293 ) ) ( not ( = ?auto_268283 ?auto_268284 ) ) ( not ( = ?auto_268283 ?auto_268281 ) ) ( not ( = ?auto_268283 ?auto_268285 ) ) ( not ( = ?auto_268283 ?auto_268287 ) ) ( not ( = ?auto_268283 ?auto_268286 ) ) ( not ( = ?auto_268283 ?auto_268293 ) ) ( not ( = ?auto_268284 ?auto_268281 ) ) ( not ( = ?auto_268284 ?auto_268285 ) ) ( not ( = ?auto_268284 ?auto_268287 ) ) ( not ( = ?auto_268284 ?auto_268286 ) ) ( not ( = ?auto_268284 ?auto_268293 ) ) ( not ( = ?auto_268281 ?auto_268285 ) ) ( not ( = ?auto_268281 ?auto_268287 ) ) ( not ( = ?auto_268281 ?auto_268286 ) ) ( not ( = ?auto_268281 ?auto_268293 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_268285 ?auto_268287 ?auto_268286 )
      ( MAKE-6CRATE-VERIFY ?auto_268282 ?auto_268283 ?auto_268284 ?auto_268281 ?auto_268285 ?auto_268287 ?auto_268286 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_268346 - SURFACE
      ?auto_268347 - SURFACE
      ?auto_268348 - SURFACE
      ?auto_268345 - SURFACE
      ?auto_268349 - SURFACE
      ?auto_268351 - SURFACE
      ?auto_268350 - SURFACE
    )
    :vars
    (
      ?auto_268352 - HOIST
      ?auto_268354 - PLACE
      ?auto_268353 - PLACE
      ?auto_268355 - HOIST
      ?auto_268356 - SURFACE
      ?auto_268357 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_268352 ?auto_268354 ) ( IS-CRATE ?auto_268350 ) ( not ( = ?auto_268351 ?auto_268350 ) ) ( not ( = ?auto_268349 ?auto_268351 ) ) ( not ( = ?auto_268349 ?auto_268350 ) ) ( not ( = ?auto_268353 ?auto_268354 ) ) ( HOIST-AT ?auto_268355 ?auto_268353 ) ( not ( = ?auto_268352 ?auto_268355 ) ) ( AVAILABLE ?auto_268355 ) ( SURFACE-AT ?auto_268350 ?auto_268353 ) ( ON ?auto_268350 ?auto_268356 ) ( CLEAR ?auto_268350 ) ( not ( = ?auto_268351 ?auto_268356 ) ) ( not ( = ?auto_268350 ?auto_268356 ) ) ( not ( = ?auto_268349 ?auto_268356 ) ) ( TRUCK-AT ?auto_268357 ?auto_268354 ) ( SURFACE-AT ?auto_268349 ?auto_268354 ) ( CLEAR ?auto_268349 ) ( IS-CRATE ?auto_268351 ) ( AVAILABLE ?auto_268352 ) ( IN ?auto_268351 ?auto_268357 ) ( ON ?auto_268347 ?auto_268346 ) ( ON ?auto_268348 ?auto_268347 ) ( ON ?auto_268345 ?auto_268348 ) ( ON ?auto_268349 ?auto_268345 ) ( not ( = ?auto_268346 ?auto_268347 ) ) ( not ( = ?auto_268346 ?auto_268348 ) ) ( not ( = ?auto_268346 ?auto_268345 ) ) ( not ( = ?auto_268346 ?auto_268349 ) ) ( not ( = ?auto_268346 ?auto_268351 ) ) ( not ( = ?auto_268346 ?auto_268350 ) ) ( not ( = ?auto_268346 ?auto_268356 ) ) ( not ( = ?auto_268347 ?auto_268348 ) ) ( not ( = ?auto_268347 ?auto_268345 ) ) ( not ( = ?auto_268347 ?auto_268349 ) ) ( not ( = ?auto_268347 ?auto_268351 ) ) ( not ( = ?auto_268347 ?auto_268350 ) ) ( not ( = ?auto_268347 ?auto_268356 ) ) ( not ( = ?auto_268348 ?auto_268345 ) ) ( not ( = ?auto_268348 ?auto_268349 ) ) ( not ( = ?auto_268348 ?auto_268351 ) ) ( not ( = ?auto_268348 ?auto_268350 ) ) ( not ( = ?auto_268348 ?auto_268356 ) ) ( not ( = ?auto_268345 ?auto_268349 ) ) ( not ( = ?auto_268345 ?auto_268351 ) ) ( not ( = ?auto_268345 ?auto_268350 ) ) ( not ( = ?auto_268345 ?auto_268356 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_268349 ?auto_268351 ?auto_268350 )
      ( MAKE-6CRATE-VERIFY ?auto_268346 ?auto_268347 ?auto_268348 ?auto_268345 ?auto_268349 ?auto_268351 ?auto_268350 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_270295 - SURFACE
      ?auto_270296 - SURFACE
      ?auto_270297 - SURFACE
      ?auto_270294 - SURFACE
      ?auto_270298 - SURFACE
      ?auto_270300 - SURFACE
      ?auto_270299 - SURFACE
      ?auto_270301 - SURFACE
    )
    :vars
    (
      ?auto_270303 - HOIST
      ?auto_270302 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_270303 ?auto_270302 ) ( SURFACE-AT ?auto_270299 ?auto_270302 ) ( CLEAR ?auto_270299 ) ( LIFTING ?auto_270303 ?auto_270301 ) ( IS-CRATE ?auto_270301 ) ( not ( = ?auto_270299 ?auto_270301 ) ) ( ON ?auto_270296 ?auto_270295 ) ( ON ?auto_270297 ?auto_270296 ) ( ON ?auto_270294 ?auto_270297 ) ( ON ?auto_270298 ?auto_270294 ) ( ON ?auto_270300 ?auto_270298 ) ( ON ?auto_270299 ?auto_270300 ) ( not ( = ?auto_270295 ?auto_270296 ) ) ( not ( = ?auto_270295 ?auto_270297 ) ) ( not ( = ?auto_270295 ?auto_270294 ) ) ( not ( = ?auto_270295 ?auto_270298 ) ) ( not ( = ?auto_270295 ?auto_270300 ) ) ( not ( = ?auto_270295 ?auto_270299 ) ) ( not ( = ?auto_270295 ?auto_270301 ) ) ( not ( = ?auto_270296 ?auto_270297 ) ) ( not ( = ?auto_270296 ?auto_270294 ) ) ( not ( = ?auto_270296 ?auto_270298 ) ) ( not ( = ?auto_270296 ?auto_270300 ) ) ( not ( = ?auto_270296 ?auto_270299 ) ) ( not ( = ?auto_270296 ?auto_270301 ) ) ( not ( = ?auto_270297 ?auto_270294 ) ) ( not ( = ?auto_270297 ?auto_270298 ) ) ( not ( = ?auto_270297 ?auto_270300 ) ) ( not ( = ?auto_270297 ?auto_270299 ) ) ( not ( = ?auto_270297 ?auto_270301 ) ) ( not ( = ?auto_270294 ?auto_270298 ) ) ( not ( = ?auto_270294 ?auto_270300 ) ) ( not ( = ?auto_270294 ?auto_270299 ) ) ( not ( = ?auto_270294 ?auto_270301 ) ) ( not ( = ?auto_270298 ?auto_270300 ) ) ( not ( = ?auto_270298 ?auto_270299 ) ) ( not ( = ?auto_270298 ?auto_270301 ) ) ( not ( = ?auto_270300 ?auto_270299 ) ) ( not ( = ?auto_270300 ?auto_270301 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_270299 ?auto_270301 )
      ( MAKE-7CRATE-VERIFY ?auto_270295 ?auto_270296 ?auto_270297 ?auto_270294 ?auto_270298 ?auto_270300 ?auto_270299 ?auto_270301 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_270350 - SURFACE
      ?auto_270351 - SURFACE
      ?auto_270352 - SURFACE
      ?auto_270349 - SURFACE
      ?auto_270353 - SURFACE
      ?auto_270355 - SURFACE
      ?auto_270354 - SURFACE
      ?auto_270356 - SURFACE
    )
    :vars
    (
      ?auto_270357 - HOIST
      ?auto_270359 - PLACE
      ?auto_270358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_270357 ?auto_270359 ) ( SURFACE-AT ?auto_270354 ?auto_270359 ) ( CLEAR ?auto_270354 ) ( IS-CRATE ?auto_270356 ) ( not ( = ?auto_270354 ?auto_270356 ) ) ( TRUCK-AT ?auto_270358 ?auto_270359 ) ( AVAILABLE ?auto_270357 ) ( IN ?auto_270356 ?auto_270358 ) ( ON ?auto_270354 ?auto_270355 ) ( not ( = ?auto_270355 ?auto_270354 ) ) ( not ( = ?auto_270355 ?auto_270356 ) ) ( ON ?auto_270351 ?auto_270350 ) ( ON ?auto_270352 ?auto_270351 ) ( ON ?auto_270349 ?auto_270352 ) ( ON ?auto_270353 ?auto_270349 ) ( ON ?auto_270355 ?auto_270353 ) ( not ( = ?auto_270350 ?auto_270351 ) ) ( not ( = ?auto_270350 ?auto_270352 ) ) ( not ( = ?auto_270350 ?auto_270349 ) ) ( not ( = ?auto_270350 ?auto_270353 ) ) ( not ( = ?auto_270350 ?auto_270355 ) ) ( not ( = ?auto_270350 ?auto_270354 ) ) ( not ( = ?auto_270350 ?auto_270356 ) ) ( not ( = ?auto_270351 ?auto_270352 ) ) ( not ( = ?auto_270351 ?auto_270349 ) ) ( not ( = ?auto_270351 ?auto_270353 ) ) ( not ( = ?auto_270351 ?auto_270355 ) ) ( not ( = ?auto_270351 ?auto_270354 ) ) ( not ( = ?auto_270351 ?auto_270356 ) ) ( not ( = ?auto_270352 ?auto_270349 ) ) ( not ( = ?auto_270352 ?auto_270353 ) ) ( not ( = ?auto_270352 ?auto_270355 ) ) ( not ( = ?auto_270352 ?auto_270354 ) ) ( not ( = ?auto_270352 ?auto_270356 ) ) ( not ( = ?auto_270349 ?auto_270353 ) ) ( not ( = ?auto_270349 ?auto_270355 ) ) ( not ( = ?auto_270349 ?auto_270354 ) ) ( not ( = ?auto_270349 ?auto_270356 ) ) ( not ( = ?auto_270353 ?auto_270355 ) ) ( not ( = ?auto_270353 ?auto_270354 ) ) ( not ( = ?auto_270353 ?auto_270356 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_270355 ?auto_270354 ?auto_270356 )
      ( MAKE-7CRATE-VERIFY ?auto_270350 ?auto_270351 ?auto_270352 ?auto_270349 ?auto_270353 ?auto_270355 ?auto_270354 ?auto_270356 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_270413 - SURFACE
      ?auto_270414 - SURFACE
      ?auto_270415 - SURFACE
      ?auto_270412 - SURFACE
      ?auto_270416 - SURFACE
      ?auto_270418 - SURFACE
      ?auto_270417 - SURFACE
      ?auto_270419 - SURFACE
    )
    :vars
    (
      ?auto_270420 - HOIST
      ?auto_270421 - PLACE
      ?auto_270423 - TRUCK
      ?auto_270422 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_270420 ?auto_270421 ) ( SURFACE-AT ?auto_270417 ?auto_270421 ) ( CLEAR ?auto_270417 ) ( IS-CRATE ?auto_270419 ) ( not ( = ?auto_270417 ?auto_270419 ) ) ( AVAILABLE ?auto_270420 ) ( IN ?auto_270419 ?auto_270423 ) ( ON ?auto_270417 ?auto_270418 ) ( not ( = ?auto_270418 ?auto_270417 ) ) ( not ( = ?auto_270418 ?auto_270419 ) ) ( TRUCK-AT ?auto_270423 ?auto_270422 ) ( not ( = ?auto_270422 ?auto_270421 ) ) ( ON ?auto_270414 ?auto_270413 ) ( ON ?auto_270415 ?auto_270414 ) ( ON ?auto_270412 ?auto_270415 ) ( ON ?auto_270416 ?auto_270412 ) ( ON ?auto_270418 ?auto_270416 ) ( not ( = ?auto_270413 ?auto_270414 ) ) ( not ( = ?auto_270413 ?auto_270415 ) ) ( not ( = ?auto_270413 ?auto_270412 ) ) ( not ( = ?auto_270413 ?auto_270416 ) ) ( not ( = ?auto_270413 ?auto_270418 ) ) ( not ( = ?auto_270413 ?auto_270417 ) ) ( not ( = ?auto_270413 ?auto_270419 ) ) ( not ( = ?auto_270414 ?auto_270415 ) ) ( not ( = ?auto_270414 ?auto_270412 ) ) ( not ( = ?auto_270414 ?auto_270416 ) ) ( not ( = ?auto_270414 ?auto_270418 ) ) ( not ( = ?auto_270414 ?auto_270417 ) ) ( not ( = ?auto_270414 ?auto_270419 ) ) ( not ( = ?auto_270415 ?auto_270412 ) ) ( not ( = ?auto_270415 ?auto_270416 ) ) ( not ( = ?auto_270415 ?auto_270418 ) ) ( not ( = ?auto_270415 ?auto_270417 ) ) ( not ( = ?auto_270415 ?auto_270419 ) ) ( not ( = ?auto_270412 ?auto_270416 ) ) ( not ( = ?auto_270412 ?auto_270418 ) ) ( not ( = ?auto_270412 ?auto_270417 ) ) ( not ( = ?auto_270412 ?auto_270419 ) ) ( not ( = ?auto_270416 ?auto_270418 ) ) ( not ( = ?auto_270416 ?auto_270417 ) ) ( not ( = ?auto_270416 ?auto_270419 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_270418 ?auto_270417 ?auto_270419 )
      ( MAKE-7CRATE-VERIFY ?auto_270413 ?auto_270414 ?auto_270415 ?auto_270412 ?auto_270416 ?auto_270418 ?auto_270417 ?auto_270419 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_270483 - SURFACE
      ?auto_270484 - SURFACE
      ?auto_270485 - SURFACE
      ?auto_270482 - SURFACE
      ?auto_270486 - SURFACE
      ?auto_270488 - SURFACE
      ?auto_270487 - SURFACE
      ?auto_270489 - SURFACE
    )
    :vars
    (
      ?auto_270491 - HOIST
      ?auto_270493 - PLACE
      ?auto_270490 - TRUCK
      ?auto_270494 - PLACE
      ?auto_270492 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_270491 ?auto_270493 ) ( SURFACE-AT ?auto_270487 ?auto_270493 ) ( CLEAR ?auto_270487 ) ( IS-CRATE ?auto_270489 ) ( not ( = ?auto_270487 ?auto_270489 ) ) ( AVAILABLE ?auto_270491 ) ( ON ?auto_270487 ?auto_270488 ) ( not ( = ?auto_270488 ?auto_270487 ) ) ( not ( = ?auto_270488 ?auto_270489 ) ) ( TRUCK-AT ?auto_270490 ?auto_270494 ) ( not ( = ?auto_270494 ?auto_270493 ) ) ( HOIST-AT ?auto_270492 ?auto_270494 ) ( LIFTING ?auto_270492 ?auto_270489 ) ( not ( = ?auto_270491 ?auto_270492 ) ) ( ON ?auto_270484 ?auto_270483 ) ( ON ?auto_270485 ?auto_270484 ) ( ON ?auto_270482 ?auto_270485 ) ( ON ?auto_270486 ?auto_270482 ) ( ON ?auto_270488 ?auto_270486 ) ( not ( = ?auto_270483 ?auto_270484 ) ) ( not ( = ?auto_270483 ?auto_270485 ) ) ( not ( = ?auto_270483 ?auto_270482 ) ) ( not ( = ?auto_270483 ?auto_270486 ) ) ( not ( = ?auto_270483 ?auto_270488 ) ) ( not ( = ?auto_270483 ?auto_270487 ) ) ( not ( = ?auto_270483 ?auto_270489 ) ) ( not ( = ?auto_270484 ?auto_270485 ) ) ( not ( = ?auto_270484 ?auto_270482 ) ) ( not ( = ?auto_270484 ?auto_270486 ) ) ( not ( = ?auto_270484 ?auto_270488 ) ) ( not ( = ?auto_270484 ?auto_270487 ) ) ( not ( = ?auto_270484 ?auto_270489 ) ) ( not ( = ?auto_270485 ?auto_270482 ) ) ( not ( = ?auto_270485 ?auto_270486 ) ) ( not ( = ?auto_270485 ?auto_270488 ) ) ( not ( = ?auto_270485 ?auto_270487 ) ) ( not ( = ?auto_270485 ?auto_270489 ) ) ( not ( = ?auto_270482 ?auto_270486 ) ) ( not ( = ?auto_270482 ?auto_270488 ) ) ( not ( = ?auto_270482 ?auto_270487 ) ) ( not ( = ?auto_270482 ?auto_270489 ) ) ( not ( = ?auto_270486 ?auto_270488 ) ) ( not ( = ?auto_270486 ?auto_270487 ) ) ( not ( = ?auto_270486 ?auto_270489 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_270488 ?auto_270487 ?auto_270489 )
      ( MAKE-7CRATE-VERIFY ?auto_270483 ?auto_270484 ?auto_270485 ?auto_270482 ?auto_270486 ?auto_270488 ?auto_270487 ?auto_270489 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_270560 - SURFACE
      ?auto_270561 - SURFACE
      ?auto_270562 - SURFACE
      ?auto_270559 - SURFACE
      ?auto_270563 - SURFACE
      ?auto_270565 - SURFACE
      ?auto_270564 - SURFACE
      ?auto_270566 - SURFACE
    )
    :vars
    (
      ?auto_270569 - HOIST
      ?auto_270568 - PLACE
      ?auto_270570 - TRUCK
      ?auto_270572 - PLACE
      ?auto_270571 - HOIST
      ?auto_270567 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_270569 ?auto_270568 ) ( SURFACE-AT ?auto_270564 ?auto_270568 ) ( CLEAR ?auto_270564 ) ( IS-CRATE ?auto_270566 ) ( not ( = ?auto_270564 ?auto_270566 ) ) ( AVAILABLE ?auto_270569 ) ( ON ?auto_270564 ?auto_270565 ) ( not ( = ?auto_270565 ?auto_270564 ) ) ( not ( = ?auto_270565 ?auto_270566 ) ) ( TRUCK-AT ?auto_270570 ?auto_270572 ) ( not ( = ?auto_270572 ?auto_270568 ) ) ( HOIST-AT ?auto_270571 ?auto_270572 ) ( not ( = ?auto_270569 ?auto_270571 ) ) ( AVAILABLE ?auto_270571 ) ( SURFACE-AT ?auto_270566 ?auto_270572 ) ( ON ?auto_270566 ?auto_270567 ) ( CLEAR ?auto_270566 ) ( not ( = ?auto_270564 ?auto_270567 ) ) ( not ( = ?auto_270566 ?auto_270567 ) ) ( not ( = ?auto_270565 ?auto_270567 ) ) ( ON ?auto_270561 ?auto_270560 ) ( ON ?auto_270562 ?auto_270561 ) ( ON ?auto_270559 ?auto_270562 ) ( ON ?auto_270563 ?auto_270559 ) ( ON ?auto_270565 ?auto_270563 ) ( not ( = ?auto_270560 ?auto_270561 ) ) ( not ( = ?auto_270560 ?auto_270562 ) ) ( not ( = ?auto_270560 ?auto_270559 ) ) ( not ( = ?auto_270560 ?auto_270563 ) ) ( not ( = ?auto_270560 ?auto_270565 ) ) ( not ( = ?auto_270560 ?auto_270564 ) ) ( not ( = ?auto_270560 ?auto_270566 ) ) ( not ( = ?auto_270560 ?auto_270567 ) ) ( not ( = ?auto_270561 ?auto_270562 ) ) ( not ( = ?auto_270561 ?auto_270559 ) ) ( not ( = ?auto_270561 ?auto_270563 ) ) ( not ( = ?auto_270561 ?auto_270565 ) ) ( not ( = ?auto_270561 ?auto_270564 ) ) ( not ( = ?auto_270561 ?auto_270566 ) ) ( not ( = ?auto_270561 ?auto_270567 ) ) ( not ( = ?auto_270562 ?auto_270559 ) ) ( not ( = ?auto_270562 ?auto_270563 ) ) ( not ( = ?auto_270562 ?auto_270565 ) ) ( not ( = ?auto_270562 ?auto_270564 ) ) ( not ( = ?auto_270562 ?auto_270566 ) ) ( not ( = ?auto_270562 ?auto_270567 ) ) ( not ( = ?auto_270559 ?auto_270563 ) ) ( not ( = ?auto_270559 ?auto_270565 ) ) ( not ( = ?auto_270559 ?auto_270564 ) ) ( not ( = ?auto_270559 ?auto_270566 ) ) ( not ( = ?auto_270559 ?auto_270567 ) ) ( not ( = ?auto_270563 ?auto_270565 ) ) ( not ( = ?auto_270563 ?auto_270564 ) ) ( not ( = ?auto_270563 ?auto_270566 ) ) ( not ( = ?auto_270563 ?auto_270567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_270565 ?auto_270564 ?auto_270566 )
      ( MAKE-7CRATE-VERIFY ?auto_270560 ?auto_270561 ?auto_270562 ?auto_270559 ?auto_270563 ?auto_270565 ?auto_270564 ?auto_270566 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_270638 - SURFACE
      ?auto_270639 - SURFACE
      ?auto_270640 - SURFACE
      ?auto_270637 - SURFACE
      ?auto_270641 - SURFACE
      ?auto_270643 - SURFACE
      ?auto_270642 - SURFACE
      ?auto_270644 - SURFACE
    )
    :vars
    (
      ?auto_270646 - HOIST
      ?auto_270645 - PLACE
      ?auto_270647 - PLACE
      ?auto_270648 - HOIST
      ?auto_270649 - SURFACE
      ?auto_270650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_270646 ?auto_270645 ) ( SURFACE-AT ?auto_270642 ?auto_270645 ) ( CLEAR ?auto_270642 ) ( IS-CRATE ?auto_270644 ) ( not ( = ?auto_270642 ?auto_270644 ) ) ( AVAILABLE ?auto_270646 ) ( ON ?auto_270642 ?auto_270643 ) ( not ( = ?auto_270643 ?auto_270642 ) ) ( not ( = ?auto_270643 ?auto_270644 ) ) ( not ( = ?auto_270647 ?auto_270645 ) ) ( HOIST-AT ?auto_270648 ?auto_270647 ) ( not ( = ?auto_270646 ?auto_270648 ) ) ( AVAILABLE ?auto_270648 ) ( SURFACE-AT ?auto_270644 ?auto_270647 ) ( ON ?auto_270644 ?auto_270649 ) ( CLEAR ?auto_270644 ) ( not ( = ?auto_270642 ?auto_270649 ) ) ( not ( = ?auto_270644 ?auto_270649 ) ) ( not ( = ?auto_270643 ?auto_270649 ) ) ( TRUCK-AT ?auto_270650 ?auto_270645 ) ( ON ?auto_270639 ?auto_270638 ) ( ON ?auto_270640 ?auto_270639 ) ( ON ?auto_270637 ?auto_270640 ) ( ON ?auto_270641 ?auto_270637 ) ( ON ?auto_270643 ?auto_270641 ) ( not ( = ?auto_270638 ?auto_270639 ) ) ( not ( = ?auto_270638 ?auto_270640 ) ) ( not ( = ?auto_270638 ?auto_270637 ) ) ( not ( = ?auto_270638 ?auto_270641 ) ) ( not ( = ?auto_270638 ?auto_270643 ) ) ( not ( = ?auto_270638 ?auto_270642 ) ) ( not ( = ?auto_270638 ?auto_270644 ) ) ( not ( = ?auto_270638 ?auto_270649 ) ) ( not ( = ?auto_270639 ?auto_270640 ) ) ( not ( = ?auto_270639 ?auto_270637 ) ) ( not ( = ?auto_270639 ?auto_270641 ) ) ( not ( = ?auto_270639 ?auto_270643 ) ) ( not ( = ?auto_270639 ?auto_270642 ) ) ( not ( = ?auto_270639 ?auto_270644 ) ) ( not ( = ?auto_270639 ?auto_270649 ) ) ( not ( = ?auto_270640 ?auto_270637 ) ) ( not ( = ?auto_270640 ?auto_270641 ) ) ( not ( = ?auto_270640 ?auto_270643 ) ) ( not ( = ?auto_270640 ?auto_270642 ) ) ( not ( = ?auto_270640 ?auto_270644 ) ) ( not ( = ?auto_270640 ?auto_270649 ) ) ( not ( = ?auto_270637 ?auto_270641 ) ) ( not ( = ?auto_270637 ?auto_270643 ) ) ( not ( = ?auto_270637 ?auto_270642 ) ) ( not ( = ?auto_270637 ?auto_270644 ) ) ( not ( = ?auto_270637 ?auto_270649 ) ) ( not ( = ?auto_270641 ?auto_270643 ) ) ( not ( = ?auto_270641 ?auto_270642 ) ) ( not ( = ?auto_270641 ?auto_270644 ) ) ( not ( = ?auto_270641 ?auto_270649 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_270643 ?auto_270642 ?auto_270644 )
      ( MAKE-7CRATE-VERIFY ?auto_270638 ?auto_270639 ?auto_270640 ?auto_270637 ?auto_270641 ?auto_270643 ?auto_270642 ?auto_270644 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_270716 - SURFACE
      ?auto_270717 - SURFACE
      ?auto_270718 - SURFACE
      ?auto_270715 - SURFACE
      ?auto_270719 - SURFACE
      ?auto_270721 - SURFACE
      ?auto_270720 - SURFACE
      ?auto_270722 - SURFACE
    )
    :vars
    (
      ?auto_270727 - HOIST
      ?auto_270726 - PLACE
      ?auto_270724 - PLACE
      ?auto_270725 - HOIST
      ?auto_270728 - SURFACE
      ?auto_270723 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_270727 ?auto_270726 ) ( IS-CRATE ?auto_270722 ) ( not ( = ?auto_270720 ?auto_270722 ) ) ( not ( = ?auto_270721 ?auto_270720 ) ) ( not ( = ?auto_270721 ?auto_270722 ) ) ( not ( = ?auto_270724 ?auto_270726 ) ) ( HOIST-AT ?auto_270725 ?auto_270724 ) ( not ( = ?auto_270727 ?auto_270725 ) ) ( AVAILABLE ?auto_270725 ) ( SURFACE-AT ?auto_270722 ?auto_270724 ) ( ON ?auto_270722 ?auto_270728 ) ( CLEAR ?auto_270722 ) ( not ( = ?auto_270720 ?auto_270728 ) ) ( not ( = ?auto_270722 ?auto_270728 ) ) ( not ( = ?auto_270721 ?auto_270728 ) ) ( TRUCK-AT ?auto_270723 ?auto_270726 ) ( SURFACE-AT ?auto_270721 ?auto_270726 ) ( CLEAR ?auto_270721 ) ( LIFTING ?auto_270727 ?auto_270720 ) ( IS-CRATE ?auto_270720 ) ( ON ?auto_270717 ?auto_270716 ) ( ON ?auto_270718 ?auto_270717 ) ( ON ?auto_270715 ?auto_270718 ) ( ON ?auto_270719 ?auto_270715 ) ( ON ?auto_270721 ?auto_270719 ) ( not ( = ?auto_270716 ?auto_270717 ) ) ( not ( = ?auto_270716 ?auto_270718 ) ) ( not ( = ?auto_270716 ?auto_270715 ) ) ( not ( = ?auto_270716 ?auto_270719 ) ) ( not ( = ?auto_270716 ?auto_270721 ) ) ( not ( = ?auto_270716 ?auto_270720 ) ) ( not ( = ?auto_270716 ?auto_270722 ) ) ( not ( = ?auto_270716 ?auto_270728 ) ) ( not ( = ?auto_270717 ?auto_270718 ) ) ( not ( = ?auto_270717 ?auto_270715 ) ) ( not ( = ?auto_270717 ?auto_270719 ) ) ( not ( = ?auto_270717 ?auto_270721 ) ) ( not ( = ?auto_270717 ?auto_270720 ) ) ( not ( = ?auto_270717 ?auto_270722 ) ) ( not ( = ?auto_270717 ?auto_270728 ) ) ( not ( = ?auto_270718 ?auto_270715 ) ) ( not ( = ?auto_270718 ?auto_270719 ) ) ( not ( = ?auto_270718 ?auto_270721 ) ) ( not ( = ?auto_270718 ?auto_270720 ) ) ( not ( = ?auto_270718 ?auto_270722 ) ) ( not ( = ?auto_270718 ?auto_270728 ) ) ( not ( = ?auto_270715 ?auto_270719 ) ) ( not ( = ?auto_270715 ?auto_270721 ) ) ( not ( = ?auto_270715 ?auto_270720 ) ) ( not ( = ?auto_270715 ?auto_270722 ) ) ( not ( = ?auto_270715 ?auto_270728 ) ) ( not ( = ?auto_270719 ?auto_270721 ) ) ( not ( = ?auto_270719 ?auto_270720 ) ) ( not ( = ?auto_270719 ?auto_270722 ) ) ( not ( = ?auto_270719 ?auto_270728 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_270721 ?auto_270720 ?auto_270722 )
      ( MAKE-7CRATE-VERIFY ?auto_270716 ?auto_270717 ?auto_270718 ?auto_270715 ?auto_270719 ?auto_270721 ?auto_270720 ?auto_270722 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_270794 - SURFACE
      ?auto_270795 - SURFACE
      ?auto_270796 - SURFACE
      ?auto_270793 - SURFACE
      ?auto_270797 - SURFACE
      ?auto_270799 - SURFACE
      ?auto_270798 - SURFACE
      ?auto_270800 - SURFACE
    )
    :vars
    (
      ?auto_270805 - HOIST
      ?auto_270806 - PLACE
      ?auto_270804 - PLACE
      ?auto_270803 - HOIST
      ?auto_270801 - SURFACE
      ?auto_270802 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_270805 ?auto_270806 ) ( IS-CRATE ?auto_270800 ) ( not ( = ?auto_270798 ?auto_270800 ) ) ( not ( = ?auto_270799 ?auto_270798 ) ) ( not ( = ?auto_270799 ?auto_270800 ) ) ( not ( = ?auto_270804 ?auto_270806 ) ) ( HOIST-AT ?auto_270803 ?auto_270804 ) ( not ( = ?auto_270805 ?auto_270803 ) ) ( AVAILABLE ?auto_270803 ) ( SURFACE-AT ?auto_270800 ?auto_270804 ) ( ON ?auto_270800 ?auto_270801 ) ( CLEAR ?auto_270800 ) ( not ( = ?auto_270798 ?auto_270801 ) ) ( not ( = ?auto_270800 ?auto_270801 ) ) ( not ( = ?auto_270799 ?auto_270801 ) ) ( TRUCK-AT ?auto_270802 ?auto_270806 ) ( SURFACE-AT ?auto_270799 ?auto_270806 ) ( CLEAR ?auto_270799 ) ( IS-CRATE ?auto_270798 ) ( AVAILABLE ?auto_270805 ) ( IN ?auto_270798 ?auto_270802 ) ( ON ?auto_270795 ?auto_270794 ) ( ON ?auto_270796 ?auto_270795 ) ( ON ?auto_270793 ?auto_270796 ) ( ON ?auto_270797 ?auto_270793 ) ( ON ?auto_270799 ?auto_270797 ) ( not ( = ?auto_270794 ?auto_270795 ) ) ( not ( = ?auto_270794 ?auto_270796 ) ) ( not ( = ?auto_270794 ?auto_270793 ) ) ( not ( = ?auto_270794 ?auto_270797 ) ) ( not ( = ?auto_270794 ?auto_270799 ) ) ( not ( = ?auto_270794 ?auto_270798 ) ) ( not ( = ?auto_270794 ?auto_270800 ) ) ( not ( = ?auto_270794 ?auto_270801 ) ) ( not ( = ?auto_270795 ?auto_270796 ) ) ( not ( = ?auto_270795 ?auto_270793 ) ) ( not ( = ?auto_270795 ?auto_270797 ) ) ( not ( = ?auto_270795 ?auto_270799 ) ) ( not ( = ?auto_270795 ?auto_270798 ) ) ( not ( = ?auto_270795 ?auto_270800 ) ) ( not ( = ?auto_270795 ?auto_270801 ) ) ( not ( = ?auto_270796 ?auto_270793 ) ) ( not ( = ?auto_270796 ?auto_270797 ) ) ( not ( = ?auto_270796 ?auto_270799 ) ) ( not ( = ?auto_270796 ?auto_270798 ) ) ( not ( = ?auto_270796 ?auto_270800 ) ) ( not ( = ?auto_270796 ?auto_270801 ) ) ( not ( = ?auto_270793 ?auto_270797 ) ) ( not ( = ?auto_270793 ?auto_270799 ) ) ( not ( = ?auto_270793 ?auto_270798 ) ) ( not ( = ?auto_270793 ?auto_270800 ) ) ( not ( = ?auto_270793 ?auto_270801 ) ) ( not ( = ?auto_270797 ?auto_270799 ) ) ( not ( = ?auto_270797 ?auto_270798 ) ) ( not ( = ?auto_270797 ?auto_270800 ) ) ( not ( = ?auto_270797 ?auto_270801 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_270799 ?auto_270798 ?auto_270800 )
      ( MAKE-7CRATE-VERIFY ?auto_270794 ?auto_270795 ?auto_270796 ?auto_270793 ?auto_270797 ?auto_270799 ?auto_270798 ?auto_270800 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_273704 - SURFACE
      ?auto_273705 - SURFACE
      ?auto_273706 - SURFACE
      ?auto_273703 - SURFACE
      ?auto_273707 - SURFACE
      ?auto_273709 - SURFACE
      ?auto_273708 - SURFACE
      ?auto_273710 - SURFACE
      ?auto_273711 - SURFACE
    )
    :vars
    (
      ?auto_273712 - HOIST
      ?auto_273713 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_273712 ?auto_273713 ) ( SURFACE-AT ?auto_273710 ?auto_273713 ) ( CLEAR ?auto_273710 ) ( LIFTING ?auto_273712 ?auto_273711 ) ( IS-CRATE ?auto_273711 ) ( not ( = ?auto_273710 ?auto_273711 ) ) ( ON ?auto_273705 ?auto_273704 ) ( ON ?auto_273706 ?auto_273705 ) ( ON ?auto_273703 ?auto_273706 ) ( ON ?auto_273707 ?auto_273703 ) ( ON ?auto_273709 ?auto_273707 ) ( ON ?auto_273708 ?auto_273709 ) ( ON ?auto_273710 ?auto_273708 ) ( not ( = ?auto_273704 ?auto_273705 ) ) ( not ( = ?auto_273704 ?auto_273706 ) ) ( not ( = ?auto_273704 ?auto_273703 ) ) ( not ( = ?auto_273704 ?auto_273707 ) ) ( not ( = ?auto_273704 ?auto_273709 ) ) ( not ( = ?auto_273704 ?auto_273708 ) ) ( not ( = ?auto_273704 ?auto_273710 ) ) ( not ( = ?auto_273704 ?auto_273711 ) ) ( not ( = ?auto_273705 ?auto_273706 ) ) ( not ( = ?auto_273705 ?auto_273703 ) ) ( not ( = ?auto_273705 ?auto_273707 ) ) ( not ( = ?auto_273705 ?auto_273709 ) ) ( not ( = ?auto_273705 ?auto_273708 ) ) ( not ( = ?auto_273705 ?auto_273710 ) ) ( not ( = ?auto_273705 ?auto_273711 ) ) ( not ( = ?auto_273706 ?auto_273703 ) ) ( not ( = ?auto_273706 ?auto_273707 ) ) ( not ( = ?auto_273706 ?auto_273709 ) ) ( not ( = ?auto_273706 ?auto_273708 ) ) ( not ( = ?auto_273706 ?auto_273710 ) ) ( not ( = ?auto_273706 ?auto_273711 ) ) ( not ( = ?auto_273703 ?auto_273707 ) ) ( not ( = ?auto_273703 ?auto_273709 ) ) ( not ( = ?auto_273703 ?auto_273708 ) ) ( not ( = ?auto_273703 ?auto_273710 ) ) ( not ( = ?auto_273703 ?auto_273711 ) ) ( not ( = ?auto_273707 ?auto_273709 ) ) ( not ( = ?auto_273707 ?auto_273708 ) ) ( not ( = ?auto_273707 ?auto_273710 ) ) ( not ( = ?auto_273707 ?auto_273711 ) ) ( not ( = ?auto_273709 ?auto_273708 ) ) ( not ( = ?auto_273709 ?auto_273710 ) ) ( not ( = ?auto_273709 ?auto_273711 ) ) ( not ( = ?auto_273708 ?auto_273710 ) ) ( not ( = ?auto_273708 ?auto_273711 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_273710 ?auto_273711 )
      ( MAKE-8CRATE-VERIFY ?auto_273704 ?auto_273705 ?auto_273706 ?auto_273703 ?auto_273707 ?auto_273709 ?auto_273708 ?auto_273710 ?auto_273711 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_273771 - SURFACE
      ?auto_273772 - SURFACE
      ?auto_273773 - SURFACE
      ?auto_273770 - SURFACE
      ?auto_273774 - SURFACE
      ?auto_273776 - SURFACE
      ?auto_273775 - SURFACE
      ?auto_273777 - SURFACE
      ?auto_273778 - SURFACE
    )
    :vars
    (
      ?auto_273780 - HOIST
      ?auto_273779 - PLACE
      ?auto_273781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_273780 ?auto_273779 ) ( SURFACE-AT ?auto_273777 ?auto_273779 ) ( CLEAR ?auto_273777 ) ( IS-CRATE ?auto_273778 ) ( not ( = ?auto_273777 ?auto_273778 ) ) ( TRUCK-AT ?auto_273781 ?auto_273779 ) ( AVAILABLE ?auto_273780 ) ( IN ?auto_273778 ?auto_273781 ) ( ON ?auto_273777 ?auto_273775 ) ( not ( = ?auto_273775 ?auto_273777 ) ) ( not ( = ?auto_273775 ?auto_273778 ) ) ( ON ?auto_273772 ?auto_273771 ) ( ON ?auto_273773 ?auto_273772 ) ( ON ?auto_273770 ?auto_273773 ) ( ON ?auto_273774 ?auto_273770 ) ( ON ?auto_273776 ?auto_273774 ) ( ON ?auto_273775 ?auto_273776 ) ( not ( = ?auto_273771 ?auto_273772 ) ) ( not ( = ?auto_273771 ?auto_273773 ) ) ( not ( = ?auto_273771 ?auto_273770 ) ) ( not ( = ?auto_273771 ?auto_273774 ) ) ( not ( = ?auto_273771 ?auto_273776 ) ) ( not ( = ?auto_273771 ?auto_273775 ) ) ( not ( = ?auto_273771 ?auto_273777 ) ) ( not ( = ?auto_273771 ?auto_273778 ) ) ( not ( = ?auto_273772 ?auto_273773 ) ) ( not ( = ?auto_273772 ?auto_273770 ) ) ( not ( = ?auto_273772 ?auto_273774 ) ) ( not ( = ?auto_273772 ?auto_273776 ) ) ( not ( = ?auto_273772 ?auto_273775 ) ) ( not ( = ?auto_273772 ?auto_273777 ) ) ( not ( = ?auto_273772 ?auto_273778 ) ) ( not ( = ?auto_273773 ?auto_273770 ) ) ( not ( = ?auto_273773 ?auto_273774 ) ) ( not ( = ?auto_273773 ?auto_273776 ) ) ( not ( = ?auto_273773 ?auto_273775 ) ) ( not ( = ?auto_273773 ?auto_273777 ) ) ( not ( = ?auto_273773 ?auto_273778 ) ) ( not ( = ?auto_273770 ?auto_273774 ) ) ( not ( = ?auto_273770 ?auto_273776 ) ) ( not ( = ?auto_273770 ?auto_273775 ) ) ( not ( = ?auto_273770 ?auto_273777 ) ) ( not ( = ?auto_273770 ?auto_273778 ) ) ( not ( = ?auto_273774 ?auto_273776 ) ) ( not ( = ?auto_273774 ?auto_273775 ) ) ( not ( = ?auto_273774 ?auto_273777 ) ) ( not ( = ?auto_273774 ?auto_273778 ) ) ( not ( = ?auto_273776 ?auto_273775 ) ) ( not ( = ?auto_273776 ?auto_273777 ) ) ( not ( = ?auto_273776 ?auto_273778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_273775 ?auto_273777 ?auto_273778 )
      ( MAKE-8CRATE-VERIFY ?auto_273771 ?auto_273772 ?auto_273773 ?auto_273770 ?auto_273774 ?auto_273776 ?auto_273775 ?auto_273777 ?auto_273778 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_273847 - SURFACE
      ?auto_273848 - SURFACE
      ?auto_273849 - SURFACE
      ?auto_273846 - SURFACE
      ?auto_273850 - SURFACE
      ?auto_273852 - SURFACE
      ?auto_273851 - SURFACE
      ?auto_273853 - SURFACE
      ?auto_273854 - SURFACE
    )
    :vars
    (
      ?auto_273858 - HOIST
      ?auto_273856 - PLACE
      ?auto_273857 - TRUCK
      ?auto_273855 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_273858 ?auto_273856 ) ( SURFACE-AT ?auto_273853 ?auto_273856 ) ( CLEAR ?auto_273853 ) ( IS-CRATE ?auto_273854 ) ( not ( = ?auto_273853 ?auto_273854 ) ) ( AVAILABLE ?auto_273858 ) ( IN ?auto_273854 ?auto_273857 ) ( ON ?auto_273853 ?auto_273851 ) ( not ( = ?auto_273851 ?auto_273853 ) ) ( not ( = ?auto_273851 ?auto_273854 ) ) ( TRUCK-AT ?auto_273857 ?auto_273855 ) ( not ( = ?auto_273855 ?auto_273856 ) ) ( ON ?auto_273848 ?auto_273847 ) ( ON ?auto_273849 ?auto_273848 ) ( ON ?auto_273846 ?auto_273849 ) ( ON ?auto_273850 ?auto_273846 ) ( ON ?auto_273852 ?auto_273850 ) ( ON ?auto_273851 ?auto_273852 ) ( not ( = ?auto_273847 ?auto_273848 ) ) ( not ( = ?auto_273847 ?auto_273849 ) ) ( not ( = ?auto_273847 ?auto_273846 ) ) ( not ( = ?auto_273847 ?auto_273850 ) ) ( not ( = ?auto_273847 ?auto_273852 ) ) ( not ( = ?auto_273847 ?auto_273851 ) ) ( not ( = ?auto_273847 ?auto_273853 ) ) ( not ( = ?auto_273847 ?auto_273854 ) ) ( not ( = ?auto_273848 ?auto_273849 ) ) ( not ( = ?auto_273848 ?auto_273846 ) ) ( not ( = ?auto_273848 ?auto_273850 ) ) ( not ( = ?auto_273848 ?auto_273852 ) ) ( not ( = ?auto_273848 ?auto_273851 ) ) ( not ( = ?auto_273848 ?auto_273853 ) ) ( not ( = ?auto_273848 ?auto_273854 ) ) ( not ( = ?auto_273849 ?auto_273846 ) ) ( not ( = ?auto_273849 ?auto_273850 ) ) ( not ( = ?auto_273849 ?auto_273852 ) ) ( not ( = ?auto_273849 ?auto_273851 ) ) ( not ( = ?auto_273849 ?auto_273853 ) ) ( not ( = ?auto_273849 ?auto_273854 ) ) ( not ( = ?auto_273846 ?auto_273850 ) ) ( not ( = ?auto_273846 ?auto_273852 ) ) ( not ( = ?auto_273846 ?auto_273851 ) ) ( not ( = ?auto_273846 ?auto_273853 ) ) ( not ( = ?auto_273846 ?auto_273854 ) ) ( not ( = ?auto_273850 ?auto_273852 ) ) ( not ( = ?auto_273850 ?auto_273851 ) ) ( not ( = ?auto_273850 ?auto_273853 ) ) ( not ( = ?auto_273850 ?auto_273854 ) ) ( not ( = ?auto_273852 ?auto_273851 ) ) ( not ( = ?auto_273852 ?auto_273853 ) ) ( not ( = ?auto_273852 ?auto_273854 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_273851 ?auto_273853 ?auto_273854 )
      ( MAKE-8CRATE-VERIFY ?auto_273847 ?auto_273848 ?auto_273849 ?auto_273846 ?auto_273850 ?auto_273852 ?auto_273851 ?auto_273853 ?auto_273854 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_273931 - SURFACE
      ?auto_273932 - SURFACE
      ?auto_273933 - SURFACE
      ?auto_273930 - SURFACE
      ?auto_273934 - SURFACE
      ?auto_273936 - SURFACE
      ?auto_273935 - SURFACE
      ?auto_273937 - SURFACE
      ?auto_273938 - SURFACE
    )
    :vars
    (
      ?auto_273939 - HOIST
      ?auto_273940 - PLACE
      ?auto_273941 - TRUCK
      ?auto_273942 - PLACE
      ?auto_273943 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_273939 ?auto_273940 ) ( SURFACE-AT ?auto_273937 ?auto_273940 ) ( CLEAR ?auto_273937 ) ( IS-CRATE ?auto_273938 ) ( not ( = ?auto_273937 ?auto_273938 ) ) ( AVAILABLE ?auto_273939 ) ( ON ?auto_273937 ?auto_273935 ) ( not ( = ?auto_273935 ?auto_273937 ) ) ( not ( = ?auto_273935 ?auto_273938 ) ) ( TRUCK-AT ?auto_273941 ?auto_273942 ) ( not ( = ?auto_273942 ?auto_273940 ) ) ( HOIST-AT ?auto_273943 ?auto_273942 ) ( LIFTING ?auto_273943 ?auto_273938 ) ( not ( = ?auto_273939 ?auto_273943 ) ) ( ON ?auto_273932 ?auto_273931 ) ( ON ?auto_273933 ?auto_273932 ) ( ON ?auto_273930 ?auto_273933 ) ( ON ?auto_273934 ?auto_273930 ) ( ON ?auto_273936 ?auto_273934 ) ( ON ?auto_273935 ?auto_273936 ) ( not ( = ?auto_273931 ?auto_273932 ) ) ( not ( = ?auto_273931 ?auto_273933 ) ) ( not ( = ?auto_273931 ?auto_273930 ) ) ( not ( = ?auto_273931 ?auto_273934 ) ) ( not ( = ?auto_273931 ?auto_273936 ) ) ( not ( = ?auto_273931 ?auto_273935 ) ) ( not ( = ?auto_273931 ?auto_273937 ) ) ( not ( = ?auto_273931 ?auto_273938 ) ) ( not ( = ?auto_273932 ?auto_273933 ) ) ( not ( = ?auto_273932 ?auto_273930 ) ) ( not ( = ?auto_273932 ?auto_273934 ) ) ( not ( = ?auto_273932 ?auto_273936 ) ) ( not ( = ?auto_273932 ?auto_273935 ) ) ( not ( = ?auto_273932 ?auto_273937 ) ) ( not ( = ?auto_273932 ?auto_273938 ) ) ( not ( = ?auto_273933 ?auto_273930 ) ) ( not ( = ?auto_273933 ?auto_273934 ) ) ( not ( = ?auto_273933 ?auto_273936 ) ) ( not ( = ?auto_273933 ?auto_273935 ) ) ( not ( = ?auto_273933 ?auto_273937 ) ) ( not ( = ?auto_273933 ?auto_273938 ) ) ( not ( = ?auto_273930 ?auto_273934 ) ) ( not ( = ?auto_273930 ?auto_273936 ) ) ( not ( = ?auto_273930 ?auto_273935 ) ) ( not ( = ?auto_273930 ?auto_273937 ) ) ( not ( = ?auto_273930 ?auto_273938 ) ) ( not ( = ?auto_273934 ?auto_273936 ) ) ( not ( = ?auto_273934 ?auto_273935 ) ) ( not ( = ?auto_273934 ?auto_273937 ) ) ( not ( = ?auto_273934 ?auto_273938 ) ) ( not ( = ?auto_273936 ?auto_273935 ) ) ( not ( = ?auto_273936 ?auto_273937 ) ) ( not ( = ?auto_273936 ?auto_273938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_273935 ?auto_273937 ?auto_273938 )
      ( MAKE-8CRATE-VERIFY ?auto_273931 ?auto_273932 ?auto_273933 ?auto_273930 ?auto_273934 ?auto_273936 ?auto_273935 ?auto_273937 ?auto_273938 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_274023 - SURFACE
      ?auto_274024 - SURFACE
      ?auto_274025 - SURFACE
      ?auto_274022 - SURFACE
      ?auto_274026 - SURFACE
      ?auto_274028 - SURFACE
      ?auto_274027 - SURFACE
      ?auto_274029 - SURFACE
      ?auto_274030 - SURFACE
    )
    :vars
    (
      ?auto_274031 - HOIST
      ?auto_274035 - PLACE
      ?auto_274034 - TRUCK
      ?auto_274033 - PLACE
      ?auto_274032 - HOIST
      ?auto_274036 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_274031 ?auto_274035 ) ( SURFACE-AT ?auto_274029 ?auto_274035 ) ( CLEAR ?auto_274029 ) ( IS-CRATE ?auto_274030 ) ( not ( = ?auto_274029 ?auto_274030 ) ) ( AVAILABLE ?auto_274031 ) ( ON ?auto_274029 ?auto_274027 ) ( not ( = ?auto_274027 ?auto_274029 ) ) ( not ( = ?auto_274027 ?auto_274030 ) ) ( TRUCK-AT ?auto_274034 ?auto_274033 ) ( not ( = ?auto_274033 ?auto_274035 ) ) ( HOIST-AT ?auto_274032 ?auto_274033 ) ( not ( = ?auto_274031 ?auto_274032 ) ) ( AVAILABLE ?auto_274032 ) ( SURFACE-AT ?auto_274030 ?auto_274033 ) ( ON ?auto_274030 ?auto_274036 ) ( CLEAR ?auto_274030 ) ( not ( = ?auto_274029 ?auto_274036 ) ) ( not ( = ?auto_274030 ?auto_274036 ) ) ( not ( = ?auto_274027 ?auto_274036 ) ) ( ON ?auto_274024 ?auto_274023 ) ( ON ?auto_274025 ?auto_274024 ) ( ON ?auto_274022 ?auto_274025 ) ( ON ?auto_274026 ?auto_274022 ) ( ON ?auto_274028 ?auto_274026 ) ( ON ?auto_274027 ?auto_274028 ) ( not ( = ?auto_274023 ?auto_274024 ) ) ( not ( = ?auto_274023 ?auto_274025 ) ) ( not ( = ?auto_274023 ?auto_274022 ) ) ( not ( = ?auto_274023 ?auto_274026 ) ) ( not ( = ?auto_274023 ?auto_274028 ) ) ( not ( = ?auto_274023 ?auto_274027 ) ) ( not ( = ?auto_274023 ?auto_274029 ) ) ( not ( = ?auto_274023 ?auto_274030 ) ) ( not ( = ?auto_274023 ?auto_274036 ) ) ( not ( = ?auto_274024 ?auto_274025 ) ) ( not ( = ?auto_274024 ?auto_274022 ) ) ( not ( = ?auto_274024 ?auto_274026 ) ) ( not ( = ?auto_274024 ?auto_274028 ) ) ( not ( = ?auto_274024 ?auto_274027 ) ) ( not ( = ?auto_274024 ?auto_274029 ) ) ( not ( = ?auto_274024 ?auto_274030 ) ) ( not ( = ?auto_274024 ?auto_274036 ) ) ( not ( = ?auto_274025 ?auto_274022 ) ) ( not ( = ?auto_274025 ?auto_274026 ) ) ( not ( = ?auto_274025 ?auto_274028 ) ) ( not ( = ?auto_274025 ?auto_274027 ) ) ( not ( = ?auto_274025 ?auto_274029 ) ) ( not ( = ?auto_274025 ?auto_274030 ) ) ( not ( = ?auto_274025 ?auto_274036 ) ) ( not ( = ?auto_274022 ?auto_274026 ) ) ( not ( = ?auto_274022 ?auto_274028 ) ) ( not ( = ?auto_274022 ?auto_274027 ) ) ( not ( = ?auto_274022 ?auto_274029 ) ) ( not ( = ?auto_274022 ?auto_274030 ) ) ( not ( = ?auto_274022 ?auto_274036 ) ) ( not ( = ?auto_274026 ?auto_274028 ) ) ( not ( = ?auto_274026 ?auto_274027 ) ) ( not ( = ?auto_274026 ?auto_274029 ) ) ( not ( = ?auto_274026 ?auto_274030 ) ) ( not ( = ?auto_274026 ?auto_274036 ) ) ( not ( = ?auto_274028 ?auto_274027 ) ) ( not ( = ?auto_274028 ?auto_274029 ) ) ( not ( = ?auto_274028 ?auto_274030 ) ) ( not ( = ?auto_274028 ?auto_274036 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_274027 ?auto_274029 ?auto_274030 )
      ( MAKE-8CRATE-VERIFY ?auto_274023 ?auto_274024 ?auto_274025 ?auto_274022 ?auto_274026 ?auto_274028 ?auto_274027 ?auto_274029 ?auto_274030 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_274116 - SURFACE
      ?auto_274117 - SURFACE
      ?auto_274118 - SURFACE
      ?auto_274115 - SURFACE
      ?auto_274119 - SURFACE
      ?auto_274121 - SURFACE
      ?auto_274120 - SURFACE
      ?auto_274122 - SURFACE
      ?auto_274123 - SURFACE
    )
    :vars
    (
      ?auto_274127 - HOIST
      ?auto_274124 - PLACE
      ?auto_274125 - PLACE
      ?auto_274128 - HOIST
      ?auto_274129 - SURFACE
      ?auto_274126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_274127 ?auto_274124 ) ( SURFACE-AT ?auto_274122 ?auto_274124 ) ( CLEAR ?auto_274122 ) ( IS-CRATE ?auto_274123 ) ( not ( = ?auto_274122 ?auto_274123 ) ) ( AVAILABLE ?auto_274127 ) ( ON ?auto_274122 ?auto_274120 ) ( not ( = ?auto_274120 ?auto_274122 ) ) ( not ( = ?auto_274120 ?auto_274123 ) ) ( not ( = ?auto_274125 ?auto_274124 ) ) ( HOIST-AT ?auto_274128 ?auto_274125 ) ( not ( = ?auto_274127 ?auto_274128 ) ) ( AVAILABLE ?auto_274128 ) ( SURFACE-AT ?auto_274123 ?auto_274125 ) ( ON ?auto_274123 ?auto_274129 ) ( CLEAR ?auto_274123 ) ( not ( = ?auto_274122 ?auto_274129 ) ) ( not ( = ?auto_274123 ?auto_274129 ) ) ( not ( = ?auto_274120 ?auto_274129 ) ) ( TRUCK-AT ?auto_274126 ?auto_274124 ) ( ON ?auto_274117 ?auto_274116 ) ( ON ?auto_274118 ?auto_274117 ) ( ON ?auto_274115 ?auto_274118 ) ( ON ?auto_274119 ?auto_274115 ) ( ON ?auto_274121 ?auto_274119 ) ( ON ?auto_274120 ?auto_274121 ) ( not ( = ?auto_274116 ?auto_274117 ) ) ( not ( = ?auto_274116 ?auto_274118 ) ) ( not ( = ?auto_274116 ?auto_274115 ) ) ( not ( = ?auto_274116 ?auto_274119 ) ) ( not ( = ?auto_274116 ?auto_274121 ) ) ( not ( = ?auto_274116 ?auto_274120 ) ) ( not ( = ?auto_274116 ?auto_274122 ) ) ( not ( = ?auto_274116 ?auto_274123 ) ) ( not ( = ?auto_274116 ?auto_274129 ) ) ( not ( = ?auto_274117 ?auto_274118 ) ) ( not ( = ?auto_274117 ?auto_274115 ) ) ( not ( = ?auto_274117 ?auto_274119 ) ) ( not ( = ?auto_274117 ?auto_274121 ) ) ( not ( = ?auto_274117 ?auto_274120 ) ) ( not ( = ?auto_274117 ?auto_274122 ) ) ( not ( = ?auto_274117 ?auto_274123 ) ) ( not ( = ?auto_274117 ?auto_274129 ) ) ( not ( = ?auto_274118 ?auto_274115 ) ) ( not ( = ?auto_274118 ?auto_274119 ) ) ( not ( = ?auto_274118 ?auto_274121 ) ) ( not ( = ?auto_274118 ?auto_274120 ) ) ( not ( = ?auto_274118 ?auto_274122 ) ) ( not ( = ?auto_274118 ?auto_274123 ) ) ( not ( = ?auto_274118 ?auto_274129 ) ) ( not ( = ?auto_274115 ?auto_274119 ) ) ( not ( = ?auto_274115 ?auto_274121 ) ) ( not ( = ?auto_274115 ?auto_274120 ) ) ( not ( = ?auto_274115 ?auto_274122 ) ) ( not ( = ?auto_274115 ?auto_274123 ) ) ( not ( = ?auto_274115 ?auto_274129 ) ) ( not ( = ?auto_274119 ?auto_274121 ) ) ( not ( = ?auto_274119 ?auto_274120 ) ) ( not ( = ?auto_274119 ?auto_274122 ) ) ( not ( = ?auto_274119 ?auto_274123 ) ) ( not ( = ?auto_274119 ?auto_274129 ) ) ( not ( = ?auto_274121 ?auto_274120 ) ) ( not ( = ?auto_274121 ?auto_274122 ) ) ( not ( = ?auto_274121 ?auto_274123 ) ) ( not ( = ?auto_274121 ?auto_274129 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_274120 ?auto_274122 ?auto_274123 )
      ( MAKE-8CRATE-VERIFY ?auto_274116 ?auto_274117 ?auto_274118 ?auto_274115 ?auto_274119 ?auto_274121 ?auto_274120 ?auto_274122 ?auto_274123 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_274209 - SURFACE
      ?auto_274210 - SURFACE
      ?auto_274211 - SURFACE
      ?auto_274208 - SURFACE
      ?auto_274212 - SURFACE
      ?auto_274214 - SURFACE
      ?auto_274213 - SURFACE
      ?auto_274215 - SURFACE
      ?auto_274216 - SURFACE
    )
    :vars
    (
      ?auto_274221 - HOIST
      ?auto_274217 - PLACE
      ?auto_274220 - PLACE
      ?auto_274219 - HOIST
      ?auto_274222 - SURFACE
      ?auto_274218 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_274221 ?auto_274217 ) ( IS-CRATE ?auto_274216 ) ( not ( = ?auto_274215 ?auto_274216 ) ) ( not ( = ?auto_274213 ?auto_274215 ) ) ( not ( = ?auto_274213 ?auto_274216 ) ) ( not ( = ?auto_274220 ?auto_274217 ) ) ( HOIST-AT ?auto_274219 ?auto_274220 ) ( not ( = ?auto_274221 ?auto_274219 ) ) ( AVAILABLE ?auto_274219 ) ( SURFACE-AT ?auto_274216 ?auto_274220 ) ( ON ?auto_274216 ?auto_274222 ) ( CLEAR ?auto_274216 ) ( not ( = ?auto_274215 ?auto_274222 ) ) ( not ( = ?auto_274216 ?auto_274222 ) ) ( not ( = ?auto_274213 ?auto_274222 ) ) ( TRUCK-AT ?auto_274218 ?auto_274217 ) ( SURFACE-AT ?auto_274213 ?auto_274217 ) ( CLEAR ?auto_274213 ) ( LIFTING ?auto_274221 ?auto_274215 ) ( IS-CRATE ?auto_274215 ) ( ON ?auto_274210 ?auto_274209 ) ( ON ?auto_274211 ?auto_274210 ) ( ON ?auto_274208 ?auto_274211 ) ( ON ?auto_274212 ?auto_274208 ) ( ON ?auto_274214 ?auto_274212 ) ( ON ?auto_274213 ?auto_274214 ) ( not ( = ?auto_274209 ?auto_274210 ) ) ( not ( = ?auto_274209 ?auto_274211 ) ) ( not ( = ?auto_274209 ?auto_274208 ) ) ( not ( = ?auto_274209 ?auto_274212 ) ) ( not ( = ?auto_274209 ?auto_274214 ) ) ( not ( = ?auto_274209 ?auto_274213 ) ) ( not ( = ?auto_274209 ?auto_274215 ) ) ( not ( = ?auto_274209 ?auto_274216 ) ) ( not ( = ?auto_274209 ?auto_274222 ) ) ( not ( = ?auto_274210 ?auto_274211 ) ) ( not ( = ?auto_274210 ?auto_274208 ) ) ( not ( = ?auto_274210 ?auto_274212 ) ) ( not ( = ?auto_274210 ?auto_274214 ) ) ( not ( = ?auto_274210 ?auto_274213 ) ) ( not ( = ?auto_274210 ?auto_274215 ) ) ( not ( = ?auto_274210 ?auto_274216 ) ) ( not ( = ?auto_274210 ?auto_274222 ) ) ( not ( = ?auto_274211 ?auto_274208 ) ) ( not ( = ?auto_274211 ?auto_274212 ) ) ( not ( = ?auto_274211 ?auto_274214 ) ) ( not ( = ?auto_274211 ?auto_274213 ) ) ( not ( = ?auto_274211 ?auto_274215 ) ) ( not ( = ?auto_274211 ?auto_274216 ) ) ( not ( = ?auto_274211 ?auto_274222 ) ) ( not ( = ?auto_274208 ?auto_274212 ) ) ( not ( = ?auto_274208 ?auto_274214 ) ) ( not ( = ?auto_274208 ?auto_274213 ) ) ( not ( = ?auto_274208 ?auto_274215 ) ) ( not ( = ?auto_274208 ?auto_274216 ) ) ( not ( = ?auto_274208 ?auto_274222 ) ) ( not ( = ?auto_274212 ?auto_274214 ) ) ( not ( = ?auto_274212 ?auto_274213 ) ) ( not ( = ?auto_274212 ?auto_274215 ) ) ( not ( = ?auto_274212 ?auto_274216 ) ) ( not ( = ?auto_274212 ?auto_274222 ) ) ( not ( = ?auto_274214 ?auto_274213 ) ) ( not ( = ?auto_274214 ?auto_274215 ) ) ( not ( = ?auto_274214 ?auto_274216 ) ) ( not ( = ?auto_274214 ?auto_274222 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_274213 ?auto_274215 ?auto_274216 )
      ( MAKE-8CRATE-VERIFY ?auto_274209 ?auto_274210 ?auto_274211 ?auto_274208 ?auto_274212 ?auto_274214 ?auto_274213 ?auto_274215 ?auto_274216 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_274302 - SURFACE
      ?auto_274303 - SURFACE
      ?auto_274304 - SURFACE
      ?auto_274301 - SURFACE
      ?auto_274305 - SURFACE
      ?auto_274307 - SURFACE
      ?auto_274306 - SURFACE
      ?auto_274308 - SURFACE
      ?auto_274309 - SURFACE
    )
    :vars
    (
      ?auto_274310 - HOIST
      ?auto_274315 - PLACE
      ?auto_274314 - PLACE
      ?auto_274313 - HOIST
      ?auto_274312 - SURFACE
      ?auto_274311 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_274310 ?auto_274315 ) ( IS-CRATE ?auto_274309 ) ( not ( = ?auto_274308 ?auto_274309 ) ) ( not ( = ?auto_274306 ?auto_274308 ) ) ( not ( = ?auto_274306 ?auto_274309 ) ) ( not ( = ?auto_274314 ?auto_274315 ) ) ( HOIST-AT ?auto_274313 ?auto_274314 ) ( not ( = ?auto_274310 ?auto_274313 ) ) ( AVAILABLE ?auto_274313 ) ( SURFACE-AT ?auto_274309 ?auto_274314 ) ( ON ?auto_274309 ?auto_274312 ) ( CLEAR ?auto_274309 ) ( not ( = ?auto_274308 ?auto_274312 ) ) ( not ( = ?auto_274309 ?auto_274312 ) ) ( not ( = ?auto_274306 ?auto_274312 ) ) ( TRUCK-AT ?auto_274311 ?auto_274315 ) ( SURFACE-AT ?auto_274306 ?auto_274315 ) ( CLEAR ?auto_274306 ) ( IS-CRATE ?auto_274308 ) ( AVAILABLE ?auto_274310 ) ( IN ?auto_274308 ?auto_274311 ) ( ON ?auto_274303 ?auto_274302 ) ( ON ?auto_274304 ?auto_274303 ) ( ON ?auto_274301 ?auto_274304 ) ( ON ?auto_274305 ?auto_274301 ) ( ON ?auto_274307 ?auto_274305 ) ( ON ?auto_274306 ?auto_274307 ) ( not ( = ?auto_274302 ?auto_274303 ) ) ( not ( = ?auto_274302 ?auto_274304 ) ) ( not ( = ?auto_274302 ?auto_274301 ) ) ( not ( = ?auto_274302 ?auto_274305 ) ) ( not ( = ?auto_274302 ?auto_274307 ) ) ( not ( = ?auto_274302 ?auto_274306 ) ) ( not ( = ?auto_274302 ?auto_274308 ) ) ( not ( = ?auto_274302 ?auto_274309 ) ) ( not ( = ?auto_274302 ?auto_274312 ) ) ( not ( = ?auto_274303 ?auto_274304 ) ) ( not ( = ?auto_274303 ?auto_274301 ) ) ( not ( = ?auto_274303 ?auto_274305 ) ) ( not ( = ?auto_274303 ?auto_274307 ) ) ( not ( = ?auto_274303 ?auto_274306 ) ) ( not ( = ?auto_274303 ?auto_274308 ) ) ( not ( = ?auto_274303 ?auto_274309 ) ) ( not ( = ?auto_274303 ?auto_274312 ) ) ( not ( = ?auto_274304 ?auto_274301 ) ) ( not ( = ?auto_274304 ?auto_274305 ) ) ( not ( = ?auto_274304 ?auto_274307 ) ) ( not ( = ?auto_274304 ?auto_274306 ) ) ( not ( = ?auto_274304 ?auto_274308 ) ) ( not ( = ?auto_274304 ?auto_274309 ) ) ( not ( = ?auto_274304 ?auto_274312 ) ) ( not ( = ?auto_274301 ?auto_274305 ) ) ( not ( = ?auto_274301 ?auto_274307 ) ) ( not ( = ?auto_274301 ?auto_274306 ) ) ( not ( = ?auto_274301 ?auto_274308 ) ) ( not ( = ?auto_274301 ?auto_274309 ) ) ( not ( = ?auto_274301 ?auto_274312 ) ) ( not ( = ?auto_274305 ?auto_274307 ) ) ( not ( = ?auto_274305 ?auto_274306 ) ) ( not ( = ?auto_274305 ?auto_274308 ) ) ( not ( = ?auto_274305 ?auto_274309 ) ) ( not ( = ?auto_274305 ?auto_274312 ) ) ( not ( = ?auto_274307 ?auto_274306 ) ) ( not ( = ?auto_274307 ?auto_274308 ) ) ( not ( = ?auto_274307 ?auto_274309 ) ) ( not ( = ?auto_274307 ?auto_274312 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_274306 ?auto_274308 ?auto_274309 )
      ( MAKE-8CRATE-VERIFY ?auto_274302 ?auto_274303 ?auto_274304 ?auto_274301 ?auto_274305 ?auto_274307 ?auto_274306 ?auto_274308 ?auto_274309 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_278418 - SURFACE
      ?auto_278419 - SURFACE
      ?auto_278420 - SURFACE
      ?auto_278417 - SURFACE
      ?auto_278421 - SURFACE
      ?auto_278423 - SURFACE
      ?auto_278422 - SURFACE
      ?auto_278424 - SURFACE
      ?auto_278425 - SURFACE
      ?auto_278426 - SURFACE
    )
    :vars
    (
      ?auto_278427 - HOIST
      ?auto_278428 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_278427 ?auto_278428 ) ( SURFACE-AT ?auto_278425 ?auto_278428 ) ( CLEAR ?auto_278425 ) ( LIFTING ?auto_278427 ?auto_278426 ) ( IS-CRATE ?auto_278426 ) ( not ( = ?auto_278425 ?auto_278426 ) ) ( ON ?auto_278419 ?auto_278418 ) ( ON ?auto_278420 ?auto_278419 ) ( ON ?auto_278417 ?auto_278420 ) ( ON ?auto_278421 ?auto_278417 ) ( ON ?auto_278423 ?auto_278421 ) ( ON ?auto_278422 ?auto_278423 ) ( ON ?auto_278424 ?auto_278422 ) ( ON ?auto_278425 ?auto_278424 ) ( not ( = ?auto_278418 ?auto_278419 ) ) ( not ( = ?auto_278418 ?auto_278420 ) ) ( not ( = ?auto_278418 ?auto_278417 ) ) ( not ( = ?auto_278418 ?auto_278421 ) ) ( not ( = ?auto_278418 ?auto_278423 ) ) ( not ( = ?auto_278418 ?auto_278422 ) ) ( not ( = ?auto_278418 ?auto_278424 ) ) ( not ( = ?auto_278418 ?auto_278425 ) ) ( not ( = ?auto_278418 ?auto_278426 ) ) ( not ( = ?auto_278419 ?auto_278420 ) ) ( not ( = ?auto_278419 ?auto_278417 ) ) ( not ( = ?auto_278419 ?auto_278421 ) ) ( not ( = ?auto_278419 ?auto_278423 ) ) ( not ( = ?auto_278419 ?auto_278422 ) ) ( not ( = ?auto_278419 ?auto_278424 ) ) ( not ( = ?auto_278419 ?auto_278425 ) ) ( not ( = ?auto_278419 ?auto_278426 ) ) ( not ( = ?auto_278420 ?auto_278417 ) ) ( not ( = ?auto_278420 ?auto_278421 ) ) ( not ( = ?auto_278420 ?auto_278423 ) ) ( not ( = ?auto_278420 ?auto_278422 ) ) ( not ( = ?auto_278420 ?auto_278424 ) ) ( not ( = ?auto_278420 ?auto_278425 ) ) ( not ( = ?auto_278420 ?auto_278426 ) ) ( not ( = ?auto_278417 ?auto_278421 ) ) ( not ( = ?auto_278417 ?auto_278423 ) ) ( not ( = ?auto_278417 ?auto_278422 ) ) ( not ( = ?auto_278417 ?auto_278424 ) ) ( not ( = ?auto_278417 ?auto_278425 ) ) ( not ( = ?auto_278417 ?auto_278426 ) ) ( not ( = ?auto_278421 ?auto_278423 ) ) ( not ( = ?auto_278421 ?auto_278422 ) ) ( not ( = ?auto_278421 ?auto_278424 ) ) ( not ( = ?auto_278421 ?auto_278425 ) ) ( not ( = ?auto_278421 ?auto_278426 ) ) ( not ( = ?auto_278423 ?auto_278422 ) ) ( not ( = ?auto_278423 ?auto_278424 ) ) ( not ( = ?auto_278423 ?auto_278425 ) ) ( not ( = ?auto_278423 ?auto_278426 ) ) ( not ( = ?auto_278422 ?auto_278424 ) ) ( not ( = ?auto_278422 ?auto_278425 ) ) ( not ( = ?auto_278422 ?auto_278426 ) ) ( not ( = ?auto_278424 ?auto_278425 ) ) ( not ( = ?auto_278424 ?auto_278426 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_278425 ?auto_278426 )
      ( MAKE-9CRATE-VERIFY ?auto_278418 ?auto_278419 ?auto_278420 ?auto_278417 ?auto_278421 ?auto_278423 ?auto_278422 ?auto_278424 ?auto_278425 ?auto_278426 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_278498 - SURFACE
      ?auto_278499 - SURFACE
      ?auto_278500 - SURFACE
      ?auto_278497 - SURFACE
      ?auto_278501 - SURFACE
      ?auto_278503 - SURFACE
      ?auto_278502 - SURFACE
      ?auto_278504 - SURFACE
      ?auto_278505 - SURFACE
      ?auto_278506 - SURFACE
    )
    :vars
    (
      ?auto_278509 - HOIST
      ?auto_278507 - PLACE
      ?auto_278508 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_278509 ?auto_278507 ) ( SURFACE-AT ?auto_278505 ?auto_278507 ) ( CLEAR ?auto_278505 ) ( IS-CRATE ?auto_278506 ) ( not ( = ?auto_278505 ?auto_278506 ) ) ( TRUCK-AT ?auto_278508 ?auto_278507 ) ( AVAILABLE ?auto_278509 ) ( IN ?auto_278506 ?auto_278508 ) ( ON ?auto_278505 ?auto_278504 ) ( not ( = ?auto_278504 ?auto_278505 ) ) ( not ( = ?auto_278504 ?auto_278506 ) ) ( ON ?auto_278499 ?auto_278498 ) ( ON ?auto_278500 ?auto_278499 ) ( ON ?auto_278497 ?auto_278500 ) ( ON ?auto_278501 ?auto_278497 ) ( ON ?auto_278503 ?auto_278501 ) ( ON ?auto_278502 ?auto_278503 ) ( ON ?auto_278504 ?auto_278502 ) ( not ( = ?auto_278498 ?auto_278499 ) ) ( not ( = ?auto_278498 ?auto_278500 ) ) ( not ( = ?auto_278498 ?auto_278497 ) ) ( not ( = ?auto_278498 ?auto_278501 ) ) ( not ( = ?auto_278498 ?auto_278503 ) ) ( not ( = ?auto_278498 ?auto_278502 ) ) ( not ( = ?auto_278498 ?auto_278504 ) ) ( not ( = ?auto_278498 ?auto_278505 ) ) ( not ( = ?auto_278498 ?auto_278506 ) ) ( not ( = ?auto_278499 ?auto_278500 ) ) ( not ( = ?auto_278499 ?auto_278497 ) ) ( not ( = ?auto_278499 ?auto_278501 ) ) ( not ( = ?auto_278499 ?auto_278503 ) ) ( not ( = ?auto_278499 ?auto_278502 ) ) ( not ( = ?auto_278499 ?auto_278504 ) ) ( not ( = ?auto_278499 ?auto_278505 ) ) ( not ( = ?auto_278499 ?auto_278506 ) ) ( not ( = ?auto_278500 ?auto_278497 ) ) ( not ( = ?auto_278500 ?auto_278501 ) ) ( not ( = ?auto_278500 ?auto_278503 ) ) ( not ( = ?auto_278500 ?auto_278502 ) ) ( not ( = ?auto_278500 ?auto_278504 ) ) ( not ( = ?auto_278500 ?auto_278505 ) ) ( not ( = ?auto_278500 ?auto_278506 ) ) ( not ( = ?auto_278497 ?auto_278501 ) ) ( not ( = ?auto_278497 ?auto_278503 ) ) ( not ( = ?auto_278497 ?auto_278502 ) ) ( not ( = ?auto_278497 ?auto_278504 ) ) ( not ( = ?auto_278497 ?auto_278505 ) ) ( not ( = ?auto_278497 ?auto_278506 ) ) ( not ( = ?auto_278501 ?auto_278503 ) ) ( not ( = ?auto_278501 ?auto_278502 ) ) ( not ( = ?auto_278501 ?auto_278504 ) ) ( not ( = ?auto_278501 ?auto_278505 ) ) ( not ( = ?auto_278501 ?auto_278506 ) ) ( not ( = ?auto_278503 ?auto_278502 ) ) ( not ( = ?auto_278503 ?auto_278504 ) ) ( not ( = ?auto_278503 ?auto_278505 ) ) ( not ( = ?auto_278503 ?auto_278506 ) ) ( not ( = ?auto_278502 ?auto_278504 ) ) ( not ( = ?auto_278502 ?auto_278505 ) ) ( not ( = ?auto_278502 ?auto_278506 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_278504 ?auto_278505 ?auto_278506 )
      ( MAKE-9CRATE-VERIFY ?auto_278498 ?auto_278499 ?auto_278500 ?auto_278497 ?auto_278501 ?auto_278503 ?auto_278502 ?auto_278504 ?auto_278505 ?auto_278506 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_278588 - SURFACE
      ?auto_278589 - SURFACE
      ?auto_278590 - SURFACE
      ?auto_278587 - SURFACE
      ?auto_278591 - SURFACE
      ?auto_278593 - SURFACE
      ?auto_278592 - SURFACE
      ?auto_278594 - SURFACE
      ?auto_278595 - SURFACE
      ?auto_278596 - SURFACE
    )
    :vars
    (
      ?auto_278599 - HOIST
      ?auto_278600 - PLACE
      ?auto_278598 - TRUCK
      ?auto_278597 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_278599 ?auto_278600 ) ( SURFACE-AT ?auto_278595 ?auto_278600 ) ( CLEAR ?auto_278595 ) ( IS-CRATE ?auto_278596 ) ( not ( = ?auto_278595 ?auto_278596 ) ) ( AVAILABLE ?auto_278599 ) ( IN ?auto_278596 ?auto_278598 ) ( ON ?auto_278595 ?auto_278594 ) ( not ( = ?auto_278594 ?auto_278595 ) ) ( not ( = ?auto_278594 ?auto_278596 ) ) ( TRUCK-AT ?auto_278598 ?auto_278597 ) ( not ( = ?auto_278597 ?auto_278600 ) ) ( ON ?auto_278589 ?auto_278588 ) ( ON ?auto_278590 ?auto_278589 ) ( ON ?auto_278587 ?auto_278590 ) ( ON ?auto_278591 ?auto_278587 ) ( ON ?auto_278593 ?auto_278591 ) ( ON ?auto_278592 ?auto_278593 ) ( ON ?auto_278594 ?auto_278592 ) ( not ( = ?auto_278588 ?auto_278589 ) ) ( not ( = ?auto_278588 ?auto_278590 ) ) ( not ( = ?auto_278588 ?auto_278587 ) ) ( not ( = ?auto_278588 ?auto_278591 ) ) ( not ( = ?auto_278588 ?auto_278593 ) ) ( not ( = ?auto_278588 ?auto_278592 ) ) ( not ( = ?auto_278588 ?auto_278594 ) ) ( not ( = ?auto_278588 ?auto_278595 ) ) ( not ( = ?auto_278588 ?auto_278596 ) ) ( not ( = ?auto_278589 ?auto_278590 ) ) ( not ( = ?auto_278589 ?auto_278587 ) ) ( not ( = ?auto_278589 ?auto_278591 ) ) ( not ( = ?auto_278589 ?auto_278593 ) ) ( not ( = ?auto_278589 ?auto_278592 ) ) ( not ( = ?auto_278589 ?auto_278594 ) ) ( not ( = ?auto_278589 ?auto_278595 ) ) ( not ( = ?auto_278589 ?auto_278596 ) ) ( not ( = ?auto_278590 ?auto_278587 ) ) ( not ( = ?auto_278590 ?auto_278591 ) ) ( not ( = ?auto_278590 ?auto_278593 ) ) ( not ( = ?auto_278590 ?auto_278592 ) ) ( not ( = ?auto_278590 ?auto_278594 ) ) ( not ( = ?auto_278590 ?auto_278595 ) ) ( not ( = ?auto_278590 ?auto_278596 ) ) ( not ( = ?auto_278587 ?auto_278591 ) ) ( not ( = ?auto_278587 ?auto_278593 ) ) ( not ( = ?auto_278587 ?auto_278592 ) ) ( not ( = ?auto_278587 ?auto_278594 ) ) ( not ( = ?auto_278587 ?auto_278595 ) ) ( not ( = ?auto_278587 ?auto_278596 ) ) ( not ( = ?auto_278591 ?auto_278593 ) ) ( not ( = ?auto_278591 ?auto_278592 ) ) ( not ( = ?auto_278591 ?auto_278594 ) ) ( not ( = ?auto_278591 ?auto_278595 ) ) ( not ( = ?auto_278591 ?auto_278596 ) ) ( not ( = ?auto_278593 ?auto_278592 ) ) ( not ( = ?auto_278593 ?auto_278594 ) ) ( not ( = ?auto_278593 ?auto_278595 ) ) ( not ( = ?auto_278593 ?auto_278596 ) ) ( not ( = ?auto_278592 ?auto_278594 ) ) ( not ( = ?auto_278592 ?auto_278595 ) ) ( not ( = ?auto_278592 ?auto_278596 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_278594 ?auto_278595 ?auto_278596 )
      ( MAKE-9CRATE-VERIFY ?auto_278588 ?auto_278589 ?auto_278590 ?auto_278587 ?auto_278591 ?auto_278593 ?auto_278592 ?auto_278594 ?auto_278595 ?auto_278596 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_278687 - SURFACE
      ?auto_278688 - SURFACE
      ?auto_278689 - SURFACE
      ?auto_278686 - SURFACE
      ?auto_278690 - SURFACE
      ?auto_278692 - SURFACE
      ?auto_278691 - SURFACE
      ?auto_278693 - SURFACE
      ?auto_278694 - SURFACE
      ?auto_278695 - SURFACE
    )
    :vars
    (
      ?auto_278698 - HOIST
      ?auto_278700 - PLACE
      ?auto_278697 - TRUCK
      ?auto_278699 - PLACE
      ?auto_278696 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_278698 ?auto_278700 ) ( SURFACE-AT ?auto_278694 ?auto_278700 ) ( CLEAR ?auto_278694 ) ( IS-CRATE ?auto_278695 ) ( not ( = ?auto_278694 ?auto_278695 ) ) ( AVAILABLE ?auto_278698 ) ( ON ?auto_278694 ?auto_278693 ) ( not ( = ?auto_278693 ?auto_278694 ) ) ( not ( = ?auto_278693 ?auto_278695 ) ) ( TRUCK-AT ?auto_278697 ?auto_278699 ) ( not ( = ?auto_278699 ?auto_278700 ) ) ( HOIST-AT ?auto_278696 ?auto_278699 ) ( LIFTING ?auto_278696 ?auto_278695 ) ( not ( = ?auto_278698 ?auto_278696 ) ) ( ON ?auto_278688 ?auto_278687 ) ( ON ?auto_278689 ?auto_278688 ) ( ON ?auto_278686 ?auto_278689 ) ( ON ?auto_278690 ?auto_278686 ) ( ON ?auto_278692 ?auto_278690 ) ( ON ?auto_278691 ?auto_278692 ) ( ON ?auto_278693 ?auto_278691 ) ( not ( = ?auto_278687 ?auto_278688 ) ) ( not ( = ?auto_278687 ?auto_278689 ) ) ( not ( = ?auto_278687 ?auto_278686 ) ) ( not ( = ?auto_278687 ?auto_278690 ) ) ( not ( = ?auto_278687 ?auto_278692 ) ) ( not ( = ?auto_278687 ?auto_278691 ) ) ( not ( = ?auto_278687 ?auto_278693 ) ) ( not ( = ?auto_278687 ?auto_278694 ) ) ( not ( = ?auto_278687 ?auto_278695 ) ) ( not ( = ?auto_278688 ?auto_278689 ) ) ( not ( = ?auto_278688 ?auto_278686 ) ) ( not ( = ?auto_278688 ?auto_278690 ) ) ( not ( = ?auto_278688 ?auto_278692 ) ) ( not ( = ?auto_278688 ?auto_278691 ) ) ( not ( = ?auto_278688 ?auto_278693 ) ) ( not ( = ?auto_278688 ?auto_278694 ) ) ( not ( = ?auto_278688 ?auto_278695 ) ) ( not ( = ?auto_278689 ?auto_278686 ) ) ( not ( = ?auto_278689 ?auto_278690 ) ) ( not ( = ?auto_278689 ?auto_278692 ) ) ( not ( = ?auto_278689 ?auto_278691 ) ) ( not ( = ?auto_278689 ?auto_278693 ) ) ( not ( = ?auto_278689 ?auto_278694 ) ) ( not ( = ?auto_278689 ?auto_278695 ) ) ( not ( = ?auto_278686 ?auto_278690 ) ) ( not ( = ?auto_278686 ?auto_278692 ) ) ( not ( = ?auto_278686 ?auto_278691 ) ) ( not ( = ?auto_278686 ?auto_278693 ) ) ( not ( = ?auto_278686 ?auto_278694 ) ) ( not ( = ?auto_278686 ?auto_278695 ) ) ( not ( = ?auto_278690 ?auto_278692 ) ) ( not ( = ?auto_278690 ?auto_278691 ) ) ( not ( = ?auto_278690 ?auto_278693 ) ) ( not ( = ?auto_278690 ?auto_278694 ) ) ( not ( = ?auto_278690 ?auto_278695 ) ) ( not ( = ?auto_278692 ?auto_278691 ) ) ( not ( = ?auto_278692 ?auto_278693 ) ) ( not ( = ?auto_278692 ?auto_278694 ) ) ( not ( = ?auto_278692 ?auto_278695 ) ) ( not ( = ?auto_278691 ?auto_278693 ) ) ( not ( = ?auto_278691 ?auto_278694 ) ) ( not ( = ?auto_278691 ?auto_278695 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_278693 ?auto_278694 ?auto_278695 )
      ( MAKE-9CRATE-VERIFY ?auto_278687 ?auto_278688 ?auto_278689 ?auto_278686 ?auto_278690 ?auto_278692 ?auto_278691 ?auto_278693 ?auto_278694 ?auto_278695 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_278795 - SURFACE
      ?auto_278796 - SURFACE
      ?auto_278797 - SURFACE
      ?auto_278794 - SURFACE
      ?auto_278798 - SURFACE
      ?auto_278800 - SURFACE
      ?auto_278799 - SURFACE
      ?auto_278801 - SURFACE
      ?auto_278802 - SURFACE
      ?auto_278803 - SURFACE
    )
    :vars
    (
      ?auto_278805 - HOIST
      ?auto_278807 - PLACE
      ?auto_278809 - TRUCK
      ?auto_278804 - PLACE
      ?auto_278808 - HOIST
      ?auto_278806 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_278805 ?auto_278807 ) ( SURFACE-AT ?auto_278802 ?auto_278807 ) ( CLEAR ?auto_278802 ) ( IS-CRATE ?auto_278803 ) ( not ( = ?auto_278802 ?auto_278803 ) ) ( AVAILABLE ?auto_278805 ) ( ON ?auto_278802 ?auto_278801 ) ( not ( = ?auto_278801 ?auto_278802 ) ) ( not ( = ?auto_278801 ?auto_278803 ) ) ( TRUCK-AT ?auto_278809 ?auto_278804 ) ( not ( = ?auto_278804 ?auto_278807 ) ) ( HOIST-AT ?auto_278808 ?auto_278804 ) ( not ( = ?auto_278805 ?auto_278808 ) ) ( AVAILABLE ?auto_278808 ) ( SURFACE-AT ?auto_278803 ?auto_278804 ) ( ON ?auto_278803 ?auto_278806 ) ( CLEAR ?auto_278803 ) ( not ( = ?auto_278802 ?auto_278806 ) ) ( not ( = ?auto_278803 ?auto_278806 ) ) ( not ( = ?auto_278801 ?auto_278806 ) ) ( ON ?auto_278796 ?auto_278795 ) ( ON ?auto_278797 ?auto_278796 ) ( ON ?auto_278794 ?auto_278797 ) ( ON ?auto_278798 ?auto_278794 ) ( ON ?auto_278800 ?auto_278798 ) ( ON ?auto_278799 ?auto_278800 ) ( ON ?auto_278801 ?auto_278799 ) ( not ( = ?auto_278795 ?auto_278796 ) ) ( not ( = ?auto_278795 ?auto_278797 ) ) ( not ( = ?auto_278795 ?auto_278794 ) ) ( not ( = ?auto_278795 ?auto_278798 ) ) ( not ( = ?auto_278795 ?auto_278800 ) ) ( not ( = ?auto_278795 ?auto_278799 ) ) ( not ( = ?auto_278795 ?auto_278801 ) ) ( not ( = ?auto_278795 ?auto_278802 ) ) ( not ( = ?auto_278795 ?auto_278803 ) ) ( not ( = ?auto_278795 ?auto_278806 ) ) ( not ( = ?auto_278796 ?auto_278797 ) ) ( not ( = ?auto_278796 ?auto_278794 ) ) ( not ( = ?auto_278796 ?auto_278798 ) ) ( not ( = ?auto_278796 ?auto_278800 ) ) ( not ( = ?auto_278796 ?auto_278799 ) ) ( not ( = ?auto_278796 ?auto_278801 ) ) ( not ( = ?auto_278796 ?auto_278802 ) ) ( not ( = ?auto_278796 ?auto_278803 ) ) ( not ( = ?auto_278796 ?auto_278806 ) ) ( not ( = ?auto_278797 ?auto_278794 ) ) ( not ( = ?auto_278797 ?auto_278798 ) ) ( not ( = ?auto_278797 ?auto_278800 ) ) ( not ( = ?auto_278797 ?auto_278799 ) ) ( not ( = ?auto_278797 ?auto_278801 ) ) ( not ( = ?auto_278797 ?auto_278802 ) ) ( not ( = ?auto_278797 ?auto_278803 ) ) ( not ( = ?auto_278797 ?auto_278806 ) ) ( not ( = ?auto_278794 ?auto_278798 ) ) ( not ( = ?auto_278794 ?auto_278800 ) ) ( not ( = ?auto_278794 ?auto_278799 ) ) ( not ( = ?auto_278794 ?auto_278801 ) ) ( not ( = ?auto_278794 ?auto_278802 ) ) ( not ( = ?auto_278794 ?auto_278803 ) ) ( not ( = ?auto_278794 ?auto_278806 ) ) ( not ( = ?auto_278798 ?auto_278800 ) ) ( not ( = ?auto_278798 ?auto_278799 ) ) ( not ( = ?auto_278798 ?auto_278801 ) ) ( not ( = ?auto_278798 ?auto_278802 ) ) ( not ( = ?auto_278798 ?auto_278803 ) ) ( not ( = ?auto_278798 ?auto_278806 ) ) ( not ( = ?auto_278800 ?auto_278799 ) ) ( not ( = ?auto_278800 ?auto_278801 ) ) ( not ( = ?auto_278800 ?auto_278802 ) ) ( not ( = ?auto_278800 ?auto_278803 ) ) ( not ( = ?auto_278800 ?auto_278806 ) ) ( not ( = ?auto_278799 ?auto_278801 ) ) ( not ( = ?auto_278799 ?auto_278802 ) ) ( not ( = ?auto_278799 ?auto_278803 ) ) ( not ( = ?auto_278799 ?auto_278806 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_278801 ?auto_278802 ?auto_278803 )
      ( MAKE-9CRATE-VERIFY ?auto_278795 ?auto_278796 ?auto_278797 ?auto_278794 ?auto_278798 ?auto_278800 ?auto_278799 ?auto_278801 ?auto_278802 ?auto_278803 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_278904 - SURFACE
      ?auto_278905 - SURFACE
      ?auto_278906 - SURFACE
      ?auto_278903 - SURFACE
      ?auto_278907 - SURFACE
      ?auto_278909 - SURFACE
      ?auto_278908 - SURFACE
      ?auto_278910 - SURFACE
      ?auto_278911 - SURFACE
      ?auto_278912 - SURFACE
    )
    :vars
    (
      ?auto_278917 - HOIST
      ?auto_278913 - PLACE
      ?auto_278918 - PLACE
      ?auto_278914 - HOIST
      ?auto_278915 - SURFACE
      ?auto_278916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_278917 ?auto_278913 ) ( SURFACE-AT ?auto_278911 ?auto_278913 ) ( CLEAR ?auto_278911 ) ( IS-CRATE ?auto_278912 ) ( not ( = ?auto_278911 ?auto_278912 ) ) ( AVAILABLE ?auto_278917 ) ( ON ?auto_278911 ?auto_278910 ) ( not ( = ?auto_278910 ?auto_278911 ) ) ( not ( = ?auto_278910 ?auto_278912 ) ) ( not ( = ?auto_278918 ?auto_278913 ) ) ( HOIST-AT ?auto_278914 ?auto_278918 ) ( not ( = ?auto_278917 ?auto_278914 ) ) ( AVAILABLE ?auto_278914 ) ( SURFACE-AT ?auto_278912 ?auto_278918 ) ( ON ?auto_278912 ?auto_278915 ) ( CLEAR ?auto_278912 ) ( not ( = ?auto_278911 ?auto_278915 ) ) ( not ( = ?auto_278912 ?auto_278915 ) ) ( not ( = ?auto_278910 ?auto_278915 ) ) ( TRUCK-AT ?auto_278916 ?auto_278913 ) ( ON ?auto_278905 ?auto_278904 ) ( ON ?auto_278906 ?auto_278905 ) ( ON ?auto_278903 ?auto_278906 ) ( ON ?auto_278907 ?auto_278903 ) ( ON ?auto_278909 ?auto_278907 ) ( ON ?auto_278908 ?auto_278909 ) ( ON ?auto_278910 ?auto_278908 ) ( not ( = ?auto_278904 ?auto_278905 ) ) ( not ( = ?auto_278904 ?auto_278906 ) ) ( not ( = ?auto_278904 ?auto_278903 ) ) ( not ( = ?auto_278904 ?auto_278907 ) ) ( not ( = ?auto_278904 ?auto_278909 ) ) ( not ( = ?auto_278904 ?auto_278908 ) ) ( not ( = ?auto_278904 ?auto_278910 ) ) ( not ( = ?auto_278904 ?auto_278911 ) ) ( not ( = ?auto_278904 ?auto_278912 ) ) ( not ( = ?auto_278904 ?auto_278915 ) ) ( not ( = ?auto_278905 ?auto_278906 ) ) ( not ( = ?auto_278905 ?auto_278903 ) ) ( not ( = ?auto_278905 ?auto_278907 ) ) ( not ( = ?auto_278905 ?auto_278909 ) ) ( not ( = ?auto_278905 ?auto_278908 ) ) ( not ( = ?auto_278905 ?auto_278910 ) ) ( not ( = ?auto_278905 ?auto_278911 ) ) ( not ( = ?auto_278905 ?auto_278912 ) ) ( not ( = ?auto_278905 ?auto_278915 ) ) ( not ( = ?auto_278906 ?auto_278903 ) ) ( not ( = ?auto_278906 ?auto_278907 ) ) ( not ( = ?auto_278906 ?auto_278909 ) ) ( not ( = ?auto_278906 ?auto_278908 ) ) ( not ( = ?auto_278906 ?auto_278910 ) ) ( not ( = ?auto_278906 ?auto_278911 ) ) ( not ( = ?auto_278906 ?auto_278912 ) ) ( not ( = ?auto_278906 ?auto_278915 ) ) ( not ( = ?auto_278903 ?auto_278907 ) ) ( not ( = ?auto_278903 ?auto_278909 ) ) ( not ( = ?auto_278903 ?auto_278908 ) ) ( not ( = ?auto_278903 ?auto_278910 ) ) ( not ( = ?auto_278903 ?auto_278911 ) ) ( not ( = ?auto_278903 ?auto_278912 ) ) ( not ( = ?auto_278903 ?auto_278915 ) ) ( not ( = ?auto_278907 ?auto_278909 ) ) ( not ( = ?auto_278907 ?auto_278908 ) ) ( not ( = ?auto_278907 ?auto_278910 ) ) ( not ( = ?auto_278907 ?auto_278911 ) ) ( not ( = ?auto_278907 ?auto_278912 ) ) ( not ( = ?auto_278907 ?auto_278915 ) ) ( not ( = ?auto_278909 ?auto_278908 ) ) ( not ( = ?auto_278909 ?auto_278910 ) ) ( not ( = ?auto_278909 ?auto_278911 ) ) ( not ( = ?auto_278909 ?auto_278912 ) ) ( not ( = ?auto_278909 ?auto_278915 ) ) ( not ( = ?auto_278908 ?auto_278910 ) ) ( not ( = ?auto_278908 ?auto_278911 ) ) ( not ( = ?auto_278908 ?auto_278912 ) ) ( not ( = ?auto_278908 ?auto_278915 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_278910 ?auto_278911 ?auto_278912 )
      ( MAKE-9CRATE-VERIFY ?auto_278904 ?auto_278905 ?auto_278906 ?auto_278903 ?auto_278907 ?auto_278909 ?auto_278908 ?auto_278910 ?auto_278911 ?auto_278912 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_279013 - SURFACE
      ?auto_279014 - SURFACE
      ?auto_279015 - SURFACE
      ?auto_279012 - SURFACE
      ?auto_279016 - SURFACE
      ?auto_279018 - SURFACE
      ?auto_279017 - SURFACE
      ?auto_279019 - SURFACE
      ?auto_279020 - SURFACE
      ?auto_279021 - SURFACE
    )
    :vars
    (
      ?auto_279027 - HOIST
      ?auto_279022 - PLACE
      ?auto_279024 - PLACE
      ?auto_279026 - HOIST
      ?auto_279023 - SURFACE
      ?auto_279025 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_279027 ?auto_279022 ) ( IS-CRATE ?auto_279021 ) ( not ( = ?auto_279020 ?auto_279021 ) ) ( not ( = ?auto_279019 ?auto_279020 ) ) ( not ( = ?auto_279019 ?auto_279021 ) ) ( not ( = ?auto_279024 ?auto_279022 ) ) ( HOIST-AT ?auto_279026 ?auto_279024 ) ( not ( = ?auto_279027 ?auto_279026 ) ) ( AVAILABLE ?auto_279026 ) ( SURFACE-AT ?auto_279021 ?auto_279024 ) ( ON ?auto_279021 ?auto_279023 ) ( CLEAR ?auto_279021 ) ( not ( = ?auto_279020 ?auto_279023 ) ) ( not ( = ?auto_279021 ?auto_279023 ) ) ( not ( = ?auto_279019 ?auto_279023 ) ) ( TRUCK-AT ?auto_279025 ?auto_279022 ) ( SURFACE-AT ?auto_279019 ?auto_279022 ) ( CLEAR ?auto_279019 ) ( LIFTING ?auto_279027 ?auto_279020 ) ( IS-CRATE ?auto_279020 ) ( ON ?auto_279014 ?auto_279013 ) ( ON ?auto_279015 ?auto_279014 ) ( ON ?auto_279012 ?auto_279015 ) ( ON ?auto_279016 ?auto_279012 ) ( ON ?auto_279018 ?auto_279016 ) ( ON ?auto_279017 ?auto_279018 ) ( ON ?auto_279019 ?auto_279017 ) ( not ( = ?auto_279013 ?auto_279014 ) ) ( not ( = ?auto_279013 ?auto_279015 ) ) ( not ( = ?auto_279013 ?auto_279012 ) ) ( not ( = ?auto_279013 ?auto_279016 ) ) ( not ( = ?auto_279013 ?auto_279018 ) ) ( not ( = ?auto_279013 ?auto_279017 ) ) ( not ( = ?auto_279013 ?auto_279019 ) ) ( not ( = ?auto_279013 ?auto_279020 ) ) ( not ( = ?auto_279013 ?auto_279021 ) ) ( not ( = ?auto_279013 ?auto_279023 ) ) ( not ( = ?auto_279014 ?auto_279015 ) ) ( not ( = ?auto_279014 ?auto_279012 ) ) ( not ( = ?auto_279014 ?auto_279016 ) ) ( not ( = ?auto_279014 ?auto_279018 ) ) ( not ( = ?auto_279014 ?auto_279017 ) ) ( not ( = ?auto_279014 ?auto_279019 ) ) ( not ( = ?auto_279014 ?auto_279020 ) ) ( not ( = ?auto_279014 ?auto_279021 ) ) ( not ( = ?auto_279014 ?auto_279023 ) ) ( not ( = ?auto_279015 ?auto_279012 ) ) ( not ( = ?auto_279015 ?auto_279016 ) ) ( not ( = ?auto_279015 ?auto_279018 ) ) ( not ( = ?auto_279015 ?auto_279017 ) ) ( not ( = ?auto_279015 ?auto_279019 ) ) ( not ( = ?auto_279015 ?auto_279020 ) ) ( not ( = ?auto_279015 ?auto_279021 ) ) ( not ( = ?auto_279015 ?auto_279023 ) ) ( not ( = ?auto_279012 ?auto_279016 ) ) ( not ( = ?auto_279012 ?auto_279018 ) ) ( not ( = ?auto_279012 ?auto_279017 ) ) ( not ( = ?auto_279012 ?auto_279019 ) ) ( not ( = ?auto_279012 ?auto_279020 ) ) ( not ( = ?auto_279012 ?auto_279021 ) ) ( not ( = ?auto_279012 ?auto_279023 ) ) ( not ( = ?auto_279016 ?auto_279018 ) ) ( not ( = ?auto_279016 ?auto_279017 ) ) ( not ( = ?auto_279016 ?auto_279019 ) ) ( not ( = ?auto_279016 ?auto_279020 ) ) ( not ( = ?auto_279016 ?auto_279021 ) ) ( not ( = ?auto_279016 ?auto_279023 ) ) ( not ( = ?auto_279018 ?auto_279017 ) ) ( not ( = ?auto_279018 ?auto_279019 ) ) ( not ( = ?auto_279018 ?auto_279020 ) ) ( not ( = ?auto_279018 ?auto_279021 ) ) ( not ( = ?auto_279018 ?auto_279023 ) ) ( not ( = ?auto_279017 ?auto_279019 ) ) ( not ( = ?auto_279017 ?auto_279020 ) ) ( not ( = ?auto_279017 ?auto_279021 ) ) ( not ( = ?auto_279017 ?auto_279023 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_279019 ?auto_279020 ?auto_279021 )
      ( MAKE-9CRATE-VERIFY ?auto_279013 ?auto_279014 ?auto_279015 ?auto_279012 ?auto_279016 ?auto_279018 ?auto_279017 ?auto_279019 ?auto_279020 ?auto_279021 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_279122 - SURFACE
      ?auto_279123 - SURFACE
      ?auto_279124 - SURFACE
      ?auto_279121 - SURFACE
      ?auto_279125 - SURFACE
      ?auto_279127 - SURFACE
      ?auto_279126 - SURFACE
      ?auto_279128 - SURFACE
      ?auto_279129 - SURFACE
      ?auto_279130 - SURFACE
    )
    :vars
    (
      ?auto_279132 - HOIST
      ?auto_279134 - PLACE
      ?auto_279133 - PLACE
      ?auto_279135 - HOIST
      ?auto_279136 - SURFACE
      ?auto_279131 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_279132 ?auto_279134 ) ( IS-CRATE ?auto_279130 ) ( not ( = ?auto_279129 ?auto_279130 ) ) ( not ( = ?auto_279128 ?auto_279129 ) ) ( not ( = ?auto_279128 ?auto_279130 ) ) ( not ( = ?auto_279133 ?auto_279134 ) ) ( HOIST-AT ?auto_279135 ?auto_279133 ) ( not ( = ?auto_279132 ?auto_279135 ) ) ( AVAILABLE ?auto_279135 ) ( SURFACE-AT ?auto_279130 ?auto_279133 ) ( ON ?auto_279130 ?auto_279136 ) ( CLEAR ?auto_279130 ) ( not ( = ?auto_279129 ?auto_279136 ) ) ( not ( = ?auto_279130 ?auto_279136 ) ) ( not ( = ?auto_279128 ?auto_279136 ) ) ( TRUCK-AT ?auto_279131 ?auto_279134 ) ( SURFACE-AT ?auto_279128 ?auto_279134 ) ( CLEAR ?auto_279128 ) ( IS-CRATE ?auto_279129 ) ( AVAILABLE ?auto_279132 ) ( IN ?auto_279129 ?auto_279131 ) ( ON ?auto_279123 ?auto_279122 ) ( ON ?auto_279124 ?auto_279123 ) ( ON ?auto_279121 ?auto_279124 ) ( ON ?auto_279125 ?auto_279121 ) ( ON ?auto_279127 ?auto_279125 ) ( ON ?auto_279126 ?auto_279127 ) ( ON ?auto_279128 ?auto_279126 ) ( not ( = ?auto_279122 ?auto_279123 ) ) ( not ( = ?auto_279122 ?auto_279124 ) ) ( not ( = ?auto_279122 ?auto_279121 ) ) ( not ( = ?auto_279122 ?auto_279125 ) ) ( not ( = ?auto_279122 ?auto_279127 ) ) ( not ( = ?auto_279122 ?auto_279126 ) ) ( not ( = ?auto_279122 ?auto_279128 ) ) ( not ( = ?auto_279122 ?auto_279129 ) ) ( not ( = ?auto_279122 ?auto_279130 ) ) ( not ( = ?auto_279122 ?auto_279136 ) ) ( not ( = ?auto_279123 ?auto_279124 ) ) ( not ( = ?auto_279123 ?auto_279121 ) ) ( not ( = ?auto_279123 ?auto_279125 ) ) ( not ( = ?auto_279123 ?auto_279127 ) ) ( not ( = ?auto_279123 ?auto_279126 ) ) ( not ( = ?auto_279123 ?auto_279128 ) ) ( not ( = ?auto_279123 ?auto_279129 ) ) ( not ( = ?auto_279123 ?auto_279130 ) ) ( not ( = ?auto_279123 ?auto_279136 ) ) ( not ( = ?auto_279124 ?auto_279121 ) ) ( not ( = ?auto_279124 ?auto_279125 ) ) ( not ( = ?auto_279124 ?auto_279127 ) ) ( not ( = ?auto_279124 ?auto_279126 ) ) ( not ( = ?auto_279124 ?auto_279128 ) ) ( not ( = ?auto_279124 ?auto_279129 ) ) ( not ( = ?auto_279124 ?auto_279130 ) ) ( not ( = ?auto_279124 ?auto_279136 ) ) ( not ( = ?auto_279121 ?auto_279125 ) ) ( not ( = ?auto_279121 ?auto_279127 ) ) ( not ( = ?auto_279121 ?auto_279126 ) ) ( not ( = ?auto_279121 ?auto_279128 ) ) ( not ( = ?auto_279121 ?auto_279129 ) ) ( not ( = ?auto_279121 ?auto_279130 ) ) ( not ( = ?auto_279121 ?auto_279136 ) ) ( not ( = ?auto_279125 ?auto_279127 ) ) ( not ( = ?auto_279125 ?auto_279126 ) ) ( not ( = ?auto_279125 ?auto_279128 ) ) ( not ( = ?auto_279125 ?auto_279129 ) ) ( not ( = ?auto_279125 ?auto_279130 ) ) ( not ( = ?auto_279125 ?auto_279136 ) ) ( not ( = ?auto_279127 ?auto_279126 ) ) ( not ( = ?auto_279127 ?auto_279128 ) ) ( not ( = ?auto_279127 ?auto_279129 ) ) ( not ( = ?auto_279127 ?auto_279130 ) ) ( not ( = ?auto_279127 ?auto_279136 ) ) ( not ( = ?auto_279126 ?auto_279128 ) ) ( not ( = ?auto_279126 ?auto_279129 ) ) ( not ( = ?auto_279126 ?auto_279130 ) ) ( not ( = ?auto_279126 ?auto_279136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_279128 ?auto_279129 ?auto_279130 )
      ( MAKE-9CRATE-VERIFY ?auto_279122 ?auto_279123 ?auto_279124 ?auto_279121 ?auto_279125 ?auto_279127 ?auto_279126 ?auto_279128 ?auto_279129 ?auto_279130 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_284687 - SURFACE
      ?auto_284688 - SURFACE
      ?auto_284689 - SURFACE
      ?auto_284686 - SURFACE
      ?auto_284690 - SURFACE
      ?auto_284692 - SURFACE
      ?auto_284691 - SURFACE
      ?auto_284693 - SURFACE
      ?auto_284694 - SURFACE
      ?auto_284695 - SURFACE
      ?auto_284696 - SURFACE
    )
    :vars
    (
      ?auto_284698 - HOIST
      ?auto_284697 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_284698 ?auto_284697 ) ( SURFACE-AT ?auto_284695 ?auto_284697 ) ( CLEAR ?auto_284695 ) ( LIFTING ?auto_284698 ?auto_284696 ) ( IS-CRATE ?auto_284696 ) ( not ( = ?auto_284695 ?auto_284696 ) ) ( ON ?auto_284688 ?auto_284687 ) ( ON ?auto_284689 ?auto_284688 ) ( ON ?auto_284686 ?auto_284689 ) ( ON ?auto_284690 ?auto_284686 ) ( ON ?auto_284692 ?auto_284690 ) ( ON ?auto_284691 ?auto_284692 ) ( ON ?auto_284693 ?auto_284691 ) ( ON ?auto_284694 ?auto_284693 ) ( ON ?auto_284695 ?auto_284694 ) ( not ( = ?auto_284687 ?auto_284688 ) ) ( not ( = ?auto_284687 ?auto_284689 ) ) ( not ( = ?auto_284687 ?auto_284686 ) ) ( not ( = ?auto_284687 ?auto_284690 ) ) ( not ( = ?auto_284687 ?auto_284692 ) ) ( not ( = ?auto_284687 ?auto_284691 ) ) ( not ( = ?auto_284687 ?auto_284693 ) ) ( not ( = ?auto_284687 ?auto_284694 ) ) ( not ( = ?auto_284687 ?auto_284695 ) ) ( not ( = ?auto_284687 ?auto_284696 ) ) ( not ( = ?auto_284688 ?auto_284689 ) ) ( not ( = ?auto_284688 ?auto_284686 ) ) ( not ( = ?auto_284688 ?auto_284690 ) ) ( not ( = ?auto_284688 ?auto_284692 ) ) ( not ( = ?auto_284688 ?auto_284691 ) ) ( not ( = ?auto_284688 ?auto_284693 ) ) ( not ( = ?auto_284688 ?auto_284694 ) ) ( not ( = ?auto_284688 ?auto_284695 ) ) ( not ( = ?auto_284688 ?auto_284696 ) ) ( not ( = ?auto_284689 ?auto_284686 ) ) ( not ( = ?auto_284689 ?auto_284690 ) ) ( not ( = ?auto_284689 ?auto_284692 ) ) ( not ( = ?auto_284689 ?auto_284691 ) ) ( not ( = ?auto_284689 ?auto_284693 ) ) ( not ( = ?auto_284689 ?auto_284694 ) ) ( not ( = ?auto_284689 ?auto_284695 ) ) ( not ( = ?auto_284689 ?auto_284696 ) ) ( not ( = ?auto_284686 ?auto_284690 ) ) ( not ( = ?auto_284686 ?auto_284692 ) ) ( not ( = ?auto_284686 ?auto_284691 ) ) ( not ( = ?auto_284686 ?auto_284693 ) ) ( not ( = ?auto_284686 ?auto_284694 ) ) ( not ( = ?auto_284686 ?auto_284695 ) ) ( not ( = ?auto_284686 ?auto_284696 ) ) ( not ( = ?auto_284690 ?auto_284692 ) ) ( not ( = ?auto_284690 ?auto_284691 ) ) ( not ( = ?auto_284690 ?auto_284693 ) ) ( not ( = ?auto_284690 ?auto_284694 ) ) ( not ( = ?auto_284690 ?auto_284695 ) ) ( not ( = ?auto_284690 ?auto_284696 ) ) ( not ( = ?auto_284692 ?auto_284691 ) ) ( not ( = ?auto_284692 ?auto_284693 ) ) ( not ( = ?auto_284692 ?auto_284694 ) ) ( not ( = ?auto_284692 ?auto_284695 ) ) ( not ( = ?auto_284692 ?auto_284696 ) ) ( not ( = ?auto_284691 ?auto_284693 ) ) ( not ( = ?auto_284691 ?auto_284694 ) ) ( not ( = ?auto_284691 ?auto_284695 ) ) ( not ( = ?auto_284691 ?auto_284696 ) ) ( not ( = ?auto_284693 ?auto_284694 ) ) ( not ( = ?auto_284693 ?auto_284695 ) ) ( not ( = ?auto_284693 ?auto_284696 ) ) ( not ( = ?auto_284694 ?auto_284695 ) ) ( not ( = ?auto_284694 ?auto_284696 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_284695 ?auto_284696 )
      ( MAKE-10CRATE-VERIFY ?auto_284687 ?auto_284688 ?auto_284689 ?auto_284686 ?auto_284690 ?auto_284692 ?auto_284691 ?auto_284693 ?auto_284694 ?auto_284695 ?auto_284696 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_284781 - SURFACE
      ?auto_284782 - SURFACE
      ?auto_284783 - SURFACE
      ?auto_284780 - SURFACE
      ?auto_284784 - SURFACE
      ?auto_284786 - SURFACE
      ?auto_284785 - SURFACE
      ?auto_284787 - SURFACE
      ?auto_284788 - SURFACE
      ?auto_284789 - SURFACE
      ?auto_284790 - SURFACE
    )
    :vars
    (
      ?auto_284792 - HOIST
      ?auto_284793 - PLACE
      ?auto_284791 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_284792 ?auto_284793 ) ( SURFACE-AT ?auto_284789 ?auto_284793 ) ( CLEAR ?auto_284789 ) ( IS-CRATE ?auto_284790 ) ( not ( = ?auto_284789 ?auto_284790 ) ) ( TRUCK-AT ?auto_284791 ?auto_284793 ) ( AVAILABLE ?auto_284792 ) ( IN ?auto_284790 ?auto_284791 ) ( ON ?auto_284789 ?auto_284788 ) ( not ( = ?auto_284788 ?auto_284789 ) ) ( not ( = ?auto_284788 ?auto_284790 ) ) ( ON ?auto_284782 ?auto_284781 ) ( ON ?auto_284783 ?auto_284782 ) ( ON ?auto_284780 ?auto_284783 ) ( ON ?auto_284784 ?auto_284780 ) ( ON ?auto_284786 ?auto_284784 ) ( ON ?auto_284785 ?auto_284786 ) ( ON ?auto_284787 ?auto_284785 ) ( ON ?auto_284788 ?auto_284787 ) ( not ( = ?auto_284781 ?auto_284782 ) ) ( not ( = ?auto_284781 ?auto_284783 ) ) ( not ( = ?auto_284781 ?auto_284780 ) ) ( not ( = ?auto_284781 ?auto_284784 ) ) ( not ( = ?auto_284781 ?auto_284786 ) ) ( not ( = ?auto_284781 ?auto_284785 ) ) ( not ( = ?auto_284781 ?auto_284787 ) ) ( not ( = ?auto_284781 ?auto_284788 ) ) ( not ( = ?auto_284781 ?auto_284789 ) ) ( not ( = ?auto_284781 ?auto_284790 ) ) ( not ( = ?auto_284782 ?auto_284783 ) ) ( not ( = ?auto_284782 ?auto_284780 ) ) ( not ( = ?auto_284782 ?auto_284784 ) ) ( not ( = ?auto_284782 ?auto_284786 ) ) ( not ( = ?auto_284782 ?auto_284785 ) ) ( not ( = ?auto_284782 ?auto_284787 ) ) ( not ( = ?auto_284782 ?auto_284788 ) ) ( not ( = ?auto_284782 ?auto_284789 ) ) ( not ( = ?auto_284782 ?auto_284790 ) ) ( not ( = ?auto_284783 ?auto_284780 ) ) ( not ( = ?auto_284783 ?auto_284784 ) ) ( not ( = ?auto_284783 ?auto_284786 ) ) ( not ( = ?auto_284783 ?auto_284785 ) ) ( not ( = ?auto_284783 ?auto_284787 ) ) ( not ( = ?auto_284783 ?auto_284788 ) ) ( not ( = ?auto_284783 ?auto_284789 ) ) ( not ( = ?auto_284783 ?auto_284790 ) ) ( not ( = ?auto_284780 ?auto_284784 ) ) ( not ( = ?auto_284780 ?auto_284786 ) ) ( not ( = ?auto_284780 ?auto_284785 ) ) ( not ( = ?auto_284780 ?auto_284787 ) ) ( not ( = ?auto_284780 ?auto_284788 ) ) ( not ( = ?auto_284780 ?auto_284789 ) ) ( not ( = ?auto_284780 ?auto_284790 ) ) ( not ( = ?auto_284784 ?auto_284786 ) ) ( not ( = ?auto_284784 ?auto_284785 ) ) ( not ( = ?auto_284784 ?auto_284787 ) ) ( not ( = ?auto_284784 ?auto_284788 ) ) ( not ( = ?auto_284784 ?auto_284789 ) ) ( not ( = ?auto_284784 ?auto_284790 ) ) ( not ( = ?auto_284786 ?auto_284785 ) ) ( not ( = ?auto_284786 ?auto_284787 ) ) ( not ( = ?auto_284786 ?auto_284788 ) ) ( not ( = ?auto_284786 ?auto_284789 ) ) ( not ( = ?auto_284786 ?auto_284790 ) ) ( not ( = ?auto_284785 ?auto_284787 ) ) ( not ( = ?auto_284785 ?auto_284788 ) ) ( not ( = ?auto_284785 ?auto_284789 ) ) ( not ( = ?auto_284785 ?auto_284790 ) ) ( not ( = ?auto_284787 ?auto_284788 ) ) ( not ( = ?auto_284787 ?auto_284789 ) ) ( not ( = ?auto_284787 ?auto_284790 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_284788 ?auto_284789 ?auto_284790 )
      ( MAKE-10CRATE-VERIFY ?auto_284781 ?auto_284782 ?auto_284783 ?auto_284780 ?auto_284784 ?auto_284786 ?auto_284785 ?auto_284787 ?auto_284788 ?auto_284789 ?auto_284790 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_284886 - SURFACE
      ?auto_284887 - SURFACE
      ?auto_284888 - SURFACE
      ?auto_284885 - SURFACE
      ?auto_284889 - SURFACE
      ?auto_284891 - SURFACE
      ?auto_284890 - SURFACE
      ?auto_284892 - SURFACE
      ?auto_284893 - SURFACE
      ?auto_284894 - SURFACE
      ?auto_284895 - SURFACE
    )
    :vars
    (
      ?auto_284898 - HOIST
      ?auto_284897 - PLACE
      ?auto_284899 - TRUCK
      ?auto_284896 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_284898 ?auto_284897 ) ( SURFACE-AT ?auto_284894 ?auto_284897 ) ( CLEAR ?auto_284894 ) ( IS-CRATE ?auto_284895 ) ( not ( = ?auto_284894 ?auto_284895 ) ) ( AVAILABLE ?auto_284898 ) ( IN ?auto_284895 ?auto_284899 ) ( ON ?auto_284894 ?auto_284893 ) ( not ( = ?auto_284893 ?auto_284894 ) ) ( not ( = ?auto_284893 ?auto_284895 ) ) ( TRUCK-AT ?auto_284899 ?auto_284896 ) ( not ( = ?auto_284896 ?auto_284897 ) ) ( ON ?auto_284887 ?auto_284886 ) ( ON ?auto_284888 ?auto_284887 ) ( ON ?auto_284885 ?auto_284888 ) ( ON ?auto_284889 ?auto_284885 ) ( ON ?auto_284891 ?auto_284889 ) ( ON ?auto_284890 ?auto_284891 ) ( ON ?auto_284892 ?auto_284890 ) ( ON ?auto_284893 ?auto_284892 ) ( not ( = ?auto_284886 ?auto_284887 ) ) ( not ( = ?auto_284886 ?auto_284888 ) ) ( not ( = ?auto_284886 ?auto_284885 ) ) ( not ( = ?auto_284886 ?auto_284889 ) ) ( not ( = ?auto_284886 ?auto_284891 ) ) ( not ( = ?auto_284886 ?auto_284890 ) ) ( not ( = ?auto_284886 ?auto_284892 ) ) ( not ( = ?auto_284886 ?auto_284893 ) ) ( not ( = ?auto_284886 ?auto_284894 ) ) ( not ( = ?auto_284886 ?auto_284895 ) ) ( not ( = ?auto_284887 ?auto_284888 ) ) ( not ( = ?auto_284887 ?auto_284885 ) ) ( not ( = ?auto_284887 ?auto_284889 ) ) ( not ( = ?auto_284887 ?auto_284891 ) ) ( not ( = ?auto_284887 ?auto_284890 ) ) ( not ( = ?auto_284887 ?auto_284892 ) ) ( not ( = ?auto_284887 ?auto_284893 ) ) ( not ( = ?auto_284887 ?auto_284894 ) ) ( not ( = ?auto_284887 ?auto_284895 ) ) ( not ( = ?auto_284888 ?auto_284885 ) ) ( not ( = ?auto_284888 ?auto_284889 ) ) ( not ( = ?auto_284888 ?auto_284891 ) ) ( not ( = ?auto_284888 ?auto_284890 ) ) ( not ( = ?auto_284888 ?auto_284892 ) ) ( not ( = ?auto_284888 ?auto_284893 ) ) ( not ( = ?auto_284888 ?auto_284894 ) ) ( not ( = ?auto_284888 ?auto_284895 ) ) ( not ( = ?auto_284885 ?auto_284889 ) ) ( not ( = ?auto_284885 ?auto_284891 ) ) ( not ( = ?auto_284885 ?auto_284890 ) ) ( not ( = ?auto_284885 ?auto_284892 ) ) ( not ( = ?auto_284885 ?auto_284893 ) ) ( not ( = ?auto_284885 ?auto_284894 ) ) ( not ( = ?auto_284885 ?auto_284895 ) ) ( not ( = ?auto_284889 ?auto_284891 ) ) ( not ( = ?auto_284889 ?auto_284890 ) ) ( not ( = ?auto_284889 ?auto_284892 ) ) ( not ( = ?auto_284889 ?auto_284893 ) ) ( not ( = ?auto_284889 ?auto_284894 ) ) ( not ( = ?auto_284889 ?auto_284895 ) ) ( not ( = ?auto_284891 ?auto_284890 ) ) ( not ( = ?auto_284891 ?auto_284892 ) ) ( not ( = ?auto_284891 ?auto_284893 ) ) ( not ( = ?auto_284891 ?auto_284894 ) ) ( not ( = ?auto_284891 ?auto_284895 ) ) ( not ( = ?auto_284890 ?auto_284892 ) ) ( not ( = ?auto_284890 ?auto_284893 ) ) ( not ( = ?auto_284890 ?auto_284894 ) ) ( not ( = ?auto_284890 ?auto_284895 ) ) ( not ( = ?auto_284892 ?auto_284893 ) ) ( not ( = ?auto_284892 ?auto_284894 ) ) ( not ( = ?auto_284892 ?auto_284895 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_284893 ?auto_284894 ?auto_284895 )
      ( MAKE-10CRATE-VERIFY ?auto_284886 ?auto_284887 ?auto_284888 ?auto_284885 ?auto_284889 ?auto_284891 ?auto_284890 ?auto_284892 ?auto_284893 ?auto_284894 ?auto_284895 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_285001 - SURFACE
      ?auto_285002 - SURFACE
      ?auto_285003 - SURFACE
      ?auto_285000 - SURFACE
      ?auto_285004 - SURFACE
      ?auto_285006 - SURFACE
      ?auto_285005 - SURFACE
      ?auto_285007 - SURFACE
      ?auto_285008 - SURFACE
      ?auto_285009 - SURFACE
      ?auto_285010 - SURFACE
    )
    :vars
    (
      ?auto_285012 - HOIST
      ?auto_285011 - PLACE
      ?auto_285015 - TRUCK
      ?auto_285013 - PLACE
      ?auto_285014 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_285012 ?auto_285011 ) ( SURFACE-AT ?auto_285009 ?auto_285011 ) ( CLEAR ?auto_285009 ) ( IS-CRATE ?auto_285010 ) ( not ( = ?auto_285009 ?auto_285010 ) ) ( AVAILABLE ?auto_285012 ) ( ON ?auto_285009 ?auto_285008 ) ( not ( = ?auto_285008 ?auto_285009 ) ) ( not ( = ?auto_285008 ?auto_285010 ) ) ( TRUCK-AT ?auto_285015 ?auto_285013 ) ( not ( = ?auto_285013 ?auto_285011 ) ) ( HOIST-AT ?auto_285014 ?auto_285013 ) ( LIFTING ?auto_285014 ?auto_285010 ) ( not ( = ?auto_285012 ?auto_285014 ) ) ( ON ?auto_285002 ?auto_285001 ) ( ON ?auto_285003 ?auto_285002 ) ( ON ?auto_285000 ?auto_285003 ) ( ON ?auto_285004 ?auto_285000 ) ( ON ?auto_285006 ?auto_285004 ) ( ON ?auto_285005 ?auto_285006 ) ( ON ?auto_285007 ?auto_285005 ) ( ON ?auto_285008 ?auto_285007 ) ( not ( = ?auto_285001 ?auto_285002 ) ) ( not ( = ?auto_285001 ?auto_285003 ) ) ( not ( = ?auto_285001 ?auto_285000 ) ) ( not ( = ?auto_285001 ?auto_285004 ) ) ( not ( = ?auto_285001 ?auto_285006 ) ) ( not ( = ?auto_285001 ?auto_285005 ) ) ( not ( = ?auto_285001 ?auto_285007 ) ) ( not ( = ?auto_285001 ?auto_285008 ) ) ( not ( = ?auto_285001 ?auto_285009 ) ) ( not ( = ?auto_285001 ?auto_285010 ) ) ( not ( = ?auto_285002 ?auto_285003 ) ) ( not ( = ?auto_285002 ?auto_285000 ) ) ( not ( = ?auto_285002 ?auto_285004 ) ) ( not ( = ?auto_285002 ?auto_285006 ) ) ( not ( = ?auto_285002 ?auto_285005 ) ) ( not ( = ?auto_285002 ?auto_285007 ) ) ( not ( = ?auto_285002 ?auto_285008 ) ) ( not ( = ?auto_285002 ?auto_285009 ) ) ( not ( = ?auto_285002 ?auto_285010 ) ) ( not ( = ?auto_285003 ?auto_285000 ) ) ( not ( = ?auto_285003 ?auto_285004 ) ) ( not ( = ?auto_285003 ?auto_285006 ) ) ( not ( = ?auto_285003 ?auto_285005 ) ) ( not ( = ?auto_285003 ?auto_285007 ) ) ( not ( = ?auto_285003 ?auto_285008 ) ) ( not ( = ?auto_285003 ?auto_285009 ) ) ( not ( = ?auto_285003 ?auto_285010 ) ) ( not ( = ?auto_285000 ?auto_285004 ) ) ( not ( = ?auto_285000 ?auto_285006 ) ) ( not ( = ?auto_285000 ?auto_285005 ) ) ( not ( = ?auto_285000 ?auto_285007 ) ) ( not ( = ?auto_285000 ?auto_285008 ) ) ( not ( = ?auto_285000 ?auto_285009 ) ) ( not ( = ?auto_285000 ?auto_285010 ) ) ( not ( = ?auto_285004 ?auto_285006 ) ) ( not ( = ?auto_285004 ?auto_285005 ) ) ( not ( = ?auto_285004 ?auto_285007 ) ) ( not ( = ?auto_285004 ?auto_285008 ) ) ( not ( = ?auto_285004 ?auto_285009 ) ) ( not ( = ?auto_285004 ?auto_285010 ) ) ( not ( = ?auto_285006 ?auto_285005 ) ) ( not ( = ?auto_285006 ?auto_285007 ) ) ( not ( = ?auto_285006 ?auto_285008 ) ) ( not ( = ?auto_285006 ?auto_285009 ) ) ( not ( = ?auto_285006 ?auto_285010 ) ) ( not ( = ?auto_285005 ?auto_285007 ) ) ( not ( = ?auto_285005 ?auto_285008 ) ) ( not ( = ?auto_285005 ?auto_285009 ) ) ( not ( = ?auto_285005 ?auto_285010 ) ) ( not ( = ?auto_285007 ?auto_285008 ) ) ( not ( = ?auto_285007 ?auto_285009 ) ) ( not ( = ?auto_285007 ?auto_285010 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285008 ?auto_285009 ?auto_285010 )
      ( MAKE-10CRATE-VERIFY ?auto_285001 ?auto_285002 ?auto_285003 ?auto_285000 ?auto_285004 ?auto_285006 ?auto_285005 ?auto_285007 ?auto_285008 ?auto_285009 ?auto_285010 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_285126 - SURFACE
      ?auto_285127 - SURFACE
      ?auto_285128 - SURFACE
      ?auto_285125 - SURFACE
      ?auto_285129 - SURFACE
      ?auto_285131 - SURFACE
      ?auto_285130 - SURFACE
      ?auto_285132 - SURFACE
      ?auto_285133 - SURFACE
      ?auto_285134 - SURFACE
      ?auto_285135 - SURFACE
    )
    :vars
    (
      ?auto_285138 - HOIST
      ?auto_285136 - PLACE
      ?auto_285139 - TRUCK
      ?auto_285140 - PLACE
      ?auto_285141 - HOIST
      ?auto_285137 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_285138 ?auto_285136 ) ( SURFACE-AT ?auto_285134 ?auto_285136 ) ( CLEAR ?auto_285134 ) ( IS-CRATE ?auto_285135 ) ( not ( = ?auto_285134 ?auto_285135 ) ) ( AVAILABLE ?auto_285138 ) ( ON ?auto_285134 ?auto_285133 ) ( not ( = ?auto_285133 ?auto_285134 ) ) ( not ( = ?auto_285133 ?auto_285135 ) ) ( TRUCK-AT ?auto_285139 ?auto_285140 ) ( not ( = ?auto_285140 ?auto_285136 ) ) ( HOIST-AT ?auto_285141 ?auto_285140 ) ( not ( = ?auto_285138 ?auto_285141 ) ) ( AVAILABLE ?auto_285141 ) ( SURFACE-AT ?auto_285135 ?auto_285140 ) ( ON ?auto_285135 ?auto_285137 ) ( CLEAR ?auto_285135 ) ( not ( = ?auto_285134 ?auto_285137 ) ) ( not ( = ?auto_285135 ?auto_285137 ) ) ( not ( = ?auto_285133 ?auto_285137 ) ) ( ON ?auto_285127 ?auto_285126 ) ( ON ?auto_285128 ?auto_285127 ) ( ON ?auto_285125 ?auto_285128 ) ( ON ?auto_285129 ?auto_285125 ) ( ON ?auto_285131 ?auto_285129 ) ( ON ?auto_285130 ?auto_285131 ) ( ON ?auto_285132 ?auto_285130 ) ( ON ?auto_285133 ?auto_285132 ) ( not ( = ?auto_285126 ?auto_285127 ) ) ( not ( = ?auto_285126 ?auto_285128 ) ) ( not ( = ?auto_285126 ?auto_285125 ) ) ( not ( = ?auto_285126 ?auto_285129 ) ) ( not ( = ?auto_285126 ?auto_285131 ) ) ( not ( = ?auto_285126 ?auto_285130 ) ) ( not ( = ?auto_285126 ?auto_285132 ) ) ( not ( = ?auto_285126 ?auto_285133 ) ) ( not ( = ?auto_285126 ?auto_285134 ) ) ( not ( = ?auto_285126 ?auto_285135 ) ) ( not ( = ?auto_285126 ?auto_285137 ) ) ( not ( = ?auto_285127 ?auto_285128 ) ) ( not ( = ?auto_285127 ?auto_285125 ) ) ( not ( = ?auto_285127 ?auto_285129 ) ) ( not ( = ?auto_285127 ?auto_285131 ) ) ( not ( = ?auto_285127 ?auto_285130 ) ) ( not ( = ?auto_285127 ?auto_285132 ) ) ( not ( = ?auto_285127 ?auto_285133 ) ) ( not ( = ?auto_285127 ?auto_285134 ) ) ( not ( = ?auto_285127 ?auto_285135 ) ) ( not ( = ?auto_285127 ?auto_285137 ) ) ( not ( = ?auto_285128 ?auto_285125 ) ) ( not ( = ?auto_285128 ?auto_285129 ) ) ( not ( = ?auto_285128 ?auto_285131 ) ) ( not ( = ?auto_285128 ?auto_285130 ) ) ( not ( = ?auto_285128 ?auto_285132 ) ) ( not ( = ?auto_285128 ?auto_285133 ) ) ( not ( = ?auto_285128 ?auto_285134 ) ) ( not ( = ?auto_285128 ?auto_285135 ) ) ( not ( = ?auto_285128 ?auto_285137 ) ) ( not ( = ?auto_285125 ?auto_285129 ) ) ( not ( = ?auto_285125 ?auto_285131 ) ) ( not ( = ?auto_285125 ?auto_285130 ) ) ( not ( = ?auto_285125 ?auto_285132 ) ) ( not ( = ?auto_285125 ?auto_285133 ) ) ( not ( = ?auto_285125 ?auto_285134 ) ) ( not ( = ?auto_285125 ?auto_285135 ) ) ( not ( = ?auto_285125 ?auto_285137 ) ) ( not ( = ?auto_285129 ?auto_285131 ) ) ( not ( = ?auto_285129 ?auto_285130 ) ) ( not ( = ?auto_285129 ?auto_285132 ) ) ( not ( = ?auto_285129 ?auto_285133 ) ) ( not ( = ?auto_285129 ?auto_285134 ) ) ( not ( = ?auto_285129 ?auto_285135 ) ) ( not ( = ?auto_285129 ?auto_285137 ) ) ( not ( = ?auto_285131 ?auto_285130 ) ) ( not ( = ?auto_285131 ?auto_285132 ) ) ( not ( = ?auto_285131 ?auto_285133 ) ) ( not ( = ?auto_285131 ?auto_285134 ) ) ( not ( = ?auto_285131 ?auto_285135 ) ) ( not ( = ?auto_285131 ?auto_285137 ) ) ( not ( = ?auto_285130 ?auto_285132 ) ) ( not ( = ?auto_285130 ?auto_285133 ) ) ( not ( = ?auto_285130 ?auto_285134 ) ) ( not ( = ?auto_285130 ?auto_285135 ) ) ( not ( = ?auto_285130 ?auto_285137 ) ) ( not ( = ?auto_285132 ?auto_285133 ) ) ( not ( = ?auto_285132 ?auto_285134 ) ) ( not ( = ?auto_285132 ?auto_285135 ) ) ( not ( = ?auto_285132 ?auto_285137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285133 ?auto_285134 ?auto_285135 )
      ( MAKE-10CRATE-VERIFY ?auto_285126 ?auto_285127 ?auto_285128 ?auto_285125 ?auto_285129 ?auto_285131 ?auto_285130 ?auto_285132 ?auto_285133 ?auto_285134 ?auto_285135 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_285252 - SURFACE
      ?auto_285253 - SURFACE
      ?auto_285254 - SURFACE
      ?auto_285251 - SURFACE
      ?auto_285255 - SURFACE
      ?auto_285257 - SURFACE
      ?auto_285256 - SURFACE
      ?auto_285258 - SURFACE
      ?auto_285259 - SURFACE
      ?auto_285260 - SURFACE
      ?auto_285261 - SURFACE
    )
    :vars
    (
      ?auto_285264 - HOIST
      ?auto_285262 - PLACE
      ?auto_285267 - PLACE
      ?auto_285263 - HOIST
      ?auto_285265 - SURFACE
      ?auto_285266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285264 ?auto_285262 ) ( SURFACE-AT ?auto_285260 ?auto_285262 ) ( CLEAR ?auto_285260 ) ( IS-CRATE ?auto_285261 ) ( not ( = ?auto_285260 ?auto_285261 ) ) ( AVAILABLE ?auto_285264 ) ( ON ?auto_285260 ?auto_285259 ) ( not ( = ?auto_285259 ?auto_285260 ) ) ( not ( = ?auto_285259 ?auto_285261 ) ) ( not ( = ?auto_285267 ?auto_285262 ) ) ( HOIST-AT ?auto_285263 ?auto_285267 ) ( not ( = ?auto_285264 ?auto_285263 ) ) ( AVAILABLE ?auto_285263 ) ( SURFACE-AT ?auto_285261 ?auto_285267 ) ( ON ?auto_285261 ?auto_285265 ) ( CLEAR ?auto_285261 ) ( not ( = ?auto_285260 ?auto_285265 ) ) ( not ( = ?auto_285261 ?auto_285265 ) ) ( not ( = ?auto_285259 ?auto_285265 ) ) ( TRUCK-AT ?auto_285266 ?auto_285262 ) ( ON ?auto_285253 ?auto_285252 ) ( ON ?auto_285254 ?auto_285253 ) ( ON ?auto_285251 ?auto_285254 ) ( ON ?auto_285255 ?auto_285251 ) ( ON ?auto_285257 ?auto_285255 ) ( ON ?auto_285256 ?auto_285257 ) ( ON ?auto_285258 ?auto_285256 ) ( ON ?auto_285259 ?auto_285258 ) ( not ( = ?auto_285252 ?auto_285253 ) ) ( not ( = ?auto_285252 ?auto_285254 ) ) ( not ( = ?auto_285252 ?auto_285251 ) ) ( not ( = ?auto_285252 ?auto_285255 ) ) ( not ( = ?auto_285252 ?auto_285257 ) ) ( not ( = ?auto_285252 ?auto_285256 ) ) ( not ( = ?auto_285252 ?auto_285258 ) ) ( not ( = ?auto_285252 ?auto_285259 ) ) ( not ( = ?auto_285252 ?auto_285260 ) ) ( not ( = ?auto_285252 ?auto_285261 ) ) ( not ( = ?auto_285252 ?auto_285265 ) ) ( not ( = ?auto_285253 ?auto_285254 ) ) ( not ( = ?auto_285253 ?auto_285251 ) ) ( not ( = ?auto_285253 ?auto_285255 ) ) ( not ( = ?auto_285253 ?auto_285257 ) ) ( not ( = ?auto_285253 ?auto_285256 ) ) ( not ( = ?auto_285253 ?auto_285258 ) ) ( not ( = ?auto_285253 ?auto_285259 ) ) ( not ( = ?auto_285253 ?auto_285260 ) ) ( not ( = ?auto_285253 ?auto_285261 ) ) ( not ( = ?auto_285253 ?auto_285265 ) ) ( not ( = ?auto_285254 ?auto_285251 ) ) ( not ( = ?auto_285254 ?auto_285255 ) ) ( not ( = ?auto_285254 ?auto_285257 ) ) ( not ( = ?auto_285254 ?auto_285256 ) ) ( not ( = ?auto_285254 ?auto_285258 ) ) ( not ( = ?auto_285254 ?auto_285259 ) ) ( not ( = ?auto_285254 ?auto_285260 ) ) ( not ( = ?auto_285254 ?auto_285261 ) ) ( not ( = ?auto_285254 ?auto_285265 ) ) ( not ( = ?auto_285251 ?auto_285255 ) ) ( not ( = ?auto_285251 ?auto_285257 ) ) ( not ( = ?auto_285251 ?auto_285256 ) ) ( not ( = ?auto_285251 ?auto_285258 ) ) ( not ( = ?auto_285251 ?auto_285259 ) ) ( not ( = ?auto_285251 ?auto_285260 ) ) ( not ( = ?auto_285251 ?auto_285261 ) ) ( not ( = ?auto_285251 ?auto_285265 ) ) ( not ( = ?auto_285255 ?auto_285257 ) ) ( not ( = ?auto_285255 ?auto_285256 ) ) ( not ( = ?auto_285255 ?auto_285258 ) ) ( not ( = ?auto_285255 ?auto_285259 ) ) ( not ( = ?auto_285255 ?auto_285260 ) ) ( not ( = ?auto_285255 ?auto_285261 ) ) ( not ( = ?auto_285255 ?auto_285265 ) ) ( not ( = ?auto_285257 ?auto_285256 ) ) ( not ( = ?auto_285257 ?auto_285258 ) ) ( not ( = ?auto_285257 ?auto_285259 ) ) ( not ( = ?auto_285257 ?auto_285260 ) ) ( not ( = ?auto_285257 ?auto_285261 ) ) ( not ( = ?auto_285257 ?auto_285265 ) ) ( not ( = ?auto_285256 ?auto_285258 ) ) ( not ( = ?auto_285256 ?auto_285259 ) ) ( not ( = ?auto_285256 ?auto_285260 ) ) ( not ( = ?auto_285256 ?auto_285261 ) ) ( not ( = ?auto_285256 ?auto_285265 ) ) ( not ( = ?auto_285258 ?auto_285259 ) ) ( not ( = ?auto_285258 ?auto_285260 ) ) ( not ( = ?auto_285258 ?auto_285261 ) ) ( not ( = ?auto_285258 ?auto_285265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285259 ?auto_285260 ?auto_285261 )
      ( MAKE-10CRATE-VERIFY ?auto_285252 ?auto_285253 ?auto_285254 ?auto_285251 ?auto_285255 ?auto_285257 ?auto_285256 ?auto_285258 ?auto_285259 ?auto_285260 ?auto_285261 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_285378 - SURFACE
      ?auto_285379 - SURFACE
      ?auto_285380 - SURFACE
      ?auto_285377 - SURFACE
      ?auto_285381 - SURFACE
      ?auto_285383 - SURFACE
      ?auto_285382 - SURFACE
      ?auto_285384 - SURFACE
      ?auto_285385 - SURFACE
      ?auto_285386 - SURFACE
      ?auto_285387 - SURFACE
    )
    :vars
    (
      ?auto_285389 - HOIST
      ?auto_285390 - PLACE
      ?auto_285391 - PLACE
      ?auto_285388 - HOIST
      ?auto_285393 - SURFACE
      ?auto_285392 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285389 ?auto_285390 ) ( IS-CRATE ?auto_285387 ) ( not ( = ?auto_285386 ?auto_285387 ) ) ( not ( = ?auto_285385 ?auto_285386 ) ) ( not ( = ?auto_285385 ?auto_285387 ) ) ( not ( = ?auto_285391 ?auto_285390 ) ) ( HOIST-AT ?auto_285388 ?auto_285391 ) ( not ( = ?auto_285389 ?auto_285388 ) ) ( AVAILABLE ?auto_285388 ) ( SURFACE-AT ?auto_285387 ?auto_285391 ) ( ON ?auto_285387 ?auto_285393 ) ( CLEAR ?auto_285387 ) ( not ( = ?auto_285386 ?auto_285393 ) ) ( not ( = ?auto_285387 ?auto_285393 ) ) ( not ( = ?auto_285385 ?auto_285393 ) ) ( TRUCK-AT ?auto_285392 ?auto_285390 ) ( SURFACE-AT ?auto_285385 ?auto_285390 ) ( CLEAR ?auto_285385 ) ( LIFTING ?auto_285389 ?auto_285386 ) ( IS-CRATE ?auto_285386 ) ( ON ?auto_285379 ?auto_285378 ) ( ON ?auto_285380 ?auto_285379 ) ( ON ?auto_285377 ?auto_285380 ) ( ON ?auto_285381 ?auto_285377 ) ( ON ?auto_285383 ?auto_285381 ) ( ON ?auto_285382 ?auto_285383 ) ( ON ?auto_285384 ?auto_285382 ) ( ON ?auto_285385 ?auto_285384 ) ( not ( = ?auto_285378 ?auto_285379 ) ) ( not ( = ?auto_285378 ?auto_285380 ) ) ( not ( = ?auto_285378 ?auto_285377 ) ) ( not ( = ?auto_285378 ?auto_285381 ) ) ( not ( = ?auto_285378 ?auto_285383 ) ) ( not ( = ?auto_285378 ?auto_285382 ) ) ( not ( = ?auto_285378 ?auto_285384 ) ) ( not ( = ?auto_285378 ?auto_285385 ) ) ( not ( = ?auto_285378 ?auto_285386 ) ) ( not ( = ?auto_285378 ?auto_285387 ) ) ( not ( = ?auto_285378 ?auto_285393 ) ) ( not ( = ?auto_285379 ?auto_285380 ) ) ( not ( = ?auto_285379 ?auto_285377 ) ) ( not ( = ?auto_285379 ?auto_285381 ) ) ( not ( = ?auto_285379 ?auto_285383 ) ) ( not ( = ?auto_285379 ?auto_285382 ) ) ( not ( = ?auto_285379 ?auto_285384 ) ) ( not ( = ?auto_285379 ?auto_285385 ) ) ( not ( = ?auto_285379 ?auto_285386 ) ) ( not ( = ?auto_285379 ?auto_285387 ) ) ( not ( = ?auto_285379 ?auto_285393 ) ) ( not ( = ?auto_285380 ?auto_285377 ) ) ( not ( = ?auto_285380 ?auto_285381 ) ) ( not ( = ?auto_285380 ?auto_285383 ) ) ( not ( = ?auto_285380 ?auto_285382 ) ) ( not ( = ?auto_285380 ?auto_285384 ) ) ( not ( = ?auto_285380 ?auto_285385 ) ) ( not ( = ?auto_285380 ?auto_285386 ) ) ( not ( = ?auto_285380 ?auto_285387 ) ) ( not ( = ?auto_285380 ?auto_285393 ) ) ( not ( = ?auto_285377 ?auto_285381 ) ) ( not ( = ?auto_285377 ?auto_285383 ) ) ( not ( = ?auto_285377 ?auto_285382 ) ) ( not ( = ?auto_285377 ?auto_285384 ) ) ( not ( = ?auto_285377 ?auto_285385 ) ) ( not ( = ?auto_285377 ?auto_285386 ) ) ( not ( = ?auto_285377 ?auto_285387 ) ) ( not ( = ?auto_285377 ?auto_285393 ) ) ( not ( = ?auto_285381 ?auto_285383 ) ) ( not ( = ?auto_285381 ?auto_285382 ) ) ( not ( = ?auto_285381 ?auto_285384 ) ) ( not ( = ?auto_285381 ?auto_285385 ) ) ( not ( = ?auto_285381 ?auto_285386 ) ) ( not ( = ?auto_285381 ?auto_285387 ) ) ( not ( = ?auto_285381 ?auto_285393 ) ) ( not ( = ?auto_285383 ?auto_285382 ) ) ( not ( = ?auto_285383 ?auto_285384 ) ) ( not ( = ?auto_285383 ?auto_285385 ) ) ( not ( = ?auto_285383 ?auto_285386 ) ) ( not ( = ?auto_285383 ?auto_285387 ) ) ( not ( = ?auto_285383 ?auto_285393 ) ) ( not ( = ?auto_285382 ?auto_285384 ) ) ( not ( = ?auto_285382 ?auto_285385 ) ) ( not ( = ?auto_285382 ?auto_285386 ) ) ( not ( = ?auto_285382 ?auto_285387 ) ) ( not ( = ?auto_285382 ?auto_285393 ) ) ( not ( = ?auto_285384 ?auto_285385 ) ) ( not ( = ?auto_285384 ?auto_285386 ) ) ( not ( = ?auto_285384 ?auto_285387 ) ) ( not ( = ?auto_285384 ?auto_285393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285385 ?auto_285386 ?auto_285387 )
      ( MAKE-10CRATE-VERIFY ?auto_285378 ?auto_285379 ?auto_285380 ?auto_285377 ?auto_285381 ?auto_285383 ?auto_285382 ?auto_285384 ?auto_285385 ?auto_285386 ?auto_285387 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_285504 - SURFACE
      ?auto_285505 - SURFACE
      ?auto_285506 - SURFACE
      ?auto_285503 - SURFACE
      ?auto_285507 - SURFACE
      ?auto_285509 - SURFACE
      ?auto_285508 - SURFACE
      ?auto_285510 - SURFACE
      ?auto_285511 - SURFACE
      ?auto_285512 - SURFACE
      ?auto_285513 - SURFACE
    )
    :vars
    (
      ?auto_285518 - HOIST
      ?auto_285516 - PLACE
      ?auto_285514 - PLACE
      ?auto_285519 - HOIST
      ?auto_285515 - SURFACE
      ?auto_285517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285518 ?auto_285516 ) ( IS-CRATE ?auto_285513 ) ( not ( = ?auto_285512 ?auto_285513 ) ) ( not ( = ?auto_285511 ?auto_285512 ) ) ( not ( = ?auto_285511 ?auto_285513 ) ) ( not ( = ?auto_285514 ?auto_285516 ) ) ( HOIST-AT ?auto_285519 ?auto_285514 ) ( not ( = ?auto_285518 ?auto_285519 ) ) ( AVAILABLE ?auto_285519 ) ( SURFACE-AT ?auto_285513 ?auto_285514 ) ( ON ?auto_285513 ?auto_285515 ) ( CLEAR ?auto_285513 ) ( not ( = ?auto_285512 ?auto_285515 ) ) ( not ( = ?auto_285513 ?auto_285515 ) ) ( not ( = ?auto_285511 ?auto_285515 ) ) ( TRUCK-AT ?auto_285517 ?auto_285516 ) ( SURFACE-AT ?auto_285511 ?auto_285516 ) ( CLEAR ?auto_285511 ) ( IS-CRATE ?auto_285512 ) ( AVAILABLE ?auto_285518 ) ( IN ?auto_285512 ?auto_285517 ) ( ON ?auto_285505 ?auto_285504 ) ( ON ?auto_285506 ?auto_285505 ) ( ON ?auto_285503 ?auto_285506 ) ( ON ?auto_285507 ?auto_285503 ) ( ON ?auto_285509 ?auto_285507 ) ( ON ?auto_285508 ?auto_285509 ) ( ON ?auto_285510 ?auto_285508 ) ( ON ?auto_285511 ?auto_285510 ) ( not ( = ?auto_285504 ?auto_285505 ) ) ( not ( = ?auto_285504 ?auto_285506 ) ) ( not ( = ?auto_285504 ?auto_285503 ) ) ( not ( = ?auto_285504 ?auto_285507 ) ) ( not ( = ?auto_285504 ?auto_285509 ) ) ( not ( = ?auto_285504 ?auto_285508 ) ) ( not ( = ?auto_285504 ?auto_285510 ) ) ( not ( = ?auto_285504 ?auto_285511 ) ) ( not ( = ?auto_285504 ?auto_285512 ) ) ( not ( = ?auto_285504 ?auto_285513 ) ) ( not ( = ?auto_285504 ?auto_285515 ) ) ( not ( = ?auto_285505 ?auto_285506 ) ) ( not ( = ?auto_285505 ?auto_285503 ) ) ( not ( = ?auto_285505 ?auto_285507 ) ) ( not ( = ?auto_285505 ?auto_285509 ) ) ( not ( = ?auto_285505 ?auto_285508 ) ) ( not ( = ?auto_285505 ?auto_285510 ) ) ( not ( = ?auto_285505 ?auto_285511 ) ) ( not ( = ?auto_285505 ?auto_285512 ) ) ( not ( = ?auto_285505 ?auto_285513 ) ) ( not ( = ?auto_285505 ?auto_285515 ) ) ( not ( = ?auto_285506 ?auto_285503 ) ) ( not ( = ?auto_285506 ?auto_285507 ) ) ( not ( = ?auto_285506 ?auto_285509 ) ) ( not ( = ?auto_285506 ?auto_285508 ) ) ( not ( = ?auto_285506 ?auto_285510 ) ) ( not ( = ?auto_285506 ?auto_285511 ) ) ( not ( = ?auto_285506 ?auto_285512 ) ) ( not ( = ?auto_285506 ?auto_285513 ) ) ( not ( = ?auto_285506 ?auto_285515 ) ) ( not ( = ?auto_285503 ?auto_285507 ) ) ( not ( = ?auto_285503 ?auto_285509 ) ) ( not ( = ?auto_285503 ?auto_285508 ) ) ( not ( = ?auto_285503 ?auto_285510 ) ) ( not ( = ?auto_285503 ?auto_285511 ) ) ( not ( = ?auto_285503 ?auto_285512 ) ) ( not ( = ?auto_285503 ?auto_285513 ) ) ( not ( = ?auto_285503 ?auto_285515 ) ) ( not ( = ?auto_285507 ?auto_285509 ) ) ( not ( = ?auto_285507 ?auto_285508 ) ) ( not ( = ?auto_285507 ?auto_285510 ) ) ( not ( = ?auto_285507 ?auto_285511 ) ) ( not ( = ?auto_285507 ?auto_285512 ) ) ( not ( = ?auto_285507 ?auto_285513 ) ) ( not ( = ?auto_285507 ?auto_285515 ) ) ( not ( = ?auto_285509 ?auto_285508 ) ) ( not ( = ?auto_285509 ?auto_285510 ) ) ( not ( = ?auto_285509 ?auto_285511 ) ) ( not ( = ?auto_285509 ?auto_285512 ) ) ( not ( = ?auto_285509 ?auto_285513 ) ) ( not ( = ?auto_285509 ?auto_285515 ) ) ( not ( = ?auto_285508 ?auto_285510 ) ) ( not ( = ?auto_285508 ?auto_285511 ) ) ( not ( = ?auto_285508 ?auto_285512 ) ) ( not ( = ?auto_285508 ?auto_285513 ) ) ( not ( = ?auto_285508 ?auto_285515 ) ) ( not ( = ?auto_285510 ?auto_285511 ) ) ( not ( = ?auto_285510 ?auto_285512 ) ) ( not ( = ?auto_285510 ?auto_285513 ) ) ( not ( = ?auto_285510 ?auto_285515 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285511 ?auto_285512 ?auto_285513 )
      ( MAKE-10CRATE-VERIFY ?auto_285504 ?auto_285505 ?auto_285506 ?auto_285503 ?auto_285507 ?auto_285509 ?auto_285508 ?auto_285510 ?auto_285511 ?auto_285512 ?auto_285513 ) )
  )

)

