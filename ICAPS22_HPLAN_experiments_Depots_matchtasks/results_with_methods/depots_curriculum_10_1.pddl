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
      ?auto_6977 - SURFACE
      ?auto_6978 - SURFACE
    )
    :vars
    (
      ?auto_6979 - HOIST
      ?auto_6980 - PLACE
      ?auto_6982 - PLACE
      ?auto_6983 - HOIST
      ?auto_6984 - SURFACE
      ?auto_6981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6979 ?auto_6980 ) ( SURFACE-AT ?auto_6977 ?auto_6980 ) ( CLEAR ?auto_6977 ) ( IS-CRATE ?auto_6978 ) ( AVAILABLE ?auto_6979 ) ( not ( = ?auto_6982 ?auto_6980 ) ) ( HOIST-AT ?auto_6983 ?auto_6982 ) ( AVAILABLE ?auto_6983 ) ( SURFACE-AT ?auto_6978 ?auto_6982 ) ( ON ?auto_6978 ?auto_6984 ) ( CLEAR ?auto_6978 ) ( TRUCK-AT ?auto_6981 ?auto_6980 ) ( not ( = ?auto_6977 ?auto_6978 ) ) ( not ( = ?auto_6977 ?auto_6984 ) ) ( not ( = ?auto_6978 ?auto_6984 ) ) ( not ( = ?auto_6979 ?auto_6983 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6981 ?auto_6980 ?auto_6982 )
      ( !LIFT ?auto_6983 ?auto_6978 ?auto_6984 ?auto_6982 )
      ( !LOAD ?auto_6983 ?auto_6978 ?auto_6981 ?auto_6982 )
      ( !DRIVE ?auto_6981 ?auto_6982 ?auto_6980 )
      ( !UNLOAD ?auto_6979 ?auto_6978 ?auto_6981 ?auto_6980 )
      ( !DROP ?auto_6979 ?auto_6978 ?auto_6977 ?auto_6980 )
      ( MAKE-1CRATE-VERIFY ?auto_6977 ?auto_6978 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6987 - SURFACE
      ?auto_6988 - SURFACE
    )
    :vars
    (
      ?auto_6989 - HOIST
      ?auto_6990 - PLACE
      ?auto_6992 - PLACE
      ?auto_6993 - HOIST
      ?auto_6994 - SURFACE
      ?auto_6991 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6989 ?auto_6990 ) ( SURFACE-AT ?auto_6987 ?auto_6990 ) ( CLEAR ?auto_6987 ) ( IS-CRATE ?auto_6988 ) ( AVAILABLE ?auto_6989 ) ( not ( = ?auto_6992 ?auto_6990 ) ) ( HOIST-AT ?auto_6993 ?auto_6992 ) ( AVAILABLE ?auto_6993 ) ( SURFACE-AT ?auto_6988 ?auto_6992 ) ( ON ?auto_6988 ?auto_6994 ) ( CLEAR ?auto_6988 ) ( TRUCK-AT ?auto_6991 ?auto_6990 ) ( not ( = ?auto_6987 ?auto_6988 ) ) ( not ( = ?auto_6987 ?auto_6994 ) ) ( not ( = ?auto_6988 ?auto_6994 ) ) ( not ( = ?auto_6989 ?auto_6993 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6991 ?auto_6990 ?auto_6992 )
      ( !LIFT ?auto_6993 ?auto_6988 ?auto_6994 ?auto_6992 )
      ( !LOAD ?auto_6993 ?auto_6988 ?auto_6991 ?auto_6992 )
      ( !DRIVE ?auto_6991 ?auto_6992 ?auto_6990 )
      ( !UNLOAD ?auto_6989 ?auto_6988 ?auto_6991 ?auto_6990 )
      ( !DROP ?auto_6989 ?auto_6988 ?auto_6987 ?auto_6990 )
      ( MAKE-1CRATE-VERIFY ?auto_6987 ?auto_6988 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6998 - SURFACE
      ?auto_6999 - SURFACE
      ?auto_7000 - SURFACE
    )
    :vars
    (
      ?auto_7004 - HOIST
      ?auto_7003 - PLACE
      ?auto_7001 - PLACE
      ?auto_7005 - HOIST
      ?auto_7002 - SURFACE
      ?auto_7009 - PLACE
      ?auto_7008 - HOIST
      ?auto_7007 - SURFACE
      ?auto_7006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7004 ?auto_7003 ) ( IS-CRATE ?auto_7000 ) ( not ( = ?auto_7001 ?auto_7003 ) ) ( HOIST-AT ?auto_7005 ?auto_7001 ) ( AVAILABLE ?auto_7005 ) ( SURFACE-AT ?auto_7000 ?auto_7001 ) ( ON ?auto_7000 ?auto_7002 ) ( CLEAR ?auto_7000 ) ( not ( = ?auto_6999 ?auto_7000 ) ) ( not ( = ?auto_6999 ?auto_7002 ) ) ( not ( = ?auto_7000 ?auto_7002 ) ) ( not ( = ?auto_7004 ?auto_7005 ) ) ( SURFACE-AT ?auto_6998 ?auto_7003 ) ( CLEAR ?auto_6998 ) ( IS-CRATE ?auto_6999 ) ( AVAILABLE ?auto_7004 ) ( not ( = ?auto_7009 ?auto_7003 ) ) ( HOIST-AT ?auto_7008 ?auto_7009 ) ( AVAILABLE ?auto_7008 ) ( SURFACE-AT ?auto_6999 ?auto_7009 ) ( ON ?auto_6999 ?auto_7007 ) ( CLEAR ?auto_6999 ) ( TRUCK-AT ?auto_7006 ?auto_7003 ) ( not ( = ?auto_6998 ?auto_6999 ) ) ( not ( = ?auto_6998 ?auto_7007 ) ) ( not ( = ?auto_6999 ?auto_7007 ) ) ( not ( = ?auto_7004 ?auto_7008 ) ) ( not ( = ?auto_6998 ?auto_7000 ) ) ( not ( = ?auto_6998 ?auto_7002 ) ) ( not ( = ?auto_7000 ?auto_7007 ) ) ( not ( = ?auto_7001 ?auto_7009 ) ) ( not ( = ?auto_7005 ?auto_7008 ) ) ( not ( = ?auto_7002 ?auto_7007 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6998 ?auto_6999 )
      ( MAKE-1CRATE ?auto_6999 ?auto_7000 )
      ( MAKE-2CRATE-VERIFY ?auto_6998 ?auto_6999 ?auto_7000 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7012 - SURFACE
      ?auto_7013 - SURFACE
    )
    :vars
    (
      ?auto_7014 - HOIST
      ?auto_7015 - PLACE
      ?auto_7017 - PLACE
      ?auto_7018 - HOIST
      ?auto_7019 - SURFACE
      ?auto_7016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7014 ?auto_7015 ) ( SURFACE-AT ?auto_7012 ?auto_7015 ) ( CLEAR ?auto_7012 ) ( IS-CRATE ?auto_7013 ) ( AVAILABLE ?auto_7014 ) ( not ( = ?auto_7017 ?auto_7015 ) ) ( HOIST-AT ?auto_7018 ?auto_7017 ) ( AVAILABLE ?auto_7018 ) ( SURFACE-AT ?auto_7013 ?auto_7017 ) ( ON ?auto_7013 ?auto_7019 ) ( CLEAR ?auto_7013 ) ( TRUCK-AT ?auto_7016 ?auto_7015 ) ( not ( = ?auto_7012 ?auto_7013 ) ) ( not ( = ?auto_7012 ?auto_7019 ) ) ( not ( = ?auto_7013 ?auto_7019 ) ) ( not ( = ?auto_7014 ?auto_7018 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7016 ?auto_7015 ?auto_7017 )
      ( !LIFT ?auto_7018 ?auto_7013 ?auto_7019 ?auto_7017 )
      ( !LOAD ?auto_7018 ?auto_7013 ?auto_7016 ?auto_7017 )
      ( !DRIVE ?auto_7016 ?auto_7017 ?auto_7015 )
      ( !UNLOAD ?auto_7014 ?auto_7013 ?auto_7016 ?auto_7015 )
      ( !DROP ?auto_7014 ?auto_7013 ?auto_7012 ?auto_7015 )
      ( MAKE-1CRATE-VERIFY ?auto_7012 ?auto_7013 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7024 - SURFACE
      ?auto_7025 - SURFACE
      ?auto_7026 - SURFACE
      ?auto_7027 - SURFACE
    )
    :vars
    (
      ?auto_7033 - HOIST
      ?auto_7031 - PLACE
      ?auto_7028 - PLACE
      ?auto_7030 - HOIST
      ?auto_7032 - SURFACE
      ?auto_7037 - PLACE
      ?auto_7039 - HOIST
      ?auto_7038 - SURFACE
      ?auto_7035 - PLACE
      ?auto_7036 - HOIST
      ?auto_7034 - SURFACE
      ?auto_7029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7033 ?auto_7031 ) ( IS-CRATE ?auto_7027 ) ( not ( = ?auto_7028 ?auto_7031 ) ) ( HOIST-AT ?auto_7030 ?auto_7028 ) ( AVAILABLE ?auto_7030 ) ( SURFACE-AT ?auto_7027 ?auto_7028 ) ( ON ?auto_7027 ?auto_7032 ) ( CLEAR ?auto_7027 ) ( not ( = ?auto_7026 ?auto_7027 ) ) ( not ( = ?auto_7026 ?auto_7032 ) ) ( not ( = ?auto_7027 ?auto_7032 ) ) ( not ( = ?auto_7033 ?auto_7030 ) ) ( IS-CRATE ?auto_7026 ) ( not ( = ?auto_7037 ?auto_7031 ) ) ( HOIST-AT ?auto_7039 ?auto_7037 ) ( AVAILABLE ?auto_7039 ) ( SURFACE-AT ?auto_7026 ?auto_7037 ) ( ON ?auto_7026 ?auto_7038 ) ( CLEAR ?auto_7026 ) ( not ( = ?auto_7025 ?auto_7026 ) ) ( not ( = ?auto_7025 ?auto_7038 ) ) ( not ( = ?auto_7026 ?auto_7038 ) ) ( not ( = ?auto_7033 ?auto_7039 ) ) ( SURFACE-AT ?auto_7024 ?auto_7031 ) ( CLEAR ?auto_7024 ) ( IS-CRATE ?auto_7025 ) ( AVAILABLE ?auto_7033 ) ( not ( = ?auto_7035 ?auto_7031 ) ) ( HOIST-AT ?auto_7036 ?auto_7035 ) ( AVAILABLE ?auto_7036 ) ( SURFACE-AT ?auto_7025 ?auto_7035 ) ( ON ?auto_7025 ?auto_7034 ) ( CLEAR ?auto_7025 ) ( TRUCK-AT ?auto_7029 ?auto_7031 ) ( not ( = ?auto_7024 ?auto_7025 ) ) ( not ( = ?auto_7024 ?auto_7034 ) ) ( not ( = ?auto_7025 ?auto_7034 ) ) ( not ( = ?auto_7033 ?auto_7036 ) ) ( not ( = ?auto_7024 ?auto_7026 ) ) ( not ( = ?auto_7024 ?auto_7038 ) ) ( not ( = ?auto_7026 ?auto_7034 ) ) ( not ( = ?auto_7037 ?auto_7035 ) ) ( not ( = ?auto_7039 ?auto_7036 ) ) ( not ( = ?auto_7038 ?auto_7034 ) ) ( not ( = ?auto_7024 ?auto_7027 ) ) ( not ( = ?auto_7024 ?auto_7032 ) ) ( not ( = ?auto_7025 ?auto_7027 ) ) ( not ( = ?auto_7025 ?auto_7032 ) ) ( not ( = ?auto_7027 ?auto_7038 ) ) ( not ( = ?auto_7027 ?auto_7034 ) ) ( not ( = ?auto_7028 ?auto_7037 ) ) ( not ( = ?auto_7028 ?auto_7035 ) ) ( not ( = ?auto_7030 ?auto_7039 ) ) ( not ( = ?auto_7030 ?auto_7036 ) ) ( not ( = ?auto_7032 ?auto_7038 ) ) ( not ( = ?auto_7032 ?auto_7034 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7024 ?auto_7025 ?auto_7026 )
      ( MAKE-1CRATE ?auto_7026 ?auto_7027 )
      ( MAKE-3CRATE-VERIFY ?auto_7024 ?auto_7025 ?auto_7026 ?auto_7027 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7042 - SURFACE
      ?auto_7043 - SURFACE
    )
    :vars
    (
      ?auto_7044 - HOIST
      ?auto_7045 - PLACE
      ?auto_7047 - PLACE
      ?auto_7048 - HOIST
      ?auto_7049 - SURFACE
      ?auto_7046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7044 ?auto_7045 ) ( SURFACE-AT ?auto_7042 ?auto_7045 ) ( CLEAR ?auto_7042 ) ( IS-CRATE ?auto_7043 ) ( AVAILABLE ?auto_7044 ) ( not ( = ?auto_7047 ?auto_7045 ) ) ( HOIST-AT ?auto_7048 ?auto_7047 ) ( AVAILABLE ?auto_7048 ) ( SURFACE-AT ?auto_7043 ?auto_7047 ) ( ON ?auto_7043 ?auto_7049 ) ( CLEAR ?auto_7043 ) ( TRUCK-AT ?auto_7046 ?auto_7045 ) ( not ( = ?auto_7042 ?auto_7043 ) ) ( not ( = ?auto_7042 ?auto_7049 ) ) ( not ( = ?auto_7043 ?auto_7049 ) ) ( not ( = ?auto_7044 ?auto_7048 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7046 ?auto_7045 ?auto_7047 )
      ( !LIFT ?auto_7048 ?auto_7043 ?auto_7049 ?auto_7047 )
      ( !LOAD ?auto_7048 ?auto_7043 ?auto_7046 ?auto_7047 )
      ( !DRIVE ?auto_7046 ?auto_7047 ?auto_7045 )
      ( !UNLOAD ?auto_7044 ?auto_7043 ?auto_7046 ?auto_7045 )
      ( !DROP ?auto_7044 ?auto_7043 ?auto_7042 ?auto_7045 )
      ( MAKE-1CRATE-VERIFY ?auto_7042 ?auto_7043 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7055 - SURFACE
      ?auto_7056 - SURFACE
      ?auto_7057 - SURFACE
      ?auto_7058 - SURFACE
      ?auto_7059 - SURFACE
    )
    :vars
    (
      ?auto_7062 - HOIST
      ?auto_7060 - PLACE
      ?auto_7065 - PLACE
      ?auto_7064 - HOIST
      ?auto_7063 - SURFACE
      ?auto_7068 - PLACE
      ?auto_7074 - HOIST
      ?auto_7073 - SURFACE
      ?auto_7071 - PLACE
      ?auto_7070 - HOIST
      ?auto_7072 - SURFACE
      ?auto_7069 - PLACE
      ?auto_7067 - HOIST
      ?auto_7066 - SURFACE
      ?auto_7061 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7062 ?auto_7060 ) ( IS-CRATE ?auto_7059 ) ( not ( = ?auto_7065 ?auto_7060 ) ) ( HOIST-AT ?auto_7064 ?auto_7065 ) ( AVAILABLE ?auto_7064 ) ( SURFACE-AT ?auto_7059 ?auto_7065 ) ( ON ?auto_7059 ?auto_7063 ) ( CLEAR ?auto_7059 ) ( not ( = ?auto_7058 ?auto_7059 ) ) ( not ( = ?auto_7058 ?auto_7063 ) ) ( not ( = ?auto_7059 ?auto_7063 ) ) ( not ( = ?auto_7062 ?auto_7064 ) ) ( IS-CRATE ?auto_7058 ) ( not ( = ?auto_7068 ?auto_7060 ) ) ( HOIST-AT ?auto_7074 ?auto_7068 ) ( AVAILABLE ?auto_7074 ) ( SURFACE-AT ?auto_7058 ?auto_7068 ) ( ON ?auto_7058 ?auto_7073 ) ( CLEAR ?auto_7058 ) ( not ( = ?auto_7057 ?auto_7058 ) ) ( not ( = ?auto_7057 ?auto_7073 ) ) ( not ( = ?auto_7058 ?auto_7073 ) ) ( not ( = ?auto_7062 ?auto_7074 ) ) ( IS-CRATE ?auto_7057 ) ( not ( = ?auto_7071 ?auto_7060 ) ) ( HOIST-AT ?auto_7070 ?auto_7071 ) ( AVAILABLE ?auto_7070 ) ( SURFACE-AT ?auto_7057 ?auto_7071 ) ( ON ?auto_7057 ?auto_7072 ) ( CLEAR ?auto_7057 ) ( not ( = ?auto_7056 ?auto_7057 ) ) ( not ( = ?auto_7056 ?auto_7072 ) ) ( not ( = ?auto_7057 ?auto_7072 ) ) ( not ( = ?auto_7062 ?auto_7070 ) ) ( SURFACE-AT ?auto_7055 ?auto_7060 ) ( CLEAR ?auto_7055 ) ( IS-CRATE ?auto_7056 ) ( AVAILABLE ?auto_7062 ) ( not ( = ?auto_7069 ?auto_7060 ) ) ( HOIST-AT ?auto_7067 ?auto_7069 ) ( AVAILABLE ?auto_7067 ) ( SURFACE-AT ?auto_7056 ?auto_7069 ) ( ON ?auto_7056 ?auto_7066 ) ( CLEAR ?auto_7056 ) ( TRUCK-AT ?auto_7061 ?auto_7060 ) ( not ( = ?auto_7055 ?auto_7056 ) ) ( not ( = ?auto_7055 ?auto_7066 ) ) ( not ( = ?auto_7056 ?auto_7066 ) ) ( not ( = ?auto_7062 ?auto_7067 ) ) ( not ( = ?auto_7055 ?auto_7057 ) ) ( not ( = ?auto_7055 ?auto_7072 ) ) ( not ( = ?auto_7057 ?auto_7066 ) ) ( not ( = ?auto_7071 ?auto_7069 ) ) ( not ( = ?auto_7070 ?auto_7067 ) ) ( not ( = ?auto_7072 ?auto_7066 ) ) ( not ( = ?auto_7055 ?auto_7058 ) ) ( not ( = ?auto_7055 ?auto_7073 ) ) ( not ( = ?auto_7056 ?auto_7058 ) ) ( not ( = ?auto_7056 ?auto_7073 ) ) ( not ( = ?auto_7058 ?auto_7072 ) ) ( not ( = ?auto_7058 ?auto_7066 ) ) ( not ( = ?auto_7068 ?auto_7071 ) ) ( not ( = ?auto_7068 ?auto_7069 ) ) ( not ( = ?auto_7074 ?auto_7070 ) ) ( not ( = ?auto_7074 ?auto_7067 ) ) ( not ( = ?auto_7073 ?auto_7072 ) ) ( not ( = ?auto_7073 ?auto_7066 ) ) ( not ( = ?auto_7055 ?auto_7059 ) ) ( not ( = ?auto_7055 ?auto_7063 ) ) ( not ( = ?auto_7056 ?auto_7059 ) ) ( not ( = ?auto_7056 ?auto_7063 ) ) ( not ( = ?auto_7057 ?auto_7059 ) ) ( not ( = ?auto_7057 ?auto_7063 ) ) ( not ( = ?auto_7059 ?auto_7073 ) ) ( not ( = ?auto_7059 ?auto_7072 ) ) ( not ( = ?auto_7059 ?auto_7066 ) ) ( not ( = ?auto_7065 ?auto_7068 ) ) ( not ( = ?auto_7065 ?auto_7071 ) ) ( not ( = ?auto_7065 ?auto_7069 ) ) ( not ( = ?auto_7064 ?auto_7074 ) ) ( not ( = ?auto_7064 ?auto_7070 ) ) ( not ( = ?auto_7064 ?auto_7067 ) ) ( not ( = ?auto_7063 ?auto_7073 ) ) ( not ( = ?auto_7063 ?auto_7072 ) ) ( not ( = ?auto_7063 ?auto_7066 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_7055 ?auto_7056 ?auto_7057 ?auto_7058 )
      ( MAKE-1CRATE ?auto_7058 ?auto_7059 )
      ( MAKE-4CRATE-VERIFY ?auto_7055 ?auto_7056 ?auto_7057 ?auto_7058 ?auto_7059 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7077 - SURFACE
      ?auto_7078 - SURFACE
    )
    :vars
    (
      ?auto_7079 - HOIST
      ?auto_7080 - PLACE
      ?auto_7082 - PLACE
      ?auto_7083 - HOIST
      ?auto_7084 - SURFACE
      ?auto_7081 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7079 ?auto_7080 ) ( SURFACE-AT ?auto_7077 ?auto_7080 ) ( CLEAR ?auto_7077 ) ( IS-CRATE ?auto_7078 ) ( AVAILABLE ?auto_7079 ) ( not ( = ?auto_7082 ?auto_7080 ) ) ( HOIST-AT ?auto_7083 ?auto_7082 ) ( AVAILABLE ?auto_7083 ) ( SURFACE-AT ?auto_7078 ?auto_7082 ) ( ON ?auto_7078 ?auto_7084 ) ( CLEAR ?auto_7078 ) ( TRUCK-AT ?auto_7081 ?auto_7080 ) ( not ( = ?auto_7077 ?auto_7078 ) ) ( not ( = ?auto_7077 ?auto_7084 ) ) ( not ( = ?auto_7078 ?auto_7084 ) ) ( not ( = ?auto_7079 ?auto_7083 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7081 ?auto_7080 ?auto_7082 )
      ( !LIFT ?auto_7083 ?auto_7078 ?auto_7084 ?auto_7082 )
      ( !LOAD ?auto_7083 ?auto_7078 ?auto_7081 ?auto_7082 )
      ( !DRIVE ?auto_7081 ?auto_7082 ?auto_7080 )
      ( !UNLOAD ?auto_7079 ?auto_7078 ?auto_7081 ?auto_7080 )
      ( !DROP ?auto_7079 ?auto_7078 ?auto_7077 ?auto_7080 )
      ( MAKE-1CRATE-VERIFY ?auto_7077 ?auto_7078 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_7091 - SURFACE
      ?auto_7092 - SURFACE
      ?auto_7093 - SURFACE
      ?auto_7094 - SURFACE
      ?auto_7095 - SURFACE
      ?auto_7096 - SURFACE
    )
    :vars
    (
      ?auto_7100 - HOIST
      ?auto_7099 - PLACE
      ?auto_7098 - PLACE
      ?auto_7101 - HOIST
      ?auto_7097 - SURFACE
      ?auto_7106 - PLACE
      ?auto_7111 - HOIST
      ?auto_7105 - SURFACE
      ?auto_7103 - PLACE
      ?auto_7110 - HOIST
      ?auto_7107 - SURFACE
      ?auto_7114 - PLACE
      ?auto_7113 - HOIST
      ?auto_7112 - SURFACE
      ?auto_7109 - PLACE
      ?auto_7108 - HOIST
      ?auto_7104 - SURFACE
      ?auto_7102 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7100 ?auto_7099 ) ( IS-CRATE ?auto_7096 ) ( not ( = ?auto_7098 ?auto_7099 ) ) ( HOIST-AT ?auto_7101 ?auto_7098 ) ( AVAILABLE ?auto_7101 ) ( SURFACE-AT ?auto_7096 ?auto_7098 ) ( ON ?auto_7096 ?auto_7097 ) ( CLEAR ?auto_7096 ) ( not ( = ?auto_7095 ?auto_7096 ) ) ( not ( = ?auto_7095 ?auto_7097 ) ) ( not ( = ?auto_7096 ?auto_7097 ) ) ( not ( = ?auto_7100 ?auto_7101 ) ) ( IS-CRATE ?auto_7095 ) ( not ( = ?auto_7106 ?auto_7099 ) ) ( HOIST-AT ?auto_7111 ?auto_7106 ) ( AVAILABLE ?auto_7111 ) ( SURFACE-AT ?auto_7095 ?auto_7106 ) ( ON ?auto_7095 ?auto_7105 ) ( CLEAR ?auto_7095 ) ( not ( = ?auto_7094 ?auto_7095 ) ) ( not ( = ?auto_7094 ?auto_7105 ) ) ( not ( = ?auto_7095 ?auto_7105 ) ) ( not ( = ?auto_7100 ?auto_7111 ) ) ( IS-CRATE ?auto_7094 ) ( not ( = ?auto_7103 ?auto_7099 ) ) ( HOIST-AT ?auto_7110 ?auto_7103 ) ( AVAILABLE ?auto_7110 ) ( SURFACE-AT ?auto_7094 ?auto_7103 ) ( ON ?auto_7094 ?auto_7107 ) ( CLEAR ?auto_7094 ) ( not ( = ?auto_7093 ?auto_7094 ) ) ( not ( = ?auto_7093 ?auto_7107 ) ) ( not ( = ?auto_7094 ?auto_7107 ) ) ( not ( = ?auto_7100 ?auto_7110 ) ) ( IS-CRATE ?auto_7093 ) ( not ( = ?auto_7114 ?auto_7099 ) ) ( HOIST-AT ?auto_7113 ?auto_7114 ) ( AVAILABLE ?auto_7113 ) ( SURFACE-AT ?auto_7093 ?auto_7114 ) ( ON ?auto_7093 ?auto_7112 ) ( CLEAR ?auto_7093 ) ( not ( = ?auto_7092 ?auto_7093 ) ) ( not ( = ?auto_7092 ?auto_7112 ) ) ( not ( = ?auto_7093 ?auto_7112 ) ) ( not ( = ?auto_7100 ?auto_7113 ) ) ( SURFACE-AT ?auto_7091 ?auto_7099 ) ( CLEAR ?auto_7091 ) ( IS-CRATE ?auto_7092 ) ( AVAILABLE ?auto_7100 ) ( not ( = ?auto_7109 ?auto_7099 ) ) ( HOIST-AT ?auto_7108 ?auto_7109 ) ( AVAILABLE ?auto_7108 ) ( SURFACE-AT ?auto_7092 ?auto_7109 ) ( ON ?auto_7092 ?auto_7104 ) ( CLEAR ?auto_7092 ) ( TRUCK-AT ?auto_7102 ?auto_7099 ) ( not ( = ?auto_7091 ?auto_7092 ) ) ( not ( = ?auto_7091 ?auto_7104 ) ) ( not ( = ?auto_7092 ?auto_7104 ) ) ( not ( = ?auto_7100 ?auto_7108 ) ) ( not ( = ?auto_7091 ?auto_7093 ) ) ( not ( = ?auto_7091 ?auto_7112 ) ) ( not ( = ?auto_7093 ?auto_7104 ) ) ( not ( = ?auto_7114 ?auto_7109 ) ) ( not ( = ?auto_7113 ?auto_7108 ) ) ( not ( = ?auto_7112 ?auto_7104 ) ) ( not ( = ?auto_7091 ?auto_7094 ) ) ( not ( = ?auto_7091 ?auto_7107 ) ) ( not ( = ?auto_7092 ?auto_7094 ) ) ( not ( = ?auto_7092 ?auto_7107 ) ) ( not ( = ?auto_7094 ?auto_7112 ) ) ( not ( = ?auto_7094 ?auto_7104 ) ) ( not ( = ?auto_7103 ?auto_7114 ) ) ( not ( = ?auto_7103 ?auto_7109 ) ) ( not ( = ?auto_7110 ?auto_7113 ) ) ( not ( = ?auto_7110 ?auto_7108 ) ) ( not ( = ?auto_7107 ?auto_7112 ) ) ( not ( = ?auto_7107 ?auto_7104 ) ) ( not ( = ?auto_7091 ?auto_7095 ) ) ( not ( = ?auto_7091 ?auto_7105 ) ) ( not ( = ?auto_7092 ?auto_7095 ) ) ( not ( = ?auto_7092 ?auto_7105 ) ) ( not ( = ?auto_7093 ?auto_7095 ) ) ( not ( = ?auto_7093 ?auto_7105 ) ) ( not ( = ?auto_7095 ?auto_7107 ) ) ( not ( = ?auto_7095 ?auto_7112 ) ) ( not ( = ?auto_7095 ?auto_7104 ) ) ( not ( = ?auto_7106 ?auto_7103 ) ) ( not ( = ?auto_7106 ?auto_7114 ) ) ( not ( = ?auto_7106 ?auto_7109 ) ) ( not ( = ?auto_7111 ?auto_7110 ) ) ( not ( = ?auto_7111 ?auto_7113 ) ) ( not ( = ?auto_7111 ?auto_7108 ) ) ( not ( = ?auto_7105 ?auto_7107 ) ) ( not ( = ?auto_7105 ?auto_7112 ) ) ( not ( = ?auto_7105 ?auto_7104 ) ) ( not ( = ?auto_7091 ?auto_7096 ) ) ( not ( = ?auto_7091 ?auto_7097 ) ) ( not ( = ?auto_7092 ?auto_7096 ) ) ( not ( = ?auto_7092 ?auto_7097 ) ) ( not ( = ?auto_7093 ?auto_7096 ) ) ( not ( = ?auto_7093 ?auto_7097 ) ) ( not ( = ?auto_7094 ?auto_7096 ) ) ( not ( = ?auto_7094 ?auto_7097 ) ) ( not ( = ?auto_7096 ?auto_7105 ) ) ( not ( = ?auto_7096 ?auto_7107 ) ) ( not ( = ?auto_7096 ?auto_7112 ) ) ( not ( = ?auto_7096 ?auto_7104 ) ) ( not ( = ?auto_7098 ?auto_7106 ) ) ( not ( = ?auto_7098 ?auto_7103 ) ) ( not ( = ?auto_7098 ?auto_7114 ) ) ( not ( = ?auto_7098 ?auto_7109 ) ) ( not ( = ?auto_7101 ?auto_7111 ) ) ( not ( = ?auto_7101 ?auto_7110 ) ) ( not ( = ?auto_7101 ?auto_7113 ) ) ( not ( = ?auto_7101 ?auto_7108 ) ) ( not ( = ?auto_7097 ?auto_7105 ) ) ( not ( = ?auto_7097 ?auto_7107 ) ) ( not ( = ?auto_7097 ?auto_7112 ) ) ( not ( = ?auto_7097 ?auto_7104 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_7091 ?auto_7092 ?auto_7093 ?auto_7094 ?auto_7095 )
      ( MAKE-1CRATE ?auto_7095 ?auto_7096 )
      ( MAKE-5CRATE-VERIFY ?auto_7091 ?auto_7092 ?auto_7093 ?auto_7094 ?auto_7095 ?auto_7096 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7117 - SURFACE
      ?auto_7118 - SURFACE
    )
    :vars
    (
      ?auto_7119 - HOIST
      ?auto_7120 - PLACE
      ?auto_7122 - PLACE
      ?auto_7123 - HOIST
      ?auto_7124 - SURFACE
      ?auto_7121 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7119 ?auto_7120 ) ( SURFACE-AT ?auto_7117 ?auto_7120 ) ( CLEAR ?auto_7117 ) ( IS-CRATE ?auto_7118 ) ( AVAILABLE ?auto_7119 ) ( not ( = ?auto_7122 ?auto_7120 ) ) ( HOIST-AT ?auto_7123 ?auto_7122 ) ( AVAILABLE ?auto_7123 ) ( SURFACE-AT ?auto_7118 ?auto_7122 ) ( ON ?auto_7118 ?auto_7124 ) ( CLEAR ?auto_7118 ) ( TRUCK-AT ?auto_7121 ?auto_7120 ) ( not ( = ?auto_7117 ?auto_7118 ) ) ( not ( = ?auto_7117 ?auto_7124 ) ) ( not ( = ?auto_7118 ?auto_7124 ) ) ( not ( = ?auto_7119 ?auto_7123 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7121 ?auto_7120 ?auto_7122 )
      ( !LIFT ?auto_7123 ?auto_7118 ?auto_7124 ?auto_7122 )
      ( !LOAD ?auto_7123 ?auto_7118 ?auto_7121 ?auto_7122 )
      ( !DRIVE ?auto_7121 ?auto_7122 ?auto_7120 )
      ( !UNLOAD ?auto_7119 ?auto_7118 ?auto_7121 ?auto_7120 )
      ( !DROP ?auto_7119 ?auto_7118 ?auto_7117 ?auto_7120 )
      ( MAKE-1CRATE-VERIFY ?auto_7117 ?auto_7118 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_7132 - SURFACE
      ?auto_7133 - SURFACE
      ?auto_7134 - SURFACE
      ?auto_7135 - SURFACE
      ?auto_7136 - SURFACE
      ?auto_7138 - SURFACE
      ?auto_7137 - SURFACE
    )
    :vars
    (
      ?auto_7139 - HOIST
      ?auto_7141 - PLACE
      ?auto_7143 - PLACE
      ?auto_7144 - HOIST
      ?auto_7142 - SURFACE
      ?auto_7157 - PLACE
      ?auto_7145 - HOIST
      ?auto_7147 - SURFACE
      ?auto_7153 - PLACE
      ?auto_7154 - HOIST
      ?auto_7152 - SURFACE
      ?auto_7151 - SURFACE
      ?auto_7155 - PLACE
      ?auto_7156 - HOIST
      ?auto_7148 - SURFACE
      ?auto_7150 - PLACE
      ?auto_7149 - HOIST
      ?auto_7146 - SURFACE
      ?auto_7140 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7139 ?auto_7141 ) ( IS-CRATE ?auto_7137 ) ( not ( = ?auto_7143 ?auto_7141 ) ) ( HOIST-AT ?auto_7144 ?auto_7143 ) ( SURFACE-AT ?auto_7137 ?auto_7143 ) ( ON ?auto_7137 ?auto_7142 ) ( CLEAR ?auto_7137 ) ( not ( = ?auto_7138 ?auto_7137 ) ) ( not ( = ?auto_7138 ?auto_7142 ) ) ( not ( = ?auto_7137 ?auto_7142 ) ) ( not ( = ?auto_7139 ?auto_7144 ) ) ( IS-CRATE ?auto_7138 ) ( not ( = ?auto_7157 ?auto_7141 ) ) ( HOIST-AT ?auto_7145 ?auto_7157 ) ( AVAILABLE ?auto_7145 ) ( SURFACE-AT ?auto_7138 ?auto_7157 ) ( ON ?auto_7138 ?auto_7147 ) ( CLEAR ?auto_7138 ) ( not ( = ?auto_7136 ?auto_7138 ) ) ( not ( = ?auto_7136 ?auto_7147 ) ) ( not ( = ?auto_7138 ?auto_7147 ) ) ( not ( = ?auto_7139 ?auto_7145 ) ) ( IS-CRATE ?auto_7136 ) ( not ( = ?auto_7153 ?auto_7141 ) ) ( HOIST-AT ?auto_7154 ?auto_7153 ) ( AVAILABLE ?auto_7154 ) ( SURFACE-AT ?auto_7136 ?auto_7153 ) ( ON ?auto_7136 ?auto_7152 ) ( CLEAR ?auto_7136 ) ( not ( = ?auto_7135 ?auto_7136 ) ) ( not ( = ?auto_7135 ?auto_7152 ) ) ( not ( = ?auto_7136 ?auto_7152 ) ) ( not ( = ?auto_7139 ?auto_7154 ) ) ( IS-CRATE ?auto_7135 ) ( AVAILABLE ?auto_7144 ) ( SURFACE-AT ?auto_7135 ?auto_7143 ) ( ON ?auto_7135 ?auto_7151 ) ( CLEAR ?auto_7135 ) ( not ( = ?auto_7134 ?auto_7135 ) ) ( not ( = ?auto_7134 ?auto_7151 ) ) ( not ( = ?auto_7135 ?auto_7151 ) ) ( IS-CRATE ?auto_7134 ) ( not ( = ?auto_7155 ?auto_7141 ) ) ( HOIST-AT ?auto_7156 ?auto_7155 ) ( AVAILABLE ?auto_7156 ) ( SURFACE-AT ?auto_7134 ?auto_7155 ) ( ON ?auto_7134 ?auto_7148 ) ( CLEAR ?auto_7134 ) ( not ( = ?auto_7133 ?auto_7134 ) ) ( not ( = ?auto_7133 ?auto_7148 ) ) ( not ( = ?auto_7134 ?auto_7148 ) ) ( not ( = ?auto_7139 ?auto_7156 ) ) ( SURFACE-AT ?auto_7132 ?auto_7141 ) ( CLEAR ?auto_7132 ) ( IS-CRATE ?auto_7133 ) ( AVAILABLE ?auto_7139 ) ( not ( = ?auto_7150 ?auto_7141 ) ) ( HOIST-AT ?auto_7149 ?auto_7150 ) ( AVAILABLE ?auto_7149 ) ( SURFACE-AT ?auto_7133 ?auto_7150 ) ( ON ?auto_7133 ?auto_7146 ) ( CLEAR ?auto_7133 ) ( TRUCK-AT ?auto_7140 ?auto_7141 ) ( not ( = ?auto_7132 ?auto_7133 ) ) ( not ( = ?auto_7132 ?auto_7146 ) ) ( not ( = ?auto_7133 ?auto_7146 ) ) ( not ( = ?auto_7139 ?auto_7149 ) ) ( not ( = ?auto_7132 ?auto_7134 ) ) ( not ( = ?auto_7132 ?auto_7148 ) ) ( not ( = ?auto_7134 ?auto_7146 ) ) ( not ( = ?auto_7155 ?auto_7150 ) ) ( not ( = ?auto_7156 ?auto_7149 ) ) ( not ( = ?auto_7148 ?auto_7146 ) ) ( not ( = ?auto_7132 ?auto_7135 ) ) ( not ( = ?auto_7132 ?auto_7151 ) ) ( not ( = ?auto_7133 ?auto_7135 ) ) ( not ( = ?auto_7133 ?auto_7151 ) ) ( not ( = ?auto_7135 ?auto_7148 ) ) ( not ( = ?auto_7135 ?auto_7146 ) ) ( not ( = ?auto_7143 ?auto_7155 ) ) ( not ( = ?auto_7143 ?auto_7150 ) ) ( not ( = ?auto_7144 ?auto_7156 ) ) ( not ( = ?auto_7144 ?auto_7149 ) ) ( not ( = ?auto_7151 ?auto_7148 ) ) ( not ( = ?auto_7151 ?auto_7146 ) ) ( not ( = ?auto_7132 ?auto_7136 ) ) ( not ( = ?auto_7132 ?auto_7152 ) ) ( not ( = ?auto_7133 ?auto_7136 ) ) ( not ( = ?auto_7133 ?auto_7152 ) ) ( not ( = ?auto_7134 ?auto_7136 ) ) ( not ( = ?auto_7134 ?auto_7152 ) ) ( not ( = ?auto_7136 ?auto_7151 ) ) ( not ( = ?auto_7136 ?auto_7148 ) ) ( not ( = ?auto_7136 ?auto_7146 ) ) ( not ( = ?auto_7153 ?auto_7143 ) ) ( not ( = ?auto_7153 ?auto_7155 ) ) ( not ( = ?auto_7153 ?auto_7150 ) ) ( not ( = ?auto_7154 ?auto_7144 ) ) ( not ( = ?auto_7154 ?auto_7156 ) ) ( not ( = ?auto_7154 ?auto_7149 ) ) ( not ( = ?auto_7152 ?auto_7151 ) ) ( not ( = ?auto_7152 ?auto_7148 ) ) ( not ( = ?auto_7152 ?auto_7146 ) ) ( not ( = ?auto_7132 ?auto_7138 ) ) ( not ( = ?auto_7132 ?auto_7147 ) ) ( not ( = ?auto_7133 ?auto_7138 ) ) ( not ( = ?auto_7133 ?auto_7147 ) ) ( not ( = ?auto_7134 ?auto_7138 ) ) ( not ( = ?auto_7134 ?auto_7147 ) ) ( not ( = ?auto_7135 ?auto_7138 ) ) ( not ( = ?auto_7135 ?auto_7147 ) ) ( not ( = ?auto_7138 ?auto_7152 ) ) ( not ( = ?auto_7138 ?auto_7151 ) ) ( not ( = ?auto_7138 ?auto_7148 ) ) ( not ( = ?auto_7138 ?auto_7146 ) ) ( not ( = ?auto_7157 ?auto_7153 ) ) ( not ( = ?auto_7157 ?auto_7143 ) ) ( not ( = ?auto_7157 ?auto_7155 ) ) ( not ( = ?auto_7157 ?auto_7150 ) ) ( not ( = ?auto_7145 ?auto_7154 ) ) ( not ( = ?auto_7145 ?auto_7144 ) ) ( not ( = ?auto_7145 ?auto_7156 ) ) ( not ( = ?auto_7145 ?auto_7149 ) ) ( not ( = ?auto_7147 ?auto_7152 ) ) ( not ( = ?auto_7147 ?auto_7151 ) ) ( not ( = ?auto_7147 ?auto_7148 ) ) ( not ( = ?auto_7147 ?auto_7146 ) ) ( not ( = ?auto_7132 ?auto_7137 ) ) ( not ( = ?auto_7132 ?auto_7142 ) ) ( not ( = ?auto_7133 ?auto_7137 ) ) ( not ( = ?auto_7133 ?auto_7142 ) ) ( not ( = ?auto_7134 ?auto_7137 ) ) ( not ( = ?auto_7134 ?auto_7142 ) ) ( not ( = ?auto_7135 ?auto_7137 ) ) ( not ( = ?auto_7135 ?auto_7142 ) ) ( not ( = ?auto_7136 ?auto_7137 ) ) ( not ( = ?auto_7136 ?auto_7142 ) ) ( not ( = ?auto_7137 ?auto_7147 ) ) ( not ( = ?auto_7137 ?auto_7152 ) ) ( not ( = ?auto_7137 ?auto_7151 ) ) ( not ( = ?auto_7137 ?auto_7148 ) ) ( not ( = ?auto_7137 ?auto_7146 ) ) ( not ( = ?auto_7142 ?auto_7147 ) ) ( not ( = ?auto_7142 ?auto_7152 ) ) ( not ( = ?auto_7142 ?auto_7151 ) ) ( not ( = ?auto_7142 ?auto_7148 ) ) ( not ( = ?auto_7142 ?auto_7146 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_7132 ?auto_7133 ?auto_7134 ?auto_7135 ?auto_7136 ?auto_7138 )
      ( MAKE-1CRATE ?auto_7138 ?auto_7137 )
      ( MAKE-6CRATE-VERIFY ?auto_7132 ?auto_7133 ?auto_7134 ?auto_7135 ?auto_7136 ?auto_7138 ?auto_7137 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7160 - SURFACE
      ?auto_7161 - SURFACE
    )
    :vars
    (
      ?auto_7162 - HOIST
      ?auto_7163 - PLACE
      ?auto_7165 - PLACE
      ?auto_7166 - HOIST
      ?auto_7167 - SURFACE
      ?auto_7164 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7162 ?auto_7163 ) ( SURFACE-AT ?auto_7160 ?auto_7163 ) ( CLEAR ?auto_7160 ) ( IS-CRATE ?auto_7161 ) ( AVAILABLE ?auto_7162 ) ( not ( = ?auto_7165 ?auto_7163 ) ) ( HOIST-AT ?auto_7166 ?auto_7165 ) ( AVAILABLE ?auto_7166 ) ( SURFACE-AT ?auto_7161 ?auto_7165 ) ( ON ?auto_7161 ?auto_7167 ) ( CLEAR ?auto_7161 ) ( TRUCK-AT ?auto_7164 ?auto_7163 ) ( not ( = ?auto_7160 ?auto_7161 ) ) ( not ( = ?auto_7160 ?auto_7167 ) ) ( not ( = ?auto_7161 ?auto_7167 ) ) ( not ( = ?auto_7162 ?auto_7166 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7164 ?auto_7163 ?auto_7165 )
      ( !LIFT ?auto_7166 ?auto_7161 ?auto_7167 ?auto_7165 )
      ( !LOAD ?auto_7166 ?auto_7161 ?auto_7164 ?auto_7165 )
      ( !DRIVE ?auto_7164 ?auto_7165 ?auto_7163 )
      ( !UNLOAD ?auto_7162 ?auto_7161 ?auto_7164 ?auto_7163 )
      ( !DROP ?auto_7162 ?auto_7161 ?auto_7160 ?auto_7163 )
      ( MAKE-1CRATE-VERIFY ?auto_7160 ?auto_7161 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_7176 - SURFACE
      ?auto_7177 - SURFACE
      ?auto_7178 - SURFACE
      ?auto_7179 - SURFACE
      ?auto_7180 - SURFACE
      ?auto_7182 - SURFACE
      ?auto_7181 - SURFACE
      ?auto_7183 - SURFACE
    )
    :vars
    (
      ?auto_7189 - HOIST
      ?auto_7186 - PLACE
      ?auto_7185 - PLACE
      ?auto_7188 - HOIST
      ?auto_7184 - SURFACE
      ?auto_7204 - PLACE
      ?auto_7203 - HOIST
      ?auto_7205 - SURFACE
      ?auto_7198 - PLACE
      ?auto_7192 - HOIST
      ?auto_7195 - SURFACE
      ?auto_7191 - PLACE
      ?auto_7193 - HOIST
      ?auto_7199 - SURFACE
      ?auto_7200 - SURFACE
      ?auto_7190 - PLACE
      ?auto_7197 - HOIST
      ?auto_7196 - SURFACE
      ?auto_7201 - PLACE
      ?auto_7202 - HOIST
      ?auto_7194 - SURFACE
      ?auto_7187 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7189 ?auto_7186 ) ( IS-CRATE ?auto_7183 ) ( not ( = ?auto_7185 ?auto_7186 ) ) ( HOIST-AT ?auto_7188 ?auto_7185 ) ( AVAILABLE ?auto_7188 ) ( SURFACE-AT ?auto_7183 ?auto_7185 ) ( ON ?auto_7183 ?auto_7184 ) ( CLEAR ?auto_7183 ) ( not ( = ?auto_7181 ?auto_7183 ) ) ( not ( = ?auto_7181 ?auto_7184 ) ) ( not ( = ?auto_7183 ?auto_7184 ) ) ( not ( = ?auto_7189 ?auto_7188 ) ) ( IS-CRATE ?auto_7181 ) ( not ( = ?auto_7204 ?auto_7186 ) ) ( HOIST-AT ?auto_7203 ?auto_7204 ) ( SURFACE-AT ?auto_7181 ?auto_7204 ) ( ON ?auto_7181 ?auto_7205 ) ( CLEAR ?auto_7181 ) ( not ( = ?auto_7182 ?auto_7181 ) ) ( not ( = ?auto_7182 ?auto_7205 ) ) ( not ( = ?auto_7181 ?auto_7205 ) ) ( not ( = ?auto_7189 ?auto_7203 ) ) ( IS-CRATE ?auto_7182 ) ( not ( = ?auto_7198 ?auto_7186 ) ) ( HOIST-AT ?auto_7192 ?auto_7198 ) ( AVAILABLE ?auto_7192 ) ( SURFACE-AT ?auto_7182 ?auto_7198 ) ( ON ?auto_7182 ?auto_7195 ) ( CLEAR ?auto_7182 ) ( not ( = ?auto_7180 ?auto_7182 ) ) ( not ( = ?auto_7180 ?auto_7195 ) ) ( not ( = ?auto_7182 ?auto_7195 ) ) ( not ( = ?auto_7189 ?auto_7192 ) ) ( IS-CRATE ?auto_7180 ) ( not ( = ?auto_7191 ?auto_7186 ) ) ( HOIST-AT ?auto_7193 ?auto_7191 ) ( AVAILABLE ?auto_7193 ) ( SURFACE-AT ?auto_7180 ?auto_7191 ) ( ON ?auto_7180 ?auto_7199 ) ( CLEAR ?auto_7180 ) ( not ( = ?auto_7179 ?auto_7180 ) ) ( not ( = ?auto_7179 ?auto_7199 ) ) ( not ( = ?auto_7180 ?auto_7199 ) ) ( not ( = ?auto_7189 ?auto_7193 ) ) ( IS-CRATE ?auto_7179 ) ( AVAILABLE ?auto_7203 ) ( SURFACE-AT ?auto_7179 ?auto_7204 ) ( ON ?auto_7179 ?auto_7200 ) ( CLEAR ?auto_7179 ) ( not ( = ?auto_7178 ?auto_7179 ) ) ( not ( = ?auto_7178 ?auto_7200 ) ) ( not ( = ?auto_7179 ?auto_7200 ) ) ( IS-CRATE ?auto_7178 ) ( not ( = ?auto_7190 ?auto_7186 ) ) ( HOIST-AT ?auto_7197 ?auto_7190 ) ( AVAILABLE ?auto_7197 ) ( SURFACE-AT ?auto_7178 ?auto_7190 ) ( ON ?auto_7178 ?auto_7196 ) ( CLEAR ?auto_7178 ) ( not ( = ?auto_7177 ?auto_7178 ) ) ( not ( = ?auto_7177 ?auto_7196 ) ) ( not ( = ?auto_7178 ?auto_7196 ) ) ( not ( = ?auto_7189 ?auto_7197 ) ) ( SURFACE-AT ?auto_7176 ?auto_7186 ) ( CLEAR ?auto_7176 ) ( IS-CRATE ?auto_7177 ) ( AVAILABLE ?auto_7189 ) ( not ( = ?auto_7201 ?auto_7186 ) ) ( HOIST-AT ?auto_7202 ?auto_7201 ) ( AVAILABLE ?auto_7202 ) ( SURFACE-AT ?auto_7177 ?auto_7201 ) ( ON ?auto_7177 ?auto_7194 ) ( CLEAR ?auto_7177 ) ( TRUCK-AT ?auto_7187 ?auto_7186 ) ( not ( = ?auto_7176 ?auto_7177 ) ) ( not ( = ?auto_7176 ?auto_7194 ) ) ( not ( = ?auto_7177 ?auto_7194 ) ) ( not ( = ?auto_7189 ?auto_7202 ) ) ( not ( = ?auto_7176 ?auto_7178 ) ) ( not ( = ?auto_7176 ?auto_7196 ) ) ( not ( = ?auto_7178 ?auto_7194 ) ) ( not ( = ?auto_7190 ?auto_7201 ) ) ( not ( = ?auto_7197 ?auto_7202 ) ) ( not ( = ?auto_7196 ?auto_7194 ) ) ( not ( = ?auto_7176 ?auto_7179 ) ) ( not ( = ?auto_7176 ?auto_7200 ) ) ( not ( = ?auto_7177 ?auto_7179 ) ) ( not ( = ?auto_7177 ?auto_7200 ) ) ( not ( = ?auto_7179 ?auto_7196 ) ) ( not ( = ?auto_7179 ?auto_7194 ) ) ( not ( = ?auto_7204 ?auto_7190 ) ) ( not ( = ?auto_7204 ?auto_7201 ) ) ( not ( = ?auto_7203 ?auto_7197 ) ) ( not ( = ?auto_7203 ?auto_7202 ) ) ( not ( = ?auto_7200 ?auto_7196 ) ) ( not ( = ?auto_7200 ?auto_7194 ) ) ( not ( = ?auto_7176 ?auto_7180 ) ) ( not ( = ?auto_7176 ?auto_7199 ) ) ( not ( = ?auto_7177 ?auto_7180 ) ) ( not ( = ?auto_7177 ?auto_7199 ) ) ( not ( = ?auto_7178 ?auto_7180 ) ) ( not ( = ?auto_7178 ?auto_7199 ) ) ( not ( = ?auto_7180 ?auto_7200 ) ) ( not ( = ?auto_7180 ?auto_7196 ) ) ( not ( = ?auto_7180 ?auto_7194 ) ) ( not ( = ?auto_7191 ?auto_7204 ) ) ( not ( = ?auto_7191 ?auto_7190 ) ) ( not ( = ?auto_7191 ?auto_7201 ) ) ( not ( = ?auto_7193 ?auto_7203 ) ) ( not ( = ?auto_7193 ?auto_7197 ) ) ( not ( = ?auto_7193 ?auto_7202 ) ) ( not ( = ?auto_7199 ?auto_7200 ) ) ( not ( = ?auto_7199 ?auto_7196 ) ) ( not ( = ?auto_7199 ?auto_7194 ) ) ( not ( = ?auto_7176 ?auto_7182 ) ) ( not ( = ?auto_7176 ?auto_7195 ) ) ( not ( = ?auto_7177 ?auto_7182 ) ) ( not ( = ?auto_7177 ?auto_7195 ) ) ( not ( = ?auto_7178 ?auto_7182 ) ) ( not ( = ?auto_7178 ?auto_7195 ) ) ( not ( = ?auto_7179 ?auto_7182 ) ) ( not ( = ?auto_7179 ?auto_7195 ) ) ( not ( = ?auto_7182 ?auto_7199 ) ) ( not ( = ?auto_7182 ?auto_7200 ) ) ( not ( = ?auto_7182 ?auto_7196 ) ) ( not ( = ?auto_7182 ?auto_7194 ) ) ( not ( = ?auto_7198 ?auto_7191 ) ) ( not ( = ?auto_7198 ?auto_7204 ) ) ( not ( = ?auto_7198 ?auto_7190 ) ) ( not ( = ?auto_7198 ?auto_7201 ) ) ( not ( = ?auto_7192 ?auto_7193 ) ) ( not ( = ?auto_7192 ?auto_7203 ) ) ( not ( = ?auto_7192 ?auto_7197 ) ) ( not ( = ?auto_7192 ?auto_7202 ) ) ( not ( = ?auto_7195 ?auto_7199 ) ) ( not ( = ?auto_7195 ?auto_7200 ) ) ( not ( = ?auto_7195 ?auto_7196 ) ) ( not ( = ?auto_7195 ?auto_7194 ) ) ( not ( = ?auto_7176 ?auto_7181 ) ) ( not ( = ?auto_7176 ?auto_7205 ) ) ( not ( = ?auto_7177 ?auto_7181 ) ) ( not ( = ?auto_7177 ?auto_7205 ) ) ( not ( = ?auto_7178 ?auto_7181 ) ) ( not ( = ?auto_7178 ?auto_7205 ) ) ( not ( = ?auto_7179 ?auto_7181 ) ) ( not ( = ?auto_7179 ?auto_7205 ) ) ( not ( = ?auto_7180 ?auto_7181 ) ) ( not ( = ?auto_7180 ?auto_7205 ) ) ( not ( = ?auto_7181 ?auto_7195 ) ) ( not ( = ?auto_7181 ?auto_7199 ) ) ( not ( = ?auto_7181 ?auto_7200 ) ) ( not ( = ?auto_7181 ?auto_7196 ) ) ( not ( = ?auto_7181 ?auto_7194 ) ) ( not ( = ?auto_7205 ?auto_7195 ) ) ( not ( = ?auto_7205 ?auto_7199 ) ) ( not ( = ?auto_7205 ?auto_7200 ) ) ( not ( = ?auto_7205 ?auto_7196 ) ) ( not ( = ?auto_7205 ?auto_7194 ) ) ( not ( = ?auto_7176 ?auto_7183 ) ) ( not ( = ?auto_7176 ?auto_7184 ) ) ( not ( = ?auto_7177 ?auto_7183 ) ) ( not ( = ?auto_7177 ?auto_7184 ) ) ( not ( = ?auto_7178 ?auto_7183 ) ) ( not ( = ?auto_7178 ?auto_7184 ) ) ( not ( = ?auto_7179 ?auto_7183 ) ) ( not ( = ?auto_7179 ?auto_7184 ) ) ( not ( = ?auto_7180 ?auto_7183 ) ) ( not ( = ?auto_7180 ?auto_7184 ) ) ( not ( = ?auto_7182 ?auto_7183 ) ) ( not ( = ?auto_7182 ?auto_7184 ) ) ( not ( = ?auto_7183 ?auto_7205 ) ) ( not ( = ?auto_7183 ?auto_7195 ) ) ( not ( = ?auto_7183 ?auto_7199 ) ) ( not ( = ?auto_7183 ?auto_7200 ) ) ( not ( = ?auto_7183 ?auto_7196 ) ) ( not ( = ?auto_7183 ?auto_7194 ) ) ( not ( = ?auto_7185 ?auto_7204 ) ) ( not ( = ?auto_7185 ?auto_7198 ) ) ( not ( = ?auto_7185 ?auto_7191 ) ) ( not ( = ?auto_7185 ?auto_7190 ) ) ( not ( = ?auto_7185 ?auto_7201 ) ) ( not ( = ?auto_7188 ?auto_7203 ) ) ( not ( = ?auto_7188 ?auto_7192 ) ) ( not ( = ?auto_7188 ?auto_7193 ) ) ( not ( = ?auto_7188 ?auto_7197 ) ) ( not ( = ?auto_7188 ?auto_7202 ) ) ( not ( = ?auto_7184 ?auto_7205 ) ) ( not ( = ?auto_7184 ?auto_7195 ) ) ( not ( = ?auto_7184 ?auto_7199 ) ) ( not ( = ?auto_7184 ?auto_7200 ) ) ( not ( = ?auto_7184 ?auto_7196 ) ) ( not ( = ?auto_7184 ?auto_7194 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_7176 ?auto_7177 ?auto_7178 ?auto_7179 ?auto_7180 ?auto_7182 ?auto_7181 )
      ( MAKE-1CRATE ?auto_7181 ?auto_7183 )
      ( MAKE-7CRATE-VERIFY ?auto_7176 ?auto_7177 ?auto_7178 ?auto_7179 ?auto_7180 ?auto_7182 ?auto_7181 ?auto_7183 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7208 - SURFACE
      ?auto_7209 - SURFACE
    )
    :vars
    (
      ?auto_7210 - HOIST
      ?auto_7211 - PLACE
      ?auto_7213 - PLACE
      ?auto_7214 - HOIST
      ?auto_7215 - SURFACE
      ?auto_7212 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7210 ?auto_7211 ) ( SURFACE-AT ?auto_7208 ?auto_7211 ) ( CLEAR ?auto_7208 ) ( IS-CRATE ?auto_7209 ) ( AVAILABLE ?auto_7210 ) ( not ( = ?auto_7213 ?auto_7211 ) ) ( HOIST-AT ?auto_7214 ?auto_7213 ) ( AVAILABLE ?auto_7214 ) ( SURFACE-AT ?auto_7209 ?auto_7213 ) ( ON ?auto_7209 ?auto_7215 ) ( CLEAR ?auto_7209 ) ( TRUCK-AT ?auto_7212 ?auto_7211 ) ( not ( = ?auto_7208 ?auto_7209 ) ) ( not ( = ?auto_7208 ?auto_7215 ) ) ( not ( = ?auto_7209 ?auto_7215 ) ) ( not ( = ?auto_7210 ?auto_7214 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7212 ?auto_7211 ?auto_7213 )
      ( !LIFT ?auto_7214 ?auto_7209 ?auto_7215 ?auto_7213 )
      ( !LOAD ?auto_7214 ?auto_7209 ?auto_7212 ?auto_7213 )
      ( !DRIVE ?auto_7212 ?auto_7213 ?auto_7211 )
      ( !UNLOAD ?auto_7210 ?auto_7209 ?auto_7212 ?auto_7211 )
      ( !DROP ?auto_7210 ?auto_7209 ?auto_7208 ?auto_7211 )
      ( MAKE-1CRATE-VERIFY ?auto_7208 ?auto_7209 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_7225 - SURFACE
      ?auto_7226 - SURFACE
      ?auto_7227 - SURFACE
      ?auto_7228 - SURFACE
      ?auto_7229 - SURFACE
      ?auto_7231 - SURFACE
      ?auto_7230 - SURFACE
      ?auto_7233 - SURFACE
      ?auto_7232 - SURFACE
    )
    :vars
    (
      ?auto_7238 - HOIST
      ?auto_7234 - PLACE
      ?auto_7235 - PLACE
      ?auto_7236 - HOIST
      ?auto_7237 - SURFACE
      ?auto_7251 - SURFACE
      ?auto_7247 - PLACE
      ?auto_7246 - HOIST
      ?auto_7241 - SURFACE
      ?auto_7240 - PLACE
      ?auto_7253 - HOIST
      ?auto_7249 - SURFACE
      ?auto_7248 - PLACE
      ?auto_7250 - HOIST
      ?auto_7242 - SURFACE
      ?auto_7244 - SURFACE
      ?auto_7255 - PLACE
      ?auto_7254 - HOIST
      ?auto_7256 - SURFACE
      ?auto_7243 - PLACE
      ?auto_7245 - HOIST
      ?auto_7252 - SURFACE
      ?auto_7239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7238 ?auto_7234 ) ( IS-CRATE ?auto_7232 ) ( not ( = ?auto_7235 ?auto_7234 ) ) ( HOIST-AT ?auto_7236 ?auto_7235 ) ( SURFACE-AT ?auto_7232 ?auto_7235 ) ( ON ?auto_7232 ?auto_7237 ) ( CLEAR ?auto_7232 ) ( not ( = ?auto_7233 ?auto_7232 ) ) ( not ( = ?auto_7233 ?auto_7237 ) ) ( not ( = ?auto_7232 ?auto_7237 ) ) ( not ( = ?auto_7238 ?auto_7236 ) ) ( IS-CRATE ?auto_7233 ) ( AVAILABLE ?auto_7236 ) ( SURFACE-AT ?auto_7233 ?auto_7235 ) ( ON ?auto_7233 ?auto_7251 ) ( CLEAR ?auto_7233 ) ( not ( = ?auto_7230 ?auto_7233 ) ) ( not ( = ?auto_7230 ?auto_7251 ) ) ( not ( = ?auto_7233 ?auto_7251 ) ) ( IS-CRATE ?auto_7230 ) ( not ( = ?auto_7247 ?auto_7234 ) ) ( HOIST-AT ?auto_7246 ?auto_7247 ) ( SURFACE-AT ?auto_7230 ?auto_7247 ) ( ON ?auto_7230 ?auto_7241 ) ( CLEAR ?auto_7230 ) ( not ( = ?auto_7231 ?auto_7230 ) ) ( not ( = ?auto_7231 ?auto_7241 ) ) ( not ( = ?auto_7230 ?auto_7241 ) ) ( not ( = ?auto_7238 ?auto_7246 ) ) ( IS-CRATE ?auto_7231 ) ( not ( = ?auto_7240 ?auto_7234 ) ) ( HOIST-AT ?auto_7253 ?auto_7240 ) ( AVAILABLE ?auto_7253 ) ( SURFACE-AT ?auto_7231 ?auto_7240 ) ( ON ?auto_7231 ?auto_7249 ) ( CLEAR ?auto_7231 ) ( not ( = ?auto_7229 ?auto_7231 ) ) ( not ( = ?auto_7229 ?auto_7249 ) ) ( not ( = ?auto_7231 ?auto_7249 ) ) ( not ( = ?auto_7238 ?auto_7253 ) ) ( IS-CRATE ?auto_7229 ) ( not ( = ?auto_7248 ?auto_7234 ) ) ( HOIST-AT ?auto_7250 ?auto_7248 ) ( AVAILABLE ?auto_7250 ) ( SURFACE-AT ?auto_7229 ?auto_7248 ) ( ON ?auto_7229 ?auto_7242 ) ( CLEAR ?auto_7229 ) ( not ( = ?auto_7228 ?auto_7229 ) ) ( not ( = ?auto_7228 ?auto_7242 ) ) ( not ( = ?auto_7229 ?auto_7242 ) ) ( not ( = ?auto_7238 ?auto_7250 ) ) ( IS-CRATE ?auto_7228 ) ( AVAILABLE ?auto_7246 ) ( SURFACE-AT ?auto_7228 ?auto_7247 ) ( ON ?auto_7228 ?auto_7244 ) ( CLEAR ?auto_7228 ) ( not ( = ?auto_7227 ?auto_7228 ) ) ( not ( = ?auto_7227 ?auto_7244 ) ) ( not ( = ?auto_7228 ?auto_7244 ) ) ( IS-CRATE ?auto_7227 ) ( not ( = ?auto_7255 ?auto_7234 ) ) ( HOIST-AT ?auto_7254 ?auto_7255 ) ( AVAILABLE ?auto_7254 ) ( SURFACE-AT ?auto_7227 ?auto_7255 ) ( ON ?auto_7227 ?auto_7256 ) ( CLEAR ?auto_7227 ) ( not ( = ?auto_7226 ?auto_7227 ) ) ( not ( = ?auto_7226 ?auto_7256 ) ) ( not ( = ?auto_7227 ?auto_7256 ) ) ( not ( = ?auto_7238 ?auto_7254 ) ) ( SURFACE-AT ?auto_7225 ?auto_7234 ) ( CLEAR ?auto_7225 ) ( IS-CRATE ?auto_7226 ) ( AVAILABLE ?auto_7238 ) ( not ( = ?auto_7243 ?auto_7234 ) ) ( HOIST-AT ?auto_7245 ?auto_7243 ) ( AVAILABLE ?auto_7245 ) ( SURFACE-AT ?auto_7226 ?auto_7243 ) ( ON ?auto_7226 ?auto_7252 ) ( CLEAR ?auto_7226 ) ( TRUCK-AT ?auto_7239 ?auto_7234 ) ( not ( = ?auto_7225 ?auto_7226 ) ) ( not ( = ?auto_7225 ?auto_7252 ) ) ( not ( = ?auto_7226 ?auto_7252 ) ) ( not ( = ?auto_7238 ?auto_7245 ) ) ( not ( = ?auto_7225 ?auto_7227 ) ) ( not ( = ?auto_7225 ?auto_7256 ) ) ( not ( = ?auto_7227 ?auto_7252 ) ) ( not ( = ?auto_7255 ?auto_7243 ) ) ( not ( = ?auto_7254 ?auto_7245 ) ) ( not ( = ?auto_7256 ?auto_7252 ) ) ( not ( = ?auto_7225 ?auto_7228 ) ) ( not ( = ?auto_7225 ?auto_7244 ) ) ( not ( = ?auto_7226 ?auto_7228 ) ) ( not ( = ?auto_7226 ?auto_7244 ) ) ( not ( = ?auto_7228 ?auto_7256 ) ) ( not ( = ?auto_7228 ?auto_7252 ) ) ( not ( = ?auto_7247 ?auto_7255 ) ) ( not ( = ?auto_7247 ?auto_7243 ) ) ( not ( = ?auto_7246 ?auto_7254 ) ) ( not ( = ?auto_7246 ?auto_7245 ) ) ( not ( = ?auto_7244 ?auto_7256 ) ) ( not ( = ?auto_7244 ?auto_7252 ) ) ( not ( = ?auto_7225 ?auto_7229 ) ) ( not ( = ?auto_7225 ?auto_7242 ) ) ( not ( = ?auto_7226 ?auto_7229 ) ) ( not ( = ?auto_7226 ?auto_7242 ) ) ( not ( = ?auto_7227 ?auto_7229 ) ) ( not ( = ?auto_7227 ?auto_7242 ) ) ( not ( = ?auto_7229 ?auto_7244 ) ) ( not ( = ?auto_7229 ?auto_7256 ) ) ( not ( = ?auto_7229 ?auto_7252 ) ) ( not ( = ?auto_7248 ?auto_7247 ) ) ( not ( = ?auto_7248 ?auto_7255 ) ) ( not ( = ?auto_7248 ?auto_7243 ) ) ( not ( = ?auto_7250 ?auto_7246 ) ) ( not ( = ?auto_7250 ?auto_7254 ) ) ( not ( = ?auto_7250 ?auto_7245 ) ) ( not ( = ?auto_7242 ?auto_7244 ) ) ( not ( = ?auto_7242 ?auto_7256 ) ) ( not ( = ?auto_7242 ?auto_7252 ) ) ( not ( = ?auto_7225 ?auto_7231 ) ) ( not ( = ?auto_7225 ?auto_7249 ) ) ( not ( = ?auto_7226 ?auto_7231 ) ) ( not ( = ?auto_7226 ?auto_7249 ) ) ( not ( = ?auto_7227 ?auto_7231 ) ) ( not ( = ?auto_7227 ?auto_7249 ) ) ( not ( = ?auto_7228 ?auto_7231 ) ) ( not ( = ?auto_7228 ?auto_7249 ) ) ( not ( = ?auto_7231 ?auto_7242 ) ) ( not ( = ?auto_7231 ?auto_7244 ) ) ( not ( = ?auto_7231 ?auto_7256 ) ) ( not ( = ?auto_7231 ?auto_7252 ) ) ( not ( = ?auto_7240 ?auto_7248 ) ) ( not ( = ?auto_7240 ?auto_7247 ) ) ( not ( = ?auto_7240 ?auto_7255 ) ) ( not ( = ?auto_7240 ?auto_7243 ) ) ( not ( = ?auto_7253 ?auto_7250 ) ) ( not ( = ?auto_7253 ?auto_7246 ) ) ( not ( = ?auto_7253 ?auto_7254 ) ) ( not ( = ?auto_7253 ?auto_7245 ) ) ( not ( = ?auto_7249 ?auto_7242 ) ) ( not ( = ?auto_7249 ?auto_7244 ) ) ( not ( = ?auto_7249 ?auto_7256 ) ) ( not ( = ?auto_7249 ?auto_7252 ) ) ( not ( = ?auto_7225 ?auto_7230 ) ) ( not ( = ?auto_7225 ?auto_7241 ) ) ( not ( = ?auto_7226 ?auto_7230 ) ) ( not ( = ?auto_7226 ?auto_7241 ) ) ( not ( = ?auto_7227 ?auto_7230 ) ) ( not ( = ?auto_7227 ?auto_7241 ) ) ( not ( = ?auto_7228 ?auto_7230 ) ) ( not ( = ?auto_7228 ?auto_7241 ) ) ( not ( = ?auto_7229 ?auto_7230 ) ) ( not ( = ?auto_7229 ?auto_7241 ) ) ( not ( = ?auto_7230 ?auto_7249 ) ) ( not ( = ?auto_7230 ?auto_7242 ) ) ( not ( = ?auto_7230 ?auto_7244 ) ) ( not ( = ?auto_7230 ?auto_7256 ) ) ( not ( = ?auto_7230 ?auto_7252 ) ) ( not ( = ?auto_7241 ?auto_7249 ) ) ( not ( = ?auto_7241 ?auto_7242 ) ) ( not ( = ?auto_7241 ?auto_7244 ) ) ( not ( = ?auto_7241 ?auto_7256 ) ) ( not ( = ?auto_7241 ?auto_7252 ) ) ( not ( = ?auto_7225 ?auto_7233 ) ) ( not ( = ?auto_7225 ?auto_7251 ) ) ( not ( = ?auto_7226 ?auto_7233 ) ) ( not ( = ?auto_7226 ?auto_7251 ) ) ( not ( = ?auto_7227 ?auto_7233 ) ) ( not ( = ?auto_7227 ?auto_7251 ) ) ( not ( = ?auto_7228 ?auto_7233 ) ) ( not ( = ?auto_7228 ?auto_7251 ) ) ( not ( = ?auto_7229 ?auto_7233 ) ) ( not ( = ?auto_7229 ?auto_7251 ) ) ( not ( = ?auto_7231 ?auto_7233 ) ) ( not ( = ?auto_7231 ?auto_7251 ) ) ( not ( = ?auto_7233 ?auto_7241 ) ) ( not ( = ?auto_7233 ?auto_7249 ) ) ( not ( = ?auto_7233 ?auto_7242 ) ) ( not ( = ?auto_7233 ?auto_7244 ) ) ( not ( = ?auto_7233 ?auto_7256 ) ) ( not ( = ?auto_7233 ?auto_7252 ) ) ( not ( = ?auto_7235 ?auto_7247 ) ) ( not ( = ?auto_7235 ?auto_7240 ) ) ( not ( = ?auto_7235 ?auto_7248 ) ) ( not ( = ?auto_7235 ?auto_7255 ) ) ( not ( = ?auto_7235 ?auto_7243 ) ) ( not ( = ?auto_7236 ?auto_7246 ) ) ( not ( = ?auto_7236 ?auto_7253 ) ) ( not ( = ?auto_7236 ?auto_7250 ) ) ( not ( = ?auto_7236 ?auto_7254 ) ) ( not ( = ?auto_7236 ?auto_7245 ) ) ( not ( = ?auto_7251 ?auto_7241 ) ) ( not ( = ?auto_7251 ?auto_7249 ) ) ( not ( = ?auto_7251 ?auto_7242 ) ) ( not ( = ?auto_7251 ?auto_7244 ) ) ( not ( = ?auto_7251 ?auto_7256 ) ) ( not ( = ?auto_7251 ?auto_7252 ) ) ( not ( = ?auto_7225 ?auto_7232 ) ) ( not ( = ?auto_7225 ?auto_7237 ) ) ( not ( = ?auto_7226 ?auto_7232 ) ) ( not ( = ?auto_7226 ?auto_7237 ) ) ( not ( = ?auto_7227 ?auto_7232 ) ) ( not ( = ?auto_7227 ?auto_7237 ) ) ( not ( = ?auto_7228 ?auto_7232 ) ) ( not ( = ?auto_7228 ?auto_7237 ) ) ( not ( = ?auto_7229 ?auto_7232 ) ) ( not ( = ?auto_7229 ?auto_7237 ) ) ( not ( = ?auto_7231 ?auto_7232 ) ) ( not ( = ?auto_7231 ?auto_7237 ) ) ( not ( = ?auto_7230 ?auto_7232 ) ) ( not ( = ?auto_7230 ?auto_7237 ) ) ( not ( = ?auto_7232 ?auto_7251 ) ) ( not ( = ?auto_7232 ?auto_7241 ) ) ( not ( = ?auto_7232 ?auto_7249 ) ) ( not ( = ?auto_7232 ?auto_7242 ) ) ( not ( = ?auto_7232 ?auto_7244 ) ) ( not ( = ?auto_7232 ?auto_7256 ) ) ( not ( = ?auto_7232 ?auto_7252 ) ) ( not ( = ?auto_7237 ?auto_7251 ) ) ( not ( = ?auto_7237 ?auto_7241 ) ) ( not ( = ?auto_7237 ?auto_7249 ) ) ( not ( = ?auto_7237 ?auto_7242 ) ) ( not ( = ?auto_7237 ?auto_7244 ) ) ( not ( = ?auto_7237 ?auto_7256 ) ) ( not ( = ?auto_7237 ?auto_7252 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_7225 ?auto_7226 ?auto_7227 ?auto_7228 ?auto_7229 ?auto_7231 ?auto_7230 ?auto_7233 )
      ( MAKE-1CRATE ?auto_7233 ?auto_7232 )
      ( MAKE-8CRATE-VERIFY ?auto_7225 ?auto_7226 ?auto_7227 ?auto_7228 ?auto_7229 ?auto_7231 ?auto_7230 ?auto_7233 ?auto_7232 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7259 - SURFACE
      ?auto_7260 - SURFACE
    )
    :vars
    (
      ?auto_7261 - HOIST
      ?auto_7262 - PLACE
      ?auto_7264 - PLACE
      ?auto_7265 - HOIST
      ?auto_7266 - SURFACE
      ?auto_7263 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7261 ?auto_7262 ) ( SURFACE-AT ?auto_7259 ?auto_7262 ) ( CLEAR ?auto_7259 ) ( IS-CRATE ?auto_7260 ) ( AVAILABLE ?auto_7261 ) ( not ( = ?auto_7264 ?auto_7262 ) ) ( HOIST-AT ?auto_7265 ?auto_7264 ) ( AVAILABLE ?auto_7265 ) ( SURFACE-AT ?auto_7260 ?auto_7264 ) ( ON ?auto_7260 ?auto_7266 ) ( CLEAR ?auto_7260 ) ( TRUCK-AT ?auto_7263 ?auto_7262 ) ( not ( = ?auto_7259 ?auto_7260 ) ) ( not ( = ?auto_7259 ?auto_7266 ) ) ( not ( = ?auto_7260 ?auto_7266 ) ) ( not ( = ?auto_7261 ?auto_7265 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7263 ?auto_7262 ?auto_7264 )
      ( !LIFT ?auto_7265 ?auto_7260 ?auto_7266 ?auto_7264 )
      ( !LOAD ?auto_7265 ?auto_7260 ?auto_7263 ?auto_7264 )
      ( !DRIVE ?auto_7263 ?auto_7264 ?auto_7262 )
      ( !UNLOAD ?auto_7261 ?auto_7260 ?auto_7263 ?auto_7262 )
      ( !DROP ?auto_7261 ?auto_7260 ?auto_7259 ?auto_7262 )
      ( MAKE-1CRATE-VERIFY ?auto_7259 ?auto_7260 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_7277 - SURFACE
      ?auto_7278 - SURFACE
      ?auto_7279 - SURFACE
      ?auto_7280 - SURFACE
      ?auto_7281 - SURFACE
      ?auto_7284 - SURFACE
      ?auto_7282 - SURFACE
      ?auto_7286 - SURFACE
      ?auto_7285 - SURFACE
      ?auto_7283 - SURFACE
    )
    :vars
    (
      ?auto_7288 - HOIST
      ?auto_7289 - PLACE
      ?auto_7291 - PLACE
      ?auto_7290 - HOIST
      ?auto_7287 - SURFACE
      ?auto_7311 - PLACE
      ?auto_7293 - HOIST
      ?auto_7295 - SURFACE
      ?auto_7302 - SURFACE
      ?auto_7305 - PLACE
      ?auto_7306 - HOIST
      ?auto_7294 - SURFACE
      ?auto_7296 - PLACE
      ?auto_7304 - HOIST
      ?auto_7301 - SURFACE
      ?auto_7299 - PLACE
      ?auto_7300 - HOIST
      ?auto_7312 - SURFACE
      ?auto_7308 - SURFACE
      ?auto_7298 - PLACE
      ?auto_7309 - HOIST
      ?auto_7297 - SURFACE
      ?auto_7310 - PLACE
      ?auto_7307 - HOIST
      ?auto_7303 - SURFACE
      ?auto_7292 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7288 ?auto_7289 ) ( IS-CRATE ?auto_7283 ) ( not ( = ?auto_7291 ?auto_7289 ) ) ( HOIST-AT ?auto_7290 ?auto_7291 ) ( AVAILABLE ?auto_7290 ) ( SURFACE-AT ?auto_7283 ?auto_7291 ) ( ON ?auto_7283 ?auto_7287 ) ( CLEAR ?auto_7283 ) ( not ( = ?auto_7285 ?auto_7283 ) ) ( not ( = ?auto_7285 ?auto_7287 ) ) ( not ( = ?auto_7283 ?auto_7287 ) ) ( not ( = ?auto_7288 ?auto_7290 ) ) ( IS-CRATE ?auto_7285 ) ( not ( = ?auto_7311 ?auto_7289 ) ) ( HOIST-AT ?auto_7293 ?auto_7311 ) ( SURFACE-AT ?auto_7285 ?auto_7311 ) ( ON ?auto_7285 ?auto_7295 ) ( CLEAR ?auto_7285 ) ( not ( = ?auto_7286 ?auto_7285 ) ) ( not ( = ?auto_7286 ?auto_7295 ) ) ( not ( = ?auto_7285 ?auto_7295 ) ) ( not ( = ?auto_7288 ?auto_7293 ) ) ( IS-CRATE ?auto_7286 ) ( AVAILABLE ?auto_7293 ) ( SURFACE-AT ?auto_7286 ?auto_7311 ) ( ON ?auto_7286 ?auto_7302 ) ( CLEAR ?auto_7286 ) ( not ( = ?auto_7282 ?auto_7286 ) ) ( not ( = ?auto_7282 ?auto_7302 ) ) ( not ( = ?auto_7286 ?auto_7302 ) ) ( IS-CRATE ?auto_7282 ) ( not ( = ?auto_7305 ?auto_7289 ) ) ( HOIST-AT ?auto_7306 ?auto_7305 ) ( SURFACE-AT ?auto_7282 ?auto_7305 ) ( ON ?auto_7282 ?auto_7294 ) ( CLEAR ?auto_7282 ) ( not ( = ?auto_7284 ?auto_7282 ) ) ( not ( = ?auto_7284 ?auto_7294 ) ) ( not ( = ?auto_7282 ?auto_7294 ) ) ( not ( = ?auto_7288 ?auto_7306 ) ) ( IS-CRATE ?auto_7284 ) ( not ( = ?auto_7296 ?auto_7289 ) ) ( HOIST-AT ?auto_7304 ?auto_7296 ) ( AVAILABLE ?auto_7304 ) ( SURFACE-AT ?auto_7284 ?auto_7296 ) ( ON ?auto_7284 ?auto_7301 ) ( CLEAR ?auto_7284 ) ( not ( = ?auto_7281 ?auto_7284 ) ) ( not ( = ?auto_7281 ?auto_7301 ) ) ( not ( = ?auto_7284 ?auto_7301 ) ) ( not ( = ?auto_7288 ?auto_7304 ) ) ( IS-CRATE ?auto_7281 ) ( not ( = ?auto_7299 ?auto_7289 ) ) ( HOIST-AT ?auto_7300 ?auto_7299 ) ( AVAILABLE ?auto_7300 ) ( SURFACE-AT ?auto_7281 ?auto_7299 ) ( ON ?auto_7281 ?auto_7312 ) ( CLEAR ?auto_7281 ) ( not ( = ?auto_7280 ?auto_7281 ) ) ( not ( = ?auto_7280 ?auto_7312 ) ) ( not ( = ?auto_7281 ?auto_7312 ) ) ( not ( = ?auto_7288 ?auto_7300 ) ) ( IS-CRATE ?auto_7280 ) ( AVAILABLE ?auto_7306 ) ( SURFACE-AT ?auto_7280 ?auto_7305 ) ( ON ?auto_7280 ?auto_7308 ) ( CLEAR ?auto_7280 ) ( not ( = ?auto_7279 ?auto_7280 ) ) ( not ( = ?auto_7279 ?auto_7308 ) ) ( not ( = ?auto_7280 ?auto_7308 ) ) ( IS-CRATE ?auto_7279 ) ( not ( = ?auto_7298 ?auto_7289 ) ) ( HOIST-AT ?auto_7309 ?auto_7298 ) ( AVAILABLE ?auto_7309 ) ( SURFACE-AT ?auto_7279 ?auto_7298 ) ( ON ?auto_7279 ?auto_7297 ) ( CLEAR ?auto_7279 ) ( not ( = ?auto_7278 ?auto_7279 ) ) ( not ( = ?auto_7278 ?auto_7297 ) ) ( not ( = ?auto_7279 ?auto_7297 ) ) ( not ( = ?auto_7288 ?auto_7309 ) ) ( SURFACE-AT ?auto_7277 ?auto_7289 ) ( CLEAR ?auto_7277 ) ( IS-CRATE ?auto_7278 ) ( AVAILABLE ?auto_7288 ) ( not ( = ?auto_7310 ?auto_7289 ) ) ( HOIST-AT ?auto_7307 ?auto_7310 ) ( AVAILABLE ?auto_7307 ) ( SURFACE-AT ?auto_7278 ?auto_7310 ) ( ON ?auto_7278 ?auto_7303 ) ( CLEAR ?auto_7278 ) ( TRUCK-AT ?auto_7292 ?auto_7289 ) ( not ( = ?auto_7277 ?auto_7278 ) ) ( not ( = ?auto_7277 ?auto_7303 ) ) ( not ( = ?auto_7278 ?auto_7303 ) ) ( not ( = ?auto_7288 ?auto_7307 ) ) ( not ( = ?auto_7277 ?auto_7279 ) ) ( not ( = ?auto_7277 ?auto_7297 ) ) ( not ( = ?auto_7279 ?auto_7303 ) ) ( not ( = ?auto_7298 ?auto_7310 ) ) ( not ( = ?auto_7309 ?auto_7307 ) ) ( not ( = ?auto_7297 ?auto_7303 ) ) ( not ( = ?auto_7277 ?auto_7280 ) ) ( not ( = ?auto_7277 ?auto_7308 ) ) ( not ( = ?auto_7278 ?auto_7280 ) ) ( not ( = ?auto_7278 ?auto_7308 ) ) ( not ( = ?auto_7280 ?auto_7297 ) ) ( not ( = ?auto_7280 ?auto_7303 ) ) ( not ( = ?auto_7305 ?auto_7298 ) ) ( not ( = ?auto_7305 ?auto_7310 ) ) ( not ( = ?auto_7306 ?auto_7309 ) ) ( not ( = ?auto_7306 ?auto_7307 ) ) ( not ( = ?auto_7308 ?auto_7297 ) ) ( not ( = ?auto_7308 ?auto_7303 ) ) ( not ( = ?auto_7277 ?auto_7281 ) ) ( not ( = ?auto_7277 ?auto_7312 ) ) ( not ( = ?auto_7278 ?auto_7281 ) ) ( not ( = ?auto_7278 ?auto_7312 ) ) ( not ( = ?auto_7279 ?auto_7281 ) ) ( not ( = ?auto_7279 ?auto_7312 ) ) ( not ( = ?auto_7281 ?auto_7308 ) ) ( not ( = ?auto_7281 ?auto_7297 ) ) ( not ( = ?auto_7281 ?auto_7303 ) ) ( not ( = ?auto_7299 ?auto_7305 ) ) ( not ( = ?auto_7299 ?auto_7298 ) ) ( not ( = ?auto_7299 ?auto_7310 ) ) ( not ( = ?auto_7300 ?auto_7306 ) ) ( not ( = ?auto_7300 ?auto_7309 ) ) ( not ( = ?auto_7300 ?auto_7307 ) ) ( not ( = ?auto_7312 ?auto_7308 ) ) ( not ( = ?auto_7312 ?auto_7297 ) ) ( not ( = ?auto_7312 ?auto_7303 ) ) ( not ( = ?auto_7277 ?auto_7284 ) ) ( not ( = ?auto_7277 ?auto_7301 ) ) ( not ( = ?auto_7278 ?auto_7284 ) ) ( not ( = ?auto_7278 ?auto_7301 ) ) ( not ( = ?auto_7279 ?auto_7284 ) ) ( not ( = ?auto_7279 ?auto_7301 ) ) ( not ( = ?auto_7280 ?auto_7284 ) ) ( not ( = ?auto_7280 ?auto_7301 ) ) ( not ( = ?auto_7284 ?auto_7312 ) ) ( not ( = ?auto_7284 ?auto_7308 ) ) ( not ( = ?auto_7284 ?auto_7297 ) ) ( not ( = ?auto_7284 ?auto_7303 ) ) ( not ( = ?auto_7296 ?auto_7299 ) ) ( not ( = ?auto_7296 ?auto_7305 ) ) ( not ( = ?auto_7296 ?auto_7298 ) ) ( not ( = ?auto_7296 ?auto_7310 ) ) ( not ( = ?auto_7304 ?auto_7300 ) ) ( not ( = ?auto_7304 ?auto_7306 ) ) ( not ( = ?auto_7304 ?auto_7309 ) ) ( not ( = ?auto_7304 ?auto_7307 ) ) ( not ( = ?auto_7301 ?auto_7312 ) ) ( not ( = ?auto_7301 ?auto_7308 ) ) ( not ( = ?auto_7301 ?auto_7297 ) ) ( not ( = ?auto_7301 ?auto_7303 ) ) ( not ( = ?auto_7277 ?auto_7282 ) ) ( not ( = ?auto_7277 ?auto_7294 ) ) ( not ( = ?auto_7278 ?auto_7282 ) ) ( not ( = ?auto_7278 ?auto_7294 ) ) ( not ( = ?auto_7279 ?auto_7282 ) ) ( not ( = ?auto_7279 ?auto_7294 ) ) ( not ( = ?auto_7280 ?auto_7282 ) ) ( not ( = ?auto_7280 ?auto_7294 ) ) ( not ( = ?auto_7281 ?auto_7282 ) ) ( not ( = ?auto_7281 ?auto_7294 ) ) ( not ( = ?auto_7282 ?auto_7301 ) ) ( not ( = ?auto_7282 ?auto_7312 ) ) ( not ( = ?auto_7282 ?auto_7308 ) ) ( not ( = ?auto_7282 ?auto_7297 ) ) ( not ( = ?auto_7282 ?auto_7303 ) ) ( not ( = ?auto_7294 ?auto_7301 ) ) ( not ( = ?auto_7294 ?auto_7312 ) ) ( not ( = ?auto_7294 ?auto_7308 ) ) ( not ( = ?auto_7294 ?auto_7297 ) ) ( not ( = ?auto_7294 ?auto_7303 ) ) ( not ( = ?auto_7277 ?auto_7286 ) ) ( not ( = ?auto_7277 ?auto_7302 ) ) ( not ( = ?auto_7278 ?auto_7286 ) ) ( not ( = ?auto_7278 ?auto_7302 ) ) ( not ( = ?auto_7279 ?auto_7286 ) ) ( not ( = ?auto_7279 ?auto_7302 ) ) ( not ( = ?auto_7280 ?auto_7286 ) ) ( not ( = ?auto_7280 ?auto_7302 ) ) ( not ( = ?auto_7281 ?auto_7286 ) ) ( not ( = ?auto_7281 ?auto_7302 ) ) ( not ( = ?auto_7284 ?auto_7286 ) ) ( not ( = ?auto_7284 ?auto_7302 ) ) ( not ( = ?auto_7286 ?auto_7294 ) ) ( not ( = ?auto_7286 ?auto_7301 ) ) ( not ( = ?auto_7286 ?auto_7312 ) ) ( not ( = ?auto_7286 ?auto_7308 ) ) ( not ( = ?auto_7286 ?auto_7297 ) ) ( not ( = ?auto_7286 ?auto_7303 ) ) ( not ( = ?auto_7311 ?auto_7305 ) ) ( not ( = ?auto_7311 ?auto_7296 ) ) ( not ( = ?auto_7311 ?auto_7299 ) ) ( not ( = ?auto_7311 ?auto_7298 ) ) ( not ( = ?auto_7311 ?auto_7310 ) ) ( not ( = ?auto_7293 ?auto_7306 ) ) ( not ( = ?auto_7293 ?auto_7304 ) ) ( not ( = ?auto_7293 ?auto_7300 ) ) ( not ( = ?auto_7293 ?auto_7309 ) ) ( not ( = ?auto_7293 ?auto_7307 ) ) ( not ( = ?auto_7302 ?auto_7294 ) ) ( not ( = ?auto_7302 ?auto_7301 ) ) ( not ( = ?auto_7302 ?auto_7312 ) ) ( not ( = ?auto_7302 ?auto_7308 ) ) ( not ( = ?auto_7302 ?auto_7297 ) ) ( not ( = ?auto_7302 ?auto_7303 ) ) ( not ( = ?auto_7277 ?auto_7285 ) ) ( not ( = ?auto_7277 ?auto_7295 ) ) ( not ( = ?auto_7278 ?auto_7285 ) ) ( not ( = ?auto_7278 ?auto_7295 ) ) ( not ( = ?auto_7279 ?auto_7285 ) ) ( not ( = ?auto_7279 ?auto_7295 ) ) ( not ( = ?auto_7280 ?auto_7285 ) ) ( not ( = ?auto_7280 ?auto_7295 ) ) ( not ( = ?auto_7281 ?auto_7285 ) ) ( not ( = ?auto_7281 ?auto_7295 ) ) ( not ( = ?auto_7284 ?auto_7285 ) ) ( not ( = ?auto_7284 ?auto_7295 ) ) ( not ( = ?auto_7282 ?auto_7285 ) ) ( not ( = ?auto_7282 ?auto_7295 ) ) ( not ( = ?auto_7285 ?auto_7302 ) ) ( not ( = ?auto_7285 ?auto_7294 ) ) ( not ( = ?auto_7285 ?auto_7301 ) ) ( not ( = ?auto_7285 ?auto_7312 ) ) ( not ( = ?auto_7285 ?auto_7308 ) ) ( not ( = ?auto_7285 ?auto_7297 ) ) ( not ( = ?auto_7285 ?auto_7303 ) ) ( not ( = ?auto_7295 ?auto_7302 ) ) ( not ( = ?auto_7295 ?auto_7294 ) ) ( not ( = ?auto_7295 ?auto_7301 ) ) ( not ( = ?auto_7295 ?auto_7312 ) ) ( not ( = ?auto_7295 ?auto_7308 ) ) ( not ( = ?auto_7295 ?auto_7297 ) ) ( not ( = ?auto_7295 ?auto_7303 ) ) ( not ( = ?auto_7277 ?auto_7283 ) ) ( not ( = ?auto_7277 ?auto_7287 ) ) ( not ( = ?auto_7278 ?auto_7283 ) ) ( not ( = ?auto_7278 ?auto_7287 ) ) ( not ( = ?auto_7279 ?auto_7283 ) ) ( not ( = ?auto_7279 ?auto_7287 ) ) ( not ( = ?auto_7280 ?auto_7283 ) ) ( not ( = ?auto_7280 ?auto_7287 ) ) ( not ( = ?auto_7281 ?auto_7283 ) ) ( not ( = ?auto_7281 ?auto_7287 ) ) ( not ( = ?auto_7284 ?auto_7283 ) ) ( not ( = ?auto_7284 ?auto_7287 ) ) ( not ( = ?auto_7282 ?auto_7283 ) ) ( not ( = ?auto_7282 ?auto_7287 ) ) ( not ( = ?auto_7286 ?auto_7283 ) ) ( not ( = ?auto_7286 ?auto_7287 ) ) ( not ( = ?auto_7283 ?auto_7295 ) ) ( not ( = ?auto_7283 ?auto_7302 ) ) ( not ( = ?auto_7283 ?auto_7294 ) ) ( not ( = ?auto_7283 ?auto_7301 ) ) ( not ( = ?auto_7283 ?auto_7312 ) ) ( not ( = ?auto_7283 ?auto_7308 ) ) ( not ( = ?auto_7283 ?auto_7297 ) ) ( not ( = ?auto_7283 ?auto_7303 ) ) ( not ( = ?auto_7291 ?auto_7311 ) ) ( not ( = ?auto_7291 ?auto_7305 ) ) ( not ( = ?auto_7291 ?auto_7296 ) ) ( not ( = ?auto_7291 ?auto_7299 ) ) ( not ( = ?auto_7291 ?auto_7298 ) ) ( not ( = ?auto_7291 ?auto_7310 ) ) ( not ( = ?auto_7290 ?auto_7293 ) ) ( not ( = ?auto_7290 ?auto_7306 ) ) ( not ( = ?auto_7290 ?auto_7304 ) ) ( not ( = ?auto_7290 ?auto_7300 ) ) ( not ( = ?auto_7290 ?auto_7309 ) ) ( not ( = ?auto_7290 ?auto_7307 ) ) ( not ( = ?auto_7287 ?auto_7295 ) ) ( not ( = ?auto_7287 ?auto_7302 ) ) ( not ( = ?auto_7287 ?auto_7294 ) ) ( not ( = ?auto_7287 ?auto_7301 ) ) ( not ( = ?auto_7287 ?auto_7312 ) ) ( not ( = ?auto_7287 ?auto_7308 ) ) ( not ( = ?auto_7287 ?auto_7297 ) ) ( not ( = ?auto_7287 ?auto_7303 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_7277 ?auto_7278 ?auto_7279 ?auto_7280 ?auto_7281 ?auto_7284 ?auto_7282 ?auto_7286 ?auto_7285 )
      ( MAKE-1CRATE ?auto_7285 ?auto_7283 )
      ( MAKE-9CRATE-VERIFY ?auto_7277 ?auto_7278 ?auto_7279 ?auto_7280 ?auto_7281 ?auto_7284 ?auto_7282 ?auto_7286 ?auto_7285 ?auto_7283 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7315 - SURFACE
      ?auto_7316 - SURFACE
    )
    :vars
    (
      ?auto_7317 - HOIST
      ?auto_7318 - PLACE
      ?auto_7320 - PLACE
      ?auto_7321 - HOIST
      ?auto_7322 - SURFACE
      ?auto_7319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7317 ?auto_7318 ) ( SURFACE-AT ?auto_7315 ?auto_7318 ) ( CLEAR ?auto_7315 ) ( IS-CRATE ?auto_7316 ) ( AVAILABLE ?auto_7317 ) ( not ( = ?auto_7320 ?auto_7318 ) ) ( HOIST-AT ?auto_7321 ?auto_7320 ) ( AVAILABLE ?auto_7321 ) ( SURFACE-AT ?auto_7316 ?auto_7320 ) ( ON ?auto_7316 ?auto_7322 ) ( CLEAR ?auto_7316 ) ( TRUCK-AT ?auto_7319 ?auto_7318 ) ( not ( = ?auto_7315 ?auto_7316 ) ) ( not ( = ?auto_7315 ?auto_7322 ) ) ( not ( = ?auto_7316 ?auto_7322 ) ) ( not ( = ?auto_7317 ?auto_7321 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7319 ?auto_7318 ?auto_7320 )
      ( !LIFT ?auto_7321 ?auto_7316 ?auto_7322 ?auto_7320 )
      ( !LOAD ?auto_7321 ?auto_7316 ?auto_7319 ?auto_7320 )
      ( !DRIVE ?auto_7319 ?auto_7320 ?auto_7318 )
      ( !UNLOAD ?auto_7317 ?auto_7316 ?auto_7319 ?auto_7318 )
      ( !DROP ?auto_7317 ?auto_7316 ?auto_7315 ?auto_7318 )
      ( MAKE-1CRATE-VERIFY ?auto_7315 ?auto_7316 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_7334 - SURFACE
      ?auto_7335 - SURFACE
      ?auto_7336 - SURFACE
      ?auto_7337 - SURFACE
      ?auto_7338 - SURFACE
      ?auto_7341 - SURFACE
      ?auto_7339 - SURFACE
      ?auto_7343 - SURFACE
      ?auto_7342 - SURFACE
      ?auto_7340 - SURFACE
      ?auto_7344 - SURFACE
    )
    :vars
    (
      ?auto_7346 - HOIST
      ?auto_7349 - PLACE
      ?auto_7350 - PLACE
      ?auto_7345 - HOIST
      ?auto_7347 - SURFACE
      ?auto_7364 - PLACE
      ?auto_7358 - HOIST
      ?auto_7371 - SURFACE
      ?auto_7359 - PLACE
      ?auto_7365 - HOIST
      ?auto_7361 - SURFACE
      ?auto_7373 - SURFACE
      ?auto_7370 - PLACE
      ?auto_7351 - HOIST
      ?auto_7366 - SURFACE
      ?auto_7356 - PLACE
      ?auto_7353 - HOIST
      ?auto_7372 - SURFACE
      ?auto_7367 - PLACE
      ?auto_7352 - HOIST
      ?auto_7363 - SURFACE
      ?auto_7354 - SURFACE
      ?auto_7368 - PLACE
      ?auto_7362 - HOIST
      ?auto_7369 - SURFACE
      ?auto_7355 - PLACE
      ?auto_7357 - HOIST
      ?auto_7360 - SURFACE
      ?auto_7348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7346 ?auto_7349 ) ( IS-CRATE ?auto_7344 ) ( not ( = ?auto_7350 ?auto_7349 ) ) ( HOIST-AT ?auto_7345 ?auto_7350 ) ( AVAILABLE ?auto_7345 ) ( SURFACE-AT ?auto_7344 ?auto_7350 ) ( ON ?auto_7344 ?auto_7347 ) ( CLEAR ?auto_7344 ) ( not ( = ?auto_7340 ?auto_7344 ) ) ( not ( = ?auto_7340 ?auto_7347 ) ) ( not ( = ?auto_7344 ?auto_7347 ) ) ( not ( = ?auto_7346 ?auto_7345 ) ) ( IS-CRATE ?auto_7340 ) ( not ( = ?auto_7364 ?auto_7349 ) ) ( HOIST-AT ?auto_7358 ?auto_7364 ) ( AVAILABLE ?auto_7358 ) ( SURFACE-AT ?auto_7340 ?auto_7364 ) ( ON ?auto_7340 ?auto_7371 ) ( CLEAR ?auto_7340 ) ( not ( = ?auto_7342 ?auto_7340 ) ) ( not ( = ?auto_7342 ?auto_7371 ) ) ( not ( = ?auto_7340 ?auto_7371 ) ) ( not ( = ?auto_7346 ?auto_7358 ) ) ( IS-CRATE ?auto_7342 ) ( not ( = ?auto_7359 ?auto_7349 ) ) ( HOIST-AT ?auto_7365 ?auto_7359 ) ( SURFACE-AT ?auto_7342 ?auto_7359 ) ( ON ?auto_7342 ?auto_7361 ) ( CLEAR ?auto_7342 ) ( not ( = ?auto_7343 ?auto_7342 ) ) ( not ( = ?auto_7343 ?auto_7361 ) ) ( not ( = ?auto_7342 ?auto_7361 ) ) ( not ( = ?auto_7346 ?auto_7365 ) ) ( IS-CRATE ?auto_7343 ) ( AVAILABLE ?auto_7365 ) ( SURFACE-AT ?auto_7343 ?auto_7359 ) ( ON ?auto_7343 ?auto_7373 ) ( CLEAR ?auto_7343 ) ( not ( = ?auto_7339 ?auto_7343 ) ) ( not ( = ?auto_7339 ?auto_7373 ) ) ( not ( = ?auto_7343 ?auto_7373 ) ) ( IS-CRATE ?auto_7339 ) ( not ( = ?auto_7370 ?auto_7349 ) ) ( HOIST-AT ?auto_7351 ?auto_7370 ) ( SURFACE-AT ?auto_7339 ?auto_7370 ) ( ON ?auto_7339 ?auto_7366 ) ( CLEAR ?auto_7339 ) ( not ( = ?auto_7341 ?auto_7339 ) ) ( not ( = ?auto_7341 ?auto_7366 ) ) ( not ( = ?auto_7339 ?auto_7366 ) ) ( not ( = ?auto_7346 ?auto_7351 ) ) ( IS-CRATE ?auto_7341 ) ( not ( = ?auto_7356 ?auto_7349 ) ) ( HOIST-AT ?auto_7353 ?auto_7356 ) ( AVAILABLE ?auto_7353 ) ( SURFACE-AT ?auto_7341 ?auto_7356 ) ( ON ?auto_7341 ?auto_7372 ) ( CLEAR ?auto_7341 ) ( not ( = ?auto_7338 ?auto_7341 ) ) ( not ( = ?auto_7338 ?auto_7372 ) ) ( not ( = ?auto_7341 ?auto_7372 ) ) ( not ( = ?auto_7346 ?auto_7353 ) ) ( IS-CRATE ?auto_7338 ) ( not ( = ?auto_7367 ?auto_7349 ) ) ( HOIST-AT ?auto_7352 ?auto_7367 ) ( AVAILABLE ?auto_7352 ) ( SURFACE-AT ?auto_7338 ?auto_7367 ) ( ON ?auto_7338 ?auto_7363 ) ( CLEAR ?auto_7338 ) ( not ( = ?auto_7337 ?auto_7338 ) ) ( not ( = ?auto_7337 ?auto_7363 ) ) ( not ( = ?auto_7338 ?auto_7363 ) ) ( not ( = ?auto_7346 ?auto_7352 ) ) ( IS-CRATE ?auto_7337 ) ( AVAILABLE ?auto_7351 ) ( SURFACE-AT ?auto_7337 ?auto_7370 ) ( ON ?auto_7337 ?auto_7354 ) ( CLEAR ?auto_7337 ) ( not ( = ?auto_7336 ?auto_7337 ) ) ( not ( = ?auto_7336 ?auto_7354 ) ) ( not ( = ?auto_7337 ?auto_7354 ) ) ( IS-CRATE ?auto_7336 ) ( not ( = ?auto_7368 ?auto_7349 ) ) ( HOIST-AT ?auto_7362 ?auto_7368 ) ( AVAILABLE ?auto_7362 ) ( SURFACE-AT ?auto_7336 ?auto_7368 ) ( ON ?auto_7336 ?auto_7369 ) ( CLEAR ?auto_7336 ) ( not ( = ?auto_7335 ?auto_7336 ) ) ( not ( = ?auto_7335 ?auto_7369 ) ) ( not ( = ?auto_7336 ?auto_7369 ) ) ( not ( = ?auto_7346 ?auto_7362 ) ) ( SURFACE-AT ?auto_7334 ?auto_7349 ) ( CLEAR ?auto_7334 ) ( IS-CRATE ?auto_7335 ) ( AVAILABLE ?auto_7346 ) ( not ( = ?auto_7355 ?auto_7349 ) ) ( HOIST-AT ?auto_7357 ?auto_7355 ) ( AVAILABLE ?auto_7357 ) ( SURFACE-AT ?auto_7335 ?auto_7355 ) ( ON ?auto_7335 ?auto_7360 ) ( CLEAR ?auto_7335 ) ( TRUCK-AT ?auto_7348 ?auto_7349 ) ( not ( = ?auto_7334 ?auto_7335 ) ) ( not ( = ?auto_7334 ?auto_7360 ) ) ( not ( = ?auto_7335 ?auto_7360 ) ) ( not ( = ?auto_7346 ?auto_7357 ) ) ( not ( = ?auto_7334 ?auto_7336 ) ) ( not ( = ?auto_7334 ?auto_7369 ) ) ( not ( = ?auto_7336 ?auto_7360 ) ) ( not ( = ?auto_7368 ?auto_7355 ) ) ( not ( = ?auto_7362 ?auto_7357 ) ) ( not ( = ?auto_7369 ?auto_7360 ) ) ( not ( = ?auto_7334 ?auto_7337 ) ) ( not ( = ?auto_7334 ?auto_7354 ) ) ( not ( = ?auto_7335 ?auto_7337 ) ) ( not ( = ?auto_7335 ?auto_7354 ) ) ( not ( = ?auto_7337 ?auto_7369 ) ) ( not ( = ?auto_7337 ?auto_7360 ) ) ( not ( = ?auto_7370 ?auto_7368 ) ) ( not ( = ?auto_7370 ?auto_7355 ) ) ( not ( = ?auto_7351 ?auto_7362 ) ) ( not ( = ?auto_7351 ?auto_7357 ) ) ( not ( = ?auto_7354 ?auto_7369 ) ) ( not ( = ?auto_7354 ?auto_7360 ) ) ( not ( = ?auto_7334 ?auto_7338 ) ) ( not ( = ?auto_7334 ?auto_7363 ) ) ( not ( = ?auto_7335 ?auto_7338 ) ) ( not ( = ?auto_7335 ?auto_7363 ) ) ( not ( = ?auto_7336 ?auto_7338 ) ) ( not ( = ?auto_7336 ?auto_7363 ) ) ( not ( = ?auto_7338 ?auto_7354 ) ) ( not ( = ?auto_7338 ?auto_7369 ) ) ( not ( = ?auto_7338 ?auto_7360 ) ) ( not ( = ?auto_7367 ?auto_7370 ) ) ( not ( = ?auto_7367 ?auto_7368 ) ) ( not ( = ?auto_7367 ?auto_7355 ) ) ( not ( = ?auto_7352 ?auto_7351 ) ) ( not ( = ?auto_7352 ?auto_7362 ) ) ( not ( = ?auto_7352 ?auto_7357 ) ) ( not ( = ?auto_7363 ?auto_7354 ) ) ( not ( = ?auto_7363 ?auto_7369 ) ) ( not ( = ?auto_7363 ?auto_7360 ) ) ( not ( = ?auto_7334 ?auto_7341 ) ) ( not ( = ?auto_7334 ?auto_7372 ) ) ( not ( = ?auto_7335 ?auto_7341 ) ) ( not ( = ?auto_7335 ?auto_7372 ) ) ( not ( = ?auto_7336 ?auto_7341 ) ) ( not ( = ?auto_7336 ?auto_7372 ) ) ( not ( = ?auto_7337 ?auto_7341 ) ) ( not ( = ?auto_7337 ?auto_7372 ) ) ( not ( = ?auto_7341 ?auto_7363 ) ) ( not ( = ?auto_7341 ?auto_7354 ) ) ( not ( = ?auto_7341 ?auto_7369 ) ) ( not ( = ?auto_7341 ?auto_7360 ) ) ( not ( = ?auto_7356 ?auto_7367 ) ) ( not ( = ?auto_7356 ?auto_7370 ) ) ( not ( = ?auto_7356 ?auto_7368 ) ) ( not ( = ?auto_7356 ?auto_7355 ) ) ( not ( = ?auto_7353 ?auto_7352 ) ) ( not ( = ?auto_7353 ?auto_7351 ) ) ( not ( = ?auto_7353 ?auto_7362 ) ) ( not ( = ?auto_7353 ?auto_7357 ) ) ( not ( = ?auto_7372 ?auto_7363 ) ) ( not ( = ?auto_7372 ?auto_7354 ) ) ( not ( = ?auto_7372 ?auto_7369 ) ) ( not ( = ?auto_7372 ?auto_7360 ) ) ( not ( = ?auto_7334 ?auto_7339 ) ) ( not ( = ?auto_7334 ?auto_7366 ) ) ( not ( = ?auto_7335 ?auto_7339 ) ) ( not ( = ?auto_7335 ?auto_7366 ) ) ( not ( = ?auto_7336 ?auto_7339 ) ) ( not ( = ?auto_7336 ?auto_7366 ) ) ( not ( = ?auto_7337 ?auto_7339 ) ) ( not ( = ?auto_7337 ?auto_7366 ) ) ( not ( = ?auto_7338 ?auto_7339 ) ) ( not ( = ?auto_7338 ?auto_7366 ) ) ( not ( = ?auto_7339 ?auto_7372 ) ) ( not ( = ?auto_7339 ?auto_7363 ) ) ( not ( = ?auto_7339 ?auto_7354 ) ) ( not ( = ?auto_7339 ?auto_7369 ) ) ( not ( = ?auto_7339 ?auto_7360 ) ) ( not ( = ?auto_7366 ?auto_7372 ) ) ( not ( = ?auto_7366 ?auto_7363 ) ) ( not ( = ?auto_7366 ?auto_7354 ) ) ( not ( = ?auto_7366 ?auto_7369 ) ) ( not ( = ?auto_7366 ?auto_7360 ) ) ( not ( = ?auto_7334 ?auto_7343 ) ) ( not ( = ?auto_7334 ?auto_7373 ) ) ( not ( = ?auto_7335 ?auto_7343 ) ) ( not ( = ?auto_7335 ?auto_7373 ) ) ( not ( = ?auto_7336 ?auto_7343 ) ) ( not ( = ?auto_7336 ?auto_7373 ) ) ( not ( = ?auto_7337 ?auto_7343 ) ) ( not ( = ?auto_7337 ?auto_7373 ) ) ( not ( = ?auto_7338 ?auto_7343 ) ) ( not ( = ?auto_7338 ?auto_7373 ) ) ( not ( = ?auto_7341 ?auto_7343 ) ) ( not ( = ?auto_7341 ?auto_7373 ) ) ( not ( = ?auto_7343 ?auto_7366 ) ) ( not ( = ?auto_7343 ?auto_7372 ) ) ( not ( = ?auto_7343 ?auto_7363 ) ) ( not ( = ?auto_7343 ?auto_7354 ) ) ( not ( = ?auto_7343 ?auto_7369 ) ) ( not ( = ?auto_7343 ?auto_7360 ) ) ( not ( = ?auto_7359 ?auto_7370 ) ) ( not ( = ?auto_7359 ?auto_7356 ) ) ( not ( = ?auto_7359 ?auto_7367 ) ) ( not ( = ?auto_7359 ?auto_7368 ) ) ( not ( = ?auto_7359 ?auto_7355 ) ) ( not ( = ?auto_7365 ?auto_7351 ) ) ( not ( = ?auto_7365 ?auto_7353 ) ) ( not ( = ?auto_7365 ?auto_7352 ) ) ( not ( = ?auto_7365 ?auto_7362 ) ) ( not ( = ?auto_7365 ?auto_7357 ) ) ( not ( = ?auto_7373 ?auto_7366 ) ) ( not ( = ?auto_7373 ?auto_7372 ) ) ( not ( = ?auto_7373 ?auto_7363 ) ) ( not ( = ?auto_7373 ?auto_7354 ) ) ( not ( = ?auto_7373 ?auto_7369 ) ) ( not ( = ?auto_7373 ?auto_7360 ) ) ( not ( = ?auto_7334 ?auto_7342 ) ) ( not ( = ?auto_7334 ?auto_7361 ) ) ( not ( = ?auto_7335 ?auto_7342 ) ) ( not ( = ?auto_7335 ?auto_7361 ) ) ( not ( = ?auto_7336 ?auto_7342 ) ) ( not ( = ?auto_7336 ?auto_7361 ) ) ( not ( = ?auto_7337 ?auto_7342 ) ) ( not ( = ?auto_7337 ?auto_7361 ) ) ( not ( = ?auto_7338 ?auto_7342 ) ) ( not ( = ?auto_7338 ?auto_7361 ) ) ( not ( = ?auto_7341 ?auto_7342 ) ) ( not ( = ?auto_7341 ?auto_7361 ) ) ( not ( = ?auto_7339 ?auto_7342 ) ) ( not ( = ?auto_7339 ?auto_7361 ) ) ( not ( = ?auto_7342 ?auto_7373 ) ) ( not ( = ?auto_7342 ?auto_7366 ) ) ( not ( = ?auto_7342 ?auto_7372 ) ) ( not ( = ?auto_7342 ?auto_7363 ) ) ( not ( = ?auto_7342 ?auto_7354 ) ) ( not ( = ?auto_7342 ?auto_7369 ) ) ( not ( = ?auto_7342 ?auto_7360 ) ) ( not ( = ?auto_7361 ?auto_7373 ) ) ( not ( = ?auto_7361 ?auto_7366 ) ) ( not ( = ?auto_7361 ?auto_7372 ) ) ( not ( = ?auto_7361 ?auto_7363 ) ) ( not ( = ?auto_7361 ?auto_7354 ) ) ( not ( = ?auto_7361 ?auto_7369 ) ) ( not ( = ?auto_7361 ?auto_7360 ) ) ( not ( = ?auto_7334 ?auto_7340 ) ) ( not ( = ?auto_7334 ?auto_7371 ) ) ( not ( = ?auto_7335 ?auto_7340 ) ) ( not ( = ?auto_7335 ?auto_7371 ) ) ( not ( = ?auto_7336 ?auto_7340 ) ) ( not ( = ?auto_7336 ?auto_7371 ) ) ( not ( = ?auto_7337 ?auto_7340 ) ) ( not ( = ?auto_7337 ?auto_7371 ) ) ( not ( = ?auto_7338 ?auto_7340 ) ) ( not ( = ?auto_7338 ?auto_7371 ) ) ( not ( = ?auto_7341 ?auto_7340 ) ) ( not ( = ?auto_7341 ?auto_7371 ) ) ( not ( = ?auto_7339 ?auto_7340 ) ) ( not ( = ?auto_7339 ?auto_7371 ) ) ( not ( = ?auto_7343 ?auto_7340 ) ) ( not ( = ?auto_7343 ?auto_7371 ) ) ( not ( = ?auto_7340 ?auto_7361 ) ) ( not ( = ?auto_7340 ?auto_7373 ) ) ( not ( = ?auto_7340 ?auto_7366 ) ) ( not ( = ?auto_7340 ?auto_7372 ) ) ( not ( = ?auto_7340 ?auto_7363 ) ) ( not ( = ?auto_7340 ?auto_7354 ) ) ( not ( = ?auto_7340 ?auto_7369 ) ) ( not ( = ?auto_7340 ?auto_7360 ) ) ( not ( = ?auto_7364 ?auto_7359 ) ) ( not ( = ?auto_7364 ?auto_7370 ) ) ( not ( = ?auto_7364 ?auto_7356 ) ) ( not ( = ?auto_7364 ?auto_7367 ) ) ( not ( = ?auto_7364 ?auto_7368 ) ) ( not ( = ?auto_7364 ?auto_7355 ) ) ( not ( = ?auto_7358 ?auto_7365 ) ) ( not ( = ?auto_7358 ?auto_7351 ) ) ( not ( = ?auto_7358 ?auto_7353 ) ) ( not ( = ?auto_7358 ?auto_7352 ) ) ( not ( = ?auto_7358 ?auto_7362 ) ) ( not ( = ?auto_7358 ?auto_7357 ) ) ( not ( = ?auto_7371 ?auto_7361 ) ) ( not ( = ?auto_7371 ?auto_7373 ) ) ( not ( = ?auto_7371 ?auto_7366 ) ) ( not ( = ?auto_7371 ?auto_7372 ) ) ( not ( = ?auto_7371 ?auto_7363 ) ) ( not ( = ?auto_7371 ?auto_7354 ) ) ( not ( = ?auto_7371 ?auto_7369 ) ) ( not ( = ?auto_7371 ?auto_7360 ) ) ( not ( = ?auto_7334 ?auto_7344 ) ) ( not ( = ?auto_7334 ?auto_7347 ) ) ( not ( = ?auto_7335 ?auto_7344 ) ) ( not ( = ?auto_7335 ?auto_7347 ) ) ( not ( = ?auto_7336 ?auto_7344 ) ) ( not ( = ?auto_7336 ?auto_7347 ) ) ( not ( = ?auto_7337 ?auto_7344 ) ) ( not ( = ?auto_7337 ?auto_7347 ) ) ( not ( = ?auto_7338 ?auto_7344 ) ) ( not ( = ?auto_7338 ?auto_7347 ) ) ( not ( = ?auto_7341 ?auto_7344 ) ) ( not ( = ?auto_7341 ?auto_7347 ) ) ( not ( = ?auto_7339 ?auto_7344 ) ) ( not ( = ?auto_7339 ?auto_7347 ) ) ( not ( = ?auto_7343 ?auto_7344 ) ) ( not ( = ?auto_7343 ?auto_7347 ) ) ( not ( = ?auto_7342 ?auto_7344 ) ) ( not ( = ?auto_7342 ?auto_7347 ) ) ( not ( = ?auto_7344 ?auto_7371 ) ) ( not ( = ?auto_7344 ?auto_7361 ) ) ( not ( = ?auto_7344 ?auto_7373 ) ) ( not ( = ?auto_7344 ?auto_7366 ) ) ( not ( = ?auto_7344 ?auto_7372 ) ) ( not ( = ?auto_7344 ?auto_7363 ) ) ( not ( = ?auto_7344 ?auto_7354 ) ) ( not ( = ?auto_7344 ?auto_7369 ) ) ( not ( = ?auto_7344 ?auto_7360 ) ) ( not ( = ?auto_7350 ?auto_7364 ) ) ( not ( = ?auto_7350 ?auto_7359 ) ) ( not ( = ?auto_7350 ?auto_7370 ) ) ( not ( = ?auto_7350 ?auto_7356 ) ) ( not ( = ?auto_7350 ?auto_7367 ) ) ( not ( = ?auto_7350 ?auto_7368 ) ) ( not ( = ?auto_7350 ?auto_7355 ) ) ( not ( = ?auto_7345 ?auto_7358 ) ) ( not ( = ?auto_7345 ?auto_7365 ) ) ( not ( = ?auto_7345 ?auto_7351 ) ) ( not ( = ?auto_7345 ?auto_7353 ) ) ( not ( = ?auto_7345 ?auto_7352 ) ) ( not ( = ?auto_7345 ?auto_7362 ) ) ( not ( = ?auto_7345 ?auto_7357 ) ) ( not ( = ?auto_7347 ?auto_7371 ) ) ( not ( = ?auto_7347 ?auto_7361 ) ) ( not ( = ?auto_7347 ?auto_7373 ) ) ( not ( = ?auto_7347 ?auto_7366 ) ) ( not ( = ?auto_7347 ?auto_7372 ) ) ( not ( = ?auto_7347 ?auto_7363 ) ) ( not ( = ?auto_7347 ?auto_7354 ) ) ( not ( = ?auto_7347 ?auto_7369 ) ) ( not ( = ?auto_7347 ?auto_7360 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_7334 ?auto_7335 ?auto_7336 ?auto_7337 ?auto_7338 ?auto_7341 ?auto_7339 ?auto_7343 ?auto_7342 ?auto_7340 )
      ( MAKE-1CRATE ?auto_7340 ?auto_7344 )
      ( MAKE-10CRATE-VERIFY ?auto_7334 ?auto_7335 ?auto_7336 ?auto_7337 ?auto_7338 ?auto_7341 ?auto_7339 ?auto_7343 ?auto_7342 ?auto_7340 ?auto_7344 ) )
  )

)

