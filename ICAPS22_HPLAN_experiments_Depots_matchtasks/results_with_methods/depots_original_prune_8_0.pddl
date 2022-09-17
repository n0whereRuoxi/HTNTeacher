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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98933 - SURFACE
      ?auto_98934 - SURFACE
    )
    :vars
    (
      ?auto_98935 - HOIST
      ?auto_98936 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_98935 ?auto_98936 ) ( SURFACE-AT ?auto_98933 ?auto_98936 ) ( CLEAR ?auto_98933 ) ( LIFTING ?auto_98935 ?auto_98934 ) ( IS-CRATE ?auto_98934 ) ( not ( = ?auto_98933 ?auto_98934 ) ) )
    :subtasks
    ( ( !DROP ?auto_98935 ?auto_98934 ?auto_98933 ?auto_98936 )
      ( MAKE-1CRATE-VERIFY ?auto_98933 ?auto_98934 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98937 - SURFACE
      ?auto_98938 - SURFACE
    )
    :vars
    (
      ?auto_98940 - HOIST
      ?auto_98939 - PLACE
      ?auto_98941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_98940 ?auto_98939 ) ( SURFACE-AT ?auto_98937 ?auto_98939 ) ( CLEAR ?auto_98937 ) ( IS-CRATE ?auto_98938 ) ( not ( = ?auto_98937 ?auto_98938 ) ) ( TRUCK-AT ?auto_98941 ?auto_98939 ) ( AVAILABLE ?auto_98940 ) ( IN ?auto_98938 ?auto_98941 ) )
    :subtasks
    ( ( !UNLOAD ?auto_98940 ?auto_98938 ?auto_98941 ?auto_98939 )
      ( MAKE-1CRATE ?auto_98937 ?auto_98938 )
      ( MAKE-1CRATE-VERIFY ?auto_98937 ?auto_98938 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98942 - SURFACE
      ?auto_98943 - SURFACE
    )
    :vars
    (
      ?auto_98944 - HOIST
      ?auto_98946 - PLACE
      ?auto_98945 - TRUCK
      ?auto_98947 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_98944 ?auto_98946 ) ( SURFACE-AT ?auto_98942 ?auto_98946 ) ( CLEAR ?auto_98942 ) ( IS-CRATE ?auto_98943 ) ( not ( = ?auto_98942 ?auto_98943 ) ) ( AVAILABLE ?auto_98944 ) ( IN ?auto_98943 ?auto_98945 ) ( TRUCK-AT ?auto_98945 ?auto_98947 ) ( not ( = ?auto_98947 ?auto_98946 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_98945 ?auto_98947 ?auto_98946 )
      ( MAKE-1CRATE ?auto_98942 ?auto_98943 )
      ( MAKE-1CRATE-VERIFY ?auto_98942 ?auto_98943 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98948 - SURFACE
      ?auto_98949 - SURFACE
    )
    :vars
    (
      ?auto_98952 - HOIST
      ?auto_98951 - PLACE
      ?auto_98953 - TRUCK
      ?auto_98950 - PLACE
      ?auto_98954 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_98952 ?auto_98951 ) ( SURFACE-AT ?auto_98948 ?auto_98951 ) ( CLEAR ?auto_98948 ) ( IS-CRATE ?auto_98949 ) ( not ( = ?auto_98948 ?auto_98949 ) ) ( AVAILABLE ?auto_98952 ) ( TRUCK-AT ?auto_98953 ?auto_98950 ) ( not ( = ?auto_98950 ?auto_98951 ) ) ( HOIST-AT ?auto_98954 ?auto_98950 ) ( LIFTING ?auto_98954 ?auto_98949 ) ( not ( = ?auto_98952 ?auto_98954 ) ) )
    :subtasks
    ( ( !LOAD ?auto_98954 ?auto_98949 ?auto_98953 ?auto_98950 )
      ( MAKE-1CRATE ?auto_98948 ?auto_98949 )
      ( MAKE-1CRATE-VERIFY ?auto_98948 ?auto_98949 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98955 - SURFACE
      ?auto_98956 - SURFACE
    )
    :vars
    (
      ?auto_98960 - HOIST
      ?auto_98957 - PLACE
      ?auto_98959 - TRUCK
      ?auto_98958 - PLACE
      ?auto_98961 - HOIST
      ?auto_98962 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_98960 ?auto_98957 ) ( SURFACE-AT ?auto_98955 ?auto_98957 ) ( CLEAR ?auto_98955 ) ( IS-CRATE ?auto_98956 ) ( not ( = ?auto_98955 ?auto_98956 ) ) ( AVAILABLE ?auto_98960 ) ( TRUCK-AT ?auto_98959 ?auto_98958 ) ( not ( = ?auto_98958 ?auto_98957 ) ) ( HOIST-AT ?auto_98961 ?auto_98958 ) ( not ( = ?auto_98960 ?auto_98961 ) ) ( AVAILABLE ?auto_98961 ) ( SURFACE-AT ?auto_98956 ?auto_98958 ) ( ON ?auto_98956 ?auto_98962 ) ( CLEAR ?auto_98956 ) ( not ( = ?auto_98955 ?auto_98962 ) ) ( not ( = ?auto_98956 ?auto_98962 ) ) )
    :subtasks
    ( ( !LIFT ?auto_98961 ?auto_98956 ?auto_98962 ?auto_98958 )
      ( MAKE-1CRATE ?auto_98955 ?auto_98956 )
      ( MAKE-1CRATE-VERIFY ?auto_98955 ?auto_98956 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98963 - SURFACE
      ?auto_98964 - SURFACE
    )
    :vars
    (
      ?auto_98966 - HOIST
      ?auto_98967 - PLACE
      ?auto_98965 - PLACE
      ?auto_98969 - HOIST
      ?auto_98970 - SURFACE
      ?auto_98968 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_98966 ?auto_98967 ) ( SURFACE-AT ?auto_98963 ?auto_98967 ) ( CLEAR ?auto_98963 ) ( IS-CRATE ?auto_98964 ) ( not ( = ?auto_98963 ?auto_98964 ) ) ( AVAILABLE ?auto_98966 ) ( not ( = ?auto_98965 ?auto_98967 ) ) ( HOIST-AT ?auto_98969 ?auto_98965 ) ( not ( = ?auto_98966 ?auto_98969 ) ) ( AVAILABLE ?auto_98969 ) ( SURFACE-AT ?auto_98964 ?auto_98965 ) ( ON ?auto_98964 ?auto_98970 ) ( CLEAR ?auto_98964 ) ( not ( = ?auto_98963 ?auto_98970 ) ) ( not ( = ?auto_98964 ?auto_98970 ) ) ( TRUCK-AT ?auto_98968 ?auto_98967 ) )
    :subtasks
    ( ( !DRIVE ?auto_98968 ?auto_98967 ?auto_98965 )
      ( MAKE-1CRATE ?auto_98963 ?auto_98964 )
      ( MAKE-1CRATE-VERIFY ?auto_98963 ?auto_98964 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_98980 - SURFACE
      ?auto_98981 - SURFACE
      ?auto_98982 - SURFACE
    )
    :vars
    (
      ?auto_98984 - HOIST
      ?auto_98983 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_98984 ?auto_98983 ) ( SURFACE-AT ?auto_98981 ?auto_98983 ) ( CLEAR ?auto_98981 ) ( LIFTING ?auto_98984 ?auto_98982 ) ( IS-CRATE ?auto_98982 ) ( not ( = ?auto_98981 ?auto_98982 ) ) ( ON ?auto_98981 ?auto_98980 ) ( not ( = ?auto_98980 ?auto_98981 ) ) ( not ( = ?auto_98980 ?auto_98982 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_98981 ?auto_98982 )
      ( MAKE-2CRATE-VERIFY ?auto_98980 ?auto_98981 ?auto_98982 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_98990 - SURFACE
      ?auto_98991 - SURFACE
      ?auto_98992 - SURFACE
    )
    :vars
    (
      ?auto_98993 - HOIST
      ?auto_98995 - PLACE
      ?auto_98994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_98993 ?auto_98995 ) ( SURFACE-AT ?auto_98991 ?auto_98995 ) ( CLEAR ?auto_98991 ) ( IS-CRATE ?auto_98992 ) ( not ( = ?auto_98991 ?auto_98992 ) ) ( TRUCK-AT ?auto_98994 ?auto_98995 ) ( AVAILABLE ?auto_98993 ) ( IN ?auto_98992 ?auto_98994 ) ( ON ?auto_98991 ?auto_98990 ) ( not ( = ?auto_98990 ?auto_98991 ) ) ( not ( = ?auto_98990 ?auto_98992 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_98991 ?auto_98992 )
      ( MAKE-2CRATE-VERIFY ?auto_98990 ?auto_98991 ?auto_98992 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98996 - SURFACE
      ?auto_98997 - SURFACE
    )
    :vars
    (
      ?auto_99000 - HOIST
      ?auto_99001 - PLACE
      ?auto_98998 - TRUCK
      ?auto_98999 - SURFACE
      ?auto_99002 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99000 ?auto_99001 ) ( SURFACE-AT ?auto_98996 ?auto_99001 ) ( CLEAR ?auto_98996 ) ( IS-CRATE ?auto_98997 ) ( not ( = ?auto_98996 ?auto_98997 ) ) ( AVAILABLE ?auto_99000 ) ( IN ?auto_98997 ?auto_98998 ) ( ON ?auto_98996 ?auto_98999 ) ( not ( = ?auto_98999 ?auto_98996 ) ) ( not ( = ?auto_98999 ?auto_98997 ) ) ( TRUCK-AT ?auto_98998 ?auto_99002 ) ( not ( = ?auto_99002 ?auto_99001 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_98998 ?auto_99002 ?auto_99001 )
      ( MAKE-2CRATE ?auto_98999 ?auto_98996 ?auto_98997 )
      ( MAKE-1CRATE-VERIFY ?auto_98996 ?auto_98997 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_99003 - SURFACE
      ?auto_99004 - SURFACE
      ?auto_99005 - SURFACE
    )
    :vars
    (
      ?auto_99009 - HOIST
      ?auto_99008 - PLACE
      ?auto_99007 - TRUCK
      ?auto_99006 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99009 ?auto_99008 ) ( SURFACE-AT ?auto_99004 ?auto_99008 ) ( CLEAR ?auto_99004 ) ( IS-CRATE ?auto_99005 ) ( not ( = ?auto_99004 ?auto_99005 ) ) ( AVAILABLE ?auto_99009 ) ( IN ?auto_99005 ?auto_99007 ) ( ON ?auto_99004 ?auto_99003 ) ( not ( = ?auto_99003 ?auto_99004 ) ) ( not ( = ?auto_99003 ?auto_99005 ) ) ( TRUCK-AT ?auto_99007 ?auto_99006 ) ( not ( = ?auto_99006 ?auto_99008 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99004 ?auto_99005 )
      ( MAKE-2CRATE-VERIFY ?auto_99003 ?auto_99004 ?auto_99005 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_99010 - SURFACE
      ?auto_99011 - SURFACE
    )
    :vars
    (
      ?auto_99014 - HOIST
      ?auto_99013 - PLACE
      ?auto_99015 - SURFACE
      ?auto_99012 - TRUCK
      ?auto_99016 - PLACE
      ?auto_99017 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_99014 ?auto_99013 ) ( SURFACE-AT ?auto_99010 ?auto_99013 ) ( CLEAR ?auto_99010 ) ( IS-CRATE ?auto_99011 ) ( not ( = ?auto_99010 ?auto_99011 ) ) ( AVAILABLE ?auto_99014 ) ( ON ?auto_99010 ?auto_99015 ) ( not ( = ?auto_99015 ?auto_99010 ) ) ( not ( = ?auto_99015 ?auto_99011 ) ) ( TRUCK-AT ?auto_99012 ?auto_99016 ) ( not ( = ?auto_99016 ?auto_99013 ) ) ( HOIST-AT ?auto_99017 ?auto_99016 ) ( LIFTING ?auto_99017 ?auto_99011 ) ( not ( = ?auto_99014 ?auto_99017 ) ) )
    :subtasks
    ( ( !LOAD ?auto_99017 ?auto_99011 ?auto_99012 ?auto_99016 )
      ( MAKE-2CRATE ?auto_99015 ?auto_99010 ?auto_99011 )
      ( MAKE-1CRATE-VERIFY ?auto_99010 ?auto_99011 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_99018 - SURFACE
      ?auto_99019 - SURFACE
      ?auto_99020 - SURFACE
    )
    :vars
    (
      ?auto_99021 - HOIST
      ?auto_99022 - PLACE
      ?auto_99024 - TRUCK
      ?auto_99025 - PLACE
      ?auto_99023 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_99021 ?auto_99022 ) ( SURFACE-AT ?auto_99019 ?auto_99022 ) ( CLEAR ?auto_99019 ) ( IS-CRATE ?auto_99020 ) ( not ( = ?auto_99019 ?auto_99020 ) ) ( AVAILABLE ?auto_99021 ) ( ON ?auto_99019 ?auto_99018 ) ( not ( = ?auto_99018 ?auto_99019 ) ) ( not ( = ?auto_99018 ?auto_99020 ) ) ( TRUCK-AT ?auto_99024 ?auto_99025 ) ( not ( = ?auto_99025 ?auto_99022 ) ) ( HOIST-AT ?auto_99023 ?auto_99025 ) ( LIFTING ?auto_99023 ?auto_99020 ) ( not ( = ?auto_99021 ?auto_99023 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99019 ?auto_99020 )
      ( MAKE-2CRATE-VERIFY ?auto_99018 ?auto_99019 ?auto_99020 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_99026 - SURFACE
      ?auto_99027 - SURFACE
    )
    :vars
    (
      ?auto_99028 - HOIST
      ?auto_99029 - PLACE
      ?auto_99033 - SURFACE
      ?auto_99030 - TRUCK
      ?auto_99032 - PLACE
      ?auto_99031 - HOIST
      ?auto_99034 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99028 ?auto_99029 ) ( SURFACE-AT ?auto_99026 ?auto_99029 ) ( CLEAR ?auto_99026 ) ( IS-CRATE ?auto_99027 ) ( not ( = ?auto_99026 ?auto_99027 ) ) ( AVAILABLE ?auto_99028 ) ( ON ?auto_99026 ?auto_99033 ) ( not ( = ?auto_99033 ?auto_99026 ) ) ( not ( = ?auto_99033 ?auto_99027 ) ) ( TRUCK-AT ?auto_99030 ?auto_99032 ) ( not ( = ?auto_99032 ?auto_99029 ) ) ( HOIST-AT ?auto_99031 ?auto_99032 ) ( not ( = ?auto_99028 ?auto_99031 ) ) ( AVAILABLE ?auto_99031 ) ( SURFACE-AT ?auto_99027 ?auto_99032 ) ( ON ?auto_99027 ?auto_99034 ) ( CLEAR ?auto_99027 ) ( not ( = ?auto_99026 ?auto_99034 ) ) ( not ( = ?auto_99027 ?auto_99034 ) ) ( not ( = ?auto_99033 ?auto_99034 ) ) )
    :subtasks
    ( ( !LIFT ?auto_99031 ?auto_99027 ?auto_99034 ?auto_99032 )
      ( MAKE-2CRATE ?auto_99033 ?auto_99026 ?auto_99027 )
      ( MAKE-1CRATE-VERIFY ?auto_99026 ?auto_99027 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_99035 - SURFACE
      ?auto_99036 - SURFACE
      ?auto_99037 - SURFACE
    )
    :vars
    (
      ?auto_99039 - HOIST
      ?auto_99040 - PLACE
      ?auto_99043 - TRUCK
      ?auto_99038 - PLACE
      ?auto_99041 - HOIST
      ?auto_99042 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99039 ?auto_99040 ) ( SURFACE-AT ?auto_99036 ?auto_99040 ) ( CLEAR ?auto_99036 ) ( IS-CRATE ?auto_99037 ) ( not ( = ?auto_99036 ?auto_99037 ) ) ( AVAILABLE ?auto_99039 ) ( ON ?auto_99036 ?auto_99035 ) ( not ( = ?auto_99035 ?auto_99036 ) ) ( not ( = ?auto_99035 ?auto_99037 ) ) ( TRUCK-AT ?auto_99043 ?auto_99038 ) ( not ( = ?auto_99038 ?auto_99040 ) ) ( HOIST-AT ?auto_99041 ?auto_99038 ) ( not ( = ?auto_99039 ?auto_99041 ) ) ( AVAILABLE ?auto_99041 ) ( SURFACE-AT ?auto_99037 ?auto_99038 ) ( ON ?auto_99037 ?auto_99042 ) ( CLEAR ?auto_99037 ) ( not ( = ?auto_99036 ?auto_99042 ) ) ( not ( = ?auto_99037 ?auto_99042 ) ) ( not ( = ?auto_99035 ?auto_99042 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99036 ?auto_99037 )
      ( MAKE-2CRATE-VERIFY ?auto_99035 ?auto_99036 ?auto_99037 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_99044 - SURFACE
      ?auto_99045 - SURFACE
    )
    :vars
    (
      ?auto_99046 - HOIST
      ?auto_99051 - PLACE
      ?auto_99050 - SURFACE
      ?auto_99047 - PLACE
      ?auto_99048 - HOIST
      ?auto_99049 - SURFACE
      ?auto_99052 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99046 ?auto_99051 ) ( SURFACE-AT ?auto_99044 ?auto_99051 ) ( CLEAR ?auto_99044 ) ( IS-CRATE ?auto_99045 ) ( not ( = ?auto_99044 ?auto_99045 ) ) ( AVAILABLE ?auto_99046 ) ( ON ?auto_99044 ?auto_99050 ) ( not ( = ?auto_99050 ?auto_99044 ) ) ( not ( = ?auto_99050 ?auto_99045 ) ) ( not ( = ?auto_99047 ?auto_99051 ) ) ( HOIST-AT ?auto_99048 ?auto_99047 ) ( not ( = ?auto_99046 ?auto_99048 ) ) ( AVAILABLE ?auto_99048 ) ( SURFACE-AT ?auto_99045 ?auto_99047 ) ( ON ?auto_99045 ?auto_99049 ) ( CLEAR ?auto_99045 ) ( not ( = ?auto_99044 ?auto_99049 ) ) ( not ( = ?auto_99045 ?auto_99049 ) ) ( not ( = ?auto_99050 ?auto_99049 ) ) ( TRUCK-AT ?auto_99052 ?auto_99051 ) )
    :subtasks
    ( ( !DRIVE ?auto_99052 ?auto_99051 ?auto_99047 )
      ( MAKE-2CRATE ?auto_99050 ?auto_99044 ?auto_99045 )
      ( MAKE-1CRATE-VERIFY ?auto_99044 ?auto_99045 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_99053 - SURFACE
      ?auto_99054 - SURFACE
      ?auto_99055 - SURFACE
    )
    :vars
    (
      ?auto_99060 - HOIST
      ?auto_99061 - PLACE
      ?auto_99058 - PLACE
      ?auto_99059 - HOIST
      ?auto_99057 - SURFACE
      ?auto_99056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99060 ?auto_99061 ) ( SURFACE-AT ?auto_99054 ?auto_99061 ) ( CLEAR ?auto_99054 ) ( IS-CRATE ?auto_99055 ) ( not ( = ?auto_99054 ?auto_99055 ) ) ( AVAILABLE ?auto_99060 ) ( ON ?auto_99054 ?auto_99053 ) ( not ( = ?auto_99053 ?auto_99054 ) ) ( not ( = ?auto_99053 ?auto_99055 ) ) ( not ( = ?auto_99058 ?auto_99061 ) ) ( HOIST-AT ?auto_99059 ?auto_99058 ) ( not ( = ?auto_99060 ?auto_99059 ) ) ( AVAILABLE ?auto_99059 ) ( SURFACE-AT ?auto_99055 ?auto_99058 ) ( ON ?auto_99055 ?auto_99057 ) ( CLEAR ?auto_99055 ) ( not ( = ?auto_99054 ?auto_99057 ) ) ( not ( = ?auto_99055 ?auto_99057 ) ) ( not ( = ?auto_99053 ?auto_99057 ) ) ( TRUCK-AT ?auto_99056 ?auto_99061 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99054 ?auto_99055 )
      ( MAKE-2CRATE-VERIFY ?auto_99053 ?auto_99054 ?auto_99055 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_99062 - SURFACE
      ?auto_99063 - SURFACE
    )
    :vars
    (
      ?auto_99067 - HOIST
      ?auto_99064 - PLACE
      ?auto_99065 - SURFACE
      ?auto_99070 - PLACE
      ?auto_99066 - HOIST
      ?auto_99069 - SURFACE
      ?auto_99068 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99067 ?auto_99064 ) ( IS-CRATE ?auto_99063 ) ( not ( = ?auto_99062 ?auto_99063 ) ) ( not ( = ?auto_99065 ?auto_99062 ) ) ( not ( = ?auto_99065 ?auto_99063 ) ) ( not ( = ?auto_99070 ?auto_99064 ) ) ( HOIST-AT ?auto_99066 ?auto_99070 ) ( not ( = ?auto_99067 ?auto_99066 ) ) ( AVAILABLE ?auto_99066 ) ( SURFACE-AT ?auto_99063 ?auto_99070 ) ( ON ?auto_99063 ?auto_99069 ) ( CLEAR ?auto_99063 ) ( not ( = ?auto_99062 ?auto_99069 ) ) ( not ( = ?auto_99063 ?auto_99069 ) ) ( not ( = ?auto_99065 ?auto_99069 ) ) ( TRUCK-AT ?auto_99068 ?auto_99064 ) ( SURFACE-AT ?auto_99065 ?auto_99064 ) ( CLEAR ?auto_99065 ) ( LIFTING ?auto_99067 ?auto_99062 ) ( IS-CRATE ?auto_99062 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99065 ?auto_99062 )
      ( MAKE-2CRATE ?auto_99065 ?auto_99062 ?auto_99063 )
      ( MAKE-1CRATE-VERIFY ?auto_99062 ?auto_99063 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_99071 - SURFACE
      ?auto_99072 - SURFACE
      ?auto_99073 - SURFACE
    )
    :vars
    (
      ?auto_99074 - HOIST
      ?auto_99076 - PLACE
      ?auto_99075 - PLACE
      ?auto_99079 - HOIST
      ?auto_99077 - SURFACE
      ?auto_99078 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99074 ?auto_99076 ) ( IS-CRATE ?auto_99073 ) ( not ( = ?auto_99072 ?auto_99073 ) ) ( not ( = ?auto_99071 ?auto_99072 ) ) ( not ( = ?auto_99071 ?auto_99073 ) ) ( not ( = ?auto_99075 ?auto_99076 ) ) ( HOIST-AT ?auto_99079 ?auto_99075 ) ( not ( = ?auto_99074 ?auto_99079 ) ) ( AVAILABLE ?auto_99079 ) ( SURFACE-AT ?auto_99073 ?auto_99075 ) ( ON ?auto_99073 ?auto_99077 ) ( CLEAR ?auto_99073 ) ( not ( = ?auto_99072 ?auto_99077 ) ) ( not ( = ?auto_99073 ?auto_99077 ) ) ( not ( = ?auto_99071 ?auto_99077 ) ) ( TRUCK-AT ?auto_99078 ?auto_99076 ) ( SURFACE-AT ?auto_99071 ?auto_99076 ) ( CLEAR ?auto_99071 ) ( LIFTING ?auto_99074 ?auto_99072 ) ( IS-CRATE ?auto_99072 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99072 ?auto_99073 )
      ( MAKE-2CRATE-VERIFY ?auto_99071 ?auto_99072 ?auto_99073 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_99080 - SURFACE
      ?auto_99081 - SURFACE
    )
    :vars
    (
      ?auto_99084 - HOIST
      ?auto_99086 - PLACE
      ?auto_99083 - SURFACE
      ?auto_99082 - PLACE
      ?auto_99085 - HOIST
      ?auto_99087 - SURFACE
      ?auto_99088 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99084 ?auto_99086 ) ( IS-CRATE ?auto_99081 ) ( not ( = ?auto_99080 ?auto_99081 ) ) ( not ( = ?auto_99083 ?auto_99080 ) ) ( not ( = ?auto_99083 ?auto_99081 ) ) ( not ( = ?auto_99082 ?auto_99086 ) ) ( HOIST-AT ?auto_99085 ?auto_99082 ) ( not ( = ?auto_99084 ?auto_99085 ) ) ( AVAILABLE ?auto_99085 ) ( SURFACE-AT ?auto_99081 ?auto_99082 ) ( ON ?auto_99081 ?auto_99087 ) ( CLEAR ?auto_99081 ) ( not ( = ?auto_99080 ?auto_99087 ) ) ( not ( = ?auto_99081 ?auto_99087 ) ) ( not ( = ?auto_99083 ?auto_99087 ) ) ( TRUCK-AT ?auto_99088 ?auto_99086 ) ( SURFACE-AT ?auto_99083 ?auto_99086 ) ( CLEAR ?auto_99083 ) ( IS-CRATE ?auto_99080 ) ( AVAILABLE ?auto_99084 ) ( IN ?auto_99080 ?auto_99088 ) )
    :subtasks
    ( ( !UNLOAD ?auto_99084 ?auto_99080 ?auto_99088 ?auto_99086 )
      ( MAKE-2CRATE ?auto_99083 ?auto_99080 ?auto_99081 )
      ( MAKE-1CRATE-VERIFY ?auto_99080 ?auto_99081 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_99089 - SURFACE
      ?auto_99090 - SURFACE
      ?auto_99091 - SURFACE
    )
    :vars
    (
      ?auto_99095 - HOIST
      ?auto_99097 - PLACE
      ?auto_99093 - PLACE
      ?auto_99092 - HOIST
      ?auto_99096 - SURFACE
      ?auto_99094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99095 ?auto_99097 ) ( IS-CRATE ?auto_99091 ) ( not ( = ?auto_99090 ?auto_99091 ) ) ( not ( = ?auto_99089 ?auto_99090 ) ) ( not ( = ?auto_99089 ?auto_99091 ) ) ( not ( = ?auto_99093 ?auto_99097 ) ) ( HOIST-AT ?auto_99092 ?auto_99093 ) ( not ( = ?auto_99095 ?auto_99092 ) ) ( AVAILABLE ?auto_99092 ) ( SURFACE-AT ?auto_99091 ?auto_99093 ) ( ON ?auto_99091 ?auto_99096 ) ( CLEAR ?auto_99091 ) ( not ( = ?auto_99090 ?auto_99096 ) ) ( not ( = ?auto_99091 ?auto_99096 ) ) ( not ( = ?auto_99089 ?auto_99096 ) ) ( TRUCK-AT ?auto_99094 ?auto_99097 ) ( SURFACE-AT ?auto_99089 ?auto_99097 ) ( CLEAR ?auto_99089 ) ( IS-CRATE ?auto_99090 ) ( AVAILABLE ?auto_99095 ) ( IN ?auto_99090 ?auto_99094 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99090 ?auto_99091 )
      ( MAKE-2CRATE-VERIFY ?auto_99089 ?auto_99090 ?auto_99091 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_99098 - SURFACE
      ?auto_99099 - SURFACE
    )
    :vars
    (
      ?auto_99106 - HOIST
      ?auto_99101 - PLACE
      ?auto_99103 - SURFACE
      ?auto_99104 - PLACE
      ?auto_99100 - HOIST
      ?auto_99105 - SURFACE
      ?auto_99102 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99106 ?auto_99101 ) ( IS-CRATE ?auto_99099 ) ( not ( = ?auto_99098 ?auto_99099 ) ) ( not ( = ?auto_99103 ?auto_99098 ) ) ( not ( = ?auto_99103 ?auto_99099 ) ) ( not ( = ?auto_99104 ?auto_99101 ) ) ( HOIST-AT ?auto_99100 ?auto_99104 ) ( not ( = ?auto_99106 ?auto_99100 ) ) ( AVAILABLE ?auto_99100 ) ( SURFACE-AT ?auto_99099 ?auto_99104 ) ( ON ?auto_99099 ?auto_99105 ) ( CLEAR ?auto_99099 ) ( not ( = ?auto_99098 ?auto_99105 ) ) ( not ( = ?auto_99099 ?auto_99105 ) ) ( not ( = ?auto_99103 ?auto_99105 ) ) ( SURFACE-AT ?auto_99103 ?auto_99101 ) ( CLEAR ?auto_99103 ) ( IS-CRATE ?auto_99098 ) ( AVAILABLE ?auto_99106 ) ( IN ?auto_99098 ?auto_99102 ) ( TRUCK-AT ?auto_99102 ?auto_99104 ) )
    :subtasks
    ( ( !DRIVE ?auto_99102 ?auto_99104 ?auto_99101 )
      ( MAKE-2CRATE ?auto_99103 ?auto_99098 ?auto_99099 )
      ( MAKE-1CRATE-VERIFY ?auto_99098 ?auto_99099 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_99107 - SURFACE
      ?auto_99108 - SURFACE
      ?auto_99109 - SURFACE
    )
    :vars
    (
      ?auto_99111 - HOIST
      ?auto_99112 - PLACE
      ?auto_99114 - PLACE
      ?auto_99110 - HOIST
      ?auto_99115 - SURFACE
      ?auto_99113 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99111 ?auto_99112 ) ( IS-CRATE ?auto_99109 ) ( not ( = ?auto_99108 ?auto_99109 ) ) ( not ( = ?auto_99107 ?auto_99108 ) ) ( not ( = ?auto_99107 ?auto_99109 ) ) ( not ( = ?auto_99114 ?auto_99112 ) ) ( HOIST-AT ?auto_99110 ?auto_99114 ) ( not ( = ?auto_99111 ?auto_99110 ) ) ( AVAILABLE ?auto_99110 ) ( SURFACE-AT ?auto_99109 ?auto_99114 ) ( ON ?auto_99109 ?auto_99115 ) ( CLEAR ?auto_99109 ) ( not ( = ?auto_99108 ?auto_99115 ) ) ( not ( = ?auto_99109 ?auto_99115 ) ) ( not ( = ?auto_99107 ?auto_99115 ) ) ( SURFACE-AT ?auto_99107 ?auto_99112 ) ( CLEAR ?auto_99107 ) ( IS-CRATE ?auto_99108 ) ( AVAILABLE ?auto_99111 ) ( IN ?auto_99108 ?auto_99113 ) ( TRUCK-AT ?auto_99113 ?auto_99114 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99108 ?auto_99109 )
      ( MAKE-2CRATE-VERIFY ?auto_99107 ?auto_99108 ?auto_99109 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_99116 - SURFACE
      ?auto_99117 - SURFACE
    )
    :vars
    (
      ?auto_99119 - HOIST
      ?auto_99122 - PLACE
      ?auto_99124 - SURFACE
      ?auto_99123 - PLACE
      ?auto_99118 - HOIST
      ?auto_99120 - SURFACE
      ?auto_99121 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99119 ?auto_99122 ) ( IS-CRATE ?auto_99117 ) ( not ( = ?auto_99116 ?auto_99117 ) ) ( not ( = ?auto_99124 ?auto_99116 ) ) ( not ( = ?auto_99124 ?auto_99117 ) ) ( not ( = ?auto_99123 ?auto_99122 ) ) ( HOIST-AT ?auto_99118 ?auto_99123 ) ( not ( = ?auto_99119 ?auto_99118 ) ) ( SURFACE-AT ?auto_99117 ?auto_99123 ) ( ON ?auto_99117 ?auto_99120 ) ( CLEAR ?auto_99117 ) ( not ( = ?auto_99116 ?auto_99120 ) ) ( not ( = ?auto_99117 ?auto_99120 ) ) ( not ( = ?auto_99124 ?auto_99120 ) ) ( SURFACE-AT ?auto_99124 ?auto_99122 ) ( CLEAR ?auto_99124 ) ( IS-CRATE ?auto_99116 ) ( AVAILABLE ?auto_99119 ) ( TRUCK-AT ?auto_99121 ?auto_99123 ) ( LIFTING ?auto_99118 ?auto_99116 ) )
    :subtasks
    ( ( !LOAD ?auto_99118 ?auto_99116 ?auto_99121 ?auto_99123 )
      ( MAKE-2CRATE ?auto_99124 ?auto_99116 ?auto_99117 )
      ( MAKE-1CRATE-VERIFY ?auto_99116 ?auto_99117 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_99125 - SURFACE
      ?auto_99126 - SURFACE
      ?auto_99127 - SURFACE
    )
    :vars
    (
      ?auto_99128 - HOIST
      ?auto_99132 - PLACE
      ?auto_99133 - PLACE
      ?auto_99130 - HOIST
      ?auto_99129 - SURFACE
      ?auto_99131 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99128 ?auto_99132 ) ( IS-CRATE ?auto_99127 ) ( not ( = ?auto_99126 ?auto_99127 ) ) ( not ( = ?auto_99125 ?auto_99126 ) ) ( not ( = ?auto_99125 ?auto_99127 ) ) ( not ( = ?auto_99133 ?auto_99132 ) ) ( HOIST-AT ?auto_99130 ?auto_99133 ) ( not ( = ?auto_99128 ?auto_99130 ) ) ( SURFACE-AT ?auto_99127 ?auto_99133 ) ( ON ?auto_99127 ?auto_99129 ) ( CLEAR ?auto_99127 ) ( not ( = ?auto_99126 ?auto_99129 ) ) ( not ( = ?auto_99127 ?auto_99129 ) ) ( not ( = ?auto_99125 ?auto_99129 ) ) ( SURFACE-AT ?auto_99125 ?auto_99132 ) ( CLEAR ?auto_99125 ) ( IS-CRATE ?auto_99126 ) ( AVAILABLE ?auto_99128 ) ( TRUCK-AT ?auto_99131 ?auto_99133 ) ( LIFTING ?auto_99130 ?auto_99126 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99126 ?auto_99127 )
      ( MAKE-2CRATE-VERIFY ?auto_99125 ?auto_99126 ?auto_99127 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_99134 - SURFACE
      ?auto_99135 - SURFACE
    )
    :vars
    (
      ?auto_99140 - HOIST
      ?auto_99138 - PLACE
      ?auto_99142 - SURFACE
      ?auto_99141 - PLACE
      ?auto_99137 - HOIST
      ?auto_99139 - SURFACE
      ?auto_99136 - TRUCK
      ?auto_99143 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99140 ?auto_99138 ) ( IS-CRATE ?auto_99135 ) ( not ( = ?auto_99134 ?auto_99135 ) ) ( not ( = ?auto_99142 ?auto_99134 ) ) ( not ( = ?auto_99142 ?auto_99135 ) ) ( not ( = ?auto_99141 ?auto_99138 ) ) ( HOIST-AT ?auto_99137 ?auto_99141 ) ( not ( = ?auto_99140 ?auto_99137 ) ) ( SURFACE-AT ?auto_99135 ?auto_99141 ) ( ON ?auto_99135 ?auto_99139 ) ( CLEAR ?auto_99135 ) ( not ( = ?auto_99134 ?auto_99139 ) ) ( not ( = ?auto_99135 ?auto_99139 ) ) ( not ( = ?auto_99142 ?auto_99139 ) ) ( SURFACE-AT ?auto_99142 ?auto_99138 ) ( CLEAR ?auto_99142 ) ( IS-CRATE ?auto_99134 ) ( AVAILABLE ?auto_99140 ) ( TRUCK-AT ?auto_99136 ?auto_99141 ) ( AVAILABLE ?auto_99137 ) ( SURFACE-AT ?auto_99134 ?auto_99141 ) ( ON ?auto_99134 ?auto_99143 ) ( CLEAR ?auto_99134 ) ( not ( = ?auto_99134 ?auto_99143 ) ) ( not ( = ?auto_99135 ?auto_99143 ) ) ( not ( = ?auto_99142 ?auto_99143 ) ) ( not ( = ?auto_99139 ?auto_99143 ) ) )
    :subtasks
    ( ( !LIFT ?auto_99137 ?auto_99134 ?auto_99143 ?auto_99141 )
      ( MAKE-2CRATE ?auto_99142 ?auto_99134 ?auto_99135 )
      ( MAKE-1CRATE-VERIFY ?auto_99134 ?auto_99135 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_99144 - SURFACE
      ?auto_99145 - SURFACE
      ?auto_99146 - SURFACE
    )
    :vars
    (
      ?auto_99150 - HOIST
      ?auto_99153 - PLACE
      ?auto_99151 - PLACE
      ?auto_99148 - HOIST
      ?auto_99152 - SURFACE
      ?auto_99149 - TRUCK
      ?auto_99147 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99150 ?auto_99153 ) ( IS-CRATE ?auto_99146 ) ( not ( = ?auto_99145 ?auto_99146 ) ) ( not ( = ?auto_99144 ?auto_99145 ) ) ( not ( = ?auto_99144 ?auto_99146 ) ) ( not ( = ?auto_99151 ?auto_99153 ) ) ( HOIST-AT ?auto_99148 ?auto_99151 ) ( not ( = ?auto_99150 ?auto_99148 ) ) ( SURFACE-AT ?auto_99146 ?auto_99151 ) ( ON ?auto_99146 ?auto_99152 ) ( CLEAR ?auto_99146 ) ( not ( = ?auto_99145 ?auto_99152 ) ) ( not ( = ?auto_99146 ?auto_99152 ) ) ( not ( = ?auto_99144 ?auto_99152 ) ) ( SURFACE-AT ?auto_99144 ?auto_99153 ) ( CLEAR ?auto_99144 ) ( IS-CRATE ?auto_99145 ) ( AVAILABLE ?auto_99150 ) ( TRUCK-AT ?auto_99149 ?auto_99151 ) ( AVAILABLE ?auto_99148 ) ( SURFACE-AT ?auto_99145 ?auto_99151 ) ( ON ?auto_99145 ?auto_99147 ) ( CLEAR ?auto_99145 ) ( not ( = ?auto_99145 ?auto_99147 ) ) ( not ( = ?auto_99146 ?auto_99147 ) ) ( not ( = ?auto_99144 ?auto_99147 ) ) ( not ( = ?auto_99152 ?auto_99147 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99145 ?auto_99146 )
      ( MAKE-2CRATE-VERIFY ?auto_99144 ?auto_99145 ?auto_99146 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_99154 - SURFACE
      ?auto_99155 - SURFACE
    )
    :vars
    (
      ?auto_99156 - HOIST
      ?auto_99161 - PLACE
      ?auto_99160 - SURFACE
      ?auto_99158 - PLACE
      ?auto_99163 - HOIST
      ?auto_99159 - SURFACE
      ?auto_99157 - SURFACE
      ?auto_99162 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99156 ?auto_99161 ) ( IS-CRATE ?auto_99155 ) ( not ( = ?auto_99154 ?auto_99155 ) ) ( not ( = ?auto_99160 ?auto_99154 ) ) ( not ( = ?auto_99160 ?auto_99155 ) ) ( not ( = ?auto_99158 ?auto_99161 ) ) ( HOIST-AT ?auto_99163 ?auto_99158 ) ( not ( = ?auto_99156 ?auto_99163 ) ) ( SURFACE-AT ?auto_99155 ?auto_99158 ) ( ON ?auto_99155 ?auto_99159 ) ( CLEAR ?auto_99155 ) ( not ( = ?auto_99154 ?auto_99159 ) ) ( not ( = ?auto_99155 ?auto_99159 ) ) ( not ( = ?auto_99160 ?auto_99159 ) ) ( SURFACE-AT ?auto_99160 ?auto_99161 ) ( CLEAR ?auto_99160 ) ( IS-CRATE ?auto_99154 ) ( AVAILABLE ?auto_99156 ) ( AVAILABLE ?auto_99163 ) ( SURFACE-AT ?auto_99154 ?auto_99158 ) ( ON ?auto_99154 ?auto_99157 ) ( CLEAR ?auto_99154 ) ( not ( = ?auto_99154 ?auto_99157 ) ) ( not ( = ?auto_99155 ?auto_99157 ) ) ( not ( = ?auto_99160 ?auto_99157 ) ) ( not ( = ?auto_99159 ?auto_99157 ) ) ( TRUCK-AT ?auto_99162 ?auto_99161 ) )
    :subtasks
    ( ( !DRIVE ?auto_99162 ?auto_99161 ?auto_99158 )
      ( MAKE-2CRATE ?auto_99160 ?auto_99154 ?auto_99155 )
      ( MAKE-1CRATE-VERIFY ?auto_99154 ?auto_99155 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_99164 - SURFACE
      ?auto_99165 - SURFACE
      ?auto_99166 - SURFACE
    )
    :vars
    (
      ?auto_99172 - HOIST
      ?auto_99173 - PLACE
      ?auto_99168 - PLACE
      ?auto_99169 - HOIST
      ?auto_99170 - SURFACE
      ?auto_99167 - SURFACE
      ?auto_99171 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99172 ?auto_99173 ) ( IS-CRATE ?auto_99166 ) ( not ( = ?auto_99165 ?auto_99166 ) ) ( not ( = ?auto_99164 ?auto_99165 ) ) ( not ( = ?auto_99164 ?auto_99166 ) ) ( not ( = ?auto_99168 ?auto_99173 ) ) ( HOIST-AT ?auto_99169 ?auto_99168 ) ( not ( = ?auto_99172 ?auto_99169 ) ) ( SURFACE-AT ?auto_99166 ?auto_99168 ) ( ON ?auto_99166 ?auto_99170 ) ( CLEAR ?auto_99166 ) ( not ( = ?auto_99165 ?auto_99170 ) ) ( not ( = ?auto_99166 ?auto_99170 ) ) ( not ( = ?auto_99164 ?auto_99170 ) ) ( SURFACE-AT ?auto_99164 ?auto_99173 ) ( CLEAR ?auto_99164 ) ( IS-CRATE ?auto_99165 ) ( AVAILABLE ?auto_99172 ) ( AVAILABLE ?auto_99169 ) ( SURFACE-AT ?auto_99165 ?auto_99168 ) ( ON ?auto_99165 ?auto_99167 ) ( CLEAR ?auto_99165 ) ( not ( = ?auto_99165 ?auto_99167 ) ) ( not ( = ?auto_99166 ?auto_99167 ) ) ( not ( = ?auto_99164 ?auto_99167 ) ) ( not ( = ?auto_99170 ?auto_99167 ) ) ( TRUCK-AT ?auto_99171 ?auto_99173 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99165 ?auto_99166 )
      ( MAKE-2CRATE-VERIFY ?auto_99164 ?auto_99165 ?auto_99166 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99193 - SURFACE
      ?auto_99194 - SURFACE
      ?auto_99195 - SURFACE
      ?auto_99192 - SURFACE
    )
    :vars
    (
      ?auto_99197 - HOIST
      ?auto_99196 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99197 ?auto_99196 ) ( SURFACE-AT ?auto_99195 ?auto_99196 ) ( CLEAR ?auto_99195 ) ( LIFTING ?auto_99197 ?auto_99192 ) ( IS-CRATE ?auto_99192 ) ( not ( = ?auto_99195 ?auto_99192 ) ) ( ON ?auto_99194 ?auto_99193 ) ( ON ?auto_99195 ?auto_99194 ) ( not ( = ?auto_99193 ?auto_99194 ) ) ( not ( = ?auto_99193 ?auto_99195 ) ) ( not ( = ?auto_99193 ?auto_99192 ) ) ( not ( = ?auto_99194 ?auto_99195 ) ) ( not ( = ?auto_99194 ?auto_99192 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99195 ?auto_99192 )
      ( MAKE-3CRATE-VERIFY ?auto_99193 ?auto_99194 ?auto_99195 ?auto_99192 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99210 - SURFACE
      ?auto_99211 - SURFACE
      ?auto_99212 - SURFACE
      ?auto_99209 - SURFACE
    )
    :vars
    (
      ?auto_99215 - HOIST
      ?auto_99214 - PLACE
      ?auto_99213 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99215 ?auto_99214 ) ( SURFACE-AT ?auto_99212 ?auto_99214 ) ( CLEAR ?auto_99212 ) ( IS-CRATE ?auto_99209 ) ( not ( = ?auto_99212 ?auto_99209 ) ) ( TRUCK-AT ?auto_99213 ?auto_99214 ) ( AVAILABLE ?auto_99215 ) ( IN ?auto_99209 ?auto_99213 ) ( ON ?auto_99212 ?auto_99211 ) ( not ( = ?auto_99211 ?auto_99212 ) ) ( not ( = ?auto_99211 ?auto_99209 ) ) ( ON ?auto_99211 ?auto_99210 ) ( not ( = ?auto_99210 ?auto_99211 ) ) ( not ( = ?auto_99210 ?auto_99212 ) ) ( not ( = ?auto_99210 ?auto_99209 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99211 ?auto_99212 ?auto_99209 )
      ( MAKE-3CRATE-VERIFY ?auto_99210 ?auto_99211 ?auto_99212 ?auto_99209 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99231 - SURFACE
      ?auto_99232 - SURFACE
      ?auto_99233 - SURFACE
      ?auto_99230 - SURFACE
    )
    :vars
    (
      ?auto_99236 - HOIST
      ?auto_99237 - PLACE
      ?auto_99235 - TRUCK
      ?auto_99234 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99236 ?auto_99237 ) ( SURFACE-AT ?auto_99233 ?auto_99237 ) ( CLEAR ?auto_99233 ) ( IS-CRATE ?auto_99230 ) ( not ( = ?auto_99233 ?auto_99230 ) ) ( AVAILABLE ?auto_99236 ) ( IN ?auto_99230 ?auto_99235 ) ( ON ?auto_99233 ?auto_99232 ) ( not ( = ?auto_99232 ?auto_99233 ) ) ( not ( = ?auto_99232 ?auto_99230 ) ) ( TRUCK-AT ?auto_99235 ?auto_99234 ) ( not ( = ?auto_99234 ?auto_99237 ) ) ( ON ?auto_99232 ?auto_99231 ) ( not ( = ?auto_99231 ?auto_99232 ) ) ( not ( = ?auto_99231 ?auto_99233 ) ) ( not ( = ?auto_99231 ?auto_99230 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99232 ?auto_99233 ?auto_99230 )
      ( MAKE-3CRATE-VERIFY ?auto_99231 ?auto_99232 ?auto_99233 ?auto_99230 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99255 - SURFACE
      ?auto_99256 - SURFACE
      ?auto_99257 - SURFACE
      ?auto_99254 - SURFACE
    )
    :vars
    (
      ?auto_99258 - HOIST
      ?auto_99261 - PLACE
      ?auto_99260 - TRUCK
      ?auto_99262 - PLACE
      ?auto_99259 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_99258 ?auto_99261 ) ( SURFACE-AT ?auto_99257 ?auto_99261 ) ( CLEAR ?auto_99257 ) ( IS-CRATE ?auto_99254 ) ( not ( = ?auto_99257 ?auto_99254 ) ) ( AVAILABLE ?auto_99258 ) ( ON ?auto_99257 ?auto_99256 ) ( not ( = ?auto_99256 ?auto_99257 ) ) ( not ( = ?auto_99256 ?auto_99254 ) ) ( TRUCK-AT ?auto_99260 ?auto_99262 ) ( not ( = ?auto_99262 ?auto_99261 ) ) ( HOIST-AT ?auto_99259 ?auto_99262 ) ( LIFTING ?auto_99259 ?auto_99254 ) ( not ( = ?auto_99258 ?auto_99259 ) ) ( ON ?auto_99256 ?auto_99255 ) ( not ( = ?auto_99255 ?auto_99256 ) ) ( not ( = ?auto_99255 ?auto_99257 ) ) ( not ( = ?auto_99255 ?auto_99254 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99256 ?auto_99257 ?auto_99254 )
      ( MAKE-3CRATE-VERIFY ?auto_99255 ?auto_99256 ?auto_99257 ?auto_99254 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99282 - SURFACE
      ?auto_99283 - SURFACE
      ?auto_99284 - SURFACE
      ?auto_99281 - SURFACE
    )
    :vars
    (
      ?auto_99285 - HOIST
      ?auto_99286 - PLACE
      ?auto_99288 - TRUCK
      ?auto_99287 - PLACE
      ?auto_99290 - HOIST
      ?auto_99289 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99285 ?auto_99286 ) ( SURFACE-AT ?auto_99284 ?auto_99286 ) ( CLEAR ?auto_99284 ) ( IS-CRATE ?auto_99281 ) ( not ( = ?auto_99284 ?auto_99281 ) ) ( AVAILABLE ?auto_99285 ) ( ON ?auto_99284 ?auto_99283 ) ( not ( = ?auto_99283 ?auto_99284 ) ) ( not ( = ?auto_99283 ?auto_99281 ) ) ( TRUCK-AT ?auto_99288 ?auto_99287 ) ( not ( = ?auto_99287 ?auto_99286 ) ) ( HOIST-AT ?auto_99290 ?auto_99287 ) ( not ( = ?auto_99285 ?auto_99290 ) ) ( AVAILABLE ?auto_99290 ) ( SURFACE-AT ?auto_99281 ?auto_99287 ) ( ON ?auto_99281 ?auto_99289 ) ( CLEAR ?auto_99281 ) ( not ( = ?auto_99284 ?auto_99289 ) ) ( not ( = ?auto_99281 ?auto_99289 ) ) ( not ( = ?auto_99283 ?auto_99289 ) ) ( ON ?auto_99283 ?auto_99282 ) ( not ( = ?auto_99282 ?auto_99283 ) ) ( not ( = ?auto_99282 ?auto_99284 ) ) ( not ( = ?auto_99282 ?auto_99281 ) ) ( not ( = ?auto_99282 ?auto_99289 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99283 ?auto_99284 ?auto_99281 )
      ( MAKE-3CRATE-VERIFY ?auto_99282 ?auto_99283 ?auto_99284 ?auto_99281 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99310 - SURFACE
      ?auto_99311 - SURFACE
      ?auto_99312 - SURFACE
      ?auto_99309 - SURFACE
    )
    :vars
    (
      ?auto_99317 - HOIST
      ?auto_99313 - PLACE
      ?auto_99314 - PLACE
      ?auto_99318 - HOIST
      ?auto_99316 - SURFACE
      ?auto_99315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99317 ?auto_99313 ) ( SURFACE-AT ?auto_99312 ?auto_99313 ) ( CLEAR ?auto_99312 ) ( IS-CRATE ?auto_99309 ) ( not ( = ?auto_99312 ?auto_99309 ) ) ( AVAILABLE ?auto_99317 ) ( ON ?auto_99312 ?auto_99311 ) ( not ( = ?auto_99311 ?auto_99312 ) ) ( not ( = ?auto_99311 ?auto_99309 ) ) ( not ( = ?auto_99314 ?auto_99313 ) ) ( HOIST-AT ?auto_99318 ?auto_99314 ) ( not ( = ?auto_99317 ?auto_99318 ) ) ( AVAILABLE ?auto_99318 ) ( SURFACE-AT ?auto_99309 ?auto_99314 ) ( ON ?auto_99309 ?auto_99316 ) ( CLEAR ?auto_99309 ) ( not ( = ?auto_99312 ?auto_99316 ) ) ( not ( = ?auto_99309 ?auto_99316 ) ) ( not ( = ?auto_99311 ?auto_99316 ) ) ( TRUCK-AT ?auto_99315 ?auto_99313 ) ( ON ?auto_99311 ?auto_99310 ) ( not ( = ?auto_99310 ?auto_99311 ) ) ( not ( = ?auto_99310 ?auto_99312 ) ) ( not ( = ?auto_99310 ?auto_99309 ) ) ( not ( = ?auto_99310 ?auto_99316 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99311 ?auto_99312 ?auto_99309 )
      ( MAKE-3CRATE-VERIFY ?auto_99310 ?auto_99311 ?auto_99312 ?auto_99309 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99338 - SURFACE
      ?auto_99339 - SURFACE
      ?auto_99340 - SURFACE
      ?auto_99337 - SURFACE
    )
    :vars
    (
      ?auto_99344 - HOIST
      ?auto_99341 - PLACE
      ?auto_99346 - PLACE
      ?auto_99345 - HOIST
      ?auto_99343 - SURFACE
      ?auto_99342 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99344 ?auto_99341 ) ( IS-CRATE ?auto_99337 ) ( not ( = ?auto_99340 ?auto_99337 ) ) ( not ( = ?auto_99339 ?auto_99340 ) ) ( not ( = ?auto_99339 ?auto_99337 ) ) ( not ( = ?auto_99346 ?auto_99341 ) ) ( HOIST-AT ?auto_99345 ?auto_99346 ) ( not ( = ?auto_99344 ?auto_99345 ) ) ( AVAILABLE ?auto_99345 ) ( SURFACE-AT ?auto_99337 ?auto_99346 ) ( ON ?auto_99337 ?auto_99343 ) ( CLEAR ?auto_99337 ) ( not ( = ?auto_99340 ?auto_99343 ) ) ( not ( = ?auto_99337 ?auto_99343 ) ) ( not ( = ?auto_99339 ?auto_99343 ) ) ( TRUCK-AT ?auto_99342 ?auto_99341 ) ( SURFACE-AT ?auto_99339 ?auto_99341 ) ( CLEAR ?auto_99339 ) ( LIFTING ?auto_99344 ?auto_99340 ) ( IS-CRATE ?auto_99340 ) ( ON ?auto_99339 ?auto_99338 ) ( not ( = ?auto_99338 ?auto_99339 ) ) ( not ( = ?auto_99338 ?auto_99340 ) ) ( not ( = ?auto_99338 ?auto_99337 ) ) ( not ( = ?auto_99338 ?auto_99343 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99339 ?auto_99340 ?auto_99337 )
      ( MAKE-3CRATE-VERIFY ?auto_99338 ?auto_99339 ?auto_99340 ?auto_99337 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99366 - SURFACE
      ?auto_99367 - SURFACE
      ?auto_99368 - SURFACE
      ?auto_99365 - SURFACE
    )
    :vars
    (
      ?auto_99369 - HOIST
      ?auto_99374 - PLACE
      ?auto_99370 - PLACE
      ?auto_99372 - HOIST
      ?auto_99371 - SURFACE
      ?auto_99373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99369 ?auto_99374 ) ( IS-CRATE ?auto_99365 ) ( not ( = ?auto_99368 ?auto_99365 ) ) ( not ( = ?auto_99367 ?auto_99368 ) ) ( not ( = ?auto_99367 ?auto_99365 ) ) ( not ( = ?auto_99370 ?auto_99374 ) ) ( HOIST-AT ?auto_99372 ?auto_99370 ) ( not ( = ?auto_99369 ?auto_99372 ) ) ( AVAILABLE ?auto_99372 ) ( SURFACE-AT ?auto_99365 ?auto_99370 ) ( ON ?auto_99365 ?auto_99371 ) ( CLEAR ?auto_99365 ) ( not ( = ?auto_99368 ?auto_99371 ) ) ( not ( = ?auto_99365 ?auto_99371 ) ) ( not ( = ?auto_99367 ?auto_99371 ) ) ( TRUCK-AT ?auto_99373 ?auto_99374 ) ( SURFACE-AT ?auto_99367 ?auto_99374 ) ( CLEAR ?auto_99367 ) ( IS-CRATE ?auto_99368 ) ( AVAILABLE ?auto_99369 ) ( IN ?auto_99368 ?auto_99373 ) ( ON ?auto_99367 ?auto_99366 ) ( not ( = ?auto_99366 ?auto_99367 ) ) ( not ( = ?auto_99366 ?auto_99368 ) ) ( not ( = ?auto_99366 ?auto_99365 ) ) ( not ( = ?auto_99366 ?auto_99371 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99367 ?auto_99368 ?auto_99365 )
      ( MAKE-3CRATE-VERIFY ?auto_99366 ?auto_99367 ?auto_99368 ?auto_99365 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_99444 - SURFACE
      ?auto_99445 - SURFACE
    )
    :vars
    (
      ?auto_99452 - HOIST
      ?auto_99447 - PLACE
      ?auto_99450 - SURFACE
      ?auto_99449 - PLACE
      ?auto_99448 - HOIST
      ?auto_99451 - SURFACE
      ?auto_99446 - TRUCK
      ?auto_99453 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99452 ?auto_99447 ) ( SURFACE-AT ?auto_99444 ?auto_99447 ) ( CLEAR ?auto_99444 ) ( IS-CRATE ?auto_99445 ) ( not ( = ?auto_99444 ?auto_99445 ) ) ( AVAILABLE ?auto_99452 ) ( ON ?auto_99444 ?auto_99450 ) ( not ( = ?auto_99450 ?auto_99444 ) ) ( not ( = ?auto_99450 ?auto_99445 ) ) ( not ( = ?auto_99449 ?auto_99447 ) ) ( HOIST-AT ?auto_99448 ?auto_99449 ) ( not ( = ?auto_99452 ?auto_99448 ) ) ( AVAILABLE ?auto_99448 ) ( SURFACE-AT ?auto_99445 ?auto_99449 ) ( ON ?auto_99445 ?auto_99451 ) ( CLEAR ?auto_99445 ) ( not ( = ?auto_99444 ?auto_99451 ) ) ( not ( = ?auto_99445 ?auto_99451 ) ) ( not ( = ?auto_99450 ?auto_99451 ) ) ( TRUCK-AT ?auto_99446 ?auto_99453 ) ( not ( = ?auto_99453 ?auto_99447 ) ) ( not ( = ?auto_99449 ?auto_99453 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_99446 ?auto_99453 ?auto_99447 )
      ( MAKE-1CRATE ?auto_99444 ?auto_99445 )
      ( MAKE-1CRATE-VERIFY ?auto_99444 ?auto_99445 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_99550 - SURFACE
      ?auto_99551 - SURFACE
    )
    :vars
    (
      ?auto_99558 - HOIST
      ?auto_99556 - PLACE
      ?auto_99554 - SURFACE
      ?auto_99555 - PLACE
      ?auto_99553 - HOIST
      ?auto_99552 - SURFACE
      ?auto_99557 - TRUCK
      ?auto_99559 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99558 ?auto_99556 ) ( SURFACE-AT ?auto_99550 ?auto_99556 ) ( CLEAR ?auto_99550 ) ( IS-CRATE ?auto_99551 ) ( not ( = ?auto_99550 ?auto_99551 ) ) ( ON ?auto_99550 ?auto_99554 ) ( not ( = ?auto_99554 ?auto_99550 ) ) ( not ( = ?auto_99554 ?auto_99551 ) ) ( not ( = ?auto_99555 ?auto_99556 ) ) ( HOIST-AT ?auto_99553 ?auto_99555 ) ( not ( = ?auto_99558 ?auto_99553 ) ) ( AVAILABLE ?auto_99553 ) ( SURFACE-AT ?auto_99551 ?auto_99555 ) ( ON ?auto_99551 ?auto_99552 ) ( CLEAR ?auto_99551 ) ( not ( = ?auto_99550 ?auto_99552 ) ) ( not ( = ?auto_99551 ?auto_99552 ) ) ( not ( = ?auto_99554 ?auto_99552 ) ) ( TRUCK-AT ?auto_99557 ?auto_99556 ) ( LIFTING ?auto_99558 ?auto_99559 ) ( IS-CRATE ?auto_99559 ) ( not ( = ?auto_99550 ?auto_99559 ) ) ( not ( = ?auto_99551 ?auto_99559 ) ) ( not ( = ?auto_99554 ?auto_99559 ) ) ( not ( = ?auto_99552 ?auto_99559 ) ) )
    :subtasks
    ( ( !LOAD ?auto_99558 ?auto_99559 ?auto_99557 ?auto_99556 )
      ( MAKE-1CRATE ?auto_99550 ?auto_99551 )
      ( MAKE-1CRATE-VERIFY ?auto_99550 ?auto_99551 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99659 - SURFACE
      ?auto_99660 - SURFACE
      ?auto_99661 - SURFACE
      ?auto_99658 - SURFACE
      ?auto_99662 - SURFACE
    )
    :vars
    (
      ?auto_99664 - HOIST
      ?auto_99663 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99664 ?auto_99663 ) ( SURFACE-AT ?auto_99658 ?auto_99663 ) ( CLEAR ?auto_99658 ) ( LIFTING ?auto_99664 ?auto_99662 ) ( IS-CRATE ?auto_99662 ) ( not ( = ?auto_99658 ?auto_99662 ) ) ( ON ?auto_99660 ?auto_99659 ) ( ON ?auto_99661 ?auto_99660 ) ( ON ?auto_99658 ?auto_99661 ) ( not ( = ?auto_99659 ?auto_99660 ) ) ( not ( = ?auto_99659 ?auto_99661 ) ) ( not ( = ?auto_99659 ?auto_99658 ) ) ( not ( = ?auto_99659 ?auto_99662 ) ) ( not ( = ?auto_99660 ?auto_99661 ) ) ( not ( = ?auto_99660 ?auto_99658 ) ) ( not ( = ?auto_99660 ?auto_99662 ) ) ( not ( = ?auto_99661 ?auto_99658 ) ) ( not ( = ?auto_99661 ?auto_99662 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99658 ?auto_99662 )
      ( MAKE-4CRATE-VERIFY ?auto_99659 ?auto_99660 ?auto_99661 ?auto_99658 ?auto_99662 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99684 - SURFACE
      ?auto_99685 - SURFACE
      ?auto_99686 - SURFACE
      ?auto_99683 - SURFACE
      ?auto_99687 - SURFACE
    )
    :vars
    (
      ?auto_99689 - HOIST
      ?auto_99688 - PLACE
      ?auto_99690 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99689 ?auto_99688 ) ( SURFACE-AT ?auto_99683 ?auto_99688 ) ( CLEAR ?auto_99683 ) ( IS-CRATE ?auto_99687 ) ( not ( = ?auto_99683 ?auto_99687 ) ) ( TRUCK-AT ?auto_99690 ?auto_99688 ) ( AVAILABLE ?auto_99689 ) ( IN ?auto_99687 ?auto_99690 ) ( ON ?auto_99683 ?auto_99686 ) ( not ( = ?auto_99686 ?auto_99683 ) ) ( not ( = ?auto_99686 ?auto_99687 ) ) ( ON ?auto_99685 ?auto_99684 ) ( ON ?auto_99686 ?auto_99685 ) ( not ( = ?auto_99684 ?auto_99685 ) ) ( not ( = ?auto_99684 ?auto_99686 ) ) ( not ( = ?auto_99684 ?auto_99683 ) ) ( not ( = ?auto_99684 ?auto_99687 ) ) ( not ( = ?auto_99685 ?auto_99686 ) ) ( not ( = ?auto_99685 ?auto_99683 ) ) ( not ( = ?auto_99685 ?auto_99687 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99686 ?auto_99683 ?auto_99687 )
      ( MAKE-4CRATE-VERIFY ?auto_99684 ?auto_99685 ?auto_99686 ?auto_99683 ?auto_99687 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99714 - SURFACE
      ?auto_99715 - SURFACE
      ?auto_99716 - SURFACE
      ?auto_99713 - SURFACE
      ?auto_99717 - SURFACE
    )
    :vars
    (
      ?auto_99721 - HOIST
      ?auto_99719 - PLACE
      ?auto_99720 - TRUCK
      ?auto_99718 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99721 ?auto_99719 ) ( SURFACE-AT ?auto_99713 ?auto_99719 ) ( CLEAR ?auto_99713 ) ( IS-CRATE ?auto_99717 ) ( not ( = ?auto_99713 ?auto_99717 ) ) ( AVAILABLE ?auto_99721 ) ( IN ?auto_99717 ?auto_99720 ) ( ON ?auto_99713 ?auto_99716 ) ( not ( = ?auto_99716 ?auto_99713 ) ) ( not ( = ?auto_99716 ?auto_99717 ) ) ( TRUCK-AT ?auto_99720 ?auto_99718 ) ( not ( = ?auto_99718 ?auto_99719 ) ) ( ON ?auto_99715 ?auto_99714 ) ( ON ?auto_99716 ?auto_99715 ) ( not ( = ?auto_99714 ?auto_99715 ) ) ( not ( = ?auto_99714 ?auto_99716 ) ) ( not ( = ?auto_99714 ?auto_99713 ) ) ( not ( = ?auto_99714 ?auto_99717 ) ) ( not ( = ?auto_99715 ?auto_99716 ) ) ( not ( = ?auto_99715 ?auto_99713 ) ) ( not ( = ?auto_99715 ?auto_99717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99716 ?auto_99713 ?auto_99717 )
      ( MAKE-4CRATE-VERIFY ?auto_99714 ?auto_99715 ?auto_99716 ?auto_99713 ?auto_99717 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99748 - SURFACE
      ?auto_99749 - SURFACE
      ?auto_99750 - SURFACE
      ?auto_99747 - SURFACE
      ?auto_99751 - SURFACE
    )
    :vars
    (
      ?auto_99755 - HOIST
      ?auto_99753 - PLACE
      ?auto_99752 - TRUCK
      ?auto_99756 - PLACE
      ?auto_99754 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_99755 ?auto_99753 ) ( SURFACE-AT ?auto_99747 ?auto_99753 ) ( CLEAR ?auto_99747 ) ( IS-CRATE ?auto_99751 ) ( not ( = ?auto_99747 ?auto_99751 ) ) ( AVAILABLE ?auto_99755 ) ( ON ?auto_99747 ?auto_99750 ) ( not ( = ?auto_99750 ?auto_99747 ) ) ( not ( = ?auto_99750 ?auto_99751 ) ) ( TRUCK-AT ?auto_99752 ?auto_99756 ) ( not ( = ?auto_99756 ?auto_99753 ) ) ( HOIST-AT ?auto_99754 ?auto_99756 ) ( LIFTING ?auto_99754 ?auto_99751 ) ( not ( = ?auto_99755 ?auto_99754 ) ) ( ON ?auto_99749 ?auto_99748 ) ( ON ?auto_99750 ?auto_99749 ) ( not ( = ?auto_99748 ?auto_99749 ) ) ( not ( = ?auto_99748 ?auto_99750 ) ) ( not ( = ?auto_99748 ?auto_99747 ) ) ( not ( = ?auto_99748 ?auto_99751 ) ) ( not ( = ?auto_99749 ?auto_99750 ) ) ( not ( = ?auto_99749 ?auto_99747 ) ) ( not ( = ?auto_99749 ?auto_99751 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99750 ?auto_99747 ?auto_99751 )
      ( MAKE-4CRATE-VERIFY ?auto_99748 ?auto_99749 ?auto_99750 ?auto_99747 ?auto_99751 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99786 - SURFACE
      ?auto_99787 - SURFACE
      ?auto_99788 - SURFACE
      ?auto_99785 - SURFACE
      ?auto_99789 - SURFACE
    )
    :vars
    (
      ?auto_99791 - HOIST
      ?auto_99795 - PLACE
      ?auto_99793 - TRUCK
      ?auto_99794 - PLACE
      ?auto_99790 - HOIST
      ?auto_99792 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99791 ?auto_99795 ) ( SURFACE-AT ?auto_99785 ?auto_99795 ) ( CLEAR ?auto_99785 ) ( IS-CRATE ?auto_99789 ) ( not ( = ?auto_99785 ?auto_99789 ) ) ( AVAILABLE ?auto_99791 ) ( ON ?auto_99785 ?auto_99788 ) ( not ( = ?auto_99788 ?auto_99785 ) ) ( not ( = ?auto_99788 ?auto_99789 ) ) ( TRUCK-AT ?auto_99793 ?auto_99794 ) ( not ( = ?auto_99794 ?auto_99795 ) ) ( HOIST-AT ?auto_99790 ?auto_99794 ) ( not ( = ?auto_99791 ?auto_99790 ) ) ( AVAILABLE ?auto_99790 ) ( SURFACE-AT ?auto_99789 ?auto_99794 ) ( ON ?auto_99789 ?auto_99792 ) ( CLEAR ?auto_99789 ) ( not ( = ?auto_99785 ?auto_99792 ) ) ( not ( = ?auto_99789 ?auto_99792 ) ) ( not ( = ?auto_99788 ?auto_99792 ) ) ( ON ?auto_99787 ?auto_99786 ) ( ON ?auto_99788 ?auto_99787 ) ( not ( = ?auto_99786 ?auto_99787 ) ) ( not ( = ?auto_99786 ?auto_99788 ) ) ( not ( = ?auto_99786 ?auto_99785 ) ) ( not ( = ?auto_99786 ?auto_99789 ) ) ( not ( = ?auto_99786 ?auto_99792 ) ) ( not ( = ?auto_99787 ?auto_99788 ) ) ( not ( = ?auto_99787 ?auto_99785 ) ) ( not ( = ?auto_99787 ?auto_99789 ) ) ( not ( = ?auto_99787 ?auto_99792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99788 ?auto_99785 ?auto_99789 )
      ( MAKE-4CRATE-VERIFY ?auto_99786 ?auto_99787 ?auto_99788 ?auto_99785 ?auto_99789 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99825 - SURFACE
      ?auto_99826 - SURFACE
      ?auto_99827 - SURFACE
      ?auto_99824 - SURFACE
      ?auto_99828 - SURFACE
    )
    :vars
    (
      ?auto_99831 - HOIST
      ?auto_99833 - PLACE
      ?auto_99832 - PLACE
      ?auto_99829 - HOIST
      ?auto_99834 - SURFACE
      ?auto_99830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99831 ?auto_99833 ) ( SURFACE-AT ?auto_99824 ?auto_99833 ) ( CLEAR ?auto_99824 ) ( IS-CRATE ?auto_99828 ) ( not ( = ?auto_99824 ?auto_99828 ) ) ( AVAILABLE ?auto_99831 ) ( ON ?auto_99824 ?auto_99827 ) ( not ( = ?auto_99827 ?auto_99824 ) ) ( not ( = ?auto_99827 ?auto_99828 ) ) ( not ( = ?auto_99832 ?auto_99833 ) ) ( HOIST-AT ?auto_99829 ?auto_99832 ) ( not ( = ?auto_99831 ?auto_99829 ) ) ( AVAILABLE ?auto_99829 ) ( SURFACE-AT ?auto_99828 ?auto_99832 ) ( ON ?auto_99828 ?auto_99834 ) ( CLEAR ?auto_99828 ) ( not ( = ?auto_99824 ?auto_99834 ) ) ( not ( = ?auto_99828 ?auto_99834 ) ) ( not ( = ?auto_99827 ?auto_99834 ) ) ( TRUCK-AT ?auto_99830 ?auto_99833 ) ( ON ?auto_99826 ?auto_99825 ) ( ON ?auto_99827 ?auto_99826 ) ( not ( = ?auto_99825 ?auto_99826 ) ) ( not ( = ?auto_99825 ?auto_99827 ) ) ( not ( = ?auto_99825 ?auto_99824 ) ) ( not ( = ?auto_99825 ?auto_99828 ) ) ( not ( = ?auto_99825 ?auto_99834 ) ) ( not ( = ?auto_99826 ?auto_99827 ) ) ( not ( = ?auto_99826 ?auto_99824 ) ) ( not ( = ?auto_99826 ?auto_99828 ) ) ( not ( = ?auto_99826 ?auto_99834 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99827 ?auto_99824 ?auto_99828 )
      ( MAKE-4CRATE-VERIFY ?auto_99825 ?auto_99826 ?auto_99827 ?auto_99824 ?auto_99828 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99864 - SURFACE
      ?auto_99865 - SURFACE
      ?auto_99866 - SURFACE
      ?auto_99863 - SURFACE
      ?auto_99867 - SURFACE
    )
    :vars
    (
      ?auto_99869 - HOIST
      ?auto_99870 - PLACE
      ?auto_99871 - PLACE
      ?auto_99872 - HOIST
      ?auto_99868 - SURFACE
      ?auto_99873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99869 ?auto_99870 ) ( IS-CRATE ?auto_99867 ) ( not ( = ?auto_99863 ?auto_99867 ) ) ( not ( = ?auto_99866 ?auto_99863 ) ) ( not ( = ?auto_99866 ?auto_99867 ) ) ( not ( = ?auto_99871 ?auto_99870 ) ) ( HOIST-AT ?auto_99872 ?auto_99871 ) ( not ( = ?auto_99869 ?auto_99872 ) ) ( AVAILABLE ?auto_99872 ) ( SURFACE-AT ?auto_99867 ?auto_99871 ) ( ON ?auto_99867 ?auto_99868 ) ( CLEAR ?auto_99867 ) ( not ( = ?auto_99863 ?auto_99868 ) ) ( not ( = ?auto_99867 ?auto_99868 ) ) ( not ( = ?auto_99866 ?auto_99868 ) ) ( TRUCK-AT ?auto_99873 ?auto_99870 ) ( SURFACE-AT ?auto_99866 ?auto_99870 ) ( CLEAR ?auto_99866 ) ( LIFTING ?auto_99869 ?auto_99863 ) ( IS-CRATE ?auto_99863 ) ( ON ?auto_99865 ?auto_99864 ) ( ON ?auto_99866 ?auto_99865 ) ( not ( = ?auto_99864 ?auto_99865 ) ) ( not ( = ?auto_99864 ?auto_99866 ) ) ( not ( = ?auto_99864 ?auto_99863 ) ) ( not ( = ?auto_99864 ?auto_99867 ) ) ( not ( = ?auto_99864 ?auto_99868 ) ) ( not ( = ?auto_99865 ?auto_99866 ) ) ( not ( = ?auto_99865 ?auto_99863 ) ) ( not ( = ?auto_99865 ?auto_99867 ) ) ( not ( = ?auto_99865 ?auto_99868 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99866 ?auto_99863 ?auto_99867 )
      ( MAKE-4CRATE-VERIFY ?auto_99864 ?auto_99865 ?auto_99866 ?auto_99863 ?auto_99867 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99903 - SURFACE
      ?auto_99904 - SURFACE
      ?auto_99905 - SURFACE
      ?auto_99902 - SURFACE
      ?auto_99906 - SURFACE
    )
    :vars
    (
      ?auto_99907 - HOIST
      ?auto_99909 - PLACE
      ?auto_99912 - PLACE
      ?auto_99911 - HOIST
      ?auto_99910 - SURFACE
      ?auto_99908 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99907 ?auto_99909 ) ( IS-CRATE ?auto_99906 ) ( not ( = ?auto_99902 ?auto_99906 ) ) ( not ( = ?auto_99905 ?auto_99902 ) ) ( not ( = ?auto_99905 ?auto_99906 ) ) ( not ( = ?auto_99912 ?auto_99909 ) ) ( HOIST-AT ?auto_99911 ?auto_99912 ) ( not ( = ?auto_99907 ?auto_99911 ) ) ( AVAILABLE ?auto_99911 ) ( SURFACE-AT ?auto_99906 ?auto_99912 ) ( ON ?auto_99906 ?auto_99910 ) ( CLEAR ?auto_99906 ) ( not ( = ?auto_99902 ?auto_99910 ) ) ( not ( = ?auto_99906 ?auto_99910 ) ) ( not ( = ?auto_99905 ?auto_99910 ) ) ( TRUCK-AT ?auto_99908 ?auto_99909 ) ( SURFACE-AT ?auto_99905 ?auto_99909 ) ( CLEAR ?auto_99905 ) ( IS-CRATE ?auto_99902 ) ( AVAILABLE ?auto_99907 ) ( IN ?auto_99902 ?auto_99908 ) ( ON ?auto_99904 ?auto_99903 ) ( ON ?auto_99905 ?auto_99904 ) ( not ( = ?auto_99903 ?auto_99904 ) ) ( not ( = ?auto_99903 ?auto_99905 ) ) ( not ( = ?auto_99903 ?auto_99902 ) ) ( not ( = ?auto_99903 ?auto_99906 ) ) ( not ( = ?auto_99903 ?auto_99910 ) ) ( not ( = ?auto_99904 ?auto_99905 ) ) ( not ( = ?auto_99904 ?auto_99902 ) ) ( not ( = ?auto_99904 ?auto_99906 ) ) ( not ( = ?auto_99904 ?auto_99910 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99905 ?auto_99902 ?auto_99906 )
      ( MAKE-4CRATE-VERIFY ?auto_99903 ?auto_99904 ?auto_99905 ?auto_99902 ?auto_99906 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100563 - SURFACE
      ?auto_100564 - SURFACE
      ?auto_100565 - SURFACE
      ?auto_100562 - SURFACE
      ?auto_100566 - SURFACE
      ?auto_100567 - SURFACE
    )
    :vars
    (
      ?auto_100569 - HOIST
      ?auto_100568 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_100569 ?auto_100568 ) ( SURFACE-AT ?auto_100566 ?auto_100568 ) ( CLEAR ?auto_100566 ) ( LIFTING ?auto_100569 ?auto_100567 ) ( IS-CRATE ?auto_100567 ) ( not ( = ?auto_100566 ?auto_100567 ) ) ( ON ?auto_100564 ?auto_100563 ) ( ON ?auto_100565 ?auto_100564 ) ( ON ?auto_100562 ?auto_100565 ) ( ON ?auto_100566 ?auto_100562 ) ( not ( = ?auto_100563 ?auto_100564 ) ) ( not ( = ?auto_100563 ?auto_100565 ) ) ( not ( = ?auto_100563 ?auto_100562 ) ) ( not ( = ?auto_100563 ?auto_100566 ) ) ( not ( = ?auto_100563 ?auto_100567 ) ) ( not ( = ?auto_100564 ?auto_100565 ) ) ( not ( = ?auto_100564 ?auto_100562 ) ) ( not ( = ?auto_100564 ?auto_100566 ) ) ( not ( = ?auto_100564 ?auto_100567 ) ) ( not ( = ?auto_100565 ?auto_100562 ) ) ( not ( = ?auto_100565 ?auto_100566 ) ) ( not ( = ?auto_100565 ?auto_100567 ) ) ( not ( = ?auto_100562 ?auto_100566 ) ) ( not ( = ?auto_100562 ?auto_100567 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_100566 ?auto_100567 )
      ( MAKE-5CRATE-VERIFY ?auto_100563 ?auto_100564 ?auto_100565 ?auto_100562 ?auto_100566 ?auto_100567 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100597 - SURFACE
      ?auto_100598 - SURFACE
      ?auto_100599 - SURFACE
      ?auto_100596 - SURFACE
      ?auto_100600 - SURFACE
      ?auto_100601 - SURFACE
    )
    :vars
    (
      ?auto_100603 - HOIST
      ?auto_100604 - PLACE
      ?auto_100602 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_100603 ?auto_100604 ) ( SURFACE-AT ?auto_100600 ?auto_100604 ) ( CLEAR ?auto_100600 ) ( IS-CRATE ?auto_100601 ) ( not ( = ?auto_100600 ?auto_100601 ) ) ( TRUCK-AT ?auto_100602 ?auto_100604 ) ( AVAILABLE ?auto_100603 ) ( IN ?auto_100601 ?auto_100602 ) ( ON ?auto_100600 ?auto_100596 ) ( not ( = ?auto_100596 ?auto_100600 ) ) ( not ( = ?auto_100596 ?auto_100601 ) ) ( ON ?auto_100598 ?auto_100597 ) ( ON ?auto_100599 ?auto_100598 ) ( ON ?auto_100596 ?auto_100599 ) ( not ( = ?auto_100597 ?auto_100598 ) ) ( not ( = ?auto_100597 ?auto_100599 ) ) ( not ( = ?auto_100597 ?auto_100596 ) ) ( not ( = ?auto_100597 ?auto_100600 ) ) ( not ( = ?auto_100597 ?auto_100601 ) ) ( not ( = ?auto_100598 ?auto_100599 ) ) ( not ( = ?auto_100598 ?auto_100596 ) ) ( not ( = ?auto_100598 ?auto_100600 ) ) ( not ( = ?auto_100598 ?auto_100601 ) ) ( not ( = ?auto_100599 ?auto_100596 ) ) ( not ( = ?auto_100599 ?auto_100600 ) ) ( not ( = ?auto_100599 ?auto_100601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100596 ?auto_100600 ?auto_100601 )
      ( MAKE-5CRATE-VERIFY ?auto_100597 ?auto_100598 ?auto_100599 ?auto_100596 ?auto_100600 ?auto_100601 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100637 - SURFACE
      ?auto_100638 - SURFACE
      ?auto_100639 - SURFACE
      ?auto_100636 - SURFACE
      ?auto_100640 - SURFACE
      ?auto_100641 - SURFACE
    )
    :vars
    (
      ?auto_100642 - HOIST
      ?auto_100645 - PLACE
      ?auto_100643 - TRUCK
      ?auto_100644 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_100642 ?auto_100645 ) ( SURFACE-AT ?auto_100640 ?auto_100645 ) ( CLEAR ?auto_100640 ) ( IS-CRATE ?auto_100641 ) ( not ( = ?auto_100640 ?auto_100641 ) ) ( AVAILABLE ?auto_100642 ) ( IN ?auto_100641 ?auto_100643 ) ( ON ?auto_100640 ?auto_100636 ) ( not ( = ?auto_100636 ?auto_100640 ) ) ( not ( = ?auto_100636 ?auto_100641 ) ) ( TRUCK-AT ?auto_100643 ?auto_100644 ) ( not ( = ?auto_100644 ?auto_100645 ) ) ( ON ?auto_100638 ?auto_100637 ) ( ON ?auto_100639 ?auto_100638 ) ( ON ?auto_100636 ?auto_100639 ) ( not ( = ?auto_100637 ?auto_100638 ) ) ( not ( = ?auto_100637 ?auto_100639 ) ) ( not ( = ?auto_100637 ?auto_100636 ) ) ( not ( = ?auto_100637 ?auto_100640 ) ) ( not ( = ?auto_100637 ?auto_100641 ) ) ( not ( = ?auto_100638 ?auto_100639 ) ) ( not ( = ?auto_100638 ?auto_100636 ) ) ( not ( = ?auto_100638 ?auto_100640 ) ) ( not ( = ?auto_100638 ?auto_100641 ) ) ( not ( = ?auto_100639 ?auto_100636 ) ) ( not ( = ?auto_100639 ?auto_100640 ) ) ( not ( = ?auto_100639 ?auto_100641 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100636 ?auto_100640 ?auto_100641 )
      ( MAKE-5CRATE-VERIFY ?auto_100637 ?auto_100638 ?auto_100639 ?auto_100636 ?auto_100640 ?auto_100641 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100682 - SURFACE
      ?auto_100683 - SURFACE
      ?auto_100684 - SURFACE
      ?auto_100681 - SURFACE
      ?auto_100685 - SURFACE
      ?auto_100686 - SURFACE
    )
    :vars
    (
      ?auto_100690 - HOIST
      ?auto_100691 - PLACE
      ?auto_100689 - TRUCK
      ?auto_100687 - PLACE
      ?auto_100688 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_100690 ?auto_100691 ) ( SURFACE-AT ?auto_100685 ?auto_100691 ) ( CLEAR ?auto_100685 ) ( IS-CRATE ?auto_100686 ) ( not ( = ?auto_100685 ?auto_100686 ) ) ( AVAILABLE ?auto_100690 ) ( ON ?auto_100685 ?auto_100681 ) ( not ( = ?auto_100681 ?auto_100685 ) ) ( not ( = ?auto_100681 ?auto_100686 ) ) ( TRUCK-AT ?auto_100689 ?auto_100687 ) ( not ( = ?auto_100687 ?auto_100691 ) ) ( HOIST-AT ?auto_100688 ?auto_100687 ) ( LIFTING ?auto_100688 ?auto_100686 ) ( not ( = ?auto_100690 ?auto_100688 ) ) ( ON ?auto_100683 ?auto_100682 ) ( ON ?auto_100684 ?auto_100683 ) ( ON ?auto_100681 ?auto_100684 ) ( not ( = ?auto_100682 ?auto_100683 ) ) ( not ( = ?auto_100682 ?auto_100684 ) ) ( not ( = ?auto_100682 ?auto_100681 ) ) ( not ( = ?auto_100682 ?auto_100685 ) ) ( not ( = ?auto_100682 ?auto_100686 ) ) ( not ( = ?auto_100683 ?auto_100684 ) ) ( not ( = ?auto_100683 ?auto_100681 ) ) ( not ( = ?auto_100683 ?auto_100685 ) ) ( not ( = ?auto_100683 ?auto_100686 ) ) ( not ( = ?auto_100684 ?auto_100681 ) ) ( not ( = ?auto_100684 ?auto_100685 ) ) ( not ( = ?auto_100684 ?auto_100686 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100681 ?auto_100685 ?auto_100686 )
      ( MAKE-5CRATE-VERIFY ?auto_100682 ?auto_100683 ?auto_100684 ?auto_100681 ?auto_100685 ?auto_100686 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100732 - SURFACE
      ?auto_100733 - SURFACE
      ?auto_100734 - SURFACE
      ?auto_100731 - SURFACE
      ?auto_100735 - SURFACE
      ?auto_100736 - SURFACE
    )
    :vars
    (
      ?auto_100737 - HOIST
      ?auto_100739 - PLACE
      ?auto_100741 - TRUCK
      ?auto_100738 - PLACE
      ?auto_100740 - HOIST
      ?auto_100742 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_100737 ?auto_100739 ) ( SURFACE-AT ?auto_100735 ?auto_100739 ) ( CLEAR ?auto_100735 ) ( IS-CRATE ?auto_100736 ) ( not ( = ?auto_100735 ?auto_100736 ) ) ( AVAILABLE ?auto_100737 ) ( ON ?auto_100735 ?auto_100731 ) ( not ( = ?auto_100731 ?auto_100735 ) ) ( not ( = ?auto_100731 ?auto_100736 ) ) ( TRUCK-AT ?auto_100741 ?auto_100738 ) ( not ( = ?auto_100738 ?auto_100739 ) ) ( HOIST-AT ?auto_100740 ?auto_100738 ) ( not ( = ?auto_100737 ?auto_100740 ) ) ( AVAILABLE ?auto_100740 ) ( SURFACE-AT ?auto_100736 ?auto_100738 ) ( ON ?auto_100736 ?auto_100742 ) ( CLEAR ?auto_100736 ) ( not ( = ?auto_100735 ?auto_100742 ) ) ( not ( = ?auto_100736 ?auto_100742 ) ) ( not ( = ?auto_100731 ?auto_100742 ) ) ( ON ?auto_100733 ?auto_100732 ) ( ON ?auto_100734 ?auto_100733 ) ( ON ?auto_100731 ?auto_100734 ) ( not ( = ?auto_100732 ?auto_100733 ) ) ( not ( = ?auto_100732 ?auto_100734 ) ) ( not ( = ?auto_100732 ?auto_100731 ) ) ( not ( = ?auto_100732 ?auto_100735 ) ) ( not ( = ?auto_100732 ?auto_100736 ) ) ( not ( = ?auto_100732 ?auto_100742 ) ) ( not ( = ?auto_100733 ?auto_100734 ) ) ( not ( = ?auto_100733 ?auto_100731 ) ) ( not ( = ?auto_100733 ?auto_100735 ) ) ( not ( = ?auto_100733 ?auto_100736 ) ) ( not ( = ?auto_100733 ?auto_100742 ) ) ( not ( = ?auto_100734 ?auto_100731 ) ) ( not ( = ?auto_100734 ?auto_100735 ) ) ( not ( = ?auto_100734 ?auto_100736 ) ) ( not ( = ?auto_100734 ?auto_100742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100731 ?auto_100735 ?auto_100736 )
      ( MAKE-5CRATE-VERIFY ?auto_100732 ?auto_100733 ?auto_100734 ?auto_100731 ?auto_100735 ?auto_100736 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100783 - SURFACE
      ?auto_100784 - SURFACE
      ?auto_100785 - SURFACE
      ?auto_100782 - SURFACE
      ?auto_100786 - SURFACE
      ?auto_100787 - SURFACE
    )
    :vars
    (
      ?auto_100789 - HOIST
      ?auto_100790 - PLACE
      ?auto_100792 - PLACE
      ?auto_100788 - HOIST
      ?auto_100793 - SURFACE
      ?auto_100791 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_100789 ?auto_100790 ) ( SURFACE-AT ?auto_100786 ?auto_100790 ) ( CLEAR ?auto_100786 ) ( IS-CRATE ?auto_100787 ) ( not ( = ?auto_100786 ?auto_100787 ) ) ( AVAILABLE ?auto_100789 ) ( ON ?auto_100786 ?auto_100782 ) ( not ( = ?auto_100782 ?auto_100786 ) ) ( not ( = ?auto_100782 ?auto_100787 ) ) ( not ( = ?auto_100792 ?auto_100790 ) ) ( HOIST-AT ?auto_100788 ?auto_100792 ) ( not ( = ?auto_100789 ?auto_100788 ) ) ( AVAILABLE ?auto_100788 ) ( SURFACE-AT ?auto_100787 ?auto_100792 ) ( ON ?auto_100787 ?auto_100793 ) ( CLEAR ?auto_100787 ) ( not ( = ?auto_100786 ?auto_100793 ) ) ( not ( = ?auto_100787 ?auto_100793 ) ) ( not ( = ?auto_100782 ?auto_100793 ) ) ( TRUCK-AT ?auto_100791 ?auto_100790 ) ( ON ?auto_100784 ?auto_100783 ) ( ON ?auto_100785 ?auto_100784 ) ( ON ?auto_100782 ?auto_100785 ) ( not ( = ?auto_100783 ?auto_100784 ) ) ( not ( = ?auto_100783 ?auto_100785 ) ) ( not ( = ?auto_100783 ?auto_100782 ) ) ( not ( = ?auto_100783 ?auto_100786 ) ) ( not ( = ?auto_100783 ?auto_100787 ) ) ( not ( = ?auto_100783 ?auto_100793 ) ) ( not ( = ?auto_100784 ?auto_100785 ) ) ( not ( = ?auto_100784 ?auto_100782 ) ) ( not ( = ?auto_100784 ?auto_100786 ) ) ( not ( = ?auto_100784 ?auto_100787 ) ) ( not ( = ?auto_100784 ?auto_100793 ) ) ( not ( = ?auto_100785 ?auto_100782 ) ) ( not ( = ?auto_100785 ?auto_100786 ) ) ( not ( = ?auto_100785 ?auto_100787 ) ) ( not ( = ?auto_100785 ?auto_100793 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100782 ?auto_100786 ?auto_100787 )
      ( MAKE-5CRATE-VERIFY ?auto_100783 ?auto_100784 ?auto_100785 ?auto_100782 ?auto_100786 ?auto_100787 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100834 - SURFACE
      ?auto_100835 - SURFACE
      ?auto_100836 - SURFACE
      ?auto_100833 - SURFACE
      ?auto_100837 - SURFACE
      ?auto_100838 - SURFACE
    )
    :vars
    (
      ?auto_100843 - HOIST
      ?auto_100842 - PLACE
      ?auto_100839 - PLACE
      ?auto_100841 - HOIST
      ?auto_100840 - SURFACE
      ?auto_100844 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_100843 ?auto_100842 ) ( IS-CRATE ?auto_100838 ) ( not ( = ?auto_100837 ?auto_100838 ) ) ( not ( = ?auto_100833 ?auto_100837 ) ) ( not ( = ?auto_100833 ?auto_100838 ) ) ( not ( = ?auto_100839 ?auto_100842 ) ) ( HOIST-AT ?auto_100841 ?auto_100839 ) ( not ( = ?auto_100843 ?auto_100841 ) ) ( AVAILABLE ?auto_100841 ) ( SURFACE-AT ?auto_100838 ?auto_100839 ) ( ON ?auto_100838 ?auto_100840 ) ( CLEAR ?auto_100838 ) ( not ( = ?auto_100837 ?auto_100840 ) ) ( not ( = ?auto_100838 ?auto_100840 ) ) ( not ( = ?auto_100833 ?auto_100840 ) ) ( TRUCK-AT ?auto_100844 ?auto_100842 ) ( SURFACE-AT ?auto_100833 ?auto_100842 ) ( CLEAR ?auto_100833 ) ( LIFTING ?auto_100843 ?auto_100837 ) ( IS-CRATE ?auto_100837 ) ( ON ?auto_100835 ?auto_100834 ) ( ON ?auto_100836 ?auto_100835 ) ( ON ?auto_100833 ?auto_100836 ) ( not ( = ?auto_100834 ?auto_100835 ) ) ( not ( = ?auto_100834 ?auto_100836 ) ) ( not ( = ?auto_100834 ?auto_100833 ) ) ( not ( = ?auto_100834 ?auto_100837 ) ) ( not ( = ?auto_100834 ?auto_100838 ) ) ( not ( = ?auto_100834 ?auto_100840 ) ) ( not ( = ?auto_100835 ?auto_100836 ) ) ( not ( = ?auto_100835 ?auto_100833 ) ) ( not ( = ?auto_100835 ?auto_100837 ) ) ( not ( = ?auto_100835 ?auto_100838 ) ) ( not ( = ?auto_100835 ?auto_100840 ) ) ( not ( = ?auto_100836 ?auto_100833 ) ) ( not ( = ?auto_100836 ?auto_100837 ) ) ( not ( = ?auto_100836 ?auto_100838 ) ) ( not ( = ?auto_100836 ?auto_100840 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100833 ?auto_100837 ?auto_100838 )
      ( MAKE-5CRATE-VERIFY ?auto_100834 ?auto_100835 ?auto_100836 ?auto_100833 ?auto_100837 ?auto_100838 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100885 - SURFACE
      ?auto_100886 - SURFACE
      ?auto_100887 - SURFACE
      ?auto_100884 - SURFACE
      ?auto_100888 - SURFACE
      ?auto_100889 - SURFACE
    )
    :vars
    (
      ?auto_100895 - HOIST
      ?auto_100890 - PLACE
      ?auto_100893 - PLACE
      ?auto_100892 - HOIST
      ?auto_100894 - SURFACE
      ?auto_100891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_100895 ?auto_100890 ) ( IS-CRATE ?auto_100889 ) ( not ( = ?auto_100888 ?auto_100889 ) ) ( not ( = ?auto_100884 ?auto_100888 ) ) ( not ( = ?auto_100884 ?auto_100889 ) ) ( not ( = ?auto_100893 ?auto_100890 ) ) ( HOIST-AT ?auto_100892 ?auto_100893 ) ( not ( = ?auto_100895 ?auto_100892 ) ) ( AVAILABLE ?auto_100892 ) ( SURFACE-AT ?auto_100889 ?auto_100893 ) ( ON ?auto_100889 ?auto_100894 ) ( CLEAR ?auto_100889 ) ( not ( = ?auto_100888 ?auto_100894 ) ) ( not ( = ?auto_100889 ?auto_100894 ) ) ( not ( = ?auto_100884 ?auto_100894 ) ) ( TRUCK-AT ?auto_100891 ?auto_100890 ) ( SURFACE-AT ?auto_100884 ?auto_100890 ) ( CLEAR ?auto_100884 ) ( IS-CRATE ?auto_100888 ) ( AVAILABLE ?auto_100895 ) ( IN ?auto_100888 ?auto_100891 ) ( ON ?auto_100886 ?auto_100885 ) ( ON ?auto_100887 ?auto_100886 ) ( ON ?auto_100884 ?auto_100887 ) ( not ( = ?auto_100885 ?auto_100886 ) ) ( not ( = ?auto_100885 ?auto_100887 ) ) ( not ( = ?auto_100885 ?auto_100884 ) ) ( not ( = ?auto_100885 ?auto_100888 ) ) ( not ( = ?auto_100885 ?auto_100889 ) ) ( not ( = ?auto_100885 ?auto_100894 ) ) ( not ( = ?auto_100886 ?auto_100887 ) ) ( not ( = ?auto_100886 ?auto_100884 ) ) ( not ( = ?auto_100886 ?auto_100888 ) ) ( not ( = ?auto_100886 ?auto_100889 ) ) ( not ( = ?auto_100886 ?auto_100894 ) ) ( not ( = ?auto_100887 ?auto_100884 ) ) ( not ( = ?auto_100887 ?auto_100888 ) ) ( not ( = ?auto_100887 ?auto_100889 ) ) ( not ( = ?auto_100887 ?auto_100894 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100884 ?auto_100888 ?auto_100889 )
      ( MAKE-5CRATE-VERIFY ?auto_100885 ?auto_100886 ?auto_100887 ?auto_100884 ?auto_100888 ?auto_100889 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_100915 - SURFACE
      ?auto_100916 - SURFACE
      ?auto_100917 - SURFACE
      ?auto_100914 - SURFACE
    )
    :vars
    (
      ?auto_100922 - HOIST
      ?auto_100921 - PLACE
      ?auto_100920 - PLACE
      ?auto_100919 - HOIST
      ?auto_100918 - SURFACE
      ?auto_100923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_100922 ?auto_100921 ) ( IS-CRATE ?auto_100914 ) ( not ( = ?auto_100917 ?auto_100914 ) ) ( not ( = ?auto_100916 ?auto_100917 ) ) ( not ( = ?auto_100916 ?auto_100914 ) ) ( not ( = ?auto_100920 ?auto_100921 ) ) ( HOIST-AT ?auto_100919 ?auto_100920 ) ( not ( = ?auto_100922 ?auto_100919 ) ) ( AVAILABLE ?auto_100919 ) ( SURFACE-AT ?auto_100914 ?auto_100920 ) ( ON ?auto_100914 ?auto_100918 ) ( CLEAR ?auto_100914 ) ( not ( = ?auto_100917 ?auto_100918 ) ) ( not ( = ?auto_100914 ?auto_100918 ) ) ( not ( = ?auto_100916 ?auto_100918 ) ) ( SURFACE-AT ?auto_100916 ?auto_100921 ) ( CLEAR ?auto_100916 ) ( IS-CRATE ?auto_100917 ) ( AVAILABLE ?auto_100922 ) ( IN ?auto_100917 ?auto_100923 ) ( TRUCK-AT ?auto_100923 ?auto_100920 ) ( ON ?auto_100916 ?auto_100915 ) ( not ( = ?auto_100915 ?auto_100916 ) ) ( not ( = ?auto_100915 ?auto_100917 ) ) ( not ( = ?auto_100915 ?auto_100914 ) ) ( not ( = ?auto_100915 ?auto_100918 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100916 ?auto_100917 ?auto_100914 )
      ( MAKE-3CRATE-VERIFY ?auto_100915 ?auto_100916 ?auto_100917 ?auto_100914 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_100925 - SURFACE
      ?auto_100926 - SURFACE
      ?auto_100927 - SURFACE
      ?auto_100924 - SURFACE
      ?auto_100928 - SURFACE
    )
    :vars
    (
      ?auto_100933 - HOIST
      ?auto_100932 - PLACE
      ?auto_100931 - PLACE
      ?auto_100930 - HOIST
      ?auto_100929 - SURFACE
      ?auto_100934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_100933 ?auto_100932 ) ( IS-CRATE ?auto_100928 ) ( not ( = ?auto_100924 ?auto_100928 ) ) ( not ( = ?auto_100927 ?auto_100924 ) ) ( not ( = ?auto_100927 ?auto_100928 ) ) ( not ( = ?auto_100931 ?auto_100932 ) ) ( HOIST-AT ?auto_100930 ?auto_100931 ) ( not ( = ?auto_100933 ?auto_100930 ) ) ( AVAILABLE ?auto_100930 ) ( SURFACE-AT ?auto_100928 ?auto_100931 ) ( ON ?auto_100928 ?auto_100929 ) ( CLEAR ?auto_100928 ) ( not ( = ?auto_100924 ?auto_100929 ) ) ( not ( = ?auto_100928 ?auto_100929 ) ) ( not ( = ?auto_100927 ?auto_100929 ) ) ( SURFACE-AT ?auto_100927 ?auto_100932 ) ( CLEAR ?auto_100927 ) ( IS-CRATE ?auto_100924 ) ( AVAILABLE ?auto_100933 ) ( IN ?auto_100924 ?auto_100934 ) ( TRUCK-AT ?auto_100934 ?auto_100931 ) ( ON ?auto_100926 ?auto_100925 ) ( ON ?auto_100927 ?auto_100926 ) ( not ( = ?auto_100925 ?auto_100926 ) ) ( not ( = ?auto_100925 ?auto_100927 ) ) ( not ( = ?auto_100925 ?auto_100924 ) ) ( not ( = ?auto_100925 ?auto_100928 ) ) ( not ( = ?auto_100925 ?auto_100929 ) ) ( not ( = ?auto_100926 ?auto_100927 ) ) ( not ( = ?auto_100926 ?auto_100924 ) ) ( not ( = ?auto_100926 ?auto_100928 ) ) ( not ( = ?auto_100926 ?auto_100929 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100927 ?auto_100924 ?auto_100928 )
      ( MAKE-4CRATE-VERIFY ?auto_100925 ?auto_100926 ?auto_100927 ?auto_100924 ?auto_100928 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100936 - SURFACE
      ?auto_100937 - SURFACE
      ?auto_100938 - SURFACE
      ?auto_100935 - SURFACE
      ?auto_100939 - SURFACE
      ?auto_100940 - SURFACE
    )
    :vars
    (
      ?auto_100945 - HOIST
      ?auto_100944 - PLACE
      ?auto_100943 - PLACE
      ?auto_100942 - HOIST
      ?auto_100941 - SURFACE
      ?auto_100946 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_100945 ?auto_100944 ) ( IS-CRATE ?auto_100940 ) ( not ( = ?auto_100939 ?auto_100940 ) ) ( not ( = ?auto_100935 ?auto_100939 ) ) ( not ( = ?auto_100935 ?auto_100940 ) ) ( not ( = ?auto_100943 ?auto_100944 ) ) ( HOIST-AT ?auto_100942 ?auto_100943 ) ( not ( = ?auto_100945 ?auto_100942 ) ) ( AVAILABLE ?auto_100942 ) ( SURFACE-AT ?auto_100940 ?auto_100943 ) ( ON ?auto_100940 ?auto_100941 ) ( CLEAR ?auto_100940 ) ( not ( = ?auto_100939 ?auto_100941 ) ) ( not ( = ?auto_100940 ?auto_100941 ) ) ( not ( = ?auto_100935 ?auto_100941 ) ) ( SURFACE-AT ?auto_100935 ?auto_100944 ) ( CLEAR ?auto_100935 ) ( IS-CRATE ?auto_100939 ) ( AVAILABLE ?auto_100945 ) ( IN ?auto_100939 ?auto_100946 ) ( TRUCK-AT ?auto_100946 ?auto_100943 ) ( ON ?auto_100937 ?auto_100936 ) ( ON ?auto_100938 ?auto_100937 ) ( ON ?auto_100935 ?auto_100938 ) ( not ( = ?auto_100936 ?auto_100937 ) ) ( not ( = ?auto_100936 ?auto_100938 ) ) ( not ( = ?auto_100936 ?auto_100935 ) ) ( not ( = ?auto_100936 ?auto_100939 ) ) ( not ( = ?auto_100936 ?auto_100940 ) ) ( not ( = ?auto_100936 ?auto_100941 ) ) ( not ( = ?auto_100937 ?auto_100938 ) ) ( not ( = ?auto_100937 ?auto_100935 ) ) ( not ( = ?auto_100937 ?auto_100939 ) ) ( not ( = ?auto_100937 ?auto_100940 ) ) ( not ( = ?auto_100937 ?auto_100941 ) ) ( not ( = ?auto_100938 ?auto_100935 ) ) ( not ( = ?auto_100938 ?auto_100939 ) ) ( not ( = ?auto_100938 ?auto_100940 ) ) ( not ( = ?auto_100938 ?auto_100941 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100935 ?auto_100939 ?auto_100940 )
      ( MAKE-5CRATE-VERIFY ?auto_100936 ?auto_100937 ?auto_100938 ?auto_100935 ?auto_100939 ?auto_100940 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_100966 - SURFACE
      ?auto_100967 - SURFACE
      ?auto_100968 - SURFACE
      ?auto_100965 - SURFACE
    )
    :vars
    (
      ?auto_100970 - HOIST
      ?auto_100974 - PLACE
      ?auto_100969 - PLACE
      ?auto_100973 - HOIST
      ?auto_100972 - SURFACE
      ?auto_100971 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_100970 ?auto_100974 ) ( IS-CRATE ?auto_100965 ) ( not ( = ?auto_100968 ?auto_100965 ) ) ( not ( = ?auto_100967 ?auto_100968 ) ) ( not ( = ?auto_100967 ?auto_100965 ) ) ( not ( = ?auto_100969 ?auto_100974 ) ) ( HOIST-AT ?auto_100973 ?auto_100969 ) ( not ( = ?auto_100970 ?auto_100973 ) ) ( SURFACE-AT ?auto_100965 ?auto_100969 ) ( ON ?auto_100965 ?auto_100972 ) ( CLEAR ?auto_100965 ) ( not ( = ?auto_100968 ?auto_100972 ) ) ( not ( = ?auto_100965 ?auto_100972 ) ) ( not ( = ?auto_100967 ?auto_100972 ) ) ( SURFACE-AT ?auto_100967 ?auto_100974 ) ( CLEAR ?auto_100967 ) ( IS-CRATE ?auto_100968 ) ( AVAILABLE ?auto_100970 ) ( TRUCK-AT ?auto_100971 ?auto_100969 ) ( LIFTING ?auto_100973 ?auto_100968 ) ( ON ?auto_100967 ?auto_100966 ) ( not ( = ?auto_100966 ?auto_100967 ) ) ( not ( = ?auto_100966 ?auto_100968 ) ) ( not ( = ?auto_100966 ?auto_100965 ) ) ( not ( = ?auto_100966 ?auto_100972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100967 ?auto_100968 ?auto_100965 )
      ( MAKE-3CRATE-VERIFY ?auto_100966 ?auto_100967 ?auto_100968 ?auto_100965 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_100976 - SURFACE
      ?auto_100977 - SURFACE
      ?auto_100978 - SURFACE
      ?auto_100975 - SURFACE
      ?auto_100979 - SURFACE
    )
    :vars
    (
      ?auto_100981 - HOIST
      ?auto_100985 - PLACE
      ?auto_100980 - PLACE
      ?auto_100984 - HOIST
      ?auto_100983 - SURFACE
      ?auto_100982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_100981 ?auto_100985 ) ( IS-CRATE ?auto_100979 ) ( not ( = ?auto_100975 ?auto_100979 ) ) ( not ( = ?auto_100978 ?auto_100975 ) ) ( not ( = ?auto_100978 ?auto_100979 ) ) ( not ( = ?auto_100980 ?auto_100985 ) ) ( HOIST-AT ?auto_100984 ?auto_100980 ) ( not ( = ?auto_100981 ?auto_100984 ) ) ( SURFACE-AT ?auto_100979 ?auto_100980 ) ( ON ?auto_100979 ?auto_100983 ) ( CLEAR ?auto_100979 ) ( not ( = ?auto_100975 ?auto_100983 ) ) ( not ( = ?auto_100979 ?auto_100983 ) ) ( not ( = ?auto_100978 ?auto_100983 ) ) ( SURFACE-AT ?auto_100978 ?auto_100985 ) ( CLEAR ?auto_100978 ) ( IS-CRATE ?auto_100975 ) ( AVAILABLE ?auto_100981 ) ( TRUCK-AT ?auto_100982 ?auto_100980 ) ( LIFTING ?auto_100984 ?auto_100975 ) ( ON ?auto_100977 ?auto_100976 ) ( ON ?auto_100978 ?auto_100977 ) ( not ( = ?auto_100976 ?auto_100977 ) ) ( not ( = ?auto_100976 ?auto_100978 ) ) ( not ( = ?auto_100976 ?auto_100975 ) ) ( not ( = ?auto_100976 ?auto_100979 ) ) ( not ( = ?auto_100976 ?auto_100983 ) ) ( not ( = ?auto_100977 ?auto_100978 ) ) ( not ( = ?auto_100977 ?auto_100975 ) ) ( not ( = ?auto_100977 ?auto_100979 ) ) ( not ( = ?auto_100977 ?auto_100983 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100978 ?auto_100975 ?auto_100979 )
      ( MAKE-4CRATE-VERIFY ?auto_100976 ?auto_100977 ?auto_100978 ?auto_100975 ?auto_100979 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100987 - SURFACE
      ?auto_100988 - SURFACE
      ?auto_100989 - SURFACE
      ?auto_100986 - SURFACE
      ?auto_100990 - SURFACE
      ?auto_100991 - SURFACE
    )
    :vars
    (
      ?auto_100993 - HOIST
      ?auto_100997 - PLACE
      ?auto_100992 - PLACE
      ?auto_100996 - HOIST
      ?auto_100995 - SURFACE
      ?auto_100994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_100993 ?auto_100997 ) ( IS-CRATE ?auto_100991 ) ( not ( = ?auto_100990 ?auto_100991 ) ) ( not ( = ?auto_100986 ?auto_100990 ) ) ( not ( = ?auto_100986 ?auto_100991 ) ) ( not ( = ?auto_100992 ?auto_100997 ) ) ( HOIST-AT ?auto_100996 ?auto_100992 ) ( not ( = ?auto_100993 ?auto_100996 ) ) ( SURFACE-AT ?auto_100991 ?auto_100992 ) ( ON ?auto_100991 ?auto_100995 ) ( CLEAR ?auto_100991 ) ( not ( = ?auto_100990 ?auto_100995 ) ) ( not ( = ?auto_100991 ?auto_100995 ) ) ( not ( = ?auto_100986 ?auto_100995 ) ) ( SURFACE-AT ?auto_100986 ?auto_100997 ) ( CLEAR ?auto_100986 ) ( IS-CRATE ?auto_100990 ) ( AVAILABLE ?auto_100993 ) ( TRUCK-AT ?auto_100994 ?auto_100992 ) ( LIFTING ?auto_100996 ?auto_100990 ) ( ON ?auto_100988 ?auto_100987 ) ( ON ?auto_100989 ?auto_100988 ) ( ON ?auto_100986 ?auto_100989 ) ( not ( = ?auto_100987 ?auto_100988 ) ) ( not ( = ?auto_100987 ?auto_100989 ) ) ( not ( = ?auto_100987 ?auto_100986 ) ) ( not ( = ?auto_100987 ?auto_100990 ) ) ( not ( = ?auto_100987 ?auto_100991 ) ) ( not ( = ?auto_100987 ?auto_100995 ) ) ( not ( = ?auto_100988 ?auto_100989 ) ) ( not ( = ?auto_100988 ?auto_100986 ) ) ( not ( = ?auto_100988 ?auto_100990 ) ) ( not ( = ?auto_100988 ?auto_100991 ) ) ( not ( = ?auto_100988 ?auto_100995 ) ) ( not ( = ?auto_100989 ?auto_100986 ) ) ( not ( = ?auto_100989 ?auto_100990 ) ) ( not ( = ?auto_100989 ?auto_100991 ) ) ( not ( = ?auto_100989 ?auto_100995 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100986 ?auto_100990 ?auto_100991 )
      ( MAKE-5CRATE-VERIFY ?auto_100987 ?auto_100988 ?auto_100989 ?auto_100986 ?auto_100990 ?auto_100991 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_101019 - SURFACE
      ?auto_101020 - SURFACE
      ?auto_101021 - SURFACE
      ?auto_101018 - SURFACE
    )
    :vars
    (
      ?auto_101022 - HOIST
      ?auto_101028 - PLACE
      ?auto_101025 - PLACE
      ?auto_101023 - HOIST
      ?auto_101026 - SURFACE
      ?auto_101024 - TRUCK
      ?auto_101027 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_101022 ?auto_101028 ) ( IS-CRATE ?auto_101018 ) ( not ( = ?auto_101021 ?auto_101018 ) ) ( not ( = ?auto_101020 ?auto_101021 ) ) ( not ( = ?auto_101020 ?auto_101018 ) ) ( not ( = ?auto_101025 ?auto_101028 ) ) ( HOIST-AT ?auto_101023 ?auto_101025 ) ( not ( = ?auto_101022 ?auto_101023 ) ) ( SURFACE-AT ?auto_101018 ?auto_101025 ) ( ON ?auto_101018 ?auto_101026 ) ( CLEAR ?auto_101018 ) ( not ( = ?auto_101021 ?auto_101026 ) ) ( not ( = ?auto_101018 ?auto_101026 ) ) ( not ( = ?auto_101020 ?auto_101026 ) ) ( SURFACE-AT ?auto_101020 ?auto_101028 ) ( CLEAR ?auto_101020 ) ( IS-CRATE ?auto_101021 ) ( AVAILABLE ?auto_101022 ) ( TRUCK-AT ?auto_101024 ?auto_101025 ) ( AVAILABLE ?auto_101023 ) ( SURFACE-AT ?auto_101021 ?auto_101025 ) ( ON ?auto_101021 ?auto_101027 ) ( CLEAR ?auto_101021 ) ( not ( = ?auto_101021 ?auto_101027 ) ) ( not ( = ?auto_101018 ?auto_101027 ) ) ( not ( = ?auto_101020 ?auto_101027 ) ) ( not ( = ?auto_101026 ?auto_101027 ) ) ( ON ?auto_101020 ?auto_101019 ) ( not ( = ?auto_101019 ?auto_101020 ) ) ( not ( = ?auto_101019 ?auto_101021 ) ) ( not ( = ?auto_101019 ?auto_101018 ) ) ( not ( = ?auto_101019 ?auto_101026 ) ) ( not ( = ?auto_101019 ?auto_101027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_101020 ?auto_101021 ?auto_101018 )
      ( MAKE-3CRATE-VERIFY ?auto_101019 ?auto_101020 ?auto_101021 ?auto_101018 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_101030 - SURFACE
      ?auto_101031 - SURFACE
      ?auto_101032 - SURFACE
      ?auto_101029 - SURFACE
      ?auto_101033 - SURFACE
    )
    :vars
    (
      ?auto_101034 - HOIST
      ?auto_101040 - PLACE
      ?auto_101037 - PLACE
      ?auto_101035 - HOIST
      ?auto_101038 - SURFACE
      ?auto_101036 - TRUCK
      ?auto_101039 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_101034 ?auto_101040 ) ( IS-CRATE ?auto_101033 ) ( not ( = ?auto_101029 ?auto_101033 ) ) ( not ( = ?auto_101032 ?auto_101029 ) ) ( not ( = ?auto_101032 ?auto_101033 ) ) ( not ( = ?auto_101037 ?auto_101040 ) ) ( HOIST-AT ?auto_101035 ?auto_101037 ) ( not ( = ?auto_101034 ?auto_101035 ) ) ( SURFACE-AT ?auto_101033 ?auto_101037 ) ( ON ?auto_101033 ?auto_101038 ) ( CLEAR ?auto_101033 ) ( not ( = ?auto_101029 ?auto_101038 ) ) ( not ( = ?auto_101033 ?auto_101038 ) ) ( not ( = ?auto_101032 ?auto_101038 ) ) ( SURFACE-AT ?auto_101032 ?auto_101040 ) ( CLEAR ?auto_101032 ) ( IS-CRATE ?auto_101029 ) ( AVAILABLE ?auto_101034 ) ( TRUCK-AT ?auto_101036 ?auto_101037 ) ( AVAILABLE ?auto_101035 ) ( SURFACE-AT ?auto_101029 ?auto_101037 ) ( ON ?auto_101029 ?auto_101039 ) ( CLEAR ?auto_101029 ) ( not ( = ?auto_101029 ?auto_101039 ) ) ( not ( = ?auto_101033 ?auto_101039 ) ) ( not ( = ?auto_101032 ?auto_101039 ) ) ( not ( = ?auto_101038 ?auto_101039 ) ) ( ON ?auto_101031 ?auto_101030 ) ( ON ?auto_101032 ?auto_101031 ) ( not ( = ?auto_101030 ?auto_101031 ) ) ( not ( = ?auto_101030 ?auto_101032 ) ) ( not ( = ?auto_101030 ?auto_101029 ) ) ( not ( = ?auto_101030 ?auto_101033 ) ) ( not ( = ?auto_101030 ?auto_101038 ) ) ( not ( = ?auto_101030 ?auto_101039 ) ) ( not ( = ?auto_101031 ?auto_101032 ) ) ( not ( = ?auto_101031 ?auto_101029 ) ) ( not ( = ?auto_101031 ?auto_101033 ) ) ( not ( = ?auto_101031 ?auto_101038 ) ) ( not ( = ?auto_101031 ?auto_101039 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_101032 ?auto_101029 ?auto_101033 )
      ( MAKE-4CRATE-VERIFY ?auto_101030 ?auto_101031 ?auto_101032 ?auto_101029 ?auto_101033 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_101042 - SURFACE
      ?auto_101043 - SURFACE
      ?auto_101044 - SURFACE
      ?auto_101041 - SURFACE
      ?auto_101045 - SURFACE
      ?auto_101046 - SURFACE
    )
    :vars
    (
      ?auto_101047 - HOIST
      ?auto_101053 - PLACE
      ?auto_101050 - PLACE
      ?auto_101048 - HOIST
      ?auto_101051 - SURFACE
      ?auto_101049 - TRUCK
      ?auto_101052 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_101047 ?auto_101053 ) ( IS-CRATE ?auto_101046 ) ( not ( = ?auto_101045 ?auto_101046 ) ) ( not ( = ?auto_101041 ?auto_101045 ) ) ( not ( = ?auto_101041 ?auto_101046 ) ) ( not ( = ?auto_101050 ?auto_101053 ) ) ( HOIST-AT ?auto_101048 ?auto_101050 ) ( not ( = ?auto_101047 ?auto_101048 ) ) ( SURFACE-AT ?auto_101046 ?auto_101050 ) ( ON ?auto_101046 ?auto_101051 ) ( CLEAR ?auto_101046 ) ( not ( = ?auto_101045 ?auto_101051 ) ) ( not ( = ?auto_101046 ?auto_101051 ) ) ( not ( = ?auto_101041 ?auto_101051 ) ) ( SURFACE-AT ?auto_101041 ?auto_101053 ) ( CLEAR ?auto_101041 ) ( IS-CRATE ?auto_101045 ) ( AVAILABLE ?auto_101047 ) ( TRUCK-AT ?auto_101049 ?auto_101050 ) ( AVAILABLE ?auto_101048 ) ( SURFACE-AT ?auto_101045 ?auto_101050 ) ( ON ?auto_101045 ?auto_101052 ) ( CLEAR ?auto_101045 ) ( not ( = ?auto_101045 ?auto_101052 ) ) ( not ( = ?auto_101046 ?auto_101052 ) ) ( not ( = ?auto_101041 ?auto_101052 ) ) ( not ( = ?auto_101051 ?auto_101052 ) ) ( ON ?auto_101043 ?auto_101042 ) ( ON ?auto_101044 ?auto_101043 ) ( ON ?auto_101041 ?auto_101044 ) ( not ( = ?auto_101042 ?auto_101043 ) ) ( not ( = ?auto_101042 ?auto_101044 ) ) ( not ( = ?auto_101042 ?auto_101041 ) ) ( not ( = ?auto_101042 ?auto_101045 ) ) ( not ( = ?auto_101042 ?auto_101046 ) ) ( not ( = ?auto_101042 ?auto_101051 ) ) ( not ( = ?auto_101042 ?auto_101052 ) ) ( not ( = ?auto_101043 ?auto_101044 ) ) ( not ( = ?auto_101043 ?auto_101041 ) ) ( not ( = ?auto_101043 ?auto_101045 ) ) ( not ( = ?auto_101043 ?auto_101046 ) ) ( not ( = ?auto_101043 ?auto_101051 ) ) ( not ( = ?auto_101043 ?auto_101052 ) ) ( not ( = ?auto_101044 ?auto_101041 ) ) ( not ( = ?auto_101044 ?auto_101045 ) ) ( not ( = ?auto_101044 ?auto_101046 ) ) ( not ( = ?auto_101044 ?auto_101051 ) ) ( not ( = ?auto_101044 ?auto_101052 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_101041 ?auto_101045 ?auto_101046 )
      ( MAKE-5CRATE-VERIFY ?auto_101042 ?auto_101043 ?auto_101044 ?auto_101041 ?auto_101045 ?auto_101046 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_101075 - SURFACE
      ?auto_101076 - SURFACE
      ?auto_101077 - SURFACE
      ?auto_101074 - SURFACE
    )
    :vars
    (
      ?auto_101083 - HOIST
      ?auto_101078 - PLACE
      ?auto_101081 - PLACE
      ?auto_101082 - HOIST
      ?auto_101079 - SURFACE
      ?auto_101084 - SURFACE
      ?auto_101080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_101083 ?auto_101078 ) ( IS-CRATE ?auto_101074 ) ( not ( = ?auto_101077 ?auto_101074 ) ) ( not ( = ?auto_101076 ?auto_101077 ) ) ( not ( = ?auto_101076 ?auto_101074 ) ) ( not ( = ?auto_101081 ?auto_101078 ) ) ( HOIST-AT ?auto_101082 ?auto_101081 ) ( not ( = ?auto_101083 ?auto_101082 ) ) ( SURFACE-AT ?auto_101074 ?auto_101081 ) ( ON ?auto_101074 ?auto_101079 ) ( CLEAR ?auto_101074 ) ( not ( = ?auto_101077 ?auto_101079 ) ) ( not ( = ?auto_101074 ?auto_101079 ) ) ( not ( = ?auto_101076 ?auto_101079 ) ) ( SURFACE-AT ?auto_101076 ?auto_101078 ) ( CLEAR ?auto_101076 ) ( IS-CRATE ?auto_101077 ) ( AVAILABLE ?auto_101083 ) ( AVAILABLE ?auto_101082 ) ( SURFACE-AT ?auto_101077 ?auto_101081 ) ( ON ?auto_101077 ?auto_101084 ) ( CLEAR ?auto_101077 ) ( not ( = ?auto_101077 ?auto_101084 ) ) ( not ( = ?auto_101074 ?auto_101084 ) ) ( not ( = ?auto_101076 ?auto_101084 ) ) ( not ( = ?auto_101079 ?auto_101084 ) ) ( TRUCK-AT ?auto_101080 ?auto_101078 ) ( ON ?auto_101076 ?auto_101075 ) ( not ( = ?auto_101075 ?auto_101076 ) ) ( not ( = ?auto_101075 ?auto_101077 ) ) ( not ( = ?auto_101075 ?auto_101074 ) ) ( not ( = ?auto_101075 ?auto_101079 ) ) ( not ( = ?auto_101075 ?auto_101084 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_101076 ?auto_101077 ?auto_101074 )
      ( MAKE-3CRATE-VERIFY ?auto_101075 ?auto_101076 ?auto_101077 ?auto_101074 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_101086 - SURFACE
      ?auto_101087 - SURFACE
      ?auto_101088 - SURFACE
      ?auto_101085 - SURFACE
      ?auto_101089 - SURFACE
    )
    :vars
    (
      ?auto_101095 - HOIST
      ?auto_101090 - PLACE
      ?auto_101093 - PLACE
      ?auto_101094 - HOIST
      ?auto_101091 - SURFACE
      ?auto_101096 - SURFACE
      ?auto_101092 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_101095 ?auto_101090 ) ( IS-CRATE ?auto_101089 ) ( not ( = ?auto_101085 ?auto_101089 ) ) ( not ( = ?auto_101088 ?auto_101085 ) ) ( not ( = ?auto_101088 ?auto_101089 ) ) ( not ( = ?auto_101093 ?auto_101090 ) ) ( HOIST-AT ?auto_101094 ?auto_101093 ) ( not ( = ?auto_101095 ?auto_101094 ) ) ( SURFACE-AT ?auto_101089 ?auto_101093 ) ( ON ?auto_101089 ?auto_101091 ) ( CLEAR ?auto_101089 ) ( not ( = ?auto_101085 ?auto_101091 ) ) ( not ( = ?auto_101089 ?auto_101091 ) ) ( not ( = ?auto_101088 ?auto_101091 ) ) ( SURFACE-AT ?auto_101088 ?auto_101090 ) ( CLEAR ?auto_101088 ) ( IS-CRATE ?auto_101085 ) ( AVAILABLE ?auto_101095 ) ( AVAILABLE ?auto_101094 ) ( SURFACE-AT ?auto_101085 ?auto_101093 ) ( ON ?auto_101085 ?auto_101096 ) ( CLEAR ?auto_101085 ) ( not ( = ?auto_101085 ?auto_101096 ) ) ( not ( = ?auto_101089 ?auto_101096 ) ) ( not ( = ?auto_101088 ?auto_101096 ) ) ( not ( = ?auto_101091 ?auto_101096 ) ) ( TRUCK-AT ?auto_101092 ?auto_101090 ) ( ON ?auto_101087 ?auto_101086 ) ( ON ?auto_101088 ?auto_101087 ) ( not ( = ?auto_101086 ?auto_101087 ) ) ( not ( = ?auto_101086 ?auto_101088 ) ) ( not ( = ?auto_101086 ?auto_101085 ) ) ( not ( = ?auto_101086 ?auto_101089 ) ) ( not ( = ?auto_101086 ?auto_101091 ) ) ( not ( = ?auto_101086 ?auto_101096 ) ) ( not ( = ?auto_101087 ?auto_101088 ) ) ( not ( = ?auto_101087 ?auto_101085 ) ) ( not ( = ?auto_101087 ?auto_101089 ) ) ( not ( = ?auto_101087 ?auto_101091 ) ) ( not ( = ?auto_101087 ?auto_101096 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_101088 ?auto_101085 ?auto_101089 )
      ( MAKE-4CRATE-VERIFY ?auto_101086 ?auto_101087 ?auto_101088 ?auto_101085 ?auto_101089 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_101098 - SURFACE
      ?auto_101099 - SURFACE
      ?auto_101100 - SURFACE
      ?auto_101097 - SURFACE
      ?auto_101101 - SURFACE
      ?auto_101102 - SURFACE
    )
    :vars
    (
      ?auto_101108 - HOIST
      ?auto_101103 - PLACE
      ?auto_101106 - PLACE
      ?auto_101107 - HOIST
      ?auto_101104 - SURFACE
      ?auto_101109 - SURFACE
      ?auto_101105 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_101108 ?auto_101103 ) ( IS-CRATE ?auto_101102 ) ( not ( = ?auto_101101 ?auto_101102 ) ) ( not ( = ?auto_101097 ?auto_101101 ) ) ( not ( = ?auto_101097 ?auto_101102 ) ) ( not ( = ?auto_101106 ?auto_101103 ) ) ( HOIST-AT ?auto_101107 ?auto_101106 ) ( not ( = ?auto_101108 ?auto_101107 ) ) ( SURFACE-AT ?auto_101102 ?auto_101106 ) ( ON ?auto_101102 ?auto_101104 ) ( CLEAR ?auto_101102 ) ( not ( = ?auto_101101 ?auto_101104 ) ) ( not ( = ?auto_101102 ?auto_101104 ) ) ( not ( = ?auto_101097 ?auto_101104 ) ) ( SURFACE-AT ?auto_101097 ?auto_101103 ) ( CLEAR ?auto_101097 ) ( IS-CRATE ?auto_101101 ) ( AVAILABLE ?auto_101108 ) ( AVAILABLE ?auto_101107 ) ( SURFACE-AT ?auto_101101 ?auto_101106 ) ( ON ?auto_101101 ?auto_101109 ) ( CLEAR ?auto_101101 ) ( not ( = ?auto_101101 ?auto_101109 ) ) ( not ( = ?auto_101102 ?auto_101109 ) ) ( not ( = ?auto_101097 ?auto_101109 ) ) ( not ( = ?auto_101104 ?auto_101109 ) ) ( TRUCK-AT ?auto_101105 ?auto_101103 ) ( ON ?auto_101099 ?auto_101098 ) ( ON ?auto_101100 ?auto_101099 ) ( ON ?auto_101097 ?auto_101100 ) ( not ( = ?auto_101098 ?auto_101099 ) ) ( not ( = ?auto_101098 ?auto_101100 ) ) ( not ( = ?auto_101098 ?auto_101097 ) ) ( not ( = ?auto_101098 ?auto_101101 ) ) ( not ( = ?auto_101098 ?auto_101102 ) ) ( not ( = ?auto_101098 ?auto_101104 ) ) ( not ( = ?auto_101098 ?auto_101109 ) ) ( not ( = ?auto_101099 ?auto_101100 ) ) ( not ( = ?auto_101099 ?auto_101097 ) ) ( not ( = ?auto_101099 ?auto_101101 ) ) ( not ( = ?auto_101099 ?auto_101102 ) ) ( not ( = ?auto_101099 ?auto_101104 ) ) ( not ( = ?auto_101099 ?auto_101109 ) ) ( not ( = ?auto_101100 ?auto_101097 ) ) ( not ( = ?auto_101100 ?auto_101101 ) ) ( not ( = ?auto_101100 ?auto_101102 ) ) ( not ( = ?auto_101100 ?auto_101104 ) ) ( not ( = ?auto_101100 ?auto_101109 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_101097 ?auto_101101 ?auto_101102 )
      ( MAKE-5CRATE-VERIFY ?auto_101098 ?auto_101099 ?auto_101100 ?auto_101097 ?auto_101101 ?auto_101102 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_101110 - SURFACE
      ?auto_101111 - SURFACE
    )
    :vars
    (
      ?auto_101118 - HOIST
      ?auto_101112 - PLACE
      ?auto_101116 - SURFACE
      ?auto_101115 - PLACE
      ?auto_101117 - HOIST
      ?auto_101113 - SURFACE
      ?auto_101119 - SURFACE
      ?auto_101114 - TRUCK
      ?auto_101120 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_101118 ?auto_101112 ) ( IS-CRATE ?auto_101111 ) ( not ( = ?auto_101110 ?auto_101111 ) ) ( not ( = ?auto_101116 ?auto_101110 ) ) ( not ( = ?auto_101116 ?auto_101111 ) ) ( not ( = ?auto_101115 ?auto_101112 ) ) ( HOIST-AT ?auto_101117 ?auto_101115 ) ( not ( = ?auto_101118 ?auto_101117 ) ) ( SURFACE-AT ?auto_101111 ?auto_101115 ) ( ON ?auto_101111 ?auto_101113 ) ( CLEAR ?auto_101111 ) ( not ( = ?auto_101110 ?auto_101113 ) ) ( not ( = ?auto_101111 ?auto_101113 ) ) ( not ( = ?auto_101116 ?auto_101113 ) ) ( IS-CRATE ?auto_101110 ) ( AVAILABLE ?auto_101117 ) ( SURFACE-AT ?auto_101110 ?auto_101115 ) ( ON ?auto_101110 ?auto_101119 ) ( CLEAR ?auto_101110 ) ( not ( = ?auto_101110 ?auto_101119 ) ) ( not ( = ?auto_101111 ?auto_101119 ) ) ( not ( = ?auto_101116 ?auto_101119 ) ) ( not ( = ?auto_101113 ?auto_101119 ) ) ( TRUCK-AT ?auto_101114 ?auto_101112 ) ( SURFACE-AT ?auto_101120 ?auto_101112 ) ( CLEAR ?auto_101120 ) ( LIFTING ?auto_101118 ?auto_101116 ) ( IS-CRATE ?auto_101116 ) ( not ( = ?auto_101120 ?auto_101116 ) ) ( not ( = ?auto_101110 ?auto_101120 ) ) ( not ( = ?auto_101111 ?auto_101120 ) ) ( not ( = ?auto_101113 ?auto_101120 ) ) ( not ( = ?auto_101119 ?auto_101120 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_101120 ?auto_101116 )
      ( MAKE-2CRATE ?auto_101116 ?auto_101110 ?auto_101111 )
      ( MAKE-1CRATE-VERIFY ?auto_101110 ?auto_101111 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_101121 - SURFACE
      ?auto_101122 - SURFACE
      ?auto_101123 - SURFACE
    )
    :vars
    (
      ?auto_101131 - HOIST
      ?auto_101128 - PLACE
      ?auto_101130 - PLACE
      ?auto_101129 - HOIST
      ?auto_101127 - SURFACE
      ?auto_101124 - SURFACE
      ?auto_101125 - TRUCK
      ?auto_101126 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_101131 ?auto_101128 ) ( IS-CRATE ?auto_101123 ) ( not ( = ?auto_101122 ?auto_101123 ) ) ( not ( = ?auto_101121 ?auto_101122 ) ) ( not ( = ?auto_101121 ?auto_101123 ) ) ( not ( = ?auto_101130 ?auto_101128 ) ) ( HOIST-AT ?auto_101129 ?auto_101130 ) ( not ( = ?auto_101131 ?auto_101129 ) ) ( SURFACE-AT ?auto_101123 ?auto_101130 ) ( ON ?auto_101123 ?auto_101127 ) ( CLEAR ?auto_101123 ) ( not ( = ?auto_101122 ?auto_101127 ) ) ( not ( = ?auto_101123 ?auto_101127 ) ) ( not ( = ?auto_101121 ?auto_101127 ) ) ( IS-CRATE ?auto_101122 ) ( AVAILABLE ?auto_101129 ) ( SURFACE-AT ?auto_101122 ?auto_101130 ) ( ON ?auto_101122 ?auto_101124 ) ( CLEAR ?auto_101122 ) ( not ( = ?auto_101122 ?auto_101124 ) ) ( not ( = ?auto_101123 ?auto_101124 ) ) ( not ( = ?auto_101121 ?auto_101124 ) ) ( not ( = ?auto_101127 ?auto_101124 ) ) ( TRUCK-AT ?auto_101125 ?auto_101128 ) ( SURFACE-AT ?auto_101126 ?auto_101128 ) ( CLEAR ?auto_101126 ) ( LIFTING ?auto_101131 ?auto_101121 ) ( IS-CRATE ?auto_101121 ) ( not ( = ?auto_101126 ?auto_101121 ) ) ( not ( = ?auto_101122 ?auto_101126 ) ) ( not ( = ?auto_101123 ?auto_101126 ) ) ( not ( = ?auto_101127 ?auto_101126 ) ) ( not ( = ?auto_101124 ?auto_101126 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_101122 ?auto_101123 )
      ( MAKE-2CRATE-VERIFY ?auto_101121 ?auto_101122 ?auto_101123 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_101133 - SURFACE
      ?auto_101134 - SURFACE
      ?auto_101135 - SURFACE
      ?auto_101132 - SURFACE
    )
    :vars
    (
      ?auto_101138 - HOIST
      ?auto_101137 - PLACE
      ?auto_101141 - PLACE
      ?auto_101139 - HOIST
      ?auto_101142 - SURFACE
      ?auto_101140 - SURFACE
      ?auto_101136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_101138 ?auto_101137 ) ( IS-CRATE ?auto_101132 ) ( not ( = ?auto_101135 ?auto_101132 ) ) ( not ( = ?auto_101134 ?auto_101135 ) ) ( not ( = ?auto_101134 ?auto_101132 ) ) ( not ( = ?auto_101141 ?auto_101137 ) ) ( HOIST-AT ?auto_101139 ?auto_101141 ) ( not ( = ?auto_101138 ?auto_101139 ) ) ( SURFACE-AT ?auto_101132 ?auto_101141 ) ( ON ?auto_101132 ?auto_101142 ) ( CLEAR ?auto_101132 ) ( not ( = ?auto_101135 ?auto_101142 ) ) ( not ( = ?auto_101132 ?auto_101142 ) ) ( not ( = ?auto_101134 ?auto_101142 ) ) ( IS-CRATE ?auto_101135 ) ( AVAILABLE ?auto_101139 ) ( SURFACE-AT ?auto_101135 ?auto_101141 ) ( ON ?auto_101135 ?auto_101140 ) ( CLEAR ?auto_101135 ) ( not ( = ?auto_101135 ?auto_101140 ) ) ( not ( = ?auto_101132 ?auto_101140 ) ) ( not ( = ?auto_101134 ?auto_101140 ) ) ( not ( = ?auto_101142 ?auto_101140 ) ) ( TRUCK-AT ?auto_101136 ?auto_101137 ) ( SURFACE-AT ?auto_101133 ?auto_101137 ) ( CLEAR ?auto_101133 ) ( LIFTING ?auto_101138 ?auto_101134 ) ( IS-CRATE ?auto_101134 ) ( not ( = ?auto_101133 ?auto_101134 ) ) ( not ( = ?auto_101135 ?auto_101133 ) ) ( not ( = ?auto_101132 ?auto_101133 ) ) ( not ( = ?auto_101142 ?auto_101133 ) ) ( not ( = ?auto_101140 ?auto_101133 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_101134 ?auto_101135 ?auto_101132 )
      ( MAKE-3CRATE-VERIFY ?auto_101133 ?auto_101134 ?auto_101135 ?auto_101132 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_101144 - SURFACE
      ?auto_101145 - SURFACE
      ?auto_101146 - SURFACE
      ?auto_101143 - SURFACE
      ?auto_101147 - SURFACE
    )
    :vars
    (
      ?auto_101150 - HOIST
      ?auto_101149 - PLACE
      ?auto_101153 - PLACE
      ?auto_101151 - HOIST
      ?auto_101154 - SURFACE
      ?auto_101152 - SURFACE
      ?auto_101148 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_101150 ?auto_101149 ) ( IS-CRATE ?auto_101147 ) ( not ( = ?auto_101143 ?auto_101147 ) ) ( not ( = ?auto_101146 ?auto_101143 ) ) ( not ( = ?auto_101146 ?auto_101147 ) ) ( not ( = ?auto_101153 ?auto_101149 ) ) ( HOIST-AT ?auto_101151 ?auto_101153 ) ( not ( = ?auto_101150 ?auto_101151 ) ) ( SURFACE-AT ?auto_101147 ?auto_101153 ) ( ON ?auto_101147 ?auto_101154 ) ( CLEAR ?auto_101147 ) ( not ( = ?auto_101143 ?auto_101154 ) ) ( not ( = ?auto_101147 ?auto_101154 ) ) ( not ( = ?auto_101146 ?auto_101154 ) ) ( IS-CRATE ?auto_101143 ) ( AVAILABLE ?auto_101151 ) ( SURFACE-AT ?auto_101143 ?auto_101153 ) ( ON ?auto_101143 ?auto_101152 ) ( CLEAR ?auto_101143 ) ( not ( = ?auto_101143 ?auto_101152 ) ) ( not ( = ?auto_101147 ?auto_101152 ) ) ( not ( = ?auto_101146 ?auto_101152 ) ) ( not ( = ?auto_101154 ?auto_101152 ) ) ( TRUCK-AT ?auto_101148 ?auto_101149 ) ( SURFACE-AT ?auto_101145 ?auto_101149 ) ( CLEAR ?auto_101145 ) ( LIFTING ?auto_101150 ?auto_101146 ) ( IS-CRATE ?auto_101146 ) ( not ( = ?auto_101145 ?auto_101146 ) ) ( not ( = ?auto_101143 ?auto_101145 ) ) ( not ( = ?auto_101147 ?auto_101145 ) ) ( not ( = ?auto_101154 ?auto_101145 ) ) ( not ( = ?auto_101152 ?auto_101145 ) ) ( ON ?auto_101145 ?auto_101144 ) ( not ( = ?auto_101144 ?auto_101145 ) ) ( not ( = ?auto_101144 ?auto_101146 ) ) ( not ( = ?auto_101144 ?auto_101143 ) ) ( not ( = ?auto_101144 ?auto_101147 ) ) ( not ( = ?auto_101144 ?auto_101154 ) ) ( not ( = ?auto_101144 ?auto_101152 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_101146 ?auto_101143 ?auto_101147 )
      ( MAKE-4CRATE-VERIFY ?auto_101144 ?auto_101145 ?auto_101146 ?auto_101143 ?auto_101147 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_101156 - SURFACE
      ?auto_101157 - SURFACE
      ?auto_101158 - SURFACE
      ?auto_101155 - SURFACE
      ?auto_101159 - SURFACE
      ?auto_101160 - SURFACE
    )
    :vars
    (
      ?auto_101163 - HOIST
      ?auto_101162 - PLACE
      ?auto_101166 - PLACE
      ?auto_101164 - HOIST
      ?auto_101167 - SURFACE
      ?auto_101165 - SURFACE
      ?auto_101161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_101163 ?auto_101162 ) ( IS-CRATE ?auto_101160 ) ( not ( = ?auto_101159 ?auto_101160 ) ) ( not ( = ?auto_101155 ?auto_101159 ) ) ( not ( = ?auto_101155 ?auto_101160 ) ) ( not ( = ?auto_101166 ?auto_101162 ) ) ( HOIST-AT ?auto_101164 ?auto_101166 ) ( not ( = ?auto_101163 ?auto_101164 ) ) ( SURFACE-AT ?auto_101160 ?auto_101166 ) ( ON ?auto_101160 ?auto_101167 ) ( CLEAR ?auto_101160 ) ( not ( = ?auto_101159 ?auto_101167 ) ) ( not ( = ?auto_101160 ?auto_101167 ) ) ( not ( = ?auto_101155 ?auto_101167 ) ) ( IS-CRATE ?auto_101159 ) ( AVAILABLE ?auto_101164 ) ( SURFACE-AT ?auto_101159 ?auto_101166 ) ( ON ?auto_101159 ?auto_101165 ) ( CLEAR ?auto_101159 ) ( not ( = ?auto_101159 ?auto_101165 ) ) ( not ( = ?auto_101160 ?auto_101165 ) ) ( not ( = ?auto_101155 ?auto_101165 ) ) ( not ( = ?auto_101167 ?auto_101165 ) ) ( TRUCK-AT ?auto_101161 ?auto_101162 ) ( SURFACE-AT ?auto_101158 ?auto_101162 ) ( CLEAR ?auto_101158 ) ( LIFTING ?auto_101163 ?auto_101155 ) ( IS-CRATE ?auto_101155 ) ( not ( = ?auto_101158 ?auto_101155 ) ) ( not ( = ?auto_101159 ?auto_101158 ) ) ( not ( = ?auto_101160 ?auto_101158 ) ) ( not ( = ?auto_101167 ?auto_101158 ) ) ( not ( = ?auto_101165 ?auto_101158 ) ) ( ON ?auto_101157 ?auto_101156 ) ( ON ?auto_101158 ?auto_101157 ) ( not ( = ?auto_101156 ?auto_101157 ) ) ( not ( = ?auto_101156 ?auto_101158 ) ) ( not ( = ?auto_101156 ?auto_101155 ) ) ( not ( = ?auto_101156 ?auto_101159 ) ) ( not ( = ?auto_101156 ?auto_101160 ) ) ( not ( = ?auto_101156 ?auto_101167 ) ) ( not ( = ?auto_101156 ?auto_101165 ) ) ( not ( = ?auto_101157 ?auto_101158 ) ) ( not ( = ?auto_101157 ?auto_101155 ) ) ( not ( = ?auto_101157 ?auto_101159 ) ) ( not ( = ?auto_101157 ?auto_101160 ) ) ( not ( = ?auto_101157 ?auto_101167 ) ) ( not ( = ?auto_101157 ?auto_101165 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_101155 ?auto_101159 ?auto_101160 )
      ( MAKE-5CRATE-VERIFY ?auto_101156 ?auto_101157 ?auto_101158 ?auto_101155 ?auto_101159 ?auto_101160 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_102080 - SURFACE
      ?auto_102081 - SURFACE
      ?auto_102082 - SURFACE
      ?auto_102079 - SURFACE
      ?auto_102083 - SURFACE
      ?auto_102085 - SURFACE
      ?auto_102084 - SURFACE
    )
    :vars
    (
      ?auto_102087 - HOIST
      ?auto_102086 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_102087 ?auto_102086 ) ( SURFACE-AT ?auto_102085 ?auto_102086 ) ( CLEAR ?auto_102085 ) ( LIFTING ?auto_102087 ?auto_102084 ) ( IS-CRATE ?auto_102084 ) ( not ( = ?auto_102085 ?auto_102084 ) ) ( ON ?auto_102081 ?auto_102080 ) ( ON ?auto_102082 ?auto_102081 ) ( ON ?auto_102079 ?auto_102082 ) ( ON ?auto_102083 ?auto_102079 ) ( ON ?auto_102085 ?auto_102083 ) ( not ( = ?auto_102080 ?auto_102081 ) ) ( not ( = ?auto_102080 ?auto_102082 ) ) ( not ( = ?auto_102080 ?auto_102079 ) ) ( not ( = ?auto_102080 ?auto_102083 ) ) ( not ( = ?auto_102080 ?auto_102085 ) ) ( not ( = ?auto_102080 ?auto_102084 ) ) ( not ( = ?auto_102081 ?auto_102082 ) ) ( not ( = ?auto_102081 ?auto_102079 ) ) ( not ( = ?auto_102081 ?auto_102083 ) ) ( not ( = ?auto_102081 ?auto_102085 ) ) ( not ( = ?auto_102081 ?auto_102084 ) ) ( not ( = ?auto_102082 ?auto_102079 ) ) ( not ( = ?auto_102082 ?auto_102083 ) ) ( not ( = ?auto_102082 ?auto_102085 ) ) ( not ( = ?auto_102082 ?auto_102084 ) ) ( not ( = ?auto_102079 ?auto_102083 ) ) ( not ( = ?auto_102079 ?auto_102085 ) ) ( not ( = ?auto_102079 ?auto_102084 ) ) ( not ( = ?auto_102083 ?auto_102085 ) ) ( not ( = ?auto_102083 ?auto_102084 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_102085 ?auto_102084 )
      ( MAKE-6CRATE-VERIFY ?auto_102080 ?auto_102081 ?auto_102082 ?auto_102079 ?auto_102083 ?auto_102085 ?auto_102084 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_102124 - SURFACE
      ?auto_102125 - SURFACE
      ?auto_102126 - SURFACE
      ?auto_102123 - SURFACE
      ?auto_102127 - SURFACE
      ?auto_102129 - SURFACE
      ?auto_102128 - SURFACE
    )
    :vars
    (
      ?auto_102131 - HOIST
      ?auto_102132 - PLACE
      ?auto_102130 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_102131 ?auto_102132 ) ( SURFACE-AT ?auto_102129 ?auto_102132 ) ( CLEAR ?auto_102129 ) ( IS-CRATE ?auto_102128 ) ( not ( = ?auto_102129 ?auto_102128 ) ) ( TRUCK-AT ?auto_102130 ?auto_102132 ) ( AVAILABLE ?auto_102131 ) ( IN ?auto_102128 ?auto_102130 ) ( ON ?auto_102129 ?auto_102127 ) ( not ( = ?auto_102127 ?auto_102129 ) ) ( not ( = ?auto_102127 ?auto_102128 ) ) ( ON ?auto_102125 ?auto_102124 ) ( ON ?auto_102126 ?auto_102125 ) ( ON ?auto_102123 ?auto_102126 ) ( ON ?auto_102127 ?auto_102123 ) ( not ( = ?auto_102124 ?auto_102125 ) ) ( not ( = ?auto_102124 ?auto_102126 ) ) ( not ( = ?auto_102124 ?auto_102123 ) ) ( not ( = ?auto_102124 ?auto_102127 ) ) ( not ( = ?auto_102124 ?auto_102129 ) ) ( not ( = ?auto_102124 ?auto_102128 ) ) ( not ( = ?auto_102125 ?auto_102126 ) ) ( not ( = ?auto_102125 ?auto_102123 ) ) ( not ( = ?auto_102125 ?auto_102127 ) ) ( not ( = ?auto_102125 ?auto_102129 ) ) ( not ( = ?auto_102125 ?auto_102128 ) ) ( not ( = ?auto_102126 ?auto_102123 ) ) ( not ( = ?auto_102126 ?auto_102127 ) ) ( not ( = ?auto_102126 ?auto_102129 ) ) ( not ( = ?auto_102126 ?auto_102128 ) ) ( not ( = ?auto_102123 ?auto_102127 ) ) ( not ( = ?auto_102123 ?auto_102129 ) ) ( not ( = ?auto_102123 ?auto_102128 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_102127 ?auto_102129 ?auto_102128 )
      ( MAKE-6CRATE-VERIFY ?auto_102124 ?auto_102125 ?auto_102126 ?auto_102123 ?auto_102127 ?auto_102129 ?auto_102128 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_102175 - SURFACE
      ?auto_102176 - SURFACE
      ?auto_102177 - SURFACE
      ?auto_102174 - SURFACE
      ?auto_102178 - SURFACE
      ?auto_102180 - SURFACE
      ?auto_102179 - SURFACE
    )
    :vars
    (
      ?auto_102181 - HOIST
      ?auto_102183 - PLACE
      ?auto_102182 - TRUCK
      ?auto_102184 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_102181 ?auto_102183 ) ( SURFACE-AT ?auto_102180 ?auto_102183 ) ( CLEAR ?auto_102180 ) ( IS-CRATE ?auto_102179 ) ( not ( = ?auto_102180 ?auto_102179 ) ) ( AVAILABLE ?auto_102181 ) ( IN ?auto_102179 ?auto_102182 ) ( ON ?auto_102180 ?auto_102178 ) ( not ( = ?auto_102178 ?auto_102180 ) ) ( not ( = ?auto_102178 ?auto_102179 ) ) ( TRUCK-AT ?auto_102182 ?auto_102184 ) ( not ( = ?auto_102184 ?auto_102183 ) ) ( ON ?auto_102176 ?auto_102175 ) ( ON ?auto_102177 ?auto_102176 ) ( ON ?auto_102174 ?auto_102177 ) ( ON ?auto_102178 ?auto_102174 ) ( not ( = ?auto_102175 ?auto_102176 ) ) ( not ( = ?auto_102175 ?auto_102177 ) ) ( not ( = ?auto_102175 ?auto_102174 ) ) ( not ( = ?auto_102175 ?auto_102178 ) ) ( not ( = ?auto_102175 ?auto_102180 ) ) ( not ( = ?auto_102175 ?auto_102179 ) ) ( not ( = ?auto_102176 ?auto_102177 ) ) ( not ( = ?auto_102176 ?auto_102174 ) ) ( not ( = ?auto_102176 ?auto_102178 ) ) ( not ( = ?auto_102176 ?auto_102180 ) ) ( not ( = ?auto_102176 ?auto_102179 ) ) ( not ( = ?auto_102177 ?auto_102174 ) ) ( not ( = ?auto_102177 ?auto_102178 ) ) ( not ( = ?auto_102177 ?auto_102180 ) ) ( not ( = ?auto_102177 ?auto_102179 ) ) ( not ( = ?auto_102174 ?auto_102178 ) ) ( not ( = ?auto_102174 ?auto_102180 ) ) ( not ( = ?auto_102174 ?auto_102179 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_102178 ?auto_102180 ?auto_102179 )
      ( MAKE-6CRATE-VERIFY ?auto_102175 ?auto_102176 ?auto_102177 ?auto_102174 ?auto_102178 ?auto_102180 ?auto_102179 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_102232 - SURFACE
      ?auto_102233 - SURFACE
      ?auto_102234 - SURFACE
      ?auto_102231 - SURFACE
      ?auto_102235 - SURFACE
      ?auto_102237 - SURFACE
      ?auto_102236 - SURFACE
    )
    :vars
    (
      ?auto_102238 - HOIST
      ?auto_102241 - PLACE
      ?auto_102242 - TRUCK
      ?auto_102239 - PLACE
      ?auto_102240 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_102238 ?auto_102241 ) ( SURFACE-AT ?auto_102237 ?auto_102241 ) ( CLEAR ?auto_102237 ) ( IS-CRATE ?auto_102236 ) ( not ( = ?auto_102237 ?auto_102236 ) ) ( AVAILABLE ?auto_102238 ) ( ON ?auto_102237 ?auto_102235 ) ( not ( = ?auto_102235 ?auto_102237 ) ) ( not ( = ?auto_102235 ?auto_102236 ) ) ( TRUCK-AT ?auto_102242 ?auto_102239 ) ( not ( = ?auto_102239 ?auto_102241 ) ) ( HOIST-AT ?auto_102240 ?auto_102239 ) ( LIFTING ?auto_102240 ?auto_102236 ) ( not ( = ?auto_102238 ?auto_102240 ) ) ( ON ?auto_102233 ?auto_102232 ) ( ON ?auto_102234 ?auto_102233 ) ( ON ?auto_102231 ?auto_102234 ) ( ON ?auto_102235 ?auto_102231 ) ( not ( = ?auto_102232 ?auto_102233 ) ) ( not ( = ?auto_102232 ?auto_102234 ) ) ( not ( = ?auto_102232 ?auto_102231 ) ) ( not ( = ?auto_102232 ?auto_102235 ) ) ( not ( = ?auto_102232 ?auto_102237 ) ) ( not ( = ?auto_102232 ?auto_102236 ) ) ( not ( = ?auto_102233 ?auto_102234 ) ) ( not ( = ?auto_102233 ?auto_102231 ) ) ( not ( = ?auto_102233 ?auto_102235 ) ) ( not ( = ?auto_102233 ?auto_102237 ) ) ( not ( = ?auto_102233 ?auto_102236 ) ) ( not ( = ?auto_102234 ?auto_102231 ) ) ( not ( = ?auto_102234 ?auto_102235 ) ) ( not ( = ?auto_102234 ?auto_102237 ) ) ( not ( = ?auto_102234 ?auto_102236 ) ) ( not ( = ?auto_102231 ?auto_102235 ) ) ( not ( = ?auto_102231 ?auto_102237 ) ) ( not ( = ?auto_102231 ?auto_102236 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_102235 ?auto_102237 ?auto_102236 )
      ( MAKE-6CRATE-VERIFY ?auto_102232 ?auto_102233 ?auto_102234 ?auto_102231 ?auto_102235 ?auto_102237 ?auto_102236 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_102295 - SURFACE
      ?auto_102296 - SURFACE
      ?auto_102297 - SURFACE
      ?auto_102294 - SURFACE
      ?auto_102298 - SURFACE
      ?auto_102300 - SURFACE
      ?auto_102299 - SURFACE
    )
    :vars
    (
      ?auto_102304 - HOIST
      ?auto_102303 - PLACE
      ?auto_102301 - TRUCK
      ?auto_102306 - PLACE
      ?auto_102302 - HOIST
      ?auto_102305 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_102304 ?auto_102303 ) ( SURFACE-AT ?auto_102300 ?auto_102303 ) ( CLEAR ?auto_102300 ) ( IS-CRATE ?auto_102299 ) ( not ( = ?auto_102300 ?auto_102299 ) ) ( AVAILABLE ?auto_102304 ) ( ON ?auto_102300 ?auto_102298 ) ( not ( = ?auto_102298 ?auto_102300 ) ) ( not ( = ?auto_102298 ?auto_102299 ) ) ( TRUCK-AT ?auto_102301 ?auto_102306 ) ( not ( = ?auto_102306 ?auto_102303 ) ) ( HOIST-AT ?auto_102302 ?auto_102306 ) ( not ( = ?auto_102304 ?auto_102302 ) ) ( AVAILABLE ?auto_102302 ) ( SURFACE-AT ?auto_102299 ?auto_102306 ) ( ON ?auto_102299 ?auto_102305 ) ( CLEAR ?auto_102299 ) ( not ( = ?auto_102300 ?auto_102305 ) ) ( not ( = ?auto_102299 ?auto_102305 ) ) ( not ( = ?auto_102298 ?auto_102305 ) ) ( ON ?auto_102296 ?auto_102295 ) ( ON ?auto_102297 ?auto_102296 ) ( ON ?auto_102294 ?auto_102297 ) ( ON ?auto_102298 ?auto_102294 ) ( not ( = ?auto_102295 ?auto_102296 ) ) ( not ( = ?auto_102295 ?auto_102297 ) ) ( not ( = ?auto_102295 ?auto_102294 ) ) ( not ( = ?auto_102295 ?auto_102298 ) ) ( not ( = ?auto_102295 ?auto_102300 ) ) ( not ( = ?auto_102295 ?auto_102299 ) ) ( not ( = ?auto_102295 ?auto_102305 ) ) ( not ( = ?auto_102296 ?auto_102297 ) ) ( not ( = ?auto_102296 ?auto_102294 ) ) ( not ( = ?auto_102296 ?auto_102298 ) ) ( not ( = ?auto_102296 ?auto_102300 ) ) ( not ( = ?auto_102296 ?auto_102299 ) ) ( not ( = ?auto_102296 ?auto_102305 ) ) ( not ( = ?auto_102297 ?auto_102294 ) ) ( not ( = ?auto_102297 ?auto_102298 ) ) ( not ( = ?auto_102297 ?auto_102300 ) ) ( not ( = ?auto_102297 ?auto_102299 ) ) ( not ( = ?auto_102297 ?auto_102305 ) ) ( not ( = ?auto_102294 ?auto_102298 ) ) ( not ( = ?auto_102294 ?auto_102300 ) ) ( not ( = ?auto_102294 ?auto_102299 ) ) ( not ( = ?auto_102294 ?auto_102305 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_102298 ?auto_102300 ?auto_102299 )
      ( MAKE-6CRATE-VERIFY ?auto_102295 ?auto_102296 ?auto_102297 ?auto_102294 ?auto_102298 ?auto_102300 ?auto_102299 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_102359 - SURFACE
      ?auto_102360 - SURFACE
      ?auto_102361 - SURFACE
      ?auto_102358 - SURFACE
      ?auto_102362 - SURFACE
      ?auto_102364 - SURFACE
      ?auto_102363 - SURFACE
    )
    :vars
    (
      ?auto_102367 - HOIST
      ?auto_102368 - PLACE
      ?auto_102370 - PLACE
      ?auto_102365 - HOIST
      ?auto_102369 - SURFACE
      ?auto_102366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_102367 ?auto_102368 ) ( SURFACE-AT ?auto_102364 ?auto_102368 ) ( CLEAR ?auto_102364 ) ( IS-CRATE ?auto_102363 ) ( not ( = ?auto_102364 ?auto_102363 ) ) ( AVAILABLE ?auto_102367 ) ( ON ?auto_102364 ?auto_102362 ) ( not ( = ?auto_102362 ?auto_102364 ) ) ( not ( = ?auto_102362 ?auto_102363 ) ) ( not ( = ?auto_102370 ?auto_102368 ) ) ( HOIST-AT ?auto_102365 ?auto_102370 ) ( not ( = ?auto_102367 ?auto_102365 ) ) ( AVAILABLE ?auto_102365 ) ( SURFACE-AT ?auto_102363 ?auto_102370 ) ( ON ?auto_102363 ?auto_102369 ) ( CLEAR ?auto_102363 ) ( not ( = ?auto_102364 ?auto_102369 ) ) ( not ( = ?auto_102363 ?auto_102369 ) ) ( not ( = ?auto_102362 ?auto_102369 ) ) ( TRUCK-AT ?auto_102366 ?auto_102368 ) ( ON ?auto_102360 ?auto_102359 ) ( ON ?auto_102361 ?auto_102360 ) ( ON ?auto_102358 ?auto_102361 ) ( ON ?auto_102362 ?auto_102358 ) ( not ( = ?auto_102359 ?auto_102360 ) ) ( not ( = ?auto_102359 ?auto_102361 ) ) ( not ( = ?auto_102359 ?auto_102358 ) ) ( not ( = ?auto_102359 ?auto_102362 ) ) ( not ( = ?auto_102359 ?auto_102364 ) ) ( not ( = ?auto_102359 ?auto_102363 ) ) ( not ( = ?auto_102359 ?auto_102369 ) ) ( not ( = ?auto_102360 ?auto_102361 ) ) ( not ( = ?auto_102360 ?auto_102358 ) ) ( not ( = ?auto_102360 ?auto_102362 ) ) ( not ( = ?auto_102360 ?auto_102364 ) ) ( not ( = ?auto_102360 ?auto_102363 ) ) ( not ( = ?auto_102360 ?auto_102369 ) ) ( not ( = ?auto_102361 ?auto_102358 ) ) ( not ( = ?auto_102361 ?auto_102362 ) ) ( not ( = ?auto_102361 ?auto_102364 ) ) ( not ( = ?auto_102361 ?auto_102363 ) ) ( not ( = ?auto_102361 ?auto_102369 ) ) ( not ( = ?auto_102358 ?auto_102362 ) ) ( not ( = ?auto_102358 ?auto_102364 ) ) ( not ( = ?auto_102358 ?auto_102363 ) ) ( not ( = ?auto_102358 ?auto_102369 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_102362 ?auto_102364 ?auto_102363 )
      ( MAKE-6CRATE-VERIFY ?auto_102359 ?auto_102360 ?auto_102361 ?auto_102358 ?auto_102362 ?auto_102364 ?auto_102363 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_102423 - SURFACE
      ?auto_102424 - SURFACE
      ?auto_102425 - SURFACE
      ?auto_102422 - SURFACE
      ?auto_102426 - SURFACE
      ?auto_102428 - SURFACE
      ?auto_102427 - SURFACE
    )
    :vars
    (
      ?auto_102432 - HOIST
      ?auto_102434 - PLACE
      ?auto_102429 - PLACE
      ?auto_102430 - HOIST
      ?auto_102431 - SURFACE
      ?auto_102433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_102432 ?auto_102434 ) ( IS-CRATE ?auto_102427 ) ( not ( = ?auto_102428 ?auto_102427 ) ) ( not ( = ?auto_102426 ?auto_102428 ) ) ( not ( = ?auto_102426 ?auto_102427 ) ) ( not ( = ?auto_102429 ?auto_102434 ) ) ( HOIST-AT ?auto_102430 ?auto_102429 ) ( not ( = ?auto_102432 ?auto_102430 ) ) ( AVAILABLE ?auto_102430 ) ( SURFACE-AT ?auto_102427 ?auto_102429 ) ( ON ?auto_102427 ?auto_102431 ) ( CLEAR ?auto_102427 ) ( not ( = ?auto_102428 ?auto_102431 ) ) ( not ( = ?auto_102427 ?auto_102431 ) ) ( not ( = ?auto_102426 ?auto_102431 ) ) ( TRUCK-AT ?auto_102433 ?auto_102434 ) ( SURFACE-AT ?auto_102426 ?auto_102434 ) ( CLEAR ?auto_102426 ) ( LIFTING ?auto_102432 ?auto_102428 ) ( IS-CRATE ?auto_102428 ) ( ON ?auto_102424 ?auto_102423 ) ( ON ?auto_102425 ?auto_102424 ) ( ON ?auto_102422 ?auto_102425 ) ( ON ?auto_102426 ?auto_102422 ) ( not ( = ?auto_102423 ?auto_102424 ) ) ( not ( = ?auto_102423 ?auto_102425 ) ) ( not ( = ?auto_102423 ?auto_102422 ) ) ( not ( = ?auto_102423 ?auto_102426 ) ) ( not ( = ?auto_102423 ?auto_102428 ) ) ( not ( = ?auto_102423 ?auto_102427 ) ) ( not ( = ?auto_102423 ?auto_102431 ) ) ( not ( = ?auto_102424 ?auto_102425 ) ) ( not ( = ?auto_102424 ?auto_102422 ) ) ( not ( = ?auto_102424 ?auto_102426 ) ) ( not ( = ?auto_102424 ?auto_102428 ) ) ( not ( = ?auto_102424 ?auto_102427 ) ) ( not ( = ?auto_102424 ?auto_102431 ) ) ( not ( = ?auto_102425 ?auto_102422 ) ) ( not ( = ?auto_102425 ?auto_102426 ) ) ( not ( = ?auto_102425 ?auto_102428 ) ) ( not ( = ?auto_102425 ?auto_102427 ) ) ( not ( = ?auto_102425 ?auto_102431 ) ) ( not ( = ?auto_102422 ?auto_102426 ) ) ( not ( = ?auto_102422 ?auto_102428 ) ) ( not ( = ?auto_102422 ?auto_102427 ) ) ( not ( = ?auto_102422 ?auto_102431 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_102426 ?auto_102428 ?auto_102427 )
      ( MAKE-6CRATE-VERIFY ?auto_102423 ?auto_102424 ?auto_102425 ?auto_102422 ?auto_102426 ?auto_102428 ?auto_102427 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_102487 - SURFACE
      ?auto_102488 - SURFACE
      ?auto_102489 - SURFACE
      ?auto_102486 - SURFACE
      ?auto_102490 - SURFACE
      ?auto_102492 - SURFACE
      ?auto_102491 - SURFACE
    )
    :vars
    (
      ?auto_102494 - HOIST
      ?auto_102497 - PLACE
      ?auto_102493 - PLACE
      ?auto_102498 - HOIST
      ?auto_102495 - SURFACE
      ?auto_102496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_102494 ?auto_102497 ) ( IS-CRATE ?auto_102491 ) ( not ( = ?auto_102492 ?auto_102491 ) ) ( not ( = ?auto_102490 ?auto_102492 ) ) ( not ( = ?auto_102490 ?auto_102491 ) ) ( not ( = ?auto_102493 ?auto_102497 ) ) ( HOIST-AT ?auto_102498 ?auto_102493 ) ( not ( = ?auto_102494 ?auto_102498 ) ) ( AVAILABLE ?auto_102498 ) ( SURFACE-AT ?auto_102491 ?auto_102493 ) ( ON ?auto_102491 ?auto_102495 ) ( CLEAR ?auto_102491 ) ( not ( = ?auto_102492 ?auto_102495 ) ) ( not ( = ?auto_102491 ?auto_102495 ) ) ( not ( = ?auto_102490 ?auto_102495 ) ) ( TRUCK-AT ?auto_102496 ?auto_102497 ) ( SURFACE-AT ?auto_102490 ?auto_102497 ) ( CLEAR ?auto_102490 ) ( IS-CRATE ?auto_102492 ) ( AVAILABLE ?auto_102494 ) ( IN ?auto_102492 ?auto_102496 ) ( ON ?auto_102488 ?auto_102487 ) ( ON ?auto_102489 ?auto_102488 ) ( ON ?auto_102486 ?auto_102489 ) ( ON ?auto_102490 ?auto_102486 ) ( not ( = ?auto_102487 ?auto_102488 ) ) ( not ( = ?auto_102487 ?auto_102489 ) ) ( not ( = ?auto_102487 ?auto_102486 ) ) ( not ( = ?auto_102487 ?auto_102490 ) ) ( not ( = ?auto_102487 ?auto_102492 ) ) ( not ( = ?auto_102487 ?auto_102491 ) ) ( not ( = ?auto_102487 ?auto_102495 ) ) ( not ( = ?auto_102488 ?auto_102489 ) ) ( not ( = ?auto_102488 ?auto_102486 ) ) ( not ( = ?auto_102488 ?auto_102490 ) ) ( not ( = ?auto_102488 ?auto_102492 ) ) ( not ( = ?auto_102488 ?auto_102491 ) ) ( not ( = ?auto_102488 ?auto_102495 ) ) ( not ( = ?auto_102489 ?auto_102486 ) ) ( not ( = ?auto_102489 ?auto_102490 ) ) ( not ( = ?auto_102489 ?auto_102492 ) ) ( not ( = ?auto_102489 ?auto_102491 ) ) ( not ( = ?auto_102489 ?auto_102495 ) ) ( not ( = ?auto_102486 ?auto_102490 ) ) ( not ( = ?auto_102486 ?auto_102492 ) ) ( not ( = ?auto_102486 ?auto_102491 ) ) ( not ( = ?auto_102486 ?auto_102495 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_102490 ?auto_102492 ?auto_102491 )
      ( MAKE-6CRATE-VERIFY ?auto_102487 ?auto_102488 ?auto_102489 ?auto_102486 ?auto_102490 ?auto_102492 ?auto_102491 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104436 - SURFACE
      ?auto_104437 - SURFACE
      ?auto_104438 - SURFACE
      ?auto_104435 - SURFACE
      ?auto_104439 - SURFACE
      ?auto_104441 - SURFACE
      ?auto_104440 - SURFACE
      ?auto_104442 - SURFACE
    )
    :vars
    (
      ?auto_104444 - HOIST
      ?auto_104443 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_104444 ?auto_104443 ) ( SURFACE-AT ?auto_104440 ?auto_104443 ) ( CLEAR ?auto_104440 ) ( LIFTING ?auto_104444 ?auto_104442 ) ( IS-CRATE ?auto_104442 ) ( not ( = ?auto_104440 ?auto_104442 ) ) ( ON ?auto_104437 ?auto_104436 ) ( ON ?auto_104438 ?auto_104437 ) ( ON ?auto_104435 ?auto_104438 ) ( ON ?auto_104439 ?auto_104435 ) ( ON ?auto_104441 ?auto_104439 ) ( ON ?auto_104440 ?auto_104441 ) ( not ( = ?auto_104436 ?auto_104437 ) ) ( not ( = ?auto_104436 ?auto_104438 ) ) ( not ( = ?auto_104436 ?auto_104435 ) ) ( not ( = ?auto_104436 ?auto_104439 ) ) ( not ( = ?auto_104436 ?auto_104441 ) ) ( not ( = ?auto_104436 ?auto_104440 ) ) ( not ( = ?auto_104436 ?auto_104442 ) ) ( not ( = ?auto_104437 ?auto_104438 ) ) ( not ( = ?auto_104437 ?auto_104435 ) ) ( not ( = ?auto_104437 ?auto_104439 ) ) ( not ( = ?auto_104437 ?auto_104441 ) ) ( not ( = ?auto_104437 ?auto_104440 ) ) ( not ( = ?auto_104437 ?auto_104442 ) ) ( not ( = ?auto_104438 ?auto_104435 ) ) ( not ( = ?auto_104438 ?auto_104439 ) ) ( not ( = ?auto_104438 ?auto_104441 ) ) ( not ( = ?auto_104438 ?auto_104440 ) ) ( not ( = ?auto_104438 ?auto_104442 ) ) ( not ( = ?auto_104435 ?auto_104439 ) ) ( not ( = ?auto_104435 ?auto_104441 ) ) ( not ( = ?auto_104435 ?auto_104440 ) ) ( not ( = ?auto_104435 ?auto_104442 ) ) ( not ( = ?auto_104439 ?auto_104441 ) ) ( not ( = ?auto_104439 ?auto_104440 ) ) ( not ( = ?auto_104439 ?auto_104442 ) ) ( not ( = ?auto_104441 ?auto_104440 ) ) ( not ( = ?auto_104441 ?auto_104442 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_104440 ?auto_104442 )
      ( MAKE-7CRATE-VERIFY ?auto_104436 ?auto_104437 ?auto_104438 ?auto_104435 ?auto_104439 ?auto_104441 ?auto_104440 ?auto_104442 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104491 - SURFACE
      ?auto_104492 - SURFACE
      ?auto_104493 - SURFACE
      ?auto_104490 - SURFACE
      ?auto_104494 - SURFACE
      ?auto_104496 - SURFACE
      ?auto_104495 - SURFACE
      ?auto_104497 - SURFACE
    )
    :vars
    (
      ?auto_104498 - HOIST
      ?auto_104500 - PLACE
      ?auto_104499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_104498 ?auto_104500 ) ( SURFACE-AT ?auto_104495 ?auto_104500 ) ( CLEAR ?auto_104495 ) ( IS-CRATE ?auto_104497 ) ( not ( = ?auto_104495 ?auto_104497 ) ) ( TRUCK-AT ?auto_104499 ?auto_104500 ) ( AVAILABLE ?auto_104498 ) ( IN ?auto_104497 ?auto_104499 ) ( ON ?auto_104495 ?auto_104496 ) ( not ( = ?auto_104496 ?auto_104495 ) ) ( not ( = ?auto_104496 ?auto_104497 ) ) ( ON ?auto_104492 ?auto_104491 ) ( ON ?auto_104493 ?auto_104492 ) ( ON ?auto_104490 ?auto_104493 ) ( ON ?auto_104494 ?auto_104490 ) ( ON ?auto_104496 ?auto_104494 ) ( not ( = ?auto_104491 ?auto_104492 ) ) ( not ( = ?auto_104491 ?auto_104493 ) ) ( not ( = ?auto_104491 ?auto_104490 ) ) ( not ( = ?auto_104491 ?auto_104494 ) ) ( not ( = ?auto_104491 ?auto_104496 ) ) ( not ( = ?auto_104491 ?auto_104495 ) ) ( not ( = ?auto_104491 ?auto_104497 ) ) ( not ( = ?auto_104492 ?auto_104493 ) ) ( not ( = ?auto_104492 ?auto_104490 ) ) ( not ( = ?auto_104492 ?auto_104494 ) ) ( not ( = ?auto_104492 ?auto_104496 ) ) ( not ( = ?auto_104492 ?auto_104495 ) ) ( not ( = ?auto_104492 ?auto_104497 ) ) ( not ( = ?auto_104493 ?auto_104490 ) ) ( not ( = ?auto_104493 ?auto_104494 ) ) ( not ( = ?auto_104493 ?auto_104496 ) ) ( not ( = ?auto_104493 ?auto_104495 ) ) ( not ( = ?auto_104493 ?auto_104497 ) ) ( not ( = ?auto_104490 ?auto_104494 ) ) ( not ( = ?auto_104490 ?auto_104496 ) ) ( not ( = ?auto_104490 ?auto_104495 ) ) ( not ( = ?auto_104490 ?auto_104497 ) ) ( not ( = ?auto_104494 ?auto_104496 ) ) ( not ( = ?auto_104494 ?auto_104495 ) ) ( not ( = ?auto_104494 ?auto_104497 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_104496 ?auto_104495 ?auto_104497 )
      ( MAKE-7CRATE-VERIFY ?auto_104491 ?auto_104492 ?auto_104493 ?auto_104490 ?auto_104494 ?auto_104496 ?auto_104495 ?auto_104497 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104554 - SURFACE
      ?auto_104555 - SURFACE
      ?auto_104556 - SURFACE
      ?auto_104553 - SURFACE
      ?auto_104557 - SURFACE
      ?auto_104559 - SURFACE
      ?auto_104558 - SURFACE
      ?auto_104560 - SURFACE
    )
    :vars
    (
      ?auto_104564 - HOIST
      ?auto_104561 - PLACE
      ?auto_104562 - TRUCK
      ?auto_104563 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_104564 ?auto_104561 ) ( SURFACE-AT ?auto_104558 ?auto_104561 ) ( CLEAR ?auto_104558 ) ( IS-CRATE ?auto_104560 ) ( not ( = ?auto_104558 ?auto_104560 ) ) ( AVAILABLE ?auto_104564 ) ( IN ?auto_104560 ?auto_104562 ) ( ON ?auto_104558 ?auto_104559 ) ( not ( = ?auto_104559 ?auto_104558 ) ) ( not ( = ?auto_104559 ?auto_104560 ) ) ( TRUCK-AT ?auto_104562 ?auto_104563 ) ( not ( = ?auto_104563 ?auto_104561 ) ) ( ON ?auto_104555 ?auto_104554 ) ( ON ?auto_104556 ?auto_104555 ) ( ON ?auto_104553 ?auto_104556 ) ( ON ?auto_104557 ?auto_104553 ) ( ON ?auto_104559 ?auto_104557 ) ( not ( = ?auto_104554 ?auto_104555 ) ) ( not ( = ?auto_104554 ?auto_104556 ) ) ( not ( = ?auto_104554 ?auto_104553 ) ) ( not ( = ?auto_104554 ?auto_104557 ) ) ( not ( = ?auto_104554 ?auto_104559 ) ) ( not ( = ?auto_104554 ?auto_104558 ) ) ( not ( = ?auto_104554 ?auto_104560 ) ) ( not ( = ?auto_104555 ?auto_104556 ) ) ( not ( = ?auto_104555 ?auto_104553 ) ) ( not ( = ?auto_104555 ?auto_104557 ) ) ( not ( = ?auto_104555 ?auto_104559 ) ) ( not ( = ?auto_104555 ?auto_104558 ) ) ( not ( = ?auto_104555 ?auto_104560 ) ) ( not ( = ?auto_104556 ?auto_104553 ) ) ( not ( = ?auto_104556 ?auto_104557 ) ) ( not ( = ?auto_104556 ?auto_104559 ) ) ( not ( = ?auto_104556 ?auto_104558 ) ) ( not ( = ?auto_104556 ?auto_104560 ) ) ( not ( = ?auto_104553 ?auto_104557 ) ) ( not ( = ?auto_104553 ?auto_104559 ) ) ( not ( = ?auto_104553 ?auto_104558 ) ) ( not ( = ?auto_104553 ?auto_104560 ) ) ( not ( = ?auto_104557 ?auto_104559 ) ) ( not ( = ?auto_104557 ?auto_104558 ) ) ( not ( = ?auto_104557 ?auto_104560 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_104559 ?auto_104558 ?auto_104560 )
      ( MAKE-7CRATE-VERIFY ?auto_104554 ?auto_104555 ?auto_104556 ?auto_104553 ?auto_104557 ?auto_104559 ?auto_104558 ?auto_104560 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104624 - SURFACE
      ?auto_104625 - SURFACE
      ?auto_104626 - SURFACE
      ?auto_104623 - SURFACE
      ?auto_104627 - SURFACE
      ?auto_104629 - SURFACE
      ?auto_104628 - SURFACE
      ?auto_104630 - SURFACE
    )
    :vars
    (
      ?auto_104635 - HOIST
      ?auto_104632 - PLACE
      ?auto_104633 - TRUCK
      ?auto_104631 - PLACE
      ?auto_104634 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_104635 ?auto_104632 ) ( SURFACE-AT ?auto_104628 ?auto_104632 ) ( CLEAR ?auto_104628 ) ( IS-CRATE ?auto_104630 ) ( not ( = ?auto_104628 ?auto_104630 ) ) ( AVAILABLE ?auto_104635 ) ( ON ?auto_104628 ?auto_104629 ) ( not ( = ?auto_104629 ?auto_104628 ) ) ( not ( = ?auto_104629 ?auto_104630 ) ) ( TRUCK-AT ?auto_104633 ?auto_104631 ) ( not ( = ?auto_104631 ?auto_104632 ) ) ( HOIST-AT ?auto_104634 ?auto_104631 ) ( LIFTING ?auto_104634 ?auto_104630 ) ( not ( = ?auto_104635 ?auto_104634 ) ) ( ON ?auto_104625 ?auto_104624 ) ( ON ?auto_104626 ?auto_104625 ) ( ON ?auto_104623 ?auto_104626 ) ( ON ?auto_104627 ?auto_104623 ) ( ON ?auto_104629 ?auto_104627 ) ( not ( = ?auto_104624 ?auto_104625 ) ) ( not ( = ?auto_104624 ?auto_104626 ) ) ( not ( = ?auto_104624 ?auto_104623 ) ) ( not ( = ?auto_104624 ?auto_104627 ) ) ( not ( = ?auto_104624 ?auto_104629 ) ) ( not ( = ?auto_104624 ?auto_104628 ) ) ( not ( = ?auto_104624 ?auto_104630 ) ) ( not ( = ?auto_104625 ?auto_104626 ) ) ( not ( = ?auto_104625 ?auto_104623 ) ) ( not ( = ?auto_104625 ?auto_104627 ) ) ( not ( = ?auto_104625 ?auto_104629 ) ) ( not ( = ?auto_104625 ?auto_104628 ) ) ( not ( = ?auto_104625 ?auto_104630 ) ) ( not ( = ?auto_104626 ?auto_104623 ) ) ( not ( = ?auto_104626 ?auto_104627 ) ) ( not ( = ?auto_104626 ?auto_104629 ) ) ( not ( = ?auto_104626 ?auto_104628 ) ) ( not ( = ?auto_104626 ?auto_104630 ) ) ( not ( = ?auto_104623 ?auto_104627 ) ) ( not ( = ?auto_104623 ?auto_104629 ) ) ( not ( = ?auto_104623 ?auto_104628 ) ) ( not ( = ?auto_104623 ?auto_104630 ) ) ( not ( = ?auto_104627 ?auto_104629 ) ) ( not ( = ?auto_104627 ?auto_104628 ) ) ( not ( = ?auto_104627 ?auto_104630 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_104629 ?auto_104628 ?auto_104630 )
      ( MAKE-7CRATE-VERIFY ?auto_104624 ?auto_104625 ?auto_104626 ?auto_104623 ?auto_104627 ?auto_104629 ?auto_104628 ?auto_104630 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104701 - SURFACE
      ?auto_104702 - SURFACE
      ?auto_104703 - SURFACE
      ?auto_104700 - SURFACE
      ?auto_104704 - SURFACE
      ?auto_104706 - SURFACE
      ?auto_104705 - SURFACE
      ?auto_104707 - SURFACE
    )
    :vars
    (
      ?auto_104708 - HOIST
      ?auto_104713 - PLACE
      ?auto_104709 - TRUCK
      ?auto_104711 - PLACE
      ?auto_104710 - HOIST
      ?auto_104712 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_104708 ?auto_104713 ) ( SURFACE-AT ?auto_104705 ?auto_104713 ) ( CLEAR ?auto_104705 ) ( IS-CRATE ?auto_104707 ) ( not ( = ?auto_104705 ?auto_104707 ) ) ( AVAILABLE ?auto_104708 ) ( ON ?auto_104705 ?auto_104706 ) ( not ( = ?auto_104706 ?auto_104705 ) ) ( not ( = ?auto_104706 ?auto_104707 ) ) ( TRUCK-AT ?auto_104709 ?auto_104711 ) ( not ( = ?auto_104711 ?auto_104713 ) ) ( HOIST-AT ?auto_104710 ?auto_104711 ) ( not ( = ?auto_104708 ?auto_104710 ) ) ( AVAILABLE ?auto_104710 ) ( SURFACE-AT ?auto_104707 ?auto_104711 ) ( ON ?auto_104707 ?auto_104712 ) ( CLEAR ?auto_104707 ) ( not ( = ?auto_104705 ?auto_104712 ) ) ( not ( = ?auto_104707 ?auto_104712 ) ) ( not ( = ?auto_104706 ?auto_104712 ) ) ( ON ?auto_104702 ?auto_104701 ) ( ON ?auto_104703 ?auto_104702 ) ( ON ?auto_104700 ?auto_104703 ) ( ON ?auto_104704 ?auto_104700 ) ( ON ?auto_104706 ?auto_104704 ) ( not ( = ?auto_104701 ?auto_104702 ) ) ( not ( = ?auto_104701 ?auto_104703 ) ) ( not ( = ?auto_104701 ?auto_104700 ) ) ( not ( = ?auto_104701 ?auto_104704 ) ) ( not ( = ?auto_104701 ?auto_104706 ) ) ( not ( = ?auto_104701 ?auto_104705 ) ) ( not ( = ?auto_104701 ?auto_104707 ) ) ( not ( = ?auto_104701 ?auto_104712 ) ) ( not ( = ?auto_104702 ?auto_104703 ) ) ( not ( = ?auto_104702 ?auto_104700 ) ) ( not ( = ?auto_104702 ?auto_104704 ) ) ( not ( = ?auto_104702 ?auto_104706 ) ) ( not ( = ?auto_104702 ?auto_104705 ) ) ( not ( = ?auto_104702 ?auto_104707 ) ) ( not ( = ?auto_104702 ?auto_104712 ) ) ( not ( = ?auto_104703 ?auto_104700 ) ) ( not ( = ?auto_104703 ?auto_104704 ) ) ( not ( = ?auto_104703 ?auto_104706 ) ) ( not ( = ?auto_104703 ?auto_104705 ) ) ( not ( = ?auto_104703 ?auto_104707 ) ) ( not ( = ?auto_104703 ?auto_104712 ) ) ( not ( = ?auto_104700 ?auto_104704 ) ) ( not ( = ?auto_104700 ?auto_104706 ) ) ( not ( = ?auto_104700 ?auto_104705 ) ) ( not ( = ?auto_104700 ?auto_104707 ) ) ( not ( = ?auto_104700 ?auto_104712 ) ) ( not ( = ?auto_104704 ?auto_104706 ) ) ( not ( = ?auto_104704 ?auto_104705 ) ) ( not ( = ?auto_104704 ?auto_104707 ) ) ( not ( = ?auto_104704 ?auto_104712 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_104706 ?auto_104705 ?auto_104707 )
      ( MAKE-7CRATE-VERIFY ?auto_104701 ?auto_104702 ?auto_104703 ?auto_104700 ?auto_104704 ?auto_104706 ?auto_104705 ?auto_104707 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104779 - SURFACE
      ?auto_104780 - SURFACE
      ?auto_104781 - SURFACE
      ?auto_104778 - SURFACE
      ?auto_104782 - SURFACE
      ?auto_104784 - SURFACE
      ?auto_104783 - SURFACE
      ?auto_104785 - SURFACE
    )
    :vars
    (
      ?auto_104791 - HOIST
      ?auto_104787 - PLACE
      ?auto_104786 - PLACE
      ?auto_104790 - HOIST
      ?auto_104789 - SURFACE
      ?auto_104788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_104791 ?auto_104787 ) ( SURFACE-AT ?auto_104783 ?auto_104787 ) ( CLEAR ?auto_104783 ) ( IS-CRATE ?auto_104785 ) ( not ( = ?auto_104783 ?auto_104785 ) ) ( AVAILABLE ?auto_104791 ) ( ON ?auto_104783 ?auto_104784 ) ( not ( = ?auto_104784 ?auto_104783 ) ) ( not ( = ?auto_104784 ?auto_104785 ) ) ( not ( = ?auto_104786 ?auto_104787 ) ) ( HOIST-AT ?auto_104790 ?auto_104786 ) ( not ( = ?auto_104791 ?auto_104790 ) ) ( AVAILABLE ?auto_104790 ) ( SURFACE-AT ?auto_104785 ?auto_104786 ) ( ON ?auto_104785 ?auto_104789 ) ( CLEAR ?auto_104785 ) ( not ( = ?auto_104783 ?auto_104789 ) ) ( not ( = ?auto_104785 ?auto_104789 ) ) ( not ( = ?auto_104784 ?auto_104789 ) ) ( TRUCK-AT ?auto_104788 ?auto_104787 ) ( ON ?auto_104780 ?auto_104779 ) ( ON ?auto_104781 ?auto_104780 ) ( ON ?auto_104778 ?auto_104781 ) ( ON ?auto_104782 ?auto_104778 ) ( ON ?auto_104784 ?auto_104782 ) ( not ( = ?auto_104779 ?auto_104780 ) ) ( not ( = ?auto_104779 ?auto_104781 ) ) ( not ( = ?auto_104779 ?auto_104778 ) ) ( not ( = ?auto_104779 ?auto_104782 ) ) ( not ( = ?auto_104779 ?auto_104784 ) ) ( not ( = ?auto_104779 ?auto_104783 ) ) ( not ( = ?auto_104779 ?auto_104785 ) ) ( not ( = ?auto_104779 ?auto_104789 ) ) ( not ( = ?auto_104780 ?auto_104781 ) ) ( not ( = ?auto_104780 ?auto_104778 ) ) ( not ( = ?auto_104780 ?auto_104782 ) ) ( not ( = ?auto_104780 ?auto_104784 ) ) ( not ( = ?auto_104780 ?auto_104783 ) ) ( not ( = ?auto_104780 ?auto_104785 ) ) ( not ( = ?auto_104780 ?auto_104789 ) ) ( not ( = ?auto_104781 ?auto_104778 ) ) ( not ( = ?auto_104781 ?auto_104782 ) ) ( not ( = ?auto_104781 ?auto_104784 ) ) ( not ( = ?auto_104781 ?auto_104783 ) ) ( not ( = ?auto_104781 ?auto_104785 ) ) ( not ( = ?auto_104781 ?auto_104789 ) ) ( not ( = ?auto_104778 ?auto_104782 ) ) ( not ( = ?auto_104778 ?auto_104784 ) ) ( not ( = ?auto_104778 ?auto_104783 ) ) ( not ( = ?auto_104778 ?auto_104785 ) ) ( not ( = ?auto_104778 ?auto_104789 ) ) ( not ( = ?auto_104782 ?auto_104784 ) ) ( not ( = ?auto_104782 ?auto_104783 ) ) ( not ( = ?auto_104782 ?auto_104785 ) ) ( not ( = ?auto_104782 ?auto_104789 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_104784 ?auto_104783 ?auto_104785 )
      ( MAKE-7CRATE-VERIFY ?auto_104779 ?auto_104780 ?auto_104781 ?auto_104778 ?auto_104782 ?auto_104784 ?auto_104783 ?auto_104785 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104857 - SURFACE
      ?auto_104858 - SURFACE
      ?auto_104859 - SURFACE
      ?auto_104856 - SURFACE
      ?auto_104860 - SURFACE
      ?auto_104862 - SURFACE
      ?auto_104861 - SURFACE
      ?auto_104863 - SURFACE
    )
    :vars
    (
      ?auto_104864 - HOIST
      ?auto_104867 - PLACE
      ?auto_104865 - PLACE
      ?auto_104866 - HOIST
      ?auto_104868 - SURFACE
      ?auto_104869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_104864 ?auto_104867 ) ( IS-CRATE ?auto_104863 ) ( not ( = ?auto_104861 ?auto_104863 ) ) ( not ( = ?auto_104862 ?auto_104861 ) ) ( not ( = ?auto_104862 ?auto_104863 ) ) ( not ( = ?auto_104865 ?auto_104867 ) ) ( HOIST-AT ?auto_104866 ?auto_104865 ) ( not ( = ?auto_104864 ?auto_104866 ) ) ( AVAILABLE ?auto_104866 ) ( SURFACE-AT ?auto_104863 ?auto_104865 ) ( ON ?auto_104863 ?auto_104868 ) ( CLEAR ?auto_104863 ) ( not ( = ?auto_104861 ?auto_104868 ) ) ( not ( = ?auto_104863 ?auto_104868 ) ) ( not ( = ?auto_104862 ?auto_104868 ) ) ( TRUCK-AT ?auto_104869 ?auto_104867 ) ( SURFACE-AT ?auto_104862 ?auto_104867 ) ( CLEAR ?auto_104862 ) ( LIFTING ?auto_104864 ?auto_104861 ) ( IS-CRATE ?auto_104861 ) ( ON ?auto_104858 ?auto_104857 ) ( ON ?auto_104859 ?auto_104858 ) ( ON ?auto_104856 ?auto_104859 ) ( ON ?auto_104860 ?auto_104856 ) ( ON ?auto_104862 ?auto_104860 ) ( not ( = ?auto_104857 ?auto_104858 ) ) ( not ( = ?auto_104857 ?auto_104859 ) ) ( not ( = ?auto_104857 ?auto_104856 ) ) ( not ( = ?auto_104857 ?auto_104860 ) ) ( not ( = ?auto_104857 ?auto_104862 ) ) ( not ( = ?auto_104857 ?auto_104861 ) ) ( not ( = ?auto_104857 ?auto_104863 ) ) ( not ( = ?auto_104857 ?auto_104868 ) ) ( not ( = ?auto_104858 ?auto_104859 ) ) ( not ( = ?auto_104858 ?auto_104856 ) ) ( not ( = ?auto_104858 ?auto_104860 ) ) ( not ( = ?auto_104858 ?auto_104862 ) ) ( not ( = ?auto_104858 ?auto_104861 ) ) ( not ( = ?auto_104858 ?auto_104863 ) ) ( not ( = ?auto_104858 ?auto_104868 ) ) ( not ( = ?auto_104859 ?auto_104856 ) ) ( not ( = ?auto_104859 ?auto_104860 ) ) ( not ( = ?auto_104859 ?auto_104862 ) ) ( not ( = ?auto_104859 ?auto_104861 ) ) ( not ( = ?auto_104859 ?auto_104863 ) ) ( not ( = ?auto_104859 ?auto_104868 ) ) ( not ( = ?auto_104856 ?auto_104860 ) ) ( not ( = ?auto_104856 ?auto_104862 ) ) ( not ( = ?auto_104856 ?auto_104861 ) ) ( not ( = ?auto_104856 ?auto_104863 ) ) ( not ( = ?auto_104856 ?auto_104868 ) ) ( not ( = ?auto_104860 ?auto_104862 ) ) ( not ( = ?auto_104860 ?auto_104861 ) ) ( not ( = ?auto_104860 ?auto_104863 ) ) ( not ( = ?auto_104860 ?auto_104868 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_104862 ?auto_104861 ?auto_104863 )
      ( MAKE-7CRATE-VERIFY ?auto_104857 ?auto_104858 ?auto_104859 ?auto_104856 ?auto_104860 ?auto_104862 ?auto_104861 ?auto_104863 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104935 - SURFACE
      ?auto_104936 - SURFACE
      ?auto_104937 - SURFACE
      ?auto_104934 - SURFACE
      ?auto_104938 - SURFACE
      ?auto_104940 - SURFACE
      ?auto_104939 - SURFACE
      ?auto_104941 - SURFACE
    )
    :vars
    (
      ?auto_104944 - HOIST
      ?auto_104947 - PLACE
      ?auto_104946 - PLACE
      ?auto_104945 - HOIST
      ?auto_104943 - SURFACE
      ?auto_104942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_104944 ?auto_104947 ) ( IS-CRATE ?auto_104941 ) ( not ( = ?auto_104939 ?auto_104941 ) ) ( not ( = ?auto_104940 ?auto_104939 ) ) ( not ( = ?auto_104940 ?auto_104941 ) ) ( not ( = ?auto_104946 ?auto_104947 ) ) ( HOIST-AT ?auto_104945 ?auto_104946 ) ( not ( = ?auto_104944 ?auto_104945 ) ) ( AVAILABLE ?auto_104945 ) ( SURFACE-AT ?auto_104941 ?auto_104946 ) ( ON ?auto_104941 ?auto_104943 ) ( CLEAR ?auto_104941 ) ( not ( = ?auto_104939 ?auto_104943 ) ) ( not ( = ?auto_104941 ?auto_104943 ) ) ( not ( = ?auto_104940 ?auto_104943 ) ) ( TRUCK-AT ?auto_104942 ?auto_104947 ) ( SURFACE-AT ?auto_104940 ?auto_104947 ) ( CLEAR ?auto_104940 ) ( IS-CRATE ?auto_104939 ) ( AVAILABLE ?auto_104944 ) ( IN ?auto_104939 ?auto_104942 ) ( ON ?auto_104936 ?auto_104935 ) ( ON ?auto_104937 ?auto_104936 ) ( ON ?auto_104934 ?auto_104937 ) ( ON ?auto_104938 ?auto_104934 ) ( ON ?auto_104940 ?auto_104938 ) ( not ( = ?auto_104935 ?auto_104936 ) ) ( not ( = ?auto_104935 ?auto_104937 ) ) ( not ( = ?auto_104935 ?auto_104934 ) ) ( not ( = ?auto_104935 ?auto_104938 ) ) ( not ( = ?auto_104935 ?auto_104940 ) ) ( not ( = ?auto_104935 ?auto_104939 ) ) ( not ( = ?auto_104935 ?auto_104941 ) ) ( not ( = ?auto_104935 ?auto_104943 ) ) ( not ( = ?auto_104936 ?auto_104937 ) ) ( not ( = ?auto_104936 ?auto_104934 ) ) ( not ( = ?auto_104936 ?auto_104938 ) ) ( not ( = ?auto_104936 ?auto_104940 ) ) ( not ( = ?auto_104936 ?auto_104939 ) ) ( not ( = ?auto_104936 ?auto_104941 ) ) ( not ( = ?auto_104936 ?auto_104943 ) ) ( not ( = ?auto_104937 ?auto_104934 ) ) ( not ( = ?auto_104937 ?auto_104938 ) ) ( not ( = ?auto_104937 ?auto_104940 ) ) ( not ( = ?auto_104937 ?auto_104939 ) ) ( not ( = ?auto_104937 ?auto_104941 ) ) ( not ( = ?auto_104937 ?auto_104943 ) ) ( not ( = ?auto_104934 ?auto_104938 ) ) ( not ( = ?auto_104934 ?auto_104940 ) ) ( not ( = ?auto_104934 ?auto_104939 ) ) ( not ( = ?auto_104934 ?auto_104941 ) ) ( not ( = ?auto_104934 ?auto_104943 ) ) ( not ( = ?auto_104938 ?auto_104940 ) ) ( not ( = ?auto_104938 ?auto_104939 ) ) ( not ( = ?auto_104938 ?auto_104941 ) ) ( not ( = ?auto_104938 ?auto_104943 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_104940 ?auto_104939 ?auto_104941 )
      ( MAKE-7CRATE-VERIFY ?auto_104935 ?auto_104936 ?auto_104937 ?auto_104934 ?auto_104938 ?auto_104940 ?auto_104939 ?auto_104941 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_107854 - SURFACE
      ?auto_107855 - SURFACE
      ?auto_107856 - SURFACE
      ?auto_107853 - SURFACE
      ?auto_107857 - SURFACE
      ?auto_107859 - SURFACE
      ?auto_107858 - SURFACE
      ?auto_107860 - SURFACE
      ?auto_107861 - SURFACE
    )
    :vars
    (
      ?auto_107863 - HOIST
      ?auto_107862 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_107863 ?auto_107862 ) ( SURFACE-AT ?auto_107860 ?auto_107862 ) ( CLEAR ?auto_107860 ) ( LIFTING ?auto_107863 ?auto_107861 ) ( IS-CRATE ?auto_107861 ) ( not ( = ?auto_107860 ?auto_107861 ) ) ( ON ?auto_107855 ?auto_107854 ) ( ON ?auto_107856 ?auto_107855 ) ( ON ?auto_107853 ?auto_107856 ) ( ON ?auto_107857 ?auto_107853 ) ( ON ?auto_107859 ?auto_107857 ) ( ON ?auto_107858 ?auto_107859 ) ( ON ?auto_107860 ?auto_107858 ) ( not ( = ?auto_107854 ?auto_107855 ) ) ( not ( = ?auto_107854 ?auto_107856 ) ) ( not ( = ?auto_107854 ?auto_107853 ) ) ( not ( = ?auto_107854 ?auto_107857 ) ) ( not ( = ?auto_107854 ?auto_107859 ) ) ( not ( = ?auto_107854 ?auto_107858 ) ) ( not ( = ?auto_107854 ?auto_107860 ) ) ( not ( = ?auto_107854 ?auto_107861 ) ) ( not ( = ?auto_107855 ?auto_107856 ) ) ( not ( = ?auto_107855 ?auto_107853 ) ) ( not ( = ?auto_107855 ?auto_107857 ) ) ( not ( = ?auto_107855 ?auto_107859 ) ) ( not ( = ?auto_107855 ?auto_107858 ) ) ( not ( = ?auto_107855 ?auto_107860 ) ) ( not ( = ?auto_107855 ?auto_107861 ) ) ( not ( = ?auto_107856 ?auto_107853 ) ) ( not ( = ?auto_107856 ?auto_107857 ) ) ( not ( = ?auto_107856 ?auto_107859 ) ) ( not ( = ?auto_107856 ?auto_107858 ) ) ( not ( = ?auto_107856 ?auto_107860 ) ) ( not ( = ?auto_107856 ?auto_107861 ) ) ( not ( = ?auto_107853 ?auto_107857 ) ) ( not ( = ?auto_107853 ?auto_107859 ) ) ( not ( = ?auto_107853 ?auto_107858 ) ) ( not ( = ?auto_107853 ?auto_107860 ) ) ( not ( = ?auto_107853 ?auto_107861 ) ) ( not ( = ?auto_107857 ?auto_107859 ) ) ( not ( = ?auto_107857 ?auto_107858 ) ) ( not ( = ?auto_107857 ?auto_107860 ) ) ( not ( = ?auto_107857 ?auto_107861 ) ) ( not ( = ?auto_107859 ?auto_107858 ) ) ( not ( = ?auto_107859 ?auto_107860 ) ) ( not ( = ?auto_107859 ?auto_107861 ) ) ( not ( = ?auto_107858 ?auto_107860 ) ) ( not ( = ?auto_107858 ?auto_107861 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_107860 ?auto_107861 )
      ( MAKE-8CRATE-VERIFY ?auto_107854 ?auto_107855 ?auto_107856 ?auto_107853 ?auto_107857 ?auto_107859 ?auto_107858 ?auto_107860 ?auto_107861 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_107921 - SURFACE
      ?auto_107922 - SURFACE
      ?auto_107923 - SURFACE
      ?auto_107920 - SURFACE
      ?auto_107924 - SURFACE
      ?auto_107926 - SURFACE
      ?auto_107925 - SURFACE
      ?auto_107927 - SURFACE
      ?auto_107928 - SURFACE
    )
    :vars
    (
      ?auto_107930 - HOIST
      ?auto_107929 - PLACE
      ?auto_107931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_107930 ?auto_107929 ) ( SURFACE-AT ?auto_107927 ?auto_107929 ) ( CLEAR ?auto_107927 ) ( IS-CRATE ?auto_107928 ) ( not ( = ?auto_107927 ?auto_107928 ) ) ( TRUCK-AT ?auto_107931 ?auto_107929 ) ( AVAILABLE ?auto_107930 ) ( IN ?auto_107928 ?auto_107931 ) ( ON ?auto_107927 ?auto_107925 ) ( not ( = ?auto_107925 ?auto_107927 ) ) ( not ( = ?auto_107925 ?auto_107928 ) ) ( ON ?auto_107922 ?auto_107921 ) ( ON ?auto_107923 ?auto_107922 ) ( ON ?auto_107920 ?auto_107923 ) ( ON ?auto_107924 ?auto_107920 ) ( ON ?auto_107926 ?auto_107924 ) ( ON ?auto_107925 ?auto_107926 ) ( not ( = ?auto_107921 ?auto_107922 ) ) ( not ( = ?auto_107921 ?auto_107923 ) ) ( not ( = ?auto_107921 ?auto_107920 ) ) ( not ( = ?auto_107921 ?auto_107924 ) ) ( not ( = ?auto_107921 ?auto_107926 ) ) ( not ( = ?auto_107921 ?auto_107925 ) ) ( not ( = ?auto_107921 ?auto_107927 ) ) ( not ( = ?auto_107921 ?auto_107928 ) ) ( not ( = ?auto_107922 ?auto_107923 ) ) ( not ( = ?auto_107922 ?auto_107920 ) ) ( not ( = ?auto_107922 ?auto_107924 ) ) ( not ( = ?auto_107922 ?auto_107926 ) ) ( not ( = ?auto_107922 ?auto_107925 ) ) ( not ( = ?auto_107922 ?auto_107927 ) ) ( not ( = ?auto_107922 ?auto_107928 ) ) ( not ( = ?auto_107923 ?auto_107920 ) ) ( not ( = ?auto_107923 ?auto_107924 ) ) ( not ( = ?auto_107923 ?auto_107926 ) ) ( not ( = ?auto_107923 ?auto_107925 ) ) ( not ( = ?auto_107923 ?auto_107927 ) ) ( not ( = ?auto_107923 ?auto_107928 ) ) ( not ( = ?auto_107920 ?auto_107924 ) ) ( not ( = ?auto_107920 ?auto_107926 ) ) ( not ( = ?auto_107920 ?auto_107925 ) ) ( not ( = ?auto_107920 ?auto_107927 ) ) ( not ( = ?auto_107920 ?auto_107928 ) ) ( not ( = ?auto_107924 ?auto_107926 ) ) ( not ( = ?auto_107924 ?auto_107925 ) ) ( not ( = ?auto_107924 ?auto_107927 ) ) ( not ( = ?auto_107924 ?auto_107928 ) ) ( not ( = ?auto_107926 ?auto_107925 ) ) ( not ( = ?auto_107926 ?auto_107927 ) ) ( not ( = ?auto_107926 ?auto_107928 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_107925 ?auto_107927 ?auto_107928 )
      ( MAKE-8CRATE-VERIFY ?auto_107921 ?auto_107922 ?auto_107923 ?auto_107920 ?auto_107924 ?auto_107926 ?auto_107925 ?auto_107927 ?auto_107928 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_107997 - SURFACE
      ?auto_107998 - SURFACE
      ?auto_107999 - SURFACE
      ?auto_107996 - SURFACE
      ?auto_108000 - SURFACE
      ?auto_108002 - SURFACE
      ?auto_108001 - SURFACE
      ?auto_108003 - SURFACE
      ?auto_108004 - SURFACE
    )
    :vars
    (
      ?auto_108005 - HOIST
      ?auto_108007 - PLACE
      ?auto_108006 - TRUCK
      ?auto_108008 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_108005 ?auto_108007 ) ( SURFACE-AT ?auto_108003 ?auto_108007 ) ( CLEAR ?auto_108003 ) ( IS-CRATE ?auto_108004 ) ( not ( = ?auto_108003 ?auto_108004 ) ) ( AVAILABLE ?auto_108005 ) ( IN ?auto_108004 ?auto_108006 ) ( ON ?auto_108003 ?auto_108001 ) ( not ( = ?auto_108001 ?auto_108003 ) ) ( not ( = ?auto_108001 ?auto_108004 ) ) ( TRUCK-AT ?auto_108006 ?auto_108008 ) ( not ( = ?auto_108008 ?auto_108007 ) ) ( ON ?auto_107998 ?auto_107997 ) ( ON ?auto_107999 ?auto_107998 ) ( ON ?auto_107996 ?auto_107999 ) ( ON ?auto_108000 ?auto_107996 ) ( ON ?auto_108002 ?auto_108000 ) ( ON ?auto_108001 ?auto_108002 ) ( not ( = ?auto_107997 ?auto_107998 ) ) ( not ( = ?auto_107997 ?auto_107999 ) ) ( not ( = ?auto_107997 ?auto_107996 ) ) ( not ( = ?auto_107997 ?auto_108000 ) ) ( not ( = ?auto_107997 ?auto_108002 ) ) ( not ( = ?auto_107997 ?auto_108001 ) ) ( not ( = ?auto_107997 ?auto_108003 ) ) ( not ( = ?auto_107997 ?auto_108004 ) ) ( not ( = ?auto_107998 ?auto_107999 ) ) ( not ( = ?auto_107998 ?auto_107996 ) ) ( not ( = ?auto_107998 ?auto_108000 ) ) ( not ( = ?auto_107998 ?auto_108002 ) ) ( not ( = ?auto_107998 ?auto_108001 ) ) ( not ( = ?auto_107998 ?auto_108003 ) ) ( not ( = ?auto_107998 ?auto_108004 ) ) ( not ( = ?auto_107999 ?auto_107996 ) ) ( not ( = ?auto_107999 ?auto_108000 ) ) ( not ( = ?auto_107999 ?auto_108002 ) ) ( not ( = ?auto_107999 ?auto_108001 ) ) ( not ( = ?auto_107999 ?auto_108003 ) ) ( not ( = ?auto_107999 ?auto_108004 ) ) ( not ( = ?auto_107996 ?auto_108000 ) ) ( not ( = ?auto_107996 ?auto_108002 ) ) ( not ( = ?auto_107996 ?auto_108001 ) ) ( not ( = ?auto_107996 ?auto_108003 ) ) ( not ( = ?auto_107996 ?auto_108004 ) ) ( not ( = ?auto_108000 ?auto_108002 ) ) ( not ( = ?auto_108000 ?auto_108001 ) ) ( not ( = ?auto_108000 ?auto_108003 ) ) ( not ( = ?auto_108000 ?auto_108004 ) ) ( not ( = ?auto_108002 ?auto_108001 ) ) ( not ( = ?auto_108002 ?auto_108003 ) ) ( not ( = ?auto_108002 ?auto_108004 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_108001 ?auto_108003 ?auto_108004 )
      ( MAKE-8CRATE-VERIFY ?auto_107997 ?auto_107998 ?auto_107999 ?auto_107996 ?auto_108000 ?auto_108002 ?auto_108001 ?auto_108003 ?auto_108004 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_108081 - SURFACE
      ?auto_108082 - SURFACE
      ?auto_108083 - SURFACE
      ?auto_108080 - SURFACE
      ?auto_108084 - SURFACE
      ?auto_108086 - SURFACE
      ?auto_108085 - SURFACE
      ?auto_108087 - SURFACE
      ?auto_108088 - SURFACE
    )
    :vars
    (
      ?auto_108091 - HOIST
      ?auto_108089 - PLACE
      ?auto_108092 - TRUCK
      ?auto_108090 - PLACE
      ?auto_108093 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_108091 ?auto_108089 ) ( SURFACE-AT ?auto_108087 ?auto_108089 ) ( CLEAR ?auto_108087 ) ( IS-CRATE ?auto_108088 ) ( not ( = ?auto_108087 ?auto_108088 ) ) ( AVAILABLE ?auto_108091 ) ( ON ?auto_108087 ?auto_108085 ) ( not ( = ?auto_108085 ?auto_108087 ) ) ( not ( = ?auto_108085 ?auto_108088 ) ) ( TRUCK-AT ?auto_108092 ?auto_108090 ) ( not ( = ?auto_108090 ?auto_108089 ) ) ( HOIST-AT ?auto_108093 ?auto_108090 ) ( LIFTING ?auto_108093 ?auto_108088 ) ( not ( = ?auto_108091 ?auto_108093 ) ) ( ON ?auto_108082 ?auto_108081 ) ( ON ?auto_108083 ?auto_108082 ) ( ON ?auto_108080 ?auto_108083 ) ( ON ?auto_108084 ?auto_108080 ) ( ON ?auto_108086 ?auto_108084 ) ( ON ?auto_108085 ?auto_108086 ) ( not ( = ?auto_108081 ?auto_108082 ) ) ( not ( = ?auto_108081 ?auto_108083 ) ) ( not ( = ?auto_108081 ?auto_108080 ) ) ( not ( = ?auto_108081 ?auto_108084 ) ) ( not ( = ?auto_108081 ?auto_108086 ) ) ( not ( = ?auto_108081 ?auto_108085 ) ) ( not ( = ?auto_108081 ?auto_108087 ) ) ( not ( = ?auto_108081 ?auto_108088 ) ) ( not ( = ?auto_108082 ?auto_108083 ) ) ( not ( = ?auto_108082 ?auto_108080 ) ) ( not ( = ?auto_108082 ?auto_108084 ) ) ( not ( = ?auto_108082 ?auto_108086 ) ) ( not ( = ?auto_108082 ?auto_108085 ) ) ( not ( = ?auto_108082 ?auto_108087 ) ) ( not ( = ?auto_108082 ?auto_108088 ) ) ( not ( = ?auto_108083 ?auto_108080 ) ) ( not ( = ?auto_108083 ?auto_108084 ) ) ( not ( = ?auto_108083 ?auto_108086 ) ) ( not ( = ?auto_108083 ?auto_108085 ) ) ( not ( = ?auto_108083 ?auto_108087 ) ) ( not ( = ?auto_108083 ?auto_108088 ) ) ( not ( = ?auto_108080 ?auto_108084 ) ) ( not ( = ?auto_108080 ?auto_108086 ) ) ( not ( = ?auto_108080 ?auto_108085 ) ) ( not ( = ?auto_108080 ?auto_108087 ) ) ( not ( = ?auto_108080 ?auto_108088 ) ) ( not ( = ?auto_108084 ?auto_108086 ) ) ( not ( = ?auto_108084 ?auto_108085 ) ) ( not ( = ?auto_108084 ?auto_108087 ) ) ( not ( = ?auto_108084 ?auto_108088 ) ) ( not ( = ?auto_108086 ?auto_108085 ) ) ( not ( = ?auto_108086 ?auto_108087 ) ) ( not ( = ?auto_108086 ?auto_108088 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_108085 ?auto_108087 ?auto_108088 )
      ( MAKE-8CRATE-VERIFY ?auto_108081 ?auto_108082 ?auto_108083 ?auto_108080 ?auto_108084 ?auto_108086 ?auto_108085 ?auto_108087 ?auto_108088 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_108173 - SURFACE
      ?auto_108174 - SURFACE
      ?auto_108175 - SURFACE
      ?auto_108172 - SURFACE
      ?auto_108176 - SURFACE
      ?auto_108178 - SURFACE
      ?auto_108177 - SURFACE
      ?auto_108179 - SURFACE
      ?auto_108180 - SURFACE
    )
    :vars
    (
      ?auto_108186 - HOIST
      ?auto_108184 - PLACE
      ?auto_108183 - TRUCK
      ?auto_108182 - PLACE
      ?auto_108181 - HOIST
      ?auto_108185 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_108186 ?auto_108184 ) ( SURFACE-AT ?auto_108179 ?auto_108184 ) ( CLEAR ?auto_108179 ) ( IS-CRATE ?auto_108180 ) ( not ( = ?auto_108179 ?auto_108180 ) ) ( AVAILABLE ?auto_108186 ) ( ON ?auto_108179 ?auto_108177 ) ( not ( = ?auto_108177 ?auto_108179 ) ) ( not ( = ?auto_108177 ?auto_108180 ) ) ( TRUCK-AT ?auto_108183 ?auto_108182 ) ( not ( = ?auto_108182 ?auto_108184 ) ) ( HOIST-AT ?auto_108181 ?auto_108182 ) ( not ( = ?auto_108186 ?auto_108181 ) ) ( AVAILABLE ?auto_108181 ) ( SURFACE-AT ?auto_108180 ?auto_108182 ) ( ON ?auto_108180 ?auto_108185 ) ( CLEAR ?auto_108180 ) ( not ( = ?auto_108179 ?auto_108185 ) ) ( not ( = ?auto_108180 ?auto_108185 ) ) ( not ( = ?auto_108177 ?auto_108185 ) ) ( ON ?auto_108174 ?auto_108173 ) ( ON ?auto_108175 ?auto_108174 ) ( ON ?auto_108172 ?auto_108175 ) ( ON ?auto_108176 ?auto_108172 ) ( ON ?auto_108178 ?auto_108176 ) ( ON ?auto_108177 ?auto_108178 ) ( not ( = ?auto_108173 ?auto_108174 ) ) ( not ( = ?auto_108173 ?auto_108175 ) ) ( not ( = ?auto_108173 ?auto_108172 ) ) ( not ( = ?auto_108173 ?auto_108176 ) ) ( not ( = ?auto_108173 ?auto_108178 ) ) ( not ( = ?auto_108173 ?auto_108177 ) ) ( not ( = ?auto_108173 ?auto_108179 ) ) ( not ( = ?auto_108173 ?auto_108180 ) ) ( not ( = ?auto_108173 ?auto_108185 ) ) ( not ( = ?auto_108174 ?auto_108175 ) ) ( not ( = ?auto_108174 ?auto_108172 ) ) ( not ( = ?auto_108174 ?auto_108176 ) ) ( not ( = ?auto_108174 ?auto_108178 ) ) ( not ( = ?auto_108174 ?auto_108177 ) ) ( not ( = ?auto_108174 ?auto_108179 ) ) ( not ( = ?auto_108174 ?auto_108180 ) ) ( not ( = ?auto_108174 ?auto_108185 ) ) ( not ( = ?auto_108175 ?auto_108172 ) ) ( not ( = ?auto_108175 ?auto_108176 ) ) ( not ( = ?auto_108175 ?auto_108178 ) ) ( not ( = ?auto_108175 ?auto_108177 ) ) ( not ( = ?auto_108175 ?auto_108179 ) ) ( not ( = ?auto_108175 ?auto_108180 ) ) ( not ( = ?auto_108175 ?auto_108185 ) ) ( not ( = ?auto_108172 ?auto_108176 ) ) ( not ( = ?auto_108172 ?auto_108178 ) ) ( not ( = ?auto_108172 ?auto_108177 ) ) ( not ( = ?auto_108172 ?auto_108179 ) ) ( not ( = ?auto_108172 ?auto_108180 ) ) ( not ( = ?auto_108172 ?auto_108185 ) ) ( not ( = ?auto_108176 ?auto_108178 ) ) ( not ( = ?auto_108176 ?auto_108177 ) ) ( not ( = ?auto_108176 ?auto_108179 ) ) ( not ( = ?auto_108176 ?auto_108180 ) ) ( not ( = ?auto_108176 ?auto_108185 ) ) ( not ( = ?auto_108178 ?auto_108177 ) ) ( not ( = ?auto_108178 ?auto_108179 ) ) ( not ( = ?auto_108178 ?auto_108180 ) ) ( not ( = ?auto_108178 ?auto_108185 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_108177 ?auto_108179 ?auto_108180 )
      ( MAKE-8CRATE-VERIFY ?auto_108173 ?auto_108174 ?auto_108175 ?auto_108172 ?auto_108176 ?auto_108178 ?auto_108177 ?auto_108179 ?auto_108180 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_108266 - SURFACE
      ?auto_108267 - SURFACE
      ?auto_108268 - SURFACE
      ?auto_108265 - SURFACE
      ?auto_108269 - SURFACE
      ?auto_108271 - SURFACE
      ?auto_108270 - SURFACE
      ?auto_108272 - SURFACE
      ?auto_108273 - SURFACE
    )
    :vars
    (
      ?auto_108275 - HOIST
      ?auto_108274 - PLACE
      ?auto_108276 - PLACE
      ?auto_108278 - HOIST
      ?auto_108279 - SURFACE
      ?auto_108277 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_108275 ?auto_108274 ) ( SURFACE-AT ?auto_108272 ?auto_108274 ) ( CLEAR ?auto_108272 ) ( IS-CRATE ?auto_108273 ) ( not ( = ?auto_108272 ?auto_108273 ) ) ( AVAILABLE ?auto_108275 ) ( ON ?auto_108272 ?auto_108270 ) ( not ( = ?auto_108270 ?auto_108272 ) ) ( not ( = ?auto_108270 ?auto_108273 ) ) ( not ( = ?auto_108276 ?auto_108274 ) ) ( HOIST-AT ?auto_108278 ?auto_108276 ) ( not ( = ?auto_108275 ?auto_108278 ) ) ( AVAILABLE ?auto_108278 ) ( SURFACE-AT ?auto_108273 ?auto_108276 ) ( ON ?auto_108273 ?auto_108279 ) ( CLEAR ?auto_108273 ) ( not ( = ?auto_108272 ?auto_108279 ) ) ( not ( = ?auto_108273 ?auto_108279 ) ) ( not ( = ?auto_108270 ?auto_108279 ) ) ( TRUCK-AT ?auto_108277 ?auto_108274 ) ( ON ?auto_108267 ?auto_108266 ) ( ON ?auto_108268 ?auto_108267 ) ( ON ?auto_108265 ?auto_108268 ) ( ON ?auto_108269 ?auto_108265 ) ( ON ?auto_108271 ?auto_108269 ) ( ON ?auto_108270 ?auto_108271 ) ( not ( = ?auto_108266 ?auto_108267 ) ) ( not ( = ?auto_108266 ?auto_108268 ) ) ( not ( = ?auto_108266 ?auto_108265 ) ) ( not ( = ?auto_108266 ?auto_108269 ) ) ( not ( = ?auto_108266 ?auto_108271 ) ) ( not ( = ?auto_108266 ?auto_108270 ) ) ( not ( = ?auto_108266 ?auto_108272 ) ) ( not ( = ?auto_108266 ?auto_108273 ) ) ( not ( = ?auto_108266 ?auto_108279 ) ) ( not ( = ?auto_108267 ?auto_108268 ) ) ( not ( = ?auto_108267 ?auto_108265 ) ) ( not ( = ?auto_108267 ?auto_108269 ) ) ( not ( = ?auto_108267 ?auto_108271 ) ) ( not ( = ?auto_108267 ?auto_108270 ) ) ( not ( = ?auto_108267 ?auto_108272 ) ) ( not ( = ?auto_108267 ?auto_108273 ) ) ( not ( = ?auto_108267 ?auto_108279 ) ) ( not ( = ?auto_108268 ?auto_108265 ) ) ( not ( = ?auto_108268 ?auto_108269 ) ) ( not ( = ?auto_108268 ?auto_108271 ) ) ( not ( = ?auto_108268 ?auto_108270 ) ) ( not ( = ?auto_108268 ?auto_108272 ) ) ( not ( = ?auto_108268 ?auto_108273 ) ) ( not ( = ?auto_108268 ?auto_108279 ) ) ( not ( = ?auto_108265 ?auto_108269 ) ) ( not ( = ?auto_108265 ?auto_108271 ) ) ( not ( = ?auto_108265 ?auto_108270 ) ) ( not ( = ?auto_108265 ?auto_108272 ) ) ( not ( = ?auto_108265 ?auto_108273 ) ) ( not ( = ?auto_108265 ?auto_108279 ) ) ( not ( = ?auto_108269 ?auto_108271 ) ) ( not ( = ?auto_108269 ?auto_108270 ) ) ( not ( = ?auto_108269 ?auto_108272 ) ) ( not ( = ?auto_108269 ?auto_108273 ) ) ( not ( = ?auto_108269 ?auto_108279 ) ) ( not ( = ?auto_108271 ?auto_108270 ) ) ( not ( = ?auto_108271 ?auto_108272 ) ) ( not ( = ?auto_108271 ?auto_108273 ) ) ( not ( = ?auto_108271 ?auto_108279 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_108270 ?auto_108272 ?auto_108273 )
      ( MAKE-8CRATE-VERIFY ?auto_108266 ?auto_108267 ?auto_108268 ?auto_108265 ?auto_108269 ?auto_108271 ?auto_108270 ?auto_108272 ?auto_108273 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_108359 - SURFACE
      ?auto_108360 - SURFACE
      ?auto_108361 - SURFACE
      ?auto_108358 - SURFACE
      ?auto_108362 - SURFACE
      ?auto_108364 - SURFACE
      ?auto_108363 - SURFACE
      ?auto_108365 - SURFACE
      ?auto_108366 - SURFACE
    )
    :vars
    (
      ?auto_108369 - HOIST
      ?auto_108367 - PLACE
      ?auto_108368 - PLACE
      ?auto_108372 - HOIST
      ?auto_108371 - SURFACE
      ?auto_108370 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_108369 ?auto_108367 ) ( IS-CRATE ?auto_108366 ) ( not ( = ?auto_108365 ?auto_108366 ) ) ( not ( = ?auto_108363 ?auto_108365 ) ) ( not ( = ?auto_108363 ?auto_108366 ) ) ( not ( = ?auto_108368 ?auto_108367 ) ) ( HOIST-AT ?auto_108372 ?auto_108368 ) ( not ( = ?auto_108369 ?auto_108372 ) ) ( AVAILABLE ?auto_108372 ) ( SURFACE-AT ?auto_108366 ?auto_108368 ) ( ON ?auto_108366 ?auto_108371 ) ( CLEAR ?auto_108366 ) ( not ( = ?auto_108365 ?auto_108371 ) ) ( not ( = ?auto_108366 ?auto_108371 ) ) ( not ( = ?auto_108363 ?auto_108371 ) ) ( TRUCK-AT ?auto_108370 ?auto_108367 ) ( SURFACE-AT ?auto_108363 ?auto_108367 ) ( CLEAR ?auto_108363 ) ( LIFTING ?auto_108369 ?auto_108365 ) ( IS-CRATE ?auto_108365 ) ( ON ?auto_108360 ?auto_108359 ) ( ON ?auto_108361 ?auto_108360 ) ( ON ?auto_108358 ?auto_108361 ) ( ON ?auto_108362 ?auto_108358 ) ( ON ?auto_108364 ?auto_108362 ) ( ON ?auto_108363 ?auto_108364 ) ( not ( = ?auto_108359 ?auto_108360 ) ) ( not ( = ?auto_108359 ?auto_108361 ) ) ( not ( = ?auto_108359 ?auto_108358 ) ) ( not ( = ?auto_108359 ?auto_108362 ) ) ( not ( = ?auto_108359 ?auto_108364 ) ) ( not ( = ?auto_108359 ?auto_108363 ) ) ( not ( = ?auto_108359 ?auto_108365 ) ) ( not ( = ?auto_108359 ?auto_108366 ) ) ( not ( = ?auto_108359 ?auto_108371 ) ) ( not ( = ?auto_108360 ?auto_108361 ) ) ( not ( = ?auto_108360 ?auto_108358 ) ) ( not ( = ?auto_108360 ?auto_108362 ) ) ( not ( = ?auto_108360 ?auto_108364 ) ) ( not ( = ?auto_108360 ?auto_108363 ) ) ( not ( = ?auto_108360 ?auto_108365 ) ) ( not ( = ?auto_108360 ?auto_108366 ) ) ( not ( = ?auto_108360 ?auto_108371 ) ) ( not ( = ?auto_108361 ?auto_108358 ) ) ( not ( = ?auto_108361 ?auto_108362 ) ) ( not ( = ?auto_108361 ?auto_108364 ) ) ( not ( = ?auto_108361 ?auto_108363 ) ) ( not ( = ?auto_108361 ?auto_108365 ) ) ( not ( = ?auto_108361 ?auto_108366 ) ) ( not ( = ?auto_108361 ?auto_108371 ) ) ( not ( = ?auto_108358 ?auto_108362 ) ) ( not ( = ?auto_108358 ?auto_108364 ) ) ( not ( = ?auto_108358 ?auto_108363 ) ) ( not ( = ?auto_108358 ?auto_108365 ) ) ( not ( = ?auto_108358 ?auto_108366 ) ) ( not ( = ?auto_108358 ?auto_108371 ) ) ( not ( = ?auto_108362 ?auto_108364 ) ) ( not ( = ?auto_108362 ?auto_108363 ) ) ( not ( = ?auto_108362 ?auto_108365 ) ) ( not ( = ?auto_108362 ?auto_108366 ) ) ( not ( = ?auto_108362 ?auto_108371 ) ) ( not ( = ?auto_108364 ?auto_108363 ) ) ( not ( = ?auto_108364 ?auto_108365 ) ) ( not ( = ?auto_108364 ?auto_108366 ) ) ( not ( = ?auto_108364 ?auto_108371 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_108363 ?auto_108365 ?auto_108366 )
      ( MAKE-8CRATE-VERIFY ?auto_108359 ?auto_108360 ?auto_108361 ?auto_108358 ?auto_108362 ?auto_108364 ?auto_108363 ?auto_108365 ?auto_108366 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_108452 - SURFACE
      ?auto_108453 - SURFACE
      ?auto_108454 - SURFACE
      ?auto_108451 - SURFACE
      ?auto_108455 - SURFACE
      ?auto_108457 - SURFACE
      ?auto_108456 - SURFACE
      ?auto_108458 - SURFACE
      ?auto_108459 - SURFACE
    )
    :vars
    (
      ?auto_108463 - HOIST
      ?auto_108464 - PLACE
      ?auto_108462 - PLACE
      ?auto_108461 - HOIST
      ?auto_108465 - SURFACE
      ?auto_108460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_108463 ?auto_108464 ) ( IS-CRATE ?auto_108459 ) ( not ( = ?auto_108458 ?auto_108459 ) ) ( not ( = ?auto_108456 ?auto_108458 ) ) ( not ( = ?auto_108456 ?auto_108459 ) ) ( not ( = ?auto_108462 ?auto_108464 ) ) ( HOIST-AT ?auto_108461 ?auto_108462 ) ( not ( = ?auto_108463 ?auto_108461 ) ) ( AVAILABLE ?auto_108461 ) ( SURFACE-AT ?auto_108459 ?auto_108462 ) ( ON ?auto_108459 ?auto_108465 ) ( CLEAR ?auto_108459 ) ( not ( = ?auto_108458 ?auto_108465 ) ) ( not ( = ?auto_108459 ?auto_108465 ) ) ( not ( = ?auto_108456 ?auto_108465 ) ) ( TRUCK-AT ?auto_108460 ?auto_108464 ) ( SURFACE-AT ?auto_108456 ?auto_108464 ) ( CLEAR ?auto_108456 ) ( IS-CRATE ?auto_108458 ) ( AVAILABLE ?auto_108463 ) ( IN ?auto_108458 ?auto_108460 ) ( ON ?auto_108453 ?auto_108452 ) ( ON ?auto_108454 ?auto_108453 ) ( ON ?auto_108451 ?auto_108454 ) ( ON ?auto_108455 ?auto_108451 ) ( ON ?auto_108457 ?auto_108455 ) ( ON ?auto_108456 ?auto_108457 ) ( not ( = ?auto_108452 ?auto_108453 ) ) ( not ( = ?auto_108452 ?auto_108454 ) ) ( not ( = ?auto_108452 ?auto_108451 ) ) ( not ( = ?auto_108452 ?auto_108455 ) ) ( not ( = ?auto_108452 ?auto_108457 ) ) ( not ( = ?auto_108452 ?auto_108456 ) ) ( not ( = ?auto_108452 ?auto_108458 ) ) ( not ( = ?auto_108452 ?auto_108459 ) ) ( not ( = ?auto_108452 ?auto_108465 ) ) ( not ( = ?auto_108453 ?auto_108454 ) ) ( not ( = ?auto_108453 ?auto_108451 ) ) ( not ( = ?auto_108453 ?auto_108455 ) ) ( not ( = ?auto_108453 ?auto_108457 ) ) ( not ( = ?auto_108453 ?auto_108456 ) ) ( not ( = ?auto_108453 ?auto_108458 ) ) ( not ( = ?auto_108453 ?auto_108459 ) ) ( not ( = ?auto_108453 ?auto_108465 ) ) ( not ( = ?auto_108454 ?auto_108451 ) ) ( not ( = ?auto_108454 ?auto_108455 ) ) ( not ( = ?auto_108454 ?auto_108457 ) ) ( not ( = ?auto_108454 ?auto_108456 ) ) ( not ( = ?auto_108454 ?auto_108458 ) ) ( not ( = ?auto_108454 ?auto_108459 ) ) ( not ( = ?auto_108454 ?auto_108465 ) ) ( not ( = ?auto_108451 ?auto_108455 ) ) ( not ( = ?auto_108451 ?auto_108457 ) ) ( not ( = ?auto_108451 ?auto_108456 ) ) ( not ( = ?auto_108451 ?auto_108458 ) ) ( not ( = ?auto_108451 ?auto_108459 ) ) ( not ( = ?auto_108451 ?auto_108465 ) ) ( not ( = ?auto_108455 ?auto_108457 ) ) ( not ( = ?auto_108455 ?auto_108456 ) ) ( not ( = ?auto_108455 ?auto_108458 ) ) ( not ( = ?auto_108455 ?auto_108459 ) ) ( not ( = ?auto_108455 ?auto_108465 ) ) ( not ( = ?auto_108457 ?auto_108456 ) ) ( not ( = ?auto_108457 ?auto_108458 ) ) ( not ( = ?auto_108457 ?auto_108459 ) ) ( not ( = ?auto_108457 ?auto_108465 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_108456 ?auto_108458 ?auto_108459 )
      ( MAKE-8CRATE-VERIFY ?auto_108452 ?auto_108453 ?auto_108454 ?auto_108451 ?auto_108455 ?auto_108457 ?auto_108456 ?auto_108458 ?auto_108459 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_110946 - SURFACE
      ?auto_110947 - SURFACE
    )
    :vars
    (
      ?auto_110954 - HOIST
      ?auto_110953 - PLACE
      ?auto_110952 - SURFACE
      ?auto_110951 - TRUCK
      ?auto_110950 - PLACE
      ?auto_110948 - HOIST
      ?auto_110949 - SURFACE
      ?auto_110955 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_110954 ?auto_110953 ) ( SURFACE-AT ?auto_110946 ?auto_110953 ) ( CLEAR ?auto_110946 ) ( IS-CRATE ?auto_110947 ) ( not ( = ?auto_110946 ?auto_110947 ) ) ( AVAILABLE ?auto_110954 ) ( ON ?auto_110946 ?auto_110952 ) ( not ( = ?auto_110952 ?auto_110946 ) ) ( not ( = ?auto_110952 ?auto_110947 ) ) ( TRUCK-AT ?auto_110951 ?auto_110950 ) ( not ( = ?auto_110950 ?auto_110953 ) ) ( HOIST-AT ?auto_110948 ?auto_110950 ) ( not ( = ?auto_110954 ?auto_110948 ) ) ( SURFACE-AT ?auto_110947 ?auto_110950 ) ( ON ?auto_110947 ?auto_110949 ) ( CLEAR ?auto_110947 ) ( not ( = ?auto_110946 ?auto_110949 ) ) ( not ( = ?auto_110947 ?auto_110949 ) ) ( not ( = ?auto_110952 ?auto_110949 ) ) ( LIFTING ?auto_110948 ?auto_110955 ) ( IS-CRATE ?auto_110955 ) ( not ( = ?auto_110946 ?auto_110955 ) ) ( not ( = ?auto_110947 ?auto_110955 ) ) ( not ( = ?auto_110952 ?auto_110955 ) ) ( not ( = ?auto_110949 ?auto_110955 ) ) )
    :subtasks
    ( ( !LOAD ?auto_110948 ?auto_110955 ?auto_110951 ?auto_110950 )
      ( MAKE-1CRATE ?auto_110946 ?auto_110947 )
      ( MAKE-1CRATE-VERIFY ?auto_110946 ?auto_110947 ) )
  )

)

