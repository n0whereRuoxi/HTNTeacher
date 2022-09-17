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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_185976 - SURFACE
      ?auto_185977 - SURFACE
    )
    :vars
    (
      ?auto_185978 - HOIST
      ?auto_185979 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_185978 ?auto_185979 ) ( SURFACE-AT ?auto_185976 ?auto_185979 ) ( CLEAR ?auto_185976 ) ( LIFTING ?auto_185978 ?auto_185977 ) ( IS-CRATE ?auto_185977 ) ( not ( = ?auto_185976 ?auto_185977 ) ) )
    :subtasks
    ( ( !DROP ?auto_185978 ?auto_185977 ?auto_185976 ?auto_185979 )
      ( MAKE-1CRATE-VERIFY ?auto_185976 ?auto_185977 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_185980 - SURFACE
      ?auto_185981 - SURFACE
    )
    :vars
    (
      ?auto_185982 - HOIST
      ?auto_185983 - PLACE
      ?auto_185984 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_185982 ?auto_185983 ) ( SURFACE-AT ?auto_185980 ?auto_185983 ) ( CLEAR ?auto_185980 ) ( IS-CRATE ?auto_185981 ) ( not ( = ?auto_185980 ?auto_185981 ) ) ( TRUCK-AT ?auto_185984 ?auto_185983 ) ( AVAILABLE ?auto_185982 ) ( IN ?auto_185981 ?auto_185984 ) )
    :subtasks
    ( ( !UNLOAD ?auto_185982 ?auto_185981 ?auto_185984 ?auto_185983 )
      ( MAKE-1CRATE ?auto_185980 ?auto_185981 )
      ( MAKE-1CRATE-VERIFY ?auto_185980 ?auto_185981 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_185985 - SURFACE
      ?auto_185986 - SURFACE
    )
    :vars
    (
      ?auto_185989 - HOIST
      ?auto_185987 - PLACE
      ?auto_185988 - TRUCK
      ?auto_185990 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_185989 ?auto_185987 ) ( SURFACE-AT ?auto_185985 ?auto_185987 ) ( CLEAR ?auto_185985 ) ( IS-CRATE ?auto_185986 ) ( not ( = ?auto_185985 ?auto_185986 ) ) ( AVAILABLE ?auto_185989 ) ( IN ?auto_185986 ?auto_185988 ) ( TRUCK-AT ?auto_185988 ?auto_185990 ) ( not ( = ?auto_185990 ?auto_185987 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_185988 ?auto_185990 ?auto_185987 )
      ( MAKE-1CRATE ?auto_185985 ?auto_185986 )
      ( MAKE-1CRATE-VERIFY ?auto_185985 ?auto_185986 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_185991 - SURFACE
      ?auto_185992 - SURFACE
    )
    :vars
    (
      ?auto_185996 - HOIST
      ?auto_185995 - PLACE
      ?auto_185993 - TRUCK
      ?auto_185994 - PLACE
      ?auto_185997 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_185996 ?auto_185995 ) ( SURFACE-AT ?auto_185991 ?auto_185995 ) ( CLEAR ?auto_185991 ) ( IS-CRATE ?auto_185992 ) ( not ( = ?auto_185991 ?auto_185992 ) ) ( AVAILABLE ?auto_185996 ) ( TRUCK-AT ?auto_185993 ?auto_185994 ) ( not ( = ?auto_185994 ?auto_185995 ) ) ( HOIST-AT ?auto_185997 ?auto_185994 ) ( LIFTING ?auto_185997 ?auto_185992 ) ( not ( = ?auto_185996 ?auto_185997 ) ) )
    :subtasks
    ( ( !LOAD ?auto_185997 ?auto_185992 ?auto_185993 ?auto_185994 )
      ( MAKE-1CRATE ?auto_185991 ?auto_185992 )
      ( MAKE-1CRATE-VERIFY ?auto_185991 ?auto_185992 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_185998 - SURFACE
      ?auto_185999 - SURFACE
    )
    :vars
    (
      ?auto_186002 - HOIST
      ?auto_186003 - PLACE
      ?auto_186001 - TRUCK
      ?auto_186000 - PLACE
      ?auto_186004 - HOIST
      ?auto_186005 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186002 ?auto_186003 ) ( SURFACE-AT ?auto_185998 ?auto_186003 ) ( CLEAR ?auto_185998 ) ( IS-CRATE ?auto_185999 ) ( not ( = ?auto_185998 ?auto_185999 ) ) ( AVAILABLE ?auto_186002 ) ( TRUCK-AT ?auto_186001 ?auto_186000 ) ( not ( = ?auto_186000 ?auto_186003 ) ) ( HOIST-AT ?auto_186004 ?auto_186000 ) ( not ( = ?auto_186002 ?auto_186004 ) ) ( AVAILABLE ?auto_186004 ) ( SURFACE-AT ?auto_185999 ?auto_186000 ) ( ON ?auto_185999 ?auto_186005 ) ( CLEAR ?auto_185999 ) ( not ( = ?auto_185998 ?auto_186005 ) ) ( not ( = ?auto_185999 ?auto_186005 ) ) )
    :subtasks
    ( ( !LIFT ?auto_186004 ?auto_185999 ?auto_186005 ?auto_186000 )
      ( MAKE-1CRATE ?auto_185998 ?auto_185999 )
      ( MAKE-1CRATE-VERIFY ?auto_185998 ?auto_185999 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186006 - SURFACE
      ?auto_186007 - SURFACE
    )
    :vars
    (
      ?auto_186009 - HOIST
      ?auto_186013 - PLACE
      ?auto_186012 - PLACE
      ?auto_186010 - HOIST
      ?auto_186008 - SURFACE
      ?auto_186011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186009 ?auto_186013 ) ( SURFACE-AT ?auto_186006 ?auto_186013 ) ( CLEAR ?auto_186006 ) ( IS-CRATE ?auto_186007 ) ( not ( = ?auto_186006 ?auto_186007 ) ) ( AVAILABLE ?auto_186009 ) ( not ( = ?auto_186012 ?auto_186013 ) ) ( HOIST-AT ?auto_186010 ?auto_186012 ) ( not ( = ?auto_186009 ?auto_186010 ) ) ( AVAILABLE ?auto_186010 ) ( SURFACE-AT ?auto_186007 ?auto_186012 ) ( ON ?auto_186007 ?auto_186008 ) ( CLEAR ?auto_186007 ) ( not ( = ?auto_186006 ?auto_186008 ) ) ( not ( = ?auto_186007 ?auto_186008 ) ) ( TRUCK-AT ?auto_186011 ?auto_186013 ) )
    :subtasks
    ( ( !DRIVE ?auto_186011 ?auto_186013 ?auto_186012 )
      ( MAKE-1CRATE ?auto_186006 ?auto_186007 )
      ( MAKE-1CRATE-VERIFY ?auto_186006 ?auto_186007 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186023 - SURFACE
      ?auto_186024 - SURFACE
      ?auto_186025 - SURFACE
    )
    :vars
    (
      ?auto_186026 - HOIST
      ?auto_186027 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186026 ?auto_186027 ) ( SURFACE-AT ?auto_186024 ?auto_186027 ) ( CLEAR ?auto_186024 ) ( LIFTING ?auto_186026 ?auto_186025 ) ( IS-CRATE ?auto_186025 ) ( not ( = ?auto_186024 ?auto_186025 ) ) ( ON ?auto_186024 ?auto_186023 ) ( not ( = ?auto_186023 ?auto_186024 ) ) ( not ( = ?auto_186023 ?auto_186025 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186024 ?auto_186025 )
      ( MAKE-2CRATE-VERIFY ?auto_186023 ?auto_186024 ?auto_186025 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186033 - SURFACE
      ?auto_186034 - SURFACE
      ?auto_186035 - SURFACE
    )
    :vars
    (
      ?auto_186036 - HOIST
      ?auto_186037 - PLACE
      ?auto_186038 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186036 ?auto_186037 ) ( SURFACE-AT ?auto_186034 ?auto_186037 ) ( CLEAR ?auto_186034 ) ( IS-CRATE ?auto_186035 ) ( not ( = ?auto_186034 ?auto_186035 ) ) ( TRUCK-AT ?auto_186038 ?auto_186037 ) ( AVAILABLE ?auto_186036 ) ( IN ?auto_186035 ?auto_186038 ) ( ON ?auto_186034 ?auto_186033 ) ( not ( = ?auto_186033 ?auto_186034 ) ) ( not ( = ?auto_186033 ?auto_186035 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186034 ?auto_186035 )
      ( MAKE-2CRATE-VERIFY ?auto_186033 ?auto_186034 ?auto_186035 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186039 - SURFACE
      ?auto_186040 - SURFACE
    )
    :vars
    (
      ?auto_186042 - HOIST
      ?auto_186041 - PLACE
      ?auto_186044 - TRUCK
      ?auto_186043 - SURFACE
      ?auto_186045 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186042 ?auto_186041 ) ( SURFACE-AT ?auto_186039 ?auto_186041 ) ( CLEAR ?auto_186039 ) ( IS-CRATE ?auto_186040 ) ( not ( = ?auto_186039 ?auto_186040 ) ) ( AVAILABLE ?auto_186042 ) ( IN ?auto_186040 ?auto_186044 ) ( ON ?auto_186039 ?auto_186043 ) ( not ( = ?auto_186043 ?auto_186039 ) ) ( not ( = ?auto_186043 ?auto_186040 ) ) ( TRUCK-AT ?auto_186044 ?auto_186045 ) ( not ( = ?auto_186045 ?auto_186041 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_186044 ?auto_186045 ?auto_186041 )
      ( MAKE-2CRATE ?auto_186043 ?auto_186039 ?auto_186040 )
      ( MAKE-1CRATE-VERIFY ?auto_186039 ?auto_186040 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186046 - SURFACE
      ?auto_186047 - SURFACE
      ?auto_186048 - SURFACE
    )
    :vars
    (
      ?auto_186051 - HOIST
      ?auto_186050 - PLACE
      ?auto_186049 - TRUCK
      ?auto_186052 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186051 ?auto_186050 ) ( SURFACE-AT ?auto_186047 ?auto_186050 ) ( CLEAR ?auto_186047 ) ( IS-CRATE ?auto_186048 ) ( not ( = ?auto_186047 ?auto_186048 ) ) ( AVAILABLE ?auto_186051 ) ( IN ?auto_186048 ?auto_186049 ) ( ON ?auto_186047 ?auto_186046 ) ( not ( = ?auto_186046 ?auto_186047 ) ) ( not ( = ?auto_186046 ?auto_186048 ) ) ( TRUCK-AT ?auto_186049 ?auto_186052 ) ( not ( = ?auto_186052 ?auto_186050 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186047 ?auto_186048 )
      ( MAKE-2CRATE-VERIFY ?auto_186046 ?auto_186047 ?auto_186048 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186053 - SURFACE
      ?auto_186054 - SURFACE
    )
    :vars
    (
      ?auto_186057 - HOIST
      ?auto_186055 - PLACE
      ?auto_186056 - SURFACE
      ?auto_186059 - TRUCK
      ?auto_186058 - PLACE
      ?auto_186060 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_186057 ?auto_186055 ) ( SURFACE-AT ?auto_186053 ?auto_186055 ) ( CLEAR ?auto_186053 ) ( IS-CRATE ?auto_186054 ) ( not ( = ?auto_186053 ?auto_186054 ) ) ( AVAILABLE ?auto_186057 ) ( ON ?auto_186053 ?auto_186056 ) ( not ( = ?auto_186056 ?auto_186053 ) ) ( not ( = ?auto_186056 ?auto_186054 ) ) ( TRUCK-AT ?auto_186059 ?auto_186058 ) ( not ( = ?auto_186058 ?auto_186055 ) ) ( HOIST-AT ?auto_186060 ?auto_186058 ) ( LIFTING ?auto_186060 ?auto_186054 ) ( not ( = ?auto_186057 ?auto_186060 ) ) )
    :subtasks
    ( ( !LOAD ?auto_186060 ?auto_186054 ?auto_186059 ?auto_186058 )
      ( MAKE-2CRATE ?auto_186056 ?auto_186053 ?auto_186054 )
      ( MAKE-1CRATE-VERIFY ?auto_186053 ?auto_186054 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186061 - SURFACE
      ?auto_186062 - SURFACE
      ?auto_186063 - SURFACE
    )
    :vars
    (
      ?auto_186068 - HOIST
      ?auto_186064 - PLACE
      ?auto_186066 - TRUCK
      ?auto_186067 - PLACE
      ?auto_186065 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_186068 ?auto_186064 ) ( SURFACE-AT ?auto_186062 ?auto_186064 ) ( CLEAR ?auto_186062 ) ( IS-CRATE ?auto_186063 ) ( not ( = ?auto_186062 ?auto_186063 ) ) ( AVAILABLE ?auto_186068 ) ( ON ?auto_186062 ?auto_186061 ) ( not ( = ?auto_186061 ?auto_186062 ) ) ( not ( = ?auto_186061 ?auto_186063 ) ) ( TRUCK-AT ?auto_186066 ?auto_186067 ) ( not ( = ?auto_186067 ?auto_186064 ) ) ( HOIST-AT ?auto_186065 ?auto_186067 ) ( LIFTING ?auto_186065 ?auto_186063 ) ( not ( = ?auto_186068 ?auto_186065 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186062 ?auto_186063 )
      ( MAKE-2CRATE-VERIFY ?auto_186061 ?auto_186062 ?auto_186063 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186069 - SURFACE
      ?auto_186070 - SURFACE
    )
    :vars
    (
      ?auto_186073 - HOIST
      ?auto_186072 - PLACE
      ?auto_186074 - SURFACE
      ?auto_186076 - TRUCK
      ?auto_186071 - PLACE
      ?auto_186075 - HOIST
      ?auto_186077 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186073 ?auto_186072 ) ( SURFACE-AT ?auto_186069 ?auto_186072 ) ( CLEAR ?auto_186069 ) ( IS-CRATE ?auto_186070 ) ( not ( = ?auto_186069 ?auto_186070 ) ) ( AVAILABLE ?auto_186073 ) ( ON ?auto_186069 ?auto_186074 ) ( not ( = ?auto_186074 ?auto_186069 ) ) ( not ( = ?auto_186074 ?auto_186070 ) ) ( TRUCK-AT ?auto_186076 ?auto_186071 ) ( not ( = ?auto_186071 ?auto_186072 ) ) ( HOIST-AT ?auto_186075 ?auto_186071 ) ( not ( = ?auto_186073 ?auto_186075 ) ) ( AVAILABLE ?auto_186075 ) ( SURFACE-AT ?auto_186070 ?auto_186071 ) ( ON ?auto_186070 ?auto_186077 ) ( CLEAR ?auto_186070 ) ( not ( = ?auto_186069 ?auto_186077 ) ) ( not ( = ?auto_186070 ?auto_186077 ) ) ( not ( = ?auto_186074 ?auto_186077 ) ) )
    :subtasks
    ( ( !LIFT ?auto_186075 ?auto_186070 ?auto_186077 ?auto_186071 )
      ( MAKE-2CRATE ?auto_186074 ?auto_186069 ?auto_186070 )
      ( MAKE-1CRATE-VERIFY ?auto_186069 ?auto_186070 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186078 - SURFACE
      ?auto_186079 - SURFACE
      ?auto_186080 - SURFACE
    )
    :vars
    (
      ?auto_186081 - HOIST
      ?auto_186085 - PLACE
      ?auto_186086 - TRUCK
      ?auto_186084 - PLACE
      ?auto_186082 - HOIST
      ?auto_186083 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186081 ?auto_186085 ) ( SURFACE-AT ?auto_186079 ?auto_186085 ) ( CLEAR ?auto_186079 ) ( IS-CRATE ?auto_186080 ) ( not ( = ?auto_186079 ?auto_186080 ) ) ( AVAILABLE ?auto_186081 ) ( ON ?auto_186079 ?auto_186078 ) ( not ( = ?auto_186078 ?auto_186079 ) ) ( not ( = ?auto_186078 ?auto_186080 ) ) ( TRUCK-AT ?auto_186086 ?auto_186084 ) ( not ( = ?auto_186084 ?auto_186085 ) ) ( HOIST-AT ?auto_186082 ?auto_186084 ) ( not ( = ?auto_186081 ?auto_186082 ) ) ( AVAILABLE ?auto_186082 ) ( SURFACE-AT ?auto_186080 ?auto_186084 ) ( ON ?auto_186080 ?auto_186083 ) ( CLEAR ?auto_186080 ) ( not ( = ?auto_186079 ?auto_186083 ) ) ( not ( = ?auto_186080 ?auto_186083 ) ) ( not ( = ?auto_186078 ?auto_186083 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186079 ?auto_186080 )
      ( MAKE-2CRATE-VERIFY ?auto_186078 ?auto_186079 ?auto_186080 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186087 - SURFACE
      ?auto_186088 - SURFACE
    )
    :vars
    (
      ?auto_186092 - HOIST
      ?auto_186094 - PLACE
      ?auto_186089 - SURFACE
      ?auto_186095 - PLACE
      ?auto_186090 - HOIST
      ?auto_186091 - SURFACE
      ?auto_186093 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186092 ?auto_186094 ) ( SURFACE-AT ?auto_186087 ?auto_186094 ) ( CLEAR ?auto_186087 ) ( IS-CRATE ?auto_186088 ) ( not ( = ?auto_186087 ?auto_186088 ) ) ( AVAILABLE ?auto_186092 ) ( ON ?auto_186087 ?auto_186089 ) ( not ( = ?auto_186089 ?auto_186087 ) ) ( not ( = ?auto_186089 ?auto_186088 ) ) ( not ( = ?auto_186095 ?auto_186094 ) ) ( HOIST-AT ?auto_186090 ?auto_186095 ) ( not ( = ?auto_186092 ?auto_186090 ) ) ( AVAILABLE ?auto_186090 ) ( SURFACE-AT ?auto_186088 ?auto_186095 ) ( ON ?auto_186088 ?auto_186091 ) ( CLEAR ?auto_186088 ) ( not ( = ?auto_186087 ?auto_186091 ) ) ( not ( = ?auto_186088 ?auto_186091 ) ) ( not ( = ?auto_186089 ?auto_186091 ) ) ( TRUCK-AT ?auto_186093 ?auto_186094 ) )
    :subtasks
    ( ( !DRIVE ?auto_186093 ?auto_186094 ?auto_186095 )
      ( MAKE-2CRATE ?auto_186089 ?auto_186087 ?auto_186088 )
      ( MAKE-1CRATE-VERIFY ?auto_186087 ?auto_186088 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186096 - SURFACE
      ?auto_186097 - SURFACE
      ?auto_186098 - SURFACE
    )
    :vars
    (
      ?auto_186103 - HOIST
      ?auto_186101 - PLACE
      ?auto_186099 - PLACE
      ?auto_186104 - HOIST
      ?auto_186100 - SURFACE
      ?auto_186102 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186103 ?auto_186101 ) ( SURFACE-AT ?auto_186097 ?auto_186101 ) ( CLEAR ?auto_186097 ) ( IS-CRATE ?auto_186098 ) ( not ( = ?auto_186097 ?auto_186098 ) ) ( AVAILABLE ?auto_186103 ) ( ON ?auto_186097 ?auto_186096 ) ( not ( = ?auto_186096 ?auto_186097 ) ) ( not ( = ?auto_186096 ?auto_186098 ) ) ( not ( = ?auto_186099 ?auto_186101 ) ) ( HOIST-AT ?auto_186104 ?auto_186099 ) ( not ( = ?auto_186103 ?auto_186104 ) ) ( AVAILABLE ?auto_186104 ) ( SURFACE-AT ?auto_186098 ?auto_186099 ) ( ON ?auto_186098 ?auto_186100 ) ( CLEAR ?auto_186098 ) ( not ( = ?auto_186097 ?auto_186100 ) ) ( not ( = ?auto_186098 ?auto_186100 ) ) ( not ( = ?auto_186096 ?auto_186100 ) ) ( TRUCK-AT ?auto_186102 ?auto_186101 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186097 ?auto_186098 )
      ( MAKE-2CRATE-VERIFY ?auto_186096 ?auto_186097 ?auto_186098 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186105 - SURFACE
      ?auto_186106 - SURFACE
    )
    :vars
    (
      ?auto_186112 - HOIST
      ?auto_186113 - PLACE
      ?auto_186109 - SURFACE
      ?auto_186107 - PLACE
      ?auto_186110 - HOIST
      ?auto_186111 - SURFACE
      ?auto_186108 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186112 ?auto_186113 ) ( IS-CRATE ?auto_186106 ) ( not ( = ?auto_186105 ?auto_186106 ) ) ( not ( = ?auto_186109 ?auto_186105 ) ) ( not ( = ?auto_186109 ?auto_186106 ) ) ( not ( = ?auto_186107 ?auto_186113 ) ) ( HOIST-AT ?auto_186110 ?auto_186107 ) ( not ( = ?auto_186112 ?auto_186110 ) ) ( AVAILABLE ?auto_186110 ) ( SURFACE-AT ?auto_186106 ?auto_186107 ) ( ON ?auto_186106 ?auto_186111 ) ( CLEAR ?auto_186106 ) ( not ( = ?auto_186105 ?auto_186111 ) ) ( not ( = ?auto_186106 ?auto_186111 ) ) ( not ( = ?auto_186109 ?auto_186111 ) ) ( TRUCK-AT ?auto_186108 ?auto_186113 ) ( SURFACE-AT ?auto_186109 ?auto_186113 ) ( CLEAR ?auto_186109 ) ( LIFTING ?auto_186112 ?auto_186105 ) ( IS-CRATE ?auto_186105 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186109 ?auto_186105 )
      ( MAKE-2CRATE ?auto_186109 ?auto_186105 ?auto_186106 )
      ( MAKE-1CRATE-VERIFY ?auto_186105 ?auto_186106 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186114 - SURFACE
      ?auto_186115 - SURFACE
      ?auto_186116 - SURFACE
    )
    :vars
    (
      ?auto_186121 - HOIST
      ?auto_186118 - PLACE
      ?auto_186120 - PLACE
      ?auto_186119 - HOIST
      ?auto_186117 - SURFACE
      ?auto_186122 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186121 ?auto_186118 ) ( IS-CRATE ?auto_186116 ) ( not ( = ?auto_186115 ?auto_186116 ) ) ( not ( = ?auto_186114 ?auto_186115 ) ) ( not ( = ?auto_186114 ?auto_186116 ) ) ( not ( = ?auto_186120 ?auto_186118 ) ) ( HOIST-AT ?auto_186119 ?auto_186120 ) ( not ( = ?auto_186121 ?auto_186119 ) ) ( AVAILABLE ?auto_186119 ) ( SURFACE-AT ?auto_186116 ?auto_186120 ) ( ON ?auto_186116 ?auto_186117 ) ( CLEAR ?auto_186116 ) ( not ( = ?auto_186115 ?auto_186117 ) ) ( not ( = ?auto_186116 ?auto_186117 ) ) ( not ( = ?auto_186114 ?auto_186117 ) ) ( TRUCK-AT ?auto_186122 ?auto_186118 ) ( SURFACE-AT ?auto_186114 ?auto_186118 ) ( CLEAR ?auto_186114 ) ( LIFTING ?auto_186121 ?auto_186115 ) ( IS-CRATE ?auto_186115 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186115 ?auto_186116 )
      ( MAKE-2CRATE-VERIFY ?auto_186114 ?auto_186115 ?auto_186116 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186123 - SURFACE
      ?auto_186124 - SURFACE
    )
    :vars
    (
      ?auto_186131 - HOIST
      ?auto_186126 - PLACE
      ?auto_186125 - SURFACE
      ?auto_186127 - PLACE
      ?auto_186128 - HOIST
      ?auto_186130 - SURFACE
      ?auto_186129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186131 ?auto_186126 ) ( IS-CRATE ?auto_186124 ) ( not ( = ?auto_186123 ?auto_186124 ) ) ( not ( = ?auto_186125 ?auto_186123 ) ) ( not ( = ?auto_186125 ?auto_186124 ) ) ( not ( = ?auto_186127 ?auto_186126 ) ) ( HOIST-AT ?auto_186128 ?auto_186127 ) ( not ( = ?auto_186131 ?auto_186128 ) ) ( AVAILABLE ?auto_186128 ) ( SURFACE-AT ?auto_186124 ?auto_186127 ) ( ON ?auto_186124 ?auto_186130 ) ( CLEAR ?auto_186124 ) ( not ( = ?auto_186123 ?auto_186130 ) ) ( not ( = ?auto_186124 ?auto_186130 ) ) ( not ( = ?auto_186125 ?auto_186130 ) ) ( TRUCK-AT ?auto_186129 ?auto_186126 ) ( SURFACE-AT ?auto_186125 ?auto_186126 ) ( CLEAR ?auto_186125 ) ( IS-CRATE ?auto_186123 ) ( AVAILABLE ?auto_186131 ) ( IN ?auto_186123 ?auto_186129 ) )
    :subtasks
    ( ( !UNLOAD ?auto_186131 ?auto_186123 ?auto_186129 ?auto_186126 )
      ( MAKE-2CRATE ?auto_186125 ?auto_186123 ?auto_186124 )
      ( MAKE-1CRATE-VERIFY ?auto_186123 ?auto_186124 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186132 - SURFACE
      ?auto_186133 - SURFACE
      ?auto_186134 - SURFACE
    )
    :vars
    (
      ?auto_186136 - HOIST
      ?auto_186135 - PLACE
      ?auto_186139 - PLACE
      ?auto_186140 - HOIST
      ?auto_186138 - SURFACE
      ?auto_186137 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186136 ?auto_186135 ) ( IS-CRATE ?auto_186134 ) ( not ( = ?auto_186133 ?auto_186134 ) ) ( not ( = ?auto_186132 ?auto_186133 ) ) ( not ( = ?auto_186132 ?auto_186134 ) ) ( not ( = ?auto_186139 ?auto_186135 ) ) ( HOIST-AT ?auto_186140 ?auto_186139 ) ( not ( = ?auto_186136 ?auto_186140 ) ) ( AVAILABLE ?auto_186140 ) ( SURFACE-AT ?auto_186134 ?auto_186139 ) ( ON ?auto_186134 ?auto_186138 ) ( CLEAR ?auto_186134 ) ( not ( = ?auto_186133 ?auto_186138 ) ) ( not ( = ?auto_186134 ?auto_186138 ) ) ( not ( = ?auto_186132 ?auto_186138 ) ) ( TRUCK-AT ?auto_186137 ?auto_186135 ) ( SURFACE-AT ?auto_186132 ?auto_186135 ) ( CLEAR ?auto_186132 ) ( IS-CRATE ?auto_186133 ) ( AVAILABLE ?auto_186136 ) ( IN ?auto_186133 ?auto_186137 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186133 ?auto_186134 )
      ( MAKE-2CRATE-VERIFY ?auto_186132 ?auto_186133 ?auto_186134 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186177 - SURFACE
      ?auto_186178 - SURFACE
    )
    :vars
    (
      ?auto_186185 - HOIST
      ?auto_186184 - PLACE
      ?auto_186179 - SURFACE
      ?auto_186181 - PLACE
      ?auto_186182 - HOIST
      ?auto_186180 - SURFACE
      ?auto_186183 - TRUCK
      ?auto_186186 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186185 ?auto_186184 ) ( SURFACE-AT ?auto_186177 ?auto_186184 ) ( CLEAR ?auto_186177 ) ( IS-CRATE ?auto_186178 ) ( not ( = ?auto_186177 ?auto_186178 ) ) ( AVAILABLE ?auto_186185 ) ( ON ?auto_186177 ?auto_186179 ) ( not ( = ?auto_186179 ?auto_186177 ) ) ( not ( = ?auto_186179 ?auto_186178 ) ) ( not ( = ?auto_186181 ?auto_186184 ) ) ( HOIST-AT ?auto_186182 ?auto_186181 ) ( not ( = ?auto_186185 ?auto_186182 ) ) ( AVAILABLE ?auto_186182 ) ( SURFACE-AT ?auto_186178 ?auto_186181 ) ( ON ?auto_186178 ?auto_186180 ) ( CLEAR ?auto_186178 ) ( not ( = ?auto_186177 ?auto_186180 ) ) ( not ( = ?auto_186178 ?auto_186180 ) ) ( not ( = ?auto_186179 ?auto_186180 ) ) ( TRUCK-AT ?auto_186183 ?auto_186186 ) ( not ( = ?auto_186186 ?auto_186184 ) ) ( not ( = ?auto_186181 ?auto_186186 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_186183 ?auto_186186 ?auto_186184 )
      ( MAKE-1CRATE ?auto_186177 ?auto_186178 )
      ( MAKE-1CRATE-VERIFY ?auto_186177 ?auto_186178 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186217 - SURFACE
      ?auto_186218 - SURFACE
      ?auto_186219 - SURFACE
      ?auto_186216 - SURFACE
    )
    :vars
    (
      ?auto_186221 - HOIST
      ?auto_186220 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186221 ?auto_186220 ) ( SURFACE-AT ?auto_186219 ?auto_186220 ) ( CLEAR ?auto_186219 ) ( LIFTING ?auto_186221 ?auto_186216 ) ( IS-CRATE ?auto_186216 ) ( not ( = ?auto_186219 ?auto_186216 ) ) ( ON ?auto_186218 ?auto_186217 ) ( ON ?auto_186219 ?auto_186218 ) ( not ( = ?auto_186217 ?auto_186218 ) ) ( not ( = ?auto_186217 ?auto_186219 ) ) ( not ( = ?auto_186217 ?auto_186216 ) ) ( not ( = ?auto_186218 ?auto_186219 ) ) ( not ( = ?auto_186218 ?auto_186216 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186219 ?auto_186216 )
      ( MAKE-3CRATE-VERIFY ?auto_186217 ?auto_186218 ?auto_186219 ?auto_186216 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186234 - SURFACE
      ?auto_186235 - SURFACE
      ?auto_186236 - SURFACE
      ?auto_186233 - SURFACE
    )
    :vars
    (
      ?auto_186237 - HOIST
      ?auto_186238 - PLACE
      ?auto_186239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186237 ?auto_186238 ) ( SURFACE-AT ?auto_186236 ?auto_186238 ) ( CLEAR ?auto_186236 ) ( IS-CRATE ?auto_186233 ) ( not ( = ?auto_186236 ?auto_186233 ) ) ( TRUCK-AT ?auto_186239 ?auto_186238 ) ( AVAILABLE ?auto_186237 ) ( IN ?auto_186233 ?auto_186239 ) ( ON ?auto_186236 ?auto_186235 ) ( not ( = ?auto_186235 ?auto_186236 ) ) ( not ( = ?auto_186235 ?auto_186233 ) ) ( ON ?auto_186235 ?auto_186234 ) ( not ( = ?auto_186234 ?auto_186235 ) ) ( not ( = ?auto_186234 ?auto_186236 ) ) ( not ( = ?auto_186234 ?auto_186233 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186235 ?auto_186236 ?auto_186233 )
      ( MAKE-3CRATE-VERIFY ?auto_186234 ?auto_186235 ?auto_186236 ?auto_186233 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186255 - SURFACE
      ?auto_186256 - SURFACE
      ?auto_186257 - SURFACE
      ?auto_186254 - SURFACE
    )
    :vars
    (
      ?auto_186259 - HOIST
      ?auto_186261 - PLACE
      ?auto_186258 - TRUCK
      ?auto_186260 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186259 ?auto_186261 ) ( SURFACE-AT ?auto_186257 ?auto_186261 ) ( CLEAR ?auto_186257 ) ( IS-CRATE ?auto_186254 ) ( not ( = ?auto_186257 ?auto_186254 ) ) ( AVAILABLE ?auto_186259 ) ( IN ?auto_186254 ?auto_186258 ) ( ON ?auto_186257 ?auto_186256 ) ( not ( = ?auto_186256 ?auto_186257 ) ) ( not ( = ?auto_186256 ?auto_186254 ) ) ( TRUCK-AT ?auto_186258 ?auto_186260 ) ( not ( = ?auto_186260 ?auto_186261 ) ) ( ON ?auto_186256 ?auto_186255 ) ( not ( = ?auto_186255 ?auto_186256 ) ) ( not ( = ?auto_186255 ?auto_186257 ) ) ( not ( = ?auto_186255 ?auto_186254 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186256 ?auto_186257 ?auto_186254 )
      ( MAKE-3CRATE-VERIFY ?auto_186255 ?auto_186256 ?auto_186257 ?auto_186254 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186279 - SURFACE
      ?auto_186280 - SURFACE
      ?auto_186281 - SURFACE
      ?auto_186278 - SURFACE
    )
    :vars
    (
      ?auto_186283 - HOIST
      ?auto_186285 - PLACE
      ?auto_186286 - TRUCK
      ?auto_186284 - PLACE
      ?auto_186282 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_186283 ?auto_186285 ) ( SURFACE-AT ?auto_186281 ?auto_186285 ) ( CLEAR ?auto_186281 ) ( IS-CRATE ?auto_186278 ) ( not ( = ?auto_186281 ?auto_186278 ) ) ( AVAILABLE ?auto_186283 ) ( ON ?auto_186281 ?auto_186280 ) ( not ( = ?auto_186280 ?auto_186281 ) ) ( not ( = ?auto_186280 ?auto_186278 ) ) ( TRUCK-AT ?auto_186286 ?auto_186284 ) ( not ( = ?auto_186284 ?auto_186285 ) ) ( HOIST-AT ?auto_186282 ?auto_186284 ) ( LIFTING ?auto_186282 ?auto_186278 ) ( not ( = ?auto_186283 ?auto_186282 ) ) ( ON ?auto_186280 ?auto_186279 ) ( not ( = ?auto_186279 ?auto_186280 ) ) ( not ( = ?auto_186279 ?auto_186281 ) ) ( not ( = ?auto_186279 ?auto_186278 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186280 ?auto_186281 ?auto_186278 )
      ( MAKE-3CRATE-VERIFY ?auto_186279 ?auto_186280 ?auto_186281 ?auto_186278 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186306 - SURFACE
      ?auto_186307 - SURFACE
      ?auto_186308 - SURFACE
      ?auto_186305 - SURFACE
    )
    :vars
    (
      ?auto_186310 - HOIST
      ?auto_186314 - PLACE
      ?auto_186311 - TRUCK
      ?auto_186312 - PLACE
      ?auto_186313 - HOIST
      ?auto_186309 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186310 ?auto_186314 ) ( SURFACE-AT ?auto_186308 ?auto_186314 ) ( CLEAR ?auto_186308 ) ( IS-CRATE ?auto_186305 ) ( not ( = ?auto_186308 ?auto_186305 ) ) ( AVAILABLE ?auto_186310 ) ( ON ?auto_186308 ?auto_186307 ) ( not ( = ?auto_186307 ?auto_186308 ) ) ( not ( = ?auto_186307 ?auto_186305 ) ) ( TRUCK-AT ?auto_186311 ?auto_186312 ) ( not ( = ?auto_186312 ?auto_186314 ) ) ( HOIST-AT ?auto_186313 ?auto_186312 ) ( not ( = ?auto_186310 ?auto_186313 ) ) ( AVAILABLE ?auto_186313 ) ( SURFACE-AT ?auto_186305 ?auto_186312 ) ( ON ?auto_186305 ?auto_186309 ) ( CLEAR ?auto_186305 ) ( not ( = ?auto_186308 ?auto_186309 ) ) ( not ( = ?auto_186305 ?auto_186309 ) ) ( not ( = ?auto_186307 ?auto_186309 ) ) ( ON ?auto_186307 ?auto_186306 ) ( not ( = ?auto_186306 ?auto_186307 ) ) ( not ( = ?auto_186306 ?auto_186308 ) ) ( not ( = ?auto_186306 ?auto_186305 ) ) ( not ( = ?auto_186306 ?auto_186309 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186307 ?auto_186308 ?auto_186305 )
      ( MAKE-3CRATE-VERIFY ?auto_186306 ?auto_186307 ?auto_186308 ?auto_186305 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186334 - SURFACE
      ?auto_186335 - SURFACE
      ?auto_186336 - SURFACE
      ?auto_186333 - SURFACE
    )
    :vars
    (
      ?auto_186337 - HOIST
      ?auto_186342 - PLACE
      ?auto_186340 - PLACE
      ?auto_186338 - HOIST
      ?auto_186339 - SURFACE
      ?auto_186341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186337 ?auto_186342 ) ( SURFACE-AT ?auto_186336 ?auto_186342 ) ( CLEAR ?auto_186336 ) ( IS-CRATE ?auto_186333 ) ( not ( = ?auto_186336 ?auto_186333 ) ) ( AVAILABLE ?auto_186337 ) ( ON ?auto_186336 ?auto_186335 ) ( not ( = ?auto_186335 ?auto_186336 ) ) ( not ( = ?auto_186335 ?auto_186333 ) ) ( not ( = ?auto_186340 ?auto_186342 ) ) ( HOIST-AT ?auto_186338 ?auto_186340 ) ( not ( = ?auto_186337 ?auto_186338 ) ) ( AVAILABLE ?auto_186338 ) ( SURFACE-AT ?auto_186333 ?auto_186340 ) ( ON ?auto_186333 ?auto_186339 ) ( CLEAR ?auto_186333 ) ( not ( = ?auto_186336 ?auto_186339 ) ) ( not ( = ?auto_186333 ?auto_186339 ) ) ( not ( = ?auto_186335 ?auto_186339 ) ) ( TRUCK-AT ?auto_186341 ?auto_186342 ) ( ON ?auto_186335 ?auto_186334 ) ( not ( = ?auto_186334 ?auto_186335 ) ) ( not ( = ?auto_186334 ?auto_186336 ) ) ( not ( = ?auto_186334 ?auto_186333 ) ) ( not ( = ?auto_186334 ?auto_186339 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186335 ?auto_186336 ?auto_186333 )
      ( MAKE-3CRATE-VERIFY ?auto_186334 ?auto_186335 ?auto_186336 ?auto_186333 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186362 - SURFACE
      ?auto_186363 - SURFACE
      ?auto_186364 - SURFACE
      ?auto_186361 - SURFACE
    )
    :vars
    (
      ?auto_186365 - HOIST
      ?auto_186367 - PLACE
      ?auto_186369 - PLACE
      ?auto_186368 - HOIST
      ?auto_186366 - SURFACE
      ?auto_186370 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186365 ?auto_186367 ) ( IS-CRATE ?auto_186361 ) ( not ( = ?auto_186364 ?auto_186361 ) ) ( not ( = ?auto_186363 ?auto_186364 ) ) ( not ( = ?auto_186363 ?auto_186361 ) ) ( not ( = ?auto_186369 ?auto_186367 ) ) ( HOIST-AT ?auto_186368 ?auto_186369 ) ( not ( = ?auto_186365 ?auto_186368 ) ) ( AVAILABLE ?auto_186368 ) ( SURFACE-AT ?auto_186361 ?auto_186369 ) ( ON ?auto_186361 ?auto_186366 ) ( CLEAR ?auto_186361 ) ( not ( = ?auto_186364 ?auto_186366 ) ) ( not ( = ?auto_186361 ?auto_186366 ) ) ( not ( = ?auto_186363 ?auto_186366 ) ) ( TRUCK-AT ?auto_186370 ?auto_186367 ) ( SURFACE-AT ?auto_186363 ?auto_186367 ) ( CLEAR ?auto_186363 ) ( LIFTING ?auto_186365 ?auto_186364 ) ( IS-CRATE ?auto_186364 ) ( ON ?auto_186363 ?auto_186362 ) ( not ( = ?auto_186362 ?auto_186363 ) ) ( not ( = ?auto_186362 ?auto_186364 ) ) ( not ( = ?auto_186362 ?auto_186361 ) ) ( not ( = ?auto_186362 ?auto_186366 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186363 ?auto_186364 ?auto_186361 )
      ( MAKE-3CRATE-VERIFY ?auto_186362 ?auto_186363 ?auto_186364 ?auto_186361 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186390 - SURFACE
      ?auto_186391 - SURFACE
      ?auto_186392 - SURFACE
      ?auto_186389 - SURFACE
    )
    :vars
    (
      ?auto_186395 - HOIST
      ?auto_186397 - PLACE
      ?auto_186398 - PLACE
      ?auto_186394 - HOIST
      ?auto_186396 - SURFACE
      ?auto_186393 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186395 ?auto_186397 ) ( IS-CRATE ?auto_186389 ) ( not ( = ?auto_186392 ?auto_186389 ) ) ( not ( = ?auto_186391 ?auto_186392 ) ) ( not ( = ?auto_186391 ?auto_186389 ) ) ( not ( = ?auto_186398 ?auto_186397 ) ) ( HOIST-AT ?auto_186394 ?auto_186398 ) ( not ( = ?auto_186395 ?auto_186394 ) ) ( AVAILABLE ?auto_186394 ) ( SURFACE-AT ?auto_186389 ?auto_186398 ) ( ON ?auto_186389 ?auto_186396 ) ( CLEAR ?auto_186389 ) ( not ( = ?auto_186392 ?auto_186396 ) ) ( not ( = ?auto_186389 ?auto_186396 ) ) ( not ( = ?auto_186391 ?auto_186396 ) ) ( TRUCK-AT ?auto_186393 ?auto_186397 ) ( SURFACE-AT ?auto_186391 ?auto_186397 ) ( CLEAR ?auto_186391 ) ( IS-CRATE ?auto_186392 ) ( AVAILABLE ?auto_186395 ) ( IN ?auto_186392 ?auto_186393 ) ( ON ?auto_186391 ?auto_186390 ) ( not ( = ?auto_186390 ?auto_186391 ) ) ( not ( = ?auto_186390 ?auto_186392 ) ) ( not ( = ?auto_186390 ?auto_186389 ) ) ( not ( = ?auto_186390 ?auto_186396 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186391 ?auto_186392 ?auto_186389 )
      ( MAKE-3CRATE-VERIFY ?auto_186390 ?auto_186391 ?auto_186392 ?auto_186389 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186399 - SURFACE
      ?auto_186400 - SURFACE
    )
    :vars
    (
      ?auto_186403 - HOIST
      ?auto_186406 - PLACE
      ?auto_186405 - SURFACE
      ?auto_186407 - PLACE
      ?auto_186402 - HOIST
      ?auto_186404 - SURFACE
      ?auto_186401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186403 ?auto_186406 ) ( IS-CRATE ?auto_186400 ) ( not ( = ?auto_186399 ?auto_186400 ) ) ( not ( = ?auto_186405 ?auto_186399 ) ) ( not ( = ?auto_186405 ?auto_186400 ) ) ( not ( = ?auto_186407 ?auto_186406 ) ) ( HOIST-AT ?auto_186402 ?auto_186407 ) ( not ( = ?auto_186403 ?auto_186402 ) ) ( AVAILABLE ?auto_186402 ) ( SURFACE-AT ?auto_186400 ?auto_186407 ) ( ON ?auto_186400 ?auto_186404 ) ( CLEAR ?auto_186400 ) ( not ( = ?auto_186399 ?auto_186404 ) ) ( not ( = ?auto_186400 ?auto_186404 ) ) ( not ( = ?auto_186405 ?auto_186404 ) ) ( SURFACE-AT ?auto_186405 ?auto_186406 ) ( CLEAR ?auto_186405 ) ( IS-CRATE ?auto_186399 ) ( AVAILABLE ?auto_186403 ) ( IN ?auto_186399 ?auto_186401 ) ( TRUCK-AT ?auto_186401 ?auto_186407 ) )
    :subtasks
    ( ( !DRIVE ?auto_186401 ?auto_186407 ?auto_186406 )
      ( MAKE-2CRATE ?auto_186405 ?auto_186399 ?auto_186400 )
      ( MAKE-1CRATE-VERIFY ?auto_186399 ?auto_186400 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186408 - SURFACE
      ?auto_186409 - SURFACE
      ?auto_186410 - SURFACE
    )
    :vars
    (
      ?auto_186415 - HOIST
      ?auto_186412 - PLACE
      ?auto_186413 - PLACE
      ?auto_186414 - HOIST
      ?auto_186411 - SURFACE
      ?auto_186416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186415 ?auto_186412 ) ( IS-CRATE ?auto_186410 ) ( not ( = ?auto_186409 ?auto_186410 ) ) ( not ( = ?auto_186408 ?auto_186409 ) ) ( not ( = ?auto_186408 ?auto_186410 ) ) ( not ( = ?auto_186413 ?auto_186412 ) ) ( HOIST-AT ?auto_186414 ?auto_186413 ) ( not ( = ?auto_186415 ?auto_186414 ) ) ( AVAILABLE ?auto_186414 ) ( SURFACE-AT ?auto_186410 ?auto_186413 ) ( ON ?auto_186410 ?auto_186411 ) ( CLEAR ?auto_186410 ) ( not ( = ?auto_186409 ?auto_186411 ) ) ( not ( = ?auto_186410 ?auto_186411 ) ) ( not ( = ?auto_186408 ?auto_186411 ) ) ( SURFACE-AT ?auto_186408 ?auto_186412 ) ( CLEAR ?auto_186408 ) ( IS-CRATE ?auto_186409 ) ( AVAILABLE ?auto_186415 ) ( IN ?auto_186409 ?auto_186416 ) ( TRUCK-AT ?auto_186416 ?auto_186413 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186409 ?auto_186410 )
      ( MAKE-2CRATE-VERIFY ?auto_186408 ?auto_186409 ?auto_186410 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186418 - SURFACE
      ?auto_186419 - SURFACE
      ?auto_186420 - SURFACE
      ?auto_186417 - SURFACE
    )
    :vars
    (
      ?auto_186426 - HOIST
      ?auto_186421 - PLACE
      ?auto_186424 - PLACE
      ?auto_186425 - HOIST
      ?auto_186422 - SURFACE
      ?auto_186423 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186426 ?auto_186421 ) ( IS-CRATE ?auto_186417 ) ( not ( = ?auto_186420 ?auto_186417 ) ) ( not ( = ?auto_186419 ?auto_186420 ) ) ( not ( = ?auto_186419 ?auto_186417 ) ) ( not ( = ?auto_186424 ?auto_186421 ) ) ( HOIST-AT ?auto_186425 ?auto_186424 ) ( not ( = ?auto_186426 ?auto_186425 ) ) ( AVAILABLE ?auto_186425 ) ( SURFACE-AT ?auto_186417 ?auto_186424 ) ( ON ?auto_186417 ?auto_186422 ) ( CLEAR ?auto_186417 ) ( not ( = ?auto_186420 ?auto_186422 ) ) ( not ( = ?auto_186417 ?auto_186422 ) ) ( not ( = ?auto_186419 ?auto_186422 ) ) ( SURFACE-AT ?auto_186419 ?auto_186421 ) ( CLEAR ?auto_186419 ) ( IS-CRATE ?auto_186420 ) ( AVAILABLE ?auto_186426 ) ( IN ?auto_186420 ?auto_186423 ) ( TRUCK-AT ?auto_186423 ?auto_186424 ) ( ON ?auto_186419 ?auto_186418 ) ( not ( = ?auto_186418 ?auto_186419 ) ) ( not ( = ?auto_186418 ?auto_186420 ) ) ( not ( = ?auto_186418 ?auto_186417 ) ) ( not ( = ?auto_186418 ?auto_186422 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186419 ?auto_186420 ?auto_186417 )
      ( MAKE-3CRATE-VERIFY ?auto_186418 ?auto_186419 ?auto_186420 ?auto_186417 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186427 - SURFACE
      ?auto_186428 - SURFACE
    )
    :vars
    (
      ?auto_186435 - HOIST
      ?auto_186430 - PLACE
      ?auto_186429 - SURFACE
      ?auto_186433 - PLACE
      ?auto_186434 - HOIST
      ?auto_186431 - SURFACE
      ?auto_186432 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186435 ?auto_186430 ) ( IS-CRATE ?auto_186428 ) ( not ( = ?auto_186427 ?auto_186428 ) ) ( not ( = ?auto_186429 ?auto_186427 ) ) ( not ( = ?auto_186429 ?auto_186428 ) ) ( not ( = ?auto_186433 ?auto_186430 ) ) ( HOIST-AT ?auto_186434 ?auto_186433 ) ( not ( = ?auto_186435 ?auto_186434 ) ) ( SURFACE-AT ?auto_186428 ?auto_186433 ) ( ON ?auto_186428 ?auto_186431 ) ( CLEAR ?auto_186428 ) ( not ( = ?auto_186427 ?auto_186431 ) ) ( not ( = ?auto_186428 ?auto_186431 ) ) ( not ( = ?auto_186429 ?auto_186431 ) ) ( SURFACE-AT ?auto_186429 ?auto_186430 ) ( CLEAR ?auto_186429 ) ( IS-CRATE ?auto_186427 ) ( AVAILABLE ?auto_186435 ) ( TRUCK-AT ?auto_186432 ?auto_186433 ) ( LIFTING ?auto_186434 ?auto_186427 ) )
    :subtasks
    ( ( !LOAD ?auto_186434 ?auto_186427 ?auto_186432 ?auto_186433 )
      ( MAKE-2CRATE ?auto_186429 ?auto_186427 ?auto_186428 )
      ( MAKE-1CRATE-VERIFY ?auto_186427 ?auto_186428 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186436 - SURFACE
      ?auto_186437 - SURFACE
      ?auto_186438 - SURFACE
    )
    :vars
    (
      ?auto_186444 - HOIST
      ?auto_186442 - PLACE
      ?auto_186440 - PLACE
      ?auto_186441 - HOIST
      ?auto_186443 - SURFACE
      ?auto_186439 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186444 ?auto_186442 ) ( IS-CRATE ?auto_186438 ) ( not ( = ?auto_186437 ?auto_186438 ) ) ( not ( = ?auto_186436 ?auto_186437 ) ) ( not ( = ?auto_186436 ?auto_186438 ) ) ( not ( = ?auto_186440 ?auto_186442 ) ) ( HOIST-AT ?auto_186441 ?auto_186440 ) ( not ( = ?auto_186444 ?auto_186441 ) ) ( SURFACE-AT ?auto_186438 ?auto_186440 ) ( ON ?auto_186438 ?auto_186443 ) ( CLEAR ?auto_186438 ) ( not ( = ?auto_186437 ?auto_186443 ) ) ( not ( = ?auto_186438 ?auto_186443 ) ) ( not ( = ?auto_186436 ?auto_186443 ) ) ( SURFACE-AT ?auto_186436 ?auto_186442 ) ( CLEAR ?auto_186436 ) ( IS-CRATE ?auto_186437 ) ( AVAILABLE ?auto_186444 ) ( TRUCK-AT ?auto_186439 ?auto_186440 ) ( LIFTING ?auto_186441 ?auto_186437 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186437 ?auto_186438 )
      ( MAKE-2CRATE-VERIFY ?auto_186436 ?auto_186437 ?auto_186438 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186446 - SURFACE
      ?auto_186447 - SURFACE
      ?auto_186448 - SURFACE
      ?auto_186445 - SURFACE
    )
    :vars
    (
      ?auto_186453 - HOIST
      ?auto_186452 - PLACE
      ?auto_186454 - PLACE
      ?auto_186451 - HOIST
      ?auto_186450 - SURFACE
      ?auto_186449 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186453 ?auto_186452 ) ( IS-CRATE ?auto_186445 ) ( not ( = ?auto_186448 ?auto_186445 ) ) ( not ( = ?auto_186447 ?auto_186448 ) ) ( not ( = ?auto_186447 ?auto_186445 ) ) ( not ( = ?auto_186454 ?auto_186452 ) ) ( HOIST-AT ?auto_186451 ?auto_186454 ) ( not ( = ?auto_186453 ?auto_186451 ) ) ( SURFACE-AT ?auto_186445 ?auto_186454 ) ( ON ?auto_186445 ?auto_186450 ) ( CLEAR ?auto_186445 ) ( not ( = ?auto_186448 ?auto_186450 ) ) ( not ( = ?auto_186445 ?auto_186450 ) ) ( not ( = ?auto_186447 ?auto_186450 ) ) ( SURFACE-AT ?auto_186447 ?auto_186452 ) ( CLEAR ?auto_186447 ) ( IS-CRATE ?auto_186448 ) ( AVAILABLE ?auto_186453 ) ( TRUCK-AT ?auto_186449 ?auto_186454 ) ( LIFTING ?auto_186451 ?auto_186448 ) ( ON ?auto_186447 ?auto_186446 ) ( not ( = ?auto_186446 ?auto_186447 ) ) ( not ( = ?auto_186446 ?auto_186448 ) ) ( not ( = ?auto_186446 ?auto_186445 ) ) ( not ( = ?auto_186446 ?auto_186450 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186447 ?auto_186448 ?auto_186445 )
      ( MAKE-3CRATE-VERIFY ?auto_186446 ?auto_186447 ?auto_186448 ?auto_186445 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186455 - SURFACE
      ?auto_186456 - SURFACE
    )
    :vars
    (
      ?auto_186462 - HOIST
      ?auto_186461 - PLACE
      ?auto_186457 - SURFACE
      ?auto_186463 - PLACE
      ?auto_186460 - HOIST
      ?auto_186459 - SURFACE
      ?auto_186458 - TRUCK
      ?auto_186464 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186462 ?auto_186461 ) ( IS-CRATE ?auto_186456 ) ( not ( = ?auto_186455 ?auto_186456 ) ) ( not ( = ?auto_186457 ?auto_186455 ) ) ( not ( = ?auto_186457 ?auto_186456 ) ) ( not ( = ?auto_186463 ?auto_186461 ) ) ( HOIST-AT ?auto_186460 ?auto_186463 ) ( not ( = ?auto_186462 ?auto_186460 ) ) ( SURFACE-AT ?auto_186456 ?auto_186463 ) ( ON ?auto_186456 ?auto_186459 ) ( CLEAR ?auto_186456 ) ( not ( = ?auto_186455 ?auto_186459 ) ) ( not ( = ?auto_186456 ?auto_186459 ) ) ( not ( = ?auto_186457 ?auto_186459 ) ) ( SURFACE-AT ?auto_186457 ?auto_186461 ) ( CLEAR ?auto_186457 ) ( IS-CRATE ?auto_186455 ) ( AVAILABLE ?auto_186462 ) ( TRUCK-AT ?auto_186458 ?auto_186463 ) ( AVAILABLE ?auto_186460 ) ( SURFACE-AT ?auto_186455 ?auto_186463 ) ( ON ?auto_186455 ?auto_186464 ) ( CLEAR ?auto_186455 ) ( not ( = ?auto_186455 ?auto_186464 ) ) ( not ( = ?auto_186456 ?auto_186464 ) ) ( not ( = ?auto_186457 ?auto_186464 ) ) ( not ( = ?auto_186459 ?auto_186464 ) ) )
    :subtasks
    ( ( !LIFT ?auto_186460 ?auto_186455 ?auto_186464 ?auto_186463 )
      ( MAKE-2CRATE ?auto_186457 ?auto_186455 ?auto_186456 )
      ( MAKE-1CRATE-VERIFY ?auto_186455 ?auto_186456 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186465 - SURFACE
      ?auto_186466 - SURFACE
      ?auto_186467 - SURFACE
    )
    :vars
    (
      ?auto_186468 - HOIST
      ?auto_186472 - PLACE
      ?auto_186469 - PLACE
      ?auto_186474 - HOIST
      ?auto_186470 - SURFACE
      ?auto_186473 - TRUCK
      ?auto_186471 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186468 ?auto_186472 ) ( IS-CRATE ?auto_186467 ) ( not ( = ?auto_186466 ?auto_186467 ) ) ( not ( = ?auto_186465 ?auto_186466 ) ) ( not ( = ?auto_186465 ?auto_186467 ) ) ( not ( = ?auto_186469 ?auto_186472 ) ) ( HOIST-AT ?auto_186474 ?auto_186469 ) ( not ( = ?auto_186468 ?auto_186474 ) ) ( SURFACE-AT ?auto_186467 ?auto_186469 ) ( ON ?auto_186467 ?auto_186470 ) ( CLEAR ?auto_186467 ) ( not ( = ?auto_186466 ?auto_186470 ) ) ( not ( = ?auto_186467 ?auto_186470 ) ) ( not ( = ?auto_186465 ?auto_186470 ) ) ( SURFACE-AT ?auto_186465 ?auto_186472 ) ( CLEAR ?auto_186465 ) ( IS-CRATE ?auto_186466 ) ( AVAILABLE ?auto_186468 ) ( TRUCK-AT ?auto_186473 ?auto_186469 ) ( AVAILABLE ?auto_186474 ) ( SURFACE-AT ?auto_186466 ?auto_186469 ) ( ON ?auto_186466 ?auto_186471 ) ( CLEAR ?auto_186466 ) ( not ( = ?auto_186466 ?auto_186471 ) ) ( not ( = ?auto_186467 ?auto_186471 ) ) ( not ( = ?auto_186465 ?auto_186471 ) ) ( not ( = ?auto_186470 ?auto_186471 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186466 ?auto_186467 )
      ( MAKE-2CRATE-VERIFY ?auto_186465 ?auto_186466 ?auto_186467 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186476 - SURFACE
      ?auto_186477 - SURFACE
      ?auto_186478 - SURFACE
      ?auto_186475 - SURFACE
    )
    :vars
    (
      ?auto_186483 - HOIST
      ?auto_186479 - PLACE
      ?auto_186482 - PLACE
      ?auto_186484 - HOIST
      ?auto_186481 - SURFACE
      ?auto_186480 - TRUCK
      ?auto_186485 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186483 ?auto_186479 ) ( IS-CRATE ?auto_186475 ) ( not ( = ?auto_186478 ?auto_186475 ) ) ( not ( = ?auto_186477 ?auto_186478 ) ) ( not ( = ?auto_186477 ?auto_186475 ) ) ( not ( = ?auto_186482 ?auto_186479 ) ) ( HOIST-AT ?auto_186484 ?auto_186482 ) ( not ( = ?auto_186483 ?auto_186484 ) ) ( SURFACE-AT ?auto_186475 ?auto_186482 ) ( ON ?auto_186475 ?auto_186481 ) ( CLEAR ?auto_186475 ) ( not ( = ?auto_186478 ?auto_186481 ) ) ( not ( = ?auto_186475 ?auto_186481 ) ) ( not ( = ?auto_186477 ?auto_186481 ) ) ( SURFACE-AT ?auto_186477 ?auto_186479 ) ( CLEAR ?auto_186477 ) ( IS-CRATE ?auto_186478 ) ( AVAILABLE ?auto_186483 ) ( TRUCK-AT ?auto_186480 ?auto_186482 ) ( AVAILABLE ?auto_186484 ) ( SURFACE-AT ?auto_186478 ?auto_186482 ) ( ON ?auto_186478 ?auto_186485 ) ( CLEAR ?auto_186478 ) ( not ( = ?auto_186478 ?auto_186485 ) ) ( not ( = ?auto_186475 ?auto_186485 ) ) ( not ( = ?auto_186477 ?auto_186485 ) ) ( not ( = ?auto_186481 ?auto_186485 ) ) ( ON ?auto_186477 ?auto_186476 ) ( not ( = ?auto_186476 ?auto_186477 ) ) ( not ( = ?auto_186476 ?auto_186478 ) ) ( not ( = ?auto_186476 ?auto_186475 ) ) ( not ( = ?auto_186476 ?auto_186481 ) ) ( not ( = ?auto_186476 ?auto_186485 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186477 ?auto_186478 ?auto_186475 )
      ( MAKE-3CRATE-VERIFY ?auto_186476 ?auto_186477 ?auto_186478 ?auto_186475 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186486 - SURFACE
      ?auto_186487 - SURFACE
    )
    :vars
    (
      ?auto_186493 - HOIST
      ?auto_186488 - PLACE
      ?auto_186492 - SURFACE
      ?auto_186491 - PLACE
      ?auto_186494 - HOIST
      ?auto_186490 - SURFACE
      ?auto_186495 - SURFACE
      ?auto_186489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186493 ?auto_186488 ) ( IS-CRATE ?auto_186487 ) ( not ( = ?auto_186486 ?auto_186487 ) ) ( not ( = ?auto_186492 ?auto_186486 ) ) ( not ( = ?auto_186492 ?auto_186487 ) ) ( not ( = ?auto_186491 ?auto_186488 ) ) ( HOIST-AT ?auto_186494 ?auto_186491 ) ( not ( = ?auto_186493 ?auto_186494 ) ) ( SURFACE-AT ?auto_186487 ?auto_186491 ) ( ON ?auto_186487 ?auto_186490 ) ( CLEAR ?auto_186487 ) ( not ( = ?auto_186486 ?auto_186490 ) ) ( not ( = ?auto_186487 ?auto_186490 ) ) ( not ( = ?auto_186492 ?auto_186490 ) ) ( SURFACE-AT ?auto_186492 ?auto_186488 ) ( CLEAR ?auto_186492 ) ( IS-CRATE ?auto_186486 ) ( AVAILABLE ?auto_186493 ) ( AVAILABLE ?auto_186494 ) ( SURFACE-AT ?auto_186486 ?auto_186491 ) ( ON ?auto_186486 ?auto_186495 ) ( CLEAR ?auto_186486 ) ( not ( = ?auto_186486 ?auto_186495 ) ) ( not ( = ?auto_186487 ?auto_186495 ) ) ( not ( = ?auto_186492 ?auto_186495 ) ) ( not ( = ?auto_186490 ?auto_186495 ) ) ( TRUCK-AT ?auto_186489 ?auto_186488 ) )
    :subtasks
    ( ( !DRIVE ?auto_186489 ?auto_186488 ?auto_186491 )
      ( MAKE-2CRATE ?auto_186492 ?auto_186486 ?auto_186487 )
      ( MAKE-1CRATE-VERIFY ?auto_186486 ?auto_186487 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186496 - SURFACE
      ?auto_186497 - SURFACE
      ?auto_186498 - SURFACE
    )
    :vars
    (
      ?auto_186501 - HOIST
      ?auto_186504 - PLACE
      ?auto_186503 - PLACE
      ?auto_186500 - HOIST
      ?auto_186502 - SURFACE
      ?auto_186499 - SURFACE
      ?auto_186505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186501 ?auto_186504 ) ( IS-CRATE ?auto_186498 ) ( not ( = ?auto_186497 ?auto_186498 ) ) ( not ( = ?auto_186496 ?auto_186497 ) ) ( not ( = ?auto_186496 ?auto_186498 ) ) ( not ( = ?auto_186503 ?auto_186504 ) ) ( HOIST-AT ?auto_186500 ?auto_186503 ) ( not ( = ?auto_186501 ?auto_186500 ) ) ( SURFACE-AT ?auto_186498 ?auto_186503 ) ( ON ?auto_186498 ?auto_186502 ) ( CLEAR ?auto_186498 ) ( not ( = ?auto_186497 ?auto_186502 ) ) ( not ( = ?auto_186498 ?auto_186502 ) ) ( not ( = ?auto_186496 ?auto_186502 ) ) ( SURFACE-AT ?auto_186496 ?auto_186504 ) ( CLEAR ?auto_186496 ) ( IS-CRATE ?auto_186497 ) ( AVAILABLE ?auto_186501 ) ( AVAILABLE ?auto_186500 ) ( SURFACE-AT ?auto_186497 ?auto_186503 ) ( ON ?auto_186497 ?auto_186499 ) ( CLEAR ?auto_186497 ) ( not ( = ?auto_186497 ?auto_186499 ) ) ( not ( = ?auto_186498 ?auto_186499 ) ) ( not ( = ?auto_186496 ?auto_186499 ) ) ( not ( = ?auto_186502 ?auto_186499 ) ) ( TRUCK-AT ?auto_186505 ?auto_186504 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186497 ?auto_186498 )
      ( MAKE-2CRATE-VERIFY ?auto_186496 ?auto_186497 ?auto_186498 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186507 - SURFACE
      ?auto_186508 - SURFACE
      ?auto_186509 - SURFACE
      ?auto_186506 - SURFACE
    )
    :vars
    (
      ?auto_186510 - HOIST
      ?auto_186511 - PLACE
      ?auto_186513 - PLACE
      ?auto_186512 - HOIST
      ?auto_186515 - SURFACE
      ?auto_186516 - SURFACE
      ?auto_186514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186510 ?auto_186511 ) ( IS-CRATE ?auto_186506 ) ( not ( = ?auto_186509 ?auto_186506 ) ) ( not ( = ?auto_186508 ?auto_186509 ) ) ( not ( = ?auto_186508 ?auto_186506 ) ) ( not ( = ?auto_186513 ?auto_186511 ) ) ( HOIST-AT ?auto_186512 ?auto_186513 ) ( not ( = ?auto_186510 ?auto_186512 ) ) ( SURFACE-AT ?auto_186506 ?auto_186513 ) ( ON ?auto_186506 ?auto_186515 ) ( CLEAR ?auto_186506 ) ( not ( = ?auto_186509 ?auto_186515 ) ) ( not ( = ?auto_186506 ?auto_186515 ) ) ( not ( = ?auto_186508 ?auto_186515 ) ) ( SURFACE-AT ?auto_186508 ?auto_186511 ) ( CLEAR ?auto_186508 ) ( IS-CRATE ?auto_186509 ) ( AVAILABLE ?auto_186510 ) ( AVAILABLE ?auto_186512 ) ( SURFACE-AT ?auto_186509 ?auto_186513 ) ( ON ?auto_186509 ?auto_186516 ) ( CLEAR ?auto_186509 ) ( not ( = ?auto_186509 ?auto_186516 ) ) ( not ( = ?auto_186506 ?auto_186516 ) ) ( not ( = ?auto_186508 ?auto_186516 ) ) ( not ( = ?auto_186515 ?auto_186516 ) ) ( TRUCK-AT ?auto_186514 ?auto_186511 ) ( ON ?auto_186508 ?auto_186507 ) ( not ( = ?auto_186507 ?auto_186508 ) ) ( not ( = ?auto_186507 ?auto_186509 ) ) ( not ( = ?auto_186507 ?auto_186506 ) ) ( not ( = ?auto_186507 ?auto_186515 ) ) ( not ( = ?auto_186507 ?auto_186516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186508 ?auto_186509 ?auto_186506 )
      ( MAKE-3CRATE-VERIFY ?auto_186507 ?auto_186508 ?auto_186509 ?auto_186506 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186517 - SURFACE
      ?auto_186518 - SURFACE
    )
    :vars
    (
      ?auto_186519 - HOIST
      ?auto_186520 - PLACE
      ?auto_186521 - SURFACE
      ?auto_186523 - PLACE
      ?auto_186522 - HOIST
      ?auto_186525 - SURFACE
      ?auto_186526 - SURFACE
      ?auto_186524 - TRUCK
      ?auto_186527 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186519 ?auto_186520 ) ( IS-CRATE ?auto_186518 ) ( not ( = ?auto_186517 ?auto_186518 ) ) ( not ( = ?auto_186521 ?auto_186517 ) ) ( not ( = ?auto_186521 ?auto_186518 ) ) ( not ( = ?auto_186523 ?auto_186520 ) ) ( HOIST-AT ?auto_186522 ?auto_186523 ) ( not ( = ?auto_186519 ?auto_186522 ) ) ( SURFACE-AT ?auto_186518 ?auto_186523 ) ( ON ?auto_186518 ?auto_186525 ) ( CLEAR ?auto_186518 ) ( not ( = ?auto_186517 ?auto_186525 ) ) ( not ( = ?auto_186518 ?auto_186525 ) ) ( not ( = ?auto_186521 ?auto_186525 ) ) ( IS-CRATE ?auto_186517 ) ( AVAILABLE ?auto_186522 ) ( SURFACE-AT ?auto_186517 ?auto_186523 ) ( ON ?auto_186517 ?auto_186526 ) ( CLEAR ?auto_186517 ) ( not ( = ?auto_186517 ?auto_186526 ) ) ( not ( = ?auto_186518 ?auto_186526 ) ) ( not ( = ?auto_186521 ?auto_186526 ) ) ( not ( = ?auto_186525 ?auto_186526 ) ) ( TRUCK-AT ?auto_186524 ?auto_186520 ) ( SURFACE-AT ?auto_186527 ?auto_186520 ) ( CLEAR ?auto_186527 ) ( LIFTING ?auto_186519 ?auto_186521 ) ( IS-CRATE ?auto_186521 ) ( not ( = ?auto_186527 ?auto_186521 ) ) ( not ( = ?auto_186517 ?auto_186527 ) ) ( not ( = ?auto_186518 ?auto_186527 ) ) ( not ( = ?auto_186525 ?auto_186527 ) ) ( not ( = ?auto_186526 ?auto_186527 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186527 ?auto_186521 )
      ( MAKE-2CRATE ?auto_186521 ?auto_186517 ?auto_186518 )
      ( MAKE-1CRATE-VERIFY ?auto_186517 ?auto_186518 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186528 - SURFACE
      ?auto_186529 - SURFACE
      ?auto_186530 - SURFACE
    )
    :vars
    (
      ?auto_186538 - HOIST
      ?auto_186536 - PLACE
      ?auto_186537 - PLACE
      ?auto_186535 - HOIST
      ?auto_186532 - SURFACE
      ?auto_186531 - SURFACE
      ?auto_186534 - TRUCK
      ?auto_186533 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186538 ?auto_186536 ) ( IS-CRATE ?auto_186530 ) ( not ( = ?auto_186529 ?auto_186530 ) ) ( not ( = ?auto_186528 ?auto_186529 ) ) ( not ( = ?auto_186528 ?auto_186530 ) ) ( not ( = ?auto_186537 ?auto_186536 ) ) ( HOIST-AT ?auto_186535 ?auto_186537 ) ( not ( = ?auto_186538 ?auto_186535 ) ) ( SURFACE-AT ?auto_186530 ?auto_186537 ) ( ON ?auto_186530 ?auto_186532 ) ( CLEAR ?auto_186530 ) ( not ( = ?auto_186529 ?auto_186532 ) ) ( not ( = ?auto_186530 ?auto_186532 ) ) ( not ( = ?auto_186528 ?auto_186532 ) ) ( IS-CRATE ?auto_186529 ) ( AVAILABLE ?auto_186535 ) ( SURFACE-AT ?auto_186529 ?auto_186537 ) ( ON ?auto_186529 ?auto_186531 ) ( CLEAR ?auto_186529 ) ( not ( = ?auto_186529 ?auto_186531 ) ) ( not ( = ?auto_186530 ?auto_186531 ) ) ( not ( = ?auto_186528 ?auto_186531 ) ) ( not ( = ?auto_186532 ?auto_186531 ) ) ( TRUCK-AT ?auto_186534 ?auto_186536 ) ( SURFACE-AT ?auto_186533 ?auto_186536 ) ( CLEAR ?auto_186533 ) ( LIFTING ?auto_186538 ?auto_186528 ) ( IS-CRATE ?auto_186528 ) ( not ( = ?auto_186533 ?auto_186528 ) ) ( not ( = ?auto_186529 ?auto_186533 ) ) ( not ( = ?auto_186530 ?auto_186533 ) ) ( not ( = ?auto_186532 ?auto_186533 ) ) ( not ( = ?auto_186531 ?auto_186533 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186529 ?auto_186530 )
      ( MAKE-2CRATE-VERIFY ?auto_186528 ?auto_186529 ?auto_186530 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186540 - SURFACE
      ?auto_186541 - SURFACE
      ?auto_186542 - SURFACE
      ?auto_186539 - SURFACE
    )
    :vars
    (
      ?auto_186546 - HOIST
      ?auto_186543 - PLACE
      ?auto_186549 - PLACE
      ?auto_186548 - HOIST
      ?auto_186544 - SURFACE
      ?auto_186545 - SURFACE
      ?auto_186547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186546 ?auto_186543 ) ( IS-CRATE ?auto_186539 ) ( not ( = ?auto_186542 ?auto_186539 ) ) ( not ( = ?auto_186541 ?auto_186542 ) ) ( not ( = ?auto_186541 ?auto_186539 ) ) ( not ( = ?auto_186549 ?auto_186543 ) ) ( HOIST-AT ?auto_186548 ?auto_186549 ) ( not ( = ?auto_186546 ?auto_186548 ) ) ( SURFACE-AT ?auto_186539 ?auto_186549 ) ( ON ?auto_186539 ?auto_186544 ) ( CLEAR ?auto_186539 ) ( not ( = ?auto_186542 ?auto_186544 ) ) ( not ( = ?auto_186539 ?auto_186544 ) ) ( not ( = ?auto_186541 ?auto_186544 ) ) ( IS-CRATE ?auto_186542 ) ( AVAILABLE ?auto_186548 ) ( SURFACE-AT ?auto_186542 ?auto_186549 ) ( ON ?auto_186542 ?auto_186545 ) ( CLEAR ?auto_186542 ) ( not ( = ?auto_186542 ?auto_186545 ) ) ( not ( = ?auto_186539 ?auto_186545 ) ) ( not ( = ?auto_186541 ?auto_186545 ) ) ( not ( = ?auto_186544 ?auto_186545 ) ) ( TRUCK-AT ?auto_186547 ?auto_186543 ) ( SURFACE-AT ?auto_186540 ?auto_186543 ) ( CLEAR ?auto_186540 ) ( LIFTING ?auto_186546 ?auto_186541 ) ( IS-CRATE ?auto_186541 ) ( not ( = ?auto_186540 ?auto_186541 ) ) ( not ( = ?auto_186542 ?auto_186540 ) ) ( not ( = ?auto_186539 ?auto_186540 ) ) ( not ( = ?auto_186544 ?auto_186540 ) ) ( not ( = ?auto_186545 ?auto_186540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186541 ?auto_186542 ?auto_186539 )
      ( MAKE-3CRATE-VERIFY ?auto_186540 ?auto_186541 ?auto_186542 ?auto_186539 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_186686 - SURFACE
      ?auto_186687 - SURFACE
      ?auto_186688 - SURFACE
      ?auto_186685 - SURFACE
      ?auto_186689 - SURFACE
    )
    :vars
    (
      ?auto_186691 - HOIST
      ?auto_186690 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186691 ?auto_186690 ) ( SURFACE-AT ?auto_186685 ?auto_186690 ) ( CLEAR ?auto_186685 ) ( LIFTING ?auto_186691 ?auto_186689 ) ( IS-CRATE ?auto_186689 ) ( not ( = ?auto_186685 ?auto_186689 ) ) ( ON ?auto_186687 ?auto_186686 ) ( ON ?auto_186688 ?auto_186687 ) ( ON ?auto_186685 ?auto_186688 ) ( not ( = ?auto_186686 ?auto_186687 ) ) ( not ( = ?auto_186686 ?auto_186688 ) ) ( not ( = ?auto_186686 ?auto_186685 ) ) ( not ( = ?auto_186686 ?auto_186689 ) ) ( not ( = ?auto_186687 ?auto_186688 ) ) ( not ( = ?auto_186687 ?auto_186685 ) ) ( not ( = ?auto_186687 ?auto_186689 ) ) ( not ( = ?auto_186688 ?auto_186685 ) ) ( not ( = ?auto_186688 ?auto_186689 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186685 ?auto_186689 )
      ( MAKE-4CRATE-VERIFY ?auto_186686 ?auto_186687 ?auto_186688 ?auto_186685 ?auto_186689 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_186711 - SURFACE
      ?auto_186712 - SURFACE
      ?auto_186713 - SURFACE
      ?auto_186710 - SURFACE
      ?auto_186714 - SURFACE
    )
    :vars
    (
      ?auto_186715 - HOIST
      ?auto_186717 - PLACE
      ?auto_186716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186715 ?auto_186717 ) ( SURFACE-AT ?auto_186710 ?auto_186717 ) ( CLEAR ?auto_186710 ) ( IS-CRATE ?auto_186714 ) ( not ( = ?auto_186710 ?auto_186714 ) ) ( TRUCK-AT ?auto_186716 ?auto_186717 ) ( AVAILABLE ?auto_186715 ) ( IN ?auto_186714 ?auto_186716 ) ( ON ?auto_186710 ?auto_186713 ) ( not ( = ?auto_186713 ?auto_186710 ) ) ( not ( = ?auto_186713 ?auto_186714 ) ) ( ON ?auto_186712 ?auto_186711 ) ( ON ?auto_186713 ?auto_186712 ) ( not ( = ?auto_186711 ?auto_186712 ) ) ( not ( = ?auto_186711 ?auto_186713 ) ) ( not ( = ?auto_186711 ?auto_186710 ) ) ( not ( = ?auto_186711 ?auto_186714 ) ) ( not ( = ?auto_186712 ?auto_186713 ) ) ( not ( = ?auto_186712 ?auto_186710 ) ) ( not ( = ?auto_186712 ?auto_186714 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186713 ?auto_186710 ?auto_186714 )
      ( MAKE-4CRATE-VERIFY ?auto_186711 ?auto_186712 ?auto_186713 ?auto_186710 ?auto_186714 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_186741 - SURFACE
      ?auto_186742 - SURFACE
      ?auto_186743 - SURFACE
      ?auto_186740 - SURFACE
      ?auto_186744 - SURFACE
    )
    :vars
    (
      ?auto_186747 - HOIST
      ?auto_186748 - PLACE
      ?auto_186745 - TRUCK
      ?auto_186746 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186747 ?auto_186748 ) ( SURFACE-AT ?auto_186740 ?auto_186748 ) ( CLEAR ?auto_186740 ) ( IS-CRATE ?auto_186744 ) ( not ( = ?auto_186740 ?auto_186744 ) ) ( AVAILABLE ?auto_186747 ) ( IN ?auto_186744 ?auto_186745 ) ( ON ?auto_186740 ?auto_186743 ) ( not ( = ?auto_186743 ?auto_186740 ) ) ( not ( = ?auto_186743 ?auto_186744 ) ) ( TRUCK-AT ?auto_186745 ?auto_186746 ) ( not ( = ?auto_186746 ?auto_186748 ) ) ( ON ?auto_186742 ?auto_186741 ) ( ON ?auto_186743 ?auto_186742 ) ( not ( = ?auto_186741 ?auto_186742 ) ) ( not ( = ?auto_186741 ?auto_186743 ) ) ( not ( = ?auto_186741 ?auto_186740 ) ) ( not ( = ?auto_186741 ?auto_186744 ) ) ( not ( = ?auto_186742 ?auto_186743 ) ) ( not ( = ?auto_186742 ?auto_186740 ) ) ( not ( = ?auto_186742 ?auto_186744 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186743 ?auto_186740 ?auto_186744 )
      ( MAKE-4CRATE-VERIFY ?auto_186741 ?auto_186742 ?auto_186743 ?auto_186740 ?auto_186744 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_186775 - SURFACE
      ?auto_186776 - SURFACE
      ?auto_186777 - SURFACE
      ?auto_186774 - SURFACE
      ?auto_186778 - SURFACE
    )
    :vars
    (
      ?auto_186782 - HOIST
      ?auto_186783 - PLACE
      ?auto_186780 - TRUCK
      ?auto_186779 - PLACE
      ?auto_186781 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_186782 ?auto_186783 ) ( SURFACE-AT ?auto_186774 ?auto_186783 ) ( CLEAR ?auto_186774 ) ( IS-CRATE ?auto_186778 ) ( not ( = ?auto_186774 ?auto_186778 ) ) ( AVAILABLE ?auto_186782 ) ( ON ?auto_186774 ?auto_186777 ) ( not ( = ?auto_186777 ?auto_186774 ) ) ( not ( = ?auto_186777 ?auto_186778 ) ) ( TRUCK-AT ?auto_186780 ?auto_186779 ) ( not ( = ?auto_186779 ?auto_186783 ) ) ( HOIST-AT ?auto_186781 ?auto_186779 ) ( LIFTING ?auto_186781 ?auto_186778 ) ( not ( = ?auto_186782 ?auto_186781 ) ) ( ON ?auto_186776 ?auto_186775 ) ( ON ?auto_186777 ?auto_186776 ) ( not ( = ?auto_186775 ?auto_186776 ) ) ( not ( = ?auto_186775 ?auto_186777 ) ) ( not ( = ?auto_186775 ?auto_186774 ) ) ( not ( = ?auto_186775 ?auto_186778 ) ) ( not ( = ?auto_186776 ?auto_186777 ) ) ( not ( = ?auto_186776 ?auto_186774 ) ) ( not ( = ?auto_186776 ?auto_186778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186777 ?auto_186774 ?auto_186778 )
      ( MAKE-4CRATE-VERIFY ?auto_186775 ?auto_186776 ?auto_186777 ?auto_186774 ?auto_186778 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_186813 - SURFACE
      ?auto_186814 - SURFACE
      ?auto_186815 - SURFACE
      ?auto_186812 - SURFACE
      ?auto_186816 - SURFACE
    )
    :vars
    (
      ?auto_186820 - HOIST
      ?auto_186819 - PLACE
      ?auto_186822 - TRUCK
      ?auto_186818 - PLACE
      ?auto_186817 - HOIST
      ?auto_186821 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186820 ?auto_186819 ) ( SURFACE-AT ?auto_186812 ?auto_186819 ) ( CLEAR ?auto_186812 ) ( IS-CRATE ?auto_186816 ) ( not ( = ?auto_186812 ?auto_186816 ) ) ( AVAILABLE ?auto_186820 ) ( ON ?auto_186812 ?auto_186815 ) ( not ( = ?auto_186815 ?auto_186812 ) ) ( not ( = ?auto_186815 ?auto_186816 ) ) ( TRUCK-AT ?auto_186822 ?auto_186818 ) ( not ( = ?auto_186818 ?auto_186819 ) ) ( HOIST-AT ?auto_186817 ?auto_186818 ) ( not ( = ?auto_186820 ?auto_186817 ) ) ( AVAILABLE ?auto_186817 ) ( SURFACE-AT ?auto_186816 ?auto_186818 ) ( ON ?auto_186816 ?auto_186821 ) ( CLEAR ?auto_186816 ) ( not ( = ?auto_186812 ?auto_186821 ) ) ( not ( = ?auto_186816 ?auto_186821 ) ) ( not ( = ?auto_186815 ?auto_186821 ) ) ( ON ?auto_186814 ?auto_186813 ) ( ON ?auto_186815 ?auto_186814 ) ( not ( = ?auto_186813 ?auto_186814 ) ) ( not ( = ?auto_186813 ?auto_186815 ) ) ( not ( = ?auto_186813 ?auto_186812 ) ) ( not ( = ?auto_186813 ?auto_186816 ) ) ( not ( = ?auto_186813 ?auto_186821 ) ) ( not ( = ?auto_186814 ?auto_186815 ) ) ( not ( = ?auto_186814 ?auto_186812 ) ) ( not ( = ?auto_186814 ?auto_186816 ) ) ( not ( = ?auto_186814 ?auto_186821 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186815 ?auto_186812 ?auto_186816 )
      ( MAKE-4CRATE-VERIFY ?auto_186813 ?auto_186814 ?auto_186815 ?auto_186812 ?auto_186816 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_186852 - SURFACE
      ?auto_186853 - SURFACE
      ?auto_186854 - SURFACE
      ?auto_186851 - SURFACE
      ?auto_186855 - SURFACE
    )
    :vars
    (
      ?auto_186860 - HOIST
      ?auto_186858 - PLACE
      ?auto_186861 - PLACE
      ?auto_186859 - HOIST
      ?auto_186856 - SURFACE
      ?auto_186857 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186860 ?auto_186858 ) ( SURFACE-AT ?auto_186851 ?auto_186858 ) ( CLEAR ?auto_186851 ) ( IS-CRATE ?auto_186855 ) ( not ( = ?auto_186851 ?auto_186855 ) ) ( AVAILABLE ?auto_186860 ) ( ON ?auto_186851 ?auto_186854 ) ( not ( = ?auto_186854 ?auto_186851 ) ) ( not ( = ?auto_186854 ?auto_186855 ) ) ( not ( = ?auto_186861 ?auto_186858 ) ) ( HOIST-AT ?auto_186859 ?auto_186861 ) ( not ( = ?auto_186860 ?auto_186859 ) ) ( AVAILABLE ?auto_186859 ) ( SURFACE-AT ?auto_186855 ?auto_186861 ) ( ON ?auto_186855 ?auto_186856 ) ( CLEAR ?auto_186855 ) ( not ( = ?auto_186851 ?auto_186856 ) ) ( not ( = ?auto_186855 ?auto_186856 ) ) ( not ( = ?auto_186854 ?auto_186856 ) ) ( TRUCK-AT ?auto_186857 ?auto_186858 ) ( ON ?auto_186853 ?auto_186852 ) ( ON ?auto_186854 ?auto_186853 ) ( not ( = ?auto_186852 ?auto_186853 ) ) ( not ( = ?auto_186852 ?auto_186854 ) ) ( not ( = ?auto_186852 ?auto_186851 ) ) ( not ( = ?auto_186852 ?auto_186855 ) ) ( not ( = ?auto_186852 ?auto_186856 ) ) ( not ( = ?auto_186853 ?auto_186854 ) ) ( not ( = ?auto_186853 ?auto_186851 ) ) ( not ( = ?auto_186853 ?auto_186855 ) ) ( not ( = ?auto_186853 ?auto_186856 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186854 ?auto_186851 ?auto_186855 )
      ( MAKE-4CRATE-VERIFY ?auto_186852 ?auto_186853 ?auto_186854 ?auto_186851 ?auto_186855 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_186891 - SURFACE
      ?auto_186892 - SURFACE
      ?auto_186893 - SURFACE
      ?auto_186890 - SURFACE
      ?auto_186894 - SURFACE
    )
    :vars
    (
      ?auto_186897 - HOIST
      ?auto_186900 - PLACE
      ?auto_186895 - PLACE
      ?auto_186898 - HOIST
      ?auto_186899 - SURFACE
      ?auto_186896 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186897 ?auto_186900 ) ( IS-CRATE ?auto_186894 ) ( not ( = ?auto_186890 ?auto_186894 ) ) ( not ( = ?auto_186893 ?auto_186890 ) ) ( not ( = ?auto_186893 ?auto_186894 ) ) ( not ( = ?auto_186895 ?auto_186900 ) ) ( HOIST-AT ?auto_186898 ?auto_186895 ) ( not ( = ?auto_186897 ?auto_186898 ) ) ( AVAILABLE ?auto_186898 ) ( SURFACE-AT ?auto_186894 ?auto_186895 ) ( ON ?auto_186894 ?auto_186899 ) ( CLEAR ?auto_186894 ) ( not ( = ?auto_186890 ?auto_186899 ) ) ( not ( = ?auto_186894 ?auto_186899 ) ) ( not ( = ?auto_186893 ?auto_186899 ) ) ( TRUCK-AT ?auto_186896 ?auto_186900 ) ( SURFACE-AT ?auto_186893 ?auto_186900 ) ( CLEAR ?auto_186893 ) ( LIFTING ?auto_186897 ?auto_186890 ) ( IS-CRATE ?auto_186890 ) ( ON ?auto_186892 ?auto_186891 ) ( ON ?auto_186893 ?auto_186892 ) ( not ( = ?auto_186891 ?auto_186892 ) ) ( not ( = ?auto_186891 ?auto_186893 ) ) ( not ( = ?auto_186891 ?auto_186890 ) ) ( not ( = ?auto_186891 ?auto_186894 ) ) ( not ( = ?auto_186891 ?auto_186899 ) ) ( not ( = ?auto_186892 ?auto_186893 ) ) ( not ( = ?auto_186892 ?auto_186890 ) ) ( not ( = ?auto_186892 ?auto_186894 ) ) ( not ( = ?auto_186892 ?auto_186899 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186893 ?auto_186890 ?auto_186894 )
      ( MAKE-4CRATE-VERIFY ?auto_186891 ?auto_186892 ?auto_186893 ?auto_186890 ?auto_186894 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_186930 - SURFACE
      ?auto_186931 - SURFACE
      ?auto_186932 - SURFACE
      ?auto_186929 - SURFACE
      ?auto_186933 - SURFACE
    )
    :vars
    (
      ?auto_186936 - HOIST
      ?auto_186939 - PLACE
      ?auto_186935 - PLACE
      ?auto_186937 - HOIST
      ?auto_186938 - SURFACE
      ?auto_186934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186936 ?auto_186939 ) ( IS-CRATE ?auto_186933 ) ( not ( = ?auto_186929 ?auto_186933 ) ) ( not ( = ?auto_186932 ?auto_186929 ) ) ( not ( = ?auto_186932 ?auto_186933 ) ) ( not ( = ?auto_186935 ?auto_186939 ) ) ( HOIST-AT ?auto_186937 ?auto_186935 ) ( not ( = ?auto_186936 ?auto_186937 ) ) ( AVAILABLE ?auto_186937 ) ( SURFACE-AT ?auto_186933 ?auto_186935 ) ( ON ?auto_186933 ?auto_186938 ) ( CLEAR ?auto_186933 ) ( not ( = ?auto_186929 ?auto_186938 ) ) ( not ( = ?auto_186933 ?auto_186938 ) ) ( not ( = ?auto_186932 ?auto_186938 ) ) ( TRUCK-AT ?auto_186934 ?auto_186939 ) ( SURFACE-AT ?auto_186932 ?auto_186939 ) ( CLEAR ?auto_186932 ) ( IS-CRATE ?auto_186929 ) ( AVAILABLE ?auto_186936 ) ( IN ?auto_186929 ?auto_186934 ) ( ON ?auto_186931 ?auto_186930 ) ( ON ?auto_186932 ?auto_186931 ) ( not ( = ?auto_186930 ?auto_186931 ) ) ( not ( = ?auto_186930 ?auto_186932 ) ) ( not ( = ?auto_186930 ?auto_186929 ) ) ( not ( = ?auto_186930 ?auto_186933 ) ) ( not ( = ?auto_186930 ?auto_186938 ) ) ( not ( = ?auto_186931 ?auto_186932 ) ) ( not ( = ?auto_186931 ?auto_186929 ) ) ( not ( = ?auto_186931 ?auto_186933 ) ) ( not ( = ?auto_186931 ?auto_186938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186932 ?auto_186929 ?auto_186933 )
      ( MAKE-4CRATE-VERIFY ?auto_186930 ?auto_186931 ?auto_186932 ?auto_186929 ?auto_186933 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_187202 - SURFACE
      ?auto_187203 - SURFACE
    )
    :vars
    (
      ?auto_187208 - HOIST
      ?auto_187209 - PLACE
      ?auto_187204 - SURFACE
      ?auto_187210 - PLACE
      ?auto_187205 - HOIST
      ?auto_187206 - SURFACE
      ?auto_187207 - TRUCK
      ?auto_187211 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_187208 ?auto_187209 ) ( SURFACE-AT ?auto_187202 ?auto_187209 ) ( CLEAR ?auto_187202 ) ( IS-CRATE ?auto_187203 ) ( not ( = ?auto_187202 ?auto_187203 ) ) ( ON ?auto_187202 ?auto_187204 ) ( not ( = ?auto_187204 ?auto_187202 ) ) ( not ( = ?auto_187204 ?auto_187203 ) ) ( not ( = ?auto_187210 ?auto_187209 ) ) ( HOIST-AT ?auto_187205 ?auto_187210 ) ( not ( = ?auto_187208 ?auto_187205 ) ) ( AVAILABLE ?auto_187205 ) ( SURFACE-AT ?auto_187203 ?auto_187210 ) ( ON ?auto_187203 ?auto_187206 ) ( CLEAR ?auto_187203 ) ( not ( = ?auto_187202 ?auto_187206 ) ) ( not ( = ?auto_187203 ?auto_187206 ) ) ( not ( = ?auto_187204 ?auto_187206 ) ) ( TRUCK-AT ?auto_187207 ?auto_187209 ) ( LIFTING ?auto_187208 ?auto_187211 ) ( IS-CRATE ?auto_187211 ) ( not ( = ?auto_187202 ?auto_187211 ) ) ( not ( = ?auto_187203 ?auto_187211 ) ) ( not ( = ?auto_187204 ?auto_187211 ) ) ( not ( = ?auto_187206 ?auto_187211 ) ) )
    :subtasks
    ( ( !LOAD ?auto_187208 ?auto_187211 ?auto_187207 ?auto_187209 )
      ( MAKE-1CRATE ?auto_187202 ?auto_187203 )
      ( MAKE-1CRATE-VERIFY ?auto_187202 ?auto_187203 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_187589 - SURFACE
      ?auto_187590 - SURFACE
      ?auto_187591 - SURFACE
      ?auto_187588 - SURFACE
      ?auto_187592 - SURFACE
      ?auto_187593 - SURFACE
    )
    :vars
    (
      ?auto_187595 - HOIST
      ?auto_187594 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_187595 ?auto_187594 ) ( SURFACE-AT ?auto_187592 ?auto_187594 ) ( CLEAR ?auto_187592 ) ( LIFTING ?auto_187595 ?auto_187593 ) ( IS-CRATE ?auto_187593 ) ( not ( = ?auto_187592 ?auto_187593 ) ) ( ON ?auto_187590 ?auto_187589 ) ( ON ?auto_187591 ?auto_187590 ) ( ON ?auto_187588 ?auto_187591 ) ( ON ?auto_187592 ?auto_187588 ) ( not ( = ?auto_187589 ?auto_187590 ) ) ( not ( = ?auto_187589 ?auto_187591 ) ) ( not ( = ?auto_187589 ?auto_187588 ) ) ( not ( = ?auto_187589 ?auto_187592 ) ) ( not ( = ?auto_187589 ?auto_187593 ) ) ( not ( = ?auto_187590 ?auto_187591 ) ) ( not ( = ?auto_187590 ?auto_187588 ) ) ( not ( = ?auto_187590 ?auto_187592 ) ) ( not ( = ?auto_187590 ?auto_187593 ) ) ( not ( = ?auto_187591 ?auto_187588 ) ) ( not ( = ?auto_187591 ?auto_187592 ) ) ( not ( = ?auto_187591 ?auto_187593 ) ) ( not ( = ?auto_187588 ?auto_187592 ) ) ( not ( = ?auto_187588 ?auto_187593 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_187592 ?auto_187593 )
      ( MAKE-5CRATE-VERIFY ?auto_187589 ?auto_187590 ?auto_187591 ?auto_187588 ?auto_187592 ?auto_187593 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_187623 - SURFACE
      ?auto_187624 - SURFACE
      ?auto_187625 - SURFACE
      ?auto_187622 - SURFACE
      ?auto_187626 - SURFACE
      ?auto_187627 - SURFACE
    )
    :vars
    (
      ?auto_187630 - HOIST
      ?auto_187629 - PLACE
      ?auto_187628 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_187630 ?auto_187629 ) ( SURFACE-AT ?auto_187626 ?auto_187629 ) ( CLEAR ?auto_187626 ) ( IS-CRATE ?auto_187627 ) ( not ( = ?auto_187626 ?auto_187627 ) ) ( TRUCK-AT ?auto_187628 ?auto_187629 ) ( AVAILABLE ?auto_187630 ) ( IN ?auto_187627 ?auto_187628 ) ( ON ?auto_187626 ?auto_187622 ) ( not ( = ?auto_187622 ?auto_187626 ) ) ( not ( = ?auto_187622 ?auto_187627 ) ) ( ON ?auto_187624 ?auto_187623 ) ( ON ?auto_187625 ?auto_187624 ) ( ON ?auto_187622 ?auto_187625 ) ( not ( = ?auto_187623 ?auto_187624 ) ) ( not ( = ?auto_187623 ?auto_187625 ) ) ( not ( = ?auto_187623 ?auto_187622 ) ) ( not ( = ?auto_187623 ?auto_187626 ) ) ( not ( = ?auto_187623 ?auto_187627 ) ) ( not ( = ?auto_187624 ?auto_187625 ) ) ( not ( = ?auto_187624 ?auto_187622 ) ) ( not ( = ?auto_187624 ?auto_187626 ) ) ( not ( = ?auto_187624 ?auto_187627 ) ) ( not ( = ?auto_187625 ?auto_187622 ) ) ( not ( = ?auto_187625 ?auto_187626 ) ) ( not ( = ?auto_187625 ?auto_187627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_187622 ?auto_187626 ?auto_187627 )
      ( MAKE-5CRATE-VERIFY ?auto_187623 ?auto_187624 ?auto_187625 ?auto_187622 ?auto_187626 ?auto_187627 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_187663 - SURFACE
      ?auto_187664 - SURFACE
      ?auto_187665 - SURFACE
      ?auto_187662 - SURFACE
      ?auto_187666 - SURFACE
      ?auto_187667 - SURFACE
    )
    :vars
    (
      ?auto_187671 - HOIST
      ?auto_187669 - PLACE
      ?auto_187670 - TRUCK
      ?auto_187668 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_187671 ?auto_187669 ) ( SURFACE-AT ?auto_187666 ?auto_187669 ) ( CLEAR ?auto_187666 ) ( IS-CRATE ?auto_187667 ) ( not ( = ?auto_187666 ?auto_187667 ) ) ( AVAILABLE ?auto_187671 ) ( IN ?auto_187667 ?auto_187670 ) ( ON ?auto_187666 ?auto_187662 ) ( not ( = ?auto_187662 ?auto_187666 ) ) ( not ( = ?auto_187662 ?auto_187667 ) ) ( TRUCK-AT ?auto_187670 ?auto_187668 ) ( not ( = ?auto_187668 ?auto_187669 ) ) ( ON ?auto_187664 ?auto_187663 ) ( ON ?auto_187665 ?auto_187664 ) ( ON ?auto_187662 ?auto_187665 ) ( not ( = ?auto_187663 ?auto_187664 ) ) ( not ( = ?auto_187663 ?auto_187665 ) ) ( not ( = ?auto_187663 ?auto_187662 ) ) ( not ( = ?auto_187663 ?auto_187666 ) ) ( not ( = ?auto_187663 ?auto_187667 ) ) ( not ( = ?auto_187664 ?auto_187665 ) ) ( not ( = ?auto_187664 ?auto_187662 ) ) ( not ( = ?auto_187664 ?auto_187666 ) ) ( not ( = ?auto_187664 ?auto_187667 ) ) ( not ( = ?auto_187665 ?auto_187662 ) ) ( not ( = ?auto_187665 ?auto_187666 ) ) ( not ( = ?auto_187665 ?auto_187667 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_187662 ?auto_187666 ?auto_187667 )
      ( MAKE-5CRATE-VERIFY ?auto_187663 ?auto_187664 ?auto_187665 ?auto_187662 ?auto_187666 ?auto_187667 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_187708 - SURFACE
      ?auto_187709 - SURFACE
      ?auto_187710 - SURFACE
      ?auto_187707 - SURFACE
      ?auto_187711 - SURFACE
      ?auto_187712 - SURFACE
    )
    :vars
    (
      ?auto_187715 - HOIST
      ?auto_187716 - PLACE
      ?auto_187714 - TRUCK
      ?auto_187713 - PLACE
      ?auto_187717 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_187715 ?auto_187716 ) ( SURFACE-AT ?auto_187711 ?auto_187716 ) ( CLEAR ?auto_187711 ) ( IS-CRATE ?auto_187712 ) ( not ( = ?auto_187711 ?auto_187712 ) ) ( AVAILABLE ?auto_187715 ) ( ON ?auto_187711 ?auto_187707 ) ( not ( = ?auto_187707 ?auto_187711 ) ) ( not ( = ?auto_187707 ?auto_187712 ) ) ( TRUCK-AT ?auto_187714 ?auto_187713 ) ( not ( = ?auto_187713 ?auto_187716 ) ) ( HOIST-AT ?auto_187717 ?auto_187713 ) ( LIFTING ?auto_187717 ?auto_187712 ) ( not ( = ?auto_187715 ?auto_187717 ) ) ( ON ?auto_187709 ?auto_187708 ) ( ON ?auto_187710 ?auto_187709 ) ( ON ?auto_187707 ?auto_187710 ) ( not ( = ?auto_187708 ?auto_187709 ) ) ( not ( = ?auto_187708 ?auto_187710 ) ) ( not ( = ?auto_187708 ?auto_187707 ) ) ( not ( = ?auto_187708 ?auto_187711 ) ) ( not ( = ?auto_187708 ?auto_187712 ) ) ( not ( = ?auto_187709 ?auto_187710 ) ) ( not ( = ?auto_187709 ?auto_187707 ) ) ( not ( = ?auto_187709 ?auto_187711 ) ) ( not ( = ?auto_187709 ?auto_187712 ) ) ( not ( = ?auto_187710 ?auto_187707 ) ) ( not ( = ?auto_187710 ?auto_187711 ) ) ( not ( = ?auto_187710 ?auto_187712 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_187707 ?auto_187711 ?auto_187712 )
      ( MAKE-5CRATE-VERIFY ?auto_187708 ?auto_187709 ?auto_187710 ?auto_187707 ?auto_187711 ?auto_187712 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_187758 - SURFACE
      ?auto_187759 - SURFACE
      ?auto_187760 - SURFACE
      ?auto_187757 - SURFACE
      ?auto_187761 - SURFACE
      ?auto_187762 - SURFACE
    )
    :vars
    (
      ?auto_187767 - HOIST
      ?auto_187763 - PLACE
      ?auto_187764 - TRUCK
      ?auto_187766 - PLACE
      ?auto_187765 - HOIST
      ?auto_187768 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_187767 ?auto_187763 ) ( SURFACE-AT ?auto_187761 ?auto_187763 ) ( CLEAR ?auto_187761 ) ( IS-CRATE ?auto_187762 ) ( not ( = ?auto_187761 ?auto_187762 ) ) ( AVAILABLE ?auto_187767 ) ( ON ?auto_187761 ?auto_187757 ) ( not ( = ?auto_187757 ?auto_187761 ) ) ( not ( = ?auto_187757 ?auto_187762 ) ) ( TRUCK-AT ?auto_187764 ?auto_187766 ) ( not ( = ?auto_187766 ?auto_187763 ) ) ( HOIST-AT ?auto_187765 ?auto_187766 ) ( not ( = ?auto_187767 ?auto_187765 ) ) ( AVAILABLE ?auto_187765 ) ( SURFACE-AT ?auto_187762 ?auto_187766 ) ( ON ?auto_187762 ?auto_187768 ) ( CLEAR ?auto_187762 ) ( not ( = ?auto_187761 ?auto_187768 ) ) ( not ( = ?auto_187762 ?auto_187768 ) ) ( not ( = ?auto_187757 ?auto_187768 ) ) ( ON ?auto_187759 ?auto_187758 ) ( ON ?auto_187760 ?auto_187759 ) ( ON ?auto_187757 ?auto_187760 ) ( not ( = ?auto_187758 ?auto_187759 ) ) ( not ( = ?auto_187758 ?auto_187760 ) ) ( not ( = ?auto_187758 ?auto_187757 ) ) ( not ( = ?auto_187758 ?auto_187761 ) ) ( not ( = ?auto_187758 ?auto_187762 ) ) ( not ( = ?auto_187758 ?auto_187768 ) ) ( not ( = ?auto_187759 ?auto_187760 ) ) ( not ( = ?auto_187759 ?auto_187757 ) ) ( not ( = ?auto_187759 ?auto_187761 ) ) ( not ( = ?auto_187759 ?auto_187762 ) ) ( not ( = ?auto_187759 ?auto_187768 ) ) ( not ( = ?auto_187760 ?auto_187757 ) ) ( not ( = ?auto_187760 ?auto_187761 ) ) ( not ( = ?auto_187760 ?auto_187762 ) ) ( not ( = ?auto_187760 ?auto_187768 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_187757 ?auto_187761 ?auto_187762 )
      ( MAKE-5CRATE-VERIFY ?auto_187758 ?auto_187759 ?auto_187760 ?auto_187757 ?auto_187761 ?auto_187762 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_187809 - SURFACE
      ?auto_187810 - SURFACE
      ?auto_187811 - SURFACE
      ?auto_187808 - SURFACE
      ?auto_187812 - SURFACE
      ?auto_187813 - SURFACE
    )
    :vars
    (
      ?auto_187814 - HOIST
      ?auto_187815 - PLACE
      ?auto_187819 - PLACE
      ?auto_187816 - HOIST
      ?auto_187817 - SURFACE
      ?auto_187818 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_187814 ?auto_187815 ) ( SURFACE-AT ?auto_187812 ?auto_187815 ) ( CLEAR ?auto_187812 ) ( IS-CRATE ?auto_187813 ) ( not ( = ?auto_187812 ?auto_187813 ) ) ( AVAILABLE ?auto_187814 ) ( ON ?auto_187812 ?auto_187808 ) ( not ( = ?auto_187808 ?auto_187812 ) ) ( not ( = ?auto_187808 ?auto_187813 ) ) ( not ( = ?auto_187819 ?auto_187815 ) ) ( HOIST-AT ?auto_187816 ?auto_187819 ) ( not ( = ?auto_187814 ?auto_187816 ) ) ( AVAILABLE ?auto_187816 ) ( SURFACE-AT ?auto_187813 ?auto_187819 ) ( ON ?auto_187813 ?auto_187817 ) ( CLEAR ?auto_187813 ) ( not ( = ?auto_187812 ?auto_187817 ) ) ( not ( = ?auto_187813 ?auto_187817 ) ) ( not ( = ?auto_187808 ?auto_187817 ) ) ( TRUCK-AT ?auto_187818 ?auto_187815 ) ( ON ?auto_187810 ?auto_187809 ) ( ON ?auto_187811 ?auto_187810 ) ( ON ?auto_187808 ?auto_187811 ) ( not ( = ?auto_187809 ?auto_187810 ) ) ( not ( = ?auto_187809 ?auto_187811 ) ) ( not ( = ?auto_187809 ?auto_187808 ) ) ( not ( = ?auto_187809 ?auto_187812 ) ) ( not ( = ?auto_187809 ?auto_187813 ) ) ( not ( = ?auto_187809 ?auto_187817 ) ) ( not ( = ?auto_187810 ?auto_187811 ) ) ( not ( = ?auto_187810 ?auto_187808 ) ) ( not ( = ?auto_187810 ?auto_187812 ) ) ( not ( = ?auto_187810 ?auto_187813 ) ) ( not ( = ?auto_187810 ?auto_187817 ) ) ( not ( = ?auto_187811 ?auto_187808 ) ) ( not ( = ?auto_187811 ?auto_187812 ) ) ( not ( = ?auto_187811 ?auto_187813 ) ) ( not ( = ?auto_187811 ?auto_187817 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_187808 ?auto_187812 ?auto_187813 )
      ( MAKE-5CRATE-VERIFY ?auto_187809 ?auto_187810 ?auto_187811 ?auto_187808 ?auto_187812 ?auto_187813 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_187860 - SURFACE
      ?auto_187861 - SURFACE
      ?auto_187862 - SURFACE
      ?auto_187859 - SURFACE
      ?auto_187863 - SURFACE
      ?auto_187864 - SURFACE
    )
    :vars
    (
      ?auto_187865 - HOIST
      ?auto_187866 - PLACE
      ?auto_187868 - PLACE
      ?auto_187870 - HOIST
      ?auto_187869 - SURFACE
      ?auto_187867 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_187865 ?auto_187866 ) ( IS-CRATE ?auto_187864 ) ( not ( = ?auto_187863 ?auto_187864 ) ) ( not ( = ?auto_187859 ?auto_187863 ) ) ( not ( = ?auto_187859 ?auto_187864 ) ) ( not ( = ?auto_187868 ?auto_187866 ) ) ( HOIST-AT ?auto_187870 ?auto_187868 ) ( not ( = ?auto_187865 ?auto_187870 ) ) ( AVAILABLE ?auto_187870 ) ( SURFACE-AT ?auto_187864 ?auto_187868 ) ( ON ?auto_187864 ?auto_187869 ) ( CLEAR ?auto_187864 ) ( not ( = ?auto_187863 ?auto_187869 ) ) ( not ( = ?auto_187864 ?auto_187869 ) ) ( not ( = ?auto_187859 ?auto_187869 ) ) ( TRUCK-AT ?auto_187867 ?auto_187866 ) ( SURFACE-AT ?auto_187859 ?auto_187866 ) ( CLEAR ?auto_187859 ) ( LIFTING ?auto_187865 ?auto_187863 ) ( IS-CRATE ?auto_187863 ) ( ON ?auto_187861 ?auto_187860 ) ( ON ?auto_187862 ?auto_187861 ) ( ON ?auto_187859 ?auto_187862 ) ( not ( = ?auto_187860 ?auto_187861 ) ) ( not ( = ?auto_187860 ?auto_187862 ) ) ( not ( = ?auto_187860 ?auto_187859 ) ) ( not ( = ?auto_187860 ?auto_187863 ) ) ( not ( = ?auto_187860 ?auto_187864 ) ) ( not ( = ?auto_187860 ?auto_187869 ) ) ( not ( = ?auto_187861 ?auto_187862 ) ) ( not ( = ?auto_187861 ?auto_187859 ) ) ( not ( = ?auto_187861 ?auto_187863 ) ) ( not ( = ?auto_187861 ?auto_187864 ) ) ( not ( = ?auto_187861 ?auto_187869 ) ) ( not ( = ?auto_187862 ?auto_187859 ) ) ( not ( = ?auto_187862 ?auto_187863 ) ) ( not ( = ?auto_187862 ?auto_187864 ) ) ( not ( = ?auto_187862 ?auto_187869 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_187859 ?auto_187863 ?auto_187864 )
      ( MAKE-5CRATE-VERIFY ?auto_187860 ?auto_187861 ?auto_187862 ?auto_187859 ?auto_187863 ?auto_187864 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_187911 - SURFACE
      ?auto_187912 - SURFACE
      ?auto_187913 - SURFACE
      ?auto_187910 - SURFACE
      ?auto_187914 - SURFACE
      ?auto_187915 - SURFACE
    )
    :vars
    (
      ?auto_187921 - HOIST
      ?auto_187917 - PLACE
      ?auto_187920 - PLACE
      ?auto_187918 - HOIST
      ?auto_187919 - SURFACE
      ?auto_187916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_187921 ?auto_187917 ) ( IS-CRATE ?auto_187915 ) ( not ( = ?auto_187914 ?auto_187915 ) ) ( not ( = ?auto_187910 ?auto_187914 ) ) ( not ( = ?auto_187910 ?auto_187915 ) ) ( not ( = ?auto_187920 ?auto_187917 ) ) ( HOIST-AT ?auto_187918 ?auto_187920 ) ( not ( = ?auto_187921 ?auto_187918 ) ) ( AVAILABLE ?auto_187918 ) ( SURFACE-AT ?auto_187915 ?auto_187920 ) ( ON ?auto_187915 ?auto_187919 ) ( CLEAR ?auto_187915 ) ( not ( = ?auto_187914 ?auto_187919 ) ) ( not ( = ?auto_187915 ?auto_187919 ) ) ( not ( = ?auto_187910 ?auto_187919 ) ) ( TRUCK-AT ?auto_187916 ?auto_187917 ) ( SURFACE-AT ?auto_187910 ?auto_187917 ) ( CLEAR ?auto_187910 ) ( IS-CRATE ?auto_187914 ) ( AVAILABLE ?auto_187921 ) ( IN ?auto_187914 ?auto_187916 ) ( ON ?auto_187912 ?auto_187911 ) ( ON ?auto_187913 ?auto_187912 ) ( ON ?auto_187910 ?auto_187913 ) ( not ( = ?auto_187911 ?auto_187912 ) ) ( not ( = ?auto_187911 ?auto_187913 ) ) ( not ( = ?auto_187911 ?auto_187910 ) ) ( not ( = ?auto_187911 ?auto_187914 ) ) ( not ( = ?auto_187911 ?auto_187915 ) ) ( not ( = ?auto_187911 ?auto_187919 ) ) ( not ( = ?auto_187912 ?auto_187913 ) ) ( not ( = ?auto_187912 ?auto_187910 ) ) ( not ( = ?auto_187912 ?auto_187914 ) ) ( not ( = ?auto_187912 ?auto_187915 ) ) ( not ( = ?auto_187912 ?auto_187919 ) ) ( not ( = ?auto_187913 ?auto_187910 ) ) ( not ( = ?auto_187913 ?auto_187914 ) ) ( not ( = ?auto_187913 ?auto_187915 ) ) ( not ( = ?auto_187913 ?auto_187919 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_187910 ?auto_187914 ?auto_187915 )
      ( MAKE-5CRATE-VERIFY ?auto_187911 ?auto_187912 ?auto_187913 ?auto_187910 ?auto_187914 ?auto_187915 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189120 - SURFACE
      ?auto_189121 - SURFACE
      ?auto_189122 - SURFACE
      ?auto_189119 - SURFACE
      ?auto_189123 - SURFACE
      ?auto_189125 - SURFACE
      ?auto_189124 - SURFACE
    )
    :vars
    (
      ?auto_189127 - HOIST
      ?auto_189126 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_189127 ?auto_189126 ) ( SURFACE-AT ?auto_189125 ?auto_189126 ) ( CLEAR ?auto_189125 ) ( LIFTING ?auto_189127 ?auto_189124 ) ( IS-CRATE ?auto_189124 ) ( not ( = ?auto_189125 ?auto_189124 ) ) ( ON ?auto_189121 ?auto_189120 ) ( ON ?auto_189122 ?auto_189121 ) ( ON ?auto_189119 ?auto_189122 ) ( ON ?auto_189123 ?auto_189119 ) ( ON ?auto_189125 ?auto_189123 ) ( not ( = ?auto_189120 ?auto_189121 ) ) ( not ( = ?auto_189120 ?auto_189122 ) ) ( not ( = ?auto_189120 ?auto_189119 ) ) ( not ( = ?auto_189120 ?auto_189123 ) ) ( not ( = ?auto_189120 ?auto_189125 ) ) ( not ( = ?auto_189120 ?auto_189124 ) ) ( not ( = ?auto_189121 ?auto_189122 ) ) ( not ( = ?auto_189121 ?auto_189119 ) ) ( not ( = ?auto_189121 ?auto_189123 ) ) ( not ( = ?auto_189121 ?auto_189125 ) ) ( not ( = ?auto_189121 ?auto_189124 ) ) ( not ( = ?auto_189122 ?auto_189119 ) ) ( not ( = ?auto_189122 ?auto_189123 ) ) ( not ( = ?auto_189122 ?auto_189125 ) ) ( not ( = ?auto_189122 ?auto_189124 ) ) ( not ( = ?auto_189119 ?auto_189123 ) ) ( not ( = ?auto_189119 ?auto_189125 ) ) ( not ( = ?auto_189119 ?auto_189124 ) ) ( not ( = ?auto_189123 ?auto_189125 ) ) ( not ( = ?auto_189123 ?auto_189124 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_189125 ?auto_189124 )
      ( MAKE-6CRATE-VERIFY ?auto_189120 ?auto_189121 ?auto_189122 ?auto_189119 ?auto_189123 ?auto_189125 ?auto_189124 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189164 - SURFACE
      ?auto_189165 - SURFACE
      ?auto_189166 - SURFACE
      ?auto_189163 - SURFACE
      ?auto_189167 - SURFACE
      ?auto_189169 - SURFACE
      ?auto_189168 - SURFACE
    )
    :vars
    (
      ?auto_189171 - HOIST
      ?auto_189170 - PLACE
      ?auto_189172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189171 ?auto_189170 ) ( SURFACE-AT ?auto_189169 ?auto_189170 ) ( CLEAR ?auto_189169 ) ( IS-CRATE ?auto_189168 ) ( not ( = ?auto_189169 ?auto_189168 ) ) ( TRUCK-AT ?auto_189172 ?auto_189170 ) ( AVAILABLE ?auto_189171 ) ( IN ?auto_189168 ?auto_189172 ) ( ON ?auto_189169 ?auto_189167 ) ( not ( = ?auto_189167 ?auto_189169 ) ) ( not ( = ?auto_189167 ?auto_189168 ) ) ( ON ?auto_189165 ?auto_189164 ) ( ON ?auto_189166 ?auto_189165 ) ( ON ?auto_189163 ?auto_189166 ) ( ON ?auto_189167 ?auto_189163 ) ( not ( = ?auto_189164 ?auto_189165 ) ) ( not ( = ?auto_189164 ?auto_189166 ) ) ( not ( = ?auto_189164 ?auto_189163 ) ) ( not ( = ?auto_189164 ?auto_189167 ) ) ( not ( = ?auto_189164 ?auto_189169 ) ) ( not ( = ?auto_189164 ?auto_189168 ) ) ( not ( = ?auto_189165 ?auto_189166 ) ) ( not ( = ?auto_189165 ?auto_189163 ) ) ( not ( = ?auto_189165 ?auto_189167 ) ) ( not ( = ?auto_189165 ?auto_189169 ) ) ( not ( = ?auto_189165 ?auto_189168 ) ) ( not ( = ?auto_189166 ?auto_189163 ) ) ( not ( = ?auto_189166 ?auto_189167 ) ) ( not ( = ?auto_189166 ?auto_189169 ) ) ( not ( = ?auto_189166 ?auto_189168 ) ) ( not ( = ?auto_189163 ?auto_189167 ) ) ( not ( = ?auto_189163 ?auto_189169 ) ) ( not ( = ?auto_189163 ?auto_189168 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189167 ?auto_189169 ?auto_189168 )
      ( MAKE-6CRATE-VERIFY ?auto_189164 ?auto_189165 ?auto_189166 ?auto_189163 ?auto_189167 ?auto_189169 ?auto_189168 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189215 - SURFACE
      ?auto_189216 - SURFACE
      ?auto_189217 - SURFACE
      ?auto_189214 - SURFACE
      ?auto_189218 - SURFACE
      ?auto_189220 - SURFACE
      ?auto_189219 - SURFACE
    )
    :vars
    (
      ?auto_189222 - HOIST
      ?auto_189224 - PLACE
      ?auto_189221 - TRUCK
      ?auto_189223 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_189222 ?auto_189224 ) ( SURFACE-AT ?auto_189220 ?auto_189224 ) ( CLEAR ?auto_189220 ) ( IS-CRATE ?auto_189219 ) ( not ( = ?auto_189220 ?auto_189219 ) ) ( AVAILABLE ?auto_189222 ) ( IN ?auto_189219 ?auto_189221 ) ( ON ?auto_189220 ?auto_189218 ) ( not ( = ?auto_189218 ?auto_189220 ) ) ( not ( = ?auto_189218 ?auto_189219 ) ) ( TRUCK-AT ?auto_189221 ?auto_189223 ) ( not ( = ?auto_189223 ?auto_189224 ) ) ( ON ?auto_189216 ?auto_189215 ) ( ON ?auto_189217 ?auto_189216 ) ( ON ?auto_189214 ?auto_189217 ) ( ON ?auto_189218 ?auto_189214 ) ( not ( = ?auto_189215 ?auto_189216 ) ) ( not ( = ?auto_189215 ?auto_189217 ) ) ( not ( = ?auto_189215 ?auto_189214 ) ) ( not ( = ?auto_189215 ?auto_189218 ) ) ( not ( = ?auto_189215 ?auto_189220 ) ) ( not ( = ?auto_189215 ?auto_189219 ) ) ( not ( = ?auto_189216 ?auto_189217 ) ) ( not ( = ?auto_189216 ?auto_189214 ) ) ( not ( = ?auto_189216 ?auto_189218 ) ) ( not ( = ?auto_189216 ?auto_189220 ) ) ( not ( = ?auto_189216 ?auto_189219 ) ) ( not ( = ?auto_189217 ?auto_189214 ) ) ( not ( = ?auto_189217 ?auto_189218 ) ) ( not ( = ?auto_189217 ?auto_189220 ) ) ( not ( = ?auto_189217 ?auto_189219 ) ) ( not ( = ?auto_189214 ?auto_189218 ) ) ( not ( = ?auto_189214 ?auto_189220 ) ) ( not ( = ?auto_189214 ?auto_189219 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189218 ?auto_189220 ?auto_189219 )
      ( MAKE-6CRATE-VERIFY ?auto_189215 ?auto_189216 ?auto_189217 ?auto_189214 ?auto_189218 ?auto_189220 ?auto_189219 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189272 - SURFACE
      ?auto_189273 - SURFACE
      ?auto_189274 - SURFACE
      ?auto_189271 - SURFACE
      ?auto_189275 - SURFACE
      ?auto_189277 - SURFACE
      ?auto_189276 - SURFACE
    )
    :vars
    (
      ?auto_189281 - HOIST
      ?auto_189280 - PLACE
      ?auto_189282 - TRUCK
      ?auto_189278 - PLACE
      ?auto_189279 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_189281 ?auto_189280 ) ( SURFACE-AT ?auto_189277 ?auto_189280 ) ( CLEAR ?auto_189277 ) ( IS-CRATE ?auto_189276 ) ( not ( = ?auto_189277 ?auto_189276 ) ) ( AVAILABLE ?auto_189281 ) ( ON ?auto_189277 ?auto_189275 ) ( not ( = ?auto_189275 ?auto_189277 ) ) ( not ( = ?auto_189275 ?auto_189276 ) ) ( TRUCK-AT ?auto_189282 ?auto_189278 ) ( not ( = ?auto_189278 ?auto_189280 ) ) ( HOIST-AT ?auto_189279 ?auto_189278 ) ( LIFTING ?auto_189279 ?auto_189276 ) ( not ( = ?auto_189281 ?auto_189279 ) ) ( ON ?auto_189273 ?auto_189272 ) ( ON ?auto_189274 ?auto_189273 ) ( ON ?auto_189271 ?auto_189274 ) ( ON ?auto_189275 ?auto_189271 ) ( not ( = ?auto_189272 ?auto_189273 ) ) ( not ( = ?auto_189272 ?auto_189274 ) ) ( not ( = ?auto_189272 ?auto_189271 ) ) ( not ( = ?auto_189272 ?auto_189275 ) ) ( not ( = ?auto_189272 ?auto_189277 ) ) ( not ( = ?auto_189272 ?auto_189276 ) ) ( not ( = ?auto_189273 ?auto_189274 ) ) ( not ( = ?auto_189273 ?auto_189271 ) ) ( not ( = ?auto_189273 ?auto_189275 ) ) ( not ( = ?auto_189273 ?auto_189277 ) ) ( not ( = ?auto_189273 ?auto_189276 ) ) ( not ( = ?auto_189274 ?auto_189271 ) ) ( not ( = ?auto_189274 ?auto_189275 ) ) ( not ( = ?auto_189274 ?auto_189277 ) ) ( not ( = ?auto_189274 ?auto_189276 ) ) ( not ( = ?auto_189271 ?auto_189275 ) ) ( not ( = ?auto_189271 ?auto_189277 ) ) ( not ( = ?auto_189271 ?auto_189276 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189275 ?auto_189277 ?auto_189276 )
      ( MAKE-6CRATE-VERIFY ?auto_189272 ?auto_189273 ?auto_189274 ?auto_189271 ?auto_189275 ?auto_189277 ?auto_189276 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189335 - SURFACE
      ?auto_189336 - SURFACE
      ?auto_189337 - SURFACE
      ?auto_189334 - SURFACE
      ?auto_189338 - SURFACE
      ?auto_189340 - SURFACE
      ?auto_189339 - SURFACE
    )
    :vars
    (
      ?auto_189341 - HOIST
      ?auto_189342 - PLACE
      ?auto_189344 - TRUCK
      ?auto_189345 - PLACE
      ?auto_189346 - HOIST
      ?auto_189343 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_189341 ?auto_189342 ) ( SURFACE-AT ?auto_189340 ?auto_189342 ) ( CLEAR ?auto_189340 ) ( IS-CRATE ?auto_189339 ) ( not ( = ?auto_189340 ?auto_189339 ) ) ( AVAILABLE ?auto_189341 ) ( ON ?auto_189340 ?auto_189338 ) ( not ( = ?auto_189338 ?auto_189340 ) ) ( not ( = ?auto_189338 ?auto_189339 ) ) ( TRUCK-AT ?auto_189344 ?auto_189345 ) ( not ( = ?auto_189345 ?auto_189342 ) ) ( HOIST-AT ?auto_189346 ?auto_189345 ) ( not ( = ?auto_189341 ?auto_189346 ) ) ( AVAILABLE ?auto_189346 ) ( SURFACE-AT ?auto_189339 ?auto_189345 ) ( ON ?auto_189339 ?auto_189343 ) ( CLEAR ?auto_189339 ) ( not ( = ?auto_189340 ?auto_189343 ) ) ( not ( = ?auto_189339 ?auto_189343 ) ) ( not ( = ?auto_189338 ?auto_189343 ) ) ( ON ?auto_189336 ?auto_189335 ) ( ON ?auto_189337 ?auto_189336 ) ( ON ?auto_189334 ?auto_189337 ) ( ON ?auto_189338 ?auto_189334 ) ( not ( = ?auto_189335 ?auto_189336 ) ) ( not ( = ?auto_189335 ?auto_189337 ) ) ( not ( = ?auto_189335 ?auto_189334 ) ) ( not ( = ?auto_189335 ?auto_189338 ) ) ( not ( = ?auto_189335 ?auto_189340 ) ) ( not ( = ?auto_189335 ?auto_189339 ) ) ( not ( = ?auto_189335 ?auto_189343 ) ) ( not ( = ?auto_189336 ?auto_189337 ) ) ( not ( = ?auto_189336 ?auto_189334 ) ) ( not ( = ?auto_189336 ?auto_189338 ) ) ( not ( = ?auto_189336 ?auto_189340 ) ) ( not ( = ?auto_189336 ?auto_189339 ) ) ( not ( = ?auto_189336 ?auto_189343 ) ) ( not ( = ?auto_189337 ?auto_189334 ) ) ( not ( = ?auto_189337 ?auto_189338 ) ) ( not ( = ?auto_189337 ?auto_189340 ) ) ( not ( = ?auto_189337 ?auto_189339 ) ) ( not ( = ?auto_189337 ?auto_189343 ) ) ( not ( = ?auto_189334 ?auto_189338 ) ) ( not ( = ?auto_189334 ?auto_189340 ) ) ( not ( = ?auto_189334 ?auto_189339 ) ) ( not ( = ?auto_189334 ?auto_189343 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189338 ?auto_189340 ?auto_189339 )
      ( MAKE-6CRATE-VERIFY ?auto_189335 ?auto_189336 ?auto_189337 ?auto_189334 ?auto_189338 ?auto_189340 ?auto_189339 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189399 - SURFACE
      ?auto_189400 - SURFACE
      ?auto_189401 - SURFACE
      ?auto_189398 - SURFACE
      ?auto_189402 - SURFACE
      ?auto_189404 - SURFACE
      ?auto_189403 - SURFACE
    )
    :vars
    (
      ?auto_189406 - HOIST
      ?auto_189408 - PLACE
      ?auto_189407 - PLACE
      ?auto_189410 - HOIST
      ?auto_189405 - SURFACE
      ?auto_189409 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189406 ?auto_189408 ) ( SURFACE-AT ?auto_189404 ?auto_189408 ) ( CLEAR ?auto_189404 ) ( IS-CRATE ?auto_189403 ) ( not ( = ?auto_189404 ?auto_189403 ) ) ( AVAILABLE ?auto_189406 ) ( ON ?auto_189404 ?auto_189402 ) ( not ( = ?auto_189402 ?auto_189404 ) ) ( not ( = ?auto_189402 ?auto_189403 ) ) ( not ( = ?auto_189407 ?auto_189408 ) ) ( HOIST-AT ?auto_189410 ?auto_189407 ) ( not ( = ?auto_189406 ?auto_189410 ) ) ( AVAILABLE ?auto_189410 ) ( SURFACE-AT ?auto_189403 ?auto_189407 ) ( ON ?auto_189403 ?auto_189405 ) ( CLEAR ?auto_189403 ) ( not ( = ?auto_189404 ?auto_189405 ) ) ( not ( = ?auto_189403 ?auto_189405 ) ) ( not ( = ?auto_189402 ?auto_189405 ) ) ( TRUCK-AT ?auto_189409 ?auto_189408 ) ( ON ?auto_189400 ?auto_189399 ) ( ON ?auto_189401 ?auto_189400 ) ( ON ?auto_189398 ?auto_189401 ) ( ON ?auto_189402 ?auto_189398 ) ( not ( = ?auto_189399 ?auto_189400 ) ) ( not ( = ?auto_189399 ?auto_189401 ) ) ( not ( = ?auto_189399 ?auto_189398 ) ) ( not ( = ?auto_189399 ?auto_189402 ) ) ( not ( = ?auto_189399 ?auto_189404 ) ) ( not ( = ?auto_189399 ?auto_189403 ) ) ( not ( = ?auto_189399 ?auto_189405 ) ) ( not ( = ?auto_189400 ?auto_189401 ) ) ( not ( = ?auto_189400 ?auto_189398 ) ) ( not ( = ?auto_189400 ?auto_189402 ) ) ( not ( = ?auto_189400 ?auto_189404 ) ) ( not ( = ?auto_189400 ?auto_189403 ) ) ( not ( = ?auto_189400 ?auto_189405 ) ) ( not ( = ?auto_189401 ?auto_189398 ) ) ( not ( = ?auto_189401 ?auto_189402 ) ) ( not ( = ?auto_189401 ?auto_189404 ) ) ( not ( = ?auto_189401 ?auto_189403 ) ) ( not ( = ?auto_189401 ?auto_189405 ) ) ( not ( = ?auto_189398 ?auto_189402 ) ) ( not ( = ?auto_189398 ?auto_189404 ) ) ( not ( = ?auto_189398 ?auto_189403 ) ) ( not ( = ?auto_189398 ?auto_189405 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189402 ?auto_189404 ?auto_189403 )
      ( MAKE-6CRATE-VERIFY ?auto_189399 ?auto_189400 ?auto_189401 ?auto_189398 ?auto_189402 ?auto_189404 ?auto_189403 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189463 - SURFACE
      ?auto_189464 - SURFACE
      ?auto_189465 - SURFACE
      ?auto_189462 - SURFACE
      ?auto_189466 - SURFACE
      ?auto_189468 - SURFACE
      ?auto_189467 - SURFACE
    )
    :vars
    (
      ?auto_189473 - HOIST
      ?auto_189474 - PLACE
      ?auto_189470 - PLACE
      ?auto_189472 - HOIST
      ?auto_189469 - SURFACE
      ?auto_189471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189473 ?auto_189474 ) ( IS-CRATE ?auto_189467 ) ( not ( = ?auto_189468 ?auto_189467 ) ) ( not ( = ?auto_189466 ?auto_189468 ) ) ( not ( = ?auto_189466 ?auto_189467 ) ) ( not ( = ?auto_189470 ?auto_189474 ) ) ( HOIST-AT ?auto_189472 ?auto_189470 ) ( not ( = ?auto_189473 ?auto_189472 ) ) ( AVAILABLE ?auto_189472 ) ( SURFACE-AT ?auto_189467 ?auto_189470 ) ( ON ?auto_189467 ?auto_189469 ) ( CLEAR ?auto_189467 ) ( not ( = ?auto_189468 ?auto_189469 ) ) ( not ( = ?auto_189467 ?auto_189469 ) ) ( not ( = ?auto_189466 ?auto_189469 ) ) ( TRUCK-AT ?auto_189471 ?auto_189474 ) ( SURFACE-AT ?auto_189466 ?auto_189474 ) ( CLEAR ?auto_189466 ) ( LIFTING ?auto_189473 ?auto_189468 ) ( IS-CRATE ?auto_189468 ) ( ON ?auto_189464 ?auto_189463 ) ( ON ?auto_189465 ?auto_189464 ) ( ON ?auto_189462 ?auto_189465 ) ( ON ?auto_189466 ?auto_189462 ) ( not ( = ?auto_189463 ?auto_189464 ) ) ( not ( = ?auto_189463 ?auto_189465 ) ) ( not ( = ?auto_189463 ?auto_189462 ) ) ( not ( = ?auto_189463 ?auto_189466 ) ) ( not ( = ?auto_189463 ?auto_189468 ) ) ( not ( = ?auto_189463 ?auto_189467 ) ) ( not ( = ?auto_189463 ?auto_189469 ) ) ( not ( = ?auto_189464 ?auto_189465 ) ) ( not ( = ?auto_189464 ?auto_189462 ) ) ( not ( = ?auto_189464 ?auto_189466 ) ) ( not ( = ?auto_189464 ?auto_189468 ) ) ( not ( = ?auto_189464 ?auto_189467 ) ) ( not ( = ?auto_189464 ?auto_189469 ) ) ( not ( = ?auto_189465 ?auto_189462 ) ) ( not ( = ?auto_189465 ?auto_189466 ) ) ( not ( = ?auto_189465 ?auto_189468 ) ) ( not ( = ?auto_189465 ?auto_189467 ) ) ( not ( = ?auto_189465 ?auto_189469 ) ) ( not ( = ?auto_189462 ?auto_189466 ) ) ( not ( = ?auto_189462 ?auto_189468 ) ) ( not ( = ?auto_189462 ?auto_189467 ) ) ( not ( = ?auto_189462 ?auto_189469 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189466 ?auto_189468 ?auto_189467 )
      ( MAKE-6CRATE-VERIFY ?auto_189463 ?auto_189464 ?auto_189465 ?auto_189462 ?auto_189466 ?auto_189468 ?auto_189467 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189527 - SURFACE
      ?auto_189528 - SURFACE
      ?auto_189529 - SURFACE
      ?auto_189526 - SURFACE
      ?auto_189530 - SURFACE
      ?auto_189532 - SURFACE
      ?auto_189531 - SURFACE
    )
    :vars
    (
      ?auto_189538 - HOIST
      ?auto_189537 - PLACE
      ?auto_189534 - PLACE
      ?auto_189535 - HOIST
      ?auto_189533 - SURFACE
      ?auto_189536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189538 ?auto_189537 ) ( IS-CRATE ?auto_189531 ) ( not ( = ?auto_189532 ?auto_189531 ) ) ( not ( = ?auto_189530 ?auto_189532 ) ) ( not ( = ?auto_189530 ?auto_189531 ) ) ( not ( = ?auto_189534 ?auto_189537 ) ) ( HOIST-AT ?auto_189535 ?auto_189534 ) ( not ( = ?auto_189538 ?auto_189535 ) ) ( AVAILABLE ?auto_189535 ) ( SURFACE-AT ?auto_189531 ?auto_189534 ) ( ON ?auto_189531 ?auto_189533 ) ( CLEAR ?auto_189531 ) ( not ( = ?auto_189532 ?auto_189533 ) ) ( not ( = ?auto_189531 ?auto_189533 ) ) ( not ( = ?auto_189530 ?auto_189533 ) ) ( TRUCK-AT ?auto_189536 ?auto_189537 ) ( SURFACE-AT ?auto_189530 ?auto_189537 ) ( CLEAR ?auto_189530 ) ( IS-CRATE ?auto_189532 ) ( AVAILABLE ?auto_189538 ) ( IN ?auto_189532 ?auto_189536 ) ( ON ?auto_189528 ?auto_189527 ) ( ON ?auto_189529 ?auto_189528 ) ( ON ?auto_189526 ?auto_189529 ) ( ON ?auto_189530 ?auto_189526 ) ( not ( = ?auto_189527 ?auto_189528 ) ) ( not ( = ?auto_189527 ?auto_189529 ) ) ( not ( = ?auto_189527 ?auto_189526 ) ) ( not ( = ?auto_189527 ?auto_189530 ) ) ( not ( = ?auto_189527 ?auto_189532 ) ) ( not ( = ?auto_189527 ?auto_189531 ) ) ( not ( = ?auto_189527 ?auto_189533 ) ) ( not ( = ?auto_189528 ?auto_189529 ) ) ( not ( = ?auto_189528 ?auto_189526 ) ) ( not ( = ?auto_189528 ?auto_189530 ) ) ( not ( = ?auto_189528 ?auto_189532 ) ) ( not ( = ?auto_189528 ?auto_189531 ) ) ( not ( = ?auto_189528 ?auto_189533 ) ) ( not ( = ?auto_189529 ?auto_189526 ) ) ( not ( = ?auto_189529 ?auto_189530 ) ) ( not ( = ?auto_189529 ?auto_189532 ) ) ( not ( = ?auto_189529 ?auto_189531 ) ) ( not ( = ?auto_189529 ?auto_189533 ) ) ( not ( = ?auto_189526 ?auto_189530 ) ) ( not ( = ?auto_189526 ?auto_189532 ) ) ( not ( = ?auto_189526 ?auto_189531 ) ) ( not ( = ?auto_189526 ?auto_189533 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189530 ?auto_189532 ?auto_189531 )
      ( MAKE-6CRATE-VERIFY ?auto_189527 ?auto_189528 ?auto_189529 ?auto_189526 ?auto_189530 ?auto_189532 ?auto_189531 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_191483 - SURFACE
      ?auto_191484 - SURFACE
      ?auto_191485 - SURFACE
      ?auto_191482 - SURFACE
      ?auto_191486 - SURFACE
      ?auto_191488 - SURFACE
      ?auto_191487 - SURFACE
      ?auto_191489 - SURFACE
    )
    :vars
    (
      ?auto_191491 - HOIST
      ?auto_191490 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_191491 ?auto_191490 ) ( SURFACE-AT ?auto_191487 ?auto_191490 ) ( CLEAR ?auto_191487 ) ( LIFTING ?auto_191491 ?auto_191489 ) ( IS-CRATE ?auto_191489 ) ( not ( = ?auto_191487 ?auto_191489 ) ) ( ON ?auto_191484 ?auto_191483 ) ( ON ?auto_191485 ?auto_191484 ) ( ON ?auto_191482 ?auto_191485 ) ( ON ?auto_191486 ?auto_191482 ) ( ON ?auto_191488 ?auto_191486 ) ( ON ?auto_191487 ?auto_191488 ) ( not ( = ?auto_191483 ?auto_191484 ) ) ( not ( = ?auto_191483 ?auto_191485 ) ) ( not ( = ?auto_191483 ?auto_191482 ) ) ( not ( = ?auto_191483 ?auto_191486 ) ) ( not ( = ?auto_191483 ?auto_191488 ) ) ( not ( = ?auto_191483 ?auto_191487 ) ) ( not ( = ?auto_191483 ?auto_191489 ) ) ( not ( = ?auto_191484 ?auto_191485 ) ) ( not ( = ?auto_191484 ?auto_191482 ) ) ( not ( = ?auto_191484 ?auto_191486 ) ) ( not ( = ?auto_191484 ?auto_191488 ) ) ( not ( = ?auto_191484 ?auto_191487 ) ) ( not ( = ?auto_191484 ?auto_191489 ) ) ( not ( = ?auto_191485 ?auto_191482 ) ) ( not ( = ?auto_191485 ?auto_191486 ) ) ( not ( = ?auto_191485 ?auto_191488 ) ) ( not ( = ?auto_191485 ?auto_191487 ) ) ( not ( = ?auto_191485 ?auto_191489 ) ) ( not ( = ?auto_191482 ?auto_191486 ) ) ( not ( = ?auto_191482 ?auto_191488 ) ) ( not ( = ?auto_191482 ?auto_191487 ) ) ( not ( = ?auto_191482 ?auto_191489 ) ) ( not ( = ?auto_191486 ?auto_191488 ) ) ( not ( = ?auto_191486 ?auto_191487 ) ) ( not ( = ?auto_191486 ?auto_191489 ) ) ( not ( = ?auto_191488 ?auto_191487 ) ) ( not ( = ?auto_191488 ?auto_191489 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_191487 ?auto_191489 )
      ( MAKE-7CRATE-VERIFY ?auto_191483 ?auto_191484 ?auto_191485 ?auto_191482 ?auto_191486 ?auto_191488 ?auto_191487 ?auto_191489 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_191538 - SURFACE
      ?auto_191539 - SURFACE
      ?auto_191540 - SURFACE
      ?auto_191537 - SURFACE
      ?auto_191541 - SURFACE
      ?auto_191543 - SURFACE
      ?auto_191542 - SURFACE
      ?auto_191544 - SURFACE
    )
    :vars
    (
      ?auto_191546 - HOIST
      ?auto_191545 - PLACE
      ?auto_191547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_191546 ?auto_191545 ) ( SURFACE-AT ?auto_191542 ?auto_191545 ) ( CLEAR ?auto_191542 ) ( IS-CRATE ?auto_191544 ) ( not ( = ?auto_191542 ?auto_191544 ) ) ( TRUCK-AT ?auto_191547 ?auto_191545 ) ( AVAILABLE ?auto_191546 ) ( IN ?auto_191544 ?auto_191547 ) ( ON ?auto_191542 ?auto_191543 ) ( not ( = ?auto_191543 ?auto_191542 ) ) ( not ( = ?auto_191543 ?auto_191544 ) ) ( ON ?auto_191539 ?auto_191538 ) ( ON ?auto_191540 ?auto_191539 ) ( ON ?auto_191537 ?auto_191540 ) ( ON ?auto_191541 ?auto_191537 ) ( ON ?auto_191543 ?auto_191541 ) ( not ( = ?auto_191538 ?auto_191539 ) ) ( not ( = ?auto_191538 ?auto_191540 ) ) ( not ( = ?auto_191538 ?auto_191537 ) ) ( not ( = ?auto_191538 ?auto_191541 ) ) ( not ( = ?auto_191538 ?auto_191543 ) ) ( not ( = ?auto_191538 ?auto_191542 ) ) ( not ( = ?auto_191538 ?auto_191544 ) ) ( not ( = ?auto_191539 ?auto_191540 ) ) ( not ( = ?auto_191539 ?auto_191537 ) ) ( not ( = ?auto_191539 ?auto_191541 ) ) ( not ( = ?auto_191539 ?auto_191543 ) ) ( not ( = ?auto_191539 ?auto_191542 ) ) ( not ( = ?auto_191539 ?auto_191544 ) ) ( not ( = ?auto_191540 ?auto_191537 ) ) ( not ( = ?auto_191540 ?auto_191541 ) ) ( not ( = ?auto_191540 ?auto_191543 ) ) ( not ( = ?auto_191540 ?auto_191542 ) ) ( not ( = ?auto_191540 ?auto_191544 ) ) ( not ( = ?auto_191537 ?auto_191541 ) ) ( not ( = ?auto_191537 ?auto_191543 ) ) ( not ( = ?auto_191537 ?auto_191542 ) ) ( not ( = ?auto_191537 ?auto_191544 ) ) ( not ( = ?auto_191541 ?auto_191543 ) ) ( not ( = ?auto_191541 ?auto_191542 ) ) ( not ( = ?auto_191541 ?auto_191544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_191543 ?auto_191542 ?auto_191544 )
      ( MAKE-7CRATE-VERIFY ?auto_191538 ?auto_191539 ?auto_191540 ?auto_191537 ?auto_191541 ?auto_191543 ?auto_191542 ?auto_191544 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_191601 - SURFACE
      ?auto_191602 - SURFACE
      ?auto_191603 - SURFACE
      ?auto_191600 - SURFACE
      ?auto_191604 - SURFACE
      ?auto_191606 - SURFACE
      ?auto_191605 - SURFACE
      ?auto_191607 - SURFACE
    )
    :vars
    (
      ?auto_191610 - HOIST
      ?auto_191611 - PLACE
      ?auto_191608 - TRUCK
      ?auto_191609 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_191610 ?auto_191611 ) ( SURFACE-AT ?auto_191605 ?auto_191611 ) ( CLEAR ?auto_191605 ) ( IS-CRATE ?auto_191607 ) ( not ( = ?auto_191605 ?auto_191607 ) ) ( AVAILABLE ?auto_191610 ) ( IN ?auto_191607 ?auto_191608 ) ( ON ?auto_191605 ?auto_191606 ) ( not ( = ?auto_191606 ?auto_191605 ) ) ( not ( = ?auto_191606 ?auto_191607 ) ) ( TRUCK-AT ?auto_191608 ?auto_191609 ) ( not ( = ?auto_191609 ?auto_191611 ) ) ( ON ?auto_191602 ?auto_191601 ) ( ON ?auto_191603 ?auto_191602 ) ( ON ?auto_191600 ?auto_191603 ) ( ON ?auto_191604 ?auto_191600 ) ( ON ?auto_191606 ?auto_191604 ) ( not ( = ?auto_191601 ?auto_191602 ) ) ( not ( = ?auto_191601 ?auto_191603 ) ) ( not ( = ?auto_191601 ?auto_191600 ) ) ( not ( = ?auto_191601 ?auto_191604 ) ) ( not ( = ?auto_191601 ?auto_191606 ) ) ( not ( = ?auto_191601 ?auto_191605 ) ) ( not ( = ?auto_191601 ?auto_191607 ) ) ( not ( = ?auto_191602 ?auto_191603 ) ) ( not ( = ?auto_191602 ?auto_191600 ) ) ( not ( = ?auto_191602 ?auto_191604 ) ) ( not ( = ?auto_191602 ?auto_191606 ) ) ( not ( = ?auto_191602 ?auto_191605 ) ) ( not ( = ?auto_191602 ?auto_191607 ) ) ( not ( = ?auto_191603 ?auto_191600 ) ) ( not ( = ?auto_191603 ?auto_191604 ) ) ( not ( = ?auto_191603 ?auto_191606 ) ) ( not ( = ?auto_191603 ?auto_191605 ) ) ( not ( = ?auto_191603 ?auto_191607 ) ) ( not ( = ?auto_191600 ?auto_191604 ) ) ( not ( = ?auto_191600 ?auto_191606 ) ) ( not ( = ?auto_191600 ?auto_191605 ) ) ( not ( = ?auto_191600 ?auto_191607 ) ) ( not ( = ?auto_191604 ?auto_191606 ) ) ( not ( = ?auto_191604 ?auto_191605 ) ) ( not ( = ?auto_191604 ?auto_191607 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_191606 ?auto_191605 ?auto_191607 )
      ( MAKE-7CRATE-VERIFY ?auto_191601 ?auto_191602 ?auto_191603 ?auto_191600 ?auto_191604 ?auto_191606 ?auto_191605 ?auto_191607 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_191671 - SURFACE
      ?auto_191672 - SURFACE
      ?auto_191673 - SURFACE
      ?auto_191670 - SURFACE
      ?auto_191674 - SURFACE
      ?auto_191676 - SURFACE
      ?auto_191675 - SURFACE
      ?auto_191677 - SURFACE
    )
    :vars
    (
      ?auto_191682 - HOIST
      ?auto_191680 - PLACE
      ?auto_191681 - TRUCK
      ?auto_191679 - PLACE
      ?auto_191678 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_191682 ?auto_191680 ) ( SURFACE-AT ?auto_191675 ?auto_191680 ) ( CLEAR ?auto_191675 ) ( IS-CRATE ?auto_191677 ) ( not ( = ?auto_191675 ?auto_191677 ) ) ( AVAILABLE ?auto_191682 ) ( ON ?auto_191675 ?auto_191676 ) ( not ( = ?auto_191676 ?auto_191675 ) ) ( not ( = ?auto_191676 ?auto_191677 ) ) ( TRUCK-AT ?auto_191681 ?auto_191679 ) ( not ( = ?auto_191679 ?auto_191680 ) ) ( HOIST-AT ?auto_191678 ?auto_191679 ) ( LIFTING ?auto_191678 ?auto_191677 ) ( not ( = ?auto_191682 ?auto_191678 ) ) ( ON ?auto_191672 ?auto_191671 ) ( ON ?auto_191673 ?auto_191672 ) ( ON ?auto_191670 ?auto_191673 ) ( ON ?auto_191674 ?auto_191670 ) ( ON ?auto_191676 ?auto_191674 ) ( not ( = ?auto_191671 ?auto_191672 ) ) ( not ( = ?auto_191671 ?auto_191673 ) ) ( not ( = ?auto_191671 ?auto_191670 ) ) ( not ( = ?auto_191671 ?auto_191674 ) ) ( not ( = ?auto_191671 ?auto_191676 ) ) ( not ( = ?auto_191671 ?auto_191675 ) ) ( not ( = ?auto_191671 ?auto_191677 ) ) ( not ( = ?auto_191672 ?auto_191673 ) ) ( not ( = ?auto_191672 ?auto_191670 ) ) ( not ( = ?auto_191672 ?auto_191674 ) ) ( not ( = ?auto_191672 ?auto_191676 ) ) ( not ( = ?auto_191672 ?auto_191675 ) ) ( not ( = ?auto_191672 ?auto_191677 ) ) ( not ( = ?auto_191673 ?auto_191670 ) ) ( not ( = ?auto_191673 ?auto_191674 ) ) ( not ( = ?auto_191673 ?auto_191676 ) ) ( not ( = ?auto_191673 ?auto_191675 ) ) ( not ( = ?auto_191673 ?auto_191677 ) ) ( not ( = ?auto_191670 ?auto_191674 ) ) ( not ( = ?auto_191670 ?auto_191676 ) ) ( not ( = ?auto_191670 ?auto_191675 ) ) ( not ( = ?auto_191670 ?auto_191677 ) ) ( not ( = ?auto_191674 ?auto_191676 ) ) ( not ( = ?auto_191674 ?auto_191675 ) ) ( not ( = ?auto_191674 ?auto_191677 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_191676 ?auto_191675 ?auto_191677 )
      ( MAKE-7CRATE-VERIFY ?auto_191671 ?auto_191672 ?auto_191673 ?auto_191670 ?auto_191674 ?auto_191676 ?auto_191675 ?auto_191677 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_191748 - SURFACE
      ?auto_191749 - SURFACE
      ?auto_191750 - SURFACE
      ?auto_191747 - SURFACE
      ?auto_191751 - SURFACE
      ?auto_191753 - SURFACE
      ?auto_191752 - SURFACE
      ?auto_191754 - SURFACE
    )
    :vars
    (
      ?auto_191760 - HOIST
      ?auto_191759 - PLACE
      ?auto_191758 - TRUCK
      ?auto_191756 - PLACE
      ?auto_191757 - HOIST
      ?auto_191755 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_191760 ?auto_191759 ) ( SURFACE-AT ?auto_191752 ?auto_191759 ) ( CLEAR ?auto_191752 ) ( IS-CRATE ?auto_191754 ) ( not ( = ?auto_191752 ?auto_191754 ) ) ( AVAILABLE ?auto_191760 ) ( ON ?auto_191752 ?auto_191753 ) ( not ( = ?auto_191753 ?auto_191752 ) ) ( not ( = ?auto_191753 ?auto_191754 ) ) ( TRUCK-AT ?auto_191758 ?auto_191756 ) ( not ( = ?auto_191756 ?auto_191759 ) ) ( HOIST-AT ?auto_191757 ?auto_191756 ) ( not ( = ?auto_191760 ?auto_191757 ) ) ( AVAILABLE ?auto_191757 ) ( SURFACE-AT ?auto_191754 ?auto_191756 ) ( ON ?auto_191754 ?auto_191755 ) ( CLEAR ?auto_191754 ) ( not ( = ?auto_191752 ?auto_191755 ) ) ( not ( = ?auto_191754 ?auto_191755 ) ) ( not ( = ?auto_191753 ?auto_191755 ) ) ( ON ?auto_191749 ?auto_191748 ) ( ON ?auto_191750 ?auto_191749 ) ( ON ?auto_191747 ?auto_191750 ) ( ON ?auto_191751 ?auto_191747 ) ( ON ?auto_191753 ?auto_191751 ) ( not ( = ?auto_191748 ?auto_191749 ) ) ( not ( = ?auto_191748 ?auto_191750 ) ) ( not ( = ?auto_191748 ?auto_191747 ) ) ( not ( = ?auto_191748 ?auto_191751 ) ) ( not ( = ?auto_191748 ?auto_191753 ) ) ( not ( = ?auto_191748 ?auto_191752 ) ) ( not ( = ?auto_191748 ?auto_191754 ) ) ( not ( = ?auto_191748 ?auto_191755 ) ) ( not ( = ?auto_191749 ?auto_191750 ) ) ( not ( = ?auto_191749 ?auto_191747 ) ) ( not ( = ?auto_191749 ?auto_191751 ) ) ( not ( = ?auto_191749 ?auto_191753 ) ) ( not ( = ?auto_191749 ?auto_191752 ) ) ( not ( = ?auto_191749 ?auto_191754 ) ) ( not ( = ?auto_191749 ?auto_191755 ) ) ( not ( = ?auto_191750 ?auto_191747 ) ) ( not ( = ?auto_191750 ?auto_191751 ) ) ( not ( = ?auto_191750 ?auto_191753 ) ) ( not ( = ?auto_191750 ?auto_191752 ) ) ( not ( = ?auto_191750 ?auto_191754 ) ) ( not ( = ?auto_191750 ?auto_191755 ) ) ( not ( = ?auto_191747 ?auto_191751 ) ) ( not ( = ?auto_191747 ?auto_191753 ) ) ( not ( = ?auto_191747 ?auto_191752 ) ) ( not ( = ?auto_191747 ?auto_191754 ) ) ( not ( = ?auto_191747 ?auto_191755 ) ) ( not ( = ?auto_191751 ?auto_191753 ) ) ( not ( = ?auto_191751 ?auto_191752 ) ) ( not ( = ?auto_191751 ?auto_191754 ) ) ( not ( = ?auto_191751 ?auto_191755 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_191753 ?auto_191752 ?auto_191754 )
      ( MAKE-7CRATE-VERIFY ?auto_191748 ?auto_191749 ?auto_191750 ?auto_191747 ?auto_191751 ?auto_191753 ?auto_191752 ?auto_191754 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_191826 - SURFACE
      ?auto_191827 - SURFACE
      ?auto_191828 - SURFACE
      ?auto_191825 - SURFACE
      ?auto_191829 - SURFACE
      ?auto_191831 - SURFACE
      ?auto_191830 - SURFACE
      ?auto_191832 - SURFACE
    )
    :vars
    (
      ?auto_191833 - HOIST
      ?auto_191835 - PLACE
      ?auto_191834 - PLACE
      ?auto_191838 - HOIST
      ?auto_191837 - SURFACE
      ?auto_191836 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_191833 ?auto_191835 ) ( SURFACE-AT ?auto_191830 ?auto_191835 ) ( CLEAR ?auto_191830 ) ( IS-CRATE ?auto_191832 ) ( not ( = ?auto_191830 ?auto_191832 ) ) ( AVAILABLE ?auto_191833 ) ( ON ?auto_191830 ?auto_191831 ) ( not ( = ?auto_191831 ?auto_191830 ) ) ( not ( = ?auto_191831 ?auto_191832 ) ) ( not ( = ?auto_191834 ?auto_191835 ) ) ( HOIST-AT ?auto_191838 ?auto_191834 ) ( not ( = ?auto_191833 ?auto_191838 ) ) ( AVAILABLE ?auto_191838 ) ( SURFACE-AT ?auto_191832 ?auto_191834 ) ( ON ?auto_191832 ?auto_191837 ) ( CLEAR ?auto_191832 ) ( not ( = ?auto_191830 ?auto_191837 ) ) ( not ( = ?auto_191832 ?auto_191837 ) ) ( not ( = ?auto_191831 ?auto_191837 ) ) ( TRUCK-AT ?auto_191836 ?auto_191835 ) ( ON ?auto_191827 ?auto_191826 ) ( ON ?auto_191828 ?auto_191827 ) ( ON ?auto_191825 ?auto_191828 ) ( ON ?auto_191829 ?auto_191825 ) ( ON ?auto_191831 ?auto_191829 ) ( not ( = ?auto_191826 ?auto_191827 ) ) ( not ( = ?auto_191826 ?auto_191828 ) ) ( not ( = ?auto_191826 ?auto_191825 ) ) ( not ( = ?auto_191826 ?auto_191829 ) ) ( not ( = ?auto_191826 ?auto_191831 ) ) ( not ( = ?auto_191826 ?auto_191830 ) ) ( not ( = ?auto_191826 ?auto_191832 ) ) ( not ( = ?auto_191826 ?auto_191837 ) ) ( not ( = ?auto_191827 ?auto_191828 ) ) ( not ( = ?auto_191827 ?auto_191825 ) ) ( not ( = ?auto_191827 ?auto_191829 ) ) ( not ( = ?auto_191827 ?auto_191831 ) ) ( not ( = ?auto_191827 ?auto_191830 ) ) ( not ( = ?auto_191827 ?auto_191832 ) ) ( not ( = ?auto_191827 ?auto_191837 ) ) ( not ( = ?auto_191828 ?auto_191825 ) ) ( not ( = ?auto_191828 ?auto_191829 ) ) ( not ( = ?auto_191828 ?auto_191831 ) ) ( not ( = ?auto_191828 ?auto_191830 ) ) ( not ( = ?auto_191828 ?auto_191832 ) ) ( not ( = ?auto_191828 ?auto_191837 ) ) ( not ( = ?auto_191825 ?auto_191829 ) ) ( not ( = ?auto_191825 ?auto_191831 ) ) ( not ( = ?auto_191825 ?auto_191830 ) ) ( not ( = ?auto_191825 ?auto_191832 ) ) ( not ( = ?auto_191825 ?auto_191837 ) ) ( not ( = ?auto_191829 ?auto_191831 ) ) ( not ( = ?auto_191829 ?auto_191830 ) ) ( not ( = ?auto_191829 ?auto_191832 ) ) ( not ( = ?auto_191829 ?auto_191837 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_191831 ?auto_191830 ?auto_191832 )
      ( MAKE-7CRATE-VERIFY ?auto_191826 ?auto_191827 ?auto_191828 ?auto_191825 ?auto_191829 ?auto_191831 ?auto_191830 ?auto_191832 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_191904 - SURFACE
      ?auto_191905 - SURFACE
      ?auto_191906 - SURFACE
      ?auto_191903 - SURFACE
      ?auto_191907 - SURFACE
      ?auto_191909 - SURFACE
      ?auto_191908 - SURFACE
      ?auto_191910 - SURFACE
    )
    :vars
    (
      ?auto_191911 - HOIST
      ?auto_191914 - PLACE
      ?auto_191915 - PLACE
      ?auto_191912 - HOIST
      ?auto_191913 - SURFACE
      ?auto_191916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_191911 ?auto_191914 ) ( IS-CRATE ?auto_191910 ) ( not ( = ?auto_191908 ?auto_191910 ) ) ( not ( = ?auto_191909 ?auto_191908 ) ) ( not ( = ?auto_191909 ?auto_191910 ) ) ( not ( = ?auto_191915 ?auto_191914 ) ) ( HOIST-AT ?auto_191912 ?auto_191915 ) ( not ( = ?auto_191911 ?auto_191912 ) ) ( AVAILABLE ?auto_191912 ) ( SURFACE-AT ?auto_191910 ?auto_191915 ) ( ON ?auto_191910 ?auto_191913 ) ( CLEAR ?auto_191910 ) ( not ( = ?auto_191908 ?auto_191913 ) ) ( not ( = ?auto_191910 ?auto_191913 ) ) ( not ( = ?auto_191909 ?auto_191913 ) ) ( TRUCK-AT ?auto_191916 ?auto_191914 ) ( SURFACE-AT ?auto_191909 ?auto_191914 ) ( CLEAR ?auto_191909 ) ( LIFTING ?auto_191911 ?auto_191908 ) ( IS-CRATE ?auto_191908 ) ( ON ?auto_191905 ?auto_191904 ) ( ON ?auto_191906 ?auto_191905 ) ( ON ?auto_191903 ?auto_191906 ) ( ON ?auto_191907 ?auto_191903 ) ( ON ?auto_191909 ?auto_191907 ) ( not ( = ?auto_191904 ?auto_191905 ) ) ( not ( = ?auto_191904 ?auto_191906 ) ) ( not ( = ?auto_191904 ?auto_191903 ) ) ( not ( = ?auto_191904 ?auto_191907 ) ) ( not ( = ?auto_191904 ?auto_191909 ) ) ( not ( = ?auto_191904 ?auto_191908 ) ) ( not ( = ?auto_191904 ?auto_191910 ) ) ( not ( = ?auto_191904 ?auto_191913 ) ) ( not ( = ?auto_191905 ?auto_191906 ) ) ( not ( = ?auto_191905 ?auto_191903 ) ) ( not ( = ?auto_191905 ?auto_191907 ) ) ( not ( = ?auto_191905 ?auto_191909 ) ) ( not ( = ?auto_191905 ?auto_191908 ) ) ( not ( = ?auto_191905 ?auto_191910 ) ) ( not ( = ?auto_191905 ?auto_191913 ) ) ( not ( = ?auto_191906 ?auto_191903 ) ) ( not ( = ?auto_191906 ?auto_191907 ) ) ( not ( = ?auto_191906 ?auto_191909 ) ) ( not ( = ?auto_191906 ?auto_191908 ) ) ( not ( = ?auto_191906 ?auto_191910 ) ) ( not ( = ?auto_191906 ?auto_191913 ) ) ( not ( = ?auto_191903 ?auto_191907 ) ) ( not ( = ?auto_191903 ?auto_191909 ) ) ( not ( = ?auto_191903 ?auto_191908 ) ) ( not ( = ?auto_191903 ?auto_191910 ) ) ( not ( = ?auto_191903 ?auto_191913 ) ) ( not ( = ?auto_191907 ?auto_191909 ) ) ( not ( = ?auto_191907 ?auto_191908 ) ) ( not ( = ?auto_191907 ?auto_191910 ) ) ( not ( = ?auto_191907 ?auto_191913 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_191909 ?auto_191908 ?auto_191910 )
      ( MAKE-7CRATE-VERIFY ?auto_191904 ?auto_191905 ?auto_191906 ?auto_191903 ?auto_191907 ?auto_191909 ?auto_191908 ?auto_191910 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_191982 - SURFACE
      ?auto_191983 - SURFACE
      ?auto_191984 - SURFACE
      ?auto_191981 - SURFACE
      ?auto_191985 - SURFACE
      ?auto_191987 - SURFACE
      ?auto_191986 - SURFACE
      ?auto_191988 - SURFACE
    )
    :vars
    (
      ?auto_191991 - HOIST
      ?auto_191990 - PLACE
      ?auto_191992 - PLACE
      ?auto_191989 - HOIST
      ?auto_191994 - SURFACE
      ?auto_191993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_191991 ?auto_191990 ) ( IS-CRATE ?auto_191988 ) ( not ( = ?auto_191986 ?auto_191988 ) ) ( not ( = ?auto_191987 ?auto_191986 ) ) ( not ( = ?auto_191987 ?auto_191988 ) ) ( not ( = ?auto_191992 ?auto_191990 ) ) ( HOIST-AT ?auto_191989 ?auto_191992 ) ( not ( = ?auto_191991 ?auto_191989 ) ) ( AVAILABLE ?auto_191989 ) ( SURFACE-AT ?auto_191988 ?auto_191992 ) ( ON ?auto_191988 ?auto_191994 ) ( CLEAR ?auto_191988 ) ( not ( = ?auto_191986 ?auto_191994 ) ) ( not ( = ?auto_191988 ?auto_191994 ) ) ( not ( = ?auto_191987 ?auto_191994 ) ) ( TRUCK-AT ?auto_191993 ?auto_191990 ) ( SURFACE-AT ?auto_191987 ?auto_191990 ) ( CLEAR ?auto_191987 ) ( IS-CRATE ?auto_191986 ) ( AVAILABLE ?auto_191991 ) ( IN ?auto_191986 ?auto_191993 ) ( ON ?auto_191983 ?auto_191982 ) ( ON ?auto_191984 ?auto_191983 ) ( ON ?auto_191981 ?auto_191984 ) ( ON ?auto_191985 ?auto_191981 ) ( ON ?auto_191987 ?auto_191985 ) ( not ( = ?auto_191982 ?auto_191983 ) ) ( not ( = ?auto_191982 ?auto_191984 ) ) ( not ( = ?auto_191982 ?auto_191981 ) ) ( not ( = ?auto_191982 ?auto_191985 ) ) ( not ( = ?auto_191982 ?auto_191987 ) ) ( not ( = ?auto_191982 ?auto_191986 ) ) ( not ( = ?auto_191982 ?auto_191988 ) ) ( not ( = ?auto_191982 ?auto_191994 ) ) ( not ( = ?auto_191983 ?auto_191984 ) ) ( not ( = ?auto_191983 ?auto_191981 ) ) ( not ( = ?auto_191983 ?auto_191985 ) ) ( not ( = ?auto_191983 ?auto_191987 ) ) ( not ( = ?auto_191983 ?auto_191986 ) ) ( not ( = ?auto_191983 ?auto_191988 ) ) ( not ( = ?auto_191983 ?auto_191994 ) ) ( not ( = ?auto_191984 ?auto_191981 ) ) ( not ( = ?auto_191984 ?auto_191985 ) ) ( not ( = ?auto_191984 ?auto_191987 ) ) ( not ( = ?auto_191984 ?auto_191986 ) ) ( not ( = ?auto_191984 ?auto_191988 ) ) ( not ( = ?auto_191984 ?auto_191994 ) ) ( not ( = ?auto_191981 ?auto_191985 ) ) ( not ( = ?auto_191981 ?auto_191987 ) ) ( not ( = ?auto_191981 ?auto_191986 ) ) ( not ( = ?auto_191981 ?auto_191988 ) ) ( not ( = ?auto_191981 ?auto_191994 ) ) ( not ( = ?auto_191985 ?auto_191987 ) ) ( not ( = ?auto_191985 ?auto_191986 ) ) ( not ( = ?auto_191985 ?auto_191988 ) ) ( not ( = ?auto_191985 ?auto_191994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_191987 ?auto_191986 ?auto_191988 )
      ( MAKE-7CRATE-VERIFY ?auto_191982 ?auto_191983 ?auto_191984 ?auto_191981 ?auto_191985 ?auto_191987 ?auto_191986 ?auto_191988 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_194901 - SURFACE
      ?auto_194902 - SURFACE
      ?auto_194903 - SURFACE
      ?auto_194900 - SURFACE
      ?auto_194904 - SURFACE
      ?auto_194906 - SURFACE
      ?auto_194905 - SURFACE
      ?auto_194907 - SURFACE
      ?auto_194908 - SURFACE
    )
    :vars
    (
      ?auto_194910 - HOIST
      ?auto_194909 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_194910 ?auto_194909 ) ( SURFACE-AT ?auto_194907 ?auto_194909 ) ( CLEAR ?auto_194907 ) ( LIFTING ?auto_194910 ?auto_194908 ) ( IS-CRATE ?auto_194908 ) ( not ( = ?auto_194907 ?auto_194908 ) ) ( ON ?auto_194902 ?auto_194901 ) ( ON ?auto_194903 ?auto_194902 ) ( ON ?auto_194900 ?auto_194903 ) ( ON ?auto_194904 ?auto_194900 ) ( ON ?auto_194906 ?auto_194904 ) ( ON ?auto_194905 ?auto_194906 ) ( ON ?auto_194907 ?auto_194905 ) ( not ( = ?auto_194901 ?auto_194902 ) ) ( not ( = ?auto_194901 ?auto_194903 ) ) ( not ( = ?auto_194901 ?auto_194900 ) ) ( not ( = ?auto_194901 ?auto_194904 ) ) ( not ( = ?auto_194901 ?auto_194906 ) ) ( not ( = ?auto_194901 ?auto_194905 ) ) ( not ( = ?auto_194901 ?auto_194907 ) ) ( not ( = ?auto_194901 ?auto_194908 ) ) ( not ( = ?auto_194902 ?auto_194903 ) ) ( not ( = ?auto_194902 ?auto_194900 ) ) ( not ( = ?auto_194902 ?auto_194904 ) ) ( not ( = ?auto_194902 ?auto_194906 ) ) ( not ( = ?auto_194902 ?auto_194905 ) ) ( not ( = ?auto_194902 ?auto_194907 ) ) ( not ( = ?auto_194902 ?auto_194908 ) ) ( not ( = ?auto_194903 ?auto_194900 ) ) ( not ( = ?auto_194903 ?auto_194904 ) ) ( not ( = ?auto_194903 ?auto_194906 ) ) ( not ( = ?auto_194903 ?auto_194905 ) ) ( not ( = ?auto_194903 ?auto_194907 ) ) ( not ( = ?auto_194903 ?auto_194908 ) ) ( not ( = ?auto_194900 ?auto_194904 ) ) ( not ( = ?auto_194900 ?auto_194906 ) ) ( not ( = ?auto_194900 ?auto_194905 ) ) ( not ( = ?auto_194900 ?auto_194907 ) ) ( not ( = ?auto_194900 ?auto_194908 ) ) ( not ( = ?auto_194904 ?auto_194906 ) ) ( not ( = ?auto_194904 ?auto_194905 ) ) ( not ( = ?auto_194904 ?auto_194907 ) ) ( not ( = ?auto_194904 ?auto_194908 ) ) ( not ( = ?auto_194906 ?auto_194905 ) ) ( not ( = ?auto_194906 ?auto_194907 ) ) ( not ( = ?auto_194906 ?auto_194908 ) ) ( not ( = ?auto_194905 ?auto_194907 ) ) ( not ( = ?auto_194905 ?auto_194908 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_194907 ?auto_194908 )
      ( MAKE-8CRATE-VERIFY ?auto_194901 ?auto_194902 ?auto_194903 ?auto_194900 ?auto_194904 ?auto_194906 ?auto_194905 ?auto_194907 ?auto_194908 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_194968 - SURFACE
      ?auto_194969 - SURFACE
      ?auto_194970 - SURFACE
      ?auto_194967 - SURFACE
      ?auto_194971 - SURFACE
      ?auto_194973 - SURFACE
      ?auto_194972 - SURFACE
      ?auto_194974 - SURFACE
      ?auto_194975 - SURFACE
    )
    :vars
    (
      ?auto_194978 - HOIST
      ?auto_194977 - PLACE
      ?auto_194976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_194978 ?auto_194977 ) ( SURFACE-AT ?auto_194974 ?auto_194977 ) ( CLEAR ?auto_194974 ) ( IS-CRATE ?auto_194975 ) ( not ( = ?auto_194974 ?auto_194975 ) ) ( TRUCK-AT ?auto_194976 ?auto_194977 ) ( AVAILABLE ?auto_194978 ) ( IN ?auto_194975 ?auto_194976 ) ( ON ?auto_194974 ?auto_194972 ) ( not ( = ?auto_194972 ?auto_194974 ) ) ( not ( = ?auto_194972 ?auto_194975 ) ) ( ON ?auto_194969 ?auto_194968 ) ( ON ?auto_194970 ?auto_194969 ) ( ON ?auto_194967 ?auto_194970 ) ( ON ?auto_194971 ?auto_194967 ) ( ON ?auto_194973 ?auto_194971 ) ( ON ?auto_194972 ?auto_194973 ) ( not ( = ?auto_194968 ?auto_194969 ) ) ( not ( = ?auto_194968 ?auto_194970 ) ) ( not ( = ?auto_194968 ?auto_194967 ) ) ( not ( = ?auto_194968 ?auto_194971 ) ) ( not ( = ?auto_194968 ?auto_194973 ) ) ( not ( = ?auto_194968 ?auto_194972 ) ) ( not ( = ?auto_194968 ?auto_194974 ) ) ( not ( = ?auto_194968 ?auto_194975 ) ) ( not ( = ?auto_194969 ?auto_194970 ) ) ( not ( = ?auto_194969 ?auto_194967 ) ) ( not ( = ?auto_194969 ?auto_194971 ) ) ( not ( = ?auto_194969 ?auto_194973 ) ) ( not ( = ?auto_194969 ?auto_194972 ) ) ( not ( = ?auto_194969 ?auto_194974 ) ) ( not ( = ?auto_194969 ?auto_194975 ) ) ( not ( = ?auto_194970 ?auto_194967 ) ) ( not ( = ?auto_194970 ?auto_194971 ) ) ( not ( = ?auto_194970 ?auto_194973 ) ) ( not ( = ?auto_194970 ?auto_194972 ) ) ( not ( = ?auto_194970 ?auto_194974 ) ) ( not ( = ?auto_194970 ?auto_194975 ) ) ( not ( = ?auto_194967 ?auto_194971 ) ) ( not ( = ?auto_194967 ?auto_194973 ) ) ( not ( = ?auto_194967 ?auto_194972 ) ) ( not ( = ?auto_194967 ?auto_194974 ) ) ( not ( = ?auto_194967 ?auto_194975 ) ) ( not ( = ?auto_194971 ?auto_194973 ) ) ( not ( = ?auto_194971 ?auto_194972 ) ) ( not ( = ?auto_194971 ?auto_194974 ) ) ( not ( = ?auto_194971 ?auto_194975 ) ) ( not ( = ?auto_194973 ?auto_194972 ) ) ( not ( = ?auto_194973 ?auto_194974 ) ) ( not ( = ?auto_194973 ?auto_194975 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_194972 ?auto_194974 ?auto_194975 )
      ( MAKE-8CRATE-VERIFY ?auto_194968 ?auto_194969 ?auto_194970 ?auto_194967 ?auto_194971 ?auto_194973 ?auto_194972 ?auto_194974 ?auto_194975 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_195044 - SURFACE
      ?auto_195045 - SURFACE
      ?auto_195046 - SURFACE
      ?auto_195043 - SURFACE
      ?auto_195047 - SURFACE
      ?auto_195049 - SURFACE
      ?auto_195048 - SURFACE
      ?auto_195050 - SURFACE
      ?auto_195051 - SURFACE
    )
    :vars
    (
      ?auto_195055 - HOIST
      ?auto_195052 - PLACE
      ?auto_195054 - TRUCK
      ?auto_195053 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_195055 ?auto_195052 ) ( SURFACE-AT ?auto_195050 ?auto_195052 ) ( CLEAR ?auto_195050 ) ( IS-CRATE ?auto_195051 ) ( not ( = ?auto_195050 ?auto_195051 ) ) ( AVAILABLE ?auto_195055 ) ( IN ?auto_195051 ?auto_195054 ) ( ON ?auto_195050 ?auto_195048 ) ( not ( = ?auto_195048 ?auto_195050 ) ) ( not ( = ?auto_195048 ?auto_195051 ) ) ( TRUCK-AT ?auto_195054 ?auto_195053 ) ( not ( = ?auto_195053 ?auto_195052 ) ) ( ON ?auto_195045 ?auto_195044 ) ( ON ?auto_195046 ?auto_195045 ) ( ON ?auto_195043 ?auto_195046 ) ( ON ?auto_195047 ?auto_195043 ) ( ON ?auto_195049 ?auto_195047 ) ( ON ?auto_195048 ?auto_195049 ) ( not ( = ?auto_195044 ?auto_195045 ) ) ( not ( = ?auto_195044 ?auto_195046 ) ) ( not ( = ?auto_195044 ?auto_195043 ) ) ( not ( = ?auto_195044 ?auto_195047 ) ) ( not ( = ?auto_195044 ?auto_195049 ) ) ( not ( = ?auto_195044 ?auto_195048 ) ) ( not ( = ?auto_195044 ?auto_195050 ) ) ( not ( = ?auto_195044 ?auto_195051 ) ) ( not ( = ?auto_195045 ?auto_195046 ) ) ( not ( = ?auto_195045 ?auto_195043 ) ) ( not ( = ?auto_195045 ?auto_195047 ) ) ( not ( = ?auto_195045 ?auto_195049 ) ) ( not ( = ?auto_195045 ?auto_195048 ) ) ( not ( = ?auto_195045 ?auto_195050 ) ) ( not ( = ?auto_195045 ?auto_195051 ) ) ( not ( = ?auto_195046 ?auto_195043 ) ) ( not ( = ?auto_195046 ?auto_195047 ) ) ( not ( = ?auto_195046 ?auto_195049 ) ) ( not ( = ?auto_195046 ?auto_195048 ) ) ( not ( = ?auto_195046 ?auto_195050 ) ) ( not ( = ?auto_195046 ?auto_195051 ) ) ( not ( = ?auto_195043 ?auto_195047 ) ) ( not ( = ?auto_195043 ?auto_195049 ) ) ( not ( = ?auto_195043 ?auto_195048 ) ) ( not ( = ?auto_195043 ?auto_195050 ) ) ( not ( = ?auto_195043 ?auto_195051 ) ) ( not ( = ?auto_195047 ?auto_195049 ) ) ( not ( = ?auto_195047 ?auto_195048 ) ) ( not ( = ?auto_195047 ?auto_195050 ) ) ( not ( = ?auto_195047 ?auto_195051 ) ) ( not ( = ?auto_195049 ?auto_195048 ) ) ( not ( = ?auto_195049 ?auto_195050 ) ) ( not ( = ?auto_195049 ?auto_195051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_195048 ?auto_195050 ?auto_195051 )
      ( MAKE-8CRATE-VERIFY ?auto_195044 ?auto_195045 ?auto_195046 ?auto_195043 ?auto_195047 ?auto_195049 ?auto_195048 ?auto_195050 ?auto_195051 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_195128 - SURFACE
      ?auto_195129 - SURFACE
      ?auto_195130 - SURFACE
      ?auto_195127 - SURFACE
      ?auto_195131 - SURFACE
      ?auto_195133 - SURFACE
      ?auto_195132 - SURFACE
      ?auto_195134 - SURFACE
      ?auto_195135 - SURFACE
    )
    :vars
    (
      ?auto_195138 - HOIST
      ?auto_195139 - PLACE
      ?auto_195140 - TRUCK
      ?auto_195137 - PLACE
      ?auto_195136 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_195138 ?auto_195139 ) ( SURFACE-AT ?auto_195134 ?auto_195139 ) ( CLEAR ?auto_195134 ) ( IS-CRATE ?auto_195135 ) ( not ( = ?auto_195134 ?auto_195135 ) ) ( AVAILABLE ?auto_195138 ) ( ON ?auto_195134 ?auto_195132 ) ( not ( = ?auto_195132 ?auto_195134 ) ) ( not ( = ?auto_195132 ?auto_195135 ) ) ( TRUCK-AT ?auto_195140 ?auto_195137 ) ( not ( = ?auto_195137 ?auto_195139 ) ) ( HOIST-AT ?auto_195136 ?auto_195137 ) ( LIFTING ?auto_195136 ?auto_195135 ) ( not ( = ?auto_195138 ?auto_195136 ) ) ( ON ?auto_195129 ?auto_195128 ) ( ON ?auto_195130 ?auto_195129 ) ( ON ?auto_195127 ?auto_195130 ) ( ON ?auto_195131 ?auto_195127 ) ( ON ?auto_195133 ?auto_195131 ) ( ON ?auto_195132 ?auto_195133 ) ( not ( = ?auto_195128 ?auto_195129 ) ) ( not ( = ?auto_195128 ?auto_195130 ) ) ( not ( = ?auto_195128 ?auto_195127 ) ) ( not ( = ?auto_195128 ?auto_195131 ) ) ( not ( = ?auto_195128 ?auto_195133 ) ) ( not ( = ?auto_195128 ?auto_195132 ) ) ( not ( = ?auto_195128 ?auto_195134 ) ) ( not ( = ?auto_195128 ?auto_195135 ) ) ( not ( = ?auto_195129 ?auto_195130 ) ) ( not ( = ?auto_195129 ?auto_195127 ) ) ( not ( = ?auto_195129 ?auto_195131 ) ) ( not ( = ?auto_195129 ?auto_195133 ) ) ( not ( = ?auto_195129 ?auto_195132 ) ) ( not ( = ?auto_195129 ?auto_195134 ) ) ( not ( = ?auto_195129 ?auto_195135 ) ) ( not ( = ?auto_195130 ?auto_195127 ) ) ( not ( = ?auto_195130 ?auto_195131 ) ) ( not ( = ?auto_195130 ?auto_195133 ) ) ( not ( = ?auto_195130 ?auto_195132 ) ) ( not ( = ?auto_195130 ?auto_195134 ) ) ( not ( = ?auto_195130 ?auto_195135 ) ) ( not ( = ?auto_195127 ?auto_195131 ) ) ( not ( = ?auto_195127 ?auto_195133 ) ) ( not ( = ?auto_195127 ?auto_195132 ) ) ( not ( = ?auto_195127 ?auto_195134 ) ) ( not ( = ?auto_195127 ?auto_195135 ) ) ( not ( = ?auto_195131 ?auto_195133 ) ) ( not ( = ?auto_195131 ?auto_195132 ) ) ( not ( = ?auto_195131 ?auto_195134 ) ) ( not ( = ?auto_195131 ?auto_195135 ) ) ( not ( = ?auto_195133 ?auto_195132 ) ) ( not ( = ?auto_195133 ?auto_195134 ) ) ( not ( = ?auto_195133 ?auto_195135 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_195132 ?auto_195134 ?auto_195135 )
      ( MAKE-8CRATE-VERIFY ?auto_195128 ?auto_195129 ?auto_195130 ?auto_195127 ?auto_195131 ?auto_195133 ?auto_195132 ?auto_195134 ?auto_195135 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_195220 - SURFACE
      ?auto_195221 - SURFACE
      ?auto_195222 - SURFACE
      ?auto_195219 - SURFACE
      ?auto_195223 - SURFACE
      ?auto_195225 - SURFACE
      ?auto_195224 - SURFACE
      ?auto_195226 - SURFACE
      ?auto_195227 - SURFACE
    )
    :vars
    (
      ?auto_195228 - HOIST
      ?auto_195229 - PLACE
      ?auto_195233 - TRUCK
      ?auto_195230 - PLACE
      ?auto_195232 - HOIST
      ?auto_195231 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_195228 ?auto_195229 ) ( SURFACE-AT ?auto_195226 ?auto_195229 ) ( CLEAR ?auto_195226 ) ( IS-CRATE ?auto_195227 ) ( not ( = ?auto_195226 ?auto_195227 ) ) ( AVAILABLE ?auto_195228 ) ( ON ?auto_195226 ?auto_195224 ) ( not ( = ?auto_195224 ?auto_195226 ) ) ( not ( = ?auto_195224 ?auto_195227 ) ) ( TRUCK-AT ?auto_195233 ?auto_195230 ) ( not ( = ?auto_195230 ?auto_195229 ) ) ( HOIST-AT ?auto_195232 ?auto_195230 ) ( not ( = ?auto_195228 ?auto_195232 ) ) ( AVAILABLE ?auto_195232 ) ( SURFACE-AT ?auto_195227 ?auto_195230 ) ( ON ?auto_195227 ?auto_195231 ) ( CLEAR ?auto_195227 ) ( not ( = ?auto_195226 ?auto_195231 ) ) ( not ( = ?auto_195227 ?auto_195231 ) ) ( not ( = ?auto_195224 ?auto_195231 ) ) ( ON ?auto_195221 ?auto_195220 ) ( ON ?auto_195222 ?auto_195221 ) ( ON ?auto_195219 ?auto_195222 ) ( ON ?auto_195223 ?auto_195219 ) ( ON ?auto_195225 ?auto_195223 ) ( ON ?auto_195224 ?auto_195225 ) ( not ( = ?auto_195220 ?auto_195221 ) ) ( not ( = ?auto_195220 ?auto_195222 ) ) ( not ( = ?auto_195220 ?auto_195219 ) ) ( not ( = ?auto_195220 ?auto_195223 ) ) ( not ( = ?auto_195220 ?auto_195225 ) ) ( not ( = ?auto_195220 ?auto_195224 ) ) ( not ( = ?auto_195220 ?auto_195226 ) ) ( not ( = ?auto_195220 ?auto_195227 ) ) ( not ( = ?auto_195220 ?auto_195231 ) ) ( not ( = ?auto_195221 ?auto_195222 ) ) ( not ( = ?auto_195221 ?auto_195219 ) ) ( not ( = ?auto_195221 ?auto_195223 ) ) ( not ( = ?auto_195221 ?auto_195225 ) ) ( not ( = ?auto_195221 ?auto_195224 ) ) ( not ( = ?auto_195221 ?auto_195226 ) ) ( not ( = ?auto_195221 ?auto_195227 ) ) ( not ( = ?auto_195221 ?auto_195231 ) ) ( not ( = ?auto_195222 ?auto_195219 ) ) ( not ( = ?auto_195222 ?auto_195223 ) ) ( not ( = ?auto_195222 ?auto_195225 ) ) ( not ( = ?auto_195222 ?auto_195224 ) ) ( not ( = ?auto_195222 ?auto_195226 ) ) ( not ( = ?auto_195222 ?auto_195227 ) ) ( not ( = ?auto_195222 ?auto_195231 ) ) ( not ( = ?auto_195219 ?auto_195223 ) ) ( not ( = ?auto_195219 ?auto_195225 ) ) ( not ( = ?auto_195219 ?auto_195224 ) ) ( not ( = ?auto_195219 ?auto_195226 ) ) ( not ( = ?auto_195219 ?auto_195227 ) ) ( not ( = ?auto_195219 ?auto_195231 ) ) ( not ( = ?auto_195223 ?auto_195225 ) ) ( not ( = ?auto_195223 ?auto_195224 ) ) ( not ( = ?auto_195223 ?auto_195226 ) ) ( not ( = ?auto_195223 ?auto_195227 ) ) ( not ( = ?auto_195223 ?auto_195231 ) ) ( not ( = ?auto_195225 ?auto_195224 ) ) ( not ( = ?auto_195225 ?auto_195226 ) ) ( not ( = ?auto_195225 ?auto_195227 ) ) ( not ( = ?auto_195225 ?auto_195231 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_195224 ?auto_195226 ?auto_195227 )
      ( MAKE-8CRATE-VERIFY ?auto_195220 ?auto_195221 ?auto_195222 ?auto_195219 ?auto_195223 ?auto_195225 ?auto_195224 ?auto_195226 ?auto_195227 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_195313 - SURFACE
      ?auto_195314 - SURFACE
      ?auto_195315 - SURFACE
      ?auto_195312 - SURFACE
      ?auto_195316 - SURFACE
      ?auto_195318 - SURFACE
      ?auto_195317 - SURFACE
      ?auto_195319 - SURFACE
      ?auto_195320 - SURFACE
    )
    :vars
    (
      ?auto_195326 - HOIST
      ?auto_195323 - PLACE
      ?auto_195322 - PLACE
      ?auto_195324 - HOIST
      ?auto_195325 - SURFACE
      ?auto_195321 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_195326 ?auto_195323 ) ( SURFACE-AT ?auto_195319 ?auto_195323 ) ( CLEAR ?auto_195319 ) ( IS-CRATE ?auto_195320 ) ( not ( = ?auto_195319 ?auto_195320 ) ) ( AVAILABLE ?auto_195326 ) ( ON ?auto_195319 ?auto_195317 ) ( not ( = ?auto_195317 ?auto_195319 ) ) ( not ( = ?auto_195317 ?auto_195320 ) ) ( not ( = ?auto_195322 ?auto_195323 ) ) ( HOIST-AT ?auto_195324 ?auto_195322 ) ( not ( = ?auto_195326 ?auto_195324 ) ) ( AVAILABLE ?auto_195324 ) ( SURFACE-AT ?auto_195320 ?auto_195322 ) ( ON ?auto_195320 ?auto_195325 ) ( CLEAR ?auto_195320 ) ( not ( = ?auto_195319 ?auto_195325 ) ) ( not ( = ?auto_195320 ?auto_195325 ) ) ( not ( = ?auto_195317 ?auto_195325 ) ) ( TRUCK-AT ?auto_195321 ?auto_195323 ) ( ON ?auto_195314 ?auto_195313 ) ( ON ?auto_195315 ?auto_195314 ) ( ON ?auto_195312 ?auto_195315 ) ( ON ?auto_195316 ?auto_195312 ) ( ON ?auto_195318 ?auto_195316 ) ( ON ?auto_195317 ?auto_195318 ) ( not ( = ?auto_195313 ?auto_195314 ) ) ( not ( = ?auto_195313 ?auto_195315 ) ) ( not ( = ?auto_195313 ?auto_195312 ) ) ( not ( = ?auto_195313 ?auto_195316 ) ) ( not ( = ?auto_195313 ?auto_195318 ) ) ( not ( = ?auto_195313 ?auto_195317 ) ) ( not ( = ?auto_195313 ?auto_195319 ) ) ( not ( = ?auto_195313 ?auto_195320 ) ) ( not ( = ?auto_195313 ?auto_195325 ) ) ( not ( = ?auto_195314 ?auto_195315 ) ) ( not ( = ?auto_195314 ?auto_195312 ) ) ( not ( = ?auto_195314 ?auto_195316 ) ) ( not ( = ?auto_195314 ?auto_195318 ) ) ( not ( = ?auto_195314 ?auto_195317 ) ) ( not ( = ?auto_195314 ?auto_195319 ) ) ( not ( = ?auto_195314 ?auto_195320 ) ) ( not ( = ?auto_195314 ?auto_195325 ) ) ( not ( = ?auto_195315 ?auto_195312 ) ) ( not ( = ?auto_195315 ?auto_195316 ) ) ( not ( = ?auto_195315 ?auto_195318 ) ) ( not ( = ?auto_195315 ?auto_195317 ) ) ( not ( = ?auto_195315 ?auto_195319 ) ) ( not ( = ?auto_195315 ?auto_195320 ) ) ( not ( = ?auto_195315 ?auto_195325 ) ) ( not ( = ?auto_195312 ?auto_195316 ) ) ( not ( = ?auto_195312 ?auto_195318 ) ) ( not ( = ?auto_195312 ?auto_195317 ) ) ( not ( = ?auto_195312 ?auto_195319 ) ) ( not ( = ?auto_195312 ?auto_195320 ) ) ( not ( = ?auto_195312 ?auto_195325 ) ) ( not ( = ?auto_195316 ?auto_195318 ) ) ( not ( = ?auto_195316 ?auto_195317 ) ) ( not ( = ?auto_195316 ?auto_195319 ) ) ( not ( = ?auto_195316 ?auto_195320 ) ) ( not ( = ?auto_195316 ?auto_195325 ) ) ( not ( = ?auto_195318 ?auto_195317 ) ) ( not ( = ?auto_195318 ?auto_195319 ) ) ( not ( = ?auto_195318 ?auto_195320 ) ) ( not ( = ?auto_195318 ?auto_195325 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_195317 ?auto_195319 ?auto_195320 )
      ( MAKE-8CRATE-VERIFY ?auto_195313 ?auto_195314 ?auto_195315 ?auto_195312 ?auto_195316 ?auto_195318 ?auto_195317 ?auto_195319 ?auto_195320 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_195406 - SURFACE
      ?auto_195407 - SURFACE
      ?auto_195408 - SURFACE
      ?auto_195405 - SURFACE
      ?auto_195409 - SURFACE
      ?auto_195411 - SURFACE
      ?auto_195410 - SURFACE
      ?auto_195412 - SURFACE
      ?auto_195413 - SURFACE
    )
    :vars
    (
      ?auto_195417 - HOIST
      ?auto_195419 - PLACE
      ?auto_195415 - PLACE
      ?auto_195414 - HOIST
      ?auto_195418 - SURFACE
      ?auto_195416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_195417 ?auto_195419 ) ( IS-CRATE ?auto_195413 ) ( not ( = ?auto_195412 ?auto_195413 ) ) ( not ( = ?auto_195410 ?auto_195412 ) ) ( not ( = ?auto_195410 ?auto_195413 ) ) ( not ( = ?auto_195415 ?auto_195419 ) ) ( HOIST-AT ?auto_195414 ?auto_195415 ) ( not ( = ?auto_195417 ?auto_195414 ) ) ( AVAILABLE ?auto_195414 ) ( SURFACE-AT ?auto_195413 ?auto_195415 ) ( ON ?auto_195413 ?auto_195418 ) ( CLEAR ?auto_195413 ) ( not ( = ?auto_195412 ?auto_195418 ) ) ( not ( = ?auto_195413 ?auto_195418 ) ) ( not ( = ?auto_195410 ?auto_195418 ) ) ( TRUCK-AT ?auto_195416 ?auto_195419 ) ( SURFACE-AT ?auto_195410 ?auto_195419 ) ( CLEAR ?auto_195410 ) ( LIFTING ?auto_195417 ?auto_195412 ) ( IS-CRATE ?auto_195412 ) ( ON ?auto_195407 ?auto_195406 ) ( ON ?auto_195408 ?auto_195407 ) ( ON ?auto_195405 ?auto_195408 ) ( ON ?auto_195409 ?auto_195405 ) ( ON ?auto_195411 ?auto_195409 ) ( ON ?auto_195410 ?auto_195411 ) ( not ( = ?auto_195406 ?auto_195407 ) ) ( not ( = ?auto_195406 ?auto_195408 ) ) ( not ( = ?auto_195406 ?auto_195405 ) ) ( not ( = ?auto_195406 ?auto_195409 ) ) ( not ( = ?auto_195406 ?auto_195411 ) ) ( not ( = ?auto_195406 ?auto_195410 ) ) ( not ( = ?auto_195406 ?auto_195412 ) ) ( not ( = ?auto_195406 ?auto_195413 ) ) ( not ( = ?auto_195406 ?auto_195418 ) ) ( not ( = ?auto_195407 ?auto_195408 ) ) ( not ( = ?auto_195407 ?auto_195405 ) ) ( not ( = ?auto_195407 ?auto_195409 ) ) ( not ( = ?auto_195407 ?auto_195411 ) ) ( not ( = ?auto_195407 ?auto_195410 ) ) ( not ( = ?auto_195407 ?auto_195412 ) ) ( not ( = ?auto_195407 ?auto_195413 ) ) ( not ( = ?auto_195407 ?auto_195418 ) ) ( not ( = ?auto_195408 ?auto_195405 ) ) ( not ( = ?auto_195408 ?auto_195409 ) ) ( not ( = ?auto_195408 ?auto_195411 ) ) ( not ( = ?auto_195408 ?auto_195410 ) ) ( not ( = ?auto_195408 ?auto_195412 ) ) ( not ( = ?auto_195408 ?auto_195413 ) ) ( not ( = ?auto_195408 ?auto_195418 ) ) ( not ( = ?auto_195405 ?auto_195409 ) ) ( not ( = ?auto_195405 ?auto_195411 ) ) ( not ( = ?auto_195405 ?auto_195410 ) ) ( not ( = ?auto_195405 ?auto_195412 ) ) ( not ( = ?auto_195405 ?auto_195413 ) ) ( not ( = ?auto_195405 ?auto_195418 ) ) ( not ( = ?auto_195409 ?auto_195411 ) ) ( not ( = ?auto_195409 ?auto_195410 ) ) ( not ( = ?auto_195409 ?auto_195412 ) ) ( not ( = ?auto_195409 ?auto_195413 ) ) ( not ( = ?auto_195409 ?auto_195418 ) ) ( not ( = ?auto_195411 ?auto_195410 ) ) ( not ( = ?auto_195411 ?auto_195412 ) ) ( not ( = ?auto_195411 ?auto_195413 ) ) ( not ( = ?auto_195411 ?auto_195418 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_195410 ?auto_195412 ?auto_195413 )
      ( MAKE-8CRATE-VERIFY ?auto_195406 ?auto_195407 ?auto_195408 ?auto_195405 ?auto_195409 ?auto_195411 ?auto_195410 ?auto_195412 ?auto_195413 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_195499 - SURFACE
      ?auto_195500 - SURFACE
      ?auto_195501 - SURFACE
      ?auto_195498 - SURFACE
      ?auto_195502 - SURFACE
      ?auto_195504 - SURFACE
      ?auto_195503 - SURFACE
      ?auto_195505 - SURFACE
      ?auto_195506 - SURFACE
    )
    :vars
    (
      ?auto_195507 - HOIST
      ?auto_195509 - PLACE
      ?auto_195511 - PLACE
      ?auto_195512 - HOIST
      ?auto_195510 - SURFACE
      ?auto_195508 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_195507 ?auto_195509 ) ( IS-CRATE ?auto_195506 ) ( not ( = ?auto_195505 ?auto_195506 ) ) ( not ( = ?auto_195503 ?auto_195505 ) ) ( not ( = ?auto_195503 ?auto_195506 ) ) ( not ( = ?auto_195511 ?auto_195509 ) ) ( HOIST-AT ?auto_195512 ?auto_195511 ) ( not ( = ?auto_195507 ?auto_195512 ) ) ( AVAILABLE ?auto_195512 ) ( SURFACE-AT ?auto_195506 ?auto_195511 ) ( ON ?auto_195506 ?auto_195510 ) ( CLEAR ?auto_195506 ) ( not ( = ?auto_195505 ?auto_195510 ) ) ( not ( = ?auto_195506 ?auto_195510 ) ) ( not ( = ?auto_195503 ?auto_195510 ) ) ( TRUCK-AT ?auto_195508 ?auto_195509 ) ( SURFACE-AT ?auto_195503 ?auto_195509 ) ( CLEAR ?auto_195503 ) ( IS-CRATE ?auto_195505 ) ( AVAILABLE ?auto_195507 ) ( IN ?auto_195505 ?auto_195508 ) ( ON ?auto_195500 ?auto_195499 ) ( ON ?auto_195501 ?auto_195500 ) ( ON ?auto_195498 ?auto_195501 ) ( ON ?auto_195502 ?auto_195498 ) ( ON ?auto_195504 ?auto_195502 ) ( ON ?auto_195503 ?auto_195504 ) ( not ( = ?auto_195499 ?auto_195500 ) ) ( not ( = ?auto_195499 ?auto_195501 ) ) ( not ( = ?auto_195499 ?auto_195498 ) ) ( not ( = ?auto_195499 ?auto_195502 ) ) ( not ( = ?auto_195499 ?auto_195504 ) ) ( not ( = ?auto_195499 ?auto_195503 ) ) ( not ( = ?auto_195499 ?auto_195505 ) ) ( not ( = ?auto_195499 ?auto_195506 ) ) ( not ( = ?auto_195499 ?auto_195510 ) ) ( not ( = ?auto_195500 ?auto_195501 ) ) ( not ( = ?auto_195500 ?auto_195498 ) ) ( not ( = ?auto_195500 ?auto_195502 ) ) ( not ( = ?auto_195500 ?auto_195504 ) ) ( not ( = ?auto_195500 ?auto_195503 ) ) ( not ( = ?auto_195500 ?auto_195505 ) ) ( not ( = ?auto_195500 ?auto_195506 ) ) ( not ( = ?auto_195500 ?auto_195510 ) ) ( not ( = ?auto_195501 ?auto_195498 ) ) ( not ( = ?auto_195501 ?auto_195502 ) ) ( not ( = ?auto_195501 ?auto_195504 ) ) ( not ( = ?auto_195501 ?auto_195503 ) ) ( not ( = ?auto_195501 ?auto_195505 ) ) ( not ( = ?auto_195501 ?auto_195506 ) ) ( not ( = ?auto_195501 ?auto_195510 ) ) ( not ( = ?auto_195498 ?auto_195502 ) ) ( not ( = ?auto_195498 ?auto_195504 ) ) ( not ( = ?auto_195498 ?auto_195503 ) ) ( not ( = ?auto_195498 ?auto_195505 ) ) ( not ( = ?auto_195498 ?auto_195506 ) ) ( not ( = ?auto_195498 ?auto_195510 ) ) ( not ( = ?auto_195502 ?auto_195504 ) ) ( not ( = ?auto_195502 ?auto_195503 ) ) ( not ( = ?auto_195502 ?auto_195505 ) ) ( not ( = ?auto_195502 ?auto_195506 ) ) ( not ( = ?auto_195502 ?auto_195510 ) ) ( not ( = ?auto_195504 ?auto_195503 ) ) ( not ( = ?auto_195504 ?auto_195505 ) ) ( not ( = ?auto_195504 ?auto_195506 ) ) ( not ( = ?auto_195504 ?auto_195510 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_195503 ?auto_195505 ?auto_195506 )
      ( MAKE-8CRATE-VERIFY ?auto_195499 ?auto_195500 ?auto_195501 ?auto_195498 ?auto_195502 ?auto_195504 ?auto_195503 ?auto_195505 ?auto_195506 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_196793 - SURFACE
      ?auto_196794 - SURFACE
    )
    :vars
    (
      ?auto_196795 - HOIST
      ?auto_196799 - PLACE
      ?auto_196796 - SURFACE
      ?auto_196801 - TRUCK
      ?auto_196798 - PLACE
      ?auto_196800 - HOIST
      ?auto_196797 - SURFACE
      ?auto_196802 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_196795 ?auto_196799 ) ( SURFACE-AT ?auto_196793 ?auto_196799 ) ( CLEAR ?auto_196793 ) ( IS-CRATE ?auto_196794 ) ( not ( = ?auto_196793 ?auto_196794 ) ) ( AVAILABLE ?auto_196795 ) ( ON ?auto_196793 ?auto_196796 ) ( not ( = ?auto_196796 ?auto_196793 ) ) ( not ( = ?auto_196796 ?auto_196794 ) ) ( TRUCK-AT ?auto_196801 ?auto_196798 ) ( not ( = ?auto_196798 ?auto_196799 ) ) ( HOIST-AT ?auto_196800 ?auto_196798 ) ( not ( = ?auto_196795 ?auto_196800 ) ) ( SURFACE-AT ?auto_196794 ?auto_196798 ) ( ON ?auto_196794 ?auto_196797 ) ( CLEAR ?auto_196794 ) ( not ( = ?auto_196793 ?auto_196797 ) ) ( not ( = ?auto_196794 ?auto_196797 ) ) ( not ( = ?auto_196796 ?auto_196797 ) ) ( LIFTING ?auto_196800 ?auto_196802 ) ( IS-CRATE ?auto_196802 ) ( not ( = ?auto_196793 ?auto_196802 ) ) ( not ( = ?auto_196794 ?auto_196802 ) ) ( not ( = ?auto_196796 ?auto_196802 ) ) ( not ( = ?auto_196797 ?auto_196802 ) ) )
    :subtasks
    ( ( !LOAD ?auto_196800 ?auto_196802 ?auto_196801 ?auto_196798 )
      ( MAKE-1CRATE ?auto_196793 ?auto_196794 )
      ( MAKE-1CRATE-VERIFY ?auto_196793 ?auto_196794 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_199603 - SURFACE
      ?auto_199604 - SURFACE
      ?auto_199605 - SURFACE
      ?auto_199602 - SURFACE
      ?auto_199606 - SURFACE
      ?auto_199608 - SURFACE
      ?auto_199607 - SURFACE
      ?auto_199609 - SURFACE
      ?auto_199610 - SURFACE
      ?auto_199611 - SURFACE
    )
    :vars
    (
      ?auto_199612 - HOIST
      ?auto_199613 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_199612 ?auto_199613 ) ( SURFACE-AT ?auto_199610 ?auto_199613 ) ( CLEAR ?auto_199610 ) ( LIFTING ?auto_199612 ?auto_199611 ) ( IS-CRATE ?auto_199611 ) ( not ( = ?auto_199610 ?auto_199611 ) ) ( ON ?auto_199604 ?auto_199603 ) ( ON ?auto_199605 ?auto_199604 ) ( ON ?auto_199602 ?auto_199605 ) ( ON ?auto_199606 ?auto_199602 ) ( ON ?auto_199608 ?auto_199606 ) ( ON ?auto_199607 ?auto_199608 ) ( ON ?auto_199609 ?auto_199607 ) ( ON ?auto_199610 ?auto_199609 ) ( not ( = ?auto_199603 ?auto_199604 ) ) ( not ( = ?auto_199603 ?auto_199605 ) ) ( not ( = ?auto_199603 ?auto_199602 ) ) ( not ( = ?auto_199603 ?auto_199606 ) ) ( not ( = ?auto_199603 ?auto_199608 ) ) ( not ( = ?auto_199603 ?auto_199607 ) ) ( not ( = ?auto_199603 ?auto_199609 ) ) ( not ( = ?auto_199603 ?auto_199610 ) ) ( not ( = ?auto_199603 ?auto_199611 ) ) ( not ( = ?auto_199604 ?auto_199605 ) ) ( not ( = ?auto_199604 ?auto_199602 ) ) ( not ( = ?auto_199604 ?auto_199606 ) ) ( not ( = ?auto_199604 ?auto_199608 ) ) ( not ( = ?auto_199604 ?auto_199607 ) ) ( not ( = ?auto_199604 ?auto_199609 ) ) ( not ( = ?auto_199604 ?auto_199610 ) ) ( not ( = ?auto_199604 ?auto_199611 ) ) ( not ( = ?auto_199605 ?auto_199602 ) ) ( not ( = ?auto_199605 ?auto_199606 ) ) ( not ( = ?auto_199605 ?auto_199608 ) ) ( not ( = ?auto_199605 ?auto_199607 ) ) ( not ( = ?auto_199605 ?auto_199609 ) ) ( not ( = ?auto_199605 ?auto_199610 ) ) ( not ( = ?auto_199605 ?auto_199611 ) ) ( not ( = ?auto_199602 ?auto_199606 ) ) ( not ( = ?auto_199602 ?auto_199608 ) ) ( not ( = ?auto_199602 ?auto_199607 ) ) ( not ( = ?auto_199602 ?auto_199609 ) ) ( not ( = ?auto_199602 ?auto_199610 ) ) ( not ( = ?auto_199602 ?auto_199611 ) ) ( not ( = ?auto_199606 ?auto_199608 ) ) ( not ( = ?auto_199606 ?auto_199607 ) ) ( not ( = ?auto_199606 ?auto_199609 ) ) ( not ( = ?auto_199606 ?auto_199610 ) ) ( not ( = ?auto_199606 ?auto_199611 ) ) ( not ( = ?auto_199608 ?auto_199607 ) ) ( not ( = ?auto_199608 ?auto_199609 ) ) ( not ( = ?auto_199608 ?auto_199610 ) ) ( not ( = ?auto_199608 ?auto_199611 ) ) ( not ( = ?auto_199607 ?auto_199609 ) ) ( not ( = ?auto_199607 ?auto_199610 ) ) ( not ( = ?auto_199607 ?auto_199611 ) ) ( not ( = ?auto_199609 ?auto_199610 ) ) ( not ( = ?auto_199609 ?auto_199611 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_199610 ?auto_199611 )
      ( MAKE-9CRATE-VERIFY ?auto_199603 ?auto_199604 ?auto_199605 ?auto_199602 ?auto_199606 ?auto_199608 ?auto_199607 ?auto_199609 ?auto_199610 ?auto_199611 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_199683 - SURFACE
      ?auto_199684 - SURFACE
      ?auto_199685 - SURFACE
      ?auto_199682 - SURFACE
      ?auto_199686 - SURFACE
      ?auto_199688 - SURFACE
      ?auto_199687 - SURFACE
      ?auto_199689 - SURFACE
      ?auto_199690 - SURFACE
      ?auto_199691 - SURFACE
    )
    :vars
    (
      ?auto_199693 - HOIST
      ?auto_199692 - PLACE
      ?auto_199694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_199693 ?auto_199692 ) ( SURFACE-AT ?auto_199690 ?auto_199692 ) ( CLEAR ?auto_199690 ) ( IS-CRATE ?auto_199691 ) ( not ( = ?auto_199690 ?auto_199691 ) ) ( TRUCK-AT ?auto_199694 ?auto_199692 ) ( AVAILABLE ?auto_199693 ) ( IN ?auto_199691 ?auto_199694 ) ( ON ?auto_199690 ?auto_199689 ) ( not ( = ?auto_199689 ?auto_199690 ) ) ( not ( = ?auto_199689 ?auto_199691 ) ) ( ON ?auto_199684 ?auto_199683 ) ( ON ?auto_199685 ?auto_199684 ) ( ON ?auto_199682 ?auto_199685 ) ( ON ?auto_199686 ?auto_199682 ) ( ON ?auto_199688 ?auto_199686 ) ( ON ?auto_199687 ?auto_199688 ) ( ON ?auto_199689 ?auto_199687 ) ( not ( = ?auto_199683 ?auto_199684 ) ) ( not ( = ?auto_199683 ?auto_199685 ) ) ( not ( = ?auto_199683 ?auto_199682 ) ) ( not ( = ?auto_199683 ?auto_199686 ) ) ( not ( = ?auto_199683 ?auto_199688 ) ) ( not ( = ?auto_199683 ?auto_199687 ) ) ( not ( = ?auto_199683 ?auto_199689 ) ) ( not ( = ?auto_199683 ?auto_199690 ) ) ( not ( = ?auto_199683 ?auto_199691 ) ) ( not ( = ?auto_199684 ?auto_199685 ) ) ( not ( = ?auto_199684 ?auto_199682 ) ) ( not ( = ?auto_199684 ?auto_199686 ) ) ( not ( = ?auto_199684 ?auto_199688 ) ) ( not ( = ?auto_199684 ?auto_199687 ) ) ( not ( = ?auto_199684 ?auto_199689 ) ) ( not ( = ?auto_199684 ?auto_199690 ) ) ( not ( = ?auto_199684 ?auto_199691 ) ) ( not ( = ?auto_199685 ?auto_199682 ) ) ( not ( = ?auto_199685 ?auto_199686 ) ) ( not ( = ?auto_199685 ?auto_199688 ) ) ( not ( = ?auto_199685 ?auto_199687 ) ) ( not ( = ?auto_199685 ?auto_199689 ) ) ( not ( = ?auto_199685 ?auto_199690 ) ) ( not ( = ?auto_199685 ?auto_199691 ) ) ( not ( = ?auto_199682 ?auto_199686 ) ) ( not ( = ?auto_199682 ?auto_199688 ) ) ( not ( = ?auto_199682 ?auto_199687 ) ) ( not ( = ?auto_199682 ?auto_199689 ) ) ( not ( = ?auto_199682 ?auto_199690 ) ) ( not ( = ?auto_199682 ?auto_199691 ) ) ( not ( = ?auto_199686 ?auto_199688 ) ) ( not ( = ?auto_199686 ?auto_199687 ) ) ( not ( = ?auto_199686 ?auto_199689 ) ) ( not ( = ?auto_199686 ?auto_199690 ) ) ( not ( = ?auto_199686 ?auto_199691 ) ) ( not ( = ?auto_199688 ?auto_199687 ) ) ( not ( = ?auto_199688 ?auto_199689 ) ) ( not ( = ?auto_199688 ?auto_199690 ) ) ( not ( = ?auto_199688 ?auto_199691 ) ) ( not ( = ?auto_199687 ?auto_199689 ) ) ( not ( = ?auto_199687 ?auto_199690 ) ) ( not ( = ?auto_199687 ?auto_199691 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_199689 ?auto_199690 ?auto_199691 )
      ( MAKE-9CRATE-VERIFY ?auto_199683 ?auto_199684 ?auto_199685 ?auto_199682 ?auto_199686 ?auto_199688 ?auto_199687 ?auto_199689 ?auto_199690 ?auto_199691 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_199773 - SURFACE
      ?auto_199774 - SURFACE
      ?auto_199775 - SURFACE
      ?auto_199772 - SURFACE
      ?auto_199776 - SURFACE
      ?auto_199778 - SURFACE
      ?auto_199777 - SURFACE
      ?auto_199779 - SURFACE
      ?auto_199780 - SURFACE
      ?auto_199781 - SURFACE
    )
    :vars
    (
      ?auto_199785 - HOIST
      ?auto_199783 - PLACE
      ?auto_199784 - TRUCK
      ?auto_199782 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_199785 ?auto_199783 ) ( SURFACE-AT ?auto_199780 ?auto_199783 ) ( CLEAR ?auto_199780 ) ( IS-CRATE ?auto_199781 ) ( not ( = ?auto_199780 ?auto_199781 ) ) ( AVAILABLE ?auto_199785 ) ( IN ?auto_199781 ?auto_199784 ) ( ON ?auto_199780 ?auto_199779 ) ( not ( = ?auto_199779 ?auto_199780 ) ) ( not ( = ?auto_199779 ?auto_199781 ) ) ( TRUCK-AT ?auto_199784 ?auto_199782 ) ( not ( = ?auto_199782 ?auto_199783 ) ) ( ON ?auto_199774 ?auto_199773 ) ( ON ?auto_199775 ?auto_199774 ) ( ON ?auto_199772 ?auto_199775 ) ( ON ?auto_199776 ?auto_199772 ) ( ON ?auto_199778 ?auto_199776 ) ( ON ?auto_199777 ?auto_199778 ) ( ON ?auto_199779 ?auto_199777 ) ( not ( = ?auto_199773 ?auto_199774 ) ) ( not ( = ?auto_199773 ?auto_199775 ) ) ( not ( = ?auto_199773 ?auto_199772 ) ) ( not ( = ?auto_199773 ?auto_199776 ) ) ( not ( = ?auto_199773 ?auto_199778 ) ) ( not ( = ?auto_199773 ?auto_199777 ) ) ( not ( = ?auto_199773 ?auto_199779 ) ) ( not ( = ?auto_199773 ?auto_199780 ) ) ( not ( = ?auto_199773 ?auto_199781 ) ) ( not ( = ?auto_199774 ?auto_199775 ) ) ( not ( = ?auto_199774 ?auto_199772 ) ) ( not ( = ?auto_199774 ?auto_199776 ) ) ( not ( = ?auto_199774 ?auto_199778 ) ) ( not ( = ?auto_199774 ?auto_199777 ) ) ( not ( = ?auto_199774 ?auto_199779 ) ) ( not ( = ?auto_199774 ?auto_199780 ) ) ( not ( = ?auto_199774 ?auto_199781 ) ) ( not ( = ?auto_199775 ?auto_199772 ) ) ( not ( = ?auto_199775 ?auto_199776 ) ) ( not ( = ?auto_199775 ?auto_199778 ) ) ( not ( = ?auto_199775 ?auto_199777 ) ) ( not ( = ?auto_199775 ?auto_199779 ) ) ( not ( = ?auto_199775 ?auto_199780 ) ) ( not ( = ?auto_199775 ?auto_199781 ) ) ( not ( = ?auto_199772 ?auto_199776 ) ) ( not ( = ?auto_199772 ?auto_199778 ) ) ( not ( = ?auto_199772 ?auto_199777 ) ) ( not ( = ?auto_199772 ?auto_199779 ) ) ( not ( = ?auto_199772 ?auto_199780 ) ) ( not ( = ?auto_199772 ?auto_199781 ) ) ( not ( = ?auto_199776 ?auto_199778 ) ) ( not ( = ?auto_199776 ?auto_199777 ) ) ( not ( = ?auto_199776 ?auto_199779 ) ) ( not ( = ?auto_199776 ?auto_199780 ) ) ( not ( = ?auto_199776 ?auto_199781 ) ) ( not ( = ?auto_199778 ?auto_199777 ) ) ( not ( = ?auto_199778 ?auto_199779 ) ) ( not ( = ?auto_199778 ?auto_199780 ) ) ( not ( = ?auto_199778 ?auto_199781 ) ) ( not ( = ?auto_199777 ?auto_199779 ) ) ( not ( = ?auto_199777 ?auto_199780 ) ) ( not ( = ?auto_199777 ?auto_199781 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_199779 ?auto_199780 ?auto_199781 )
      ( MAKE-9CRATE-VERIFY ?auto_199773 ?auto_199774 ?auto_199775 ?auto_199772 ?auto_199776 ?auto_199778 ?auto_199777 ?auto_199779 ?auto_199780 ?auto_199781 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_199872 - SURFACE
      ?auto_199873 - SURFACE
      ?auto_199874 - SURFACE
      ?auto_199871 - SURFACE
      ?auto_199875 - SURFACE
      ?auto_199877 - SURFACE
      ?auto_199876 - SURFACE
      ?auto_199878 - SURFACE
      ?auto_199879 - SURFACE
      ?auto_199880 - SURFACE
    )
    :vars
    (
      ?auto_199882 - HOIST
      ?auto_199884 - PLACE
      ?auto_199885 - TRUCK
      ?auto_199881 - PLACE
      ?auto_199883 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_199882 ?auto_199884 ) ( SURFACE-AT ?auto_199879 ?auto_199884 ) ( CLEAR ?auto_199879 ) ( IS-CRATE ?auto_199880 ) ( not ( = ?auto_199879 ?auto_199880 ) ) ( AVAILABLE ?auto_199882 ) ( ON ?auto_199879 ?auto_199878 ) ( not ( = ?auto_199878 ?auto_199879 ) ) ( not ( = ?auto_199878 ?auto_199880 ) ) ( TRUCK-AT ?auto_199885 ?auto_199881 ) ( not ( = ?auto_199881 ?auto_199884 ) ) ( HOIST-AT ?auto_199883 ?auto_199881 ) ( LIFTING ?auto_199883 ?auto_199880 ) ( not ( = ?auto_199882 ?auto_199883 ) ) ( ON ?auto_199873 ?auto_199872 ) ( ON ?auto_199874 ?auto_199873 ) ( ON ?auto_199871 ?auto_199874 ) ( ON ?auto_199875 ?auto_199871 ) ( ON ?auto_199877 ?auto_199875 ) ( ON ?auto_199876 ?auto_199877 ) ( ON ?auto_199878 ?auto_199876 ) ( not ( = ?auto_199872 ?auto_199873 ) ) ( not ( = ?auto_199872 ?auto_199874 ) ) ( not ( = ?auto_199872 ?auto_199871 ) ) ( not ( = ?auto_199872 ?auto_199875 ) ) ( not ( = ?auto_199872 ?auto_199877 ) ) ( not ( = ?auto_199872 ?auto_199876 ) ) ( not ( = ?auto_199872 ?auto_199878 ) ) ( not ( = ?auto_199872 ?auto_199879 ) ) ( not ( = ?auto_199872 ?auto_199880 ) ) ( not ( = ?auto_199873 ?auto_199874 ) ) ( not ( = ?auto_199873 ?auto_199871 ) ) ( not ( = ?auto_199873 ?auto_199875 ) ) ( not ( = ?auto_199873 ?auto_199877 ) ) ( not ( = ?auto_199873 ?auto_199876 ) ) ( not ( = ?auto_199873 ?auto_199878 ) ) ( not ( = ?auto_199873 ?auto_199879 ) ) ( not ( = ?auto_199873 ?auto_199880 ) ) ( not ( = ?auto_199874 ?auto_199871 ) ) ( not ( = ?auto_199874 ?auto_199875 ) ) ( not ( = ?auto_199874 ?auto_199877 ) ) ( not ( = ?auto_199874 ?auto_199876 ) ) ( not ( = ?auto_199874 ?auto_199878 ) ) ( not ( = ?auto_199874 ?auto_199879 ) ) ( not ( = ?auto_199874 ?auto_199880 ) ) ( not ( = ?auto_199871 ?auto_199875 ) ) ( not ( = ?auto_199871 ?auto_199877 ) ) ( not ( = ?auto_199871 ?auto_199876 ) ) ( not ( = ?auto_199871 ?auto_199878 ) ) ( not ( = ?auto_199871 ?auto_199879 ) ) ( not ( = ?auto_199871 ?auto_199880 ) ) ( not ( = ?auto_199875 ?auto_199877 ) ) ( not ( = ?auto_199875 ?auto_199876 ) ) ( not ( = ?auto_199875 ?auto_199878 ) ) ( not ( = ?auto_199875 ?auto_199879 ) ) ( not ( = ?auto_199875 ?auto_199880 ) ) ( not ( = ?auto_199877 ?auto_199876 ) ) ( not ( = ?auto_199877 ?auto_199878 ) ) ( not ( = ?auto_199877 ?auto_199879 ) ) ( not ( = ?auto_199877 ?auto_199880 ) ) ( not ( = ?auto_199876 ?auto_199878 ) ) ( not ( = ?auto_199876 ?auto_199879 ) ) ( not ( = ?auto_199876 ?auto_199880 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_199878 ?auto_199879 ?auto_199880 )
      ( MAKE-9CRATE-VERIFY ?auto_199872 ?auto_199873 ?auto_199874 ?auto_199871 ?auto_199875 ?auto_199877 ?auto_199876 ?auto_199878 ?auto_199879 ?auto_199880 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_199980 - SURFACE
      ?auto_199981 - SURFACE
      ?auto_199982 - SURFACE
      ?auto_199979 - SURFACE
      ?auto_199983 - SURFACE
      ?auto_199985 - SURFACE
      ?auto_199984 - SURFACE
      ?auto_199986 - SURFACE
      ?auto_199987 - SURFACE
      ?auto_199988 - SURFACE
    )
    :vars
    (
      ?auto_199989 - HOIST
      ?auto_199992 - PLACE
      ?auto_199994 - TRUCK
      ?auto_199990 - PLACE
      ?auto_199993 - HOIST
      ?auto_199991 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_199989 ?auto_199992 ) ( SURFACE-AT ?auto_199987 ?auto_199992 ) ( CLEAR ?auto_199987 ) ( IS-CRATE ?auto_199988 ) ( not ( = ?auto_199987 ?auto_199988 ) ) ( AVAILABLE ?auto_199989 ) ( ON ?auto_199987 ?auto_199986 ) ( not ( = ?auto_199986 ?auto_199987 ) ) ( not ( = ?auto_199986 ?auto_199988 ) ) ( TRUCK-AT ?auto_199994 ?auto_199990 ) ( not ( = ?auto_199990 ?auto_199992 ) ) ( HOIST-AT ?auto_199993 ?auto_199990 ) ( not ( = ?auto_199989 ?auto_199993 ) ) ( AVAILABLE ?auto_199993 ) ( SURFACE-AT ?auto_199988 ?auto_199990 ) ( ON ?auto_199988 ?auto_199991 ) ( CLEAR ?auto_199988 ) ( not ( = ?auto_199987 ?auto_199991 ) ) ( not ( = ?auto_199988 ?auto_199991 ) ) ( not ( = ?auto_199986 ?auto_199991 ) ) ( ON ?auto_199981 ?auto_199980 ) ( ON ?auto_199982 ?auto_199981 ) ( ON ?auto_199979 ?auto_199982 ) ( ON ?auto_199983 ?auto_199979 ) ( ON ?auto_199985 ?auto_199983 ) ( ON ?auto_199984 ?auto_199985 ) ( ON ?auto_199986 ?auto_199984 ) ( not ( = ?auto_199980 ?auto_199981 ) ) ( not ( = ?auto_199980 ?auto_199982 ) ) ( not ( = ?auto_199980 ?auto_199979 ) ) ( not ( = ?auto_199980 ?auto_199983 ) ) ( not ( = ?auto_199980 ?auto_199985 ) ) ( not ( = ?auto_199980 ?auto_199984 ) ) ( not ( = ?auto_199980 ?auto_199986 ) ) ( not ( = ?auto_199980 ?auto_199987 ) ) ( not ( = ?auto_199980 ?auto_199988 ) ) ( not ( = ?auto_199980 ?auto_199991 ) ) ( not ( = ?auto_199981 ?auto_199982 ) ) ( not ( = ?auto_199981 ?auto_199979 ) ) ( not ( = ?auto_199981 ?auto_199983 ) ) ( not ( = ?auto_199981 ?auto_199985 ) ) ( not ( = ?auto_199981 ?auto_199984 ) ) ( not ( = ?auto_199981 ?auto_199986 ) ) ( not ( = ?auto_199981 ?auto_199987 ) ) ( not ( = ?auto_199981 ?auto_199988 ) ) ( not ( = ?auto_199981 ?auto_199991 ) ) ( not ( = ?auto_199982 ?auto_199979 ) ) ( not ( = ?auto_199982 ?auto_199983 ) ) ( not ( = ?auto_199982 ?auto_199985 ) ) ( not ( = ?auto_199982 ?auto_199984 ) ) ( not ( = ?auto_199982 ?auto_199986 ) ) ( not ( = ?auto_199982 ?auto_199987 ) ) ( not ( = ?auto_199982 ?auto_199988 ) ) ( not ( = ?auto_199982 ?auto_199991 ) ) ( not ( = ?auto_199979 ?auto_199983 ) ) ( not ( = ?auto_199979 ?auto_199985 ) ) ( not ( = ?auto_199979 ?auto_199984 ) ) ( not ( = ?auto_199979 ?auto_199986 ) ) ( not ( = ?auto_199979 ?auto_199987 ) ) ( not ( = ?auto_199979 ?auto_199988 ) ) ( not ( = ?auto_199979 ?auto_199991 ) ) ( not ( = ?auto_199983 ?auto_199985 ) ) ( not ( = ?auto_199983 ?auto_199984 ) ) ( not ( = ?auto_199983 ?auto_199986 ) ) ( not ( = ?auto_199983 ?auto_199987 ) ) ( not ( = ?auto_199983 ?auto_199988 ) ) ( not ( = ?auto_199983 ?auto_199991 ) ) ( not ( = ?auto_199985 ?auto_199984 ) ) ( not ( = ?auto_199985 ?auto_199986 ) ) ( not ( = ?auto_199985 ?auto_199987 ) ) ( not ( = ?auto_199985 ?auto_199988 ) ) ( not ( = ?auto_199985 ?auto_199991 ) ) ( not ( = ?auto_199984 ?auto_199986 ) ) ( not ( = ?auto_199984 ?auto_199987 ) ) ( not ( = ?auto_199984 ?auto_199988 ) ) ( not ( = ?auto_199984 ?auto_199991 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_199986 ?auto_199987 ?auto_199988 )
      ( MAKE-9CRATE-VERIFY ?auto_199980 ?auto_199981 ?auto_199982 ?auto_199979 ?auto_199983 ?auto_199985 ?auto_199984 ?auto_199986 ?auto_199987 ?auto_199988 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_200089 - SURFACE
      ?auto_200090 - SURFACE
      ?auto_200091 - SURFACE
      ?auto_200088 - SURFACE
      ?auto_200092 - SURFACE
      ?auto_200094 - SURFACE
      ?auto_200093 - SURFACE
      ?auto_200095 - SURFACE
      ?auto_200096 - SURFACE
      ?auto_200097 - SURFACE
    )
    :vars
    (
      ?auto_200101 - HOIST
      ?auto_200100 - PLACE
      ?auto_200099 - PLACE
      ?auto_200098 - HOIST
      ?auto_200103 - SURFACE
      ?auto_200102 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_200101 ?auto_200100 ) ( SURFACE-AT ?auto_200096 ?auto_200100 ) ( CLEAR ?auto_200096 ) ( IS-CRATE ?auto_200097 ) ( not ( = ?auto_200096 ?auto_200097 ) ) ( AVAILABLE ?auto_200101 ) ( ON ?auto_200096 ?auto_200095 ) ( not ( = ?auto_200095 ?auto_200096 ) ) ( not ( = ?auto_200095 ?auto_200097 ) ) ( not ( = ?auto_200099 ?auto_200100 ) ) ( HOIST-AT ?auto_200098 ?auto_200099 ) ( not ( = ?auto_200101 ?auto_200098 ) ) ( AVAILABLE ?auto_200098 ) ( SURFACE-AT ?auto_200097 ?auto_200099 ) ( ON ?auto_200097 ?auto_200103 ) ( CLEAR ?auto_200097 ) ( not ( = ?auto_200096 ?auto_200103 ) ) ( not ( = ?auto_200097 ?auto_200103 ) ) ( not ( = ?auto_200095 ?auto_200103 ) ) ( TRUCK-AT ?auto_200102 ?auto_200100 ) ( ON ?auto_200090 ?auto_200089 ) ( ON ?auto_200091 ?auto_200090 ) ( ON ?auto_200088 ?auto_200091 ) ( ON ?auto_200092 ?auto_200088 ) ( ON ?auto_200094 ?auto_200092 ) ( ON ?auto_200093 ?auto_200094 ) ( ON ?auto_200095 ?auto_200093 ) ( not ( = ?auto_200089 ?auto_200090 ) ) ( not ( = ?auto_200089 ?auto_200091 ) ) ( not ( = ?auto_200089 ?auto_200088 ) ) ( not ( = ?auto_200089 ?auto_200092 ) ) ( not ( = ?auto_200089 ?auto_200094 ) ) ( not ( = ?auto_200089 ?auto_200093 ) ) ( not ( = ?auto_200089 ?auto_200095 ) ) ( not ( = ?auto_200089 ?auto_200096 ) ) ( not ( = ?auto_200089 ?auto_200097 ) ) ( not ( = ?auto_200089 ?auto_200103 ) ) ( not ( = ?auto_200090 ?auto_200091 ) ) ( not ( = ?auto_200090 ?auto_200088 ) ) ( not ( = ?auto_200090 ?auto_200092 ) ) ( not ( = ?auto_200090 ?auto_200094 ) ) ( not ( = ?auto_200090 ?auto_200093 ) ) ( not ( = ?auto_200090 ?auto_200095 ) ) ( not ( = ?auto_200090 ?auto_200096 ) ) ( not ( = ?auto_200090 ?auto_200097 ) ) ( not ( = ?auto_200090 ?auto_200103 ) ) ( not ( = ?auto_200091 ?auto_200088 ) ) ( not ( = ?auto_200091 ?auto_200092 ) ) ( not ( = ?auto_200091 ?auto_200094 ) ) ( not ( = ?auto_200091 ?auto_200093 ) ) ( not ( = ?auto_200091 ?auto_200095 ) ) ( not ( = ?auto_200091 ?auto_200096 ) ) ( not ( = ?auto_200091 ?auto_200097 ) ) ( not ( = ?auto_200091 ?auto_200103 ) ) ( not ( = ?auto_200088 ?auto_200092 ) ) ( not ( = ?auto_200088 ?auto_200094 ) ) ( not ( = ?auto_200088 ?auto_200093 ) ) ( not ( = ?auto_200088 ?auto_200095 ) ) ( not ( = ?auto_200088 ?auto_200096 ) ) ( not ( = ?auto_200088 ?auto_200097 ) ) ( not ( = ?auto_200088 ?auto_200103 ) ) ( not ( = ?auto_200092 ?auto_200094 ) ) ( not ( = ?auto_200092 ?auto_200093 ) ) ( not ( = ?auto_200092 ?auto_200095 ) ) ( not ( = ?auto_200092 ?auto_200096 ) ) ( not ( = ?auto_200092 ?auto_200097 ) ) ( not ( = ?auto_200092 ?auto_200103 ) ) ( not ( = ?auto_200094 ?auto_200093 ) ) ( not ( = ?auto_200094 ?auto_200095 ) ) ( not ( = ?auto_200094 ?auto_200096 ) ) ( not ( = ?auto_200094 ?auto_200097 ) ) ( not ( = ?auto_200094 ?auto_200103 ) ) ( not ( = ?auto_200093 ?auto_200095 ) ) ( not ( = ?auto_200093 ?auto_200096 ) ) ( not ( = ?auto_200093 ?auto_200097 ) ) ( not ( = ?auto_200093 ?auto_200103 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200095 ?auto_200096 ?auto_200097 )
      ( MAKE-9CRATE-VERIFY ?auto_200089 ?auto_200090 ?auto_200091 ?auto_200088 ?auto_200092 ?auto_200094 ?auto_200093 ?auto_200095 ?auto_200096 ?auto_200097 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_200198 - SURFACE
      ?auto_200199 - SURFACE
      ?auto_200200 - SURFACE
      ?auto_200197 - SURFACE
      ?auto_200201 - SURFACE
      ?auto_200203 - SURFACE
      ?auto_200202 - SURFACE
      ?auto_200204 - SURFACE
      ?auto_200205 - SURFACE
      ?auto_200206 - SURFACE
    )
    :vars
    (
      ?auto_200208 - HOIST
      ?auto_200210 - PLACE
      ?auto_200209 - PLACE
      ?auto_200212 - HOIST
      ?auto_200207 - SURFACE
      ?auto_200211 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_200208 ?auto_200210 ) ( IS-CRATE ?auto_200206 ) ( not ( = ?auto_200205 ?auto_200206 ) ) ( not ( = ?auto_200204 ?auto_200205 ) ) ( not ( = ?auto_200204 ?auto_200206 ) ) ( not ( = ?auto_200209 ?auto_200210 ) ) ( HOIST-AT ?auto_200212 ?auto_200209 ) ( not ( = ?auto_200208 ?auto_200212 ) ) ( AVAILABLE ?auto_200212 ) ( SURFACE-AT ?auto_200206 ?auto_200209 ) ( ON ?auto_200206 ?auto_200207 ) ( CLEAR ?auto_200206 ) ( not ( = ?auto_200205 ?auto_200207 ) ) ( not ( = ?auto_200206 ?auto_200207 ) ) ( not ( = ?auto_200204 ?auto_200207 ) ) ( TRUCK-AT ?auto_200211 ?auto_200210 ) ( SURFACE-AT ?auto_200204 ?auto_200210 ) ( CLEAR ?auto_200204 ) ( LIFTING ?auto_200208 ?auto_200205 ) ( IS-CRATE ?auto_200205 ) ( ON ?auto_200199 ?auto_200198 ) ( ON ?auto_200200 ?auto_200199 ) ( ON ?auto_200197 ?auto_200200 ) ( ON ?auto_200201 ?auto_200197 ) ( ON ?auto_200203 ?auto_200201 ) ( ON ?auto_200202 ?auto_200203 ) ( ON ?auto_200204 ?auto_200202 ) ( not ( = ?auto_200198 ?auto_200199 ) ) ( not ( = ?auto_200198 ?auto_200200 ) ) ( not ( = ?auto_200198 ?auto_200197 ) ) ( not ( = ?auto_200198 ?auto_200201 ) ) ( not ( = ?auto_200198 ?auto_200203 ) ) ( not ( = ?auto_200198 ?auto_200202 ) ) ( not ( = ?auto_200198 ?auto_200204 ) ) ( not ( = ?auto_200198 ?auto_200205 ) ) ( not ( = ?auto_200198 ?auto_200206 ) ) ( not ( = ?auto_200198 ?auto_200207 ) ) ( not ( = ?auto_200199 ?auto_200200 ) ) ( not ( = ?auto_200199 ?auto_200197 ) ) ( not ( = ?auto_200199 ?auto_200201 ) ) ( not ( = ?auto_200199 ?auto_200203 ) ) ( not ( = ?auto_200199 ?auto_200202 ) ) ( not ( = ?auto_200199 ?auto_200204 ) ) ( not ( = ?auto_200199 ?auto_200205 ) ) ( not ( = ?auto_200199 ?auto_200206 ) ) ( not ( = ?auto_200199 ?auto_200207 ) ) ( not ( = ?auto_200200 ?auto_200197 ) ) ( not ( = ?auto_200200 ?auto_200201 ) ) ( not ( = ?auto_200200 ?auto_200203 ) ) ( not ( = ?auto_200200 ?auto_200202 ) ) ( not ( = ?auto_200200 ?auto_200204 ) ) ( not ( = ?auto_200200 ?auto_200205 ) ) ( not ( = ?auto_200200 ?auto_200206 ) ) ( not ( = ?auto_200200 ?auto_200207 ) ) ( not ( = ?auto_200197 ?auto_200201 ) ) ( not ( = ?auto_200197 ?auto_200203 ) ) ( not ( = ?auto_200197 ?auto_200202 ) ) ( not ( = ?auto_200197 ?auto_200204 ) ) ( not ( = ?auto_200197 ?auto_200205 ) ) ( not ( = ?auto_200197 ?auto_200206 ) ) ( not ( = ?auto_200197 ?auto_200207 ) ) ( not ( = ?auto_200201 ?auto_200203 ) ) ( not ( = ?auto_200201 ?auto_200202 ) ) ( not ( = ?auto_200201 ?auto_200204 ) ) ( not ( = ?auto_200201 ?auto_200205 ) ) ( not ( = ?auto_200201 ?auto_200206 ) ) ( not ( = ?auto_200201 ?auto_200207 ) ) ( not ( = ?auto_200203 ?auto_200202 ) ) ( not ( = ?auto_200203 ?auto_200204 ) ) ( not ( = ?auto_200203 ?auto_200205 ) ) ( not ( = ?auto_200203 ?auto_200206 ) ) ( not ( = ?auto_200203 ?auto_200207 ) ) ( not ( = ?auto_200202 ?auto_200204 ) ) ( not ( = ?auto_200202 ?auto_200205 ) ) ( not ( = ?auto_200202 ?auto_200206 ) ) ( not ( = ?auto_200202 ?auto_200207 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200204 ?auto_200205 ?auto_200206 )
      ( MAKE-9CRATE-VERIFY ?auto_200198 ?auto_200199 ?auto_200200 ?auto_200197 ?auto_200201 ?auto_200203 ?auto_200202 ?auto_200204 ?auto_200205 ?auto_200206 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_200307 - SURFACE
      ?auto_200308 - SURFACE
      ?auto_200309 - SURFACE
      ?auto_200306 - SURFACE
      ?auto_200310 - SURFACE
      ?auto_200312 - SURFACE
      ?auto_200311 - SURFACE
      ?auto_200313 - SURFACE
      ?auto_200314 - SURFACE
      ?auto_200315 - SURFACE
    )
    :vars
    (
      ?auto_200321 - HOIST
      ?auto_200316 - PLACE
      ?auto_200317 - PLACE
      ?auto_200320 - HOIST
      ?auto_200319 - SURFACE
      ?auto_200318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_200321 ?auto_200316 ) ( IS-CRATE ?auto_200315 ) ( not ( = ?auto_200314 ?auto_200315 ) ) ( not ( = ?auto_200313 ?auto_200314 ) ) ( not ( = ?auto_200313 ?auto_200315 ) ) ( not ( = ?auto_200317 ?auto_200316 ) ) ( HOIST-AT ?auto_200320 ?auto_200317 ) ( not ( = ?auto_200321 ?auto_200320 ) ) ( AVAILABLE ?auto_200320 ) ( SURFACE-AT ?auto_200315 ?auto_200317 ) ( ON ?auto_200315 ?auto_200319 ) ( CLEAR ?auto_200315 ) ( not ( = ?auto_200314 ?auto_200319 ) ) ( not ( = ?auto_200315 ?auto_200319 ) ) ( not ( = ?auto_200313 ?auto_200319 ) ) ( TRUCK-AT ?auto_200318 ?auto_200316 ) ( SURFACE-AT ?auto_200313 ?auto_200316 ) ( CLEAR ?auto_200313 ) ( IS-CRATE ?auto_200314 ) ( AVAILABLE ?auto_200321 ) ( IN ?auto_200314 ?auto_200318 ) ( ON ?auto_200308 ?auto_200307 ) ( ON ?auto_200309 ?auto_200308 ) ( ON ?auto_200306 ?auto_200309 ) ( ON ?auto_200310 ?auto_200306 ) ( ON ?auto_200312 ?auto_200310 ) ( ON ?auto_200311 ?auto_200312 ) ( ON ?auto_200313 ?auto_200311 ) ( not ( = ?auto_200307 ?auto_200308 ) ) ( not ( = ?auto_200307 ?auto_200309 ) ) ( not ( = ?auto_200307 ?auto_200306 ) ) ( not ( = ?auto_200307 ?auto_200310 ) ) ( not ( = ?auto_200307 ?auto_200312 ) ) ( not ( = ?auto_200307 ?auto_200311 ) ) ( not ( = ?auto_200307 ?auto_200313 ) ) ( not ( = ?auto_200307 ?auto_200314 ) ) ( not ( = ?auto_200307 ?auto_200315 ) ) ( not ( = ?auto_200307 ?auto_200319 ) ) ( not ( = ?auto_200308 ?auto_200309 ) ) ( not ( = ?auto_200308 ?auto_200306 ) ) ( not ( = ?auto_200308 ?auto_200310 ) ) ( not ( = ?auto_200308 ?auto_200312 ) ) ( not ( = ?auto_200308 ?auto_200311 ) ) ( not ( = ?auto_200308 ?auto_200313 ) ) ( not ( = ?auto_200308 ?auto_200314 ) ) ( not ( = ?auto_200308 ?auto_200315 ) ) ( not ( = ?auto_200308 ?auto_200319 ) ) ( not ( = ?auto_200309 ?auto_200306 ) ) ( not ( = ?auto_200309 ?auto_200310 ) ) ( not ( = ?auto_200309 ?auto_200312 ) ) ( not ( = ?auto_200309 ?auto_200311 ) ) ( not ( = ?auto_200309 ?auto_200313 ) ) ( not ( = ?auto_200309 ?auto_200314 ) ) ( not ( = ?auto_200309 ?auto_200315 ) ) ( not ( = ?auto_200309 ?auto_200319 ) ) ( not ( = ?auto_200306 ?auto_200310 ) ) ( not ( = ?auto_200306 ?auto_200312 ) ) ( not ( = ?auto_200306 ?auto_200311 ) ) ( not ( = ?auto_200306 ?auto_200313 ) ) ( not ( = ?auto_200306 ?auto_200314 ) ) ( not ( = ?auto_200306 ?auto_200315 ) ) ( not ( = ?auto_200306 ?auto_200319 ) ) ( not ( = ?auto_200310 ?auto_200312 ) ) ( not ( = ?auto_200310 ?auto_200311 ) ) ( not ( = ?auto_200310 ?auto_200313 ) ) ( not ( = ?auto_200310 ?auto_200314 ) ) ( not ( = ?auto_200310 ?auto_200315 ) ) ( not ( = ?auto_200310 ?auto_200319 ) ) ( not ( = ?auto_200312 ?auto_200311 ) ) ( not ( = ?auto_200312 ?auto_200313 ) ) ( not ( = ?auto_200312 ?auto_200314 ) ) ( not ( = ?auto_200312 ?auto_200315 ) ) ( not ( = ?auto_200312 ?auto_200319 ) ) ( not ( = ?auto_200311 ?auto_200313 ) ) ( not ( = ?auto_200311 ?auto_200314 ) ) ( not ( = ?auto_200311 ?auto_200315 ) ) ( not ( = ?auto_200311 ?auto_200319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200313 ?auto_200314 ?auto_200315 )
      ( MAKE-9CRATE-VERIFY ?auto_200307 ?auto_200308 ?auto_200309 ?auto_200306 ?auto_200310 ?auto_200312 ?auto_200311 ?auto_200313 ?auto_200314 ?auto_200315 ) )
  )

)

