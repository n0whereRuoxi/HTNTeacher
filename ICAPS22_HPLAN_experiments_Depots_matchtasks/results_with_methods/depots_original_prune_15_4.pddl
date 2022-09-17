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
      ?auto_2021847 - SURFACE
      ?auto_2021848 - SURFACE
    )
    :vars
    (
      ?auto_2021849 - HOIST
      ?auto_2021850 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021849 ?auto_2021850 ) ( SURFACE-AT ?auto_2021847 ?auto_2021850 ) ( CLEAR ?auto_2021847 ) ( LIFTING ?auto_2021849 ?auto_2021848 ) ( IS-CRATE ?auto_2021848 ) ( not ( = ?auto_2021847 ?auto_2021848 ) ) )
    :subtasks
    ( ( !DROP ?auto_2021849 ?auto_2021848 ?auto_2021847 ?auto_2021850 )
      ( MAKE-1CRATE-VERIFY ?auto_2021847 ?auto_2021848 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021851 - SURFACE
      ?auto_2021852 - SURFACE
    )
    :vars
    (
      ?auto_2021854 - HOIST
      ?auto_2021853 - PLACE
      ?auto_2021855 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021854 ?auto_2021853 ) ( SURFACE-AT ?auto_2021851 ?auto_2021853 ) ( CLEAR ?auto_2021851 ) ( IS-CRATE ?auto_2021852 ) ( not ( = ?auto_2021851 ?auto_2021852 ) ) ( TRUCK-AT ?auto_2021855 ?auto_2021853 ) ( AVAILABLE ?auto_2021854 ) ( IN ?auto_2021852 ?auto_2021855 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2021854 ?auto_2021852 ?auto_2021855 ?auto_2021853 )
      ( MAKE-1CRATE ?auto_2021851 ?auto_2021852 )
      ( MAKE-1CRATE-VERIFY ?auto_2021851 ?auto_2021852 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021856 - SURFACE
      ?auto_2021857 - SURFACE
    )
    :vars
    (
      ?auto_2021860 - HOIST
      ?auto_2021859 - PLACE
      ?auto_2021858 - TRUCK
      ?auto_2021861 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021860 ?auto_2021859 ) ( SURFACE-AT ?auto_2021856 ?auto_2021859 ) ( CLEAR ?auto_2021856 ) ( IS-CRATE ?auto_2021857 ) ( not ( = ?auto_2021856 ?auto_2021857 ) ) ( AVAILABLE ?auto_2021860 ) ( IN ?auto_2021857 ?auto_2021858 ) ( TRUCK-AT ?auto_2021858 ?auto_2021861 ) ( not ( = ?auto_2021861 ?auto_2021859 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2021858 ?auto_2021861 ?auto_2021859 )
      ( MAKE-1CRATE ?auto_2021856 ?auto_2021857 )
      ( MAKE-1CRATE-VERIFY ?auto_2021856 ?auto_2021857 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021862 - SURFACE
      ?auto_2021863 - SURFACE
    )
    :vars
    (
      ?auto_2021865 - HOIST
      ?auto_2021867 - PLACE
      ?auto_2021866 - TRUCK
      ?auto_2021864 - PLACE
      ?auto_2021868 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021865 ?auto_2021867 ) ( SURFACE-AT ?auto_2021862 ?auto_2021867 ) ( CLEAR ?auto_2021862 ) ( IS-CRATE ?auto_2021863 ) ( not ( = ?auto_2021862 ?auto_2021863 ) ) ( AVAILABLE ?auto_2021865 ) ( TRUCK-AT ?auto_2021866 ?auto_2021864 ) ( not ( = ?auto_2021864 ?auto_2021867 ) ) ( HOIST-AT ?auto_2021868 ?auto_2021864 ) ( LIFTING ?auto_2021868 ?auto_2021863 ) ( not ( = ?auto_2021865 ?auto_2021868 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2021868 ?auto_2021863 ?auto_2021866 ?auto_2021864 )
      ( MAKE-1CRATE ?auto_2021862 ?auto_2021863 )
      ( MAKE-1CRATE-VERIFY ?auto_2021862 ?auto_2021863 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021869 - SURFACE
      ?auto_2021870 - SURFACE
    )
    :vars
    (
      ?auto_2021872 - HOIST
      ?auto_2021873 - PLACE
      ?auto_2021875 - TRUCK
      ?auto_2021871 - PLACE
      ?auto_2021874 - HOIST
      ?auto_2021876 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021872 ?auto_2021873 ) ( SURFACE-AT ?auto_2021869 ?auto_2021873 ) ( CLEAR ?auto_2021869 ) ( IS-CRATE ?auto_2021870 ) ( not ( = ?auto_2021869 ?auto_2021870 ) ) ( AVAILABLE ?auto_2021872 ) ( TRUCK-AT ?auto_2021875 ?auto_2021871 ) ( not ( = ?auto_2021871 ?auto_2021873 ) ) ( HOIST-AT ?auto_2021874 ?auto_2021871 ) ( not ( = ?auto_2021872 ?auto_2021874 ) ) ( AVAILABLE ?auto_2021874 ) ( SURFACE-AT ?auto_2021870 ?auto_2021871 ) ( ON ?auto_2021870 ?auto_2021876 ) ( CLEAR ?auto_2021870 ) ( not ( = ?auto_2021869 ?auto_2021876 ) ) ( not ( = ?auto_2021870 ?auto_2021876 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2021874 ?auto_2021870 ?auto_2021876 ?auto_2021871 )
      ( MAKE-1CRATE ?auto_2021869 ?auto_2021870 )
      ( MAKE-1CRATE-VERIFY ?auto_2021869 ?auto_2021870 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021877 - SURFACE
      ?auto_2021878 - SURFACE
    )
    :vars
    (
      ?auto_2021880 - HOIST
      ?auto_2021879 - PLACE
      ?auto_2021884 - PLACE
      ?auto_2021882 - HOIST
      ?auto_2021881 - SURFACE
      ?auto_2021883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021880 ?auto_2021879 ) ( SURFACE-AT ?auto_2021877 ?auto_2021879 ) ( CLEAR ?auto_2021877 ) ( IS-CRATE ?auto_2021878 ) ( not ( = ?auto_2021877 ?auto_2021878 ) ) ( AVAILABLE ?auto_2021880 ) ( not ( = ?auto_2021884 ?auto_2021879 ) ) ( HOIST-AT ?auto_2021882 ?auto_2021884 ) ( not ( = ?auto_2021880 ?auto_2021882 ) ) ( AVAILABLE ?auto_2021882 ) ( SURFACE-AT ?auto_2021878 ?auto_2021884 ) ( ON ?auto_2021878 ?auto_2021881 ) ( CLEAR ?auto_2021878 ) ( not ( = ?auto_2021877 ?auto_2021881 ) ) ( not ( = ?auto_2021878 ?auto_2021881 ) ) ( TRUCK-AT ?auto_2021883 ?auto_2021879 ) )
    :subtasks
    ( ( !DRIVE ?auto_2021883 ?auto_2021879 ?auto_2021884 )
      ( MAKE-1CRATE ?auto_2021877 ?auto_2021878 )
      ( MAKE-1CRATE-VERIFY ?auto_2021877 ?auto_2021878 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021894 - SURFACE
      ?auto_2021895 - SURFACE
      ?auto_2021896 - SURFACE
    )
    :vars
    (
      ?auto_2021897 - HOIST
      ?auto_2021898 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021897 ?auto_2021898 ) ( SURFACE-AT ?auto_2021895 ?auto_2021898 ) ( CLEAR ?auto_2021895 ) ( LIFTING ?auto_2021897 ?auto_2021896 ) ( IS-CRATE ?auto_2021896 ) ( not ( = ?auto_2021895 ?auto_2021896 ) ) ( ON ?auto_2021895 ?auto_2021894 ) ( not ( = ?auto_2021894 ?auto_2021895 ) ) ( not ( = ?auto_2021894 ?auto_2021896 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021895 ?auto_2021896 )
      ( MAKE-2CRATE-VERIFY ?auto_2021894 ?auto_2021895 ?auto_2021896 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021904 - SURFACE
      ?auto_2021905 - SURFACE
      ?auto_2021906 - SURFACE
    )
    :vars
    (
      ?auto_2021907 - HOIST
      ?auto_2021909 - PLACE
      ?auto_2021908 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021907 ?auto_2021909 ) ( SURFACE-AT ?auto_2021905 ?auto_2021909 ) ( CLEAR ?auto_2021905 ) ( IS-CRATE ?auto_2021906 ) ( not ( = ?auto_2021905 ?auto_2021906 ) ) ( TRUCK-AT ?auto_2021908 ?auto_2021909 ) ( AVAILABLE ?auto_2021907 ) ( IN ?auto_2021906 ?auto_2021908 ) ( ON ?auto_2021905 ?auto_2021904 ) ( not ( = ?auto_2021904 ?auto_2021905 ) ) ( not ( = ?auto_2021904 ?auto_2021906 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021905 ?auto_2021906 )
      ( MAKE-2CRATE-VERIFY ?auto_2021904 ?auto_2021905 ?auto_2021906 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021910 - SURFACE
      ?auto_2021911 - SURFACE
    )
    :vars
    (
      ?auto_2021913 - HOIST
      ?auto_2021912 - PLACE
      ?auto_2021915 - TRUCK
      ?auto_2021914 - SURFACE
      ?auto_2021916 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021913 ?auto_2021912 ) ( SURFACE-AT ?auto_2021910 ?auto_2021912 ) ( CLEAR ?auto_2021910 ) ( IS-CRATE ?auto_2021911 ) ( not ( = ?auto_2021910 ?auto_2021911 ) ) ( AVAILABLE ?auto_2021913 ) ( IN ?auto_2021911 ?auto_2021915 ) ( ON ?auto_2021910 ?auto_2021914 ) ( not ( = ?auto_2021914 ?auto_2021910 ) ) ( not ( = ?auto_2021914 ?auto_2021911 ) ) ( TRUCK-AT ?auto_2021915 ?auto_2021916 ) ( not ( = ?auto_2021916 ?auto_2021912 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2021915 ?auto_2021916 ?auto_2021912 )
      ( MAKE-2CRATE ?auto_2021914 ?auto_2021910 ?auto_2021911 )
      ( MAKE-1CRATE-VERIFY ?auto_2021910 ?auto_2021911 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021917 - SURFACE
      ?auto_2021918 - SURFACE
      ?auto_2021919 - SURFACE
    )
    :vars
    (
      ?auto_2021921 - HOIST
      ?auto_2021920 - PLACE
      ?auto_2021923 - TRUCK
      ?auto_2021922 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021921 ?auto_2021920 ) ( SURFACE-AT ?auto_2021918 ?auto_2021920 ) ( CLEAR ?auto_2021918 ) ( IS-CRATE ?auto_2021919 ) ( not ( = ?auto_2021918 ?auto_2021919 ) ) ( AVAILABLE ?auto_2021921 ) ( IN ?auto_2021919 ?auto_2021923 ) ( ON ?auto_2021918 ?auto_2021917 ) ( not ( = ?auto_2021917 ?auto_2021918 ) ) ( not ( = ?auto_2021917 ?auto_2021919 ) ) ( TRUCK-AT ?auto_2021923 ?auto_2021922 ) ( not ( = ?auto_2021922 ?auto_2021920 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021918 ?auto_2021919 )
      ( MAKE-2CRATE-VERIFY ?auto_2021917 ?auto_2021918 ?auto_2021919 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021924 - SURFACE
      ?auto_2021925 - SURFACE
    )
    :vars
    (
      ?auto_2021929 - HOIST
      ?auto_2021927 - PLACE
      ?auto_2021930 - SURFACE
      ?auto_2021928 - TRUCK
      ?auto_2021926 - PLACE
      ?auto_2021931 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021929 ?auto_2021927 ) ( SURFACE-AT ?auto_2021924 ?auto_2021927 ) ( CLEAR ?auto_2021924 ) ( IS-CRATE ?auto_2021925 ) ( not ( = ?auto_2021924 ?auto_2021925 ) ) ( AVAILABLE ?auto_2021929 ) ( ON ?auto_2021924 ?auto_2021930 ) ( not ( = ?auto_2021930 ?auto_2021924 ) ) ( not ( = ?auto_2021930 ?auto_2021925 ) ) ( TRUCK-AT ?auto_2021928 ?auto_2021926 ) ( not ( = ?auto_2021926 ?auto_2021927 ) ) ( HOIST-AT ?auto_2021931 ?auto_2021926 ) ( LIFTING ?auto_2021931 ?auto_2021925 ) ( not ( = ?auto_2021929 ?auto_2021931 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2021931 ?auto_2021925 ?auto_2021928 ?auto_2021926 )
      ( MAKE-2CRATE ?auto_2021930 ?auto_2021924 ?auto_2021925 )
      ( MAKE-1CRATE-VERIFY ?auto_2021924 ?auto_2021925 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021932 - SURFACE
      ?auto_2021933 - SURFACE
      ?auto_2021934 - SURFACE
    )
    :vars
    (
      ?auto_2021935 - HOIST
      ?auto_2021936 - PLACE
      ?auto_2021938 - TRUCK
      ?auto_2021939 - PLACE
      ?auto_2021937 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021935 ?auto_2021936 ) ( SURFACE-AT ?auto_2021933 ?auto_2021936 ) ( CLEAR ?auto_2021933 ) ( IS-CRATE ?auto_2021934 ) ( not ( = ?auto_2021933 ?auto_2021934 ) ) ( AVAILABLE ?auto_2021935 ) ( ON ?auto_2021933 ?auto_2021932 ) ( not ( = ?auto_2021932 ?auto_2021933 ) ) ( not ( = ?auto_2021932 ?auto_2021934 ) ) ( TRUCK-AT ?auto_2021938 ?auto_2021939 ) ( not ( = ?auto_2021939 ?auto_2021936 ) ) ( HOIST-AT ?auto_2021937 ?auto_2021939 ) ( LIFTING ?auto_2021937 ?auto_2021934 ) ( not ( = ?auto_2021935 ?auto_2021937 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021933 ?auto_2021934 )
      ( MAKE-2CRATE-VERIFY ?auto_2021932 ?auto_2021933 ?auto_2021934 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021940 - SURFACE
      ?auto_2021941 - SURFACE
    )
    :vars
    (
      ?auto_2021942 - HOIST
      ?auto_2021946 - PLACE
      ?auto_2021947 - SURFACE
      ?auto_2021944 - TRUCK
      ?auto_2021945 - PLACE
      ?auto_2021943 - HOIST
      ?auto_2021948 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021942 ?auto_2021946 ) ( SURFACE-AT ?auto_2021940 ?auto_2021946 ) ( CLEAR ?auto_2021940 ) ( IS-CRATE ?auto_2021941 ) ( not ( = ?auto_2021940 ?auto_2021941 ) ) ( AVAILABLE ?auto_2021942 ) ( ON ?auto_2021940 ?auto_2021947 ) ( not ( = ?auto_2021947 ?auto_2021940 ) ) ( not ( = ?auto_2021947 ?auto_2021941 ) ) ( TRUCK-AT ?auto_2021944 ?auto_2021945 ) ( not ( = ?auto_2021945 ?auto_2021946 ) ) ( HOIST-AT ?auto_2021943 ?auto_2021945 ) ( not ( = ?auto_2021942 ?auto_2021943 ) ) ( AVAILABLE ?auto_2021943 ) ( SURFACE-AT ?auto_2021941 ?auto_2021945 ) ( ON ?auto_2021941 ?auto_2021948 ) ( CLEAR ?auto_2021941 ) ( not ( = ?auto_2021940 ?auto_2021948 ) ) ( not ( = ?auto_2021941 ?auto_2021948 ) ) ( not ( = ?auto_2021947 ?auto_2021948 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2021943 ?auto_2021941 ?auto_2021948 ?auto_2021945 )
      ( MAKE-2CRATE ?auto_2021947 ?auto_2021940 ?auto_2021941 )
      ( MAKE-1CRATE-VERIFY ?auto_2021940 ?auto_2021941 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021949 - SURFACE
      ?auto_2021950 - SURFACE
      ?auto_2021951 - SURFACE
    )
    :vars
    (
      ?auto_2021957 - HOIST
      ?auto_2021956 - PLACE
      ?auto_2021955 - TRUCK
      ?auto_2021952 - PLACE
      ?auto_2021953 - HOIST
      ?auto_2021954 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021957 ?auto_2021956 ) ( SURFACE-AT ?auto_2021950 ?auto_2021956 ) ( CLEAR ?auto_2021950 ) ( IS-CRATE ?auto_2021951 ) ( not ( = ?auto_2021950 ?auto_2021951 ) ) ( AVAILABLE ?auto_2021957 ) ( ON ?auto_2021950 ?auto_2021949 ) ( not ( = ?auto_2021949 ?auto_2021950 ) ) ( not ( = ?auto_2021949 ?auto_2021951 ) ) ( TRUCK-AT ?auto_2021955 ?auto_2021952 ) ( not ( = ?auto_2021952 ?auto_2021956 ) ) ( HOIST-AT ?auto_2021953 ?auto_2021952 ) ( not ( = ?auto_2021957 ?auto_2021953 ) ) ( AVAILABLE ?auto_2021953 ) ( SURFACE-AT ?auto_2021951 ?auto_2021952 ) ( ON ?auto_2021951 ?auto_2021954 ) ( CLEAR ?auto_2021951 ) ( not ( = ?auto_2021950 ?auto_2021954 ) ) ( not ( = ?auto_2021951 ?auto_2021954 ) ) ( not ( = ?auto_2021949 ?auto_2021954 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021950 ?auto_2021951 )
      ( MAKE-2CRATE-VERIFY ?auto_2021949 ?auto_2021950 ?auto_2021951 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021958 - SURFACE
      ?auto_2021959 - SURFACE
    )
    :vars
    (
      ?auto_2021961 - HOIST
      ?auto_2021962 - PLACE
      ?auto_2021965 - SURFACE
      ?auto_2021963 - PLACE
      ?auto_2021960 - HOIST
      ?auto_2021964 - SURFACE
      ?auto_2021966 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021961 ?auto_2021962 ) ( SURFACE-AT ?auto_2021958 ?auto_2021962 ) ( CLEAR ?auto_2021958 ) ( IS-CRATE ?auto_2021959 ) ( not ( = ?auto_2021958 ?auto_2021959 ) ) ( AVAILABLE ?auto_2021961 ) ( ON ?auto_2021958 ?auto_2021965 ) ( not ( = ?auto_2021965 ?auto_2021958 ) ) ( not ( = ?auto_2021965 ?auto_2021959 ) ) ( not ( = ?auto_2021963 ?auto_2021962 ) ) ( HOIST-AT ?auto_2021960 ?auto_2021963 ) ( not ( = ?auto_2021961 ?auto_2021960 ) ) ( AVAILABLE ?auto_2021960 ) ( SURFACE-AT ?auto_2021959 ?auto_2021963 ) ( ON ?auto_2021959 ?auto_2021964 ) ( CLEAR ?auto_2021959 ) ( not ( = ?auto_2021958 ?auto_2021964 ) ) ( not ( = ?auto_2021959 ?auto_2021964 ) ) ( not ( = ?auto_2021965 ?auto_2021964 ) ) ( TRUCK-AT ?auto_2021966 ?auto_2021962 ) )
    :subtasks
    ( ( !DRIVE ?auto_2021966 ?auto_2021962 ?auto_2021963 )
      ( MAKE-2CRATE ?auto_2021965 ?auto_2021958 ?auto_2021959 )
      ( MAKE-1CRATE-VERIFY ?auto_2021958 ?auto_2021959 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021967 - SURFACE
      ?auto_2021968 - SURFACE
      ?auto_2021969 - SURFACE
    )
    :vars
    (
      ?auto_2021974 - HOIST
      ?auto_2021971 - PLACE
      ?auto_2021975 - PLACE
      ?auto_2021970 - HOIST
      ?auto_2021972 - SURFACE
      ?auto_2021973 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021974 ?auto_2021971 ) ( SURFACE-AT ?auto_2021968 ?auto_2021971 ) ( CLEAR ?auto_2021968 ) ( IS-CRATE ?auto_2021969 ) ( not ( = ?auto_2021968 ?auto_2021969 ) ) ( AVAILABLE ?auto_2021974 ) ( ON ?auto_2021968 ?auto_2021967 ) ( not ( = ?auto_2021967 ?auto_2021968 ) ) ( not ( = ?auto_2021967 ?auto_2021969 ) ) ( not ( = ?auto_2021975 ?auto_2021971 ) ) ( HOIST-AT ?auto_2021970 ?auto_2021975 ) ( not ( = ?auto_2021974 ?auto_2021970 ) ) ( AVAILABLE ?auto_2021970 ) ( SURFACE-AT ?auto_2021969 ?auto_2021975 ) ( ON ?auto_2021969 ?auto_2021972 ) ( CLEAR ?auto_2021969 ) ( not ( = ?auto_2021968 ?auto_2021972 ) ) ( not ( = ?auto_2021969 ?auto_2021972 ) ) ( not ( = ?auto_2021967 ?auto_2021972 ) ) ( TRUCK-AT ?auto_2021973 ?auto_2021971 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021968 ?auto_2021969 )
      ( MAKE-2CRATE-VERIFY ?auto_2021967 ?auto_2021968 ?auto_2021969 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021976 - SURFACE
      ?auto_2021977 - SURFACE
    )
    :vars
    (
      ?auto_2021980 - HOIST
      ?auto_2021983 - PLACE
      ?auto_2021979 - SURFACE
      ?auto_2021984 - PLACE
      ?auto_2021978 - HOIST
      ?auto_2021981 - SURFACE
      ?auto_2021982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021980 ?auto_2021983 ) ( IS-CRATE ?auto_2021977 ) ( not ( = ?auto_2021976 ?auto_2021977 ) ) ( not ( = ?auto_2021979 ?auto_2021976 ) ) ( not ( = ?auto_2021979 ?auto_2021977 ) ) ( not ( = ?auto_2021984 ?auto_2021983 ) ) ( HOIST-AT ?auto_2021978 ?auto_2021984 ) ( not ( = ?auto_2021980 ?auto_2021978 ) ) ( AVAILABLE ?auto_2021978 ) ( SURFACE-AT ?auto_2021977 ?auto_2021984 ) ( ON ?auto_2021977 ?auto_2021981 ) ( CLEAR ?auto_2021977 ) ( not ( = ?auto_2021976 ?auto_2021981 ) ) ( not ( = ?auto_2021977 ?auto_2021981 ) ) ( not ( = ?auto_2021979 ?auto_2021981 ) ) ( TRUCK-AT ?auto_2021982 ?auto_2021983 ) ( SURFACE-AT ?auto_2021979 ?auto_2021983 ) ( CLEAR ?auto_2021979 ) ( LIFTING ?auto_2021980 ?auto_2021976 ) ( IS-CRATE ?auto_2021976 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021979 ?auto_2021976 )
      ( MAKE-2CRATE ?auto_2021979 ?auto_2021976 ?auto_2021977 )
      ( MAKE-1CRATE-VERIFY ?auto_2021976 ?auto_2021977 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021985 - SURFACE
      ?auto_2021986 - SURFACE
      ?auto_2021987 - SURFACE
    )
    :vars
    (
      ?auto_2021988 - HOIST
      ?auto_2021992 - PLACE
      ?auto_2021991 - PLACE
      ?auto_2021990 - HOIST
      ?auto_2021989 - SURFACE
      ?auto_2021993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021988 ?auto_2021992 ) ( IS-CRATE ?auto_2021987 ) ( not ( = ?auto_2021986 ?auto_2021987 ) ) ( not ( = ?auto_2021985 ?auto_2021986 ) ) ( not ( = ?auto_2021985 ?auto_2021987 ) ) ( not ( = ?auto_2021991 ?auto_2021992 ) ) ( HOIST-AT ?auto_2021990 ?auto_2021991 ) ( not ( = ?auto_2021988 ?auto_2021990 ) ) ( AVAILABLE ?auto_2021990 ) ( SURFACE-AT ?auto_2021987 ?auto_2021991 ) ( ON ?auto_2021987 ?auto_2021989 ) ( CLEAR ?auto_2021987 ) ( not ( = ?auto_2021986 ?auto_2021989 ) ) ( not ( = ?auto_2021987 ?auto_2021989 ) ) ( not ( = ?auto_2021985 ?auto_2021989 ) ) ( TRUCK-AT ?auto_2021993 ?auto_2021992 ) ( SURFACE-AT ?auto_2021985 ?auto_2021992 ) ( CLEAR ?auto_2021985 ) ( LIFTING ?auto_2021988 ?auto_2021986 ) ( IS-CRATE ?auto_2021986 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2021986 ?auto_2021987 )
      ( MAKE-2CRATE-VERIFY ?auto_2021985 ?auto_2021986 ?auto_2021987 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2021994 - SURFACE
      ?auto_2021995 - SURFACE
    )
    :vars
    (
      ?auto_2021999 - HOIST
      ?auto_2021998 - PLACE
      ?auto_2022002 - SURFACE
      ?auto_2022001 - PLACE
      ?auto_2021997 - HOIST
      ?auto_2021996 - SURFACE
      ?auto_2022000 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021999 ?auto_2021998 ) ( IS-CRATE ?auto_2021995 ) ( not ( = ?auto_2021994 ?auto_2021995 ) ) ( not ( = ?auto_2022002 ?auto_2021994 ) ) ( not ( = ?auto_2022002 ?auto_2021995 ) ) ( not ( = ?auto_2022001 ?auto_2021998 ) ) ( HOIST-AT ?auto_2021997 ?auto_2022001 ) ( not ( = ?auto_2021999 ?auto_2021997 ) ) ( AVAILABLE ?auto_2021997 ) ( SURFACE-AT ?auto_2021995 ?auto_2022001 ) ( ON ?auto_2021995 ?auto_2021996 ) ( CLEAR ?auto_2021995 ) ( not ( = ?auto_2021994 ?auto_2021996 ) ) ( not ( = ?auto_2021995 ?auto_2021996 ) ) ( not ( = ?auto_2022002 ?auto_2021996 ) ) ( TRUCK-AT ?auto_2022000 ?auto_2021998 ) ( SURFACE-AT ?auto_2022002 ?auto_2021998 ) ( CLEAR ?auto_2022002 ) ( IS-CRATE ?auto_2021994 ) ( AVAILABLE ?auto_2021999 ) ( IN ?auto_2021994 ?auto_2022000 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2021999 ?auto_2021994 ?auto_2022000 ?auto_2021998 )
      ( MAKE-2CRATE ?auto_2022002 ?auto_2021994 ?auto_2021995 )
      ( MAKE-1CRATE-VERIFY ?auto_2021994 ?auto_2021995 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2022003 - SURFACE
      ?auto_2022004 - SURFACE
      ?auto_2022005 - SURFACE
    )
    :vars
    (
      ?auto_2022007 - HOIST
      ?auto_2022006 - PLACE
      ?auto_2022008 - PLACE
      ?auto_2022010 - HOIST
      ?auto_2022009 - SURFACE
      ?auto_2022011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022007 ?auto_2022006 ) ( IS-CRATE ?auto_2022005 ) ( not ( = ?auto_2022004 ?auto_2022005 ) ) ( not ( = ?auto_2022003 ?auto_2022004 ) ) ( not ( = ?auto_2022003 ?auto_2022005 ) ) ( not ( = ?auto_2022008 ?auto_2022006 ) ) ( HOIST-AT ?auto_2022010 ?auto_2022008 ) ( not ( = ?auto_2022007 ?auto_2022010 ) ) ( AVAILABLE ?auto_2022010 ) ( SURFACE-AT ?auto_2022005 ?auto_2022008 ) ( ON ?auto_2022005 ?auto_2022009 ) ( CLEAR ?auto_2022005 ) ( not ( = ?auto_2022004 ?auto_2022009 ) ) ( not ( = ?auto_2022005 ?auto_2022009 ) ) ( not ( = ?auto_2022003 ?auto_2022009 ) ) ( TRUCK-AT ?auto_2022011 ?auto_2022006 ) ( SURFACE-AT ?auto_2022003 ?auto_2022006 ) ( CLEAR ?auto_2022003 ) ( IS-CRATE ?auto_2022004 ) ( AVAILABLE ?auto_2022007 ) ( IN ?auto_2022004 ?auto_2022011 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2022004 ?auto_2022005 )
      ( MAKE-2CRATE-VERIFY ?auto_2022003 ?auto_2022004 ?auto_2022005 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2022048 - SURFACE
      ?auto_2022049 - SURFACE
    )
    :vars
    (
      ?auto_2022052 - HOIST
      ?auto_2022054 - PLACE
      ?auto_2022050 - SURFACE
      ?auto_2022056 - PLACE
      ?auto_2022055 - HOIST
      ?auto_2022051 - SURFACE
      ?auto_2022053 - TRUCK
      ?auto_2022057 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022052 ?auto_2022054 ) ( SURFACE-AT ?auto_2022048 ?auto_2022054 ) ( CLEAR ?auto_2022048 ) ( IS-CRATE ?auto_2022049 ) ( not ( = ?auto_2022048 ?auto_2022049 ) ) ( AVAILABLE ?auto_2022052 ) ( ON ?auto_2022048 ?auto_2022050 ) ( not ( = ?auto_2022050 ?auto_2022048 ) ) ( not ( = ?auto_2022050 ?auto_2022049 ) ) ( not ( = ?auto_2022056 ?auto_2022054 ) ) ( HOIST-AT ?auto_2022055 ?auto_2022056 ) ( not ( = ?auto_2022052 ?auto_2022055 ) ) ( AVAILABLE ?auto_2022055 ) ( SURFACE-AT ?auto_2022049 ?auto_2022056 ) ( ON ?auto_2022049 ?auto_2022051 ) ( CLEAR ?auto_2022049 ) ( not ( = ?auto_2022048 ?auto_2022051 ) ) ( not ( = ?auto_2022049 ?auto_2022051 ) ) ( not ( = ?auto_2022050 ?auto_2022051 ) ) ( TRUCK-AT ?auto_2022053 ?auto_2022057 ) ( not ( = ?auto_2022057 ?auto_2022054 ) ) ( not ( = ?auto_2022056 ?auto_2022057 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2022053 ?auto_2022057 ?auto_2022054 )
      ( MAKE-1CRATE ?auto_2022048 ?auto_2022049 )
      ( MAKE-1CRATE-VERIFY ?auto_2022048 ?auto_2022049 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2022088 - SURFACE
      ?auto_2022089 - SURFACE
      ?auto_2022090 - SURFACE
      ?auto_2022087 - SURFACE
    )
    :vars
    (
      ?auto_2022092 - HOIST
      ?auto_2022091 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022092 ?auto_2022091 ) ( SURFACE-AT ?auto_2022090 ?auto_2022091 ) ( CLEAR ?auto_2022090 ) ( LIFTING ?auto_2022092 ?auto_2022087 ) ( IS-CRATE ?auto_2022087 ) ( not ( = ?auto_2022090 ?auto_2022087 ) ) ( ON ?auto_2022089 ?auto_2022088 ) ( ON ?auto_2022090 ?auto_2022089 ) ( not ( = ?auto_2022088 ?auto_2022089 ) ) ( not ( = ?auto_2022088 ?auto_2022090 ) ) ( not ( = ?auto_2022088 ?auto_2022087 ) ) ( not ( = ?auto_2022089 ?auto_2022090 ) ) ( not ( = ?auto_2022089 ?auto_2022087 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2022090 ?auto_2022087 )
      ( MAKE-3CRATE-VERIFY ?auto_2022088 ?auto_2022089 ?auto_2022090 ?auto_2022087 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2022105 - SURFACE
      ?auto_2022106 - SURFACE
      ?auto_2022107 - SURFACE
      ?auto_2022104 - SURFACE
    )
    :vars
    (
      ?auto_2022109 - HOIST
      ?auto_2022110 - PLACE
      ?auto_2022108 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022109 ?auto_2022110 ) ( SURFACE-AT ?auto_2022107 ?auto_2022110 ) ( CLEAR ?auto_2022107 ) ( IS-CRATE ?auto_2022104 ) ( not ( = ?auto_2022107 ?auto_2022104 ) ) ( TRUCK-AT ?auto_2022108 ?auto_2022110 ) ( AVAILABLE ?auto_2022109 ) ( IN ?auto_2022104 ?auto_2022108 ) ( ON ?auto_2022107 ?auto_2022106 ) ( not ( = ?auto_2022106 ?auto_2022107 ) ) ( not ( = ?auto_2022106 ?auto_2022104 ) ) ( ON ?auto_2022106 ?auto_2022105 ) ( not ( = ?auto_2022105 ?auto_2022106 ) ) ( not ( = ?auto_2022105 ?auto_2022107 ) ) ( not ( = ?auto_2022105 ?auto_2022104 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022106 ?auto_2022107 ?auto_2022104 )
      ( MAKE-3CRATE-VERIFY ?auto_2022105 ?auto_2022106 ?auto_2022107 ?auto_2022104 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2022126 - SURFACE
      ?auto_2022127 - SURFACE
      ?auto_2022128 - SURFACE
      ?auto_2022125 - SURFACE
    )
    :vars
    (
      ?auto_2022131 - HOIST
      ?auto_2022130 - PLACE
      ?auto_2022129 - TRUCK
      ?auto_2022132 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022131 ?auto_2022130 ) ( SURFACE-AT ?auto_2022128 ?auto_2022130 ) ( CLEAR ?auto_2022128 ) ( IS-CRATE ?auto_2022125 ) ( not ( = ?auto_2022128 ?auto_2022125 ) ) ( AVAILABLE ?auto_2022131 ) ( IN ?auto_2022125 ?auto_2022129 ) ( ON ?auto_2022128 ?auto_2022127 ) ( not ( = ?auto_2022127 ?auto_2022128 ) ) ( not ( = ?auto_2022127 ?auto_2022125 ) ) ( TRUCK-AT ?auto_2022129 ?auto_2022132 ) ( not ( = ?auto_2022132 ?auto_2022130 ) ) ( ON ?auto_2022127 ?auto_2022126 ) ( not ( = ?auto_2022126 ?auto_2022127 ) ) ( not ( = ?auto_2022126 ?auto_2022128 ) ) ( not ( = ?auto_2022126 ?auto_2022125 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022127 ?auto_2022128 ?auto_2022125 )
      ( MAKE-3CRATE-VERIFY ?auto_2022126 ?auto_2022127 ?auto_2022128 ?auto_2022125 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2022150 - SURFACE
      ?auto_2022151 - SURFACE
      ?auto_2022152 - SURFACE
      ?auto_2022149 - SURFACE
    )
    :vars
    (
      ?auto_2022157 - HOIST
      ?auto_2022154 - PLACE
      ?auto_2022156 - TRUCK
      ?auto_2022153 - PLACE
      ?auto_2022155 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022157 ?auto_2022154 ) ( SURFACE-AT ?auto_2022152 ?auto_2022154 ) ( CLEAR ?auto_2022152 ) ( IS-CRATE ?auto_2022149 ) ( not ( = ?auto_2022152 ?auto_2022149 ) ) ( AVAILABLE ?auto_2022157 ) ( ON ?auto_2022152 ?auto_2022151 ) ( not ( = ?auto_2022151 ?auto_2022152 ) ) ( not ( = ?auto_2022151 ?auto_2022149 ) ) ( TRUCK-AT ?auto_2022156 ?auto_2022153 ) ( not ( = ?auto_2022153 ?auto_2022154 ) ) ( HOIST-AT ?auto_2022155 ?auto_2022153 ) ( LIFTING ?auto_2022155 ?auto_2022149 ) ( not ( = ?auto_2022157 ?auto_2022155 ) ) ( ON ?auto_2022151 ?auto_2022150 ) ( not ( = ?auto_2022150 ?auto_2022151 ) ) ( not ( = ?auto_2022150 ?auto_2022152 ) ) ( not ( = ?auto_2022150 ?auto_2022149 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022151 ?auto_2022152 ?auto_2022149 )
      ( MAKE-3CRATE-VERIFY ?auto_2022150 ?auto_2022151 ?auto_2022152 ?auto_2022149 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2022177 - SURFACE
      ?auto_2022178 - SURFACE
      ?auto_2022179 - SURFACE
      ?auto_2022176 - SURFACE
    )
    :vars
    (
      ?auto_2022181 - HOIST
      ?auto_2022184 - PLACE
      ?auto_2022183 - TRUCK
      ?auto_2022180 - PLACE
      ?auto_2022185 - HOIST
      ?auto_2022182 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022181 ?auto_2022184 ) ( SURFACE-AT ?auto_2022179 ?auto_2022184 ) ( CLEAR ?auto_2022179 ) ( IS-CRATE ?auto_2022176 ) ( not ( = ?auto_2022179 ?auto_2022176 ) ) ( AVAILABLE ?auto_2022181 ) ( ON ?auto_2022179 ?auto_2022178 ) ( not ( = ?auto_2022178 ?auto_2022179 ) ) ( not ( = ?auto_2022178 ?auto_2022176 ) ) ( TRUCK-AT ?auto_2022183 ?auto_2022180 ) ( not ( = ?auto_2022180 ?auto_2022184 ) ) ( HOIST-AT ?auto_2022185 ?auto_2022180 ) ( not ( = ?auto_2022181 ?auto_2022185 ) ) ( AVAILABLE ?auto_2022185 ) ( SURFACE-AT ?auto_2022176 ?auto_2022180 ) ( ON ?auto_2022176 ?auto_2022182 ) ( CLEAR ?auto_2022176 ) ( not ( = ?auto_2022179 ?auto_2022182 ) ) ( not ( = ?auto_2022176 ?auto_2022182 ) ) ( not ( = ?auto_2022178 ?auto_2022182 ) ) ( ON ?auto_2022178 ?auto_2022177 ) ( not ( = ?auto_2022177 ?auto_2022178 ) ) ( not ( = ?auto_2022177 ?auto_2022179 ) ) ( not ( = ?auto_2022177 ?auto_2022176 ) ) ( not ( = ?auto_2022177 ?auto_2022182 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022178 ?auto_2022179 ?auto_2022176 )
      ( MAKE-3CRATE-VERIFY ?auto_2022177 ?auto_2022178 ?auto_2022179 ?auto_2022176 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2022205 - SURFACE
      ?auto_2022206 - SURFACE
      ?auto_2022207 - SURFACE
      ?auto_2022204 - SURFACE
    )
    :vars
    (
      ?auto_2022212 - HOIST
      ?auto_2022213 - PLACE
      ?auto_2022209 - PLACE
      ?auto_2022208 - HOIST
      ?auto_2022210 - SURFACE
      ?auto_2022211 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022212 ?auto_2022213 ) ( SURFACE-AT ?auto_2022207 ?auto_2022213 ) ( CLEAR ?auto_2022207 ) ( IS-CRATE ?auto_2022204 ) ( not ( = ?auto_2022207 ?auto_2022204 ) ) ( AVAILABLE ?auto_2022212 ) ( ON ?auto_2022207 ?auto_2022206 ) ( not ( = ?auto_2022206 ?auto_2022207 ) ) ( not ( = ?auto_2022206 ?auto_2022204 ) ) ( not ( = ?auto_2022209 ?auto_2022213 ) ) ( HOIST-AT ?auto_2022208 ?auto_2022209 ) ( not ( = ?auto_2022212 ?auto_2022208 ) ) ( AVAILABLE ?auto_2022208 ) ( SURFACE-AT ?auto_2022204 ?auto_2022209 ) ( ON ?auto_2022204 ?auto_2022210 ) ( CLEAR ?auto_2022204 ) ( not ( = ?auto_2022207 ?auto_2022210 ) ) ( not ( = ?auto_2022204 ?auto_2022210 ) ) ( not ( = ?auto_2022206 ?auto_2022210 ) ) ( TRUCK-AT ?auto_2022211 ?auto_2022213 ) ( ON ?auto_2022206 ?auto_2022205 ) ( not ( = ?auto_2022205 ?auto_2022206 ) ) ( not ( = ?auto_2022205 ?auto_2022207 ) ) ( not ( = ?auto_2022205 ?auto_2022204 ) ) ( not ( = ?auto_2022205 ?auto_2022210 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022206 ?auto_2022207 ?auto_2022204 )
      ( MAKE-3CRATE-VERIFY ?auto_2022205 ?auto_2022206 ?auto_2022207 ?auto_2022204 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2022233 - SURFACE
      ?auto_2022234 - SURFACE
      ?auto_2022235 - SURFACE
      ?auto_2022232 - SURFACE
    )
    :vars
    (
      ?auto_2022236 - HOIST
      ?auto_2022238 - PLACE
      ?auto_2022240 - PLACE
      ?auto_2022239 - HOIST
      ?auto_2022241 - SURFACE
      ?auto_2022237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022236 ?auto_2022238 ) ( IS-CRATE ?auto_2022232 ) ( not ( = ?auto_2022235 ?auto_2022232 ) ) ( not ( = ?auto_2022234 ?auto_2022235 ) ) ( not ( = ?auto_2022234 ?auto_2022232 ) ) ( not ( = ?auto_2022240 ?auto_2022238 ) ) ( HOIST-AT ?auto_2022239 ?auto_2022240 ) ( not ( = ?auto_2022236 ?auto_2022239 ) ) ( AVAILABLE ?auto_2022239 ) ( SURFACE-AT ?auto_2022232 ?auto_2022240 ) ( ON ?auto_2022232 ?auto_2022241 ) ( CLEAR ?auto_2022232 ) ( not ( = ?auto_2022235 ?auto_2022241 ) ) ( not ( = ?auto_2022232 ?auto_2022241 ) ) ( not ( = ?auto_2022234 ?auto_2022241 ) ) ( TRUCK-AT ?auto_2022237 ?auto_2022238 ) ( SURFACE-AT ?auto_2022234 ?auto_2022238 ) ( CLEAR ?auto_2022234 ) ( LIFTING ?auto_2022236 ?auto_2022235 ) ( IS-CRATE ?auto_2022235 ) ( ON ?auto_2022234 ?auto_2022233 ) ( not ( = ?auto_2022233 ?auto_2022234 ) ) ( not ( = ?auto_2022233 ?auto_2022235 ) ) ( not ( = ?auto_2022233 ?auto_2022232 ) ) ( not ( = ?auto_2022233 ?auto_2022241 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022234 ?auto_2022235 ?auto_2022232 )
      ( MAKE-3CRATE-VERIFY ?auto_2022233 ?auto_2022234 ?auto_2022235 ?auto_2022232 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2022261 - SURFACE
      ?auto_2022262 - SURFACE
      ?auto_2022263 - SURFACE
      ?auto_2022260 - SURFACE
    )
    :vars
    (
      ?auto_2022268 - HOIST
      ?auto_2022269 - PLACE
      ?auto_2022265 - PLACE
      ?auto_2022264 - HOIST
      ?auto_2022267 - SURFACE
      ?auto_2022266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022268 ?auto_2022269 ) ( IS-CRATE ?auto_2022260 ) ( not ( = ?auto_2022263 ?auto_2022260 ) ) ( not ( = ?auto_2022262 ?auto_2022263 ) ) ( not ( = ?auto_2022262 ?auto_2022260 ) ) ( not ( = ?auto_2022265 ?auto_2022269 ) ) ( HOIST-AT ?auto_2022264 ?auto_2022265 ) ( not ( = ?auto_2022268 ?auto_2022264 ) ) ( AVAILABLE ?auto_2022264 ) ( SURFACE-AT ?auto_2022260 ?auto_2022265 ) ( ON ?auto_2022260 ?auto_2022267 ) ( CLEAR ?auto_2022260 ) ( not ( = ?auto_2022263 ?auto_2022267 ) ) ( not ( = ?auto_2022260 ?auto_2022267 ) ) ( not ( = ?auto_2022262 ?auto_2022267 ) ) ( TRUCK-AT ?auto_2022266 ?auto_2022269 ) ( SURFACE-AT ?auto_2022262 ?auto_2022269 ) ( CLEAR ?auto_2022262 ) ( IS-CRATE ?auto_2022263 ) ( AVAILABLE ?auto_2022268 ) ( IN ?auto_2022263 ?auto_2022266 ) ( ON ?auto_2022262 ?auto_2022261 ) ( not ( = ?auto_2022261 ?auto_2022262 ) ) ( not ( = ?auto_2022261 ?auto_2022263 ) ) ( not ( = ?auto_2022261 ?auto_2022260 ) ) ( not ( = ?auto_2022261 ?auto_2022267 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022262 ?auto_2022263 ?auto_2022260 )
      ( MAKE-3CRATE-VERIFY ?auto_2022261 ?auto_2022262 ?auto_2022263 ?auto_2022260 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022552 - SURFACE
      ?auto_2022553 - SURFACE
      ?auto_2022554 - SURFACE
      ?auto_2022551 - SURFACE
      ?auto_2022555 - SURFACE
    )
    :vars
    (
      ?auto_2022556 - HOIST
      ?auto_2022557 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022556 ?auto_2022557 ) ( SURFACE-AT ?auto_2022551 ?auto_2022557 ) ( CLEAR ?auto_2022551 ) ( LIFTING ?auto_2022556 ?auto_2022555 ) ( IS-CRATE ?auto_2022555 ) ( not ( = ?auto_2022551 ?auto_2022555 ) ) ( ON ?auto_2022553 ?auto_2022552 ) ( ON ?auto_2022554 ?auto_2022553 ) ( ON ?auto_2022551 ?auto_2022554 ) ( not ( = ?auto_2022552 ?auto_2022553 ) ) ( not ( = ?auto_2022552 ?auto_2022554 ) ) ( not ( = ?auto_2022552 ?auto_2022551 ) ) ( not ( = ?auto_2022552 ?auto_2022555 ) ) ( not ( = ?auto_2022553 ?auto_2022554 ) ) ( not ( = ?auto_2022553 ?auto_2022551 ) ) ( not ( = ?auto_2022553 ?auto_2022555 ) ) ( not ( = ?auto_2022554 ?auto_2022551 ) ) ( not ( = ?auto_2022554 ?auto_2022555 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2022551 ?auto_2022555 )
      ( MAKE-4CRATE-VERIFY ?auto_2022552 ?auto_2022553 ?auto_2022554 ?auto_2022551 ?auto_2022555 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022577 - SURFACE
      ?auto_2022578 - SURFACE
      ?auto_2022579 - SURFACE
      ?auto_2022576 - SURFACE
      ?auto_2022580 - SURFACE
    )
    :vars
    (
      ?auto_2022582 - HOIST
      ?auto_2022581 - PLACE
      ?auto_2022583 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022582 ?auto_2022581 ) ( SURFACE-AT ?auto_2022576 ?auto_2022581 ) ( CLEAR ?auto_2022576 ) ( IS-CRATE ?auto_2022580 ) ( not ( = ?auto_2022576 ?auto_2022580 ) ) ( TRUCK-AT ?auto_2022583 ?auto_2022581 ) ( AVAILABLE ?auto_2022582 ) ( IN ?auto_2022580 ?auto_2022583 ) ( ON ?auto_2022576 ?auto_2022579 ) ( not ( = ?auto_2022579 ?auto_2022576 ) ) ( not ( = ?auto_2022579 ?auto_2022580 ) ) ( ON ?auto_2022578 ?auto_2022577 ) ( ON ?auto_2022579 ?auto_2022578 ) ( not ( = ?auto_2022577 ?auto_2022578 ) ) ( not ( = ?auto_2022577 ?auto_2022579 ) ) ( not ( = ?auto_2022577 ?auto_2022576 ) ) ( not ( = ?auto_2022577 ?auto_2022580 ) ) ( not ( = ?auto_2022578 ?auto_2022579 ) ) ( not ( = ?auto_2022578 ?auto_2022576 ) ) ( not ( = ?auto_2022578 ?auto_2022580 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022579 ?auto_2022576 ?auto_2022580 )
      ( MAKE-4CRATE-VERIFY ?auto_2022577 ?auto_2022578 ?auto_2022579 ?auto_2022576 ?auto_2022580 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022607 - SURFACE
      ?auto_2022608 - SURFACE
      ?auto_2022609 - SURFACE
      ?auto_2022606 - SURFACE
      ?auto_2022610 - SURFACE
    )
    :vars
    (
      ?auto_2022612 - HOIST
      ?auto_2022613 - PLACE
      ?auto_2022611 - TRUCK
      ?auto_2022614 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022612 ?auto_2022613 ) ( SURFACE-AT ?auto_2022606 ?auto_2022613 ) ( CLEAR ?auto_2022606 ) ( IS-CRATE ?auto_2022610 ) ( not ( = ?auto_2022606 ?auto_2022610 ) ) ( AVAILABLE ?auto_2022612 ) ( IN ?auto_2022610 ?auto_2022611 ) ( ON ?auto_2022606 ?auto_2022609 ) ( not ( = ?auto_2022609 ?auto_2022606 ) ) ( not ( = ?auto_2022609 ?auto_2022610 ) ) ( TRUCK-AT ?auto_2022611 ?auto_2022614 ) ( not ( = ?auto_2022614 ?auto_2022613 ) ) ( ON ?auto_2022608 ?auto_2022607 ) ( ON ?auto_2022609 ?auto_2022608 ) ( not ( = ?auto_2022607 ?auto_2022608 ) ) ( not ( = ?auto_2022607 ?auto_2022609 ) ) ( not ( = ?auto_2022607 ?auto_2022606 ) ) ( not ( = ?auto_2022607 ?auto_2022610 ) ) ( not ( = ?auto_2022608 ?auto_2022609 ) ) ( not ( = ?auto_2022608 ?auto_2022606 ) ) ( not ( = ?auto_2022608 ?auto_2022610 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022609 ?auto_2022606 ?auto_2022610 )
      ( MAKE-4CRATE-VERIFY ?auto_2022607 ?auto_2022608 ?auto_2022609 ?auto_2022606 ?auto_2022610 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022641 - SURFACE
      ?auto_2022642 - SURFACE
      ?auto_2022643 - SURFACE
      ?auto_2022640 - SURFACE
      ?auto_2022644 - SURFACE
    )
    :vars
    (
      ?auto_2022647 - HOIST
      ?auto_2022649 - PLACE
      ?auto_2022646 - TRUCK
      ?auto_2022648 - PLACE
      ?auto_2022645 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022647 ?auto_2022649 ) ( SURFACE-AT ?auto_2022640 ?auto_2022649 ) ( CLEAR ?auto_2022640 ) ( IS-CRATE ?auto_2022644 ) ( not ( = ?auto_2022640 ?auto_2022644 ) ) ( AVAILABLE ?auto_2022647 ) ( ON ?auto_2022640 ?auto_2022643 ) ( not ( = ?auto_2022643 ?auto_2022640 ) ) ( not ( = ?auto_2022643 ?auto_2022644 ) ) ( TRUCK-AT ?auto_2022646 ?auto_2022648 ) ( not ( = ?auto_2022648 ?auto_2022649 ) ) ( HOIST-AT ?auto_2022645 ?auto_2022648 ) ( LIFTING ?auto_2022645 ?auto_2022644 ) ( not ( = ?auto_2022647 ?auto_2022645 ) ) ( ON ?auto_2022642 ?auto_2022641 ) ( ON ?auto_2022643 ?auto_2022642 ) ( not ( = ?auto_2022641 ?auto_2022642 ) ) ( not ( = ?auto_2022641 ?auto_2022643 ) ) ( not ( = ?auto_2022641 ?auto_2022640 ) ) ( not ( = ?auto_2022641 ?auto_2022644 ) ) ( not ( = ?auto_2022642 ?auto_2022643 ) ) ( not ( = ?auto_2022642 ?auto_2022640 ) ) ( not ( = ?auto_2022642 ?auto_2022644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022643 ?auto_2022640 ?auto_2022644 )
      ( MAKE-4CRATE-VERIFY ?auto_2022641 ?auto_2022642 ?auto_2022643 ?auto_2022640 ?auto_2022644 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022679 - SURFACE
      ?auto_2022680 - SURFACE
      ?auto_2022681 - SURFACE
      ?auto_2022678 - SURFACE
      ?auto_2022682 - SURFACE
    )
    :vars
    (
      ?auto_2022687 - HOIST
      ?auto_2022686 - PLACE
      ?auto_2022683 - TRUCK
      ?auto_2022684 - PLACE
      ?auto_2022688 - HOIST
      ?auto_2022685 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022687 ?auto_2022686 ) ( SURFACE-AT ?auto_2022678 ?auto_2022686 ) ( CLEAR ?auto_2022678 ) ( IS-CRATE ?auto_2022682 ) ( not ( = ?auto_2022678 ?auto_2022682 ) ) ( AVAILABLE ?auto_2022687 ) ( ON ?auto_2022678 ?auto_2022681 ) ( not ( = ?auto_2022681 ?auto_2022678 ) ) ( not ( = ?auto_2022681 ?auto_2022682 ) ) ( TRUCK-AT ?auto_2022683 ?auto_2022684 ) ( not ( = ?auto_2022684 ?auto_2022686 ) ) ( HOIST-AT ?auto_2022688 ?auto_2022684 ) ( not ( = ?auto_2022687 ?auto_2022688 ) ) ( AVAILABLE ?auto_2022688 ) ( SURFACE-AT ?auto_2022682 ?auto_2022684 ) ( ON ?auto_2022682 ?auto_2022685 ) ( CLEAR ?auto_2022682 ) ( not ( = ?auto_2022678 ?auto_2022685 ) ) ( not ( = ?auto_2022682 ?auto_2022685 ) ) ( not ( = ?auto_2022681 ?auto_2022685 ) ) ( ON ?auto_2022680 ?auto_2022679 ) ( ON ?auto_2022681 ?auto_2022680 ) ( not ( = ?auto_2022679 ?auto_2022680 ) ) ( not ( = ?auto_2022679 ?auto_2022681 ) ) ( not ( = ?auto_2022679 ?auto_2022678 ) ) ( not ( = ?auto_2022679 ?auto_2022682 ) ) ( not ( = ?auto_2022679 ?auto_2022685 ) ) ( not ( = ?auto_2022680 ?auto_2022681 ) ) ( not ( = ?auto_2022680 ?auto_2022678 ) ) ( not ( = ?auto_2022680 ?auto_2022682 ) ) ( not ( = ?auto_2022680 ?auto_2022685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022681 ?auto_2022678 ?auto_2022682 )
      ( MAKE-4CRATE-VERIFY ?auto_2022679 ?auto_2022680 ?auto_2022681 ?auto_2022678 ?auto_2022682 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022718 - SURFACE
      ?auto_2022719 - SURFACE
      ?auto_2022720 - SURFACE
      ?auto_2022717 - SURFACE
      ?auto_2022721 - SURFACE
    )
    :vars
    (
      ?auto_2022725 - HOIST
      ?auto_2022724 - PLACE
      ?auto_2022727 - PLACE
      ?auto_2022726 - HOIST
      ?auto_2022722 - SURFACE
      ?auto_2022723 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022725 ?auto_2022724 ) ( SURFACE-AT ?auto_2022717 ?auto_2022724 ) ( CLEAR ?auto_2022717 ) ( IS-CRATE ?auto_2022721 ) ( not ( = ?auto_2022717 ?auto_2022721 ) ) ( AVAILABLE ?auto_2022725 ) ( ON ?auto_2022717 ?auto_2022720 ) ( not ( = ?auto_2022720 ?auto_2022717 ) ) ( not ( = ?auto_2022720 ?auto_2022721 ) ) ( not ( = ?auto_2022727 ?auto_2022724 ) ) ( HOIST-AT ?auto_2022726 ?auto_2022727 ) ( not ( = ?auto_2022725 ?auto_2022726 ) ) ( AVAILABLE ?auto_2022726 ) ( SURFACE-AT ?auto_2022721 ?auto_2022727 ) ( ON ?auto_2022721 ?auto_2022722 ) ( CLEAR ?auto_2022721 ) ( not ( = ?auto_2022717 ?auto_2022722 ) ) ( not ( = ?auto_2022721 ?auto_2022722 ) ) ( not ( = ?auto_2022720 ?auto_2022722 ) ) ( TRUCK-AT ?auto_2022723 ?auto_2022724 ) ( ON ?auto_2022719 ?auto_2022718 ) ( ON ?auto_2022720 ?auto_2022719 ) ( not ( = ?auto_2022718 ?auto_2022719 ) ) ( not ( = ?auto_2022718 ?auto_2022720 ) ) ( not ( = ?auto_2022718 ?auto_2022717 ) ) ( not ( = ?auto_2022718 ?auto_2022721 ) ) ( not ( = ?auto_2022718 ?auto_2022722 ) ) ( not ( = ?auto_2022719 ?auto_2022720 ) ) ( not ( = ?auto_2022719 ?auto_2022717 ) ) ( not ( = ?auto_2022719 ?auto_2022721 ) ) ( not ( = ?auto_2022719 ?auto_2022722 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022720 ?auto_2022717 ?auto_2022721 )
      ( MAKE-4CRATE-VERIFY ?auto_2022718 ?auto_2022719 ?auto_2022720 ?auto_2022717 ?auto_2022721 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022757 - SURFACE
      ?auto_2022758 - SURFACE
      ?auto_2022759 - SURFACE
      ?auto_2022756 - SURFACE
      ?auto_2022760 - SURFACE
    )
    :vars
    (
      ?auto_2022766 - HOIST
      ?auto_2022764 - PLACE
      ?auto_2022762 - PLACE
      ?auto_2022761 - HOIST
      ?auto_2022763 - SURFACE
      ?auto_2022765 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022766 ?auto_2022764 ) ( IS-CRATE ?auto_2022760 ) ( not ( = ?auto_2022756 ?auto_2022760 ) ) ( not ( = ?auto_2022759 ?auto_2022756 ) ) ( not ( = ?auto_2022759 ?auto_2022760 ) ) ( not ( = ?auto_2022762 ?auto_2022764 ) ) ( HOIST-AT ?auto_2022761 ?auto_2022762 ) ( not ( = ?auto_2022766 ?auto_2022761 ) ) ( AVAILABLE ?auto_2022761 ) ( SURFACE-AT ?auto_2022760 ?auto_2022762 ) ( ON ?auto_2022760 ?auto_2022763 ) ( CLEAR ?auto_2022760 ) ( not ( = ?auto_2022756 ?auto_2022763 ) ) ( not ( = ?auto_2022760 ?auto_2022763 ) ) ( not ( = ?auto_2022759 ?auto_2022763 ) ) ( TRUCK-AT ?auto_2022765 ?auto_2022764 ) ( SURFACE-AT ?auto_2022759 ?auto_2022764 ) ( CLEAR ?auto_2022759 ) ( LIFTING ?auto_2022766 ?auto_2022756 ) ( IS-CRATE ?auto_2022756 ) ( ON ?auto_2022758 ?auto_2022757 ) ( ON ?auto_2022759 ?auto_2022758 ) ( not ( = ?auto_2022757 ?auto_2022758 ) ) ( not ( = ?auto_2022757 ?auto_2022759 ) ) ( not ( = ?auto_2022757 ?auto_2022756 ) ) ( not ( = ?auto_2022757 ?auto_2022760 ) ) ( not ( = ?auto_2022757 ?auto_2022763 ) ) ( not ( = ?auto_2022758 ?auto_2022759 ) ) ( not ( = ?auto_2022758 ?auto_2022756 ) ) ( not ( = ?auto_2022758 ?auto_2022760 ) ) ( not ( = ?auto_2022758 ?auto_2022763 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022759 ?auto_2022756 ?auto_2022760 )
      ( MAKE-4CRATE-VERIFY ?auto_2022757 ?auto_2022758 ?auto_2022759 ?auto_2022756 ?auto_2022760 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2022796 - SURFACE
      ?auto_2022797 - SURFACE
      ?auto_2022798 - SURFACE
      ?auto_2022795 - SURFACE
      ?auto_2022799 - SURFACE
    )
    :vars
    (
      ?auto_2022801 - HOIST
      ?auto_2022803 - PLACE
      ?auto_2022805 - PLACE
      ?auto_2022800 - HOIST
      ?auto_2022802 - SURFACE
      ?auto_2022804 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2022801 ?auto_2022803 ) ( IS-CRATE ?auto_2022799 ) ( not ( = ?auto_2022795 ?auto_2022799 ) ) ( not ( = ?auto_2022798 ?auto_2022795 ) ) ( not ( = ?auto_2022798 ?auto_2022799 ) ) ( not ( = ?auto_2022805 ?auto_2022803 ) ) ( HOIST-AT ?auto_2022800 ?auto_2022805 ) ( not ( = ?auto_2022801 ?auto_2022800 ) ) ( AVAILABLE ?auto_2022800 ) ( SURFACE-AT ?auto_2022799 ?auto_2022805 ) ( ON ?auto_2022799 ?auto_2022802 ) ( CLEAR ?auto_2022799 ) ( not ( = ?auto_2022795 ?auto_2022802 ) ) ( not ( = ?auto_2022799 ?auto_2022802 ) ) ( not ( = ?auto_2022798 ?auto_2022802 ) ) ( TRUCK-AT ?auto_2022804 ?auto_2022803 ) ( SURFACE-AT ?auto_2022798 ?auto_2022803 ) ( CLEAR ?auto_2022798 ) ( IS-CRATE ?auto_2022795 ) ( AVAILABLE ?auto_2022801 ) ( IN ?auto_2022795 ?auto_2022804 ) ( ON ?auto_2022797 ?auto_2022796 ) ( ON ?auto_2022798 ?auto_2022797 ) ( not ( = ?auto_2022796 ?auto_2022797 ) ) ( not ( = ?auto_2022796 ?auto_2022798 ) ) ( not ( = ?auto_2022796 ?auto_2022795 ) ) ( not ( = ?auto_2022796 ?auto_2022799 ) ) ( not ( = ?auto_2022796 ?auto_2022802 ) ) ( not ( = ?auto_2022797 ?auto_2022798 ) ) ( not ( = ?auto_2022797 ?auto_2022795 ) ) ( not ( = ?auto_2022797 ?auto_2022799 ) ) ( not ( = ?auto_2022797 ?auto_2022802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2022798 ?auto_2022795 ?auto_2022799 )
      ( MAKE-4CRATE-VERIFY ?auto_2022796 ?auto_2022797 ?auto_2022798 ?auto_2022795 ?auto_2022799 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2023456 - SURFACE
      ?auto_2023457 - SURFACE
      ?auto_2023458 - SURFACE
      ?auto_2023455 - SURFACE
      ?auto_2023459 - SURFACE
      ?auto_2023460 - SURFACE
    )
    :vars
    (
      ?auto_2023462 - HOIST
      ?auto_2023461 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023462 ?auto_2023461 ) ( SURFACE-AT ?auto_2023459 ?auto_2023461 ) ( CLEAR ?auto_2023459 ) ( LIFTING ?auto_2023462 ?auto_2023460 ) ( IS-CRATE ?auto_2023460 ) ( not ( = ?auto_2023459 ?auto_2023460 ) ) ( ON ?auto_2023457 ?auto_2023456 ) ( ON ?auto_2023458 ?auto_2023457 ) ( ON ?auto_2023455 ?auto_2023458 ) ( ON ?auto_2023459 ?auto_2023455 ) ( not ( = ?auto_2023456 ?auto_2023457 ) ) ( not ( = ?auto_2023456 ?auto_2023458 ) ) ( not ( = ?auto_2023456 ?auto_2023455 ) ) ( not ( = ?auto_2023456 ?auto_2023459 ) ) ( not ( = ?auto_2023456 ?auto_2023460 ) ) ( not ( = ?auto_2023457 ?auto_2023458 ) ) ( not ( = ?auto_2023457 ?auto_2023455 ) ) ( not ( = ?auto_2023457 ?auto_2023459 ) ) ( not ( = ?auto_2023457 ?auto_2023460 ) ) ( not ( = ?auto_2023458 ?auto_2023455 ) ) ( not ( = ?auto_2023458 ?auto_2023459 ) ) ( not ( = ?auto_2023458 ?auto_2023460 ) ) ( not ( = ?auto_2023455 ?auto_2023459 ) ) ( not ( = ?auto_2023455 ?auto_2023460 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2023459 ?auto_2023460 )
      ( MAKE-5CRATE-VERIFY ?auto_2023456 ?auto_2023457 ?auto_2023458 ?auto_2023455 ?auto_2023459 ?auto_2023460 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2023490 - SURFACE
      ?auto_2023491 - SURFACE
      ?auto_2023492 - SURFACE
      ?auto_2023489 - SURFACE
      ?auto_2023493 - SURFACE
      ?auto_2023494 - SURFACE
    )
    :vars
    (
      ?auto_2023496 - HOIST
      ?auto_2023497 - PLACE
      ?auto_2023495 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023496 ?auto_2023497 ) ( SURFACE-AT ?auto_2023493 ?auto_2023497 ) ( CLEAR ?auto_2023493 ) ( IS-CRATE ?auto_2023494 ) ( not ( = ?auto_2023493 ?auto_2023494 ) ) ( TRUCK-AT ?auto_2023495 ?auto_2023497 ) ( AVAILABLE ?auto_2023496 ) ( IN ?auto_2023494 ?auto_2023495 ) ( ON ?auto_2023493 ?auto_2023489 ) ( not ( = ?auto_2023489 ?auto_2023493 ) ) ( not ( = ?auto_2023489 ?auto_2023494 ) ) ( ON ?auto_2023491 ?auto_2023490 ) ( ON ?auto_2023492 ?auto_2023491 ) ( ON ?auto_2023489 ?auto_2023492 ) ( not ( = ?auto_2023490 ?auto_2023491 ) ) ( not ( = ?auto_2023490 ?auto_2023492 ) ) ( not ( = ?auto_2023490 ?auto_2023489 ) ) ( not ( = ?auto_2023490 ?auto_2023493 ) ) ( not ( = ?auto_2023490 ?auto_2023494 ) ) ( not ( = ?auto_2023491 ?auto_2023492 ) ) ( not ( = ?auto_2023491 ?auto_2023489 ) ) ( not ( = ?auto_2023491 ?auto_2023493 ) ) ( not ( = ?auto_2023491 ?auto_2023494 ) ) ( not ( = ?auto_2023492 ?auto_2023489 ) ) ( not ( = ?auto_2023492 ?auto_2023493 ) ) ( not ( = ?auto_2023492 ?auto_2023494 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2023489 ?auto_2023493 ?auto_2023494 )
      ( MAKE-5CRATE-VERIFY ?auto_2023490 ?auto_2023491 ?auto_2023492 ?auto_2023489 ?auto_2023493 ?auto_2023494 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2023530 - SURFACE
      ?auto_2023531 - SURFACE
      ?auto_2023532 - SURFACE
      ?auto_2023529 - SURFACE
      ?auto_2023533 - SURFACE
      ?auto_2023534 - SURFACE
    )
    :vars
    (
      ?auto_2023538 - HOIST
      ?auto_2023536 - PLACE
      ?auto_2023535 - TRUCK
      ?auto_2023537 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023538 ?auto_2023536 ) ( SURFACE-AT ?auto_2023533 ?auto_2023536 ) ( CLEAR ?auto_2023533 ) ( IS-CRATE ?auto_2023534 ) ( not ( = ?auto_2023533 ?auto_2023534 ) ) ( AVAILABLE ?auto_2023538 ) ( IN ?auto_2023534 ?auto_2023535 ) ( ON ?auto_2023533 ?auto_2023529 ) ( not ( = ?auto_2023529 ?auto_2023533 ) ) ( not ( = ?auto_2023529 ?auto_2023534 ) ) ( TRUCK-AT ?auto_2023535 ?auto_2023537 ) ( not ( = ?auto_2023537 ?auto_2023536 ) ) ( ON ?auto_2023531 ?auto_2023530 ) ( ON ?auto_2023532 ?auto_2023531 ) ( ON ?auto_2023529 ?auto_2023532 ) ( not ( = ?auto_2023530 ?auto_2023531 ) ) ( not ( = ?auto_2023530 ?auto_2023532 ) ) ( not ( = ?auto_2023530 ?auto_2023529 ) ) ( not ( = ?auto_2023530 ?auto_2023533 ) ) ( not ( = ?auto_2023530 ?auto_2023534 ) ) ( not ( = ?auto_2023531 ?auto_2023532 ) ) ( not ( = ?auto_2023531 ?auto_2023529 ) ) ( not ( = ?auto_2023531 ?auto_2023533 ) ) ( not ( = ?auto_2023531 ?auto_2023534 ) ) ( not ( = ?auto_2023532 ?auto_2023529 ) ) ( not ( = ?auto_2023532 ?auto_2023533 ) ) ( not ( = ?auto_2023532 ?auto_2023534 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2023529 ?auto_2023533 ?auto_2023534 )
      ( MAKE-5CRATE-VERIFY ?auto_2023530 ?auto_2023531 ?auto_2023532 ?auto_2023529 ?auto_2023533 ?auto_2023534 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2023575 - SURFACE
      ?auto_2023576 - SURFACE
      ?auto_2023577 - SURFACE
      ?auto_2023574 - SURFACE
      ?auto_2023578 - SURFACE
      ?auto_2023579 - SURFACE
    )
    :vars
    (
      ?auto_2023583 - HOIST
      ?auto_2023584 - PLACE
      ?auto_2023581 - TRUCK
      ?auto_2023580 - PLACE
      ?auto_2023582 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023583 ?auto_2023584 ) ( SURFACE-AT ?auto_2023578 ?auto_2023584 ) ( CLEAR ?auto_2023578 ) ( IS-CRATE ?auto_2023579 ) ( not ( = ?auto_2023578 ?auto_2023579 ) ) ( AVAILABLE ?auto_2023583 ) ( ON ?auto_2023578 ?auto_2023574 ) ( not ( = ?auto_2023574 ?auto_2023578 ) ) ( not ( = ?auto_2023574 ?auto_2023579 ) ) ( TRUCK-AT ?auto_2023581 ?auto_2023580 ) ( not ( = ?auto_2023580 ?auto_2023584 ) ) ( HOIST-AT ?auto_2023582 ?auto_2023580 ) ( LIFTING ?auto_2023582 ?auto_2023579 ) ( not ( = ?auto_2023583 ?auto_2023582 ) ) ( ON ?auto_2023576 ?auto_2023575 ) ( ON ?auto_2023577 ?auto_2023576 ) ( ON ?auto_2023574 ?auto_2023577 ) ( not ( = ?auto_2023575 ?auto_2023576 ) ) ( not ( = ?auto_2023575 ?auto_2023577 ) ) ( not ( = ?auto_2023575 ?auto_2023574 ) ) ( not ( = ?auto_2023575 ?auto_2023578 ) ) ( not ( = ?auto_2023575 ?auto_2023579 ) ) ( not ( = ?auto_2023576 ?auto_2023577 ) ) ( not ( = ?auto_2023576 ?auto_2023574 ) ) ( not ( = ?auto_2023576 ?auto_2023578 ) ) ( not ( = ?auto_2023576 ?auto_2023579 ) ) ( not ( = ?auto_2023577 ?auto_2023574 ) ) ( not ( = ?auto_2023577 ?auto_2023578 ) ) ( not ( = ?auto_2023577 ?auto_2023579 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2023574 ?auto_2023578 ?auto_2023579 )
      ( MAKE-5CRATE-VERIFY ?auto_2023575 ?auto_2023576 ?auto_2023577 ?auto_2023574 ?auto_2023578 ?auto_2023579 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2023625 - SURFACE
      ?auto_2023626 - SURFACE
      ?auto_2023627 - SURFACE
      ?auto_2023624 - SURFACE
      ?auto_2023628 - SURFACE
      ?auto_2023629 - SURFACE
    )
    :vars
    (
      ?auto_2023632 - HOIST
      ?auto_2023630 - PLACE
      ?auto_2023633 - TRUCK
      ?auto_2023634 - PLACE
      ?auto_2023635 - HOIST
      ?auto_2023631 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023632 ?auto_2023630 ) ( SURFACE-AT ?auto_2023628 ?auto_2023630 ) ( CLEAR ?auto_2023628 ) ( IS-CRATE ?auto_2023629 ) ( not ( = ?auto_2023628 ?auto_2023629 ) ) ( AVAILABLE ?auto_2023632 ) ( ON ?auto_2023628 ?auto_2023624 ) ( not ( = ?auto_2023624 ?auto_2023628 ) ) ( not ( = ?auto_2023624 ?auto_2023629 ) ) ( TRUCK-AT ?auto_2023633 ?auto_2023634 ) ( not ( = ?auto_2023634 ?auto_2023630 ) ) ( HOIST-AT ?auto_2023635 ?auto_2023634 ) ( not ( = ?auto_2023632 ?auto_2023635 ) ) ( AVAILABLE ?auto_2023635 ) ( SURFACE-AT ?auto_2023629 ?auto_2023634 ) ( ON ?auto_2023629 ?auto_2023631 ) ( CLEAR ?auto_2023629 ) ( not ( = ?auto_2023628 ?auto_2023631 ) ) ( not ( = ?auto_2023629 ?auto_2023631 ) ) ( not ( = ?auto_2023624 ?auto_2023631 ) ) ( ON ?auto_2023626 ?auto_2023625 ) ( ON ?auto_2023627 ?auto_2023626 ) ( ON ?auto_2023624 ?auto_2023627 ) ( not ( = ?auto_2023625 ?auto_2023626 ) ) ( not ( = ?auto_2023625 ?auto_2023627 ) ) ( not ( = ?auto_2023625 ?auto_2023624 ) ) ( not ( = ?auto_2023625 ?auto_2023628 ) ) ( not ( = ?auto_2023625 ?auto_2023629 ) ) ( not ( = ?auto_2023625 ?auto_2023631 ) ) ( not ( = ?auto_2023626 ?auto_2023627 ) ) ( not ( = ?auto_2023626 ?auto_2023624 ) ) ( not ( = ?auto_2023626 ?auto_2023628 ) ) ( not ( = ?auto_2023626 ?auto_2023629 ) ) ( not ( = ?auto_2023626 ?auto_2023631 ) ) ( not ( = ?auto_2023627 ?auto_2023624 ) ) ( not ( = ?auto_2023627 ?auto_2023628 ) ) ( not ( = ?auto_2023627 ?auto_2023629 ) ) ( not ( = ?auto_2023627 ?auto_2023631 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2023624 ?auto_2023628 ?auto_2023629 )
      ( MAKE-5CRATE-VERIFY ?auto_2023625 ?auto_2023626 ?auto_2023627 ?auto_2023624 ?auto_2023628 ?auto_2023629 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2023676 - SURFACE
      ?auto_2023677 - SURFACE
      ?auto_2023678 - SURFACE
      ?auto_2023675 - SURFACE
      ?auto_2023679 - SURFACE
      ?auto_2023680 - SURFACE
    )
    :vars
    (
      ?auto_2023682 - HOIST
      ?auto_2023681 - PLACE
      ?auto_2023686 - PLACE
      ?auto_2023683 - HOIST
      ?auto_2023684 - SURFACE
      ?auto_2023685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023682 ?auto_2023681 ) ( SURFACE-AT ?auto_2023679 ?auto_2023681 ) ( CLEAR ?auto_2023679 ) ( IS-CRATE ?auto_2023680 ) ( not ( = ?auto_2023679 ?auto_2023680 ) ) ( AVAILABLE ?auto_2023682 ) ( ON ?auto_2023679 ?auto_2023675 ) ( not ( = ?auto_2023675 ?auto_2023679 ) ) ( not ( = ?auto_2023675 ?auto_2023680 ) ) ( not ( = ?auto_2023686 ?auto_2023681 ) ) ( HOIST-AT ?auto_2023683 ?auto_2023686 ) ( not ( = ?auto_2023682 ?auto_2023683 ) ) ( AVAILABLE ?auto_2023683 ) ( SURFACE-AT ?auto_2023680 ?auto_2023686 ) ( ON ?auto_2023680 ?auto_2023684 ) ( CLEAR ?auto_2023680 ) ( not ( = ?auto_2023679 ?auto_2023684 ) ) ( not ( = ?auto_2023680 ?auto_2023684 ) ) ( not ( = ?auto_2023675 ?auto_2023684 ) ) ( TRUCK-AT ?auto_2023685 ?auto_2023681 ) ( ON ?auto_2023677 ?auto_2023676 ) ( ON ?auto_2023678 ?auto_2023677 ) ( ON ?auto_2023675 ?auto_2023678 ) ( not ( = ?auto_2023676 ?auto_2023677 ) ) ( not ( = ?auto_2023676 ?auto_2023678 ) ) ( not ( = ?auto_2023676 ?auto_2023675 ) ) ( not ( = ?auto_2023676 ?auto_2023679 ) ) ( not ( = ?auto_2023676 ?auto_2023680 ) ) ( not ( = ?auto_2023676 ?auto_2023684 ) ) ( not ( = ?auto_2023677 ?auto_2023678 ) ) ( not ( = ?auto_2023677 ?auto_2023675 ) ) ( not ( = ?auto_2023677 ?auto_2023679 ) ) ( not ( = ?auto_2023677 ?auto_2023680 ) ) ( not ( = ?auto_2023677 ?auto_2023684 ) ) ( not ( = ?auto_2023678 ?auto_2023675 ) ) ( not ( = ?auto_2023678 ?auto_2023679 ) ) ( not ( = ?auto_2023678 ?auto_2023680 ) ) ( not ( = ?auto_2023678 ?auto_2023684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2023675 ?auto_2023679 ?auto_2023680 )
      ( MAKE-5CRATE-VERIFY ?auto_2023676 ?auto_2023677 ?auto_2023678 ?auto_2023675 ?auto_2023679 ?auto_2023680 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2023727 - SURFACE
      ?auto_2023728 - SURFACE
      ?auto_2023729 - SURFACE
      ?auto_2023726 - SURFACE
      ?auto_2023730 - SURFACE
      ?auto_2023731 - SURFACE
    )
    :vars
    (
      ?auto_2023734 - HOIST
      ?auto_2023735 - PLACE
      ?auto_2023733 - PLACE
      ?auto_2023732 - HOIST
      ?auto_2023737 - SURFACE
      ?auto_2023736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023734 ?auto_2023735 ) ( IS-CRATE ?auto_2023731 ) ( not ( = ?auto_2023730 ?auto_2023731 ) ) ( not ( = ?auto_2023726 ?auto_2023730 ) ) ( not ( = ?auto_2023726 ?auto_2023731 ) ) ( not ( = ?auto_2023733 ?auto_2023735 ) ) ( HOIST-AT ?auto_2023732 ?auto_2023733 ) ( not ( = ?auto_2023734 ?auto_2023732 ) ) ( AVAILABLE ?auto_2023732 ) ( SURFACE-AT ?auto_2023731 ?auto_2023733 ) ( ON ?auto_2023731 ?auto_2023737 ) ( CLEAR ?auto_2023731 ) ( not ( = ?auto_2023730 ?auto_2023737 ) ) ( not ( = ?auto_2023731 ?auto_2023737 ) ) ( not ( = ?auto_2023726 ?auto_2023737 ) ) ( TRUCK-AT ?auto_2023736 ?auto_2023735 ) ( SURFACE-AT ?auto_2023726 ?auto_2023735 ) ( CLEAR ?auto_2023726 ) ( LIFTING ?auto_2023734 ?auto_2023730 ) ( IS-CRATE ?auto_2023730 ) ( ON ?auto_2023728 ?auto_2023727 ) ( ON ?auto_2023729 ?auto_2023728 ) ( ON ?auto_2023726 ?auto_2023729 ) ( not ( = ?auto_2023727 ?auto_2023728 ) ) ( not ( = ?auto_2023727 ?auto_2023729 ) ) ( not ( = ?auto_2023727 ?auto_2023726 ) ) ( not ( = ?auto_2023727 ?auto_2023730 ) ) ( not ( = ?auto_2023727 ?auto_2023731 ) ) ( not ( = ?auto_2023727 ?auto_2023737 ) ) ( not ( = ?auto_2023728 ?auto_2023729 ) ) ( not ( = ?auto_2023728 ?auto_2023726 ) ) ( not ( = ?auto_2023728 ?auto_2023730 ) ) ( not ( = ?auto_2023728 ?auto_2023731 ) ) ( not ( = ?auto_2023728 ?auto_2023737 ) ) ( not ( = ?auto_2023729 ?auto_2023726 ) ) ( not ( = ?auto_2023729 ?auto_2023730 ) ) ( not ( = ?auto_2023729 ?auto_2023731 ) ) ( not ( = ?auto_2023729 ?auto_2023737 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2023726 ?auto_2023730 ?auto_2023731 )
      ( MAKE-5CRATE-VERIFY ?auto_2023727 ?auto_2023728 ?auto_2023729 ?auto_2023726 ?auto_2023730 ?auto_2023731 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2023778 - SURFACE
      ?auto_2023779 - SURFACE
      ?auto_2023780 - SURFACE
      ?auto_2023777 - SURFACE
      ?auto_2023781 - SURFACE
      ?auto_2023782 - SURFACE
    )
    :vars
    (
      ?auto_2023787 - HOIST
      ?auto_2023783 - PLACE
      ?auto_2023785 - PLACE
      ?auto_2023784 - HOIST
      ?auto_2023788 - SURFACE
      ?auto_2023786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2023787 ?auto_2023783 ) ( IS-CRATE ?auto_2023782 ) ( not ( = ?auto_2023781 ?auto_2023782 ) ) ( not ( = ?auto_2023777 ?auto_2023781 ) ) ( not ( = ?auto_2023777 ?auto_2023782 ) ) ( not ( = ?auto_2023785 ?auto_2023783 ) ) ( HOIST-AT ?auto_2023784 ?auto_2023785 ) ( not ( = ?auto_2023787 ?auto_2023784 ) ) ( AVAILABLE ?auto_2023784 ) ( SURFACE-AT ?auto_2023782 ?auto_2023785 ) ( ON ?auto_2023782 ?auto_2023788 ) ( CLEAR ?auto_2023782 ) ( not ( = ?auto_2023781 ?auto_2023788 ) ) ( not ( = ?auto_2023782 ?auto_2023788 ) ) ( not ( = ?auto_2023777 ?auto_2023788 ) ) ( TRUCK-AT ?auto_2023786 ?auto_2023783 ) ( SURFACE-AT ?auto_2023777 ?auto_2023783 ) ( CLEAR ?auto_2023777 ) ( IS-CRATE ?auto_2023781 ) ( AVAILABLE ?auto_2023787 ) ( IN ?auto_2023781 ?auto_2023786 ) ( ON ?auto_2023779 ?auto_2023778 ) ( ON ?auto_2023780 ?auto_2023779 ) ( ON ?auto_2023777 ?auto_2023780 ) ( not ( = ?auto_2023778 ?auto_2023779 ) ) ( not ( = ?auto_2023778 ?auto_2023780 ) ) ( not ( = ?auto_2023778 ?auto_2023777 ) ) ( not ( = ?auto_2023778 ?auto_2023781 ) ) ( not ( = ?auto_2023778 ?auto_2023782 ) ) ( not ( = ?auto_2023778 ?auto_2023788 ) ) ( not ( = ?auto_2023779 ?auto_2023780 ) ) ( not ( = ?auto_2023779 ?auto_2023777 ) ) ( not ( = ?auto_2023779 ?auto_2023781 ) ) ( not ( = ?auto_2023779 ?auto_2023782 ) ) ( not ( = ?auto_2023779 ?auto_2023788 ) ) ( not ( = ?auto_2023780 ?auto_2023777 ) ) ( not ( = ?auto_2023780 ?auto_2023781 ) ) ( not ( = ?auto_2023780 ?auto_2023782 ) ) ( not ( = ?auto_2023780 ?auto_2023788 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2023777 ?auto_2023781 ?auto_2023782 )
      ( MAKE-5CRATE-VERIFY ?auto_2023778 ?auto_2023779 ?auto_2023780 ?auto_2023777 ?auto_2023781 ?auto_2023782 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2024987 - SURFACE
      ?auto_2024988 - SURFACE
      ?auto_2024989 - SURFACE
      ?auto_2024986 - SURFACE
      ?auto_2024990 - SURFACE
      ?auto_2024992 - SURFACE
      ?auto_2024991 - SURFACE
    )
    :vars
    (
      ?auto_2024994 - HOIST
      ?auto_2024993 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2024994 ?auto_2024993 ) ( SURFACE-AT ?auto_2024992 ?auto_2024993 ) ( CLEAR ?auto_2024992 ) ( LIFTING ?auto_2024994 ?auto_2024991 ) ( IS-CRATE ?auto_2024991 ) ( not ( = ?auto_2024992 ?auto_2024991 ) ) ( ON ?auto_2024988 ?auto_2024987 ) ( ON ?auto_2024989 ?auto_2024988 ) ( ON ?auto_2024986 ?auto_2024989 ) ( ON ?auto_2024990 ?auto_2024986 ) ( ON ?auto_2024992 ?auto_2024990 ) ( not ( = ?auto_2024987 ?auto_2024988 ) ) ( not ( = ?auto_2024987 ?auto_2024989 ) ) ( not ( = ?auto_2024987 ?auto_2024986 ) ) ( not ( = ?auto_2024987 ?auto_2024990 ) ) ( not ( = ?auto_2024987 ?auto_2024992 ) ) ( not ( = ?auto_2024987 ?auto_2024991 ) ) ( not ( = ?auto_2024988 ?auto_2024989 ) ) ( not ( = ?auto_2024988 ?auto_2024986 ) ) ( not ( = ?auto_2024988 ?auto_2024990 ) ) ( not ( = ?auto_2024988 ?auto_2024992 ) ) ( not ( = ?auto_2024988 ?auto_2024991 ) ) ( not ( = ?auto_2024989 ?auto_2024986 ) ) ( not ( = ?auto_2024989 ?auto_2024990 ) ) ( not ( = ?auto_2024989 ?auto_2024992 ) ) ( not ( = ?auto_2024989 ?auto_2024991 ) ) ( not ( = ?auto_2024986 ?auto_2024990 ) ) ( not ( = ?auto_2024986 ?auto_2024992 ) ) ( not ( = ?auto_2024986 ?auto_2024991 ) ) ( not ( = ?auto_2024990 ?auto_2024992 ) ) ( not ( = ?auto_2024990 ?auto_2024991 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2024992 ?auto_2024991 )
      ( MAKE-6CRATE-VERIFY ?auto_2024987 ?auto_2024988 ?auto_2024989 ?auto_2024986 ?auto_2024990 ?auto_2024992 ?auto_2024991 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2025031 - SURFACE
      ?auto_2025032 - SURFACE
      ?auto_2025033 - SURFACE
      ?auto_2025030 - SURFACE
      ?auto_2025034 - SURFACE
      ?auto_2025036 - SURFACE
      ?auto_2025035 - SURFACE
    )
    :vars
    (
      ?auto_2025038 - HOIST
      ?auto_2025039 - PLACE
      ?auto_2025037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2025038 ?auto_2025039 ) ( SURFACE-AT ?auto_2025036 ?auto_2025039 ) ( CLEAR ?auto_2025036 ) ( IS-CRATE ?auto_2025035 ) ( not ( = ?auto_2025036 ?auto_2025035 ) ) ( TRUCK-AT ?auto_2025037 ?auto_2025039 ) ( AVAILABLE ?auto_2025038 ) ( IN ?auto_2025035 ?auto_2025037 ) ( ON ?auto_2025036 ?auto_2025034 ) ( not ( = ?auto_2025034 ?auto_2025036 ) ) ( not ( = ?auto_2025034 ?auto_2025035 ) ) ( ON ?auto_2025032 ?auto_2025031 ) ( ON ?auto_2025033 ?auto_2025032 ) ( ON ?auto_2025030 ?auto_2025033 ) ( ON ?auto_2025034 ?auto_2025030 ) ( not ( = ?auto_2025031 ?auto_2025032 ) ) ( not ( = ?auto_2025031 ?auto_2025033 ) ) ( not ( = ?auto_2025031 ?auto_2025030 ) ) ( not ( = ?auto_2025031 ?auto_2025034 ) ) ( not ( = ?auto_2025031 ?auto_2025036 ) ) ( not ( = ?auto_2025031 ?auto_2025035 ) ) ( not ( = ?auto_2025032 ?auto_2025033 ) ) ( not ( = ?auto_2025032 ?auto_2025030 ) ) ( not ( = ?auto_2025032 ?auto_2025034 ) ) ( not ( = ?auto_2025032 ?auto_2025036 ) ) ( not ( = ?auto_2025032 ?auto_2025035 ) ) ( not ( = ?auto_2025033 ?auto_2025030 ) ) ( not ( = ?auto_2025033 ?auto_2025034 ) ) ( not ( = ?auto_2025033 ?auto_2025036 ) ) ( not ( = ?auto_2025033 ?auto_2025035 ) ) ( not ( = ?auto_2025030 ?auto_2025034 ) ) ( not ( = ?auto_2025030 ?auto_2025036 ) ) ( not ( = ?auto_2025030 ?auto_2025035 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2025034 ?auto_2025036 ?auto_2025035 )
      ( MAKE-6CRATE-VERIFY ?auto_2025031 ?auto_2025032 ?auto_2025033 ?auto_2025030 ?auto_2025034 ?auto_2025036 ?auto_2025035 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2025082 - SURFACE
      ?auto_2025083 - SURFACE
      ?auto_2025084 - SURFACE
      ?auto_2025081 - SURFACE
      ?auto_2025085 - SURFACE
      ?auto_2025087 - SURFACE
      ?auto_2025086 - SURFACE
    )
    :vars
    (
      ?auto_2025090 - HOIST
      ?auto_2025088 - PLACE
      ?auto_2025091 - TRUCK
      ?auto_2025089 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2025090 ?auto_2025088 ) ( SURFACE-AT ?auto_2025087 ?auto_2025088 ) ( CLEAR ?auto_2025087 ) ( IS-CRATE ?auto_2025086 ) ( not ( = ?auto_2025087 ?auto_2025086 ) ) ( AVAILABLE ?auto_2025090 ) ( IN ?auto_2025086 ?auto_2025091 ) ( ON ?auto_2025087 ?auto_2025085 ) ( not ( = ?auto_2025085 ?auto_2025087 ) ) ( not ( = ?auto_2025085 ?auto_2025086 ) ) ( TRUCK-AT ?auto_2025091 ?auto_2025089 ) ( not ( = ?auto_2025089 ?auto_2025088 ) ) ( ON ?auto_2025083 ?auto_2025082 ) ( ON ?auto_2025084 ?auto_2025083 ) ( ON ?auto_2025081 ?auto_2025084 ) ( ON ?auto_2025085 ?auto_2025081 ) ( not ( = ?auto_2025082 ?auto_2025083 ) ) ( not ( = ?auto_2025082 ?auto_2025084 ) ) ( not ( = ?auto_2025082 ?auto_2025081 ) ) ( not ( = ?auto_2025082 ?auto_2025085 ) ) ( not ( = ?auto_2025082 ?auto_2025087 ) ) ( not ( = ?auto_2025082 ?auto_2025086 ) ) ( not ( = ?auto_2025083 ?auto_2025084 ) ) ( not ( = ?auto_2025083 ?auto_2025081 ) ) ( not ( = ?auto_2025083 ?auto_2025085 ) ) ( not ( = ?auto_2025083 ?auto_2025087 ) ) ( not ( = ?auto_2025083 ?auto_2025086 ) ) ( not ( = ?auto_2025084 ?auto_2025081 ) ) ( not ( = ?auto_2025084 ?auto_2025085 ) ) ( not ( = ?auto_2025084 ?auto_2025087 ) ) ( not ( = ?auto_2025084 ?auto_2025086 ) ) ( not ( = ?auto_2025081 ?auto_2025085 ) ) ( not ( = ?auto_2025081 ?auto_2025087 ) ) ( not ( = ?auto_2025081 ?auto_2025086 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2025085 ?auto_2025087 ?auto_2025086 )
      ( MAKE-6CRATE-VERIFY ?auto_2025082 ?auto_2025083 ?auto_2025084 ?auto_2025081 ?auto_2025085 ?auto_2025087 ?auto_2025086 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2025139 - SURFACE
      ?auto_2025140 - SURFACE
      ?auto_2025141 - SURFACE
      ?auto_2025138 - SURFACE
      ?auto_2025142 - SURFACE
      ?auto_2025144 - SURFACE
      ?auto_2025143 - SURFACE
    )
    :vars
    (
      ?auto_2025148 - HOIST
      ?auto_2025149 - PLACE
      ?auto_2025145 - TRUCK
      ?auto_2025146 - PLACE
      ?auto_2025147 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2025148 ?auto_2025149 ) ( SURFACE-AT ?auto_2025144 ?auto_2025149 ) ( CLEAR ?auto_2025144 ) ( IS-CRATE ?auto_2025143 ) ( not ( = ?auto_2025144 ?auto_2025143 ) ) ( AVAILABLE ?auto_2025148 ) ( ON ?auto_2025144 ?auto_2025142 ) ( not ( = ?auto_2025142 ?auto_2025144 ) ) ( not ( = ?auto_2025142 ?auto_2025143 ) ) ( TRUCK-AT ?auto_2025145 ?auto_2025146 ) ( not ( = ?auto_2025146 ?auto_2025149 ) ) ( HOIST-AT ?auto_2025147 ?auto_2025146 ) ( LIFTING ?auto_2025147 ?auto_2025143 ) ( not ( = ?auto_2025148 ?auto_2025147 ) ) ( ON ?auto_2025140 ?auto_2025139 ) ( ON ?auto_2025141 ?auto_2025140 ) ( ON ?auto_2025138 ?auto_2025141 ) ( ON ?auto_2025142 ?auto_2025138 ) ( not ( = ?auto_2025139 ?auto_2025140 ) ) ( not ( = ?auto_2025139 ?auto_2025141 ) ) ( not ( = ?auto_2025139 ?auto_2025138 ) ) ( not ( = ?auto_2025139 ?auto_2025142 ) ) ( not ( = ?auto_2025139 ?auto_2025144 ) ) ( not ( = ?auto_2025139 ?auto_2025143 ) ) ( not ( = ?auto_2025140 ?auto_2025141 ) ) ( not ( = ?auto_2025140 ?auto_2025138 ) ) ( not ( = ?auto_2025140 ?auto_2025142 ) ) ( not ( = ?auto_2025140 ?auto_2025144 ) ) ( not ( = ?auto_2025140 ?auto_2025143 ) ) ( not ( = ?auto_2025141 ?auto_2025138 ) ) ( not ( = ?auto_2025141 ?auto_2025142 ) ) ( not ( = ?auto_2025141 ?auto_2025144 ) ) ( not ( = ?auto_2025141 ?auto_2025143 ) ) ( not ( = ?auto_2025138 ?auto_2025142 ) ) ( not ( = ?auto_2025138 ?auto_2025144 ) ) ( not ( = ?auto_2025138 ?auto_2025143 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2025142 ?auto_2025144 ?auto_2025143 )
      ( MAKE-6CRATE-VERIFY ?auto_2025139 ?auto_2025140 ?auto_2025141 ?auto_2025138 ?auto_2025142 ?auto_2025144 ?auto_2025143 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2025202 - SURFACE
      ?auto_2025203 - SURFACE
      ?auto_2025204 - SURFACE
      ?auto_2025201 - SURFACE
      ?auto_2025205 - SURFACE
      ?auto_2025207 - SURFACE
      ?auto_2025206 - SURFACE
    )
    :vars
    (
      ?auto_2025210 - HOIST
      ?auto_2025209 - PLACE
      ?auto_2025211 - TRUCK
      ?auto_2025213 - PLACE
      ?auto_2025208 - HOIST
      ?auto_2025212 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2025210 ?auto_2025209 ) ( SURFACE-AT ?auto_2025207 ?auto_2025209 ) ( CLEAR ?auto_2025207 ) ( IS-CRATE ?auto_2025206 ) ( not ( = ?auto_2025207 ?auto_2025206 ) ) ( AVAILABLE ?auto_2025210 ) ( ON ?auto_2025207 ?auto_2025205 ) ( not ( = ?auto_2025205 ?auto_2025207 ) ) ( not ( = ?auto_2025205 ?auto_2025206 ) ) ( TRUCK-AT ?auto_2025211 ?auto_2025213 ) ( not ( = ?auto_2025213 ?auto_2025209 ) ) ( HOIST-AT ?auto_2025208 ?auto_2025213 ) ( not ( = ?auto_2025210 ?auto_2025208 ) ) ( AVAILABLE ?auto_2025208 ) ( SURFACE-AT ?auto_2025206 ?auto_2025213 ) ( ON ?auto_2025206 ?auto_2025212 ) ( CLEAR ?auto_2025206 ) ( not ( = ?auto_2025207 ?auto_2025212 ) ) ( not ( = ?auto_2025206 ?auto_2025212 ) ) ( not ( = ?auto_2025205 ?auto_2025212 ) ) ( ON ?auto_2025203 ?auto_2025202 ) ( ON ?auto_2025204 ?auto_2025203 ) ( ON ?auto_2025201 ?auto_2025204 ) ( ON ?auto_2025205 ?auto_2025201 ) ( not ( = ?auto_2025202 ?auto_2025203 ) ) ( not ( = ?auto_2025202 ?auto_2025204 ) ) ( not ( = ?auto_2025202 ?auto_2025201 ) ) ( not ( = ?auto_2025202 ?auto_2025205 ) ) ( not ( = ?auto_2025202 ?auto_2025207 ) ) ( not ( = ?auto_2025202 ?auto_2025206 ) ) ( not ( = ?auto_2025202 ?auto_2025212 ) ) ( not ( = ?auto_2025203 ?auto_2025204 ) ) ( not ( = ?auto_2025203 ?auto_2025201 ) ) ( not ( = ?auto_2025203 ?auto_2025205 ) ) ( not ( = ?auto_2025203 ?auto_2025207 ) ) ( not ( = ?auto_2025203 ?auto_2025206 ) ) ( not ( = ?auto_2025203 ?auto_2025212 ) ) ( not ( = ?auto_2025204 ?auto_2025201 ) ) ( not ( = ?auto_2025204 ?auto_2025205 ) ) ( not ( = ?auto_2025204 ?auto_2025207 ) ) ( not ( = ?auto_2025204 ?auto_2025206 ) ) ( not ( = ?auto_2025204 ?auto_2025212 ) ) ( not ( = ?auto_2025201 ?auto_2025205 ) ) ( not ( = ?auto_2025201 ?auto_2025207 ) ) ( not ( = ?auto_2025201 ?auto_2025206 ) ) ( not ( = ?auto_2025201 ?auto_2025212 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2025205 ?auto_2025207 ?auto_2025206 )
      ( MAKE-6CRATE-VERIFY ?auto_2025202 ?auto_2025203 ?auto_2025204 ?auto_2025201 ?auto_2025205 ?auto_2025207 ?auto_2025206 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2025266 - SURFACE
      ?auto_2025267 - SURFACE
      ?auto_2025268 - SURFACE
      ?auto_2025265 - SURFACE
      ?auto_2025269 - SURFACE
      ?auto_2025271 - SURFACE
      ?auto_2025270 - SURFACE
    )
    :vars
    (
      ?auto_2025275 - HOIST
      ?auto_2025274 - PLACE
      ?auto_2025276 - PLACE
      ?auto_2025273 - HOIST
      ?auto_2025272 - SURFACE
      ?auto_2025277 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2025275 ?auto_2025274 ) ( SURFACE-AT ?auto_2025271 ?auto_2025274 ) ( CLEAR ?auto_2025271 ) ( IS-CRATE ?auto_2025270 ) ( not ( = ?auto_2025271 ?auto_2025270 ) ) ( AVAILABLE ?auto_2025275 ) ( ON ?auto_2025271 ?auto_2025269 ) ( not ( = ?auto_2025269 ?auto_2025271 ) ) ( not ( = ?auto_2025269 ?auto_2025270 ) ) ( not ( = ?auto_2025276 ?auto_2025274 ) ) ( HOIST-AT ?auto_2025273 ?auto_2025276 ) ( not ( = ?auto_2025275 ?auto_2025273 ) ) ( AVAILABLE ?auto_2025273 ) ( SURFACE-AT ?auto_2025270 ?auto_2025276 ) ( ON ?auto_2025270 ?auto_2025272 ) ( CLEAR ?auto_2025270 ) ( not ( = ?auto_2025271 ?auto_2025272 ) ) ( not ( = ?auto_2025270 ?auto_2025272 ) ) ( not ( = ?auto_2025269 ?auto_2025272 ) ) ( TRUCK-AT ?auto_2025277 ?auto_2025274 ) ( ON ?auto_2025267 ?auto_2025266 ) ( ON ?auto_2025268 ?auto_2025267 ) ( ON ?auto_2025265 ?auto_2025268 ) ( ON ?auto_2025269 ?auto_2025265 ) ( not ( = ?auto_2025266 ?auto_2025267 ) ) ( not ( = ?auto_2025266 ?auto_2025268 ) ) ( not ( = ?auto_2025266 ?auto_2025265 ) ) ( not ( = ?auto_2025266 ?auto_2025269 ) ) ( not ( = ?auto_2025266 ?auto_2025271 ) ) ( not ( = ?auto_2025266 ?auto_2025270 ) ) ( not ( = ?auto_2025266 ?auto_2025272 ) ) ( not ( = ?auto_2025267 ?auto_2025268 ) ) ( not ( = ?auto_2025267 ?auto_2025265 ) ) ( not ( = ?auto_2025267 ?auto_2025269 ) ) ( not ( = ?auto_2025267 ?auto_2025271 ) ) ( not ( = ?auto_2025267 ?auto_2025270 ) ) ( not ( = ?auto_2025267 ?auto_2025272 ) ) ( not ( = ?auto_2025268 ?auto_2025265 ) ) ( not ( = ?auto_2025268 ?auto_2025269 ) ) ( not ( = ?auto_2025268 ?auto_2025271 ) ) ( not ( = ?auto_2025268 ?auto_2025270 ) ) ( not ( = ?auto_2025268 ?auto_2025272 ) ) ( not ( = ?auto_2025265 ?auto_2025269 ) ) ( not ( = ?auto_2025265 ?auto_2025271 ) ) ( not ( = ?auto_2025265 ?auto_2025270 ) ) ( not ( = ?auto_2025265 ?auto_2025272 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2025269 ?auto_2025271 ?auto_2025270 )
      ( MAKE-6CRATE-VERIFY ?auto_2025266 ?auto_2025267 ?auto_2025268 ?auto_2025265 ?auto_2025269 ?auto_2025271 ?auto_2025270 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2025330 - SURFACE
      ?auto_2025331 - SURFACE
      ?auto_2025332 - SURFACE
      ?auto_2025329 - SURFACE
      ?auto_2025333 - SURFACE
      ?auto_2025335 - SURFACE
      ?auto_2025334 - SURFACE
    )
    :vars
    (
      ?auto_2025337 - HOIST
      ?auto_2025339 - PLACE
      ?auto_2025336 - PLACE
      ?auto_2025340 - HOIST
      ?auto_2025341 - SURFACE
      ?auto_2025338 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2025337 ?auto_2025339 ) ( IS-CRATE ?auto_2025334 ) ( not ( = ?auto_2025335 ?auto_2025334 ) ) ( not ( = ?auto_2025333 ?auto_2025335 ) ) ( not ( = ?auto_2025333 ?auto_2025334 ) ) ( not ( = ?auto_2025336 ?auto_2025339 ) ) ( HOIST-AT ?auto_2025340 ?auto_2025336 ) ( not ( = ?auto_2025337 ?auto_2025340 ) ) ( AVAILABLE ?auto_2025340 ) ( SURFACE-AT ?auto_2025334 ?auto_2025336 ) ( ON ?auto_2025334 ?auto_2025341 ) ( CLEAR ?auto_2025334 ) ( not ( = ?auto_2025335 ?auto_2025341 ) ) ( not ( = ?auto_2025334 ?auto_2025341 ) ) ( not ( = ?auto_2025333 ?auto_2025341 ) ) ( TRUCK-AT ?auto_2025338 ?auto_2025339 ) ( SURFACE-AT ?auto_2025333 ?auto_2025339 ) ( CLEAR ?auto_2025333 ) ( LIFTING ?auto_2025337 ?auto_2025335 ) ( IS-CRATE ?auto_2025335 ) ( ON ?auto_2025331 ?auto_2025330 ) ( ON ?auto_2025332 ?auto_2025331 ) ( ON ?auto_2025329 ?auto_2025332 ) ( ON ?auto_2025333 ?auto_2025329 ) ( not ( = ?auto_2025330 ?auto_2025331 ) ) ( not ( = ?auto_2025330 ?auto_2025332 ) ) ( not ( = ?auto_2025330 ?auto_2025329 ) ) ( not ( = ?auto_2025330 ?auto_2025333 ) ) ( not ( = ?auto_2025330 ?auto_2025335 ) ) ( not ( = ?auto_2025330 ?auto_2025334 ) ) ( not ( = ?auto_2025330 ?auto_2025341 ) ) ( not ( = ?auto_2025331 ?auto_2025332 ) ) ( not ( = ?auto_2025331 ?auto_2025329 ) ) ( not ( = ?auto_2025331 ?auto_2025333 ) ) ( not ( = ?auto_2025331 ?auto_2025335 ) ) ( not ( = ?auto_2025331 ?auto_2025334 ) ) ( not ( = ?auto_2025331 ?auto_2025341 ) ) ( not ( = ?auto_2025332 ?auto_2025329 ) ) ( not ( = ?auto_2025332 ?auto_2025333 ) ) ( not ( = ?auto_2025332 ?auto_2025335 ) ) ( not ( = ?auto_2025332 ?auto_2025334 ) ) ( not ( = ?auto_2025332 ?auto_2025341 ) ) ( not ( = ?auto_2025329 ?auto_2025333 ) ) ( not ( = ?auto_2025329 ?auto_2025335 ) ) ( not ( = ?auto_2025329 ?auto_2025334 ) ) ( not ( = ?auto_2025329 ?auto_2025341 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2025333 ?auto_2025335 ?auto_2025334 )
      ( MAKE-6CRATE-VERIFY ?auto_2025330 ?auto_2025331 ?auto_2025332 ?auto_2025329 ?auto_2025333 ?auto_2025335 ?auto_2025334 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2025394 - SURFACE
      ?auto_2025395 - SURFACE
      ?auto_2025396 - SURFACE
      ?auto_2025393 - SURFACE
      ?auto_2025397 - SURFACE
      ?auto_2025399 - SURFACE
      ?auto_2025398 - SURFACE
    )
    :vars
    (
      ?auto_2025400 - HOIST
      ?auto_2025405 - PLACE
      ?auto_2025402 - PLACE
      ?auto_2025401 - HOIST
      ?auto_2025403 - SURFACE
      ?auto_2025404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2025400 ?auto_2025405 ) ( IS-CRATE ?auto_2025398 ) ( not ( = ?auto_2025399 ?auto_2025398 ) ) ( not ( = ?auto_2025397 ?auto_2025399 ) ) ( not ( = ?auto_2025397 ?auto_2025398 ) ) ( not ( = ?auto_2025402 ?auto_2025405 ) ) ( HOIST-AT ?auto_2025401 ?auto_2025402 ) ( not ( = ?auto_2025400 ?auto_2025401 ) ) ( AVAILABLE ?auto_2025401 ) ( SURFACE-AT ?auto_2025398 ?auto_2025402 ) ( ON ?auto_2025398 ?auto_2025403 ) ( CLEAR ?auto_2025398 ) ( not ( = ?auto_2025399 ?auto_2025403 ) ) ( not ( = ?auto_2025398 ?auto_2025403 ) ) ( not ( = ?auto_2025397 ?auto_2025403 ) ) ( TRUCK-AT ?auto_2025404 ?auto_2025405 ) ( SURFACE-AT ?auto_2025397 ?auto_2025405 ) ( CLEAR ?auto_2025397 ) ( IS-CRATE ?auto_2025399 ) ( AVAILABLE ?auto_2025400 ) ( IN ?auto_2025399 ?auto_2025404 ) ( ON ?auto_2025395 ?auto_2025394 ) ( ON ?auto_2025396 ?auto_2025395 ) ( ON ?auto_2025393 ?auto_2025396 ) ( ON ?auto_2025397 ?auto_2025393 ) ( not ( = ?auto_2025394 ?auto_2025395 ) ) ( not ( = ?auto_2025394 ?auto_2025396 ) ) ( not ( = ?auto_2025394 ?auto_2025393 ) ) ( not ( = ?auto_2025394 ?auto_2025397 ) ) ( not ( = ?auto_2025394 ?auto_2025399 ) ) ( not ( = ?auto_2025394 ?auto_2025398 ) ) ( not ( = ?auto_2025394 ?auto_2025403 ) ) ( not ( = ?auto_2025395 ?auto_2025396 ) ) ( not ( = ?auto_2025395 ?auto_2025393 ) ) ( not ( = ?auto_2025395 ?auto_2025397 ) ) ( not ( = ?auto_2025395 ?auto_2025399 ) ) ( not ( = ?auto_2025395 ?auto_2025398 ) ) ( not ( = ?auto_2025395 ?auto_2025403 ) ) ( not ( = ?auto_2025396 ?auto_2025393 ) ) ( not ( = ?auto_2025396 ?auto_2025397 ) ) ( not ( = ?auto_2025396 ?auto_2025399 ) ) ( not ( = ?auto_2025396 ?auto_2025398 ) ) ( not ( = ?auto_2025396 ?auto_2025403 ) ) ( not ( = ?auto_2025393 ?auto_2025397 ) ) ( not ( = ?auto_2025393 ?auto_2025399 ) ) ( not ( = ?auto_2025393 ?auto_2025398 ) ) ( not ( = ?auto_2025393 ?auto_2025403 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2025397 ?auto_2025399 ?auto_2025398 )
      ( MAKE-6CRATE-VERIFY ?auto_2025394 ?auto_2025395 ?auto_2025396 ?auto_2025393 ?auto_2025397 ?auto_2025399 ?auto_2025398 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2027350 - SURFACE
      ?auto_2027351 - SURFACE
      ?auto_2027352 - SURFACE
      ?auto_2027349 - SURFACE
      ?auto_2027353 - SURFACE
      ?auto_2027355 - SURFACE
      ?auto_2027354 - SURFACE
      ?auto_2027356 - SURFACE
    )
    :vars
    (
      ?auto_2027357 - HOIST
      ?auto_2027358 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027357 ?auto_2027358 ) ( SURFACE-AT ?auto_2027354 ?auto_2027358 ) ( CLEAR ?auto_2027354 ) ( LIFTING ?auto_2027357 ?auto_2027356 ) ( IS-CRATE ?auto_2027356 ) ( not ( = ?auto_2027354 ?auto_2027356 ) ) ( ON ?auto_2027351 ?auto_2027350 ) ( ON ?auto_2027352 ?auto_2027351 ) ( ON ?auto_2027349 ?auto_2027352 ) ( ON ?auto_2027353 ?auto_2027349 ) ( ON ?auto_2027355 ?auto_2027353 ) ( ON ?auto_2027354 ?auto_2027355 ) ( not ( = ?auto_2027350 ?auto_2027351 ) ) ( not ( = ?auto_2027350 ?auto_2027352 ) ) ( not ( = ?auto_2027350 ?auto_2027349 ) ) ( not ( = ?auto_2027350 ?auto_2027353 ) ) ( not ( = ?auto_2027350 ?auto_2027355 ) ) ( not ( = ?auto_2027350 ?auto_2027354 ) ) ( not ( = ?auto_2027350 ?auto_2027356 ) ) ( not ( = ?auto_2027351 ?auto_2027352 ) ) ( not ( = ?auto_2027351 ?auto_2027349 ) ) ( not ( = ?auto_2027351 ?auto_2027353 ) ) ( not ( = ?auto_2027351 ?auto_2027355 ) ) ( not ( = ?auto_2027351 ?auto_2027354 ) ) ( not ( = ?auto_2027351 ?auto_2027356 ) ) ( not ( = ?auto_2027352 ?auto_2027349 ) ) ( not ( = ?auto_2027352 ?auto_2027353 ) ) ( not ( = ?auto_2027352 ?auto_2027355 ) ) ( not ( = ?auto_2027352 ?auto_2027354 ) ) ( not ( = ?auto_2027352 ?auto_2027356 ) ) ( not ( = ?auto_2027349 ?auto_2027353 ) ) ( not ( = ?auto_2027349 ?auto_2027355 ) ) ( not ( = ?auto_2027349 ?auto_2027354 ) ) ( not ( = ?auto_2027349 ?auto_2027356 ) ) ( not ( = ?auto_2027353 ?auto_2027355 ) ) ( not ( = ?auto_2027353 ?auto_2027354 ) ) ( not ( = ?auto_2027353 ?auto_2027356 ) ) ( not ( = ?auto_2027355 ?auto_2027354 ) ) ( not ( = ?auto_2027355 ?auto_2027356 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2027354 ?auto_2027356 )
      ( MAKE-7CRATE-VERIFY ?auto_2027350 ?auto_2027351 ?auto_2027352 ?auto_2027349 ?auto_2027353 ?auto_2027355 ?auto_2027354 ?auto_2027356 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2027405 - SURFACE
      ?auto_2027406 - SURFACE
      ?auto_2027407 - SURFACE
      ?auto_2027404 - SURFACE
      ?auto_2027408 - SURFACE
      ?auto_2027410 - SURFACE
      ?auto_2027409 - SURFACE
      ?auto_2027411 - SURFACE
    )
    :vars
    (
      ?auto_2027414 - HOIST
      ?auto_2027412 - PLACE
      ?auto_2027413 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027414 ?auto_2027412 ) ( SURFACE-AT ?auto_2027409 ?auto_2027412 ) ( CLEAR ?auto_2027409 ) ( IS-CRATE ?auto_2027411 ) ( not ( = ?auto_2027409 ?auto_2027411 ) ) ( TRUCK-AT ?auto_2027413 ?auto_2027412 ) ( AVAILABLE ?auto_2027414 ) ( IN ?auto_2027411 ?auto_2027413 ) ( ON ?auto_2027409 ?auto_2027410 ) ( not ( = ?auto_2027410 ?auto_2027409 ) ) ( not ( = ?auto_2027410 ?auto_2027411 ) ) ( ON ?auto_2027406 ?auto_2027405 ) ( ON ?auto_2027407 ?auto_2027406 ) ( ON ?auto_2027404 ?auto_2027407 ) ( ON ?auto_2027408 ?auto_2027404 ) ( ON ?auto_2027410 ?auto_2027408 ) ( not ( = ?auto_2027405 ?auto_2027406 ) ) ( not ( = ?auto_2027405 ?auto_2027407 ) ) ( not ( = ?auto_2027405 ?auto_2027404 ) ) ( not ( = ?auto_2027405 ?auto_2027408 ) ) ( not ( = ?auto_2027405 ?auto_2027410 ) ) ( not ( = ?auto_2027405 ?auto_2027409 ) ) ( not ( = ?auto_2027405 ?auto_2027411 ) ) ( not ( = ?auto_2027406 ?auto_2027407 ) ) ( not ( = ?auto_2027406 ?auto_2027404 ) ) ( not ( = ?auto_2027406 ?auto_2027408 ) ) ( not ( = ?auto_2027406 ?auto_2027410 ) ) ( not ( = ?auto_2027406 ?auto_2027409 ) ) ( not ( = ?auto_2027406 ?auto_2027411 ) ) ( not ( = ?auto_2027407 ?auto_2027404 ) ) ( not ( = ?auto_2027407 ?auto_2027408 ) ) ( not ( = ?auto_2027407 ?auto_2027410 ) ) ( not ( = ?auto_2027407 ?auto_2027409 ) ) ( not ( = ?auto_2027407 ?auto_2027411 ) ) ( not ( = ?auto_2027404 ?auto_2027408 ) ) ( not ( = ?auto_2027404 ?auto_2027410 ) ) ( not ( = ?auto_2027404 ?auto_2027409 ) ) ( not ( = ?auto_2027404 ?auto_2027411 ) ) ( not ( = ?auto_2027408 ?auto_2027410 ) ) ( not ( = ?auto_2027408 ?auto_2027409 ) ) ( not ( = ?auto_2027408 ?auto_2027411 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2027410 ?auto_2027409 ?auto_2027411 )
      ( MAKE-7CRATE-VERIFY ?auto_2027405 ?auto_2027406 ?auto_2027407 ?auto_2027404 ?auto_2027408 ?auto_2027410 ?auto_2027409 ?auto_2027411 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2027468 - SURFACE
      ?auto_2027469 - SURFACE
      ?auto_2027470 - SURFACE
      ?auto_2027467 - SURFACE
      ?auto_2027471 - SURFACE
      ?auto_2027473 - SURFACE
      ?auto_2027472 - SURFACE
      ?auto_2027474 - SURFACE
    )
    :vars
    (
      ?auto_2027478 - HOIST
      ?auto_2027477 - PLACE
      ?auto_2027475 - TRUCK
      ?auto_2027476 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027478 ?auto_2027477 ) ( SURFACE-AT ?auto_2027472 ?auto_2027477 ) ( CLEAR ?auto_2027472 ) ( IS-CRATE ?auto_2027474 ) ( not ( = ?auto_2027472 ?auto_2027474 ) ) ( AVAILABLE ?auto_2027478 ) ( IN ?auto_2027474 ?auto_2027475 ) ( ON ?auto_2027472 ?auto_2027473 ) ( not ( = ?auto_2027473 ?auto_2027472 ) ) ( not ( = ?auto_2027473 ?auto_2027474 ) ) ( TRUCK-AT ?auto_2027475 ?auto_2027476 ) ( not ( = ?auto_2027476 ?auto_2027477 ) ) ( ON ?auto_2027469 ?auto_2027468 ) ( ON ?auto_2027470 ?auto_2027469 ) ( ON ?auto_2027467 ?auto_2027470 ) ( ON ?auto_2027471 ?auto_2027467 ) ( ON ?auto_2027473 ?auto_2027471 ) ( not ( = ?auto_2027468 ?auto_2027469 ) ) ( not ( = ?auto_2027468 ?auto_2027470 ) ) ( not ( = ?auto_2027468 ?auto_2027467 ) ) ( not ( = ?auto_2027468 ?auto_2027471 ) ) ( not ( = ?auto_2027468 ?auto_2027473 ) ) ( not ( = ?auto_2027468 ?auto_2027472 ) ) ( not ( = ?auto_2027468 ?auto_2027474 ) ) ( not ( = ?auto_2027469 ?auto_2027470 ) ) ( not ( = ?auto_2027469 ?auto_2027467 ) ) ( not ( = ?auto_2027469 ?auto_2027471 ) ) ( not ( = ?auto_2027469 ?auto_2027473 ) ) ( not ( = ?auto_2027469 ?auto_2027472 ) ) ( not ( = ?auto_2027469 ?auto_2027474 ) ) ( not ( = ?auto_2027470 ?auto_2027467 ) ) ( not ( = ?auto_2027470 ?auto_2027471 ) ) ( not ( = ?auto_2027470 ?auto_2027473 ) ) ( not ( = ?auto_2027470 ?auto_2027472 ) ) ( not ( = ?auto_2027470 ?auto_2027474 ) ) ( not ( = ?auto_2027467 ?auto_2027471 ) ) ( not ( = ?auto_2027467 ?auto_2027473 ) ) ( not ( = ?auto_2027467 ?auto_2027472 ) ) ( not ( = ?auto_2027467 ?auto_2027474 ) ) ( not ( = ?auto_2027471 ?auto_2027473 ) ) ( not ( = ?auto_2027471 ?auto_2027472 ) ) ( not ( = ?auto_2027471 ?auto_2027474 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2027473 ?auto_2027472 ?auto_2027474 )
      ( MAKE-7CRATE-VERIFY ?auto_2027468 ?auto_2027469 ?auto_2027470 ?auto_2027467 ?auto_2027471 ?auto_2027473 ?auto_2027472 ?auto_2027474 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2027538 - SURFACE
      ?auto_2027539 - SURFACE
      ?auto_2027540 - SURFACE
      ?auto_2027537 - SURFACE
      ?auto_2027541 - SURFACE
      ?auto_2027543 - SURFACE
      ?auto_2027542 - SURFACE
      ?auto_2027544 - SURFACE
    )
    :vars
    (
      ?auto_2027547 - HOIST
      ?auto_2027545 - PLACE
      ?auto_2027548 - TRUCK
      ?auto_2027549 - PLACE
      ?auto_2027546 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027547 ?auto_2027545 ) ( SURFACE-AT ?auto_2027542 ?auto_2027545 ) ( CLEAR ?auto_2027542 ) ( IS-CRATE ?auto_2027544 ) ( not ( = ?auto_2027542 ?auto_2027544 ) ) ( AVAILABLE ?auto_2027547 ) ( ON ?auto_2027542 ?auto_2027543 ) ( not ( = ?auto_2027543 ?auto_2027542 ) ) ( not ( = ?auto_2027543 ?auto_2027544 ) ) ( TRUCK-AT ?auto_2027548 ?auto_2027549 ) ( not ( = ?auto_2027549 ?auto_2027545 ) ) ( HOIST-AT ?auto_2027546 ?auto_2027549 ) ( LIFTING ?auto_2027546 ?auto_2027544 ) ( not ( = ?auto_2027547 ?auto_2027546 ) ) ( ON ?auto_2027539 ?auto_2027538 ) ( ON ?auto_2027540 ?auto_2027539 ) ( ON ?auto_2027537 ?auto_2027540 ) ( ON ?auto_2027541 ?auto_2027537 ) ( ON ?auto_2027543 ?auto_2027541 ) ( not ( = ?auto_2027538 ?auto_2027539 ) ) ( not ( = ?auto_2027538 ?auto_2027540 ) ) ( not ( = ?auto_2027538 ?auto_2027537 ) ) ( not ( = ?auto_2027538 ?auto_2027541 ) ) ( not ( = ?auto_2027538 ?auto_2027543 ) ) ( not ( = ?auto_2027538 ?auto_2027542 ) ) ( not ( = ?auto_2027538 ?auto_2027544 ) ) ( not ( = ?auto_2027539 ?auto_2027540 ) ) ( not ( = ?auto_2027539 ?auto_2027537 ) ) ( not ( = ?auto_2027539 ?auto_2027541 ) ) ( not ( = ?auto_2027539 ?auto_2027543 ) ) ( not ( = ?auto_2027539 ?auto_2027542 ) ) ( not ( = ?auto_2027539 ?auto_2027544 ) ) ( not ( = ?auto_2027540 ?auto_2027537 ) ) ( not ( = ?auto_2027540 ?auto_2027541 ) ) ( not ( = ?auto_2027540 ?auto_2027543 ) ) ( not ( = ?auto_2027540 ?auto_2027542 ) ) ( not ( = ?auto_2027540 ?auto_2027544 ) ) ( not ( = ?auto_2027537 ?auto_2027541 ) ) ( not ( = ?auto_2027537 ?auto_2027543 ) ) ( not ( = ?auto_2027537 ?auto_2027542 ) ) ( not ( = ?auto_2027537 ?auto_2027544 ) ) ( not ( = ?auto_2027541 ?auto_2027543 ) ) ( not ( = ?auto_2027541 ?auto_2027542 ) ) ( not ( = ?auto_2027541 ?auto_2027544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2027543 ?auto_2027542 ?auto_2027544 )
      ( MAKE-7CRATE-VERIFY ?auto_2027538 ?auto_2027539 ?auto_2027540 ?auto_2027537 ?auto_2027541 ?auto_2027543 ?auto_2027542 ?auto_2027544 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2027615 - SURFACE
      ?auto_2027616 - SURFACE
      ?auto_2027617 - SURFACE
      ?auto_2027614 - SURFACE
      ?auto_2027618 - SURFACE
      ?auto_2027620 - SURFACE
      ?auto_2027619 - SURFACE
      ?auto_2027621 - SURFACE
    )
    :vars
    (
      ?auto_2027624 - HOIST
      ?auto_2027622 - PLACE
      ?auto_2027627 - TRUCK
      ?auto_2027625 - PLACE
      ?auto_2027623 - HOIST
      ?auto_2027626 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027624 ?auto_2027622 ) ( SURFACE-AT ?auto_2027619 ?auto_2027622 ) ( CLEAR ?auto_2027619 ) ( IS-CRATE ?auto_2027621 ) ( not ( = ?auto_2027619 ?auto_2027621 ) ) ( AVAILABLE ?auto_2027624 ) ( ON ?auto_2027619 ?auto_2027620 ) ( not ( = ?auto_2027620 ?auto_2027619 ) ) ( not ( = ?auto_2027620 ?auto_2027621 ) ) ( TRUCK-AT ?auto_2027627 ?auto_2027625 ) ( not ( = ?auto_2027625 ?auto_2027622 ) ) ( HOIST-AT ?auto_2027623 ?auto_2027625 ) ( not ( = ?auto_2027624 ?auto_2027623 ) ) ( AVAILABLE ?auto_2027623 ) ( SURFACE-AT ?auto_2027621 ?auto_2027625 ) ( ON ?auto_2027621 ?auto_2027626 ) ( CLEAR ?auto_2027621 ) ( not ( = ?auto_2027619 ?auto_2027626 ) ) ( not ( = ?auto_2027621 ?auto_2027626 ) ) ( not ( = ?auto_2027620 ?auto_2027626 ) ) ( ON ?auto_2027616 ?auto_2027615 ) ( ON ?auto_2027617 ?auto_2027616 ) ( ON ?auto_2027614 ?auto_2027617 ) ( ON ?auto_2027618 ?auto_2027614 ) ( ON ?auto_2027620 ?auto_2027618 ) ( not ( = ?auto_2027615 ?auto_2027616 ) ) ( not ( = ?auto_2027615 ?auto_2027617 ) ) ( not ( = ?auto_2027615 ?auto_2027614 ) ) ( not ( = ?auto_2027615 ?auto_2027618 ) ) ( not ( = ?auto_2027615 ?auto_2027620 ) ) ( not ( = ?auto_2027615 ?auto_2027619 ) ) ( not ( = ?auto_2027615 ?auto_2027621 ) ) ( not ( = ?auto_2027615 ?auto_2027626 ) ) ( not ( = ?auto_2027616 ?auto_2027617 ) ) ( not ( = ?auto_2027616 ?auto_2027614 ) ) ( not ( = ?auto_2027616 ?auto_2027618 ) ) ( not ( = ?auto_2027616 ?auto_2027620 ) ) ( not ( = ?auto_2027616 ?auto_2027619 ) ) ( not ( = ?auto_2027616 ?auto_2027621 ) ) ( not ( = ?auto_2027616 ?auto_2027626 ) ) ( not ( = ?auto_2027617 ?auto_2027614 ) ) ( not ( = ?auto_2027617 ?auto_2027618 ) ) ( not ( = ?auto_2027617 ?auto_2027620 ) ) ( not ( = ?auto_2027617 ?auto_2027619 ) ) ( not ( = ?auto_2027617 ?auto_2027621 ) ) ( not ( = ?auto_2027617 ?auto_2027626 ) ) ( not ( = ?auto_2027614 ?auto_2027618 ) ) ( not ( = ?auto_2027614 ?auto_2027620 ) ) ( not ( = ?auto_2027614 ?auto_2027619 ) ) ( not ( = ?auto_2027614 ?auto_2027621 ) ) ( not ( = ?auto_2027614 ?auto_2027626 ) ) ( not ( = ?auto_2027618 ?auto_2027620 ) ) ( not ( = ?auto_2027618 ?auto_2027619 ) ) ( not ( = ?auto_2027618 ?auto_2027621 ) ) ( not ( = ?auto_2027618 ?auto_2027626 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2027620 ?auto_2027619 ?auto_2027621 )
      ( MAKE-7CRATE-VERIFY ?auto_2027615 ?auto_2027616 ?auto_2027617 ?auto_2027614 ?auto_2027618 ?auto_2027620 ?auto_2027619 ?auto_2027621 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2027693 - SURFACE
      ?auto_2027694 - SURFACE
      ?auto_2027695 - SURFACE
      ?auto_2027692 - SURFACE
      ?auto_2027696 - SURFACE
      ?auto_2027698 - SURFACE
      ?auto_2027697 - SURFACE
      ?auto_2027699 - SURFACE
    )
    :vars
    (
      ?auto_2027701 - HOIST
      ?auto_2027700 - PLACE
      ?auto_2027702 - PLACE
      ?auto_2027704 - HOIST
      ?auto_2027703 - SURFACE
      ?auto_2027705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027701 ?auto_2027700 ) ( SURFACE-AT ?auto_2027697 ?auto_2027700 ) ( CLEAR ?auto_2027697 ) ( IS-CRATE ?auto_2027699 ) ( not ( = ?auto_2027697 ?auto_2027699 ) ) ( AVAILABLE ?auto_2027701 ) ( ON ?auto_2027697 ?auto_2027698 ) ( not ( = ?auto_2027698 ?auto_2027697 ) ) ( not ( = ?auto_2027698 ?auto_2027699 ) ) ( not ( = ?auto_2027702 ?auto_2027700 ) ) ( HOIST-AT ?auto_2027704 ?auto_2027702 ) ( not ( = ?auto_2027701 ?auto_2027704 ) ) ( AVAILABLE ?auto_2027704 ) ( SURFACE-AT ?auto_2027699 ?auto_2027702 ) ( ON ?auto_2027699 ?auto_2027703 ) ( CLEAR ?auto_2027699 ) ( not ( = ?auto_2027697 ?auto_2027703 ) ) ( not ( = ?auto_2027699 ?auto_2027703 ) ) ( not ( = ?auto_2027698 ?auto_2027703 ) ) ( TRUCK-AT ?auto_2027705 ?auto_2027700 ) ( ON ?auto_2027694 ?auto_2027693 ) ( ON ?auto_2027695 ?auto_2027694 ) ( ON ?auto_2027692 ?auto_2027695 ) ( ON ?auto_2027696 ?auto_2027692 ) ( ON ?auto_2027698 ?auto_2027696 ) ( not ( = ?auto_2027693 ?auto_2027694 ) ) ( not ( = ?auto_2027693 ?auto_2027695 ) ) ( not ( = ?auto_2027693 ?auto_2027692 ) ) ( not ( = ?auto_2027693 ?auto_2027696 ) ) ( not ( = ?auto_2027693 ?auto_2027698 ) ) ( not ( = ?auto_2027693 ?auto_2027697 ) ) ( not ( = ?auto_2027693 ?auto_2027699 ) ) ( not ( = ?auto_2027693 ?auto_2027703 ) ) ( not ( = ?auto_2027694 ?auto_2027695 ) ) ( not ( = ?auto_2027694 ?auto_2027692 ) ) ( not ( = ?auto_2027694 ?auto_2027696 ) ) ( not ( = ?auto_2027694 ?auto_2027698 ) ) ( not ( = ?auto_2027694 ?auto_2027697 ) ) ( not ( = ?auto_2027694 ?auto_2027699 ) ) ( not ( = ?auto_2027694 ?auto_2027703 ) ) ( not ( = ?auto_2027695 ?auto_2027692 ) ) ( not ( = ?auto_2027695 ?auto_2027696 ) ) ( not ( = ?auto_2027695 ?auto_2027698 ) ) ( not ( = ?auto_2027695 ?auto_2027697 ) ) ( not ( = ?auto_2027695 ?auto_2027699 ) ) ( not ( = ?auto_2027695 ?auto_2027703 ) ) ( not ( = ?auto_2027692 ?auto_2027696 ) ) ( not ( = ?auto_2027692 ?auto_2027698 ) ) ( not ( = ?auto_2027692 ?auto_2027697 ) ) ( not ( = ?auto_2027692 ?auto_2027699 ) ) ( not ( = ?auto_2027692 ?auto_2027703 ) ) ( not ( = ?auto_2027696 ?auto_2027698 ) ) ( not ( = ?auto_2027696 ?auto_2027697 ) ) ( not ( = ?auto_2027696 ?auto_2027699 ) ) ( not ( = ?auto_2027696 ?auto_2027703 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2027698 ?auto_2027697 ?auto_2027699 )
      ( MAKE-7CRATE-VERIFY ?auto_2027693 ?auto_2027694 ?auto_2027695 ?auto_2027692 ?auto_2027696 ?auto_2027698 ?auto_2027697 ?auto_2027699 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2027771 - SURFACE
      ?auto_2027772 - SURFACE
      ?auto_2027773 - SURFACE
      ?auto_2027770 - SURFACE
      ?auto_2027774 - SURFACE
      ?auto_2027776 - SURFACE
      ?auto_2027775 - SURFACE
      ?auto_2027777 - SURFACE
    )
    :vars
    (
      ?auto_2027780 - HOIST
      ?auto_2027781 - PLACE
      ?auto_2027783 - PLACE
      ?auto_2027779 - HOIST
      ?auto_2027778 - SURFACE
      ?auto_2027782 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027780 ?auto_2027781 ) ( IS-CRATE ?auto_2027777 ) ( not ( = ?auto_2027775 ?auto_2027777 ) ) ( not ( = ?auto_2027776 ?auto_2027775 ) ) ( not ( = ?auto_2027776 ?auto_2027777 ) ) ( not ( = ?auto_2027783 ?auto_2027781 ) ) ( HOIST-AT ?auto_2027779 ?auto_2027783 ) ( not ( = ?auto_2027780 ?auto_2027779 ) ) ( AVAILABLE ?auto_2027779 ) ( SURFACE-AT ?auto_2027777 ?auto_2027783 ) ( ON ?auto_2027777 ?auto_2027778 ) ( CLEAR ?auto_2027777 ) ( not ( = ?auto_2027775 ?auto_2027778 ) ) ( not ( = ?auto_2027777 ?auto_2027778 ) ) ( not ( = ?auto_2027776 ?auto_2027778 ) ) ( TRUCK-AT ?auto_2027782 ?auto_2027781 ) ( SURFACE-AT ?auto_2027776 ?auto_2027781 ) ( CLEAR ?auto_2027776 ) ( LIFTING ?auto_2027780 ?auto_2027775 ) ( IS-CRATE ?auto_2027775 ) ( ON ?auto_2027772 ?auto_2027771 ) ( ON ?auto_2027773 ?auto_2027772 ) ( ON ?auto_2027770 ?auto_2027773 ) ( ON ?auto_2027774 ?auto_2027770 ) ( ON ?auto_2027776 ?auto_2027774 ) ( not ( = ?auto_2027771 ?auto_2027772 ) ) ( not ( = ?auto_2027771 ?auto_2027773 ) ) ( not ( = ?auto_2027771 ?auto_2027770 ) ) ( not ( = ?auto_2027771 ?auto_2027774 ) ) ( not ( = ?auto_2027771 ?auto_2027776 ) ) ( not ( = ?auto_2027771 ?auto_2027775 ) ) ( not ( = ?auto_2027771 ?auto_2027777 ) ) ( not ( = ?auto_2027771 ?auto_2027778 ) ) ( not ( = ?auto_2027772 ?auto_2027773 ) ) ( not ( = ?auto_2027772 ?auto_2027770 ) ) ( not ( = ?auto_2027772 ?auto_2027774 ) ) ( not ( = ?auto_2027772 ?auto_2027776 ) ) ( not ( = ?auto_2027772 ?auto_2027775 ) ) ( not ( = ?auto_2027772 ?auto_2027777 ) ) ( not ( = ?auto_2027772 ?auto_2027778 ) ) ( not ( = ?auto_2027773 ?auto_2027770 ) ) ( not ( = ?auto_2027773 ?auto_2027774 ) ) ( not ( = ?auto_2027773 ?auto_2027776 ) ) ( not ( = ?auto_2027773 ?auto_2027775 ) ) ( not ( = ?auto_2027773 ?auto_2027777 ) ) ( not ( = ?auto_2027773 ?auto_2027778 ) ) ( not ( = ?auto_2027770 ?auto_2027774 ) ) ( not ( = ?auto_2027770 ?auto_2027776 ) ) ( not ( = ?auto_2027770 ?auto_2027775 ) ) ( not ( = ?auto_2027770 ?auto_2027777 ) ) ( not ( = ?auto_2027770 ?auto_2027778 ) ) ( not ( = ?auto_2027774 ?auto_2027776 ) ) ( not ( = ?auto_2027774 ?auto_2027775 ) ) ( not ( = ?auto_2027774 ?auto_2027777 ) ) ( not ( = ?auto_2027774 ?auto_2027778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2027776 ?auto_2027775 ?auto_2027777 )
      ( MAKE-7CRATE-VERIFY ?auto_2027771 ?auto_2027772 ?auto_2027773 ?auto_2027770 ?auto_2027774 ?auto_2027776 ?auto_2027775 ?auto_2027777 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2027849 - SURFACE
      ?auto_2027850 - SURFACE
      ?auto_2027851 - SURFACE
      ?auto_2027848 - SURFACE
      ?auto_2027852 - SURFACE
      ?auto_2027854 - SURFACE
      ?auto_2027853 - SURFACE
      ?auto_2027855 - SURFACE
    )
    :vars
    (
      ?auto_2027856 - HOIST
      ?auto_2027861 - PLACE
      ?auto_2027858 - PLACE
      ?auto_2027859 - HOIST
      ?auto_2027857 - SURFACE
      ?auto_2027860 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027856 ?auto_2027861 ) ( IS-CRATE ?auto_2027855 ) ( not ( = ?auto_2027853 ?auto_2027855 ) ) ( not ( = ?auto_2027854 ?auto_2027853 ) ) ( not ( = ?auto_2027854 ?auto_2027855 ) ) ( not ( = ?auto_2027858 ?auto_2027861 ) ) ( HOIST-AT ?auto_2027859 ?auto_2027858 ) ( not ( = ?auto_2027856 ?auto_2027859 ) ) ( AVAILABLE ?auto_2027859 ) ( SURFACE-AT ?auto_2027855 ?auto_2027858 ) ( ON ?auto_2027855 ?auto_2027857 ) ( CLEAR ?auto_2027855 ) ( not ( = ?auto_2027853 ?auto_2027857 ) ) ( not ( = ?auto_2027855 ?auto_2027857 ) ) ( not ( = ?auto_2027854 ?auto_2027857 ) ) ( TRUCK-AT ?auto_2027860 ?auto_2027861 ) ( SURFACE-AT ?auto_2027854 ?auto_2027861 ) ( CLEAR ?auto_2027854 ) ( IS-CRATE ?auto_2027853 ) ( AVAILABLE ?auto_2027856 ) ( IN ?auto_2027853 ?auto_2027860 ) ( ON ?auto_2027850 ?auto_2027849 ) ( ON ?auto_2027851 ?auto_2027850 ) ( ON ?auto_2027848 ?auto_2027851 ) ( ON ?auto_2027852 ?auto_2027848 ) ( ON ?auto_2027854 ?auto_2027852 ) ( not ( = ?auto_2027849 ?auto_2027850 ) ) ( not ( = ?auto_2027849 ?auto_2027851 ) ) ( not ( = ?auto_2027849 ?auto_2027848 ) ) ( not ( = ?auto_2027849 ?auto_2027852 ) ) ( not ( = ?auto_2027849 ?auto_2027854 ) ) ( not ( = ?auto_2027849 ?auto_2027853 ) ) ( not ( = ?auto_2027849 ?auto_2027855 ) ) ( not ( = ?auto_2027849 ?auto_2027857 ) ) ( not ( = ?auto_2027850 ?auto_2027851 ) ) ( not ( = ?auto_2027850 ?auto_2027848 ) ) ( not ( = ?auto_2027850 ?auto_2027852 ) ) ( not ( = ?auto_2027850 ?auto_2027854 ) ) ( not ( = ?auto_2027850 ?auto_2027853 ) ) ( not ( = ?auto_2027850 ?auto_2027855 ) ) ( not ( = ?auto_2027850 ?auto_2027857 ) ) ( not ( = ?auto_2027851 ?auto_2027848 ) ) ( not ( = ?auto_2027851 ?auto_2027852 ) ) ( not ( = ?auto_2027851 ?auto_2027854 ) ) ( not ( = ?auto_2027851 ?auto_2027853 ) ) ( not ( = ?auto_2027851 ?auto_2027855 ) ) ( not ( = ?auto_2027851 ?auto_2027857 ) ) ( not ( = ?auto_2027848 ?auto_2027852 ) ) ( not ( = ?auto_2027848 ?auto_2027854 ) ) ( not ( = ?auto_2027848 ?auto_2027853 ) ) ( not ( = ?auto_2027848 ?auto_2027855 ) ) ( not ( = ?auto_2027848 ?auto_2027857 ) ) ( not ( = ?auto_2027852 ?auto_2027854 ) ) ( not ( = ?auto_2027852 ?auto_2027853 ) ) ( not ( = ?auto_2027852 ?auto_2027855 ) ) ( not ( = ?auto_2027852 ?auto_2027857 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2027854 ?auto_2027853 ?auto_2027855 )
      ( MAKE-7CRATE-VERIFY ?auto_2027849 ?auto_2027850 ?auto_2027851 ?auto_2027848 ?auto_2027852 ?auto_2027854 ?auto_2027853 ?auto_2027855 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2030768 - SURFACE
      ?auto_2030769 - SURFACE
      ?auto_2030770 - SURFACE
      ?auto_2030767 - SURFACE
      ?auto_2030771 - SURFACE
      ?auto_2030773 - SURFACE
      ?auto_2030772 - SURFACE
      ?auto_2030774 - SURFACE
      ?auto_2030775 - SURFACE
    )
    :vars
    (
      ?auto_2030777 - HOIST
      ?auto_2030776 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2030777 ?auto_2030776 ) ( SURFACE-AT ?auto_2030774 ?auto_2030776 ) ( CLEAR ?auto_2030774 ) ( LIFTING ?auto_2030777 ?auto_2030775 ) ( IS-CRATE ?auto_2030775 ) ( not ( = ?auto_2030774 ?auto_2030775 ) ) ( ON ?auto_2030769 ?auto_2030768 ) ( ON ?auto_2030770 ?auto_2030769 ) ( ON ?auto_2030767 ?auto_2030770 ) ( ON ?auto_2030771 ?auto_2030767 ) ( ON ?auto_2030773 ?auto_2030771 ) ( ON ?auto_2030772 ?auto_2030773 ) ( ON ?auto_2030774 ?auto_2030772 ) ( not ( = ?auto_2030768 ?auto_2030769 ) ) ( not ( = ?auto_2030768 ?auto_2030770 ) ) ( not ( = ?auto_2030768 ?auto_2030767 ) ) ( not ( = ?auto_2030768 ?auto_2030771 ) ) ( not ( = ?auto_2030768 ?auto_2030773 ) ) ( not ( = ?auto_2030768 ?auto_2030772 ) ) ( not ( = ?auto_2030768 ?auto_2030774 ) ) ( not ( = ?auto_2030768 ?auto_2030775 ) ) ( not ( = ?auto_2030769 ?auto_2030770 ) ) ( not ( = ?auto_2030769 ?auto_2030767 ) ) ( not ( = ?auto_2030769 ?auto_2030771 ) ) ( not ( = ?auto_2030769 ?auto_2030773 ) ) ( not ( = ?auto_2030769 ?auto_2030772 ) ) ( not ( = ?auto_2030769 ?auto_2030774 ) ) ( not ( = ?auto_2030769 ?auto_2030775 ) ) ( not ( = ?auto_2030770 ?auto_2030767 ) ) ( not ( = ?auto_2030770 ?auto_2030771 ) ) ( not ( = ?auto_2030770 ?auto_2030773 ) ) ( not ( = ?auto_2030770 ?auto_2030772 ) ) ( not ( = ?auto_2030770 ?auto_2030774 ) ) ( not ( = ?auto_2030770 ?auto_2030775 ) ) ( not ( = ?auto_2030767 ?auto_2030771 ) ) ( not ( = ?auto_2030767 ?auto_2030773 ) ) ( not ( = ?auto_2030767 ?auto_2030772 ) ) ( not ( = ?auto_2030767 ?auto_2030774 ) ) ( not ( = ?auto_2030767 ?auto_2030775 ) ) ( not ( = ?auto_2030771 ?auto_2030773 ) ) ( not ( = ?auto_2030771 ?auto_2030772 ) ) ( not ( = ?auto_2030771 ?auto_2030774 ) ) ( not ( = ?auto_2030771 ?auto_2030775 ) ) ( not ( = ?auto_2030773 ?auto_2030772 ) ) ( not ( = ?auto_2030773 ?auto_2030774 ) ) ( not ( = ?auto_2030773 ?auto_2030775 ) ) ( not ( = ?auto_2030772 ?auto_2030774 ) ) ( not ( = ?auto_2030772 ?auto_2030775 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2030774 ?auto_2030775 )
      ( MAKE-8CRATE-VERIFY ?auto_2030768 ?auto_2030769 ?auto_2030770 ?auto_2030767 ?auto_2030771 ?auto_2030773 ?auto_2030772 ?auto_2030774 ?auto_2030775 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2030835 - SURFACE
      ?auto_2030836 - SURFACE
      ?auto_2030837 - SURFACE
      ?auto_2030834 - SURFACE
      ?auto_2030838 - SURFACE
      ?auto_2030840 - SURFACE
      ?auto_2030839 - SURFACE
      ?auto_2030841 - SURFACE
      ?auto_2030842 - SURFACE
    )
    :vars
    (
      ?auto_2030845 - HOIST
      ?auto_2030844 - PLACE
      ?auto_2030843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2030845 ?auto_2030844 ) ( SURFACE-AT ?auto_2030841 ?auto_2030844 ) ( CLEAR ?auto_2030841 ) ( IS-CRATE ?auto_2030842 ) ( not ( = ?auto_2030841 ?auto_2030842 ) ) ( TRUCK-AT ?auto_2030843 ?auto_2030844 ) ( AVAILABLE ?auto_2030845 ) ( IN ?auto_2030842 ?auto_2030843 ) ( ON ?auto_2030841 ?auto_2030839 ) ( not ( = ?auto_2030839 ?auto_2030841 ) ) ( not ( = ?auto_2030839 ?auto_2030842 ) ) ( ON ?auto_2030836 ?auto_2030835 ) ( ON ?auto_2030837 ?auto_2030836 ) ( ON ?auto_2030834 ?auto_2030837 ) ( ON ?auto_2030838 ?auto_2030834 ) ( ON ?auto_2030840 ?auto_2030838 ) ( ON ?auto_2030839 ?auto_2030840 ) ( not ( = ?auto_2030835 ?auto_2030836 ) ) ( not ( = ?auto_2030835 ?auto_2030837 ) ) ( not ( = ?auto_2030835 ?auto_2030834 ) ) ( not ( = ?auto_2030835 ?auto_2030838 ) ) ( not ( = ?auto_2030835 ?auto_2030840 ) ) ( not ( = ?auto_2030835 ?auto_2030839 ) ) ( not ( = ?auto_2030835 ?auto_2030841 ) ) ( not ( = ?auto_2030835 ?auto_2030842 ) ) ( not ( = ?auto_2030836 ?auto_2030837 ) ) ( not ( = ?auto_2030836 ?auto_2030834 ) ) ( not ( = ?auto_2030836 ?auto_2030838 ) ) ( not ( = ?auto_2030836 ?auto_2030840 ) ) ( not ( = ?auto_2030836 ?auto_2030839 ) ) ( not ( = ?auto_2030836 ?auto_2030841 ) ) ( not ( = ?auto_2030836 ?auto_2030842 ) ) ( not ( = ?auto_2030837 ?auto_2030834 ) ) ( not ( = ?auto_2030837 ?auto_2030838 ) ) ( not ( = ?auto_2030837 ?auto_2030840 ) ) ( not ( = ?auto_2030837 ?auto_2030839 ) ) ( not ( = ?auto_2030837 ?auto_2030841 ) ) ( not ( = ?auto_2030837 ?auto_2030842 ) ) ( not ( = ?auto_2030834 ?auto_2030838 ) ) ( not ( = ?auto_2030834 ?auto_2030840 ) ) ( not ( = ?auto_2030834 ?auto_2030839 ) ) ( not ( = ?auto_2030834 ?auto_2030841 ) ) ( not ( = ?auto_2030834 ?auto_2030842 ) ) ( not ( = ?auto_2030838 ?auto_2030840 ) ) ( not ( = ?auto_2030838 ?auto_2030839 ) ) ( not ( = ?auto_2030838 ?auto_2030841 ) ) ( not ( = ?auto_2030838 ?auto_2030842 ) ) ( not ( = ?auto_2030840 ?auto_2030839 ) ) ( not ( = ?auto_2030840 ?auto_2030841 ) ) ( not ( = ?auto_2030840 ?auto_2030842 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2030839 ?auto_2030841 ?auto_2030842 )
      ( MAKE-8CRATE-VERIFY ?auto_2030835 ?auto_2030836 ?auto_2030837 ?auto_2030834 ?auto_2030838 ?auto_2030840 ?auto_2030839 ?auto_2030841 ?auto_2030842 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2030911 - SURFACE
      ?auto_2030912 - SURFACE
      ?auto_2030913 - SURFACE
      ?auto_2030910 - SURFACE
      ?auto_2030914 - SURFACE
      ?auto_2030916 - SURFACE
      ?auto_2030915 - SURFACE
      ?auto_2030917 - SURFACE
      ?auto_2030918 - SURFACE
    )
    :vars
    (
      ?auto_2030919 - HOIST
      ?auto_2030921 - PLACE
      ?auto_2030920 - TRUCK
      ?auto_2030922 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2030919 ?auto_2030921 ) ( SURFACE-AT ?auto_2030917 ?auto_2030921 ) ( CLEAR ?auto_2030917 ) ( IS-CRATE ?auto_2030918 ) ( not ( = ?auto_2030917 ?auto_2030918 ) ) ( AVAILABLE ?auto_2030919 ) ( IN ?auto_2030918 ?auto_2030920 ) ( ON ?auto_2030917 ?auto_2030915 ) ( not ( = ?auto_2030915 ?auto_2030917 ) ) ( not ( = ?auto_2030915 ?auto_2030918 ) ) ( TRUCK-AT ?auto_2030920 ?auto_2030922 ) ( not ( = ?auto_2030922 ?auto_2030921 ) ) ( ON ?auto_2030912 ?auto_2030911 ) ( ON ?auto_2030913 ?auto_2030912 ) ( ON ?auto_2030910 ?auto_2030913 ) ( ON ?auto_2030914 ?auto_2030910 ) ( ON ?auto_2030916 ?auto_2030914 ) ( ON ?auto_2030915 ?auto_2030916 ) ( not ( = ?auto_2030911 ?auto_2030912 ) ) ( not ( = ?auto_2030911 ?auto_2030913 ) ) ( not ( = ?auto_2030911 ?auto_2030910 ) ) ( not ( = ?auto_2030911 ?auto_2030914 ) ) ( not ( = ?auto_2030911 ?auto_2030916 ) ) ( not ( = ?auto_2030911 ?auto_2030915 ) ) ( not ( = ?auto_2030911 ?auto_2030917 ) ) ( not ( = ?auto_2030911 ?auto_2030918 ) ) ( not ( = ?auto_2030912 ?auto_2030913 ) ) ( not ( = ?auto_2030912 ?auto_2030910 ) ) ( not ( = ?auto_2030912 ?auto_2030914 ) ) ( not ( = ?auto_2030912 ?auto_2030916 ) ) ( not ( = ?auto_2030912 ?auto_2030915 ) ) ( not ( = ?auto_2030912 ?auto_2030917 ) ) ( not ( = ?auto_2030912 ?auto_2030918 ) ) ( not ( = ?auto_2030913 ?auto_2030910 ) ) ( not ( = ?auto_2030913 ?auto_2030914 ) ) ( not ( = ?auto_2030913 ?auto_2030916 ) ) ( not ( = ?auto_2030913 ?auto_2030915 ) ) ( not ( = ?auto_2030913 ?auto_2030917 ) ) ( not ( = ?auto_2030913 ?auto_2030918 ) ) ( not ( = ?auto_2030910 ?auto_2030914 ) ) ( not ( = ?auto_2030910 ?auto_2030916 ) ) ( not ( = ?auto_2030910 ?auto_2030915 ) ) ( not ( = ?auto_2030910 ?auto_2030917 ) ) ( not ( = ?auto_2030910 ?auto_2030918 ) ) ( not ( = ?auto_2030914 ?auto_2030916 ) ) ( not ( = ?auto_2030914 ?auto_2030915 ) ) ( not ( = ?auto_2030914 ?auto_2030917 ) ) ( not ( = ?auto_2030914 ?auto_2030918 ) ) ( not ( = ?auto_2030916 ?auto_2030915 ) ) ( not ( = ?auto_2030916 ?auto_2030917 ) ) ( not ( = ?auto_2030916 ?auto_2030918 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2030915 ?auto_2030917 ?auto_2030918 )
      ( MAKE-8CRATE-VERIFY ?auto_2030911 ?auto_2030912 ?auto_2030913 ?auto_2030910 ?auto_2030914 ?auto_2030916 ?auto_2030915 ?auto_2030917 ?auto_2030918 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2030995 - SURFACE
      ?auto_2030996 - SURFACE
      ?auto_2030997 - SURFACE
      ?auto_2030994 - SURFACE
      ?auto_2030998 - SURFACE
      ?auto_2031000 - SURFACE
      ?auto_2030999 - SURFACE
      ?auto_2031001 - SURFACE
      ?auto_2031002 - SURFACE
    )
    :vars
    (
      ?auto_2031006 - HOIST
      ?auto_2031007 - PLACE
      ?auto_2031005 - TRUCK
      ?auto_2031003 - PLACE
      ?auto_2031004 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2031006 ?auto_2031007 ) ( SURFACE-AT ?auto_2031001 ?auto_2031007 ) ( CLEAR ?auto_2031001 ) ( IS-CRATE ?auto_2031002 ) ( not ( = ?auto_2031001 ?auto_2031002 ) ) ( AVAILABLE ?auto_2031006 ) ( ON ?auto_2031001 ?auto_2030999 ) ( not ( = ?auto_2030999 ?auto_2031001 ) ) ( not ( = ?auto_2030999 ?auto_2031002 ) ) ( TRUCK-AT ?auto_2031005 ?auto_2031003 ) ( not ( = ?auto_2031003 ?auto_2031007 ) ) ( HOIST-AT ?auto_2031004 ?auto_2031003 ) ( LIFTING ?auto_2031004 ?auto_2031002 ) ( not ( = ?auto_2031006 ?auto_2031004 ) ) ( ON ?auto_2030996 ?auto_2030995 ) ( ON ?auto_2030997 ?auto_2030996 ) ( ON ?auto_2030994 ?auto_2030997 ) ( ON ?auto_2030998 ?auto_2030994 ) ( ON ?auto_2031000 ?auto_2030998 ) ( ON ?auto_2030999 ?auto_2031000 ) ( not ( = ?auto_2030995 ?auto_2030996 ) ) ( not ( = ?auto_2030995 ?auto_2030997 ) ) ( not ( = ?auto_2030995 ?auto_2030994 ) ) ( not ( = ?auto_2030995 ?auto_2030998 ) ) ( not ( = ?auto_2030995 ?auto_2031000 ) ) ( not ( = ?auto_2030995 ?auto_2030999 ) ) ( not ( = ?auto_2030995 ?auto_2031001 ) ) ( not ( = ?auto_2030995 ?auto_2031002 ) ) ( not ( = ?auto_2030996 ?auto_2030997 ) ) ( not ( = ?auto_2030996 ?auto_2030994 ) ) ( not ( = ?auto_2030996 ?auto_2030998 ) ) ( not ( = ?auto_2030996 ?auto_2031000 ) ) ( not ( = ?auto_2030996 ?auto_2030999 ) ) ( not ( = ?auto_2030996 ?auto_2031001 ) ) ( not ( = ?auto_2030996 ?auto_2031002 ) ) ( not ( = ?auto_2030997 ?auto_2030994 ) ) ( not ( = ?auto_2030997 ?auto_2030998 ) ) ( not ( = ?auto_2030997 ?auto_2031000 ) ) ( not ( = ?auto_2030997 ?auto_2030999 ) ) ( not ( = ?auto_2030997 ?auto_2031001 ) ) ( not ( = ?auto_2030997 ?auto_2031002 ) ) ( not ( = ?auto_2030994 ?auto_2030998 ) ) ( not ( = ?auto_2030994 ?auto_2031000 ) ) ( not ( = ?auto_2030994 ?auto_2030999 ) ) ( not ( = ?auto_2030994 ?auto_2031001 ) ) ( not ( = ?auto_2030994 ?auto_2031002 ) ) ( not ( = ?auto_2030998 ?auto_2031000 ) ) ( not ( = ?auto_2030998 ?auto_2030999 ) ) ( not ( = ?auto_2030998 ?auto_2031001 ) ) ( not ( = ?auto_2030998 ?auto_2031002 ) ) ( not ( = ?auto_2031000 ?auto_2030999 ) ) ( not ( = ?auto_2031000 ?auto_2031001 ) ) ( not ( = ?auto_2031000 ?auto_2031002 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2030999 ?auto_2031001 ?auto_2031002 )
      ( MAKE-8CRATE-VERIFY ?auto_2030995 ?auto_2030996 ?auto_2030997 ?auto_2030994 ?auto_2030998 ?auto_2031000 ?auto_2030999 ?auto_2031001 ?auto_2031002 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2031087 - SURFACE
      ?auto_2031088 - SURFACE
      ?auto_2031089 - SURFACE
      ?auto_2031086 - SURFACE
      ?auto_2031090 - SURFACE
      ?auto_2031092 - SURFACE
      ?auto_2031091 - SURFACE
      ?auto_2031093 - SURFACE
      ?auto_2031094 - SURFACE
    )
    :vars
    (
      ?auto_2031099 - HOIST
      ?auto_2031100 - PLACE
      ?auto_2031095 - TRUCK
      ?auto_2031097 - PLACE
      ?auto_2031096 - HOIST
      ?auto_2031098 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2031099 ?auto_2031100 ) ( SURFACE-AT ?auto_2031093 ?auto_2031100 ) ( CLEAR ?auto_2031093 ) ( IS-CRATE ?auto_2031094 ) ( not ( = ?auto_2031093 ?auto_2031094 ) ) ( AVAILABLE ?auto_2031099 ) ( ON ?auto_2031093 ?auto_2031091 ) ( not ( = ?auto_2031091 ?auto_2031093 ) ) ( not ( = ?auto_2031091 ?auto_2031094 ) ) ( TRUCK-AT ?auto_2031095 ?auto_2031097 ) ( not ( = ?auto_2031097 ?auto_2031100 ) ) ( HOIST-AT ?auto_2031096 ?auto_2031097 ) ( not ( = ?auto_2031099 ?auto_2031096 ) ) ( AVAILABLE ?auto_2031096 ) ( SURFACE-AT ?auto_2031094 ?auto_2031097 ) ( ON ?auto_2031094 ?auto_2031098 ) ( CLEAR ?auto_2031094 ) ( not ( = ?auto_2031093 ?auto_2031098 ) ) ( not ( = ?auto_2031094 ?auto_2031098 ) ) ( not ( = ?auto_2031091 ?auto_2031098 ) ) ( ON ?auto_2031088 ?auto_2031087 ) ( ON ?auto_2031089 ?auto_2031088 ) ( ON ?auto_2031086 ?auto_2031089 ) ( ON ?auto_2031090 ?auto_2031086 ) ( ON ?auto_2031092 ?auto_2031090 ) ( ON ?auto_2031091 ?auto_2031092 ) ( not ( = ?auto_2031087 ?auto_2031088 ) ) ( not ( = ?auto_2031087 ?auto_2031089 ) ) ( not ( = ?auto_2031087 ?auto_2031086 ) ) ( not ( = ?auto_2031087 ?auto_2031090 ) ) ( not ( = ?auto_2031087 ?auto_2031092 ) ) ( not ( = ?auto_2031087 ?auto_2031091 ) ) ( not ( = ?auto_2031087 ?auto_2031093 ) ) ( not ( = ?auto_2031087 ?auto_2031094 ) ) ( not ( = ?auto_2031087 ?auto_2031098 ) ) ( not ( = ?auto_2031088 ?auto_2031089 ) ) ( not ( = ?auto_2031088 ?auto_2031086 ) ) ( not ( = ?auto_2031088 ?auto_2031090 ) ) ( not ( = ?auto_2031088 ?auto_2031092 ) ) ( not ( = ?auto_2031088 ?auto_2031091 ) ) ( not ( = ?auto_2031088 ?auto_2031093 ) ) ( not ( = ?auto_2031088 ?auto_2031094 ) ) ( not ( = ?auto_2031088 ?auto_2031098 ) ) ( not ( = ?auto_2031089 ?auto_2031086 ) ) ( not ( = ?auto_2031089 ?auto_2031090 ) ) ( not ( = ?auto_2031089 ?auto_2031092 ) ) ( not ( = ?auto_2031089 ?auto_2031091 ) ) ( not ( = ?auto_2031089 ?auto_2031093 ) ) ( not ( = ?auto_2031089 ?auto_2031094 ) ) ( not ( = ?auto_2031089 ?auto_2031098 ) ) ( not ( = ?auto_2031086 ?auto_2031090 ) ) ( not ( = ?auto_2031086 ?auto_2031092 ) ) ( not ( = ?auto_2031086 ?auto_2031091 ) ) ( not ( = ?auto_2031086 ?auto_2031093 ) ) ( not ( = ?auto_2031086 ?auto_2031094 ) ) ( not ( = ?auto_2031086 ?auto_2031098 ) ) ( not ( = ?auto_2031090 ?auto_2031092 ) ) ( not ( = ?auto_2031090 ?auto_2031091 ) ) ( not ( = ?auto_2031090 ?auto_2031093 ) ) ( not ( = ?auto_2031090 ?auto_2031094 ) ) ( not ( = ?auto_2031090 ?auto_2031098 ) ) ( not ( = ?auto_2031092 ?auto_2031091 ) ) ( not ( = ?auto_2031092 ?auto_2031093 ) ) ( not ( = ?auto_2031092 ?auto_2031094 ) ) ( not ( = ?auto_2031092 ?auto_2031098 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2031091 ?auto_2031093 ?auto_2031094 )
      ( MAKE-8CRATE-VERIFY ?auto_2031087 ?auto_2031088 ?auto_2031089 ?auto_2031086 ?auto_2031090 ?auto_2031092 ?auto_2031091 ?auto_2031093 ?auto_2031094 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2031180 - SURFACE
      ?auto_2031181 - SURFACE
      ?auto_2031182 - SURFACE
      ?auto_2031179 - SURFACE
      ?auto_2031183 - SURFACE
      ?auto_2031185 - SURFACE
      ?auto_2031184 - SURFACE
      ?auto_2031186 - SURFACE
      ?auto_2031187 - SURFACE
    )
    :vars
    (
      ?auto_2031191 - HOIST
      ?auto_2031192 - PLACE
      ?auto_2031189 - PLACE
      ?auto_2031193 - HOIST
      ?auto_2031188 - SURFACE
      ?auto_2031190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2031191 ?auto_2031192 ) ( SURFACE-AT ?auto_2031186 ?auto_2031192 ) ( CLEAR ?auto_2031186 ) ( IS-CRATE ?auto_2031187 ) ( not ( = ?auto_2031186 ?auto_2031187 ) ) ( AVAILABLE ?auto_2031191 ) ( ON ?auto_2031186 ?auto_2031184 ) ( not ( = ?auto_2031184 ?auto_2031186 ) ) ( not ( = ?auto_2031184 ?auto_2031187 ) ) ( not ( = ?auto_2031189 ?auto_2031192 ) ) ( HOIST-AT ?auto_2031193 ?auto_2031189 ) ( not ( = ?auto_2031191 ?auto_2031193 ) ) ( AVAILABLE ?auto_2031193 ) ( SURFACE-AT ?auto_2031187 ?auto_2031189 ) ( ON ?auto_2031187 ?auto_2031188 ) ( CLEAR ?auto_2031187 ) ( not ( = ?auto_2031186 ?auto_2031188 ) ) ( not ( = ?auto_2031187 ?auto_2031188 ) ) ( not ( = ?auto_2031184 ?auto_2031188 ) ) ( TRUCK-AT ?auto_2031190 ?auto_2031192 ) ( ON ?auto_2031181 ?auto_2031180 ) ( ON ?auto_2031182 ?auto_2031181 ) ( ON ?auto_2031179 ?auto_2031182 ) ( ON ?auto_2031183 ?auto_2031179 ) ( ON ?auto_2031185 ?auto_2031183 ) ( ON ?auto_2031184 ?auto_2031185 ) ( not ( = ?auto_2031180 ?auto_2031181 ) ) ( not ( = ?auto_2031180 ?auto_2031182 ) ) ( not ( = ?auto_2031180 ?auto_2031179 ) ) ( not ( = ?auto_2031180 ?auto_2031183 ) ) ( not ( = ?auto_2031180 ?auto_2031185 ) ) ( not ( = ?auto_2031180 ?auto_2031184 ) ) ( not ( = ?auto_2031180 ?auto_2031186 ) ) ( not ( = ?auto_2031180 ?auto_2031187 ) ) ( not ( = ?auto_2031180 ?auto_2031188 ) ) ( not ( = ?auto_2031181 ?auto_2031182 ) ) ( not ( = ?auto_2031181 ?auto_2031179 ) ) ( not ( = ?auto_2031181 ?auto_2031183 ) ) ( not ( = ?auto_2031181 ?auto_2031185 ) ) ( not ( = ?auto_2031181 ?auto_2031184 ) ) ( not ( = ?auto_2031181 ?auto_2031186 ) ) ( not ( = ?auto_2031181 ?auto_2031187 ) ) ( not ( = ?auto_2031181 ?auto_2031188 ) ) ( not ( = ?auto_2031182 ?auto_2031179 ) ) ( not ( = ?auto_2031182 ?auto_2031183 ) ) ( not ( = ?auto_2031182 ?auto_2031185 ) ) ( not ( = ?auto_2031182 ?auto_2031184 ) ) ( not ( = ?auto_2031182 ?auto_2031186 ) ) ( not ( = ?auto_2031182 ?auto_2031187 ) ) ( not ( = ?auto_2031182 ?auto_2031188 ) ) ( not ( = ?auto_2031179 ?auto_2031183 ) ) ( not ( = ?auto_2031179 ?auto_2031185 ) ) ( not ( = ?auto_2031179 ?auto_2031184 ) ) ( not ( = ?auto_2031179 ?auto_2031186 ) ) ( not ( = ?auto_2031179 ?auto_2031187 ) ) ( not ( = ?auto_2031179 ?auto_2031188 ) ) ( not ( = ?auto_2031183 ?auto_2031185 ) ) ( not ( = ?auto_2031183 ?auto_2031184 ) ) ( not ( = ?auto_2031183 ?auto_2031186 ) ) ( not ( = ?auto_2031183 ?auto_2031187 ) ) ( not ( = ?auto_2031183 ?auto_2031188 ) ) ( not ( = ?auto_2031185 ?auto_2031184 ) ) ( not ( = ?auto_2031185 ?auto_2031186 ) ) ( not ( = ?auto_2031185 ?auto_2031187 ) ) ( not ( = ?auto_2031185 ?auto_2031188 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2031184 ?auto_2031186 ?auto_2031187 )
      ( MAKE-8CRATE-VERIFY ?auto_2031180 ?auto_2031181 ?auto_2031182 ?auto_2031179 ?auto_2031183 ?auto_2031185 ?auto_2031184 ?auto_2031186 ?auto_2031187 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2031273 - SURFACE
      ?auto_2031274 - SURFACE
      ?auto_2031275 - SURFACE
      ?auto_2031272 - SURFACE
      ?auto_2031276 - SURFACE
      ?auto_2031278 - SURFACE
      ?auto_2031277 - SURFACE
      ?auto_2031279 - SURFACE
      ?auto_2031280 - SURFACE
    )
    :vars
    (
      ?auto_2031281 - HOIST
      ?auto_2031284 - PLACE
      ?auto_2031285 - PLACE
      ?auto_2031286 - HOIST
      ?auto_2031282 - SURFACE
      ?auto_2031283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2031281 ?auto_2031284 ) ( IS-CRATE ?auto_2031280 ) ( not ( = ?auto_2031279 ?auto_2031280 ) ) ( not ( = ?auto_2031277 ?auto_2031279 ) ) ( not ( = ?auto_2031277 ?auto_2031280 ) ) ( not ( = ?auto_2031285 ?auto_2031284 ) ) ( HOIST-AT ?auto_2031286 ?auto_2031285 ) ( not ( = ?auto_2031281 ?auto_2031286 ) ) ( AVAILABLE ?auto_2031286 ) ( SURFACE-AT ?auto_2031280 ?auto_2031285 ) ( ON ?auto_2031280 ?auto_2031282 ) ( CLEAR ?auto_2031280 ) ( not ( = ?auto_2031279 ?auto_2031282 ) ) ( not ( = ?auto_2031280 ?auto_2031282 ) ) ( not ( = ?auto_2031277 ?auto_2031282 ) ) ( TRUCK-AT ?auto_2031283 ?auto_2031284 ) ( SURFACE-AT ?auto_2031277 ?auto_2031284 ) ( CLEAR ?auto_2031277 ) ( LIFTING ?auto_2031281 ?auto_2031279 ) ( IS-CRATE ?auto_2031279 ) ( ON ?auto_2031274 ?auto_2031273 ) ( ON ?auto_2031275 ?auto_2031274 ) ( ON ?auto_2031272 ?auto_2031275 ) ( ON ?auto_2031276 ?auto_2031272 ) ( ON ?auto_2031278 ?auto_2031276 ) ( ON ?auto_2031277 ?auto_2031278 ) ( not ( = ?auto_2031273 ?auto_2031274 ) ) ( not ( = ?auto_2031273 ?auto_2031275 ) ) ( not ( = ?auto_2031273 ?auto_2031272 ) ) ( not ( = ?auto_2031273 ?auto_2031276 ) ) ( not ( = ?auto_2031273 ?auto_2031278 ) ) ( not ( = ?auto_2031273 ?auto_2031277 ) ) ( not ( = ?auto_2031273 ?auto_2031279 ) ) ( not ( = ?auto_2031273 ?auto_2031280 ) ) ( not ( = ?auto_2031273 ?auto_2031282 ) ) ( not ( = ?auto_2031274 ?auto_2031275 ) ) ( not ( = ?auto_2031274 ?auto_2031272 ) ) ( not ( = ?auto_2031274 ?auto_2031276 ) ) ( not ( = ?auto_2031274 ?auto_2031278 ) ) ( not ( = ?auto_2031274 ?auto_2031277 ) ) ( not ( = ?auto_2031274 ?auto_2031279 ) ) ( not ( = ?auto_2031274 ?auto_2031280 ) ) ( not ( = ?auto_2031274 ?auto_2031282 ) ) ( not ( = ?auto_2031275 ?auto_2031272 ) ) ( not ( = ?auto_2031275 ?auto_2031276 ) ) ( not ( = ?auto_2031275 ?auto_2031278 ) ) ( not ( = ?auto_2031275 ?auto_2031277 ) ) ( not ( = ?auto_2031275 ?auto_2031279 ) ) ( not ( = ?auto_2031275 ?auto_2031280 ) ) ( not ( = ?auto_2031275 ?auto_2031282 ) ) ( not ( = ?auto_2031272 ?auto_2031276 ) ) ( not ( = ?auto_2031272 ?auto_2031278 ) ) ( not ( = ?auto_2031272 ?auto_2031277 ) ) ( not ( = ?auto_2031272 ?auto_2031279 ) ) ( not ( = ?auto_2031272 ?auto_2031280 ) ) ( not ( = ?auto_2031272 ?auto_2031282 ) ) ( not ( = ?auto_2031276 ?auto_2031278 ) ) ( not ( = ?auto_2031276 ?auto_2031277 ) ) ( not ( = ?auto_2031276 ?auto_2031279 ) ) ( not ( = ?auto_2031276 ?auto_2031280 ) ) ( not ( = ?auto_2031276 ?auto_2031282 ) ) ( not ( = ?auto_2031278 ?auto_2031277 ) ) ( not ( = ?auto_2031278 ?auto_2031279 ) ) ( not ( = ?auto_2031278 ?auto_2031280 ) ) ( not ( = ?auto_2031278 ?auto_2031282 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2031277 ?auto_2031279 ?auto_2031280 )
      ( MAKE-8CRATE-VERIFY ?auto_2031273 ?auto_2031274 ?auto_2031275 ?auto_2031272 ?auto_2031276 ?auto_2031278 ?auto_2031277 ?auto_2031279 ?auto_2031280 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2031366 - SURFACE
      ?auto_2031367 - SURFACE
      ?auto_2031368 - SURFACE
      ?auto_2031365 - SURFACE
      ?auto_2031369 - SURFACE
      ?auto_2031371 - SURFACE
      ?auto_2031370 - SURFACE
      ?auto_2031372 - SURFACE
      ?auto_2031373 - SURFACE
    )
    :vars
    (
      ?auto_2031374 - HOIST
      ?auto_2031379 - PLACE
      ?auto_2031376 - PLACE
      ?auto_2031378 - HOIST
      ?auto_2031375 - SURFACE
      ?auto_2031377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2031374 ?auto_2031379 ) ( IS-CRATE ?auto_2031373 ) ( not ( = ?auto_2031372 ?auto_2031373 ) ) ( not ( = ?auto_2031370 ?auto_2031372 ) ) ( not ( = ?auto_2031370 ?auto_2031373 ) ) ( not ( = ?auto_2031376 ?auto_2031379 ) ) ( HOIST-AT ?auto_2031378 ?auto_2031376 ) ( not ( = ?auto_2031374 ?auto_2031378 ) ) ( AVAILABLE ?auto_2031378 ) ( SURFACE-AT ?auto_2031373 ?auto_2031376 ) ( ON ?auto_2031373 ?auto_2031375 ) ( CLEAR ?auto_2031373 ) ( not ( = ?auto_2031372 ?auto_2031375 ) ) ( not ( = ?auto_2031373 ?auto_2031375 ) ) ( not ( = ?auto_2031370 ?auto_2031375 ) ) ( TRUCK-AT ?auto_2031377 ?auto_2031379 ) ( SURFACE-AT ?auto_2031370 ?auto_2031379 ) ( CLEAR ?auto_2031370 ) ( IS-CRATE ?auto_2031372 ) ( AVAILABLE ?auto_2031374 ) ( IN ?auto_2031372 ?auto_2031377 ) ( ON ?auto_2031367 ?auto_2031366 ) ( ON ?auto_2031368 ?auto_2031367 ) ( ON ?auto_2031365 ?auto_2031368 ) ( ON ?auto_2031369 ?auto_2031365 ) ( ON ?auto_2031371 ?auto_2031369 ) ( ON ?auto_2031370 ?auto_2031371 ) ( not ( = ?auto_2031366 ?auto_2031367 ) ) ( not ( = ?auto_2031366 ?auto_2031368 ) ) ( not ( = ?auto_2031366 ?auto_2031365 ) ) ( not ( = ?auto_2031366 ?auto_2031369 ) ) ( not ( = ?auto_2031366 ?auto_2031371 ) ) ( not ( = ?auto_2031366 ?auto_2031370 ) ) ( not ( = ?auto_2031366 ?auto_2031372 ) ) ( not ( = ?auto_2031366 ?auto_2031373 ) ) ( not ( = ?auto_2031366 ?auto_2031375 ) ) ( not ( = ?auto_2031367 ?auto_2031368 ) ) ( not ( = ?auto_2031367 ?auto_2031365 ) ) ( not ( = ?auto_2031367 ?auto_2031369 ) ) ( not ( = ?auto_2031367 ?auto_2031371 ) ) ( not ( = ?auto_2031367 ?auto_2031370 ) ) ( not ( = ?auto_2031367 ?auto_2031372 ) ) ( not ( = ?auto_2031367 ?auto_2031373 ) ) ( not ( = ?auto_2031367 ?auto_2031375 ) ) ( not ( = ?auto_2031368 ?auto_2031365 ) ) ( not ( = ?auto_2031368 ?auto_2031369 ) ) ( not ( = ?auto_2031368 ?auto_2031371 ) ) ( not ( = ?auto_2031368 ?auto_2031370 ) ) ( not ( = ?auto_2031368 ?auto_2031372 ) ) ( not ( = ?auto_2031368 ?auto_2031373 ) ) ( not ( = ?auto_2031368 ?auto_2031375 ) ) ( not ( = ?auto_2031365 ?auto_2031369 ) ) ( not ( = ?auto_2031365 ?auto_2031371 ) ) ( not ( = ?auto_2031365 ?auto_2031370 ) ) ( not ( = ?auto_2031365 ?auto_2031372 ) ) ( not ( = ?auto_2031365 ?auto_2031373 ) ) ( not ( = ?auto_2031365 ?auto_2031375 ) ) ( not ( = ?auto_2031369 ?auto_2031371 ) ) ( not ( = ?auto_2031369 ?auto_2031370 ) ) ( not ( = ?auto_2031369 ?auto_2031372 ) ) ( not ( = ?auto_2031369 ?auto_2031373 ) ) ( not ( = ?auto_2031369 ?auto_2031375 ) ) ( not ( = ?auto_2031371 ?auto_2031370 ) ) ( not ( = ?auto_2031371 ?auto_2031372 ) ) ( not ( = ?auto_2031371 ?auto_2031373 ) ) ( not ( = ?auto_2031371 ?auto_2031375 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2031370 ?auto_2031372 ?auto_2031373 )
      ( MAKE-8CRATE-VERIFY ?auto_2031366 ?auto_2031367 ?auto_2031368 ?auto_2031365 ?auto_2031369 ?auto_2031371 ?auto_2031370 ?auto_2031372 ?auto_2031373 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2035482 - SURFACE
      ?auto_2035483 - SURFACE
      ?auto_2035484 - SURFACE
      ?auto_2035481 - SURFACE
      ?auto_2035485 - SURFACE
      ?auto_2035487 - SURFACE
      ?auto_2035486 - SURFACE
      ?auto_2035488 - SURFACE
      ?auto_2035489 - SURFACE
      ?auto_2035490 - SURFACE
    )
    :vars
    (
      ?auto_2035491 - HOIST
      ?auto_2035492 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035491 ?auto_2035492 ) ( SURFACE-AT ?auto_2035489 ?auto_2035492 ) ( CLEAR ?auto_2035489 ) ( LIFTING ?auto_2035491 ?auto_2035490 ) ( IS-CRATE ?auto_2035490 ) ( not ( = ?auto_2035489 ?auto_2035490 ) ) ( ON ?auto_2035483 ?auto_2035482 ) ( ON ?auto_2035484 ?auto_2035483 ) ( ON ?auto_2035481 ?auto_2035484 ) ( ON ?auto_2035485 ?auto_2035481 ) ( ON ?auto_2035487 ?auto_2035485 ) ( ON ?auto_2035486 ?auto_2035487 ) ( ON ?auto_2035488 ?auto_2035486 ) ( ON ?auto_2035489 ?auto_2035488 ) ( not ( = ?auto_2035482 ?auto_2035483 ) ) ( not ( = ?auto_2035482 ?auto_2035484 ) ) ( not ( = ?auto_2035482 ?auto_2035481 ) ) ( not ( = ?auto_2035482 ?auto_2035485 ) ) ( not ( = ?auto_2035482 ?auto_2035487 ) ) ( not ( = ?auto_2035482 ?auto_2035486 ) ) ( not ( = ?auto_2035482 ?auto_2035488 ) ) ( not ( = ?auto_2035482 ?auto_2035489 ) ) ( not ( = ?auto_2035482 ?auto_2035490 ) ) ( not ( = ?auto_2035483 ?auto_2035484 ) ) ( not ( = ?auto_2035483 ?auto_2035481 ) ) ( not ( = ?auto_2035483 ?auto_2035485 ) ) ( not ( = ?auto_2035483 ?auto_2035487 ) ) ( not ( = ?auto_2035483 ?auto_2035486 ) ) ( not ( = ?auto_2035483 ?auto_2035488 ) ) ( not ( = ?auto_2035483 ?auto_2035489 ) ) ( not ( = ?auto_2035483 ?auto_2035490 ) ) ( not ( = ?auto_2035484 ?auto_2035481 ) ) ( not ( = ?auto_2035484 ?auto_2035485 ) ) ( not ( = ?auto_2035484 ?auto_2035487 ) ) ( not ( = ?auto_2035484 ?auto_2035486 ) ) ( not ( = ?auto_2035484 ?auto_2035488 ) ) ( not ( = ?auto_2035484 ?auto_2035489 ) ) ( not ( = ?auto_2035484 ?auto_2035490 ) ) ( not ( = ?auto_2035481 ?auto_2035485 ) ) ( not ( = ?auto_2035481 ?auto_2035487 ) ) ( not ( = ?auto_2035481 ?auto_2035486 ) ) ( not ( = ?auto_2035481 ?auto_2035488 ) ) ( not ( = ?auto_2035481 ?auto_2035489 ) ) ( not ( = ?auto_2035481 ?auto_2035490 ) ) ( not ( = ?auto_2035485 ?auto_2035487 ) ) ( not ( = ?auto_2035485 ?auto_2035486 ) ) ( not ( = ?auto_2035485 ?auto_2035488 ) ) ( not ( = ?auto_2035485 ?auto_2035489 ) ) ( not ( = ?auto_2035485 ?auto_2035490 ) ) ( not ( = ?auto_2035487 ?auto_2035486 ) ) ( not ( = ?auto_2035487 ?auto_2035488 ) ) ( not ( = ?auto_2035487 ?auto_2035489 ) ) ( not ( = ?auto_2035487 ?auto_2035490 ) ) ( not ( = ?auto_2035486 ?auto_2035488 ) ) ( not ( = ?auto_2035486 ?auto_2035489 ) ) ( not ( = ?auto_2035486 ?auto_2035490 ) ) ( not ( = ?auto_2035488 ?auto_2035489 ) ) ( not ( = ?auto_2035488 ?auto_2035490 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2035489 ?auto_2035490 )
      ( MAKE-9CRATE-VERIFY ?auto_2035482 ?auto_2035483 ?auto_2035484 ?auto_2035481 ?auto_2035485 ?auto_2035487 ?auto_2035486 ?auto_2035488 ?auto_2035489 ?auto_2035490 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2035562 - SURFACE
      ?auto_2035563 - SURFACE
      ?auto_2035564 - SURFACE
      ?auto_2035561 - SURFACE
      ?auto_2035565 - SURFACE
      ?auto_2035567 - SURFACE
      ?auto_2035566 - SURFACE
      ?auto_2035568 - SURFACE
      ?auto_2035569 - SURFACE
      ?auto_2035570 - SURFACE
    )
    :vars
    (
      ?auto_2035571 - HOIST
      ?auto_2035573 - PLACE
      ?auto_2035572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035571 ?auto_2035573 ) ( SURFACE-AT ?auto_2035569 ?auto_2035573 ) ( CLEAR ?auto_2035569 ) ( IS-CRATE ?auto_2035570 ) ( not ( = ?auto_2035569 ?auto_2035570 ) ) ( TRUCK-AT ?auto_2035572 ?auto_2035573 ) ( AVAILABLE ?auto_2035571 ) ( IN ?auto_2035570 ?auto_2035572 ) ( ON ?auto_2035569 ?auto_2035568 ) ( not ( = ?auto_2035568 ?auto_2035569 ) ) ( not ( = ?auto_2035568 ?auto_2035570 ) ) ( ON ?auto_2035563 ?auto_2035562 ) ( ON ?auto_2035564 ?auto_2035563 ) ( ON ?auto_2035561 ?auto_2035564 ) ( ON ?auto_2035565 ?auto_2035561 ) ( ON ?auto_2035567 ?auto_2035565 ) ( ON ?auto_2035566 ?auto_2035567 ) ( ON ?auto_2035568 ?auto_2035566 ) ( not ( = ?auto_2035562 ?auto_2035563 ) ) ( not ( = ?auto_2035562 ?auto_2035564 ) ) ( not ( = ?auto_2035562 ?auto_2035561 ) ) ( not ( = ?auto_2035562 ?auto_2035565 ) ) ( not ( = ?auto_2035562 ?auto_2035567 ) ) ( not ( = ?auto_2035562 ?auto_2035566 ) ) ( not ( = ?auto_2035562 ?auto_2035568 ) ) ( not ( = ?auto_2035562 ?auto_2035569 ) ) ( not ( = ?auto_2035562 ?auto_2035570 ) ) ( not ( = ?auto_2035563 ?auto_2035564 ) ) ( not ( = ?auto_2035563 ?auto_2035561 ) ) ( not ( = ?auto_2035563 ?auto_2035565 ) ) ( not ( = ?auto_2035563 ?auto_2035567 ) ) ( not ( = ?auto_2035563 ?auto_2035566 ) ) ( not ( = ?auto_2035563 ?auto_2035568 ) ) ( not ( = ?auto_2035563 ?auto_2035569 ) ) ( not ( = ?auto_2035563 ?auto_2035570 ) ) ( not ( = ?auto_2035564 ?auto_2035561 ) ) ( not ( = ?auto_2035564 ?auto_2035565 ) ) ( not ( = ?auto_2035564 ?auto_2035567 ) ) ( not ( = ?auto_2035564 ?auto_2035566 ) ) ( not ( = ?auto_2035564 ?auto_2035568 ) ) ( not ( = ?auto_2035564 ?auto_2035569 ) ) ( not ( = ?auto_2035564 ?auto_2035570 ) ) ( not ( = ?auto_2035561 ?auto_2035565 ) ) ( not ( = ?auto_2035561 ?auto_2035567 ) ) ( not ( = ?auto_2035561 ?auto_2035566 ) ) ( not ( = ?auto_2035561 ?auto_2035568 ) ) ( not ( = ?auto_2035561 ?auto_2035569 ) ) ( not ( = ?auto_2035561 ?auto_2035570 ) ) ( not ( = ?auto_2035565 ?auto_2035567 ) ) ( not ( = ?auto_2035565 ?auto_2035566 ) ) ( not ( = ?auto_2035565 ?auto_2035568 ) ) ( not ( = ?auto_2035565 ?auto_2035569 ) ) ( not ( = ?auto_2035565 ?auto_2035570 ) ) ( not ( = ?auto_2035567 ?auto_2035566 ) ) ( not ( = ?auto_2035567 ?auto_2035568 ) ) ( not ( = ?auto_2035567 ?auto_2035569 ) ) ( not ( = ?auto_2035567 ?auto_2035570 ) ) ( not ( = ?auto_2035566 ?auto_2035568 ) ) ( not ( = ?auto_2035566 ?auto_2035569 ) ) ( not ( = ?auto_2035566 ?auto_2035570 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2035568 ?auto_2035569 ?auto_2035570 )
      ( MAKE-9CRATE-VERIFY ?auto_2035562 ?auto_2035563 ?auto_2035564 ?auto_2035561 ?auto_2035565 ?auto_2035567 ?auto_2035566 ?auto_2035568 ?auto_2035569 ?auto_2035570 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2035652 - SURFACE
      ?auto_2035653 - SURFACE
      ?auto_2035654 - SURFACE
      ?auto_2035651 - SURFACE
      ?auto_2035655 - SURFACE
      ?auto_2035657 - SURFACE
      ?auto_2035656 - SURFACE
      ?auto_2035658 - SURFACE
      ?auto_2035659 - SURFACE
      ?auto_2035660 - SURFACE
    )
    :vars
    (
      ?auto_2035662 - HOIST
      ?auto_2035663 - PLACE
      ?auto_2035664 - TRUCK
      ?auto_2035661 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035662 ?auto_2035663 ) ( SURFACE-AT ?auto_2035659 ?auto_2035663 ) ( CLEAR ?auto_2035659 ) ( IS-CRATE ?auto_2035660 ) ( not ( = ?auto_2035659 ?auto_2035660 ) ) ( AVAILABLE ?auto_2035662 ) ( IN ?auto_2035660 ?auto_2035664 ) ( ON ?auto_2035659 ?auto_2035658 ) ( not ( = ?auto_2035658 ?auto_2035659 ) ) ( not ( = ?auto_2035658 ?auto_2035660 ) ) ( TRUCK-AT ?auto_2035664 ?auto_2035661 ) ( not ( = ?auto_2035661 ?auto_2035663 ) ) ( ON ?auto_2035653 ?auto_2035652 ) ( ON ?auto_2035654 ?auto_2035653 ) ( ON ?auto_2035651 ?auto_2035654 ) ( ON ?auto_2035655 ?auto_2035651 ) ( ON ?auto_2035657 ?auto_2035655 ) ( ON ?auto_2035656 ?auto_2035657 ) ( ON ?auto_2035658 ?auto_2035656 ) ( not ( = ?auto_2035652 ?auto_2035653 ) ) ( not ( = ?auto_2035652 ?auto_2035654 ) ) ( not ( = ?auto_2035652 ?auto_2035651 ) ) ( not ( = ?auto_2035652 ?auto_2035655 ) ) ( not ( = ?auto_2035652 ?auto_2035657 ) ) ( not ( = ?auto_2035652 ?auto_2035656 ) ) ( not ( = ?auto_2035652 ?auto_2035658 ) ) ( not ( = ?auto_2035652 ?auto_2035659 ) ) ( not ( = ?auto_2035652 ?auto_2035660 ) ) ( not ( = ?auto_2035653 ?auto_2035654 ) ) ( not ( = ?auto_2035653 ?auto_2035651 ) ) ( not ( = ?auto_2035653 ?auto_2035655 ) ) ( not ( = ?auto_2035653 ?auto_2035657 ) ) ( not ( = ?auto_2035653 ?auto_2035656 ) ) ( not ( = ?auto_2035653 ?auto_2035658 ) ) ( not ( = ?auto_2035653 ?auto_2035659 ) ) ( not ( = ?auto_2035653 ?auto_2035660 ) ) ( not ( = ?auto_2035654 ?auto_2035651 ) ) ( not ( = ?auto_2035654 ?auto_2035655 ) ) ( not ( = ?auto_2035654 ?auto_2035657 ) ) ( not ( = ?auto_2035654 ?auto_2035656 ) ) ( not ( = ?auto_2035654 ?auto_2035658 ) ) ( not ( = ?auto_2035654 ?auto_2035659 ) ) ( not ( = ?auto_2035654 ?auto_2035660 ) ) ( not ( = ?auto_2035651 ?auto_2035655 ) ) ( not ( = ?auto_2035651 ?auto_2035657 ) ) ( not ( = ?auto_2035651 ?auto_2035656 ) ) ( not ( = ?auto_2035651 ?auto_2035658 ) ) ( not ( = ?auto_2035651 ?auto_2035659 ) ) ( not ( = ?auto_2035651 ?auto_2035660 ) ) ( not ( = ?auto_2035655 ?auto_2035657 ) ) ( not ( = ?auto_2035655 ?auto_2035656 ) ) ( not ( = ?auto_2035655 ?auto_2035658 ) ) ( not ( = ?auto_2035655 ?auto_2035659 ) ) ( not ( = ?auto_2035655 ?auto_2035660 ) ) ( not ( = ?auto_2035657 ?auto_2035656 ) ) ( not ( = ?auto_2035657 ?auto_2035658 ) ) ( not ( = ?auto_2035657 ?auto_2035659 ) ) ( not ( = ?auto_2035657 ?auto_2035660 ) ) ( not ( = ?auto_2035656 ?auto_2035658 ) ) ( not ( = ?auto_2035656 ?auto_2035659 ) ) ( not ( = ?auto_2035656 ?auto_2035660 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2035658 ?auto_2035659 ?auto_2035660 )
      ( MAKE-9CRATE-VERIFY ?auto_2035652 ?auto_2035653 ?auto_2035654 ?auto_2035651 ?auto_2035655 ?auto_2035657 ?auto_2035656 ?auto_2035658 ?auto_2035659 ?auto_2035660 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2035751 - SURFACE
      ?auto_2035752 - SURFACE
      ?auto_2035753 - SURFACE
      ?auto_2035750 - SURFACE
      ?auto_2035754 - SURFACE
      ?auto_2035756 - SURFACE
      ?auto_2035755 - SURFACE
      ?auto_2035757 - SURFACE
      ?auto_2035758 - SURFACE
      ?auto_2035759 - SURFACE
    )
    :vars
    (
      ?auto_2035762 - HOIST
      ?auto_2035761 - PLACE
      ?auto_2035760 - TRUCK
      ?auto_2035764 - PLACE
      ?auto_2035763 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035762 ?auto_2035761 ) ( SURFACE-AT ?auto_2035758 ?auto_2035761 ) ( CLEAR ?auto_2035758 ) ( IS-CRATE ?auto_2035759 ) ( not ( = ?auto_2035758 ?auto_2035759 ) ) ( AVAILABLE ?auto_2035762 ) ( ON ?auto_2035758 ?auto_2035757 ) ( not ( = ?auto_2035757 ?auto_2035758 ) ) ( not ( = ?auto_2035757 ?auto_2035759 ) ) ( TRUCK-AT ?auto_2035760 ?auto_2035764 ) ( not ( = ?auto_2035764 ?auto_2035761 ) ) ( HOIST-AT ?auto_2035763 ?auto_2035764 ) ( LIFTING ?auto_2035763 ?auto_2035759 ) ( not ( = ?auto_2035762 ?auto_2035763 ) ) ( ON ?auto_2035752 ?auto_2035751 ) ( ON ?auto_2035753 ?auto_2035752 ) ( ON ?auto_2035750 ?auto_2035753 ) ( ON ?auto_2035754 ?auto_2035750 ) ( ON ?auto_2035756 ?auto_2035754 ) ( ON ?auto_2035755 ?auto_2035756 ) ( ON ?auto_2035757 ?auto_2035755 ) ( not ( = ?auto_2035751 ?auto_2035752 ) ) ( not ( = ?auto_2035751 ?auto_2035753 ) ) ( not ( = ?auto_2035751 ?auto_2035750 ) ) ( not ( = ?auto_2035751 ?auto_2035754 ) ) ( not ( = ?auto_2035751 ?auto_2035756 ) ) ( not ( = ?auto_2035751 ?auto_2035755 ) ) ( not ( = ?auto_2035751 ?auto_2035757 ) ) ( not ( = ?auto_2035751 ?auto_2035758 ) ) ( not ( = ?auto_2035751 ?auto_2035759 ) ) ( not ( = ?auto_2035752 ?auto_2035753 ) ) ( not ( = ?auto_2035752 ?auto_2035750 ) ) ( not ( = ?auto_2035752 ?auto_2035754 ) ) ( not ( = ?auto_2035752 ?auto_2035756 ) ) ( not ( = ?auto_2035752 ?auto_2035755 ) ) ( not ( = ?auto_2035752 ?auto_2035757 ) ) ( not ( = ?auto_2035752 ?auto_2035758 ) ) ( not ( = ?auto_2035752 ?auto_2035759 ) ) ( not ( = ?auto_2035753 ?auto_2035750 ) ) ( not ( = ?auto_2035753 ?auto_2035754 ) ) ( not ( = ?auto_2035753 ?auto_2035756 ) ) ( not ( = ?auto_2035753 ?auto_2035755 ) ) ( not ( = ?auto_2035753 ?auto_2035757 ) ) ( not ( = ?auto_2035753 ?auto_2035758 ) ) ( not ( = ?auto_2035753 ?auto_2035759 ) ) ( not ( = ?auto_2035750 ?auto_2035754 ) ) ( not ( = ?auto_2035750 ?auto_2035756 ) ) ( not ( = ?auto_2035750 ?auto_2035755 ) ) ( not ( = ?auto_2035750 ?auto_2035757 ) ) ( not ( = ?auto_2035750 ?auto_2035758 ) ) ( not ( = ?auto_2035750 ?auto_2035759 ) ) ( not ( = ?auto_2035754 ?auto_2035756 ) ) ( not ( = ?auto_2035754 ?auto_2035755 ) ) ( not ( = ?auto_2035754 ?auto_2035757 ) ) ( not ( = ?auto_2035754 ?auto_2035758 ) ) ( not ( = ?auto_2035754 ?auto_2035759 ) ) ( not ( = ?auto_2035756 ?auto_2035755 ) ) ( not ( = ?auto_2035756 ?auto_2035757 ) ) ( not ( = ?auto_2035756 ?auto_2035758 ) ) ( not ( = ?auto_2035756 ?auto_2035759 ) ) ( not ( = ?auto_2035755 ?auto_2035757 ) ) ( not ( = ?auto_2035755 ?auto_2035758 ) ) ( not ( = ?auto_2035755 ?auto_2035759 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2035757 ?auto_2035758 ?auto_2035759 )
      ( MAKE-9CRATE-VERIFY ?auto_2035751 ?auto_2035752 ?auto_2035753 ?auto_2035750 ?auto_2035754 ?auto_2035756 ?auto_2035755 ?auto_2035757 ?auto_2035758 ?auto_2035759 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2035859 - SURFACE
      ?auto_2035860 - SURFACE
      ?auto_2035861 - SURFACE
      ?auto_2035858 - SURFACE
      ?auto_2035862 - SURFACE
      ?auto_2035864 - SURFACE
      ?auto_2035863 - SURFACE
      ?auto_2035865 - SURFACE
      ?auto_2035866 - SURFACE
      ?auto_2035867 - SURFACE
    )
    :vars
    (
      ?auto_2035869 - HOIST
      ?auto_2035868 - PLACE
      ?auto_2035871 - TRUCK
      ?auto_2035873 - PLACE
      ?auto_2035872 - HOIST
      ?auto_2035870 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035869 ?auto_2035868 ) ( SURFACE-AT ?auto_2035866 ?auto_2035868 ) ( CLEAR ?auto_2035866 ) ( IS-CRATE ?auto_2035867 ) ( not ( = ?auto_2035866 ?auto_2035867 ) ) ( AVAILABLE ?auto_2035869 ) ( ON ?auto_2035866 ?auto_2035865 ) ( not ( = ?auto_2035865 ?auto_2035866 ) ) ( not ( = ?auto_2035865 ?auto_2035867 ) ) ( TRUCK-AT ?auto_2035871 ?auto_2035873 ) ( not ( = ?auto_2035873 ?auto_2035868 ) ) ( HOIST-AT ?auto_2035872 ?auto_2035873 ) ( not ( = ?auto_2035869 ?auto_2035872 ) ) ( AVAILABLE ?auto_2035872 ) ( SURFACE-AT ?auto_2035867 ?auto_2035873 ) ( ON ?auto_2035867 ?auto_2035870 ) ( CLEAR ?auto_2035867 ) ( not ( = ?auto_2035866 ?auto_2035870 ) ) ( not ( = ?auto_2035867 ?auto_2035870 ) ) ( not ( = ?auto_2035865 ?auto_2035870 ) ) ( ON ?auto_2035860 ?auto_2035859 ) ( ON ?auto_2035861 ?auto_2035860 ) ( ON ?auto_2035858 ?auto_2035861 ) ( ON ?auto_2035862 ?auto_2035858 ) ( ON ?auto_2035864 ?auto_2035862 ) ( ON ?auto_2035863 ?auto_2035864 ) ( ON ?auto_2035865 ?auto_2035863 ) ( not ( = ?auto_2035859 ?auto_2035860 ) ) ( not ( = ?auto_2035859 ?auto_2035861 ) ) ( not ( = ?auto_2035859 ?auto_2035858 ) ) ( not ( = ?auto_2035859 ?auto_2035862 ) ) ( not ( = ?auto_2035859 ?auto_2035864 ) ) ( not ( = ?auto_2035859 ?auto_2035863 ) ) ( not ( = ?auto_2035859 ?auto_2035865 ) ) ( not ( = ?auto_2035859 ?auto_2035866 ) ) ( not ( = ?auto_2035859 ?auto_2035867 ) ) ( not ( = ?auto_2035859 ?auto_2035870 ) ) ( not ( = ?auto_2035860 ?auto_2035861 ) ) ( not ( = ?auto_2035860 ?auto_2035858 ) ) ( not ( = ?auto_2035860 ?auto_2035862 ) ) ( not ( = ?auto_2035860 ?auto_2035864 ) ) ( not ( = ?auto_2035860 ?auto_2035863 ) ) ( not ( = ?auto_2035860 ?auto_2035865 ) ) ( not ( = ?auto_2035860 ?auto_2035866 ) ) ( not ( = ?auto_2035860 ?auto_2035867 ) ) ( not ( = ?auto_2035860 ?auto_2035870 ) ) ( not ( = ?auto_2035861 ?auto_2035858 ) ) ( not ( = ?auto_2035861 ?auto_2035862 ) ) ( not ( = ?auto_2035861 ?auto_2035864 ) ) ( not ( = ?auto_2035861 ?auto_2035863 ) ) ( not ( = ?auto_2035861 ?auto_2035865 ) ) ( not ( = ?auto_2035861 ?auto_2035866 ) ) ( not ( = ?auto_2035861 ?auto_2035867 ) ) ( not ( = ?auto_2035861 ?auto_2035870 ) ) ( not ( = ?auto_2035858 ?auto_2035862 ) ) ( not ( = ?auto_2035858 ?auto_2035864 ) ) ( not ( = ?auto_2035858 ?auto_2035863 ) ) ( not ( = ?auto_2035858 ?auto_2035865 ) ) ( not ( = ?auto_2035858 ?auto_2035866 ) ) ( not ( = ?auto_2035858 ?auto_2035867 ) ) ( not ( = ?auto_2035858 ?auto_2035870 ) ) ( not ( = ?auto_2035862 ?auto_2035864 ) ) ( not ( = ?auto_2035862 ?auto_2035863 ) ) ( not ( = ?auto_2035862 ?auto_2035865 ) ) ( not ( = ?auto_2035862 ?auto_2035866 ) ) ( not ( = ?auto_2035862 ?auto_2035867 ) ) ( not ( = ?auto_2035862 ?auto_2035870 ) ) ( not ( = ?auto_2035864 ?auto_2035863 ) ) ( not ( = ?auto_2035864 ?auto_2035865 ) ) ( not ( = ?auto_2035864 ?auto_2035866 ) ) ( not ( = ?auto_2035864 ?auto_2035867 ) ) ( not ( = ?auto_2035864 ?auto_2035870 ) ) ( not ( = ?auto_2035863 ?auto_2035865 ) ) ( not ( = ?auto_2035863 ?auto_2035866 ) ) ( not ( = ?auto_2035863 ?auto_2035867 ) ) ( not ( = ?auto_2035863 ?auto_2035870 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2035865 ?auto_2035866 ?auto_2035867 )
      ( MAKE-9CRATE-VERIFY ?auto_2035859 ?auto_2035860 ?auto_2035861 ?auto_2035858 ?auto_2035862 ?auto_2035864 ?auto_2035863 ?auto_2035865 ?auto_2035866 ?auto_2035867 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2035968 - SURFACE
      ?auto_2035969 - SURFACE
      ?auto_2035970 - SURFACE
      ?auto_2035967 - SURFACE
      ?auto_2035971 - SURFACE
      ?auto_2035973 - SURFACE
      ?auto_2035972 - SURFACE
      ?auto_2035974 - SURFACE
      ?auto_2035975 - SURFACE
      ?auto_2035976 - SURFACE
    )
    :vars
    (
      ?auto_2035978 - HOIST
      ?auto_2035979 - PLACE
      ?auto_2035977 - PLACE
      ?auto_2035980 - HOIST
      ?auto_2035982 - SURFACE
      ?auto_2035981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035978 ?auto_2035979 ) ( SURFACE-AT ?auto_2035975 ?auto_2035979 ) ( CLEAR ?auto_2035975 ) ( IS-CRATE ?auto_2035976 ) ( not ( = ?auto_2035975 ?auto_2035976 ) ) ( AVAILABLE ?auto_2035978 ) ( ON ?auto_2035975 ?auto_2035974 ) ( not ( = ?auto_2035974 ?auto_2035975 ) ) ( not ( = ?auto_2035974 ?auto_2035976 ) ) ( not ( = ?auto_2035977 ?auto_2035979 ) ) ( HOIST-AT ?auto_2035980 ?auto_2035977 ) ( not ( = ?auto_2035978 ?auto_2035980 ) ) ( AVAILABLE ?auto_2035980 ) ( SURFACE-AT ?auto_2035976 ?auto_2035977 ) ( ON ?auto_2035976 ?auto_2035982 ) ( CLEAR ?auto_2035976 ) ( not ( = ?auto_2035975 ?auto_2035982 ) ) ( not ( = ?auto_2035976 ?auto_2035982 ) ) ( not ( = ?auto_2035974 ?auto_2035982 ) ) ( TRUCK-AT ?auto_2035981 ?auto_2035979 ) ( ON ?auto_2035969 ?auto_2035968 ) ( ON ?auto_2035970 ?auto_2035969 ) ( ON ?auto_2035967 ?auto_2035970 ) ( ON ?auto_2035971 ?auto_2035967 ) ( ON ?auto_2035973 ?auto_2035971 ) ( ON ?auto_2035972 ?auto_2035973 ) ( ON ?auto_2035974 ?auto_2035972 ) ( not ( = ?auto_2035968 ?auto_2035969 ) ) ( not ( = ?auto_2035968 ?auto_2035970 ) ) ( not ( = ?auto_2035968 ?auto_2035967 ) ) ( not ( = ?auto_2035968 ?auto_2035971 ) ) ( not ( = ?auto_2035968 ?auto_2035973 ) ) ( not ( = ?auto_2035968 ?auto_2035972 ) ) ( not ( = ?auto_2035968 ?auto_2035974 ) ) ( not ( = ?auto_2035968 ?auto_2035975 ) ) ( not ( = ?auto_2035968 ?auto_2035976 ) ) ( not ( = ?auto_2035968 ?auto_2035982 ) ) ( not ( = ?auto_2035969 ?auto_2035970 ) ) ( not ( = ?auto_2035969 ?auto_2035967 ) ) ( not ( = ?auto_2035969 ?auto_2035971 ) ) ( not ( = ?auto_2035969 ?auto_2035973 ) ) ( not ( = ?auto_2035969 ?auto_2035972 ) ) ( not ( = ?auto_2035969 ?auto_2035974 ) ) ( not ( = ?auto_2035969 ?auto_2035975 ) ) ( not ( = ?auto_2035969 ?auto_2035976 ) ) ( not ( = ?auto_2035969 ?auto_2035982 ) ) ( not ( = ?auto_2035970 ?auto_2035967 ) ) ( not ( = ?auto_2035970 ?auto_2035971 ) ) ( not ( = ?auto_2035970 ?auto_2035973 ) ) ( not ( = ?auto_2035970 ?auto_2035972 ) ) ( not ( = ?auto_2035970 ?auto_2035974 ) ) ( not ( = ?auto_2035970 ?auto_2035975 ) ) ( not ( = ?auto_2035970 ?auto_2035976 ) ) ( not ( = ?auto_2035970 ?auto_2035982 ) ) ( not ( = ?auto_2035967 ?auto_2035971 ) ) ( not ( = ?auto_2035967 ?auto_2035973 ) ) ( not ( = ?auto_2035967 ?auto_2035972 ) ) ( not ( = ?auto_2035967 ?auto_2035974 ) ) ( not ( = ?auto_2035967 ?auto_2035975 ) ) ( not ( = ?auto_2035967 ?auto_2035976 ) ) ( not ( = ?auto_2035967 ?auto_2035982 ) ) ( not ( = ?auto_2035971 ?auto_2035973 ) ) ( not ( = ?auto_2035971 ?auto_2035972 ) ) ( not ( = ?auto_2035971 ?auto_2035974 ) ) ( not ( = ?auto_2035971 ?auto_2035975 ) ) ( not ( = ?auto_2035971 ?auto_2035976 ) ) ( not ( = ?auto_2035971 ?auto_2035982 ) ) ( not ( = ?auto_2035973 ?auto_2035972 ) ) ( not ( = ?auto_2035973 ?auto_2035974 ) ) ( not ( = ?auto_2035973 ?auto_2035975 ) ) ( not ( = ?auto_2035973 ?auto_2035976 ) ) ( not ( = ?auto_2035973 ?auto_2035982 ) ) ( not ( = ?auto_2035972 ?auto_2035974 ) ) ( not ( = ?auto_2035972 ?auto_2035975 ) ) ( not ( = ?auto_2035972 ?auto_2035976 ) ) ( not ( = ?auto_2035972 ?auto_2035982 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2035974 ?auto_2035975 ?auto_2035976 )
      ( MAKE-9CRATE-VERIFY ?auto_2035968 ?auto_2035969 ?auto_2035970 ?auto_2035967 ?auto_2035971 ?auto_2035973 ?auto_2035972 ?auto_2035974 ?auto_2035975 ?auto_2035976 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2036077 - SURFACE
      ?auto_2036078 - SURFACE
      ?auto_2036079 - SURFACE
      ?auto_2036076 - SURFACE
      ?auto_2036080 - SURFACE
      ?auto_2036082 - SURFACE
      ?auto_2036081 - SURFACE
      ?auto_2036083 - SURFACE
      ?auto_2036084 - SURFACE
      ?auto_2036085 - SURFACE
    )
    :vars
    (
      ?auto_2036088 - HOIST
      ?auto_2036091 - PLACE
      ?auto_2036090 - PLACE
      ?auto_2036089 - HOIST
      ?auto_2036086 - SURFACE
      ?auto_2036087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2036088 ?auto_2036091 ) ( IS-CRATE ?auto_2036085 ) ( not ( = ?auto_2036084 ?auto_2036085 ) ) ( not ( = ?auto_2036083 ?auto_2036084 ) ) ( not ( = ?auto_2036083 ?auto_2036085 ) ) ( not ( = ?auto_2036090 ?auto_2036091 ) ) ( HOIST-AT ?auto_2036089 ?auto_2036090 ) ( not ( = ?auto_2036088 ?auto_2036089 ) ) ( AVAILABLE ?auto_2036089 ) ( SURFACE-AT ?auto_2036085 ?auto_2036090 ) ( ON ?auto_2036085 ?auto_2036086 ) ( CLEAR ?auto_2036085 ) ( not ( = ?auto_2036084 ?auto_2036086 ) ) ( not ( = ?auto_2036085 ?auto_2036086 ) ) ( not ( = ?auto_2036083 ?auto_2036086 ) ) ( TRUCK-AT ?auto_2036087 ?auto_2036091 ) ( SURFACE-AT ?auto_2036083 ?auto_2036091 ) ( CLEAR ?auto_2036083 ) ( LIFTING ?auto_2036088 ?auto_2036084 ) ( IS-CRATE ?auto_2036084 ) ( ON ?auto_2036078 ?auto_2036077 ) ( ON ?auto_2036079 ?auto_2036078 ) ( ON ?auto_2036076 ?auto_2036079 ) ( ON ?auto_2036080 ?auto_2036076 ) ( ON ?auto_2036082 ?auto_2036080 ) ( ON ?auto_2036081 ?auto_2036082 ) ( ON ?auto_2036083 ?auto_2036081 ) ( not ( = ?auto_2036077 ?auto_2036078 ) ) ( not ( = ?auto_2036077 ?auto_2036079 ) ) ( not ( = ?auto_2036077 ?auto_2036076 ) ) ( not ( = ?auto_2036077 ?auto_2036080 ) ) ( not ( = ?auto_2036077 ?auto_2036082 ) ) ( not ( = ?auto_2036077 ?auto_2036081 ) ) ( not ( = ?auto_2036077 ?auto_2036083 ) ) ( not ( = ?auto_2036077 ?auto_2036084 ) ) ( not ( = ?auto_2036077 ?auto_2036085 ) ) ( not ( = ?auto_2036077 ?auto_2036086 ) ) ( not ( = ?auto_2036078 ?auto_2036079 ) ) ( not ( = ?auto_2036078 ?auto_2036076 ) ) ( not ( = ?auto_2036078 ?auto_2036080 ) ) ( not ( = ?auto_2036078 ?auto_2036082 ) ) ( not ( = ?auto_2036078 ?auto_2036081 ) ) ( not ( = ?auto_2036078 ?auto_2036083 ) ) ( not ( = ?auto_2036078 ?auto_2036084 ) ) ( not ( = ?auto_2036078 ?auto_2036085 ) ) ( not ( = ?auto_2036078 ?auto_2036086 ) ) ( not ( = ?auto_2036079 ?auto_2036076 ) ) ( not ( = ?auto_2036079 ?auto_2036080 ) ) ( not ( = ?auto_2036079 ?auto_2036082 ) ) ( not ( = ?auto_2036079 ?auto_2036081 ) ) ( not ( = ?auto_2036079 ?auto_2036083 ) ) ( not ( = ?auto_2036079 ?auto_2036084 ) ) ( not ( = ?auto_2036079 ?auto_2036085 ) ) ( not ( = ?auto_2036079 ?auto_2036086 ) ) ( not ( = ?auto_2036076 ?auto_2036080 ) ) ( not ( = ?auto_2036076 ?auto_2036082 ) ) ( not ( = ?auto_2036076 ?auto_2036081 ) ) ( not ( = ?auto_2036076 ?auto_2036083 ) ) ( not ( = ?auto_2036076 ?auto_2036084 ) ) ( not ( = ?auto_2036076 ?auto_2036085 ) ) ( not ( = ?auto_2036076 ?auto_2036086 ) ) ( not ( = ?auto_2036080 ?auto_2036082 ) ) ( not ( = ?auto_2036080 ?auto_2036081 ) ) ( not ( = ?auto_2036080 ?auto_2036083 ) ) ( not ( = ?auto_2036080 ?auto_2036084 ) ) ( not ( = ?auto_2036080 ?auto_2036085 ) ) ( not ( = ?auto_2036080 ?auto_2036086 ) ) ( not ( = ?auto_2036082 ?auto_2036081 ) ) ( not ( = ?auto_2036082 ?auto_2036083 ) ) ( not ( = ?auto_2036082 ?auto_2036084 ) ) ( not ( = ?auto_2036082 ?auto_2036085 ) ) ( not ( = ?auto_2036082 ?auto_2036086 ) ) ( not ( = ?auto_2036081 ?auto_2036083 ) ) ( not ( = ?auto_2036081 ?auto_2036084 ) ) ( not ( = ?auto_2036081 ?auto_2036085 ) ) ( not ( = ?auto_2036081 ?auto_2036086 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2036083 ?auto_2036084 ?auto_2036085 )
      ( MAKE-9CRATE-VERIFY ?auto_2036077 ?auto_2036078 ?auto_2036079 ?auto_2036076 ?auto_2036080 ?auto_2036082 ?auto_2036081 ?auto_2036083 ?auto_2036084 ?auto_2036085 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2036186 - SURFACE
      ?auto_2036187 - SURFACE
      ?auto_2036188 - SURFACE
      ?auto_2036185 - SURFACE
      ?auto_2036189 - SURFACE
      ?auto_2036191 - SURFACE
      ?auto_2036190 - SURFACE
      ?auto_2036192 - SURFACE
      ?auto_2036193 - SURFACE
      ?auto_2036194 - SURFACE
    )
    :vars
    (
      ?auto_2036195 - HOIST
      ?auto_2036197 - PLACE
      ?auto_2036198 - PLACE
      ?auto_2036196 - HOIST
      ?auto_2036200 - SURFACE
      ?auto_2036199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2036195 ?auto_2036197 ) ( IS-CRATE ?auto_2036194 ) ( not ( = ?auto_2036193 ?auto_2036194 ) ) ( not ( = ?auto_2036192 ?auto_2036193 ) ) ( not ( = ?auto_2036192 ?auto_2036194 ) ) ( not ( = ?auto_2036198 ?auto_2036197 ) ) ( HOIST-AT ?auto_2036196 ?auto_2036198 ) ( not ( = ?auto_2036195 ?auto_2036196 ) ) ( AVAILABLE ?auto_2036196 ) ( SURFACE-AT ?auto_2036194 ?auto_2036198 ) ( ON ?auto_2036194 ?auto_2036200 ) ( CLEAR ?auto_2036194 ) ( not ( = ?auto_2036193 ?auto_2036200 ) ) ( not ( = ?auto_2036194 ?auto_2036200 ) ) ( not ( = ?auto_2036192 ?auto_2036200 ) ) ( TRUCK-AT ?auto_2036199 ?auto_2036197 ) ( SURFACE-AT ?auto_2036192 ?auto_2036197 ) ( CLEAR ?auto_2036192 ) ( IS-CRATE ?auto_2036193 ) ( AVAILABLE ?auto_2036195 ) ( IN ?auto_2036193 ?auto_2036199 ) ( ON ?auto_2036187 ?auto_2036186 ) ( ON ?auto_2036188 ?auto_2036187 ) ( ON ?auto_2036185 ?auto_2036188 ) ( ON ?auto_2036189 ?auto_2036185 ) ( ON ?auto_2036191 ?auto_2036189 ) ( ON ?auto_2036190 ?auto_2036191 ) ( ON ?auto_2036192 ?auto_2036190 ) ( not ( = ?auto_2036186 ?auto_2036187 ) ) ( not ( = ?auto_2036186 ?auto_2036188 ) ) ( not ( = ?auto_2036186 ?auto_2036185 ) ) ( not ( = ?auto_2036186 ?auto_2036189 ) ) ( not ( = ?auto_2036186 ?auto_2036191 ) ) ( not ( = ?auto_2036186 ?auto_2036190 ) ) ( not ( = ?auto_2036186 ?auto_2036192 ) ) ( not ( = ?auto_2036186 ?auto_2036193 ) ) ( not ( = ?auto_2036186 ?auto_2036194 ) ) ( not ( = ?auto_2036186 ?auto_2036200 ) ) ( not ( = ?auto_2036187 ?auto_2036188 ) ) ( not ( = ?auto_2036187 ?auto_2036185 ) ) ( not ( = ?auto_2036187 ?auto_2036189 ) ) ( not ( = ?auto_2036187 ?auto_2036191 ) ) ( not ( = ?auto_2036187 ?auto_2036190 ) ) ( not ( = ?auto_2036187 ?auto_2036192 ) ) ( not ( = ?auto_2036187 ?auto_2036193 ) ) ( not ( = ?auto_2036187 ?auto_2036194 ) ) ( not ( = ?auto_2036187 ?auto_2036200 ) ) ( not ( = ?auto_2036188 ?auto_2036185 ) ) ( not ( = ?auto_2036188 ?auto_2036189 ) ) ( not ( = ?auto_2036188 ?auto_2036191 ) ) ( not ( = ?auto_2036188 ?auto_2036190 ) ) ( not ( = ?auto_2036188 ?auto_2036192 ) ) ( not ( = ?auto_2036188 ?auto_2036193 ) ) ( not ( = ?auto_2036188 ?auto_2036194 ) ) ( not ( = ?auto_2036188 ?auto_2036200 ) ) ( not ( = ?auto_2036185 ?auto_2036189 ) ) ( not ( = ?auto_2036185 ?auto_2036191 ) ) ( not ( = ?auto_2036185 ?auto_2036190 ) ) ( not ( = ?auto_2036185 ?auto_2036192 ) ) ( not ( = ?auto_2036185 ?auto_2036193 ) ) ( not ( = ?auto_2036185 ?auto_2036194 ) ) ( not ( = ?auto_2036185 ?auto_2036200 ) ) ( not ( = ?auto_2036189 ?auto_2036191 ) ) ( not ( = ?auto_2036189 ?auto_2036190 ) ) ( not ( = ?auto_2036189 ?auto_2036192 ) ) ( not ( = ?auto_2036189 ?auto_2036193 ) ) ( not ( = ?auto_2036189 ?auto_2036194 ) ) ( not ( = ?auto_2036189 ?auto_2036200 ) ) ( not ( = ?auto_2036191 ?auto_2036190 ) ) ( not ( = ?auto_2036191 ?auto_2036192 ) ) ( not ( = ?auto_2036191 ?auto_2036193 ) ) ( not ( = ?auto_2036191 ?auto_2036194 ) ) ( not ( = ?auto_2036191 ?auto_2036200 ) ) ( not ( = ?auto_2036190 ?auto_2036192 ) ) ( not ( = ?auto_2036190 ?auto_2036193 ) ) ( not ( = ?auto_2036190 ?auto_2036194 ) ) ( not ( = ?auto_2036190 ?auto_2036200 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2036192 ?auto_2036193 ?auto_2036194 )
      ( MAKE-9CRATE-VERIFY ?auto_2036186 ?auto_2036187 ?auto_2036188 ?auto_2036185 ?auto_2036189 ?auto_2036191 ?auto_2036190 ?auto_2036192 ?auto_2036193 ?auto_2036194 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2041751 - SURFACE
      ?auto_2041752 - SURFACE
      ?auto_2041753 - SURFACE
      ?auto_2041750 - SURFACE
      ?auto_2041754 - SURFACE
      ?auto_2041756 - SURFACE
      ?auto_2041755 - SURFACE
      ?auto_2041757 - SURFACE
      ?auto_2041758 - SURFACE
      ?auto_2041759 - SURFACE
      ?auto_2041760 - SURFACE
    )
    :vars
    (
      ?auto_2041761 - HOIST
      ?auto_2041762 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2041761 ?auto_2041762 ) ( SURFACE-AT ?auto_2041759 ?auto_2041762 ) ( CLEAR ?auto_2041759 ) ( LIFTING ?auto_2041761 ?auto_2041760 ) ( IS-CRATE ?auto_2041760 ) ( not ( = ?auto_2041759 ?auto_2041760 ) ) ( ON ?auto_2041752 ?auto_2041751 ) ( ON ?auto_2041753 ?auto_2041752 ) ( ON ?auto_2041750 ?auto_2041753 ) ( ON ?auto_2041754 ?auto_2041750 ) ( ON ?auto_2041756 ?auto_2041754 ) ( ON ?auto_2041755 ?auto_2041756 ) ( ON ?auto_2041757 ?auto_2041755 ) ( ON ?auto_2041758 ?auto_2041757 ) ( ON ?auto_2041759 ?auto_2041758 ) ( not ( = ?auto_2041751 ?auto_2041752 ) ) ( not ( = ?auto_2041751 ?auto_2041753 ) ) ( not ( = ?auto_2041751 ?auto_2041750 ) ) ( not ( = ?auto_2041751 ?auto_2041754 ) ) ( not ( = ?auto_2041751 ?auto_2041756 ) ) ( not ( = ?auto_2041751 ?auto_2041755 ) ) ( not ( = ?auto_2041751 ?auto_2041757 ) ) ( not ( = ?auto_2041751 ?auto_2041758 ) ) ( not ( = ?auto_2041751 ?auto_2041759 ) ) ( not ( = ?auto_2041751 ?auto_2041760 ) ) ( not ( = ?auto_2041752 ?auto_2041753 ) ) ( not ( = ?auto_2041752 ?auto_2041750 ) ) ( not ( = ?auto_2041752 ?auto_2041754 ) ) ( not ( = ?auto_2041752 ?auto_2041756 ) ) ( not ( = ?auto_2041752 ?auto_2041755 ) ) ( not ( = ?auto_2041752 ?auto_2041757 ) ) ( not ( = ?auto_2041752 ?auto_2041758 ) ) ( not ( = ?auto_2041752 ?auto_2041759 ) ) ( not ( = ?auto_2041752 ?auto_2041760 ) ) ( not ( = ?auto_2041753 ?auto_2041750 ) ) ( not ( = ?auto_2041753 ?auto_2041754 ) ) ( not ( = ?auto_2041753 ?auto_2041756 ) ) ( not ( = ?auto_2041753 ?auto_2041755 ) ) ( not ( = ?auto_2041753 ?auto_2041757 ) ) ( not ( = ?auto_2041753 ?auto_2041758 ) ) ( not ( = ?auto_2041753 ?auto_2041759 ) ) ( not ( = ?auto_2041753 ?auto_2041760 ) ) ( not ( = ?auto_2041750 ?auto_2041754 ) ) ( not ( = ?auto_2041750 ?auto_2041756 ) ) ( not ( = ?auto_2041750 ?auto_2041755 ) ) ( not ( = ?auto_2041750 ?auto_2041757 ) ) ( not ( = ?auto_2041750 ?auto_2041758 ) ) ( not ( = ?auto_2041750 ?auto_2041759 ) ) ( not ( = ?auto_2041750 ?auto_2041760 ) ) ( not ( = ?auto_2041754 ?auto_2041756 ) ) ( not ( = ?auto_2041754 ?auto_2041755 ) ) ( not ( = ?auto_2041754 ?auto_2041757 ) ) ( not ( = ?auto_2041754 ?auto_2041758 ) ) ( not ( = ?auto_2041754 ?auto_2041759 ) ) ( not ( = ?auto_2041754 ?auto_2041760 ) ) ( not ( = ?auto_2041756 ?auto_2041755 ) ) ( not ( = ?auto_2041756 ?auto_2041757 ) ) ( not ( = ?auto_2041756 ?auto_2041758 ) ) ( not ( = ?auto_2041756 ?auto_2041759 ) ) ( not ( = ?auto_2041756 ?auto_2041760 ) ) ( not ( = ?auto_2041755 ?auto_2041757 ) ) ( not ( = ?auto_2041755 ?auto_2041758 ) ) ( not ( = ?auto_2041755 ?auto_2041759 ) ) ( not ( = ?auto_2041755 ?auto_2041760 ) ) ( not ( = ?auto_2041757 ?auto_2041758 ) ) ( not ( = ?auto_2041757 ?auto_2041759 ) ) ( not ( = ?auto_2041757 ?auto_2041760 ) ) ( not ( = ?auto_2041758 ?auto_2041759 ) ) ( not ( = ?auto_2041758 ?auto_2041760 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2041759 ?auto_2041760 )
      ( MAKE-10CRATE-VERIFY ?auto_2041751 ?auto_2041752 ?auto_2041753 ?auto_2041750 ?auto_2041754 ?auto_2041756 ?auto_2041755 ?auto_2041757 ?auto_2041758 ?auto_2041759 ?auto_2041760 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2041845 - SURFACE
      ?auto_2041846 - SURFACE
      ?auto_2041847 - SURFACE
      ?auto_2041844 - SURFACE
      ?auto_2041848 - SURFACE
      ?auto_2041850 - SURFACE
      ?auto_2041849 - SURFACE
      ?auto_2041851 - SURFACE
      ?auto_2041852 - SURFACE
      ?auto_2041853 - SURFACE
      ?auto_2041854 - SURFACE
    )
    :vars
    (
      ?auto_2041857 - HOIST
      ?auto_2041856 - PLACE
      ?auto_2041855 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2041857 ?auto_2041856 ) ( SURFACE-AT ?auto_2041853 ?auto_2041856 ) ( CLEAR ?auto_2041853 ) ( IS-CRATE ?auto_2041854 ) ( not ( = ?auto_2041853 ?auto_2041854 ) ) ( TRUCK-AT ?auto_2041855 ?auto_2041856 ) ( AVAILABLE ?auto_2041857 ) ( IN ?auto_2041854 ?auto_2041855 ) ( ON ?auto_2041853 ?auto_2041852 ) ( not ( = ?auto_2041852 ?auto_2041853 ) ) ( not ( = ?auto_2041852 ?auto_2041854 ) ) ( ON ?auto_2041846 ?auto_2041845 ) ( ON ?auto_2041847 ?auto_2041846 ) ( ON ?auto_2041844 ?auto_2041847 ) ( ON ?auto_2041848 ?auto_2041844 ) ( ON ?auto_2041850 ?auto_2041848 ) ( ON ?auto_2041849 ?auto_2041850 ) ( ON ?auto_2041851 ?auto_2041849 ) ( ON ?auto_2041852 ?auto_2041851 ) ( not ( = ?auto_2041845 ?auto_2041846 ) ) ( not ( = ?auto_2041845 ?auto_2041847 ) ) ( not ( = ?auto_2041845 ?auto_2041844 ) ) ( not ( = ?auto_2041845 ?auto_2041848 ) ) ( not ( = ?auto_2041845 ?auto_2041850 ) ) ( not ( = ?auto_2041845 ?auto_2041849 ) ) ( not ( = ?auto_2041845 ?auto_2041851 ) ) ( not ( = ?auto_2041845 ?auto_2041852 ) ) ( not ( = ?auto_2041845 ?auto_2041853 ) ) ( not ( = ?auto_2041845 ?auto_2041854 ) ) ( not ( = ?auto_2041846 ?auto_2041847 ) ) ( not ( = ?auto_2041846 ?auto_2041844 ) ) ( not ( = ?auto_2041846 ?auto_2041848 ) ) ( not ( = ?auto_2041846 ?auto_2041850 ) ) ( not ( = ?auto_2041846 ?auto_2041849 ) ) ( not ( = ?auto_2041846 ?auto_2041851 ) ) ( not ( = ?auto_2041846 ?auto_2041852 ) ) ( not ( = ?auto_2041846 ?auto_2041853 ) ) ( not ( = ?auto_2041846 ?auto_2041854 ) ) ( not ( = ?auto_2041847 ?auto_2041844 ) ) ( not ( = ?auto_2041847 ?auto_2041848 ) ) ( not ( = ?auto_2041847 ?auto_2041850 ) ) ( not ( = ?auto_2041847 ?auto_2041849 ) ) ( not ( = ?auto_2041847 ?auto_2041851 ) ) ( not ( = ?auto_2041847 ?auto_2041852 ) ) ( not ( = ?auto_2041847 ?auto_2041853 ) ) ( not ( = ?auto_2041847 ?auto_2041854 ) ) ( not ( = ?auto_2041844 ?auto_2041848 ) ) ( not ( = ?auto_2041844 ?auto_2041850 ) ) ( not ( = ?auto_2041844 ?auto_2041849 ) ) ( not ( = ?auto_2041844 ?auto_2041851 ) ) ( not ( = ?auto_2041844 ?auto_2041852 ) ) ( not ( = ?auto_2041844 ?auto_2041853 ) ) ( not ( = ?auto_2041844 ?auto_2041854 ) ) ( not ( = ?auto_2041848 ?auto_2041850 ) ) ( not ( = ?auto_2041848 ?auto_2041849 ) ) ( not ( = ?auto_2041848 ?auto_2041851 ) ) ( not ( = ?auto_2041848 ?auto_2041852 ) ) ( not ( = ?auto_2041848 ?auto_2041853 ) ) ( not ( = ?auto_2041848 ?auto_2041854 ) ) ( not ( = ?auto_2041850 ?auto_2041849 ) ) ( not ( = ?auto_2041850 ?auto_2041851 ) ) ( not ( = ?auto_2041850 ?auto_2041852 ) ) ( not ( = ?auto_2041850 ?auto_2041853 ) ) ( not ( = ?auto_2041850 ?auto_2041854 ) ) ( not ( = ?auto_2041849 ?auto_2041851 ) ) ( not ( = ?auto_2041849 ?auto_2041852 ) ) ( not ( = ?auto_2041849 ?auto_2041853 ) ) ( not ( = ?auto_2041849 ?auto_2041854 ) ) ( not ( = ?auto_2041851 ?auto_2041852 ) ) ( not ( = ?auto_2041851 ?auto_2041853 ) ) ( not ( = ?auto_2041851 ?auto_2041854 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2041852 ?auto_2041853 ?auto_2041854 )
      ( MAKE-10CRATE-VERIFY ?auto_2041845 ?auto_2041846 ?auto_2041847 ?auto_2041844 ?auto_2041848 ?auto_2041850 ?auto_2041849 ?auto_2041851 ?auto_2041852 ?auto_2041853 ?auto_2041854 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2041950 - SURFACE
      ?auto_2041951 - SURFACE
      ?auto_2041952 - SURFACE
      ?auto_2041949 - SURFACE
      ?auto_2041953 - SURFACE
      ?auto_2041955 - SURFACE
      ?auto_2041954 - SURFACE
      ?auto_2041956 - SURFACE
      ?auto_2041957 - SURFACE
      ?auto_2041958 - SURFACE
      ?auto_2041959 - SURFACE
    )
    :vars
    (
      ?auto_2041962 - HOIST
      ?auto_2041961 - PLACE
      ?auto_2041960 - TRUCK
      ?auto_2041963 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2041962 ?auto_2041961 ) ( SURFACE-AT ?auto_2041958 ?auto_2041961 ) ( CLEAR ?auto_2041958 ) ( IS-CRATE ?auto_2041959 ) ( not ( = ?auto_2041958 ?auto_2041959 ) ) ( AVAILABLE ?auto_2041962 ) ( IN ?auto_2041959 ?auto_2041960 ) ( ON ?auto_2041958 ?auto_2041957 ) ( not ( = ?auto_2041957 ?auto_2041958 ) ) ( not ( = ?auto_2041957 ?auto_2041959 ) ) ( TRUCK-AT ?auto_2041960 ?auto_2041963 ) ( not ( = ?auto_2041963 ?auto_2041961 ) ) ( ON ?auto_2041951 ?auto_2041950 ) ( ON ?auto_2041952 ?auto_2041951 ) ( ON ?auto_2041949 ?auto_2041952 ) ( ON ?auto_2041953 ?auto_2041949 ) ( ON ?auto_2041955 ?auto_2041953 ) ( ON ?auto_2041954 ?auto_2041955 ) ( ON ?auto_2041956 ?auto_2041954 ) ( ON ?auto_2041957 ?auto_2041956 ) ( not ( = ?auto_2041950 ?auto_2041951 ) ) ( not ( = ?auto_2041950 ?auto_2041952 ) ) ( not ( = ?auto_2041950 ?auto_2041949 ) ) ( not ( = ?auto_2041950 ?auto_2041953 ) ) ( not ( = ?auto_2041950 ?auto_2041955 ) ) ( not ( = ?auto_2041950 ?auto_2041954 ) ) ( not ( = ?auto_2041950 ?auto_2041956 ) ) ( not ( = ?auto_2041950 ?auto_2041957 ) ) ( not ( = ?auto_2041950 ?auto_2041958 ) ) ( not ( = ?auto_2041950 ?auto_2041959 ) ) ( not ( = ?auto_2041951 ?auto_2041952 ) ) ( not ( = ?auto_2041951 ?auto_2041949 ) ) ( not ( = ?auto_2041951 ?auto_2041953 ) ) ( not ( = ?auto_2041951 ?auto_2041955 ) ) ( not ( = ?auto_2041951 ?auto_2041954 ) ) ( not ( = ?auto_2041951 ?auto_2041956 ) ) ( not ( = ?auto_2041951 ?auto_2041957 ) ) ( not ( = ?auto_2041951 ?auto_2041958 ) ) ( not ( = ?auto_2041951 ?auto_2041959 ) ) ( not ( = ?auto_2041952 ?auto_2041949 ) ) ( not ( = ?auto_2041952 ?auto_2041953 ) ) ( not ( = ?auto_2041952 ?auto_2041955 ) ) ( not ( = ?auto_2041952 ?auto_2041954 ) ) ( not ( = ?auto_2041952 ?auto_2041956 ) ) ( not ( = ?auto_2041952 ?auto_2041957 ) ) ( not ( = ?auto_2041952 ?auto_2041958 ) ) ( not ( = ?auto_2041952 ?auto_2041959 ) ) ( not ( = ?auto_2041949 ?auto_2041953 ) ) ( not ( = ?auto_2041949 ?auto_2041955 ) ) ( not ( = ?auto_2041949 ?auto_2041954 ) ) ( not ( = ?auto_2041949 ?auto_2041956 ) ) ( not ( = ?auto_2041949 ?auto_2041957 ) ) ( not ( = ?auto_2041949 ?auto_2041958 ) ) ( not ( = ?auto_2041949 ?auto_2041959 ) ) ( not ( = ?auto_2041953 ?auto_2041955 ) ) ( not ( = ?auto_2041953 ?auto_2041954 ) ) ( not ( = ?auto_2041953 ?auto_2041956 ) ) ( not ( = ?auto_2041953 ?auto_2041957 ) ) ( not ( = ?auto_2041953 ?auto_2041958 ) ) ( not ( = ?auto_2041953 ?auto_2041959 ) ) ( not ( = ?auto_2041955 ?auto_2041954 ) ) ( not ( = ?auto_2041955 ?auto_2041956 ) ) ( not ( = ?auto_2041955 ?auto_2041957 ) ) ( not ( = ?auto_2041955 ?auto_2041958 ) ) ( not ( = ?auto_2041955 ?auto_2041959 ) ) ( not ( = ?auto_2041954 ?auto_2041956 ) ) ( not ( = ?auto_2041954 ?auto_2041957 ) ) ( not ( = ?auto_2041954 ?auto_2041958 ) ) ( not ( = ?auto_2041954 ?auto_2041959 ) ) ( not ( = ?auto_2041956 ?auto_2041957 ) ) ( not ( = ?auto_2041956 ?auto_2041958 ) ) ( not ( = ?auto_2041956 ?auto_2041959 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2041957 ?auto_2041958 ?auto_2041959 )
      ( MAKE-10CRATE-VERIFY ?auto_2041950 ?auto_2041951 ?auto_2041952 ?auto_2041949 ?auto_2041953 ?auto_2041955 ?auto_2041954 ?auto_2041956 ?auto_2041957 ?auto_2041958 ?auto_2041959 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2042065 - SURFACE
      ?auto_2042066 - SURFACE
      ?auto_2042067 - SURFACE
      ?auto_2042064 - SURFACE
      ?auto_2042068 - SURFACE
      ?auto_2042070 - SURFACE
      ?auto_2042069 - SURFACE
      ?auto_2042071 - SURFACE
      ?auto_2042072 - SURFACE
      ?auto_2042073 - SURFACE
      ?auto_2042074 - SURFACE
    )
    :vars
    (
      ?auto_2042076 - HOIST
      ?auto_2042078 - PLACE
      ?auto_2042075 - TRUCK
      ?auto_2042077 - PLACE
      ?auto_2042079 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2042076 ?auto_2042078 ) ( SURFACE-AT ?auto_2042073 ?auto_2042078 ) ( CLEAR ?auto_2042073 ) ( IS-CRATE ?auto_2042074 ) ( not ( = ?auto_2042073 ?auto_2042074 ) ) ( AVAILABLE ?auto_2042076 ) ( ON ?auto_2042073 ?auto_2042072 ) ( not ( = ?auto_2042072 ?auto_2042073 ) ) ( not ( = ?auto_2042072 ?auto_2042074 ) ) ( TRUCK-AT ?auto_2042075 ?auto_2042077 ) ( not ( = ?auto_2042077 ?auto_2042078 ) ) ( HOIST-AT ?auto_2042079 ?auto_2042077 ) ( LIFTING ?auto_2042079 ?auto_2042074 ) ( not ( = ?auto_2042076 ?auto_2042079 ) ) ( ON ?auto_2042066 ?auto_2042065 ) ( ON ?auto_2042067 ?auto_2042066 ) ( ON ?auto_2042064 ?auto_2042067 ) ( ON ?auto_2042068 ?auto_2042064 ) ( ON ?auto_2042070 ?auto_2042068 ) ( ON ?auto_2042069 ?auto_2042070 ) ( ON ?auto_2042071 ?auto_2042069 ) ( ON ?auto_2042072 ?auto_2042071 ) ( not ( = ?auto_2042065 ?auto_2042066 ) ) ( not ( = ?auto_2042065 ?auto_2042067 ) ) ( not ( = ?auto_2042065 ?auto_2042064 ) ) ( not ( = ?auto_2042065 ?auto_2042068 ) ) ( not ( = ?auto_2042065 ?auto_2042070 ) ) ( not ( = ?auto_2042065 ?auto_2042069 ) ) ( not ( = ?auto_2042065 ?auto_2042071 ) ) ( not ( = ?auto_2042065 ?auto_2042072 ) ) ( not ( = ?auto_2042065 ?auto_2042073 ) ) ( not ( = ?auto_2042065 ?auto_2042074 ) ) ( not ( = ?auto_2042066 ?auto_2042067 ) ) ( not ( = ?auto_2042066 ?auto_2042064 ) ) ( not ( = ?auto_2042066 ?auto_2042068 ) ) ( not ( = ?auto_2042066 ?auto_2042070 ) ) ( not ( = ?auto_2042066 ?auto_2042069 ) ) ( not ( = ?auto_2042066 ?auto_2042071 ) ) ( not ( = ?auto_2042066 ?auto_2042072 ) ) ( not ( = ?auto_2042066 ?auto_2042073 ) ) ( not ( = ?auto_2042066 ?auto_2042074 ) ) ( not ( = ?auto_2042067 ?auto_2042064 ) ) ( not ( = ?auto_2042067 ?auto_2042068 ) ) ( not ( = ?auto_2042067 ?auto_2042070 ) ) ( not ( = ?auto_2042067 ?auto_2042069 ) ) ( not ( = ?auto_2042067 ?auto_2042071 ) ) ( not ( = ?auto_2042067 ?auto_2042072 ) ) ( not ( = ?auto_2042067 ?auto_2042073 ) ) ( not ( = ?auto_2042067 ?auto_2042074 ) ) ( not ( = ?auto_2042064 ?auto_2042068 ) ) ( not ( = ?auto_2042064 ?auto_2042070 ) ) ( not ( = ?auto_2042064 ?auto_2042069 ) ) ( not ( = ?auto_2042064 ?auto_2042071 ) ) ( not ( = ?auto_2042064 ?auto_2042072 ) ) ( not ( = ?auto_2042064 ?auto_2042073 ) ) ( not ( = ?auto_2042064 ?auto_2042074 ) ) ( not ( = ?auto_2042068 ?auto_2042070 ) ) ( not ( = ?auto_2042068 ?auto_2042069 ) ) ( not ( = ?auto_2042068 ?auto_2042071 ) ) ( not ( = ?auto_2042068 ?auto_2042072 ) ) ( not ( = ?auto_2042068 ?auto_2042073 ) ) ( not ( = ?auto_2042068 ?auto_2042074 ) ) ( not ( = ?auto_2042070 ?auto_2042069 ) ) ( not ( = ?auto_2042070 ?auto_2042071 ) ) ( not ( = ?auto_2042070 ?auto_2042072 ) ) ( not ( = ?auto_2042070 ?auto_2042073 ) ) ( not ( = ?auto_2042070 ?auto_2042074 ) ) ( not ( = ?auto_2042069 ?auto_2042071 ) ) ( not ( = ?auto_2042069 ?auto_2042072 ) ) ( not ( = ?auto_2042069 ?auto_2042073 ) ) ( not ( = ?auto_2042069 ?auto_2042074 ) ) ( not ( = ?auto_2042071 ?auto_2042072 ) ) ( not ( = ?auto_2042071 ?auto_2042073 ) ) ( not ( = ?auto_2042071 ?auto_2042074 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2042072 ?auto_2042073 ?auto_2042074 )
      ( MAKE-10CRATE-VERIFY ?auto_2042065 ?auto_2042066 ?auto_2042067 ?auto_2042064 ?auto_2042068 ?auto_2042070 ?auto_2042069 ?auto_2042071 ?auto_2042072 ?auto_2042073 ?auto_2042074 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2042190 - SURFACE
      ?auto_2042191 - SURFACE
      ?auto_2042192 - SURFACE
      ?auto_2042189 - SURFACE
      ?auto_2042193 - SURFACE
      ?auto_2042195 - SURFACE
      ?auto_2042194 - SURFACE
      ?auto_2042196 - SURFACE
      ?auto_2042197 - SURFACE
      ?auto_2042198 - SURFACE
      ?auto_2042199 - SURFACE
    )
    :vars
    (
      ?auto_2042202 - HOIST
      ?auto_2042205 - PLACE
      ?auto_2042204 - TRUCK
      ?auto_2042201 - PLACE
      ?auto_2042200 - HOIST
      ?auto_2042203 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2042202 ?auto_2042205 ) ( SURFACE-AT ?auto_2042198 ?auto_2042205 ) ( CLEAR ?auto_2042198 ) ( IS-CRATE ?auto_2042199 ) ( not ( = ?auto_2042198 ?auto_2042199 ) ) ( AVAILABLE ?auto_2042202 ) ( ON ?auto_2042198 ?auto_2042197 ) ( not ( = ?auto_2042197 ?auto_2042198 ) ) ( not ( = ?auto_2042197 ?auto_2042199 ) ) ( TRUCK-AT ?auto_2042204 ?auto_2042201 ) ( not ( = ?auto_2042201 ?auto_2042205 ) ) ( HOIST-AT ?auto_2042200 ?auto_2042201 ) ( not ( = ?auto_2042202 ?auto_2042200 ) ) ( AVAILABLE ?auto_2042200 ) ( SURFACE-AT ?auto_2042199 ?auto_2042201 ) ( ON ?auto_2042199 ?auto_2042203 ) ( CLEAR ?auto_2042199 ) ( not ( = ?auto_2042198 ?auto_2042203 ) ) ( not ( = ?auto_2042199 ?auto_2042203 ) ) ( not ( = ?auto_2042197 ?auto_2042203 ) ) ( ON ?auto_2042191 ?auto_2042190 ) ( ON ?auto_2042192 ?auto_2042191 ) ( ON ?auto_2042189 ?auto_2042192 ) ( ON ?auto_2042193 ?auto_2042189 ) ( ON ?auto_2042195 ?auto_2042193 ) ( ON ?auto_2042194 ?auto_2042195 ) ( ON ?auto_2042196 ?auto_2042194 ) ( ON ?auto_2042197 ?auto_2042196 ) ( not ( = ?auto_2042190 ?auto_2042191 ) ) ( not ( = ?auto_2042190 ?auto_2042192 ) ) ( not ( = ?auto_2042190 ?auto_2042189 ) ) ( not ( = ?auto_2042190 ?auto_2042193 ) ) ( not ( = ?auto_2042190 ?auto_2042195 ) ) ( not ( = ?auto_2042190 ?auto_2042194 ) ) ( not ( = ?auto_2042190 ?auto_2042196 ) ) ( not ( = ?auto_2042190 ?auto_2042197 ) ) ( not ( = ?auto_2042190 ?auto_2042198 ) ) ( not ( = ?auto_2042190 ?auto_2042199 ) ) ( not ( = ?auto_2042190 ?auto_2042203 ) ) ( not ( = ?auto_2042191 ?auto_2042192 ) ) ( not ( = ?auto_2042191 ?auto_2042189 ) ) ( not ( = ?auto_2042191 ?auto_2042193 ) ) ( not ( = ?auto_2042191 ?auto_2042195 ) ) ( not ( = ?auto_2042191 ?auto_2042194 ) ) ( not ( = ?auto_2042191 ?auto_2042196 ) ) ( not ( = ?auto_2042191 ?auto_2042197 ) ) ( not ( = ?auto_2042191 ?auto_2042198 ) ) ( not ( = ?auto_2042191 ?auto_2042199 ) ) ( not ( = ?auto_2042191 ?auto_2042203 ) ) ( not ( = ?auto_2042192 ?auto_2042189 ) ) ( not ( = ?auto_2042192 ?auto_2042193 ) ) ( not ( = ?auto_2042192 ?auto_2042195 ) ) ( not ( = ?auto_2042192 ?auto_2042194 ) ) ( not ( = ?auto_2042192 ?auto_2042196 ) ) ( not ( = ?auto_2042192 ?auto_2042197 ) ) ( not ( = ?auto_2042192 ?auto_2042198 ) ) ( not ( = ?auto_2042192 ?auto_2042199 ) ) ( not ( = ?auto_2042192 ?auto_2042203 ) ) ( not ( = ?auto_2042189 ?auto_2042193 ) ) ( not ( = ?auto_2042189 ?auto_2042195 ) ) ( not ( = ?auto_2042189 ?auto_2042194 ) ) ( not ( = ?auto_2042189 ?auto_2042196 ) ) ( not ( = ?auto_2042189 ?auto_2042197 ) ) ( not ( = ?auto_2042189 ?auto_2042198 ) ) ( not ( = ?auto_2042189 ?auto_2042199 ) ) ( not ( = ?auto_2042189 ?auto_2042203 ) ) ( not ( = ?auto_2042193 ?auto_2042195 ) ) ( not ( = ?auto_2042193 ?auto_2042194 ) ) ( not ( = ?auto_2042193 ?auto_2042196 ) ) ( not ( = ?auto_2042193 ?auto_2042197 ) ) ( not ( = ?auto_2042193 ?auto_2042198 ) ) ( not ( = ?auto_2042193 ?auto_2042199 ) ) ( not ( = ?auto_2042193 ?auto_2042203 ) ) ( not ( = ?auto_2042195 ?auto_2042194 ) ) ( not ( = ?auto_2042195 ?auto_2042196 ) ) ( not ( = ?auto_2042195 ?auto_2042197 ) ) ( not ( = ?auto_2042195 ?auto_2042198 ) ) ( not ( = ?auto_2042195 ?auto_2042199 ) ) ( not ( = ?auto_2042195 ?auto_2042203 ) ) ( not ( = ?auto_2042194 ?auto_2042196 ) ) ( not ( = ?auto_2042194 ?auto_2042197 ) ) ( not ( = ?auto_2042194 ?auto_2042198 ) ) ( not ( = ?auto_2042194 ?auto_2042199 ) ) ( not ( = ?auto_2042194 ?auto_2042203 ) ) ( not ( = ?auto_2042196 ?auto_2042197 ) ) ( not ( = ?auto_2042196 ?auto_2042198 ) ) ( not ( = ?auto_2042196 ?auto_2042199 ) ) ( not ( = ?auto_2042196 ?auto_2042203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2042197 ?auto_2042198 ?auto_2042199 )
      ( MAKE-10CRATE-VERIFY ?auto_2042190 ?auto_2042191 ?auto_2042192 ?auto_2042189 ?auto_2042193 ?auto_2042195 ?auto_2042194 ?auto_2042196 ?auto_2042197 ?auto_2042198 ?auto_2042199 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2042316 - SURFACE
      ?auto_2042317 - SURFACE
      ?auto_2042318 - SURFACE
      ?auto_2042315 - SURFACE
      ?auto_2042319 - SURFACE
      ?auto_2042321 - SURFACE
      ?auto_2042320 - SURFACE
      ?auto_2042322 - SURFACE
      ?auto_2042323 - SURFACE
      ?auto_2042324 - SURFACE
      ?auto_2042325 - SURFACE
    )
    :vars
    (
      ?auto_2042330 - HOIST
      ?auto_2042328 - PLACE
      ?auto_2042329 - PLACE
      ?auto_2042326 - HOIST
      ?auto_2042331 - SURFACE
      ?auto_2042327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2042330 ?auto_2042328 ) ( SURFACE-AT ?auto_2042324 ?auto_2042328 ) ( CLEAR ?auto_2042324 ) ( IS-CRATE ?auto_2042325 ) ( not ( = ?auto_2042324 ?auto_2042325 ) ) ( AVAILABLE ?auto_2042330 ) ( ON ?auto_2042324 ?auto_2042323 ) ( not ( = ?auto_2042323 ?auto_2042324 ) ) ( not ( = ?auto_2042323 ?auto_2042325 ) ) ( not ( = ?auto_2042329 ?auto_2042328 ) ) ( HOIST-AT ?auto_2042326 ?auto_2042329 ) ( not ( = ?auto_2042330 ?auto_2042326 ) ) ( AVAILABLE ?auto_2042326 ) ( SURFACE-AT ?auto_2042325 ?auto_2042329 ) ( ON ?auto_2042325 ?auto_2042331 ) ( CLEAR ?auto_2042325 ) ( not ( = ?auto_2042324 ?auto_2042331 ) ) ( not ( = ?auto_2042325 ?auto_2042331 ) ) ( not ( = ?auto_2042323 ?auto_2042331 ) ) ( TRUCK-AT ?auto_2042327 ?auto_2042328 ) ( ON ?auto_2042317 ?auto_2042316 ) ( ON ?auto_2042318 ?auto_2042317 ) ( ON ?auto_2042315 ?auto_2042318 ) ( ON ?auto_2042319 ?auto_2042315 ) ( ON ?auto_2042321 ?auto_2042319 ) ( ON ?auto_2042320 ?auto_2042321 ) ( ON ?auto_2042322 ?auto_2042320 ) ( ON ?auto_2042323 ?auto_2042322 ) ( not ( = ?auto_2042316 ?auto_2042317 ) ) ( not ( = ?auto_2042316 ?auto_2042318 ) ) ( not ( = ?auto_2042316 ?auto_2042315 ) ) ( not ( = ?auto_2042316 ?auto_2042319 ) ) ( not ( = ?auto_2042316 ?auto_2042321 ) ) ( not ( = ?auto_2042316 ?auto_2042320 ) ) ( not ( = ?auto_2042316 ?auto_2042322 ) ) ( not ( = ?auto_2042316 ?auto_2042323 ) ) ( not ( = ?auto_2042316 ?auto_2042324 ) ) ( not ( = ?auto_2042316 ?auto_2042325 ) ) ( not ( = ?auto_2042316 ?auto_2042331 ) ) ( not ( = ?auto_2042317 ?auto_2042318 ) ) ( not ( = ?auto_2042317 ?auto_2042315 ) ) ( not ( = ?auto_2042317 ?auto_2042319 ) ) ( not ( = ?auto_2042317 ?auto_2042321 ) ) ( not ( = ?auto_2042317 ?auto_2042320 ) ) ( not ( = ?auto_2042317 ?auto_2042322 ) ) ( not ( = ?auto_2042317 ?auto_2042323 ) ) ( not ( = ?auto_2042317 ?auto_2042324 ) ) ( not ( = ?auto_2042317 ?auto_2042325 ) ) ( not ( = ?auto_2042317 ?auto_2042331 ) ) ( not ( = ?auto_2042318 ?auto_2042315 ) ) ( not ( = ?auto_2042318 ?auto_2042319 ) ) ( not ( = ?auto_2042318 ?auto_2042321 ) ) ( not ( = ?auto_2042318 ?auto_2042320 ) ) ( not ( = ?auto_2042318 ?auto_2042322 ) ) ( not ( = ?auto_2042318 ?auto_2042323 ) ) ( not ( = ?auto_2042318 ?auto_2042324 ) ) ( not ( = ?auto_2042318 ?auto_2042325 ) ) ( not ( = ?auto_2042318 ?auto_2042331 ) ) ( not ( = ?auto_2042315 ?auto_2042319 ) ) ( not ( = ?auto_2042315 ?auto_2042321 ) ) ( not ( = ?auto_2042315 ?auto_2042320 ) ) ( not ( = ?auto_2042315 ?auto_2042322 ) ) ( not ( = ?auto_2042315 ?auto_2042323 ) ) ( not ( = ?auto_2042315 ?auto_2042324 ) ) ( not ( = ?auto_2042315 ?auto_2042325 ) ) ( not ( = ?auto_2042315 ?auto_2042331 ) ) ( not ( = ?auto_2042319 ?auto_2042321 ) ) ( not ( = ?auto_2042319 ?auto_2042320 ) ) ( not ( = ?auto_2042319 ?auto_2042322 ) ) ( not ( = ?auto_2042319 ?auto_2042323 ) ) ( not ( = ?auto_2042319 ?auto_2042324 ) ) ( not ( = ?auto_2042319 ?auto_2042325 ) ) ( not ( = ?auto_2042319 ?auto_2042331 ) ) ( not ( = ?auto_2042321 ?auto_2042320 ) ) ( not ( = ?auto_2042321 ?auto_2042322 ) ) ( not ( = ?auto_2042321 ?auto_2042323 ) ) ( not ( = ?auto_2042321 ?auto_2042324 ) ) ( not ( = ?auto_2042321 ?auto_2042325 ) ) ( not ( = ?auto_2042321 ?auto_2042331 ) ) ( not ( = ?auto_2042320 ?auto_2042322 ) ) ( not ( = ?auto_2042320 ?auto_2042323 ) ) ( not ( = ?auto_2042320 ?auto_2042324 ) ) ( not ( = ?auto_2042320 ?auto_2042325 ) ) ( not ( = ?auto_2042320 ?auto_2042331 ) ) ( not ( = ?auto_2042322 ?auto_2042323 ) ) ( not ( = ?auto_2042322 ?auto_2042324 ) ) ( not ( = ?auto_2042322 ?auto_2042325 ) ) ( not ( = ?auto_2042322 ?auto_2042331 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2042323 ?auto_2042324 ?auto_2042325 )
      ( MAKE-10CRATE-VERIFY ?auto_2042316 ?auto_2042317 ?auto_2042318 ?auto_2042315 ?auto_2042319 ?auto_2042321 ?auto_2042320 ?auto_2042322 ?auto_2042323 ?auto_2042324 ?auto_2042325 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2042442 - SURFACE
      ?auto_2042443 - SURFACE
      ?auto_2042444 - SURFACE
      ?auto_2042441 - SURFACE
      ?auto_2042445 - SURFACE
      ?auto_2042447 - SURFACE
      ?auto_2042446 - SURFACE
      ?auto_2042448 - SURFACE
      ?auto_2042449 - SURFACE
      ?auto_2042450 - SURFACE
      ?auto_2042451 - SURFACE
    )
    :vars
    (
      ?auto_2042456 - HOIST
      ?auto_2042457 - PLACE
      ?auto_2042454 - PLACE
      ?auto_2042452 - HOIST
      ?auto_2042453 - SURFACE
      ?auto_2042455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2042456 ?auto_2042457 ) ( IS-CRATE ?auto_2042451 ) ( not ( = ?auto_2042450 ?auto_2042451 ) ) ( not ( = ?auto_2042449 ?auto_2042450 ) ) ( not ( = ?auto_2042449 ?auto_2042451 ) ) ( not ( = ?auto_2042454 ?auto_2042457 ) ) ( HOIST-AT ?auto_2042452 ?auto_2042454 ) ( not ( = ?auto_2042456 ?auto_2042452 ) ) ( AVAILABLE ?auto_2042452 ) ( SURFACE-AT ?auto_2042451 ?auto_2042454 ) ( ON ?auto_2042451 ?auto_2042453 ) ( CLEAR ?auto_2042451 ) ( not ( = ?auto_2042450 ?auto_2042453 ) ) ( not ( = ?auto_2042451 ?auto_2042453 ) ) ( not ( = ?auto_2042449 ?auto_2042453 ) ) ( TRUCK-AT ?auto_2042455 ?auto_2042457 ) ( SURFACE-AT ?auto_2042449 ?auto_2042457 ) ( CLEAR ?auto_2042449 ) ( LIFTING ?auto_2042456 ?auto_2042450 ) ( IS-CRATE ?auto_2042450 ) ( ON ?auto_2042443 ?auto_2042442 ) ( ON ?auto_2042444 ?auto_2042443 ) ( ON ?auto_2042441 ?auto_2042444 ) ( ON ?auto_2042445 ?auto_2042441 ) ( ON ?auto_2042447 ?auto_2042445 ) ( ON ?auto_2042446 ?auto_2042447 ) ( ON ?auto_2042448 ?auto_2042446 ) ( ON ?auto_2042449 ?auto_2042448 ) ( not ( = ?auto_2042442 ?auto_2042443 ) ) ( not ( = ?auto_2042442 ?auto_2042444 ) ) ( not ( = ?auto_2042442 ?auto_2042441 ) ) ( not ( = ?auto_2042442 ?auto_2042445 ) ) ( not ( = ?auto_2042442 ?auto_2042447 ) ) ( not ( = ?auto_2042442 ?auto_2042446 ) ) ( not ( = ?auto_2042442 ?auto_2042448 ) ) ( not ( = ?auto_2042442 ?auto_2042449 ) ) ( not ( = ?auto_2042442 ?auto_2042450 ) ) ( not ( = ?auto_2042442 ?auto_2042451 ) ) ( not ( = ?auto_2042442 ?auto_2042453 ) ) ( not ( = ?auto_2042443 ?auto_2042444 ) ) ( not ( = ?auto_2042443 ?auto_2042441 ) ) ( not ( = ?auto_2042443 ?auto_2042445 ) ) ( not ( = ?auto_2042443 ?auto_2042447 ) ) ( not ( = ?auto_2042443 ?auto_2042446 ) ) ( not ( = ?auto_2042443 ?auto_2042448 ) ) ( not ( = ?auto_2042443 ?auto_2042449 ) ) ( not ( = ?auto_2042443 ?auto_2042450 ) ) ( not ( = ?auto_2042443 ?auto_2042451 ) ) ( not ( = ?auto_2042443 ?auto_2042453 ) ) ( not ( = ?auto_2042444 ?auto_2042441 ) ) ( not ( = ?auto_2042444 ?auto_2042445 ) ) ( not ( = ?auto_2042444 ?auto_2042447 ) ) ( not ( = ?auto_2042444 ?auto_2042446 ) ) ( not ( = ?auto_2042444 ?auto_2042448 ) ) ( not ( = ?auto_2042444 ?auto_2042449 ) ) ( not ( = ?auto_2042444 ?auto_2042450 ) ) ( not ( = ?auto_2042444 ?auto_2042451 ) ) ( not ( = ?auto_2042444 ?auto_2042453 ) ) ( not ( = ?auto_2042441 ?auto_2042445 ) ) ( not ( = ?auto_2042441 ?auto_2042447 ) ) ( not ( = ?auto_2042441 ?auto_2042446 ) ) ( not ( = ?auto_2042441 ?auto_2042448 ) ) ( not ( = ?auto_2042441 ?auto_2042449 ) ) ( not ( = ?auto_2042441 ?auto_2042450 ) ) ( not ( = ?auto_2042441 ?auto_2042451 ) ) ( not ( = ?auto_2042441 ?auto_2042453 ) ) ( not ( = ?auto_2042445 ?auto_2042447 ) ) ( not ( = ?auto_2042445 ?auto_2042446 ) ) ( not ( = ?auto_2042445 ?auto_2042448 ) ) ( not ( = ?auto_2042445 ?auto_2042449 ) ) ( not ( = ?auto_2042445 ?auto_2042450 ) ) ( not ( = ?auto_2042445 ?auto_2042451 ) ) ( not ( = ?auto_2042445 ?auto_2042453 ) ) ( not ( = ?auto_2042447 ?auto_2042446 ) ) ( not ( = ?auto_2042447 ?auto_2042448 ) ) ( not ( = ?auto_2042447 ?auto_2042449 ) ) ( not ( = ?auto_2042447 ?auto_2042450 ) ) ( not ( = ?auto_2042447 ?auto_2042451 ) ) ( not ( = ?auto_2042447 ?auto_2042453 ) ) ( not ( = ?auto_2042446 ?auto_2042448 ) ) ( not ( = ?auto_2042446 ?auto_2042449 ) ) ( not ( = ?auto_2042446 ?auto_2042450 ) ) ( not ( = ?auto_2042446 ?auto_2042451 ) ) ( not ( = ?auto_2042446 ?auto_2042453 ) ) ( not ( = ?auto_2042448 ?auto_2042449 ) ) ( not ( = ?auto_2042448 ?auto_2042450 ) ) ( not ( = ?auto_2042448 ?auto_2042451 ) ) ( not ( = ?auto_2042448 ?auto_2042453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2042449 ?auto_2042450 ?auto_2042451 )
      ( MAKE-10CRATE-VERIFY ?auto_2042442 ?auto_2042443 ?auto_2042444 ?auto_2042441 ?auto_2042445 ?auto_2042447 ?auto_2042446 ?auto_2042448 ?auto_2042449 ?auto_2042450 ?auto_2042451 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2042568 - SURFACE
      ?auto_2042569 - SURFACE
      ?auto_2042570 - SURFACE
      ?auto_2042567 - SURFACE
      ?auto_2042571 - SURFACE
      ?auto_2042573 - SURFACE
      ?auto_2042572 - SURFACE
      ?auto_2042574 - SURFACE
      ?auto_2042575 - SURFACE
      ?auto_2042576 - SURFACE
      ?auto_2042577 - SURFACE
    )
    :vars
    (
      ?auto_2042578 - HOIST
      ?auto_2042579 - PLACE
      ?auto_2042581 - PLACE
      ?auto_2042582 - HOIST
      ?auto_2042583 - SURFACE
      ?auto_2042580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2042578 ?auto_2042579 ) ( IS-CRATE ?auto_2042577 ) ( not ( = ?auto_2042576 ?auto_2042577 ) ) ( not ( = ?auto_2042575 ?auto_2042576 ) ) ( not ( = ?auto_2042575 ?auto_2042577 ) ) ( not ( = ?auto_2042581 ?auto_2042579 ) ) ( HOIST-AT ?auto_2042582 ?auto_2042581 ) ( not ( = ?auto_2042578 ?auto_2042582 ) ) ( AVAILABLE ?auto_2042582 ) ( SURFACE-AT ?auto_2042577 ?auto_2042581 ) ( ON ?auto_2042577 ?auto_2042583 ) ( CLEAR ?auto_2042577 ) ( not ( = ?auto_2042576 ?auto_2042583 ) ) ( not ( = ?auto_2042577 ?auto_2042583 ) ) ( not ( = ?auto_2042575 ?auto_2042583 ) ) ( TRUCK-AT ?auto_2042580 ?auto_2042579 ) ( SURFACE-AT ?auto_2042575 ?auto_2042579 ) ( CLEAR ?auto_2042575 ) ( IS-CRATE ?auto_2042576 ) ( AVAILABLE ?auto_2042578 ) ( IN ?auto_2042576 ?auto_2042580 ) ( ON ?auto_2042569 ?auto_2042568 ) ( ON ?auto_2042570 ?auto_2042569 ) ( ON ?auto_2042567 ?auto_2042570 ) ( ON ?auto_2042571 ?auto_2042567 ) ( ON ?auto_2042573 ?auto_2042571 ) ( ON ?auto_2042572 ?auto_2042573 ) ( ON ?auto_2042574 ?auto_2042572 ) ( ON ?auto_2042575 ?auto_2042574 ) ( not ( = ?auto_2042568 ?auto_2042569 ) ) ( not ( = ?auto_2042568 ?auto_2042570 ) ) ( not ( = ?auto_2042568 ?auto_2042567 ) ) ( not ( = ?auto_2042568 ?auto_2042571 ) ) ( not ( = ?auto_2042568 ?auto_2042573 ) ) ( not ( = ?auto_2042568 ?auto_2042572 ) ) ( not ( = ?auto_2042568 ?auto_2042574 ) ) ( not ( = ?auto_2042568 ?auto_2042575 ) ) ( not ( = ?auto_2042568 ?auto_2042576 ) ) ( not ( = ?auto_2042568 ?auto_2042577 ) ) ( not ( = ?auto_2042568 ?auto_2042583 ) ) ( not ( = ?auto_2042569 ?auto_2042570 ) ) ( not ( = ?auto_2042569 ?auto_2042567 ) ) ( not ( = ?auto_2042569 ?auto_2042571 ) ) ( not ( = ?auto_2042569 ?auto_2042573 ) ) ( not ( = ?auto_2042569 ?auto_2042572 ) ) ( not ( = ?auto_2042569 ?auto_2042574 ) ) ( not ( = ?auto_2042569 ?auto_2042575 ) ) ( not ( = ?auto_2042569 ?auto_2042576 ) ) ( not ( = ?auto_2042569 ?auto_2042577 ) ) ( not ( = ?auto_2042569 ?auto_2042583 ) ) ( not ( = ?auto_2042570 ?auto_2042567 ) ) ( not ( = ?auto_2042570 ?auto_2042571 ) ) ( not ( = ?auto_2042570 ?auto_2042573 ) ) ( not ( = ?auto_2042570 ?auto_2042572 ) ) ( not ( = ?auto_2042570 ?auto_2042574 ) ) ( not ( = ?auto_2042570 ?auto_2042575 ) ) ( not ( = ?auto_2042570 ?auto_2042576 ) ) ( not ( = ?auto_2042570 ?auto_2042577 ) ) ( not ( = ?auto_2042570 ?auto_2042583 ) ) ( not ( = ?auto_2042567 ?auto_2042571 ) ) ( not ( = ?auto_2042567 ?auto_2042573 ) ) ( not ( = ?auto_2042567 ?auto_2042572 ) ) ( not ( = ?auto_2042567 ?auto_2042574 ) ) ( not ( = ?auto_2042567 ?auto_2042575 ) ) ( not ( = ?auto_2042567 ?auto_2042576 ) ) ( not ( = ?auto_2042567 ?auto_2042577 ) ) ( not ( = ?auto_2042567 ?auto_2042583 ) ) ( not ( = ?auto_2042571 ?auto_2042573 ) ) ( not ( = ?auto_2042571 ?auto_2042572 ) ) ( not ( = ?auto_2042571 ?auto_2042574 ) ) ( not ( = ?auto_2042571 ?auto_2042575 ) ) ( not ( = ?auto_2042571 ?auto_2042576 ) ) ( not ( = ?auto_2042571 ?auto_2042577 ) ) ( not ( = ?auto_2042571 ?auto_2042583 ) ) ( not ( = ?auto_2042573 ?auto_2042572 ) ) ( not ( = ?auto_2042573 ?auto_2042574 ) ) ( not ( = ?auto_2042573 ?auto_2042575 ) ) ( not ( = ?auto_2042573 ?auto_2042576 ) ) ( not ( = ?auto_2042573 ?auto_2042577 ) ) ( not ( = ?auto_2042573 ?auto_2042583 ) ) ( not ( = ?auto_2042572 ?auto_2042574 ) ) ( not ( = ?auto_2042572 ?auto_2042575 ) ) ( not ( = ?auto_2042572 ?auto_2042576 ) ) ( not ( = ?auto_2042572 ?auto_2042577 ) ) ( not ( = ?auto_2042572 ?auto_2042583 ) ) ( not ( = ?auto_2042574 ?auto_2042575 ) ) ( not ( = ?auto_2042574 ?auto_2042576 ) ) ( not ( = ?auto_2042574 ?auto_2042577 ) ) ( not ( = ?auto_2042574 ?auto_2042583 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2042575 ?auto_2042576 ?auto_2042577 )
      ( MAKE-10CRATE-VERIFY ?auto_2042568 ?auto_2042569 ?auto_2042570 ?auto_2042567 ?auto_2042571 ?auto_2042573 ?auto_2042572 ?auto_2042574 ?auto_2042575 ?auto_2042576 ?auto_2042577 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2046803 - SURFACE
      ?auto_2046804 - SURFACE
    )
    :vars
    (
      ?auto_2046811 - HOIST
      ?auto_2046810 - PLACE
      ?auto_2046807 - SURFACE
      ?auto_2046805 - TRUCK
      ?auto_2046806 - PLACE
      ?auto_2046809 - HOIST
      ?auto_2046808 - SURFACE
      ?auto_2046812 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2046811 ?auto_2046810 ) ( SURFACE-AT ?auto_2046803 ?auto_2046810 ) ( CLEAR ?auto_2046803 ) ( IS-CRATE ?auto_2046804 ) ( not ( = ?auto_2046803 ?auto_2046804 ) ) ( AVAILABLE ?auto_2046811 ) ( ON ?auto_2046803 ?auto_2046807 ) ( not ( = ?auto_2046807 ?auto_2046803 ) ) ( not ( = ?auto_2046807 ?auto_2046804 ) ) ( TRUCK-AT ?auto_2046805 ?auto_2046806 ) ( not ( = ?auto_2046806 ?auto_2046810 ) ) ( HOIST-AT ?auto_2046809 ?auto_2046806 ) ( not ( = ?auto_2046811 ?auto_2046809 ) ) ( SURFACE-AT ?auto_2046804 ?auto_2046806 ) ( ON ?auto_2046804 ?auto_2046808 ) ( CLEAR ?auto_2046804 ) ( not ( = ?auto_2046803 ?auto_2046808 ) ) ( not ( = ?auto_2046804 ?auto_2046808 ) ) ( not ( = ?auto_2046807 ?auto_2046808 ) ) ( LIFTING ?auto_2046809 ?auto_2046812 ) ( IS-CRATE ?auto_2046812 ) ( not ( = ?auto_2046803 ?auto_2046812 ) ) ( not ( = ?auto_2046804 ?auto_2046812 ) ) ( not ( = ?auto_2046807 ?auto_2046812 ) ) ( not ( = ?auto_2046808 ?auto_2046812 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2046809 ?auto_2046812 ?auto_2046805 ?auto_2046806 )
      ( MAKE-1CRATE ?auto_2046803 ?auto_2046804 )
      ( MAKE-1CRATE-VERIFY ?auto_2046803 ?auto_2046804 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2049837 - SURFACE
      ?auto_2049838 - SURFACE
      ?auto_2049839 - SURFACE
      ?auto_2049836 - SURFACE
      ?auto_2049840 - SURFACE
      ?auto_2049842 - SURFACE
      ?auto_2049841 - SURFACE
      ?auto_2049843 - SURFACE
      ?auto_2049844 - SURFACE
      ?auto_2049845 - SURFACE
      ?auto_2049846 - SURFACE
      ?auto_2049847 - SURFACE
    )
    :vars
    (
      ?auto_2049848 - HOIST
      ?auto_2049849 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2049848 ?auto_2049849 ) ( SURFACE-AT ?auto_2049846 ?auto_2049849 ) ( CLEAR ?auto_2049846 ) ( LIFTING ?auto_2049848 ?auto_2049847 ) ( IS-CRATE ?auto_2049847 ) ( not ( = ?auto_2049846 ?auto_2049847 ) ) ( ON ?auto_2049838 ?auto_2049837 ) ( ON ?auto_2049839 ?auto_2049838 ) ( ON ?auto_2049836 ?auto_2049839 ) ( ON ?auto_2049840 ?auto_2049836 ) ( ON ?auto_2049842 ?auto_2049840 ) ( ON ?auto_2049841 ?auto_2049842 ) ( ON ?auto_2049843 ?auto_2049841 ) ( ON ?auto_2049844 ?auto_2049843 ) ( ON ?auto_2049845 ?auto_2049844 ) ( ON ?auto_2049846 ?auto_2049845 ) ( not ( = ?auto_2049837 ?auto_2049838 ) ) ( not ( = ?auto_2049837 ?auto_2049839 ) ) ( not ( = ?auto_2049837 ?auto_2049836 ) ) ( not ( = ?auto_2049837 ?auto_2049840 ) ) ( not ( = ?auto_2049837 ?auto_2049842 ) ) ( not ( = ?auto_2049837 ?auto_2049841 ) ) ( not ( = ?auto_2049837 ?auto_2049843 ) ) ( not ( = ?auto_2049837 ?auto_2049844 ) ) ( not ( = ?auto_2049837 ?auto_2049845 ) ) ( not ( = ?auto_2049837 ?auto_2049846 ) ) ( not ( = ?auto_2049837 ?auto_2049847 ) ) ( not ( = ?auto_2049838 ?auto_2049839 ) ) ( not ( = ?auto_2049838 ?auto_2049836 ) ) ( not ( = ?auto_2049838 ?auto_2049840 ) ) ( not ( = ?auto_2049838 ?auto_2049842 ) ) ( not ( = ?auto_2049838 ?auto_2049841 ) ) ( not ( = ?auto_2049838 ?auto_2049843 ) ) ( not ( = ?auto_2049838 ?auto_2049844 ) ) ( not ( = ?auto_2049838 ?auto_2049845 ) ) ( not ( = ?auto_2049838 ?auto_2049846 ) ) ( not ( = ?auto_2049838 ?auto_2049847 ) ) ( not ( = ?auto_2049839 ?auto_2049836 ) ) ( not ( = ?auto_2049839 ?auto_2049840 ) ) ( not ( = ?auto_2049839 ?auto_2049842 ) ) ( not ( = ?auto_2049839 ?auto_2049841 ) ) ( not ( = ?auto_2049839 ?auto_2049843 ) ) ( not ( = ?auto_2049839 ?auto_2049844 ) ) ( not ( = ?auto_2049839 ?auto_2049845 ) ) ( not ( = ?auto_2049839 ?auto_2049846 ) ) ( not ( = ?auto_2049839 ?auto_2049847 ) ) ( not ( = ?auto_2049836 ?auto_2049840 ) ) ( not ( = ?auto_2049836 ?auto_2049842 ) ) ( not ( = ?auto_2049836 ?auto_2049841 ) ) ( not ( = ?auto_2049836 ?auto_2049843 ) ) ( not ( = ?auto_2049836 ?auto_2049844 ) ) ( not ( = ?auto_2049836 ?auto_2049845 ) ) ( not ( = ?auto_2049836 ?auto_2049846 ) ) ( not ( = ?auto_2049836 ?auto_2049847 ) ) ( not ( = ?auto_2049840 ?auto_2049842 ) ) ( not ( = ?auto_2049840 ?auto_2049841 ) ) ( not ( = ?auto_2049840 ?auto_2049843 ) ) ( not ( = ?auto_2049840 ?auto_2049844 ) ) ( not ( = ?auto_2049840 ?auto_2049845 ) ) ( not ( = ?auto_2049840 ?auto_2049846 ) ) ( not ( = ?auto_2049840 ?auto_2049847 ) ) ( not ( = ?auto_2049842 ?auto_2049841 ) ) ( not ( = ?auto_2049842 ?auto_2049843 ) ) ( not ( = ?auto_2049842 ?auto_2049844 ) ) ( not ( = ?auto_2049842 ?auto_2049845 ) ) ( not ( = ?auto_2049842 ?auto_2049846 ) ) ( not ( = ?auto_2049842 ?auto_2049847 ) ) ( not ( = ?auto_2049841 ?auto_2049843 ) ) ( not ( = ?auto_2049841 ?auto_2049844 ) ) ( not ( = ?auto_2049841 ?auto_2049845 ) ) ( not ( = ?auto_2049841 ?auto_2049846 ) ) ( not ( = ?auto_2049841 ?auto_2049847 ) ) ( not ( = ?auto_2049843 ?auto_2049844 ) ) ( not ( = ?auto_2049843 ?auto_2049845 ) ) ( not ( = ?auto_2049843 ?auto_2049846 ) ) ( not ( = ?auto_2049843 ?auto_2049847 ) ) ( not ( = ?auto_2049844 ?auto_2049845 ) ) ( not ( = ?auto_2049844 ?auto_2049846 ) ) ( not ( = ?auto_2049844 ?auto_2049847 ) ) ( not ( = ?auto_2049845 ?auto_2049846 ) ) ( not ( = ?auto_2049845 ?auto_2049847 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2049846 ?auto_2049847 )
      ( MAKE-11CRATE-VERIFY ?auto_2049837 ?auto_2049838 ?auto_2049839 ?auto_2049836 ?auto_2049840 ?auto_2049842 ?auto_2049841 ?auto_2049843 ?auto_2049844 ?auto_2049845 ?auto_2049846 ?auto_2049847 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2049946 - SURFACE
      ?auto_2049947 - SURFACE
      ?auto_2049948 - SURFACE
      ?auto_2049945 - SURFACE
      ?auto_2049949 - SURFACE
      ?auto_2049951 - SURFACE
      ?auto_2049950 - SURFACE
      ?auto_2049952 - SURFACE
      ?auto_2049953 - SURFACE
      ?auto_2049954 - SURFACE
      ?auto_2049955 - SURFACE
      ?auto_2049956 - SURFACE
    )
    :vars
    (
      ?auto_2049959 - HOIST
      ?auto_2049958 - PLACE
      ?auto_2049957 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2049959 ?auto_2049958 ) ( SURFACE-AT ?auto_2049955 ?auto_2049958 ) ( CLEAR ?auto_2049955 ) ( IS-CRATE ?auto_2049956 ) ( not ( = ?auto_2049955 ?auto_2049956 ) ) ( TRUCK-AT ?auto_2049957 ?auto_2049958 ) ( AVAILABLE ?auto_2049959 ) ( IN ?auto_2049956 ?auto_2049957 ) ( ON ?auto_2049955 ?auto_2049954 ) ( not ( = ?auto_2049954 ?auto_2049955 ) ) ( not ( = ?auto_2049954 ?auto_2049956 ) ) ( ON ?auto_2049947 ?auto_2049946 ) ( ON ?auto_2049948 ?auto_2049947 ) ( ON ?auto_2049945 ?auto_2049948 ) ( ON ?auto_2049949 ?auto_2049945 ) ( ON ?auto_2049951 ?auto_2049949 ) ( ON ?auto_2049950 ?auto_2049951 ) ( ON ?auto_2049952 ?auto_2049950 ) ( ON ?auto_2049953 ?auto_2049952 ) ( ON ?auto_2049954 ?auto_2049953 ) ( not ( = ?auto_2049946 ?auto_2049947 ) ) ( not ( = ?auto_2049946 ?auto_2049948 ) ) ( not ( = ?auto_2049946 ?auto_2049945 ) ) ( not ( = ?auto_2049946 ?auto_2049949 ) ) ( not ( = ?auto_2049946 ?auto_2049951 ) ) ( not ( = ?auto_2049946 ?auto_2049950 ) ) ( not ( = ?auto_2049946 ?auto_2049952 ) ) ( not ( = ?auto_2049946 ?auto_2049953 ) ) ( not ( = ?auto_2049946 ?auto_2049954 ) ) ( not ( = ?auto_2049946 ?auto_2049955 ) ) ( not ( = ?auto_2049946 ?auto_2049956 ) ) ( not ( = ?auto_2049947 ?auto_2049948 ) ) ( not ( = ?auto_2049947 ?auto_2049945 ) ) ( not ( = ?auto_2049947 ?auto_2049949 ) ) ( not ( = ?auto_2049947 ?auto_2049951 ) ) ( not ( = ?auto_2049947 ?auto_2049950 ) ) ( not ( = ?auto_2049947 ?auto_2049952 ) ) ( not ( = ?auto_2049947 ?auto_2049953 ) ) ( not ( = ?auto_2049947 ?auto_2049954 ) ) ( not ( = ?auto_2049947 ?auto_2049955 ) ) ( not ( = ?auto_2049947 ?auto_2049956 ) ) ( not ( = ?auto_2049948 ?auto_2049945 ) ) ( not ( = ?auto_2049948 ?auto_2049949 ) ) ( not ( = ?auto_2049948 ?auto_2049951 ) ) ( not ( = ?auto_2049948 ?auto_2049950 ) ) ( not ( = ?auto_2049948 ?auto_2049952 ) ) ( not ( = ?auto_2049948 ?auto_2049953 ) ) ( not ( = ?auto_2049948 ?auto_2049954 ) ) ( not ( = ?auto_2049948 ?auto_2049955 ) ) ( not ( = ?auto_2049948 ?auto_2049956 ) ) ( not ( = ?auto_2049945 ?auto_2049949 ) ) ( not ( = ?auto_2049945 ?auto_2049951 ) ) ( not ( = ?auto_2049945 ?auto_2049950 ) ) ( not ( = ?auto_2049945 ?auto_2049952 ) ) ( not ( = ?auto_2049945 ?auto_2049953 ) ) ( not ( = ?auto_2049945 ?auto_2049954 ) ) ( not ( = ?auto_2049945 ?auto_2049955 ) ) ( not ( = ?auto_2049945 ?auto_2049956 ) ) ( not ( = ?auto_2049949 ?auto_2049951 ) ) ( not ( = ?auto_2049949 ?auto_2049950 ) ) ( not ( = ?auto_2049949 ?auto_2049952 ) ) ( not ( = ?auto_2049949 ?auto_2049953 ) ) ( not ( = ?auto_2049949 ?auto_2049954 ) ) ( not ( = ?auto_2049949 ?auto_2049955 ) ) ( not ( = ?auto_2049949 ?auto_2049956 ) ) ( not ( = ?auto_2049951 ?auto_2049950 ) ) ( not ( = ?auto_2049951 ?auto_2049952 ) ) ( not ( = ?auto_2049951 ?auto_2049953 ) ) ( not ( = ?auto_2049951 ?auto_2049954 ) ) ( not ( = ?auto_2049951 ?auto_2049955 ) ) ( not ( = ?auto_2049951 ?auto_2049956 ) ) ( not ( = ?auto_2049950 ?auto_2049952 ) ) ( not ( = ?auto_2049950 ?auto_2049953 ) ) ( not ( = ?auto_2049950 ?auto_2049954 ) ) ( not ( = ?auto_2049950 ?auto_2049955 ) ) ( not ( = ?auto_2049950 ?auto_2049956 ) ) ( not ( = ?auto_2049952 ?auto_2049953 ) ) ( not ( = ?auto_2049952 ?auto_2049954 ) ) ( not ( = ?auto_2049952 ?auto_2049955 ) ) ( not ( = ?auto_2049952 ?auto_2049956 ) ) ( not ( = ?auto_2049953 ?auto_2049954 ) ) ( not ( = ?auto_2049953 ?auto_2049955 ) ) ( not ( = ?auto_2049953 ?auto_2049956 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2049954 ?auto_2049955 ?auto_2049956 )
      ( MAKE-11CRATE-VERIFY ?auto_2049946 ?auto_2049947 ?auto_2049948 ?auto_2049945 ?auto_2049949 ?auto_2049951 ?auto_2049950 ?auto_2049952 ?auto_2049953 ?auto_2049954 ?auto_2049955 ?auto_2049956 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2050067 - SURFACE
      ?auto_2050068 - SURFACE
      ?auto_2050069 - SURFACE
      ?auto_2050066 - SURFACE
      ?auto_2050070 - SURFACE
      ?auto_2050072 - SURFACE
      ?auto_2050071 - SURFACE
      ?auto_2050073 - SURFACE
      ?auto_2050074 - SURFACE
      ?auto_2050075 - SURFACE
      ?auto_2050076 - SURFACE
      ?auto_2050077 - SURFACE
    )
    :vars
    (
      ?auto_2050079 - HOIST
      ?auto_2050081 - PLACE
      ?auto_2050078 - TRUCK
      ?auto_2050080 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2050079 ?auto_2050081 ) ( SURFACE-AT ?auto_2050076 ?auto_2050081 ) ( CLEAR ?auto_2050076 ) ( IS-CRATE ?auto_2050077 ) ( not ( = ?auto_2050076 ?auto_2050077 ) ) ( AVAILABLE ?auto_2050079 ) ( IN ?auto_2050077 ?auto_2050078 ) ( ON ?auto_2050076 ?auto_2050075 ) ( not ( = ?auto_2050075 ?auto_2050076 ) ) ( not ( = ?auto_2050075 ?auto_2050077 ) ) ( TRUCK-AT ?auto_2050078 ?auto_2050080 ) ( not ( = ?auto_2050080 ?auto_2050081 ) ) ( ON ?auto_2050068 ?auto_2050067 ) ( ON ?auto_2050069 ?auto_2050068 ) ( ON ?auto_2050066 ?auto_2050069 ) ( ON ?auto_2050070 ?auto_2050066 ) ( ON ?auto_2050072 ?auto_2050070 ) ( ON ?auto_2050071 ?auto_2050072 ) ( ON ?auto_2050073 ?auto_2050071 ) ( ON ?auto_2050074 ?auto_2050073 ) ( ON ?auto_2050075 ?auto_2050074 ) ( not ( = ?auto_2050067 ?auto_2050068 ) ) ( not ( = ?auto_2050067 ?auto_2050069 ) ) ( not ( = ?auto_2050067 ?auto_2050066 ) ) ( not ( = ?auto_2050067 ?auto_2050070 ) ) ( not ( = ?auto_2050067 ?auto_2050072 ) ) ( not ( = ?auto_2050067 ?auto_2050071 ) ) ( not ( = ?auto_2050067 ?auto_2050073 ) ) ( not ( = ?auto_2050067 ?auto_2050074 ) ) ( not ( = ?auto_2050067 ?auto_2050075 ) ) ( not ( = ?auto_2050067 ?auto_2050076 ) ) ( not ( = ?auto_2050067 ?auto_2050077 ) ) ( not ( = ?auto_2050068 ?auto_2050069 ) ) ( not ( = ?auto_2050068 ?auto_2050066 ) ) ( not ( = ?auto_2050068 ?auto_2050070 ) ) ( not ( = ?auto_2050068 ?auto_2050072 ) ) ( not ( = ?auto_2050068 ?auto_2050071 ) ) ( not ( = ?auto_2050068 ?auto_2050073 ) ) ( not ( = ?auto_2050068 ?auto_2050074 ) ) ( not ( = ?auto_2050068 ?auto_2050075 ) ) ( not ( = ?auto_2050068 ?auto_2050076 ) ) ( not ( = ?auto_2050068 ?auto_2050077 ) ) ( not ( = ?auto_2050069 ?auto_2050066 ) ) ( not ( = ?auto_2050069 ?auto_2050070 ) ) ( not ( = ?auto_2050069 ?auto_2050072 ) ) ( not ( = ?auto_2050069 ?auto_2050071 ) ) ( not ( = ?auto_2050069 ?auto_2050073 ) ) ( not ( = ?auto_2050069 ?auto_2050074 ) ) ( not ( = ?auto_2050069 ?auto_2050075 ) ) ( not ( = ?auto_2050069 ?auto_2050076 ) ) ( not ( = ?auto_2050069 ?auto_2050077 ) ) ( not ( = ?auto_2050066 ?auto_2050070 ) ) ( not ( = ?auto_2050066 ?auto_2050072 ) ) ( not ( = ?auto_2050066 ?auto_2050071 ) ) ( not ( = ?auto_2050066 ?auto_2050073 ) ) ( not ( = ?auto_2050066 ?auto_2050074 ) ) ( not ( = ?auto_2050066 ?auto_2050075 ) ) ( not ( = ?auto_2050066 ?auto_2050076 ) ) ( not ( = ?auto_2050066 ?auto_2050077 ) ) ( not ( = ?auto_2050070 ?auto_2050072 ) ) ( not ( = ?auto_2050070 ?auto_2050071 ) ) ( not ( = ?auto_2050070 ?auto_2050073 ) ) ( not ( = ?auto_2050070 ?auto_2050074 ) ) ( not ( = ?auto_2050070 ?auto_2050075 ) ) ( not ( = ?auto_2050070 ?auto_2050076 ) ) ( not ( = ?auto_2050070 ?auto_2050077 ) ) ( not ( = ?auto_2050072 ?auto_2050071 ) ) ( not ( = ?auto_2050072 ?auto_2050073 ) ) ( not ( = ?auto_2050072 ?auto_2050074 ) ) ( not ( = ?auto_2050072 ?auto_2050075 ) ) ( not ( = ?auto_2050072 ?auto_2050076 ) ) ( not ( = ?auto_2050072 ?auto_2050077 ) ) ( not ( = ?auto_2050071 ?auto_2050073 ) ) ( not ( = ?auto_2050071 ?auto_2050074 ) ) ( not ( = ?auto_2050071 ?auto_2050075 ) ) ( not ( = ?auto_2050071 ?auto_2050076 ) ) ( not ( = ?auto_2050071 ?auto_2050077 ) ) ( not ( = ?auto_2050073 ?auto_2050074 ) ) ( not ( = ?auto_2050073 ?auto_2050075 ) ) ( not ( = ?auto_2050073 ?auto_2050076 ) ) ( not ( = ?auto_2050073 ?auto_2050077 ) ) ( not ( = ?auto_2050074 ?auto_2050075 ) ) ( not ( = ?auto_2050074 ?auto_2050076 ) ) ( not ( = ?auto_2050074 ?auto_2050077 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2050075 ?auto_2050076 ?auto_2050077 )
      ( MAKE-11CRATE-VERIFY ?auto_2050067 ?auto_2050068 ?auto_2050069 ?auto_2050066 ?auto_2050070 ?auto_2050072 ?auto_2050071 ?auto_2050073 ?auto_2050074 ?auto_2050075 ?auto_2050076 ?auto_2050077 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2050199 - SURFACE
      ?auto_2050200 - SURFACE
      ?auto_2050201 - SURFACE
      ?auto_2050198 - SURFACE
      ?auto_2050202 - SURFACE
      ?auto_2050204 - SURFACE
      ?auto_2050203 - SURFACE
      ?auto_2050205 - SURFACE
      ?auto_2050206 - SURFACE
      ?auto_2050207 - SURFACE
      ?auto_2050208 - SURFACE
      ?auto_2050209 - SURFACE
    )
    :vars
    (
      ?auto_2050213 - HOIST
      ?auto_2050211 - PLACE
      ?auto_2050214 - TRUCK
      ?auto_2050212 - PLACE
      ?auto_2050210 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2050213 ?auto_2050211 ) ( SURFACE-AT ?auto_2050208 ?auto_2050211 ) ( CLEAR ?auto_2050208 ) ( IS-CRATE ?auto_2050209 ) ( not ( = ?auto_2050208 ?auto_2050209 ) ) ( AVAILABLE ?auto_2050213 ) ( ON ?auto_2050208 ?auto_2050207 ) ( not ( = ?auto_2050207 ?auto_2050208 ) ) ( not ( = ?auto_2050207 ?auto_2050209 ) ) ( TRUCK-AT ?auto_2050214 ?auto_2050212 ) ( not ( = ?auto_2050212 ?auto_2050211 ) ) ( HOIST-AT ?auto_2050210 ?auto_2050212 ) ( LIFTING ?auto_2050210 ?auto_2050209 ) ( not ( = ?auto_2050213 ?auto_2050210 ) ) ( ON ?auto_2050200 ?auto_2050199 ) ( ON ?auto_2050201 ?auto_2050200 ) ( ON ?auto_2050198 ?auto_2050201 ) ( ON ?auto_2050202 ?auto_2050198 ) ( ON ?auto_2050204 ?auto_2050202 ) ( ON ?auto_2050203 ?auto_2050204 ) ( ON ?auto_2050205 ?auto_2050203 ) ( ON ?auto_2050206 ?auto_2050205 ) ( ON ?auto_2050207 ?auto_2050206 ) ( not ( = ?auto_2050199 ?auto_2050200 ) ) ( not ( = ?auto_2050199 ?auto_2050201 ) ) ( not ( = ?auto_2050199 ?auto_2050198 ) ) ( not ( = ?auto_2050199 ?auto_2050202 ) ) ( not ( = ?auto_2050199 ?auto_2050204 ) ) ( not ( = ?auto_2050199 ?auto_2050203 ) ) ( not ( = ?auto_2050199 ?auto_2050205 ) ) ( not ( = ?auto_2050199 ?auto_2050206 ) ) ( not ( = ?auto_2050199 ?auto_2050207 ) ) ( not ( = ?auto_2050199 ?auto_2050208 ) ) ( not ( = ?auto_2050199 ?auto_2050209 ) ) ( not ( = ?auto_2050200 ?auto_2050201 ) ) ( not ( = ?auto_2050200 ?auto_2050198 ) ) ( not ( = ?auto_2050200 ?auto_2050202 ) ) ( not ( = ?auto_2050200 ?auto_2050204 ) ) ( not ( = ?auto_2050200 ?auto_2050203 ) ) ( not ( = ?auto_2050200 ?auto_2050205 ) ) ( not ( = ?auto_2050200 ?auto_2050206 ) ) ( not ( = ?auto_2050200 ?auto_2050207 ) ) ( not ( = ?auto_2050200 ?auto_2050208 ) ) ( not ( = ?auto_2050200 ?auto_2050209 ) ) ( not ( = ?auto_2050201 ?auto_2050198 ) ) ( not ( = ?auto_2050201 ?auto_2050202 ) ) ( not ( = ?auto_2050201 ?auto_2050204 ) ) ( not ( = ?auto_2050201 ?auto_2050203 ) ) ( not ( = ?auto_2050201 ?auto_2050205 ) ) ( not ( = ?auto_2050201 ?auto_2050206 ) ) ( not ( = ?auto_2050201 ?auto_2050207 ) ) ( not ( = ?auto_2050201 ?auto_2050208 ) ) ( not ( = ?auto_2050201 ?auto_2050209 ) ) ( not ( = ?auto_2050198 ?auto_2050202 ) ) ( not ( = ?auto_2050198 ?auto_2050204 ) ) ( not ( = ?auto_2050198 ?auto_2050203 ) ) ( not ( = ?auto_2050198 ?auto_2050205 ) ) ( not ( = ?auto_2050198 ?auto_2050206 ) ) ( not ( = ?auto_2050198 ?auto_2050207 ) ) ( not ( = ?auto_2050198 ?auto_2050208 ) ) ( not ( = ?auto_2050198 ?auto_2050209 ) ) ( not ( = ?auto_2050202 ?auto_2050204 ) ) ( not ( = ?auto_2050202 ?auto_2050203 ) ) ( not ( = ?auto_2050202 ?auto_2050205 ) ) ( not ( = ?auto_2050202 ?auto_2050206 ) ) ( not ( = ?auto_2050202 ?auto_2050207 ) ) ( not ( = ?auto_2050202 ?auto_2050208 ) ) ( not ( = ?auto_2050202 ?auto_2050209 ) ) ( not ( = ?auto_2050204 ?auto_2050203 ) ) ( not ( = ?auto_2050204 ?auto_2050205 ) ) ( not ( = ?auto_2050204 ?auto_2050206 ) ) ( not ( = ?auto_2050204 ?auto_2050207 ) ) ( not ( = ?auto_2050204 ?auto_2050208 ) ) ( not ( = ?auto_2050204 ?auto_2050209 ) ) ( not ( = ?auto_2050203 ?auto_2050205 ) ) ( not ( = ?auto_2050203 ?auto_2050206 ) ) ( not ( = ?auto_2050203 ?auto_2050207 ) ) ( not ( = ?auto_2050203 ?auto_2050208 ) ) ( not ( = ?auto_2050203 ?auto_2050209 ) ) ( not ( = ?auto_2050205 ?auto_2050206 ) ) ( not ( = ?auto_2050205 ?auto_2050207 ) ) ( not ( = ?auto_2050205 ?auto_2050208 ) ) ( not ( = ?auto_2050205 ?auto_2050209 ) ) ( not ( = ?auto_2050206 ?auto_2050207 ) ) ( not ( = ?auto_2050206 ?auto_2050208 ) ) ( not ( = ?auto_2050206 ?auto_2050209 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2050207 ?auto_2050208 ?auto_2050209 )
      ( MAKE-11CRATE-VERIFY ?auto_2050199 ?auto_2050200 ?auto_2050201 ?auto_2050198 ?auto_2050202 ?auto_2050204 ?auto_2050203 ?auto_2050205 ?auto_2050206 ?auto_2050207 ?auto_2050208 ?auto_2050209 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2050342 - SURFACE
      ?auto_2050343 - SURFACE
      ?auto_2050344 - SURFACE
      ?auto_2050341 - SURFACE
      ?auto_2050345 - SURFACE
      ?auto_2050347 - SURFACE
      ?auto_2050346 - SURFACE
      ?auto_2050348 - SURFACE
      ?auto_2050349 - SURFACE
      ?auto_2050350 - SURFACE
      ?auto_2050351 - SURFACE
      ?auto_2050352 - SURFACE
    )
    :vars
    (
      ?auto_2050353 - HOIST
      ?auto_2050354 - PLACE
      ?auto_2050357 - TRUCK
      ?auto_2050355 - PLACE
      ?auto_2050358 - HOIST
      ?auto_2050356 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2050353 ?auto_2050354 ) ( SURFACE-AT ?auto_2050351 ?auto_2050354 ) ( CLEAR ?auto_2050351 ) ( IS-CRATE ?auto_2050352 ) ( not ( = ?auto_2050351 ?auto_2050352 ) ) ( AVAILABLE ?auto_2050353 ) ( ON ?auto_2050351 ?auto_2050350 ) ( not ( = ?auto_2050350 ?auto_2050351 ) ) ( not ( = ?auto_2050350 ?auto_2050352 ) ) ( TRUCK-AT ?auto_2050357 ?auto_2050355 ) ( not ( = ?auto_2050355 ?auto_2050354 ) ) ( HOIST-AT ?auto_2050358 ?auto_2050355 ) ( not ( = ?auto_2050353 ?auto_2050358 ) ) ( AVAILABLE ?auto_2050358 ) ( SURFACE-AT ?auto_2050352 ?auto_2050355 ) ( ON ?auto_2050352 ?auto_2050356 ) ( CLEAR ?auto_2050352 ) ( not ( = ?auto_2050351 ?auto_2050356 ) ) ( not ( = ?auto_2050352 ?auto_2050356 ) ) ( not ( = ?auto_2050350 ?auto_2050356 ) ) ( ON ?auto_2050343 ?auto_2050342 ) ( ON ?auto_2050344 ?auto_2050343 ) ( ON ?auto_2050341 ?auto_2050344 ) ( ON ?auto_2050345 ?auto_2050341 ) ( ON ?auto_2050347 ?auto_2050345 ) ( ON ?auto_2050346 ?auto_2050347 ) ( ON ?auto_2050348 ?auto_2050346 ) ( ON ?auto_2050349 ?auto_2050348 ) ( ON ?auto_2050350 ?auto_2050349 ) ( not ( = ?auto_2050342 ?auto_2050343 ) ) ( not ( = ?auto_2050342 ?auto_2050344 ) ) ( not ( = ?auto_2050342 ?auto_2050341 ) ) ( not ( = ?auto_2050342 ?auto_2050345 ) ) ( not ( = ?auto_2050342 ?auto_2050347 ) ) ( not ( = ?auto_2050342 ?auto_2050346 ) ) ( not ( = ?auto_2050342 ?auto_2050348 ) ) ( not ( = ?auto_2050342 ?auto_2050349 ) ) ( not ( = ?auto_2050342 ?auto_2050350 ) ) ( not ( = ?auto_2050342 ?auto_2050351 ) ) ( not ( = ?auto_2050342 ?auto_2050352 ) ) ( not ( = ?auto_2050342 ?auto_2050356 ) ) ( not ( = ?auto_2050343 ?auto_2050344 ) ) ( not ( = ?auto_2050343 ?auto_2050341 ) ) ( not ( = ?auto_2050343 ?auto_2050345 ) ) ( not ( = ?auto_2050343 ?auto_2050347 ) ) ( not ( = ?auto_2050343 ?auto_2050346 ) ) ( not ( = ?auto_2050343 ?auto_2050348 ) ) ( not ( = ?auto_2050343 ?auto_2050349 ) ) ( not ( = ?auto_2050343 ?auto_2050350 ) ) ( not ( = ?auto_2050343 ?auto_2050351 ) ) ( not ( = ?auto_2050343 ?auto_2050352 ) ) ( not ( = ?auto_2050343 ?auto_2050356 ) ) ( not ( = ?auto_2050344 ?auto_2050341 ) ) ( not ( = ?auto_2050344 ?auto_2050345 ) ) ( not ( = ?auto_2050344 ?auto_2050347 ) ) ( not ( = ?auto_2050344 ?auto_2050346 ) ) ( not ( = ?auto_2050344 ?auto_2050348 ) ) ( not ( = ?auto_2050344 ?auto_2050349 ) ) ( not ( = ?auto_2050344 ?auto_2050350 ) ) ( not ( = ?auto_2050344 ?auto_2050351 ) ) ( not ( = ?auto_2050344 ?auto_2050352 ) ) ( not ( = ?auto_2050344 ?auto_2050356 ) ) ( not ( = ?auto_2050341 ?auto_2050345 ) ) ( not ( = ?auto_2050341 ?auto_2050347 ) ) ( not ( = ?auto_2050341 ?auto_2050346 ) ) ( not ( = ?auto_2050341 ?auto_2050348 ) ) ( not ( = ?auto_2050341 ?auto_2050349 ) ) ( not ( = ?auto_2050341 ?auto_2050350 ) ) ( not ( = ?auto_2050341 ?auto_2050351 ) ) ( not ( = ?auto_2050341 ?auto_2050352 ) ) ( not ( = ?auto_2050341 ?auto_2050356 ) ) ( not ( = ?auto_2050345 ?auto_2050347 ) ) ( not ( = ?auto_2050345 ?auto_2050346 ) ) ( not ( = ?auto_2050345 ?auto_2050348 ) ) ( not ( = ?auto_2050345 ?auto_2050349 ) ) ( not ( = ?auto_2050345 ?auto_2050350 ) ) ( not ( = ?auto_2050345 ?auto_2050351 ) ) ( not ( = ?auto_2050345 ?auto_2050352 ) ) ( not ( = ?auto_2050345 ?auto_2050356 ) ) ( not ( = ?auto_2050347 ?auto_2050346 ) ) ( not ( = ?auto_2050347 ?auto_2050348 ) ) ( not ( = ?auto_2050347 ?auto_2050349 ) ) ( not ( = ?auto_2050347 ?auto_2050350 ) ) ( not ( = ?auto_2050347 ?auto_2050351 ) ) ( not ( = ?auto_2050347 ?auto_2050352 ) ) ( not ( = ?auto_2050347 ?auto_2050356 ) ) ( not ( = ?auto_2050346 ?auto_2050348 ) ) ( not ( = ?auto_2050346 ?auto_2050349 ) ) ( not ( = ?auto_2050346 ?auto_2050350 ) ) ( not ( = ?auto_2050346 ?auto_2050351 ) ) ( not ( = ?auto_2050346 ?auto_2050352 ) ) ( not ( = ?auto_2050346 ?auto_2050356 ) ) ( not ( = ?auto_2050348 ?auto_2050349 ) ) ( not ( = ?auto_2050348 ?auto_2050350 ) ) ( not ( = ?auto_2050348 ?auto_2050351 ) ) ( not ( = ?auto_2050348 ?auto_2050352 ) ) ( not ( = ?auto_2050348 ?auto_2050356 ) ) ( not ( = ?auto_2050349 ?auto_2050350 ) ) ( not ( = ?auto_2050349 ?auto_2050351 ) ) ( not ( = ?auto_2050349 ?auto_2050352 ) ) ( not ( = ?auto_2050349 ?auto_2050356 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2050350 ?auto_2050351 ?auto_2050352 )
      ( MAKE-11CRATE-VERIFY ?auto_2050342 ?auto_2050343 ?auto_2050344 ?auto_2050341 ?auto_2050345 ?auto_2050347 ?auto_2050346 ?auto_2050348 ?auto_2050349 ?auto_2050350 ?auto_2050351 ?auto_2050352 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2050486 - SURFACE
      ?auto_2050487 - SURFACE
      ?auto_2050488 - SURFACE
      ?auto_2050485 - SURFACE
      ?auto_2050489 - SURFACE
      ?auto_2050491 - SURFACE
      ?auto_2050490 - SURFACE
      ?auto_2050492 - SURFACE
      ?auto_2050493 - SURFACE
      ?auto_2050494 - SURFACE
      ?auto_2050495 - SURFACE
      ?auto_2050496 - SURFACE
    )
    :vars
    (
      ?auto_2050502 - HOIST
      ?auto_2050498 - PLACE
      ?auto_2050501 - PLACE
      ?auto_2050500 - HOIST
      ?auto_2050499 - SURFACE
      ?auto_2050497 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2050502 ?auto_2050498 ) ( SURFACE-AT ?auto_2050495 ?auto_2050498 ) ( CLEAR ?auto_2050495 ) ( IS-CRATE ?auto_2050496 ) ( not ( = ?auto_2050495 ?auto_2050496 ) ) ( AVAILABLE ?auto_2050502 ) ( ON ?auto_2050495 ?auto_2050494 ) ( not ( = ?auto_2050494 ?auto_2050495 ) ) ( not ( = ?auto_2050494 ?auto_2050496 ) ) ( not ( = ?auto_2050501 ?auto_2050498 ) ) ( HOIST-AT ?auto_2050500 ?auto_2050501 ) ( not ( = ?auto_2050502 ?auto_2050500 ) ) ( AVAILABLE ?auto_2050500 ) ( SURFACE-AT ?auto_2050496 ?auto_2050501 ) ( ON ?auto_2050496 ?auto_2050499 ) ( CLEAR ?auto_2050496 ) ( not ( = ?auto_2050495 ?auto_2050499 ) ) ( not ( = ?auto_2050496 ?auto_2050499 ) ) ( not ( = ?auto_2050494 ?auto_2050499 ) ) ( TRUCK-AT ?auto_2050497 ?auto_2050498 ) ( ON ?auto_2050487 ?auto_2050486 ) ( ON ?auto_2050488 ?auto_2050487 ) ( ON ?auto_2050485 ?auto_2050488 ) ( ON ?auto_2050489 ?auto_2050485 ) ( ON ?auto_2050491 ?auto_2050489 ) ( ON ?auto_2050490 ?auto_2050491 ) ( ON ?auto_2050492 ?auto_2050490 ) ( ON ?auto_2050493 ?auto_2050492 ) ( ON ?auto_2050494 ?auto_2050493 ) ( not ( = ?auto_2050486 ?auto_2050487 ) ) ( not ( = ?auto_2050486 ?auto_2050488 ) ) ( not ( = ?auto_2050486 ?auto_2050485 ) ) ( not ( = ?auto_2050486 ?auto_2050489 ) ) ( not ( = ?auto_2050486 ?auto_2050491 ) ) ( not ( = ?auto_2050486 ?auto_2050490 ) ) ( not ( = ?auto_2050486 ?auto_2050492 ) ) ( not ( = ?auto_2050486 ?auto_2050493 ) ) ( not ( = ?auto_2050486 ?auto_2050494 ) ) ( not ( = ?auto_2050486 ?auto_2050495 ) ) ( not ( = ?auto_2050486 ?auto_2050496 ) ) ( not ( = ?auto_2050486 ?auto_2050499 ) ) ( not ( = ?auto_2050487 ?auto_2050488 ) ) ( not ( = ?auto_2050487 ?auto_2050485 ) ) ( not ( = ?auto_2050487 ?auto_2050489 ) ) ( not ( = ?auto_2050487 ?auto_2050491 ) ) ( not ( = ?auto_2050487 ?auto_2050490 ) ) ( not ( = ?auto_2050487 ?auto_2050492 ) ) ( not ( = ?auto_2050487 ?auto_2050493 ) ) ( not ( = ?auto_2050487 ?auto_2050494 ) ) ( not ( = ?auto_2050487 ?auto_2050495 ) ) ( not ( = ?auto_2050487 ?auto_2050496 ) ) ( not ( = ?auto_2050487 ?auto_2050499 ) ) ( not ( = ?auto_2050488 ?auto_2050485 ) ) ( not ( = ?auto_2050488 ?auto_2050489 ) ) ( not ( = ?auto_2050488 ?auto_2050491 ) ) ( not ( = ?auto_2050488 ?auto_2050490 ) ) ( not ( = ?auto_2050488 ?auto_2050492 ) ) ( not ( = ?auto_2050488 ?auto_2050493 ) ) ( not ( = ?auto_2050488 ?auto_2050494 ) ) ( not ( = ?auto_2050488 ?auto_2050495 ) ) ( not ( = ?auto_2050488 ?auto_2050496 ) ) ( not ( = ?auto_2050488 ?auto_2050499 ) ) ( not ( = ?auto_2050485 ?auto_2050489 ) ) ( not ( = ?auto_2050485 ?auto_2050491 ) ) ( not ( = ?auto_2050485 ?auto_2050490 ) ) ( not ( = ?auto_2050485 ?auto_2050492 ) ) ( not ( = ?auto_2050485 ?auto_2050493 ) ) ( not ( = ?auto_2050485 ?auto_2050494 ) ) ( not ( = ?auto_2050485 ?auto_2050495 ) ) ( not ( = ?auto_2050485 ?auto_2050496 ) ) ( not ( = ?auto_2050485 ?auto_2050499 ) ) ( not ( = ?auto_2050489 ?auto_2050491 ) ) ( not ( = ?auto_2050489 ?auto_2050490 ) ) ( not ( = ?auto_2050489 ?auto_2050492 ) ) ( not ( = ?auto_2050489 ?auto_2050493 ) ) ( not ( = ?auto_2050489 ?auto_2050494 ) ) ( not ( = ?auto_2050489 ?auto_2050495 ) ) ( not ( = ?auto_2050489 ?auto_2050496 ) ) ( not ( = ?auto_2050489 ?auto_2050499 ) ) ( not ( = ?auto_2050491 ?auto_2050490 ) ) ( not ( = ?auto_2050491 ?auto_2050492 ) ) ( not ( = ?auto_2050491 ?auto_2050493 ) ) ( not ( = ?auto_2050491 ?auto_2050494 ) ) ( not ( = ?auto_2050491 ?auto_2050495 ) ) ( not ( = ?auto_2050491 ?auto_2050496 ) ) ( not ( = ?auto_2050491 ?auto_2050499 ) ) ( not ( = ?auto_2050490 ?auto_2050492 ) ) ( not ( = ?auto_2050490 ?auto_2050493 ) ) ( not ( = ?auto_2050490 ?auto_2050494 ) ) ( not ( = ?auto_2050490 ?auto_2050495 ) ) ( not ( = ?auto_2050490 ?auto_2050496 ) ) ( not ( = ?auto_2050490 ?auto_2050499 ) ) ( not ( = ?auto_2050492 ?auto_2050493 ) ) ( not ( = ?auto_2050492 ?auto_2050494 ) ) ( not ( = ?auto_2050492 ?auto_2050495 ) ) ( not ( = ?auto_2050492 ?auto_2050496 ) ) ( not ( = ?auto_2050492 ?auto_2050499 ) ) ( not ( = ?auto_2050493 ?auto_2050494 ) ) ( not ( = ?auto_2050493 ?auto_2050495 ) ) ( not ( = ?auto_2050493 ?auto_2050496 ) ) ( not ( = ?auto_2050493 ?auto_2050499 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2050494 ?auto_2050495 ?auto_2050496 )
      ( MAKE-11CRATE-VERIFY ?auto_2050486 ?auto_2050487 ?auto_2050488 ?auto_2050485 ?auto_2050489 ?auto_2050491 ?auto_2050490 ?auto_2050492 ?auto_2050493 ?auto_2050494 ?auto_2050495 ?auto_2050496 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2050630 - SURFACE
      ?auto_2050631 - SURFACE
      ?auto_2050632 - SURFACE
      ?auto_2050629 - SURFACE
      ?auto_2050633 - SURFACE
      ?auto_2050635 - SURFACE
      ?auto_2050634 - SURFACE
      ?auto_2050636 - SURFACE
      ?auto_2050637 - SURFACE
      ?auto_2050638 - SURFACE
      ?auto_2050639 - SURFACE
      ?auto_2050640 - SURFACE
    )
    :vars
    (
      ?auto_2050645 - HOIST
      ?auto_2050642 - PLACE
      ?auto_2050643 - PLACE
      ?auto_2050646 - HOIST
      ?auto_2050641 - SURFACE
      ?auto_2050644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2050645 ?auto_2050642 ) ( IS-CRATE ?auto_2050640 ) ( not ( = ?auto_2050639 ?auto_2050640 ) ) ( not ( = ?auto_2050638 ?auto_2050639 ) ) ( not ( = ?auto_2050638 ?auto_2050640 ) ) ( not ( = ?auto_2050643 ?auto_2050642 ) ) ( HOIST-AT ?auto_2050646 ?auto_2050643 ) ( not ( = ?auto_2050645 ?auto_2050646 ) ) ( AVAILABLE ?auto_2050646 ) ( SURFACE-AT ?auto_2050640 ?auto_2050643 ) ( ON ?auto_2050640 ?auto_2050641 ) ( CLEAR ?auto_2050640 ) ( not ( = ?auto_2050639 ?auto_2050641 ) ) ( not ( = ?auto_2050640 ?auto_2050641 ) ) ( not ( = ?auto_2050638 ?auto_2050641 ) ) ( TRUCK-AT ?auto_2050644 ?auto_2050642 ) ( SURFACE-AT ?auto_2050638 ?auto_2050642 ) ( CLEAR ?auto_2050638 ) ( LIFTING ?auto_2050645 ?auto_2050639 ) ( IS-CRATE ?auto_2050639 ) ( ON ?auto_2050631 ?auto_2050630 ) ( ON ?auto_2050632 ?auto_2050631 ) ( ON ?auto_2050629 ?auto_2050632 ) ( ON ?auto_2050633 ?auto_2050629 ) ( ON ?auto_2050635 ?auto_2050633 ) ( ON ?auto_2050634 ?auto_2050635 ) ( ON ?auto_2050636 ?auto_2050634 ) ( ON ?auto_2050637 ?auto_2050636 ) ( ON ?auto_2050638 ?auto_2050637 ) ( not ( = ?auto_2050630 ?auto_2050631 ) ) ( not ( = ?auto_2050630 ?auto_2050632 ) ) ( not ( = ?auto_2050630 ?auto_2050629 ) ) ( not ( = ?auto_2050630 ?auto_2050633 ) ) ( not ( = ?auto_2050630 ?auto_2050635 ) ) ( not ( = ?auto_2050630 ?auto_2050634 ) ) ( not ( = ?auto_2050630 ?auto_2050636 ) ) ( not ( = ?auto_2050630 ?auto_2050637 ) ) ( not ( = ?auto_2050630 ?auto_2050638 ) ) ( not ( = ?auto_2050630 ?auto_2050639 ) ) ( not ( = ?auto_2050630 ?auto_2050640 ) ) ( not ( = ?auto_2050630 ?auto_2050641 ) ) ( not ( = ?auto_2050631 ?auto_2050632 ) ) ( not ( = ?auto_2050631 ?auto_2050629 ) ) ( not ( = ?auto_2050631 ?auto_2050633 ) ) ( not ( = ?auto_2050631 ?auto_2050635 ) ) ( not ( = ?auto_2050631 ?auto_2050634 ) ) ( not ( = ?auto_2050631 ?auto_2050636 ) ) ( not ( = ?auto_2050631 ?auto_2050637 ) ) ( not ( = ?auto_2050631 ?auto_2050638 ) ) ( not ( = ?auto_2050631 ?auto_2050639 ) ) ( not ( = ?auto_2050631 ?auto_2050640 ) ) ( not ( = ?auto_2050631 ?auto_2050641 ) ) ( not ( = ?auto_2050632 ?auto_2050629 ) ) ( not ( = ?auto_2050632 ?auto_2050633 ) ) ( not ( = ?auto_2050632 ?auto_2050635 ) ) ( not ( = ?auto_2050632 ?auto_2050634 ) ) ( not ( = ?auto_2050632 ?auto_2050636 ) ) ( not ( = ?auto_2050632 ?auto_2050637 ) ) ( not ( = ?auto_2050632 ?auto_2050638 ) ) ( not ( = ?auto_2050632 ?auto_2050639 ) ) ( not ( = ?auto_2050632 ?auto_2050640 ) ) ( not ( = ?auto_2050632 ?auto_2050641 ) ) ( not ( = ?auto_2050629 ?auto_2050633 ) ) ( not ( = ?auto_2050629 ?auto_2050635 ) ) ( not ( = ?auto_2050629 ?auto_2050634 ) ) ( not ( = ?auto_2050629 ?auto_2050636 ) ) ( not ( = ?auto_2050629 ?auto_2050637 ) ) ( not ( = ?auto_2050629 ?auto_2050638 ) ) ( not ( = ?auto_2050629 ?auto_2050639 ) ) ( not ( = ?auto_2050629 ?auto_2050640 ) ) ( not ( = ?auto_2050629 ?auto_2050641 ) ) ( not ( = ?auto_2050633 ?auto_2050635 ) ) ( not ( = ?auto_2050633 ?auto_2050634 ) ) ( not ( = ?auto_2050633 ?auto_2050636 ) ) ( not ( = ?auto_2050633 ?auto_2050637 ) ) ( not ( = ?auto_2050633 ?auto_2050638 ) ) ( not ( = ?auto_2050633 ?auto_2050639 ) ) ( not ( = ?auto_2050633 ?auto_2050640 ) ) ( not ( = ?auto_2050633 ?auto_2050641 ) ) ( not ( = ?auto_2050635 ?auto_2050634 ) ) ( not ( = ?auto_2050635 ?auto_2050636 ) ) ( not ( = ?auto_2050635 ?auto_2050637 ) ) ( not ( = ?auto_2050635 ?auto_2050638 ) ) ( not ( = ?auto_2050635 ?auto_2050639 ) ) ( not ( = ?auto_2050635 ?auto_2050640 ) ) ( not ( = ?auto_2050635 ?auto_2050641 ) ) ( not ( = ?auto_2050634 ?auto_2050636 ) ) ( not ( = ?auto_2050634 ?auto_2050637 ) ) ( not ( = ?auto_2050634 ?auto_2050638 ) ) ( not ( = ?auto_2050634 ?auto_2050639 ) ) ( not ( = ?auto_2050634 ?auto_2050640 ) ) ( not ( = ?auto_2050634 ?auto_2050641 ) ) ( not ( = ?auto_2050636 ?auto_2050637 ) ) ( not ( = ?auto_2050636 ?auto_2050638 ) ) ( not ( = ?auto_2050636 ?auto_2050639 ) ) ( not ( = ?auto_2050636 ?auto_2050640 ) ) ( not ( = ?auto_2050636 ?auto_2050641 ) ) ( not ( = ?auto_2050637 ?auto_2050638 ) ) ( not ( = ?auto_2050637 ?auto_2050639 ) ) ( not ( = ?auto_2050637 ?auto_2050640 ) ) ( not ( = ?auto_2050637 ?auto_2050641 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2050638 ?auto_2050639 ?auto_2050640 )
      ( MAKE-11CRATE-VERIFY ?auto_2050630 ?auto_2050631 ?auto_2050632 ?auto_2050629 ?auto_2050633 ?auto_2050635 ?auto_2050634 ?auto_2050636 ?auto_2050637 ?auto_2050638 ?auto_2050639 ?auto_2050640 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2050774 - SURFACE
      ?auto_2050775 - SURFACE
      ?auto_2050776 - SURFACE
      ?auto_2050773 - SURFACE
      ?auto_2050777 - SURFACE
      ?auto_2050779 - SURFACE
      ?auto_2050778 - SURFACE
      ?auto_2050780 - SURFACE
      ?auto_2050781 - SURFACE
      ?auto_2050782 - SURFACE
      ?auto_2050783 - SURFACE
      ?auto_2050784 - SURFACE
    )
    :vars
    (
      ?auto_2050785 - HOIST
      ?auto_2050788 - PLACE
      ?auto_2050786 - PLACE
      ?auto_2050790 - HOIST
      ?auto_2050787 - SURFACE
      ?auto_2050789 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2050785 ?auto_2050788 ) ( IS-CRATE ?auto_2050784 ) ( not ( = ?auto_2050783 ?auto_2050784 ) ) ( not ( = ?auto_2050782 ?auto_2050783 ) ) ( not ( = ?auto_2050782 ?auto_2050784 ) ) ( not ( = ?auto_2050786 ?auto_2050788 ) ) ( HOIST-AT ?auto_2050790 ?auto_2050786 ) ( not ( = ?auto_2050785 ?auto_2050790 ) ) ( AVAILABLE ?auto_2050790 ) ( SURFACE-AT ?auto_2050784 ?auto_2050786 ) ( ON ?auto_2050784 ?auto_2050787 ) ( CLEAR ?auto_2050784 ) ( not ( = ?auto_2050783 ?auto_2050787 ) ) ( not ( = ?auto_2050784 ?auto_2050787 ) ) ( not ( = ?auto_2050782 ?auto_2050787 ) ) ( TRUCK-AT ?auto_2050789 ?auto_2050788 ) ( SURFACE-AT ?auto_2050782 ?auto_2050788 ) ( CLEAR ?auto_2050782 ) ( IS-CRATE ?auto_2050783 ) ( AVAILABLE ?auto_2050785 ) ( IN ?auto_2050783 ?auto_2050789 ) ( ON ?auto_2050775 ?auto_2050774 ) ( ON ?auto_2050776 ?auto_2050775 ) ( ON ?auto_2050773 ?auto_2050776 ) ( ON ?auto_2050777 ?auto_2050773 ) ( ON ?auto_2050779 ?auto_2050777 ) ( ON ?auto_2050778 ?auto_2050779 ) ( ON ?auto_2050780 ?auto_2050778 ) ( ON ?auto_2050781 ?auto_2050780 ) ( ON ?auto_2050782 ?auto_2050781 ) ( not ( = ?auto_2050774 ?auto_2050775 ) ) ( not ( = ?auto_2050774 ?auto_2050776 ) ) ( not ( = ?auto_2050774 ?auto_2050773 ) ) ( not ( = ?auto_2050774 ?auto_2050777 ) ) ( not ( = ?auto_2050774 ?auto_2050779 ) ) ( not ( = ?auto_2050774 ?auto_2050778 ) ) ( not ( = ?auto_2050774 ?auto_2050780 ) ) ( not ( = ?auto_2050774 ?auto_2050781 ) ) ( not ( = ?auto_2050774 ?auto_2050782 ) ) ( not ( = ?auto_2050774 ?auto_2050783 ) ) ( not ( = ?auto_2050774 ?auto_2050784 ) ) ( not ( = ?auto_2050774 ?auto_2050787 ) ) ( not ( = ?auto_2050775 ?auto_2050776 ) ) ( not ( = ?auto_2050775 ?auto_2050773 ) ) ( not ( = ?auto_2050775 ?auto_2050777 ) ) ( not ( = ?auto_2050775 ?auto_2050779 ) ) ( not ( = ?auto_2050775 ?auto_2050778 ) ) ( not ( = ?auto_2050775 ?auto_2050780 ) ) ( not ( = ?auto_2050775 ?auto_2050781 ) ) ( not ( = ?auto_2050775 ?auto_2050782 ) ) ( not ( = ?auto_2050775 ?auto_2050783 ) ) ( not ( = ?auto_2050775 ?auto_2050784 ) ) ( not ( = ?auto_2050775 ?auto_2050787 ) ) ( not ( = ?auto_2050776 ?auto_2050773 ) ) ( not ( = ?auto_2050776 ?auto_2050777 ) ) ( not ( = ?auto_2050776 ?auto_2050779 ) ) ( not ( = ?auto_2050776 ?auto_2050778 ) ) ( not ( = ?auto_2050776 ?auto_2050780 ) ) ( not ( = ?auto_2050776 ?auto_2050781 ) ) ( not ( = ?auto_2050776 ?auto_2050782 ) ) ( not ( = ?auto_2050776 ?auto_2050783 ) ) ( not ( = ?auto_2050776 ?auto_2050784 ) ) ( not ( = ?auto_2050776 ?auto_2050787 ) ) ( not ( = ?auto_2050773 ?auto_2050777 ) ) ( not ( = ?auto_2050773 ?auto_2050779 ) ) ( not ( = ?auto_2050773 ?auto_2050778 ) ) ( not ( = ?auto_2050773 ?auto_2050780 ) ) ( not ( = ?auto_2050773 ?auto_2050781 ) ) ( not ( = ?auto_2050773 ?auto_2050782 ) ) ( not ( = ?auto_2050773 ?auto_2050783 ) ) ( not ( = ?auto_2050773 ?auto_2050784 ) ) ( not ( = ?auto_2050773 ?auto_2050787 ) ) ( not ( = ?auto_2050777 ?auto_2050779 ) ) ( not ( = ?auto_2050777 ?auto_2050778 ) ) ( not ( = ?auto_2050777 ?auto_2050780 ) ) ( not ( = ?auto_2050777 ?auto_2050781 ) ) ( not ( = ?auto_2050777 ?auto_2050782 ) ) ( not ( = ?auto_2050777 ?auto_2050783 ) ) ( not ( = ?auto_2050777 ?auto_2050784 ) ) ( not ( = ?auto_2050777 ?auto_2050787 ) ) ( not ( = ?auto_2050779 ?auto_2050778 ) ) ( not ( = ?auto_2050779 ?auto_2050780 ) ) ( not ( = ?auto_2050779 ?auto_2050781 ) ) ( not ( = ?auto_2050779 ?auto_2050782 ) ) ( not ( = ?auto_2050779 ?auto_2050783 ) ) ( not ( = ?auto_2050779 ?auto_2050784 ) ) ( not ( = ?auto_2050779 ?auto_2050787 ) ) ( not ( = ?auto_2050778 ?auto_2050780 ) ) ( not ( = ?auto_2050778 ?auto_2050781 ) ) ( not ( = ?auto_2050778 ?auto_2050782 ) ) ( not ( = ?auto_2050778 ?auto_2050783 ) ) ( not ( = ?auto_2050778 ?auto_2050784 ) ) ( not ( = ?auto_2050778 ?auto_2050787 ) ) ( not ( = ?auto_2050780 ?auto_2050781 ) ) ( not ( = ?auto_2050780 ?auto_2050782 ) ) ( not ( = ?auto_2050780 ?auto_2050783 ) ) ( not ( = ?auto_2050780 ?auto_2050784 ) ) ( not ( = ?auto_2050780 ?auto_2050787 ) ) ( not ( = ?auto_2050781 ?auto_2050782 ) ) ( not ( = ?auto_2050781 ?auto_2050783 ) ) ( not ( = ?auto_2050781 ?auto_2050784 ) ) ( not ( = ?auto_2050781 ?auto_2050787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2050782 ?auto_2050783 ?auto_2050784 )
      ( MAKE-11CRATE-VERIFY ?auto_2050774 ?auto_2050775 ?auto_2050776 ?auto_2050773 ?auto_2050777 ?auto_2050779 ?auto_2050778 ?auto_2050780 ?auto_2050781 ?auto_2050782 ?auto_2050783 ?auto_2050784 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2056568 - SURFACE
      ?auto_2056569 - SURFACE
    )
    :vars
    (
      ?auto_2056571 - HOIST
      ?auto_2056573 - PLACE
      ?auto_2056572 - SURFACE
      ?auto_2056576 - PLACE
      ?auto_2056575 - HOIST
      ?auto_2056570 - SURFACE
      ?auto_2056574 - TRUCK
      ?auto_2056577 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2056571 ?auto_2056573 ) ( SURFACE-AT ?auto_2056568 ?auto_2056573 ) ( CLEAR ?auto_2056568 ) ( IS-CRATE ?auto_2056569 ) ( not ( = ?auto_2056568 ?auto_2056569 ) ) ( ON ?auto_2056568 ?auto_2056572 ) ( not ( = ?auto_2056572 ?auto_2056568 ) ) ( not ( = ?auto_2056572 ?auto_2056569 ) ) ( not ( = ?auto_2056576 ?auto_2056573 ) ) ( HOIST-AT ?auto_2056575 ?auto_2056576 ) ( not ( = ?auto_2056571 ?auto_2056575 ) ) ( AVAILABLE ?auto_2056575 ) ( SURFACE-AT ?auto_2056569 ?auto_2056576 ) ( ON ?auto_2056569 ?auto_2056570 ) ( CLEAR ?auto_2056569 ) ( not ( = ?auto_2056568 ?auto_2056570 ) ) ( not ( = ?auto_2056569 ?auto_2056570 ) ) ( not ( = ?auto_2056572 ?auto_2056570 ) ) ( TRUCK-AT ?auto_2056574 ?auto_2056573 ) ( LIFTING ?auto_2056571 ?auto_2056577 ) ( IS-CRATE ?auto_2056577 ) ( not ( = ?auto_2056568 ?auto_2056577 ) ) ( not ( = ?auto_2056569 ?auto_2056577 ) ) ( not ( = ?auto_2056572 ?auto_2056577 ) ) ( not ( = ?auto_2056570 ?auto_2056577 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2056571 ?auto_2056577 ?auto_2056574 ?auto_2056573 )
      ( MAKE-1CRATE ?auto_2056568 ?auto_2056569 )
      ( MAKE-1CRATE-VERIFY ?auto_2056568 ?auto_2056569 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2060048 - SURFACE
      ?auto_2060049 - SURFACE
      ?auto_2060050 - SURFACE
      ?auto_2060047 - SURFACE
      ?auto_2060051 - SURFACE
      ?auto_2060053 - SURFACE
      ?auto_2060052 - SURFACE
      ?auto_2060054 - SURFACE
      ?auto_2060055 - SURFACE
      ?auto_2060056 - SURFACE
      ?auto_2060057 - SURFACE
      ?auto_2060058 - SURFACE
      ?auto_2060059 - SURFACE
    )
    :vars
    (
      ?auto_2060061 - HOIST
      ?auto_2060060 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2060061 ?auto_2060060 ) ( SURFACE-AT ?auto_2060058 ?auto_2060060 ) ( CLEAR ?auto_2060058 ) ( LIFTING ?auto_2060061 ?auto_2060059 ) ( IS-CRATE ?auto_2060059 ) ( not ( = ?auto_2060058 ?auto_2060059 ) ) ( ON ?auto_2060049 ?auto_2060048 ) ( ON ?auto_2060050 ?auto_2060049 ) ( ON ?auto_2060047 ?auto_2060050 ) ( ON ?auto_2060051 ?auto_2060047 ) ( ON ?auto_2060053 ?auto_2060051 ) ( ON ?auto_2060052 ?auto_2060053 ) ( ON ?auto_2060054 ?auto_2060052 ) ( ON ?auto_2060055 ?auto_2060054 ) ( ON ?auto_2060056 ?auto_2060055 ) ( ON ?auto_2060057 ?auto_2060056 ) ( ON ?auto_2060058 ?auto_2060057 ) ( not ( = ?auto_2060048 ?auto_2060049 ) ) ( not ( = ?auto_2060048 ?auto_2060050 ) ) ( not ( = ?auto_2060048 ?auto_2060047 ) ) ( not ( = ?auto_2060048 ?auto_2060051 ) ) ( not ( = ?auto_2060048 ?auto_2060053 ) ) ( not ( = ?auto_2060048 ?auto_2060052 ) ) ( not ( = ?auto_2060048 ?auto_2060054 ) ) ( not ( = ?auto_2060048 ?auto_2060055 ) ) ( not ( = ?auto_2060048 ?auto_2060056 ) ) ( not ( = ?auto_2060048 ?auto_2060057 ) ) ( not ( = ?auto_2060048 ?auto_2060058 ) ) ( not ( = ?auto_2060048 ?auto_2060059 ) ) ( not ( = ?auto_2060049 ?auto_2060050 ) ) ( not ( = ?auto_2060049 ?auto_2060047 ) ) ( not ( = ?auto_2060049 ?auto_2060051 ) ) ( not ( = ?auto_2060049 ?auto_2060053 ) ) ( not ( = ?auto_2060049 ?auto_2060052 ) ) ( not ( = ?auto_2060049 ?auto_2060054 ) ) ( not ( = ?auto_2060049 ?auto_2060055 ) ) ( not ( = ?auto_2060049 ?auto_2060056 ) ) ( not ( = ?auto_2060049 ?auto_2060057 ) ) ( not ( = ?auto_2060049 ?auto_2060058 ) ) ( not ( = ?auto_2060049 ?auto_2060059 ) ) ( not ( = ?auto_2060050 ?auto_2060047 ) ) ( not ( = ?auto_2060050 ?auto_2060051 ) ) ( not ( = ?auto_2060050 ?auto_2060053 ) ) ( not ( = ?auto_2060050 ?auto_2060052 ) ) ( not ( = ?auto_2060050 ?auto_2060054 ) ) ( not ( = ?auto_2060050 ?auto_2060055 ) ) ( not ( = ?auto_2060050 ?auto_2060056 ) ) ( not ( = ?auto_2060050 ?auto_2060057 ) ) ( not ( = ?auto_2060050 ?auto_2060058 ) ) ( not ( = ?auto_2060050 ?auto_2060059 ) ) ( not ( = ?auto_2060047 ?auto_2060051 ) ) ( not ( = ?auto_2060047 ?auto_2060053 ) ) ( not ( = ?auto_2060047 ?auto_2060052 ) ) ( not ( = ?auto_2060047 ?auto_2060054 ) ) ( not ( = ?auto_2060047 ?auto_2060055 ) ) ( not ( = ?auto_2060047 ?auto_2060056 ) ) ( not ( = ?auto_2060047 ?auto_2060057 ) ) ( not ( = ?auto_2060047 ?auto_2060058 ) ) ( not ( = ?auto_2060047 ?auto_2060059 ) ) ( not ( = ?auto_2060051 ?auto_2060053 ) ) ( not ( = ?auto_2060051 ?auto_2060052 ) ) ( not ( = ?auto_2060051 ?auto_2060054 ) ) ( not ( = ?auto_2060051 ?auto_2060055 ) ) ( not ( = ?auto_2060051 ?auto_2060056 ) ) ( not ( = ?auto_2060051 ?auto_2060057 ) ) ( not ( = ?auto_2060051 ?auto_2060058 ) ) ( not ( = ?auto_2060051 ?auto_2060059 ) ) ( not ( = ?auto_2060053 ?auto_2060052 ) ) ( not ( = ?auto_2060053 ?auto_2060054 ) ) ( not ( = ?auto_2060053 ?auto_2060055 ) ) ( not ( = ?auto_2060053 ?auto_2060056 ) ) ( not ( = ?auto_2060053 ?auto_2060057 ) ) ( not ( = ?auto_2060053 ?auto_2060058 ) ) ( not ( = ?auto_2060053 ?auto_2060059 ) ) ( not ( = ?auto_2060052 ?auto_2060054 ) ) ( not ( = ?auto_2060052 ?auto_2060055 ) ) ( not ( = ?auto_2060052 ?auto_2060056 ) ) ( not ( = ?auto_2060052 ?auto_2060057 ) ) ( not ( = ?auto_2060052 ?auto_2060058 ) ) ( not ( = ?auto_2060052 ?auto_2060059 ) ) ( not ( = ?auto_2060054 ?auto_2060055 ) ) ( not ( = ?auto_2060054 ?auto_2060056 ) ) ( not ( = ?auto_2060054 ?auto_2060057 ) ) ( not ( = ?auto_2060054 ?auto_2060058 ) ) ( not ( = ?auto_2060054 ?auto_2060059 ) ) ( not ( = ?auto_2060055 ?auto_2060056 ) ) ( not ( = ?auto_2060055 ?auto_2060057 ) ) ( not ( = ?auto_2060055 ?auto_2060058 ) ) ( not ( = ?auto_2060055 ?auto_2060059 ) ) ( not ( = ?auto_2060056 ?auto_2060057 ) ) ( not ( = ?auto_2060056 ?auto_2060058 ) ) ( not ( = ?auto_2060056 ?auto_2060059 ) ) ( not ( = ?auto_2060057 ?auto_2060058 ) ) ( not ( = ?auto_2060057 ?auto_2060059 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2060058 ?auto_2060059 )
      ( MAKE-12CRATE-VERIFY ?auto_2060048 ?auto_2060049 ?auto_2060050 ?auto_2060047 ?auto_2060051 ?auto_2060053 ?auto_2060052 ?auto_2060054 ?auto_2060055 ?auto_2060056 ?auto_2060057 ?auto_2060058 ?auto_2060059 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2060173 - SURFACE
      ?auto_2060174 - SURFACE
      ?auto_2060175 - SURFACE
      ?auto_2060172 - SURFACE
      ?auto_2060176 - SURFACE
      ?auto_2060178 - SURFACE
      ?auto_2060177 - SURFACE
      ?auto_2060179 - SURFACE
      ?auto_2060180 - SURFACE
      ?auto_2060181 - SURFACE
      ?auto_2060182 - SURFACE
      ?auto_2060183 - SURFACE
      ?auto_2060184 - SURFACE
    )
    :vars
    (
      ?auto_2060185 - HOIST
      ?auto_2060187 - PLACE
      ?auto_2060186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2060185 ?auto_2060187 ) ( SURFACE-AT ?auto_2060183 ?auto_2060187 ) ( CLEAR ?auto_2060183 ) ( IS-CRATE ?auto_2060184 ) ( not ( = ?auto_2060183 ?auto_2060184 ) ) ( TRUCK-AT ?auto_2060186 ?auto_2060187 ) ( AVAILABLE ?auto_2060185 ) ( IN ?auto_2060184 ?auto_2060186 ) ( ON ?auto_2060183 ?auto_2060182 ) ( not ( = ?auto_2060182 ?auto_2060183 ) ) ( not ( = ?auto_2060182 ?auto_2060184 ) ) ( ON ?auto_2060174 ?auto_2060173 ) ( ON ?auto_2060175 ?auto_2060174 ) ( ON ?auto_2060172 ?auto_2060175 ) ( ON ?auto_2060176 ?auto_2060172 ) ( ON ?auto_2060178 ?auto_2060176 ) ( ON ?auto_2060177 ?auto_2060178 ) ( ON ?auto_2060179 ?auto_2060177 ) ( ON ?auto_2060180 ?auto_2060179 ) ( ON ?auto_2060181 ?auto_2060180 ) ( ON ?auto_2060182 ?auto_2060181 ) ( not ( = ?auto_2060173 ?auto_2060174 ) ) ( not ( = ?auto_2060173 ?auto_2060175 ) ) ( not ( = ?auto_2060173 ?auto_2060172 ) ) ( not ( = ?auto_2060173 ?auto_2060176 ) ) ( not ( = ?auto_2060173 ?auto_2060178 ) ) ( not ( = ?auto_2060173 ?auto_2060177 ) ) ( not ( = ?auto_2060173 ?auto_2060179 ) ) ( not ( = ?auto_2060173 ?auto_2060180 ) ) ( not ( = ?auto_2060173 ?auto_2060181 ) ) ( not ( = ?auto_2060173 ?auto_2060182 ) ) ( not ( = ?auto_2060173 ?auto_2060183 ) ) ( not ( = ?auto_2060173 ?auto_2060184 ) ) ( not ( = ?auto_2060174 ?auto_2060175 ) ) ( not ( = ?auto_2060174 ?auto_2060172 ) ) ( not ( = ?auto_2060174 ?auto_2060176 ) ) ( not ( = ?auto_2060174 ?auto_2060178 ) ) ( not ( = ?auto_2060174 ?auto_2060177 ) ) ( not ( = ?auto_2060174 ?auto_2060179 ) ) ( not ( = ?auto_2060174 ?auto_2060180 ) ) ( not ( = ?auto_2060174 ?auto_2060181 ) ) ( not ( = ?auto_2060174 ?auto_2060182 ) ) ( not ( = ?auto_2060174 ?auto_2060183 ) ) ( not ( = ?auto_2060174 ?auto_2060184 ) ) ( not ( = ?auto_2060175 ?auto_2060172 ) ) ( not ( = ?auto_2060175 ?auto_2060176 ) ) ( not ( = ?auto_2060175 ?auto_2060178 ) ) ( not ( = ?auto_2060175 ?auto_2060177 ) ) ( not ( = ?auto_2060175 ?auto_2060179 ) ) ( not ( = ?auto_2060175 ?auto_2060180 ) ) ( not ( = ?auto_2060175 ?auto_2060181 ) ) ( not ( = ?auto_2060175 ?auto_2060182 ) ) ( not ( = ?auto_2060175 ?auto_2060183 ) ) ( not ( = ?auto_2060175 ?auto_2060184 ) ) ( not ( = ?auto_2060172 ?auto_2060176 ) ) ( not ( = ?auto_2060172 ?auto_2060178 ) ) ( not ( = ?auto_2060172 ?auto_2060177 ) ) ( not ( = ?auto_2060172 ?auto_2060179 ) ) ( not ( = ?auto_2060172 ?auto_2060180 ) ) ( not ( = ?auto_2060172 ?auto_2060181 ) ) ( not ( = ?auto_2060172 ?auto_2060182 ) ) ( not ( = ?auto_2060172 ?auto_2060183 ) ) ( not ( = ?auto_2060172 ?auto_2060184 ) ) ( not ( = ?auto_2060176 ?auto_2060178 ) ) ( not ( = ?auto_2060176 ?auto_2060177 ) ) ( not ( = ?auto_2060176 ?auto_2060179 ) ) ( not ( = ?auto_2060176 ?auto_2060180 ) ) ( not ( = ?auto_2060176 ?auto_2060181 ) ) ( not ( = ?auto_2060176 ?auto_2060182 ) ) ( not ( = ?auto_2060176 ?auto_2060183 ) ) ( not ( = ?auto_2060176 ?auto_2060184 ) ) ( not ( = ?auto_2060178 ?auto_2060177 ) ) ( not ( = ?auto_2060178 ?auto_2060179 ) ) ( not ( = ?auto_2060178 ?auto_2060180 ) ) ( not ( = ?auto_2060178 ?auto_2060181 ) ) ( not ( = ?auto_2060178 ?auto_2060182 ) ) ( not ( = ?auto_2060178 ?auto_2060183 ) ) ( not ( = ?auto_2060178 ?auto_2060184 ) ) ( not ( = ?auto_2060177 ?auto_2060179 ) ) ( not ( = ?auto_2060177 ?auto_2060180 ) ) ( not ( = ?auto_2060177 ?auto_2060181 ) ) ( not ( = ?auto_2060177 ?auto_2060182 ) ) ( not ( = ?auto_2060177 ?auto_2060183 ) ) ( not ( = ?auto_2060177 ?auto_2060184 ) ) ( not ( = ?auto_2060179 ?auto_2060180 ) ) ( not ( = ?auto_2060179 ?auto_2060181 ) ) ( not ( = ?auto_2060179 ?auto_2060182 ) ) ( not ( = ?auto_2060179 ?auto_2060183 ) ) ( not ( = ?auto_2060179 ?auto_2060184 ) ) ( not ( = ?auto_2060180 ?auto_2060181 ) ) ( not ( = ?auto_2060180 ?auto_2060182 ) ) ( not ( = ?auto_2060180 ?auto_2060183 ) ) ( not ( = ?auto_2060180 ?auto_2060184 ) ) ( not ( = ?auto_2060181 ?auto_2060182 ) ) ( not ( = ?auto_2060181 ?auto_2060183 ) ) ( not ( = ?auto_2060181 ?auto_2060184 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2060182 ?auto_2060183 ?auto_2060184 )
      ( MAKE-12CRATE-VERIFY ?auto_2060173 ?auto_2060174 ?auto_2060175 ?auto_2060172 ?auto_2060176 ?auto_2060178 ?auto_2060177 ?auto_2060179 ?auto_2060180 ?auto_2060181 ?auto_2060182 ?auto_2060183 ?auto_2060184 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2060311 - SURFACE
      ?auto_2060312 - SURFACE
      ?auto_2060313 - SURFACE
      ?auto_2060310 - SURFACE
      ?auto_2060314 - SURFACE
      ?auto_2060316 - SURFACE
      ?auto_2060315 - SURFACE
      ?auto_2060317 - SURFACE
      ?auto_2060318 - SURFACE
      ?auto_2060319 - SURFACE
      ?auto_2060320 - SURFACE
      ?auto_2060321 - SURFACE
      ?auto_2060322 - SURFACE
    )
    :vars
    (
      ?auto_2060326 - HOIST
      ?auto_2060324 - PLACE
      ?auto_2060323 - TRUCK
      ?auto_2060325 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2060326 ?auto_2060324 ) ( SURFACE-AT ?auto_2060321 ?auto_2060324 ) ( CLEAR ?auto_2060321 ) ( IS-CRATE ?auto_2060322 ) ( not ( = ?auto_2060321 ?auto_2060322 ) ) ( AVAILABLE ?auto_2060326 ) ( IN ?auto_2060322 ?auto_2060323 ) ( ON ?auto_2060321 ?auto_2060320 ) ( not ( = ?auto_2060320 ?auto_2060321 ) ) ( not ( = ?auto_2060320 ?auto_2060322 ) ) ( TRUCK-AT ?auto_2060323 ?auto_2060325 ) ( not ( = ?auto_2060325 ?auto_2060324 ) ) ( ON ?auto_2060312 ?auto_2060311 ) ( ON ?auto_2060313 ?auto_2060312 ) ( ON ?auto_2060310 ?auto_2060313 ) ( ON ?auto_2060314 ?auto_2060310 ) ( ON ?auto_2060316 ?auto_2060314 ) ( ON ?auto_2060315 ?auto_2060316 ) ( ON ?auto_2060317 ?auto_2060315 ) ( ON ?auto_2060318 ?auto_2060317 ) ( ON ?auto_2060319 ?auto_2060318 ) ( ON ?auto_2060320 ?auto_2060319 ) ( not ( = ?auto_2060311 ?auto_2060312 ) ) ( not ( = ?auto_2060311 ?auto_2060313 ) ) ( not ( = ?auto_2060311 ?auto_2060310 ) ) ( not ( = ?auto_2060311 ?auto_2060314 ) ) ( not ( = ?auto_2060311 ?auto_2060316 ) ) ( not ( = ?auto_2060311 ?auto_2060315 ) ) ( not ( = ?auto_2060311 ?auto_2060317 ) ) ( not ( = ?auto_2060311 ?auto_2060318 ) ) ( not ( = ?auto_2060311 ?auto_2060319 ) ) ( not ( = ?auto_2060311 ?auto_2060320 ) ) ( not ( = ?auto_2060311 ?auto_2060321 ) ) ( not ( = ?auto_2060311 ?auto_2060322 ) ) ( not ( = ?auto_2060312 ?auto_2060313 ) ) ( not ( = ?auto_2060312 ?auto_2060310 ) ) ( not ( = ?auto_2060312 ?auto_2060314 ) ) ( not ( = ?auto_2060312 ?auto_2060316 ) ) ( not ( = ?auto_2060312 ?auto_2060315 ) ) ( not ( = ?auto_2060312 ?auto_2060317 ) ) ( not ( = ?auto_2060312 ?auto_2060318 ) ) ( not ( = ?auto_2060312 ?auto_2060319 ) ) ( not ( = ?auto_2060312 ?auto_2060320 ) ) ( not ( = ?auto_2060312 ?auto_2060321 ) ) ( not ( = ?auto_2060312 ?auto_2060322 ) ) ( not ( = ?auto_2060313 ?auto_2060310 ) ) ( not ( = ?auto_2060313 ?auto_2060314 ) ) ( not ( = ?auto_2060313 ?auto_2060316 ) ) ( not ( = ?auto_2060313 ?auto_2060315 ) ) ( not ( = ?auto_2060313 ?auto_2060317 ) ) ( not ( = ?auto_2060313 ?auto_2060318 ) ) ( not ( = ?auto_2060313 ?auto_2060319 ) ) ( not ( = ?auto_2060313 ?auto_2060320 ) ) ( not ( = ?auto_2060313 ?auto_2060321 ) ) ( not ( = ?auto_2060313 ?auto_2060322 ) ) ( not ( = ?auto_2060310 ?auto_2060314 ) ) ( not ( = ?auto_2060310 ?auto_2060316 ) ) ( not ( = ?auto_2060310 ?auto_2060315 ) ) ( not ( = ?auto_2060310 ?auto_2060317 ) ) ( not ( = ?auto_2060310 ?auto_2060318 ) ) ( not ( = ?auto_2060310 ?auto_2060319 ) ) ( not ( = ?auto_2060310 ?auto_2060320 ) ) ( not ( = ?auto_2060310 ?auto_2060321 ) ) ( not ( = ?auto_2060310 ?auto_2060322 ) ) ( not ( = ?auto_2060314 ?auto_2060316 ) ) ( not ( = ?auto_2060314 ?auto_2060315 ) ) ( not ( = ?auto_2060314 ?auto_2060317 ) ) ( not ( = ?auto_2060314 ?auto_2060318 ) ) ( not ( = ?auto_2060314 ?auto_2060319 ) ) ( not ( = ?auto_2060314 ?auto_2060320 ) ) ( not ( = ?auto_2060314 ?auto_2060321 ) ) ( not ( = ?auto_2060314 ?auto_2060322 ) ) ( not ( = ?auto_2060316 ?auto_2060315 ) ) ( not ( = ?auto_2060316 ?auto_2060317 ) ) ( not ( = ?auto_2060316 ?auto_2060318 ) ) ( not ( = ?auto_2060316 ?auto_2060319 ) ) ( not ( = ?auto_2060316 ?auto_2060320 ) ) ( not ( = ?auto_2060316 ?auto_2060321 ) ) ( not ( = ?auto_2060316 ?auto_2060322 ) ) ( not ( = ?auto_2060315 ?auto_2060317 ) ) ( not ( = ?auto_2060315 ?auto_2060318 ) ) ( not ( = ?auto_2060315 ?auto_2060319 ) ) ( not ( = ?auto_2060315 ?auto_2060320 ) ) ( not ( = ?auto_2060315 ?auto_2060321 ) ) ( not ( = ?auto_2060315 ?auto_2060322 ) ) ( not ( = ?auto_2060317 ?auto_2060318 ) ) ( not ( = ?auto_2060317 ?auto_2060319 ) ) ( not ( = ?auto_2060317 ?auto_2060320 ) ) ( not ( = ?auto_2060317 ?auto_2060321 ) ) ( not ( = ?auto_2060317 ?auto_2060322 ) ) ( not ( = ?auto_2060318 ?auto_2060319 ) ) ( not ( = ?auto_2060318 ?auto_2060320 ) ) ( not ( = ?auto_2060318 ?auto_2060321 ) ) ( not ( = ?auto_2060318 ?auto_2060322 ) ) ( not ( = ?auto_2060319 ?auto_2060320 ) ) ( not ( = ?auto_2060319 ?auto_2060321 ) ) ( not ( = ?auto_2060319 ?auto_2060322 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2060320 ?auto_2060321 ?auto_2060322 )
      ( MAKE-12CRATE-VERIFY ?auto_2060311 ?auto_2060312 ?auto_2060313 ?auto_2060310 ?auto_2060314 ?auto_2060316 ?auto_2060315 ?auto_2060317 ?auto_2060318 ?auto_2060319 ?auto_2060320 ?auto_2060321 ?auto_2060322 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2060461 - SURFACE
      ?auto_2060462 - SURFACE
      ?auto_2060463 - SURFACE
      ?auto_2060460 - SURFACE
      ?auto_2060464 - SURFACE
      ?auto_2060466 - SURFACE
      ?auto_2060465 - SURFACE
      ?auto_2060467 - SURFACE
      ?auto_2060468 - SURFACE
      ?auto_2060469 - SURFACE
      ?auto_2060470 - SURFACE
      ?auto_2060471 - SURFACE
      ?auto_2060472 - SURFACE
    )
    :vars
    (
      ?auto_2060474 - HOIST
      ?auto_2060473 - PLACE
      ?auto_2060475 - TRUCK
      ?auto_2060477 - PLACE
      ?auto_2060476 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2060474 ?auto_2060473 ) ( SURFACE-AT ?auto_2060471 ?auto_2060473 ) ( CLEAR ?auto_2060471 ) ( IS-CRATE ?auto_2060472 ) ( not ( = ?auto_2060471 ?auto_2060472 ) ) ( AVAILABLE ?auto_2060474 ) ( ON ?auto_2060471 ?auto_2060470 ) ( not ( = ?auto_2060470 ?auto_2060471 ) ) ( not ( = ?auto_2060470 ?auto_2060472 ) ) ( TRUCK-AT ?auto_2060475 ?auto_2060477 ) ( not ( = ?auto_2060477 ?auto_2060473 ) ) ( HOIST-AT ?auto_2060476 ?auto_2060477 ) ( LIFTING ?auto_2060476 ?auto_2060472 ) ( not ( = ?auto_2060474 ?auto_2060476 ) ) ( ON ?auto_2060462 ?auto_2060461 ) ( ON ?auto_2060463 ?auto_2060462 ) ( ON ?auto_2060460 ?auto_2060463 ) ( ON ?auto_2060464 ?auto_2060460 ) ( ON ?auto_2060466 ?auto_2060464 ) ( ON ?auto_2060465 ?auto_2060466 ) ( ON ?auto_2060467 ?auto_2060465 ) ( ON ?auto_2060468 ?auto_2060467 ) ( ON ?auto_2060469 ?auto_2060468 ) ( ON ?auto_2060470 ?auto_2060469 ) ( not ( = ?auto_2060461 ?auto_2060462 ) ) ( not ( = ?auto_2060461 ?auto_2060463 ) ) ( not ( = ?auto_2060461 ?auto_2060460 ) ) ( not ( = ?auto_2060461 ?auto_2060464 ) ) ( not ( = ?auto_2060461 ?auto_2060466 ) ) ( not ( = ?auto_2060461 ?auto_2060465 ) ) ( not ( = ?auto_2060461 ?auto_2060467 ) ) ( not ( = ?auto_2060461 ?auto_2060468 ) ) ( not ( = ?auto_2060461 ?auto_2060469 ) ) ( not ( = ?auto_2060461 ?auto_2060470 ) ) ( not ( = ?auto_2060461 ?auto_2060471 ) ) ( not ( = ?auto_2060461 ?auto_2060472 ) ) ( not ( = ?auto_2060462 ?auto_2060463 ) ) ( not ( = ?auto_2060462 ?auto_2060460 ) ) ( not ( = ?auto_2060462 ?auto_2060464 ) ) ( not ( = ?auto_2060462 ?auto_2060466 ) ) ( not ( = ?auto_2060462 ?auto_2060465 ) ) ( not ( = ?auto_2060462 ?auto_2060467 ) ) ( not ( = ?auto_2060462 ?auto_2060468 ) ) ( not ( = ?auto_2060462 ?auto_2060469 ) ) ( not ( = ?auto_2060462 ?auto_2060470 ) ) ( not ( = ?auto_2060462 ?auto_2060471 ) ) ( not ( = ?auto_2060462 ?auto_2060472 ) ) ( not ( = ?auto_2060463 ?auto_2060460 ) ) ( not ( = ?auto_2060463 ?auto_2060464 ) ) ( not ( = ?auto_2060463 ?auto_2060466 ) ) ( not ( = ?auto_2060463 ?auto_2060465 ) ) ( not ( = ?auto_2060463 ?auto_2060467 ) ) ( not ( = ?auto_2060463 ?auto_2060468 ) ) ( not ( = ?auto_2060463 ?auto_2060469 ) ) ( not ( = ?auto_2060463 ?auto_2060470 ) ) ( not ( = ?auto_2060463 ?auto_2060471 ) ) ( not ( = ?auto_2060463 ?auto_2060472 ) ) ( not ( = ?auto_2060460 ?auto_2060464 ) ) ( not ( = ?auto_2060460 ?auto_2060466 ) ) ( not ( = ?auto_2060460 ?auto_2060465 ) ) ( not ( = ?auto_2060460 ?auto_2060467 ) ) ( not ( = ?auto_2060460 ?auto_2060468 ) ) ( not ( = ?auto_2060460 ?auto_2060469 ) ) ( not ( = ?auto_2060460 ?auto_2060470 ) ) ( not ( = ?auto_2060460 ?auto_2060471 ) ) ( not ( = ?auto_2060460 ?auto_2060472 ) ) ( not ( = ?auto_2060464 ?auto_2060466 ) ) ( not ( = ?auto_2060464 ?auto_2060465 ) ) ( not ( = ?auto_2060464 ?auto_2060467 ) ) ( not ( = ?auto_2060464 ?auto_2060468 ) ) ( not ( = ?auto_2060464 ?auto_2060469 ) ) ( not ( = ?auto_2060464 ?auto_2060470 ) ) ( not ( = ?auto_2060464 ?auto_2060471 ) ) ( not ( = ?auto_2060464 ?auto_2060472 ) ) ( not ( = ?auto_2060466 ?auto_2060465 ) ) ( not ( = ?auto_2060466 ?auto_2060467 ) ) ( not ( = ?auto_2060466 ?auto_2060468 ) ) ( not ( = ?auto_2060466 ?auto_2060469 ) ) ( not ( = ?auto_2060466 ?auto_2060470 ) ) ( not ( = ?auto_2060466 ?auto_2060471 ) ) ( not ( = ?auto_2060466 ?auto_2060472 ) ) ( not ( = ?auto_2060465 ?auto_2060467 ) ) ( not ( = ?auto_2060465 ?auto_2060468 ) ) ( not ( = ?auto_2060465 ?auto_2060469 ) ) ( not ( = ?auto_2060465 ?auto_2060470 ) ) ( not ( = ?auto_2060465 ?auto_2060471 ) ) ( not ( = ?auto_2060465 ?auto_2060472 ) ) ( not ( = ?auto_2060467 ?auto_2060468 ) ) ( not ( = ?auto_2060467 ?auto_2060469 ) ) ( not ( = ?auto_2060467 ?auto_2060470 ) ) ( not ( = ?auto_2060467 ?auto_2060471 ) ) ( not ( = ?auto_2060467 ?auto_2060472 ) ) ( not ( = ?auto_2060468 ?auto_2060469 ) ) ( not ( = ?auto_2060468 ?auto_2060470 ) ) ( not ( = ?auto_2060468 ?auto_2060471 ) ) ( not ( = ?auto_2060468 ?auto_2060472 ) ) ( not ( = ?auto_2060469 ?auto_2060470 ) ) ( not ( = ?auto_2060469 ?auto_2060471 ) ) ( not ( = ?auto_2060469 ?auto_2060472 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2060470 ?auto_2060471 ?auto_2060472 )
      ( MAKE-12CRATE-VERIFY ?auto_2060461 ?auto_2060462 ?auto_2060463 ?auto_2060460 ?auto_2060464 ?auto_2060466 ?auto_2060465 ?auto_2060467 ?auto_2060468 ?auto_2060469 ?auto_2060470 ?auto_2060471 ?auto_2060472 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2060623 - SURFACE
      ?auto_2060624 - SURFACE
      ?auto_2060625 - SURFACE
      ?auto_2060622 - SURFACE
      ?auto_2060626 - SURFACE
      ?auto_2060628 - SURFACE
      ?auto_2060627 - SURFACE
      ?auto_2060629 - SURFACE
      ?auto_2060630 - SURFACE
      ?auto_2060631 - SURFACE
      ?auto_2060632 - SURFACE
      ?auto_2060633 - SURFACE
      ?auto_2060634 - SURFACE
    )
    :vars
    (
      ?auto_2060636 - HOIST
      ?auto_2060640 - PLACE
      ?auto_2060637 - TRUCK
      ?auto_2060639 - PLACE
      ?auto_2060638 - HOIST
      ?auto_2060635 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2060636 ?auto_2060640 ) ( SURFACE-AT ?auto_2060633 ?auto_2060640 ) ( CLEAR ?auto_2060633 ) ( IS-CRATE ?auto_2060634 ) ( not ( = ?auto_2060633 ?auto_2060634 ) ) ( AVAILABLE ?auto_2060636 ) ( ON ?auto_2060633 ?auto_2060632 ) ( not ( = ?auto_2060632 ?auto_2060633 ) ) ( not ( = ?auto_2060632 ?auto_2060634 ) ) ( TRUCK-AT ?auto_2060637 ?auto_2060639 ) ( not ( = ?auto_2060639 ?auto_2060640 ) ) ( HOIST-AT ?auto_2060638 ?auto_2060639 ) ( not ( = ?auto_2060636 ?auto_2060638 ) ) ( AVAILABLE ?auto_2060638 ) ( SURFACE-AT ?auto_2060634 ?auto_2060639 ) ( ON ?auto_2060634 ?auto_2060635 ) ( CLEAR ?auto_2060634 ) ( not ( = ?auto_2060633 ?auto_2060635 ) ) ( not ( = ?auto_2060634 ?auto_2060635 ) ) ( not ( = ?auto_2060632 ?auto_2060635 ) ) ( ON ?auto_2060624 ?auto_2060623 ) ( ON ?auto_2060625 ?auto_2060624 ) ( ON ?auto_2060622 ?auto_2060625 ) ( ON ?auto_2060626 ?auto_2060622 ) ( ON ?auto_2060628 ?auto_2060626 ) ( ON ?auto_2060627 ?auto_2060628 ) ( ON ?auto_2060629 ?auto_2060627 ) ( ON ?auto_2060630 ?auto_2060629 ) ( ON ?auto_2060631 ?auto_2060630 ) ( ON ?auto_2060632 ?auto_2060631 ) ( not ( = ?auto_2060623 ?auto_2060624 ) ) ( not ( = ?auto_2060623 ?auto_2060625 ) ) ( not ( = ?auto_2060623 ?auto_2060622 ) ) ( not ( = ?auto_2060623 ?auto_2060626 ) ) ( not ( = ?auto_2060623 ?auto_2060628 ) ) ( not ( = ?auto_2060623 ?auto_2060627 ) ) ( not ( = ?auto_2060623 ?auto_2060629 ) ) ( not ( = ?auto_2060623 ?auto_2060630 ) ) ( not ( = ?auto_2060623 ?auto_2060631 ) ) ( not ( = ?auto_2060623 ?auto_2060632 ) ) ( not ( = ?auto_2060623 ?auto_2060633 ) ) ( not ( = ?auto_2060623 ?auto_2060634 ) ) ( not ( = ?auto_2060623 ?auto_2060635 ) ) ( not ( = ?auto_2060624 ?auto_2060625 ) ) ( not ( = ?auto_2060624 ?auto_2060622 ) ) ( not ( = ?auto_2060624 ?auto_2060626 ) ) ( not ( = ?auto_2060624 ?auto_2060628 ) ) ( not ( = ?auto_2060624 ?auto_2060627 ) ) ( not ( = ?auto_2060624 ?auto_2060629 ) ) ( not ( = ?auto_2060624 ?auto_2060630 ) ) ( not ( = ?auto_2060624 ?auto_2060631 ) ) ( not ( = ?auto_2060624 ?auto_2060632 ) ) ( not ( = ?auto_2060624 ?auto_2060633 ) ) ( not ( = ?auto_2060624 ?auto_2060634 ) ) ( not ( = ?auto_2060624 ?auto_2060635 ) ) ( not ( = ?auto_2060625 ?auto_2060622 ) ) ( not ( = ?auto_2060625 ?auto_2060626 ) ) ( not ( = ?auto_2060625 ?auto_2060628 ) ) ( not ( = ?auto_2060625 ?auto_2060627 ) ) ( not ( = ?auto_2060625 ?auto_2060629 ) ) ( not ( = ?auto_2060625 ?auto_2060630 ) ) ( not ( = ?auto_2060625 ?auto_2060631 ) ) ( not ( = ?auto_2060625 ?auto_2060632 ) ) ( not ( = ?auto_2060625 ?auto_2060633 ) ) ( not ( = ?auto_2060625 ?auto_2060634 ) ) ( not ( = ?auto_2060625 ?auto_2060635 ) ) ( not ( = ?auto_2060622 ?auto_2060626 ) ) ( not ( = ?auto_2060622 ?auto_2060628 ) ) ( not ( = ?auto_2060622 ?auto_2060627 ) ) ( not ( = ?auto_2060622 ?auto_2060629 ) ) ( not ( = ?auto_2060622 ?auto_2060630 ) ) ( not ( = ?auto_2060622 ?auto_2060631 ) ) ( not ( = ?auto_2060622 ?auto_2060632 ) ) ( not ( = ?auto_2060622 ?auto_2060633 ) ) ( not ( = ?auto_2060622 ?auto_2060634 ) ) ( not ( = ?auto_2060622 ?auto_2060635 ) ) ( not ( = ?auto_2060626 ?auto_2060628 ) ) ( not ( = ?auto_2060626 ?auto_2060627 ) ) ( not ( = ?auto_2060626 ?auto_2060629 ) ) ( not ( = ?auto_2060626 ?auto_2060630 ) ) ( not ( = ?auto_2060626 ?auto_2060631 ) ) ( not ( = ?auto_2060626 ?auto_2060632 ) ) ( not ( = ?auto_2060626 ?auto_2060633 ) ) ( not ( = ?auto_2060626 ?auto_2060634 ) ) ( not ( = ?auto_2060626 ?auto_2060635 ) ) ( not ( = ?auto_2060628 ?auto_2060627 ) ) ( not ( = ?auto_2060628 ?auto_2060629 ) ) ( not ( = ?auto_2060628 ?auto_2060630 ) ) ( not ( = ?auto_2060628 ?auto_2060631 ) ) ( not ( = ?auto_2060628 ?auto_2060632 ) ) ( not ( = ?auto_2060628 ?auto_2060633 ) ) ( not ( = ?auto_2060628 ?auto_2060634 ) ) ( not ( = ?auto_2060628 ?auto_2060635 ) ) ( not ( = ?auto_2060627 ?auto_2060629 ) ) ( not ( = ?auto_2060627 ?auto_2060630 ) ) ( not ( = ?auto_2060627 ?auto_2060631 ) ) ( not ( = ?auto_2060627 ?auto_2060632 ) ) ( not ( = ?auto_2060627 ?auto_2060633 ) ) ( not ( = ?auto_2060627 ?auto_2060634 ) ) ( not ( = ?auto_2060627 ?auto_2060635 ) ) ( not ( = ?auto_2060629 ?auto_2060630 ) ) ( not ( = ?auto_2060629 ?auto_2060631 ) ) ( not ( = ?auto_2060629 ?auto_2060632 ) ) ( not ( = ?auto_2060629 ?auto_2060633 ) ) ( not ( = ?auto_2060629 ?auto_2060634 ) ) ( not ( = ?auto_2060629 ?auto_2060635 ) ) ( not ( = ?auto_2060630 ?auto_2060631 ) ) ( not ( = ?auto_2060630 ?auto_2060632 ) ) ( not ( = ?auto_2060630 ?auto_2060633 ) ) ( not ( = ?auto_2060630 ?auto_2060634 ) ) ( not ( = ?auto_2060630 ?auto_2060635 ) ) ( not ( = ?auto_2060631 ?auto_2060632 ) ) ( not ( = ?auto_2060631 ?auto_2060633 ) ) ( not ( = ?auto_2060631 ?auto_2060634 ) ) ( not ( = ?auto_2060631 ?auto_2060635 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2060632 ?auto_2060633 ?auto_2060634 )
      ( MAKE-12CRATE-VERIFY ?auto_2060623 ?auto_2060624 ?auto_2060625 ?auto_2060622 ?auto_2060626 ?auto_2060628 ?auto_2060627 ?auto_2060629 ?auto_2060630 ?auto_2060631 ?auto_2060632 ?auto_2060633 ?auto_2060634 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2060786 - SURFACE
      ?auto_2060787 - SURFACE
      ?auto_2060788 - SURFACE
      ?auto_2060785 - SURFACE
      ?auto_2060789 - SURFACE
      ?auto_2060791 - SURFACE
      ?auto_2060790 - SURFACE
      ?auto_2060792 - SURFACE
      ?auto_2060793 - SURFACE
      ?auto_2060794 - SURFACE
      ?auto_2060795 - SURFACE
      ?auto_2060796 - SURFACE
      ?auto_2060797 - SURFACE
    )
    :vars
    (
      ?auto_2060798 - HOIST
      ?auto_2060801 - PLACE
      ?auto_2060800 - PLACE
      ?auto_2060802 - HOIST
      ?auto_2060799 - SURFACE
      ?auto_2060803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2060798 ?auto_2060801 ) ( SURFACE-AT ?auto_2060796 ?auto_2060801 ) ( CLEAR ?auto_2060796 ) ( IS-CRATE ?auto_2060797 ) ( not ( = ?auto_2060796 ?auto_2060797 ) ) ( AVAILABLE ?auto_2060798 ) ( ON ?auto_2060796 ?auto_2060795 ) ( not ( = ?auto_2060795 ?auto_2060796 ) ) ( not ( = ?auto_2060795 ?auto_2060797 ) ) ( not ( = ?auto_2060800 ?auto_2060801 ) ) ( HOIST-AT ?auto_2060802 ?auto_2060800 ) ( not ( = ?auto_2060798 ?auto_2060802 ) ) ( AVAILABLE ?auto_2060802 ) ( SURFACE-AT ?auto_2060797 ?auto_2060800 ) ( ON ?auto_2060797 ?auto_2060799 ) ( CLEAR ?auto_2060797 ) ( not ( = ?auto_2060796 ?auto_2060799 ) ) ( not ( = ?auto_2060797 ?auto_2060799 ) ) ( not ( = ?auto_2060795 ?auto_2060799 ) ) ( TRUCK-AT ?auto_2060803 ?auto_2060801 ) ( ON ?auto_2060787 ?auto_2060786 ) ( ON ?auto_2060788 ?auto_2060787 ) ( ON ?auto_2060785 ?auto_2060788 ) ( ON ?auto_2060789 ?auto_2060785 ) ( ON ?auto_2060791 ?auto_2060789 ) ( ON ?auto_2060790 ?auto_2060791 ) ( ON ?auto_2060792 ?auto_2060790 ) ( ON ?auto_2060793 ?auto_2060792 ) ( ON ?auto_2060794 ?auto_2060793 ) ( ON ?auto_2060795 ?auto_2060794 ) ( not ( = ?auto_2060786 ?auto_2060787 ) ) ( not ( = ?auto_2060786 ?auto_2060788 ) ) ( not ( = ?auto_2060786 ?auto_2060785 ) ) ( not ( = ?auto_2060786 ?auto_2060789 ) ) ( not ( = ?auto_2060786 ?auto_2060791 ) ) ( not ( = ?auto_2060786 ?auto_2060790 ) ) ( not ( = ?auto_2060786 ?auto_2060792 ) ) ( not ( = ?auto_2060786 ?auto_2060793 ) ) ( not ( = ?auto_2060786 ?auto_2060794 ) ) ( not ( = ?auto_2060786 ?auto_2060795 ) ) ( not ( = ?auto_2060786 ?auto_2060796 ) ) ( not ( = ?auto_2060786 ?auto_2060797 ) ) ( not ( = ?auto_2060786 ?auto_2060799 ) ) ( not ( = ?auto_2060787 ?auto_2060788 ) ) ( not ( = ?auto_2060787 ?auto_2060785 ) ) ( not ( = ?auto_2060787 ?auto_2060789 ) ) ( not ( = ?auto_2060787 ?auto_2060791 ) ) ( not ( = ?auto_2060787 ?auto_2060790 ) ) ( not ( = ?auto_2060787 ?auto_2060792 ) ) ( not ( = ?auto_2060787 ?auto_2060793 ) ) ( not ( = ?auto_2060787 ?auto_2060794 ) ) ( not ( = ?auto_2060787 ?auto_2060795 ) ) ( not ( = ?auto_2060787 ?auto_2060796 ) ) ( not ( = ?auto_2060787 ?auto_2060797 ) ) ( not ( = ?auto_2060787 ?auto_2060799 ) ) ( not ( = ?auto_2060788 ?auto_2060785 ) ) ( not ( = ?auto_2060788 ?auto_2060789 ) ) ( not ( = ?auto_2060788 ?auto_2060791 ) ) ( not ( = ?auto_2060788 ?auto_2060790 ) ) ( not ( = ?auto_2060788 ?auto_2060792 ) ) ( not ( = ?auto_2060788 ?auto_2060793 ) ) ( not ( = ?auto_2060788 ?auto_2060794 ) ) ( not ( = ?auto_2060788 ?auto_2060795 ) ) ( not ( = ?auto_2060788 ?auto_2060796 ) ) ( not ( = ?auto_2060788 ?auto_2060797 ) ) ( not ( = ?auto_2060788 ?auto_2060799 ) ) ( not ( = ?auto_2060785 ?auto_2060789 ) ) ( not ( = ?auto_2060785 ?auto_2060791 ) ) ( not ( = ?auto_2060785 ?auto_2060790 ) ) ( not ( = ?auto_2060785 ?auto_2060792 ) ) ( not ( = ?auto_2060785 ?auto_2060793 ) ) ( not ( = ?auto_2060785 ?auto_2060794 ) ) ( not ( = ?auto_2060785 ?auto_2060795 ) ) ( not ( = ?auto_2060785 ?auto_2060796 ) ) ( not ( = ?auto_2060785 ?auto_2060797 ) ) ( not ( = ?auto_2060785 ?auto_2060799 ) ) ( not ( = ?auto_2060789 ?auto_2060791 ) ) ( not ( = ?auto_2060789 ?auto_2060790 ) ) ( not ( = ?auto_2060789 ?auto_2060792 ) ) ( not ( = ?auto_2060789 ?auto_2060793 ) ) ( not ( = ?auto_2060789 ?auto_2060794 ) ) ( not ( = ?auto_2060789 ?auto_2060795 ) ) ( not ( = ?auto_2060789 ?auto_2060796 ) ) ( not ( = ?auto_2060789 ?auto_2060797 ) ) ( not ( = ?auto_2060789 ?auto_2060799 ) ) ( not ( = ?auto_2060791 ?auto_2060790 ) ) ( not ( = ?auto_2060791 ?auto_2060792 ) ) ( not ( = ?auto_2060791 ?auto_2060793 ) ) ( not ( = ?auto_2060791 ?auto_2060794 ) ) ( not ( = ?auto_2060791 ?auto_2060795 ) ) ( not ( = ?auto_2060791 ?auto_2060796 ) ) ( not ( = ?auto_2060791 ?auto_2060797 ) ) ( not ( = ?auto_2060791 ?auto_2060799 ) ) ( not ( = ?auto_2060790 ?auto_2060792 ) ) ( not ( = ?auto_2060790 ?auto_2060793 ) ) ( not ( = ?auto_2060790 ?auto_2060794 ) ) ( not ( = ?auto_2060790 ?auto_2060795 ) ) ( not ( = ?auto_2060790 ?auto_2060796 ) ) ( not ( = ?auto_2060790 ?auto_2060797 ) ) ( not ( = ?auto_2060790 ?auto_2060799 ) ) ( not ( = ?auto_2060792 ?auto_2060793 ) ) ( not ( = ?auto_2060792 ?auto_2060794 ) ) ( not ( = ?auto_2060792 ?auto_2060795 ) ) ( not ( = ?auto_2060792 ?auto_2060796 ) ) ( not ( = ?auto_2060792 ?auto_2060797 ) ) ( not ( = ?auto_2060792 ?auto_2060799 ) ) ( not ( = ?auto_2060793 ?auto_2060794 ) ) ( not ( = ?auto_2060793 ?auto_2060795 ) ) ( not ( = ?auto_2060793 ?auto_2060796 ) ) ( not ( = ?auto_2060793 ?auto_2060797 ) ) ( not ( = ?auto_2060793 ?auto_2060799 ) ) ( not ( = ?auto_2060794 ?auto_2060795 ) ) ( not ( = ?auto_2060794 ?auto_2060796 ) ) ( not ( = ?auto_2060794 ?auto_2060797 ) ) ( not ( = ?auto_2060794 ?auto_2060799 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2060795 ?auto_2060796 ?auto_2060797 )
      ( MAKE-12CRATE-VERIFY ?auto_2060786 ?auto_2060787 ?auto_2060788 ?auto_2060785 ?auto_2060789 ?auto_2060791 ?auto_2060790 ?auto_2060792 ?auto_2060793 ?auto_2060794 ?auto_2060795 ?auto_2060796 ?auto_2060797 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2060949 - SURFACE
      ?auto_2060950 - SURFACE
      ?auto_2060951 - SURFACE
      ?auto_2060948 - SURFACE
      ?auto_2060952 - SURFACE
      ?auto_2060954 - SURFACE
      ?auto_2060953 - SURFACE
      ?auto_2060955 - SURFACE
      ?auto_2060956 - SURFACE
      ?auto_2060957 - SURFACE
      ?auto_2060958 - SURFACE
      ?auto_2060959 - SURFACE
      ?auto_2060960 - SURFACE
    )
    :vars
    (
      ?auto_2060964 - HOIST
      ?auto_2060961 - PLACE
      ?auto_2060962 - PLACE
      ?auto_2060965 - HOIST
      ?auto_2060966 - SURFACE
      ?auto_2060963 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2060964 ?auto_2060961 ) ( IS-CRATE ?auto_2060960 ) ( not ( = ?auto_2060959 ?auto_2060960 ) ) ( not ( = ?auto_2060958 ?auto_2060959 ) ) ( not ( = ?auto_2060958 ?auto_2060960 ) ) ( not ( = ?auto_2060962 ?auto_2060961 ) ) ( HOIST-AT ?auto_2060965 ?auto_2060962 ) ( not ( = ?auto_2060964 ?auto_2060965 ) ) ( AVAILABLE ?auto_2060965 ) ( SURFACE-AT ?auto_2060960 ?auto_2060962 ) ( ON ?auto_2060960 ?auto_2060966 ) ( CLEAR ?auto_2060960 ) ( not ( = ?auto_2060959 ?auto_2060966 ) ) ( not ( = ?auto_2060960 ?auto_2060966 ) ) ( not ( = ?auto_2060958 ?auto_2060966 ) ) ( TRUCK-AT ?auto_2060963 ?auto_2060961 ) ( SURFACE-AT ?auto_2060958 ?auto_2060961 ) ( CLEAR ?auto_2060958 ) ( LIFTING ?auto_2060964 ?auto_2060959 ) ( IS-CRATE ?auto_2060959 ) ( ON ?auto_2060950 ?auto_2060949 ) ( ON ?auto_2060951 ?auto_2060950 ) ( ON ?auto_2060948 ?auto_2060951 ) ( ON ?auto_2060952 ?auto_2060948 ) ( ON ?auto_2060954 ?auto_2060952 ) ( ON ?auto_2060953 ?auto_2060954 ) ( ON ?auto_2060955 ?auto_2060953 ) ( ON ?auto_2060956 ?auto_2060955 ) ( ON ?auto_2060957 ?auto_2060956 ) ( ON ?auto_2060958 ?auto_2060957 ) ( not ( = ?auto_2060949 ?auto_2060950 ) ) ( not ( = ?auto_2060949 ?auto_2060951 ) ) ( not ( = ?auto_2060949 ?auto_2060948 ) ) ( not ( = ?auto_2060949 ?auto_2060952 ) ) ( not ( = ?auto_2060949 ?auto_2060954 ) ) ( not ( = ?auto_2060949 ?auto_2060953 ) ) ( not ( = ?auto_2060949 ?auto_2060955 ) ) ( not ( = ?auto_2060949 ?auto_2060956 ) ) ( not ( = ?auto_2060949 ?auto_2060957 ) ) ( not ( = ?auto_2060949 ?auto_2060958 ) ) ( not ( = ?auto_2060949 ?auto_2060959 ) ) ( not ( = ?auto_2060949 ?auto_2060960 ) ) ( not ( = ?auto_2060949 ?auto_2060966 ) ) ( not ( = ?auto_2060950 ?auto_2060951 ) ) ( not ( = ?auto_2060950 ?auto_2060948 ) ) ( not ( = ?auto_2060950 ?auto_2060952 ) ) ( not ( = ?auto_2060950 ?auto_2060954 ) ) ( not ( = ?auto_2060950 ?auto_2060953 ) ) ( not ( = ?auto_2060950 ?auto_2060955 ) ) ( not ( = ?auto_2060950 ?auto_2060956 ) ) ( not ( = ?auto_2060950 ?auto_2060957 ) ) ( not ( = ?auto_2060950 ?auto_2060958 ) ) ( not ( = ?auto_2060950 ?auto_2060959 ) ) ( not ( = ?auto_2060950 ?auto_2060960 ) ) ( not ( = ?auto_2060950 ?auto_2060966 ) ) ( not ( = ?auto_2060951 ?auto_2060948 ) ) ( not ( = ?auto_2060951 ?auto_2060952 ) ) ( not ( = ?auto_2060951 ?auto_2060954 ) ) ( not ( = ?auto_2060951 ?auto_2060953 ) ) ( not ( = ?auto_2060951 ?auto_2060955 ) ) ( not ( = ?auto_2060951 ?auto_2060956 ) ) ( not ( = ?auto_2060951 ?auto_2060957 ) ) ( not ( = ?auto_2060951 ?auto_2060958 ) ) ( not ( = ?auto_2060951 ?auto_2060959 ) ) ( not ( = ?auto_2060951 ?auto_2060960 ) ) ( not ( = ?auto_2060951 ?auto_2060966 ) ) ( not ( = ?auto_2060948 ?auto_2060952 ) ) ( not ( = ?auto_2060948 ?auto_2060954 ) ) ( not ( = ?auto_2060948 ?auto_2060953 ) ) ( not ( = ?auto_2060948 ?auto_2060955 ) ) ( not ( = ?auto_2060948 ?auto_2060956 ) ) ( not ( = ?auto_2060948 ?auto_2060957 ) ) ( not ( = ?auto_2060948 ?auto_2060958 ) ) ( not ( = ?auto_2060948 ?auto_2060959 ) ) ( not ( = ?auto_2060948 ?auto_2060960 ) ) ( not ( = ?auto_2060948 ?auto_2060966 ) ) ( not ( = ?auto_2060952 ?auto_2060954 ) ) ( not ( = ?auto_2060952 ?auto_2060953 ) ) ( not ( = ?auto_2060952 ?auto_2060955 ) ) ( not ( = ?auto_2060952 ?auto_2060956 ) ) ( not ( = ?auto_2060952 ?auto_2060957 ) ) ( not ( = ?auto_2060952 ?auto_2060958 ) ) ( not ( = ?auto_2060952 ?auto_2060959 ) ) ( not ( = ?auto_2060952 ?auto_2060960 ) ) ( not ( = ?auto_2060952 ?auto_2060966 ) ) ( not ( = ?auto_2060954 ?auto_2060953 ) ) ( not ( = ?auto_2060954 ?auto_2060955 ) ) ( not ( = ?auto_2060954 ?auto_2060956 ) ) ( not ( = ?auto_2060954 ?auto_2060957 ) ) ( not ( = ?auto_2060954 ?auto_2060958 ) ) ( not ( = ?auto_2060954 ?auto_2060959 ) ) ( not ( = ?auto_2060954 ?auto_2060960 ) ) ( not ( = ?auto_2060954 ?auto_2060966 ) ) ( not ( = ?auto_2060953 ?auto_2060955 ) ) ( not ( = ?auto_2060953 ?auto_2060956 ) ) ( not ( = ?auto_2060953 ?auto_2060957 ) ) ( not ( = ?auto_2060953 ?auto_2060958 ) ) ( not ( = ?auto_2060953 ?auto_2060959 ) ) ( not ( = ?auto_2060953 ?auto_2060960 ) ) ( not ( = ?auto_2060953 ?auto_2060966 ) ) ( not ( = ?auto_2060955 ?auto_2060956 ) ) ( not ( = ?auto_2060955 ?auto_2060957 ) ) ( not ( = ?auto_2060955 ?auto_2060958 ) ) ( not ( = ?auto_2060955 ?auto_2060959 ) ) ( not ( = ?auto_2060955 ?auto_2060960 ) ) ( not ( = ?auto_2060955 ?auto_2060966 ) ) ( not ( = ?auto_2060956 ?auto_2060957 ) ) ( not ( = ?auto_2060956 ?auto_2060958 ) ) ( not ( = ?auto_2060956 ?auto_2060959 ) ) ( not ( = ?auto_2060956 ?auto_2060960 ) ) ( not ( = ?auto_2060956 ?auto_2060966 ) ) ( not ( = ?auto_2060957 ?auto_2060958 ) ) ( not ( = ?auto_2060957 ?auto_2060959 ) ) ( not ( = ?auto_2060957 ?auto_2060960 ) ) ( not ( = ?auto_2060957 ?auto_2060966 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2060958 ?auto_2060959 ?auto_2060960 )
      ( MAKE-12CRATE-VERIFY ?auto_2060949 ?auto_2060950 ?auto_2060951 ?auto_2060948 ?auto_2060952 ?auto_2060954 ?auto_2060953 ?auto_2060955 ?auto_2060956 ?auto_2060957 ?auto_2060958 ?auto_2060959 ?auto_2060960 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2061112 - SURFACE
      ?auto_2061113 - SURFACE
      ?auto_2061114 - SURFACE
      ?auto_2061111 - SURFACE
      ?auto_2061115 - SURFACE
      ?auto_2061117 - SURFACE
      ?auto_2061116 - SURFACE
      ?auto_2061118 - SURFACE
      ?auto_2061119 - SURFACE
      ?auto_2061120 - SURFACE
      ?auto_2061121 - SURFACE
      ?auto_2061122 - SURFACE
      ?auto_2061123 - SURFACE
    )
    :vars
    (
      ?auto_2061128 - HOIST
      ?auto_2061126 - PLACE
      ?auto_2061125 - PLACE
      ?auto_2061129 - HOIST
      ?auto_2061127 - SURFACE
      ?auto_2061124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2061128 ?auto_2061126 ) ( IS-CRATE ?auto_2061123 ) ( not ( = ?auto_2061122 ?auto_2061123 ) ) ( not ( = ?auto_2061121 ?auto_2061122 ) ) ( not ( = ?auto_2061121 ?auto_2061123 ) ) ( not ( = ?auto_2061125 ?auto_2061126 ) ) ( HOIST-AT ?auto_2061129 ?auto_2061125 ) ( not ( = ?auto_2061128 ?auto_2061129 ) ) ( AVAILABLE ?auto_2061129 ) ( SURFACE-AT ?auto_2061123 ?auto_2061125 ) ( ON ?auto_2061123 ?auto_2061127 ) ( CLEAR ?auto_2061123 ) ( not ( = ?auto_2061122 ?auto_2061127 ) ) ( not ( = ?auto_2061123 ?auto_2061127 ) ) ( not ( = ?auto_2061121 ?auto_2061127 ) ) ( TRUCK-AT ?auto_2061124 ?auto_2061126 ) ( SURFACE-AT ?auto_2061121 ?auto_2061126 ) ( CLEAR ?auto_2061121 ) ( IS-CRATE ?auto_2061122 ) ( AVAILABLE ?auto_2061128 ) ( IN ?auto_2061122 ?auto_2061124 ) ( ON ?auto_2061113 ?auto_2061112 ) ( ON ?auto_2061114 ?auto_2061113 ) ( ON ?auto_2061111 ?auto_2061114 ) ( ON ?auto_2061115 ?auto_2061111 ) ( ON ?auto_2061117 ?auto_2061115 ) ( ON ?auto_2061116 ?auto_2061117 ) ( ON ?auto_2061118 ?auto_2061116 ) ( ON ?auto_2061119 ?auto_2061118 ) ( ON ?auto_2061120 ?auto_2061119 ) ( ON ?auto_2061121 ?auto_2061120 ) ( not ( = ?auto_2061112 ?auto_2061113 ) ) ( not ( = ?auto_2061112 ?auto_2061114 ) ) ( not ( = ?auto_2061112 ?auto_2061111 ) ) ( not ( = ?auto_2061112 ?auto_2061115 ) ) ( not ( = ?auto_2061112 ?auto_2061117 ) ) ( not ( = ?auto_2061112 ?auto_2061116 ) ) ( not ( = ?auto_2061112 ?auto_2061118 ) ) ( not ( = ?auto_2061112 ?auto_2061119 ) ) ( not ( = ?auto_2061112 ?auto_2061120 ) ) ( not ( = ?auto_2061112 ?auto_2061121 ) ) ( not ( = ?auto_2061112 ?auto_2061122 ) ) ( not ( = ?auto_2061112 ?auto_2061123 ) ) ( not ( = ?auto_2061112 ?auto_2061127 ) ) ( not ( = ?auto_2061113 ?auto_2061114 ) ) ( not ( = ?auto_2061113 ?auto_2061111 ) ) ( not ( = ?auto_2061113 ?auto_2061115 ) ) ( not ( = ?auto_2061113 ?auto_2061117 ) ) ( not ( = ?auto_2061113 ?auto_2061116 ) ) ( not ( = ?auto_2061113 ?auto_2061118 ) ) ( not ( = ?auto_2061113 ?auto_2061119 ) ) ( not ( = ?auto_2061113 ?auto_2061120 ) ) ( not ( = ?auto_2061113 ?auto_2061121 ) ) ( not ( = ?auto_2061113 ?auto_2061122 ) ) ( not ( = ?auto_2061113 ?auto_2061123 ) ) ( not ( = ?auto_2061113 ?auto_2061127 ) ) ( not ( = ?auto_2061114 ?auto_2061111 ) ) ( not ( = ?auto_2061114 ?auto_2061115 ) ) ( not ( = ?auto_2061114 ?auto_2061117 ) ) ( not ( = ?auto_2061114 ?auto_2061116 ) ) ( not ( = ?auto_2061114 ?auto_2061118 ) ) ( not ( = ?auto_2061114 ?auto_2061119 ) ) ( not ( = ?auto_2061114 ?auto_2061120 ) ) ( not ( = ?auto_2061114 ?auto_2061121 ) ) ( not ( = ?auto_2061114 ?auto_2061122 ) ) ( not ( = ?auto_2061114 ?auto_2061123 ) ) ( not ( = ?auto_2061114 ?auto_2061127 ) ) ( not ( = ?auto_2061111 ?auto_2061115 ) ) ( not ( = ?auto_2061111 ?auto_2061117 ) ) ( not ( = ?auto_2061111 ?auto_2061116 ) ) ( not ( = ?auto_2061111 ?auto_2061118 ) ) ( not ( = ?auto_2061111 ?auto_2061119 ) ) ( not ( = ?auto_2061111 ?auto_2061120 ) ) ( not ( = ?auto_2061111 ?auto_2061121 ) ) ( not ( = ?auto_2061111 ?auto_2061122 ) ) ( not ( = ?auto_2061111 ?auto_2061123 ) ) ( not ( = ?auto_2061111 ?auto_2061127 ) ) ( not ( = ?auto_2061115 ?auto_2061117 ) ) ( not ( = ?auto_2061115 ?auto_2061116 ) ) ( not ( = ?auto_2061115 ?auto_2061118 ) ) ( not ( = ?auto_2061115 ?auto_2061119 ) ) ( not ( = ?auto_2061115 ?auto_2061120 ) ) ( not ( = ?auto_2061115 ?auto_2061121 ) ) ( not ( = ?auto_2061115 ?auto_2061122 ) ) ( not ( = ?auto_2061115 ?auto_2061123 ) ) ( not ( = ?auto_2061115 ?auto_2061127 ) ) ( not ( = ?auto_2061117 ?auto_2061116 ) ) ( not ( = ?auto_2061117 ?auto_2061118 ) ) ( not ( = ?auto_2061117 ?auto_2061119 ) ) ( not ( = ?auto_2061117 ?auto_2061120 ) ) ( not ( = ?auto_2061117 ?auto_2061121 ) ) ( not ( = ?auto_2061117 ?auto_2061122 ) ) ( not ( = ?auto_2061117 ?auto_2061123 ) ) ( not ( = ?auto_2061117 ?auto_2061127 ) ) ( not ( = ?auto_2061116 ?auto_2061118 ) ) ( not ( = ?auto_2061116 ?auto_2061119 ) ) ( not ( = ?auto_2061116 ?auto_2061120 ) ) ( not ( = ?auto_2061116 ?auto_2061121 ) ) ( not ( = ?auto_2061116 ?auto_2061122 ) ) ( not ( = ?auto_2061116 ?auto_2061123 ) ) ( not ( = ?auto_2061116 ?auto_2061127 ) ) ( not ( = ?auto_2061118 ?auto_2061119 ) ) ( not ( = ?auto_2061118 ?auto_2061120 ) ) ( not ( = ?auto_2061118 ?auto_2061121 ) ) ( not ( = ?auto_2061118 ?auto_2061122 ) ) ( not ( = ?auto_2061118 ?auto_2061123 ) ) ( not ( = ?auto_2061118 ?auto_2061127 ) ) ( not ( = ?auto_2061119 ?auto_2061120 ) ) ( not ( = ?auto_2061119 ?auto_2061121 ) ) ( not ( = ?auto_2061119 ?auto_2061122 ) ) ( not ( = ?auto_2061119 ?auto_2061123 ) ) ( not ( = ?auto_2061119 ?auto_2061127 ) ) ( not ( = ?auto_2061120 ?auto_2061121 ) ) ( not ( = ?auto_2061120 ?auto_2061122 ) ) ( not ( = ?auto_2061120 ?auto_2061123 ) ) ( not ( = ?auto_2061120 ?auto_2061127 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2061121 ?auto_2061122 ?auto_2061123 )
      ( MAKE-12CRATE-VERIFY ?auto_2061112 ?auto_2061113 ?auto_2061114 ?auto_2061111 ?auto_2061115 ?auto_2061117 ?auto_2061116 ?auto_2061118 ?auto_2061119 ?auto_2061120 ?auto_2061121 ?auto_2061122 ?auto_2061123 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2072716 - SURFACE
      ?auto_2072717 - SURFACE
      ?auto_2072718 - SURFACE
      ?auto_2072715 - SURFACE
      ?auto_2072719 - SURFACE
      ?auto_2072721 - SURFACE
      ?auto_2072720 - SURFACE
      ?auto_2072722 - SURFACE
      ?auto_2072723 - SURFACE
      ?auto_2072724 - SURFACE
      ?auto_2072725 - SURFACE
      ?auto_2072726 - SURFACE
      ?auto_2072727 - SURFACE
      ?auto_2072728 - SURFACE
    )
    :vars
    (
      ?auto_2072729 - HOIST
      ?auto_2072730 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2072729 ?auto_2072730 ) ( SURFACE-AT ?auto_2072727 ?auto_2072730 ) ( CLEAR ?auto_2072727 ) ( LIFTING ?auto_2072729 ?auto_2072728 ) ( IS-CRATE ?auto_2072728 ) ( not ( = ?auto_2072727 ?auto_2072728 ) ) ( ON ?auto_2072717 ?auto_2072716 ) ( ON ?auto_2072718 ?auto_2072717 ) ( ON ?auto_2072715 ?auto_2072718 ) ( ON ?auto_2072719 ?auto_2072715 ) ( ON ?auto_2072721 ?auto_2072719 ) ( ON ?auto_2072720 ?auto_2072721 ) ( ON ?auto_2072722 ?auto_2072720 ) ( ON ?auto_2072723 ?auto_2072722 ) ( ON ?auto_2072724 ?auto_2072723 ) ( ON ?auto_2072725 ?auto_2072724 ) ( ON ?auto_2072726 ?auto_2072725 ) ( ON ?auto_2072727 ?auto_2072726 ) ( not ( = ?auto_2072716 ?auto_2072717 ) ) ( not ( = ?auto_2072716 ?auto_2072718 ) ) ( not ( = ?auto_2072716 ?auto_2072715 ) ) ( not ( = ?auto_2072716 ?auto_2072719 ) ) ( not ( = ?auto_2072716 ?auto_2072721 ) ) ( not ( = ?auto_2072716 ?auto_2072720 ) ) ( not ( = ?auto_2072716 ?auto_2072722 ) ) ( not ( = ?auto_2072716 ?auto_2072723 ) ) ( not ( = ?auto_2072716 ?auto_2072724 ) ) ( not ( = ?auto_2072716 ?auto_2072725 ) ) ( not ( = ?auto_2072716 ?auto_2072726 ) ) ( not ( = ?auto_2072716 ?auto_2072727 ) ) ( not ( = ?auto_2072716 ?auto_2072728 ) ) ( not ( = ?auto_2072717 ?auto_2072718 ) ) ( not ( = ?auto_2072717 ?auto_2072715 ) ) ( not ( = ?auto_2072717 ?auto_2072719 ) ) ( not ( = ?auto_2072717 ?auto_2072721 ) ) ( not ( = ?auto_2072717 ?auto_2072720 ) ) ( not ( = ?auto_2072717 ?auto_2072722 ) ) ( not ( = ?auto_2072717 ?auto_2072723 ) ) ( not ( = ?auto_2072717 ?auto_2072724 ) ) ( not ( = ?auto_2072717 ?auto_2072725 ) ) ( not ( = ?auto_2072717 ?auto_2072726 ) ) ( not ( = ?auto_2072717 ?auto_2072727 ) ) ( not ( = ?auto_2072717 ?auto_2072728 ) ) ( not ( = ?auto_2072718 ?auto_2072715 ) ) ( not ( = ?auto_2072718 ?auto_2072719 ) ) ( not ( = ?auto_2072718 ?auto_2072721 ) ) ( not ( = ?auto_2072718 ?auto_2072720 ) ) ( not ( = ?auto_2072718 ?auto_2072722 ) ) ( not ( = ?auto_2072718 ?auto_2072723 ) ) ( not ( = ?auto_2072718 ?auto_2072724 ) ) ( not ( = ?auto_2072718 ?auto_2072725 ) ) ( not ( = ?auto_2072718 ?auto_2072726 ) ) ( not ( = ?auto_2072718 ?auto_2072727 ) ) ( not ( = ?auto_2072718 ?auto_2072728 ) ) ( not ( = ?auto_2072715 ?auto_2072719 ) ) ( not ( = ?auto_2072715 ?auto_2072721 ) ) ( not ( = ?auto_2072715 ?auto_2072720 ) ) ( not ( = ?auto_2072715 ?auto_2072722 ) ) ( not ( = ?auto_2072715 ?auto_2072723 ) ) ( not ( = ?auto_2072715 ?auto_2072724 ) ) ( not ( = ?auto_2072715 ?auto_2072725 ) ) ( not ( = ?auto_2072715 ?auto_2072726 ) ) ( not ( = ?auto_2072715 ?auto_2072727 ) ) ( not ( = ?auto_2072715 ?auto_2072728 ) ) ( not ( = ?auto_2072719 ?auto_2072721 ) ) ( not ( = ?auto_2072719 ?auto_2072720 ) ) ( not ( = ?auto_2072719 ?auto_2072722 ) ) ( not ( = ?auto_2072719 ?auto_2072723 ) ) ( not ( = ?auto_2072719 ?auto_2072724 ) ) ( not ( = ?auto_2072719 ?auto_2072725 ) ) ( not ( = ?auto_2072719 ?auto_2072726 ) ) ( not ( = ?auto_2072719 ?auto_2072727 ) ) ( not ( = ?auto_2072719 ?auto_2072728 ) ) ( not ( = ?auto_2072721 ?auto_2072720 ) ) ( not ( = ?auto_2072721 ?auto_2072722 ) ) ( not ( = ?auto_2072721 ?auto_2072723 ) ) ( not ( = ?auto_2072721 ?auto_2072724 ) ) ( not ( = ?auto_2072721 ?auto_2072725 ) ) ( not ( = ?auto_2072721 ?auto_2072726 ) ) ( not ( = ?auto_2072721 ?auto_2072727 ) ) ( not ( = ?auto_2072721 ?auto_2072728 ) ) ( not ( = ?auto_2072720 ?auto_2072722 ) ) ( not ( = ?auto_2072720 ?auto_2072723 ) ) ( not ( = ?auto_2072720 ?auto_2072724 ) ) ( not ( = ?auto_2072720 ?auto_2072725 ) ) ( not ( = ?auto_2072720 ?auto_2072726 ) ) ( not ( = ?auto_2072720 ?auto_2072727 ) ) ( not ( = ?auto_2072720 ?auto_2072728 ) ) ( not ( = ?auto_2072722 ?auto_2072723 ) ) ( not ( = ?auto_2072722 ?auto_2072724 ) ) ( not ( = ?auto_2072722 ?auto_2072725 ) ) ( not ( = ?auto_2072722 ?auto_2072726 ) ) ( not ( = ?auto_2072722 ?auto_2072727 ) ) ( not ( = ?auto_2072722 ?auto_2072728 ) ) ( not ( = ?auto_2072723 ?auto_2072724 ) ) ( not ( = ?auto_2072723 ?auto_2072725 ) ) ( not ( = ?auto_2072723 ?auto_2072726 ) ) ( not ( = ?auto_2072723 ?auto_2072727 ) ) ( not ( = ?auto_2072723 ?auto_2072728 ) ) ( not ( = ?auto_2072724 ?auto_2072725 ) ) ( not ( = ?auto_2072724 ?auto_2072726 ) ) ( not ( = ?auto_2072724 ?auto_2072727 ) ) ( not ( = ?auto_2072724 ?auto_2072728 ) ) ( not ( = ?auto_2072725 ?auto_2072726 ) ) ( not ( = ?auto_2072725 ?auto_2072727 ) ) ( not ( = ?auto_2072725 ?auto_2072728 ) ) ( not ( = ?auto_2072726 ?auto_2072727 ) ) ( not ( = ?auto_2072726 ?auto_2072728 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2072727 ?auto_2072728 )
      ( MAKE-13CRATE-VERIFY ?auto_2072716 ?auto_2072717 ?auto_2072718 ?auto_2072715 ?auto_2072719 ?auto_2072721 ?auto_2072720 ?auto_2072722 ?auto_2072723 ?auto_2072724 ?auto_2072725 ?auto_2072726 ?auto_2072727 ?auto_2072728 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2072858 - SURFACE
      ?auto_2072859 - SURFACE
      ?auto_2072860 - SURFACE
      ?auto_2072857 - SURFACE
      ?auto_2072861 - SURFACE
      ?auto_2072863 - SURFACE
      ?auto_2072862 - SURFACE
      ?auto_2072864 - SURFACE
      ?auto_2072865 - SURFACE
      ?auto_2072866 - SURFACE
      ?auto_2072867 - SURFACE
      ?auto_2072868 - SURFACE
      ?auto_2072869 - SURFACE
      ?auto_2072870 - SURFACE
    )
    :vars
    (
      ?auto_2072872 - HOIST
      ?auto_2072873 - PLACE
      ?auto_2072871 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2072872 ?auto_2072873 ) ( SURFACE-AT ?auto_2072869 ?auto_2072873 ) ( CLEAR ?auto_2072869 ) ( IS-CRATE ?auto_2072870 ) ( not ( = ?auto_2072869 ?auto_2072870 ) ) ( TRUCK-AT ?auto_2072871 ?auto_2072873 ) ( AVAILABLE ?auto_2072872 ) ( IN ?auto_2072870 ?auto_2072871 ) ( ON ?auto_2072869 ?auto_2072868 ) ( not ( = ?auto_2072868 ?auto_2072869 ) ) ( not ( = ?auto_2072868 ?auto_2072870 ) ) ( ON ?auto_2072859 ?auto_2072858 ) ( ON ?auto_2072860 ?auto_2072859 ) ( ON ?auto_2072857 ?auto_2072860 ) ( ON ?auto_2072861 ?auto_2072857 ) ( ON ?auto_2072863 ?auto_2072861 ) ( ON ?auto_2072862 ?auto_2072863 ) ( ON ?auto_2072864 ?auto_2072862 ) ( ON ?auto_2072865 ?auto_2072864 ) ( ON ?auto_2072866 ?auto_2072865 ) ( ON ?auto_2072867 ?auto_2072866 ) ( ON ?auto_2072868 ?auto_2072867 ) ( not ( = ?auto_2072858 ?auto_2072859 ) ) ( not ( = ?auto_2072858 ?auto_2072860 ) ) ( not ( = ?auto_2072858 ?auto_2072857 ) ) ( not ( = ?auto_2072858 ?auto_2072861 ) ) ( not ( = ?auto_2072858 ?auto_2072863 ) ) ( not ( = ?auto_2072858 ?auto_2072862 ) ) ( not ( = ?auto_2072858 ?auto_2072864 ) ) ( not ( = ?auto_2072858 ?auto_2072865 ) ) ( not ( = ?auto_2072858 ?auto_2072866 ) ) ( not ( = ?auto_2072858 ?auto_2072867 ) ) ( not ( = ?auto_2072858 ?auto_2072868 ) ) ( not ( = ?auto_2072858 ?auto_2072869 ) ) ( not ( = ?auto_2072858 ?auto_2072870 ) ) ( not ( = ?auto_2072859 ?auto_2072860 ) ) ( not ( = ?auto_2072859 ?auto_2072857 ) ) ( not ( = ?auto_2072859 ?auto_2072861 ) ) ( not ( = ?auto_2072859 ?auto_2072863 ) ) ( not ( = ?auto_2072859 ?auto_2072862 ) ) ( not ( = ?auto_2072859 ?auto_2072864 ) ) ( not ( = ?auto_2072859 ?auto_2072865 ) ) ( not ( = ?auto_2072859 ?auto_2072866 ) ) ( not ( = ?auto_2072859 ?auto_2072867 ) ) ( not ( = ?auto_2072859 ?auto_2072868 ) ) ( not ( = ?auto_2072859 ?auto_2072869 ) ) ( not ( = ?auto_2072859 ?auto_2072870 ) ) ( not ( = ?auto_2072860 ?auto_2072857 ) ) ( not ( = ?auto_2072860 ?auto_2072861 ) ) ( not ( = ?auto_2072860 ?auto_2072863 ) ) ( not ( = ?auto_2072860 ?auto_2072862 ) ) ( not ( = ?auto_2072860 ?auto_2072864 ) ) ( not ( = ?auto_2072860 ?auto_2072865 ) ) ( not ( = ?auto_2072860 ?auto_2072866 ) ) ( not ( = ?auto_2072860 ?auto_2072867 ) ) ( not ( = ?auto_2072860 ?auto_2072868 ) ) ( not ( = ?auto_2072860 ?auto_2072869 ) ) ( not ( = ?auto_2072860 ?auto_2072870 ) ) ( not ( = ?auto_2072857 ?auto_2072861 ) ) ( not ( = ?auto_2072857 ?auto_2072863 ) ) ( not ( = ?auto_2072857 ?auto_2072862 ) ) ( not ( = ?auto_2072857 ?auto_2072864 ) ) ( not ( = ?auto_2072857 ?auto_2072865 ) ) ( not ( = ?auto_2072857 ?auto_2072866 ) ) ( not ( = ?auto_2072857 ?auto_2072867 ) ) ( not ( = ?auto_2072857 ?auto_2072868 ) ) ( not ( = ?auto_2072857 ?auto_2072869 ) ) ( not ( = ?auto_2072857 ?auto_2072870 ) ) ( not ( = ?auto_2072861 ?auto_2072863 ) ) ( not ( = ?auto_2072861 ?auto_2072862 ) ) ( not ( = ?auto_2072861 ?auto_2072864 ) ) ( not ( = ?auto_2072861 ?auto_2072865 ) ) ( not ( = ?auto_2072861 ?auto_2072866 ) ) ( not ( = ?auto_2072861 ?auto_2072867 ) ) ( not ( = ?auto_2072861 ?auto_2072868 ) ) ( not ( = ?auto_2072861 ?auto_2072869 ) ) ( not ( = ?auto_2072861 ?auto_2072870 ) ) ( not ( = ?auto_2072863 ?auto_2072862 ) ) ( not ( = ?auto_2072863 ?auto_2072864 ) ) ( not ( = ?auto_2072863 ?auto_2072865 ) ) ( not ( = ?auto_2072863 ?auto_2072866 ) ) ( not ( = ?auto_2072863 ?auto_2072867 ) ) ( not ( = ?auto_2072863 ?auto_2072868 ) ) ( not ( = ?auto_2072863 ?auto_2072869 ) ) ( not ( = ?auto_2072863 ?auto_2072870 ) ) ( not ( = ?auto_2072862 ?auto_2072864 ) ) ( not ( = ?auto_2072862 ?auto_2072865 ) ) ( not ( = ?auto_2072862 ?auto_2072866 ) ) ( not ( = ?auto_2072862 ?auto_2072867 ) ) ( not ( = ?auto_2072862 ?auto_2072868 ) ) ( not ( = ?auto_2072862 ?auto_2072869 ) ) ( not ( = ?auto_2072862 ?auto_2072870 ) ) ( not ( = ?auto_2072864 ?auto_2072865 ) ) ( not ( = ?auto_2072864 ?auto_2072866 ) ) ( not ( = ?auto_2072864 ?auto_2072867 ) ) ( not ( = ?auto_2072864 ?auto_2072868 ) ) ( not ( = ?auto_2072864 ?auto_2072869 ) ) ( not ( = ?auto_2072864 ?auto_2072870 ) ) ( not ( = ?auto_2072865 ?auto_2072866 ) ) ( not ( = ?auto_2072865 ?auto_2072867 ) ) ( not ( = ?auto_2072865 ?auto_2072868 ) ) ( not ( = ?auto_2072865 ?auto_2072869 ) ) ( not ( = ?auto_2072865 ?auto_2072870 ) ) ( not ( = ?auto_2072866 ?auto_2072867 ) ) ( not ( = ?auto_2072866 ?auto_2072868 ) ) ( not ( = ?auto_2072866 ?auto_2072869 ) ) ( not ( = ?auto_2072866 ?auto_2072870 ) ) ( not ( = ?auto_2072867 ?auto_2072868 ) ) ( not ( = ?auto_2072867 ?auto_2072869 ) ) ( not ( = ?auto_2072867 ?auto_2072870 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2072868 ?auto_2072869 ?auto_2072870 )
      ( MAKE-13CRATE-VERIFY ?auto_2072858 ?auto_2072859 ?auto_2072860 ?auto_2072857 ?auto_2072861 ?auto_2072863 ?auto_2072862 ?auto_2072864 ?auto_2072865 ?auto_2072866 ?auto_2072867 ?auto_2072868 ?auto_2072869 ?auto_2072870 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2073014 - SURFACE
      ?auto_2073015 - SURFACE
      ?auto_2073016 - SURFACE
      ?auto_2073013 - SURFACE
      ?auto_2073017 - SURFACE
      ?auto_2073019 - SURFACE
      ?auto_2073018 - SURFACE
      ?auto_2073020 - SURFACE
      ?auto_2073021 - SURFACE
      ?auto_2073022 - SURFACE
      ?auto_2073023 - SURFACE
      ?auto_2073024 - SURFACE
      ?auto_2073025 - SURFACE
      ?auto_2073026 - SURFACE
    )
    :vars
    (
      ?auto_2073029 - HOIST
      ?auto_2073028 - PLACE
      ?auto_2073027 - TRUCK
      ?auto_2073030 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073029 ?auto_2073028 ) ( SURFACE-AT ?auto_2073025 ?auto_2073028 ) ( CLEAR ?auto_2073025 ) ( IS-CRATE ?auto_2073026 ) ( not ( = ?auto_2073025 ?auto_2073026 ) ) ( AVAILABLE ?auto_2073029 ) ( IN ?auto_2073026 ?auto_2073027 ) ( ON ?auto_2073025 ?auto_2073024 ) ( not ( = ?auto_2073024 ?auto_2073025 ) ) ( not ( = ?auto_2073024 ?auto_2073026 ) ) ( TRUCK-AT ?auto_2073027 ?auto_2073030 ) ( not ( = ?auto_2073030 ?auto_2073028 ) ) ( ON ?auto_2073015 ?auto_2073014 ) ( ON ?auto_2073016 ?auto_2073015 ) ( ON ?auto_2073013 ?auto_2073016 ) ( ON ?auto_2073017 ?auto_2073013 ) ( ON ?auto_2073019 ?auto_2073017 ) ( ON ?auto_2073018 ?auto_2073019 ) ( ON ?auto_2073020 ?auto_2073018 ) ( ON ?auto_2073021 ?auto_2073020 ) ( ON ?auto_2073022 ?auto_2073021 ) ( ON ?auto_2073023 ?auto_2073022 ) ( ON ?auto_2073024 ?auto_2073023 ) ( not ( = ?auto_2073014 ?auto_2073015 ) ) ( not ( = ?auto_2073014 ?auto_2073016 ) ) ( not ( = ?auto_2073014 ?auto_2073013 ) ) ( not ( = ?auto_2073014 ?auto_2073017 ) ) ( not ( = ?auto_2073014 ?auto_2073019 ) ) ( not ( = ?auto_2073014 ?auto_2073018 ) ) ( not ( = ?auto_2073014 ?auto_2073020 ) ) ( not ( = ?auto_2073014 ?auto_2073021 ) ) ( not ( = ?auto_2073014 ?auto_2073022 ) ) ( not ( = ?auto_2073014 ?auto_2073023 ) ) ( not ( = ?auto_2073014 ?auto_2073024 ) ) ( not ( = ?auto_2073014 ?auto_2073025 ) ) ( not ( = ?auto_2073014 ?auto_2073026 ) ) ( not ( = ?auto_2073015 ?auto_2073016 ) ) ( not ( = ?auto_2073015 ?auto_2073013 ) ) ( not ( = ?auto_2073015 ?auto_2073017 ) ) ( not ( = ?auto_2073015 ?auto_2073019 ) ) ( not ( = ?auto_2073015 ?auto_2073018 ) ) ( not ( = ?auto_2073015 ?auto_2073020 ) ) ( not ( = ?auto_2073015 ?auto_2073021 ) ) ( not ( = ?auto_2073015 ?auto_2073022 ) ) ( not ( = ?auto_2073015 ?auto_2073023 ) ) ( not ( = ?auto_2073015 ?auto_2073024 ) ) ( not ( = ?auto_2073015 ?auto_2073025 ) ) ( not ( = ?auto_2073015 ?auto_2073026 ) ) ( not ( = ?auto_2073016 ?auto_2073013 ) ) ( not ( = ?auto_2073016 ?auto_2073017 ) ) ( not ( = ?auto_2073016 ?auto_2073019 ) ) ( not ( = ?auto_2073016 ?auto_2073018 ) ) ( not ( = ?auto_2073016 ?auto_2073020 ) ) ( not ( = ?auto_2073016 ?auto_2073021 ) ) ( not ( = ?auto_2073016 ?auto_2073022 ) ) ( not ( = ?auto_2073016 ?auto_2073023 ) ) ( not ( = ?auto_2073016 ?auto_2073024 ) ) ( not ( = ?auto_2073016 ?auto_2073025 ) ) ( not ( = ?auto_2073016 ?auto_2073026 ) ) ( not ( = ?auto_2073013 ?auto_2073017 ) ) ( not ( = ?auto_2073013 ?auto_2073019 ) ) ( not ( = ?auto_2073013 ?auto_2073018 ) ) ( not ( = ?auto_2073013 ?auto_2073020 ) ) ( not ( = ?auto_2073013 ?auto_2073021 ) ) ( not ( = ?auto_2073013 ?auto_2073022 ) ) ( not ( = ?auto_2073013 ?auto_2073023 ) ) ( not ( = ?auto_2073013 ?auto_2073024 ) ) ( not ( = ?auto_2073013 ?auto_2073025 ) ) ( not ( = ?auto_2073013 ?auto_2073026 ) ) ( not ( = ?auto_2073017 ?auto_2073019 ) ) ( not ( = ?auto_2073017 ?auto_2073018 ) ) ( not ( = ?auto_2073017 ?auto_2073020 ) ) ( not ( = ?auto_2073017 ?auto_2073021 ) ) ( not ( = ?auto_2073017 ?auto_2073022 ) ) ( not ( = ?auto_2073017 ?auto_2073023 ) ) ( not ( = ?auto_2073017 ?auto_2073024 ) ) ( not ( = ?auto_2073017 ?auto_2073025 ) ) ( not ( = ?auto_2073017 ?auto_2073026 ) ) ( not ( = ?auto_2073019 ?auto_2073018 ) ) ( not ( = ?auto_2073019 ?auto_2073020 ) ) ( not ( = ?auto_2073019 ?auto_2073021 ) ) ( not ( = ?auto_2073019 ?auto_2073022 ) ) ( not ( = ?auto_2073019 ?auto_2073023 ) ) ( not ( = ?auto_2073019 ?auto_2073024 ) ) ( not ( = ?auto_2073019 ?auto_2073025 ) ) ( not ( = ?auto_2073019 ?auto_2073026 ) ) ( not ( = ?auto_2073018 ?auto_2073020 ) ) ( not ( = ?auto_2073018 ?auto_2073021 ) ) ( not ( = ?auto_2073018 ?auto_2073022 ) ) ( not ( = ?auto_2073018 ?auto_2073023 ) ) ( not ( = ?auto_2073018 ?auto_2073024 ) ) ( not ( = ?auto_2073018 ?auto_2073025 ) ) ( not ( = ?auto_2073018 ?auto_2073026 ) ) ( not ( = ?auto_2073020 ?auto_2073021 ) ) ( not ( = ?auto_2073020 ?auto_2073022 ) ) ( not ( = ?auto_2073020 ?auto_2073023 ) ) ( not ( = ?auto_2073020 ?auto_2073024 ) ) ( not ( = ?auto_2073020 ?auto_2073025 ) ) ( not ( = ?auto_2073020 ?auto_2073026 ) ) ( not ( = ?auto_2073021 ?auto_2073022 ) ) ( not ( = ?auto_2073021 ?auto_2073023 ) ) ( not ( = ?auto_2073021 ?auto_2073024 ) ) ( not ( = ?auto_2073021 ?auto_2073025 ) ) ( not ( = ?auto_2073021 ?auto_2073026 ) ) ( not ( = ?auto_2073022 ?auto_2073023 ) ) ( not ( = ?auto_2073022 ?auto_2073024 ) ) ( not ( = ?auto_2073022 ?auto_2073025 ) ) ( not ( = ?auto_2073022 ?auto_2073026 ) ) ( not ( = ?auto_2073023 ?auto_2073024 ) ) ( not ( = ?auto_2073023 ?auto_2073025 ) ) ( not ( = ?auto_2073023 ?auto_2073026 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073024 ?auto_2073025 ?auto_2073026 )
      ( MAKE-13CRATE-VERIFY ?auto_2073014 ?auto_2073015 ?auto_2073016 ?auto_2073013 ?auto_2073017 ?auto_2073019 ?auto_2073018 ?auto_2073020 ?auto_2073021 ?auto_2073022 ?auto_2073023 ?auto_2073024 ?auto_2073025 ?auto_2073026 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2073183 - SURFACE
      ?auto_2073184 - SURFACE
      ?auto_2073185 - SURFACE
      ?auto_2073182 - SURFACE
      ?auto_2073186 - SURFACE
      ?auto_2073188 - SURFACE
      ?auto_2073187 - SURFACE
      ?auto_2073189 - SURFACE
      ?auto_2073190 - SURFACE
      ?auto_2073191 - SURFACE
      ?auto_2073192 - SURFACE
      ?auto_2073193 - SURFACE
      ?auto_2073194 - SURFACE
      ?auto_2073195 - SURFACE
    )
    :vars
    (
      ?auto_2073197 - HOIST
      ?auto_2073199 - PLACE
      ?auto_2073198 - TRUCK
      ?auto_2073200 - PLACE
      ?auto_2073196 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073197 ?auto_2073199 ) ( SURFACE-AT ?auto_2073194 ?auto_2073199 ) ( CLEAR ?auto_2073194 ) ( IS-CRATE ?auto_2073195 ) ( not ( = ?auto_2073194 ?auto_2073195 ) ) ( AVAILABLE ?auto_2073197 ) ( ON ?auto_2073194 ?auto_2073193 ) ( not ( = ?auto_2073193 ?auto_2073194 ) ) ( not ( = ?auto_2073193 ?auto_2073195 ) ) ( TRUCK-AT ?auto_2073198 ?auto_2073200 ) ( not ( = ?auto_2073200 ?auto_2073199 ) ) ( HOIST-AT ?auto_2073196 ?auto_2073200 ) ( LIFTING ?auto_2073196 ?auto_2073195 ) ( not ( = ?auto_2073197 ?auto_2073196 ) ) ( ON ?auto_2073184 ?auto_2073183 ) ( ON ?auto_2073185 ?auto_2073184 ) ( ON ?auto_2073182 ?auto_2073185 ) ( ON ?auto_2073186 ?auto_2073182 ) ( ON ?auto_2073188 ?auto_2073186 ) ( ON ?auto_2073187 ?auto_2073188 ) ( ON ?auto_2073189 ?auto_2073187 ) ( ON ?auto_2073190 ?auto_2073189 ) ( ON ?auto_2073191 ?auto_2073190 ) ( ON ?auto_2073192 ?auto_2073191 ) ( ON ?auto_2073193 ?auto_2073192 ) ( not ( = ?auto_2073183 ?auto_2073184 ) ) ( not ( = ?auto_2073183 ?auto_2073185 ) ) ( not ( = ?auto_2073183 ?auto_2073182 ) ) ( not ( = ?auto_2073183 ?auto_2073186 ) ) ( not ( = ?auto_2073183 ?auto_2073188 ) ) ( not ( = ?auto_2073183 ?auto_2073187 ) ) ( not ( = ?auto_2073183 ?auto_2073189 ) ) ( not ( = ?auto_2073183 ?auto_2073190 ) ) ( not ( = ?auto_2073183 ?auto_2073191 ) ) ( not ( = ?auto_2073183 ?auto_2073192 ) ) ( not ( = ?auto_2073183 ?auto_2073193 ) ) ( not ( = ?auto_2073183 ?auto_2073194 ) ) ( not ( = ?auto_2073183 ?auto_2073195 ) ) ( not ( = ?auto_2073184 ?auto_2073185 ) ) ( not ( = ?auto_2073184 ?auto_2073182 ) ) ( not ( = ?auto_2073184 ?auto_2073186 ) ) ( not ( = ?auto_2073184 ?auto_2073188 ) ) ( not ( = ?auto_2073184 ?auto_2073187 ) ) ( not ( = ?auto_2073184 ?auto_2073189 ) ) ( not ( = ?auto_2073184 ?auto_2073190 ) ) ( not ( = ?auto_2073184 ?auto_2073191 ) ) ( not ( = ?auto_2073184 ?auto_2073192 ) ) ( not ( = ?auto_2073184 ?auto_2073193 ) ) ( not ( = ?auto_2073184 ?auto_2073194 ) ) ( not ( = ?auto_2073184 ?auto_2073195 ) ) ( not ( = ?auto_2073185 ?auto_2073182 ) ) ( not ( = ?auto_2073185 ?auto_2073186 ) ) ( not ( = ?auto_2073185 ?auto_2073188 ) ) ( not ( = ?auto_2073185 ?auto_2073187 ) ) ( not ( = ?auto_2073185 ?auto_2073189 ) ) ( not ( = ?auto_2073185 ?auto_2073190 ) ) ( not ( = ?auto_2073185 ?auto_2073191 ) ) ( not ( = ?auto_2073185 ?auto_2073192 ) ) ( not ( = ?auto_2073185 ?auto_2073193 ) ) ( not ( = ?auto_2073185 ?auto_2073194 ) ) ( not ( = ?auto_2073185 ?auto_2073195 ) ) ( not ( = ?auto_2073182 ?auto_2073186 ) ) ( not ( = ?auto_2073182 ?auto_2073188 ) ) ( not ( = ?auto_2073182 ?auto_2073187 ) ) ( not ( = ?auto_2073182 ?auto_2073189 ) ) ( not ( = ?auto_2073182 ?auto_2073190 ) ) ( not ( = ?auto_2073182 ?auto_2073191 ) ) ( not ( = ?auto_2073182 ?auto_2073192 ) ) ( not ( = ?auto_2073182 ?auto_2073193 ) ) ( not ( = ?auto_2073182 ?auto_2073194 ) ) ( not ( = ?auto_2073182 ?auto_2073195 ) ) ( not ( = ?auto_2073186 ?auto_2073188 ) ) ( not ( = ?auto_2073186 ?auto_2073187 ) ) ( not ( = ?auto_2073186 ?auto_2073189 ) ) ( not ( = ?auto_2073186 ?auto_2073190 ) ) ( not ( = ?auto_2073186 ?auto_2073191 ) ) ( not ( = ?auto_2073186 ?auto_2073192 ) ) ( not ( = ?auto_2073186 ?auto_2073193 ) ) ( not ( = ?auto_2073186 ?auto_2073194 ) ) ( not ( = ?auto_2073186 ?auto_2073195 ) ) ( not ( = ?auto_2073188 ?auto_2073187 ) ) ( not ( = ?auto_2073188 ?auto_2073189 ) ) ( not ( = ?auto_2073188 ?auto_2073190 ) ) ( not ( = ?auto_2073188 ?auto_2073191 ) ) ( not ( = ?auto_2073188 ?auto_2073192 ) ) ( not ( = ?auto_2073188 ?auto_2073193 ) ) ( not ( = ?auto_2073188 ?auto_2073194 ) ) ( not ( = ?auto_2073188 ?auto_2073195 ) ) ( not ( = ?auto_2073187 ?auto_2073189 ) ) ( not ( = ?auto_2073187 ?auto_2073190 ) ) ( not ( = ?auto_2073187 ?auto_2073191 ) ) ( not ( = ?auto_2073187 ?auto_2073192 ) ) ( not ( = ?auto_2073187 ?auto_2073193 ) ) ( not ( = ?auto_2073187 ?auto_2073194 ) ) ( not ( = ?auto_2073187 ?auto_2073195 ) ) ( not ( = ?auto_2073189 ?auto_2073190 ) ) ( not ( = ?auto_2073189 ?auto_2073191 ) ) ( not ( = ?auto_2073189 ?auto_2073192 ) ) ( not ( = ?auto_2073189 ?auto_2073193 ) ) ( not ( = ?auto_2073189 ?auto_2073194 ) ) ( not ( = ?auto_2073189 ?auto_2073195 ) ) ( not ( = ?auto_2073190 ?auto_2073191 ) ) ( not ( = ?auto_2073190 ?auto_2073192 ) ) ( not ( = ?auto_2073190 ?auto_2073193 ) ) ( not ( = ?auto_2073190 ?auto_2073194 ) ) ( not ( = ?auto_2073190 ?auto_2073195 ) ) ( not ( = ?auto_2073191 ?auto_2073192 ) ) ( not ( = ?auto_2073191 ?auto_2073193 ) ) ( not ( = ?auto_2073191 ?auto_2073194 ) ) ( not ( = ?auto_2073191 ?auto_2073195 ) ) ( not ( = ?auto_2073192 ?auto_2073193 ) ) ( not ( = ?auto_2073192 ?auto_2073194 ) ) ( not ( = ?auto_2073192 ?auto_2073195 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073193 ?auto_2073194 ?auto_2073195 )
      ( MAKE-13CRATE-VERIFY ?auto_2073183 ?auto_2073184 ?auto_2073185 ?auto_2073182 ?auto_2073186 ?auto_2073188 ?auto_2073187 ?auto_2073189 ?auto_2073190 ?auto_2073191 ?auto_2073192 ?auto_2073193 ?auto_2073194 ?auto_2073195 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2073365 - SURFACE
      ?auto_2073366 - SURFACE
      ?auto_2073367 - SURFACE
      ?auto_2073364 - SURFACE
      ?auto_2073368 - SURFACE
      ?auto_2073370 - SURFACE
      ?auto_2073369 - SURFACE
      ?auto_2073371 - SURFACE
      ?auto_2073372 - SURFACE
      ?auto_2073373 - SURFACE
      ?auto_2073374 - SURFACE
      ?auto_2073375 - SURFACE
      ?auto_2073376 - SURFACE
      ?auto_2073377 - SURFACE
    )
    :vars
    (
      ?auto_2073379 - HOIST
      ?auto_2073382 - PLACE
      ?auto_2073381 - TRUCK
      ?auto_2073380 - PLACE
      ?auto_2073378 - HOIST
      ?auto_2073383 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073379 ?auto_2073382 ) ( SURFACE-AT ?auto_2073376 ?auto_2073382 ) ( CLEAR ?auto_2073376 ) ( IS-CRATE ?auto_2073377 ) ( not ( = ?auto_2073376 ?auto_2073377 ) ) ( AVAILABLE ?auto_2073379 ) ( ON ?auto_2073376 ?auto_2073375 ) ( not ( = ?auto_2073375 ?auto_2073376 ) ) ( not ( = ?auto_2073375 ?auto_2073377 ) ) ( TRUCK-AT ?auto_2073381 ?auto_2073380 ) ( not ( = ?auto_2073380 ?auto_2073382 ) ) ( HOIST-AT ?auto_2073378 ?auto_2073380 ) ( not ( = ?auto_2073379 ?auto_2073378 ) ) ( AVAILABLE ?auto_2073378 ) ( SURFACE-AT ?auto_2073377 ?auto_2073380 ) ( ON ?auto_2073377 ?auto_2073383 ) ( CLEAR ?auto_2073377 ) ( not ( = ?auto_2073376 ?auto_2073383 ) ) ( not ( = ?auto_2073377 ?auto_2073383 ) ) ( not ( = ?auto_2073375 ?auto_2073383 ) ) ( ON ?auto_2073366 ?auto_2073365 ) ( ON ?auto_2073367 ?auto_2073366 ) ( ON ?auto_2073364 ?auto_2073367 ) ( ON ?auto_2073368 ?auto_2073364 ) ( ON ?auto_2073370 ?auto_2073368 ) ( ON ?auto_2073369 ?auto_2073370 ) ( ON ?auto_2073371 ?auto_2073369 ) ( ON ?auto_2073372 ?auto_2073371 ) ( ON ?auto_2073373 ?auto_2073372 ) ( ON ?auto_2073374 ?auto_2073373 ) ( ON ?auto_2073375 ?auto_2073374 ) ( not ( = ?auto_2073365 ?auto_2073366 ) ) ( not ( = ?auto_2073365 ?auto_2073367 ) ) ( not ( = ?auto_2073365 ?auto_2073364 ) ) ( not ( = ?auto_2073365 ?auto_2073368 ) ) ( not ( = ?auto_2073365 ?auto_2073370 ) ) ( not ( = ?auto_2073365 ?auto_2073369 ) ) ( not ( = ?auto_2073365 ?auto_2073371 ) ) ( not ( = ?auto_2073365 ?auto_2073372 ) ) ( not ( = ?auto_2073365 ?auto_2073373 ) ) ( not ( = ?auto_2073365 ?auto_2073374 ) ) ( not ( = ?auto_2073365 ?auto_2073375 ) ) ( not ( = ?auto_2073365 ?auto_2073376 ) ) ( not ( = ?auto_2073365 ?auto_2073377 ) ) ( not ( = ?auto_2073365 ?auto_2073383 ) ) ( not ( = ?auto_2073366 ?auto_2073367 ) ) ( not ( = ?auto_2073366 ?auto_2073364 ) ) ( not ( = ?auto_2073366 ?auto_2073368 ) ) ( not ( = ?auto_2073366 ?auto_2073370 ) ) ( not ( = ?auto_2073366 ?auto_2073369 ) ) ( not ( = ?auto_2073366 ?auto_2073371 ) ) ( not ( = ?auto_2073366 ?auto_2073372 ) ) ( not ( = ?auto_2073366 ?auto_2073373 ) ) ( not ( = ?auto_2073366 ?auto_2073374 ) ) ( not ( = ?auto_2073366 ?auto_2073375 ) ) ( not ( = ?auto_2073366 ?auto_2073376 ) ) ( not ( = ?auto_2073366 ?auto_2073377 ) ) ( not ( = ?auto_2073366 ?auto_2073383 ) ) ( not ( = ?auto_2073367 ?auto_2073364 ) ) ( not ( = ?auto_2073367 ?auto_2073368 ) ) ( not ( = ?auto_2073367 ?auto_2073370 ) ) ( not ( = ?auto_2073367 ?auto_2073369 ) ) ( not ( = ?auto_2073367 ?auto_2073371 ) ) ( not ( = ?auto_2073367 ?auto_2073372 ) ) ( not ( = ?auto_2073367 ?auto_2073373 ) ) ( not ( = ?auto_2073367 ?auto_2073374 ) ) ( not ( = ?auto_2073367 ?auto_2073375 ) ) ( not ( = ?auto_2073367 ?auto_2073376 ) ) ( not ( = ?auto_2073367 ?auto_2073377 ) ) ( not ( = ?auto_2073367 ?auto_2073383 ) ) ( not ( = ?auto_2073364 ?auto_2073368 ) ) ( not ( = ?auto_2073364 ?auto_2073370 ) ) ( not ( = ?auto_2073364 ?auto_2073369 ) ) ( not ( = ?auto_2073364 ?auto_2073371 ) ) ( not ( = ?auto_2073364 ?auto_2073372 ) ) ( not ( = ?auto_2073364 ?auto_2073373 ) ) ( not ( = ?auto_2073364 ?auto_2073374 ) ) ( not ( = ?auto_2073364 ?auto_2073375 ) ) ( not ( = ?auto_2073364 ?auto_2073376 ) ) ( not ( = ?auto_2073364 ?auto_2073377 ) ) ( not ( = ?auto_2073364 ?auto_2073383 ) ) ( not ( = ?auto_2073368 ?auto_2073370 ) ) ( not ( = ?auto_2073368 ?auto_2073369 ) ) ( not ( = ?auto_2073368 ?auto_2073371 ) ) ( not ( = ?auto_2073368 ?auto_2073372 ) ) ( not ( = ?auto_2073368 ?auto_2073373 ) ) ( not ( = ?auto_2073368 ?auto_2073374 ) ) ( not ( = ?auto_2073368 ?auto_2073375 ) ) ( not ( = ?auto_2073368 ?auto_2073376 ) ) ( not ( = ?auto_2073368 ?auto_2073377 ) ) ( not ( = ?auto_2073368 ?auto_2073383 ) ) ( not ( = ?auto_2073370 ?auto_2073369 ) ) ( not ( = ?auto_2073370 ?auto_2073371 ) ) ( not ( = ?auto_2073370 ?auto_2073372 ) ) ( not ( = ?auto_2073370 ?auto_2073373 ) ) ( not ( = ?auto_2073370 ?auto_2073374 ) ) ( not ( = ?auto_2073370 ?auto_2073375 ) ) ( not ( = ?auto_2073370 ?auto_2073376 ) ) ( not ( = ?auto_2073370 ?auto_2073377 ) ) ( not ( = ?auto_2073370 ?auto_2073383 ) ) ( not ( = ?auto_2073369 ?auto_2073371 ) ) ( not ( = ?auto_2073369 ?auto_2073372 ) ) ( not ( = ?auto_2073369 ?auto_2073373 ) ) ( not ( = ?auto_2073369 ?auto_2073374 ) ) ( not ( = ?auto_2073369 ?auto_2073375 ) ) ( not ( = ?auto_2073369 ?auto_2073376 ) ) ( not ( = ?auto_2073369 ?auto_2073377 ) ) ( not ( = ?auto_2073369 ?auto_2073383 ) ) ( not ( = ?auto_2073371 ?auto_2073372 ) ) ( not ( = ?auto_2073371 ?auto_2073373 ) ) ( not ( = ?auto_2073371 ?auto_2073374 ) ) ( not ( = ?auto_2073371 ?auto_2073375 ) ) ( not ( = ?auto_2073371 ?auto_2073376 ) ) ( not ( = ?auto_2073371 ?auto_2073377 ) ) ( not ( = ?auto_2073371 ?auto_2073383 ) ) ( not ( = ?auto_2073372 ?auto_2073373 ) ) ( not ( = ?auto_2073372 ?auto_2073374 ) ) ( not ( = ?auto_2073372 ?auto_2073375 ) ) ( not ( = ?auto_2073372 ?auto_2073376 ) ) ( not ( = ?auto_2073372 ?auto_2073377 ) ) ( not ( = ?auto_2073372 ?auto_2073383 ) ) ( not ( = ?auto_2073373 ?auto_2073374 ) ) ( not ( = ?auto_2073373 ?auto_2073375 ) ) ( not ( = ?auto_2073373 ?auto_2073376 ) ) ( not ( = ?auto_2073373 ?auto_2073377 ) ) ( not ( = ?auto_2073373 ?auto_2073383 ) ) ( not ( = ?auto_2073374 ?auto_2073375 ) ) ( not ( = ?auto_2073374 ?auto_2073376 ) ) ( not ( = ?auto_2073374 ?auto_2073377 ) ) ( not ( = ?auto_2073374 ?auto_2073383 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073375 ?auto_2073376 ?auto_2073377 )
      ( MAKE-13CRATE-VERIFY ?auto_2073365 ?auto_2073366 ?auto_2073367 ?auto_2073364 ?auto_2073368 ?auto_2073370 ?auto_2073369 ?auto_2073371 ?auto_2073372 ?auto_2073373 ?auto_2073374 ?auto_2073375 ?auto_2073376 ?auto_2073377 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2073548 - SURFACE
      ?auto_2073549 - SURFACE
      ?auto_2073550 - SURFACE
      ?auto_2073547 - SURFACE
      ?auto_2073551 - SURFACE
      ?auto_2073553 - SURFACE
      ?auto_2073552 - SURFACE
      ?auto_2073554 - SURFACE
      ?auto_2073555 - SURFACE
      ?auto_2073556 - SURFACE
      ?auto_2073557 - SURFACE
      ?auto_2073558 - SURFACE
      ?auto_2073559 - SURFACE
      ?auto_2073560 - SURFACE
    )
    :vars
    (
      ?auto_2073564 - HOIST
      ?auto_2073562 - PLACE
      ?auto_2073563 - PLACE
      ?auto_2073561 - HOIST
      ?auto_2073566 - SURFACE
      ?auto_2073565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073564 ?auto_2073562 ) ( SURFACE-AT ?auto_2073559 ?auto_2073562 ) ( CLEAR ?auto_2073559 ) ( IS-CRATE ?auto_2073560 ) ( not ( = ?auto_2073559 ?auto_2073560 ) ) ( AVAILABLE ?auto_2073564 ) ( ON ?auto_2073559 ?auto_2073558 ) ( not ( = ?auto_2073558 ?auto_2073559 ) ) ( not ( = ?auto_2073558 ?auto_2073560 ) ) ( not ( = ?auto_2073563 ?auto_2073562 ) ) ( HOIST-AT ?auto_2073561 ?auto_2073563 ) ( not ( = ?auto_2073564 ?auto_2073561 ) ) ( AVAILABLE ?auto_2073561 ) ( SURFACE-AT ?auto_2073560 ?auto_2073563 ) ( ON ?auto_2073560 ?auto_2073566 ) ( CLEAR ?auto_2073560 ) ( not ( = ?auto_2073559 ?auto_2073566 ) ) ( not ( = ?auto_2073560 ?auto_2073566 ) ) ( not ( = ?auto_2073558 ?auto_2073566 ) ) ( TRUCK-AT ?auto_2073565 ?auto_2073562 ) ( ON ?auto_2073549 ?auto_2073548 ) ( ON ?auto_2073550 ?auto_2073549 ) ( ON ?auto_2073547 ?auto_2073550 ) ( ON ?auto_2073551 ?auto_2073547 ) ( ON ?auto_2073553 ?auto_2073551 ) ( ON ?auto_2073552 ?auto_2073553 ) ( ON ?auto_2073554 ?auto_2073552 ) ( ON ?auto_2073555 ?auto_2073554 ) ( ON ?auto_2073556 ?auto_2073555 ) ( ON ?auto_2073557 ?auto_2073556 ) ( ON ?auto_2073558 ?auto_2073557 ) ( not ( = ?auto_2073548 ?auto_2073549 ) ) ( not ( = ?auto_2073548 ?auto_2073550 ) ) ( not ( = ?auto_2073548 ?auto_2073547 ) ) ( not ( = ?auto_2073548 ?auto_2073551 ) ) ( not ( = ?auto_2073548 ?auto_2073553 ) ) ( not ( = ?auto_2073548 ?auto_2073552 ) ) ( not ( = ?auto_2073548 ?auto_2073554 ) ) ( not ( = ?auto_2073548 ?auto_2073555 ) ) ( not ( = ?auto_2073548 ?auto_2073556 ) ) ( not ( = ?auto_2073548 ?auto_2073557 ) ) ( not ( = ?auto_2073548 ?auto_2073558 ) ) ( not ( = ?auto_2073548 ?auto_2073559 ) ) ( not ( = ?auto_2073548 ?auto_2073560 ) ) ( not ( = ?auto_2073548 ?auto_2073566 ) ) ( not ( = ?auto_2073549 ?auto_2073550 ) ) ( not ( = ?auto_2073549 ?auto_2073547 ) ) ( not ( = ?auto_2073549 ?auto_2073551 ) ) ( not ( = ?auto_2073549 ?auto_2073553 ) ) ( not ( = ?auto_2073549 ?auto_2073552 ) ) ( not ( = ?auto_2073549 ?auto_2073554 ) ) ( not ( = ?auto_2073549 ?auto_2073555 ) ) ( not ( = ?auto_2073549 ?auto_2073556 ) ) ( not ( = ?auto_2073549 ?auto_2073557 ) ) ( not ( = ?auto_2073549 ?auto_2073558 ) ) ( not ( = ?auto_2073549 ?auto_2073559 ) ) ( not ( = ?auto_2073549 ?auto_2073560 ) ) ( not ( = ?auto_2073549 ?auto_2073566 ) ) ( not ( = ?auto_2073550 ?auto_2073547 ) ) ( not ( = ?auto_2073550 ?auto_2073551 ) ) ( not ( = ?auto_2073550 ?auto_2073553 ) ) ( not ( = ?auto_2073550 ?auto_2073552 ) ) ( not ( = ?auto_2073550 ?auto_2073554 ) ) ( not ( = ?auto_2073550 ?auto_2073555 ) ) ( not ( = ?auto_2073550 ?auto_2073556 ) ) ( not ( = ?auto_2073550 ?auto_2073557 ) ) ( not ( = ?auto_2073550 ?auto_2073558 ) ) ( not ( = ?auto_2073550 ?auto_2073559 ) ) ( not ( = ?auto_2073550 ?auto_2073560 ) ) ( not ( = ?auto_2073550 ?auto_2073566 ) ) ( not ( = ?auto_2073547 ?auto_2073551 ) ) ( not ( = ?auto_2073547 ?auto_2073553 ) ) ( not ( = ?auto_2073547 ?auto_2073552 ) ) ( not ( = ?auto_2073547 ?auto_2073554 ) ) ( not ( = ?auto_2073547 ?auto_2073555 ) ) ( not ( = ?auto_2073547 ?auto_2073556 ) ) ( not ( = ?auto_2073547 ?auto_2073557 ) ) ( not ( = ?auto_2073547 ?auto_2073558 ) ) ( not ( = ?auto_2073547 ?auto_2073559 ) ) ( not ( = ?auto_2073547 ?auto_2073560 ) ) ( not ( = ?auto_2073547 ?auto_2073566 ) ) ( not ( = ?auto_2073551 ?auto_2073553 ) ) ( not ( = ?auto_2073551 ?auto_2073552 ) ) ( not ( = ?auto_2073551 ?auto_2073554 ) ) ( not ( = ?auto_2073551 ?auto_2073555 ) ) ( not ( = ?auto_2073551 ?auto_2073556 ) ) ( not ( = ?auto_2073551 ?auto_2073557 ) ) ( not ( = ?auto_2073551 ?auto_2073558 ) ) ( not ( = ?auto_2073551 ?auto_2073559 ) ) ( not ( = ?auto_2073551 ?auto_2073560 ) ) ( not ( = ?auto_2073551 ?auto_2073566 ) ) ( not ( = ?auto_2073553 ?auto_2073552 ) ) ( not ( = ?auto_2073553 ?auto_2073554 ) ) ( not ( = ?auto_2073553 ?auto_2073555 ) ) ( not ( = ?auto_2073553 ?auto_2073556 ) ) ( not ( = ?auto_2073553 ?auto_2073557 ) ) ( not ( = ?auto_2073553 ?auto_2073558 ) ) ( not ( = ?auto_2073553 ?auto_2073559 ) ) ( not ( = ?auto_2073553 ?auto_2073560 ) ) ( not ( = ?auto_2073553 ?auto_2073566 ) ) ( not ( = ?auto_2073552 ?auto_2073554 ) ) ( not ( = ?auto_2073552 ?auto_2073555 ) ) ( not ( = ?auto_2073552 ?auto_2073556 ) ) ( not ( = ?auto_2073552 ?auto_2073557 ) ) ( not ( = ?auto_2073552 ?auto_2073558 ) ) ( not ( = ?auto_2073552 ?auto_2073559 ) ) ( not ( = ?auto_2073552 ?auto_2073560 ) ) ( not ( = ?auto_2073552 ?auto_2073566 ) ) ( not ( = ?auto_2073554 ?auto_2073555 ) ) ( not ( = ?auto_2073554 ?auto_2073556 ) ) ( not ( = ?auto_2073554 ?auto_2073557 ) ) ( not ( = ?auto_2073554 ?auto_2073558 ) ) ( not ( = ?auto_2073554 ?auto_2073559 ) ) ( not ( = ?auto_2073554 ?auto_2073560 ) ) ( not ( = ?auto_2073554 ?auto_2073566 ) ) ( not ( = ?auto_2073555 ?auto_2073556 ) ) ( not ( = ?auto_2073555 ?auto_2073557 ) ) ( not ( = ?auto_2073555 ?auto_2073558 ) ) ( not ( = ?auto_2073555 ?auto_2073559 ) ) ( not ( = ?auto_2073555 ?auto_2073560 ) ) ( not ( = ?auto_2073555 ?auto_2073566 ) ) ( not ( = ?auto_2073556 ?auto_2073557 ) ) ( not ( = ?auto_2073556 ?auto_2073558 ) ) ( not ( = ?auto_2073556 ?auto_2073559 ) ) ( not ( = ?auto_2073556 ?auto_2073560 ) ) ( not ( = ?auto_2073556 ?auto_2073566 ) ) ( not ( = ?auto_2073557 ?auto_2073558 ) ) ( not ( = ?auto_2073557 ?auto_2073559 ) ) ( not ( = ?auto_2073557 ?auto_2073560 ) ) ( not ( = ?auto_2073557 ?auto_2073566 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073558 ?auto_2073559 ?auto_2073560 )
      ( MAKE-13CRATE-VERIFY ?auto_2073548 ?auto_2073549 ?auto_2073550 ?auto_2073547 ?auto_2073551 ?auto_2073553 ?auto_2073552 ?auto_2073554 ?auto_2073555 ?auto_2073556 ?auto_2073557 ?auto_2073558 ?auto_2073559 ?auto_2073560 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2073731 - SURFACE
      ?auto_2073732 - SURFACE
      ?auto_2073733 - SURFACE
      ?auto_2073730 - SURFACE
      ?auto_2073734 - SURFACE
      ?auto_2073736 - SURFACE
      ?auto_2073735 - SURFACE
      ?auto_2073737 - SURFACE
      ?auto_2073738 - SURFACE
      ?auto_2073739 - SURFACE
      ?auto_2073740 - SURFACE
      ?auto_2073741 - SURFACE
      ?auto_2073742 - SURFACE
      ?auto_2073743 - SURFACE
    )
    :vars
    (
      ?auto_2073748 - HOIST
      ?auto_2073744 - PLACE
      ?auto_2073747 - PLACE
      ?auto_2073746 - HOIST
      ?auto_2073745 - SURFACE
      ?auto_2073749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073748 ?auto_2073744 ) ( IS-CRATE ?auto_2073743 ) ( not ( = ?auto_2073742 ?auto_2073743 ) ) ( not ( = ?auto_2073741 ?auto_2073742 ) ) ( not ( = ?auto_2073741 ?auto_2073743 ) ) ( not ( = ?auto_2073747 ?auto_2073744 ) ) ( HOIST-AT ?auto_2073746 ?auto_2073747 ) ( not ( = ?auto_2073748 ?auto_2073746 ) ) ( AVAILABLE ?auto_2073746 ) ( SURFACE-AT ?auto_2073743 ?auto_2073747 ) ( ON ?auto_2073743 ?auto_2073745 ) ( CLEAR ?auto_2073743 ) ( not ( = ?auto_2073742 ?auto_2073745 ) ) ( not ( = ?auto_2073743 ?auto_2073745 ) ) ( not ( = ?auto_2073741 ?auto_2073745 ) ) ( TRUCK-AT ?auto_2073749 ?auto_2073744 ) ( SURFACE-AT ?auto_2073741 ?auto_2073744 ) ( CLEAR ?auto_2073741 ) ( LIFTING ?auto_2073748 ?auto_2073742 ) ( IS-CRATE ?auto_2073742 ) ( ON ?auto_2073732 ?auto_2073731 ) ( ON ?auto_2073733 ?auto_2073732 ) ( ON ?auto_2073730 ?auto_2073733 ) ( ON ?auto_2073734 ?auto_2073730 ) ( ON ?auto_2073736 ?auto_2073734 ) ( ON ?auto_2073735 ?auto_2073736 ) ( ON ?auto_2073737 ?auto_2073735 ) ( ON ?auto_2073738 ?auto_2073737 ) ( ON ?auto_2073739 ?auto_2073738 ) ( ON ?auto_2073740 ?auto_2073739 ) ( ON ?auto_2073741 ?auto_2073740 ) ( not ( = ?auto_2073731 ?auto_2073732 ) ) ( not ( = ?auto_2073731 ?auto_2073733 ) ) ( not ( = ?auto_2073731 ?auto_2073730 ) ) ( not ( = ?auto_2073731 ?auto_2073734 ) ) ( not ( = ?auto_2073731 ?auto_2073736 ) ) ( not ( = ?auto_2073731 ?auto_2073735 ) ) ( not ( = ?auto_2073731 ?auto_2073737 ) ) ( not ( = ?auto_2073731 ?auto_2073738 ) ) ( not ( = ?auto_2073731 ?auto_2073739 ) ) ( not ( = ?auto_2073731 ?auto_2073740 ) ) ( not ( = ?auto_2073731 ?auto_2073741 ) ) ( not ( = ?auto_2073731 ?auto_2073742 ) ) ( not ( = ?auto_2073731 ?auto_2073743 ) ) ( not ( = ?auto_2073731 ?auto_2073745 ) ) ( not ( = ?auto_2073732 ?auto_2073733 ) ) ( not ( = ?auto_2073732 ?auto_2073730 ) ) ( not ( = ?auto_2073732 ?auto_2073734 ) ) ( not ( = ?auto_2073732 ?auto_2073736 ) ) ( not ( = ?auto_2073732 ?auto_2073735 ) ) ( not ( = ?auto_2073732 ?auto_2073737 ) ) ( not ( = ?auto_2073732 ?auto_2073738 ) ) ( not ( = ?auto_2073732 ?auto_2073739 ) ) ( not ( = ?auto_2073732 ?auto_2073740 ) ) ( not ( = ?auto_2073732 ?auto_2073741 ) ) ( not ( = ?auto_2073732 ?auto_2073742 ) ) ( not ( = ?auto_2073732 ?auto_2073743 ) ) ( not ( = ?auto_2073732 ?auto_2073745 ) ) ( not ( = ?auto_2073733 ?auto_2073730 ) ) ( not ( = ?auto_2073733 ?auto_2073734 ) ) ( not ( = ?auto_2073733 ?auto_2073736 ) ) ( not ( = ?auto_2073733 ?auto_2073735 ) ) ( not ( = ?auto_2073733 ?auto_2073737 ) ) ( not ( = ?auto_2073733 ?auto_2073738 ) ) ( not ( = ?auto_2073733 ?auto_2073739 ) ) ( not ( = ?auto_2073733 ?auto_2073740 ) ) ( not ( = ?auto_2073733 ?auto_2073741 ) ) ( not ( = ?auto_2073733 ?auto_2073742 ) ) ( not ( = ?auto_2073733 ?auto_2073743 ) ) ( not ( = ?auto_2073733 ?auto_2073745 ) ) ( not ( = ?auto_2073730 ?auto_2073734 ) ) ( not ( = ?auto_2073730 ?auto_2073736 ) ) ( not ( = ?auto_2073730 ?auto_2073735 ) ) ( not ( = ?auto_2073730 ?auto_2073737 ) ) ( not ( = ?auto_2073730 ?auto_2073738 ) ) ( not ( = ?auto_2073730 ?auto_2073739 ) ) ( not ( = ?auto_2073730 ?auto_2073740 ) ) ( not ( = ?auto_2073730 ?auto_2073741 ) ) ( not ( = ?auto_2073730 ?auto_2073742 ) ) ( not ( = ?auto_2073730 ?auto_2073743 ) ) ( not ( = ?auto_2073730 ?auto_2073745 ) ) ( not ( = ?auto_2073734 ?auto_2073736 ) ) ( not ( = ?auto_2073734 ?auto_2073735 ) ) ( not ( = ?auto_2073734 ?auto_2073737 ) ) ( not ( = ?auto_2073734 ?auto_2073738 ) ) ( not ( = ?auto_2073734 ?auto_2073739 ) ) ( not ( = ?auto_2073734 ?auto_2073740 ) ) ( not ( = ?auto_2073734 ?auto_2073741 ) ) ( not ( = ?auto_2073734 ?auto_2073742 ) ) ( not ( = ?auto_2073734 ?auto_2073743 ) ) ( not ( = ?auto_2073734 ?auto_2073745 ) ) ( not ( = ?auto_2073736 ?auto_2073735 ) ) ( not ( = ?auto_2073736 ?auto_2073737 ) ) ( not ( = ?auto_2073736 ?auto_2073738 ) ) ( not ( = ?auto_2073736 ?auto_2073739 ) ) ( not ( = ?auto_2073736 ?auto_2073740 ) ) ( not ( = ?auto_2073736 ?auto_2073741 ) ) ( not ( = ?auto_2073736 ?auto_2073742 ) ) ( not ( = ?auto_2073736 ?auto_2073743 ) ) ( not ( = ?auto_2073736 ?auto_2073745 ) ) ( not ( = ?auto_2073735 ?auto_2073737 ) ) ( not ( = ?auto_2073735 ?auto_2073738 ) ) ( not ( = ?auto_2073735 ?auto_2073739 ) ) ( not ( = ?auto_2073735 ?auto_2073740 ) ) ( not ( = ?auto_2073735 ?auto_2073741 ) ) ( not ( = ?auto_2073735 ?auto_2073742 ) ) ( not ( = ?auto_2073735 ?auto_2073743 ) ) ( not ( = ?auto_2073735 ?auto_2073745 ) ) ( not ( = ?auto_2073737 ?auto_2073738 ) ) ( not ( = ?auto_2073737 ?auto_2073739 ) ) ( not ( = ?auto_2073737 ?auto_2073740 ) ) ( not ( = ?auto_2073737 ?auto_2073741 ) ) ( not ( = ?auto_2073737 ?auto_2073742 ) ) ( not ( = ?auto_2073737 ?auto_2073743 ) ) ( not ( = ?auto_2073737 ?auto_2073745 ) ) ( not ( = ?auto_2073738 ?auto_2073739 ) ) ( not ( = ?auto_2073738 ?auto_2073740 ) ) ( not ( = ?auto_2073738 ?auto_2073741 ) ) ( not ( = ?auto_2073738 ?auto_2073742 ) ) ( not ( = ?auto_2073738 ?auto_2073743 ) ) ( not ( = ?auto_2073738 ?auto_2073745 ) ) ( not ( = ?auto_2073739 ?auto_2073740 ) ) ( not ( = ?auto_2073739 ?auto_2073741 ) ) ( not ( = ?auto_2073739 ?auto_2073742 ) ) ( not ( = ?auto_2073739 ?auto_2073743 ) ) ( not ( = ?auto_2073739 ?auto_2073745 ) ) ( not ( = ?auto_2073740 ?auto_2073741 ) ) ( not ( = ?auto_2073740 ?auto_2073742 ) ) ( not ( = ?auto_2073740 ?auto_2073743 ) ) ( not ( = ?auto_2073740 ?auto_2073745 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073741 ?auto_2073742 ?auto_2073743 )
      ( MAKE-13CRATE-VERIFY ?auto_2073731 ?auto_2073732 ?auto_2073733 ?auto_2073730 ?auto_2073734 ?auto_2073736 ?auto_2073735 ?auto_2073737 ?auto_2073738 ?auto_2073739 ?auto_2073740 ?auto_2073741 ?auto_2073742 ?auto_2073743 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2073914 - SURFACE
      ?auto_2073915 - SURFACE
      ?auto_2073916 - SURFACE
      ?auto_2073913 - SURFACE
      ?auto_2073917 - SURFACE
      ?auto_2073919 - SURFACE
      ?auto_2073918 - SURFACE
      ?auto_2073920 - SURFACE
      ?auto_2073921 - SURFACE
      ?auto_2073922 - SURFACE
      ?auto_2073923 - SURFACE
      ?auto_2073924 - SURFACE
      ?auto_2073925 - SURFACE
      ?auto_2073926 - SURFACE
    )
    :vars
    (
      ?auto_2073930 - HOIST
      ?auto_2073928 - PLACE
      ?auto_2073927 - PLACE
      ?auto_2073931 - HOIST
      ?auto_2073932 - SURFACE
      ?auto_2073929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073930 ?auto_2073928 ) ( IS-CRATE ?auto_2073926 ) ( not ( = ?auto_2073925 ?auto_2073926 ) ) ( not ( = ?auto_2073924 ?auto_2073925 ) ) ( not ( = ?auto_2073924 ?auto_2073926 ) ) ( not ( = ?auto_2073927 ?auto_2073928 ) ) ( HOIST-AT ?auto_2073931 ?auto_2073927 ) ( not ( = ?auto_2073930 ?auto_2073931 ) ) ( AVAILABLE ?auto_2073931 ) ( SURFACE-AT ?auto_2073926 ?auto_2073927 ) ( ON ?auto_2073926 ?auto_2073932 ) ( CLEAR ?auto_2073926 ) ( not ( = ?auto_2073925 ?auto_2073932 ) ) ( not ( = ?auto_2073926 ?auto_2073932 ) ) ( not ( = ?auto_2073924 ?auto_2073932 ) ) ( TRUCK-AT ?auto_2073929 ?auto_2073928 ) ( SURFACE-AT ?auto_2073924 ?auto_2073928 ) ( CLEAR ?auto_2073924 ) ( IS-CRATE ?auto_2073925 ) ( AVAILABLE ?auto_2073930 ) ( IN ?auto_2073925 ?auto_2073929 ) ( ON ?auto_2073915 ?auto_2073914 ) ( ON ?auto_2073916 ?auto_2073915 ) ( ON ?auto_2073913 ?auto_2073916 ) ( ON ?auto_2073917 ?auto_2073913 ) ( ON ?auto_2073919 ?auto_2073917 ) ( ON ?auto_2073918 ?auto_2073919 ) ( ON ?auto_2073920 ?auto_2073918 ) ( ON ?auto_2073921 ?auto_2073920 ) ( ON ?auto_2073922 ?auto_2073921 ) ( ON ?auto_2073923 ?auto_2073922 ) ( ON ?auto_2073924 ?auto_2073923 ) ( not ( = ?auto_2073914 ?auto_2073915 ) ) ( not ( = ?auto_2073914 ?auto_2073916 ) ) ( not ( = ?auto_2073914 ?auto_2073913 ) ) ( not ( = ?auto_2073914 ?auto_2073917 ) ) ( not ( = ?auto_2073914 ?auto_2073919 ) ) ( not ( = ?auto_2073914 ?auto_2073918 ) ) ( not ( = ?auto_2073914 ?auto_2073920 ) ) ( not ( = ?auto_2073914 ?auto_2073921 ) ) ( not ( = ?auto_2073914 ?auto_2073922 ) ) ( not ( = ?auto_2073914 ?auto_2073923 ) ) ( not ( = ?auto_2073914 ?auto_2073924 ) ) ( not ( = ?auto_2073914 ?auto_2073925 ) ) ( not ( = ?auto_2073914 ?auto_2073926 ) ) ( not ( = ?auto_2073914 ?auto_2073932 ) ) ( not ( = ?auto_2073915 ?auto_2073916 ) ) ( not ( = ?auto_2073915 ?auto_2073913 ) ) ( not ( = ?auto_2073915 ?auto_2073917 ) ) ( not ( = ?auto_2073915 ?auto_2073919 ) ) ( not ( = ?auto_2073915 ?auto_2073918 ) ) ( not ( = ?auto_2073915 ?auto_2073920 ) ) ( not ( = ?auto_2073915 ?auto_2073921 ) ) ( not ( = ?auto_2073915 ?auto_2073922 ) ) ( not ( = ?auto_2073915 ?auto_2073923 ) ) ( not ( = ?auto_2073915 ?auto_2073924 ) ) ( not ( = ?auto_2073915 ?auto_2073925 ) ) ( not ( = ?auto_2073915 ?auto_2073926 ) ) ( not ( = ?auto_2073915 ?auto_2073932 ) ) ( not ( = ?auto_2073916 ?auto_2073913 ) ) ( not ( = ?auto_2073916 ?auto_2073917 ) ) ( not ( = ?auto_2073916 ?auto_2073919 ) ) ( not ( = ?auto_2073916 ?auto_2073918 ) ) ( not ( = ?auto_2073916 ?auto_2073920 ) ) ( not ( = ?auto_2073916 ?auto_2073921 ) ) ( not ( = ?auto_2073916 ?auto_2073922 ) ) ( not ( = ?auto_2073916 ?auto_2073923 ) ) ( not ( = ?auto_2073916 ?auto_2073924 ) ) ( not ( = ?auto_2073916 ?auto_2073925 ) ) ( not ( = ?auto_2073916 ?auto_2073926 ) ) ( not ( = ?auto_2073916 ?auto_2073932 ) ) ( not ( = ?auto_2073913 ?auto_2073917 ) ) ( not ( = ?auto_2073913 ?auto_2073919 ) ) ( not ( = ?auto_2073913 ?auto_2073918 ) ) ( not ( = ?auto_2073913 ?auto_2073920 ) ) ( not ( = ?auto_2073913 ?auto_2073921 ) ) ( not ( = ?auto_2073913 ?auto_2073922 ) ) ( not ( = ?auto_2073913 ?auto_2073923 ) ) ( not ( = ?auto_2073913 ?auto_2073924 ) ) ( not ( = ?auto_2073913 ?auto_2073925 ) ) ( not ( = ?auto_2073913 ?auto_2073926 ) ) ( not ( = ?auto_2073913 ?auto_2073932 ) ) ( not ( = ?auto_2073917 ?auto_2073919 ) ) ( not ( = ?auto_2073917 ?auto_2073918 ) ) ( not ( = ?auto_2073917 ?auto_2073920 ) ) ( not ( = ?auto_2073917 ?auto_2073921 ) ) ( not ( = ?auto_2073917 ?auto_2073922 ) ) ( not ( = ?auto_2073917 ?auto_2073923 ) ) ( not ( = ?auto_2073917 ?auto_2073924 ) ) ( not ( = ?auto_2073917 ?auto_2073925 ) ) ( not ( = ?auto_2073917 ?auto_2073926 ) ) ( not ( = ?auto_2073917 ?auto_2073932 ) ) ( not ( = ?auto_2073919 ?auto_2073918 ) ) ( not ( = ?auto_2073919 ?auto_2073920 ) ) ( not ( = ?auto_2073919 ?auto_2073921 ) ) ( not ( = ?auto_2073919 ?auto_2073922 ) ) ( not ( = ?auto_2073919 ?auto_2073923 ) ) ( not ( = ?auto_2073919 ?auto_2073924 ) ) ( not ( = ?auto_2073919 ?auto_2073925 ) ) ( not ( = ?auto_2073919 ?auto_2073926 ) ) ( not ( = ?auto_2073919 ?auto_2073932 ) ) ( not ( = ?auto_2073918 ?auto_2073920 ) ) ( not ( = ?auto_2073918 ?auto_2073921 ) ) ( not ( = ?auto_2073918 ?auto_2073922 ) ) ( not ( = ?auto_2073918 ?auto_2073923 ) ) ( not ( = ?auto_2073918 ?auto_2073924 ) ) ( not ( = ?auto_2073918 ?auto_2073925 ) ) ( not ( = ?auto_2073918 ?auto_2073926 ) ) ( not ( = ?auto_2073918 ?auto_2073932 ) ) ( not ( = ?auto_2073920 ?auto_2073921 ) ) ( not ( = ?auto_2073920 ?auto_2073922 ) ) ( not ( = ?auto_2073920 ?auto_2073923 ) ) ( not ( = ?auto_2073920 ?auto_2073924 ) ) ( not ( = ?auto_2073920 ?auto_2073925 ) ) ( not ( = ?auto_2073920 ?auto_2073926 ) ) ( not ( = ?auto_2073920 ?auto_2073932 ) ) ( not ( = ?auto_2073921 ?auto_2073922 ) ) ( not ( = ?auto_2073921 ?auto_2073923 ) ) ( not ( = ?auto_2073921 ?auto_2073924 ) ) ( not ( = ?auto_2073921 ?auto_2073925 ) ) ( not ( = ?auto_2073921 ?auto_2073926 ) ) ( not ( = ?auto_2073921 ?auto_2073932 ) ) ( not ( = ?auto_2073922 ?auto_2073923 ) ) ( not ( = ?auto_2073922 ?auto_2073924 ) ) ( not ( = ?auto_2073922 ?auto_2073925 ) ) ( not ( = ?auto_2073922 ?auto_2073926 ) ) ( not ( = ?auto_2073922 ?auto_2073932 ) ) ( not ( = ?auto_2073923 ?auto_2073924 ) ) ( not ( = ?auto_2073923 ?auto_2073925 ) ) ( not ( = ?auto_2073923 ?auto_2073926 ) ) ( not ( = ?auto_2073923 ?auto_2073932 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2073924 ?auto_2073925 ?auto_2073926 )
      ( MAKE-13CRATE-VERIFY ?auto_2073914 ?auto_2073915 ?auto_2073916 ?auto_2073913 ?auto_2073917 ?auto_2073919 ?auto_2073918 ?auto_2073920 ?auto_2073921 ?auto_2073922 ?auto_2073923 ?auto_2073924 ?auto_2073925 ?auto_2073926 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2088099 - SURFACE
      ?auto_2088100 - SURFACE
      ?auto_2088101 - SURFACE
      ?auto_2088098 - SURFACE
      ?auto_2088102 - SURFACE
      ?auto_2088104 - SURFACE
      ?auto_2088103 - SURFACE
      ?auto_2088105 - SURFACE
      ?auto_2088106 - SURFACE
      ?auto_2088107 - SURFACE
      ?auto_2088108 - SURFACE
      ?auto_2088109 - SURFACE
      ?auto_2088110 - SURFACE
      ?auto_2088111 - SURFACE
      ?auto_2088112 - SURFACE
    )
    :vars
    (
      ?auto_2088114 - HOIST
      ?auto_2088113 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2088114 ?auto_2088113 ) ( SURFACE-AT ?auto_2088111 ?auto_2088113 ) ( CLEAR ?auto_2088111 ) ( LIFTING ?auto_2088114 ?auto_2088112 ) ( IS-CRATE ?auto_2088112 ) ( not ( = ?auto_2088111 ?auto_2088112 ) ) ( ON ?auto_2088100 ?auto_2088099 ) ( ON ?auto_2088101 ?auto_2088100 ) ( ON ?auto_2088098 ?auto_2088101 ) ( ON ?auto_2088102 ?auto_2088098 ) ( ON ?auto_2088104 ?auto_2088102 ) ( ON ?auto_2088103 ?auto_2088104 ) ( ON ?auto_2088105 ?auto_2088103 ) ( ON ?auto_2088106 ?auto_2088105 ) ( ON ?auto_2088107 ?auto_2088106 ) ( ON ?auto_2088108 ?auto_2088107 ) ( ON ?auto_2088109 ?auto_2088108 ) ( ON ?auto_2088110 ?auto_2088109 ) ( ON ?auto_2088111 ?auto_2088110 ) ( not ( = ?auto_2088099 ?auto_2088100 ) ) ( not ( = ?auto_2088099 ?auto_2088101 ) ) ( not ( = ?auto_2088099 ?auto_2088098 ) ) ( not ( = ?auto_2088099 ?auto_2088102 ) ) ( not ( = ?auto_2088099 ?auto_2088104 ) ) ( not ( = ?auto_2088099 ?auto_2088103 ) ) ( not ( = ?auto_2088099 ?auto_2088105 ) ) ( not ( = ?auto_2088099 ?auto_2088106 ) ) ( not ( = ?auto_2088099 ?auto_2088107 ) ) ( not ( = ?auto_2088099 ?auto_2088108 ) ) ( not ( = ?auto_2088099 ?auto_2088109 ) ) ( not ( = ?auto_2088099 ?auto_2088110 ) ) ( not ( = ?auto_2088099 ?auto_2088111 ) ) ( not ( = ?auto_2088099 ?auto_2088112 ) ) ( not ( = ?auto_2088100 ?auto_2088101 ) ) ( not ( = ?auto_2088100 ?auto_2088098 ) ) ( not ( = ?auto_2088100 ?auto_2088102 ) ) ( not ( = ?auto_2088100 ?auto_2088104 ) ) ( not ( = ?auto_2088100 ?auto_2088103 ) ) ( not ( = ?auto_2088100 ?auto_2088105 ) ) ( not ( = ?auto_2088100 ?auto_2088106 ) ) ( not ( = ?auto_2088100 ?auto_2088107 ) ) ( not ( = ?auto_2088100 ?auto_2088108 ) ) ( not ( = ?auto_2088100 ?auto_2088109 ) ) ( not ( = ?auto_2088100 ?auto_2088110 ) ) ( not ( = ?auto_2088100 ?auto_2088111 ) ) ( not ( = ?auto_2088100 ?auto_2088112 ) ) ( not ( = ?auto_2088101 ?auto_2088098 ) ) ( not ( = ?auto_2088101 ?auto_2088102 ) ) ( not ( = ?auto_2088101 ?auto_2088104 ) ) ( not ( = ?auto_2088101 ?auto_2088103 ) ) ( not ( = ?auto_2088101 ?auto_2088105 ) ) ( not ( = ?auto_2088101 ?auto_2088106 ) ) ( not ( = ?auto_2088101 ?auto_2088107 ) ) ( not ( = ?auto_2088101 ?auto_2088108 ) ) ( not ( = ?auto_2088101 ?auto_2088109 ) ) ( not ( = ?auto_2088101 ?auto_2088110 ) ) ( not ( = ?auto_2088101 ?auto_2088111 ) ) ( not ( = ?auto_2088101 ?auto_2088112 ) ) ( not ( = ?auto_2088098 ?auto_2088102 ) ) ( not ( = ?auto_2088098 ?auto_2088104 ) ) ( not ( = ?auto_2088098 ?auto_2088103 ) ) ( not ( = ?auto_2088098 ?auto_2088105 ) ) ( not ( = ?auto_2088098 ?auto_2088106 ) ) ( not ( = ?auto_2088098 ?auto_2088107 ) ) ( not ( = ?auto_2088098 ?auto_2088108 ) ) ( not ( = ?auto_2088098 ?auto_2088109 ) ) ( not ( = ?auto_2088098 ?auto_2088110 ) ) ( not ( = ?auto_2088098 ?auto_2088111 ) ) ( not ( = ?auto_2088098 ?auto_2088112 ) ) ( not ( = ?auto_2088102 ?auto_2088104 ) ) ( not ( = ?auto_2088102 ?auto_2088103 ) ) ( not ( = ?auto_2088102 ?auto_2088105 ) ) ( not ( = ?auto_2088102 ?auto_2088106 ) ) ( not ( = ?auto_2088102 ?auto_2088107 ) ) ( not ( = ?auto_2088102 ?auto_2088108 ) ) ( not ( = ?auto_2088102 ?auto_2088109 ) ) ( not ( = ?auto_2088102 ?auto_2088110 ) ) ( not ( = ?auto_2088102 ?auto_2088111 ) ) ( not ( = ?auto_2088102 ?auto_2088112 ) ) ( not ( = ?auto_2088104 ?auto_2088103 ) ) ( not ( = ?auto_2088104 ?auto_2088105 ) ) ( not ( = ?auto_2088104 ?auto_2088106 ) ) ( not ( = ?auto_2088104 ?auto_2088107 ) ) ( not ( = ?auto_2088104 ?auto_2088108 ) ) ( not ( = ?auto_2088104 ?auto_2088109 ) ) ( not ( = ?auto_2088104 ?auto_2088110 ) ) ( not ( = ?auto_2088104 ?auto_2088111 ) ) ( not ( = ?auto_2088104 ?auto_2088112 ) ) ( not ( = ?auto_2088103 ?auto_2088105 ) ) ( not ( = ?auto_2088103 ?auto_2088106 ) ) ( not ( = ?auto_2088103 ?auto_2088107 ) ) ( not ( = ?auto_2088103 ?auto_2088108 ) ) ( not ( = ?auto_2088103 ?auto_2088109 ) ) ( not ( = ?auto_2088103 ?auto_2088110 ) ) ( not ( = ?auto_2088103 ?auto_2088111 ) ) ( not ( = ?auto_2088103 ?auto_2088112 ) ) ( not ( = ?auto_2088105 ?auto_2088106 ) ) ( not ( = ?auto_2088105 ?auto_2088107 ) ) ( not ( = ?auto_2088105 ?auto_2088108 ) ) ( not ( = ?auto_2088105 ?auto_2088109 ) ) ( not ( = ?auto_2088105 ?auto_2088110 ) ) ( not ( = ?auto_2088105 ?auto_2088111 ) ) ( not ( = ?auto_2088105 ?auto_2088112 ) ) ( not ( = ?auto_2088106 ?auto_2088107 ) ) ( not ( = ?auto_2088106 ?auto_2088108 ) ) ( not ( = ?auto_2088106 ?auto_2088109 ) ) ( not ( = ?auto_2088106 ?auto_2088110 ) ) ( not ( = ?auto_2088106 ?auto_2088111 ) ) ( not ( = ?auto_2088106 ?auto_2088112 ) ) ( not ( = ?auto_2088107 ?auto_2088108 ) ) ( not ( = ?auto_2088107 ?auto_2088109 ) ) ( not ( = ?auto_2088107 ?auto_2088110 ) ) ( not ( = ?auto_2088107 ?auto_2088111 ) ) ( not ( = ?auto_2088107 ?auto_2088112 ) ) ( not ( = ?auto_2088108 ?auto_2088109 ) ) ( not ( = ?auto_2088108 ?auto_2088110 ) ) ( not ( = ?auto_2088108 ?auto_2088111 ) ) ( not ( = ?auto_2088108 ?auto_2088112 ) ) ( not ( = ?auto_2088109 ?auto_2088110 ) ) ( not ( = ?auto_2088109 ?auto_2088111 ) ) ( not ( = ?auto_2088109 ?auto_2088112 ) ) ( not ( = ?auto_2088110 ?auto_2088111 ) ) ( not ( = ?auto_2088110 ?auto_2088112 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2088111 ?auto_2088112 )
      ( MAKE-14CRATE-VERIFY ?auto_2088099 ?auto_2088100 ?auto_2088101 ?auto_2088098 ?auto_2088102 ?auto_2088104 ?auto_2088103 ?auto_2088105 ?auto_2088106 ?auto_2088107 ?auto_2088108 ?auto_2088109 ?auto_2088110 ?auto_2088111 ?auto_2088112 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2088259 - SURFACE
      ?auto_2088260 - SURFACE
      ?auto_2088261 - SURFACE
      ?auto_2088258 - SURFACE
      ?auto_2088262 - SURFACE
      ?auto_2088264 - SURFACE
      ?auto_2088263 - SURFACE
      ?auto_2088265 - SURFACE
      ?auto_2088266 - SURFACE
      ?auto_2088267 - SURFACE
      ?auto_2088268 - SURFACE
      ?auto_2088269 - SURFACE
      ?auto_2088270 - SURFACE
      ?auto_2088271 - SURFACE
      ?auto_2088272 - SURFACE
    )
    :vars
    (
      ?auto_2088275 - HOIST
      ?auto_2088273 - PLACE
      ?auto_2088274 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2088275 ?auto_2088273 ) ( SURFACE-AT ?auto_2088271 ?auto_2088273 ) ( CLEAR ?auto_2088271 ) ( IS-CRATE ?auto_2088272 ) ( not ( = ?auto_2088271 ?auto_2088272 ) ) ( TRUCK-AT ?auto_2088274 ?auto_2088273 ) ( AVAILABLE ?auto_2088275 ) ( IN ?auto_2088272 ?auto_2088274 ) ( ON ?auto_2088271 ?auto_2088270 ) ( not ( = ?auto_2088270 ?auto_2088271 ) ) ( not ( = ?auto_2088270 ?auto_2088272 ) ) ( ON ?auto_2088260 ?auto_2088259 ) ( ON ?auto_2088261 ?auto_2088260 ) ( ON ?auto_2088258 ?auto_2088261 ) ( ON ?auto_2088262 ?auto_2088258 ) ( ON ?auto_2088264 ?auto_2088262 ) ( ON ?auto_2088263 ?auto_2088264 ) ( ON ?auto_2088265 ?auto_2088263 ) ( ON ?auto_2088266 ?auto_2088265 ) ( ON ?auto_2088267 ?auto_2088266 ) ( ON ?auto_2088268 ?auto_2088267 ) ( ON ?auto_2088269 ?auto_2088268 ) ( ON ?auto_2088270 ?auto_2088269 ) ( not ( = ?auto_2088259 ?auto_2088260 ) ) ( not ( = ?auto_2088259 ?auto_2088261 ) ) ( not ( = ?auto_2088259 ?auto_2088258 ) ) ( not ( = ?auto_2088259 ?auto_2088262 ) ) ( not ( = ?auto_2088259 ?auto_2088264 ) ) ( not ( = ?auto_2088259 ?auto_2088263 ) ) ( not ( = ?auto_2088259 ?auto_2088265 ) ) ( not ( = ?auto_2088259 ?auto_2088266 ) ) ( not ( = ?auto_2088259 ?auto_2088267 ) ) ( not ( = ?auto_2088259 ?auto_2088268 ) ) ( not ( = ?auto_2088259 ?auto_2088269 ) ) ( not ( = ?auto_2088259 ?auto_2088270 ) ) ( not ( = ?auto_2088259 ?auto_2088271 ) ) ( not ( = ?auto_2088259 ?auto_2088272 ) ) ( not ( = ?auto_2088260 ?auto_2088261 ) ) ( not ( = ?auto_2088260 ?auto_2088258 ) ) ( not ( = ?auto_2088260 ?auto_2088262 ) ) ( not ( = ?auto_2088260 ?auto_2088264 ) ) ( not ( = ?auto_2088260 ?auto_2088263 ) ) ( not ( = ?auto_2088260 ?auto_2088265 ) ) ( not ( = ?auto_2088260 ?auto_2088266 ) ) ( not ( = ?auto_2088260 ?auto_2088267 ) ) ( not ( = ?auto_2088260 ?auto_2088268 ) ) ( not ( = ?auto_2088260 ?auto_2088269 ) ) ( not ( = ?auto_2088260 ?auto_2088270 ) ) ( not ( = ?auto_2088260 ?auto_2088271 ) ) ( not ( = ?auto_2088260 ?auto_2088272 ) ) ( not ( = ?auto_2088261 ?auto_2088258 ) ) ( not ( = ?auto_2088261 ?auto_2088262 ) ) ( not ( = ?auto_2088261 ?auto_2088264 ) ) ( not ( = ?auto_2088261 ?auto_2088263 ) ) ( not ( = ?auto_2088261 ?auto_2088265 ) ) ( not ( = ?auto_2088261 ?auto_2088266 ) ) ( not ( = ?auto_2088261 ?auto_2088267 ) ) ( not ( = ?auto_2088261 ?auto_2088268 ) ) ( not ( = ?auto_2088261 ?auto_2088269 ) ) ( not ( = ?auto_2088261 ?auto_2088270 ) ) ( not ( = ?auto_2088261 ?auto_2088271 ) ) ( not ( = ?auto_2088261 ?auto_2088272 ) ) ( not ( = ?auto_2088258 ?auto_2088262 ) ) ( not ( = ?auto_2088258 ?auto_2088264 ) ) ( not ( = ?auto_2088258 ?auto_2088263 ) ) ( not ( = ?auto_2088258 ?auto_2088265 ) ) ( not ( = ?auto_2088258 ?auto_2088266 ) ) ( not ( = ?auto_2088258 ?auto_2088267 ) ) ( not ( = ?auto_2088258 ?auto_2088268 ) ) ( not ( = ?auto_2088258 ?auto_2088269 ) ) ( not ( = ?auto_2088258 ?auto_2088270 ) ) ( not ( = ?auto_2088258 ?auto_2088271 ) ) ( not ( = ?auto_2088258 ?auto_2088272 ) ) ( not ( = ?auto_2088262 ?auto_2088264 ) ) ( not ( = ?auto_2088262 ?auto_2088263 ) ) ( not ( = ?auto_2088262 ?auto_2088265 ) ) ( not ( = ?auto_2088262 ?auto_2088266 ) ) ( not ( = ?auto_2088262 ?auto_2088267 ) ) ( not ( = ?auto_2088262 ?auto_2088268 ) ) ( not ( = ?auto_2088262 ?auto_2088269 ) ) ( not ( = ?auto_2088262 ?auto_2088270 ) ) ( not ( = ?auto_2088262 ?auto_2088271 ) ) ( not ( = ?auto_2088262 ?auto_2088272 ) ) ( not ( = ?auto_2088264 ?auto_2088263 ) ) ( not ( = ?auto_2088264 ?auto_2088265 ) ) ( not ( = ?auto_2088264 ?auto_2088266 ) ) ( not ( = ?auto_2088264 ?auto_2088267 ) ) ( not ( = ?auto_2088264 ?auto_2088268 ) ) ( not ( = ?auto_2088264 ?auto_2088269 ) ) ( not ( = ?auto_2088264 ?auto_2088270 ) ) ( not ( = ?auto_2088264 ?auto_2088271 ) ) ( not ( = ?auto_2088264 ?auto_2088272 ) ) ( not ( = ?auto_2088263 ?auto_2088265 ) ) ( not ( = ?auto_2088263 ?auto_2088266 ) ) ( not ( = ?auto_2088263 ?auto_2088267 ) ) ( not ( = ?auto_2088263 ?auto_2088268 ) ) ( not ( = ?auto_2088263 ?auto_2088269 ) ) ( not ( = ?auto_2088263 ?auto_2088270 ) ) ( not ( = ?auto_2088263 ?auto_2088271 ) ) ( not ( = ?auto_2088263 ?auto_2088272 ) ) ( not ( = ?auto_2088265 ?auto_2088266 ) ) ( not ( = ?auto_2088265 ?auto_2088267 ) ) ( not ( = ?auto_2088265 ?auto_2088268 ) ) ( not ( = ?auto_2088265 ?auto_2088269 ) ) ( not ( = ?auto_2088265 ?auto_2088270 ) ) ( not ( = ?auto_2088265 ?auto_2088271 ) ) ( not ( = ?auto_2088265 ?auto_2088272 ) ) ( not ( = ?auto_2088266 ?auto_2088267 ) ) ( not ( = ?auto_2088266 ?auto_2088268 ) ) ( not ( = ?auto_2088266 ?auto_2088269 ) ) ( not ( = ?auto_2088266 ?auto_2088270 ) ) ( not ( = ?auto_2088266 ?auto_2088271 ) ) ( not ( = ?auto_2088266 ?auto_2088272 ) ) ( not ( = ?auto_2088267 ?auto_2088268 ) ) ( not ( = ?auto_2088267 ?auto_2088269 ) ) ( not ( = ?auto_2088267 ?auto_2088270 ) ) ( not ( = ?auto_2088267 ?auto_2088271 ) ) ( not ( = ?auto_2088267 ?auto_2088272 ) ) ( not ( = ?auto_2088268 ?auto_2088269 ) ) ( not ( = ?auto_2088268 ?auto_2088270 ) ) ( not ( = ?auto_2088268 ?auto_2088271 ) ) ( not ( = ?auto_2088268 ?auto_2088272 ) ) ( not ( = ?auto_2088269 ?auto_2088270 ) ) ( not ( = ?auto_2088269 ?auto_2088271 ) ) ( not ( = ?auto_2088269 ?auto_2088272 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2088270 ?auto_2088271 ?auto_2088272 )
      ( MAKE-14CRATE-VERIFY ?auto_2088259 ?auto_2088260 ?auto_2088261 ?auto_2088258 ?auto_2088262 ?auto_2088264 ?auto_2088263 ?auto_2088265 ?auto_2088266 ?auto_2088267 ?auto_2088268 ?auto_2088269 ?auto_2088270 ?auto_2088271 ?auto_2088272 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2088434 - SURFACE
      ?auto_2088435 - SURFACE
      ?auto_2088436 - SURFACE
      ?auto_2088433 - SURFACE
      ?auto_2088437 - SURFACE
      ?auto_2088439 - SURFACE
      ?auto_2088438 - SURFACE
      ?auto_2088440 - SURFACE
      ?auto_2088441 - SURFACE
      ?auto_2088442 - SURFACE
      ?auto_2088443 - SURFACE
      ?auto_2088444 - SURFACE
      ?auto_2088445 - SURFACE
      ?auto_2088446 - SURFACE
      ?auto_2088447 - SURFACE
    )
    :vars
    (
      ?auto_2088450 - HOIST
      ?auto_2088448 - PLACE
      ?auto_2088451 - TRUCK
      ?auto_2088449 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2088450 ?auto_2088448 ) ( SURFACE-AT ?auto_2088446 ?auto_2088448 ) ( CLEAR ?auto_2088446 ) ( IS-CRATE ?auto_2088447 ) ( not ( = ?auto_2088446 ?auto_2088447 ) ) ( AVAILABLE ?auto_2088450 ) ( IN ?auto_2088447 ?auto_2088451 ) ( ON ?auto_2088446 ?auto_2088445 ) ( not ( = ?auto_2088445 ?auto_2088446 ) ) ( not ( = ?auto_2088445 ?auto_2088447 ) ) ( TRUCK-AT ?auto_2088451 ?auto_2088449 ) ( not ( = ?auto_2088449 ?auto_2088448 ) ) ( ON ?auto_2088435 ?auto_2088434 ) ( ON ?auto_2088436 ?auto_2088435 ) ( ON ?auto_2088433 ?auto_2088436 ) ( ON ?auto_2088437 ?auto_2088433 ) ( ON ?auto_2088439 ?auto_2088437 ) ( ON ?auto_2088438 ?auto_2088439 ) ( ON ?auto_2088440 ?auto_2088438 ) ( ON ?auto_2088441 ?auto_2088440 ) ( ON ?auto_2088442 ?auto_2088441 ) ( ON ?auto_2088443 ?auto_2088442 ) ( ON ?auto_2088444 ?auto_2088443 ) ( ON ?auto_2088445 ?auto_2088444 ) ( not ( = ?auto_2088434 ?auto_2088435 ) ) ( not ( = ?auto_2088434 ?auto_2088436 ) ) ( not ( = ?auto_2088434 ?auto_2088433 ) ) ( not ( = ?auto_2088434 ?auto_2088437 ) ) ( not ( = ?auto_2088434 ?auto_2088439 ) ) ( not ( = ?auto_2088434 ?auto_2088438 ) ) ( not ( = ?auto_2088434 ?auto_2088440 ) ) ( not ( = ?auto_2088434 ?auto_2088441 ) ) ( not ( = ?auto_2088434 ?auto_2088442 ) ) ( not ( = ?auto_2088434 ?auto_2088443 ) ) ( not ( = ?auto_2088434 ?auto_2088444 ) ) ( not ( = ?auto_2088434 ?auto_2088445 ) ) ( not ( = ?auto_2088434 ?auto_2088446 ) ) ( not ( = ?auto_2088434 ?auto_2088447 ) ) ( not ( = ?auto_2088435 ?auto_2088436 ) ) ( not ( = ?auto_2088435 ?auto_2088433 ) ) ( not ( = ?auto_2088435 ?auto_2088437 ) ) ( not ( = ?auto_2088435 ?auto_2088439 ) ) ( not ( = ?auto_2088435 ?auto_2088438 ) ) ( not ( = ?auto_2088435 ?auto_2088440 ) ) ( not ( = ?auto_2088435 ?auto_2088441 ) ) ( not ( = ?auto_2088435 ?auto_2088442 ) ) ( not ( = ?auto_2088435 ?auto_2088443 ) ) ( not ( = ?auto_2088435 ?auto_2088444 ) ) ( not ( = ?auto_2088435 ?auto_2088445 ) ) ( not ( = ?auto_2088435 ?auto_2088446 ) ) ( not ( = ?auto_2088435 ?auto_2088447 ) ) ( not ( = ?auto_2088436 ?auto_2088433 ) ) ( not ( = ?auto_2088436 ?auto_2088437 ) ) ( not ( = ?auto_2088436 ?auto_2088439 ) ) ( not ( = ?auto_2088436 ?auto_2088438 ) ) ( not ( = ?auto_2088436 ?auto_2088440 ) ) ( not ( = ?auto_2088436 ?auto_2088441 ) ) ( not ( = ?auto_2088436 ?auto_2088442 ) ) ( not ( = ?auto_2088436 ?auto_2088443 ) ) ( not ( = ?auto_2088436 ?auto_2088444 ) ) ( not ( = ?auto_2088436 ?auto_2088445 ) ) ( not ( = ?auto_2088436 ?auto_2088446 ) ) ( not ( = ?auto_2088436 ?auto_2088447 ) ) ( not ( = ?auto_2088433 ?auto_2088437 ) ) ( not ( = ?auto_2088433 ?auto_2088439 ) ) ( not ( = ?auto_2088433 ?auto_2088438 ) ) ( not ( = ?auto_2088433 ?auto_2088440 ) ) ( not ( = ?auto_2088433 ?auto_2088441 ) ) ( not ( = ?auto_2088433 ?auto_2088442 ) ) ( not ( = ?auto_2088433 ?auto_2088443 ) ) ( not ( = ?auto_2088433 ?auto_2088444 ) ) ( not ( = ?auto_2088433 ?auto_2088445 ) ) ( not ( = ?auto_2088433 ?auto_2088446 ) ) ( not ( = ?auto_2088433 ?auto_2088447 ) ) ( not ( = ?auto_2088437 ?auto_2088439 ) ) ( not ( = ?auto_2088437 ?auto_2088438 ) ) ( not ( = ?auto_2088437 ?auto_2088440 ) ) ( not ( = ?auto_2088437 ?auto_2088441 ) ) ( not ( = ?auto_2088437 ?auto_2088442 ) ) ( not ( = ?auto_2088437 ?auto_2088443 ) ) ( not ( = ?auto_2088437 ?auto_2088444 ) ) ( not ( = ?auto_2088437 ?auto_2088445 ) ) ( not ( = ?auto_2088437 ?auto_2088446 ) ) ( not ( = ?auto_2088437 ?auto_2088447 ) ) ( not ( = ?auto_2088439 ?auto_2088438 ) ) ( not ( = ?auto_2088439 ?auto_2088440 ) ) ( not ( = ?auto_2088439 ?auto_2088441 ) ) ( not ( = ?auto_2088439 ?auto_2088442 ) ) ( not ( = ?auto_2088439 ?auto_2088443 ) ) ( not ( = ?auto_2088439 ?auto_2088444 ) ) ( not ( = ?auto_2088439 ?auto_2088445 ) ) ( not ( = ?auto_2088439 ?auto_2088446 ) ) ( not ( = ?auto_2088439 ?auto_2088447 ) ) ( not ( = ?auto_2088438 ?auto_2088440 ) ) ( not ( = ?auto_2088438 ?auto_2088441 ) ) ( not ( = ?auto_2088438 ?auto_2088442 ) ) ( not ( = ?auto_2088438 ?auto_2088443 ) ) ( not ( = ?auto_2088438 ?auto_2088444 ) ) ( not ( = ?auto_2088438 ?auto_2088445 ) ) ( not ( = ?auto_2088438 ?auto_2088446 ) ) ( not ( = ?auto_2088438 ?auto_2088447 ) ) ( not ( = ?auto_2088440 ?auto_2088441 ) ) ( not ( = ?auto_2088440 ?auto_2088442 ) ) ( not ( = ?auto_2088440 ?auto_2088443 ) ) ( not ( = ?auto_2088440 ?auto_2088444 ) ) ( not ( = ?auto_2088440 ?auto_2088445 ) ) ( not ( = ?auto_2088440 ?auto_2088446 ) ) ( not ( = ?auto_2088440 ?auto_2088447 ) ) ( not ( = ?auto_2088441 ?auto_2088442 ) ) ( not ( = ?auto_2088441 ?auto_2088443 ) ) ( not ( = ?auto_2088441 ?auto_2088444 ) ) ( not ( = ?auto_2088441 ?auto_2088445 ) ) ( not ( = ?auto_2088441 ?auto_2088446 ) ) ( not ( = ?auto_2088441 ?auto_2088447 ) ) ( not ( = ?auto_2088442 ?auto_2088443 ) ) ( not ( = ?auto_2088442 ?auto_2088444 ) ) ( not ( = ?auto_2088442 ?auto_2088445 ) ) ( not ( = ?auto_2088442 ?auto_2088446 ) ) ( not ( = ?auto_2088442 ?auto_2088447 ) ) ( not ( = ?auto_2088443 ?auto_2088444 ) ) ( not ( = ?auto_2088443 ?auto_2088445 ) ) ( not ( = ?auto_2088443 ?auto_2088446 ) ) ( not ( = ?auto_2088443 ?auto_2088447 ) ) ( not ( = ?auto_2088444 ?auto_2088445 ) ) ( not ( = ?auto_2088444 ?auto_2088446 ) ) ( not ( = ?auto_2088444 ?auto_2088447 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2088445 ?auto_2088446 ?auto_2088447 )
      ( MAKE-14CRATE-VERIFY ?auto_2088434 ?auto_2088435 ?auto_2088436 ?auto_2088433 ?auto_2088437 ?auto_2088439 ?auto_2088438 ?auto_2088440 ?auto_2088441 ?auto_2088442 ?auto_2088443 ?auto_2088444 ?auto_2088445 ?auto_2088446 ?auto_2088447 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2088623 - SURFACE
      ?auto_2088624 - SURFACE
      ?auto_2088625 - SURFACE
      ?auto_2088622 - SURFACE
      ?auto_2088626 - SURFACE
      ?auto_2088628 - SURFACE
      ?auto_2088627 - SURFACE
      ?auto_2088629 - SURFACE
      ?auto_2088630 - SURFACE
      ?auto_2088631 - SURFACE
      ?auto_2088632 - SURFACE
      ?auto_2088633 - SURFACE
      ?auto_2088634 - SURFACE
      ?auto_2088635 - SURFACE
      ?auto_2088636 - SURFACE
    )
    :vars
    (
      ?auto_2088637 - HOIST
      ?auto_2088641 - PLACE
      ?auto_2088640 - TRUCK
      ?auto_2088638 - PLACE
      ?auto_2088639 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2088637 ?auto_2088641 ) ( SURFACE-AT ?auto_2088635 ?auto_2088641 ) ( CLEAR ?auto_2088635 ) ( IS-CRATE ?auto_2088636 ) ( not ( = ?auto_2088635 ?auto_2088636 ) ) ( AVAILABLE ?auto_2088637 ) ( ON ?auto_2088635 ?auto_2088634 ) ( not ( = ?auto_2088634 ?auto_2088635 ) ) ( not ( = ?auto_2088634 ?auto_2088636 ) ) ( TRUCK-AT ?auto_2088640 ?auto_2088638 ) ( not ( = ?auto_2088638 ?auto_2088641 ) ) ( HOIST-AT ?auto_2088639 ?auto_2088638 ) ( LIFTING ?auto_2088639 ?auto_2088636 ) ( not ( = ?auto_2088637 ?auto_2088639 ) ) ( ON ?auto_2088624 ?auto_2088623 ) ( ON ?auto_2088625 ?auto_2088624 ) ( ON ?auto_2088622 ?auto_2088625 ) ( ON ?auto_2088626 ?auto_2088622 ) ( ON ?auto_2088628 ?auto_2088626 ) ( ON ?auto_2088627 ?auto_2088628 ) ( ON ?auto_2088629 ?auto_2088627 ) ( ON ?auto_2088630 ?auto_2088629 ) ( ON ?auto_2088631 ?auto_2088630 ) ( ON ?auto_2088632 ?auto_2088631 ) ( ON ?auto_2088633 ?auto_2088632 ) ( ON ?auto_2088634 ?auto_2088633 ) ( not ( = ?auto_2088623 ?auto_2088624 ) ) ( not ( = ?auto_2088623 ?auto_2088625 ) ) ( not ( = ?auto_2088623 ?auto_2088622 ) ) ( not ( = ?auto_2088623 ?auto_2088626 ) ) ( not ( = ?auto_2088623 ?auto_2088628 ) ) ( not ( = ?auto_2088623 ?auto_2088627 ) ) ( not ( = ?auto_2088623 ?auto_2088629 ) ) ( not ( = ?auto_2088623 ?auto_2088630 ) ) ( not ( = ?auto_2088623 ?auto_2088631 ) ) ( not ( = ?auto_2088623 ?auto_2088632 ) ) ( not ( = ?auto_2088623 ?auto_2088633 ) ) ( not ( = ?auto_2088623 ?auto_2088634 ) ) ( not ( = ?auto_2088623 ?auto_2088635 ) ) ( not ( = ?auto_2088623 ?auto_2088636 ) ) ( not ( = ?auto_2088624 ?auto_2088625 ) ) ( not ( = ?auto_2088624 ?auto_2088622 ) ) ( not ( = ?auto_2088624 ?auto_2088626 ) ) ( not ( = ?auto_2088624 ?auto_2088628 ) ) ( not ( = ?auto_2088624 ?auto_2088627 ) ) ( not ( = ?auto_2088624 ?auto_2088629 ) ) ( not ( = ?auto_2088624 ?auto_2088630 ) ) ( not ( = ?auto_2088624 ?auto_2088631 ) ) ( not ( = ?auto_2088624 ?auto_2088632 ) ) ( not ( = ?auto_2088624 ?auto_2088633 ) ) ( not ( = ?auto_2088624 ?auto_2088634 ) ) ( not ( = ?auto_2088624 ?auto_2088635 ) ) ( not ( = ?auto_2088624 ?auto_2088636 ) ) ( not ( = ?auto_2088625 ?auto_2088622 ) ) ( not ( = ?auto_2088625 ?auto_2088626 ) ) ( not ( = ?auto_2088625 ?auto_2088628 ) ) ( not ( = ?auto_2088625 ?auto_2088627 ) ) ( not ( = ?auto_2088625 ?auto_2088629 ) ) ( not ( = ?auto_2088625 ?auto_2088630 ) ) ( not ( = ?auto_2088625 ?auto_2088631 ) ) ( not ( = ?auto_2088625 ?auto_2088632 ) ) ( not ( = ?auto_2088625 ?auto_2088633 ) ) ( not ( = ?auto_2088625 ?auto_2088634 ) ) ( not ( = ?auto_2088625 ?auto_2088635 ) ) ( not ( = ?auto_2088625 ?auto_2088636 ) ) ( not ( = ?auto_2088622 ?auto_2088626 ) ) ( not ( = ?auto_2088622 ?auto_2088628 ) ) ( not ( = ?auto_2088622 ?auto_2088627 ) ) ( not ( = ?auto_2088622 ?auto_2088629 ) ) ( not ( = ?auto_2088622 ?auto_2088630 ) ) ( not ( = ?auto_2088622 ?auto_2088631 ) ) ( not ( = ?auto_2088622 ?auto_2088632 ) ) ( not ( = ?auto_2088622 ?auto_2088633 ) ) ( not ( = ?auto_2088622 ?auto_2088634 ) ) ( not ( = ?auto_2088622 ?auto_2088635 ) ) ( not ( = ?auto_2088622 ?auto_2088636 ) ) ( not ( = ?auto_2088626 ?auto_2088628 ) ) ( not ( = ?auto_2088626 ?auto_2088627 ) ) ( not ( = ?auto_2088626 ?auto_2088629 ) ) ( not ( = ?auto_2088626 ?auto_2088630 ) ) ( not ( = ?auto_2088626 ?auto_2088631 ) ) ( not ( = ?auto_2088626 ?auto_2088632 ) ) ( not ( = ?auto_2088626 ?auto_2088633 ) ) ( not ( = ?auto_2088626 ?auto_2088634 ) ) ( not ( = ?auto_2088626 ?auto_2088635 ) ) ( not ( = ?auto_2088626 ?auto_2088636 ) ) ( not ( = ?auto_2088628 ?auto_2088627 ) ) ( not ( = ?auto_2088628 ?auto_2088629 ) ) ( not ( = ?auto_2088628 ?auto_2088630 ) ) ( not ( = ?auto_2088628 ?auto_2088631 ) ) ( not ( = ?auto_2088628 ?auto_2088632 ) ) ( not ( = ?auto_2088628 ?auto_2088633 ) ) ( not ( = ?auto_2088628 ?auto_2088634 ) ) ( not ( = ?auto_2088628 ?auto_2088635 ) ) ( not ( = ?auto_2088628 ?auto_2088636 ) ) ( not ( = ?auto_2088627 ?auto_2088629 ) ) ( not ( = ?auto_2088627 ?auto_2088630 ) ) ( not ( = ?auto_2088627 ?auto_2088631 ) ) ( not ( = ?auto_2088627 ?auto_2088632 ) ) ( not ( = ?auto_2088627 ?auto_2088633 ) ) ( not ( = ?auto_2088627 ?auto_2088634 ) ) ( not ( = ?auto_2088627 ?auto_2088635 ) ) ( not ( = ?auto_2088627 ?auto_2088636 ) ) ( not ( = ?auto_2088629 ?auto_2088630 ) ) ( not ( = ?auto_2088629 ?auto_2088631 ) ) ( not ( = ?auto_2088629 ?auto_2088632 ) ) ( not ( = ?auto_2088629 ?auto_2088633 ) ) ( not ( = ?auto_2088629 ?auto_2088634 ) ) ( not ( = ?auto_2088629 ?auto_2088635 ) ) ( not ( = ?auto_2088629 ?auto_2088636 ) ) ( not ( = ?auto_2088630 ?auto_2088631 ) ) ( not ( = ?auto_2088630 ?auto_2088632 ) ) ( not ( = ?auto_2088630 ?auto_2088633 ) ) ( not ( = ?auto_2088630 ?auto_2088634 ) ) ( not ( = ?auto_2088630 ?auto_2088635 ) ) ( not ( = ?auto_2088630 ?auto_2088636 ) ) ( not ( = ?auto_2088631 ?auto_2088632 ) ) ( not ( = ?auto_2088631 ?auto_2088633 ) ) ( not ( = ?auto_2088631 ?auto_2088634 ) ) ( not ( = ?auto_2088631 ?auto_2088635 ) ) ( not ( = ?auto_2088631 ?auto_2088636 ) ) ( not ( = ?auto_2088632 ?auto_2088633 ) ) ( not ( = ?auto_2088632 ?auto_2088634 ) ) ( not ( = ?auto_2088632 ?auto_2088635 ) ) ( not ( = ?auto_2088632 ?auto_2088636 ) ) ( not ( = ?auto_2088633 ?auto_2088634 ) ) ( not ( = ?auto_2088633 ?auto_2088635 ) ) ( not ( = ?auto_2088633 ?auto_2088636 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2088634 ?auto_2088635 ?auto_2088636 )
      ( MAKE-14CRATE-VERIFY ?auto_2088623 ?auto_2088624 ?auto_2088625 ?auto_2088622 ?auto_2088626 ?auto_2088628 ?auto_2088627 ?auto_2088629 ?auto_2088630 ?auto_2088631 ?auto_2088632 ?auto_2088633 ?auto_2088634 ?auto_2088635 ?auto_2088636 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2088826 - SURFACE
      ?auto_2088827 - SURFACE
      ?auto_2088828 - SURFACE
      ?auto_2088825 - SURFACE
      ?auto_2088829 - SURFACE
      ?auto_2088831 - SURFACE
      ?auto_2088830 - SURFACE
      ?auto_2088832 - SURFACE
      ?auto_2088833 - SURFACE
      ?auto_2088834 - SURFACE
      ?auto_2088835 - SURFACE
      ?auto_2088836 - SURFACE
      ?auto_2088837 - SURFACE
      ?auto_2088838 - SURFACE
      ?auto_2088839 - SURFACE
    )
    :vars
    (
      ?auto_2088845 - HOIST
      ?auto_2088844 - PLACE
      ?auto_2088842 - TRUCK
      ?auto_2088840 - PLACE
      ?auto_2088843 - HOIST
      ?auto_2088841 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2088845 ?auto_2088844 ) ( SURFACE-AT ?auto_2088838 ?auto_2088844 ) ( CLEAR ?auto_2088838 ) ( IS-CRATE ?auto_2088839 ) ( not ( = ?auto_2088838 ?auto_2088839 ) ) ( AVAILABLE ?auto_2088845 ) ( ON ?auto_2088838 ?auto_2088837 ) ( not ( = ?auto_2088837 ?auto_2088838 ) ) ( not ( = ?auto_2088837 ?auto_2088839 ) ) ( TRUCK-AT ?auto_2088842 ?auto_2088840 ) ( not ( = ?auto_2088840 ?auto_2088844 ) ) ( HOIST-AT ?auto_2088843 ?auto_2088840 ) ( not ( = ?auto_2088845 ?auto_2088843 ) ) ( AVAILABLE ?auto_2088843 ) ( SURFACE-AT ?auto_2088839 ?auto_2088840 ) ( ON ?auto_2088839 ?auto_2088841 ) ( CLEAR ?auto_2088839 ) ( not ( = ?auto_2088838 ?auto_2088841 ) ) ( not ( = ?auto_2088839 ?auto_2088841 ) ) ( not ( = ?auto_2088837 ?auto_2088841 ) ) ( ON ?auto_2088827 ?auto_2088826 ) ( ON ?auto_2088828 ?auto_2088827 ) ( ON ?auto_2088825 ?auto_2088828 ) ( ON ?auto_2088829 ?auto_2088825 ) ( ON ?auto_2088831 ?auto_2088829 ) ( ON ?auto_2088830 ?auto_2088831 ) ( ON ?auto_2088832 ?auto_2088830 ) ( ON ?auto_2088833 ?auto_2088832 ) ( ON ?auto_2088834 ?auto_2088833 ) ( ON ?auto_2088835 ?auto_2088834 ) ( ON ?auto_2088836 ?auto_2088835 ) ( ON ?auto_2088837 ?auto_2088836 ) ( not ( = ?auto_2088826 ?auto_2088827 ) ) ( not ( = ?auto_2088826 ?auto_2088828 ) ) ( not ( = ?auto_2088826 ?auto_2088825 ) ) ( not ( = ?auto_2088826 ?auto_2088829 ) ) ( not ( = ?auto_2088826 ?auto_2088831 ) ) ( not ( = ?auto_2088826 ?auto_2088830 ) ) ( not ( = ?auto_2088826 ?auto_2088832 ) ) ( not ( = ?auto_2088826 ?auto_2088833 ) ) ( not ( = ?auto_2088826 ?auto_2088834 ) ) ( not ( = ?auto_2088826 ?auto_2088835 ) ) ( not ( = ?auto_2088826 ?auto_2088836 ) ) ( not ( = ?auto_2088826 ?auto_2088837 ) ) ( not ( = ?auto_2088826 ?auto_2088838 ) ) ( not ( = ?auto_2088826 ?auto_2088839 ) ) ( not ( = ?auto_2088826 ?auto_2088841 ) ) ( not ( = ?auto_2088827 ?auto_2088828 ) ) ( not ( = ?auto_2088827 ?auto_2088825 ) ) ( not ( = ?auto_2088827 ?auto_2088829 ) ) ( not ( = ?auto_2088827 ?auto_2088831 ) ) ( not ( = ?auto_2088827 ?auto_2088830 ) ) ( not ( = ?auto_2088827 ?auto_2088832 ) ) ( not ( = ?auto_2088827 ?auto_2088833 ) ) ( not ( = ?auto_2088827 ?auto_2088834 ) ) ( not ( = ?auto_2088827 ?auto_2088835 ) ) ( not ( = ?auto_2088827 ?auto_2088836 ) ) ( not ( = ?auto_2088827 ?auto_2088837 ) ) ( not ( = ?auto_2088827 ?auto_2088838 ) ) ( not ( = ?auto_2088827 ?auto_2088839 ) ) ( not ( = ?auto_2088827 ?auto_2088841 ) ) ( not ( = ?auto_2088828 ?auto_2088825 ) ) ( not ( = ?auto_2088828 ?auto_2088829 ) ) ( not ( = ?auto_2088828 ?auto_2088831 ) ) ( not ( = ?auto_2088828 ?auto_2088830 ) ) ( not ( = ?auto_2088828 ?auto_2088832 ) ) ( not ( = ?auto_2088828 ?auto_2088833 ) ) ( not ( = ?auto_2088828 ?auto_2088834 ) ) ( not ( = ?auto_2088828 ?auto_2088835 ) ) ( not ( = ?auto_2088828 ?auto_2088836 ) ) ( not ( = ?auto_2088828 ?auto_2088837 ) ) ( not ( = ?auto_2088828 ?auto_2088838 ) ) ( not ( = ?auto_2088828 ?auto_2088839 ) ) ( not ( = ?auto_2088828 ?auto_2088841 ) ) ( not ( = ?auto_2088825 ?auto_2088829 ) ) ( not ( = ?auto_2088825 ?auto_2088831 ) ) ( not ( = ?auto_2088825 ?auto_2088830 ) ) ( not ( = ?auto_2088825 ?auto_2088832 ) ) ( not ( = ?auto_2088825 ?auto_2088833 ) ) ( not ( = ?auto_2088825 ?auto_2088834 ) ) ( not ( = ?auto_2088825 ?auto_2088835 ) ) ( not ( = ?auto_2088825 ?auto_2088836 ) ) ( not ( = ?auto_2088825 ?auto_2088837 ) ) ( not ( = ?auto_2088825 ?auto_2088838 ) ) ( not ( = ?auto_2088825 ?auto_2088839 ) ) ( not ( = ?auto_2088825 ?auto_2088841 ) ) ( not ( = ?auto_2088829 ?auto_2088831 ) ) ( not ( = ?auto_2088829 ?auto_2088830 ) ) ( not ( = ?auto_2088829 ?auto_2088832 ) ) ( not ( = ?auto_2088829 ?auto_2088833 ) ) ( not ( = ?auto_2088829 ?auto_2088834 ) ) ( not ( = ?auto_2088829 ?auto_2088835 ) ) ( not ( = ?auto_2088829 ?auto_2088836 ) ) ( not ( = ?auto_2088829 ?auto_2088837 ) ) ( not ( = ?auto_2088829 ?auto_2088838 ) ) ( not ( = ?auto_2088829 ?auto_2088839 ) ) ( not ( = ?auto_2088829 ?auto_2088841 ) ) ( not ( = ?auto_2088831 ?auto_2088830 ) ) ( not ( = ?auto_2088831 ?auto_2088832 ) ) ( not ( = ?auto_2088831 ?auto_2088833 ) ) ( not ( = ?auto_2088831 ?auto_2088834 ) ) ( not ( = ?auto_2088831 ?auto_2088835 ) ) ( not ( = ?auto_2088831 ?auto_2088836 ) ) ( not ( = ?auto_2088831 ?auto_2088837 ) ) ( not ( = ?auto_2088831 ?auto_2088838 ) ) ( not ( = ?auto_2088831 ?auto_2088839 ) ) ( not ( = ?auto_2088831 ?auto_2088841 ) ) ( not ( = ?auto_2088830 ?auto_2088832 ) ) ( not ( = ?auto_2088830 ?auto_2088833 ) ) ( not ( = ?auto_2088830 ?auto_2088834 ) ) ( not ( = ?auto_2088830 ?auto_2088835 ) ) ( not ( = ?auto_2088830 ?auto_2088836 ) ) ( not ( = ?auto_2088830 ?auto_2088837 ) ) ( not ( = ?auto_2088830 ?auto_2088838 ) ) ( not ( = ?auto_2088830 ?auto_2088839 ) ) ( not ( = ?auto_2088830 ?auto_2088841 ) ) ( not ( = ?auto_2088832 ?auto_2088833 ) ) ( not ( = ?auto_2088832 ?auto_2088834 ) ) ( not ( = ?auto_2088832 ?auto_2088835 ) ) ( not ( = ?auto_2088832 ?auto_2088836 ) ) ( not ( = ?auto_2088832 ?auto_2088837 ) ) ( not ( = ?auto_2088832 ?auto_2088838 ) ) ( not ( = ?auto_2088832 ?auto_2088839 ) ) ( not ( = ?auto_2088832 ?auto_2088841 ) ) ( not ( = ?auto_2088833 ?auto_2088834 ) ) ( not ( = ?auto_2088833 ?auto_2088835 ) ) ( not ( = ?auto_2088833 ?auto_2088836 ) ) ( not ( = ?auto_2088833 ?auto_2088837 ) ) ( not ( = ?auto_2088833 ?auto_2088838 ) ) ( not ( = ?auto_2088833 ?auto_2088839 ) ) ( not ( = ?auto_2088833 ?auto_2088841 ) ) ( not ( = ?auto_2088834 ?auto_2088835 ) ) ( not ( = ?auto_2088834 ?auto_2088836 ) ) ( not ( = ?auto_2088834 ?auto_2088837 ) ) ( not ( = ?auto_2088834 ?auto_2088838 ) ) ( not ( = ?auto_2088834 ?auto_2088839 ) ) ( not ( = ?auto_2088834 ?auto_2088841 ) ) ( not ( = ?auto_2088835 ?auto_2088836 ) ) ( not ( = ?auto_2088835 ?auto_2088837 ) ) ( not ( = ?auto_2088835 ?auto_2088838 ) ) ( not ( = ?auto_2088835 ?auto_2088839 ) ) ( not ( = ?auto_2088835 ?auto_2088841 ) ) ( not ( = ?auto_2088836 ?auto_2088837 ) ) ( not ( = ?auto_2088836 ?auto_2088838 ) ) ( not ( = ?auto_2088836 ?auto_2088839 ) ) ( not ( = ?auto_2088836 ?auto_2088841 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2088837 ?auto_2088838 ?auto_2088839 )
      ( MAKE-14CRATE-VERIFY ?auto_2088826 ?auto_2088827 ?auto_2088828 ?auto_2088825 ?auto_2088829 ?auto_2088831 ?auto_2088830 ?auto_2088832 ?auto_2088833 ?auto_2088834 ?auto_2088835 ?auto_2088836 ?auto_2088837 ?auto_2088838 ?auto_2088839 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2089030 - SURFACE
      ?auto_2089031 - SURFACE
      ?auto_2089032 - SURFACE
      ?auto_2089029 - SURFACE
      ?auto_2089033 - SURFACE
      ?auto_2089035 - SURFACE
      ?auto_2089034 - SURFACE
      ?auto_2089036 - SURFACE
      ?auto_2089037 - SURFACE
      ?auto_2089038 - SURFACE
      ?auto_2089039 - SURFACE
      ?auto_2089040 - SURFACE
      ?auto_2089041 - SURFACE
      ?auto_2089042 - SURFACE
      ?auto_2089043 - SURFACE
    )
    :vars
    (
      ?auto_2089049 - HOIST
      ?auto_2089044 - PLACE
      ?auto_2089047 - PLACE
      ?auto_2089045 - HOIST
      ?auto_2089048 - SURFACE
      ?auto_2089046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2089049 ?auto_2089044 ) ( SURFACE-AT ?auto_2089042 ?auto_2089044 ) ( CLEAR ?auto_2089042 ) ( IS-CRATE ?auto_2089043 ) ( not ( = ?auto_2089042 ?auto_2089043 ) ) ( AVAILABLE ?auto_2089049 ) ( ON ?auto_2089042 ?auto_2089041 ) ( not ( = ?auto_2089041 ?auto_2089042 ) ) ( not ( = ?auto_2089041 ?auto_2089043 ) ) ( not ( = ?auto_2089047 ?auto_2089044 ) ) ( HOIST-AT ?auto_2089045 ?auto_2089047 ) ( not ( = ?auto_2089049 ?auto_2089045 ) ) ( AVAILABLE ?auto_2089045 ) ( SURFACE-AT ?auto_2089043 ?auto_2089047 ) ( ON ?auto_2089043 ?auto_2089048 ) ( CLEAR ?auto_2089043 ) ( not ( = ?auto_2089042 ?auto_2089048 ) ) ( not ( = ?auto_2089043 ?auto_2089048 ) ) ( not ( = ?auto_2089041 ?auto_2089048 ) ) ( TRUCK-AT ?auto_2089046 ?auto_2089044 ) ( ON ?auto_2089031 ?auto_2089030 ) ( ON ?auto_2089032 ?auto_2089031 ) ( ON ?auto_2089029 ?auto_2089032 ) ( ON ?auto_2089033 ?auto_2089029 ) ( ON ?auto_2089035 ?auto_2089033 ) ( ON ?auto_2089034 ?auto_2089035 ) ( ON ?auto_2089036 ?auto_2089034 ) ( ON ?auto_2089037 ?auto_2089036 ) ( ON ?auto_2089038 ?auto_2089037 ) ( ON ?auto_2089039 ?auto_2089038 ) ( ON ?auto_2089040 ?auto_2089039 ) ( ON ?auto_2089041 ?auto_2089040 ) ( not ( = ?auto_2089030 ?auto_2089031 ) ) ( not ( = ?auto_2089030 ?auto_2089032 ) ) ( not ( = ?auto_2089030 ?auto_2089029 ) ) ( not ( = ?auto_2089030 ?auto_2089033 ) ) ( not ( = ?auto_2089030 ?auto_2089035 ) ) ( not ( = ?auto_2089030 ?auto_2089034 ) ) ( not ( = ?auto_2089030 ?auto_2089036 ) ) ( not ( = ?auto_2089030 ?auto_2089037 ) ) ( not ( = ?auto_2089030 ?auto_2089038 ) ) ( not ( = ?auto_2089030 ?auto_2089039 ) ) ( not ( = ?auto_2089030 ?auto_2089040 ) ) ( not ( = ?auto_2089030 ?auto_2089041 ) ) ( not ( = ?auto_2089030 ?auto_2089042 ) ) ( not ( = ?auto_2089030 ?auto_2089043 ) ) ( not ( = ?auto_2089030 ?auto_2089048 ) ) ( not ( = ?auto_2089031 ?auto_2089032 ) ) ( not ( = ?auto_2089031 ?auto_2089029 ) ) ( not ( = ?auto_2089031 ?auto_2089033 ) ) ( not ( = ?auto_2089031 ?auto_2089035 ) ) ( not ( = ?auto_2089031 ?auto_2089034 ) ) ( not ( = ?auto_2089031 ?auto_2089036 ) ) ( not ( = ?auto_2089031 ?auto_2089037 ) ) ( not ( = ?auto_2089031 ?auto_2089038 ) ) ( not ( = ?auto_2089031 ?auto_2089039 ) ) ( not ( = ?auto_2089031 ?auto_2089040 ) ) ( not ( = ?auto_2089031 ?auto_2089041 ) ) ( not ( = ?auto_2089031 ?auto_2089042 ) ) ( not ( = ?auto_2089031 ?auto_2089043 ) ) ( not ( = ?auto_2089031 ?auto_2089048 ) ) ( not ( = ?auto_2089032 ?auto_2089029 ) ) ( not ( = ?auto_2089032 ?auto_2089033 ) ) ( not ( = ?auto_2089032 ?auto_2089035 ) ) ( not ( = ?auto_2089032 ?auto_2089034 ) ) ( not ( = ?auto_2089032 ?auto_2089036 ) ) ( not ( = ?auto_2089032 ?auto_2089037 ) ) ( not ( = ?auto_2089032 ?auto_2089038 ) ) ( not ( = ?auto_2089032 ?auto_2089039 ) ) ( not ( = ?auto_2089032 ?auto_2089040 ) ) ( not ( = ?auto_2089032 ?auto_2089041 ) ) ( not ( = ?auto_2089032 ?auto_2089042 ) ) ( not ( = ?auto_2089032 ?auto_2089043 ) ) ( not ( = ?auto_2089032 ?auto_2089048 ) ) ( not ( = ?auto_2089029 ?auto_2089033 ) ) ( not ( = ?auto_2089029 ?auto_2089035 ) ) ( not ( = ?auto_2089029 ?auto_2089034 ) ) ( not ( = ?auto_2089029 ?auto_2089036 ) ) ( not ( = ?auto_2089029 ?auto_2089037 ) ) ( not ( = ?auto_2089029 ?auto_2089038 ) ) ( not ( = ?auto_2089029 ?auto_2089039 ) ) ( not ( = ?auto_2089029 ?auto_2089040 ) ) ( not ( = ?auto_2089029 ?auto_2089041 ) ) ( not ( = ?auto_2089029 ?auto_2089042 ) ) ( not ( = ?auto_2089029 ?auto_2089043 ) ) ( not ( = ?auto_2089029 ?auto_2089048 ) ) ( not ( = ?auto_2089033 ?auto_2089035 ) ) ( not ( = ?auto_2089033 ?auto_2089034 ) ) ( not ( = ?auto_2089033 ?auto_2089036 ) ) ( not ( = ?auto_2089033 ?auto_2089037 ) ) ( not ( = ?auto_2089033 ?auto_2089038 ) ) ( not ( = ?auto_2089033 ?auto_2089039 ) ) ( not ( = ?auto_2089033 ?auto_2089040 ) ) ( not ( = ?auto_2089033 ?auto_2089041 ) ) ( not ( = ?auto_2089033 ?auto_2089042 ) ) ( not ( = ?auto_2089033 ?auto_2089043 ) ) ( not ( = ?auto_2089033 ?auto_2089048 ) ) ( not ( = ?auto_2089035 ?auto_2089034 ) ) ( not ( = ?auto_2089035 ?auto_2089036 ) ) ( not ( = ?auto_2089035 ?auto_2089037 ) ) ( not ( = ?auto_2089035 ?auto_2089038 ) ) ( not ( = ?auto_2089035 ?auto_2089039 ) ) ( not ( = ?auto_2089035 ?auto_2089040 ) ) ( not ( = ?auto_2089035 ?auto_2089041 ) ) ( not ( = ?auto_2089035 ?auto_2089042 ) ) ( not ( = ?auto_2089035 ?auto_2089043 ) ) ( not ( = ?auto_2089035 ?auto_2089048 ) ) ( not ( = ?auto_2089034 ?auto_2089036 ) ) ( not ( = ?auto_2089034 ?auto_2089037 ) ) ( not ( = ?auto_2089034 ?auto_2089038 ) ) ( not ( = ?auto_2089034 ?auto_2089039 ) ) ( not ( = ?auto_2089034 ?auto_2089040 ) ) ( not ( = ?auto_2089034 ?auto_2089041 ) ) ( not ( = ?auto_2089034 ?auto_2089042 ) ) ( not ( = ?auto_2089034 ?auto_2089043 ) ) ( not ( = ?auto_2089034 ?auto_2089048 ) ) ( not ( = ?auto_2089036 ?auto_2089037 ) ) ( not ( = ?auto_2089036 ?auto_2089038 ) ) ( not ( = ?auto_2089036 ?auto_2089039 ) ) ( not ( = ?auto_2089036 ?auto_2089040 ) ) ( not ( = ?auto_2089036 ?auto_2089041 ) ) ( not ( = ?auto_2089036 ?auto_2089042 ) ) ( not ( = ?auto_2089036 ?auto_2089043 ) ) ( not ( = ?auto_2089036 ?auto_2089048 ) ) ( not ( = ?auto_2089037 ?auto_2089038 ) ) ( not ( = ?auto_2089037 ?auto_2089039 ) ) ( not ( = ?auto_2089037 ?auto_2089040 ) ) ( not ( = ?auto_2089037 ?auto_2089041 ) ) ( not ( = ?auto_2089037 ?auto_2089042 ) ) ( not ( = ?auto_2089037 ?auto_2089043 ) ) ( not ( = ?auto_2089037 ?auto_2089048 ) ) ( not ( = ?auto_2089038 ?auto_2089039 ) ) ( not ( = ?auto_2089038 ?auto_2089040 ) ) ( not ( = ?auto_2089038 ?auto_2089041 ) ) ( not ( = ?auto_2089038 ?auto_2089042 ) ) ( not ( = ?auto_2089038 ?auto_2089043 ) ) ( not ( = ?auto_2089038 ?auto_2089048 ) ) ( not ( = ?auto_2089039 ?auto_2089040 ) ) ( not ( = ?auto_2089039 ?auto_2089041 ) ) ( not ( = ?auto_2089039 ?auto_2089042 ) ) ( not ( = ?auto_2089039 ?auto_2089043 ) ) ( not ( = ?auto_2089039 ?auto_2089048 ) ) ( not ( = ?auto_2089040 ?auto_2089041 ) ) ( not ( = ?auto_2089040 ?auto_2089042 ) ) ( not ( = ?auto_2089040 ?auto_2089043 ) ) ( not ( = ?auto_2089040 ?auto_2089048 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2089041 ?auto_2089042 ?auto_2089043 )
      ( MAKE-14CRATE-VERIFY ?auto_2089030 ?auto_2089031 ?auto_2089032 ?auto_2089029 ?auto_2089033 ?auto_2089035 ?auto_2089034 ?auto_2089036 ?auto_2089037 ?auto_2089038 ?auto_2089039 ?auto_2089040 ?auto_2089041 ?auto_2089042 ?auto_2089043 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2089234 - SURFACE
      ?auto_2089235 - SURFACE
      ?auto_2089236 - SURFACE
      ?auto_2089233 - SURFACE
      ?auto_2089237 - SURFACE
      ?auto_2089239 - SURFACE
      ?auto_2089238 - SURFACE
      ?auto_2089240 - SURFACE
      ?auto_2089241 - SURFACE
      ?auto_2089242 - SURFACE
      ?auto_2089243 - SURFACE
      ?auto_2089244 - SURFACE
      ?auto_2089245 - SURFACE
      ?auto_2089246 - SURFACE
      ?auto_2089247 - SURFACE
    )
    :vars
    (
      ?auto_2089251 - HOIST
      ?auto_2089249 - PLACE
      ?auto_2089253 - PLACE
      ?auto_2089248 - HOIST
      ?auto_2089250 - SURFACE
      ?auto_2089252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2089251 ?auto_2089249 ) ( IS-CRATE ?auto_2089247 ) ( not ( = ?auto_2089246 ?auto_2089247 ) ) ( not ( = ?auto_2089245 ?auto_2089246 ) ) ( not ( = ?auto_2089245 ?auto_2089247 ) ) ( not ( = ?auto_2089253 ?auto_2089249 ) ) ( HOIST-AT ?auto_2089248 ?auto_2089253 ) ( not ( = ?auto_2089251 ?auto_2089248 ) ) ( AVAILABLE ?auto_2089248 ) ( SURFACE-AT ?auto_2089247 ?auto_2089253 ) ( ON ?auto_2089247 ?auto_2089250 ) ( CLEAR ?auto_2089247 ) ( not ( = ?auto_2089246 ?auto_2089250 ) ) ( not ( = ?auto_2089247 ?auto_2089250 ) ) ( not ( = ?auto_2089245 ?auto_2089250 ) ) ( TRUCK-AT ?auto_2089252 ?auto_2089249 ) ( SURFACE-AT ?auto_2089245 ?auto_2089249 ) ( CLEAR ?auto_2089245 ) ( LIFTING ?auto_2089251 ?auto_2089246 ) ( IS-CRATE ?auto_2089246 ) ( ON ?auto_2089235 ?auto_2089234 ) ( ON ?auto_2089236 ?auto_2089235 ) ( ON ?auto_2089233 ?auto_2089236 ) ( ON ?auto_2089237 ?auto_2089233 ) ( ON ?auto_2089239 ?auto_2089237 ) ( ON ?auto_2089238 ?auto_2089239 ) ( ON ?auto_2089240 ?auto_2089238 ) ( ON ?auto_2089241 ?auto_2089240 ) ( ON ?auto_2089242 ?auto_2089241 ) ( ON ?auto_2089243 ?auto_2089242 ) ( ON ?auto_2089244 ?auto_2089243 ) ( ON ?auto_2089245 ?auto_2089244 ) ( not ( = ?auto_2089234 ?auto_2089235 ) ) ( not ( = ?auto_2089234 ?auto_2089236 ) ) ( not ( = ?auto_2089234 ?auto_2089233 ) ) ( not ( = ?auto_2089234 ?auto_2089237 ) ) ( not ( = ?auto_2089234 ?auto_2089239 ) ) ( not ( = ?auto_2089234 ?auto_2089238 ) ) ( not ( = ?auto_2089234 ?auto_2089240 ) ) ( not ( = ?auto_2089234 ?auto_2089241 ) ) ( not ( = ?auto_2089234 ?auto_2089242 ) ) ( not ( = ?auto_2089234 ?auto_2089243 ) ) ( not ( = ?auto_2089234 ?auto_2089244 ) ) ( not ( = ?auto_2089234 ?auto_2089245 ) ) ( not ( = ?auto_2089234 ?auto_2089246 ) ) ( not ( = ?auto_2089234 ?auto_2089247 ) ) ( not ( = ?auto_2089234 ?auto_2089250 ) ) ( not ( = ?auto_2089235 ?auto_2089236 ) ) ( not ( = ?auto_2089235 ?auto_2089233 ) ) ( not ( = ?auto_2089235 ?auto_2089237 ) ) ( not ( = ?auto_2089235 ?auto_2089239 ) ) ( not ( = ?auto_2089235 ?auto_2089238 ) ) ( not ( = ?auto_2089235 ?auto_2089240 ) ) ( not ( = ?auto_2089235 ?auto_2089241 ) ) ( not ( = ?auto_2089235 ?auto_2089242 ) ) ( not ( = ?auto_2089235 ?auto_2089243 ) ) ( not ( = ?auto_2089235 ?auto_2089244 ) ) ( not ( = ?auto_2089235 ?auto_2089245 ) ) ( not ( = ?auto_2089235 ?auto_2089246 ) ) ( not ( = ?auto_2089235 ?auto_2089247 ) ) ( not ( = ?auto_2089235 ?auto_2089250 ) ) ( not ( = ?auto_2089236 ?auto_2089233 ) ) ( not ( = ?auto_2089236 ?auto_2089237 ) ) ( not ( = ?auto_2089236 ?auto_2089239 ) ) ( not ( = ?auto_2089236 ?auto_2089238 ) ) ( not ( = ?auto_2089236 ?auto_2089240 ) ) ( not ( = ?auto_2089236 ?auto_2089241 ) ) ( not ( = ?auto_2089236 ?auto_2089242 ) ) ( not ( = ?auto_2089236 ?auto_2089243 ) ) ( not ( = ?auto_2089236 ?auto_2089244 ) ) ( not ( = ?auto_2089236 ?auto_2089245 ) ) ( not ( = ?auto_2089236 ?auto_2089246 ) ) ( not ( = ?auto_2089236 ?auto_2089247 ) ) ( not ( = ?auto_2089236 ?auto_2089250 ) ) ( not ( = ?auto_2089233 ?auto_2089237 ) ) ( not ( = ?auto_2089233 ?auto_2089239 ) ) ( not ( = ?auto_2089233 ?auto_2089238 ) ) ( not ( = ?auto_2089233 ?auto_2089240 ) ) ( not ( = ?auto_2089233 ?auto_2089241 ) ) ( not ( = ?auto_2089233 ?auto_2089242 ) ) ( not ( = ?auto_2089233 ?auto_2089243 ) ) ( not ( = ?auto_2089233 ?auto_2089244 ) ) ( not ( = ?auto_2089233 ?auto_2089245 ) ) ( not ( = ?auto_2089233 ?auto_2089246 ) ) ( not ( = ?auto_2089233 ?auto_2089247 ) ) ( not ( = ?auto_2089233 ?auto_2089250 ) ) ( not ( = ?auto_2089237 ?auto_2089239 ) ) ( not ( = ?auto_2089237 ?auto_2089238 ) ) ( not ( = ?auto_2089237 ?auto_2089240 ) ) ( not ( = ?auto_2089237 ?auto_2089241 ) ) ( not ( = ?auto_2089237 ?auto_2089242 ) ) ( not ( = ?auto_2089237 ?auto_2089243 ) ) ( not ( = ?auto_2089237 ?auto_2089244 ) ) ( not ( = ?auto_2089237 ?auto_2089245 ) ) ( not ( = ?auto_2089237 ?auto_2089246 ) ) ( not ( = ?auto_2089237 ?auto_2089247 ) ) ( not ( = ?auto_2089237 ?auto_2089250 ) ) ( not ( = ?auto_2089239 ?auto_2089238 ) ) ( not ( = ?auto_2089239 ?auto_2089240 ) ) ( not ( = ?auto_2089239 ?auto_2089241 ) ) ( not ( = ?auto_2089239 ?auto_2089242 ) ) ( not ( = ?auto_2089239 ?auto_2089243 ) ) ( not ( = ?auto_2089239 ?auto_2089244 ) ) ( not ( = ?auto_2089239 ?auto_2089245 ) ) ( not ( = ?auto_2089239 ?auto_2089246 ) ) ( not ( = ?auto_2089239 ?auto_2089247 ) ) ( not ( = ?auto_2089239 ?auto_2089250 ) ) ( not ( = ?auto_2089238 ?auto_2089240 ) ) ( not ( = ?auto_2089238 ?auto_2089241 ) ) ( not ( = ?auto_2089238 ?auto_2089242 ) ) ( not ( = ?auto_2089238 ?auto_2089243 ) ) ( not ( = ?auto_2089238 ?auto_2089244 ) ) ( not ( = ?auto_2089238 ?auto_2089245 ) ) ( not ( = ?auto_2089238 ?auto_2089246 ) ) ( not ( = ?auto_2089238 ?auto_2089247 ) ) ( not ( = ?auto_2089238 ?auto_2089250 ) ) ( not ( = ?auto_2089240 ?auto_2089241 ) ) ( not ( = ?auto_2089240 ?auto_2089242 ) ) ( not ( = ?auto_2089240 ?auto_2089243 ) ) ( not ( = ?auto_2089240 ?auto_2089244 ) ) ( not ( = ?auto_2089240 ?auto_2089245 ) ) ( not ( = ?auto_2089240 ?auto_2089246 ) ) ( not ( = ?auto_2089240 ?auto_2089247 ) ) ( not ( = ?auto_2089240 ?auto_2089250 ) ) ( not ( = ?auto_2089241 ?auto_2089242 ) ) ( not ( = ?auto_2089241 ?auto_2089243 ) ) ( not ( = ?auto_2089241 ?auto_2089244 ) ) ( not ( = ?auto_2089241 ?auto_2089245 ) ) ( not ( = ?auto_2089241 ?auto_2089246 ) ) ( not ( = ?auto_2089241 ?auto_2089247 ) ) ( not ( = ?auto_2089241 ?auto_2089250 ) ) ( not ( = ?auto_2089242 ?auto_2089243 ) ) ( not ( = ?auto_2089242 ?auto_2089244 ) ) ( not ( = ?auto_2089242 ?auto_2089245 ) ) ( not ( = ?auto_2089242 ?auto_2089246 ) ) ( not ( = ?auto_2089242 ?auto_2089247 ) ) ( not ( = ?auto_2089242 ?auto_2089250 ) ) ( not ( = ?auto_2089243 ?auto_2089244 ) ) ( not ( = ?auto_2089243 ?auto_2089245 ) ) ( not ( = ?auto_2089243 ?auto_2089246 ) ) ( not ( = ?auto_2089243 ?auto_2089247 ) ) ( not ( = ?auto_2089243 ?auto_2089250 ) ) ( not ( = ?auto_2089244 ?auto_2089245 ) ) ( not ( = ?auto_2089244 ?auto_2089246 ) ) ( not ( = ?auto_2089244 ?auto_2089247 ) ) ( not ( = ?auto_2089244 ?auto_2089250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2089245 ?auto_2089246 ?auto_2089247 )
      ( MAKE-14CRATE-VERIFY ?auto_2089234 ?auto_2089235 ?auto_2089236 ?auto_2089233 ?auto_2089237 ?auto_2089239 ?auto_2089238 ?auto_2089240 ?auto_2089241 ?auto_2089242 ?auto_2089243 ?auto_2089244 ?auto_2089245 ?auto_2089246 ?auto_2089247 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2089438 - SURFACE
      ?auto_2089439 - SURFACE
      ?auto_2089440 - SURFACE
      ?auto_2089437 - SURFACE
      ?auto_2089441 - SURFACE
      ?auto_2089443 - SURFACE
      ?auto_2089442 - SURFACE
      ?auto_2089444 - SURFACE
      ?auto_2089445 - SURFACE
      ?auto_2089446 - SURFACE
      ?auto_2089447 - SURFACE
      ?auto_2089448 - SURFACE
      ?auto_2089449 - SURFACE
      ?auto_2089450 - SURFACE
      ?auto_2089451 - SURFACE
    )
    :vars
    (
      ?auto_2089453 - HOIST
      ?auto_2089452 - PLACE
      ?auto_2089456 - PLACE
      ?auto_2089457 - HOIST
      ?auto_2089454 - SURFACE
      ?auto_2089455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2089453 ?auto_2089452 ) ( IS-CRATE ?auto_2089451 ) ( not ( = ?auto_2089450 ?auto_2089451 ) ) ( not ( = ?auto_2089449 ?auto_2089450 ) ) ( not ( = ?auto_2089449 ?auto_2089451 ) ) ( not ( = ?auto_2089456 ?auto_2089452 ) ) ( HOIST-AT ?auto_2089457 ?auto_2089456 ) ( not ( = ?auto_2089453 ?auto_2089457 ) ) ( AVAILABLE ?auto_2089457 ) ( SURFACE-AT ?auto_2089451 ?auto_2089456 ) ( ON ?auto_2089451 ?auto_2089454 ) ( CLEAR ?auto_2089451 ) ( not ( = ?auto_2089450 ?auto_2089454 ) ) ( not ( = ?auto_2089451 ?auto_2089454 ) ) ( not ( = ?auto_2089449 ?auto_2089454 ) ) ( TRUCK-AT ?auto_2089455 ?auto_2089452 ) ( SURFACE-AT ?auto_2089449 ?auto_2089452 ) ( CLEAR ?auto_2089449 ) ( IS-CRATE ?auto_2089450 ) ( AVAILABLE ?auto_2089453 ) ( IN ?auto_2089450 ?auto_2089455 ) ( ON ?auto_2089439 ?auto_2089438 ) ( ON ?auto_2089440 ?auto_2089439 ) ( ON ?auto_2089437 ?auto_2089440 ) ( ON ?auto_2089441 ?auto_2089437 ) ( ON ?auto_2089443 ?auto_2089441 ) ( ON ?auto_2089442 ?auto_2089443 ) ( ON ?auto_2089444 ?auto_2089442 ) ( ON ?auto_2089445 ?auto_2089444 ) ( ON ?auto_2089446 ?auto_2089445 ) ( ON ?auto_2089447 ?auto_2089446 ) ( ON ?auto_2089448 ?auto_2089447 ) ( ON ?auto_2089449 ?auto_2089448 ) ( not ( = ?auto_2089438 ?auto_2089439 ) ) ( not ( = ?auto_2089438 ?auto_2089440 ) ) ( not ( = ?auto_2089438 ?auto_2089437 ) ) ( not ( = ?auto_2089438 ?auto_2089441 ) ) ( not ( = ?auto_2089438 ?auto_2089443 ) ) ( not ( = ?auto_2089438 ?auto_2089442 ) ) ( not ( = ?auto_2089438 ?auto_2089444 ) ) ( not ( = ?auto_2089438 ?auto_2089445 ) ) ( not ( = ?auto_2089438 ?auto_2089446 ) ) ( not ( = ?auto_2089438 ?auto_2089447 ) ) ( not ( = ?auto_2089438 ?auto_2089448 ) ) ( not ( = ?auto_2089438 ?auto_2089449 ) ) ( not ( = ?auto_2089438 ?auto_2089450 ) ) ( not ( = ?auto_2089438 ?auto_2089451 ) ) ( not ( = ?auto_2089438 ?auto_2089454 ) ) ( not ( = ?auto_2089439 ?auto_2089440 ) ) ( not ( = ?auto_2089439 ?auto_2089437 ) ) ( not ( = ?auto_2089439 ?auto_2089441 ) ) ( not ( = ?auto_2089439 ?auto_2089443 ) ) ( not ( = ?auto_2089439 ?auto_2089442 ) ) ( not ( = ?auto_2089439 ?auto_2089444 ) ) ( not ( = ?auto_2089439 ?auto_2089445 ) ) ( not ( = ?auto_2089439 ?auto_2089446 ) ) ( not ( = ?auto_2089439 ?auto_2089447 ) ) ( not ( = ?auto_2089439 ?auto_2089448 ) ) ( not ( = ?auto_2089439 ?auto_2089449 ) ) ( not ( = ?auto_2089439 ?auto_2089450 ) ) ( not ( = ?auto_2089439 ?auto_2089451 ) ) ( not ( = ?auto_2089439 ?auto_2089454 ) ) ( not ( = ?auto_2089440 ?auto_2089437 ) ) ( not ( = ?auto_2089440 ?auto_2089441 ) ) ( not ( = ?auto_2089440 ?auto_2089443 ) ) ( not ( = ?auto_2089440 ?auto_2089442 ) ) ( not ( = ?auto_2089440 ?auto_2089444 ) ) ( not ( = ?auto_2089440 ?auto_2089445 ) ) ( not ( = ?auto_2089440 ?auto_2089446 ) ) ( not ( = ?auto_2089440 ?auto_2089447 ) ) ( not ( = ?auto_2089440 ?auto_2089448 ) ) ( not ( = ?auto_2089440 ?auto_2089449 ) ) ( not ( = ?auto_2089440 ?auto_2089450 ) ) ( not ( = ?auto_2089440 ?auto_2089451 ) ) ( not ( = ?auto_2089440 ?auto_2089454 ) ) ( not ( = ?auto_2089437 ?auto_2089441 ) ) ( not ( = ?auto_2089437 ?auto_2089443 ) ) ( not ( = ?auto_2089437 ?auto_2089442 ) ) ( not ( = ?auto_2089437 ?auto_2089444 ) ) ( not ( = ?auto_2089437 ?auto_2089445 ) ) ( not ( = ?auto_2089437 ?auto_2089446 ) ) ( not ( = ?auto_2089437 ?auto_2089447 ) ) ( not ( = ?auto_2089437 ?auto_2089448 ) ) ( not ( = ?auto_2089437 ?auto_2089449 ) ) ( not ( = ?auto_2089437 ?auto_2089450 ) ) ( not ( = ?auto_2089437 ?auto_2089451 ) ) ( not ( = ?auto_2089437 ?auto_2089454 ) ) ( not ( = ?auto_2089441 ?auto_2089443 ) ) ( not ( = ?auto_2089441 ?auto_2089442 ) ) ( not ( = ?auto_2089441 ?auto_2089444 ) ) ( not ( = ?auto_2089441 ?auto_2089445 ) ) ( not ( = ?auto_2089441 ?auto_2089446 ) ) ( not ( = ?auto_2089441 ?auto_2089447 ) ) ( not ( = ?auto_2089441 ?auto_2089448 ) ) ( not ( = ?auto_2089441 ?auto_2089449 ) ) ( not ( = ?auto_2089441 ?auto_2089450 ) ) ( not ( = ?auto_2089441 ?auto_2089451 ) ) ( not ( = ?auto_2089441 ?auto_2089454 ) ) ( not ( = ?auto_2089443 ?auto_2089442 ) ) ( not ( = ?auto_2089443 ?auto_2089444 ) ) ( not ( = ?auto_2089443 ?auto_2089445 ) ) ( not ( = ?auto_2089443 ?auto_2089446 ) ) ( not ( = ?auto_2089443 ?auto_2089447 ) ) ( not ( = ?auto_2089443 ?auto_2089448 ) ) ( not ( = ?auto_2089443 ?auto_2089449 ) ) ( not ( = ?auto_2089443 ?auto_2089450 ) ) ( not ( = ?auto_2089443 ?auto_2089451 ) ) ( not ( = ?auto_2089443 ?auto_2089454 ) ) ( not ( = ?auto_2089442 ?auto_2089444 ) ) ( not ( = ?auto_2089442 ?auto_2089445 ) ) ( not ( = ?auto_2089442 ?auto_2089446 ) ) ( not ( = ?auto_2089442 ?auto_2089447 ) ) ( not ( = ?auto_2089442 ?auto_2089448 ) ) ( not ( = ?auto_2089442 ?auto_2089449 ) ) ( not ( = ?auto_2089442 ?auto_2089450 ) ) ( not ( = ?auto_2089442 ?auto_2089451 ) ) ( not ( = ?auto_2089442 ?auto_2089454 ) ) ( not ( = ?auto_2089444 ?auto_2089445 ) ) ( not ( = ?auto_2089444 ?auto_2089446 ) ) ( not ( = ?auto_2089444 ?auto_2089447 ) ) ( not ( = ?auto_2089444 ?auto_2089448 ) ) ( not ( = ?auto_2089444 ?auto_2089449 ) ) ( not ( = ?auto_2089444 ?auto_2089450 ) ) ( not ( = ?auto_2089444 ?auto_2089451 ) ) ( not ( = ?auto_2089444 ?auto_2089454 ) ) ( not ( = ?auto_2089445 ?auto_2089446 ) ) ( not ( = ?auto_2089445 ?auto_2089447 ) ) ( not ( = ?auto_2089445 ?auto_2089448 ) ) ( not ( = ?auto_2089445 ?auto_2089449 ) ) ( not ( = ?auto_2089445 ?auto_2089450 ) ) ( not ( = ?auto_2089445 ?auto_2089451 ) ) ( not ( = ?auto_2089445 ?auto_2089454 ) ) ( not ( = ?auto_2089446 ?auto_2089447 ) ) ( not ( = ?auto_2089446 ?auto_2089448 ) ) ( not ( = ?auto_2089446 ?auto_2089449 ) ) ( not ( = ?auto_2089446 ?auto_2089450 ) ) ( not ( = ?auto_2089446 ?auto_2089451 ) ) ( not ( = ?auto_2089446 ?auto_2089454 ) ) ( not ( = ?auto_2089447 ?auto_2089448 ) ) ( not ( = ?auto_2089447 ?auto_2089449 ) ) ( not ( = ?auto_2089447 ?auto_2089450 ) ) ( not ( = ?auto_2089447 ?auto_2089451 ) ) ( not ( = ?auto_2089447 ?auto_2089454 ) ) ( not ( = ?auto_2089448 ?auto_2089449 ) ) ( not ( = ?auto_2089448 ?auto_2089450 ) ) ( not ( = ?auto_2089448 ?auto_2089451 ) ) ( not ( = ?auto_2089448 ?auto_2089454 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2089449 ?auto_2089450 ?auto_2089451 )
      ( MAKE-14CRATE-VERIFY ?auto_2089438 ?auto_2089439 ?auto_2089440 ?auto_2089437 ?auto_2089441 ?auto_2089443 ?auto_2089442 ?auto_2089444 ?auto_2089445 ?auto_2089446 ?auto_2089447 ?auto_2089448 ?auto_2089449 ?auto_2089450 ?auto_2089451 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2106598 - SURFACE
      ?auto_2106599 - SURFACE
      ?auto_2106600 - SURFACE
      ?auto_2106597 - SURFACE
      ?auto_2106601 - SURFACE
      ?auto_2106603 - SURFACE
      ?auto_2106602 - SURFACE
      ?auto_2106604 - SURFACE
      ?auto_2106605 - SURFACE
      ?auto_2106606 - SURFACE
      ?auto_2106607 - SURFACE
      ?auto_2106608 - SURFACE
      ?auto_2106609 - SURFACE
      ?auto_2106610 - SURFACE
      ?auto_2106611 - SURFACE
      ?auto_2106612 - SURFACE
    )
    :vars
    (
      ?auto_2106613 - HOIST
      ?auto_2106614 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2106613 ?auto_2106614 ) ( SURFACE-AT ?auto_2106611 ?auto_2106614 ) ( CLEAR ?auto_2106611 ) ( LIFTING ?auto_2106613 ?auto_2106612 ) ( IS-CRATE ?auto_2106612 ) ( not ( = ?auto_2106611 ?auto_2106612 ) ) ( ON ?auto_2106599 ?auto_2106598 ) ( ON ?auto_2106600 ?auto_2106599 ) ( ON ?auto_2106597 ?auto_2106600 ) ( ON ?auto_2106601 ?auto_2106597 ) ( ON ?auto_2106603 ?auto_2106601 ) ( ON ?auto_2106602 ?auto_2106603 ) ( ON ?auto_2106604 ?auto_2106602 ) ( ON ?auto_2106605 ?auto_2106604 ) ( ON ?auto_2106606 ?auto_2106605 ) ( ON ?auto_2106607 ?auto_2106606 ) ( ON ?auto_2106608 ?auto_2106607 ) ( ON ?auto_2106609 ?auto_2106608 ) ( ON ?auto_2106610 ?auto_2106609 ) ( ON ?auto_2106611 ?auto_2106610 ) ( not ( = ?auto_2106598 ?auto_2106599 ) ) ( not ( = ?auto_2106598 ?auto_2106600 ) ) ( not ( = ?auto_2106598 ?auto_2106597 ) ) ( not ( = ?auto_2106598 ?auto_2106601 ) ) ( not ( = ?auto_2106598 ?auto_2106603 ) ) ( not ( = ?auto_2106598 ?auto_2106602 ) ) ( not ( = ?auto_2106598 ?auto_2106604 ) ) ( not ( = ?auto_2106598 ?auto_2106605 ) ) ( not ( = ?auto_2106598 ?auto_2106606 ) ) ( not ( = ?auto_2106598 ?auto_2106607 ) ) ( not ( = ?auto_2106598 ?auto_2106608 ) ) ( not ( = ?auto_2106598 ?auto_2106609 ) ) ( not ( = ?auto_2106598 ?auto_2106610 ) ) ( not ( = ?auto_2106598 ?auto_2106611 ) ) ( not ( = ?auto_2106598 ?auto_2106612 ) ) ( not ( = ?auto_2106599 ?auto_2106600 ) ) ( not ( = ?auto_2106599 ?auto_2106597 ) ) ( not ( = ?auto_2106599 ?auto_2106601 ) ) ( not ( = ?auto_2106599 ?auto_2106603 ) ) ( not ( = ?auto_2106599 ?auto_2106602 ) ) ( not ( = ?auto_2106599 ?auto_2106604 ) ) ( not ( = ?auto_2106599 ?auto_2106605 ) ) ( not ( = ?auto_2106599 ?auto_2106606 ) ) ( not ( = ?auto_2106599 ?auto_2106607 ) ) ( not ( = ?auto_2106599 ?auto_2106608 ) ) ( not ( = ?auto_2106599 ?auto_2106609 ) ) ( not ( = ?auto_2106599 ?auto_2106610 ) ) ( not ( = ?auto_2106599 ?auto_2106611 ) ) ( not ( = ?auto_2106599 ?auto_2106612 ) ) ( not ( = ?auto_2106600 ?auto_2106597 ) ) ( not ( = ?auto_2106600 ?auto_2106601 ) ) ( not ( = ?auto_2106600 ?auto_2106603 ) ) ( not ( = ?auto_2106600 ?auto_2106602 ) ) ( not ( = ?auto_2106600 ?auto_2106604 ) ) ( not ( = ?auto_2106600 ?auto_2106605 ) ) ( not ( = ?auto_2106600 ?auto_2106606 ) ) ( not ( = ?auto_2106600 ?auto_2106607 ) ) ( not ( = ?auto_2106600 ?auto_2106608 ) ) ( not ( = ?auto_2106600 ?auto_2106609 ) ) ( not ( = ?auto_2106600 ?auto_2106610 ) ) ( not ( = ?auto_2106600 ?auto_2106611 ) ) ( not ( = ?auto_2106600 ?auto_2106612 ) ) ( not ( = ?auto_2106597 ?auto_2106601 ) ) ( not ( = ?auto_2106597 ?auto_2106603 ) ) ( not ( = ?auto_2106597 ?auto_2106602 ) ) ( not ( = ?auto_2106597 ?auto_2106604 ) ) ( not ( = ?auto_2106597 ?auto_2106605 ) ) ( not ( = ?auto_2106597 ?auto_2106606 ) ) ( not ( = ?auto_2106597 ?auto_2106607 ) ) ( not ( = ?auto_2106597 ?auto_2106608 ) ) ( not ( = ?auto_2106597 ?auto_2106609 ) ) ( not ( = ?auto_2106597 ?auto_2106610 ) ) ( not ( = ?auto_2106597 ?auto_2106611 ) ) ( not ( = ?auto_2106597 ?auto_2106612 ) ) ( not ( = ?auto_2106601 ?auto_2106603 ) ) ( not ( = ?auto_2106601 ?auto_2106602 ) ) ( not ( = ?auto_2106601 ?auto_2106604 ) ) ( not ( = ?auto_2106601 ?auto_2106605 ) ) ( not ( = ?auto_2106601 ?auto_2106606 ) ) ( not ( = ?auto_2106601 ?auto_2106607 ) ) ( not ( = ?auto_2106601 ?auto_2106608 ) ) ( not ( = ?auto_2106601 ?auto_2106609 ) ) ( not ( = ?auto_2106601 ?auto_2106610 ) ) ( not ( = ?auto_2106601 ?auto_2106611 ) ) ( not ( = ?auto_2106601 ?auto_2106612 ) ) ( not ( = ?auto_2106603 ?auto_2106602 ) ) ( not ( = ?auto_2106603 ?auto_2106604 ) ) ( not ( = ?auto_2106603 ?auto_2106605 ) ) ( not ( = ?auto_2106603 ?auto_2106606 ) ) ( not ( = ?auto_2106603 ?auto_2106607 ) ) ( not ( = ?auto_2106603 ?auto_2106608 ) ) ( not ( = ?auto_2106603 ?auto_2106609 ) ) ( not ( = ?auto_2106603 ?auto_2106610 ) ) ( not ( = ?auto_2106603 ?auto_2106611 ) ) ( not ( = ?auto_2106603 ?auto_2106612 ) ) ( not ( = ?auto_2106602 ?auto_2106604 ) ) ( not ( = ?auto_2106602 ?auto_2106605 ) ) ( not ( = ?auto_2106602 ?auto_2106606 ) ) ( not ( = ?auto_2106602 ?auto_2106607 ) ) ( not ( = ?auto_2106602 ?auto_2106608 ) ) ( not ( = ?auto_2106602 ?auto_2106609 ) ) ( not ( = ?auto_2106602 ?auto_2106610 ) ) ( not ( = ?auto_2106602 ?auto_2106611 ) ) ( not ( = ?auto_2106602 ?auto_2106612 ) ) ( not ( = ?auto_2106604 ?auto_2106605 ) ) ( not ( = ?auto_2106604 ?auto_2106606 ) ) ( not ( = ?auto_2106604 ?auto_2106607 ) ) ( not ( = ?auto_2106604 ?auto_2106608 ) ) ( not ( = ?auto_2106604 ?auto_2106609 ) ) ( not ( = ?auto_2106604 ?auto_2106610 ) ) ( not ( = ?auto_2106604 ?auto_2106611 ) ) ( not ( = ?auto_2106604 ?auto_2106612 ) ) ( not ( = ?auto_2106605 ?auto_2106606 ) ) ( not ( = ?auto_2106605 ?auto_2106607 ) ) ( not ( = ?auto_2106605 ?auto_2106608 ) ) ( not ( = ?auto_2106605 ?auto_2106609 ) ) ( not ( = ?auto_2106605 ?auto_2106610 ) ) ( not ( = ?auto_2106605 ?auto_2106611 ) ) ( not ( = ?auto_2106605 ?auto_2106612 ) ) ( not ( = ?auto_2106606 ?auto_2106607 ) ) ( not ( = ?auto_2106606 ?auto_2106608 ) ) ( not ( = ?auto_2106606 ?auto_2106609 ) ) ( not ( = ?auto_2106606 ?auto_2106610 ) ) ( not ( = ?auto_2106606 ?auto_2106611 ) ) ( not ( = ?auto_2106606 ?auto_2106612 ) ) ( not ( = ?auto_2106607 ?auto_2106608 ) ) ( not ( = ?auto_2106607 ?auto_2106609 ) ) ( not ( = ?auto_2106607 ?auto_2106610 ) ) ( not ( = ?auto_2106607 ?auto_2106611 ) ) ( not ( = ?auto_2106607 ?auto_2106612 ) ) ( not ( = ?auto_2106608 ?auto_2106609 ) ) ( not ( = ?auto_2106608 ?auto_2106610 ) ) ( not ( = ?auto_2106608 ?auto_2106611 ) ) ( not ( = ?auto_2106608 ?auto_2106612 ) ) ( not ( = ?auto_2106609 ?auto_2106610 ) ) ( not ( = ?auto_2106609 ?auto_2106611 ) ) ( not ( = ?auto_2106609 ?auto_2106612 ) ) ( not ( = ?auto_2106610 ?auto_2106611 ) ) ( not ( = ?auto_2106610 ?auto_2106612 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2106611 ?auto_2106612 )
      ( MAKE-15CRATE-VERIFY ?auto_2106598 ?auto_2106599 ?auto_2106600 ?auto_2106597 ?auto_2106601 ?auto_2106603 ?auto_2106602 ?auto_2106604 ?auto_2106605 ?auto_2106606 ?auto_2106607 ?auto_2106608 ?auto_2106609 ?auto_2106610 ?auto_2106611 ?auto_2106612 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2106777 - SURFACE
      ?auto_2106778 - SURFACE
      ?auto_2106779 - SURFACE
      ?auto_2106776 - SURFACE
      ?auto_2106780 - SURFACE
      ?auto_2106782 - SURFACE
      ?auto_2106781 - SURFACE
      ?auto_2106783 - SURFACE
      ?auto_2106784 - SURFACE
      ?auto_2106785 - SURFACE
      ?auto_2106786 - SURFACE
      ?auto_2106787 - SURFACE
      ?auto_2106788 - SURFACE
      ?auto_2106789 - SURFACE
      ?auto_2106790 - SURFACE
      ?auto_2106791 - SURFACE
    )
    :vars
    (
      ?auto_2106794 - HOIST
      ?auto_2106793 - PLACE
      ?auto_2106792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2106794 ?auto_2106793 ) ( SURFACE-AT ?auto_2106790 ?auto_2106793 ) ( CLEAR ?auto_2106790 ) ( IS-CRATE ?auto_2106791 ) ( not ( = ?auto_2106790 ?auto_2106791 ) ) ( TRUCK-AT ?auto_2106792 ?auto_2106793 ) ( AVAILABLE ?auto_2106794 ) ( IN ?auto_2106791 ?auto_2106792 ) ( ON ?auto_2106790 ?auto_2106789 ) ( not ( = ?auto_2106789 ?auto_2106790 ) ) ( not ( = ?auto_2106789 ?auto_2106791 ) ) ( ON ?auto_2106778 ?auto_2106777 ) ( ON ?auto_2106779 ?auto_2106778 ) ( ON ?auto_2106776 ?auto_2106779 ) ( ON ?auto_2106780 ?auto_2106776 ) ( ON ?auto_2106782 ?auto_2106780 ) ( ON ?auto_2106781 ?auto_2106782 ) ( ON ?auto_2106783 ?auto_2106781 ) ( ON ?auto_2106784 ?auto_2106783 ) ( ON ?auto_2106785 ?auto_2106784 ) ( ON ?auto_2106786 ?auto_2106785 ) ( ON ?auto_2106787 ?auto_2106786 ) ( ON ?auto_2106788 ?auto_2106787 ) ( ON ?auto_2106789 ?auto_2106788 ) ( not ( = ?auto_2106777 ?auto_2106778 ) ) ( not ( = ?auto_2106777 ?auto_2106779 ) ) ( not ( = ?auto_2106777 ?auto_2106776 ) ) ( not ( = ?auto_2106777 ?auto_2106780 ) ) ( not ( = ?auto_2106777 ?auto_2106782 ) ) ( not ( = ?auto_2106777 ?auto_2106781 ) ) ( not ( = ?auto_2106777 ?auto_2106783 ) ) ( not ( = ?auto_2106777 ?auto_2106784 ) ) ( not ( = ?auto_2106777 ?auto_2106785 ) ) ( not ( = ?auto_2106777 ?auto_2106786 ) ) ( not ( = ?auto_2106777 ?auto_2106787 ) ) ( not ( = ?auto_2106777 ?auto_2106788 ) ) ( not ( = ?auto_2106777 ?auto_2106789 ) ) ( not ( = ?auto_2106777 ?auto_2106790 ) ) ( not ( = ?auto_2106777 ?auto_2106791 ) ) ( not ( = ?auto_2106778 ?auto_2106779 ) ) ( not ( = ?auto_2106778 ?auto_2106776 ) ) ( not ( = ?auto_2106778 ?auto_2106780 ) ) ( not ( = ?auto_2106778 ?auto_2106782 ) ) ( not ( = ?auto_2106778 ?auto_2106781 ) ) ( not ( = ?auto_2106778 ?auto_2106783 ) ) ( not ( = ?auto_2106778 ?auto_2106784 ) ) ( not ( = ?auto_2106778 ?auto_2106785 ) ) ( not ( = ?auto_2106778 ?auto_2106786 ) ) ( not ( = ?auto_2106778 ?auto_2106787 ) ) ( not ( = ?auto_2106778 ?auto_2106788 ) ) ( not ( = ?auto_2106778 ?auto_2106789 ) ) ( not ( = ?auto_2106778 ?auto_2106790 ) ) ( not ( = ?auto_2106778 ?auto_2106791 ) ) ( not ( = ?auto_2106779 ?auto_2106776 ) ) ( not ( = ?auto_2106779 ?auto_2106780 ) ) ( not ( = ?auto_2106779 ?auto_2106782 ) ) ( not ( = ?auto_2106779 ?auto_2106781 ) ) ( not ( = ?auto_2106779 ?auto_2106783 ) ) ( not ( = ?auto_2106779 ?auto_2106784 ) ) ( not ( = ?auto_2106779 ?auto_2106785 ) ) ( not ( = ?auto_2106779 ?auto_2106786 ) ) ( not ( = ?auto_2106779 ?auto_2106787 ) ) ( not ( = ?auto_2106779 ?auto_2106788 ) ) ( not ( = ?auto_2106779 ?auto_2106789 ) ) ( not ( = ?auto_2106779 ?auto_2106790 ) ) ( not ( = ?auto_2106779 ?auto_2106791 ) ) ( not ( = ?auto_2106776 ?auto_2106780 ) ) ( not ( = ?auto_2106776 ?auto_2106782 ) ) ( not ( = ?auto_2106776 ?auto_2106781 ) ) ( not ( = ?auto_2106776 ?auto_2106783 ) ) ( not ( = ?auto_2106776 ?auto_2106784 ) ) ( not ( = ?auto_2106776 ?auto_2106785 ) ) ( not ( = ?auto_2106776 ?auto_2106786 ) ) ( not ( = ?auto_2106776 ?auto_2106787 ) ) ( not ( = ?auto_2106776 ?auto_2106788 ) ) ( not ( = ?auto_2106776 ?auto_2106789 ) ) ( not ( = ?auto_2106776 ?auto_2106790 ) ) ( not ( = ?auto_2106776 ?auto_2106791 ) ) ( not ( = ?auto_2106780 ?auto_2106782 ) ) ( not ( = ?auto_2106780 ?auto_2106781 ) ) ( not ( = ?auto_2106780 ?auto_2106783 ) ) ( not ( = ?auto_2106780 ?auto_2106784 ) ) ( not ( = ?auto_2106780 ?auto_2106785 ) ) ( not ( = ?auto_2106780 ?auto_2106786 ) ) ( not ( = ?auto_2106780 ?auto_2106787 ) ) ( not ( = ?auto_2106780 ?auto_2106788 ) ) ( not ( = ?auto_2106780 ?auto_2106789 ) ) ( not ( = ?auto_2106780 ?auto_2106790 ) ) ( not ( = ?auto_2106780 ?auto_2106791 ) ) ( not ( = ?auto_2106782 ?auto_2106781 ) ) ( not ( = ?auto_2106782 ?auto_2106783 ) ) ( not ( = ?auto_2106782 ?auto_2106784 ) ) ( not ( = ?auto_2106782 ?auto_2106785 ) ) ( not ( = ?auto_2106782 ?auto_2106786 ) ) ( not ( = ?auto_2106782 ?auto_2106787 ) ) ( not ( = ?auto_2106782 ?auto_2106788 ) ) ( not ( = ?auto_2106782 ?auto_2106789 ) ) ( not ( = ?auto_2106782 ?auto_2106790 ) ) ( not ( = ?auto_2106782 ?auto_2106791 ) ) ( not ( = ?auto_2106781 ?auto_2106783 ) ) ( not ( = ?auto_2106781 ?auto_2106784 ) ) ( not ( = ?auto_2106781 ?auto_2106785 ) ) ( not ( = ?auto_2106781 ?auto_2106786 ) ) ( not ( = ?auto_2106781 ?auto_2106787 ) ) ( not ( = ?auto_2106781 ?auto_2106788 ) ) ( not ( = ?auto_2106781 ?auto_2106789 ) ) ( not ( = ?auto_2106781 ?auto_2106790 ) ) ( not ( = ?auto_2106781 ?auto_2106791 ) ) ( not ( = ?auto_2106783 ?auto_2106784 ) ) ( not ( = ?auto_2106783 ?auto_2106785 ) ) ( not ( = ?auto_2106783 ?auto_2106786 ) ) ( not ( = ?auto_2106783 ?auto_2106787 ) ) ( not ( = ?auto_2106783 ?auto_2106788 ) ) ( not ( = ?auto_2106783 ?auto_2106789 ) ) ( not ( = ?auto_2106783 ?auto_2106790 ) ) ( not ( = ?auto_2106783 ?auto_2106791 ) ) ( not ( = ?auto_2106784 ?auto_2106785 ) ) ( not ( = ?auto_2106784 ?auto_2106786 ) ) ( not ( = ?auto_2106784 ?auto_2106787 ) ) ( not ( = ?auto_2106784 ?auto_2106788 ) ) ( not ( = ?auto_2106784 ?auto_2106789 ) ) ( not ( = ?auto_2106784 ?auto_2106790 ) ) ( not ( = ?auto_2106784 ?auto_2106791 ) ) ( not ( = ?auto_2106785 ?auto_2106786 ) ) ( not ( = ?auto_2106785 ?auto_2106787 ) ) ( not ( = ?auto_2106785 ?auto_2106788 ) ) ( not ( = ?auto_2106785 ?auto_2106789 ) ) ( not ( = ?auto_2106785 ?auto_2106790 ) ) ( not ( = ?auto_2106785 ?auto_2106791 ) ) ( not ( = ?auto_2106786 ?auto_2106787 ) ) ( not ( = ?auto_2106786 ?auto_2106788 ) ) ( not ( = ?auto_2106786 ?auto_2106789 ) ) ( not ( = ?auto_2106786 ?auto_2106790 ) ) ( not ( = ?auto_2106786 ?auto_2106791 ) ) ( not ( = ?auto_2106787 ?auto_2106788 ) ) ( not ( = ?auto_2106787 ?auto_2106789 ) ) ( not ( = ?auto_2106787 ?auto_2106790 ) ) ( not ( = ?auto_2106787 ?auto_2106791 ) ) ( not ( = ?auto_2106788 ?auto_2106789 ) ) ( not ( = ?auto_2106788 ?auto_2106790 ) ) ( not ( = ?auto_2106788 ?auto_2106791 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2106789 ?auto_2106790 ?auto_2106791 )
      ( MAKE-15CRATE-VERIFY ?auto_2106777 ?auto_2106778 ?auto_2106779 ?auto_2106776 ?auto_2106780 ?auto_2106782 ?auto_2106781 ?auto_2106783 ?auto_2106784 ?auto_2106785 ?auto_2106786 ?auto_2106787 ?auto_2106788 ?auto_2106789 ?auto_2106790 ?auto_2106791 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2106972 - SURFACE
      ?auto_2106973 - SURFACE
      ?auto_2106974 - SURFACE
      ?auto_2106971 - SURFACE
      ?auto_2106975 - SURFACE
      ?auto_2106977 - SURFACE
      ?auto_2106976 - SURFACE
      ?auto_2106978 - SURFACE
      ?auto_2106979 - SURFACE
      ?auto_2106980 - SURFACE
      ?auto_2106981 - SURFACE
      ?auto_2106982 - SURFACE
      ?auto_2106983 - SURFACE
      ?auto_2106984 - SURFACE
      ?auto_2106985 - SURFACE
      ?auto_2106986 - SURFACE
    )
    :vars
    (
      ?auto_2106990 - HOIST
      ?auto_2106987 - PLACE
      ?auto_2106988 - TRUCK
      ?auto_2106989 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2106990 ?auto_2106987 ) ( SURFACE-AT ?auto_2106985 ?auto_2106987 ) ( CLEAR ?auto_2106985 ) ( IS-CRATE ?auto_2106986 ) ( not ( = ?auto_2106985 ?auto_2106986 ) ) ( AVAILABLE ?auto_2106990 ) ( IN ?auto_2106986 ?auto_2106988 ) ( ON ?auto_2106985 ?auto_2106984 ) ( not ( = ?auto_2106984 ?auto_2106985 ) ) ( not ( = ?auto_2106984 ?auto_2106986 ) ) ( TRUCK-AT ?auto_2106988 ?auto_2106989 ) ( not ( = ?auto_2106989 ?auto_2106987 ) ) ( ON ?auto_2106973 ?auto_2106972 ) ( ON ?auto_2106974 ?auto_2106973 ) ( ON ?auto_2106971 ?auto_2106974 ) ( ON ?auto_2106975 ?auto_2106971 ) ( ON ?auto_2106977 ?auto_2106975 ) ( ON ?auto_2106976 ?auto_2106977 ) ( ON ?auto_2106978 ?auto_2106976 ) ( ON ?auto_2106979 ?auto_2106978 ) ( ON ?auto_2106980 ?auto_2106979 ) ( ON ?auto_2106981 ?auto_2106980 ) ( ON ?auto_2106982 ?auto_2106981 ) ( ON ?auto_2106983 ?auto_2106982 ) ( ON ?auto_2106984 ?auto_2106983 ) ( not ( = ?auto_2106972 ?auto_2106973 ) ) ( not ( = ?auto_2106972 ?auto_2106974 ) ) ( not ( = ?auto_2106972 ?auto_2106971 ) ) ( not ( = ?auto_2106972 ?auto_2106975 ) ) ( not ( = ?auto_2106972 ?auto_2106977 ) ) ( not ( = ?auto_2106972 ?auto_2106976 ) ) ( not ( = ?auto_2106972 ?auto_2106978 ) ) ( not ( = ?auto_2106972 ?auto_2106979 ) ) ( not ( = ?auto_2106972 ?auto_2106980 ) ) ( not ( = ?auto_2106972 ?auto_2106981 ) ) ( not ( = ?auto_2106972 ?auto_2106982 ) ) ( not ( = ?auto_2106972 ?auto_2106983 ) ) ( not ( = ?auto_2106972 ?auto_2106984 ) ) ( not ( = ?auto_2106972 ?auto_2106985 ) ) ( not ( = ?auto_2106972 ?auto_2106986 ) ) ( not ( = ?auto_2106973 ?auto_2106974 ) ) ( not ( = ?auto_2106973 ?auto_2106971 ) ) ( not ( = ?auto_2106973 ?auto_2106975 ) ) ( not ( = ?auto_2106973 ?auto_2106977 ) ) ( not ( = ?auto_2106973 ?auto_2106976 ) ) ( not ( = ?auto_2106973 ?auto_2106978 ) ) ( not ( = ?auto_2106973 ?auto_2106979 ) ) ( not ( = ?auto_2106973 ?auto_2106980 ) ) ( not ( = ?auto_2106973 ?auto_2106981 ) ) ( not ( = ?auto_2106973 ?auto_2106982 ) ) ( not ( = ?auto_2106973 ?auto_2106983 ) ) ( not ( = ?auto_2106973 ?auto_2106984 ) ) ( not ( = ?auto_2106973 ?auto_2106985 ) ) ( not ( = ?auto_2106973 ?auto_2106986 ) ) ( not ( = ?auto_2106974 ?auto_2106971 ) ) ( not ( = ?auto_2106974 ?auto_2106975 ) ) ( not ( = ?auto_2106974 ?auto_2106977 ) ) ( not ( = ?auto_2106974 ?auto_2106976 ) ) ( not ( = ?auto_2106974 ?auto_2106978 ) ) ( not ( = ?auto_2106974 ?auto_2106979 ) ) ( not ( = ?auto_2106974 ?auto_2106980 ) ) ( not ( = ?auto_2106974 ?auto_2106981 ) ) ( not ( = ?auto_2106974 ?auto_2106982 ) ) ( not ( = ?auto_2106974 ?auto_2106983 ) ) ( not ( = ?auto_2106974 ?auto_2106984 ) ) ( not ( = ?auto_2106974 ?auto_2106985 ) ) ( not ( = ?auto_2106974 ?auto_2106986 ) ) ( not ( = ?auto_2106971 ?auto_2106975 ) ) ( not ( = ?auto_2106971 ?auto_2106977 ) ) ( not ( = ?auto_2106971 ?auto_2106976 ) ) ( not ( = ?auto_2106971 ?auto_2106978 ) ) ( not ( = ?auto_2106971 ?auto_2106979 ) ) ( not ( = ?auto_2106971 ?auto_2106980 ) ) ( not ( = ?auto_2106971 ?auto_2106981 ) ) ( not ( = ?auto_2106971 ?auto_2106982 ) ) ( not ( = ?auto_2106971 ?auto_2106983 ) ) ( not ( = ?auto_2106971 ?auto_2106984 ) ) ( not ( = ?auto_2106971 ?auto_2106985 ) ) ( not ( = ?auto_2106971 ?auto_2106986 ) ) ( not ( = ?auto_2106975 ?auto_2106977 ) ) ( not ( = ?auto_2106975 ?auto_2106976 ) ) ( not ( = ?auto_2106975 ?auto_2106978 ) ) ( not ( = ?auto_2106975 ?auto_2106979 ) ) ( not ( = ?auto_2106975 ?auto_2106980 ) ) ( not ( = ?auto_2106975 ?auto_2106981 ) ) ( not ( = ?auto_2106975 ?auto_2106982 ) ) ( not ( = ?auto_2106975 ?auto_2106983 ) ) ( not ( = ?auto_2106975 ?auto_2106984 ) ) ( not ( = ?auto_2106975 ?auto_2106985 ) ) ( not ( = ?auto_2106975 ?auto_2106986 ) ) ( not ( = ?auto_2106977 ?auto_2106976 ) ) ( not ( = ?auto_2106977 ?auto_2106978 ) ) ( not ( = ?auto_2106977 ?auto_2106979 ) ) ( not ( = ?auto_2106977 ?auto_2106980 ) ) ( not ( = ?auto_2106977 ?auto_2106981 ) ) ( not ( = ?auto_2106977 ?auto_2106982 ) ) ( not ( = ?auto_2106977 ?auto_2106983 ) ) ( not ( = ?auto_2106977 ?auto_2106984 ) ) ( not ( = ?auto_2106977 ?auto_2106985 ) ) ( not ( = ?auto_2106977 ?auto_2106986 ) ) ( not ( = ?auto_2106976 ?auto_2106978 ) ) ( not ( = ?auto_2106976 ?auto_2106979 ) ) ( not ( = ?auto_2106976 ?auto_2106980 ) ) ( not ( = ?auto_2106976 ?auto_2106981 ) ) ( not ( = ?auto_2106976 ?auto_2106982 ) ) ( not ( = ?auto_2106976 ?auto_2106983 ) ) ( not ( = ?auto_2106976 ?auto_2106984 ) ) ( not ( = ?auto_2106976 ?auto_2106985 ) ) ( not ( = ?auto_2106976 ?auto_2106986 ) ) ( not ( = ?auto_2106978 ?auto_2106979 ) ) ( not ( = ?auto_2106978 ?auto_2106980 ) ) ( not ( = ?auto_2106978 ?auto_2106981 ) ) ( not ( = ?auto_2106978 ?auto_2106982 ) ) ( not ( = ?auto_2106978 ?auto_2106983 ) ) ( not ( = ?auto_2106978 ?auto_2106984 ) ) ( not ( = ?auto_2106978 ?auto_2106985 ) ) ( not ( = ?auto_2106978 ?auto_2106986 ) ) ( not ( = ?auto_2106979 ?auto_2106980 ) ) ( not ( = ?auto_2106979 ?auto_2106981 ) ) ( not ( = ?auto_2106979 ?auto_2106982 ) ) ( not ( = ?auto_2106979 ?auto_2106983 ) ) ( not ( = ?auto_2106979 ?auto_2106984 ) ) ( not ( = ?auto_2106979 ?auto_2106985 ) ) ( not ( = ?auto_2106979 ?auto_2106986 ) ) ( not ( = ?auto_2106980 ?auto_2106981 ) ) ( not ( = ?auto_2106980 ?auto_2106982 ) ) ( not ( = ?auto_2106980 ?auto_2106983 ) ) ( not ( = ?auto_2106980 ?auto_2106984 ) ) ( not ( = ?auto_2106980 ?auto_2106985 ) ) ( not ( = ?auto_2106980 ?auto_2106986 ) ) ( not ( = ?auto_2106981 ?auto_2106982 ) ) ( not ( = ?auto_2106981 ?auto_2106983 ) ) ( not ( = ?auto_2106981 ?auto_2106984 ) ) ( not ( = ?auto_2106981 ?auto_2106985 ) ) ( not ( = ?auto_2106981 ?auto_2106986 ) ) ( not ( = ?auto_2106982 ?auto_2106983 ) ) ( not ( = ?auto_2106982 ?auto_2106984 ) ) ( not ( = ?auto_2106982 ?auto_2106985 ) ) ( not ( = ?auto_2106982 ?auto_2106986 ) ) ( not ( = ?auto_2106983 ?auto_2106984 ) ) ( not ( = ?auto_2106983 ?auto_2106985 ) ) ( not ( = ?auto_2106983 ?auto_2106986 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2106984 ?auto_2106985 ?auto_2106986 )
      ( MAKE-15CRATE-VERIFY ?auto_2106972 ?auto_2106973 ?auto_2106974 ?auto_2106971 ?auto_2106975 ?auto_2106977 ?auto_2106976 ?auto_2106978 ?auto_2106979 ?auto_2106980 ?auto_2106981 ?auto_2106982 ?auto_2106983 ?auto_2106984 ?auto_2106985 ?auto_2106986 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2107182 - SURFACE
      ?auto_2107183 - SURFACE
      ?auto_2107184 - SURFACE
      ?auto_2107181 - SURFACE
      ?auto_2107185 - SURFACE
      ?auto_2107187 - SURFACE
      ?auto_2107186 - SURFACE
      ?auto_2107188 - SURFACE
      ?auto_2107189 - SURFACE
      ?auto_2107190 - SURFACE
      ?auto_2107191 - SURFACE
      ?auto_2107192 - SURFACE
      ?auto_2107193 - SURFACE
      ?auto_2107194 - SURFACE
      ?auto_2107195 - SURFACE
      ?auto_2107196 - SURFACE
    )
    :vars
    (
      ?auto_2107200 - HOIST
      ?auto_2107201 - PLACE
      ?auto_2107198 - TRUCK
      ?auto_2107199 - PLACE
      ?auto_2107197 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2107200 ?auto_2107201 ) ( SURFACE-AT ?auto_2107195 ?auto_2107201 ) ( CLEAR ?auto_2107195 ) ( IS-CRATE ?auto_2107196 ) ( not ( = ?auto_2107195 ?auto_2107196 ) ) ( AVAILABLE ?auto_2107200 ) ( ON ?auto_2107195 ?auto_2107194 ) ( not ( = ?auto_2107194 ?auto_2107195 ) ) ( not ( = ?auto_2107194 ?auto_2107196 ) ) ( TRUCK-AT ?auto_2107198 ?auto_2107199 ) ( not ( = ?auto_2107199 ?auto_2107201 ) ) ( HOIST-AT ?auto_2107197 ?auto_2107199 ) ( LIFTING ?auto_2107197 ?auto_2107196 ) ( not ( = ?auto_2107200 ?auto_2107197 ) ) ( ON ?auto_2107183 ?auto_2107182 ) ( ON ?auto_2107184 ?auto_2107183 ) ( ON ?auto_2107181 ?auto_2107184 ) ( ON ?auto_2107185 ?auto_2107181 ) ( ON ?auto_2107187 ?auto_2107185 ) ( ON ?auto_2107186 ?auto_2107187 ) ( ON ?auto_2107188 ?auto_2107186 ) ( ON ?auto_2107189 ?auto_2107188 ) ( ON ?auto_2107190 ?auto_2107189 ) ( ON ?auto_2107191 ?auto_2107190 ) ( ON ?auto_2107192 ?auto_2107191 ) ( ON ?auto_2107193 ?auto_2107192 ) ( ON ?auto_2107194 ?auto_2107193 ) ( not ( = ?auto_2107182 ?auto_2107183 ) ) ( not ( = ?auto_2107182 ?auto_2107184 ) ) ( not ( = ?auto_2107182 ?auto_2107181 ) ) ( not ( = ?auto_2107182 ?auto_2107185 ) ) ( not ( = ?auto_2107182 ?auto_2107187 ) ) ( not ( = ?auto_2107182 ?auto_2107186 ) ) ( not ( = ?auto_2107182 ?auto_2107188 ) ) ( not ( = ?auto_2107182 ?auto_2107189 ) ) ( not ( = ?auto_2107182 ?auto_2107190 ) ) ( not ( = ?auto_2107182 ?auto_2107191 ) ) ( not ( = ?auto_2107182 ?auto_2107192 ) ) ( not ( = ?auto_2107182 ?auto_2107193 ) ) ( not ( = ?auto_2107182 ?auto_2107194 ) ) ( not ( = ?auto_2107182 ?auto_2107195 ) ) ( not ( = ?auto_2107182 ?auto_2107196 ) ) ( not ( = ?auto_2107183 ?auto_2107184 ) ) ( not ( = ?auto_2107183 ?auto_2107181 ) ) ( not ( = ?auto_2107183 ?auto_2107185 ) ) ( not ( = ?auto_2107183 ?auto_2107187 ) ) ( not ( = ?auto_2107183 ?auto_2107186 ) ) ( not ( = ?auto_2107183 ?auto_2107188 ) ) ( not ( = ?auto_2107183 ?auto_2107189 ) ) ( not ( = ?auto_2107183 ?auto_2107190 ) ) ( not ( = ?auto_2107183 ?auto_2107191 ) ) ( not ( = ?auto_2107183 ?auto_2107192 ) ) ( not ( = ?auto_2107183 ?auto_2107193 ) ) ( not ( = ?auto_2107183 ?auto_2107194 ) ) ( not ( = ?auto_2107183 ?auto_2107195 ) ) ( not ( = ?auto_2107183 ?auto_2107196 ) ) ( not ( = ?auto_2107184 ?auto_2107181 ) ) ( not ( = ?auto_2107184 ?auto_2107185 ) ) ( not ( = ?auto_2107184 ?auto_2107187 ) ) ( not ( = ?auto_2107184 ?auto_2107186 ) ) ( not ( = ?auto_2107184 ?auto_2107188 ) ) ( not ( = ?auto_2107184 ?auto_2107189 ) ) ( not ( = ?auto_2107184 ?auto_2107190 ) ) ( not ( = ?auto_2107184 ?auto_2107191 ) ) ( not ( = ?auto_2107184 ?auto_2107192 ) ) ( not ( = ?auto_2107184 ?auto_2107193 ) ) ( not ( = ?auto_2107184 ?auto_2107194 ) ) ( not ( = ?auto_2107184 ?auto_2107195 ) ) ( not ( = ?auto_2107184 ?auto_2107196 ) ) ( not ( = ?auto_2107181 ?auto_2107185 ) ) ( not ( = ?auto_2107181 ?auto_2107187 ) ) ( not ( = ?auto_2107181 ?auto_2107186 ) ) ( not ( = ?auto_2107181 ?auto_2107188 ) ) ( not ( = ?auto_2107181 ?auto_2107189 ) ) ( not ( = ?auto_2107181 ?auto_2107190 ) ) ( not ( = ?auto_2107181 ?auto_2107191 ) ) ( not ( = ?auto_2107181 ?auto_2107192 ) ) ( not ( = ?auto_2107181 ?auto_2107193 ) ) ( not ( = ?auto_2107181 ?auto_2107194 ) ) ( not ( = ?auto_2107181 ?auto_2107195 ) ) ( not ( = ?auto_2107181 ?auto_2107196 ) ) ( not ( = ?auto_2107185 ?auto_2107187 ) ) ( not ( = ?auto_2107185 ?auto_2107186 ) ) ( not ( = ?auto_2107185 ?auto_2107188 ) ) ( not ( = ?auto_2107185 ?auto_2107189 ) ) ( not ( = ?auto_2107185 ?auto_2107190 ) ) ( not ( = ?auto_2107185 ?auto_2107191 ) ) ( not ( = ?auto_2107185 ?auto_2107192 ) ) ( not ( = ?auto_2107185 ?auto_2107193 ) ) ( not ( = ?auto_2107185 ?auto_2107194 ) ) ( not ( = ?auto_2107185 ?auto_2107195 ) ) ( not ( = ?auto_2107185 ?auto_2107196 ) ) ( not ( = ?auto_2107187 ?auto_2107186 ) ) ( not ( = ?auto_2107187 ?auto_2107188 ) ) ( not ( = ?auto_2107187 ?auto_2107189 ) ) ( not ( = ?auto_2107187 ?auto_2107190 ) ) ( not ( = ?auto_2107187 ?auto_2107191 ) ) ( not ( = ?auto_2107187 ?auto_2107192 ) ) ( not ( = ?auto_2107187 ?auto_2107193 ) ) ( not ( = ?auto_2107187 ?auto_2107194 ) ) ( not ( = ?auto_2107187 ?auto_2107195 ) ) ( not ( = ?auto_2107187 ?auto_2107196 ) ) ( not ( = ?auto_2107186 ?auto_2107188 ) ) ( not ( = ?auto_2107186 ?auto_2107189 ) ) ( not ( = ?auto_2107186 ?auto_2107190 ) ) ( not ( = ?auto_2107186 ?auto_2107191 ) ) ( not ( = ?auto_2107186 ?auto_2107192 ) ) ( not ( = ?auto_2107186 ?auto_2107193 ) ) ( not ( = ?auto_2107186 ?auto_2107194 ) ) ( not ( = ?auto_2107186 ?auto_2107195 ) ) ( not ( = ?auto_2107186 ?auto_2107196 ) ) ( not ( = ?auto_2107188 ?auto_2107189 ) ) ( not ( = ?auto_2107188 ?auto_2107190 ) ) ( not ( = ?auto_2107188 ?auto_2107191 ) ) ( not ( = ?auto_2107188 ?auto_2107192 ) ) ( not ( = ?auto_2107188 ?auto_2107193 ) ) ( not ( = ?auto_2107188 ?auto_2107194 ) ) ( not ( = ?auto_2107188 ?auto_2107195 ) ) ( not ( = ?auto_2107188 ?auto_2107196 ) ) ( not ( = ?auto_2107189 ?auto_2107190 ) ) ( not ( = ?auto_2107189 ?auto_2107191 ) ) ( not ( = ?auto_2107189 ?auto_2107192 ) ) ( not ( = ?auto_2107189 ?auto_2107193 ) ) ( not ( = ?auto_2107189 ?auto_2107194 ) ) ( not ( = ?auto_2107189 ?auto_2107195 ) ) ( not ( = ?auto_2107189 ?auto_2107196 ) ) ( not ( = ?auto_2107190 ?auto_2107191 ) ) ( not ( = ?auto_2107190 ?auto_2107192 ) ) ( not ( = ?auto_2107190 ?auto_2107193 ) ) ( not ( = ?auto_2107190 ?auto_2107194 ) ) ( not ( = ?auto_2107190 ?auto_2107195 ) ) ( not ( = ?auto_2107190 ?auto_2107196 ) ) ( not ( = ?auto_2107191 ?auto_2107192 ) ) ( not ( = ?auto_2107191 ?auto_2107193 ) ) ( not ( = ?auto_2107191 ?auto_2107194 ) ) ( not ( = ?auto_2107191 ?auto_2107195 ) ) ( not ( = ?auto_2107191 ?auto_2107196 ) ) ( not ( = ?auto_2107192 ?auto_2107193 ) ) ( not ( = ?auto_2107192 ?auto_2107194 ) ) ( not ( = ?auto_2107192 ?auto_2107195 ) ) ( not ( = ?auto_2107192 ?auto_2107196 ) ) ( not ( = ?auto_2107193 ?auto_2107194 ) ) ( not ( = ?auto_2107193 ?auto_2107195 ) ) ( not ( = ?auto_2107193 ?auto_2107196 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2107194 ?auto_2107195 ?auto_2107196 )
      ( MAKE-15CRATE-VERIFY ?auto_2107182 ?auto_2107183 ?auto_2107184 ?auto_2107181 ?auto_2107185 ?auto_2107187 ?auto_2107186 ?auto_2107188 ?auto_2107189 ?auto_2107190 ?auto_2107191 ?auto_2107192 ?auto_2107193 ?auto_2107194 ?auto_2107195 ?auto_2107196 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2107407 - SURFACE
      ?auto_2107408 - SURFACE
      ?auto_2107409 - SURFACE
      ?auto_2107406 - SURFACE
      ?auto_2107410 - SURFACE
      ?auto_2107412 - SURFACE
      ?auto_2107411 - SURFACE
      ?auto_2107413 - SURFACE
      ?auto_2107414 - SURFACE
      ?auto_2107415 - SURFACE
      ?auto_2107416 - SURFACE
      ?auto_2107417 - SURFACE
      ?auto_2107418 - SURFACE
      ?auto_2107419 - SURFACE
      ?auto_2107420 - SURFACE
      ?auto_2107421 - SURFACE
    )
    :vars
    (
      ?auto_2107427 - HOIST
      ?auto_2107424 - PLACE
      ?auto_2107422 - TRUCK
      ?auto_2107426 - PLACE
      ?auto_2107425 - HOIST
      ?auto_2107423 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2107427 ?auto_2107424 ) ( SURFACE-AT ?auto_2107420 ?auto_2107424 ) ( CLEAR ?auto_2107420 ) ( IS-CRATE ?auto_2107421 ) ( not ( = ?auto_2107420 ?auto_2107421 ) ) ( AVAILABLE ?auto_2107427 ) ( ON ?auto_2107420 ?auto_2107419 ) ( not ( = ?auto_2107419 ?auto_2107420 ) ) ( not ( = ?auto_2107419 ?auto_2107421 ) ) ( TRUCK-AT ?auto_2107422 ?auto_2107426 ) ( not ( = ?auto_2107426 ?auto_2107424 ) ) ( HOIST-AT ?auto_2107425 ?auto_2107426 ) ( not ( = ?auto_2107427 ?auto_2107425 ) ) ( AVAILABLE ?auto_2107425 ) ( SURFACE-AT ?auto_2107421 ?auto_2107426 ) ( ON ?auto_2107421 ?auto_2107423 ) ( CLEAR ?auto_2107421 ) ( not ( = ?auto_2107420 ?auto_2107423 ) ) ( not ( = ?auto_2107421 ?auto_2107423 ) ) ( not ( = ?auto_2107419 ?auto_2107423 ) ) ( ON ?auto_2107408 ?auto_2107407 ) ( ON ?auto_2107409 ?auto_2107408 ) ( ON ?auto_2107406 ?auto_2107409 ) ( ON ?auto_2107410 ?auto_2107406 ) ( ON ?auto_2107412 ?auto_2107410 ) ( ON ?auto_2107411 ?auto_2107412 ) ( ON ?auto_2107413 ?auto_2107411 ) ( ON ?auto_2107414 ?auto_2107413 ) ( ON ?auto_2107415 ?auto_2107414 ) ( ON ?auto_2107416 ?auto_2107415 ) ( ON ?auto_2107417 ?auto_2107416 ) ( ON ?auto_2107418 ?auto_2107417 ) ( ON ?auto_2107419 ?auto_2107418 ) ( not ( = ?auto_2107407 ?auto_2107408 ) ) ( not ( = ?auto_2107407 ?auto_2107409 ) ) ( not ( = ?auto_2107407 ?auto_2107406 ) ) ( not ( = ?auto_2107407 ?auto_2107410 ) ) ( not ( = ?auto_2107407 ?auto_2107412 ) ) ( not ( = ?auto_2107407 ?auto_2107411 ) ) ( not ( = ?auto_2107407 ?auto_2107413 ) ) ( not ( = ?auto_2107407 ?auto_2107414 ) ) ( not ( = ?auto_2107407 ?auto_2107415 ) ) ( not ( = ?auto_2107407 ?auto_2107416 ) ) ( not ( = ?auto_2107407 ?auto_2107417 ) ) ( not ( = ?auto_2107407 ?auto_2107418 ) ) ( not ( = ?auto_2107407 ?auto_2107419 ) ) ( not ( = ?auto_2107407 ?auto_2107420 ) ) ( not ( = ?auto_2107407 ?auto_2107421 ) ) ( not ( = ?auto_2107407 ?auto_2107423 ) ) ( not ( = ?auto_2107408 ?auto_2107409 ) ) ( not ( = ?auto_2107408 ?auto_2107406 ) ) ( not ( = ?auto_2107408 ?auto_2107410 ) ) ( not ( = ?auto_2107408 ?auto_2107412 ) ) ( not ( = ?auto_2107408 ?auto_2107411 ) ) ( not ( = ?auto_2107408 ?auto_2107413 ) ) ( not ( = ?auto_2107408 ?auto_2107414 ) ) ( not ( = ?auto_2107408 ?auto_2107415 ) ) ( not ( = ?auto_2107408 ?auto_2107416 ) ) ( not ( = ?auto_2107408 ?auto_2107417 ) ) ( not ( = ?auto_2107408 ?auto_2107418 ) ) ( not ( = ?auto_2107408 ?auto_2107419 ) ) ( not ( = ?auto_2107408 ?auto_2107420 ) ) ( not ( = ?auto_2107408 ?auto_2107421 ) ) ( not ( = ?auto_2107408 ?auto_2107423 ) ) ( not ( = ?auto_2107409 ?auto_2107406 ) ) ( not ( = ?auto_2107409 ?auto_2107410 ) ) ( not ( = ?auto_2107409 ?auto_2107412 ) ) ( not ( = ?auto_2107409 ?auto_2107411 ) ) ( not ( = ?auto_2107409 ?auto_2107413 ) ) ( not ( = ?auto_2107409 ?auto_2107414 ) ) ( not ( = ?auto_2107409 ?auto_2107415 ) ) ( not ( = ?auto_2107409 ?auto_2107416 ) ) ( not ( = ?auto_2107409 ?auto_2107417 ) ) ( not ( = ?auto_2107409 ?auto_2107418 ) ) ( not ( = ?auto_2107409 ?auto_2107419 ) ) ( not ( = ?auto_2107409 ?auto_2107420 ) ) ( not ( = ?auto_2107409 ?auto_2107421 ) ) ( not ( = ?auto_2107409 ?auto_2107423 ) ) ( not ( = ?auto_2107406 ?auto_2107410 ) ) ( not ( = ?auto_2107406 ?auto_2107412 ) ) ( not ( = ?auto_2107406 ?auto_2107411 ) ) ( not ( = ?auto_2107406 ?auto_2107413 ) ) ( not ( = ?auto_2107406 ?auto_2107414 ) ) ( not ( = ?auto_2107406 ?auto_2107415 ) ) ( not ( = ?auto_2107406 ?auto_2107416 ) ) ( not ( = ?auto_2107406 ?auto_2107417 ) ) ( not ( = ?auto_2107406 ?auto_2107418 ) ) ( not ( = ?auto_2107406 ?auto_2107419 ) ) ( not ( = ?auto_2107406 ?auto_2107420 ) ) ( not ( = ?auto_2107406 ?auto_2107421 ) ) ( not ( = ?auto_2107406 ?auto_2107423 ) ) ( not ( = ?auto_2107410 ?auto_2107412 ) ) ( not ( = ?auto_2107410 ?auto_2107411 ) ) ( not ( = ?auto_2107410 ?auto_2107413 ) ) ( not ( = ?auto_2107410 ?auto_2107414 ) ) ( not ( = ?auto_2107410 ?auto_2107415 ) ) ( not ( = ?auto_2107410 ?auto_2107416 ) ) ( not ( = ?auto_2107410 ?auto_2107417 ) ) ( not ( = ?auto_2107410 ?auto_2107418 ) ) ( not ( = ?auto_2107410 ?auto_2107419 ) ) ( not ( = ?auto_2107410 ?auto_2107420 ) ) ( not ( = ?auto_2107410 ?auto_2107421 ) ) ( not ( = ?auto_2107410 ?auto_2107423 ) ) ( not ( = ?auto_2107412 ?auto_2107411 ) ) ( not ( = ?auto_2107412 ?auto_2107413 ) ) ( not ( = ?auto_2107412 ?auto_2107414 ) ) ( not ( = ?auto_2107412 ?auto_2107415 ) ) ( not ( = ?auto_2107412 ?auto_2107416 ) ) ( not ( = ?auto_2107412 ?auto_2107417 ) ) ( not ( = ?auto_2107412 ?auto_2107418 ) ) ( not ( = ?auto_2107412 ?auto_2107419 ) ) ( not ( = ?auto_2107412 ?auto_2107420 ) ) ( not ( = ?auto_2107412 ?auto_2107421 ) ) ( not ( = ?auto_2107412 ?auto_2107423 ) ) ( not ( = ?auto_2107411 ?auto_2107413 ) ) ( not ( = ?auto_2107411 ?auto_2107414 ) ) ( not ( = ?auto_2107411 ?auto_2107415 ) ) ( not ( = ?auto_2107411 ?auto_2107416 ) ) ( not ( = ?auto_2107411 ?auto_2107417 ) ) ( not ( = ?auto_2107411 ?auto_2107418 ) ) ( not ( = ?auto_2107411 ?auto_2107419 ) ) ( not ( = ?auto_2107411 ?auto_2107420 ) ) ( not ( = ?auto_2107411 ?auto_2107421 ) ) ( not ( = ?auto_2107411 ?auto_2107423 ) ) ( not ( = ?auto_2107413 ?auto_2107414 ) ) ( not ( = ?auto_2107413 ?auto_2107415 ) ) ( not ( = ?auto_2107413 ?auto_2107416 ) ) ( not ( = ?auto_2107413 ?auto_2107417 ) ) ( not ( = ?auto_2107413 ?auto_2107418 ) ) ( not ( = ?auto_2107413 ?auto_2107419 ) ) ( not ( = ?auto_2107413 ?auto_2107420 ) ) ( not ( = ?auto_2107413 ?auto_2107421 ) ) ( not ( = ?auto_2107413 ?auto_2107423 ) ) ( not ( = ?auto_2107414 ?auto_2107415 ) ) ( not ( = ?auto_2107414 ?auto_2107416 ) ) ( not ( = ?auto_2107414 ?auto_2107417 ) ) ( not ( = ?auto_2107414 ?auto_2107418 ) ) ( not ( = ?auto_2107414 ?auto_2107419 ) ) ( not ( = ?auto_2107414 ?auto_2107420 ) ) ( not ( = ?auto_2107414 ?auto_2107421 ) ) ( not ( = ?auto_2107414 ?auto_2107423 ) ) ( not ( = ?auto_2107415 ?auto_2107416 ) ) ( not ( = ?auto_2107415 ?auto_2107417 ) ) ( not ( = ?auto_2107415 ?auto_2107418 ) ) ( not ( = ?auto_2107415 ?auto_2107419 ) ) ( not ( = ?auto_2107415 ?auto_2107420 ) ) ( not ( = ?auto_2107415 ?auto_2107421 ) ) ( not ( = ?auto_2107415 ?auto_2107423 ) ) ( not ( = ?auto_2107416 ?auto_2107417 ) ) ( not ( = ?auto_2107416 ?auto_2107418 ) ) ( not ( = ?auto_2107416 ?auto_2107419 ) ) ( not ( = ?auto_2107416 ?auto_2107420 ) ) ( not ( = ?auto_2107416 ?auto_2107421 ) ) ( not ( = ?auto_2107416 ?auto_2107423 ) ) ( not ( = ?auto_2107417 ?auto_2107418 ) ) ( not ( = ?auto_2107417 ?auto_2107419 ) ) ( not ( = ?auto_2107417 ?auto_2107420 ) ) ( not ( = ?auto_2107417 ?auto_2107421 ) ) ( not ( = ?auto_2107417 ?auto_2107423 ) ) ( not ( = ?auto_2107418 ?auto_2107419 ) ) ( not ( = ?auto_2107418 ?auto_2107420 ) ) ( not ( = ?auto_2107418 ?auto_2107421 ) ) ( not ( = ?auto_2107418 ?auto_2107423 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2107419 ?auto_2107420 ?auto_2107421 )
      ( MAKE-15CRATE-VERIFY ?auto_2107407 ?auto_2107408 ?auto_2107409 ?auto_2107406 ?auto_2107410 ?auto_2107412 ?auto_2107411 ?auto_2107413 ?auto_2107414 ?auto_2107415 ?auto_2107416 ?auto_2107417 ?auto_2107418 ?auto_2107419 ?auto_2107420 ?auto_2107421 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2107633 - SURFACE
      ?auto_2107634 - SURFACE
      ?auto_2107635 - SURFACE
      ?auto_2107632 - SURFACE
      ?auto_2107636 - SURFACE
      ?auto_2107638 - SURFACE
      ?auto_2107637 - SURFACE
      ?auto_2107639 - SURFACE
      ?auto_2107640 - SURFACE
      ?auto_2107641 - SURFACE
      ?auto_2107642 - SURFACE
      ?auto_2107643 - SURFACE
      ?auto_2107644 - SURFACE
      ?auto_2107645 - SURFACE
      ?auto_2107646 - SURFACE
      ?auto_2107647 - SURFACE
    )
    :vars
    (
      ?auto_2107649 - HOIST
      ?auto_2107651 - PLACE
      ?auto_2107648 - PLACE
      ?auto_2107652 - HOIST
      ?auto_2107653 - SURFACE
      ?auto_2107650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2107649 ?auto_2107651 ) ( SURFACE-AT ?auto_2107646 ?auto_2107651 ) ( CLEAR ?auto_2107646 ) ( IS-CRATE ?auto_2107647 ) ( not ( = ?auto_2107646 ?auto_2107647 ) ) ( AVAILABLE ?auto_2107649 ) ( ON ?auto_2107646 ?auto_2107645 ) ( not ( = ?auto_2107645 ?auto_2107646 ) ) ( not ( = ?auto_2107645 ?auto_2107647 ) ) ( not ( = ?auto_2107648 ?auto_2107651 ) ) ( HOIST-AT ?auto_2107652 ?auto_2107648 ) ( not ( = ?auto_2107649 ?auto_2107652 ) ) ( AVAILABLE ?auto_2107652 ) ( SURFACE-AT ?auto_2107647 ?auto_2107648 ) ( ON ?auto_2107647 ?auto_2107653 ) ( CLEAR ?auto_2107647 ) ( not ( = ?auto_2107646 ?auto_2107653 ) ) ( not ( = ?auto_2107647 ?auto_2107653 ) ) ( not ( = ?auto_2107645 ?auto_2107653 ) ) ( TRUCK-AT ?auto_2107650 ?auto_2107651 ) ( ON ?auto_2107634 ?auto_2107633 ) ( ON ?auto_2107635 ?auto_2107634 ) ( ON ?auto_2107632 ?auto_2107635 ) ( ON ?auto_2107636 ?auto_2107632 ) ( ON ?auto_2107638 ?auto_2107636 ) ( ON ?auto_2107637 ?auto_2107638 ) ( ON ?auto_2107639 ?auto_2107637 ) ( ON ?auto_2107640 ?auto_2107639 ) ( ON ?auto_2107641 ?auto_2107640 ) ( ON ?auto_2107642 ?auto_2107641 ) ( ON ?auto_2107643 ?auto_2107642 ) ( ON ?auto_2107644 ?auto_2107643 ) ( ON ?auto_2107645 ?auto_2107644 ) ( not ( = ?auto_2107633 ?auto_2107634 ) ) ( not ( = ?auto_2107633 ?auto_2107635 ) ) ( not ( = ?auto_2107633 ?auto_2107632 ) ) ( not ( = ?auto_2107633 ?auto_2107636 ) ) ( not ( = ?auto_2107633 ?auto_2107638 ) ) ( not ( = ?auto_2107633 ?auto_2107637 ) ) ( not ( = ?auto_2107633 ?auto_2107639 ) ) ( not ( = ?auto_2107633 ?auto_2107640 ) ) ( not ( = ?auto_2107633 ?auto_2107641 ) ) ( not ( = ?auto_2107633 ?auto_2107642 ) ) ( not ( = ?auto_2107633 ?auto_2107643 ) ) ( not ( = ?auto_2107633 ?auto_2107644 ) ) ( not ( = ?auto_2107633 ?auto_2107645 ) ) ( not ( = ?auto_2107633 ?auto_2107646 ) ) ( not ( = ?auto_2107633 ?auto_2107647 ) ) ( not ( = ?auto_2107633 ?auto_2107653 ) ) ( not ( = ?auto_2107634 ?auto_2107635 ) ) ( not ( = ?auto_2107634 ?auto_2107632 ) ) ( not ( = ?auto_2107634 ?auto_2107636 ) ) ( not ( = ?auto_2107634 ?auto_2107638 ) ) ( not ( = ?auto_2107634 ?auto_2107637 ) ) ( not ( = ?auto_2107634 ?auto_2107639 ) ) ( not ( = ?auto_2107634 ?auto_2107640 ) ) ( not ( = ?auto_2107634 ?auto_2107641 ) ) ( not ( = ?auto_2107634 ?auto_2107642 ) ) ( not ( = ?auto_2107634 ?auto_2107643 ) ) ( not ( = ?auto_2107634 ?auto_2107644 ) ) ( not ( = ?auto_2107634 ?auto_2107645 ) ) ( not ( = ?auto_2107634 ?auto_2107646 ) ) ( not ( = ?auto_2107634 ?auto_2107647 ) ) ( not ( = ?auto_2107634 ?auto_2107653 ) ) ( not ( = ?auto_2107635 ?auto_2107632 ) ) ( not ( = ?auto_2107635 ?auto_2107636 ) ) ( not ( = ?auto_2107635 ?auto_2107638 ) ) ( not ( = ?auto_2107635 ?auto_2107637 ) ) ( not ( = ?auto_2107635 ?auto_2107639 ) ) ( not ( = ?auto_2107635 ?auto_2107640 ) ) ( not ( = ?auto_2107635 ?auto_2107641 ) ) ( not ( = ?auto_2107635 ?auto_2107642 ) ) ( not ( = ?auto_2107635 ?auto_2107643 ) ) ( not ( = ?auto_2107635 ?auto_2107644 ) ) ( not ( = ?auto_2107635 ?auto_2107645 ) ) ( not ( = ?auto_2107635 ?auto_2107646 ) ) ( not ( = ?auto_2107635 ?auto_2107647 ) ) ( not ( = ?auto_2107635 ?auto_2107653 ) ) ( not ( = ?auto_2107632 ?auto_2107636 ) ) ( not ( = ?auto_2107632 ?auto_2107638 ) ) ( not ( = ?auto_2107632 ?auto_2107637 ) ) ( not ( = ?auto_2107632 ?auto_2107639 ) ) ( not ( = ?auto_2107632 ?auto_2107640 ) ) ( not ( = ?auto_2107632 ?auto_2107641 ) ) ( not ( = ?auto_2107632 ?auto_2107642 ) ) ( not ( = ?auto_2107632 ?auto_2107643 ) ) ( not ( = ?auto_2107632 ?auto_2107644 ) ) ( not ( = ?auto_2107632 ?auto_2107645 ) ) ( not ( = ?auto_2107632 ?auto_2107646 ) ) ( not ( = ?auto_2107632 ?auto_2107647 ) ) ( not ( = ?auto_2107632 ?auto_2107653 ) ) ( not ( = ?auto_2107636 ?auto_2107638 ) ) ( not ( = ?auto_2107636 ?auto_2107637 ) ) ( not ( = ?auto_2107636 ?auto_2107639 ) ) ( not ( = ?auto_2107636 ?auto_2107640 ) ) ( not ( = ?auto_2107636 ?auto_2107641 ) ) ( not ( = ?auto_2107636 ?auto_2107642 ) ) ( not ( = ?auto_2107636 ?auto_2107643 ) ) ( not ( = ?auto_2107636 ?auto_2107644 ) ) ( not ( = ?auto_2107636 ?auto_2107645 ) ) ( not ( = ?auto_2107636 ?auto_2107646 ) ) ( not ( = ?auto_2107636 ?auto_2107647 ) ) ( not ( = ?auto_2107636 ?auto_2107653 ) ) ( not ( = ?auto_2107638 ?auto_2107637 ) ) ( not ( = ?auto_2107638 ?auto_2107639 ) ) ( not ( = ?auto_2107638 ?auto_2107640 ) ) ( not ( = ?auto_2107638 ?auto_2107641 ) ) ( not ( = ?auto_2107638 ?auto_2107642 ) ) ( not ( = ?auto_2107638 ?auto_2107643 ) ) ( not ( = ?auto_2107638 ?auto_2107644 ) ) ( not ( = ?auto_2107638 ?auto_2107645 ) ) ( not ( = ?auto_2107638 ?auto_2107646 ) ) ( not ( = ?auto_2107638 ?auto_2107647 ) ) ( not ( = ?auto_2107638 ?auto_2107653 ) ) ( not ( = ?auto_2107637 ?auto_2107639 ) ) ( not ( = ?auto_2107637 ?auto_2107640 ) ) ( not ( = ?auto_2107637 ?auto_2107641 ) ) ( not ( = ?auto_2107637 ?auto_2107642 ) ) ( not ( = ?auto_2107637 ?auto_2107643 ) ) ( not ( = ?auto_2107637 ?auto_2107644 ) ) ( not ( = ?auto_2107637 ?auto_2107645 ) ) ( not ( = ?auto_2107637 ?auto_2107646 ) ) ( not ( = ?auto_2107637 ?auto_2107647 ) ) ( not ( = ?auto_2107637 ?auto_2107653 ) ) ( not ( = ?auto_2107639 ?auto_2107640 ) ) ( not ( = ?auto_2107639 ?auto_2107641 ) ) ( not ( = ?auto_2107639 ?auto_2107642 ) ) ( not ( = ?auto_2107639 ?auto_2107643 ) ) ( not ( = ?auto_2107639 ?auto_2107644 ) ) ( not ( = ?auto_2107639 ?auto_2107645 ) ) ( not ( = ?auto_2107639 ?auto_2107646 ) ) ( not ( = ?auto_2107639 ?auto_2107647 ) ) ( not ( = ?auto_2107639 ?auto_2107653 ) ) ( not ( = ?auto_2107640 ?auto_2107641 ) ) ( not ( = ?auto_2107640 ?auto_2107642 ) ) ( not ( = ?auto_2107640 ?auto_2107643 ) ) ( not ( = ?auto_2107640 ?auto_2107644 ) ) ( not ( = ?auto_2107640 ?auto_2107645 ) ) ( not ( = ?auto_2107640 ?auto_2107646 ) ) ( not ( = ?auto_2107640 ?auto_2107647 ) ) ( not ( = ?auto_2107640 ?auto_2107653 ) ) ( not ( = ?auto_2107641 ?auto_2107642 ) ) ( not ( = ?auto_2107641 ?auto_2107643 ) ) ( not ( = ?auto_2107641 ?auto_2107644 ) ) ( not ( = ?auto_2107641 ?auto_2107645 ) ) ( not ( = ?auto_2107641 ?auto_2107646 ) ) ( not ( = ?auto_2107641 ?auto_2107647 ) ) ( not ( = ?auto_2107641 ?auto_2107653 ) ) ( not ( = ?auto_2107642 ?auto_2107643 ) ) ( not ( = ?auto_2107642 ?auto_2107644 ) ) ( not ( = ?auto_2107642 ?auto_2107645 ) ) ( not ( = ?auto_2107642 ?auto_2107646 ) ) ( not ( = ?auto_2107642 ?auto_2107647 ) ) ( not ( = ?auto_2107642 ?auto_2107653 ) ) ( not ( = ?auto_2107643 ?auto_2107644 ) ) ( not ( = ?auto_2107643 ?auto_2107645 ) ) ( not ( = ?auto_2107643 ?auto_2107646 ) ) ( not ( = ?auto_2107643 ?auto_2107647 ) ) ( not ( = ?auto_2107643 ?auto_2107653 ) ) ( not ( = ?auto_2107644 ?auto_2107645 ) ) ( not ( = ?auto_2107644 ?auto_2107646 ) ) ( not ( = ?auto_2107644 ?auto_2107647 ) ) ( not ( = ?auto_2107644 ?auto_2107653 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2107645 ?auto_2107646 ?auto_2107647 )
      ( MAKE-15CRATE-VERIFY ?auto_2107633 ?auto_2107634 ?auto_2107635 ?auto_2107632 ?auto_2107636 ?auto_2107638 ?auto_2107637 ?auto_2107639 ?auto_2107640 ?auto_2107641 ?auto_2107642 ?auto_2107643 ?auto_2107644 ?auto_2107645 ?auto_2107646 ?auto_2107647 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2107859 - SURFACE
      ?auto_2107860 - SURFACE
      ?auto_2107861 - SURFACE
      ?auto_2107858 - SURFACE
      ?auto_2107862 - SURFACE
      ?auto_2107864 - SURFACE
      ?auto_2107863 - SURFACE
      ?auto_2107865 - SURFACE
      ?auto_2107866 - SURFACE
      ?auto_2107867 - SURFACE
      ?auto_2107868 - SURFACE
      ?auto_2107869 - SURFACE
      ?auto_2107870 - SURFACE
      ?auto_2107871 - SURFACE
      ?auto_2107872 - SURFACE
      ?auto_2107873 - SURFACE
    )
    :vars
    (
      ?auto_2107878 - HOIST
      ?auto_2107875 - PLACE
      ?auto_2107874 - PLACE
      ?auto_2107876 - HOIST
      ?auto_2107877 - SURFACE
      ?auto_2107879 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2107878 ?auto_2107875 ) ( IS-CRATE ?auto_2107873 ) ( not ( = ?auto_2107872 ?auto_2107873 ) ) ( not ( = ?auto_2107871 ?auto_2107872 ) ) ( not ( = ?auto_2107871 ?auto_2107873 ) ) ( not ( = ?auto_2107874 ?auto_2107875 ) ) ( HOIST-AT ?auto_2107876 ?auto_2107874 ) ( not ( = ?auto_2107878 ?auto_2107876 ) ) ( AVAILABLE ?auto_2107876 ) ( SURFACE-AT ?auto_2107873 ?auto_2107874 ) ( ON ?auto_2107873 ?auto_2107877 ) ( CLEAR ?auto_2107873 ) ( not ( = ?auto_2107872 ?auto_2107877 ) ) ( not ( = ?auto_2107873 ?auto_2107877 ) ) ( not ( = ?auto_2107871 ?auto_2107877 ) ) ( TRUCK-AT ?auto_2107879 ?auto_2107875 ) ( SURFACE-AT ?auto_2107871 ?auto_2107875 ) ( CLEAR ?auto_2107871 ) ( LIFTING ?auto_2107878 ?auto_2107872 ) ( IS-CRATE ?auto_2107872 ) ( ON ?auto_2107860 ?auto_2107859 ) ( ON ?auto_2107861 ?auto_2107860 ) ( ON ?auto_2107858 ?auto_2107861 ) ( ON ?auto_2107862 ?auto_2107858 ) ( ON ?auto_2107864 ?auto_2107862 ) ( ON ?auto_2107863 ?auto_2107864 ) ( ON ?auto_2107865 ?auto_2107863 ) ( ON ?auto_2107866 ?auto_2107865 ) ( ON ?auto_2107867 ?auto_2107866 ) ( ON ?auto_2107868 ?auto_2107867 ) ( ON ?auto_2107869 ?auto_2107868 ) ( ON ?auto_2107870 ?auto_2107869 ) ( ON ?auto_2107871 ?auto_2107870 ) ( not ( = ?auto_2107859 ?auto_2107860 ) ) ( not ( = ?auto_2107859 ?auto_2107861 ) ) ( not ( = ?auto_2107859 ?auto_2107858 ) ) ( not ( = ?auto_2107859 ?auto_2107862 ) ) ( not ( = ?auto_2107859 ?auto_2107864 ) ) ( not ( = ?auto_2107859 ?auto_2107863 ) ) ( not ( = ?auto_2107859 ?auto_2107865 ) ) ( not ( = ?auto_2107859 ?auto_2107866 ) ) ( not ( = ?auto_2107859 ?auto_2107867 ) ) ( not ( = ?auto_2107859 ?auto_2107868 ) ) ( not ( = ?auto_2107859 ?auto_2107869 ) ) ( not ( = ?auto_2107859 ?auto_2107870 ) ) ( not ( = ?auto_2107859 ?auto_2107871 ) ) ( not ( = ?auto_2107859 ?auto_2107872 ) ) ( not ( = ?auto_2107859 ?auto_2107873 ) ) ( not ( = ?auto_2107859 ?auto_2107877 ) ) ( not ( = ?auto_2107860 ?auto_2107861 ) ) ( not ( = ?auto_2107860 ?auto_2107858 ) ) ( not ( = ?auto_2107860 ?auto_2107862 ) ) ( not ( = ?auto_2107860 ?auto_2107864 ) ) ( not ( = ?auto_2107860 ?auto_2107863 ) ) ( not ( = ?auto_2107860 ?auto_2107865 ) ) ( not ( = ?auto_2107860 ?auto_2107866 ) ) ( not ( = ?auto_2107860 ?auto_2107867 ) ) ( not ( = ?auto_2107860 ?auto_2107868 ) ) ( not ( = ?auto_2107860 ?auto_2107869 ) ) ( not ( = ?auto_2107860 ?auto_2107870 ) ) ( not ( = ?auto_2107860 ?auto_2107871 ) ) ( not ( = ?auto_2107860 ?auto_2107872 ) ) ( not ( = ?auto_2107860 ?auto_2107873 ) ) ( not ( = ?auto_2107860 ?auto_2107877 ) ) ( not ( = ?auto_2107861 ?auto_2107858 ) ) ( not ( = ?auto_2107861 ?auto_2107862 ) ) ( not ( = ?auto_2107861 ?auto_2107864 ) ) ( not ( = ?auto_2107861 ?auto_2107863 ) ) ( not ( = ?auto_2107861 ?auto_2107865 ) ) ( not ( = ?auto_2107861 ?auto_2107866 ) ) ( not ( = ?auto_2107861 ?auto_2107867 ) ) ( not ( = ?auto_2107861 ?auto_2107868 ) ) ( not ( = ?auto_2107861 ?auto_2107869 ) ) ( not ( = ?auto_2107861 ?auto_2107870 ) ) ( not ( = ?auto_2107861 ?auto_2107871 ) ) ( not ( = ?auto_2107861 ?auto_2107872 ) ) ( not ( = ?auto_2107861 ?auto_2107873 ) ) ( not ( = ?auto_2107861 ?auto_2107877 ) ) ( not ( = ?auto_2107858 ?auto_2107862 ) ) ( not ( = ?auto_2107858 ?auto_2107864 ) ) ( not ( = ?auto_2107858 ?auto_2107863 ) ) ( not ( = ?auto_2107858 ?auto_2107865 ) ) ( not ( = ?auto_2107858 ?auto_2107866 ) ) ( not ( = ?auto_2107858 ?auto_2107867 ) ) ( not ( = ?auto_2107858 ?auto_2107868 ) ) ( not ( = ?auto_2107858 ?auto_2107869 ) ) ( not ( = ?auto_2107858 ?auto_2107870 ) ) ( not ( = ?auto_2107858 ?auto_2107871 ) ) ( not ( = ?auto_2107858 ?auto_2107872 ) ) ( not ( = ?auto_2107858 ?auto_2107873 ) ) ( not ( = ?auto_2107858 ?auto_2107877 ) ) ( not ( = ?auto_2107862 ?auto_2107864 ) ) ( not ( = ?auto_2107862 ?auto_2107863 ) ) ( not ( = ?auto_2107862 ?auto_2107865 ) ) ( not ( = ?auto_2107862 ?auto_2107866 ) ) ( not ( = ?auto_2107862 ?auto_2107867 ) ) ( not ( = ?auto_2107862 ?auto_2107868 ) ) ( not ( = ?auto_2107862 ?auto_2107869 ) ) ( not ( = ?auto_2107862 ?auto_2107870 ) ) ( not ( = ?auto_2107862 ?auto_2107871 ) ) ( not ( = ?auto_2107862 ?auto_2107872 ) ) ( not ( = ?auto_2107862 ?auto_2107873 ) ) ( not ( = ?auto_2107862 ?auto_2107877 ) ) ( not ( = ?auto_2107864 ?auto_2107863 ) ) ( not ( = ?auto_2107864 ?auto_2107865 ) ) ( not ( = ?auto_2107864 ?auto_2107866 ) ) ( not ( = ?auto_2107864 ?auto_2107867 ) ) ( not ( = ?auto_2107864 ?auto_2107868 ) ) ( not ( = ?auto_2107864 ?auto_2107869 ) ) ( not ( = ?auto_2107864 ?auto_2107870 ) ) ( not ( = ?auto_2107864 ?auto_2107871 ) ) ( not ( = ?auto_2107864 ?auto_2107872 ) ) ( not ( = ?auto_2107864 ?auto_2107873 ) ) ( not ( = ?auto_2107864 ?auto_2107877 ) ) ( not ( = ?auto_2107863 ?auto_2107865 ) ) ( not ( = ?auto_2107863 ?auto_2107866 ) ) ( not ( = ?auto_2107863 ?auto_2107867 ) ) ( not ( = ?auto_2107863 ?auto_2107868 ) ) ( not ( = ?auto_2107863 ?auto_2107869 ) ) ( not ( = ?auto_2107863 ?auto_2107870 ) ) ( not ( = ?auto_2107863 ?auto_2107871 ) ) ( not ( = ?auto_2107863 ?auto_2107872 ) ) ( not ( = ?auto_2107863 ?auto_2107873 ) ) ( not ( = ?auto_2107863 ?auto_2107877 ) ) ( not ( = ?auto_2107865 ?auto_2107866 ) ) ( not ( = ?auto_2107865 ?auto_2107867 ) ) ( not ( = ?auto_2107865 ?auto_2107868 ) ) ( not ( = ?auto_2107865 ?auto_2107869 ) ) ( not ( = ?auto_2107865 ?auto_2107870 ) ) ( not ( = ?auto_2107865 ?auto_2107871 ) ) ( not ( = ?auto_2107865 ?auto_2107872 ) ) ( not ( = ?auto_2107865 ?auto_2107873 ) ) ( not ( = ?auto_2107865 ?auto_2107877 ) ) ( not ( = ?auto_2107866 ?auto_2107867 ) ) ( not ( = ?auto_2107866 ?auto_2107868 ) ) ( not ( = ?auto_2107866 ?auto_2107869 ) ) ( not ( = ?auto_2107866 ?auto_2107870 ) ) ( not ( = ?auto_2107866 ?auto_2107871 ) ) ( not ( = ?auto_2107866 ?auto_2107872 ) ) ( not ( = ?auto_2107866 ?auto_2107873 ) ) ( not ( = ?auto_2107866 ?auto_2107877 ) ) ( not ( = ?auto_2107867 ?auto_2107868 ) ) ( not ( = ?auto_2107867 ?auto_2107869 ) ) ( not ( = ?auto_2107867 ?auto_2107870 ) ) ( not ( = ?auto_2107867 ?auto_2107871 ) ) ( not ( = ?auto_2107867 ?auto_2107872 ) ) ( not ( = ?auto_2107867 ?auto_2107873 ) ) ( not ( = ?auto_2107867 ?auto_2107877 ) ) ( not ( = ?auto_2107868 ?auto_2107869 ) ) ( not ( = ?auto_2107868 ?auto_2107870 ) ) ( not ( = ?auto_2107868 ?auto_2107871 ) ) ( not ( = ?auto_2107868 ?auto_2107872 ) ) ( not ( = ?auto_2107868 ?auto_2107873 ) ) ( not ( = ?auto_2107868 ?auto_2107877 ) ) ( not ( = ?auto_2107869 ?auto_2107870 ) ) ( not ( = ?auto_2107869 ?auto_2107871 ) ) ( not ( = ?auto_2107869 ?auto_2107872 ) ) ( not ( = ?auto_2107869 ?auto_2107873 ) ) ( not ( = ?auto_2107869 ?auto_2107877 ) ) ( not ( = ?auto_2107870 ?auto_2107871 ) ) ( not ( = ?auto_2107870 ?auto_2107872 ) ) ( not ( = ?auto_2107870 ?auto_2107873 ) ) ( not ( = ?auto_2107870 ?auto_2107877 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2107871 ?auto_2107872 ?auto_2107873 )
      ( MAKE-15CRATE-VERIFY ?auto_2107859 ?auto_2107860 ?auto_2107861 ?auto_2107858 ?auto_2107862 ?auto_2107864 ?auto_2107863 ?auto_2107865 ?auto_2107866 ?auto_2107867 ?auto_2107868 ?auto_2107869 ?auto_2107870 ?auto_2107871 ?auto_2107872 ?auto_2107873 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2108085 - SURFACE
      ?auto_2108086 - SURFACE
      ?auto_2108087 - SURFACE
      ?auto_2108084 - SURFACE
      ?auto_2108088 - SURFACE
      ?auto_2108090 - SURFACE
      ?auto_2108089 - SURFACE
      ?auto_2108091 - SURFACE
      ?auto_2108092 - SURFACE
      ?auto_2108093 - SURFACE
      ?auto_2108094 - SURFACE
      ?auto_2108095 - SURFACE
      ?auto_2108096 - SURFACE
      ?auto_2108097 - SURFACE
      ?auto_2108098 - SURFACE
      ?auto_2108099 - SURFACE
    )
    :vars
    (
      ?auto_2108100 - HOIST
      ?auto_2108101 - PLACE
      ?auto_2108105 - PLACE
      ?auto_2108102 - HOIST
      ?auto_2108104 - SURFACE
      ?auto_2108103 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2108100 ?auto_2108101 ) ( IS-CRATE ?auto_2108099 ) ( not ( = ?auto_2108098 ?auto_2108099 ) ) ( not ( = ?auto_2108097 ?auto_2108098 ) ) ( not ( = ?auto_2108097 ?auto_2108099 ) ) ( not ( = ?auto_2108105 ?auto_2108101 ) ) ( HOIST-AT ?auto_2108102 ?auto_2108105 ) ( not ( = ?auto_2108100 ?auto_2108102 ) ) ( AVAILABLE ?auto_2108102 ) ( SURFACE-AT ?auto_2108099 ?auto_2108105 ) ( ON ?auto_2108099 ?auto_2108104 ) ( CLEAR ?auto_2108099 ) ( not ( = ?auto_2108098 ?auto_2108104 ) ) ( not ( = ?auto_2108099 ?auto_2108104 ) ) ( not ( = ?auto_2108097 ?auto_2108104 ) ) ( TRUCK-AT ?auto_2108103 ?auto_2108101 ) ( SURFACE-AT ?auto_2108097 ?auto_2108101 ) ( CLEAR ?auto_2108097 ) ( IS-CRATE ?auto_2108098 ) ( AVAILABLE ?auto_2108100 ) ( IN ?auto_2108098 ?auto_2108103 ) ( ON ?auto_2108086 ?auto_2108085 ) ( ON ?auto_2108087 ?auto_2108086 ) ( ON ?auto_2108084 ?auto_2108087 ) ( ON ?auto_2108088 ?auto_2108084 ) ( ON ?auto_2108090 ?auto_2108088 ) ( ON ?auto_2108089 ?auto_2108090 ) ( ON ?auto_2108091 ?auto_2108089 ) ( ON ?auto_2108092 ?auto_2108091 ) ( ON ?auto_2108093 ?auto_2108092 ) ( ON ?auto_2108094 ?auto_2108093 ) ( ON ?auto_2108095 ?auto_2108094 ) ( ON ?auto_2108096 ?auto_2108095 ) ( ON ?auto_2108097 ?auto_2108096 ) ( not ( = ?auto_2108085 ?auto_2108086 ) ) ( not ( = ?auto_2108085 ?auto_2108087 ) ) ( not ( = ?auto_2108085 ?auto_2108084 ) ) ( not ( = ?auto_2108085 ?auto_2108088 ) ) ( not ( = ?auto_2108085 ?auto_2108090 ) ) ( not ( = ?auto_2108085 ?auto_2108089 ) ) ( not ( = ?auto_2108085 ?auto_2108091 ) ) ( not ( = ?auto_2108085 ?auto_2108092 ) ) ( not ( = ?auto_2108085 ?auto_2108093 ) ) ( not ( = ?auto_2108085 ?auto_2108094 ) ) ( not ( = ?auto_2108085 ?auto_2108095 ) ) ( not ( = ?auto_2108085 ?auto_2108096 ) ) ( not ( = ?auto_2108085 ?auto_2108097 ) ) ( not ( = ?auto_2108085 ?auto_2108098 ) ) ( not ( = ?auto_2108085 ?auto_2108099 ) ) ( not ( = ?auto_2108085 ?auto_2108104 ) ) ( not ( = ?auto_2108086 ?auto_2108087 ) ) ( not ( = ?auto_2108086 ?auto_2108084 ) ) ( not ( = ?auto_2108086 ?auto_2108088 ) ) ( not ( = ?auto_2108086 ?auto_2108090 ) ) ( not ( = ?auto_2108086 ?auto_2108089 ) ) ( not ( = ?auto_2108086 ?auto_2108091 ) ) ( not ( = ?auto_2108086 ?auto_2108092 ) ) ( not ( = ?auto_2108086 ?auto_2108093 ) ) ( not ( = ?auto_2108086 ?auto_2108094 ) ) ( not ( = ?auto_2108086 ?auto_2108095 ) ) ( not ( = ?auto_2108086 ?auto_2108096 ) ) ( not ( = ?auto_2108086 ?auto_2108097 ) ) ( not ( = ?auto_2108086 ?auto_2108098 ) ) ( not ( = ?auto_2108086 ?auto_2108099 ) ) ( not ( = ?auto_2108086 ?auto_2108104 ) ) ( not ( = ?auto_2108087 ?auto_2108084 ) ) ( not ( = ?auto_2108087 ?auto_2108088 ) ) ( not ( = ?auto_2108087 ?auto_2108090 ) ) ( not ( = ?auto_2108087 ?auto_2108089 ) ) ( not ( = ?auto_2108087 ?auto_2108091 ) ) ( not ( = ?auto_2108087 ?auto_2108092 ) ) ( not ( = ?auto_2108087 ?auto_2108093 ) ) ( not ( = ?auto_2108087 ?auto_2108094 ) ) ( not ( = ?auto_2108087 ?auto_2108095 ) ) ( not ( = ?auto_2108087 ?auto_2108096 ) ) ( not ( = ?auto_2108087 ?auto_2108097 ) ) ( not ( = ?auto_2108087 ?auto_2108098 ) ) ( not ( = ?auto_2108087 ?auto_2108099 ) ) ( not ( = ?auto_2108087 ?auto_2108104 ) ) ( not ( = ?auto_2108084 ?auto_2108088 ) ) ( not ( = ?auto_2108084 ?auto_2108090 ) ) ( not ( = ?auto_2108084 ?auto_2108089 ) ) ( not ( = ?auto_2108084 ?auto_2108091 ) ) ( not ( = ?auto_2108084 ?auto_2108092 ) ) ( not ( = ?auto_2108084 ?auto_2108093 ) ) ( not ( = ?auto_2108084 ?auto_2108094 ) ) ( not ( = ?auto_2108084 ?auto_2108095 ) ) ( not ( = ?auto_2108084 ?auto_2108096 ) ) ( not ( = ?auto_2108084 ?auto_2108097 ) ) ( not ( = ?auto_2108084 ?auto_2108098 ) ) ( not ( = ?auto_2108084 ?auto_2108099 ) ) ( not ( = ?auto_2108084 ?auto_2108104 ) ) ( not ( = ?auto_2108088 ?auto_2108090 ) ) ( not ( = ?auto_2108088 ?auto_2108089 ) ) ( not ( = ?auto_2108088 ?auto_2108091 ) ) ( not ( = ?auto_2108088 ?auto_2108092 ) ) ( not ( = ?auto_2108088 ?auto_2108093 ) ) ( not ( = ?auto_2108088 ?auto_2108094 ) ) ( not ( = ?auto_2108088 ?auto_2108095 ) ) ( not ( = ?auto_2108088 ?auto_2108096 ) ) ( not ( = ?auto_2108088 ?auto_2108097 ) ) ( not ( = ?auto_2108088 ?auto_2108098 ) ) ( not ( = ?auto_2108088 ?auto_2108099 ) ) ( not ( = ?auto_2108088 ?auto_2108104 ) ) ( not ( = ?auto_2108090 ?auto_2108089 ) ) ( not ( = ?auto_2108090 ?auto_2108091 ) ) ( not ( = ?auto_2108090 ?auto_2108092 ) ) ( not ( = ?auto_2108090 ?auto_2108093 ) ) ( not ( = ?auto_2108090 ?auto_2108094 ) ) ( not ( = ?auto_2108090 ?auto_2108095 ) ) ( not ( = ?auto_2108090 ?auto_2108096 ) ) ( not ( = ?auto_2108090 ?auto_2108097 ) ) ( not ( = ?auto_2108090 ?auto_2108098 ) ) ( not ( = ?auto_2108090 ?auto_2108099 ) ) ( not ( = ?auto_2108090 ?auto_2108104 ) ) ( not ( = ?auto_2108089 ?auto_2108091 ) ) ( not ( = ?auto_2108089 ?auto_2108092 ) ) ( not ( = ?auto_2108089 ?auto_2108093 ) ) ( not ( = ?auto_2108089 ?auto_2108094 ) ) ( not ( = ?auto_2108089 ?auto_2108095 ) ) ( not ( = ?auto_2108089 ?auto_2108096 ) ) ( not ( = ?auto_2108089 ?auto_2108097 ) ) ( not ( = ?auto_2108089 ?auto_2108098 ) ) ( not ( = ?auto_2108089 ?auto_2108099 ) ) ( not ( = ?auto_2108089 ?auto_2108104 ) ) ( not ( = ?auto_2108091 ?auto_2108092 ) ) ( not ( = ?auto_2108091 ?auto_2108093 ) ) ( not ( = ?auto_2108091 ?auto_2108094 ) ) ( not ( = ?auto_2108091 ?auto_2108095 ) ) ( not ( = ?auto_2108091 ?auto_2108096 ) ) ( not ( = ?auto_2108091 ?auto_2108097 ) ) ( not ( = ?auto_2108091 ?auto_2108098 ) ) ( not ( = ?auto_2108091 ?auto_2108099 ) ) ( not ( = ?auto_2108091 ?auto_2108104 ) ) ( not ( = ?auto_2108092 ?auto_2108093 ) ) ( not ( = ?auto_2108092 ?auto_2108094 ) ) ( not ( = ?auto_2108092 ?auto_2108095 ) ) ( not ( = ?auto_2108092 ?auto_2108096 ) ) ( not ( = ?auto_2108092 ?auto_2108097 ) ) ( not ( = ?auto_2108092 ?auto_2108098 ) ) ( not ( = ?auto_2108092 ?auto_2108099 ) ) ( not ( = ?auto_2108092 ?auto_2108104 ) ) ( not ( = ?auto_2108093 ?auto_2108094 ) ) ( not ( = ?auto_2108093 ?auto_2108095 ) ) ( not ( = ?auto_2108093 ?auto_2108096 ) ) ( not ( = ?auto_2108093 ?auto_2108097 ) ) ( not ( = ?auto_2108093 ?auto_2108098 ) ) ( not ( = ?auto_2108093 ?auto_2108099 ) ) ( not ( = ?auto_2108093 ?auto_2108104 ) ) ( not ( = ?auto_2108094 ?auto_2108095 ) ) ( not ( = ?auto_2108094 ?auto_2108096 ) ) ( not ( = ?auto_2108094 ?auto_2108097 ) ) ( not ( = ?auto_2108094 ?auto_2108098 ) ) ( not ( = ?auto_2108094 ?auto_2108099 ) ) ( not ( = ?auto_2108094 ?auto_2108104 ) ) ( not ( = ?auto_2108095 ?auto_2108096 ) ) ( not ( = ?auto_2108095 ?auto_2108097 ) ) ( not ( = ?auto_2108095 ?auto_2108098 ) ) ( not ( = ?auto_2108095 ?auto_2108099 ) ) ( not ( = ?auto_2108095 ?auto_2108104 ) ) ( not ( = ?auto_2108096 ?auto_2108097 ) ) ( not ( = ?auto_2108096 ?auto_2108098 ) ) ( not ( = ?auto_2108096 ?auto_2108099 ) ) ( not ( = ?auto_2108096 ?auto_2108104 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2108097 ?auto_2108098 ?auto_2108099 )
      ( MAKE-15CRATE-VERIFY ?auto_2108085 ?auto_2108086 ?auto_2108087 ?auto_2108084 ?auto_2108088 ?auto_2108090 ?auto_2108089 ?auto_2108091 ?auto_2108092 ?auto_2108093 ?auto_2108094 ?auto_2108095 ?auto_2108096 ?auto_2108097 ?auto_2108098 ?auto_2108099 ) )
  )

)

