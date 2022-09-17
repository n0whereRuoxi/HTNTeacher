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
      ?auto_1108907 - SURFACE
      ?auto_1108908 - SURFACE
    )
    :vars
    (
      ?auto_1108909 - HOIST
      ?auto_1108910 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108909 ?auto_1108910 ) ( SURFACE-AT ?auto_1108907 ?auto_1108910 ) ( CLEAR ?auto_1108907 ) ( LIFTING ?auto_1108909 ?auto_1108908 ) ( IS-CRATE ?auto_1108908 ) ( not ( = ?auto_1108907 ?auto_1108908 ) ) )
    :subtasks
    ( ( !DROP ?auto_1108909 ?auto_1108908 ?auto_1108907 ?auto_1108910 )
      ( MAKE-1CRATE-VERIFY ?auto_1108907 ?auto_1108908 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108911 - SURFACE
      ?auto_1108912 - SURFACE
    )
    :vars
    (
      ?auto_1108913 - HOIST
      ?auto_1108914 - PLACE
      ?auto_1108915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108913 ?auto_1108914 ) ( SURFACE-AT ?auto_1108911 ?auto_1108914 ) ( CLEAR ?auto_1108911 ) ( IS-CRATE ?auto_1108912 ) ( not ( = ?auto_1108911 ?auto_1108912 ) ) ( TRUCK-AT ?auto_1108915 ?auto_1108914 ) ( AVAILABLE ?auto_1108913 ) ( IN ?auto_1108912 ?auto_1108915 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1108913 ?auto_1108912 ?auto_1108915 ?auto_1108914 )
      ( MAKE-1CRATE ?auto_1108911 ?auto_1108912 )
      ( MAKE-1CRATE-VERIFY ?auto_1108911 ?auto_1108912 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108916 - SURFACE
      ?auto_1108917 - SURFACE
    )
    :vars
    (
      ?auto_1108920 - HOIST
      ?auto_1108919 - PLACE
      ?auto_1108918 - TRUCK
      ?auto_1108921 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108920 ?auto_1108919 ) ( SURFACE-AT ?auto_1108916 ?auto_1108919 ) ( CLEAR ?auto_1108916 ) ( IS-CRATE ?auto_1108917 ) ( not ( = ?auto_1108916 ?auto_1108917 ) ) ( AVAILABLE ?auto_1108920 ) ( IN ?auto_1108917 ?auto_1108918 ) ( TRUCK-AT ?auto_1108918 ?auto_1108921 ) ( not ( = ?auto_1108921 ?auto_1108919 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1108918 ?auto_1108921 ?auto_1108919 )
      ( MAKE-1CRATE ?auto_1108916 ?auto_1108917 )
      ( MAKE-1CRATE-VERIFY ?auto_1108916 ?auto_1108917 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108922 - SURFACE
      ?auto_1108923 - SURFACE
    )
    :vars
    (
      ?auto_1108926 - HOIST
      ?auto_1108924 - PLACE
      ?auto_1108925 - TRUCK
      ?auto_1108927 - PLACE
      ?auto_1108928 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108926 ?auto_1108924 ) ( SURFACE-AT ?auto_1108922 ?auto_1108924 ) ( CLEAR ?auto_1108922 ) ( IS-CRATE ?auto_1108923 ) ( not ( = ?auto_1108922 ?auto_1108923 ) ) ( AVAILABLE ?auto_1108926 ) ( TRUCK-AT ?auto_1108925 ?auto_1108927 ) ( not ( = ?auto_1108927 ?auto_1108924 ) ) ( HOIST-AT ?auto_1108928 ?auto_1108927 ) ( LIFTING ?auto_1108928 ?auto_1108923 ) ( not ( = ?auto_1108926 ?auto_1108928 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1108928 ?auto_1108923 ?auto_1108925 ?auto_1108927 )
      ( MAKE-1CRATE ?auto_1108922 ?auto_1108923 )
      ( MAKE-1CRATE-VERIFY ?auto_1108922 ?auto_1108923 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108929 - SURFACE
      ?auto_1108930 - SURFACE
    )
    :vars
    (
      ?auto_1108931 - HOIST
      ?auto_1108932 - PLACE
      ?auto_1108934 - TRUCK
      ?auto_1108935 - PLACE
      ?auto_1108933 - HOIST
      ?auto_1108936 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108931 ?auto_1108932 ) ( SURFACE-AT ?auto_1108929 ?auto_1108932 ) ( CLEAR ?auto_1108929 ) ( IS-CRATE ?auto_1108930 ) ( not ( = ?auto_1108929 ?auto_1108930 ) ) ( AVAILABLE ?auto_1108931 ) ( TRUCK-AT ?auto_1108934 ?auto_1108935 ) ( not ( = ?auto_1108935 ?auto_1108932 ) ) ( HOIST-AT ?auto_1108933 ?auto_1108935 ) ( not ( = ?auto_1108931 ?auto_1108933 ) ) ( AVAILABLE ?auto_1108933 ) ( SURFACE-AT ?auto_1108930 ?auto_1108935 ) ( ON ?auto_1108930 ?auto_1108936 ) ( CLEAR ?auto_1108930 ) ( not ( = ?auto_1108929 ?auto_1108936 ) ) ( not ( = ?auto_1108930 ?auto_1108936 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1108933 ?auto_1108930 ?auto_1108936 ?auto_1108935 )
      ( MAKE-1CRATE ?auto_1108929 ?auto_1108930 )
      ( MAKE-1CRATE-VERIFY ?auto_1108929 ?auto_1108930 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108937 - SURFACE
      ?auto_1108938 - SURFACE
    )
    :vars
    (
      ?auto_1108944 - HOIST
      ?auto_1108941 - PLACE
      ?auto_1108943 - PLACE
      ?auto_1108940 - HOIST
      ?auto_1108942 - SURFACE
      ?auto_1108939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108944 ?auto_1108941 ) ( SURFACE-AT ?auto_1108937 ?auto_1108941 ) ( CLEAR ?auto_1108937 ) ( IS-CRATE ?auto_1108938 ) ( not ( = ?auto_1108937 ?auto_1108938 ) ) ( AVAILABLE ?auto_1108944 ) ( not ( = ?auto_1108943 ?auto_1108941 ) ) ( HOIST-AT ?auto_1108940 ?auto_1108943 ) ( not ( = ?auto_1108944 ?auto_1108940 ) ) ( AVAILABLE ?auto_1108940 ) ( SURFACE-AT ?auto_1108938 ?auto_1108943 ) ( ON ?auto_1108938 ?auto_1108942 ) ( CLEAR ?auto_1108938 ) ( not ( = ?auto_1108937 ?auto_1108942 ) ) ( not ( = ?auto_1108938 ?auto_1108942 ) ) ( TRUCK-AT ?auto_1108939 ?auto_1108941 ) )
    :subtasks
    ( ( !DRIVE ?auto_1108939 ?auto_1108941 ?auto_1108943 )
      ( MAKE-1CRATE ?auto_1108937 ?auto_1108938 )
      ( MAKE-1CRATE-VERIFY ?auto_1108937 ?auto_1108938 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1108954 - SURFACE
      ?auto_1108955 - SURFACE
      ?auto_1108956 - SURFACE
    )
    :vars
    (
      ?auto_1108957 - HOIST
      ?auto_1108958 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108957 ?auto_1108958 ) ( SURFACE-AT ?auto_1108955 ?auto_1108958 ) ( CLEAR ?auto_1108955 ) ( LIFTING ?auto_1108957 ?auto_1108956 ) ( IS-CRATE ?auto_1108956 ) ( not ( = ?auto_1108955 ?auto_1108956 ) ) ( ON ?auto_1108955 ?auto_1108954 ) ( not ( = ?auto_1108954 ?auto_1108955 ) ) ( not ( = ?auto_1108954 ?auto_1108956 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108955 ?auto_1108956 )
      ( MAKE-2CRATE-VERIFY ?auto_1108954 ?auto_1108955 ?auto_1108956 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1108964 - SURFACE
      ?auto_1108965 - SURFACE
      ?auto_1108966 - SURFACE
    )
    :vars
    (
      ?auto_1108967 - HOIST
      ?auto_1108969 - PLACE
      ?auto_1108968 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108967 ?auto_1108969 ) ( SURFACE-AT ?auto_1108965 ?auto_1108969 ) ( CLEAR ?auto_1108965 ) ( IS-CRATE ?auto_1108966 ) ( not ( = ?auto_1108965 ?auto_1108966 ) ) ( TRUCK-AT ?auto_1108968 ?auto_1108969 ) ( AVAILABLE ?auto_1108967 ) ( IN ?auto_1108966 ?auto_1108968 ) ( ON ?auto_1108965 ?auto_1108964 ) ( not ( = ?auto_1108964 ?auto_1108965 ) ) ( not ( = ?auto_1108964 ?auto_1108966 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108965 ?auto_1108966 )
      ( MAKE-2CRATE-VERIFY ?auto_1108964 ?auto_1108965 ?auto_1108966 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108970 - SURFACE
      ?auto_1108971 - SURFACE
    )
    :vars
    (
      ?auto_1108975 - HOIST
      ?auto_1108972 - PLACE
      ?auto_1108973 - TRUCK
      ?auto_1108974 - SURFACE
      ?auto_1108976 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108975 ?auto_1108972 ) ( SURFACE-AT ?auto_1108970 ?auto_1108972 ) ( CLEAR ?auto_1108970 ) ( IS-CRATE ?auto_1108971 ) ( not ( = ?auto_1108970 ?auto_1108971 ) ) ( AVAILABLE ?auto_1108975 ) ( IN ?auto_1108971 ?auto_1108973 ) ( ON ?auto_1108970 ?auto_1108974 ) ( not ( = ?auto_1108974 ?auto_1108970 ) ) ( not ( = ?auto_1108974 ?auto_1108971 ) ) ( TRUCK-AT ?auto_1108973 ?auto_1108976 ) ( not ( = ?auto_1108976 ?auto_1108972 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1108973 ?auto_1108976 ?auto_1108972 )
      ( MAKE-2CRATE ?auto_1108974 ?auto_1108970 ?auto_1108971 )
      ( MAKE-1CRATE-VERIFY ?auto_1108970 ?auto_1108971 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1108977 - SURFACE
      ?auto_1108978 - SURFACE
      ?auto_1108979 - SURFACE
    )
    :vars
    (
      ?auto_1108981 - HOIST
      ?auto_1108982 - PLACE
      ?auto_1108980 - TRUCK
      ?auto_1108983 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108981 ?auto_1108982 ) ( SURFACE-AT ?auto_1108978 ?auto_1108982 ) ( CLEAR ?auto_1108978 ) ( IS-CRATE ?auto_1108979 ) ( not ( = ?auto_1108978 ?auto_1108979 ) ) ( AVAILABLE ?auto_1108981 ) ( IN ?auto_1108979 ?auto_1108980 ) ( ON ?auto_1108978 ?auto_1108977 ) ( not ( = ?auto_1108977 ?auto_1108978 ) ) ( not ( = ?auto_1108977 ?auto_1108979 ) ) ( TRUCK-AT ?auto_1108980 ?auto_1108983 ) ( not ( = ?auto_1108983 ?auto_1108982 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108978 ?auto_1108979 )
      ( MAKE-2CRATE-VERIFY ?auto_1108977 ?auto_1108978 ?auto_1108979 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108984 - SURFACE
      ?auto_1108985 - SURFACE
    )
    :vars
    (
      ?auto_1108988 - HOIST
      ?auto_1108989 - PLACE
      ?auto_1108987 - SURFACE
      ?auto_1108990 - TRUCK
      ?auto_1108986 - PLACE
      ?auto_1108991 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108988 ?auto_1108989 ) ( SURFACE-AT ?auto_1108984 ?auto_1108989 ) ( CLEAR ?auto_1108984 ) ( IS-CRATE ?auto_1108985 ) ( not ( = ?auto_1108984 ?auto_1108985 ) ) ( AVAILABLE ?auto_1108988 ) ( ON ?auto_1108984 ?auto_1108987 ) ( not ( = ?auto_1108987 ?auto_1108984 ) ) ( not ( = ?auto_1108987 ?auto_1108985 ) ) ( TRUCK-AT ?auto_1108990 ?auto_1108986 ) ( not ( = ?auto_1108986 ?auto_1108989 ) ) ( HOIST-AT ?auto_1108991 ?auto_1108986 ) ( LIFTING ?auto_1108991 ?auto_1108985 ) ( not ( = ?auto_1108988 ?auto_1108991 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1108991 ?auto_1108985 ?auto_1108990 ?auto_1108986 )
      ( MAKE-2CRATE ?auto_1108987 ?auto_1108984 ?auto_1108985 )
      ( MAKE-1CRATE-VERIFY ?auto_1108984 ?auto_1108985 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1108992 - SURFACE
      ?auto_1108993 - SURFACE
      ?auto_1108994 - SURFACE
    )
    :vars
    (
      ?auto_1108996 - HOIST
      ?auto_1108999 - PLACE
      ?auto_1108995 - TRUCK
      ?auto_1108998 - PLACE
      ?auto_1108997 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108996 ?auto_1108999 ) ( SURFACE-AT ?auto_1108993 ?auto_1108999 ) ( CLEAR ?auto_1108993 ) ( IS-CRATE ?auto_1108994 ) ( not ( = ?auto_1108993 ?auto_1108994 ) ) ( AVAILABLE ?auto_1108996 ) ( ON ?auto_1108993 ?auto_1108992 ) ( not ( = ?auto_1108992 ?auto_1108993 ) ) ( not ( = ?auto_1108992 ?auto_1108994 ) ) ( TRUCK-AT ?auto_1108995 ?auto_1108998 ) ( not ( = ?auto_1108998 ?auto_1108999 ) ) ( HOIST-AT ?auto_1108997 ?auto_1108998 ) ( LIFTING ?auto_1108997 ?auto_1108994 ) ( not ( = ?auto_1108996 ?auto_1108997 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1108993 ?auto_1108994 )
      ( MAKE-2CRATE-VERIFY ?auto_1108992 ?auto_1108993 ?auto_1108994 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1109000 - SURFACE
      ?auto_1109001 - SURFACE
    )
    :vars
    (
      ?auto_1109002 - HOIST
      ?auto_1109006 - PLACE
      ?auto_1109005 - SURFACE
      ?auto_1109004 - TRUCK
      ?auto_1109003 - PLACE
      ?auto_1109007 - HOIST
      ?auto_1109008 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109002 ?auto_1109006 ) ( SURFACE-AT ?auto_1109000 ?auto_1109006 ) ( CLEAR ?auto_1109000 ) ( IS-CRATE ?auto_1109001 ) ( not ( = ?auto_1109000 ?auto_1109001 ) ) ( AVAILABLE ?auto_1109002 ) ( ON ?auto_1109000 ?auto_1109005 ) ( not ( = ?auto_1109005 ?auto_1109000 ) ) ( not ( = ?auto_1109005 ?auto_1109001 ) ) ( TRUCK-AT ?auto_1109004 ?auto_1109003 ) ( not ( = ?auto_1109003 ?auto_1109006 ) ) ( HOIST-AT ?auto_1109007 ?auto_1109003 ) ( not ( = ?auto_1109002 ?auto_1109007 ) ) ( AVAILABLE ?auto_1109007 ) ( SURFACE-AT ?auto_1109001 ?auto_1109003 ) ( ON ?auto_1109001 ?auto_1109008 ) ( CLEAR ?auto_1109001 ) ( not ( = ?auto_1109000 ?auto_1109008 ) ) ( not ( = ?auto_1109001 ?auto_1109008 ) ) ( not ( = ?auto_1109005 ?auto_1109008 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1109007 ?auto_1109001 ?auto_1109008 ?auto_1109003 )
      ( MAKE-2CRATE ?auto_1109005 ?auto_1109000 ?auto_1109001 )
      ( MAKE-1CRATE-VERIFY ?auto_1109000 ?auto_1109001 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1109009 - SURFACE
      ?auto_1109010 - SURFACE
      ?auto_1109011 - SURFACE
    )
    :vars
    (
      ?auto_1109013 - HOIST
      ?auto_1109015 - PLACE
      ?auto_1109012 - TRUCK
      ?auto_1109016 - PLACE
      ?auto_1109014 - HOIST
      ?auto_1109017 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109013 ?auto_1109015 ) ( SURFACE-AT ?auto_1109010 ?auto_1109015 ) ( CLEAR ?auto_1109010 ) ( IS-CRATE ?auto_1109011 ) ( not ( = ?auto_1109010 ?auto_1109011 ) ) ( AVAILABLE ?auto_1109013 ) ( ON ?auto_1109010 ?auto_1109009 ) ( not ( = ?auto_1109009 ?auto_1109010 ) ) ( not ( = ?auto_1109009 ?auto_1109011 ) ) ( TRUCK-AT ?auto_1109012 ?auto_1109016 ) ( not ( = ?auto_1109016 ?auto_1109015 ) ) ( HOIST-AT ?auto_1109014 ?auto_1109016 ) ( not ( = ?auto_1109013 ?auto_1109014 ) ) ( AVAILABLE ?auto_1109014 ) ( SURFACE-AT ?auto_1109011 ?auto_1109016 ) ( ON ?auto_1109011 ?auto_1109017 ) ( CLEAR ?auto_1109011 ) ( not ( = ?auto_1109010 ?auto_1109017 ) ) ( not ( = ?auto_1109011 ?auto_1109017 ) ) ( not ( = ?auto_1109009 ?auto_1109017 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1109010 ?auto_1109011 )
      ( MAKE-2CRATE-VERIFY ?auto_1109009 ?auto_1109010 ?auto_1109011 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1109018 - SURFACE
      ?auto_1109019 - SURFACE
    )
    :vars
    (
      ?auto_1109023 - HOIST
      ?auto_1109024 - PLACE
      ?auto_1109021 - SURFACE
      ?auto_1109020 - PLACE
      ?auto_1109025 - HOIST
      ?auto_1109022 - SURFACE
      ?auto_1109026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109023 ?auto_1109024 ) ( SURFACE-AT ?auto_1109018 ?auto_1109024 ) ( CLEAR ?auto_1109018 ) ( IS-CRATE ?auto_1109019 ) ( not ( = ?auto_1109018 ?auto_1109019 ) ) ( AVAILABLE ?auto_1109023 ) ( ON ?auto_1109018 ?auto_1109021 ) ( not ( = ?auto_1109021 ?auto_1109018 ) ) ( not ( = ?auto_1109021 ?auto_1109019 ) ) ( not ( = ?auto_1109020 ?auto_1109024 ) ) ( HOIST-AT ?auto_1109025 ?auto_1109020 ) ( not ( = ?auto_1109023 ?auto_1109025 ) ) ( AVAILABLE ?auto_1109025 ) ( SURFACE-AT ?auto_1109019 ?auto_1109020 ) ( ON ?auto_1109019 ?auto_1109022 ) ( CLEAR ?auto_1109019 ) ( not ( = ?auto_1109018 ?auto_1109022 ) ) ( not ( = ?auto_1109019 ?auto_1109022 ) ) ( not ( = ?auto_1109021 ?auto_1109022 ) ) ( TRUCK-AT ?auto_1109026 ?auto_1109024 ) )
    :subtasks
    ( ( !DRIVE ?auto_1109026 ?auto_1109024 ?auto_1109020 )
      ( MAKE-2CRATE ?auto_1109021 ?auto_1109018 ?auto_1109019 )
      ( MAKE-1CRATE-VERIFY ?auto_1109018 ?auto_1109019 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1109027 - SURFACE
      ?auto_1109028 - SURFACE
      ?auto_1109029 - SURFACE
    )
    :vars
    (
      ?auto_1109033 - HOIST
      ?auto_1109034 - PLACE
      ?auto_1109035 - PLACE
      ?auto_1109031 - HOIST
      ?auto_1109030 - SURFACE
      ?auto_1109032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109033 ?auto_1109034 ) ( SURFACE-AT ?auto_1109028 ?auto_1109034 ) ( CLEAR ?auto_1109028 ) ( IS-CRATE ?auto_1109029 ) ( not ( = ?auto_1109028 ?auto_1109029 ) ) ( AVAILABLE ?auto_1109033 ) ( ON ?auto_1109028 ?auto_1109027 ) ( not ( = ?auto_1109027 ?auto_1109028 ) ) ( not ( = ?auto_1109027 ?auto_1109029 ) ) ( not ( = ?auto_1109035 ?auto_1109034 ) ) ( HOIST-AT ?auto_1109031 ?auto_1109035 ) ( not ( = ?auto_1109033 ?auto_1109031 ) ) ( AVAILABLE ?auto_1109031 ) ( SURFACE-AT ?auto_1109029 ?auto_1109035 ) ( ON ?auto_1109029 ?auto_1109030 ) ( CLEAR ?auto_1109029 ) ( not ( = ?auto_1109028 ?auto_1109030 ) ) ( not ( = ?auto_1109029 ?auto_1109030 ) ) ( not ( = ?auto_1109027 ?auto_1109030 ) ) ( TRUCK-AT ?auto_1109032 ?auto_1109034 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1109028 ?auto_1109029 )
      ( MAKE-2CRATE-VERIFY ?auto_1109027 ?auto_1109028 ?auto_1109029 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1109036 - SURFACE
      ?auto_1109037 - SURFACE
    )
    :vars
    (
      ?auto_1109044 - HOIST
      ?auto_1109043 - PLACE
      ?auto_1109039 - SURFACE
      ?auto_1109040 - PLACE
      ?auto_1109042 - HOIST
      ?auto_1109041 - SURFACE
      ?auto_1109038 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109044 ?auto_1109043 ) ( IS-CRATE ?auto_1109037 ) ( not ( = ?auto_1109036 ?auto_1109037 ) ) ( not ( = ?auto_1109039 ?auto_1109036 ) ) ( not ( = ?auto_1109039 ?auto_1109037 ) ) ( not ( = ?auto_1109040 ?auto_1109043 ) ) ( HOIST-AT ?auto_1109042 ?auto_1109040 ) ( not ( = ?auto_1109044 ?auto_1109042 ) ) ( AVAILABLE ?auto_1109042 ) ( SURFACE-AT ?auto_1109037 ?auto_1109040 ) ( ON ?auto_1109037 ?auto_1109041 ) ( CLEAR ?auto_1109037 ) ( not ( = ?auto_1109036 ?auto_1109041 ) ) ( not ( = ?auto_1109037 ?auto_1109041 ) ) ( not ( = ?auto_1109039 ?auto_1109041 ) ) ( TRUCK-AT ?auto_1109038 ?auto_1109043 ) ( SURFACE-AT ?auto_1109039 ?auto_1109043 ) ( CLEAR ?auto_1109039 ) ( LIFTING ?auto_1109044 ?auto_1109036 ) ( IS-CRATE ?auto_1109036 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1109039 ?auto_1109036 )
      ( MAKE-2CRATE ?auto_1109039 ?auto_1109036 ?auto_1109037 )
      ( MAKE-1CRATE-VERIFY ?auto_1109036 ?auto_1109037 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1109045 - SURFACE
      ?auto_1109046 - SURFACE
      ?auto_1109047 - SURFACE
    )
    :vars
    (
      ?auto_1109048 - HOIST
      ?auto_1109052 - PLACE
      ?auto_1109049 - PLACE
      ?auto_1109050 - HOIST
      ?auto_1109051 - SURFACE
      ?auto_1109053 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109048 ?auto_1109052 ) ( IS-CRATE ?auto_1109047 ) ( not ( = ?auto_1109046 ?auto_1109047 ) ) ( not ( = ?auto_1109045 ?auto_1109046 ) ) ( not ( = ?auto_1109045 ?auto_1109047 ) ) ( not ( = ?auto_1109049 ?auto_1109052 ) ) ( HOIST-AT ?auto_1109050 ?auto_1109049 ) ( not ( = ?auto_1109048 ?auto_1109050 ) ) ( AVAILABLE ?auto_1109050 ) ( SURFACE-AT ?auto_1109047 ?auto_1109049 ) ( ON ?auto_1109047 ?auto_1109051 ) ( CLEAR ?auto_1109047 ) ( not ( = ?auto_1109046 ?auto_1109051 ) ) ( not ( = ?auto_1109047 ?auto_1109051 ) ) ( not ( = ?auto_1109045 ?auto_1109051 ) ) ( TRUCK-AT ?auto_1109053 ?auto_1109052 ) ( SURFACE-AT ?auto_1109045 ?auto_1109052 ) ( CLEAR ?auto_1109045 ) ( LIFTING ?auto_1109048 ?auto_1109046 ) ( IS-CRATE ?auto_1109046 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1109046 ?auto_1109047 )
      ( MAKE-2CRATE-VERIFY ?auto_1109045 ?auto_1109046 ?auto_1109047 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1109054 - SURFACE
      ?auto_1109055 - SURFACE
    )
    :vars
    (
      ?auto_1109062 - HOIST
      ?auto_1109059 - PLACE
      ?auto_1109056 - SURFACE
      ?auto_1109061 - PLACE
      ?auto_1109060 - HOIST
      ?auto_1109058 - SURFACE
      ?auto_1109057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109062 ?auto_1109059 ) ( IS-CRATE ?auto_1109055 ) ( not ( = ?auto_1109054 ?auto_1109055 ) ) ( not ( = ?auto_1109056 ?auto_1109054 ) ) ( not ( = ?auto_1109056 ?auto_1109055 ) ) ( not ( = ?auto_1109061 ?auto_1109059 ) ) ( HOIST-AT ?auto_1109060 ?auto_1109061 ) ( not ( = ?auto_1109062 ?auto_1109060 ) ) ( AVAILABLE ?auto_1109060 ) ( SURFACE-AT ?auto_1109055 ?auto_1109061 ) ( ON ?auto_1109055 ?auto_1109058 ) ( CLEAR ?auto_1109055 ) ( not ( = ?auto_1109054 ?auto_1109058 ) ) ( not ( = ?auto_1109055 ?auto_1109058 ) ) ( not ( = ?auto_1109056 ?auto_1109058 ) ) ( TRUCK-AT ?auto_1109057 ?auto_1109059 ) ( SURFACE-AT ?auto_1109056 ?auto_1109059 ) ( CLEAR ?auto_1109056 ) ( IS-CRATE ?auto_1109054 ) ( AVAILABLE ?auto_1109062 ) ( IN ?auto_1109054 ?auto_1109057 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1109062 ?auto_1109054 ?auto_1109057 ?auto_1109059 )
      ( MAKE-2CRATE ?auto_1109056 ?auto_1109054 ?auto_1109055 )
      ( MAKE-1CRATE-VERIFY ?auto_1109054 ?auto_1109055 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1109063 - SURFACE
      ?auto_1109064 - SURFACE
      ?auto_1109065 - SURFACE
    )
    :vars
    (
      ?auto_1109067 - HOIST
      ?auto_1109066 - PLACE
      ?auto_1109070 - PLACE
      ?auto_1109068 - HOIST
      ?auto_1109071 - SURFACE
      ?auto_1109069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109067 ?auto_1109066 ) ( IS-CRATE ?auto_1109065 ) ( not ( = ?auto_1109064 ?auto_1109065 ) ) ( not ( = ?auto_1109063 ?auto_1109064 ) ) ( not ( = ?auto_1109063 ?auto_1109065 ) ) ( not ( = ?auto_1109070 ?auto_1109066 ) ) ( HOIST-AT ?auto_1109068 ?auto_1109070 ) ( not ( = ?auto_1109067 ?auto_1109068 ) ) ( AVAILABLE ?auto_1109068 ) ( SURFACE-AT ?auto_1109065 ?auto_1109070 ) ( ON ?auto_1109065 ?auto_1109071 ) ( CLEAR ?auto_1109065 ) ( not ( = ?auto_1109064 ?auto_1109071 ) ) ( not ( = ?auto_1109065 ?auto_1109071 ) ) ( not ( = ?auto_1109063 ?auto_1109071 ) ) ( TRUCK-AT ?auto_1109069 ?auto_1109066 ) ( SURFACE-AT ?auto_1109063 ?auto_1109066 ) ( CLEAR ?auto_1109063 ) ( IS-CRATE ?auto_1109064 ) ( AVAILABLE ?auto_1109067 ) ( IN ?auto_1109064 ?auto_1109069 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1109064 ?auto_1109065 )
      ( MAKE-2CRATE-VERIFY ?auto_1109063 ?auto_1109064 ?auto_1109065 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1109108 - SURFACE
      ?auto_1109109 - SURFACE
    )
    :vars
    (
      ?auto_1109111 - HOIST
      ?auto_1109113 - PLACE
      ?auto_1109116 - SURFACE
      ?auto_1109115 - PLACE
      ?auto_1109110 - HOIST
      ?auto_1109114 - SURFACE
      ?auto_1109112 - TRUCK
      ?auto_1109117 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109111 ?auto_1109113 ) ( SURFACE-AT ?auto_1109108 ?auto_1109113 ) ( CLEAR ?auto_1109108 ) ( IS-CRATE ?auto_1109109 ) ( not ( = ?auto_1109108 ?auto_1109109 ) ) ( AVAILABLE ?auto_1109111 ) ( ON ?auto_1109108 ?auto_1109116 ) ( not ( = ?auto_1109116 ?auto_1109108 ) ) ( not ( = ?auto_1109116 ?auto_1109109 ) ) ( not ( = ?auto_1109115 ?auto_1109113 ) ) ( HOIST-AT ?auto_1109110 ?auto_1109115 ) ( not ( = ?auto_1109111 ?auto_1109110 ) ) ( AVAILABLE ?auto_1109110 ) ( SURFACE-AT ?auto_1109109 ?auto_1109115 ) ( ON ?auto_1109109 ?auto_1109114 ) ( CLEAR ?auto_1109109 ) ( not ( = ?auto_1109108 ?auto_1109114 ) ) ( not ( = ?auto_1109109 ?auto_1109114 ) ) ( not ( = ?auto_1109116 ?auto_1109114 ) ) ( TRUCK-AT ?auto_1109112 ?auto_1109117 ) ( not ( = ?auto_1109117 ?auto_1109113 ) ) ( not ( = ?auto_1109115 ?auto_1109117 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1109112 ?auto_1109117 ?auto_1109113 )
      ( MAKE-1CRATE ?auto_1109108 ?auto_1109109 )
      ( MAKE-1CRATE-VERIFY ?auto_1109108 ?auto_1109109 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1109148 - SURFACE
      ?auto_1109149 - SURFACE
      ?auto_1109150 - SURFACE
      ?auto_1109147 - SURFACE
    )
    :vars
    (
      ?auto_1109152 - HOIST
      ?auto_1109151 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109152 ?auto_1109151 ) ( SURFACE-AT ?auto_1109150 ?auto_1109151 ) ( CLEAR ?auto_1109150 ) ( LIFTING ?auto_1109152 ?auto_1109147 ) ( IS-CRATE ?auto_1109147 ) ( not ( = ?auto_1109150 ?auto_1109147 ) ) ( ON ?auto_1109149 ?auto_1109148 ) ( ON ?auto_1109150 ?auto_1109149 ) ( not ( = ?auto_1109148 ?auto_1109149 ) ) ( not ( = ?auto_1109148 ?auto_1109150 ) ) ( not ( = ?auto_1109148 ?auto_1109147 ) ) ( not ( = ?auto_1109149 ?auto_1109150 ) ) ( not ( = ?auto_1109149 ?auto_1109147 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1109150 ?auto_1109147 )
      ( MAKE-3CRATE-VERIFY ?auto_1109148 ?auto_1109149 ?auto_1109150 ?auto_1109147 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1109165 - SURFACE
      ?auto_1109166 - SURFACE
      ?auto_1109167 - SURFACE
      ?auto_1109164 - SURFACE
    )
    :vars
    (
      ?auto_1109169 - HOIST
      ?auto_1109168 - PLACE
      ?auto_1109170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109169 ?auto_1109168 ) ( SURFACE-AT ?auto_1109167 ?auto_1109168 ) ( CLEAR ?auto_1109167 ) ( IS-CRATE ?auto_1109164 ) ( not ( = ?auto_1109167 ?auto_1109164 ) ) ( TRUCK-AT ?auto_1109170 ?auto_1109168 ) ( AVAILABLE ?auto_1109169 ) ( IN ?auto_1109164 ?auto_1109170 ) ( ON ?auto_1109167 ?auto_1109166 ) ( not ( = ?auto_1109166 ?auto_1109167 ) ) ( not ( = ?auto_1109166 ?auto_1109164 ) ) ( ON ?auto_1109166 ?auto_1109165 ) ( not ( = ?auto_1109165 ?auto_1109166 ) ) ( not ( = ?auto_1109165 ?auto_1109167 ) ) ( not ( = ?auto_1109165 ?auto_1109164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109166 ?auto_1109167 ?auto_1109164 )
      ( MAKE-3CRATE-VERIFY ?auto_1109165 ?auto_1109166 ?auto_1109167 ?auto_1109164 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1109186 - SURFACE
      ?auto_1109187 - SURFACE
      ?auto_1109188 - SURFACE
      ?auto_1109185 - SURFACE
    )
    :vars
    (
      ?auto_1109189 - HOIST
      ?auto_1109191 - PLACE
      ?auto_1109190 - TRUCK
      ?auto_1109192 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109189 ?auto_1109191 ) ( SURFACE-AT ?auto_1109188 ?auto_1109191 ) ( CLEAR ?auto_1109188 ) ( IS-CRATE ?auto_1109185 ) ( not ( = ?auto_1109188 ?auto_1109185 ) ) ( AVAILABLE ?auto_1109189 ) ( IN ?auto_1109185 ?auto_1109190 ) ( ON ?auto_1109188 ?auto_1109187 ) ( not ( = ?auto_1109187 ?auto_1109188 ) ) ( not ( = ?auto_1109187 ?auto_1109185 ) ) ( TRUCK-AT ?auto_1109190 ?auto_1109192 ) ( not ( = ?auto_1109192 ?auto_1109191 ) ) ( ON ?auto_1109187 ?auto_1109186 ) ( not ( = ?auto_1109186 ?auto_1109187 ) ) ( not ( = ?auto_1109186 ?auto_1109188 ) ) ( not ( = ?auto_1109186 ?auto_1109185 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109187 ?auto_1109188 ?auto_1109185 )
      ( MAKE-3CRATE-VERIFY ?auto_1109186 ?auto_1109187 ?auto_1109188 ?auto_1109185 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1109210 - SURFACE
      ?auto_1109211 - SURFACE
      ?auto_1109212 - SURFACE
      ?auto_1109209 - SURFACE
    )
    :vars
    (
      ?auto_1109216 - HOIST
      ?auto_1109214 - PLACE
      ?auto_1109217 - TRUCK
      ?auto_1109215 - PLACE
      ?auto_1109213 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109216 ?auto_1109214 ) ( SURFACE-AT ?auto_1109212 ?auto_1109214 ) ( CLEAR ?auto_1109212 ) ( IS-CRATE ?auto_1109209 ) ( not ( = ?auto_1109212 ?auto_1109209 ) ) ( AVAILABLE ?auto_1109216 ) ( ON ?auto_1109212 ?auto_1109211 ) ( not ( = ?auto_1109211 ?auto_1109212 ) ) ( not ( = ?auto_1109211 ?auto_1109209 ) ) ( TRUCK-AT ?auto_1109217 ?auto_1109215 ) ( not ( = ?auto_1109215 ?auto_1109214 ) ) ( HOIST-AT ?auto_1109213 ?auto_1109215 ) ( LIFTING ?auto_1109213 ?auto_1109209 ) ( not ( = ?auto_1109216 ?auto_1109213 ) ) ( ON ?auto_1109211 ?auto_1109210 ) ( not ( = ?auto_1109210 ?auto_1109211 ) ) ( not ( = ?auto_1109210 ?auto_1109212 ) ) ( not ( = ?auto_1109210 ?auto_1109209 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109211 ?auto_1109212 ?auto_1109209 )
      ( MAKE-3CRATE-VERIFY ?auto_1109210 ?auto_1109211 ?auto_1109212 ?auto_1109209 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1109237 - SURFACE
      ?auto_1109238 - SURFACE
      ?auto_1109239 - SURFACE
      ?auto_1109236 - SURFACE
    )
    :vars
    (
      ?auto_1109245 - HOIST
      ?auto_1109244 - PLACE
      ?auto_1109243 - TRUCK
      ?auto_1109242 - PLACE
      ?auto_1109240 - HOIST
      ?auto_1109241 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109245 ?auto_1109244 ) ( SURFACE-AT ?auto_1109239 ?auto_1109244 ) ( CLEAR ?auto_1109239 ) ( IS-CRATE ?auto_1109236 ) ( not ( = ?auto_1109239 ?auto_1109236 ) ) ( AVAILABLE ?auto_1109245 ) ( ON ?auto_1109239 ?auto_1109238 ) ( not ( = ?auto_1109238 ?auto_1109239 ) ) ( not ( = ?auto_1109238 ?auto_1109236 ) ) ( TRUCK-AT ?auto_1109243 ?auto_1109242 ) ( not ( = ?auto_1109242 ?auto_1109244 ) ) ( HOIST-AT ?auto_1109240 ?auto_1109242 ) ( not ( = ?auto_1109245 ?auto_1109240 ) ) ( AVAILABLE ?auto_1109240 ) ( SURFACE-AT ?auto_1109236 ?auto_1109242 ) ( ON ?auto_1109236 ?auto_1109241 ) ( CLEAR ?auto_1109236 ) ( not ( = ?auto_1109239 ?auto_1109241 ) ) ( not ( = ?auto_1109236 ?auto_1109241 ) ) ( not ( = ?auto_1109238 ?auto_1109241 ) ) ( ON ?auto_1109238 ?auto_1109237 ) ( not ( = ?auto_1109237 ?auto_1109238 ) ) ( not ( = ?auto_1109237 ?auto_1109239 ) ) ( not ( = ?auto_1109237 ?auto_1109236 ) ) ( not ( = ?auto_1109237 ?auto_1109241 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109238 ?auto_1109239 ?auto_1109236 )
      ( MAKE-3CRATE-VERIFY ?auto_1109237 ?auto_1109238 ?auto_1109239 ?auto_1109236 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1109265 - SURFACE
      ?auto_1109266 - SURFACE
      ?auto_1109267 - SURFACE
      ?auto_1109264 - SURFACE
    )
    :vars
    (
      ?auto_1109269 - HOIST
      ?auto_1109272 - PLACE
      ?auto_1109273 - PLACE
      ?auto_1109268 - HOIST
      ?auto_1109270 - SURFACE
      ?auto_1109271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109269 ?auto_1109272 ) ( SURFACE-AT ?auto_1109267 ?auto_1109272 ) ( CLEAR ?auto_1109267 ) ( IS-CRATE ?auto_1109264 ) ( not ( = ?auto_1109267 ?auto_1109264 ) ) ( AVAILABLE ?auto_1109269 ) ( ON ?auto_1109267 ?auto_1109266 ) ( not ( = ?auto_1109266 ?auto_1109267 ) ) ( not ( = ?auto_1109266 ?auto_1109264 ) ) ( not ( = ?auto_1109273 ?auto_1109272 ) ) ( HOIST-AT ?auto_1109268 ?auto_1109273 ) ( not ( = ?auto_1109269 ?auto_1109268 ) ) ( AVAILABLE ?auto_1109268 ) ( SURFACE-AT ?auto_1109264 ?auto_1109273 ) ( ON ?auto_1109264 ?auto_1109270 ) ( CLEAR ?auto_1109264 ) ( not ( = ?auto_1109267 ?auto_1109270 ) ) ( not ( = ?auto_1109264 ?auto_1109270 ) ) ( not ( = ?auto_1109266 ?auto_1109270 ) ) ( TRUCK-AT ?auto_1109271 ?auto_1109272 ) ( ON ?auto_1109266 ?auto_1109265 ) ( not ( = ?auto_1109265 ?auto_1109266 ) ) ( not ( = ?auto_1109265 ?auto_1109267 ) ) ( not ( = ?auto_1109265 ?auto_1109264 ) ) ( not ( = ?auto_1109265 ?auto_1109270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109266 ?auto_1109267 ?auto_1109264 )
      ( MAKE-3CRATE-VERIFY ?auto_1109265 ?auto_1109266 ?auto_1109267 ?auto_1109264 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1109293 - SURFACE
      ?auto_1109294 - SURFACE
      ?auto_1109295 - SURFACE
      ?auto_1109292 - SURFACE
    )
    :vars
    (
      ?auto_1109297 - HOIST
      ?auto_1109300 - PLACE
      ?auto_1109299 - PLACE
      ?auto_1109301 - HOIST
      ?auto_1109298 - SURFACE
      ?auto_1109296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109297 ?auto_1109300 ) ( IS-CRATE ?auto_1109292 ) ( not ( = ?auto_1109295 ?auto_1109292 ) ) ( not ( = ?auto_1109294 ?auto_1109295 ) ) ( not ( = ?auto_1109294 ?auto_1109292 ) ) ( not ( = ?auto_1109299 ?auto_1109300 ) ) ( HOIST-AT ?auto_1109301 ?auto_1109299 ) ( not ( = ?auto_1109297 ?auto_1109301 ) ) ( AVAILABLE ?auto_1109301 ) ( SURFACE-AT ?auto_1109292 ?auto_1109299 ) ( ON ?auto_1109292 ?auto_1109298 ) ( CLEAR ?auto_1109292 ) ( not ( = ?auto_1109295 ?auto_1109298 ) ) ( not ( = ?auto_1109292 ?auto_1109298 ) ) ( not ( = ?auto_1109294 ?auto_1109298 ) ) ( TRUCK-AT ?auto_1109296 ?auto_1109300 ) ( SURFACE-AT ?auto_1109294 ?auto_1109300 ) ( CLEAR ?auto_1109294 ) ( LIFTING ?auto_1109297 ?auto_1109295 ) ( IS-CRATE ?auto_1109295 ) ( ON ?auto_1109294 ?auto_1109293 ) ( not ( = ?auto_1109293 ?auto_1109294 ) ) ( not ( = ?auto_1109293 ?auto_1109295 ) ) ( not ( = ?auto_1109293 ?auto_1109292 ) ) ( not ( = ?auto_1109293 ?auto_1109298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109294 ?auto_1109295 ?auto_1109292 )
      ( MAKE-3CRATE-VERIFY ?auto_1109293 ?auto_1109294 ?auto_1109295 ?auto_1109292 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1109321 - SURFACE
      ?auto_1109322 - SURFACE
      ?auto_1109323 - SURFACE
      ?auto_1109320 - SURFACE
    )
    :vars
    (
      ?auto_1109325 - HOIST
      ?auto_1109324 - PLACE
      ?auto_1109328 - PLACE
      ?auto_1109329 - HOIST
      ?auto_1109326 - SURFACE
      ?auto_1109327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109325 ?auto_1109324 ) ( IS-CRATE ?auto_1109320 ) ( not ( = ?auto_1109323 ?auto_1109320 ) ) ( not ( = ?auto_1109322 ?auto_1109323 ) ) ( not ( = ?auto_1109322 ?auto_1109320 ) ) ( not ( = ?auto_1109328 ?auto_1109324 ) ) ( HOIST-AT ?auto_1109329 ?auto_1109328 ) ( not ( = ?auto_1109325 ?auto_1109329 ) ) ( AVAILABLE ?auto_1109329 ) ( SURFACE-AT ?auto_1109320 ?auto_1109328 ) ( ON ?auto_1109320 ?auto_1109326 ) ( CLEAR ?auto_1109320 ) ( not ( = ?auto_1109323 ?auto_1109326 ) ) ( not ( = ?auto_1109320 ?auto_1109326 ) ) ( not ( = ?auto_1109322 ?auto_1109326 ) ) ( TRUCK-AT ?auto_1109327 ?auto_1109324 ) ( SURFACE-AT ?auto_1109322 ?auto_1109324 ) ( CLEAR ?auto_1109322 ) ( IS-CRATE ?auto_1109323 ) ( AVAILABLE ?auto_1109325 ) ( IN ?auto_1109323 ?auto_1109327 ) ( ON ?auto_1109322 ?auto_1109321 ) ( not ( = ?auto_1109321 ?auto_1109322 ) ) ( not ( = ?auto_1109321 ?auto_1109323 ) ) ( not ( = ?auto_1109321 ?auto_1109320 ) ) ( not ( = ?auto_1109321 ?auto_1109326 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109322 ?auto_1109323 ?auto_1109320 )
      ( MAKE-3CRATE-VERIFY ?auto_1109321 ?auto_1109322 ?auto_1109323 ?auto_1109320 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1109612 - SURFACE
      ?auto_1109613 - SURFACE
      ?auto_1109614 - SURFACE
      ?auto_1109611 - SURFACE
      ?auto_1109615 - SURFACE
    )
    :vars
    (
      ?auto_1109617 - HOIST
      ?auto_1109616 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109617 ?auto_1109616 ) ( SURFACE-AT ?auto_1109611 ?auto_1109616 ) ( CLEAR ?auto_1109611 ) ( LIFTING ?auto_1109617 ?auto_1109615 ) ( IS-CRATE ?auto_1109615 ) ( not ( = ?auto_1109611 ?auto_1109615 ) ) ( ON ?auto_1109613 ?auto_1109612 ) ( ON ?auto_1109614 ?auto_1109613 ) ( ON ?auto_1109611 ?auto_1109614 ) ( not ( = ?auto_1109612 ?auto_1109613 ) ) ( not ( = ?auto_1109612 ?auto_1109614 ) ) ( not ( = ?auto_1109612 ?auto_1109611 ) ) ( not ( = ?auto_1109612 ?auto_1109615 ) ) ( not ( = ?auto_1109613 ?auto_1109614 ) ) ( not ( = ?auto_1109613 ?auto_1109611 ) ) ( not ( = ?auto_1109613 ?auto_1109615 ) ) ( not ( = ?auto_1109614 ?auto_1109611 ) ) ( not ( = ?auto_1109614 ?auto_1109615 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1109611 ?auto_1109615 )
      ( MAKE-4CRATE-VERIFY ?auto_1109612 ?auto_1109613 ?auto_1109614 ?auto_1109611 ?auto_1109615 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1109637 - SURFACE
      ?auto_1109638 - SURFACE
      ?auto_1109639 - SURFACE
      ?auto_1109636 - SURFACE
      ?auto_1109640 - SURFACE
    )
    :vars
    (
      ?auto_1109642 - HOIST
      ?auto_1109643 - PLACE
      ?auto_1109641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109642 ?auto_1109643 ) ( SURFACE-AT ?auto_1109636 ?auto_1109643 ) ( CLEAR ?auto_1109636 ) ( IS-CRATE ?auto_1109640 ) ( not ( = ?auto_1109636 ?auto_1109640 ) ) ( TRUCK-AT ?auto_1109641 ?auto_1109643 ) ( AVAILABLE ?auto_1109642 ) ( IN ?auto_1109640 ?auto_1109641 ) ( ON ?auto_1109636 ?auto_1109639 ) ( not ( = ?auto_1109639 ?auto_1109636 ) ) ( not ( = ?auto_1109639 ?auto_1109640 ) ) ( ON ?auto_1109638 ?auto_1109637 ) ( ON ?auto_1109639 ?auto_1109638 ) ( not ( = ?auto_1109637 ?auto_1109638 ) ) ( not ( = ?auto_1109637 ?auto_1109639 ) ) ( not ( = ?auto_1109637 ?auto_1109636 ) ) ( not ( = ?auto_1109637 ?auto_1109640 ) ) ( not ( = ?auto_1109638 ?auto_1109639 ) ) ( not ( = ?auto_1109638 ?auto_1109636 ) ) ( not ( = ?auto_1109638 ?auto_1109640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109639 ?auto_1109636 ?auto_1109640 )
      ( MAKE-4CRATE-VERIFY ?auto_1109637 ?auto_1109638 ?auto_1109639 ?auto_1109636 ?auto_1109640 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1109667 - SURFACE
      ?auto_1109668 - SURFACE
      ?auto_1109669 - SURFACE
      ?auto_1109666 - SURFACE
      ?auto_1109670 - SURFACE
    )
    :vars
    (
      ?auto_1109672 - HOIST
      ?auto_1109671 - PLACE
      ?auto_1109674 - TRUCK
      ?auto_1109673 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109672 ?auto_1109671 ) ( SURFACE-AT ?auto_1109666 ?auto_1109671 ) ( CLEAR ?auto_1109666 ) ( IS-CRATE ?auto_1109670 ) ( not ( = ?auto_1109666 ?auto_1109670 ) ) ( AVAILABLE ?auto_1109672 ) ( IN ?auto_1109670 ?auto_1109674 ) ( ON ?auto_1109666 ?auto_1109669 ) ( not ( = ?auto_1109669 ?auto_1109666 ) ) ( not ( = ?auto_1109669 ?auto_1109670 ) ) ( TRUCK-AT ?auto_1109674 ?auto_1109673 ) ( not ( = ?auto_1109673 ?auto_1109671 ) ) ( ON ?auto_1109668 ?auto_1109667 ) ( ON ?auto_1109669 ?auto_1109668 ) ( not ( = ?auto_1109667 ?auto_1109668 ) ) ( not ( = ?auto_1109667 ?auto_1109669 ) ) ( not ( = ?auto_1109667 ?auto_1109666 ) ) ( not ( = ?auto_1109667 ?auto_1109670 ) ) ( not ( = ?auto_1109668 ?auto_1109669 ) ) ( not ( = ?auto_1109668 ?auto_1109666 ) ) ( not ( = ?auto_1109668 ?auto_1109670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109669 ?auto_1109666 ?auto_1109670 )
      ( MAKE-4CRATE-VERIFY ?auto_1109667 ?auto_1109668 ?auto_1109669 ?auto_1109666 ?auto_1109670 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1109701 - SURFACE
      ?auto_1109702 - SURFACE
      ?auto_1109703 - SURFACE
      ?auto_1109700 - SURFACE
      ?auto_1109704 - SURFACE
    )
    :vars
    (
      ?auto_1109709 - HOIST
      ?auto_1109708 - PLACE
      ?auto_1109705 - TRUCK
      ?auto_1109706 - PLACE
      ?auto_1109707 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109709 ?auto_1109708 ) ( SURFACE-AT ?auto_1109700 ?auto_1109708 ) ( CLEAR ?auto_1109700 ) ( IS-CRATE ?auto_1109704 ) ( not ( = ?auto_1109700 ?auto_1109704 ) ) ( AVAILABLE ?auto_1109709 ) ( ON ?auto_1109700 ?auto_1109703 ) ( not ( = ?auto_1109703 ?auto_1109700 ) ) ( not ( = ?auto_1109703 ?auto_1109704 ) ) ( TRUCK-AT ?auto_1109705 ?auto_1109706 ) ( not ( = ?auto_1109706 ?auto_1109708 ) ) ( HOIST-AT ?auto_1109707 ?auto_1109706 ) ( LIFTING ?auto_1109707 ?auto_1109704 ) ( not ( = ?auto_1109709 ?auto_1109707 ) ) ( ON ?auto_1109702 ?auto_1109701 ) ( ON ?auto_1109703 ?auto_1109702 ) ( not ( = ?auto_1109701 ?auto_1109702 ) ) ( not ( = ?auto_1109701 ?auto_1109703 ) ) ( not ( = ?auto_1109701 ?auto_1109700 ) ) ( not ( = ?auto_1109701 ?auto_1109704 ) ) ( not ( = ?auto_1109702 ?auto_1109703 ) ) ( not ( = ?auto_1109702 ?auto_1109700 ) ) ( not ( = ?auto_1109702 ?auto_1109704 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109703 ?auto_1109700 ?auto_1109704 )
      ( MAKE-4CRATE-VERIFY ?auto_1109701 ?auto_1109702 ?auto_1109703 ?auto_1109700 ?auto_1109704 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1109739 - SURFACE
      ?auto_1109740 - SURFACE
      ?auto_1109741 - SURFACE
      ?auto_1109738 - SURFACE
      ?auto_1109742 - SURFACE
    )
    :vars
    (
      ?auto_1109743 - HOIST
      ?auto_1109747 - PLACE
      ?auto_1109745 - TRUCK
      ?auto_1109746 - PLACE
      ?auto_1109748 - HOIST
      ?auto_1109744 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109743 ?auto_1109747 ) ( SURFACE-AT ?auto_1109738 ?auto_1109747 ) ( CLEAR ?auto_1109738 ) ( IS-CRATE ?auto_1109742 ) ( not ( = ?auto_1109738 ?auto_1109742 ) ) ( AVAILABLE ?auto_1109743 ) ( ON ?auto_1109738 ?auto_1109741 ) ( not ( = ?auto_1109741 ?auto_1109738 ) ) ( not ( = ?auto_1109741 ?auto_1109742 ) ) ( TRUCK-AT ?auto_1109745 ?auto_1109746 ) ( not ( = ?auto_1109746 ?auto_1109747 ) ) ( HOIST-AT ?auto_1109748 ?auto_1109746 ) ( not ( = ?auto_1109743 ?auto_1109748 ) ) ( AVAILABLE ?auto_1109748 ) ( SURFACE-AT ?auto_1109742 ?auto_1109746 ) ( ON ?auto_1109742 ?auto_1109744 ) ( CLEAR ?auto_1109742 ) ( not ( = ?auto_1109738 ?auto_1109744 ) ) ( not ( = ?auto_1109742 ?auto_1109744 ) ) ( not ( = ?auto_1109741 ?auto_1109744 ) ) ( ON ?auto_1109740 ?auto_1109739 ) ( ON ?auto_1109741 ?auto_1109740 ) ( not ( = ?auto_1109739 ?auto_1109740 ) ) ( not ( = ?auto_1109739 ?auto_1109741 ) ) ( not ( = ?auto_1109739 ?auto_1109738 ) ) ( not ( = ?auto_1109739 ?auto_1109742 ) ) ( not ( = ?auto_1109739 ?auto_1109744 ) ) ( not ( = ?auto_1109740 ?auto_1109741 ) ) ( not ( = ?auto_1109740 ?auto_1109738 ) ) ( not ( = ?auto_1109740 ?auto_1109742 ) ) ( not ( = ?auto_1109740 ?auto_1109744 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109741 ?auto_1109738 ?auto_1109742 )
      ( MAKE-4CRATE-VERIFY ?auto_1109739 ?auto_1109740 ?auto_1109741 ?auto_1109738 ?auto_1109742 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1109778 - SURFACE
      ?auto_1109779 - SURFACE
      ?auto_1109780 - SURFACE
      ?auto_1109777 - SURFACE
      ?auto_1109781 - SURFACE
    )
    :vars
    (
      ?auto_1109783 - HOIST
      ?auto_1109785 - PLACE
      ?auto_1109787 - PLACE
      ?auto_1109786 - HOIST
      ?auto_1109782 - SURFACE
      ?auto_1109784 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109783 ?auto_1109785 ) ( SURFACE-AT ?auto_1109777 ?auto_1109785 ) ( CLEAR ?auto_1109777 ) ( IS-CRATE ?auto_1109781 ) ( not ( = ?auto_1109777 ?auto_1109781 ) ) ( AVAILABLE ?auto_1109783 ) ( ON ?auto_1109777 ?auto_1109780 ) ( not ( = ?auto_1109780 ?auto_1109777 ) ) ( not ( = ?auto_1109780 ?auto_1109781 ) ) ( not ( = ?auto_1109787 ?auto_1109785 ) ) ( HOIST-AT ?auto_1109786 ?auto_1109787 ) ( not ( = ?auto_1109783 ?auto_1109786 ) ) ( AVAILABLE ?auto_1109786 ) ( SURFACE-AT ?auto_1109781 ?auto_1109787 ) ( ON ?auto_1109781 ?auto_1109782 ) ( CLEAR ?auto_1109781 ) ( not ( = ?auto_1109777 ?auto_1109782 ) ) ( not ( = ?auto_1109781 ?auto_1109782 ) ) ( not ( = ?auto_1109780 ?auto_1109782 ) ) ( TRUCK-AT ?auto_1109784 ?auto_1109785 ) ( ON ?auto_1109779 ?auto_1109778 ) ( ON ?auto_1109780 ?auto_1109779 ) ( not ( = ?auto_1109778 ?auto_1109779 ) ) ( not ( = ?auto_1109778 ?auto_1109780 ) ) ( not ( = ?auto_1109778 ?auto_1109777 ) ) ( not ( = ?auto_1109778 ?auto_1109781 ) ) ( not ( = ?auto_1109778 ?auto_1109782 ) ) ( not ( = ?auto_1109779 ?auto_1109780 ) ) ( not ( = ?auto_1109779 ?auto_1109777 ) ) ( not ( = ?auto_1109779 ?auto_1109781 ) ) ( not ( = ?auto_1109779 ?auto_1109782 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109780 ?auto_1109777 ?auto_1109781 )
      ( MAKE-4CRATE-VERIFY ?auto_1109778 ?auto_1109779 ?auto_1109780 ?auto_1109777 ?auto_1109781 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1109817 - SURFACE
      ?auto_1109818 - SURFACE
      ?auto_1109819 - SURFACE
      ?auto_1109816 - SURFACE
      ?auto_1109820 - SURFACE
    )
    :vars
    (
      ?auto_1109824 - HOIST
      ?auto_1109825 - PLACE
      ?auto_1109823 - PLACE
      ?auto_1109826 - HOIST
      ?auto_1109822 - SURFACE
      ?auto_1109821 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109824 ?auto_1109825 ) ( IS-CRATE ?auto_1109820 ) ( not ( = ?auto_1109816 ?auto_1109820 ) ) ( not ( = ?auto_1109819 ?auto_1109816 ) ) ( not ( = ?auto_1109819 ?auto_1109820 ) ) ( not ( = ?auto_1109823 ?auto_1109825 ) ) ( HOIST-AT ?auto_1109826 ?auto_1109823 ) ( not ( = ?auto_1109824 ?auto_1109826 ) ) ( AVAILABLE ?auto_1109826 ) ( SURFACE-AT ?auto_1109820 ?auto_1109823 ) ( ON ?auto_1109820 ?auto_1109822 ) ( CLEAR ?auto_1109820 ) ( not ( = ?auto_1109816 ?auto_1109822 ) ) ( not ( = ?auto_1109820 ?auto_1109822 ) ) ( not ( = ?auto_1109819 ?auto_1109822 ) ) ( TRUCK-AT ?auto_1109821 ?auto_1109825 ) ( SURFACE-AT ?auto_1109819 ?auto_1109825 ) ( CLEAR ?auto_1109819 ) ( LIFTING ?auto_1109824 ?auto_1109816 ) ( IS-CRATE ?auto_1109816 ) ( ON ?auto_1109818 ?auto_1109817 ) ( ON ?auto_1109819 ?auto_1109818 ) ( not ( = ?auto_1109817 ?auto_1109818 ) ) ( not ( = ?auto_1109817 ?auto_1109819 ) ) ( not ( = ?auto_1109817 ?auto_1109816 ) ) ( not ( = ?auto_1109817 ?auto_1109820 ) ) ( not ( = ?auto_1109817 ?auto_1109822 ) ) ( not ( = ?auto_1109818 ?auto_1109819 ) ) ( not ( = ?auto_1109818 ?auto_1109816 ) ) ( not ( = ?auto_1109818 ?auto_1109820 ) ) ( not ( = ?auto_1109818 ?auto_1109822 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109819 ?auto_1109816 ?auto_1109820 )
      ( MAKE-4CRATE-VERIFY ?auto_1109817 ?auto_1109818 ?auto_1109819 ?auto_1109816 ?auto_1109820 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1109856 - SURFACE
      ?auto_1109857 - SURFACE
      ?auto_1109858 - SURFACE
      ?auto_1109855 - SURFACE
      ?auto_1109859 - SURFACE
    )
    :vars
    (
      ?auto_1109860 - HOIST
      ?auto_1109865 - PLACE
      ?auto_1109864 - PLACE
      ?auto_1109861 - HOIST
      ?auto_1109863 - SURFACE
      ?auto_1109862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1109860 ?auto_1109865 ) ( IS-CRATE ?auto_1109859 ) ( not ( = ?auto_1109855 ?auto_1109859 ) ) ( not ( = ?auto_1109858 ?auto_1109855 ) ) ( not ( = ?auto_1109858 ?auto_1109859 ) ) ( not ( = ?auto_1109864 ?auto_1109865 ) ) ( HOIST-AT ?auto_1109861 ?auto_1109864 ) ( not ( = ?auto_1109860 ?auto_1109861 ) ) ( AVAILABLE ?auto_1109861 ) ( SURFACE-AT ?auto_1109859 ?auto_1109864 ) ( ON ?auto_1109859 ?auto_1109863 ) ( CLEAR ?auto_1109859 ) ( not ( = ?auto_1109855 ?auto_1109863 ) ) ( not ( = ?auto_1109859 ?auto_1109863 ) ) ( not ( = ?auto_1109858 ?auto_1109863 ) ) ( TRUCK-AT ?auto_1109862 ?auto_1109865 ) ( SURFACE-AT ?auto_1109858 ?auto_1109865 ) ( CLEAR ?auto_1109858 ) ( IS-CRATE ?auto_1109855 ) ( AVAILABLE ?auto_1109860 ) ( IN ?auto_1109855 ?auto_1109862 ) ( ON ?auto_1109857 ?auto_1109856 ) ( ON ?auto_1109858 ?auto_1109857 ) ( not ( = ?auto_1109856 ?auto_1109857 ) ) ( not ( = ?auto_1109856 ?auto_1109858 ) ) ( not ( = ?auto_1109856 ?auto_1109855 ) ) ( not ( = ?auto_1109856 ?auto_1109859 ) ) ( not ( = ?auto_1109856 ?auto_1109863 ) ) ( not ( = ?auto_1109857 ?auto_1109858 ) ) ( not ( = ?auto_1109857 ?auto_1109855 ) ) ( not ( = ?auto_1109857 ?auto_1109859 ) ) ( not ( = ?auto_1109857 ?auto_1109863 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1109858 ?auto_1109855 ?auto_1109859 )
      ( MAKE-4CRATE-VERIFY ?auto_1109856 ?auto_1109857 ?auto_1109858 ?auto_1109855 ?auto_1109859 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1110516 - SURFACE
      ?auto_1110517 - SURFACE
      ?auto_1110518 - SURFACE
      ?auto_1110515 - SURFACE
      ?auto_1110519 - SURFACE
      ?auto_1110520 - SURFACE
    )
    :vars
    (
      ?auto_1110521 - HOIST
      ?auto_1110522 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1110521 ?auto_1110522 ) ( SURFACE-AT ?auto_1110519 ?auto_1110522 ) ( CLEAR ?auto_1110519 ) ( LIFTING ?auto_1110521 ?auto_1110520 ) ( IS-CRATE ?auto_1110520 ) ( not ( = ?auto_1110519 ?auto_1110520 ) ) ( ON ?auto_1110517 ?auto_1110516 ) ( ON ?auto_1110518 ?auto_1110517 ) ( ON ?auto_1110515 ?auto_1110518 ) ( ON ?auto_1110519 ?auto_1110515 ) ( not ( = ?auto_1110516 ?auto_1110517 ) ) ( not ( = ?auto_1110516 ?auto_1110518 ) ) ( not ( = ?auto_1110516 ?auto_1110515 ) ) ( not ( = ?auto_1110516 ?auto_1110519 ) ) ( not ( = ?auto_1110516 ?auto_1110520 ) ) ( not ( = ?auto_1110517 ?auto_1110518 ) ) ( not ( = ?auto_1110517 ?auto_1110515 ) ) ( not ( = ?auto_1110517 ?auto_1110519 ) ) ( not ( = ?auto_1110517 ?auto_1110520 ) ) ( not ( = ?auto_1110518 ?auto_1110515 ) ) ( not ( = ?auto_1110518 ?auto_1110519 ) ) ( not ( = ?auto_1110518 ?auto_1110520 ) ) ( not ( = ?auto_1110515 ?auto_1110519 ) ) ( not ( = ?auto_1110515 ?auto_1110520 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1110519 ?auto_1110520 )
      ( MAKE-5CRATE-VERIFY ?auto_1110516 ?auto_1110517 ?auto_1110518 ?auto_1110515 ?auto_1110519 ?auto_1110520 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1110550 - SURFACE
      ?auto_1110551 - SURFACE
      ?auto_1110552 - SURFACE
      ?auto_1110549 - SURFACE
      ?auto_1110553 - SURFACE
      ?auto_1110554 - SURFACE
    )
    :vars
    (
      ?auto_1110555 - HOIST
      ?auto_1110556 - PLACE
      ?auto_1110557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1110555 ?auto_1110556 ) ( SURFACE-AT ?auto_1110553 ?auto_1110556 ) ( CLEAR ?auto_1110553 ) ( IS-CRATE ?auto_1110554 ) ( not ( = ?auto_1110553 ?auto_1110554 ) ) ( TRUCK-AT ?auto_1110557 ?auto_1110556 ) ( AVAILABLE ?auto_1110555 ) ( IN ?auto_1110554 ?auto_1110557 ) ( ON ?auto_1110553 ?auto_1110549 ) ( not ( = ?auto_1110549 ?auto_1110553 ) ) ( not ( = ?auto_1110549 ?auto_1110554 ) ) ( ON ?auto_1110551 ?auto_1110550 ) ( ON ?auto_1110552 ?auto_1110551 ) ( ON ?auto_1110549 ?auto_1110552 ) ( not ( = ?auto_1110550 ?auto_1110551 ) ) ( not ( = ?auto_1110550 ?auto_1110552 ) ) ( not ( = ?auto_1110550 ?auto_1110549 ) ) ( not ( = ?auto_1110550 ?auto_1110553 ) ) ( not ( = ?auto_1110550 ?auto_1110554 ) ) ( not ( = ?auto_1110551 ?auto_1110552 ) ) ( not ( = ?auto_1110551 ?auto_1110549 ) ) ( not ( = ?auto_1110551 ?auto_1110553 ) ) ( not ( = ?auto_1110551 ?auto_1110554 ) ) ( not ( = ?auto_1110552 ?auto_1110549 ) ) ( not ( = ?auto_1110552 ?auto_1110553 ) ) ( not ( = ?auto_1110552 ?auto_1110554 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1110549 ?auto_1110553 ?auto_1110554 )
      ( MAKE-5CRATE-VERIFY ?auto_1110550 ?auto_1110551 ?auto_1110552 ?auto_1110549 ?auto_1110553 ?auto_1110554 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1110590 - SURFACE
      ?auto_1110591 - SURFACE
      ?auto_1110592 - SURFACE
      ?auto_1110589 - SURFACE
      ?auto_1110593 - SURFACE
      ?auto_1110594 - SURFACE
    )
    :vars
    (
      ?auto_1110597 - HOIST
      ?auto_1110596 - PLACE
      ?auto_1110595 - TRUCK
      ?auto_1110598 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1110597 ?auto_1110596 ) ( SURFACE-AT ?auto_1110593 ?auto_1110596 ) ( CLEAR ?auto_1110593 ) ( IS-CRATE ?auto_1110594 ) ( not ( = ?auto_1110593 ?auto_1110594 ) ) ( AVAILABLE ?auto_1110597 ) ( IN ?auto_1110594 ?auto_1110595 ) ( ON ?auto_1110593 ?auto_1110589 ) ( not ( = ?auto_1110589 ?auto_1110593 ) ) ( not ( = ?auto_1110589 ?auto_1110594 ) ) ( TRUCK-AT ?auto_1110595 ?auto_1110598 ) ( not ( = ?auto_1110598 ?auto_1110596 ) ) ( ON ?auto_1110591 ?auto_1110590 ) ( ON ?auto_1110592 ?auto_1110591 ) ( ON ?auto_1110589 ?auto_1110592 ) ( not ( = ?auto_1110590 ?auto_1110591 ) ) ( not ( = ?auto_1110590 ?auto_1110592 ) ) ( not ( = ?auto_1110590 ?auto_1110589 ) ) ( not ( = ?auto_1110590 ?auto_1110593 ) ) ( not ( = ?auto_1110590 ?auto_1110594 ) ) ( not ( = ?auto_1110591 ?auto_1110592 ) ) ( not ( = ?auto_1110591 ?auto_1110589 ) ) ( not ( = ?auto_1110591 ?auto_1110593 ) ) ( not ( = ?auto_1110591 ?auto_1110594 ) ) ( not ( = ?auto_1110592 ?auto_1110589 ) ) ( not ( = ?auto_1110592 ?auto_1110593 ) ) ( not ( = ?auto_1110592 ?auto_1110594 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1110589 ?auto_1110593 ?auto_1110594 )
      ( MAKE-5CRATE-VERIFY ?auto_1110590 ?auto_1110591 ?auto_1110592 ?auto_1110589 ?auto_1110593 ?auto_1110594 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1110635 - SURFACE
      ?auto_1110636 - SURFACE
      ?auto_1110637 - SURFACE
      ?auto_1110634 - SURFACE
      ?auto_1110638 - SURFACE
      ?auto_1110639 - SURFACE
    )
    :vars
    (
      ?auto_1110641 - HOIST
      ?auto_1110644 - PLACE
      ?auto_1110640 - TRUCK
      ?auto_1110642 - PLACE
      ?auto_1110643 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1110641 ?auto_1110644 ) ( SURFACE-AT ?auto_1110638 ?auto_1110644 ) ( CLEAR ?auto_1110638 ) ( IS-CRATE ?auto_1110639 ) ( not ( = ?auto_1110638 ?auto_1110639 ) ) ( AVAILABLE ?auto_1110641 ) ( ON ?auto_1110638 ?auto_1110634 ) ( not ( = ?auto_1110634 ?auto_1110638 ) ) ( not ( = ?auto_1110634 ?auto_1110639 ) ) ( TRUCK-AT ?auto_1110640 ?auto_1110642 ) ( not ( = ?auto_1110642 ?auto_1110644 ) ) ( HOIST-AT ?auto_1110643 ?auto_1110642 ) ( LIFTING ?auto_1110643 ?auto_1110639 ) ( not ( = ?auto_1110641 ?auto_1110643 ) ) ( ON ?auto_1110636 ?auto_1110635 ) ( ON ?auto_1110637 ?auto_1110636 ) ( ON ?auto_1110634 ?auto_1110637 ) ( not ( = ?auto_1110635 ?auto_1110636 ) ) ( not ( = ?auto_1110635 ?auto_1110637 ) ) ( not ( = ?auto_1110635 ?auto_1110634 ) ) ( not ( = ?auto_1110635 ?auto_1110638 ) ) ( not ( = ?auto_1110635 ?auto_1110639 ) ) ( not ( = ?auto_1110636 ?auto_1110637 ) ) ( not ( = ?auto_1110636 ?auto_1110634 ) ) ( not ( = ?auto_1110636 ?auto_1110638 ) ) ( not ( = ?auto_1110636 ?auto_1110639 ) ) ( not ( = ?auto_1110637 ?auto_1110634 ) ) ( not ( = ?auto_1110637 ?auto_1110638 ) ) ( not ( = ?auto_1110637 ?auto_1110639 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1110634 ?auto_1110638 ?auto_1110639 )
      ( MAKE-5CRATE-VERIFY ?auto_1110635 ?auto_1110636 ?auto_1110637 ?auto_1110634 ?auto_1110638 ?auto_1110639 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1110685 - SURFACE
      ?auto_1110686 - SURFACE
      ?auto_1110687 - SURFACE
      ?auto_1110684 - SURFACE
      ?auto_1110688 - SURFACE
      ?auto_1110689 - SURFACE
    )
    :vars
    (
      ?auto_1110693 - HOIST
      ?auto_1110692 - PLACE
      ?auto_1110691 - TRUCK
      ?auto_1110695 - PLACE
      ?auto_1110694 - HOIST
      ?auto_1110690 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1110693 ?auto_1110692 ) ( SURFACE-AT ?auto_1110688 ?auto_1110692 ) ( CLEAR ?auto_1110688 ) ( IS-CRATE ?auto_1110689 ) ( not ( = ?auto_1110688 ?auto_1110689 ) ) ( AVAILABLE ?auto_1110693 ) ( ON ?auto_1110688 ?auto_1110684 ) ( not ( = ?auto_1110684 ?auto_1110688 ) ) ( not ( = ?auto_1110684 ?auto_1110689 ) ) ( TRUCK-AT ?auto_1110691 ?auto_1110695 ) ( not ( = ?auto_1110695 ?auto_1110692 ) ) ( HOIST-AT ?auto_1110694 ?auto_1110695 ) ( not ( = ?auto_1110693 ?auto_1110694 ) ) ( AVAILABLE ?auto_1110694 ) ( SURFACE-AT ?auto_1110689 ?auto_1110695 ) ( ON ?auto_1110689 ?auto_1110690 ) ( CLEAR ?auto_1110689 ) ( not ( = ?auto_1110688 ?auto_1110690 ) ) ( not ( = ?auto_1110689 ?auto_1110690 ) ) ( not ( = ?auto_1110684 ?auto_1110690 ) ) ( ON ?auto_1110686 ?auto_1110685 ) ( ON ?auto_1110687 ?auto_1110686 ) ( ON ?auto_1110684 ?auto_1110687 ) ( not ( = ?auto_1110685 ?auto_1110686 ) ) ( not ( = ?auto_1110685 ?auto_1110687 ) ) ( not ( = ?auto_1110685 ?auto_1110684 ) ) ( not ( = ?auto_1110685 ?auto_1110688 ) ) ( not ( = ?auto_1110685 ?auto_1110689 ) ) ( not ( = ?auto_1110685 ?auto_1110690 ) ) ( not ( = ?auto_1110686 ?auto_1110687 ) ) ( not ( = ?auto_1110686 ?auto_1110684 ) ) ( not ( = ?auto_1110686 ?auto_1110688 ) ) ( not ( = ?auto_1110686 ?auto_1110689 ) ) ( not ( = ?auto_1110686 ?auto_1110690 ) ) ( not ( = ?auto_1110687 ?auto_1110684 ) ) ( not ( = ?auto_1110687 ?auto_1110688 ) ) ( not ( = ?auto_1110687 ?auto_1110689 ) ) ( not ( = ?auto_1110687 ?auto_1110690 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1110684 ?auto_1110688 ?auto_1110689 )
      ( MAKE-5CRATE-VERIFY ?auto_1110685 ?auto_1110686 ?auto_1110687 ?auto_1110684 ?auto_1110688 ?auto_1110689 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1110736 - SURFACE
      ?auto_1110737 - SURFACE
      ?auto_1110738 - SURFACE
      ?auto_1110735 - SURFACE
      ?auto_1110739 - SURFACE
      ?auto_1110740 - SURFACE
    )
    :vars
    (
      ?auto_1110746 - HOIST
      ?auto_1110742 - PLACE
      ?auto_1110744 - PLACE
      ?auto_1110743 - HOIST
      ?auto_1110745 - SURFACE
      ?auto_1110741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1110746 ?auto_1110742 ) ( SURFACE-AT ?auto_1110739 ?auto_1110742 ) ( CLEAR ?auto_1110739 ) ( IS-CRATE ?auto_1110740 ) ( not ( = ?auto_1110739 ?auto_1110740 ) ) ( AVAILABLE ?auto_1110746 ) ( ON ?auto_1110739 ?auto_1110735 ) ( not ( = ?auto_1110735 ?auto_1110739 ) ) ( not ( = ?auto_1110735 ?auto_1110740 ) ) ( not ( = ?auto_1110744 ?auto_1110742 ) ) ( HOIST-AT ?auto_1110743 ?auto_1110744 ) ( not ( = ?auto_1110746 ?auto_1110743 ) ) ( AVAILABLE ?auto_1110743 ) ( SURFACE-AT ?auto_1110740 ?auto_1110744 ) ( ON ?auto_1110740 ?auto_1110745 ) ( CLEAR ?auto_1110740 ) ( not ( = ?auto_1110739 ?auto_1110745 ) ) ( not ( = ?auto_1110740 ?auto_1110745 ) ) ( not ( = ?auto_1110735 ?auto_1110745 ) ) ( TRUCK-AT ?auto_1110741 ?auto_1110742 ) ( ON ?auto_1110737 ?auto_1110736 ) ( ON ?auto_1110738 ?auto_1110737 ) ( ON ?auto_1110735 ?auto_1110738 ) ( not ( = ?auto_1110736 ?auto_1110737 ) ) ( not ( = ?auto_1110736 ?auto_1110738 ) ) ( not ( = ?auto_1110736 ?auto_1110735 ) ) ( not ( = ?auto_1110736 ?auto_1110739 ) ) ( not ( = ?auto_1110736 ?auto_1110740 ) ) ( not ( = ?auto_1110736 ?auto_1110745 ) ) ( not ( = ?auto_1110737 ?auto_1110738 ) ) ( not ( = ?auto_1110737 ?auto_1110735 ) ) ( not ( = ?auto_1110737 ?auto_1110739 ) ) ( not ( = ?auto_1110737 ?auto_1110740 ) ) ( not ( = ?auto_1110737 ?auto_1110745 ) ) ( not ( = ?auto_1110738 ?auto_1110735 ) ) ( not ( = ?auto_1110738 ?auto_1110739 ) ) ( not ( = ?auto_1110738 ?auto_1110740 ) ) ( not ( = ?auto_1110738 ?auto_1110745 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1110735 ?auto_1110739 ?auto_1110740 )
      ( MAKE-5CRATE-VERIFY ?auto_1110736 ?auto_1110737 ?auto_1110738 ?auto_1110735 ?auto_1110739 ?auto_1110740 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1110787 - SURFACE
      ?auto_1110788 - SURFACE
      ?auto_1110789 - SURFACE
      ?auto_1110786 - SURFACE
      ?auto_1110790 - SURFACE
      ?auto_1110791 - SURFACE
    )
    :vars
    (
      ?auto_1110792 - HOIST
      ?auto_1110793 - PLACE
      ?auto_1110796 - PLACE
      ?auto_1110795 - HOIST
      ?auto_1110797 - SURFACE
      ?auto_1110794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1110792 ?auto_1110793 ) ( IS-CRATE ?auto_1110791 ) ( not ( = ?auto_1110790 ?auto_1110791 ) ) ( not ( = ?auto_1110786 ?auto_1110790 ) ) ( not ( = ?auto_1110786 ?auto_1110791 ) ) ( not ( = ?auto_1110796 ?auto_1110793 ) ) ( HOIST-AT ?auto_1110795 ?auto_1110796 ) ( not ( = ?auto_1110792 ?auto_1110795 ) ) ( AVAILABLE ?auto_1110795 ) ( SURFACE-AT ?auto_1110791 ?auto_1110796 ) ( ON ?auto_1110791 ?auto_1110797 ) ( CLEAR ?auto_1110791 ) ( not ( = ?auto_1110790 ?auto_1110797 ) ) ( not ( = ?auto_1110791 ?auto_1110797 ) ) ( not ( = ?auto_1110786 ?auto_1110797 ) ) ( TRUCK-AT ?auto_1110794 ?auto_1110793 ) ( SURFACE-AT ?auto_1110786 ?auto_1110793 ) ( CLEAR ?auto_1110786 ) ( LIFTING ?auto_1110792 ?auto_1110790 ) ( IS-CRATE ?auto_1110790 ) ( ON ?auto_1110788 ?auto_1110787 ) ( ON ?auto_1110789 ?auto_1110788 ) ( ON ?auto_1110786 ?auto_1110789 ) ( not ( = ?auto_1110787 ?auto_1110788 ) ) ( not ( = ?auto_1110787 ?auto_1110789 ) ) ( not ( = ?auto_1110787 ?auto_1110786 ) ) ( not ( = ?auto_1110787 ?auto_1110790 ) ) ( not ( = ?auto_1110787 ?auto_1110791 ) ) ( not ( = ?auto_1110787 ?auto_1110797 ) ) ( not ( = ?auto_1110788 ?auto_1110789 ) ) ( not ( = ?auto_1110788 ?auto_1110786 ) ) ( not ( = ?auto_1110788 ?auto_1110790 ) ) ( not ( = ?auto_1110788 ?auto_1110791 ) ) ( not ( = ?auto_1110788 ?auto_1110797 ) ) ( not ( = ?auto_1110789 ?auto_1110786 ) ) ( not ( = ?auto_1110789 ?auto_1110790 ) ) ( not ( = ?auto_1110789 ?auto_1110791 ) ) ( not ( = ?auto_1110789 ?auto_1110797 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1110786 ?auto_1110790 ?auto_1110791 )
      ( MAKE-5CRATE-VERIFY ?auto_1110787 ?auto_1110788 ?auto_1110789 ?auto_1110786 ?auto_1110790 ?auto_1110791 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1110838 - SURFACE
      ?auto_1110839 - SURFACE
      ?auto_1110840 - SURFACE
      ?auto_1110837 - SURFACE
      ?auto_1110841 - SURFACE
      ?auto_1110842 - SURFACE
    )
    :vars
    (
      ?auto_1110846 - HOIST
      ?auto_1110848 - PLACE
      ?auto_1110844 - PLACE
      ?auto_1110847 - HOIST
      ?auto_1110843 - SURFACE
      ?auto_1110845 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1110846 ?auto_1110848 ) ( IS-CRATE ?auto_1110842 ) ( not ( = ?auto_1110841 ?auto_1110842 ) ) ( not ( = ?auto_1110837 ?auto_1110841 ) ) ( not ( = ?auto_1110837 ?auto_1110842 ) ) ( not ( = ?auto_1110844 ?auto_1110848 ) ) ( HOIST-AT ?auto_1110847 ?auto_1110844 ) ( not ( = ?auto_1110846 ?auto_1110847 ) ) ( AVAILABLE ?auto_1110847 ) ( SURFACE-AT ?auto_1110842 ?auto_1110844 ) ( ON ?auto_1110842 ?auto_1110843 ) ( CLEAR ?auto_1110842 ) ( not ( = ?auto_1110841 ?auto_1110843 ) ) ( not ( = ?auto_1110842 ?auto_1110843 ) ) ( not ( = ?auto_1110837 ?auto_1110843 ) ) ( TRUCK-AT ?auto_1110845 ?auto_1110848 ) ( SURFACE-AT ?auto_1110837 ?auto_1110848 ) ( CLEAR ?auto_1110837 ) ( IS-CRATE ?auto_1110841 ) ( AVAILABLE ?auto_1110846 ) ( IN ?auto_1110841 ?auto_1110845 ) ( ON ?auto_1110839 ?auto_1110838 ) ( ON ?auto_1110840 ?auto_1110839 ) ( ON ?auto_1110837 ?auto_1110840 ) ( not ( = ?auto_1110838 ?auto_1110839 ) ) ( not ( = ?auto_1110838 ?auto_1110840 ) ) ( not ( = ?auto_1110838 ?auto_1110837 ) ) ( not ( = ?auto_1110838 ?auto_1110841 ) ) ( not ( = ?auto_1110838 ?auto_1110842 ) ) ( not ( = ?auto_1110838 ?auto_1110843 ) ) ( not ( = ?auto_1110839 ?auto_1110840 ) ) ( not ( = ?auto_1110839 ?auto_1110837 ) ) ( not ( = ?auto_1110839 ?auto_1110841 ) ) ( not ( = ?auto_1110839 ?auto_1110842 ) ) ( not ( = ?auto_1110839 ?auto_1110843 ) ) ( not ( = ?auto_1110840 ?auto_1110837 ) ) ( not ( = ?auto_1110840 ?auto_1110841 ) ) ( not ( = ?auto_1110840 ?auto_1110842 ) ) ( not ( = ?auto_1110840 ?auto_1110843 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1110837 ?auto_1110841 ?auto_1110842 )
      ( MAKE-5CRATE-VERIFY ?auto_1110838 ?auto_1110839 ?auto_1110840 ?auto_1110837 ?auto_1110841 ?auto_1110842 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1112047 - SURFACE
      ?auto_1112048 - SURFACE
      ?auto_1112049 - SURFACE
      ?auto_1112046 - SURFACE
      ?auto_1112050 - SURFACE
      ?auto_1112052 - SURFACE
      ?auto_1112051 - SURFACE
    )
    :vars
    (
      ?auto_1112054 - HOIST
      ?auto_1112053 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1112054 ?auto_1112053 ) ( SURFACE-AT ?auto_1112052 ?auto_1112053 ) ( CLEAR ?auto_1112052 ) ( LIFTING ?auto_1112054 ?auto_1112051 ) ( IS-CRATE ?auto_1112051 ) ( not ( = ?auto_1112052 ?auto_1112051 ) ) ( ON ?auto_1112048 ?auto_1112047 ) ( ON ?auto_1112049 ?auto_1112048 ) ( ON ?auto_1112046 ?auto_1112049 ) ( ON ?auto_1112050 ?auto_1112046 ) ( ON ?auto_1112052 ?auto_1112050 ) ( not ( = ?auto_1112047 ?auto_1112048 ) ) ( not ( = ?auto_1112047 ?auto_1112049 ) ) ( not ( = ?auto_1112047 ?auto_1112046 ) ) ( not ( = ?auto_1112047 ?auto_1112050 ) ) ( not ( = ?auto_1112047 ?auto_1112052 ) ) ( not ( = ?auto_1112047 ?auto_1112051 ) ) ( not ( = ?auto_1112048 ?auto_1112049 ) ) ( not ( = ?auto_1112048 ?auto_1112046 ) ) ( not ( = ?auto_1112048 ?auto_1112050 ) ) ( not ( = ?auto_1112048 ?auto_1112052 ) ) ( not ( = ?auto_1112048 ?auto_1112051 ) ) ( not ( = ?auto_1112049 ?auto_1112046 ) ) ( not ( = ?auto_1112049 ?auto_1112050 ) ) ( not ( = ?auto_1112049 ?auto_1112052 ) ) ( not ( = ?auto_1112049 ?auto_1112051 ) ) ( not ( = ?auto_1112046 ?auto_1112050 ) ) ( not ( = ?auto_1112046 ?auto_1112052 ) ) ( not ( = ?auto_1112046 ?auto_1112051 ) ) ( not ( = ?auto_1112050 ?auto_1112052 ) ) ( not ( = ?auto_1112050 ?auto_1112051 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1112052 ?auto_1112051 )
      ( MAKE-6CRATE-VERIFY ?auto_1112047 ?auto_1112048 ?auto_1112049 ?auto_1112046 ?auto_1112050 ?auto_1112052 ?auto_1112051 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1112091 - SURFACE
      ?auto_1112092 - SURFACE
      ?auto_1112093 - SURFACE
      ?auto_1112090 - SURFACE
      ?auto_1112094 - SURFACE
      ?auto_1112096 - SURFACE
      ?auto_1112095 - SURFACE
    )
    :vars
    (
      ?auto_1112098 - HOIST
      ?auto_1112099 - PLACE
      ?auto_1112097 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1112098 ?auto_1112099 ) ( SURFACE-AT ?auto_1112096 ?auto_1112099 ) ( CLEAR ?auto_1112096 ) ( IS-CRATE ?auto_1112095 ) ( not ( = ?auto_1112096 ?auto_1112095 ) ) ( TRUCK-AT ?auto_1112097 ?auto_1112099 ) ( AVAILABLE ?auto_1112098 ) ( IN ?auto_1112095 ?auto_1112097 ) ( ON ?auto_1112096 ?auto_1112094 ) ( not ( = ?auto_1112094 ?auto_1112096 ) ) ( not ( = ?auto_1112094 ?auto_1112095 ) ) ( ON ?auto_1112092 ?auto_1112091 ) ( ON ?auto_1112093 ?auto_1112092 ) ( ON ?auto_1112090 ?auto_1112093 ) ( ON ?auto_1112094 ?auto_1112090 ) ( not ( = ?auto_1112091 ?auto_1112092 ) ) ( not ( = ?auto_1112091 ?auto_1112093 ) ) ( not ( = ?auto_1112091 ?auto_1112090 ) ) ( not ( = ?auto_1112091 ?auto_1112094 ) ) ( not ( = ?auto_1112091 ?auto_1112096 ) ) ( not ( = ?auto_1112091 ?auto_1112095 ) ) ( not ( = ?auto_1112092 ?auto_1112093 ) ) ( not ( = ?auto_1112092 ?auto_1112090 ) ) ( not ( = ?auto_1112092 ?auto_1112094 ) ) ( not ( = ?auto_1112092 ?auto_1112096 ) ) ( not ( = ?auto_1112092 ?auto_1112095 ) ) ( not ( = ?auto_1112093 ?auto_1112090 ) ) ( not ( = ?auto_1112093 ?auto_1112094 ) ) ( not ( = ?auto_1112093 ?auto_1112096 ) ) ( not ( = ?auto_1112093 ?auto_1112095 ) ) ( not ( = ?auto_1112090 ?auto_1112094 ) ) ( not ( = ?auto_1112090 ?auto_1112096 ) ) ( not ( = ?auto_1112090 ?auto_1112095 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1112094 ?auto_1112096 ?auto_1112095 )
      ( MAKE-6CRATE-VERIFY ?auto_1112091 ?auto_1112092 ?auto_1112093 ?auto_1112090 ?auto_1112094 ?auto_1112096 ?auto_1112095 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1112142 - SURFACE
      ?auto_1112143 - SURFACE
      ?auto_1112144 - SURFACE
      ?auto_1112141 - SURFACE
      ?auto_1112145 - SURFACE
      ?auto_1112147 - SURFACE
      ?auto_1112146 - SURFACE
    )
    :vars
    (
      ?auto_1112150 - HOIST
      ?auto_1112149 - PLACE
      ?auto_1112148 - TRUCK
      ?auto_1112151 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1112150 ?auto_1112149 ) ( SURFACE-AT ?auto_1112147 ?auto_1112149 ) ( CLEAR ?auto_1112147 ) ( IS-CRATE ?auto_1112146 ) ( not ( = ?auto_1112147 ?auto_1112146 ) ) ( AVAILABLE ?auto_1112150 ) ( IN ?auto_1112146 ?auto_1112148 ) ( ON ?auto_1112147 ?auto_1112145 ) ( not ( = ?auto_1112145 ?auto_1112147 ) ) ( not ( = ?auto_1112145 ?auto_1112146 ) ) ( TRUCK-AT ?auto_1112148 ?auto_1112151 ) ( not ( = ?auto_1112151 ?auto_1112149 ) ) ( ON ?auto_1112143 ?auto_1112142 ) ( ON ?auto_1112144 ?auto_1112143 ) ( ON ?auto_1112141 ?auto_1112144 ) ( ON ?auto_1112145 ?auto_1112141 ) ( not ( = ?auto_1112142 ?auto_1112143 ) ) ( not ( = ?auto_1112142 ?auto_1112144 ) ) ( not ( = ?auto_1112142 ?auto_1112141 ) ) ( not ( = ?auto_1112142 ?auto_1112145 ) ) ( not ( = ?auto_1112142 ?auto_1112147 ) ) ( not ( = ?auto_1112142 ?auto_1112146 ) ) ( not ( = ?auto_1112143 ?auto_1112144 ) ) ( not ( = ?auto_1112143 ?auto_1112141 ) ) ( not ( = ?auto_1112143 ?auto_1112145 ) ) ( not ( = ?auto_1112143 ?auto_1112147 ) ) ( not ( = ?auto_1112143 ?auto_1112146 ) ) ( not ( = ?auto_1112144 ?auto_1112141 ) ) ( not ( = ?auto_1112144 ?auto_1112145 ) ) ( not ( = ?auto_1112144 ?auto_1112147 ) ) ( not ( = ?auto_1112144 ?auto_1112146 ) ) ( not ( = ?auto_1112141 ?auto_1112145 ) ) ( not ( = ?auto_1112141 ?auto_1112147 ) ) ( not ( = ?auto_1112141 ?auto_1112146 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1112145 ?auto_1112147 ?auto_1112146 )
      ( MAKE-6CRATE-VERIFY ?auto_1112142 ?auto_1112143 ?auto_1112144 ?auto_1112141 ?auto_1112145 ?auto_1112147 ?auto_1112146 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1112199 - SURFACE
      ?auto_1112200 - SURFACE
      ?auto_1112201 - SURFACE
      ?auto_1112198 - SURFACE
      ?auto_1112202 - SURFACE
      ?auto_1112204 - SURFACE
      ?auto_1112203 - SURFACE
    )
    :vars
    (
      ?auto_1112208 - HOIST
      ?auto_1112206 - PLACE
      ?auto_1112207 - TRUCK
      ?auto_1112209 - PLACE
      ?auto_1112205 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1112208 ?auto_1112206 ) ( SURFACE-AT ?auto_1112204 ?auto_1112206 ) ( CLEAR ?auto_1112204 ) ( IS-CRATE ?auto_1112203 ) ( not ( = ?auto_1112204 ?auto_1112203 ) ) ( AVAILABLE ?auto_1112208 ) ( ON ?auto_1112204 ?auto_1112202 ) ( not ( = ?auto_1112202 ?auto_1112204 ) ) ( not ( = ?auto_1112202 ?auto_1112203 ) ) ( TRUCK-AT ?auto_1112207 ?auto_1112209 ) ( not ( = ?auto_1112209 ?auto_1112206 ) ) ( HOIST-AT ?auto_1112205 ?auto_1112209 ) ( LIFTING ?auto_1112205 ?auto_1112203 ) ( not ( = ?auto_1112208 ?auto_1112205 ) ) ( ON ?auto_1112200 ?auto_1112199 ) ( ON ?auto_1112201 ?auto_1112200 ) ( ON ?auto_1112198 ?auto_1112201 ) ( ON ?auto_1112202 ?auto_1112198 ) ( not ( = ?auto_1112199 ?auto_1112200 ) ) ( not ( = ?auto_1112199 ?auto_1112201 ) ) ( not ( = ?auto_1112199 ?auto_1112198 ) ) ( not ( = ?auto_1112199 ?auto_1112202 ) ) ( not ( = ?auto_1112199 ?auto_1112204 ) ) ( not ( = ?auto_1112199 ?auto_1112203 ) ) ( not ( = ?auto_1112200 ?auto_1112201 ) ) ( not ( = ?auto_1112200 ?auto_1112198 ) ) ( not ( = ?auto_1112200 ?auto_1112202 ) ) ( not ( = ?auto_1112200 ?auto_1112204 ) ) ( not ( = ?auto_1112200 ?auto_1112203 ) ) ( not ( = ?auto_1112201 ?auto_1112198 ) ) ( not ( = ?auto_1112201 ?auto_1112202 ) ) ( not ( = ?auto_1112201 ?auto_1112204 ) ) ( not ( = ?auto_1112201 ?auto_1112203 ) ) ( not ( = ?auto_1112198 ?auto_1112202 ) ) ( not ( = ?auto_1112198 ?auto_1112204 ) ) ( not ( = ?auto_1112198 ?auto_1112203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1112202 ?auto_1112204 ?auto_1112203 )
      ( MAKE-6CRATE-VERIFY ?auto_1112199 ?auto_1112200 ?auto_1112201 ?auto_1112198 ?auto_1112202 ?auto_1112204 ?auto_1112203 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1112262 - SURFACE
      ?auto_1112263 - SURFACE
      ?auto_1112264 - SURFACE
      ?auto_1112261 - SURFACE
      ?auto_1112265 - SURFACE
      ?auto_1112267 - SURFACE
      ?auto_1112266 - SURFACE
    )
    :vars
    (
      ?auto_1112272 - HOIST
      ?auto_1112273 - PLACE
      ?auto_1112268 - TRUCK
      ?auto_1112270 - PLACE
      ?auto_1112269 - HOIST
      ?auto_1112271 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1112272 ?auto_1112273 ) ( SURFACE-AT ?auto_1112267 ?auto_1112273 ) ( CLEAR ?auto_1112267 ) ( IS-CRATE ?auto_1112266 ) ( not ( = ?auto_1112267 ?auto_1112266 ) ) ( AVAILABLE ?auto_1112272 ) ( ON ?auto_1112267 ?auto_1112265 ) ( not ( = ?auto_1112265 ?auto_1112267 ) ) ( not ( = ?auto_1112265 ?auto_1112266 ) ) ( TRUCK-AT ?auto_1112268 ?auto_1112270 ) ( not ( = ?auto_1112270 ?auto_1112273 ) ) ( HOIST-AT ?auto_1112269 ?auto_1112270 ) ( not ( = ?auto_1112272 ?auto_1112269 ) ) ( AVAILABLE ?auto_1112269 ) ( SURFACE-AT ?auto_1112266 ?auto_1112270 ) ( ON ?auto_1112266 ?auto_1112271 ) ( CLEAR ?auto_1112266 ) ( not ( = ?auto_1112267 ?auto_1112271 ) ) ( not ( = ?auto_1112266 ?auto_1112271 ) ) ( not ( = ?auto_1112265 ?auto_1112271 ) ) ( ON ?auto_1112263 ?auto_1112262 ) ( ON ?auto_1112264 ?auto_1112263 ) ( ON ?auto_1112261 ?auto_1112264 ) ( ON ?auto_1112265 ?auto_1112261 ) ( not ( = ?auto_1112262 ?auto_1112263 ) ) ( not ( = ?auto_1112262 ?auto_1112264 ) ) ( not ( = ?auto_1112262 ?auto_1112261 ) ) ( not ( = ?auto_1112262 ?auto_1112265 ) ) ( not ( = ?auto_1112262 ?auto_1112267 ) ) ( not ( = ?auto_1112262 ?auto_1112266 ) ) ( not ( = ?auto_1112262 ?auto_1112271 ) ) ( not ( = ?auto_1112263 ?auto_1112264 ) ) ( not ( = ?auto_1112263 ?auto_1112261 ) ) ( not ( = ?auto_1112263 ?auto_1112265 ) ) ( not ( = ?auto_1112263 ?auto_1112267 ) ) ( not ( = ?auto_1112263 ?auto_1112266 ) ) ( not ( = ?auto_1112263 ?auto_1112271 ) ) ( not ( = ?auto_1112264 ?auto_1112261 ) ) ( not ( = ?auto_1112264 ?auto_1112265 ) ) ( not ( = ?auto_1112264 ?auto_1112267 ) ) ( not ( = ?auto_1112264 ?auto_1112266 ) ) ( not ( = ?auto_1112264 ?auto_1112271 ) ) ( not ( = ?auto_1112261 ?auto_1112265 ) ) ( not ( = ?auto_1112261 ?auto_1112267 ) ) ( not ( = ?auto_1112261 ?auto_1112266 ) ) ( not ( = ?auto_1112261 ?auto_1112271 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1112265 ?auto_1112267 ?auto_1112266 )
      ( MAKE-6CRATE-VERIFY ?auto_1112262 ?auto_1112263 ?auto_1112264 ?auto_1112261 ?auto_1112265 ?auto_1112267 ?auto_1112266 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1112326 - SURFACE
      ?auto_1112327 - SURFACE
      ?auto_1112328 - SURFACE
      ?auto_1112325 - SURFACE
      ?auto_1112329 - SURFACE
      ?auto_1112331 - SURFACE
      ?auto_1112330 - SURFACE
    )
    :vars
    (
      ?auto_1112334 - HOIST
      ?auto_1112333 - PLACE
      ?auto_1112332 - PLACE
      ?auto_1112336 - HOIST
      ?auto_1112335 - SURFACE
      ?auto_1112337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1112334 ?auto_1112333 ) ( SURFACE-AT ?auto_1112331 ?auto_1112333 ) ( CLEAR ?auto_1112331 ) ( IS-CRATE ?auto_1112330 ) ( not ( = ?auto_1112331 ?auto_1112330 ) ) ( AVAILABLE ?auto_1112334 ) ( ON ?auto_1112331 ?auto_1112329 ) ( not ( = ?auto_1112329 ?auto_1112331 ) ) ( not ( = ?auto_1112329 ?auto_1112330 ) ) ( not ( = ?auto_1112332 ?auto_1112333 ) ) ( HOIST-AT ?auto_1112336 ?auto_1112332 ) ( not ( = ?auto_1112334 ?auto_1112336 ) ) ( AVAILABLE ?auto_1112336 ) ( SURFACE-AT ?auto_1112330 ?auto_1112332 ) ( ON ?auto_1112330 ?auto_1112335 ) ( CLEAR ?auto_1112330 ) ( not ( = ?auto_1112331 ?auto_1112335 ) ) ( not ( = ?auto_1112330 ?auto_1112335 ) ) ( not ( = ?auto_1112329 ?auto_1112335 ) ) ( TRUCK-AT ?auto_1112337 ?auto_1112333 ) ( ON ?auto_1112327 ?auto_1112326 ) ( ON ?auto_1112328 ?auto_1112327 ) ( ON ?auto_1112325 ?auto_1112328 ) ( ON ?auto_1112329 ?auto_1112325 ) ( not ( = ?auto_1112326 ?auto_1112327 ) ) ( not ( = ?auto_1112326 ?auto_1112328 ) ) ( not ( = ?auto_1112326 ?auto_1112325 ) ) ( not ( = ?auto_1112326 ?auto_1112329 ) ) ( not ( = ?auto_1112326 ?auto_1112331 ) ) ( not ( = ?auto_1112326 ?auto_1112330 ) ) ( not ( = ?auto_1112326 ?auto_1112335 ) ) ( not ( = ?auto_1112327 ?auto_1112328 ) ) ( not ( = ?auto_1112327 ?auto_1112325 ) ) ( not ( = ?auto_1112327 ?auto_1112329 ) ) ( not ( = ?auto_1112327 ?auto_1112331 ) ) ( not ( = ?auto_1112327 ?auto_1112330 ) ) ( not ( = ?auto_1112327 ?auto_1112335 ) ) ( not ( = ?auto_1112328 ?auto_1112325 ) ) ( not ( = ?auto_1112328 ?auto_1112329 ) ) ( not ( = ?auto_1112328 ?auto_1112331 ) ) ( not ( = ?auto_1112328 ?auto_1112330 ) ) ( not ( = ?auto_1112328 ?auto_1112335 ) ) ( not ( = ?auto_1112325 ?auto_1112329 ) ) ( not ( = ?auto_1112325 ?auto_1112331 ) ) ( not ( = ?auto_1112325 ?auto_1112330 ) ) ( not ( = ?auto_1112325 ?auto_1112335 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1112329 ?auto_1112331 ?auto_1112330 )
      ( MAKE-6CRATE-VERIFY ?auto_1112326 ?auto_1112327 ?auto_1112328 ?auto_1112325 ?auto_1112329 ?auto_1112331 ?auto_1112330 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1112390 - SURFACE
      ?auto_1112391 - SURFACE
      ?auto_1112392 - SURFACE
      ?auto_1112389 - SURFACE
      ?auto_1112393 - SURFACE
      ?auto_1112395 - SURFACE
      ?auto_1112394 - SURFACE
    )
    :vars
    (
      ?auto_1112400 - HOIST
      ?auto_1112396 - PLACE
      ?auto_1112399 - PLACE
      ?auto_1112401 - HOIST
      ?auto_1112398 - SURFACE
      ?auto_1112397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1112400 ?auto_1112396 ) ( IS-CRATE ?auto_1112394 ) ( not ( = ?auto_1112395 ?auto_1112394 ) ) ( not ( = ?auto_1112393 ?auto_1112395 ) ) ( not ( = ?auto_1112393 ?auto_1112394 ) ) ( not ( = ?auto_1112399 ?auto_1112396 ) ) ( HOIST-AT ?auto_1112401 ?auto_1112399 ) ( not ( = ?auto_1112400 ?auto_1112401 ) ) ( AVAILABLE ?auto_1112401 ) ( SURFACE-AT ?auto_1112394 ?auto_1112399 ) ( ON ?auto_1112394 ?auto_1112398 ) ( CLEAR ?auto_1112394 ) ( not ( = ?auto_1112395 ?auto_1112398 ) ) ( not ( = ?auto_1112394 ?auto_1112398 ) ) ( not ( = ?auto_1112393 ?auto_1112398 ) ) ( TRUCK-AT ?auto_1112397 ?auto_1112396 ) ( SURFACE-AT ?auto_1112393 ?auto_1112396 ) ( CLEAR ?auto_1112393 ) ( LIFTING ?auto_1112400 ?auto_1112395 ) ( IS-CRATE ?auto_1112395 ) ( ON ?auto_1112391 ?auto_1112390 ) ( ON ?auto_1112392 ?auto_1112391 ) ( ON ?auto_1112389 ?auto_1112392 ) ( ON ?auto_1112393 ?auto_1112389 ) ( not ( = ?auto_1112390 ?auto_1112391 ) ) ( not ( = ?auto_1112390 ?auto_1112392 ) ) ( not ( = ?auto_1112390 ?auto_1112389 ) ) ( not ( = ?auto_1112390 ?auto_1112393 ) ) ( not ( = ?auto_1112390 ?auto_1112395 ) ) ( not ( = ?auto_1112390 ?auto_1112394 ) ) ( not ( = ?auto_1112390 ?auto_1112398 ) ) ( not ( = ?auto_1112391 ?auto_1112392 ) ) ( not ( = ?auto_1112391 ?auto_1112389 ) ) ( not ( = ?auto_1112391 ?auto_1112393 ) ) ( not ( = ?auto_1112391 ?auto_1112395 ) ) ( not ( = ?auto_1112391 ?auto_1112394 ) ) ( not ( = ?auto_1112391 ?auto_1112398 ) ) ( not ( = ?auto_1112392 ?auto_1112389 ) ) ( not ( = ?auto_1112392 ?auto_1112393 ) ) ( not ( = ?auto_1112392 ?auto_1112395 ) ) ( not ( = ?auto_1112392 ?auto_1112394 ) ) ( not ( = ?auto_1112392 ?auto_1112398 ) ) ( not ( = ?auto_1112389 ?auto_1112393 ) ) ( not ( = ?auto_1112389 ?auto_1112395 ) ) ( not ( = ?auto_1112389 ?auto_1112394 ) ) ( not ( = ?auto_1112389 ?auto_1112398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1112393 ?auto_1112395 ?auto_1112394 )
      ( MAKE-6CRATE-VERIFY ?auto_1112390 ?auto_1112391 ?auto_1112392 ?auto_1112389 ?auto_1112393 ?auto_1112395 ?auto_1112394 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1112454 - SURFACE
      ?auto_1112455 - SURFACE
      ?auto_1112456 - SURFACE
      ?auto_1112453 - SURFACE
      ?auto_1112457 - SURFACE
      ?auto_1112459 - SURFACE
      ?auto_1112458 - SURFACE
    )
    :vars
    (
      ?auto_1112465 - HOIST
      ?auto_1112463 - PLACE
      ?auto_1112460 - PLACE
      ?auto_1112462 - HOIST
      ?auto_1112461 - SURFACE
      ?auto_1112464 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1112465 ?auto_1112463 ) ( IS-CRATE ?auto_1112458 ) ( not ( = ?auto_1112459 ?auto_1112458 ) ) ( not ( = ?auto_1112457 ?auto_1112459 ) ) ( not ( = ?auto_1112457 ?auto_1112458 ) ) ( not ( = ?auto_1112460 ?auto_1112463 ) ) ( HOIST-AT ?auto_1112462 ?auto_1112460 ) ( not ( = ?auto_1112465 ?auto_1112462 ) ) ( AVAILABLE ?auto_1112462 ) ( SURFACE-AT ?auto_1112458 ?auto_1112460 ) ( ON ?auto_1112458 ?auto_1112461 ) ( CLEAR ?auto_1112458 ) ( not ( = ?auto_1112459 ?auto_1112461 ) ) ( not ( = ?auto_1112458 ?auto_1112461 ) ) ( not ( = ?auto_1112457 ?auto_1112461 ) ) ( TRUCK-AT ?auto_1112464 ?auto_1112463 ) ( SURFACE-AT ?auto_1112457 ?auto_1112463 ) ( CLEAR ?auto_1112457 ) ( IS-CRATE ?auto_1112459 ) ( AVAILABLE ?auto_1112465 ) ( IN ?auto_1112459 ?auto_1112464 ) ( ON ?auto_1112455 ?auto_1112454 ) ( ON ?auto_1112456 ?auto_1112455 ) ( ON ?auto_1112453 ?auto_1112456 ) ( ON ?auto_1112457 ?auto_1112453 ) ( not ( = ?auto_1112454 ?auto_1112455 ) ) ( not ( = ?auto_1112454 ?auto_1112456 ) ) ( not ( = ?auto_1112454 ?auto_1112453 ) ) ( not ( = ?auto_1112454 ?auto_1112457 ) ) ( not ( = ?auto_1112454 ?auto_1112459 ) ) ( not ( = ?auto_1112454 ?auto_1112458 ) ) ( not ( = ?auto_1112454 ?auto_1112461 ) ) ( not ( = ?auto_1112455 ?auto_1112456 ) ) ( not ( = ?auto_1112455 ?auto_1112453 ) ) ( not ( = ?auto_1112455 ?auto_1112457 ) ) ( not ( = ?auto_1112455 ?auto_1112459 ) ) ( not ( = ?auto_1112455 ?auto_1112458 ) ) ( not ( = ?auto_1112455 ?auto_1112461 ) ) ( not ( = ?auto_1112456 ?auto_1112453 ) ) ( not ( = ?auto_1112456 ?auto_1112457 ) ) ( not ( = ?auto_1112456 ?auto_1112459 ) ) ( not ( = ?auto_1112456 ?auto_1112458 ) ) ( not ( = ?auto_1112456 ?auto_1112461 ) ) ( not ( = ?auto_1112453 ?auto_1112457 ) ) ( not ( = ?auto_1112453 ?auto_1112459 ) ) ( not ( = ?auto_1112453 ?auto_1112458 ) ) ( not ( = ?auto_1112453 ?auto_1112461 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1112457 ?auto_1112459 ?auto_1112458 )
      ( MAKE-6CRATE-VERIFY ?auto_1112454 ?auto_1112455 ?auto_1112456 ?auto_1112453 ?auto_1112457 ?auto_1112459 ?auto_1112458 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1114410 - SURFACE
      ?auto_1114411 - SURFACE
      ?auto_1114412 - SURFACE
      ?auto_1114409 - SURFACE
      ?auto_1114413 - SURFACE
      ?auto_1114415 - SURFACE
      ?auto_1114414 - SURFACE
      ?auto_1114416 - SURFACE
    )
    :vars
    (
      ?auto_1114418 - HOIST
      ?auto_1114417 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1114418 ?auto_1114417 ) ( SURFACE-AT ?auto_1114414 ?auto_1114417 ) ( CLEAR ?auto_1114414 ) ( LIFTING ?auto_1114418 ?auto_1114416 ) ( IS-CRATE ?auto_1114416 ) ( not ( = ?auto_1114414 ?auto_1114416 ) ) ( ON ?auto_1114411 ?auto_1114410 ) ( ON ?auto_1114412 ?auto_1114411 ) ( ON ?auto_1114409 ?auto_1114412 ) ( ON ?auto_1114413 ?auto_1114409 ) ( ON ?auto_1114415 ?auto_1114413 ) ( ON ?auto_1114414 ?auto_1114415 ) ( not ( = ?auto_1114410 ?auto_1114411 ) ) ( not ( = ?auto_1114410 ?auto_1114412 ) ) ( not ( = ?auto_1114410 ?auto_1114409 ) ) ( not ( = ?auto_1114410 ?auto_1114413 ) ) ( not ( = ?auto_1114410 ?auto_1114415 ) ) ( not ( = ?auto_1114410 ?auto_1114414 ) ) ( not ( = ?auto_1114410 ?auto_1114416 ) ) ( not ( = ?auto_1114411 ?auto_1114412 ) ) ( not ( = ?auto_1114411 ?auto_1114409 ) ) ( not ( = ?auto_1114411 ?auto_1114413 ) ) ( not ( = ?auto_1114411 ?auto_1114415 ) ) ( not ( = ?auto_1114411 ?auto_1114414 ) ) ( not ( = ?auto_1114411 ?auto_1114416 ) ) ( not ( = ?auto_1114412 ?auto_1114409 ) ) ( not ( = ?auto_1114412 ?auto_1114413 ) ) ( not ( = ?auto_1114412 ?auto_1114415 ) ) ( not ( = ?auto_1114412 ?auto_1114414 ) ) ( not ( = ?auto_1114412 ?auto_1114416 ) ) ( not ( = ?auto_1114409 ?auto_1114413 ) ) ( not ( = ?auto_1114409 ?auto_1114415 ) ) ( not ( = ?auto_1114409 ?auto_1114414 ) ) ( not ( = ?auto_1114409 ?auto_1114416 ) ) ( not ( = ?auto_1114413 ?auto_1114415 ) ) ( not ( = ?auto_1114413 ?auto_1114414 ) ) ( not ( = ?auto_1114413 ?auto_1114416 ) ) ( not ( = ?auto_1114415 ?auto_1114414 ) ) ( not ( = ?auto_1114415 ?auto_1114416 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1114414 ?auto_1114416 )
      ( MAKE-7CRATE-VERIFY ?auto_1114410 ?auto_1114411 ?auto_1114412 ?auto_1114409 ?auto_1114413 ?auto_1114415 ?auto_1114414 ?auto_1114416 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1114465 - SURFACE
      ?auto_1114466 - SURFACE
      ?auto_1114467 - SURFACE
      ?auto_1114464 - SURFACE
      ?auto_1114468 - SURFACE
      ?auto_1114470 - SURFACE
      ?auto_1114469 - SURFACE
      ?auto_1114471 - SURFACE
    )
    :vars
    (
      ?auto_1114473 - HOIST
      ?auto_1114474 - PLACE
      ?auto_1114472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1114473 ?auto_1114474 ) ( SURFACE-AT ?auto_1114469 ?auto_1114474 ) ( CLEAR ?auto_1114469 ) ( IS-CRATE ?auto_1114471 ) ( not ( = ?auto_1114469 ?auto_1114471 ) ) ( TRUCK-AT ?auto_1114472 ?auto_1114474 ) ( AVAILABLE ?auto_1114473 ) ( IN ?auto_1114471 ?auto_1114472 ) ( ON ?auto_1114469 ?auto_1114470 ) ( not ( = ?auto_1114470 ?auto_1114469 ) ) ( not ( = ?auto_1114470 ?auto_1114471 ) ) ( ON ?auto_1114466 ?auto_1114465 ) ( ON ?auto_1114467 ?auto_1114466 ) ( ON ?auto_1114464 ?auto_1114467 ) ( ON ?auto_1114468 ?auto_1114464 ) ( ON ?auto_1114470 ?auto_1114468 ) ( not ( = ?auto_1114465 ?auto_1114466 ) ) ( not ( = ?auto_1114465 ?auto_1114467 ) ) ( not ( = ?auto_1114465 ?auto_1114464 ) ) ( not ( = ?auto_1114465 ?auto_1114468 ) ) ( not ( = ?auto_1114465 ?auto_1114470 ) ) ( not ( = ?auto_1114465 ?auto_1114469 ) ) ( not ( = ?auto_1114465 ?auto_1114471 ) ) ( not ( = ?auto_1114466 ?auto_1114467 ) ) ( not ( = ?auto_1114466 ?auto_1114464 ) ) ( not ( = ?auto_1114466 ?auto_1114468 ) ) ( not ( = ?auto_1114466 ?auto_1114470 ) ) ( not ( = ?auto_1114466 ?auto_1114469 ) ) ( not ( = ?auto_1114466 ?auto_1114471 ) ) ( not ( = ?auto_1114467 ?auto_1114464 ) ) ( not ( = ?auto_1114467 ?auto_1114468 ) ) ( not ( = ?auto_1114467 ?auto_1114470 ) ) ( not ( = ?auto_1114467 ?auto_1114469 ) ) ( not ( = ?auto_1114467 ?auto_1114471 ) ) ( not ( = ?auto_1114464 ?auto_1114468 ) ) ( not ( = ?auto_1114464 ?auto_1114470 ) ) ( not ( = ?auto_1114464 ?auto_1114469 ) ) ( not ( = ?auto_1114464 ?auto_1114471 ) ) ( not ( = ?auto_1114468 ?auto_1114470 ) ) ( not ( = ?auto_1114468 ?auto_1114469 ) ) ( not ( = ?auto_1114468 ?auto_1114471 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1114470 ?auto_1114469 ?auto_1114471 )
      ( MAKE-7CRATE-VERIFY ?auto_1114465 ?auto_1114466 ?auto_1114467 ?auto_1114464 ?auto_1114468 ?auto_1114470 ?auto_1114469 ?auto_1114471 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1114528 - SURFACE
      ?auto_1114529 - SURFACE
      ?auto_1114530 - SURFACE
      ?auto_1114527 - SURFACE
      ?auto_1114531 - SURFACE
      ?auto_1114533 - SURFACE
      ?auto_1114532 - SURFACE
      ?auto_1114534 - SURFACE
    )
    :vars
    (
      ?auto_1114538 - HOIST
      ?auto_1114536 - PLACE
      ?auto_1114535 - TRUCK
      ?auto_1114537 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1114538 ?auto_1114536 ) ( SURFACE-AT ?auto_1114532 ?auto_1114536 ) ( CLEAR ?auto_1114532 ) ( IS-CRATE ?auto_1114534 ) ( not ( = ?auto_1114532 ?auto_1114534 ) ) ( AVAILABLE ?auto_1114538 ) ( IN ?auto_1114534 ?auto_1114535 ) ( ON ?auto_1114532 ?auto_1114533 ) ( not ( = ?auto_1114533 ?auto_1114532 ) ) ( not ( = ?auto_1114533 ?auto_1114534 ) ) ( TRUCK-AT ?auto_1114535 ?auto_1114537 ) ( not ( = ?auto_1114537 ?auto_1114536 ) ) ( ON ?auto_1114529 ?auto_1114528 ) ( ON ?auto_1114530 ?auto_1114529 ) ( ON ?auto_1114527 ?auto_1114530 ) ( ON ?auto_1114531 ?auto_1114527 ) ( ON ?auto_1114533 ?auto_1114531 ) ( not ( = ?auto_1114528 ?auto_1114529 ) ) ( not ( = ?auto_1114528 ?auto_1114530 ) ) ( not ( = ?auto_1114528 ?auto_1114527 ) ) ( not ( = ?auto_1114528 ?auto_1114531 ) ) ( not ( = ?auto_1114528 ?auto_1114533 ) ) ( not ( = ?auto_1114528 ?auto_1114532 ) ) ( not ( = ?auto_1114528 ?auto_1114534 ) ) ( not ( = ?auto_1114529 ?auto_1114530 ) ) ( not ( = ?auto_1114529 ?auto_1114527 ) ) ( not ( = ?auto_1114529 ?auto_1114531 ) ) ( not ( = ?auto_1114529 ?auto_1114533 ) ) ( not ( = ?auto_1114529 ?auto_1114532 ) ) ( not ( = ?auto_1114529 ?auto_1114534 ) ) ( not ( = ?auto_1114530 ?auto_1114527 ) ) ( not ( = ?auto_1114530 ?auto_1114531 ) ) ( not ( = ?auto_1114530 ?auto_1114533 ) ) ( not ( = ?auto_1114530 ?auto_1114532 ) ) ( not ( = ?auto_1114530 ?auto_1114534 ) ) ( not ( = ?auto_1114527 ?auto_1114531 ) ) ( not ( = ?auto_1114527 ?auto_1114533 ) ) ( not ( = ?auto_1114527 ?auto_1114532 ) ) ( not ( = ?auto_1114527 ?auto_1114534 ) ) ( not ( = ?auto_1114531 ?auto_1114533 ) ) ( not ( = ?auto_1114531 ?auto_1114532 ) ) ( not ( = ?auto_1114531 ?auto_1114534 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1114533 ?auto_1114532 ?auto_1114534 )
      ( MAKE-7CRATE-VERIFY ?auto_1114528 ?auto_1114529 ?auto_1114530 ?auto_1114527 ?auto_1114531 ?auto_1114533 ?auto_1114532 ?auto_1114534 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1114598 - SURFACE
      ?auto_1114599 - SURFACE
      ?auto_1114600 - SURFACE
      ?auto_1114597 - SURFACE
      ?auto_1114601 - SURFACE
      ?auto_1114603 - SURFACE
      ?auto_1114602 - SURFACE
      ?auto_1114604 - SURFACE
    )
    :vars
    (
      ?auto_1114607 - HOIST
      ?auto_1114608 - PLACE
      ?auto_1114606 - TRUCK
      ?auto_1114609 - PLACE
      ?auto_1114605 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1114607 ?auto_1114608 ) ( SURFACE-AT ?auto_1114602 ?auto_1114608 ) ( CLEAR ?auto_1114602 ) ( IS-CRATE ?auto_1114604 ) ( not ( = ?auto_1114602 ?auto_1114604 ) ) ( AVAILABLE ?auto_1114607 ) ( ON ?auto_1114602 ?auto_1114603 ) ( not ( = ?auto_1114603 ?auto_1114602 ) ) ( not ( = ?auto_1114603 ?auto_1114604 ) ) ( TRUCK-AT ?auto_1114606 ?auto_1114609 ) ( not ( = ?auto_1114609 ?auto_1114608 ) ) ( HOIST-AT ?auto_1114605 ?auto_1114609 ) ( LIFTING ?auto_1114605 ?auto_1114604 ) ( not ( = ?auto_1114607 ?auto_1114605 ) ) ( ON ?auto_1114599 ?auto_1114598 ) ( ON ?auto_1114600 ?auto_1114599 ) ( ON ?auto_1114597 ?auto_1114600 ) ( ON ?auto_1114601 ?auto_1114597 ) ( ON ?auto_1114603 ?auto_1114601 ) ( not ( = ?auto_1114598 ?auto_1114599 ) ) ( not ( = ?auto_1114598 ?auto_1114600 ) ) ( not ( = ?auto_1114598 ?auto_1114597 ) ) ( not ( = ?auto_1114598 ?auto_1114601 ) ) ( not ( = ?auto_1114598 ?auto_1114603 ) ) ( not ( = ?auto_1114598 ?auto_1114602 ) ) ( not ( = ?auto_1114598 ?auto_1114604 ) ) ( not ( = ?auto_1114599 ?auto_1114600 ) ) ( not ( = ?auto_1114599 ?auto_1114597 ) ) ( not ( = ?auto_1114599 ?auto_1114601 ) ) ( not ( = ?auto_1114599 ?auto_1114603 ) ) ( not ( = ?auto_1114599 ?auto_1114602 ) ) ( not ( = ?auto_1114599 ?auto_1114604 ) ) ( not ( = ?auto_1114600 ?auto_1114597 ) ) ( not ( = ?auto_1114600 ?auto_1114601 ) ) ( not ( = ?auto_1114600 ?auto_1114603 ) ) ( not ( = ?auto_1114600 ?auto_1114602 ) ) ( not ( = ?auto_1114600 ?auto_1114604 ) ) ( not ( = ?auto_1114597 ?auto_1114601 ) ) ( not ( = ?auto_1114597 ?auto_1114603 ) ) ( not ( = ?auto_1114597 ?auto_1114602 ) ) ( not ( = ?auto_1114597 ?auto_1114604 ) ) ( not ( = ?auto_1114601 ?auto_1114603 ) ) ( not ( = ?auto_1114601 ?auto_1114602 ) ) ( not ( = ?auto_1114601 ?auto_1114604 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1114603 ?auto_1114602 ?auto_1114604 )
      ( MAKE-7CRATE-VERIFY ?auto_1114598 ?auto_1114599 ?auto_1114600 ?auto_1114597 ?auto_1114601 ?auto_1114603 ?auto_1114602 ?auto_1114604 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1114675 - SURFACE
      ?auto_1114676 - SURFACE
      ?auto_1114677 - SURFACE
      ?auto_1114674 - SURFACE
      ?auto_1114678 - SURFACE
      ?auto_1114680 - SURFACE
      ?auto_1114679 - SURFACE
      ?auto_1114681 - SURFACE
    )
    :vars
    (
      ?auto_1114686 - HOIST
      ?auto_1114685 - PLACE
      ?auto_1114682 - TRUCK
      ?auto_1114684 - PLACE
      ?auto_1114687 - HOIST
      ?auto_1114683 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1114686 ?auto_1114685 ) ( SURFACE-AT ?auto_1114679 ?auto_1114685 ) ( CLEAR ?auto_1114679 ) ( IS-CRATE ?auto_1114681 ) ( not ( = ?auto_1114679 ?auto_1114681 ) ) ( AVAILABLE ?auto_1114686 ) ( ON ?auto_1114679 ?auto_1114680 ) ( not ( = ?auto_1114680 ?auto_1114679 ) ) ( not ( = ?auto_1114680 ?auto_1114681 ) ) ( TRUCK-AT ?auto_1114682 ?auto_1114684 ) ( not ( = ?auto_1114684 ?auto_1114685 ) ) ( HOIST-AT ?auto_1114687 ?auto_1114684 ) ( not ( = ?auto_1114686 ?auto_1114687 ) ) ( AVAILABLE ?auto_1114687 ) ( SURFACE-AT ?auto_1114681 ?auto_1114684 ) ( ON ?auto_1114681 ?auto_1114683 ) ( CLEAR ?auto_1114681 ) ( not ( = ?auto_1114679 ?auto_1114683 ) ) ( not ( = ?auto_1114681 ?auto_1114683 ) ) ( not ( = ?auto_1114680 ?auto_1114683 ) ) ( ON ?auto_1114676 ?auto_1114675 ) ( ON ?auto_1114677 ?auto_1114676 ) ( ON ?auto_1114674 ?auto_1114677 ) ( ON ?auto_1114678 ?auto_1114674 ) ( ON ?auto_1114680 ?auto_1114678 ) ( not ( = ?auto_1114675 ?auto_1114676 ) ) ( not ( = ?auto_1114675 ?auto_1114677 ) ) ( not ( = ?auto_1114675 ?auto_1114674 ) ) ( not ( = ?auto_1114675 ?auto_1114678 ) ) ( not ( = ?auto_1114675 ?auto_1114680 ) ) ( not ( = ?auto_1114675 ?auto_1114679 ) ) ( not ( = ?auto_1114675 ?auto_1114681 ) ) ( not ( = ?auto_1114675 ?auto_1114683 ) ) ( not ( = ?auto_1114676 ?auto_1114677 ) ) ( not ( = ?auto_1114676 ?auto_1114674 ) ) ( not ( = ?auto_1114676 ?auto_1114678 ) ) ( not ( = ?auto_1114676 ?auto_1114680 ) ) ( not ( = ?auto_1114676 ?auto_1114679 ) ) ( not ( = ?auto_1114676 ?auto_1114681 ) ) ( not ( = ?auto_1114676 ?auto_1114683 ) ) ( not ( = ?auto_1114677 ?auto_1114674 ) ) ( not ( = ?auto_1114677 ?auto_1114678 ) ) ( not ( = ?auto_1114677 ?auto_1114680 ) ) ( not ( = ?auto_1114677 ?auto_1114679 ) ) ( not ( = ?auto_1114677 ?auto_1114681 ) ) ( not ( = ?auto_1114677 ?auto_1114683 ) ) ( not ( = ?auto_1114674 ?auto_1114678 ) ) ( not ( = ?auto_1114674 ?auto_1114680 ) ) ( not ( = ?auto_1114674 ?auto_1114679 ) ) ( not ( = ?auto_1114674 ?auto_1114681 ) ) ( not ( = ?auto_1114674 ?auto_1114683 ) ) ( not ( = ?auto_1114678 ?auto_1114680 ) ) ( not ( = ?auto_1114678 ?auto_1114679 ) ) ( not ( = ?auto_1114678 ?auto_1114681 ) ) ( not ( = ?auto_1114678 ?auto_1114683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1114680 ?auto_1114679 ?auto_1114681 )
      ( MAKE-7CRATE-VERIFY ?auto_1114675 ?auto_1114676 ?auto_1114677 ?auto_1114674 ?auto_1114678 ?auto_1114680 ?auto_1114679 ?auto_1114681 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1114753 - SURFACE
      ?auto_1114754 - SURFACE
      ?auto_1114755 - SURFACE
      ?auto_1114752 - SURFACE
      ?auto_1114756 - SURFACE
      ?auto_1114758 - SURFACE
      ?auto_1114757 - SURFACE
      ?auto_1114759 - SURFACE
    )
    :vars
    (
      ?auto_1114761 - HOIST
      ?auto_1114762 - PLACE
      ?auto_1114764 - PLACE
      ?auto_1114765 - HOIST
      ?auto_1114763 - SURFACE
      ?auto_1114760 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1114761 ?auto_1114762 ) ( SURFACE-AT ?auto_1114757 ?auto_1114762 ) ( CLEAR ?auto_1114757 ) ( IS-CRATE ?auto_1114759 ) ( not ( = ?auto_1114757 ?auto_1114759 ) ) ( AVAILABLE ?auto_1114761 ) ( ON ?auto_1114757 ?auto_1114758 ) ( not ( = ?auto_1114758 ?auto_1114757 ) ) ( not ( = ?auto_1114758 ?auto_1114759 ) ) ( not ( = ?auto_1114764 ?auto_1114762 ) ) ( HOIST-AT ?auto_1114765 ?auto_1114764 ) ( not ( = ?auto_1114761 ?auto_1114765 ) ) ( AVAILABLE ?auto_1114765 ) ( SURFACE-AT ?auto_1114759 ?auto_1114764 ) ( ON ?auto_1114759 ?auto_1114763 ) ( CLEAR ?auto_1114759 ) ( not ( = ?auto_1114757 ?auto_1114763 ) ) ( not ( = ?auto_1114759 ?auto_1114763 ) ) ( not ( = ?auto_1114758 ?auto_1114763 ) ) ( TRUCK-AT ?auto_1114760 ?auto_1114762 ) ( ON ?auto_1114754 ?auto_1114753 ) ( ON ?auto_1114755 ?auto_1114754 ) ( ON ?auto_1114752 ?auto_1114755 ) ( ON ?auto_1114756 ?auto_1114752 ) ( ON ?auto_1114758 ?auto_1114756 ) ( not ( = ?auto_1114753 ?auto_1114754 ) ) ( not ( = ?auto_1114753 ?auto_1114755 ) ) ( not ( = ?auto_1114753 ?auto_1114752 ) ) ( not ( = ?auto_1114753 ?auto_1114756 ) ) ( not ( = ?auto_1114753 ?auto_1114758 ) ) ( not ( = ?auto_1114753 ?auto_1114757 ) ) ( not ( = ?auto_1114753 ?auto_1114759 ) ) ( not ( = ?auto_1114753 ?auto_1114763 ) ) ( not ( = ?auto_1114754 ?auto_1114755 ) ) ( not ( = ?auto_1114754 ?auto_1114752 ) ) ( not ( = ?auto_1114754 ?auto_1114756 ) ) ( not ( = ?auto_1114754 ?auto_1114758 ) ) ( not ( = ?auto_1114754 ?auto_1114757 ) ) ( not ( = ?auto_1114754 ?auto_1114759 ) ) ( not ( = ?auto_1114754 ?auto_1114763 ) ) ( not ( = ?auto_1114755 ?auto_1114752 ) ) ( not ( = ?auto_1114755 ?auto_1114756 ) ) ( not ( = ?auto_1114755 ?auto_1114758 ) ) ( not ( = ?auto_1114755 ?auto_1114757 ) ) ( not ( = ?auto_1114755 ?auto_1114759 ) ) ( not ( = ?auto_1114755 ?auto_1114763 ) ) ( not ( = ?auto_1114752 ?auto_1114756 ) ) ( not ( = ?auto_1114752 ?auto_1114758 ) ) ( not ( = ?auto_1114752 ?auto_1114757 ) ) ( not ( = ?auto_1114752 ?auto_1114759 ) ) ( not ( = ?auto_1114752 ?auto_1114763 ) ) ( not ( = ?auto_1114756 ?auto_1114758 ) ) ( not ( = ?auto_1114756 ?auto_1114757 ) ) ( not ( = ?auto_1114756 ?auto_1114759 ) ) ( not ( = ?auto_1114756 ?auto_1114763 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1114758 ?auto_1114757 ?auto_1114759 )
      ( MAKE-7CRATE-VERIFY ?auto_1114753 ?auto_1114754 ?auto_1114755 ?auto_1114752 ?auto_1114756 ?auto_1114758 ?auto_1114757 ?auto_1114759 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1114831 - SURFACE
      ?auto_1114832 - SURFACE
      ?auto_1114833 - SURFACE
      ?auto_1114830 - SURFACE
      ?auto_1114834 - SURFACE
      ?auto_1114836 - SURFACE
      ?auto_1114835 - SURFACE
      ?auto_1114837 - SURFACE
    )
    :vars
    (
      ?auto_1114840 - HOIST
      ?auto_1114839 - PLACE
      ?auto_1114841 - PLACE
      ?auto_1114843 - HOIST
      ?auto_1114842 - SURFACE
      ?auto_1114838 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1114840 ?auto_1114839 ) ( IS-CRATE ?auto_1114837 ) ( not ( = ?auto_1114835 ?auto_1114837 ) ) ( not ( = ?auto_1114836 ?auto_1114835 ) ) ( not ( = ?auto_1114836 ?auto_1114837 ) ) ( not ( = ?auto_1114841 ?auto_1114839 ) ) ( HOIST-AT ?auto_1114843 ?auto_1114841 ) ( not ( = ?auto_1114840 ?auto_1114843 ) ) ( AVAILABLE ?auto_1114843 ) ( SURFACE-AT ?auto_1114837 ?auto_1114841 ) ( ON ?auto_1114837 ?auto_1114842 ) ( CLEAR ?auto_1114837 ) ( not ( = ?auto_1114835 ?auto_1114842 ) ) ( not ( = ?auto_1114837 ?auto_1114842 ) ) ( not ( = ?auto_1114836 ?auto_1114842 ) ) ( TRUCK-AT ?auto_1114838 ?auto_1114839 ) ( SURFACE-AT ?auto_1114836 ?auto_1114839 ) ( CLEAR ?auto_1114836 ) ( LIFTING ?auto_1114840 ?auto_1114835 ) ( IS-CRATE ?auto_1114835 ) ( ON ?auto_1114832 ?auto_1114831 ) ( ON ?auto_1114833 ?auto_1114832 ) ( ON ?auto_1114830 ?auto_1114833 ) ( ON ?auto_1114834 ?auto_1114830 ) ( ON ?auto_1114836 ?auto_1114834 ) ( not ( = ?auto_1114831 ?auto_1114832 ) ) ( not ( = ?auto_1114831 ?auto_1114833 ) ) ( not ( = ?auto_1114831 ?auto_1114830 ) ) ( not ( = ?auto_1114831 ?auto_1114834 ) ) ( not ( = ?auto_1114831 ?auto_1114836 ) ) ( not ( = ?auto_1114831 ?auto_1114835 ) ) ( not ( = ?auto_1114831 ?auto_1114837 ) ) ( not ( = ?auto_1114831 ?auto_1114842 ) ) ( not ( = ?auto_1114832 ?auto_1114833 ) ) ( not ( = ?auto_1114832 ?auto_1114830 ) ) ( not ( = ?auto_1114832 ?auto_1114834 ) ) ( not ( = ?auto_1114832 ?auto_1114836 ) ) ( not ( = ?auto_1114832 ?auto_1114835 ) ) ( not ( = ?auto_1114832 ?auto_1114837 ) ) ( not ( = ?auto_1114832 ?auto_1114842 ) ) ( not ( = ?auto_1114833 ?auto_1114830 ) ) ( not ( = ?auto_1114833 ?auto_1114834 ) ) ( not ( = ?auto_1114833 ?auto_1114836 ) ) ( not ( = ?auto_1114833 ?auto_1114835 ) ) ( not ( = ?auto_1114833 ?auto_1114837 ) ) ( not ( = ?auto_1114833 ?auto_1114842 ) ) ( not ( = ?auto_1114830 ?auto_1114834 ) ) ( not ( = ?auto_1114830 ?auto_1114836 ) ) ( not ( = ?auto_1114830 ?auto_1114835 ) ) ( not ( = ?auto_1114830 ?auto_1114837 ) ) ( not ( = ?auto_1114830 ?auto_1114842 ) ) ( not ( = ?auto_1114834 ?auto_1114836 ) ) ( not ( = ?auto_1114834 ?auto_1114835 ) ) ( not ( = ?auto_1114834 ?auto_1114837 ) ) ( not ( = ?auto_1114834 ?auto_1114842 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1114836 ?auto_1114835 ?auto_1114837 )
      ( MAKE-7CRATE-VERIFY ?auto_1114831 ?auto_1114832 ?auto_1114833 ?auto_1114830 ?auto_1114834 ?auto_1114836 ?auto_1114835 ?auto_1114837 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1114909 - SURFACE
      ?auto_1114910 - SURFACE
      ?auto_1114911 - SURFACE
      ?auto_1114908 - SURFACE
      ?auto_1114912 - SURFACE
      ?auto_1114914 - SURFACE
      ?auto_1114913 - SURFACE
      ?auto_1114915 - SURFACE
    )
    :vars
    (
      ?auto_1114918 - HOIST
      ?auto_1114919 - PLACE
      ?auto_1114916 - PLACE
      ?auto_1114921 - HOIST
      ?auto_1114917 - SURFACE
      ?auto_1114920 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1114918 ?auto_1114919 ) ( IS-CRATE ?auto_1114915 ) ( not ( = ?auto_1114913 ?auto_1114915 ) ) ( not ( = ?auto_1114914 ?auto_1114913 ) ) ( not ( = ?auto_1114914 ?auto_1114915 ) ) ( not ( = ?auto_1114916 ?auto_1114919 ) ) ( HOIST-AT ?auto_1114921 ?auto_1114916 ) ( not ( = ?auto_1114918 ?auto_1114921 ) ) ( AVAILABLE ?auto_1114921 ) ( SURFACE-AT ?auto_1114915 ?auto_1114916 ) ( ON ?auto_1114915 ?auto_1114917 ) ( CLEAR ?auto_1114915 ) ( not ( = ?auto_1114913 ?auto_1114917 ) ) ( not ( = ?auto_1114915 ?auto_1114917 ) ) ( not ( = ?auto_1114914 ?auto_1114917 ) ) ( TRUCK-AT ?auto_1114920 ?auto_1114919 ) ( SURFACE-AT ?auto_1114914 ?auto_1114919 ) ( CLEAR ?auto_1114914 ) ( IS-CRATE ?auto_1114913 ) ( AVAILABLE ?auto_1114918 ) ( IN ?auto_1114913 ?auto_1114920 ) ( ON ?auto_1114910 ?auto_1114909 ) ( ON ?auto_1114911 ?auto_1114910 ) ( ON ?auto_1114908 ?auto_1114911 ) ( ON ?auto_1114912 ?auto_1114908 ) ( ON ?auto_1114914 ?auto_1114912 ) ( not ( = ?auto_1114909 ?auto_1114910 ) ) ( not ( = ?auto_1114909 ?auto_1114911 ) ) ( not ( = ?auto_1114909 ?auto_1114908 ) ) ( not ( = ?auto_1114909 ?auto_1114912 ) ) ( not ( = ?auto_1114909 ?auto_1114914 ) ) ( not ( = ?auto_1114909 ?auto_1114913 ) ) ( not ( = ?auto_1114909 ?auto_1114915 ) ) ( not ( = ?auto_1114909 ?auto_1114917 ) ) ( not ( = ?auto_1114910 ?auto_1114911 ) ) ( not ( = ?auto_1114910 ?auto_1114908 ) ) ( not ( = ?auto_1114910 ?auto_1114912 ) ) ( not ( = ?auto_1114910 ?auto_1114914 ) ) ( not ( = ?auto_1114910 ?auto_1114913 ) ) ( not ( = ?auto_1114910 ?auto_1114915 ) ) ( not ( = ?auto_1114910 ?auto_1114917 ) ) ( not ( = ?auto_1114911 ?auto_1114908 ) ) ( not ( = ?auto_1114911 ?auto_1114912 ) ) ( not ( = ?auto_1114911 ?auto_1114914 ) ) ( not ( = ?auto_1114911 ?auto_1114913 ) ) ( not ( = ?auto_1114911 ?auto_1114915 ) ) ( not ( = ?auto_1114911 ?auto_1114917 ) ) ( not ( = ?auto_1114908 ?auto_1114912 ) ) ( not ( = ?auto_1114908 ?auto_1114914 ) ) ( not ( = ?auto_1114908 ?auto_1114913 ) ) ( not ( = ?auto_1114908 ?auto_1114915 ) ) ( not ( = ?auto_1114908 ?auto_1114917 ) ) ( not ( = ?auto_1114912 ?auto_1114914 ) ) ( not ( = ?auto_1114912 ?auto_1114913 ) ) ( not ( = ?auto_1114912 ?auto_1114915 ) ) ( not ( = ?auto_1114912 ?auto_1114917 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1114914 ?auto_1114913 ?auto_1114915 )
      ( MAKE-7CRATE-VERIFY ?auto_1114909 ?auto_1114910 ?auto_1114911 ?auto_1114908 ?auto_1114912 ?auto_1114914 ?auto_1114913 ?auto_1114915 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1116981 - SURFACE
      ?auto_1116982 - SURFACE
    )
    :vars
    (
      ?auto_1116987 - HOIST
      ?auto_1116985 - PLACE
      ?auto_1116986 - SURFACE
      ?auto_1116983 - TRUCK
      ?auto_1116988 - PLACE
      ?auto_1116984 - HOIST
      ?auto_1116989 - SURFACE
      ?auto_1116990 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1116987 ?auto_1116985 ) ( SURFACE-AT ?auto_1116981 ?auto_1116985 ) ( CLEAR ?auto_1116981 ) ( IS-CRATE ?auto_1116982 ) ( not ( = ?auto_1116981 ?auto_1116982 ) ) ( AVAILABLE ?auto_1116987 ) ( ON ?auto_1116981 ?auto_1116986 ) ( not ( = ?auto_1116986 ?auto_1116981 ) ) ( not ( = ?auto_1116986 ?auto_1116982 ) ) ( TRUCK-AT ?auto_1116983 ?auto_1116988 ) ( not ( = ?auto_1116988 ?auto_1116985 ) ) ( HOIST-AT ?auto_1116984 ?auto_1116988 ) ( not ( = ?auto_1116987 ?auto_1116984 ) ) ( SURFACE-AT ?auto_1116982 ?auto_1116988 ) ( ON ?auto_1116982 ?auto_1116989 ) ( CLEAR ?auto_1116982 ) ( not ( = ?auto_1116981 ?auto_1116989 ) ) ( not ( = ?auto_1116982 ?auto_1116989 ) ) ( not ( = ?auto_1116986 ?auto_1116989 ) ) ( LIFTING ?auto_1116984 ?auto_1116990 ) ( IS-CRATE ?auto_1116990 ) ( not ( = ?auto_1116981 ?auto_1116990 ) ) ( not ( = ?auto_1116982 ?auto_1116990 ) ) ( not ( = ?auto_1116986 ?auto_1116990 ) ) ( not ( = ?auto_1116989 ?auto_1116990 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1116984 ?auto_1116990 ?auto_1116983 ?auto_1116988 )
      ( MAKE-1CRATE ?auto_1116981 ?auto_1116982 )
      ( MAKE-1CRATE-VERIFY ?auto_1116981 ?auto_1116982 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1117821 - SURFACE
      ?auto_1117822 - SURFACE
      ?auto_1117823 - SURFACE
      ?auto_1117820 - SURFACE
      ?auto_1117824 - SURFACE
      ?auto_1117826 - SURFACE
      ?auto_1117825 - SURFACE
      ?auto_1117827 - SURFACE
      ?auto_1117828 - SURFACE
    )
    :vars
    (
      ?auto_1117830 - HOIST
      ?auto_1117829 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1117830 ?auto_1117829 ) ( SURFACE-AT ?auto_1117827 ?auto_1117829 ) ( CLEAR ?auto_1117827 ) ( LIFTING ?auto_1117830 ?auto_1117828 ) ( IS-CRATE ?auto_1117828 ) ( not ( = ?auto_1117827 ?auto_1117828 ) ) ( ON ?auto_1117822 ?auto_1117821 ) ( ON ?auto_1117823 ?auto_1117822 ) ( ON ?auto_1117820 ?auto_1117823 ) ( ON ?auto_1117824 ?auto_1117820 ) ( ON ?auto_1117826 ?auto_1117824 ) ( ON ?auto_1117825 ?auto_1117826 ) ( ON ?auto_1117827 ?auto_1117825 ) ( not ( = ?auto_1117821 ?auto_1117822 ) ) ( not ( = ?auto_1117821 ?auto_1117823 ) ) ( not ( = ?auto_1117821 ?auto_1117820 ) ) ( not ( = ?auto_1117821 ?auto_1117824 ) ) ( not ( = ?auto_1117821 ?auto_1117826 ) ) ( not ( = ?auto_1117821 ?auto_1117825 ) ) ( not ( = ?auto_1117821 ?auto_1117827 ) ) ( not ( = ?auto_1117821 ?auto_1117828 ) ) ( not ( = ?auto_1117822 ?auto_1117823 ) ) ( not ( = ?auto_1117822 ?auto_1117820 ) ) ( not ( = ?auto_1117822 ?auto_1117824 ) ) ( not ( = ?auto_1117822 ?auto_1117826 ) ) ( not ( = ?auto_1117822 ?auto_1117825 ) ) ( not ( = ?auto_1117822 ?auto_1117827 ) ) ( not ( = ?auto_1117822 ?auto_1117828 ) ) ( not ( = ?auto_1117823 ?auto_1117820 ) ) ( not ( = ?auto_1117823 ?auto_1117824 ) ) ( not ( = ?auto_1117823 ?auto_1117826 ) ) ( not ( = ?auto_1117823 ?auto_1117825 ) ) ( not ( = ?auto_1117823 ?auto_1117827 ) ) ( not ( = ?auto_1117823 ?auto_1117828 ) ) ( not ( = ?auto_1117820 ?auto_1117824 ) ) ( not ( = ?auto_1117820 ?auto_1117826 ) ) ( not ( = ?auto_1117820 ?auto_1117825 ) ) ( not ( = ?auto_1117820 ?auto_1117827 ) ) ( not ( = ?auto_1117820 ?auto_1117828 ) ) ( not ( = ?auto_1117824 ?auto_1117826 ) ) ( not ( = ?auto_1117824 ?auto_1117825 ) ) ( not ( = ?auto_1117824 ?auto_1117827 ) ) ( not ( = ?auto_1117824 ?auto_1117828 ) ) ( not ( = ?auto_1117826 ?auto_1117825 ) ) ( not ( = ?auto_1117826 ?auto_1117827 ) ) ( not ( = ?auto_1117826 ?auto_1117828 ) ) ( not ( = ?auto_1117825 ?auto_1117827 ) ) ( not ( = ?auto_1117825 ?auto_1117828 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1117827 ?auto_1117828 )
      ( MAKE-8CRATE-VERIFY ?auto_1117821 ?auto_1117822 ?auto_1117823 ?auto_1117820 ?auto_1117824 ?auto_1117826 ?auto_1117825 ?auto_1117827 ?auto_1117828 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1117888 - SURFACE
      ?auto_1117889 - SURFACE
      ?auto_1117890 - SURFACE
      ?auto_1117887 - SURFACE
      ?auto_1117891 - SURFACE
      ?auto_1117893 - SURFACE
      ?auto_1117892 - SURFACE
      ?auto_1117894 - SURFACE
      ?auto_1117895 - SURFACE
    )
    :vars
    (
      ?auto_1117897 - HOIST
      ?auto_1117898 - PLACE
      ?auto_1117896 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1117897 ?auto_1117898 ) ( SURFACE-AT ?auto_1117894 ?auto_1117898 ) ( CLEAR ?auto_1117894 ) ( IS-CRATE ?auto_1117895 ) ( not ( = ?auto_1117894 ?auto_1117895 ) ) ( TRUCK-AT ?auto_1117896 ?auto_1117898 ) ( AVAILABLE ?auto_1117897 ) ( IN ?auto_1117895 ?auto_1117896 ) ( ON ?auto_1117894 ?auto_1117892 ) ( not ( = ?auto_1117892 ?auto_1117894 ) ) ( not ( = ?auto_1117892 ?auto_1117895 ) ) ( ON ?auto_1117889 ?auto_1117888 ) ( ON ?auto_1117890 ?auto_1117889 ) ( ON ?auto_1117887 ?auto_1117890 ) ( ON ?auto_1117891 ?auto_1117887 ) ( ON ?auto_1117893 ?auto_1117891 ) ( ON ?auto_1117892 ?auto_1117893 ) ( not ( = ?auto_1117888 ?auto_1117889 ) ) ( not ( = ?auto_1117888 ?auto_1117890 ) ) ( not ( = ?auto_1117888 ?auto_1117887 ) ) ( not ( = ?auto_1117888 ?auto_1117891 ) ) ( not ( = ?auto_1117888 ?auto_1117893 ) ) ( not ( = ?auto_1117888 ?auto_1117892 ) ) ( not ( = ?auto_1117888 ?auto_1117894 ) ) ( not ( = ?auto_1117888 ?auto_1117895 ) ) ( not ( = ?auto_1117889 ?auto_1117890 ) ) ( not ( = ?auto_1117889 ?auto_1117887 ) ) ( not ( = ?auto_1117889 ?auto_1117891 ) ) ( not ( = ?auto_1117889 ?auto_1117893 ) ) ( not ( = ?auto_1117889 ?auto_1117892 ) ) ( not ( = ?auto_1117889 ?auto_1117894 ) ) ( not ( = ?auto_1117889 ?auto_1117895 ) ) ( not ( = ?auto_1117890 ?auto_1117887 ) ) ( not ( = ?auto_1117890 ?auto_1117891 ) ) ( not ( = ?auto_1117890 ?auto_1117893 ) ) ( not ( = ?auto_1117890 ?auto_1117892 ) ) ( not ( = ?auto_1117890 ?auto_1117894 ) ) ( not ( = ?auto_1117890 ?auto_1117895 ) ) ( not ( = ?auto_1117887 ?auto_1117891 ) ) ( not ( = ?auto_1117887 ?auto_1117893 ) ) ( not ( = ?auto_1117887 ?auto_1117892 ) ) ( not ( = ?auto_1117887 ?auto_1117894 ) ) ( not ( = ?auto_1117887 ?auto_1117895 ) ) ( not ( = ?auto_1117891 ?auto_1117893 ) ) ( not ( = ?auto_1117891 ?auto_1117892 ) ) ( not ( = ?auto_1117891 ?auto_1117894 ) ) ( not ( = ?auto_1117891 ?auto_1117895 ) ) ( not ( = ?auto_1117893 ?auto_1117892 ) ) ( not ( = ?auto_1117893 ?auto_1117894 ) ) ( not ( = ?auto_1117893 ?auto_1117895 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1117892 ?auto_1117894 ?auto_1117895 )
      ( MAKE-8CRATE-VERIFY ?auto_1117888 ?auto_1117889 ?auto_1117890 ?auto_1117887 ?auto_1117891 ?auto_1117893 ?auto_1117892 ?auto_1117894 ?auto_1117895 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1117964 - SURFACE
      ?auto_1117965 - SURFACE
      ?auto_1117966 - SURFACE
      ?auto_1117963 - SURFACE
      ?auto_1117967 - SURFACE
      ?auto_1117969 - SURFACE
      ?auto_1117968 - SURFACE
      ?auto_1117970 - SURFACE
      ?auto_1117971 - SURFACE
    )
    :vars
    (
      ?auto_1117975 - HOIST
      ?auto_1117974 - PLACE
      ?auto_1117973 - TRUCK
      ?auto_1117972 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1117975 ?auto_1117974 ) ( SURFACE-AT ?auto_1117970 ?auto_1117974 ) ( CLEAR ?auto_1117970 ) ( IS-CRATE ?auto_1117971 ) ( not ( = ?auto_1117970 ?auto_1117971 ) ) ( AVAILABLE ?auto_1117975 ) ( IN ?auto_1117971 ?auto_1117973 ) ( ON ?auto_1117970 ?auto_1117968 ) ( not ( = ?auto_1117968 ?auto_1117970 ) ) ( not ( = ?auto_1117968 ?auto_1117971 ) ) ( TRUCK-AT ?auto_1117973 ?auto_1117972 ) ( not ( = ?auto_1117972 ?auto_1117974 ) ) ( ON ?auto_1117965 ?auto_1117964 ) ( ON ?auto_1117966 ?auto_1117965 ) ( ON ?auto_1117963 ?auto_1117966 ) ( ON ?auto_1117967 ?auto_1117963 ) ( ON ?auto_1117969 ?auto_1117967 ) ( ON ?auto_1117968 ?auto_1117969 ) ( not ( = ?auto_1117964 ?auto_1117965 ) ) ( not ( = ?auto_1117964 ?auto_1117966 ) ) ( not ( = ?auto_1117964 ?auto_1117963 ) ) ( not ( = ?auto_1117964 ?auto_1117967 ) ) ( not ( = ?auto_1117964 ?auto_1117969 ) ) ( not ( = ?auto_1117964 ?auto_1117968 ) ) ( not ( = ?auto_1117964 ?auto_1117970 ) ) ( not ( = ?auto_1117964 ?auto_1117971 ) ) ( not ( = ?auto_1117965 ?auto_1117966 ) ) ( not ( = ?auto_1117965 ?auto_1117963 ) ) ( not ( = ?auto_1117965 ?auto_1117967 ) ) ( not ( = ?auto_1117965 ?auto_1117969 ) ) ( not ( = ?auto_1117965 ?auto_1117968 ) ) ( not ( = ?auto_1117965 ?auto_1117970 ) ) ( not ( = ?auto_1117965 ?auto_1117971 ) ) ( not ( = ?auto_1117966 ?auto_1117963 ) ) ( not ( = ?auto_1117966 ?auto_1117967 ) ) ( not ( = ?auto_1117966 ?auto_1117969 ) ) ( not ( = ?auto_1117966 ?auto_1117968 ) ) ( not ( = ?auto_1117966 ?auto_1117970 ) ) ( not ( = ?auto_1117966 ?auto_1117971 ) ) ( not ( = ?auto_1117963 ?auto_1117967 ) ) ( not ( = ?auto_1117963 ?auto_1117969 ) ) ( not ( = ?auto_1117963 ?auto_1117968 ) ) ( not ( = ?auto_1117963 ?auto_1117970 ) ) ( not ( = ?auto_1117963 ?auto_1117971 ) ) ( not ( = ?auto_1117967 ?auto_1117969 ) ) ( not ( = ?auto_1117967 ?auto_1117968 ) ) ( not ( = ?auto_1117967 ?auto_1117970 ) ) ( not ( = ?auto_1117967 ?auto_1117971 ) ) ( not ( = ?auto_1117969 ?auto_1117968 ) ) ( not ( = ?auto_1117969 ?auto_1117970 ) ) ( not ( = ?auto_1117969 ?auto_1117971 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1117968 ?auto_1117970 ?auto_1117971 )
      ( MAKE-8CRATE-VERIFY ?auto_1117964 ?auto_1117965 ?auto_1117966 ?auto_1117963 ?auto_1117967 ?auto_1117969 ?auto_1117968 ?auto_1117970 ?auto_1117971 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1118048 - SURFACE
      ?auto_1118049 - SURFACE
      ?auto_1118050 - SURFACE
      ?auto_1118047 - SURFACE
      ?auto_1118051 - SURFACE
      ?auto_1118053 - SURFACE
      ?auto_1118052 - SURFACE
      ?auto_1118054 - SURFACE
      ?auto_1118055 - SURFACE
    )
    :vars
    (
      ?auto_1118056 - HOIST
      ?auto_1118059 - PLACE
      ?auto_1118060 - TRUCK
      ?auto_1118058 - PLACE
      ?auto_1118057 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118056 ?auto_1118059 ) ( SURFACE-AT ?auto_1118054 ?auto_1118059 ) ( CLEAR ?auto_1118054 ) ( IS-CRATE ?auto_1118055 ) ( not ( = ?auto_1118054 ?auto_1118055 ) ) ( AVAILABLE ?auto_1118056 ) ( ON ?auto_1118054 ?auto_1118052 ) ( not ( = ?auto_1118052 ?auto_1118054 ) ) ( not ( = ?auto_1118052 ?auto_1118055 ) ) ( TRUCK-AT ?auto_1118060 ?auto_1118058 ) ( not ( = ?auto_1118058 ?auto_1118059 ) ) ( HOIST-AT ?auto_1118057 ?auto_1118058 ) ( LIFTING ?auto_1118057 ?auto_1118055 ) ( not ( = ?auto_1118056 ?auto_1118057 ) ) ( ON ?auto_1118049 ?auto_1118048 ) ( ON ?auto_1118050 ?auto_1118049 ) ( ON ?auto_1118047 ?auto_1118050 ) ( ON ?auto_1118051 ?auto_1118047 ) ( ON ?auto_1118053 ?auto_1118051 ) ( ON ?auto_1118052 ?auto_1118053 ) ( not ( = ?auto_1118048 ?auto_1118049 ) ) ( not ( = ?auto_1118048 ?auto_1118050 ) ) ( not ( = ?auto_1118048 ?auto_1118047 ) ) ( not ( = ?auto_1118048 ?auto_1118051 ) ) ( not ( = ?auto_1118048 ?auto_1118053 ) ) ( not ( = ?auto_1118048 ?auto_1118052 ) ) ( not ( = ?auto_1118048 ?auto_1118054 ) ) ( not ( = ?auto_1118048 ?auto_1118055 ) ) ( not ( = ?auto_1118049 ?auto_1118050 ) ) ( not ( = ?auto_1118049 ?auto_1118047 ) ) ( not ( = ?auto_1118049 ?auto_1118051 ) ) ( not ( = ?auto_1118049 ?auto_1118053 ) ) ( not ( = ?auto_1118049 ?auto_1118052 ) ) ( not ( = ?auto_1118049 ?auto_1118054 ) ) ( not ( = ?auto_1118049 ?auto_1118055 ) ) ( not ( = ?auto_1118050 ?auto_1118047 ) ) ( not ( = ?auto_1118050 ?auto_1118051 ) ) ( not ( = ?auto_1118050 ?auto_1118053 ) ) ( not ( = ?auto_1118050 ?auto_1118052 ) ) ( not ( = ?auto_1118050 ?auto_1118054 ) ) ( not ( = ?auto_1118050 ?auto_1118055 ) ) ( not ( = ?auto_1118047 ?auto_1118051 ) ) ( not ( = ?auto_1118047 ?auto_1118053 ) ) ( not ( = ?auto_1118047 ?auto_1118052 ) ) ( not ( = ?auto_1118047 ?auto_1118054 ) ) ( not ( = ?auto_1118047 ?auto_1118055 ) ) ( not ( = ?auto_1118051 ?auto_1118053 ) ) ( not ( = ?auto_1118051 ?auto_1118052 ) ) ( not ( = ?auto_1118051 ?auto_1118054 ) ) ( not ( = ?auto_1118051 ?auto_1118055 ) ) ( not ( = ?auto_1118053 ?auto_1118052 ) ) ( not ( = ?auto_1118053 ?auto_1118054 ) ) ( not ( = ?auto_1118053 ?auto_1118055 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118052 ?auto_1118054 ?auto_1118055 )
      ( MAKE-8CRATE-VERIFY ?auto_1118048 ?auto_1118049 ?auto_1118050 ?auto_1118047 ?auto_1118051 ?auto_1118053 ?auto_1118052 ?auto_1118054 ?auto_1118055 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1118140 - SURFACE
      ?auto_1118141 - SURFACE
      ?auto_1118142 - SURFACE
      ?auto_1118139 - SURFACE
      ?auto_1118143 - SURFACE
      ?auto_1118145 - SURFACE
      ?auto_1118144 - SURFACE
      ?auto_1118146 - SURFACE
      ?auto_1118147 - SURFACE
    )
    :vars
    (
      ?auto_1118149 - HOIST
      ?auto_1118152 - PLACE
      ?auto_1118153 - TRUCK
      ?auto_1118150 - PLACE
      ?auto_1118151 - HOIST
      ?auto_1118148 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118149 ?auto_1118152 ) ( SURFACE-AT ?auto_1118146 ?auto_1118152 ) ( CLEAR ?auto_1118146 ) ( IS-CRATE ?auto_1118147 ) ( not ( = ?auto_1118146 ?auto_1118147 ) ) ( AVAILABLE ?auto_1118149 ) ( ON ?auto_1118146 ?auto_1118144 ) ( not ( = ?auto_1118144 ?auto_1118146 ) ) ( not ( = ?auto_1118144 ?auto_1118147 ) ) ( TRUCK-AT ?auto_1118153 ?auto_1118150 ) ( not ( = ?auto_1118150 ?auto_1118152 ) ) ( HOIST-AT ?auto_1118151 ?auto_1118150 ) ( not ( = ?auto_1118149 ?auto_1118151 ) ) ( AVAILABLE ?auto_1118151 ) ( SURFACE-AT ?auto_1118147 ?auto_1118150 ) ( ON ?auto_1118147 ?auto_1118148 ) ( CLEAR ?auto_1118147 ) ( not ( = ?auto_1118146 ?auto_1118148 ) ) ( not ( = ?auto_1118147 ?auto_1118148 ) ) ( not ( = ?auto_1118144 ?auto_1118148 ) ) ( ON ?auto_1118141 ?auto_1118140 ) ( ON ?auto_1118142 ?auto_1118141 ) ( ON ?auto_1118139 ?auto_1118142 ) ( ON ?auto_1118143 ?auto_1118139 ) ( ON ?auto_1118145 ?auto_1118143 ) ( ON ?auto_1118144 ?auto_1118145 ) ( not ( = ?auto_1118140 ?auto_1118141 ) ) ( not ( = ?auto_1118140 ?auto_1118142 ) ) ( not ( = ?auto_1118140 ?auto_1118139 ) ) ( not ( = ?auto_1118140 ?auto_1118143 ) ) ( not ( = ?auto_1118140 ?auto_1118145 ) ) ( not ( = ?auto_1118140 ?auto_1118144 ) ) ( not ( = ?auto_1118140 ?auto_1118146 ) ) ( not ( = ?auto_1118140 ?auto_1118147 ) ) ( not ( = ?auto_1118140 ?auto_1118148 ) ) ( not ( = ?auto_1118141 ?auto_1118142 ) ) ( not ( = ?auto_1118141 ?auto_1118139 ) ) ( not ( = ?auto_1118141 ?auto_1118143 ) ) ( not ( = ?auto_1118141 ?auto_1118145 ) ) ( not ( = ?auto_1118141 ?auto_1118144 ) ) ( not ( = ?auto_1118141 ?auto_1118146 ) ) ( not ( = ?auto_1118141 ?auto_1118147 ) ) ( not ( = ?auto_1118141 ?auto_1118148 ) ) ( not ( = ?auto_1118142 ?auto_1118139 ) ) ( not ( = ?auto_1118142 ?auto_1118143 ) ) ( not ( = ?auto_1118142 ?auto_1118145 ) ) ( not ( = ?auto_1118142 ?auto_1118144 ) ) ( not ( = ?auto_1118142 ?auto_1118146 ) ) ( not ( = ?auto_1118142 ?auto_1118147 ) ) ( not ( = ?auto_1118142 ?auto_1118148 ) ) ( not ( = ?auto_1118139 ?auto_1118143 ) ) ( not ( = ?auto_1118139 ?auto_1118145 ) ) ( not ( = ?auto_1118139 ?auto_1118144 ) ) ( not ( = ?auto_1118139 ?auto_1118146 ) ) ( not ( = ?auto_1118139 ?auto_1118147 ) ) ( not ( = ?auto_1118139 ?auto_1118148 ) ) ( not ( = ?auto_1118143 ?auto_1118145 ) ) ( not ( = ?auto_1118143 ?auto_1118144 ) ) ( not ( = ?auto_1118143 ?auto_1118146 ) ) ( not ( = ?auto_1118143 ?auto_1118147 ) ) ( not ( = ?auto_1118143 ?auto_1118148 ) ) ( not ( = ?auto_1118145 ?auto_1118144 ) ) ( not ( = ?auto_1118145 ?auto_1118146 ) ) ( not ( = ?auto_1118145 ?auto_1118147 ) ) ( not ( = ?auto_1118145 ?auto_1118148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118144 ?auto_1118146 ?auto_1118147 )
      ( MAKE-8CRATE-VERIFY ?auto_1118140 ?auto_1118141 ?auto_1118142 ?auto_1118139 ?auto_1118143 ?auto_1118145 ?auto_1118144 ?auto_1118146 ?auto_1118147 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1118233 - SURFACE
      ?auto_1118234 - SURFACE
      ?auto_1118235 - SURFACE
      ?auto_1118232 - SURFACE
      ?auto_1118236 - SURFACE
      ?auto_1118238 - SURFACE
      ?auto_1118237 - SURFACE
      ?auto_1118239 - SURFACE
      ?auto_1118240 - SURFACE
    )
    :vars
    (
      ?auto_1118244 - HOIST
      ?auto_1118245 - PLACE
      ?auto_1118242 - PLACE
      ?auto_1118243 - HOIST
      ?auto_1118246 - SURFACE
      ?auto_1118241 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118244 ?auto_1118245 ) ( SURFACE-AT ?auto_1118239 ?auto_1118245 ) ( CLEAR ?auto_1118239 ) ( IS-CRATE ?auto_1118240 ) ( not ( = ?auto_1118239 ?auto_1118240 ) ) ( AVAILABLE ?auto_1118244 ) ( ON ?auto_1118239 ?auto_1118237 ) ( not ( = ?auto_1118237 ?auto_1118239 ) ) ( not ( = ?auto_1118237 ?auto_1118240 ) ) ( not ( = ?auto_1118242 ?auto_1118245 ) ) ( HOIST-AT ?auto_1118243 ?auto_1118242 ) ( not ( = ?auto_1118244 ?auto_1118243 ) ) ( AVAILABLE ?auto_1118243 ) ( SURFACE-AT ?auto_1118240 ?auto_1118242 ) ( ON ?auto_1118240 ?auto_1118246 ) ( CLEAR ?auto_1118240 ) ( not ( = ?auto_1118239 ?auto_1118246 ) ) ( not ( = ?auto_1118240 ?auto_1118246 ) ) ( not ( = ?auto_1118237 ?auto_1118246 ) ) ( TRUCK-AT ?auto_1118241 ?auto_1118245 ) ( ON ?auto_1118234 ?auto_1118233 ) ( ON ?auto_1118235 ?auto_1118234 ) ( ON ?auto_1118232 ?auto_1118235 ) ( ON ?auto_1118236 ?auto_1118232 ) ( ON ?auto_1118238 ?auto_1118236 ) ( ON ?auto_1118237 ?auto_1118238 ) ( not ( = ?auto_1118233 ?auto_1118234 ) ) ( not ( = ?auto_1118233 ?auto_1118235 ) ) ( not ( = ?auto_1118233 ?auto_1118232 ) ) ( not ( = ?auto_1118233 ?auto_1118236 ) ) ( not ( = ?auto_1118233 ?auto_1118238 ) ) ( not ( = ?auto_1118233 ?auto_1118237 ) ) ( not ( = ?auto_1118233 ?auto_1118239 ) ) ( not ( = ?auto_1118233 ?auto_1118240 ) ) ( not ( = ?auto_1118233 ?auto_1118246 ) ) ( not ( = ?auto_1118234 ?auto_1118235 ) ) ( not ( = ?auto_1118234 ?auto_1118232 ) ) ( not ( = ?auto_1118234 ?auto_1118236 ) ) ( not ( = ?auto_1118234 ?auto_1118238 ) ) ( not ( = ?auto_1118234 ?auto_1118237 ) ) ( not ( = ?auto_1118234 ?auto_1118239 ) ) ( not ( = ?auto_1118234 ?auto_1118240 ) ) ( not ( = ?auto_1118234 ?auto_1118246 ) ) ( not ( = ?auto_1118235 ?auto_1118232 ) ) ( not ( = ?auto_1118235 ?auto_1118236 ) ) ( not ( = ?auto_1118235 ?auto_1118238 ) ) ( not ( = ?auto_1118235 ?auto_1118237 ) ) ( not ( = ?auto_1118235 ?auto_1118239 ) ) ( not ( = ?auto_1118235 ?auto_1118240 ) ) ( not ( = ?auto_1118235 ?auto_1118246 ) ) ( not ( = ?auto_1118232 ?auto_1118236 ) ) ( not ( = ?auto_1118232 ?auto_1118238 ) ) ( not ( = ?auto_1118232 ?auto_1118237 ) ) ( not ( = ?auto_1118232 ?auto_1118239 ) ) ( not ( = ?auto_1118232 ?auto_1118240 ) ) ( not ( = ?auto_1118232 ?auto_1118246 ) ) ( not ( = ?auto_1118236 ?auto_1118238 ) ) ( not ( = ?auto_1118236 ?auto_1118237 ) ) ( not ( = ?auto_1118236 ?auto_1118239 ) ) ( not ( = ?auto_1118236 ?auto_1118240 ) ) ( not ( = ?auto_1118236 ?auto_1118246 ) ) ( not ( = ?auto_1118238 ?auto_1118237 ) ) ( not ( = ?auto_1118238 ?auto_1118239 ) ) ( not ( = ?auto_1118238 ?auto_1118240 ) ) ( not ( = ?auto_1118238 ?auto_1118246 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118237 ?auto_1118239 ?auto_1118240 )
      ( MAKE-8CRATE-VERIFY ?auto_1118233 ?auto_1118234 ?auto_1118235 ?auto_1118232 ?auto_1118236 ?auto_1118238 ?auto_1118237 ?auto_1118239 ?auto_1118240 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1118326 - SURFACE
      ?auto_1118327 - SURFACE
      ?auto_1118328 - SURFACE
      ?auto_1118325 - SURFACE
      ?auto_1118329 - SURFACE
      ?auto_1118331 - SURFACE
      ?auto_1118330 - SURFACE
      ?auto_1118332 - SURFACE
      ?auto_1118333 - SURFACE
    )
    :vars
    (
      ?auto_1118336 - HOIST
      ?auto_1118338 - PLACE
      ?auto_1118337 - PLACE
      ?auto_1118339 - HOIST
      ?auto_1118334 - SURFACE
      ?auto_1118335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118336 ?auto_1118338 ) ( IS-CRATE ?auto_1118333 ) ( not ( = ?auto_1118332 ?auto_1118333 ) ) ( not ( = ?auto_1118330 ?auto_1118332 ) ) ( not ( = ?auto_1118330 ?auto_1118333 ) ) ( not ( = ?auto_1118337 ?auto_1118338 ) ) ( HOIST-AT ?auto_1118339 ?auto_1118337 ) ( not ( = ?auto_1118336 ?auto_1118339 ) ) ( AVAILABLE ?auto_1118339 ) ( SURFACE-AT ?auto_1118333 ?auto_1118337 ) ( ON ?auto_1118333 ?auto_1118334 ) ( CLEAR ?auto_1118333 ) ( not ( = ?auto_1118332 ?auto_1118334 ) ) ( not ( = ?auto_1118333 ?auto_1118334 ) ) ( not ( = ?auto_1118330 ?auto_1118334 ) ) ( TRUCK-AT ?auto_1118335 ?auto_1118338 ) ( SURFACE-AT ?auto_1118330 ?auto_1118338 ) ( CLEAR ?auto_1118330 ) ( LIFTING ?auto_1118336 ?auto_1118332 ) ( IS-CRATE ?auto_1118332 ) ( ON ?auto_1118327 ?auto_1118326 ) ( ON ?auto_1118328 ?auto_1118327 ) ( ON ?auto_1118325 ?auto_1118328 ) ( ON ?auto_1118329 ?auto_1118325 ) ( ON ?auto_1118331 ?auto_1118329 ) ( ON ?auto_1118330 ?auto_1118331 ) ( not ( = ?auto_1118326 ?auto_1118327 ) ) ( not ( = ?auto_1118326 ?auto_1118328 ) ) ( not ( = ?auto_1118326 ?auto_1118325 ) ) ( not ( = ?auto_1118326 ?auto_1118329 ) ) ( not ( = ?auto_1118326 ?auto_1118331 ) ) ( not ( = ?auto_1118326 ?auto_1118330 ) ) ( not ( = ?auto_1118326 ?auto_1118332 ) ) ( not ( = ?auto_1118326 ?auto_1118333 ) ) ( not ( = ?auto_1118326 ?auto_1118334 ) ) ( not ( = ?auto_1118327 ?auto_1118328 ) ) ( not ( = ?auto_1118327 ?auto_1118325 ) ) ( not ( = ?auto_1118327 ?auto_1118329 ) ) ( not ( = ?auto_1118327 ?auto_1118331 ) ) ( not ( = ?auto_1118327 ?auto_1118330 ) ) ( not ( = ?auto_1118327 ?auto_1118332 ) ) ( not ( = ?auto_1118327 ?auto_1118333 ) ) ( not ( = ?auto_1118327 ?auto_1118334 ) ) ( not ( = ?auto_1118328 ?auto_1118325 ) ) ( not ( = ?auto_1118328 ?auto_1118329 ) ) ( not ( = ?auto_1118328 ?auto_1118331 ) ) ( not ( = ?auto_1118328 ?auto_1118330 ) ) ( not ( = ?auto_1118328 ?auto_1118332 ) ) ( not ( = ?auto_1118328 ?auto_1118333 ) ) ( not ( = ?auto_1118328 ?auto_1118334 ) ) ( not ( = ?auto_1118325 ?auto_1118329 ) ) ( not ( = ?auto_1118325 ?auto_1118331 ) ) ( not ( = ?auto_1118325 ?auto_1118330 ) ) ( not ( = ?auto_1118325 ?auto_1118332 ) ) ( not ( = ?auto_1118325 ?auto_1118333 ) ) ( not ( = ?auto_1118325 ?auto_1118334 ) ) ( not ( = ?auto_1118329 ?auto_1118331 ) ) ( not ( = ?auto_1118329 ?auto_1118330 ) ) ( not ( = ?auto_1118329 ?auto_1118332 ) ) ( not ( = ?auto_1118329 ?auto_1118333 ) ) ( not ( = ?auto_1118329 ?auto_1118334 ) ) ( not ( = ?auto_1118331 ?auto_1118330 ) ) ( not ( = ?auto_1118331 ?auto_1118332 ) ) ( not ( = ?auto_1118331 ?auto_1118333 ) ) ( not ( = ?auto_1118331 ?auto_1118334 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118330 ?auto_1118332 ?auto_1118333 )
      ( MAKE-8CRATE-VERIFY ?auto_1118326 ?auto_1118327 ?auto_1118328 ?auto_1118325 ?auto_1118329 ?auto_1118331 ?auto_1118330 ?auto_1118332 ?auto_1118333 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1118419 - SURFACE
      ?auto_1118420 - SURFACE
      ?auto_1118421 - SURFACE
      ?auto_1118418 - SURFACE
      ?auto_1118422 - SURFACE
      ?auto_1118424 - SURFACE
      ?auto_1118423 - SURFACE
      ?auto_1118425 - SURFACE
      ?auto_1118426 - SURFACE
    )
    :vars
    (
      ?auto_1118428 - HOIST
      ?auto_1118432 - PLACE
      ?auto_1118427 - PLACE
      ?auto_1118429 - HOIST
      ?auto_1118431 - SURFACE
      ?auto_1118430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118428 ?auto_1118432 ) ( IS-CRATE ?auto_1118426 ) ( not ( = ?auto_1118425 ?auto_1118426 ) ) ( not ( = ?auto_1118423 ?auto_1118425 ) ) ( not ( = ?auto_1118423 ?auto_1118426 ) ) ( not ( = ?auto_1118427 ?auto_1118432 ) ) ( HOIST-AT ?auto_1118429 ?auto_1118427 ) ( not ( = ?auto_1118428 ?auto_1118429 ) ) ( AVAILABLE ?auto_1118429 ) ( SURFACE-AT ?auto_1118426 ?auto_1118427 ) ( ON ?auto_1118426 ?auto_1118431 ) ( CLEAR ?auto_1118426 ) ( not ( = ?auto_1118425 ?auto_1118431 ) ) ( not ( = ?auto_1118426 ?auto_1118431 ) ) ( not ( = ?auto_1118423 ?auto_1118431 ) ) ( TRUCK-AT ?auto_1118430 ?auto_1118432 ) ( SURFACE-AT ?auto_1118423 ?auto_1118432 ) ( CLEAR ?auto_1118423 ) ( IS-CRATE ?auto_1118425 ) ( AVAILABLE ?auto_1118428 ) ( IN ?auto_1118425 ?auto_1118430 ) ( ON ?auto_1118420 ?auto_1118419 ) ( ON ?auto_1118421 ?auto_1118420 ) ( ON ?auto_1118418 ?auto_1118421 ) ( ON ?auto_1118422 ?auto_1118418 ) ( ON ?auto_1118424 ?auto_1118422 ) ( ON ?auto_1118423 ?auto_1118424 ) ( not ( = ?auto_1118419 ?auto_1118420 ) ) ( not ( = ?auto_1118419 ?auto_1118421 ) ) ( not ( = ?auto_1118419 ?auto_1118418 ) ) ( not ( = ?auto_1118419 ?auto_1118422 ) ) ( not ( = ?auto_1118419 ?auto_1118424 ) ) ( not ( = ?auto_1118419 ?auto_1118423 ) ) ( not ( = ?auto_1118419 ?auto_1118425 ) ) ( not ( = ?auto_1118419 ?auto_1118426 ) ) ( not ( = ?auto_1118419 ?auto_1118431 ) ) ( not ( = ?auto_1118420 ?auto_1118421 ) ) ( not ( = ?auto_1118420 ?auto_1118418 ) ) ( not ( = ?auto_1118420 ?auto_1118422 ) ) ( not ( = ?auto_1118420 ?auto_1118424 ) ) ( not ( = ?auto_1118420 ?auto_1118423 ) ) ( not ( = ?auto_1118420 ?auto_1118425 ) ) ( not ( = ?auto_1118420 ?auto_1118426 ) ) ( not ( = ?auto_1118420 ?auto_1118431 ) ) ( not ( = ?auto_1118421 ?auto_1118418 ) ) ( not ( = ?auto_1118421 ?auto_1118422 ) ) ( not ( = ?auto_1118421 ?auto_1118424 ) ) ( not ( = ?auto_1118421 ?auto_1118423 ) ) ( not ( = ?auto_1118421 ?auto_1118425 ) ) ( not ( = ?auto_1118421 ?auto_1118426 ) ) ( not ( = ?auto_1118421 ?auto_1118431 ) ) ( not ( = ?auto_1118418 ?auto_1118422 ) ) ( not ( = ?auto_1118418 ?auto_1118424 ) ) ( not ( = ?auto_1118418 ?auto_1118423 ) ) ( not ( = ?auto_1118418 ?auto_1118425 ) ) ( not ( = ?auto_1118418 ?auto_1118426 ) ) ( not ( = ?auto_1118418 ?auto_1118431 ) ) ( not ( = ?auto_1118422 ?auto_1118424 ) ) ( not ( = ?auto_1118422 ?auto_1118423 ) ) ( not ( = ?auto_1118422 ?auto_1118425 ) ) ( not ( = ?auto_1118422 ?auto_1118426 ) ) ( not ( = ?auto_1118422 ?auto_1118431 ) ) ( not ( = ?auto_1118424 ?auto_1118423 ) ) ( not ( = ?auto_1118424 ?auto_1118425 ) ) ( not ( = ?auto_1118424 ?auto_1118426 ) ) ( not ( = ?auto_1118424 ?auto_1118431 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118423 ?auto_1118425 ?auto_1118426 )
      ( MAKE-8CRATE-VERIFY ?auto_1118419 ?auto_1118420 ?auto_1118421 ?auto_1118418 ?auto_1118422 ?auto_1118424 ?auto_1118423 ?auto_1118425 ?auto_1118426 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1118433 - SURFACE
      ?auto_1118434 - SURFACE
    )
    :vars
    (
      ?auto_1118436 - HOIST
      ?auto_1118441 - PLACE
      ?auto_1118439 - SURFACE
      ?auto_1118435 - PLACE
      ?auto_1118437 - HOIST
      ?auto_1118440 - SURFACE
      ?auto_1118438 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118436 ?auto_1118441 ) ( IS-CRATE ?auto_1118434 ) ( not ( = ?auto_1118433 ?auto_1118434 ) ) ( not ( = ?auto_1118439 ?auto_1118433 ) ) ( not ( = ?auto_1118439 ?auto_1118434 ) ) ( not ( = ?auto_1118435 ?auto_1118441 ) ) ( HOIST-AT ?auto_1118437 ?auto_1118435 ) ( not ( = ?auto_1118436 ?auto_1118437 ) ) ( AVAILABLE ?auto_1118437 ) ( SURFACE-AT ?auto_1118434 ?auto_1118435 ) ( ON ?auto_1118434 ?auto_1118440 ) ( CLEAR ?auto_1118434 ) ( not ( = ?auto_1118433 ?auto_1118440 ) ) ( not ( = ?auto_1118434 ?auto_1118440 ) ) ( not ( = ?auto_1118439 ?auto_1118440 ) ) ( SURFACE-AT ?auto_1118439 ?auto_1118441 ) ( CLEAR ?auto_1118439 ) ( IS-CRATE ?auto_1118433 ) ( AVAILABLE ?auto_1118436 ) ( IN ?auto_1118433 ?auto_1118438 ) ( TRUCK-AT ?auto_1118438 ?auto_1118435 ) )
    :subtasks
    ( ( !DRIVE ?auto_1118438 ?auto_1118435 ?auto_1118441 )
      ( MAKE-2CRATE ?auto_1118439 ?auto_1118433 ?auto_1118434 )
      ( MAKE-1CRATE-VERIFY ?auto_1118433 ?auto_1118434 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1118442 - SURFACE
      ?auto_1118443 - SURFACE
      ?auto_1118444 - SURFACE
    )
    :vars
    (
      ?auto_1118447 - HOIST
      ?auto_1118449 - PLACE
      ?auto_1118446 - PLACE
      ?auto_1118450 - HOIST
      ?auto_1118445 - SURFACE
      ?auto_1118448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118447 ?auto_1118449 ) ( IS-CRATE ?auto_1118444 ) ( not ( = ?auto_1118443 ?auto_1118444 ) ) ( not ( = ?auto_1118442 ?auto_1118443 ) ) ( not ( = ?auto_1118442 ?auto_1118444 ) ) ( not ( = ?auto_1118446 ?auto_1118449 ) ) ( HOIST-AT ?auto_1118450 ?auto_1118446 ) ( not ( = ?auto_1118447 ?auto_1118450 ) ) ( AVAILABLE ?auto_1118450 ) ( SURFACE-AT ?auto_1118444 ?auto_1118446 ) ( ON ?auto_1118444 ?auto_1118445 ) ( CLEAR ?auto_1118444 ) ( not ( = ?auto_1118443 ?auto_1118445 ) ) ( not ( = ?auto_1118444 ?auto_1118445 ) ) ( not ( = ?auto_1118442 ?auto_1118445 ) ) ( SURFACE-AT ?auto_1118442 ?auto_1118449 ) ( CLEAR ?auto_1118442 ) ( IS-CRATE ?auto_1118443 ) ( AVAILABLE ?auto_1118447 ) ( IN ?auto_1118443 ?auto_1118448 ) ( TRUCK-AT ?auto_1118448 ?auto_1118446 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1118443 ?auto_1118444 )
      ( MAKE-2CRATE-VERIFY ?auto_1118442 ?auto_1118443 ?auto_1118444 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1118452 - SURFACE
      ?auto_1118453 - SURFACE
      ?auto_1118454 - SURFACE
      ?auto_1118451 - SURFACE
    )
    :vars
    (
      ?auto_1118459 - HOIST
      ?auto_1118457 - PLACE
      ?auto_1118455 - PLACE
      ?auto_1118458 - HOIST
      ?auto_1118456 - SURFACE
      ?auto_1118460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118459 ?auto_1118457 ) ( IS-CRATE ?auto_1118451 ) ( not ( = ?auto_1118454 ?auto_1118451 ) ) ( not ( = ?auto_1118453 ?auto_1118454 ) ) ( not ( = ?auto_1118453 ?auto_1118451 ) ) ( not ( = ?auto_1118455 ?auto_1118457 ) ) ( HOIST-AT ?auto_1118458 ?auto_1118455 ) ( not ( = ?auto_1118459 ?auto_1118458 ) ) ( AVAILABLE ?auto_1118458 ) ( SURFACE-AT ?auto_1118451 ?auto_1118455 ) ( ON ?auto_1118451 ?auto_1118456 ) ( CLEAR ?auto_1118451 ) ( not ( = ?auto_1118454 ?auto_1118456 ) ) ( not ( = ?auto_1118451 ?auto_1118456 ) ) ( not ( = ?auto_1118453 ?auto_1118456 ) ) ( SURFACE-AT ?auto_1118453 ?auto_1118457 ) ( CLEAR ?auto_1118453 ) ( IS-CRATE ?auto_1118454 ) ( AVAILABLE ?auto_1118459 ) ( IN ?auto_1118454 ?auto_1118460 ) ( TRUCK-AT ?auto_1118460 ?auto_1118455 ) ( ON ?auto_1118453 ?auto_1118452 ) ( not ( = ?auto_1118452 ?auto_1118453 ) ) ( not ( = ?auto_1118452 ?auto_1118454 ) ) ( not ( = ?auto_1118452 ?auto_1118451 ) ) ( not ( = ?auto_1118452 ?auto_1118456 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118453 ?auto_1118454 ?auto_1118451 )
      ( MAKE-3CRATE-VERIFY ?auto_1118452 ?auto_1118453 ?auto_1118454 ?auto_1118451 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1118462 - SURFACE
      ?auto_1118463 - SURFACE
      ?auto_1118464 - SURFACE
      ?auto_1118461 - SURFACE
      ?auto_1118465 - SURFACE
    )
    :vars
    (
      ?auto_1118470 - HOIST
      ?auto_1118468 - PLACE
      ?auto_1118466 - PLACE
      ?auto_1118469 - HOIST
      ?auto_1118467 - SURFACE
      ?auto_1118471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118470 ?auto_1118468 ) ( IS-CRATE ?auto_1118465 ) ( not ( = ?auto_1118461 ?auto_1118465 ) ) ( not ( = ?auto_1118464 ?auto_1118461 ) ) ( not ( = ?auto_1118464 ?auto_1118465 ) ) ( not ( = ?auto_1118466 ?auto_1118468 ) ) ( HOIST-AT ?auto_1118469 ?auto_1118466 ) ( not ( = ?auto_1118470 ?auto_1118469 ) ) ( AVAILABLE ?auto_1118469 ) ( SURFACE-AT ?auto_1118465 ?auto_1118466 ) ( ON ?auto_1118465 ?auto_1118467 ) ( CLEAR ?auto_1118465 ) ( not ( = ?auto_1118461 ?auto_1118467 ) ) ( not ( = ?auto_1118465 ?auto_1118467 ) ) ( not ( = ?auto_1118464 ?auto_1118467 ) ) ( SURFACE-AT ?auto_1118464 ?auto_1118468 ) ( CLEAR ?auto_1118464 ) ( IS-CRATE ?auto_1118461 ) ( AVAILABLE ?auto_1118470 ) ( IN ?auto_1118461 ?auto_1118471 ) ( TRUCK-AT ?auto_1118471 ?auto_1118466 ) ( ON ?auto_1118463 ?auto_1118462 ) ( ON ?auto_1118464 ?auto_1118463 ) ( not ( = ?auto_1118462 ?auto_1118463 ) ) ( not ( = ?auto_1118462 ?auto_1118464 ) ) ( not ( = ?auto_1118462 ?auto_1118461 ) ) ( not ( = ?auto_1118462 ?auto_1118465 ) ) ( not ( = ?auto_1118462 ?auto_1118467 ) ) ( not ( = ?auto_1118463 ?auto_1118464 ) ) ( not ( = ?auto_1118463 ?auto_1118461 ) ) ( not ( = ?auto_1118463 ?auto_1118465 ) ) ( not ( = ?auto_1118463 ?auto_1118467 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118464 ?auto_1118461 ?auto_1118465 )
      ( MAKE-4CRATE-VERIFY ?auto_1118462 ?auto_1118463 ?auto_1118464 ?auto_1118461 ?auto_1118465 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1118473 - SURFACE
      ?auto_1118474 - SURFACE
      ?auto_1118475 - SURFACE
      ?auto_1118472 - SURFACE
      ?auto_1118476 - SURFACE
      ?auto_1118477 - SURFACE
    )
    :vars
    (
      ?auto_1118482 - HOIST
      ?auto_1118480 - PLACE
      ?auto_1118478 - PLACE
      ?auto_1118481 - HOIST
      ?auto_1118479 - SURFACE
      ?auto_1118483 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118482 ?auto_1118480 ) ( IS-CRATE ?auto_1118477 ) ( not ( = ?auto_1118476 ?auto_1118477 ) ) ( not ( = ?auto_1118472 ?auto_1118476 ) ) ( not ( = ?auto_1118472 ?auto_1118477 ) ) ( not ( = ?auto_1118478 ?auto_1118480 ) ) ( HOIST-AT ?auto_1118481 ?auto_1118478 ) ( not ( = ?auto_1118482 ?auto_1118481 ) ) ( AVAILABLE ?auto_1118481 ) ( SURFACE-AT ?auto_1118477 ?auto_1118478 ) ( ON ?auto_1118477 ?auto_1118479 ) ( CLEAR ?auto_1118477 ) ( not ( = ?auto_1118476 ?auto_1118479 ) ) ( not ( = ?auto_1118477 ?auto_1118479 ) ) ( not ( = ?auto_1118472 ?auto_1118479 ) ) ( SURFACE-AT ?auto_1118472 ?auto_1118480 ) ( CLEAR ?auto_1118472 ) ( IS-CRATE ?auto_1118476 ) ( AVAILABLE ?auto_1118482 ) ( IN ?auto_1118476 ?auto_1118483 ) ( TRUCK-AT ?auto_1118483 ?auto_1118478 ) ( ON ?auto_1118474 ?auto_1118473 ) ( ON ?auto_1118475 ?auto_1118474 ) ( ON ?auto_1118472 ?auto_1118475 ) ( not ( = ?auto_1118473 ?auto_1118474 ) ) ( not ( = ?auto_1118473 ?auto_1118475 ) ) ( not ( = ?auto_1118473 ?auto_1118472 ) ) ( not ( = ?auto_1118473 ?auto_1118476 ) ) ( not ( = ?auto_1118473 ?auto_1118477 ) ) ( not ( = ?auto_1118473 ?auto_1118479 ) ) ( not ( = ?auto_1118474 ?auto_1118475 ) ) ( not ( = ?auto_1118474 ?auto_1118472 ) ) ( not ( = ?auto_1118474 ?auto_1118476 ) ) ( not ( = ?auto_1118474 ?auto_1118477 ) ) ( not ( = ?auto_1118474 ?auto_1118479 ) ) ( not ( = ?auto_1118475 ?auto_1118472 ) ) ( not ( = ?auto_1118475 ?auto_1118476 ) ) ( not ( = ?auto_1118475 ?auto_1118477 ) ) ( not ( = ?auto_1118475 ?auto_1118479 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118472 ?auto_1118476 ?auto_1118477 )
      ( MAKE-5CRATE-VERIFY ?auto_1118473 ?auto_1118474 ?auto_1118475 ?auto_1118472 ?auto_1118476 ?auto_1118477 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1118485 - SURFACE
      ?auto_1118486 - SURFACE
      ?auto_1118487 - SURFACE
      ?auto_1118484 - SURFACE
      ?auto_1118488 - SURFACE
      ?auto_1118490 - SURFACE
      ?auto_1118489 - SURFACE
    )
    :vars
    (
      ?auto_1118495 - HOIST
      ?auto_1118493 - PLACE
      ?auto_1118491 - PLACE
      ?auto_1118494 - HOIST
      ?auto_1118492 - SURFACE
      ?auto_1118496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118495 ?auto_1118493 ) ( IS-CRATE ?auto_1118489 ) ( not ( = ?auto_1118490 ?auto_1118489 ) ) ( not ( = ?auto_1118488 ?auto_1118490 ) ) ( not ( = ?auto_1118488 ?auto_1118489 ) ) ( not ( = ?auto_1118491 ?auto_1118493 ) ) ( HOIST-AT ?auto_1118494 ?auto_1118491 ) ( not ( = ?auto_1118495 ?auto_1118494 ) ) ( AVAILABLE ?auto_1118494 ) ( SURFACE-AT ?auto_1118489 ?auto_1118491 ) ( ON ?auto_1118489 ?auto_1118492 ) ( CLEAR ?auto_1118489 ) ( not ( = ?auto_1118490 ?auto_1118492 ) ) ( not ( = ?auto_1118489 ?auto_1118492 ) ) ( not ( = ?auto_1118488 ?auto_1118492 ) ) ( SURFACE-AT ?auto_1118488 ?auto_1118493 ) ( CLEAR ?auto_1118488 ) ( IS-CRATE ?auto_1118490 ) ( AVAILABLE ?auto_1118495 ) ( IN ?auto_1118490 ?auto_1118496 ) ( TRUCK-AT ?auto_1118496 ?auto_1118491 ) ( ON ?auto_1118486 ?auto_1118485 ) ( ON ?auto_1118487 ?auto_1118486 ) ( ON ?auto_1118484 ?auto_1118487 ) ( ON ?auto_1118488 ?auto_1118484 ) ( not ( = ?auto_1118485 ?auto_1118486 ) ) ( not ( = ?auto_1118485 ?auto_1118487 ) ) ( not ( = ?auto_1118485 ?auto_1118484 ) ) ( not ( = ?auto_1118485 ?auto_1118488 ) ) ( not ( = ?auto_1118485 ?auto_1118490 ) ) ( not ( = ?auto_1118485 ?auto_1118489 ) ) ( not ( = ?auto_1118485 ?auto_1118492 ) ) ( not ( = ?auto_1118486 ?auto_1118487 ) ) ( not ( = ?auto_1118486 ?auto_1118484 ) ) ( not ( = ?auto_1118486 ?auto_1118488 ) ) ( not ( = ?auto_1118486 ?auto_1118490 ) ) ( not ( = ?auto_1118486 ?auto_1118489 ) ) ( not ( = ?auto_1118486 ?auto_1118492 ) ) ( not ( = ?auto_1118487 ?auto_1118484 ) ) ( not ( = ?auto_1118487 ?auto_1118488 ) ) ( not ( = ?auto_1118487 ?auto_1118490 ) ) ( not ( = ?auto_1118487 ?auto_1118489 ) ) ( not ( = ?auto_1118487 ?auto_1118492 ) ) ( not ( = ?auto_1118484 ?auto_1118488 ) ) ( not ( = ?auto_1118484 ?auto_1118490 ) ) ( not ( = ?auto_1118484 ?auto_1118489 ) ) ( not ( = ?auto_1118484 ?auto_1118492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118488 ?auto_1118490 ?auto_1118489 )
      ( MAKE-6CRATE-VERIFY ?auto_1118485 ?auto_1118486 ?auto_1118487 ?auto_1118484 ?auto_1118488 ?auto_1118490 ?auto_1118489 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1118498 - SURFACE
      ?auto_1118499 - SURFACE
      ?auto_1118500 - SURFACE
      ?auto_1118497 - SURFACE
      ?auto_1118501 - SURFACE
      ?auto_1118503 - SURFACE
      ?auto_1118502 - SURFACE
      ?auto_1118504 - SURFACE
    )
    :vars
    (
      ?auto_1118509 - HOIST
      ?auto_1118507 - PLACE
      ?auto_1118505 - PLACE
      ?auto_1118508 - HOIST
      ?auto_1118506 - SURFACE
      ?auto_1118510 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118509 ?auto_1118507 ) ( IS-CRATE ?auto_1118504 ) ( not ( = ?auto_1118502 ?auto_1118504 ) ) ( not ( = ?auto_1118503 ?auto_1118502 ) ) ( not ( = ?auto_1118503 ?auto_1118504 ) ) ( not ( = ?auto_1118505 ?auto_1118507 ) ) ( HOIST-AT ?auto_1118508 ?auto_1118505 ) ( not ( = ?auto_1118509 ?auto_1118508 ) ) ( AVAILABLE ?auto_1118508 ) ( SURFACE-AT ?auto_1118504 ?auto_1118505 ) ( ON ?auto_1118504 ?auto_1118506 ) ( CLEAR ?auto_1118504 ) ( not ( = ?auto_1118502 ?auto_1118506 ) ) ( not ( = ?auto_1118504 ?auto_1118506 ) ) ( not ( = ?auto_1118503 ?auto_1118506 ) ) ( SURFACE-AT ?auto_1118503 ?auto_1118507 ) ( CLEAR ?auto_1118503 ) ( IS-CRATE ?auto_1118502 ) ( AVAILABLE ?auto_1118509 ) ( IN ?auto_1118502 ?auto_1118510 ) ( TRUCK-AT ?auto_1118510 ?auto_1118505 ) ( ON ?auto_1118499 ?auto_1118498 ) ( ON ?auto_1118500 ?auto_1118499 ) ( ON ?auto_1118497 ?auto_1118500 ) ( ON ?auto_1118501 ?auto_1118497 ) ( ON ?auto_1118503 ?auto_1118501 ) ( not ( = ?auto_1118498 ?auto_1118499 ) ) ( not ( = ?auto_1118498 ?auto_1118500 ) ) ( not ( = ?auto_1118498 ?auto_1118497 ) ) ( not ( = ?auto_1118498 ?auto_1118501 ) ) ( not ( = ?auto_1118498 ?auto_1118503 ) ) ( not ( = ?auto_1118498 ?auto_1118502 ) ) ( not ( = ?auto_1118498 ?auto_1118504 ) ) ( not ( = ?auto_1118498 ?auto_1118506 ) ) ( not ( = ?auto_1118499 ?auto_1118500 ) ) ( not ( = ?auto_1118499 ?auto_1118497 ) ) ( not ( = ?auto_1118499 ?auto_1118501 ) ) ( not ( = ?auto_1118499 ?auto_1118503 ) ) ( not ( = ?auto_1118499 ?auto_1118502 ) ) ( not ( = ?auto_1118499 ?auto_1118504 ) ) ( not ( = ?auto_1118499 ?auto_1118506 ) ) ( not ( = ?auto_1118500 ?auto_1118497 ) ) ( not ( = ?auto_1118500 ?auto_1118501 ) ) ( not ( = ?auto_1118500 ?auto_1118503 ) ) ( not ( = ?auto_1118500 ?auto_1118502 ) ) ( not ( = ?auto_1118500 ?auto_1118504 ) ) ( not ( = ?auto_1118500 ?auto_1118506 ) ) ( not ( = ?auto_1118497 ?auto_1118501 ) ) ( not ( = ?auto_1118497 ?auto_1118503 ) ) ( not ( = ?auto_1118497 ?auto_1118502 ) ) ( not ( = ?auto_1118497 ?auto_1118504 ) ) ( not ( = ?auto_1118497 ?auto_1118506 ) ) ( not ( = ?auto_1118501 ?auto_1118503 ) ) ( not ( = ?auto_1118501 ?auto_1118502 ) ) ( not ( = ?auto_1118501 ?auto_1118504 ) ) ( not ( = ?auto_1118501 ?auto_1118506 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118503 ?auto_1118502 ?auto_1118504 )
      ( MAKE-7CRATE-VERIFY ?auto_1118498 ?auto_1118499 ?auto_1118500 ?auto_1118497 ?auto_1118501 ?auto_1118503 ?auto_1118502 ?auto_1118504 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1118512 - SURFACE
      ?auto_1118513 - SURFACE
      ?auto_1118514 - SURFACE
      ?auto_1118511 - SURFACE
      ?auto_1118515 - SURFACE
      ?auto_1118517 - SURFACE
      ?auto_1118516 - SURFACE
      ?auto_1118518 - SURFACE
      ?auto_1118519 - SURFACE
    )
    :vars
    (
      ?auto_1118524 - HOIST
      ?auto_1118522 - PLACE
      ?auto_1118520 - PLACE
      ?auto_1118523 - HOIST
      ?auto_1118521 - SURFACE
      ?auto_1118525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118524 ?auto_1118522 ) ( IS-CRATE ?auto_1118519 ) ( not ( = ?auto_1118518 ?auto_1118519 ) ) ( not ( = ?auto_1118516 ?auto_1118518 ) ) ( not ( = ?auto_1118516 ?auto_1118519 ) ) ( not ( = ?auto_1118520 ?auto_1118522 ) ) ( HOIST-AT ?auto_1118523 ?auto_1118520 ) ( not ( = ?auto_1118524 ?auto_1118523 ) ) ( AVAILABLE ?auto_1118523 ) ( SURFACE-AT ?auto_1118519 ?auto_1118520 ) ( ON ?auto_1118519 ?auto_1118521 ) ( CLEAR ?auto_1118519 ) ( not ( = ?auto_1118518 ?auto_1118521 ) ) ( not ( = ?auto_1118519 ?auto_1118521 ) ) ( not ( = ?auto_1118516 ?auto_1118521 ) ) ( SURFACE-AT ?auto_1118516 ?auto_1118522 ) ( CLEAR ?auto_1118516 ) ( IS-CRATE ?auto_1118518 ) ( AVAILABLE ?auto_1118524 ) ( IN ?auto_1118518 ?auto_1118525 ) ( TRUCK-AT ?auto_1118525 ?auto_1118520 ) ( ON ?auto_1118513 ?auto_1118512 ) ( ON ?auto_1118514 ?auto_1118513 ) ( ON ?auto_1118511 ?auto_1118514 ) ( ON ?auto_1118515 ?auto_1118511 ) ( ON ?auto_1118517 ?auto_1118515 ) ( ON ?auto_1118516 ?auto_1118517 ) ( not ( = ?auto_1118512 ?auto_1118513 ) ) ( not ( = ?auto_1118512 ?auto_1118514 ) ) ( not ( = ?auto_1118512 ?auto_1118511 ) ) ( not ( = ?auto_1118512 ?auto_1118515 ) ) ( not ( = ?auto_1118512 ?auto_1118517 ) ) ( not ( = ?auto_1118512 ?auto_1118516 ) ) ( not ( = ?auto_1118512 ?auto_1118518 ) ) ( not ( = ?auto_1118512 ?auto_1118519 ) ) ( not ( = ?auto_1118512 ?auto_1118521 ) ) ( not ( = ?auto_1118513 ?auto_1118514 ) ) ( not ( = ?auto_1118513 ?auto_1118511 ) ) ( not ( = ?auto_1118513 ?auto_1118515 ) ) ( not ( = ?auto_1118513 ?auto_1118517 ) ) ( not ( = ?auto_1118513 ?auto_1118516 ) ) ( not ( = ?auto_1118513 ?auto_1118518 ) ) ( not ( = ?auto_1118513 ?auto_1118519 ) ) ( not ( = ?auto_1118513 ?auto_1118521 ) ) ( not ( = ?auto_1118514 ?auto_1118511 ) ) ( not ( = ?auto_1118514 ?auto_1118515 ) ) ( not ( = ?auto_1118514 ?auto_1118517 ) ) ( not ( = ?auto_1118514 ?auto_1118516 ) ) ( not ( = ?auto_1118514 ?auto_1118518 ) ) ( not ( = ?auto_1118514 ?auto_1118519 ) ) ( not ( = ?auto_1118514 ?auto_1118521 ) ) ( not ( = ?auto_1118511 ?auto_1118515 ) ) ( not ( = ?auto_1118511 ?auto_1118517 ) ) ( not ( = ?auto_1118511 ?auto_1118516 ) ) ( not ( = ?auto_1118511 ?auto_1118518 ) ) ( not ( = ?auto_1118511 ?auto_1118519 ) ) ( not ( = ?auto_1118511 ?auto_1118521 ) ) ( not ( = ?auto_1118515 ?auto_1118517 ) ) ( not ( = ?auto_1118515 ?auto_1118516 ) ) ( not ( = ?auto_1118515 ?auto_1118518 ) ) ( not ( = ?auto_1118515 ?auto_1118519 ) ) ( not ( = ?auto_1118515 ?auto_1118521 ) ) ( not ( = ?auto_1118517 ?auto_1118516 ) ) ( not ( = ?auto_1118517 ?auto_1118518 ) ) ( not ( = ?auto_1118517 ?auto_1118519 ) ) ( not ( = ?auto_1118517 ?auto_1118521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118516 ?auto_1118518 ?auto_1118519 )
      ( MAKE-8CRATE-VERIFY ?auto_1118512 ?auto_1118513 ?auto_1118514 ?auto_1118511 ?auto_1118515 ?auto_1118517 ?auto_1118516 ?auto_1118518 ?auto_1118519 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1118526 - SURFACE
      ?auto_1118527 - SURFACE
    )
    :vars
    (
      ?auto_1118533 - HOIST
      ?auto_1118531 - PLACE
      ?auto_1118530 - SURFACE
      ?auto_1118528 - PLACE
      ?auto_1118532 - HOIST
      ?auto_1118529 - SURFACE
      ?auto_1118534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118533 ?auto_1118531 ) ( IS-CRATE ?auto_1118527 ) ( not ( = ?auto_1118526 ?auto_1118527 ) ) ( not ( = ?auto_1118530 ?auto_1118526 ) ) ( not ( = ?auto_1118530 ?auto_1118527 ) ) ( not ( = ?auto_1118528 ?auto_1118531 ) ) ( HOIST-AT ?auto_1118532 ?auto_1118528 ) ( not ( = ?auto_1118533 ?auto_1118532 ) ) ( SURFACE-AT ?auto_1118527 ?auto_1118528 ) ( ON ?auto_1118527 ?auto_1118529 ) ( CLEAR ?auto_1118527 ) ( not ( = ?auto_1118526 ?auto_1118529 ) ) ( not ( = ?auto_1118527 ?auto_1118529 ) ) ( not ( = ?auto_1118530 ?auto_1118529 ) ) ( SURFACE-AT ?auto_1118530 ?auto_1118531 ) ( CLEAR ?auto_1118530 ) ( IS-CRATE ?auto_1118526 ) ( AVAILABLE ?auto_1118533 ) ( TRUCK-AT ?auto_1118534 ?auto_1118528 ) ( LIFTING ?auto_1118532 ?auto_1118526 ) )
    :subtasks
    ( ( !LOAD ?auto_1118532 ?auto_1118526 ?auto_1118534 ?auto_1118528 )
      ( MAKE-2CRATE ?auto_1118530 ?auto_1118526 ?auto_1118527 )
      ( MAKE-1CRATE-VERIFY ?auto_1118526 ?auto_1118527 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1118535 - SURFACE
      ?auto_1118536 - SURFACE
      ?auto_1118537 - SURFACE
    )
    :vars
    (
      ?auto_1118542 - HOIST
      ?auto_1118543 - PLACE
      ?auto_1118541 - PLACE
      ?auto_1118540 - HOIST
      ?auto_1118539 - SURFACE
      ?auto_1118538 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118542 ?auto_1118543 ) ( IS-CRATE ?auto_1118537 ) ( not ( = ?auto_1118536 ?auto_1118537 ) ) ( not ( = ?auto_1118535 ?auto_1118536 ) ) ( not ( = ?auto_1118535 ?auto_1118537 ) ) ( not ( = ?auto_1118541 ?auto_1118543 ) ) ( HOIST-AT ?auto_1118540 ?auto_1118541 ) ( not ( = ?auto_1118542 ?auto_1118540 ) ) ( SURFACE-AT ?auto_1118537 ?auto_1118541 ) ( ON ?auto_1118537 ?auto_1118539 ) ( CLEAR ?auto_1118537 ) ( not ( = ?auto_1118536 ?auto_1118539 ) ) ( not ( = ?auto_1118537 ?auto_1118539 ) ) ( not ( = ?auto_1118535 ?auto_1118539 ) ) ( SURFACE-AT ?auto_1118535 ?auto_1118543 ) ( CLEAR ?auto_1118535 ) ( IS-CRATE ?auto_1118536 ) ( AVAILABLE ?auto_1118542 ) ( TRUCK-AT ?auto_1118538 ?auto_1118541 ) ( LIFTING ?auto_1118540 ?auto_1118536 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1118536 ?auto_1118537 )
      ( MAKE-2CRATE-VERIFY ?auto_1118535 ?auto_1118536 ?auto_1118537 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1118545 - SURFACE
      ?auto_1118546 - SURFACE
      ?auto_1118547 - SURFACE
      ?auto_1118544 - SURFACE
    )
    :vars
    (
      ?auto_1118553 - HOIST
      ?auto_1118549 - PLACE
      ?auto_1118548 - PLACE
      ?auto_1118552 - HOIST
      ?auto_1118551 - SURFACE
      ?auto_1118550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118553 ?auto_1118549 ) ( IS-CRATE ?auto_1118544 ) ( not ( = ?auto_1118547 ?auto_1118544 ) ) ( not ( = ?auto_1118546 ?auto_1118547 ) ) ( not ( = ?auto_1118546 ?auto_1118544 ) ) ( not ( = ?auto_1118548 ?auto_1118549 ) ) ( HOIST-AT ?auto_1118552 ?auto_1118548 ) ( not ( = ?auto_1118553 ?auto_1118552 ) ) ( SURFACE-AT ?auto_1118544 ?auto_1118548 ) ( ON ?auto_1118544 ?auto_1118551 ) ( CLEAR ?auto_1118544 ) ( not ( = ?auto_1118547 ?auto_1118551 ) ) ( not ( = ?auto_1118544 ?auto_1118551 ) ) ( not ( = ?auto_1118546 ?auto_1118551 ) ) ( SURFACE-AT ?auto_1118546 ?auto_1118549 ) ( CLEAR ?auto_1118546 ) ( IS-CRATE ?auto_1118547 ) ( AVAILABLE ?auto_1118553 ) ( TRUCK-AT ?auto_1118550 ?auto_1118548 ) ( LIFTING ?auto_1118552 ?auto_1118547 ) ( ON ?auto_1118546 ?auto_1118545 ) ( not ( = ?auto_1118545 ?auto_1118546 ) ) ( not ( = ?auto_1118545 ?auto_1118547 ) ) ( not ( = ?auto_1118545 ?auto_1118544 ) ) ( not ( = ?auto_1118545 ?auto_1118551 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118546 ?auto_1118547 ?auto_1118544 )
      ( MAKE-3CRATE-VERIFY ?auto_1118545 ?auto_1118546 ?auto_1118547 ?auto_1118544 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1118555 - SURFACE
      ?auto_1118556 - SURFACE
      ?auto_1118557 - SURFACE
      ?auto_1118554 - SURFACE
      ?auto_1118558 - SURFACE
    )
    :vars
    (
      ?auto_1118564 - HOIST
      ?auto_1118560 - PLACE
      ?auto_1118559 - PLACE
      ?auto_1118563 - HOIST
      ?auto_1118562 - SURFACE
      ?auto_1118561 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118564 ?auto_1118560 ) ( IS-CRATE ?auto_1118558 ) ( not ( = ?auto_1118554 ?auto_1118558 ) ) ( not ( = ?auto_1118557 ?auto_1118554 ) ) ( not ( = ?auto_1118557 ?auto_1118558 ) ) ( not ( = ?auto_1118559 ?auto_1118560 ) ) ( HOIST-AT ?auto_1118563 ?auto_1118559 ) ( not ( = ?auto_1118564 ?auto_1118563 ) ) ( SURFACE-AT ?auto_1118558 ?auto_1118559 ) ( ON ?auto_1118558 ?auto_1118562 ) ( CLEAR ?auto_1118558 ) ( not ( = ?auto_1118554 ?auto_1118562 ) ) ( not ( = ?auto_1118558 ?auto_1118562 ) ) ( not ( = ?auto_1118557 ?auto_1118562 ) ) ( SURFACE-AT ?auto_1118557 ?auto_1118560 ) ( CLEAR ?auto_1118557 ) ( IS-CRATE ?auto_1118554 ) ( AVAILABLE ?auto_1118564 ) ( TRUCK-AT ?auto_1118561 ?auto_1118559 ) ( LIFTING ?auto_1118563 ?auto_1118554 ) ( ON ?auto_1118556 ?auto_1118555 ) ( ON ?auto_1118557 ?auto_1118556 ) ( not ( = ?auto_1118555 ?auto_1118556 ) ) ( not ( = ?auto_1118555 ?auto_1118557 ) ) ( not ( = ?auto_1118555 ?auto_1118554 ) ) ( not ( = ?auto_1118555 ?auto_1118558 ) ) ( not ( = ?auto_1118555 ?auto_1118562 ) ) ( not ( = ?auto_1118556 ?auto_1118557 ) ) ( not ( = ?auto_1118556 ?auto_1118554 ) ) ( not ( = ?auto_1118556 ?auto_1118558 ) ) ( not ( = ?auto_1118556 ?auto_1118562 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118557 ?auto_1118554 ?auto_1118558 )
      ( MAKE-4CRATE-VERIFY ?auto_1118555 ?auto_1118556 ?auto_1118557 ?auto_1118554 ?auto_1118558 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1118566 - SURFACE
      ?auto_1118567 - SURFACE
      ?auto_1118568 - SURFACE
      ?auto_1118565 - SURFACE
      ?auto_1118569 - SURFACE
      ?auto_1118570 - SURFACE
    )
    :vars
    (
      ?auto_1118576 - HOIST
      ?auto_1118572 - PLACE
      ?auto_1118571 - PLACE
      ?auto_1118575 - HOIST
      ?auto_1118574 - SURFACE
      ?auto_1118573 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118576 ?auto_1118572 ) ( IS-CRATE ?auto_1118570 ) ( not ( = ?auto_1118569 ?auto_1118570 ) ) ( not ( = ?auto_1118565 ?auto_1118569 ) ) ( not ( = ?auto_1118565 ?auto_1118570 ) ) ( not ( = ?auto_1118571 ?auto_1118572 ) ) ( HOIST-AT ?auto_1118575 ?auto_1118571 ) ( not ( = ?auto_1118576 ?auto_1118575 ) ) ( SURFACE-AT ?auto_1118570 ?auto_1118571 ) ( ON ?auto_1118570 ?auto_1118574 ) ( CLEAR ?auto_1118570 ) ( not ( = ?auto_1118569 ?auto_1118574 ) ) ( not ( = ?auto_1118570 ?auto_1118574 ) ) ( not ( = ?auto_1118565 ?auto_1118574 ) ) ( SURFACE-AT ?auto_1118565 ?auto_1118572 ) ( CLEAR ?auto_1118565 ) ( IS-CRATE ?auto_1118569 ) ( AVAILABLE ?auto_1118576 ) ( TRUCK-AT ?auto_1118573 ?auto_1118571 ) ( LIFTING ?auto_1118575 ?auto_1118569 ) ( ON ?auto_1118567 ?auto_1118566 ) ( ON ?auto_1118568 ?auto_1118567 ) ( ON ?auto_1118565 ?auto_1118568 ) ( not ( = ?auto_1118566 ?auto_1118567 ) ) ( not ( = ?auto_1118566 ?auto_1118568 ) ) ( not ( = ?auto_1118566 ?auto_1118565 ) ) ( not ( = ?auto_1118566 ?auto_1118569 ) ) ( not ( = ?auto_1118566 ?auto_1118570 ) ) ( not ( = ?auto_1118566 ?auto_1118574 ) ) ( not ( = ?auto_1118567 ?auto_1118568 ) ) ( not ( = ?auto_1118567 ?auto_1118565 ) ) ( not ( = ?auto_1118567 ?auto_1118569 ) ) ( not ( = ?auto_1118567 ?auto_1118570 ) ) ( not ( = ?auto_1118567 ?auto_1118574 ) ) ( not ( = ?auto_1118568 ?auto_1118565 ) ) ( not ( = ?auto_1118568 ?auto_1118569 ) ) ( not ( = ?auto_1118568 ?auto_1118570 ) ) ( not ( = ?auto_1118568 ?auto_1118574 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118565 ?auto_1118569 ?auto_1118570 )
      ( MAKE-5CRATE-VERIFY ?auto_1118566 ?auto_1118567 ?auto_1118568 ?auto_1118565 ?auto_1118569 ?auto_1118570 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1118578 - SURFACE
      ?auto_1118579 - SURFACE
      ?auto_1118580 - SURFACE
      ?auto_1118577 - SURFACE
      ?auto_1118581 - SURFACE
      ?auto_1118583 - SURFACE
      ?auto_1118582 - SURFACE
    )
    :vars
    (
      ?auto_1118589 - HOIST
      ?auto_1118585 - PLACE
      ?auto_1118584 - PLACE
      ?auto_1118588 - HOIST
      ?auto_1118587 - SURFACE
      ?auto_1118586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118589 ?auto_1118585 ) ( IS-CRATE ?auto_1118582 ) ( not ( = ?auto_1118583 ?auto_1118582 ) ) ( not ( = ?auto_1118581 ?auto_1118583 ) ) ( not ( = ?auto_1118581 ?auto_1118582 ) ) ( not ( = ?auto_1118584 ?auto_1118585 ) ) ( HOIST-AT ?auto_1118588 ?auto_1118584 ) ( not ( = ?auto_1118589 ?auto_1118588 ) ) ( SURFACE-AT ?auto_1118582 ?auto_1118584 ) ( ON ?auto_1118582 ?auto_1118587 ) ( CLEAR ?auto_1118582 ) ( not ( = ?auto_1118583 ?auto_1118587 ) ) ( not ( = ?auto_1118582 ?auto_1118587 ) ) ( not ( = ?auto_1118581 ?auto_1118587 ) ) ( SURFACE-AT ?auto_1118581 ?auto_1118585 ) ( CLEAR ?auto_1118581 ) ( IS-CRATE ?auto_1118583 ) ( AVAILABLE ?auto_1118589 ) ( TRUCK-AT ?auto_1118586 ?auto_1118584 ) ( LIFTING ?auto_1118588 ?auto_1118583 ) ( ON ?auto_1118579 ?auto_1118578 ) ( ON ?auto_1118580 ?auto_1118579 ) ( ON ?auto_1118577 ?auto_1118580 ) ( ON ?auto_1118581 ?auto_1118577 ) ( not ( = ?auto_1118578 ?auto_1118579 ) ) ( not ( = ?auto_1118578 ?auto_1118580 ) ) ( not ( = ?auto_1118578 ?auto_1118577 ) ) ( not ( = ?auto_1118578 ?auto_1118581 ) ) ( not ( = ?auto_1118578 ?auto_1118583 ) ) ( not ( = ?auto_1118578 ?auto_1118582 ) ) ( not ( = ?auto_1118578 ?auto_1118587 ) ) ( not ( = ?auto_1118579 ?auto_1118580 ) ) ( not ( = ?auto_1118579 ?auto_1118577 ) ) ( not ( = ?auto_1118579 ?auto_1118581 ) ) ( not ( = ?auto_1118579 ?auto_1118583 ) ) ( not ( = ?auto_1118579 ?auto_1118582 ) ) ( not ( = ?auto_1118579 ?auto_1118587 ) ) ( not ( = ?auto_1118580 ?auto_1118577 ) ) ( not ( = ?auto_1118580 ?auto_1118581 ) ) ( not ( = ?auto_1118580 ?auto_1118583 ) ) ( not ( = ?auto_1118580 ?auto_1118582 ) ) ( not ( = ?auto_1118580 ?auto_1118587 ) ) ( not ( = ?auto_1118577 ?auto_1118581 ) ) ( not ( = ?auto_1118577 ?auto_1118583 ) ) ( not ( = ?auto_1118577 ?auto_1118582 ) ) ( not ( = ?auto_1118577 ?auto_1118587 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118581 ?auto_1118583 ?auto_1118582 )
      ( MAKE-6CRATE-VERIFY ?auto_1118578 ?auto_1118579 ?auto_1118580 ?auto_1118577 ?auto_1118581 ?auto_1118583 ?auto_1118582 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1118591 - SURFACE
      ?auto_1118592 - SURFACE
      ?auto_1118593 - SURFACE
      ?auto_1118590 - SURFACE
      ?auto_1118594 - SURFACE
      ?auto_1118596 - SURFACE
      ?auto_1118595 - SURFACE
      ?auto_1118597 - SURFACE
    )
    :vars
    (
      ?auto_1118603 - HOIST
      ?auto_1118599 - PLACE
      ?auto_1118598 - PLACE
      ?auto_1118602 - HOIST
      ?auto_1118601 - SURFACE
      ?auto_1118600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118603 ?auto_1118599 ) ( IS-CRATE ?auto_1118597 ) ( not ( = ?auto_1118595 ?auto_1118597 ) ) ( not ( = ?auto_1118596 ?auto_1118595 ) ) ( not ( = ?auto_1118596 ?auto_1118597 ) ) ( not ( = ?auto_1118598 ?auto_1118599 ) ) ( HOIST-AT ?auto_1118602 ?auto_1118598 ) ( not ( = ?auto_1118603 ?auto_1118602 ) ) ( SURFACE-AT ?auto_1118597 ?auto_1118598 ) ( ON ?auto_1118597 ?auto_1118601 ) ( CLEAR ?auto_1118597 ) ( not ( = ?auto_1118595 ?auto_1118601 ) ) ( not ( = ?auto_1118597 ?auto_1118601 ) ) ( not ( = ?auto_1118596 ?auto_1118601 ) ) ( SURFACE-AT ?auto_1118596 ?auto_1118599 ) ( CLEAR ?auto_1118596 ) ( IS-CRATE ?auto_1118595 ) ( AVAILABLE ?auto_1118603 ) ( TRUCK-AT ?auto_1118600 ?auto_1118598 ) ( LIFTING ?auto_1118602 ?auto_1118595 ) ( ON ?auto_1118592 ?auto_1118591 ) ( ON ?auto_1118593 ?auto_1118592 ) ( ON ?auto_1118590 ?auto_1118593 ) ( ON ?auto_1118594 ?auto_1118590 ) ( ON ?auto_1118596 ?auto_1118594 ) ( not ( = ?auto_1118591 ?auto_1118592 ) ) ( not ( = ?auto_1118591 ?auto_1118593 ) ) ( not ( = ?auto_1118591 ?auto_1118590 ) ) ( not ( = ?auto_1118591 ?auto_1118594 ) ) ( not ( = ?auto_1118591 ?auto_1118596 ) ) ( not ( = ?auto_1118591 ?auto_1118595 ) ) ( not ( = ?auto_1118591 ?auto_1118597 ) ) ( not ( = ?auto_1118591 ?auto_1118601 ) ) ( not ( = ?auto_1118592 ?auto_1118593 ) ) ( not ( = ?auto_1118592 ?auto_1118590 ) ) ( not ( = ?auto_1118592 ?auto_1118594 ) ) ( not ( = ?auto_1118592 ?auto_1118596 ) ) ( not ( = ?auto_1118592 ?auto_1118595 ) ) ( not ( = ?auto_1118592 ?auto_1118597 ) ) ( not ( = ?auto_1118592 ?auto_1118601 ) ) ( not ( = ?auto_1118593 ?auto_1118590 ) ) ( not ( = ?auto_1118593 ?auto_1118594 ) ) ( not ( = ?auto_1118593 ?auto_1118596 ) ) ( not ( = ?auto_1118593 ?auto_1118595 ) ) ( not ( = ?auto_1118593 ?auto_1118597 ) ) ( not ( = ?auto_1118593 ?auto_1118601 ) ) ( not ( = ?auto_1118590 ?auto_1118594 ) ) ( not ( = ?auto_1118590 ?auto_1118596 ) ) ( not ( = ?auto_1118590 ?auto_1118595 ) ) ( not ( = ?auto_1118590 ?auto_1118597 ) ) ( not ( = ?auto_1118590 ?auto_1118601 ) ) ( not ( = ?auto_1118594 ?auto_1118596 ) ) ( not ( = ?auto_1118594 ?auto_1118595 ) ) ( not ( = ?auto_1118594 ?auto_1118597 ) ) ( not ( = ?auto_1118594 ?auto_1118601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118596 ?auto_1118595 ?auto_1118597 )
      ( MAKE-7CRATE-VERIFY ?auto_1118591 ?auto_1118592 ?auto_1118593 ?auto_1118590 ?auto_1118594 ?auto_1118596 ?auto_1118595 ?auto_1118597 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1118605 - SURFACE
      ?auto_1118606 - SURFACE
      ?auto_1118607 - SURFACE
      ?auto_1118604 - SURFACE
      ?auto_1118608 - SURFACE
      ?auto_1118610 - SURFACE
      ?auto_1118609 - SURFACE
      ?auto_1118611 - SURFACE
      ?auto_1118612 - SURFACE
    )
    :vars
    (
      ?auto_1118618 - HOIST
      ?auto_1118614 - PLACE
      ?auto_1118613 - PLACE
      ?auto_1118617 - HOIST
      ?auto_1118616 - SURFACE
      ?auto_1118615 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118618 ?auto_1118614 ) ( IS-CRATE ?auto_1118612 ) ( not ( = ?auto_1118611 ?auto_1118612 ) ) ( not ( = ?auto_1118609 ?auto_1118611 ) ) ( not ( = ?auto_1118609 ?auto_1118612 ) ) ( not ( = ?auto_1118613 ?auto_1118614 ) ) ( HOIST-AT ?auto_1118617 ?auto_1118613 ) ( not ( = ?auto_1118618 ?auto_1118617 ) ) ( SURFACE-AT ?auto_1118612 ?auto_1118613 ) ( ON ?auto_1118612 ?auto_1118616 ) ( CLEAR ?auto_1118612 ) ( not ( = ?auto_1118611 ?auto_1118616 ) ) ( not ( = ?auto_1118612 ?auto_1118616 ) ) ( not ( = ?auto_1118609 ?auto_1118616 ) ) ( SURFACE-AT ?auto_1118609 ?auto_1118614 ) ( CLEAR ?auto_1118609 ) ( IS-CRATE ?auto_1118611 ) ( AVAILABLE ?auto_1118618 ) ( TRUCK-AT ?auto_1118615 ?auto_1118613 ) ( LIFTING ?auto_1118617 ?auto_1118611 ) ( ON ?auto_1118606 ?auto_1118605 ) ( ON ?auto_1118607 ?auto_1118606 ) ( ON ?auto_1118604 ?auto_1118607 ) ( ON ?auto_1118608 ?auto_1118604 ) ( ON ?auto_1118610 ?auto_1118608 ) ( ON ?auto_1118609 ?auto_1118610 ) ( not ( = ?auto_1118605 ?auto_1118606 ) ) ( not ( = ?auto_1118605 ?auto_1118607 ) ) ( not ( = ?auto_1118605 ?auto_1118604 ) ) ( not ( = ?auto_1118605 ?auto_1118608 ) ) ( not ( = ?auto_1118605 ?auto_1118610 ) ) ( not ( = ?auto_1118605 ?auto_1118609 ) ) ( not ( = ?auto_1118605 ?auto_1118611 ) ) ( not ( = ?auto_1118605 ?auto_1118612 ) ) ( not ( = ?auto_1118605 ?auto_1118616 ) ) ( not ( = ?auto_1118606 ?auto_1118607 ) ) ( not ( = ?auto_1118606 ?auto_1118604 ) ) ( not ( = ?auto_1118606 ?auto_1118608 ) ) ( not ( = ?auto_1118606 ?auto_1118610 ) ) ( not ( = ?auto_1118606 ?auto_1118609 ) ) ( not ( = ?auto_1118606 ?auto_1118611 ) ) ( not ( = ?auto_1118606 ?auto_1118612 ) ) ( not ( = ?auto_1118606 ?auto_1118616 ) ) ( not ( = ?auto_1118607 ?auto_1118604 ) ) ( not ( = ?auto_1118607 ?auto_1118608 ) ) ( not ( = ?auto_1118607 ?auto_1118610 ) ) ( not ( = ?auto_1118607 ?auto_1118609 ) ) ( not ( = ?auto_1118607 ?auto_1118611 ) ) ( not ( = ?auto_1118607 ?auto_1118612 ) ) ( not ( = ?auto_1118607 ?auto_1118616 ) ) ( not ( = ?auto_1118604 ?auto_1118608 ) ) ( not ( = ?auto_1118604 ?auto_1118610 ) ) ( not ( = ?auto_1118604 ?auto_1118609 ) ) ( not ( = ?auto_1118604 ?auto_1118611 ) ) ( not ( = ?auto_1118604 ?auto_1118612 ) ) ( not ( = ?auto_1118604 ?auto_1118616 ) ) ( not ( = ?auto_1118608 ?auto_1118610 ) ) ( not ( = ?auto_1118608 ?auto_1118609 ) ) ( not ( = ?auto_1118608 ?auto_1118611 ) ) ( not ( = ?auto_1118608 ?auto_1118612 ) ) ( not ( = ?auto_1118608 ?auto_1118616 ) ) ( not ( = ?auto_1118610 ?auto_1118609 ) ) ( not ( = ?auto_1118610 ?auto_1118611 ) ) ( not ( = ?auto_1118610 ?auto_1118612 ) ) ( not ( = ?auto_1118610 ?auto_1118616 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118609 ?auto_1118611 ?auto_1118612 )
      ( MAKE-8CRATE-VERIFY ?auto_1118605 ?auto_1118606 ?auto_1118607 ?auto_1118604 ?auto_1118608 ?auto_1118610 ?auto_1118609 ?auto_1118611 ?auto_1118612 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1118619 - SURFACE
      ?auto_1118620 - SURFACE
    )
    :vars
    (
      ?auto_1118627 - HOIST
      ?auto_1118623 - PLACE
      ?auto_1118621 - SURFACE
      ?auto_1118622 - PLACE
      ?auto_1118626 - HOIST
      ?auto_1118625 - SURFACE
      ?auto_1118624 - TRUCK
      ?auto_1118628 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118627 ?auto_1118623 ) ( IS-CRATE ?auto_1118620 ) ( not ( = ?auto_1118619 ?auto_1118620 ) ) ( not ( = ?auto_1118621 ?auto_1118619 ) ) ( not ( = ?auto_1118621 ?auto_1118620 ) ) ( not ( = ?auto_1118622 ?auto_1118623 ) ) ( HOIST-AT ?auto_1118626 ?auto_1118622 ) ( not ( = ?auto_1118627 ?auto_1118626 ) ) ( SURFACE-AT ?auto_1118620 ?auto_1118622 ) ( ON ?auto_1118620 ?auto_1118625 ) ( CLEAR ?auto_1118620 ) ( not ( = ?auto_1118619 ?auto_1118625 ) ) ( not ( = ?auto_1118620 ?auto_1118625 ) ) ( not ( = ?auto_1118621 ?auto_1118625 ) ) ( SURFACE-AT ?auto_1118621 ?auto_1118623 ) ( CLEAR ?auto_1118621 ) ( IS-CRATE ?auto_1118619 ) ( AVAILABLE ?auto_1118627 ) ( TRUCK-AT ?auto_1118624 ?auto_1118622 ) ( AVAILABLE ?auto_1118626 ) ( SURFACE-AT ?auto_1118619 ?auto_1118622 ) ( ON ?auto_1118619 ?auto_1118628 ) ( CLEAR ?auto_1118619 ) ( not ( = ?auto_1118619 ?auto_1118628 ) ) ( not ( = ?auto_1118620 ?auto_1118628 ) ) ( not ( = ?auto_1118621 ?auto_1118628 ) ) ( not ( = ?auto_1118625 ?auto_1118628 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1118626 ?auto_1118619 ?auto_1118628 ?auto_1118622 )
      ( MAKE-2CRATE ?auto_1118621 ?auto_1118619 ?auto_1118620 )
      ( MAKE-1CRATE-VERIFY ?auto_1118619 ?auto_1118620 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1118629 - SURFACE
      ?auto_1118630 - SURFACE
      ?auto_1118631 - SURFACE
    )
    :vars
    (
      ?auto_1118638 - HOIST
      ?auto_1118632 - PLACE
      ?auto_1118637 - PLACE
      ?auto_1118635 - HOIST
      ?auto_1118634 - SURFACE
      ?auto_1118633 - TRUCK
      ?auto_1118636 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118638 ?auto_1118632 ) ( IS-CRATE ?auto_1118631 ) ( not ( = ?auto_1118630 ?auto_1118631 ) ) ( not ( = ?auto_1118629 ?auto_1118630 ) ) ( not ( = ?auto_1118629 ?auto_1118631 ) ) ( not ( = ?auto_1118637 ?auto_1118632 ) ) ( HOIST-AT ?auto_1118635 ?auto_1118637 ) ( not ( = ?auto_1118638 ?auto_1118635 ) ) ( SURFACE-AT ?auto_1118631 ?auto_1118637 ) ( ON ?auto_1118631 ?auto_1118634 ) ( CLEAR ?auto_1118631 ) ( not ( = ?auto_1118630 ?auto_1118634 ) ) ( not ( = ?auto_1118631 ?auto_1118634 ) ) ( not ( = ?auto_1118629 ?auto_1118634 ) ) ( SURFACE-AT ?auto_1118629 ?auto_1118632 ) ( CLEAR ?auto_1118629 ) ( IS-CRATE ?auto_1118630 ) ( AVAILABLE ?auto_1118638 ) ( TRUCK-AT ?auto_1118633 ?auto_1118637 ) ( AVAILABLE ?auto_1118635 ) ( SURFACE-AT ?auto_1118630 ?auto_1118637 ) ( ON ?auto_1118630 ?auto_1118636 ) ( CLEAR ?auto_1118630 ) ( not ( = ?auto_1118630 ?auto_1118636 ) ) ( not ( = ?auto_1118631 ?auto_1118636 ) ) ( not ( = ?auto_1118629 ?auto_1118636 ) ) ( not ( = ?auto_1118634 ?auto_1118636 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1118630 ?auto_1118631 )
      ( MAKE-2CRATE-VERIFY ?auto_1118629 ?auto_1118630 ?auto_1118631 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1118640 - SURFACE
      ?auto_1118641 - SURFACE
      ?auto_1118642 - SURFACE
      ?auto_1118639 - SURFACE
    )
    :vars
    (
      ?auto_1118643 - HOIST
      ?auto_1118649 - PLACE
      ?auto_1118648 - PLACE
      ?auto_1118646 - HOIST
      ?auto_1118645 - SURFACE
      ?auto_1118644 - TRUCK
      ?auto_1118647 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118643 ?auto_1118649 ) ( IS-CRATE ?auto_1118639 ) ( not ( = ?auto_1118642 ?auto_1118639 ) ) ( not ( = ?auto_1118641 ?auto_1118642 ) ) ( not ( = ?auto_1118641 ?auto_1118639 ) ) ( not ( = ?auto_1118648 ?auto_1118649 ) ) ( HOIST-AT ?auto_1118646 ?auto_1118648 ) ( not ( = ?auto_1118643 ?auto_1118646 ) ) ( SURFACE-AT ?auto_1118639 ?auto_1118648 ) ( ON ?auto_1118639 ?auto_1118645 ) ( CLEAR ?auto_1118639 ) ( not ( = ?auto_1118642 ?auto_1118645 ) ) ( not ( = ?auto_1118639 ?auto_1118645 ) ) ( not ( = ?auto_1118641 ?auto_1118645 ) ) ( SURFACE-AT ?auto_1118641 ?auto_1118649 ) ( CLEAR ?auto_1118641 ) ( IS-CRATE ?auto_1118642 ) ( AVAILABLE ?auto_1118643 ) ( TRUCK-AT ?auto_1118644 ?auto_1118648 ) ( AVAILABLE ?auto_1118646 ) ( SURFACE-AT ?auto_1118642 ?auto_1118648 ) ( ON ?auto_1118642 ?auto_1118647 ) ( CLEAR ?auto_1118642 ) ( not ( = ?auto_1118642 ?auto_1118647 ) ) ( not ( = ?auto_1118639 ?auto_1118647 ) ) ( not ( = ?auto_1118641 ?auto_1118647 ) ) ( not ( = ?auto_1118645 ?auto_1118647 ) ) ( ON ?auto_1118641 ?auto_1118640 ) ( not ( = ?auto_1118640 ?auto_1118641 ) ) ( not ( = ?auto_1118640 ?auto_1118642 ) ) ( not ( = ?auto_1118640 ?auto_1118639 ) ) ( not ( = ?auto_1118640 ?auto_1118645 ) ) ( not ( = ?auto_1118640 ?auto_1118647 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118641 ?auto_1118642 ?auto_1118639 )
      ( MAKE-3CRATE-VERIFY ?auto_1118640 ?auto_1118641 ?auto_1118642 ?auto_1118639 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1118651 - SURFACE
      ?auto_1118652 - SURFACE
      ?auto_1118653 - SURFACE
      ?auto_1118650 - SURFACE
      ?auto_1118654 - SURFACE
    )
    :vars
    (
      ?auto_1118655 - HOIST
      ?auto_1118661 - PLACE
      ?auto_1118660 - PLACE
      ?auto_1118658 - HOIST
      ?auto_1118657 - SURFACE
      ?auto_1118656 - TRUCK
      ?auto_1118659 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118655 ?auto_1118661 ) ( IS-CRATE ?auto_1118654 ) ( not ( = ?auto_1118650 ?auto_1118654 ) ) ( not ( = ?auto_1118653 ?auto_1118650 ) ) ( not ( = ?auto_1118653 ?auto_1118654 ) ) ( not ( = ?auto_1118660 ?auto_1118661 ) ) ( HOIST-AT ?auto_1118658 ?auto_1118660 ) ( not ( = ?auto_1118655 ?auto_1118658 ) ) ( SURFACE-AT ?auto_1118654 ?auto_1118660 ) ( ON ?auto_1118654 ?auto_1118657 ) ( CLEAR ?auto_1118654 ) ( not ( = ?auto_1118650 ?auto_1118657 ) ) ( not ( = ?auto_1118654 ?auto_1118657 ) ) ( not ( = ?auto_1118653 ?auto_1118657 ) ) ( SURFACE-AT ?auto_1118653 ?auto_1118661 ) ( CLEAR ?auto_1118653 ) ( IS-CRATE ?auto_1118650 ) ( AVAILABLE ?auto_1118655 ) ( TRUCK-AT ?auto_1118656 ?auto_1118660 ) ( AVAILABLE ?auto_1118658 ) ( SURFACE-AT ?auto_1118650 ?auto_1118660 ) ( ON ?auto_1118650 ?auto_1118659 ) ( CLEAR ?auto_1118650 ) ( not ( = ?auto_1118650 ?auto_1118659 ) ) ( not ( = ?auto_1118654 ?auto_1118659 ) ) ( not ( = ?auto_1118653 ?auto_1118659 ) ) ( not ( = ?auto_1118657 ?auto_1118659 ) ) ( ON ?auto_1118652 ?auto_1118651 ) ( ON ?auto_1118653 ?auto_1118652 ) ( not ( = ?auto_1118651 ?auto_1118652 ) ) ( not ( = ?auto_1118651 ?auto_1118653 ) ) ( not ( = ?auto_1118651 ?auto_1118650 ) ) ( not ( = ?auto_1118651 ?auto_1118654 ) ) ( not ( = ?auto_1118651 ?auto_1118657 ) ) ( not ( = ?auto_1118651 ?auto_1118659 ) ) ( not ( = ?auto_1118652 ?auto_1118653 ) ) ( not ( = ?auto_1118652 ?auto_1118650 ) ) ( not ( = ?auto_1118652 ?auto_1118654 ) ) ( not ( = ?auto_1118652 ?auto_1118657 ) ) ( not ( = ?auto_1118652 ?auto_1118659 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118653 ?auto_1118650 ?auto_1118654 )
      ( MAKE-4CRATE-VERIFY ?auto_1118651 ?auto_1118652 ?auto_1118653 ?auto_1118650 ?auto_1118654 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1118663 - SURFACE
      ?auto_1118664 - SURFACE
      ?auto_1118665 - SURFACE
      ?auto_1118662 - SURFACE
      ?auto_1118666 - SURFACE
      ?auto_1118667 - SURFACE
    )
    :vars
    (
      ?auto_1118668 - HOIST
      ?auto_1118674 - PLACE
      ?auto_1118673 - PLACE
      ?auto_1118671 - HOIST
      ?auto_1118670 - SURFACE
      ?auto_1118669 - TRUCK
      ?auto_1118672 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118668 ?auto_1118674 ) ( IS-CRATE ?auto_1118667 ) ( not ( = ?auto_1118666 ?auto_1118667 ) ) ( not ( = ?auto_1118662 ?auto_1118666 ) ) ( not ( = ?auto_1118662 ?auto_1118667 ) ) ( not ( = ?auto_1118673 ?auto_1118674 ) ) ( HOIST-AT ?auto_1118671 ?auto_1118673 ) ( not ( = ?auto_1118668 ?auto_1118671 ) ) ( SURFACE-AT ?auto_1118667 ?auto_1118673 ) ( ON ?auto_1118667 ?auto_1118670 ) ( CLEAR ?auto_1118667 ) ( not ( = ?auto_1118666 ?auto_1118670 ) ) ( not ( = ?auto_1118667 ?auto_1118670 ) ) ( not ( = ?auto_1118662 ?auto_1118670 ) ) ( SURFACE-AT ?auto_1118662 ?auto_1118674 ) ( CLEAR ?auto_1118662 ) ( IS-CRATE ?auto_1118666 ) ( AVAILABLE ?auto_1118668 ) ( TRUCK-AT ?auto_1118669 ?auto_1118673 ) ( AVAILABLE ?auto_1118671 ) ( SURFACE-AT ?auto_1118666 ?auto_1118673 ) ( ON ?auto_1118666 ?auto_1118672 ) ( CLEAR ?auto_1118666 ) ( not ( = ?auto_1118666 ?auto_1118672 ) ) ( not ( = ?auto_1118667 ?auto_1118672 ) ) ( not ( = ?auto_1118662 ?auto_1118672 ) ) ( not ( = ?auto_1118670 ?auto_1118672 ) ) ( ON ?auto_1118664 ?auto_1118663 ) ( ON ?auto_1118665 ?auto_1118664 ) ( ON ?auto_1118662 ?auto_1118665 ) ( not ( = ?auto_1118663 ?auto_1118664 ) ) ( not ( = ?auto_1118663 ?auto_1118665 ) ) ( not ( = ?auto_1118663 ?auto_1118662 ) ) ( not ( = ?auto_1118663 ?auto_1118666 ) ) ( not ( = ?auto_1118663 ?auto_1118667 ) ) ( not ( = ?auto_1118663 ?auto_1118670 ) ) ( not ( = ?auto_1118663 ?auto_1118672 ) ) ( not ( = ?auto_1118664 ?auto_1118665 ) ) ( not ( = ?auto_1118664 ?auto_1118662 ) ) ( not ( = ?auto_1118664 ?auto_1118666 ) ) ( not ( = ?auto_1118664 ?auto_1118667 ) ) ( not ( = ?auto_1118664 ?auto_1118670 ) ) ( not ( = ?auto_1118664 ?auto_1118672 ) ) ( not ( = ?auto_1118665 ?auto_1118662 ) ) ( not ( = ?auto_1118665 ?auto_1118666 ) ) ( not ( = ?auto_1118665 ?auto_1118667 ) ) ( not ( = ?auto_1118665 ?auto_1118670 ) ) ( not ( = ?auto_1118665 ?auto_1118672 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118662 ?auto_1118666 ?auto_1118667 )
      ( MAKE-5CRATE-VERIFY ?auto_1118663 ?auto_1118664 ?auto_1118665 ?auto_1118662 ?auto_1118666 ?auto_1118667 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1118676 - SURFACE
      ?auto_1118677 - SURFACE
      ?auto_1118678 - SURFACE
      ?auto_1118675 - SURFACE
      ?auto_1118679 - SURFACE
      ?auto_1118681 - SURFACE
      ?auto_1118680 - SURFACE
    )
    :vars
    (
      ?auto_1118682 - HOIST
      ?auto_1118688 - PLACE
      ?auto_1118687 - PLACE
      ?auto_1118685 - HOIST
      ?auto_1118684 - SURFACE
      ?auto_1118683 - TRUCK
      ?auto_1118686 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118682 ?auto_1118688 ) ( IS-CRATE ?auto_1118680 ) ( not ( = ?auto_1118681 ?auto_1118680 ) ) ( not ( = ?auto_1118679 ?auto_1118681 ) ) ( not ( = ?auto_1118679 ?auto_1118680 ) ) ( not ( = ?auto_1118687 ?auto_1118688 ) ) ( HOIST-AT ?auto_1118685 ?auto_1118687 ) ( not ( = ?auto_1118682 ?auto_1118685 ) ) ( SURFACE-AT ?auto_1118680 ?auto_1118687 ) ( ON ?auto_1118680 ?auto_1118684 ) ( CLEAR ?auto_1118680 ) ( not ( = ?auto_1118681 ?auto_1118684 ) ) ( not ( = ?auto_1118680 ?auto_1118684 ) ) ( not ( = ?auto_1118679 ?auto_1118684 ) ) ( SURFACE-AT ?auto_1118679 ?auto_1118688 ) ( CLEAR ?auto_1118679 ) ( IS-CRATE ?auto_1118681 ) ( AVAILABLE ?auto_1118682 ) ( TRUCK-AT ?auto_1118683 ?auto_1118687 ) ( AVAILABLE ?auto_1118685 ) ( SURFACE-AT ?auto_1118681 ?auto_1118687 ) ( ON ?auto_1118681 ?auto_1118686 ) ( CLEAR ?auto_1118681 ) ( not ( = ?auto_1118681 ?auto_1118686 ) ) ( not ( = ?auto_1118680 ?auto_1118686 ) ) ( not ( = ?auto_1118679 ?auto_1118686 ) ) ( not ( = ?auto_1118684 ?auto_1118686 ) ) ( ON ?auto_1118677 ?auto_1118676 ) ( ON ?auto_1118678 ?auto_1118677 ) ( ON ?auto_1118675 ?auto_1118678 ) ( ON ?auto_1118679 ?auto_1118675 ) ( not ( = ?auto_1118676 ?auto_1118677 ) ) ( not ( = ?auto_1118676 ?auto_1118678 ) ) ( not ( = ?auto_1118676 ?auto_1118675 ) ) ( not ( = ?auto_1118676 ?auto_1118679 ) ) ( not ( = ?auto_1118676 ?auto_1118681 ) ) ( not ( = ?auto_1118676 ?auto_1118680 ) ) ( not ( = ?auto_1118676 ?auto_1118684 ) ) ( not ( = ?auto_1118676 ?auto_1118686 ) ) ( not ( = ?auto_1118677 ?auto_1118678 ) ) ( not ( = ?auto_1118677 ?auto_1118675 ) ) ( not ( = ?auto_1118677 ?auto_1118679 ) ) ( not ( = ?auto_1118677 ?auto_1118681 ) ) ( not ( = ?auto_1118677 ?auto_1118680 ) ) ( not ( = ?auto_1118677 ?auto_1118684 ) ) ( not ( = ?auto_1118677 ?auto_1118686 ) ) ( not ( = ?auto_1118678 ?auto_1118675 ) ) ( not ( = ?auto_1118678 ?auto_1118679 ) ) ( not ( = ?auto_1118678 ?auto_1118681 ) ) ( not ( = ?auto_1118678 ?auto_1118680 ) ) ( not ( = ?auto_1118678 ?auto_1118684 ) ) ( not ( = ?auto_1118678 ?auto_1118686 ) ) ( not ( = ?auto_1118675 ?auto_1118679 ) ) ( not ( = ?auto_1118675 ?auto_1118681 ) ) ( not ( = ?auto_1118675 ?auto_1118680 ) ) ( not ( = ?auto_1118675 ?auto_1118684 ) ) ( not ( = ?auto_1118675 ?auto_1118686 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118679 ?auto_1118681 ?auto_1118680 )
      ( MAKE-6CRATE-VERIFY ?auto_1118676 ?auto_1118677 ?auto_1118678 ?auto_1118675 ?auto_1118679 ?auto_1118681 ?auto_1118680 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1118690 - SURFACE
      ?auto_1118691 - SURFACE
      ?auto_1118692 - SURFACE
      ?auto_1118689 - SURFACE
      ?auto_1118693 - SURFACE
      ?auto_1118695 - SURFACE
      ?auto_1118694 - SURFACE
      ?auto_1118696 - SURFACE
    )
    :vars
    (
      ?auto_1118697 - HOIST
      ?auto_1118703 - PLACE
      ?auto_1118702 - PLACE
      ?auto_1118700 - HOIST
      ?auto_1118699 - SURFACE
      ?auto_1118698 - TRUCK
      ?auto_1118701 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118697 ?auto_1118703 ) ( IS-CRATE ?auto_1118696 ) ( not ( = ?auto_1118694 ?auto_1118696 ) ) ( not ( = ?auto_1118695 ?auto_1118694 ) ) ( not ( = ?auto_1118695 ?auto_1118696 ) ) ( not ( = ?auto_1118702 ?auto_1118703 ) ) ( HOIST-AT ?auto_1118700 ?auto_1118702 ) ( not ( = ?auto_1118697 ?auto_1118700 ) ) ( SURFACE-AT ?auto_1118696 ?auto_1118702 ) ( ON ?auto_1118696 ?auto_1118699 ) ( CLEAR ?auto_1118696 ) ( not ( = ?auto_1118694 ?auto_1118699 ) ) ( not ( = ?auto_1118696 ?auto_1118699 ) ) ( not ( = ?auto_1118695 ?auto_1118699 ) ) ( SURFACE-AT ?auto_1118695 ?auto_1118703 ) ( CLEAR ?auto_1118695 ) ( IS-CRATE ?auto_1118694 ) ( AVAILABLE ?auto_1118697 ) ( TRUCK-AT ?auto_1118698 ?auto_1118702 ) ( AVAILABLE ?auto_1118700 ) ( SURFACE-AT ?auto_1118694 ?auto_1118702 ) ( ON ?auto_1118694 ?auto_1118701 ) ( CLEAR ?auto_1118694 ) ( not ( = ?auto_1118694 ?auto_1118701 ) ) ( not ( = ?auto_1118696 ?auto_1118701 ) ) ( not ( = ?auto_1118695 ?auto_1118701 ) ) ( not ( = ?auto_1118699 ?auto_1118701 ) ) ( ON ?auto_1118691 ?auto_1118690 ) ( ON ?auto_1118692 ?auto_1118691 ) ( ON ?auto_1118689 ?auto_1118692 ) ( ON ?auto_1118693 ?auto_1118689 ) ( ON ?auto_1118695 ?auto_1118693 ) ( not ( = ?auto_1118690 ?auto_1118691 ) ) ( not ( = ?auto_1118690 ?auto_1118692 ) ) ( not ( = ?auto_1118690 ?auto_1118689 ) ) ( not ( = ?auto_1118690 ?auto_1118693 ) ) ( not ( = ?auto_1118690 ?auto_1118695 ) ) ( not ( = ?auto_1118690 ?auto_1118694 ) ) ( not ( = ?auto_1118690 ?auto_1118696 ) ) ( not ( = ?auto_1118690 ?auto_1118699 ) ) ( not ( = ?auto_1118690 ?auto_1118701 ) ) ( not ( = ?auto_1118691 ?auto_1118692 ) ) ( not ( = ?auto_1118691 ?auto_1118689 ) ) ( not ( = ?auto_1118691 ?auto_1118693 ) ) ( not ( = ?auto_1118691 ?auto_1118695 ) ) ( not ( = ?auto_1118691 ?auto_1118694 ) ) ( not ( = ?auto_1118691 ?auto_1118696 ) ) ( not ( = ?auto_1118691 ?auto_1118699 ) ) ( not ( = ?auto_1118691 ?auto_1118701 ) ) ( not ( = ?auto_1118692 ?auto_1118689 ) ) ( not ( = ?auto_1118692 ?auto_1118693 ) ) ( not ( = ?auto_1118692 ?auto_1118695 ) ) ( not ( = ?auto_1118692 ?auto_1118694 ) ) ( not ( = ?auto_1118692 ?auto_1118696 ) ) ( not ( = ?auto_1118692 ?auto_1118699 ) ) ( not ( = ?auto_1118692 ?auto_1118701 ) ) ( not ( = ?auto_1118689 ?auto_1118693 ) ) ( not ( = ?auto_1118689 ?auto_1118695 ) ) ( not ( = ?auto_1118689 ?auto_1118694 ) ) ( not ( = ?auto_1118689 ?auto_1118696 ) ) ( not ( = ?auto_1118689 ?auto_1118699 ) ) ( not ( = ?auto_1118689 ?auto_1118701 ) ) ( not ( = ?auto_1118693 ?auto_1118695 ) ) ( not ( = ?auto_1118693 ?auto_1118694 ) ) ( not ( = ?auto_1118693 ?auto_1118696 ) ) ( not ( = ?auto_1118693 ?auto_1118699 ) ) ( not ( = ?auto_1118693 ?auto_1118701 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118695 ?auto_1118694 ?auto_1118696 )
      ( MAKE-7CRATE-VERIFY ?auto_1118690 ?auto_1118691 ?auto_1118692 ?auto_1118689 ?auto_1118693 ?auto_1118695 ?auto_1118694 ?auto_1118696 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1118705 - SURFACE
      ?auto_1118706 - SURFACE
      ?auto_1118707 - SURFACE
      ?auto_1118704 - SURFACE
      ?auto_1118708 - SURFACE
      ?auto_1118710 - SURFACE
      ?auto_1118709 - SURFACE
      ?auto_1118711 - SURFACE
      ?auto_1118712 - SURFACE
    )
    :vars
    (
      ?auto_1118713 - HOIST
      ?auto_1118719 - PLACE
      ?auto_1118718 - PLACE
      ?auto_1118716 - HOIST
      ?auto_1118715 - SURFACE
      ?auto_1118714 - TRUCK
      ?auto_1118717 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118713 ?auto_1118719 ) ( IS-CRATE ?auto_1118712 ) ( not ( = ?auto_1118711 ?auto_1118712 ) ) ( not ( = ?auto_1118709 ?auto_1118711 ) ) ( not ( = ?auto_1118709 ?auto_1118712 ) ) ( not ( = ?auto_1118718 ?auto_1118719 ) ) ( HOIST-AT ?auto_1118716 ?auto_1118718 ) ( not ( = ?auto_1118713 ?auto_1118716 ) ) ( SURFACE-AT ?auto_1118712 ?auto_1118718 ) ( ON ?auto_1118712 ?auto_1118715 ) ( CLEAR ?auto_1118712 ) ( not ( = ?auto_1118711 ?auto_1118715 ) ) ( not ( = ?auto_1118712 ?auto_1118715 ) ) ( not ( = ?auto_1118709 ?auto_1118715 ) ) ( SURFACE-AT ?auto_1118709 ?auto_1118719 ) ( CLEAR ?auto_1118709 ) ( IS-CRATE ?auto_1118711 ) ( AVAILABLE ?auto_1118713 ) ( TRUCK-AT ?auto_1118714 ?auto_1118718 ) ( AVAILABLE ?auto_1118716 ) ( SURFACE-AT ?auto_1118711 ?auto_1118718 ) ( ON ?auto_1118711 ?auto_1118717 ) ( CLEAR ?auto_1118711 ) ( not ( = ?auto_1118711 ?auto_1118717 ) ) ( not ( = ?auto_1118712 ?auto_1118717 ) ) ( not ( = ?auto_1118709 ?auto_1118717 ) ) ( not ( = ?auto_1118715 ?auto_1118717 ) ) ( ON ?auto_1118706 ?auto_1118705 ) ( ON ?auto_1118707 ?auto_1118706 ) ( ON ?auto_1118704 ?auto_1118707 ) ( ON ?auto_1118708 ?auto_1118704 ) ( ON ?auto_1118710 ?auto_1118708 ) ( ON ?auto_1118709 ?auto_1118710 ) ( not ( = ?auto_1118705 ?auto_1118706 ) ) ( not ( = ?auto_1118705 ?auto_1118707 ) ) ( not ( = ?auto_1118705 ?auto_1118704 ) ) ( not ( = ?auto_1118705 ?auto_1118708 ) ) ( not ( = ?auto_1118705 ?auto_1118710 ) ) ( not ( = ?auto_1118705 ?auto_1118709 ) ) ( not ( = ?auto_1118705 ?auto_1118711 ) ) ( not ( = ?auto_1118705 ?auto_1118712 ) ) ( not ( = ?auto_1118705 ?auto_1118715 ) ) ( not ( = ?auto_1118705 ?auto_1118717 ) ) ( not ( = ?auto_1118706 ?auto_1118707 ) ) ( not ( = ?auto_1118706 ?auto_1118704 ) ) ( not ( = ?auto_1118706 ?auto_1118708 ) ) ( not ( = ?auto_1118706 ?auto_1118710 ) ) ( not ( = ?auto_1118706 ?auto_1118709 ) ) ( not ( = ?auto_1118706 ?auto_1118711 ) ) ( not ( = ?auto_1118706 ?auto_1118712 ) ) ( not ( = ?auto_1118706 ?auto_1118715 ) ) ( not ( = ?auto_1118706 ?auto_1118717 ) ) ( not ( = ?auto_1118707 ?auto_1118704 ) ) ( not ( = ?auto_1118707 ?auto_1118708 ) ) ( not ( = ?auto_1118707 ?auto_1118710 ) ) ( not ( = ?auto_1118707 ?auto_1118709 ) ) ( not ( = ?auto_1118707 ?auto_1118711 ) ) ( not ( = ?auto_1118707 ?auto_1118712 ) ) ( not ( = ?auto_1118707 ?auto_1118715 ) ) ( not ( = ?auto_1118707 ?auto_1118717 ) ) ( not ( = ?auto_1118704 ?auto_1118708 ) ) ( not ( = ?auto_1118704 ?auto_1118710 ) ) ( not ( = ?auto_1118704 ?auto_1118709 ) ) ( not ( = ?auto_1118704 ?auto_1118711 ) ) ( not ( = ?auto_1118704 ?auto_1118712 ) ) ( not ( = ?auto_1118704 ?auto_1118715 ) ) ( not ( = ?auto_1118704 ?auto_1118717 ) ) ( not ( = ?auto_1118708 ?auto_1118710 ) ) ( not ( = ?auto_1118708 ?auto_1118709 ) ) ( not ( = ?auto_1118708 ?auto_1118711 ) ) ( not ( = ?auto_1118708 ?auto_1118712 ) ) ( not ( = ?auto_1118708 ?auto_1118715 ) ) ( not ( = ?auto_1118708 ?auto_1118717 ) ) ( not ( = ?auto_1118710 ?auto_1118709 ) ) ( not ( = ?auto_1118710 ?auto_1118711 ) ) ( not ( = ?auto_1118710 ?auto_1118712 ) ) ( not ( = ?auto_1118710 ?auto_1118715 ) ) ( not ( = ?auto_1118710 ?auto_1118717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118709 ?auto_1118711 ?auto_1118712 )
      ( MAKE-8CRATE-VERIFY ?auto_1118705 ?auto_1118706 ?auto_1118707 ?auto_1118704 ?auto_1118708 ?auto_1118710 ?auto_1118709 ?auto_1118711 ?auto_1118712 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1118720 - SURFACE
      ?auto_1118721 - SURFACE
    )
    :vars
    (
      ?auto_1118722 - HOIST
      ?auto_1118729 - PLACE
      ?auto_1118723 - SURFACE
      ?auto_1118728 - PLACE
      ?auto_1118726 - HOIST
      ?auto_1118725 - SURFACE
      ?auto_1118727 - SURFACE
      ?auto_1118724 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118722 ?auto_1118729 ) ( IS-CRATE ?auto_1118721 ) ( not ( = ?auto_1118720 ?auto_1118721 ) ) ( not ( = ?auto_1118723 ?auto_1118720 ) ) ( not ( = ?auto_1118723 ?auto_1118721 ) ) ( not ( = ?auto_1118728 ?auto_1118729 ) ) ( HOIST-AT ?auto_1118726 ?auto_1118728 ) ( not ( = ?auto_1118722 ?auto_1118726 ) ) ( SURFACE-AT ?auto_1118721 ?auto_1118728 ) ( ON ?auto_1118721 ?auto_1118725 ) ( CLEAR ?auto_1118721 ) ( not ( = ?auto_1118720 ?auto_1118725 ) ) ( not ( = ?auto_1118721 ?auto_1118725 ) ) ( not ( = ?auto_1118723 ?auto_1118725 ) ) ( SURFACE-AT ?auto_1118723 ?auto_1118729 ) ( CLEAR ?auto_1118723 ) ( IS-CRATE ?auto_1118720 ) ( AVAILABLE ?auto_1118722 ) ( AVAILABLE ?auto_1118726 ) ( SURFACE-AT ?auto_1118720 ?auto_1118728 ) ( ON ?auto_1118720 ?auto_1118727 ) ( CLEAR ?auto_1118720 ) ( not ( = ?auto_1118720 ?auto_1118727 ) ) ( not ( = ?auto_1118721 ?auto_1118727 ) ) ( not ( = ?auto_1118723 ?auto_1118727 ) ) ( not ( = ?auto_1118725 ?auto_1118727 ) ) ( TRUCK-AT ?auto_1118724 ?auto_1118729 ) )
    :subtasks
    ( ( !DRIVE ?auto_1118724 ?auto_1118729 ?auto_1118728 )
      ( MAKE-2CRATE ?auto_1118723 ?auto_1118720 ?auto_1118721 )
      ( MAKE-1CRATE-VERIFY ?auto_1118720 ?auto_1118721 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1118730 - SURFACE
      ?auto_1118731 - SURFACE
      ?auto_1118732 - SURFACE
    )
    :vars
    (
      ?auto_1118737 - HOIST
      ?auto_1118736 - PLACE
      ?auto_1118735 - PLACE
      ?auto_1118734 - HOIST
      ?auto_1118739 - SURFACE
      ?auto_1118738 - SURFACE
      ?auto_1118733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118737 ?auto_1118736 ) ( IS-CRATE ?auto_1118732 ) ( not ( = ?auto_1118731 ?auto_1118732 ) ) ( not ( = ?auto_1118730 ?auto_1118731 ) ) ( not ( = ?auto_1118730 ?auto_1118732 ) ) ( not ( = ?auto_1118735 ?auto_1118736 ) ) ( HOIST-AT ?auto_1118734 ?auto_1118735 ) ( not ( = ?auto_1118737 ?auto_1118734 ) ) ( SURFACE-AT ?auto_1118732 ?auto_1118735 ) ( ON ?auto_1118732 ?auto_1118739 ) ( CLEAR ?auto_1118732 ) ( not ( = ?auto_1118731 ?auto_1118739 ) ) ( not ( = ?auto_1118732 ?auto_1118739 ) ) ( not ( = ?auto_1118730 ?auto_1118739 ) ) ( SURFACE-AT ?auto_1118730 ?auto_1118736 ) ( CLEAR ?auto_1118730 ) ( IS-CRATE ?auto_1118731 ) ( AVAILABLE ?auto_1118737 ) ( AVAILABLE ?auto_1118734 ) ( SURFACE-AT ?auto_1118731 ?auto_1118735 ) ( ON ?auto_1118731 ?auto_1118738 ) ( CLEAR ?auto_1118731 ) ( not ( = ?auto_1118731 ?auto_1118738 ) ) ( not ( = ?auto_1118732 ?auto_1118738 ) ) ( not ( = ?auto_1118730 ?auto_1118738 ) ) ( not ( = ?auto_1118739 ?auto_1118738 ) ) ( TRUCK-AT ?auto_1118733 ?auto_1118736 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1118731 ?auto_1118732 )
      ( MAKE-2CRATE-VERIFY ?auto_1118730 ?auto_1118731 ?auto_1118732 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1118741 - SURFACE
      ?auto_1118742 - SURFACE
      ?auto_1118743 - SURFACE
      ?auto_1118740 - SURFACE
    )
    :vars
    (
      ?auto_1118750 - HOIST
      ?auto_1118746 - PLACE
      ?auto_1118745 - PLACE
      ?auto_1118749 - HOIST
      ?auto_1118748 - SURFACE
      ?auto_1118744 - SURFACE
      ?auto_1118747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118750 ?auto_1118746 ) ( IS-CRATE ?auto_1118740 ) ( not ( = ?auto_1118743 ?auto_1118740 ) ) ( not ( = ?auto_1118742 ?auto_1118743 ) ) ( not ( = ?auto_1118742 ?auto_1118740 ) ) ( not ( = ?auto_1118745 ?auto_1118746 ) ) ( HOIST-AT ?auto_1118749 ?auto_1118745 ) ( not ( = ?auto_1118750 ?auto_1118749 ) ) ( SURFACE-AT ?auto_1118740 ?auto_1118745 ) ( ON ?auto_1118740 ?auto_1118748 ) ( CLEAR ?auto_1118740 ) ( not ( = ?auto_1118743 ?auto_1118748 ) ) ( not ( = ?auto_1118740 ?auto_1118748 ) ) ( not ( = ?auto_1118742 ?auto_1118748 ) ) ( SURFACE-AT ?auto_1118742 ?auto_1118746 ) ( CLEAR ?auto_1118742 ) ( IS-CRATE ?auto_1118743 ) ( AVAILABLE ?auto_1118750 ) ( AVAILABLE ?auto_1118749 ) ( SURFACE-AT ?auto_1118743 ?auto_1118745 ) ( ON ?auto_1118743 ?auto_1118744 ) ( CLEAR ?auto_1118743 ) ( not ( = ?auto_1118743 ?auto_1118744 ) ) ( not ( = ?auto_1118740 ?auto_1118744 ) ) ( not ( = ?auto_1118742 ?auto_1118744 ) ) ( not ( = ?auto_1118748 ?auto_1118744 ) ) ( TRUCK-AT ?auto_1118747 ?auto_1118746 ) ( ON ?auto_1118742 ?auto_1118741 ) ( not ( = ?auto_1118741 ?auto_1118742 ) ) ( not ( = ?auto_1118741 ?auto_1118743 ) ) ( not ( = ?auto_1118741 ?auto_1118740 ) ) ( not ( = ?auto_1118741 ?auto_1118748 ) ) ( not ( = ?auto_1118741 ?auto_1118744 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118742 ?auto_1118743 ?auto_1118740 )
      ( MAKE-3CRATE-VERIFY ?auto_1118741 ?auto_1118742 ?auto_1118743 ?auto_1118740 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1118752 - SURFACE
      ?auto_1118753 - SURFACE
      ?auto_1118754 - SURFACE
      ?auto_1118751 - SURFACE
      ?auto_1118755 - SURFACE
    )
    :vars
    (
      ?auto_1118762 - HOIST
      ?auto_1118758 - PLACE
      ?auto_1118757 - PLACE
      ?auto_1118761 - HOIST
      ?auto_1118760 - SURFACE
      ?auto_1118756 - SURFACE
      ?auto_1118759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118762 ?auto_1118758 ) ( IS-CRATE ?auto_1118755 ) ( not ( = ?auto_1118751 ?auto_1118755 ) ) ( not ( = ?auto_1118754 ?auto_1118751 ) ) ( not ( = ?auto_1118754 ?auto_1118755 ) ) ( not ( = ?auto_1118757 ?auto_1118758 ) ) ( HOIST-AT ?auto_1118761 ?auto_1118757 ) ( not ( = ?auto_1118762 ?auto_1118761 ) ) ( SURFACE-AT ?auto_1118755 ?auto_1118757 ) ( ON ?auto_1118755 ?auto_1118760 ) ( CLEAR ?auto_1118755 ) ( not ( = ?auto_1118751 ?auto_1118760 ) ) ( not ( = ?auto_1118755 ?auto_1118760 ) ) ( not ( = ?auto_1118754 ?auto_1118760 ) ) ( SURFACE-AT ?auto_1118754 ?auto_1118758 ) ( CLEAR ?auto_1118754 ) ( IS-CRATE ?auto_1118751 ) ( AVAILABLE ?auto_1118762 ) ( AVAILABLE ?auto_1118761 ) ( SURFACE-AT ?auto_1118751 ?auto_1118757 ) ( ON ?auto_1118751 ?auto_1118756 ) ( CLEAR ?auto_1118751 ) ( not ( = ?auto_1118751 ?auto_1118756 ) ) ( not ( = ?auto_1118755 ?auto_1118756 ) ) ( not ( = ?auto_1118754 ?auto_1118756 ) ) ( not ( = ?auto_1118760 ?auto_1118756 ) ) ( TRUCK-AT ?auto_1118759 ?auto_1118758 ) ( ON ?auto_1118753 ?auto_1118752 ) ( ON ?auto_1118754 ?auto_1118753 ) ( not ( = ?auto_1118752 ?auto_1118753 ) ) ( not ( = ?auto_1118752 ?auto_1118754 ) ) ( not ( = ?auto_1118752 ?auto_1118751 ) ) ( not ( = ?auto_1118752 ?auto_1118755 ) ) ( not ( = ?auto_1118752 ?auto_1118760 ) ) ( not ( = ?auto_1118752 ?auto_1118756 ) ) ( not ( = ?auto_1118753 ?auto_1118754 ) ) ( not ( = ?auto_1118753 ?auto_1118751 ) ) ( not ( = ?auto_1118753 ?auto_1118755 ) ) ( not ( = ?auto_1118753 ?auto_1118760 ) ) ( not ( = ?auto_1118753 ?auto_1118756 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118754 ?auto_1118751 ?auto_1118755 )
      ( MAKE-4CRATE-VERIFY ?auto_1118752 ?auto_1118753 ?auto_1118754 ?auto_1118751 ?auto_1118755 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1118764 - SURFACE
      ?auto_1118765 - SURFACE
      ?auto_1118766 - SURFACE
      ?auto_1118763 - SURFACE
      ?auto_1118767 - SURFACE
      ?auto_1118768 - SURFACE
    )
    :vars
    (
      ?auto_1118775 - HOIST
      ?auto_1118771 - PLACE
      ?auto_1118770 - PLACE
      ?auto_1118774 - HOIST
      ?auto_1118773 - SURFACE
      ?auto_1118769 - SURFACE
      ?auto_1118772 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118775 ?auto_1118771 ) ( IS-CRATE ?auto_1118768 ) ( not ( = ?auto_1118767 ?auto_1118768 ) ) ( not ( = ?auto_1118763 ?auto_1118767 ) ) ( not ( = ?auto_1118763 ?auto_1118768 ) ) ( not ( = ?auto_1118770 ?auto_1118771 ) ) ( HOIST-AT ?auto_1118774 ?auto_1118770 ) ( not ( = ?auto_1118775 ?auto_1118774 ) ) ( SURFACE-AT ?auto_1118768 ?auto_1118770 ) ( ON ?auto_1118768 ?auto_1118773 ) ( CLEAR ?auto_1118768 ) ( not ( = ?auto_1118767 ?auto_1118773 ) ) ( not ( = ?auto_1118768 ?auto_1118773 ) ) ( not ( = ?auto_1118763 ?auto_1118773 ) ) ( SURFACE-AT ?auto_1118763 ?auto_1118771 ) ( CLEAR ?auto_1118763 ) ( IS-CRATE ?auto_1118767 ) ( AVAILABLE ?auto_1118775 ) ( AVAILABLE ?auto_1118774 ) ( SURFACE-AT ?auto_1118767 ?auto_1118770 ) ( ON ?auto_1118767 ?auto_1118769 ) ( CLEAR ?auto_1118767 ) ( not ( = ?auto_1118767 ?auto_1118769 ) ) ( not ( = ?auto_1118768 ?auto_1118769 ) ) ( not ( = ?auto_1118763 ?auto_1118769 ) ) ( not ( = ?auto_1118773 ?auto_1118769 ) ) ( TRUCK-AT ?auto_1118772 ?auto_1118771 ) ( ON ?auto_1118765 ?auto_1118764 ) ( ON ?auto_1118766 ?auto_1118765 ) ( ON ?auto_1118763 ?auto_1118766 ) ( not ( = ?auto_1118764 ?auto_1118765 ) ) ( not ( = ?auto_1118764 ?auto_1118766 ) ) ( not ( = ?auto_1118764 ?auto_1118763 ) ) ( not ( = ?auto_1118764 ?auto_1118767 ) ) ( not ( = ?auto_1118764 ?auto_1118768 ) ) ( not ( = ?auto_1118764 ?auto_1118773 ) ) ( not ( = ?auto_1118764 ?auto_1118769 ) ) ( not ( = ?auto_1118765 ?auto_1118766 ) ) ( not ( = ?auto_1118765 ?auto_1118763 ) ) ( not ( = ?auto_1118765 ?auto_1118767 ) ) ( not ( = ?auto_1118765 ?auto_1118768 ) ) ( not ( = ?auto_1118765 ?auto_1118773 ) ) ( not ( = ?auto_1118765 ?auto_1118769 ) ) ( not ( = ?auto_1118766 ?auto_1118763 ) ) ( not ( = ?auto_1118766 ?auto_1118767 ) ) ( not ( = ?auto_1118766 ?auto_1118768 ) ) ( not ( = ?auto_1118766 ?auto_1118773 ) ) ( not ( = ?auto_1118766 ?auto_1118769 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118763 ?auto_1118767 ?auto_1118768 )
      ( MAKE-5CRATE-VERIFY ?auto_1118764 ?auto_1118765 ?auto_1118766 ?auto_1118763 ?auto_1118767 ?auto_1118768 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1118777 - SURFACE
      ?auto_1118778 - SURFACE
      ?auto_1118779 - SURFACE
      ?auto_1118776 - SURFACE
      ?auto_1118780 - SURFACE
      ?auto_1118782 - SURFACE
      ?auto_1118781 - SURFACE
    )
    :vars
    (
      ?auto_1118789 - HOIST
      ?auto_1118785 - PLACE
      ?auto_1118784 - PLACE
      ?auto_1118788 - HOIST
      ?auto_1118787 - SURFACE
      ?auto_1118783 - SURFACE
      ?auto_1118786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118789 ?auto_1118785 ) ( IS-CRATE ?auto_1118781 ) ( not ( = ?auto_1118782 ?auto_1118781 ) ) ( not ( = ?auto_1118780 ?auto_1118782 ) ) ( not ( = ?auto_1118780 ?auto_1118781 ) ) ( not ( = ?auto_1118784 ?auto_1118785 ) ) ( HOIST-AT ?auto_1118788 ?auto_1118784 ) ( not ( = ?auto_1118789 ?auto_1118788 ) ) ( SURFACE-AT ?auto_1118781 ?auto_1118784 ) ( ON ?auto_1118781 ?auto_1118787 ) ( CLEAR ?auto_1118781 ) ( not ( = ?auto_1118782 ?auto_1118787 ) ) ( not ( = ?auto_1118781 ?auto_1118787 ) ) ( not ( = ?auto_1118780 ?auto_1118787 ) ) ( SURFACE-AT ?auto_1118780 ?auto_1118785 ) ( CLEAR ?auto_1118780 ) ( IS-CRATE ?auto_1118782 ) ( AVAILABLE ?auto_1118789 ) ( AVAILABLE ?auto_1118788 ) ( SURFACE-AT ?auto_1118782 ?auto_1118784 ) ( ON ?auto_1118782 ?auto_1118783 ) ( CLEAR ?auto_1118782 ) ( not ( = ?auto_1118782 ?auto_1118783 ) ) ( not ( = ?auto_1118781 ?auto_1118783 ) ) ( not ( = ?auto_1118780 ?auto_1118783 ) ) ( not ( = ?auto_1118787 ?auto_1118783 ) ) ( TRUCK-AT ?auto_1118786 ?auto_1118785 ) ( ON ?auto_1118778 ?auto_1118777 ) ( ON ?auto_1118779 ?auto_1118778 ) ( ON ?auto_1118776 ?auto_1118779 ) ( ON ?auto_1118780 ?auto_1118776 ) ( not ( = ?auto_1118777 ?auto_1118778 ) ) ( not ( = ?auto_1118777 ?auto_1118779 ) ) ( not ( = ?auto_1118777 ?auto_1118776 ) ) ( not ( = ?auto_1118777 ?auto_1118780 ) ) ( not ( = ?auto_1118777 ?auto_1118782 ) ) ( not ( = ?auto_1118777 ?auto_1118781 ) ) ( not ( = ?auto_1118777 ?auto_1118787 ) ) ( not ( = ?auto_1118777 ?auto_1118783 ) ) ( not ( = ?auto_1118778 ?auto_1118779 ) ) ( not ( = ?auto_1118778 ?auto_1118776 ) ) ( not ( = ?auto_1118778 ?auto_1118780 ) ) ( not ( = ?auto_1118778 ?auto_1118782 ) ) ( not ( = ?auto_1118778 ?auto_1118781 ) ) ( not ( = ?auto_1118778 ?auto_1118787 ) ) ( not ( = ?auto_1118778 ?auto_1118783 ) ) ( not ( = ?auto_1118779 ?auto_1118776 ) ) ( not ( = ?auto_1118779 ?auto_1118780 ) ) ( not ( = ?auto_1118779 ?auto_1118782 ) ) ( not ( = ?auto_1118779 ?auto_1118781 ) ) ( not ( = ?auto_1118779 ?auto_1118787 ) ) ( not ( = ?auto_1118779 ?auto_1118783 ) ) ( not ( = ?auto_1118776 ?auto_1118780 ) ) ( not ( = ?auto_1118776 ?auto_1118782 ) ) ( not ( = ?auto_1118776 ?auto_1118781 ) ) ( not ( = ?auto_1118776 ?auto_1118787 ) ) ( not ( = ?auto_1118776 ?auto_1118783 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118780 ?auto_1118782 ?auto_1118781 )
      ( MAKE-6CRATE-VERIFY ?auto_1118777 ?auto_1118778 ?auto_1118779 ?auto_1118776 ?auto_1118780 ?auto_1118782 ?auto_1118781 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1118791 - SURFACE
      ?auto_1118792 - SURFACE
      ?auto_1118793 - SURFACE
      ?auto_1118790 - SURFACE
      ?auto_1118794 - SURFACE
      ?auto_1118796 - SURFACE
      ?auto_1118795 - SURFACE
      ?auto_1118797 - SURFACE
    )
    :vars
    (
      ?auto_1118804 - HOIST
      ?auto_1118800 - PLACE
      ?auto_1118799 - PLACE
      ?auto_1118803 - HOIST
      ?auto_1118802 - SURFACE
      ?auto_1118798 - SURFACE
      ?auto_1118801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118804 ?auto_1118800 ) ( IS-CRATE ?auto_1118797 ) ( not ( = ?auto_1118795 ?auto_1118797 ) ) ( not ( = ?auto_1118796 ?auto_1118795 ) ) ( not ( = ?auto_1118796 ?auto_1118797 ) ) ( not ( = ?auto_1118799 ?auto_1118800 ) ) ( HOIST-AT ?auto_1118803 ?auto_1118799 ) ( not ( = ?auto_1118804 ?auto_1118803 ) ) ( SURFACE-AT ?auto_1118797 ?auto_1118799 ) ( ON ?auto_1118797 ?auto_1118802 ) ( CLEAR ?auto_1118797 ) ( not ( = ?auto_1118795 ?auto_1118802 ) ) ( not ( = ?auto_1118797 ?auto_1118802 ) ) ( not ( = ?auto_1118796 ?auto_1118802 ) ) ( SURFACE-AT ?auto_1118796 ?auto_1118800 ) ( CLEAR ?auto_1118796 ) ( IS-CRATE ?auto_1118795 ) ( AVAILABLE ?auto_1118804 ) ( AVAILABLE ?auto_1118803 ) ( SURFACE-AT ?auto_1118795 ?auto_1118799 ) ( ON ?auto_1118795 ?auto_1118798 ) ( CLEAR ?auto_1118795 ) ( not ( = ?auto_1118795 ?auto_1118798 ) ) ( not ( = ?auto_1118797 ?auto_1118798 ) ) ( not ( = ?auto_1118796 ?auto_1118798 ) ) ( not ( = ?auto_1118802 ?auto_1118798 ) ) ( TRUCK-AT ?auto_1118801 ?auto_1118800 ) ( ON ?auto_1118792 ?auto_1118791 ) ( ON ?auto_1118793 ?auto_1118792 ) ( ON ?auto_1118790 ?auto_1118793 ) ( ON ?auto_1118794 ?auto_1118790 ) ( ON ?auto_1118796 ?auto_1118794 ) ( not ( = ?auto_1118791 ?auto_1118792 ) ) ( not ( = ?auto_1118791 ?auto_1118793 ) ) ( not ( = ?auto_1118791 ?auto_1118790 ) ) ( not ( = ?auto_1118791 ?auto_1118794 ) ) ( not ( = ?auto_1118791 ?auto_1118796 ) ) ( not ( = ?auto_1118791 ?auto_1118795 ) ) ( not ( = ?auto_1118791 ?auto_1118797 ) ) ( not ( = ?auto_1118791 ?auto_1118802 ) ) ( not ( = ?auto_1118791 ?auto_1118798 ) ) ( not ( = ?auto_1118792 ?auto_1118793 ) ) ( not ( = ?auto_1118792 ?auto_1118790 ) ) ( not ( = ?auto_1118792 ?auto_1118794 ) ) ( not ( = ?auto_1118792 ?auto_1118796 ) ) ( not ( = ?auto_1118792 ?auto_1118795 ) ) ( not ( = ?auto_1118792 ?auto_1118797 ) ) ( not ( = ?auto_1118792 ?auto_1118802 ) ) ( not ( = ?auto_1118792 ?auto_1118798 ) ) ( not ( = ?auto_1118793 ?auto_1118790 ) ) ( not ( = ?auto_1118793 ?auto_1118794 ) ) ( not ( = ?auto_1118793 ?auto_1118796 ) ) ( not ( = ?auto_1118793 ?auto_1118795 ) ) ( not ( = ?auto_1118793 ?auto_1118797 ) ) ( not ( = ?auto_1118793 ?auto_1118802 ) ) ( not ( = ?auto_1118793 ?auto_1118798 ) ) ( not ( = ?auto_1118790 ?auto_1118794 ) ) ( not ( = ?auto_1118790 ?auto_1118796 ) ) ( not ( = ?auto_1118790 ?auto_1118795 ) ) ( not ( = ?auto_1118790 ?auto_1118797 ) ) ( not ( = ?auto_1118790 ?auto_1118802 ) ) ( not ( = ?auto_1118790 ?auto_1118798 ) ) ( not ( = ?auto_1118794 ?auto_1118796 ) ) ( not ( = ?auto_1118794 ?auto_1118795 ) ) ( not ( = ?auto_1118794 ?auto_1118797 ) ) ( not ( = ?auto_1118794 ?auto_1118802 ) ) ( not ( = ?auto_1118794 ?auto_1118798 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118796 ?auto_1118795 ?auto_1118797 )
      ( MAKE-7CRATE-VERIFY ?auto_1118791 ?auto_1118792 ?auto_1118793 ?auto_1118790 ?auto_1118794 ?auto_1118796 ?auto_1118795 ?auto_1118797 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1118806 - SURFACE
      ?auto_1118807 - SURFACE
      ?auto_1118808 - SURFACE
      ?auto_1118805 - SURFACE
      ?auto_1118809 - SURFACE
      ?auto_1118811 - SURFACE
      ?auto_1118810 - SURFACE
      ?auto_1118812 - SURFACE
      ?auto_1118813 - SURFACE
    )
    :vars
    (
      ?auto_1118820 - HOIST
      ?auto_1118816 - PLACE
      ?auto_1118815 - PLACE
      ?auto_1118819 - HOIST
      ?auto_1118818 - SURFACE
      ?auto_1118814 - SURFACE
      ?auto_1118817 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118820 ?auto_1118816 ) ( IS-CRATE ?auto_1118813 ) ( not ( = ?auto_1118812 ?auto_1118813 ) ) ( not ( = ?auto_1118810 ?auto_1118812 ) ) ( not ( = ?auto_1118810 ?auto_1118813 ) ) ( not ( = ?auto_1118815 ?auto_1118816 ) ) ( HOIST-AT ?auto_1118819 ?auto_1118815 ) ( not ( = ?auto_1118820 ?auto_1118819 ) ) ( SURFACE-AT ?auto_1118813 ?auto_1118815 ) ( ON ?auto_1118813 ?auto_1118818 ) ( CLEAR ?auto_1118813 ) ( not ( = ?auto_1118812 ?auto_1118818 ) ) ( not ( = ?auto_1118813 ?auto_1118818 ) ) ( not ( = ?auto_1118810 ?auto_1118818 ) ) ( SURFACE-AT ?auto_1118810 ?auto_1118816 ) ( CLEAR ?auto_1118810 ) ( IS-CRATE ?auto_1118812 ) ( AVAILABLE ?auto_1118820 ) ( AVAILABLE ?auto_1118819 ) ( SURFACE-AT ?auto_1118812 ?auto_1118815 ) ( ON ?auto_1118812 ?auto_1118814 ) ( CLEAR ?auto_1118812 ) ( not ( = ?auto_1118812 ?auto_1118814 ) ) ( not ( = ?auto_1118813 ?auto_1118814 ) ) ( not ( = ?auto_1118810 ?auto_1118814 ) ) ( not ( = ?auto_1118818 ?auto_1118814 ) ) ( TRUCK-AT ?auto_1118817 ?auto_1118816 ) ( ON ?auto_1118807 ?auto_1118806 ) ( ON ?auto_1118808 ?auto_1118807 ) ( ON ?auto_1118805 ?auto_1118808 ) ( ON ?auto_1118809 ?auto_1118805 ) ( ON ?auto_1118811 ?auto_1118809 ) ( ON ?auto_1118810 ?auto_1118811 ) ( not ( = ?auto_1118806 ?auto_1118807 ) ) ( not ( = ?auto_1118806 ?auto_1118808 ) ) ( not ( = ?auto_1118806 ?auto_1118805 ) ) ( not ( = ?auto_1118806 ?auto_1118809 ) ) ( not ( = ?auto_1118806 ?auto_1118811 ) ) ( not ( = ?auto_1118806 ?auto_1118810 ) ) ( not ( = ?auto_1118806 ?auto_1118812 ) ) ( not ( = ?auto_1118806 ?auto_1118813 ) ) ( not ( = ?auto_1118806 ?auto_1118818 ) ) ( not ( = ?auto_1118806 ?auto_1118814 ) ) ( not ( = ?auto_1118807 ?auto_1118808 ) ) ( not ( = ?auto_1118807 ?auto_1118805 ) ) ( not ( = ?auto_1118807 ?auto_1118809 ) ) ( not ( = ?auto_1118807 ?auto_1118811 ) ) ( not ( = ?auto_1118807 ?auto_1118810 ) ) ( not ( = ?auto_1118807 ?auto_1118812 ) ) ( not ( = ?auto_1118807 ?auto_1118813 ) ) ( not ( = ?auto_1118807 ?auto_1118818 ) ) ( not ( = ?auto_1118807 ?auto_1118814 ) ) ( not ( = ?auto_1118808 ?auto_1118805 ) ) ( not ( = ?auto_1118808 ?auto_1118809 ) ) ( not ( = ?auto_1118808 ?auto_1118811 ) ) ( not ( = ?auto_1118808 ?auto_1118810 ) ) ( not ( = ?auto_1118808 ?auto_1118812 ) ) ( not ( = ?auto_1118808 ?auto_1118813 ) ) ( not ( = ?auto_1118808 ?auto_1118818 ) ) ( not ( = ?auto_1118808 ?auto_1118814 ) ) ( not ( = ?auto_1118805 ?auto_1118809 ) ) ( not ( = ?auto_1118805 ?auto_1118811 ) ) ( not ( = ?auto_1118805 ?auto_1118810 ) ) ( not ( = ?auto_1118805 ?auto_1118812 ) ) ( not ( = ?auto_1118805 ?auto_1118813 ) ) ( not ( = ?auto_1118805 ?auto_1118818 ) ) ( not ( = ?auto_1118805 ?auto_1118814 ) ) ( not ( = ?auto_1118809 ?auto_1118811 ) ) ( not ( = ?auto_1118809 ?auto_1118810 ) ) ( not ( = ?auto_1118809 ?auto_1118812 ) ) ( not ( = ?auto_1118809 ?auto_1118813 ) ) ( not ( = ?auto_1118809 ?auto_1118818 ) ) ( not ( = ?auto_1118809 ?auto_1118814 ) ) ( not ( = ?auto_1118811 ?auto_1118810 ) ) ( not ( = ?auto_1118811 ?auto_1118812 ) ) ( not ( = ?auto_1118811 ?auto_1118813 ) ) ( not ( = ?auto_1118811 ?auto_1118818 ) ) ( not ( = ?auto_1118811 ?auto_1118814 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118810 ?auto_1118812 ?auto_1118813 )
      ( MAKE-8CRATE-VERIFY ?auto_1118806 ?auto_1118807 ?auto_1118808 ?auto_1118805 ?auto_1118809 ?auto_1118811 ?auto_1118810 ?auto_1118812 ?auto_1118813 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1118821 - SURFACE
      ?auto_1118822 - SURFACE
    )
    :vars
    (
      ?auto_1118830 - HOIST
      ?auto_1118825 - PLACE
      ?auto_1118829 - SURFACE
      ?auto_1118824 - PLACE
      ?auto_1118828 - HOIST
      ?auto_1118827 - SURFACE
      ?auto_1118823 - SURFACE
      ?auto_1118826 - TRUCK
      ?auto_1118831 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118830 ?auto_1118825 ) ( IS-CRATE ?auto_1118822 ) ( not ( = ?auto_1118821 ?auto_1118822 ) ) ( not ( = ?auto_1118829 ?auto_1118821 ) ) ( not ( = ?auto_1118829 ?auto_1118822 ) ) ( not ( = ?auto_1118824 ?auto_1118825 ) ) ( HOIST-AT ?auto_1118828 ?auto_1118824 ) ( not ( = ?auto_1118830 ?auto_1118828 ) ) ( SURFACE-AT ?auto_1118822 ?auto_1118824 ) ( ON ?auto_1118822 ?auto_1118827 ) ( CLEAR ?auto_1118822 ) ( not ( = ?auto_1118821 ?auto_1118827 ) ) ( not ( = ?auto_1118822 ?auto_1118827 ) ) ( not ( = ?auto_1118829 ?auto_1118827 ) ) ( IS-CRATE ?auto_1118821 ) ( AVAILABLE ?auto_1118828 ) ( SURFACE-AT ?auto_1118821 ?auto_1118824 ) ( ON ?auto_1118821 ?auto_1118823 ) ( CLEAR ?auto_1118821 ) ( not ( = ?auto_1118821 ?auto_1118823 ) ) ( not ( = ?auto_1118822 ?auto_1118823 ) ) ( not ( = ?auto_1118829 ?auto_1118823 ) ) ( not ( = ?auto_1118827 ?auto_1118823 ) ) ( TRUCK-AT ?auto_1118826 ?auto_1118825 ) ( SURFACE-AT ?auto_1118831 ?auto_1118825 ) ( CLEAR ?auto_1118831 ) ( LIFTING ?auto_1118830 ?auto_1118829 ) ( IS-CRATE ?auto_1118829 ) ( not ( = ?auto_1118831 ?auto_1118829 ) ) ( not ( = ?auto_1118821 ?auto_1118831 ) ) ( not ( = ?auto_1118822 ?auto_1118831 ) ) ( not ( = ?auto_1118827 ?auto_1118831 ) ) ( not ( = ?auto_1118823 ?auto_1118831 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1118831 ?auto_1118829 )
      ( MAKE-2CRATE ?auto_1118829 ?auto_1118821 ?auto_1118822 )
      ( MAKE-1CRATE-VERIFY ?auto_1118821 ?auto_1118822 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1118832 - SURFACE
      ?auto_1118833 - SURFACE
      ?auto_1118834 - SURFACE
    )
    :vars
    (
      ?auto_1118835 - HOIST
      ?auto_1118842 - PLACE
      ?auto_1118836 - PLACE
      ?auto_1118838 - HOIST
      ?auto_1118840 - SURFACE
      ?auto_1118839 - SURFACE
      ?auto_1118841 - TRUCK
      ?auto_1118837 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118835 ?auto_1118842 ) ( IS-CRATE ?auto_1118834 ) ( not ( = ?auto_1118833 ?auto_1118834 ) ) ( not ( = ?auto_1118832 ?auto_1118833 ) ) ( not ( = ?auto_1118832 ?auto_1118834 ) ) ( not ( = ?auto_1118836 ?auto_1118842 ) ) ( HOIST-AT ?auto_1118838 ?auto_1118836 ) ( not ( = ?auto_1118835 ?auto_1118838 ) ) ( SURFACE-AT ?auto_1118834 ?auto_1118836 ) ( ON ?auto_1118834 ?auto_1118840 ) ( CLEAR ?auto_1118834 ) ( not ( = ?auto_1118833 ?auto_1118840 ) ) ( not ( = ?auto_1118834 ?auto_1118840 ) ) ( not ( = ?auto_1118832 ?auto_1118840 ) ) ( IS-CRATE ?auto_1118833 ) ( AVAILABLE ?auto_1118838 ) ( SURFACE-AT ?auto_1118833 ?auto_1118836 ) ( ON ?auto_1118833 ?auto_1118839 ) ( CLEAR ?auto_1118833 ) ( not ( = ?auto_1118833 ?auto_1118839 ) ) ( not ( = ?auto_1118834 ?auto_1118839 ) ) ( not ( = ?auto_1118832 ?auto_1118839 ) ) ( not ( = ?auto_1118840 ?auto_1118839 ) ) ( TRUCK-AT ?auto_1118841 ?auto_1118842 ) ( SURFACE-AT ?auto_1118837 ?auto_1118842 ) ( CLEAR ?auto_1118837 ) ( LIFTING ?auto_1118835 ?auto_1118832 ) ( IS-CRATE ?auto_1118832 ) ( not ( = ?auto_1118837 ?auto_1118832 ) ) ( not ( = ?auto_1118833 ?auto_1118837 ) ) ( not ( = ?auto_1118834 ?auto_1118837 ) ) ( not ( = ?auto_1118840 ?auto_1118837 ) ) ( not ( = ?auto_1118839 ?auto_1118837 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1118833 ?auto_1118834 )
      ( MAKE-2CRATE-VERIFY ?auto_1118832 ?auto_1118833 ?auto_1118834 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1118844 - SURFACE
      ?auto_1118845 - SURFACE
      ?auto_1118846 - SURFACE
      ?auto_1118843 - SURFACE
    )
    :vars
    (
      ?auto_1118852 - HOIST
      ?auto_1118849 - PLACE
      ?auto_1118848 - PLACE
      ?auto_1118850 - HOIST
      ?auto_1118851 - SURFACE
      ?auto_1118853 - SURFACE
      ?auto_1118847 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118852 ?auto_1118849 ) ( IS-CRATE ?auto_1118843 ) ( not ( = ?auto_1118846 ?auto_1118843 ) ) ( not ( = ?auto_1118845 ?auto_1118846 ) ) ( not ( = ?auto_1118845 ?auto_1118843 ) ) ( not ( = ?auto_1118848 ?auto_1118849 ) ) ( HOIST-AT ?auto_1118850 ?auto_1118848 ) ( not ( = ?auto_1118852 ?auto_1118850 ) ) ( SURFACE-AT ?auto_1118843 ?auto_1118848 ) ( ON ?auto_1118843 ?auto_1118851 ) ( CLEAR ?auto_1118843 ) ( not ( = ?auto_1118846 ?auto_1118851 ) ) ( not ( = ?auto_1118843 ?auto_1118851 ) ) ( not ( = ?auto_1118845 ?auto_1118851 ) ) ( IS-CRATE ?auto_1118846 ) ( AVAILABLE ?auto_1118850 ) ( SURFACE-AT ?auto_1118846 ?auto_1118848 ) ( ON ?auto_1118846 ?auto_1118853 ) ( CLEAR ?auto_1118846 ) ( not ( = ?auto_1118846 ?auto_1118853 ) ) ( not ( = ?auto_1118843 ?auto_1118853 ) ) ( not ( = ?auto_1118845 ?auto_1118853 ) ) ( not ( = ?auto_1118851 ?auto_1118853 ) ) ( TRUCK-AT ?auto_1118847 ?auto_1118849 ) ( SURFACE-AT ?auto_1118844 ?auto_1118849 ) ( CLEAR ?auto_1118844 ) ( LIFTING ?auto_1118852 ?auto_1118845 ) ( IS-CRATE ?auto_1118845 ) ( not ( = ?auto_1118844 ?auto_1118845 ) ) ( not ( = ?auto_1118846 ?auto_1118844 ) ) ( not ( = ?auto_1118843 ?auto_1118844 ) ) ( not ( = ?auto_1118851 ?auto_1118844 ) ) ( not ( = ?auto_1118853 ?auto_1118844 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118845 ?auto_1118846 ?auto_1118843 )
      ( MAKE-3CRATE-VERIFY ?auto_1118844 ?auto_1118845 ?auto_1118846 ?auto_1118843 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1118855 - SURFACE
      ?auto_1118856 - SURFACE
      ?auto_1118857 - SURFACE
      ?auto_1118854 - SURFACE
      ?auto_1118858 - SURFACE
    )
    :vars
    (
      ?auto_1118864 - HOIST
      ?auto_1118861 - PLACE
      ?auto_1118860 - PLACE
      ?auto_1118862 - HOIST
      ?auto_1118863 - SURFACE
      ?auto_1118865 - SURFACE
      ?auto_1118859 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118864 ?auto_1118861 ) ( IS-CRATE ?auto_1118858 ) ( not ( = ?auto_1118854 ?auto_1118858 ) ) ( not ( = ?auto_1118857 ?auto_1118854 ) ) ( not ( = ?auto_1118857 ?auto_1118858 ) ) ( not ( = ?auto_1118860 ?auto_1118861 ) ) ( HOIST-AT ?auto_1118862 ?auto_1118860 ) ( not ( = ?auto_1118864 ?auto_1118862 ) ) ( SURFACE-AT ?auto_1118858 ?auto_1118860 ) ( ON ?auto_1118858 ?auto_1118863 ) ( CLEAR ?auto_1118858 ) ( not ( = ?auto_1118854 ?auto_1118863 ) ) ( not ( = ?auto_1118858 ?auto_1118863 ) ) ( not ( = ?auto_1118857 ?auto_1118863 ) ) ( IS-CRATE ?auto_1118854 ) ( AVAILABLE ?auto_1118862 ) ( SURFACE-AT ?auto_1118854 ?auto_1118860 ) ( ON ?auto_1118854 ?auto_1118865 ) ( CLEAR ?auto_1118854 ) ( not ( = ?auto_1118854 ?auto_1118865 ) ) ( not ( = ?auto_1118858 ?auto_1118865 ) ) ( not ( = ?auto_1118857 ?auto_1118865 ) ) ( not ( = ?auto_1118863 ?auto_1118865 ) ) ( TRUCK-AT ?auto_1118859 ?auto_1118861 ) ( SURFACE-AT ?auto_1118856 ?auto_1118861 ) ( CLEAR ?auto_1118856 ) ( LIFTING ?auto_1118864 ?auto_1118857 ) ( IS-CRATE ?auto_1118857 ) ( not ( = ?auto_1118856 ?auto_1118857 ) ) ( not ( = ?auto_1118854 ?auto_1118856 ) ) ( not ( = ?auto_1118858 ?auto_1118856 ) ) ( not ( = ?auto_1118863 ?auto_1118856 ) ) ( not ( = ?auto_1118865 ?auto_1118856 ) ) ( ON ?auto_1118856 ?auto_1118855 ) ( not ( = ?auto_1118855 ?auto_1118856 ) ) ( not ( = ?auto_1118855 ?auto_1118857 ) ) ( not ( = ?auto_1118855 ?auto_1118854 ) ) ( not ( = ?auto_1118855 ?auto_1118858 ) ) ( not ( = ?auto_1118855 ?auto_1118863 ) ) ( not ( = ?auto_1118855 ?auto_1118865 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118857 ?auto_1118854 ?auto_1118858 )
      ( MAKE-4CRATE-VERIFY ?auto_1118855 ?auto_1118856 ?auto_1118857 ?auto_1118854 ?auto_1118858 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1118867 - SURFACE
      ?auto_1118868 - SURFACE
      ?auto_1118869 - SURFACE
      ?auto_1118866 - SURFACE
      ?auto_1118870 - SURFACE
      ?auto_1118871 - SURFACE
    )
    :vars
    (
      ?auto_1118877 - HOIST
      ?auto_1118874 - PLACE
      ?auto_1118873 - PLACE
      ?auto_1118875 - HOIST
      ?auto_1118876 - SURFACE
      ?auto_1118878 - SURFACE
      ?auto_1118872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118877 ?auto_1118874 ) ( IS-CRATE ?auto_1118871 ) ( not ( = ?auto_1118870 ?auto_1118871 ) ) ( not ( = ?auto_1118866 ?auto_1118870 ) ) ( not ( = ?auto_1118866 ?auto_1118871 ) ) ( not ( = ?auto_1118873 ?auto_1118874 ) ) ( HOIST-AT ?auto_1118875 ?auto_1118873 ) ( not ( = ?auto_1118877 ?auto_1118875 ) ) ( SURFACE-AT ?auto_1118871 ?auto_1118873 ) ( ON ?auto_1118871 ?auto_1118876 ) ( CLEAR ?auto_1118871 ) ( not ( = ?auto_1118870 ?auto_1118876 ) ) ( not ( = ?auto_1118871 ?auto_1118876 ) ) ( not ( = ?auto_1118866 ?auto_1118876 ) ) ( IS-CRATE ?auto_1118870 ) ( AVAILABLE ?auto_1118875 ) ( SURFACE-AT ?auto_1118870 ?auto_1118873 ) ( ON ?auto_1118870 ?auto_1118878 ) ( CLEAR ?auto_1118870 ) ( not ( = ?auto_1118870 ?auto_1118878 ) ) ( not ( = ?auto_1118871 ?auto_1118878 ) ) ( not ( = ?auto_1118866 ?auto_1118878 ) ) ( not ( = ?auto_1118876 ?auto_1118878 ) ) ( TRUCK-AT ?auto_1118872 ?auto_1118874 ) ( SURFACE-AT ?auto_1118869 ?auto_1118874 ) ( CLEAR ?auto_1118869 ) ( LIFTING ?auto_1118877 ?auto_1118866 ) ( IS-CRATE ?auto_1118866 ) ( not ( = ?auto_1118869 ?auto_1118866 ) ) ( not ( = ?auto_1118870 ?auto_1118869 ) ) ( not ( = ?auto_1118871 ?auto_1118869 ) ) ( not ( = ?auto_1118876 ?auto_1118869 ) ) ( not ( = ?auto_1118878 ?auto_1118869 ) ) ( ON ?auto_1118868 ?auto_1118867 ) ( ON ?auto_1118869 ?auto_1118868 ) ( not ( = ?auto_1118867 ?auto_1118868 ) ) ( not ( = ?auto_1118867 ?auto_1118869 ) ) ( not ( = ?auto_1118867 ?auto_1118866 ) ) ( not ( = ?auto_1118867 ?auto_1118870 ) ) ( not ( = ?auto_1118867 ?auto_1118871 ) ) ( not ( = ?auto_1118867 ?auto_1118876 ) ) ( not ( = ?auto_1118867 ?auto_1118878 ) ) ( not ( = ?auto_1118868 ?auto_1118869 ) ) ( not ( = ?auto_1118868 ?auto_1118866 ) ) ( not ( = ?auto_1118868 ?auto_1118870 ) ) ( not ( = ?auto_1118868 ?auto_1118871 ) ) ( not ( = ?auto_1118868 ?auto_1118876 ) ) ( not ( = ?auto_1118868 ?auto_1118878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118866 ?auto_1118870 ?auto_1118871 )
      ( MAKE-5CRATE-VERIFY ?auto_1118867 ?auto_1118868 ?auto_1118869 ?auto_1118866 ?auto_1118870 ?auto_1118871 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1118880 - SURFACE
      ?auto_1118881 - SURFACE
      ?auto_1118882 - SURFACE
      ?auto_1118879 - SURFACE
      ?auto_1118883 - SURFACE
      ?auto_1118885 - SURFACE
      ?auto_1118884 - SURFACE
    )
    :vars
    (
      ?auto_1118891 - HOIST
      ?auto_1118888 - PLACE
      ?auto_1118887 - PLACE
      ?auto_1118889 - HOIST
      ?auto_1118890 - SURFACE
      ?auto_1118892 - SURFACE
      ?auto_1118886 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118891 ?auto_1118888 ) ( IS-CRATE ?auto_1118884 ) ( not ( = ?auto_1118885 ?auto_1118884 ) ) ( not ( = ?auto_1118883 ?auto_1118885 ) ) ( not ( = ?auto_1118883 ?auto_1118884 ) ) ( not ( = ?auto_1118887 ?auto_1118888 ) ) ( HOIST-AT ?auto_1118889 ?auto_1118887 ) ( not ( = ?auto_1118891 ?auto_1118889 ) ) ( SURFACE-AT ?auto_1118884 ?auto_1118887 ) ( ON ?auto_1118884 ?auto_1118890 ) ( CLEAR ?auto_1118884 ) ( not ( = ?auto_1118885 ?auto_1118890 ) ) ( not ( = ?auto_1118884 ?auto_1118890 ) ) ( not ( = ?auto_1118883 ?auto_1118890 ) ) ( IS-CRATE ?auto_1118885 ) ( AVAILABLE ?auto_1118889 ) ( SURFACE-AT ?auto_1118885 ?auto_1118887 ) ( ON ?auto_1118885 ?auto_1118892 ) ( CLEAR ?auto_1118885 ) ( not ( = ?auto_1118885 ?auto_1118892 ) ) ( not ( = ?auto_1118884 ?auto_1118892 ) ) ( not ( = ?auto_1118883 ?auto_1118892 ) ) ( not ( = ?auto_1118890 ?auto_1118892 ) ) ( TRUCK-AT ?auto_1118886 ?auto_1118888 ) ( SURFACE-AT ?auto_1118879 ?auto_1118888 ) ( CLEAR ?auto_1118879 ) ( LIFTING ?auto_1118891 ?auto_1118883 ) ( IS-CRATE ?auto_1118883 ) ( not ( = ?auto_1118879 ?auto_1118883 ) ) ( not ( = ?auto_1118885 ?auto_1118879 ) ) ( not ( = ?auto_1118884 ?auto_1118879 ) ) ( not ( = ?auto_1118890 ?auto_1118879 ) ) ( not ( = ?auto_1118892 ?auto_1118879 ) ) ( ON ?auto_1118881 ?auto_1118880 ) ( ON ?auto_1118882 ?auto_1118881 ) ( ON ?auto_1118879 ?auto_1118882 ) ( not ( = ?auto_1118880 ?auto_1118881 ) ) ( not ( = ?auto_1118880 ?auto_1118882 ) ) ( not ( = ?auto_1118880 ?auto_1118879 ) ) ( not ( = ?auto_1118880 ?auto_1118883 ) ) ( not ( = ?auto_1118880 ?auto_1118885 ) ) ( not ( = ?auto_1118880 ?auto_1118884 ) ) ( not ( = ?auto_1118880 ?auto_1118890 ) ) ( not ( = ?auto_1118880 ?auto_1118892 ) ) ( not ( = ?auto_1118881 ?auto_1118882 ) ) ( not ( = ?auto_1118881 ?auto_1118879 ) ) ( not ( = ?auto_1118881 ?auto_1118883 ) ) ( not ( = ?auto_1118881 ?auto_1118885 ) ) ( not ( = ?auto_1118881 ?auto_1118884 ) ) ( not ( = ?auto_1118881 ?auto_1118890 ) ) ( not ( = ?auto_1118881 ?auto_1118892 ) ) ( not ( = ?auto_1118882 ?auto_1118879 ) ) ( not ( = ?auto_1118882 ?auto_1118883 ) ) ( not ( = ?auto_1118882 ?auto_1118885 ) ) ( not ( = ?auto_1118882 ?auto_1118884 ) ) ( not ( = ?auto_1118882 ?auto_1118890 ) ) ( not ( = ?auto_1118882 ?auto_1118892 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118883 ?auto_1118885 ?auto_1118884 )
      ( MAKE-6CRATE-VERIFY ?auto_1118880 ?auto_1118881 ?auto_1118882 ?auto_1118879 ?auto_1118883 ?auto_1118885 ?auto_1118884 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1118894 - SURFACE
      ?auto_1118895 - SURFACE
      ?auto_1118896 - SURFACE
      ?auto_1118893 - SURFACE
      ?auto_1118897 - SURFACE
      ?auto_1118899 - SURFACE
      ?auto_1118898 - SURFACE
      ?auto_1118900 - SURFACE
    )
    :vars
    (
      ?auto_1118906 - HOIST
      ?auto_1118903 - PLACE
      ?auto_1118902 - PLACE
      ?auto_1118904 - HOIST
      ?auto_1118905 - SURFACE
      ?auto_1118907 - SURFACE
      ?auto_1118901 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118906 ?auto_1118903 ) ( IS-CRATE ?auto_1118900 ) ( not ( = ?auto_1118898 ?auto_1118900 ) ) ( not ( = ?auto_1118899 ?auto_1118898 ) ) ( not ( = ?auto_1118899 ?auto_1118900 ) ) ( not ( = ?auto_1118902 ?auto_1118903 ) ) ( HOIST-AT ?auto_1118904 ?auto_1118902 ) ( not ( = ?auto_1118906 ?auto_1118904 ) ) ( SURFACE-AT ?auto_1118900 ?auto_1118902 ) ( ON ?auto_1118900 ?auto_1118905 ) ( CLEAR ?auto_1118900 ) ( not ( = ?auto_1118898 ?auto_1118905 ) ) ( not ( = ?auto_1118900 ?auto_1118905 ) ) ( not ( = ?auto_1118899 ?auto_1118905 ) ) ( IS-CRATE ?auto_1118898 ) ( AVAILABLE ?auto_1118904 ) ( SURFACE-AT ?auto_1118898 ?auto_1118902 ) ( ON ?auto_1118898 ?auto_1118907 ) ( CLEAR ?auto_1118898 ) ( not ( = ?auto_1118898 ?auto_1118907 ) ) ( not ( = ?auto_1118900 ?auto_1118907 ) ) ( not ( = ?auto_1118899 ?auto_1118907 ) ) ( not ( = ?auto_1118905 ?auto_1118907 ) ) ( TRUCK-AT ?auto_1118901 ?auto_1118903 ) ( SURFACE-AT ?auto_1118897 ?auto_1118903 ) ( CLEAR ?auto_1118897 ) ( LIFTING ?auto_1118906 ?auto_1118899 ) ( IS-CRATE ?auto_1118899 ) ( not ( = ?auto_1118897 ?auto_1118899 ) ) ( not ( = ?auto_1118898 ?auto_1118897 ) ) ( not ( = ?auto_1118900 ?auto_1118897 ) ) ( not ( = ?auto_1118905 ?auto_1118897 ) ) ( not ( = ?auto_1118907 ?auto_1118897 ) ) ( ON ?auto_1118895 ?auto_1118894 ) ( ON ?auto_1118896 ?auto_1118895 ) ( ON ?auto_1118893 ?auto_1118896 ) ( ON ?auto_1118897 ?auto_1118893 ) ( not ( = ?auto_1118894 ?auto_1118895 ) ) ( not ( = ?auto_1118894 ?auto_1118896 ) ) ( not ( = ?auto_1118894 ?auto_1118893 ) ) ( not ( = ?auto_1118894 ?auto_1118897 ) ) ( not ( = ?auto_1118894 ?auto_1118899 ) ) ( not ( = ?auto_1118894 ?auto_1118898 ) ) ( not ( = ?auto_1118894 ?auto_1118900 ) ) ( not ( = ?auto_1118894 ?auto_1118905 ) ) ( not ( = ?auto_1118894 ?auto_1118907 ) ) ( not ( = ?auto_1118895 ?auto_1118896 ) ) ( not ( = ?auto_1118895 ?auto_1118893 ) ) ( not ( = ?auto_1118895 ?auto_1118897 ) ) ( not ( = ?auto_1118895 ?auto_1118899 ) ) ( not ( = ?auto_1118895 ?auto_1118898 ) ) ( not ( = ?auto_1118895 ?auto_1118900 ) ) ( not ( = ?auto_1118895 ?auto_1118905 ) ) ( not ( = ?auto_1118895 ?auto_1118907 ) ) ( not ( = ?auto_1118896 ?auto_1118893 ) ) ( not ( = ?auto_1118896 ?auto_1118897 ) ) ( not ( = ?auto_1118896 ?auto_1118899 ) ) ( not ( = ?auto_1118896 ?auto_1118898 ) ) ( not ( = ?auto_1118896 ?auto_1118900 ) ) ( not ( = ?auto_1118896 ?auto_1118905 ) ) ( not ( = ?auto_1118896 ?auto_1118907 ) ) ( not ( = ?auto_1118893 ?auto_1118897 ) ) ( not ( = ?auto_1118893 ?auto_1118899 ) ) ( not ( = ?auto_1118893 ?auto_1118898 ) ) ( not ( = ?auto_1118893 ?auto_1118900 ) ) ( not ( = ?auto_1118893 ?auto_1118905 ) ) ( not ( = ?auto_1118893 ?auto_1118907 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118899 ?auto_1118898 ?auto_1118900 )
      ( MAKE-7CRATE-VERIFY ?auto_1118894 ?auto_1118895 ?auto_1118896 ?auto_1118893 ?auto_1118897 ?auto_1118899 ?auto_1118898 ?auto_1118900 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1118909 - SURFACE
      ?auto_1118910 - SURFACE
      ?auto_1118911 - SURFACE
      ?auto_1118908 - SURFACE
      ?auto_1118912 - SURFACE
      ?auto_1118914 - SURFACE
      ?auto_1118913 - SURFACE
      ?auto_1118915 - SURFACE
      ?auto_1118916 - SURFACE
    )
    :vars
    (
      ?auto_1118922 - HOIST
      ?auto_1118919 - PLACE
      ?auto_1118918 - PLACE
      ?auto_1118920 - HOIST
      ?auto_1118921 - SURFACE
      ?auto_1118923 - SURFACE
      ?auto_1118917 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118922 ?auto_1118919 ) ( IS-CRATE ?auto_1118916 ) ( not ( = ?auto_1118915 ?auto_1118916 ) ) ( not ( = ?auto_1118913 ?auto_1118915 ) ) ( not ( = ?auto_1118913 ?auto_1118916 ) ) ( not ( = ?auto_1118918 ?auto_1118919 ) ) ( HOIST-AT ?auto_1118920 ?auto_1118918 ) ( not ( = ?auto_1118922 ?auto_1118920 ) ) ( SURFACE-AT ?auto_1118916 ?auto_1118918 ) ( ON ?auto_1118916 ?auto_1118921 ) ( CLEAR ?auto_1118916 ) ( not ( = ?auto_1118915 ?auto_1118921 ) ) ( not ( = ?auto_1118916 ?auto_1118921 ) ) ( not ( = ?auto_1118913 ?auto_1118921 ) ) ( IS-CRATE ?auto_1118915 ) ( AVAILABLE ?auto_1118920 ) ( SURFACE-AT ?auto_1118915 ?auto_1118918 ) ( ON ?auto_1118915 ?auto_1118923 ) ( CLEAR ?auto_1118915 ) ( not ( = ?auto_1118915 ?auto_1118923 ) ) ( not ( = ?auto_1118916 ?auto_1118923 ) ) ( not ( = ?auto_1118913 ?auto_1118923 ) ) ( not ( = ?auto_1118921 ?auto_1118923 ) ) ( TRUCK-AT ?auto_1118917 ?auto_1118919 ) ( SURFACE-AT ?auto_1118914 ?auto_1118919 ) ( CLEAR ?auto_1118914 ) ( LIFTING ?auto_1118922 ?auto_1118913 ) ( IS-CRATE ?auto_1118913 ) ( not ( = ?auto_1118914 ?auto_1118913 ) ) ( not ( = ?auto_1118915 ?auto_1118914 ) ) ( not ( = ?auto_1118916 ?auto_1118914 ) ) ( not ( = ?auto_1118921 ?auto_1118914 ) ) ( not ( = ?auto_1118923 ?auto_1118914 ) ) ( ON ?auto_1118910 ?auto_1118909 ) ( ON ?auto_1118911 ?auto_1118910 ) ( ON ?auto_1118908 ?auto_1118911 ) ( ON ?auto_1118912 ?auto_1118908 ) ( ON ?auto_1118914 ?auto_1118912 ) ( not ( = ?auto_1118909 ?auto_1118910 ) ) ( not ( = ?auto_1118909 ?auto_1118911 ) ) ( not ( = ?auto_1118909 ?auto_1118908 ) ) ( not ( = ?auto_1118909 ?auto_1118912 ) ) ( not ( = ?auto_1118909 ?auto_1118914 ) ) ( not ( = ?auto_1118909 ?auto_1118913 ) ) ( not ( = ?auto_1118909 ?auto_1118915 ) ) ( not ( = ?auto_1118909 ?auto_1118916 ) ) ( not ( = ?auto_1118909 ?auto_1118921 ) ) ( not ( = ?auto_1118909 ?auto_1118923 ) ) ( not ( = ?auto_1118910 ?auto_1118911 ) ) ( not ( = ?auto_1118910 ?auto_1118908 ) ) ( not ( = ?auto_1118910 ?auto_1118912 ) ) ( not ( = ?auto_1118910 ?auto_1118914 ) ) ( not ( = ?auto_1118910 ?auto_1118913 ) ) ( not ( = ?auto_1118910 ?auto_1118915 ) ) ( not ( = ?auto_1118910 ?auto_1118916 ) ) ( not ( = ?auto_1118910 ?auto_1118921 ) ) ( not ( = ?auto_1118910 ?auto_1118923 ) ) ( not ( = ?auto_1118911 ?auto_1118908 ) ) ( not ( = ?auto_1118911 ?auto_1118912 ) ) ( not ( = ?auto_1118911 ?auto_1118914 ) ) ( not ( = ?auto_1118911 ?auto_1118913 ) ) ( not ( = ?auto_1118911 ?auto_1118915 ) ) ( not ( = ?auto_1118911 ?auto_1118916 ) ) ( not ( = ?auto_1118911 ?auto_1118921 ) ) ( not ( = ?auto_1118911 ?auto_1118923 ) ) ( not ( = ?auto_1118908 ?auto_1118912 ) ) ( not ( = ?auto_1118908 ?auto_1118914 ) ) ( not ( = ?auto_1118908 ?auto_1118913 ) ) ( not ( = ?auto_1118908 ?auto_1118915 ) ) ( not ( = ?auto_1118908 ?auto_1118916 ) ) ( not ( = ?auto_1118908 ?auto_1118921 ) ) ( not ( = ?auto_1118908 ?auto_1118923 ) ) ( not ( = ?auto_1118912 ?auto_1118914 ) ) ( not ( = ?auto_1118912 ?auto_1118913 ) ) ( not ( = ?auto_1118912 ?auto_1118915 ) ) ( not ( = ?auto_1118912 ?auto_1118916 ) ) ( not ( = ?auto_1118912 ?auto_1118921 ) ) ( not ( = ?auto_1118912 ?auto_1118923 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1118913 ?auto_1118915 ?auto_1118916 )
      ( MAKE-8CRATE-VERIFY ?auto_1118909 ?auto_1118910 ?auto_1118911 ?auto_1118908 ?auto_1118912 ?auto_1118914 ?auto_1118913 ?auto_1118915 ?auto_1118916 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1121437 - SURFACE
      ?auto_1121438 - SURFACE
    )
    :vars
    (
      ?auto_1121443 - HOIST
      ?auto_1121439 - PLACE
      ?auto_1121442 - SURFACE
      ?auto_1121440 - PLACE
      ?auto_1121444 - HOIST
      ?auto_1121446 - SURFACE
      ?auto_1121445 - TRUCK
      ?auto_1121441 - SURFACE
      ?auto_1121447 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1121443 ?auto_1121439 ) ( IS-CRATE ?auto_1121438 ) ( not ( = ?auto_1121437 ?auto_1121438 ) ) ( not ( = ?auto_1121442 ?auto_1121437 ) ) ( not ( = ?auto_1121442 ?auto_1121438 ) ) ( not ( = ?auto_1121440 ?auto_1121439 ) ) ( HOIST-AT ?auto_1121444 ?auto_1121440 ) ( not ( = ?auto_1121443 ?auto_1121444 ) ) ( SURFACE-AT ?auto_1121438 ?auto_1121440 ) ( ON ?auto_1121438 ?auto_1121446 ) ( CLEAR ?auto_1121438 ) ( not ( = ?auto_1121437 ?auto_1121446 ) ) ( not ( = ?auto_1121438 ?auto_1121446 ) ) ( not ( = ?auto_1121442 ?auto_1121446 ) ) ( SURFACE-AT ?auto_1121442 ?auto_1121439 ) ( CLEAR ?auto_1121442 ) ( IS-CRATE ?auto_1121437 ) ( AVAILABLE ?auto_1121443 ) ( TRUCK-AT ?auto_1121445 ?auto_1121440 ) ( SURFACE-AT ?auto_1121437 ?auto_1121440 ) ( ON ?auto_1121437 ?auto_1121441 ) ( CLEAR ?auto_1121437 ) ( not ( = ?auto_1121437 ?auto_1121441 ) ) ( not ( = ?auto_1121438 ?auto_1121441 ) ) ( not ( = ?auto_1121442 ?auto_1121441 ) ) ( not ( = ?auto_1121446 ?auto_1121441 ) ) ( LIFTING ?auto_1121444 ?auto_1121447 ) ( IS-CRATE ?auto_1121447 ) ( not ( = ?auto_1121437 ?auto_1121447 ) ) ( not ( = ?auto_1121438 ?auto_1121447 ) ) ( not ( = ?auto_1121442 ?auto_1121447 ) ) ( not ( = ?auto_1121446 ?auto_1121447 ) ) ( not ( = ?auto_1121441 ?auto_1121447 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1121444 ?auto_1121447 ?auto_1121445 ?auto_1121440 )
      ( MAKE-2CRATE ?auto_1121442 ?auto_1121437 ?auto_1121438 )
      ( MAKE-1CRATE-VERIFY ?auto_1121437 ?auto_1121438 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1121448 - SURFACE
      ?auto_1121449 - SURFACE
      ?auto_1121450 - SURFACE
    )
    :vars
    (
      ?auto_1121458 - HOIST
      ?auto_1121454 - PLACE
      ?auto_1121455 - PLACE
      ?auto_1121452 - HOIST
      ?auto_1121453 - SURFACE
      ?auto_1121456 - TRUCK
      ?auto_1121451 - SURFACE
      ?auto_1121457 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1121458 ?auto_1121454 ) ( IS-CRATE ?auto_1121450 ) ( not ( = ?auto_1121449 ?auto_1121450 ) ) ( not ( = ?auto_1121448 ?auto_1121449 ) ) ( not ( = ?auto_1121448 ?auto_1121450 ) ) ( not ( = ?auto_1121455 ?auto_1121454 ) ) ( HOIST-AT ?auto_1121452 ?auto_1121455 ) ( not ( = ?auto_1121458 ?auto_1121452 ) ) ( SURFACE-AT ?auto_1121450 ?auto_1121455 ) ( ON ?auto_1121450 ?auto_1121453 ) ( CLEAR ?auto_1121450 ) ( not ( = ?auto_1121449 ?auto_1121453 ) ) ( not ( = ?auto_1121450 ?auto_1121453 ) ) ( not ( = ?auto_1121448 ?auto_1121453 ) ) ( SURFACE-AT ?auto_1121448 ?auto_1121454 ) ( CLEAR ?auto_1121448 ) ( IS-CRATE ?auto_1121449 ) ( AVAILABLE ?auto_1121458 ) ( TRUCK-AT ?auto_1121456 ?auto_1121455 ) ( SURFACE-AT ?auto_1121449 ?auto_1121455 ) ( ON ?auto_1121449 ?auto_1121451 ) ( CLEAR ?auto_1121449 ) ( not ( = ?auto_1121449 ?auto_1121451 ) ) ( not ( = ?auto_1121450 ?auto_1121451 ) ) ( not ( = ?auto_1121448 ?auto_1121451 ) ) ( not ( = ?auto_1121453 ?auto_1121451 ) ) ( LIFTING ?auto_1121452 ?auto_1121457 ) ( IS-CRATE ?auto_1121457 ) ( not ( = ?auto_1121449 ?auto_1121457 ) ) ( not ( = ?auto_1121450 ?auto_1121457 ) ) ( not ( = ?auto_1121448 ?auto_1121457 ) ) ( not ( = ?auto_1121453 ?auto_1121457 ) ) ( not ( = ?auto_1121451 ?auto_1121457 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1121449 ?auto_1121450 )
      ( MAKE-2CRATE-VERIFY ?auto_1121448 ?auto_1121449 ?auto_1121450 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1122447 - SURFACE
      ?auto_1122448 - SURFACE
      ?auto_1122449 - SURFACE
      ?auto_1122446 - SURFACE
      ?auto_1122450 - SURFACE
      ?auto_1122452 - SURFACE
      ?auto_1122451 - SURFACE
      ?auto_1122453 - SURFACE
      ?auto_1122454 - SURFACE
      ?auto_1122455 - SURFACE
    )
    :vars
    (
      ?auto_1122456 - HOIST
      ?auto_1122457 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1122456 ?auto_1122457 ) ( SURFACE-AT ?auto_1122454 ?auto_1122457 ) ( CLEAR ?auto_1122454 ) ( LIFTING ?auto_1122456 ?auto_1122455 ) ( IS-CRATE ?auto_1122455 ) ( not ( = ?auto_1122454 ?auto_1122455 ) ) ( ON ?auto_1122448 ?auto_1122447 ) ( ON ?auto_1122449 ?auto_1122448 ) ( ON ?auto_1122446 ?auto_1122449 ) ( ON ?auto_1122450 ?auto_1122446 ) ( ON ?auto_1122452 ?auto_1122450 ) ( ON ?auto_1122451 ?auto_1122452 ) ( ON ?auto_1122453 ?auto_1122451 ) ( ON ?auto_1122454 ?auto_1122453 ) ( not ( = ?auto_1122447 ?auto_1122448 ) ) ( not ( = ?auto_1122447 ?auto_1122449 ) ) ( not ( = ?auto_1122447 ?auto_1122446 ) ) ( not ( = ?auto_1122447 ?auto_1122450 ) ) ( not ( = ?auto_1122447 ?auto_1122452 ) ) ( not ( = ?auto_1122447 ?auto_1122451 ) ) ( not ( = ?auto_1122447 ?auto_1122453 ) ) ( not ( = ?auto_1122447 ?auto_1122454 ) ) ( not ( = ?auto_1122447 ?auto_1122455 ) ) ( not ( = ?auto_1122448 ?auto_1122449 ) ) ( not ( = ?auto_1122448 ?auto_1122446 ) ) ( not ( = ?auto_1122448 ?auto_1122450 ) ) ( not ( = ?auto_1122448 ?auto_1122452 ) ) ( not ( = ?auto_1122448 ?auto_1122451 ) ) ( not ( = ?auto_1122448 ?auto_1122453 ) ) ( not ( = ?auto_1122448 ?auto_1122454 ) ) ( not ( = ?auto_1122448 ?auto_1122455 ) ) ( not ( = ?auto_1122449 ?auto_1122446 ) ) ( not ( = ?auto_1122449 ?auto_1122450 ) ) ( not ( = ?auto_1122449 ?auto_1122452 ) ) ( not ( = ?auto_1122449 ?auto_1122451 ) ) ( not ( = ?auto_1122449 ?auto_1122453 ) ) ( not ( = ?auto_1122449 ?auto_1122454 ) ) ( not ( = ?auto_1122449 ?auto_1122455 ) ) ( not ( = ?auto_1122446 ?auto_1122450 ) ) ( not ( = ?auto_1122446 ?auto_1122452 ) ) ( not ( = ?auto_1122446 ?auto_1122451 ) ) ( not ( = ?auto_1122446 ?auto_1122453 ) ) ( not ( = ?auto_1122446 ?auto_1122454 ) ) ( not ( = ?auto_1122446 ?auto_1122455 ) ) ( not ( = ?auto_1122450 ?auto_1122452 ) ) ( not ( = ?auto_1122450 ?auto_1122451 ) ) ( not ( = ?auto_1122450 ?auto_1122453 ) ) ( not ( = ?auto_1122450 ?auto_1122454 ) ) ( not ( = ?auto_1122450 ?auto_1122455 ) ) ( not ( = ?auto_1122452 ?auto_1122451 ) ) ( not ( = ?auto_1122452 ?auto_1122453 ) ) ( not ( = ?auto_1122452 ?auto_1122454 ) ) ( not ( = ?auto_1122452 ?auto_1122455 ) ) ( not ( = ?auto_1122451 ?auto_1122453 ) ) ( not ( = ?auto_1122451 ?auto_1122454 ) ) ( not ( = ?auto_1122451 ?auto_1122455 ) ) ( not ( = ?auto_1122453 ?auto_1122454 ) ) ( not ( = ?auto_1122453 ?auto_1122455 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1122454 ?auto_1122455 )
      ( MAKE-9CRATE-VERIFY ?auto_1122447 ?auto_1122448 ?auto_1122449 ?auto_1122446 ?auto_1122450 ?auto_1122452 ?auto_1122451 ?auto_1122453 ?auto_1122454 ?auto_1122455 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1122527 - SURFACE
      ?auto_1122528 - SURFACE
      ?auto_1122529 - SURFACE
      ?auto_1122526 - SURFACE
      ?auto_1122530 - SURFACE
      ?auto_1122532 - SURFACE
      ?auto_1122531 - SURFACE
      ?auto_1122533 - SURFACE
      ?auto_1122534 - SURFACE
      ?auto_1122535 - SURFACE
    )
    :vars
    (
      ?auto_1122536 - HOIST
      ?auto_1122538 - PLACE
      ?auto_1122537 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1122536 ?auto_1122538 ) ( SURFACE-AT ?auto_1122534 ?auto_1122538 ) ( CLEAR ?auto_1122534 ) ( IS-CRATE ?auto_1122535 ) ( not ( = ?auto_1122534 ?auto_1122535 ) ) ( TRUCK-AT ?auto_1122537 ?auto_1122538 ) ( AVAILABLE ?auto_1122536 ) ( IN ?auto_1122535 ?auto_1122537 ) ( ON ?auto_1122534 ?auto_1122533 ) ( not ( = ?auto_1122533 ?auto_1122534 ) ) ( not ( = ?auto_1122533 ?auto_1122535 ) ) ( ON ?auto_1122528 ?auto_1122527 ) ( ON ?auto_1122529 ?auto_1122528 ) ( ON ?auto_1122526 ?auto_1122529 ) ( ON ?auto_1122530 ?auto_1122526 ) ( ON ?auto_1122532 ?auto_1122530 ) ( ON ?auto_1122531 ?auto_1122532 ) ( ON ?auto_1122533 ?auto_1122531 ) ( not ( = ?auto_1122527 ?auto_1122528 ) ) ( not ( = ?auto_1122527 ?auto_1122529 ) ) ( not ( = ?auto_1122527 ?auto_1122526 ) ) ( not ( = ?auto_1122527 ?auto_1122530 ) ) ( not ( = ?auto_1122527 ?auto_1122532 ) ) ( not ( = ?auto_1122527 ?auto_1122531 ) ) ( not ( = ?auto_1122527 ?auto_1122533 ) ) ( not ( = ?auto_1122527 ?auto_1122534 ) ) ( not ( = ?auto_1122527 ?auto_1122535 ) ) ( not ( = ?auto_1122528 ?auto_1122529 ) ) ( not ( = ?auto_1122528 ?auto_1122526 ) ) ( not ( = ?auto_1122528 ?auto_1122530 ) ) ( not ( = ?auto_1122528 ?auto_1122532 ) ) ( not ( = ?auto_1122528 ?auto_1122531 ) ) ( not ( = ?auto_1122528 ?auto_1122533 ) ) ( not ( = ?auto_1122528 ?auto_1122534 ) ) ( not ( = ?auto_1122528 ?auto_1122535 ) ) ( not ( = ?auto_1122529 ?auto_1122526 ) ) ( not ( = ?auto_1122529 ?auto_1122530 ) ) ( not ( = ?auto_1122529 ?auto_1122532 ) ) ( not ( = ?auto_1122529 ?auto_1122531 ) ) ( not ( = ?auto_1122529 ?auto_1122533 ) ) ( not ( = ?auto_1122529 ?auto_1122534 ) ) ( not ( = ?auto_1122529 ?auto_1122535 ) ) ( not ( = ?auto_1122526 ?auto_1122530 ) ) ( not ( = ?auto_1122526 ?auto_1122532 ) ) ( not ( = ?auto_1122526 ?auto_1122531 ) ) ( not ( = ?auto_1122526 ?auto_1122533 ) ) ( not ( = ?auto_1122526 ?auto_1122534 ) ) ( not ( = ?auto_1122526 ?auto_1122535 ) ) ( not ( = ?auto_1122530 ?auto_1122532 ) ) ( not ( = ?auto_1122530 ?auto_1122531 ) ) ( not ( = ?auto_1122530 ?auto_1122533 ) ) ( not ( = ?auto_1122530 ?auto_1122534 ) ) ( not ( = ?auto_1122530 ?auto_1122535 ) ) ( not ( = ?auto_1122532 ?auto_1122531 ) ) ( not ( = ?auto_1122532 ?auto_1122533 ) ) ( not ( = ?auto_1122532 ?auto_1122534 ) ) ( not ( = ?auto_1122532 ?auto_1122535 ) ) ( not ( = ?auto_1122531 ?auto_1122533 ) ) ( not ( = ?auto_1122531 ?auto_1122534 ) ) ( not ( = ?auto_1122531 ?auto_1122535 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1122533 ?auto_1122534 ?auto_1122535 )
      ( MAKE-9CRATE-VERIFY ?auto_1122527 ?auto_1122528 ?auto_1122529 ?auto_1122526 ?auto_1122530 ?auto_1122532 ?auto_1122531 ?auto_1122533 ?auto_1122534 ?auto_1122535 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1122617 - SURFACE
      ?auto_1122618 - SURFACE
      ?auto_1122619 - SURFACE
      ?auto_1122616 - SURFACE
      ?auto_1122620 - SURFACE
      ?auto_1122622 - SURFACE
      ?auto_1122621 - SURFACE
      ?auto_1122623 - SURFACE
      ?auto_1122624 - SURFACE
      ?auto_1122625 - SURFACE
    )
    :vars
    (
      ?auto_1122626 - HOIST
      ?auto_1122629 - PLACE
      ?auto_1122628 - TRUCK
      ?auto_1122627 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1122626 ?auto_1122629 ) ( SURFACE-AT ?auto_1122624 ?auto_1122629 ) ( CLEAR ?auto_1122624 ) ( IS-CRATE ?auto_1122625 ) ( not ( = ?auto_1122624 ?auto_1122625 ) ) ( AVAILABLE ?auto_1122626 ) ( IN ?auto_1122625 ?auto_1122628 ) ( ON ?auto_1122624 ?auto_1122623 ) ( not ( = ?auto_1122623 ?auto_1122624 ) ) ( not ( = ?auto_1122623 ?auto_1122625 ) ) ( TRUCK-AT ?auto_1122628 ?auto_1122627 ) ( not ( = ?auto_1122627 ?auto_1122629 ) ) ( ON ?auto_1122618 ?auto_1122617 ) ( ON ?auto_1122619 ?auto_1122618 ) ( ON ?auto_1122616 ?auto_1122619 ) ( ON ?auto_1122620 ?auto_1122616 ) ( ON ?auto_1122622 ?auto_1122620 ) ( ON ?auto_1122621 ?auto_1122622 ) ( ON ?auto_1122623 ?auto_1122621 ) ( not ( = ?auto_1122617 ?auto_1122618 ) ) ( not ( = ?auto_1122617 ?auto_1122619 ) ) ( not ( = ?auto_1122617 ?auto_1122616 ) ) ( not ( = ?auto_1122617 ?auto_1122620 ) ) ( not ( = ?auto_1122617 ?auto_1122622 ) ) ( not ( = ?auto_1122617 ?auto_1122621 ) ) ( not ( = ?auto_1122617 ?auto_1122623 ) ) ( not ( = ?auto_1122617 ?auto_1122624 ) ) ( not ( = ?auto_1122617 ?auto_1122625 ) ) ( not ( = ?auto_1122618 ?auto_1122619 ) ) ( not ( = ?auto_1122618 ?auto_1122616 ) ) ( not ( = ?auto_1122618 ?auto_1122620 ) ) ( not ( = ?auto_1122618 ?auto_1122622 ) ) ( not ( = ?auto_1122618 ?auto_1122621 ) ) ( not ( = ?auto_1122618 ?auto_1122623 ) ) ( not ( = ?auto_1122618 ?auto_1122624 ) ) ( not ( = ?auto_1122618 ?auto_1122625 ) ) ( not ( = ?auto_1122619 ?auto_1122616 ) ) ( not ( = ?auto_1122619 ?auto_1122620 ) ) ( not ( = ?auto_1122619 ?auto_1122622 ) ) ( not ( = ?auto_1122619 ?auto_1122621 ) ) ( not ( = ?auto_1122619 ?auto_1122623 ) ) ( not ( = ?auto_1122619 ?auto_1122624 ) ) ( not ( = ?auto_1122619 ?auto_1122625 ) ) ( not ( = ?auto_1122616 ?auto_1122620 ) ) ( not ( = ?auto_1122616 ?auto_1122622 ) ) ( not ( = ?auto_1122616 ?auto_1122621 ) ) ( not ( = ?auto_1122616 ?auto_1122623 ) ) ( not ( = ?auto_1122616 ?auto_1122624 ) ) ( not ( = ?auto_1122616 ?auto_1122625 ) ) ( not ( = ?auto_1122620 ?auto_1122622 ) ) ( not ( = ?auto_1122620 ?auto_1122621 ) ) ( not ( = ?auto_1122620 ?auto_1122623 ) ) ( not ( = ?auto_1122620 ?auto_1122624 ) ) ( not ( = ?auto_1122620 ?auto_1122625 ) ) ( not ( = ?auto_1122622 ?auto_1122621 ) ) ( not ( = ?auto_1122622 ?auto_1122623 ) ) ( not ( = ?auto_1122622 ?auto_1122624 ) ) ( not ( = ?auto_1122622 ?auto_1122625 ) ) ( not ( = ?auto_1122621 ?auto_1122623 ) ) ( not ( = ?auto_1122621 ?auto_1122624 ) ) ( not ( = ?auto_1122621 ?auto_1122625 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1122623 ?auto_1122624 ?auto_1122625 )
      ( MAKE-9CRATE-VERIFY ?auto_1122617 ?auto_1122618 ?auto_1122619 ?auto_1122616 ?auto_1122620 ?auto_1122622 ?auto_1122621 ?auto_1122623 ?auto_1122624 ?auto_1122625 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1122716 - SURFACE
      ?auto_1122717 - SURFACE
      ?auto_1122718 - SURFACE
      ?auto_1122715 - SURFACE
      ?auto_1122719 - SURFACE
      ?auto_1122721 - SURFACE
      ?auto_1122720 - SURFACE
      ?auto_1122722 - SURFACE
      ?auto_1122723 - SURFACE
      ?auto_1122724 - SURFACE
    )
    :vars
    (
      ?auto_1122725 - HOIST
      ?auto_1122726 - PLACE
      ?auto_1122729 - TRUCK
      ?auto_1122727 - PLACE
      ?auto_1122728 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1122725 ?auto_1122726 ) ( SURFACE-AT ?auto_1122723 ?auto_1122726 ) ( CLEAR ?auto_1122723 ) ( IS-CRATE ?auto_1122724 ) ( not ( = ?auto_1122723 ?auto_1122724 ) ) ( AVAILABLE ?auto_1122725 ) ( ON ?auto_1122723 ?auto_1122722 ) ( not ( = ?auto_1122722 ?auto_1122723 ) ) ( not ( = ?auto_1122722 ?auto_1122724 ) ) ( TRUCK-AT ?auto_1122729 ?auto_1122727 ) ( not ( = ?auto_1122727 ?auto_1122726 ) ) ( HOIST-AT ?auto_1122728 ?auto_1122727 ) ( LIFTING ?auto_1122728 ?auto_1122724 ) ( not ( = ?auto_1122725 ?auto_1122728 ) ) ( ON ?auto_1122717 ?auto_1122716 ) ( ON ?auto_1122718 ?auto_1122717 ) ( ON ?auto_1122715 ?auto_1122718 ) ( ON ?auto_1122719 ?auto_1122715 ) ( ON ?auto_1122721 ?auto_1122719 ) ( ON ?auto_1122720 ?auto_1122721 ) ( ON ?auto_1122722 ?auto_1122720 ) ( not ( = ?auto_1122716 ?auto_1122717 ) ) ( not ( = ?auto_1122716 ?auto_1122718 ) ) ( not ( = ?auto_1122716 ?auto_1122715 ) ) ( not ( = ?auto_1122716 ?auto_1122719 ) ) ( not ( = ?auto_1122716 ?auto_1122721 ) ) ( not ( = ?auto_1122716 ?auto_1122720 ) ) ( not ( = ?auto_1122716 ?auto_1122722 ) ) ( not ( = ?auto_1122716 ?auto_1122723 ) ) ( not ( = ?auto_1122716 ?auto_1122724 ) ) ( not ( = ?auto_1122717 ?auto_1122718 ) ) ( not ( = ?auto_1122717 ?auto_1122715 ) ) ( not ( = ?auto_1122717 ?auto_1122719 ) ) ( not ( = ?auto_1122717 ?auto_1122721 ) ) ( not ( = ?auto_1122717 ?auto_1122720 ) ) ( not ( = ?auto_1122717 ?auto_1122722 ) ) ( not ( = ?auto_1122717 ?auto_1122723 ) ) ( not ( = ?auto_1122717 ?auto_1122724 ) ) ( not ( = ?auto_1122718 ?auto_1122715 ) ) ( not ( = ?auto_1122718 ?auto_1122719 ) ) ( not ( = ?auto_1122718 ?auto_1122721 ) ) ( not ( = ?auto_1122718 ?auto_1122720 ) ) ( not ( = ?auto_1122718 ?auto_1122722 ) ) ( not ( = ?auto_1122718 ?auto_1122723 ) ) ( not ( = ?auto_1122718 ?auto_1122724 ) ) ( not ( = ?auto_1122715 ?auto_1122719 ) ) ( not ( = ?auto_1122715 ?auto_1122721 ) ) ( not ( = ?auto_1122715 ?auto_1122720 ) ) ( not ( = ?auto_1122715 ?auto_1122722 ) ) ( not ( = ?auto_1122715 ?auto_1122723 ) ) ( not ( = ?auto_1122715 ?auto_1122724 ) ) ( not ( = ?auto_1122719 ?auto_1122721 ) ) ( not ( = ?auto_1122719 ?auto_1122720 ) ) ( not ( = ?auto_1122719 ?auto_1122722 ) ) ( not ( = ?auto_1122719 ?auto_1122723 ) ) ( not ( = ?auto_1122719 ?auto_1122724 ) ) ( not ( = ?auto_1122721 ?auto_1122720 ) ) ( not ( = ?auto_1122721 ?auto_1122722 ) ) ( not ( = ?auto_1122721 ?auto_1122723 ) ) ( not ( = ?auto_1122721 ?auto_1122724 ) ) ( not ( = ?auto_1122720 ?auto_1122722 ) ) ( not ( = ?auto_1122720 ?auto_1122723 ) ) ( not ( = ?auto_1122720 ?auto_1122724 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1122722 ?auto_1122723 ?auto_1122724 )
      ( MAKE-9CRATE-VERIFY ?auto_1122716 ?auto_1122717 ?auto_1122718 ?auto_1122715 ?auto_1122719 ?auto_1122721 ?auto_1122720 ?auto_1122722 ?auto_1122723 ?auto_1122724 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1122824 - SURFACE
      ?auto_1122825 - SURFACE
      ?auto_1122826 - SURFACE
      ?auto_1122823 - SURFACE
      ?auto_1122827 - SURFACE
      ?auto_1122829 - SURFACE
      ?auto_1122828 - SURFACE
      ?auto_1122830 - SURFACE
      ?auto_1122831 - SURFACE
      ?auto_1122832 - SURFACE
    )
    :vars
    (
      ?auto_1122838 - HOIST
      ?auto_1122836 - PLACE
      ?auto_1122833 - TRUCK
      ?auto_1122834 - PLACE
      ?auto_1122837 - HOIST
      ?auto_1122835 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1122838 ?auto_1122836 ) ( SURFACE-AT ?auto_1122831 ?auto_1122836 ) ( CLEAR ?auto_1122831 ) ( IS-CRATE ?auto_1122832 ) ( not ( = ?auto_1122831 ?auto_1122832 ) ) ( AVAILABLE ?auto_1122838 ) ( ON ?auto_1122831 ?auto_1122830 ) ( not ( = ?auto_1122830 ?auto_1122831 ) ) ( not ( = ?auto_1122830 ?auto_1122832 ) ) ( TRUCK-AT ?auto_1122833 ?auto_1122834 ) ( not ( = ?auto_1122834 ?auto_1122836 ) ) ( HOIST-AT ?auto_1122837 ?auto_1122834 ) ( not ( = ?auto_1122838 ?auto_1122837 ) ) ( AVAILABLE ?auto_1122837 ) ( SURFACE-AT ?auto_1122832 ?auto_1122834 ) ( ON ?auto_1122832 ?auto_1122835 ) ( CLEAR ?auto_1122832 ) ( not ( = ?auto_1122831 ?auto_1122835 ) ) ( not ( = ?auto_1122832 ?auto_1122835 ) ) ( not ( = ?auto_1122830 ?auto_1122835 ) ) ( ON ?auto_1122825 ?auto_1122824 ) ( ON ?auto_1122826 ?auto_1122825 ) ( ON ?auto_1122823 ?auto_1122826 ) ( ON ?auto_1122827 ?auto_1122823 ) ( ON ?auto_1122829 ?auto_1122827 ) ( ON ?auto_1122828 ?auto_1122829 ) ( ON ?auto_1122830 ?auto_1122828 ) ( not ( = ?auto_1122824 ?auto_1122825 ) ) ( not ( = ?auto_1122824 ?auto_1122826 ) ) ( not ( = ?auto_1122824 ?auto_1122823 ) ) ( not ( = ?auto_1122824 ?auto_1122827 ) ) ( not ( = ?auto_1122824 ?auto_1122829 ) ) ( not ( = ?auto_1122824 ?auto_1122828 ) ) ( not ( = ?auto_1122824 ?auto_1122830 ) ) ( not ( = ?auto_1122824 ?auto_1122831 ) ) ( not ( = ?auto_1122824 ?auto_1122832 ) ) ( not ( = ?auto_1122824 ?auto_1122835 ) ) ( not ( = ?auto_1122825 ?auto_1122826 ) ) ( not ( = ?auto_1122825 ?auto_1122823 ) ) ( not ( = ?auto_1122825 ?auto_1122827 ) ) ( not ( = ?auto_1122825 ?auto_1122829 ) ) ( not ( = ?auto_1122825 ?auto_1122828 ) ) ( not ( = ?auto_1122825 ?auto_1122830 ) ) ( not ( = ?auto_1122825 ?auto_1122831 ) ) ( not ( = ?auto_1122825 ?auto_1122832 ) ) ( not ( = ?auto_1122825 ?auto_1122835 ) ) ( not ( = ?auto_1122826 ?auto_1122823 ) ) ( not ( = ?auto_1122826 ?auto_1122827 ) ) ( not ( = ?auto_1122826 ?auto_1122829 ) ) ( not ( = ?auto_1122826 ?auto_1122828 ) ) ( not ( = ?auto_1122826 ?auto_1122830 ) ) ( not ( = ?auto_1122826 ?auto_1122831 ) ) ( not ( = ?auto_1122826 ?auto_1122832 ) ) ( not ( = ?auto_1122826 ?auto_1122835 ) ) ( not ( = ?auto_1122823 ?auto_1122827 ) ) ( not ( = ?auto_1122823 ?auto_1122829 ) ) ( not ( = ?auto_1122823 ?auto_1122828 ) ) ( not ( = ?auto_1122823 ?auto_1122830 ) ) ( not ( = ?auto_1122823 ?auto_1122831 ) ) ( not ( = ?auto_1122823 ?auto_1122832 ) ) ( not ( = ?auto_1122823 ?auto_1122835 ) ) ( not ( = ?auto_1122827 ?auto_1122829 ) ) ( not ( = ?auto_1122827 ?auto_1122828 ) ) ( not ( = ?auto_1122827 ?auto_1122830 ) ) ( not ( = ?auto_1122827 ?auto_1122831 ) ) ( not ( = ?auto_1122827 ?auto_1122832 ) ) ( not ( = ?auto_1122827 ?auto_1122835 ) ) ( not ( = ?auto_1122829 ?auto_1122828 ) ) ( not ( = ?auto_1122829 ?auto_1122830 ) ) ( not ( = ?auto_1122829 ?auto_1122831 ) ) ( not ( = ?auto_1122829 ?auto_1122832 ) ) ( not ( = ?auto_1122829 ?auto_1122835 ) ) ( not ( = ?auto_1122828 ?auto_1122830 ) ) ( not ( = ?auto_1122828 ?auto_1122831 ) ) ( not ( = ?auto_1122828 ?auto_1122832 ) ) ( not ( = ?auto_1122828 ?auto_1122835 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1122830 ?auto_1122831 ?auto_1122832 )
      ( MAKE-9CRATE-VERIFY ?auto_1122824 ?auto_1122825 ?auto_1122826 ?auto_1122823 ?auto_1122827 ?auto_1122829 ?auto_1122828 ?auto_1122830 ?auto_1122831 ?auto_1122832 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1122933 - SURFACE
      ?auto_1122934 - SURFACE
      ?auto_1122935 - SURFACE
      ?auto_1122932 - SURFACE
      ?auto_1122936 - SURFACE
      ?auto_1122938 - SURFACE
      ?auto_1122937 - SURFACE
      ?auto_1122939 - SURFACE
      ?auto_1122940 - SURFACE
      ?auto_1122941 - SURFACE
    )
    :vars
    (
      ?auto_1122946 - HOIST
      ?auto_1122947 - PLACE
      ?auto_1122945 - PLACE
      ?auto_1122943 - HOIST
      ?auto_1122942 - SURFACE
      ?auto_1122944 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1122946 ?auto_1122947 ) ( SURFACE-AT ?auto_1122940 ?auto_1122947 ) ( CLEAR ?auto_1122940 ) ( IS-CRATE ?auto_1122941 ) ( not ( = ?auto_1122940 ?auto_1122941 ) ) ( AVAILABLE ?auto_1122946 ) ( ON ?auto_1122940 ?auto_1122939 ) ( not ( = ?auto_1122939 ?auto_1122940 ) ) ( not ( = ?auto_1122939 ?auto_1122941 ) ) ( not ( = ?auto_1122945 ?auto_1122947 ) ) ( HOIST-AT ?auto_1122943 ?auto_1122945 ) ( not ( = ?auto_1122946 ?auto_1122943 ) ) ( AVAILABLE ?auto_1122943 ) ( SURFACE-AT ?auto_1122941 ?auto_1122945 ) ( ON ?auto_1122941 ?auto_1122942 ) ( CLEAR ?auto_1122941 ) ( not ( = ?auto_1122940 ?auto_1122942 ) ) ( not ( = ?auto_1122941 ?auto_1122942 ) ) ( not ( = ?auto_1122939 ?auto_1122942 ) ) ( TRUCK-AT ?auto_1122944 ?auto_1122947 ) ( ON ?auto_1122934 ?auto_1122933 ) ( ON ?auto_1122935 ?auto_1122934 ) ( ON ?auto_1122932 ?auto_1122935 ) ( ON ?auto_1122936 ?auto_1122932 ) ( ON ?auto_1122938 ?auto_1122936 ) ( ON ?auto_1122937 ?auto_1122938 ) ( ON ?auto_1122939 ?auto_1122937 ) ( not ( = ?auto_1122933 ?auto_1122934 ) ) ( not ( = ?auto_1122933 ?auto_1122935 ) ) ( not ( = ?auto_1122933 ?auto_1122932 ) ) ( not ( = ?auto_1122933 ?auto_1122936 ) ) ( not ( = ?auto_1122933 ?auto_1122938 ) ) ( not ( = ?auto_1122933 ?auto_1122937 ) ) ( not ( = ?auto_1122933 ?auto_1122939 ) ) ( not ( = ?auto_1122933 ?auto_1122940 ) ) ( not ( = ?auto_1122933 ?auto_1122941 ) ) ( not ( = ?auto_1122933 ?auto_1122942 ) ) ( not ( = ?auto_1122934 ?auto_1122935 ) ) ( not ( = ?auto_1122934 ?auto_1122932 ) ) ( not ( = ?auto_1122934 ?auto_1122936 ) ) ( not ( = ?auto_1122934 ?auto_1122938 ) ) ( not ( = ?auto_1122934 ?auto_1122937 ) ) ( not ( = ?auto_1122934 ?auto_1122939 ) ) ( not ( = ?auto_1122934 ?auto_1122940 ) ) ( not ( = ?auto_1122934 ?auto_1122941 ) ) ( not ( = ?auto_1122934 ?auto_1122942 ) ) ( not ( = ?auto_1122935 ?auto_1122932 ) ) ( not ( = ?auto_1122935 ?auto_1122936 ) ) ( not ( = ?auto_1122935 ?auto_1122938 ) ) ( not ( = ?auto_1122935 ?auto_1122937 ) ) ( not ( = ?auto_1122935 ?auto_1122939 ) ) ( not ( = ?auto_1122935 ?auto_1122940 ) ) ( not ( = ?auto_1122935 ?auto_1122941 ) ) ( not ( = ?auto_1122935 ?auto_1122942 ) ) ( not ( = ?auto_1122932 ?auto_1122936 ) ) ( not ( = ?auto_1122932 ?auto_1122938 ) ) ( not ( = ?auto_1122932 ?auto_1122937 ) ) ( not ( = ?auto_1122932 ?auto_1122939 ) ) ( not ( = ?auto_1122932 ?auto_1122940 ) ) ( not ( = ?auto_1122932 ?auto_1122941 ) ) ( not ( = ?auto_1122932 ?auto_1122942 ) ) ( not ( = ?auto_1122936 ?auto_1122938 ) ) ( not ( = ?auto_1122936 ?auto_1122937 ) ) ( not ( = ?auto_1122936 ?auto_1122939 ) ) ( not ( = ?auto_1122936 ?auto_1122940 ) ) ( not ( = ?auto_1122936 ?auto_1122941 ) ) ( not ( = ?auto_1122936 ?auto_1122942 ) ) ( not ( = ?auto_1122938 ?auto_1122937 ) ) ( not ( = ?auto_1122938 ?auto_1122939 ) ) ( not ( = ?auto_1122938 ?auto_1122940 ) ) ( not ( = ?auto_1122938 ?auto_1122941 ) ) ( not ( = ?auto_1122938 ?auto_1122942 ) ) ( not ( = ?auto_1122937 ?auto_1122939 ) ) ( not ( = ?auto_1122937 ?auto_1122940 ) ) ( not ( = ?auto_1122937 ?auto_1122941 ) ) ( not ( = ?auto_1122937 ?auto_1122942 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1122939 ?auto_1122940 ?auto_1122941 )
      ( MAKE-9CRATE-VERIFY ?auto_1122933 ?auto_1122934 ?auto_1122935 ?auto_1122932 ?auto_1122936 ?auto_1122938 ?auto_1122937 ?auto_1122939 ?auto_1122940 ?auto_1122941 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1123042 - SURFACE
      ?auto_1123043 - SURFACE
      ?auto_1123044 - SURFACE
      ?auto_1123041 - SURFACE
      ?auto_1123045 - SURFACE
      ?auto_1123047 - SURFACE
      ?auto_1123046 - SURFACE
      ?auto_1123048 - SURFACE
      ?auto_1123049 - SURFACE
      ?auto_1123050 - SURFACE
    )
    :vars
    (
      ?auto_1123055 - HOIST
      ?auto_1123056 - PLACE
      ?auto_1123052 - PLACE
      ?auto_1123054 - HOIST
      ?auto_1123051 - SURFACE
      ?auto_1123053 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1123055 ?auto_1123056 ) ( IS-CRATE ?auto_1123050 ) ( not ( = ?auto_1123049 ?auto_1123050 ) ) ( not ( = ?auto_1123048 ?auto_1123049 ) ) ( not ( = ?auto_1123048 ?auto_1123050 ) ) ( not ( = ?auto_1123052 ?auto_1123056 ) ) ( HOIST-AT ?auto_1123054 ?auto_1123052 ) ( not ( = ?auto_1123055 ?auto_1123054 ) ) ( AVAILABLE ?auto_1123054 ) ( SURFACE-AT ?auto_1123050 ?auto_1123052 ) ( ON ?auto_1123050 ?auto_1123051 ) ( CLEAR ?auto_1123050 ) ( not ( = ?auto_1123049 ?auto_1123051 ) ) ( not ( = ?auto_1123050 ?auto_1123051 ) ) ( not ( = ?auto_1123048 ?auto_1123051 ) ) ( TRUCK-AT ?auto_1123053 ?auto_1123056 ) ( SURFACE-AT ?auto_1123048 ?auto_1123056 ) ( CLEAR ?auto_1123048 ) ( LIFTING ?auto_1123055 ?auto_1123049 ) ( IS-CRATE ?auto_1123049 ) ( ON ?auto_1123043 ?auto_1123042 ) ( ON ?auto_1123044 ?auto_1123043 ) ( ON ?auto_1123041 ?auto_1123044 ) ( ON ?auto_1123045 ?auto_1123041 ) ( ON ?auto_1123047 ?auto_1123045 ) ( ON ?auto_1123046 ?auto_1123047 ) ( ON ?auto_1123048 ?auto_1123046 ) ( not ( = ?auto_1123042 ?auto_1123043 ) ) ( not ( = ?auto_1123042 ?auto_1123044 ) ) ( not ( = ?auto_1123042 ?auto_1123041 ) ) ( not ( = ?auto_1123042 ?auto_1123045 ) ) ( not ( = ?auto_1123042 ?auto_1123047 ) ) ( not ( = ?auto_1123042 ?auto_1123046 ) ) ( not ( = ?auto_1123042 ?auto_1123048 ) ) ( not ( = ?auto_1123042 ?auto_1123049 ) ) ( not ( = ?auto_1123042 ?auto_1123050 ) ) ( not ( = ?auto_1123042 ?auto_1123051 ) ) ( not ( = ?auto_1123043 ?auto_1123044 ) ) ( not ( = ?auto_1123043 ?auto_1123041 ) ) ( not ( = ?auto_1123043 ?auto_1123045 ) ) ( not ( = ?auto_1123043 ?auto_1123047 ) ) ( not ( = ?auto_1123043 ?auto_1123046 ) ) ( not ( = ?auto_1123043 ?auto_1123048 ) ) ( not ( = ?auto_1123043 ?auto_1123049 ) ) ( not ( = ?auto_1123043 ?auto_1123050 ) ) ( not ( = ?auto_1123043 ?auto_1123051 ) ) ( not ( = ?auto_1123044 ?auto_1123041 ) ) ( not ( = ?auto_1123044 ?auto_1123045 ) ) ( not ( = ?auto_1123044 ?auto_1123047 ) ) ( not ( = ?auto_1123044 ?auto_1123046 ) ) ( not ( = ?auto_1123044 ?auto_1123048 ) ) ( not ( = ?auto_1123044 ?auto_1123049 ) ) ( not ( = ?auto_1123044 ?auto_1123050 ) ) ( not ( = ?auto_1123044 ?auto_1123051 ) ) ( not ( = ?auto_1123041 ?auto_1123045 ) ) ( not ( = ?auto_1123041 ?auto_1123047 ) ) ( not ( = ?auto_1123041 ?auto_1123046 ) ) ( not ( = ?auto_1123041 ?auto_1123048 ) ) ( not ( = ?auto_1123041 ?auto_1123049 ) ) ( not ( = ?auto_1123041 ?auto_1123050 ) ) ( not ( = ?auto_1123041 ?auto_1123051 ) ) ( not ( = ?auto_1123045 ?auto_1123047 ) ) ( not ( = ?auto_1123045 ?auto_1123046 ) ) ( not ( = ?auto_1123045 ?auto_1123048 ) ) ( not ( = ?auto_1123045 ?auto_1123049 ) ) ( not ( = ?auto_1123045 ?auto_1123050 ) ) ( not ( = ?auto_1123045 ?auto_1123051 ) ) ( not ( = ?auto_1123047 ?auto_1123046 ) ) ( not ( = ?auto_1123047 ?auto_1123048 ) ) ( not ( = ?auto_1123047 ?auto_1123049 ) ) ( not ( = ?auto_1123047 ?auto_1123050 ) ) ( not ( = ?auto_1123047 ?auto_1123051 ) ) ( not ( = ?auto_1123046 ?auto_1123048 ) ) ( not ( = ?auto_1123046 ?auto_1123049 ) ) ( not ( = ?auto_1123046 ?auto_1123050 ) ) ( not ( = ?auto_1123046 ?auto_1123051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1123048 ?auto_1123049 ?auto_1123050 )
      ( MAKE-9CRATE-VERIFY ?auto_1123042 ?auto_1123043 ?auto_1123044 ?auto_1123041 ?auto_1123045 ?auto_1123047 ?auto_1123046 ?auto_1123048 ?auto_1123049 ?auto_1123050 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1123151 - SURFACE
      ?auto_1123152 - SURFACE
      ?auto_1123153 - SURFACE
      ?auto_1123150 - SURFACE
      ?auto_1123154 - SURFACE
      ?auto_1123156 - SURFACE
      ?auto_1123155 - SURFACE
      ?auto_1123157 - SURFACE
      ?auto_1123158 - SURFACE
      ?auto_1123159 - SURFACE
    )
    :vars
    (
      ?auto_1123160 - HOIST
      ?auto_1123164 - PLACE
      ?auto_1123162 - PLACE
      ?auto_1123161 - HOIST
      ?auto_1123163 - SURFACE
      ?auto_1123165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1123160 ?auto_1123164 ) ( IS-CRATE ?auto_1123159 ) ( not ( = ?auto_1123158 ?auto_1123159 ) ) ( not ( = ?auto_1123157 ?auto_1123158 ) ) ( not ( = ?auto_1123157 ?auto_1123159 ) ) ( not ( = ?auto_1123162 ?auto_1123164 ) ) ( HOIST-AT ?auto_1123161 ?auto_1123162 ) ( not ( = ?auto_1123160 ?auto_1123161 ) ) ( AVAILABLE ?auto_1123161 ) ( SURFACE-AT ?auto_1123159 ?auto_1123162 ) ( ON ?auto_1123159 ?auto_1123163 ) ( CLEAR ?auto_1123159 ) ( not ( = ?auto_1123158 ?auto_1123163 ) ) ( not ( = ?auto_1123159 ?auto_1123163 ) ) ( not ( = ?auto_1123157 ?auto_1123163 ) ) ( TRUCK-AT ?auto_1123165 ?auto_1123164 ) ( SURFACE-AT ?auto_1123157 ?auto_1123164 ) ( CLEAR ?auto_1123157 ) ( IS-CRATE ?auto_1123158 ) ( AVAILABLE ?auto_1123160 ) ( IN ?auto_1123158 ?auto_1123165 ) ( ON ?auto_1123152 ?auto_1123151 ) ( ON ?auto_1123153 ?auto_1123152 ) ( ON ?auto_1123150 ?auto_1123153 ) ( ON ?auto_1123154 ?auto_1123150 ) ( ON ?auto_1123156 ?auto_1123154 ) ( ON ?auto_1123155 ?auto_1123156 ) ( ON ?auto_1123157 ?auto_1123155 ) ( not ( = ?auto_1123151 ?auto_1123152 ) ) ( not ( = ?auto_1123151 ?auto_1123153 ) ) ( not ( = ?auto_1123151 ?auto_1123150 ) ) ( not ( = ?auto_1123151 ?auto_1123154 ) ) ( not ( = ?auto_1123151 ?auto_1123156 ) ) ( not ( = ?auto_1123151 ?auto_1123155 ) ) ( not ( = ?auto_1123151 ?auto_1123157 ) ) ( not ( = ?auto_1123151 ?auto_1123158 ) ) ( not ( = ?auto_1123151 ?auto_1123159 ) ) ( not ( = ?auto_1123151 ?auto_1123163 ) ) ( not ( = ?auto_1123152 ?auto_1123153 ) ) ( not ( = ?auto_1123152 ?auto_1123150 ) ) ( not ( = ?auto_1123152 ?auto_1123154 ) ) ( not ( = ?auto_1123152 ?auto_1123156 ) ) ( not ( = ?auto_1123152 ?auto_1123155 ) ) ( not ( = ?auto_1123152 ?auto_1123157 ) ) ( not ( = ?auto_1123152 ?auto_1123158 ) ) ( not ( = ?auto_1123152 ?auto_1123159 ) ) ( not ( = ?auto_1123152 ?auto_1123163 ) ) ( not ( = ?auto_1123153 ?auto_1123150 ) ) ( not ( = ?auto_1123153 ?auto_1123154 ) ) ( not ( = ?auto_1123153 ?auto_1123156 ) ) ( not ( = ?auto_1123153 ?auto_1123155 ) ) ( not ( = ?auto_1123153 ?auto_1123157 ) ) ( not ( = ?auto_1123153 ?auto_1123158 ) ) ( not ( = ?auto_1123153 ?auto_1123159 ) ) ( not ( = ?auto_1123153 ?auto_1123163 ) ) ( not ( = ?auto_1123150 ?auto_1123154 ) ) ( not ( = ?auto_1123150 ?auto_1123156 ) ) ( not ( = ?auto_1123150 ?auto_1123155 ) ) ( not ( = ?auto_1123150 ?auto_1123157 ) ) ( not ( = ?auto_1123150 ?auto_1123158 ) ) ( not ( = ?auto_1123150 ?auto_1123159 ) ) ( not ( = ?auto_1123150 ?auto_1123163 ) ) ( not ( = ?auto_1123154 ?auto_1123156 ) ) ( not ( = ?auto_1123154 ?auto_1123155 ) ) ( not ( = ?auto_1123154 ?auto_1123157 ) ) ( not ( = ?auto_1123154 ?auto_1123158 ) ) ( not ( = ?auto_1123154 ?auto_1123159 ) ) ( not ( = ?auto_1123154 ?auto_1123163 ) ) ( not ( = ?auto_1123156 ?auto_1123155 ) ) ( not ( = ?auto_1123156 ?auto_1123157 ) ) ( not ( = ?auto_1123156 ?auto_1123158 ) ) ( not ( = ?auto_1123156 ?auto_1123159 ) ) ( not ( = ?auto_1123156 ?auto_1123163 ) ) ( not ( = ?auto_1123155 ?auto_1123157 ) ) ( not ( = ?auto_1123155 ?auto_1123158 ) ) ( not ( = ?auto_1123155 ?auto_1123159 ) ) ( not ( = ?auto_1123155 ?auto_1123163 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1123157 ?auto_1123158 ?auto_1123159 )
      ( MAKE-9CRATE-VERIFY ?auto_1123151 ?auto_1123152 ?auto_1123153 ?auto_1123150 ?auto_1123154 ?auto_1123156 ?auto_1123155 ?auto_1123157 ?auto_1123158 ?auto_1123159 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1123260 - SURFACE
      ?auto_1123261 - SURFACE
      ?auto_1123262 - SURFACE
      ?auto_1123259 - SURFACE
      ?auto_1123263 - SURFACE
      ?auto_1123265 - SURFACE
      ?auto_1123264 - SURFACE
      ?auto_1123266 - SURFACE
      ?auto_1123267 - SURFACE
      ?auto_1123268 - SURFACE
    )
    :vars
    (
      ?auto_1123273 - HOIST
      ?auto_1123272 - PLACE
      ?auto_1123274 - PLACE
      ?auto_1123270 - HOIST
      ?auto_1123269 - SURFACE
      ?auto_1123271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1123273 ?auto_1123272 ) ( IS-CRATE ?auto_1123268 ) ( not ( = ?auto_1123267 ?auto_1123268 ) ) ( not ( = ?auto_1123266 ?auto_1123267 ) ) ( not ( = ?auto_1123266 ?auto_1123268 ) ) ( not ( = ?auto_1123274 ?auto_1123272 ) ) ( HOIST-AT ?auto_1123270 ?auto_1123274 ) ( not ( = ?auto_1123273 ?auto_1123270 ) ) ( AVAILABLE ?auto_1123270 ) ( SURFACE-AT ?auto_1123268 ?auto_1123274 ) ( ON ?auto_1123268 ?auto_1123269 ) ( CLEAR ?auto_1123268 ) ( not ( = ?auto_1123267 ?auto_1123269 ) ) ( not ( = ?auto_1123268 ?auto_1123269 ) ) ( not ( = ?auto_1123266 ?auto_1123269 ) ) ( SURFACE-AT ?auto_1123266 ?auto_1123272 ) ( CLEAR ?auto_1123266 ) ( IS-CRATE ?auto_1123267 ) ( AVAILABLE ?auto_1123273 ) ( IN ?auto_1123267 ?auto_1123271 ) ( TRUCK-AT ?auto_1123271 ?auto_1123274 ) ( ON ?auto_1123261 ?auto_1123260 ) ( ON ?auto_1123262 ?auto_1123261 ) ( ON ?auto_1123259 ?auto_1123262 ) ( ON ?auto_1123263 ?auto_1123259 ) ( ON ?auto_1123265 ?auto_1123263 ) ( ON ?auto_1123264 ?auto_1123265 ) ( ON ?auto_1123266 ?auto_1123264 ) ( not ( = ?auto_1123260 ?auto_1123261 ) ) ( not ( = ?auto_1123260 ?auto_1123262 ) ) ( not ( = ?auto_1123260 ?auto_1123259 ) ) ( not ( = ?auto_1123260 ?auto_1123263 ) ) ( not ( = ?auto_1123260 ?auto_1123265 ) ) ( not ( = ?auto_1123260 ?auto_1123264 ) ) ( not ( = ?auto_1123260 ?auto_1123266 ) ) ( not ( = ?auto_1123260 ?auto_1123267 ) ) ( not ( = ?auto_1123260 ?auto_1123268 ) ) ( not ( = ?auto_1123260 ?auto_1123269 ) ) ( not ( = ?auto_1123261 ?auto_1123262 ) ) ( not ( = ?auto_1123261 ?auto_1123259 ) ) ( not ( = ?auto_1123261 ?auto_1123263 ) ) ( not ( = ?auto_1123261 ?auto_1123265 ) ) ( not ( = ?auto_1123261 ?auto_1123264 ) ) ( not ( = ?auto_1123261 ?auto_1123266 ) ) ( not ( = ?auto_1123261 ?auto_1123267 ) ) ( not ( = ?auto_1123261 ?auto_1123268 ) ) ( not ( = ?auto_1123261 ?auto_1123269 ) ) ( not ( = ?auto_1123262 ?auto_1123259 ) ) ( not ( = ?auto_1123262 ?auto_1123263 ) ) ( not ( = ?auto_1123262 ?auto_1123265 ) ) ( not ( = ?auto_1123262 ?auto_1123264 ) ) ( not ( = ?auto_1123262 ?auto_1123266 ) ) ( not ( = ?auto_1123262 ?auto_1123267 ) ) ( not ( = ?auto_1123262 ?auto_1123268 ) ) ( not ( = ?auto_1123262 ?auto_1123269 ) ) ( not ( = ?auto_1123259 ?auto_1123263 ) ) ( not ( = ?auto_1123259 ?auto_1123265 ) ) ( not ( = ?auto_1123259 ?auto_1123264 ) ) ( not ( = ?auto_1123259 ?auto_1123266 ) ) ( not ( = ?auto_1123259 ?auto_1123267 ) ) ( not ( = ?auto_1123259 ?auto_1123268 ) ) ( not ( = ?auto_1123259 ?auto_1123269 ) ) ( not ( = ?auto_1123263 ?auto_1123265 ) ) ( not ( = ?auto_1123263 ?auto_1123264 ) ) ( not ( = ?auto_1123263 ?auto_1123266 ) ) ( not ( = ?auto_1123263 ?auto_1123267 ) ) ( not ( = ?auto_1123263 ?auto_1123268 ) ) ( not ( = ?auto_1123263 ?auto_1123269 ) ) ( not ( = ?auto_1123265 ?auto_1123264 ) ) ( not ( = ?auto_1123265 ?auto_1123266 ) ) ( not ( = ?auto_1123265 ?auto_1123267 ) ) ( not ( = ?auto_1123265 ?auto_1123268 ) ) ( not ( = ?auto_1123265 ?auto_1123269 ) ) ( not ( = ?auto_1123264 ?auto_1123266 ) ) ( not ( = ?auto_1123264 ?auto_1123267 ) ) ( not ( = ?auto_1123264 ?auto_1123268 ) ) ( not ( = ?auto_1123264 ?auto_1123269 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1123266 ?auto_1123267 ?auto_1123268 )
      ( MAKE-9CRATE-VERIFY ?auto_1123260 ?auto_1123261 ?auto_1123262 ?auto_1123259 ?auto_1123263 ?auto_1123265 ?auto_1123264 ?auto_1123266 ?auto_1123267 ?auto_1123268 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1123369 - SURFACE
      ?auto_1123370 - SURFACE
      ?auto_1123371 - SURFACE
      ?auto_1123368 - SURFACE
      ?auto_1123372 - SURFACE
      ?auto_1123374 - SURFACE
      ?auto_1123373 - SURFACE
      ?auto_1123375 - SURFACE
      ?auto_1123376 - SURFACE
      ?auto_1123377 - SURFACE
    )
    :vars
    (
      ?auto_1123380 - HOIST
      ?auto_1123381 - PLACE
      ?auto_1123382 - PLACE
      ?auto_1123383 - HOIST
      ?auto_1123378 - SURFACE
      ?auto_1123379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1123380 ?auto_1123381 ) ( IS-CRATE ?auto_1123377 ) ( not ( = ?auto_1123376 ?auto_1123377 ) ) ( not ( = ?auto_1123375 ?auto_1123376 ) ) ( not ( = ?auto_1123375 ?auto_1123377 ) ) ( not ( = ?auto_1123382 ?auto_1123381 ) ) ( HOIST-AT ?auto_1123383 ?auto_1123382 ) ( not ( = ?auto_1123380 ?auto_1123383 ) ) ( SURFACE-AT ?auto_1123377 ?auto_1123382 ) ( ON ?auto_1123377 ?auto_1123378 ) ( CLEAR ?auto_1123377 ) ( not ( = ?auto_1123376 ?auto_1123378 ) ) ( not ( = ?auto_1123377 ?auto_1123378 ) ) ( not ( = ?auto_1123375 ?auto_1123378 ) ) ( SURFACE-AT ?auto_1123375 ?auto_1123381 ) ( CLEAR ?auto_1123375 ) ( IS-CRATE ?auto_1123376 ) ( AVAILABLE ?auto_1123380 ) ( TRUCK-AT ?auto_1123379 ?auto_1123382 ) ( LIFTING ?auto_1123383 ?auto_1123376 ) ( ON ?auto_1123370 ?auto_1123369 ) ( ON ?auto_1123371 ?auto_1123370 ) ( ON ?auto_1123368 ?auto_1123371 ) ( ON ?auto_1123372 ?auto_1123368 ) ( ON ?auto_1123374 ?auto_1123372 ) ( ON ?auto_1123373 ?auto_1123374 ) ( ON ?auto_1123375 ?auto_1123373 ) ( not ( = ?auto_1123369 ?auto_1123370 ) ) ( not ( = ?auto_1123369 ?auto_1123371 ) ) ( not ( = ?auto_1123369 ?auto_1123368 ) ) ( not ( = ?auto_1123369 ?auto_1123372 ) ) ( not ( = ?auto_1123369 ?auto_1123374 ) ) ( not ( = ?auto_1123369 ?auto_1123373 ) ) ( not ( = ?auto_1123369 ?auto_1123375 ) ) ( not ( = ?auto_1123369 ?auto_1123376 ) ) ( not ( = ?auto_1123369 ?auto_1123377 ) ) ( not ( = ?auto_1123369 ?auto_1123378 ) ) ( not ( = ?auto_1123370 ?auto_1123371 ) ) ( not ( = ?auto_1123370 ?auto_1123368 ) ) ( not ( = ?auto_1123370 ?auto_1123372 ) ) ( not ( = ?auto_1123370 ?auto_1123374 ) ) ( not ( = ?auto_1123370 ?auto_1123373 ) ) ( not ( = ?auto_1123370 ?auto_1123375 ) ) ( not ( = ?auto_1123370 ?auto_1123376 ) ) ( not ( = ?auto_1123370 ?auto_1123377 ) ) ( not ( = ?auto_1123370 ?auto_1123378 ) ) ( not ( = ?auto_1123371 ?auto_1123368 ) ) ( not ( = ?auto_1123371 ?auto_1123372 ) ) ( not ( = ?auto_1123371 ?auto_1123374 ) ) ( not ( = ?auto_1123371 ?auto_1123373 ) ) ( not ( = ?auto_1123371 ?auto_1123375 ) ) ( not ( = ?auto_1123371 ?auto_1123376 ) ) ( not ( = ?auto_1123371 ?auto_1123377 ) ) ( not ( = ?auto_1123371 ?auto_1123378 ) ) ( not ( = ?auto_1123368 ?auto_1123372 ) ) ( not ( = ?auto_1123368 ?auto_1123374 ) ) ( not ( = ?auto_1123368 ?auto_1123373 ) ) ( not ( = ?auto_1123368 ?auto_1123375 ) ) ( not ( = ?auto_1123368 ?auto_1123376 ) ) ( not ( = ?auto_1123368 ?auto_1123377 ) ) ( not ( = ?auto_1123368 ?auto_1123378 ) ) ( not ( = ?auto_1123372 ?auto_1123374 ) ) ( not ( = ?auto_1123372 ?auto_1123373 ) ) ( not ( = ?auto_1123372 ?auto_1123375 ) ) ( not ( = ?auto_1123372 ?auto_1123376 ) ) ( not ( = ?auto_1123372 ?auto_1123377 ) ) ( not ( = ?auto_1123372 ?auto_1123378 ) ) ( not ( = ?auto_1123374 ?auto_1123373 ) ) ( not ( = ?auto_1123374 ?auto_1123375 ) ) ( not ( = ?auto_1123374 ?auto_1123376 ) ) ( not ( = ?auto_1123374 ?auto_1123377 ) ) ( not ( = ?auto_1123374 ?auto_1123378 ) ) ( not ( = ?auto_1123373 ?auto_1123375 ) ) ( not ( = ?auto_1123373 ?auto_1123376 ) ) ( not ( = ?auto_1123373 ?auto_1123377 ) ) ( not ( = ?auto_1123373 ?auto_1123378 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1123375 ?auto_1123376 ?auto_1123377 )
      ( MAKE-9CRATE-VERIFY ?auto_1123369 ?auto_1123370 ?auto_1123371 ?auto_1123368 ?auto_1123372 ?auto_1123374 ?auto_1123373 ?auto_1123375 ?auto_1123376 ?auto_1123377 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1123486 - SURFACE
      ?auto_1123487 - SURFACE
      ?auto_1123488 - SURFACE
      ?auto_1123485 - SURFACE
      ?auto_1123489 - SURFACE
      ?auto_1123491 - SURFACE
      ?auto_1123490 - SURFACE
      ?auto_1123492 - SURFACE
      ?auto_1123493 - SURFACE
      ?auto_1123494 - SURFACE
    )
    :vars
    (
      ?auto_1123497 - HOIST
      ?auto_1123500 - PLACE
      ?auto_1123501 - PLACE
      ?auto_1123495 - HOIST
      ?auto_1123496 - SURFACE
      ?auto_1123499 - TRUCK
      ?auto_1123498 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1123497 ?auto_1123500 ) ( IS-CRATE ?auto_1123494 ) ( not ( = ?auto_1123493 ?auto_1123494 ) ) ( not ( = ?auto_1123492 ?auto_1123493 ) ) ( not ( = ?auto_1123492 ?auto_1123494 ) ) ( not ( = ?auto_1123501 ?auto_1123500 ) ) ( HOIST-AT ?auto_1123495 ?auto_1123501 ) ( not ( = ?auto_1123497 ?auto_1123495 ) ) ( SURFACE-AT ?auto_1123494 ?auto_1123501 ) ( ON ?auto_1123494 ?auto_1123496 ) ( CLEAR ?auto_1123494 ) ( not ( = ?auto_1123493 ?auto_1123496 ) ) ( not ( = ?auto_1123494 ?auto_1123496 ) ) ( not ( = ?auto_1123492 ?auto_1123496 ) ) ( SURFACE-AT ?auto_1123492 ?auto_1123500 ) ( CLEAR ?auto_1123492 ) ( IS-CRATE ?auto_1123493 ) ( AVAILABLE ?auto_1123497 ) ( TRUCK-AT ?auto_1123499 ?auto_1123501 ) ( AVAILABLE ?auto_1123495 ) ( SURFACE-AT ?auto_1123493 ?auto_1123501 ) ( ON ?auto_1123493 ?auto_1123498 ) ( CLEAR ?auto_1123493 ) ( not ( = ?auto_1123493 ?auto_1123498 ) ) ( not ( = ?auto_1123494 ?auto_1123498 ) ) ( not ( = ?auto_1123492 ?auto_1123498 ) ) ( not ( = ?auto_1123496 ?auto_1123498 ) ) ( ON ?auto_1123487 ?auto_1123486 ) ( ON ?auto_1123488 ?auto_1123487 ) ( ON ?auto_1123485 ?auto_1123488 ) ( ON ?auto_1123489 ?auto_1123485 ) ( ON ?auto_1123491 ?auto_1123489 ) ( ON ?auto_1123490 ?auto_1123491 ) ( ON ?auto_1123492 ?auto_1123490 ) ( not ( = ?auto_1123486 ?auto_1123487 ) ) ( not ( = ?auto_1123486 ?auto_1123488 ) ) ( not ( = ?auto_1123486 ?auto_1123485 ) ) ( not ( = ?auto_1123486 ?auto_1123489 ) ) ( not ( = ?auto_1123486 ?auto_1123491 ) ) ( not ( = ?auto_1123486 ?auto_1123490 ) ) ( not ( = ?auto_1123486 ?auto_1123492 ) ) ( not ( = ?auto_1123486 ?auto_1123493 ) ) ( not ( = ?auto_1123486 ?auto_1123494 ) ) ( not ( = ?auto_1123486 ?auto_1123496 ) ) ( not ( = ?auto_1123486 ?auto_1123498 ) ) ( not ( = ?auto_1123487 ?auto_1123488 ) ) ( not ( = ?auto_1123487 ?auto_1123485 ) ) ( not ( = ?auto_1123487 ?auto_1123489 ) ) ( not ( = ?auto_1123487 ?auto_1123491 ) ) ( not ( = ?auto_1123487 ?auto_1123490 ) ) ( not ( = ?auto_1123487 ?auto_1123492 ) ) ( not ( = ?auto_1123487 ?auto_1123493 ) ) ( not ( = ?auto_1123487 ?auto_1123494 ) ) ( not ( = ?auto_1123487 ?auto_1123496 ) ) ( not ( = ?auto_1123487 ?auto_1123498 ) ) ( not ( = ?auto_1123488 ?auto_1123485 ) ) ( not ( = ?auto_1123488 ?auto_1123489 ) ) ( not ( = ?auto_1123488 ?auto_1123491 ) ) ( not ( = ?auto_1123488 ?auto_1123490 ) ) ( not ( = ?auto_1123488 ?auto_1123492 ) ) ( not ( = ?auto_1123488 ?auto_1123493 ) ) ( not ( = ?auto_1123488 ?auto_1123494 ) ) ( not ( = ?auto_1123488 ?auto_1123496 ) ) ( not ( = ?auto_1123488 ?auto_1123498 ) ) ( not ( = ?auto_1123485 ?auto_1123489 ) ) ( not ( = ?auto_1123485 ?auto_1123491 ) ) ( not ( = ?auto_1123485 ?auto_1123490 ) ) ( not ( = ?auto_1123485 ?auto_1123492 ) ) ( not ( = ?auto_1123485 ?auto_1123493 ) ) ( not ( = ?auto_1123485 ?auto_1123494 ) ) ( not ( = ?auto_1123485 ?auto_1123496 ) ) ( not ( = ?auto_1123485 ?auto_1123498 ) ) ( not ( = ?auto_1123489 ?auto_1123491 ) ) ( not ( = ?auto_1123489 ?auto_1123490 ) ) ( not ( = ?auto_1123489 ?auto_1123492 ) ) ( not ( = ?auto_1123489 ?auto_1123493 ) ) ( not ( = ?auto_1123489 ?auto_1123494 ) ) ( not ( = ?auto_1123489 ?auto_1123496 ) ) ( not ( = ?auto_1123489 ?auto_1123498 ) ) ( not ( = ?auto_1123491 ?auto_1123490 ) ) ( not ( = ?auto_1123491 ?auto_1123492 ) ) ( not ( = ?auto_1123491 ?auto_1123493 ) ) ( not ( = ?auto_1123491 ?auto_1123494 ) ) ( not ( = ?auto_1123491 ?auto_1123496 ) ) ( not ( = ?auto_1123491 ?auto_1123498 ) ) ( not ( = ?auto_1123490 ?auto_1123492 ) ) ( not ( = ?auto_1123490 ?auto_1123493 ) ) ( not ( = ?auto_1123490 ?auto_1123494 ) ) ( not ( = ?auto_1123490 ?auto_1123496 ) ) ( not ( = ?auto_1123490 ?auto_1123498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1123492 ?auto_1123493 ?auto_1123494 )
      ( MAKE-9CRATE-VERIFY ?auto_1123486 ?auto_1123487 ?auto_1123488 ?auto_1123485 ?auto_1123489 ?auto_1123491 ?auto_1123490 ?auto_1123492 ?auto_1123493 ?auto_1123494 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1123604 - SURFACE
      ?auto_1123605 - SURFACE
      ?auto_1123606 - SURFACE
      ?auto_1123603 - SURFACE
      ?auto_1123607 - SURFACE
      ?auto_1123609 - SURFACE
      ?auto_1123608 - SURFACE
      ?auto_1123610 - SURFACE
      ?auto_1123611 - SURFACE
      ?auto_1123612 - SURFACE
    )
    :vars
    (
      ?auto_1123615 - HOIST
      ?auto_1123619 - PLACE
      ?auto_1123616 - PLACE
      ?auto_1123613 - HOIST
      ?auto_1123618 - SURFACE
      ?auto_1123617 - SURFACE
      ?auto_1123614 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1123615 ?auto_1123619 ) ( IS-CRATE ?auto_1123612 ) ( not ( = ?auto_1123611 ?auto_1123612 ) ) ( not ( = ?auto_1123610 ?auto_1123611 ) ) ( not ( = ?auto_1123610 ?auto_1123612 ) ) ( not ( = ?auto_1123616 ?auto_1123619 ) ) ( HOIST-AT ?auto_1123613 ?auto_1123616 ) ( not ( = ?auto_1123615 ?auto_1123613 ) ) ( SURFACE-AT ?auto_1123612 ?auto_1123616 ) ( ON ?auto_1123612 ?auto_1123618 ) ( CLEAR ?auto_1123612 ) ( not ( = ?auto_1123611 ?auto_1123618 ) ) ( not ( = ?auto_1123612 ?auto_1123618 ) ) ( not ( = ?auto_1123610 ?auto_1123618 ) ) ( SURFACE-AT ?auto_1123610 ?auto_1123619 ) ( CLEAR ?auto_1123610 ) ( IS-CRATE ?auto_1123611 ) ( AVAILABLE ?auto_1123615 ) ( AVAILABLE ?auto_1123613 ) ( SURFACE-AT ?auto_1123611 ?auto_1123616 ) ( ON ?auto_1123611 ?auto_1123617 ) ( CLEAR ?auto_1123611 ) ( not ( = ?auto_1123611 ?auto_1123617 ) ) ( not ( = ?auto_1123612 ?auto_1123617 ) ) ( not ( = ?auto_1123610 ?auto_1123617 ) ) ( not ( = ?auto_1123618 ?auto_1123617 ) ) ( TRUCK-AT ?auto_1123614 ?auto_1123619 ) ( ON ?auto_1123605 ?auto_1123604 ) ( ON ?auto_1123606 ?auto_1123605 ) ( ON ?auto_1123603 ?auto_1123606 ) ( ON ?auto_1123607 ?auto_1123603 ) ( ON ?auto_1123609 ?auto_1123607 ) ( ON ?auto_1123608 ?auto_1123609 ) ( ON ?auto_1123610 ?auto_1123608 ) ( not ( = ?auto_1123604 ?auto_1123605 ) ) ( not ( = ?auto_1123604 ?auto_1123606 ) ) ( not ( = ?auto_1123604 ?auto_1123603 ) ) ( not ( = ?auto_1123604 ?auto_1123607 ) ) ( not ( = ?auto_1123604 ?auto_1123609 ) ) ( not ( = ?auto_1123604 ?auto_1123608 ) ) ( not ( = ?auto_1123604 ?auto_1123610 ) ) ( not ( = ?auto_1123604 ?auto_1123611 ) ) ( not ( = ?auto_1123604 ?auto_1123612 ) ) ( not ( = ?auto_1123604 ?auto_1123618 ) ) ( not ( = ?auto_1123604 ?auto_1123617 ) ) ( not ( = ?auto_1123605 ?auto_1123606 ) ) ( not ( = ?auto_1123605 ?auto_1123603 ) ) ( not ( = ?auto_1123605 ?auto_1123607 ) ) ( not ( = ?auto_1123605 ?auto_1123609 ) ) ( not ( = ?auto_1123605 ?auto_1123608 ) ) ( not ( = ?auto_1123605 ?auto_1123610 ) ) ( not ( = ?auto_1123605 ?auto_1123611 ) ) ( not ( = ?auto_1123605 ?auto_1123612 ) ) ( not ( = ?auto_1123605 ?auto_1123618 ) ) ( not ( = ?auto_1123605 ?auto_1123617 ) ) ( not ( = ?auto_1123606 ?auto_1123603 ) ) ( not ( = ?auto_1123606 ?auto_1123607 ) ) ( not ( = ?auto_1123606 ?auto_1123609 ) ) ( not ( = ?auto_1123606 ?auto_1123608 ) ) ( not ( = ?auto_1123606 ?auto_1123610 ) ) ( not ( = ?auto_1123606 ?auto_1123611 ) ) ( not ( = ?auto_1123606 ?auto_1123612 ) ) ( not ( = ?auto_1123606 ?auto_1123618 ) ) ( not ( = ?auto_1123606 ?auto_1123617 ) ) ( not ( = ?auto_1123603 ?auto_1123607 ) ) ( not ( = ?auto_1123603 ?auto_1123609 ) ) ( not ( = ?auto_1123603 ?auto_1123608 ) ) ( not ( = ?auto_1123603 ?auto_1123610 ) ) ( not ( = ?auto_1123603 ?auto_1123611 ) ) ( not ( = ?auto_1123603 ?auto_1123612 ) ) ( not ( = ?auto_1123603 ?auto_1123618 ) ) ( not ( = ?auto_1123603 ?auto_1123617 ) ) ( not ( = ?auto_1123607 ?auto_1123609 ) ) ( not ( = ?auto_1123607 ?auto_1123608 ) ) ( not ( = ?auto_1123607 ?auto_1123610 ) ) ( not ( = ?auto_1123607 ?auto_1123611 ) ) ( not ( = ?auto_1123607 ?auto_1123612 ) ) ( not ( = ?auto_1123607 ?auto_1123618 ) ) ( not ( = ?auto_1123607 ?auto_1123617 ) ) ( not ( = ?auto_1123609 ?auto_1123608 ) ) ( not ( = ?auto_1123609 ?auto_1123610 ) ) ( not ( = ?auto_1123609 ?auto_1123611 ) ) ( not ( = ?auto_1123609 ?auto_1123612 ) ) ( not ( = ?auto_1123609 ?auto_1123618 ) ) ( not ( = ?auto_1123609 ?auto_1123617 ) ) ( not ( = ?auto_1123608 ?auto_1123610 ) ) ( not ( = ?auto_1123608 ?auto_1123611 ) ) ( not ( = ?auto_1123608 ?auto_1123612 ) ) ( not ( = ?auto_1123608 ?auto_1123618 ) ) ( not ( = ?auto_1123608 ?auto_1123617 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1123610 ?auto_1123611 ?auto_1123612 )
      ( MAKE-9CRATE-VERIFY ?auto_1123604 ?auto_1123605 ?auto_1123606 ?auto_1123603 ?auto_1123607 ?auto_1123609 ?auto_1123608 ?auto_1123610 ?auto_1123611 ?auto_1123612 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1123724 - SURFACE
      ?auto_1123725 - SURFACE
      ?auto_1123726 - SURFACE
      ?auto_1123723 - SURFACE
      ?auto_1123727 - SURFACE
      ?auto_1123729 - SURFACE
      ?auto_1123728 - SURFACE
      ?auto_1123730 - SURFACE
      ?auto_1123731 - SURFACE
      ?auto_1123732 - SURFACE
    )
    :vars
    (
      ?auto_1123735 - HOIST
      ?auto_1123734 - PLACE
      ?auto_1123739 - PLACE
      ?auto_1123736 - HOIST
      ?auto_1123738 - SURFACE
      ?auto_1123733 - SURFACE
      ?auto_1123737 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1123735 ?auto_1123734 ) ( IS-CRATE ?auto_1123732 ) ( not ( = ?auto_1123731 ?auto_1123732 ) ) ( not ( = ?auto_1123730 ?auto_1123731 ) ) ( not ( = ?auto_1123730 ?auto_1123732 ) ) ( not ( = ?auto_1123739 ?auto_1123734 ) ) ( HOIST-AT ?auto_1123736 ?auto_1123739 ) ( not ( = ?auto_1123735 ?auto_1123736 ) ) ( SURFACE-AT ?auto_1123732 ?auto_1123739 ) ( ON ?auto_1123732 ?auto_1123738 ) ( CLEAR ?auto_1123732 ) ( not ( = ?auto_1123731 ?auto_1123738 ) ) ( not ( = ?auto_1123732 ?auto_1123738 ) ) ( not ( = ?auto_1123730 ?auto_1123738 ) ) ( IS-CRATE ?auto_1123731 ) ( AVAILABLE ?auto_1123736 ) ( SURFACE-AT ?auto_1123731 ?auto_1123739 ) ( ON ?auto_1123731 ?auto_1123733 ) ( CLEAR ?auto_1123731 ) ( not ( = ?auto_1123731 ?auto_1123733 ) ) ( not ( = ?auto_1123732 ?auto_1123733 ) ) ( not ( = ?auto_1123730 ?auto_1123733 ) ) ( not ( = ?auto_1123738 ?auto_1123733 ) ) ( TRUCK-AT ?auto_1123737 ?auto_1123734 ) ( SURFACE-AT ?auto_1123728 ?auto_1123734 ) ( CLEAR ?auto_1123728 ) ( LIFTING ?auto_1123735 ?auto_1123730 ) ( IS-CRATE ?auto_1123730 ) ( not ( = ?auto_1123728 ?auto_1123730 ) ) ( not ( = ?auto_1123731 ?auto_1123728 ) ) ( not ( = ?auto_1123732 ?auto_1123728 ) ) ( not ( = ?auto_1123738 ?auto_1123728 ) ) ( not ( = ?auto_1123733 ?auto_1123728 ) ) ( ON ?auto_1123725 ?auto_1123724 ) ( ON ?auto_1123726 ?auto_1123725 ) ( ON ?auto_1123723 ?auto_1123726 ) ( ON ?auto_1123727 ?auto_1123723 ) ( ON ?auto_1123729 ?auto_1123727 ) ( ON ?auto_1123728 ?auto_1123729 ) ( not ( = ?auto_1123724 ?auto_1123725 ) ) ( not ( = ?auto_1123724 ?auto_1123726 ) ) ( not ( = ?auto_1123724 ?auto_1123723 ) ) ( not ( = ?auto_1123724 ?auto_1123727 ) ) ( not ( = ?auto_1123724 ?auto_1123729 ) ) ( not ( = ?auto_1123724 ?auto_1123728 ) ) ( not ( = ?auto_1123724 ?auto_1123730 ) ) ( not ( = ?auto_1123724 ?auto_1123731 ) ) ( not ( = ?auto_1123724 ?auto_1123732 ) ) ( not ( = ?auto_1123724 ?auto_1123738 ) ) ( not ( = ?auto_1123724 ?auto_1123733 ) ) ( not ( = ?auto_1123725 ?auto_1123726 ) ) ( not ( = ?auto_1123725 ?auto_1123723 ) ) ( not ( = ?auto_1123725 ?auto_1123727 ) ) ( not ( = ?auto_1123725 ?auto_1123729 ) ) ( not ( = ?auto_1123725 ?auto_1123728 ) ) ( not ( = ?auto_1123725 ?auto_1123730 ) ) ( not ( = ?auto_1123725 ?auto_1123731 ) ) ( not ( = ?auto_1123725 ?auto_1123732 ) ) ( not ( = ?auto_1123725 ?auto_1123738 ) ) ( not ( = ?auto_1123725 ?auto_1123733 ) ) ( not ( = ?auto_1123726 ?auto_1123723 ) ) ( not ( = ?auto_1123726 ?auto_1123727 ) ) ( not ( = ?auto_1123726 ?auto_1123729 ) ) ( not ( = ?auto_1123726 ?auto_1123728 ) ) ( not ( = ?auto_1123726 ?auto_1123730 ) ) ( not ( = ?auto_1123726 ?auto_1123731 ) ) ( not ( = ?auto_1123726 ?auto_1123732 ) ) ( not ( = ?auto_1123726 ?auto_1123738 ) ) ( not ( = ?auto_1123726 ?auto_1123733 ) ) ( not ( = ?auto_1123723 ?auto_1123727 ) ) ( not ( = ?auto_1123723 ?auto_1123729 ) ) ( not ( = ?auto_1123723 ?auto_1123728 ) ) ( not ( = ?auto_1123723 ?auto_1123730 ) ) ( not ( = ?auto_1123723 ?auto_1123731 ) ) ( not ( = ?auto_1123723 ?auto_1123732 ) ) ( not ( = ?auto_1123723 ?auto_1123738 ) ) ( not ( = ?auto_1123723 ?auto_1123733 ) ) ( not ( = ?auto_1123727 ?auto_1123729 ) ) ( not ( = ?auto_1123727 ?auto_1123728 ) ) ( not ( = ?auto_1123727 ?auto_1123730 ) ) ( not ( = ?auto_1123727 ?auto_1123731 ) ) ( not ( = ?auto_1123727 ?auto_1123732 ) ) ( not ( = ?auto_1123727 ?auto_1123738 ) ) ( not ( = ?auto_1123727 ?auto_1123733 ) ) ( not ( = ?auto_1123729 ?auto_1123728 ) ) ( not ( = ?auto_1123729 ?auto_1123730 ) ) ( not ( = ?auto_1123729 ?auto_1123731 ) ) ( not ( = ?auto_1123729 ?auto_1123732 ) ) ( not ( = ?auto_1123729 ?auto_1123738 ) ) ( not ( = ?auto_1123729 ?auto_1123733 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1123730 ?auto_1123731 ?auto_1123732 )
      ( MAKE-9CRATE-VERIFY ?auto_1123724 ?auto_1123725 ?auto_1123726 ?auto_1123723 ?auto_1123727 ?auto_1123729 ?auto_1123728 ?auto_1123730 ?auto_1123731 ?auto_1123732 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1123969 - SURFACE
      ?auto_1123970 - SURFACE
    )
    :vars
    (
      ?auto_1123972 - HOIST
      ?auto_1123977 - PLACE
      ?auto_1123974 - SURFACE
      ?auto_1123973 - PLACE
      ?auto_1123978 - HOIST
      ?auto_1123971 - SURFACE
      ?auto_1123976 - TRUCK
      ?auto_1123975 - SURFACE
      ?auto_1123979 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1123972 ?auto_1123977 ) ( IS-CRATE ?auto_1123970 ) ( not ( = ?auto_1123969 ?auto_1123970 ) ) ( not ( = ?auto_1123974 ?auto_1123969 ) ) ( not ( = ?auto_1123974 ?auto_1123970 ) ) ( not ( = ?auto_1123973 ?auto_1123977 ) ) ( HOIST-AT ?auto_1123978 ?auto_1123973 ) ( not ( = ?auto_1123972 ?auto_1123978 ) ) ( SURFACE-AT ?auto_1123970 ?auto_1123973 ) ( ON ?auto_1123970 ?auto_1123971 ) ( CLEAR ?auto_1123970 ) ( not ( = ?auto_1123969 ?auto_1123971 ) ) ( not ( = ?auto_1123970 ?auto_1123971 ) ) ( not ( = ?auto_1123974 ?auto_1123971 ) ) ( SURFACE-AT ?auto_1123974 ?auto_1123977 ) ( CLEAR ?auto_1123974 ) ( IS-CRATE ?auto_1123969 ) ( AVAILABLE ?auto_1123972 ) ( TRUCK-AT ?auto_1123976 ?auto_1123973 ) ( SURFACE-AT ?auto_1123969 ?auto_1123973 ) ( ON ?auto_1123969 ?auto_1123975 ) ( CLEAR ?auto_1123969 ) ( not ( = ?auto_1123969 ?auto_1123975 ) ) ( not ( = ?auto_1123970 ?auto_1123975 ) ) ( not ( = ?auto_1123974 ?auto_1123975 ) ) ( not ( = ?auto_1123971 ?auto_1123975 ) ) ( LIFTING ?auto_1123978 ?auto_1123979 ) ( IS-CRATE ?auto_1123979 ) ( not ( = ?auto_1123969 ?auto_1123979 ) ) ( not ( = ?auto_1123970 ?auto_1123979 ) ) ( not ( = ?auto_1123974 ?auto_1123979 ) ) ( not ( = ?auto_1123971 ?auto_1123979 ) ) ( not ( = ?auto_1123975 ?auto_1123979 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1123978 ?auto_1123979 ?auto_1123976 ?auto_1123973 )
      ( MAKE-1CRATE ?auto_1123969 ?auto_1123970 )
      ( MAKE-1CRATE-VERIFY ?auto_1123969 ?auto_1123970 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1128654 - SURFACE
      ?auto_1128655 - SURFACE
      ?auto_1128656 - SURFACE
      ?auto_1128653 - SURFACE
      ?auto_1128657 - SURFACE
      ?auto_1128659 - SURFACE
      ?auto_1128658 - SURFACE
      ?auto_1128660 - SURFACE
      ?auto_1128661 - SURFACE
      ?auto_1128662 - SURFACE
      ?auto_1128663 - SURFACE
    )
    :vars
    (
      ?auto_1128664 - HOIST
      ?auto_1128665 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1128664 ?auto_1128665 ) ( SURFACE-AT ?auto_1128662 ?auto_1128665 ) ( CLEAR ?auto_1128662 ) ( LIFTING ?auto_1128664 ?auto_1128663 ) ( IS-CRATE ?auto_1128663 ) ( not ( = ?auto_1128662 ?auto_1128663 ) ) ( ON ?auto_1128655 ?auto_1128654 ) ( ON ?auto_1128656 ?auto_1128655 ) ( ON ?auto_1128653 ?auto_1128656 ) ( ON ?auto_1128657 ?auto_1128653 ) ( ON ?auto_1128659 ?auto_1128657 ) ( ON ?auto_1128658 ?auto_1128659 ) ( ON ?auto_1128660 ?auto_1128658 ) ( ON ?auto_1128661 ?auto_1128660 ) ( ON ?auto_1128662 ?auto_1128661 ) ( not ( = ?auto_1128654 ?auto_1128655 ) ) ( not ( = ?auto_1128654 ?auto_1128656 ) ) ( not ( = ?auto_1128654 ?auto_1128653 ) ) ( not ( = ?auto_1128654 ?auto_1128657 ) ) ( not ( = ?auto_1128654 ?auto_1128659 ) ) ( not ( = ?auto_1128654 ?auto_1128658 ) ) ( not ( = ?auto_1128654 ?auto_1128660 ) ) ( not ( = ?auto_1128654 ?auto_1128661 ) ) ( not ( = ?auto_1128654 ?auto_1128662 ) ) ( not ( = ?auto_1128654 ?auto_1128663 ) ) ( not ( = ?auto_1128655 ?auto_1128656 ) ) ( not ( = ?auto_1128655 ?auto_1128653 ) ) ( not ( = ?auto_1128655 ?auto_1128657 ) ) ( not ( = ?auto_1128655 ?auto_1128659 ) ) ( not ( = ?auto_1128655 ?auto_1128658 ) ) ( not ( = ?auto_1128655 ?auto_1128660 ) ) ( not ( = ?auto_1128655 ?auto_1128661 ) ) ( not ( = ?auto_1128655 ?auto_1128662 ) ) ( not ( = ?auto_1128655 ?auto_1128663 ) ) ( not ( = ?auto_1128656 ?auto_1128653 ) ) ( not ( = ?auto_1128656 ?auto_1128657 ) ) ( not ( = ?auto_1128656 ?auto_1128659 ) ) ( not ( = ?auto_1128656 ?auto_1128658 ) ) ( not ( = ?auto_1128656 ?auto_1128660 ) ) ( not ( = ?auto_1128656 ?auto_1128661 ) ) ( not ( = ?auto_1128656 ?auto_1128662 ) ) ( not ( = ?auto_1128656 ?auto_1128663 ) ) ( not ( = ?auto_1128653 ?auto_1128657 ) ) ( not ( = ?auto_1128653 ?auto_1128659 ) ) ( not ( = ?auto_1128653 ?auto_1128658 ) ) ( not ( = ?auto_1128653 ?auto_1128660 ) ) ( not ( = ?auto_1128653 ?auto_1128661 ) ) ( not ( = ?auto_1128653 ?auto_1128662 ) ) ( not ( = ?auto_1128653 ?auto_1128663 ) ) ( not ( = ?auto_1128657 ?auto_1128659 ) ) ( not ( = ?auto_1128657 ?auto_1128658 ) ) ( not ( = ?auto_1128657 ?auto_1128660 ) ) ( not ( = ?auto_1128657 ?auto_1128661 ) ) ( not ( = ?auto_1128657 ?auto_1128662 ) ) ( not ( = ?auto_1128657 ?auto_1128663 ) ) ( not ( = ?auto_1128659 ?auto_1128658 ) ) ( not ( = ?auto_1128659 ?auto_1128660 ) ) ( not ( = ?auto_1128659 ?auto_1128661 ) ) ( not ( = ?auto_1128659 ?auto_1128662 ) ) ( not ( = ?auto_1128659 ?auto_1128663 ) ) ( not ( = ?auto_1128658 ?auto_1128660 ) ) ( not ( = ?auto_1128658 ?auto_1128661 ) ) ( not ( = ?auto_1128658 ?auto_1128662 ) ) ( not ( = ?auto_1128658 ?auto_1128663 ) ) ( not ( = ?auto_1128660 ?auto_1128661 ) ) ( not ( = ?auto_1128660 ?auto_1128662 ) ) ( not ( = ?auto_1128660 ?auto_1128663 ) ) ( not ( = ?auto_1128661 ?auto_1128662 ) ) ( not ( = ?auto_1128661 ?auto_1128663 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1128662 ?auto_1128663 )
      ( MAKE-10CRATE-VERIFY ?auto_1128654 ?auto_1128655 ?auto_1128656 ?auto_1128653 ?auto_1128657 ?auto_1128659 ?auto_1128658 ?auto_1128660 ?auto_1128661 ?auto_1128662 ?auto_1128663 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1128748 - SURFACE
      ?auto_1128749 - SURFACE
      ?auto_1128750 - SURFACE
      ?auto_1128747 - SURFACE
      ?auto_1128751 - SURFACE
      ?auto_1128753 - SURFACE
      ?auto_1128752 - SURFACE
      ?auto_1128754 - SURFACE
      ?auto_1128755 - SURFACE
      ?auto_1128756 - SURFACE
      ?auto_1128757 - SURFACE
    )
    :vars
    (
      ?auto_1128758 - HOIST
      ?auto_1128760 - PLACE
      ?auto_1128759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1128758 ?auto_1128760 ) ( SURFACE-AT ?auto_1128756 ?auto_1128760 ) ( CLEAR ?auto_1128756 ) ( IS-CRATE ?auto_1128757 ) ( not ( = ?auto_1128756 ?auto_1128757 ) ) ( TRUCK-AT ?auto_1128759 ?auto_1128760 ) ( AVAILABLE ?auto_1128758 ) ( IN ?auto_1128757 ?auto_1128759 ) ( ON ?auto_1128756 ?auto_1128755 ) ( not ( = ?auto_1128755 ?auto_1128756 ) ) ( not ( = ?auto_1128755 ?auto_1128757 ) ) ( ON ?auto_1128749 ?auto_1128748 ) ( ON ?auto_1128750 ?auto_1128749 ) ( ON ?auto_1128747 ?auto_1128750 ) ( ON ?auto_1128751 ?auto_1128747 ) ( ON ?auto_1128753 ?auto_1128751 ) ( ON ?auto_1128752 ?auto_1128753 ) ( ON ?auto_1128754 ?auto_1128752 ) ( ON ?auto_1128755 ?auto_1128754 ) ( not ( = ?auto_1128748 ?auto_1128749 ) ) ( not ( = ?auto_1128748 ?auto_1128750 ) ) ( not ( = ?auto_1128748 ?auto_1128747 ) ) ( not ( = ?auto_1128748 ?auto_1128751 ) ) ( not ( = ?auto_1128748 ?auto_1128753 ) ) ( not ( = ?auto_1128748 ?auto_1128752 ) ) ( not ( = ?auto_1128748 ?auto_1128754 ) ) ( not ( = ?auto_1128748 ?auto_1128755 ) ) ( not ( = ?auto_1128748 ?auto_1128756 ) ) ( not ( = ?auto_1128748 ?auto_1128757 ) ) ( not ( = ?auto_1128749 ?auto_1128750 ) ) ( not ( = ?auto_1128749 ?auto_1128747 ) ) ( not ( = ?auto_1128749 ?auto_1128751 ) ) ( not ( = ?auto_1128749 ?auto_1128753 ) ) ( not ( = ?auto_1128749 ?auto_1128752 ) ) ( not ( = ?auto_1128749 ?auto_1128754 ) ) ( not ( = ?auto_1128749 ?auto_1128755 ) ) ( not ( = ?auto_1128749 ?auto_1128756 ) ) ( not ( = ?auto_1128749 ?auto_1128757 ) ) ( not ( = ?auto_1128750 ?auto_1128747 ) ) ( not ( = ?auto_1128750 ?auto_1128751 ) ) ( not ( = ?auto_1128750 ?auto_1128753 ) ) ( not ( = ?auto_1128750 ?auto_1128752 ) ) ( not ( = ?auto_1128750 ?auto_1128754 ) ) ( not ( = ?auto_1128750 ?auto_1128755 ) ) ( not ( = ?auto_1128750 ?auto_1128756 ) ) ( not ( = ?auto_1128750 ?auto_1128757 ) ) ( not ( = ?auto_1128747 ?auto_1128751 ) ) ( not ( = ?auto_1128747 ?auto_1128753 ) ) ( not ( = ?auto_1128747 ?auto_1128752 ) ) ( not ( = ?auto_1128747 ?auto_1128754 ) ) ( not ( = ?auto_1128747 ?auto_1128755 ) ) ( not ( = ?auto_1128747 ?auto_1128756 ) ) ( not ( = ?auto_1128747 ?auto_1128757 ) ) ( not ( = ?auto_1128751 ?auto_1128753 ) ) ( not ( = ?auto_1128751 ?auto_1128752 ) ) ( not ( = ?auto_1128751 ?auto_1128754 ) ) ( not ( = ?auto_1128751 ?auto_1128755 ) ) ( not ( = ?auto_1128751 ?auto_1128756 ) ) ( not ( = ?auto_1128751 ?auto_1128757 ) ) ( not ( = ?auto_1128753 ?auto_1128752 ) ) ( not ( = ?auto_1128753 ?auto_1128754 ) ) ( not ( = ?auto_1128753 ?auto_1128755 ) ) ( not ( = ?auto_1128753 ?auto_1128756 ) ) ( not ( = ?auto_1128753 ?auto_1128757 ) ) ( not ( = ?auto_1128752 ?auto_1128754 ) ) ( not ( = ?auto_1128752 ?auto_1128755 ) ) ( not ( = ?auto_1128752 ?auto_1128756 ) ) ( not ( = ?auto_1128752 ?auto_1128757 ) ) ( not ( = ?auto_1128754 ?auto_1128755 ) ) ( not ( = ?auto_1128754 ?auto_1128756 ) ) ( not ( = ?auto_1128754 ?auto_1128757 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1128755 ?auto_1128756 ?auto_1128757 )
      ( MAKE-10CRATE-VERIFY ?auto_1128748 ?auto_1128749 ?auto_1128750 ?auto_1128747 ?auto_1128751 ?auto_1128753 ?auto_1128752 ?auto_1128754 ?auto_1128755 ?auto_1128756 ?auto_1128757 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1128853 - SURFACE
      ?auto_1128854 - SURFACE
      ?auto_1128855 - SURFACE
      ?auto_1128852 - SURFACE
      ?auto_1128856 - SURFACE
      ?auto_1128858 - SURFACE
      ?auto_1128857 - SURFACE
      ?auto_1128859 - SURFACE
      ?auto_1128860 - SURFACE
      ?auto_1128861 - SURFACE
      ?auto_1128862 - SURFACE
    )
    :vars
    (
      ?auto_1128866 - HOIST
      ?auto_1128865 - PLACE
      ?auto_1128863 - TRUCK
      ?auto_1128864 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1128866 ?auto_1128865 ) ( SURFACE-AT ?auto_1128861 ?auto_1128865 ) ( CLEAR ?auto_1128861 ) ( IS-CRATE ?auto_1128862 ) ( not ( = ?auto_1128861 ?auto_1128862 ) ) ( AVAILABLE ?auto_1128866 ) ( IN ?auto_1128862 ?auto_1128863 ) ( ON ?auto_1128861 ?auto_1128860 ) ( not ( = ?auto_1128860 ?auto_1128861 ) ) ( not ( = ?auto_1128860 ?auto_1128862 ) ) ( TRUCK-AT ?auto_1128863 ?auto_1128864 ) ( not ( = ?auto_1128864 ?auto_1128865 ) ) ( ON ?auto_1128854 ?auto_1128853 ) ( ON ?auto_1128855 ?auto_1128854 ) ( ON ?auto_1128852 ?auto_1128855 ) ( ON ?auto_1128856 ?auto_1128852 ) ( ON ?auto_1128858 ?auto_1128856 ) ( ON ?auto_1128857 ?auto_1128858 ) ( ON ?auto_1128859 ?auto_1128857 ) ( ON ?auto_1128860 ?auto_1128859 ) ( not ( = ?auto_1128853 ?auto_1128854 ) ) ( not ( = ?auto_1128853 ?auto_1128855 ) ) ( not ( = ?auto_1128853 ?auto_1128852 ) ) ( not ( = ?auto_1128853 ?auto_1128856 ) ) ( not ( = ?auto_1128853 ?auto_1128858 ) ) ( not ( = ?auto_1128853 ?auto_1128857 ) ) ( not ( = ?auto_1128853 ?auto_1128859 ) ) ( not ( = ?auto_1128853 ?auto_1128860 ) ) ( not ( = ?auto_1128853 ?auto_1128861 ) ) ( not ( = ?auto_1128853 ?auto_1128862 ) ) ( not ( = ?auto_1128854 ?auto_1128855 ) ) ( not ( = ?auto_1128854 ?auto_1128852 ) ) ( not ( = ?auto_1128854 ?auto_1128856 ) ) ( not ( = ?auto_1128854 ?auto_1128858 ) ) ( not ( = ?auto_1128854 ?auto_1128857 ) ) ( not ( = ?auto_1128854 ?auto_1128859 ) ) ( not ( = ?auto_1128854 ?auto_1128860 ) ) ( not ( = ?auto_1128854 ?auto_1128861 ) ) ( not ( = ?auto_1128854 ?auto_1128862 ) ) ( not ( = ?auto_1128855 ?auto_1128852 ) ) ( not ( = ?auto_1128855 ?auto_1128856 ) ) ( not ( = ?auto_1128855 ?auto_1128858 ) ) ( not ( = ?auto_1128855 ?auto_1128857 ) ) ( not ( = ?auto_1128855 ?auto_1128859 ) ) ( not ( = ?auto_1128855 ?auto_1128860 ) ) ( not ( = ?auto_1128855 ?auto_1128861 ) ) ( not ( = ?auto_1128855 ?auto_1128862 ) ) ( not ( = ?auto_1128852 ?auto_1128856 ) ) ( not ( = ?auto_1128852 ?auto_1128858 ) ) ( not ( = ?auto_1128852 ?auto_1128857 ) ) ( not ( = ?auto_1128852 ?auto_1128859 ) ) ( not ( = ?auto_1128852 ?auto_1128860 ) ) ( not ( = ?auto_1128852 ?auto_1128861 ) ) ( not ( = ?auto_1128852 ?auto_1128862 ) ) ( not ( = ?auto_1128856 ?auto_1128858 ) ) ( not ( = ?auto_1128856 ?auto_1128857 ) ) ( not ( = ?auto_1128856 ?auto_1128859 ) ) ( not ( = ?auto_1128856 ?auto_1128860 ) ) ( not ( = ?auto_1128856 ?auto_1128861 ) ) ( not ( = ?auto_1128856 ?auto_1128862 ) ) ( not ( = ?auto_1128858 ?auto_1128857 ) ) ( not ( = ?auto_1128858 ?auto_1128859 ) ) ( not ( = ?auto_1128858 ?auto_1128860 ) ) ( not ( = ?auto_1128858 ?auto_1128861 ) ) ( not ( = ?auto_1128858 ?auto_1128862 ) ) ( not ( = ?auto_1128857 ?auto_1128859 ) ) ( not ( = ?auto_1128857 ?auto_1128860 ) ) ( not ( = ?auto_1128857 ?auto_1128861 ) ) ( not ( = ?auto_1128857 ?auto_1128862 ) ) ( not ( = ?auto_1128859 ?auto_1128860 ) ) ( not ( = ?auto_1128859 ?auto_1128861 ) ) ( not ( = ?auto_1128859 ?auto_1128862 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1128860 ?auto_1128861 ?auto_1128862 )
      ( MAKE-10CRATE-VERIFY ?auto_1128853 ?auto_1128854 ?auto_1128855 ?auto_1128852 ?auto_1128856 ?auto_1128858 ?auto_1128857 ?auto_1128859 ?auto_1128860 ?auto_1128861 ?auto_1128862 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1128968 - SURFACE
      ?auto_1128969 - SURFACE
      ?auto_1128970 - SURFACE
      ?auto_1128967 - SURFACE
      ?auto_1128971 - SURFACE
      ?auto_1128973 - SURFACE
      ?auto_1128972 - SURFACE
      ?auto_1128974 - SURFACE
      ?auto_1128975 - SURFACE
      ?auto_1128976 - SURFACE
      ?auto_1128977 - SURFACE
    )
    :vars
    (
      ?auto_1128979 - HOIST
      ?auto_1128980 - PLACE
      ?auto_1128978 - TRUCK
      ?auto_1128981 - PLACE
      ?auto_1128982 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1128979 ?auto_1128980 ) ( SURFACE-AT ?auto_1128976 ?auto_1128980 ) ( CLEAR ?auto_1128976 ) ( IS-CRATE ?auto_1128977 ) ( not ( = ?auto_1128976 ?auto_1128977 ) ) ( AVAILABLE ?auto_1128979 ) ( ON ?auto_1128976 ?auto_1128975 ) ( not ( = ?auto_1128975 ?auto_1128976 ) ) ( not ( = ?auto_1128975 ?auto_1128977 ) ) ( TRUCK-AT ?auto_1128978 ?auto_1128981 ) ( not ( = ?auto_1128981 ?auto_1128980 ) ) ( HOIST-AT ?auto_1128982 ?auto_1128981 ) ( LIFTING ?auto_1128982 ?auto_1128977 ) ( not ( = ?auto_1128979 ?auto_1128982 ) ) ( ON ?auto_1128969 ?auto_1128968 ) ( ON ?auto_1128970 ?auto_1128969 ) ( ON ?auto_1128967 ?auto_1128970 ) ( ON ?auto_1128971 ?auto_1128967 ) ( ON ?auto_1128973 ?auto_1128971 ) ( ON ?auto_1128972 ?auto_1128973 ) ( ON ?auto_1128974 ?auto_1128972 ) ( ON ?auto_1128975 ?auto_1128974 ) ( not ( = ?auto_1128968 ?auto_1128969 ) ) ( not ( = ?auto_1128968 ?auto_1128970 ) ) ( not ( = ?auto_1128968 ?auto_1128967 ) ) ( not ( = ?auto_1128968 ?auto_1128971 ) ) ( not ( = ?auto_1128968 ?auto_1128973 ) ) ( not ( = ?auto_1128968 ?auto_1128972 ) ) ( not ( = ?auto_1128968 ?auto_1128974 ) ) ( not ( = ?auto_1128968 ?auto_1128975 ) ) ( not ( = ?auto_1128968 ?auto_1128976 ) ) ( not ( = ?auto_1128968 ?auto_1128977 ) ) ( not ( = ?auto_1128969 ?auto_1128970 ) ) ( not ( = ?auto_1128969 ?auto_1128967 ) ) ( not ( = ?auto_1128969 ?auto_1128971 ) ) ( not ( = ?auto_1128969 ?auto_1128973 ) ) ( not ( = ?auto_1128969 ?auto_1128972 ) ) ( not ( = ?auto_1128969 ?auto_1128974 ) ) ( not ( = ?auto_1128969 ?auto_1128975 ) ) ( not ( = ?auto_1128969 ?auto_1128976 ) ) ( not ( = ?auto_1128969 ?auto_1128977 ) ) ( not ( = ?auto_1128970 ?auto_1128967 ) ) ( not ( = ?auto_1128970 ?auto_1128971 ) ) ( not ( = ?auto_1128970 ?auto_1128973 ) ) ( not ( = ?auto_1128970 ?auto_1128972 ) ) ( not ( = ?auto_1128970 ?auto_1128974 ) ) ( not ( = ?auto_1128970 ?auto_1128975 ) ) ( not ( = ?auto_1128970 ?auto_1128976 ) ) ( not ( = ?auto_1128970 ?auto_1128977 ) ) ( not ( = ?auto_1128967 ?auto_1128971 ) ) ( not ( = ?auto_1128967 ?auto_1128973 ) ) ( not ( = ?auto_1128967 ?auto_1128972 ) ) ( not ( = ?auto_1128967 ?auto_1128974 ) ) ( not ( = ?auto_1128967 ?auto_1128975 ) ) ( not ( = ?auto_1128967 ?auto_1128976 ) ) ( not ( = ?auto_1128967 ?auto_1128977 ) ) ( not ( = ?auto_1128971 ?auto_1128973 ) ) ( not ( = ?auto_1128971 ?auto_1128972 ) ) ( not ( = ?auto_1128971 ?auto_1128974 ) ) ( not ( = ?auto_1128971 ?auto_1128975 ) ) ( not ( = ?auto_1128971 ?auto_1128976 ) ) ( not ( = ?auto_1128971 ?auto_1128977 ) ) ( not ( = ?auto_1128973 ?auto_1128972 ) ) ( not ( = ?auto_1128973 ?auto_1128974 ) ) ( not ( = ?auto_1128973 ?auto_1128975 ) ) ( not ( = ?auto_1128973 ?auto_1128976 ) ) ( not ( = ?auto_1128973 ?auto_1128977 ) ) ( not ( = ?auto_1128972 ?auto_1128974 ) ) ( not ( = ?auto_1128972 ?auto_1128975 ) ) ( not ( = ?auto_1128972 ?auto_1128976 ) ) ( not ( = ?auto_1128972 ?auto_1128977 ) ) ( not ( = ?auto_1128974 ?auto_1128975 ) ) ( not ( = ?auto_1128974 ?auto_1128976 ) ) ( not ( = ?auto_1128974 ?auto_1128977 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1128975 ?auto_1128976 ?auto_1128977 )
      ( MAKE-10CRATE-VERIFY ?auto_1128968 ?auto_1128969 ?auto_1128970 ?auto_1128967 ?auto_1128971 ?auto_1128973 ?auto_1128972 ?auto_1128974 ?auto_1128975 ?auto_1128976 ?auto_1128977 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1129093 - SURFACE
      ?auto_1129094 - SURFACE
      ?auto_1129095 - SURFACE
      ?auto_1129092 - SURFACE
      ?auto_1129096 - SURFACE
      ?auto_1129098 - SURFACE
      ?auto_1129097 - SURFACE
      ?auto_1129099 - SURFACE
      ?auto_1129100 - SURFACE
      ?auto_1129101 - SURFACE
      ?auto_1129102 - SURFACE
    )
    :vars
    (
      ?auto_1129103 - HOIST
      ?auto_1129108 - PLACE
      ?auto_1129105 - TRUCK
      ?auto_1129104 - PLACE
      ?auto_1129106 - HOIST
      ?auto_1129107 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129103 ?auto_1129108 ) ( SURFACE-AT ?auto_1129101 ?auto_1129108 ) ( CLEAR ?auto_1129101 ) ( IS-CRATE ?auto_1129102 ) ( not ( = ?auto_1129101 ?auto_1129102 ) ) ( AVAILABLE ?auto_1129103 ) ( ON ?auto_1129101 ?auto_1129100 ) ( not ( = ?auto_1129100 ?auto_1129101 ) ) ( not ( = ?auto_1129100 ?auto_1129102 ) ) ( TRUCK-AT ?auto_1129105 ?auto_1129104 ) ( not ( = ?auto_1129104 ?auto_1129108 ) ) ( HOIST-AT ?auto_1129106 ?auto_1129104 ) ( not ( = ?auto_1129103 ?auto_1129106 ) ) ( AVAILABLE ?auto_1129106 ) ( SURFACE-AT ?auto_1129102 ?auto_1129104 ) ( ON ?auto_1129102 ?auto_1129107 ) ( CLEAR ?auto_1129102 ) ( not ( = ?auto_1129101 ?auto_1129107 ) ) ( not ( = ?auto_1129102 ?auto_1129107 ) ) ( not ( = ?auto_1129100 ?auto_1129107 ) ) ( ON ?auto_1129094 ?auto_1129093 ) ( ON ?auto_1129095 ?auto_1129094 ) ( ON ?auto_1129092 ?auto_1129095 ) ( ON ?auto_1129096 ?auto_1129092 ) ( ON ?auto_1129098 ?auto_1129096 ) ( ON ?auto_1129097 ?auto_1129098 ) ( ON ?auto_1129099 ?auto_1129097 ) ( ON ?auto_1129100 ?auto_1129099 ) ( not ( = ?auto_1129093 ?auto_1129094 ) ) ( not ( = ?auto_1129093 ?auto_1129095 ) ) ( not ( = ?auto_1129093 ?auto_1129092 ) ) ( not ( = ?auto_1129093 ?auto_1129096 ) ) ( not ( = ?auto_1129093 ?auto_1129098 ) ) ( not ( = ?auto_1129093 ?auto_1129097 ) ) ( not ( = ?auto_1129093 ?auto_1129099 ) ) ( not ( = ?auto_1129093 ?auto_1129100 ) ) ( not ( = ?auto_1129093 ?auto_1129101 ) ) ( not ( = ?auto_1129093 ?auto_1129102 ) ) ( not ( = ?auto_1129093 ?auto_1129107 ) ) ( not ( = ?auto_1129094 ?auto_1129095 ) ) ( not ( = ?auto_1129094 ?auto_1129092 ) ) ( not ( = ?auto_1129094 ?auto_1129096 ) ) ( not ( = ?auto_1129094 ?auto_1129098 ) ) ( not ( = ?auto_1129094 ?auto_1129097 ) ) ( not ( = ?auto_1129094 ?auto_1129099 ) ) ( not ( = ?auto_1129094 ?auto_1129100 ) ) ( not ( = ?auto_1129094 ?auto_1129101 ) ) ( not ( = ?auto_1129094 ?auto_1129102 ) ) ( not ( = ?auto_1129094 ?auto_1129107 ) ) ( not ( = ?auto_1129095 ?auto_1129092 ) ) ( not ( = ?auto_1129095 ?auto_1129096 ) ) ( not ( = ?auto_1129095 ?auto_1129098 ) ) ( not ( = ?auto_1129095 ?auto_1129097 ) ) ( not ( = ?auto_1129095 ?auto_1129099 ) ) ( not ( = ?auto_1129095 ?auto_1129100 ) ) ( not ( = ?auto_1129095 ?auto_1129101 ) ) ( not ( = ?auto_1129095 ?auto_1129102 ) ) ( not ( = ?auto_1129095 ?auto_1129107 ) ) ( not ( = ?auto_1129092 ?auto_1129096 ) ) ( not ( = ?auto_1129092 ?auto_1129098 ) ) ( not ( = ?auto_1129092 ?auto_1129097 ) ) ( not ( = ?auto_1129092 ?auto_1129099 ) ) ( not ( = ?auto_1129092 ?auto_1129100 ) ) ( not ( = ?auto_1129092 ?auto_1129101 ) ) ( not ( = ?auto_1129092 ?auto_1129102 ) ) ( not ( = ?auto_1129092 ?auto_1129107 ) ) ( not ( = ?auto_1129096 ?auto_1129098 ) ) ( not ( = ?auto_1129096 ?auto_1129097 ) ) ( not ( = ?auto_1129096 ?auto_1129099 ) ) ( not ( = ?auto_1129096 ?auto_1129100 ) ) ( not ( = ?auto_1129096 ?auto_1129101 ) ) ( not ( = ?auto_1129096 ?auto_1129102 ) ) ( not ( = ?auto_1129096 ?auto_1129107 ) ) ( not ( = ?auto_1129098 ?auto_1129097 ) ) ( not ( = ?auto_1129098 ?auto_1129099 ) ) ( not ( = ?auto_1129098 ?auto_1129100 ) ) ( not ( = ?auto_1129098 ?auto_1129101 ) ) ( not ( = ?auto_1129098 ?auto_1129102 ) ) ( not ( = ?auto_1129098 ?auto_1129107 ) ) ( not ( = ?auto_1129097 ?auto_1129099 ) ) ( not ( = ?auto_1129097 ?auto_1129100 ) ) ( not ( = ?auto_1129097 ?auto_1129101 ) ) ( not ( = ?auto_1129097 ?auto_1129102 ) ) ( not ( = ?auto_1129097 ?auto_1129107 ) ) ( not ( = ?auto_1129099 ?auto_1129100 ) ) ( not ( = ?auto_1129099 ?auto_1129101 ) ) ( not ( = ?auto_1129099 ?auto_1129102 ) ) ( not ( = ?auto_1129099 ?auto_1129107 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129100 ?auto_1129101 ?auto_1129102 )
      ( MAKE-10CRATE-VERIFY ?auto_1129093 ?auto_1129094 ?auto_1129095 ?auto_1129092 ?auto_1129096 ?auto_1129098 ?auto_1129097 ?auto_1129099 ?auto_1129100 ?auto_1129101 ?auto_1129102 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1129219 - SURFACE
      ?auto_1129220 - SURFACE
      ?auto_1129221 - SURFACE
      ?auto_1129218 - SURFACE
      ?auto_1129222 - SURFACE
      ?auto_1129224 - SURFACE
      ?auto_1129223 - SURFACE
      ?auto_1129225 - SURFACE
      ?auto_1129226 - SURFACE
      ?auto_1129227 - SURFACE
      ?auto_1129228 - SURFACE
    )
    :vars
    (
      ?auto_1129231 - HOIST
      ?auto_1129232 - PLACE
      ?auto_1129233 - PLACE
      ?auto_1129230 - HOIST
      ?auto_1129234 - SURFACE
      ?auto_1129229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129231 ?auto_1129232 ) ( SURFACE-AT ?auto_1129227 ?auto_1129232 ) ( CLEAR ?auto_1129227 ) ( IS-CRATE ?auto_1129228 ) ( not ( = ?auto_1129227 ?auto_1129228 ) ) ( AVAILABLE ?auto_1129231 ) ( ON ?auto_1129227 ?auto_1129226 ) ( not ( = ?auto_1129226 ?auto_1129227 ) ) ( not ( = ?auto_1129226 ?auto_1129228 ) ) ( not ( = ?auto_1129233 ?auto_1129232 ) ) ( HOIST-AT ?auto_1129230 ?auto_1129233 ) ( not ( = ?auto_1129231 ?auto_1129230 ) ) ( AVAILABLE ?auto_1129230 ) ( SURFACE-AT ?auto_1129228 ?auto_1129233 ) ( ON ?auto_1129228 ?auto_1129234 ) ( CLEAR ?auto_1129228 ) ( not ( = ?auto_1129227 ?auto_1129234 ) ) ( not ( = ?auto_1129228 ?auto_1129234 ) ) ( not ( = ?auto_1129226 ?auto_1129234 ) ) ( TRUCK-AT ?auto_1129229 ?auto_1129232 ) ( ON ?auto_1129220 ?auto_1129219 ) ( ON ?auto_1129221 ?auto_1129220 ) ( ON ?auto_1129218 ?auto_1129221 ) ( ON ?auto_1129222 ?auto_1129218 ) ( ON ?auto_1129224 ?auto_1129222 ) ( ON ?auto_1129223 ?auto_1129224 ) ( ON ?auto_1129225 ?auto_1129223 ) ( ON ?auto_1129226 ?auto_1129225 ) ( not ( = ?auto_1129219 ?auto_1129220 ) ) ( not ( = ?auto_1129219 ?auto_1129221 ) ) ( not ( = ?auto_1129219 ?auto_1129218 ) ) ( not ( = ?auto_1129219 ?auto_1129222 ) ) ( not ( = ?auto_1129219 ?auto_1129224 ) ) ( not ( = ?auto_1129219 ?auto_1129223 ) ) ( not ( = ?auto_1129219 ?auto_1129225 ) ) ( not ( = ?auto_1129219 ?auto_1129226 ) ) ( not ( = ?auto_1129219 ?auto_1129227 ) ) ( not ( = ?auto_1129219 ?auto_1129228 ) ) ( not ( = ?auto_1129219 ?auto_1129234 ) ) ( not ( = ?auto_1129220 ?auto_1129221 ) ) ( not ( = ?auto_1129220 ?auto_1129218 ) ) ( not ( = ?auto_1129220 ?auto_1129222 ) ) ( not ( = ?auto_1129220 ?auto_1129224 ) ) ( not ( = ?auto_1129220 ?auto_1129223 ) ) ( not ( = ?auto_1129220 ?auto_1129225 ) ) ( not ( = ?auto_1129220 ?auto_1129226 ) ) ( not ( = ?auto_1129220 ?auto_1129227 ) ) ( not ( = ?auto_1129220 ?auto_1129228 ) ) ( not ( = ?auto_1129220 ?auto_1129234 ) ) ( not ( = ?auto_1129221 ?auto_1129218 ) ) ( not ( = ?auto_1129221 ?auto_1129222 ) ) ( not ( = ?auto_1129221 ?auto_1129224 ) ) ( not ( = ?auto_1129221 ?auto_1129223 ) ) ( not ( = ?auto_1129221 ?auto_1129225 ) ) ( not ( = ?auto_1129221 ?auto_1129226 ) ) ( not ( = ?auto_1129221 ?auto_1129227 ) ) ( not ( = ?auto_1129221 ?auto_1129228 ) ) ( not ( = ?auto_1129221 ?auto_1129234 ) ) ( not ( = ?auto_1129218 ?auto_1129222 ) ) ( not ( = ?auto_1129218 ?auto_1129224 ) ) ( not ( = ?auto_1129218 ?auto_1129223 ) ) ( not ( = ?auto_1129218 ?auto_1129225 ) ) ( not ( = ?auto_1129218 ?auto_1129226 ) ) ( not ( = ?auto_1129218 ?auto_1129227 ) ) ( not ( = ?auto_1129218 ?auto_1129228 ) ) ( not ( = ?auto_1129218 ?auto_1129234 ) ) ( not ( = ?auto_1129222 ?auto_1129224 ) ) ( not ( = ?auto_1129222 ?auto_1129223 ) ) ( not ( = ?auto_1129222 ?auto_1129225 ) ) ( not ( = ?auto_1129222 ?auto_1129226 ) ) ( not ( = ?auto_1129222 ?auto_1129227 ) ) ( not ( = ?auto_1129222 ?auto_1129228 ) ) ( not ( = ?auto_1129222 ?auto_1129234 ) ) ( not ( = ?auto_1129224 ?auto_1129223 ) ) ( not ( = ?auto_1129224 ?auto_1129225 ) ) ( not ( = ?auto_1129224 ?auto_1129226 ) ) ( not ( = ?auto_1129224 ?auto_1129227 ) ) ( not ( = ?auto_1129224 ?auto_1129228 ) ) ( not ( = ?auto_1129224 ?auto_1129234 ) ) ( not ( = ?auto_1129223 ?auto_1129225 ) ) ( not ( = ?auto_1129223 ?auto_1129226 ) ) ( not ( = ?auto_1129223 ?auto_1129227 ) ) ( not ( = ?auto_1129223 ?auto_1129228 ) ) ( not ( = ?auto_1129223 ?auto_1129234 ) ) ( not ( = ?auto_1129225 ?auto_1129226 ) ) ( not ( = ?auto_1129225 ?auto_1129227 ) ) ( not ( = ?auto_1129225 ?auto_1129228 ) ) ( not ( = ?auto_1129225 ?auto_1129234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129226 ?auto_1129227 ?auto_1129228 )
      ( MAKE-10CRATE-VERIFY ?auto_1129219 ?auto_1129220 ?auto_1129221 ?auto_1129218 ?auto_1129222 ?auto_1129224 ?auto_1129223 ?auto_1129225 ?auto_1129226 ?auto_1129227 ?auto_1129228 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1129345 - SURFACE
      ?auto_1129346 - SURFACE
      ?auto_1129347 - SURFACE
      ?auto_1129344 - SURFACE
      ?auto_1129348 - SURFACE
      ?auto_1129350 - SURFACE
      ?auto_1129349 - SURFACE
      ?auto_1129351 - SURFACE
      ?auto_1129352 - SURFACE
      ?auto_1129353 - SURFACE
      ?auto_1129354 - SURFACE
    )
    :vars
    (
      ?auto_1129359 - HOIST
      ?auto_1129357 - PLACE
      ?auto_1129355 - PLACE
      ?auto_1129358 - HOIST
      ?auto_1129356 - SURFACE
      ?auto_1129360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129359 ?auto_1129357 ) ( IS-CRATE ?auto_1129354 ) ( not ( = ?auto_1129353 ?auto_1129354 ) ) ( not ( = ?auto_1129352 ?auto_1129353 ) ) ( not ( = ?auto_1129352 ?auto_1129354 ) ) ( not ( = ?auto_1129355 ?auto_1129357 ) ) ( HOIST-AT ?auto_1129358 ?auto_1129355 ) ( not ( = ?auto_1129359 ?auto_1129358 ) ) ( AVAILABLE ?auto_1129358 ) ( SURFACE-AT ?auto_1129354 ?auto_1129355 ) ( ON ?auto_1129354 ?auto_1129356 ) ( CLEAR ?auto_1129354 ) ( not ( = ?auto_1129353 ?auto_1129356 ) ) ( not ( = ?auto_1129354 ?auto_1129356 ) ) ( not ( = ?auto_1129352 ?auto_1129356 ) ) ( TRUCK-AT ?auto_1129360 ?auto_1129357 ) ( SURFACE-AT ?auto_1129352 ?auto_1129357 ) ( CLEAR ?auto_1129352 ) ( LIFTING ?auto_1129359 ?auto_1129353 ) ( IS-CRATE ?auto_1129353 ) ( ON ?auto_1129346 ?auto_1129345 ) ( ON ?auto_1129347 ?auto_1129346 ) ( ON ?auto_1129344 ?auto_1129347 ) ( ON ?auto_1129348 ?auto_1129344 ) ( ON ?auto_1129350 ?auto_1129348 ) ( ON ?auto_1129349 ?auto_1129350 ) ( ON ?auto_1129351 ?auto_1129349 ) ( ON ?auto_1129352 ?auto_1129351 ) ( not ( = ?auto_1129345 ?auto_1129346 ) ) ( not ( = ?auto_1129345 ?auto_1129347 ) ) ( not ( = ?auto_1129345 ?auto_1129344 ) ) ( not ( = ?auto_1129345 ?auto_1129348 ) ) ( not ( = ?auto_1129345 ?auto_1129350 ) ) ( not ( = ?auto_1129345 ?auto_1129349 ) ) ( not ( = ?auto_1129345 ?auto_1129351 ) ) ( not ( = ?auto_1129345 ?auto_1129352 ) ) ( not ( = ?auto_1129345 ?auto_1129353 ) ) ( not ( = ?auto_1129345 ?auto_1129354 ) ) ( not ( = ?auto_1129345 ?auto_1129356 ) ) ( not ( = ?auto_1129346 ?auto_1129347 ) ) ( not ( = ?auto_1129346 ?auto_1129344 ) ) ( not ( = ?auto_1129346 ?auto_1129348 ) ) ( not ( = ?auto_1129346 ?auto_1129350 ) ) ( not ( = ?auto_1129346 ?auto_1129349 ) ) ( not ( = ?auto_1129346 ?auto_1129351 ) ) ( not ( = ?auto_1129346 ?auto_1129352 ) ) ( not ( = ?auto_1129346 ?auto_1129353 ) ) ( not ( = ?auto_1129346 ?auto_1129354 ) ) ( not ( = ?auto_1129346 ?auto_1129356 ) ) ( not ( = ?auto_1129347 ?auto_1129344 ) ) ( not ( = ?auto_1129347 ?auto_1129348 ) ) ( not ( = ?auto_1129347 ?auto_1129350 ) ) ( not ( = ?auto_1129347 ?auto_1129349 ) ) ( not ( = ?auto_1129347 ?auto_1129351 ) ) ( not ( = ?auto_1129347 ?auto_1129352 ) ) ( not ( = ?auto_1129347 ?auto_1129353 ) ) ( not ( = ?auto_1129347 ?auto_1129354 ) ) ( not ( = ?auto_1129347 ?auto_1129356 ) ) ( not ( = ?auto_1129344 ?auto_1129348 ) ) ( not ( = ?auto_1129344 ?auto_1129350 ) ) ( not ( = ?auto_1129344 ?auto_1129349 ) ) ( not ( = ?auto_1129344 ?auto_1129351 ) ) ( not ( = ?auto_1129344 ?auto_1129352 ) ) ( not ( = ?auto_1129344 ?auto_1129353 ) ) ( not ( = ?auto_1129344 ?auto_1129354 ) ) ( not ( = ?auto_1129344 ?auto_1129356 ) ) ( not ( = ?auto_1129348 ?auto_1129350 ) ) ( not ( = ?auto_1129348 ?auto_1129349 ) ) ( not ( = ?auto_1129348 ?auto_1129351 ) ) ( not ( = ?auto_1129348 ?auto_1129352 ) ) ( not ( = ?auto_1129348 ?auto_1129353 ) ) ( not ( = ?auto_1129348 ?auto_1129354 ) ) ( not ( = ?auto_1129348 ?auto_1129356 ) ) ( not ( = ?auto_1129350 ?auto_1129349 ) ) ( not ( = ?auto_1129350 ?auto_1129351 ) ) ( not ( = ?auto_1129350 ?auto_1129352 ) ) ( not ( = ?auto_1129350 ?auto_1129353 ) ) ( not ( = ?auto_1129350 ?auto_1129354 ) ) ( not ( = ?auto_1129350 ?auto_1129356 ) ) ( not ( = ?auto_1129349 ?auto_1129351 ) ) ( not ( = ?auto_1129349 ?auto_1129352 ) ) ( not ( = ?auto_1129349 ?auto_1129353 ) ) ( not ( = ?auto_1129349 ?auto_1129354 ) ) ( not ( = ?auto_1129349 ?auto_1129356 ) ) ( not ( = ?auto_1129351 ?auto_1129352 ) ) ( not ( = ?auto_1129351 ?auto_1129353 ) ) ( not ( = ?auto_1129351 ?auto_1129354 ) ) ( not ( = ?auto_1129351 ?auto_1129356 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129352 ?auto_1129353 ?auto_1129354 )
      ( MAKE-10CRATE-VERIFY ?auto_1129345 ?auto_1129346 ?auto_1129347 ?auto_1129344 ?auto_1129348 ?auto_1129350 ?auto_1129349 ?auto_1129351 ?auto_1129352 ?auto_1129353 ?auto_1129354 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1129471 - SURFACE
      ?auto_1129472 - SURFACE
      ?auto_1129473 - SURFACE
      ?auto_1129470 - SURFACE
      ?auto_1129474 - SURFACE
      ?auto_1129476 - SURFACE
      ?auto_1129475 - SURFACE
      ?auto_1129477 - SURFACE
      ?auto_1129478 - SURFACE
      ?auto_1129479 - SURFACE
      ?auto_1129480 - SURFACE
    )
    :vars
    (
      ?auto_1129486 - HOIST
      ?auto_1129484 - PLACE
      ?auto_1129485 - PLACE
      ?auto_1129481 - HOIST
      ?auto_1129483 - SURFACE
      ?auto_1129482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129486 ?auto_1129484 ) ( IS-CRATE ?auto_1129480 ) ( not ( = ?auto_1129479 ?auto_1129480 ) ) ( not ( = ?auto_1129478 ?auto_1129479 ) ) ( not ( = ?auto_1129478 ?auto_1129480 ) ) ( not ( = ?auto_1129485 ?auto_1129484 ) ) ( HOIST-AT ?auto_1129481 ?auto_1129485 ) ( not ( = ?auto_1129486 ?auto_1129481 ) ) ( AVAILABLE ?auto_1129481 ) ( SURFACE-AT ?auto_1129480 ?auto_1129485 ) ( ON ?auto_1129480 ?auto_1129483 ) ( CLEAR ?auto_1129480 ) ( not ( = ?auto_1129479 ?auto_1129483 ) ) ( not ( = ?auto_1129480 ?auto_1129483 ) ) ( not ( = ?auto_1129478 ?auto_1129483 ) ) ( TRUCK-AT ?auto_1129482 ?auto_1129484 ) ( SURFACE-AT ?auto_1129478 ?auto_1129484 ) ( CLEAR ?auto_1129478 ) ( IS-CRATE ?auto_1129479 ) ( AVAILABLE ?auto_1129486 ) ( IN ?auto_1129479 ?auto_1129482 ) ( ON ?auto_1129472 ?auto_1129471 ) ( ON ?auto_1129473 ?auto_1129472 ) ( ON ?auto_1129470 ?auto_1129473 ) ( ON ?auto_1129474 ?auto_1129470 ) ( ON ?auto_1129476 ?auto_1129474 ) ( ON ?auto_1129475 ?auto_1129476 ) ( ON ?auto_1129477 ?auto_1129475 ) ( ON ?auto_1129478 ?auto_1129477 ) ( not ( = ?auto_1129471 ?auto_1129472 ) ) ( not ( = ?auto_1129471 ?auto_1129473 ) ) ( not ( = ?auto_1129471 ?auto_1129470 ) ) ( not ( = ?auto_1129471 ?auto_1129474 ) ) ( not ( = ?auto_1129471 ?auto_1129476 ) ) ( not ( = ?auto_1129471 ?auto_1129475 ) ) ( not ( = ?auto_1129471 ?auto_1129477 ) ) ( not ( = ?auto_1129471 ?auto_1129478 ) ) ( not ( = ?auto_1129471 ?auto_1129479 ) ) ( not ( = ?auto_1129471 ?auto_1129480 ) ) ( not ( = ?auto_1129471 ?auto_1129483 ) ) ( not ( = ?auto_1129472 ?auto_1129473 ) ) ( not ( = ?auto_1129472 ?auto_1129470 ) ) ( not ( = ?auto_1129472 ?auto_1129474 ) ) ( not ( = ?auto_1129472 ?auto_1129476 ) ) ( not ( = ?auto_1129472 ?auto_1129475 ) ) ( not ( = ?auto_1129472 ?auto_1129477 ) ) ( not ( = ?auto_1129472 ?auto_1129478 ) ) ( not ( = ?auto_1129472 ?auto_1129479 ) ) ( not ( = ?auto_1129472 ?auto_1129480 ) ) ( not ( = ?auto_1129472 ?auto_1129483 ) ) ( not ( = ?auto_1129473 ?auto_1129470 ) ) ( not ( = ?auto_1129473 ?auto_1129474 ) ) ( not ( = ?auto_1129473 ?auto_1129476 ) ) ( not ( = ?auto_1129473 ?auto_1129475 ) ) ( not ( = ?auto_1129473 ?auto_1129477 ) ) ( not ( = ?auto_1129473 ?auto_1129478 ) ) ( not ( = ?auto_1129473 ?auto_1129479 ) ) ( not ( = ?auto_1129473 ?auto_1129480 ) ) ( not ( = ?auto_1129473 ?auto_1129483 ) ) ( not ( = ?auto_1129470 ?auto_1129474 ) ) ( not ( = ?auto_1129470 ?auto_1129476 ) ) ( not ( = ?auto_1129470 ?auto_1129475 ) ) ( not ( = ?auto_1129470 ?auto_1129477 ) ) ( not ( = ?auto_1129470 ?auto_1129478 ) ) ( not ( = ?auto_1129470 ?auto_1129479 ) ) ( not ( = ?auto_1129470 ?auto_1129480 ) ) ( not ( = ?auto_1129470 ?auto_1129483 ) ) ( not ( = ?auto_1129474 ?auto_1129476 ) ) ( not ( = ?auto_1129474 ?auto_1129475 ) ) ( not ( = ?auto_1129474 ?auto_1129477 ) ) ( not ( = ?auto_1129474 ?auto_1129478 ) ) ( not ( = ?auto_1129474 ?auto_1129479 ) ) ( not ( = ?auto_1129474 ?auto_1129480 ) ) ( not ( = ?auto_1129474 ?auto_1129483 ) ) ( not ( = ?auto_1129476 ?auto_1129475 ) ) ( not ( = ?auto_1129476 ?auto_1129477 ) ) ( not ( = ?auto_1129476 ?auto_1129478 ) ) ( not ( = ?auto_1129476 ?auto_1129479 ) ) ( not ( = ?auto_1129476 ?auto_1129480 ) ) ( not ( = ?auto_1129476 ?auto_1129483 ) ) ( not ( = ?auto_1129475 ?auto_1129477 ) ) ( not ( = ?auto_1129475 ?auto_1129478 ) ) ( not ( = ?auto_1129475 ?auto_1129479 ) ) ( not ( = ?auto_1129475 ?auto_1129480 ) ) ( not ( = ?auto_1129475 ?auto_1129483 ) ) ( not ( = ?auto_1129477 ?auto_1129478 ) ) ( not ( = ?auto_1129477 ?auto_1129479 ) ) ( not ( = ?auto_1129477 ?auto_1129480 ) ) ( not ( = ?auto_1129477 ?auto_1129483 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1129478 ?auto_1129479 ?auto_1129480 )
      ( MAKE-10CRATE-VERIFY ?auto_1129471 ?auto_1129472 ?auto_1129473 ?auto_1129470 ?auto_1129474 ?auto_1129476 ?auto_1129475 ?auto_1129477 ?auto_1129478 ?auto_1129479 ?auto_1129480 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1130418 - SURFACE
      ?auto_1130419 - SURFACE
    )
    :vars
    (
      ?auto_1130420 - HOIST
      ?auto_1130421 - PLACE
      ?auto_1130426 - SURFACE
      ?auto_1130423 - PLACE
      ?auto_1130422 - HOIST
      ?auto_1130425 - SURFACE
      ?auto_1130424 - TRUCK
      ?auto_1130427 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1130420 ?auto_1130421 ) ( SURFACE-AT ?auto_1130418 ?auto_1130421 ) ( CLEAR ?auto_1130418 ) ( IS-CRATE ?auto_1130419 ) ( not ( = ?auto_1130418 ?auto_1130419 ) ) ( ON ?auto_1130418 ?auto_1130426 ) ( not ( = ?auto_1130426 ?auto_1130418 ) ) ( not ( = ?auto_1130426 ?auto_1130419 ) ) ( not ( = ?auto_1130423 ?auto_1130421 ) ) ( HOIST-AT ?auto_1130422 ?auto_1130423 ) ( not ( = ?auto_1130420 ?auto_1130422 ) ) ( AVAILABLE ?auto_1130422 ) ( SURFACE-AT ?auto_1130419 ?auto_1130423 ) ( ON ?auto_1130419 ?auto_1130425 ) ( CLEAR ?auto_1130419 ) ( not ( = ?auto_1130418 ?auto_1130425 ) ) ( not ( = ?auto_1130419 ?auto_1130425 ) ) ( not ( = ?auto_1130426 ?auto_1130425 ) ) ( TRUCK-AT ?auto_1130424 ?auto_1130421 ) ( LIFTING ?auto_1130420 ?auto_1130427 ) ( IS-CRATE ?auto_1130427 ) ( not ( = ?auto_1130418 ?auto_1130427 ) ) ( not ( = ?auto_1130419 ?auto_1130427 ) ) ( not ( = ?auto_1130426 ?auto_1130427 ) ) ( not ( = ?auto_1130425 ?auto_1130427 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1130420 ?auto_1130427 ?auto_1130424 ?auto_1130421 )
      ( MAKE-1CRATE ?auto_1130418 ?auto_1130419 )
      ( MAKE-1CRATE-VERIFY ?auto_1130418 ?auto_1130419 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1136689 - SURFACE
      ?auto_1136690 - SURFACE
      ?auto_1136691 - SURFACE
      ?auto_1136688 - SURFACE
      ?auto_1136692 - SURFACE
      ?auto_1136694 - SURFACE
      ?auto_1136693 - SURFACE
      ?auto_1136695 - SURFACE
      ?auto_1136696 - SURFACE
      ?auto_1136697 - SURFACE
      ?auto_1136698 - SURFACE
      ?auto_1136699 - SURFACE
    )
    :vars
    (
      ?auto_1136700 - HOIST
      ?auto_1136701 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1136700 ?auto_1136701 ) ( SURFACE-AT ?auto_1136698 ?auto_1136701 ) ( CLEAR ?auto_1136698 ) ( LIFTING ?auto_1136700 ?auto_1136699 ) ( IS-CRATE ?auto_1136699 ) ( not ( = ?auto_1136698 ?auto_1136699 ) ) ( ON ?auto_1136690 ?auto_1136689 ) ( ON ?auto_1136691 ?auto_1136690 ) ( ON ?auto_1136688 ?auto_1136691 ) ( ON ?auto_1136692 ?auto_1136688 ) ( ON ?auto_1136694 ?auto_1136692 ) ( ON ?auto_1136693 ?auto_1136694 ) ( ON ?auto_1136695 ?auto_1136693 ) ( ON ?auto_1136696 ?auto_1136695 ) ( ON ?auto_1136697 ?auto_1136696 ) ( ON ?auto_1136698 ?auto_1136697 ) ( not ( = ?auto_1136689 ?auto_1136690 ) ) ( not ( = ?auto_1136689 ?auto_1136691 ) ) ( not ( = ?auto_1136689 ?auto_1136688 ) ) ( not ( = ?auto_1136689 ?auto_1136692 ) ) ( not ( = ?auto_1136689 ?auto_1136694 ) ) ( not ( = ?auto_1136689 ?auto_1136693 ) ) ( not ( = ?auto_1136689 ?auto_1136695 ) ) ( not ( = ?auto_1136689 ?auto_1136696 ) ) ( not ( = ?auto_1136689 ?auto_1136697 ) ) ( not ( = ?auto_1136689 ?auto_1136698 ) ) ( not ( = ?auto_1136689 ?auto_1136699 ) ) ( not ( = ?auto_1136690 ?auto_1136691 ) ) ( not ( = ?auto_1136690 ?auto_1136688 ) ) ( not ( = ?auto_1136690 ?auto_1136692 ) ) ( not ( = ?auto_1136690 ?auto_1136694 ) ) ( not ( = ?auto_1136690 ?auto_1136693 ) ) ( not ( = ?auto_1136690 ?auto_1136695 ) ) ( not ( = ?auto_1136690 ?auto_1136696 ) ) ( not ( = ?auto_1136690 ?auto_1136697 ) ) ( not ( = ?auto_1136690 ?auto_1136698 ) ) ( not ( = ?auto_1136690 ?auto_1136699 ) ) ( not ( = ?auto_1136691 ?auto_1136688 ) ) ( not ( = ?auto_1136691 ?auto_1136692 ) ) ( not ( = ?auto_1136691 ?auto_1136694 ) ) ( not ( = ?auto_1136691 ?auto_1136693 ) ) ( not ( = ?auto_1136691 ?auto_1136695 ) ) ( not ( = ?auto_1136691 ?auto_1136696 ) ) ( not ( = ?auto_1136691 ?auto_1136697 ) ) ( not ( = ?auto_1136691 ?auto_1136698 ) ) ( not ( = ?auto_1136691 ?auto_1136699 ) ) ( not ( = ?auto_1136688 ?auto_1136692 ) ) ( not ( = ?auto_1136688 ?auto_1136694 ) ) ( not ( = ?auto_1136688 ?auto_1136693 ) ) ( not ( = ?auto_1136688 ?auto_1136695 ) ) ( not ( = ?auto_1136688 ?auto_1136696 ) ) ( not ( = ?auto_1136688 ?auto_1136697 ) ) ( not ( = ?auto_1136688 ?auto_1136698 ) ) ( not ( = ?auto_1136688 ?auto_1136699 ) ) ( not ( = ?auto_1136692 ?auto_1136694 ) ) ( not ( = ?auto_1136692 ?auto_1136693 ) ) ( not ( = ?auto_1136692 ?auto_1136695 ) ) ( not ( = ?auto_1136692 ?auto_1136696 ) ) ( not ( = ?auto_1136692 ?auto_1136697 ) ) ( not ( = ?auto_1136692 ?auto_1136698 ) ) ( not ( = ?auto_1136692 ?auto_1136699 ) ) ( not ( = ?auto_1136694 ?auto_1136693 ) ) ( not ( = ?auto_1136694 ?auto_1136695 ) ) ( not ( = ?auto_1136694 ?auto_1136696 ) ) ( not ( = ?auto_1136694 ?auto_1136697 ) ) ( not ( = ?auto_1136694 ?auto_1136698 ) ) ( not ( = ?auto_1136694 ?auto_1136699 ) ) ( not ( = ?auto_1136693 ?auto_1136695 ) ) ( not ( = ?auto_1136693 ?auto_1136696 ) ) ( not ( = ?auto_1136693 ?auto_1136697 ) ) ( not ( = ?auto_1136693 ?auto_1136698 ) ) ( not ( = ?auto_1136693 ?auto_1136699 ) ) ( not ( = ?auto_1136695 ?auto_1136696 ) ) ( not ( = ?auto_1136695 ?auto_1136697 ) ) ( not ( = ?auto_1136695 ?auto_1136698 ) ) ( not ( = ?auto_1136695 ?auto_1136699 ) ) ( not ( = ?auto_1136696 ?auto_1136697 ) ) ( not ( = ?auto_1136696 ?auto_1136698 ) ) ( not ( = ?auto_1136696 ?auto_1136699 ) ) ( not ( = ?auto_1136697 ?auto_1136698 ) ) ( not ( = ?auto_1136697 ?auto_1136699 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1136698 ?auto_1136699 )
      ( MAKE-11CRATE-VERIFY ?auto_1136689 ?auto_1136690 ?auto_1136691 ?auto_1136688 ?auto_1136692 ?auto_1136694 ?auto_1136693 ?auto_1136695 ?auto_1136696 ?auto_1136697 ?auto_1136698 ?auto_1136699 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1136798 - SURFACE
      ?auto_1136799 - SURFACE
      ?auto_1136800 - SURFACE
      ?auto_1136797 - SURFACE
      ?auto_1136801 - SURFACE
      ?auto_1136803 - SURFACE
      ?auto_1136802 - SURFACE
      ?auto_1136804 - SURFACE
      ?auto_1136805 - SURFACE
      ?auto_1136806 - SURFACE
      ?auto_1136807 - SURFACE
      ?auto_1136808 - SURFACE
    )
    :vars
    (
      ?auto_1136809 - HOIST
      ?auto_1136810 - PLACE
      ?auto_1136811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1136809 ?auto_1136810 ) ( SURFACE-AT ?auto_1136807 ?auto_1136810 ) ( CLEAR ?auto_1136807 ) ( IS-CRATE ?auto_1136808 ) ( not ( = ?auto_1136807 ?auto_1136808 ) ) ( TRUCK-AT ?auto_1136811 ?auto_1136810 ) ( AVAILABLE ?auto_1136809 ) ( IN ?auto_1136808 ?auto_1136811 ) ( ON ?auto_1136807 ?auto_1136806 ) ( not ( = ?auto_1136806 ?auto_1136807 ) ) ( not ( = ?auto_1136806 ?auto_1136808 ) ) ( ON ?auto_1136799 ?auto_1136798 ) ( ON ?auto_1136800 ?auto_1136799 ) ( ON ?auto_1136797 ?auto_1136800 ) ( ON ?auto_1136801 ?auto_1136797 ) ( ON ?auto_1136803 ?auto_1136801 ) ( ON ?auto_1136802 ?auto_1136803 ) ( ON ?auto_1136804 ?auto_1136802 ) ( ON ?auto_1136805 ?auto_1136804 ) ( ON ?auto_1136806 ?auto_1136805 ) ( not ( = ?auto_1136798 ?auto_1136799 ) ) ( not ( = ?auto_1136798 ?auto_1136800 ) ) ( not ( = ?auto_1136798 ?auto_1136797 ) ) ( not ( = ?auto_1136798 ?auto_1136801 ) ) ( not ( = ?auto_1136798 ?auto_1136803 ) ) ( not ( = ?auto_1136798 ?auto_1136802 ) ) ( not ( = ?auto_1136798 ?auto_1136804 ) ) ( not ( = ?auto_1136798 ?auto_1136805 ) ) ( not ( = ?auto_1136798 ?auto_1136806 ) ) ( not ( = ?auto_1136798 ?auto_1136807 ) ) ( not ( = ?auto_1136798 ?auto_1136808 ) ) ( not ( = ?auto_1136799 ?auto_1136800 ) ) ( not ( = ?auto_1136799 ?auto_1136797 ) ) ( not ( = ?auto_1136799 ?auto_1136801 ) ) ( not ( = ?auto_1136799 ?auto_1136803 ) ) ( not ( = ?auto_1136799 ?auto_1136802 ) ) ( not ( = ?auto_1136799 ?auto_1136804 ) ) ( not ( = ?auto_1136799 ?auto_1136805 ) ) ( not ( = ?auto_1136799 ?auto_1136806 ) ) ( not ( = ?auto_1136799 ?auto_1136807 ) ) ( not ( = ?auto_1136799 ?auto_1136808 ) ) ( not ( = ?auto_1136800 ?auto_1136797 ) ) ( not ( = ?auto_1136800 ?auto_1136801 ) ) ( not ( = ?auto_1136800 ?auto_1136803 ) ) ( not ( = ?auto_1136800 ?auto_1136802 ) ) ( not ( = ?auto_1136800 ?auto_1136804 ) ) ( not ( = ?auto_1136800 ?auto_1136805 ) ) ( not ( = ?auto_1136800 ?auto_1136806 ) ) ( not ( = ?auto_1136800 ?auto_1136807 ) ) ( not ( = ?auto_1136800 ?auto_1136808 ) ) ( not ( = ?auto_1136797 ?auto_1136801 ) ) ( not ( = ?auto_1136797 ?auto_1136803 ) ) ( not ( = ?auto_1136797 ?auto_1136802 ) ) ( not ( = ?auto_1136797 ?auto_1136804 ) ) ( not ( = ?auto_1136797 ?auto_1136805 ) ) ( not ( = ?auto_1136797 ?auto_1136806 ) ) ( not ( = ?auto_1136797 ?auto_1136807 ) ) ( not ( = ?auto_1136797 ?auto_1136808 ) ) ( not ( = ?auto_1136801 ?auto_1136803 ) ) ( not ( = ?auto_1136801 ?auto_1136802 ) ) ( not ( = ?auto_1136801 ?auto_1136804 ) ) ( not ( = ?auto_1136801 ?auto_1136805 ) ) ( not ( = ?auto_1136801 ?auto_1136806 ) ) ( not ( = ?auto_1136801 ?auto_1136807 ) ) ( not ( = ?auto_1136801 ?auto_1136808 ) ) ( not ( = ?auto_1136803 ?auto_1136802 ) ) ( not ( = ?auto_1136803 ?auto_1136804 ) ) ( not ( = ?auto_1136803 ?auto_1136805 ) ) ( not ( = ?auto_1136803 ?auto_1136806 ) ) ( not ( = ?auto_1136803 ?auto_1136807 ) ) ( not ( = ?auto_1136803 ?auto_1136808 ) ) ( not ( = ?auto_1136802 ?auto_1136804 ) ) ( not ( = ?auto_1136802 ?auto_1136805 ) ) ( not ( = ?auto_1136802 ?auto_1136806 ) ) ( not ( = ?auto_1136802 ?auto_1136807 ) ) ( not ( = ?auto_1136802 ?auto_1136808 ) ) ( not ( = ?auto_1136804 ?auto_1136805 ) ) ( not ( = ?auto_1136804 ?auto_1136806 ) ) ( not ( = ?auto_1136804 ?auto_1136807 ) ) ( not ( = ?auto_1136804 ?auto_1136808 ) ) ( not ( = ?auto_1136805 ?auto_1136806 ) ) ( not ( = ?auto_1136805 ?auto_1136807 ) ) ( not ( = ?auto_1136805 ?auto_1136808 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1136806 ?auto_1136807 ?auto_1136808 )
      ( MAKE-11CRATE-VERIFY ?auto_1136798 ?auto_1136799 ?auto_1136800 ?auto_1136797 ?auto_1136801 ?auto_1136803 ?auto_1136802 ?auto_1136804 ?auto_1136805 ?auto_1136806 ?auto_1136807 ?auto_1136808 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1136919 - SURFACE
      ?auto_1136920 - SURFACE
      ?auto_1136921 - SURFACE
      ?auto_1136918 - SURFACE
      ?auto_1136922 - SURFACE
      ?auto_1136924 - SURFACE
      ?auto_1136923 - SURFACE
      ?auto_1136925 - SURFACE
      ?auto_1136926 - SURFACE
      ?auto_1136927 - SURFACE
      ?auto_1136928 - SURFACE
      ?auto_1136929 - SURFACE
    )
    :vars
    (
      ?auto_1136931 - HOIST
      ?auto_1136930 - PLACE
      ?auto_1136932 - TRUCK
      ?auto_1136933 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1136931 ?auto_1136930 ) ( SURFACE-AT ?auto_1136928 ?auto_1136930 ) ( CLEAR ?auto_1136928 ) ( IS-CRATE ?auto_1136929 ) ( not ( = ?auto_1136928 ?auto_1136929 ) ) ( AVAILABLE ?auto_1136931 ) ( IN ?auto_1136929 ?auto_1136932 ) ( ON ?auto_1136928 ?auto_1136927 ) ( not ( = ?auto_1136927 ?auto_1136928 ) ) ( not ( = ?auto_1136927 ?auto_1136929 ) ) ( TRUCK-AT ?auto_1136932 ?auto_1136933 ) ( not ( = ?auto_1136933 ?auto_1136930 ) ) ( ON ?auto_1136920 ?auto_1136919 ) ( ON ?auto_1136921 ?auto_1136920 ) ( ON ?auto_1136918 ?auto_1136921 ) ( ON ?auto_1136922 ?auto_1136918 ) ( ON ?auto_1136924 ?auto_1136922 ) ( ON ?auto_1136923 ?auto_1136924 ) ( ON ?auto_1136925 ?auto_1136923 ) ( ON ?auto_1136926 ?auto_1136925 ) ( ON ?auto_1136927 ?auto_1136926 ) ( not ( = ?auto_1136919 ?auto_1136920 ) ) ( not ( = ?auto_1136919 ?auto_1136921 ) ) ( not ( = ?auto_1136919 ?auto_1136918 ) ) ( not ( = ?auto_1136919 ?auto_1136922 ) ) ( not ( = ?auto_1136919 ?auto_1136924 ) ) ( not ( = ?auto_1136919 ?auto_1136923 ) ) ( not ( = ?auto_1136919 ?auto_1136925 ) ) ( not ( = ?auto_1136919 ?auto_1136926 ) ) ( not ( = ?auto_1136919 ?auto_1136927 ) ) ( not ( = ?auto_1136919 ?auto_1136928 ) ) ( not ( = ?auto_1136919 ?auto_1136929 ) ) ( not ( = ?auto_1136920 ?auto_1136921 ) ) ( not ( = ?auto_1136920 ?auto_1136918 ) ) ( not ( = ?auto_1136920 ?auto_1136922 ) ) ( not ( = ?auto_1136920 ?auto_1136924 ) ) ( not ( = ?auto_1136920 ?auto_1136923 ) ) ( not ( = ?auto_1136920 ?auto_1136925 ) ) ( not ( = ?auto_1136920 ?auto_1136926 ) ) ( not ( = ?auto_1136920 ?auto_1136927 ) ) ( not ( = ?auto_1136920 ?auto_1136928 ) ) ( not ( = ?auto_1136920 ?auto_1136929 ) ) ( not ( = ?auto_1136921 ?auto_1136918 ) ) ( not ( = ?auto_1136921 ?auto_1136922 ) ) ( not ( = ?auto_1136921 ?auto_1136924 ) ) ( not ( = ?auto_1136921 ?auto_1136923 ) ) ( not ( = ?auto_1136921 ?auto_1136925 ) ) ( not ( = ?auto_1136921 ?auto_1136926 ) ) ( not ( = ?auto_1136921 ?auto_1136927 ) ) ( not ( = ?auto_1136921 ?auto_1136928 ) ) ( not ( = ?auto_1136921 ?auto_1136929 ) ) ( not ( = ?auto_1136918 ?auto_1136922 ) ) ( not ( = ?auto_1136918 ?auto_1136924 ) ) ( not ( = ?auto_1136918 ?auto_1136923 ) ) ( not ( = ?auto_1136918 ?auto_1136925 ) ) ( not ( = ?auto_1136918 ?auto_1136926 ) ) ( not ( = ?auto_1136918 ?auto_1136927 ) ) ( not ( = ?auto_1136918 ?auto_1136928 ) ) ( not ( = ?auto_1136918 ?auto_1136929 ) ) ( not ( = ?auto_1136922 ?auto_1136924 ) ) ( not ( = ?auto_1136922 ?auto_1136923 ) ) ( not ( = ?auto_1136922 ?auto_1136925 ) ) ( not ( = ?auto_1136922 ?auto_1136926 ) ) ( not ( = ?auto_1136922 ?auto_1136927 ) ) ( not ( = ?auto_1136922 ?auto_1136928 ) ) ( not ( = ?auto_1136922 ?auto_1136929 ) ) ( not ( = ?auto_1136924 ?auto_1136923 ) ) ( not ( = ?auto_1136924 ?auto_1136925 ) ) ( not ( = ?auto_1136924 ?auto_1136926 ) ) ( not ( = ?auto_1136924 ?auto_1136927 ) ) ( not ( = ?auto_1136924 ?auto_1136928 ) ) ( not ( = ?auto_1136924 ?auto_1136929 ) ) ( not ( = ?auto_1136923 ?auto_1136925 ) ) ( not ( = ?auto_1136923 ?auto_1136926 ) ) ( not ( = ?auto_1136923 ?auto_1136927 ) ) ( not ( = ?auto_1136923 ?auto_1136928 ) ) ( not ( = ?auto_1136923 ?auto_1136929 ) ) ( not ( = ?auto_1136925 ?auto_1136926 ) ) ( not ( = ?auto_1136925 ?auto_1136927 ) ) ( not ( = ?auto_1136925 ?auto_1136928 ) ) ( not ( = ?auto_1136925 ?auto_1136929 ) ) ( not ( = ?auto_1136926 ?auto_1136927 ) ) ( not ( = ?auto_1136926 ?auto_1136928 ) ) ( not ( = ?auto_1136926 ?auto_1136929 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1136927 ?auto_1136928 ?auto_1136929 )
      ( MAKE-11CRATE-VERIFY ?auto_1136919 ?auto_1136920 ?auto_1136921 ?auto_1136918 ?auto_1136922 ?auto_1136924 ?auto_1136923 ?auto_1136925 ?auto_1136926 ?auto_1136927 ?auto_1136928 ?auto_1136929 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1137051 - SURFACE
      ?auto_1137052 - SURFACE
      ?auto_1137053 - SURFACE
      ?auto_1137050 - SURFACE
      ?auto_1137054 - SURFACE
      ?auto_1137056 - SURFACE
      ?auto_1137055 - SURFACE
      ?auto_1137057 - SURFACE
      ?auto_1137058 - SURFACE
      ?auto_1137059 - SURFACE
      ?auto_1137060 - SURFACE
      ?auto_1137061 - SURFACE
    )
    :vars
    (
      ?auto_1137066 - HOIST
      ?auto_1137065 - PLACE
      ?auto_1137064 - TRUCK
      ?auto_1137063 - PLACE
      ?auto_1137062 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1137066 ?auto_1137065 ) ( SURFACE-AT ?auto_1137060 ?auto_1137065 ) ( CLEAR ?auto_1137060 ) ( IS-CRATE ?auto_1137061 ) ( not ( = ?auto_1137060 ?auto_1137061 ) ) ( AVAILABLE ?auto_1137066 ) ( ON ?auto_1137060 ?auto_1137059 ) ( not ( = ?auto_1137059 ?auto_1137060 ) ) ( not ( = ?auto_1137059 ?auto_1137061 ) ) ( TRUCK-AT ?auto_1137064 ?auto_1137063 ) ( not ( = ?auto_1137063 ?auto_1137065 ) ) ( HOIST-AT ?auto_1137062 ?auto_1137063 ) ( LIFTING ?auto_1137062 ?auto_1137061 ) ( not ( = ?auto_1137066 ?auto_1137062 ) ) ( ON ?auto_1137052 ?auto_1137051 ) ( ON ?auto_1137053 ?auto_1137052 ) ( ON ?auto_1137050 ?auto_1137053 ) ( ON ?auto_1137054 ?auto_1137050 ) ( ON ?auto_1137056 ?auto_1137054 ) ( ON ?auto_1137055 ?auto_1137056 ) ( ON ?auto_1137057 ?auto_1137055 ) ( ON ?auto_1137058 ?auto_1137057 ) ( ON ?auto_1137059 ?auto_1137058 ) ( not ( = ?auto_1137051 ?auto_1137052 ) ) ( not ( = ?auto_1137051 ?auto_1137053 ) ) ( not ( = ?auto_1137051 ?auto_1137050 ) ) ( not ( = ?auto_1137051 ?auto_1137054 ) ) ( not ( = ?auto_1137051 ?auto_1137056 ) ) ( not ( = ?auto_1137051 ?auto_1137055 ) ) ( not ( = ?auto_1137051 ?auto_1137057 ) ) ( not ( = ?auto_1137051 ?auto_1137058 ) ) ( not ( = ?auto_1137051 ?auto_1137059 ) ) ( not ( = ?auto_1137051 ?auto_1137060 ) ) ( not ( = ?auto_1137051 ?auto_1137061 ) ) ( not ( = ?auto_1137052 ?auto_1137053 ) ) ( not ( = ?auto_1137052 ?auto_1137050 ) ) ( not ( = ?auto_1137052 ?auto_1137054 ) ) ( not ( = ?auto_1137052 ?auto_1137056 ) ) ( not ( = ?auto_1137052 ?auto_1137055 ) ) ( not ( = ?auto_1137052 ?auto_1137057 ) ) ( not ( = ?auto_1137052 ?auto_1137058 ) ) ( not ( = ?auto_1137052 ?auto_1137059 ) ) ( not ( = ?auto_1137052 ?auto_1137060 ) ) ( not ( = ?auto_1137052 ?auto_1137061 ) ) ( not ( = ?auto_1137053 ?auto_1137050 ) ) ( not ( = ?auto_1137053 ?auto_1137054 ) ) ( not ( = ?auto_1137053 ?auto_1137056 ) ) ( not ( = ?auto_1137053 ?auto_1137055 ) ) ( not ( = ?auto_1137053 ?auto_1137057 ) ) ( not ( = ?auto_1137053 ?auto_1137058 ) ) ( not ( = ?auto_1137053 ?auto_1137059 ) ) ( not ( = ?auto_1137053 ?auto_1137060 ) ) ( not ( = ?auto_1137053 ?auto_1137061 ) ) ( not ( = ?auto_1137050 ?auto_1137054 ) ) ( not ( = ?auto_1137050 ?auto_1137056 ) ) ( not ( = ?auto_1137050 ?auto_1137055 ) ) ( not ( = ?auto_1137050 ?auto_1137057 ) ) ( not ( = ?auto_1137050 ?auto_1137058 ) ) ( not ( = ?auto_1137050 ?auto_1137059 ) ) ( not ( = ?auto_1137050 ?auto_1137060 ) ) ( not ( = ?auto_1137050 ?auto_1137061 ) ) ( not ( = ?auto_1137054 ?auto_1137056 ) ) ( not ( = ?auto_1137054 ?auto_1137055 ) ) ( not ( = ?auto_1137054 ?auto_1137057 ) ) ( not ( = ?auto_1137054 ?auto_1137058 ) ) ( not ( = ?auto_1137054 ?auto_1137059 ) ) ( not ( = ?auto_1137054 ?auto_1137060 ) ) ( not ( = ?auto_1137054 ?auto_1137061 ) ) ( not ( = ?auto_1137056 ?auto_1137055 ) ) ( not ( = ?auto_1137056 ?auto_1137057 ) ) ( not ( = ?auto_1137056 ?auto_1137058 ) ) ( not ( = ?auto_1137056 ?auto_1137059 ) ) ( not ( = ?auto_1137056 ?auto_1137060 ) ) ( not ( = ?auto_1137056 ?auto_1137061 ) ) ( not ( = ?auto_1137055 ?auto_1137057 ) ) ( not ( = ?auto_1137055 ?auto_1137058 ) ) ( not ( = ?auto_1137055 ?auto_1137059 ) ) ( not ( = ?auto_1137055 ?auto_1137060 ) ) ( not ( = ?auto_1137055 ?auto_1137061 ) ) ( not ( = ?auto_1137057 ?auto_1137058 ) ) ( not ( = ?auto_1137057 ?auto_1137059 ) ) ( not ( = ?auto_1137057 ?auto_1137060 ) ) ( not ( = ?auto_1137057 ?auto_1137061 ) ) ( not ( = ?auto_1137058 ?auto_1137059 ) ) ( not ( = ?auto_1137058 ?auto_1137060 ) ) ( not ( = ?auto_1137058 ?auto_1137061 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1137059 ?auto_1137060 ?auto_1137061 )
      ( MAKE-11CRATE-VERIFY ?auto_1137051 ?auto_1137052 ?auto_1137053 ?auto_1137050 ?auto_1137054 ?auto_1137056 ?auto_1137055 ?auto_1137057 ?auto_1137058 ?auto_1137059 ?auto_1137060 ?auto_1137061 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1137194 - SURFACE
      ?auto_1137195 - SURFACE
      ?auto_1137196 - SURFACE
      ?auto_1137193 - SURFACE
      ?auto_1137197 - SURFACE
      ?auto_1137199 - SURFACE
      ?auto_1137198 - SURFACE
      ?auto_1137200 - SURFACE
      ?auto_1137201 - SURFACE
      ?auto_1137202 - SURFACE
      ?auto_1137203 - SURFACE
      ?auto_1137204 - SURFACE
    )
    :vars
    (
      ?auto_1137210 - HOIST
      ?auto_1137209 - PLACE
      ?auto_1137206 - TRUCK
      ?auto_1137208 - PLACE
      ?auto_1137205 - HOIST
      ?auto_1137207 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1137210 ?auto_1137209 ) ( SURFACE-AT ?auto_1137203 ?auto_1137209 ) ( CLEAR ?auto_1137203 ) ( IS-CRATE ?auto_1137204 ) ( not ( = ?auto_1137203 ?auto_1137204 ) ) ( AVAILABLE ?auto_1137210 ) ( ON ?auto_1137203 ?auto_1137202 ) ( not ( = ?auto_1137202 ?auto_1137203 ) ) ( not ( = ?auto_1137202 ?auto_1137204 ) ) ( TRUCK-AT ?auto_1137206 ?auto_1137208 ) ( not ( = ?auto_1137208 ?auto_1137209 ) ) ( HOIST-AT ?auto_1137205 ?auto_1137208 ) ( not ( = ?auto_1137210 ?auto_1137205 ) ) ( AVAILABLE ?auto_1137205 ) ( SURFACE-AT ?auto_1137204 ?auto_1137208 ) ( ON ?auto_1137204 ?auto_1137207 ) ( CLEAR ?auto_1137204 ) ( not ( = ?auto_1137203 ?auto_1137207 ) ) ( not ( = ?auto_1137204 ?auto_1137207 ) ) ( not ( = ?auto_1137202 ?auto_1137207 ) ) ( ON ?auto_1137195 ?auto_1137194 ) ( ON ?auto_1137196 ?auto_1137195 ) ( ON ?auto_1137193 ?auto_1137196 ) ( ON ?auto_1137197 ?auto_1137193 ) ( ON ?auto_1137199 ?auto_1137197 ) ( ON ?auto_1137198 ?auto_1137199 ) ( ON ?auto_1137200 ?auto_1137198 ) ( ON ?auto_1137201 ?auto_1137200 ) ( ON ?auto_1137202 ?auto_1137201 ) ( not ( = ?auto_1137194 ?auto_1137195 ) ) ( not ( = ?auto_1137194 ?auto_1137196 ) ) ( not ( = ?auto_1137194 ?auto_1137193 ) ) ( not ( = ?auto_1137194 ?auto_1137197 ) ) ( not ( = ?auto_1137194 ?auto_1137199 ) ) ( not ( = ?auto_1137194 ?auto_1137198 ) ) ( not ( = ?auto_1137194 ?auto_1137200 ) ) ( not ( = ?auto_1137194 ?auto_1137201 ) ) ( not ( = ?auto_1137194 ?auto_1137202 ) ) ( not ( = ?auto_1137194 ?auto_1137203 ) ) ( not ( = ?auto_1137194 ?auto_1137204 ) ) ( not ( = ?auto_1137194 ?auto_1137207 ) ) ( not ( = ?auto_1137195 ?auto_1137196 ) ) ( not ( = ?auto_1137195 ?auto_1137193 ) ) ( not ( = ?auto_1137195 ?auto_1137197 ) ) ( not ( = ?auto_1137195 ?auto_1137199 ) ) ( not ( = ?auto_1137195 ?auto_1137198 ) ) ( not ( = ?auto_1137195 ?auto_1137200 ) ) ( not ( = ?auto_1137195 ?auto_1137201 ) ) ( not ( = ?auto_1137195 ?auto_1137202 ) ) ( not ( = ?auto_1137195 ?auto_1137203 ) ) ( not ( = ?auto_1137195 ?auto_1137204 ) ) ( not ( = ?auto_1137195 ?auto_1137207 ) ) ( not ( = ?auto_1137196 ?auto_1137193 ) ) ( not ( = ?auto_1137196 ?auto_1137197 ) ) ( not ( = ?auto_1137196 ?auto_1137199 ) ) ( not ( = ?auto_1137196 ?auto_1137198 ) ) ( not ( = ?auto_1137196 ?auto_1137200 ) ) ( not ( = ?auto_1137196 ?auto_1137201 ) ) ( not ( = ?auto_1137196 ?auto_1137202 ) ) ( not ( = ?auto_1137196 ?auto_1137203 ) ) ( not ( = ?auto_1137196 ?auto_1137204 ) ) ( not ( = ?auto_1137196 ?auto_1137207 ) ) ( not ( = ?auto_1137193 ?auto_1137197 ) ) ( not ( = ?auto_1137193 ?auto_1137199 ) ) ( not ( = ?auto_1137193 ?auto_1137198 ) ) ( not ( = ?auto_1137193 ?auto_1137200 ) ) ( not ( = ?auto_1137193 ?auto_1137201 ) ) ( not ( = ?auto_1137193 ?auto_1137202 ) ) ( not ( = ?auto_1137193 ?auto_1137203 ) ) ( not ( = ?auto_1137193 ?auto_1137204 ) ) ( not ( = ?auto_1137193 ?auto_1137207 ) ) ( not ( = ?auto_1137197 ?auto_1137199 ) ) ( not ( = ?auto_1137197 ?auto_1137198 ) ) ( not ( = ?auto_1137197 ?auto_1137200 ) ) ( not ( = ?auto_1137197 ?auto_1137201 ) ) ( not ( = ?auto_1137197 ?auto_1137202 ) ) ( not ( = ?auto_1137197 ?auto_1137203 ) ) ( not ( = ?auto_1137197 ?auto_1137204 ) ) ( not ( = ?auto_1137197 ?auto_1137207 ) ) ( not ( = ?auto_1137199 ?auto_1137198 ) ) ( not ( = ?auto_1137199 ?auto_1137200 ) ) ( not ( = ?auto_1137199 ?auto_1137201 ) ) ( not ( = ?auto_1137199 ?auto_1137202 ) ) ( not ( = ?auto_1137199 ?auto_1137203 ) ) ( not ( = ?auto_1137199 ?auto_1137204 ) ) ( not ( = ?auto_1137199 ?auto_1137207 ) ) ( not ( = ?auto_1137198 ?auto_1137200 ) ) ( not ( = ?auto_1137198 ?auto_1137201 ) ) ( not ( = ?auto_1137198 ?auto_1137202 ) ) ( not ( = ?auto_1137198 ?auto_1137203 ) ) ( not ( = ?auto_1137198 ?auto_1137204 ) ) ( not ( = ?auto_1137198 ?auto_1137207 ) ) ( not ( = ?auto_1137200 ?auto_1137201 ) ) ( not ( = ?auto_1137200 ?auto_1137202 ) ) ( not ( = ?auto_1137200 ?auto_1137203 ) ) ( not ( = ?auto_1137200 ?auto_1137204 ) ) ( not ( = ?auto_1137200 ?auto_1137207 ) ) ( not ( = ?auto_1137201 ?auto_1137202 ) ) ( not ( = ?auto_1137201 ?auto_1137203 ) ) ( not ( = ?auto_1137201 ?auto_1137204 ) ) ( not ( = ?auto_1137201 ?auto_1137207 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1137202 ?auto_1137203 ?auto_1137204 )
      ( MAKE-11CRATE-VERIFY ?auto_1137194 ?auto_1137195 ?auto_1137196 ?auto_1137193 ?auto_1137197 ?auto_1137199 ?auto_1137198 ?auto_1137200 ?auto_1137201 ?auto_1137202 ?auto_1137203 ?auto_1137204 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1137338 - SURFACE
      ?auto_1137339 - SURFACE
      ?auto_1137340 - SURFACE
      ?auto_1137337 - SURFACE
      ?auto_1137341 - SURFACE
      ?auto_1137343 - SURFACE
      ?auto_1137342 - SURFACE
      ?auto_1137344 - SURFACE
      ?auto_1137345 - SURFACE
      ?auto_1137346 - SURFACE
      ?auto_1137347 - SURFACE
      ?auto_1137348 - SURFACE
    )
    :vars
    (
      ?auto_1137354 - HOIST
      ?auto_1137351 - PLACE
      ?auto_1137350 - PLACE
      ?auto_1137349 - HOIST
      ?auto_1137353 - SURFACE
      ?auto_1137352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1137354 ?auto_1137351 ) ( SURFACE-AT ?auto_1137347 ?auto_1137351 ) ( CLEAR ?auto_1137347 ) ( IS-CRATE ?auto_1137348 ) ( not ( = ?auto_1137347 ?auto_1137348 ) ) ( AVAILABLE ?auto_1137354 ) ( ON ?auto_1137347 ?auto_1137346 ) ( not ( = ?auto_1137346 ?auto_1137347 ) ) ( not ( = ?auto_1137346 ?auto_1137348 ) ) ( not ( = ?auto_1137350 ?auto_1137351 ) ) ( HOIST-AT ?auto_1137349 ?auto_1137350 ) ( not ( = ?auto_1137354 ?auto_1137349 ) ) ( AVAILABLE ?auto_1137349 ) ( SURFACE-AT ?auto_1137348 ?auto_1137350 ) ( ON ?auto_1137348 ?auto_1137353 ) ( CLEAR ?auto_1137348 ) ( not ( = ?auto_1137347 ?auto_1137353 ) ) ( not ( = ?auto_1137348 ?auto_1137353 ) ) ( not ( = ?auto_1137346 ?auto_1137353 ) ) ( TRUCK-AT ?auto_1137352 ?auto_1137351 ) ( ON ?auto_1137339 ?auto_1137338 ) ( ON ?auto_1137340 ?auto_1137339 ) ( ON ?auto_1137337 ?auto_1137340 ) ( ON ?auto_1137341 ?auto_1137337 ) ( ON ?auto_1137343 ?auto_1137341 ) ( ON ?auto_1137342 ?auto_1137343 ) ( ON ?auto_1137344 ?auto_1137342 ) ( ON ?auto_1137345 ?auto_1137344 ) ( ON ?auto_1137346 ?auto_1137345 ) ( not ( = ?auto_1137338 ?auto_1137339 ) ) ( not ( = ?auto_1137338 ?auto_1137340 ) ) ( not ( = ?auto_1137338 ?auto_1137337 ) ) ( not ( = ?auto_1137338 ?auto_1137341 ) ) ( not ( = ?auto_1137338 ?auto_1137343 ) ) ( not ( = ?auto_1137338 ?auto_1137342 ) ) ( not ( = ?auto_1137338 ?auto_1137344 ) ) ( not ( = ?auto_1137338 ?auto_1137345 ) ) ( not ( = ?auto_1137338 ?auto_1137346 ) ) ( not ( = ?auto_1137338 ?auto_1137347 ) ) ( not ( = ?auto_1137338 ?auto_1137348 ) ) ( not ( = ?auto_1137338 ?auto_1137353 ) ) ( not ( = ?auto_1137339 ?auto_1137340 ) ) ( not ( = ?auto_1137339 ?auto_1137337 ) ) ( not ( = ?auto_1137339 ?auto_1137341 ) ) ( not ( = ?auto_1137339 ?auto_1137343 ) ) ( not ( = ?auto_1137339 ?auto_1137342 ) ) ( not ( = ?auto_1137339 ?auto_1137344 ) ) ( not ( = ?auto_1137339 ?auto_1137345 ) ) ( not ( = ?auto_1137339 ?auto_1137346 ) ) ( not ( = ?auto_1137339 ?auto_1137347 ) ) ( not ( = ?auto_1137339 ?auto_1137348 ) ) ( not ( = ?auto_1137339 ?auto_1137353 ) ) ( not ( = ?auto_1137340 ?auto_1137337 ) ) ( not ( = ?auto_1137340 ?auto_1137341 ) ) ( not ( = ?auto_1137340 ?auto_1137343 ) ) ( not ( = ?auto_1137340 ?auto_1137342 ) ) ( not ( = ?auto_1137340 ?auto_1137344 ) ) ( not ( = ?auto_1137340 ?auto_1137345 ) ) ( not ( = ?auto_1137340 ?auto_1137346 ) ) ( not ( = ?auto_1137340 ?auto_1137347 ) ) ( not ( = ?auto_1137340 ?auto_1137348 ) ) ( not ( = ?auto_1137340 ?auto_1137353 ) ) ( not ( = ?auto_1137337 ?auto_1137341 ) ) ( not ( = ?auto_1137337 ?auto_1137343 ) ) ( not ( = ?auto_1137337 ?auto_1137342 ) ) ( not ( = ?auto_1137337 ?auto_1137344 ) ) ( not ( = ?auto_1137337 ?auto_1137345 ) ) ( not ( = ?auto_1137337 ?auto_1137346 ) ) ( not ( = ?auto_1137337 ?auto_1137347 ) ) ( not ( = ?auto_1137337 ?auto_1137348 ) ) ( not ( = ?auto_1137337 ?auto_1137353 ) ) ( not ( = ?auto_1137341 ?auto_1137343 ) ) ( not ( = ?auto_1137341 ?auto_1137342 ) ) ( not ( = ?auto_1137341 ?auto_1137344 ) ) ( not ( = ?auto_1137341 ?auto_1137345 ) ) ( not ( = ?auto_1137341 ?auto_1137346 ) ) ( not ( = ?auto_1137341 ?auto_1137347 ) ) ( not ( = ?auto_1137341 ?auto_1137348 ) ) ( not ( = ?auto_1137341 ?auto_1137353 ) ) ( not ( = ?auto_1137343 ?auto_1137342 ) ) ( not ( = ?auto_1137343 ?auto_1137344 ) ) ( not ( = ?auto_1137343 ?auto_1137345 ) ) ( not ( = ?auto_1137343 ?auto_1137346 ) ) ( not ( = ?auto_1137343 ?auto_1137347 ) ) ( not ( = ?auto_1137343 ?auto_1137348 ) ) ( not ( = ?auto_1137343 ?auto_1137353 ) ) ( not ( = ?auto_1137342 ?auto_1137344 ) ) ( not ( = ?auto_1137342 ?auto_1137345 ) ) ( not ( = ?auto_1137342 ?auto_1137346 ) ) ( not ( = ?auto_1137342 ?auto_1137347 ) ) ( not ( = ?auto_1137342 ?auto_1137348 ) ) ( not ( = ?auto_1137342 ?auto_1137353 ) ) ( not ( = ?auto_1137344 ?auto_1137345 ) ) ( not ( = ?auto_1137344 ?auto_1137346 ) ) ( not ( = ?auto_1137344 ?auto_1137347 ) ) ( not ( = ?auto_1137344 ?auto_1137348 ) ) ( not ( = ?auto_1137344 ?auto_1137353 ) ) ( not ( = ?auto_1137345 ?auto_1137346 ) ) ( not ( = ?auto_1137345 ?auto_1137347 ) ) ( not ( = ?auto_1137345 ?auto_1137348 ) ) ( not ( = ?auto_1137345 ?auto_1137353 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1137346 ?auto_1137347 ?auto_1137348 )
      ( MAKE-11CRATE-VERIFY ?auto_1137338 ?auto_1137339 ?auto_1137340 ?auto_1137337 ?auto_1137341 ?auto_1137343 ?auto_1137342 ?auto_1137344 ?auto_1137345 ?auto_1137346 ?auto_1137347 ?auto_1137348 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1137482 - SURFACE
      ?auto_1137483 - SURFACE
      ?auto_1137484 - SURFACE
      ?auto_1137481 - SURFACE
      ?auto_1137485 - SURFACE
      ?auto_1137487 - SURFACE
      ?auto_1137486 - SURFACE
      ?auto_1137488 - SURFACE
      ?auto_1137489 - SURFACE
      ?auto_1137490 - SURFACE
      ?auto_1137491 - SURFACE
      ?auto_1137492 - SURFACE
    )
    :vars
    (
      ?auto_1137493 - HOIST
      ?auto_1137497 - PLACE
      ?auto_1137494 - PLACE
      ?auto_1137498 - HOIST
      ?auto_1137495 - SURFACE
      ?auto_1137496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1137493 ?auto_1137497 ) ( IS-CRATE ?auto_1137492 ) ( not ( = ?auto_1137491 ?auto_1137492 ) ) ( not ( = ?auto_1137490 ?auto_1137491 ) ) ( not ( = ?auto_1137490 ?auto_1137492 ) ) ( not ( = ?auto_1137494 ?auto_1137497 ) ) ( HOIST-AT ?auto_1137498 ?auto_1137494 ) ( not ( = ?auto_1137493 ?auto_1137498 ) ) ( AVAILABLE ?auto_1137498 ) ( SURFACE-AT ?auto_1137492 ?auto_1137494 ) ( ON ?auto_1137492 ?auto_1137495 ) ( CLEAR ?auto_1137492 ) ( not ( = ?auto_1137491 ?auto_1137495 ) ) ( not ( = ?auto_1137492 ?auto_1137495 ) ) ( not ( = ?auto_1137490 ?auto_1137495 ) ) ( TRUCK-AT ?auto_1137496 ?auto_1137497 ) ( SURFACE-AT ?auto_1137490 ?auto_1137497 ) ( CLEAR ?auto_1137490 ) ( LIFTING ?auto_1137493 ?auto_1137491 ) ( IS-CRATE ?auto_1137491 ) ( ON ?auto_1137483 ?auto_1137482 ) ( ON ?auto_1137484 ?auto_1137483 ) ( ON ?auto_1137481 ?auto_1137484 ) ( ON ?auto_1137485 ?auto_1137481 ) ( ON ?auto_1137487 ?auto_1137485 ) ( ON ?auto_1137486 ?auto_1137487 ) ( ON ?auto_1137488 ?auto_1137486 ) ( ON ?auto_1137489 ?auto_1137488 ) ( ON ?auto_1137490 ?auto_1137489 ) ( not ( = ?auto_1137482 ?auto_1137483 ) ) ( not ( = ?auto_1137482 ?auto_1137484 ) ) ( not ( = ?auto_1137482 ?auto_1137481 ) ) ( not ( = ?auto_1137482 ?auto_1137485 ) ) ( not ( = ?auto_1137482 ?auto_1137487 ) ) ( not ( = ?auto_1137482 ?auto_1137486 ) ) ( not ( = ?auto_1137482 ?auto_1137488 ) ) ( not ( = ?auto_1137482 ?auto_1137489 ) ) ( not ( = ?auto_1137482 ?auto_1137490 ) ) ( not ( = ?auto_1137482 ?auto_1137491 ) ) ( not ( = ?auto_1137482 ?auto_1137492 ) ) ( not ( = ?auto_1137482 ?auto_1137495 ) ) ( not ( = ?auto_1137483 ?auto_1137484 ) ) ( not ( = ?auto_1137483 ?auto_1137481 ) ) ( not ( = ?auto_1137483 ?auto_1137485 ) ) ( not ( = ?auto_1137483 ?auto_1137487 ) ) ( not ( = ?auto_1137483 ?auto_1137486 ) ) ( not ( = ?auto_1137483 ?auto_1137488 ) ) ( not ( = ?auto_1137483 ?auto_1137489 ) ) ( not ( = ?auto_1137483 ?auto_1137490 ) ) ( not ( = ?auto_1137483 ?auto_1137491 ) ) ( not ( = ?auto_1137483 ?auto_1137492 ) ) ( not ( = ?auto_1137483 ?auto_1137495 ) ) ( not ( = ?auto_1137484 ?auto_1137481 ) ) ( not ( = ?auto_1137484 ?auto_1137485 ) ) ( not ( = ?auto_1137484 ?auto_1137487 ) ) ( not ( = ?auto_1137484 ?auto_1137486 ) ) ( not ( = ?auto_1137484 ?auto_1137488 ) ) ( not ( = ?auto_1137484 ?auto_1137489 ) ) ( not ( = ?auto_1137484 ?auto_1137490 ) ) ( not ( = ?auto_1137484 ?auto_1137491 ) ) ( not ( = ?auto_1137484 ?auto_1137492 ) ) ( not ( = ?auto_1137484 ?auto_1137495 ) ) ( not ( = ?auto_1137481 ?auto_1137485 ) ) ( not ( = ?auto_1137481 ?auto_1137487 ) ) ( not ( = ?auto_1137481 ?auto_1137486 ) ) ( not ( = ?auto_1137481 ?auto_1137488 ) ) ( not ( = ?auto_1137481 ?auto_1137489 ) ) ( not ( = ?auto_1137481 ?auto_1137490 ) ) ( not ( = ?auto_1137481 ?auto_1137491 ) ) ( not ( = ?auto_1137481 ?auto_1137492 ) ) ( not ( = ?auto_1137481 ?auto_1137495 ) ) ( not ( = ?auto_1137485 ?auto_1137487 ) ) ( not ( = ?auto_1137485 ?auto_1137486 ) ) ( not ( = ?auto_1137485 ?auto_1137488 ) ) ( not ( = ?auto_1137485 ?auto_1137489 ) ) ( not ( = ?auto_1137485 ?auto_1137490 ) ) ( not ( = ?auto_1137485 ?auto_1137491 ) ) ( not ( = ?auto_1137485 ?auto_1137492 ) ) ( not ( = ?auto_1137485 ?auto_1137495 ) ) ( not ( = ?auto_1137487 ?auto_1137486 ) ) ( not ( = ?auto_1137487 ?auto_1137488 ) ) ( not ( = ?auto_1137487 ?auto_1137489 ) ) ( not ( = ?auto_1137487 ?auto_1137490 ) ) ( not ( = ?auto_1137487 ?auto_1137491 ) ) ( not ( = ?auto_1137487 ?auto_1137492 ) ) ( not ( = ?auto_1137487 ?auto_1137495 ) ) ( not ( = ?auto_1137486 ?auto_1137488 ) ) ( not ( = ?auto_1137486 ?auto_1137489 ) ) ( not ( = ?auto_1137486 ?auto_1137490 ) ) ( not ( = ?auto_1137486 ?auto_1137491 ) ) ( not ( = ?auto_1137486 ?auto_1137492 ) ) ( not ( = ?auto_1137486 ?auto_1137495 ) ) ( not ( = ?auto_1137488 ?auto_1137489 ) ) ( not ( = ?auto_1137488 ?auto_1137490 ) ) ( not ( = ?auto_1137488 ?auto_1137491 ) ) ( not ( = ?auto_1137488 ?auto_1137492 ) ) ( not ( = ?auto_1137488 ?auto_1137495 ) ) ( not ( = ?auto_1137489 ?auto_1137490 ) ) ( not ( = ?auto_1137489 ?auto_1137491 ) ) ( not ( = ?auto_1137489 ?auto_1137492 ) ) ( not ( = ?auto_1137489 ?auto_1137495 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1137490 ?auto_1137491 ?auto_1137492 )
      ( MAKE-11CRATE-VERIFY ?auto_1137482 ?auto_1137483 ?auto_1137484 ?auto_1137481 ?auto_1137485 ?auto_1137487 ?auto_1137486 ?auto_1137488 ?auto_1137489 ?auto_1137490 ?auto_1137491 ?auto_1137492 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1137626 - SURFACE
      ?auto_1137627 - SURFACE
      ?auto_1137628 - SURFACE
      ?auto_1137625 - SURFACE
      ?auto_1137629 - SURFACE
      ?auto_1137631 - SURFACE
      ?auto_1137630 - SURFACE
      ?auto_1137632 - SURFACE
      ?auto_1137633 - SURFACE
      ?auto_1137634 - SURFACE
      ?auto_1137635 - SURFACE
      ?auto_1137636 - SURFACE
    )
    :vars
    (
      ?auto_1137640 - HOIST
      ?auto_1137639 - PLACE
      ?auto_1137641 - PLACE
      ?auto_1137637 - HOIST
      ?auto_1137638 - SURFACE
      ?auto_1137642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1137640 ?auto_1137639 ) ( IS-CRATE ?auto_1137636 ) ( not ( = ?auto_1137635 ?auto_1137636 ) ) ( not ( = ?auto_1137634 ?auto_1137635 ) ) ( not ( = ?auto_1137634 ?auto_1137636 ) ) ( not ( = ?auto_1137641 ?auto_1137639 ) ) ( HOIST-AT ?auto_1137637 ?auto_1137641 ) ( not ( = ?auto_1137640 ?auto_1137637 ) ) ( AVAILABLE ?auto_1137637 ) ( SURFACE-AT ?auto_1137636 ?auto_1137641 ) ( ON ?auto_1137636 ?auto_1137638 ) ( CLEAR ?auto_1137636 ) ( not ( = ?auto_1137635 ?auto_1137638 ) ) ( not ( = ?auto_1137636 ?auto_1137638 ) ) ( not ( = ?auto_1137634 ?auto_1137638 ) ) ( TRUCK-AT ?auto_1137642 ?auto_1137639 ) ( SURFACE-AT ?auto_1137634 ?auto_1137639 ) ( CLEAR ?auto_1137634 ) ( IS-CRATE ?auto_1137635 ) ( AVAILABLE ?auto_1137640 ) ( IN ?auto_1137635 ?auto_1137642 ) ( ON ?auto_1137627 ?auto_1137626 ) ( ON ?auto_1137628 ?auto_1137627 ) ( ON ?auto_1137625 ?auto_1137628 ) ( ON ?auto_1137629 ?auto_1137625 ) ( ON ?auto_1137631 ?auto_1137629 ) ( ON ?auto_1137630 ?auto_1137631 ) ( ON ?auto_1137632 ?auto_1137630 ) ( ON ?auto_1137633 ?auto_1137632 ) ( ON ?auto_1137634 ?auto_1137633 ) ( not ( = ?auto_1137626 ?auto_1137627 ) ) ( not ( = ?auto_1137626 ?auto_1137628 ) ) ( not ( = ?auto_1137626 ?auto_1137625 ) ) ( not ( = ?auto_1137626 ?auto_1137629 ) ) ( not ( = ?auto_1137626 ?auto_1137631 ) ) ( not ( = ?auto_1137626 ?auto_1137630 ) ) ( not ( = ?auto_1137626 ?auto_1137632 ) ) ( not ( = ?auto_1137626 ?auto_1137633 ) ) ( not ( = ?auto_1137626 ?auto_1137634 ) ) ( not ( = ?auto_1137626 ?auto_1137635 ) ) ( not ( = ?auto_1137626 ?auto_1137636 ) ) ( not ( = ?auto_1137626 ?auto_1137638 ) ) ( not ( = ?auto_1137627 ?auto_1137628 ) ) ( not ( = ?auto_1137627 ?auto_1137625 ) ) ( not ( = ?auto_1137627 ?auto_1137629 ) ) ( not ( = ?auto_1137627 ?auto_1137631 ) ) ( not ( = ?auto_1137627 ?auto_1137630 ) ) ( not ( = ?auto_1137627 ?auto_1137632 ) ) ( not ( = ?auto_1137627 ?auto_1137633 ) ) ( not ( = ?auto_1137627 ?auto_1137634 ) ) ( not ( = ?auto_1137627 ?auto_1137635 ) ) ( not ( = ?auto_1137627 ?auto_1137636 ) ) ( not ( = ?auto_1137627 ?auto_1137638 ) ) ( not ( = ?auto_1137628 ?auto_1137625 ) ) ( not ( = ?auto_1137628 ?auto_1137629 ) ) ( not ( = ?auto_1137628 ?auto_1137631 ) ) ( not ( = ?auto_1137628 ?auto_1137630 ) ) ( not ( = ?auto_1137628 ?auto_1137632 ) ) ( not ( = ?auto_1137628 ?auto_1137633 ) ) ( not ( = ?auto_1137628 ?auto_1137634 ) ) ( not ( = ?auto_1137628 ?auto_1137635 ) ) ( not ( = ?auto_1137628 ?auto_1137636 ) ) ( not ( = ?auto_1137628 ?auto_1137638 ) ) ( not ( = ?auto_1137625 ?auto_1137629 ) ) ( not ( = ?auto_1137625 ?auto_1137631 ) ) ( not ( = ?auto_1137625 ?auto_1137630 ) ) ( not ( = ?auto_1137625 ?auto_1137632 ) ) ( not ( = ?auto_1137625 ?auto_1137633 ) ) ( not ( = ?auto_1137625 ?auto_1137634 ) ) ( not ( = ?auto_1137625 ?auto_1137635 ) ) ( not ( = ?auto_1137625 ?auto_1137636 ) ) ( not ( = ?auto_1137625 ?auto_1137638 ) ) ( not ( = ?auto_1137629 ?auto_1137631 ) ) ( not ( = ?auto_1137629 ?auto_1137630 ) ) ( not ( = ?auto_1137629 ?auto_1137632 ) ) ( not ( = ?auto_1137629 ?auto_1137633 ) ) ( not ( = ?auto_1137629 ?auto_1137634 ) ) ( not ( = ?auto_1137629 ?auto_1137635 ) ) ( not ( = ?auto_1137629 ?auto_1137636 ) ) ( not ( = ?auto_1137629 ?auto_1137638 ) ) ( not ( = ?auto_1137631 ?auto_1137630 ) ) ( not ( = ?auto_1137631 ?auto_1137632 ) ) ( not ( = ?auto_1137631 ?auto_1137633 ) ) ( not ( = ?auto_1137631 ?auto_1137634 ) ) ( not ( = ?auto_1137631 ?auto_1137635 ) ) ( not ( = ?auto_1137631 ?auto_1137636 ) ) ( not ( = ?auto_1137631 ?auto_1137638 ) ) ( not ( = ?auto_1137630 ?auto_1137632 ) ) ( not ( = ?auto_1137630 ?auto_1137633 ) ) ( not ( = ?auto_1137630 ?auto_1137634 ) ) ( not ( = ?auto_1137630 ?auto_1137635 ) ) ( not ( = ?auto_1137630 ?auto_1137636 ) ) ( not ( = ?auto_1137630 ?auto_1137638 ) ) ( not ( = ?auto_1137632 ?auto_1137633 ) ) ( not ( = ?auto_1137632 ?auto_1137634 ) ) ( not ( = ?auto_1137632 ?auto_1137635 ) ) ( not ( = ?auto_1137632 ?auto_1137636 ) ) ( not ( = ?auto_1137632 ?auto_1137638 ) ) ( not ( = ?auto_1137633 ?auto_1137634 ) ) ( not ( = ?auto_1137633 ?auto_1137635 ) ) ( not ( = ?auto_1137633 ?auto_1137636 ) ) ( not ( = ?auto_1137633 ?auto_1137638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1137634 ?auto_1137635 ?auto_1137636 )
      ( MAKE-11CRATE-VERIFY ?auto_1137626 ?auto_1137627 ?auto_1137628 ?auto_1137625 ?auto_1137629 ?auto_1137631 ?auto_1137630 ?auto_1137632 ?auto_1137633 ?auto_1137634 ?auto_1137635 ?auto_1137636 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1146917 - SURFACE
      ?auto_1146918 - SURFACE
      ?auto_1146919 - SURFACE
      ?auto_1146916 - SURFACE
      ?auto_1146920 - SURFACE
      ?auto_1146922 - SURFACE
      ?auto_1146921 - SURFACE
      ?auto_1146923 - SURFACE
      ?auto_1146924 - SURFACE
      ?auto_1146925 - SURFACE
      ?auto_1146926 - SURFACE
      ?auto_1146927 - SURFACE
      ?auto_1146928 - SURFACE
    )
    :vars
    (
      ?auto_1146930 - HOIST
      ?auto_1146929 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1146930 ?auto_1146929 ) ( SURFACE-AT ?auto_1146927 ?auto_1146929 ) ( CLEAR ?auto_1146927 ) ( LIFTING ?auto_1146930 ?auto_1146928 ) ( IS-CRATE ?auto_1146928 ) ( not ( = ?auto_1146927 ?auto_1146928 ) ) ( ON ?auto_1146918 ?auto_1146917 ) ( ON ?auto_1146919 ?auto_1146918 ) ( ON ?auto_1146916 ?auto_1146919 ) ( ON ?auto_1146920 ?auto_1146916 ) ( ON ?auto_1146922 ?auto_1146920 ) ( ON ?auto_1146921 ?auto_1146922 ) ( ON ?auto_1146923 ?auto_1146921 ) ( ON ?auto_1146924 ?auto_1146923 ) ( ON ?auto_1146925 ?auto_1146924 ) ( ON ?auto_1146926 ?auto_1146925 ) ( ON ?auto_1146927 ?auto_1146926 ) ( not ( = ?auto_1146917 ?auto_1146918 ) ) ( not ( = ?auto_1146917 ?auto_1146919 ) ) ( not ( = ?auto_1146917 ?auto_1146916 ) ) ( not ( = ?auto_1146917 ?auto_1146920 ) ) ( not ( = ?auto_1146917 ?auto_1146922 ) ) ( not ( = ?auto_1146917 ?auto_1146921 ) ) ( not ( = ?auto_1146917 ?auto_1146923 ) ) ( not ( = ?auto_1146917 ?auto_1146924 ) ) ( not ( = ?auto_1146917 ?auto_1146925 ) ) ( not ( = ?auto_1146917 ?auto_1146926 ) ) ( not ( = ?auto_1146917 ?auto_1146927 ) ) ( not ( = ?auto_1146917 ?auto_1146928 ) ) ( not ( = ?auto_1146918 ?auto_1146919 ) ) ( not ( = ?auto_1146918 ?auto_1146916 ) ) ( not ( = ?auto_1146918 ?auto_1146920 ) ) ( not ( = ?auto_1146918 ?auto_1146922 ) ) ( not ( = ?auto_1146918 ?auto_1146921 ) ) ( not ( = ?auto_1146918 ?auto_1146923 ) ) ( not ( = ?auto_1146918 ?auto_1146924 ) ) ( not ( = ?auto_1146918 ?auto_1146925 ) ) ( not ( = ?auto_1146918 ?auto_1146926 ) ) ( not ( = ?auto_1146918 ?auto_1146927 ) ) ( not ( = ?auto_1146918 ?auto_1146928 ) ) ( not ( = ?auto_1146919 ?auto_1146916 ) ) ( not ( = ?auto_1146919 ?auto_1146920 ) ) ( not ( = ?auto_1146919 ?auto_1146922 ) ) ( not ( = ?auto_1146919 ?auto_1146921 ) ) ( not ( = ?auto_1146919 ?auto_1146923 ) ) ( not ( = ?auto_1146919 ?auto_1146924 ) ) ( not ( = ?auto_1146919 ?auto_1146925 ) ) ( not ( = ?auto_1146919 ?auto_1146926 ) ) ( not ( = ?auto_1146919 ?auto_1146927 ) ) ( not ( = ?auto_1146919 ?auto_1146928 ) ) ( not ( = ?auto_1146916 ?auto_1146920 ) ) ( not ( = ?auto_1146916 ?auto_1146922 ) ) ( not ( = ?auto_1146916 ?auto_1146921 ) ) ( not ( = ?auto_1146916 ?auto_1146923 ) ) ( not ( = ?auto_1146916 ?auto_1146924 ) ) ( not ( = ?auto_1146916 ?auto_1146925 ) ) ( not ( = ?auto_1146916 ?auto_1146926 ) ) ( not ( = ?auto_1146916 ?auto_1146927 ) ) ( not ( = ?auto_1146916 ?auto_1146928 ) ) ( not ( = ?auto_1146920 ?auto_1146922 ) ) ( not ( = ?auto_1146920 ?auto_1146921 ) ) ( not ( = ?auto_1146920 ?auto_1146923 ) ) ( not ( = ?auto_1146920 ?auto_1146924 ) ) ( not ( = ?auto_1146920 ?auto_1146925 ) ) ( not ( = ?auto_1146920 ?auto_1146926 ) ) ( not ( = ?auto_1146920 ?auto_1146927 ) ) ( not ( = ?auto_1146920 ?auto_1146928 ) ) ( not ( = ?auto_1146922 ?auto_1146921 ) ) ( not ( = ?auto_1146922 ?auto_1146923 ) ) ( not ( = ?auto_1146922 ?auto_1146924 ) ) ( not ( = ?auto_1146922 ?auto_1146925 ) ) ( not ( = ?auto_1146922 ?auto_1146926 ) ) ( not ( = ?auto_1146922 ?auto_1146927 ) ) ( not ( = ?auto_1146922 ?auto_1146928 ) ) ( not ( = ?auto_1146921 ?auto_1146923 ) ) ( not ( = ?auto_1146921 ?auto_1146924 ) ) ( not ( = ?auto_1146921 ?auto_1146925 ) ) ( not ( = ?auto_1146921 ?auto_1146926 ) ) ( not ( = ?auto_1146921 ?auto_1146927 ) ) ( not ( = ?auto_1146921 ?auto_1146928 ) ) ( not ( = ?auto_1146923 ?auto_1146924 ) ) ( not ( = ?auto_1146923 ?auto_1146925 ) ) ( not ( = ?auto_1146923 ?auto_1146926 ) ) ( not ( = ?auto_1146923 ?auto_1146927 ) ) ( not ( = ?auto_1146923 ?auto_1146928 ) ) ( not ( = ?auto_1146924 ?auto_1146925 ) ) ( not ( = ?auto_1146924 ?auto_1146926 ) ) ( not ( = ?auto_1146924 ?auto_1146927 ) ) ( not ( = ?auto_1146924 ?auto_1146928 ) ) ( not ( = ?auto_1146925 ?auto_1146926 ) ) ( not ( = ?auto_1146925 ?auto_1146927 ) ) ( not ( = ?auto_1146925 ?auto_1146928 ) ) ( not ( = ?auto_1146926 ?auto_1146927 ) ) ( not ( = ?auto_1146926 ?auto_1146928 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1146927 ?auto_1146928 )
      ( MAKE-12CRATE-VERIFY ?auto_1146917 ?auto_1146918 ?auto_1146919 ?auto_1146916 ?auto_1146920 ?auto_1146922 ?auto_1146921 ?auto_1146923 ?auto_1146924 ?auto_1146925 ?auto_1146926 ?auto_1146927 ?auto_1146928 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1147042 - SURFACE
      ?auto_1147043 - SURFACE
      ?auto_1147044 - SURFACE
      ?auto_1147041 - SURFACE
      ?auto_1147045 - SURFACE
      ?auto_1147047 - SURFACE
      ?auto_1147046 - SURFACE
      ?auto_1147048 - SURFACE
      ?auto_1147049 - SURFACE
      ?auto_1147050 - SURFACE
      ?auto_1147051 - SURFACE
      ?auto_1147052 - SURFACE
      ?auto_1147053 - SURFACE
    )
    :vars
    (
      ?auto_1147056 - HOIST
      ?auto_1147054 - PLACE
      ?auto_1147055 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1147056 ?auto_1147054 ) ( SURFACE-AT ?auto_1147052 ?auto_1147054 ) ( CLEAR ?auto_1147052 ) ( IS-CRATE ?auto_1147053 ) ( not ( = ?auto_1147052 ?auto_1147053 ) ) ( TRUCK-AT ?auto_1147055 ?auto_1147054 ) ( AVAILABLE ?auto_1147056 ) ( IN ?auto_1147053 ?auto_1147055 ) ( ON ?auto_1147052 ?auto_1147051 ) ( not ( = ?auto_1147051 ?auto_1147052 ) ) ( not ( = ?auto_1147051 ?auto_1147053 ) ) ( ON ?auto_1147043 ?auto_1147042 ) ( ON ?auto_1147044 ?auto_1147043 ) ( ON ?auto_1147041 ?auto_1147044 ) ( ON ?auto_1147045 ?auto_1147041 ) ( ON ?auto_1147047 ?auto_1147045 ) ( ON ?auto_1147046 ?auto_1147047 ) ( ON ?auto_1147048 ?auto_1147046 ) ( ON ?auto_1147049 ?auto_1147048 ) ( ON ?auto_1147050 ?auto_1147049 ) ( ON ?auto_1147051 ?auto_1147050 ) ( not ( = ?auto_1147042 ?auto_1147043 ) ) ( not ( = ?auto_1147042 ?auto_1147044 ) ) ( not ( = ?auto_1147042 ?auto_1147041 ) ) ( not ( = ?auto_1147042 ?auto_1147045 ) ) ( not ( = ?auto_1147042 ?auto_1147047 ) ) ( not ( = ?auto_1147042 ?auto_1147046 ) ) ( not ( = ?auto_1147042 ?auto_1147048 ) ) ( not ( = ?auto_1147042 ?auto_1147049 ) ) ( not ( = ?auto_1147042 ?auto_1147050 ) ) ( not ( = ?auto_1147042 ?auto_1147051 ) ) ( not ( = ?auto_1147042 ?auto_1147052 ) ) ( not ( = ?auto_1147042 ?auto_1147053 ) ) ( not ( = ?auto_1147043 ?auto_1147044 ) ) ( not ( = ?auto_1147043 ?auto_1147041 ) ) ( not ( = ?auto_1147043 ?auto_1147045 ) ) ( not ( = ?auto_1147043 ?auto_1147047 ) ) ( not ( = ?auto_1147043 ?auto_1147046 ) ) ( not ( = ?auto_1147043 ?auto_1147048 ) ) ( not ( = ?auto_1147043 ?auto_1147049 ) ) ( not ( = ?auto_1147043 ?auto_1147050 ) ) ( not ( = ?auto_1147043 ?auto_1147051 ) ) ( not ( = ?auto_1147043 ?auto_1147052 ) ) ( not ( = ?auto_1147043 ?auto_1147053 ) ) ( not ( = ?auto_1147044 ?auto_1147041 ) ) ( not ( = ?auto_1147044 ?auto_1147045 ) ) ( not ( = ?auto_1147044 ?auto_1147047 ) ) ( not ( = ?auto_1147044 ?auto_1147046 ) ) ( not ( = ?auto_1147044 ?auto_1147048 ) ) ( not ( = ?auto_1147044 ?auto_1147049 ) ) ( not ( = ?auto_1147044 ?auto_1147050 ) ) ( not ( = ?auto_1147044 ?auto_1147051 ) ) ( not ( = ?auto_1147044 ?auto_1147052 ) ) ( not ( = ?auto_1147044 ?auto_1147053 ) ) ( not ( = ?auto_1147041 ?auto_1147045 ) ) ( not ( = ?auto_1147041 ?auto_1147047 ) ) ( not ( = ?auto_1147041 ?auto_1147046 ) ) ( not ( = ?auto_1147041 ?auto_1147048 ) ) ( not ( = ?auto_1147041 ?auto_1147049 ) ) ( not ( = ?auto_1147041 ?auto_1147050 ) ) ( not ( = ?auto_1147041 ?auto_1147051 ) ) ( not ( = ?auto_1147041 ?auto_1147052 ) ) ( not ( = ?auto_1147041 ?auto_1147053 ) ) ( not ( = ?auto_1147045 ?auto_1147047 ) ) ( not ( = ?auto_1147045 ?auto_1147046 ) ) ( not ( = ?auto_1147045 ?auto_1147048 ) ) ( not ( = ?auto_1147045 ?auto_1147049 ) ) ( not ( = ?auto_1147045 ?auto_1147050 ) ) ( not ( = ?auto_1147045 ?auto_1147051 ) ) ( not ( = ?auto_1147045 ?auto_1147052 ) ) ( not ( = ?auto_1147045 ?auto_1147053 ) ) ( not ( = ?auto_1147047 ?auto_1147046 ) ) ( not ( = ?auto_1147047 ?auto_1147048 ) ) ( not ( = ?auto_1147047 ?auto_1147049 ) ) ( not ( = ?auto_1147047 ?auto_1147050 ) ) ( not ( = ?auto_1147047 ?auto_1147051 ) ) ( not ( = ?auto_1147047 ?auto_1147052 ) ) ( not ( = ?auto_1147047 ?auto_1147053 ) ) ( not ( = ?auto_1147046 ?auto_1147048 ) ) ( not ( = ?auto_1147046 ?auto_1147049 ) ) ( not ( = ?auto_1147046 ?auto_1147050 ) ) ( not ( = ?auto_1147046 ?auto_1147051 ) ) ( not ( = ?auto_1147046 ?auto_1147052 ) ) ( not ( = ?auto_1147046 ?auto_1147053 ) ) ( not ( = ?auto_1147048 ?auto_1147049 ) ) ( not ( = ?auto_1147048 ?auto_1147050 ) ) ( not ( = ?auto_1147048 ?auto_1147051 ) ) ( not ( = ?auto_1147048 ?auto_1147052 ) ) ( not ( = ?auto_1147048 ?auto_1147053 ) ) ( not ( = ?auto_1147049 ?auto_1147050 ) ) ( not ( = ?auto_1147049 ?auto_1147051 ) ) ( not ( = ?auto_1147049 ?auto_1147052 ) ) ( not ( = ?auto_1147049 ?auto_1147053 ) ) ( not ( = ?auto_1147050 ?auto_1147051 ) ) ( not ( = ?auto_1147050 ?auto_1147052 ) ) ( not ( = ?auto_1147050 ?auto_1147053 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1147051 ?auto_1147052 ?auto_1147053 )
      ( MAKE-12CRATE-VERIFY ?auto_1147042 ?auto_1147043 ?auto_1147044 ?auto_1147041 ?auto_1147045 ?auto_1147047 ?auto_1147046 ?auto_1147048 ?auto_1147049 ?auto_1147050 ?auto_1147051 ?auto_1147052 ?auto_1147053 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1147180 - SURFACE
      ?auto_1147181 - SURFACE
      ?auto_1147182 - SURFACE
      ?auto_1147179 - SURFACE
      ?auto_1147183 - SURFACE
      ?auto_1147185 - SURFACE
      ?auto_1147184 - SURFACE
      ?auto_1147186 - SURFACE
      ?auto_1147187 - SURFACE
      ?auto_1147188 - SURFACE
      ?auto_1147189 - SURFACE
      ?auto_1147190 - SURFACE
      ?auto_1147191 - SURFACE
    )
    :vars
    (
      ?auto_1147194 - HOIST
      ?auto_1147195 - PLACE
      ?auto_1147192 - TRUCK
      ?auto_1147193 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1147194 ?auto_1147195 ) ( SURFACE-AT ?auto_1147190 ?auto_1147195 ) ( CLEAR ?auto_1147190 ) ( IS-CRATE ?auto_1147191 ) ( not ( = ?auto_1147190 ?auto_1147191 ) ) ( AVAILABLE ?auto_1147194 ) ( IN ?auto_1147191 ?auto_1147192 ) ( ON ?auto_1147190 ?auto_1147189 ) ( not ( = ?auto_1147189 ?auto_1147190 ) ) ( not ( = ?auto_1147189 ?auto_1147191 ) ) ( TRUCK-AT ?auto_1147192 ?auto_1147193 ) ( not ( = ?auto_1147193 ?auto_1147195 ) ) ( ON ?auto_1147181 ?auto_1147180 ) ( ON ?auto_1147182 ?auto_1147181 ) ( ON ?auto_1147179 ?auto_1147182 ) ( ON ?auto_1147183 ?auto_1147179 ) ( ON ?auto_1147185 ?auto_1147183 ) ( ON ?auto_1147184 ?auto_1147185 ) ( ON ?auto_1147186 ?auto_1147184 ) ( ON ?auto_1147187 ?auto_1147186 ) ( ON ?auto_1147188 ?auto_1147187 ) ( ON ?auto_1147189 ?auto_1147188 ) ( not ( = ?auto_1147180 ?auto_1147181 ) ) ( not ( = ?auto_1147180 ?auto_1147182 ) ) ( not ( = ?auto_1147180 ?auto_1147179 ) ) ( not ( = ?auto_1147180 ?auto_1147183 ) ) ( not ( = ?auto_1147180 ?auto_1147185 ) ) ( not ( = ?auto_1147180 ?auto_1147184 ) ) ( not ( = ?auto_1147180 ?auto_1147186 ) ) ( not ( = ?auto_1147180 ?auto_1147187 ) ) ( not ( = ?auto_1147180 ?auto_1147188 ) ) ( not ( = ?auto_1147180 ?auto_1147189 ) ) ( not ( = ?auto_1147180 ?auto_1147190 ) ) ( not ( = ?auto_1147180 ?auto_1147191 ) ) ( not ( = ?auto_1147181 ?auto_1147182 ) ) ( not ( = ?auto_1147181 ?auto_1147179 ) ) ( not ( = ?auto_1147181 ?auto_1147183 ) ) ( not ( = ?auto_1147181 ?auto_1147185 ) ) ( not ( = ?auto_1147181 ?auto_1147184 ) ) ( not ( = ?auto_1147181 ?auto_1147186 ) ) ( not ( = ?auto_1147181 ?auto_1147187 ) ) ( not ( = ?auto_1147181 ?auto_1147188 ) ) ( not ( = ?auto_1147181 ?auto_1147189 ) ) ( not ( = ?auto_1147181 ?auto_1147190 ) ) ( not ( = ?auto_1147181 ?auto_1147191 ) ) ( not ( = ?auto_1147182 ?auto_1147179 ) ) ( not ( = ?auto_1147182 ?auto_1147183 ) ) ( not ( = ?auto_1147182 ?auto_1147185 ) ) ( not ( = ?auto_1147182 ?auto_1147184 ) ) ( not ( = ?auto_1147182 ?auto_1147186 ) ) ( not ( = ?auto_1147182 ?auto_1147187 ) ) ( not ( = ?auto_1147182 ?auto_1147188 ) ) ( not ( = ?auto_1147182 ?auto_1147189 ) ) ( not ( = ?auto_1147182 ?auto_1147190 ) ) ( not ( = ?auto_1147182 ?auto_1147191 ) ) ( not ( = ?auto_1147179 ?auto_1147183 ) ) ( not ( = ?auto_1147179 ?auto_1147185 ) ) ( not ( = ?auto_1147179 ?auto_1147184 ) ) ( not ( = ?auto_1147179 ?auto_1147186 ) ) ( not ( = ?auto_1147179 ?auto_1147187 ) ) ( not ( = ?auto_1147179 ?auto_1147188 ) ) ( not ( = ?auto_1147179 ?auto_1147189 ) ) ( not ( = ?auto_1147179 ?auto_1147190 ) ) ( not ( = ?auto_1147179 ?auto_1147191 ) ) ( not ( = ?auto_1147183 ?auto_1147185 ) ) ( not ( = ?auto_1147183 ?auto_1147184 ) ) ( not ( = ?auto_1147183 ?auto_1147186 ) ) ( not ( = ?auto_1147183 ?auto_1147187 ) ) ( not ( = ?auto_1147183 ?auto_1147188 ) ) ( not ( = ?auto_1147183 ?auto_1147189 ) ) ( not ( = ?auto_1147183 ?auto_1147190 ) ) ( not ( = ?auto_1147183 ?auto_1147191 ) ) ( not ( = ?auto_1147185 ?auto_1147184 ) ) ( not ( = ?auto_1147185 ?auto_1147186 ) ) ( not ( = ?auto_1147185 ?auto_1147187 ) ) ( not ( = ?auto_1147185 ?auto_1147188 ) ) ( not ( = ?auto_1147185 ?auto_1147189 ) ) ( not ( = ?auto_1147185 ?auto_1147190 ) ) ( not ( = ?auto_1147185 ?auto_1147191 ) ) ( not ( = ?auto_1147184 ?auto_1147186 ) ) ( not ( = ?auto_1147184 ?auto_1147187 ) ) ( not ( = ?auto_1147184 ?auto_1147188 ) ) ( not ( = ?auto_1147184 ?auto_1147189 ) ) ( not ( = ?auto_1147184 ?auto_1147190 ) ) ( not ( = ?auto_1147184 ?auto_1147191 ) ) ( not ( = ?auto_1147186 ?auto_1147187 ) ) ( not ( = ?auto_1147186 ?auto_1147188 ) ) ( not ( = ?auto_1147186 ?auto_1147189 ) ) ( not ( = ?auto_1147186 ?auto_1147190 ) ) ( not ( = ?auto_1147186 ?auto_1147191 ) ) ( not ( = ?auto_1147187 ?auto_1147188 ) ) ( not ( = ?auto_1147187 ?auto_1147189 ) ) ( not ( = ?auto_1147187 ?auto_1147190 ) ) ( not ( = ?auto_1147187 ?auto_1147191 ) ) ( not ( = ?auto_1147188 ?auto_1147189 ) ) ( not ( = ?auto_1147188 ?auto_1147190 ) ) ( not ( = ?auto_1147188 ?auto_1147191 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1147189 ?auto_1147190 ?auto_1147191 )
      ( MAKE-12CRATE-VERIFY ?auto_1147180 ?auto_1147181 ?auto_1147182 ?auto_1147179 ?auto_1147183 ?auto_1147185 ?auto_1147184 ?auto_1147186 ?auto_1147187 ?auto_1147188 ?auto_1147189 ?auto_1147190 ?auto_1147191 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1147330 - SURFACE
      ?auto_1147331 - SURFACE
      ?auto_1147332 - SURFACE
      ?auto_1147329 - SURFACE
      ?auto_1147333 - SURFACE
      ?auto_1147335 - SURFACE
      ?auto_1147334 - SURFACE
      ?auto_1147336 - SURFACE
      ?auto_1147337 - SURFACE
      ?auto_1147338 - SURFACE
      ?auto_1147339 - SURFACE
      ?auto_1147340 - SURFACE
      ?auto_1147341 - SURFACE
    )
    :vars
    (
      ?auto_1147343 - HOIST
      ?auto_1147344 - PLACE
      ?auto_1147346 - TRUCK
      ?auto_1147345 - PLACE
      ?auto_1147342 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1147343 ?auto_1147344 ) ( SURFACE-AT ?auto_1147340 ?auto_1147344 ) ( CLEAR ?auto_1147340 ) ( IS-CRATE ?auto_1147341 ) ( not ( = ?auto_1147340 ?auto_1147341 ) ) ( AVAILABLE ?auto_1147343 ) ( ON ?auto_1147340 ?auto_1147339 ) ( not ( = ?auto_1147339 ?auto_1147340 ) ) ( not ( = ?auto_1147339 ?auto_1147341 ) ) ( TRUCK-AT ?auto_1147346 ?auto_1147345 ) ( not ( = ?auto_1147345 ?auto_1147344 ) ) ( HOIST-AT ?auto_1147342 ?auto_1147345 ) ( LIFTING ?auto_1147342 ?auto_1147341 ) ( not ( = ?auto_1147343 ?auto_1147342 ) ) ( ON ?auto_1147331 ?auto_1147330 ) ( ON ?auto_1147332 ?auto_1147331 ) ( ON ?auto_1147329 ?auto_1147332 ) ( ON ?auto_1147333 ?auto_1147329 ) ( ON ?auto_1147335 ?auto_1147333 ) ( ON ?auto_1147334 ?auto_1147335 ) ( ON ?auto_1147336 ?auto_1147334 ) ( ON ?auto_1147337 ?auto_1147336 ) ( ON ?auto_1147338 ?auto_1147337 ) ( ON ?auto_1147339 ?auto_1147338 ) ( not ( = ?auto_1147330 ?auto_1147331 ) ) ( not ( = ?auto_1147330 ?auto_1147332 ) ) ( not ( = ?auto_1147330 ?auto_1147329 ) ) ( not ( = ?auto_1147330 ?auto_1147333 ) ) ( not ( = ?auto_1147330 ?auto_1147335 ) ) ( not ( = ?auto_1147330 ?auto_1147334 ) ) ( not ( = ?auto_1147330 ?auto_1147336 ) ) ( not ( = ?auto_1147330 ?auto_1147337 ) ) ( not ( = ?auto_1147330 ?auto_1147338 ) ) ( not ( = ?auto_1147330 ?auto_1147339 ) ) ( not ( = ?auto_1147330 ?auto_1147340 ) ) ( not ( = ?auto_1147330 ?auto_1147341 ) ) ( not ( = ?auto_1147331 ?auto_1147332 ) ) ( not ( = ?auto_1147331 ?auto_1147329 ) ) ( not ( = ?auto_1147331 ?auto_1147333 ) ) ( not ( = ?auto_1147331 ?auto_1147335 ) ) ( not ( = ?auto_1147331 ?auto_1147334 ) ) ( not ( = ?auto_1147331 ?auto_1147336 ) ) ( not ( = ?auto_1147331 ?auto_1147337 ) ) ( not ( = ?auto_1147331 ?auto_1147338 ) ) ( not ( = ?auto_1147331 ?auto_1147339 ) ) ( not ( = ?auto_1147331 ?auto_1147340 ) ) ( not ( = ?auto_1147331 ?auto_1147341 ) ) ( not ( = ?auto_1147332 ?auto_1147329 ) ) ( not ( = ?auto_1147332 ?auto_1147333 ) ) ( not ( = ?auto_1147332 ?auto_1147335 ) ) ( not ( = ?auto_1147332 ?auto_1147334 ) ) ( not ( = ?auto_1147332 ?auto_1147336 ) ) ( not ( = ?auto_1147332 ?auto_1147337 ) ) ( not ( = ?auto_1147332 ?auto_1147338 ) ) ( not ( = ?auto_1147332 ?auto_1147339 ) ) ( not ( = ?auto_1147332 ?auto_1147340 ) ) ( not ( = ?auto_1147332 ?auto_1147341 ) ) ( not ( = ?auto_1147329 ?auto_1147333 ) ) ( not ( = ?auto_1147329 ?auto_1147335 ) ) ( not ( = ?auto_1147329 ?auto_1147334 ) ) ( not ( = ?auto_1147329 ?auto_1147336 ) ) ( not ( = ?auto_1147329 ?auto_1147337 ) ) ( not ( = ?auto_1147329 ?auto_1147338 ) ) ( not ( = ?auto_1147329 ?auto_1147339 ) ) ( not ( = ?auto_1147329 ?auto_1147340 ) ) ( not ( = ?auto_1147329 ?auto_1147341 ) ) ( not ( = ?auto_1147333 ?auto_1147335 ) ) ( not ( = ?auto_1147333 ?auto_1147334 ) ) ( not ( = ?auto_1147333 ?auto_1147336 ) ) ( not ( = ?auto_1147333 ?auto_1147337 ) ) ( not ( = ?auto_1147333 ?auto_1147338 ) ) ( not ( = ?auto_1147333 ?auto_1147339 ) ) ( not ( = ?auto_1147333 ?auto_1147340 ) ) ( not ( = ?auto_1147333 ?auto_1147341 ) ) ( not ( = ?auto_1147335 ?auto_1147334 ) ) ( not ( = ?auto_1147335 ?auto_1147336 ) ) ( not ( = ?auto_1147335 ?auto_1147337 ) ) ( not ( = ?auto_1147335 ?auto_1147338 ) ) ( not ( = ?auto_1147335 ?auto_1147339 ) ) ( not ( = ?auto_1147335 ?auto_1147340 ) ) ( not ( = ?auto_1147335 ?auto_1147341 ) ) ( not ( = ?auto_1147334 ?auto_1147336 ) ) ( not ( = ?auto_1147334 ?auto_1147337 ) ) ( not ( = ?auto_1147334 ?auto_1147338 ) ) ( not ( = ?auto_1147334 ?auto_1147339 ) ) ( not ( = ?auto_1147334 ?auto_1147340 ) ) ( not ( = ?auto_1147334 ?auto_1147341 ) ) ( not ( = ?auto_1147336 ?auto_1147337 ) ) ( not ( = ?auto_1147336 ?auto_1147338 ) ) ( not ( = ?auto_1147336 ?auto_1147339 ) ) ( not ( = ?auto_1147336 ?auto_1147340 ) ) ( not ( = ?auto_1147336 ?auto_1147341 ) ) ( not ( = ?auto_1147337 ?auto_1147338 ) ) ( not ( = ?auto_1147337 ?auto_1147339 ) ) ( not ( = ?auto_1147337 ?auto_1147340 ) ) ( not ( = ?auto_1147337 ?auto_1147341 ) ) ( not ( = ?auto_1147338 ?auto_1147339 ) ) ( not ( = ?auto_1147338 ?auto_1147340 ) ) ( not ( = ?auto_1147338 ?auto_1147341 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1147339 ?auto_1147340 ?auto_1147341 )
      ( MAKE-12CRATE-VERIFY ?auto_1147330 ?auto_1147331 ?auto_1147332 ?auto_1147329 ?auto_1147333 ?auto_1147335 ?auto_1147334 ?auto_1147336 ?auto_1147337 ?auto_1147338 ?auto_1147339 ?auto_1147340 ?auto_1147341 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1147492 - SURFACE
      ?auto_1147493 - SURFACE
      ?auto_1147494 - SURFACE
      ?auto_1147491 - SURFACE
      ?auto_1147495 - SURFACE
      ?auto_1147497 - SURFACE
      ?auto_1147496 - SURFACE
      ?auto_1147498 - SURFACE
      ?auto_1147499 - SURFACE
      ?auto_1147500 - SURFACE
      ?auto_1147501 - SURFACE
      ?auto_1147502 - SURFACE
      ?auto_1147503 - SURFACE
    )
    :vars
    (
      ?auto_1147504 - HOIST
      ?auto_1147509 - PLACE
      ?auto_1147507 - TRUCK
      ?auto_1147508 - PLACE
      ?auto_1147506 - HOIST
      ?auto_1147505 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1147504 ?auto_1147509 ) ( SURFACE-AT ?auto_1147502 ?auto_1147509 ) ( CLEAR ?auto_1147502 ) ( IS-CRATE ?auto_1147503 ) ( not ( = ?auto_1147502 ?auto_1147503 ) ) ( AVAILABLE ?auto_1147504 ) ( ON ?auto_1147502 ?auto_1147501 ) ( not ( = ?auto_1147501 ?auto_1147502 ) ) ( not ( = ?auto_1147501 ?auto_1147503 ) ) ( TRUCK-AT ?auto_1147507 ?auto_1147508 ) ( not ( = ?auto_1147508 ?auto_1147509 ) ) ( HOIST-AT ?auto_1147506 ?auto_1147508 ) ( not ( = ?auto_1147504 ?auto_1147506 ) ) ( AVAILABLE ?auto_1147506 ) ( SURFACE-AT ?auto_1147503 ?auto_1147508 ) ( ON ?auto_1147503 ?auto_1147505 ) ( CLEAR ?auto_1147503 ) ( not ( = ?auto_1147502 ?auto_1147505 ) ) ( not ( = ?auto_1147503 ?auto_1147505 ) ) ( not ( = ?auto_1147501 ?auto_1147505 ) ) ( ON ?auto_1147493 ?auto_1147492 ) ( ON ?auto_1147494 ?auto_1147493 ) ( ON ?auto_1147491 ?auto_1147494 ) ( ON ?auto_1147495 ?auto_1147491 ) ( ON ?auto_1147497 ?auto_1147495 ) ( ON ?auto_1147496 ?auto_1147497 ) ( ON ?auto_1147498 ?auto_1147496 ) ( ON ?auto_1147499 ?auto_1147498 ) ( ON ?auto_1147500 ?auto_1147499 ) ( ON ?auto_1147501 ?auto_1147500 ) ( not ( = ?auto_1147492 ?auto_1147493 ) ) ( not ( = ?auto_1147492 ?auto_1147494 ) ) ( not ( = ?auto_1147492 ?auto_1147491 ) ) ( not ( = ?auto_1147492 ?auto_1147495 ) ) ( not ( = ?auto_1147492 ?auto_1147497 ) ) ( not ( = ?auto_1147492 ?auto_1147496 ) ) ( not ( = ?auto_1147492 ?auto_1147498 ) ) ( not ( = ?auto_1147492 ?auto_1147499 ) ) ( not ( = ?auto_1147492 ?auto_1147500 ) ) ( not ( = ?auto_1147492 ?auto_1147501 ) ) ( not ( = ?auto_1147492 ?auto_1147502 ) ) ( not ( = ?auto_1147492 ?auto_1147503 ) ) ( not ( = ?auto_1147492 ?auto_1147505 ) ) ( not ( = ?auto_1147493 ?auto_1147494 ) ) ( not ( = ?auto_1147493 ?auto_1147491 ) ) ( not ( = ?auto_1147493 ?auto_1147495 ) ) ( not ( = ?auto_1147493 ?auto_1147497 ) ) ( not ( = ?auto_1147493 ?auto_1147496 ) ) ( not ( = ?auto_1147493 ?auto_1147498 ) ) ( not ( = ?auto_1147493 ?auto_1147499 ) ) ( not ( = ?auto_1147493 ?auto_1147500 ) ) ( not ( = ?auto_1147493 ?auto_1147501 ) ) ( not ( = ?auto_1147493 ?auto_1147502 ) ) ( not ( = ?auto_1147493 ?auto_1147503 ) ) ( not ( = ?auto_1147493 ?auto_1147505 ) ) ( not ( = ?auto_1147494 ?auto_1147491 ) ) ( not ( = ?auto_1147494 ?auto_1147495 ) ) ( not ( = ?auto_1147494 ?auto_1147497 ) ) ( not ( = ?auto_1147494 ?auto_1147496 ) ) ( not ( = ?auto_1147494 ?auto_1147498 ) ) ( not ( = ?auto_1147494 ?auto_1147499 ) ) ( not ( = ?auto_1147494 ?auto_1147500 ) ) ( not ( = ?auto_1147494 ?auto_1147501 ) ) ( not ( = ?auto_1147494 ?auto_1147502 ) ) ( not ( = ?auto_1147494 ?auto_1147503 ) ) ( not ( = ?auto_1147494 ?auto_1147505 ) ) ( not ( = ?auto_1147491 ?auto_1147495 ) ) ( not ( = ?auto_1147491 ?auto_1147497 ) ) ( not ( = ?auto_1147491 ?auto_1147496 ) ) ( not ( = ?auto_1147491 ?auto_1147498 ) ) ( not ( = ?auto_1147491 ?auto_1147499 ) ) ( not ( = ?auto_1147491 ?auto_1147500 ) ) ( not ( = ?auto_1147491 ?auto_1147501 ) ) ( not ( = ?auto_1147491 ?auto_1147502 ) ) ( not ( = ?auto_1147491 ?auto_1147503 ) ) ( not ( = ?auto_1147491 ?auto_1147505 ) ) ( not ( = ?auto_1147495 ?auto_1147497 ) ) ( not ( = ?auto_1147495 ?auto_1147496 ) ) ( not ( = ?auto_1147495 ?auto_1147498 ) ) ( not ( = ?auto_1147495 ?auto_1147499 ) ) ( not ( = ?auto_1147495 ?auto_1147500 ) ) ( not ( = ?auto_1147495 ?auto_1147501 ) ) ( not ( = ?auto_1147495 ?auto_1147502 ) ) ( not ( = ?auto_1147495 ?auto_1147503 ) ) ( not ( = ?auto_1147495 ?auto_1147505 ) ) ( not ( = ?auto_1147497 ?auto_1147496 ) ) ( not ( = ?auto_1147497 ?auto_1147498 ) ) ( not ( = ?auto_1147497 ?auto_1147499 ) ) ( not ( = ?auto_1147497 ?auto_1147500 ) ) ( not ( = ?auto_1147497 ?auto_1147501 ) ) ( not ( = ?auto_1147497 ?auto_1147502 ) ) ( not ( = ?auto_1147497 ?auto_1147503 ) ) ( not ( = ?auto_1147497 ?auto_1147505 ) ) ( not ( = ?auto_1147496 ?auto_1147498 ) ) ( not ( = ?auto_1147496 ?auto_1147499 ) ) ( not ( = ?auto_1147496 ?auto_1147500 ) ) ( not ( = ?auto_1147496 ?auto_1147501 ) ) ( not ( = ?auto_1147496 ?auto_1147502 ) ) ( not ( = ?auto_1147496 ?auto_1147503 ) ) ( not ( = ?auto_1147496 ?auto_1147505 ) ) ( not ( = ?auto_1147498 ?auto_1147499 ) ) ( not ( = ?auto_1147498 ?auto_1147500 ) ) ( not ( = ?auto_1147498 ?auto_1147501 ) ) ( not ( = ?auto_1147498 ?auto_1147502 ) ) ( not ( = ?auto_1147498 ?auto_1147503 ) ) ( not ( = ?auto_1147498 ?auto_1147505 ) ) ( not ( = ?auto_1147499 ?auto_1147500 ) ) ( not ( = ?auto_1147499 ?auto_1147501 ) ) ( not ( = ?auto_1147499 ?auto_1147502 ) ) ( not ( = ?auto_1147499 ?auto_1147503 ) ) ( not ( = ?auto_1147499 ?auto_1147505 ) ) ( not ( = ?auto_1147500 ?auto_1147501 ) ) ( not ( = ?auto_1147500 ?auto_1147502 ) ) ( not ( = ?auto_1147500 ?auto_1147503 ) ) ( not ( = ?auto_1147500 ?auto_1147505 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1147501 ?auto_1147502 ?auto_1147503 )
      ( MAKE-12CRATE-VERIFY ?auto_1147492 ?auto_1147493 ?auto_1147494 ?auto_1147491 ?auto_1147495 ?auto_1147497 ?auto_1147496 ?auto_1147498 ?auto_1147499 ?auto_1147500 ?auto_1147501 ?auto_1147502 ?auto_1147503 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1147655 - SURFACE
      ?auto_1147656 - SURFACE
      ?auto_1147657 - SURFACE
      ?auto_1147654 - SURFACE
      ?auto_1147658 - SURFACE
      ?auto_1147660 - SURFACE
      ?auto_1147659 - SURFACE
      ?auto_1147661 - SURFACE
      ?auto_1147662 - SURFACE
      ?auto_1147663 - SURFACE
      ?auto_1147664 - SURFACE
      ?auto_1147665 - SURFACE
      ?auto_1147666 - SURFACE
    )
    :vars
    (
      ?auto_1147668 - HOIST
      ?auto_1147671 - PLACE
      ?auto_1147669 - PLACE
      ?auto_1147672 - HOIST
      ?auto_1147667 - SURFACE
      ?auto_1147670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1147668 ?auto_1147671 ) ( SURFACE-AT ?auto_1147665 ?auto_1147671 ) ( CLEAR ?auto_1147665 ) ( IS-CRATE ?auto_1147666 ) ( not ( = ?auto_1147665 ?auto_1147666 ) ) ( AVAILABLE ?auto_1147668 ) ( ON ?auto_1147665 ?auto_1147664 ) ( not ( = ?auto_1147664 ?auto_1147665 ) ) ( not ( = ?auto_1147664 ?auto_1147666 ) ) ( not ( = ?auto_1147669 ?auto_1147671 ) ) ( HOIST-AT ?auto_1147672 ?auto_1147669 ) ( not ( = ?auto_1147668 ?auto_1147672 ) ) ( AVAILABLE ?auto_1147672 ) ( SURFACE-AT ?auto_1147666 ?auto_1147669 ) ( ON ?auto_1147666 ?auto_1147667 ) ( CLEAR ?auto_1147666 ) ( not ( = ?auto_1147665 ?auto_1147667 ) ) ( not ( = ?auto_1147666 ?auto_1147667 ) ) ( not ( = ?auto_1147664 ?auto_1147667 ) ) ( TRUCK-AT ?auto_1147670 ?auto_1147671 ) ( ON ?auto_1147656 ?auto_1147655 ) ( ON ?auto_1147657 ?auto_1147656 ) ( ON ?auto_1147654 ?auto_1147657 ) ( ON ?auto_1147658 ?auto_1147654 ) ( ON ?auto_1147660 ?auto_1147658 ) ( ON ?auto_1147659 ?auto_1147660 ) ( ON ?auto_1147661 ?auto_1147659 ) ( ON ?auto_1147662 ?auto_1147661 ) ( ON ?auto_1147663 ?auto_1147662 ) ( ON ?auto_1147664 ?auto_1147663 ) ( not ( = ?auto_1147655 ?auto_1147656 ) ) ( not ( = ?auto_1147655 ?auto_1147657 ) ) ( not ( = ?auto_1147655 ?auto_1147654 ) ) ( not ( = ?auto_1147655 ?auto_1147658 ) ) ( not ( = ?auto_1147655 ?auto_1147660 ) ) ( not ( = ?auto_1147655 ?auto_1147659 ) ) ( not ( = ?auto_1147655 ?auto_1147661 ) ) ( not ( = ?auto_1147655 ?auto_1147662 ) ) ( not ( = ?auto_1147655 ?auto_1147663 ) ) ( not ( = ?auto_1147655 ?auto_1147664 ) ) ( not ( = ?auto_1147655 ?auto_1147665 ) ) ( not ( = ?auto_1147655 ?auto_1147666 ) ) ( not ( = ?auto_1147655 ?auto_1147667 ) ) ( not ( = ?auto_1147656 ?auto_1147657 ) ) ( not ( = ?auto_1147656 ?auto_1147654 ) ) ( not ( = ?auto_1147656 ?auto_1147658 ) ) ( not ( = ?auto_1147656 ?auto_1147660 ) ) ( not ( = ?auto_1147656 ?auto_1147659 ) ) ( not ( = ?auto_1147656 ?auto_1147661 ) ) ( not ( = ?auto_1147656 ?auto_1147662 ) ) ( not ( = ?auto_1147656 ?auto_1147663 ) ) ( not ( = ?auto_1147656 ?auto_1147664 ) ) ( not ( = ?auto_1147656 ?auto_1147665 ) ) ( not ( = ?auto_1147656 ?auto_1147666 ) ) ( not ( = ?auto_1147656 ?auto_1147667 ) ) ( not ( = ?auto_1147657 ?auto_1147654 ) ) ( not ( = ?auto_1147657 ?auto_1147658 ) ) ( not ( = ?auto_1147657 ?auto_1147660 ) ) ( not ( = ?auto_1147657 ?auto_1147659 ) ) ( not ( = ?auto_1147657 ?auto_1147661 ) ) ( not ( = ?auto_1147657 ?auto_1147662 ) ) ( not ( = ?auto_1147657 ?auto_1147663 ) ) ( not ( = ?auto_1147657 ?auto_1147664 ) ) ( not ( = ?auto_1147657 ?auto_1147665 ) ) ( not ( = ?auto_1147657 ?auto_1147666 ) ) ( not ( = ?auto_1147657 ?auto_1147667 ) ) ( not ( = ?auto_1147654 ?auto_1147658 ) ) ( not ( = ?auto_1147654 ?auto_1147660 ) ) ( not ( = ?auto_1147654 ?auto_1147659 ) ) ( not ( = ?auto_1147654 ?auto_1147661 ) ) ( not ( = ?auto_1147654 ?auto_1147662 ) ) ( not ( = ?auto_1147654 ?auto_1147663 ) ) ( not ( = ?auto_1147654 ?auto_1147664 ) ) ( not ( = ?auto_1147654 ?auto_1147665 ) ) ( not ( = ?auto_1147654 ?auto_1147666 ) ) ( not ( = ?auto_1147654 ?auto_1147667 ) ) ( not ( = ?auto_1147658 ?auto_1147660 ) ) ( not ( = ?auto_1147658 ?auto_1147659 ) ) ( not ( = ?auto_1147658 ?auto_1147661 ) ) ( not ( = ?auto_1147658 ?auto_1147662 ) ) ( not ( = ?auto_1147658 ?auto_1147663 ) ) ( not ( = ?auto_1147658 ?auto_1147664 ) ) ( not ( = ?auto_1147658 ?auto_1147665 ) ) ( not ( = ?auto_1147658 ?auto_1147666 ) ) ( not ( = ?auto_1147658 ?auto_1147667 ) ) ( not ( = ?auto_1147660 ?auto_1147659 ) ) ( not ( = ?auto_1147660 ?auto_1147661 ) ) ( not ( = ?auto_1147660 ?auto_1147662 ) ) ( not ( = ?auto_1147660 ?auto_1147663 ) ) ( not ( = ?auto_1147660 ?auto_1147664 ) ) ( not ( = ?auto_1147660 ?auto_1147665 ) ) ( not ( = ?auto_1147660 ?auto_1147666 ) ) ( not ( = ?auto_1147660 ?auto_1147667 ) ) ( not ( = ?auto_1147659 ?auto_1147661 ) ) ( not ( = ?auto_1147659 ?auto_1147662 ) ) ( not ( = ?auto_1147659 ?auto_1147663 ) ) ( not ( = ?auto_1147659 ?auto_1147664 ) ) ( not ( = ?auto_1147659 ?auto_1147665 ) ) ( not ( = ?auto_1147659 ?auto_1147666 ) ) ( not ( = ?auto_1147659 ?auto_1147667 ) ) ( not ( = ?auto_1147661 ?auto_1147662 ) ) ( not ( = ?auto_1147661 ?auto_1147663 ) ) ( not ( = ?auto_1147661 ?auto_1147664 ) ) ( not ( = ?auto_1147661 ?auto_1147665 ) ) ( not ( = ?auto_1147661 ?auto_1147666 ) ) ( not ( = ?auto_1147661 ?auto_1147667 ) ) ( not ( = ?auto_1147662 ?auto_1147663 ) ) ( not ( = ?auto_1147662 ?auto_1147664 ) ) ( not ( = ?auto_1147662 ?auto_1147665 ) ) ( not ( = ?auto_1147662 ?auto_1147666 ) ) ( not ( = ?auto_1147662 ?auto_1147667 ) ) ( not ( = ?auto_1147663 ?auto_1147664 ) ) ( not ( = ?auto_1147663 ?auto_1147665 ) ) ( not ( = ?auto_1147663 ?auto_1147666 ) ) ( not ( = ?auto_1147663 ?auto_1147667 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1147664 ?auto_1147665 ?auto_1147666 )
      ( MAKE-12CRATE-VERIFY ?auto_1147655 ?auto_1147656 ?auto_1147657 ?auto_1147654 ?auto_1147658 ?auto_1147660 ?auto_1147659 ?auto_1147661 ?auto_1147662 ?auto_1147663 ?auto_1147664 ?auto_1147665 ?auto_1147666 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1147818 - SURFACE
      ?auto_1147819 - SURFACE
      ?auto_1147820 - SURFACE
      ?auto_1147817 - SURFACE
      ?auto_1147821 - SURFACE
      ?auto_1147823 - SURFACE
      ?auto_1147822 - SURFACE
      ?auto_1147824 - SURFACE
      ?auto_1147825 - SURFACE
      ?auto_1147826 - SURFACE
      ?auto_1147827 - SURFACE
      ?auto_1147828 - SURFACE
      ?auto_1147829 - SURFACE
    )
    :vars
    (
      ?auto_1147833 - HOIST
      ?auto_1147835 - PLACE
      ?auto_1147834 - PLACE
      ?auto_1147832 - HOIST
      ?auto_1147830 - SURFACE
      ?auto_1147831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1147833 ?auto_1147835 ) ( IS-CRATE ?auto_1147829 ) ( not ( = ?auto_1147828 ?auto_1147829 ) ) ( not ( = ?auto_1147827 ?auto_1147828 ) ) ( not ( = ?auto_1147827 ?auto_1147829 ) ) ( not ( = ?auto_1147834 ?auto_1147835 ) ) ( HOIST-AT ?auto_1147832 ?auto_1147834 ) ( not ( = ?auto_1147833 ?auto_1147832 ) ) ( AVAILABLE ?auto_1147832 ) ( SURFACE-AT ?auto_1147829 ?auto_1147834 ) ( ON ?auto_1147829 ?auto_1147830 ) ( CLEAR ?auto_1147829 ) ( not ( = ?auto_1147828 ?auto_1147830 ) ) ( not ( = ?auto_1147829 ?auto_1147830 ) ) ( not ( = ?auto_1147827 ?auto_1147830 ) ) ( TRUCK-AT ?auto_1147831 ?auto_1147835 ) ( SURFACE-AT ?auto_1147827 ?auto_1147835 ) ( CLEAR ?auto_1147827 ) ( LIFTING ?auto_1147833 ?auto_1147828 ) ( IS-CRATE ?auto_1147828 ) ( ON ?auto_1147819 ?auto_1147818 ) ( ON ?auto_1147820 ?auto_1147819 ) ( ON ?auto_1147817 ?auto_1147820 ) ( ON ?auto_1147821 ?auto_1147817 ) ( ON ?auto_1147823 ?auto_1147821 ) ( ON ?auto_1147822 ?auto_1147823 ) ( ON ?auto_1147824 ?auto_1147822 ) ( ON ?auto_1147825 ?auto_1147824 ) ( ON ?auto_1147826 ?auto_1147825 ) ( ON ?auto_1147827 ?auto_1147826 ) ( not ( = ?auto_1147818 ?auto_1147819 ) ) ( not ( = ?auto_1147818 ?auto_1147820 ) ) ( not ( = ?auto_1147818 ?auto_1147817 ) ) ( not ( = ?auto_1147818 ?auto_1147821 ) ) ( not ( = ?auto_1147818 ?auto_1147823 ) ) ( not ( = ?auto_1147818 ?auto_1147822 ) ) ( not ( = ?auto_1147818 ?auto_1147824 ) ) ( not ( = ?auto_1147818 ?auto_1147825 ) ) ( not ( = ?auto_1147818 ?auto_1147826 ) ) ( not ( = ?auto_1147818 ?auto_1147827 ) ) ( not ( = ?auto_1147818 ?auto_1147828 ) ) ( not ( = ?auto_1147818 ?auto_1147829 ) ) ( not ( = ?auto_1147818 ?auto_1147830 ) ) ( not ( = ?auto_1147819 ?auto_1147820 ) ) ( not ( = ?auto_1147819 ?auto_1147817 ) ) ( not ( = ?auto_1147819 ?auto_1147821 ) ) ( not ( = ?auto_1147819 ?auto_1147823 ) ) ( not ( = ?auto_1147819 ?auto_1147822 ) ) ( not ( = ?auto_1147819 ?auto_1147824 ) ) ( not ( = ?auto_1147819 ?auto_1147825 ) ) ( not ( = ?auto_1147819 ?auto_1147826 ) ) ( not ( = ?auto_1147819 ?auto_1147827 ) ) ( not ( = ?auto_1147819 ?auto_1147828 ) ) ( not ( = ?auto_1147819 ?auto_1147829 ) ) ( not ( = ?auto_1147819 ?auto_1147830 ) ) ( not ( = ?auto_1147820 ?auto_1147817 ) ) ( not ( = ?auto_1147820 ?auto_1147821 ) ) ( not ( = ?auto_1147820 ?auto_1147823 ) ) ( not ( = ?auto_1147820 ?auto_1147822 ) ) ( not ( = ?auto_1147820 ?auto_1147824 ) ) ( not ( = ?auto_1147820 ?auto_1147825 ) ) ( not ( = ?auto_1147820 ?auto_1147826 ) ) ( not ( = ?auto_1147820 ?auto_1147827 ) ) ( not ( = ?auto_1147820 ?auto_1147828 ) ) ( not ( = ?auto_1147820 ?auto_1147829 ) ) ( not ( = ?auto_1147820 ?auto_1147830 ) ) ( not ( = ?auto_1147817 ?auto_1147821 ) ) ( not ( = ?auto_1147817 ?auto_1147823 ) ) ( not ( = ?auto_1147817 ?auto_1147822 ) ) ( not ( = ?auto_1147817 ?auto_1147824 ) ) ( not ( = ?auto_1147817 ?auto_1147825 ) ) ( not ( = ?auto_1147817 ?auto_1147826 ) ) ( not ( = ?auto_1147817 ?auto_1147827 ) ) ( not ( = ?auto_1147817 ?auto_1147828 ) ) ( not ( = ?auto_1147817 ?auto_1147829 ) ) ( not ( = ?auto_1147817 ?auto_1147830 ) ) ( not ( = ?auto_1147821 ?auto_1147823 ) ) ( not ( = ?auto_1147821 ?auto_1147822 ) ) ( not ( = ?auto_1147821 ?auto_1147824 ) ) ( not ( = ?auto_1147821 ?auto_1147825 ) ) ( not ( = ?auto_1147821 ?auto_1147826 ) ) ( not ( = ?auto_1147821 ?auto_1147827 ) ) ( not ( = ?auto_1147821 ?auto_1147828 ) ) ( not ( = ?auto_1147821 ?auto_1147829 ) ) ( not ( = ?auto_1147821 ?auto_1147830 ) ) ( not ( = ?auto_1147823 ?auto_1147822 ) ) ( not ( = ?auto_1147823 ?auto_1147824 ) ) ( not ( = ?auto_1147823 ?auto_1147825 ) ) ( not ( = ?auto_1147823 ?auto_1147826 ) ) ( not ( = ?auto_1147823 ?auto_1147827 ) ) ( not ( = ?auto_1147823 ?auto_1147828 ) ) ( not ( = ?auto_1147823 ?auto_1147829 ) ) ( not ( = ?auto_1147823 ?auto_1147830 ) ) ( not ( = ?auto_1147822 ?auto_1147824 ) ) ( not ( = ?auto_1147822 ?auto_1147825 ) ) ( not ( = ?auto_1147822 ?auto_1147826 ) ) ( not ( = ?auto_1147822 ?auto_1147827 ) ) ( not ( = ?auto_1147822 ?auto_1147828 ) ) ( not ( = ?auto_1147822 ?auto_1147829 ) ) ( not ( = ?auto_1147822 ?auto_1147830 ) ) ( not ( = ?auto_1147824 ?auto_1147825 ) ) ( not ( = ?auto_1147824 ?auto_1147826 ) ) ( not ( = ?auto_1147824 ?auto_1147827 ) ) ( not ( = ?auto_1147824 ?auto_1147828 ) ) ( not ( = ?auto_1147824 ?auto_1147829 ) ) ( not ( = ?auto_1147824 ?auto_1147830 ) ) ( not ( = ?auto_1147825 ?auto_1147826 ) ) ( not ( = ?auto_1147825 ?auto_1147827 ) ) ( not ( = ?auto_1147825 ?auto_1147828 ) ) ( not ( = ?auto_1147825 ?auto_1147829 ) ) ( not ( = ?auto_1147825 ?auto_1147830 ) ) ( not ( = ?auto_1147826 ?auto_1147827 ) ) ( not ( = ?auto_1147826 ?auto_1147828 ) ) ( not ( = ?auto_1147826 ?auto_1147829 ) ) ( not ( = ?auto_1147826 ?auto_1147830 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1147827 ?auto_1147828 ?auto_1147829 )
      ( MAKE-12CRATE-VERIFY ?auto_1147818 ?auto_1147819 ?auto_1147820 ?auto_1147817 ?auto_1147821 ?auto_1147823 ?auto_1147822 ?auto_1147824 ?auto_1147825 ?auto_1147826 ?auto_1147827 ?auto_1147828 ?auto_1147829 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1147981 - SURFACE
      ?auto_1147982 - SURFACE
      ?auto_1147983 - SURFACE
      ?auto_1147980 - SURFACE
      ?auto_1147984 - SURFACE
      ?auto_1147986 - SURFACE
      ?auto_1147985 - SURFACE
      ?auto_1147987 - SURFACE
      ?auto_1147988 - SURFACE
      ?auto_1147989 - SURFACE
      ?auto_1147990 - SURFACE
      ?auto_1147991 - SURFACE
      ?auto_1147992 - SURFACE
    )
    :vars
    (
      ?auto_1147994 - HOIST
      ?auto_1147998 - PLACE
      ?auto_1147996 - PLACE
      ?auto_1147995 - HOIST
      ?auto_1147993 - SURFACE
      ?auto_1147997 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1147994 ?auto_1147998 ) ( IS-CRATE ?auto_1147992 ) ( not ( = ?auto_1147991 ?auto_1147992 ) ) ( not ( = ?auto_1147990 ?auto_1147991 ) ) ( not ( = ?auto_1147990 ?auto_1147992 ) ) ( not ( = ?auto_1147996 ?auto_1147998 ) ) ( HOIST-AT ?auto_1147995 ?auto_1147996 ) ( not ( = ?auto_1147994 ?auto_1147995 ) ) ( AVAILABLE ?auto_1147995 ) ( SURFACE-AT ?auto_1147992 ?auto_1147996 ) ( ON ?auto_1147992 ?auto_1147993 ) ( CLEAR ?auto_1147992 ) ( not ( = ?auto_1147991 ?auto_1147993 ) ) ( not ( = ?auto_1147992 ?auto_1147993 ) ) ( not ( = ?auto_1147990 ?auto_1147993 ) ) ( TRUCK-AT ?auto_1147997 ?auto_1147998 ) ( SURFACE-AT ?auto_1147990 ?auto_1147998 ) ( CLEAR ?auto_1147990 ) ( IS-CRATE ?auto_1147991 ) ( AVAILABLE ?auto_1147994 ) ( IN ?auto_1147991 ?auto_1147997 ) ( ON ?auto_1147982 ?auto_1147981 ) ( ON ?auto_1147983 ?auto_1147982 ) ( ON ?auto_1147980 ?auto_1147983 ) ( ON ?auto_1147984 ?auto_1147980 ) ( ON ?auto_1147986 ?auto_1147984 ) ( ON ?auto_1147985 ?auto_1147986 ) ( ON ?auto_1147987 ?auto_1147985 ) ( ON ?auto_1147988 ?auto_1147987 ) ( ON ?auto_1147989 ?auto_1147988 ) ( ON ?auto_1147990 ?auto_1147989 ) ( not ( = ?auto_1147981 ?auto_1147982 ) ) ( not ( = ?auto_1147981 ?auto_1147983 ) ) ( not ( = ?auto_1147981 ?auto_1147980 ) ) ( not ( = ?auto_1147981 ?auto_1147984 ) ) ( not ( = ?auto_1147981 ?auto_1147986 ) ) ( not ( = ?auto_1147981 ?auto_1147985 ) ) ( not ( = ?auto_1147981 ?auto_1147987 ) ) ( not ( = ?auto_1147981 ?auto_1147988 ) ) ( not ( = ?auto_1147981 ?auto_1147989 ) ) ( not ( = ?auto_1147981 ?auto_1147990 ) ) ( not ( = ?auto_1147981 ?auto_1147991 ) ) ( not ( = ?auto_1147981 ?auto_1147992 ) ) ( not ( = ?auto_1147981 ?auto_1147993 ) ) ( not ( = ?auto_1147982 ?auto_1147983 ) ) ( not ( = ?auto_1147982 ?auto_1147980 ) ) ( not ( = ?auto_1147982 ?auto_1147984 ) ) ( not ( = ?auto_1147982 ?auto_1147986 ) ) ( not ( = ?auto_1147982 ?auto_1147985 ) ) ( not ( = ?auto_1147982 ?auto_1147987 ) ) ( not ( = ?auto_1147982 ?auto_1147988 ) ) ( not ( = ?auto_1147982 ?auto_1147989 ) ) ( not ( = ?auto_1147982 ?auto_1147990 ) ) ( not ( = ?auto_1147982 ?auto_1147991 ) ) ( not ( = ?auto_1147982 ?auto_1147992 ) ) ( not ( = ?auto_1147982 ?auto_1147993 ) ) ( not ( = ?auto_1147983 ?auto_1147980 ) ) ( not ( = ?auto_1147983 ?auto_1147984 ) ) ( not ( = ?auto_1147983 ?auto_1147986 ) ) ( not ( = ?auto_1147983 ?auto_1147985 ) ) ( not ( = ?auto_1147983 ?auto_1147987 ) ) ( not ( = ?auto_1147983 ?auto_1147988 ) ) ( not ( = ?auto_1147983 ?auto_1147989 ) ) ( not ( = ?auto_1147983 ?auto_1147990 ) ) ( not ( = ?auto_1147983 ?auto_1147991 ) ) ( not ( = ?auto_1147983 ?auto_1147992 ) ) ( not ( = ?auto_1147983 ?auto_1147993 ) ) ( not ( = ?auto_1147980 ?auto_1147984 ) ) ( not ( = ?auto_1147980 ?auto_1147986 ) ) ( not ( = ?auto_1147980 ?auto_1147985 ) ) ( not ( = ?auto_1147980 ?auto_1147987 ) ) ( not ( = ?auto_1147980 ?auto_1147988 ) ) ( not ( = ?auto_1147980 ?auto_1147989 ) ) ( not ( = ?auto_1147980 ?auto_1147990 ) ) ( not ( = ?auto_1147980 ?auto_1147991 ) ) ( not ( = ?auto_1147980 ?auto_1147992 ) ) ( not ( = ?auto_1147980 ?auto_1147993 ) ) ( not ( = ?auto_1147984 ?auto_1147986 ) ) ( not ( = ?auto_1147984 ?auto_1147985 ) ) ( not ( = ?auto_1147984 ?auto_1147987 ) ) ( not ( = ?auto_1147984 ?auto_1147988 ) ) ( not ( = ?auto_1147984 ?auto_1147989 ) ) ( not ( = ?auto_1147984 ?auto_1147990 ) ) ( not ( = ?auto_1147984 ?auto_1147991 ) ) ( not ( = ?auto_1147984 ?auto_1147992 ) ) ( not ( = ?auto_1147984 ?auto_1147993 ) ) ( not ( = ?auto_1147986 ?auto_1147985 ) ) ( not ( = ?auto_1147986 ?auto_1147987 ) ) ( not ( = ?auto_1147986 ?auto_1147988 ) ) ( not ( = ?auto_1147986 ?auto_1147989 ) ) ( not ( = ?auto_1147986 ?auto_1147990 ) ) ( not ( = ?auto_1147986 ?auto_1147991 ) ) ( not ( = ?auto_1147986 ?auto_1147992 ) ) ( not ( = ?auto_1147986 ?auto_1147993 ) ) ( not ( = ?auto_1147985 ?auto_1147987 ) ) ( not ( = ?auto_1147985 ?auto_1147988 ) ) ( not ( = ?auto_1147985 ?auto_1147989 ) ) ( not ( = ?auto_1147985 ?auto_1147990 ) ) ( not ( = ?auto_1147985 ?auto_1147991 ) ) ( not ( = ?auto_1147985 ?auto_1147992 ) ) ( not ( = ?auto_1147985 ?auto_1147993 ) ) ( not ( = ?auto_1147987 ?auto_1147988 ) ) ( not ( = ?auto_1147987 ?auto_1147989 ) ) ( not ( = ?auto_1147987 ?auto_1147990 ) ) ( not ( = ?auto_1147987 ?auto_1147991 ) ) ( not ( = ?auto_1147987 ?auto_1147992 ) ) ( not ( = ?auto_1147987 ?auto_1147993 ) ) ( not ( = ?auto_1147988 ?auto_1147989 ) ) ( not ( = ?auto_1147988 ?auto_1147990 ) ) ( not ( = ?auto_1147988 ?auto_1147991 ) ) ( not ( = ?auto_1147988 ?auto_1147992 ) ) ( not ( = ?auto_1147988 ?auto_1147993 ) ) ( not ( = ?auto_1147989 ?auto_1147990 ) ) ( not ( = ?auto_1147989 ?auto_1147991 ) ) ( not ( = ?auto_1147989 ?auto_1147992 ) ) ( not ( = ?auto_1147989 ?auto_1147993 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1147990 ?auto_1147991 ?auto_1147992 )
      ( MAKE-12CRATE-VERIFY ?auto_1147981 ?auto_1147982 ?auto_1147983 ?auto_1147980 ?auto_1147984 ?auto_1147986 ?auto_1147985 ?auto_1147987 ?auto_1147988 ?auto_1147989 ?auto_1147990 ?auto_1147991 ?auto_1147992 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1159585 - SURFACE
      ?auto_1159586 - SURFACE
      ?auto_1159587 - SURFACE
      ?auto_1159584 - SURFACE
      ?auto_1159588 - SURFACE
      ?auto_1159590 - SURFACE
      ?auto_1159589 - SURFACE
      ?auto_1159591 - SURFACE
      ?auto_1159592 - SURFACE
      ?auto_1159593 - SURFACE
      ?auto_1159594 - SURFACE
      ?auto_1159595 - SURFACE
      ?auto_1159596 - SURFACE
      ?auto_1159597 - SURFACE
    )
    :vars
    (
      ?auto_1159598 - HOIST
      ?auto_1159599 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1159598 ?auto_1159599 ) ( SURFACE-AT ?auto_1159596 ?auto_1159599 ) ( CLEAR ?auto_1159596 ) ( LIFTING ?auto_1159598 ?auto_1159597 ) ( IS-CRATE ?auto_1159597 ) ( not ( = ?auto_1159596 ?auto_1159597 ) ) ( ON ?auto_1159586 ?auto_1159585 ) ( ON ?auto_1159587 ?auto_1159586 ) ( ON ?auto_1159584 ?auto_1159587 ) ( ON ?auto_1159588 ?auto_1159584 ) ( ON ?auto_1159590 ?auto_1159588 ) ( ON ?auto_1159589 ?auto_1159590 ) ( ON ?auto_1159591 ?auto_1159589 ) ( ON ?auto_1159592 ?auto_1159591 ) ( ON ?auto_1159593 ?auto_1159592 ) ( ON ?auto_1159594 ?auto_1159593 ) ( ON ?auto_1159595 ?auto_1159594 ) ( ON ?auto_1159596 ?auto_1159595 ) ( not ( = ?auto_1159585 ?auto_1159586 ) ) ( not ( = ?auto_1159585 ?auto_1159587 ) ) ( not ( = ?auto_1159585 ?auto_1159584 ) ) ( not ( = ?auto_1159585 ?auto_1159588 ) ) ( not ( = ?auto_1159585 ?auto_1159590 ) ) ( not ( = ?auto_1159585 ?auto_1159589 ) ) ( not ( = ?auto_1159585 ?auto_1159591 ) ) ( not ( = ?auto_1159585 ?auto_1159592 ) ) ( not ( = ?auto_1159585 ?auto_1159593 ) ) ( not ( = ?auto_1159585 ?auto_1159594 ) ) ( not ( = ?auto_1159585 ?auto_1159595 ) ) ( not ( = ?auto_1159585 ?auto_1159596 ) ) ( not ( = ?auto_1159585 ?auto_1159597 ) ) ( not ( = ?auto_1159586 ?auto_1159587 ) ) ( not ( = ?auto_1159586 ?auto_1159584 ) ) ( not ( = ?auto_1159586 ?auto_1159588 ) ) ( not ( = ?auto_1159586 ?auto_1159590 ) ) ( not ( = ?auto_1159586 ?auto_1159589 ) ) ( not ( = ?auto_1159586 ?auto_1159591 ) ) ( not ( = ?auto_1159586 ?auto_1159592 ) ) ( not ( = ?auto_1159586 ?auto_1159593 ) ) ( not ( = ?auto_1159586 ?auto_1159594 ) ) ( not ( = ?auto_1159586 ?auto_1159595 ) ) ( not ( = ?auto_1159586 ?auto_1159596 ) ) ( not ( = ?auto_1159586 ?auto_1159597 ) ) ( not ( = ?auto_1159587 ?auto_1159584 ) ) ( not ( = ?auto_1159587 ?auto_1159588 ) ) ( not ( = ?auto_1159587 ?auto_1159590 ) ) ( not ( = ?auto_1159587 ?auto_1159589 ) ) ( not ( = ?auto_1159587 ?auto_1159591 ) ) ( not ( = ?auto_1159587 ?auto_1159592 ) ) ( not ( = ?auto_1159587 ?auto_1159593 ) ) ( not ( = ?auto_1159587 ?auto_1159594 ) ) ( not ( = ?auto_1159587 ?auto_1159595 ) ) ( not ( = ?auto_1159587 ?auto_1159596 ) ) ( not ( = ?auto_1159587 ?auto_1159597 ) ) ( not ( = ?auto_1159584 ?auto_1159588 ) ) ( not ( = ?auto_1159584 ?auto_1159590 ) ) ( not ( = ?auto_1159584 ?auto_1159589 ) ) ( not ( = ?auto_1159584 ?auto_1159591 ) ) ( not ( = ?auto_1159584 ?auto_1159592 ) ) ( not ( = ?auto_1159584 ?auto_1159593 ) ) ( not ( = ?auto_1159584 ?auto_1159594 ) ) ( not ( = ?auto_1159584 ?auto_1159595 ) ) ( not ( = ?auto_1159584 ?auto_1159596 ) ) ( not ( = ?auto_1159584 ?auto_1159597 ) ) ( not ( = ?auto_1159588 ?auto_1159590 ) ) ( not ( = ?auto_1159588 ?auto_1159589 ) ) ( not ( = ?auto_1159588 ?auto_1159591 ) ) ( not ( = ?auto_1159588 ?auto_1159592 ) ) ( not ( = ?auto_1159588 ?auto_1159593 ) ) ( not ( = ?auto_1159588 ?auto_1159594 ) ) ( not ( = ?auto_1159588 ?auto_1159595 ) ) ( not ( = ?auto_1159588 ?auto_1159596 ) ) ( not ( = ?auto_1159588 ?auto_1159597 ) ) ( not ( = ?auto_1159590 ?auto_1159589 ) ) ( not ( = ?auto_1159590 ?auto_1159591 ) ) ( not ( = ?auto_1159590 ?auto_1159592 ) ) ( not ( = ?auto_1159590 ?auto_1159593 ) ) ( not ( = ?auto_1159590 ?auto_1159594 ) ) ( not ( = ?auto_1159590 ?auto_1159595 ) ) ( not ( = ?auto_1159590 ?auto_1159596 ) ) ( not ( = ?auto_1159590 ?auto_1159597 ) ) ( not ( = ?auto_1159589 ?auto_1159591 ) ) ( not ( = ?auto_1159589 ?auto_1159592 ) ) ( not ( = ?auto_1159589 ?auto_1159593 ) ) ( not ( = ?auto_1159589 ?auto_1159594 ) ) ( not ( = ?auto_1159589 ?auto_1159595 ) ) ( not ( = ?auto_1159589 ?auto_1159596 ) ) ( not ( = ?auto_1159589 ?auto_1159597 ) ) ( not ( = ?auto_1159591 ?auto_1159592 ) ) ( not ( = ?auto_1159591 ?auto_1159593 ) ) ( not ( = ?auto_1159591 ?auto_1159594 ) ) ( not ( = ?auto_1159591 ?auto_1159595 ) ) ( not ( = ?auto_1159591 ?auto_1159596 ) ) ( not ( = ?auto_1159591 ?auto_1159597 ) ) ( not ( = ?auto_1159592 ?auto_1159593 ) ) ( not ( = ?auto_1159592 ?auto_1159594 ) ) ( not ( = ?auto_1159592 ?auto_1159595 ) ) ( not ( = ?auto_1159592 ?auto_1159596 ) ) ( not ( = ?auto_1159592 ?auto_1159597 ) ) ( not ( = ?auto_1159593 ?auto_1159594 ) ) ( not ( = ?auto_1159593 ?auto_1159595 ) ) ( not ( = ?auto_1159593 ?auto_1159596 ) ) ( not ( = ?auto_1159593 ?auto_1159597 ) ) ( not ( = ?auto_1159594 ?auto_1159595 ) ) ( not ( = ?auto_1159594 ?auto_1159596 ) ) ( not ( = ?auto_1159594 ?auto_1159597 ) ) ( not ( = ?auto_1159595 ?auto_1159596 ) ) ( not ( = ?auto_1159595 ?auto_1159597 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1159596 ?auto_1159597 )
      ( MAKE-13CRATE-VERIFY ?auto_1159585 ?auto_1159586 ?auto_1159587 ?auto_1159584 ?auto_1159588 ?auto_1159590 ?auto_1159589 ?auto_1159591 ?auto_1159592 ?auto_1159593 ?auto_1159594 ?auto_1159595 ?auto_1159596 ?auto_1159597 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1159727 - SURFACE
      ?auto_1159728 - SURFACE
      ?auto_1159729 - SURFACE
      ?auto_1159726 - SURFACE
      ?auto_1159730 - SURFACE
      ?auto_1159732 - SURFACE
      ?auto_1159731 - SURFACE
      ?auto_1159733 - SURFACE
      ?auto_1159734 - SURFACE
      ?auto_1159735 - SURFACE
      ?auto_1159736 - SURFACE
      ?auto_1159737 - SURFACE
      ?auto_1159738 - SURFACE
      ?auto_1159739 - SURFACE
    )
    :vars
    (
      ?auto_1159740 - HOIST
      ?auto_1159742 - PLACE
      ?auto_1159741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1159740 ?auto_1159742 ) ( SURFACE-AT ?auto_1159738 ?auto_1159742 ) ( CLEAR ?auto_1159738 ) ( IS-CRATE ?auto_1159739 ) ( not ( = ?auto_1159738 ?auto_1159739 ) ) ( TRUCK-AT ?auto_1159741 ?auto_1159742 ) ( AVAILABLE ?auto_1159740 ) ( IN ?auto_1159739 ?auto_1159741 ) ( ON ?auto_1159738 ?auto_1159737 ) ( not ( = ?auto_1159737 ?auto_1159738 ) ) ( not ( = ?auto_1159737 ?auto_1159739 ) ) ( ON ?auto_1159728 ?auto_1159727 ) ( ON ?auto_1159729 ?auto_1159728 ) ( ON ?auto_1159726 ?auto_1159729 ) ( ON ?auto_1159730 ?auto_1159726 ) ( ON ?auto_1159732 ?auto_1159730 ) ( ON ?auto_1159731 ?auto_1159732 ) ( ON ?auto_1159733 ?auto_1159731 ) ( ON ?auto_1159734 ?auto_1159733 ) ( ON ?auto_1159735 ?auto_1159734 ) ( ON ?auto_1159736 ?auto_1159735 ) ( ON ?auto_1159737 ?auto_1159736 ) ( not ( = ?auto_1159727 ?auto_1159728 ) ) ( not ( = ?auto_1159727 ?auto_1159729 ) ) ( not ( = ?auto_1159727 ?auto_1159726 ) ) ( not ( = ?auto_1159727 ?auto_1159730 ) ) ( not ( = ?auto_1159727 ?auto_1159732 ) ) ( not ( = ?auto_1159727 ?auto_1159731 ) ) ( not ( = ?auto_1159727 ?auto_1159733 ) ) ( not ( = ?auto_1159727 ?auto_1159734 ) ) ( not ( = ?auto_1159727 ?auto_1159735 ) ) ( not ( = ?auto_1159727 ?auto_1159736 ) ) ( not ( = ?auto_1159727 ?auto_1159737 ) ) ( not ( = ?auto_1159727 ?auto_1159738 ) ) ( not ( = ?auto_1159727 ?auto_1159739 ) ) ( not ( = ?auto_1159728 ?auto_1159729 ) ) ( not ( = ?auto_1159728 ?auto_1159726 ) ) ( not ( = ?auto_1159728 ?auto_1159730 ) ) ( not ( = ?auto_1159728 ?auto_1159732 ) ) ( not ( = ?auto_1159728 ?auto_1159731 ) ) ( not ( = ?auto_1159728 ?auto_1159733 ) ) ( not ( = ?auto_1159728 ?auto_1159734 ) ) ( not ( = ?auto_1159728 ?auto_1159735 ) ) ( not ( = ?auto_1159728 ?auto_1159736 ) ) ( not ( = ?auto_1159728 ?auto_1159737 ) ) ( not ( = ?auto_1159728 ?auto_1159738 ) ) ( not ( = ?auto_1159728 ?auto_1159739 ) ) ( not ( = ?auto_1159729 ?auto_1159726 ) ) ( not ( = ?auto_1159729 ?auto_1159730 ) ) ( not ( = ?auto_1159729 ?auto_1159732 ) ) ( not ( = ?auto_1159729 ?auto_1159731 ) ) ( not ( = ?auto_1159729 ?auto_1159733 ) ) ( not ( = ?auto_1159729 ?auto_1159734 ) ) ( not ( = ?auto_1159729 ?auto_1159735 ) ) ( not ( = ?auto_1159729 ?auto_1159736 ) ) ( not ( = ?auto_1159729 ?auto_1159737 ) ) ( not ( = ?auto_1159729 ?auto_1159738 ) ) ( not ( = ?auto_1159729 ?auto_1159739 ) ) ( not ( = ?auto_1159726 ?auto_1159730 ) ) ( not ( = ?auto_1159726 ?auto_1159732 ) ) ( not ( = ?auto_1159726 ?auto_1159731 ) ) ( not ( = ?auto_1159726 ?auto_1159733 ) ) ( not ( = ?auto_1159726 ?auto_1159734 ) ) ( not ( = ?auto_1159726 ?auto_1159735 ) ) ( not ( = ?auto_1159726 ?auto_1159736 ) ) ( not ( = ?auto_1159726 ?auto_1159737 ) ) ( not ( = ?auto_1159726 ?auto_1159738 ) ) ( not ( = ?auto_1159726 ?auto_1159739 ) ) ( not ( = ?auto_1159730 ?auto_1159732 ) ) ( not ( = ?auto_1159730 ?auto_1159731 ) ) ( not ( = ?auto_1159730 ?auto_1159733 ) ) ( not ( = ?auto_1159730 ?auto_1159734 ) ) ( not ( = ?auto_1159730 ?auto_1159735 ) ) ( not ( = ?auto_1159730 ?auto_1159736 ) ) ( not ( = ?auto_1159730 ?auto_1159737 ) ) ( not ( = ?auto_1159730 ?auto_1159738 ) ) ( not ( = ?auto_1159730 ?auto_1159739 ) ) ( not ( = ?auto_1159732 ?auto_1159731 ) ) ( not ( = ?auto_1159732 ?auto_1159733 ) ) ( not ( = ?auto_1159732 ?auto_1159734 ) ) ( not ( = ?auto_1159732 ?auto_1159735 ) ) ( not ( = ?auto_1159732 ?auto_1159736 ) ) ( not ( = ?auto_1159732 ?auto_1159737 ) ) ( not ( = ?auto_1159732 ?auto_1159738 ) ) ( not ( = ?auto_1159732 ?auto_1159739 ) ) ( not ( = ?auto_1159731 ?auto_1159733 ) ) ( not ( = ?auto_1159731 ?auto_1159734 ) ) ( not ( = ?auto_1159731 ?auto_1159735 ) ) ( not ( = ?auto_1159731 ?auto_1159736 ) ) ( not ( = ?auto_1159731 ?auto_1159737 ) ) ( not ( = ?auto_1159731 ?auto_1159738 ) ) ( not ( = ?auto_1159731 ?auto_1159739 ) ) ( not ( = ?auto_1159733 ?auto_1159734 ) ) ( not ( = ?auto_1159733 ?auto_1159735 ) ) ( not ( = ?auto_1159733 ?auto_1159736 ) ) ( not ( = ?auto_1159733 ?auto_1159737 ) ) ( not ( = ?auto_1159733 ?auto_1159738 ) ) ( not ( = ?auto_1159733 ?auto_1159739 ) ) ( not ( = ?auto_1159734 ?auto_1159735 ) ) ( not ( = ?auto_1159734 ?auto_1159736 ) ) ( not ( = ?auto_1159734 ?auto_1159737 ) ) ( not ( = ?auto_1159734 ?auto_1159738 ) ) ( not ( = ?auto_1159734 ?auto_1159739 ) ) ( not ( = ?auto_1159735 ?auto_1159736 ) ) ( not ( = ?auto_1159735 ?auto_1159737 ) ) ( not ( = ?auto_1159735 ?auto_1159738 ) ) ( not ( = ?auto_1159735 ?auto_1159739 ) ) ( not ( = ?auto_1159736 ?auto_1159737 ) ) ( not ( = ?auto_1159736 ?auto_1159738 ) ) ( not ( = ?auto_1159736 ?auto_1159739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1159737 ?auto_1159738 ?auto_1159739 )
      ( MAKE-13CRATE-VERIFY ?auto_1159727 ?auto_1159728 ?auto_1159729 ?auto_1159726 ?auto_1159730 ?auto_1159732 ?auto_1159731 ?auto_1159733 ?auto_1159734 ?auto_1159735 ?auto_1159736 ?auto_1159737 ?auto_1159738 ?auto_1159739 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1159883 - SURFACE
      ?auto_1159884 - SURFACE
      ?auto_1159885 - SURFACE
      ?auto_1159882 - SURFACE
      ?auto_1159886 - SURFACE
      ?auto_1159888 - SURFACE
      ?auto_1159887 - SURFACE
      ?auto_1159889 - SURFACE
      ?auto_1159890 - SURFACE
      ?auto_1159891 - SURFACE
      ?auto_1159892 - SURFACE
      ?auto_1159893 - SURFACE
      ?auto_1159894 - SURFACE
      ?auto_1159895 - SURFACE
    )
    :vars
    (
      ?auto_1159896 - HOIST
      ?auto_1159899 - PLACE
      ?auto_1159897 - TRUCK
      ?auto_1159898 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1159896 ?auto_1159899 ) ( SURFACE-AT ?auto_1159894 ?auto_1159899 ) ( CLEAR ?auto_1159894 ) ( IS-CRATE ?auto_1159895 ) ( not ( = ?auto_1159894 ?auto_1159895 ) ) ( AVAILABLE ?auto_1159896 ) ( IN ?auto_1159895 ?auto_1159897 ) ( ON ?auto_1159894 ?auto_1159893 ) ( not ( = ?auto_1159893 ?auto_1159894 ) ) ( not ( = ?auto_1159893 ?auto_1159895 ) ) ( TRUCK-AT ?auto_1159897 ?auto_1159898 ) ( not ( = ?auto_1159898 ?auto_1159899 ) ) ( ON ?auto_1159884 ?auto_1159883 ) ( ON ?auto_1159885 ?auto_1159884 ) ( ON ?auto_1159882 ?auto_1159885 ) ( ON ?auto_1159886 ?auto_1159882 ) ( ON ?auto_1159888 ?auto_1159886 ) ( ON ?auto_1159887 ?auto_1159888 ) ( ON ?auto_1159889 ?auto_1159887 ) ( ON ?auto_1159890 ?auto_1159889 ) ( ON ?auto_1159891 ?auto_1159890 ) ( ON ?auto_1159892 ?auto_1159891 ) ( ON ?auto_1159893 ?auto_1159892 ) ( not ( = ?auto_1159883 ?auto_1159884 ) ) ( not ( = ?auto_1159883 ?auto_1159885 ) ) ( not ( = ?auto_1159883 ?auto_1159882 ) ) ( not ( = ?auto_1159883 ?auto_1159886 ) ) ( not ( = ?auto_1159883 ?auto_1159888 ) ) ( not ( = ?auto_1159883 ?auto_1159887 ) ) ( not ( = ?auto_1159883 ?auto_1159889 ) ) ( not ( = ?auto_1159883 ?auto_1159890 ) ) ( not ( = ?auto_1159883 ?auto_1159891 ) ) ( not ( = ?auto_1159883 ?auto_1159892 ) ) ( not ( = ?auto_1159883 ?auto_1159893 ) ) ( not ( = ?auto_1159883 ?auto_1159894 ) ) ( not ( = ?auto_1159883 ?auto_1159895 ) ) ( not ( = ?auto_1159884 ?auto_1159885 ) ) ( not ( = ?auto_1159884 ?auto_1159882 ) ) ( not ( = ?auto_1159884 ?auto_1159886 ) ) ( not ( = ?auto_1159884 ?auto_1159888 ) ) ( not ( = ?auto_1159884 ?auto_1159887 ) ) ( not ( = ?auto_1159884 ?auto_1159889 ) ) ( not ( = ?auto_1159884 ?auto_1159890 ) ) ( not ( = ?auto_1159884 ?auto_1159891 ) ) ( not ( = ?auto_1159884 ?auto_1159892 ) ) ( not ( = ?auto_1159884 ?auto_1159893 ) ) ( not ( = ?auto_1159884 ?auto_1159894 ) ) ( not ( = ?auto_1159884 ?auto_1159895 ) ) ( not ( = ?auto_1159885 ?auto_1159882 ) ) ( not ( = ?auto_1159885 ?auto_1159886 ) ) ( not ( = ?auto_1159885 ?auto_1159888 ) ) ( not ( = ?auto_1159885 ?auto_1159887 ) ) ( not ( = ?auto_1159885 ?auto_1159889 ) ) ( not ( = ?auto_1159885 ?auto_1159890 ) ) ( not ( = ?auto_1159885 ?auto_1159891 ) ) ( not ( = ?auto_1159885 ?auto_1159892 ) ) ( not ( = ?auto_1159885 ?auto_1159893 ) ) ( not ( = ?auto_1159885 ?auto_1159894 ) ) ( not ( = ?auto_1159885 ?auto_1159895 ) ) ( not ( = ?auto_1159882 ?auto_1159886 ) ) ( not ( = ?auto_1159882 ?auto_1159888 ) ) ( not ( = ?auto_1159882 ?auto_1159887 ) ) ( not ( = ?auto_1159882 ?auto_1159889 ) ) ( not ( = ?auto_1159882 ?auto_1159890 ) ) ( not ( = ?auto_1159882 ?auto_1159891 ) ) ( not ( = ?auto_1159882 ?auto_1159892 ) ) ( not ( = ?auto_1159882 ?auto_1159893 ) ) ( not ( = ?auto_1159882 ?auto_1159894 ) ) ( not ( = ?auto_1159882 ?auto_1159895 ) ) ( not ( = ?auto_1159886 ?auto_1159888 ) ) ( not ( = ?auto_1159886 ?auto_1159887 ) ) ( not ( = ?auto_1159886 ?auto_1159889 ) ) ( not ( = ?auto_1159886 ?auto_1159890 ) ) ( not ( = ?auto_1159886 ?auto_1159891 ) ) ( not ( = ?auto_1159886 ?auto_1159892 ) ) ( not ( = ?auto_1159886 ?auto_1159893 ) ) ( not ( = ?auto_1159886 ?auto_1159894 ) ) ( not ( = ?auto_1159886 ?auto_1159895 ) ) ( not ( = ?auto_1159888 ?auto_1159887 ) ) ( not ( = ?auto_1159888 ?auto_1159889 ) ) ( not ( = ?auto_1159888 ?auto_1159890 ) ) ( not ( = ?auto_1159888 ?auto_1159891 ) ) ( not ( = ?auto_1159888 ?auto_1159892 ) ) ( not ( = ?auto_1159888 ?auto_1159893 ) ) ( not ( = ?auto_1159888 ?auto_1159894 ) ) ( not ( = ?auto_1159888 ?auto_1159895 ) ) ( not ( = ?auto_1159887 ?auto_1159889 ) ) ( not ( = ?auto_1159887 ?auto_1159890 ) ) ( not ( = ?auto_1159887 ?auto_1159891 ) ) ( not ( = ?auto_1159887 ?auto_1159892 ) ) ( not ( = ?auto_1159887 ?auto_1159893 ) ) ( not ( = ?auto_1159887 ?auto_1159894 ) ) ( not ( = ?auto_1159887 ?auto_1159895 ) ) ( not ( = ?auto_1159889 ?auto_1159890 ) ) ( not ( = ?auto_1159889 ?auto_1159891 ) ) ( not ( = ?auto_1159889 ?auto_1159892 ) ) ( not ( = ?auto_1159889 ?auto_1159893 ) ) ( not ( = ?auto_1159889 ?auto_1159894 ) ) ( not ( = ?auto_1159889 ?auto_1159895 ) ) ( not ( = ?auto_1159890 ?auto_1159891 ) ) ( not ( = ?auto_1159890 ?auto_1159892 ) ) ( not ( = ?auto_1159890 ?auto_1159893 ) ) ( not ( = ?auto_1159890 ?auto_1159894 ) ) ( not ( = ?auto_1159890 ?auto_1159895 ) ) ( not ( = ?auto_1159891 ?auto_1159892 ) ) ( not ( = ?auto_1159891 ?auto_1159893 ) ) ( not ( = ?auto_1159891 ?auto_1159894 ) ) ( not ( = ?auto_1159891 ?auto_1159895 ) ) ( not ( = ?auto_1159892 ?auto_1159893 ) ) ( not ( = ?auto_1159892 ?auto_1159894 ) ) ( not ( = ?auto_1159892 ?auto_1159895 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1159893 ?auto_1159894 ?auto_1159895 )
      ( MAKE-13CRATE-VERIFY ?auto_1159883 ?auto_1159884 ?auto_1159885 ?auto_1159882 ?auto_1159886 ?auto_1159888 ?auto_1159887 ?auto_1159889 ?auto_1159890 ?auto_1159891 ?auto_1159892 ?auto_1159893 ?auto_1159894 ?auto_1159895 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1160052 - SURFACE
      ?auto_1160053 - SURFACE
      ?auto_1160054 - SURFACE
      ?auto_1160051 - SURFACE
      ?auto_1160055 - SURFACE
      ?auto_1160057 - SURFACE
      ?auto_1160056 - SURFACE
      ?auto_1160058 - SURFACE
      ?auto_1160059 - SURFACE
      ?auto_1160060 - SURFACE
      ?auto_1160061 - SURFACE
      ?auto_1160062 - SURFACE
      ?auto_1160063 - SURFACE
      ?auto_1160064 - SURFACE
    )
    :vars
    (
      ?auto_1160066 - HOIST
      ?auto_1160065 - PLACE
      ?auto_1160068 - TRUCK
      ?auto_1160069 - PLACE
      ?auto_1160067 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1160066 ?auto_1160065 ) ( SURFACE-AT ?auto_1160063 ?auto_1160065 ) ( CLEAR ?auto_1160063 ) ( IS-CRATE ?auto_1160064 ) ( not ( = ?auto_1160063 ?auto_1160064 ) ) ( AVAILABLE ?auto_1160066 ) ( ON ?auto_1160063 ?auto_1160062 ) ( not ( = ?auto_1160062 ?auto_1160063 ) ) ( not ( = ?auto_1160062 ?auto_1160064 ) ) ( TRUCK-AT ?auto_1160068 ?auto_1160069 ) ( not ( = ?auto_1160069 ?auto_1160065 ) ) ( HOIST-AT ?auto_1160067 ?auto_1160069 ) ( LIFTING ?auto_1160067 ?auto_1160064 ) ( not ( = ?auto_1160066 ?auto_1160067 ) ) ( ON ?auto_1160053 ?auto_1160052 ) ( ON ?auto_1160054 ?auto_1160053 ) ( ON ?auto_1160051 ?auto_1160054 ) ( ON ?auto_1160055 ?auto_1160051 ) ( ON ?auto_1160057 ?auto_1160055 ) ( ON ?auto_1160056 ?auto_1160057 ) ( ON ?auto_1160058 ?auto_1160056 ) ( ON ?auto_1160059 ?auto_1160058 ) ( ON ?auto_1160060 ?auto_1160059 ) ( ON ?auto_1160061 ?auto_1160060 ) ( ON ?auto_1160062 ?auto_1160061 ) ( not ( = ?auto_1160052 ?auto_1160053 ) ) ( not ( = ?auto_1160052 ?auto_1160054 ) ) ( not ( = ?auto_1160052 ?auto_1160051 ) ) ( not ( = ?auto_1160052 ?auto_1160055 ) ) ( not ( = ?auto_1160052 ?auto_1160057 ) ) ( not ( = ?auto_1160052 ?auto_1160056 ) ) ( not ( = ?auto_1160052 ?auto_1160058 ) ) ( not ( = ?auto_1160052 ?auto_1160059 ) ) ( not ( = ?auto_1160052 ?auto_1160060 ) ) ( not ( = ?auto_1160052 ?auto_1160061 ) ) ( not ( = ?auto_1160052 ?auto_1160062 ) ) ( not ( = ?auto_1160052 ?auto_1160063 ) ) ( not ( = ?auto_1160052 ?auto_1160064 ) ) ( not ( = ?auto_1160053 ?auto_1160054 ) ) ( not ( = ?auto_1160053 ?auto_1160051 ) ) ( not ( = ?auto_1160053 ?auto_1160055 ) ) ( not ( = ?auto_1160053 ?auto_1160057 ) ) ( not ( = ?auto_1160053 ?auto_1160056 ) ) ( not ( = ?auto_1160053 ?auto_1160058 ) ) ( not ( = ?auto_1160053 ?auto_1160059 ) ) ( not ( = ?auto_1160053 ?auto_1160060 ) ) ( not ( = ?auto_1160053 ?auto_1160061 ) ) ( not ( = ?auto_1160053 ?auto_1160062 ) ) ( not ( = ?auto_1160053 ?auto_1160063 ) ) ( not ( = ?auto_1160053 ?auto_1160064 ) ) ( not ( = ?auto_1160054 ?auto_1160051 ) ) ( not ( = ?auto_1160054 ?auto_1160055 ) ) ( not ( = ?auto_1160054 ?auto_1160057 ) ) ( not ( = ?auto_1160054 ?auto_1160056 ) ) ( not ( = ?auto_1160054 ?auto_1160058 ) ) ( not ( = ?auto_1160054 ?auto_1160059 ) ) ( not ( = ?auto_1160054 ?auto_1160060 ) ) ( not ( = ?auto_1160054 ?auto_1160061 ) ) ( not ( = ?auto_1160054 ?auto_1160062 ) ) ( not ( = ?auto_1160054 ?auto_1160063 ) ) ( not ( = ?auto_1160054 ?auto_1160064 ) ) ( not ( = ?auto_1160051 ?auto_1160055 ) ) ( not ( = ?auto_1160051 ?auto_1160057 ) ) ( not ( = ?auto_1160051 ?auto_1160056 ) ) ( not ( = ?auto_1160051 ?auto_1160058 ) ) ( not ( = ?auto_1160051 ?auto_1160059 ) ) ( not ( = ?auto_1160051 ?auto_1160060 ) ) ( not ( = ?auto_1160051 ?auto_1160061 ) ) ( not ( = ?auto_1160051 ?auto_1160062 ) ) ( not ( = ?auto_1160051 ?auto_1160063 ) ) ( not ( = ?auto_1160051 ?auto_1160064 ) ) ( not ( = ?auto_1160055 ?auto_1160057 ) ) ( not ( = ?auto_1160055 ?auto_1160056 ) ) ( not ( = ?auto_1160055 ?auto_1160058 ) ) ( not ( = ?auto_1160055 ?auto_1160059 ) ) ( not ( = ?auto_1160055 ?auto_1160060 ) ) ( not ( = ?auto_1160055 ?auto_1160061 ) ) ( not ( = ?auto_1160055 ?auto_1160062 ) ) ( not ( = ?auto_1160055 ?auto_1160063 ) ) ( not ( = ?auto_1160055 ?auto_1160064 ) ) ( not ( = ?auto_1160057 ?auto_1160056 ) ) ( not ( = ?auto_1160057 ?auto_1160058 ) ) ( not ( = ?auto_1160057 ?auto_1160059 ) ) ( not ( = ?auto_1160057 ?auto_1160060 ) ) ( not ( = ?auto_1160057 ?auto_1160061 ) ) ( not ( = ?auto_1160057 ?auto_1160062 ) ) ( not ( = ?auto_1160057 ?auto_1160063 ) ) ( not ( = ?auto_1160057 ?auto_1160064 ) ) ( not ( = ?auto_1160056 ?auto_1160058 ) ) ( not ( = ?auto_1160056 ?auto_1160059 ) ) ( not ( = ?auto_1160056 ?auto_1160060 ) ) ( not ( = ?auto_1160056 ?auto_1160061 ) ) ( not ( = ?auto_1160056 ?auto_1160062 ) ) ( not ( = ?auto_1160056 ?auto_1160063 ) ) ( not ( = ?auto_1160056 ?auto_1160064 ) ) ( not ( = ?auto_1160058 ?auto_1160059 ) ) ( not ( = ?auto_1160058 ?auto_1160060 ) ) ( not ( = ?auto_1160058 ?auto_1160061 ) ) ( not ( = ?auto_1160058 ?auto_1160062 ) ) ( not ( = ?auto_1160058 ?auto_1160063 ) ) ( not ( = ?auto_1160058 ?auto_1160064 ) ) ( not ( = ?auto_1160059 ?auto_1160060 ) ) ( not ( = ?auto_1160059 ?auto_1160061 ) ) ( not ( = ?auto_1160059 ?auto_1160062 ) ) ( not ( = ?auto_1160059 ?auto_1160063 ) ) ( not ( = ?auto_1160059 ?auto_1160064 ) ) ( not ( = ?auto_1160060 ?auto_1160061 ) ) ( not ( = ?auto_1160060 ?auto_1160062 ) ) ( not ( = ?auto_1160060 ?auto_1160063 ) ) ( not ( = ?auto_1160060 ?auto_1160064 ) ) ( not ( = ?auto_1160061 ?auto_1160062 ) ) ( not ( = ?auto_1160061 ?auto_1160063 ) ) ( not ( = ?auto_1160061 ?auto_1160064 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1160062 ?auto_1160063 ?auto_1160064 )
      ( MAKE-13CRATE-VERIFY ?auto_1160052 ?auto_1160053 ?auto_1160054 ?auto_1160051 ?auto_1160055 ?auto_1160057 ?auto_1160056 ?auto_1160058 ?auto_1160059 ?auto_1160060 ?auto_1160061 ?auto_1160062 ?auto_1160063 ?auto_1160064 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1160234 - SURFACE
      ?auto_1160235 - SURFACE
      ?auto_1160236 - SURFACE
      ?auto_1160233 - SURFACE
      ?auto_1160237 - SURFACE
      ?auto_1160239 - SURFACE
      ?auto_1160238 - SURFACE
      ?auto_1160240 - SURFACE
      ?auto_1160241 - SURFACE
      ?auto_1160242 - SURFACE
      ?auto_1160243 - SURFACE
      ?auto_1160244 - SURFACE
      ?auto_1160245 - SURFACE
      ?auto_1160246 - SURFACE
    )
    :vars
    (
      ?auto_1160248 - HOIST
      ?auto_1160249 - PLACE
      ?auto_1160252 - TRUCK
      ?auto_1160247 - PLACE
      ?auto_1160250 - HOIST
      ?auto_1160251 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1160248 ?auto_1160249 ) ( SURFACE-AT ?auto_1160245 ?auto_1160249 ) ( CLEAR ?auto_1160245 ) ( IS-CRATE ?auto_1160246 ) ( not ( = ?auto_1160245 ?auto_1160246 ) ) ( AVAILABLE ?auto_1160248 ) ( ON ?auto_1160245 ?auto_1160244 ) ( not ( = ?auto_1160244 ?auto_1160245 ) ) ( not ( = ?auto_1160244 ?auto_1160246 ) ) ( TRUCK-AT ?auto_1160252 ?auto_1160247 ) ( not ( = ?auto_1160247 ?auto_1160249 ) ) ( HOIST-AT ?auto_1160250 ?auto_1160247 ) ( not ( = ?auto_1160248 ?auto_1160250 ) ) ( AVAILABLE ?auto_1160250 ) ( SURFACE-AT ?auto_1160246 ?auto_1160247 ) ( ON ?auto_1160246 ?auto_1160251 ) ( CLEAR ?auto_1160246 ) ( not ( = ?auto_1160245 ?auto_1160251 ) ) ( not ( = ?auto_1160246 ?auto_1160251 ) ) ( not ( = ?auto_1160244 ?auto_1160251 ) ) ( ON ?auto_1160235 ?auto_1160234 ) ( ON ?auto_1160236 ?auto_1160235 ) ( ON ?auto_1160233 ?auto_1160236 ) ( ON ?auto_1160237 ?auto_1160233 ) ( ON ?auto_1160239 ?auto_1160237 ) ( ON ?auto_1160238 ?auto_1160239 ) ( ON ?auto_1160240 ?auto_1160238 ) ( ON ?auto_1160241 ?auto_1160240 ) ( ON ?auto_1160242 ?auto_1160241 ) ( ON ?auto_1160243 ?auto_1160242 ) ( ON ?auto_1160244 ?auto_1160243 ) ( not ( = ?auto_1160234 ?auto_1160235 ) ) ( not ( = ?auto_1160234 ?auto_1160236 ) ) ( not ( = ?auto_1160234 ?auto_1160233 ) ) ( not ( = ?auto_1160234 ?auto_1160237 ) ) ( not ( = ?auto_1160234 ?auto_1160239 ) ) ( not ( = ?auto_1160234 ?auto_1160238 ) ) ( not ( = ?auto_1160234 ?auto_1160240 ) ) ( not ( = ?auto_1160234 ?auto_1160241 ) ) ( not ( = ?auto_1160234 ?auto_1160242 ) ) ( not ( = ?auto_1160234 ?auto_1160243 ) ) ( not ( = ?auto_1160234 ?auto_1160244 ) ) ( not ( = ?auto_1160234 ?auto_1160245 ) ) ( not ( = ?auto_1160234 ?auto_1160246 ) ) ( not ( = ?auto_1160234 ?auto_1160251 ) ) ( not ( = ?auto_1160235 ?auto_1160236 ) ) ( not ( = ?auto_1160235 ?auto_1160233 ) ) ( not ( = ?auto_1160235 ?auto_1160237 ) ) ( not ( = ?auto_1160235 ?auto_1160239 ) ) ( not ( = ?auto_1160235 ?auto_1160238 ) ) ( not ( = ?auto_1160235 ?auto_1160240 ) ) ( not ( = ?auto_1160235 ?auto_1160241 ) ) ( not ( = ?auto_1160235 ?auto_1160242 ) ) ( not ( = ?auto_1160235 ?auto_1160243 ) ) ( not ( = ?auto_1160235 ?auto_1160244 ) ) ( not ( = ?auto_1160235 ?auto_1160245 ) ) ( not ( = ?auto_1160235 ?auto_1160246 ) ) ( not ( = ?auto_1160235 ?auto_1160251 ) ) ( not ( = ?auto_1160236 ?auto_1160233 ) ) ( not ( = ?auto_1160236 ?auto_1160237 ) ) ( not ( = ?auto_1160236 ?auto_1160239 ) ) ( not ( = ?auto_1160236 ?auto_1160238 ) ) ( not ( = ?auto_1160236 ?auto_1160240 ) ) ( not ( = ?auto_1160236 ?auto_1160241 ) ) ( not ( = ?auto_1160236 ?auto_1160242 ) ) ( not ( = ?auto_1160236 ?auto_1160243 ) ) ( not ( = ?auto_1160236 ?auto_1160244 ) ) ( not ( = ?auto_1160236 ?auto_1160245 ) ) ( not ( = ?auto_1160236 ?auto_1160246 ) ) ( not ( = ?auto_1160236 ?auto_1160251 ) ) ( not ( = ?auto_1160233 ?auto_1160237 ) ) ( not ( = ?auto_1160233 ?auto_1160239 ) ) ( not ( = ?auto_1160233 ?auto_1160238 ) ) ( not ( = ?auto_1160233 ?auto_1160240 ) ) ( not ( = ?auto_1160233 ?auto_1160241 ) ) ( not ( = ?auto_1160233 ?auto_1160242 ) ) ( not ( = ?auto_1160233 ?auto_1160243 ) ) ( not ( = ?auto_1160233 ?auto_1160244 ) ) ( not ( = ?auto_1160233 ?auto_1160245 ) ) ( not ( = ?auto_1160233 ?auto_1160246 ) ) ( not ( = ?auto_1160233 ?auto_1160251 ) ) ( not ( = ?auto_1160237 ?auto_1160239 ) ) ( not ( = ?auto_1160237 ?auto_1160238 ) ) ( not ( = ?auto_1160237 ?auto_1160240 ) ) ( not ( = ?auto_1160237 ?auto_1160241 ) ) ( not ( = ?auto_1160237 ?auto_1160242 ) ) ( not ( = ?auto_1160237 ?auto_1160243 ) ) ( not ( = ?auto_1160237 ?auto_1160244 ) ) ( not ( = ?auto_1160237 ?auto_1160245 ) ) ( not ( = ?auto_1160237 ?auto_1160246 ) ) ( not ( = ?auto_1160237 ?auto_1160251 ) ) ( not ( = ?auto_1160239 ?auto_1160238 ) ) ( not ( = ?auto_1160239 ?auto_1160240 ) ) ( not ( = ?auto_1160239 ?auto_1160241 ) ) ( not ( = ?auto_1160239 ?auto_1160242 ) ) ( not ( = ?auto_1160239 ?auto_1160243 ) ) ( not ( = ?auto_1160239 ?auto_1160244 ) ) ( not ( = ?auto_1160239 ?auto_1160245 ) ) ( not ( = ?auto_1160239 ?auto_1160246 ) ) ( not ( = ?auto_1160239 ?auto_1160251 ) ) ( not ( = ?auto_1160238 ?auto_1160240 ) ) ( not ( = ?auto_1160238 ?auto_1160241 ) ) ( not ( = ?auto_1160238 ?auto_1160242 ) ) ( not ( = ?auto_1160238 ?auto_1160243 ) ) ( not ( = ?auto_1160238 ?auto_1160244 ) ) ( not ( = ?auto_1160238 ?auto_1160245 ) ) ( not ( = ?auto_1160238 ?auto_1160246 ) ) ( not ( = ?auto_1160238 ?auto_1160251 ) ) ( not ( = ?auto_1160240 ?auto_1160241 ) ) ( not ( = ?auto_1160240 ?auto_1160242 ) ) ( not ( = ?auto_1160240 ?auto_1160243 ) ) ( not ( = ?auto_1160240 ?auto_1160244 ) ) ( not ( = ?auto_1160240 ?auto_1160245 ) ) ( not ( = ?auto_1160240 ?auto_1160246 ) ) ( not ( = ?auto_1160240 ?auto_1160251 ) ) ( not ( = ?auto_1160241 ?auto_1160242 ) ) ( not ( = ?auto_1160241 ?auto_1160243 ) ) ( not ( = ?auto_1160241 ?auto_1160244 ) ) ( not ( = ?auto_1160241 ?auto_1160245 ) ) ( not ( = ?auto_1160241 ?auto_1160246 ) ) ( not ( = ?auto_1160241 ?auto_1160251 ) ) ( not ( = ?auto_1160242 ?auto_1160243 ) ) ( not ( = ?auto_1160242 ?auto_1160244 ) ) ( not ( = ?auto_1160242 ?auto_1160245 ) ) ( not ( = ?auto_1160242 ?auto_1160246 ) ) ( not ( = ?auto_1160242 ?auto_1160251 ) ) ( not ( = ?auto_1160243 ?auto_1160244 ) ) ( not ( = ?auto_1160243 ?auto_1160245 ) ) ( not ( = ?auto_1160243 ?auto_1160246 ) ) ( not ( = ?auto_1160243 ?auto_1160251 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1160244 ?auto_1160245 ?auto_1160246 )
      ( MAKE-13CRATE-VERIFY ?auto_1160234 ?auto_1160235 ?auto_1160236 ?auto_1160233 ?auto_1160237 ?auto_1160239 ?auto_1160238 ?auto_1160240 ?auto_1160241 ?auto_1160242 ?auto_1160243 ?auto_1160244 ?auto_1160245 ?auto_1160246 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1160417 - SURFACE
      ?auto_1160418 - SURFACE
      ?auto_1160419 - SURFACE
      ?auto_1160416 - SURFACE
      ?auto_1160420 - SURFACE
      ?auto_1160422 - SURFACE
      ?auto_1160421 - SURFACE
      ?auto_1160423 - SURFACE
      ?auto_1160424 - SURFACE
      ?auto_1160425 - SURFACE
      ?auto_1160426 - SURFACE
      ?auto_1160427 - SURFACE
      ?auto_1160428 - SURFACE
      ?auto_1160429 - SURFACE
    )
    :vars
    (
      ?auto_1160434 - HOIST
      ?auto_1160430 - PLACE
      ?auto_1160433 - PLACE
      ?auto_1160432 - HOIST
      ?auto_1160435 - SURFACE
      ?auto_1160431 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1160434 ?auto_1160430 ) ( SURFACE-AT ?auto_1160428 ?auto_1160430 ) ( CLEAR ?auto_1160428 ) ( IS-CRATE ?auto_1160429 ) ( not ( = ?auto_1160428 ?auto_1160429 ) ) ( AVAILABLE ?auto_1160434 ) ( ON ?auto_1160428 ?auto_1160427 ) ( not ( = ?auto_1160427 ?auto_1160428 ) ) ( not ( = ?auto_1160427 ?auto_1160429 ) ) ( not ( = ?auto_1160433 ?auto_1160430 ) ) ( HOIST-AT ?auto_1160432 ?auto_1160433 ) ( not ( = ?auto_1160434 ?auto_1160432 ) ) ( AVAILABLE ?auto_1160432 ) ( SURFACE-AT ?auto_1160429 ?auto_1160433 ) ( ON ?auto_1160429 ?auto_1160435 ) ( CLEAR ?auto_1160429 ) ( not ( = ?auto_1160428 ?auto_1160435 ) ) ( not ( = ?auto_1160429 ?auto_1160435 ) ) ( not ( = ?auto_1160427 ?auto_1160435 ) ) ( TRUCK-AT ?auto_1160431 ?auto_1160430 ) ( ON ?auto_1160418 ?auto_1160417 ) ( ON ?auto_1160419 ?auto_1160418 ) ( ON ?auto_1160416 ?auto_1160419 ) ( ON ?auto_1160420 ?auto_1160416 ) ( ON ?auto_1160422 ?auto_1160420 ) ( ON ?auto_1160421 ?auto_1160422 ) ( ON ?auto_1160423 ?auto_1160421 ) ( ON ?auto_1160424 ?auto_1160423 ) ( ON ?auto_1160425 ?auto_1160424 ) ( ON ?auto_1160426 ?auto_1160425 ) ( ON ?auto_1160427 ?auto_1160426 ) ( not ( = ?auto_1160417 ?auto_1160418 ) ) ( not ( = ?auto_1160417 ?auto_1160419 ) ) ( not ( = ?auto_1160417 ?auto_1160416 ) ) ( not ( = ?auto_1160417 ?auto_1160420 ) ) ( not ( = ?auto_1160417 ?auto_1160422 ) ) ( not ( = ?auto_1160417 ?auto_1160421 ) ) ( not ( = ?auto_1160417 ?auto_1160423 ) ) ( not ( = ?auto_1160417 ?auto_1160424 ) ) ( not ( = ?auto_1160417 ?auto_1160425 ) ) ( not ( = ?auto_1160417 ?auto_1160426 ) ) ( not ( = ?auto_1160417 ?auto_1160427 ) ) ( not ( = ?auto_1160417 ?auto_1160428 ) ) ( not ( = ?auto_1160417 ?auto_1160429 ) ) ( not ( = ?auto_1160417 ?auto_1160435 ) ) ( not ( = ?auto_1160418 ?auto_1160419 ) ) ( not ( = ?auto_1160418 ?auto_1160416 ) ) ( not ( = ?auto_1160418 ?auto_1160420 ) ) ( not ( = ?auto_1160418 ?auto_1160422 ) ) ( not ( = ?auto_1160418 ?auto_1160421 ) ) ( not ( = ?auto_1160418 ?auto_1160423 ) ) ( not ( = ?auto_1160418 ?auto_1160424 ) ) ( not ( = ?auto_1160418 ?auto_1160425 ) ) ( not ( = ?auto_1160418 ?auto_1160426 ) ) ( not ( = ?auto_1160418 ?auto_1160427 ) ) ( not ( = ?auto_1160418 ?auto_1160428 ) ) ( not ( = ?auto_1160418 ?auto_1160429 ) ) ( not ( = ?auto_1160418 ?auto_1160435 ) ) ( not ( = ?auto_1160419 ?auto_1160416 ) ) ( not ( = ?auto_1160419 ?auto_1160420 ) ) ( not ( = ?auto_1160419 ?auto_1160422 ) ) ( not ( = ?auto_1160419 ?auto_1160421 ) ) ( not ( = ?auto_1160419 ?auto_1160423 ) ) ( not ( = ?auto_1160419 ?auto_1160424 ) ) ( not ( = ?auto_1160419 ?auto_1160425 ) ) ( not ( = ?auto_1160419 ?auto_1160426 ) ) ( not ( = ?auto_1160419 ?auto_1160427 ) ) ( not ( = ?auto_1160419 ?auto_1160428 ) ) ( not ( = ?auto_1160419 ?auto_1160429 ) ) ( not ( = ?auto_1160419 ?auto_1160435 ) ) ( not ( = ?auto_1160416 ?auto_1160420 ) ) ( not ( = ?auto_1160416 ?auto_1160422 ) ) ( not ( = ?auto_1160416 ?auto_1160421 ) ) ( not ( = ?auto_1160416 ?auto_1160423 ) ) ( not ( = ?auto_1160416 ?auto_1160424 ) ) ( not ( = ?auto_1160416 ?auto_1160425 ) ) ( not ( = ?auto_1160416 ?auto_1160426 ) ) ( not ( = ?auto_1160416 ?auto_1160427 ) ) ( not ( = ?auto_1160416 ?auto_1160428 ) ) ( not ( = ?auto_1160416 ?auto_1160429 ) ) ( not ( = ?auto_1160416 ?auto_1160435 ) ) ( not ( = ?auto_1160420 ?auto_1160422 ) ) ( not ( = ?auto_1160420 ?auto_1160421 ) ) ( not ( = ?auto_1160420 ?auto_1160423 ) ) ( not ( = ?auto_1160420 ?auto_1160424 ) ) ( not ( = ?auto_1160420 ?auto_1160425 ) ) ( not ( = ?auto_1160420 ?auto_1160426 ) ) ( not ( = ?auto_1160420 ?auto_1160427 ) ) ( not ( = ?auto_1160420 ?auto_1160428 ) ) ( not ( = ?auto_1160420 ?auto_1160429 ) ) ( not ( = ?auto_1160420 ?auto_1160435 ) ) ( not ( = ?auto_1160422 ?auto_1160421 ) ) ( not ( = ?auto_1160422 ?auto_1160423 ) ) ( not ( = ?auto_1160422 ?auto_1160424 ) ) ( not ( = ?auto_1160422 ?auto_1160425 ) ) ( not ( = ?auto_1160422 ?auto_1160426 ) ) ( not ( = ?auto_1160422 ?auto_1160427 ) ) ( not ( = ?auto_1160422 ?auto_1160428 ) ) ( not ( = ?auto_1160422 ?auto_1160429 ) ) ( not ( = ?auto_1160422 ?auto_1160435 ) ) ( not ( = ?auto_1160421 ?auto_1160423 ) ) ( not ( = ?auto_1160421 ?auto_1160424 ) ) ( not ( = ?auto_1160421 ?auto_1160425 ) ) ( not ( = ?auto_1160421 ?auto_1160426 ) ) ( not ( = ?auto_1160421 ?auto_1160427 ) ) ( not ( = ?auto_1160421 ?auto_1160428 ) ) ( not ( = ?auto_1160421 ?auto_1160429 ) ) ( not ( = ?auto_1160421 ?auto_1160435 ) ) ( not ( = ?auto_1160423 ?auto_1160424 ) ) ( not ( = ?auto_1160423 ?auto_1160425 ) ) ( not ( = ?auto_1160423 ?auto_1160426 ) ) ( not ( = ?auto_1160423 ?auto_1160427 ) ) ( not ( = ?auto_1160423 ?auto_1160428 ) ) ( not ( = ?auto_1160423 ?auto_1160429 ) ) ( not ( = ?auto_1160423 ?auto_1160435 ) ) ( not ( = ?auto_1160424 ?auto_1160425 ) ) ( not ( = ?auto_1160424 ?auto_1160426 ) ) ( not ( = ?auto_1160424 ?auto_1160427 ) ) ( not ( = ?auto_1160424 ?auto_1160428 ) ) ( not ( = ?auto_1160424 ?auto_1160429 ) ) ( not ( = ?auto_1160424 ?auto_1160435 ) ) ( not ( = ?auto_1160425 ?auto_1160426 ) ) ( not ( = ?auto_1160425 ?auto_1160427 ) ) ( not ( = ?auto_1160425 ?auto_1160428 ) ) ( not ( = ?auto_1160425 ?auto_1160429 ) ) ( not ( = ?auto_1160425 ?auto_1160435 ) ) ( not ( = ?auto_1160426 ?auto_1160427 ) ) ( not ( = ?auto_1160426 ?auto_1160428 ) ) ( not ( = ?auto_1160426 ?auto_1160429 ) ) ( not ( = ?auto_1160426 ?auto_1160435 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1160427 ?auto_1160428 ?auto_1160429 )
      ( MAKE-13CRATE-VERIFY ?auto_1160417 ?auto_1160418 ?auto_1160419 ?auto_1160416 ?auto_1160420 ?auto_1160422 ?auto_1160421 ?auto_1160423 ?auto_1160424 ?auto_1160425 ?auto_1160426 ?auto_1160427 ?auto_1160428 ?auto_1160429 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1160600 - SURFACE
      ?auto_1160601 - SURFACE
      ?auto_1160602 - SURFACE
      ?auto_1160599 - SURFACE
      ?auto_1160603 - SURFACE
      ?auto_1160605 - SURFACE
      ?auto_1160604 - SURFACE
      ?auto_1160606 - SURFACE
      ?auto_1160607 - SURFACE
      ?auto_1160608 - SURFACE
      ?auto_1160609 - SURFACE
      ?auto_1160610 - SURFACE
      ?auto_1160611 - SURFACE
      ?auto_1160612 - SURFACE
    )
    :vars
    (
      ?auto_1160617 - HOIST
      ?auto_1160618 - PLACE
      ?auto_1160615 - PLACE
      ?auto_1160613 - HOIST
      ?auto_1160614 - SURFACE
      ?auto_1160616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1160617 ?auto_1160618 ) ( IS-CRATE ?auto_1160612 ) ( not ( = ?auto_1160611 ?auto_1160612 ) ) ( not ( = ?auto_1160610 ?auto_1160611 ) ) ( not ( = ?auto_1160610 ?auto_1160612 ) ) ( not ( = ?auto_1160615 ?auto_1160618 ) ) ( HOIST-AT ?auto_1160613 ?auto_1160615 ) ( not ( = ?auto_1160617 ?auto_1160613 ) ) ( AVAILABLE ?auto_1160613 ) ( SURFACE-AT ?auto_1160612 ?auto_1160615 ) ( ON ?auto_1160612 ?auto_1160614 ) ( CLEAR ?auto_1160612 ) ( not ( = ?auto_1160611 ?auto_1160614 ) ) ( not ( = ?auto_1160612 ?auto_1160614 ) ) ( not ( = ?auto_1160610 ?auto_1160614 ) ) ( TRUCK-AT ?auto_1160616 ?auto_1160618 ) ( SURFACE-AT ?auto_1160610 ?auto_1160618 ) ( CLEAR ?auto_1160610 ) ( LIFTING ?auto_1160617 ?auto_1160611 ) ( IS-CRATE ?auto_1160611 ) ( ON ?auto_1160601 ?auto_1160600 ) ( ON ?auto_1160602 ?auto_1160601 ) ( ON ?auto_1160599 ?auto_1160602 ) ( ON ?auto_1160603 ?auto_1160599 ) ( ON ?auto_1160605 ?auto_1160603 ) ( ON ?auto_1160604 ?auto_1160605 ) ( ON ?auto_1160606 ?auto_1160604 ) ( ON ?auto_1160607 ?auto_1160606 ) ( ON ?auto_1160608 ?auto_1160607 ) ( ON ?auto_1160609 ?auto_1160608 ) ( ON ?auto_1160610 ?auto_1160609 ) ( not ( = ?auto_1160600 ?auto_1160601 ) ) ( not ( = ?auto_1160600 ?auto_1160602 ) ) ( not ( = ?auto_1160600 ?auto_1160599 ) ) ( not ( = ?auto_1160600 ?auto_1160603 ) ) ( not ( = ?auto_1160600 ?auto_1160605 ) ) ( not ( = ?auto_1160600 ?auto_1160604 ) ) ( not ( = ?auto_1160600 ?auto_1160606 ) ) ( not ( = ?auto_1160600 ?auto_1160607 ) ) ( not ( = ?auto_1160600 ?auto_1160608 ) ) ( not ( = ?auto_1160600 ?auto_1160609 ) ) ( not ( = ?auto_1160600 ?auto_1160610 ) ) ( not ( = ?auto_1160600 ?auto_1160611 ) ) ( not ( = ?auto_1160600 ?auto_1160612 ) ) ( not ( = ?auto_1160600 ?auto_1160614 ) ) ( not ( = ?auto_1160601 ?auto_1160602 ) ) ( not ( = ?auto_1160601 ?auto_1160599 ) ) ( not ( = ?auto_1160601 ?auto_1160603 ) ) ( not ( = ?auto_1160601 ?auto_1160605 ) ) ( not ( = ?auto_1160601 ?auto_1160604 ) ) ( not ( = ?auto_1160601 ?auto_1160606 ) ) ( not ( = ?auto_1160601 ?auto_1160607 ) ) ( not ( = ?auto_1160601 ?auto_1160608 ) ) ( not ( = ?auto_1160601 ?auto_1160609 ) ) ( not ( = ?auto_1160601 ?auto_1160610 ) ) ( not ( = ?auto_1160601 ?auto_1160611 ) ) ( not ( = ?auto_1160601 ?auto_1160612 ) ) ( not ( = ?auto_1160601 ?auto_1160614 ) ) ( not ( = ?auto_1160602 ?auto_1160599 ) ) ( not ( = ?auto_1160602 ?auto_1160603 ) ) ( not ( = ?auto_1160602 ?auto_1160605 ) ) ( not ( = ?auto_1160602 ?auto_1160604 ) ) ( not ( = ?auto_1160602 ?auto_1160606 ) ) ( not ( = ?auto_1160602 ?auto_1160607 ) ) ( not ( = ?auto_1160602 ?auto_1160608 ) ) ( not ( = ?auto_1160602 ?auto_1160609 ) ) ( not ( = ?auto_1160602 ?auto_1160610 ) ) ( not ( = ?auto_1160602 ?auto_1160611 ) ) ( not ( = ?auto_1160602 ?auto_1160612 ) ) ( not ( = ?auto_1160602 ?auto_1160614 ) ) ( not ( = ?auto_1160599 ?auto_1160603 ) ) ( not ( = ?auto_1160599 ?auto_1160605 ) ) ( not ( = ?auto_1160599 ?auto_1160604 ) ) ( not ( = ?auto_1160599 ?auto_1160606 ) ) ( not ( = ?auto_1160599 ?auto_1160607 ) ) ( not ( = ?auto_1160599 ?auto_1160608 ) ) ( not ( = ?auto_1160599 ?auto_1160609 ) ) ( not ( = ?auto_1160599 ?auto_1160610 ) ) ( not ( = ?auto_1160599 ?auto_1160611 ) ) ( not ( = ?auto_1160599 ?auto_1160612 ) ) ( not ( = ?auto_1160599 ?auto_1160614 ) ) ( not ( = ?auto_1160603 ?auto_1160605 ) ) ( not ( = ?auto_1160603 ?auto_1160604 ) ) ( not ( = ?auto_1160603 ?auto_1160606 ) ) ( not ( = ?auto_1160603 ?auto_1160607 ) ) ( not ( = ?auto_1160603 ?auto_1160608 ) ) ( not ( = ?auto_1160603 ?auto_1160609 ) ) ( not ( = ?auto_1160603 ?auto_1160610 ) ) ( not ( = ?auto_1160603 ?auto_1160611 ) ) ( not ( = ?auto_1160603 ?auto_1160612 ) ) ( not ( = ?auto_1160603 ?auto_1160614 ) ) ( not ( = ?auto_1160605 ?auto_1160604 ) ) ( not ( = ?auto_1160605 ?auto_1160606 ) ) ( not ( = ?auto_1160605 ?auto_1160607 ) ) ( not ( = ?auto_1160605 ?auto_1160608 ) ) ( not ( = ?auto_1160605 ?auto_1160609 ) ) ( not ( = ?auto_1160605 ?auto_1160610 ) ) ( not ( = ?auto_1160605 ?auto_1160611 ) ) ( not ( = ?auto_1160605 ?auto_1160612 ) ) ( not ( = ?auto_1160605 ?auto_1160614 ) ) ( not ( = ?auto_1160604 ?auto_1160606 ) ) ( not ( = ?auto_1160604 ?auto_1160607 ) ) ( not ( = ?auto_1160604 ?auto_1160608 ) ) ( not ( = ?auto_1160604 ?auto_1160609 ) ) ( not ( = ?auto_1160604 ?auto_1160610 ) ) ( not ( = ?auto_1160604 ?auto_1160611 ) ) ( not ( = ?auto_1160604 ?auto_1160612 ) ) ( not ( = ?auto_1160604 ?auto_1160614 ) ) ( not ( = ?auto_1160606 ?auto_1160607 ) ) ( not ( = ?auto_1160606 ?auto_1160608 ) ) ( not ( = ?auto_1160606 ?auto_1160609 ) ) ( not ( = ?auto_1160606 ?auto_1160610 ) ) ( not ( = ?auto_1160606 ?auto_1160611 ) ) ( not ( = ?auto_1160606 ?auto_1160612 ) ) ( not ( = ?auto_1160606 ?auto_1160614 ) ) ( not ( = ?auto_1160607 ?auto_1160608 ) ) ( not ( = ?auto_1160607 ?auto_1160609 ) ) ( not ( = ?auto_1160607 ?auto_1160610 ) ) ( not ( = ?auto_1160607 ?auto_1160611 ) ) ( not ( = ?auto_1160607 ?auto_1160612 ) ) ( not ( = ?auto_1160607 ?auto_1160614 ) ) ( not ( = ?auto_1160608 ?auto_1160609 ) ) ( not ( = ?auto_1160608 ?auto_1160610 ) ) ( not ( = ?auto_1160608 ?auto_1160611 ) ) ( not ( = ?auto_1160608 ?auto_1160612 ) ) ( not ( = ?auto_1160608 ?auto_1160614 ) ) ( not ( = ?auto_1160609 ?auto_1160610 ) ) ( not ( = ?auto_1160609 ?auto_1160611 ) ) ( not ( = ?auto_1160609 ?auto_1160612 ) ) ( not ( = ?auto_1160609 ?auto_1160614 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1160610 ?auto_1160611 ?auto_1160612 )
      ( MAKE-13CRATE-VERIFY ?auto_1160600 ?auto_1160601 ?auto_1160602 ?auto_1160599 ?auto_1160603 ?auto_1160605 ?auto_1160604 ?auto_1160606 ?auto_1160607 ?auto_1160608 ?auto_1160609 ?auto_1160610 ?auto_1160611 ?auto_1160612 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1160783 - SURFACE
      ?auto_1160784 - SURFACE
      ?auto_1160785 - SURFACE
      ?auto_1160782 - SURFACE
      ?auto_1160786 - SURFACE
      ?auto_1160788 - SURFACE
      ?auto_1160787 - SURFACE
      ?auto_1160789 - SURFACE
      ?auto_1160790 - SURFACE
      ?auto_1160791 - SURFACE
      ?auto_1160792 - SURFACE
      ?auto_1160793 - SURFACE
      ?auto_1160794 - SURFACE
      ?auto_1160795 - SURFACE
    )
    :vars
    (
      ?auto_1160799 - HOIST
      ?auto_1160797 - PLACE
      ?auto_1160801 - PLACE
      ?auto_1160800 - HOIST
      ?auto_1160798 - SURFACE
      ?auto_1160796 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1160799 ?auto_1160797 ) ( IS-CRATE ?auto_1160795 ) ( not ( = ?auto_1160794 ?auto_1160795 ) ) ( not ( = ?auto_1160793 ?auto_1160794 ) ) ( not ( = ?auto_1160793 ?auto_1160795 ) ) ( not ( = ?auto_1160801 ?auto_1160797 ) ) ( HOIST-AT ?auto_1160800 ?auto_1160801 ) ( not ( = ?auto_1160799 ?auto_1160800 ) ) ( AVAILABLE ?auto_1160800 ) ( SURFACE-AT ?auto_1160795 ?auto_1160801 ) ( ON ?auto_1160795 ?auto_1160798 ) ( CLEAR ?auto_1160795 ) ( not ( = ?auto_1160794 ?auto_1160798 ) ) ( not ( = ?auto_1160795 ?auto_1160798 ) ) ( not ( = ?auto_1160793 ?auto_1160798 ) ) ( TRUCK-AT ?auto_1160796 ?auto_1160797 ) ( SURFACE-AT ?auto_1160793 ?auto_1160797 ) ( CLEAR ?auto_1160793 ) ( IS-CRATE ?auto_1160794 ) ( AVAILABLE ?auto_1160799 ) ( IN ?auto_1160794 ?auto_1160796 ) ( ON ?auto_1160784 ?auto_1160783 ) ( ON ?auto_1160785 ?auto_1160784 ) ( ON ?auto_1160782 ?auto_1160785 ) ( ON ?auto_1160786 ?auto_1160782 ) ( ON ?auto_1160788 ?auto_1160786 ) ( ON ?auto_1160787 ?auto_1160788 ) ( ON ?auto_1160789 ?auto_1160787 ) ( ON ?auto_1160790 ?auto_1160789 ) ( ON ?auto_1160791 ?auto_1160790 ) ( ON ?auto_1160792 ?auto_1160791 ) ( ON ?auto_1160793 ?auto_1160792 ) ( not ( = ?auto_1160783 ?auto_1160784 ) ) ( not ( = ?auto_1160783 ?auto_1160785 ) ) ( not ( = ?auto_1160783 ?auto_1160782 ) ) ( not ( = ?auto_1160783 ?auto_1160786 ) ) ( not ( = ?auto_1160783 ?auto_1160788 ) ) ( not ( = ?auto_1160783 ?auto_1160787 ) ) ( not ( = ?auto_1160783 ?auto_1160789 ) ) ( not ( = ?auto_1160783 ?auto_1160790 ) ) ( not ( = ?auto_1160783 ?auto_1160791 ) ) ( not ( = ?auto_1160783 ?auto_1160792 ) ) ( not ( = ?auto_1160783 ?auto_1160793 ) ) ( not ( = ?auto_1160783 ?auto_1160794 ) ) ( not ( = ?auto_1160783 ?auto_1160795 ) ) ( not ( = ?auto_1160783 ?auto_1160798 ) ) ( not ( = ?auto_1160784 ?auto_1160785 ) ) ( not ( = ?auto_1160784 ?auto_1160782 ) ) ( not ( = ?auto_1160784 ?auto_1160786 ) ) ( not ( = ?auto_1160784 ?auto_1160788 ) ) ( not ( = ?auto_1160784 ?auto_1160787 ) ) ( not ( = ?auto_1160784 ?auto_1160789 ) ) ( not ( = ?auto_1160784 ?auto_1160790 ) ) ( not ( = ?auto_1160784 ?auto_1160791 ) ) ( not ( = ?auto_1160784 ?auto_1160792 ) ) ( not ( = ?auto_1160784 ?auto_1160793 ) ) ( not ( = ?auto_1160784 ?auto_1160794 ) ) ( not ( = ?auto_1160784 ?auto_1160795 ) ) ( not ( = ?auto_1160784 ?auto_1160798 ) ) ( not ( = ?auto_1160785 ?auto_1160782 ) ) ( not ( = ?auto_1160785 ?auto_1160786 ) ) ( not ( = ?auto_1160785 ?auto_1160788 ) ) ( not ( = ?auto_1160785 ?auto_1160787 ) ) ( not ( = ?auto_1160785 ?auto_1160789 ) ) ( not ( = ?auto_1160785 ?auto_1160790 ) ) ( not ( = ?auto_1160785 ?auto_1160791 ) ) ( not ( = ?auto_1160785 ?auto_1160792 ) ) ( not ( = ?auto_1160785 ?auto_1160793 ) ) ( not ( = ?auto_1160785 ?auto_1160794 ) ) ( not ( = ?auto_1160785 ?auto_1160795 ) ) ( not ( = ?auto_1160785 ?auto_1160798 ) ) ( not ( = ?auto_1160782 ?auto_1160786 ) ) ( not ( = ?auto_1160782 ?auto_1160788 ) ) ( not ( = ?auto_1160782 ?auto_1160787 ) ) ( not ( = ?auto_1160782 ?auto_1160789 ) ) ( not ( = ?auto_1160782 ?auto_1160790 ) ) ( not ( = ?auto_1160782 ?auto_1160791 ) ) ( not ( = ?auto_1160782 ?auto_1160792 ) ) ( not ( = ?auto_1160782 ?auto_1160793 ) ) ( not ( = ?auto_1160782 ?auto_1160794 ) ) ( not ( = ?auto_1160782 ?auto_1160795 ) ) ( not ( = ?auto_1160782 ?auto_1160798 ) ) ( not ( = ?auto_1160786 ?auto_1160788 ) ) ( not ( = ?auto_1160786 ?auto_1160787 ) ) ( not ( = ?auto_1160786 ?auto_1160789 ) ) ( not ( = ?auto_1160786 ?auto_1160790 ) ) ( not ( = ?auto_1160786 ?auto_1160791 ) ) ( not ( = ?auto_1160786 ?auto_1160792 ) ) ( not ( = ?auto_1160786 ?auto_1160793 ) ) ( not ( = ?auto_1160786 ?auto_1160794 ) ) ( not ( = ?auto_1160786 ?auto_1160795 ) ) ( not ( = ?auto_1160786 ?auto_1160798 ) ) ( not ( = ?auto_1160788 ?auto_1160787 ) ) ( not ( = ?auto_1160788 ?auto_1160789 ) ) ( not ( = ?auto_1160788 ?auto_1160790 ) ) ( not ( = ?auto_1160788 ?auto_1160791 ) ) ( not ( = ?auto_1160788 ?auto_1160792 ) ) ( not ( = ?auto_1160788 ?auto_1160793 ) ) ( not ( = ?auto_1160788 ?auto_1160794 ) ) ( not ( = ?auto_1160788 ?auto_1160795 ) ) ( not ( = ?auto_1160788 ?auto_1160798 ) ) ( not ( = ?auto_1160787 ?auto_1160789 ) ) ( not ( = ?auto_1160787 ?auto_1160790 ) ) ( not ( = ?auto_1160787 ?auto_1160791 ) ) ( not ( = ?auto_1160787 ?auto_1160792 ) ) ( not ( = ?auto_1160787 ?auto_1160793 ) ) ( not ( = ?auto_1160787 ?auto_1160794 ) ) ( not ( = ?auto_1160787 ?auto_1160795 ) ) ( not ( = ?auto_1160787 ?auto_1160798 ) ) ( not ( = ?auto_1160789 ?auto_1160790 ) ) ( not ( = ?auto_1160789 ?auto_1160791 ) ) ( not ( = ?auto_1160789 ?auto_1160792 ) ) ( not ( = ?auto_1160789 ?auto_1160793 ) ) ( not ( = ?auto_1160789 ?auto_1160794 ) ) ( not ( = ?auto_1160789 ?auto_1160795 ) ) ( not ( = ?auto_1160789 ?auto_1160798 ) ) ( not ( = ?auto_1160790 ?auto_1160791 ) ) ( not ( = ?auto_1160790 ?auto_1160792 ) ) ( not ( = ?auto_1160790 ?auto_1160793 ) ) ( not ( = ?auto_1160790 ?auto_1160794 ) ) ( not ( = ?auto_1160790 ?auto_1160795 ) ) ( not ( = ?auto_1160790 ?auto_1160798 ) ) ( not ( = ?auto_1160791 ?auto_1160792 ) ) ( not ( = ?auto_1160791 ?auto_1160793 ) ) ( not ( = ?auto_1160791 ?auto_1160794 ) ) ( not ( = ?auto_1160791 ?auto_1160795 ) ) ( not ( = ?auto_1160791 ?auto_1160798 ) ) ( not ( = ?auto_1160792 ?auto_1160793 ) ) ( not ( = ?auto_1160792 ?auto_1160794 ) ) ( not ( = ?auto_1160792 ?auto_1160795 ) ) ( not ( = ?auto_1160792 ?auto_1160798 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1160793 ?auto_1160794 ?auto_1160795 )
      ( MAKE-13CRATE-VERIFY ?auto_1160783 ?auto_1160784 ?auto_1160785 ?auto_1160782 ?auto_1160786 ?auto_1160788 ?auto_1160787 ?auto_1160789 ?auto_1160790 ?auto_1160791 ?auto_1160792 ?auto_1160793 ?auto_1160794 ?auto_1160795 ) )
  )

)

