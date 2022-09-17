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
      ?auto_1702886 - SURFACE
      ?auto_1702887 - SURFACE
    )
    :vars
    (
      ?auto_1702888 - HOIST
      ?auto_1702889 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702888 ?auto_1702889 ) ( SURFACE-AT ?auto_1702886 ?auto_1702889 ) ( CLEAR ?auto_1702886 ) ( LIFTING ?auto_1702888 ?auto_1702887 ) ( IS-CRATE ?auto_1702887 ) ( not ( = ?auto_1702886 ?auto_1702887 ) ) )
    :subtasks
    ( ( !DROP ?auto_1702888 ?auto_1702887 ?auto_1702886 ?auto_1702889 )
      ( MAKE-1CRATE-VERIFY ?auto_1702886 ?auto_1702887 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1702890 - SURFACE
      ?auto_1702891 - SURFACE
    )
    :vars
    (
      ?auto_1702892 - HOIST
      ?auto_1702893 - PLACE
      ?auto_1702894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702892 ?auto_1702893 ) ( SURFACE-AT ?auto_1702890 ?auto_1702893 ) ( CLEAR ?auto_1702890 ) ( IS-CRATE ?auto_1702891 ) ( not ( = ?auto_1702890 ?auto_1702891 ) ) ( TRUCK-AT ?auto_1702894 ?auto_1702893 ) ( AVAILABLE ?auto_1702892 ) ( IN ?auto_1702891 ?auto_1702894 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1702892 ?auto_1702891 ?auto_1702894 ?auto_1702893 )
      ( MAKE-1CRATE ?auto_1702890 ?auto_1702891 )
      ( MAKE-1CRATE-VERIFY ?auto_1702890 ?auto_1702891 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1702895 - SURFACE
      ?auto_1702896 - SURFACE
    )
    :vars
    (
      ?auto_1702897 - HOIST
      ?auto_1702899 - PLACE
      ?auto_1702898 - TRUCK
      ?auto_1702900 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702897 ?auto_1702899 ) ( SURFACE-AT ?auto_1702895 ?auto_1702899 ) ( CLEAR ?auto_1702895 ) ( IS-CRATE ?auto_1702896 ) ( not ( = ?auto_1702895 ?auto_1702896 ) ) ( AVAILABLE ?auto_1702897 ) ( IN ?auto_1702896 ?auto_1702898 ) ( TRUCK-AT ?auto_1702898 ?auto_1702900 ) ( not ( = ?auto_1702900 ?auto_1702899 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1702898 ?auto_1702900 ?auto_1702899 )
      ( MAKE-1CRATE ?auto_1702895 ?auto_1702896 )
      ( MAKE-1CRATE-VERIFY ?auto_1702895 ?auto_1702896 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1702901 - SURFACE
      ?auto_1702902 - SURFACE
    )
    :vars
    (
      ?auto_1702905 - HOIST
      ?auto_1702906 - PLACE
      ?auto_1702903 - TRUCK
      ?auto_1702904 - PLACE
      ?auto_1702907 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702905 ?auto_1702906 ) ( SURFACE-AT ?auto_1702901 ?auto_1702906 ) ( CLEAR ?auto_1702901 ) ( IS-CRATE ?auto_1702902 ) ( not ( = ?auto_1702901 ?auto_1702902 ) ) ( AVAILABLE ?auto_1702905 ) ( TRUCK-AT ?auto_1702903 ?auto_1702904 ) ( not ( = ?auto_1702904 ?auto_1702906 ) ) ( HOIST-AT ?auto_1702907 ?auto_1702904 ) ( LIFTING ?auto_1702907 ?auto_1702902 ) ( not ( = ?auto_1702905 ?auto_1702907 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1702907 ?auto_1702902 ?auto_1702903 ?auto_1702904 )
      ( MAKE-1CRATE ?auto_1702901 ?auto_1702902 )
      ( MAKE-1CRATE-VERIFY ?auto_1702901 ?auto_1702902 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1702908 - SURFACE
      ?auto_1702909 - SURFACE
    )
    :vars
    (
      ?auto_1702913 - HOIST
      ?auto_1702914 - PLACE
      ?auto_1702911 - TRUCK
      ?auto_1702910 - PLACE
      ?auto_1702912 - HOIST
      ?auto_1702915 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702913 ?auto_1702914 ) ( SURFACE-AT ?auto_1702908 ?auto_1702914 ) ( CLEAR ?auto_1702908 ) ( IS-CRATE ?auto_1702909 ) ( not ( = ?auto_1702908 ?auto_1702909 ) ) ( AVAILABLE ?auto_1702913 ) ( TRUCK-AT ?auto_1702911 ?auto_1702910 ) ( not ( = ?auto_1702910 ?auto_1702914 ) ) ( HOIST-AT ?auto_1702912 ?auto_1702910 ) ( not ( = ?auto_1702913 ?auto_1702912 ) ) ( AVAILABLE ?auto_1702912 ) ( SURFACE-AT ?auto_1702909 ?auto_1702910 ) ( ON ?auto_1702909 ?auto_1702915 ) ( CLEAR ?auto_1702909 ) ( not ( = ?auto_1702908 ?auto_1702915 ) ) ( not ( = ?auto_1702909 ?auto_1702915 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1702912 ?auto_1702909 ?auto_1702915 ?auto_1702910 )
      ( MAKE-1CRATE ?auto_1702908 ?auto_1702909 )
      ( MAKE-1CRATE-VERIFY ?auto_1702908 ?auto_1702909 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1702916 - SURFACE
      ?auto_1702917 - SURFACE
    )
    :vars
    (
      ?auto_1702921 - HOIST
      ?auto_1702919 - PLACE
      ?auto_1702920 - PLACE
      ?auto_1702923 - HOIST
      ?auto_1702918 - SURFACE
      ?auto_1702922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702921 ?auto_1702919 ) ( SURFACE-AT ?auto_1702916 ?auto_1702919 ) ( CLEAR ?auto_1702916 ) ( IS-CRATE ?auto_1702917 ) ( not ( = ?auto_1702916 ?auto_1702917 ) ) ( AVAILABLE ?auto_1702921 ) ( not ( = ?auto_1702920 ?auto_1702919 ) ) ( HOIST-AT ?auto_1702923 ?auto_1702920 ) ( not ( = ?auto_1702921 ?auto_1702923 ) ) ( AVAILABLE ?auto_1702923 ) ( SURFACE-AT ?auto_1702917 ?auto_1702920 ) ( ON ?auto_1702917 ?auto_1702918 ) ( CLEAR ?auto_1702917 ) ( not ( = ?auto_1702916 ?auto_1702918 ) ) ( not ( = ?auto_1702917 ?auto_1702918 ) ) ( TRUCK-AT ?auto_1702922 ?auto_1702919 ) )
    :subtasks
    ( ( !DRIVE ?auto_1702922 ?auto_1702919 ?auto_1702920 )
      ( MAKE-1CRATE ?auto_1702916 ?auto_1702917 )
      ( MAKE-1CRATE-VERIFY ?auto_1702916 ?auto_1702917 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1702933 - SURFACE
      ?auto_1702934 - SURFACE
      ?auto_1702935 - SURFACE
    )
    :vars
    (
      ?auto_1702936 - HOIST
      ?auto_1702937 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702936 ?auto_1702937 ) ( SURFACE-AT ?auto_1702934 ?auto_1702937 ) ( CLEAR ?auto_1702934 ) ( LIFTING ?auto_1702936 ?auto_1702935 ) ( IS-CRATE ?auto_1702935 ) ( not ( = ?auto_1702934 ?auto_1702935 ) ) ( ON ?auto_1702934 ?auto_1702933 ) ( not ( = ?auto_1702933 ?auto_1702934 ) ) ( not ( = ?auto_1702933 ?auto_1702935 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1702934 ?auto_1702935 )
      ( MAKE-2CRATE-VERIFY ?auto_1702933 ?auto_1702934 ?auto_1702935 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1702943 - SURFACE
      ?auto_1702944 - SURFACE
      ?auto_1702945 - SURFACE
    )
    :vars
    (
      ?auto_1702947 - HOIST
      ?auto_1702948 - PLACE
      ?auto_1702946 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702947 ?auto_1702948 ) ( SURFACE-AT ?auto_1702944 ?auto_1702948 ) ( CLEAR ?auto_1702944 ) ( IS-CRATE ?auto_1702945 ) ( not ( = ?auto_1702944 ?auto_1702945 ) ) ( TRUCK-AT ?auto_1702946 ?auto_1702948 ) ( AVAILABLE ?auto_1702947 ) ( IN ?auto_1702945 ?auto_1702946 ) ( ON ?auto_1702944 ?auto_1702943 ) ( not ( = ?auto_1702943 ?auto_1702944 ) ) ( not ( = ?auto_1702943 ?auto_1702945 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1702944 ?auto_1702945 )
      ( MAKE-2CRATE-VERIFY ?auto_1702943 ?auto_1702944 ?auto_1702945 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1702949 - SURFACE
      ?auto_1702950 - SURFACE
    )
    :vars
    (
      ?auto_1702952 - HOIST
      ?auto_1702951 - PLACE
      ?auto_1702953 - TRUCK
      ?auto_1702954 - SURFACE
      ?auto_1702955 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702952 ?auto_1702951 ) ( SURFACE-AT ?auto_1702949 ?auto_1702951 ) ( CLEAR ?auto_1702949 ) ( IS-CRATE ?auto_1702950 ) ( not ( = ?auto_1702949 ?auto_1702950 ) ) ( AVAILABLE ?auto_1702952 ) ( IN ?auto_1702950 ?auto_1702953 ) ( ON ?auto_1702949 ?auto_1702954 ) ( not ( = ?auto_1702954 ?auto_1702949 ) ) ( not ( = ?auto_1702954 ?auto_1702950 ) ) ( TRUCK-AT ?auto_1702953 ?auto_1702955 ) ( not ( = ?auto_1702955 ?auto_1702951 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1702953 ?auto_1702955 ?auto_1702951 )
      ( MAKE-2CRATE ?auto_1702954 ?auto_1702949 ?auto_1702950 )
      ( MAKE-1CRATE-VERIFY ?auto_1702949 ?auto_1702950 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1702956 - SURFACE
      ?auto_1702957 - SURFACE
      ?auto_1702958 - SURFACE
    )
    :vars
    (
      ?auto_1702961 - HOIST
      ?auto_1702959 - PLACE
      ?auto_1702960 - TRUCK
      ?auto_1702962 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702961 ?auto_1702959 ) ( SURFACE-AT ?auto_1702957 ?auto_1702959 ) ( CLEAR ?auto_1702957 ) ( IS-CRATE ?auto_1702958 ) ( not ( = ?auto_1702957 ?auto_1702958 ) ) ( AVAILABLE ?auto_1702961 ) ( IN ?auto_1702958 ?auto_1702960 ) ( ON ?auto_1702957 ?auto_1702956 ) ( not ( = ?auto_1702956 ?auto_1702957 ) ) ( not ( = ?auto_1702956 ?auto_1702958 ) ) ( TRUCK-AT ?auto_1702960 ?auto_1702962 ) ( not ( = ?auto_1702962 ?auto_1702959 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1702957 ?auto_1702958 )
      ( MAKE-2CRATE-VERIFY ?auto_1702956 ?auto_1702957 ?auto_1702958 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1702963 - SURFACE
      ?auto_1702964 - SURFACE
    )
    :vars
    (
      ?auto_1702965 - HOIST
      ?auto_1702966 - PLACE
      ?auto_1702969 - SURFACE
      ?auto_1702968 - TRUCK
      ?auto_1702967 - PLACE
      ?auto_1702970 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702965 ?auto_1702966 ) ( SURFACE-AT ?auto_1702963 ?auto_1702966 ) ( CLEAR ?auto_1702963 ) ( IS-CRATE ?auto_1702964 ) ( not ( = ?auto_1702963 ?auto_1702964 ) ) ( AVAILABLE ?auto_1702965 ) ( ON ?auto_1702963 ?auto_1702969 ) ( not ( = ?auto_1702969 ?auto_1702963 ) ) ( not ( = ?auto_1702969 ?auto_1702964 ) ) ( TRUCK-AT ?auto_1702968 ?auto_1702967 ) ( not ( = ?auto_1702967 ?auto_1702966 ) ) ( HOIST-AT ?auto_1702970 ?auto_1702967 ) ( LIFTING ?auto_1702970 ?auto_1702964 ) ( not ( = ?auto_1702965 ?auto_1702970 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1702970 ?auto_1702964 ?auto_1702968 ?auto_1702967 )
      ( MAKE-2CRATE ?auto_1702969 ?auto_1702963 ?auto_1702964 )
      ( MAKE-1CRATE-VERIFY ?auto_1702963 ?auto_1702964 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1702971 - SURFACE
      ?auto_1702972 - SURFACE
      ?auto_1702973 - SURFACE
    )
    :vars
    (
      ?auto_1702976 - HOIST
      ?auto_1702977 - PLACE
      ?auto_1702974 - TRUCK
      ?auto_1702978 - PLACE
      ?auto_1702975 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702976 ?auto_1702977 ) ( SURFACE-AT ?auto_1702972 ?auto_1702977 ) ( CLEAR ?auto_1702972 ) ( IS-CRATE ?auto_1702973 ) ( not ( = ?auto_1702972 ?auto_1702973 ) ) ( AVAILABLE ?auto_1702976 ) ( ON ?auto_1702972 ?auto_1702971 ) ( not ( = ?auto_1702971 ?auto_1702972 ) ) ( not ( = ?auto_1702971 ?auto_1702973 ) ) ( TRUCK-AT ?auto_1702974 ?auto_1702978 ) ( not ( = ?auto_1702978 ?auto_1702977 ) ) ( HOIST-AT ?auto_1702975 ?auto_1702978 ) ( LIFTING ?auto_1702975 ?auto_1702973 ) ( not ( = ?auto_1702976 ?auto_1702975 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1702972 ?auto_1702973 )
      ( MAKE-2CRATE-VERIFY ?auto_1702971 ?auto_1702972 ?auto_1702973 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1702979 - SURFACE
      ?auto_1702980 - SURFACE
    )
    :vars
    (
      ?auto_1702986 - HOIST
      ?auto_1702981 - PLACE
      ?auto_1702982 - SURFACE
      ?auto_1702985 - TRUCK
      ?auto_1702984 - PLACE
      ?auto_1702983 - HOIST
      ?auto_1702987 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702986 ?auto_1702981 ) ( SURFACE-AT ?auto_1702979 ?auto_1702981 ) ( CLEAR ?auto_1702979 ) ( IS-CRATE ?auto_1702980 ) ( not ( = ?auto_1702979 ?auto_1702980 ) ) ( AVAILABLE ?auto_1702986 ) ( ON ?auto_1702979 ?auto_1702982 ) ( not ( = ?auto_1702982 ?auto_1702979 ) ) ( not ( = ?auto_1702982 ?auto_1702980 ) ) ( TRUCK-AT ?auto_1702985 ?auto_1702984 ) ( not ( = ?auto_1702984 ?auto_1702981 ) ) ( HOIST-AT ?auto_1702983 ?auto_1702984 ) ( not ( = ?auto_1702986 ?auto_1702983 ) ) ( AVAILABLE ?auto_1702983 ) ( SURFACE-AT ?auto_1702980 ?auto_1702984 ) ( ON ?auto_1702980 ?auto_1702987 ) ( CLEAR ?auto_1702980 ) ( not ( = ?auto_1702979 ?auto_1702987 ) ) ( not ( = ?auto_1702980 ?auto_1702987 ) ) ( not ( = ?auto_1702982 ?auto_1702987 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1702983 ?auto_1702980 ?auto_1702987 ?auto_1702984 )
      ( MAKE-2CRATE ?auto_1702982 ?auto_1702979 ?auto_1702980 )
      ( MAKE-1CRATE-VERIFY ?auto_1702979 ?auto_1702980 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1702988 - SURFACE
      ?auto_1702989 - SURFACE
      ?auto_1702990 - SURFACE
    )
    :vars
    (
      ?auto_1702991 - HOIST
      ?auto_1702996 - PLACE
      ?auto_1702993 - TRUCK
      ?auto_1702994 - PLACE
      ?auto_1702995 - HOIST
      ?auto_1702992 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702991 ?auto_1702996 ) ( SURFACE-AT ?auto_1702989 ?auto_1702996 ) ( CLEAR ?auto_1702989 ) ( IS-CRATE ?auto_1702990 ) ( not ( = ?auto_1702989 ?auto_1702990 ) ) ( AVAILABLE ?auto_1702991 ) ( ON ?auto_1702989 ?auto_1702988 ) ( not ( = ?auto_1702988 ?auto_1702989 ) ) ( not ( = ?auto_1702988 ?auto_1702990 ) ) ( TRUCK-AT ?auto_1702993 ?auto_1702994 ) ( not ( = ?auto_1702994 ?auto_1702996 ) ) ( HOIST-AT ?auto_1702995 ?auto_1702994 ) ( not ( = ?auto_1702991 ?auto_1702995 ) ) ( AVAILABLE ?auto_1702995 ) ( SURFACE-AT ?auto_1702990 ?auto_1702994 ) ( ON ?auto_1702990 ?auto_1702992 ) ( CLEAR ?auto_1702990 ) ( not ( = ?auto_1702989 ?auto_1702992 ) ) ( not ( = ?auto_1702990 ?auto_1702992 ) ) ( not ( = ?auto_1702988 ?auto_1702992 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1702989 ?auto_1702990 )
      ( MAKE-2CRATE-VERIFY ?auto_1702988 ?auto_1702989 ?auto_1702990 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1702997 - SURFACE
      ?auto_1702998 - SURFACE
    )
    :vars
    (
      ?auto_1702999 - HOIST
      ?auto_1703002 - PLACE
      ?auto_1703004 - SURFACE
      ?auto_1703001 - PLACE
      ?auto_1703003 - HOIST
      ?auto_1703005 - SURFACE
      ?auto_1703000 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702999 ?auto_1703002 ) ( SURFACE-AT ?auto_1702997 ?auto_1703002 ) ( CLEAR ?auto_1702997 ) ( IS-CRATE ?auto_1702998 ) ( not ( = ?auto_1702997 ?auto_1702998 ) ) ( AVAILABLE ?auto_1702999 ) ( ON ?auto_1702997 ?auto_1703004 ) ( not ( = ?auto_1703004 ?auto_1702997 ) ) ( not ( = ?auto_1703004 ?auto_1702998 ) ) ( not ( = ?auto_1703001 ?auto_1703002 ) ) ( HOIST-AT ?auto_1703003 ?auto_1703001 ) ( not ( = ?auto_1702999 ?auto_1703003 ) ) ( AVAILABLE ?auto_1703003 ) ( SURFACE-AT ?auto_1702998 ?auto_1703001 ) ( ON ?auto_1702998 ?auto_1703005 ) ( CLEAR ?auto_1702998 ) ( not ( = ?auto_1702997 ?auto_1703005 ) ) ( not ( = ?auto_1702998 ?auto_1703005 ) ) ( not ( = ?auto_1703004 ?auto_1703005 ) ) ( TRUCK-AT ?auto_1703000 ?auto_1703002 ) )
    :subtasks
    ( ( !DRIVE ?auto_1703000 ?auto_1703002 ?auto_1703001 )
      ( MAKE-2CRATE ?auto_1703004 ?auto_1702997 ?auto_1702998 )
      ( MAKE-1CRATE-VERIFY ?auto_1702997 ?auto_1702998 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1703006 - SURFACE
      ?auto_1703007 - SURFACE
      ?auto_1703008 - SURFACE
    )
    :vars
    (
      ?auto_1703012 - HOIST
      ?auto_1703014 - PLACE
      ?auto_1703010 - PLACE
      ?auto_1703013 - HOIST
      ?auto_1703009 - SURFACE
      ?auto_1703011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703012 ?auto_1703014 ) ( SURFACE-AT ?auto_1703007 ?auto_1703014 ) ( CLEAR ?auto_1703007 ) ( IS-CRATE ?auto_1703008 ) ( not ( = ?auto_1703007 ?auto_1703008 ) ) ( AVAILABLE ?auto_1703012 ) ( ON ?auto_1703007 ?auto_1703006 ) ( not ( = ?auto_1703006 ?auto_1703007 ) ) ( not ( = ?auto_1703006 ?auto_1703008 ) ) ( not ( = ?auto_1703010 ?auto_1703014 ) ) ( HOIST-AT ?auto_1703013 ?auto_1703010 ) ( not ( = ?auto_1703012 ?auto_1703013 ) ) ( AVAILABLE ?auto_1703013 ) ( SURFACE-AT ?auto_1703008 ?auto_1703010 ) ( ON ?auto_1703008 ?auto_1703009 ) ( CLEAR ?auto_1703008 ) ( not ( = ?auto_1703007 ?auto_1703009 ) ) ( not ( = ?auto_1703008 ?auto_1703009 ) ) ( not ( = ?auto_1703006 ?auto_1703009 ) ) ( TRUCK-AT ?auto_1703011 ?auto_1703014 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1703007 ?auto_1703008 )
      ( MAKE-2CRATE-VERIFY ?auto_1703006 ?auto_1703007 ?auto_1703008 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1703015 - SURFACE
      ?auto_1703016 - SURFACE
    )
    :vars
    (
      ?auto_1703022 - HOIST
      ?auto_1703021 - PLACE
      ?auto_1703019 - SURFACE
      ?auto_1703023 - PLACE
      ?auto_1703020 - HOIST
      ?auto_1703017 - SURFACE
      ?auto_1703018 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703022 ?auto_1703021 ) ( IS-CRATE ?auto_1703016 ) ( not ( = ?auto_1703015 ?auto_1703016 ) ) ( not ( = ?auto_1703019 ?auto_1703015 ) ) ( not ( = ?auto_1703019 ?auto_1703016 ) ) ( not ( = ?auto_1703023 ?auto_1703021 ) ) ( HOIST-AT ?auto_1703020 ?auto_1703023 ) ( not ( = ?auto_1703022 ?auto_1703020 ) ) ( AVAILABLE ?auto_1703020 ) ( SURFACE-AT ?auto_1703016 ?auto_1703023 ) ( ON ?auto_1703016 ?auto_1703017 ) ( CLEAR ?auto_1703016 ) ( not ( = ?auto_1703015 ?auto_1703017 ) ) ( not ( = ?auto_1703016 ?auto_1703017 ) ) ( not ( = ?auto_1703019 ?auto_1703017 ) ) ( TRUCK-AT ?auto_1703018 ?auto_1703021 ) ( SURFACE-AT ?auto_1703019 ?auto_1703021 ) ( CLEAR ?auto_1703019 ) ( LIFTING ?auto_1703022 ?auto_1703015 ) ( IS-CRATE ?auto_1703015 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1703019 ?auto_1703015 )
      ( MAKE-2CRATE ?auto_1703019 ?auto_1703015 ?auto_1703016 )
      ( MAKE-1CRATE-VERIFY ?auto_1703015 ?auto_1703016 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1703024 - SURFACE
      ?auto_1703025 - SURFACE
      ?auto_1703026 - SURFACE
    )
    :vars
    (
      ?auto_1703029 - HOIST
      ?auto_1703028 - PLACE
      ?auto_1703027 - PLACE
      ?auto_1703030 - HOIST
      ?auto_1703032 - SURFACE
      ?auto_1703031 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703029 ?auto_1703028 ) ( IS-CRATE ?auto_1703026 ) ( not ( = ?auto_1703025 ?auto_1703026 ) ) ( not ( = ?auto_1703024 ?auto_1703025 ) ) ( not ( = ?auto_1703024 ?auto_1703026 ) ) ( not ( = ?auto_1703027 ?auto_1703028 ) ) ( HOIST-AT ?auto_1703030 ?auto_1703027 ) ( not ( = ?auto_1703029 ?auto_1703030 ) ) ( AVAILABLE ?auto_1703030 ) ( SURFACE-AT ?auto_1703026 ?auto_1703027 ) ( ON ?auto_1703026 ?auto_1703032 ) ( CLEAR ?auto_1703026 ) ( not ( = ?auto_1703025 ?auto_1703032 ) ) ( not ( = ?auto_1703026 ?auto_1703032 ) ) ( not ( = ?auto_1703024 ?auto_1703032 ) ) ( TRUCK-AT ?auto_1703031 ?auto_1703028 ) ( SURFACE-AT ?auto_1703024 ?auto_1703028 ) ( CLEAR ?auto_1703024 ) ( LIFTING ?auto_1703029 ?auto_1703025 ) ( IS-CRATE ?auto_1703025 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1703025 ?auto_1703026 )
      ( MAKE-2CRATE-VERIFY ?auto_1703024 ?auto_1703025 ?auto_1703026 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1703033 - SURFACE
      ?auto_1703034 - SURFACE
    )
    :vars
    (
      ?auto_1703039 - HOIST
      ?auto_1703041 - PLACE
      ?auto_1703037 - SURFACE
      ?auto_1703035 - PLACE
      ?auto_1703038 - HOIST
      ?auto_1703036 - SURFACE
      ?auto_1703040 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703039 ?auto_1703041 ) ( IS-CRATE ?auto_1703034 ) ( not ( = ?auto_1703033 ?auto_1703034 ) ) ( not ( = ?auto_1703037 ?auto_1703033 ) ) ( not ( = ?auto_1703037 ?auto_1703034 ) ) ( not ( = ?auto_1703035 ?auto_1703041 ) ) ( HOIST-AT ?auto_1703038 ?auto_1703035 ) ( not ( = ?auto_1703039 ?auto_1703038 ) ) ( AVAILABLE ?auto_1703038 ) ( SURFACE-AT ?auto_1703034 ?auto_1703035 ) ( ON ?auto_1703034 ?auto_1703036 ) ( CLEAR ?auto_1703034 ) ( not ( = ?auto_1703033 ?auto_1703036 ) ) ( not ( = ?auto_1703034 ?auto_1703036 ) ) ( not ( = ?auto_1703037 ?auto_1703036 ) ) ( TRUCK-AT ?auto_1703040 ?auto_1703041 ) ( SURFACE-AT ?auto_1703037 ?auto_1703041 ) ( CLEAR ?auto_1703037 ) ( IS-CRATE ?auto_1703033 ) ( AVAILABLE ?auto_1703039 ) ( IN ?auto_1703033 ?auto_1703040 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1703039 ?auto_1703033 ?auto_1703040 ?auto_1703041 )
      ( MAKE-2CRATE ?auto_1703037 ?auto_1703033 ?auto_1703034 )
      ( MAKE-1CRATE-VERIFY ?auto_1703033 ?auto_1703034 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1703042 - SURFACE
      ?auto_1703043 - SURFACE
      ?auto_1703044 - SURFACE
    )
    :vars
    (
      ?auto_1703049 - HOIST
      ?auto_1703045 - PLACE
      ?auto_1703047 - PLACE
      ?auto_1703050 - HOIST
      ?auto_1703048 - SURFACE
      ?auto_1703046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703049 ?auto_1703045 ) ( IS-CRATE ?auto_1703044 ) ( not ( = ?auto_1703043 ?auto_1703044 ) ) ( not ( = ?auto_1703042 ?auto_1703043 ) ) ( not ( = ?auto_1703042 ?auto_1703044 ) ) ( not ( = ?auto_1703047 ?auto_1703045 ) ) ( HOIST-AT ?auto_1703050 ?auto_1703047 ) ( not ( = ?auto_1703049 ?auto_1703050 ) ) ( AVAILABLE ?auto_1703050 ) ( SURFACE-AT ?auto_1703044 ?auto_1703047 ) ( ON ?auto_1703044 ?auto_1703048 ) ( CLEAR ?auto_1703044 ) ( not ( = ?auto_1703043 ?auto_1703048 ) ) ( not ( = ?auto_1703044 ?auto_1703048 ) ) ( not ( = ?auto_1703042 ?auto_1703048 ) ) ( TRUCK-AT ?auto_1703046 ?auto_1703045 ) ( SURFACE-AT ?auto_1703042 ?auto_1703045 ) ( CLEAR ?auto_1703042 ) ( IS-CRATE ?auto_1703043 ) ( AVAILABLE ?auto_1703049 ) ( IN ?auto_1703043 ?auto_1703046 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1703043 ?auto_1703044 )
      ( MAKE-2CRATE-VERIFY ?auto_1703042 ?auto_1703043 ?auto_1703044 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1703087 - SURFACE
      ?auto_1703088 - SURFACE
    )
    :vars
    (
      ?auto_1703091 - HOIST
      ?auto_1703095 - PLACE
      ?auto_1703093 - SURFACE
      ?auto_1703090 - PLACE
      ?auto_1703094 - HOIST
      ?auto_1703089 - SURFACE
      ?auto_1703092 - TRUCK
      ?auto_1703096 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703091 ?auto_1703095 ) ( SURFACE-AT ?auto_1703087 ?auto_1703095 ) ( CLEAR ?auto_1703087 ) ( IS-CRATE ?auto_1703088 ) ( not ( = ?auto_1703087 ?auto_1703088 ) ) ( AVAILABLE ?auto_1703091 ) ( ON ?auto_1703087 ?auto_1703093 ) ( not ( = ?auto_1703093 ?auto_1703087 ) ) ( not ( = ?auto_1703093 ?auto_1703088 ) ) ( not ( = ?auto_1703090 ?auto_1703095 ) ) ( HOIST-AT ?auto_1703094 ?auto_1703090 ) ( not ( = ?auto_1703091 ?auto_1703094 ) ) ( AVAILABLE ?auto_1703094 ) ( SURFACE-AT ?auto_1703088 ?auto_1703090 ) ( ON ?auto_1703088 ?auto_1703089 ) ( CLEAR ?auto_1703088 ) ( not ( = ?auto_1703087 ?auto_1703089 ) ) ( not ( = ?auto_1703088 ?auto_1703089 ) ) ( not ( = ?auto_1703093 ?auto_1703089 ) ) ( TRUCK-AT ?auto_1703092 ?auto_1703096 ) ( not ( = ?auto_1703096 ?auto_1703095 ) ) ( not ( = ?auto_1703090 ?auto_1703096 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1703092 ?auto_1703096 ?auto_1703095 )
      ( MAKE-1CRATE ?auto_1703087 ?auto_1703088 )
      ( MAKE-1CRATE-VERIFY ?auto_1703087 ?auto_1703088 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1703127 - SURFACE
      ?auto_1703128 - SURFACE
      ?auto_1703129 - SURFACE
      ?auto_1703126 - SURFACE
    )
    :vars
    (
      ?auto_1703131 - HOIST
      ?auto_1703130 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703131 ?auto_1703130 ) ( SURFACE-AT ?auto_1703129 ?auto_1703130 ) ( CLEAR ?auto_1703129 ) ( LIFTING ?auto_1703131 ?auto_1703126 ) ( IS-CRATE ?auto_1703126 ) ( not ( = ?auto_1703129 ?auto_1703126 ) ) ( ON ?auto_1703128 ?auto_1703127 ) ( ON ?auto_1703129 ?auto_1703128 ) ( not ( = ?auto_1703127 ?auto_1703128 ) ) ( not ( = ?auto_1703127 ?auto_1703129 ) ) ( not ( = ?auto_1703127 ?auto_1703126 ) ) ( not ( = ?auto_1703128 ?auto_1703129 ) ) ( not ( = ?auto_1703128 ?auto_1703126 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1703129 ?auto_1703126 )
      ( MAKE-3CRATE-VERIFY ?auto_1703127 ?auto_1703128 ?auto_1703129 ?auto_1703126 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1703144 - SURFACE
      ?auto_1703145 - SURFACE
      ?auto_1703146 - SURFACE
      ?auto_1703143 - SURFACE
    )
    :vars
    (
      ?auto_1703148 - HOIST
      ?auto_1703149 - PLACE
      ?auto_1703147 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703148 ?auto_1703149 ) ( SURFACE-AT ?auto_1703146 ?auto_1703149 ) ( CLEAR ?auto_1703146 ) ( IS-CRATE ?auto_1703143 ) ( not ( = ?auto_1703146 ?auto_1703143 ) ) ( TRUCK-AT ?auto_1703147 ?auto_1703149 ) ( AVAILABLE ?auto_1703148 ) ( IN ?auto_1703143 ?auto_1703147 ) ( ON ?auto_1703146 ?auto_1703145 ) ( not ( = ?auto_1703145 ?auto_1703146 ) ) ( not ( = ?auto_1703145 ?auto_1703143 ) ) ( ON ?auto_1703145 ?auto_1703144 ) ( not ( = ?auto_1703144 ?auto_1703145 ) ) ( not ( = ?auto_1703144 ?auto_1703146 ) ) ( not ( = ?auto_1703144 ?auto_1703143 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703145 ?auto_1703146 ?auto_1703143 )
      ( MAKE-3CRATE-VERIFY ?auto_1703144 ?auto_1703145 ?auto_1703146 ?auto_1703143 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1703165 - SURFACE
      ?auto_1703166 - SURFACE
      ?auto_1703167 - SURFACE
      ?auto_1703164 - SURFACE
    )
    :vars
    (
      ?auto_1703169 - HOIST
      ?auto_1703171 - PLACE
      ?auto_1703170 - TRUCK
      ?auto_1703168 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703169 ?auto_1703171 ) ( SURFACE-AT ?auto_1703167 ?auto_1703171 ) ( CLEAR ?auto_1703167 ) ( IS-CRATE ?auto_1703164 ) ( not ( = ?auto_1703167 ?auto_1703164 ) ) ( AVAILABLE ?auto_1703169 ) ( IN ?auto_1703164 ?auto_1703170 ) ( ON ?auto_1703167 ?auto_1703166 ) ( not ( = ?auto_1703166 ?auto_1703167 ) ) ( not ( = ?auto_1703166 ?auto_1703164 ) ) ( TRUCK-AT ?auto_1703170 ?auto_1703168 ) ( not ( = ?auto_1703168 ?auto_1703171 ) ) ( ON ?auto_1703166 ?auto_1703165 ) ( not ( = ?auto_1703165 ?auto_1703166 ) ) ( not ( = ?auto_1703165 ?auto_1703167 ) ) ( not ( = ?auto_1703165 ?auto_1703164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703166 ?auto_1703167 ?auto_1703164 )
      ( MAKE-3CRATE-VERIFY ?auto_1703165 ?auto_1703166 ?auto_1703167 ?auto_1703164 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1703189 - SURFACE
      ?auto_1703190 - SURFACE
      ?auto_1703191 - SURFACE
      ?auto_1703188 - SURFACE
    )
    :vars
    (
      ?auto_1703194 - HOIST
      ?auto_1703192 - PLACE
      ?auto_1703196 - TRUCK
      ?auto_1703195 - PLACE
      ?auto_1703193 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703194 ?auto_1703192 ) ( SURFACE-AT ?auto_1703191 ?auto_1703192 ) ( CLEAR ?auto_1703191 ) ( IS-CRATE ?auto_1703188 ) ( not ( = ?auto_1703191 ?auto_1703188 ) ) ( AVAILABLE ?auto_1703194 ) ( ON ?auto_1703191 ?auto_1703190 ) ( not ( = ?auto_1703190 ?auto_1703191 ) ) ( not ( = ?auto_1703190 ?auto_1703188 ) ) ( TRUCK-AT ?auto_1703196 ?auto_1703195 ) ( not ( = ?auto_1703195 ?auto_1703192 ) ) ( HOIST-AT ?auto_1703193 ?auto_1703195 ) ( LIFTING ?auto_1703193 ?auto_1703188 ) ( not ( = ?auto_1703194 ?auto_1703193 ) ) ( ON ?auto_1703190 ?auto_1703189 ) ( not ( = ?auto_1703189 ?auto_1703190 ) ) ( not ( = ?auto_1703189 ?auto_1703191 ) ) ( not ( = ?auto_1703189 ?auto_1703188 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703190 ?auto_1703191 ?auto_1703188 )
      ( MAKE-3CRATE-VERIFY ?auto_1703189 ?auto_1703190 ?auto_1703191 ?auto_1703188 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1703216 - SURFACE
      ?auto_1703217 - SURFACE
      ?auto_1703218 - SURFACE
      ?auto_1703215 - SURFACE
    )
    :vars
    (
      ?auto_1703220 - HOIST
      ?auto_1703224 - PLACE
      ?auto_1703221 - TRUCK
      ?auto_1703222 - PLACE
      ?auto_1703219 - HOIST
      ?auto_1703223 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703220 ?auto_1703224 ) ( SURFACE-AT ?auto_1703218 ?auto_1703224 ) ( CLEAR ?auto_1703218 ) ( IS-CRATE ?auto_1703215 ) ( not ( = ?auto_1703218 ?auto_1703215 ) ) ( AVAILABLE ?auto_1703220 ) ( ON ?auto_1703218 ?auto_1703217 ) ( not ( = ?auto_1703217 ?auto_1703218 ) ) ( not ( = ?auto_1703217 ?auto_1703215 ) ) ( TRUCK-AT ?auto_1703221 ?auto_1703222 ) ( not ( = ?auto_1703222 ?auto_1703224 ) ) ( HOIST-AT ?auto_1703219 ?auto_1703222 ) ( not ( = ?auto_1703220 ?auto_1703219 ) ) ( AVAILABLE ?auto_1703219 ) ( SURFACE-AT ?auto_1703215 ?auto_1703222 ) ( ON ?auto_1703215 ?auto_1703223 ) ( CLEAR ?auto_1703215 ) ( not ( = ?auto_1703218 ?auto_1703223 ) ) ( not ( = ?auto_1703215 ?auto_1703223 ) ) ( not ( = ?auto_1703217 ?auto_1703223 ) ) ( ON ?auto_1703217 ?auto_1703216 ) ( not ( = ?auto_1703216 ?auto_1703217 ) ) ( not ( = ?auto_1703216 ?auto_1703218 ) ) ( not ( = ?auto_1703216 ?auto_1703215 ) ) ( not ( = ?auto_1703216 ?auto_1703223 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703217 ?auto_1703218 ?auto_1703215 )
      ( MAKE-3CRATE-VERIFY ?auto_1703216 ?auto_1703217 ?auto_1703218 ?auto_1703215 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1703244 - SURFACE
      ?auto_1703245 - SURFACE
      ?auto_1703246 - SURFACE
      ?auto_1703243 - SURFACE
    )
    :vars
    (
      ?auto_1703249 - HOIST
      ?auto_1703248 - PLACE
      ?auto_1703251 - PLACE
      ?auto_1703252 - HOIST
      ?auto_1703250 - SURFACE
      ?auto_1703247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703249 ?auto_1703248 ) ( SURFACE-AT ?auto_1703246 ?auto_1703248 ) ( CLEAR ?auto_1703246 ) ( IS-CRATE ?auto_1703243 ) ( not ( = ?auto_1703246 ?auto_1703243 ) ) ( AVAILABLE ?auto_1703249 ) ( ON ?auto_1703246 ?auto_1703245 ) ( not ( = ?auto_1703245 ?auto_1703246 ) ) ( not ( = ?auto_1703245 ?auto_1703243 ) ) ( not ( = ?auto_1703251 ?auto_1703248 ) ) ( HOIST-AT ?auto_1703252 ?auto_1703251 ) ( not ( = ?auto_1703249 ?auto_1703252 ) ) ( AVAILABLE ?auto_1703252 ) ( SURFACE-AT ?auto_1703243 ?auto_1703251 ) ( ON ?auto_1703243 ?auto_1703250 ) ( CLEAR ?auto_1703243 ) ( not ( = ?auto_1703246 ?auto_1703250 ) ) ( not ( = ?auto_1703243 ?auto_1703250 ) ) ( not ( = ?auto_1703245 ?auto_1703250 ) ) ( TRUCK-AT ?auto_1703247 ?auto_1703248 ) ( ON ?auto_1703245 ?auto_1703244 ) ( not ( = ?auto_1703244 ?auto_1703245 ) ) ( not ( = ?auto_1703244 ?auto_1703246 ) ) ( not ( = ?auto_1703244 ?auto_1703243 ) ) ( not ( = ?auto_1703244 ?auto_1703250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703245 ?auto_1703246 ?auto_1703243 )
      ( MAKE-3CRATE-VERIFY ?auto_1703244 ?auto_1703245 ?auto_1703246 ?auto_1703243 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1703272 - SURFACE
      ?auto_1703273 - SURFACE
      ?auto_1703274 - SURFACE
      ?auto_1703271 - SURFACE
    )
    :vars
    (
      ?auto_1703279 - HOIST
      ?auto_1703278 - PLACE
      ?auto_1703280 - PLACE
      ?auto_1703277 - HOIST
      ?auto_1703275 - SURFACE
      ?auto_1703276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703279 ?auto_1703278 ) ( IS-CRATE ?auto_1703271 ) ( not ( = ?auto_1703274 ?auto_1703271 ) ) ( not ( = ?auto_1703273 ?auto_1703274 ) ) ( not ( = ?auto_1703273 ?auto_1703271 ) ) ( not ( = ?auto_1703280 ?auto_1703278 ) ) ( HOIST-AT ?auto_1703277 ?auto_1703280 ) ( not ( = ?auto_1703279 ?auto_1703277 ) ) ( AVAILABLE ?auto_1703277 ) ( SURFACE-AT ?auto_1703271 ?auto_1703280 ) ( ON ?auto_1703271 ?auto_1703275 ) ( CLEAR ?auto_1703271 ) ( not ( = ?auto_1703274 ?auto_1703275 ) ) ( not ( = ?auto_1703271 ?auto_1703275 ) ) ( not ( = ?auto_1703273 ?auto_1703275 ) ) ( TRUCK-AT ?auto_1703276 ?auto_1703278 ) ( SURFACE-AT ?auto_1703273 ?auto_1703278 ) ( CLEAR ?auto_1703273 ) ( LIFTING ?auto_1703279 ?auto_1703274 ) ( IS-CRATE ?auto_1703274 ) ( ON ?auto_1703273 ?auto_1703272 ) ( not ( = ?auto_1703272 ?auto_1703273 ) ) ( not ( = ?auto_1703272 ?auto_1703274 ) ) ( not ( = ?auto_1703272 ?auto_1703271 ) ) ( not ( = ?auto_1703272 ?auto_1703275 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703273 ?auto_1703274 ?auto_1703271 )
      ( MAKE-3CRATE-VERIFY ?auto_1703272 ?auto_1703273 ?auto_1703274 ?auto_1703271 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1703300 - SURFACE
      ?auto_1703301 - SURFACE
      ?auto_1703302 - SURFACE
      ?auto_1703299 - SURFACE
    )
    :vars
    (
      ?auto_1703307 - HOIST
      ?auto_1703306 - PLACE
      ?auto_1703305 - PLACE
      ?auto_1703304 - HOIST
      ?auto_1703308 - SURFACE
      ?auto_1703303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703307 ?auto_1703306 ) ( IS-CRATE ?auto_1703299 ) ( not ( = ?auto_1703302 ?auto_1703299 ) ) ( not ( = ?auto_1703301 ?auto_1703302 ) ) ( not ( = ?auto_1703301 ?auto_1703299 ) ) ( not ( = ?auto_1703305 ?auto_1703306 ) ) ( HOIST-AT ?auto_1703304 ?auto_1703305 ) ( not ( = ?auto_1703307 ?auto_1703304 ) ) ( AVAILABLE ?auto_1703304 ) ( SURFACE-AT ?auto_1703299 ?auto_1703305 ) ( ON ?auto_1703299 ?auto_1703308 ) ( CLEAR ?auto_1703299 ) ( not ( = ?auto_1703302 ?auto_1703308 ) ) ( not ( = ?auto_1703299 ?auto_1703308 ) ) ( not ( = ?auto_1703301 ?auto_1703308 ) ) ( TRUCK-AT ?auto_1703303 ?auto_1703306 ) ( SURFACE-AT ?auto_1703301 ?auto_1703306 ) ( CLEAR ?auto_1703301 ) ( IS-CRATE ?auto_1703302 ) ( AVAILABLE ?auto_1703307 ) ( IN ?auto_1703302 ?auto_1703303 ) ( ON ?auto_1703301 ?auto_1703300 ) ( not ( = ?auto_1703300 ?auto_1703301 ) ) ( not ( = ?auto_1703300 ?auto_1703302 ) ) ( not ( = ?auto_1703300 ?auto_1703299 ) ) ( not ( = ?auto_1703300 ?auto_1703308 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703301 ?auto_1703302 ?auto_1703299 )
      ( MAKE-3CRATE-VERIFY ?auto_1703300 ?auto_1703301 ?auto_1703302 ?auto_1703299 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1703591 - SURFACE
      ?auto_1703592 - SURFACE
      ?auto_1703593 - SURFACE
      ?auto_1703590 - SURFACE
      ?auto_1703594 - SURFACE
    )
    :vars
    (
      ?auto_1703596 - HOIST
      ?auto_1703595 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703596 ?auto_1703595 ) ( SURFACE-AT ?auto_1703590 ?auto_1703595 ) ( CLEAR ?auto_1703590 ) ( LIFTING ?auto_1703596 ?auto_1703594 ) ( IS-CRATE ?auto_1703594 ) ( not ( = ?auto_1703590 ?auto_1703594 ) ) ( ON ?auto_1703592 ?auto_1703591 ) ( ON ?auto_1703593 ?auto_1703592 ) ( ON ?auto_1703590 ?auto_1703593 ) ( not ( = ?auto_1703591 ?auto_1703592 ) ) ( not ( = ?auto_1703591 ?auto_1703593 ) ) ( not ( = ?auto_1703591 ?auto_1703590 ) ) ( not ( = ?auto_1703591 ?auto_1703594 ) ) ( not ( = ?auto_1703592 ?auto_1703593 ) ) ( not ( = ?auto_1703592 ?auto_1703590 ) ) ( not ( = ?auto_1703592 ?auto_1703594 ) ) ( not ( = ?auto_1703593 ?auto_1703590 ) ) ( not ( = ?auto_1703593 ?auto_1703594 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1703590 ?auto_1703594 )
      ( MAKE-4CRATE-VERIFY ?auto_1703591 ?auto_1703592 ?auto_1703593 ?auto_1703590 ?auto_1703594 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1703616 - SURFACE
      ?auto_1703617 - SURFACE
      ?auto_1703618 - SURFACE
      ?auto_1703615 - SURFACE
      ?auto_1703619 - SURFACE
    )
    :vars
    (
      ?auto_1703622 - HOIST
      ?auto_1703621 - PLACE
      ?auto_1703620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703622 ?auto_1703621 ) ( SURFACE-AT ?auto_1703615 ?auto_1703621 ) ( CLEAR ?auto_1703615 ) ( IS-CRATE ?auto_1703619 ) ( not ( = ?auto_1703615 ?auto_1703619 ) ) ( TRUCK-AT ?auto_1703620 ?auto_1703621 ) ( AVAILABLE ?auto_1703622 ) ( IN ?auto_1703619 ?auto_1703620 ) ( ON ?auto_1703615 ?auto_1703618 ) ( not ( = ?auto_1703618 ?auto_1703615 ) ) ( not ( = ?auto_1703618 ?auto_1703619 ) ) ( ON ?auto_1703617 ?auto_1703616 ) ( ON ?auto_1703618 ?auto_1703617 ) ( not ( = ?auto_1703616 ?auto_1703617 ) ) ( not ( = ?auto_1703616 ?auto_1703618 ) ) ( not ( = ?auto_1703616 ?auto_1703615 ) ) ( not ( = ?auto_1703616 ?auto_1703619 ) ) ( not ( = ?auto_1703617 ?auto_1703618 ) ) ( not ( = ?auto_1703617 ?auto_1703615 ) ) ( not ( = ?auto_1703617 ?auto_1703619 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703618 ?auto_1703615 ?auto_1703619 )
      ( MAKE-4CRATE-VERIFY ?auto_1703616 ?auto_1703617 ?auto_1703618 ?auto_1703615 ?auto_1703619 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1703646 - SURFACE
      ?auto_1703647 - SURFACE
      ?auto_1703648 - SURFACE
      ?auto_1703645 - SURFACE
      ?auto_1703649 - SURFACE
    )
    :vars
    (
      ?auto_1703652 - HOIST
      ?auto_1703653 - PLACE
      ?auto_1703650 - TRUCK
      ?auto_1703651 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703652 ?auto_1703653 ) ( SURFACE-AT ?auto_1703645 ?auto_1703653 ) ( CLEAR ?auto_1703645 ) ( IS-CRATE ?auto_1703649 ) ( not ( = ?auto_1703645 ?auto_1703649 ) ) ( AVAILABLE ?auto_1703652 ) ( IN ?auto_1703649 ?auto_1703650 ) ( ON ?auto_1703645 ?auto_1703648 ) ( not ( = ?auto_1703648 ?auto_1703645 ) ) ( not ( = ?auto_1703648 ?auto_1703649 ) ) ( TRUCK-AT ?auto_1703650 ?auto_1703651 ) ( not ( = ?auto_1703651 ?auto_1703653 ) ) ( ON ?auto_1703647 ?auto_1703646 ) ( ON ?auto_1703648 ?auto_1703647 ) ( not ( = ?auto_1703646 ?auto_1703647 ) ) ( not ( = ?auto_1703646 ?auto_1703648 ) ) ( not ( = ?auto_1703646 ?auto_1703645 ) ) ( not ( = ?auto_1703646 ?auto_1703649 ) ) ( not ( = ?auto_1703647 ?auto_1703648 ) ) ( not ( = ?auto_1703647 ?auto_1703645 ) ) ( not ( = ?auto_1703647 ?auto_1703649 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703648 ?auto_1703645 ?auto_1703649 )
      ( MAKE-4CRATE-VERIFY ?auto_1703646 ?auto_1703647 ?auto_1703648 ?auto_1703645 ?auto_1703649 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1703680 - SURFACE
      ?auto_1703681 - SURFACE
      ?auto_1703682 - SURFACE
      ?auto_1703679 - SURFACE
      ?auto_1703683 - SURFACE
    )
    :vars
    (
      ?auto_1703688 - HOIST
      ?auto_1703687 - PLACE
      ?auto_1703685 - TRUCK
      ?auto_1703684 - PLACE
      ?auto_1703686 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703688 ?auto_1703687 ) ( SURFACE-AT ?auto_1703679 ?auto_1703687 ) ( CLEAR ?auto_1703679 ) ( IS-CRATE ?auto_1703683 ) ( not ( = ?auto_1703679 ?auto_1703683 ) ) ( AVAILABLE ?auto_1703688 ) ( ON ?auto_1703679 ?auto_1703682 ) ( not ( = ?auto_1703682 ?auto_1703679 ) ) ( not ( = ?auto_1703682 ?auto_1703683 ) ) ( TRUCK-AT ?auto_1703685 ?auto_1703684 ) ( not ( = ?auto_1703684 ?auto_1703687 ) ) ( HOIST-AT ?auto_1703686 ?auto_1703684 ) ( LIFTING ?auto_1703686 ?auto_1703683 ) ( not ( = ?auto_1703688 ?auto_1703686 ) ) ( ON ?auto_1703681 ?auto_1703680 ) ( ON ?auto_1703682 ?auto_1703681 ) ( not ( = ?auto_1703680 ?auto_1703681 ) ) ( not ( = ?auto_1703680 ?auto_1703682 ) ) ( not ( = ?auto_1703680 ?auto_1703679 ) ) ( not ( = ?auto_1703680 ?auto_1703683 ) ) ( not ( = ?auto_1703681 ?auto_1703682 ) ) ( not ( = ?auto_1703681 ?auto_1703679 ) ) ( not ( = ?auto_1703681 ?auto_1703683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703682 ?auto_1703679 ?auto_1703683 )
      ( MAKE-4CRATE-VERIFY ?auto_1703680 ?auto_1703681 ?auto_1703682 ?auto_1703679 ?auto_1703683 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1703718 - SURFACE
      ?auto_1703719 - SURFACE
      ?auto_1703720 - SURFACE
      ?auto_1703717 - SURFACE
      ?auto_1703721 - SURFACE
    )
    :vars
    (
      ?auto_1703727 - HOIST
      ?auto_1703725 - PLACE
      ?auto_1703724 - TRUCK
      ?auto_1703722 - PLACE
      ?auto_1703726 - HOIST
      ?auto_1703723 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703727 ?auto_1703725 ) ( SURFACE-AT ?auto_1703717 ?auto_1703725 ) ( CLEAR ?auto_1703717 ) ( IS-CRATE ?auto_1703721 ) ( not ( = ?auto_1703717 ?auto_1703721 ) ) ( AVAILABLE ?auto_1703727 ) ( ON ?auto_1703717 ?auto_1703720 ) ( not ( = ?auto_1703720 ?auto_1703717 ) ) ( not ( = ?auto_1703720 ?auto_1703721 ) ) ( TRUCK-AT ?auto_1703724 ?auto_1703722 ) ( not ( = ?auto_1703722 ?auto_1703725 ) ) ( HOIST-AT ?auto_1703726 ?auto_1703722 ) ( not ( = ?auto_1703727 ?auto_1703726 ) ) ( AVAILABLE ?auto_1703726 ) ( SURFACE-AT ?auto_1703721 ?auto_1703722 ) ( ON ?auto_1703721 ?auto_1703723 ) ( CLEAR ?auto_1703721 ) ( not ( = ?auto_1703717 ?auto_1703723 ) ) ( not ( = ?auto_1703721 ?auto_1703723 ) ) ( not ( = ?auto_1703720 ?auto_1703723 ) ) ( ON ?auto_1703719 ?auto_1703718 ) ( ON ?auto_1703720 ?auto_1703719 ) ( not ( = ?auto_1703718 ?auto_1703719 ) ) ( not ( = ?auto_1703718 ?auto_1703720 ) ) ( not ( = ?auto_1703718 ?auto_1703717 ) ) ( not ( = ?auto_1703718 ?auto_1703721 ) ) ( not ( = ?auto_1703718 ?auto_1703723 ) ) ( not ( = ?auto_1703719 ?auto_1703720 ) ) ( not ( = ?auto_1703719 ?auto_1703717 ) ) ( not ( = ?auto_1703719 ?auto_1703721 ) ) ( not ( = ?auto_1703719 ?auto_1703723 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703720 ?auto_1703717 ?auto_1703721 )
      ( MAKE-4CRATE-VERIFY ?auto_1703718 ?auto_1703719 ?auto_1703720 ?auto_1703717 ?auto_1703721 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1703757 - SURFACE
      ?auto_1703758 - SURFACE
      ?auto_1703759 - SURFACE
      ?auto_1703756 - SURFACE
      ?auto_1703760 - SURFACE
    )
    :vars
    (
      ?auto_1703763 - HOIST
      ?auto_1703764 - PLACE
      ?auto_1703766 - PLACE
      ?auto_1703761 - HOIST
      ?auto_1703765 - SURFACE
      ?auto_1703762 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703763 ?auto_1703764 ) ( SURFACE-AT ?auto_1703756 ?auto_1703764 ) ( CLEAR ?auto_1703756 ) ( IS-CRATE ?auto_1703760 ) ( not ( = ?auto_1703756 ?auto_1703760 ) ) ( AVAILABLE ?auto_1703763 ) ( ON ?auto_1703756 ?auto_1703759 ) ( not ( = ?auto_1703759 ?auto_1703756 ) ) ( not ( = ?auto_1703759 ?auto_1703760 ) ) ( not ( = ?auto_1703766 ?auto_1703764 ) ) ( HOIST-AT ?auto_1703761 ?auto_1703766 ) ( not ( = ?auto_1703763 ?auto_1703761 ) ) ( AVAILABLE ?auto_1703761 ) ( SURFACE-AT ?auto_1703760 ?auto_1703766 ) ( ON ?auto_1703760 ?auto_1703765 ) ( CLEAR ?auto_1703760 ) ( not ( = ?auto_1703756 ?auto_1703765 ) ) ( not ( = ?auto_1703760 ?auto_1703765 ) ) ( not ( = ?auto_1703759 ?auto_1703765 ) ) ( TRUCK-AT ?auto_1703762 ?auto_1703764 ) ( ON ?auto_1703758 ?auto_1703757 ) ( ON ?auto_1703759 ?auto_1703758 ) ( not ( = ?auto_1703757 ?auto_1703758 ) ) ( not ( = ?auto_1703757 ?auto_1703759 ) ) ( not ( = ?auto_1703757 ?auto_1703756 ) ) ( not ( = ?auto_1703757 ?auto_1703760 ) ) ( not ( = ?auto_1703757 ?auto_1703765 ) ) ( not ( = ?auto_1703758 ?auto_1703759 ) ) ( not ( = ?auto_1703758 ?auto_1703756 ) ) ( not ( = ?auto_1703758 ?auto_1703760 ) ) ( not ( = ?auto_1703758 ?auto_1703765 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703759 ?auto_1703756 ?auto_1703760 )
      ( MAKE-4CRATE-VERIFY ?auto_1703757 ?auto_1703758 ?auto_1703759 ?auto_1703756 ?auto_1703760 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1703796 - SURFACE
      ?auto_1703797 - SURFACE
      ?auto_1703798 - SURFACE
      ?auto_1703795 - SURFACE
      ?auto_1703799 - SURFACE
    )
    :vars
    (
      ?auto_1703801 - HOIST
      ?auto_1703804 - PLACE
      ?auto_1703803 - PLACE
      ?auto_1703800 - HOIST
      ?auto_1703802 - SURFACE
      ?auto_1703805 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703801 ?auto_1703804 ) ( IS-CRATE ?auto_1703799 ) ( not ( = ?auto_1703795 ?auto_1703799 ) ) ( not ( = ?auto_1703798 ?auto_1703795 ) ) ( not ( = ?auto_1703798 ?auto_1703799 ) ) ( not ( = ?auto_1703803 ?auto_1703804 ) ) ( HOIST-AT ?auto_1703800 ?auto_1703803 ) ( not ( = ?auto_1703801 ?auto_1703800 ) ) ( AVAILABLE ?auto_1703800 ) ( SURFACE-AT ?auto_1703799 ?auto_1703803 ) ( ON ?auto_1703799 ?auto_1703802 ) ( CLEAR ?auto_1703799 ) ( not ( = ?auto_1703795 ?auto_1703802 ) ) ( not ( = ?auto_1703799 ?auto_1703802 ) ) ( not ( = ?auto_1703798 ?auto_1703802 ) ) ( TRUCK-AT ?auto_1703805 ?auto_1703804 ) ( SURFACE-AT ?auto_1703798 ?auto_1703804 ) ( CLEAR ?auto_1703798 ) ( LIFTING ?auto_1703801 ?auto_1703795 ) ( IS-CRATE ?auto_1703795 ) ( ON ?auto_1703797 ?auto_1703796 ) ( ON ?auto_1703798 ?auto_1703797 ) ( not ( = ?auto_1703796 ?auto_1703797 ) ) ( not ( = ?auto_1703796 ?auto_1703798 ) ) ( not ( = ?auto_1703796 ?auto_1703795 ) ) ( not ( = ?auto_1703796 ?auto_1703799 ) ) ( not ( = ?auto_1703796 ?auto_1703802 ) ) ( not ( = ?auto_1703797 ?auto_1703798 ) ) ( not ( = ?auto_1703797 ?auto_1703795 ) ) ( not ( = ?auto_1703797 ?auto_1703799 ) ) ( not ( = ?auto_1703797 ?auto_1703802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703798 ?auto_1703795 ?auto_1703799 )
      ( MAKE-4CRATE-VERIFY ?auto_1703796 ?auto_1703797 ?auto_1703798 ?auto_1703795 ?auto_1703799 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1703835 - SURFACE
      ?auto_1703836 - SURFACE
      ?auto_1703837 - SURFACE
      ?auto_1703834 - SURFACE
      ?auto_1703838 - SURFACE
    )
    :vars
    (
      ?auto_1703844 - HOIST
      ?auto_1703843 - PLACE
      ?auto_1703839 - PLACE
      ?auto_1703842 - HOIST
      ?auto_1703841 - SURFACE
      ?auto_1703840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703844 ?auto_1703843 ) ( IS-CRATE ?auto_1703838 ) ( not ( = ?auto_1703834 ?auto_1703838 ) ) ( not ( = ?auto_1703837 ?auto_1703834 ) ) ( not ( = ?auto_1703837 ?auto_1703838 ) ) ( not ( = ?auto_1703839 ?auto_1703843 ) ) ( HOIST-AT ?auto_1703842 ?auto_1703839 ) ( not ( = ?auto_1703844 ?auto_1703842 ) ) ( AVAILABLE ?auto_1703842 ) ( SURFACE-AT ?auto_1703838 ?auto_1703839 ) ( ON ?auto_1703838 ?auto_1703841 ) ( CLEAR ?auto_1703838 ) ( not ( = ?auto_1703834 ?auto_1703841 ) ) ( not ( = ?auto_1703838 ?auto_1703841 ) ) ( not ( = ?auto_1703837 ?auto_1703841 ) ) ( TRUCK-AT ?auto_1703840 ?auto_1703843 ) ( SURFACE-AT ?auto_1703837 ?auto_1703843 ) ( CLEAR ?auto_1703837 ) ( IS-CRATE ?auto_1703834 ) ( AVAILABLE ?auto_1703844 ) ( IN ?auto_1703834 ?auto_1703840 ) ( ON ?auto_1703836 ?auto_1703835 ) ( ON ?auto_1703837 ?auto_1703836 ) ( not ( = ?auto_1703835 ?auto_1703836 ) ) ( not ( = ?auto_1703835 ?auto_1703837 ) ) ( not ( = ?auto_1703835 ?auto_1703834 ) ) ( not ( = ?auto_1703835 ?auto_1703838 ) ) ( not ( = ?auto_1703835 ?auto_1703841 ) ) ( not ( = ?auto_1703836 ?auto_1703837 ) ) ( not ( = ?auto_1703836 ?auto_1703834 ) ) ( not ( = ?auto_1703836 ?auto_1703838 ) ) ( not ( = ?auto_1703836 ?auto_1703841 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703837 ?auto_1703834 ?auto_1703838 )
      ( MAKE-4CRATE-VERIFY ?auto_1703835 ?auto_1703836 ?auto_1703837 ?auto_1703834 ?auto_1703838 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1704495 - SURFACE
      ?auto_1704496 - SURFACE
      ?auto_1704497 - SURFACE
      ?auto_1704494 - SURFACE
      ?auto_1704498 - SURFACE
      ?auto_1704499 - SURFACE
    )
    :vars
    (
      ?auto_1704501 - HOIST
      ?auto_1704500 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1704501 ?auto_1704500 ) ( SURFACE-AT ?auto_1704498 ?auto_1704500 ) ( CLEAR ?auto_1704498 ) ( LIFTING ?auto_1704501 ?auto_1704499 ) ( IS-CRATE ?auto_1704499 ) ( not ( = ?auto_1704498 ?auto_1704499 ) ) ( ON ?auto_1704496 ?auto_1704495 ) ( ON ?auto_1704497 ?auto_1704496 ) ( ON ?auto_1704494 ?auto_1704497 ) ( ON ?auto_1704498 ?auto_1704494 ) ( not ( = ?auto_1704495 ?auto_1704496 ) ) ( not ( = ?auto_1704495 ?auto_1704497 ) ) ( not ( = ?auto_1704495 ?auto_1704494 ) ) ( not ( = ?auto_1704495 ?auto_1704498 ) ) ( not ( = ?auto_1704495 ?auto_1704499 ) ) ( not ( = ?auto_1704496 ?auto_1704497 ) ) ( not ( = ?auto_1704496 ?auto_1704494 ) ) ( not ( = ?auto_1704496 ?auto_1704498 ) ) ( not ( = ?auto_1704496 ?auto_1704499 ) ) ( not ( = ?auto_1704497 ?auto_1704494 ) ) ( not ( = ?auto_1704497 ?auto_1704498 ) ) ( not ( = ?auto_1704497 ?auto_1704499 ) ) ( not ( = ?auto_1704494 ?auto_1704498 ) ) ( not ( = ?auto_1704494 ?auto_1704499 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1704498 ?auto_1704499 )
      ( MAKE-5CRATE-VERIFY ?auto_1704495 ?auto_1704496 ?auto_1704497 ?auto_1704494 ?auto_1704498 ?auto_1704499 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1704529 - SURFACE
      ?auto_1704530 - SURFACE
      ?auto_1704531 - SURFACE
      ?auto_1704528 - SURFACE
      ?auto_1704532 - SURFACE
      ?auto_1704533 - SURFACE
    )
    :vars
    (
      ?auto_1704534 - HOIST
      ?auto_1704536 - PLACE
      ?auto_1704535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1704534 ?auto_1704536 ) ( SURFACE-AT ?auto_1704532 ?auto_1704536 ) ( CLEAR ?auto_1704532 ) ( IS-CRATE ?auto_1704533 ) ( not ( = ?auto_1704532 ?auto_1704533 ) ) ( TRUCK-AT ?auto_1704535 ?auto_1704536 ) ( AVAILABLE ?auto_1704534 ) ( IN ?auto_1704533 ?auto_1704535 ) ( ON ?auto_1704532 ?auto_1704528 ) ( not ( = ?auto_1704528 ?auto_1704532 ) ) ( not ( = ?auto_1704528 ?auto_1704533 ) ) ( ON ?auto_1704530 ?auto_1704529 ) ( ON ?auto_1704531 ?auto_1704530 ) ( ON ?auto_1704528 ?auto_1704531 ) ( not ( = ?auto_1704529 ?auto_1704530 ) ) ( not ( = ?auto_1704529 ?auto_1704531 ) ) ( not ( = ?auto_1704529 ?auto_1704528 ) ) ( not ( = ?auto_1704529 ?auto_1704532 ) ) ( not ( = ?auto_1704529 ?auto_1704533 ) ) ( not ( = ?auto_1704530 ?auto_1704531 ) ) ( not ( = ?auto_1704530 ?auto_1704528 ) ) ( not ( = ?auto_1704530 ?auto_1704532 ) ) ( not ( = ?auto_1704530 ?auto_1704533 ) ) ( not ( = ?auto_1704531 ?auto_1704528 ) ) ( not ( = ?auto_1704531 ?auto_1704532 ) ) ( not ( = ?auto_1704531 ?auto_1704533 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1704528 ?auto_1704532 ?auto_1704533 )
      ( MAKE-5CRATE-VERIFY ?auto_1704529 ?auto_1704530 ?auto_1704531 ?auto_1704528 ?auto_1704532 ?auto_1704533 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1704569 - SURFACE
      ?auto_1704570 - SURFACE
      ?auto_1704571 - SURFACE
      ?auto_1704568 - SURFACE
      ?auto_1704572 - SURFACE
      ?auto_1704573 - SURFACE
    )
    :vars
    (
      ?auto_1704576 - HOIST
      ?auto_1704574 - PLACE
      ?auto_1704577 - TRUCK
      ?auto_1704575 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1704576 ?auto_1704574 ) ( SURFACE-AT ?auto_1704572 ?auto_1704574 ) ( CLEAR ?auto_1704572 ) ( IS-CRATE ?auto_1704573 ) ( not ( = ?auto_1704572 ?auto_1704573 ) ) ( AVAILABLE ?auto_1704576 ) ( IN ?auto_1704573 ?auto_1704577 ) ( ON ?auto_1704572 ?auto_1704568 ) ( not ( = ?auto_1704568 ?auto_1704572 ) ) ( not ( = ?auto_1704568 ?auto_1704573 ) ) ( TRUCK-AT ?auto_1704577 ?auto_1704575 ) ( not ( = ?auto_1704575 ?auto_1704574 ) ) ( ON ?auto_1704570 ?auto_1704569 ) ( ON ?auto_1704571 ?auto_1704570 ) ( ON ?auto_1704568 ?auto_1704571 ) ( not ( = ?auto_1704569 ?auto_1704570 ) ) ( not ( = ?auto_1704569 ?auto_1704571 ) ) ( not ( = ?auto_1704569 ?auto_1704568 ) ) ( not ( = ?auto_1704569 ?auto_1704572 ) ) ( not ( = ?auto_1704569 ?auto_1704573 ) ) ( not ( = ?auto_1704570 ?auto_1704571 ) ) ( not ( = ?auto_1704570 ?auto_1704568 ) ) ( not ( = ?auto_1704570 ?auto_1704572 ) ) ( not ( = ?auto_1704570 ?auto_1704573 ) ) ( not ( = ?auto_1704571 ?auto_1704568 ) ) ( not ( = ?auto_1704571 ?auto_1704572 ) ) ( not ( = ?auto_1704571 ?auto_1704573 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1704568 ?auto_1704572 ?auto_1704573 )
      ( MAKE-5CRATE-VERIFY ?auto_1704569 ?auto_1704570 ?auto_1704571 ?auto_1704568 ?auto_1704572 ?auto_1704573 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1704614 - SURFACE
      ?auto_1704615 - SURFACE
      ?auto_1704616 - SURFACE
      ?auto_1704613 - SURFACE
      ?auto_1704617 - SURFACE
      ?auto_1704618 - SURFACE
    )
    :vars
    (
      ?auto_1704623 - HOIST
      ?auto_1704620 - PLACE
      ?auto_1704619 - TRUCK
      ?auto_1704621 - PLACE
      ?auto_1704622 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1704623 ?auto_1704620 ) ( SURFACE-AT ?auto_1704617 ?auto_1704620 ) ( CLEAR ?auto_1704617 ) ( IS-CRATE ?auto_1704618 ) ( not ( = ?auto_1704617 ?auto_1704618 ) ) ( AVAILABLE ?auto_1704623 ) ( ON ?auto_1704617 ?auto_1704613 ) ( not ( = ?auto_1704613 ?auto_1704617 ) ) ( not ( = ?auto_1704613 ?auto_1704618 ) ) ( TRUCK-AT ?auto_1704619 ?auto_1704621 ) ( not ( = ?auto_1704621 ?auto_1704620 ) ) ( HOIST-AT ?auto_1704622 ?auto_1704621 ) ( LIFTING ?auto_1704622 ?auto_1704618 ) ( not ( = ?auto_1704623 ?auto_1704622 ) ) ( ON ?auto_1704615 ?auto_1704614 ) ( ON ?auto_1704616 ?auto_1704615 ) ( ON ?auto_1704613 ?auto_1704616 ) ( not ( = ?auto_1704614 ?auto_1704615 ) ) ( not ( = ?auto_1704614 ?auto_1704616 ) ) ( not ( = ?auto_1704614 ?auto_1704613 ) ) ( not ( = ?auto_1704614 ?auto_1704617 ) ) ( not ( = ?auto_1704614 ?auto_1704618 ) ) ( not ( = ?auto_1704615 ?auto_1704616 ) ) ( not ( = ?auto_1704615 ?auto_1704613 ) ) ( not ( = ?auto_1704615 ?auto_1704617 ) ) ( not ( = ?auto_1704615 ?auto_1704618 ) ) ( not ( = ?auto_1704616 ?auto_1704613 ) ) ( not ( = ?auto_1704616 ?auto_1704617 ) ) ( not ( = ?auto_1704616 ?auto_1704618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1704613 ?auto_1704617 ?auto_1704618 )
      ( MAKE-5CRATE-VERIFY ?auto_1704614 ?auto_1704615 ?auto_1704616 ?auto_1704613 ?auto_1704617 ?auto_1704618 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1704664 - SURFACE
      ?auto_1704665 - SURFACE
      ?auto_1704666 - SURFACE
      ?auto_1704663 - SURFACE
      ?auto_1704667 - SURFACE
      ?auto_1704668 - SURFACE
    )
    :vars
    (
      ?auto_1704670 - HOIST
      ?auto_1704673 - PLACE
      ?auto_1704669 - TRUCK
      ?auto_1704672 - PLACE
      ?auto_1704671 - HOIST
      ?auto_1704674 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1704670 ?auto_1704673 ) ( SURFACE-AT ?auto_1704667 ?auto_1704673 ) ( CLEAR ?auto_1704667 ) ( IS-CRATE ?auto_1704668 ) ( not ( = ?auto_1704667 ?auto_1704668 ) ) ( AVAILABLE ?auto_1704670 ) ( ON ?auto_1704667 ?auto_1704663 ) ( not ( = ?auto_1704663 ?auto_1704667 ) ) ( not ( = ?auto_1704663 ?auto_1704668 ) ) ( TRUCK-AT ?auto_1704669 ?auto_1704672 ) ( not ( = ?auto_1704672 ?auto_1704673 ) ) ( HOIST-AT ?auto_1704671 ?auto_1704672 ) ( not ( = ?auto_1704670 ?auto_1704671 ) ) ( AVAILABLE ?auto_1704671 ) ( SURFACE-AT ?auto_1704668 ?auto_1704672 ) ( ON ?auto_1704668 ?auto_1704674 ) ( CLEAR ?auto_1704668 ) ( not ( = ?auto_1704667 ?auto_1704674 ) ) ( not ( = ?auto_1704668 ?auto_1704674 ) ) ( not ( = ?auto_1704663 ?auto_1704674 ) ) ( ON ?auto_1704665 ?auto_1704664 ) ( ON ?auto_1704666 ?auto_1704665 ) ( ON ?auto_1704663 ?auto_1704666 ) ( not ( = ?auto_1704664 ?auto_1704665 ) ) ( not ( = ?auto_1704664 ?auto_1704666 ) ) ( not ( = ?auto_1704664 ?auto_1704663 ) ) ( not ( = ?auto_1704664 ?auto_1704667 ) ) ( not ( = ?auto_1704664 ?auto_1704668 ) ) ( not ( = ?auto_1704664 ?auto_1704674 ) ) ( not ( = ?auto_1704665 ?auto_1704666 ) ) ( not ( = ?auto_1704665 ?auto_1704663 ) ) ( not ( = ?auto_1704665 ?auto_1704667 ) ) ( not ( = ?auto_1704665 ?auto_1704668 ) ) ( not ( = ?auto_1704665 ?auto_1704674 ) ) ( not ( = ?auto_1704666 ?auto_1704663 ) ) ( not ( = ?auto_1704666 ?auto_1704667 ) ) ( not ( = ?auto_1704666 ?auto_1704668 ) ) ( not ( = ?auto_1704666 ?auto_1704674 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1704663 ?auto_1704667 ?auto_1704668 )
      ( MAKE-5CRATE-VERIFY ?auto_1704664 ?auto_1704665 ?auto_1704666 ?auto_1704663 ?auto_1704667 ?auto_1704668 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1704715 - SURFACE
      ?auto_1704716 - SURFACE
      ?auto_1704717 - SURFACE
      ?auto_1704714 - SURFACE
      ?auto_1704718 - SURFACE
      ?auto_1704719 - SURFACE
    )
    :vars
    (
      ?auto_1704723 - HOIST
      ?auto_1704721 - PLACE
      ?auto_1704722 - PLACE
      ?auto_1704724 - HOIST
      ?auto_1704720 - SURFACE
      ?auto_1704725 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1704723 ?auto_1704721 ) ( SURFACE-AT ?auto_1704718 ?auto_1704721 ) ( CLEAR ?auto_1704718 ) ( IS-CRATE ?auto_1704719 ) ( not ( = ?auto_1704718 ?auto_1704719 ) ) ( AVAILABLE ?auto_1704723 ) ( ON ?auto_1704718 ?auto_1704714 ) ( not ( = ?auto_1704714 ?auto_1704718 ) ) ( not ( = ?auto_1704714 ?auto_1704719 ) ) ( not ( = ?auto_1704722 ?auto_1704721 ) ) ( HOIST-AT ?auto_1704724 ?auto_1704722 ) ( not ( = ?auto_1704723 ?auto_1704724 ) ) ( AVAILABLE ?auto_1704724 ) ( SURFACE-AT ?auto_1704719 ?auto_1704722 ) ( ON ?auto_1704719 ?auto_1704720 ) ( CLEAR ?auto_1704719 ) ( not ( = ?auto_1704718 ?auto_1704720 ) ) ( not ( = ?auto_1704719 ?auto_1704720 ) ) ( not ( = ?auto_1704714 ?auto_1704720 ) ) ( TRUCK-AT ?auto_1704725 ?auto_1704721 ) ( ON ?auto_1704716 ?auto_1704715 ) ( ON ?auto_1704717 ?auto_1704716 ) ( ON ?auto_1704714 ?auto_1704717 ) ( not ( = ?auto_1704715 ?auto_1704716 ) ) ( not ( = ?auto_1704715 ?auto_1704717 ) ) ( not ( = ?auto_1704715 ?auto_1704714 ) ) ( not ( = ?auto_1704715 ?auto_1704718 ) ) ( not ( = ?auto_1704715 ?auto_1704719 ) ) ( not ( = ?auto_1704715 ?auto_1704720 ) ) ( not ( = ?auto_1704716 ?auto_1704717 ) ) ( not ( = ?auto_1704716 ?auto_1704714 ) ) ( not ( = ?auto_1704716 ?auto_1704718 ) ) ( not ( = ?auto_1704716 ?auto_1704719 ) ) ( not ( = ?auto_1704716 ?auto_1704720 ) ) ( not ( = ?auto_1704717 ?auto_1704714 ) ) ( not ( = ?auto_1704717 ?auto_1704718 ) ) ( not ( = ?auto_1704717 ?auto_1704719 ) ) ( not ( = ?auto_1704717 ?auto_1704720 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1704714 ?auto_1704718 ?auto_1704719 )
      ( MAKE-5CRATE-VERIFY ?auto_1704715 ?auto_1704716 ?auto_1704717 ?auto_1704714 ?auto_1704718 ?auto_1704719 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1704766 - SURFACE
      ?auto_1704767 - SURFACE
      ?auto_1704768 - SURFACE
      ?auto_1704765 - SURFACE
      ?auto_1704769 - SURFACE
      ?auto_1704770 - SURFACE
    )
    :vars
    (
      ?auto_1704774 - HOIST
      ?auto_1704776 - PLACE
      ?auto_1704773 - PLACE
      ?auto_1704772 - HOIST
      ?auto_1704771 - SURFACE
      ?auto_1704775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1704774 ?auto_1704776 ) ( IS-CRATE ?auto_1704770 ) ( not ( = ?auto_1704769 ?auto_1704770 ) ) ( not ( = ?auto_1704765 ?auto_1704769 ) ) ( not ( = ?auto_1704765 ?auto_1704770 ) ) ( not ( = ?auto_1704773 ?auto_1704776 ) ) ( HOIST-AT ?auto_1704772 ?auto_1704773 ) ( not ( = ?auto_1704774 ?auto_1704772 ) ) ( AVAILABLE ?auto_1704772 ) ( SURFACE-AT ?auto_1704770 ?auto_1704773 ) ( ON ?auto_1704770 ?auto_1704771 ) ( CLEAR ?auto_1704770 ) ( not ( = ?auto_1704769 ?auto_1704771 ) ) ( not ( = ?auto_1704770 ?auto_1704771 ) ) ( not ( = ?auto_1704765 ?auto_1704771 ) ) ( TRUCK-AT ?auto_1704775 ?auto_1704776 ) ( SURFACE-AT ?auto_1704765 ?auto_1704776 ) ( CLEAR ?auto_1704765 ) ( LIFTING ?auto_1704774 ?auto_1704769 ) ( IS-CRATE ?auto_1704769 ) ( ON ?auto_1704767 ?auto_1704766 ) ( ON ?auto_1704768 ?auto_1704767 ) ( ON ?auto_1704765 ?auto_1704768 ) ( not ( = ?auto_1704766 ?auto_1704767 ) ) ( not ( = ?auto_1704766 ?auto_1704768 ) ) ( not ( = ?auto_1704766 ?auto_1704765 ) ) ( not ( = ?auto_1704766 ?auto_1704769 ) ) ( not ( = ?auto_1704766 ?auto_1704770 ) ) ( not ( = ?auto_1704766 ?auto_1704771 ) ) ( not ( = ?auto_1704767 ?auto_1704768 ) ) ( not ( = ?auto_1704767 ?auto_1704765 ) ) ( not ( = ?auto_1704767 ?auto_1704769 ) ) ( not ( = ?auto_1704767 ?auto_1704770 ) ) ( not ( = ?auto_1704767 ?auto_1704771 ) ) ( not ( = ?auto_1704768 ?auto_1704765 ) ) ( not ( = ?auto_1704768 ?auto_1704769 ) ) ( not ( = ?auto_1704768 ?auto_1704770 ) ) ( not ( = ?auto_1704768 ?auto_1704771 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1704765 ?auto_1704769 ?auto_1704770 )
      ( MAKE-5CRATE-VERIFY ?auto_1704766 ?auto_1704767 ?auto_1704768 ?auto_1704765 ?auto_1704769 ?auto_1704770 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1704817 - SURFACE
      ?auto_1704818 - SURFACE
      ?auto_1704819 - SURFACE
      ?auto_1704816 - SURFACE
      ?auto_1704820 - SURFACE
      ?auto_1704821 - SURFACE
    )
    :vars
    (
      ?auto_1704827 - HOIST
      ?auto_1704823 - PLACE
      ?auto_1704822 - PLACE
      ?auto_1704825 - HOIST
      ?auto_1704824 - SURFACE
      ?auto_1704826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1704827 ?auto_1704823 ) ( IS-CRATE ?auto_1704821 ) ( not ( = ?auto_1704820 ?auto_1704821 ) ) ( not ( = ?auto_1704816 ?auto_1704820 ) ) ( not ( = ?auto_1704816 ?auto_1704821 ) ) ( not ( = ?auto_1704822 ?auto_1704823 ) ) ( HOIST-AT ?auto_1704825 ?auto_1704822 ) ( not ( = ?auto_1704827 ?auto_1704825 ) ) ( AVAILABLE ?auto_1704825 ) ( SURFACE-AT ?auto_1704821 ?auto_1704822 ) ( ON ?auto_1704821 ?auto_1704824 ) ( CLEAR ?auto_1704821 ) ( not ( = ?auto_1704820 ?auto_1704824 ) ) ( not ( = ?auto_1704821 ?auto_1704824 ) ) ( not ( = ?auto_1704816 ?auto_1704824 ) ) ( TRUCK-AT ?auto_1704826 ?auto_1704823 ) ( SURFACE-AT ?auto_1704816 ?auto_1704823 ) ( CLEAR ?auto_1704816 ) ( IS-CRATE ?auto_1704820 ) ( AVAILABLE ?auto_1704827 ) ( IN ?auto_1704820 ?auto_1704826 ) ( ON ?auto_1704818 ?auto_1704817 ) ( ON ?auto_1704819 ?auto_1704818 ) ( ON ?auto_1704816 ?auto_1704819 ) ( not ( = ?auto_1704817 ?auto_1704818 ) ) ( not ( = ?auto_1704817 ?auto_1704819 ) ) ( not ( = ?auto_1704817 ?auto_1704816 ) ) ( not ( = ?auto_1704817 ?auto_1704820 ) ) ( not ( = ?auto_1704817 ?auto_1704821 ) ) ( not ( = ?auto_1704817 ?auto_1704824 ) ) ( not ( = ?auto_1704818 ?auto_1704819 ) ) ( not ( = ?auto_1704818 ?auto_1704816 ) ) ( not ( = ?auto_1704818 ?auto_1704820 ) ) ( not ( = ?auto_1704818 ?auto_1704821 ) ) ( not ( = ?auto_1704818 ?auto_1704824 ) ) ( not ( = ?auto_1704819 ?auto_1704816 ) ) ( not ( = ?auto_1704819 ?auto_1704820 ) ) ( not ( = ?auto_1704819 ?auto_1704821 ) ) ( not ( = ?auto_1704819 ?auto_1704824 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1704816 ?auto_1704820 ?auto_1704821 )
      ( MAKE-5CRATE-VERIFY ?auto_1704817 ?auto_1704818 ?auto_1704819 ?auto_1704816 ?auto_1704820 ?auto_1704821 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1705184 - SURFACE
      ?auto_1705185 - SURFACE
    )
    :vars
    (
      ?auto_1705188 - HOIST
      ?auto_1705191 - PLACE
      ?auto_1705192 - SURFACE
      ?auto_1705187 - TRUCK
      ?auto_1705189 - PLACE
      ?auto_1705190 - HOIST
      ?auto_1705186 - SURFACE
      ?auto_1705193 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1705188 ?auto_1705191 ) ( SURFACE-AT ?auto_1705184 ?auto_1705191 ) ( CLEAR ?auto_1705184 ) ( IS-CRATE ?auto_1705185 ) ( not ( = ?auto_1705184 ?auto_1705185 ) ) ( AVAILABLE ?auto_1705188 ) ( ON ?auto_1705184 ?auto_1705192 ) ( not ( = ?auto_1705192 ?auto_1705184 ) ) ( not ( = ?auto_1705192 ?auto_1705185 ) ) ( TRUCK-AT ?auto_1705187 ?auto_1705189 ) ( not ( = ?auto_1705189 ?auto_1705191 ) ) ( HOIST-AT ?auto_1705190 ?auto_1705189 ) ( not ( = ?auto_1705188 ?auto_1705190 ) ) ( SURFACE-AT ?auto_1705185 ?auto_1705189 ) ( ON ?auto_1705185 ?auto_1705186 ) ( CLEAR ?auto_1705185 ) ( not ( = ?auto_1705184 ?auto_1705186 ) ) ( not ( = ?auto_1705185 ?auto_1705186 ) ) ( not ( = ?auto_1705192 ?auto_1705186 ) ) ( LIFTING ?auto_1705190 ?auto_1705193 ) ( IS-CRATE ?auto_1705193 ) ( not ( = ?auto_1705184 ?auto_1705193 ) ) ( not ( = ?auto_1705185 ?auto_1705193 ) ) ( not ( = ?auto_1705192 ?auto_1705193 ) ) ( not ( = ?auto_1705186 ?auto_1705193 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1705190 ?auto_1705193 ?auto_1705187 ?auto_1705189 )
      ( MAKE-1CRATE ?auto_1705184 ?auto_1705185 )
      ( MAKE-1CRATE-VERIFY ?auto_1705184 ?auto_1705185 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1706022 - SURFACE
      ?auto_1706023 - SURFACE
      ?auto_1706024 - SURFACE
      ?auto_1706021 - SURFACE
      ?auto_1706025 - SURFACE
      ?auto_1706027 - SURFACE
      ?auto_1706026 - SURFACE
    )
    :vars
    (
      ?auto_1706029 - HOIST
      ?auto_1706028 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1706029 ?auto_1706028 ) ( SURFACE-AT ?auto_1706027 ?auto_1706028 ) ( CLEAR ?auto_1706027 ) ( LIFTING ?auto_1706029 ?auto_1706026 ) ( IS-CRATE ?auto_1706026 ) ( not ( = ?auto_1706027 ?auto_1706026 ) ) ( ON ?auto_1706023 ?auto_1706022 ) ( ON ?auto_1706024 ?auto_1706023 ) ( ON ?auto_1706021 ?auto_1706024 ) ( ON ?auto_1706025 ?auto_1706021 ) ( ON ?auto_1706027 ?auto_1706025 ) ( not ( = ?auto_1706022 ?auto_1706023 ) ) ( not ( = ?auto_1706022 ?auto_1706024 ) ) ( not ( = ?auto_1706022 ?auto_1706021 ) ) ( not ( = ?auto_1706022 ?auto_1706025 ) ) ( not ( = ?auto_1706022 ?auto_1706027 ) ) ( not ( = ?auto_1706022 ?auto_1706026 ) ) ( not ( = ?auto_1706023 ?auto_1706024 ) ) ( not ( = ?auto_1706023 ?auto_1706021 ) ) ( not ( = ?auto_1706023 ?auto_1706025 ) ) ( not ( = ?auto_1706023 ?auto_1706027 ) ) ( not ( = ?auto_1706023 ?auto_1706026 ) ) ( not ( = ?auto_1706024 ?auto_1706021 ) ) ( not ( = ?auto_1706024 ?auto_1706025 ) ) ( not ( = ?auto_1706024 ?auto_1706027 ) ) ( not ( = ?auto_1706024 ?auto_1706026 ) ) ( not ( = ?auto_1706021 ?auto_1706025 ) ) ( not ( = ?auto_1706021 ?auto_1706027 ) ) ( not ( = ?auto_1706021 ?auto_1706026 ) ) ( not ( = ?auto_1706025 ?auto_1706027 ) ) ( not ( = ?auto_1706025 ?auto_1706026 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1706027 ?auto_1706026 )
      ( MAKE-6CRATE-VERIFY ?auto_1706022 ?auto_1706023 ?auto_1706024 ?auto_1706021 ?auto_1706025 ?auto_1706027 ?auto_1706026 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1706066 - SURFACE
      ?auto_1706067 - SURFACE
      ?auto_1706068 - SURFACE
      ?auto_1706065 - SURFACE
      ?auto_1706069 - SURFACE
      ?auto_1706071 - SURFACE
      ?auto_1706070 - SURFACE
    )
    :vars
    (
      ?auto_1706073 - HOIST
      ?auto_1706074 - PLACE
      ?auto_1706072 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1706073 ?auto_1706074 ) ( SURFACE-AT ?auto_1706071 ?auto_1706074 ) ( CLEAR ?auto_1706071 ) ( IS-CRATE ?auto_1706070 ) ( not ( = ?auto_1706071 ?auto_1706070 ) ) ( TRUCK-AT ?auto_1706072 ?auto_1706074 ) ( AVAILABLE ?auto_1706073 ) ( IN ?auto_1706070 ?auto_1706072 ) ( ON ?auto_1706071 ?auto_1706069 ) ( not ( = ?auto_1706069 ?auto_1706071 ) ) ( not ( = ?auto_1706069 ?auto_1706070 ) ) ( ON ?auto_1706067 ?auto_1706066 ) ( ON ?auto_1706068 ?auto_1706067 ) ( ON ?auto_1706065 ?auto_1706068 ) ( ON ?auto_1706069 ?auto_1706065 ) ( not ( = ?auto_1706066 ?auto_1706067 ) ) ( not ( = ?auto_1706066 ?auto_1706068 ) ) ( not ( = ?auto_1706066 ?auto_1706065 ) ) ( not ( = ?auto_1706066 ?auto_1706069 ) ) ( not ( = ?auto_1706066 ?auto_1706071 ) ) ( not ( = ?auto_1706066 ?auto_1706070 ) ) ( not ( = ?auto_1706067 ?auto_1706068 ) ) ( not ( = ?auto_1706067 ?auto_1706065 ) ) ( not ( = ?auto_1706067 ?auto_1706069 ) ) ( not ( = ?auto_1706067 ?auto_1706071 ) ) ( not ( = ?auto_1706067 ?auto_1706070 ) ) ( not ( = ?auto_1706068 ?auto_1706065 ) ) ( not ( = ?auto_1706068 ?auto_1706069 ) ) ( not ( = ?auto_1706068 ?auto_1706071 ) ) ( not ( = ?auto_1706068 ?auto_1706070 ) ) ( not ( = ?auto_1706065 ?auto_1706069 ) ) ( not ( = ?auto_1706065 ?auto_1706071 ) ) ( not ( = ?auto_1706065 ?auto_1706070 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1706069 ?auto_1706071 ?auto_1706070 )
      ( MAKE-6CRATE-VERIFY ?auto_1706066 ?auto_1706067 ?auto_1706068 ?auto_1706065 ?auto_1706069 ?auto_1706071 ?auto_1706070 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1706117 - SURFACE
      ?auto_1706118 - SURFACE
      ?auto_1706119 - SURFACE
      ?auto_1706116 - SURFACE
      ?auto_1706120 - SURFACE
      ?auto_1706122 - SURFACE
      ?auto_1706121 - SURFACE
    )
    :vars
    (
      ?auto_1706126 - HOIST
      ?auto_1706125 - PLACE
      ?auto_1706124 - TRUCK
      ?auto_1706123 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1706126 ?auto_1706125 ) ( SURFACE-AT ?auto_1706122 ?auto_1706125 ) ( CLEAR ?auto_1706122 ) ( IS-CRATE ?auto_1706121 ) ( not ( = ?auto_1706122 ?auto_1706121 ) ) ( AVAILABLE ?auto_1706126 ) ( IN ?auto_1706121 ?auto_1706124 ) ( ON ?auto_1706122 ?auto_1706120 ) ( not ( = ?auto_1706120 ?auto_1706122 ) ) ( not ( = ?auto_1706120 ?auto_1706121 ) ) ( TRUCK-AT ?auto_1706124 ?auto_1706123 ) ( not ( = ?auto_1706123 ?auto_1706125 ) ) ( ON ?auto_1706118 ?auto_1706117 ) ( ON ?auto_1706119 ?auto_1706118 ) ( ON ?auto_1706116 ?auto_1706119 ) ( ON ?auto_1706120 ?auto_1706116 ) ( not ( = ?auto_1706117 ?auto_1706118 ) ) ( not ( = ?auto_1706117 ?auto_1706119 ) ) ( not ( = ?auto_1706117 ?auto_1706116 ) ) ( not ( = ?auto_1706117 ?auto_1706120 ) ) ( not ( = ?auto_1706117 ?auto_1706122 ) ) ( not ( = ?auto_1706117 ?auto_1706121 ) ) ( not ( = ?auto_1706118 ?auto_1706119 ) ) ( not ( = ?auto_1706118 ?auto_1706116 ) ) ( not ( = ?auto_1706118 ?auto_1706120 ) ) ( not ( = ?auto_1706118 ?auto_1706122 ) ) ( not ( = ?auto_1706118 ?auto_1706121 ) ) ( not ( = ?auto_1706119 ?auto_1706116 ) ) ( not ( = ?auto_1706119 ?auto_1706120 ) ) ( not ( = ?auto_1706119 ?auto_1706122 ) ) ( not ( = ?auto_1706119 ?auto_1706121 ) ) ( not ( = ?auto_1706116 ?auto_1706120 ) ) ( not ( = ?auto_1706116 ?auto_1706122 ) ) ( not ( = ?auto_1706116 ?auto_1706121 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1706120 ?auto_1706122 ?auto_1706121 )
      ( MAKE-6CRATE-VERIFY ?auto_1706117 ?auto_1706118 ?auto_1706119 ?auto_1706116 ?auto_1706120 ?auto_1706122 ?auto_1706121 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1706174 - SURFACE
      ?auto_1706175 - SURFACE
      ?auto_1706176 - SURFACE
      ?auto_1706173 - SURFACE
      ?auto_1706177 - SURFACE
      ?auto_1706179 - SURFACE
      ?auto_1706178 - SURFACE
    )
    :vars
    (
      ?auto_1706182 - HOIST
      ?auto_1706181 - PLACE
      ?auto_1706180 - TRUCK
      ?auto_1706184 - PLACE
      ?auto_1706183 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1706182 ?auto_1706181 ) ( SURFACE-AT ?auto_1706179 ?auto_1706181 ) ( CLEAR ?auto_1706179 ) ( IS-CRATE ?auto_1706178 ) ( not ( = ?auto_1706179 ?auto_1706178 ) ) ( AVAILABLE ?auto_1706182 ) ( ON ?auto_1706179 ?auto_1706177 ) ( not ( = ?auto_1706177 ?auto_1706179 ) ) ( not ( = ?auto_1706177 ?auto_1706178 ) ) ( TRUCK-AT ?auto_1706180 ?auto_1706184 ) ( not ( = ?auto_1706184 ?auto_1706181 ) ) ( HOIST-AT ?auto_1706183 ?auto_1706184 ) ( LIFTING ?auto_1706183 ?auto_1706178 ) ( not ( = ?auto_1706182 ?auto_1706183 ) ) ( ON ?auto_1706175 ?auto_1706174 ) ( ON ?auto_1706176 ?auto_1706175 ) ( ON ?auto_1706173 ?auto_1706176 ) ( ON ?auto_1706177 ?auto_1706173 ) ( not ( = ?auto_1706174 ?auto_1706175 ) ) ( not ( = ?auto_1706174 ?auto_1706176 ) ) ( not ( = ?auto_1706174 ?auto_1706173 ) ) ( not ( = ?auto_1706174 ?auto_1706177 ) ) ( not ( = ?auto_1706174 ?auto_1706179 ) ) ( not ( = ?auto_1706174 ?auto_1706178 ) ) ( not ( = ?auto_1706175 ?auto_1706176 ) ) ( not ( = ?auto_1706175 ?auto_1706173 ) ) ( not ( = ?auto_1706175 ?auto_1706177 ) ) ( not ( = ?auto_1706175 ?auto_1706179 ) ) ( not ( = ?auto_1706175 ?auto_1706178 ) ) ( not ( = ?auto_1706176 ?auto_1706173 ) ) ( not ( = ?auto_1706176 ?auto_1706177 ) ) ( not ( = ?auto_1706176 ?auto_1706179 ) ) ( not ( = ?auto_1706176 ?auto_1706178 ) ) ( not ( = ?auto_1706173 ?auto_1706177 ) ) ( not ( = ?auto_1706173 ?auto_1706179 ) ) ( not ( = ?auto_1706173 ?auto_1706178 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1706177 ?auto_1706179 ?auto_1706178 )
      ( MAKE-6CRATE-VERIFY ?auto_1706174 ?auto_1706175 ?auto_1706176 ?auto_1706173 ?auto_1706177 ?auto_1706179 ?auto_1706178 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1706237 - SURFACE
      ?auto_1706238 - SURFACE
      ?auto_1706239 - SURFACE
      ?auto_1706236 - SURFACE
      ?auto_1706240 - SURFACE
      ?auto_1706242 - SURFACE
      ?auto_1706241 - SURFACE
    )
    :vars
    (
      ?auto_1706248 - HOIST
      ?auto_1706245 - PLACE
      ?auto_1706246 - TRUCK
      ?auto_1706244 - PLACE
      ?auto_1706243 - HOIST
      ?auto_1706247 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1706248 ?auto_1706245 ) ( SURFACE-AT ?auto_1706242 ?auto_1706245 ) ( CLEAR ?auto_1706242 ) ( IS-CRATE ?auto_1706241 ) ( not ( = ?auto_1706242 ?auto_1706241 ) ) ( AVAILABLE ?auto_1706248 ) ( ON ?auto_1706242 ?auto_1706240 ) ( not ( = ?auto_1706240 ?auto_1706242 ) ) ( not ( = ?auto_1706240 ?auto_1706241 ) ) ( TRUCK-AT ?auto_1706246 ?auto_1706244 ) ( not ( = ?auto_1706244 ?auto_1706245 ) ) ( HOIST-AT ?auto_1706243 ?auto_1706244 ) ( not ( = ?auto_1706248 ?auto_1706243 ) ) ( AVAILABLE ?auto_1706243 ) ( SURFACE-AT ?auto_1706241 ?auto_1706244 ) ( ON ?auto_1706241 ?auto_1706247 ) ( CLEAR ?auto_1706241 ) ( not ( = ?auto_1706242 ?auto_1706247 ) ) ( not ( = ?auto_1706241 ?auto_1706247 ) ) ( not ( = ?auto_1706240 ?auto_1706247 ) ) ( ON ?auto_1706238 ?auto_1706237 ) ( ON ?auto_1706239 ?auto_1706238 ) ( ON ?auto_1706236 ?auto_1706239 ) ( ON ?auto_1706240 ?auto_1706236 ) ( not ( = ?auto_1706237 ?auto_1706238 ) ) ( not ( = ?auto_1706237 ?auto_1706239 ) ) ( not ( = ?auto_1706237 ?auto_1706236 ) ) ( not ( = ?auto_1706237 ?auto_1706240 ) ) ( not ( = ?auto_1706237 ?auto_1706242 ) ) ( not ( = ?auto_1706237 ?auto_1706241 ) ) ( not ( = ?auto_1706237 ?auto_1706247 ) ) ( not ( = ?auto_1706238 ?auto_1706239 ) ) ( not ( = ?auto_1706238 ?auto_1706236 ) ) ( not ( = ?auto_1706238 ?auto_1706240 ) ) ( not ( = ?auto_1706238 ?auto_1706242 ) ) ( not ( = ?auto_1706238 ?auto_1706241 ) ) ( not ( = ?auto_1706238 ?auto_1706247 ) ) ( not ( = ?auto_1706239 ?auto_1706236 ) ) ( not ( = ?auto_1706239 ?auto_1706240 ) ) ( not ( = ?auto_1706239 ?auto_1706242 ) ) ( not ( = ?auto_1706239 ?auto_1706241 ) ) ( not ( = ?auto_1706239 ?auto_1706247 ) ) ( not ( = ?auto_1706236 ?auto_1706240 ) ) ( not ( = ?auto_1706236 ?auto_1706242 ) ) ( not ( = ?auto_1706236 ?auto_1706241 ) ) ( not ( = ?auto_1706236 ?auto_1706247 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1706240 ?auto_1706242 ?auto_1706241 )
      ( MAKE-6CRATE-VERIFY ?auto_1706237 ?auto_1706238 ?auto_1706239 ?auto_1706236 ?auto_1706240 ?auto_1706242 ?auto_1706241 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1706301 - SURFACE
      ?auto_1706302 - SURFACE
      ?auto_1706303 - SURFACE
      ?auto_1706300 - SURFACE
      ?auto_1706304 - SURFACE
      ?auto_1706306 - SURFACE
      ?auto_1706305 - SURFACE
    )
    :vars
    (
      ?auto_1706310 - HOIST
      ?auto_1706311 - PLACE
      ?auto_1706308 - PLACE
      ?auto_1706307 - HOIST
      ?auto_1706309 - SURFACE
      ?auto_1706312 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1706310 ?auto_1706311 ) ( SURFACE-AT ?auto_1706306 ?auto_1706311 ) ( CLEAR ?auto_1706306 ) ( IS-CRATE ?auto_1706305 ) ( not ( = ?auto_1706306 ?auto_1706305 ) ) ( AVAILABLE ?auto_1706310 ) ( ON ?auto_1706306 ?auto_1706304 ) ( not ( = ?auto_1706304 ?auto_1706306 ) ) ( not ( = ?auto_1706304 ?auto_1706305 ) ) ( not ( = ?auto_1706308 ?auto_1706311 ) ) ( HOIST-AT ?auto_1706307 ?auto_1706308 ) ( not ( = ?auto_1706310 ?auto_1706307 ) ) ( AVAILABLE ?auto_1706307 ) ( SURFACE-AT ?auto_1706305 ?auto_1706308 ) ( ON ?auto_1706305 ?auto_1706309 ) ( CLEAR ?auto_1706305 ) ( not ( = ?auto_1706306 ?auto_1706309 ) ) ( not ( = ?auto_1706305 ?auto_1706309 ) ) ( not ( = ?auto_1706304 ?auto_1706309 ) ) ( TRUCK-AT ?auto_1706312 ?auto_1706311 ) ( ON ?auto_1706302 ?auto_1706301 ) ( ON ?auto_1706303 ?auto_1706302 ) ( ON ?auto_1706300 ?auto_1706303 ) ( ON ?auto_1706304 ?auto_1706300 ) ( not ( = ?auto_1706301 ?auto_1706302 ) ) ( not ( = ?auto_1706301 ?auto_1706303 ) ) ( not ( = ?auto_1706301 ?auto_1706300 ) ) ( not ( = ?auto_1706301 ?auto_1706304 ) ) ( not ( = ?auto_1706301 ?auto_1706306 ) ) ( not ( = ?auto_1706301 ?auto_1706305 ) ) ( not ( = ?auto_1706301 ?auto_1706309 ) ) ( not ( = ?auto_1706302 ?auto_1706303 ) ) ( not ( = ?auto_1706302 ?auto_1706300 ) ) ( not ( = ?auto_1706302 ?auto_1706304 ) ) ( not ( = ?auto_1706302 ?auto_1706306 ) ) ( not ( = ?auto_1706302 ?auto_1706305 ) ) ( not ( = ?auto_1706302 ?auto_1706309 ) ) ( not ( = ?auto_1706303 ?auto_1706300 ) ) ( not ( = ?auto_1706303 ?auto_1706304 ) ) ( not ( = ?auto_1706303 ?auto_1706306 ) ) ( not ( = ?auto_1706303 ?auto_1706305 ) ) ( not ( = ?auto_1706303 ?auto_1706309 ) ) ( not ( = ?auto_1706300 ?auto_1706304 ) ) ( not ( = ?auto_1706300 ?auto_1706306 ) ) ( not ( = ?auto_1706300 ?auto_1706305 ) ) ( not ( = ?auto_1706300 ?auto_1706309 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1706304 ?auto_1706306 ?auto_1706305 )
      ( MAKE-6CRATE-VERIFY ?auto_1706301 ?auto_1706302 ?auto_1706303 ?auto_1706300 ?auto_1706304 ?auto_1706306 ?auto_1706305 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1706365 - SURFACE
      ?auto_1706366 - SURFACE
      ?auto_1706367 - SURFACE
      ?auto_1706364 - SURFACE
      ?auto_1706368 - SURFACE
      ?auto_1706370 - SURFACE
      ?auto_1706369 - SURFACE
    )
    :vars
    (
      ?auto_1706375 - HOIST
      ?auto_1706372 - PLACE
      ?auto_1706371 - PLACE
      ?auto_1706374 - HOIST
      ?auto_1706373 - SURFACE
      ?auto_1706376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1706375 ?auto_1706372 ) ( IS-CRATE ?auto_1706369 ) ( not ( = ?auto_1706370 ?auto_1706369 ) ) ( not ( = ?auto_1706368 ?auto_1706370 ) ) ( not ( = ?auto_1706368 ?auto_1706369 ) ) ( not ( = ?auto_1706371 ?auto_1706372 ) ) ( HOIST-AT ?auto_1706374 ?auto_1706371 ) ( not ( = ?auto_1706375 ?auto_1706374 ) ) ( AVAILABLE ?auto_1706374 ) ( SURFACE-AT ?auto_1706369 ?auto_1706371 ) ( ON ?auto_1706369 ?auto_1706373 ) ( CLEAR ?auto_1706369 ) ( not ( = ?auto_1706370 ?auto_1706373 ) ) ( not ( = ?auto_1706369 ?auto_1706373 ) ) ( not ( = ?auto_1706368 ?auto_1706373 ) ) ( TRUCK-AT ?auto_1706376 ?auto_1706372 ) ( SURFACE-AT ?auto_1706368 ?auto_1706372 ) ( CLEAR ?auto_1706368 ) ( LIFTING ?auto_1706375 ?auto_1706370 ) ( IS-CRATE ?auto_1706370 ) ( ON ?auto_1706366 ?auto_1706365 ) ( ON ?auto_1706367 ?auto_1706366 ) ( ON ?auto_1706364 ?auto_1706367 ) ( ON ?auto_1706368 ?auto_1706364 ) ( not ( = ?auto_1706365 ?auto_1706366 ) ) ( not ( = ?auto_1706365 ?auto_1706367 ) ) ( not ( = ?auto_1706365 ?auto_1706364 ) ) ( not ( = ?auto_1706365 ?auto_1706368 ) ) ( not ( = ?auto_1706365 ?auto_1706370 ) ) ( not ( = ?auto_1706365 ?auto_1706369 ) ) ( not ( = ?auto_1706365 ?auto_1706373 ) ) ( not ( = ?auto_1706366 ?auto_1706367 ) ) ( not ( = ?auto_1706366 ?auto_1706364 ) ) ( not ( = ?auto_1706366 ?auto_1706368 ) ) ( not ( = ?auto_1706366 ?auto_1706370 ) ) ( not ( = ?auto_1706366 ?auto_1706369 ) ) ( not ( = ?auto_1706366 ?auto_1706373 ) ) ( not ( = ?auto_1706367 ?auto_1706364 ) ) ( not ( = ?auto_1706367 ?auto_1706368 ) ) ( not ( = ?auto_1706367 ?auto_1706370 ) ) ( not ( = ?auto_1706367 ?auto_1706369 ) ) ( not ( = ?auto_1706367 ?auto_1706373 ) ) ( not ( = ?auto_1706364 ?auto_1706368 ) ) ( not ( = ?auto_1706364 ?auto_1706370 ) ) ( not ( = ?auto_1706364 ?auto_1706369 ) ) ( not ( = ?auto_1706364 ?auto_1706373 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1706368 ?auto_1706370 ?auto_1706369 )
      ( MAKE-6CRATE-VERIFY ?auto_1706365 ?auto_1706366 ?auto_1706367 ?auto_1706364 ?auto_1706368 ?auto_1706370 ?auto_1706369 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1706429 - SURFACE
      ?auto_1706430 - SURFACE
      ?auto_1706431 - SURFACE
      ?auto_1706428 - SURFACE
      ?auto_1706432 - SURFACE
      ?auto_1706434 - SURFACE
      ?auto_1706433 - SURFACE
    )
    :vars
    (
      ?auto_1706437 - HOIST
      ?auto_1706438 - PLACE
      ?auto_1706439 - PLACE
      ?auto_1706436 - HOIST
      ?auto_1706440 - SURFACE
      ?auto_1706435 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1706437 ?auto_1706438 ) ( IS-CRATE ?auto_1706433 ) ( not ( = ?auto_1706434 ?auto_1706433 ) ) ( not ( = ?auto_1706432 ?auto_1706434 ) ) ( not ( = ?auto_1706432 ?auto_1706433 ) ) ( not ( = ?auto_1706439 ?auto_1706438 ) ) ( HOIST-AT ?auto_1706436 ?auto_1706439 ) ( not ( = ?auto_1706437 ?auto_1706436 ) ) ( AVAILABLE ?auto_1706436 ) ( SURFACE-AT ?auto_1706433 ?auto_1706439 ) ( ON ?auto_1706433 ?auto_1706440 ) ( CLEAR ?auto_1706433 ) ( not ( = ?auto_1706434 ?auto_1706440 ) ) ( not ( = ?auto_1706433 ?auto_1706440 ) ) ( not ( = ?auto_1706432 ?auto_1706440 ) ) ( TRUCK-AT ?auto_1706435 ?auto_1706438 ) ( SURFACE-AT ?auto_1706432 ?auto_1706438 ) ( CLEAR ?auto_1706432 ) ( IS-CRATE ?auto_1706434 ) ( AVAILABLE ?auto_1706437 ) ( IN ?auto_1706434 ?auto_1706435 ) ( ON ?auto_1706430 ?auto_1706429 ) ( ON ?auto_1706431 ?auto_1706430 ) ( ON ?auto_1706428 ?auto_1706431 ) ( ON ?auto_1706432 ?auto_1706428 ) ( not ( = ?auto_1706429 ?auto_1706430 ) ) ( not ( = ?auto_1706429 ?auto_1706431 ) ) ( not ( = ?auto_1706429 ?auto_1706428 ) ) ( not ( = ?auto_1706429 ?auto_1706432 ) ) ( not ( = ?auto_1706429 ?auto_1706434 ) ) ( not ( = ?auto_1706429 ?auto_1706433 ) ) ( not ( = ?auto_1706429 ?auto_1706440 ) ) ( not ( = ?auto_1706430 ?auto_1706431 ) ) ( not ( = ?auto_1706430 ?auto_1706428 ) ) ( not ( = ?auto_1706430 ?auto_1706432 ) ) ( not ( = ?auto_1706430 ?auto_1706434 ) ) ( not ( = ?auto_1706430 ?auto_1706433 ) ) ( not ( = ?auto_1706430 ?auto_1706440 ) ) ( not ( = ?auto_1706431 ?auto_1706428 ) ) ( not ( = ?auto_1706431 ?auto_1706432 ) ) ( not ( = ?auto_1706431 ?auto_1706434 ) ) ( not ( = ?auto_1706431 ?auto_1706433 ) ) ( not ( = ?auto_1706431 ?auto_1706440 ) ) ( not ( = ?auto_1706428 ?auto_1706432 ) ) ( not ( = ?auto_1706428 ?auto_1706434 ) ) ( not ( = ?auto_1706428 ?auto_1706433 ) ) ( not ( = ?auto_1706428 ?auto_1706440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1706432 ?auto_1706434 ?auto_1706433 )
      ( MAKE-6CRATE-VERIFY ?auto_1706429 ?auto_1706430 ?auto_1706431 ?auto_1706428 ?auto_1706432 ?auto_1706434 ?auto_1706433 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1707300 - SURFACE
      ?auto_1707301 - SURFACE
    )
    :vars
    (
      ?auto_1707307 - HOIST
      ?auto_1707304 - PLACE
      ?auto_1707302 - SURFACE
      ?auto_1707308 - PLACE
      ?auto_1707303 - HOIST
      ?auto_1707306 - SURFACE
      ?auto_1707305 - TRUCK
      ?auto_1707309 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1707307 ?auto_1707304 ) ( SURFACE-AT ?auto_1707300 ?auto_1707304 ) ( CLEAR ?auto_1707300 ) ( IS-CRATE ?auto_1707301 ) ( not ( = ?auto_1707300 ?auto_1707301 ) ) ( ON ?auto_1707300 ?auto_1707302 ) ( not ( = ?auto_1707302 ?auto_1707300 ) ) ( not ( = ?auto_1707302 ?auto_1707301 ) ) ( not ( = ?auto_1707308 ?auto_1707304 ) ) ( HOIST-AT ?auto_1707303 ?auto_1707308 ) ( not ( = ?auto_1707307 ?auto_1707303 ) ) ( AVAILABLE ?auto_1707303 ) ( SURFACE-AT ?auto_1707301 ?auto_1707308 ) ( ON ?auto_1707301 ?auto_1707306 ) ( CLEAR ?auto_1707301 ) ( not ( = ?auto_1707300 ?auto_1707306 ) ) ( not ( = ?auto_1707301 ?auto_1707306 ) ) ( not ( = ?auto_1707302 ?auto_1707306 ) ) ( TRUCK-AT ?auto_1707305 ?auto_1707304 ) ( LIFTING ?auto_1707307 ?auto_1707309 ) ( IS-CRATE ?auto_1707309 ) ( not ( = ?auto_1707300 ?auto_1707309 ) ) ( not ( = ?auto_1707301 ?auto_1707309 ) ) ( not ( = ?auto_1707302 ?auto_1707309 ) ) ( not ( = ?auto_1707306 ?auto_1707309 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1707307 ?auto_1707309 ?auto_1707305 ?auto_1707304 )
      ( MAKE-1CRATE ?auto_1707300 ?auto_1707301 )
      ( MAKE-1CRATE-VERIFY ?auto_1707300 ?auto_1707301 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1708379 - SURFACE
      ?auto_1708380 - SURFACE
      ?auto_1708381 - SURFACE
      ?auto_1708378 - SURFACE
      ?auto_1708382 - SURFACE
      ?auto_1708384 - SURFACE
      ?auto_1708383 - SURFACE
      ?auto_1708385 - SURFACE
    )
    :vars
    (
      ?auto_1708387 - HOIST
      ?auto_1708386 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1708387 ?auto_1708386 ) ( SURFACE-AT ?auto_1708383 ?auto_1708386 ) ( CLEAR ?auto_1708383 ) ( LIFTING ?auto_1708387 ?auto_1708385 ) ( IS-CRATE ?auto_1708385 ) ( not ( = ?auto_1708383 ?auto_1708385 ) ) ( ON ?auto_1708380 ?auto_1708379 ) ( ON ?auto_1708381 ?auto_1708380 ) ( ON ?auto_1708378 ?auto_1708381 ) ( ON ?auto_1708382 ?auto_1708378 ) ( ON ?auto_1708384 ?auto_1708382 ) ( ON ?auto_1708383 ?auto_1708384 ) ( not ( = ?auto_1708379 ?auto_1708380 ) ) ( not ( = ?auto_1708379 ?auto_1708381 ) ) ( not ( = ?auto_1708379 ?auto_1708378 ) ) ( not ( = ?auto_1708379 ?auto_1708382 ) ) ( not ( = ?auto_1708379 ?auto_1708384 ) ) ( not ( = ?auto_1708379 ?auto_1708383 ) ) ( not ( = ?auto_1708379 ?auto_1708385 ) ) ( not ( = ?auto_1708380 ?auto_1708381 ) ) ( not ( = ?auto_1708380 ?auto_1708378 ) ) ( not ( = ?auto_1708380 ?auto_1708382 ) ) ( not ( = ?auto_1708380 ?auto_1708384 ) ) ( not ( = ?auto_1708380 ?auto_1708383 ) ) ( not ( = ?auto_1708380 ?auto_1708385 ) ) ( not ( = ?auto_1708381 ?auto_1708378 ) ) ( not ( = ?auto_1708381 ?auto_1708382 ) ) ( not ( = ?auto_1708381 ?auto_1708384 ) ) ( not ( = ?auto_1708381 ?auto_1708383 ) ) ( not ( = ?auto_1708381 ?auto_1708385 ) ) ( not ( = ?auto_1708378 ?auto_1708382 ) ) ( not ( = ?auto_1708378 ?auto_1708384 ) ) ( not ( = ?auto_1708378 ?auto_1708383 ) ) ( not ( = ?auto_1708378 ?auto_1708385 ) ) ( not ( = ?auto_1708382 ?auto_1708384 ) ) ( not ( = ?auto_1708382 ?auto_1708383 ) ) ( not ( = ?auto_1708382 ?auto_1708385 ) ) ( not ( = ?auto_1708384 ?auto_1708383 ) ) ( not ( = ?auto_1708384 ?auto_1708385 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1708383 ?auto_1708385 )
      ( MAKE-7CRATE-VERIFY ?auto_1708379 ?auto_1708380 ?auto_1708381 ?auto_1708378 ?auto_1708382 ?auto_1708384 ?auto_1708383 ?auto_1708385 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1708434 - SURFACE
      ?auto_1708435 - SURFACE
      ?auto_1708436 - SURFACE
      ?auto_1708433 - SURFACE
      ?auto_1708437 - SURFACE
      ?auto_1708439 - SURFACE
      ?auto_1708438 - SURFACE
      ?auto_1708440 - SURFACE
    )
    :vars
    (
      ?auto_1708442 - HOIST
      ?auto_1708443 - PLACE
      ?auto_1708441 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1708442 ?auto_1708443 ) ( SURFACE-AT ?auto_1708438 ?auto_1708443 ) ( CLEAR ?auto_1708438 ) ( IS-CRATE ?auto_1708440 ) ( not ( = ?auto_1708438 ?auto_1708440 ) ) ( TRUCK-AT ?auto_1708441 ?auto_1708443 ) ( AVAILABLE ?auto_1708442 ) ( IN ?auto_1708440 ?auto_1708441 ) ( ON ?auto_1708438 ?auto_1708439 ) ( not ( = ?auto_1708439 ?auto_1708438 ) ) ( not ( = ?auto_1708439 ?auto_1708440 ) ) ( ON ?auto_1708435 ?auto_1708434 ) ( ON ?auto_1708436 ?auto_1708435 ) ( ON ?auto_1708433 ?auto_1708436 ) ( ON ?auto_1708437 ?auto_1708433 ) ( ON ?auto_1708439 ?auto_1708437 ) ( not ( = ?auto_1708434 ?auto_1708435 ) ) ( not ( = ?auto_1708434 ?auto_1708436 ) ) ( not ( = ?auto_1708434 ?auto_1708433 ) ) ( not ( = ?auto_1708434 ?auto_1708437 ) ) ( not ( = ?auto_1708434 ?auto_1708439 ) ) ( not ( = ?auto_1708434 ?auto_1708438 ) ) ( not ( = ?auto_1708434 ?auto_1708440 ) ) ( not ( = ?auto_1708435 ?auto_1708436 ) ) ( not ( = ?auto_1708435 ?auto_1708433 ) ) ( not ( = ?auto_1708435 ?auto_1708437 ) ) ( not ( = ?auto_1708435 ?auto_1708439 ) ) ( not ( = ?auto_1708435 ?auto_1708438 ) ) ( not ( = ?auto_1708435 ?auto_1708440 ) ) ( not ( = ?auto_1708436 ?auto_1708433 ) ) ( not ( = ?auto_1708436 ?auto_1708437 ) ) ( not ( = ?auto_1708436 ?auto_1708439 ) ) ( not ( = ?auto_1708436 ?auto_1708438 ) ) ( not ( = ?auto_1708436 ?auto_1708440 ) ) ( not ( = ?auto_1708433 ?auto_1708437 ) ) ( not ( = ?auto_1708433 ?auto_1708439 ) ) ( not ( = ?auto_1708433 ?auto_1708438 ) ) ( not ( = ?auto_1708433 ?auto_1708440 ) ) ( not ( = ?auto_1708437 ?auto_1708439 ) ) ( not ( = ?auto_1708437 ?auto_1708438 ) ) ( not ( = ?auto_1708437 ?auto_1708440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1708439 ?auto_1708438 ?auto_1708440 )
      ( MAKE-7CRATE-VERIFY ?auto_1708434 ?auto_1708435 ?auto_1708436 ?auto_1708433 ?auto_1708437 ?auto_1708439 ?auto_1708438 ?auto_1708440 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1708497 - SURFACE
      ?auto_1708498 - SURFACE
      ?auto_1708499 - SURFACE
      ?auto_1708496 - SURFACE
      ?auto_1708500 - SURFACE
      ?auto_1708502 - SURFACE
      ?auto_1708501 - SURFACE
      ?auto_1708503 - SURFACE
    )
    :vars
    (
      ?auto_1708505 - HOIST
      ?auto_1708506 - PLACE
      ?auto_1708507 - TRUCK
      ?auto_1708504 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1708505 ?auto_1708506 ) ( SURFACE-AT ?auto_1708501 ?auto_1708506 ) ( CLEAR ?auto_1708501 ) ( IS-CRATE ?auto_1708503 ) ( not ( = ?auto_1708501 ?auto_1708503 ) ) ( AVAILABLE ?auto_1708505 ) ( IN ?auto_1708503 ?auto_1708507 ) ( ON ?auto_1708501 ?auto_1708502 ) ( not ( = ?auto_1708502 ?auto_1708501 ) ) ( not ( = ?auto_1708502 ?auto_1708503 ) ) ( TRUCK-AT ?auto_1708507 ?auto_1708504 ) ( not ( = ?auto_1708504 ?auto_1708506 ) ) ( ON ?auto_1708498 ?auto_1708497 ) ( ON ?auto_1708499 ?auto_1708498 ) ( ON ?auto_1708496 ?auto_1708499 ) ( ON ?auto_1708500 ?auto_1708496 ) ( ON ?auto_1708502 ?auto_1708500 ) ( not ( = ?auto_1708497 ?auto_1708498 ) ) ( not ( = ?auto_1708497 ?auto_1708499 ) ) ( not ( = ?auto_1708497 ?auto_1708496 ) ) ( not ( = ?auto_1708497 ?auto_1708500 ) ) ( not ( = ?auto_1708497 ?auto_1708502 ) ) ( not ( = ?auto_1708497 ?auto_1708501 ) ) ( not ( = ?auto_1708497 ?auto_1708503 ) ) ( not ( = ?auto_1708498 ?auto_1708499 ) ) ( not ( = ?auto_1708498 ?auto_1708496 ) ) ( not ( = ?auto_1708498 ?auto_1708500 ) ) ( not ( = ?auto_1708498 ?auto_1708502 ) ) ( not ( = ?auto_1708498 ?auto_1708501 ) ) ( not ( = ?auto_1708498 ?auto_1708503 ) ) ( not ( = ?auto_1708499 ?auto_1708496 ) ) ( not ( = ?auto_1708499 ?auto_1708500 ) ) ( not ( = ?auto_1708499 ?auto_1708502 ) ) ( not ( = ?auto_1708499 ?auto_1708501 ) ) ( not ( = ?auto_1708499 ?auto_1708503 ) ) ( not ( = ?auto_1708496 ?auto_1708500 ) ) ( not ( = ?auto_1708496 ?auto_1708502 ) ) ( not ( = ?auto_1708496 ?auto_1708501 ) ) ( not ( = ?auto_1708496 ?auto_1708503 ) ) ( not ( = ?auto_1708500 ?auto_1708502 ) ) ( not ( = ?auto_1708500 ?auto_1708501 ) ) ( not ( = ?auto_1708500 ?auto_1708503 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1708502 ?auto_1708501 ?auto_1708503 )
      ( MAKE-7CRATE-VERIFY ?auto_1708497 ?auto_1708498 ?auto_1708499 ?auto_1708496 ?auto_1708500 ?auto_1708502 ?auto_1708501 ?auto_1708503 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1708567 - SURFACE
      ?auto_1708568 - SURFACE
      ?auto_1708569 - SURFACE
      ?auto_1708566 - SURFACE
      ?auto_1708570 - SURFACE
      ?auto_1708572 - SURFACE
      ?auto_1708571 - SURFACE
      ?auto_1708573 - SURFACE
    )
    :vars
    (
      ?auto_1708577 - HOIST
      ?auto_1708574 - PLACE
      ?auto_1708576 - TRUCK
      ?auto_1708575 - PLACE
      ?auto_1708578 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1708577 ?auto_1708574 ) ( SURFACE-AT ?auto_1708571 ?auto_1708574 ) ( CLEAR ?auto_1708571 ) ( IS-CRATE ?auto_1708573 ) ( not ( = ?auto_1708571 ?auto_1708573 ) ) ( AVAILABLE ?auto_1708577 ) ( ON ?auto_1708571 ?auto_1708572 ) ( not ( = ?auto_1708572 ?auto_1708571 ) ) ( not ( = ?auto_1708572 ?auto_1708573 ) ) ( TRUCK-AT ?auto_1708576 ?auto_1708575 ) ( not ( = ?auto_1708575 ?auto_1708574 ) ) ( HOIST-AT ?auto_1708578 ?auto_1708575 ) ( LIFTING ?auto_1708578 ?auto_1708573 ) ( not ( = ?auto_1708577 ?auto_1708578 ) ) ( ON ?auto_1708568 ?auto_1708567 ) ( ON ?auto_1708569 ?auto_1708568 ) ( ON ?auto_1708566 ?auto_1708569 ) ( ON ?auto_1708570 ?auto_1708566 ) ( ON ?auto_1708572 ?auto_1708570 ) ( not ( = ?auto_1708567 ?auto_1708568 ) ) ( not ( = ?auto_1708567 ?auto_1708569 ) ) ( not ( = ?auto_1708567 ?auto_1708566 ) ) ( not ( = ?auto_1708567 ?auto_1708570 ) ) ( not ( = ?auto_1708567 ?auto_1708572 ) ) ( not ( = ?auto_1708567 ?auto_1708571 ) ) ( not ( = ?auto_1708567 ?auto_1708573 ) ) ( not ( = ?auto_1708568 ?auto_1708569 ) ) ( not ( = ?auto_1708568 ?auto_1708566 ) ) ( not ( = ?auto_1708568 ?auto_1708570 ) ) ( not ( = ?auto_1708568 ?auto_1708572 ) ) ( not ( = ?auto_1708568 ?auto_1708571 ) ) ( not ( = ?auto_1708568 ?auto_1708573 ) ) ( not ( = ?auto_1708569 ?auto_1708566 ) ) ( not ( = ?auto_1708569 ?auto_1708570 ) ) ( not ( = ?auto_1708569 ?auto_1708572 ) ) ( not ( = ?auto_1708569 ?auto_1708571 ) ) ( not ( = ?auto_1708569 ?auto_1708573 ) ) ( not ( = ?auto_1708566 ?auto_1708570 ) ) ( not ( = ?auto_1708566 ?auto_1708572 ) ) ( not ( = ?auto_1708566 ?auto_1708571 ) ) ( not ( = ?auto_1708566 ?auto_1708573 ) ) ( not ( = ?auto_1708570 ?auto_1708572 ) ) ( not ( = ?auto_1708570 ?auto_1708571 ) ) ( not ( = ?auto_1708570 ?auto_1708573 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1708572 ?auto_1708571 ?auto_1708573 )
      ( MAKE-7CRATE-VERIFY ?auto_1708567 ?auto_1708568 ?auto_1708569 ?auto_1708566 ?auto_1708570 ?auto_1708572 ?auto_1708571 ?auto_1708573 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1708644 - SURFACE
      ?auto_1708645 - SURFACE
      ?auto_1708646 - SURFACE
      ?auto_1708643 - SURFACE
      ?auto_1708647 - SURFACE
      ?auto_1708649 - SURFACE
      ?auto_1708648 - SURFACE
      ?auto_1708650 - SURFACE
    )
    :vars
    (
      ?auto_1708654 - HOIST
      ?auto_1708651 - PLACE
      ?auto_1708655 - TRUCK
      ?auto_1708652 - PLACE
      ?auto_1708653 - HOIST
      ?auto_1708656 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1708654 ?auto_1708651 ) ( SURFACE-AT ?auto_1708648 ?auto_1708651 ) ( CLEAR ?auto_1708648 ) ( IS-CRATE ?auto_1708650 ) ( not ( = ?auto_1708648 ?auto_1708650 ) ) ( AVAILABLE ?auto_1708654 ) ( ON ?auto_1708648 ?auto_1708649 ) ( not ( = ?auto_1708649 ?auto_1708648 ) ) ( not ( = ?auto_1708649 ?auto_1708650 ) ) ( TRUCK-AT ?auto_1708655 ?auto_1708652 ) ( not ( = ?auto_1708652 ?auto_1708651 ) ) ( HOIST-AT ?auto_1708653 ?auto_1708652 ) ( not ( = ?auto_1708654 ?auto_1708653 ) ) ( AVAILABLE ?auto_1708653 ) ( SURFACE-AT ?auto_1708650 ?auto_1708652 ) ( ON ?auto_1708650 ?auto_1708656 ) ( CLEAR ?auto_1708650 ) ( not ( = ?auto_1708648 ?auto_1708656 ) ) ( not ( = ?auto_1708650 ?auto_1708656 ) ) ( not ( = ?auto_1708649 ?auto_1708656 ) ) ( ON ?auto_1708645 ?auto_1708644 ) ( ON ?auto_1708646 ?auto_1708645 ) ( ON ?auto_1708643 ?auto_1708646 ) ( ON ?auto_1708647 ?auto_1708643 ) ( ON ?auto_1708649 ?auto_1708647 ) ( not ( = ?auto_1708644 ?auto_1708645 ) ) ( not ( = ?auto_1708644 ?auto_1708646 ) ) ( not ( = ?auto_1708644 ?auto_1708643 ) ) ( not ( = ?auto_1708644 ?auto_1708647 ) ) ( not ( = ?auto_1708644 ?auto_1708649 ) ) ( not ( = ?auto_1708644 ?auto_1708648 ) ) ( not ( = ?auto_1708644 ?auto_1708650 ) ) ( not ( = ?auto_1708644 ?auto_1708656 ) ) ( not ( = ?auto_1708645 ?auto_1708646 ) ) ( not ( = ?auto_1708645 ?auto_1708643 ) ) ( not ( = ?auto_1708645 ?auto_1708647 ) ) ( not ( = ?auto_1708645 ?auto_1708649 ) ) ( not ( = ?auto_1708645 ?auto_1708648 ) ) ( not ( = ?auto_1708645 ?auto_1708650 ) ) ( not ( = ?auto_1708645 ?auto_1708656 ) ) ( not ( = ?auto_1708646 ?auto_1708643 ) ) ( not ( = ?auto_1708646 ?auto_1708647 ) ) ( not ( = ?auto_1708646 ?auto_1708649 ) ) ( not ( = ?auto_1708646 ?auto_1708648 ) ) ( not ( = ?auto_1708646 ?auto_1708650 ) ) ( not ( = ?auto_1708646 ?auto_1708656 ) ) ( not ( = ?auto_1708643 ?auto_1708647 ) ) ( not ( = ?auto_1708643 ?auto_1708649 ) ) ( not ( = ?auto_1708643 ?auto_1708648 ) ) ( not ( = ?auto_1708643 ?auto_1708650 ) ) ( not ( = ?auto_1708643 ?auto_1708656 ) ) ( not ( = ?auto_1708647 ?auto_1708649 ) ) ( not ( = ?auto_1708647 ?auto_1708648 ) ) ( not ( = ?auto_1708647 ?auto_1708650 ) ) ( not ( = ?auto_1708647 ?auto_1708656 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1708649 ?auto_1708648 ?auto_1708650 )
      ( MAKE-7CRATE-VERIFY ?auto_1708644 ?auto_1708645 ?auto_1708646 ?auto_1708643 ?auto_1708647 ?auto_1708649 ?auto_1708648 ?auto_1708650 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1708722 - SURFACE
      ?auto_1708723 - SURFACE
      ?auto_1708724 - SURFACE
      ?auto_1708721 - SURFACE
      ?auto_1708725 - SURFACE
      ?auto_1708727 - SURFACE
      ?auto_1708726 - SURFACE
      ?auto_1708728 - SURFACE
    )
    :vars
    (
      ?auto_1708733 - HOIST
      ?auto_1708732 - PLACE
      ?auto_1708734 - PLACE
      ?auto_1708731 - HOIST
      ?auto_1708730 - SURFACE
      ?auto_1708729 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1708733 ?auto_1708732 ) ( SURFACE-AT ?auto_1708726 ?auto_1708732 ) ( CLEAR ?auto_1708726 ) ( IS-CRATE ?auto_1708728 ) ( not ( = ?auto_1708726 ?auto_1708728 ) ) ( AVAILABLE ?auto_1708733 ) ( ON ?auto_1708726 ?auto_1708727 ) ( not ( = ?auto_1708727 ?auto_1708726 ) ) ( not ( = ?auto_1708727 ?auto_1708728 ) ) ( not ( = ?auto_1708734 ?auto_1708732 ) ) ( HOIST-AT ?auto_1708731 ?auto_1708734 ) ( not ( = ?auto_1708733 ?auto_1708731 ) ) ( AVAILABLE ?auto_1708731 ) ( SURFACE-AT ?auto_1708728 ?auto_1708734 ) ( ON ?auto_1708728 ?auto_1708730 ) ( CLEAR ?auto_1708728 ) ( not ( = ?auto_1708726 ?auto_1708730 ) ) ( not ( = ?auto_1708728 ?auto_1708730 ) ) ( not ( = ?auto_1708727 ?auto_1708730 ) ) ( TRUCK-AT ?auto_1708729 ?auto_1708732 ) ( ON ?auto_1708723 ?auto_1708722 ) ( ON ?auto_1708724 ?auto_1708723 ) ( ON ?auto_1708721 ?auto_1708724 ) ( ON ?auto_1708725 ?auto_1708721 ) ( ON ?auto_1708727 ?auto_1708725 ) ( not ( = ?auto_1708722 ?auto_1708723 ) ) ( not ( = ?auto_1708722 ?auto_1708724 ) ) ( not ( = ?auto_1708722 ?auto_1708721 ) ) ( not ( = ?auto_1708722 ?auto_1708725 ) ) ( not ( = ?auto_1708722 ?auto_1708727 ) ) ( not ( = ?auto_1708722 ?auto_1708726 ) ) ( not ( = ?auto_1708722 ?auto_1708728 ) ) ( not ( = ?auto_1708722 ?auto_1708730 ) ) ( not ( = ?auto_1708723 ?auto_1708724 ) ) ( not ( = ?auto_1708723 ?auto_1708721 ) ) ( not ( = ?auto_1708723 ?auto_1708725 ) ) ( not ( = ?auto_1708723 ?auto_1708727 ) ) ( not ( = ?auto_1708723 ?auto_1708726 ) ) ( not ( = ?auto_1708723 ?auto_1708728 ) ) ( not ( = ?auto_1708723 ?auto_1708730 ) ) ( not ( = ?auto_1708724 ?auto_1708721 ) ) ( not ( = ?auto_1708724 ?auto_1708725 ) ) ( not ( = ?auto_1708724 ?auto_1708727 ) ) ( not ( = ?auto_1708724 ?auto_1708726 ) ) ( not ( = ?auto_1708724 ?auto_1708728 ) ) ( not ( = ?auto_1708724 ?auto_1708730 ) ) ( not ( = ?auto_1708721 ?auto_1708725 ) ) ( not ( = ?auto_1708721 ?auto_1708727 ) ) ( not ( = ?auto_1708721 ?auto_1708726 ) ) ( not ( = ?auto_1708721 ?auto_1708728 ) ) ( not ( = ?auto_1708721 ?auto_1708730 ) ) ( not ( = ?auto_1708725 ?auto_1708727 ) ) ( not ( = ?auto_1708725 ?auto_1708726 ) ) ( not ( = ?auto_1708725 ?auto_1708728 ) ) ( not ( = ?auto_1708725 ?auto_1708730 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1708727 ?auto_1708726 ?auto_1708728 )
      ( MAKE-7CRATE-VERIFY ?auto_1708722 ?auto_1708723 ?auto_1708724 ?auto_1708721 ?auto_1708725 ?auto_1708727 ?auto_1708726 ?auto_1708728 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1708800 - SURFACE
      ?auto_1708801 - SURFACE
      ?auto_1708802 - SURFACE
      ?auto_1708799 - SURFACE
      ?auto_1708803 - SURFACE
      ?auto_1708805 - SURFACE
      ?auto_1708804 - SURFACE
      ?auto_1708806 - SURFACE
    )
    :vars
    (
      ?auto_1708808 - HOIST
      ?auto_1708810 - PLACE
      ?auto_1708807 - PLACE
      ?auto_1708811 - HOIST
      ?auto_1708809 - SURFACE
      ?auto_1708812 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1708808 ?auto_1708810 ) ( IS-CRATE ?auto_1708806 ) ( not ( = ?auto_1708804 ?auto_1708806 ) ) ( not ( = ?auto_1708805 ?auto_1708804 ) ) ( not ( = ?auto_1708805 ?auto_1708806 ) ) ( not ( = ?auto_1708807 ?auto_1708810 ) ) ( HOIST-AT ?auto_1708811 ?auto_1708807 ) ( not ( = ?auto_1708808 ?auto_1708811 ) ) ( AVAILABLE ?auto_1708811 ) ( SURFACE-AT ?auto_1708806 ?auto_1708807 ) ( ON ?auto_1708806 ?auto_1708809 ) ( CLEAR ?auto_1708806 ) ( not ( = ?auto_1708804 ?auto_1708809 ) ) ( not ( = ?auto_1708806 ?auto_1708809 ) ) ( not ( = ?auto_1708805 ?auto_1708809 ) ) ( TRUCK-AT ?auto_1708812 ?auto_1708810 ) ( SURFACE-AT ?auto_1708805 ?auto_1708810 ) ( CLEAR ?auto_1708805 ) ( LIFTING ?auto_1708808 ?auto_1708804 ) ( IS-CRATE ?auto_1708804 ) ( ON ?auto_1708801 ?auto_1708800 ) ( ON ?auto_1708802 ?auto_1708801 ) ( ON ?auto_1708799 ?auto_1708802 ) ( ON ?auto_1708803 ?auto_1708799 ) ( ON ?auto_1708805 ?auto_1708803 ) ( not ( = ?auto_1708800 ?auto_1708801 ) ) ( not ( = ?auto_1708800 ?auto_1708802 ) ) ( not ( = ?auto_1708800 ?auto_1708799 ) ) ( not ( = ?auto_1708800 ?auto_1708803 ) ) ( not ( = ?auto_1708800 ?auto_1708805 ) ) ( not ( = ?auto_1708800 ?auto_1708804 ) ) ( not ( = ?auto_1708800 ?auto_1708806 ) ) ( not ( = ?auto_1708800 ?auto_1708809 ) ) ( not ( = ?auto_1708801 ?auto_1708802 ) ) ( not ( = ?auto_1708801 ?auto_1708799 ) ) ( not ( = ?auto_1708801 ?auto_1708803 ) ) ( not ( = ?auto_1708801 ?auto_1708805 ) ) ( not ( = ?auto_1708801 ?auto_1708804 ) ) ( not ( = ?auto_1708801 ?auto_1708806 ) ) ( not ( = ?auto_1708801 ?auto_1708809 ) ) ( not ( = ?auto_1708802 ?auto_1708799 ) ) ( not ( = ?auto_1708802 ?auto_1708803 ) ) ( not ( = ?auto_1708802 ?auto_1708805 ) ) ( not ( = ?auto_1708802 ?auto_1708804 ) ) ( not ( = ?auto_1708802 ?auto_1708806 ) ) ( not ( = ?auto_1708802 ?auto_1708809 ) ) ( not ( = ?auto_1708799 ?auto_1708803 ) ) ( not ( = ?auto_1708799 ?auto_1708805 ) ) ( not ( = ?auto_1708799 ?auto_1708804 ) ) ( not ( = ?auto_1708799 ?auto_1708806 ) ) ( not ( = ?auto_1708799 ?auto_1708809 ) ) ( not ( = ?auto_1708803 ?auto_1708805 ) ) ( not ( = ?auto_1708803 ?auto_1708804 ) ) ( not ( = ?auto_1708803 ?auto_1708806 ) ) ( not ( = ?auto_1708803 ?auto_1708809 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1708805 ?auto_1708804 ?auto_1708806 )
      ( MAKE-7CRATE-VERIFY ?auto_1708800 ?auto_1708801 ?auto_1708802 ?auto_1708799 ?auto_1708803 ?auto_1708805 ?auto_1708804 ?auto_1708806 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1708878 - SURFACE
      ?auto_1708879 - SURFACE
      ?auto_1708880 - SURFACE
      ?auto_1708877 - SURFACE
      ?auto_1708881 - SURFACE
      ?auto_1708883 - SURFACE
      ?auto_1708882 - SURFACE
      ?auto_1708884 - SURFACE
    )
    :vars
    (
      ?auto_1708888 - HOIST
      ?auto_1708885 - PLACE
      ?auto_1708886 - PLACE
      ?auto_1708890 - HOIST
      ?auto_1708889 - SURFACE
      ?auto_1708887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1708888 ?auto_1708885 ) ( IS-CRATE ?auto_1708884 ) ( not ( = ?auto_1708882 ?auto_1708884 ) ) ( not ( = ?auto_1708883 ?auto_1708882 ) ) ( not ( = ?auto_1708883 ?auto_1708884 ) ) ( not ( = ?auto_1708886 ?auto_1708885 ) ) ( HOIST-AT ?auto_1708890 ?auto_1708886 ) ( not ( = ?auto_1708888 ?auto_1708890 ) ) ( AVAILABLE ?auto_1708890 ) ( SURFACE-AT ?auto_1708884 ?auto_1708886 ) ( ON ?auto_1708884 ?auto_1708889 ) ( CLEAR ?auto_1708884 ) ( not ( = ?auto_1708882 ?auto_1708889 ) ) ( not ( = ?auto_1708884 ?auto_1708889 ) ) ( not ( = ?auto_1708883 ?auto_1708889 ) ) ( TRUCK-AT ?auto_1708887 ?auto_1708885 ) ( SURFACE-AT ?auto_1708883 ?auto_1708885 ) ( CLEAR ?auto_1708883 ) ( IS-CRATE ?auto_1708882 ) ( AVAILABLE ?auto_1708888 ) ( IN ?auto_1708882 ?auto_1708887 ) ( ON ?auto_1708879 ?auto_1708878 ) ( ON ?auto_1708880 ?auto_1708879 ) ( ON ?auto_1708877 ?auto_1708880 ) ( ON ?auto_1708881 ?auto_1708877 ) ( ON ?auto_1708883 ?auto_1708881 ) ( not ( = ?auto_1708878 ?auto_1708879 ) ) ( not ( = ?auto_1708878 ?auto_1708880 ) ) ( not ( = ?auto_1708878 ?auto_1708877 ) ) ( not ( = ?auto_1708878 ?auto_1708881 ) ) ( not ( = ?auto_1708878 ?auto_1708883 ) ) ( not ( = ?auto_1708878 ?auto_1708882 ) ) ( not ( = ?auto_1708878 ?auto_1708884 ) ) ( not ( = ?auto_1708878 ?auto_1708889 ) ) ( not ( = ?auto_1708879 ?auto_1708880 ) ) ( not ( = ?auto_1708879 ?auto_1708877 ) ) ( not ( = ?auto_1708879 ?auto_1708881 ) ) ( not ( = ?auto_1708879 ?auto_1708883 ) ) ( not ( = ?auto_1708879 ?auto_1708882 ) ) ( not ( = ?auto_1708879 ?auto_1708884 ) ) ( not ( = ?auto_1708879 ?auto_1708889 ) ) ( not ( = ?auto_1708880 ?auto_1708877 ) ) ( not ( = ?auto_1708880 ?auto_1708881 ) ) ( not ( = ?auto_1708880 ?auto_1708883 ) ) ( not ( = ?auto_1708880 ?auto_1708882 ) ) ( not ( = ?auto_1708880 ?auto_1708884 ) ) ( not ( = ?auto_1708880 ?auto_1708889 ) ) ( not ( = ?auto_1708877 ?auto_1708881 ) ) ( not ( = ?auto_1708877 ?auto_1708883 ) ) ( not ( = ?auto_1708877 ?auto_1708882 ) ) ( not ( = ?auto_1708877 ?auto_1708884 ) ) ( not ( = ?auto_1708877 ?auto_1708889 ) ) ( not ( = ?auto_1708881 ?auto_1708883 ) ) ( not ( = ?auto_1708881 ?auto_1708882 ) ) ( not ( = ?auto_1708881 ?auto_1708884 ) ) ( not ( = ?auto_1708881 ?auto_1708889 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1708883 ?auto_1708882 ?auto_1708884 )
      ( MAKE-7CRATE-VERIFY ?auto_1708878 ?auto_1708879 ?auto_1708880 ?auto_1708877 ?auto_1708881 ?auto_1708883 ?auto_1708882 ?auto_1708884 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1711797 - SURFACE
      ?auto_1711798 - SURFACE
      ?auto_1711799 - SURFACE
      ?auto_1711796 - SURFACE
      ?auto_1711800 - SURFACE
      ?auto_1711802 - SURFACE
      ?auto_1711801 - SURFACE
      ?auto_1711803 - SURFACE
      ?auto_1711804 - SURFACE
    )
    :vars
    (
      ?auto_1711806 - HOIST
      ?auto_1711805 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1711806 ?auto_1711805 ) ( SURFACE-AT ?auto_1711803 ?auto_1711805 ) ( CLEAR ?auto_1711803 ) ( LIFTING ?auto_1711806 ?auto_1711804 ) ( IS-CRATE ?auto_1711804 ) ( not ( = ?auto_1711803 ?auto_1711804 ) ) ( ON ?auto_1711798 ?auto_1711797 ) ( ON ?auto_1711799 ?auto_1711798 ) ( ON ?auto_1711796 ?auto_1711799 ) ( ON ?auto_1711800 ?auto_1711796 ) ( ON ?auto_1711802 ?auto_1711800 ) ( ON ?auto_1711801 ?auto_1711802 ) ( ON ?auto_1711803 ?auto_1711801 ) ( not ( = ?auto_1711797 ?auto_1711798 ) ) ( not ( = ?auto_1711797 ?auto_1711799 ) ) ( not ( = ?auto_1711797 ?auto_1711796 ) ) ( not ( = ?auto_1711797 ?auto_1711800 ) ) ( not ( = ?auto_1711797 ?auto_1711802 ) ) ( not ( = ?auto_1711797 ?auto_1711801 ) ) ( not ( = ?auto_1711797 ?auto_1711803 ) ) ( not ( = ?auto_1711797 ?auto_1711804 ) ) ( not ( = ?auto_1711798 ?auto_1711799 ) ) ( not ( = ?auto_1711798 ?auto_1711796 ) ) ( not ( = ?auto_1711798 ?auto_1711800 ) ) ( not ( = ?auto_1711798 ?auto_1711802 ) ) ( not ( = ?auto_1711798 ?auto_1711801 ) ) ( not ( = ?auto_1711798 ?auto_1711803 ) ) ( not ( = ?auto_1711798 ?auto_1711804 ) ) ( not ( = ?auto_1711799 ?auto_1711796 ) ) ( not ( = ?auto_1711799 ?auto_1711800 ) ) ( not ( = ?auto_1711799 ?auto_1711802 ) ) ( not ( = ?auto_1711799 ?auto_1711801 ) ) ( not ( = ?auto_1711799 ?auto_1711803 ) ) ( not ( = ?auto_1711799 ?auto_1711804 ) ) ( not ( = ?auto_1711796 ?auto_1711800 ) ) ( not ( = ?auto_1711796 ?auto_1711802 ) ) ( not ( = ?auto_1711796 ?auto_1711801 ) ) ( not ( = ?auto_1711796 ?auto_1711803 ) ) ( not ( = ?auto_1711796 ?auto_1711804 ) ) ( not ( = ?auto_1711800 ?auto_1711802 ) ) ( not ( = ?auto_1711800 ?auto_1711801 ) ) ( not ( = ?auto_1711800 ?auto_1711803 ) ) ( not ( = ?auto_1711800 ?auto_1711804 ) ) ( not ( = ?auto_1711802 ?auto_1711801 ) ) ( not ( = ?auto_1711802 ?auto_1711803 ) ) ( not ( = ?auto_1711802 ?auto_1711804 ) ) ( not ( = ?auto_1711801 ?auto_1711803 ) ) ( not ( = ?auto_1711801 ?auto_1711804 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1711803 ?auto_1711804 )
      ( MAKE-8CRATE-VERIFY ?auto_1711797 ?auto_1711798 ?auto_1711799 ?auto_1711796 ?auto_1711800 ?auto_1711802 ?auto_1711801 ?auto_1711803 ?auto_1711804 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1711864 - SURFACE
      ?auto_1711865 - SURFACE
      ?auto_1711866 - SURFACE
      ?auto_1711863 - SURFACE
      ?auto_1711867 - SURFACE
      ?auto_1711869 - SURFACE
      ?auto_1711868 - SURFACE
      ?auto_1711870 - SURFACE
      ?auto_1711871 - SURFACE
    )
    :vars
    (
      ?auto_1711872 - HOIST
      ?auto_1711873 - PLACE
      ?auto_1711874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1711872 ?auto_1711873 ) ( SURFACE-AT ?auto_1711870 ?auto_1711873 ) ( CLEAR ?auto_1711870 ) ( IS-CRATE ?auto_1711871 ) ( not ( = ?auto_1711870 ?auto_1711871 ) ) ( TRUCK-AT ?auto_1711874 ?auto_1711873 ) ( AVAILABLE ?auto_1711872 ) ( IN ?auto_1711871 ?auto_1711874 ) ( ON ?auto_1711870 ?auto_1711868 ) ( not ( = ?auto_1711868 ?auto_1711870 ) ) ( not ( = ?auto_1711868 ?auto_1711871 ) ) ( ON ?auto_1711865 ?auto_1711864 ) ( ON ?auto_1711866 ?auto_1711865 ) ( ON ?auto_1711863 ?auto_1711866 ) ( ON ?auto_1711867 ?auto_1711863 ) ( ON ?auto_1711869 ?auto_1711867 ) ( ON ?auto_1711868 ?auto_1711869 ) ( not ( = ?auto_1711864 ?auto_1711865 ) ) ( not ( = ?auto_1711864 ?auto_1711866 ) ) ( not ( = ?auto_1711864 ?auto_1711863 ) ) ( not ( = ?auto_1711864 ?auto_1711867 ) ) ( not ( = ?auto_1711864 ?auto_1711869 ) ) ( not ( = ?auto_1711864 ?auto_1711868 ) ) ( not ( = ?auto_1711864 ?auto_1711870 ) ) ( not ( = ?auto_1711864 ?auto_1711871 ) ) ( not ( = ?auto_1711865 ?auto_1711866 ) ) ( not ( = ?auto_1711865 ?auto_1711863 ) ) ( not ( = ?auto_1711865 ?auto_1711867 ) ) ( not ( = ?auto_1711865 ?auto_1711869 ) ) ( not ( = ?auto_1711865 ?auto_1711868 ) ) ( not ( = ?auto_1711865 ?auto_1711870 ) ) ( not ( = ?auto_1711865 ?auto_1711871 ) ) ( not ( = ?auto_1711866 ?auto_1711863 ) ) ( not ( = ?auto_1711866 ?auto_1711867 ) ) ( not ( = ?auto_1711866 ?auto_1711869 ) ) ( not ( = ?auto_1711866 ?auto_1711868 ) ) ( not ( = ?auto_1711866 ?auto_1711870 ) ) ( not ( = ?auto_1711866 ?auto_1711871 ) ) ( not ( = ?auto_1711863 ?auto_1711867 ) ) ( not ( = ?auto_1711863 ?auto_1711869 ) ) ( not ( = ?auto_1711863 ?auto_1711868 ) ) ( not ( = ?auto_1711863 ?auto_1711870 ) ) ( not ( = ?auto_1711863 ?auto_1711871 ) ) ( not ( = ?auto_1711867 ?auto_1711869 ) ) ( not ( = ?auto_1711867 ?auto_1711868 ) ) ( not ( = ?auto_1711867 ?auto_1711870 ) ) ( not ( = ?auto_1711867 ?auto_1711871 ) ) ( not ( = ?auto_1711869 ?auto_1711868 ) ) ( not ( = ?auto_1711869 ?auto_1711870 ) ) ( not ( = ?auto_1711869 ?auto_1711871 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1711868 ?auto_1711870 ?auto_1711871 )
      ( MAKE-8CRATE-VERIFY ?auto_1711864 ?auto_1711865 ?auto_1711866 ?auto_1711863 ?auto_1711867 ?auto_1711869 ?auto_1711868 ?auto_1711870 ?auto_1711871 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1711940 - SURFACE
      ?auto_1711941 - SURFACE
      ?auto_1711942 - SURFACE
      ?auto_1711939 - SURFACE
      ?auto_1711943 - SURFACE
      ?auto_1711945 - SURFACE
      ?auto_1711944 - SURFACE
      ?auto_1711946 - SURFACE
      ?auto_1711947 - SURFACE
    )
    :vars
    (
      ?auto_1711948 - HOIST
      ?auto_1711951 - PLACE
      ?auto_1711950 - TRUCK
      ?auto_1711949 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1711948 ?auto_1711951 ) ( SURFACE-AT ?auto_1711946 ?auto_1711951 ) ( CLEAR ?auto_1711946 ) ( IS-CRATE ?auto_1711947 ) ( not ( = ?auto_1711946 ?auto_1711947 ) ) ( AVAILABLE ?auto_1711948 ) ( IN ?auto_1711947 ?auto_1711950 ) ( ON ?auto_1711946 ?auto_1711944 ) ( not ( = ?auto_1711944 ?auto_1711946 ) ) ( not ( = ?auto_1711944 ?auto_1711947 ) ) ( TRUCK-AT ?auto_1711950 ?auto_1711949 ) ( not ( = ?auto_1711949 ?auto_1711951 ) ) ( ON ?auto_1711941 ?auto_1711940 ) ( ON ?auto_1711942 ?auto_1711941 ) ( ON ?auto_1711939 ?auto_1711942 ) ( ON ?auto_1711943 ?auto_1711939 ) ( ON ?auto_1711945 ?auto_1711943 ) ( ON ?auto_1711944 ?auto_1711945 ) ( not ( = ?auto_1711940 ?auto_1711941 ) ) ( not ( = ?auto_1711940 ?auto_1711942 ) ) ( not ( = ?auto_1711940 ?auto_1711939 ) ) ( not ( = ?auto_1711940 ?auto_1711943 ) ) ( not ( = ?auto_1711940 ?auto_1711945 ) ) ( not ( = ?auto_1711940 ?auto_1711944 ) ) ( not ( = ?auto_1711940 ?auto_1711946 ) ) ( not ( = ?auto_1711940 ?auto_1711947 ) ) ( not ( = ?auto_1711941 ?auto_1711942 ) ) ( not ( = ?auto_1711941 ?auto_1711939 ) ) ( not ( = ?auto_1711941 ?auto_1711943 ) ) ( not ( = ?auto_1711941 ?auto_1711945 ) ) ( not ( = ?auto_1711941 ?auto_1711944 ) ) ( not ( = ?auto_1711941 ?auto_1711946 ) ) ( not ( = ?auto_1711941 ?auto_1711947 ) ) ( not ( = ?auto_1711942 ?auto_1711939 ) ) ( not ( = ?auto_1711942 ?auto_1711943 ) ) ( not ( = ?auto_1711942 ?auto_1711945 ) ) ( not ( = ?auto_1711942 ?auto_1711944 ) ) ( not ( = ?auto_1711942 ?auto_1711946 ) ) ( not ( = ?auto_1711942 ?auto_1711947 ) ) ( not ( = ?auto_1711939 ?auto_1711943 ) ) ( not ( = ?auto_1711939 ?auto_1711945 ) ) ( not ( = ?auto_1711939 ?auto_1711944 ) ) ( not ( = ?auto_1711939 ?auto_1711946 ) ) ( not ( = ?auto_1711939 ?auto_1711947 ) ) ( not ( = ?auto_1711943 ?auto_1711945 ) ) ( not ( = ?auto_1711943 ?auto_1711944 ) ) ( not ( = ?auto_1711943 ?auto_1711946 ) ) ( not ( = ?auto_1711943 ?auto_1711947 ) ) ( not ( = ?auto_1711945 ?auto_1711944 ) ) ( not ( = ?auto_1711945 ?auto_1711946 ) ) ( not ( = ?auto_1711945 ?auto_1711947 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1711944 ?auto_1711946 ?auto_1711947 )
      ( MAKE-8CRATE-VERIFY ?auto_1711940 ?auto_1711941 ?auto_1711942 ?auto_1711939 ?auto_1711943 ?auto_1711945 ?auto_1711944 ?auto_1711946 ?auto_1711947 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1712024 - SURFACE
      ?auto_1712025 - SURFACE
      ?auto_1712026 - SURFACE
      ?auto_1712023 - SURFACE
      ?auto_1712027 - SURFACE
      ?auto_1712029 - SURFACE
      ?auto_1712028 - SURFACE
      ?auto_1712030 - SURFACE
      ?auto_1712031 - SURFACE
    )
    :vars
    (
      ?auto_1712036 - HOIST
      ?auto_1712035 - PLACE
      ?auto_1712033 - TRUCK
      ?auto_1712034 - PLACE
      ?auto_1712032 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1712036 ?auto_1712035 ) ( SURFACE-AT ?auto_1712030 ?auto_1712035 ) ( CLEAR ?auto_1712030 ) ( IS-CRATE ?auto_1712031 ) ( not ( = ?auto_1712030 ?auto_1712031 ) ) ( AVAILABLE ?auto_1712036 ) ( ON ?auto_1712030 ?auto_1712028 ) ( not ( = ?auto_1712028 ?auto_1712030 ) ) ( not ( = ?auto_1712028 ?auto_1712031 ) ) ( TRUCK-AT ?auto_1712033 ?auto_1712034 ) ( not ( = ?auto_1712034 ?auto_1712035 ) ) ( HOIST-AT ?auto_1712032 ?auto_1712034 ) ( LIFTING ?auto_1712032 ?auto_1712031 ) ( not ( = ?auto_1712036 ?auto_1712032 ) ) ( ON ?auto_1712025 ?auto_1712024 ) ( ON ?auto_1712026 ?auto_1712025 ) ( ON ?auto_1712023 ?auto_1712026 ) ( ON ?auto_1712027 ?auto_1712023 ) ( ON ?auto_1712029 ?auto_1712027 ) ( ON ?auto_1712028 ?auto_1712029 ) ( not ( = ?auto_1712024 ?auto_1712025 ) ) ( not ( = ?auto_1712024 ?auto_1712026 ) ) ( not ( = ?auto_1712024 ?auto_1712023 ) ) ( not ( = ?auto_1712024 ?auto_1712027 ) ) ( not ( = ?auto_1712024 ?auto_1712029 ) ) ( not ( = ?auto_1712024 ?auto_1712028 ) ) ( not ( = ?auto_1712024 ?auto_1712030 ) ) ( not ( = ?auto_1712024 ?auto_1712031 ) ) ( not ( = ?auto_1712025 ?auto_1712026 ) ) ( not ( = ?auto_1712025 ?auto_1712023 ) ) ( not ( = ?auto_1712025 ?auto_1712027 ) ) ( not ( = ?auto_1712025 ?auto_1712029 ) ) ( not ( = ?auto_1712025 ?auto_1712028 ) ) ( not ( = ?auto_1712025 ?auto_1712030 ) ) ( not ( = ?auto_1712025 ?auto_1712031 ) ) ( not ( = ?auto_1712026 ?auto_1712023 ) ) ( not ( = ?auto_1712026 ?auto_1712027 ) ) ( not ( = ?auto_1712026 ?auto_1712029 ) ) ( not ( = ?auto_1712026 ?auto_1712028 ) ) ( not ( = ?auto_1712026 ?auto_1712030 ) ) ( not ( = ?auto_1712026 ?auto_1712031 ) ) ( not ( = ?auto_1712023 ?auto_1712027 ) ) ( not ( = ?auto_1712023 ?auto_1712029 ) ) ( not ( = ?auto_1712023 ?auto_1712028 ) ) ( not ( = ?auto_1712023 ?auto_1712030 ) ) ( not ( = ?auto_1712023 ?auto_1712031 ) ) ( not ( = ?auto_1712027 ?auto_1712029 ) ) ( not ( = ?auto_1712027 ?auto_1712028 ) ) ( not ( = ?auto_1712027 ?auto_1712030 ) ) ( not ( = ?auto_1712027 ?auto_1712031 ) ) ( not ( = ?auto_1712029 ?auto_1712028 ) ) ( not ( = ?auto_1712029 ?auto_1712030 ) ) ( not ( = ?auto_1712029 ?auto_1712031 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1712028 ?auto_1712030 ?auto_1712031 )
      ( MAKE-8CRATE-VERIFY ?auto_1712024 ?auto_1712025 ?auto_1712026 ?auto_1712023 ?auto_1712027 ?auto_1712029 ?auto_1712028 ?auto_1712030 ?auto_1712031 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1712116 - SURFACE
      ?auto_1712117 - SURFACE
      ?auto_1712118 - SURFACE
      ?auto_1712115 - SURFACE
      ?auto_1712119 - SURFACE
      ?auto_1712121 - SURFACE
      ?auto_1712120 - SURFACE
      ?auto_1712122 - SURFACE
      ?auto_1712123 - SURFACE
    )
    :vars
    (
      ?auto_1712126 - HOIST
      ?auto_1712124 - PLACE
      ?auto_1712125 - TRUCK
      ?auto_1712127 - PLACE
      ?auto_1712128 - HOIST
      ?auto_1712129 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1712126 ?auto_1712124 ) ( SURFACE-AT ?auto_1712122 ?auto_1712124 ) ( CLEAR ?auto_1712122 ) ( IS-CRATE ?auto_1712123 ) ( not ( = ?auto_1712122 ?auto_1712123 ) ) ( AVAILABLE ?auto_1712126 ) ( ON ?auto_1712122 ?auto_1712120 ) ( not ( = ?auto_1712120 ?auto_1712122 ) ) ( not ( = ?auto_1712120 ?auto_1712123 ) ) ( TRUCK-AT ?auto_1712125 ?auto_1712127 ) ( not ( = ?auto_1712127 ?auto_1712124 ) ) ( HOIST-AT ?auto_1712128 ?auto_1712127 ) ( not ( = ?auto_1712126 ?auto_1712128 ) ) ( AVAILABLE ?auto_1712128 ) ( SURFACE-AT ?auto_1712123 ?auto_1712127 ) ( ON ?auto_1712123 ?auto_1712129 ) ( CLEAR ?auto_1712123 ) ( not ( = ?auto_1712122 ?auto_1712129 ) ) ( not ( = ?auto_1712123 ?auto_1712129 ) ) ( not ( = ?auto_1712120 ?auto_1712129 ) ) ( ON ?auto_1712117 ?auto_1712116 ) ( ON ?auto_1712118 ?auto_1712117 ) ( ON ?auto_1712115 ?auto_1712118 ) ( ON ?auto_1712119 ?auto_1712115 ) ( ON ?auto_1712121 ?auto_1712119 ) ( ON ?auto_1712120 ?auto_1712121 ) ( not ( = ?auto_1712116 ?auto_1712117 ) ) ( not ( = ?auto_1712116 ?auto_1712118 ) ) ( not ( = ?auto_1712116 ?auto_1712115 ) ) ( not ( = ?auto_1712116 ?auto_1712119 ) ) ( not ( = ?auto_1712116 ?auto_1712121 ) ) ( not ( = ?auto_1712116 ?auto_1712120 ) ) ( not ( = ?auto_1712116 ?auto_1712122 ) ) ( not ( = ?auto_1712116 ?auto_1712123 ) ) ( not ( = ?auto_1712116 ?auto_1712129 ) ) ( not ( = ?auto_1712117 ?auto_1712118 ) ) ( not ( = ?auto_1712117 ?auto_1712115 ) ) ( not ( = ?auto_1712117 ?auto_1712119 ) ) ( not ( = ?auto_1712117 ?auto_1712121 ) ) ( not ( = ?auto_1712117 ?auto_1712120 ) ) ( not ( = ?auto_1712117 ?auto_1712122 ) ) ( not ( = ?auto_1712117 ?auto_1712123 ) ) ( not ( = ?auto_1712117 ?auto_1712129 ) ) ( not ( = ?auto_1712118 ?auto_1712115 ) ) ( not ( = ?auto_1712118 ?auto_1712119 ) ) ( not ( = ?auto_1712118 ?auto_1712121 ) ) ( not ( = ?auto_1712118 ?auto_1712120 ) ) ( not ( = ?auto_1712118 ?auto_1712122 ) ) ( not ( = ?auto_1712118 ?auto_1712123 ) ) ( not ( = ?auto_1712118 ?auto_1712129 ) ) ( not ( = ?auto_1712115 ?auto_1712119 ) ) ( not ( = ?auto_1712115 ?auto_1712121 ) ) ( not ( = ?auto_1712115 ?auto_1712120 ) ) ( not ( = ?auto_1712115 ?auto_1712122 ) ) ( not ( = ?auto_1712115 ?auto_1712123 ) ) ( not ( = ?auto_1712115 ?auto_1712129 ) ) ( not ( = ?auto_1712119 ?auto_1712121 ) ) ( not ( = ?auto_1712119 ?auto_1712120 ) ) ( not ( = ?auto_1712119 ?auto_1712122 ) ) ( not ( = ?auto_1712119 ?auto_1712123 ) ) ( not ( = ?auto_1712119 ?auto_1712129 ) ) ( not ( = ?auto_1712121 ?auto_1712120 ) ) ( not ( = ?auto_1712121 ?auto_1712122 ) ) ( not ( = ?auto_1712121 ?auto_1712123 ) ) ( not ( = ?auto_1712121 ?auto_1712129 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1712120 ?auto_1712122 ?auto_1712123 )
      ( MAKE-8CRATE-VERIFY ?auto_1712116 ?auto_1712117 ?auto_1712118 ?auto_1712115 ?auto_1712119 ?auto_1712121 ?auto_1712120 ?auto_1712122 ?auto_1712123 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1712209 - SURFACE
      ?auto_1712210 - SURFACE
      ?auto_1712211 - SURFACE
      ?auto_1712208 - SURFACE
      ?auto_1712212 - SURFACE
      ?auto_1712214 - SURFACE
      ?auto_1712213 - SURFACE
      ?auto_1712215 - SURFACE
      ?auto_1712216 - SURFACE
    )
    :vars
    (
      ?auto_1712217 - HOIST
      ?auto_1712219 - PLACE
      ?auto_1712218 - PLACE
      ?auto_1712220 - HOIST
      ?auto_1712222 - SURFACE
      ?auto_1712221 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1712217 ?auto_1712219 ) ( SURFACE-AT ?auto_1712215 ?auto_1712219 ) ( CLEAR ?auto_1712215 ) ( IS-CRATE ?auto_1712216 ) ( not ( = ?auto_1712215 ?auto_1712216 ) ) ( AVAILABLE ?auto_1712217 ) ( ON ?auto_1712215 ?auto_1712213 ) ( not ( = ?auto_1712213 ?auto_1712215 ) ) ( not ( = ?auto_1712213 ?auto_1712216 ) ) ( not ( = ?auto_1712218 ?auto_1712219 ) ) ( HOIST-AT ?auto_1712220 ?auto_1712218 ) ( not ( = ?auto_1712217 ?auto_1712220 ) ) ( AVAILABLE ?auto_1712220 ) ( SURFACE-AT ?auto_1712216 ?auto_1712218 ) ( ON ?auto_1712216 ?auto_1712222 ) ( CLEAR ?auto_1712216 ) ( not ( = ?auto_1712215 ?auto_1712222 ) ) ( not ( = ?auto_1712216 ?auto_1712222 ) ) ( not ( = ?auto_1712213 ?auto_1712222 ) ) ( TRUCK-AT ?auto_1712221 ?auto_1712219 ) ( ON ?auto_1712210 ?auto_1712209 ) ( ON ?auto_1712211 ?auto_1712210 ) ( ON ?auto_1712208 ?auto_1712211 ) ( ON ?auto_1712212 ?auto_1712208 ) ( ON ?auto_1712214 ?auto_1712212 ) ( ON ?auto_1712213 ?auto_1712214 ) ( not ( = ?auto_1712209 ?auto_1712210 ) ) ( not ( = ?auto_1712209 ?auto_1712211 ) ) ( not ( = ?auto_1712209 ?auto_1712208 ) ) ( not ( = ?auto_1712209 ?auto_1712212 ) ) ( not ( = ?auto_1712209 ?auto_1712214 ) ) ( not ( = ?auto_1712209 ?auto_1712213 ) ) ( not ( = ?auto_1712209 ?auto_1712215 ) ) ( not ( = ?auto_1712209 ?auto_1712216 ) ) ( not ( = ?auto_1712209 ?auto_1712222 ) ) ( not ( = ?auto_1712210 ?auto_1712211 ) ) ( not ( = ?auto_1712210 ?auto_1712208 ) ) ( not ( = ?auto_1712210 ?auto_1712212 ) ) ( not ( = ?auto_1712210 ?auto_1712214 ) ) ( not ( = ?auto_1712210 ?auto_1712213 ) ) ( not ( = ?auto_1712210 ?auto_1712215 ) ) ( not ( = ?auto_1712210 ?auto_1712216 ) ) ( not ( = ?auto_1712210 ?auto_1712222 ) ) ( not ( = ?auto_1712211 ?auto_1712208 ) ) ( not ( = ?auto_1712211 ?auto_1712212 ) ) ( not ( = ?auto_1712211 ?auto_1712214 ) ) ( not ( = ?auto_1712211 ?auto_1712213 ) ) ( not ( = ?auto_1712211 ?auto_1712215 ) ) ( not ( = ?auto_1712211 ?auto_1712216 ) ) ( not ( = ?auto_1712211 ?auto_1712222 ) ) ( not ( = ?auto_1712208 ?auto_1712212 ) ) ( not ( = ?auto_1712208 ?auto_1712214 ) ) ( not ( = ?auto_1712208 ?auto_1712213 ) ) ( not ( = ?auto_1712208 ?auto_1712215 ) ) ( not ( = ?auto_1712208 ?auto_1712216 ) ) ( not ( = ?auto_1712208 ?auto_1712222 ) ) ( not ( = ?auto_1712212 ?auto_1712214 ) ) ( not ( = ?auto_1712212 ?auto_1712213 ) ) ( not ( = ?auto_1712212 ?auto_1712215 ) ) ( not ( = ?auto_1712212 ?auto_1712216 ) ) ( not ( = ?auto_1712212 ?auto_1712222 ) ) ( not ( = ?auto_1712214 ?auto_1712213 ) ) ( not ( = ?auto_1712214 ?auto_1712215 ) ) ( not ( = ?auto_1712214 ?auto_1712216 ) ) ( not ( = ?auto_1712214 ?auto_1712222 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1712213 ?auto_1712215 ?auto_1712216 )
      ( MAKE-8CRATE-VERIFY ?auto_1712209 ?auto_1712210 ?auto_1712211 ?auto_1712208 ?auto_1712212 ?auto_1712214 ?auto_1712213 ?auto_1712215 ?auto_1712216 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1712302 - SURFACE
      ?auto_1712303 - SURFACE
      ?auto_1712304 - SURFACE
      ?auto_1712301 - SURFACE
      ?auto_1712305 - SURFACE
      ?auto_1712307 - SURFACE
      ?auto_1712306 - SURFACE
      ?auto_1712308 - SURFACE
      ?auto_1712309 - SURFACE
    )
    :vars
    (
      ?auto_1712312 - HOIST
      ?auto_1712314 - PLACE
      ?auto_1712311 - PLACE
      ?auto_1712310 - HOIST
      ?auto_1712315 - SURFACE
      ?auto_1712313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1712312 ?auto_1712314 ) ( IS-CRATE ?auto_1712309 ) ( not ( = ?auto_1712308 ?auto_1712309 ) ) ( not ( = ?auto_1712306 ?auto_1712308 ) ) ( not ( = ?auto_1712306 ?auto_1712309 ) ) ( not ( = ?auto_1712311 ?auto_1712314 ) ) ( HOIST-AT ?auto_1712310 ?auto_1712311 ) ( not ( = ?auto_1712312 ?auto_1712310 ) ) ( AVAILABLE ?auto_1712310 ) ( SURFACE-AT ?auto_1712309 ?auto_1712311 ) ( ON ?auto_1712309 ?auto_1712315 ) ( CLEAR ?auto_1712309 ) ( not ( = ?auto_1712308 ?auto_1712315 ) ) ( not ( = ?auto_1712309 ?auto_1712315 ) ) ( not ( = ?auto_1712306 ?auto_1712315 ) ) ( TRUCK-AT ?auto_1712313 ?auto_1712314 ) ( SURFACE-AT ?auto_1712306 ?auto_1712314 ) ( CLEAR ?auto_1712306 ) ( LIFTING ?auto_1712312 ?auto_1712308 ) ( IS-CRATE ?auto_1712308 ) ( ON ?auto_1712303 ?auto_1712302 ) ( ON ?auto_1712304 ?auto_1712303 ) ( ON ?auto_1712301 ?auto_1712304 ) ( ON ?auto_1712305 ?auto_1712301 ) ( ON ?auto_1712307 ?auto_1712305 ) ( ON ?auto_1712306 ?auto_1712307 ) ( not ( = ?auto_1712302 ?auto_1712303 ) ) ( not ( = ?auto_1712302 ?auto_1712304 ) ) ( not ( = ?auto_1712302 ?auto_1712301 ) ) ( not ( = ?auto_1712302 ?auto_1712305 ) ) ( not ( = ?auto_1712302 ?auto_1712307 ) ) ( not ( = ?auto_1712302 ?auto_1712306 ) ) ( not ( = ?auto_1712302 ?auto_1712308 ) ) ( not ( = ?auto_1712302 ?auto_1712309 ) ) ( not ( = ?auto_1712302 ?auto_1712315 ) ) ( not ( = ?auto_1712303 ?auto_1712304 ) ) ( not ( = ?auto_1712303 ?auto_1712301 ) ) ( not ( = ?auto_1712303 ?auto_1712305 ) ) ( not ( = ?auto_1712303 ?auto_1712307 ) ) ( not ( = ?auto_1712303 ?auto_1712306 ) ) ( not ( = ?auto_1712303 ?auto_1712308 ) ) ( not ( = ?auto_1712303 ?auto_1712309 ) ) ( not ( = ?auto_1712303 ?auto_1712315 ) ) ( not ( = ?auto_1712304 ?auto_1712301 ) ) ( not ( = ?auto_1712304 ?auto_1712305 ) ) ( not ( = ?auto_1712304 ?auto_1712307 ) ) ( not ( = ?auto_1712304 ?auto_1712306 ) ) ( not ( = ?auto_1712304 ?auto_1712308 ) ) ( not ( = ?auto_1712304 ?auto_1712309 ) ) ( not ( = ?auto_1712304 ?auto_1712315 ) ) ( not ( = ?auto_1712301 ?auto_1712305 ) ) ( not ( = ?auto_1712301 ?auto_1712307 ) ) ( not ( = ?auto_1712301 ?auto_1712306 ) ) ( not ( = ?auto_1712301 ?auto_1712308 ) ) ( not ( = ?auto_1712301 ?auto_1712309 ) ) ( not ( = ?auto_1712301 ?auto_1712315 ) ) ( not ( = ?auto_1712305 ?auto_1712307 ) ) ( not ( = ?auto_1712305 ?auto_1712306 ) ) ( not ( = ?auto_1712305 ?auto_1712308 ) ) ( not ( = ?auto_1712305 ?auto_1712309 ) ) ( not ( = ?auto_1712305 ?auto_1712315 ) ) ( not ( = ?auto_1712307 ?auto_1712306 ) ) ( not ( = ?auto_1712307 ?auto_1712308 ) ) ( not ( = ?auto_1712307 ?auto_1712309 ) ) ( not ( = ?auto_1712307 ?auto_1712315 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1712306 ?auto_1712308 ?auto_1712309 )
      ( MAKE-8CRATE-VERIFY ?auto_1712302 ?auto_1712303 ?auto_1712304 ?auto_1712301 ?auto_1712305 ?auto_1712307 ?auto_1712306 ?auto_1712308 ?auto_1712309 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1712395 - SURFACE
      ?auto_1712396 - SURFACE
      ?auto_1712397 - SURFACE
      ?auto_1712394 - SURFACE
      ?auto_1712398 - SURFACE
      ?auto_1712400 - SURFACE
      ?auto_1712399 - SURFACE
      ?auto_1712401 - SURFACE
      ?auto_1712402 - SURFACE
    )
    :vars
    (
      ?auto_1712406 - HOIST
      ?auto_1712405 - PLACE
      ?auto_1712407 - PLACE
      ?auto_1712404 - HOIST
      ?auto_1712403 - SURFACE
      ?auto_1712408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1712406 ?auto_1712405 ) ( IS-CRATE ?auto_1712402 ) ( not ( = ?auto_1712401 ?auto_1712402 ) ) ( not ( = ?auto_1712399 ?auto_1712401 ) ) ( not ( = ?auto_1712399 ?auto_1712402 ) ) ( not ( = ?auto_1712407 ?auto_1712405 ) ) ( HOIST-AT ?auto_1712404 ?auto_1712407 ) ( not ( = ?auto_1712406 ?auto_1712404 ) ) ( AVAILABLE ?auto_1712404 ) ( SURFACE-AT ?auto_1712402 ?auto_1712407 ) ( ON ?auto_1712402 ?auto_1712403 ) ( CLEAR ?auto_1712402 ) ( not ( = ?auto_1712401 ?auto_1712403 ) ) ( not ( = ?auto_1712402 ?auto_1712403 ) ) ( not ( = ?auto_1712399 ?auto_1712403 ) ) ( TRUCK-AT ?auto_1712408 ?auto_1712405 ) ( SURFACE-AT ?auto_1712399 ?auto_1712405 ) ( CLEAR ?auto_1712399 ) ( IS-CRATE ?auto_1712401 ) ( AVAILABLE ?auto_1712406 ) ( IN ?auto_1712401 ?auto_1712408 ) ( ON ?auto_1712396 ?auto_1712395 ) ( ON ?auto_1712397 ?auto_1712396 ) ( ON ?auto_1712394 ?auto_1712397 ) ( ON ?auto_1712398 ?auto_1712394 ) ( ON ?auto_1712400 ?auto_1712398 ) ( ON ?auto_1712399 ?auto_1712400 ) ( not ( = ?auto_1712395 ?auto_1712396 ) ) ( not ( = ?auto_1712395 ?auto_1712397 ) ) ( not ( = ?auto_1712395 ?auto_1712394 ) ) ( not ( = ?auto_1712395 ?auto_1712398 ) ) ( not ( = ?auto_1712395 ?auto_1712400 ) ) ( not ( = ?auto_1712395 ?auto_1712399 ) ) ( not ( = ?auto_1712395 ?auto_1712401 ) ) ( not ( = ?auto_1712395 ?auto_1712402 ) ) ( not ( = ?auto_1712395 ?auto_1712403 ) ) ( not ( = ?auto_1712396 ?auto_1712397 ) ) ( not ( = ?auto_1712396 ?auto_1712394 ) ) ( not ( = ?auto_1712396 ?auto_1712398 ) ) ( not ( = ?auto_1712396 ?auto_1712400 ) ) ( not ( = ?auto_1712396 ?auto_1712399 ) ) ( not ( = ?auto_1712396 ?auto_1712401 ) ) ( not ( = ?auto_1712396 ?auto_1712402 ) ) ( not ( = ?auto_1712396 ?auto_1712403 ) ) ( not ( = ?auto_1712397 ?auto_1712394 ) ) ( not ( = ?auto_1712397 ?auto_1712398 ) ) ( not ( = ?auto_1712397 ?auto_1712400 ) ) ( not ( = ?auto_1712397 ?auto_1712399 ) ) ( not ( = ?auto_1712397 ?auto_1712401 ) ) ( not ( = ?auto_1712397 ?auto_1712402 ) ) ( not ( = ?auto_1712397 ?auto_1712403 ) ) ( not ( = ?auto_1712394 ?auto_1712398 ) ) ( not ( = ?auto_1712394 ?auto_1712400 ) ) ( not ( = ?auto_1712394 ?auto_1712399 ) ) ( not ( = ?auto_1712394 ?auto_1712401 ) ) ( not ( = ?auto_1712394 ?auto_1712402 ) ) ( not ( = ?auto_1712394 ?auto_1712403 ) ) ( not ( = ?auto_1712398 ?auto_1712400 ) ) ( not ( = ?auto_1712398 ?auto_1712399 ) ) ( not ( = ?auto_1712398 ?auto_1712401 ) ) ( not ( = ?auto_1712398 ?auto_1712402 ) ) ( not ( = ?auto_1712398 ?auto_1712403 ) ) ( not ( = ?auto_1712400 ?auto_1712399 ) ) ( not ( = ?auto_1712400 ?auto_1712401 ) ) ( not ( = ?auto_1712400 ?auto_1712402 ) ) ( not ( = ?auto_1712400 ?auto_1712403 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1712399 ?auto_1712401 ?auto_1712402 )
      ( MAKE-8CRATE-VERIFY ?auto_1712395 ?auto_1712396 ?auto_1712397 ?auto_1712394 ?auto_1712398 ?auto_1712400 ?auto_1712399 ?auto_1712401 ?auto_1712402 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1716498 - SURFACE
      ?auto_1716499 - SURFACE
      ?auto_1716500 - SURFACE
      ?auto_1716497 - SURFACE
      ?auto_1716501 - SURFACE
      ?auto_1716503 - SURFACE
      ?auto_1716502 - SURFACE
      ?auto_1716504 - SURFACE
      ?auto_1716505 - SURFACE
      ?auto_1716506 - SURFACE
    )
    :vars
    (
      ?auto_1716508 - HOIST
      ?auto_1716507 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1716508 ?auto_1716507 ) ( SURFACE-AT ?auto_1716505 ?auto_1716507 ) ( CLEAR ?auto_1716505 ) ( LIFTING ?auto_1716508 ?auto_1716506 ) ( IS-CRATE ?auto_1716506 ) ( not ( = ?auto_1716505 ?auto_1716506 ) ) ( ON ?auto_1716499 ?auto_1716498 ) ( ON ?auto_1716500 ?auto_1716499 ) ( ON ?auto_1716497 ?auto_1716500 ) ( ON ?auto_1716501 ?auto_1716497 ) ( ON ?auto_1716503 ?auto_1716501 ) ( ON ?auto_1716502 ?auto_1716503 ) ( ON ?auto_1716504 ?auto_1716502 ) ( ON ?auto_1716505 ?auto_1716504 ) ( not ( = ?auto_1716498 ?auto_1716499 ) ) ( not ( = ?auto_1716498 ?auto_1716500 ) ) ( not ( = ?auto_1716498 ?auto_1716497 ) ) ( not ( = ?auto_1716498 ?auto_1716501 ) ) ( not ( = ?auto_1716498 ?auto_1716503 ) ) ( not ( = ?auto_1716498 ?auto_1716502 ) ) ( not ( = ?auto_1716498 ?auto_1716504 ) ) ( not ( = ?auto_1716498 ?auto_1716505 ) ) ( not ( = ?auto_1716498 ?auto_1716506 ) ) ( not ( = ?auto_1716499 ?auto_1716500 ) ) ( not ( = ?auto_1716499 ?auto_1716497 ) ) ( not ( = ?auto_1716499 ?auto_1716501 ) ) ( not ( = ?auto_1716499 ?auto_1716503 ) ) ( not ( = ?auto_1716499 ?auto_1716502 ) ) ( not ( = ?auto_1716499 ?auto_1716504 ) ) ( not ( = ?auto_1716499 ?auto_1716505 ) ) ( not ( = ?auto_1716499 ?auto_1716506 ) ) ( not ( = ?auto_1716500 ?auto_1716497 ) ) ( not ( = ?auto_1716500 ?auto_1716501 ) ) ( not ( = ?auto_1716500 ?auto_1716503 ) ) ( not ( = ?auto_1716500 ?auto_1716502 ) ) ( not ( = ?auto_1716500 ?auto_1716504 ) ) ( not ( = ?auto_1716500 ?auto_1716505 ) ) ( not ( = ?auto_1716500 ?auto_1716506 ) ) ( not ( = ?auto_1716497 ?auto_1716501 ) ) ( not ( = ?auto_1716497 ?auto_1716503 ) ) ( not ( = ?auto_1716497 ?auto_1716502 ) ) ( not ( = ?auto_1716497 ?auto_1716504 ) ) ( not ( = ?auto_1716497 ?auto_1716505 ) ) ( not ( = ?auto_1716497 ?auto_1716506 ) ) ( not ( = ?auto_1716501 ?auto_1716503 ) ) ( not ( = ?auto_1716501 ?auto_1716502 ) ) ( not ( = ?auto_1716501 ?auto_1716504 ) ) ( not ( = ?auto_1716501 ?auto_1716505 ) ) ( not ( = ?auto_1716501 ?auto_1716506 ) ) ( not ( = ?auto_1716503 ?auto_1716502 ) ) ( not ( = ?auto_1716503 ?auto_1716504 ) ) ( not ( = ?auto_1716503 ?auto_1716505 ) ) ( not ( = ?auto_1716503 ?auto_1716506 ) ) ( not ( = ?auto_1716502 ?auto_1716504 ) ) ( not ( = ?auto_1716502 ?auto_1716505 ) ) ( not ( = ?auto_1716502 ?auto_1716506 ) ) ( not ( = ?auto_1716504 ?auto_1716505 ) ) ( not ( = ?auto_1716504 ?auto_1716506 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1716505 ?auto_1716506 )
      ( MAKE-9CRATE-VERIFY ?auto_1716498 ?auto_1716499 ?auto_1716500 ?auto_1716497 ?auto_1716501 ?auto_1716503 ?auto_1716502 ?auto_1716504 ?auto_1716505 ?auto_1716506 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1716578 - SURFACE
      ?auto_1716579 - SURFACE
      ?auto_1716580 - SURFACE
      ?auto_1716577 - SURFACE
      ?auto_1716581 - SURFACE
      ?auto_1716583 - SURFACE
      ?auto_1716582 - SURFACE
      ?auto_1716584 - SURFACE
      ?auto_1716585 - SURFACE
      ?auto_1716586 - SURFACE
    )
    :vars
    (
      ?auto_1716587 - HOIST
      ?auto_1716588 - PLACE
      ?auto_1716589 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1716587 ?auto_1716588 ) ( SURFACE-AT ?auto_1716585 ?auto_1716588 ) ( CLEAR ?auto_1716585 ) ( IS-CRATE ?auto_1716586 ) ( not ( = ?auto_1716585 ?auto_1716586 ) ) ( TRUCK-AT ?auto_1716589 ?auto_1716588 ) ( AVAILABLE ?auto_1716587 ) ( IN ?auto_1716586 ?auto_1716589 ) ( ON ?auto_1716585 ?auto_1716584 ) ( not ( = ?auto_1716584 ?auto_1716585 ) ) ( not ( = ?auto_1716584 ?auto_1716586 ) ) ( ON ?auto_1716579 ?auto_1716578 ) ( ON ?auto_1716580 ?auto_1716579 ) ( ON ?auto_1716577 ?auto_1716580 ) ( ON ?auto_1716581 ?auto_1716577 ) ( ON ?auto_1716583 ?auto_1716581 ) ( ON ?auto_1716582 ?auto_1716583 ) ( ON ?auto_1716584 ?auto_1716582 ) ( not ( = ?auto_1716578 ?auto_1716579 ) ) ( not ( = ?auto_1716578 ?auto_1716580 ) ) ( not ( = ?auto_1716578 ?auto_1716577 ) ) ( not ( = ?auto_1716578 ?auto_1716581 ) ) ( not ( = ?auto_1716578 ?auto_1716583 ) ) ( not ( = ?auto_1716578 ?auto_1716582 ) ) ( not ( = ?auto_1716578 ?auto_1716584 ) ) ( not ( = ?auto_1716578 ?auto_1716585 ) ) ( not ( = ?auto_1716578 ?auto_1716586 ) ) ( not ( = ?auto_1716579 ?auto_1716580 ) ) ( not ( = ?auto_1716579 ?auto_1716577 ) ) ( not ( = ?auto_1716579 ?auto_1716581 ) ) ( not ( = ?auto_1716579 ?auto_1716583 ) ) ( not ( = ?auto_1716579 ?auto_1716582 ) ) ( not ( = ?auto_1716579 ?auto_1716584 ) ) ( not ( = ?auto_1716579 ?auto_1716585 ) ) ( not ( = ?auto_1716579 ?auto_1716586 ) ) ( not ( = ?auto_1716580 ?auto_1716577 ) ) ( not ( = ?auto_1716580 ?auto_1716581 ) ) ( not ( = ?auto_1716580 ?auto_1716583 ) ) ( not ( = ?auto_1716580 ?auto_1716582 ) ) ( not ( = ?auto_1716580 ?auto_1716584 ) ) ( not ( = ?auto_1716580 ?auto_1716585 ) ) ( not ( = ?auto_1716580 ?auto_1716586 ) ) ( not ( = ?auto_1716577 ?auto_1716581 ) ) ( not ( = ?auto_1716577 ?auto_1716583 ) ) ( not ( = ?auto_1716577 ?auto_1716582 ) ) ( not ( = ?auto_1716577 ?auto_1716584 ) ) ( not ( = ?auto_1716577 ?auto_1716585 ) ) ( not ( = ?auto_1716577 ?auto_1716586 ) ) ( not ( = ?auto_1716581 ?auto_1716583 ) ) ( not ( = ?auto_1716581 ?auto_1716582 ) ) ( not ( = ?auto_1716581 ?auto_1716584 ) ) ( not ( = ?auto_1716581 ?auto_1716585 ) ) ( not ( = ?auto_1716581 ?auto_1716586 ) ) ( not ( = ?auto_1716583 ?auto_1716582 ) ) ( not ( = ?auto_1716583 ?auto_1716584 ) ) ( not ( = ?auto_1716583 ?auto_1716585 ) ) ( not ( = ?auto_1716583 ?auto_1716586 ) ) ( not ( = ?auto_1716582 ?auto_1716584 ) ) ( not ( = ?auto_1716582 ?auto_1716585 ) ) ( not ( = ?auto_1716582 ?auto_1716586 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1716584 ?auto_1716585 ?auto_1716586 )
      ( MAKE-9CRATE-VERIFY ?auto_1716578 ?auto_1716579 ?auto_1716580 ?auto_1716577 ?auto_1716581 ?auto_1716583 ?auto_1716582 ?auto_1716584 ?auto_1716585 ?auto_1716586 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1716668 - SURFACE
      ?auto_1716669 - SURFACE
      ?auto_1716670 - SURFACE
      ?auto_1716667 - SURFACE
      ?auto_1716671 - SURFACE
      ?auto_1716673 - SURFACE
      ?auto_1716672 - SURFACE
      ?auto_1716674 - SURFACE
      ?auto_1716675 - SURFACE
      ?auto_1716676 - SURFACE
    )
    :vars
    (
      ?auto_1716678 - HOIST
      ?auto_1716679 - PLACE
      ?auto_1716680 - TRUCK
      ?auto_1716677 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1716678 ?auto_1716679 ) ( SURFACE-AT ?auto_1716675 ?auto_1716679 ) ( CLEAR ?auto_1716675 ) ( IS-CRATE ?auto_1716676 ) ( not ( = ?auto_1716675 ?auto_1716676 ) ) ( AVAILABLE ?auto_1716678 ) ( IN ?auto_1716676 ?auto_1716680 ) ( ON ?auto_1716675 ?auto_1716674 ) ( not ( = ?auto_1716674 ?auto_1716675 ) ) ( not ( = ?auto_1716674 ?auto_1716676 ) ) ( TRUCK-AT ?auto_1716680 ?auto_1716677 ) ( not ( = ?auto_1716677 ?auto_1716679 ) ) ( ON ?auto_1716669 ?auto_1716668 ) ( ON ?auto_1716670 ?auto_1716669 ) ( ON ?auto_1716667 ?auto_1716670 ) ( ON ?auto_1716671 ?auto_1716667 ) ( ON ?auto_1716673 ?auto_1716671 ) ( ON ?auto_1716672 ?auto_1716673 ) ( ON ?auto_1716674 ?auto_1716672 ) ( not ( = ?auto_1716668 ?auto_1716669 ) ) ( not ( = ?auto_1716668 ?auto_1716670 ) ) ( not ( = ?auto_1716668 ?auto_1716667 ) ) ( not ( = ?auto_1716668 ?auto_1716671 ) ) ( not ( = ?auto_1716668 ?auto_1716673 ) ) ( not ( = ?auto_1716668 ?auto_1716672 ) ) ( not ( = ?auto_1716668 ?auto_1716674 ) ) ( not ( = ?auto_1716668 ?auto_1716675 ) ) ( not ( = ?auto_1716668 ?auto_1716676 ) ) ( not ( = ?auto_1716669 ?auto_1716670 ) ) ( not ( = ?auto_1716669 ?auto_1716667 ) ) ( not ( = ?auto_1716669 ?auto_1716671 ) ) ( not ( = ?auto_1716669 ?auto_1716673 ) ) ( not ( = ?auto_1716669 ?auto_1716672 ) ) ( not ( = ?auto_1716669 ?auto_1716674 ) ) ( not ( = ?auto_1716669 ?auto_1716675 ) ) ( not ( = ?auto_1716669 ?auto_1716676 ) ) ( not ( = ?auto_1716670 ?auto_1716667 ) ) ( not ( = ?auto_1716670 ?auto_1716671 ) ) ( not ( = ?auto_1716670 ?auto_1716673 ) ) ( not ( = ?auto_1716670 ?auto_1716672 ) ) ( not ( = ?auto_1716670 ?auto_1716674 ) ) ( not ( = ?auto_1716670 ?auto_1716675 ) ) ( not ( = ?auto_1716670 ?auto_1716676 ) ) ( not ( = ?auto_1716667 ?auto_1716671 ) ) ( not ( = ?auto_1716667 ?auto_1716673 ) ) ( not ( = ?auto_1716667 ?auto_1716672 ) ) ( not ( = ?auto_1716667 ?auto_1716674 ) ) ( not ( = ?auto_1716667 ?auto_1716675 ) ) ( not ( = ?auto_1716667 ?auto_1716676 ) ) ( not ( = ?auto_1716671 ?auto_1716673 ) ) ( not ( = ?auto_1716671 ?auto_1716672 ) ) ( not ( = ?auto_1716671 ?auto_1716674 ) ) ( not ( = ?auto_1716671 ?auto_1716675 ) ) ( not ( = ?auto_1716671 ?auto_1716676 ) ) ( not ( = ?auto_1716673 ?auto_1716672 ) ) ( not ( = ?auto_1716673 ?auto_1716674 ) ) ( not ( = ?auto_1716673 ?auto_1716675 ) ) ( not ( = ?auto_1716673 ?auto_1716676 ) ) ( not ( = ?auto_1716672 ?auto_1716674 ) ) ( not ( = ?auto_1716672 ?auto_1716675 ) ) ( not ( = ?auto_1716672 ?auto_1716676 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1716674 ?auto_1716675 ?auto_1716676 )
      ( MAKE-9CRATE-VERIFY ?auto_1716668 ?auto_1716669 ?auto_1716670 ?auto_1716667 ?auto_1716671 ?auto_1716673 ?auto_1716672 ?auto_1716674 ?auto_1716675 ?auto_1716676 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1716767 - SURFACE
      ?auto_1716768 - SURFACE
      ?auto_1716769 - SURFACE
      ?auto_1716766 - SURFACE
      ?auto_1716770 - SURFACE
      ?auto_1716772 - SURFACE
      ?auto_1716771 - SURFACE
      ?auto_1716773 - SURFACE
      ?auto_1716774 - SURFACE
      ?auto_1716775 - SURFACE
    )
    :vars
    (
      ?auto_1716778 - HOIST
      ?auto_1716777 - PLACE
      ?auto_1716780 - TRUCK
      ?auto_1716776 - PLACE
      ?auto_1716779 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1716778 ?auto_1716777 ) ( SURFACE-AT ?auto_1716774 ?auto_1716777 ) ( CLEAR ?auto_1716774 ) ( IS-CRATE ?auto_1716775 ) ( not ( = ?auto_1716774 ?auto_1716775 ) ) ( AVAILABLE ?auto_1716778 ) ( ON ?auto_1716774 ?auto_1716773 ) ( not ( = ?auto_1716773 ?auto_1716774 ) ) ( not ( = ?auto_1716773 ?auto_1716775 ) ) ( TRUCK-AT ?auto_1716780 ?auto_1716776 ) ( not ( = ?auto_1716776 ?auto_1716777 ) ) ( HOIST-AT ?auto_1716779 ?auto_1716776 ) ( LIFTING ?auto_1716779 ?auto_1716775 ) ( not ( = ?auto_1716778 ?auto_1716779 ) ) ( ON ?auto_1716768 ?auto_1716767 ) ( ON ?auto_1716769 ?auto_1716768 ) ( ON ?auto_1716766 ?auto_1716769 ) ( ON ?auto_1716770 ?auto_1716766 ) ( ON ?auto_1716772 ?auto_1716770 ) ( ON ?auto_1716771 ?auto_1716772 ) ( ON ?auto_1716773 ?auto_1716771 ) ( not ( = ?auto_1716767 ?auto_1716768 ) ) ( not ( = ?auto_1716767 ?auto_1716769 ) ) ( not ( = ?auto_1716767 ?auto_1716766 ) ) ( not ( = ?auto_1716767 ?auto_1716770 ) ) ( not ( = ?auto_1716767 ?auto_1716772 ) ) ( not ( = ?auto_1716767 ?auto_1716771 ) ) ( not ( = ?auto_1716767 ?auto_1716773 ) ) ( not ( = ?auto_1716767 ?auto_1716774 ) ) ( not ( = ?auto_1716767 ?auto_1716775 ) ) ( not ( = ?auto_1716768 ?auto_1716769 ) ) ( not ( = ?auto_1716768 ?auto_1716766 ) ) ( not ( = ?auto_1716768 ?auto_1716770 ) ) ( not ( = ?auto_1716768 ?auto_1716772 ) ) ( not ( = ?auto_1716768 ?auto_1716771 ) ) ( not ( = ?auto_1716768 ?auto_1716773 ) ) ( not ( = ?auto_1716768 ?auto_1716774 ) ) ( not ( = ?auto_1716768 ?auto_1716775 ) ) ( not ( = ?auto_1716769 ?auto_1716766 ) ) ( not ( = ?auto_1716769 ?auto_1716770 ) ) ( not ( = ?auto_1716769 ?auto_1716772 ) ) ( not ( = ?auto_1716769 ?auto_1716771 ) ) ( not ( = ?auto_1716769 ?auto_1716773 ) ) ( not ( = ?auto_1716769 ?auto_1716774 ) ) ( not ( = ?auto_1716769 ?auto_1716775 ) ) ( not ( = ?auto_1716766 ?auto_1716770 ) ) ( not ( = ?auto_1716766 ?auto_1716772 ) ) ( not ( = ?auto_1716766 ?auto_1716771 ) ) ( not ( = ?auto_1716766 ?auto_1716773 ) ) ( not ( = ?auto_1716766 ?auto_1716774 ) ) ( not ( = ?auto_1716766 ?auto_1716775 ) ) ( not ( = ?auto_1716770 ?auto_1716772 ) ) ( not ( = ?auto_1716770 ?auto_1716771 ) ) ( not ( = ?auto_1716770 ?auto_1716773 ) ) ( not ( = ?auto_1716770 ?auto_1716774 ) ) ( not ( = ?auto_1716770 ?auto_1716775 ) ) ( not ( = ?auto_1716772 ?auto_1716771 ) ) ( not ( = ?auto_1716772 ?auto_1716773 ) ) ( not ( = ?auto_1716772 ?auto_1716774 ) ) ( not ( = ?auto_1716772 ?auto_1716775 ) ) ( not ( = ?auto_1716771 ?auto_1716773 ) ) ( not ( = ?auto_1716771 ?auto_1716774 ) ) ( not ( = ?auto_1716771 ?auto_1716775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1716773 ?auto_1716774 ?auto_1716775 )
      ( MAKE-9CRATE-VERIFY ?auto_1716767 ?auto_1716768 ?auto_1716769 ?auto_1716766 ?auto_1716770 ?auto_1716772 ?auto_1716771 ?auto_1716773 ?auto_1716774 ?auto_1716775 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1716875 - SURFACE
      ?auto_1716876 - SURFACE
      ?auto_1716877 - SURFACE
      ?auto_1716874 - SURFACE
      ?auto_1716878 - SURFACE
      ?auto_1716880 - SURFACE
      ?auto_1716879 - SURFACE
      ?auto_1716881 - SURFACE
      ?auto_1716882 - SURFACE
      ?auto_1716883 - SURFACE
    )
    :vars
    (
      ?auto_1716889 - HOIST
      ?auto_1716887 - PLACE
      ?auto_1716885 - TRUCK
      ?auto_1716884 - PLACE
      ?auto_1716886 - HOIST
      ?auto_1716888 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1716889 ?auto_1716887 ) ( SURFACE-AT ?auto_1716882 ?auto_1716887 ) ( CLEAR ?auto_1716882 ) ( IS-CRATE ?auto_1716883 ) ( not ( = ?auto_1716882 ?auto_1716883 ) ) ( AVAILABLE ?auto_1716889 ) ( ON ?auto_1716882 ?auto_1716881 ) ( not ( = ?auto_1716881 ?auto_1716882 ) ) ( not ( = ?auto_1716881 ?auto_1716883 ) ) ( TRUCK-AT ?auto_1716885 ?auto_1716884 ) ( not ( = ?auto_1716884 ?auto_1716887 ) ) ( HOIST-AT ?auto_1716886 ?auto_1716884 ) ( not ( = ?auto_1716889 ?auto_1716886 ) ) ( AVAILABLE ?auto_1716886 ) ( SURFACE-AT ?auto_1716883 ?auto_1716884 ) ( ON ?auto_1716883 ?auto_1716888 ) ( CLEAR ?auto_1716883 ) ( not ( = ?auto_1716882 ?auto_1716888 ) ) ( not ( = ?auto_1716883 ?auto_1716888 ) ) ( not ( = ?auto_1716881 ?auto_1716888 ) ) ( ON ?auto_1716876 ?auto_1716875 ) ( ON ?auto_1716877 ?auto_1716876 ) ( ON ?auto_1716874 ?auto_1716877 ) ( ON ?auto_1716878 ?auto_1716874 ) ( ON ?auto_1716880 ?auto_1716878 ) ( ON ?auto_1716879 ?auto_1716880 ) ( ON ?auto_1716881 ?auto_1716879 ) ( not ( = ?auto_1716875 ?auto_1716876 ) ) ( not ( = ?auto_1716875 ?auto_1716877 ) ) ( not ( = ?auto_1716875 ?auto_1716874 ) ) ( not ( = ?auto_1716875 ?auto_1716878 ) ) ( not ( = ?auto_1716875 ?auto_1716880 ) ) ( not ( = ?auto_1716875 ?auto_1716879 ) ) ( not ( = ?auto_1716875 ?auto_1716881 ) ) ( not ( = ?auto_1716875 ?auto_1716882 ) ) ( not ( = ?auto_1716875 ?auto_1716883 ) ) ( not ( = ?auto_1716875 ?auto_1716888 ) ) ( not ( = ?auto_1716876 ?auto_1716877 ) ) ( not ( = ?auto_1716876 ?auto_1716874 ) ) ( not ( = ?auto_1716876 ?auto_1716878 ) ) ( not ( = ?auto_1716876 ?auto_1716880 ) ) ( not ( = ?auto_1716876 ?auto_1716879 ) ) ( not ( = ?auto_1716876 ?auto_1716881 ) ) ( not ( = ?auto_1716876 ?auto_1716882 ) ) ( not ( = ?auto_1716876 ?auto_1716883 ) ) ( not ( = ?auto_1716876 ?auto_1716888 ) ) ( not ( = ?auto_1716877 ?auto_1716874 ) ) ( not ( = ?auto_1716877 ?auto_1716878 ) ) ( not ( = ?auto_1716877 ?auto_1716880 ) ) ( not ( = ?auto_1716877 ?auto_1716879 ) ) ( not ( = ?auto_1716877 ?auto_1716881 ) ) ( not ( = ?auto_1716877 ?auto_1716882 ) ) ( not ( = ?auto_1716877 ?auto_1716883 ) ) ( not ( = ?auto_1716877 ?auto_1716888 ) ) ( not ( = ?auto_1716874 ?auto_1716878 ) ) ( not ( = ?auto_1716874 ?auto_1716880 ) ) ( not ( = ?auto_1716874 ?auto_1716879 ) ) ( not ( = ?auto_1716874 ?auto_1716881 ) ) ( not ( = ?auto_1716874 ?auto_1716882 ) ) ( not ( = ?auto_1716874 ?auto_1716883 ) ) ( not ( = ?auto_1716874 ?auto_1716888 ) ) ( not ( = ?auto_1716878 ?auto_1716880 ) ) ( not ( = ?auto_1716878 ?auto_1716879 ) ) ( not ( = ?auto_1716878 ?auto_1716881 ) ) ( not ( = ?auto_1716878 ?auto_1716882 ) ) ( not ( = ?auto_1716878 ?auto_1716883 ) ) ( not ( = ?auto_1716878 ?auto_1716888 ) ) ( not ( = ?auto_1716880 ?auto_1716879 ) ) ( not ( = ?auto_1716880 ?auto_1716881 ) ) ( not ( = ?auto_1716880 ?auto_1716882 ) ) ( not ( = ?auto_1716880 ?auto_1716883 ) ) ( not ( = ?auto_1716880 ?auto_1716888 ) ) ( not ( = ?auto_1716879 ?auto_1716881 ) ) ( not ( = ?auto_1716879 ?auto_1716882 ) ) ( not ( = ?auto_1716879 ?auto_1716883 ) ) ( not ( = ?auto_1716879 ?auto_1716888 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1716881 ?auto_1716882 ?auto_1716883 )
      ( MAKE-9CRATE-VERIFY ?auto_1716875 ?auto_1716876 ?auto_1716877 ?auto_1716874 ?auto_1716878 ?auto_1716880 ?auto_1716879 ?auto_1716881 ?auto_1716882 ?auto_1716883 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1716984 - SURFACE
      ?auto_1716985 - SURFACE
      ?auto_1716986 - SURFACE
      ?auto_1716983 - SURFACE
      ?auto_1716987 - SURFACE
      ?auto_1716989 - SURFACE
      ?auto_1716988 - SURFACE
      ?auto_1716990 - SURFACE
      ?auto_1716991 - SURFACE
      ?auto_1716992 - SURFACE
    )
    :vars
    (
      ?auto_1716994 - HOIST
      ?auto_1716995 - PLACE
      ?auto_1716996 - PLACE
      ?auto_1716998 - HOIST
      ?auto_1716997 - SURFACE
      ?auto_1716993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1716994 ?auto_1716995 ) ( SURFACE-AT ?auto_1716991 ?auto_1716995 ) ( CLEAR ?auto_1716991 ) ( IS-CRATE ?auto_1716992 ) ( not ( = ?auto_1716991 ?auto_1716992 ) ) ( AVAILABLE ?auto_1716994 ) ( ON ?auto_1716991 ?auto_1716990 ) ( not ( = ?auto_1716990 ?auto_1716991 ) ) ( not ( = ?auto_1716990 ?auto_1716992 ) ) ( not ( = ?auto_1716996 ?auto_1716995 ) ) ( HOIST-AT ?auto_1716998 ?auto_1716996 ) ( not ( = ?auto_1716994 ?auto_1716998 ) ) ( AVAILABLE ?auto_1716998 ) ( SURFACE-AT ?auto_1716992 ?auto_1716996 ) ( ON ?auto_1716992 ?auto_1716997 ) ( CLEAR ?auto_1716992 ) ( not ( = ?auto_1716991 ?auto_1716997 ) ) ( not ( = ?auto_1716992 ?auto_1716997 ) ) ( not ( = ?auto_1716990 ?auto_1716997 ) ) ( TRUCK-AT ?auto_1716993 ?auto_1716995 ) ( ON ?auto_1716985 ?auto_1716984 ) ( ON ?auto_1716986 ?auto_1716985 ) ( ON ?auto_1716983 ?auto_1716986 ) ( ON ?auto_1716987 ?auto_1716983 ) ( ON ?auto_1716989 ?auto_1716987 ) ( ON ?auto_1716988 ?auto_1716989 ) ( ON ?auto_1716990 ?auto_1716988 ) ( not ( = ?auto_1716984 ?auto_1716985 ) ) ( not ( = ?auto_1716984 ?auto_1716986 ) ) ( not ( = ?auto_1716984 ?auto_1716983 ) ) ( not ( = ?auto_1716984 ?auto_1716987 ) ) ( not ( = ?auto_1716984 ?auto_1716989 ) ) ( not ( = ?auto_1716984 ?auto_1716988 ) ) ( not ( = ?auto_1716984 ?auto_1716990 ) ) ( not ( = ?auto_1716984 ?auto_1716991 ) ) ( not ( = ?auto_1716984 ?auto_1716992 ) ) ( not ( = ?auto_1716984 ?auto_1716997 ) ) ( not ( = ?auto_1716985 ?auto_1716986 ) ) ( not ( = ?auto_1716985 ?auto_1716983 ) ) ( not ( = ?auto_1716985 ?auto_1716987 ) ) ( not ( = ?auto_1716985 ?auto_1716989 ) ) ( not ( = ?auto_1716985 ?auto_1716988 ) ) ( not ( = ?auto_1716985 ?auto_1716990 ) ) ( not ( = ?auto_1716985 ?auto_1716991 ) ) ( not ( = ?auto_1716985 ?auto_1716992 ) ) ( not ( = ?auto_1716985 ?auto_1716997 ) ) ( not ( = ?auto_1716986 ?auto_1716983 ) ) ( not ( = ?auto_1716986 ?auto_1716987 ) ) ( not ( = ?auto_1716986 ?auto_1716989 ) ) ( not ( = ?auto_1716986 ?auto_1716988 ) ) ( not ( = ?auto_1716986 ?auto_1716990 ) ) ( not ( = ?auto_1716986 ?auto_1716991 ) ) ( not ( = ?auto_1716986 ?auto_1716992 ) ) ( not ( = ?auto_1716986 ?auto_1716997 ) ) ( not ( = ?auto_1716983 ?auto_1716987 ) ) ( not ( = ?auto_1716983 ?auto_1716989 ) ) ( not ( = ?auto_1716983 ?auto_1716988 ) ) ( not ( = ?auto_1716983 ?auto_1716990 ) ) ( not ( = ?auto_1716983 ?auto_1716991 ) ) ( not ( = ?auto_1716983 ?auto_1716992 ) ) ( not ( = ?auto_1716983 ?auto_1716997 ) ) ( not ( = ?auto_1716987 ?auto_1716989 ) ) ( not ( = ?auto_1716987 ?auto_1716988 ) ) ( not ( = ?auto_1716987 ?auto_1716990 ) ) ( not ( = ?auto_1716987 ?auto_1716991 ) ) ( not ( = ?auto_1716987 ?auto_1716992 ) ) ( not ( = ?auto_1716987 ?auto_1716997 ) ) ( not ( = ?auto_1716989 ?auto_1716988 ) ) ( not ( = ?auto_1716989 ?auto_1716990 ) ) ( not ( = ?auto_1716989 ?auto_1716991 ) ) ( not ( = ?auto_1716989 ?auto_1716992 ) ) ( not ( = ?auto_1716989 ?auto_1716997 ) ) ( not ( = ?auto_1716988 ?auto_1716990 ) ) ( not ( = ?auto_1716988 ?auto_1716991 ) ) ( not ( = ?auto_1716988 ?auto_1716992 ) ) ( not ( = ?auto_1716988 ?auto_1716997 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1716990 ?auto_1716991 ?auto_1716992 )
      ( MAKE-9CRATE-VERIFY ?auto_1716984 ?auto_1716985 ?auto_1716986 ?auto_1716983 ?auto_1716987 ?auto_1716989 ?auto_1716988 ?auto_1716990 ?auto_1716991 ?auto_1716992 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1717093 - SURFACE
      ?auto_1717094 - SURFACE
      ?auto_1717095 - SURFACE
      ?auto_1717092 - SURFACE
      ?auto_1717096 - SURFACE
      ?auto_1717098 - SURFACE
      ?auto_1717097 - SURFACE
      ?auto_1717099 - SURFACE
      ?auto_1717100 - SURFACE
      ?auto_1717101 - SURFACE
    )
    :vars
    (
      ?auto_1717105 - HOIST
      ?auto_1717103 - PLACE
      ?auto_1717102 - PLACE
      ?auto_1717106 - HOIST
      ?auto_1717107 - SURFACE
      ?auto_1717104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1717105 ?auto_1717103 ) ( IS-CRATE ?auto_1717101 ) ( not ( = ?auto_1717100 ?auto_1717101 ) ) ( not ( = ?auto_1717099 ?auto_1717100 ) ) ( not ( = ?auto_1717099 ?auto_1717101 ) ) ( not ( = ?auto_1717102 ?auto_1717103 ) ) ( HOIST-AT ?auto_1717106 ?auto_1717102 ) ( not ( = ?auto_1717105 ?auto_1717106 ) ) ( AVAILABLE ?auto_1717106 ) ( SURFACE-AT ?auto_1717101 ?auto_1717102 ) ( ON ?auto_1717101 ?auto_1717107 ) ( CLEAR ?auto_1717101 ) ( not ( = ?auto_1717100 ?auto_1717107 ) ) ( not ( = ?auto_1717101 ?auto_1717107 ) ) ( not ( = ?auto_1717099 ?auto_1717107 ) ) ( TRUCK-AT ?auto_1717104 ?auto_1717103 ) ( SURFACE-AT ?auto_1717099 ?auto_1717103 ) ( CLEAR ?auto_1717099 ) ( LIFTING ?auto_1717105 ?auto_1717100 ) ( IS-CRATE ?auto_1717100 ) ( ON ?auto_1717094 ?auto_1717093 ) ( ON ?auto_1717095 ?auto_1717094 ) ( ON ?auto_1717092 ?auto_1717095 ) ( ON ?auto_1717096 ?auto_1717092 ) ( ON ?auto_1717098 ?auto_1717096 ) ( ON ?auto_1717097 ?auto_1717098 ) ( ON ?auto_1717099 ?auto_1717097 ) ( not ( = ?auto_1717093 ?auto_1717094 ) ) ( not ( = ?auto_1717093 ?auto_1717095 ) ) ( not ( = ?auto_1717093 ?auto_1717092 ) ) ( not ( = ?auto_1717093 ?auto_1717096 ) ) ( not ( = ?auto_1717093 ?auto_1717098 ) ) ( not ( = ?auto_1717093 ?auto_1717097 ) ) ( not ( = ?auto_1717093 ?auto_1717099 ) ) ( not ( = ?auto_1717093 ?auto_1717100 ) ) ( not ( = ?auto_1717093 ?auto_1717101 ) ) ( not ( = ?auto_1717093 ?auto_1717107 ) ) ( not ( = ?auto_1717094 ?auto_1717095 ) ) ( not ( = ?auto_1717094 ?auto_1717092 ) ) ( not ( = ?auto_1717094 ?auto_1717096 ) ) ( not ( = ?auto_1717094 ?auto_1717098 ) ) ( not ( = ?auto_1717094 ?auto_1717097 ) ) ( not ( = ?auto_1717094 ?auto_1717099 ) ) ( not ( = ?auto_1717094 ?auto_1717100 ) ) ( not ( = ?auto_1717094 ?auto_1717101 ) ) ( not ( = ?auto_1717094 ?auto_1717107 ) ) ( not ( = ?auto_1717095 ?auto_1717092 ) ) ( not ( = ?auto_1717095 ?auto_1717096 ) ) ( not ( = ?auto_1717095 ?auto_1717098 ) ) ( not ( = ?auto_1717095 ?auto_1717097 ) ) ( not ( = ?auto_1717095 ?auto_1717099 ) ) ( not ( = ?auto_1717095 ?auto_1717100 ) ) ( not ( = ?auto_1717095 ?auto_1717101 ) ) ( not ( = ?auto_1717095 ?auto_1717107 ) ) ( not ( = ?auto_1717092 ?auto_1717096 ) ) ( not ( = ?auto_1717092 ?auto_1717098 ) ) ( not ( = ?auto_1717092 ?auto_1717097 ) ) ( not ( = ?auto_1717092 ?auto_1717099 ) ) ( not ( = ?auto_1717092 ?auto_1717100 ) ) ( not ( = ?auto_1717092 ?auto_1717101 ) ) ( not ( = ?auto_1717092 ?auto_1717107 ) ) ( not ( = ?auto_1717096 ?auto_1717098 ) ) ( not ( = ?auto_1717096 ?auto_1717097 ) ) ( not ( = ?auto_1717096 ?auto_1717099 ) ) ( not ( = ?auto_1717096 ?auto_1717100 ) ) ( not ( = ?auto_1717096 ?auto_1717101 ) ) ( not ( = ?auto_1717096 ?auto_1717107 ) ) ( not ( = ?auto_1717098 ?auto_1717097 ) ) ( not ( = ?auto_1717098 ?auto_1717099 ) ) ( not ( = ?auto_1717098 ?auto_1717100 ) ) ( not ( = ?auto_1717098 ?auto_1717101 ) ) ( not ( = ?auto_1717098 ?auto_1717107 ) ) ( not ( = ?auto_1717097 ?auto_1717099 ) ) ( not ( = ?auto_1717097 ?auto_1717100 ) ) ( not ( = ?auto_1717097 ?auto_1717101 ) ) ( not ( = ?auto_1717097 ?auto_1717107 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1717099 ?auto_1717100 ?auto_1717101 )
      ( MAKE-9CRATE-VERIFY ?auto_1717093 ?auto_1717094 ?auto_1717095 ?auto_1717092 ?auto_1717096 ?auto_1717098 ?auto_1717097 ?auto_1717099 ?auto_1717100 ?auto_1717101 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1717202 - SURFACE
      ?auto_1717203 - SURFACE
      ?auto_1717204 - SURFACE
      ?auto_1717201 - SURFACE
      ?auto_1717205 - SURFACE
      ?auto_1717207 - SURFACE
      ?auto_1717206 - SURFACE
      ?auto_1717208 - SURFACE
      ?auto_1717209 - SURFACE
      ?auto_1717210 - SURFACE
    )
    :vars
    (
      ?auto_1717215 - HOIST
      ?auto_1717216 - PLACE
      ?auto_1717211 - PLACE
      ?auto_1717214 - HOIST
      ?auto_1717213 - SURFACE
      ?auto_1717212 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1717215 ?auto_1717216 ) ( IS-CRATE ?auto_1717210 ) ( not ( = ?auto_1717209 ?auto_1717210 ) ) ( not ( = ?auto_1717208 ?auto_1717209 ) ) ( not ( = ?auto_1717208 ?auto_1717210 ) ) ( not ( = ?auto_1717211 ?auto_1717216 ) ) ( HOIST-AT ?auto_1717214 ?auto_1717211 ) ( not ( = ?auto_1717215 ?auto_1717214 ) ) ( AVAILABLE ?auto_1717214 ) ( SURFACE-AT ?auto_1717210 ?auto_1717211 ) ( ON ?auto_1717210 ?auto_1717213 ) ( CLEAR ?auto_1717210 ) ( not ( = ?auto_1717209 ?auto_1717213 ) ) ( not ( = ?auto_1717210 ?auto_1717213 ) ) ( not ( = ?auto_1717208 ?auto_1717213 ) ) ( TRUCK-AT ?auto_1717212 ?auto_1717216 ) ( SURFACE-AT ?auto_1717208 ?auto_1717216 ) ( CLEAR ?auto_1717208 ) ( IS-CRATE ?auto_1717209 ) ( AVAILABLE ?auto_1717215 ) ( IN ?auto_1717209 ?auto_1717212 ) ( ON ?auto_1717203 ?auto_1717202 ) ( ON ?auto_1717204 ?auto_1717203 ) ( ON ?auto_1717201 ?auto_1717204 ) ( ON ?auto_1717205 ?auto_1717201 ) ( ON ?auto_1717207 ?auto_1717205 ) ( ON ?auto_1717206 ?auto_1717207 ) ( ON ?auto_1717208 ?auto_1717206 ) ( not ( = ?auto_1717202 ?auto_1717203 ) ) ( not ( = ?auto_1717202 ?auto_1717204 ) ) ( not ( = ?auto_1717202 ?auto_1717201 ) ) ( not ( = ?auto_1717202 ?auto_1717205 ) ) ( not ( = ?auto_1717202 ?auto_1717207 ) ) ( not ( = ?auto_1717202 ?auto_1717206 ) ) ( not ( = ?auto_1717202 ?auto_1717208 ) ) ( not ( = ?auto_1717202 ?auto_1717209 ) ) ( not ( = ?auto_1717202 ?auto_1717210 ) ) ( not ( = ?auto_1717202 ?auto_1717213 ) ) ( not ( = ?auto_1717203 ?auto_1717204 ) ) ( not ( = ?auto_1717203 ?auto_1717201 ) ) ( not ( = ?auto_1717203 ?auto_1717205 ) ) ( not ( = ?auto_1717203 ?auto_1717207 ) ) ( not ( = ?auto_1717203 ?auto_1717206 ) ) ( not ( = ?auto_1717203 ?auto_1717208 ) ) ( not ( = ?auto_1717203 ?auto_1717209 ) ) ( not ( = ?auto_1717203 ?auto_1717210 ) ) ( not ( = ?auto_1717203 ?auto_1717213 ) ) ( not ( = ?auto_1717204 ?auto_1717201 ) ) ( not ( = ?auto_1717204 ?auto_1717205 ) ) ( not ( = ?auto_1717204 ?auto_1717207 ) ) ( not ( = ?auto_1717204 ?auto_1717206 ) ) ( not ( = ?auto_1717204 ?auto_1717208 ) ) ( not ( = ?auto_1717204 ?auto_1717209 ) ) ( not ( = ?auto_1717204 ?auto_1717210 ) ) ( not ( = ?auto_1717204 ?auto_1717213 ) ) ( not ( = ?auto_1717201 ?auto_1717205 ) ) ( not ( = ?auto_1717201 ?auto_1717207 ) ) ( not ( = ?auto_1717201 ?auto_1717206 ) ) ( not ( = ?auto_1717201 ?auto_1717208 ) ) ( not ( = ?auto_1717201 ?auto_1717209 ) ) ( not ( = ?auto_1717201 ?auto_1717210 ) ) ( not ( = ?auto_1717201 ?auto_1717213 ) ) ( not ( = ?auto_1717205 ?auto_1717207 ) ) ( not ( = ?auto_1717205 ?auto_1717206 ) ) ( not ( = ?auto_1717205 ?auto_1717208 ) ) ( not ( = ?auto_1717205 ?auto_1717209 ) ) ( not ( = ?auto_1717205 ?auto_1717210 ) ) ( not ( = ?auto_1717205 ?auto_1717213 ) ) ( not ( = ?auto_1717207 ?auto_1717206 ) ) ( not ( = ?auto_1717207 ?auto_1717208 ) ) ( not ( = ?auto_1717207 ?auto_1717209 ) ) ( not ( = ?auto_1717207 ?auto_1717210 ) ) ( not ( = ?auto_1717207 ?auto_1717213 ) ) ( not ( = ?auto_1717206 ?auto_1717208 ) ) ( not ( = ?auto_1717206 ?auto_1717209 ) ) ( not ( = ?auto_1717206 ?auto_1717210 ) ) ( not ( = ?auto_1717206 ?auto_1717213 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1717208 ?auto_1717209 ?auto_1717210 )
      ( MAKE-9CRATE-VERIFY ?auto_1717202 ?auto_1717203 ?auto_1717204 ?auto_1717201 ?auto_1717205 ?auto_1717207 ?auto_1717206 ?auto_1717208 ?auto_1717209 ?auto_1717210 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1722710 - SURFACE
      ?auto_1722711 - SURFACE
      ?auto_1722712 - SURFACE
      ?auto_1722709 - SURFACE
      ?auto_1722713 - SURFACE
      ?auto_1722715 - SURFACE
      ?auto_1722714 - SURFACE
      ?auto_1722716 - SURFACE
      ?auto_1722717 - SURFACE
      ?auto_1722718 - SURFACE
      ?auto_1722719 - SURFACE
    )
    :vars
    (
      ?auto_1722721 - HOIST
      ?auto_1722720 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1722721 ?auto_1722720 ) ( SURFACE-AT ?auto_1722718 ?auto_1722720 ) ( CLEAR ?auto_1722718 ) ( LIFTING ?auto_1722721 ?auto_1722719 ) ( IS-CRATE ?auto_1722719 ) ( not ( = ?auto_1722718 ?auto_1722719 ) ) ( ON ?auto_1722711 ?auto_1722710 ) ( ON ?auto_1722712 ?auto_1722711 ) ( ON ?auto_1722709 ?auto_1722712 ) ( ON ?auto_1722713 ?auto_1722709 ) ( ON ?auto_1722715 ?auto_1722713 ) ( ON ?auto_1722714 ?auto_1722715 ) ( ON ?auto_1722716 ?auto_1722714 ) ( ON ?auto_1722717 ?auto_1722716 ) ( ON ?auto_1722718 ?auto_1722717 ) ( not ( = ?auto_1722710 ?auto_1722711 ) ) ( not ( = ?auto_1722710 ?auto_1722712 ) ) ( not ( = ?auto_1722710 ?auto_1722709 ) ) ( not ( = ?auto_1722710 ?auto_1722713 ) ) ( not ( = ?auto_1722710 ?auto_1722715 ) ) ( not ( = ?auto_1722710 ?auto_1722714 ) ) ( not ( = ?auto_1722710 ?auto_1722716 ) ) ( not ( = ?auto_1722710 ?auto_1722717 ) ) ( not ( = ?auto_1722710 ?auto_1722718 ) ) ( not ( = ?auto_1722710 ?auto_1722719 ) ) ( not ( = ?auto_1722711 ?auto_1722712 ) ) ( not ( = ?auto_1722711 ?auto_1722709 ) ) ( not ( = ?auto_1722711 ?auto_1722713 ) ) ( not ( = ?auto_1722711 ?auto_1722715 ) ) ( not ( = ?auto_1722711 ?auto_1722714 ) ) ( not ( = ?auto_1722711 ?auto_1722716 ) ) ( not ( = ?auto_1722711 ?auto_1722717 ) ) ( not ( = ?auto_1722711 ?auto_1722718 ) ) ( not ( = ?auto_1722711 ?auto_1722719 ) ) ( not ( = ?auto_1722712 ?auto_1722709 ) ) ( not ( = ?auto_1722712 ?auto_1722713 ) ) ( not ( = ?auto_1722712 ?auto_1722715 ) ) ( not ( = ?auto_1722712 ?auto_1722714 ) ) ( not ( = ?auto_1722712 ?auto_1722716 ) ) ( not ( = ?auto_1722712 ?auto_1722717 ) ) ( not ( = ?auto_1722712 ?auto_1722718 ) ) ( not ( = ?auto_1722712 ?auto_1722719 ) ) ( not ( = ?auto_1722709 ?auto_1722713 ) ) ( not ( = ?auto_1722709 ?auto_1722715 ) ) ( not ( = ?auto_1722709 ?auto_1722714 ) ) ( not ( = ?auto_1722709 ?auto_1722716 ) ) ( not ( = ?auto_1722709 ?auto_1722717 ) ) ( not ( = ?auto_1722709 ?auto_1722718 ) ) ( not ( = ?auto_1722709 ?auto_1722719 ) ) ( not ( = ?auto_1722713 ?auto_1722715 ) ) ( not ( = ?auto_1722713 ?auto_1722714 ) ) ( not ( = ?auto_1722713 ?auto_1722716 ) ) ( not ( = ?auto_1722713 ?auto_1722717 ) ) ( not ( = ?auto_1722713 ?auto_1722718 ) ) ( not ( = ?auto_1722713 ?auto_1722719 ) ) ( not ( = ?auto_1722715 ?auto_1722714 ) ) ( not ( = ?auto_1722715 ?auto_1722716 ) ) ( not ( = ?auto_1722715 ?auto_1722717 ) ) ( not ( = ?auto_1722715 ?auto_1722718 ) ) ( not ( = ?auto_1722715 ?auto_1722719 ) ) ( not ( = ?auto_1722714 ?auto_1722716 ) ) ( not ( = ?auto_1722714 ?auto_1722717 ) ) ( not ( = ?auto_1722714 ?auto_1722718 ) ) ( not ( = ?auto_1722714 ?auto_1722719 ) ) ( not ( = ?auto_1722716 ?auto_1722717 ) ) ( not ( = ?auto_1722716 ?auto_1722718 ) ) ( not ( = ?auto_1722716 ?auto_1722719 ) ) ( not ( = ?auto_1722717 ?auto_1722718 ) ) ( not ( = ?auto_1722717 ?auto_1722719 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1722718 ?auto_1722719 )
      ( MAKE-10CRATE-VERIFY ?auto_1722710 ?auto_1722711 ?auto_1722712 ?auto_1722709 ?auto_1722713 ?auto_1722715 ?auto_1722714 ?auto_1722716 ?auto_1722717 ?auto_1722718 ?auto_1722719 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1722804 - SURFACE
      ?auto_1722805 - SURFACE
      ?auto_1722806 - SURFACE
      ?auto_1722803 - SURFACE
      ?auto_1722807 - SURFACE
      ?auto_1722809 - SURFACE
      ?auto_1722808 - SURFACE
      ?auto_1722810 - SURFACE
      ?auto_1722811 - SURFACE
      ?auto_1722812 - SURFACE
      ?auto_1722813 - SURFACE
    )
    :vars
    (
      ?auto_1722814 - HOIST
      ?auto_1722815 - PLACE
      ?auto_1722816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1722814 ?auto_1722815 ) ( SURFACE-AT ?auto_1722812 ?auto_1722815 ) ( CLEAR ?auto_1722812 ) ( IS-CRATE ?auto_1722813 ) ( not ( = ?auto_1722812 ?auto_1722813 ) ) ( TRUCK-AT ?auto_1722816 ?auto_1722815 ) ( AVAILABLE ?auto_1722814 ) ( IN ?auto_1722813 ?auto_1722816 ) ( ON ?auto_1722812 ?auto_1722811 ) ( not ( = ?auto_1722811 ?auto_1722812 ) ) ( not ( = ?auto_1722811 ?auto_1722813 ) ) ( ON ?auto_1722805 ?auto_1722804 ) ( ON ?auto_1722806 ?auto_1722805 ) ( ON ?auto_1722803 ?auto_1722806 ) ( ON ?auto_1722807 ?auto_1722803 ) ( ON ?auto_1722809 ?auto_1722807 ) ( ON ?auto_1722808 ?auto_1722809 ) ( ON ?auto_1722810 ?auto_1722808 ) ( ON ?auto_1722811 ?auto_1722810 ) ( not ( = ?auto_1722804 ?auto_1722805 ) ) ( not ( = ?auto_1722804 ?auto_1722806 ) ) ( not ( = ?auto_1722804 ?auto_1722803 ) ) ( not ( = ?auto_1722804 ?auto_1722807 ) ) ( not ( = ?auto_1722804 ?auto_1722809 ) ) ( not ( = ?auto_1722804 ?auto_1722808 ) ) ( not ( = ?auto_1722804 ?auto_1722810 ) ) ( not ( = ?auto_1722804 ?auto_1722811 ) ) ( not ( = ?auto_1722804 ?auto_1722812 ) ) ( not ( = ?auto_1722804 ?auto_1722813 ) ) ( not ( = ?auto_1722805 ?auto_1722806 ) ) ( not ( = ?auto_1722805 ?auto_1722803 ) ) ( not ( = ?auto_1722805 ?auto_1722807 ) ) ( not ( = ?auto_1722805 ?auto_1722809 ) ) ( not ( = ?auto_1722805 ?auto_1722808 ) ) ( not ( = ?auto_1722805 ?auto_1722810 ) ) ( not ( = ?auto_1722805 ?auto_1722811 ) ) ( not ( = ?auto_1722805 ?auto_1722812 ) ) ( not ( = ?auto_1722805 ?auto_1722813 ) ) ( not ( = ?auto_1722806 ?auto_1722803 ) ) ( not ( = ?auto_1722806 ?auto_1722807 ) ) ( not ( = ?auto_1722806 ?auto_1722809 ) ) ( not ( = ?auto_1722806 ?auto_1722808 ) ) ( not ( = ?auto_1722806 ?auto_1722810 ) ) ( not ( = ?auto_1722806 ?auto_1722811 ) ) ( not ( = ?auto_1722806 ?auto_1722812 ) ) ( not ( = ?auto_1722806 ?auto_1722813 ) ) ( not ( = ?auto_1722803 ?auto_1722807 ) ) ( not ( = ?auto_1722803 ?auto_1722809 ) ) ( not ( = ?auto_1722803 ?auto_1722808 ) ) ( not ( = ?auto_1722803 ?auto_1722810 ) ) ( not ( = ?auto_1722803 ?auto_1722811 ) ) ( not ( = ?auto_1722803 ?auto_1722812 ) ) ( not ( = ?auto_1722803 ?auto_1722813 ) ) ( not ( = ?auto_1722807 ?auto_1722809 ) ) ( not ( = ?auto_1722807 ?auto_1722808 ) ) ( not ( = ?auto_1722807 ?auto_1722810 ) ) ( not ( = ?auto_1722807 ?auto_1722811 ) ) ( not ( = ?auto_1722807 ?auto_1722812 ) ) ( not ( = ?auto_1722807 ?auto_1722813 ) ) ( not ( = ?auto_1722809 ?auto_1722808 ) ) ( not ( = ?auto_1722809 ?auto_1722810 ) ) ( not ( = ?auto_1722809 ?auto_1722811 ) ) ( not ( = ?auto_1722809 ?auto_1722812 ) ) ( not ( = ?auto_1722809 ?auto_1722813 ) ) ( not ( = ?auto_1722808 ?auto_1722810 ) ) ( not ( = ?auto_1722808 ?auto_1722811 ) ) ( not ( = ?auto_1722808 ?auto_1722812 ) ) ( not ( = ?auto_1722808 ?auto_1722813 ) ) ( not ( = ?auto_1722810 ?auto_1722811 ) ) ( not ( = ?auto_1722810 ?auto_1722812 ) ) ( not ( = ?auto_1722810 ?auto_1722813 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1722811 ?auto_1722812 ?auto_1722813 )
      ( MAKE-10CRATE-VERIFY ?auto_1722804 ?auto_1722805 ?auto_1722806 ?auto_1722803 ?auto_1722807 ?auto_1722809 ?auto_1722808 ?auto_1722810 ?auto_1722811 ?auto_1722812 ?auto_1722813 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1722909 - SURFACE
      ?auto_1722910 - SURFACE
      ?auto_1722911 - SURFACE
      ?auto_1722908 - SURFACE
      ?auto_1722912 - SURFACE
      ?auto_1722914 - SURFACE
      ?auto_1722913 - SURFACE
      ?auto_1722915 - SURFACE
      ?auto_1722916 - SURFACE
      ?auto_1722917 - SURFACE
      ?auto_1722918 - SURFACE
    )
    :vars
    (
      ?auto_1722919 - HOIST
      ?auto_1722921 - PLACE
      ?auto_1722920 - TRUCK
      ?auto_1722922 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1722919 ?auto_1722921 ) ( SURFACE-AT ?auto_1722917 ?auto_1722921 ) ( CLEAR ?auto_1722917 ) ( IS-CRATE ?auto_1722918 ) ( not ( = ?auto_1722917 ?auto_1722918 ) ) ( AVAILABLE ?auto_1722919 ) ( IN ?auto_1722918 ?auto_1722920 ) ( ON ?auto_1722917 ?auto_1722916 ) ( not ( = ?auto_1722916 ?auto_1722917 ) ) ( not ( = ?auto_1722916 ?auto_1722918 ) ) ( TRUCK-AT ?auto_1722920 ?auto_1722922 ) ( not ( = ?auto_1722922 ?auto_1722921 ) ) ( ON ?auto_1722910 ?auto_1722909 ) ( ON ?auto_1722911 ?auto_1722910 ) ( ON ?auto_1722908 ?auto_1722911 ) ( ON ?auto_1722912 ?auto_1722908 ) ( ON ?auto_1722914 ?auto_1722912 ) ( ON ?auto_1722913 ?auto_1722914 ) ( ON ?auto_1722915 ?auto_1722913 ) ( ON ?auto_1722916 ?auto_1722915 ) ( not ( = ?auto_1722909 ?auto_1722910 ) ) ( not ( = ?auto_1722909 ?auto_1722911 ) ) ( not ( = ?auto_1722909 ?auto_1722908 ) ) ( not ( = ?auto_1722909 ?auto_1722912 ) ) ( not ( = ?auto_1722909 ?auto_1722914 ) ) ( not ( = ?auto_1722909 ?auto_1722913 ) ) ( not ( = ?auto_1722909 ?auto_1722915 ) ) ( not ( = ?auto_1722909 ?auto_1722916 ) ) ( not ( = ?auto_1722909 ?auto_1722917 ) ) ( not ( = ?auto_1722909 ?auto_1722918 ) ) ( not ( = ?auto_1722910 ?auto_1722911 ) ) ( not ( = ?auto_1722910 ?auto_1722908 ) ) ( not ( = ?auto_1722910 ?auto_1722912 ) ) ( not ( = ?auto_1722910 ?auto_1722914 ) ) ( not ( = ?auto_1722910 ?auto_1722913 ) ) ( not ( = ?auto_1722910 ?auto_1722915 ) ) ( not ( = ?auto_1722910 ?auto_1722916 ) ) ( not ( = ?auto_1722910 ?auto_1722917 ) ) ( not ( = ?auto_1722910 ?auto_1722918 ) ) ( not ( = ?auto_1722911 ?auto_1722908 ) ) ( not ( = ?auto_1722911 ?auto_1722912 ) ) ( not ( = ?auto_1722911 ?auto_1722914 ) ) ( not ( = ?auto_1722911 ?auto_1722913 ) ) ( not ( = ?auto_1722911 ?auto_1722915 ) ) ( not ( = ?auto_1722911 ?auto_1722916 ) ) ( not ( = ?auto_1722911 ?auto_1722917 ) ) ( not ( = ?auto_1722911 ?auto_1722918 ) ) ( not ( = ?auto_1722908 ?auto_1722912 ) ) ( not ( = ?auto_1722908 ?auto_1722914 ) ) ( not ( = ?auto_1722908 ?auto_1722913 ) ) ( not ( = ?auto_1722908 ?auto_1722915 ) ) ( not ( = ?auto_1722908 ?auto_1722916 ) ) ( not ( = ?auto_1722908 ?auto_1722917 ) ) ( not ( = ?auto_1722908 ?auto_1722918 ) ) ( not ( = ?auto_1722912 ?auto_1722914 ) ) ( not ( = ?auto_1722912 ?auto_1722913 ) ) ( not ( = ?auto_1722912 ?auto_1722915 ) ) ( not ( = ?auto_1722912 ?auto_1722916 ) ) ( not ( = ?auto_1722912 ?auto_1722917 ) ) ( not ( = ?auto_1722912 ?auto_1722918 ) ) ( not ( = ?auto_1722914 ?auto_1722913 ) ) ( not ( = ?auto_1722914 ?auto_1722915 ) ) ( not ( = ?auto_1722914 ?auto_1722916 ) ) ( not ( = ?auto_1722914 ?auto_1722917 ) ) ( not ( = ?auto_1722914 ?auto_1722918 ) ) ( not ( = ?auto_1722913 ?auto_1722915 ) ) ( not ( = ?auto_1722913 ?auto_1722916 ) ) ( not ( = ?auto_1722913 ?auto_1722917 ) ) ( not ( = ?auto_1722913 ?auto_1722918 ) ) ( not ( = ?auto_1722915 ?auto_1722916 ) ) ( not ( = ?auto_1722915 ?auto_1722917 ) ) ( not ( = ?auto_1722915 ?auto_1722918 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1722916 ?auto_1722917 ?auto_1722918 )
      ( MAKE-10CRATE-VERIFY ?auto_1722909 ?auto_1722910 ?auto_1722911 ?auto_1722908 ?auto_1722912 ?auto_1722914 ?auto_1722913 ?auto_1722915 ?auto_1722916 ?auto_1722917 ?auto_1722918 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1723024 - SURFACE
      ?auto_1723025 - SURFACE
      ?auto_1723026 - SURFACE
      ?auto_1723023 - SURFACE
      ?auto_1723027 - SURFACE
      ?auto_1723029 - SURFACE
      ?auto_1723028 - SURFACE
      ?auto_1723030 - SURFACE
      ?auto_1723031 - SURFACE
      ?auto_1723032 - SURFACE
      ?auto_1723033 - SURFACE
    )
    :vars
    (
      ?auto_1723034 - HOIST
      ?auto_1723035 - PLACE
      ?auto_1723036 - TRUCK
      ?auto_1723038 - PLACE
      ?auto_1723037 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1723034 ?auto_1723035 ) ( SURFACE-AT ?auto_1723032 ?auto_1723035 ) ( CLEAR ?auto_1723032 ) ( IS-CRATE ?auto_1723033 ) ( not ( = ?auto_1723032 ?auto_1723033 ) ) ( AVAILABLE ?auto_1723034 ) ( ON ?auto_1723032 ?auto_1723031 ) ( not ( = ?auto_1723031 ?auto_1723032 ) ) ( not ( = ?auto_1723031 ?auto_1723033 ) ) ( TRUCK-AT ?auto_1723036 ?auto_1723038 ) ( not ( = ?auto_1723038 ?auto_1723035 ) ) ( HOIST-AT ?auto_1723037 ?auto_1723038 ) ( LIFTING ?auto_1723037 ?auto_1723033 ) ( not ( = ?auto_1723034 ?auto_1723037 ) ) ( ON ?auto_1723025 ?auto_1723024 ) ( ON ?auto_1723026 ?auto_1723025 ) ( ON ?auto_1723023 ?auto_1723026 ) ( ON ?auto_1723027 ?auto_1723023 ) ( ON ?auto_1723029 ?auto_1723027 ) ( ON ?auto_1723028 ?auto_1723029 ) ( ON ?auto_1723030 ?auto_1723028 ) ( ON ?auto_1723031 ?auto_1723030 ) ( not ( = ?auto_1723024 ?auto_1723025 ) ) ( not ( = ?auto_1723024 ?auto_1723026 ) ) ( not ( = ?auto_1723024 ?auto_1723023 ) ) ( not ( = ?auto_1723024 ?auto_1723027 ) ) ( not ( = ?auto_1723024 ?auto_1723029 ) ) ( not ( = ?auto_1723024 ?auto_1723028 ) ) ( not ( = ?auto_1723024 ?auto_1723030 ) ) ( not ( = ?auto_1723024 ?auto_1723031 ) ) ( not ( = ?auto_1723024 ?auto_1723032 ) ) ( not ( = ?auto_1723024 ?auto_1723033 ) ) ( not ( = ?auto_1723025 ?auto_1723026 ) ) ( not ( = ?auto_1723025 ?auto_1723023 ) ) ( not ( = ?auto_1723025 ?auto_1723027 ) ) ( not ( = ?auto_1723025 ?auto_1723029 ) ) ( not ( = ?auto_1723025 ?auto_1723028 ) ) ( not ( = ?auto_1723025 ?auto_1723030 ) ) ( not ( = ?auto_1723025 ?auto_1723031 ) ) ( not ( = ?auto_1723025 ?auto_1723032 ) ) ( not ( = ?auto_1723025 ?auto_1723033 ) ) ( not ( = ?auto_1723026 ?auto_1723023 ) ) ( not ( = ?auto_1723026 ?auto_1723027 ) ) ( not ( = ?auto_1723026 ?auto_1723029 ) ) ( not ( = ?auto_1723026 ?auto_1723028 ) ) ( not ( = ?auto_1723026 ?auto_1723030 ) ) ( not ( = ?auto_1723026 ?auto_1723031 ) ) ( not ( = ?auto_1723026 ?auto_1723032 ) ) ( not ( = ?auto_1723026 ?auto_1723033 ) ) ( not ( = ?auto_1723023 ?auto_1723027 ) ) ( not ( = ?auto_1723023 ?auto_1723029 ) ) ( not ( = ?auto_1723023 ?auto_1723028 ) ) ( not ( = ?auto_1723023 ?auto_1723030 ) ) ( not ( = ?auto_1723023 ?auto_1723031 ) ) ( not ( = ?auto_1723023 ?auto_1723032 ) ) ( not ( = ?auto_1723023 ?auto_1723033 ) ) ( not ( = ?auto_1723027 ?auto_1723029 ) ) ( not ( = ?auto_1723027 ?auto_1723028 ) ) ( not ( = ?auto_1723027 ?auto_1723030 ) ) ( not ( = ?auto_1723027 ?auto_1723031 ) ) ( not ( = ?auto_1723027 ?auto_1723032 ) ) ( not ( = ?auto_1723027 ?auto_1723033 ) ) ( not ( = ?auto_1723029 ?auto_1723028 ) ) ( not ( = ?auto_1723029 ?auto_1723030 ) ) ( not ( = ?auto_1723029 ?auto_1723031 ) ) ( not ( = ?auto_1723029 ?auto_1723032 ) ) ( not ( = ?auto_1723029 ?auto_1723033 ) ) ( not ( = ?auto_1723028 ?auto_1723030 ) ) ( not ( = ?auto_1723028 ?auto_1723031 ) ) ( not ( = ?auto_1723028 ?auto_1723032 ) ) ( not ( = ?auto_1723028 ?auto_1723033 ) ) ( not ( = ?auto_1723030 ?auto_1723031 ) ) ( not ( = ?auto_1723030 ?auto_1723032 ) ) ( not ( = ?auto_1723030 ?auto_1723033 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1723031 ?auto_1723032 ?auto_1723033 )
      ( MAKE-10CRATE-VERIFY ?auto_1723024 ?auto_1723025 ?auto_1723026 ?auto_1723023 ?auto_1723027 ?auto_1723029 ?auto_1723028 ?auto_1723030 ?auto_1723031 ?auto_1723032 ?auto_1723033 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1723149 - SURFACE
      ?auto_1723150 - SURFACE
      ?auto_1723151 - SURFACE
      ?auto_1723148 - SURFACE
      ?auto_1723152 - SURFACE
      ?auto_1723154 - SURFACE
      ?auto_1723153 - SURFACE
      ?auto_1723155 - SURFACE
      ?auto_1723156 - SURFACE
      ?auto_1723157 - SURFACE
      ?auto_1723158 - SURFACE
    )
    :vars
    (
      ?auto_1723161 - HOIST
      ?auto_1723160 - PLACE
      ?auto_1723164 - TRUCK
      ?auto_1723163 - PLACE
      ?auto_1723159 - HOIST
      ?auto_1723162 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1723161 ?auto_1723160 ) ( SURFACE-AT ?auto_1723157 ?auto_1723160 ) ( CLEAR ?auto_1723157 ) ( IS-CRATE ?auto_1723158 ) ( not ( = ?auto_1723157 ?auto_1723158 ) ) ( AVAILABLE ?auto_1723161 ) ( ON ?auto_1723157 ?auto_1723156 ) ( not ( = ?auto_1723156 ?auto_1723157 ) ) ( not ( = ?auto_1723156 ?auto_1723158 ) ) ( TRUCK-AT ?auto_1723164 ?auto_1723163 ) ( not ( = ?auto_1723163 ?auto_1723160 ) ) ( HOIST-AT ?auto_1723159 ?auto_1723163 ) ( not ( = ?auto_1723161 ?auto_1723159 ) ) ( AVAILABLE ?auto_1723159 ) ( SURFACE-AT ?auto_1723158 ?auto_1723163 ) ( ON ?auto_1723158 ?auto_1723162 ) ( CLEAR ?auto_1723158 ) ( not ( = ?auto_1723157 ?auto_1723162 ) ) ( not ( = ?auto_1723158 ?auto_1723162 ) ) ( not ( = ?auto_1723156 ?auto_1723162 ) ) ( ON ?auto_1723150 ?auto_1723149 ) ( ON ?auto_1723151 ?auto_1723150 ) ( ON ?auto_1723148 ?auto_1723151 ) ( ON ?auto_1723152 ?auto_1723148 ) ( ON ?auto_1723154 ?auto_1723152 ) ( ON ?auto_1723153 ?auto_1723154 ) ( ON ?auto_1723155 ?auto_1723153 ) ( ON ?auto_1723156 ?auto_1723155 ) ( not ( = ?auto_1723149 ?auto_1723150 ) ) ( not ( = ?auto_1723149 ?auto_1723151 ) ) ( not ( = ?auto_1723149 ?auto_1723148 ) ) ( not ( = ?auto_1723149 ?auto_1723152 ) ) ( not ( = ?auto_1723149 ?auto_1723154 ) ) ( not ( = ?auto_1723149 ?auto_1723153 ) ) ( not ( = ?auto_1723149 ?auto_1723155 ) ) ( not ( = ?auto_1723149 ?auto_1723156 ) ) ( not ( = ?auto_1723149 ?auto_1723157 ) ) ( not ( = ?auto_1723149 ?auto_1723158 ) ) ( not ( = ?auto_1723149 ?auto_1723162 ) ) ( not ( = ?auto_1723150 ?auto_1723151 ) ) ( not ( = ?auto_1723150 ?auto_1723148 ) ) ( not ( = ?auto_1723150 ?auto_1723152 ) ) ( not ( = ?auto_1723150 ?auto_1723154 ) ) ( not ( = ?auto_1723150 ?auto_1723153 ) ) ( not ( = ?auto_1723150 ?auto_1723155 ) ) ( not ( = ?auto_1723150 ?auto_1723156 ) ) ( not ( = ?auto_1723150 ?auto_1723157 ) ) ( not ( = ?auto_1723150 ?auto_1723158 ) ) ( not ( = ?auto_1723150 ?auto_1723162 ) ) ( not ( = ?auto_1723151 ?auto_1723148 ) ) ( not ( = ?auto_1723151 ?auto_1723152 ) ) ( not ( = ?auto_1723151 ?auto_1723154 ) ) ( not ( = ?auto_1723151 ?auto_1723153 ) ) ( not ( = ?auto_1723151 ?auto_1723155 ) ) ( not ( = ?auto_1723151 ?auto_1723156 ) ) ( not ( = ?auto_1723151 ?auto_1723157 ) ) ( not ( = ?auto_1723151 ?auto_1723158 ) ) ( not ( = ?auto_1723151 ?auto_1723162 ) ) ( not ( = ?auto_1723148 ?auto_1723152 ) ) ( not ( = ?auto_1723148 ?auto_1723154 ) ) ( not ( = ?auto_1723148 ?auto_1723153 ) ) ( not ( = ?auto_1723148 ?auto_1723155 ) ) ( not ( = ?auto_1723148 ?auto_1723156 ) ) ( not ( = ?auto_1723148 ?auto_1723157 ) ) ( not ( = ?auto_1723148 ?auto_1723158 ) ) ( not ( = ?auto_1723148 ?auto_1723162 ) ) ( not ( = ?auto_1723152 ?auto_1723154 ) ) ( not ( = ?auto_1723152 ?auto_1723153 ) ) ( not ( = ?auto_1723152 ?auto_1723155 ) ) ( not ( = ?auto_1723152 ?auto_1723156 ) ) ( not ( = ?auto_1723152 ?auto_1723157 ) ) ( not ( = ?auto_1723152 ?auto_1723158 ) ) ( not ( = ?auto_1723152 ?auto_1723162 ) ) ( not ( = ?auto_1723154 ?auto_1723153 ) ) ( not ( = ?auto_1723154 ?auto_1723155 ) ) ( not ( = ?auto_1723154 ?auto_1723156 ) ) ( not ( = ?auto_1723154 ?auto_1723157 ) ) ( not ( = ?auto_1723154 ?auto_1723158 ) ) ( not ( = ?auto_1723154 ?auto_1723162 ) ) ( not ( = ?auto_1723153 ?auto_1723155 ) ) ( not ( = ?auto_1723153 ?auto_1723156 ) ) ( not ( = ?auto_1723153 ?auto_1723157 ) ) ( not ( = ?auto_1723153 ?auto_1723158 ) ) ( not ( = ?auto_1723153 ?auto_1723162 ) ) ( not ( = ?auto_1723155 ?auto_1723156 ) ) ( not ( = ?auto_1723155 ?auto_1723157 ) ) ( not ( = ?auto_1723155 ?auto_1723158 ) ) ( not ( = ?auto_1723155 ?auto_1723162 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1723156 ?auto_1723157 ?auto_1723158 )
      ( MAKE-10CRATE-VERIFY ?auto_1723149 ?auto_1723150 ?auto_1723151 ?auto_1723148 ?auto_1723152 ?auto_1723154 ?auto_1723153 ?auto_1723155 ?auto_1723156 ?auto_1723157 ?auto_1723158 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1723275 - SURFACE
      ?auto_1723276 - SURFACE
      ?auto_1723277 - SURFACE
      ?auto_1723274 - SURFACE
      ?auto_1723278 - SURFACE
      ?auto_1723280 - SURFACE
      ?auto_1723279 - SURFACE
      ?auto_1723281 - SURFACE
      ?auto_1723282 - SURFACE
      ?auto_1723283 - SURFACE
      ?auto_1723284 - SURFACE
    )
    :vars
    (
      ?auto_1723287 - HOIST
      ?auto_1723289 - PLACE
      ?auto_1723285 - PLACE
      ?auto_1723288 - HOIST
      ?auto_1723290 - SURFACE
      ?auto_1723286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1723287 ?auto_1723289 ) ( SURFACE-AT ?auto_1723283 ?auto_1723289 ) ( CLEAR ?auto_1723283 ) ( IS-CRATE ?auto_1723284 ) ( not ( = ?auto_1723283 ?auto_1723284 ) ) ( AVAILABLE ?auto_1723287 ) ( ON ?auto_1723283 ?auto_1723282 ) ( not ( = ?auto_1723282 ?auto_1723283 ) ) ( not ( = ?auto_1723282 ?auto_1723284 ) ) ( not ( = ?auto_1723285 ?auto_1723289 ) ) ( HOIST-AT ?auto_1723288 ?auto_1723285 ) ( not ( = ?auto_1723287 ?auto_1723288 ) ) ( AVAILABLE ?auto_1723288 ) ( SURFACE-AT ?auto_1723284 ?auto_1723285 ) ( ON ?auto_1723284 ?auto_1723290 ) ( CLEAR ?auto_1723284 ) ( not ( = ?auto_1723283 ?auto_1723290 ) ) ( not ( = ?auto_1723284 ?auto_1723290 ) ) ( not ( = ?auto_1723282 ?auto_1723290 ) ) ( TRUCK-AT ?auto_1723286 ?auto_1723289 ) ( ON ?auto_1723276 ?auto_1723275 ) ( ON ?auto_1723277 ?auto_1723276 ) ( ON ?auto_1723274 ?auto_1723277 ) ( ON ?auto_1723278 ?auto_1723274 ) ( ON ?auto_1723280 ?auto_1723278 ) ( ON ?auto_1723279 ?auto_1723280 ) ( ON ?auto_1723281 ?auto_1723279 ) ( ON ?auto_1723282 ?auto_1723281 ) ( not ( = ?auto_1723275 ?auto_1723276 ) ) ( not ( = ?auto_1723275 ?auto_1723277 ) ) ( not ( = ?auto_1723275 ?auto_1723274 ) ) ( not ( = ?auto_1723275 ?auto_1723278 ) ) ( not ( = ?auto_1723275 ?auto_1723280 ) ) ( not ( = ?auto_1723275 ?auto_1723279 ) ) ( not ( = ?auto_1723275 ?auto_1723281 ) ) ( not ( = ?auto_1723275 ?auto_1723282 ) ) ( not ( = ?auto_1723275 ?auto_1723283 ) ) ( not ( = ?auto_1723275 ?auto_1723284 ) ) ( not ( = ?auto_1723275 ?auto_1723290 ) ) ( not ( = ?auto_1723276 ?auto_1723277 ) ) ( not ( = ?auto_1723276 ?auto_1723274 ) ) ( not ( = ?auto_1723276 ?auto_1723278 ) ) ( not ( = ?auto_1723276 ?auto_1723280 ) ) ( not ( = ?auto_1723276 ?auto_1723279 ) ) ( not ( = ?auto_1723276 ?auto_1723281 ) ) ( not ( = ?auto_1723276 ?auto_1723282 ) ) ( not ( = ?auto_1723276 ?auto_1723283 ) ) ( not ( = ?auto_1723276 ?auto_1723284 ) ) ( not ( = ?auto_1723276 ?auto_1723290 ) ) ( not ( = ?auto_1723277 ?auto_1723274 ) ) ( not ( = ?auto_1723277 ?auto_1723278 ) ) ( not ( = ?auto_1723277 ?auto_1723280 ) ) ( not ( = ?auto_1723277 ?auto_1723279 ) ) ( not ( = ?auto_1723277 ?auto_1723281 ) ) ( not ( = ?auto_1723277 ?auto_1723282 ) ) ( not ( = ?auto_1723277 ?auto_1723283 ) ) ( not ( = ?auto_1723277 ?auto_1723284 ) ) ( not ( = ?auto_1723277 ?auto_1723290 ) ) ( not ( = ?auto_1723274 ?auto_1723278 ) ) ( not ( = ?auto_1723274 ?auto_1723280 ) ) ( not ( = ?auto_1723274 ?auto_1723279 ) ) ( not ( = ?auto_1723274 ?auto_1723281 ) ) ( not ( = ?auto_1723274 ?auto_1723282 ) ) ( not ( = ?auto_1723274 ?auto_1723283 ) ) ( not ( = ?auto_1723274 ?auto_1723284 ) ) ( not ( = ?auto_1723274 ?auto_1723290 ) ) ( not ( = ?auto_1723278 ?auto_1723280 ) ) ( not ( = ?auto_1723278 ?auto_1723279 ) ) ( not ( = ?auto_1723278 ?auto_1723281 ) ) ( not ( = ?auto_1723278 ?auto_1723282 ) ) ( not ( = ?auto_1723278 ?auto_1723283 ) ) ( not ( = ?auto_1723278 ?auto_1723284 ) ) ( not ( = ?auto_1723278 ?auto_1723290 ) ) ( not ( = ?auto_1723280 ?auto_1723279 ) ) ( not ( = ?auto_1723280 ?auto_1723281 ) ) ( not ( = ?auto_1723280 ?auto_1723282 ) ) ( not ( = ?auto_1723280 ?auto_1723283 ) ) ( not ( = ?auto_1723280 ?auto_1723284 ) ) ( not ( = ?auto_1723280 ?auto_1723290 ) ) ( not ( = ?auto_1723279 ?auto_1723281 ) ) ( not ( = ?auto_1723279 ?auto_1723282 ) ) ( not ( = ?auto_1723279 ?auto_1723283 ) ) ( not ( = ?auto_1723279 ?auto_1723284 ) ) ( not ( = ?auto_1723279 ?auto_1723290 ) ) ( not ( = ?auto_1723281 ?auto_1723282 ) ) ( not ( = ?auto_1723281 ?auto_1723283 ) ) ( not ( = ?auto_1723281 ?auto_1723284 ) ) ( not ( = ?auto_1723281 ?auto_1723290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1723282 ?auto_1723283 ?auto_1723284 )
      ( MAKE-10CRATE-VERIFY ?auto_1723275 ?auto_1723276 ?auto_1723277 ?auto_1723274 ?auto_1723278 ?auto_1723280 ?auto_1723279 ?auto_1723281 ?auto_1723282 ?auto_1723283 ?auto_1723284 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1723401 - SURFACE
      ?auto_1723402 - SURFACE
      ?auto_1723403 - SURFACE
      ?auto_1723400 - SURFACE
      ?auto_1723404 - SURFACE
      ?auto_1723406 - SURFACE
      ?auto_1723405 - SURFACE
      ?auto_1723407 - SURFACE
      ?auto_1723408 - SURFACE
      ?auto_1723409 - SURFACE
      ?auto_1723410 - SURFACE
    )
    :vars
    (
      ?auto_1723411 - HOIST
      ?auto_1723412 - PLACE
      ?auto_1723414 - PLACE
      ?auto_1723415 - HOIST
      ?auto_1723416 - SURFACE
      ?auto_1723413 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1723411 ?auto_1723412 ) ( IS-CRATE ?auto_1723410 ) ( not ( = ?auto_1723409 ?auto_1723410 ) ) ( not ( = ?auto_1723408 ?auto_1723409 ) ) ( not ( = ?auto_1723408 ?auto_1723410 ) ) ( not ( = ?auto_1723414 ?auto_1723412 ) ) ( HOIST-AT ?auto_1723415 ?auto_1723414 ) ( not ( = ?auto_1723411 ?auto_1723415 ) ) ( AVAILABLE ?auto_1723415 ) ( SURFACE-AT ?auto_1723410 ?auto_1723414 ) ( ON ?auto_1723410 ?auto_1723416 ) ( CLEAR ?auto_1723410 ) ( not ( = ?auto_1723409 ?auto_1723416 ) ) ( not ( = ?auto_1723410 ?auto_1723416 ) ) ( not ( = ?auto_1723408 ?auto_1723416 ) ) ( TRUCK-AT ?auto_1723413 ?auto_1723412 ) ( SURFACE-AT ?auto_1723408 ?auto_1723412 ) ( CLEAR ?auto_1723408 ) ( LIFTING ?auto_1723411 ?auto_1723409 ) ( IS-CRATE ?auto_1723409 ) ( ON ?auto_1723402 ?auto_1723401 ) ( ON ?auto_1723403 ?auto_1723402 ) ( ON ?auto_1723400 ?auto_1723403 ) ( ON ?auto_1723404 ?auto_1723400 ) ( ON ?auto_1723406 ?auto_1723404 ) ( ON ?auto_1723405 ?auto_1723406 ) ( ON ?auto_1723407 ?auto_1723405 ) ( ON ?auto_1723408 ?auto_1723407 ) ( not ( = ?auto_1723401 ?auto_1723402 ) ) ( not ( = ?auto_1723401 ?auto_1723403 ) ) ( not ( = ?auto_1723401 ?auto_1723400 ) ) ( not ( = ?auto_1723401 ?auto_1723404 ) ) ( not ( = ?auto_1723401 ?auto_1723406 ) ) ( not ( = ?auto_1723401 ?auto_1723405 ) ) ( not ( = ?auto_1723401 ?auto_1723407 ) ) ( not ( = ?auto_1723401 ?auto_1723408 ) ) ( not ( = ?auto_1723401 ?auto_1723409 ) ) ( not ( = ?auto_1723401 ?auto_1723410 ) ) ( not ( = ?auto_1723401 ?auto_1723416 ) ) ( not ( = ?auto_1723402 ?auto_1723403 ) ) ( not ( = ?auto_1723402 ?auto_1723400 ) ) ( not ( = ?auto_1723402 ?auto_1723404 ) ) ( not ( = ?auto_1723402 ?auto_1723406 ) ) ( not ( = ?auto_1723402 ?auto_1723405 ) ) ( not ( = ?auto_1723402 ?auto_1723407 ) ) ( not ( = ?auto_1723402 ?auto_1723408 ) ) ( not ( = ?auto_1723402 ?auto_1723409 ) ) ( not ( = ?auto_1723402 ?auto_1723410 ) ) ( not ( = ?auto_1723402 ?auto_1723416 ) ) ( not ( = ?auto_1723403 ?auto_1723400 ) ) ( not ( = ?auto_1723403 ?auto_1723404 ) ) ( not ( = ?auto_1723403 ?auto_1723406 ) ) ( not ( = ?auto_1723403 ?auto_1723405 ) ) ( not ( = ?auto_1723403 ?auto_1723407 ) ) ( not ( = ?auto_1723403 ?auto_1723408 ) ) ( not ( = ?auto_1723403 ?auto_1723409 ) ) ( not ( = ?auto_1723403 ?auto_1723410 ) ) ( not ( = ?auto_1723403 ?auto_1723416 ) ) ( not ( = ?auto_1723400 ?auto_1723404 ) ) ( not ( = ?auto_1723400 ?auto_1723406 ) ) ( not ( = ?auto_1723400 ?auto_1723405 ) ) ( not ( = ?auto_1723400 ?auto_1723407 ) ) ( not ( = ?auto_1723400 ?auto_1723408 ) ) ( not ( = ?auto_1723400 ?auto_1723409 ) ) ( not ( = ?auto_1723400 ?auto_1723410 ) ) ( not ( = ?auto_1723400 ?auto_1723416 ) ) ( not ( = ?auto_1723404 ?auto_1723406 ) ) ( not ( = ?auto_1723404 ?auto_1723405 ) ) ( not ( = ?auto_1723404 ?auto_1723407 ) ) ( not ( = ?auto_1723404 ?auto_1723408 ) ) ( not ( = ?auto_1723404 ?auto_1723409 ) ) ( not ( = ?auto_1723404 ?auto_1723410 ) ) ( not ( = ?auto_1723404 ?auto_1723416 ) ) ( not ( = ?auto_1723406 ?auto_1723405 ) ) ( not ( = ?auto_1723406 ?auto_1723407 ) ) ( not ( = ?auto_1723406 ?auto_1723408 ) ) ( not ( = ?auto_1723406 ?auto_1723409 ) ) ( not ( = ?auto_1723406 ?auto_1723410 ) ) ( not ( = ?auto_1723406 ?auto_1723416 ) ) ( not ( = ?auto_1723405 ?auto_1723407 ) ) ( not ( = ?auto_1723405 ?auto_1723408 ) ) ( not ( = ?auto_1723405 ?auto_1723409 ) ) ( not ( = ?auto_1723405 ?auto_1723410 ) ) ( not ( = ?auto_1723405 ?auto_1723416 ) ) ( not ( = ?auto_1723407 ?auto_1723408 ) ) ( not ( = ?auto_1723407 ?auto_1723409 ) ) ( not ( = ?auto_1723407 ?auto_1723410 ) ) ( not ( = ?auto_1723407 ?auto_1723416 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1723408 ?auto_1723409 ?auto_1723410 )
      ( MAKE-10CRATE-VERIFY ?auto_1723401 ?auto_1723402 ?auto_1723403 ?auto_1723400 ?auto_1723404 ?auto_1723406 ?auto_1723405 ?auto_1723407 ?auto_1723408 ?auto_1723409 ?auto_1723410 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1723527 - SURFACE
      ?auto_1723528 - SURFACE
      ?auto_1723529 - SURFACE
      ?auto_1723526 - SURFACE
      ?auto_1723530 - SURFACE
      ?auto_1723532 - SURFACE
      ?auto_1723531 - SURFACE
      ?auto_1723533 - SURFACE
      ?auto_1723534 - SURFACE
      ?auto_1723535 - SURFACE
      ?auto_1723536 - SURFACE
    )
    :vars
    (
      ?auto_1723538 - HOIST
      ?auto_1723542 - PLACE
      ?auto_1723537 - PLACE
      ?auto_1723539 - HOIST
      ?auto_1723540 - SURFACE
      ?auto_1723541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1723538 ?auto_1723542 ) ( IS-CRATE ?auto_1723536 ) ( not ( = ?auto_1723535 ?auto_1723536 ) ) ( not ( = ?auto_1723534 ?auto_1723535 ) ) ( not ( = ?auto_1723534 ?auto_1723536 ) ) ( not ( = ?auto_1723537 ?auto_1723542 ) ) ( HOIST-AT ?auto_1723539 ?auto_1723537 ) ( not ( = ?auto_1723538 ?auto_1723539 ) ) ( AVAILABLE ?auto_1723539 ) ( SURFACE-AT ?auto_1723536 ?auto_1723537 ) ( ON ?auto_1723536 ?auto_1723540 ) ( CLEAR ?auto_1723536 ) ( not ( = ?auto_1723535 ?auto_1723540 ) ) ( not ( = ?auto_1723536 ?auto_1723540 ) ) ( not ( = ?auto_1723534 ?auto_1723540 ) ) ( TRUCK-AT ?auto_1723541 ?auto_1723542 ) ( SURFACE-AT ?auto_1723534 ?auto_1723542 ) ( CLEAR ?auto_1723534 ) ( IS-CRATE ?auto_1723535 ) ( AVAILABLE ?auto_1723538 ) ( IN ?auto_1723535 ?auto_1723541 ) ( ON ?auto_1723528 ?auto_1723527 ) ( ON ?auto_1723529 ?auto_1723528 ) ( ON ?auto_1723526 ?auto_1723529 ) ( ON ?auto_1723530 ?auto_1723526 ) ( ON ?auto_1723532 ?auto_1723530 ) ( ON ?auto_1723531 ?auto_1723532 ) ( ON ?auto_1723533 ?auto_1723531 ) ( ON ?auto_1723534 ?auto_1723533 ) ( not ( = ?auto_1723527 ?auto_1723528 ) ) ( not ( = ?auto_1723527 ?auto_1723529 ) ) ( not ( = ?auto_1723527 ?auto_1723526 ) ) ( not ( = ?auto_1723527 ?auto_1723530 ) ) ( not ( = ?auto_1723527 ?auto_1723532 ) ) ( not ( = ?auto_1723527 ?auto_1723531 ) ) ( not ( = ?auto_1723527 ?auto_1723533 ) ) ( not ( = ?auto_1723527 ?auto_1723534 ) ) ( not ( = ?auto_1723527 ?auto_1723535 ) ) ( not ( = ?auto_1723527 ?auto_1723536 ) ) ( not ( = ?auto_1723527 ?auto_1723540 ) ) ( not ( = ?auto_1723528 ?auto_1723529 ) ) ( not ( = ?auto_1723528 ?auto_1723526 ) ) ( not ( = ?auto_1723528 ?auto_1723530 ) ) ( not ( = ?auto_1723528 ?auto_1723532 ) ) ( not ( = ?auto_1723528 ?auto_1723531 ) ) ( not ( = ?auto_1723528 ?auto_1723533 ) ) ( not ( = ?auto_1723528 ?auto_1723534 ) ) ( not ( = ?auto_1723528 ?auto_1723535 ) ) ( not ( = ?auto_1723528 ?auto_1723536 ) ) ( not ( = ?auto_1723528 ?auto_1723540 ) ) ( not ( = ?auto_1723529 ?auto_1723526 ) ) ( not ( = ?auto_1723529 ?auto_1723530 ) ) ( not ( = ?auto_1723529 ?auto_1723532 ) ) ( not ( = ?auto_1723529 ?auto_1723531 ) ) ( not ( = ?auto_1723529 ?auto_1723533 ) ) ( not ( = ?auto_1723529 ?auto_1723534 ) ) ( not ( = ?auto_1723529 ?auto_1723535 ) ) ( not ( = ?auto_1723529 ?auto_1723536 ) ) ( not ( = ?auto_1723529 ?auto_1723540 ) ) ( not ( = ?auto_1723526 ?auto_1723530 ) ) ( not ( = ?auto_1723526 ?auto_1723532 ) ) ( not ( = ?auto_1723526 ?auto_1723531 ) ) ( not ( = ?auto_1723526 ?auto_1723533 ) ) ( not ( = ?auto_1723526 ?auto_1723534 ) ) ( not ( = ?auto_1723526 ?auto_1723535 ) ) ( not ( = ?auto_1723526 ?auto_1723536 ) ) ( not ( = ?auto_1723526 ?auto_1723540 ) ) ( not ( = ?auto_1723530 ?auto_1723532 ) ) ( not ( = ?auto_1723530 ?auto_1723531 ) ) ( not ( = ?auto_1723530 ?auto_1723533 ) ) ( not ( = ?auto_1723530 ?auto_1723534 ) ) ( not ( = ?auto_1723530 ?auto_1723535 ) ) ( not ( = ?auto_1723530 ?auto_1723536 ) ) ( not ( = ?auto_1723530 ?auto_1723540 ) ) ( not ( = ?auto_1723532 ?auto_1723531 ) ) ( not ( = ?auto_1723532 ?auto_1723533 ) ) ( not ( = ?auto_1723532 ?auto_1723534 ) ) ( not ( = ?auto_1723532 ?auto_1723535 ) ) ( not ( = ?auto_1723532 ?auto_1723536 ) ) ( not ( = ?auto_1723532 ?auto_1723540 ) ) ( not ( = ?auto_1723531 ?auto_1723533 ) ) ( not ( = ?auto_1723531 ?auto_1723534 ) ) ( not ( = ?auto_1723531 ?auto_1723535 ) ) ( not ( = ?auto_1723531 ?auto_1723536 ) ) ( not ( = ?auto_1723531 ?auto_1723540 ) ) ( not ( = ?auto_1723533 ?auto_1723534 ) ) ( not ( = ?auto_1723533 ?auto_1723535 ) ) ( not ( = ?auto_1723533 ?auto_1723536 ) ) ( not ( = ?auto_1723533 ?auto_1723540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1723534 ?auto_1723535 ?auto_1723536 )
      ( MAKE-10CRATE-VERIFY ?auto_1723527 ?auto_1723528 ?auto_1723529 ?auto_1723526 ?auto_1723530 ?auto_1723532 ?auto_1723531 ?auto_1723533 ?auto_1723534 ?auto_1723535 ?auto_1723536 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1730765 - SURFACE
      ?auto_1730766 - SURFACE
      ?auto_1730767 - SURFACE
      ?auto_1730764 - SURFACE
      ?auto_1730768 - SURFACE
      ?auto_1730770 - SURFACE
      ?auto_1730769 - SURFACE
      ?auto_1730771 - SURFACE
      ?auto_1730772 - SURFACE
      ?auto_1730773 - SURFACE
      ?auto_1730774 - SURFACE
      ?auto_1730775 - SURFACE
    )
    :vars
    (
      ?auto_1730776 - HOIST
      ?auto_1730777 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1730776 ?auto_1730777 ) ( SURFACE-AT ?auto_1730774 ?auto_1730777 ) ( CLEAR ?auto_1730774 ) ( LIFTING ?auto_1730776 ?auto_1730775 ) ( IS-CRATE ?auto_1730775 ) ( not ( = ?auto_1730774 ?auto_1730775 ) ) ( ON ?auto_1730766 ?auto_1730765 ) ( ON ?auto_1730767 ?auto_1730766 ) ( ON ?auto_1730764 ?auto_1730767 ) ( ON ?auto_1730768 ?auto_1730764 ) ( ON ?auto_1730770 ?auto_1730768 ) ( ON ?auto_1730769 ?auto_1730770 ) ( ON ?auto_1730771 ?auto_1730769 ) ( ON ?auto_1730772 ?auto_1730771 ) ( ON ?auto_1730773 ?auto_1730772 ) ( ON ?auto_1730774 ?auto_1730773 ) ( not ( = ?auto_1730765 ?auto_1730766 ) ) ( not ( = ?auto_1730765 ?auto_1730767 ) ) ( not ( = ?auto_1730765 ?auto_1730764 ) ) ( not ( = ?auto_1730765 ?auto_1730768 ) ) ( not ( = ?auto_1730765 ?auto_1730770 ) ) ( not ( = ?auto_1730765 ?auto_1730769 ) ) ( not ( = ?auto_1730765 ?auto_1730771 ) ) ( not ( = ?auto_1730765 ?auto_1730772 ) ) ( not ( = ?auto_1730765 ?auto_1730773 ) ) ( not ( = ?auto_1730765 ?auto_1730774 ) ) ( not ( = ?auto_1730765 ?auto_1730775 ) ) ( not ( = ?auto_1730766 ?auto_1730767 ) ) ( not ( = ?auto_1730766 ?auto_1730764 ) ) ( not ( = ?auto_1730766 ?auto_1730768 ) ) ( not ( = ?auto_1730766 ?auto_1730770 ) ) ( not ( = ?auto_1730766 ?auto_1730769 ) ) ( not ( = ?auto_1730766 ?auto_1730771 ) ) ( not ( = ?auto_1730766 ?auto_1730772 ) ) ( not ( = ?auto_1730766 ?auto_1730773 ) ) ( not ( = ?auto_1730766 ?auto_1730774 ) ) ( not ( = ?auto_1730766 ?auto_1730775 ) ) ( not ( = ?auto_1730767 ?auto_1730764 ) ) ( not ( = ?auto_1730767 ?auto_1730768 ) ) ( not ( = ?auto_1730767 ?auto_1730770 ) ) ( not ( = ?auto_1730767 ?auto_1730769 ) ) ( not ( = ?auto_1730767 ?auto_1730771 ) ) ( not ( = ?auto_1730767 ?auto_1730772 ) ) ( not ( = ?auto_1730767 ?auto_1730773 ) ) ( not ( = ?auto_1730767 ?auto_1730774 ) ) ( not ( = ?auto_1730767 ?auto_1730775 ) ) ( not ( = ?auto_1730764 ?auto_1730768 ) ) ( not ( = ?auto_1730764 ?auto_1730770 ) ) ( not ( = ?auto_1730764 ?auto_1730769 ) ) ( not ( = ?auto_1730764 ?auto_1730771 ) ) ( not ( = ?auto_1730764 ?auto_1730772 ) ) ( not ( = ?auto_1730764 ?auto_1730773 ) ) ( not ( = ?auto_1730764 ?auto_1730774 ) ) ( not ( = ?auto_1730764 ?auto_1730775 ) ) ( not ( = ?auto_1730768 ?auto_1730770 ) ) ( not ( = ?auto_1730768 ?auto_1730769 ) ) ( not ( = ?auto_1730768 ?auto_1730771 ) ) ( not ( = ?auto_1730768 ?auto_1730772 ) ) ( not ( = ?auto_1730768 ?auto_1730773 ) ) ( not ( = ?auto_1730768 ?auto_1730774 ) ) ( not ( = ?auto_1730768 ?auto_1730775 ) ) ( not ( = ?auto_1730770 ?auto_1730769 ) ) ( not ( = ?auto_1730770 ?auto_1730771 ) ) ( not ( = ?auto_1730770 ?auto_1730772 ) ) ( not ( = ?auto_1730770 ?auto_1730773 ) ) ( not ( = ?auto_1730770 ?auto_1730774 ) ) ( not ( = ?auto_1730770 ?auto_1730775 ) ) ( not ( = ?auto_1730769 ?auto_1730771 ) ) ( not ( = ?auto_1730769 ?auto_1730772 ) ) ( not ( = ?auto_1730769 ?auto_1730773 ) ) ( not ( = ?auto_1730769 ?auto_1730774 ) ) ( not ( = ?auto_1730769 ?auto_1730775 ) ) ( not ( = ?auto_1730771 ?auto_1730772 ) ) ( not ( = ?auto_1730771 ?auto_1730773 ) ) ( not ( = ?auto_1730771 ?auto_1730774 ) ) ( not ( = ?auto_1730771 ?auto_1730775 ) ) ( not ( = ?auto_1730772 ?auto_1730773 ) ) ( not ( = ?auto_1730772 ?auto_1730774 ) ) ( not ( = ?auto_1730772 ?auto_1730775 ) ) ( not ( = ?auto_1730773 ?auto_1730774 ) ) ( not ( = ?auto_1730773 ?auto_1730775 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1730774 ?auto_1730775 )
      ( MAKE-11CRATE-VERIFY ?auto_1730765 ?auto_1730766 ?auto_1730767 ?auto_1730764 ?auto_1730768 ?auto_1730770 ?auto_1730769 ?auto_1730771 ?auto_1730772 ?auto_1730773 ?auto_1730774 ?auto_1730775 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1730874 - SURFACE
      ?auto_1730875 - SURFACE
      ?auto_1730876 - SURFACE
      ?auto_1730873 - SURFACE
      ?auto_1730877 - SURFACE
      ?auto_1730879 - SURFACE
      ?auto_1730878 - SURFACE
      ?auto_1730880 - SURFACE
      ?auto_1730881 - SURFACE
      ?auto_1730882 - SURFACE
      ?auto_1730883 - SURFACE
      ?auto_1730884 - SURFACE
    )
    :vars
    (
      ?auto_1730886 - HOIST
      ?auto_1730887 - PLACE
      ?auto_1730885 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1730886 ?auto_1730887 ) ( SURFACE-AT ?auto_1730883 ?auto_1730887 ) ( CLEAR ?auto_1730883 ) ( IS-CRATE ?auto_1730884 ) ( not ( = ?auto_1730883 ?auto_1730884 ) ) ( TRUCK-AT ?auto_1730885 ?auto_1730887 ) ( AVAILABLE ?auto_1730886 ) ( IN ?auto_1730884 ?auto_1730885 ) ( ON ?auto_1730883 ?auto_1730882 ) ( not ( = ?auto_1730882 ?auto_1730883 ) ) ( not ( = ?auto_1730882 ?auto_1730884 ) ) ( ON ?auto_1730875 ?auto_1730874 ) ( ON ?auto_1730876 ?auto_1730875 ) ( ON ?auto_1730873 ?auto_1730876 ) ( ON ?auto_1730877 ?auto_1730873 ) ( ON ?auto_1730879 ?auto_1730877 ) ( ON ?auto_1730878 ?auto_1730879 ) ( ON ?auto_1730880 ?auto_1730878 ) ( ON ?auto_1730881 ?auto_1730880 ) ( ON ?auto_1730882 ?auto_1730881 ) ( not ( = ?auto_1730874 ?auto_1730875 ) ) ( not ( = ?auto_1730874 ?auto_1730876 ) ) ( not ( = ?auto_1730874 ?auto_1730873 ) ) ( not ( = ?auto_1730874 ?auto_1730877 ) ) ( not ( = ?auto_1730874 ?auto_1730879 ) ) ( not ( = ?auto_1730874 ?auto_1730878 ) ) ( not ( = ?auto_1730874 ?auto_1730880 ) ) ( not ( = ?auto_1730874 ?auto_1730881 ) ) ( not ( = ?auto_1730874 ?auto_1730882 ) ) ( not ( = ?auto_1730874 ?auto_1730883 ) ) ( not ( = ?auto_1730874 ?auto_1730884 ) ) ( not ( = ?auto_1730875 ?auto_1730876 ) ) ( not ( = ?auto_1730875 ?auto_1730873 ) ) ( not ( = ?auto_1730875 ?auto_1730877 ) ) ( not ( = ?auto_1730875 ?auto_1730879 ) ) ( not ( = ?auto_1730875 ?auto_1730878 ) ) ( not ( = ?auto_1730875 ?auto_1730880 ) ) ( not ( = ?auto_1730875 ?auto_1730881 ) ) ( not ( = ?auto_1730875 ?auto_1730882 ) ) ( not ( = ?auto_1730875 ?auto_1730883 ) ) ( not ( = ?auto_1730875 ?auto_1730884 ) ) ( not ( = ?auto_1730876 ?auto_1730873 ) ) ( not ( = ?auto_1730876 ?auto_1730877 ) ) ( not ( = ?auto_1730876 ?auto_1730879 ) ) ( not ( = ?auto_1730876 ?auto_1730878 ) ) ( not ( = ?auto_1730876 ?auto_1730880 ) ) ( not ( = ?auto_1730876 ?auto_1730881 ) ) ( not ( = ?auto_1730876 ?auto_1730882 ) ) ( not ( = ?auto_1730876 ?auto_1730883 ) ) ( not ( = ?auto_1730876 ?auto_1730884 ) ) ( not ( = ?auto_1730873 ?auto_1730877 ) ) ( not ( = ?auto_1730873 ?auto_1730879 ) ) ( not ( = ?auto_1730873 ?auto_1730878 ) ) ( not ( = ?auto_1730873 ?auto_1730880 ) ) ( not ( = ?auto_1730873 ?auto_1730881 ) ) ( not ( = ?auto_1730873 ?auto_1730882 ) ) ( not ( = ?auto_1730873 ?auto_1730883 ) ) ( not ( = ?auto_1730873 ?auto_1730884 ) ) ( not ( = ?auto_1730877 ?auto_1730879 ) ) ( not ( = ?auto_1730877 ?auto_1730878 ) ) ( not ( = ?auto_1730877 ?auto_1730880 ) ) ( not ( = ?auto_1730877 ?auto_1730881 ) ) ( not ( = ?auto_1730877 ?auto_1730882 ) ) ( not ( = ?auto_1730877 ?auto_1730883 ) ) ( not ( = ?auto_1730877 ?auto_1730884 ) ) ( not ( = ?auto_1730879 ?auto_1730878 ) ) ( not ( = ?auto_1730879 ?auto_1730880 ) ) ( not ( = ?auto_1730879 ?auto_1730881 ) ) ( not ( = ?auto_1730879 ?auto_1730882 ) ) ( not ( = ?auto_1730879 ?auto_1730883 ) ) ( not ( = ?auto_1730879 ?auto_1730884 ) ) ( not ( = ?auto_1730878 ?auto_1730880 ) ) ( not ( = ?auto_1730878 ?auto_1730881 ) ) ( not ( = ?auto_1730878 ?auto_1730882 ) ) ( not ( = ?auto_1730878 ?auto_1730883 ) ) ( not ( = ?auto_1730878 ?auto_1730884 ) ) ( not ( = ?auto_1730880 ?auto_1730881 ) ) ( not ( = ?auto_1730880 ?auto_1730882 ) ) ( not ( = ?auto_1730880 ?auto_1730883 ) ) ( not ( = ?auto_1730880 ?auto_1730884 ) ) ( not ( = ?auto_1730881 ?auto_1730882 ) ) ( not ( = ?auto_1730881 ?auto_1730883 ) ) ( not ( = ?auto_1730881 ?auto_1730884 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1730882 ?auto_1730883 ?auto_1730884 )
      ( MAKE-11CRATE-VERIFY ?auto_1730874 ?auto_1730875 ?auto_1730876 ?auto_1730873 ?auto_1730877 ?auto_1730879 ?auto_1730878 ?auto_1730880 ?auto_1730881 ?auto_1730882 ?auto_1730883 ?auto_1730884 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1730995 - SURFACE
      ?auto_1730996 - SURFACE
      ?auto_1730997 - SURFACE
      ?auto_1730994 - SURFACE
      ?auto_1730998 - SURFACE
      ?auto_1731000 - SURFACE
      ?auto_1730999 - SURFACE
      ?auto_1731001 - SURFACE
      ?auto_1731002 - SURFACE
      ?auto_1731003 - SURFACE
      ?auto_1731004 - SURFACE
      ?auto_1731005 - SURFACE
    )
    :vars
    (
      ?auto_1731009 - HOIST
      ?auto_1731006 - PLACE
      ?auto_1731007 - TRUCK
      ?auto_1731008 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1731009 ?auto_1731006 ) ( SURFACE-AT ?auto_1731004 ?auto_1731006 ) ( CLEAR ?auto_1731004 ) ( IS-CRATE ?auto_1731005 ) ( not ( = ?auto_1731004 ?auto_1731005 ) ) ( AVAILABLE ?auto_1731009 ) ( IN ?auto_1731005 ?auto_1731007 ) ( ON ?auto_1731004 ?auto_1731003 ) ( not ( = ?auto_1731003 ?auto_1731004 ) ) ( not ( = ?auto_1731003 ?auto_1731005 ) ) ( TRUCK-AT ?auto_1731007 ?auto_1731008 ) ( not ( = ?auto_1731008 ?auto_1731006 ) ) ( ON ?auto_1730996 ?auto_1730995 ) ( ON ?auto_1730997 ?auto_1730996 ) ( ON ?auto_1730994 ?auto_1730997 ) ( ON ?auto_1730998 ?auto_1730994 ) ( ON ?auto_1731000 ?auto_1730998 ) ( ON ?auto_1730999 ?auto_1731000 ) ( ON ?auto_1731001 ?auto_1730999 ) ( ON ?auto_1731002 ?auto_1731001 ) ( ON ?auto_1731003 ?auto_1731002 ) ( not ( = ?auto_1730995 ?auto_1730996 ) ) ( not ( = ?auto_1730995 ?auto_1730997 ) ) ( not ( = ?auto_1730995 ?auto_1730994 ) ) ( not ( = ?auto_1730995 ?auto_1730998 ) ) ( not ( = ?auto_1730995 ?auto_1731000 ) ) ( not ( = ?auto_1730995 ?auto_1730999 ) ) ( not ( = ?auto_1730995 ?auto_1731001 ) ) ( not ( = ?auto_1730995 ?auto_1731002 ) ) ( not ( = ?auto_1730995 ?auto_1731003 ) ) ( not ( = ?auto_1730995 ?auto_1731004 ) ) ( not ( = ?auto_1730995 ?auto_1731005 ) ) ( not ( = ?auto_1730996 ?auto_1730997 ) ) ( not ( = ?auto_1730996 ?auto_1730994 ) ) ( not ( = ?auto_1730996 ?auto_1730998 ) ) ( not ( = ?auto_1730996 ?auto_1731000 ) ) ( not ( = ?auto_1730996 ?auto_1730999 ) ) ( not ( = ?auto_1730996 ?auto_1731001 ) ) ( not ( = ?auto_1730996 ?auto_1731002 ) ) ( not ( = ?auto_1730996 ?auto_1731003 ) ) ( not ( = ?auto_1730996 ?auto_1731004 ) ) ( not ( = ?auto_1730996 ?auto_1731005 ) ) ( not ( = ?auto_1730997 ?auto_1730994 ) ) ( not ( = ?auto_1730997 ?auto_1730998 ) ) ( not ( = ?auto_1730997 ?auto_1731000 ) ) ( not ( = ?auto_1730997 ?auto_1730999 ) ) ( not ( = ?auto_1730997 ?auto_1731001 ) ) ( not ( = ?auto_1730997 ?auto_1731002 ) ) ( not ( = ?auto_1730997 ?auto_1731003 ) ) ( not ( = ?auto_1730997 ?auto_1731004 ) ) ( not ( = ?auto_1730997 ?auto_1731005 ) ) ( not ( = ?auto_1730994 ?auto_1730998 ) ) ( not ( = ?auto_1730994 ?auto_1731000 ) ) ( not ( = ?auto_1730994 ?auto_1730999 ) ) ( not ( = ?auto_1730994 ?auto_1731001 ) ) ( not ( = ?auto_1730994 ?auto_1731002 ) ) ( not ( = ?auto_1730994 ?auto_1731003 ) ) ( not ( = ?auto_1730994 ?auto_1731004 ) ) ( not ( = ?auto_1730994 ?auto_1731005 ) ) ( not ( = ?auto_1730998 ?auto_1731000 ) ) ( not ( = ?auto_1730998 ?auto_1730999 ) ) ( not ( = ?auto_1730998 ?auto_1731001 ) ) ( not ( = ?auto_1730998 ?auto_1731002 ) ) ( not ( = ?auto_1730998 ?auto_1731003 ) ) ( not ( = ?auto_1730998 ?auto_1731004 ) ) ( not ( = ?auto_1730998 ?auto_1731005 ) ) ( not ( = ?auto_1731000 ?auto_1730999 ) ) ( not ( = ?auto_1731000 ?auto_1731001 ) ) ( not ( = ?auto_1731000 ?auto_1731002 ) ) ( not ( = ?auto_1731000 ?auto_1731003 ) ) ( not ( = ?auto_1731000 ?auto_1731004 ) ) ( not ( = ?auto_1731000 ?auto_1731005 ) ) ( not ( = ?auto_1730999 ?auto_1731001 ) ) ( not ( = ?auto_1730999 ?auto_1731002 ) ) ( not ( = ?auto_1730999 ?auto_1731003 ) ) ( not ( = ?auto_1730999 ?auto_1731004 ) ) ( not ( = ?auto_1730999 ?auto_1731005 ) ) ( not ( = ?auto_1731001 ?auto_1731002 ) ) ( not ( = ?auto_1731001 ?auto_1731003 ) ) ( not ( = ?auto_1731001 ?auto_1731004 ) ) ( not ( = ?auto_1731001 ?auto_1731005 ) ) ( not ( = ?auto_1731002 ?auto_1731003 ) ) ( not ( = ?auto_1731002 ?auto_1731004 ) ) ( not ( = ?auto_1731002 ?auto_1731005 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1731003 ?auto_1731004 ?auto_1731005 )
      ( MAKE-11CRATE-VERIFY ?auto_1730995 ?auto_1730996 ?auto_1730997 ?auto_1730994 ?auto_1730998 ?auto_1731000 ?auto_1730999 ?auto_1731001 ?auto_1731002 ?auto_1731003 ?auto_1731004 ?auto_1731005 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1731127 - SURFACE
      ?auto_1731128 - SURFACE
      ?auto_1731129 - SURFACE
      ?auto_1731126 - SURFACE
      ?auto_1731130 - SURFACE
      ?auto_1731132 - SURFACE
      ?auto_1731131 - SURFACE
      ?auto_1731133 - SURFACE
      ?auto_1731134 - SURFACE
      ?auto_1731135 - SURFACE
      ?auto_1731136 - SURFACE
      ?auto_1731137 - SURFACE
    )
    :vars
    (
      ?auto_1731141 - HOIST
      ?auto_1731140 - PLACE
      ?auto_1731139 - TRUCK
      ?auto_1731138 - PLACE
      ?auto_1731142 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1731141 ?auto_1731140 ) ( SURFACE-AT ?auto_1731136 ?auto_1731140 ) ( CLEAR ?auto_1731136 ) ( IS-CRATE ?auto_1731137 ) ( not ( = ?auto_1731136 ?auto_1731137 ) ) ( AVAILABLE ?auto_1731141 ) ( ON ?auto_1731136 ?auto_1731135 ) ( not ( = ?auto_1731135 ?auto_1731136 ) ) ( not ( = ?auto_1731135 ?auto_1731137 ) ) ( TRUCK-AT ?auto_1731139 ?auto_1731138 ) ( not ( = ?auto_1731138 ?auto_1731140 ) ) ( HOIST-AT ?auto_1731142 ?auto_1731138 ) ( LIFTING ?auto_1731142 ?auto_1731137 ) ( not ( = ?auto_1731141 ?auto_1731142 ) ) ( ON ?auto_1731128 ?auto_1731127 ) ( ON ?auto_1731129 ?auto_1731128 ) ( ON ?auto_1731126 ?auto_1731129 ) ( ON ?auto_1731130 ?auto_1731126 ) ( ON ?auto_1731132 ?auto_1731130 ) ( ON ?auto_1731131 ?auto_1731132 ) ( ON ?auto_1731133 ?auto_1731131 ) ( ON ?auto_1731134 ?auto_1731133 ) ( ON ?auto_1731135 ?auto_1731134 ) ( not ( = ?auto_1731127 ?auto_1731128 ) ) ( not ( = ?auto_1731127 ?auto_1731129 ) ) ( not ( = ?auto_1731127 ?auto_1731126 ) ) ( not ( = ?auto_1731127 ?auto_1731130 ) ) ( not ( = ?auto_1731127 ?auto_1731132 ) ) ( not ( = ?auto_1731127 ?auto_1731131 ) ) ( not ( = ?auto_1731127 ?auto_1731133 ) ) ( not ( = ?auto_1731127 ?auto_1731134 ) ) ( not ( = ?auto_1731127 ?auto_1731135 ) ) ( not ( = ?auto_1731127 ?auto_1731136 ) ) ( not ( = ?auto_1731127 ?auto_1731137 ) ) ( not ( = ?auto_1731128 ?auto_1731129 ) ) ( not ( = ?auto_1731128 ?auto_1731126 ) ) ( not ( = ?auto_1731128 ?auto_1731130 ) ) ( not ( = ?auto_1731128 ?auto_1731132 ) ) ( not ( = ?auto_1731128 ?auto_1731131 ) ) ( not ( = ?auto_1731128 ?auto_1731133 ) ) ( not ( = ?auto_1731128 ?auto_1731134 ) ) ( not ( = ?auto_1731128 ?auto_1731135 ) ) ( not ( = ?auto_1731128 ?auto_1731136 ) ) ( not ( = ?auto_1731128 ?auto_1731137 ) ) ( not ( = ?auto_1731129 ?auto_1731126 ) ) ( not ( = ?auto_1731129 ?auto_1731130 ) ) ( not ( = ?auto_1731129 ?auto_1731132 ) ) ( not ( = ?auto_1731129 ?auto_1731131 ) ) ( not ( = ?auto_1731129 ?auto_1731133 ) ) ( not ( = ?auto_1731129 ?auto_1731134 ) ) ( not ( = ?auto_1731129 ?auto_1731135 ) ) ( not ( = ?auto_1731129 ?auto_1731136 ) ) ( not ( = ?auto_1731129 ?auto_1731137 ) ) ( not ( = ?auto_1731126 ?auto_1731130 ) ) ( not ( = ?auto_1731126 ?auto_1731132 ) ) ( not ( = ?auto_1731126 ?auto_1731131 ) ) ( not ( = ?auto_1731126 ?auto_1731133 ) ) ( not ( = ?auto_1731126 ?auto_1731134 ) ) ( not ( = ?auto_1731126 ?auto_1731135 ) ) ( not ( = ?auto_1731126 ?auto_1731136 ) ) ( not ( = ?auto_1731126 ?auto_1731137 ) ) ( not ( = ?auto_1731130 ?auto_1731132 ) ) ( not ( = ?auto_1731130 ?auto_1731131 ) ) ( not ( = ?auto_1731130 ?auto_1731133 ) ) ( not ( = ?auto_1731130 ?auto_1731134 ) ) ( not ( = ?auto_1731130 ?auto_1731135 ) ) ( not ( = ?auto_1731130 ?auto_1731136 ) ) ( not ( = ?auto_1731130 ?auto_1731137 ) ) ( not ( = ?auto_1731132 ?auto_1731131 ) ) ( not ( = ?auto_1731132 ?auto_1731133 ) ) ( not ( = ?auto_1731132 ?auto_1731134 ) ) ( not ( = ?auto_1731132 ?auto_1731135 ) ) ( not ( = ?auto_1731132 ?auto_1731136 ) ) ( not ( = ?auto_1731132 ?auto_1731137 ) ) ( not ( = ?auto_1731131 ?auto_1731133 ) ) ( not ( = ?auto_1731131 ?auto_1731134 ) ) ( not ( = ?auto_1731131 ?auto_1731135 ) ) ( not ( = ?auto_1731131 ?auto_1731136 ) ) ( not ( = ?auto_1731131 ?auto_1731137 ) ) ( not ( = ?auto_1731133 ?auto_1731134 ) ) ( not ( = ?auto_1731133 ?auto_1731135 ) ) ( not ( = ?auto_1731133 ?auto_1731136 ) ) ( not ( = ?auto_1731133 ?auto_1731137 ) ) ( not ( = ?auto_1731134 ?auto_1731135 ) ) ( not ( = ?auto_1731134 ?auto_1731136 ) ) ( not ( = ?auto_1731134 ?auto_1731137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1731135 ?auto_1731136 ?auto_1731137 )
      ( MAKE-11CRATE-VERIFY ?auto_1731127 ?auto_1731128 ?auto_1731129 ?auto_1731126 ?auto_1731130 ?auto_1731132 ?auto_1731131 ?auto_1731133 ?auto_1731134 ?auto_1731135 ?auto_1731136 ?auto_1731137 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1731270 - SURFACE
      ?auto_1731271 - SURFACE
      ?auto_1731272 - SURFACE
      ?auto_1731269 - SURFACE
      ?auto_1731273 - SURFACE
      ?auto_1731275 - SURFACE
      ?auto_1731274 - SURFACE
      ?auto_1731276 - SURFACE
      ?auto_1731277 - SURFACE
      ?auto_1731278 - SURFACE
      ?auto_1731279 - SURFACE
      ?auto_1731280 - SURFACE
    )
    :vars
    (
      ?auto_1731281 - HOIST
      ?auto_1731282 - PLACE
      ?auto_1731284 - TRUCK
      ?auto_1731286 - PLACE
      ?auto_1731283 - HOIST
      ?auto_1731285 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1731281 ?auto_1731282 ) ( SURFACE-AT ?auto_1731279 ?auto_1731282 ) ( CLEAR ?auto_1731279 ) ( IS-CRATE ?auto_1731280 ) ( not ( = ?auto_1731279 ?auto_1731280 ) ) ( AVAILABLE ?auto_1731281 ) ( ON ?auto_1731279 ?auto_1731278 ) ( not ( = ?auto_1731278 ?auto_1731279 ) ) ( not ( = ?auto_1731278 ?auto_1731280 ) ) ( TRUCK-AT ?auto_1731284 ?auto_1731286 ) ( not ( = ?auto_1731286 ?auto_1731282 ) ) ( HOIST-AT ?auto_1731283 ?auto_1731286 ) ( not ( = ?auto_1731281 ?auto_1731283 ) ) ( AVAILABLE ?auto_1731283 ) ( SURFACE-AT ?auto_1731280 ?auto_1731286 ) ( ON ?auto_1731280 ?auto_1731285 ) ( CLEAR ?auto_1731280 ) ( not ( = ?auto_1731279 ?auto_1731285 ) ) ( not ( = ?auto_1731280 ?auto_1731285 ) ) ( not ( = ?auto_1731278 ?auto_1731285 ) ) ( ON ?auto_1731271 ?auto_1731270 ) ( ON ?auto_1731272 ?auto_1731271 ) ( ON ?auto_1731269 ?auto_1731272 ) ( ON ?auto_1731273 ?auto_1731269 ) ( ON ?auto_1731275 ?auto_1731273 ) ( ON ?auto_1731274 ?auto_1731275 ) ( ON ?auto_1731276 ?auto_1731274 ) ( ON ?auto_1731277 ?auto_1731276 ) ( ON ?auto_1731278 ?auto_1731277 ) ( not ( = ?auto_1731270 ?auto_1731271 ) ) ( not ( = ?auto_1731270 ?auto_1731272 ) ) ( not ( = ?auto_1731270 ?auto_1731269 ) ) ( not ( = ?auto_1731270 ?auto_1731273 ) ) ( not ( = ?auto_1731270 ?auto_1731275 ) ) ( not ( = ?auto_1731270 ?auto_1731274 ) ) ( not ( = ?auto_1731270 ?auto_1731276 ) ) ( not ( = ?auto_1731270 ?auto_1731277 ) ) ( not ( = ?auto_1731270 ?auto_1731278 ) ) ( not ( = ?auto_1731270 ?auto_1731279 ) ) ( not ( = ?auto_1731270 ?auto_1731280 ) ) ( not ( = ?auto_1731270 ?auto_1731285 ) ) ( not ( = ?auto_1731271 ?auto_1731272 ) ) ( not ( = ?auto_1731271 ?auto_1731269 ) ) ( not ( = ?auto_1731271 ?auto_1731273 ) ) ( not ( = ?auto_1731271 ?auto_1731275 ) ) ( not ( = ?auto_1731271 ?auto_1731274 ) ) ( not ( = ?auto_1731271 ?auto_1731276 ) ) ( not ( = ?auto_1731271 ?auto_1731277 ) ) ( not ( = ?auto_1731271 ?auto_1731278 ) ) ( not ( = ?auto_1731271 ?auto_1731279 ) ) ( not ( = ?auto_1731271 ?auto_1731280 ) ) ( not ( = ?auto_1731271 ?auto_1731285 ) ) ( not ( = ?auto_1731272 ?auto_1731269 ) ) ( not ( = ?auto_1731272 ?auto_1731273 ) ) ( not ( = ?auto_1731272 ?auto_1731275 ) ) ( not ( = ?auto_1731272 ?auto_1731274 ) ) ( not ( = ?auto_1731272 ?auto_1731276 ) ) ( not ( = ?auto_1731272 ?auto_1731277 ) ) ( not ( = ?auto_1731272 ?auto_1731278 ) ) ( not ( = ?auto_1731272 ?auto_1731279 ) ) ( not ( = ?auto_1731272 ?auto_1731280 ) ) ( not ( = ?auto_1731272 ?auto_1731285 ) ) ( not ( = ?auto_1731269 ?auto_1731273 ) ) ( not ( = ?auto_1731269 ?auto_1731275 ) ) ( not ( = ?auto_1731269 ?auto_1731274 ) ) ( not ( = ?auto_1731269 ?auto_1731276 ) ) ( not ( = ?auto_1731269 ?auto_1731277 ) ) ( not ( = ?auto_1731269 ?auto_1731278 ) ) ( not ( = ?auto_1731269 ?auto_1731279 ) ) ( not ( = ?auto_1731269 ?auto_1731280 ) ) ( not ( = ?auto_1731269 ?auto_1731285 ) ) ( not ( = ?auto_1731273 ?auto_1731275 ) ) ( not ( = ?auto_1731273 ?auto_1731274 ) ) ( not ( = ?auto_1731273 ?auto_1731276 ) ) ( not ( = ?auto_1731273 ?auto_1731277 ) ) ( not ( = ?auto_1731273 ?auto_1731278 ) ) ( not ( = ?auto_1731273 ?auto_1731279 ) ) ( not ( = ?auto_1731273 ?auto_1731280 ) ) ( not ( = ?auto_1731273 ?auto_1731285 ) ) ( not ( = ?auto_1731275 ?auto_1731274 ) ) ( not ( = ?auto_1731275 ?auto_1731276 ) ) ( not ( = ?auto_1731275 ?auto_1731277 ) ) ( not ( = ?auto_1731275 ?auto_1731278 ) ) ( not ( = ?auto_1731275 ?auto_1731279 ) ) ( not ( = ?auto_1731275 ?auto_1731280 ) ) ( not ( = ?auto_1731275 ?auto_1731285 ) ) ( not ( = ?auto_1731274 ?auto_1731276 ) ) ( not ( = ?auto_1731274 ?auto_1731277 ) ) ( not ( = ?auto_1731274 ?auto_1731278 ) ) ( not ( = ?auto_1731274 ?auto_1731279 ) ) ( not ( = ?auto_1731274 ?auto_1731280 ) ) ( not ( = ?auto_1731274 ?auto_1731285 ) ) ( not ( = ?auto_1731276 ?auto_1731277 ) ) ( not ( = ?auto_1731276 ?auto_1731278 ) ) ( not ( = ?auto_1731276 ?auto_1731279 ) ) ( not ( = ?auto_1731276 ?auto_1731280 ) ) ( not ( = ?auto_1731276 ?auto_1731285 ) ) ( not ( = ?auto_1731277 ?auto_1731278 ) ) ( not ( = ?auto_1731277 ?auto_1731279 ) ) ( not ( = ?auto_1731277 ?auto_1731280 ) ) ( not ( = ?auto_1731277 ?auto_1731285 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1731278 ?auto_1731279 ?auto_1731280 )
      ( MAKE-11CRATE-VERIFY ?auto_1731270 ?auto_1731271 ?auto_1731272 ?auto_1731269 ?auto_1731273 ?auto_1731275 ?auto_1731274 ?auto_1731276 ?auto_1731277 ?auto_1731278 ?auto_1731279 ?auto_1731280 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1731414 - SURFACE
      ?auto_1731415 - SURFACE
      ?auto_1731416 - SURFACE
      ?auto_1731413 - SURFACE
      ?auto_1731417 - SURFACE
      ?auto_1731419 - SURFACE
      ?auto_1731418 - SURFACE
      ?auto_1731420 - SURFACE
      ?auto_1731421 - SURFACE
      ?auto_1731422 - SURFACE
      ?auto_1731423 - SURFACE
      ?auto_1731424 - SURFACE
    )
    :vars
    (
      ?auto_1731427 - HOIST
      ?auto_1731428 - PLACE
      ?auto_1731426 - PLACE
      ?auto_1731425 - HOIST
      ?auto_1731429 - SURFACE
      ?auto_1731430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1731427 ?auto_1731428 ) ( SURFACE-AT ?auto_1731423 ?auto_1731428 ) ( CLEAR ?auto_1731423 ) ( IS-CRATE ?auto_1731424 ) ( not ( = ?auto_1731423 ?auto_1731424 ) ) ( AVAILABLE ?auto_1731427 ) ( ON ?auto_1731423 ?auto_1731422 ) ( not ( = ?auto_1731422 ?auto_1731423 ) ) ( not ( = ?auto_1731422 ?auto_1731424 ) ) ( not ( = ?auto_1731426 ?auto_1731428 ) ) ( HOIST-AT ?auto_1731425 ?auto_1731426 ) ( not ( = ?auto_1731427 ?auto_1731425 ) ) ( AVAILABLE ?auto_1731425 ) ( SURFACE-AT ?auto_1731424 ?auto_1731426 ) ( ON ?auto_1731424 ?auto_1731429 ) ( CLEAR ?auto_1731424 ) ( not ( = ?auto_1731423 ?auto_1731429 ) ) ( not ( = ?auto_1731424 ?auto_1731429 ) ) ( not ( = ?auto_1731422 ?auto_1731429 ) ) ( TRUCK-AT ?auto_1731430 ?auto_1731428 ) ( ON ?auto_1731415 ?auto_1731414 ) ( ON ?auto_1731416 ?auto_1731415 ) ( ON ?auto_1731413 ?auto_1731416 ) ( ON ?auto_1731417 ?auto_1731413 ) ( ON ?auto_1731419 ?auto_1731417 ) ( ON ?auto_1731418 ?auto_1731419 ) ( ON ?auto_1731420 ?auto_1731418 ) ( ON ?auto_1731421 ?auto_1731420 ) ( ON ?auto_1731422 ?auto_1731421 ) ( not ( = ?auto_1731414 ?auto_1731415 ) ) ( not ( = ?auto_1731414 ?auto_1731416 ) ) ( not ( = ?auto_1731414 ?auto_1731413 ) ) ( not ( = ?auto_1731414 ?auto_1731417 ) ) ( not ( = ?auto_1731414 ?auto_1731419 ) ) ( not ( = ?auto_1731414 ?auto_1731418 ) ) ( not ( = ?auto_1731414 ?auto_1731420 ) ) ( not ( = ?auto_1731414 ?auto_1731421 ) ) ( not ( = ?auto_1731414 ?auto_1731422 ) ) ( not ( = ?auto_1731414 ?auto_1731423 ) ) ( not ( = ?auto_1731414 ?auto_1731424 ) ) ( not ( = ?auto_1731414 ?auto_1731429 ) ) ( not ( = ?auto_1731415 ?auto_1731416 ) ) ( not ( = ?auto_1731415 ?auto_1731413 ) ) ( not ( = ?auto_1731415 ?auto_1731417 ) ) ( not ( = ?auto_1731415 ?auto_1731419 ) ) ( not ( = ?auto_1731415 ?auto_1731418 ) ) ( not ( = ?auto_1731415 ?auto_1731420 ) ) ( not ( = ?auto_1731415 ?auto_1731421 ) ) ( not ( = ?auto_1731415 ?auto_1731422 ) ) ( not ( = ?auto_1731415 ?auto_1731423 ) ) ( not ( = ?auto_1731415 ?auto_1731424 ) ) ( not ( = ?auto_1731415 ?auto_1731429 ) ) ( not ( = ?auto_1731416 ?auto_1731413 ) ) ( not ( = ?auto_1731416 ?auto_1731417 ) ) ( not ( = ?auto_1731416 ?auto_1731419 ) ) ( not ( = ?auto_1731416 ?auto_1731418 ) ) ( not ( = ?auto_1731416 ?auto_1731420 ) ) ( not ( = ?auto_1731416 ?auto_1731421 ) ) ( not ( = ?auto_1731416 ?auto_1731422 ) ) ( not ( = ?auto_1731416 ?auto_1731423 ) ) ( not ( = ?auto_1731416 ?auto_1731424 ) ) ( not ( = ?auto_1731416 ?auto_1731429 ) ) ( not ( = ?auto_1731413 ?auto_1731417 ) ) ( not ( = ?auto_1731413 ?auto_1731419 ) ) ( not ( = ?auto_1731413 ?auto_1731418 ) ) ( not ( = ?auto_1731413 ?auto_1731420 ) ) ( not ( = ?auto_1731413 ?auto_1731421 ) ) ( not ( = ?auto_1731413 ?auto_1731422 ) ) ( not ( = ?auto_1731413 ?auto_1731423 ) ) ( not ( = ?auto_1731413 ?auto_1731424 ) ) ( not ( = ?auto_1731413 ?auto_1731429 ) ) ( not ( = ?auto_1731417 ?auto_1731419 ) ) ( not ( = ?auto_1731417 ?auto_1731418 ) ) ( not ( = ?auto_1731417 ?auto_1731420 ) ) ( not ( = ?auto_1731417 ?auto_1731421 ) ) ( not ( = ?auto_1731417 ?auto_1731422 ) ) ( not ( = ?auto_1731417 ?auto_1731423 ) ) ( not ( = ?auto_1731417 ?auto_1731424 ) ) ( not ( = ?auto_1731417 ?auto_1731429 ) ) ( not ( = ?auto_1731419 ?auto_1731418 ) ) ( not ( = ?auto_1731419 ?auto_1731420 ) ) ( not ( = ?auto_1731419 ?auto_1731421 ) ) ( not ( = ?auto_1731419 ?auto_1731422 ) ) ( not ( = ?auto_1731419 ?auto_1731423 ) ) ( not ( = ?auto_1731419 ?auto_1731424 ) ) ( not ( = ?auto_1731419 ?auto_1731429 ) ) ( not ( = ?auto_1731418 ?auto_1731420 ) ) ( not ( = ?auto_1731418 ?auto_1731421 ) ) ( not ( = ?auto_1731418 ?auto_1731422 ) ) ( not ( = ?auto_1731418 ?auto_1731423 ) ) ( not ( = ?auto_1731418 ?auto_1731424 ) ) ( not ( = ?auto_1731418 ?auto_1731429 ) ) ( not ( = ?auto_1731420 ?auto_1731421 ) ) ( not ( = ?auto_1731420 ?auto_1731422 ) ) ( not ( = ?auto_1731420 ?auto_1731423 ) ) ( not ( = ?auto_1731420 ?auto_1731424 ) ) ( not ( = ?auto_1731420 ?auto_1731429 ) ) ( not ( = ?auto_1731421 ?auto_1731422 ) ) ( not ( = ?auto_1731421 ?auto_1731423 ) ) ( not ( = ?auto_1731421 ?auto_1731424 ) ) ( not ( = ?auto_1731421 ?auto_1731429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1731422 ?auto_1731423 ?auto_1731424 )
      ( MAKE-11CRATE-VERIFY ?auto_1731414 ?auto_1731415 ?auto_1731416 ?auto_1731413 ?auto_1731417 ?auto_1731419 ?auto_1731418 ?auto_1731420 ?auto_1731421 ?auto_1731422 ?auto_1731423 ?auto_1731424 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1731558 - SURFACE
      ?auto_1731559 - SURFACE
      ?auto_1731560 - SURFACE
      ?auto_1731557 - SURFACE
      ?auto_1731561 - SURFACE
      ?auto_1731563 - SURFACE
      ?auto_1731562 - SURFACE
      ?auto_1731564 - SURFACE
      ?auto_1731565 - SURFACE
      ?auto_1731566 - SURFACE
      ?auto_1731567 - SURFACE
      ?auto_1731568 - SURFACE
    )
    :vars
    (
      ?auto_1731571 - HOIST
      ?auto_1731573 - PLACE
      ?auto_1731574 - PLACE
      ?auto_1731572 - HOIST
      ?auto_1731569 - SURFACE
      ?auto_1731570 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1731571 ?auto_1731573 ) ( IS-CRATE ?auto_1731568 ) ( not ( = ?auto_1731567 ?auto_1731568 ) ) ( not ( = ?auto_1731566 ?auto_1731567 ) ) ( not ( = ?auto_1731566 ?auto_1731568 ) ) ( not ( = ?auto_1731574 ?auto_1731573 ) ) ( HOIST-AT ?auto_1731572 ?auto_1731574 ) ( not ( = ?auto_1731571 ?auto_1731572 ) ) ( AVAILABLE ?auto_1731572 ) ( SURFACE-AT ?auto_1731568 ?auto_1731574 ) ( ON ?auto_1731568 ?auto_1731569 ) ( CLEAR ?auto_1731568 ) ( not ( = ?auto_1731567 ?auto_1731569 ) ) ( not ( = ?auto_1731568 ?auto_1731569 ) ) ( not ( = ?auto_1731566 ?auto_1731569 ) ) ( TRUCK-AT ?auto_1731570 ?auto_1731573 ) ( SURFACE-AT ?auto_1731566 ?auto_1731573 ) ( CLEAR ?auto_1731566 ) ( LIFTING ?auto_1731571 ?auto_1731567 ) ( IS-CRATE ?auto_1731567 ) ( ON ?auto_1731559 ?auto_1731558 ) ( ON ?auto_1731560 ?auto_1731559 ) ( ON ?auto_1731557 ?auto_1731560 ) ( ON ?auto_1731561 ?auto_1731557 ) ( ON ?auto_1731563 ?auto_1731561 ) ( ON ?auto_1731562 ?auto_1731563 ) ( ON ?auto_1731564 ?auto_1731562 ) ( ON ?auto_1731565 ?auto_1731564 ) ( ON ?auto_1731566 ?auto_1731565 ) ( not ( = ?auto_1731558 ?auto_1731559 ) ) ( not ( = ?auto_1731558 ?auto_1731560 ) ) ( not ( = ?auto_1731558 ?auto_1731557 ) ) ( not ( = ?auto_1731558 ?auto_1731561 ) ) ( not ( = ?auto_1731558 ?auto_1731563 ) ) ( not ( = ?auto_1731558 ?auto_1731562 ) ) ( not ( = ?auto_1731558 ?auto_1731564 ) ) ( not ( = ?auto_1731558 ?auto_1731565 ) ) ( not ( = ?auto_1731558 ?auto_1731566 ) ) ( not ( = ?auto_1731558 ?auto_1731567 ) ) ( not ( = ?auto_1731558 ?auto_1731568 ) ) ( not ( = ?auto_1731558 ?auto_1731569 ) ) ( not ( = ?auto_1731559 ?auto_1731560 ) ) ( not ( = ?auto_1731559 ?auto_1731557 ) ) ( not ( = ?auto_1731559 ?auto_1731561 ) ) ( not ( = ?auto_1731559 ?auto_1731563 ) ) ( not ( = ?auto_1731559 ?auto_1731562 ) ) ( not ( = ?auto_1731559 ?auto_1731564 ) ) ( not ( = ?auto_1731559 ?auto_1731565 ) ) ( not ( = ?auto_1731559 ?auto_1731566 ) ) ( not ( = ?auto_1731559 ?auto_1731567 ) ) ( not ( = ?auto_1731559 ?auto_1731568 ) ) ( not ( = ?auto_1731559 ?auto_1731569 ) ) ( not ( = ?auto_1731560 ?auto_1731557 ) ) ( not ( = ?auto_1731560 ?auto_1731561 ) ) ( not ( = ?auto_1731560 ?auto_1731563 ) ) ( not ( = ?auto_1731560 ?auto_1731562 ) ) ( not ( = ?auto_1731560 ?auto_1731564 ) ) ( not ( = ?auto_1731560 ?auto_1731565 ) ) ( not ( = ?auto_1731560 ?auto_1731566 ) ) ( not ( = ?auto_1731560 ?auto_1731567 ) ) ( not ( = ?auto_1731560 ?auto_1731568 ) ) ( not ( = ?auto_1731560 ?auto_1731569 ) ) ( not ( = ?auto_1731557 ?auto_1731561 ) ) ( not ( = ?auto_1731557 ?auto_1731563 ) ) ( not ( = ?auto_1731557 ?auto_1731562 ) ) ( not ( = ?auto_1731557 ?auto_1731564 ) ) ( not ( = ?auto_1731557 ?auto_1731565 ) ) ( not ( = ?auto_1731557 ?auto_1731566 ) ) ( not ( = ?auto_1731557 ?auto_1731567 ) ) ( not ( = ?auto_1731557 ?auto_1731568 ) ) ( not ( = ?auto_1731557 ?auto_1731569 ) ) ( not ( = ?auto_1731561 ?auto_1731563 ) ) ( not ( = ?auto_1731561 ?auto_1731562 ) ) ( not ( = ?auto_1731561 ?auto_1731564 ) ) ( not ( = ?auto_1731561 ?auto_1731565 ) ) ( not ( = ?auto_1731561 ?auto_1731566 ) ) ( not ( = ?auto_1731561 ?auto_1731567 ) ) ( not ( = ?auto_1731561 ?auto_1731568 ) ) ( not ( = ?auto_1731561 ?auto_1731569 ) ) ( not ( = ?auto_1731563 ?auto_1731562 ) ) ( not ( = ?auto_1731563 ?auto_1731564 ) ) ( not ( = ?auto_1731563 ?auto_1731565 ) ) ( not ( = ?auto_1731563 ?auto_1731566 ) ) ( not ( = ?auto_1731563 ?auto_1731567 ) ) ( not ( = ?auto_1731563 ?auto_1731568 ) ) ( not ( = ?auto_1731563 ?auto_1731569 ) ) ( not ( = ?auto_1731562 ?auto_1731564 ) ) ( not ( = ?auto_1731562 ?auto_1731565 ) ) ( not ( = ?auto_1731562 ?auto_1731566 ) ) ( not ( = ?auto_1731562 ?auto_1731567 ) ) ( not ( = ?auto_1731562 ?auto_1731568 ) ) ( not ( = ?auto_1731562 ?auto_1731569 ) ) ( not ( = ?auto_1731564 ?auto_1731565 ) ) ( not ( = ?auto_1731564 ?auto_1731566 ) ) ( not ( = ?auto_1731564 ?auto_1731567 ) ) ( not ( = ?auto_1731564 ?auto_1731568 ) ) ( not ( = ?auto_1731564 ?auto_1731569 ) ) ( not ( = ?auto_1731565 ?auto_1731566 ) ) ( not ( = ?auto_1731565 ?auto_1731567 ) ) ( not ( = ?auto_1731565 ?auto_1731568 ) ) ( not ( = ?auto_1731565 ?auto_1731569 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1731566 ?auto_1731567 ?auto_1731568 )
      ( MAKE-11CRATE-VERIFY ?auto_1731558 ?auto_1731559 ?auto_1731560 ?auto_1731557 ?auto_1731561 ?auto_1731563 ?auto_1731562 ?auto_1731564 ?auto_1731565 ?auto_1731566 ?auto_1731567 ?auto_1731568 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1731702 - SURFACE
      ?auto_1731703 - SURFACE
      ?auto_1731704 - SURFACE
      ?auto_1731701 - SURFACE
      ?auto_1731705 - SURFACE
      ?auto_1731707 - SURFACE
      ?auto_1731706 - SURFACE
      ?auto_1731708 - SURFACE
      ?auto_1731709 - SURFACE
      ?auto_1731710 - SURFACE
      ?auto_1731711 - SURFACE
      ?auto_1731712 - SURFACE
    )
    :vars
    (
      ?auto_1731713 - HOIST
      ?auto_1731716 - PLACE
      ?auto_1731717 - PLACE
      ?auto_1731715 - HOIST
      ?auto_1731718 - SURFACE
      ?auto_1731714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1731713 ?auto_1731716 ) ( IS-CRATE ?auto_1731712 ) ( not ( = ?auto_1731711 ?auto_1731712 ) ) ( not ( = ?auto_1731710 ?auto_1731711 ) ) ( not ( = ?auto_1731710 ?auto_1731712 ) ) ( not ( = ?auto_1731717 ?auto_1731716 ) ) ( HOIST-AT ?auto_1731715 ?auto_1731717 ) ( not ( = ?auto_1731713 ?auto_1731715 ) ) ( AVAILABLE ?auto_1731715 ) ( SURFACE-AT ?auto_1731712 ?auto_1731717 ) ( ON ?auto_1731712 ?auto_1731718 ) ( CLEAR ?auto_1731712 ) ( not ( = ?auto_1731711 ?auto_1731718 ) ) ( not ( = ?auto_1731712 ?auto_1731718 ) ) ( not ( = ?auto_1731710 ?auto_1731718 ) ) ( TRUCK-AT ?auto_1731714 ?auto_1731716 ) ( SURFACE-AT ?auto_1731710 ?auto_1731716 ) ( CLEAR ?auto_1731710 ) ( IS-CRATE ?auto_1731711 ) ( AVAILABLE ?auto_1731713 ) ( IN ?auto_1731711 ?auto_1731714 ) ( ON ?auto_1731703 ?auto_1731702 ) ( ON ?auto_1731704 ?auto_1731703 ) ( ON ?auto_1731701 ?auto_1731704 ) ( ON ?auto_1731705 ?auto_1731701 ) ( ON ?auto_1731707 ?auto_1731705 ) ( ON ?auto_1731706 ?auto_1731707 ) ( ON ?auto_1731708 ?auto_1731706 ) ( ON ?auto_1731709 ?auto_1731708 ) ( ON ?auto_1731710 ?auto_1731709 ) ( not ( = ?auto_1731702 ?auto_1731703 ) ) ( not ( = ?auto_1731702 ?auto_1731704 ) ) ( not ( = ?auto_1731702 ?auto_1731701 ) ) ( not ( = ?auto_1731702 ?auto_1731705 ) ) ( not ( = ?auto_1731702 ?auto_1731707 ) ) ( not ( = ?auto_1731702 ?auto_1731706 ) ) ( not ( = ?auto_1731702 ?auto_1731708 ) ) ( not ( = ?auto_1731702 ?auto_1731709 ) ) ( not ( = ?auto_1731702 ?auto_1731710 ) ) ( not ( = ?auto_1731702 ?auto_1731711 ) ) ( not ( = ?auto_1731702 ?auto_1731712 ) ) ( not ( = ?auto_1731702 ?auto_1731718 ) ) ( not ( = ?auto_1731703 ?auto_1731704 ) ) ( not ( = ?auto_1731703 ?auto_1731701 ) ) ( not ( = ?auto_1731703 ?auto_1731705 ) ) ( not ( = ?auto_1731703 ?auto_1731707 ) ) ( not ( = ?auto_1731703 ?auto_1731706 ) ) ( not ( = ?auto_1731703 ?auto_1731708 ) ) ( not ( = ?auto_1731703 ?auto_1731709 ) ) ( not ( = ?auto_1731703 ?auto_1731710 ) ) ( not ( = ?auto_1731703 ?auto_1731711 ) ) ( not ( = ?auto_1731703 ?auto_1731712 ) ) ( not ( = ?auto_1731703 ?auto_1731718 ) ) ( not ( = ?auto_1731704 ?auto_1731701 ) ) ( not ( = ?auto_1731704 ?auto_1731705 ) ) ( not ( = ?auto_1731704 ?auto_1731707 ) ) ( not ( = ?auto_1731704 ?auto_1731706 ) ) ( not ( = ?auto_1731704 ?auto_1731708 ) ) ( not ( = ?auto_1731704 ?auto_1731709 ) ) ( not ( = ?auto_1731704 ?auto_1731710 ) ) ( not ( = ?auto_1731704 ?auto_1731711 ) ) ( not ( = ?auto_1731704 ?auto_1731712 ) ) ( not ( = ?auto_1731704 ?auto_1731718 ) ) ( not ( = ?auto_1731701 ?auto_1731705 ) ) ( not ( = ?auto_1731701 ?auto_1731707 ) ) ( not ( = ?auto_1731701 ?auto_1731706 ) ) ( not ( = ?auto_1731701 ?auto_1731708 ) ) ( not ( = ?auto_1731701 ?auto_1731709 ) ) ( not ( = ?auto_1731701 ?auto_1731710 ) ) ( not ( = ?auto_1731701 ?auto_1731711 ) ) ( not ( = ?auto_1731701 ?auto_1731712 ) ) ( not ( = ?auto_1731701 ?auto_1731718 ) ) ( not ( = ?auto_1731705 ?auto_1731707 ) ) ( not ( = ?auto_1731705 ?auto_1731706 ) ) ( not ( = ?auto_1731705 ?auto_1731708 ) ) ( not ( = ?auto_1731705 ?auto_1731709 ) ) ( not ( = ?auto_1731705 ?auto_1731710 ) ) ( not ( = ?auto_1731705 ?auto_1731711 ) ) ( not ( = ?auto_1731705 ?auto_1731712 ) ) ( not ( = ?auto_1731705 ?auto_1731718 ) ) ( not ( = ?auto_1731707 ?auto_1731706 ) ) ( not ( = ?auto_1731707 ?auto_1731708 ) ) ( not ( = ?auto_1731707 ?auto_1731709 ) ) ( not ( = ?auto_1731707 ?auto_1731710 ) ) ( not ( = ?auto_1731707 ?auto_1731711 ) ) ( not ( = ?auto_1731707 ?auto_1731712 ) ) ( not ( = ?auto_1731707 ?auto_1731718 ) ) ( not ( = ?auto_1731706 ?auto_1731708 ) ) ( not ( = ?auto_1731706 ?auto_1731709 ) ) ( not ( = ?auto_1731706 ?auto_1731710 ) ) ( not ( = ?auto_1731706 ?auto_1731711 ) ) ( not ( = ?auto_1731706 ?auto_1731712 ) ) ( not ( = ?auto_1731706 ?auto_1731718 ) ) ( not ( = ?auto_1731708 ?auto_1731709 ) ) ( not ( = ?auto_1731708 ?auto_1731710 ) ) ( not ( = ?auto_1731708 ?auto_1731711 ) ) ( not ( = ?auto_1731708 ?auto_1731712 ) ) ( not ( = ?auto_1731708 ?auto_1731718 ) ) ( not ( = ?auto_1731709 ?auto_1731710 ) ) ( not ( = ?auto_1731709 ?auto_1731711 ) ) ( not ( = ?auto_1731709 ?auto_1731712 ) ) ( not ( = ?auto_1731709 ?auto_1731718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1731710 ?auto_1731711 ?auto_1731712 )
      ( MAKE-11CRATE-VERIFY ?auto_1731702 ?auto_1731703 ?auto_1731704 ?auto_1731701 ?auto_1731705 ?auto_1731707 ?auto_1731706 ?auto_1731708 ?auto_1731709 ?auto_1731710 ?auto_1731711 ?auto_1731712 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1740970 - SURFACE
      ?auto_1740971 - SURFACE
      ?auto_1740972 - SURFACE
      ?auto_1740969 - SURFACE
      ?auto_1740973 - SURFACE
      ?auto_1740975 - SURFACE
      ?auto_1740974 - SURFACE
      ?auto_1740976 - SURFACE
      ?auto_1740977 - SURFACE
      ?auto_1740978 - SURFACE
      ?auto_1740979 - SURFACE
      ?auto_1740980 - SURFACE
      ?auto_1740981 - SURFACE
    )
    :vars
    (
      ?auto_1740982 - HOIST
      ?auto_1740983 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1740982 ?auto_1740983 ) ( SURFACE-AT ?auto_1740980 ?auto_1740983 ) ( CLEAR ?auto_1740980 ) ( LIFTING ?auto_1740982 ?auto_1740981 ) ( IS-CRATE ?auto_1740981 ) ( not ( = ?auto_1740980 ?auto_1740981 ) ) ( ON ?auto_1740971 ?auto_1740970 ) ( ON ?auto_1740972 ?auto_1740971 ) ( ON ?auto_1740969 ?auto_1740972 ) ( ON ?auto_1740973 ?auto_1740969 ) ( ON ?auto_1740975 ?auto_1740973 ) ( ON ?auto_1740974 ?auto_1740975 ) ( ON ?auto_1740976 ?auto_1740974 ) ( ON ?auto_1740977 ?auto_1740976 ) ( ON ?auto_1740978 ?auto_1740977 ) ( ON ?auto_1740979 ?auto_1740978 ) ( ON ?auto_1740980 ?auto_1740979 ) ( not ( = ?auto_1740970 ?auto_1740971 ) ) ( not ( = ?auto_1740970 ?auto_1740972 ) ) ( not ( = ?auto_1740970 ?auto_1740969 ) ) ( not ( = ?auto_1740970 ?auto_1740973 ) ) ( not ( = ?auto_1740970 ?auto_1740975 ) ) ( not ( = ?auto_1740970 ?auto_1740974 ) ) ( not ( = ?auto_1740970 ?auto_1740976 ) ) ( not ( = ?auto_1740970 ?auto_1740977 ) ) ( not ( = ?auto_1740970 ?auto_1740978 ) ) ( not ( = ?auto_1740970 ?auto_1740979 ) ) ( not ( = ?auto_1740970 ?auto_1740980 ) ) ( not ( = ?auto_1740970 ?auto_1740981 ) ) ( not ( = ?auto_1740971 ?auto_1740972 ) ) ( not ( = ?auto_1740971 ?auto_1740969 ) ) ( not ( = ?auto_1740971 ?auto_1740973 ) ) ( not ( = ?auto_1740971 ?auto_1740975 ) ) ( not ( = ?auto_1740971 ?auto_1740974 ) ) ( not ( = ?auto_1740971 ?auto_1740976 ) ) ( not ( = ?auto_1740971 ?auto_1740977 ) ) ( not ( = ?auto_1740971 ?auto_1740978 ) ) ( not ( = ?auto_1740971 ?auto_1740979 ) ) ( not ( = ?auto_1740971 ?auto_1740980 ) ) ( not ( = ?auto_1740971 ?auto_1740981 ) ) ( not ( = ?auto_1740972 ?auto_1740969 ) ) ( not ( = ?auto_1740972 ?auto_1740973 ) ) ( not ( = ?auto_1740972 ?auto_1740975 ) ) ( not ( = ?auto_1740972 ?auto_1740974 ) ) ( not ( = ?auto_1740972 ?auto_1740976 ) ) ( not ( = ?auto_1740972 ?auto_1740977 ) ) ( not ( = ?auto_1740972 ?auto_1740978 ) ) ( not ( = ?auto_1740972 ?auto_1740979 ) ) ( not ( = ?auto_1740972 ?auto_1740980 ) ) ( not ( = ?auto_1740972 ?auto_1740981 ) ) ( not ( = ?auto_1740969 ?auto_1740973 ) ) ( not ( = ?auto_1740969 ?auto_1740975 ) ) ( not ( = ?auto_1740969 ?auto_1740974 ) ) ( not ( = ?auto_1740969 ?auto_1740976 ) ) ( not ( = ?auto_1740969 ?auto_1740977 ) ) ( not ( = ?auto_1740969 ?auto_1740978 ) ) ( not ( = ?auto_1740969 ?auto_1740979 ) ) ( not ( = ?auto_1740969 ?auto_1740980 ) ) ( not ( = ?auto_1740969 ?auto_1740981 ) ) ( not ( = ?auto_1740973 ?auto_1740975 ) ) ( not ( = ?auto_1740973 ?auto_1740974 ) ) ( not ( = ?auto_1740973 ?auto_1740976 ) ) ( not ( = ?auto_1740973 ?auto_1740977 ) ) ( not ( = ?auto_1740973 ?auto_1740978 ) ) ( not ( = ?auto_1740973 ?auto_1740979 ) ) ( not ( = ?auto_1740973 ?auto_1740980 ) ) ( not ( = ?auto_1740973 ?auto_1740981 ) ) ( not ( = ?auto_1740975 ?auto_1740974 ) ) ( not ( = ?auto_1740975 ?auto_1740976 ) ) ( not ( = ?auto_1740975 ?auto_1740977 ) ) ( not ( = ?auto_1740975 ?auto_1740978 ) ) ( not ( = ?auto_1740975 ?auto_1740979 ) ) ( not ( = ?auto_1740975 ?auto_1740980 ) ) ( not ( = ?auto_1740975 ?auto_1740981 ) ) ( not ( = ?auto_1740974 ?auto_1740976 ) ) ( not ( = ?auto_1740974 ?auto_1740977 ) ) ( not ( = ?auto_1740974 ?auto_1740978 ) ) ( not ( = ?auto_1740974 ?auto_1740979 ) ) ( not ( = ?auto_1740974 ?auto_1740980 ) ) ( not ( = ?auto_1740974 ?auto_1740981 ) ) ( not ( = ?auto_1740976 ?auto_1740977 ) ) ( not ( = ?auto_1740976 ?auto_1740978 ) ) ( not ( = ?auto_1740976 ?auto_1740979 ) ) ( not ( = ?auto_1740976 ?auto_1740980 ) ) ( not ( = ?auto_1740976 ?auto_1740981 ) ) ( not ( = ?auto_1740977 ?auto_1740978 ) ) ( not ( = ?auto_1740977 ?auto_1740979 ) ) ( not ( = ?auto_1740977 ?auto_1740980 ) ) ( not ( = ?auto_1740977 ?auto_1740981 ) ) ( not ( = ?auto_1740978 ?auto_1740979 ) ) ( not ( = ?auto_1740978 ?auto_1740980 ) ) ( not ( = ?auto_1740978 ?auto_1740981 ) ) ( not ( = ?auto_1740979 ?auto_1740980 ) ) ( not ( = ?auto_1740979 ?auto_1740981 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1740980 ?auto_1740981 )
      ( MAKE-12CRATE-VERIFY ?auto_1740970 ?auto_1740971 ?auto_1740972 ?auto_1740969 ?auto_1740973 ?auto_1740975 ?auto_1740974 ?auto_1740976 ?auto_1740977 ?auto_1740978 ?auto_1740979 ?auto_1740980 ?auto_1740981 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1741095 - SURFACE
      ?auto_1741096 - SURFACE
      ?auto_1741097 - SURFACE
      ?auto_1741094 - SURFACE
      ?auto_1741098 - SURFACE
      ?auto_1741100 - SURFACE
      ?auto_1741099 - SURFACE
      ?auto_1741101 - SURFACE
      ?auto_1741102 - SURFACE
      ?auto_1741103 - SURFACE
      ?auto_1741104 - SURFACE
      ?auto_1741105 - SURFACE
      ?auto_1741106 - SURFACE
    )
    :vars
    (
      ?auto_1741108 - HOIST
      ?auto_1741109 - PLACE
      ?auto_1741107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1741108 ?auto_1741109 ) ( SURFACE-AT ?auto_1741105 ?auto_1741109 ) ( CLEAR ?auto_1741105 ) ( IS-CRATE ?auto_1741106 ) ( not ( = ?auto_1741105 ?auto_1741106 ) ) ( TRUCK-AT ?auto_1741107 ?auto_1741109 ) ( AVAILABLE ?auto_1741108 ) ( IN ?auto_1741106 ?auto_1741107 ) ( ON ?auto_1741105 ?auto_1741104 ) ( not ( = ?auto_1741104 ?auto_1741105 ) ) ( not ( = ?auto_1741104 ?auto_1741106 ) ) ( ON ?auto_1741096 ?auto_1741095 ) ( ON ?auto_1741097 ?auto_1741096 ) ( ON ?auto_1741094 ?auto_1741097 ) ( ON ?auto_1741098 ?auto_1741094 ) ( ON ?auto_1741100 ?auto_1741098 ) ( ON ?auto_1741099 ?auto_1741100 ) ( ON ?auto_1741101 ?auto_1741099 ) ( ON ?auto_1741102 ?auto_1741101 ) ( ON ?auto_1741103 ?auto_1741102 ) ( ON ?auto_1741104 ?auto_1741103 ) ( not ( = ?auto_1741095 ?auto_1741096 ) ) ( not ( = ?auto_1741095 ?auto_1741097 ) ) ( not ( = ?auto_1741095 ?auto_1741094 ) ) ( not ( = ?auto_1741095 ?auto_1741098 ) ) ( not ( = ?auto_1741095 ?auto_1741100 ) ) ( not ( = ?auto_1741095 ?auto_1741099 ) ) ( not ( = ?auto_1741095 ?auto_1741101 ) ) ( not ( = ?auto_1741095 ?auto_1741102 ) ) ( not ( = ?auto_1741095 ?auto_1741103 ) ) ( not ( = ?auto_1741095 ?auto_1741104 ) ) ( not ( = ?auto_1741095 ?auto_1741105 ) ) ( not ( = ?auto_1741095 ?auto_1741106 ) ) ( not ( = ?auto_1741096 ?auto_1741097 ) ) ( not ( = ?auto_1741096 ?auto_1741094 ) ) ( not ( = ?auto_1741096 ?auto_1741098 ) ) ( not ( = ?auto_1741096 ?auto_1741100 ) ) ( not ( = ?auto_1741096 ?auto_1741099 ) ) ( not ( = ?auto_1741096 ?auto_1741101 ) ) ( not ( = ?auto_1741096 ?auto_1741102 ) ) ( not ( = ?auto_1741096 ?auto_1741103 ) ) ( not ( = ?auto_1741096 ?auto_1741104 ) ) ( not ( = ?auto_1741096 ?auto_1741105 ) ) ( not ( = ?auto_1741096 ?auto_1741106 ) ) ( not ( = ?auto_1741097 ?auto_1741094 ) ) ( not ( = ?auto_1741097 ?auto_1741098 ) ) ( not ( = ?auto_1741097 ?auto_1741100 ) ) ( not ( = ?auto_1741097 ?auto_1741099 ) ) ( not ( = ?auto_1741097 ?auto_1741101 ) ) ( not ( = ?auto_1741097 ?auto_1741102 ) ) ( not ( = ?auto_1741097 ?auto_1741103 ) ) ( not ( = ?auto_1741097 ?auto_1741104 ) ) ( not ( = ?auto_1741097 ?auto_1741105 ) ) ( not ( = ?auto_1741097 ?auto_1741106 ) ) ( not ( = ?auto_1741094 ?auto_1741098 ) ) ( not ( = ?auto_1741094 ?auto_1741100 ) ) ( not ( = ?auto_1741094 ?auto_1741099 ) ) ( not ( = ?auto_1741094 ?auto_1741101 ) ) ( not ( = ?auto_1741094 ?auto_1741102 ) ) ( not ( = ?auto_1741094 ?auto_1741103 ) ) ( not ( = ?auto_1741094 ?auto_1741104 ) ) ( not ( = ?auto_1741094 ?auto_1741105 ) ) ( not ( = ?auto_1741094 ?auto_1741106 ) ) ( not ( = ?auto_1741098 ?auto_1741100 ) ) ( not ( = ?auto_1741098 ?auto_1741099 ) ) ( not ( = ?auto_1741098 ?auto_1741101 ) ) ( not ( = ?auto_1741098 ?auto_1741102 ) ) ( not ( = ?auto_1741098 ?auto_1741103 ) ) ( not ( = ?auto_1741098 ?auto_1741104 ) ) ( not ( = ?auto_1741098 ?auto_1741105 ) ) ( not ( = ?auto_1741098 ?auto_1741106 ) ) ( not ( = ?auto_1741100 ?auto_1741099 ) ) ( not ( = ?auto_1741100 ?auto_1741101 ) ) ( not ( = ?auto_1741100 ?auto_1741102 ) ) ( not ( = ?auto_1741100 ?auto_1741103 ) ) ( not ( = ?auto_1741100 ?auto_1741104 ) ) ( not ( = ?auto_1741100 ?auto_1741105 ) ) ( not ( = ?auto_1741100 ?auto_1741106 ) ) ( not ( = ?auto_1741099 ?auto_1741101 ) ) ( not ( = ?auto_1741099 ?auto_1741102 ) ) ( not ( = ?auto_1741099 ?auto_1741103 ) ) ( not ( = ?auto_1741099 ?auto_1741104 ) ) ( not ( = ?auto_1741099 ?auto_1741105 ) ) ( not ( = ?auto_1741099 ?auto_1741106 ) ) ( not ( = ?auto_1741101 ?auto_1741102 ) ) ( not ( = ?auto_1741101 ?auto_1741103 ) ) ( not ( = ?auto_1741101 ?auto_1741104 ) ) ( not ( = ?auto_1741101 ?auto_1741105 ) ) ( not ( = ?auto_1741101 ?auto_1741106 ) ) ( not ( = ?auto_1741102 ?auto_1741103 ) ) ( not ( = ?auto_1741102 ?auto_1741104 ) ) ( not ( = ?auto_1741102 ?auto_1741105 ) ) ( not ( = ?auto_1741102 ?auto_1741106 ) ) ( not ( = ?auto_1741103 ?auto_1741104 ) ) ( not ( = ?auto_1741103 ?auto_1741105 ) ) ( not ( = ?auto_1741103 ?auto_1741106 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1741104 ?auto_1741105 ?auto_1741106 )
      ( MAKE-12CRATE-VERIFY ?auto_1741095 ?auto_1741096 ?auto_1741097 ?auto_1741094 ?auto_1741098 ?auto_1741100 ?auto_1741099 ?auto_1741101 ?auto_1741102 ?auto_1741103 ?auto_1741104 ?auto_1741105 ?auto_1741106 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1741233 - SURFACE
      ?auto_1741234 - SURFACE
      ?auto_1741235 - SURFACE
      ?auto_1741232 - SURFACE
      ?auto_1741236 - SURFACE
      ?auto_1741238 - SURFACE
      ?auto_1741237 - SURFACE
      ?auto_1741239 - SURFACE
      ?auto_1741240 - SURFACE
      ?auto_1741241 - SURFACE
      ?auto_1741242 - SURFACE
      ?auto_1741243 - SURFACE
      ?auto_1741244 - SURFACE
    )
    :vars
    (
      ?auto_1741248 - HOIST
      ?auto_1741246 - PLACE
      ?auto_1741247 - TRUCK
      ?auto_1741245 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1741248 ?auto_1741246 ) ( SURFACE-AT ?auto_1741243 ?auto_1741246 ) ( CLEAR ?auto_1741243 ) ( IS-CRATE ?auto_1741244 ) ( not ( = ?auto_1741243 ?auto_1741244 ) ) ( AVAILABLE ?auto_1741248 ) ( IN ?auto_1741244 ?auto_1741247 ) ( ON ?auto_1741243 ?auto_1741242 ) ( not ( = ?auto_1741242 ?auto_1741243 ) ) ( not ( = ?auto_1741242 ?auto_1741244 ) ) ( TRUCK-AT ?auto_1741247 ?auto_1741245 ) ( not ( = ?auto_1741245 ?auto_1741246 ) ) ( ON ?auto_1741234 ?auto_1741233 ) ( ON ?auto_1741235 ?auto_1741234 ) ( ON ?auto_1741232 ?auto_1741235 ) ( ON ?auto_1741236 ?auto_1741232 ) ( ON ?auto_1741238 ?auto_1741236 ) ( ON ?auto_1741237 ?auto_1741238 ) ( ON ?auto_1741239 ?auto_1741237 ) ( ON ?auto_1741240 ?auto_1741239 ) ( ON ?auto_1741241 ?auto_1741240 ) ( ON ?auto_1741242 ?auto_1741241 ) ( not ( = ?auto_1741233 ?auto_1741234 ) ) ( not ( = ?auto_1741233 ?auto_1741235 ) ) ( not ( = ?auto_1741233 ?auto_1741232 ) ) ( not ( = ?auto_1741233 ?auto_1741236 ) ) ( not ( = ?auto_1741233 ?auto_1741238 ) ) ( not ( = ?auto_1741233 ?auto_1741237 ) ) ( not ( = ?auto_1741233 ?auto_1741239 ) ) ( not ( = ?auto_1741233 ?auto_1741240 ) ) ( not ( = ?auto_1741233 ?auto_1741241 ) ) ( not ( = ?auto_1741233 ?auto_1741242 ) ) ( not ( = ?auto_1741233 ?auto_1741243 ) ) ( not ( = ?auto_1741233 ?auto_1741244 ) ) ( not ( = ?auto_1741234 ?auto_1741235 ) ) ( not ( = ?auto_1741234 ?auto_1741232 ) ) ( not ( = ?auto_1741234 ?auto_1741236 ) ) ( not ( = ?auto_1741234 ?auto_1741238 ) ) ( not ( = ?auto_1741234 ?auto_1741237 ) ) ( not ( = ?auto_1741234 ?auto_1741239 ) ) ( not ( = ?auto_1741234 ?auto_1741240 ) ) ( not ( = ?auto_1741234 ?auto_1741241 ) ) ( not ( = ?auto_1741234 ?auto_1741242 ) ) ( not ( = ?auto_1741234 ?auto_1741243 ) ) ( not ( = ?auto_1741234 ?auto_1741244 ) ) ( not ( = ?auto_1741235 ?auto_1741232 ) ) ( not ( = ?auto_1741235 ?auto_1741236 ) ) ( not ( = ?auto_1741235 ?auto_1741238 ) ) ( not ( = ?auto_1741235 ?auto_1741237 ) ) ( not ( = ?auto_1741235 ?auto_1741239 ) ) ( not ( = ?auto_1741235 ?auto_1741240 ) ) ( not ( = ?auto_1741235 ?auto_1741241 ) ) ( not ( = ?auto_1741235 ?auto_1741242 ) ) ( not ( = ?auto_1741235 ?auto_1741243 ) ) ( not ( = ?auto_1741235 ?auto_1741244 ) ) ( not ( = ?auto_1741232 ?auto_1741236 ) ) ( not ( = ?auto_1741232 ?auto_1741238 ) ) ( not ( = ?auto_1741232 ?auto_1741237 ) ) ( not ( = ?auto_1741232 ?auto_1741239 ) ) ( not ( = ?auto_1741232 ?auto_1741240 ) ) ( not ( = ?auto_1741232 ?auto_1741241 ) ) ( not ( = ?auto_1741232 ?auto_1741242 ) ) ( not ( = ?auto_1741232 ?auto_1741243 ) ) ( not ( = ?auto_1741232 ?auto_1741244 ) ) ( not ( = ?auto_1741236 ?auto_1741238 ) ) ( not ( = ?auto_1741236 ?auto_1741237 ) ) ( not ( = ?auto_1741236 ?auto_1741239 ) ) ( not ( = ?auto_1741236 ?auto_1741240 ) ) ( not ( = ?auto_1741236 ?auto_1741241 ) ) ( not ( = ?auto_1741236 ?auto_1741242 ) ) ( not ( = ?auto_1741236 ?auto_1741243 ) ) ( not ( = ?auto_1741236 ?auto_1741244 ) ) ( not ( = ?auto_1741238 ?auto_1741237 ) ) ( not ( = ?auto_1741238 ?auto_1741239 ) ) ( not ( = ?auto_1741238 ?auto_1741240 ) ) ( not ( = ?auto_1741238 ?auto_1741241 ) ) ( not ( = ?auto_1741238 ?auto_1741242 ) ) ( not ( = ?auto_1741238 ?auto_1741243 ) ) ( not ( = ?auto_1741238 ?auto_1741244 ) ) ( not ( = ?auto_1741237 ?auto_1741239 ) ) ( not ( = ?auto_1741237 ?auto_1741240 ) ) ( not ( = ?auto_1741237 ?auto_1741241 ) ) ( not ( = ?auto_1741237 ?auto_1741242 ) ) ( not ( = ?auto_1741237 ?auto_1741243 ) ) ( not ( = ?auto_1741237 ?auto_1741244 ) ) ( not ( = ?auto_1741239 ?auto_1741240 ) ) ( not ( = ?auto_1741239 ?auto_1741241 ) ) ( not ( = ?auto_1741239 ?auto_1741242 ) ) ( not ( = ?auto_1741239 ?auto_1741243 ) ) ( not ( = ?auto_1741239 ?auto_1741244 ) ) ( not ( = ?auto_1741240 ?auto_1741241 ) ) ( not ( = ?auto_1741240 ?auto_1741242 ) ) ( not ( = ?auto_1741240 ?auto_1741243 ) ) ( not ( = ?auto_1741240 ?auto_1741244 ) ) ( not ( = ?auto_1741241 ?auto_1741242 ) ) ( not ( = ?auto_1741241 ?auto_1741243 ) ) ( not ( = ?auto_1741241 ?auto_1741244 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1741242 ?auto_1741243 ?auto_1741244 )
      ( MAKE-12CRATE-VERIFY ?auto_1741233 ?auto_1741234 ?auto_1741235 ?auto_1741232 ?auto_1741236 ?auto_1741238 ?auto_1741237 ?auto_1741239 ?auto_1741240 ?auto_1741241 ?auto_1741242 ?auto_1741243 ?auto_1741244 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1741383 - SURFACE
      ?auto_1741384 - SURFACE
      ?auto_1741385 - SURFACE
      ?auto_1741382 - SURFACE
      ?auto_1741386 - SURFACE
      ?auto_1741388 - SURFACE
      ?auto_1741387 - SURFACE
      ?auto_1741389 - SURFACE
      ?auto_1741390 - SURFACE
      ?auto_1741391 - SURFACE
      ?auto_1741392 - SURFACE
      ?auto_1741393 - SURFACE
      ?auto_1741394 - SURFACE
    )
    :vars
    (
      ?auto_1741397 - HOIST
      ?auto_1741396 - PLACE
      ?auto_1741395 - TRUCK
      ?auto_1741398 - PLACE
      ?auto_1741399 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1741397 ?auto_1741396 ) ( SURFACE-AT ?auto_1741393 ?auto_1741396 ) ( CLEAR ?auto_1741393 ) ( IS-CRATE ?auto_1741394 ) ( not ( = ?auto_1741393 ?auto_1741394 ) ) ( AVAILABLE ?auto_1741397 ) ( ON ?auto_1741393 ?auto_1741392 ) ( not ( = ?auto_1741392 ?auto_1741393 ) ) ( not ( = ?auto_1741392 ?auto_1741394 ) ) ( TRUCK-AT ?auto_1741395 ?auto_1741398 ) ( not ( = ?auto_1741398 ?auto_1741396 ) ) ( HOIST-AT ?auto_1741399 ?auto_1741398 ) ( LIFTING ?auto_1741399 ?auto_1741394 ) ( not ( = ?auto_1741397 ?auto_1741399 ) ) ( ON ?auto_1741384 ?auto_1741383 ) ( ON ?auto_1741385 ?auto_1741384 ) ( ON ?auto_1741382 ?auto_1741385 ) ( ON ?auto_1741386 ?auto_1741382 ) ( ON ?auto_1741388 ?auto_1741386 ) ( ON ?auto_1741387 ?auto_1741388 ) ( ON ?auto_1741389 ?auto_1741387 ) ( ON ?auto_1741390 ?auto_1741389 ) ( ON ?auto_1741391 ?auto_1741390 ) ( ON ?auto_1741392 ?auto_1741391 ) ( not ( = ?auto_1741383 ?auto_1741384 ) ) ( not ( = ?auto_1741383 ?auto_1741385 ) ) ( not ( = ?auto_1741383 ?auto_1741382 ) ) ( not ( = ?auto_1741383 ?auto_1741386 ) ) ( not ( = ?auto_1741383 ?auto_1741388 ) ) ( not ( = ?auto_1741383 ?auto_1741387 ) ) ( not ( = ?auto_1741383 ?auto_1741389 ) ) ( not ( = ?auto_1741383 ?auto_1741390 ) ) ( not ( = ?auto_1741383 ?auto_1741391 ) ) ( not ( = ?auto_1741383 ?auto_1741392 ) ) ( not ( = ?auto_1741383 ?auto_1741393 ) ) ( not ( = ?auto_1741383 ?auto_1741394 ) ) ( not ( = ?auto_1741384 ?auto_1741385 ) ) ( not ( = ?auto_1741384 ?auto_1741382 ) ) ( not ( = ?auto_1741384 ?auto_1741386 ) ) ( not ( = ?auto_1741384 ?auto_1741388 ) ) ( not ( = ?auto_1741384 ?auto_1741387 ) ) ( not ( = ?auto_1741384 ?auto_1741389 ) ) ( not ( = ?auto_1741384 ?auto_1741390 ) ) ( not ( = ?auto_1741384 ?auto_1741391 ) ) ( not ( = ?auto_1741384 ?auto_1741392 ) ) ( not ( = ?auto_1741384 ?auto_1741393 ) ) ( not ( = ?auto_1741384 ?auto_1741394 ) ) ( not ( = ?auto_1741385 ?auto_1741382 ) ) ( not ( = ?auto_1741385 ?auto_1741386 ) ) ( not ( = ?auto_1741385 ?auto_1741388 ) ) ( not ( = ?auto_1741385 ?auto_1741387 ) ) ( not ( = ?auto_1741385 ?auto_1741389 ) ) ( not ( = ?auto_1741385 ?auto_1741390 ) ) ( not ( = ?auto_1741385 ?auto_1741391 ) ) ( not ( = ?auto_1741385 ?auto_1741392 ) ) ( not ( = ?auto_1741385 ?auto_1741393 ) ) ( not ( = ?auto_1741385 ?auto_1741394 ) ) ( not ( = ?auto_1741382 ?auto_1741386 ) ) ( not ( = ?auto_1741382 ?auto_1741388 ) ) ( not ( = ?auto_1741382 ?auto_1741387 ) ) ( not ( = ?auto_1741382 ?auto_1741389 ) ) ( not ( = ?auto_1741382 ?auto_1741390 ) ) ( not ( = ?auto_1741382 ?auto_1741391 ) ) ( not ( = ?auto_1741382 ?auto_1741392 ) ) ( not ( = ?auto_1741382 ?auto_1741393 ) ) ( not ( = ?auto_1741382 ?auto_1741394 ) ) ( not ( = ?auto_1741386 ?auto_1741388 ) ) ( not ( = ?auto_1741386 ?auto_1741387 ) ) ( not ( = ?auto_1741386 ?auto_1741389 ) ) ( not ( = ?auto_1741386 ?auto_1741390 ) ) ( not ( = ?auto_1741386 ?auto_1741391 ) ) ( not ( = ?auto_1741386 ?auto_1741392 ) ) ( not ( = ?auto_1741386 ?auto_1741393 ) ) ( not ( = ?auto_1741386 ?auto_1741394 ) ) ( not ( = ?auto_1741388 ?auto_1741387 ) ) ( not ( = ?auto_1741388 ?auto_1741389 ) ) ( not ( = ?auto_1741388 ?auto_1741390 ) ) ( not ( = ?auto_1741388 ?auto_1741391 ) ) ( not ( = ?auto_1741388 ?auto_1741392 ) ) ( not ( = ?auto_1741388 ?auto_1741393 ) ) ( not ( = ?auto_1741388 ?auto_1741394 ) ) ( not ( = ?auto_1741387 ?auto_1741389 ) ) ( not ( = ?auto_1741387 ?auto_1741390 ) ) ( not ( = ?auto_1741387 ?auto_1741391 ) ) ( not ( = ?auto_1741387 ?auto_1741392 ) ) ( not ( = ?auto_1741387 ?auto_1741393 ) ) ( not ( = ?auto_1741387 ?auto_1741394 ) ) ( not ( = ?auto_1741389 ?auto_1741390 ) ) ( not ( = ?auto_1741389 ?auto_1741391 ) ) ( not ( = ?auto_1741389 ?auto_1741392 ) ) ( not ( = ?auto_1741389 ?auto_1741393 ) ) ( not ( = ?auto_1741389 ?auto_1741394 ) ) ( not ( = ?auto_1741390 ?auto_1741391 ) ) ( not ( = ?auto_1741390 ?auto_1741392 ) ) ( not ( = ?auto_1741390 ?auto_1741393 ) ) ( not ( = ?auto_1741390 ?auto_1741394 ) ) ( not ( = ?auto_1741391 ?auto_1741392 ) ) ( not ( = ?auto_1741391 ?auto_1741393 ) ) ( not ( = ?auto_1741391 ?auto_1741394 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1741392 ?auto_1741393 ?auto_1741394 )
      ( MAKE-12CRATE-VERIFY ?auto_1741383 ?auto_1741384 ?auto_1741385 ?auto_1741382 ?auto_1741386 ?auto_1741388 ?auto_1741387 ?auto_1741389 ?auto_1741390 ?auto_1741391 ?auto_1741392 ?auto_1741393 ?auto_1741394 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1741545 - SURFACE
      ?auto_1741546 - SURFACE
      ?auto_1741547 - SURFACE
      ?auto_1741544 - SURFACE
      ?auto_1741548 - SURFACE
      ?auto_1741550 - SURFACE
      ?auto_1741549 - SURFACE
      ?auto_1741551 - SURFACE
      ?auto_1741552 - SURFACE
      ?auto_1741553 - SURFACE
      ?auto_1741554 - SURFACE
      ?auto_1741555 - SURFACE
      ?auto_1741556 - SURFACE
    )
    :vars
    (
      ?auto_1741559 - HOIST
      ?auto_1741561 - PLACE
      ?auto_1741560 - TRUCK
      ?auto_1741557 - PLACE
      ?auto_1741558 - HOIST
      ?auto_1741562 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1741559 ?auto_1741561 ) ( SURFACE-AT ?auto_1741555 ?auto_1741561 ) ( CLEAR ?auto_1741555 ) ( IS-CRATE ?auto_1741556 ) ( not ( = ?auto_1741555 ?auto_1741556 ) ) ( AVAILABLE ?auto_1741559 ) ( ON ?auto_1741555 ?auto_1741554 ) ( not ( = ?auto_1741554 ?auto_1741555 ) ) ( not ( = ?auto_1741554 ?auto_1741556 ) ) ( TRUCK-AT ?auto_1741560 ?auto_1741557 ) ( not ( = ?auto_1741557 ?auto_1741561 ) ) ( HOIST-AT ?auto_1741558 ?auto_1741557 ) ( not ( = ?auto_1741559 ?auto_1741558 ) ) ( AVAILABLE ?auto_1741558 ) ( SURFACE-AT ?auto_1741556 ?auto_1741557 ) ( ON ?auto_1741556 ?auto_1741562 ) ( CLEAR ?auto_1741556 ) ( not ( = ?auto_1741555 ?auto_1741562 ) ) ( not ( = ?auto_1741556 ?auto_1741562 ) ) ( not ( = ?auto_1741554 ?auto_1741562 ) ) ( ON ?auto_1741546 ?auto_1741545 ) ( ON ?auto_1741547 ?auto_1741546 ) ( ON ?auto_1741544 ?auto_1741547 ) ( ON ?auto_1741548 ?auto_1741544 ) ( ON ?auto_1741550 ?auto_1741548 ) ( ON ?auto_1741549 ?auto_1741550 ) ( ON ?auto_1741551 ?auto_1741549 ) ( ON ?auto_1741552 ?auto_1741551 ) ( ON ?auto_1741553 ?auto_1741552 ) ( ON ?auto_1741554 ?auto_1741553 ) ( not ( = ?auto_1741545 ?auto_1741546 ) ) ( not ( = ?auto_1741545 ?auto_1741547 ) ) ( not ( = ?auto_1741545 ?auto_1741544 ) ) ( not ( = ?auto_1741545 ?auto_1741548 ) ) ( not ( = ?auto_1741545 ?auto_1741550 ) ) ( not ( = ?auto_1741545 ?auto_1741549 ) ) ( not ( = ?auto_1741545 ?auto_1741551 ) ) ( not ( = ?auto_1741545 ?auto_1741552 ) ) ( not ( = ?auto_1741545 ?auto_1741553 ) ) ( not ( = ?auto_1741545 ?auto_1741554 ) ) ( not ( = ?auto_1741545 ?auto_1741555 ) ) ( not ( = ?auto_1741545 ?auto_1741556 ) ) ( not ( = ?auto_1741545 ?auto_1741562 ) ) ( not ( = ?auto_1741546 ?auto_1741547 ) ) ( not ( = ?auto_1741546 ?auto_1741544 ) ) ( not ( = ?auto_1741546 ?auto_1741548 ) ) ( not ( = ?auto_1741546 ?auto_1741550 ) ) ( not ( = ?auto_1741546 ?auto_1741549 ) ) ( not ( = ?auto_1741546 ?auto_1741551 ) ) ( not ( = ?auto_1741546 ?auto_1741552 ) ) ( not ( = ?auto_1741546 ?auto_1741553 ) ) ( not ( = ?auto_1741546 ?auto_1741554 ) ) ( not ( = ?auto_1741546 ?auto_1741555 ) ) ( not ( = ?auto_1741546 ?auto_1741556 ) ) ( not ( = ?auto_1741546 ?auto_1741562 ) ) ( not ( = ?auto_1741547 ?auto_1741544 ) ) ( not ( = ?auto_1741547 ?auto_1741548 ) ) ( not ( = ?auto_1741547 ?auto_1741550 ) ) ( not ( = ?auto_1741547 ?auto_1741549 ) ) ( not ( = ?auto_1741547 ?auto_1741551 ) ) ( not ( = ?auto_1741547 ?auto_1741552 ) ) ( not ( = ?auto_1741547 ?auto_1741553 ) ) ( not ( = ?auto_1741547 ?auto_1741554 ) ) ( not ( = ?auto_1741547 ?auto_1741555 ) ) ( not ( = ?auto_1741547 ?auto_1741556 ) ) ( not ( = ?auto_1741547 ?auto_1741562 ) ) ( not ( = ?auto_1741544 ?auto_1741548 ) ) ( not ( = ?auto_1741544 ?auto_1741550 ) ) ( not ( = ?auto_1741544 ?auto_1741549 ) ) ( not ( = ?auto_1741544 ?auto_1741551 ) ) ( not ( = ?auto_1741544 ?auto_1741552 ) ) ( not ( = ?auto_1741544 ?auto_1741553 ) ) ( not ( = ?auto_1741544 ?auto_1741554 ) ) ( not ( = ?auto_1741544 ?auto_1741555 ) ) ( not ( = ?auto_1741544 ?auto_1741556 ) ) ( not ( = ?auto_1741544 ?auto_1741562 ) ) ( not ( = ?auto_1741548 ?auto_1741550 ) ) ( not ( = ?auto_1741548 ?auto_1741549 ) ) ( not ( = ?auto_1741548 ?auto_1741551 ) ) ( not ( = ?auto_1741548 ?auto_1741552 ) ) ( not ( = ?auto_1741548 ?auto_1741553 ) ) ( not ( = ?auto_1741548 ?auto_1741554 ) ) ( not ( = ?auto_1741548 ?auto_1741555 ) ) ( not ( = ?auto_1741548 ?auto_1741556 ) ) ( not ( = ?auto_1741548 ?auto_1741562 ) ) ( not ( = ?auto_1741550 ?auto_1741549 ) ) ( not ( = ?auto_1741550 ?auto_1741551 ) ) ( not ( = ?auto_1741550 ?auto_1741552 ) ) ( not ( = ?auto_1741550 ?auto_1741553 ) ) ( not ( = ?auto_1741550 ?auto_1741554 ) ) ( not ( = ?auto_1741550 ?auto_1741555 ) ) ( not ( = ?auto_1741550 ?auto_1741556 ) ) ( not ( = ?auto_1741550 ?auto_1741562 ) ) ( not ( = ?auto_1741549 ?auto_1741551 ) ) ( not ( = ?auto_1741549 ?auto_1741552 ) ) ( not ( = ?auto_1741549 ?auto_1741553 ) ) ( not ( = ?auto_1741549 ?auto_1741554 ) ) ( not ( = ?auto_1741549 ?auto_1741555 ) ) ( not ( = ?auto_1741549 ?auto_1741556 ) ) ( not ( = ?auto_1741549 ?auto_1741562 ) ) ( not ( = ?auto_1741551 ?auto_1741552 ) ) ( not ( = ?auto_1741551 ?auto_1741553 ) ) ( not ( = ?auto_1741551 ?auto_1741554 ) ) ( not ( = ?auto_1741551 ?auto_1741555 ) ) ( not ( = ?auto_1741551 ?auto_1741556 ) ) ( not ( = ?auto_1741551 ?auto_1741562 ) ) ( not ( = ?auto_1741552 ?auto_1741553 ) ) ( not ( = ?auto_1741552 ?auto_1741554 ) ) ( not ( = ?auto_1741552 ?auto_1741555 ) ) ( not ( = ?auto_1741552 ?auto_1741556 ) ) ( not ( = ?auto_1741552 ?auto_1741562 ) ) ( not ( = ?auto_1741553 ?auto_1741554 ) ) ( not ( = ?auto_1741553 ?auto_1741555 ) ) ( not ( = ?auto_1741553 ?auto_1741556 ) ) ( not ( = ?auto_1741553 ?auto_1741562 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1741554 ?auto_1741555 ?auto_1741556 )
      ( MAKE-12CRATE-VERIFY ?auto_1741545 ?auto_1741546 ?auto_1741547 ?auto_1741544 ?auto_1741548 ?auto_1741550 ?auto_1741549 ?auto_1741551 ?auto_1741552 ?auto_1741553 ?auto_1741554 ?auto_1741555 ?auto_1741556 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1741708 - SURFACE
      ?auto_1741709 - SURFACE
      ?auto_1741710 - SURFACE
      ?auto_1741707 - SURFACE
      ?auto_1741711 - SURFACE
      ?auto_1741713 - SURFACE
      ?auto_1741712 - SURFACE
      ?auto_1741714 - SURFACE
      ?auto_1741715 - SURFACE
      ?auto_1741716 - SURFACE
      ?auto_1741717 - SURFACE
      ?auto_1741718 - SURFACE
      ?auto_1741719 - SURFACE
    )
    :vars
    (
      ?auto_1741722 - HOIST
      ?auto_1741721 - PLACE
      ?auto_1741723 - PLACE
      ?auto_1741725 - HOIST
      ?auto_1741724 - SURFACE
      ?auto_1741720 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1741722 ?auto_1741721 ) ( SURFACE-AT ?auto_1741718 ?auto_1741721 ) ( CLEAR ?auto_1741718 ) ( IS-CRATE ?auto_1741719 ) ( not ( = ?auto_1741718 ?auto_1741719 ) ) ( AVAILABLE ?auto_1741722 ) ( ON ?auto_1741718 ?auto_1741717 ) ( not ( = ?auto_1741717 ?auto_1741718 ) ) ( not ( = ?auto_1741717 ?auto_1741719 ) ) ( not ( = ?auto_1741723 ?auto_1741721 ) ) ( HOIST-AT ?auto_1741725 ?auto_1741723 ) ( not ( = ?auto_1741722 ?auto_1741725 ) ) ( AVAILABLE ?auto_1741725 ) ( SURFACE-AT ?auto_1741719 ?auto_1741723 ) ( ON ?auto_1741719 ?auto_1741724 ) ( CLEAR ?auto_1741719 ) ( not ( = ?auto_1741718 ?auto_1741724 ) ) ( not ( = ?auto_1741719 ?auto_1741724 ) ) ( not ( = ?auto_1741717 ?auto_1741724 ) ) ( TRUCK-AT ?auto_1741720 ?auto_1741721 ) ( ON ?auto_1741709 ?auto_1741708 ) ( ON ?auto_1741710 ?auto_1741709 ) ( ON ?auto_1741707 ?auto_1741710 ) ( ON ?auto_1741711 ?auto_1741707 ) ( ON ?auto_1741713 ?auto_1741711 ) ( ON ?auto_1741712 ?auto_1741713 ) ( ON ?auto_1741714 ?auto_1741712 ) ( ON ?auto_1741715 ?auto_1741714 ) ( ON ?auto_1741716 ?auto_1741715 ) ( ON ?auto_1741717 ?auto_1741716 ) ( not ( = ?auto_1741708 ?auto_1741709 ) ) ( not ( = ?auto_1741708 ?auto_1741710 ) ) ( not ( = ?auto_1741708 ?auto_1741707 ) ) ( not ( = ?auto_1741708 ?auto_1741711 ) ) ( not ( = ?auto_1741708 ?auto_1741713 ) ) ( not ( = ?auto_1741708 ?auto_1741712 ) ) ( not ( = ?auto_1741708 ?auto_1741714 ) ) ( not ( = ?auto_1741708 ?auto_1741715 ) ) ( not ( = ?auto_1741708 ?auto_1741716 ) ) ( not ( = ?auto_1741708 ?auto_1741717 ) ) ( not ( = ?auto_1741708 ?auto_1741718 ) ) ( not ( = ?auto_1741708 ?auto_1741719 ) ) ( not ( = ?auto_1741708 ?auto_1741724 ) ) ( not ( = ?auto_1741709 ?auto_1741710 ) ) ( not ( = ?auto_1741709 ?auto_1741707 ) ) ( not ( = ?auto_1741709 ?auto_1741711 ) ) ( not ( = ?auto_1741709 ?auto_1741713 ) ) ( not ( = ?auto_1741709 ?auto_1741712 ) ) ( not ( = ?auto_1741709 ?auto_1741714 ) ) ( not ( = ?auto_1741709 ?auto_1741715 ) ) ( not ( = ?auto_1741709 ?auto_1741716 ) ) ( not ( = ?auto_1741709 ?auto_1741717 ) ) ( not ( = ?auto_1741709 ?auto_1741718 ) ) ( not ( = ?auto_1741709 ?auto_1741719 ) ) ( not ( = ?auto_1741709 ?auto_1741724 ) ) ( not ( = ?auto_1741710 ?auto_1741707 ) ) ( not ( = ?auto_1741710 ?auto_1741711 ) ) ( not ( = ?auto_1741710 ?auto_1741713 ) ) ( not ( = ?auto_1741710 ?auto_1741712 ) ) ( not ( = ?auto_1741710 ?auto_1741714 ) ) ( not ( = ?auto_1741710 ?auto_1741715 ) ) ( not ( = ?auto_1741710 ?auto_1741716 ) ) ( not ( = ?auto_1741710 ?auto_1741717 ) ) ( not ( = ?auto_1741710 ?auto_1741718 ) ) ( not ( = ?auto_1741710 ?auto_1741719 ) ) ( not ( = ?auto_1741710 ?auto_1741724 ) ) ( not ( = ?auto_1741707 ?auto_1741711 ) ) ( not ( = ?auto_1741707 ?auto_1741713 ) ) ( not ( = ?auto_1741707 ?auto_1741712 ) ) ( not ( = ?auto_1741707 ?auto_1741714 ) ) ( not ( = ?auto_1741707 ?auto_1741715 ) ) ( not ( = ?auto_1741707 ?auto_1741716 ) ) ( not ( = ?auto_1741707 ?auto_1741717 ) ) ( not ( = ?auto_1741707 ?auto_1741718 ) ) ( not ( = ?auto_1741707 ?auto_1741719 ) ) ( not ( = ?auto_1741707 ?auto_1741724 ) ) ( not ( = ?auto_1741711 ?auto_1741713 ) ) ( not ( = ?auto_1741711 ?auto_1741712 ) ) ( not ( = ?auto_1741711 ?auto_1741714 ) ) ( not ( = ?auto_1741711 ?auto_1741715 ) ) ( not ( = ?auto_1741711 ?auto_1741716 ) ) ( not ( = ?auto_1741711 ?auto_1741717 ) ) ( not ( = ?auto_1741711 ?auto_1741718 ) ) ( not ( = ?auto_1741711 ?auto_1741719 ) ) ( not ( = ?auto_1741711 ?auto_1741724 ) ) ( not ( = ?auto_1741713 ?auto_1741712 ) ) ( not ( = ?auto_1741713 ?auto_1741714 ) ) ( not ( = ?auto_1741713 ?auto_1741715 ) ) ( not ( = ?auto_1741713 ?auto_1741716 ) ) ( not ( = ?auto_1741713 ?auto_1741717 ) ) ( not ( = ?auto_1741713 ?auto_1741718 ) ) ( not ( = ?auto_1741713 ?auto_1741719 ) ) ( not ( = ?auto_1741713 ?auto_1741724 ) ) ( not ( = ?auto_1741712 ?auto_1741714 ) ) ( not ( = ?auto_1741712 ?auto_1741715 ) ) ( not ( = ?auto_1741712 ?auto_1741716 ) ) ( not ( = ?auto_1741712 ?auto_1741717 ) ) ( not ( = ?auto_1741712 ?auto_1741718 ) ) ( not ( = ?auto_1741712 ?auto_1741719 ) ) ( not ( = ?auto_1741712 ?auto_1741724 ) ) ( not ( = ?auto_1741714 ?auto_1741715 ) ) ( not ( = ?auto_1741714 ?auto_1741716 ) ) ( not ( = ?auto_1741714 ?auto_1741717 ) ) ( not ( = ?auto_1741714 ?auto_1741718 ) ) ( not ( = ?auto_1741714 ?auto_1741719 ) ) ( not ( = ?auto_1741714 ?auto_1741724 ) ) ( not ( = ?auto_1741715 ?auto_1741716 ) ) ( not ( = ?auto_1741715 ?auto_1741717 ) ) ( not ( = ?auto_1741715 ?auto_1741718 ) ) ( not ( = ?auto_1741715 ?auto_1741719 ) ) ( not ( = ?auto_1741715 ?auto_1741724 ) ) ( not ( = ?auto_1741716 ?auto_1741717 ) ) ( not ( = ?auto_1741716 ?auto_1741718 ) ) ( not ( = ?auto_1741716 ?auto_1741719 ) ) ( not ( = ?auto_1741716 ?auto_1741724 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1741717 ?auto_1741718 ?auto_1741719 )
      ( MAKE-12CRATE-VERIFY ?auto_1741708 ?auto_1741709 ?auto_1741710 ?auto_1741707 ?auto_1741711 ?auto_1741713 ?auto_1741712 ?auto_1741714 ?auto_1741715 ?auto_1741716 ?auto_1741717 ?auto_1741718 ?auto_1741719 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1741871 - SURFACE
      ?auto_1741872 - SURFACE
      ?auto_1741873 - SURFACE
      ?auto_1741870 - SURFACE
      ?auto_1741874 - SURFACE
      ?auto_1741876 - SURFACE
      ?auto_1741875 - SURFACE
      ?auto_1741877 - SURFACE
      ?auto_1741878 - SURFACE
      ?auto_1741879 - SURFACE
      ?auto_1741880 - SURFACE
      ?auto_1741881 - SURFACE
      ?auto_1741882 - SURFACE
    )
    :vars
    (
      ?auto_1741884 - HOIST
      ?auto_1741885 - PLACE
      ?auto_1741886 - PLACE
      ?auto_1741883 - HOIST
      ?auto_1741887 - SURFACE
      ?auto_1741888 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1741884 ?auto_1741885 ) ( IS-CRATE ?auto_1741882 ) ( not ( = ?auto_1741881 ?auto_1741882 ) ) ( not ( = ?auto_1741880 ?auto_1741881 ) ) ( not ( = ?auto_1741880 ?auto_1741882 ) ) ( not ( = ?auto_1741886 ?auto_1741885 ) ) ( HOIST-AT ?auto_1741883 ?auto_1741886 ) ( not ( = ?auto_1741884 ?auto_1741883 ) ) ( AVAILABLE ?auto_1741883 ) ( SURFACE-AT ?auto_1741882 ?auto_1741886 ) ( ON ?auto_1741882 ?auto_1741887 ) ( CLEAR ?auto_1741882 ) ( not ( = ?auto_1741881 ?auto_1741887 ) ) ( not ( = ?auto_1741882 ?auto_1741887 ) ) ( not ( = ?auto_1741880 ?auto_1741887 ) ) ( TRUCK-AT ?auto_1741888 ?auto_1741885 ) ( SURFACE-AT ?auto_1741880 ?auto_1741885 ) ( CLEAR ?auto_1741880 ) ( LIFTING ?auto_1741884 ?auto_1741881 ) ( IS-CRATE ?auto_1741881 ) ( ON ?auto_1741872 ?auto_1741871 ) ( ON ?auto_1741873 ?auto_1741872 ) ( ON ?auto_1741870 ?auto_1741873 ) ( ON ?auto_1741874 ?auto_1741870 ) ( ON ?auto_1741876 ?auto_1741874 ) ( ON ?auto_1741875 ?auto_1741876 ) ( ON ?auto_1741877 ?auto_1741875 ) ( ON ?auto_1741878 ?auto_1741877 ) ( ON ?auto_1741879 ?auto_1741878 ) ( ON ?auto_1741880 ?auto_1741879 ) ( not ( = ?auto_1741871 ?auto_1741872 ) ) ( not ( = ?auto_1741871 ?auto_1741873 ) ) ( not ( = ?auto_1741871 ?auto_1741870 ) ) ( not ( = ?auto_1741871 ?auto_1741874 ) ) ( not ( = ?auto_1741871 ?auto_1741876 ) ) ( not ( = ?auto_1741871 ?auto_1741875 ) ) ( not ( = ?auto_1741871 ?auto_1741877 ) ) ( not ( = ?auto_1741871 ?auto_1741878 ) ) ( not ( = ?auto_1741871 ?auto_1741879 ) ) ( not ( = ?auto_1741871 ?auto_1741880 ) ) ( not ( = ?auto_1741871 ?auto_1741881 ) ) ( not ( = ?auto_1741871 ?auto_1741882 ) ) ( not ( = ?auto_1741871 ?auto_1741887 ) ) ( not ( = ?auto_1741872 ?auto_1741873 ) ) ( not ( = ?auto_1741872 ?auto_1741870 ) ) ( not ( = ?auto_1741872 ?auto_1741874 ) ) ( not ( = ?auto_1741872 ?auto_1741876 ) ) ( not ( = ?auto_1741872 ?auto_1741875 ) ) ( not ( = ?auto_1741872 ?auto_1741877 ) ) ( not ( = ?auto_1741872 ?auto_1741878 ) ) ( not ( = ?auto_1741872 ?auto_1741879 ) ) ( not ( = ?auto_1741872 ?auto_1741880 ) ) ( not ( = ?auto_1741872 ?auto_1741881 ) ) ( not ( = ?auto_1741872 ?auto_1741882 ) ) ( not ( = ?auto_1741872 ?auto_1741887 ) ) ( not ( = ?auto_1741873 ?auto_1741870 ) ) ( not ( = ?auto_1741873 ?auto_1741874 ) ) ( not ( = ?auto_1741873 ?auto_1741876 ) ) ( not ( = ?auto_1741873 ?auto_1741875 ) ) ( not ( = ?auto_1741873 ?auto_1741877 ) ) ( not ( = ?auto_1741873 ?auto_1741878 ) ) ( not ( = ?auto_1741873 ?auto_1741879 ) ) ( not ( = ?auto_1741873 ?auto_1741880 ) ) ( not ( = ?auto_1741873 ?auto_1741881 ) ) ( not ( = ?auto_1741873 ?auto_1741882 ) ) ( not ( = ?auto_1741873 ?auto_1741887 ) ) ( not ( = ?auto_1741870 ?auto_1741874 ) ) ( not ( = ?auto_1741870 ?auto_1741876 ) ) ( not ( = ?auto_1741870 ?auto_1741875 ) ) ( not ( = ?auto_1741870 ?auto_1741877 ) ) ( not ( = ?auto_1741870 ?auto_1741878 ) ) ( not ( = ?auto_1741870 ?auto_1741879 ) ) ( not ( = ?auto_1741870 ?auto_1741880 ) ) ( not ( = ?auto_1741870 ?auto_1741881 ) ) ( not ( = ?auto_1741870 ?auto_1741882 ) ) ( not ( = ?auto_1741870 ?auto_1741887 ) ) ( not ( = ?auto_1741874 ?auto_1741876 ) ) ( not ( = ?auto_1741874 ?auto_1741875 ) ) ( not ( = ?auto_1741874 ?auto_1741877 ) ) ( not ( = ?auto_1741874 ?auto_1741878 ) ) ( not ( = ?auto_1741874 ?auto_1741879 ) ) ( not ( = ?auto_1741874 ?auto_1741880 ) ) ( not ( = ?auto_1741874 ?auto_1741881 ) ) ( not ( = ?auto_1741874 ?auto_1741882 ) ) ( not ( = ?auto_1741874 ?auto_1741887 ) ) ( not ( = ?auto_1741876 ?auto_1741875 ) ) ( not ( = ?auto_1741876 ?auto_1741877 ) ) ( not ( = ?auto_1741876 ?auto_1741878 ) ) ( not ( = ?auto_1741876 ?auto_1741879 ) ) ( not ( = ?auto_1741876 ?auto_1741880 ) ) ( not ( = ?auto_1741876 ?auto_1741881 ) ) ( not ( = ?auto_1741876 ?auto_1741882 ) ) ( not ( = ?auto_1741876 ?auto_1741887 ) ) ( not ( = ?auto_1741875 ?auto_1741877 ) ) ( not ( = ?auto_1741875 ?auto_1741878 ) ) ( not ( = ?auto_1741875 ?auto_1741879 ) ) ( not ( = ?auto_1741875 ?auto_1741880 ) ) ( not ( = ?auto_1741875 ?auto_1741881 ) ) ( not ( = ?auto_1741875 ?auto_1741882 ) ) ( not ( = ?auto_1741875 ?auto_1741887 ) ) ( not ( = ?auto_1741877 ?auto_1741878 ) ) ( not ( = ?auto_1741877 ?auto_1741879 ) ) ( not ( = ?auto_1741877 ?auto_1741880 ) ) ( not ( = ?auto_1741877 ?auto_1741881 ) ) ( not ( = ?auto_1741877 ?auto_1741882 ) ) ( not ( = ?auto_1741877 ?auto_1741887 ) ) ( not ( = ?auto_1741878 ?auto_1741879 ) ) ( not ( = ?auto_1741878 ?auto_1741880 ) ) ( not ( = ?auto_1741878 ?auto_1741881 ) ) ( not ( = ?auto_1741878 ?auto_1741882 ) ) ( not ( = ?auto_1741878 ?auto_1741887 ) ) ( not ( = ?auto_1741879 ?auto_1741880 ) ) ( not ( = ?auto_1741879 ?auto_1741881 ) ) ( not ( = ?auto_1741879 ?auto_1741882 ) ) ( not ( = ?auto_1741879 ?auto_1741887 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1741880 ?auto_1741881 ?auto_1741882 )
      ( MAKE-12CRATE-VERIFY ?auto_1741871 ?auto_1741872 ?auto_1741873 ?auto_1741870 ?auto_1741874 ?auto_1741876 ?auto_1741875 ?auto_1741877 ?auto_1741878 ?auto_1741879 ?auto_1741880 ?auto_1741881 ?auto_1741882 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1742034 - SURFACE
      ?auto_1742035 - SURFACE
      ?auto_1742036 - SURFACE
      ?auto_1742033 - SURFACE
      ?auto_1742037 - SURFACE
      ?auto_1742039 - SURFACE
      ?auto_1742038 - SURFACE
      ?auto_1742040 - SURFACE
      ?auto_1742041 - SURFACE
      ?auto_1742042 - SURFACE
      ?auto_1742043 - SURFACE
      ?auto_1742044 - SURFACE
      ?auto_1742045 - SURFACE
    )
    :vars
    (
      ?auto_1742051 - HOIST
      ?auto_1742046 - PLACE
      ?auto_1742049 - PLACE
      ?auto_1742050 - HOIST
      ?auto_1742048 - SURFACE
      ?auto_1742047 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742051 ?auto_1742046 ) ( IS-CRATE ?auto_1742045 ) ( not ( = ?auto_1742044 ?auto_1742045 ) ) ( not ( = ?auto_1742043 ?auto_1742044 ) ) ( not ( = ?auto_1742043 ?auto_1742045 ) ) ( not ( = ?auto_1742049 ?auto_1742046 ) ) ( HOIST-AT ?auto_1742050 ?auto_1742049 ) ( not ( = ?auto_1742051 ?auto_1742050 ) ) ( AVAILABLE ?auto_1742050 ) ( SURFACE-AT ?auto_1742045 ?auto_1742049 ) ( ON ?auto_1742045 ?auto_1742048 ) ( CLEAR ?auto_1742045 ) ( not ( = ?auto_1742044 ?auto_1742048 ) ) ( not ( = ?auto_1742045 ?auto_1742048 ) ) ( not ( = ?auto_1742043 ?auto_1742048 ) ) ( TRUCK-AT ?auto_1742047 ?auto_1742046 ) ( SURFACE-AT ?auto_1742043 ?auto_1742046 ) ( CLEAR ?auto_1742043 ) ( IS-CRATE ?auto_1742044 ) ( AVAILABLE ?auto_1742051 ) ( IN ?auto_1742044 ?auto_1742047 ) ( ON ?auto_1742035 ?auto_1742034 ) ( ON ?auto_1742036 ?auto_1742035 ) ( ON ?auto_1742033 ?auto_1742036 ) ( ON ?auto_1742037 ?auto_1742033 ) ( ON ?auto_1742039 ?auto_1742037 ) ( ON ?auto_1742038 ?auto_1742039 ) ( ON ?auto_1742040 ?auto_1742038 ) ( ON ?auto_1742041 ?auto_1742040 ) ( ON ?auto_1742042 ?auto_1742041 ) ( ON ?auto_1742043 ?auto_1742042 ) ( not ( = ?auto_1742034 ?auto_1742035 ) ) ( not ( = ?auto_1742034 ?auto_1742036 ) ) ( not ( = ?auto_1742034 ?auto_1742033 ) ) ( not ( = ?auto_1742034 ?auto_1742037 ) ) ( not ( = ?auto_1742034 ?auto_1742039 ) ) ( not ( = ?auto_1742034 ?auto_1742038 ) ) ( not ( = ?auto_1742034 ?auto_1742040 ) ) ( not ( = ?auto_1742034 ?auto_1742041 ) ) ( not ( = ?auto_1742034 ?auto_1742042 ) ) ( not ( = ?auto_1742034 ?auto_1742043 ) ) ( not ( = ?auto_1742034 ?auto_1742044 ) ) ( not ( = ?auto_1742034 ?auto_1742045 ) ) ( not ( = ?auto_1742034 ?auto_1742048 ) ) ( not ( = ?auto_1742035 ?auto_1742036 ) ) ( not ( = ?auto_1742035 ?auto_1742033 ) ) ( not ( = ?auto_1742035 ?auto_1742037 ) ) ( not ( = ?auto_1742035 ?auto_1742039 ) ) ( not ( = ?auto_1742035 ?auto_1742038 ) ) ( not ( = ?auto_1742035 ?auto_1742040 ) ) ( not ( = ?auto_1742035 ?auto_1742041 ) ) ( not ( = ?auto_1742035 ?auto_1742042 ) ) ( not ( = ?auto_1742035 ?auto_1742043 ) ) ( not ( = ?auto_1742035 ?auto_1742044 ) ) ( not ( = ?auto_1742035 ?auto_1742045 ) ) ( not ( = ?auto_1742035 ?auto_1742048 ) ) ( not ( = ?auto_1742036 ?auto_1742033 ) ) ( not ( = ?auto_1742036 ?auto_1742037 ) ) ( not ( = ?auto_1742036 ?auto_1742039 ) ) ( not ( = ?auto_1742036 ?auto_1742038 ) ) ( not ( = ?auto_1742036 ?auto_1742040 ) ) ( not ( = ?auto_1742036 ?auto_1742041 ) ) ( not ( = ?auto_1742036 ?auto_1742042 ) ) ( not ( = ?auto_1742036 ?auto_1742043 ) ) ( not ( = ?auto_1742036 ?auto_1742044 ) ) ( not ( = ?auto_1742036 ?auto_1742045 ) ) ( not ( = ?auto_1742036 ?auto_1742048 ) ) ( not ( = ?auto_1742033 ?auto_1742037 ) ) ( not ( = ?auto_1742033 ?auto_1742039 ) ) ( not ( = ?auto_1742033 ?auto_1742038 ) ) ( not ( = ?auto_1742033 ?auto_1742040 ) ) ( not ( = ?auto_1742033 ?auto_1742041 ) ) ( not ( = ?auto_1742033 ?auto_1742042 ) ) ( not ( = ?auto_1742033 ?auto_1742043 ) ) ( not ( = ?auto_1742033 ?auto_1742044 ) ) ( not ( = ?auto_1742033 ?auto_1742045 ) ) ( not ( = ?auto_1742033 ?auto_1742048 ) ) ( not ( = ?auto_1742037 ?auto_1742039 ) ) ( not ( = ?auto_1742037 ?auto_1742038 ) ) ( not ( = ?auto_1742037 ?auto_1742040 ) ) ( not ( = ?auto_1742037 ?auto_1742041 ) ) ( not ( = ?auto_1742037 ?auto_1742042 ) ) ( not ( = ?auto_1742037 ?auto_1742043 ) ) ( not ( = ?auto_1742037 ?auto_1742044 ) ) ( not ( = ?auto_1742037 ?auto_1742045 ) ) ( not ( = ?auto_1742037 ?auto_1742048 ) ) ( not ( = ?auto_1742039 ?auto_1742038 ) ) ( not ( = ?auto_1742039 ?auto_1742040 ) ) ( not ( = ?auto_1742039 ?auto_1742041 ) ) ( not ( = ?auto_1742039 ?auto_1742042 ) ) ( not ( = ?auto_1742039 ?auto_1742043 ) ) ( not ( = ?auto_1742039 ?auto_1742044 ) ) ( not ( = ?auto_1742039 ?auto_1742045 ) ) ( not ( = ?auto_1742039 ?auto_1742048 ) ) ( not ( = ?auto_1742038 ?auto_1742040 ) ) ( not ( = ?auto_1742038 ?auto_1742041 ) ) ( not ( = ?auto_1742038 ?auto_1742042 ) ) ( not ( = ?auto_1742038 ?auto_1742043 ) ) ( not ( = ?auto_1742038 ?auto_1742044 ) ) ( not ( = ?auto_1742038 ?auto_1742045 ) ) ( not ( = ?auto_1742038 ?auto_1742048 ) ) ( not ( = ?auto_1742040 ?auto_1742041 ) ) ( not ( = ?auto_1742040 ?auto_1742042 ) ) ( not ( = ?auto_1742040 ?auto_1742043 ) ) ( not ( = ?auto_1742040 ?auto_1742044 ) ) ( not ( = ?auto_1742040 ?auto_1742045 ) ) ( not ( = ?auto_1742040 ?auto_1742048 ) ) ( not ( = ?auto_1742041 ?auto_1742042 ) ) ( not ( = ?auto_1742041 ?auto_1742043 ) ) ( not ( = ?auto_1742041 ?auto_1742044 ) ) ( not ( = ?auto_1742041 ?auto_1742045 ) ) ( not ( = ?auto_1742041 ?auto_1742048 ) ) ( not ( = ?auto_1742042 ?auto_1742043 ) ) ( not ( = ?auto_1742042 ?auto_1742044 ) ) ( not ( = ?auto_1742042 ?auto_1742045 ) ) ( not ( = ?auto_1742042 ?auto_1742048 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742043 ?auto_1742044 ?auto_1742045 )
      ( MAKE-12CRATE-VERIFY ?auto_1742034 ?auto_1742035 ?auto_1742036 ?auto_1742033 ?auto_1742037 ?auto_1742039 ?auto_1742038 ?auto_1742040 ?auto_1742041 ?auto_1742042 ?auto_1742043 ?auto_1742044 ?auto_1742045 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1753613 - SURFACE
      ?auto_1753614 - SURFACE
      ?auto_1753615 - SURFACE
      ?auto_1753612 - SURFACE
      ?auto_1753616 - SURFACE
      ?auto_1753618 - SURFACE
      ?auto_1753617 - SURFACE
      ?auto_1753619 - SURFACE
      ?auto_1753620 - SURFACE
      ?auto_1753621 - SURFACE
      ?auto_1753622 - SURFACE
      ?auto_1753623 - SURFACE
      ?auto_1753624 - SURFACE
      ?auto_1753625 - SURFACE
    )
    :vars
    (
      ?auto_1753627 - HOIST
      ?auto_1753626 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1753627 ?auto_1753626 ) ( SURFACE-AT ?auto_1753624 ?auto_1753626 ) ( CLEAR ?auto_1753624 ) ( LIFTING ?auto_1753627 ?auto_1753625 ) ( IS-CRATE ?auto_1753625 ) ( not ( = ?auto_1753624 ?auto_1753625 ) ) ( ON ?auto_1753614 ?auto_1753613 ) ( ON ?auto_1753615 ?auto_1753614 ) ( ON ?auto_1753612 ?auto_1753615 ) ( ON ?auto_1753616 ?auto_1753612 ) ( ON ?auto_1753618 ?auto_1753616 ) ( ON ?auto_1753617 ?auto_1753618 ) ( ON ?auto_1753619 ?auto_1753617 ) ( ON ?auto_1753620 ?auto_1753619 ) ( ON ?auto_1753621 ?auto_1753620 ) ( ON ?auto_1753622 ?auto_1753621 ) ( ON ?auto_1753623 ?auto_1753622 ) ( ON ?auto_1753624 ?auto_1753623 ) ( not ( = ?auto_1753613 ?auto_1753614 ) ) ( not ( = ?auto_1753613 ?auto_1753615 ) ) ( not ( = ?auto_1753613 ?auto_1753612 ) ) ( not ( = ?auto_1753613 ?auto_1753616 ) ) ( not ( = ?auto_1753613 ?auto_1753618 ) ) ( not ( = ?auto_1753613 ?auto_1753617 ) ) ( not ( = ?auto_1753613 ?auto_1753619 ) ) ( not ( = ?auto_1753613 ?auto_1753620 ) ) ( not ( = ?auto_1753613 ?auto_1753621 ) ) ( not ( = ?auto_1753613 ?auto_1753622 ) ) ( not ( = ?auto_1753613 ?auto_1753623 ) ) ( not ( = ?auto_1753613 ?auto_1753624 ) ) ( not ( = ?auto_1753613 ?auto_1753625 ) ) ( not ( = ?auto_1753614 ?auto_1753615 ) ) ( not ( = ?auto_1753614 ?auto_1753612 ) ) ( not ( = ?auto_1753614 ?auto_1753616 ) ) ( not ( = ?auto_1753614 ?auto_1753618 ) ) ( not ( = ?auto_1753614 ?auto_1753617 ) ) ( not ( = ?auto_1753614 ?auto_1753619 ) ) ( not ( = ?auto_1753614 ?auto_1753620 ) ) ( not ( = ?auto_1753614 ?auto_1753621 ) ) ( not ( = ?auto_1753614 ?auto_1753622 ) ) ( not ( = ?auto_1753614 ?auto_1753623 ) ) ( not ( = ?auto_1753614 ?auto_1753624 ) ) ( not ( = ?auto_1753614 ?auto_1753625 ) ) ( not ( = ?auto_1753615 ?auto_1753612 ) ) ( not ( = ?auto_1753615 ?auto_1753616 ) ) ( not ( = ?auto_1753615 ?auto_1753618 ) ) ( not ( = ?auto_1753615 ?auto_1753617 ) ) ( not ( = ?auto_1753615 ?auto_1753619 ) ) ( not ( = ?auto_1753615 ?auto_1753620 ) ) ( not ( = ?auto_1753615 ?auto_1753621 ) ) ( not ( = ?auto_1753615 ?auto_1753622 ) ) ( not ( = ?auto_1753615 ?auto_1753623 ) ) ( not ( = ?auto_1753615 ?auto_1753624 ) ) ( not ( = ?auto_1753615 ?auto_1753625 ) ) ( not ( = ?auto_1753612 ?auto_1753616 ) ) ( not ( = ?auto_1753612 ?auto_1753618 ) ) ( not ( = ?auto_1753612 ?auto_1753617 ) ) ( not ( = ?auto_1753612 ?auto_1753619 ) ) ( not ( = ?auto_1753612 ?auto_1753620 ) ) ( not ( = ?auto_1753612 ?auto_1753621 ) ) ( not ( = ?auto_1753612 ?auto_1753622 ) ) ( not ( = ?auto_1753612 ?auto_1753623 ) ) ( not ( = ?auto_1753612 ?auto_1753624 ) ) ( not ( = ?auto_1753612 ?auto_1753625 ) ) ( not ( = ?auto_1753616 ?auto_1753618 ) ) ( not ( = ?auto_1753616 ?auto_1753617 ) ) ( not ( = ?auto_1753616 ?auto_1753619 ) ) ( not ( = ?auto_1753616 ?auto_1753620 ) ) ( not ( = ?auto_1753616 ?auto_1753621 ) ) ( not ( = ?auto_1753616 ?auto_1753622 ) ) ( not ( = ?auto_1753616 ?auto_1753623 ) ) ( not ( = ?auto_1753616 ?auto_1753624 ) ) ( not ( = ?auto_1753616 ?auto_1753625 ) ) ( not ( = ?auto_1753618 ?auto_1753617 ) ) ( not ( = ?auto_1753618 ?auto_1753619 ) ) ( not ( = ?auto_1753618 ?auto_1753620 ) ) ( not ( = ?auto_1753618 ?auto_1753621 ) ) ( not ( = ?auto_1753618 ?auto_1753622 ) ) ( not ( = ?auto_1753618 ?auto_1753623 ) ) ( not ( = ?auto_1753618 ?auto_1753624 ) ) ( not ( = ?auto_1753618 ?auto_1753625 ) ) ( not ( = ?auto_1753617 ?auto_1753619 ) ) ( not ( = ?auto_1753617 ?auto_1753620 ) ) ( not ( = ?auto_1753617 ?auto_1753621 ) ) ( not ( = ?auto_1753617 ?auto_1753622 ) ) ( not ( = ?auto_1753617 ?auto_1753623 ) ) ( not ( = ?auto_1753617 ?auto_1753624 ) ) ( not ( = ?auto_1753617 ?auto_1753625 ) ) ( not ( = ?auto_1753619 ?auto_1753620 ) ) ( not ( = ?auto_1753619 ?auto_1753621 ) ) ( not ( = ?auto_1753619 ?auto_1753622 ) ) ( not ( = ?auto_1753619 ?auto_1753623 ) ) ( not ( = ?auto_1753619 ?auto_1753624 ) ) ( not ( = ?auto_1753619 ?auto_1753625 ) ) ( not ( = ?auto_1753620 ?auto_1753621 ) ) ( not ( = ?auto_1753620 ?auto_1753622 ) ) ( not ( = ?auto_1753620 ?auto_1753623 ) ) ( not ( = ?auto_1753620 ?auto_1753624 ) ) ( not ( = ?auto_1753620 ?auto_1753625 ) ) ( not ( = ?auto_1753621 ?auto_1753622 ) ) ( not ( = ?auto_1753621 ?auto_1753623 ) ) ( not ( = ?auto_1753621 ?auto_1753624 ) ) ( not ( = ?auto_1753621 ?auto_1753625 ) ) ( not ( = ?auto_1753622 ?auto_1753623 ) ) ( not ( = ?auto_1753622 ?auto_1753624 ) ) ( not ( = ?auto_1753622 ?auto_1753625 ) ) ( not ( = ?auto_1753623 ?auto_1753624 ) ) ( not ( = ?auto_1753623 ?auto_1753625 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1753624 ?auto_1753625 )
      ( MAKE-13CRATE-VERIFY ?auto_1753613 ?auto_1753614 ?auto_1753615 ?auto_1753612 ?auto_1753616 ?auto_1753618 ?auto_1753617 ?auto_1753619 ?auto_1753620 ?auto_1753621 ?auto_1753622 ?auto_1753623 ?auto_1753624 ?auto_1753625 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1753755 - SURFACE
      ?auto_1753756 - SURFACE
      ?auto_1753757 - SURFACE
      ?auto_1753754 - SURFACE
      ?auto_1753758 - SURFACE
      ?auto_1753760 - SURFACE
      ?auto_1753759 - SURFACE
      ?auto_1753761 - SURFACE
      ?auto_1753762 - SURFACE
      ?auto_1753763 - SURFACE
      ?auto_1753764 - SURFACE
      ?auto_1753765 - SURFACE
      ?auto_1753766 - SURFACE
      ?auto_1753767 - SURFACE
    )
    :vars
    (
      ?auto_1753768 - HOIST
      ?auto_1753770 - PLACE
      ?auto_1753769 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1753768 ?auto_1753770 ) ( SURFACE-AT ?auto_1753766 ?auto_1753770 ) ( CLEAR ?auto_1753766 ) ( IS-CRATE ?auto_1753767 ) ( not ( = ?auto_1753766 ?auto_1753767 ) ) ( TRUCK-AT ?auto_1753769 ?auto_1753770 ) ( AVAILABLE ?auto_1753768 ) ( IN ?auto_1753767 ?auto_1753769 ) ( ON ?auto_1753766 ?auto_1753765 ) ( not ( = ?auto_1753765 ?auto_1753766 ) ) ( not ( = ?auto_1753765 ?auto_1753767 ) ) ( ON ?auto_1753756 ?auto_1753755 ) ( ON ?auto_1753757 ?auto_1753756 ) ( ON ?auto_1753754 ?auto_1753757 ) ( ON ?auto_1753758 ?auto_1753754 ) ( ON ?auto_1753760 ?auto_1753758 ) ( ON ?auto_1753759 ?auto_1753760 ) ( ON ?auto_1753761 ?auto_1753759 ) ( ON ?auto_1753762 ?auto_1753761 ) ( ON ?auto_1753763 ?auto_1753762 ) ( ON ?auto_1753764 ?auto_1753763 ) ( ON ?auto_1753765 ?auto_1753764 ) ( not ( = ?auto_1753755 ?auto_1753756 ) ) ( not ( = ?auto_1753755 ?auto_1753757 ) ) ( not ( = ?auto_1753755 ?auto_1753754 ) ) ( not ( = ?auto_1753755 ?auto_1753758 ) ) ( not ( = ?auto_1753755 ?auto_1753760 ) ) ( not ( = ?auto_1753755 ?auto_1753759 ) ) ( not ( = ?auto_1753755 ?auto_1753761 ) ) ( not ( = ?auto_1753755 ?auto_1753762 ) ) ( not ( = ?auto_1753755 ?auto_1753763 ) ) ( not ( = ?auto_1753755 ?auto_1753764 ) ) ( not ( = ?auto_1753755 ?auto_1753765 ) ) ( not ( = ?auto_1753755 ?auto_1753766 ) ) ( not ( = ?auto_1753755 ?auto_1753767 ) ) ( not ( = ?auto_1753756 ?auto_1753757 ) ) ( not ( = ?auto_1753756 ?auto_1753754 ) ) ( not ( = ?auto_1753756 ?auto_1753758 ) ) ( not ( = ?auto_1753756 ?auto_1753760 ) ) ( not ( = ?auto_1753756 ?auto_1753759 ) ) ( not ( = ?auto_1753756 ?auto_1753761 ) ) ( not ( = ?auto_1753756 ?auto_1753762 ) ) ( not ( = ?auto_1753756 ?auto_1753763 ) ) ( not ( = ?auto_1753756 ?auto_1753764 ) ) ( not ( = ?auto_1753756 ?auto_1753765 ) ) ( not ( = ?auto_1753756 ?auto_1753766 ) ) ( not ( = ?auto_1753756 ?auto_1753767 ) ) ( not ( = ?auto_1753757 ?auto_1753754 ) ) ( not ( = ?auto_1753757 ?auto_1753758 ) ) ( not ( = ?auto_1753757 ?auto_1753760 ) ) ( not ( = ?auto_1753757 ?auto_1753759 ) ) ( not ( = ?auto_1753757 ?auto_1753761 ) ) ( not ( = ?auto_1753757 ?auto_1753762 ) ) ( not ( = ?auto_1753757 ?auto_1753763 ) ) ( not ( = ?auto_1753757 ?auto_1753764 ) ) ( not ( = ?auto_1753757 ?auto_1753765 ) ) ( not ( = ?auto_1753757 ?auto_1753766 ) ) ( not ( = ?auto_1753757 ?auto_1753767 ) ) ( not ( = ?auto_1753754 ?auto_1753758 ) ) ( not ( = ?auto_1753754 ?auto_1753760 ) ) ( not ( = ?auto_1753754 ?auto_1753759 ) ) ( not ( = ?auto_1753754 ?auto_1753761 ) ) ( not ( = ?auto_1753754 ?auto_1753762 ) ) ( not ( = ?auto_1753754 ?auto_1753763 ) ) ( not ( = ?auto_1753754 ?auto_1753764 ) ) ( not ( = ?auto_1753754 ?auto_1753765 ) ) ( not ( = ?auto_1753754 ?auto_1753766 ) ) ( not ( = ?auto_1753754 ?auto_1753767 ) ) ( not ( = ?auto_1753758 ?auto_1753760 ) ) ( not ( = ?auto_1753758 ?auto_1753759 ) ) ( not ( = ?auto_1753758 ?auto_1753761 ) ) ( not ( = ?auto_1753758 ?auto_1753762 ) ) ( not ( = ?auto_1753758 ?auto_1753763 ) ) ( not ( = ?auto_1753758 ?auto_1753764 ) ) ( not ( = ?auto_1753758 ?auto_1753765 ) ) ( not ( = ?auto_1753758 ?auto_1753766 ) ) ( not ( = ?auto_1753758 ?auto_1753767 ) ) ( not ( = ?auto_1753760 ?auto_1753759 ) ) ( not ( = ?auto_1753760 ?auto_1753761 ) ) ( not ( = ?auto_1753760 ?auto_1753762 ) ) ( not ( = ?auto_1753760 ?auto_1753763 ) ) ( not ( = ?auto_1753760 ?auto_1753764 ) ) ( not ( = ?auto_1753760 ?auto_1753765 ) ) ( not ( = ?auto_1753760 ?auto_1753766 ) ) ( not ( = ?auto_1753760 ?auto_1753767 ) ) ( not ( = ?auto_1753759 ?auto_1753761 ) ) ( not ( = ?auto_1753759 ?auto_1753762 ) ) ( not ( = ?auto_1753759 ?auto_1753763 ) ) ( not ( = ?auto_1753759 ?auto_1753764 ) ) ( not ( = ?auto_1753759 ?auto_1753765 ) ) ( not ( = ?auto_1753759 ?auto_1753766 ) ) ( not ( = ?auto_1753759 ?auto_1753767 ) ) ( not ( = ?auto_1753761 ?auto_1753762 ) ) ( not ( = ?auto_1753761 ?auto_1753763 ) ) ( not ( = ?auto_1753761 ?auto_1753764 ) ) ( not ( = ?auto_1753761 ?auto_1753765 ) ) ( not ( = ?auto_1753761 ?auto_1753766 ) ) ( not ( = ?auto_1753761 ?auto_1753767 ) ) ( not ( = ?auto_1753762 ?auto_1753763 ) ) ( not ( = ?auto_1753762 ?auto_1753764 ) ) ( not ( = ?auto_1753762 ?auto_1753765 ) ) ( not ( = ?auto_1753762 ?auto_1753766 ) ) ( not ( = ?auto_1753762 ?auto_1753767 ) ) ( not ( = ?auto_1753763 ?auto_1753764 ) ) ( not ( = ?auto_1753763 ?auto_1753765 ) ) ( not ( = ?auto_1753763 ?auto_1753766 ) ) ( not ( = ?auto_1753763 ?auto_1753767 ) ) ( not ( = ?auto_1753764 ?auto_1753765 ) ) ( not ( = ?auto_1753764 ?auto_1753766 ) ) ( not ( = ?auto_1753764 ?auto_1753767 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1753765 ?auto_1753766 ?auto_1753767 )
      ( MAKE-13CRATE-VERIFY ?auto_1753755 ?auto_1753756 ?auto_1753757 ?auto_1753754 ?auto_1753758 ?auto_1753760 ?auto_1753759 ?auto_1753761 ?auto_1753762 ?auto_1753763 ?auto_1753764 ?auto_1753765 ?auto_1753766 ?auto_1753767 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1753911 - SURFACE
      ?auto_1753912 - SURFACE
      ?auto_1753913 - SURFACE
      ?auto_1753910 - SURFACE
      ?auto_1753914 - SURFACE
      ?auto_1753916 - SURFACE
      ?auto_1753915 - SURFACE
      ?auto_1753917 - SURFACE
      ?auto_1753918 - SURFACE
      ?auto_1753919 - SURFACE
      ?auto_1753920 - SURFACE
      ?auto_1753921 - SURFACE
      ?auto_1753922 - SURFACE
      ?auto_1753923 - SURFACE
    )
    :vars
    (
      ?auto_1753926 - HOIST
      ?auto_1753924 - PLACE
      ?auto_1753927 - TRUCK
      ?auto_1753925 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1753926 ?auto_1753924 ) ( SURFACE-AT ?auto_1753922 ?auto_1753924 ) ( CLEAR ?auto_1753922 ) ( IS-CRATE ?auto_1753923 ) ( not ( = ?auto_1753922 ?auto_1753923 ) ) ( AVAILABLE ?auto_1753926 ) ( IN ?auto_1753923 ?auto_1753927 ) ( ON ?auto_1753922 ?auto_1753921 ) ( not ( = ?auto_1753921 ?auto_1753922 ) ) ( not ( = ?auto_1753921 ?auto_1753923 ) ) ( TRUCK-AT ?auto_1753927 ?auto_1753925 ) ( not ( = ?auto_1753925 ?auto_1753924 ) ) ( ON ?auto_1753912 ?auto_1753911 ) ( ON ?auto_1753913 ?auto_1753912 ) ( ON ?auto_1753910 ?auto_1753913 ) ( ON ?auto_1753914 ?auto_1753910 ) ( ON ?auto_1753916 ?auto_1753914 ) ( ON ?auto_1753915 ?auto_1753916 ) ( ON ?auto_1753917 ?auto_1753915 ) ( ON ?auto_1753918 ?auto_1753917 ) ( ON ?auto_1753919 ?auto_1753918 ) ( ON ?auto_1753920 ?auto_1753919 ) ( ON ?auto_1753921 ?auto_1753920 ) ( not ( = ?auto_1753911 ?auto_1753912 ) ) ( not ( = ?auto_1753911 ?auto_1753913 ) ) ( not ( = ?auto_1753911 ?auto_1753910 ) ) ( not ( = ?auto_1753911 ?auto_1753914 ) ) ( not ( = ?auto_1753911 ?auto_1753916 ) ) ( not ( = ?auto_1753911 ?auto_1753915 ) ) ( not ( = ?auto_1753911 ?auto_1753917 ) ) ( not ( = ?auto_1753911 ?auto_1753918 ) ) ( not ( = ?auto_1753911 ?auto_1753919 ) ) ( not ( = ?auto_1753911 ?auto_1753920 ) ) ( not ( = ?auto_1753911 ?auto_1753921 ) ) ( not ( = ?auto_1753911 ?auto_1753922 ) ) ( not ( = ?auto_1753911 ?auto_1753923 ) ) ( not ( = ?auto_1753912 ?auto_1753913 ) ) ( not ( = ?auto_1753912 ?auto_1753910 ) ) ( not ( = ?auto_1753912 ?auto_1753914 ) ) ( not ( = ?auto_1753912 ?auto_1753916 ) ) ( not ( = ?auto_1753912 ?auto_1753915 ) ) ( not ( = ?auto_1753912 ?auto_1753917 ) ) ( not ( = ?auto_1753912 ?auto_1753918 ) ) ( not ( = ?auto_1753912 ?auto_1753919 ) ) ( not ( = ?auto_1753912 ?auto_1753920 ) ) ( not ( = ?auto_1753912 ?auto_1753921 ) ) ( not ( = ?auto_1753912 ?auto_1753922 ) ) ( not ( = ?auto_1753912 ?auto_1753923 ) ) ( not ( = ?auto_1753913 ?auto_1753910 ) ) ( not ( = ?auto_1753913 ?auto_1753914 ) ) ( not ( = ?auto_1753913 ?auto_1753916 ) ) ( not ( = ?auto_1753913 ?auto_1753915 ) ) ( not ( = ?auto_1753913 ?auto_1753917 ) ) ( not ( = ?auto_1753913 ?auto_1753918 ) ) ( not ( = ?auto_1753913 ?auto_1753919 ) ) ( not ( = ?auto_1753913 ?auto_1753920 ) ) ( not ( = ?auto_1753913 ?auto_1753921 ) ) ( not ( = ?auto_1753913 ?auto_1753922 ) ) ( not ( = ?auto_1753913 ?auto_1753923 ) ) ( not ( = ?auto_1753910 ?auto_1753914 ) ) ( not ( = ?auto_1753910 ?auto_1753916 ) ) ( not ( = ?auto_1753910 ?auto_1753915 ) ) ( not ( = ?auto_1753910 ?auto_1753917 ) ) ( not ( = ?auto_1753910 ?auto_1753918 ) ) ( not ( = ?auto_1753910 ?auto_1753919 ) ) ( not ( = ?auto_1753910 ?auto_1753920 ) ) ( not ( = ?auto_1753910 ?auto_1753921 ) ) ( not ( = ?auto_1753910 ?auto_1753922 ) ) ( not ( = ?auto_1753910 ?auto_1753923 ) ) ( not ( = ?auto_1753914 ?auto_1753916 ) ) ( not ( = ?auto_1753914 ?auto_1753915 ) ) ( not ( = ?auto_1753914 ?auto_1753917 ) ) ( not ( = ?auto_1753914 ?auto_1753918 ) ) ( not ( = ?auto_1753914 ?auto_1753919 ) ) ( not ( = ?auto_1753914 ?auto_1753920 ) ) ( not ( = ?auto_1753914 ?auto_1753921 ) ) ( not ( = ?auto_1753914 ?auto_1753922 ) ) ( not ( = ?auto_1753914 ?auto_1753923 ) ) ( not ( = ?auto_1753916 ?auto_1753915 ) ) ( not ( = ?auto_1753916 ?auto_1753917 ) ) ( not ( = ?auto_1753916 ?auto_1753918 ) ) ( not ( = ?auto_1753916 ?auto_1753919 ) ) ( not ( = ?auto_1753916 ?auto_1753920 ) ) ( not ( = ?auto_1753916 ?auto_1753921 ) ) ( not ( = ?auto_1753916 ?auto_1753922 ) ) ( not ( = ?auto_1753916 ?auto_1753923 ) ) ( not ( = ?auto_1753915 ?auto_1753917 ) ) ( not ( = ?auto_1753915 ?auto_1753918 ) ) ( not ( = ?auto_1753915 ?auto_1753919 ) ) ( not ( = ?auto_1753915 ?auto_1753920 ) ) ( not ( = ?auto_1753915 ?auto_1753921 ) ) ( not ( = ?auto_1753915 ?auto_1753922 ) ) ( not ( = ?auto_1753915 ?auto_1753923 ) ) ( not ( = ?auto_1753917 ?auto_1753918 ) ) ( not ( = ?auto_1753917 ?auto_1753919 ) ) ( not ( = ?auto_1753917 ?auto_1753920 ) ) ( not ( = ?auto_1753917 ?auto_1753921 ) ) ( not ( = ?auto_1753917 ?auto_1753922 ) ) ( not ( = ?auto_1753917 ?auto_1753923 ) ) ( not ( = ?auto_1753918 ?auto_1753919 ) ) ( not ( = ?auto_1753918 ?auto_1753920 ) ) ( not ( = ?auto_1753918 ?auto_1753921 ) ) ( not ( = ?auto_1753918 ?auto_1753922 ) ) ( not ( = ?auto_1753918 ?auto_1753923 ) ) ( not ( = ?auto_1753919 ?auto_1753920 ) ) ( not ( = ?auto_1753919 ?auto_1753921 ) ) ( not ( = ?auto_1753919 ?auto_1753922 ) ) ( not ( = ?auto_1753919 ?auto_1753923 ) ) ( not ( = ?auto_1753920 ?auto_1753921 ) ) ( not ( = ?auto_1753920 ?auto_1753922 ) ) ( not ( = ?auto_1753920 ?auto_1753923 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1753921 ?auto_1753922 ?auto_1753923 )
      ( MAKE-13CRATE-VERIFY ?auto_1753911 ?auto_1753912 ?auto_1753913 ?auto_1753910 ?auto_1753914 ?auto_1753916 ?auto_1753915 ?auto_1753917 ?auto_1753918 ?auto_1753919 ?auto_1753920 ?auto_1753921 ?auto_1753922 ?auto_1753923 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1754080 - SURFACE
      ?auto_1754081 - SURFACE
      ?auto_1754082 - SURFACE
      ?auto_1754079 - SURFACE
      ?auto_1754083 - SURFACE
      ?auto_1754085 - SURFACE
      ?auto_1754084 - SURFACE
      ?auto_1754086 - SURFACE
      ?auto_1754087 - SURFACE
      ?auto_1754088 - SURFACE
      ?auto_1754089 - SURFACE
      ?auto_1754090 - SURFACE
      ?auto_1754091 - SURFACE
      ?auto_1754092 - SURFACE
    )
    :vars
    (
      ?auto_1754097 - HOIST
      ?auto_1754093 - PLACE
      ?auto_1754096 - TRUCK
      ?auto_1754095 - PLACE
      ?auto_1754094 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1754097 ?auto_1754093 ) ( SURFACE-AT ?auto_1754091 ?auto_1754093 ) ( CLEAR ?auto_1754091 ) ( IS-CRATE ?auto_1754092 ) ( not ( = ?auto_1754091 ?auto_1754092 ) ) ( AVAILABLE ?auto_1754097 ) ( ON ?auto_1754091 ?auto_1754090 ) ( not ( = ?auto_1754090 ?auto_1754091 ) ) ( not ( = ?auto_1754090 ?auto_1754092 ) ) ( TRUCK-AT ?auto_1754096 ?auto_1754095 ) ( not ( = ?auto_1754095 ?auto_1754093 ) ) ( HOIST-AT ?auto_1754094 ?auto_1754095 ) ( LIFTING ?auto_1754094 ?auto_1754092 ) ( not ( = ?auto_1754097 ?auto_1754094 ) ) ( ON ?auto_1754081 ?auto_1754080 ) ( ON ?auto_1754082 ?auto_1754081 ) ( ON ?auto_1754079 ?auto_1754082 ) ( ON ?auto_1754083 ?auto_1754079 ) ( ON ?auto_1754085 ?auto_1754083 ) ( ON ?auto_1754084 ?auto_1754085 ) ( ON ?auto_1754086 ?auto_1754084 ) ( ON ?auto_1754087 ?auto_1754086 ) ( ON ?auto_1754088 ?auto_1754087 ) ( ON ?auto_1754089 ?auto_1754088 ) ( ON ?auto_1754090 ?auto_1754089 ) ( not ( = ?auto_1754080 ?auto_1754081 ) ) ( not ( = ?auto_1754080 ?auto_1754082 ) ) ( not ( = ?auto_1754080 ?auto_1754079 ) ) ( not ( = ?auto_1754080 ?auto_1754083 ) ) ( not ( = ?auto_1754080 ?auto_1754085 ) ) ( not ( = ?auto_1754080 ?auto_1754084 ) ) ( not ( = ?auto_1754080 ?auto_1754086 ) ) ( not ( = ?auto_1754080 ?auto_1754087 ) ) ( not ( = ?auto_1754080 ?auto_1754088 ) ) ( not ( = ?auto_1754080 ?auto_1754089 ) ) ( not ( = ?auto_1754080 ?auto_1754090 ) ) ( not ( = ?auto_1754080 ?auto_1754091 ) ) ( not ( = ?auto_1754080 ?auto_1754092 ) ) ( not ( = ?auto_1754081 ?auto_1754082 ) ) ( not ( = ?auto_1754081 ?auto_1754079 ) ) ( not ( = ?auto_1754081 ?auto_1754083 ) ) ( not ( = ?auto_1754081 ?auto_1754085 ) ) ( not ( = ?auto_1754081 ?auto_1754084 ) ) ( not ( = ?auto_1754081 ?auto_1754086 ) ) ( not ( = ?auto_1754081 ?auto_1754087 ) ) ( not ( = ?auto_1754081 ?auto_1754088 ) ) ( not ( = ?auto_1754081 ?auto_1754089 ) ) ( not ( = ?auto_1754081 ?auto_1754090 ) ) ( not ( = ?auto_1754081 ?auto_1754091 ) ) ( not ( = ?auto_1754081 ?auto_1754092 ) ) ( not ( = ?auto_1754082 ?auto_1754079 ) ) ( not ( = ?auto_1754082 ?auto_1754083 ) ) ( not ( = ?auto_1754082 ?auto_1754085 ) ) ( not ( = ?auto_1754082 ?auto_1754084 ) ) ( not ( = ?auto_1754082 ?auto_1754086 ) ) ( not ( = ?auto_1754082 ?auto_1754087 ) ) ( not ( = ?auto_1754082 ?auto_1754088 ) ) ( not ( = ?auto_1754082 ?auto_1754089 ) ) ( not ( = ?auto_1754082 ?auto_1754090 ) ) ( not ( = ?auto_1754082 ?auto_1754091 ) ) ( not ( = ?auto_1754082 ?auto_1754092 ) ) ( not ( = ?auto_1754079 ?auto_1754083 ) ) ( not ( = ?auto_1754079 ?auto_1754085 ) ) ( not ( = ?auto_1754079 ?auto_1754084 ) ) ( not ( = ?auto_1754079 ?auto_1754086 ) ) ( not ( = ?auto_1754079 ?auto_1754087 ) ) ( not ( = ?auto_1754079 ?auto_1754088 ) ) ( not ( = ?auto_1754079 ?auto_1754089 ) ) ( not ( = ?auto_1754079 ?auto_1754090 ) ) ( not ( = ?auto_1754079 ?auto_1754091 ) ) ( not ( = ?auto_1754079 ?auto_1754092 ) ) ( not ( = ?auto_1754083 ?auto_1754085 ) ) ( not ( = ?auto_1754083 ?auto_1754084 ) ) ( not ( = ?auto_1754083 ?auto_1754086 ) ) ( not ( = ?auto_1754083 ?auto_1754087 ) ) ( not ( = ?auto_1754083 ?auto_1754088 ) ) ( not ( = ?auto_1754083 ?auto_1754089 ) ) ( not ( = ?auto_1754083 ?auto_1754090 ) ) ( not ( = ?auto_1754083 ?auto_1754091 ) ) ( not ( = ?auto_1754083 ?auto_1754092 ) ) ( not ( = ?auto_1754085 ?auto_1754084 ) ) ( not ( = ?auto_1754085 ?auto_1754086 ) ) ( not ( = ?auto_1754085 ?auto_1754087 ) ) ( not ( = ?auto_1754085 ?auto_1754088 ) ) ( not ( = ?auto_1754085 ?auto_1754089 ) ) ( not ( = ?auto_1754085 ?auto_1754090 ) ) ( not ( = ?auto_1754085 ?auto_1754091 ) ) ( not ( = ?auto_1754085 ?auto_1754092 ) ) ( not ( = ?auto_1754084 ?auto_1754086 ) ) ( not ( = ?auto_1754084 ?auto_1754087 ) ) ( not ( = ?auto_1754084 ?auto_1754088 ) ) ( not ( = ?auto_1754084 ?auto_1754089 ) ) ( not ( = ?auto_1754084 ?auto_1754090 ) ) ( not ( = ?auto_1754084 ?auto_1754091 ) ) ( not ( = ?auto_1754084 ?auto_1754092 ) ) ( not ( = ?auto_1754086 ?auto_1754087 ) ) ( not ( = ?auto_1754086 ?auto_1754088 ) ) ( not ( = ?auto_1754086 ?auto_1754089 ) ) ( not ( = ?auto_1754086 ?auto_1754090 ) ) ( not ( = ?auto_1754086 ?auto_1754091 ) ) ( not ( = ?auto_1754086 ?auto_1754092 ) ) ( not ( = ?auto_1754087 ?auto_1754088 ) ) ( not ( = ?auto_1754087 ?auto_1754089 ) ) ( not ( = ?auto_1754087 ?auto_1754090 ) ) ( not ( = ?auto_1754087 ?auto_1754091 ) ) ( not ( = ?auto_1754087 ?auto_1754092 ) ) ( not ( = ?auto_1754088 ?auto_1754089 ) ) ( not ( = ?auto_1754088 ?auto_1754090 ) ) ( not ( = ?auto_1754088 ?auto_1754091 ) ) ( not ( = ?auto_1754088 ?auto_1754092 ) ) ( not ( = ?auto_1754089 ?auto_1754090 ) ) ( not ( = ?auto_1754089 ?auto_1754091 ) ) ( not ( = ?auto_1754089 ?auto_1754092 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1754090 ?auto_1754091 ?auto_1754092 )
      ( MAKE-13CRATE-VERIFY ?auto_1754080 ?auto_1754081 ?auto_1754082 ?auto_1754079 ?auto_1754083 ?auto_1754085 ?auto_1754084 ?auto_1754086 ?auto_1754087 ?auto_1754088 ?auto_1754089 ?auto_1754090 ?auto_1754091 ?auto_1754092 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1754262 - SURFACE
      ?auto_1754263 - SURFACE
      ?auto_1754264 - SURFACE
      ?auto_1754261 - SURFACE
      ?auto_1754265 - SURFACE
      ?auto_1754267 - SURFACE
      ?auto_1754266 - SURFACE
      ?auto_1754268 - SURFACE
      ?auto_1754269 - SURFACE
      ?auto_1754270 - SURFACE
      ?auto_1754271 - SURFACE
      ?auto_1754272 - SURFACE
      ?auto_1754273 - SURFACE
      ?auto_1754274 - SURFACE
    )
    :vars
    (
      ?auto_1754280 - HOIST
      ?auto_1754277 - PLACE
      ?auto_1754279 - TRUCK
      ?auto_1754275 - PLACE
      ?auto_1754276 - HOIST
      ?auto_1754278 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1754280 ?auto_1754277 ) ( SURFACE-AT ?auto_1754273 ?auto_1754277 ) ( CLEAR ?auto_1754273 ) ( IS-CRATE ?auto_1754274 ) ( not ( = ?auto_1754273 ?auto_1754274 ) ) ( AVAILABLE ?auto_1754280 ) ( ON ?auto_1754273 ?auto_1754272 ) ( not ( = ?auto_1754272 ?auto_1754273 ) ) ( not ( = ?auto_1754272 ?auto_1754274 ) ) ( TRUCK-AT ?auto_1754279 ?auto_1754275 ) ( not ( = ?auto_1754275 ?auto_1754277 ) ) ( HOIST-AT ?auto_1754276 ?auto_1754275 ) ( not ( = ?auto_1754280 ?auto_1754276 ) ) ( AVAILABLE ?auto_1754276 ) ( SURFACE-AT ?auto_1754274 ?auto_1754275 ) ( ON ?auto_1754274 ?auto_1754278 ) ( CLEAR ?auto_1754274 ) ( not ( = ?auto_1754273 ?auto_1754278 ) ) ( not ( = ?auto_1754274 ?auto_1754278 ) ) ( not ( = ?auto_1754272 ?auto_1754278 ) ) ( ON ?auto_1754263 ?auto_1754262 ) ( ON ?auto_1754264 ?auto_1754263 ) ( ON ?auto_1754261 ?auto_1754264 ) ( ON ?auto_1754265 ?auto_1754261 ) ( ON ?auto_1754267 ?auto_1754265 ) ( ON ?auto_1754266 ?auto_1754267 ) ( ON ?auto_1754268 ?auto_1754266 ) ( ON ?auto_1754269 ?auto_1754268 ) ( ON ?auto_1754270 ?auto_1754269 ) ( ON ?auto_1754271 ?auto_1754270 ) ( ON ?auto_1754272 ?auto_1754271 ) ( not ( = ?auto_1754262 ?auto_1754263 ) ) ( not ( = ?auto_1754262 ?auto_1754264 ) ) ( not ( = ?auto_1754262 ?auto_1754261 ) ) ( not ( = ?auto_1754262 ?auto_1754265 ) ) ( not ( = ?auto_1754262 ?auto_1754267 ) ) ( not ( = ?auto_1754262 ?auto_1754266 ) ) ( not ( = ?auto_1754262 ?auto_1754268 ) ) ( not ( = ?auto_1754262 ?auto_1754269 ) ) ( not ( = ?auto_1754262 ?auto_1754270 ) ) ( not ( = ?auto_1754262 ?auto_1754271 ) ) ( not ( = ?auto_1754262 ?auto_1754272 ) ) ( not ( = ?auto_1754262 ?auto_1754273 ) ) ( not ( = ?auto_1754262 ?auto_1754274 ) ) ( not ( = ?auto_1754262 ?auto_1754278 ) ) ( not ( = ?auto_1754263 ?auto_1754264 ) ) ( not ( = ?auto_1754263 ?auto_1754261 ) ) ( not ( = ?auto_1754263 ?auto_1754265 ) ) ( not ( = ?auto_1754263 ?auto_1754267 ) ) ( not ( = ?auto_1754263 ?auto_1754266 ) ) ( not ( = ?auto_1754263 ?auto_1754268 ) ) ( not ( = ?auto_1754263 ?auto_1754269 ) ) ( not ( = ?auto_1754263 ?auto_1754270 ) ) ( not ( = ?auto_1754263 ?auto_1754271 ) ) ( not ( = ?auto_1754263 ?auto_1754272 ) ) ( not ( = ?auto_1754263 ?auto_1754273 ) ) ( not ( = ?auto_1754263 ?auto_1754274 ) ) ( not ( = ?auto_1754263 ?auto_1754278 ) ) ( not ( = ?auto_1754264 ?auto_1754261 ) ) ( not ( = ?auto_1754264 ?auto_1754265 ) ) ( not ( = ?auto_1754264 ?auto_1754267 ) ) ( not ( = ?auto_1754264 ?auto_1754266 ) ) ( not ( = ?auto_1754264 ?auto_1754268 ) ) ( not ( = ?auto_1754264 ?auto_1754269 ) ) ( not ( = ?auto_1754264 ?auto_1754270 ) ) ( not ( = ?auto_1754264 ?auto_1754271 ) ) ( not ( = ?auto_1754264 ?auto_1754272 ) ) ( not ( = ?auto_1754264 ?auto_1754273 ) ) ( not ( = ?auto_1754264 ?auto_1754274 ) ) ( not ( = ?auto_1754264 ?auto_1754278 ) ) ( not ( = ?auto_1754261 ?auto_1754265 ) ) ( not ( = ?auto_1754261 ?auto_1754267 ) ) ( not ( = ?auto_1754261 ?auto_1754266 ) ) ( not ( = ?auto_1754261 ?auto_1754268 ) ) ( not ( = ?auto_1754261 ?auto_1754269 ) ) ( not ( = ?auto_1754261 ?auto_1754270 ) ) ( not ( = ?auto_1754261 ?auto_1754271 ) ) ( not ( = ?auto_1754261 ?auto_1754272 ) ) ( not ( = ?auto_1754261 ?auto_1754273 ) ) ( not ( = ?auto_1754261 ?auto_1754274 ) ) ( not ( = ?auto_1754261 ?auto_1754278 ) ) ( not ( = ?auto_1754265 ?auto_1754267 ) ) ( not ( = ?auto_1754265 ?auto_1754266 ) ) ( not ( = ?auto_1754265 ?auto_1754268 ) ) ( not ( = ?auto_1754265 ?auto_1754269 ) ) ( not ( = ?auto_1754265 ?auto_1754270 ) ) ( not ( = ?auto_1754265 ?auto_1754271 ) ) ( not ( = ?auto_1754265 ?auto_1754272 ) ) ( not ( = ?auto_1754265 ?auto_1754273 ) ) ( not ( = ?auto_1754265 ?auto_1754274 ) ) ( not ( = ?auto_1754265 ?auto_1754278 ) ) ( not ( = ?auto_1754267 ?auto_1754266 ) ) ( not ( = ?auto_1754267 ?auto_1754268 ) ) ( not ( = ?auto_1754267 ?auto_1754269 ) ) ( not ( = ?auto_1754267 ?auto_1754270 ) ) ( not ( = ?auto_1754267 ?auto_1754271 ) ) ( not ( = ?auto_1754267 ?auto_1754272 ) ) ( not ( = ?auto_1754267 ?auto_1754273 ) ) ( not ( = ?auto_1754267 ?auto_1754274 ) ) ( not ( = ?auto_1754267 ?auto_1754278 ) ) ( not ( = ?auto_1754266 ?auto_1754268 ) ) ( not ( = ?auto_1754266 ?auto_1754269 ) ) ( not ( = ?auto_1754266 ?auto_1754270 ) ) ( not ( = ?auto_1754266 ?auto_1754271 ) ) ( not ( = ?auto_1754266 ?auto_1754272 ) ) ( not ( = ?auto_1754266 ?auto_1754273 ) ) ( not ( = ?auto_1754266 ?auto_1754274 ) ) ( not ( = ?auto_1754266 ?auto_1754278 ) ) ( not ( = ?auto_1754268 ?auto_1754269 ) ) ( not ( = ?auto_1754268 ?auto_1754270 ) ) ( not ( = ?auto_1754268 ?auto_1754271 ) ) ( not ( = ?auto_1754268 ?auto_1754272 ) ) ( not ( = ?auto_1754268 ?auto_1754273 ) ) ( not ( = ?auto_1754268 ?auto_1754274 ) ) ( not ( = ?auto_1754268 ?auto_1754278 ) ) ( not ( = ?auto_1754269 ?auto_1754270 ) ) ( not ( = ?auto_1754269 ?auto_1754271 ) ) ( not ( = ?auto_1754269 ?auto_1754272 ) ) ( not ( = ?auto_1754269 ?auto_1754273 ) ) ( not ( = ?auto_1754269 ?auto_1754274 ) ) ( not ( = ?auto_1754269 ?auto_1754278 ) ) ( not ( = ?auto_1754270 ?auto_1754271 ) ) ( not ( = ?auto_1754270 ?auto_1754272 ) ) ( not ( = ?auto_1754270 ?auto_1754273 ) ) ( not ( = ?auto_1754270 ?auto_1754274 ) ) ( not ( = ?auto_1754270 ?auto_1754278 ) ) ( not ( = ?auto_1754271 ?auto_1754272 ) ) ( not ( = ?auto_1754271 ?auto_1754273 ) ) ( not ( = ?auto_1754271 ?auto_1754274 ) ) ( not ( = ?auto_1754271 ?auto_1754278 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1754272 ?auto_1754273 ?auto_1754274 )
      ( MAKE-13CRATE-VERIFY ?auto_1754262 ?auto_1754263 ?auto_1754264 ?auto_1754261 ?auto_1754265 ?auto_1754267 ?auto_1754266 ?auto_1754268 ?auto_1754269 ?auto_1754270 ?auto_1754271 ?auto_1754272 ?auto_1754273 ?auto_1754274 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1754445 - SURFACE
      ?auto_1754446 - SURFACE
      ?auto_1754447 - SURFACE
      ?auto_1754444 - SURFACE
      ?auto_1754448 - SURFACE
      ?auto_1754450 - SURFACE
      ?auto_1754449 - SURFACE
      ?auto_1754451 - SURFACE
      ?auto_1754452 - SURFACE
      ?auto_1754453 - SURFACE
      ?auto_1754454 - SURFACE
      ?auto_1754455 - SURFACE
      ?auto_1754456 - SURFACE
      ?auto_1754457 - SURFACE
    )
    :vars
    (
      ?auto_1754461 - HOIST
      ?auto_1754458 - PLACE
      ?auto_1754459 - PLACE
      ?auto_1754463 - HOIST
      ?auto_1754460 - SURFACE
      ?auto_1754462 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1754461 ?auto_1754458 ) ( SURFACE-AT ?auto_1754456 ?auto_1754458 ) ( CLEAR ?auto_1754456 ) ( IS-CRATE ?auto_1754457 ) ( not ( = ?auto_1754456 ?auto_1754457 ) ) ( AVAILABLE ?auto_1754461 ) ( ON ?auto_1754456 ?auto_1754455 ) ( not ( = ?auto_1754455 ?auto_1754456 ) ) ( not ( = ?auto_1754455 ?auto_1754457 ) ) ( not ( = ?auto_1754459 ?auto_1754458 ) ) ( HOIST-AT ?auto_1754463 ?auto_1754459 ) ( not ( = ?auto_1754461 ?auto_1754463 ) ) ( AVAILABLE ?auto_1754463 ) ( SURFACE-AT ?auto_1754457 ?auto_1754459 ) ( ON ?auto_1754457 ?auto_1754460 ) ( CLEAR ?auto_1754457 ) ( not ( = ?auto_1754456 ?auto_1754460 ) ) ( not ( = ?auto_1754457 ?auto_1754460 ) ) ( not ( = ?auto_1754455 ?auto_1754460 ) ) ( TRUCK-AT ?auto_1754462 ?auto_1754458 ) ( ON ?auto_1754446 ?auto_1754445 ) ( ON ?auto_1754447 ?auto_1754446 ) ( ON ?auto_1754444 ?auto_1754447 ) ( ON ?auto_1754448 ?auto_1754444 ) ( ON ?auto_1754450 ?auto_1754448 ) ( ON ?auto_1754449 ?auto_1754450 ) ( ON ?auto_1754451 ?auto_1754449 ) ( ON ?auto_1754452 ?auto_1754451 ) ( ON ?auto_1754453 ?auto_1754452 ) ( ON ?auto_1754454 ?auto_1754453 ) ( ON ?auto_1754455 ?auto_1754454 ) ( not ( = ?auto_1754445 ?auto_1754446 ) ) ( not ( = ?auto_1754445 ?auto_1754447 ) ) ( not ( = ?auto_1754445 ?auto_1754444 ) ) ( not ( = ?auto_1754445 ?auto_1754448 ) ) ( not ( = ?auto_1754445 ?auto_1754450 ) ) ( not ( = ?auto_1754445 ?auto_1754449 ) ) ( not ( = ?auto_1754445 ?auto_1754451 ) ) ( not ( = ?auto_1754445 ?auto_1754452 ) ) ( not ( = ?auto_1754445 ?auto_1754453 ) ) ( not ( = ?auto_1754445 ?auto_1754454 ) ) ( not ( = ?auto_1754445 ?auto_1754455 ) ) ( not ( = ?auto_1754445 ?auto_1754456 ) ) ( not ( = ?auto_1754445 ?auto_1754457 ) ) ( not ( = ?auto_1754445 ?auto_1754460 ) ) ( not ( = ?auto_1754446 ?auto_1754447 ) ) ( not ( = ?auto_1754446 ?auto_1754444 ) ) ( not ( = ?auto_1754446 ?auto_1754448 ) ) ( not ( = ?auto_1754446 ?auto_1754450 ) ) ( not ( = ?auto_1754446 ?auto_1754449 ) ) ( not ( = ?auto_1754446 ?auto_1754451 ) ) ( not ( = ?auto_1754446 ?auto_1754452 ) ) ( not ( = ?auto_1754446 ?auto_1754453 ) ) ( not ( = ?auto_1754446 ?auto_1754454 ) ) ( not ( = ?auto_1754446 ?auto_1754455 ) ) ( not ( = ?auto_1754446 ?auto_1754456 ) ) ( not ( = ?auto_1754446 ?auto_1754457 ) ) ( not ( = ?auto_1754446 ?auto_1754460 ) ) ( not ( = ?auto_1754447 ?auto_1754444 ) ) ( not ( = ?auto_1754447 ?auto_1754448 ) ) ( not ( = ?auto_1754447 ?auto_1754450 ) ) ( not ( = ?auto_1754447 ?auto_1754449 ) ) ( not ( = ?auto_1754447 ?auto_1754451 ) ) ( not ( = ?auto_1754447 ?auto_1754452 ) ) ( not ( = ?auto_1754447 ?auto_1754453 ) ) ( not ( = ?auto_1754447 ?auto_1754454 ) ) ( not ( = ?auto_1754447 ?auto_1754455 ) ) ( not ( = ?auto_1754447 ?auto_1754456 ) ) ( not ( = ?auto_1754447 ?auto_1754457 ) ) ( not ( = ?auto_1754447 ?auto_1754460 ) ) ( not ( = ?auto_1754444 ?auto_1754448 ) ) ( not ( = ?auto_1754444 ?auto_1754450 ) ) ( not ( = ?auto_1754444 ?auto_1754449 ) ) ( not ( = ?auto_1754444 ?auto_1754451 ) ) ( not ( = ?auto_1754444 ?auto_1754452 ) ) ( not ( = ?auto_1754444 ?auto_1754453 ) ) ( not ( = ?auto_1754444 ?auto_1754454 ) ) ( not ( = ?auto_1754444 ?auto_1754455 ) ) ( not ( = ?auto_1754444 ?auto_1754456 ) ) ( not ( = ?auto_1754444 ?auto_1754457 ) ) ( not ( = ?auto_1754444 ?auto_1754460 ) ) ( not ( = ?auto_1754448 ?auto_1754450 ) ) ( not ( = ?auto_1754448 ?auto_1754449 ) ) ( not ( = ?auto_1754448 ?auto_1754451 ) ) ( not ( = ?auto_1754448 ?auto_1754452 ) ) ( not ( = ?auto_1754448 ?auto_1754453 ) ) ( not ( = ?auto_1754448 ?auto_1754454 ) ) ( not ( = ?auto_1754448 ?auto_1754455 ) ) ( not ( = ?auto_1754448 ?auto_1754456 ) ) ( not ( = ?auto_1754448 ?auto_1754457 ) ) ( not ( = ?auto_1754448 ?auto_1754460 ) ) ( not ( = ?auto_1754450 ?auto_1754449 ) ) ( not ( = ?auto_1754450 ?auto_1754451 ) ) ( not ( = ?auto_1754450 ?auto_1754452 ) ) ( not ( = ?auto_1754450 ?auto_1754453 ) ) ( not ( = ?auto_1754450 ?auto_1754454 ) ) ( not ( = ?auto_1754450 ?auto_1754455 ) ) ( not ( = ?auto_1754450 ?auto_1754456 ) ) ( not ( = ?auto_1754450 ?auto_1754457 ) ) ( not ( = ?auto_1754450 ?auto_1754460 ) ) ( not ( = ?auto_1754449 ?auto_1754451 ) ) ( not ( = ?auto_1754449 ?auto_1754452 ) ) ( not ( = ?auto_1754449 ?auto_1754453 ) ) ( not ( = ?auto_1754449 ?auto_1754454 ) ) ( not ( = ?auto_1754449 ?auto_1754455 ) ) ( not ( = ?auto_1754449 ?auto_1754456 ) ) ( not ( = ?auto_1754449 ?auto_1754457 ) ) ( not ( = ?auto_1754449 ?auto_1754460 ) ) ( not ( = ?auto_1754451 ?auto_1754452 ) ) ( not ( = ?auto_1754451 ?auto_1754453 ) ) ( not ( = ?auto_1754451 ?auto_1754454 ) ) ( not ( = ?auto_1754451 ?auto_1754455 ) ) ( not ( = ?auto_1754451 ?auto_1754456 ) ) ( not ( = ?auto_1754451 ?auto_1754457 ) ) ( not ( = ?auto_1754451 ?auto_1754460 ) ) ( not ( = ?auto_1754452 ?auto_1754453 ) ) ( not ( = ?auto_1754452 ?auto_1754454 ) ) ( not ( = ?auto_1754452 ?auto_1754455 ) ) ( not ( = ?auto_1754452 ?auto_1754456 ) ) ( not ( = ?auto_1754452 ?auto_1754457 ) ) ( not ( = ?auto_1754452 ?auto_1754460 ) ) ( not ( = ?auto_1754453 ?auto_1754454 ) ) ( not ( = ?auto_1754453 ?auto_1754455 ) ) ( not ( = ?auto_1754453 ?auto_1754456 ) ) ( not ( = ?auto_1754453 ?auto_1754457 ) ) ( not ( = ?auto_1754453 ?auto_1754460 ) ) ( not ( = ?auto_1754454 ?auto_1754455 ) ) ( not ( = ?auto_1754454 ?auto_1754456 ) ) ( not ( = ?auto_1754454 ?auto_1754457 ) ) ( not ( = ?auto_1754454 ?auto_1754460 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1754455 ?auto_1754456 ?auto_1754457 )
      ( MAKE-13CRATE-VERIFY ?auto_1754445 ?auto_1754446 ?auto_1754447 ?auto_1754444 ?auto_1754448 ?auto_1754450 ?auto_1754449 ?auto_1754451 ?auto_1754452 ?auto_1754453 ?auto_1754454 ?auto_1754455 ?auto_1754456 ?auto_1754457 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1754628 - SURFACE
      ?auto_1754629 - SURFACE
      ?auto_1754630 - SURFACE
      ?auto_1754627 - SURFACE
      ?auto_1754631 - SURFACE
      ?auto_1754633 - SURFACE
      ?auto_1754632 - SURFACE
      ?auto_1754634 - SURFACE
      ?auto_1754635 - SURFACE
      ?auto_1754636 - SURFACE
      ?auto_1754637 - SURFACE
      ?auto_1754638 - SURFACE
      ?auto_1754639 - SURFACE
      ?auto_1754640 - SURFACE
    )
    :vars
    (
      ?auto_1754644 - HOIST
      ?auto_1754646 - PLACE
      ?auto_1754642 - PLACE
      ?auto_1754645 - HOIST
      ?auto_1754643 - SURFACE
      ?auto_1754641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1754644 ?auto_1754646 ) ( IS-CRATE ?auto_1754640 ) ( not ( = ?auto_1754639 ?auto_1754640 ) ) ( not ( = ?auto_1754638 ?auto_1754639 ) ) ( not ( = ?auto_1754638 ?auto_1754640 ) ) ( not ( = ?auto_1754642 ?auto_1754646 ) ) ( HOIST-AT ?auto_1754645 ?auto_1754642 ) ( not ( = ?auto_1754644 ?auto_1754645 ) ) ( AVAILABLE ?auto_1754645 ) ( SURFACE-AT ?auto_1754640 ?auto_1754642 ) ( ON ?auto_1754640 ?auto_1754643 ) ( CLEAR ?auto_1754640 ) ( not ( = ?auto_1754639 ?auto_1754643 ) ) ( not ( = ?auto_1754640 ?auto_1754643 ) ) ( not ( = ?auto_1754638 ?auto_1754643 ) ) ( TRUCK-AT ?auto_1754641 ?auto_1754646 ) ( SURFACE-AT ?auto_1754638 ?auto_1754646 ) ( CLEAR ?auto_1754638 ) ( LIFTING ?auto_1754644 ?auto_1754639 ) ( IS-CRATE ?auto_1754639 ) ( ON ?auto_1754629 ?auto_1754628 ) ( ON ?auto_1754630 ?auto_1754629 ) ( ON ?auto_1754627 ?auto_1754630 ) ( ON ?auto_1754631 ?auto_1754627 ) ( ON ?auto_1754633 ?auto_1754631 ) ( ON ?auto_1754632 ?auto_1754633 ) ( ON ?auto_1754634 ?auto_1754632 ) ( ON ?auto_1754635 ?auto_1754634 ) ( ON ?auto_1754636 ?auto_1754635 ) ( ON ?auto_1754637 ?auto_1754636 ) ( ON ?auto_1754638 ?auto_1754637 ) ( not ( = ?auto_1754628 ?auto_1754629 ) ) ( not ( = ?auto_1754628 ?auto_1754630 ) ) ( not ( = ?auto_1754628 ?auto_1754627 ) ) ( not ( = ?auto_1754628 ?auto_1754631 ) ) ( not ( = ?auto_1754628 ?auto_1754633 ) ) ( not ( = ?auto_1754628 ?auto_1754632 ) ) ( not ( = ?auto_1754628 ?auto_1754634 ) ) ( not ( = ?auto_1754628 ?auto_1754635 ) ) ( not ( = ?auto_1754628 ?auto_1754636 ) ) ( not ( = ?auto_1754628 ?auto_1754637 ) ) ( not ( = ?auto_1754628 ?auto_1754638 ) ) ( not ( = ?auto_1754628 ?auto_1754639 ) ) ( not ( = ?auto_1754628 ?auto_1754640 ) ) ( not ( = ?auto_1754628 ?auto_1754643 ) ) ( not ( = ?auto_1754629 ?auto_1754630 ) ) ( not ( = ?auto_1754629 ?auto_1754627 ) ) ( not ( = ?auto_1754629 ?auto_1754631 ) ) ( not ( = ?auto_1754629 ?auto_1754633 ) ) ( not ( = ?auto_1754629 ?auto_1754632 ) ) ( not ( = ?auto_1754629 ?auto_1754634 ) ) ( not ( = ?auto_1754629 ?auto_1754635 ) ) ( not ( = ?auto_1754629 ?auto_1754636 ) ) ( not ( = ?auto_1754629 ?auto_1754637 ) ) ( not ( = ?auto_1754629 ?auto_1754638 ) ) ( not ( = ?auto_1754629 ?auto_1754639 ) ) ( not ( = ?auto_1754629 ?auto_1754640 ) ) ( not ( = ?auto_1754629 ?auto_1754643 ) ) ( not ( = ?auto_1754630 ?auto_1754627 ) ) ( not ( = ?auto_1754630 ?auto_1754631 ) ) ( not ( = ?auto_1754630 ?auto_1754633 ) ) ( not ( = ?auto_1754630 ?auto_1754632 ) ) ( not ( = ?auto_1754630 ?auto_1754634 ) ) ( not ( = ?auto_1754630 ?auto_1754635 ) ) ( not ( = ?auto_1754630 ?auto_1754636 ) ) ( not ( = ?auto_1754630 ?auto_1754637 ) ) ( not ( = ?auto_1754630 ?auto_1754638 ) ) ( not ( = ?auto_1754630 ?auto_1754639 ) ) ( not ( = ?auto_1754630 ?auto_1754640 ) ) ( not ( = ?auto_1754630 ?auto_1754643 ) ) ( not ( = ?auto_1754627 ?auto_1754631 ) ) ( not ( = ?auto_1754627 ?auto_1754633 ) ) ( not ( = ?auto_1754627 ?auto_1754632 ) ) ( not ( = ?auto_1754627 ?auto_1754634 ) ) ( not ( = ?auto_1754627 ?auto_1754635 ) ) ( not ( = ?auto_1754627 ?auto_1754636 ) ) ( not ( = ?auto_1754627 ?auto_1754637 ) ) ( not ( = ?auto_1754627 ?auto_1754638 ) ) ( not ( = ?auto_1754627 ?auto_1754639 ) ) ( not ( = ?auto_1754627 ?auto_1754640 ) ) ( not ( = ?auto_1754627 ?auto_1754643 ) ) ( not ( = ?auto_1754631 ?auto_1754633 ) ) ( not ( = ?auto_1754631 ?auto_1754632 ) ) ( not ( = ?auto_1754631 ?auto_1754634 ) ) ( not ( = ?auto_1754631 ?auto_1754635 ) ) ( not ( = ?auto_1754631 ?auto_1754636 ) ) ( not ( = ?auto_1754631 ?auto_1754637 ) ) ( not ( = ?auto_1754631 ?auto_1754638 ) ) ( not ( = ?auto_1754631 ?auto_1754639 ) ) ( not ( = ?auto_1754631 ?auto_1754640 ) ) ( not ( = ?auto_1754631 ?auto_1754643 ) ) ( not ( = ?auto_1754633 ?auto_1754632 ) ) ( not ( = ?auto_1754633 ?auto_1754634 ) ) ( not ( = ?auto_1754633 ?auto_1754635 ) ) ( not ( = ?auto_1754633 ?auto_1754636 ) ) ( not ( = ?auto_1754633 ?auto_1754637 ) ) ( not ( = ?auto_1754633 ?auto_1754638 ) ) ( not ( = ?auto_1754633 ?auto_1754639 ) ) ( not ( = ?auto_1754633 ?auto_1754640 ) ) ( not ( = ?auto_1754633 ?auto_1754643 ) ) ( not ( = ?auto_1754632 ?auto_1754634 ) ) ( not ( = ?auto_1754632 ?auto_1754635 ) ) ( not ( = ?auto_1754632 ?auto_1754636 ) ) ( not ( = ?auto_1754632 ?auto_1754637 ) ) ( not ( = ?auto_1754632 ?auto_1754638 ) ) ( not ( = ?auto_1754632 ?auto_1754639 ) ) ( not ( = ?auto_1754632 ?auto_1754640 ) ) ( not ( = ?auto_1754632 ?auto_1754643 ) ) ( not ( = ?auto_1754634 ?auto_1754635 ) ) ( not ( = ?auto_1754634 ?auto_1754636 ) ) ( not ( = ?auto_1754634 ?auto_1754637 ) ) ( not ( = ?auto_1754634 ?auto_1754638 ) ) ( not ( = ?auto_1754634 ?auto_1754639 ) ) ( not ( = ?auto_1754634 ?auto_1754640 ) ) ( not ( = ?auto_1754634 ?auto_1754643 ) ) ( not ( = ?auto_1754635 ?auto_1754636 ) ) ( not ( = ?auto_1754635 ?auto_1754637 ) ) ( not ( = ?auto_1754635 ?auto_1754638 ) ) ( not ( = ?auto_1754635 ?auto_1754639 ) ) ( not ( = ?auto_1754635 ?auto_1754640 ) ) ( not ( = ?auto_1754635 ?auto_1754643 ) ) ( not ( = ?auto_1754636 ?auto_1754637 ) ) ( not ( = ?auto_1754636 ?auto_1754638 ) ) ( not ( = ?auto_1754636 ?auto_1754639 ) ) ( not ( = ?auto_1754636 ?auto_1754640 ) ) ( not ( = ?auto_1754636 ?auto_1754643 ) ) ( not ( = ?auto_1754637 ?auto_1754638 ) ) ( not ( = ?auto_1754637 ?auto_1754639 ) ) ( not ( = ?auto_1754637 ?auto_1754640 ) ) ( not ( = ?auto_1754637 ?auto_1754643 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1754638 ?auto_1754639 ?auto_1754640 )
      ( MAKE-13CRATE-VERIFY ?auto_1754628 ?auto_1754629 ?auto_1754630 ?auto_1754627 ?auto_1754631 ?auto_1754633 ?auto_1754632 ?auto_1754634 ?auto_1754635 ?auto_1754636 ?auto_1754637 ?auto_1754638 ?auto_1754639 ?auto_1754640 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1754811 - SURFACE
      ?auto_1754812 - SURFACE
      ?auto_1754813 - SURFACE
      ?auto_1754810 - SURFACE
      ?auto_1754814 - SURFACE
      ?auto_1754816 - SURFACE
      ?auto_1754815 - SURFACE
      ?auto_1754817 - SURFACE
      ?auto_1754818 - SURFACE
      ?auto_1754819 - SURFACE
      ?auto_1754820 - SURFACE
      ?auto_1754821 - SURFACE
      ?auto_1754822 - SURFACE
      ?auto_1754823 - SURFACE
    )
    :vars
    (
      ?auto_1754828 - HOIST
      ?auto_1754827 - PLACE
      ?auto_1754824 - PLACE
      ?auto_1754825 - HOIST
      ?auto_1754829 - SURFACE
      ?auto_1754826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1754828 ?auto_1754827 ) ( IS-CRATE ?auto_1754823 ) ( not ( = ?auto_1754822 ?auto_1754823 ) ) ( not ( = ?auto_1754821 ?auto_1754822 ) ) ( not ( = ?auto_1754821 ?auto_1754823 ) ) ( not ( = ?auto_1754824 ?auto_1754827 ) ) ( HOIST-AT ?auto_1754825 ?auto_1754824 ) ( not ( = ?auto_1754828 ?auto_1754825 ) ) ( AVAILABLE ?auto_1754825 ) ( SURFACE-AT ?auto_1754823 ?auto_1754824 ) ( ON ?auto_1754823 ?auto_1754829 ) ( CLEAR ?auto_1754823 ) ( not ( = ?auto_1754822 ?auto_1754829 ) ) ( not ( = ?auto_1754823 ?auto_1754829 ) ) ( not ( = ?auto_1754821 ?auto_1754829 ) ) ( TRUCK-AT ?auto_1754826 ?auto_1754827 ) ( SURFACE-AT ?auto_1754821 ?auto_1754827 ) ( CLEAR ?auto_1754821 ) ( IS-CRATE ?auto_1754822 ) ( AVAILABLE ?auto_1754828 ) ( IN ?auto_1754822 ?auto_1754826 ) ( ON ?auto_1754812 ?auto_1754811 ) ( ON ?auto_1754813 ?auto_1754812 ) ( ON ?auto_1754810 ?auto_1754813 ) ( ON ?auto_1754814 ?auto_1754810 ) ( ON ?auto_1754816 ?auto_1754814 ) ( ON ?auto_1754815 ?auto_1754816 ) ( ON ?auto_1754817 ?auto_1754815 ) ( ON ?auto_1754818 ?auto_1754817 ) ( ON ?auto_1754819 ?auto_1754818 ) ( ON ?auto_1754820 ?auto_1754819 ) ( ON ?auto_1754821 ?auto_1754820 ) ( not ( = ?auto_1754811 ?auto_1754812 ) ) ( not ( = ?auto_1754811 ?auto_1754813 ) ) ( not ( = ?auto_1754811 ?auto_1754810 ) ) ( not ( = ?auto_1754811 ?auto_1754814 ) ) ( not ( = ?auto_1754811 ?auto_1754816 ) ) ( not ( = ?auto_1754811 ?auto_1754815 ) ) ( not ( = ?auto_1754811 ?auto_1754817 ) ) ( not ( = ?auto_1754811 ?auto_1754818 ) ) ( not ( = ?auto_1754811 ?auto_1754819 ) ) ( not ( = ?auto_1754811 ?auto_1754820 ) ) ( not ( = ?auto_1754811 ?auto_1754821 ) ) ( not ( = ?auto_1754811 ?auto_1754822 ) ) ( not ( = ?auto_1754811 ?auto_1754823 ) ) ( not ( = ?auto_1754811 ?auto_1754829 ) ) ( not ( = ?auto_1754812 ?auto_1754813 ) ) ( not ( = ?auto_1754812 ?auto_1754810 ) ) ( not ( = ?auto_1754812 ?auto_1754814 ) ) ( not ( = ?auto_1754812 ?auto_1754816 ) ) ( not ( = ?auto_1754812 ?auto_1754815 ) ) ( not ( = ?auto_1754812 ?auto_1754817 ) ) ( not ( = ?auto_1754812 ?auto_1754818 ) ) ( not ( = ?auto_1754812 ?auto_1754819 ) ) ( not ( = ?auto_1754812 ?auto_1754820 ) ) ( not ( = ?auto_1754812 ?auto_1754821 ) ) ( not ( = ?auto_1754812 ?auto_1754822 ) ) ( not ( = ?auto_1754812 ?auto_1754823 ) ) ( not ( = ?auto_1754812 ?auto_1754829 ) ) ( not ( = ?auto_1754813 ?auto_1754810 ) ) ( not ( = ?auto_1754813 ?auto_1754814 ) ) ( not ( = ?auto_1754813 ?auto_1754816 ) ) ( not ( = ?auto_1754813 ?auto_1754815 ) ) ( not ( = ?auto_1754813 ?auto_1754817 ) ) ( not ( = ?auto_1754813 ?auto_1754818 ) ) ( not ( = ?auto_1754813 ?auto_1754819 ) ) ( not ( = ?auto_1754813 ?auto_1754820 ) ) ( not ( = ?auto_1754813 ?auto_1754821 ) ) ( not ( = ?auto_1754813 ?auto_1754822 ) ) ( not ( = ?auto_1754813 ?auto_1754823 ) ) ( not ( = ?auto_1754813 ?auto_1754829 ) ) ( not ( = ?auto_1754810 ?auto_1754814 ) ) ( not ( = ?auto_1754810 ?auto_1754816 ) ) ( not ( = ?auto_1754810 ?auto_1754815 ) ) ( not ( = ?auto_1754810 ?auto_1754817 ) ) ( not ( = ?auto_1754810 ?auto_1754818 ) ) ( not ( = ?auto_1754810 ?auto_1754819 ) ) ( not ( = ?auto_1754810 ?auto_1754820 ) ) ( not ( = ?auto_1754810 ?auto_1754821 ) ) ( not ( = ?auto_1754810 ?auto_1754822 ) ) ( not ( = ?auto_1754810 ?auto_1754823 ) ) ( not ( = ?auto_1754810 ?auto_1754829 ) ) ( not ( = ?auto_1754814 ?auto_1754816 ) ) ( not ( = ?auto_1754814 ?auto_1754815 ) ) ( not ( = ?auto_1754814 ?auto_1754817 ) ) ( not ( = ?auto_1754814 ?auto_1754818 ) ) ( not ( = ?auto_1754814 ?auto_1754819 ) ) ( not ( = ?auto_1754814 ?auto_1754820 ) ) ( not ( = ?auto_1754814 ?auto_1754821 ) ) ( not ( = ?auto_1754814 ?auto_1754822 ) ) ( not ( = ?auto_1754814 ?auto_1754823 ) ) ( not ( = ?auto_1754814 ?auto_1754829 ) ) ( not ( = ?auto_1754816 ?auto_1754815 ) ) ( not ( = ?auto_1754816 ?auto_1754817 ) ) ( not ( = ?auto_1754816 ?auto_1754818 ) ) ( not ( = ?auto_1754816 ?auto_1754819 ) ) ( not ( = ?auto_1754816 ?auto_1754820 ) ) ( not ( = ?auto_1754816 ?auto_1754821 ) ) ( not ( = ?auto_1754816 ?auto_1754822 ) ) ( not ( = ?auto_1754816 ?auto_1754823 ) ) ( not ( = ?auto_1754816 ?auto_1754829 ) ) ( not ( = ?auto_1754815 ?auto_1754817 ) ) ( not ( = ?auto_1754815 ?auto_1754818 ) ) ( not ( = ?auto_1754815 ?auto_1754819 ) ) ( not ( = ?auto_1754815 ?auto_1754820 ) ) ( not ( = ?auto_1754815 ?auto_1754821 ) ) ( not ( = ?auto_1754815 ?auto_1754822 ) ) ( not ( = ?auto_1754815 ?auto_1754823 ) ) ( not ( = ?auto_1754815 ?auto_1754829 ) ) ( not ( = ?auto_1754817 ?auto_1754818 ) ) ( not ( = ?auto_1754817 ?auto_1754819 ) ) ( not ( = ?auto_1754817 ?auto_1754820 ) ) ( not ( = ?auto_1754817 ?auto_1754821 ) ) ( not ( = ?auto_1754817 ?auto_1754822 ) ) ( not ( = ?auto_1754817 ?auto_1754823 ) ) ( not ( = ?auto_1754817 ?auto_1754829 ) ) ( not ( = ?auto_1754818 ?auto_1754819 ) ) ( not ( = ?auto_1754818 ?auto_1754820 ) ) ( not ( = ?auto_1754818 ?auto_1754821 ) ) ( not ( = ?auto_1754818 ?auto_1754822 ) ) ( not ( = ?auto_1754818 ?auto_1754823 ) ) ( not ( = ?auto_1754818 ?auto_1754829 ) ) ( not ( = ?auto_1754819 ?auto_1754820 ) ) ( not ( = ?auto_1754819 ?auto_1754821 ) ) ( not ( = ?auto_1754819 ?auto_1754822 ) ) ( not ( = ?auto_1754819 ?auto_1754823 ) ) ( not ( = ?auto_1754819 ?auto_1754829 ) ) ( not ( = ?auto_1754820 ?auto_1754821 ) ) ( not ( = ?auto_1754820 ?auto_1754822 ) ) ( not ( = ?auto_1754820 ?auto_1754823 ) ) ( not ( = ?auto_1754820 ?auto_1754829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1754821 ?auto_1754822 ?auto_1754823 )
      ( MAKE-13CRATE-VERIFY ?auto_1754811 ?auto_1754812 ?auto_1754813 ?auto_1754810 ?auto_1754814 ?auto_1754816 ?auto_1754815 ?auto_1754817 ?auto_1754818 ?auto_1754819 ?auto_1754820 ?auto_1754821 ?auto_1754822 ?auto_1754823 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1769025 - SURFACE
      ?auto_1769026 - SURFACE
      ?auto_1769027 - SURFACE
      ?auto_1769024 - SURFACE
      ?auto_1769028 - SURFACE
      ?auto_1769030 - SURFACE
      ?auto_1769029 - SURFACE
      ?auto_1769031 - SURFACE
      ?auto_1769032 - SURFACE
      ?auto_1769033 - SURFACE
      ?auto_1769034 - SURFACE
      ?auto_1769035 - SURFACE
      ?auto_1769036 - SURFACE
      ?auto_1769037 - SURFACE
      ?auto_1769038 - SURFACE
    )
    :vars
    (
      ?auto_1769040 - HOIST
      ?auto_1769039 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1769040 ?auto_1769039 ) ( SURFACE-AT ?auto_1769037 ?auto_1769039 ) ( CLEAR ?auto_1769037 ) ( LIFTING ?auto_1769040 ?auto_1769038 ) ( IS-CRATE ?auto_1769038 ) ( not ( = ?auto_1769037 ?auto_1769038 ) ) ( ON ?auto_1769026 ?auto_1769025 ) ( ON ?auto_1769027 ?auto_1769026 ) ( ON ?auto_1769024 ?auto_1769027 ) ( ON ?auto_1769028 ?auto_1769024 ) ( ON ?auto_1769030 ?auto_1769028 ) ( ON ?auto_1769029 ?auto_1769030 ) ( ON ?auto_1769031 ?auto_1769029 ) ( ON ?auto_1769032 ?auto_1769031 ) ( ON ?auto_1769033 ?auto_1769032 ) ( ON ?auto_1769034 ?auto_1769033 ) ( ON ?auto_1769035 ?auto_1769034 ) ( ON ?auto_1769036 ?auto_1769035 ) ( ON ?auto_1769037 ?auto_1769036 ) ( not ( = ?auto_1769025 ?auto_1769026 ) ) ( not ( = ?auto_1769025 ?auto_1769027 ) ) ( not ( = ?auto_1769025 ?auto_1769024 ) ) ( not ( = ?auto_1769025 ?auto_1769028 ) ) ( not ( = ?auto_1769025 ?auto_1769030 ) ) ( not ( = ?auto_1769025 ?auto_1769029 ) ) ( not ( = ?auto_1769025 ?auto_1769031 ) ) ( not ( = ?auto_1769025 ?auto_1769032 ) ) ( not ( = ?auto_1769025 ?auto_1769033 ) ) ( not ( = ?auto_1769025 ?auto_1769034 ) ) ( not ( = ?auto_1769025 ?auto_1769035 ) ) ( not ( = ?auto_1769025 ?auto_1769036 ) ) ( not ( = ?auto_1769025 ?auto_1769037 ) ) ( not ( = ?auto_1769025 ?auto_1769038 ) ) ( not ( = ?auto_1769026 ?auto_1769027 ) ) ( not ( = ?auto_1769026 ?auto_1769024 ) ) ( not ( = ?auto_1769026 ?auto_1769028 ) ) ( not ( = ?auto_1769026 ?auto_1769030 ) ) ( not ( = ?auto_1769026 ?auto_1769029 ) ) ( not ( = ?auto_1769026 ?auto_1769031 ) ) ( not ( = ?auto_1769026 ?auto_1769032 ) ) ( not ( = ?auto_1769026 ?auto_1769033 ) ) ( not ( = ?auto_1769026 ?auto_1769034 ) ) ( not ( = ?auto_1769026 ?auto_1769035 ) ) ( not ( = ?auto_1769026 ?auto_1769036 ) ) ( not ( = ?auto_1769026 ?auto_1769037 ) ) ( not ( = ?auto_1769026 ?auto_1769038 ) ) ( not ( = ?auto_1769027 ?auto_1769024 ) ) ( not ( = ?auto_1769027 ?auto_1769028 ) ) ( not ( = ?auto_1769027 ?auto_1769030 ) ) ( not ( = ?auto_1769027 ?auto_1769029 ) ) ( not ( = ?auto_1769027 ?auto_1769031 ) ) ( not ( = ?auto_1769027 ?auto_1769032 ) ) ( not ( = ?auto_1769027 ?auto_1769033 ) ) ( not ( = ?auto_1769027 ?auto_1769034 ) ) ( not ( = ?auto_1769027 ?auto_1769035 ) ) ( not ( = ?auto_1769027 ?auto_1769036 ) ) ( not ( = ?auto_1769027 ?auto_1769037 ) ) ( not ( = ?auto_1769027 ?auto_1769038 ) ) ( not ( = ?auto_1769024 ?auto_1769028 ) ) ( not ( = ?auto_1769024 ?auto_1769030 ) ) ( not ( = ?auto_1769024 ?auto_1769029 ) ) ( not ( = ?auto_1769024 ?auto_1769031 ) ) ( not ( = ?auto_1769024 ?auto_1769032 ) ) ( not ( = ?auto_1769024 ?auto_1769033 ) ) ( not ( = ?auto_1769024 ?auto_1769034 ) ) ( not ( = ?auto_1769024 ?auto_1769035 ) ) ( not ( = ?auto_1769024 ?auto_1769036 ) ) ( not ( = ?auto_1769024 ?auto_1769037 ) ) ( not ( = ?auto_1769024 ?auto_1769038 ) ) ( not ( = ?auto_1769028 ?auto_1769030 ) ) ( not ( = ?auto_1769028 ?auto_1769029 ) ) ( not ( = ?auto_1769028 ?auto_1769031 ) ) ( not ( = ?auto_1769028 ?auto_1769032 ) ) ( not ( = ?auto_1769028 ?auto_1769033 ) ) ( not ( = ?auto_1769028 ?auto_1769034 ) ) ( not ( = ?auto_1769028 ?auto_1769035 ) ) ( not ( = ?auto_1769028 ?auto_1769036 ) ) ( not ( = ?auto_1769028 ?auto_1769037 ) ) ( not ( = ?auto_1769028 ?auto_1769038 ) ) ( not ( = ?auto_1769030 ?auto_1769029 ) ) ( not ( = ?auto_1769030 ?auto_1769031 ) ) ( not ( = ?auto_1769030 ?auto_1769032 ) ) ( not ( = ?auto_1769030 ?auto_1769033 ) ) ( not ( = ?auto_1769030 ?auto_1769034 ) ) ( not ( = ?auto_1769030 ?auto_1769035 ) ) ( not ( = ?auto_1769030 ?auto_1769036 ) ) ( not ( = ?auto_1769030 ?auto_1769037 ) ) ( not ( = ?auto_1769030 ?auto_1769038 ) ) ( not ( = ?auto_1769029 ?auto_1769031 ) ) ( not ( = ?auto_1769029 ?auto_1769032 ) ) ( not ( = ?auto_1769029 ?auto_1769033 ) ) ( not ( = ?auto_1769029 ?auto_1769034 ) ) ( not ( = ?auto_1769029 ?auto_1769035 ) ) ( not ( = ?auto_1769029 ?auto_1769036 ) ) ( not ( = ?auto_1769029 ?auto_1769037 ) ) ( not ( = ?auto_1769029 ?auto_1769038 ) ) ( not ( = ?auto_1769031 ?auto_1769032 ) ) ( not ( = ?auto_1769031 ?auto_1769033 ) ) ( not ( = ?auto_1769031 ?auto_1769034 ) ) ( not ( = ?auto_1769031 ?auto_1769035 ) ) ( not ( = ?auto_1769031 ?auto_1769036 ) ) ( not ( = ?auto_1769031 ?auto_1769037 ) ) ( not ( = ?auto_1769031 ?auto_1769038 ) ) ( not ( = ?auto_1769032 ?auto_1769033 ) ) ( not ( = ?auto_1769032 ?auto_1769034 ) ) ( not ( = ?auto_1769032 ?auto_1769035 ) ) ( not ( = ?auto_1769032 ?auto_1769036 ) ) ( not ( = ?auto_1769032 ?auto_1769037 ) ) ( not ( = ?auto_1769032 ?auto_1769038 ) ) ( not ( = ?auto_1769033 ?auto_1769034 ) ) ( not ( = ?auto_1769033 ?auto_1769035 ) ) ( not ( = ?auto_1769033 ?auto_1769036 ) ) ( not ( = ?auto_1769033 ?auto_1769037 ) ) ( not ( = ?auto_1769033 ?auto_1769038 ) ) ( not ( = ?auto_1769034 ?auto_1769035 ) ) ( not ( = ?auto_1769034 ?auto_1769036 ) ) ( not ( = ?auto_1769034 ?auto_1769037 ) ) ( not ( = ?auto_1769034 ?auto_1769038 ) ) ( not ( = ?auto_1769035 ?auto_1769036 ) ) ( not ( = ?auto_1769035 ?auto_1769037 ) ) ( not ( = ?auto_1769035 ?auto_1769038 ) ) ( not ( = ?auto_1769036 ?auto_1769037 ) ) ( not ( = ?auto_1769036 ?auto_1769038 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1769037 ?auto_1769038 )
      ( MAKE-14CRATE-VERIFY ?auto_1769025 ?auto_1769026 ?auto_1769027 ?auto_1769024 ?auto_1769028 ?auto_1769030 ?auto_1769029 ?auto_1769031 ?auto_1769032 ?auto_1769033 ?auto_1769034 ?auto_1769035 ?auto_1769036 ?auto_1769037 ?auto_1769038 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1769185 - SURFACE
      ?auto_1769186 - SURFACE
      ?auto_1769187 - SURFACE
      ?auto_1769184 - SURFACE
      ?auto_1769188 - SURFACE
      ?auto_1769190 - SURFACE
      ?auto_1769189 - SURFACE
      ?auto_1769191 - SURFACE
      ?auto_1769192 - SURFACE
      ?auto_1769193 - SURFACE
      ?auto_1769194 - SURFACE
      ?auto_1769195 - SURFACE
      ?auto_1769196 - SURFACE
      ?auto_1769197 - SURFACE
      ?auto_1769198 - SURFACE
    )
    :vars
    (
      ?auto_1769200 - HOIST
      ?auto_1769201 - PLACE
      ?auto_1769199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1769200 ?auto_1769201 ) ( SURFACE-AT ?auto_1769197 ?auto_1769201 ) ( CLEAR ?auto_1769197 ) ( IS-CRATE ?auto_1769198 ) ( not ( = ?auto_1769197 ?auto_1769198 ) ) ( TRUCK-AT ?auto_1769199 ?auto_1769201 ) ( AVAILABLE ?auto_1769200 ) ( IN ?auto_1769198 ?auto_1769199 ) ( ON ?auto_1769197 ?auto_1769196 ) ( not ( = ?auto_1769196 ?auto_1769197 ) ) ( not ( = ?auto_1769196 ?auto_1769198 ) ) ( ON ?auto_1769186 ?auto_1769185 ) ( ON ?auto_1769187 ?auto_1769186 ) ( ON ?auto_1769184 ?auto_1769187 ) ( ON ?auto_1769188 ?auto_1769184 ) ( ON ?auto_1769190 ?auto_1769188 ) ( ON ?auto_1769189 ?auto_1769190 ) ( ON ?auto_1769191 ?auto_1769189 ) ( ON ?auto_1769192 ?auto_1769191 ) ( ON ?auto_1769193 ?auto_1769192 ) ( ON ?auto_1769194 ?auto_1769193 ) ( ON ?auto_1769195 ?auto_1769194 ) ( ON ?auto_1769196 ?auto_1769195 ) ( not ( = ?auto_1769185 ?auto_1769186 ) ) ( not ( = ?auto_1769185 ?auto_1769187 ) ) ( not ( = ?auto_1769185 ?auto_1769184 ) ) ( not ( = ?auto_1769185 ?auto_1769188 ) ) ( not ( = ?auto_1769185 ?auto_1769190 ) ) ( not ( = ?auto_1769185 ?auto_1769189 ) ) ( not ( = ?auto_1769185 ?auto_1769191 ) ) ( not ( = ?auto_1769185 ?auto_1769192 ) ) ( not ( = ?auto_1769185 ?auto_1769193 ) ) ( not ( = ?auto_1769185 ?auto_1769194 ) ) ( not ( = ?auto_1769185 ?auto_1769195 ) ) ( not ( = ?auto_1769185 ?auto_1769196 ) ) ( not ( = ?auto_1769185 ?auto_1769197 ) ) ( not ( = ?auto_1769185 ?auto_1769198 ) ) ( not ( = ?auto_1769186 ?auto_1769187 ) ) ( not ( = ?auto_1769186 ?auto_1769184 ) ) ( not ( = ?auto_1769186 ?auto_1769188 ) ) ( not ( = ?auto_1769186 ?auto_1769190 ) ) ( not ( = ?auto_1769186 ?auto_1769189 ) ) ( not ( = ?auto_1769186 ?auto_1769191 ) ) ( not ( = ?auto_1769186 ?auto_1769192 ) ) ( not ( = ?auto_1769186 ?auto_1769193 ) ) ( not ( = ?auto_1769186 ?auto_1769194 ) ) ( not ( = ?auto_1769186 ?auto_1769195 ) ) ( not ( = ?auto_1769186 ?auto_1769196 ) ) ( not ( = ?auto_1769186 ?auto_1769197 ) ) ( not ( = ?auto_1769186 ?auto_1769198 ) ) ( not ( = ?auto_1769187 ?auto_1769184 ) ) ( not ( = ?auto_1769187 ?auto_1769188 ) ) ( not ( = ?auto_1769187 ?auto_1769190 ) ) ( not ( = ?auto_1769187 ?auto_1769189 ) ) ( not ( = ?auto_1769187 ?auto_1769191 ) ) ( not ( = ?auto_1769187 ?auto_1769192 ) ) ( not ( = ?auto_1769187 ?auto_1769193 ) ) ( not ( = ?auto_1769187 ?auto_1769194 ) ) ( not ( = ?auto_1769187 ?auto_1769195 ) ) ( not ( = ?auto_1769187 ?auto_1769196 ) ) ( not ( = ?auto_1769187 ?auto_1769197 ) ) ( not ( = ?auto_1769187 ?auto_1769198 ) ) ( not ( = ?auto_1769184 ?auto_1769188 ) ) ( not ( = ?auto_1769184 ?auto_1769190 ) ) ( not ( = ?auto_1769184 ?auto_1769189 ) ) ( not ( = ?auto_1769184 ?auto_1769191 ) ) ( not ( = ?auto_1769184 ?auto_1769192 ) ) ( not ( = ?auto_1769184 ?auto_1769193 ) ) ( not ( = ?auto_1769184 ?auto_1769194 ) ) ( not ( = ?auto_1769184 ?auto_1769195 ) ) ( not ( = ?auto_1769184 ?auto_1769196 ) ) ( not ( = ?auto_1769184 ?auto_1769197 ) ) ( not ( = ?auto_1769184 ?auto_1769198 ) ) ( not ( = ?auto_1769188 ?auto_1769190 ) ) ( not ( = ?auto_1769188 ?auto_1769189 ) ) ( not ( = ?auto_1769188 ?auto_1769191 ) ) ( not ( = ?auto_1769188 ?auto_1769192 ) ) ( not ( = ?auto_1769188 ?auto_1769193 ) ) ( not ( = ?auto_1769188 ?auto_1769194 ) ) ( not ( = ?auto_1769188 ?auto_1769195 ) ) ( not ( = ?auto_1769188 ?auto_1769196 ) ) ( not ( = ?auto_1769188 ?auto_1769197 ) ) ( not ( = ?auto_1769188 ?auto_1769198 ) ) ( not ( = ?auto_1769190 ?auto_1769189 ) ) ( not ( = ?auto_1769190 ?auto_1769191 ) ) ( not ( = ?auto_1769190 ?auto_1769192 ) ) ( not ( = ?auto_1769190 ?auto_1769193 ) ) ( not ( = ?auto_1769190 ?auto_1769194 ) ) ( not ( = ?auto_1769190 ?auto_1769195 ) ) ( not ( = ?auto_1769190 ?auto_1769196 ) ) ( not ( = ?auto_1769190 ?auto_1769197 ) ) ( not ( = ?auto_1769190 ?auto_1769198 ) ) ( not ( = ?auto_1769189 ?auto_1769191 ) ) ( not ( = ?auto_1769189 ?auto_1769192 ) ) ( not ( = ?auto_1769189 ?auto_1769193 ) ) ( not ( = ?auto_1769189 ?auto_1769194 ) ) ( not ( = ?auto_1769189 ?auto_1769195 ) ) ( not ( = ?auto_1769189 ?auto_1769196 ) ) ( not ( = ?auto_1769189 ?auto_1769197 ) ) ( not ( = ?auto_1769189 ?auto_1769198 ) ) ( not ( = ?auto_1769191 ?auto_1769192 ) ) ( not ( = ?auto_1769191 ?auto_1769193 ) ) ( not ( = ?auto_1769191 ?auto_1769194 ) ) ( not ( = ?auto_1769191 ?auto_1769195 ) ) ( not ( = ?auto_1769191 ?auto_1769196 ) ) ( not ( = ?auto_1769191 ?auto_1769197 ) ) ( not ( = ?auto_1769191 ?auto_1769198 ) ) ( not ( = ?auto_1769192 ?auto_1769193 ) ) ( not ( = ?auto_1769192 ?auto_1769194 ) ) ( not ( = ?auto_1769192 ?auto_1769195 ) ) ( not ( = ?auto_1769192 ?auto_1769196 ) ) ( not ( = ?auto_1769192 ?auto_1769197 ) ) ( not ( = ?auto_1769192 ?auto_1769198 ) ) ( not ( = ?auto_1769193 ?auto_1769194 ) ) ( not ( = ?auto_1769193 ?auto_1769195 ) ) ( not ( = ?auto_1769193 ?auto_1769196 ) ) ( not ( = ?auto_1769193 ?auto_1769197 ) ) ( not ( = ?auto_1769193 ?auto_1769198 ) ) ( not ( = ?auto_1769194 ?auto_1769195 ) ) ( not ( = ?auto_1769194 ?auto_1769196 ) ) ( not ( = ?auto_1769194 ?auto_1769197 ) ) ( not ( = ?auto_1769194 ?auto_1769198 ) ) ( not ( = ?auto_1769195 ?auto_1769196 ) ) ( not ( = ?auto_1769195 ?auto_1769197 ) ) ( not ( = ?auto_1769195 ?auto_1769198 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1769196 ?auto_1769197 ?auto_1769198 )
      ( MAKE-14CRATE-VERIFY ?auto_1769185 ?auto_1769186 ?auto_1769187 ?auto_1769184 ?auto_1769188 ?auto_1769190 ?auto_1769189 ?auto_1769191 ?auto_1769192 ?auto_1769193 ?auto_1769194 ?auto_1769195 ?auto_1769196 ?auto_1769197 ?auto_1769198 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1769360 - SURFACE
      ?auto_1769361 - SURFACE
      ?auto_1769362 - SURFACE
      ?auto_1769359 - SURFACE
      ?auto_1769363 - SURFACE
      ?auto_1769365 - SURFACE
      ?auto_1769364 - SURFACE
      ?auto_1769366 - SURFACE
      ?auto_1769367 - SURFACE
      ?auto_1769368 - SURFACE
      ?auto_1769369 - SURFACE
      ?auto_1769370 - SURFACE
      ?auto_1769371 - SURFACE
      ?auto_1769372 - SURFACE
      ?auto_1769373 - SURFACE
    )
    :vars
    (
      ?auto_1769374 - HOIST
      ?auto_1769376 - PLACE
      ?auto_1769375 - TRUCK
      ?auto_1769377 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1769374 ?auto_1769376 ) ( SURFACE-AT ?auto_1769372 ?auto_1769376 ) ( CLEAR ?auto_1769372 ) ( IS-CRATE ?auto_1769373 ) ( not ( = ?auto_1769372 ?auto_1769373 ) ) ( AVAILABLE ?auto_1769374 ) ( IN ?auto_1769373 ?auto_1769375 ) ( ON ?auto_1769372 ?auto_1769371 ) ( not ( = ?auto_1769371 ?auto_1769372 ) ) ( not ( = ?auto_1769371 ?auto_1769373 ) ) ( TRUCK-AT ?auto_1769375 ?auto_1769377 ) ( not ( = ?auto_1769377 ?auto_1769376 ) ) ( ON ?auto_1769361 ?auto_1769360 ) ( ON ?auto_1769362 ?auto_1769361 ) ( ON ?auto_1769359 ?auto_1769362 ) ( ON ?auto_1769363 ?auto_1769359 ) ( ON ?auto_1769365 ?auto_1769363 ) ( ON ?auto_1769364 ?auto_1769365 ) ( ON ?auto_1769366 ?auto_1769364 ) ( ON ?auto_1769367 ?auto_1769366 ) ( ON ?auto_1769368 ?auto_1769367 ) ( ON ?auto_1769369 ?auto_1769368 ) ( ON ?auto_1769370 ?auto_1769369 ) ( ON ?auto_1769371 ?auto_1769370 ) ( not ( = ?auto_1769360 ?auto_1769361 ) ) ( not ( = ?auto_1769360 ?auto_1769362 ) ) ( not ( = ?auto_1769360 ?auto_1769359 ) ) ( not ( = ?auto_1769360 ?auto_1769363 ) ) ( not ( = ?auto_1769360 ?auto_1769365 ) ) ( not ( = ?auto_1769360 ?auto_1769364 ) ) ( not ( = ?auto_1769360 ?auto_1769366 ) ) ( not ( = ?auto_1769360 ?auto_1769367 ) ) ( not ( = ?auto_1769360 ?auto_1769368 ) ) ( not ( = ?auto_1769360 ?auto_1769369 ) ) ( not ( = ?auto_1769360 ?auto_1769370 ) ) ( not ( = ?auto_1769360 ?auto_1769371 ) ) ( not ( = ?auto_1769360 ?auto_1769372 ) ) ( not ( = ?auto_1769360 ?auto_1769373 ) ) ( not ( = ?auto_1769361 ?auto_1769362 ) ) ( not ( = ?auto_1769361 ?auto_1769359 ) ) ( not ( = ?auto_1769361 ?auto_1769363 ) ) ( not ( = ?auto_1769361 ?auto_1769365 ) ) ( not ( = ?auto_1769361 ?auto_1769364 ) ) ( not ( = ?auto_1769361 ?auto_1769366 ) ) ( not ( = ?auto_1769361 ?auto_1769367 ) ) ( not ( = ?auto_1769361 ?auto_1769368 ) ) ( not ( = ?auto_1769361 ?auto_1769369 ) ) ( not ( = ?auto_1769361 ?auto_1769370 ) ) ( not ( = ?auto_1769361 ?auto_1769371 ) ) ( not ( = ?auto_1769361 ?auto_1769372 ) ) ( not ( = ?auto_1769361 ?auto_1769373 ) ) ( not ( = ?auto_1769362 ?auto_1769359 ) ) ( not ( = ?auto_1769362 ?auto_1769363 ) ) ( not ( = ?auto_1769362 ?auto_1769365 ) ) ( not ( = ?auto_1769362 ?auto_1769364 ) ) ( not ( = ?auto_1769362 ?auto_1769366 ) ) ( not ( = ?auto_1769362 ?auto_1769367 ) ) ( not ( = ?auto_1769362 ?auto_1769368 ) ) ( not ( = ?auto_1769362 ?auto_1769369 ) ) ( not ( = ?auto_1769362 ?auto_1769370 ) ) ( not ( = ?auto_1769362 ?auto_1769371 ) ) ( not ( = ?auto_1769362 ?auto_1769372 ) ) ( not ( = ?auto_1769362 ?auto_1769373 ) ) ( not ( = ?auto_1769359 ?auto_1769363 ) ) ( not ( = ?auto_1769359 ?auto_1769365 ) ) ( not ( = ?auto_1769359 ?auto_1769364 ) ) ( not ( = ?auto_1769359 ?auto_1769366 ) ) ( not ( = ?auto_1769359 ?auto_1769367 ) ) ( not ( = ?auto_1769359 ?auto_1769368 ) ) ( not ( = ?auto_1769359 ?auto_1769369 ) ) ( not ( = ?auto_1769359 ?auto_1769370 ) ) ( not ( = ?auto_1769359 ?auto_1769371 ) ) ( not ( = ?auto_1769359 ?auto_1769372 ) ) ( not ( = ?auto_1769359 ?auto_1769373 ) ) ( not ( = ?auto_1769363 ?auto_1769365 ) ) ( not ( = ?auto_1769363 ?auto_1769364 ) ) ( not ( = ?auto_1769363 ?auto_1769366 ) ) ( not ( = ?auto_1769363 ?auto_1769367 ) ) ( not ( = ?auto_1769363 ?auto_1769368 ) ) ( not ( = ?auto_1769363 ?auto_1769369 ) ) ( not ( = ?auto_1769363 ?auto_1769370 ) ) ( not ( = ?auto_1769363 ?auto_1769371 ) ) ( not ( = ?auto_1769363 ?auto_1769372 ) ) ( not ( = ?auto_1769363 ?auto_1769373 ) ) ( not ( = ?auto_1769365 ?auto_1769364 ) ) ( not ( = ?auto_1769365 ?auto_1769366 ) ) ( not ( = ?auto_1769365 ?auto_1769367 ) ) ( not ( = ?auto_1769365 ?auto_1769368 ) ) ( not ( = ?auto_1769365 ?auto_1769369 ) ) ( not ( = ?auto_1769365 ?auto_1769370 ) ) ( not ( = ?auto_1769365 ?auto_1769371 ) ) ( not ( = ?auto_1769365 ?auto_1769372 ) ) ( not ( = ?auto_1769365 ?auto_1769373 ) ) ( not ( = ?auto_1769364 ?auto_1769366 ) ) ( not ( = ?auto_1769364 ?auto_1769367 ) ) ( not ( = ?auto_1769364 ?auto_1769368 ) ) ( not ( = ?auto_1769364 ?auto_1769369 ) ) ( not ( = ?auto_1769364 ?auto_1769370 ) ) ( not ( = ?auto_1769364 ?auto_1769371 ) ) ( not ( = ?auto_1769364 ?auto_1769372 ) ) ( not ( = ?auto_1769364 ?auto_1769373 ) ) ( not ( = ?auto_1769366 ?auto_1769367 ) ) ( not ( = ?auto_1769366 ?auto_1769368 ) ) ( not ( = ?auto_1769366 ?auto_1769369 ) ) ( not ( = ?auto_1769366 ?auto_1769370 ) ) ( not ( = ?auto_1769366 ?auto_1769371 ) ) ( not ( = ?auto_1769366 ?auto_1769372 ) ) ( not ( = ?auto_1769366 ?auto_1769373 ) ) ( not ( = ?auto_1769367 ?auto_1769368 ) ) ( not ( = ?auto_1769367 ?auto_1769369 ) ) ( not ( = ?auto_1769367 ?auto_1769370 ) ) ( not ( = ?auto_1769367 ?auto_1769371 ) ) ( not ( = ?auto_1769367 ?auto_1769372 ) ) ( not ( = ?auto_1769367 ?auto_1769373 ) ) ( not ( = ?auto_1769368 ?auto_1769369 ) ) ( not ( = ?auto_1769368 ?auto_1769370 ) ) ( not ( = ?auto_1769368 ?auto_1769371 ) ) ( not ( = ?auto_1769368 ?auto_1769372 ) ) ( not ( = ?auto_1769368 ?auto_1769373 ) ) ( not ( = ?auto_1769369 ?auto_1769370 ) ) ( not ( = ?auto_1769369 ?auto_1769371 ) ) ( not ( = ?auto_1769369 ?auto_1769372 ) ) ( not ( = ?auto_1769369 ?auto_1769373 ) ) ( not ( = ?auto_1769370 ?auto_1769371 ) ) ( not ( = ?auto_1769370 ?auto_1769372 ) ) ( not ( = ?auto_1769370 ?auto_1769373 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1769371 ?auto_1769372 ?auto_1769373 )
      ( MAKE-14CRATE-VERIFY ?auto_1769360 ?auto_1769361 ?auto_1769362 ?auto_1769359 ?auto_1769363 ?auto_1769365 ?auto_1769364 ?auto_1769366 ?auto_1769367 ?auto_1769368 ?auto_1769369 ?auto_1769370 ?auto_1769371 ?auto_1769372 ?auto_1769373 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1769549 - SURFACE
      ?auto_1769550 - SURFACE
      ?auto_1769551 - SURFACE
      ?auto_1769548 - SURFACE
      ?auto_1769552 - SURFACE
      ?auto_1769554 - SURFACE
      ?auto_1769553 - SURFACE
      ?auto_1769555 - SURFACE
      ?auto_1769556 - SURFACE
      ?auto_1769557 - SURFACE
      ?auto_1769558 - SURFACE
      ?auto_1769559 - SURFACE
      ?auto_1769560 - SURFACE
      ?auto_1769561 - SURFACE
      ?auto_1769562 - SURFACE
    )
    :vars
    (
      ?auto_1769563 - HOIST
      ?auto_1769565 - PLACE
      ?auto_1769564 - TRUCK
      ?auto_1769566 - PLACE
      ?auto_1769567 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1769563 ?auto_1769565 ) ( SURFACE-AT ?auto_1769561 ?auto_1769565 ) ( CLEAR ?auto_1769561 ) ( IS-CRATE ?auto_1769562 ) ( not ( = ?auto_1769561 ?auto_1769562 ) ) ( AVAILABLE ?auto_1769563 ) ( ON ?auto_1769561 ?auto_1769560 ) ( not ( = ?auto_1769560 ?auto_1769561 ) ) ( not ( = ?auto_1769560 ?auto_1769562 ) ) ( TRUCK-AT ?auto_1769564 ?auto_1769566 ) ( not ( = ?auto_1769566 ?auto_1769565 ) ) ( HOIST-AT ?auto_1769567 ?auto_1769566 ) ( LIFTING ?auto_1769567 ?auto_1769562 ) ( not ( = ?auto_1769563 ?auto_1769567 ) ) ( ON ?auto_1769550 ?auto_1769549 ) ( ON ?auto_1769551 ?auto_1769550 ) ( ON ?auto_1769548 ?auto_1769551 ) ( ON ?auto_1769552 ?auto_1769548 ) ( ON ?auto_1769554 ?auto_1769552 ) ( ON ?auto_1769553 ?auto_1769554 ) ( ON ?auto_1769555 ?auto_1769553 ) ( ON ?auto_1769556 ?auto_1769555 ) ( ON ?auto_1769557 ?auto_1769556 ) ( ON ?auto_1769558 ?auto_1769557 ) ( ON ?auto_1769559 ?auto_1769558 ) ( ON ?auto_1769560 ?auto_1769559 ) ( not ( = ?auto_1769549 ?auto_1769550 ) ) ( not ( = ?auto_1769549 ?auto_1769551 ) ) ( not ( = ?auto_1769549 ?auto_1769548 ) ) ( not ( = ?auto_1769549 ?auto_1769552 ) ) ( not ( = ?auto_1769549 ?auto_1769554 ) ) ( not ( = ?auto_1769549 ?auto_1769553 ) ) ( not ( = ?auto_1769549 ?auto_1769555 ) ) ( not ( = ?auto_1769549 ?auto_1769556 ) ) ( not ( = ?auto_1769549 ?auto_1769557 ) ) ( not ( = ?auto_1769549 ?auto_1769558 ) ) ( not ( = ?auto_1769549 ?auto_1769559 ) ) ( not ( = ?auto_1769549 ?auto_1769560 ) ) ( not ( = ?auto_1769549 ?auto_1769561 ) ) ( not ( = ?auto_1769549 ?auto_1769562 ) ) ( not ( = ?auto_1769550 ?auto_1769551 ) ) ( not ( = ?auto_1769550 ?auto_1769548 ) ) ( not ( = ?auto_1769550 ?auto_1769552 ) ) ( not ( = ?auto_1769550 ?auto_1769554 ) ) ( not ( = ?auto_1769550 ?auto_1769553 ) ) ( not ( = ?auto_1769550 ?auto_1769555 ) ) ( not ( = ?auto_1769550 ?auto_1769556 ) ) ( not ( = ?auto_1769550 ?auto_1769557 ) ) ( not ( = ?auto_1769550 ?auto_1769558 ) ) ( not ( = ?auto_1769550 ?auto_1769559 ) ) ( not ( = ?auto_1769550 ?auto_1769560 ) ) ( not ( = ?auto_1769550 ?auto_1769561 ) ) ( not ( = ?auto_1769550 ?auto_1769562 ) ) ( not ( = ?auto_1769551 ?auto_1769548 ) ) ( not ( = ?auto_1769551 ?auto_1769552 ) ) ( not ( = ?auto_1769551 ?auto_1769554 ) ) ( not ( = ?auto_1769551 ?auto_1769553 ) ) ( not ( = ?auto_1769551 ?auto_1769555 ) ) ( not ( = ?auto_1769551 ?auto_1769556 ) ) ( not ( = ?auto_1769551 ?auto_1769557 ) ) ( not ( = ?auto_1769551 ?auto_1769558 ) ) ( not ( = ?auto_1769551 ?auto_1769559 ) ) ( not ( = ?auto_1769551 ?auto_1769560 ) ) ( not ( = ?auto_1769551 ?auto_1769561 ) ) ( not ( = ?auto_1769551 ?auto_1769562 ) ) ( not ( = ?auto_1769548 ?auto_1769552 ) ) ( not ( = ?auto_1769548 ?auto_1769554 ) ) ( not ( = ?auto_1769548 ?auto_1769553 ) ) ( not ( = ?auto_1769548 ?auto_1769555 ) ) ( not ( = ?auto_1769548 ?auto_1769556 ) ) ( not ( = ?auto_1769548 ?auto_1769557 ) ) ( not ( = ?auto_1769548 ?auto_1769558 ) ) ( not ( = ?auto_1769548 ?auto_1769559 ) ) ( not ( = ?auto_1769548 ?auto_1769560 ) ) ( not ( = ?auto_1769548 ?auto_1769561 ) ) ( not ( = ?auto_1769548 ?auto_1769562 ) ) ( not ( = ?auto_1769552 ?auto_1769554 ) ) ( not ( = ?auto_1769552 ?auto_1769553 ) ) ( not ( = ?auto_1769552 ?auto_1769555 ) ) ( not ( = ?auto_1769552 ?auto_1769556 ) ) ( not ( = ?auto_1769552 ?auto_1769557 ) ) ( not ( = ?auto_1769552 ?auto_1769558 ) ) ( not ( = ?auto_1769552 ?auto_1769559 ) ) ( not ( = ?auto_1769552 ?auto_1769560 ) ) ( not ( = ?auto_1769552 ?auto_1769561 ) ) ( not ( = ?auto_1769552 ?auto_1769562 ) ) ( not ( = ?auto_1769554 ?auto_1769553 ) ) ( not ( = ?auto_1769554 ?auto_1769555 ) ) ( not ( = ?auto_1769554 ?auto_1769556 ) ) ( not ( = ?auto_1769554 ?auto_1769557 ) ) ( not ( = ?auto_1769554 ?auto_1769558 ) ) ( not ( = ?auto_1769554 ?auto_1769559 ) ) ( not ( = ?auto_1769554 ?auto_1769560 ) ) ( not ( = ?auto_1769554 ?auto_1769561 ) ) ( not ( = ?auto_1769554 ?auto_1769562 ) ) ( not ( = ?auto_1769553 ?auto_1769555 ) ) ( not ( = ?auto_1769553 ?auto_1769556 ) ) ( not ( = ?auto_1769553 ?auto_1769557 ) ) ( not ( = ?auto_1769553 ?auto_1769558 ) ) ( not ( = ?auto_1769553 ?auto_1769559 ) ) ( not ( = ?auto_1769553 ?auto_1769560 ) ) ( not ( = ?auto_1769553 ?auto_1769561 ) ) ( not ( = ?auto_1769553 ?auto_1769562 ) ) ( not ( = ?auto_1769555 ?auto_1769556 ) ) ( not ( = ?auto_1769555 ?auto_1769557 ) ) ( not ( = ?auto_1769555 ?auto_1769558 ) ) ( not ( = ?auto_1769555 ?auto_1769559 ) ) ( not ( = ?auto_1769555 ?auto_1769560 ) ) ( not ( = ?auto_1769555 ?auto_1769561 ) ) ( not ( = ?auto_1769555 ?auto_1769562 ) ) ( not ( = ?auto_1769556 ?auto_1769557 ) ) ( not ( = ?auto_1769556 ?auto_1769558 ) ) ( not ( = ?auto_1769556 ?auto_1769559 ) ) ( not ( = ?auto_1769556 ?auto_1769560 ) ) ( not ( = ?auto_1769556 ?auto_1769561 ) ) ( not ( = ?auto_1769556 ?auto_1769562 ) ) ( not ( = ?auto_1769557 ?auto_1769558 ) ) ( not ( = ?auto_1769557 ?auto_1769559 ) ) ( not ( = ?auto_1769557 ?auto_1769560 ) ) ( not ( = ?auto_1769557 ?auto_1769561 ) ) ( not ( = ?auto_1769557 ?auto_1769562 ) ) ( not ( = ?auto_1769558 ?auto_1769559 ) ) ( not ( = ?auto_1769558 ?auto_1769560 ) ) ( not ( = ?auto_1769558 ?auto_1769561 ) ) ( not ( = ?auto_1769558 ?auto_1769562 ) ) ( not ( = ?auto_1769559 ?auto_1769560 ) ) ( not ( = ?auto_1769559 ?auto_1769561 ) ) ( not ( = ?auto_1769559 ?auto_1769562 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1769560 ?auto_1769561 ?auto_1769562 )
      ( MAKE-14CRATE-VERIFY ?auto_1769549 ?auto_1769550 ?auto_1769551 ?auto_1769548 ?auto_1769552 ?auto_1769554 ?auto_1769553 ?auto_1769555 ?auto_1769556 ?auto_1769557 ?auto_1769558 ?auto_1769559 ?auto_1769560 ?auto_1769561 ?auto_1769562 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1769752 - SURFACE
      ?auto_1769753 - SURFACE
      ?auto_1769754 - SURFACE
      ?auto_1769751 - SURFACE
      ?auto_1769755 - SURFACE
      ?auto_1769757 - SURFACE
      ?auto_1769756 - SURFACE
      ?auto_1769758 - SURFACE
      ?auto_1769759 - SURFACE
      ?auto_1769760 - SURFACE
      ?auto_1769761 - SURFACE
      ?auto_1769762 - SURFACE
      ?auto_1769763 - SURFACE
      ?auto_1769764 - SURFACE
      ?auto_1769765 - SURFACE
    )
    :vars
    (
      ?auto_1769768 - HOIST
      ?auto_1769767 - PLACE
      ?auto_1769770 - TRUCK
      ?auto_1769769 - PLACE
      ?auto_1769771 - HOIST
      ?auto_1769766 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1769768 ?auto_1769767 ) ( SURFACE-AT ?auto_1769764 ?auto_1769767 ) ( CLEAR ?auto_1769764 ) ( IS-CRATE ?auto_1769765 ) ( not ( = ?auto_1769764 ?auto_1769765 ) ) ( AVAILABLE ?auto_1769768 ) ( ON ?auto_1769764 ?auto_1769763 ) ( not ( = ?auto_1769763 ?auto_1769764 ) ) ( not ( = ?auto_1769763 ?auto_1769765 ) ) ( TRUCK-AT ?auto_1769770 ?auto_1769769 ) ( not ( = ?auto_1769769 ?auto_1769767 ) ) ( HOIST-AT ?auto_1769771 ?auto_1769769 ) ( not ( = ?auto_1769768 ?auto_1769771 ) ) ( AVAILABLE ?auto_1769771 ) ( SURFACE-AT ?auto_1769765 ?auto_1769769 ) ( ON ?auto_1769765 ?auto_1769766 ) ( CLEAR ?auto_1769765 ) ( not ( = ?auto_1769764 ?auto_1769766 ) ) ( not ( = ?auto_1769765 ?auto_1769766 ) ) ( not ( = ?auto_1769763 ?auto_1769766 ) ) ( ON ?auto_1769753 ?auto_1769752 ) ( ON ?auto_1769754 ?auto_1769753 ) ( ON ?auto_1769751 ?auto_1769754 ) ( ON ?auto_1769755 ?auto_1769751 ) ( ON ?auto_1769757 ?auto_1769755 ) ( ON ?auto_1769756 ?auto_1769757 ) ( ON ?auto_1769758 ?auto_1769756 ) ( ON ?auto_1769759 ?auto_1769758 ) ( ON ?auto_1769760 ?auto_1769759 ) ( ON ?auto_1769761 ?auto_1769760 ) ( ON ?auto_1769762 ?auto_1769761 ) ( ON ?auto_1769763 ?auto_1769762 ) ( not ( = ?auto_1769752 ?auto_1769753 ) ) ( not ( = ?auto_1769752 ?auto_1769754 ) ) ( not ( = ?auto_1769752 ?auto_1769751 ) ) ( not ( = ?auto_1769752 ?auto_1769755 ) ) ( not ( = ?auto_1769752 ?auto_1769757 ) ) ( not ( = ?auto_1769752 ?auto_1769756 ) ) ( not ( = ?auto_1769752 ?auto_1769758 ) ) ( not ( = ?auto_1769752 ?auto_1769759 ) ) ( not ( = ?auto_1769752 ?auto_1769760 ) ) ( not ( = ?auto_1769752 ?auto_1769761 ) ) ( not ( = ?auto_1769752 ?auto_1769762 ) ) ( not ( = ?auto_1769752 ?auto_1769763 ) ) ( not ( = ?auto_1769752 ?auto_1769764 ) ) ( not ( = ?auto_1769752 ?auto_1769765 ) ) ( not ( = ?auto_1769752 ?auto_1769766 ) ) ( not ( = ?auto_1769753 ?auto_1769754 ) ) ( not ( = ?auto_1769753 ?auto_1769751 ) ) ( not ( = ?auto_1769753 ?auto_1769755 ) ) ( not ( = ?auto_1769753 ?auto_1769757 ) ) ( not ( = ?auto_1769753 ?auto_1769756 ) ) ( not ( = ?auto_1769753 ?auto_1769758 ) ) ( not ( = ?auto_1769753 ?auto_1769759 ) ) ( not ( = ?auto_1769753 ?auto_1769760 ) ) ( not ( = ?auto_1769753 ?auto_1769761 ) ) ( not ( = ?auto_1769753 ?auto_1769762 ) ) ( not ( = ?auto_1769753 ?auto_1769763 ) ) ( not ( = ?auto_1769753 ?auto_1769764 ) ) ( not ( = ?auto_1769753 ?auto_1769765 ) ) ( not ( = ?auto_1769753 ?auto_1769766 ) ) ( not ( = ?auto_1769754 ?auto_1769751 ) ) ( not ( = ?auto_1769754 ?auto_1769755 ) ) ( not ( = ?auto_1769754 ?auto_1769757 ) ) ( not ( = ?auto_1769754 ?auto_1769756 ) ) ( not ( = ?auto_1769754 ?auto_1769758 ) ) ( not ( = ?auto_1769754 ?auto_1769759 ) ) ( not ( = ?auto_1769754 ?auto_1769760 ) ) ( not ( = ?auto_1769754 ?auto_1769761 ) ) ( not ( = ?auto_1769754 ?auto_1769762 ) ) ( not ( = ?auto_1769754 ?auto_1769763 ) ) ( not ( = ?auto_1769754 ?auto_1769764 ) ) ( not ( = ?auto_1769754 ?auto_1769765 ) ) ( not ( = ?auto_1769754 ?auto_1769766 ) ) ( not ( = ?auto_1769751 ?auto_1769755 ) ) ( not ( = ?auto_1769751 ?auto_1769757 ) ) ( not ( = ?auto_1769751 ?auto_1769756 ) ) ( not ( = ?auto_1769751 ?auto_1769758 ) ) ( not ( = ?auto_1769751 ?auto_1769759 ) ) ( not ( = ?auto_1769751 ?auto_1769760 ) ) ( not ( = ?auto_1769751 ?auto_1769761 ) ) ( not ( = ?auto_1769751 ?auto_1769762 ) ) ( not ( = ?auto_1769751 ?auto_1769763 ) ) ( not ( = ?auto_1769751 ?auto_1769764 ) ) ( not ( = ?auto_1769751 ?auto_1769765 ) ) ( not ( = ?auto_1769751 ?auto_1769766 ) ) ( not ( = ?auto_1769755 ?auto_1769757 ) ) ( not ( = ?auto_1769755 ?auto_1769756 ) ) ( not ( = ?auto_1769755 ?auto_1769758 ) ) ( not ( = ?auto_1769755 ?auto_1769759 ) ) ( not ( = ?auto_1769755 ?auto_1769760 ) ) ( not ( = ?auto_1769755 ?auto_1769761 ) ) ( not ( = ?auto_1769755 ?auto_1769762 ) ) ( not ( = ?auto_1769755 ?auto_1769763 ) ) ( not ( = ?auto_1769755 ?auto_1769764 ) ) ( not ( = ?auto_1769755 ?auto_1769765 ) ) ( not ( = ?auto_1769755 ?auto_1769766 ) ) ( not ( = ?auto_1769757 ?auto_1769756 ) ) ( not ( = ?auto_1769757 ?auto_1769758 ) ) ( not ( = ?auto_1769757 ?auto_1769759 ) ) ( not ( = ?auto_1769757 ?auto_1769760 ) ) ( not ( = ?auto_1769757 ?auto_1769761 ) ) ( not ( = ?auto_1769757 ?auto_1769762 ) ) ( not ( = ?auto_1769757 ?auto_1769763 ) ) ( not ( = ?auto_1769757 ?auto_1769764 ) ) ( not ( = ?auto_1769757 ?auto_1769765 ) ) ( not ( = ?auto_1769757 ?auto_1769766 ) ) ( not ( = ?auto_1769756 ?auto_1769758 ) ) ( not ( = ?auto_1769756 ?auto_1769759 ) ) ( not ( = ?auto_1769756 ?auto_1769760 ) ) ( not ( = ?auto_1769756 ?auto_1769761 ) ) ( not ( = ?auto_1769756 ?auto_1769762 ) ) ( not ( = ?auto_1769756 ?auto_1769763 ) ) ( not ( = ?auto_1769756 ?auto_1769764 ) ) ( not ( = ?auto_1769756 ?auto_1769765 ) ) ( not ( = ?auto_1769756 ?auto_1769766 ) ) ( not ( = ?auto_1769758 ?auto_1769759 ) ) ( not ( = ?auto_1769758 ?auto_1769760 ) ) ( not ( = ?auto_1769758 ?auto_1769761 ) ) ( not ( = ?auto_1769758 ?auto_1769762 ) ) ( not ( = ?auto_1769758 ?auto_1769763 ) ) ( not ( = ?auto_1769758 ?auto_1769764 ) ) ( not ( = ?auto_1769758 ?auto_1769765 ) ) ( not ( = ?auto_1769758 ?auto_1769766 ) ) ( not ( = ?auto_1769759 ?auto_1769760 ) ) ( not ( = ?auto_1769759 ?auto_1769761 ) ) ( not ( = ?auto_1769759 ?auto_1769762 ) ) ( not ( = ?auto_1769759 ?auto_1769763 ) ) ( not ( = ?auto_1769759 ?auto_1769764 ) ) ( not ( = ?auto_1769759 ?auto_1769765 ) ) ( not ( = ?auto_1769759 ?auto_1769766 ) ) ( not ( = ?auto_1769760 ?auto_1769761 ) ) ( not ( = ?auto_1769760 ?auto_1769762 ) ) ( not ( = ?auto_1769760 ?auto_1769763 ) ) ( not ( = ?auto_1769760 ?auto_1769764 ) ) ( not ( = ?auto_1769760 ?auto_1769765 ) ) ( not ( = ?auto_1769760 ?auto_1769766 ) ) ( not ( = ?auto_1769761 ?auto_1769762 ) ) ( not ( = ?auto_1769761 ?auto_1769763 ) ) ( not ( = ?auto_1769761 ?auto_1769764 ) ) ( not ( = ?auto_1769761 ?auto_1769765 ) ) ( not ( = ?auto_1769761 ?auto_1769766 ) ) ( not ( = ?auto_1769762 ?auto_1769763 ) ) ( not ( = ?auto_1769762 ?auto_1769764 ) ) ( not ( = ?auto_1769762 ?auto_1769765 ) ) ( not ( = ?auto_1769762 ?auto_1769766 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1769763 ?auto_1769764 ?auto_1769765 )
      ( MAKE-14CRATE-VERIFY ?auto_1769752 ?auto_1769753 ?auto_1769754 ?auto_1769751 ?auto_1769755 ?auto_1769757 ?auto_1769756 ?auto_1769758 ?auto_1769759 ?auto_1769760 ?auto_1769761 ?auto_1769762 ?auto_1769763 ?auto_1769764 ?auto_1769765 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1769956 - SURFACE
      ?auto_1769957 - SURFACE
      ?auto_1769958 - SURFACE
      ?auto_1769955 - SURFACE
      ?auto_1769959 - SURFACE
      ?auto_1769961 - SURFACE
      ?auto_1769960 - SURFACE
      ?auto_1769962 - SURFACE
      ?auto_1769963 - SURFACE
      ?auto_1769964 - SURFACE
      ?auto_1769965 - SURFACE
      ?auto_1769966 - SURFACE
      ?auto_1769967 - SURFACE
      ?auto_1769968 - SURFACE
      ?auto_1769969 - SURFACE
    )
    :vars
    (
      ?auto_1769973 - HOIST
      ?auto_1769971 - PLACE
      ?auto_1769975 - PLACE
      ?auto_1769972 - HOIST
      ?auto_1769970 - SURFACE
      ?auto_1769974 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1769973 ?auto_1769971 ) ( SURFACE-AT ?auto_1769968 ?auto_1769971 ) ( CLEAR ?auto_1769968 ) ( IS-CRATE ?auto_1769969 ) ( not ( = ?auto_1769968 ?auto_1769969 ) ) ( AVAILABLE ?auto_1769973 ) ( ON ?auto_1769968 ?auto_1769967 ) ( not ( = ?auto_1769967 ?auto_1769968 ) ) ( not ( = ?auto_1769967 ?auto_1769969 ) ) ( not ( = ?auto_1769975 ?auto_1769971 ) ) ( HOIST-AT ?auto_1769972 ?auto_1769975 ) ( not ( = ?auto_1769973 ?auto_1769972 ) ) ( AVAILABLE ?auto_1769972 ) ( SURFACE-AT ?auto_1769969 ?auto_1769975 ) ( ON ?auto_1769969 ?auto_1769970 ) ( CLEAR ?auto_1769969 ) ( not ( = ?auto_1769968 ?auto_1769970 ) ) ( not ( = ?auto_1769969 ?auto_1769970 ) ) ( not ( = ?auto_1769967 ?auto_1769970 ) ) ( TRUCK-AT ?auto_1769974 ?auto_1769971 ) ( ON ?auto_1769957 ?auto_1769956 ) ( ON ?auto_1769958 ?auto_1769957 ) ( ON ?auto_1769955 ?auto_1769958 ) ( ON ?auto_1769959 ?auto_1769955 ) ( ON ?auto_1769961 ?auto_1769959 ) ( ON ?auto_1769960 ?auto_1769961 ) ( ON ?auto_1769962 ?auto_1769960 ) ( ON ?auto_1769963 ?auto_1769962 ) ( ON ?auto_1769964 ?auto_1769963 ) ( ON ?auto_1769965 ?auto_1769964 ) ( ON ?auto_1769966 ?auto_1769965 ) ( ON ?auto_1769967 ?auto_1769966 ) ( not ( = ?auto_1769956 ?auto_1769957 ) ) ( not ( = ?auto_1769956 ?auto_1769958 ) ) ( not ( = ?auto_1769956 ?auto_1769955 ) ) ( not ( = ?auto_1769956 ?auto_1769959 ) ) ( not ( = ?auto_1769956 ?auto_1769961 ) ) ( not ( = ?auto_1769956 ?auto_1769960 ) ) ( not ( = ?auto_1769956 ?auto_1769962 ) ) ( not ( = ?auto_1769956 ?auto_1769963 ) ) ( not ( = ?auto_1769956 ?auto_1769964 ) ) ( not ( = ?auto_1769956 ?auto_1769965 ) ) ( not ( = ?auto_1769956 ?auto_1769966 ) ) ( not ( = ?auto_1769956 ?auto_1769967 ) ) ( not ( = ?auto_1769956 ?auto_1769968 ) ) ( not ( = ?auto_1769956 ?auto_1769969 ) ) ( not ( = ?auto_1769956 ?auto_1769970 ) ) ( not ( = ?auto_1769957 ?auto_1769958 ) ) ( not ( = ?auto_1769957 ?auto_1769955 ) ) ( not ( = ?auto_1769957 ?auto_1769959 ) ) ( not ( = ?auto_1769957 ?auto_1769961 ) ) ( not ( = ?auto_1769957 ?auto_1769960 ) ) ( not ( = ?auto_1769957 ?auto_1769962 ) ) ( not ( = ?auto_1769957 ?auto_1769963 ) ) ( not ( = ?auto_1769957 ?auto_1769964 ) ) ( not ( = ?auto_1769957 ?auto_1769965 ) ) ( not ( = ?auto_1769957 ?auto_1769966 ) ) ( not ( = ?auto_1769957 ?auto_1769967 ) ) ( not ( = ?auto_1769957 ?auto_1769968 ) ) ( not ( = ?auto_1769957 ?auto_1769969 ) ) ( not ( = ?auto_1769957 ?auto_1769970 ) ) ( not ( = ?auto_1769958 ?auto_1769955 ) ) ( not ( = ?auto_1769958 ?auto_1769959 ) ) ( not ( = ?auto_1769958 ?auto_1769961 ) ) ( not ( = ?auto_1769958 ?auto_1769960 ) ) ( not ( = ?auto_1769958 ?auto_1769962 ) ) ( not ( = ?auto_1769958 ?auto_1769963 ) ) ( not ( = ?auto_1769958 ?auto_1769964 ) ) ( not ( = ?auto_1769958 ?auto_1769965 ) ) ( not ( = ?auto_1769958 ?auto_1769966 ) ) ( not ( = ?auto_1769958 ?auto_1769967 ) ) ( not ( = ?auto_1769958 ?auto_1769968 ) ) ( not ( = ?auto_1769958 ?auto_1769969 ) ) ( not ( = ?auto_1769958 ?auto_1769970 ) ) ( not ( = ?auto_1769955 ?auto_1769959 ) ) ( not ( = ?auto_1769955 ?auto_1769961 ) ) ( not ( = ?auto_1769955 ?auto_1769960 ) ) ( not ( = ?auto_1769955 ?auto_1769962 ) ) ( not ( = ?auto_1769955 ?auto_1769963 ) ) ( not ( = ?auto_1769955 ?auto_1769964 ) ) ( not ( = ?auto_1769955 ?auto_1769965 ) ) ( not ( = ?auto_1769955 ?auto_1769966 ) ) ( not ( = ?auto_1769955 ?auto_1769967 ) ) ( not ( = ?auto_1769955 ?auto_1769968 ) ) ( not ( = ?auto_1769955 ?auto_1769969 ) ) ( not ( = ?auto_1769955 ?auto_1769970 ) ) ( not ( = ?auto_1769959 ?auto_1769961 ) ) ( not ( = ?auto_1769959 ?auto_1769960 ) ) ( not ( = ?auto_1769959 ?auto_1769962 ) ) ( not ( = ?auto_1769959 ?auto_1769963 ) ) ( not ( = ?auto_1769959 ?auto_1769964 ) ) ( not ( = ?auto_1769959 ?auto_1769965 ) ) ( not ( = ?auto_1769959 ?auto_1769966 ) ) ( not ( = ?auto_1769959 ?auto_1769967 ) ) ( not ( = ?auto_1769959 ?auto_1769968 ) ) ( not ( = ?auto_1769959 ?auto_1769969 ) ) ( not ( = ?auto_1769959 ?auto_1769970 ) ) ( not ( = ?auto_1769961 ?auto_1769960 ) ) ( not ( = ?auto_1769961 ?auto_1769962 ) ) ( not ( = ?auto_1769961 ?auto_1769963 ) ) ( not ( = ?auto_1769961 ?auto_1769964 ) ) ( not ( = ?auto_1769961 ?auto_1769965 ) ) ( not ( = ?auto_1769961 ?auto_1769966 ) ) ( not ( = ?auto_1769961 ?auto_1769967 ) ) ( not ( = ?auto_1769961 ?auto_1769968 ) ) ( not ( = ?auto_1769961 ?auto_1769969 ) ) ( not ( = ?auto_1769961 ?auto_1769970 ) ) ( not ( = ?auto_1769960 ?auto_1769962 ) ) ( not ( = ?auto_1769960 ?auto_1769963 ) ) ( not ( = ?auto_1769960 ?auto_1769964 ) ) ( not ( = ?auto_1769960 ?auto_1769965 ) ) ( not ( = ?auto_1769960 ?auto_1769966 ) ) ( not ( = ?auto_1769960 ?auto_1769967 ) ) ( not ( = ?auto_1769960 ?auto_1769968 ) ) ( not ( = ?auto_1769960 ?auto_1769969 ) ) ( not ( = ?auto_1769960 ?auto_1769970 ) ) ( not ( = ?auto_1769962 ?auto_1769963 ) ) ( not ( = ?auto_1769962 ?auto_1769964 ) ) ( not ( = ?auto_1769962 ?auto_1769965 ) ) ( not ( = ?auto_1769962 ?auto_1769966 ) ) ( not ( = ?auto_1769962 ?auto_1769967 ) ) ( not ( = ?auto_1769962 ?auto_1769968 ) ) ( not ( = ?auto_1769962 ?auto_1769969 ) ) ( not ( = ?auto_1769962 ?auto_1769970 ) ) ( not ( = ?auto_1769963 ?auto_1769964 ) ) ( not ( = ?auto_1769963 ?auto_1769965 ) ) ( not ( = ?auto_1769963 ?auto_1769966 ) ) ( not ( = ?auto_1769963 ?auto_1769967 ) ) ( not ( = ?auto_1769963 ?auto_1769968 ) ) ( not ( = ?auto_1769963 ?auto_1769969 ) ) ( not ( = ?auto_1769963 ?auto_1769970 ) ) ( not ( = ?auto_1769964 ?auto_1769965 ) ) ( not ( = ?auto_1769964 ?auto_1769966 ) ) ( not ( = ?auto_1769964 ?auto_1769967 ) ) ( not ( = ?auto_1769964 ?auto_1769968 ) ) ( not ( = ?auto_1769964 ?auto_1769969 ) ) ( not ( = ?auto_1769964 ?auto_1769970 ) ) ( not ( = ?auto_1769965 ?auto_1769966 ) ) ( not ( = ?auto_1769965 ?auto_1769967 ) ) ( not ( = ?auto_1769965 ?auto_1769968 ) ) ( not ( = ?auto_1769965 ?auto_1769969 ) ) ( not ( = ?auto_1769965 ?auto_1769970 ) ) ( not ( = ?auto_1769966 ?auto_1769967 ) ) ( not ( = ?auto_1769966 ?auto_1769968 ) ) ( not ( = ?auto_1769966 ?auto_1769969 ) ) ( not ( = ?auto_1769966 ?auto_1769970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1769967 ?auto_1769968 ?auto_1769969 )
      ( MAKE-14CRATE-VERIFY ?auto_1769956 ?auto_1769957 ?auto_1769958 ?auto_1769955 ?auto_1769959 ?auto_1769961 ?auto_1769960 ?auto_1769962 ?auto_1769963 ?auto_1769964 ?auto_1769965 ?auto_1769966 ?auto_1769967 ?auto_1769968 ?auto_1769969 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1770160 - SURFACE
      ?auto_1770161 - SURFACE
      ?auto_1770162 - SURFACE
      ?auto_1770159 - SURFACE
      ?auto_1770163 - SURFACE
      ?auto_1770165 - SURFACE
      ?auto_1770164 - SURFACE
      ?auto_1770166 - SURFACE
      ?auto_1770167 - SURFACE
      ?auto_1770168 - SURFACE
      ?auto_1770169 - SURFACE
      ?auto_1770170 - SURFACE
      ?auto_1770171 - SURFACE
      ?auto_1770172 - SURFACE
      ?auto_1770173 - SURFACE
    )
    :vars
    (
      ?auto_1770178 - HOIST
      ?auto_1770175 - PLACE
      ?auto_1770174 - PLACE
      ?auto_1770177 - HOIST
      ?auto_1770179 - SURFACE
      ?auto_1770176 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1770178 ?auto_1770175 ) ( IS-CRATE ?auto_1770173 ) ( not ( = ?auto_1770172 ?auto_1770173 ) ) ( not ( = ?auto_1770171 ?auto_1770172 ) ) ( not ( = ?auto_1770171 ?auto_1770173 ) ) ( not ( = ?auto_1770174 ?auto_1770175 ) ) ( HOIST-AT ?auto_1770177 ?auto_1770174 ) ( not ( = ?auto_1770178 ?auto_1770177 ) ) ( AVAILABLE ?auto_1770177 ) ( SURFACE-AT ?auto_1770173 ?auto_1770174 ) ( ON ?auto_1770173 ?auto_1770179 ) ( CLEAR ?auto_1770173 ) ( not ( = ?auto_1770172 ?auto_1770179 ) ) ( not ( = ?auto_1770173 ?auto_1770179 ) ) ( not ( = ?auto_1770171 ?auto_1770179 ) ) ( TRUCK-AT ?auto_1770176 ?auto_1770175 ) ( SURFACE-AT ?auto_1770171 ?auto_1770175 ) ( CLEAR ?auto_1770171 ) ( LIFTING ?auto_1770178 ?auto_1770172 ) ( IS-CRATE ?auto_1770172 ) ( ON ?auto_1770161 ?auto_1770160 ) ( ON ?auto_1770162 ?auto_1770161 ) ( ON ?auto_1770159 ?auto_1770162 ) ( ON ?auto_1770163 ?auto_1770159 ) ( ON ?auto_1770165 ?auto_1770163 ) ( ON ?auto_1770164 ?auto_1770165 ) ( ON ?auto_1770166 ?auto_1770164 ) ( ON ?auto_1770167 ?auto_1770166 ) ( ON ?auto_1770168 ?auto_1770167 ) ( ON ?auto_1770169 ?auto_1770168 ) ( ON ?auto_1770170 ?auto_1770169 ) ( ON ?auto_1770171 ?auto_1770170 ) ( not ( = ?auto_1770160 ?auto_1770161 ) ) ( not ( = ?auto_1770160 ?auto_1770162 ) ) ( not ( = ?auto_1770160 ?auto_1770159 ) ) ( not ( = ?auto_1770160 ?auto_1770163 ) ) ( not ( = ?auto_1770160 ?auto_1770165 ) ) ( not ( = ?auto_1770160 ?auto_1770164 ) ) ( not ( = ?auto_1770160 ?auto_1770166 ) ) ( not ( = ?auto_1770160 ?auto_1770167 ) ) ( not ( = ?auto_1770160 ?auto_1770168 ) ) ( not ( = ?auto_1770160 ?auto_1770169 ) ) ( not ( = ?auto_1770160 ?auto_1770170 ) ) ( not ( = ?auto_1770160 ?auto_1770171 ) ) ( not ( = ?auto_1770160 ?auto_1770172 ) ) ( not ( = ?auto_1770160 ?auto_1770173 ) ) ( not ( = ?auto_1770160 ?auto_1770179 ) ) ( not ( = ?auto_1770161 ?auto_1770162 ) ) ( not ( = ?auto_1770161 ?auto_1770159 ) ) ( not ( = ?auto_1770161 ?auto_1770163 ) ) ( not ( = ?auto_1770161 ?auto_1770165 ) ) ( not ( = ?auto_1770161 ?auto_1770164 ) ) ( not ( = ?auto_1770161 ?auto_1770166 ) ) ( not ( = ?auto_1770161 ?auto_1770167 ) ) ( not ( = ?auto_1770161 ?auto_1770168 ) ) ( not ( = ?auto_1770161 ?auto_1770169 ) ) ( not ( = ?auto_1770161 ?auto_1770170 ) ) ( not ( = ?auto_1770161 ?auto_1770171 ) ) ( not ( = ?auto_1770161 ?auto_1770172 ) ) ( not ( = ?auto_1770161 ?auto_1770173 ) ) ( not ( = ?auto_1770161 ?auto_1770179 ) ) ( not ( = ?auto_1770162 ?auto_1770159 ) ) ( not ( = ?auto_1770162 ?auto_1770163 ) ) ( not ( = ?auto_1770162 ?auto_1770165 ) ) ( not ( = ?auto_1770162 ?auto_1770164 ) ) ( not ( = ?auto_1770162 ?auto_1770166 ) ) ( not ( = ?auto_1770162 ?auto_1770167 ) ) ( not ( = ?auto_1770162 ?auto_1770168 ) ) ( not ( = ?auto_1770162 ?auto_1770169 ) ) ( not ( = ?auto_1770162 ?auto_1770170 ) ) ( not ( = ?auto_1770162 ?auto_1770171 ) ) ( not ( = ?auto_1770162 ?auto_1770172 ) ) ( not ( = ?auto_1770162 ?auto_1770173 ) ) ( not ( = ?auto_1770162 ?auto_1770179 ) ) ( not ( = ?auto_1770159 ?auto_1770163 ) ) ( not ( = ?auto_1770159 ?auto_1770165 ) ) ( not ( = ?auto_1770159 ?auto_1770164 ) ) ( not ( = ?auto_1770159 ?auto_1770166 ) ) ( not ( = ?auto_1770159 ?auto_1770167 ) ) ( not ( = ?auto_1770159 ?auto_1770168 ) ) ( not ( = ?auto_1770159 ?auto_1770169 ) ) ( not ( = ?auto_1770159 ?auto_1770170 ) ) ( not ( = ?auto_1770159 ?auto_1770171 ) ) ( not ( = ?auto_1770159 ?auto_1770172 ) ) ( not ( = ?auto_1770159 ?auto_1770173 ) ) ( not ( = ?auto_1770159 ?auto_1770179 ) ) ( not ( = ?auto_1770163 ?auto_1770165 ) ) ( not ( = ?auto_1770163 ?auto_1770164 ) ) ( not ( = ?auto_1770163 ?auto_1770166 ) ) ( not ( = ?auto_1770163 ?auto_1770167 ) ) ( not ( = ?auto_1770163 ?auto_1770168 ) ) ( not ( = ?auto_1770163 ?auto_1770169 ) ) ( not ( = ?auto_1770163 ?auto_1770170 ) ) ( not ( = ?auto_1770163 ?auto_1770171 ) ) ( not ( = ?auto_1770163 ?auto_1770172 ) ) ( not ( = ?auto_1770163 ?auto_1770173 ) ) ( not ( = ?auto_1770163 ?auto_1770179 ) ) ( not ( = ?auto_1770165 ?auto_1770164 ) ) ( not ( = ?auto_1770165 ?auto_1770166 ) ) ( not ( = ?auto_1770165 ?auto_1770167 ) ) ( not ( = ?auto_1770165 ?auto_1770168 ) ) ( not ( = ?auto_1770165 ?auto_1770169 ) ) ( not ( = ?auto_1770165 ?auto_1770170 ) ) ( not ( = ?auto_1770165 ?auto_1770171 ) ) ( not ( = ?auto_1770165 ?auto_1770172 ) ) ( not ( = ?auto_1770165 ?auto_1770173 ) ) ( not ( = ?auto_1770165 ?auto_1770179 ) ) ( not ( = ?auto_1770164 ?auto_1770166 ) ) ( not ( = ?auto_1770164 ?auto_1770167 ) ) ( not ( = ?auto_1770164 ?auto_1770168 ) ) ( not ( = ?auto_1770164 ?auto_1770169 ) ) ( not ( = ?auto_1770164 ?auto_1770170 ) ) ( not ( = ?auto_1770164 ?auto_1770171 ) ) ( not ( = ?auto_1770164 ?auto_1770172 ) ) ( not ( = ?auto_1770164 ?auto_1770173 ) ) ( not ( = ?auto_1770164 ?auto_1770179 ) ) ( not ( = ?auto_1770166 ?auto_1770167 ) ) ( not ( = ?auto_1770166 ?auto_1770168 ) ) ( not ( = ?auto_1770166 ?auto_1770169 ) ) ( not ( = ?auto_1770166 ?auto_1770170 ) ) ( not ( = ?auto_1770166 ?auto_1770171 ) ) ( not ( = ?auto_1770166 ?auto_1770172 ) ) ( not ( = ?auto_1770166 ?auto_1770173 ) ) ( not ( = ?auto_1770166 ?auto_1770179 ) ) ( not ( = ?auto_1770167 ?auto_1770168 ) ) ( not ( = ?auto_1770167 ?auto_1770169 ) ) ( not ( = ?auto_1770167 ?auto_1770170 ) ) ( not ( = ?auto_1770167 ?auto_1770171 ) ) ( not ( = ?auto_1770167 ?auto_1770172 ) ) ( not ( = ?auto_1770167 ?auto_1770173 ) ) ( not ( = ?auto_1770167 ?auto_1770179 ) ) ( not ( = ?auto_1770168 ?auto_1770169 ) ) ( not ( = ?auto_1770168 ?auto_1770170 ) ) ( not ( = ?auto_1770168 ?auto_1770171 ) ) ( not ( = ?auto_1770168 ?auto_1770172 ) ) ( not ( = ?auto_1770168 ?auto_1770173 ) ) ( not ( = ?auto_1770168 ?auto_1770179 ) ) ( not ( = ?auto_1770169 ?auto_1770170 ) ) ( not ( = ?auto_1770169 ?auto_1770171 ) ) ( not ( = ?auto_1770169 ?auto_1770172 ) ) ( not ( = ?auto_1770169 ?auto_1770173 ) ) ( not ( = ?auto_1770169 ?auto_1770179 ) ) ( not ( = ?auto_1770170 ?auto_1770171 ) ) ( not ( = ?auto_1770170 ?auto_1770172 ) ) ( not ( = ?auto_1770170 ?auto_1770173 ) ) ( not ( = ?auto_1770170 ?auto_1770179 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1770171 ?auto_1770172 ?auto_1770173 )
      ( MAKE-14CRATE-VERIFY ?auto_1770160 ?auto_1770161 ?auto_1770162 ?auto_1770159 ?auto_1770163 ?auto_1770165 ?auto_1770164 ?auto_1770166 ?auto_1770167 ?auto_1770168 ?auto_1770169 ?auto_1770170 ?auto_1770171 ?auto_1770172 ?auto_1770173 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1770364 - SURFACE
      ?auto_1770365 - SURFACE
      ?auto_1770366 - SURFACE
      ?auto_1770363 - SURFACE
      ?auto_1770367 - SURFACE
      ?auto_1770369 - SURFACE
      ?auto_1770368 - SURFACE
      ?auto_1770370 - SURFACE
      ?auto_1770371 - SURFACE
      ?auto_1770372 - SURFACE
      ?auto_1770373 - SURFACE
      ?auto_1770374 - SURFACE
      ?auto_1770375 - SURFACE
      ?auto_1770376 - SURFACE
      ?auto_1770377 - SURFACE
    )
    :vars
    (
      ?auto_1770381 - HOIST
      ?auto_1770380 - PLACE
      ?auto_1770383 - PLACE
      ?auto_1770378 - HOIST
      ?auto_1770379 - SURFACE
      ?auto_1770382 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1770381 ?auto_1770380 ) ( IS-CRATE ?auto_1770377 ) ( not ( = ?auto_1770376 ?auto_1770377 ) ) ( not ( = ?auto_1770375 ?auto_1770376 ) ) ( not ( = ?auto_1770375 ?auto_1770377 ) ) ( not ( = ?auto_1770383 ?auto_1770380 ) ) ( HOIST-AT ?auto_1770378 ?auto_1770383 ) ( not ( = ?auto_1770381 ?auto_1770378 ) ) ( AVAILABLE ?auto_1770378 ) ( SURFACE-AT ?auto_1770377 ?auto_1770383 ) ( ON ?auto_1770377 ?auto_1770379 ) ( CLEAR ?auto_1770377 ) ( not ( = ?auto_1770376 ?auto_1770379 ) ) ( not ( = ?auto_1770377 ?auto_1770379 ) ) ( not ( = ?auto_1770375 ?auto_1770379 ) ) ( TRUCK-AT ?auto_1770382 ?auto_1770380 ) ( SURFACE-AT ?auto_1770375 ?auto_1770380 ) ( CLEAR ?auto_1770375 ) ( IS-CRATE ?auto_1770376 ) ( AVAILABLE ?auto_1770381 ) ( IN ?auto_1770376 ?auto_1770382 ) ( ON ?auto_1770365 ?auto_1770364 ) ( ON ?auto_1770366 ?auto_1770365 ) ( ON ?auto_1770363 ?auto_1770366 ) ( ON ?auto_1770367 ?auto_1770363 ) ( ON ?auto_1770369 ?auto_1770367 ) ( ON ?auto_1770368 ?auto_1770369 ) ( ON ?auto_1770370 ?auto_1770368 ) ( ON ?auto_1770371 ?auto_1770370 ) ( ON ?auto_1770372 ?auto_1770371 ) ( ON ?auto_1770373 ?auto_1770372 ) ( ON ?auto_1770374 ?auto_1770373 ) ( ON ?auto_1770375 ?auto_1770374 ) ( not ( = ?auto_1770364 ?auto_1770365 ) ) ( not ( = ?auto_1770364 ?auto_1770366 ) ) ( not ( = ?auto_1770364 ?auto_1770363 ) ) ( not ( = ?auto_1770364 ?auto_1770367 ) ) ( not ( = ?auto_1770364 ?auto_1770369 ) ) ( not ( = ?auto_1770364 ?auto_1770368 ) ) ( not ( = ?auto_1770364 ?auto_1770370 ) ) ( not ( = ?auto_1770364 ?auto_1770371 ) ) ( not ( = ?auto_1770364 ?auto_1770372 ) ) ( not ( = ?auto_1770364 ?auto_1770373 ) ) ( not ( = ?auto_1770364 ?auto_1770374 ) ) ( not ( = ?auto_1770364 ?auto_1770375 ) ) ( not ( = ?auto_1770364 ?auto_1770376 ) ) ( not ( = ?auto_1770364 ?auto_1770377 ) ) ( not ( = ?auto_1770364 ?auto_1770379 ) ) ( not ( = ?auto_1770365 ?auto_1770366 ) ) ( not ( = ?auto_1770365 ?auto_1770363 ) ) ( not ( = ?auto_1770365 ?auto_1770367 ) ) ( not ( = ?auto_1770365 ?auto_1770369 ) ) ( not ( = ?auto_1770365 ?auto_1770368 ) ) ( not ( = ?auto_1770365 ?auto_1770370 ) ) ( not ( = ?auto_1770365 ?auto_1770371 ) ) ( not ( = ?auto_1770365 ?auto_1770372 ) ) ( not ( = ?auto_1770365 ?auto_1770373 ) ) ( not ( = ?auto_1770365 ?auto_1770374 ) ) ( not ( = ?auto_1770365 ?auto_1770375 ) ) ( not ( = ?auto_1770365 ?auto_1770376 ) ) ( not ( = ?auto_1770365 ?auto_1770377 ) ) ( not ( = ?auto_1770365 ?auto_1770379 ) ) ( not ( = ?auto_1770366 ?auto_1770363 ) ) ( not ( = ?auto_1770366 ?auto_1770367 ) ) ( not ( = ?auto_1770366 ?auto_1770369 ) ) ( not ( = ?auto_1770366 ?auto_1770368 ) ) ( not ( = ?auto_1770366 ?auto_1770370 ) ) ( not ( = ?auto_1770366 ?auto_1770371 ) ) ( not ( = ?auto_1770366 ?auto_1770372 ) ) ( not ( = ?auto_1770366 ?auto_1770373 ) ) ( not ( = ?auto_1770366 ?auto_1770374 ) ) ( not ( = ?auto_1770366 ?auto_1770375 ) ) ( not ( = ?auto_1770366 ?auto_1770376 ) ) ( not ( = ?auto_1770366 ?auto_1770377 ) ) ( not ( = ?auto_1770366 ?auto_1770379 ) ) ( not ( = ?auto_1770363 ?auto_1770367 ) ) ( not ( = ?auto_1770363 ?auto_1770369 ) ) ( not ( = ?auto_1770363 ?auto_1770368 ) ) ( not ( = ?auto_1770363 ?auto_1770370 ) ) ( not ( = ?auto_1770363 ?auto_1770371 ) ) ( not ( = ?auto_1770363 ?auto_1770372 ) ) ( not ( = ?auto_1770363 ?auto_1770373 ) ) ( not ( = ?auto_1770363 ?auto_1770374 ) ) ( not ( = ?auto_1770363 ?auto_1770375 ) ) ( not ( = ?auto_1770363 ?auto_1770376 ) ) ( not ( = ?auto_1770363 ?auto_1770377 ) ) ( not ( = ?auto_1770363 ?auto_1770379 ) ) ( not ( = ?auto_1770367 ?auto_1770369 ) ) ( not ( = ?auto_1770367 ?auto_1770368 ) ) ( not ( = ?auto_1770367 ?auto_1770370 ) ) ( not ( = ?auto_1770367 ?auto_1770371 ) ) ( not ( = ?auto_1770367 ?auto_1770372 ) ) ( not ( = ?auto_1770367 ?auto_1770373 ) ) ( not ( = ?auto_1770367 ?auto_1770374 ) ) ( not ( = ?auto_1770367 ?auto_1770375 ) ) ( not ( = ?auto_1770367 ?auto_1770376 ) ) ( not ( = ?auto_1770367 ?auto_1770377 ) ) ( not ( = ?auto_1770367 ?auto_1770379 ) ) ( not ( = ?auto_1770369 ?auto_1770368 ) ) ( not ( = ?auto_1770369 ?auto_1770370 ) ) ( not ( = ?auto_1770369 ?auto_1770371 ) ) ( not ( = ?auto_1770369 ?auto_1770372 ) ) ( not ( = ?auto_1770369 ?auto_1770373 ) ) ( not ( = ?auto_1770369 ?auto_1770374 ) ) ( not ( = ?auto_1770369 ?auto_1770375 ) ) ( not ( = ?auto_1770369 ?auto_1770376 ) ) ( not ( = ?auto_1770369 ?auto_1770377 ) ) ( not ( = ?auto_1770369 ?auto_1770379 ) ) ( not ( = ?auto_1770368 ?auto_1770370 ) ) ( not ( = ?auto_1770368 ?auto_1770371 ) ) ( not ( = ?auto_1770368 ?auto_1770372 ) ) ( not ( = ?auto_1770368 ?auto_1770373 ) ) ( not ( = ?auto_1770368 ?auto_1770374 ) ) ( not ( = ?auto_1770368 ?auto_1770375 ) ) ( not ( = ?auto_1770368 ?auto_1770376 ) ) ( not ( = ?auto_1770368 ?auto_1770377 ) ) ( not ( = ?auto_1770368 ?auto_1770379 ) ) ( not ( = ?auto_1770370 ?auto_1770371 ) ) ( not ( = ?auto_1770370 ?auto_1770372 ) ) ( not ( = ?auto_1770370 ?auto_1770373 ) ) ( not ( = ?auto_1770370 ?auto_1770374 ) ) ( not ( = ?auto_1770370 ?auto_1770375 ) ) ( not ( = ?auto_1770370 ?auto_1770376 ) ) ( not ( = ?auto_1770370 ?auto_1770377 ) ) ( not ( = ?auto_1770370 ?auto_1770379 ) ) ( not ( = ?auto_1770371 ?auto_1770372 ) ) ( not ( = ?auto_1770371 ?auto_1770373 ) ) ( not ( = ?auto_1770371 ?auto_1770374 ) ) ( not ( = ?auto_1770371 ?auto_1770375 ) ) ( not ( = ?auto_1770371 ?auto_1770376 ) ) ( not ( = ?auto_1770371 ?auto_1770377 ) ) ( not ( = ?auto_1770371 ?auto_1770379 ) ) ( not ( = ?auto_1770372 ?auto_1770373 ) ) ( not ( = ?auto_1770372 ?auto_1770374 ) ) ( not ( = ?auto_1770372 ?auto_1770375 ) ) ( not ( = ?auto_1770372 ?auto_1770376 ) ) ( not ( = ?auto_1770372 ?auto_1770377 ) ) ( not ( = ?auto_1770372 ?auto_1770379 ) ) ( not ( = ?auto_1770373 ?auto_1770374 ) ) ( not ( = ?auto_1770373 ?auto_1770375 ) ) ( not ( = ?auto_1770373 ?auto_1770376 ) ) ( not ( = ?auto_1770373 ?auto_1770377 ) ) ( not ( = ?auto_1770373 ?auto_1770379 ) ) ( not ( = ?auto_1770374 ?auto_1770375 ) ) ( not ( = ?auto_1770374 ?auto_1770376 ) ) ( not ( = ?auto_1770374 ?auto_1770377 ) ) ( not ( = ?auto_1770374 ?auto_1770379 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1770375 ?auto_1770376 ?auto_1770377 )
      ( MAKE-14CRATE-VERIFY ?auto_1770364 ?auto_1770365 ?auto_1770366 ?auto_1770363 ?auto_1770367 ?auto_1770369 ?auto_1770368 ?auto_1770370 ?auto_1770371 ?auto_1770372 ?auto_1770373 ?auto_1770374 ?auto_1770375 ?auto_1770376 ?auto_1770377 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1787524 - SURFACE
      ?auto_1787525 - SURFACE
      ?auto_1787526 - SURFACE
      ?auto_1787523 - SURFACE
      ?auto_1787527 - SURFACE
      ?auto_1787529 - SURFACE
      ?auto_1787528 - SURFACE
      ?auto_1787530 - SURFACE
      ?auto_1787531 - SURFACE
      ?auto_1787532 - SURFACE
      ?auto_1787533 - SURFACE
      ?auto_1787534 - SURFACE
      ?auto_1787535 - SURFACE
      ?auto_1787536 - SURFACE
      ?auto_1787537 - SURFACE
      ?auto_1787538 - SURFACE
    )
    :vars
    (
      ?auto_1787540 - HOIST
      ?auto_1787539 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1787540 ?auto_1787539 ) ( SURFACE-AT ?auto_1787537 ?auto_1787539 ) ( CLEAR ?auto_1787537 ) ( LIFTING ?auto_1787540 ?auto_1787538 ) ( IS-CRATE ?auto_1787538 ) ( not ( = ?auto_1787537 ?auto_1787538 ) ) ( ON ?auto_1787525 ?auto_1787524 ) ( ON ?auto_1787526 ?auto_1787525 ) ( ON ?auto_1787523 ?auto_1787526 ) ( ON ?auto_1787527 ?auto_1787523 ) ( ON ?auto_1787529 ?auto_1787527 ) ( ON ?auto_1787528 ?auto_1787529 ) ( ON ?auto_1787530 ?auto_1787528 ) ( ON ?auto_1787531 ?auto_1787530 ) ( ON ?auto_1787532 ?auto_1787531 ) ( ON ?auto_1787533 ?auto_1787532 ) ( ON ?auto_1787534 ?auto_1787533 ) ( ON ?auto_1787535 ?auto_1787534 ) ( ON ?auto_1787536 ?auto_1787535 ) ( ON ?auto_1787537 ?auto_1787536 ) ( not ( = ?auto_1787524 ?auto_1787525 ) ) ( not ( = ?auto_1787524 ?auto_1787526 ) ) ( not ( = ?auto_1787524 ?auto_1787523 ) ) ( not ( = ?auto_1787524 ?auto_1787527 ) ) ( not ( = ?auto_1787524 ?auto_1787529 ) ) ( not ( = ?auto_1787524 ?auto_1787528 ) ) ( not ( = ?auto_1787524 ?auto_1787530 ) ) ( not ( = ?auto_1787524 ?auto_1787531 ) ) ( not ( = ?auto_1787524 ?auto_1787532 ) ) ( not ( = ?auto_1787524 ?auto_1787533 ) ) ( not ( = ?auto_1787524 ?auto_1787534 ) ) ( not ( = ?auto_1787524 ?auto_1787535 ) ) ( not ( = ?auto_1787524 ?auto_1787536 ) ) ( not ( = ?auto_1787524 ?auto_1787537 ) ) ( not ( = ?auto_1787524 ?auto_1787538 ) ) ( not ( = ?auto_1787525 ?auto_1787526 ) ) ( not ( = ?auto_1787525 ?auto_1787523 ) ) ( not ( = ?auto_1787525 ?auto_1787527 ) ) ( not ( = ?auto_1787525 ?auto_1787529 ) ) ( not ( = ?auto_1787525 ?auto_1787528 ) ) ( not ( = ?auto_1787525 ?auto_1787530 ) ) ( not ( = ?auto_1787525 ?auto_1787531 ) ) ( not ( = ?auto_1787525 ?auto_1787532 ) ) ( not ( = ?auto_1787525 ?auto_1787533 ) ) ( not ( = ?auto_1787525 ?auto_1787534 ) ) ( not ( = ?auto_1787525 ?auto_1787535 ) ) ( not ( = ?auto_1787525 ?auto_1787536 ) ) ( not ( = ?auto_1787525 ?auto_1787537 ) ) ( not ( = ?auto_1787525 ?auto_1787538 ) ) ( not ( = ?auto_1787526 ?auto_1787523 ) ) ( not ( = ?auto_1787526 ?auto_1787527 ) ) ( not ( = ?auto_1787526 ?auto_1787529 ) ) ( not ( = ?auto_1787526 ?auto_1787528 ) ) ( not ( = ?auto_1787526 ?auto_1787530 ) ) ( not ( = ?auto_1787526 ?auto_1787531 ) ) ( not ( = ?auto_1787526 ?auto_1787532 ) ) ( not ( = ?auto_1787526 ?auto_1787533 ) ) ( not ( = ?auto_1787526 ?auto_1787534 ) ) ( not ( = ?auto_1787526 ?auto_1787535 ) ) ( not ( = ?auto_1787526 ?auto_1787536 ) ) ( not ( = ?auto_1787526 ?auto_1787537 ) ) ( not ( = ?auto_1787526 ?auto_1787538 ) ) ( not ( = ?auto_1787523 ?auto_1787527 ) ) ( not ( = ?auto_1787523 ?auto_1787529 ) ) ( not ( = ?auto_1787523 ?auto_1787528 ) ) ( not ( = ?auto_1787523 ?auto_1787530 ) ) ( not ( = ?auto_1787523 ?auto_1787531 ) ) ( not ( = ?auto_1787523 ?auto_1787532 ) ) ( not ( = ?auto_1787523 ?auto_1787533 ) ) ( not ( = ?auto_1787523 ?auto_1787534 ) ) ( not ( = ?auto_1787523 ?auto_1787535 ) ) ( not ( = ?auto_1787523 ?auto_1787536 ) ) ( not ( = ?auto_1787523 ?auto_1787537 ) ) ( not ( = ?auto_1787523 ?auto_1787538 ) ) ( not ( = ?auto_1787527 ?auto_1787529 ) ) ( not ( = ?auto_1787527 ?auto_1787528 ) ) ( not ( = ?auto_1787527 ?auto_1787530 ) ) ( not ( = ?auto_1787527 ?auto_1787531 ) ) ( not ( = ?auto_1787527 ?auto_1787532 ) ) ( not ( = ?auto_1787527 ?auto_1787533 ) ) ( not ( = ?auto_1787527 ?auto_1787534 ) ) ( not ( = ?auto_1787527 ?auto_1787535 ) ) ( not ( = ?auto_1787527 ?auto_1787536 ) ) ( not ( = ?auto_1787527 ?auto_1787537 ) ) ( not ( = ?auto_1787527 ?auto_1787538 ) ) ( not ( = ?auto_1787529 ?auto_1787528 ) ) ( not ( = ?auto_1787529 ?auto_1787530 ) ) ( not ( = ?auto_1787529 ?auto_1787531 ) ) ( not ( = ?auto_1787529 ?auto_1787532 ) ) ( not ( = ?auto_1787529 ?auto_1787533 ) ) ( not ( = ?auto_1787529 ?auto_1787534 ) ) ( not ( = ?auto_1787529 ?auto_1787535 ) ) ( not ( = ?auto_1787529 ?auto_1787536 ) ) ( not ( = ?auto_1787529 ?auto_1787537 ) ) ( not ( = ?auto_1787529 ?auto_1787538 ) ) ( not ( = ?auto_1787528 ?auto_1787530 ) ) ( not ( = ?auto_1787528 ?auto_1787531 ) ) ( not ( = ?auto_1787528 ?auto_1787532 ) ) ( not ( = ?auto_1787528 ?auto_1787533 ) ) ( not ( = ?auto_1787528 ?auto_1787534 ) ) ( not ( = ?auto_1787528 ?auto_1787535 ) ) ( not ( = ?auto_1787528 ?auto_1787536 ) ) ( not ( = ?auto_1787528 ?auto_1787537 ) ) ( not ( = ?auto_1787528 ?auto_1787538 ) ) ( not ( = ?auto_1787530 ?auto_1787531 ) ) ( not ( = ?auto_1787530 ?auto_1787532 ) ) ( not ( = ?auto_1787530 ?auto_1787533 ) ) ( not ( = ?auto_1787530 ?auto_1787534 ) ) ( not ( = ?auto_1787530 ?auto_1787535 ) ) ( not ( = ?auto_1787530 ?auto_1787536 ) ) ( not ( = ?auto_1787530 ?auto_1787537 ) ) ( not ( = ?auto_1787530 ?auto_1787538 ) ) ( not ( = ?auto_1787531 ?auto_1787532 ) ) ( not ( = ?auto_1787531 ?auto_1787533 ) ) ( not ( = ?auto_1787531 ?auto_1787534 ) ) ( not ( = ?auto_1787531 ?auto_1787535 ) ) ( not ( = ?auto_1787531 ?auto_1787536 ) ) ( not ( = ?auto_1787531 ?auto_1787537 ) ) ( not ( = ?auto_1787531 ?auto_1787538 ) ) ( not ( = ?auto_1787532 ?auto_1787533 ) ) ( not ( = ?auto_1787532 ?auto_1787534 ) ) ( not ( = ?auto_1787532 ?auto_1787535 ) ) ( not ( = ?auto_1787532 ?auto_1787536 ) ) ( not ( = ?auto_1787532 ?auto_1787537 ) ) ( not ( = ?auto_1787532 ?auto_1787538 ) ) ( not ( = ?auto_1787533 ?auto_1787534 ) ) ( not ( = ?auto_1787533 ?auto_1787535 ) ) ( not ( = ?auto_1787533 ?auto_1787536 ) ) ( not ( = ?auto_1787533 ?auto_1787537 ) ) ( not ( = ?auto_1787533 ?auto_1787538 ) ) ( not ( = ?auto_1787534 ?auto_1787535 ) ) ( not ( = ?auto_1787534 ?auto_1787536 ) ) ( not ( = ?auto_1787534 ?auto_1787537 ) ) ( not ( = ?auto_1787534 ?auto_1787538 ) ) ( not ( = ?auto_1787535 ?auto_1787536 ) ) ( not ( = ?auto_1787535 ?auto_1787537 ) ) ( not ( = ?auto_1787535 ?auto_1787538 ) ) ( not ( = ?auto_1787536 ?auto_1787537 ) ) ( not ( = ?auto_1787536 ?auto_1787538 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1787537 ?auto_1787538 )
      ( MAKE-15CRATE-VERIFY ?auto_1787524 ?auto_1787525 ?auto_1787526 ?auto_1787523 ?auto_1787527 ?auto_1787529 ?auto_1787528 ?auto_1787530 ?auto_1787531 ?auto_1787532 ?auto_1787533 ?auto_1787534 ?auto_1787535 ?auto_1787536 ?auto_1787537 ?auto_1787538 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1787703 - SURFACE
      ?auto_1787704 - SURFACE
      ?auto_1787705 - SURFACE
      ?auto_1787702 - SURFACE
      ?auto_1787706 - SURFACE
      ?auto_1787708 - SURFACE
      ?auto_1787707 - SURFACE
      ?auto_1787709 - SURFACE
      ?auto_1787710 - SURFACE
      ?auto_1787711 - SURFACE
      ?auto_1787712 - SURFACE
      ?auto_1787713 - SURFACE
      ?auto_1787714 - SURFACE
      ?auto_1787715 - SURFACE
      ?auto_1787716 - SURFACE
      ?auto_1787717 - SURFACE
    )
    :vars
    (
      ?auto_1787718 - HOIST
      ?auto_1787720 - PLACE
      ?auto_1787719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1787718 ?auto_1787720 ) ( SURFACE-AT ?auto_1787716 ?auto_1787720 ) ( CLEAR ?auto_1787716 ) ( IS-CRATE ?auto_1787717 ) ( not ( = ?auto_1787716 ?auto_1787717 ) ) ( TRUCK-AT ?auto_1787719 ?auto_1787720 ) ( AVAILABLE ?auto_1787718 ) ( IN ?auto_1787717 ?auto_1787719 ) ( ON ?auto_1787716 ?auto_1787715 ) ( not ( = ?auto_1787715 ?auto_1787716 ) ) ( not ( = ?auto_1787715 ?auto_1787717 ) ) ( ON ?auto_1787704 ?auto_1787703 ) ( ON ?auto_1787705 ?auto_1787704 ) ( ON ?auto_1787702 ?auto_1787705 ) ( ON ?auto_1787706 ?auto_1787702 ) ( ON ?auto_1787708 ?auto_1787706 ) ( ON ?auto_1787707 ?auto_1787708 ) ( ON ?auto_1787709 ?auto_1787707 ) ( ON ?auto_1787710 ?auto_1787709 ) ( ON ?auto_1787711 ?auto_1787710 ) ( ON ?auto_1787712 ?auto_1787711 ) ( ON ?auto_1787713 ?auto_1787712 ) ( ON ?auto_1787714 ?auto_1787713 ) ( ON ?auto_1787715 ?auto_1787714 ) ( not ( = ?auto_1787703 ?auto_1787704 ) ) ( not ( = ?auto_1787703 ?auto_1787705 ) ) ( not ( = ?auto_1787703 ?auto_1787702 ) ) ( not ( = ?auto_1787703 ?auto_1787706 ) ) ( not ( = ?auto_1787703 ?auto_1787708 ) ) ( not ( = ?auto_1787703 ?auto_1787707 ) ) ( not ( = ?auto_1787703 ?auto_1787709 ) ) ( not ( = ?auto_1787703 ?auto_1787710 ) ) ( not ( = ?auto_1787703 ?auto_1787711 ) ) ( not ( = ?auto_1787703 ?auto_1787712 ) ) ( not ( = ?auto_1787703 ?auto_1787713 ) ) ( not ( = ?auto_1787703 ?auto_1787714 ) ) ( not ( = ?auto_1787703 ?auto_1787715 ) ) ( not ( = ?auto_1787703 ?auto_1787716 ) ) ( not ( = ?auto_1787703 ?auto_1787717 ) ) ( not ( = ?auto_1787704 ?auto_1787705 ) ) ( not ( = ?auto_1787704 ?auto_1787702 ) ) ( not ( = ?auto_1787704 ?auto_1787706 ) ) ( not ( = ?auto_1787704 ?auto_1787708 ) ) ( not ( = ?auto_1787704 ?auto_1787707 ) ) ( not ( = ?auto_1787704 ?auto_1787709 ) ) ( not ( = ?auto_1787704 ?auto_1787710 ) ) ( not ( = ?auto_1787704 ?auto_1787711 ) ) ( not ( = ?auto_1787704 ?auto_1787712 ) ) ( not ( = ?auto_1787704 ?auto_1787713 ) ) ( not ( = ?auto_1787704 ?auto_1787714 ) ) ( not ( = ?auto_1787704 ?auto_1787715 ) ) ( not ( = ?auto_1787704 ?auto_1787716 ) ) ( not ( = ?auto_1787704 ?auto_1787717 ) ) ( not ( = ?auto_1787705 ?auto_1787702 ) ) ( not ( = ?auto_1787705 ?auto_1787706 ) ) ( not ( = ?auto_1787705 ?auto_1787708 ) ) ( not ( = ?auto_1787705 ?auto_1787707 ) ) ( not ( = ?auto_1787705 ?auto_1787709 ) ) ( not ( = ?auto_1787705 ?auto_1787710 ) ) ( not ( = ?auto_1787705 ?auto_1787711 ) ) ( not ( = ?auto_1787705 ?auto_1787712 ) ) ( not ( = ?auto_1787705 ?auto_1787713 ) ) ( not ( = ?auto_1787705 ?auto_1787714 ) ) ( not ( = ?auto_1787705 ?auto_1787715 ) ) ( not ( = ?auto_1787705 ?auto_1787716 ) ) ( not ( = ?auto_1787705 ?auto_1787717 ) ) ( not ( = ?auto_1787702 ?auto_1787706 ) ) ( not ( = ?auto_1787702 ?auto_1787708 ) ) ( not ( = ?auto_1787702 ?auto_1787707 ) ) ( not ( = ?auto_1787702 ?auto_1787709 ) ) ( not ( = ?auto_1787702 ?auto_1787710 ) ) ( not ( = ?auto_1787702 ?auto_1787711 ) ) ( not ( = ?auto_1787702 ?auto_1787712 ) ) ( not ( = ?auto_1787702 ?auto_1787713 ) ) ( not ( = ?auto_1787702 ?auto_1787714 ) ) ( not ( = ?auto_1787702 ?auto_1787715 ) ) ( not ( = ?auto_1787702 ?auto_1787716 ) ) ( not ( = ?auto_1787702 ?auto_1787717 ) ) ( not ( = ?auto_1787706 ?auto_1787708 ) ) ( not ( = ?auto_1787706 ?auto_1787707 ) ) ( not ( = ?auto_1787706 ?auto_1787709 ) ) ( not ( = ?auto_1787706 ?auto_1787710 ) ) ( not ( = ?auto_1787706 ?auto_1787711 ) ) ( not ( = ?auto_1787706 ?auto_1787712 ) ) ( not ( = ?auto_1787706 ?auto_1787713 ) ) ( not ( = ?auto_1787706 ?auto_1787714 ) ) ( not ( = ?auto_1787706 ?auto_1787715 ) ) ( not ( = ?auto_1787706 ?auto_1787716 ) ) ( not ( = ?auto_1787706 ?auto_1787717 ) ) ( not ( = ?auto_1787708 ?auto_1787707 ) ) ( not ( = ?auto_1787708 ?auto_1787709 ) ) ( not ( = ?auto_1787708 ?auto_1787710 ) ) ( not ( = ?auto_1787708 ?auto_1787711 ) ) ( not ( = ?auto_1787708 ?auto_1787712 ) ) ( not ( = ?auto_1787708 ?auto_1787713 ) ) ( not ( = ?auto_1787708 ?auto_1787714 ) ) ( not ( = ?auto_1787708 ?auto_1787715 ) ) ( not ( = ?auto_1787708 ?auto_1787716 ) ) ( not ( = ?auto_1787708 ?auto_1787717 ) ) ( not ( = ?auto_1787707 ?auto_1787709 ) ) ( not ( = ?auto_1787707 ?auto_1787710 ) ) ( not ( = ?auto_1787707 ?auto_1787711 ) ) ( not ( = ?auto_1787707 ?auto_1787712 ) ) ( not ( = ?auto_1787707 ?auto_1787713 ) ) ( not ( = ?auto_1787707 ?auto_1787714 ) ) ( not ( = ?auto_1787707 ?auto_1787715 ) ) ( not ( = ?auto_1787707 ?auto_1787716 ) ) ( not ( = ?auto_1787707 ?auto_1787717 ) ) ( not ( = ?auto_1787709 ?auto_1787710 ) ) ( not ( = ?auto_1787709 ?auto_1787711 ) ) ( not ( = ?auto_1787709 ?auto_1787712 ) ) ( not ( = ?auto_1787709 ?auto_1787713 ) ) ( not ( = ?auto_1787709 ?auto_1787714 ) ) ( not ( = ?auto_1787709 ?auto_1787715 ) ) ( not ( = ?auto_1787709 ?auto_1787716 ) ) ( not ( = ?auto_1787709 ?auto_1787717 ) ) ( not ( = ?auto_1787710 ?auto_1787711 ) ) ( not ( = ?auto_1787710 ?auto_1787712 ) ) ( not ( = ?auto_1787710 ?auto_1787713 ) ) ( not ( = ?auto_1787710 ?auto_1787714 ) ) ( not ( = ?auto_1787710 ?auto_1787715 ) ) ( not ( = ?auto_1787710 ?auto_1787716 ) ) ( not ( = ?auto_1787710 ?auto_1787717 ) ) ( not ( = ?auto_1787711 ?auto_1787712 ) ) ( not ( = ?auto_1787711 ?auto_1787713 ) ) ( not ( = ?auto_1787711 ?auto_1787714 ) ) ( not ( = ?auto_1787711 ?auto_1787715 ) ) ( not ( = ?auto_1787711 ?auto_1787716 ) ) ( not ( = ?auto_1787711 ?auto_1787717 ) ) ( not ( = ?auto_1787712 ?auto_1787713 ) ) ( not ( = ?auto_1787712 ?auto_1787714 ) ) ( not ( = ?auto_1787712 ?auto_1787715 ) ) ( not ( = ?auto_1787712 ?auto_1787716 ) ) ( not ( = ?auto_1787712 ?auto_1787717 ) ) ( not ( = ?auto_1787713 ?auto_1787714 ) ) ( not ( = ?auto_1787713 ?auto_1787715 ) ) ( not ( = ?auto_1787713 ?auto_1787716 ) ) ( not ( = ?auto_1787713 ?auto_1787717 ) ) ( not ( = ?auto_1787714 ?auto_1787715 ) ) ( not ( = ?auto_1787714 ?auto_1787716 ) ) ( not ( = ?auto_1787714 ?auto_1787717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1787715 ?auto_1787716 ?auto_1787717 )
      ( MAKE-15CRATE-VERIFY ?auto_1787703 ?auto_1787704 ?auto_1787705 ?auto_1787702 ?auto_1787706 ?auto_1787708 ?auto_1787707 ?auto_1787709 ?auto_1787710 ?auto_1787711 ?auto_1787712 ?auto_1787713 ?auto_1787714 ?auto_1787715 ?auto_1787716 ?auto_1787717 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1787898 - SURFACE
      ?auto_1787899 - SURFACE
      ?auto_1787900 - SURFACE
      ?auto_1787897 - SURFACE
      ?auto_1787901 - SURFACE
      ?auto_1787903 - SURFACE
      ?auto_1787902 - SURFACE
      ?auto_1787904 - SURFACE
      ?auto_1787905 - SURFACE
      ?auto_1787906 - SURFACE
      ?auto_1787907 - SURFACE
      ?auto_1787908 - SURFACE
      ?auto_1787909 - SURFACE
      ?auto_1787910 - SURFACE
      ?auto_1787911 - SURFACE
      ?auto_1787912 - SURFACE
    )
    :vars
    (
      ?auto_1787915 - HOIST
      ?auto_1787916 - PLACE
      ?auto_1787913 - TRUCK
      ?auto_1787914 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1787915 ?auto_1787916 ) ( SURFACE-AT ?auto_1787911 ?auto_1787916 ) ( CLEAR ?auto_1787911 ) ( IS-CRATE ?auto_1787912 ) ( not ( = ?auto_1787911 ?auto_1787912 ) ) ( AVAILABLE ?auto_1787915 ) ( IN ?auto_1787912 ?auto_1787913 ) ( ON ?auto_1787911 ?auto_1787910 ) ( not ( = ?auto_1787910 ?auto_1787911 ) ) ( not ( = ?auto_1787910 ?auto_1787912 ) ) ( TRUCK-AT ?auto_1787913 ?auto_1787914 ) ( not ( = ?auto_1787914 ?auto_1787916 ) ) ( ON ?auto_1787899 ?auto_1787898 ) ( ON ?auto_1787900 ?auto_1787899 ) ( ON ?auto_1787897 ?auto_1787900 ) ( ON ?auto_1787901 ?auto_1787897 ) ( ON ?auto_1787903 ?auto_1787901 ) ( ON ?auto_1787902 ?auto_1787903 ) ( ON ?auto_1787904 ?auto_1787902 ) ( ON ?auto_1787905 ?auto_1787904 ) ( ON ?auto_1787906 ?auto_1787905 ) ( ON ?auto_1787907 ?auto_1787906 ) ( ON ?auto_1787908 ?auto_1787907 ) ( ON ?auto_1787909 ?auto_1787908 ) ( ON ?auto_1787910 ?auto_1787909 ) ( not ( = ?auto_1787898 ?auto_1787899 ) ) ( not ( = ?auto_1787898 ?auto_1787900 ) ) ( not ( = ?auto_1787898 ?auto_1787897 ) ) ( not ( = ?auto_1787898 ?auto_1787901 ) ) ( not ( = ?auto_1787898 ?auto_1787903 ) ) ( not ( = ?auto_1787898 ?auto_1787902 ) ) ( not ( = ?auto_1787898 ?auto_1787904 ) ) ( not ( = ?auto_1787898 ?auto_1787905 ) ) ( not ( = ?auto_1787898 ?auto_1787906 ) ) ( not ( = ?auto_1787898 ?auto_1787907 ) ) ( not ( = ?auto_1787898 ?auto_1787908 ) ) ( not ( = ?auto_1787898 ?auto_1787909 ) ) ( not ( = ?auto_1787898 ?auto_1787910 ) ) ( not ( = ?auto_1787898 ?auto_1787911 ) ) ( not ( = ?auto_1787898 ?auto_1787912 ) ) ( not ( = ?auto_1787899 ?auto_1787900 ) ) ( not ( = ?auto_1787899 ?auto_1787897 ) ) ( not ( = ?auto_1787899 ?auto_1787901 ) ) ( not ( = ?auto_1787899 ?auto_1787903 ) ) ( not ( = ?auto_1787899 ?auto_1787902 ) ) ( not ( = ?auto_1787899 ?auto_1787904 ) ) ( not ( = ?auto_1787899 ?auto_1787905 ) ) ( not ( = ?auto_1787899 ?auto_1787906 ) ) ( not ( = ?auto_1787899 ?auto_1787907 ) ) ( not ( = ?auto_1787899 ?auto_1787908 ) ) ( not ( = ?auto_1787899 ?auto_1787909 ) ) ( not ( = ?auto_1787899 ?auto_1787910 ) ) ( not ( = ?auto_1787899 ?auto_1787911 ) ) ( not ( = ?auto_1787899 ?auto_1787912 ) ) ( not ( = ?auto_1787900 ?auto_1787897 ) ) ( not ( = ?auto_1787900 ?auto_1787901 ) ) ( not ( = ?auto_1787900 ?auto_1787903 ) ) ( not ( = ?auto_1787900 ?auto_1787902 ) ) ( not ( = ?auto_1787900 ?auto_1787904 ) ) ( not ( = ?auto_1787900 ?auto_1787905 ) ) ( not ( = ?auto_1787900 ?auto_1787906 ) ) ( not ( = ?auto_1787900 ?auto_1787907 ) ) ( not ( = ?auto_1787900 ?auto_1787908 ) ) ( not ( = ?auto_1787900 ?auto_1787909 ) ) ( not ( = ?auto_1787900 ?auto_1787910 ) ) ( not ( = ?auto_1787900 ?auto_1787911 ) ) ( not ( = ?auto_1787900 ?auto_1787912 ) ) ( not ( = ?auto_1787897 ?auto_1787901 ) ) ( not ( = ?auto_1787897 ?auto_1787903 ) ) ( not ( = ?auto_1787897 ?auto_1787902 ) ) ( not ( = ?auto_1787897 ?auto_1787904 ) ) ( not ( = ?auto_1787897 ?auto_1787905 ) ) ( not ( = ?auto_1787897 ?auto_1787906 ) ) ( not ( = ?auto_1787897 ?auto_1787907 ) ) ( not ( = ?auto_1787897 ?auto_1787908 ) ) ( not ( = ?auto_1787897 ?auto_1787909 ) ) ( not ( = ?auto_1787897 ?auto_1787910 ) ) ( not ( = ?auto_1787897 ?auto_1787911 ) ) ( not ( = ?auto_1787897 ?auto_1787912 ) ) ( not ( = ?auto_1787901 ?auto_1787903 ) ) ( not ( = ?auto_1787901 ?auto_1787902 ) ) ( not ( = ?auto_1787901 ?auto_1787904 ) ) ( not ( = ?auto_1787901 ?auto_1787905 ) ) ( not ( = ?auto_1787901 ?auto_1787906 ) ) ( not ( = ?auto_1787901 ?auto_1787907 ) ) ( not ( = ?auto_1787901 ?auto_1787908 ) ) ( not ( = ?auto_1787901 ?auto_1787909 ) ) ( not ( = ?auto_1787901 ?auto_1787910 ) ) ( not ( = ?auto_1787901 ?auto_1787911 ) ) ( not ( = ?auto_1787901 ?auto_1787912 ) ) ( not ( = ?auto_1787903 ?auto_1787902 ) ) ( not ( = ?auto_1787903 ?auto_1787904 ) ) ( not ( = ?auto_1787903 ?auto_1787905 ) ) ( not ( = ?auto_1787903 ?auto_1787906 ) ) ( not ( = ?auto_1787903 ?auto_1787907 ) ) ( not ( = ?auto_1787903 ?auto_1787908 ) ) ( not ( = ?auto_1787903 ?auto_1787909 ) ) ( not ( = ?auto_1787903 ?auto_1787910 ) ) ( not ( = ?auto_1787903 ?auto_1787911 ) ) ( not ( = ?auto_1787903 ?auto_1787912 ) ) ( not ( = ?auto_1787902 ?auto_1787904 ) ) ( not ( = ?auto_1787902 ?auto_1787905 ) ) ( not ( = ?auto_1787902 ?auto_1787906 ) ) ( not ( = ?auto_1787902 ?auto_1787907 ) ) ( not ( = ?auto_1787902 ?auto_1787908 ) ) ( not ( = ?auto_1787902 ?auto_1787909 ) ) ( not ( = ?auto_1787902 ?auto_1787910 ) ) ( not ( = ?auto_1787902 ?auto_1787911 ) ) ( not ( = ?auto_1787902 ?auto_1787912 ) ) ( not ( = ?auto_1787904 ?auto_1787905 ) ) ( not ( = ?auto_1787904 ?auto_1787906 ) ) ( not ( = ?auto_1787904 ?auto_1787907 ) ) ( not ( = ?auto_1787904 ?auto_1787908 ) ) ( not ( = ?auto_1787904 ?auto_1787909 ) ) ( not ( = ?auto_1787904 ?auto_1787910 ) ) ( not ( = ?auto_1787904 ?auto_1787911 ) ) ( not ( = ?auto_1787904 ?auto_1787912 ) ) ( not ( = ?auto_1787905 ?auto_1787906 ) ) ( not ( = ?auto_1787905 ?auto_1787907 ) ) ( not ( = ?auto_1787905 ?auto_1787908 ) ) ( not ( = ?auto_1787905 ?auto_1787909 ) ) ( not ( = ?auto_1787905 ?auto_1787910 ) ) ( not ( = ?auto_1787905 ?auto_1787911 ) ) ( not ( = ?auto_1787905 ?auto_1787912 ) ) ( not ( = ?auto_1787906 ?auto_1787907 ) ) ( not ( = ?auto_1787906 ?auto_1787908 ) ) ( not ( = ?auto_1787906 ?auto_1787909 ) ) ( not ( = ?auto_1787906 ?auto_1787910 ) ) ( not ( = ?auto_1787906 ?auto_1787911 ) ) ( not ( = ?auto_1787906 ?auto_1787912 ) ) ( not ( = ?auto_1787907 ?auto_1787908 ) ) ( not ( = ?auto_1787907 ?auto_1787909 ) ) ( not ( = ?auto_1787907 ?auto_1787910 ) ) ( not ( = ?auto_1787907 ?auto_1787911 ) ) ( not ( = ?auto_1787907 ?auto_1787912 ) ) ( not ( = ?auto_1787908 ?auto_1787909 ) ) ( not ( = ?auto_1787908 ?auto_1787910 ) ) ( not ( = ?auto_1787908 ?auto_1787911 ) ) ( not ( = ?auto_1787908 ?auto_1787912 ) ) ( not ( = ?auto_1787909 ?auto_1787910 ) ) ( not ( = ?auto_1787909 ?auto_1787911 ) ) ( not ( = ?auto_1787909 ?auto_1787912 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1787910 ?auto_1787911 ?auto_1787912 )
      ( MAKE-15CRATE-VERIFY ?auto_1787898 ?auto_1787899 ?auto_1787900 ?auto_1787897 ?auto_1787901 ?auto_1787903 ?auto_1787902 ?auto_1787904 ?auto_1787905 ?auto_1787906 ?auto_1787907 ?auto_1787908 ?auto_1787909 ?auto_1787910 ?auto_1787911 ?auto_1787912 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1788108 - SURFACE
      ?auto_1788109 - SURFACE
      ?auto_1788110 - SURFACE
      ?auto_1788107 - SURFACE
      ?auto_1788111 - SURFACE
      ?auto_1788113 - SURFACE
      ?auto_1788112 - SURFACE
      ?auto_1788114 - SURFACE
      ?auto_1788115 - SURFACE
      ?auto_1788116 - SURFACE
      ?auto_1788117 - SURFACE
      ?auto_1788118 - SURFACE
      ?auto_1788119 - SURFACE
      ?auto_1788120 - SURFACE
      ?auto_1788121 - SURFACE
      ?auto_1788122 - SURFACE
    )
    :vars
    (
      ?auto_1788123 - HOIST
      ?auto_1788125 - PLACE
      ?auto_1788126 - TRUCK
      ?auto_1788124 - PLACE
      ?auto_1788127 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1788123 ?auto_1788125 ) ( SURFACE-AT ?auto_1788121 ?auto_1788125 ) ( CLEAR ?auto_1788121 ) ( IS-CRATE ?auto_1788122 ) ( not ( = ?auto_1788121 ?auto_1788122 ) ) ( AVAILABLE ?auto_1788123 ) ( ON ?auto_1788121 ?auto_1788120 ) ( not ( = ?auto_1788120 ?auto_1788121 ) ) ( not ( = ?auto_1788120 ?auto_1788122 ) ) ( TRUCK-AT ?auto_1788126 ?auto_1788124 ) ( not ( = ?auto_1788124 ?auto_1788125 ) ) ( HOIST-AT ?auto_1788127 ?auto_1788124 ) ( LIFTING ?auto_1788127 ?auto_1788122 ) ( not ( = ?auto_1788123 ?auto_1788127 ) ) ( ON ?auto_1788109 ?auto_1788108 ) ( ON ?auto_1788110 ?auto_1788109 ) ( ON ?auto_1788107 ?auto_1788110 ) ( ON ?auto_1788111 ?auto_1788107 ) ( ON ?auto_1788113 ?auto_1788111 ) ( ON ?auto_1788112 ?auto_1788113 ) ( ON ?auto_1788114 ?auto_1788112 ) ( ON ?auto_1788115 ?auto_1788114 ) ( ON ?auto_1788116 ?auto_1788115 ) ( ON ?auto_1788117 ?auto_1788116 ) ( ON ?auto_1788118 ?auto_1788117 ) ( ON ?auto_1788119 ?auto_1788118 ) ( ON ?auto_1788120 ?auto_1788119 ) ( not ( = ?auto_1788108 ?auto_1788109 ) ) ( not ( = ?auto_1788108 ?auto_1788110 ) ) ( not ( = ?auto_1788108 ?auto_1788107 ) ) ( not ( = ?auto_1788108 ?auto_1788111 ) ) ( not ( = ?auto_1788108 ?auto_1788113 ) ) ( not ( = ?auto_1788108 ?auto_1788112 ) ) ( not ( = ?auto_1788108 ?auto_1788114 ) ) ( not ( = ?auto_1788108 ?auto_1788115 ) ) ( not ( = ?auto_1788108 ?auto_1788116 ) ) ( not ( = ?auto_1788108 ?auto_1788117 ) ) ( not ( = ?auto_1788108 ?auto_1788118 ) ) ( not ( = ?auto_1788108 ?auto_1788119 ) ) ( not ( = ?auto_1788108 ?auto_1788120 ) ) ( not ( = ?auto_1788108 ?auto_1788121 ) ) ( not ( = ?auto_1788108 ?auto_1788122 ) ) ( not ( = ?auto_1788109 ?auto_1788110 ) ) ( not ( = ?auto_1788109 ?auto_1788107 ) ) ( not ( = ?auto_1788109 ?auto_1788111 ) ) ( not ( = ?auto_1788109 ?auto_1788113 ) ) ( not ( = ?auto_1788109 ?auto_1788112 ) ) ( not ( = ?auto_1788109 ?auto_1788114 ) ) ( not ( = ?auto_1788109 ?auto_1788115 ) ) ( not ( = ?auto_1788109 ?auto_1788116 ) ) ( not ( = ?auto_1788109 ?auto_1788117 ) ) ( not ( = ?auto_1788109 ?auto_1788118 ) ) ( not ( = ?auto_1788109 ?auto_1788119 ) ) ( not ( = ?auto_1788109 ?auto_1788120 ) ) ( not ( = ?auto_1788109 ?auto_1788121 ) ) ( not ( = ?auto_1788109 ?auto_1788122 ) ) ( not ( = ?auto_1788110 ?auto_1788107 ) ) ( not ( = ?auto_1788110 ?auto_1788111 ) ) ( not ( = ?auto_1788110 ?auto_1788113 ) ) ( not ( = ?auto_1788110 ?auto_1788112 ) ) ( not ( = ?auto_1788110 ?auto_1788114 ) ) ( not ( = ?auto_1788110 ?auto_1788115 ) ) ( not ( = ?auto_1788110 ?auto_1788116 ) ) ( not ( = ?auto_1788110 ?auto_1788117 ) ) ( not ( = ?auto_1788110 ?auto_1788118 ) ) ( not ( = ?auto_1788110 ?auto_1788119 ) ) ( not ( = ?auto_1788110 ?auto_1788120 ) ) ( not ( = ?auto_1788110 ?auto_1788121 ) ) ( not ( = ?auto_1788110 ?auto_1788122 ) ) ( not ( = ?auto_1788107 ?auto_1788111 ) ) ( not ( = ?auto_1788107 ?auto_1788113 ) ) ( not ( = ?auto_1788107 ?auto_1788112 ) ) ( not ( = ?auto_1788107 ?auto_1788114 ) ) ( not ( = ?auto_1788107 ?auto_1788115 ) ) ( not ( = ?auto_1788107 ?auto_1788116 ) ) ( not ( = ?auto_1788107 ?auto_1788117 ) ) ( not ( = ?auto_1788107 ?auto_1788118 ) ) ( not ( = ?auto_1788107 ?auto_1788119 ) ) ( not ( = ?auto_1788107 ?auto_1788120 ) ) ( not ( = ?auto_1788107 ?auto_1788121 ) ) ( not ( = ?auto_1788107 ?auto_1788122 ) ) ( not ( = ?auto_1788111 ?auto_1788113 ) ) ( not ( = ?auto_1788111 ?auto_1788112 ) ) ( not ( = ?auto_1788111 ?auto_1788114 ) ) ( not ( = ?auto_1788111 ?auto_1788115 ) ) ( not ( = ?auto_1788111 ?auto_1788116 ) ) ( not ( = ?auto_1788111 ?auto_1788117 ) ) ( not ( = ?auto_1788111 ?auto_1788118 ) ) ( not ( = ?auto_1788111 ?auto_1788119 ) ) ( not ( = ?auto_1788111 ?auto_1788120 ) ) ( not ( = ?auto_1788111 ?auto_1788121 ) ) ( not ( = ?auto_1788111 ?auto_1788122 ) ) ( not ( = ?auto_1788113 ?auto_1788112 ) ) ( not ( = ?auto_1788113 ?auto_1788114 ) ) ( not ( = ?auto_1788113 ?auto_1788115 ) ) ( not ( = ?auto_1788113 ?auto_1788116 ) ) ( not ( = ?auto_1788113 ?auto_1788117 ) ) ( not ( = ?auto_1788113 ?auto_1788118 ) ) ( not ( = ?auto_1788113 ?auto_1788119 ) ) ( not ( = ?auto_1788113 ?auto_1788120 ) ) ( not ( = ?auto_1788113 ?auto_1788121 ) ) ( not ( = ?auto_1788113 ?auto_1788122 ) ) ( not ( = ?auto_1788112 ?auto_1788114 ) ) ( not ( = ?auto_1788112 ?auto_1788115 ) ) ( not ( = ?auto_1788112 ?auto_1788116 ) ) ( not ( = ?auto_1788112 ?auto_1788117 ) ) ( not ( = ?auto_1788112 ?auto_1788118 ) ) ( not ( = ?auto_1788112 ?auto_1788119 ) ) ( not ( = ?auto_1788112 ?auto_1788120 ) ) ( not ( = ?auto_1788112 ?auto_1788121 ) ) ( not ( = ?auto_1788112 ?auto_1788122 ) ) ( not ( = ?auto_1788114 ?auto_1788115 ) ) ( not ( = ?auto_1788114 ?auto_1788116 ) ) ( not ( = ?auto_1788114 ?auto_1788117 ) ) ( not ( = ?auto_1788114 ?auto_1788118 ) ) ( not ( = ?auto_1788114 ?auto_1788119 ) ) ( not ( = ?auto_1788114 ?auto_1788120 ) ) ( not ( = ?auto_1788114 ?auto_1788121 ) ) ( not ( = ?auto_1788114 ?auto_1788122 ) ) ( not ( = ?auto_1788115 ?auto_1788116 ) ) ( not ( = ?auto_1788115 ?auto_1788117 ) ) ( not ( = ?auto_1788115 ?auto_1788118 ) ) ( not ( = ?auto_1788115 ?auto_1788119 ) ) ( not ( = ?auto_1788115 ?auto_1788120 ) ) ( not ( = ?auto_1788115 ?auto_1788121 ) ) ( not ( = ?auto_1788115 ?auto_1788122 ) ) ( not ( = ?auto_1788116 ?auto_1788117 ) ) ( not ( = ?auto_1788116 ?auto_1788118 ) ) ( not ( = ?auto_1788116 ?auto_1788119 ) ) ( not ( = ?auto_1788116 ?auto_1788120 ) ) ( not ( = ?auto_1788116 ?auto_1788121 ) ) ( not ( = ?auto_1788116 ?auto_1788122 ) ) ( not ( = ?auto_1788117 ?auto_1788118 ) ) ( not ( = ?auto_1788117 ?auto_1788119 ) ) ( not ( = ?auto_1788117 ?auto_1788120 ) ) ( not ( = ?auto_1788117 ?auto_1788121 ) ) ( not ( = ?auto_1788117 ?auto_1788122 ) ) ( not ( = ?auto_1788118 ?auto_1788119 ) ) ( not ( = ?auto_1788118 ?auto_1788120 ) ) ( not ( = ?auto_1788118 ?auto_1788121 ) ) ( not ( = ?auto_1788118 ?auto_1788122 ) ) ( not ( = ?auto_1788119 ?auto_1788120 ) ) ( not ( = ?auto_1788119 ?auto_1788121 ) ) ( not ( = ?auto_1788119 ?auto_1788122 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1788120 ?auto_1788121 ?auto_1788122 )
      ( MAKE-15CRATE-VERIFY ?auto_1788108 ?auto_1788109 ?auto_1788110 ?auto_1788107 ?auto_1788111 ?auto_1788113 ?auto_1788112 ?auto_1788114 ?auto_1788115 ?auto_1788116 ?auto_1788117 ?auto_1788118 ?auto_1788119 ?auto_1788120 ?auto_1788121 ?auto_1788122 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1788333 - SURFACE
      ?auto_1788334 - SURFACE
      ?auto_1788335 - SURFACE
      ?auto_1788332 - SURFACE
      ?auto_1788336 - SURFACE
      ?auto_1788338 - SURFACE
      ?auto_1788337 - SURFACE
      ?auto_1788339 - SURFACE
      ?auto_1788340 - SURFACE
      ?auto_1788341 - SURFACE
      ?auto_1788342 - SURFACE
      ?auto_1788343 - SURFACE
      ?auto_1788344 - SURFACE
      ?auto_1788345 - SURFACE
      ?auto_1788346 - SURFACE
      ?auto_1788347 - SURFACE
    )
    :vars
    (
      ?auto_1788352 - HOIST
      ?auto_1788350 - PLACE
      ?auto_1788349 - TRUCK
      ?auto_1788351 - PLACE
      ?auto_1788353 - HOIST
      ?auto_1788348 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1788352 ?auto_1788350 ) ( SURFACE-AT ?auto_1788346 ?auto_1788350 ) ( CLEAR ?auto_1788346 ) ( IS-CRATE ?auto_1788347 ) ( not ( = ?auto_1788346 ?auto_1788347 ) ) ( AVAILABLE ?auto_1788352 ) ( ON ?auto_1788346 ?auto_1788345 ) ( not ( = ?auto_1788345 ?auto_1788346 ) ) ( not ( = ?auto_1788345 ?auto_1788347 ) ) ( TRUCK-AT ?auto_1788349 ?auto_1788351 ) ( not ( = ?auto_1788351 ?auto_1788350 ) ) ( HOIST-AT ?auto_1788353 ?auto_1788351 ) ( not ( = ?auto_1788352 ?auto_1788353 ) ) ( AVAILABLE ?auto_1788353 ) ( SURFACE-AT ?auto_1788347 ?auto_1788351 ) ( ON ?auto_1788347 ?auto_1788348 ) ( CLEAR ?auto_1788347 ) ( not ( = ?auto_1788346 ?auto_1788348 ) ) ( not ( = ?auto_1788347 ?auto_1788348 ) ) ( not ( = ?auto_1788345 ?auto_1788348 ) ) ( ON ?auto_1788334 ?auto_1788333 ) ( ON ?auto_1788335 ?auto_1788334 ) ( ON ?auto_1788332 ?auto_1788335 ) ( ON ?auto_1788336 ?auto_1788332 ) ( ON ?auto_1788338 ?auto_1788336 ) ( ON ?auto_1788337 ?auto_1788338 ) ( ON ?auto_1788339 ?auto_1788337 ) ( ON ?auto_1788340 ?auto_1788339 ) ( ON ?auto_1788341 ?auto_1788340 ) ( ON ?auto_1788342 ?auto_1788341 ) ( ON ?auto_1788343 ?auto_1788342 ) ( ON ?auto_1788344 ?auto_1788343 ) ( ON ?auto_1788345 ?auto_1788344 ) ( not ( = ?auto_1788333 ?auto_1788334 ) ) ( not ( = ?auto_1788333 ?auto_1788335 ) ) ( not ( = ?auto_1788333 ?auto_1788332 ) ) ( not ( = ?auto_1788333 ?auto_1788336 ) ) ( not ( = ?auto_1788333 ?auto_1788338 ) ) ( not ( = ?auto_1788333 ?auto_1788337 ) ) ( not ( = ?auto_1788333 ?auto_1788339 ) ) ( not ( = ?auto_1788333 ?auto_1788340 ) ) ( not ( = ?auto_1788333 ?auto_1788341 ) ) ( not ( = ?auto_1788333 ?auto_1788342 ) ) ( not ( = ?auto_1788333 ?auto_1788343 ) ) ( not ( = ?auto_1788333 ?auto_1788344 ) ) ( not ( = ?auto_1788333 ?auto_1788345 ) ) ( not ( = ?auto_1788333 ?auto_1788346 ) ) ( not ( = ?auto_1788333 ?auto_1788347 ) ) ( not ( = ?auto_1788333 ?auto_1788348 ) ) ( not ( = ?auto_1788334 ?auto_1788335 ) ) ( not ( = ?auto_1788334 ?auto_1788332 ) ) ( not ( = ?auto_1788334 ?auto_1788336 ) ) ( not ( = ?auto_1788334 ?auto_1788338 ) ) ( not ( = ?auto_1788334 ?auto_1788337 ) ) ( not ( = ?auto_1788334 ?auto_1788339 ) ) ( not ( = ?auto_1788334 ?auto_1788340 ) ) ( not ( = ?auto_1788334 ?auto_1788341 ) ) ( not ( = ?auto_1788334 ?auto_1788342 ) ) ( not ( = ?auto_1788334 ?auto_1788343 ) ) ( not ( = ?auto_1788334 ?auto_1788344 ) ) ( not ( = ?auto_1788334 ?auto_1788345 ) ) ( not ( = ?auto_1788334 ?auto_1788346 ) ) ( not ( = ?auto_1788334 ?auto_1788347 ) ) ( not ( = ?auto_1788334 ?auto_1788348 ) ) ( not ( = ?auto_1788335 ?auto_1788332 ) ) ( not ( = ?auto_1788335 ?auto_1788336 ) ) ( not ( = ?auto_1788335 ?auto_1788338 ) ) ( not ( = ?auto_1788335 ?auto_1788337 ) ) ( not ( = ?auto_1788335 ?auto_1788339 ) ) ( not ( = ?auto_1788335 ?auto_1788340 ) ) ( not ( = ?auto_1788335 ?auto_1788341 ) ) ( not ( = ?auto_1788335 ?auto_1788342 ) ) ( not ( = ?auto_1788335 ?auto_1788343 ) ) ( not ( = ?auto_1788335 ?auto_1788344 ) ) ( not ( = ?auto_1788335 ?auto_1788345 ) ) ( not ( = ?auto_1788335 ?auto_1788346 ) ) ( not ( = ?auto_1788335 ?auto_1788347 ) ) ( not ( = ?auto_1788335 ?auto_1788348 ) ) ( not ( = ?auto_1788332 ?auto_1788336 ) ) ( not ( = ?auto_1788332 ?auto_1788338 ) ) ( not ( = ?auto_1788332 ?auto_1788337 ) ) ( not ( = ?auto_1788332 ?auto_1788339 ) ) ( not ( = ?auto_1788332 ?auto_1788340 ) ) ( not ( = ?auto_1788332 ?auto_1788341 ) ) ( not ( = ?auto_1788332 ?auto_1788342 ) ) ( not ( = ?auto_1788332 ?auto_1788343 ) ) ( not ( = ?auto_1788332 ?auto_1788344 ) ) ( not ( = ?auto_1788332 ?auto_1788345 ) ) ( not ( = ?auto_1788332 ?auto_1788346 ) ) ( not ( = ?auto_1788332 ?auto_1788347 ) ) ( not ( = ?auto_1788332 ?auto_1788348 ) ) ( not ( = ?auto_1788336 ?auto_1788338 ) ) ( not ( = ?auto_1788336 ?auto_1788337 ) ) ( not ( = ?auto_1788336 ?auto_1788339 ) ) ( not ( = ?auto_1788336 ?auto_1788340 ) ) ( not ( = ?auto_1788336 ?auto_1788341 ) ) ( not ( = ?auto_1788336 ?auto_1788342 ) ) ( not ( = ?auto_1788336 ?auto_1788343 ) ) ( not ( = ?auto_1788336 ?auto_1788344 ) ) ( not ( = ?auto_1788336 ?auto_1788345 ) ) ( not ( = ?auto_1788336 ?auto_1788346 ) ) ( not ( = ?auto_1788336 ?auto_1788347 ) ) ( not ( = ?auto_1788336 ?auto_1788348 ) ) ( not ( = ?auto_1788338 ?auto_1788337 ) ) ( not ( = ?auto_1788338 ?auto_1788339 ) ) ( not ( = ?auto_1788338 ?auto_1788340 ) ) ( not ( = ?auto_1788338 ?auto_1788341 ) ) ( not ( = ?auto_1788338 ?auto_1788342 ) ) ( not ( = ?auto_1788338 ?auto_1788343 ) ) ( not ( = ?auto_1788338 ?auto_1788344 ) ) ( not ( = ?auto_1788338 ?auto_1788345 ) ) ( not ( = ?auto_1788338 ?auto_1788346 ) ) ( not ( = ?auto_1788338 ?auto_1788347 ) ) ( not ( = ?auto_1788338 ?auto_1788348 ) ) ( not ( = ?auto_1788337 ?auto_1788339 ) ) ( not ( = ?auto_1788337 ?auto_1788340 ) ) ( not ( = ?auto_1788337 ?auto_1788341 ) ) ( not ( = ?auto_1788337 ?auto_1788342 ) ) ( not ( = ?auto_1788337 ?auto_1788343 ) ) ( not ( = ?auto_1788337 ?auto_1788344 ) ) ( not ( = ?auto_1788337 ?auto_1788345 ) ) ( not ( = ?auto_1788337 ?auto_1788346 ) ) ( not ( = ?auto_1788337 ?auto_1788347 ) ) ( not ( = ?auto_1788337 ?auto_1788348 ) ) ( not ( = ?auto_1788339 ?auto_1788340 ) ) ( not ( = ?auto_1788339 ?auto_1788341 ) ) ( not ( = ?auto_1788339 ?auto_1788342 ) ) ( not ( = ?auto_1788339 ?auto_1788343 ) ) ( not ( = ?auto_1788339 ?auto_1788344 ) ) ( not ( = ?auto_1788339 ?auto_1788345 ) ) ( not ( = ?auto_1788339 ?auto_1788346 ) ) ( not ( = ?auto_1788339 ?auto_1788347 ) ) ( not ( = ?auto_1788339 ?auto_1788348 ) ) ( not ( = ?auto_1788340 ?auto_1788341 ) ) ( not ( = ?auto_1788340 ?auto_1788342 ) ) ( not ( = ?auto_1788340 ?auto_1788343 ) ) ( not ( = ?auto_1788340 ?auto_1788344 ) ) ( not ( = ?auto_1788340 ?auto_1788345 ) ) ( not ( = ?auto_1788340 ?auto_1788346 ) ) ( not ( = ?auto_1788340 ?auto_1788347 ) ) ( not ( = ?auto_1788340 ?auto_1788348 ) ) ( not ( = ?auto_1788341 ?auto_1788342 ) ) ( not ( = ?auto_1788341 ?auto_1788343 ) ) ( not ( = ?auto_1788341 ?auto_1788344 ) ) ( not ( = ?auto_1788341 ?auto_1788345 ) ) ( not ( = ?auto_1788341 ?auto_1788346 ) ) ( not ( = ?auto_1788341 ?auto_1788347 ) ) ( not ( = ?auto_1788341 ?auto_1788348 ) ) ( not ( = ?auto_1788342 ?auto_1788343 ) ) ( not ( = ?auto_1788342 ?auto_1788344 ) ) ( not ( = ?auto_1788342 ?auto_1788345 ) ) ( not ( = ?auto_1788342 ?auto_1788346 ) ) ( not ( = ?auto_1788342 ?auto_1788347 ) ) ( not ( = ?auto_1788342 ?auto_1788348 ) ) ( not ( = ?auto_1788343 ?auto_1788344 ) ) ( not ( = ?auto_1788343 ?auto_1788345 ) ) ( not ( = ?auto_1788343 ?auto_1788346 ) ) ( not ( = ?auto_1788343 ?auto_1788347 ) ) ( not ( = ?auto_1788343 ?auto_1788348 ) ) ( not ( = ?auto_1788344 ?auto_1788345 ) ) ( not ( = ?auto_1788344 ?auto_1788346 ) ) ( not ( = ?auto_1788344 ?auto_1788347 ) ) ( not ( = ?auto_1788344 ?auto_1788348 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1788345 ?auto_1788346 ?auto_1788347 )
      ( MAKE-15CRATE-VERIFY ?auto_1788333 ?auto_1788334 ?auto_1788335 ?auto_1788332 ?auto_1788336 ?auto_1788338 ?auto_1788337 ?auto_1788339 ?auto_1788340 ?auto_1788341 ?auto_1788342 ?auto_1788343 ?auto_1788344 ?auto_1788345 ?auto_1788346 ?auto_1788347 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1788559 - SURFACE
      ?auto_1788560 - SURFACE
      ?auto_1788561 - SURFACE
      ?auto_1788558 - SURFACE
      ?auto_1788562 - SURFACE
      ?auto_1788564 - SURFACE
      ?auto_1788563 - SURFACE
      ?auto_1788565 - SURFACE
      ?auto_1788566 - SURFACE
      ?auto_1788567 - SURFACE
      ?auto_1788568 - SURFACE
      ?auto_1788569 - SURFACE
      ?auto_1788570 - SURFACE
      ?auto_1788571 - SURFACE
      ?auto_1788572 - SURFACE
      ?auto_1788573 - SURFACE
    )
    :vars
    (
      ?auto_1788579 - HOIST
      ?auto_1788574 - PLACE
      ?auto_1788576 - PLACE
      ?auto_1788577 - HOIST
      ?auto_1788578 - SURFACE
      ?auto_1788575 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1788579 ?auto_1788574 ) ( SURFACE-AT ?auto_1788572 ?auto_1788574 ) ( CLEAR ?auto_1788572 ) ( IS-CRATE ?auto_1788573 ) ( not ( = ?auto_1788572 ?auto_1788573 ) ) ( AVAILABLE ?auto_1788579 ) ( ON ?auto_1788572 ?auto_1788571 ) ( not ( = ?auto_1788571 ?auto_1788572 ) ) ( not ( = ?auto_1788571 ?auto_1788573 ) ) ( not ( = ?auto_1788576 ?auto_1788574 ) ) ( HOIST-AT ?auto_1788577 ?auto_1788576 ) ( not ( = ?auto_1788579 ?auto_1788577 ) ) ( AVAILABLE ?auto_1788577 ) ( SURFACE-AT ?auto_1788573 ?auto_1788576 ) ( ON ?auto_1788573 ?auto_1788578 ) ( CLEAR ?auto_1788573 ) ( not ( = ?auto_1788572 ?auto_1788578 ) ) ( not ( = ?auto_1788573 ?auto_1788578 ) ) ( not ( = ?auto_1788571 ?auto_1788578 ) ) ( TRUCK-AT ?auto_1788575 ?auto_1788574 ) ( ON ?auto_1788560 ?auto_1788559 ) ( ON ?auto_1788561 ?auto_1788560 ) ( ON ?auto_1788558 ?auto_1788561 ) ( ON ?auto_1788562 ?auto_1788558 ) ( ON ?auto_1788564 ?auto_1788562 ) ( ON ?auto_1788563 ?auto_1788564 ) ( ON ?auto_1788565 ?auto_1788563 ) ( ON ?auto_1788566 ?auto_1788565 ) ( ON ?auto_1788567 ?auto_1788566 ) ( ON ?auto_1788568 ?auto_1788567 ) ( ON ?auto_1788569 ?auto_1788568 ) ( ON ?auto_1788570 ?auto_1788569 ) ( ON ?auto_1788571 ?auto_1788570 ) ( not ( = ?auto_1788559 ?auto_1788560 ) ) ( not ( = ?auto_1788559 ?auto_1788561 ) ) ( not ( = ?auto_1788559 ?auto_1788558 ) ) ( not ( = ?auto_1788559 ?auto_1788562 ) ) ( not ( = ?auto_1788559 ?auto_1788564 ) ) ( not ( = ?auto_1788559 ?auto_1788563 ) ) ( not ( = ?auto_1788559 ?auto_1788565 ) ) ( not ( = ?auto_1788559 ?auto_1788566 ) ) ( not ( = ?auto_1788559 ?auto_1788567 ) ) ( not ( = ?auto_1788559 ?auto_1788568 ) ) ( not ( = ?auto_1788559 ?auto_1788569 ) ) ( not ( = ?auto_1788559 ?auto_1788570 ) ) ( not ( = ?auto_1788559 ?auto_1788571 ) ) ( not ( = ?auto_1788559 ?auto_1788572 ) ) ( not ( = ?auto_1788559 ?auto_1788573 ) ) ( not ( = ?auto_1788559 ?auto_1788578 ) ) ( not ( = ?auto_1788560 ?auto_1788561 ) ) ( not ( = ?auto_1788560 ?auto_1788558 ) ) ( not ( = ?auto_1788560 ?auto_1788562 ) ) ( not ( = ?auto_1788560 ?auto_1788564 ) ) ( not ( = ?auto_1788560 ?auto_1788563 ) ) ( not ( = ?auto_1788560 ?auto_1788565 ) ) ( not ( = ?auto_1788560 ?auto_1788566 ) ) ( not ( = ?auto_1788560 ?auto_1788567 ) ) ( not ( = ?auto_1788560 ?auto_1788568 ) ) ( not ( = ?auto_1788560 ?auto_1788569 ) ) ( not ( = ?auto_1788560 ?auto_1788570 ) ) ( not ( = ?auto_1788560 ?auto_1788571 ) ) ( not ( = ?auto_1788560 ?auto_1788572 ) ) ( not ( = ?auto_1788560 ?auto_1788573 ) ) ( not ( = ?auto_1788560 ?auto_1788578 ) ) ( not ( = ?auto_1788561 ?auto_1788558 ) ) ( not ( = ?auto_1788561 ?auto_1788562 ) ) ( not ( = ?auto_1788561 ?auto_1788564 ) ) ( not ( = ?auto_1788561 ?auto_1788563 ) ) ( not ( = ?auto_1788561 ?auto_1788565 ) ) ( not ( = ?auto_1788561 ?auto_1788566 ) ) ( not ( = ?auto_1788561 ?auto_1788567 ) ) ( not ( = ?auto_1788561 ?auto_1788568 ) ) ( not ( = ?auto_1788561 ?auto_1788569 ) ) ( not ( = ?auto_1788561 ?auto_1788570 ) ) ( not ( = ?auto_1788561 ?auto_1788571 ) ) ( not ( = ?auto_1788561 ?auto_1788572 ) ) ( not ( = ?auto_1788561 ?auto_1788573 ) ) ( not ( = ?auto_1788561 ?auto_1788578 ) ) ( not ( = ?auto_1788558 ?auto_1788562 ) ) ( not ( = ?auto_1788558 ?auto_1788564 ) ) ( not ( = ?auto_1788558 ?auto_1788563 ) ) ( not ( = ?auto_1788558 ?auto_1788565 ) ) ( not ( = ?auto_1788558 ?auto_1788566 ) ) ( not ( = ?auto_1788558 ?auto_1788567 ) ) ( not ( = ?auto_1788558 ?auto_1788568 ) ) ( not ( = ?auto_1788558 ?auto_1788569 ) ) ( not ( = ?auto_1788558 ?auto_1788570 ) ) ( not ( = ?auto_1788558 ?auto_1788571 ) ) ( not ( = ?auto_1788558 ?auto_1788572 ) ) ( not ( = ?auto_1788558 ?auto_1788573 ) ) ( not ( = ?auto_1788558 ?auto_1788578 ) ) ( not ( = ?auto_1788562 ?auto_1788564 ) ) ( not ( = ?auto_1788562 ?auto_1788563 ) ) ( not ( = ?auto_1788562 ?auto_1788565 ) ) ( not ( = ?auto_1788562 ?auto_1788566 ) ) ( not ( = ?auto_1788562 ?auto_1788567 ) ) ( not ( = ?auto_1788562 ?auto_1788568 ) ) ( not ( = ?auto_1788562 ?auto_1788569 ) ) ( not ( = ?auto_1788562 ?auto_1788570 ) ) ( not ( = ?auto_1788562 ?auto_1788571 ) ) ( not ( = ?auto_1788562 ?auto_1788572 ) ) ( not ( = ?auto_1788562 ?auto_1788573 ) ) ( not ( = ?auto_1788562 ?auto_1788578 ) ) ( not ( = ?auto_1788564 ?auto_1788563 ) ) ( not ( = ?auto_1788564 ?auto_1788565 ) ) ( not ( = ?auto_1788564 ?auto_1788566 ) ) ( not ( = ?auto_1788564 ?auto_1788567 ) ) ( not ( = ?auto_1788564 ?auto_1788568 ) ) ( not ( = ?auto_1788564 ?auto_1788569 ) ) ( not ( = ?auto_1788564 ?auto_1788570 ) ) ( not ( = ?auto_1788564 ?auto_1788571 ) ) ( not ( = ?auto_1788564 ?auto_1788572 ) ) ( not ( = ?auto_1788564 ?auto_1788573 ) ) ( not ( = ?auto_1788564 ?auto_1788578 ) ) ( not ( = ?auto_1788563 ?auto_1788565 ) ) ( not ( = ?auto_1788563 ?auto_1788566 ) ) ( not ( = ?auto_1788563 ?auto_1788567 ) ) ( not ( = ?auto_1788563 ?auto_1788568 ) ) ( not ( = ?auto_1788563 ?auto_1788569 ) ) ( not ( = ?auto_1788563 ?auto_1788570 ) ) ( not ( = ?auto_1788563 ?auto_1788571 ) ) ( not ( = ?auto_1788563 ?auto_1788572 ) ) ( not ( = ?auto_1788563 ?auto_1788573 ) ) ( not ( = ?auto_1788563 ?auto_1788578 ) ) ( not ( = ?auto_1788565 ?auto_1788566 ) ) ( not ( = ?auto_1788565 ?auto_1788567 ) ) ( not ( = ?auto_1788565 ?auto_1788568 ) ) ( not ( = ?auto_1788565 ?auto_1788569 ) ) ( not ( = ?auto_1788565 ?auto_1788570 ) ) ( not ( = ?auto_1788565 ?auto_1788571 ) ) ( not ( = ?auto_1788565 ?auto_1788572 ) ) ( not ( = ?auto_1788565 ?auto_1788573 ) ) ( not ( = ?auto_1788565 ?auto_1788578 ) ) ( not ( = ?auto_1788566 ?auto_1788567 ) ) ( not ( = ?auto_1788566 ?auto_1788568 ) ) ( not ( = ?auto_1788566 ?auto_1788569 ) ) ( not ( = ?auto_1788566 ?auto_1788570 ) ) ( not ( = ?auto_1788566 ?auto_1788571 ) ) ( not ( = ?auto_1788566 ?auto_1788572 ) ) ( not ( = ?auto_1788566 ?auto_1788573 ) ) ( not ( = ?auto_1788566 ?auto_1788578 ) ) ( not ( = ?auto_1788567 ?auto_1788568 ) ) ( not ( = ?auto_1788567 ?auto_1788569 ) ) ( not ( = ?auto_1788567 ?auto_1788570 ) ) ( not ( = ?auto_1788567 ?auto_1788571 ) ) ( not ( = ?auto_1788567 ?auto_1788572 ) ) ( not ( = ?auto_1788567 ?auto_1788573 ) ) ( not ( = ?auto_1788567 ?auto_1788578 ) ) ( not ( = ?auto_1788568 ?auto_1788569 ) ) ( not ( = ?auto_1788568 ?auto_1788570 ) ) ( not ( = ?auto_1788568 ?auto_1788571 ) ) ( not ( = ?auto_1788568 ?auto_1788572 ) ) ( not ( = ?auto_1788568 ?auto_1788573 ) ) ( not ( = ?auto_1788568 ?auto_1788578 ) ) ( not ( = ?auto_1788569 ?auto_1788570 ) ) ( not ( = ?auto_1788569 ?auto_1788571 ) ) ( not ( = ?auto_1788569 ?auto_1788572 ) ) ( not ( = ?auto_1788569 ?auto_1788573 ) ) ( not ( = ?auto_1788569 ?auto_1788578 ) ) ( not ( = ?auto_1788570 ?auto_1788571 ) ) ( not ( = ?auto_1788570 ?auto_1788572 ) ) ( not ( = ?auto_1788570 ?auto_1788573 ) ) ( not ( = ?auto_1788570 ?auto_1788578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1788571 ?auto_1788572 ?auto_1788573 )
      ( MAKE-15CRATE-VERIFY ?auto_1788559 ?auto_1788560 ?auto_1788561 ?auto_1788558 ?auto_1788562 ?auto_1788564 ?auto_1788563 ?auto_1788565 ?auto_1788566 ?auto_1788567 ?auto_1788568 ?auto_1788569 ?auto_1788570 ?auto_1788571 ?auto_1788572 ?auto_1788573 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1788785 - SURFACE
      ?auto_1788786 - SURFACE
      ?auto_1788787 - SURFACE
      ?auto_1788784 - SURFACE
      ?auto_1788788 - SURFACE
      ?auto_1788790 - SURFACE
      ?auto_1788789 - SURFACE
      ?auto_1788791 - SURFACE
      ?auto_1788792 - SURFACE
      ?auto_1788793 - SURFACE
      ?auto_1788794 - SURFACE
      ?auto_1788795 - SURFACE
      ?auto_1788796 - SURFACE
      ?auto_1788797 - SURFACE
      ?auto_1788798 - SURFACE
      ?auto_1788799 - SURFACE
    )
    :vars
    (
      ?auto_1788805 - HOIST
      ?auto_1788803 - PLACE
      ?auto_1788800 - PLACE
      ?auto_1788801 - HOIST
      ?auto_1788802 - SURFACE
      ?auto_1788804 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1788805 ?auto_1788803 ) ( IS-CRATE ?auto_1788799 ) ( not ( = ?auto_1788798 ?auto_1788799 ) ) ( not ( = ?auto_1788797 ?auto_1788798 ) ) ( not ( = ?auto_1788797 ?auto_1788799 ) ) ( not ( = ?auto_1788800 ?auto_1788803 ) ) ( HOIST-AT ?auto_1788801 ?auto_1788800 ) ( not ( = ?auto_1788805 ?auto_1788801 ) ) ( AVAILABLE ?auto_1788801 ) ( SURFACE-AT ?auto_1788799 ?auto_1788800 ) ( ON ?auto_1788799 ?auto_1788802 ) ( CLEAR ?auto_1788799 ) ( not ( = ?auto_1788798 ?auto_1788802 ) ) ( not ( = ?auto_1788799 ?auto_1788802 ) ) ( not ( = ?auto_1788797 ?auto_1788802 ) ) ( TRUCK-AT ?auto_1788804 ?auto_1788803 ) ( SURFACE-AT ?auto_1788797 ?auto_1788803 ) ( CLEAR ?auto_1788797 ) ( LIFTING ?auto_1788805 ?auto_1788798 ) ( IS-CRATE ?auto_1788798 ) ( ON ?auto_1788786 ?auto_1788785 ) ( ON ?auto_1788787 ?auto_1788786 ) ( ON ?auto_1788784 ?auto_1788787 ) ( ON ?auto_1788788 ?auto_1788784 ) ( ON ?auto_1788790 ?auto_1788788 ) ( ON ?auto_1788789 ?auto_1788790 ) ( ON ?auto_1788791 ?auto_1788789 ) ( ON ?auto_1788792 ?auto_1788791 ) ( ON ?auto_1788793 ?auto_1788792 ) ( ON ?auto_1788794 ?auto_1788793 ) ( ON ?auto_1788795 ?auto_1788794 ) ( ON ?auto_1788796 ?auto_1788795 ) ( ON ?auto_1788797 ?auto_1788796 ) ( not ( = ?auto_1788785 ?auto_1788786 ) ) ( not ( = ?auto_1788785 ?auto_1788787 ) ) ( not ( = ?auto_1788785 ?auto_1788784 ) ) ( not ( = ?auto_1788785 ?auto_1788788 ) ) ( not ( = ?auto_1788785 ?auto_1788790 ) ) ( not ( = ?auto_1788785 ?auto_1788789 ) ) ( not ( = ?auto_1788785 ?auto_1788791 ) ) ( not ( = ?auto_1788785 ?auto_1788792 ) ) ( not ( = ?auto_1788785 ?auto_1788793 ) ) ( not ( = ?auto_1788785 ?auto_1788794 ) ) ( not ( = ?auto_1788785 ?auto_1788795 ) ) ( not ( = ?auto_1788785 ?auto_1788796 ) ) ( not ( = ?auto_1788785 ?auto_1788797 ) ) ( not ( = ?auto_1788785 ?auto_1788798 ) ) ( not ( = ?auto_1788785 ?auto_1788799 ) ) ( not ( = ?auto_1788785 ?auto_1788802 ) ) ( not ( = ?auto_1788786 ?auto_1788787 ) ) ( not ( = ?auto_1788786 ?auto_1788784 ) ) ( not ( = ?auto_1788786 ?auto_1788788 ) ) ( not ( = ?auto_1788786 ?auto_1788790 ) ) ( not ( = ?auto_1788786 ?auto_1788789 ) ) ( not ( = ?auto_1788786 ?auto_1788791 ) ) ( not ( = ?auto_1788786 ?auto_1788792 ) ) ( not ( = ?auto_1788786 ?auto_1788793 ) ) ( not ( = ?auto_1788786 ?auto_1788794 ) ) ( not ( = ?auto_1788786 ?auto_1788795 ) ) ( not ( = ?auto_1788786 ?auto_1788796 ) ) ( not ( = ?auto_1788786 ?auto_1788797 ) ) ( not ( = ?auto_1788786 ?auto_1788798 ) ) ( not ( = ?auto_1788786 ?auto_1788799 ) ) ( not ( = ?auto_1788786 ?auto_1788802 ) ) ( not ( = ?auto_1788787 ?auto_1788784 ) ) ( not ( = ?auto_1788787 ?auto_1788788 ) ) ( not ( = ?auto_1788787 ?auto_1788790 ) ) ( not ( = ?auto_1788787 ?auto_1788789 ) ) ( not ( = ?auto_1788787 ?auto_1788791 ) ) ( not ( = ?auto_1788787 ?auto_1788792 ) ) ( not ( = ?auto_1788787 ?auto_1788793 ) ) ( not ( = ?auto_1788787 ?auto_1788794 ) ) ( not ( = ?auto_1788787 ?auto_1788795 ) ) ( not ( = ?auto_1788787 ?auto_1788796 ) ) ( not ( = ?auto_1788787 ?auto_1788797 ) ) ( not ( = ?auto_1788787 ?auto_1788798 ) ) ( not ( = ?auto_1788787 ?auto_1788799 ) ) ( not ( = ?auto_1788787 ?auto_1788802 ) ) ( not ( = ?auto_1788784 ?auto_1788788 ) ) ( not ( = ?auto_1788784 ?auto_1788790 ) ) ( not ( = ?auto_1788784 ?auto_1788789 ) ) ( not ( = ?auto_1788784 ?auto_1788791 ) ) ( not ( = ?auto_1788784 ?auto_1788792 ) ) ( not ( = ?auto_1788784 ?auto_1788793 ) ) ( not ( = ?auto_1788784 ?auto_1788794 ) ) ( not ( = ?auto_1788784 ?auto_1788795 ) ) ( not ( = ?auto_1788784 ?auto_1788796 ) ) ( not ( = ?auto_1788784 ?auto_1788797 ) ) ( not ( = ?auto_1788784 ?auto_1788798 ) ) ( not ( = ?auto_1788784 ?auto_1788799 ) ) ( not ( = ?auto_1788784 ?auto_1788802 ) ) ( not ( = ?auto_1788788 ?auto_1788790 ) ) ( not ( = ?auto_1788788 ?auto_1788789 ) ) ( not ( = ?auto_1788788 ?auto_1788791 ) ) ( not ( = ?auto_1788788 ?auto_1788792 ) ) ( not ( = ?auto_1788788 ?auto_1788793 ) ) ( not ( = ?auto_1788788 ?auto_1788794 ) ) ( not ( = ?auto_1788788 ?auto_1788795 ) ) ( not ( = ?auto_1788788 ?auto_1788796 ) ) ( not ( = ?auto_1788788 ?auto_1788797 ) ) ( not ( = ?auto_1788788 ?auto_1788798 ) ) ( not ( = ?auto_1788788 ?auto_1788799 ) ) ( not ( = ?auto_1788788 ?auto_1788802 ) ) ( not ( = ?auto_1788790 ?auto_1788789 ) ) ( not ( = ?auto_1788790 ?auto_1788791 ) ) ( not ( = ?auto_1788790 ?auto_1788792 ) ) ( not ( = ?auto_1788790 ?auto_1788793 ) ) ( not ( = ?auto_1788790 ?auto_1788794 ) ) ( not ( = ?auto_1788790 ?auto_1788795 ) ) ( not ( = ?auto_1788790 ?auto_1788796 ) ) ( not ( = ?auto_1788790 ?auto_1788797 ) ) ( not ( = ?auto_1788790 ?auto_1788798 ) ) ( not ( = ?auto_1788790 ?auto_1788799 ) ) ( not ( = ?auto_1788790 ?auto_1788802 ) ) ( not ( = ?auto_1788789 ?auto_1788791 ) ) ( not ( = ?auto_1788789 ?auto_1788792 ) ) ( not ( = ?auto_1788789 ?auto_1788793 ) ) ( not ( = ?auto_1788789 ?auto_1788794 ) ) ( not ( = ?auto_1788789 ?auto_1788795 ) ) ( not ( = ?auto_1788789 ?auto_1788796 ) ) ( not ( = ?auto_1788789 ?auto_1788797 ) ) ( not ( = ?auto_1788789 ?auto_1788798 ) ) ( not ( = ?auto_1788789 ?auto_1788799 ) ) ( not ( = ?auto_1788789 ?auto_1788802 ) ) ( not ( = ?auto_1788791 ?auto_1788792 ) ) ( not ( = ?auto_1788791 ?auto_1788793 ) ) ( not ( = ?auto_1788791 ?auto_1788794 ) ) ( not ( = ?auto_1788791 ?auto_1788795 ) ) ( not ( = ?auto_1788791 ?auto_1788796 ) ) ( not ( = ?auto_1788791 ?auto_1788797 ) ) ( not ( = ?auto_1788791 ?auto_1788798 ) ) ( not ( = ?auto_1788791 ?auto_1788799 ) ) ( not ( = ?auto_1788791 ?auto_1788802 ) ) ( not ( = ?auto_1788792 ?auto_1788793 ) ) ( not ( = ?auto_1788792 ?auto_1788794 ) ) ( not ( = ?auto_1788792 ?auto_1788795 ) ) ( not ( = ?auto_1788792 ?auto_1788796 ) ) ( not ( = ?auto_1788792 ?auto_1788797 ) ) ( not ( = ?auto_1788792 ?auto_1788798 ) ) ( not ( = ?auto_1788792 ?auto_1788799 ) ) ( not ( = ?auto_1788792 ?auto_1788802 ) ) ( not ( = ?auto_1788793 ?auto_1788794 ) ) ( not ( = ?auto_1788793 ?auto_1788795 ) ) ( not ( = ?auto_1788793 ?auto_1788796 ) ) ( not ( = ?auto_1788793 ?auto_1788797 ) ) ( not ( = ?auto_1788793 ?auto_1788798 ) ) ( not ( = ?auto_1788793 ?auto_1788799 ) ) ( not ( = ?auto_1788793 ?auto_1788802 ) ) ( not ( = ?auto_1788794 ?auto_1788795 ) ) ( not ( = ?auto_1788794 ?auto_1788796 ) ) ( not ( = ?auto_1788794 ?auto_1788797 ) ) ( not ( = ?auto_1788794 ?auto_1788798 ) ) ( not ( = ?auto_1788794 ?auto_1788799 ) ) ( not ( = ?auto_1788794 ?auto_1788802 ) ) ( not ( = ?auto_1788795 ?auto_1788796 ) ) ( not ( = ?auto_1788795 ?auto_1788797 ) ) ( not ( = ?auto_1788795 ?auto_1788798 ) ) ( not ( = ?auto_1788795 ?auto_1788799 ) ) ( not ( = ?auto_1788795 ?auto_1788802 ) ) ( not ( = ?auto_1788796 ?auto_1788797 ) ) ( not ( = ?auto_1788796 ?auto_1788798 ) ) ( not ( = ?auto_1788796 ?auto_1788799 ) ) ( not ( = ?auto_1788796 ?auto_1788802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1788797 ?auto_1788798 ?auto_1788799 )
      ( MAKE-15CRATE-VERIFY ?auto_1788785 ?auto_1788786 ?auto_1788787 ?auto_1788784 ?auto_1788788 ?auto_1788790 ?auto_1788789 ?auto_1788791 ?auto_1788792 ?auto_1788793 ?auto_1788794 ?auto_1788795 ?auto_1788796 ?auto_1788797 ?auto_1788798 ?auto_1788799 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1789011 - SURFACE
      ?auto_1789012 - SURFACE
      ?auto_1789013 - SURFACE
      ?auto_1789010 - SURFACE
      ?auto_1789014 - SURFACE
      ?auto_1789016 - SURFACE
      ?auto_1789015 - SURFACE
      ?auto_1789017 - SURFACE
      ?auto_1789018 - SURFACE
      ?auto_1789019 - SURFACE
      ?auto_1789020 - SURFACE
      ?auto_1789021 - SURFACE
      ?auto_1789022 - SURFACE
      ?auto_1789023 - SURFACE
      ?auto_1789024 - SURFACE
      ?auto_1789025 - SURFACE
    )
    :vars
    (
      ?auto_1789030 - HOIST
      ?auto_1789027 - PLACE
      ?auto_1789029 - PLACE
      ?auto_1789028 - HOIST
      ?auto_1789031 - SURFACE
      ?auto_1789026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1789030 ?auto_1789027 ) ( IS-CRATE ?auto_1789025 ) ( not ( = ?auto_1789024 ?auto_1789025 ) ) ( not ( = ?auto_1789023 ?auto_1789024 ) ) ( not ( = ?auto_1789023 ?auto_1789025 ) ) ( not ( = ?auto_1789029 ?auto_1789027 ) ) ( HOIST-AT ?auto_1789028 ?auto_1789029 ) ( not ( = ?auto_1789030 ?auto_1789028 ) ) ( AVAILABLE ?auto_1789028 ) ( SURFACE-AT ?auto_1789025 ?auto_1789029 ) ( ON ?auto_1789025 ?auto_1789031 ) ( CLEAR ?auto_1789025 ) ( not ( = ?auto_1789024 ?auto_1789031 ) ) ( not ( = ?auto_1789025 ?auto_1789031 ) ) ( not ( = ?auto_1789023 ?auto_1789031 ) ) ( TRUCK-AT ?auto_1789026 ?auto_1789027 ) ( SURFACE-AT ?auto_1789023 ?auto_1789027 ) ( CLEAR ?auto_1789023 ) ( IS-CRATE ?auto_1789024 ) ( AVAILABLE ?auto_1789030 ) ( IN ?auto_1789024 ?auto_1789026 ) ( ON ?auto_1789012 ?auto_1789011 ) ( ON ?auto_1789013 ?auto_1789012 ) ( ON ?auto_1789010 ?auto_1789013 ) ( ON ?auto_1789014 ?auto_1789010 ) ( ON ?auto_1789016 ?auto_1789014 ) ( ON ?auto_1789015 ?auto_1789016 ) ( ON ?auto_1789017 ?auto_1789015 ) ( ON ?auto_1789018 ?auto_1789017 ) ( ON ?auto_1789019 ?auto_1789018 ) ( ON ?auto_1789020 ?auto_1789019 ) ( ON ?auto_1789021 ?auto_1789020 ) ( ON ?auto_1789022 ?auto_1789021 ) ( ON ?auto_1789023 ?auto_1789022 ) ( not ( = ?auto_1789011 ?auto_1789012 ) ) ( not ( = ?auto_1789011 ?auto_1789013 ) ) ( not ( = ?auto_1789011 ?auto_1789010 ) ) ( not ( = ?auto_1789011 ?auto_1789014 ) ) ( not ( = ?auto_1789011 ?auto_1789016 ) ) ( not ( = ?auto_1789011 ?auto_1789015 ) ) ( not ( = ?auto_1789011 ?auto_1789017 ) ) ( not ( = ?auto_1789011 ?auto_1789018 ) ) ( not ( = ?auto_1789011 ?auto_1789019 ) ) ( not ( = ?auto_1789011 ?auto_1789020 ) ) ( not ( = ?auto_1789011 ?auto_1789021 ) ) ( not ( = ?auto_1789011 ?auto_1789022 ) ) ( not ( = ?auto_1789011 ?auto_1789023 ) ) ( not ( = ?auto_1789011 ?auto_1789024 ) ) ( not ( = ?auto_1789011 ?auto_1789025 ) ) ( not ( = ?auto_1789011 ?auto_1789031 ) ) ( not ( = ?auto_1789012 ?auto_1789013 ) ) ( not ( = ?auto_1789012 ?auto_1789010 ) ) ( not ( = ?auto_1789012 ?auto_1789014 ) ) ( not ( = ?auto_1789012 ?auto_1789016 ) ) ( not ( = ?auto_1789012 ?auto_1789015 ) ) ( not ( = ?auto_1789012 ?auto_1789017 ) ) ( not ( = ?auto_1789012 ?auto_1789018 ) ) ( not ( = ?auto_1789012 ?auto_1789019 ) ) ( not ( = ?auto_1789012 ?auto_1789020 ) ) ( not ( = ?auto_1789012 ?auto_1789021 ) ) ( not ( = ?auto_1789012 ?auto_1789022 ) ) ( not ( = ?auto_1789012 ?auto_1789023 ) ) ( not ( = ?auto_1789012 ?auto_1789024 ) ) ( not ( = ?auto_1789012 ?auto_1789025 ) ) ( not ( = ?auto_1789012 ?auto_1789031 ) ) ( not ( = ?auto_1789013 ?auto_1789010 ) ) ( not ( = ?auto_1789013 ?auto_1789014 ) ) ( not ( = ?auto_1789013 ?auto_1789016 ) ) ( not ( = ?auto_1789013 ?auto_1789015 ) ) ( not ( = ?auto_1789013 ?auto_1789017 ) ) ( not ( = ?auto_1789013 ?auto_1789018 ) ) ( not ( = ?auto_1789013 ?auto_1789019 ) ) ( not ( = ?auto_1789013 ?auto_1789020 ) ) ( not ( = ?auto_1789013 ?auto_1789021 ) ) ( not ( = ?auto_1789013 ?auto_1789022 ) ) ( not ( = ?auto_1789013 ?auto_1789023 ) ) ( not ( = ?auto_1789013 ?auto_1789024 ) ) ( not ( = ?auto_1789013 ?auto_1789025 ) ) ( not ( = ?auto_1789013 ?auto_1789031 ) ) ( not ( = ?auto_1789010 ?auto_1789014 ) ) ( not ( = ?auto_1789010 ?auto_1789016 ) ) ( not ( = ?auto_1789010 ?auto_1789015 ) ) ( not ( = ?auto_1789010 ?auto_1789017 ) ) ( not ( = ?auto_1789010 ?auto_1789018 ) ) ( not ( = ?auto_1789010 ?auto_1789019 ) ) ( not ( = ?auto_1789010 ?auto_1789020 ) ) ( not ( = ?auto_1789010 ?auto_1789021 ) ) ( not ( = ?auto_1789010 ?auto_1789022 ) ) ( not ( = ?auto_1789010 ?auto_1789023 ) ) ( not ( = ?auto_1789010 ?auto_1789024 ) ) ( not ( = ?auto_1789010 ?auto_1789025 ) ) ( not ( = ?auto_1789010 ?auto_1789031 ) ) ( not ( = ?auto_1789014 ?auto_1789016 ) ) ( not ( = ?auto_1789014 ?auto_1789015 ) ) ( not ( = ?auto_1789014 ?auto_1789017 ) ) ( not ( = ?auto_1789014 ?auto_1789018 ) ) ( not ( = ?auto_1789014 ?auto_1789019 ) ) ( not ( = ?auto_1789014 ?auto_1789020 ) ) ( not ( = ?auto_1789014 ?auto_1789021 ) ) ( not ( = ?auto_1789014 ?auto_1789022 ) ) ( not ( = ?auto_1789014 ?auto_1789023 ) ) ( not ( = ?auto_1789014 ?auto_1789024 ) ) ( not ( = ?auto_1789014 ?auto_1789025 ) ) ( not ( = ?auto_1789014 ?auto_1789031 ) ) ( not ( = ?auto_1789016 ?auto_1789015 ) ) ( not ( = ?auto_1789016 ?auto_1789017 ) ) ( not ( = ?auto_1789016 ?auto_1789018 ) ) ( not ( = ?auto_1789016 ?auto_1789019 ) ) ( not ( = ?auto_1789016 ?auto_1789020 ) ) ( not ( = ?auto_1789016 ?auto_1789021 ) ) ( not ( = ?auto_1789016 ?auto_1789022 ) ) ( not ( = ?auto_1789016 ?auto_1789023 ) ) ( not ( = ?auto_1789016 ?auto_1789024 ) ) ( not ( = ?auto_1789016 ?auto_1789025 ) ) ( not ( = ?auto_1789016 ?auto_1789031 ) ) ( not ( = ?auto_1789015 ?auto_1789017 ) ) ( not ( = ?auto_1789015 ?auto_1789018 ) ) ( not ( = ?auto_1789015 ?auto_1789019 ) ) ( not ( = ?auto_1789015 ?auto_1789020 ) ) ( not ( = ?auto_1789015 ?auto_1789021 ) ) ( not ( = ?auto_1789015 ?auto_1789022 ) ) ( not ( = ?auto_1789015 ?auto_1789023 ) ) ( not ( = ?auto_1789015 ?auto_1789024 ) ) ( not ( = ?auto_1789015 ?auto_1789025 ) ) ( not ( = ?auto_1789015 ?auto_1789031 ) ) ( not ( = ?auto_1789017 ?auto_1789018 ) ) ( not ( = ?auto_1789017 ?auto_1789019 ) ) ( not ( = ?auto_1789017 ?auto_1789020 ) ) ( not ( = ?auto_1789017 ?auto_1789021 ) ) ( not ( = ?auto_1789017 ?auto_1789022 ) ) ( not ( = ?auto_1789017 ?auto_1789023 ) ) ( not ( = ?auto_1789017 ?auto_1789024 ) ) ( not ( = ?auto_1789017 ?auto_1789025 ) ) ( not ( = ?auto_1789017 ?auto_1789031 ) ) ( not ( = ?auto_1789018 ?auto_1789019 ) ) ( not ( = ?auto_1789018 ?auto_1789020 ) ) ( not ( = ?auto_1789018 ?auto_1789021 ) ) ( not ( = ?auto_1789018 ?auto_1789022 ) ) ( not ( = ?auto_1789018 ?auto_1789023 ) ) ( not ( = ?auto_1789018 ?auto_1789024 ) ) ( not ( = ?auto_1789018 ?auto_1789025 ) ) ( not ( = ?auto_1789018 ?auto_1789031 ) ) ( not ( = ?auto_1789019 ?auto_1789020 ) ) ( not ( = ?auto_1789019 ?auto_1789021 ) ) ( not ( = ?auto_1789019 ?auto_1789022 ) ) ( not ( = ?auto_1789019 ?auto_1789023 ) ) ( not ( = ?auto_1789019 ?auto_1789024 ) ) ( not ( = ?auto_1789019 ?auto_1789025 ) ) ( not ( = ?auto_1789019 ?auto_1789031 ) ) ( not ( = ?auto_1789020 ?auto_1789021 ) ) ( not ( = ?auto_1789020 ?auto_1789022 ) ) ( not ( = ?auto_1789020 ?auto_1789023 ) ) ( not ( = ?auto_1789020 ?auto_1789024 ) ) ( not ( = ?auto_1789020 ?auto_1789025 ) ) ( not ( = ?auto_1789020 ?auto_1789031 ) ) ( not ( = ?auto_1789021 ?auto_1789022 ) ) ( not ( = ?auto_1789021 ?auto_1789023 ) ) ( not ( = ?auto_1789021 ?auto_1789024 ) ) ( not ( = ?auto_1789021 ?auto_1789025 ) ) ( not ( = ?auto_1789021 ?auto_1789031 ) ) ( not ( = ?auto_1789022 ?auto_1789023 ) ) ( not ( = ?auto_1789022 ?auto_1789024 ) ) ( not ( = ?auto_1789022 ?auto_1789025 ) ) ( not ( = ?auto_1789022 ?auto_1789031 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1789023 ?auto_1789024 ?auto_1789025 )
      ( MAKE-15CRATE-VERIFY ?auto_1789011 ?auto_1789012 ?auto_1789013 ?auto_1789010 ?auto_1789014 ?auto_1789016 ?auto_1789015 ?auto_1789017 ?auto_1789018 ?auto_1789019 ?auto_1789020 ?auto_1789021 ?auto_1789022 ?auto_1789023 ?auto_1789024 ?auto_1789025 ) )
  )

)

