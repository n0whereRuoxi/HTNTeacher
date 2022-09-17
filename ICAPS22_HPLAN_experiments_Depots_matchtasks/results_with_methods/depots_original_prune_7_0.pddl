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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54900 - SURFACE
      ?auto_54901 - SURFACE
    )
    :vars
    (
      ?auto_54902 - HOIST
      ?auto_54903 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54902 ?auto_54903 ) ( SURFACE-AT ?auto_54900 ?auto_54903 ) ( CLEAR ?auto_54900 ) ( LIFTING ?auto_54902 ?auto_54901 ) ( IS-CRATE ?auto_54901 ) ( not ( = ?auto_54900 ?auto_54901 ) ) )
    :subtasks
    ( ( !DROP ?auto_54902 ?auto_54901 ?auto_54900 ?auto_54903 )
      ( MAKE-1CRATE-VERIFY ?auto_54900 ?auto_54901 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54904 - SURFACE
      ?auto_54905 - SURFACE
    )
    :vars
    (
      ?auto_54907 - HOIST
      ?auto_54906 - PLACE
      ?auto_54908 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54907 ?auto_54906 ) ( SURFACE-AT ?auto_54904 ?auto_54906 ) ( CLEAR ?auto_54904 ) ( IS-CRATE ?auto_54905 ) ( not ( = ?auto_54904 ?auto_54905 ) ) ( TRUCK-AT ?auto_54908 ?auto_54906 ) ( AVAILABLE ?auto_54907 ) ( IN ?auto_54905 ?auto_54908 ) )
    :subtasks
    ( ( !UNLOAD ?auto_54907 ?auto_54905 ?auto_54908 ?auto_54906 )
      ( MAKE-1CRATE ?auto_54904 ?auto_54905 )
      ( MAKE-1CRATE-VERIFY ?auto_54904 ?auto_54905 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54909 - SURFACE
      ?auto_54910 - SURFACE
    )
    :vars
    (
      ?auto_54913 - HOIST
      ?auto_54912 - PLACE
      ?auto_54911 - TRUCK
      ?auto_54914 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54913 ?auto_54912 ) ( SURFACE-AT ?auto_54909 ?auto_54912 ) ( CLEAR ?auto_54909 ) ( IS-CRATE ?auto_54910 ) ( not ( = ?auto_54909 ?auto_54910 ) ) ( AVAILABLE ?auto_54913 ) ( IN ?auto_54910 ?auto_54911 ) ( TRUCK-AT ?auto_54911 ?auto_54914 ) ( not ( = ?auto_54914 ?auto_54912 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_54911 ?auto_54914 ?auto_54912 )
      ( MAKE-1CRATE ?auto_54909 ?auto_54910 )
      ( MAKE-1CRATE-VERIFY ?auto_54909 ?auto_54910 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54915 - SURFACE
      ?auto_54916 - SURFACE
    )
    :vars
    (
      ?auto_54917 - HOIST
      ?auto_54919 - PLACE
      ?auto_54918 - TRUCK
      ?auto_54920 - PLACE
      ?auto_54921 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_54917 ?auto_54919 ) ( SURFACE-AT ?auto_54915 ?auto_54919 ) ( CLEAR ?auto_54915 ) ( IS-CRATE ?auto_54916 ) ( not ( = ?auto_54915 ?auto_54916 ) ) ( AVAILABLE ?auto_54917 ) ( TRUCK-AT ?auto_54918 ?auto_54920 ) ( not ( = ?auto_54920 ?auto_54919 ) ) ( HOIST-AT ?auto_54921 ?auto_54920 ) ( LIFTING ?auto_54921 ?auto_54916 ) ( not ( = ?auto_54917 ?auto_54921 ) ) )
    :subtasks
    ( ( !LOAD ?auto_54921 ?auto_54916 ?auto_54918 ?auto_54920 )
      ( MAKE-1CRATE ?auto_54915 ?auto_54916 )
      ( MAKE-1CRATE-VERIFY ?auto_54915 ?auto_54916 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54922 - SURFACE
      ?auto_54923 - SURFACE
    )
    :vars
    (
      ?auto_54927 - HOIST
      ?auto_54926 - PLACE
      ?auto_54924 - TRUCK
      ?auto_54928 - PLACE
      ?auto_54925 - HOIST
      ?auto_54929 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54927 ?auto_54926 ) ( SURFACE-AT ?auto_54922 ?auto_54926 ) ( CLEAR ?auto_54922 ) ( IS-CRATE ?auto_54923 ) ( not ( = ?auto_54922 ?auto_54923 ) ) ( AVAILABLE ?auto_54927 ) ( TRUCK-AT ?auto_54924 ?auto_54928 ) ( not ( = ?auto_54928 ?auto_54926 ) ) ( HOIST-AT ?auto_54925 ?auto_54928 ) ( not ( = ?auto_54927 ?auto_54925 ) ) ( AVAILABLE ?auto_54925 ) ( SURFACE-AT ?auto_54923 ?auto_54928 ) ( ON ?auto_54923 ?auto_54929 ) ( CLEAR ?auto_54923 ) ( not ( = ?auto_54922 ?auto_54929 ) ) ( not ( = ?auto_54923 ?auto_54929 ) ) )
    :subtasks
    ( ( !LIFT ?auto_54925 ?auto_54923 ?auto_54929 ?auto_54928 )
      ( MAKE-1CRATE ?auto_54922 ?auto_54923 )
      ( MAKE-1CRATE-VERIFY ?auto_54922 ?auto_54923 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54930 - SURFACE
      ?auto_54931 - SURFACE
    )
    :vars
    (
      ?auto_54936 - HOIST
      ?auto_54934 - PLACE
      ?auto_54935 - PLACE
      ?auto_54937 - HOIST
      ?auto_54933 - SURFACE
      ?auto_54932 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54936 ?auto_54934 ) ( SURFACE-AT ?auto_54930 ?auto_54934 ) ( CLEAR ?auto_54930 ) ( IS-CRATE ?auto_54931 ) ( not ( = ?auto_54930 ?auto_54931 ) ) ( AVAILABLE ?auto_54936 ) ( not ( = ?auto_54935 ?auto_54934 ) ) ( HOIST-AT ?auto_54937 ?auto_54935 ) ( not ( = ?auto_54936 ?auto_54937 ) ) ( AVAILABLE ?auto_54937 ) ( SURFACE-AT ?auto_54931 ?auto_54935 ) ( ON ?auto_54931 ?auto_54933 ) ( CLEAR ?auto_54931 ) ( not ( = ?auto_54930 ?auto_54933 ) ) ( not ( = ?auto_54931 ?auto_54933 ) ) ( TRUCK-AT ?auto_54932 ?auto_54934 ) )
    :subtasks
    ( ( !DRIVE ?auto_54932 ?auto_54934 ?auto_54935 )
      ( MAKE-1CRATE ?auto_54930 ?auto_54931 )
      ( MAKE-1CRATE-VERIFY ?auto_54930 ?auto_54931 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_54947 - SURFACE
      ?auto_54948 - SURFACE
      ?auto_54949 - SURFACE
    )
    :vars
    (
      ?auto_54950 - HOIST
      ?auto_54951 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54950 ?auto_54951 ) ( SURFACE-AT ?auto_54948 ?auto_54951 ) ( CLEAR ?auto_54948 ) ( LIFTING ?auto_54950 ?auto_54949 ) ( IS-CRATE ?auto_54949 ) ( not ( = ?auto_54948 ?auto_54949 ) ) ( ON ?auto_54948 ?auto_54947 ) ( not ( = ?auto_54947 ?auto_54948 ) ) ( not ( = ?auto_54947 ?auto_54949 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_54948 ?auto_54949 )
      ( MAKE-2CRATE-VERIFY ?auto_54947 ?auto_54948 ?auto_54949 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_54957 - SURFACE
      ?auto_54958 - SURFACE
      ?auto_54959 - SURFACE
    )
    :vars
    (
      ?auto_54962 - HOIST
      ?auto_54961 - PLACE
      ?auto_54960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54962 ?auto_54961 ) ( SURFACE-AT ?auto_54958 ?auto_54961 ) ( CLEAR ?auto_54958 ) ( IS-CRATE ?auto_54959 ) ( not ( = ?auto_54958 ?auto_54959 ) ) ( TRUCK-AT ?auto_54960 ?auto_54961 ) ( AVAILABLE ?auto_54962 ) ( IN ?auto_54959 ?auto_54960 ) ( ON ?auto_54958 ?auto_54957 ) ( not ( = ?auto_54957 ?auto_54958 ) ) ( not ( = ?auto_54957 ?auto_54959 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_54958 ?auto_54959 )
      ( MAKE-2CRATE-VERIFY ?auto_54957 ?auto_54958 ?auto_54959 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54963 - SURFACE
      ?auto_54964 - SURFACE
    )
    :vars
    (
      ?auto_54968 - HOIST
      ?auto_54966 - PLACE
      ?auto_54967 - TRUCK
      ?auto_54965 - SURFACE
      ?auto_54969 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54968 ?auto_54966 ) ( SURFACE-AT ?auto_54963 ?auto_54966 ) ( CLEAR ?auto_54963 ) ( IS-CRATE ?auto_54964 ) ( not ( = ?auto_54963 ?auto_54964 ) ) ( AVAILABLE ?auto_54968 ) ( IN ?auto_54964 ?auto_54967 ) ( ON ?auto_54963 ?auto_54965 ) ( not ( = ?auto_54965 ?auto_54963 ) ) ( not ( = ?auto_54965 ?auto_54964 ) ) ( TRUCK-AT ?auto_54967 ?auto_54969 ) ( not ( = ?auto_54969 ?auto_54966 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_54967 ?auto_54969 ?auto_54966 )
      ( MAKE-2CRATE ?auto_54965 ?auto_54963 ?auto_54964 )
      ( MAKE-1CRATE-VERIFY ?auto_54963 ?auto_54964 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_54970 - SURFACE
      ?auto_54971 - SURFACE
      ?auto_54972 - SURFACE
    )
    :vars
    (
      ?auto_54976 - HOIST
      ?auto_54975 - PLACE
      ?auto_54974 - TRUCK
      ?auto_54973 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54976 ?auto_54975 ) ( SURFACE-AT ?auto_54971 ?auto_54975 ) ( CLEAR ?auto_54971 ) ( IS-CRATE ?auto_54972 ) ( not ( = ?auto_54971 ?auto_54972 ) ) ( AVAILABLE ?auto_54976 ) ( IN ?auto_54972 ?auto_54974 ) ( ON ?auto_54971 ?auto_54970 ) ( not ( = ?auto_54970 ?auto_54971 ) ) ( not ( = ?auto_54970 ?auto_54972 ) ) ( TRUCK-AT ?auto_54974 ?auto_54973 ) ( not ( = ?auto_54973 ?auto_54975 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_54971 ?auto_54972 )
      ( MAKE-2CRATE-VERIFY ?auto_54970 ?auto_54971 ?auto_54972 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54977 - SURFACE
      ?auto_54978 - SURFACE
    )
    :vars
    (
      ?auto_54980 - HOIST
      ?auto_54979 - PLACE
      ?auto_54982 - SURFACE
      ?auto_54983 - TRUCK
      ?auto_54981 - PLACE
      ?auto_54984 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_54980 ?auto_54979 ) ( SURFACE-AT ?auto_54977 ?auto_54979 ) ( CLEAR ?auto_54977 ) ( IS-CRATE ?auto_54978 ) ( not ( = ?auto_54977 ?auto_54978 ) ) ( AVAILABLE ?auto_54980 ) ( ON ?auto_54977 ?auto_54982 ) ( not ( = ?auto_54982 ?auto_54977 ) ) ( not ( = ?auto_54982 ?auto_54978 ) ) ( TRUCK-AT ?auto_54983 ?auto_54981 ) ( not ( = ?auto_54981 ?auto_54979 ) ) ( HOIST-AT ?auto_54984 ?auto_54981 ) ( LIFTING ?auto_54984 ?auto_54978 ) ( not ( = ?auto_54980 ?auto_54984 ) ) )
    :subtasks
    ( ( !LOAD ?auto_54984 ?auto_54978 ?auto_54983 ?auto_54981 )
      ( MAKE-2CRATE ?auto_54982 ?auto_54977 ?auto_54978 )
      ( MAKE-1CRATE-VERIFY ?auto_54977 ?auto_54978 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_54985 - SURFACE
      ?auto_54986 - SURFACE
      ?auto_54987 - SURFACE
    )
    :vars
    (
      ?auto_54991 - HOIST
      ?auto_54992 - PLACE
      ?auto_54988 - TRUCK
      ?auto_54990 - PLACE
      ?auto_54989 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_54991 ?auto_54992 ) ( SURFACE-AT ?auto_54986 ?auto_54992 ) ( CLEAR ?auto_54986 ) ( IS-CRATE ?auto_54987 ) ( not ( = ?auto_54986 ?auto_54987 ) ) ( AVAILABLE ?auto_54991 ) ( ON ?auto_54986 ?auto_54985 ) ( not ( = ?auto_54985 ?auto_54986 ) ) ( not ( = ?auto_54985 ?auto_54987 ) ) ( TRUCK-AT ?auto_54988 ?auto_54990 ) ( not ( = ?auto_54990 ?auto_54992 ) ) ( HOIST-AT ?auto_54989 ?auto_54990 ) ( LIFTING ?auto_54989 ?auto_54987 ) ( not ( = ?auto_54991 ?auto_54989 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_54986 ?auto_54987 )
      ( MAKE-2CRATE-VERIFY ?auto_54985 ?auto_54986 ?auto_54987 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54993 - SURFACE
      ?auto_54994 - SURFACE
    )
    :vars
    (
      ?auto_54995 - HOIST
      ?auto_54998 - PLACE
      ?auto_54997 - SURFACE
      ?auto_55000 - TRUCK
      ?auto_54996 - PLACE
      ?auto_54999 - HOIST
      ?auto_55001 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54995 ?auto_54998 ) ( SURFACE-AT ?auto_54993 ?auto_54998 ) ( CLEAR ?auto_54993 ) ( IS-CRATE ?auto_54994 ) ( not ( = ?auto_54993 ?auto_54994 ) ) ( AVAILABLE ?auto_54995 ) ( ON ?auto_54993 ?auto_54997 ) ( not ( = ?auto_54997 ?auto_54993 ) ) ( not ( = ?auto_54997 ?auto_54994 ) ) ( TRUCK-AT ?auto_55000 ?auto_54996 ) ( not ( = ?auto_54996 ?auto_54998 ) ) ( HOIST-AT ?auto_54999 ?auto_54996 ) ( not ( = ?auto_54995 ?auto_54999 ) ) ( AVAILABLE ?auto_54999 ) ( SURFACE-AT ?auto_54994 ?auto_54996 ) ( ON ?auto_54994 ?auto_55001 ) ( CLEAR ?auto_54994 ) ( not ( = ?auto_54993 ?auto_55001 ) ) ( not ( = ?auto_54994 ?auto_55001 ) ) ( not ( = ?auto_54997 ?auto_55001 ) ) )
    :subtasks
    ( ( !LIFT ?auto_54999 ?auto_54994 ?auto_55001 ?auto_54996 )
      ( MAKE-2CRATE ?auto_54997 ?auto_54993 ?auto_54994 )
      ( MAKE-1CRATE-VERIFY ?auto_54993 ?auto_54994 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_55002 - SURFACE
      ?auto_55003 - SURFACE
      ?auto_55004 - SURFACE
    )
    :vars
    (
      ?auto_55010 - HOIST
      ?auto_55007 - PLACE
      ?auto_55009 - TRUCK
      ?auto_55008 - PLACE
      ?auto_55006 - HOIST
      ?auto_55005 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55010 ?auto_55007 ) ( SURFACE-AT ?auto_55003 ?auto_55007 ) ( CLEAR ?auto_55003 ) ( IS-CRATE ?auto_55004 ) ( not ( = ?auto_55003 ?auto_55004 ) ) ( AVAILABLE ?auto_55010 ) ( ON ?auto_55003 ?auto_55002 ) ( not ( = ?auto_55002 ?auto_55003 ) ) ( not ( = ?auto_55002 ?auto_55004 ) ) ( TRUCK-AT ?auto_55009 ?auto_55008 ) ( not ( = ?auto_55008 ?auto_55007 ) ) ( HOIST-AT ?auto_55006 ?auto_55008 ) ( not ( = ?auto_55010 ?auto_55006 ) ) ( AVAILABLE ?auto_55006 ) ( SURFACE-AT ?auto_55004 ?auto_55008 ) ( ON ?auto_55004 ?auto_55005 ) ( CLEAR ?auto_55004 ) ( not ( = ?auto_55003 ?auto_55005 ) ) ( not ( = ?auto_55004 ?auto_55005 ) ) ( not ( = ?auto_55002 ?auto_55005 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_55003 ?auto_55004 )
      ( MAKE-2CRATE-VERIFY ?auto_55002 ?auto_55003 ?auto_55004 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_55011 - SURFACE
      ?auto_55012 - SURFACE
    )
    :vars
    (
      ?auto_55013 - HOIST
      ?auto_55018 - PLACE
      ?auto_55019 - SURFACE
      ?auto_55017 - PLACE
      ?auto_55014 - HOIST
      ?auto_55016 - SURFACE
      ?auto_55015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55013 ?auto_55018 ) ( SURFACE-AT ?auto_55011 ?auto_55018 ) ( CLEAR ?auto_55011 ) ( IS-CRATE ?auto_55012 ) ( not ( = ?auto_55011 ?auto_55012 ) ) ( AVAILABLE ?auto_55013 ) ( ON ?auto_55011 ?auto_55019 ) ( not ( = ?auto_55019 ?auto_55011 ) ) ( not ( = ?auto_55019 ?auto_55012 ) ) ( not ( = ?auto_55017 ?auto_55018 ) ) ( HOIST-AT ?auto_55014 ?auto_55017 ) ( not ( = ?auto_55013 ?auto_55014 ) ) ( AVAILABLE ?auto_55014 ) ( SURFACE-AT ?auto_55012 ?auto_55017 ) ( ON ?auto_55012 ?auto_55016 ) ( CLEAR ?auto_55012 ) ( not ( = ?auto_55011 ?auto_55016 ) ) ( not ( = ?auto_55012 ?auto_55016 ) ) ( not ( = ?auto_55019 ?auto_55016 ) ) ( TRUCK-AT ?auto_55015 ?auto_55018 ) )
    :subtasks
    ( ( !DRIVE ?auto_55015 ?auto_55018 ?auto_55017 )
      ( MAKE-2CRATE ?auto_55019 ?auto_55011 ?auto_55012 )
      ( MAKE-1CRATE-VERIFY ?auto_55011 ?auto_55012 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_55020 - SURFACE
      ?auto_55021 - SURFACE
      ?auto_55022 - SURFACE
    )
    :vars
    (
      ?auto_55028 - HOIST
      ?auto_55026 - PLACE
      ?auto_55025 - PLACE
      ?auto_55024 - HOIST
      ?auto_55023 - SURFACE
      ?auto_55027 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55028 ?auto_55026 ) ( SURFACE-AT ?auto_55021 ?auto_55026 ) ( CLEAR ?auto_55021 ) ( IS-CRATE ?auto_55022 ) ( not ( = ?auto_55021 ?auto_55022 ) ) ( AVAILABLE ?auto_55028 ) ( ON ?auto_55021 ?auto_55020 ) ( not ( = ?auto_55020 ?auto_55021 ) ) ( not ( = ?auto_55020 ?auto_55022 ) ) ( not ( = ?auto_55025 ?auto_55026 ) ) ( HOIST-AT ?auto_55024 ?auto_55025 ) ( not ( = ?auto_55028 ?auto_55024 ) ) ( AVAILABLE ?auto_55024 ) ( SURFACE-AT ?auto_55022 ?auto_55025 ) ( ON ?auto_55022 ?auto_55023 ) ( CLEAR ?auto_55022 ) ( not ( = ?auto_55021 ?auto_55023 ) ) ( not ( = ?auto_55022 ?auto_55023 ) ) ( not ( = ?auto_55020 ?auto_55023 ) ) ( TRUCK-AT ?auto_55027 ?auto_55026 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_55021 ?auto_55022 )
      ( MAKE-2CRATE-VERIFY ?auto_55020 ?auto_55021 ?auto_55022 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_55029 - SURFACE
      ?auto_55030 - SURFACE
    )
    :vars
    (
      ?auto_55037 - HOIST
      ?auto_55036 - PLACE
      ?auto_55031 - SURFACE
      ?auto_55035 - PLACE
      ?auto_55034 - HOIST
      ?auto_55032 - SURFACE
      ?auto_55033 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55037 ?auto_55036 ) ( IS-CRATE ?auto_55030 ) ( not ( = ?auto_55029 ?auto_55030 ) ) ( not ( = ?auto_55031 ?auto_55029 ) ) ( not ( = ?auto_55031 ?auto_55030 ) ) ( not ( = ?auto_55035 ?auto_55036 ) ) ( HOIST-AT ?auto_55034 ?auto_55035 ) ( not ( = ?auto_55037 ?auto_55034 ) ) ( AVAILABLE ?auto_55034 ) ( SURFACE-AT ?auto_55030 ?auto_55035 ) ( ON ?auto_55030 ?auto_55032 ) ( CLEAR ?auto_55030 ) ( not ( = ?auto_55029 ?auto_55032 ) ) ( not ( = ?auto_55030 ?auto_55032 ) ) ( not ( = ?auto_55031 ?auto_55032 ) ) ( TRUCK-AT ?auto_55033 ?auto_55036 ) ( SURFACE-AT ?auto_55031 ?auto_55036 ) ( CLEAR ?auto_55031 ) ( LIFTING ?auto_55037 ?auto_55029 ) ( IS-CRATE ?auto_55029 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_55031 ?auto_55029 )
      ( MAKE-2CRATE ?auto_55031 ?auto_55029 ?auto_55030 )
      ( MAKE-1CRATE-VERIFY ?auto_55029 ?auto_55030 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_55038 - SURFACE
      ?auto_55039 - SURFACE
      ?auto_55040 - SURFACE
    )
    :vars
    (
      ?auto_55043 - HOIST
      ?auto_55046 - PLACE
      ?auto_55042 - PLACE
      ?auto_55045 - HOIST
      ?auto_55041 - SURFACE
      ?auto_55044 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55043 ?auto_55046 ) ( IS-CRATE ?auto_55040 ) ( not ( = ?auto_55039 ?auto_55040 ) ) ( not ( = ?auto_55038 ?auto_55039 ) ) ( not ( = ?auto_55038 ?auto_55040 ) ) ( not ( = ?auto_55042 ?auto_55046 ) ) ( HOIST-AT ?auto_55045 ?auto_55042 ) ( not ( = ?auto_55043 ?auto_55045 ) ) ( AVAILABLE ?auto_55045 ) ( SURFACE-AT ?auto_55040 ?auto_55042 ) ( ON ?auto_55040 ?auto_55041 ) ( CLEAR ?auto_55040 ) ( not ( = ?auto_55039 ?auto_55041 ) ) ( not ( = ?auto_55040 ?auto_55041 ) ) ( not ( = ?auto_55038 ?auto_55041 ) ) ( TRUCK-AT ?auto_55044 ?auto_55046 ) ( SURFACE-AT ?auto_55038 ?auto_55046 ) ( CLEAR ?auto_55038 ) ( LIFTING ?auto_55043 ?auto_55039 ) ( IS-CRATE ?auto_55039 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_55039 ?auto_55040 )
      ( MAKE-2CRATE-VERIFY ?auto_55038 ?auto_55039 ?auto_55040 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_55047 - SURFACE
      ?auto_55048 - SURFACE
    )
    :vars
    (
      ?auto_55053 - HOIST
      ?auto_55050 - PLACE
      ?auto_55049 - SURFACE
      ?auto_55055 - PLACE
      ?auto_55051 - HOIST
      ?auto_55052 - SURFACE
      ?auto_55054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55053 ?auto_55050 ) ( IS-CRATE ?auto_55048 ) ( not ( = ?auto_55047 ?auto_55048 ) ) ( not ( = ?auto_55049 ?auto_55047 ) ) ( not ( = ?auto_55049 ?auto_55048 ) ) ( not ( = ?auto_55055 ?auto_55050 ) ) ( HOIST-AT ?auto_55051 ?auto_55055 ) ( not ( = ?auto_55053 ?auto_55051 ) ) ( AVAILABLE ?auto_55051 ) ( SURFACE-AT ?auto_55048 ?auto_55055 ) ( ON ?auto_55048 ?auto_55052 ) ( CLEAR ?auto_55048 ) ( not ( = ?auto_55047 ?auto_55052 ) ) ( not ( = ?auto_55048 ?auto_55052 ) ) ( not ( = ?auto_55049 ?auto_55052 ) ) ( TRUCK-AT ?auto_55054 ?auto_55050 ) ( SURFACE-AT ?auto_55049 ?auto_55050 ) ( CLEAR ?auto_55049 ) ( IS-CRATE ?auto_55047 ) ( AVAILABLE ?auto_55053 ) ( IN ?auto_55047 ?auto_55054 ) )
    :subtasks
    ( ( !UNLOAD ?auto_55053 ?auto_55047 ?auto_55054 ?auto_55050 )
      ( MAKE-2CRATE ?auto_55049 ?auto_55047 ?auto_55048 )
      ( MAKE-1CRATE-VERIFY ?auto_55047 ?auto_55048 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_55056 - SURFACE
      ?auto_55057 - SURFACE
      ?auto_55058 - SURFACE
    )
    :vars
    (
      ?auto_55059 - HOIST
      ?auto_55060 - PLACE
      ?auto_55061 - PLACE
      ?auto_55064 - HOIST
      ?auto_55062 - SURFACE
      ?auto_55063 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55059 ?auto_55060 ) ( IS-CRATE ?auto_55058 ) ( not ( = ?auto_55057 ?auto_55058 ) ) ( not ( = ?auto_55056 ?auto_55057 ) ) ( not ( = ?auto_55056 ?auto_55058 ) ) ( not ( = ?auto_55061 ?auto_55060 ) ) ( HOIST-AT ?auto_55064 ?auto_55061 ) ( not ( = ?auto_55059 ?auto_55064 ) ) ( AVAILABLE ?auto_55064 ) ( SURFACE-AT ?auto_55058 ?auto_55061 ) ( ON ?auto_55058 ?auto_55062 ) ( CLEAR ?auto_55058 ) ( not ( = ?auto_55057 ?auto_55062 ) ) ( not ( = ?auto_55058 ?auto_55062 ) ) ( not ( = ?auto_55056 ?auto_55062 ) ) ( TRUCK-AT ?auto_55063 ?auto_55060 ) ( SURFACE-AT ?auto_55056 ?auto_55060 ) ( CLEAR ?auto_55056 ) ( IS-CRATE ?auto_55057 ) ( AVAILABLE ?auto_55059 ) ( IN ?auto_55057 ?auto_55063 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_55057 ?auto_55058 )
      ( MAKE-2CRATE-VERIFY ?auto_55056 ?auto_55057 ?auto_55058 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_55101 - SURFACE
      ?auto_55102 - SURFACE
    )
    :vars
    (
      ?auto_55106 - HOIST
      ?auto_55103 - PLACE
      ?auto_55104 - SURFACE
      ?auto_55108 - PLACE
      ?auto_55107 - HOIST
      ?auto_55109 - SURFACE
      ?auto_55105 - TRUCK
      ?auto_55110 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55106 ?auto_55103 ) ( SURFACE-AT ?auto_55101 ?auto_55103 ) ( CLEAR ?auto_55101 ) ( IS-CRATE ?auto_55102 ) ( not ( = ?auto_55101 ?auto_55102 ) ) ( AVAILABLE ?auto_55106 ) ( ON ?auto_55101 ?auto_55104 ) ( not ( = ?auto_55104 ?auto_55101 ) ) ( not ( = ?auto_55104 ?auto_55102 ) ) ( not ( = ?auto_55108 ?auto_55103 ) ) ( HOIST-AT ?auto_55107 ?auto_55108 ) ( not ( = ?auto_55106 ?auto_55107 ) ) ( AVAILABLE ?auto_55107 ) ( SURFACE-AT ?auto_55102 ?auto_55108 ) ( ON ?auto_55102 ?auto_55109 ) ( CLEAR ?auto_55102 ) ( not ( = ?auto_55101 ?auto_55109 ) ) ( not ( = ?auto_55102 ?auto_55109 ) ) ( not ( = ?auto_55104 ?auto_55109 ) ) ( TRUCK-AT ?auto_55105 ?auto_55110 ) ( not ( = ?auto_55110 ?auto_55103 ) ) ( not ( = ?auto_55108 ?auto_55110 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_55105 ?auto_55110 ?auto_55103 )
      ( MAKE-1CRATE ?auto_55101 ?auto_55102 )
      ( MAKE-1CRATE-VERIFY ?auto_55101 ?auto_55102 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55141 - SURFACE
      ?auto_55142 - SURFACE
      ?auto_55143 - SURFACE
      ?auto_55140 - SURFACE
    )
    :vars
    (
      ?auto_55145 - HOIST
      ?auto_55144 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55145 ?auto_55144 ) ( SURFACE-AT ?auto_55143 ?auto_55144 ) ( CLEAR ?auto_55143 ) ( LIFTING ?auto_55145 ?auto_55140 ) ( IS-CRATE ?auto_55140 ) ( not ( = ?auto_55143 ?auto_55140 ) ) ( ON ?auto_55142 ?auto_55141 ) ( ON ?auto_55143 ?auto_55142 ) ( not ( = ?auto_55141 ?auto_55142 ) ) ( not ( = ?auto_55141 ?auto_55143 ) ) ( not ( = ?auto_55141 ?auto_55140 ) ) ( not ( = ?auto_55142 ?auto_55143 ) ) ( not ( = ?auto_55142 ?auto_55140 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_55143 ?auto_55140 )
      ( MAKE-3CRATE-VERIFY ?auto_55141 ?auto_55142 ?auto_55143 ?auto_55140 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55158 - SURFACE
      ?auto_55159 - SURFACE
      ?auto_55160 - SURFACE
      ?auto_55157 - SURFACE
    )
    :vars
    (
      ?auto_55163 - HOIST
      ?auto_55162 - PLACE
      ?auto_55161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55163 ?auto_55162 ) ( SURFACE-AT ?auto_55160 ?auto_55162 ) ( CLEAR ?auto_55160 ) ( IS-CRATE ?auto_55157 ) ( not ( = ?auto_55160 ?auto_55157 ) ) ( TRUCK-AT ?auto_55161 ?auto_55162 ) ( AVAILABLE ?auto_55163 ) ( IN ?auto_55157 ?auto_55161 ) ( ON ?auto_55160 ?auto_55159 ) ( not ( = ?auto_55159 ?auto_55160 ) ) ( not ( = ?auto_55159 ?auto_55157 ) ) ( ON ?auto_55159 ?auto_55158 ) ( not ( = ?auto_55158 ?auto_55159 ) ) ( not ( = ?auto_55158 ?auto_55160 ) ) ( not ( = ?auto_55158 ?auto_55157 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55159 ?auto_55160 ?auto_55157 )
      ( MAKE-3CRATE-VERIFY ?auto_55158 ?auto_55159 ?auto_55160 ?auto_55157 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55179 - SURFACE
      ?auto_55180 - SURFACE
      ?auto_55181 - SURFACE
      ?auto_55178 - SURFACE
    )
    :vars
    (
      ?auto_55185 - HOIST
      ?auto_55183 - PLACE
      ?auto_55182 - TRUCK
      ?auto_55184 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55185 ?auto_55183 ) ( SURFACE-AT ?auto_55181 ?auto_55183 ) ( CLEAR ?auto_55181 ) ( IS-CRATE ?auto_55178 ) ( not ( = ?auto_55181 ?auto_55178 ) ) ( AVAILABLE ?auto_55185 ) ( IN ?auto_55178 ?auto_55182 ) ( ON ?auto_55181 ?auto_55180 ) ( not ( = ?auto_55180 ?auto_55181 ) ) ( not ( = ?auto_55180 ?auto_55178 ) ) ( TRUCK-AT ?auto_55182 ?auto_55184 ) ( not ( = ?auto_55184 ?auto_55183 ) ) ( ON ?auto_55180 ?auto_55179 ) ( not ( = ?auto_55179 ?auto_55180 ) ) ( not ( = ?auto_55179 ?auto_55181 ) ) ( not ( = ?auto_55179 ?auto_55178 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55180 ?auto_55181 ?auto_55178 )
      ( MAKE-3CRATE-VERIFY ?auto_55179 ?auto_55180 ?auto_55181 ?auto_55178 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55203 - SURFACE
      ?auto_55204 - SURFACE
      ?auto_55205 - SURFACE
      ?auto_55202 - SURFACE
    )
    :vars
    (
      ?auto_55207 - HOIST
      ?auto_55210 - PLACE
      ?auto_55209 - TRUCK
      ?auto_55206 - PLACE
      ?auto_55208 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_55207 ?auto_55210 ) ( SURFACE-AT ?auto_55205 ?auto_55210 ) ( CLEAR ?auto_55205 ) ( IS-CRATE ?auto_55202 ) ( not ( = ?auto_55205 ?auto_55202 ) ) ( AVAILABLE ?auto_55207 ) ( ON ?auto_55205 ?auto_55204 ) ( not ( = ?auto_55204 ?auto_55205 ) ) ( not ( = ?auto_55204 ?auto_55202 ) ) ( TRUCK-AT ?auto_55209 ?auto_55206 ) ( not ( = ?auto_55206 ?auto_55210 ) ) ( HOIST-AT ?auto_55208 ?auto_55206 ) ( LIFTING ?auto_55208 ?auto_55202 ) ( not ( = ?auto_55207 ?auto_55208 ) ) ( ON ?auto_55204 ?auto_55203 ) ( not ( = ?auto_55203 ?auto_55204 ) ) ( not ( = ?auto_55203 ?auto_55205 ) ) ( not ( = ?auto_55203 ?auto_55202 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55204 ?auto_55205 ?auto_55202 )
      ( MAKE-3CRATE-VERIFY ?auto_55203 ?auto_55204 ?auto_55205 ?auto_55202 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55230 - SURFACE
      ?auto_55231 - SURFACE
      ?auto_55232 - SURFACE
      ?auto_55229 - SURFACE
    )
    :vars
    (
      ?auto_55235 - HOIST
      ?auto_55237 - PLACE
      ?auto_55234 - TRUCK
      ?auto_55233 - PLACE
      ?auto_55238 - HOIST
      ?auto_55236 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55235 ?auto_55237 ) ( SURFACE-AT ?auto_55232 ?auto_55237 ) ( CLEAR ?auto_55232 ) ( IS-CRATE ?auto_55229 ) ( not ( = ?auto_55232 ?auto_55229 ) ) ( AVAILABLE ?auto_55235 ) ( ON ?auto_55232 ?auto_55231 ) ( not ( = ?auto_55231 ?auto_55232 ) ) ( not ( = ?auto_55231 ?auto_55229 ) ) ( TRUCK-AT ?auto_55234 ?auto_55233 ) ( not ( = ?auto_55233 ?auto_55237 ) ) ( HOIST-AT ?auto_55238 ?auto_55233 ) ( not ( = ?auto_55235 ?auto_55238 ) ) ( AVAILABLE ?auto_55238 ) ( SURFACE-AT ?auto_55229 ?auto_55233 ) ( ON ?auto_55229 ?auto_55236 ) ( CLEAR ?auto_55229 ) ( not ( = ?auto_55232 ?auto_55236 ) ) ( not ( = ?auto_55229 ?auto_55236 ) ) ( not ( = ?auto_55231 ?auto_55236 ) ) ( ON ?auto_55231 ?auto_55230 ) ( not ( = ?auto_55230 ?auto_55231 ) ) ( not ( = ?auto_55230 ?auto_55232 ) ) ( not ( = ?auto_55230 ?auto_55229 ) ) ( not ( = ?auto_55230 ?auto_55236 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55231 ?auto_55232 ?auto_55229 )
      ( MAKE-3CRATE-VERIFY ?auto_55230 ?auto_55231 ?auto_55232 ?auto_55229 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55258 - SURFACE
      ?auto_55259 - SURFACE
      ?auto_55260 - SURFACE
      ?auto_55257 - SURFACE
    )
    :vars
    (
      ?auto_55261 - HOIST
      ?auto_55264 - PLACE
      ?auto_55262 - PLACE
      ?auto_55265 - HOIST
      ?auto_55266 - SURFACE
      ?auto_55263 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55261 ?auto_55264 ) ( SURFACE-AT ?auto_55260 ?auto_55264 ) ( CLEAR ?auto_55260 ) ( IS-CRATE ?auto_55257 ) ( not ( = ?auto_55260 ?auto_55257 ) ) ( AVAILABLE ?auto_55261 ) ( ON ?auto_55260 ?auto_55259 ) ( not ( = ?auto_55259 ?auto_55260 ) ) ( not ( = ?auto_55259 ?auto_55257 ) ) ( not ( = ?auto_55262 ?auto_55264 ) ) ( HOIST-AT ?auto_55265 ?auto_55262 ) ( not ( = ?auto_55261 ?auto_55265 ) ) ( AVAILABLE ?auto_55265 ) ( SURFACE-AT ?auto_55257 ?auto_55262 ) ( ON ?auto_55257 ?auto_55266 ) ( CLEAR ?auto_55257 ) ( not ( = ?auto_55260 ?auto_55266 ) ) ( not ( = ?auto_55257 ?auto_55266 ) ) ( not ( = ?auto_55259 ?auto_55266 ) ) ( TRUCK-AT ?auto_55263 ?auto_55264 ) ( ON ?auto_55259 ?auto_55258 ) ( not ( = ?auto_55258 ?auto_55259 ) ) ( not ( = ?auto_55258 ?auto_55260 ) ) ( not ( = ?auto_55258 ?auto_55257 ) ) ( not ( = ?auto_55258 ?auto_55266 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55259 ?auto_55260 ?auto_55257 )
      ( MAKE-3CRATE-VERIFY ?auto_55258 ?auto_55259 ?auto_55260 ?auto_55257 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55286 - SURFACE
      ?auto_55287 - SURFACE
      ?auto_55288 - SURFACE
      ?auto_55285 - SURFACE
    )
    :vars
    (
      ?auto_55289 - HOIST
      ?auto_55294 - PLACE
      ?auto_55290 - PLACE
      ?auto_55291 - HOIST
      ?auto_55293 - SURFACE
      ?auto_55292 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55289 ?auto_55294 ) ( IS-CRATE ?auto_55285 ) ( not ( = ?auto_55288 ?auto_55285 ) ) ( not ( = ?auto_55287 ?auto_55288 ) ) ( not ( = ?auto_55287 ?auto_55285 ) ) ( not ( = ?auto_55290 ?auto_55294 ) ) ( HOIST-AT ?auto_55291 ?auto_55290 ) ( not ( = ?auto_55289 ?auto_55291 ) ) ( AVAILABLE ?auto_55291 ) ( SURFACE-AT ?auto_55285 ?auto_55290 ) ( ON ?auto_55285 ?auto_55293 ) ( CLEAR ?auto_55285 ) ( not ( = ?auto_55288 ?auto_55293 ) ) ( not ( = ?auto_55285 ?auto_55293 ) ) ( not ( = ?auto_55287 ?auto_55293 ) ) ( TRUCK-AT ?auto_55292 ?auto_55294 ) ( SURFACE-AT ?auto_55287 ?auto_55294 ) ( CLEAR ?auto_55287 ) ( LIFTING ?auto_55289 ?auto_55288 ) ( IS-CRATE ?auto_55288 ) ( ON ?auto_55287 ?auto_55286 ) ( not ( = ?auto_55286 ?auto_55287 ) ) ( not ( = ?auto_55286 ?auto_55288 ) ) ( not ( = ?auto_55286 ?auto_55285 ) ) ( not ( = ?auto_55286 ?auto_55293 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55287 ?auto_55288 ?auto_55285 )
      ( MAKE-3CRATE-VERIFY ?auto_55286 ?auto_55287 ?auto_55288 ?auto_55285 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55314 - SURFACE
      ?auto_55315 - SURFACE
      ?auto_55316 - SURFACE
      ?auto_55313 - SURFACE
    )
    :vars
    (
      ?auto_55317 - HOIST
      ?auto_55319 - PLACE
      ?auto_55322 - PLACE
      ?auto_55318 - HOIST
      ?auto_55320 - SURFACE
      ?auto_55321 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55317 ?auto_55319 ) ( IS-CRATE ?auto_55313 ) ( not ( = ?auto_55316 ?auto_55313 ) ) ( not ( = ?auto_55315 ?auto_55316 ) ) ( not ( = ?auto_55315 ?auto_55313 ) ) ( not ( = ?auto_55322 ?auto_55319 ) ) ( HOIST-AT ?auto_55318 ?auto_55322 ) ( not ( = ?auto_55317 ?auto_55318 ) ) ( AVAILABLE ?auto_55318 ) ( SURFACE-AT ?auto_55313 ?auto_55322 ) ( ON ?auto_55313 ?auto_55320 ) ( CLEAR ?auto_55313 ) ( not ( = ?auto_55316 ?auto_55320 ) ) ( not ( = ?auto_55313 ?auto_55320 ) ) ( not ( = ?auto_55315 ?auto_55320 ) ) ( TRUCK-AT ?auto_55321 ?auto_55319 ) ( SURFACE-AT ?auto_55315 ?auto_55319 ) ( CLEAR ?auto_55315 ) ( IS-CRATE ?auto_55316 ) ( AVAILABLE ?auto_55317 ) ( IN ?auto_55316 ?auto_55321 ) ( ON ?auto_55315 ?auto_55314 ) ( not ( = ?auto_55314 ?auto_55315 ) ) ( not ( = ?auto_55314 ?auto_55316 ) ) ( not ( = ?auto_55314 ?auto_55313 ) ) ( not ( = ?auto_55314 ?auto_55320 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55315 ?auto_55316 ?auto_55313 )
      ( MAKE-3CRATE-VERIFY ?auto_55314 ?auto_55315 ?auto_55316 ?auto_55313 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55605 - SURFACE
      ?auto_55606 - SURFACE
      ?auto_55607 - SURFACE
      ?auto_55604 - SURFACE
      ?auto_55608 - SURFACE
    )
    :vars
    (
      ?auto_55610 - HOIST
      ?auto_55609 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55610 ?auto_55609 ) ( SURFACE-AT ?auto_55604 ?auto_55609 ) ( CLEAR ?auto_55604 ) ( LIFTING ?auto_55610 ?auto_55608 ) ( IS-CRATE ?auto_55608 ) ( not ( = ?auto_55604 ?auto_55608 ) ) ( ON ?auto_55606 ?auto_55605 ) ( ON ?auto_55607 ?auto_55606 ) ( ON ?auto_55604 ?auto_55607 ) ( not ( = ?auto_55605 ?auto_55606 ) ) ( not ( = ?auto_55605 ?auto_55607 ) ) ( not ( = ?auto_55605 ?auto_55604 ) ) ( not ( = ?auto_55605 ?auto_55608 ) ) ( not ( = ?auto_55606 ?auto_55607 ) ) ( not ( = ?auto_55606 ?auto_55604 ) ) ( not ( = ?auto_55606 ?auto_55608 ) ) ( not ( = ?auto_55607 ?auto_55604 ) ) ( not ( = ?auto_55607 ?auto_55608 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_55604 ?auto_55608 )
      ( MAKE-4CRATE-VERIFY ?auto_55605 ?auto_55606 ?auto_55607 ?auto_55604 ?auto_55608 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55630 - SURFACE
      ?auto_55631 - SURFACE
      ?auto_55632 - SURFACE
      ?auto_55629 - SURFACE
      ?auto_55633 - SURFACE
    )
    :vars
    (
      ?auto_55634 - HOIST
      ?auto_55636 - PLACE
      ?auto_55635 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55634 ?auto_55636 ) ( SURFACE-AT ?auto_55629 ?auto_55636 ) ( CLEAR ?auto_55629 ) ( IS-CRATE ?auto_55633 ) ( not ( = ?auto_55629 ?auto_55633 ) ) ( TRUCK-AT ?auto_55635 ?auto_55636 ) ( AVAILABLE ?auto_55634 ) ( IN ?auto_55633 ?auto_55635 ) ( ON ?auto_55629 ?auto_55632 ) ( not ( = ?auto_55632 ?auto_55629 ) ) ( not ( = ?auto_55632 ?auto_55633 ) ) ( ON ?auto_55631 ?auto_55630 ) ( ON ?auto_55632 ?auto_55631 ) ( not ( = ?auto_55630 ?auto_55631 ) ) ( not ( = ?auto_55630 ?auto_55632 ) ) ( not ( = ?auto_55630 ?auto_55629 ) ) ( not ( = ?auto_55630 ?auto_55633 ) ) ( not ( = ?auto_55631 ?auto_55632 ) ) ( not ( = ?auto_55631 ?auto_55629 ) ) ( not ( = ?auto_55631 ?auto_55633 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55632 ?auto_55629 ?auto_55633 )
      ( MAKE-4CRATE-VERIFY ?auto_55630 ?auto_55631 ?auto_55632 ?auto_55629 ?auto_55633 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55660 - SURFACE
      ?auto_55661 - SURFACE
      ?auto_55662 - SURFACE
      ?auto_55659 - SURFACE
      ?auto_55663 - SURFACE
    )
    :vars
    (
      ?auto_55666 - HOIST
      ?auto_55664 - PLACE
      ?auto_55667 - TRUCK
      ?auto_55665 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55666 ?auto_55664 ) ( SURFACE-AT ?auto_55659 ?auto_55664 ) ( CLEAR ?auto_55659 ) ( IS-CRATE ?auto_55663 ) ( not ( = ?auto_55659 ?auto_55663 ) ) ( AVAILABLE ?auto_55666 ) ( IN ?auto_55663 ?auto_55667 ) ( ON ?auto_55659 ?auto_55662 ) ( not ( = ?auto_55662 ?auto_55659 ) ) ( not ( = ?auto_55662 ?auto_55663 ) ) ( TRUCK-AT ?auto_55667 ?auto_55665 ) ( not ( = ?auto_55665 ?auto_55664 ) ) ( ON ?auto_55661 ?auto_55660 ) ( ON ?auto_55662 ?auto_55661 ) ( not ( = ?auto_55660 ?auto_55661 ) ) ( not ( = ?auto_55660 ?auto_55662 ) ) ( not ( = ?auto_55660 ?auto_55659 ) ) ( not ( = ?auto_55660 ?auto_55663 ) ) ( not ( = ?auto_55661 ?auto_55662 ) ) ( not ( = ?auto_55661 ?auto_55659 ) ) ( not ( = ?auto_55661 ?auto_55663 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55662 ?auto_55659 ?auto_55663 )
      ( MAKE-4CRATE-VERIFY ?auto_55660 ?auto_55661 ?auto_55662 ?auto_55659 ?auto_55663 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55694 - SURFACE
      ?auto_55695 - SURFACE
      ?auto_55696 - SURFACE
      ?auto_55693 - SURFACE
      ?auto_55697 - SURFACE
    )
    :vars
    (
      ?auto_55701 - HOIST
      ?auto_55702 - PLACE
      ?auto_55700 - TRUCK
      ?auto_55699 - PLACE
      ?auto_55698 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_55701 ?auto_55702 ) ( SURFACE-AT ?auto_55693 ?auto_55702 ) ( CLEAR ?auto_55693 ) ( IS-CRATE ?auto_55697 ) ( not ( = ?auto_55693 ?auto_55697 ) ) ( AVAILABLE ?auto_55701 ) ( ON ?auto_55693 ?auto_55696 ) ( not ( = ?auto_55696 ?auto_55693 ) ) ( not ( = ?auto_55696 ?auto_55697 ) ) ( TRUCK-AT ?auto_55700 ?auto_55699 ) ( not ( = ?auto_55699 ?auto_55702 ) ) ( HOIST-AT ?auto_55698 ?auto_55699 ) ( LIFTING ?auto_55698 ?auto_55697 ) ( not ( = ?auto_55701 ?auto_55698 ) ) ( ON ?auto_55695 ?auto_55694 ) ( ON ?auto_55696 ?auto_55695 ) ( not ( = ?auto_55694 ?auto_55695 ) ) ( not ( = ?auto_55694 ?auto_55696 ) ) ( not ( = ?auto_55694 ?auto_55693 ) ) ( not ( = ?auto_55694 ?auto_55697 ) ) ( not ( = ?auto_55695 ?auto_55696 ) ) ( not ( = ?auto_55695 ?auto_55693 ) ) ( not ( = ?auto_55695 ?auto_55697 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55696 ?auto_55693 ?auto_55697 )
      ( MAKE-4CRATE-VERIFY ?auto_55694 ?auto_55695 ?auto_55696 ?auto_55693 ?auto_55697 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55732 - SURFACE
      ?auto_55733 - SURFACE
      ?auto_55734 - SURFACE
      ?auto_55731 - SURFACE
      ?auto_55735 - SURFACE
    )
    :vars
    (
      ?auto_55738 - HOIST
      ?auto_55737 - PLACE
      ?auto_55740 - TRUCK
      ?auto_55739 - PLACE
      ?auto_55741 - HOIST
      ?auto_55736 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55738 ?auto_55737 ) ( SURFACE-AT ?auto_55731 ?auto_55737 ) ( CLEAR ?auto_55731 ) ( IS-CRATE ?auto_55735 ) ( not ( = ?auto_55731 ?auto_55735 ) ) ( AVAILABLE ?auto_55738 ) ( ON ?auto_55731 ?auto_55734 ) ( not ( = ?auto_55734 ?auto_55731 ) ) ( not ( = ?auto_55734 ?auto_55735 ) ) ( TRUCK-AT ?auto_55740 ?auto_55739 ) ( not ( = ?auto_55739 ?auto_55737 ) ) ( HOIST-AT ?auto_55741 ?auto_55739 ) ( not ( = ?auto_55738 ?auto_55741 ) ) ( AVAILABLE ?auto_55741 ) ( SURFACE-AT ?auto_55735 ?auto_55739 ) ( ON ?auto_55735 ?auto_55736 ) ( CLEAR ?auto_55735 ) ( not ( = ?auto_55731 ?auto_55736 ) ) ( not ( = ?auto_55735 ?auto_55736 ) ) ( not ( = ?auto_55734 ?auto_55736 ) ) ( ON ?auto_55733 ?auto_55732 ) ( ON ?auto_55734 ?auto_55733 ) ( not ( = ?auto_55732 ?auto_55733 ) ) ( not ( = ?auto_55732 ?auto_55734 ) ) ( not ( = ?auto_55732 ?auto_55731 ) ) ( not ( = ?auto_55732 ?auto_55735 ) ) ( not ( = ?auto_55732 ?auto_55736 ) ) ( not ( = ?auto_55733 ?auto_55734 ) ) ( not ( = ?auto_55733 ?auto_55731 ) ) ( not ( = ?auto_55733 ?auto_55735 ) ) ( not ( = ?auto_55733 ?auto_55736 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55734 ?auto_55731 ?auto_55735 )
      ( MAKE-4CRATE-VERIFY ?auto_55732 ?auto_55733 ?auto_55734 ?auto_55731 ?auto_55735 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55771 - SURFACE
      ?auto_55772 - SURFACE
      ?auto_55773 - SURFACE
      ?auto_55770 - SURFACE
      ?auto_55774 - SURFACE
    )
    :vars
    (
      ?auto_55778 - HOIST
      ?auto_55776 - PLACE
      ?auto_55780 - PLACE
      ?auto_55779 - HOIST
      ?auto_55775 - SURFACE
      ?auto_55777 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55778 ?auto_55776 ) ( SURFACE-AT ?auto_55770 ?auto_55776 ) ( CLEAR ?auto_55770 ) ( IS-CRATE ?auto_55774 ) ( not ( = ?auto_55770 ?auto_55774 ) ) ( AVAILABLE ?auto_55778 ) ( ON ?auto_55770 ?auto_55773 ) ( not ( = ?auto_55773 ?auto_55770 ) ) ( not ( = ?auto_55773 ?auto_55774 ) ) ( not ( = ?auto_55780 ?auto_55776 ) ) ( HOIST-AT ?auto_55779 ?auto_55780 ) ( not ( = ?auto_55778 ?auto_55779 ) ) ( AVAILABLE ?auto_55779 ) ( SURFACE-AT ?auto_55774 ?auto_55780 ) ( ON ?auto_55774 ?auto_55775 ) ( CLEAR ?auto_55774 ) ( not ( = ?auto_55770 ?auto_55775 ) ) ( not ( = ?auto_55774 ?auto_55775 ) ) ( not ( = ?auto_55773 ?auto_55775 ) ) ( TRUCK-AT ?auto_55777 ?auto_55776 ) ( ON ?auto_55772 ?auto_55771 ) ( ON ?auto_55773 ?auto_55772 ) ( not ( = ?auto_55771 ?auto_55772 ) ) ( not ( = ?auto_55771 ?auto_55773 ) ) ( not ( = ?auto_55771 ?auto_55770 ) ) ( not ( = ?auto_55771 ?auto_55774 ) ) ( not ( = ?auto_55771 ?auto_55775 ) ) ( not ( = ?auto_55772 ?auto_55773 ) ) ( not ( = ?auto_55772 ?auto_55770 ) ) ( not ( = ?auto_55772 ?auto_55774 ) ) ( not ( = ?auto_55772 ?auto_55775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55773 ?auto_55770 ?auto_55774 )
      ( MAKE-4CRATE-VERIFY ?auto_55771 ?auto_55772 ?auto_55773 ?auto_55770 ?auto_55774 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55810 - SURFACE
      ?auto_55811 - SURFACE
      ?auto_55812 - SURFACE
      ?auto_55809 - SURFACE
      ?auto_55813 - SURFACE
    )
    :vars
    (
      ?auto_55817 - HOIST
      ?auto_55819 - PLACE
      ?auto_55815 - PLACE
      ?auto_55816 - HOIST
      ?auto_55814 - SURFACE
      ?auto_55818 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55817 ?auto_55819 ) ( IS-CRATE ?auto_55813 ) ( not ( = ?auto_55809 ?auto_55813 ) ) ( not ( = ?auto_55812 ?auto_55809 ) ) ( not ( = ?auto_55812 ?auto_55813 ) ) ( not ( = ?auto_55815 ?auto_55819 ) ) ( HOIST-AT ?auto_55816 ?auto_55815 ) ( not ( = ?auto_55817 ?auto_55816 ) ) ( AVAILABLE ?auto_55816 ) ( SURFACE-AT ?auto_55813 ?auto_55815 ) ( ON ?auto_55813 ?auto_55814 ) ( CLEAR ?auto_55813 ) ( not ( = ?auto_55809 ?auto_55814 ) ) ( not ( = ?auto_55813 ?auto_55814 ) ) ( not ( = ?auto_55812 ?auto_55814 ) ) ( TRUCK-AT ?auto_55818 ?auto_55819 ) ( SURFACE-AT ?auto_55812 ?auto_55819 ) ( CLEAR ?auto_55812 ) ( LIFTING ?auto_55817 ?auto_55809 ) ( IS-CRATE ?auto_55809 ) ( ON ?auto_55811 ?auto_55810 ) ( ON ?auto_55812 ?auto_55811 ) ( not ( = ?auto_55810 ?auto_55811 ) ) ( not ( = ?auto_55810 ?auto_55812 ) ) ( not ( = ?auto_55810 ?auto_55809 ) ) ( not ( = ?auto_55810 ?auto_55813 ) ) ( not ( = ?auto_55810 ?auto_55814 ) ) ( not ( = ?auto_55811 ?auto_55812 ) ) ( not ( = ?auto_55811 ?auto_55809 ) ) ( not ( = ?auto_55811 ?auto_55813 ) ) ( not ( = ?auto_55811 ?auto_55814 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55812 ?auto_55809 ?auto_55813 )
      ( MAKE-4CRATE-VERIFY ?auto_55810 ?auto_55811 ?auto_55812 ?auto_55809 ?auto_55813 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55849 - SURFACE
      ?auto_55850 - SURFACE
      ?auto_55851 - SURFACE
      ?auto_55848 - SURFACE
      ?auto_55852 - SURFACE
    )
    :vars
    (
      ?auto_55855 - HOIST
      ?auto_55857 - PLACE
      ?auto_55858 - PLACE
      ?auto_55854 - HOIST
      ?auto_55853 - SURFACE
      ?auto_55856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55855 ?auto_55857 ) ( IS-CRATE ?auto_55852 ) ( not ( = ?auto_55848 ?auto_55852 ) ) ( not ( = ?auto_55851 ?auto_55848 ) ) ( not ( = ?auto_55851 ?auto_55852 ) ) ( not ( = ?auto_55858 ?auto_55857 ) ) ( HOIST-AT ?auto_55854 ?auto_55858 ) ( not ( = ?auto_55855 ?auto_55854 ) ) ( AVAILABLE ?auto_55854 ) ( SURFACE-AT ?auto_55852 ?auto_55858 ) ( ON ?auto_55852 ?auto_55853 ) ( CLEAR ?auto_55852 ) ( not ( = ?auto_55848 ?auto_55853 ) ) ( not ( = ?auto_55852 ?auto_55853 ) ) ( not ( = ?auto_55851 ?auto_55853 ) ) ( TRUCK-AT ?auto_55856 ?auto_55857 ) ( SURFACE-AT ?auto_55851 ?auto_55857 ) ( CLEAR ?auto_55851 ) ( IS-CRATE ?auto_55848 ) ( AVAILABLE ?auto_55855 ) ( IN ?auto_55848 ?auto_55856 ) ( ON ?auto_55850 ?auto_55849 ) ( ON ?auto_55851 ?auto_55850 ) ( not ( = ?auto_55849 ?auto_55850 ) ) ( not ( = ?auto_55849 ?auto_55851 ) ) ( not ( = ?auto_55849 ?auto_55848 ) ) ( not ( = ?auto_55849 ?auto_55852 ) ) ( not ( = ?auto_55849 ?auto_55853 ) ) ( not ( = ?auto_55850 ?auto_55851 ) ) ( not ( = ?auto_55850 ?auto_55848 ) ) ( not ( = ?auto_55850 ?auto_55852 ) ) ( not ( = ?auto_55850 ?auto_55853 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55851 ?auto_55848 ?auto_55852 )
      ( MAKE-4CRATE-VERIFY ?auto_55849 ?auto_55850 ?auto_55851 ?auto_55848 ?auto_55852 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56509 - SURFACE
      ?auto_56510 - SURFACE
      ?auto_56511 - SURFACE
      ?auto_56508 - SURFACE
      ?auto_56512 - SURFACE
      ?auto_56513 - SURFACE
    )
    :vars
    (
      ?auto_56515 - HOIST
      ?auto_56514 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56515 ?auto_56514 ) ( SURFACE-AT ?auto_56512 ?auto_56514 ) ( CLEAR ?auto_56512 ) ( LIFTING ?auto_56515 ?auto_56513 ) ( IS-CRATE ?auto_56513 ) ( not ( = ?auto_56512 ?auto_56513 ) ) ( ON ?auto_56510 ?auto_56509 ) ( ON ?auto_56511 ?auto_56510 ) ( ON ?auto_56508 ?auto_56511 ) ( ON ?auto_56512 ?auto_56508 ) ( not ( = ?auto_56509 ?auto_56510 ) ) ( not ( = ?auto_56509 ?auto_56511 ) ) ( not ( = ?auto_56509 ?auto_56508 ) ) ( not ( = ?auto_56509 ?auto_56512 ) ) ( not ( = ?auto_56509 ?auto_56513 ) ) ( not ( = ?auto_56510 ?auto_56511 ) ) ( not ( = ?auto_56510 ?auto_56508 ) ) ( not ( = ?auto_56510 ?auto_56512 ) ) ( not ( = ?auto_56510 ?auto_56513 ) ) ( not ( = ?auto_56511 ?auto_56508 ) ) ( not ( = ?auto_56511 ?auto_56512 ) ) ( not ( = ?auto_56511 ?auto_56513 ) ) ( not ( = ?auto_56508 ?auto_56512 ) ) ( not ( = ?auto_56508 ?auto_56513 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_56512 ?auto_56513 )
      ( MAKE-5CRATE-VERIFY ?auto_56509 ?auto_56510 ?auto_56511 ?auto_56508 ?auto_56512 ?auto_56513 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56543 - SURFACE
      ?auto_56544 - SURFACE
      ?auto_56545 - SURFACE
      ?auto_56542 - SURFACE
      ?auto_56546 - SURFACE
      ?auto_56547 - SURFACE
    )
    :vars
    (
      ?auto_56549 - HOIST
      ?auto_56550 - PLACE
      ?auto_56548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56549 ?auto_56550 ) ( SURFACE-AT ?auto_56546 ?auto_56550 ) ( CLEAR ?auto_56546 ) ( IS-CRATE ?auto_56547 ) ( not ( = ?auto_56546 ?auto_56547 ) ) ( TRUCK-AT ?auto_56548 ?auto_56550 ) ( AVAILABLE ?auto_56549 ) ( IN ?auto_56547 ?auto_56548 ) ( ON ?auto_56546 ?auto_56542 ) ( not ( = ?auto_56542 ?auto_56546 ) ) ( not ( = ?auto_56542 ?auto_56547 ) ) ( ON ?auto_56544 ?auto_56543 ) ( ON ?auto_56545 ?auto_56544 ) ( ON ?auto_56542 ?auto_56545 ) ( not ( = ?auto_56543 ?auto_56544 ) ) ( not ( = ?auto_56543 ?auto_56545 ) ) ( not ( = ?auto_56543 ?auto_56542 ) ) ( not ( = ?auto_56543 ?auto_56546 ) ) ( not ( = ?auto_56543 ?auto_56547 ) ) ( not ( = ?auto_56544 ?auto_56545 ) ) ( not ( = ?auto_56544 ?auto_56542 ) ) ( not ( = ?auto_56544 ?auto_56546 ) ) ( not ( = ?auto_56544 ?auto_56547 ) ) ( not ( = ?auto_56545 ?auto_56542 ) ) ( not ( = ?auto_56545 ?auto_56546 ) ) ( not ( = ?auto_56545 ?auto_56547 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56542 ?auto_56546 ?auto_56547 )
      ( MAKE-5CRATE-VERIFY ?auto_56543 ?auto_56544 ?auto_56545 ?auto_56542 ?auto_56546 ?auto_56547 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56583 - SURFACE
      ?auto_56584 - SURFACE
      ?auto_56585 - SURFACE
      ?auto_56582 - SURFACE
      ?auto_56586 - SURFACE
      ?auto_56587 - SURFACE
    )
    :vars
    (
      ?auto_56588 - HOIST
      ?auto_56591 - PLACE
      ?auto_56590 - TRUCK
      ?auto_56589 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56588 ?auto_56591 ) ( SURFACE-AT ?auto_56586 ?auto_56591 ) ( CLEAR ?auto_56586 ) ( IS-CRATE ?auto_56587 ) ( not ( = ?auto_56586 ?auto_56587 ) ) ( AVAILABLE ?auto_56588 ) ( IN ?auto_56587 ?auto_56590 ) ( ON ?auto_56586 ?auto_56582 ) ( not ( = ?auto_56582 ?auto_56586 ) ) ( not ( = ?auto_56582 ?auto_56587 ) ) ( TRUCK-AT ?auto_56590 ?auto_56589 ) ( not ( = ?auto_56589 ?auto_56591 ) ) ( ON ?auto_56584 ?auto_56583 ) ( ON ?auto_56585 ?auto_56584 ) ( ON ?auto_56582 ?auto_56585 ) ( not ( = ?auto_56583 ?auto_56584 ) ) ( not ( = ?auto_56583 ?auto_56585 ) ) ( not ( = ?auto_56583 ?auto_56582 ) ) ( not ( = ?auto_56583 ?auto_56586 ) ) ( not ( = ?auto_56583 ?auto_56587 ) ) ( not ( = ?auto_56584 ?auto_56585 ) ) ( not ( = ?auto_56584 ?auto_56582 ) ) ( not ( = ?auto_56584 ?auto_56586 ) ) ( not ( = ?auto_56584 ?auto_56587 ) ) ( not ( = ?auto_56585 ?auto_56582 ) ) ( not ( = ?auto_56585 ?auto_56586 ) ) ( not ( = ?auto_56585 ?auto_56587 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56582 ?auto_56586 ?auto_56587 )
      ( MAKE-5CRATE-VERIFY ?auto_56583 ?auto_56584 ?auto_56585 ?auto_56582 ?auto_56586 ?auto_56587 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56628 - SURFACE
      ?auto_56629 - SURFACE
      ?auto_56630 - SURFACE
      ?auto_56627 - SURFACE
      ?auto_56631 - SURFACE
      ?auto_56632 - SURFACE
    )
    :vars
    (
      ?auto_56637 - HOIST
      ?auto_56636 - PLACE
      ?auto_56633 - TRUCK
      ?auto_56635 - PLACE
      ?auto_56634 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_56637 ?auto_56636 ) ( SURFACE-AT ?auto_56631 ?auto_56636 ) ( CLEAR ?auto_56631 ) ( IS-CRATE ?auto_56632 ) ( not ( = ?auto_56631 ?auto_56632 ) ) ( AVAILABLE ?auto_56637 ) ( ON ?auto_56631 ?auto_56627 ) ( not ( = ?auto_56627 ?auto_56631 ) ) ( not ( = ?auto_56627 ?auto_56632 ) ) ( TRUCK-AT ?auto_56633 ?auto_56635 ) ( not ( = ?auto_56635 ?auto_56636 ) ) ( HOIST-AT ?auto_56634 ?auto_56635 ) ( LIFTING ?auto_56634 ?auto_56632 ) ( not ( = ?auto_56637 ?auto_56634 ) ) ( ON ?auto_56629 ?auto_56628 ) ( ON ?auto_56630 ?auto_56629 ) ( ON ?auto_56627 ?auto_56630 ) ( not ( = ?auto_56628 ?auto_56629 ) ) ( not ( = ?auto_56628 ?auto_56630 ) ) ( not ( = ?auto_56628 ?auto_56627 ) ) ( not ( = ?auto_56628 ?auto_56631 ) ) ( not ( = ?auto_56628 ?auto_56632 ) ) ( not ( = ?auto_56629 ?auto_56630 ) ) ( not ( = ?auto_56629 ?auto_56627 ) ) ( not ( = ?auto_56629 ?auto_56631 ) ) ( not ( = ?auto_56629 ?auto_56632 ) ) ( not ( = ?auto_56630 ?auto_56627 ) ) ( not ( = ?auto_56630 ?auto_56631 ) ) ( not ( = ?auto_56630 ?auto_56632 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56627 ?auto_56631 ?auto_56632 )
      ( MAKE-5CRATE-VERIFY ?auto_56628 ?auto_56629 ?auto_56630 ?auto_56627 ?auto_56631 ?auto_56632 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56678 - SURFACE
      ?auto_56679 - SURFACE
      ?auto_56680 - SURFACE
      ?auto_56677 - SURFACE
      ?auto_56681 - SURFACE
      ?auto_56682 - SURFACE
    )
    :vars
    (
      ?auto_56687 - HOIST
      ?auto_56683 - PLACE
      ?auto_56688 - TRUCK
      ?auto_56684 - PLACE
      ?auto_56686 - HOIST
      ?auto_56685 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56687 ?auto_56683 ) ( SURFACE-AT ?auto_56681 ?auto_56683 ) ( CLEAR ?auto_56681 ) ( IS-CRATE ?auto_56682 ) ( not ( = ?auto_56681 ?auto_56682 ) ) ( AVAILABLE ?auto_56687 ) ( ON ?auto_56681 ?auto_56677 ) ( not ( = ?auto_56677 ?auto_56681 ) ) ( not ( = ?auto_56677 ?auto_56682 ) ) ( TRUCK-AT ?auto_56688 ?auto_56684 ) ( not ( = ?auto_56684 ?auto_56683 ) ) ( HOIST-AT ?auto_56686 ?auto_56684 ) ( not ( = ?auto_56687 ?auto_56686 ) ) ( AVAILABLE ?auto_56686 ) ( SURFACE-AT ?auto_56682 ?auto_56684 ) ( ON ?auto_56682 ?auto_56685 ) ( CLEAR ?auto_56682 ) ( not ( = ?auto_56681 ?auto_56685 ) ) ( not ( = ?auto_56682 ?auto_56685 ) ) ( not ( = ?auto_56677 ?auto_56685 ) ) ( ON ?auto_56679 ?auto_56678 ) ( ON ?auto_56680 ?auto_56679 ) ( ON ?auto_56677 ?auto_56680 ) ( not ( = ?auto_56678 ?auto_56679 ) ) ( not ( = ?auto_56678 ?auto_56680 ) ) ( not ( = ?auto_56678 ?auto_56677 ) ) ( not ( = ?auto_56678 ?auto_56681 ) ) ( not ( = ?auto_56678 ?auto_56682 ) ) ( not ( = ?auto_56678 ?auto_56685 ) ) ( not ( = ?auto_56679 ?auto_56680 ) ) ( not ( = ?auto_56679 ?auto_56677 ) ) ( not ( = ?auto_56679 ?auto_56681 ) ) ( not ( = ?auto_56679 ?auto_56682 ) ) ( not ( = ?auto_56679 ?auto_56685 ) ) ( not ( = ?auto_56680 ?auto_56677 ) ) ( not ( = ?auto_56680 ?auto_56681 ) ) ( not ( = ?auto_56680 ?auto_56682 ) ) ( not ( = ?auto_56680 ?auto_56685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56677 ?auto_56681 ?auto_56682 )
      ( MAKE-5CRATE-VERIFY ?auto_56678 ?auto_56679 ?auto_56680 ?auto_56677 ?auto_56681 ?auto_56682 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56729 - SURFACE
      ?auto_56730 - SURFACE
      ?auto_56731 - SURFACE
      ?auto_56728 - SURFACE
      ?auto_56732 - SURFACE
      ?auto_56733 - SURFACE
    )
    :vars
    (
      ?auto_56736 - HOIST
      ?auto_56735 - PLACE
      ?auto_56737 - PLACE
      ?auto_56738 - HOIST
      ?auto_56734 - SURFACE
      ?auto_56739 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56736 ?auto_56735 ) ( SURFACE-AT ?auto_56732 ?auto_56735 ) ( CLEAR ?auto_56732 ) ( IS-CRATE ?auto_56733 ) ( not ( = ?auto_56732 ?auto_56733 ) ) ( AVAILABLE ?auto_56736 ) ( ON ?auto_56732 ?auto_56728 ) ( not ( = ?auto_56728 ?auto_56732 ) ) ( not ( = ?auto_56728 ?auto_56733 ) ) ( not ( = ?auto_56737 ?auto_56735 ) ) ( HOIST-AT ?auto_56738 ?auto_56737 ) ( not ( = ?auto_56736 ?auto_56738 ) ) ( AVAILABLE ?auto_56738 ) ( SURFACE-AT ?auto_56733 ?auto_56737 ) ( ON ?auto_56733 ?auto_56734 ) ( CLEAR ?auto_56733 ) ( not ( = ?auto_56732 ?auto_56734 ) ) ( not ( = ?auto_56733 ?auto_56734 ) ) ( not ( = ?auto_56728 ?auto_56734 ) ) ( TRUCK-AT ?auto_56739 ?auto_56735 ) ( ON ?auto_56730 ?auto_56729 ) ( ON ?auto_56731 ?auto_56730 ) ( ON ?auto_56728 ?auto_56731 ) ( not ( = ?auto_56729 ?auto_56730 ) ) ( not ( = ?auto_56729 ?auto_56731 ) ) ( not ( = ?auto_56729 ?auto_56728 ) ) ( not ( = ?auto_56729 ?auto_56732 ) ) ( not ( = ?auto_56729 ?auto_56733 ) ) ( not ( = ?auto_56729 ?auto_56734 ) ) ( not ( = ?auto_56730 ?auto_56731 ) ) ( not ( = ?auto_56730 ?auto_56728 ) ) ( not ( = ?auto_56730 ?auto_56732 ) ) ( not ( = ?auto_56730 ?auto_56733 ) ) ( not ( = ?auto_56730 ?auto_56734 ) ) ( not ( = ?auto_56731 ?auto_56728 ) ) ( not ( = ?auto_56731 ?auto_56732 ) ) ( not ( = ?auto_56731 ?auto_56733 ) ) ( not ( = ?auto_56731 ?auto_56734 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56728 ?auto_56732 ?auto_56733 )
      ( MAKE-5CRATE-VERIFY ?auto_56729 ?auto_56730 ?auto_56731 ?auto_56728 ?auto_56732 ?auto_56733 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56780 - SURFACE
      ?auto_56781 - SURFACE
      ?auto_56782 - SURFACE
      ?auto_56779 - SURFACE
      ?auto_56783 - SURFACE
      ?auto_56784 - SURFACE
    )
    :vars
    (
      ?auto_56790 - HOIST
      ?auto_56786 - PLACE
      ?auto_56785 - PLACE
      ?auto_56789 - HOIST
      ?auto_56788 - SURFACE
      ?auto_56787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56790 ?auto_56786 ) ( IS-CRATE ?auto_56784 ) ( not ( = ?auto_56783 ?auto_56784 ) ) ( not ( = ?auto_56779 ?auto_56783 ) ) ( not ( = ?auto_56779 ?auto_56784 ) ) ( not ( = ?auto_56785 ?auto_56786 ) ) ( HOIST-AT ?auto_56789 ?auto_56785 ) ( not ( = ?auto_56790 ?auto_56789 ) ) ( AVAILABLE ?auto_56789 ) ( SURFACE-AT ?auto_56784 ?auto_56785 ) ( ON ?auto_56784 ?auto_56788 ) ( CLEAR ?auto_56784 ) ( not ( = ?auto_56783 ?auto_56788 ) ) ( not ( = ?auto_56784 ?auto_56788 ) ) ( not ( = ?auto_56779 ?auto_56788 ) ) ( TRUCK-AT ?auto_56787 ?auto_56786 ) ( SURFACE-AT ?auto_56779 ?auto_56786 ) ( CLEAR ?auto_56779 ) ( LIFTING ?auto_56790 ?auto_56783 ) ( IS-CRATE ?auto_56783 ) ( ON ?auto_56781 ?auto_56780 ) ( ON ?auto_56782 ?auto_56781 ) ( ON ?auto_56779 ?auto_56782 ) ( not ( = ?auto_56780 ?auto_56781 ) ) ( not ( = ?auto_56780 ?auto_56782 ) ) ( not ( = ?auto_56780 ?auto_56779 ) ) ( not ( = ?auto_56780 ?auto_56783 ) ) ( not ( = ?auto_56780 ?auto_56784 ) ) ( not ( = ?auto_56780 ?auto_56788 ) ) ( not ( = ?auto_56781 ?auto_56782 ) ) ( not ( = ?auto_56781 ?auto_56779 ) ) ( not ( = ?auto_56781 ?auto_56783 ) ) ( not ( = ?auto_56781 ?auto_56784 ) ) ( not ( = ?auto_56781 ?auto_56788 ) ) ( not ( = ?auto_56782 ?auto_56779 ) ) ( not ( = ?auto_56782 ?auto_56783 ) ) ( not ( = ?auto_56782 ?auto_56784 ) ) ( not ( = ?auto_56782 ?auto_56788 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56779 ?auto_56783 ?auto_56784 )
      ( MAKE-5CRATE-VERIFY ?auto_56780 ?auto_56781 ?auto_56782 ?auto_56779 ?auto_56783 ?auto_56784 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56831 - SURFACE
      ?auto_56832 - SURFACE
      ?auto_56833 - SURFACE
      ?auto_56830 - SURFACE
      ?auto_56834 - SURFACE
      ?auto_56835 - SURFACE
    )
    :vars
    (
      ?auto_56836 - HOIST
      ?auto_56841 - PLACE
      ?auto_56839 - PLACE
      ?auto_56838 - HOIST
      ?auto_56837 - SURFACE
      ?auto_56840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56836 ?auto_56841 ) ( IS-CRATE ?auto_56835 ) ( not ( = ?auto_56834 ?auto_56835 ) ) ( not ( = ?auto_56830 ?auto_56834 ) ) ( not ( = ?auto_56830 ?auto_56835 ) ) ( not ( = ?auto_56839 ?auto_56841 ) ) ( HOIST-AT ?auto_56838 ?auto_56839 ) ( not ( = ?auto_56836 ?auto_56838 ) ) ( AVAILABLE ?auto_56838 ) ( SURFACE-AT ?auto_56835 ?auto_56839 ) ( ON ?auto_56835 ?auto_56837 ) ( CLEAR ?auto_56835 ) ( not ( = ?auto_56834 ?auto_56837 ) ) ( not ( = ?auto_56835 ?auto_56837 ) ) ( not ( = ?auto_56830 ?auto_56837 ) ) ( TRUCK-AT ?auto_56840 ?auto_56841 ) ( SURFACE-AT ?auto_56830 ?auto_56841 ) ( CLEAR ?auto_56830 ) ( IS-CRATE ?auto_56834 ) ( AVAILABLE ?auto_56836 ) ( IN ?auto_56834 ?auto_56840 ) ( ON ?auto_56832 ?auto_56831 ) ( ON ?auto_56833 ?auto_56832 ) ( ON ?auto_56830 ?auto_56833 ) ( not ( = ?auto_56831 ?auto_56832 ) ) ( not ( = ?auto_56831 ?auto_56833 ) ) ( not ( = ?auto_56831 ?auto_56830 ) ) ( not ( = ?auto_56831 ?auto_56834 ) ) ( not ( = ?auto_56831 ?auto_56835 ) ) ( not ( = ?auto_56831 ?auto_56837 ) ) ( not ( = ?auto_56832 ?auto_56833 ) ) ( not ( = ?auto_56832 ?auto_56830 ) ) ( not ( = ?auto_56832 ?auto_56834 ) ) ( not ( = ?auto_56832 ?auto_56835 ) ) ( not ( = ?auto_56832 ?auto_56837 ) ) ( not ( = ?auto_56833 ?auto_56830 ) ) ( not ( = ?auto_56833 ?auto_56834 ) ) ( not ( = ?auto_56833 ?auto_56835 ) ) ( not ( = ?auto_56833 ?auto_56837 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56830 ?auto_56834 ?auto_56835 )
      ( MAKE-5CRATE-VERIFY ?auto_56831 ?auto_56832 ?auto_56833 ?auto_56830 ?auto_56834 ?auto_56835 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_56842 - SURFACE
      ?auto_56843 - SURFACE
    )
    :vars
    (
      ?auto_56844 - HOIST
      ?auto_56849 - PLACE
      ?auto_56850 - SURFACE
      ?auto_56847 - PLACE
      ?auto_56846 - HOIST
      ?auto_56845 - SURFACE
      ?auto_56848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56844 ?auto_56849 ) ( IS-CRATE ?auto_56843 ) ( not ( = ?auto_56842 ?auto_56843 ) ) ( not ( = ?auto_56850 ?auto_56842 ) ) ( not ( = ?auto_56850 ?auto_56843 ) ) ( not ( = ?auto_56847 ?auto_56849 ) ) ( HOIST-AT ?auto_56846 ?auto_56847 ) ( not ( = ?auto_56844 ?auto_56846 ) ) ( AVAILABLE ?auto_56846 ) ( SURFACE-AT ?auto_56843 ?auto_56847 ) ( ON ?auto_56843 ?auto_56845 ) ( CLEAR ?auto_56843 ) ( not ( = ?auto_56842 ?auto_56845 ) ) ( not ( = ?auto_56843 ?auto_56845 ) ) ( not ( = ?auto_56850 ?auto_56845 ) ) ( SURFACE-AT ?auto_56850 ?auto_56849 ) ( CLEAR ?auto_56850 ) ( IS-CRATE ?auto_56842 ) ( AVAILABLE ?auto_56844 ) ( IN ?auto_56842 ?auto_56848 ) ( TRUCK-AT ?auto_56848 ?auto_56847 ) )
    :subtasks
    ( ( !DRIVE ?auto_56848 ?auto_56847 ?auto_56849 )
      ( MAKE-2CRATE ?auto_56850 ?auto_56842 ?auto_56843 )
      ( MAKE-1CRATE-VERIFY ?auto_56842 ?auto_56843 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_56851 - SURFACE
      ?auto_56852 - SURFACE
      ?auto_56853 - SURFACE
    )
    :vars
    (
      ?auto_56859 - HOIST
      ?auto_56858 - PLACE
      ?auto_56856 - PLACE
      ?auto_56857 - HOIST
      ?auto_56855 - SURFACE
      ?auto_56854 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56859 ?auto_56858 ) ( IS-CRATE ?auto_56853 ) ( not ( = ?auto_56852 ?auto_56853 ) ) ( not ( = ?auto_56851 ?auto_56852 ) ) ( not ( = ?auto_56851 ?auto_56853 ) ) ( not ( = ?auto_56856 ?auto_56858 ) ) ( HOIST-AT ?auto_56857 ?auto_56856 ) ( not ( = ?auto_56859 ?auto_56857 ) ) ( AVAILABLE ?auto_56857 ) ( SURFACE-AT ?auto_56853 ?auto_56856 ) ( ON ?auto_56853 ?auto_56855 ) ( CLEAR ?auto_56853 ) ( not ( = ?auto_56852 ?auto_56855 ) ) ( not ( = ?auto_56853 ?auto_56855 ) ) ( not ( = ?auto_56851 ?auto_56855 ) ) ( SURFACE-AT ?auto_56851 ?auto_56858 ) ( CLEAR ?auto_56851 ) ( IS-CRATE ?auto_56852 ) ( AVAILABLE ?auto_56859 ) ( IN ?auto_56852 ?auto_56854 ) ( TRUCK-AT ?auto_56854 ?auto_56856 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_56852 ?auto_56853 )
      ( MAKE-2CRATE-VERIFY ?auto_56851 ?auto_56852 ?auto_56853 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_56861 - SURFACE
      ?auto_56862 - SURFACE
      ?auto_56863 - SURFACE
      ?auto_56860 - SURFACE
    )
    :vars
    (
      ?auto_56865 - HOIST
      ?auto_56866 - PLACE
      ?auto_56869 - PLACE
      ?auto_56867 - HOIST
      ?auto_56868 - SURFACE
      ?auto_56864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56865 ?auto_56866 ) ( IS-CRATE ?auto_56860 ) ( not ( = ?auto_56863 ?auto_56860 ) ) ( not ( = ?auto_56862 ?auto_56863 ) ) ( not ( = ?auto_56862 ?auto_56860 ) ) ( not ( = ?auto_56869 ?auto_56866 ) ) ( HOIST-AT ?auto_56867 ?auto_56869 ) ( not ( = ?auto_56865 ?auto_56867 ) ) ( AVAILABLE ?auto_56867 ) ( SURFACE-AT ?auto_56860 ?auto_56869 ) ( ON ?auto_56860 ?auto_56868 ) ( CLEAR ?auto_56860 ) ( not ( = ?auto_56863 ?auto_56868 ) ) ( not ( = ?auto_56860 ?auto_56868 ) ) ( not ( = ?auto_56862 ?auto_56868 ) ) ( SURFACE-AT ?auto_56862 ?auto_56866 ) ( CLEAR ?auto_56862 ) ( IS-CRATE ?auto_56863 ) ( AVAILABLE ?auto_56865 ) ( IN ?auto_56863 ?auto_56864 ) ( TRUCK-AT ?auto_56864 ?auto_56869 ) ( ON ?auto_56862 ?auto_56861 ) ( not ( = ?auto_56861 ?auto_56862 ) ) ( not ( = ?auto_56861 ?auto_56863 ) ) ( not ( = ?auto_56861 ?auto_56860 ) ) ( not ( = ?auto_56861 ?auto_56868 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56862 ?auto_56863 ?auto_56860 )
      ( MAKE-3CRATE-VERIFY ?auto_56861 ?auto_56862 ?auto_56863 ?auto_56860 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_56871 - SURFACE
      ?auto_56872 - SURFACE
      ?auto_56873 - SURFACE
      ?auto_56870 - SURFACE
      ?auto_56874 - SURFACE
    )
    :vars
    (
      ?auto_56876 - HOIST
      ?auto_56877 - PLACE
      ?auto_56880 - PLACE
      ?auto_56878 - HOIST
      ?auto_56879 - SURFACE
      ?auto_56875 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56876 ?auto_56877 ) ( IS-CRATE ?auto_56874 ) ( not ( = ?auto_56870 ?auto_56874 ) ) ( not ( = ?auto_56873 ?auto_56870 ) ) ( not ( = ?auto_56873 ?auto_56874 ) ) ( not ( = ?auto_56880 ?auto_56877 ) ) ( HOIST-AT ?auto_56878 ?auto_56880 ) ( not ( = ?auto_56876 ?auto_56878 ) ) ( AVAILABLE ?auto_56878 ) ( SURFACE-AT ?auto_56874 ?auto_56880 ) ( ON ?auto_56874 ?auto_56879 ) ( CLEAR ?auto_56874 ) ( not ( = ?auto_56870 ?auto_56879 ) ) ( not ( = ?auto_56874 ?auto_56879 ) ) ( not ( = ?auto_56873 ?auto_56879 ) ) ( SURFACE-AT ?auto_56873 ?auto_56877 ) ( CLEAR ?auto_56873 ) ( IS-CRATE ?auto_56870 ) ( AVAILABLE ?auto_56876 ) ( IN ?auto_56870 ?auto_56875 ) ( TRUCK-AT ?auto_56875 ?auto_56880 ) ( ON ?auto_56872 ?auto_56871 ) ( ON ?auto_56873 ?auto_56872 ) ( not ( = ?auto_56871 ?auto_56872 ) ) ( not ( = ?auto_56871 ?auto_56873 ) ) ( not ( = ?auto_56871 ?auto_56870 ) ) ( not ( = ?auto_56871 ?auto_56874 ) ) ( not ( = ?auto_56871 ?auto_56879 ) ) ( not ( = ?auto_56872 ?auto_56873 ) ) ( not ( = ?auto_56872 ?auto_56870 ) ) ( not ( = ?auto_56872 ?auto_56874 ) ) ( not ( = ?auto_56872 ?auto_56879 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56873 ?auto_56870 ?auto_56874 )
      ( MAKE-4CRATE-VERIFY ?auto_56871 ?auto_56872 ?auto_56873 ?auto_56870 ?auto_56874 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56882 - SURFACE
      ?auto_56883 - SURFACE
      ?auto_56884 - SURFACE
      ?auto_56881 - SURFACE
      ?auto_56885 - SURFACE
      ?auto_56886 - SURFACE
    )
    :vars
    (
      ?auto_56888 - HOIST
      ?auto_56889 - PLACE
      ?auto_56892 - PLACE
      ?auto_56890 - HOIST
      ?auto_56891 - SURFACE
      ?auto_56887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56888 ?auto_56889 ) ( IS-CRATE ?auto_56886 ) ( not ( = ?auto_56885 ?auto_56886 ) ) ( not ( = ?auto_56881 ?auto_56885 ) ) ( not ( = ?auto_56881 ?auto_56886 ) ) ( not ( = ?auto_56892 ?auto_56889 ) ) ( HOIST-AT ?auto_56890 ?auto_56892 ) ( not ( = ?auto_56888 ?auto_56890 ) ) ( AVAILABLE ?auto_56890 ) ( SURFACE-AT ?auto_56886 ?auto_56892 ) ( ON ?auto_56886 ?auto_56891 ) ( CLEAR ?auto_56886 ) ( not ( = ?auto_56885 ?auto_56891 ) ) ( not ( = ?auto_56886 ?auto_56891 ) ) ( not ( = ?auto_56881 ?auto_56891 ) ) ( SURFACE-AT ?auto_56881 ?auto_56889 ) ( CLEAR ?auto_56881 ) ( IS-CRATE ?auto_56885 ) ( AVAILABLE ?auto_56888 ) ( IN ?auto_56885 ?auto_56887 ) ( TRUCK-AT ?auto_56887 ?auto_56892 ) ( ON ?auto_56883 ?auto_56882 ) ( ON ?auto_56884 ?auto_56883 ) ( ON ?auto_56881 ?auto_56884 ) ( not ( = ?auto_56882 ?auto_56883 ) ) ( not ( = ?auto_56882 ?auto_56884 ) ) ( not ( = ?auto_56882 ?auto_56881 ) ) ( not ( = ?auto_56882 ?auto_56885 ) ) ( not ( = ?auto_56882 ?auto_56886 ) ) ( not ( = ?auto_56882 ?auto_56891 ) ) ( not ( = ?auto_56883 ?auto_56884 ) ) ( not ( = ?auto_56883 ?auto_56881 ) ) ( not ( = ?auto_56883 ?auto_56885 ) ) ( not ( = ?auto_56883 ?auto_56886 ) ) ( not ( = ?auto_56883 ?auto_56891 ) ) ( not ( = ?auto_56884 ?auto_56881 ) ) ( not ( = ?auto_56884 ?auto_56885 ) ) ( not ( = ?auto_56884 ?auto_56886 ) ) ( not ( = ?auto_56884 ?auto_56891 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56881 ?auto_56885 ?auto_56886 )
      ( MAKE-5CRATE-VERIFY ?auto_56882 ?auto_56883 ?auto_56884 ?auto_56881 ?auto_56885 ?auto_56886 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_56893 - SURFACE
      ?auto_56894 - SURFACE
    )
    :vars
    (
      ?auto_56896 - HOIST
      ?auto_56897 - PLACE
      ?auto_56898 - SURFACE
      ?auto_56901 - PLACE
      ?auto_56899 - HOIST
      ?auto_56900 - SURFACE
      ?auto_56895 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56896 ?auto_56897 ) ( IS-CRATE ?auto_56894 ) ( not ( = ?auto_56893 ?auto_56894 ) ) ( not ( = ?auto_56898 ?auto_56893 ) ) ( not ( = ?auto_56898 ?auto_56894 ) ) ( not ( = ?auto_56901 ?auto_56897 ) ) ( HOIST-AT ?auto_56899 ?auto_56901 ) ( not ( = ?auto_56896 ?auto_56899 ) ) ( SURFACE-AT ?auto_56894 ?auto_56901 ) ( ON ?auto_56894 ?auto_56900 ) ( CLEAR ?auto_56894 ) ( not ( = ?auto_56893 ?auto_56900 ) ) ( not ( = ?auto_56894 ?auto_56900 ) ) ( not ( = ?auto_56898 ?auto_56900 ) ) ( SURFACE-AT ?auto_56898 ?auto_56897 ) ( CLEAR ?auto_56898 ) ( IS-CRATE ?auto_56893 ) ( AVAILABLE ?auto_56896 ) ( TRUCK-AT ?auto_56895 ?auto_56901 ) ( LIFTING ?auto_56899 ?auto_56893 ) )
    :subtasks
    ( ( !LOAD ?auto_56899 ?auto_56893 ?auto_56895 ?auto_56901 )
      ( MAKE-2CRATE ?auto_56898 ?auto_56893 ?auto_56894 )
      ( MAKE-1CRATE-VERIFY ?auto_56893 ?auto_56894 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_56902 - SURFACE
      ?auto_56903 - SURFACE
      ?auto_56904 - SURFACE
    )
    :vars
    (
      ?auto_56907 - HOIST
      ?auto_56910 - PLACE
      ?auto_56908 - PLACE
      ?auto_56906 - HOIST
      ?auto_56905 - SURFACE
      ?auto_56909 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56907 ?auto_56910 ) ( IS-CRATE ?auto_56904 ) ( not ( = ?auto_56903 ?auto_56904 ) ) ( not ( = ?auto_56902 ?auto_56903 ) ) ( not ( = ?auto_56902 ?auto_56904 ) ) ( not ( = ?auto_56908 ?auto_56910 ) ) ( HOIST-AT ?auto_56906 ?auto_56908 ) ( not ( = ?auto_56907 ?auto_56906 ) ) ( SURFACE-AT ?auto_56904 ?auto_56908 ) ( ON ?auto_56904 ?auto_56905 ) ( CLEAR ?auto_56904 ) ( not ( = ?auto_56903 ?auto_56905 ) ) ( not ( = ?auto_56904 ?auto_56905 ) ) ( not ( = ?auto_56902 ?auto_56905 ) ) ( SURFACE-AT ?auto_56902 ?auto_56910 ) ( CLEAR ?auto_56902 ) ( IS-CRATE ?auto_56903 ) ( AVAILABLE ?auto_56907 ) ( TRUCK-AT ?auto_56909 ?auto_56908 ) ( LIFTING ?auto_56906 ?auto_56903 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_56903 ?auto_56904 )
      ( MAKE-2CRATE-VERIFY ?auto_56902 ?auto_56903 ?auto_56904 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_56912 - SURFACE
      ?auto_56913 - SURFACE
      ?auto_56914 - SURFACE
      ?auto_56911 - SURFACE
    )
    :vars
    (
      ?auto_56918 - HOIST
      ?auto_56916 - PLACE
      ?auto_56920 - PLACE
      ?auto_56919 - HOIST
      ?auto_56917 - SURFACE
      ?auto_56915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56918 ?auto_56916 ) ( IS-CRATE ?auto_56911 ) ( not ( = ?auto_56914 ?auto_56911 ) ) ( not ( = ?auto_56913 ?auto_56914 ) ) ( not ( = ?auto_56913 ?auto_56911 ) ) ( not ( = ?auto_56920 ?auto_56916 ) ) ( HOIST-AT ?auto_56919 ?auto_56920 ) ( not ( = ?auto_56918 ?auto_56919 ) ) ( SURFACE-AT ?auto_56911 ?auto_56920 ) ( ON ?auto_56911 ?auto_56917 ) ( CLEAR ?auto_56911 ) ( not ( = ?auto_56914 ?auto_56917 ) ) ( not ( = ?auto_56911 ?auto_56917 ) ) ( not ( = ?auto_56913 ?auto_56917 ) ) ( SURFACE-AT ?auto_56913 ?auto_56916 ) ( CLEAR ?auto_56913 ) ( IS-CRATE ?auto_56914 ) ( AVAILABLE ?auto_56918 ) ( TRUCK-AT ?auto_56915 ?auto_56920 ) ( LIFTING ?auto_56919 ?auto_56914 ) ( ON ?auto_56913 ?auto_56912 ) ( not ( = ?auto_56912 ?auto_56913 ) ) ( not ( = ?auto_56912 ?auto_56914 ) ) ( not ( = ?auto_56912 ?auto_56911 ) ) ( not ( = ?auto_56912 ?auto_56917 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56913 ?auto_56914 ?auto_56911 )
      ( MAKE-3CRATE-VERIFY ?auto_56912 ?auto_56913 ?auto_56914 ?auto_56911 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_56922 - SURFACE
      ?auto_56923 - SURFACE
      ?auto_56924 - SURFACE
      ?auto_56921 - SURFACE
      ?auto_56925 - SURFACE
    )
    :vars
    (
      ?auto_56929 - HOIST
      ?auto_56927 - PLACE
      ?auto_56931 - PLACE
      ?auto_56930 - HOIST
      ?auto_56928 - SURFACE
      ?auto_56926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56929 ?auto_56927 ) ( IS-CRATE ?auto_56925 ) ( not ( = ?auto_56921 ?auto_56925 ) ) ( not ( = ?auto_56924 ?auto_56921 ) ) ( not ( = ?auto_56924 ?auto_56925 ) ) ( not ( = ?auto_56931 ?auto_56927 ) ) ( HOIST-AT ?auto_56930 ?auto_56931 ) ( not ( = ?auto_56929 ?auto_56930 ) ) ( SURFACE-AT ?auto_56925 ?auto_56931 ) ( ON ?auto_56925 ?auto_56928 ) ( CLEAR ?auto_56925 ) ( not ( = ?auto_56921 ?auto_56928 ) ) ( not ( = ?auto_56925 ?auto_56928 ) ) ( not ( = ?auto_56924 ?auto_56928 ) ) ( SURFACE-AT ?auto_56924 ?auto_56927 ) ( CLEAR ?auto_56924 ) ( IS-CRATE ?auto_56921 ) ( AVAILABLE ?auto_56929 ) ( TRUCK-AT ?auto_56926 ?auto_56931 ) ( LIFTING ?auto_56930 ?auto_56921 ) ( ON ?auto_56923 ?auto_56922 ) ( ON ?auto_56924 ?auto_56923 ) ( not ( = ?auto_56922 ?auto_56923 ) ) ( not ( = ?auto_56922 ?auto_56924 ) ) ( not ( = ?auto_56922 ?auto_56921 ) ) ( not ( = ?auto_56922 ?auto_56925 ) ) ( not ( = ?auto_56922 ?auto_56928 ) ) ( not ( = ?auto_56923 ?auto_56924 ) ) ( not ( = ?auto_56923 ?auto_56921 ) ) ( not ( = ?auto_56923 ?auto_56925 ) ) ( not ( = ?auto_56923 ?auto_56928 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56924 ?auto_56921 ?auto_56925 )
      ( MAKE-4CRATE-VERIFY ?auto_56922 ?auto_56923 ?auto_56924 ?auto_56921 ?auto_56925 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56933 - SURFACE
      ?auto_56934 - SURFACE
      ?auto_56935 - SURFACE
      ?auto_56932 - SURFACE
      ?auto_56936 - SURFACE
      ?auto_56937 - SURFACE
    )
    :vars
    (
      ?auto_56941 - HOIST
      ?auto_56939 - PLACE
      ?auto_56943 - PLACE
      ?auto_56942 - HOIST
      ?auto_56940 - SURFACE
      ?auto_56938 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56941 ?auto_56939 ) ( IS-CRATE ?auto_56937 ) ( not ( = ?auto_56936 ?auto_56937 ) ) ( not ( = ?auto_56932 ?auto_56936 ) ) ( not ( = ?auto_56932 ?auto_56937 ) ) ( not ( = ?auto_56943 ?auto_56939 ) ) ( HOIST-AT ?auto_56942 ?auto_56943 ) ( not ( = ?auto_56941 ?auto_56942 ) ) ( SURFACE-AT ?auto_56937 ?auto_56943 ) ( ON ?auto_56937 ?auto_56940 ) ( CLEAR ?auto_56937 ) ( not ( = ?auto_56936 ?auto_56940 ) ) ( not ( = ?auto_56937 ?auto_56940 ) ) ( not ( = ?auto_56932 ?auto_56940 ) ) ( SURFACE-AT ?auto_56932 ?auto_56939 ) ( CLEAR ?auto_56932 ) ( IS-CRATE ?auto_56936 ) ( AVAILABLE ?auto_56941 ) ( TRUCK-AT ?auto_56938 ?auto_56943 ) ( LIFTING ?auto_56942 ?auto_56936 ) ( ON ?auto_56934 ?auto_56933 ) ( ON ?auto_56935 ?auto_56934 ) ( ON ?auto_56932 ?auto_56935 ) ( not ( = ?auto_56933 ?auto_56934 ) ) ( not ( = ?auto_56933 ?auto_56935 ) ) ( not ( = ?auto_56933 ?auto_56932 ) ) ( not ( = ?auto_56933 ?auto_56936 ) ) ( not ( = ?auto_56933 ?auto_56937 ) ) ( not ( = ?auto_56933 ?auto_56940 ) ) ( not ( = ?auto_56934 ?auto_56935 ) ) ( not ( = ?auto_56934 ?auto_56932 ) ) ( not ( = ?auto_56934 ?auto_56936 ) ) ( not ( = ?auto_56934 ?auto_56937 ) ) ( not ( = ?auto_56934 ?auto_56940 ) ) ( not ( = ?auto_56935 ?auto_56932 ) ) ( not ( = ?auto_56935 ?auto_56936 ) ) ( not ( = ?auto_56935 ?auto_56937 ) ) ( not ( = ?auto_56935 ?auto_56940 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56932 ?auto_56936 ?auto_56937 )
      ( MAKE-5CRATE-VERIFY ?auto_56933 ?auto_56934 ?auto_56935 ?auto_56932 ?auto_56936 ?auto_56937 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_56944 - SURFACE
      ?auto_56945 - SURFACE
    )
    :vars
    (
      ?auto_56949 - HOIST
      ?auto_56947 - PLACE
      ?auto_56952 - SURFACE
      ?auto_56951 - PLACE
      ?auto_56950 - HOIST
      ?auto_56948 - SURFACE
      ?auto_56946 - TRUCK
      ?auto_56953 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56949 ?auto_56947 ) ( IS-CRATE ?auto_56945 ) ( not ( = ?auto_56944 ?auto_56945 ) ) ( not ( = ?auto_56952 ?auto_56944 ) ) ( not ( = ?auto_56952 ?auto_56945 ) ) ( not ( = ?auto_56951 ?auto_56947 ) ) ( HOIST-AT ?auto_56950 ?auto_56951 ) ( not ( = ?auto_56949 ?auto_56950 ) ) ( SURFACE-AT ?auto_56945 ?auto_56951 ) ( ON ?auto_56945 ?auto_56948 ) ( CLEAR ?auto_56945 ) ( not ( = ?auto_56944 ?auto_56948 ) ) ( not ( = ?auto_56945 ?auto_56948 ) ) ( not ( = ?auto_56952 ?auto_56948 ) ) ( SURFACE-AT ?auto_56952 ?auto_56947 ) ( CLEAR ?auto_56952 ) ( IS-CRATE ?auto_56944 ) ( AVAILABLE ?auto_56949 ) ( TRUCK-AT ?auto_56946 ?auto_56951 ) ( AVAILABLE ?auto_56950 ) ( SURFACE-AT ?auto_56944 ?auto_56951 ) ( ON ?auto_56944 ?auto_56953 ) ( CLEAR ?auto_56944 ) ( not ( = ?auto_56944 ?auto_56953 ) ) ( not ( = ?auto_56945 ?auto_56953 ) ) ( not ( = ?auto_56952 ?auto_56953 ) ) ( not ( = ?auto_56948 ?auto_56953 ) ) )
    :subtasks
    ( ( !LIFT ?auto_56950 ?auto_56944 ?auto_56953 ?auto_56951 )
      ( MAKE-2CRATE ?auto_56952 ?auto_56944 ?auto_56945 )
      ( MAKE-1CRATE-VERIFY ?auto_56944 ?auto_56945 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_56954 - SURFACE
      ?auto_56955 - SURFACE
      ?auto_56956 - SURFACE
    )
    :vars
    (
      ?auto_56960 - HOIST
      ?auto_56958 - PLACE
      ?auto_56963 - PLACE
      ?auto_56962 - HOIST
      ?auto_56959 - SURFACE
      ?auto_56961 - TRUCK
      ?auto_56957 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56960 ?auto_56958 ) ( IS-CRATE ?auto_56956 ) ( not ( = ?auto_56955 ?auto_56956 ) ) ( not ( = ?auto_56954 ?auto_56955 ) ) ( not ( = ?auto_56954 ?auto_56956 ) ) ( not ( = ?auto_56963 ?auto_56958 ) ) ( HOIST-AT ?auto_56962 ?auto_56963 ) ( not ( = ?auto_56960 ?auto_56962 ) ) ( SURFACE-AT ?auto_56956 ?auto_56963 ) ( ON ?auto_56956 ?auto_56959 ) ( CLEAR ?auto_56956 ) ( not ( = ?auto_56955 ?auto_56959 ) ) ( not ( = ?auto_56956 ?auto_56959 ) ) ( not ( = ?auto_56954 ?auto_56959 ) ) ( SURFACE-AT ?auto_56954 ?auto_56958 ) ( CLEAR ?auto_56954 ) ( IS-CRATE ?auto_56955 ) ( AVAILABLE ?auto_56960 ) ( TRUCK-AT ?auto_56961 ?auto_56963 ) ( AVAILABLE ?auto_56962 ) ( SURFACE-AT ?auto_56955 ?auto_56963 ) ( ON ?auto_56955 ?auto_56957 ) ( CLEAR ?auto_56955 ) ( not ( = ?auto_56955 ?auto_56957 ) ) ( not ( = ?auto_56956 ?auto_56957 ) ) ( not ( = ?auto_56954 ?auto_56957 ) ) ( not ( = ?auto_56959 ?auto_56957 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_56955 ?auto_56956 )
      ( MAKE-2CRATE-VERIFY ?auto_56954 ?auto_56955 ?auto_56956 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_56965 - SURFACE
      ?auto_56966 - SURFACE
      ?auto_56967 - SURFACE
      ?auto_56964 - SURFACE
    )
    :vars
    (
      ?auto_56970 - HOIST
      ?auto_56971 - PLACE
      ?auto_56974 - PLACE
      ?auto_56973 - HOIST
      ?auto_56968 - SURFACE
      ?auto_56969 - TRUCK
      ?auto_56972 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56970 ?auto_56971 ) ( IS-CRATE ?auto_56964 ) ( not ( = ?auto_56967 ?auto_56964 ) ) ( not ( = ?auto_56966 ?auto_56967 ) ) ( not ( = ?auto_56966 ?auto_56964 ) ) ( not ( = ?auto_56974 ?auto_56971 ) ) ( HOIST-AT ?auto_56973 ?auto_56974 ) ( not ( = ?auto_56970 ?auto_56973 ) ) ( SURFACE-AT ?auto_56964 ?auto_56974 ) ( ON ?auto_56964 ?auto_56968 ) ( CLEAR ?auto_56964 ) ( not ( = ?auto_56967 ?auto_56968 ) ) ( not ( = ?auto_56964 ?auto_56968 ) ) ( not ( = ?auto_56966 ?auto_56968 ) ) ( SURFACE-AT ?auto_56966 ?auto_56971 ) ( CLEAR ?auto_56966 ) ( IS-CRATE ?auto_56967 ) ( AVAILABLE ?auto_56970 ) ( TRUCK-AT ?auto_56969 ?auto_56974 ) ( AVAILABLE ?auto_56973 ) ( SURFACE-AT ?auto_56967 ?auto_56974 ) ( ON ?auto_56967 ?auto_56972 ) ( CLEAR ?auto_56967 ) ( not ( = ?auto_56967 ?auto_56972 ) ) ( not ( = ?auto_56964 ?auto_56972 ) ) ( not ( = ?auto_56966 ?auto_56972 ) ) ( not ( = ?auto_56968 ?auto_56972 ) ) ( ON ?auto_56966 ?auto_56965 ) ( not ( = ?auto_56965 ?auto_56966 ) ) ( not ( = ?auto_56965 ?auto_56967 ) ) ( not ( = ?auto_56965 ?auto_56964 ) ) ( not ( = ?auto_56965 ?auto_56968 ) ) ( not ( = ?auto_56965 ?auto_56972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56966 ?auto_56967 ?auto_56964 )
      ( MAKE-3CRATE-VERIFY ?auto_56965 ?auto_56966 ?auto_56967 ?auto_56964 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_56976 - SURFACE
      ?auto_56977 - SURFACE
      ?auto_56978 - SURFACE
      ?auto_56975 - SURFACE
      ?auto_56979 - SURFACE
    )
    :vars
    (
      ?auto_56982 - HOIST
      ?auto_56983 - PLACE
      ?auto_56986 - PLACE
      ?auto_56985 - HOIST
      ?auto_56980 - SURFACE
      ?auto_56981 - TRUCK
      ?auto_56984 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56982 ?auto_56983 ) ( IS-CRATE ?auto_56979 ) ( not ( = ?auto_56975 ?auto_56979 ) ) ( not ( = ?auto_56978 ?auto_56975 ) ) ( not ( = ?auto_56978 ?auto_56979 ) ) ( not ( = ?auto_56986 ?auto_56983 ) ) ( HOIST-AT ?auto_56985 ?auto_56986 ) ( not ( = ?auto_56982 ?auto_56985 ) ) ( SURFACE-AT ?auto_56979 ?auto_56986 ) ( ON ?auto_56979 ?auto_56980 ) ( CLEAR ?auto_56979 ) ( not ( = ?auto_56975 ?auto_56980 ) ) ( not ( = ?auto_56979 ?auto_56980 ) ) ( not ( = ?auto_56978 ?auto_56980 ) ) ( SURFACE-AT ?auto_56978 ?auto_56983 ) ( CLEAR ?auto_56978 ) ( IS-CRATE ?auto_56975 ) ( AVAILABLE ?auto_56982 ) ( TRUCK-AT ?auto_56981 ?auto_56986 ) ( AVAILABLE ?auto_56985 ) ( SURFACE-AT ?auto_56975 ?auto_56986 ) ( ON ?auto_56975 ?auto_56984 ) ( CLEAR ?auto_56975 ) ( not ( = ?auto_56975 ?auto_56984 ) ) ( not ( = ?auto_56979 ?auto_56984 ) ) ( not ( = ?auto_56978 ?auto_56984 ) ) ( not ( = ?auto_56980 ?auto_56984 ) ) ( ON ?auto_56977 ?auto_56976 ) ( ON ?auto_56978 ?auto_56977 ) ( not ( = ?auto_56976 ?auto_56977 ) ) ( not ( = ?auto_56976 ?auto_56978 ) ) ( not ( = ?auto_56976 ?auto_56975 ) ) ( not ( = ?auto_56976 ?auto_56979 ) ) ( not ( = ?auto_56976 ?auto_56980 ) ) ( not ( = ?auto_56976 ?auto_56984 ) ) ( not ( = ?auto_56977 ?auto_56978 ) ) ( not ( = ?auto_56977 ?auto_56975 ) ) ( not ( = ?auto_56977 ?auto_56979 ) ) ( not ( = ?auto_56977 ?auto_56980 ) ) ( not ( = ?auto_56977 ?auto_56984 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56978 ?auto_56975 ?auto_56979 )
      ( MAKE-4CRATE-VERIFY ?auto_56976 ?auto_56977 ?auto_56978 ?auto_56975 ?auto_56979 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56988 - SURFACE
      ?auto_56989 - SURFACE
      ?auto_56990 - SURFACE
      ?auto_56987 - SURFACE
      ?auto_56991 - SURFACE
      ?auto_56992 - SURFACE
    )
    :vars
    (
      ?auto_56995 - HOIST
      ?auto_56996 - PLACE
      ?auto_56999 - PLACE
      ?auto_56998 - HOIST
      ?auto_56993 - SURFACE
      ?auto_56994 - TRUCK
      ?auto_56997 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56995 ?auto_56996 ) ( IS-CRATE ?auto_56992 ) ( not ( = ?auto_56991 ?auto_56992 ) ) ( not ( = ?auto_56987 ?auto_56991 ) ) ( not ( = ?auto_56987 ?auto_56992 ) ) ( not ( = ?auto_56999 ?auto_56996 ) ) ( HOIST-AT ?auto_56998 ?auto_56999 ) ( not ( = ?auto_56995 ?auto_56998 ) ) ( SURFACE-AT ?auto_56992 ?auto_56999 ) ( ON ?auto_56992 ?auto_56993 ) ( CLEAR ?auto_56992 ) ( not ( = ?auto_56991 ?auto_56993 ) ) ( not ( = ?auto_56992 ?auto_56993 ) ) ( not ( = ?auto_56987 ?auto_56993 ) ) ( SURFACE-AT ?auto_56987 ?auto_56996 ) ( CLEAR ?auto_56987 ) ( IS-CRATE ?auto_56991 ) ( AVAILABLE ?auto_56995 ) ( TRUCK-AT ?auto_56994 ?auto_56999 ) ( AVAILABLE ?auto_56998 ) ( SURFACE-AT ?auto_56991 ?auto_56999 ) ( ON ?auto_56991 ?auto_56997 ) ( CLEAR ?auto_56991 ) ( not ( = ?auto_56991 ?auto_56997 ) ) ( not ( = ?auto_56992 ?auto_56997 ) ) ( not ( = ?auto_56987 ?auto_56997 ) ) ( not ( = ?auto_56993 ?auto_56997 ) ) ( ON ?auto_56989 ?auto_56988 ) ( ON ?auto_56990 ?auto_56989 ) ( ON ?auto_56987 ?auto_56990 ) ( not ( = ?auto_56988 ?auto_56989 ) ) ( not ( = ?auto_56988 ?auto_56990 ) ) ( not ( = ?auto_56988 ?auto_56987 ) ) ( not ( = ?auto_56988 ?auto_56991 ) ) ( not ( = ?auto_56988 ?auto_56992 ) ) ( not ( = ?auto_56988 ?auto_56993 ) ) ( not ( = ?auto_56988 ?auto_56997 ) ) ( not ( = ?auto_56989 ?auto_56990 ) ) ( not ( = ?auto_56989 ?auto_56987 ) ) ( not ( = ?auto_56989 ?auto_56991 ) ) ( not ( = ?auto_56989 ?auto_56992 ) ) ( not ( = ?auto_56989 ?auto_56993 ) ) ( not ( = ?auto_56989 ?auto_56997 ) ) ( not ( = ?auto_56990 ?auto_56987 ) ) ( not ( = ?auto_56990 ?auto_56991 ) ) ( not ( = ?auto_56990 ?auto_56992 ) ) ( not ( = ?auto_56990 ?auto_56993 ) ) ( not ( = ?auto_56990 ?auto_56997 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56987 ?auto_56991 ?auto_56992 )
      ( MAKE-5CRATE-VERIFY ?auto_56988 ?auto_56989 ?auto_56990 ?auto_56987 ?auto_56991 ?auto_56992 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_57000 - SURFACE
      ?auto_57001 - SURFACE
    )
    :vars
    (
      ?auto_57004 - HOIST
      ?auto_57005 - PLACE
      ?auto_57007 - SURFACE
      ?auto_57009 - PLACE
      ?auto_57008 - HOIST
      ?auto_57002 - SURFACE
      ?auto_57006 - SURFACE
      ?auto_57003 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57004 ?auto_57005 ) ( IS-CRATE ?auto_57001 ) ( not ( = ?auto_57000 ?auto_57001 ) ) ( not ( = ?auto_57007 ?auto_57000 ) ) ( not ( = ?auto_57007 ?auto_57001 ) ) ( not ( = ?auto_57009 ?auto_57005 ) ) ( HOIST-AT ?auto_57008 ?auto_57009 ) ( not ( = ?auto_57004 ?auto_57008 ) ) ( SURFACE-AT ?auto_57001 ?auto_57009 ) ( ON ?auto_57001 ?auto_57002 ) ( CLEAR ?auto_57001 ) ( not ( = ?auto_57000 ?auto_57002 ) ) ( not ( = ?auto_57001 ?auto_57002 ) ) ( not ( = ?auto_57007 ?auto_57002 ) ) ( SURFACE-AT ?auto_57007 ?auto_57005 ) ( CLEAR ?auto_57007 ) ( IS-CRATE ?auto_57000 ) ( AVAILABLE ?auto_57004 ) ( AVAILABLE ?auto_57008 ) ( SURFACE-AT ?auto_57000 ?auto_57009 ) ( ON ?auto_57000 ?auto_57006 ) ( CLEAR ?auto_57000 ) ( not ( = ?auto_57000 ?auto_57006 ) ) ( not ( = ?auto_57001 ?auto_57006 ) ) ( not ( = ?auto_57007 ?auto_57006 ) ) ( not ( = ?auto_57002 ?auto_57006 ) ) ( TRUCK-AT ?auto_57003 ?auto_57005 ) )
    :subtasks
    ( ( !DRIVE ?auto_57003 ?auto_57005 ?auto_57009 )
      ( MAKE-2CRATE ?auto_57007 ?auto_57000 ?auto_57001 )
      ( MAKE-1CRATE-VERIFY ?auto_57000 ?auto_57001 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_57010 - SURFACE
      ?auto_57011 - SURFACE
      ?auto_57012 - SURFACE
    )
    :vars
    (
      ?auto_57017 - HOIST
      ?auto_57016 - PLACE
      ?auto_57018 - PLACE
      ?auto_57014 - HOIST
      ?auto_57013 - SURFACE
      ?auto_57019 - SURFACE
      ?auto_57015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57017 ?auto_57016 ) ( IS-CRATE ?auto_57012 ) ( not ( = ?auto_57011 ?auto_57012 ) ) ( not ( = ?auto_57010 ?auto_57011 ) ) ( not ( = ?auto_57010 ?auto_57012 ) ) ( not ( = ?auto_57018 ?auto_57016 ) ) ( HOIST-AT ?auto_57014 ?auto_57018 ) ( not ( = ?auto_57017 ?auto_57014 ) ) ( SURFACE-AT ?auto_57012 ?auto_57018 ) ( ON ?auto_57012 ?auto_57013 ) ( CLEAR ?auto_57012 ) ( not ( = ?auto_57011 ?auto_57013 ) ) ( not ( = ?auto_57012 ?auto_57013 ) ) ( not ( = ?auto_57010 ?auto_57013 ) ) ( SURFACE-AT ?auto_57010 ?auto_57016 ) ( CLEAR ?auto_57010 ) ( IS-CRATE ?auto_57011 ) ( AVAILABLE ?auto_57017 ) ( AVAILABLE ?auto_57014 ) ( SURFACE-AT ?auto_57011 ?auto_57018 ) ( ON ?auto_57011 ?auto_57019 ) ( CLEAR ?auto_57011 ) ( not ( = ?auto_57011 ?auto_57019 ) ) ( not ( = ?auto_57012 ?auto_57019 ) ) ( not ( = ?auto_57010 ?auto_57019 ) ) ( not ( = ?auto_57013 ?auto_57019 ) ) ( TRUCK-AT ?auto_57015 ?auto_57016 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_57011 ?auto_57012 )
      ( MAKE-2CRATE-VERIFY ?auto_57010 ?auto_57011 ?auto_57012 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_57021 - SURFACE
      ?auto_57022 - SURFACE
      ?auto_57023 - SURFACE
      ?auto_57020 - SURFACE
    )
    :vars
    (
      ?auto_57024 - HOIST
      ?auto_57026 - PLACE
      ?auto_57025 - PLACE
      ?auto_57028 - HOIST
      ?auto_57030 - SURFACE
      ?auto_57027 - SURFACE
      ?auto_57029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57024 ?auto_57026 ) ( IS-CRATE ?auto_57020 ) ( not ( = ?auto_57023 ?auto_57020 ) ) ( not ( = ?auto_57022 ?auto_57023 ) ) ( not ( = ?auto_57022 ?auto_57020 ) ) ( not ( = ?auto_57025 ?auto_57026 ) ) ( HOIST-AT ?auto_57028 ?auto_57025 ) ( not ( = ?auto_57024 ?auto_57028 ) ) ( SURFACE-AT ?auto_57020 ?auto_57025 ) ( ON ?auto_57020 ?auto_57030 ) ( CLEAR ?auto_57020 ) ( not ( = ?auto_57023 ?auto_57030 ) ) ( not ( = ?auto_57020 ?auto_57030 ) ) ( not ( = ?auto_57022 ?auto_57030 ) ) ( SURFACE-AT ?auto_57022 ?auto_57026 ) ( CLEAR ?auto_57022 ) ( IS-CRATE ?auto_57023 ) ( AVAILABLE ?auto_57024 ) ( AVAILABLE ?auto_57028 ) ( SURFACE-AT ?auto_57023 ?auto_57025 ) ( ON ?auto_57023 ?auto_57027 ) ( CLEAR ?auto_57023 ) ( not ( = ?auto_57023 ?auto_57027 ) ) ( not ( = ?auto_57020 ?auto_57027 ) ) ( not ( = ?auto_57022 ?auto_57027 ) ) ( not ( = ?auto_57030 ?auto_57027 ) ) ( TRUCK-AT ?auto_57029 ?auto_57026 ) ( ON ?auto_57022 ?auto_57021 ) ( not ( = ?auto_57021 ?auto_57022 ) ) ( not ( = ?auto_57021 ?auto_57023 ) ) ( not ( = ?auto_57021 ?auto_57020 ) ) ( not ( = ?auto_57021 ?auto_57030 ) ) ( not ( = ?auto_57021 ?auto_57027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_57022 ?auto_57023 ?auto_57020 )
      ( MAKE-3CRATE-VERIFY ?auto_57021 ?auto_57022 ?auto_57023 ?auto_57020 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_57032 - SURFACE
      ?auto_57033 - SURFACE
      ?auto_57034 - SURFACE
      ?auto_57031 - SURFACE
      ?auto_57035 - SURFACE
    )
    :vars
    (
      ?auto_57036 - HOIST
      ?auto_57038 - PLACE
      ?auto_57037 - PLACE
      ?auto_57040 - HOIST
      ?auto_57042 - SURFACE
      ?auto_57039 - SURFACE
      ?auto_57041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57036 ?auto_57038 ) ( IS-CRATE ?auto_57035 ) ( not ( = ?auto_57031 ?auto_57035 ) ) ( not ( = ?auto_57034 ?auto_57031 ) ) ( not ( = ?auto_57034 ?auto_57035 ) ) ( not ( = ?auto_57037 ?auto_57038 ) ) ( HOIST-AT ?auto_57040 ?auto_57037 ) ( not ( = ?auto_57036 ?auto_57040 ) ) ( SURFACE-AT ?auto_57035 ?auto_57037 ) ( ON ?auto_57035 ?auto_57042 ) ( CLEAR ?auto_57035 ) ( not ( = ?auto_57031 ?auto_57042 ) ) ( not ( = ?auto_57035 ?auto_57042 ) ) ( not ( = ?auto_57034 ?auto_57042 ) ) ( SURFACE-AT ?auto_57034 ?auto_57038 ) ( CLEAR ?auto_57034 ) ( IS-CRATE ?auto_57031 ) ( AVAILABLE ?auto_57036 ) ( AVAILABLE ?auto_57040 ) ( SURFACE-AT ?auto_57031 ?auto_57037 ) ( ON ?auto_57031 ?auto_57039 ) ( CLEAR ?auto_57031 ) ( not ( = ?auto_57031 ?auto_57039 ) ) ( not ( = ?auto_57035 ?auto_57039 ) ) ( not ( = ?auto_57034 ?auto_57039 ) ) ( not ( = ?auto_57042 ?auto_57039 ) ) ( TRUCK-AT ?auto_57041 ?auto_57038 ) ( ON ?auto_57033 ?auto_57032 ) ( ON ?auto_57034 ?auto_57033 ) ( not ( = ?auto_57032 ?auto_57033 ) ) ( not ( = ?auto_57032 ?auto_57034 ) ) ( not ( = ?auto_57032 ?auto_57031 ) ) ( not ( = ?auto_57032 ?auto_57035 ) ) ( not ( = ?auto_57032 ?auto_57042 ) ) ( not ( = ?auto_57032 ?auto_57039 ) ) ( not ( = ?auto_57033 ?auto_57034 ) ) ( not ( = ?auto_57033 ?auto_57031 ) ) ( not ( = ?auto_57033 ?auto_57035 ) ) ( not ( = ?auto_57033 ?auto_57042 ) ) ( not ( = ?auto_57033 ?auto_57039 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_57034 ?auto_57031 ?auto_57035 )
      ( MAKE-4CRATE-VERIFY ?auto_57032 ?auto_57033 ?auto_57034 ?auto_57031 ?auto_57035 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_57044 - SURFACE
      ?auto_57045 - SURFACE
      ?auto_57046 - SURFACE
      ?auto_57043 - SURFACE
      ?auto_57047 - SURFACE
      ?auto_57048 - SURFACE
    )
    :vars
    (
      ?auto_57049 - HOIST
      ?auto_57051 - PLACE
      ?auto_57050 - PLACE
      ?auto_57053 - HOIST
      ?auto_57055 - SURFACE
      ?auto_57052 - SURFACE
      ?auto_57054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57049 ?auto_57051 ) ( IS-CRATE ?auto_57048 ) ( not ( = ?auto_57047 ?auto_57048 ) ) ( not ( = ?auto_57043 ?auto_57047 ) ) ( not ( = ?auto_57043 ?auto_57048 ) ) ( not ( = ?auto_57050 ?auto_57051 ) ) ( HOIST-AT ?auto_57053 ?auto_57050 ) ( not ( = ?auto_57049 ?auto_57053 ) ) ( SURFACE-AT ?auto_57048 ?auto_57050 ) ( ON ?auto_57048 ?auto_57055 ) ( CLEAR ?auto_57048 ) ( not ( = ?auto_57047 ?auto_57055 ) ) ( not ( = ?auto_57048 ?auto_57055 ) ) ( not ( = ?auto_57043 ?auto_57055 ) ) ( SURFACE-AT ?auto_57043 ?auto_57051 ) ( CLEAR ?auto_57043 ) ( IS-CRATE ?auto_57047 ) ( AVAILABLE ?auto_57049 ) ( AVAILABLE ?auto_57053 ) ( SURFACE-AT ?auto_57047 ?auto_57050 ) ( ON ?auto_57047 ?auto_57052 ) ( CLEAR ?auto_57047 ) ( not ( = ?auto_57047 ?auto_57052 ) ) ( not ( = ?auto_57048 ?auto_57052 ) ) ( not ( = ?auto_57043 ?auto_57052 ) ) ( not ( = ?auto_57055 ?auto_57052 ) ) ( TRUCK-AT ?auto_57054 ?auto_57051 ) ( ON ?auto_57045 ?auto_57044 ) ( ON ?auto_57046 ?auto_57045 ) ( ON ?auto_57043 ?auto_57046 ) ( not ( = ?auto_57044 ?auto_57045 ) ) ( not ( = ?auto_57044 ?auto_57046 ) ) ( not ( = ?auto_57044 ?auto_57043 ) ) ( not ( = ?auto_57044 ?auto_57047 ) ) ( not ( = ?auto_57044 ?auto_57048 ) ) ( not ( = ?auto_57044 ?auto_57055 ) ) ( not ( = ?auto_57044 ?auto_57052 ) ) ( not ( = ?auto_57045 ?auto_57046 ) ) ( not ( = ?auto_57045 ?auto_57043 ) ) ( not ( = ?auto_57045 ?auto_57047 ) ) ( not ( = ?auto_57045 ?auto_57048 ) ) ( not ( = ?auto_57045 ?auto_57055 ) ) ( not ( = ?auto_57045 ?auto_57052 ) ) ( not ( = ?auto_57046 ?auto_57043 ) ) ( not ( = ?auto_57046 ?auto_57047 ) ) ( not ( = ?auto_57046 ?auto_57048 ) ) ( not ( = ?auto_57046 ?auto_57055 ) ) ( not ( = ?auto_57046 ?auto_57052 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_57043 ?auto_57047 ?auto_57048 )
      ( MAKE-5CRATE-VERIFY ?auto_57044 ?auto_57045 ?auto_57046 ?auto_57043 ?auto_57047 ?auto_57048 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_57056 - SURFACE
      ?auto_57057 - SURFACE
    )
    :vars
    (
      ?auto_57059 - HOIST
      ?auto_57061 - PLACE
      ?auto_57058 - SURFACE
      ?auto_57060 - PLACE
      ?auto_57063 - HOIST
      ?auto_57065 - SURFACE
      ?auto_57062 - SURFACE
      ?auto_57064 - TRUCK
      ?auto_57066 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57059 ?auto_57061 ) ( IS-CRATE ?auto_57057 ) ( not ( = ?auto_57056 ?auto_57057 ) ) ( not ( = ?auto_57058 ?auto_57056 ) ) ( not ( = ?auto_57058 ?auto_57057 ) ) ( not ( = ?auto_57060 ?auto_57061 ) ) ( HOIST-AT ?auto_57063 ?auto_57060 ) ( not ( = ?auto_57059 ?auto_57063 ) ) ( SURFACE-AT ?auto_57057 ?auto_57060 ) ( ON ?auto_57057 ?auto_57065 ) ( CLEAR ?auto_57057 ) ( not ( = ?auto_57056 ?auto_57065 ) ) ( not ( = ?auto_57057 ?auto_57065 ) ) ( not ( = ?auto_57058 ?auto_57065 ) ) ( IS-CRATE ?auto_57056 ) ( AVAILABLE ?auto_57063 ) ( SURFACE-AT ?auto_57056 ?auto_57060 ) ( ON ?auto_57056 ?auto_57062 ) ( CLEAR ?auto_57056 ) ( not ( = ?auto_57056 ?auto_57062 ) ) ( not ( = ?auto_57057 ?auto_57062 ) ) ( not ( = ?auto_57058 ?auto_57062 ) ) ( not ( = ?auto_57065 ?auto_57062 ) ) ( TRUCK-AT ?auto_57064 ?auto_57061 ) ( SURFACE-AT ?auto_57066 ?auto_57061 ) ( CLEAR ?auto_57066 ) ( LIFTING ?auto_57059 ?auto_57058 ) ( IS-CRATE ?auto_57058 ) ( not ( = ?auto_57066 ?auto_57058 ) ) ( not ( = ?auto_57056 ?auto_57066 ) ) ( not ( = ?auto_57057 ?auto_57066 ) ) ( not ( = ?auto_57065 ?auto_57066 ) ) ( not ( = ?auto_57062 ?auto_57066 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_57066 ?auto_57058 )
      ( MAKE-2CRATE ?auto_57058 ?auto_57056 ?auto_57057 )
      ( MAKE-1CRATE-VERIFY ?auto_57056 ?auto_57057 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_57067 - SURFACE
      ?auto_57068 - SURFACE
      ?auto_57069 - SURFACE
    )
    :vars
    (
      ?auto_57077 - HOIST
      ?auto_57072 - PLACE
      ?auto_57070 - PLACE
      ?auto_57075 - HOIST
      ?auto_57074 - SURFACE
      ?auto_57073 - SURFACE
      ?auto_57071 - TRUCK
      ?auto_57076 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57077 ?auto_57072 ) ( IS-CRATE ?auto_57069 ) ( not ( = ?auto_57068 ?auto_57069 ) ) ( not ( = ?auto_57067 ?auto_57068 ) ) ( not ( = ?auto_57067 ?auto_57069 ) ) ( not ( = ?auto_57070 ?auto_57072 ) ) ( HOIST-AT ?auto_57075 ?auto_57070 ) ( not ( = ?auto_57077 ?auto_57075 ) ) ( SURFACE-AT ?auto_57069 ?auto_57070 ) ( ON ?auto_57069 ?auto_57074 ) ( CLEAR ?auto_57069 ) ( not ( = ?auto_57068 ?auto_57074 ) ) ( not ( = ?auto_57069 ?auto_57074 ) ) ( not ( = ?auto_57067 ?auto_57074 ) ) ( IS-CRATE ?auto_57068 ) ( AVAILABLE ?auto_57075 ) ( SURFACE-AT ?auto_57068 ?auto_57070 ) ( ON ?auto_57068 ?auto_57073 ) ( CLEAR ?auto_57068 ) ( not ( = ?auto_57068 ?auto_57073 ) ) ( not ( = ?auto_57069 ?auto_57073 ) ) ( not ( = ?auto_57067 ?auto_57073 ) ) ( not ( = ?auto_57074 ?auto_57073 ) ) ( TRUCK-AT ?auto_57071 ?auto_57072 ) ( SURFACE-AT ?auto_57076 ?auto_57072 ) ( CLEAR ?auto_57076 ) ( LIFTING ?auto_57077 ?auto_57067 ) ( IS-CRATE ?auto_57067 ) ( not ( = ?auto_57076 ?auto_57067 ) ) ( not ( = ?auto_57068 ?auto_57076 ) ) ( not ( = ?auto_57069 ?auto_57076 ) ) ( not ( = ?auto_57074 ?auto_57076 ) ) ( not ( = ?auto_57073 ?auto_57076 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_57068 ?auto_57069 )
      ( MAKE-2CRATE-VERIFY ?auto_57067 ?auto_57068 ?auto_57069 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_57079 - SURFACE
      ?auto_57080 - SURFACE
      ?auto_57081 - SURFACE
      ?auto_57078 - SURFACE
    )
    :vars
    (
      ?auto_57084 - HOIST
      ?auto_57085 - PLACE
      ?auto_57087 - PLACE
      ?auto_57086 - HOIST
      ?auto_57082 - SURFACE
      ?auto_57088 - SURFACE
      ?auto_57083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57084 ?auto_57085 ) ( IS-CRATE ?auto_57078 ) ( not ( = ?auto_57081 ?auto_57078 ) ) ( not ( = ?auto_57080 ?auto_57081 ) ) ( not ( = ?auto_57080 ?auto_57078 ) ) ( not ( = ?auto_57087 ?auto_57085 ) ) ( HOIST-AT ?auto_57086 ?auto_57087 ) ( not ( = ?auto_57084 ?auto_57086 ) ) ( SURFACE-AT ?auto_57078 ?auto_57087 ) ( ON ?auto_57078 ?auto_57082 ) ( CLEAR ?auto_57078 ) ( not ( = ?auto_57081 ?auto_57082 ) ) ( not ( = ?auto_57078 ?auto_57082 ) ) ( not ( = ?auto_57080 ?auto_57082 ) ) ( IS-CRATE ?auto_57081 ) ( AVAILABLE ?auto_57086 ) ( SURFACE-AT ?auto_57081 ?auto_57087 ) ( ON ?auto_57081 ?auto_57088 ) ( CLEAR ?auto_57081 ) ( not ( = ?auto_57081 ?auto_57088 ) ) ( not ( = ?auto_57078 ?auto_57088 ) ) ( not ( = ?auto_57080 ?auto_57088 ) ) ( not ( = ?auto_57082 ?auto_57088 ) ) ( TRUCK-AT ?auto_57083 ?auto_57085 ) ( SURFACE-AT ?auto_57079 ?auto_57085 ) ( CLEAR ?auto_57079 ) ( LIFTING ?auto_57084 ?auto_57080 ) ( IS-CRATE ?auto_57080 ) ( not ( = ?auto_57079 ?auto_57080 ) ) ( not ( = ?auto_57081 ?auto_57079 ) ) ( not ( = ?auto_57078 ?auto_57079 ) ) ( not ( = ?auto_57082 ?auto_57079 ) ) ( not ( = ?auto_57088 ?auto_57079 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_57080 ?auto_57081 ?auto_57078 )
      ( MAKE-3CRATE-VERIFY ?auto_57079 ?auto_57080 ?auto_57081 ?auto_57078 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_57090 - SURFACE
      ?auto_57091 - SURFACE
      ?auto_57092 - SURFACE
      ?auto_57089 - SURFACE
      ?auto_57093 - SURFACE
    )
    :vars
    (
      ?auto_57096 - HOIST
      ?auto_57097 - PLACE
      ?auto_57099 - PLACE
      ?auto_57098 - HOIST
      ?auto_57094 - SURFACE
      ?auto_57100 - SURFACE
      ?auto_57095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57096 ?auto_57097 ) ( IS-CRATE ?auto_57093 ) ( not ( = ?auto_57089 ?auto_57093 ) ) ( not ( = ?auto_57092 ?auto_57089 ) ) ( not ( = ?auto_57092 ?auto_57093 ) ) ( not ( = ?auto_57099 ?auto_57097 ) ) ( HOIST-AT ?auto_57098 ?auto_57099 ) ( not ( = ?auto_57096 ?auto_57098 ) ) ( SURFACE-AT ?auto_57093 ?auto_57099 ) ( ON ?auto_57093 ?auto_57094 ) ( CLEAR ?auto_57093 ) ( not ( = ?auto_57089 ?auto_57094 ) ) ( not ( = ?auto_57093 ?auto_57094 ) ) ( not ( = ?auto_57092 ?auto_57094 ) ) ( IS-CRATE ?auto_57089 ) ( AVAILABLE ?auto_57098 ) ( SURFACE-AT ?auto_57089 ?auto_57099 ) ( ON ?auto_57089 ?auto_57100 ) ( CLEAR ?auto_57089 ) ( not ( = ?auto_57089 ?auto_57100 ) ) ( not ( = ?auto_57093 ?auto_57100 ) ) ( not ( = ?auto_57092 ?auto_57100 ) ) ( not ( = ?auto_57094 ?auto_57100 ) ) ( TRUCK-AT ?auto_57095 ?auto_57097 ) ( SURFACE-AT ?auto_57091 ?auto_57097 ) ( CLEAR ?auto_57091 ) ( LIFTING ?auto_57096 ?auto_57092 ) ( IS-CRATE ?auto_57092 ) ( not ( = ?auto_57091 ?auto_57092 ) ) ( not ( = ?auto_57089 ?auto_57091 ) ) ( not ( = ?auto_57093 ?auto_57091 ) ) ( not ( = ?auto_57094 ?auto_57091 ) ) ( not ( = ?auto_57100 ?auto_57091 ) ) ( ON ?auto_57091 ?auto_57090 ) ( not ( = ?auto_57090 ?auto_57091 ) ) ( not ( = ?auto_57090 ?auto_57092 ) ) ( not ( = ?auto_57090 ?auto_57089 ) ) ( not ( = ?auto_57090 ?auto_57093 ) ) ( not ( = ?auto_57090 ?auto_57094 ) ) ( not ( = ?auto_57090 ?auto_57100 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_57092 ?auto_57089 ?auto_57093 )
      ( MAKE-4CRATE-VERIFY ?auto_57090 ?auto_57091 ?auto_57092 ?auto_57089 ?auto_57093 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_57102 - SURFACE
      ?auto_57103 - SURFACE
      ?auto_57104 - SURFACE
      ?auto_57101 - SURFACE
      ?auto_57105 - SURFACE
      ?auto_57106 - SURFACE
    )
    :vars
    (
      ?auto_57109 - HOIST
      ?auto_57110 - PLACE
      ?auto_57112 - PLACE
      ?auto_57111 - HOIST
      ?auto_57107 - SURFACE
      ?auto_57113 - SURFACE
      ?auto_57108 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57109 ?auto_57110 ) ( IS-CRATE ?auto_57106 ) ( not ( = ?auto_57105 ?auto_57106 ) ) ( not ( = ?auto_57101 ?auto_57105 ) ) ( not ( = ?auto_57101 ?auto_57106 ) ) ( not ( = ?auto_57112 ?auto_57110 ) ) ( HOIST-AT ?auto_57111 ?auto_57112 ) ( not ( = ?auto_57109 ?auto_57111 ) ) ( SURFACE-AT ?auto_57106 ?auto_57112 ) ( ON ?auto_57106 ?auto_57107 ) ( CLEAR ?auto_57106 ) ( not ( = ?auto_57105 ?auto_57107 ) ) ( not ( = ?auto_57106 ?auto_57107 ) ) ( not ( = ?auto_57101 ?auto_57107 ) ) ( IS-CRATE ?auto_57105 ) ( AVAILABLE ?auto_57111 ) ( SURFACE-AT ?auto_57105 ?auto_57112 ) ( ON ?auto_57105 ?auto_57113 ) ( CLEAR ?auto_57105 ) ( not ( = ?auto_57105 ?auto_57113 ) ) ( not ( = ?auto_57106 ?auto_57113 ) ) ( not ( = ?auto_57101 ?auto_57113 ) ) ( not ( = ?auto_57107 ?auto_57113 ) ) ( TRUCK-AT ?auto_57108 ?auto_57110 ) ( SURFACE-AT ?auto_57104 ?auto_57110 ) ( CLEAR ?auto_57104 ) ( LIFTING ?auto_57109 ?auto_57101 ) ( IS-CRATE ?auto_57101 ) ( not ( = ?auto_57104 ?auto_57101 ) ) ( not ( = ?auto_57105 ?auto_57104 ) ) ( not ( = ?auto_57106 ?auto_57104 ) ) ( not ( = ?auto_57107 ?auto_57104 ) ) ( not ( = ?auto_57113 ?auto_57104 ) ) ( ON ?auto_57103 ?auto_57102 ) ( ON ?auto_57104 ?auto_57103 ) ( not ( = ?auto_57102 ?auto_57103 ) ) ( not ( = ?auto_57102 ?auto_57104 ) ) ( not ( = ?auto_57102 ?auto_57101 ) ) ( not ( = ?auto_57102 ?auto_57105 ) ) ( not ( = ?auto_57102 ?auto_57106 ) ) ( not ( = ?auto_57102 ?auto_57107 ) ) ( not ( = ?auto_57102 ?auto_57113 ) ) ( not ( = ?auto_57103 ?auto_57104 ) ) ( not ( = ?auto_57103 ?auto_57101 ) ) ( not ( = ?auto_57103 ?auto_57105 ) ) ( not ( = ?auto_57103 ?auto_57106 ) ) ( not ( = ?auto_57103 ?auto_57107 ) ) ( not ( = ?auto_57103 ?auto_57113 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_57101 ?auto_57105 ?auto_57106 )
      ( MAKE-5CRATE-VERIFY ?auto_57102 ?auto_57103 ?auto_57104 ?auto_57101 ?auto_57105 ?auto_57106 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58023 - SURFACE
      ?auto_58024 - SURFACE
      ?auto_58025 - SURFACE
      ?auto_58022 - SURFACE
      ?auto_58026 - SURFACE
      ?auto_58028 - SURFACE
      ?auto_58027 - SURFACE
    )
    :vars
    (
      ?auto_58030 - HOIST
      ?auto_58029 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58030 ?auto_58029 ) ( SURFACE-AT ?auto_58028 ?auto_58029 ) ( CLEAR ?auto_58028 ) ( LIFTING ?auto_58030 ?auto_58027 ) ( IS-CRATE ?auto_58027 ) ( not ( = ?auto_58028 ?auto_58027 ) ) ( ON ?auto_58024 ?auto_58023 ) ( ON ?auto_58025 ?auto_58024 ) ( ON ?auto_58022 ?auto_58025 ) ( ON ?auto_58026 ?auto_58022 ) ( ON ?auto_58028 ?auto_58026 ) ( not ( = ?auto_58023 ?auto_58024 ) ) ( not ( = ?auto_58023 ?auto_58025 ) ) ( not ( = ?auto_58023 ?auto_58022 ) ) ( not ( = ?auto_58023 ?auto_58026 ) ) ( not ( = ?auto_58023 ?auto_58028 ) ) ( not ( = ?auto_58023 ?auto_58027 ) ) ( not ( = ?auto_58024 ?auto_58025 ) ) ( not ( = ?auto_58024 ?auto_58022 ) ) ( not ( = ?auto_58024 ?auto_58026 ) ) ( not ( = ?auto_58024 ?auto_58028 ) ) ( not ( = ?auto_58024 ?auto_58027 ) ) ( not ( = ?auto_58025 ?auto_58022 ) ) ( not ( = ?auto_58025 ?auto_58026 ) ) ( not ( = ?auto_58025 ?auto_58028 ) ) ( not ( = ?auto_58025 ?auto_58027 ) ) ( not ( = ?auto_58022 ?auto_58026 ) ) ( not ( = ?auto_58022 ?auto_58028 ) ) ( not ( = ?auto_58022 ?auto_58027 ) ) ( not ( = ?auto_58026 ?auto_58028 ) ) ( not ( = ?auto_58026 ?auto_58027 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_58028 ?auto_58027 )
      ( MAKE-6CRATE-VERIFY ?auto_58023 ?auto_58024 ?auto_58025 ?auto_58022 ?auto_58026 ?auto_58028 ?auto_58027 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58067 - SURFACE
      ?auto_58068 - SURFACE
      ?auto_58069 - SURFACE
      ?auto_58066 - SURFACE
      ?auto_58070 - SURFACE
      ?auto_58072 - SURFACE
      ?auto_58071 - SURFACE
    )
    :vars
    (
      ?auto_58075 - HOIST
      ?auto_58074 - PLACE
      ?auto_58073 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58075 ?auto_58074 ) ( SURFACE-AT ?auto_58072 ?auto_58074 ) ( CLEAR ?auto_58072 ) ( IS-CRATE ?auto_58071 ) ( not ( = ?auto_58072 ?auto_58071 ) ) ( TRUCK-AT ?auto_58073 ?auto_58074 ) ( AVAILABLE ?auto_58075 ) ( IN ?auto_58071 ?auto_58073 ) ( ON ?auto_58072 ?auto_58070 ) ( not ( = ?auto_58070 ?auto_58072 ) ) ( not ( = ?auto_58070 ?auto_58071 ) ) ( ON ?auto_58068 ?auto_58067 ) ( ON ?auto_58069 ?auto_58068 ) ( ON ?auto_58066 ?auto_58069 ) ( ON ?auto_58070 ?auto_58066 ) ( not ( = ?auto_58067 ?auto_58068 ) ) ( not ( = ?auto_58067 ?auto_58069 ) ) ( not ( = ?auto_58067 ?auto_58066 ) ) ( not ( = ?auto_58067 ?auto_58070 ) ) ( not ( = ?auto_58067 ?auto_58072 ) ) ( not ( = ?auto_58067 ?auto_58071 ) ) ( not ( = ?auto_58068 ?auto_58069 ) ) ( not ( = ?auto_58068 ?auto_58066 ) ) ( not ( = ?auto_58068 ?auto_58070 ) ) ( not ( = ?auto_58068 ?auto_58072 ) ) ( not ( = ?auto_58068 ?auto_58071 ) ) ( not ( = ?auto_58069 ?auto_58066 ) ) ( not ( = ?auto_58069 ?auto_58070 ) ) ( not ( = ?auto_58069 ?auto_58072 ) ) ( not ( = ?auto_58069 ?auto_58071 ) ) ( not ( = ?auto_58066 ?auto_58070 ) ) ( not ( = ?auto_58066 ?auto_58072 ) ) ( not ( = ?auto_58066 ?auto_58071 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58070 ?auto_58072 ?auto_58071 )
      ( MAKE-6CRATE-VERIFY ?auto_58067 ?auto_58068 ?auto_58069 ?auto_58066 ?auto_58070 ?auto_58072 ?auto_58071 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58118 - SURFACE
      ?auto_58119 - SURFACE
      ?auto_58120 - SURFACE
      ?auto_58117 - SURFACE
      ?auto_58121 - SURFACE
      ?auto_58123 - SURFACE
      ?auto_58122 - SURFACE
    )
    :vars
    (
      ?auto_58127 - HOIST
      ?auto_58125 - PLACE
      ?auto_58124 - TRUCK
      ?auto_58126 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58127 ?auto_58125 ) ( SURFACE-AT ?auto_58123 ?auto_58125 ) ( CLEAR ?auto_58123 ) ( IS-CRATE ?auto_58122 ) ( not ( = ?auto_58123 ?auto_58122 ) ) ( AVAILABLE ?auto_58127 ) ( IN ?auto_58122 ?auto_58124 ) ( ON ?auto_58123 ?auto_58121 ) ( not ( = ?auto_58121 ?auto_58123 ) ) ( not ( = ?auto_58121 ?auto_58122 ) ) ( TRUCK-AT ?auto_58124 ?auto_58126 ) ( not ( = ?auto_58126 ?auto_58125 ) ) ( ON ?auto_58119 ?auto_58118 ) ( ON ?auto_58120 ?auto_58119 ) ( ON ?auto_58117 ?auto_58120 ) ( ON ?auto_58121 ?auto_58117 ) ( not ( = ?auto_58118 ?auto_58119 ) ) ( not ( = ?auto_58118 ?auto_58120 ) ) ( not ( = ?auto_58118 ?auto_58117 ) ) ( not ( = ?auto_58118 ?auto_58121 ) ) ( not ( = ?auto_58118 ?auto_58123 ) ) ( not ( = ?auto_58118 ?auto_58122 ) ) ( not ( = ?auto_58119 ?auto_58120 ) ) ( not ( = ?auto_58119 ?auto_58117 ) ) ( not ( = ?auto_58119 ?auto_58121 ) ) ( not ( = ?auto_58119 ?auto_58123 ) ) ( not ( = ?auto_58119 ?auto_58122 ) ) ( not ( = ?auto_58120 ?auto_58117 ) ) ( not ( = ?auto_58120 ?auto_58121 ) ) ( not ( = ?auto_58120 ?auto_58123 ) ) ( not ( = ?auto_58120 ?auto_58122 ) ) ( not ( = ?auto_58117 ?auto_58121 ) ) ( not ( = ?auto_58117 ?auto_58123 ) ) ( not ( = ?auto_58117 ?auto_58122 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58121 ?auto_58123 ?auto_58122 )
      ( MAKE-6CRATE-VERIFY ?auto_58118 ?auto_58119 ?auto_58120 ?auto_58117 ?auto_58121 ?auto_58123 ?auto_58122 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58175 - SURFACE
      ?auto_58176 - SURFACE
      ?auto_58177 - SURFACE
      ?auto_58174 - SURFACE
      ?auto_58178 - SURFACE
      ?auto_58180 - SURFACE
      ?auto_58179 - SURFACE
    )
    :vars
    (
      ?auto_58181 - HOIST
      ?auto_58182 - PLACE
      ?auto_58183 - TRUCK
      ?auto_58184 - PLACE
      ?auto_58185 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_58181 ?auto_58182 ) ( SURFACE-AT ?auto_58180 ?auto_58182 ) ( CLEAR ?auto_58180 ) ( IS-CRATE ?auto_58179 ) ( not ( = ?auto_58180 ?auto_58179 ) ) ( AVAILABLE ?auto_58181 ) ( ON ?auto_58180 ?auto_58178 ) ( not ( = ?auto_58178 ?auto_58180 ) ) ( not ( = ?auto_58178 ?auto_58179 ) ) ( TRUCK-AT ?auto_58183 ?auto_58184 ) ( not ( = ?auto_58184 ?auto_58182 ) ) ( HOIST-AT ?auto_58185 ?auto_58184 ) ( LIFTING ?auto_58185 ?auto_58179 ) ( not ( = ?auto_58181 ?auto_58185 ) ) ( ON ?auto_58176 ?auto_58175 ) ( ON ?auto_58177 ?auto_58176 ) ( ON ?auto_58174 ?auto_58177 ) ( ON ?auto_58178 ?auto_58174 ) ( not ( = ?auto_58175 ?auto_58176 ) ) ( not ( = ?auto_58175 ?auto_58177 ) ) ( not ( = ?auto_58175 ?auto_58174 ) ) ( not ( = ?auto_58175 ?auto_58178 ) ) ( not ( = ?auto_58175 ?auto_58180 ) ) ( not ( = ?auto_58175 ?auto_58179 ) ) ( not ( = ?auto_58176 ?auto_58177 ) ) ( not ( = ?auto_58176 ?auto_58174 ) ) ( not ( = ?auto_58176 ?auto_58178 ) ) ( not ( = ?auto_58176 ?auto_58180 ) ) ( not ( = ?auto_58176 ?auto_58179 ) ) ( not ( = ?auto_58177 ?auto_58174 ) ) ( not ( = ?auto_58177 ?auto_58178 ) ) ( not ( = ?auto_58177 ?auto_58180 ) ) ( not ( = ?auto_58177 ?auto_58179 ) ) ( not ( = ?auto_58174 ?auto_58178 ) ) ( not ( = ?auto_58174 ?auto_58180 ) ) ( not ( = ?auto_58174 ?auto_58179 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58178 ?auto_58180 ?auto_58179 )
      ( MAKE-6CRATE-VERIFY ?auto_58175 ?auto_58176 ?auto_58177 ?auto_58174 ?auto_58178 ?auto_58180 ?auto_58179 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58238 - SURFACE
      ?auto_58239 - SURFACE
      ?auto_58240 - SURFACE
      ?auto_58237 - SURFACE
      ?auto_58241 - SURFACE
      ?auto_58243 - SURFACE
      ?auto_58242 - SURFACE
    )
    :vars
    (
      ?auto_58249 - HOIST
      ?auto_58244 - PLACE
      ?auto_58247 - TRUCK
      ?auto_58245 - PLACE
      ?auto_58248 - HOIST
      ?auto_58246 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58249 ?auto_58244 ) ( SURFACE-AT ?auto_58243 ?auto_58244 ) ( CLEAR ?auto_58243 ) ( IS-CRATE ?auto_58242 ) ( not ( = ?auto_58243 ?auto_58242 ) ) ( AVAILABLE ?auto_58249 ) ( ON ?auto_58243 ?auto_58241 ) ( not ( = ?auto_58241 ?auto_58243 ) ) ( not ( = ?auto_58241 ?auto_58242 ) ) ( TRUCK-AT ?auto_58247 ?auto_58245 ) ( not ( = ?auto_58245 ?auto_58244 ) ) ( HOIST-AT ?auto_58248 ?auto_58245 ) ( not ( = ?auto_58249 ?auto_58248 ) ) ( AVAILABLE ?auto_58248 ) ( SURFACE-AT ?auto_58242 ?auto_58245 ) ( ON ?auto_58242 ?auto_58246 ) ( CLEAR ?auto_58242 ) ( not ( = ?auto_58243 ?auto_58246 ) ) ( not ( = ?auto_58242 ?auto_58246 ) ) ( not ( = ?auto_58241 ?auto_58246 ) ) ( ON ?auto_58239 ?auto_58238 ) ( ON ?auto_58240 ?auto_58239 ) ( ON ?auto_58237 ?auto_58240 ) ( ON ?auto_58241 ?auto_58237 ) ( not ( = ?auto_58238 ?auto_58239 ) ) ( not ( = ?auto_58238 ?auto_58240 ) ) ( not ( = ?auto_58238 ?auto_58237 ) ) ( not ( = ?auto_58238 ?auto_58241 ) ) ( not ( = ?auto_58238 ?auto_58243 ) ) ( not ( = ?auto_58238 ?auto_58242 ) ) ( not ( = ?auto_58238 ?auto_58246 ) ) ( not ( = ?auto_58239 ?auto_58240 ) ) ( not ( = ?auto_58239 ?auto_58237 ) ) ( not ( = ?auto_58239 ?auto_58241 ) ) ( not ( = ?auto_58239 ?auto_58243 ) ) ( not ( = ?auto_58239 ?auto_58242 ) ) ( not ( = ?auto_58239 ?auto_58246 ) ) ( not ( = ?auto_58240 ?auto_58237 ) ) ( not ( = ?auto_58240 ?auto_58241 ) ) ( not ( = ?auto_58240 ?auto_58243 ) ) ( not ( = ?auto_58240 ?auto_58242 ) ) ( not ( = ?auto_58240 ?auto_58246 ) ) ( not ( = ?auto_58237 ?auto_58241 ) ) ( not ( = ?auto_58237 ?auto_58243 ) ) ( not ( = ?auto_58237 ?auto_58242 ) ) ( not ( = ?auto_58237 ?auto_58246 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58241 ?auto_58243 ?auto_58242 )
      ( MAKE-6CRATE-VERIFY ?auto_58238 ?auto_58239 ?auto_58240 ?auto_58237 ?auto_58241 ?auto_58243 ?auto_58242 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58302 - SURFACE
      ?auto_58303 - SURFACE
      ?auto_58304 - SURFACE
      ?auto_58301 - SURFACE
      ?auto_58305 - SURFACE
      ?auto_58307 - SURFACE
      ?auto_58306 - SURFACE
    )
    :vars
    (
      ?auto_58310 - HOIST
      ?auto_58312 - PLACE
      ?auto_58309 - PLACE
      ?auto_58308 - HOIST
      ?auto_58311 - SURFACE
      ?auto_58313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58310 ?auto_58312 ) ( SURFACE-AT ?auto_58307 ?auto_58312 ) ( CLEAR ?auto_58307 ) ( IS-CRATE ?auto_58306 ) ( not ( = ?auto_58307 ?auto_58306 ) ) ( AVAILABLE ?auto_58310 ) ( ON ?auto_58307 ?auto_58305 ) ( not ( = ?auto_58305 ?auto_58307 ) ) ( not ( = ?auto_58305 ?auto_58306 ) ) ( not ( = ?auto_58309 ?auto_58312 ) ) ( HOIST-AT ?auto_58308 ?auto_58309 ) ( not ( = ?auto_58310 ?auto_58308 ) ) ( AVAILABLE ?auto_58308 ) ( SURFACE-AT ?auto_58306 ?auto_58309 ) ( ON ?auto_58306 ?auto_58311 ) ( CLEAR ?auto_58306 ) ( not ( = ?auto_58307 ?auto_58311 ) ) ( not ( = ?auto_58306 ?auto_58311 ) ) ( not ( = ?auto_58305 ?auto_58311 ) ) ( TRUCK-AT ?auto_58313 ?auto_58312 ) ( ON ?auto_58303 ?auto_58302 ) ( ON ?auto_58304 ?auto_58303 ) ( ON ?auto_58301 ?auto_58304 ) ( ON ?auto_58305 ?auto_58301 ) ( not ( = ?auto_58302 ?auto_58303 ) ) ( not ( = ?auto_58302 ?auto_58304 ) ) ( not ( = ?auto_58302 ?auto_58301 ) ) ( not ( = ?auto_58302 ?auto_58305 ) ) ( not ( = ?auto_58302 ?auto_58307 ) ) ( not ( = ?auto_58302 ?auto_58306 ) ) ( not ( = ?auto_58302 ?auto_58311 ) ) ( not ( = ?auto_58303 ?auto_58304 ) ) ( not ( = ?auto_58303 ?auto_58301 ) ) ( not ( = ?auto_58303 ?auto_58305 ) ) ( not ( = ?auto_58303 ?auto_58307 ) ) ( not ( = ?auto_58303 ?auto_58306 ) ) ( not ( = ?auto_58303 ?auto_58311 ) ) ( not ( = ?auto_58304 ?auto_58301 ) ) ( not ( = ?auto_58304 ?auto_58305 ) ) ( not ( = ?auto_58304 ?auto_58307 ) ) ( not ( = ?auto_58304 ?auto_58306 ) ) ( not ( = ?auto_58304 ?auto_58311 ) ) ( not ( = ?auto_58301 ?auto_58305 ) ) ( not ( = ?auto_58301 ?auto_58307 ) ) ( not ( = ?auto_58301 ?auto_58306 ) ) ( not ( = ?auto_58301 ?auto_58311 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58305 ?auto_58307 ?auto_58306 )
      ( MAKE-6CRATE-VERIFY ?auto_58302 ?auto_58303 ?auto_58304 ?auto_58301 ?auto_58305 ?auto_58307 ?auto_58306 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58366 - SURFACE
      ?auto_58367 - SURFACE
      ?auto_58368 - SURFACE
      ?auto_58365 - SURFACE
      ?auto_58369 - SURFACE
      ?auto_58371 - SURFACE
      ?auto_58370 - SURFACE
    )
    :vars
    (
      ?auto_58374 - HOIST
      ?auto_58377 - PLACE
      ?auto_58376 - PLACE
      ?auto_58373 - HOIST
      ?auto_58372 - SURFACE
      ?auto_58375 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58374 ?auto_58377 ) ( IS-CRATE ?auto_58370 ) ( not ( = ?auto_58371 ?auto_58370 ) ) ( not ( = ?auto_58369 ?auto_58371 ) ) ( not ( = ?auto_58369 ?auto_58370 ) ) ( not ( = ?auto_58376 ?auto_58377 ) ) ( HOIST-AT ?auto_58373 ?auto_58376 ) ( not ( = ?auto_58374 ?auto_58373 ) ) ( AVAILABLE ?auto_58373 ) ( SURFACE-AT ?auto_58370 ?auto_58376 ) ( ON ?auto_58370 ?auto_58372 ) ( CLEAR ?auto_58370 ) ( not ( = ?auto_58371 ?auto_58372 ) ) ( not ( = ?auto_58370 ?auto_58372 ) ) ( not ( = ?auto_58369 ?auto_58372 ) ) ( TRUCK-AT ?auto_58375 ?auto_58377 ) ( SURFACE-AT ?auto_58369 ?auto_58377 ) ( CLEAR ?auto_58369 ) ( LIFTING ?auto_58374 ?auto_58371 ) ( IS-CRATE ?auto_58371 ) ( ON ?auto_58367 ?auto_58366 ) ( ON ?auto_58368 ?auto_58367 ) ( ON ?auto_58365 ?auto_58368 ) ( ON ?auto_58369 ?auto_58365 ) ( not ( = ?auto_58366 ?auto_58367 ) ) ( not ( = ?auto_58366 ?auto_58368 ) ) ( not ( = ?auto_58366 ?auto_58365 ) ) ( not ( = ?auto_58366 ?auto_58369 ) ) ( not ( = ?auto_58366 ?auto_58371 ) ) ( not ( = ?auto_58366 ?auto_58370 ) ) ( not ( = ?auto_58366 ?auto_58372 ) ) ( not ( = ?auto_58367 ?auto_58368 ) ) ( not ( = ?auto_58367 ?auto_58365 ) ) ( not ( = ?auto_58367 ?auto_58369 ) ) ( not ( = ?auto_58367 ?auto_58371 ) ) ( not ( = ?auto_58367 ?auto_58370 ) ) ( not ( = ?auto_58367 ?auto_58372 ) ) ( not ( = ?auto_58368 ?auto_58365 ) ) ( not ( = ?auto_58368 ?auto_58369 ) ) ( not ( = ?auto_58368 ?auto_58371 ) ) ( not ( = ?auto_58368 ?auto_58370 ) ) ( not ( = ?auto_58368 ?auto_58372 ) ) ( not ( = ?auto_58365 ?auto_58369 ) ) ( not ( = ?auto_58365 ?auto_58371 ) ) ( not ( = ?auto_58365 ?auto_58370 ) ) ( not ( = ?auto_58365 ?auto_58372 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58369 ?auto_58371 ?auto_58370 )
      ( MAKE-6CRATE-VERIFY ?auto_58366 ?auto_58367 ?auto_58368 ?auto_58365 ?auto_58369 ?auto_58371 ?auto_58370 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58430 - SURFACE
      ?auto_58431 - SURFACE
      ?auto_58432 - SURFACE
      ?auto_58429 - SURFACE
      ?auto_58433 - SURFACE
      ?auto_58435 - SURFACE
      ?auto_58434 - SURFACE
    )
    :vars
    (
      ?auto_58436 - HOIST
      ?auto_58439 - PLACE
      ?auto_58438 - PLACE
      ?auto_58440 - HOIST
      ?auto_58441 - SURFACE
      ?auto_58437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58436 ?auto_58439 ) ( IS-CRATE ?auto_58434 ) ( not ( = ?auto_58435 ?auto_58434 ) ) ( not ( = ?auto_58433 ?auto_58435 ) ) ( not ( = ?auto_58433 ?auto_58434 ) ) ( not ( = ?auto_58438 ?auto_58439 ) ) ( HOIST-AT ?auto_58440 ?auto_58438 ) ( not ( = ?auto_58436 ?auto_58440 ) ) ( AVAILABLE ?auto_58440 ) ( SURFACE-AT ?auto_58434 ?auto_58438 ) ( ON ?auto_58434 ?auto_58441 ) ( CLEAR ?auto_58434 ) ( not ( = ?auto_58435 ?auto_58441 ) ) ( not ( = ?auto_58434 ?auto_58441 ) ) ( not ( = ?auto_58433 ?auto_58441 ) ) ( TRUCK-AT ?auto_58437 ?auto_58439 ) ( SURFACE-AT ?auto_58433 ?auto_58439 ) ( CLEAR ?auto_58433 ) ( IS-CRATE ?auto_58435 ) ( AVAILABLE ?auto_58436 ) ( IN ?auto_58435 ?auto_58437 ) ( ON ?auto_58431 ?auto_58430 ) ( ON ?auto_58432 ?auto_58431 ) ( ON ?auto_58429 ?auto_58432 ) ( ON ?auto_58433 ?auto_58429 ) ( not ( = ?auto_58430 ?auto_58431 ) ) ( not ( = ?auto_58430 ?auto_58432 ) ) ( not ( = ?auto_58430 ?auto_58429 ) ) ( not ( = ?auto_58430 ?auto_58433 ) ) ( not ( = ?auto_58430 ?auto_58435 ) ) ( not ( = ?auto_58430 ?auto_58434 ) ) ( not ( = ?auto_58430 ?auto_58441 ) ) ( not ( = ?auto_58431 ?auto_58432 ) ) ( not ( = ?auto_58431 ?auto_58429 ) ) ( not ( = ?auto_58431 ?auto_58433 ) ) ( not ( = ?auto_58431 ?auto_58435 ) ) ( not ( = ?auto_58431 ?auto_58434 ) ) ( not ( = ?auto_58431 ?auto_58441 ) ) ( not ( = ?auto_58432 ?auto_58429 ) ) ( not ( = ?auto_58432 ?auto_58433 ) ) ( not ( = ?auto_58432 ?auto_58435 ) ) ( not ( = ?auto_58432 ?auto_58434 ) ) ( not ( = ?auto_58432 ?auto_58441 ) ) ( not ( = ?auto_58429 ?auto_58433 ) ) ( not ( = ?auto_58429 ?auto_58435 ) ) ( not ( = ?auto_58429 ?auto_58434 ) ) ( not ( = ?auto_58429 ?auto_58441 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58433 ?auto_58435 ?auto_58434 )
      ( MAKE-6CRATE-VERIFY ?auto_58430 ?auto_58431 ?auto_58432 ?auto_58429 ?auto_58433 ?auto_58435 ?auto_58434 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58494 - SURFACE
      ?auto_58495 - SURFACE
      ?auto_58496 - SURFACE
      ?auto_58493 - SURFACE
      ?auto_58497 - SURFACE
      ?auto_58499 - SURFACE
      ?auto_58498 - SURFACE
    )
    :vars
    (
      ?auto_58501 - HOIST
      ?auto_58502 - PLACE
      ?auto_58503 - PLACE
      ?auto_58500 - HOIST
      ?auto_58504 - SURFACE
      ?auto_58505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58501 ?auto_58502 ) ( IS-CRATE ?auto_58498 ) ( not ( = ?auto_58499 ?auto_58498 ) ) ( not ( = ?auto_58497 ?auto_58499 ) ) ( not ( = ?auto_58497 ?auto_58498 ) ) ( not ( = ?auto_58503 ?auto_58502 ) ) ( HOIST-AT ?auto_58500 ?auto_58503 ) ( not ( = ?auto_58501 ?auto_58500 ) ) ( AVAILABLE ?auto_58500 ) ( SURFACE-AT ?auto_58498 ?auto_58503 ) ( ON ?auto_58498 ?auto_58504 ) ( CLEAR ?auto_58498 ) ( not ( = ?auto_58499 ?auto_58504 ) ) ( not ( = ?auto_58498 ?auto_58504 ) ) ( not ( = ?auto_58497 ?auto_58504 ) ) ( SURFACE-AT ?auto_58497 ?auto_58502 ) ( CLEAR ?auto_58497 ) ( IS-CRATE ?auto_58499 ) ( AVAILABLE ?auto_58501 ) ( IN ?auto_58499 ?auto_58505 ) ( TRUCK-AT ?auto_58505 ?auto_58503 ) ( ON ?auto_58495 ?auto_58494 ) ( ON ?auto_58496 ?auto_58495 ) ( ON ?auto_58493 ?auto_58496 ) ( ON ?auto_58497 ?auto_58493 ) ( not ( = ?auto_58494 ?auto_58495 ) ) ( not ( = ?auto_58494 ?auto_58496 ) ) ( not ( = ?auto_58494 ?auto_58493 ) ) ( not ( = ?auto_58494 ?auto_58497 ) ) ( not ( = ?auto_58494 ?auto_58499 ) ) ( not ( = ?auto_58494 ?auto_58498 ) ) ( not ( = ?auto_58494 ?auto_58504 ) ) ( not ( = ?auto_58495 ?auto_58496 ) ) ( not ( = ?auto_58495 ?auto_58493 ) ) ( not ( = ?auto_58495 ?auto_58497 ) ) ( not ( = ?auto_58495 ?auto_58499 ) ) ( not ( = ?auto_58495 ?auto_58498 ) ) ( not ( = ?auto_58495 ?auto_58504 ) ) ( not ( = ?auto_58496 ?auto_58493 ) ) ( not ( = ?auto_58496 ?auto_58497 ) ) ( not ( = ?auto_58496 ?auto_58499 ) ) ( not ( = ?auto_58496 ?auto_58498 ) ) ( not ( = ?auto_58496 ?auto_58504 ) ) ( not ( = ?auto_58493 ?auto_58497 ) ) ( not ( = ?auto_58493 ?auto_58499 ) ) ( not ( = ?auto_58493 ?auto_58498 ) ) ( not ( = ?auto_58493 ?auto_58504 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58497 ?auto_58499 ?auto_58498 )
      ( MAKE-6CRATE-VERIFY ?auto_58494 ?auto_58495 ?auto_58496 ?auto_58493 ?auto_58497 ?auto_58499 ?auto_58498 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58558 - SURFACE
      ?auto_58559 - SURFACE
      ?auto_58560 - SURFACE
      ?auto_58557 - SURFACE
      ?auto_58561 - SURFACE
      ?auto_58563 - SURFACE
      ?auto_58562 - SURFACE
    )
    :vars
    (
      ?auto_58568 - HOIST
      ?auto_58564 - PLACE
      ?auto_58566 - PLACE
      ?auto_58567 - HOIST
      ?auto_58569 - SURFACE
      ?auto_58565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58568 ?auto_58564 ) ( IS-CRATE ?auto_58562 ) ( not ( = ?auto_58563 ?auto_58562 ) ) ( not ( = ?auto_58561 ?auto_58563 ) ) ( not ( = ?auto_58561 ?auto_58562 ) ) ( not ( = ?auto_58566 ?auto_58564 ) ) ( HOIST-AT ?auto_58567 ?auto_58566 ) ( not ( = ?auto_58568 ?auto_58567 ) ) ( SURFACE-AT ?auto_58562 ?auto_58566 ) ( ON ?auto_58562 ?auto_58569 ) ( CLEAR ?auto_58562 ) ( not ( = ?auto_58563 ?auto_58569 ) ) ( not ( = ?auto_58562 ?auto_58569 ) ) ( not ( = ?auto_58561 ?auto_58569 ) ) ( SURFACE-AT ?auto_58561 ?auto_58564 ) ( CLEAR ?auto_58561 ) ( IS-CRATE ?auto_58563 ) ( AVAILABLE ?auto_58568 ) ( TRUCK-AT ?auto_58565 ?auto_58566 ) ( LIFTING ?auto_58567 ?auto_58563 ) ( ON ?auto_58559 ?auto_58558 ) ( ON ?auto_58560 ?auto_58559 ) ( ON ?auto_58557 ?auto_58560 ) ( ON ?auto_58561 ?auto_58557 ) ( not ( = ?auto_58558 ?auto_58559 ) ) ( not ( = ?auto_58558 ?auto_58560 ) ) ( not ( = ?auto_58558 ?auto_58557 ) ) ( not ( = ?auto_58558 ?auto_58561 ) ) ( not ( = ?auto_58558 ?auto_58563 ) ) ( not ( = ?auto_58558 ?auto_58562 ) ) ( not ( = ?auto_58558 ?auto_58569 ) ) ( not ( = ?auto_58559 ?auto_58560 ) ) ( not ( = ?auto_58559 ?auto_58557 ) ) ( not ( = ?auto_58559 ?auto_58561 ) ) ( not ( = ?auto_58559 ?auto_58563 ) ) ( not ( = ?auto_58559 ?auto_58562 ) ) ( not ( = ?auto_58559 ?auto_58569 ) ) ( not ( = ?auto_58560 ?auto_58557 ) ) ( not ( = ?auto_58560 ?auto_58561 ) ) ( not ( = ?auto_58560 ?auto_58563 ) ) ( not ( = ?auto_58560 ?auto_58562 ) ) ( not ( = ?auto_58560 ?auto_58569 ) ) ( not ( = ?auto_58557 ?auto_58561 ) ) ( not ( = ?auto_58557 ?auto_58563 ) ) ( not ( = ?auto_58557 ?auto_58562 ) ) ( not ( = ?auto_58557 ?auto_58569 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58561 ?auto_58563 ?auto_58562 )
      ( MAKE-6CRATE-VERIFY ?auto_58558 ?auto_58559 ?auto_58560 ?auto_58557 ?auto_58561 ?auto_58563 ?auto_58562 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58627 - SURFACE
      ?auto_58628 - SURFACE
      ?auto_58629 - SURFACE
      ?auto_58626 - SURFACE
      ?auto_58630 - SURFACE
      ?auto_58632 - SURFACE
      ?auto_58631 - SURFACE
    )
    :vars
    (
      ?auto_58635 - HOIST
      ?auto_58638 - PLACE
      ?auto_58637 - PLACE
      ?auto_58634 - HOIST
      ?auto_58639 - SURFACE
      ?auto_58636 - TRUCK
      ?auto_58633 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58635 ?auto_58638 ) ( IS-CRATE ?auto_58631 ) ( not ( = ?auto_58632 ?auto_58631 ) ) ( not ( = ?auto_58630 ?auto_58632 ) ) ( not ( = ?auto_58630 ?auto_58631 ) ) ( not ( = ?auto_58637 ?auto_58638 ) ) ( HOIST-AT ?auto_58634 ?auto_58637 ) ( not ( = ?auto_58635 ?auto_58634 ) ) ( SURFACE-AT ?auto_58631 ?auto_58637 ) ( ON ?auto_58631 ?auto_58639 ) ( CLEAR ?auto_58631 ) ( not ( = ?auto_58632 ?auto_58639 ) ) ( not ( = ?auto_58631 ?auto_58639 ) ) ( not ( = ?auto_58630 ?auto_58639 ) ) ( SURFACE-AT ?auto_58630 ?auto_58638 ) ( CLEAR ?auto_58630 ) ( IS-CRATE ?auto_58632 ) ( AVAILABLE ?auto_58635 ) ( TRUCK-AT ?auto_58636 ?auto_58637 ) ( AVAILABLE ?auto_58634 ) ( SURFACE-AT ?auto_58632 ?auto_58637 ) ( ON ?auto_58632 ?auto_58633 ) ( CLEAR ?auto_58632 ) ( not ( = ?auto_58632 ?auto_58633 ) ) ( not ( = ?auto_58631 ?auto_58633 ) ) ( not ( = ?auto_58630 ?auto_58633 ) ) ( not ( = ?auto_58639 ?auto_58633 ) ) ( ON ?auto_58628 ?auto_58627 ) ( ON ?auto_58629 ?auto_58628 ) ( ON ?auto_58626 ?auto_58629 ) ( ON ?auto_58630 ?auto_58626 ) ( not ( = ?auto_58627 ?auto_58628 ) ) ( not ( = ?auto_58627 ?auto_58629 ) ) ( not ( = ?auto_58627 ?auto_58626 ) ) ( not ( = ?auto_58627 ?auto_58630 ) ) ( not ( = ?auto_58627 ?auto_58632 ) ) ( not ( = ?auto_58627 ?auto_58631 ) ) ( not ( = ?auto_58627 ?auto_58639 ) ) ( not ( = ?auto_58627 ?auto_58633 ) ) ( not ( = ?auto_58628 ?auto_58629 ) ) ( not ( = ?auto_58628 ?auto_58626 ) ) ( not ( = ?auto_58628 ?auto_58630 ) ) ( not ( = ?auto_58628 ?auto_58632 ) ) ( not ( = ?auto_58628 ?auto_58631 ) ) ( not ( = ?auto_58628 ?auto_58639 ) ) ( not ( = ?auto_58628 ?auto_58633 ) ) ( not ( = ?auto_58629 ?auto_58626 ) ) ( not ( = ?auto_58629 ?auto_58630 ) ) ( not ( = ?auto_58629 ?auto_58632 ) ) ( not ( = ?auto_58629 ?auto_58631 ) ) ( not ( = ?auto_58629 ?auto_58639 ) ) ( not ( = ?auto_58629 ?auto_58633 ) ) ( not ( = ?auto_58626 ?auto_58630 ) ) ( not ( = ?auto_58626 ?auto_58632 ) ) ( not ( = ?auto_58626 ?auto_58631 ) ) ( not ( = ?auto_58626 ?auto_58639 ) ) ( not ( = ?auto_58626 ?auto_58633 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58630 ?auto_58632 ?auto_58631 )
      ( MAKE-6CRATE-VERIFY ?auto_58627 ?auto_58628 ?auto_58629 ?auto_58626 ?auto_58630 ?auto_58632 ?auto_58631 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58697 - SURFACE
      ?auto_58698 - SURFACE
      ?auto_58699 - SURFACE
      ?auto_58696 - SURFACE
      ?auto_58700 - SURFACE
      ?auto_58702 - SURFACE
      ?auto_58701 - SURFACE
    )
    :vars
    (
      ?auto_58703 - HOIST
      ?auto_58705 - PLACE
      ?auto_58709 - PLACE
      ?auto_58708 - HOIST
      ?auto_58704 - SURFACE
      ?auto_58707 - SURFACE
      ?auto_58706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58703 ?auto_58705 ) ( IS-CRATE ?auto_58701 ) ( not ( = ?auto_58702 ?auto_58701 ) ) ( not ( = ?auto_58700 ?auto_58702 ) ) ( not ( = ?auto_58700 ?auto_58701 ) ) ( not ( = ?auto_58709 ?auto_58705 ) ) ( HOIST-AT ?auto_58708 ?auto_58709 ) ( not ( = ?auto_58703 ?auto_58708 ) ) ( SURFACE-AT ?auto_58701 ?auto_58709 ) ( ON ?auto_58701 ?auto_58704 ) ( CLEAR ?auto_58701 ) ( not ( = ?auto_58702 ?auto_58704 ) ) ( not ( = ?auto_58701 ?auto_58704 ) ) ( not ( = ?auto_58700 ?auto_58704 ) ) ( SURFACE-AT ?auto_58700 ?auto_58705 ) ( CLEAR ?auto_58700 ) ( IS-CRATE ?auto_58702 ) ( AVAILABLE ?auto_58703 ) ( AVAILABLE ?auto_58708 ) ( SURFACE-AT ?auto_58702 ?auto_58709 ) ( ON ?auto_58702 ?auto_58707 ) ( CLEAR ?auto_58702 ) ( not ( = ?auto_58702 ?auto_58707 ) ) ( not ( = ?auto_58701 ?auto_58707 ) ) ( not ( = ?auto_58700 ?auto_58707 ) ) ( not ( = ?auto_58704 ?auto_58707 ) ) ( TRUCK-AT ?auto_58706 ?auto_58705 ) ( ON ?auto_58698 ?auto_58697 ) ( ON ?auto_58699 ?auto_58698 ) ( ON ?auto_58696 ?auto_58699 ) ( ON ?auto_58700 ?auto_58696 ) ( not ( = ?auto_58697 ?auto_58698 ) ) ( not ( = ?auto_58697 ?auto_58699 ) ) ( not ( = ?auto_58697 ?auto_58696 ) ) ( not ( = ?auto_58697 ?auto_58700 ) ) ( not ( = ?auto_58697 ?auto_58702 ) ) ( not ( = ?auto_58697 ?auto_58701 ) ) ( not ( = ?auto_58697 ?auto_58704 ) ) ( not ( = ?auto_58697 ?auto_58707 ) ) ( not ( = ?auto_58698 ?auto_58699 ) ) ( not ( = ?auto_58698 ?auto_58696 ) ) ( not ( = ?auto_58698 ?auto_58700 ) ) ( not ( = ?auto_58698 ?auto_58702 ) ) ( not ( = ?auto_58698 ?auto_58701 ) ) ( not ( = ?auto_58698 ?auto_58704 ) ) ( not ( = ?auto_58698 ?auto_58707 ) ) ( not ( = ?auto_58699 ?auto_58696 ) ) ( not ( = ?auto_58699 ?auto_58700 ) ) ( not ( = ?auto_58699 ?auto_58702 ) ) ( not ( = ?auto_58699 ?auto_58701 ) ) ( not ( = ?auto_58699 ?auto_58704 ) ) ( not ( = ?auto_58699 ?auto_58707 ) ) ( not ( = ?auto_58696 ?auto_58700 ) ) ( not ( = ?auto_58696 ?auto_58702 ) ) ( not ( = ?auto_58696 ?auto_58701 ) ) ( not ( = ?auto_58696 ?auto_58704 ) ) ( not ( = ?auto_58696 ?auto_58707 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58700 ?auto_58702 ?auto_58701 )
      ( MAKE-6CRATE-VERIFY ?auto_58697 ?auto_58698 ?auto_58699 ?auto_58696 ?auto_58700 ?auto_58702 ?auto_58701 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58769 - SURFACE
      ?auto_58770 - SURFACE
      ?auto_58771 - SURFACE
      ?auto_58768 - SURFACE
      ?auto_58772 - SURFACE
      ?auto_58774 - SURFACE
      ?auto_58773 - SURFACE
    )
    :vars
    (
      ?auto_58781 - HOIST
      ?auto_58780 - PLACE
      ?auto_58778 - PLACE
      ?auto_58779 - HOIST
      ?auto_58775 - SURFACE
      ?auto_58777 - SURFACE
      ?auto_58776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58781 ?auto_58780 ) ( IS-CRATE ?auto_58773 ) ( not ( = ?auto_58774 ?auto_58773 ) ) ( not ( = ?auto_58772 ?auto_58774 ) ) ( not ( = ?auto_58772 ?auto_58773 ) ) ( not ( = ?auto_58778 ?auto_58780 ) ) ( HOIST-AT ?auto_58779 ?auto_58778 ) ( not ( = ?auto_58781 ?auto_58779 ) ) ( SURFACE-AT ?auto_58773 ?auto_58778 ) ( ON ?auto_58773 ?auto_58775 ) ( CLEAR ?auto_58773 ) ( not ( = ?auto_58774 ?auto_58775 ) ) ( not ( = ?auto_58773 ?auto_58775 ) ) ( not ( = ?auto_58772 ?auto_58775 ) ) ( IS-CRATE ?auto_58774 ) ( AVAILABLE ?auto_58779 ) ( SURFACE-AT ?auto_58774 ?auto_58778 ) ( ON ?auto_58774 ?auto_58777 ) ( CLEAR ?auto_58774 ) ( not ( = ?auto_58774 ?auto_58777 ) ) ( not ( = ?auto_58773 ?auto_58777 ) ) ( not ( = ?auto_58772 ?auto_58777 ) ) ( not ( = ?auto_58775 ?auto_58777 ) ) ( TRUCK-AT ?auto_58776 ?auto_58780 ) ( SURFACE-AT ?auto_58768 ?auto_58780 ) ( CLEAR ?auto_58768 ) ( LIFTING ?auto_58781 ?auto_58772 ) ( IS-CRATE ?auto_58772 ) ( not ( = ?auto_58768 ?auto_58772 ) ) ( not ( = ?auto_58774 ?auto_58768 ) ) ( not ( = ?auto_58773 ?auto_58768 ) ) ( not ( = ?auto_58775 ?auto_58768 ) ) ( not ( = ?auto_58777 ?auto_58768 ) ) ( ON ?auto_58770 ?auto_58769 ) ( ON ?auto_58771 ?auto_58770 ) ( ON ?auto_58768 ?auto_58771 ) ( not ( = ?auto_58769 ?auto_58770 ) ) ( not ( = ?auto_58769 ?auto_58771 ) ) ( not ( = ?auto_58769 ?auto_58768 ) ) ( not ( = ?auto_58769 ?auto_58772 ) ) ( not ( = ?auto_58769 ?auto_58774 ) ) ( not ( = ?auto_58769 ?auto_58773 ) ) ( not ( = ?auto_58769 ?auto_58775 ) ) ( not ( = ?auto_58769 ?auto_58777 ) ) ( not ( = ?auto_58770 ?auto_58771 ) ) ( not ( = ?auto_58770 ?auto_58768 ) ) ( not ( = ?auto_58770 ?auto_58772 ) ) ( not ( = ?auto_58770 ?auto_58774 ) ) ( not ( = ?auto_58770 ?auto_58773 ) ) ( not ( = ?auto_58770 ?auto_58775 ) ) ( not ( = ?auto_58770 ?auto_58777 ) ) ( not ( = ?auto_58771 ?auto_58768 ) ) ( not ( = ?auto_58771 ?auto_58772 ) ) ( not ( = ?auto_58771 ?auto_58774 ) ) ( not ( = ?auto_58771 ?auto_58773 ) ) ( not ( = ?auto_58771 ?auto_58775 ) ) ( not ( = ?auto_58771 ?auto_58777 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58772 ?auto_58774 ?auto_58773 )
      ( MAKE-6CRATE-VERIFY ?auto_58769 ?auto_58770 ?auto_58771 ?auto_58768 ?auto_58772 ?auto_58774 ?auto_58773 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_58912 - SURFACE
      ?auto_58913 - SURFACE
    )
    :vars
    (
      ?auto_58915 - HOIST
      ?auto_58914 - PLACE
      ?auto_58919 - SURFACE
      ?auto_58921 - PLACE
      ?auto_58918 - HOIST
      ?auto_58917 - SURFACE
      ?auto_58920 - TRUCK
      ?auto_58916 - SURFACE
      ?auto_58922 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58915 ?auto_58914 ) ( IS-CRATE ?auto_58913 ) ( not ( = ?auto_58912 ?auto_58913 ) ) ( not ( = ?auto_58919 ?auto_58912 ) ) ( not ( = ?auto_58919 ?auto_58913 ) ) ( not ( = ?auto_58921 ?auto_58914 ) ) ( HOIST-AT ?auto_58918 ?auto_58921 ) ( not ( = ?auto_58915 ?auto_58918 ) ) ( SURFACE-AT ?auto_58913 ?auto_58921 ) ( ON ?auto_58913 ?auto_58917 ) ( CLEAR ?auto_58913 ) ( not ( = ?auto_58912 ?auto_58917 ) ) ( not ( = ?auto_58913 ?auto_58917 ) ) ( not ( = ?auto_58919 ?auto_58917 ) ) ( SURFACE-AT ?auto_58919 ?auto_58914 ) ( CLEAR ?auto_58919 ) ( IS-CRATE ?auto_58912 ) ( AVAILABLE ?auto_58915 ) ( TRUCK-AT ?auto_58920 ?auto_58921 ) ( SURFACE-AT ?auto_58912 ?auto_58921 ) ( ON ?auto_58912 ?auto_58916 ) ( CLEAR ?auto_58912 ) ( not ( = ?auto_58912 ?auto_58916 ) ) ( not ( = ?auto_58913 ?auto_58916 ) ) ( not ( = ?auto_58919 ?auto_58916 ) ) ( not ( = ?auto_58917 ?auto_58916 ) ) ( LIFTING ?auto_58918 ?auto_58922 ) ( IS-CRATE ?auto_58922 ) ( not ( = ?auto_58912 ?auto_58922 ) ) ( not ( = ?auto_58913 ?auto_58922 ) ) ( not ( = ?auto_58919 ?auto_58922 ) ) ( not ( = ?auto_58917 ?auto_58922 ) ) ( not ( = ?auto_58916 ?auto_58922 ) ) )
    :subtasks
    ( ( !LOAD ?auto_58918 ?auto_58922 ?auto_58920 ?auto_58921 )
      ( MAKE-1CRATE ?auto_58912 ?auto_58913 )
      ( MAKE-1CRATE-VERIFY ?auto_58912 ?auto_58913 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60384 - SURFACE
      ?auto_60385 - SURFACE
      ?auto_60386 - SURFACE
      ?auto_60383 - SURFACE
      ?auto_60387 - SURFACE
      ?auto_60389 - SURFACE
      ?auto_60388 - SURFACE
      ?auto_60390 - SURFACE
    )
    :vars
    (
      ?auto_60392 - HOIST
      ?auto_60391 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60392 ?auto_60391 ) ( SURFACE-AT ?auto_60388 ?auto_60391 ) ( CLEAR ?auto_60388 ) ( LIFTING ?auto_60392 ?auto_60390 ) ( IS-CRATE ?auto_60390 ) ( not ( = ?auto_60388 ?auto_60390 ) ) ( ON ?auto_60385 ?auto_60384 ) ( ON ?auto_60386 ?auto_60385 ) ( ON ?auto_60383 ?auto_60386 ) ( ON ?auto_60387 ?auto_60383 ) ( ON ?auto_60389 ?auto_60387 ) ( ON ?auto_60388 ?auto_60389 ) ( not ( = ?auto_60384 ?auto_60385 ) ) ( not ( = ?auto_60384 ?auto_60386 ) ) ( not ( = ?auto_60384 ?auto_60383 ) ) ( not ( = ?auto_60384 ?auto_60387 ) ) ( not ( = ?auto_60384 ?auto_60389 ) ) ( not ( = ?auto_60384 ?auto_60388 ) ) ( not ( = ?auto_60384 ?auto_60390 ) ) ( not ( = ?auto_60385 ?auto_60386 ) ) ( not ( = ?auto_60385 ?auto_60383 ) ) ( not ( = ?auto_60385 ?auto_60387 ) ) ( not ( = ?auto_60385 ?auto_60389 ) ) ( not ( = ?auto_60385 ?auto_60388 ) ) ( not ( = ?auto_60385 ?auto_60390 ) ) ( not ( = ?auto_60386 ?auto_60383 ) ) ( not ( = ?auto_60386 ?auto_60387 ) ) ( not ( = ?auto_60386 ?auto_60389 ) ) ( not ( = ?auto_60386 ?auto_60388 ) ) ( not ( = ?auto_60386 ?auto_60390 ) ) ( not ( = ?auto_60383 ?auto_60387 ) ) ( not ( = ?auto_60383 ?auto_60389 ) ) ( not ( = ?auto_60383 ?auto_60388 ) ) ( not ( = ?auto_60383 ?auto_60390 ) ) ( not ( = ?auto_60387 ?auto_60389 ) ) ( not ( = ?auto_60387 ?auto_60388 ) ) ( not ( = ?auto_60387 ?auto_60390 ) ) ( not ( = ?auto_60389 ?auto_60388 ) ) ( not ( = ?auto_60389 ?auto_60390 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_60388 ?auto_60390 )
      ( MAKE-7CRATE-VERIFY ?auto_60384 ?auto_60385 ?auto_60386 ?auto_60383 ?auto_60387 ?auto_60389 ?auto_60388 ?auto_60390 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60439 - SURFACE
      ?auto_60440 - SURFACE
      ?auto_60441 - SURFACE
      ?auto_60438 - SURFACE
      ?auto_60442 - SURFACE
      ?auto_60444 - SURFACE
      ?auto_60443 - SURFACE
      ?auto_60445 - SURFACE
    )
    :vars
    (
      ?auto_60448 - HOIST
      ?auto_60447 - PLACE
      ?auto_60446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60448 ?auto_60447 ) ( SURFACE-AT ?auto_60443 ?auto_60447 ) ( CLEAR ?auto_60443 ) ( IS-CRATE ?auto_60445 ) ( not ( = ?auto_60443 ?auto_60445 ) ) ( TRUCK-AT ?auto_60446 ?auto_60447 ) ( AVAILABLE ?auto_60448 ) ( IN ?auto_60445 ?auto_60446 ) ( ON ?auto_60443 ?auto_60444 ) ( not ( = ?auto_60444 ?auto_60443 ) ) ( not ( = ?auto_60444 ?auto_60445 ) ) ( ON ?auto_60440 ?auto_60439 ) ( ON ?auto_60441 ?auto_60440 ) ( ON ?auto_60438 ?auto_60441 ) ( ON ?auto_60442 ?auto_60438 ) ( ON ?auto_60444 ?auto_60442 ) ( not ( = ?auto_60439 ?auto_60440 ) ) ( not ( = ?auto_60439 ?auto_60441 ) ) ( not ( = ?auto_60439 ?auto_60438 ) ) ( not ( = ?auto_60439 ?auto_60442 ) ) ( not ( = ?auto_60439 ?auto_60444 ) ) ( not ( = ?auto_60439 ?auto_60443 ) ) ( not ( = ?auto_60439 ?auto_60445 ) ) ( not ( = ?auto_60440 ?auto_60441 ) ) ( not ( = ?auto_60440 ?auto_60438 ) ) ( not ( = ?auto_60440 ?auto_60442 ) ) ( not ( = ?auto_60440 ?auto_60444 ) ) ( not ( = ?auto_60440 ?auto_60443 ) ) ( not ( = ?auto_60440 ?auto_60445 ) ) ( not ( = ?auto_60441 ?auto_60438 ) ) ( not ( = ?auto_60441 ?auto_60442 ) ) ( not ( = ?auto_60441 ?auto_60444 ) ) ( not ( = ?auto_60441 ?auto_60443 ) ) ( not ( = ?auto_60441 ?auto_60445 ) ) ( not ( = ?auto_60438 ?auto_60442 ) ) ( not ( = ?auto_60438 ?auto_60444 ) ) ( not ( = ?auto_60438 ?auto_60443 ) ) ( not ( = ?auto_60438 ?auto_60445 ) ) ( not ( = ?auto_60442 ?auto_60444 ) ) ( not ( = ?auto_60442 ?auto_60443 ) ) ( not ( = ?auto_60442 ?auto_60445 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_60444 ?auto_60443 ?auto_60445 )
      ( MAKE-7CRATE-VERIFY ?auto_60439 ?auto_60440 ?auto_60441 ?auto_60438 ?auto_60442 ?auto_60444 ?auto_60443 ?auto_60445 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60502 - SURFACE
      ?auto_60503 - SURFACE
      ?auto_60504 - SURFACE
      ?auto_60501 - SURFACE
      ?auto_60505 - SURFACE
      ?auto_60507 - SURFACE
      ?auto_60506 - SURFACE
      ?auto_60508 - SURFACE
    )
    :vars
    (
      ?auto_60511 - HOIST
      ?auto_60510 - PLACE
      ?auto_60509 - TRUCK
      ?auto_60512 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60511 ?auto_60510 ) ( SURFACE-AT ?auto_60506 ?auto_60510 ) ( CLEAR ?auto_60506 ) ( IS-CRATE ?auto_60508 ) ( not ( = ?auto_60506 ?auto_60508 ) ) ( AVAILABLE ?auto_60511 ) ( IN ?auto_60508 ?auto_60509 ) ( ON ?auto_60506 ?auto_60507 ) ( not ( = ?auto_60507 ?auto_60506 ) ) ( not ( = ?auto_60507 ?auto_60508 ) ) ( TRUCK-AT ?auto_60509 ?auto_60512 ) ( not ( = ?auto_60512 ?auto_60510 ) ) ( ON ?auto_60503 ?auto_60502 ) ( ON ?auto_60504 ?auto_60503 ) ( ON ?auto_60501 ?auto_60504 ) ( ON ?auto_60505 ?auto_60501 ) ( ON ?auto_60507 ?auto_60505 ) ( not ( = ?auto_60502 ?auto_60503 ) ) ( not ( = ?auto_60502 ?auto_60504 ) ) ( not ( = ?auto_60502 ?auto_60501 ) ) ( not ( = ?auto_60502 ?auto_60505 ) ) ( not ( = ?auto_60502 ?auto_60507 ) ) ( not ( = ?auto_60502 ?auto_60506 ) ) ( not ( = ?auto_60502 ?auto_60508 ) ) ( not ( = ?auto_60503 ?auto_60504 ) ) ( not ( = ?auto_60503 ?auto_60501 ) ) ( not ( = ?auto_60503 ?auto_60505 ) ) ( not ( = ?auto_60503 ?auto_60507 ) ) ( not ( = ?auto_60503 ?auto_60506 ) ) ( not ( = ?auto_60503 ?auto_60508 ) ) ( not ( = ?auto_60504 ?auto_60501 ) ) ( not ( = ?auto_60504 ?auto_60505 ) ) ( not ( = ?auto_60504 ?auto_60507 ) ) ( not ( = ?auto_60504 ?auto_60506 ) ) ( not ( = ?auto_60504 ?auto_60508 ) ) ( not ( = ?auto_60501 ?auto_60505 ) ) ( not ( = ?auto_60501 ?auto_60507 ) ) ( not ( = ?auto_60501 ?auto_60506 ) ) ( not ( = ?auto_60501 ?auto_60508 ) ) ( not ( = ?auto_60505 ?auto_60507 ) ) ( not ( = ?auto_60505 ?auto_60506 ) ) ( not ( = ?auto_60505 ?auto_60508 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_60507 ?auto_60506 ?auto_60508 )
      ( MAKE-7CRATE-VERIFY ?auto_60502 ?auto_60503 ?auto_60504 ?auto_60501 ?auto_60505 ?auto_60507 ?auto_60506 ?auto_60508 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60572 - SURFACE
      ?auto_60573 - SURFACE
      ?auto_60574 - SURFACE
      ?auto_60571 - SURFACE
      ?auto_60575 - SURFACE
      ?auto_60577 - SURFACE
      ?auto_60576 - SURFACE
      ?auto_60578 - SURFACE
    )
    :vars
    (
      ?auto_60580 - HOIST
      ?auto_60583 - PLACE
      ?auto_60581 - TRUCK
      ?auto_60579 - PLACE
      ?auto_60582 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_60580 ?auto_60583 ) ( SURFACE-AT ?auto_60576 ?auto_60583 ) ( CLEAR ?auto_60576 ) ( IS-CRATE ?auto_60578 ) ( not ( = ?auto_60576 ?auto_60578 ) ) ( AVAILABLE ?auto_60580 ) ( ON ?auto_60576 ?auto_60577 ) ( not ( = ?auto_60577 ?auto_60576 ) ) ( not ( = ?auto_60577 ?auto_60578 ) ) ( TRUCK-AT ?auto_60581 ?auto_60579 ) ( not ( = ?auto_60579 ?auto_60583 ) ) ( HOIST-AT ?auto_60582 ?auto_60579 ) ( LIFTING ?auto_60582 ?auto_60578 ) ( not ( = ?auto_60580 ?auto_60582 ) ) ( ON ?auto_60573 ?auto_60572 ) ( ON ?auto_60574 ?auto_60573 ) ( ON ?auto_60571 ?auto_60574 ) ( ON ?auto_60575 ?auto_60571 ) ( ON ?auto_60577 ?auto_60575 ) ( not ( = ?auto_60572 ?auto_60573 ) ) ( not ( = ?auto_60572 ?auto_60574 ) ) ( not ( = ?auto_60572 ?auto_60571 ) ) ( not ( = ?auto_60572 ?auto_60575 ) ) ( not ( = ?auto_60572 ?auto_60577 ) ) ( not ( = ?auto_60572 ?auto_60576 ) ) ( not ( = ?auto_60572 ?auto_60578 ) ) ( not ( = ?auto_60573 ?auto_60574 ) ) ( not ( = ?auto_60573 ?auto_60571 ) ) ( not ( = ?auto_60573 ?auto_60575 ) ) ( not ( = ?auto_60573 ?auto_60577 ) ) ( not ( = ?auto_60573 ?auto_60576 ) ) ( not ( = ?auto_60573 ?auto_60578 ) ) ( not ( = ?auto_60574 ?auto_60571 ) ) ( not ( = ?auto_60574 ?auto_60575 ) ) ( not ( = ?auto_60574 ?auto_60577 ) ) ( not ( = ?auto_60574 ?auto_60576 ) ) ( not ( = ?auto_60574 ?auto_60578 ) ) ( not ( = ?auto_60571 ?auto_60575 ) ) ( not ( = ?auto_60571 ?auto_60577 ) ) ( not ( = ?auto_60571 ?auto_60576 ) ) ( not ( = ?auto_60571 ?auto_60578 ) ) ( not ( = ?auto_60575 ?auto_60577 ) ) ( not ( = ?auto_60575 ?auto_60576 ) ) ( not ( = ?auto_60575 ?auto_60578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_60577 ?auto_60576 ?auto_60578 )
      ( MAKE-7CRATE-VERIFY ?auto_60572 ?auto_60573 ?auto_60574 ?auto_60571 ?auto_60575 ?auto_60577 ?auto_60576 ?auto_60578 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60649 - SURFACE
      ?auto_60650 - SURFACE
      ?auto_60651 - SURFACE
      ?auto_60648 - SURFACE
      ?auto_60652 - SURFACE
      ?auto_60654 - SURFACE
      ?auto_60653 - SURFACE
      ?auto_60655 - SURFACE
    )
    :vars
    (
      ?auto_60661 - HOIST
      ?auto_60657 - PLACE
      ?auto_60660 - TRUCK
      ?auto_60659 - PLACE
      ?auto_60656 - HOIST
      ?auto_60658 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60661 ?auto_60657 ) ( SURFACE-AT ?auto_60653 ?auto_60657 ) ( CLEAR ?auto_60653 ) ( IS-CRATE ?auto_60655 ) ( not ( = ?auto_60653 ?auto_60655 ) ) ( AVAILABLE ?auto_60661 ) ( ON ?auto_60653 ?auto_60654 ) ( not ( = ?auto_60654 ?auto_60653 ) ) ( not ( = ?auto_60654 ?auto_60655 ) ) ( TRUCK-AT ?auto_60660 ?auto_60659 ) ( not ( = ?auto_60659 ?auto_60657 ) ) ( HOIST-AT ?auto_60656 ?auto_60659 ) ( not ( = ?auto_60661 ?auto_60656 ) ) ( AVAILABLE ?auto_60656 ) ( SURFACE-AT ?auto_60655 ?auto_60659 ) ( ON ?auto_60655 ?auto_60658 ) ( CLEAR ?auto_60655 ) ( not ( = ?auto_60653 ?auto_60658 ) ) ( not ( = ?auto_60655 ?auto_60658 ) ) ( not ( = ?auto_60654 ?auto_60658 ) ) ( ON ?auto_60650 ?auto_60649 ) ( ON ?auto_60651 ?auto_60650 ) ( ON ?auto_60648 ?auto_60651 ) ( ON ?auto_60652 ?auto_60648 ) ( ON ?auto_60654 ?auto_60652 ) ( not ( = ?auto_60649 ?auto_60650 ) ) ( not ( = ?auto_60649 ?auto_60651 ) ) ( not ( = ?auto_60649 ?auto_60648 ) ) ( not ( = ?auto_60649 ?auto_60652 ) ) ( not ( = ?auto_60649 ?auto_60654 ) ) ( not ( = ?auto_60649 ?auto_60653 ) ) ( not ( = ?auto_60649 ?auto_60655 ) ) ( not ( = ?auto_60649 ?auto_60658 ) ) ( not ( = ?auto_60650 ?auto_60651 ) ) ( not ( = ?auto_60650 ?auto_60648 ) ) ( not ( = ?auto_60650 ?auto_60652 ) ) ( not ( = ?auto_60650 ?auto_60654 ) ) ( not ( = ?auto_60650 ?auto_60653 ) ) ( not ( = ?auto_60650 ?auto_60655 ) ) ( not ( = ?auto_60650 ?auto_60658 ) ) ( not ( = ?auto_60651 ?auto_60648 ) ) ( not ( = ?auto_60651 ?auto_60652 ) ) ( not ( = ?auto_60651 ?auto_60654 ) ) ( not ( = ?auto_60651 ?auto_60653 ) ) ( not ( = ?auto_60651 ?auto_60655 ) ) ( not ( = ?auto_60651 ?auto_60658 ) ) ( not ( = ?auto_60648 ?auto_60652 ) ) ( not ( = ?auto_60648 ?auto_60654 ) ) ( not ( = ?auto_60648 ?auto_60653 ) ) ( not ( = ?auto_60648 ?auto_60655 ) ) ( not ( = ?auto_60648 ?auto_60658 ) ) ( not ( = ?auto_60652 ?auto_60654 ) ) ( not ( = ?auto_60652 ?auto_60653 ) ) ( not ( = ?auto_60652 ?auto_60655 ) ) ( not ( = ?auto_60652 ?auto_60658 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_60654 ?auto_60653 ?auto_60655 )
      ( MAKE-7CRATE-VERIFY ?auto_60649 ?auto_60650 ?auto_60651 ?auto_60648 ?auto_60652 ?auto_60654 ?auto_60653 ?auto_60655 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60727 - SURFACE
      ?auto_60728 - SURFACE
      ?auto_60729 - SURFACE
      ?auto_60726 - SURFACE
      ?auto_60730 - SURFACE
      ?auto_60732 - SURFACE
      ?auto_60731 - SURFACE
      ?auto_60733 - SURFACE
    )
    :vars
    (
      ?auto_60734 - HOIST
      ?auto_60735 - PLACE
      ?auto_60739 - PLACE
      ?auto_60738 - HOIST
      ?auto_60736 - SURFACE
      ?auto_60737 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60734 ?auto_60735 ) ( SURFACE-AT ?auto_60731 ?auto_60735 ) ( CLEAR ?auto_60731 ) ( IS-CRATE ?auto_60733 ) ( not ( = ?auto_60731 ?auto_60733 ) ) ( AVAILABLE ?auto_60734 ) ( ON ?auto_60731 ?auto_60732 ) ( not ( = ?auto_60732 ?auto_60731 ) ) ( not ( = ?auto_60732 ?auto_60733 ) ) ( not ( = ?auto_60739 ?auto_60735 ) ) ( HOIST-AT ?auto_60738 ?auto_60739 ) ( not ( = ?auto_60734 ?auto_60738 ) ) ( AVAILABLE ?auto_60738 ) ( SURFACE-AT ?auto_60733 ?auto_60739 ) ( ON ?auto_60733 ?auto_60736 ) ( CLEAR ?auto_60733 ) ( not ( = ?auto_60731 ?auto_60736 ) ) ( not ( = ?auto_60733 ?auto_60736 ) ) ( not ( = ?auto_60732 ?auto_60736 ) ) ( TRUCK-AT ?auto_60737 ?auto_60735 ) ( ON ?auto_60728 ?auto_60727 ) ( ON ?auto_60729 ?auto_60728 ) ( ON ?auto_60726 ?auto_60729 ) ( ON ?auto_60730 ?auto_60726 ) ( ON ?auto_60732 ?auto_60730 ) ( not ( = ?auto_60727 ?auto_60728 ) ) ( not ( = ?auto_60727 ?auto_60729 ) ) ( not ( = ?auto_60727 ?auto_60726 ) ) ( not ( = ?auto_60727 ?auto_60730 ) ) ( not ( = ?auto_60727 ?auto_60732 ) ) ( not ( = ?auto_60727 ?auto_60731 ) ) ( not ( = ?auto_60727 ?auto_60733 ) ) ( not ( = ?auto_60727 ?auto_60736 ) ) ( not ( = ?auto_60728 ?auto_60729 ) ) ( not ( = ?auto_60728 ?auto_60726 ) ) ( not ( = ?auto_60728 ?auto_60730 ) ) ( not ( = ?auto_60728 ?auto_60732 ) ) ( not ( = ?auto_60728 ?auto_60731 ) ) ( not ( = ?auto_60728 ?auto_60733 ) ) ( not ( = ?auto_60728 ?auto_60736 ) ) ( not ( = ?auto_60729 ?auto_60726 ) ) ( not ( = ?auto_60729 ?auto_60730 ) ) ( not ( = ?auto_60729 ?auto_60732 ) ) ( not ( = ?auto_60729 ?auto_60731 ) ) ( not ( = ?auto_60729 ?auto_60733 ) ) ( not ( = ?auto_60729 ?auto_60736 ) ) ( not ( = ?auto_60726 ?auto_60730 ) ) ( not ( = ?auto_60726 ?auto_60732 ) ) ( not ( = ?auto_60726 ?auto_60731 ) ) ( not ( = ?auto_60726 ?auto_60733 ) ) ( not ( = ?auto_60726 ?auto_60736 ) ) ( not ( = ?auto_60730 ?auto_60732 ) ) ( not ( = ?auto_60730 ?auto_60731 ) ) ( not ( = ?auto_60730 ?auto_60733 ) ) ( not ( = ?auto_60730 ?auto_60736 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_60732 ?auto_60731 ?auto_60733 )
      ( MAKE-7CRATE-VERIFY ?auto_60727 ?auto_60728 ?auto_60729 ?auto_60726 ?auto_60730 ?auto_60732 ?auto_60731 ?auto_60733 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60805 - SURFACE
      ?auto_60806 - SURFACE
      ?auto_60807 - SURFACE
      ?auto_60804 - SURFACE
      ?auto_60808 - SURFACE
      ?auto_60810 - SURFACE
      ?auto_60809 - SURFACE
      ?auto_60811 - SURFACE
    )
    :vars
    (
      ?auto_60813 - HOIST
      ?auto_60817 - PLACE
      ?auto_60816 - PLACE
      ?auto_60812 - HOIST
      ?auto_60815 - SURFACE
      ?auto_60814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60813 ?auto_60817 ) ( IS-CRATE ?auto_60811 ) ( not ( = ?auto_60809 ?auto_60811 ) ) ( not ( = ?auto_60810 ?auto_60809 ) ) ( not ( = ?auto_60810 ?auto_60811 ) ) ( not ( = ?auto_60816 ?auto_60817 ) ) ( HOIST-AT ?auto_60812 ?auto_60816 ) ( not ( = ?auto_60813 ?auto_60812 ) ) ( AVAILABLE ?auto_60812 ) ( SURFACE-AT ?auto_60811 ?auto_60816 ) ( ON ?auto_60811 ?auto_60815 ) ( CLEAR ?auto_60811 ) ( not ( = ?auto_60809 ?auto_60815 ) ) ( not ( = ?auto_60811 ?auto_60815 ) ) ( not ( = ?auto_60810 ?auto_60815 ) ) ( TRUCK-AT ?auto_60814 ?auto_60817 ) ( SURFACE-AT ?auto_60810 ?auto_60817 ) ( CLEAR ?auto_60810 ) ( LIFTING ?auto_60813 ?auto_60809 ) ( IS-CRATE ?auto_60809 ) ( ON ?auto_60806 ?auto_60805 ) ( ON ?auto_60807 ?auto_60806 ) ( ON ?auto_60804 ?auto_60807 ) ( ON ?auto_60808 ?auto_60804 ) ( ON ?auto_60810 ?auto_60808 ) ( not ( = ?auto_60805 ?auto_60806 ) ) ( not ( = ?auto_60805 ?auto_60807 ) ) ( not ( = ?auto_60805 ?auto_60804 ) ) ( not ( = ?auto_60805 ?auto_60808 ) ) ( not ( = ?auto_60805 ?auto_60810 ) ) ( not ( = ?auto_60805 ?auto_60809 ) ) ( not ( = ?auto_60805 ?auto_60811 ) ) ( not ( = ?auto_60805 ?auto_60815 ) ) ( not ( = ?auto_60806 ?auto_60807 ) ) ( not ( = ?auto_60806 ?auto_60804 ) ) ( not ( = ?auto_60806 ?auto_60808 ) ) ( not ( = ?auto_60806 ?auto_60810 ) ) ( not ( = ?auto_60806 ?auto_60809 ) ) ( not ( = ?auto_60806 ?auto_60811 ) ) ( not ( = ?auto_60806 ?auto_60815 ) ) ( not ( = ?auto_60807 ?auto_60804 ) ) ( not ( = ?auto_60807 ?auto_60808 ) ) ( not ( = ?auto_60807 ?auto_60810 ) ) ( not ( = ?auto_60807 ?auto_60809 ) ) ( not ( = ?auto_60807 ?auto_60811 ) ) ( not ( = ?auto_60807 ?auto_60815 ) ) ( not ( = ?auto_60804 ?auto_60808 ) ) ( not ( = ?auto_60804 ?auto_60810 ) ) ( not ( = ?auto_60804 ?auto_60809 ) ) ( not ( = ?auto_60804 ?auto_60811 ) ) ( not ( = ?auto_60804 ?auto_60815 ) ) ( not ( = ?auto_60808 ?auto_60810 ) ) ( not ( = ?auto_60808 ?auto_60809 ) ) ( not ( = ?auto_60808 ?auto_60811 ) ) ( not ( = ?auto_60808 ?auto_60815 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_60810 ?auto_60809 ?auto_60811 )
      ( MAKE-7CRATE-VERIFY ?auto_60805 ?auto_60806 ?auto_60807 ?auto_60804 ?auto_60808 ?auto_60810 ?auto_60809 ?auto_60811 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60883 - SURFACE
      ?auto_60884 - SURFACE
      ?auto_60885 - SURFACE
      ?auto_60882 - SURFACE
      ?auto_60886 - SURFACE
      ?auto_60888 - SURFACE
      ?auto_60887 - SURFACE
      ?auto_60889 - SURFACE
    )
    :vars
    (
      ?auto_60891 - HOIST
      ?auto_60895 - PLACE
      ?auto_60893 - PLACE
      ?auto_60894 - HOIST
      ?auto_60892 - SURFACE
      ?auto_60890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60891 ?auto_60895 ) ( IS-CRATE ?auto_60889 ) ( not ( = ?auto_60887 ?auto_60889 ) ) ( not ( = ?auto_60888 ?auto_60887 ) ) ( not ( = ?auto_60888 ?auto_60889 ) ) ( not ( = ?auto_60893 ?auto_60895 ) ) ( HOIST-AT ?auto_60894 ?auto_60893 ) ( not ( = ?auto_60891 ?auto_60894 ) ) ( AVAILABLE ?auto_60894 ) ( SURFACE-AT ?auto_60889 ?auto_60893 ) ( ON ?auto_60889 ?auto_60892 ) ( CLEAR ?auto_60889 ) ( not ( = ?auto_60887 ?auto_60892 ) ) ( not ( = ?auto_60889 ?auto_60892 ) ) ( not ( = ?auto_60888 ?auto_60892 ) ) ( TRUCK-AT ?auto_60890 ?auto_60895 ) ( SURFACE-AT ?auto_60888 ?auto_60895 ) ( CLEAR ?auto_60888 ) ( IS-CRATE ?auto_60887 ) ( AVAILABLE ?auto_60891 ) ( IN ?auto_60887 ?auto_60890 ) ( ON ?auto_60884 ?auto_60883 ) ( ON ?auto_60885 ?auto_60884 ) ( ON ?auto_60882 ?auto_60885 ) ( ON ?auto_60886 ?auto_60882 ) ( ON ?auto_60888 ?auto_60886 ) ( not ( = ?auto_60883 ?auto_60884 ) ) ( not ( = ?auto_60883 ?auto_60885 ) ) ( not ( = ?auto_60883 ?auto_60882 ) ) ( not ( = ?auto_60883 ?auto_60886 ) ) ( not ( = ?auto_60883 ?auto_60888 ) ) ( not ( = ?auto_60883 ?auto_60887 ) ) ( not ( = ?auto_60883 ?auto_60889 ) ) ( not ( = ?auto_60883 ?auto_60892 ) ) ( not ( = ?auto_60884 ?auto_60885 ) ) ( not ( = ?auto_60884 ?auto_60882 ) ) ( not ( = ?auto_60884 ?auto_60886 ) ) ( not ( = ?auto_60884 ?auto_60888 ) ) ( not ( = ?auto_60884 ?auto_60887 ) ) ( not ( = ?auto_60884 ?auto_60889 ) ) ( not ( = ?auto_60884 ?auto_60892 ) ) ( not ( = ?auto_60885 ?auto_60882 ) ) ( not ( = ?auto_60885 ?auto_60886 ) ) ( not ( = ?auto_60885 ?auto_60888 ) ) ( not ( = ?auto_60885 ?auto_60887 ) ) ( not ( = ?auto_60885 ?auto_60889 ) ) ( not ( = ?auto_60885 ?auto_60892 ) ) ( not ( = ?auto_60882 ?auto_60886 ) ) ( not ( = ?auto_60882 ?auto_60888 ) ) ( not ( = ?auto_60882 ?auto_60887 ) ) ( not ( = ?auto_60882 ?auto_60889 ) ) ( not ( = ?auto_60882 ?auto_60892 ) ) ( not ( = ?auto_60886 ?auto_60888 ) ) ( not ( = ?auto_60886 ?auto_60887 ) ) ( not ( = ?auto_60886 ?auto_60889 ) ) ( not ( = ?auto_60886 ?auto_60892 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_60888 ?auto_60887 ?auto_60889 )
      ( MAKE-7CRATE-VERIFY ?auto_60883 ?auto_60884 ?auto_60885 ?auto_60882 ?auto_60886 ?auto_60888 ?auto_60887 ?auto_60889 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_61461 - SURFACE
      ?auto_61462 - SURFACE
    )
    :vars
    (
      ?auto_61469 - HOIST
      ?auto_61463 - PLACE
      ?auto_61466 - SURFACE
      ?auto_61465 - PLACE
      ?auto_61467 - HOIST
      ?auto_61468 - SURFACE
      ?auto_61464 - TRUCK
      ?auto_61470 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61469 ?auto_61463 ) ( SURFACE-AT ?auto_61461 ?auto_61463 ) ( CLEAR ?auto_61461 ) ( IS-CRATE ?auto_61462 ) ( not ( = ?auto_61461 ?auto_61462 ) ) ( ON ?auto_61461 ?auto_61466 ) ( not ( = ?auto_61466 ?auto_61461 ) ) ( not ( = ?auto_61466 ?auto_61462 ) ) ( not ( = ?auto_61465 ?auto_61463 ) ) ( HOIST-AT ?auto_61467 ?auto_61465 ) ( not ( = ?auto_61469 ?auto_61467 ) ) ( AVAILABLE ?auto_61467 ) ( SURFACE-AT ?auto_61462 ?auto_61465 ) ( ON ?auto_61462 ?auto_61468 ) ( CLEAR ?auto_61462 ) ( not ( = ?auto_61461 ?auto_61468 ) ) ( not ( = ?auto_61462 ?auto_61468 ) ) ( not ( = ?auto_61466 ?auto_61468 ) ) ( TRUCK-AT ?auto_61464 ?auto_61463 ) ( LIFTING ?auto_61469 ?auto_61470 ) ( IS-CRATE ?auto_61470 ) ( not ( = ?auto_61461 ?auto_61470 ) ) ( not ( = ?auto_61462 ?auto_61470 ) ) ( not ( = ?auto_61466 ?auto_61470 ) ) ( not ( = ?auto_61468 ?auto_61470 ) ) )
    :subtasks
    ( ( !LOAD ?auto_61469 ?auto_61470 ?auto_61464 ?auto_61463 )
      ( MAKE-1CRATE ?auto_61461 ?auto_61462 )
      ( MAKE-1CRATE-VERIFY ?auto_61461 ?auto_61462 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_62430 - SURFACE
      ?auto_62431 - SURFACE
    )
    :vars
    (
      ?auto_62432 - HOIST
      ?auto_62437 - PLACE
      ?auto_62438 - SURFACE
      ?auto_62433 - TRUCK
      ?auto_62436 - PLACE
      ?auto_62434 - HOIST
      ?auto_62435 - SURFACE
      ?auto_62439 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62432 ?auto_62437 ) ( SURFACE-AT ?auto_62430 ?auto_62437 ) ( CLEAR ?auto_62430 ) ( IS-CRATE ?auto_62431 ) ( not ( = ?auto_62430 ?auto_62431 ) ) ( AVAILABLE ?auto_62432 ) ( ON ?auto_62430 ?auto_62438 ) ( not ( = ?auto_62438 ?auto_62430 ) ) ( not ( = ?auto_62438 ?auto_62431 ) ) ( TRUCK-AT ?auto_62433 ?auto_62436 ) ( not ( = ?auto_62436 ?auto_62437 ) ) ( HOIST-AT ?auto_62434 ?auto_62436 ) ( not ( = ?auto_62432 ?auto_62434 ) ) ( SURFACE-AT ?auto_62431 ?auto_62436 ) ( ON ?auto_62431 ?auto_62435 ) ( CLEAR ?auto_62431 ) ( not ( = ?auto_62430 ?auto_62435 ) ) ( not ( = ?auto_62431 ?auto_62435 ) ) ( not ( = ?auto_62438 ?auto_62435 ) ) ( LIFTING ?auto_62434 ?auto_62439 ) ( IS-CRATE ?auto_62439 ) ( not ( = ?auto_62430 ?auto_62439 ) ) ( not ( = ?auto_62431 ?auto_62439 ) ) ( not ( = ?auto_62438 ?auto_62439 ) ) ( not ( = ?auto_62435 ?auto_62439 ) ) )
    :subtasks
    ( ( !LOAD ?auto_62434 ?auto_62439 ?auto_62433 ?auto_62436 )
      ( MAKE-1CRATE ?auto_62430 ?auto_62431 )
      ( MAKE-1CRATE-VERIFY ?auto_62430 ?auto_62431 ) )
  )

)

