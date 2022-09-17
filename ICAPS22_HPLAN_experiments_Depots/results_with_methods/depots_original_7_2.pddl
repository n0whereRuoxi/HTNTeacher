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

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22967 - SURFACE
      ?auto_22968 - SURFACE
    )
    :vars
    (
      ?auto_22969 - HOIST
      ?auto_22970 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22969 ?auto_22970 ) ( SURFACE-AT ?auto_22968 ?auto_22970 ) ( CLEAR ?auto_22968 ) ( LIFTING ?auto_22969 ?auto_22967 ) ( IS-CRATE ?auto_22967 ) ( not ( = ?auto_22967 ?auto_22968 ) ) )
    :subtasks
    ( ( !DROP ?auto_22969 ?auto_22967 ?auto_22968 ?auto_22970 )
      ( MAKE-ON-VERIFY ?auto_22967 ?auto_22968 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22971 - SURFACE
      ?auto_22972 - SURFACE
    )
    :vars
    (
      ?auto_22973 - HOIST
      ?auto_22974 - PLACE
      ?auto_22975 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22973 ?auto_22974 ) ( SURFACE-AT ?auto_22972 ?auto_22974 ) ( CLEAR ?auto_22972 ) ( IS-CRATE ?auto_22971 ) ( not ( = ?auto_22971 ?auto_22972 ) ) ( TRUCK-AT ?auto_22975 ?auto_22974 ) ( AVAILABLE ?auto_22973 ) ( IN ?auto_22971 ?auto_22975 ) )
    :subtasks
    ( ( !UNLOAD ?auto_22973 ?auto_22971 ?auto_22975 ?auto_22974 )
      ( MAKE-ON ?auto_22971 ?auto_22972 )
      ( MAKE-ON-VERIFY ?auto_22971 ?auto_22972 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22976 - SURFACE
      ?auto_22977 - SURFACE
    )
    :vars
    (
      ?auto_22980 - HOIST
      ?auto_22978 - PLACE
      ?auto_22979 - TRUCK
      ?auto_22981 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22980 ?auto_22978 ) ( SURFACE-AT ?auto_22977 ?auto_22978 ) ( CLEAR ?auto_22977 ) ( IS-CRATE ?auto_22976 ) ( not ( = ?auto_22976 ?auto_22977 ) ) ( AVAILABLE ?auto_22980 ) ( IN ?auto_22976 ?auto_22979 ) ( TRUCK-AT ?auto_22979 ?auto_22981 ) ( not ( = ?auto_22981 ?auto_22978 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22979 ?auto_22981 ?auto_22978 )
      ( MAKE-ON ?auto_22976 ?auto_22977 )
      ( MAKE-ON-VERIFY ?auto_22976 ?auto_22977 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22982 - SURFACE
      ?auto_22983 - SURFACE
    )
    :vars
    (
      ?auto_22985 - HOIST
      ?auto_22986 - PLACE
      ?auto_22987 - TRUCK
      ?auto_22984 - PLACE
      ?auto_22988 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22985 ?auto_22986 ) ( SURFACE-AT ?auto_22983 ?auto_22986 ) ( CLEAR ?auto_22983 ) ( IS-CRATE ?auto_22982 ) ( not ( = ?auto_22982 ?auto_22983 ) ) ( AVAILABLE ?auto_22985 ) ( TRUCK-AT ?auto_22987 ?auto_22984 ) ( not ( = ?auto_22984 ?auto_22986 ) ) ( HOIST-AT ?auto_22988 ?auto_22984 ) ( LIFTING ?auto_22988 ?auto_22982 ) ( not ( = ?auto_22985 ?auto_22988 ) ) )
    :subtasks
    ( ( !LOAD ?auto_22988 ?auto_22982 ?auto_22987 ?auto_22984 )
      ( MAKE-ON ?auto_22982 ?auto_22983 )
      ( MAKE-ON-VERIFY ?auto_22982 ?auto_22983 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22989 - SURFACE
      ?auto_22990 - SURFACE
    )
    :vars
    (
      ?auto_22993 - HOIST
      ?auto_22992 - PLACE
      ?auto_22994 - TRUCK
      ?auto_22991 - PLACE
      ?auto_22995 - HOIST
      ?auto_22996 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22993 ?auto_22992 ) ( SURFACE-AT ?auto_22990 ?auto_22992 ) ( CLEAR ?auto_22990 ) ( IS-CRATE ?auto_22989 ) ( not ( = ?auto_22989 ?auto_22990 ) ) ( AVAILABLE ?auto_22993 ) ( TRUCK-AT ?auto_22994 ?auto_22991 ) ( not ( = ?auto_22991 ?auto_22992 ) ) ( HOIST-AT ?auto_22995 ?auto_22991 ) ( not ( = ?auto_22993 ?auto_22995 ) ) ( AVAILABLE ?auto_22995 ) ( SURFACE-AT ?auto_22989 ?auto_22991 ) ( ON ?auto_22989 ?auto_22996 ) ( CLEAR ?auto_22989 ) ( not ( = ?auto_22989 ?auto_22996 ) ) ( not ( = ?auto_22990 ?auto_22996 ) ) )
    :subtasks
    ( ( !LIFT ?auto_22995 ?auto_22989 ?auto_22996 ?auto_22991 )
      ( MAKE-ON ?auto_22989 ?auto_22990 )
      ( MAKE-ON-VERIFY ?auto_22989 ?auto_22990 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_22997 - SURFACE
      ?auto_22998 - SURFACE
    )
    :vars
    (
      ?auto_23003 - HOIST
      ?auto_23004 - PLACE
      ?auto_23002 - PLACE
      ?auto_23001 - HOIST
      ?auto_22999 - SURFACE
      ?auto_23000 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23003 ?auto_23004 ) ( SURFACE-AT ?auto_22998 ?auto_23004 ) ( CLEAR ?auto_22998 ) ( IS-CRATE ?auto_22997 ) ( not ( = ?auto_22997 ?auto_22998 ) ) ( AVAILABLE ?auto_23003 ) ( not ( = ?auto_23002 ?auto_23004 ) ) ( HOIST-AT ?auto_23001 ?auto_23002 ) ( not ( = ?auto_23003 ?auto_23001 ) ) ( AVAILABLE ?auto_23001 ) ( SURFACE-AT ?auto_22997 ?auto_23002 ) ( ON ?auto_22997 ?auto_22999 ) ( CLEAR ?auto_22997 ) ( not ( = ?auto_22997 ?auto_22999 ) ) ( not ( = ?auto_22998 ?auto_22999 ) ) ( TRUCK-AT ?auto_23000 ?auto_23004 ) )
    :subtasks
    ( ( !DRIVE ?auto_23000 ?auto_23004 ?auto_23002 )
      ( MAKE-ON ?auto_22997 ?auto_22998 )
      ( MAKE-ON-VERIFY ?auto_22997 ?auto_22998 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23007 - SURFACE
      ?auto_23008 - SURFACE
    )
    :vars
    (
      ?auto_23009 - HOIST
      ?auto_23010 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23009 ?auto_23010 ) ( SURFACE-AT ?auto_23008 ?auto_23010 ) ( CLEAR ?auto_23008 ) ( LIFTING ?auto_23009 ?auto_23007 ) ( IS-CRATE ?auto_23007 ) ( not ( = ?auto_23007 ?auto_23008 ) ) )
    :subtasks
    ( ( !DROP ?auto_23009 ?auto_23007 ?auto_23008 ?auto_23010 )
      ( MAKE-ON-VERIFY ?auto_23007 ?auto_23008 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23011 - SURFACE
      ?auto_23012 - SURFACE
    )
    :vars
    (
      ?auto_23013 - HOIST
      ?auto_23014 - PLACE
      ?auto_23015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23013 ?auto_23014 ) ( SURFACE-AT ?auto_23012 ?auto_23014 ) ( CLEAR ?auto_23012 ) ( IS-CRATE ?auto_23011 ) ( not ( = ?auto_23011 ?auto_23012 ) ) ( TRUCK-AT ?auto_23015 ?auto_23014 ) ( AVAILABLE ?auto_23013 ) ( IN ?auto_23011 ?auto_23015 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23013 ?auto_23011 ?auto_23015 ?auto_23014 )
      ( MAKE-ON ?auto_23011 ?auto_23012 )
      ( MAKE-ON-VERIFY ?auto_23011 ?auto_23012 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23016 - SURFACE
      ?auto_23017 - SURFACE
    )
    :vars
    (
      ?auto_23019 - HOIST
      ?auto_23018 - PLACE
      ?auto_23020 - TRUCK
      ?auto_23021 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23019 ?auto_23018 ) ( SURFACE-AT ?auto_23017 ?auto_23018 ) ( CLEAR ?auto_23017 ) ( IS-CRATE ?auto_23016 ) ( not ( = ?auto_23016 ?auto_23017 ) ) ( AVAILABLE ?auto_23019 ) ( IN ?auto_23016 ?auto_23020 ) ( TRUCK-AT ?auto_23020 ?auto_23021 ) ( not ( = ?auto_23021 ?auto_23018 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23020 ?auto_23021 ?auto_23018 )
      ( MAKE-ON ?auto_23016 ?auto_23017 )
      ( MAKE-ON-VERIFY ?auto_23016 ?auto_23017 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23022 - SURFACE
      ?auto_23023 - SURFACE
    )
    :vars
    (
      ?auto_23025 - HOIST
      ?auto_23024 - PLACE
      ?auto_23026 - TRUCK
      ?auto_23027 - PLACE
      ?auto_23028 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23025 ?auto_23024 ) ( SURFACE-AT ?auto_23023 ?auto_23024 ) ( CLEAR ?auto_23023 ) ( IS-CRATE ?auto_23022 ) ( not ( = ?auto_23022 ?auto_23023 ) ) ( AVAILABLE ?auto_23025 ) ( TRUCK-AT ?auto_23026 ?auto_23027 ) ( not ( = ?auto_23027 ?auto_23024 ) ) ( HOIST-AT ?auto_23028 ?auto_23027 ) ( LIFTING ?auto_23028 ?auto_23022 ) ( not ( = ?auto_23025 ?auto_23028 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23028 ?auto_23022 ?auto_23026 ?auto_23027 )
      ( MAKE-ON ?auto_23022 ?auto_23023 )
      ( MAKE-ON-VERIFY ?auto_23022 ?auto_23023 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23029 - SURFACE
      ?auto_23030 - SURFACE
    )
    :vars
    (
      ?auto_23033 - HOIST
      ?auto_23035 - PLACE
      ?auto_23032 - TRUCK
      ?auto_23031 - PLACE
      ?auto_23034 - HOIST
      ?auto_23036 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23033 ?auto_23035 ) ( SURFACE-AT ?auto_23030 ?auto_23035 ) ( CLEAR ?auto_23030 ) ( IS-CRATE ?auto_23029 ) ( not ( = ?auto_23029 ?auto_23030 ) ) ( AVAILABLE ?auto_23033 ) ( TRUCK-AT ?auto_23032 ?auto_23031 ) ( not ( = ?auto_23031 ?auto_23035 ) ) ( HOIST-AT ?auto_23034 ?auto_23031 ) ( not ( = ?auto_23033 ?auto_23034 ) ) ( AVAILABLE ?auto_23034 ) ( SURFACE-AT ?auto_23029 ?auto_23031 ) ( ON ?auto_23029 ?auto_23036 ) ( CLEAR ?auto_23029 ) ( not ( = ?auto_23029 ?auto_23036 ) ) ( not ( = ?auto_23030 ?auto_23036 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23034 ?auto_23029 ?auto_23036 ?auto_23031 )
      ( MAKE-ON ?auto_23029 ?auto_23030 )
      ( MAKE-ON-VERIFY ?auto_23029 ?auto_23030 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23037 - SURFACE
      ?auto_23038 - SURFACE
    )
    :vars
    (
      ?auto_23039 - HOIST
      ?auto_23044 - PLACE
      ?auto_23042 - PLACE
      ?auto_23040 - HOIST
      ?auto_23043 - SURFACE
      ?auto_23041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23039 ?auto_23044 ) ( SURFACE-AT ?auto_23038 ?auto_23044 ) ( CLEAR ?auto_23038 ) ( IS-CRATE ?auto_23037 ) ( not ( = ?auto_23037 ?auto_23038 ) ) ( AVAILABLE ?auto_23039 ) ( not ( = ?auto_23042 ?auto_23044 ) ) ( HOIST-AT ?auto_23040 ?auto_23042 ) ( not ( = ?auto_23039 ?auto_23040 ) ) ( AVAILABLE ?auto_23040 ) ( SURFACE-AT ?auto_23037 ?auto_23042 ) ( ON ?auto_23037 ?auto_23043 ) ( CLEAR ?auto_23037 ) ( not ( = ?auto_23037 ?auto_23043 ) ) ( not ( = ?auto_23038 ?auto_23043 ) ) ( TRUCK-AT ?auto_23041 ?auto_23044 ) )
    :subtasks
    ( ( !DRIVE ?auto_23041 ?auto_23044 ?auto_23042 )
      ( MAKE-ON ?auto_23037 ?auto_23038 )
      ( MAKE-ON-VERIFY ?auto_23037 ?auto_23038 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23045 - SURFACE
      ?auto_23046 - SURFACE
    )
    :vars
    (
      ?auto_23048 - HOIST
      ?auto_23052 - PLACE
      ?auto_23050 - PLACE
      ?auto_23049 - HOIST
      ?auto_23051 - SURFACE
      ?auto_23047 - TRUCK
      ?auto_23053 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23048 ?auto_23052 ) ( IS-CRATE ?auto_23045 ) ( not ( = ?auto_23045 ?auto_23046 ) ) ( not ( = ?auto_23050 ?auto_23052 ) ) ( HOIST-AT ?auto_23049 ?auto_23050 ) ( not ( = ?auto_23048 ?auto_23049 ) ) ( AVAILABLE ?auto_23049 ) ( SURFACE-AT ?auto_23045 ?auto_23050 ) ( ON ?auto_23045 ?auto_23051 ) ( CLEAR ?auto_23045 ) ( not ( = ?auto_23045 ?auto_23051 ) ) ( not ( = ?auto_23046 ?auto_23051 ) ) ( TRUCK-AT ?auto_23047 ?auto_23052 ) ( SURFACE-AT ?auto_23053 ?auto_23052 ) ( CLEAR ?auto_23053 ) ( LIFTING ?auto_23048 ?auto_23046 ) ( IS-CRATE ?auto_23046 ) ( not ( = ?auto_23045 ?auto_23053 ) ) ( not ( = ?auto_23046 ?auto_23053 ) ) ( not ( = ?auto_23051 ?auto_23053 ) ) )
    :subtasks
    ( ( !DROP ?auto_23048 ?auto_23046 ?auto_23053 ?auto_23052 )
      ( MAKE-ON ?auto_23045 ?auto_23046 )
      ( MAKE-ON-VERIFY ?auto_23045 ?auto_23046 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23054 - SURFACE
      ?auto_23055 - SURFACE
    )
    :vars
    (
      ?auto_23058 - HOIST
      ?auto_23056 - PLACE
      ?auto_23057 - PLACE
      ?auto_23059 - HOIST
      ?auto_23060 - SURFACE
      ?auto_23061 - TRUCK
      ?auto_23062 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23058 ?auto_23056 ) ( IS-CRATE ?auto_23054 ) ( not ( = ?auto_23054 ?auto_23055 ) ) ( not ( = ?auto_23057 ?auto_23056 ) ) ( HOIST-AT ?auto_23059 ?auto_23057 ) ( not ( = ?auto_23058 ?auto_23059 ) ) ( AVAILABLE ?auto_23059 ) ( SURFACE-AT ?auto_23054 ?auto_23057 ) ( ON ?auto_23054 ?auto_23060 ) ( CLEAR ?auto_23054 ) ( not ( = ?auto_23054 ?auto_23060 ) ) ( not ( = ?auto_23055 ?auto_23060 ) ) ( TRUCK-AT ?auto_23061 ?auto_23056 ) ( SURFACE-AT ?auto_23062 ?auto_23056 ) ( CLEAR ?auto_23062 ) ( IS-CRATE ?auto_23055 ) ( not ( = ?auto_23054 ?auto_23062 ) ) ( not ( = ?auto_23055 ?auto_23062 ) ) ( not ( = ?auto_23060 ?auto_23062 ) ) ( AVAILABLE ?auto_23058 ) ( IN ?auto_23055 ?auto_23061 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23058 ?auto_23055 ?auto_23061 ?auto_23056 )
      ( MAKE-ON ?auto_23054 ?auto_23055 )
      ( MAKE-ON-VERIFY ?auto_23054 ?auto_23055 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23063 - SURFACE
      ?auto_23064 - SURFACE
    )
    :vars
    (
      ?auto_23066 - HOIST
      ?auto_23071 - PLACE
      ?auto_23068 - PLACE
      ?auto_23070 - HOIST
      ?auto_23069 - SURFACE
      ?auto_23065 - SURFACE
      ?auto_23067 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23066 ?auto_23071 ) ( IS-CRATE ?auto_23063 ) ( not ( = ?auto_23063 ?auto_23064 ) ) ( not ( = ?auto_23068 ?auto_23071 ) ) ( HOIST-AT ?auto_23070 ?auto_23068 ) ( not ( = ?auto_23066 ?auto_23070 ) ) ( AVAILABLE ?auto_23070 ) ( SURFACE-AT ?auto_23063 ?auto_23068 ) ( ON ?auto_23063 ?auto_23069 ) ( CLEAR ?auto_23063 ) ( not ( = ?auto_23063 ?auto_23069 ) ) ( not ( = ?auto_23064 ?auto_23069 ) ) ( SURFACE-AT ?auto_23065 ?auto_23071 ) ( CLEAR ?auto_23065 ) ( IS-CRATE ?auto_23064 ) ( not ( = ?auto_23063 ?auto_23065 ) ) ( not ( = ?auto_23064 ?auto_23065 ) ) ( not ( = ?auto_23069 ?auto_23065 ) ) ( AVAILABLE ?auto_23066 ) ( IN ?auto_23064 ?auto_23067 ) ( TRUCK-AT ?auto_23067 ?auto_23068 ) )
    :subtasks
    ( ( !DRIVE ?auto_23067 ?auto_23068 ?auto_23071 )
      ( MAKE-ON ?auto_23063 ?auto_23064 )
      ( MAKE-ON-VERIFY ?auto_23063 ?auto_23064 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23072 - SURFACE
      ?auto_23073 - SURFACE
    )
    :vars
    (
      ?auto_23079 - HOIST
      ?auto_23074 - PLACE
      ?auto_23075 - PLACE
      ?auto_23080 - HOIST
      ?auto_23076 - SURFACE
      ?auto_23078 - SURFACE
      ?auto_23077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23079 ?auto_23074 ) ( IS-CRATE ?auto_23072 ) ( not ( = ?auto_23072 ?auto_23073 ) ) ( not ( = ?auto_23075 ?auto_23074 ) ) ( HOIST-AT ?auto_23080 ?auto_23075 ) ( not ( = ?auto_23079 ?auto_23080 ) ) ( SURFACE-AT ?auto_23072 ?auto_23075 ) ( ON ?auto_23072 ?auto_23076 ) ( CLEAR ?auto_23072 ) ( not ( = ?auto_23072 ?auto_23076 ) ) ( not ( = ?auto_23073 ?auto_23076 ) ) ( SURFACE-AT ?auto_23078 ?auto_23074 ) ( CLEAR ?auto_23078 ) ( IS-CRATE ?auto_23073 ) ( not ( = ?auto_23072 ?auto_23078 ) ) ( not ( = ?auto_23073 ?auto_23078 ) ) ( not ( = ?auto_23076 ?auto_23078 ) ) ( AVAILABLE ?auto_23079 ) ( TRUCK-AT ?auto_23077 ?auto_23075 ) ( LIFTING ?auto_23080 ?auto_23073 ) )
    :subtasks
    ( ( !LOAD ?auto_23080 ?auto_23073 ?auto_23077 ?auto_23075 )
      ( MAKE-ON ?auto_23072 ?auto_23073 )
      ( MAKE-ON-VERIFY ?auto_23072 ?auto_23073 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23081 - SURFACE
      ?auto_23082 - SURFACE
    )
    :vars
    (
      ?auto_23084 - HOIST
      ?auto_23085 - PLACE
      ?auto_23089 - PLACE
      ?auto_23088 - HOIST
      ?auto_23083 - SURFACE
      ?auto_23086 - SURFACE
      ?auto_23087 - TRUCK
      ?auto_23090 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23084 ?auto_23085 ) ( IS-CRATE ?auto_23081 ) ( not ( = ?auto_23081 ?auto_23082 ) ) ( not ( = ?auto_23089 ?auto_23085 ) ) ( HOIST-AT ?auto_23088 ?auto_23089 ) ( not ( = ?auto_23084 ?auto_23088 ) ) ( SURFACE-AT ?auto_23081 ?auto_23089 ) ( ON ?auto_23081 ?auto_23083 ) ( CLEAR ?auto_23081 ) ( not ( = ?auto_23081 ?auto_23083 ) ) ( not ( = ?auto_23082 ?auto_23083 ) ) ( SURFACE-AT ?auto_23086 ?auto_23085 ) ( CLEAR ?auto_23086 ) ( IS-CRATE ?auto_23082 ) ( not ( = ?auto_23081 ?auto_23086 ) ) ( not ( = ?auto_23082 ?auto_23086 ) ) ( not ( = ?auto_23083 ?auto_23086 ) ) ( AVAILABLE ?auto_23084 ) ( TRUCK-AT ?auto_23087 ?auto_23089 ) ( AVAILABLE ?auto_23088 ) ( SURFACE-AT ?auto_23082 ?auto_23089 ) ( ON ?auto_23082 ?auto_23090 ) ( CLEAR ?auto_23082 ) ( not ( = ?auto_23081 ?auto_23090 ) ) ( not ( = ?auto_23082 ?auto_23090 ) ) ( not ( = ?auto_23083 ?auto_23090 ) ) ( not ( = ?auto_23086 ?auto_23090 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23088 ?auto_23082 ?auto_23090 ?auto_23089 )
      ( MAKE-ON ?auto_23081 ?auto_23082 )
      ( MAKE-ON-VERIFY ?auto_23081 ?auto_23082 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23091 - SURFACE
      ?auto_23092 - SURFACE
    )
    :vars
    (
      ?auto_23095 - HOIST
      ?auto_23096 - PLACE
      ?auto_23099 - PLACE
      ?auto_23097 - HOIST
      ?auto_23098 - SURFACE
      ?auto_23093 - SURFACE
      ?auto_23100 - SURFACE
      ?auto_23094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23095 ?auto_23096 ) ( IS-CRATE ?auto_23091 ) ( not ( = ?auto_23091 ?auto_23092 ) ) ( not ( = ?auto_23099 ?auto_23096 ) ) ( HOIST-AT ?auto_23097 ?auto_23099 ) ( not ( = ?auto_23095 ?auto_23097 ) ) ( SURFACE-AT ?auto_23091 ?auto_23099 ) ( ON ?auto_23091 ?auto_23098 ) ( CLEAR ?auto_23091 ) ( not ( = ?auto_23091 ?auto_23098 ) ) ( not ( = ?auto_23092 ?auto_23098 ) ) ( SURFACE-AT ?auto_23093 ?auto_23096 ) ( CLEAR ?auto_23093 ) ( IS-CRATE ?auto_23092 ) ( not ( = ?auto_23091 ?auto_23093 ) ) ( not ( = ?auto_23092 ?auto_23093 ) ) ( not ( = ?auto_23098 ?auto_23093 ) ) ( AVAILABLE ?auto_23095 ) ( AVAILABLE ?auto_23097 ) ( SURFACE-AT ?auto_23092 ?auto_23099 ) ( ON ?auto_23092 ?auto_23100 ) ( CLEAR ?auto_23092 ) ( not ( = ?auto_23091 ?auto_23100 ) ) ( not ( = ?auto_23092 ?auto_23100 ) ) ( not ( = ?auto_23098 ?auto_23100 ) ) ( not ( = ?auto_23093 ?auto_23100 ) ) ( TRUCK-AT ?auto_23094 ?auto_23096 ) )
    :subtasks
    ( ( !DRIVE ?auto_23094 ?auto_23096 ?auto_23099 )
      ( MAKE-ON ?auto_23091 ?auto_23092 )
      ( MAKE-ON-VERIFY ?auto_23091 ?auto_23092 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23103 - SURFACE
      ?auto_23104 - SURFACE
    )
    :vars
    (
      ?auto_23105 - HOIST
      ?auto_23106 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23105 ?auto_23106 ) ( SURFACE-AT ?auto_23104 ?auto_23106 ) ( CLEAR ?auto_23104 ) ( LIFTING ?auto_23105 ?auto_23103 ) ( IS-CRATE ?auto_23103 ) ( not ( = ?auto_23103 ?auto_23104 ) ) )
    :subtasks
    ( ( !DROP ?auto_23105 ?auto_23103 ?auto_23104 ?auto_23106 )
      ( MAKE-ON-VERIFY ?auto_23103 ?auto_23104 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23107 - SURFACE
      ?auto_23108 - SURFACE
    )
    :vars
    (
      ?auto_23109 - HOIST
      ?auto_23110 - PLACE
      ?auto_23111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23109 ?auto_23110 ) ( SURFACE-AT ?auto_23108 ?auto_23110 ) ( CLEAR ?auto_23108 ) ( IS-CRATE ?auto_23107 ) ( not ( = ?auto_23107 ?auto_23108 ) ) ( TRUCK-AT ?auto_23111 ?auto_23110 ) ( AVAILABLE ?auto_23109 ) ( IN ?auto_23107 ?auto_23111 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23109 ?auto_23107 ?auto_23111 ?auto_23110 )
      ( MAKE-ON ?auto_23107 ?auto_23108 )
      ( MAKE-ON-VERIFY ?auto_23107 ?auto_23108 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23112 - SURFACE
      ?auto_23113 - SURFACE
    )
    :vars
    (
      ?auto_23115 - HOIST
      ?auto_23114 - PLACE
      ?auto_23116 - TRUCK
      ?auto_23117 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23115 ?auto_23114 ) ( SURFACE-AT ?auto_23113 ?auto_23114 ) ( CLEAR ?auto_23113 ) ( IS-CRATE ?auto_23112 ) ( not ( = ?auto_23112 ?auto_23113 ) ) ( AVAILABLE ?auto_23115 ) ( IN ?auto_23112 ?auto_23116 ) ( TRUCK-AT ?auto_23116 ?auto_23117 ) ( not ( = ?auto_23117 ?auto_23114 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23116 ?auto_23117 ?auto_23114 )
      ( MAKE-ON ?auto_23112 ?auto_23113 )
      ( MAKE-ON-VERIFY ?auto_23112 ?auto_23113 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23118 - SURFACE
      ?auto_23119 - SURFACE
    )
    :vars
    (
      ?auto_23122 - HOIST
      ?auto_23123 - PLACE
      ?auto_23121 - TRUCK
      ?auto_23120 - PLACE
      ?auto_23124 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23122 ?auto_23123 ) ( SURFACE-AT ?auto_23119 ?auto_23123 ) ( CLEAR ?auto_23119 ) ( IS-CRATE ?auto_23118 ) ( not ( = ?auto_23118 ?auto_23119 ) ) ( AVAILABLE ?auto_23122 ) ( TRUCK-AT ?auto_23121 ?auto_23120 ) ( not ( = ?auto_23120 ?auto_23123 ) ) ( HOIST-AT ?auto_23124 ?auto_23120 ) ( LIFTING ?auto_23124 ?auto_23118 ) ( not ( = ?auto_23122 ?auto_23124 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23124 ?auto_23118 ?auto_23121 ?auto_23120 )
      ( MAKE-ON ?auto_23118 ?auto_23119 )
      ( MAKE-ON-VERIFY ?auto_23118 ?auto_23119 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23125 - SURFACE
      ?auto_23126 - SURFACE
    )
    :vars
    (
      ?auto_23129 - HOIST
      ?auto_23130 - PLACE
      ?auto_23128 - TRUCK
      ?auto_23127 - PLACE
      ?auto_23131 - HOIST
      ?auto_23132 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23129 ?auto_23130 ) ( SURFACE-AT ?auto_23126 ?auto_23130 ) ( CLEAR ?auto_23126 ) ( IS-CRATE ?auto_23125 ) ( not ( = ?auto_23125 ?auto_23126 ) ) ( AVAILABLE ?auto_23129 ) ( TRUCK-AT ?auto_23128 ?auto_23127 ) ( not ( = ?auto_23127 ?auto_23130 ) ) ( HOIST-AT ?auto_23131 ?auto_23127 ) ( not ( = ?auto_23129 ?auto_23131 ) ) ( AVAILABLE ?auto_23131 ) ( SURFACE-AT ?auto_23125 ?auto_23127 ) ( ON ?auto_23125 ?auto_23132 ) ( CLEAR ?auto_23125 ) ( not ( = ?auto_23125 ?auto_23132 ) ) ( not ( = ?auto_23126 ?auto_23132 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23131 ?auto_23125 ?auto_23132 ?auto_23127 )
      ( MAKE-ON ?auto_23125 ?auto_23126 )
      ( MAKE-ON-VERIFY ?auto_23125 ?auto_23126 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23133 - SURFACE
      ?auto_23134 - SURFACE
    )
    :vars
    (
      ?auto_23136 - HOIST
      ?auto_23140 - PLACE
      ?auto_23138 - PLACE
      ?auto_23135 - HOIST
      ?auto_23137 - SURFACE
      ?auto_23139 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23136 ?auto_23140 ) ( SURFACE-AT ?auto_23134 ?auto_23140 ) ( CLEAR ?auto_23134 ) ( IS-CRATE ?auto_23133 ) ( not ( = ?auto_23133 ?auto_23134 ) ) ( AVAILABLE ?auto_23136 ) ( not ( = ?auto_23138 ?auto_23140 ) ) ( HOIST-AT ?auto_23135 ?auto_23138 ) ( not ( = ?auto_23136 ?auto_23135 ) ) ( AVAILABLE ?auto_23135 ) ( SURFACE-AT ?auto_23133 ?auto_23138 ) ( ON ?auto_23133 ?auto_23137 ) ( CLEAR ?auto_23133 ) ( not ( = ?auto_23133 ?auto_23137 ) ) ( not ( = ?auto_23134 ?auto_23137 ) ) ( TRUCK-AT ?auto_23139 ?auto_23140 ) )
    :subtasks
    ( ( !DRIVE ?auto_23139 ?auto_23140 ?auto_23138 )
      ( MAKE-ON ?auto_23133 ?auto_23134 )
      ( MAKE-ON-VERIFY ?auto_23133 ?auto_23134 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23141 - SURFACE
      ?auto_23142 - SURFACE
    )
    :vars
    (
      ?auto_23145 - HOIST
      ?auto_23144 - PLACE
      ?auto_23147 - PLACE
      ?auto_23143 - HOIST
      ?auto_23148 - SURFACE
      ?auto_23146 - TRUCK
      ?auto_23149 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23145 ?auto_23144 ) ( IS-CRATE ?auto_23141 ) ( not ( = ?auto_23141 ?auto_23142 ) ) ( not ( = ?auto_23147 ?auto_23144 ) ) ( HOIST-AT ?auto_23143 ?auto_23147 ) ( not ( = ?auto_23145 ?auto_23143 ) ) ( AVAILABLE ?auto_23143 ) ( SURFACE-AT ?auto_23141 ?auto_23147 ) ( ON ?auto_23141 ?auto_23148 ) ( CLEAR ?auto_23141 ) ( not ( = ?auto_23141 ?auto_23148 ) ) ( not ( = ?auto_23142 ?auto_23148 ) ) ( TRUCK-AT ?auto_23146 ?auto_23144 ) ( SURFACE-AT ?auto_23149 ?auto_23144 ) ( CLEAR ?auto_23149 ) ( LIFTING ?auto_23145 ?auto_23142 ) ( IS-CRATE ?auto_23142 ) ( not ( = ?auto_23141 ?auto_23149 ) ) ( not ( = ?auto_23142 ?auto_23149 ) ) ( not ( = ?auto_23148 ?auto_23149 ) ) )
    :subtasks
    ( ( !DROP ?auto_23145 ?auto_23142 ?auto_23149 ?auto_23144 )
      ( MAKE-ON ?auto_23141 ?auto_23142 )
      ( MAKE-ON-VERIFY ?auto_23141 ?auto_23142 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23150 - SURFACE
      ?auto_23151 - SURFACE
    )
    :vars
    (
      ?auto_23154 - HOIST
      ?auto_23158 - PLACE
      ?auto_23152 - PLACE
      ?auto_23155 - HOIST
      ?auto_23153 - SURFACE
      ?auto_23156 - TRUCK
      ?auto_23157 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23154 ?auto_23158 ) ( IS-CRATE ?auto_23150 ) ( not ( = ?auto_23150 ?auto_23151 ) ) ( not ( = ?auto_23152 ?auto_23158 ) ) ( HOIST-AT ?auto_23155 ?auto_23152 ) ( not ( = ?auto_23154 ?auto_23155 ) ) ( AVAILABLE ?auto_23155 ) ( SURFACE-AT ?auto_23150 ?auto_23152 ) ( ON ?auto_23150 ?auto_23153 ) ( CLEAR ?auto_23150 ) ( not ( = ?auto_23150 ?auto_23153 ) ) ( not ( = ?auto_23151 ?auto_23153 ) ) ( TRUCK-AT ?auto_23156 ?auto_23158 ) ( SURFACE-AT ?auto_23157 ?auto_23158 ) ( CLEAR ?auto_23157 ) ( IS-CRATE ?auto_23151 ) ( not ( = ?auto_23150 ?auto_23157 ) ) ( not ( = ?auto_23151 ?auto_23157 ) ) ( not ( = ?auto_23153 ?auto_23157 ) ) ( AVAILABLE ?auto_23154 ) ( IN ?auto_23151 ?auto_23156 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23154 ?auto_23151 ?auto_23156 ?auto_23158 )
      ( MAKE-ON ?auto_23150 ?auto_23151 )
      ( MAKE-ON-VERIFY ?auto_23150 ?auto_23151 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23159 - SURFACE
      ?auto_23160 - SURFACE
    )
    :vars
    (
      ?auto_23166 - HOIST
      ?auto_23165 - PLACE
      ?auto_23164 - PLACE
      ?auto_23161 - HOIST
      ?auto_23163 - SURFACE
      ?auto_23167 - SURFACE
      ?auto_23162 - TRUCK
      ?auto_23168 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23166 ?auto_23165 ) ( IS-CRATE ?auto_23159 ) ( not ( = ?auto_23159 ?auto_23160 ) ) ( not ( = ?auto_23164 ?auto_23165 ) ) ( HOIST-AT ?auto_23161 ?auto_23164 ) ( not ( = ?auto_23166 ?auto_23161 ) ) ( AVAILABLE ?auto_23161 ) ( SURFACE-AT ?auto_23159 ?auto_23164 ) ( ON ?auto_23159 ?auto_23163 ) ( CLEAR ?auto_23159 ) ( not ( = ?auto_23159 ?auto_23163 ) ) ( not ( = ?auto_23160 ?auto_23163 ) ) ( SURFACE-AT ?auto_23167 ?auto_23165 ) ( CLEAR ?auto_23167 ) ( IS-CRATE ?auto_23160 ) ( not ( = ?auto_23159 ?auto_23167 ) ) ( not ( = ?auto_23160 ?auto_23167 ) ) ( not ( = ?auto_23163 ?auto_23167 ) ) ( AVAILABLE ?auto_23166 ) ( IN ?auto_23160 ?auto_23162 ) ( TRUCK-AT ?auto_23162 ?auto_23168 ) ( not ( = ?auto_23168 ?auto_23165 ) ) ( not ( = ?auto_23164 ?auto_23168 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23162 ?auto_23168 ?auto_23165 )
      ( MAKE-ON ?auto_23159 ?auto_23160 )
      ( MAKE-ON-VERIFY ?auto_23159 ?auto_23160 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23169 - SURFACE
      ?auto_23170 - SURFACE
    )
    :vars
    (
      ?auto_23175 - HOIST
      ?auto_23178 - PLACE
      ?auto_23173 - PLACE
      ?auto_23174 - HOIST
      ?auto_23171 - SURFACE
      ?auto_23177 - SURFACE
      ?auto_23176 - TRUCK
      ?auto_23172 - PLACE
      ?auto_23179 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23175 ?auto_23178 ) ( IS-CRATE ?auto_23169 ) ( not ( = ?auto_23169 ?auto_23170 ) ) ( not ( = ?auto_23173 ?auto_23178 ) ) ( HOIST-AT ?auto_23174 ?auto_23173 ) ( not ( = ?auto_23175 ?auto_23174 ) ) ( AVAILABLE ?auto_23174 ) ( SURFACE-AT ?auto_23169 ?auto_23173 ) ( ON ?auto_23169 ?auto_23171 ) ( CLEAR ?auto_23169 ) ( not ( = ?auto_23169 ?auto_23171 ) ) ( not ( = ?auto_23170 ?auto_23171 ) ) ( SURFACE-AT ?auto_23177 ?auto_23178 ) ( CLEAR ?auto_23177 ) ( IS-CRATE ?auto_23170 ) ( not ( = ?auto_23169 ?auto_23177 ) ) ( not ( = ?auto_23170 ?auto_23177 ) ) ( not ( = ?auto_23171 ?auto_23177 ) ) ( AVAILABLE ?auto_23175 ) ( TRUCK-AT ?auto_23176 ?auto_23172 ) ( not ( = ?auto_23172 ?auto_23178 ) ) ( not ( = ?auto_23173 ?auto_23172 ) ) ( HOIST-AT ?auto_23179 ?auto_23172 ) ( LIFTING ?auto_23179 ?auto_23170 ) ( not ( = ?auto_23175 ?auto_23179 ) ) ( not ( = ?auto_23174 ?auto_23179 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23179 ?auto_23170 ?auto_23176 ?auto_23172 )
      ( MAKE-ON ?auto_23169 ?auto_23170 )
      ( MAKE-ON-VERIFY ?auto_23169 ?auto_23170 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23180 - SURFACE
      ?auto_23181 - SURFACE
    )
    :vars
    (
      ?auto_23185 - HOIST
      ?auto_23188 - PLACE
      ?auto_23182 - PLACE
      ?auto_23183 - HOIST
      ?auto_23189 - SURFACE
      ?auto_23187 - SURFACE
      ?auto_23186 - TRUCK
      ?auto_23184 - PLACE
      ?auto_23190 - HOIST
      ?auto_23191 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23185 ?auto_23188 ) ( IS-CRATE ?auto_23180 ) ( not ( = ?auto_23180 ?auto_23181 ) ) ( not ( = ?auto_23182 ?auto_23188 ) ) ( HOIST-AT ?auto_23183 ?auto_23182 ) ( not ( = ?auto_23185 ?auto_23183 ) ) ( AVAILABLE ?auto_23183 ) ( SURFACE-AT ?auto_23180 ?auto_23182 ) ( ON ?auto_23180 ?auto_23189 ) ( CLEAR ?auto_23180 ) ( not ( = ?auto_23180 ?auto_23189 ) ) ( not ( = ?auto_23181 ?auto_23189 ) ) ( SURFACE-AT ?auto_23187 ?auto_23188 ) ( CLEAR ?auto_23187 ) ( IS-CRATE ?auto_23181 ) ( not ( = ?auto_23180 ?auto_23187 ) ) ( not ( = ?auto_23181 ?auto_23187 ) ) ( not ( = ?auto_23189 ?auto_23187 ) ) ( AVAILABLE ?auto_23185 ) ( TRUCK-AT ?auto_23186 ?auto_23184 ) ( not ( = ?auto_23184 ?auto_23188 ) ) ( not ( = ?auto_23182 ?auto_23184 ) ) ( HOIST-AT ?auto_23190 ?auto_23184 ) ( not ( = ?auto_23185 ?auto_23190 ) ) ( not ( = ?auto_23183 ?auto_23190 ) ) ( AVAILABLE ?auto_23190 ) ( SURFACE-AT ?auto_23181 ?auto_23184 ) ( ON ?auto_23181 ?auto_23191 ) ( CLEAR ?auto_23181 ) ( not ( = ?auto_23180 ?auto_23191 ) ) ( not ( = ?auto_23181 ?auto_23191 ) ) ( not ( = ?auto_23189 ?auto_23191 ) ) ( not ( = ?auto_23187 ?auto_23191 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23190 ?auto_23181 ?auto_23191 ?auto_23184 )
      ( MAKE-ON ?auto_23180 ?auto_23181 )
      ( MAKE-ON-VERIFY ?auto_23180 ?auto_23181 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23192 - SURFACE
      ?auto_23193 - SURFACE
    )
    :vars
    (
      ?auto_23197 - HOIST
      ?auto_23196 - PLACE
      ?auto_23199 - PLACE
      ?auto_23195 - HOIST
      ?auto_23203 - SURFACE
      ?auto_23198 - SURFACE
      ?auto_23200 - PLACE
      ?auto_23201 - HOIST
      ?auto_23194 - SURFACE
      ?auto_23202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23197 ?auto_23196 ) ( IS-CRATE ?auto_23192 ) ( not ( = ?auto_23192 ?auto_23193 ) ) ( not ( = ?auto_23199 ?auto_23196 ) ) ( HOIST-AT ?auto_23195 ?auto_23199 ) ( not ( = ?auto_23197 ?auto_23195 ) ) ( AVAILABLE ?auto_23195 ) ( SURFACE-AT ?auto_23192 ?auto_23199 ) ( ON ?auto_23192 ?auto_23203 ) ( CLEAR ?auto_23192 ) ( not ( = ?auto_23192 ?auto_23203 ) ) ( not ( = ?auto_23193 ?auto_23203 ) ) ( SURFACE-AT ?auto_23198 ?auto_23196 ) ( CLEAR ?auto_23198 ) ( IS-CRATE ?auto_23193 ) ( not ( = ?auto_23192 ?auto_23198 ) ) ( not ( = ?auto_23193 ?auto_23198 ) ) ( not ( = ?auto_23203 ?auto_23198 ) ) ( AVAILABLE ?auto_23197 ) ( not ( = ?auto_23200 ?auto_23196 ) ) ( not ( = ?auto_23199 ?auto_23200 ) ) ( HOIST-AT ?auto_23201 ?auto_23200 ) ( not ( = ?auto_23197 ?auto_23201 ) ) ( not ( = ?auto_23195 ?auto_23201 ) ) ( AVAILABLE ?auto_23201 ) ( SURFACE-AT ?auto_23193 ?auto_23200 ) ( ON ?auto_23193 ?auto_23194 ) ( CLEAR ?auto_23193 ) ( not ( = ?auto_23192 ?auto_23194 ) ) ( not ( = ?auto_23193 ?auto_23194 ) ) ( not ( = ?auto_23203 ?auto_23194 ) ) ( not ( = ?auto_23198 ?auto_23194 ) ) ( TRUCK-AT ?auto_23202 ?auto_23196 ) )
    :subtasks
    ( ( !DRIVE ?auto_23202 ?auto_23196 ?auto_23200 )
      ( MAKE-ON ?auto_23192 ?auto_23193 )
      ( MAKE-ON-VERIFY ?auto_23192 ?auto_23193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23204 - SURFACE
      ?auto_23205 - SURFACE
    )
    :vars
    (
      ?auto_23208 - HOIST
      ?auto_23212 - PLACE
      ?auto_23206 - PLACE
      ?auto_23213 - HOIST
      ?auto_23210 - SURFACE
      ?auto_23209 - SURFACE
      ?auto_23211 - PLACE
      ?auto_23207 - HOIST
      ?auto_23214 - SURFACE
      ?auto_23215 - TRUCK
      ?auto_23216 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23208 ?auto_23212 ) ( IS-CRATE ?auto_23204 ) ( not ( = ?auto_23204 ?auto_23205 ) ) ( not ( = ?auto_23206 ?auto_23212 ) ) ( HOIST-AT ?auto_23213 ?auto_23206 ) ( not ( = ?auto_23208 ?auto_23213 ) ) ( AVAILABLE ?auto_23213 ) ( SURFACE-AT ?auto_23204 ?auto_23206 ) ( ON ?auto_23204 ?auto_23210 ) ( CLEAR ?auto_23204 ) ( not ( = ?auto_23204 ?auto_23210 ) ) ( not ( = ?auto_23205 ?auto_23210 ) ) ( IS-CRATE ?auto_23205 ) ( not ( = ?auto_23204 ?auto_23209 ) ) ( not ( = ?auto_23205 ?auto_23209 ) ) ( not ( = ?auto_23210 ?auto_23209 ) ) ( not ( = ?auto_23211 ?auto_23212 ) ) ( not ( = ?auto_23206 ?auto_23211 ) ) ( HOIST-AT ?auto_23207 ?auto_23211 ) ( not ( = ?auto_23208 ?auto_23207 ) ) ( not ( = ?auto_23213 ?auto_23207 ) ) ( AVAILABLE ?auto_23207 ) ( SURFACE-AT ?auto_23205 ?auto_23211 ) ( ON ?auto_23205 ?auto_23214 ) ( CLEAR ?auto_23205 ) ( not ( = ?auto_23204 ?auto_23214 ) ) ( not ( = ?auto_23205 ?auto_23214 ) ) ( not ( = ?auto_23210 ?auto_23214 ) ) ( not ( = ?auto_23209 ?auto_23214 ) ) ( TRUCK-AT ?auto_23215 ?auto_23212 ) ( SURFACE-AT ?auto_23216 ?auto_23212 ) ( CLEAR ?auto_23216 ) ( LIFTING ?auto_23208 ?auto_23209 ) ( IS-CRATE ?auto_23209 ) ( not ( = ?auto_23204 ?auto_23216 ) ) ( not ( = ?auto_23205 ?auto_23216 ) ) ( not ( = ?auto_23210 ?auto_23216 ) ) ( not ( = ?auto_23209 ?auto_23216 ) ) ( not ( = ?auto_23214 ?auto_23216 ) ) )
    :subtasks
    ( ( !DROP ?auto_23208 ?auto_23209 ?auto_23216 ?auto_23212 )
      ( MAKE-ON ?auto_23204 ?auto_23205 )
      ( MAKE-ON-VERIFY ?auto_23204 ?auto_23205 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23217 - SURFACE
      ?auto_23218 - SURFACE
    )
    :vars
    (
      ?auto_23229 - HOIST
      ?auto_23219 - PLACE
      ?auto_23222 - PLACE
      ?auto_23221 - HOIST
      ?auto_23228 - SURFACE
      ?auto_23227 - SURFACE
      ?auto_23225 - PLACE
      ?auto_23223 - HOIST
      ?auto_23226 - SURFACE
      ?auto_23220 - TRUCK
      ?auto_23224 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23229 ?auto_23219 ) ( IS-CRATE ?auto_23217 ) ( not ( = ?auto_23217 ?auto_23218 ) ) ( not ( = ?auto_23222 ?auto_23219 ) ) ( HOIST-AT ?auto_23221 ?auto_23222 ) ( not ( = ?auto_23229 ?auto_23221 ) ) ( AVAILABLE ?auto_23221 ) ( SURFACE-AT ?auto_23217 ?auto_23222 ) ( ON ?auto_23217 ?auto_23228 ) ( CLEAR ?auto_23217 ) ( not ( = ?auto_23217 ?auto_23228 ) ) ( not ( = ?auto_23218 ?auto_23228 ) ) ( IS-CRATE ?auto_23218 ) ( not ( = ?auto_23217 ?auto_23227 ) ) ( not ( = ?auto_23218 ?auto_23227 ) ) ( not ( = ?auto_23228 ?auto_23227 ) ) ( not ( = ?auto_23225 ?auto_23219 ) ) ( not ( = ?auto_23222 ?auto_23225 ) ) ( HOIST-AT ?auto_23223 ?auto_23225 ) ( not ( = ?auto_23229 ?auto_23223 ) ) ( not ( = ?auto_23221 ?auto_23223 ) ) ( AVAILABLE ?auto_23223 ) ( SURFACE-AT ?auto_23218 ?auto_23225 ) ( ON ?auto_23218 ?auto_23226 ) ( CLEAR ?auto_23218 ) ( not ( = ?auto_23217 ?auto_23226 ) ) ( not ( = ?auto_23218 ?auto_23226 ) ) ( not ( = ?auto_23228 ?auto_23226 ) ) ( not ( = ?auto_23227 ?auto_23226 ) ) ( TRUCK-AT ?auto_23220 ?auto_23219 ) ( SURFACE-AT ?auto_23224 ?auto_23219 ) ( CLEAR ?auto_23224 ) ( IS-CRATE ?auto_23227 ) ( not ( = ?auto_23217 ?auto_23224 ) ) ( not ( = ?auto_23218 ?auto_23224 ) ) ( not ( = ?auto_23228 ?auto_23224 ) ) ( not ( = ?auto_23227 ?auto_23224 ) ) ( not ( = ?auto_23226 ?auto_23224 ) ) ( AVAILABLE ?auto_23229 ) ( IN ?auto_23227 ?auto_23220 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23229 ?auto_23227 ?auto_23220 ?auto_23219 )
      ( MAKE-ON ?auto_23217 ?auto_23218 )
      ( MAKE-ON-VERIFY ?auto_23217 ?auto_23218 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23230 - SURFACE
      ?auto_23231 - SURFACE
    )
    :vars
    (
      ?auto_23242 - HOIST
      ?auto_23232 - PLACE
      ?auto_23236 - PLACE
      ?auto_23238 - HOIST
      ?auto_23234 - SURFACE
      ?auto_23240 - SURFACE
      ?auto_23237 - PLACE
      ?auto_23241 - HOIST
      ?auto_23233 - SURFACE
      ?auto_23239 - SURFACE
      ?auto_23235 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23242 ?auto_23232 ) ( IS-CRATE ?auto_23230 ) ( not ( = ?auto_23230 ?auto_23231 ) ) ( not ( = ?auto_23236 ?auto_23232 ) ) ( HOIST-AT ?auto_23238 ?auto_23236 ) ( not ( = ?auto_23242 ?auto_23238 ) ) ( AVAILABLE ?auto_23238 ) ( SURFACE-AT ?auto_23230 ?auto_23236 ) ( ON ?auto_23230 ?auto_23234 ) ( CLEAR ?auto_23230 ) ( not ( = ?auto_23230 ?auto_23234 ) ) ( not ( = ?auto_23231 ?auto_23234 ) ) ( IS-CRATE ?auto_23231 ) ( not ( = ?auto_23230 ?auto_23240 ) ) ( not ( = ?auto_23231 ?auto_23240 ) ) ( not ( = ?auto_23234 ?auto_23240 ) ) ( not ( = ?auto_23237 ?auto_23232 ) ) ( not ( = ?auto_23236 ?auto_23237 ) ) ( HOIST-AT ?auto_23241 ?auto_23237 ) ( not ( = ?auto_23242 ?auto_23241 ) ) ( not ( = ?auto_23238 ?auto_23241 ) ) ( AVAILABLE ?auto_23241 ) ( SURFACE-AT ?auto_23231 ?auto_23237 ) ( ON ?auto_23231 ?auto_23233 ) ( CLEAR ?auto_23231 ) ( not ( = ?auto_23230 ?auto_23233 ) ) ( not ( = ?auto_23231 ?auto_23233 ) ) ( not ( = ?auto_23234 ?auto_23233 ) ) ( not ( = ?auto_23240 ?auto_23233 ) ) ( SURFACE-AT ?auto_23239 ?auto_23232 ) ( CLEAR ?auto_23239 ) ( IS-CRATE ?auto_23240 ) ( not ( = ?auto_23230 ?auto_23239 ) ) ( not ( = ?auto_23231 ?auto_23239 ) ) ( not ( = ?auto_23234 ?auto_23239 ) ) ( not ( = ?auto_23240 ?auto_23239 ) ) ( not ( = ?auto_23233 ?auto_23239 ) ) ( AVAILABLE ?auto_23242 ) ( IN ?auto_23240 ?auto_23235 ) ( TRUCK-AT ?auto_23235 ?auto_23237 ) )
    :subtasks
    ( ( !DRIVE ?auto_23235 ?auto_23237 ?auto_23232 )
      ( MAKE-ON ?auto_23230 ?auto_23231 )
      ( MAKE-ON-VERIFY ?auto_23230 ?auto_23231 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23243 - SURFACE
      ?auto_23244 - SURFACE
    )
    :vars
    (
      ?auto_23249 - HOIST
      ?auto_23246 - PLACE
      ?auto_23245 - PLACE
      ?auto_23254 - HOIST
      ?auto_23247 - SURFACE
      ?auto_23250 - SURFACE
      ?auto_23253 - PLACE
      ?auto_23251 - HOIST
      ?auto_23255 - SURFACE
      ?auto_23252 - SURFACE
      ?auto_23248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23249 ?auto_23246 ) ( IS-CRATE ?auto_23243 ) ( not ( = ?auto_23243 ?auto_23244 ) ) ( not ( = ?auto_23245 ?auto_23246 ) ) ( HOIST-AT ?auto_23254 ?auto_23245 ) ( not ( = ?auto_23249 ?auto_23254 ) ) ( AVAILABLE ?auto_23254 ) ( SURFACE-AT ?auto_23243 ?auto_23245 ) ( ON ?auto_23243 ?auto_23247 ) ( CLEAR ?auto_23243 ) ( not ( = ?auto_23243 ?auto_23247 ) ) ( not ( = ?auto_23244 ?auto_23247 ) ) ( IS-CRATE ?auto_23244 ) ( not ( = ?auto_23243 ?auto_23250 ) ) ( not ( = ?auto_23244 ?auto_23250 ) ) ( not ( = ?auto_23247 ?auto_23250 ) ) ( not ( = ?auto_23253 ?auto_23246 ) ) ( not ( = ?auto_23245 ?auto_23253 ) ) ( HOIST-AT ?auto_23251 ?auto_23253 ) ( not ( = ?auto_23249 ?auto_23251 ) ) ( not ( = ?auto_23254 ?auto_23251 ) ) ( SURFACE-AT ?auto_23244 ?auto_23253 ) ( ON ?auto_23244 ?auto_23255 ) ( CLEAR ?auto_23244 ) ( not ( = ?auto_23243 ?auto_23255 ) ) ( not ( = ?auto_23244 ?auto_23255 ) ) ( not ( = ?auto_23247 ?auto_23255 ) ) ( not ( = ?auto_23250 ?auto_23255 ) ) ( SURFACE-AT ?auto_23252 ?auto_23246 ) ( CLEAR ?auto_23252 ) ( IS-CRATE ?auto_23250 ) ( not ( = ?auto_23243 ?auto_23252 ) ) ( not ( = ?auto_23244 ?auto_23252 ) ) ( not ( = ?auto_23247 ?auto_23252 ) ) ( not ( = ?auto_23250 ?auto_23252 ) ) ( not ( = ?auto_23255 ?auto_23252 ) ) ( AVAILABLE ?auto_23249 ) ( TRUCK-AT ?auto_23248 ?auto_23253 ) ( LIFTING ?auto_23251 ?auto_23250 ) )
    :subtasks
    ( ( !LOAD ?auto_23251 ?auto_23250 ?auto_23248 ?auto_23253 )
      ( MAKE-ON ?auto_23243 ?auto_23244 )
      ( MAKE-ON-VERIFY ?auto_23243 ?auto_23244 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23256 - SURFACE
      ?auto_23257 - SURFACE
    )
    :vars
    (
      ?auto_23258 - HOIST
      ?auto_23259 - PLACE
      ?auto_23268 - PLACE
      ?auto_23261 - HOIST
      ?auto_23260 - SURFACE
      ?auto_23262 - SURFACE
      ?auto_23267 - PLACE
      ?auto_23265 - HOIST
      ?auto_23263 - SURFACE
      ?auto_23266 - SURFACE
      ?auto_23264 - TRUCK
      ?auto_23269 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23258 ?auto_23259 ) ( IS-CRATE ?auto_23256 ) ( not ( = ?auto_23256 ?auto_23257 ) ) ( not ( = ?auto_23268 ?auto_23259 ) ) ( HOIST-AT ?auto_23261 ?auto_23268 ) ( not ( = ?auto_23258 ?auto_23261 ) ) ( AVAILABLE ?auto_23261 ) ( SURFACE-AT ?auto_23256 ?auto_23268 ) ( ON ?auto_23256 ?auto_23260 ) ( CLEAR ?auto_23256 ) ( not ( = ?auto_23256 ?auto_23260 ) ) ( not ( = ?auto_23257 ?auto_23260 ) ) ( IS-CRATE ?auto_23257 ) ( not ( = ?auto_23256 ?auto_23262 ) ) ( not ( = ?auto_23257 ?auto_23262 ) ) ( not ( = ?auto_23260 ?auto_23262 ) ) ( not ( = ?auto_23267 ?auto_23259 ) ) ( not ( = ?auto_23268 ?auto_23267 ) ) ( HOIST-AT ?auto_23265 ?auto_23267 ) ( not ( = ?auto_23258 ?auto_23265 ) ) ( not ( = ?auto_23261 ?auto_23265 ) ) ( SURFACE-AT ?auto_23257 ?auto_23267 ) ( ON ?auto_23257 ?auto_23263 ) ( CLEAR ?auto_23257 ) ( not ( = ?auto_23256 ?auto_23263 ) ) ( not ( = ?auto_23257 ?auto_23263 ) ) ( not ( = ?auto_23260 ?auto_23263 ) ) ( not ( = ?auto_23262 ?auto_23263 ) ) ( SURFACE-AT ?auto_23266 ?auto_23259 ) ( CLEAR ?auto_23266 ) ( IS-CRATE ?auto_23262 ) ( not ( = ?auto_23256 ?auto_23266 ) ) ( not ( = ?auto_23257 ?auto_23266 ) ) ( not ( = ?auto_23260 ?auto_23266 ) ) ( not ( = ?auto_23262 ?auto_23266 ) ) ( not ( = ?auto_23263 ?auto_23266 ) ) ( AVAILABLE ?auto_23258 ) ( TRUCK-AT ?auto_23264 ?auto_23267 ) ( AVAILABLE ?auto_23265 ) ( SURFACE-AT ?auto_23262 ?auto_23267 ) ( ON ?auto_23262 ?auto_23269 ) ( CLEAR ?auto_23262 ) ( not ( = ?auto_23256 ?auto_23269 ) ) ( not ( = ?auto_23257 ?auto_23269 ) ) ( not ( = ?auto_23260 ?auto_23269 ) ) ( not ( = ?auto_23262 ?auto_23269 ) ) ( not ( = ?auto_23263 ?auto_23269 ) ) ( not ( = ?auto_23266 ?auto_23269 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23265 ?auto_23262 ?auto_23269 ?auto_23267 )
      ( MAKE-ON ?auto_23256 ?auto_23257 )
      ( MAKE-ON-VERIFY ?auto_23256 ?auto_23257 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23270 - SURFACE
      ?auto_23271 - SURFACE
    )
    :vars
    (
      ?auto_23282 - HOIST
      ?auto_23277 - PLACE
      ?auto_23274 - PLACE
      ?auto_23281 - HOIST
      ?auto_23272 - SURFACE
      ?auto_23275 - SURFACE
      ?auto_23279 - PLACE
      ?auto_23278 - HOIST
      ?auto_23283 - SURFACE
      ?auto_23276 - SURFACE
      ?auto_23280 - SURFACE
      ?auto_23273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23282 ?auto_23277 ) ( IS-CRATE ?auto_23270 ) ( not ( = ?auto_23270 ?auto_23271 ) ) ( not ( = ?auto_23274 ?auto_23277 ) ) ( HOIST-AT ?auto_23281 ?auto_23274 ) ( not ( = ?auto_23282 ?auto_23281 ) ) ( AVAILABLE ?auto_23281 ) ( SURFACE-AT ?auto_23270 ?auto_23274 ) ( ON ?auto_23270 ?auto_23272 ) ( CLEAR ?auto_23270 ) ( not ( = ?auto_23270 ?auto_23272 ) ) ( not ( = ?auto_23271 ?auto_23272 ) ) ( IS-CRATE ?auto_23271 ) ( not ( = ?auto_23270 ?auto_23275 ) ) ( not ( = ?auto_23271 ?auto_23275 ) ) ( not ( = ?auto_23272 ?auto_23275 ) ) ( not ( = ?auto_23279 ?auto_23277 ) ) ( not ( = ?auto_23274 ?auto_23279 ) ) ( HOIST-AT ?auto_23278 ?auto_23279 ) ( not ( = ?auto_23282 ?auto_23278 ) ) ( not ( = ?auto_23281 ?auto_23278 ) ) ( SURFACE-AT ?auto_23271 ?auto_23279 ) ( ON ?auto_23271 ?auto_23283 ) ( CLEAR ?auto_23271 ) ( not ( = ?auto_23270 ?auto_23283 ) ) ( not ( = ?auto_23271 ?auto_23283 ) ) ( not ( = ?auto_23272 ?auto_23283 ) ) ( not ( = ?auto_23275 ?auto_23283 ) ) ( SURFACE-AT ?auto_23276 ?auto_23277 ) ( CLEAR ?auto_23276 ) ( IS-CRATE ?auto_23275 ) ( not ( = ?auto_23270 ?auto_23276 ) ) ( not ( = ?auto_23271 ?auto_23276 ) ) ( not ( = ?auto_23272 ?auto_23276 ) ) ( not ( = ?auto_23275 ?auto_23276 ) ) ( not ( = ?auto_23283 ?auto_23276 ) ) ( AVAILABLE ?auto_23282 ) ( AVAILABLE ?auto_23278 ) ( SURFACE-AT ?auto_23275 ?auto_23279 ) ( ON ?auto_23275 ?auto_23280 ) ( CLEAR ?auto_23275 ) ( not ( = ?auto_23270 ?auto_23280 ) ) ( not ( = ?auto_23271 ?auto_23280 ) ) ( not ( = ?auto_23272 ?auto_23280 ) ) ( not ( = ?auto_23275 ?auto_23280 ) ) ( not ( = ?auto_23283 ?auto_23280 ) ) ( not ( = ?auto_23276 ?auto_23280 ) ) ( TRUCK-AT ?auto_23273 ?auto_23277 ) )
    :subtasks
    ( ( !DRIVE ?auto_23273 ?auto_23277 ?auto_23279 )
      ( MAKE-ON ?auto_23270 ?auto_23271 )
      ( MAKE-ON-VERIFY ?auto_23270 ?auto_23271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23286 - SURFACE
      ?auto_23287 - SURFACE
    )
    :vars
    (
      ?auto_23288 - HOIST
      ?auto_23289 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23288 ?auto_23289 ) ( SURFACE-AT ?auto_23287 ?auto_23289 ) ( CLEAR ?auto_23287 ) ( LIFTING ?auto_23288 ?auto_23286 ) ( IS-CRATE ?auto_23286 ) ( not ( = ?auto_23286 ?auto_23287 ) ) )
    :subtasks
    ( ( !DROP ?auto_23288 ?auto_23286 ?auto_23287 ?auto_23289 )
      ( MAKE-ON-VERIFY ?auto_23286 ?auto_23287 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23290 - SURFACE
      ?auto_23291 - SURFACE
    )
    :vars
    (
      ?auto_23292 - HOIST
      ?auto_23293 - PLACE
      ?auto_23294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23292 ?auto_23293 ) ( SURFACE-AT ?auto_23291 ?auto_23293 ) ( CLEAR ?auto_23291 ) ( IS-CRATE ?auto_23290 ) ( not ( = ?auto_23290 ?auto_23291 ) ) ( TRUCK-AT ?auto_23294 ?auto_23293 ) ( AVAILABLE ?auto_23292 ) ( IN ?auto_23290 ?auto_23294 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23292 ?auto_23290 ?auto_23294 ?auto_23293 )
      ( MAKE-ON ?auto_23290 ?auto_23291 )
      ( MAKE-ON-VERIFY ?auto_23290 ?auto_23291 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23295 - SURFACE
      ?auto_23296 - SURFACE
    )
    :vars
    (
      ?auto_23297 - HOIST
      ?auto_23298 - PLACE
      ?auto_23299 - TRUCK
      ?auto_23300 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23297 ?auto_23298 ) ( SURFACE-AT ?auto_23296 ?auto_23298 ) ( CLEAR ?auto_23296 ) ( IS-CRATE ?auto_23295 ) ( not ( = ?auto_23295 ?auto_23296 ) ) ( AVAILABLE ?auto_23297 ) ( IN ?auto_23295 ?auto_23299 ) ( TRUCK-AT ?auto_23299 ?auto_23300 ) ( not ( = ?auto_23300 ?auto_23298 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23299 ?auto_23300 ?auto_23298 )
      ( MAKE-ON ?auto_23295 ?auto_23296 )
      ( MAKE-ON-VERIFY ?auto_23295 ?auto_23296 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23301 - SURFACE
      ?auto_23302 - SURFACE
    )
    :vars
    (
      ?auto_23305 - HOIST
      ?auto_23304 - PLACE
      ?auto_23306 - TRUCK
      ?auto_23303 - PLACE
      ?auto_23307 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23305 ?auto_23304 ) ( SURFACE-AT ?auto_23302 ?auto_23304 ) ( CLEAR ?auto_23302 ) ( IS-CRATE ?auto_23301 ) ( not ( = ?auto_23301 ?auto_23302 ) ) ( AVAILABLE ?auto_23305 ) ( TRUCK-AT ?auto_23306 ?auto_23303 ) ( not ( = ?auto_23303 ?auto_23304 ) ) ( HOIST-AT ?auto_23307 ?auto_23303 ) ( LIFTING ?auto_23307 ?auto_23301 ) ( not ( = ?auto_23305 ?auto_23307 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23307 ?auto_23301 ?auto_23306 ?auto_23303 )
      ( MAKE-ON ?auto_23301 ?auto_23302 )
      ( MAKE-ON-VERIFY ?auto_23301 ?auto_23302 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23308 - SURFACE
      ?auto_23309 - SURFACE
    )
    :vars
    (
      ?auto_23310 - HOIST
      ?auto_23313 - PLACE
      ?auto_23311 - TRUCK
      ?auto_23314 - PLACE
      ?auto_23312 - HOIST
      ?auto_23315 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23310 ?auto_23313 ) ( SURFACE-AT ?auto_23309 ?auto_23313 ) ( CLEAR ?auto_23309 ) ( IS-CRATE ?auto_23308 ) ( not ( = ?auto_23308 ?auto_23309 ) ) ( AVAILABLE ?auto_23310 ) ( TRUCK-AT ?auto_23311 ?auto_23314 ) ( not ( = ?auto_23314 ?auto_23313 ) ) ( HOIST-AT ?auto_23312 ?auto_23314 ) ( not ( = ?auto_23310 ?auto_23312 ) ) ( AVAILABLE ?auto_23312 ) ( SURFACE-AT ?auto_23308 ?auto_23314 ) ( ON ?auto_23308 ?auto_23315 ) ( CLEAR ?auto_23308 ) ( not ( = ?auto_23308 ?auto_23315 ) ) ( not ( = ?auto_23309 ?auto_23315 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23312 ?auto_23308 ?auto_23315 ?auto_23314 )
      ( MAKE-ON ?auto_23308 ?auto_23309 )
      ( MAKE-ON-VERIFY ?auto_23308 ?auto_23309 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23316 - SURFACE
      ?auto_23317 - SURFACE
    )
    :vars
    (
      ?auto_23323 - HOIST
      ?auto_23320 - PLACE
      ?auto_23322 - PLACE
      ?auto_23318 - HOIST
      ?auto_23321 - SURFACE
      ?auto_23319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23323 ?auto_23320 ) ( SURFACE-AT ?auto_23317 ?auto_23320 ) ( CLEAR ?auto_23317 ) ( IS-CRATE ?auto_23316 ) ( not ( = ?auto_23316 ?auto_23317 ) ) ( AVAILABLE ?auto_23323 ) ( not ( = ?auto_23322 ?auto_23320 ) ) ( HOIST-AT ?auto_23318 ?auto_23322 ) ( not ( = ?auto_23323 ?auto_23318 ) ) ( AVAILABLE ?auto_23318 ) ( SURFACE-AT ?auto_23316 ?auto_23322 ) ( ON ?auto_23316 ?auto_23321 ) ( CLEAR ?auto_23316 ) ( not ( = ?auto_23316 ?auto_23321 ) ) ( not ( = ?auto_23317 ?auto_23321 ) ) ( TRUCK-AT ?auto_23319 ?auto_23320 ) )
    :subtasks
    ( ( !DRIVE ?auto_23319 ?auto_23320 ?auto_23322 )
      ( MAKE-ON ?auto_23316 ?auto_23317 )
      ( MAKE-ON-VERIFY ?auto_23316 ?auto_23317 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23324 - SURFACE
      ?auto_23325 - SURFACE
    )
    :vars
    (
      ?auto_23328 - HOIST
      ?auto_23331 - PLACE
      ?auto_23330 - PLACE
      ?auto_23326 - HOIST
      ?auto_23329 - SURFACE
      ?auto_23327 - TRUCK
      ?auto_23332 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23328 ?auto_23331 ) ( IS-CRATE ?auto_23324 ) ( not ( = ?auto_23324 ?auto_23325 ) ) ( not ( = ?auto_23330 ?auto_23331 ) ) ( HOIST-AT ?auto_23326 ?auto_23330 ) ( not ( = ?auto_23328 ?auto_23326 ) ) ( AVAILABLE ?auto_23326 ) ( SURFACE-AT ?auto_23324 ?auto_23330 ) ( ON ?auto_23324 ?auto_23329 ) ( CLEAR ?auto_23324 ) ( not ( = ?auto_23324 ?auto_23329 ) ) ( not ( = ?auto_23325 ?auto_23329 ) ) ( TRUCK-AT ?auto_23327 ?auto_23331 ) ( SURFACE-AT ?auto_23332 ?auto_23331 ) ( CLEAR ?auto_23332 ) ( LIFTING ?auto_23328 ?auto_23325 ) ( IS-CRATE ?auto_23325 ) ( not ( = ?auto_23324 ?auto_23332 ) ) ( not ( = ?auto_23325 ?auto_23332 ) ) ( not ( = ?auto_23329 ?auto_23332 ) ) )
    :subtasks
    ( ( !DROP ?auto_23328 ?auto_23325 ?auto_23332 ?auto_23331 )
      ( MAKE-ON ?auto_23324 ?auto_23325 )
      ( MAKE-ON-VERIFY ?auto_23324 ?auto_23325 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23333 - SURFACE
      ?auto_23334 - SURFACE
    )
    :vars
    (
      ?auto_23340 - HOIST
      ?auto_23341 - PLACE
      ?auto_23337 - PLACE
      ?auto_23335 - HOIST
      ?auto_23338 - SURFACE
      ?auto_23339 - TRUCK
      ?auto_23336 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23340 ?auto_23341 ) ( IS-CRATE ?auto_23333 ) ( not ( = ?auto_23333 ?auto_23334 ) ) ( not ( = ?auto_23337 ?auto_23341 ) ) ( HOIST-AT ?auto_23335 ?auto_23337 ) ( not ( = ?auto_23340 ?auto_23335 ) ) ( AVAILABLE ?auto_23335 ) ( SURFACE-AT ?auto_23333 ?auto_23337 ) ( ON ?auto_23333 ?auto_23338 ) ( CLEAR ?auto_23333 ) ( not ( = ?auto_23333 ?auto_23338 ) ) ( not ( = ?auto_23334 ?auto_23338 ) ) ( TRUCK-AT ?auto_23339 ?auto_23341 ) ( SURFACE-AT ?auto_23336 ?auto_23341 ) ( CLEAR ?auto_23336 ) ( IS-CRATE ?auto_23334 ) ( not ( = ?auto_23333 ?auto_23336 ) ) ( not ( = ?auto_23334 ?auto_23336 ) ) ( not ( = ?auto_23338 ?auto_23336 ) ) ( AVAILABLE ?auto_23340 ) ( IN ?auto_23334 ?auto_23339 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23340 ?auto_23334 ?auto_23339 ?auto_23341 )
      ( MAKE-ON ?auto_23333 ?auto_23334 )
      ( MAKE-ON-VERIFY ?auto_23333 ?auto_23334 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23342 - SURFACE
      ?auto_23343 - SURFACE
    )
    :vars
    (
      ?auto_23345 - HOIST
      ?auto_23349 - PLACE
      ?auto_23350 - PLACE
      ?auto_23344 - HOIST
      ?auto_23348 - SURFACE
      ?auto_23346 - SURFACE
      ?auto_23347 - TRUCK
      ?auto_23351 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23345 ?auto_23349 ) ( IS-CRATE ?auto_23342 ) ( not ( = ?auto_23342 ?auto_23343 ) ) ( not ( = ?auto_23350 ?auto_23349 ) ) ( HOIST-AT ?auto_23344 ?auto_23350 ) ( not ( = ?auto_23345 ?auto_23344 ) ) ( AVAILABLE ?auto_23344 ) ( SURFACE-AT ?auto_23342 ?auto_23350 ) ( ON ?auto_23342 ?auto_23348 ) ( CLEAR ?auto_23342 ) ( not ( = ?auto_23342 ?auto_23348 ) ) ( not ( = ?auto_23343 ?auto_23348 ) ) ( SURFACE-AT ?auto_23346 ?auto_23349 ) ( CLEAR ?auto_23346 ) ( IS-CRATE ?auto_23343 ) ( not ( = ?auto_23342 ?auto_23346 ) ) ( not ( = ?auto_23343 ?auto_23346 ) ) ( not ( = ?auto_23348 ?auto_23346 ) ) ( AVAILABLE ?auto_23345 ) ( IN ?auto_23343 ?auto_23347 ) ( TRUCK-AT ?auto_23347 ?auto_23351 ) ( not ( = ?auto_23351 ?auto_23349 ) ) ( not ( = ?auto_23350 ?auto_23351 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23347 ?auto_23351 ?auto_23349 )
      ( MAKE-ON ?auto_23342 ?auto_23343 )
      ( MAKE-ON-VERIFY ?auto_23342 ?auto_23343 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23352 - SURFACE
      ?auto_23353 - SURFACE
    )
    :vars
    (
      ?auto_23359 - HOIST
      ?auto_23357 - PLACE
      ?auto_23360 - PLACE
      ?auto_23361 - HOIST
      ?auto_23355 - SURFACE
      ?auto_23354 - SURFACE
      ?auto_23358 - TRUCK
      ?auto_23356 - PLACE
      ?auto_23362 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23359 ?auto_23357 ) ( IS-CRATE ?auto_23352 ) ( not ( = ?auto_23352 ?auto_23353 ) ) ( not ( = ?auto_23360 ?auto_23357 ) ) ( HOIST-AT ?auto_23361 ?auto_23360 ) ( not ( = ?auto_23359 ?auto_23361 ) ) ( AVAILABLE ?auto_23361 ) ( SURFACE-AT ?auto_23352 ?auto_23360 ) ( ON ?auto_23352 ?auto_23355 ) ( CLEAR ?auto_23352 ) ( not ( = ?auto_23352 ?auto_23355 ) ) ( not ( = ?auto_23353 ?auto_23355 ) ) ( SURFACE-AT ?auto_23354 ?auto_23357 ) ( CLEAR ?auto_23354 ) ( IS-CRATE ?auto_23353 ) ( not ( = ?auto_23352 ?auto_23354 ) ) ( not ( = ?auto_23353 ?auto_23354 ) ) ( not ( = ?auto_23355 ?auto_23354 ) ) ( AVAILABLE ?auto_23359 ) ( TRUCK-AT ?auto_23358 ?auto_23356 ) ( not ( = ?auto_23356 ?auto_23357 ) ) ( not ( = ?auto_23360 ?auto_23356 ) ) ( HOIST-AT ?auto_23362 ?auto_23356 ) ( LIFTING ?auto_23362 ?auto_23353 ) ( not ( = ?auto_23359 ?auto_23362 ) ) ( not ( = ?auto_23361 ?auto_23362 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23362 ?auto_23353 ?auto_23358 ?auto_23356 )
      ( MAKE-ON ?auto_23352 ?auto_23353 )
      ( MAKE-ON-VERIFY ?auto_23352 ?auto_23353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23363 - SURFACE
      ?auto_23364 - SURFACE
    )
    :vars
    (
      ?auto_23368 - HOIST
      ?auto_23366 - PLACE
      ?auto_23367 - PLACE
      ?auto_23365 - HOIST
      ?auto_23373 - SURFACE
      ?auto_23370 - SURFACE
      ?auto_23372 - TRUCK
      ?auto_23371 - PLACE
      ?auto_23369 - HOIST
      ?auto_23374 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23368 ?auto_23366 ) ( IS-CRATE ?auto_23363 ) ( not ( = ?auto_23363 ?auto_23364 ) ) ( not ( = ?auto_23367 ?auto_23366 ) ) ( HOIST-AT ?auto_23365 ?auto_23367 ) ( not ( = ?auto_23368 ?auto_23365 ) ) ( AVAILABLE ?auto_23365 ) ( SURFACE-AT ?auto_23363 ?auto_23367 ) ( ON ?auto_23363 ?auto_23373 ) ( CLEAR ?auto_23363 ) ( not ( = ?auto_23363 ?auto_23373 ) ) ( not ( = ?auto_23364 ?auto_23373 ) ) ( SURFACE-AT ?auto_23370 ?auto_23366 ) ( CLEAR ?auto_23370 ) ( IS-CRATE ?auto_23364 ) ( not ( = ?auto_23363 ?auto_23370 ) ) ( not ( = ?auto_23364 ?auto_23370 ) ) ( not ( = ?auto_23373 ?auto_23370 ) ) ( AVAILABLE ?auto_23368 ) ( TRUCK-AT ?auto_23372 ?auto_23371 ) ( not ( = ?auto_23371 ?auto_23366 ) ) ( not ( = ?auto_23367 ?auto_23371 ) ) ( HOIST-AT ?auto_23369 ?auto_23371 ) ( not ( = ?auto_23368 ?auto_23369 ) ) ( not ( = ?auto_23365 ?auto_23369 ) ) ( AVAILABLE ?auto_23369 ) ( SURFACE-AT ?auto_23364 ?auto_23371 ) ( ON ?auto_23364 ?auto_23374 ) ( CLEAR ?auto_23364 ) ( not ( = ?auto_23363 ?auto_23374 ) ) ( not ( = ?auto_23364 ?auto_23374 ) ) ( not ( = ?auto_23373 ?auto_23374 ) ) ( not ( = ?auto_23370 ?auto_23374 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23369 ?auto_23364 ?auto_23374 ?auto_23371 )
      ( MAKE-ON ?auto_23363 ?auto_23364 )
      ( MAKE-ON-VERIFY ?auto_23363 ?auto_23364 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23375 - SURFACE
      ?auto_23376 - SURFACE
    )
    :vars
    (
      ?auto_23382 - HOIST
      ?auto_23383 - PLACE
      ?auto_23385 - PLACE
      ?auto_23379 - HOIST
      ?auto_23380 - SURFACE
      ?auto_23378 - SURFACE
      ?auto_23384 - PLACE
      ?auto_23381 - HOIST
      ?auto_23377 - SURFACE
      ?auto_23386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23382 ?auto_23383 ) ( IS-CRATE ?auto_23375 ) ( not ( = ?auto_23375 ?auto_23376 ) ) ( not ( = ?auto_23385 ?auto_23383 ) ) ( HOIST-AT ?auto_23379 ?auto_23385 ) ( not ( = ?auto_23382 ?auto_23379 ) ) ( AVAILABLE ?auto_23379 ) ( SURFACE-AT ?auto_23375 ?auto_23385 ) ( ON ?auto_23375 ?auto_23380 ) ( CLEAR ?auto_23375 ) ( not ( = ?auto_23375 ?auto_23380 ) ) ( not ( = ?auto_23376 ?auto_23380 ) ) ( SURFACE-AT ?auto_23378 ?auto_23383 ) ( CLEAR ?auto_23378 ) ( IS-CRATE ?auto_23376 ) ( not ( = ?auto_23375 ?auto_23378 ) ) ( not ( = ?auto_23376 ?auto_23378 ) ) ( not ( = ?auto_23380 ?auto_23378 ) ) ( AVAILABLE ?auto_23382 ) ( not ( = ?auto_23384 ?auto_23383 ) ) ( not ( = ?auto_23385 ?auto_23384 ) ) ( HOIST-AT ?auto_23381 ?auto_23384 ) ( not ( = ?auto_23382 ?auto_23381 ) ) ( not ( = ?auto_23379 ?auto_23381 ) ) ( AVAILABLE ?auto_23381 ) ( SURFACE-AT ?auto_23376 ?auto_23384 ) ( ON ?auto_23376 ?auto_23377 ) ( CLEAR ?auto_23376 ) ( not ( = ?auto_23375 ?auto_23377 ) ) ( not ( = ?auto_23376 ?auto_23377 ) ) ( not ( = ?auto_23380 ?auto_23377 ) ) ( not ( = ?auto_23378 ?auto_23377 ) ) ( TRUCK-AT ?auto_23386 ?auto_23383 ) )
    :subtasks
    ( ( !DRIVE ?auto_23386 ?auto_23383 ?auto_23384 )
      ( MAKE-ON ?auto_23375 ?auto_23376 )
      ( MAKE-ON-VERIFY ?auto_23375 ?auto_23376 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23387 - SURFACE
      ?auto_23388 - SURFACE
    )
    :vars
    (
      ?auto_23390 - HOIST
      ?auto_23394 - PLACE
      ?auto_23393 - PLACE
      ?auto_23398 - HOIST
      ?auto_23397 - SURFACE
      ?auto_23389 - SURFACE
      ?auto_23391 - PLACE
      ?auto_23395 - HOIST
      ?auto_23392 - SURFACE
      ?auto_23396 - TRUCK
      ?auto_23399 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23390 ?auto_23394 ) ( IS-CRATE ?auto_23387 ) ( not ( = ?auto_23387 ?auto_23388 ) ) ( not ( = ?auto_23393 ?auto_23394 ) ) ( HOIST-AT ?auto_23398 ?auto_23393 ) ( not ( = ?auto_23390 ?auto_23398 ) ) ( AVAILABLE ?auto_23398 ) ( SURFACE-AT ?auto_23387 ?auto_23393 ) ( ON ?auto_23387 ?auto_23397 ) ( CLEAR ?auto_23387 ) ( not ( = ?auto_23387 ?auto_23397 ) ) ( not ( = ?auto_23388 ?auto_23397 ) ) ( IS-CRATE ?auto_23388 ) ( not ( = ?auto_23387 ?auto_23389 ) ) ( not ( = ?auto_23388 ?auto_23389 ) ) ( not ( = ?auto_23397 ?auto_23389 ) ) ( not ( = ?auto_23391 ?auto_23394 ) ) ( not ( = ?auto_23393 ?auto_23391 ) ) ( HOIST-AT ?auto_23395 ?auto_23391 ) ( not ( = ?auto_23390 ?auto_23395 ) ) ( not ( = ?auto_23398 ?auto_23395 ) ) ( AVAILABLE ?auto_23395 ) ( SURFACE-AT ?auto_23388 ?auto_23391 ) ( ON ?auto_23388 ?auto_23392 ) ( CLEAR ?auto_23388 ) ( not ( = ?auto_23387 ?auto_23392 ) ) ( not ( = ?auto_23388 ?auto_23392 ) ) ( not ( = ?auto_23397 ?auto_23392 ) ) ( not ( = ?auto_23389 ?auto_23392 ) ) ( TRUCK-AT ?auto_23396 ?auto_23394 ) ( SURFACE-AT ?auto_23399 ?auto_23394 ) ( CLEAR ?auto_23399 ) ( LIFTING ?auto_23390 ?auto_23389 ) ( IS-CRATE ?auto_23389 ) ( not ( = ?auto_23387 ?auto_23399 ) ) ( not ( = ?auto_23388 ?auto_23399 ) ) ( not ( = ?auto_23397 ?auto_23399 ) ) ( not ( = ?auto_23389 ?auto_23399 ) ) ( not ( = ?auto_23392 ?auto_23399 ) ) )
    :subtasks
    ( ( !DROP ?auto_23390 ?auto_23389 ?auto_23399 ?auto_23394 )
      ( MAKE-ON ?auto_23387 ?auto_23388 )
      ( MAKE-ON-VERIFY ?auto_23387 ?auto_23388 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23400 - SURFACE
      ?auto_23401 - SURFACE
    )
    :vars
    (
      ?auto_23403 - HOIST
      ?auto_23409 - PLACE
      ?auto_23407 - PLACE
      ?auto_23412 - HOIST
      ?auto_23408 - SURFACE
      ?auto_23402 - SURFACE
      ?auto_23410 - PLACE
      ?auto_23405 - HOIST
      ?auto_23411 - SURFACE
      ?auto_23404 - TRUCK
      ?auto_23406 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23403 ?auto_23409 ) ( IS-CRATE ?auto_23400 ) ( not ( = ?auto_23400 ?auto_23401 ) ) ( not ( = ?auto_23407 ?auto_23409 ) ) ( HOIST-AT ?auto_23412 ?auto_23407 ) ( not ( = ?auto_23403 ?auto_23412 ) ) ( AVAILABLE ?auto_23412 ) ( SURFACE-AT ?auto_23400 ?auto_23407 ) ( ON ?auto_23400 ?auto_23408 ) ( CLEAR ?auto_23400 ) ( not ( = ?auto_23400 ?auto_23408 ) ) ( not ( = ?auto_23401 ?auto_23408 ) ) ( IS-CRATE ?auto_23401 ) ( not ( = ?auto_23400 ?auto_23402 ) ) ( not ( = ?auto_23401 ?auto_23402 ) ) ( not ( = ?auto_23408 ?auto_23402 ) ) ( not ( = ?auto_23410 ?auto_23409 ) ) ( not ( = ?auto_23407 ?auto_23410 ) ) ( HOIST-AT ?auto_23405 ?auto_23410 ) ( not ( = ?auto_23403 ?auto_23405 ) ) ( not ( = ?auto_23412 ?auto_23405 ) ) ( AVAILABLE ?auto_23405 ) ( SURFACE-AT ?auto_23401 ?auto_23410 ) ( ON ?auto_23401 ?auto_23411 ) ( CLEAR ?auto_23401 ) ( not ( = ?auto_23400 ?auto_23411 ) ) ( not ( = ?auto_23401 ?auto_23411 ) ) ( not ( = ?auto_23408 ?auto_23411 ) ) ( not ( = ?auto_23402 ?auto_23411 ) ) ( TRUCK-AT ?auto_23404 ?auto_23409 ) ( SURFACE-AT ?auto_23406 ?auto_23409 ) ( CLEAR ?auto_23406 ) ( IS-CRATE ?auto_23402 ) ( not ( = ?auto_23400 ?auto_23406 ) ) ( not ( = ?auto_23401 ?auto_23406 ) ) ( not ( = ?auto_23408 ?auto_23406 ) ) ( not ( = ?auto_23402 ?auto_23406 ) ) ( not ( = ?auto_23411 ?auto_23406 ) ) ( AVAILABLE ?auto_23403 ) ( IN ?auto_23402 ?auto_23404 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23403 ?auto_23402 ?auto_23404 ?auto_23409 )
      ( MAKE-ON ?auto_23400 ?auto_23401 )
      ( MAKE-ON-VERIFY ?auto_23400 ?auto_23401 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23413 - SURFACE
      ?auto_23414 - SURFACE
    )
    :vars
    (
      ?auto_23416 - HOIST
      ?auto_23421 - PLACE
      ?auto_23420 - PLACE
      ?auto_23423 - HOIST
      ?auto_23419 - SURFACE
      ?auto_23425 - SURFACE
      ?auto_23422 - PLACE
      ?auto_23415 - HOIST
      ?auto_23417 - SURFACE
      ?auto_23424 - SURFACE
      ?auto_23418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23416 ?auto_23421 ) ( IS-CRATE ?auto_23413 ) ( not ( = ?auto_23413 ?auto_23414 ) ) ( not ( = ?auto_23420 ?auto_23421 ) ) ( HOIST-AT ?auto_23423 ?auto_23420 ) ( not ( = ?auto_23416 ?auto_23423 ) ) ( AVAILABLE ?auto_23423 ) ( SURFACE-AT ?auto_23413 ?auto_23420 ) ( ON ?auto_23413 ?auto_23419 ) ( CLEAR ?auto_23413 ) ( not ( = ?auto_23413 ?auto_23419 ) ) ( not ( = ?auto_23414 ?auto_23419 ) ) ( IS-CRATE ?auto_23414 ) ( not ( = ?auto_23413 ?auto_23425 ) ) ( not ( = ?auto_23414 ?auto_23425 ) ) ( not ( = ?auto_23419 ?auto_23425 ) ) ( not ( = ?auto_23422 ?auto_23421 ) ) ( not ( = ?auto_23420 ?auto_23422 ) ) ( HOIST-AT ?auto_23415 ?auto_23422 ) ( not ( = ?auto_23416 ?auto_23415 ) ) ( not ( = ?auto_23423 ?auto_23415 ) ) ( AVAILABLE ?auto_23415 ) ( SURFACE-AT ?auto_23414 ?auto_23422 ) ( ON ?auto_23414 ?auto_23417 ) ( CLEAR ?auto_23414 ) ( not ( = ?auto_23413 ?auto_23417 ) ) ( not ( = ?auto_23414 ?auto_23417 ) ) ( not ( = ?auto_23419 ?auto_23417 ) ) ( not ( = ?auto_23425 ?auto_23417 ) ) ( SURFACE-AT ?auto_23424 ?auto_23421 ) ( CLEAR ?auto_23424 ) ( IS-CRATE ?auto_23425 ) ( not ( = ?auto_23413 ?auto_23424 ) ) ( not ( = ?auto_23414 ?auto_23424 ) ) ( not ( = ?auto_23419 ?auto_23424 ) ) ( not ( = ?auto_23425 ?auto_23424 ) ) ( not ( = ?auto_23417 ?auto_23424 ) ) ( AVAILABLE ?auto_23416 ) ( IN ?auto_23425 ?auto_23418 ) ( TRUCK-AT ?auto_23418 ?auto_23420 ) )
    :subtasks
    ( ( !DRIVE ?auto_23418 ?auto_23420 ?auto_23421 )
      ( MAKE-ON ?auto_23413 ?auto_23414 )
      ( MAKE-ON-VERIFY ?auto_23413 ?auto_23414 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23426 - SURFACE
      ?auto_23427 - SURFACE
    )
    :vars
    (
      ?auto_23428 - HOIST
      ?auto_23433 - PLACE
      ?auto_23431 - PLACE
      ?auto_23437 - HOIST
      ?auto_23434 - SURFACE
      ?auto_23435 - SURFACE
      ?auto_23432 - PLACE
      ?auto_23430 - HOIST
      ?auto_23429 - SURFACE
      ?auto_23438 - SURFACE
      ?auto_23436 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23428 ?auto_23433 ) ( IS-CRATE ?auto_23426 ) ( not ( = ?auto_23426 ?auto_23427 ) ) ( not ( = ?auto_23431 ?auto_23433 ) ) ( HOIST-AT ?auto_23437 ?auto_23431 ) ( not ( = ?auto_23428 ?auto_23437 ) ) ( SURFACE-AT ?auto_23426 ?auto_23431 ) ( ON ?auto_23426 ?auto_23434 ) ( CLEAR ?auto_23426 ) ( not ( = ?auto_23426 ?auto_23434 ) ) ( not ( = ?auto_23427 ?auto_23434 ) ) ( IS-CRATE ?auto_23427 ) ( not ( = ?auto_23426 ?auto_23435 ) ) ( not ( = ?auto_23427 ?auto_23435 ) ) ( not ( = ?auto_23434 ?auto_23435 ) ) ( not ( = ?auto_23432 ?auto_23433 ) ) ( not ( = ?auto_23431 ?auto_23432 ) ) ( HOIST-AT ?auto_23430 ?auto_23432 ) ( not ( = ?auto_23428 ?auto_23430 ) ) ( not ( = ?auto_23437 ?auto_23430 ) ) ( AVAILABLE ?auto_23430 ) ( SURFACE-AT ?auto_23427 ?auto_23432 ) ( ON ?auto_23427 ?auto_23429 ) ( CLEAR ?auto_23427 ) ( not ( = ?auto_23426 ?auto_23429 ) ) ( not ( = ?auto_23427 ?auto_23429 ) ) ( not ( = ?auto_23434 ?auto_23429 ) ) ( not ( = ?auto_23435 ?auto_23429 ) ) ( SURFACE-AT ?auto_23438 ?auto_23433 ) ( CLEAR ?auto_23438 ) ( IS-CRATE ?auto_23435 ) ( not ( = ?auto_23426 ?auto_23438 ) ) ( not ( = ?auto_23427 ?auto_23438 ) ) ( not ( = ?auto_23434 ?auto_23438 ) ) ( not ( = ?auto_23435 ?auto_23438 ) ) ( not ( = ?auto_23429 ?auto_23438 ) ) ( AVAILABLE ?auto_23428 ) ( TRUCK-AT ?auto_23436 ?auto_23431 ) ( LIFTING ?auto_23437 ?auto_23435 ) )
    :subtasks
    ( ( !LOAD ?auto_23437 ?auto_23435 ?auto_23436 ?auto_23431 )
      ( MAKE-ON ?auto_23426 ?auto_23427 )
      ( MAKE-ON-VERIFY ?auto_23426 ?auto_23427 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23439 - SURFACE
      ?auto_23440 - SURFACE
    )
    :vars
    (
      ?auto_23443 - HOIST
      ?auto_23450 - PLACE
      ?auto_23446 - PLACE
      ?auto_23442 - HOIST
      ?auto_23447 - SURFACE
      ?auto_23451 - SURFACE
      ?auto_23441 - PLACE
      ?auto_23448 - HOIST
      ?auto_23444 - SURFACE
      ?auto_23449 - SURFACE
      ?auto_23445 - TRUCK
      ?auto_23452 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23443 ?auto_23450 ) ( IS-CRATE ?auto_23439 ) ( not ( = ?auto_23439 ?auto_23440 ) ) ( not ( = ?auto_23446 ?auto_23450 ) ) ( HOIST-AT ?auto_23442 ?auto_23446 ) ( not ( = ?auto_23443 ?auto_23442 ) ) ( SURFACE-AT ?auto_23439 ?auto_23446 ) ( ON ?auto_23439 ?auto_23447 ) ( CLEAR ?auto_23439 ) ( not ( = ?auto_23439 ?auto_23447 ) ) ( not ( = ?auto_23440 ?auto_23447 ) ) ( IS-CRATE ?auto_23440 ) ( not ( = ?auto_23439 ?auto_23451 ) ) ( not ( = ?auto_23440 ?auto_23451 ) ) ( not ( = ?auto_23447 ?auto_23451 ) ) ( not ( = ?auto_23441 ?auto_23450 ) ) ( not ( = ?auto_23446 ?auto_23441 ) ) ( HOIST-AT ?auto_23448 ?auto_23441 ) ( not ( = ?auto_23443 ?auto_23448 ) ) ( not ( = ?auto_23442 ?auto_23448 ) ) ( AVAILABLE ?auto_23448 ) ( SURFACE-AT ?auto_23440 ?auto_23441 ) ( ON ?auto_23440 ?auto_23444 ) ( CLEAR ?auto_23440 ) ( not ( = ?auto_23439 ?auto_23444 ) ) ( not ( = ?auto_23440 ?auto_23444 ) ) ( not ( = ?auto_23447 ?auto_23444 ) ) ( not ( = ?auto_23451 ?auto_23444 ) ) ( SURFACE-AT ?auto_23449 ?auto_23450 ) ( CLEAR ?auto_23449 ) ( IS-CRATE ?auto_23451 ) ( not ( = ?auto_23439 ?auto_23449 ) ) ( not ( = ?auto_23440 ?auto_23449 ) ) ( not ( = ?auto_23447 ?auto_23449 ) ) ( not ( = ?auto_23451 ?auto_23449 ) ) ( not ( = ?auto_23444 ?auto_23449 ) ) ( AVAILABLE ?auto_23443 ) ( TRUCK-AT ?auto_23445 ?auto_23446 ) ( AVAILABLE ?auto_23442 ) ( SURFACE-AT ?auto_23451 ?auto_23446 ) ( ON ?auto_23451 ?auto_23452 ) ( CLEAR ?auto_23451 ) ( not ( = ?auto_23439 ?auto_23452 ) ) ( not ( = ?auto_23440 ?auto_23452 ) ) ( not ( = ?auto_23447 ?auto_23452 ) ) ( not ( = ?auto_23451 ?auto_23452 ) ) ( not ( = ?auto_23444 ?auto_23452 ) ) ( not ( = ?auto_23449 ?auto_23452 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23442 ?auto_23451 ?auto_23452 ?auto_23446 )
      ( MAKE-ON ?auto_23439 ?auto_23440 )
      ( MAKE-ON-VERIFY ?auto_23439 ?auto_23440 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23453 - SURFACE
      ?auto_23454 - SURFACE
    )
    :vars
    (
      ?auto_23463 - HOIST
      ?auto_23465 - PLACE
      ?auto_23455 - PLACE
      ?auto_23458 - HOIST
      ?auto_23457 - SURFACE
      ?auto_23460 - SURFACE
      ?auto_23464 - PLACE
      ?auto_23456 - HOIST
      ?auto_23461 - SURFACE
      ?auto_23462 - SURFACE
      ?auto_23466 - SURFACE
      ?auto_23459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23463 ?auto_23465 ) ( IS-CRATE ?auto_23453 ) ( not ( = ?auto_23453 ?auto_23454 ) ) ( not ( = ?auto_23455 ?auto_23465 ) ) ( HOIST-AT ?auto_23458 ?auto_23455 ) ( not ( = ?auto_23463 ?auto_23458 ) ) ( SURFACE-AT ?auto_23453 ?auto_23455 ) ( ON ?auto_23453 ?auto_23457 ) ( CLEAR ?auto_23453 ) ( not ( = ?auto_23453 ?auto_23457 ) ) ( not ( = ?auto_23454 ?auto_23457 ) ) ( IS-CRATE ?auto_23454 ) ( not ( = ?auto_23453 ?auto_23460 ) ) ( not ( = ?auto_23454 ?auto_23460 ) ) ( not ( = ?auto_23457 ?auto_23460 ) ) ( not ( = ?auto_23464 ?auto_23465 ) ) ( not ( = ?auto_23455 ?auto_23464 ) ) ( HOIST-AT ?auto_23456 ?auto_23464 ) ( not ( = ?auto_23463 ?auto_23456 ) ) ( not ( = ?auto_23458 ?auto_23456 ) ) ( AVAILABLE ?auto_23456 ) ( SURFACE-AT ?auto_23454 ?auto_23464 ) ( ON ?auto_23454 ?auto_23461 ) ( CLEAR ?auto_23454 ) ( not ( = ?auto_23453 ?auto_23461 ) ) ( not ( = ?auto_23454 ?auto_23461 ) ) ( not ( = ?auto_23457 ?auto_23461 ) ) ( not ( = ?auto_23460 ?auto_23461 ) ) ( SURFACE-AT ?auto_23462 ?auto_23465 ) ( CLEAR ?auto_23462 ) ( IS-CRATE ?auto_23460 ) ( not ( = ?auto_23453 ?auto_23462 ) ) ( not ( = ?auto_23454 ?auto_23462 ) ) ( not ( = ?auto_23457 ?auto_23462 ) ) ( not ( = ?auto_23460 ?auto_23462 ) ) ( not ( = ?auto_23461 ?auto_23462 ) ) ( AVAILABLE ?auto_23463 ) ( AVAILABLE ?auto_23458 ) ( SURFACE-AT ?auto_23460 ?auto_23455 ) ( ON ?auto_23460 ?auto_23466 ) ( CLEAR ?auto_23460 ) ( not ( = ?auto_23453 ?auto_23466 ) ) ( not ( = ?auto_23454 ?auto_23466 ) ) ( not ( = ?auto_23457 ?auto_23466 ) ) ( not ( = ?auto_23460 ?auto_23466 ) ) ( not ( = ?auto_23461 ?auto_23466 ) ) ( not ( = ?auto_23462 ?auto_23466 ) ) ( TRUCK-AT ?auto_23459 ?auto_23465 ) )
    :subtasks
    ( ( !DRIVE ?auto_23459 ?auto_23465 ?auto_23455 )
      ( MAKE-ON ?auto_23453 ?auto_23454 )
      ( MAKE-ON-VERIFY ?auto_23453 ?auto_23454 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23467 - SURFACE
      ?auto_23468 - SURFACE
    )
    :vars
    (
      ?auto_23480 - HOIST
      ?auto_23479 - PLACE
      ?auto_23478 - PLACE
      ?auto_23472 - HOIST
      ?auto_23477 - SURFACE
      ?auto_23476 - SURFACE
      ?auto_23473 - PLACE
      ?auto_23470 - HOIST
      ?auto_23474 - SURFACE
      ?auto_23471 - SURFACE
      ?auto_23469 - SURFACE
      ?auto_23475 - TRUCK
      ?auto_23481 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23480 ?auto_23479 ) ( IS-CRATE ?auto_23467 ) ( not ( = ?auto_23467 ?auto_23468 ) ) ( not ( = ?auto_23478 ?auto_23479 ) ) ( HOIST-AT ?auto_23472 ?auto_23478 ) ( not ( = ?auto_23480 ?auto_23472 ) ) ( SURFACE-AT ?auto_23467 ?auto_23478 ) ( ON ?auto_23467 ?auto_23477 ) ( CLEAR ?auto_23467 ) ( not ( = ?auto_23467 ?auto_23477 ) ) ( not ( = ?auto_23468 ?auto_23477 ) ) ( IS-CRATE ?auto_23468 ) ( not ( = ?auto_23467 ?auto_23476 ) ) ( not ( = ?auto_23468 ?auto_23476 ) ) ( not ( = ?auto_23477 ?auto_23476 ) ) ( not ( = ?auto_23473 ?auto_23479 ) ) ( not ( = ?auto_23478 ?auto_23473 ) ) ( HOIST-AT ?auto_23470 ?auto_23473 ) ( not ( = ?auto_23480 ?auto_23470 ) ) ( not ( = ?auto_23472 ?auto_23470 ) ) ( AVAILABLE ?auto_23470 ) ( SURFACE-AT ?auto_23468 ?auto_23473 ) ( ON ?auto_23468 ?auto_23474 ) ( CLEAR ?auto_23468 ) ( not ( = ?auto_23467 ?auto_23474 ) ) ( not ( = ?auto_23468 ?auto_23474 ) ) ( not ( = ?auto_23477 ?auto_23474 ) ) ( not ( = ?auto_23476 ?auto_23474 ) ) ( IS-CRATE ?auto_23476 ) ( not ( = ?auto_23467 ?auto_23471 ) ) ( not ( = ?auto_23468 ?auto_23471 ) ) ( not ( = ?auto_23477 ?auto_23471 ) ) ( not ( = ?auto_23476 ?auto_23471 ) ) ( not ( = ?auto_23474 ?auto_23471 ) ) ( AVAILABLE ?auto_23472 ) ( SURFACE-AT ?auto_23476 ?auto_23478 ) ( ON ?auto_23476 ?auto_23469 ) ( CLEAR ?auto_23476 ) ( not ( = ?auto_23467 ?auto_23469 ) ) ( not ( = ?auto_23468 ?auto_23469 ) ) ( not ( = ?auto_23477 ?auto_23469 ) ) ( not ( = ?auto_23476 ?auto_23469 ) ) ( not ( = ?auto_23474 ?auto_23469 ) ) ( not ( = ?auto_23471 ?auto_23469 ) ) ( TRUCK-AT ?auto_23475 ?auto_23479 ) ( SURFACE-AT ?auto_23481 ?auto_23479 ) ( CLEAR ?auto_23481 ) ( LIFTING ?auto_23480 ?auto_23471 ) ( IS-CRATE ?auto_23471 ) ( not ( = ?auto_23467 ?auto_23481 ) ) ( not ( = ?auto_23468 ?auto_23481 ) ) ( not ( = ?auto_23477 ?auto_23481 ) ) ( not ( = ?auto_23476 ?auto_23481 ) ) ( not ( = ?auto_23474 ?auto_23481 ) ) ( not ( = ?auto_23471 ?auto_23481 ) ) ( not ( = ?auto_23469 ?auto_23481 ) ) )
    :subtasks
    ( ( !DROP ?auto_23480 ?auto_23471 ?auto_23481 ?auto_23479 )
      ( MAKE-ON ?auto_23467 ?auto_23468 )
      ( MAKE-ON-VERIFY ?auto_23467 ?auto_23468 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23482 - SURFACE
      ?auto_23483 - SURFACE
    )
    :vars
    (
      ?auto_23493 - HOIST
      ?auto_23491 - PLACE
      ?auto_23488 - PLACE
      ?auto_23495 - HOIST
      ?auto_23492 - SURFACE
      ?auto_23496 - SURFACE
      ?auto_23486 - PLACE
      ?auto_23485 - HOIST
      ?auto_23487 - SURFACE
      ?auto_23490 - SURFACE
      ?auto_23484 - SURFACE
      ?auto_23489 - TRUCK
      ?auto_23494 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23493 ?auto_23491 ) ( IS-CRATE ?auto_23482 ) ( not ( = ?auto_23482 ?auto_23483 ) ) ( not ( = ?auto_23488 ?auto_23491 ) ) ( HOIST-AT ?auto_23495 ?auto_23488 ) ( not ( = ?auto_23493 ?auto_23495 ) ) ( SURFACE-AT ?auto_23482 ?auto_23488 ) ( ON ?auto_23482 ?auto_23492 ) ( CLEAR ?auto_23482 ) ( not ( = ?auto_23482 ?auto_23492 ) ) ( not ( = ?auto_23483 ?auto_23492 ) ) ( IS-CRATE ?auto_23483 ) ( not ( = ?auto_23482 ?auto_23496 ) ) ( not ( = ?auto_23483 ?auto_23496 ) ) ( not ( = ?auto_23492 ?auto_23496 ) ) ( not ( = ?auto_23486 ?auto_23491 ) ) ( not ( = ?auto_23488 ?auto_23486 ) ) ( HOIST-AT ?auto_23485 ?auto_23486 ) ( not ( = ?auto_23493 ?auto_23485 ) ) ( not ( = ?auto_23495 ?auto_23485 ) ) ( AVAILABLE ?auto_23485 ) ( SURFACE-AT ?auto_23483 ?auto_23486 ) ( ON ?auto_23483 ?auto_23487 ) ( CLEAR ?auto_23483 ) ( not ( = ?auto_23482 ?auto_23487 ) ) ( not ( = ?auto_23483 ?auto_23487 ) ) ( not ( = ?auto_23492 ?auto_23487 ) ) ( not ( = ?auto_23496 ?auto_23487 ) ) ( IS-CRATE ?auto_23496 ) ( not ( = ?auto_23482 ?auto_23490 ) ) ( not ( = ?auto_23483 ?auto_23490 ) ) ( not ( = ?auto_23492 ?auto_23490 ) ) ( not ( = ?auto_23496 ?auto_23490 ) ) ( not ( = ?auto_23487 ?auto_23490 ) ) ( AVAILABLE ?auto_23495 ) ( SURFACE-AT ?auto_23496 ?auto_23488 ) ( ON ?auto_23496 ?auto_23484 ) ( CLEAR ?auto_23496 ) ( not ( = ?auto_23482 ?auto_23484 ) ) ( not ( = ?auto_23483 ?auto_23484 ) ) ( not ( = ?auto_23492 ?auto_23484 ) ) ( not ( = ?auto_23496 ?auto_23484 ) ) ( not ( = ?auto_23487 ?auto_23484 ) ) ( not ( = ?auto_23490 ?auto_23484 ) ) ( TRUCK-AT ?auto_23489 ?auto_23491 ) ( SURFACE-AT ?auto_23494 ?auto_23491 ) ( CLEAR ?auto_23494 ) ( IS-CRATE ?auto_23490 ) ( not ( = ?auto_23482 ?auto_23494 ) ) ( not ( = ?auto_23483 ?auto_23494 ) ) ( not ( = ?auto_23492 ?auto_23494 ) ) ( not ( = ?auto_23496 ?auto_23494 ) ) ( not ( = ?auto_23487 ?auto_23494 ) ) ( not ( = ?auto_23490 ?auto_23494 ) ) ( not ( = ?auto_23484 ?auto_23494 ) ) ( AVAILABLE ?auto_23493 ) ( IN ?auto_23490 ?auto_23489 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23493 ?auto_23490 ?auto_23489 ?auto_23491 )
      ( MAKE-ON ?auto_23482 ?auto_23483 )
      ( MAKE-ON-VERIFY ?auto_23482 ?auto_23483 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23497 - SURFACE
      ?auto_23498 - SURFACE
    )
    :vars
    (
      ?auto_23506 - HOIST
      ?auto_23505 - PLACE
      ?auto_23501 - PLACE
      ?auto_23502 - HOIST
      ?auto_23508 - SURFACE
      ?auto_23504 - SURFACE
      ?auto_23509 - PLACE
      ?auto_23507 - HOIST
      ?auto_23500 - SURFACE
      ?auto_23511 - SURFACE
      ?auto_23499 - SURFACE
      ?auto_23510 - SURFACE
      ?auto_23503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23506 ?auto_23505 ) ( IS-CRATE ?auto_23497 ) ( not ( = ?auto_23497 ?auto_23498 ) ) ( not ( = ?auto_23501 ?auto_23505 ) ) ( HOIST-AT ?auto_23502 ?auto_23501 ) ( not ( = ?auto_23506 ?auto_23502 ) ) ( SURFACE-AT ?auto_23497 ?auto_23501 ) ( ON ?auto_23497 ?auto_23508 ) ( CLEAR ?auto_23497 ) ( not ( = ?auto_23497 ?auto_23508 ) ) ( not ( = ?auto_23498 ?auto_23508 ) ) ( IS-CRATE ?auto_23498 ) ( not ( = ?auto_23497 ?auto_23504 ) ) ( not ( = ?auto_23498 ?auto_23504 ) ) ( not ( = ?auto_23508 ?auto_23504 ) ) ( not ( = ?auto_23509 ?auto_23505 ) ) ( not ( = ?auto_23501 ?auto_23509 ) ) ( HOIST-AT ?auto_23507 ?auto_23509 ) ( not ( = ?auto_23506 ?auto_23507 ) ) ( not ( = ?auto_23502 ?auto_23507 ) ) ( AVAILABLE ?auto_23507 ) ( SURFACE-AT ?auto_23498 ?auto_23509 ) ( ON ?auto_23498 ?auto_23500 ) ( CLEAR ?auto_23498 ) ( not ( = ?auto_23497 ?auto_23500 ) ) ( not ( = ?auto_23498 ?auto_23500 ) ) ( not ( = ?auto_23508 ?auto_23500 ) ) ( not ( = ?auto_23504 ?auto_23500 ) ) ( IS-CRATE ?auto_23504 ) ( not ( = ?auto_23497 ?auto_23511 ) ) ( not ( = ?auto_23498 ?auto_23511 ) ) ( not ( = ?auto_23508 ?auto_23511 ) ) ( not ( = ?auto_23504 ?auto_23511 ) ) ( not ( = ?auto_23500 ?auto_23511 ) ) ( AVAILABLE ?auto_23502 ) ( SURFACE-AT ?auto_23504 ?auto_23501 ) ( ON ?auto_23504 ?auto_23499 ) ( CLEAR ?auto_23504 ) ( not ( = ?auto_23497 ?auto_23499 ) ) ( not ( = ?auto_23498 ?auto_23499 ) ) ( not ( = ?auto_23508 ?auto_23499 ) ) ( not ( = ?auto_23504 ?auto_23499 ) ) ( not ( = ?auto_23500 ?auto_23499 ) ) ( not ( = ?auto_23511 ?auto_23499 ) ) ( SURFACE-AT ?auto_23510 ?auto_23505 ) ( CLEAR ?auto_23510 ) ( IS-CRATE ?auto_23511 ) ( not ( = ?auto_23497 ?auto_23510 ) ) ( not ( = ?auto_23498 ?auto_23510 ) ) ( not ( = ?auto_23508 ?auto_23510 ) ) ( not ( = ?auto_23504 ?auto_23510 ) ) ( not ( = ?auto_23500 ?auto_23510 ) ) ( not ( = ?auto_23511 ?auto_23510 ) ) ( not ( = ?auto_23499 ?auto_23510 ) ) ( AVAILABLE ?auto_23506 ) ( IN ?auto_23511 ?auto_23503 ) ( TRUCK-AT ?auto_23503 ?auto_23501 ) )
    :subtasks
    ( ( !DRIVE ?auto_23503 ?auto_23501 ?auto_23505 )
      ( MAKE-ON ?auto_23497 ?auto_23498 )
      ( MAKE-ON-VERIFY ?auto_23497 ?auto_23498 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23512 - SURFACE
      ?auto_23513 - SURFACE
    )
    :vars
    (
      ?auto_23518 - HOIST
      ?auto_23525 - PLACE
      ?auto_23522 - PLACE
      ?auto_23526 - HOIST
      ?auto_23523 - SURFACE
      ?auto_23516 - SURFACE
      ?auto_23520 - PLACE
      ?auto_23514 - HOIST
      ?auto_23524 - SURFACE
      ?auto_23521 - SURFACE
      ?auto_23519 - SURFACE
      ?auto_23515 - SURFACE
      ?auto_23517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23518 ?auto_23525 ) ( IS-CRATE ?auto_23512 ) ( not ( = ?auto_23512 ?auto_23513 ) ) ( not ( = ?auto_23522 ?auto_23525 ) ) ( HOIST-AT ?auto_23526 ?auto_23522 ) ( not ( = ?auto_23518 ?auto_23526 ) ) ( SURFACE-AT ?auto_23512 ?auto_23522 ) ( ON ?auto_23512 ?auto_23523 ) ( CLEAR ?auto_23512 ) ( not ( = ?auto_23512 ?auto_23523 ) ) ( not ( = ?auto_23513 ?auto_23523 ) ) ( IS-CRATE ?auto_23513 ) ( not ( = ?auto_23512 ?auto_23516 ) ) ( not ( = ?auto_23513 ?auto_23516 ) ) ( not ( = ?auto_23523 ?auto_23516 ) ) ( not ( = ?auto_23520 ?auto_23525 ) ) ( not ( = ?auto_23522 ?auto_23520 ) ) ( HOIST-AT ?auto_23514 ?auto_23520 ) ( not ( = ?auto_23518 ?auto_23514 ) ) ( not ( = ?auto_23526 ?auto_23514 ) ) ( AVAILABLE ?auto_23514 ) ( SURFACE-AT ?auto_23513 ?auto_23520 ) ( ON ?auto_23513 ?auto_23524 ) ( CLEAR ?auto_23513 ) ( not ( = ?auto_23512 ?auto_23524 ) ) ( not ( = ?auto_23513 ?auto_23524 ) ) ( not ( = ?auto_23523 ?auto_23524 ) ) ( not ( = ?auto_23516 ?auto_23524 ) ) ( IS-CRATE ?auto_23516 ) ( not ( = ?auto_23512 ?auto_23521 ) ) ( not ( = ?auto_23513 ?auto_23521 ) ) ( not ( = ?auto_23523 ?auto_23521 ) ) ( not ( = ?auto_23516 ?auto_23521 ) ) ( not ( = ?auto_23524 ?auto_23521 ) ) ( SURFACE-AT ?auto_23516 ?auto_23522 ) ( ON ?auto_23516 ?auto_23519 ) ( CLEAR ?auto_23516 ) ( not ( = ?auto_23512 ?auto_23519 ) ) ( not ( = ?auto_23513 ?auto_23519 ) ) ( not ( = ?auto_23523 ?auto_23519 ) ) ( not ( = ?auto_23516 ?auto_23519 ) ) ( not ( = ?auto_23524 ?auto_23519 ) ) ( not ( = ?auto_23521 ?auto_23519 ) ) ( SURFACE-AT ?auto_23515 ?auto_23525 ) ( CLEAR ?auto_23515 ) ( IS-CRATE ?auto_23521 ) ( not ( = ?auto_23512 ?auto_23515 ) ) ( not ( = ?auto_23513 ?auto_23515 ) ) ( not ( = ?auto_23523 ?auto_23515 ) ) ( not ( = ?auto_23516 ?auto_23515 ) ) ( not ( = ?auto_23524 ?auto_23515 ) ) ( not ( = ?auto_23521 ?auto_23515 ) ) ( not ( = ?auto_23519 ?auto_23515 ) ) ( AVAILABLE ?auto_23518 ) ( TRUCK-AT ?auto_23517 ?auto_23522 ) ( LIFTING ?auto_23526 ?auto_23521 ) )
    :subtasks
    ( ( !LOAD ?auto_23526 ?auto_23521 ?auto_23517 ?auto_23522 )
      ( MAKE-ON ?auto_23512 ?auto_23513 )
      ( MAKE-ON-VERIFY ?auto_23512 ?auto_23513 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23527 - SURFACE
      ?auto_23528 - SURFACE
    )
    :vars
    (
      ?auto_23533 - HOIST
      ?auto_23531 - PLACE
      ?auto_23538 - PLACE
      ?auto_23529 - HOIST
      ?auto_23532 - SURFACE
      ?auto_23535 - SURFACE
      ?auto_23534 - PLACE
      ?auto_23540 - HOIST
      ?auto_23539 - SURFACE
      ?auto_23537 - SURFACE
      ?auto_23541 - SURFACE
      ?auto_23536 - SURFACE
      ?auto_23530 - TRUCK
      ?auto_23542 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23533 ?auto_23531 ) ( IS-CRATE ?auto_23527 ) ( not ( = ?auto_23527 ?auto_23528 ) ) ( not ( = ?auto_23538 ?auto_23531 ) ) ( HOIST-AT ?auto_23529 ?auto_23538 ) ( not ( = ?auto_23533 ?auto_23529 ) ) ( SURFACE-AT ?auto_23527 ?auto_23538 ) ( ON ?auto_23527 ?auto_23532 ) ( CLEAR ?auto_23527 ) ( not ( = ?auto_23527 ?auto_23532 ) ) ( not ( = ?auto_23528 ?auto_23532 ) ) ( IS-CRATE ?auto_23528 ) ( not ( = ?auto_23527 ?auto_23535 ) ) ( not ( = ?auto_23528 ?auto_23535 ) ) ( not ( = ?auto_23532 ?auto_23535 ) ) ( not ( = ?auto_23534 ?auto_23531 ) ) ( not ( = ?auto_23538 ?auto_23534 ) ) ( HOIST-AT ?auto_23540 ?auto_23534 ) ( not ( = ?auto_23533 ?auto_23540 ) ) ( not ( = ?auto_23529 ?auto_23540 ) ) ( AVAILABLE ?auto_23540 ) ( SURFACE-AT ?auto_23528 ?auto_23534 ) ( ON ?auto_23528 ?auto_23539 ) ( CLEAR ?auto_23528 ) ( not ( = ?auto_23527 ?auto_23539 ) ) ( not ( = ?auto_23528 ?auto_23539 ) ) ( not ( = ?auto_23532 ?auto_23539 ) ) ( not ( = ?auto_23535 ?auto_23539 ) ) ( IS-CRATE ?auto_23535 ) ( not ( = ?auto_23527 ?auto_23537 ) ) ( not ( = ?auto_23528 ?auto_23537 ) ) ( not ( = ?auto_23532 ?auto_23537 ) ) ( not ( = ?auto_23535 ?auto_23537 ) ) ( not ( = ?auto_23539 ?auto_23537 ) ) ( SURFACE-AT ?auto_23535 ?auto_23538 ) ( ON ?auto_23535 ?auto_23541 ) ( CLEAR ?auto_23535 ) ( not ( = ?auto_23527 ?auto_23541 ) ) ( not ( = ?auto_23528 ?auto_23541 ) ) ( not ( = ?auto_23532 ?auto_23541 ) ) ( not ( = ?auto_23535 ?auto_23541 ) ) ( not ( = ?auto_23539 ?auto_23541 ) ) ( not ( = ?auto_23537 ?auto_23541 ) ) ( SURFACE-AT ?auto_23536 ?auto_23531 ) ( CLEAR ?auto_23536 ) ( IS-CRATE ?auto_23537 ) ( not ( = ?auto_23527 ?auto_23536 ) ) ( not ( = ?auto_23528 ?auto_23536 ) ) ( not ( = ?auto_23532 ?auto_23536 ) ) ( not ( = ?auto_23535 ?auto_23536 ) ) ( not ( = ?auto_23539 ?auto_23536 ) ) ( not ( = ?auto_23537 ?auto_23536 ) ) ( not ( = ?auto_23541 ?auto_23536 ) ) ( AVAILABLE ?auto_23533 ) ( TRUCK-AT ?auto_23530 ?auto_23538 ) ( AVAILABLE ?auto_23529 ) ( SURFACE-AT ?auto_23537 ?auto_23538 ) ( ON ?auto_23537 ?auto_23542 ) ( CLEAR ?auto_23537 ) ( not ( = ?auto_23527 ?auto_23542 ) ) ( not ( = ?auto_23528 ?auto_23542 ) ) ( not ( = ?auto_23532 ?auto_23542 ) ) ( not ( = ?auto_23535 ?auto_23542 ) ) ( not ( = ?auto_23539 ?auto_23542 ) ) ( not ( = ?auto_23537 ?auto_23542 ) ) ( not ( = ?auto_23541 ?auto_23542 ) ) ( not ( = ?auto_23536 ?auto_23542 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23529 ?auto_23537 ?auto_23542 ?auto_23538 )
      ( MAKE-ON ?auto_23527 ?auto_23528 )
      ( MAKE-ON-VERIFY ?auto_23527 ?auto_23528 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23543 - SURFACE
      ?auto_23544 - SURFACE
    )
    :vars
    (
      ?auto_23546 - HOIST
      ?auto_23552 - PLACE
      ?auto_23558 - PLACE
      ?auto_23545 - HOIST
      ?auto_23556 - SURFACE
      ?auto_23553 - SURFACE
      ?auto_23551 - PLACE
      ?auto_23554 - HOIST
      ?auto_23550 - SURFACE
      ?auto_23547 - SURFACE
      ?auto_23557 - SURFACE
      ?auto_23548 - SURFACE
      ?auto_23549 - SURFACE
      ?auto_23555 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23546 ?auto_23552 ) ( IS-CRATE ?auto_23543 ) ( not ( = ?auto_23543 ?auto_23544 ) ) ( not ( = ?auto_23558 ?auto_23552 ) ) ( HOIST-AT ?auto_23545 ?auto_23558 ) ( not ( = ?auto_23546 ?auto_23545 ) ) ( SURFACE-AT ?auto_23543 ?auto_23558 ) ( ON ?auto_23543 ?auto_23556 ) ( CLEAR ?auto_23543 ) ( not ( = ?auto_23543 ?auto_23556 ) ) ( not ( = ?auto_23544 ?auto_23556 ) ) ( IS-CRATE ?auto_23544 ) ( not ( = ?auto_23543 ?auto_23553 ) ) ( not ( = ?auto_23544 ?auto_23553 ) ) ( not ( = ?auto_23556 ?auto_23553 ) ) ( not ( = ?auto_23551 ?auto_23552 ) ) ( not ( = ?auto_23558 ?auto_23551 ) ) ( HOIST-AT ?auto_23554 ?auto_23551 ) ( not ( = ?auto_23546 ?auto_23554 ) ) ( not ( = ?auto_23545 ?auto_23554 ) ) ( AVAILABLE ?auto_23554 ) ( SURFACE-AT ?auto_23544 ?auto_23551 ) ( ON ?auto_23544 ?auto_23550 ) ( CLEAR ?auto_23544 ) ( not ( = ?auto_23543 ?auto_23550 ) ) ( not ( = ?auto_23544 ?auto_23550 ) ) ( not ( = ?auto_23556 ?auto_23550 ) ) ( not ( = ?auto_23553 ?auto_23550 ) ) ( IS-CRATE ?auto_23553 ) ( not ( = ?auto_23543 ?auto_23547 ) ) ( not ( = ?auto_23544 ?auto_23547 ) ) ( not ( = ?auto_23556 ?auto_23547 ) ) ( not ( = ?auto_23553 ?auto_23547 ) ) ( not ( = ?auto_23550 ?auto_23547 ) ) ( SURFACE-AT ?auto_23553 ?auto_23558 ) ( ON ?auto_23553 ?auto_23557 ) ( CLEAR ?auto_23553 ) ( not ( = ?auto_23543 ?auto_23557 ) ) ( not ( = ?auto_23544 ?auto_23557 ) ) ( not ( = ?auto_23556 ?auto_23557 ) ) ( not ( = ?auto_23553 ?auto_23557 ) ) ( not ( = ?auto_23550 ?auto_23557 ) ) ( not ( = ?auto_23547 ?auto_23557 ) ) ( SURFACE-AT ?auto_23548 ?auto_23552 ) ( CLEAR ?auto_23548 ) ( IS-CRATE ?auto_23547 ) ( not ( = ?auto_23543 ?auto_23548 ) ) ( not ( = ?auto_23544 ?auto_23548 ) ) ( not ( = ?auto_23556 ?auto_23548 ) ) ( not ( = ?auto_23553 ?auto_23548 ) ) ( not ( = ?auto_23550 ?auto_23548 ) ) ( not ( = ?auto_23547 ?auto_23548 ) ) ( not ( = ?auto_23557 ?auto_23548 ) ) ( AVAILABLE ?auto_23546 ) ( AVAILABLE ?auto_23545 ) ( SURFACE-AT ?auto_23547 ?auto_23558 ) ( ON ?auto_23547 ?auto_23549 ) ( CLEAR ?auto_23547 ) ( not ( = ?auto_23543 ?auto_23549 ) ) ( not ( = ?auto_23544 ?auto_23549 ) ) ( not ( = ?auto_23556 ?auto_23549 ) ) ( not ( = ?auto_23553 ?auto_23549 ) ) ( not ( = ?auto_23550 ?auto_23549 ) ) ( not ( = ?auto_23547 ?auto_23549 ) ) ( not ( = ?auto_23557 ?auto_23549 ) ) ( not ( = ?auto_23548 ?auto_23549 ) ) ( TRUCK-AT ?auto_23555 ?auto_23552 ) )
    :subtasks
    ( ( !DRIVE ?auto_23555 ?auto_23552 ?auto_23558 )
      ( MAKE-ON ?auto_23543 ?auto_23544 )
      ( MAKE-ON-VERIFY ?auto_23543 ?auto_23544 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23561 - SURFACE
      ?auto_23562 - SURFACE
    )
    :vars
    (
      ?auto_23563 - HOIST
      ?auto_23564 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23563 ?auto_23564 ) ( SURFACE-AT ?auto_23562 ?auto_23564 ) ( CLEAR ?auto_23562 ) ( LIFTING ?auto_23563 ?auto_23561 ) ( IS-CRATE ?auto_23561 ) ( not ( = ?auto_23561 ?auto_23562 ) ) )
    :subtasks
    ( ( !DROP ?auto_23563 ?auto_23561 ?auto_23562 ?auto_23564 )
      ( MAKE-ON-VERIFY ?auto_23561 ?auto_23562 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23565 - SURFACE
      ?auto_23566 - SURFACE
    )
    :vars
    (
      ?auto_23567 - HOIST
      ?auto_23568 - PLACE
      ?auto_23569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23567 ?auto_23568 ) ( SURFACE-AT ?auto_23566 ?auto_23568 ) ( CLEAR ?auto_23566 ) ( IS-CRATE ?auto_23565 ) ( not ( = ?auto_23565 ?auto_23566 ) ) ( TRUCK-AT ?auto_23569 ?auto_23568 ) ( AVAILABLE ?auto_23567 ) ( IN ?auto_23565 ?auto_23569 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23567 ?auto_23565 ?auto_23569 ?auto_23568 )
      ( MAKE-ON ?auto_23565 ?auto_23566 )
      ( MAKE-ON-VERIFY ?auto_23565 ?auto_23566 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23570 - SURFACE
      ?auto_23571 - SURFACE
    )
    :vars
    (
      ?auto_23572 - HOIST
      ?auto_23574 - PLACE
      ?auto_23573 - TRUCK
      ?auto_23575 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23572 ?auto_23574 ) ( SURFACE-AT ?auto_23571 ?auto_23574 ) ( CLEAR ?auto_23571 ) ( IS-CRATE ?auto_23570 ) ( not ( = ?auto_23570 ?auto_23571 ) ) ( AVAILABLE ?auto_23572 ) ( IN ?auto_23570 ?auto_23573 ) ( TRUCK-AT ?auto_23573 ?auto_23575 ) ( not ( = ?auto_23575 ?auto_23574 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23573 ?auto_23575 ?auto_23574 )
      ( MAKE-ON ?auto_23570 ?auto_23571 )
      ( MAKE-ON-VERIFY ?auto_23570 ?auto_23571 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23576 - SURFACE
      ?auto_23577 - SURFACE
    )
    :vars
    (
      ?auto_23578 - HOIST
      ?auto_23581 - PLACE
      ?auto_23580 - TRUCK
      ?auto_23579 - PLACE
      ?auto_23582 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23578 ?auto_23581 ) ( SURFACE-AT ?auto_23577 ?auto_23581 ) ( CLEAR ?auto_23577 ) ( IS-CRATE ?auto_23576 ) ( not ( = ?auto_23576 ?auto_23577 ) ) ( AVAILABLE ?auto_23578 ) ( TRUCK-AT ?auto_23580 ?auto_23579 ) ( not ( = ?auto_23579 ?auto_23581 ) ) ( HOIST-AT ?auto_23582 ?auto_23579 ) ( LIFTING ?auto_23582 ?auto_23576 ) ( not ( = ?auto_23578 ?auto_23582 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23582 ?auto_23576 ?auto_23580 ?auto_23579 )
      ( MAKE-ON ?auto_23576 ?auto_23577 )
      ( MAKE-ON-VERIFY ?auto_23576 ?auto_23577 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23583 - SURFACE
      ?auto_23584 - SURFACE
    )
    :vars
    (
      ?auto_23588 - HOIST
      ?auto_23585 - PLACE
      ?auto_23589 - TRUCK
      ?auto_23586 - PLACE
      ?auto_23587 - HOIST
      ?auto_23590 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23588 ?auto_23585 ) ( SURFACE-AT ?auto_23584 ?auto_23585 ) ( CLEAR ?auto_23584 ) ( IS-CRATE ?auto_23583 ) ( not ( = ?auto_23583 ?auto_23584 ) ) ( AVAILABLE ?auto_23588 ) ( TRUCK-AT ?auto_23589 ?auto_23586 ) ( not ( = ?auto_23586 ?auto_23585 ) ) ( HOIST-AT ?auto_23587 ?auto_23586 ) ( not ( = ?auto_23588 ?auto_23587 ) ) ( AVAILABLE ?auto_23587 ) ( SURFACE-AT ?auto_23583 ?auto_23586 ) ( ON ?auto_23583 ?auto_23590 ) ( CLEAR ?auto_23583 ) ( not ( = ?auto_23583 ?auto_23590 ) ) ( not ( = ?auto_23584 ?auto_23590 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23587 ?auto_23583 ?auto_23590 ?auto_23586 )
      ( MAKE-ON ?auto_23583 ?auto_23584 )
      ( MAKE-ON-VERIFY ?auto_23583 ?auto_23584 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23591 - SURFACE
      ?auto_23592 - SURFACE
    )
    :vars
    (
      ?auto_23597 - HOIST
      ?auto_23593 - PLACE
      ?auto_23595 - PLACE
      ?auto_23598 - HOIST
      ?auto_23596 - SURFACE
      ?auto_23594 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23597 ?auto_23593 ) ( SURFACE-AT ?auto_23592 ?auto_23593 ) ( CLEAR ?auto_23592 ) ( IS-CRATE ?auto_23591 ) ( not ( = ?auto_23591 ?auto_23592 ) ) ( AVAILABLE ?auto_23597 ) ( not ( = ?auto_23595 ?auto_23593 ) ) ( HOIST-AT ?auto_23598 ?auto_23595 ) ( not ( = ?auto_23597 ?auto_23598 ) ) ( AVAILABLE ?auto_23598 ) ( SURFACE-AT ?auto_23591 ?auto_23595 ) ( ON ?auto_23591 ?auto_23596 ) ( CLEAR ?auto_23591 ) ( not ( = ?auto_23591 ?auto_23596 ) ) ( not ( = ?auto_23592 ?auto_23596 ) ) ( TRUCK-AT ?auto_23594 ?auto_23593 ) )
    :subtasks
    ( ( !DRIVE ?auto_23594 ?auto_23593 ?auto_23595 )
      ( MAKE-ON ?auto_23591 ?auto_23592 )
      ( MAKE-ON-VERIFY ?auto_23591 ?auto_23592 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23599 - SURFACE
      ?auto_23600 - SURFACE
    )
    :vars
    (
      ?auto_23606 - HOIST
      ?auto_23605 - PLACE
      ?auto_23603 - PLACE
      ?auto_23602 - HOIST
      ?auto_23604 - SURFACE
      ?auto_23601 - TRUCK
      ?auto_23607 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23606 ?auto_23605 ) ( IS-CRATE ?auto_23599 ) ( not ( = ?auto_23599 ?auto_23600 ) ) ( not ( = ?auto_23603 ?auto_23605 ) ) ( HOIST-AT ?auto_23602 ?auto_23603 ) ( not ( = ?auto_23606 ?auto_23602 ) ) ( AVAILABLE ?auto_23602 ) ( SURFACE-AT ?auto_23599 ?auto_23603 ) ( ON ?auto_23599 ?auto_23604 ) ( CLEAR ?auto_23599 ) ( not ( = ?auto_23599 ?auto_23604 ) ) ( not ( = ?auto_23600 ?auto_23604 ) ) ( TRUCK-AT ?auto_23601 ?auto_23605 ) ( SURFACE-AT ?auto_23607 ?auto_23605 ) ( CLEAR ?auto_23607 ) ( LIFTING ?auto_23606 ?auto_23600 ) ( IS-CRATE ?auto_23600 ) ( not ( = ?auto_23599 ?auto_23607 ) ) ( not ( = ?auto_23600 ?auto_23607 ) ) ( not ( = ?auto_23604 ?auto_23607 ) ) )
    :subtasks
    ( ( !DROP ?auto_23606 ?auto_23600 ?auto_23607 ?auto_23605 )
      ( MAKE-ON ?auto_23599 ?auto_23600 )
      ( MAKE-ON-VERIFY ?auto_23599 ?auto_23600 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23608 - SURFACE
      ?auto_23609 - SURFACE
    )
    :vars
    (
      ?auto_23615 - HOIST
      ?auto_23614 - PLACE
      ?auto_23612 - PLACE
      ?auto_23613 - HOIST
      ?auto_23610 - SURFACE
      ?auto_23611 - TRUCK
      ?auto_23616 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23615 ?auto_23614 ) ( IS-CRATE ?auto_23608 ) ( not ( = ?auto_23608 ?auto_23609 ) ) ( not ( = ?auto_23612 ?auto_23614 ) ) ( HOIST-AT ?auto_23613 ?auto_23612 ) ( not ( = ?auto_23615 ?auto_23613 ) ) ( AVAILABLE ?auto_23613 ) ( SURFACE-AT ?auto_23608 ?auto_23612 ) ( ON ?auto_23608 ?auto_23610 ) ( CLEAR ?auto_23608 ) ( not ( = ?auto_23608 ?auto_23610 ) ) ( not ( = ?auto_23609 ?auto_23610 ) ) ( TRUCK-AT ?auto_23611 ?auto_23614 ) ( SURFACE-AT ?auto_23616 ?auto_23614 ) ( CLEAR ?auto_23616 ) ( IS-CRATE ?auto_23609 ) ( not ( = ?auto_23608 ?auto_23616 ) ) ( not ( = ?auto_23609 ?auto_23616 ) ) ( not ( = ?auto_23610 ?auto_23616 ) ) ( AVAILABLE ?auto_23615 ) ( IN ?auto_23609 ?auto_23611 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23615 ?auto_23609 ?auto_23611 ?auto_23614 )
      ( MAKE-ON ?auto_23608 ?auto_23609 )
      ( MAKE-ON-VERIFY ?auto_23608 ?auto_23609 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23617 - SURFACE
      ?auto_23618 - SURFACE
    )
    :vars
    (
      ?auto_23620 - HOIST
      ?auto_23625 - PLACE
      ?auto_23621 - PLACE
      ?auto_23622 - HOIST
      ?auto_23619 - SURFACE
      ?auto_23623 - SURFACE
      ?auto_23624 - TRUCK
      ?auto_23626 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23620 ?auto_23625 ) ( IS-CRATE ?auto_23617 ) ( not ( = ?auto_23617 ?auto_23618 ) ) ( not ( = ?auto_23621 ?auto_23625 ) ) ( HOIST-AT ?auto_23622 ?auto_23621 ) ( not ( = ?auto_23620 ?auto_23622 ) ) ( AVAILABLE ?auto_23622 ) ( SURFACE-AT ?auto_23617 ?auto_23621 ) ( ON ?auto_23617 ?auto_23619 ) ( CLEAR ?auto_23617 ) ( not ( = ?auto_23617 ?auto_23619 ) ) ( not ( = ?auto_23618 ?auto_23619 ) ) ( SURFACE-AT ?auto_23623 ?auto_23625 ) ( CLEAR ?auto_23623 ) ( IS-CRATE ?auto_23618 ) ( not ( = ?auto_23617 ?auto_23623 ) ) ( not ( = ?auto_23618 ?auto_23623 ) ) ( not ( = ?auto_23619 ?auto_23623 ) ) ( AVAILABLE ?auto_23620 ) ( IN ?auto_23618 ?auto_23624 ) ( TRUCK-AT ?auto_23624 ?auto_23626 ) ( not ( = ?auto_23626 ?auto_23625 ) ) ( not ( = ?auto_23621 ?auto_23626 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23624 ?auto_23626 ?auto_23625 )
      ( MAKE-ON ?auto_23617 ?auto_23618 )
      ( MAKE-ON-VERIFY ?auto_23617 ?auto_23618 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23627 - SURFACE
      ?auto_23628 - SURFACE
    )
    :vars
    (
      ?auto_23630 - HOIST
      ?auto_23634 - PLACE
      ?auto_23629 - PLACE
      ?auto_23635 - HOIST
      ?auto_23636 - SURFACE
      ?auto_23633 - SURFACE
      ?auto_23632 - TRUCK
      ?auto_23631 - PLACE
      ?auto_23637 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23630 ?auto_23634 ) ( IS-CRATE ?auto_23627 ) ( not ( = ?auto_23627 ?auto_23628 ) ) ( not ( = ?auto_23629 ?auto_23634 ) ) ( HOIST-AT ?auto_23635 ?auto_23629 ) ( not ( = ?auto_23630 ?auto_23635 ) ) ( AVAILABLE ?auto_23635 ) ( SURFACE-AT ?auto_23627 ?auto_23629 ) ( ON ?auto_23627 ?auto_23636 ) ( CLEAR ?auto_23627 ) ( not ( = ?auto_23627 ?auto_23636 ) ) ( not ( = ?auto_23628 ?auto_23636 ) ) ( SURFACE-AT ?auto_23633 ?auto_23634 ) ( CLEAR ?auto_23633 ) ( IS-CRATE ?auto_23628 ) ( not ( = ?auto_23627 ?auto_23633 ) ) ( not ( = ?auto_23628 ?auto_23633 ) ) ( not ( = ?auto_23636 ?auto_23633 ) ) ( AVAILABLE ?auto_23630 ) ( TRUCK-AT ?auto_23632 ?auto_23631 ) ( not ( = ?auto_23631 ?auto_23634 ) ) ( not ( = ?auto_23629 ?auto_23631 ) ) ( HOIST-AT ?auto_23637 ?auto_23631 ) ( LIFTING ?auto_23637 ?auto_23628 ) ( not ( = ?auto_23630 ?auto_23637 ) ) ( not ( = ?auto_23635 ?auto_23637 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23637 ?auto_23628 ?auto_23632 ?auto_23631 )
      ( MAKE-ON ?auto_23627 ?auto_23628 )
      ( MAKE-ON-VERIFY ?auto_23627 ?auto_23628 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23638 - SURFACE
      ?auto_23639 - SURFACE
    )
    :vars
    (
      ?auto_23645 - HOIST
      ?auto_23646 - PLACE
      ?auto_23642 - PLACE
      ?auto_23648 - HOIST
      ?auto_23640 - SURFACE
      ?auto_23647 - SURFACE
      ?auto_23643 - TRUCK
      ?auto_23644 - PLACE
      ?auto_23641 - HOIST
      ?auto_23649 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23645 ?auto_23646 ) ( IS-CRATE ?auto_23638 ) ( not ( = ?auto_23638 ?auto_23639 ) ) ( not ( = ?auto_23642 ?auto_23646 ) ) ( HOIST-AT ?auto_23648 ?auto_23642 ) ( not ( = ?auto_23645 ?auto_23648 ) ) ( AVAILABLE ?auto_23648 ) ( SURFACE-AT ?auto_23638 ?auto_23642 ) ( ON ?auto_23638 ?auto_23640 ) ( CLEAR ?auto_23638 ) ( not ( = ?auto_23638 ?auto_23640 ) ) ( not ( = ?auto_23639 ?auto_23640 ) ) ( SURFACE-AT ?auto_23647 ?auto_23646 ) ( CLEAR ?auto_23647 ) ( IS-CRATE ?auto_23639 ) ( not ( = ?auto_23638 ?auto_23647 ) ) ( not ( = ?auto_23639 ?auto_23647 ) ) ( not ( = ?auto_23640 ?auto_23647 ) ) ( AVAILABLE ?auto_23645 ) ( TRUCK-AT ?auto_23643 ?auto_23644 ) ( not ( = ?auto_23644 ?auto_23646 ) ) ( not ( = ?auto_23642 ?auto_23644 ) ) ( HOIST-AT ?auto_23641 ?auto_23644 ) ( not ( = ?auto_23645 ?auto_23641 ) ) ( not ( = ?auto_23648 ?auto_23641 ) ) ( AVAILABLE ?auto_23641 ) ( SURFACE-AT ?auto_23639 ?auto_23644 ) ( ON ?auto_23639 ?auto_23649 ) ( CLEAR ?auto_23639 ) ( not ( = ?auto_23638 ?auto_23649 ) ) ( not ( = ?auto_23639 ?auto_23649 ) ) ( not ( = ?auto_23640 ?auto_23649 ) ) ( not ( = ?auto_23647 ?auto_23649 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23641 ?auto_23639 ?auto_23649 ?auto_23644 )
      ( MAKE-ON ?auto_23638 ?auto_23639 )
      ( MAKE-ON-VERIFY ?auto_23638 ?auto_23639 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23650 - SURFACE
      ?auto_23651 - SURFACE
    )
    :vars
    (
      ?auto_23656 - HOIST
      ?auto_23660 - PLACE
      ?auto_23653 - PLACE
      ?auto_23661 - HOIST
      ?auto_23655 - SURFACE
      ?auto_23652 - SURFACE
      ?auto_23658 - PLACE
      ?auto_23659 - HOIST
      ?auto_23654 - SURFACE
      ?auto_23657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23656 ?auto_23660 ) ( IS-CRATE ?auto_23650 ) ( not ( = ?auto_23650 ?auto_23651 ) ) ( not ( = ?auto_23653 ?auto_23660 ) ) ( HOIST-AT ?auto_23661 ?auto_23653 ) ( not ( = ?auto_23656 ?auto_23661 ) ) ( AVAILABLE ?auto_23661 ) ( SURFACE-AT ?auto_23650 ?auto_23653 ) ( ON ?auto_23650 ?auto_23655 ) ( CLEAR ?auto_23650 ) ( not ( = ?auto_23650 ?auto_23655 ) ) ( not ( = ?auto_23651 ?auto_23655 ) ) ( SURFACE-AT ?auto_23652 ?auto_23660 ) ( CLEAR ?auto_23652 ) ( IS-CRATE ?auto_23651 ) ( not ( = ?auto_23650 ?auto_23652 ) ) ( not ( = ?auto_23651 ?auto_23652 ) ) ( not ( = ?auto_23655 ?auto_23652 ) ) ( AVAILABLE ?auto_23656 ) ( not ( = ?auto_23658 ?auto_23660 ) ) ( not ( = ?auto_23653 ?auto_23658 ) ) ( HOIST-AT ?auto_23659 ?auto_23658 ) ( not ( = ?auto_23656 ?auto_23659 ) ) ( not ( = ?auto_23661 ?auto_23659 ) ) ( AVAILABLE ?auto_23659 ) ( SURFACE-AT ?auto_23651 ?auto_23658 ) ( ON ?auto_23651 ?auto_23654 ) ( CLEAR ?auto_23651 ) ( not ( = ?auto_23650 ?auto_23654 ) ) ( not ( = ?auto_23651 ?auto_23654 ) ) ( not ( = ?auto_23655 ?auto_23654 ) ) ( not ( = ?auto_23652 ?auto_23654 ) ) ( TRUCK-AT ?auto_23657 ?auto_23660 ) )
    :subtasks
    ( ( !DRIVE ?auto_23657 ?auto_23660 ?auto_23658 )
      ( MAKE-ON ?auto_23650 ?auto_23651 )
      ( MAKE-ON-VERIFY ?auto_23650 ?auto_23651 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23662 - SURFACE
      ?auto_23663 - SURFACE
    )
    :vars
    (
      ?auto_23670 - HOIST
      ?auto_23668 - PLACE
      ?auto_23665 - PLACE
      ?auto_23666 - HOIST
      ?auto_23664 - SURFACE
      ?auto_23667 - SURFACE
      ?auto_23671 - PLACE
      ?auto_23672 - HOIST
      ?auto_23669 - SURFACE
      ?auto_23673 - TRUCK
      ?auto_23674 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23670 ?auto_23668 ) ( IS-CRATE ?auto_23662 ) ( not ( = ?auto_23662 ?auto_23663 ) ) ( not ( = ?auto_23665 ?auto_23668 ) ) ( HOIST-AT ?auto_23666 ?auto_23665 ) ( not ( = ?auto_23670 ?auto_23666 ) ) ( AVAILABLE ?auto_23666 ) ( SURFACE-AT ?auto_23662 ?auto_23665 ) ( ON ?auto_23662 ?auto_23664 ) ( CLEAR ?auto_23662 ) ( not ( = ?auto_23662 ?auto_23664 ) ) ( not ( = ?auto_23663 ?auto_23664 ) ) ( IS-CRATE ?auto_23663 ) ( not ( = ?auto_23662 ?auto_23667 ) ) ( not ( = ?auto_23663 ?auto_23667 ) ) ( not ( = ?auto_23664 ?auto_23667 ) ) ( not ( = ?auto_23671 ?auto_23668 ) ) ( not ( = ?auto_23665 ?auto_23671 ) ) ( HOIST-AT ?auto_23672 ?auto_23671 ) ( not ( = ?auto_23670 ?auto_23672 ) ) ( not ( = ?auto_23666 ?auto_23672 ) ) ( AVAILABLE ?auto_23672 ) ( SURFACE-AT ?auto_23663 ?auto_23671 ) ( ON ?auto_23663 ?auto_23669 ) ( CLEAR ?auto_23663 ) ( not ( = ?auto_23662 ?auto_23669 ) ) ( not ( = ?auto_23663 ?auto_23669 ) ) ( not ( = ?auto_23664 ?auto_23669 ) ) ( not ( = ?auto_23667 ?auto_23669 ) ) ( TRUCK-AT ?auto_23673 ?auto_23668 ) ( SURFACE-AT ?auto_23674 ?auto_23668 ) ( CLEAR ?auto_23674 ) ( LIFTING ?auto_23670 ?auto_23667 ) ( IS-CRATE ?auto_23667 ) ( not ( = ?auto_23662 ?auto_23674 ) ) ( not ( = ?auto_23663 ?auto_23674 ) ) ( not ( = ?auto_23664 ?auto_23674 ) ) ( not ( = ?auto_23667 ?auto_23674 ) ) ( not ( = ?auto_23669 ?auto_23674 ) ) )
    :subtasks
    ( ( !DROP ?auto_23670 ?auto_23667 ?auto_23674 ?auto_23668 )
      ( MAKE-ON ?auto_23662 ?auto_23663 )
      ( MAKE-ON-VERIFY ?auto_23662 ?auto_23663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23675 - SURFACE
      ?auto_23676 - SURFACE
    )
    :vars
    (
      ?auto_23681 - HOIST
      ?auto_23682 - PLACE
      ?auto_23686 - PLACE
      ?auto_23679 - HOIST
      ?auto_23678 - SURFACE
      ?auto_23687 - SURFACE
      ?auto_23680 - PLACE
      ?auto_23677 - HOIST
      ?auto_23685 - SURFACE
      ?auto_23684 - TRUCK
      ?auto_23683 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23681 ?auto_23682 ) ( IS-CRATE ?auto_23675 ) ( not ( = ?auto_23675 ?auto_23676 ) ) ( not ( = ?auto_23686 ?auto_23682 ) ) ( HOIST-AT ?auto_23679 ?auto_23686 ) ( not ( = ?auto_23681 ?auto_23679 ) ) ( AVAILABLE ?auto_23679 ) ( SURFACE-AT ?auto_23675 ?auto_23686 ) ( ON ?auto_23675 ?auto_23678 ) ( CLEAR ?auto_23675 ) ( not ( = ?auto_23675 ?auto_23678 ) ) ( not ( = ?auto_23676 ?auto_23678 ) ) ( IS-CRATE ?auto_23676 ) ( not ( = ?auto_23675 ?auto_23687 ) ) ( not ( = ?auto_23676 ?auto_23687 ) ) ( not ( = ?auto_23678 ?auto_23687 ) ) ( not ( = ?auto_23680 ?auto_23682 ) ) ( not ( = ?auto_23686 ?auto_23680 ) ) ( HOIST-AT ?auto_23677 ?auto_23680 ) ( not ( = ?auto_23681 ?auto_23677 ) ) ( not ( = ?auto_23679 ?auto_23677 ) ) ( AVAILABLE ?auto_23677 ) ( SURFACE-AT ?auto_23676 ?auto_23680 ) ( ON ?auto_23676 ?auto_23685 ) ( CLEAR ?auto_23676 ) ( not ( = ?auto_23675 ?auto_23685 ) ) ( not ( = ?auto_23676 ?auto_23685 ) ) ( not ( = ?auto_23678 ?auto_23685 ) ) ( not ( = ?auto_23687 ?auto_23685 ) ) ( TRUCK-AT ?auto_23684 ?auto_23682 ) ( SURFACE-AT ?auto_23683 ?auto_23682 ) ( CLEAR ?auto_23683 ) ( IS-CRATE ?auto_23687 ) ( not ( = ?auto_23675 ?auto_23683 ) ) ( not ( = ?auto_23676 ?auto_23683 ) ) ( not ( = ?auto_23678 ?auto_23683 ) ) ( not ( = ?auto_23687 ?auto_23683 ) ) ( not ( = ?auto_23685 ?auto_23683 ) ) ( AVAILABLE ?auto_23681 ) ( IN ?auto_23687 ?auto_23684 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23681 ?auto_23687 ?auto_23684 ?auto_23682 )
      ( MAKE-ON ?auto_23675 ?auto_23676 )
      ( MAKE-ON-VERIFY ?auto_23675 ?auto_23676 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23688 - SURFACE
      ?auto_23689 - SURFACE
    )
    :vars
    (
      ?auto_23699 - HOIST
      ?auto_23698 - PLACE
      ?auto_23690 - PLACE
      ?auto_23694 - HOIST
      ?auto_23696 - SURFACE
      ?auto_23692 - SURFACE
      ?auto_23693 - PLACE
      ?auto_23700 - HOIST
      ?auto_23695 - SURFACE
      ?auto_23697 - SURFACE
      ?auto_23691 - TRUCK
      ?auto_23701 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23699 ?auto_23698 ) ( IS-CRATE ?auto_23688 ) ( not ( = ?auto_23688 ?auto_23689 ) ) ( not ( = ?auto_23690 ?auto_23698 ) ) ( HOIST-AT ?auto_23694 ?auto_23690 ) ( not ( = ?auto_23699 ?auto_23694 ) ) ( AVAILABLE ?auto_23694 ) ( SURFACE-AT ?auto_23688 ?auto_23690 ) ( ON ?auto_23688 ?auto_23696 ) ( CLEAR ?auto_23688 ) ( not ( = ?auto_23688 ?auto_23696 ) ) ( not ( = ?auto_23689 ?auto_23696 ) ) ( IS-CRATE ?auto_23689 ) ( not ( = ?auto_23688 ?auto_23692 ) ) ( not ( = ?auto_23689 ?auto_23692 ) ) ( not ( = ?auto_23696 ?auto_23692 ) ) ( not ( = ?auto_23693 ?auto_23698 ) ) ( not ( = ?auto_23690 ?auto_23693 ) ) ( HOIST-AT ?auto_23700 ?auto_23693 ) ( not ( = ?auto_23699 ?auto_23700 ) ) ( not ( = ?auto_23694 ?auto_23700 ) ) ( AVAILABLE ?auto_23700 ) ( SURFACE-AT ?auto_23689 ?auto_23693 ) ( ON ?auto_23689 ?auto_23695 ) ( CLEAR ?auto_23689 ) ( not ( = ?auto_23688 ?auto_23695 ) ) ( not ( = ?auto_23689 ?auto_23695 ) ) ( not ( = ?auto_23696 ?auto_23695 ) ) ( not ( = ?auto_23692 ?auto_23695 ) ) ( SURFACE-AT ?auto_23697 ?auto_23698 ) ( CLEAR ?auto_23697 ) ( IS-CRATE ?auto_23692 ) ( not ( = ?auto_23688 ?auto_23697 ) ) ( not ( = ?auto_23689 ?auto_23697 ) ) ( not ( = ?auto_23696 ?auto_23697 ) ) ( not ( = ?auto_23692 ?auto_23697 ) ) ( not ( = ?auto_23695 ?auto_23697 ) ) ( AVAILABLE ?auto_23699 ) ( IN ?auto_23692 ?auto_23691 ) ( TRUCK-AT ?auto_23691 ?auto_23701 ) ( not ( = ?auto_23701 ?auto_23698 ) ) ( not ( = ?auto_23690 ?auto_23701 ) ) ( not ( = ?auto_23693 ?auto_23701 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23691 ?auto_23701 ?auto_23698 )
      ( MAKE-ON ?auto_23688 ?auto_23689 )
      ( MAKE-ON-VERIFY ?auto_23688 ?auto_23689 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23702 - SURFACE
      ?auto_23703 - SURFACE
    )
    :vars
    (
      ?auto_23710 - HOIST
      ?auto_23715 - PLACE
      ?auto_23714 - PLACE
      ?auto_23704 - HOIST
      ?auto_23712 - SURFACE
      ?auto_23711 - SURFACE
      ?auto_23708 - PLACE
      ?auto_23707 - HOIST
      ?auto_23705 - SURFACE
      ?auto_23706 - SURFACE
      ?auto_23709 - TRUCK
      ?auto_23713 - PLACE
      ?auto_23716 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23710 ?auto_23715 ) ( IS-CRATE ?auto_23702 ) ( not ( = ?auto_23702 ?auto_23703 ) ) ( not ( = ?auto_23714 ?auto_23715 ) ) ( HOIST-AT ?auto_23704 ?auto_23714 ) ( not ( = ?auto_23710 ?auto_23704 ) ) ( AVAILABLE ?auto_23704 ) ( SURFACE-AT ?auto_23702 ?auto_23714 ) ( ON ?auto_23702 ?auto_23712 ) ( CLEAR ?auto_23702 ) ( not ( = ?auto_23702 ?auto_23712 ) ) ( not ( = ?auto_23703 ?auto_23712 ) ) ( IS-CRATE ?auto_23703 ) ( not ( = ?auto_23702 ?auto_23711 ) ) ( not ( = ?auto_23703 ?auto_23711 ) ) ( not ( = ?auto_23712 ?auto_23711 ) ) ( not ( = ?auto_23708 ?auto_23715 ) ) ( not ( = ?auto_23714 ?auto_23708 ) ) ( HOIST-AT ?auto_23707 ?auto_23708 ) ( not ( = ?auto_23710 ?auto_23707 ) ) ( not ( = ?auto_23704 ?auto_23707 ) ) ( AVAILABLE ?auto_23707 ) ( SURFACE-AT ?auto_23703 ?auto_23708 ) ( ON ?auto_23703 ?auto_23705 ) ( CLEAR ?auto_23703 ) ( not ( = ?auto_23702 ?auto_23705 ) ) ( not ( = ?auto_23703 ?auto_23705 ) ) ( not ( = ?auto_23712 ?auto_23705 ) ) ( not ( = ?auto_23711 ?auto_23705 ) ) ( SURFACE-AT ?auto_23706 ?auto_23715 ) ( CLEAR ?auto_23706 ) ( IS-CRATE ?auto_23711 ) ( not ( = ?auto_23702 ?auto_23706 ) ) ( not ( = ?auto_23703 ?auto_23706 ) ) ( not ( = ?auto_23712 ?auto_23706 ) ) ( not ( = ?auto_23711 ?auto_23706 ) ) ( not ( = ?auto_23705 ?auto_23706 ) ) ( AVAILABLE ?auto_23710 ) ( TRUCK-AT ?auto_23709 ?auto_23713 ) ( not ( = ?auto_23713 ?auto_23715 ) ) ( not ( = ?auto_23714 ?auto_23713 ) ) ( not ( = ?auto_23708 ?auto_23713 ) ) ( HOIST-AT ?auto_23716 ?auto_23713 ) ( LIFTING ?auto_23716 ?auto_23711 ) ( not ( = ?auto_23710 ?auto_23716 ) ) ( not ( = ?auto_23704 ?auto_23716 ) ) ( not ( = ?auto_23707 ?auto_23716 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23716 ?auto_23711 ?auto_23709 ?auto_23713 )
      ( MAKE-ON ?auto_23702 ?auto_23703 )
      ( MAKE-ON-VERIFY ?auto_23702 ?auto_23703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23717 - SURFACE
      ?auto_23718 - SURFACE
    )
    :vars
    (
      ?auto_23731 - HOIST
      ?auto_23726 - PLACE
      ?auto_23725 - PLACE
      ?auto_23720 - HOIST
      ?auto_23723 - SURFACE
      ?auto_23728 - SURFACE
      ?auto_23721 - PLACE
      ?auto_23722 - HOIST
      ?auto_23724 - SURFACE
      ?auto_23729 - SURFACE
      ?auto_23719 - TRUCK
      ?auto_23727 - PLACE
      ?auto_23730 - HOIST
      ?auto_23732 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23731 ?auto_23726 ) ( IS-CRATE ?auto_23717 ) ( not ( = ?auto_23717 ?auto_23718 ) ) ( not ( = ?auto_23725 ?auto_23726 ) ) ( HOIST-AT ?auto_23720 ?auto_23725 ) ( not ( = ?auto_23731 ?auto_23720 ) ) ( AVAILABLE ?auto_23720 ) ( SURFACE-AT ?auto_23717 ?auto_23725 ) ( ON ?auto_23717 ?auto_23723 ) ( CLEAR ?auto_23717 ) ( not ( = ?auto_23717 ?auto_23723 ) ) ( not ( = ?auto_23718 ?auto_23723 ) ) ( IS-CRATE ?auto_23718 ) ( not ( = ?auto_23717 ?auto_23728 ) ) ( not ( = ?auto_23718 ?auto_23728 ) ) ( not ( = ?auto_23723 ?auto_23728 ) ) ( not ( = ?auto_23721 ?auto_23726 ) ) ( not ( = ?auto_23725 ?auto_23721 ) ) ( HOIST-AT ?auto_23722 ?auto_23721 ) ( not ( = ?auto_23731 ?auto_23722 ) ) ( not ( = ?auto_23720 ?auto_23722 ) ) ( AVAILABLE ?auto_23722 ) ( SURFACE-AT ?auto_23718 ?auto_23721 ) ( ON ?auto_23718 ?auto_23724 ) ( CLEAR ?auto_23718 ) ( not ( = ?auto_23717 ?auto_23724 ) ) ( not ( = ?auto_23718 ?auto_23724 ) ) ( not ( = ?auto_23723 ?auto_23724 ) ) ( not ( = ?auto_23728 ?auto_23724 ) ) ( SURFACE-AT ?auto_23729 ?auto_23726 ) ( CLEAR ?auto_23729 ) ( IS-CRATE ?auto_23728 ) ( not ( = ?auto_23717 ?auto_23729 ) ) ( not ( = ?auto_23718 ?auto_23729 ) ) ( not ( = ?auto_23723 ?auto_23729 ) ) ( not ( = ?auto_23728 ?auto_23729 ) ) ( not ( = ?auto_23724 ?auto_23729 ) ) ( AVAILABLE ?auto_23731 ) ( TRUCK-AT ?auto_23719 ?auto_23727 ) ( not ( = ?auto_23727 ?auto_23726 ) ) ( not ( = ?auto_23725 ?auto_23727 ) ) ( not ( = ?auto_23721 ?auto_23727 ) ) ( HOIST-AT ?auto_23730 ?auto_23727 ) ( not ( = ?auto_23731 ?auto_23730 ) ) ( not ( = ?auto_23720 ?auto_23730 ) ) ( not ( = ?auto_23722 ?auto_23730 ) ) ( AVAILABLE ?auto_23730 ) ( SURFACE-AT ?auto_23728 ?auto_23727 ) ( ON ?auto_23728 ?auto_23732 ) ( CLEAR ?auto_23728 ) ( not ( = ?auto_23717 ?auto_23732 ) ) ( not ( = ?auto_23718 ?auto_23732 ) ) ( not ( = ?auto_23723 ?auto_23732 ) ) ( not ( = ?auto_23728 ?auto_23732 ) ) ( not ( = ?auto_23724 ?auto_23732 ) ) ( not ( = ?auto_23729 ?auto_23732 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23730 ?auto_23728 ?auto_23732 ?auto_23727 )
      ( MAKE-ON ?auto_23717 ?auto_23718 )
      ( MAKE-ON-VERIFY ?auto_23717 ?auto_23718 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23733 - SURFACE
      ?auto_23734 - SURFACE
    )
    :vars
    (
      ?auto_23746 - HOIST
      ?auto_23736 - PLACE
      ?auto_23747 - PLACE
      ?auto_23739 - HOIST
      ?auto_23737 - SURFACE
      ?auto_23743 - SURFACE
      ?auto_23735 - PLACE
      ?auto_23744 - HOIST
      ?auto_23738 - SURFACE
      ?auto_23748 - SURFACE
      ?auto_23745 - PLACE
      ?auto_23740 - HOIST
      ?auto_23741 - SURFACE
      ?auto_23742 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23746 ?auto_23736 ) ( IS-CRATE ?auto_23733 ) ( not ( = ?auto_23733 ?auto_23734 ) ) ( not ( = ?auto_23747 ?auto_23736 ) ) ( HOIST-AT ?auto_23739 ?auto_23747 ) ( not ( = ?auto_23746 ?auto_23739 ) ) ( AVAILABLE ?auto_23739 ) ( SURFACE-AT ?auto_23733 ?auto_23747 ) ( ON ?auto_23733 ?auto_23737 ) ( CLEAR ?auto_23733 ) ( not ( = ?auto_23733 ?auto_23737 ) ) ( not ( = ?auto_23734 ?auto_23737 ) ) ( IS-CRATE ?auto_23734 ) ( not ( = ?auto_23733 ?auto_23743 ) ) ( not ( = ?auto_23734 ?auto_23743 ) ) ( not ( = ?auto_23737 ?auto_23743 ) ) ( not ( = ?auto_23735 ?auto_23736 ) ) ( not ( = ?auto_23747 ?auto_23735 ) ) ( HOIST-AT ?auto_23744 ?auto_23735 ) ( not ( = ?auto_23746 ?auto_23744 ) ) ( not ( = ?auto_23739 ?auto_23744 ) ) ( AVAILABLE ?auto_23744 ) ( SURFACE-AT ?auto_23734 ?auto_23735 ) ( ON ?auto_23734 ?auto_23738 ) ( CLEAR ?auto_23734 ) ( not ( = ?auto_23733 ?auto_23738 ) ) ( not ( = ?auto_23734 ?auto_23738 ) ) ( not ( = ?auto_23737 ?auto_23738 ) ) ( not ( = ?auto_23743 ?auto_23738 ) ) ( SURFACE-AT ?auto_23748 ?auto_23736 ) ( CLEAR ?auto_23748 ) ( IS-CRATE ?auto_23743 ) ( not ( = ?auto_23733 ?auto_23748 ) ) ( not ( = ?auto_23734 ?auto_23748 ) ) ( not ( = ?auto_23737 ?auto_23748 ) ) ( not ( = ?auto_23743 ?auto_23748 ) ) ( not ( = ?auto_23738 ?auto_23748 ) ) ( AVAILABLE ?auto_23746 ) ( not ( = ?auto_23745 ?auto_23736 ) ) ( not ( = ?auto_23747 ?auto_23745 ) ) ( not ( = ?auto_23735 ?auto_23745 ) ) ( HOIST-AT ?auto_23740 ?auto_23745 ) ( not ( = ?auto_23746 ?auto_23740 ) ) ( not ( = ?auto_23739 ?auto_23740 ) ) ( not ( = ?auto_23744 ?auto_23740 ) ) ( AVAILABLE ?auto_23740 ) ( SURFACE-AT ?auto_23743 ?auto_23745 ) ( ON ?auto_23743 ?auto_23741 ) ( CLEAR ?auto_23743 ) ( not ( = ?auto_23733 ?auto_23741 ) ) ( not ( = ?auto_23734 ?auto_23741 ) ) ( not ( = ?auto_23737 ?auto_23741 ) ) ( not ( = ?auto_23743 ?auto_23741 ) ) ( not ( = ?auto_23738 ?auto_23741 ) ) ( not ( = ?auto_23748 ?auto_23741 ) ) ( TRUCK-AT ?auto_23742 ?auto_23736 ) )
    :subtasks
    ( ( !DRIVE ?auto_23742 ?auto_23736 ?auto_23745 )
      ( MAKE-ON ?auto_23733 ?auto_23734 )
      ( MAKE-ON-VERIFY ?auto_23733 ?auto_23734 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23749 - SURFACE
      ?auto_23750 - SURFACE
    )
    :vars
    (
      ?auto_23759 - HOIST
      ?auto_23754 - PLACE
      ?auto_23751 - PLACE
      ?auto_23752 - HOIST
      ?auto_23762 - SURFACE
      ?auto_23755 - SURFACE
      ?auto_23758 - PLACE
      ?auto_23753 - HOIST
      ?auto_23763 - SURFACE
      ?auto_23764 - SURFACE
      ?auto_23757 - PLACE
      ?auto_23756 - HOIST
      ?auto_23761 - SURFACE
      ?auto_23760 - TRUCK
      ?auto_23765 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23759 ?auto_23754 ) ( IS-CRATE ?auto_23749 ) ( not ( = ?auto_23749 ?auto_23750 ) ) ( not ( = ?auto_23751 ?auto_23754 ) ) ( HOIST-AT ?auto_23752 ?auto_23751 ) ( not ( = ?auto_23759 ?auto_23752 ) ) ( AVAILABLE ?auto_23752 ) ( SURFACE-AT ?auto_23749 ?auto_23751 ) ( ON ?auto_23749 ?auto_23762 ) ( CLEAR ?auto_23749 ) ( not ( = ?auto_23749 ?auto_23762 ) ) ( not ( = ?auto_23750 ?auto_23762 ) ) ( IS-CRATE ?auto_23750 ) ( not ( = ?auto_23749 ?auto_23755 ) ) ( not ( = ?auto_23750 ?auto_23755 ) ) ( not ( = ?auto_23762 ?auto_23755 ) ) ( not ( = ?auto_23758 ?auto_23754 ) ) ( not ( = ?auto_23751 ?auto_23758 ) ) ( HOIST-AT ?auto_23753 ?auto_23758 ) ( not ( = ?auto_23759 ?auto_23753 ) ) ( not ( = ?auto_23752 ?auto_23753 ) ) ( AVAILABLE ?auto_23753 ) ( SURFACE-AT ?auto_23750 ?auto_23758 ) ( ON ?auto_23750 ?auto_23763 ) ( CLEAR ?auto_23750 ) ( not ( = ?auto_23749 ?auto_23763 ) ) ( not ( = ?auto_23750 ?auto_23763 ) ) ( not ( = ?auto_23762 ?auto_23763 ) ) ( not ( = ?auto_23755 ?auto_23763 ) ) ( IS-CRATE ?auto_23755 ) ( not ( = ?auto_23749 ?auto_23764 ) ) ( not ( = ?auto_23750 ?auto_23764 ) ) ( not ( = ?auto_23762 ?auto_23764 ) ) ( not ( = ?auto_23755 ?auto_23764 ) ) ( not ( = ?auto_23763 ?auto_23764 ) ) ( not ( = ?auto_23757 ?auto_23754 ) ) ( not ( = ?auto_23751 ?auto_23757 ) ) ( not ( = ?auto_23758 ?auto_23757 ) ) ( HOIST-AT ?auto_23756 ?auto_23757 ) ( not ( = ?auto_23759 ?auto_23756 ) ) ( not ( = ?auto_23752 ?auto_23756 ) ) ( not ( = ?auto_23753 ?auto_23756 ) ) ( AVAILABLE ?auto_23756 ) ( SURFACE-AT ?auto_23755 ?auto_23757 ) ( ON ?auto_23755 ?auto_23761 ) ( CLEAR ?auto_23755 ) ( not ( = ?auto_23749 ?auto_23761 ) ) ( not ( = ?auto_23750 ?auto_23761 ) ) ( not ( = ?auto_23762 ?auto_23761 ) ) ( not ( = ?auto_23755 ?auto_23761 ) ) ( not ( = ?auto_23763 ?auto_23761 ) ) ( not ( = ?auto_23764 ?auto_23761 ) ) ( TRUCK-AT ?auto_23760 ?auto_23754 ) ( SURFACE-AT ?auto_23765 ?auto_23754 ) ( CLEAR ?auto_23765 ) ( LIFTING ?auto_23759 ?auto_23764 ) ( IS-CRATE ?auto_23764 ) ( not ( = ?auto_23749 ?auto_23765 ) ) ( not ( = ?auto_23750 ?auto_23765 ) ) ( not ( = ?auto_23762 ?auto_23765 ) ) ( not ( = ?auto_23755 ?auto_23765 ) ) ( not ( = ?auto_23763 ?auto_23765 ) ) ( not ( = ?auto_23764 ?auto_23765 ) ) ( not ( = ?auto_23761 ?auto_23765 ) ) )
    :subtasks
    ( ( !DROP ?auto_23759 ?auto_23764 ?auto_23765 ?auto_23754 )
      ( MAKE-ON ?auto_23749 ?auto_23750 )
      ( MAKE-ON-VERIFY ?auto_23749 ?auto_23750 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23766 - SURFACE
      ?auto_23767 - SURFACE
    )
    :vars
    (
      ?auto_23779 - HOIST
      ?auto_23778 - PLACE
      ?auto_23768 - PLACE
      ?auto_23777 - HOIST
      ?auto_23780 - SURFACE
      ?auto_23781 - SURFACE
      ?auto_23771 - PLACE
      ?auto_23775 - HOIST
      ?auto_23774 - SURFACE
      ?auto_23776 - SURFACE
      ?auto_23782 - PLACE
      ?auto_23772 - HOIST
      ?auto_23773 - SURFACE
      ?auto_23769 - TRUCK
      ?auto_23770 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23779 ?auto_23778 ) ( IS-CRATE ?auto_23766 ) ( not ( = ?auto_23766 ?auto_23767 ) ) ( not ( = ?auto_23768 ?auto_23778 ) ) ( HOIST-AT ?auto_23777 ?auto_23768 ) ( not ( = ?auto_23779 ?auto_23777 ) ) ( AVAILABLE ?auto_23777 ) ( SURFACE-AT ?auto_23766 ?auto_23768 ) ( ON ?auto_23766 ?auto_23780 ) ( CLEAR ?auto_23766 ) ( not ( = ?auto_23766 ?auto_23780 ) ) ( not ( = ?auto_23767 ?auto_23780 ) ) ( IS-CRATE ?auto_23767 ) ( not ( = ?auto_23766 ?auto_23781 ) ) ( not ( = ?auto_23767 ?auto_23781 ) ) ( not ( = ?auto_23780 ?auto_23781 ) ) ( not ( = ?auto_23771 ?auto_23778 ) ) ( not ( = ?auto_23768 ?auto_23771 ) ) ( HOIST-AT ?auto_23775 ?auto_23771 ) ( not ( = ?auto_23779 ?auto_23775 ) ) ( not ( = ?auto_23777 ?auto_23775 ) ) ( AVAILABLE ?auto_23775 ) ( SURFACE-AT ?auto_23767 ?auto_23771 ) ( ON ?auto_23767 ?auto_23774 ) ( CLEAR ?auto_23767 ) ( not ( = ?auto_23766 ?auto_23774 ) ) ( not ( = ?auto_23767 ?auto_23774 ) ) ( not ( = ?auto_23780 ?auto_23774 ) ) ( not ( = ?auto_23781 ?auto_23774 ) ) ( IS-CRATE ?auto_23781 ) ( not ( = ?auto_23766 ?auto_23776 ) ) ( not ( = ?auto_23767 ?auto_23776 ) ) ( not ( = ?auto_23780 ?auto_23776 ) ) ( not ( = ?auto_23781 ?auto_23776 ) ) ( not ( = ?auto_23774 ?auto_23776 ) ) ( not ( = ?auto_23782 ?auto_23778 ) ) ( not ( = ?auto_23768 ?auto_23782 ) ) ( not ( = ?auto_23771 ?auto_23782 ) ) ( HOIST-AT ?auto_23772 ?auto_23782 ) ( not ( = ?auto_23779 ?auto_23772 ) ) ( not ( = ?auto_23777 ?auto_23772 ) ) ( not ( = ?auto_23775 ?auto_23772 ) ) ( AVAILABLE ?auto_23772 ) ( SURFACE-AT ?auto_23781 ?auto_23782 ) ( ON ?auto_23781 ?auto_23773 ) ( CLEAR ?auto_23781 ) ( not ( = ?auto_23766 ?auto_23773 ) ) ( not ( = ?auto_23767 ?auto_23773 ) ) ( not ( = ?auto_23780 ?auto_23773 ) ) ( not ( = ?auto_23781 ?auto_23773 ) ) ( not ( = ?auto_23774 ?auto_23773 ) ) ( not ( = ?auto_23776 ?auto_23773 ) ) ( TRUCK-AT ?auto_23769 ?auto_23778 ) ( SURFACE-AT ?auto_23770 ?auto_23778 ) ( CLEAR ?auto_23770 ) ( IS-CRATE ?auto_23776 ) ( not ( = ?auto_23766 ?auto_23770 ) ) ( not ( = ?auto_23767 ?auto_23770 ) ) ( not ( = ?auto_23780 ?auto_23770 ) ) ( not ( = ?auto_23781 ?auto_23770 ) ) ( not ( = ?auto_23774 ?auto_23770 ) ) ( not ( = ?auto_23776 ?auto_23770 ) ) ( not ( = ?auto_23773 ?auto_23770 ) ) ( AVAILABLE ?auto_23779 ) ( IN ?auto_23776 ?auto_23769 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23779 ?auto_23776 ?auto_23769 ?auto_23778 )
      ( MAKE-ON ?auto_23766 ?auto_23767 )
      ( MAKE-ON-VERIFY ?auto_23766 ?auto_23767 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23783 - SURFACE
      ?auto_23784 - SURFACE
    )
    :vars
    (
      ?auto_23797 - HOIST
      ?auto_23793 - PLACE
      ?auto_23786 - PLACE
      ?auto_23791 - HOIST
      ?auto_23794 - SURFACE
      ?auto_23795 - SURFACE
      ?auto_23787 - PLACE
      ?auto_23798 - HOIST
      ?auto_23799 - SURFACE
      ?auto_23796 - SURFACE
      ?auto_23790 - PLACE
      ?auto_23792 - HOIST
      ?auto_23789 - SURFACE
      ?auto_23788 - SURFACE
      ?auto_23785 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23797 ?auto_23793 ) ( IS-CRATE ?auto_23783 ) ( not ( = ?auto_23783 ?auto_23784 ) ) ( not ( = ?auto_23786 ?auto_23793 ) ) ( HOIST-AT ?auto_23791 ?auto_23786 ) ( not ( = ?auto_23797 ?auto_23791 ) ) ( AVAILABLE ?auto_23791 ) ( SURFACE-AT ?auto_23783 ?auto_23786 ) ( ON ?auto_23783 ?auto_23794 ) ( CLEAR ?auto_23783 ) ( not ( = ?auto_23783 ?auto_23794 ) ) ( not ( = ?auto_23784 ?auto_23794 ) ) ( IS-CRATE ?auto_23784 ) ( not ( = ?auto_23783 ?auto_23795 ) ) ( not ( = ?auto_23784 ?auto_23795 ) ) ( not ( = ?auto_23794 ?auto_23795 ) ) ( not ( = ?auto_23787 ?auto_23793 ) ) ( not ( = ?auto_23786 ?auto_23787 ) ) ( HOIST-AT ?auto_23798 ?auto_23787 ) ( not ( = ?auto_23797 ?auto_23798 ) ) ( not ( = ?auto_23791 ?auto_23798 ) ) ( AVAILABLE ?auto_23798 ) ( SURFACE-AT ?auto_23784 ?auto_23787 ) ( ON ?auto_23784 ?auto_23799 ) ( CLEAR ?auto_23784 ) ( not ( = ?auto_23783 ?auto_23799 ) ) ( not ( = ?auto_23784 ?auto_23799 ) ) ( not ( = ?auto_23794 ?auto_23799 ) ) ( not ( = ?auto_23795 ?auto_23799 ) ) ( IS-CRATE ?auto_23795 ) ( not ( = ?auto_23783 ?auto_23796 ) ) ( not ( = ?auto_23784 ?auto_23796 ) ) ( not ( = ?auto_23794 ?auto_23796 ) ) ( not ( = ?auto_23795 ?auto_23796 ) ) ( not ( = ?auto_23799 ?auto_23796 ) ) ( not ( = ?auto_23790 ?auto_23793 ) ) ( not ( = ?auto_23786 ?auto_23790 ) ) ( not ( = ?auto_23787 ?auto_23790 ) ) ( HOIST-AT ?auto_23792 ?auto_23790 ) ( not ( = ?auto_23797 ?auto_23792 ) ) ( not ( = ?auto_23791 ?auto_23792 ) ) ( not ( = ?auto_23798 ?auto_23792 ) ) ( AVAILABLE ?auto_23792 ) ( SURFACE-AT ?auto_23795 ?auto_23790 ) ( ON ?auto_23795 ?auto_23789 ) ( CLEAR ?auto_23795 ) ( not ( = ?auto_23783 ?auto_23789 ) ) ( not ( = ?auto_23784 ?auto_23789 ) ) ( not ( = ?auto_23794 ?auto_23789 ) ) ( not ( = ?auto_23795 ?auto_23789 ) ) ( not ( = ?auto_23799 ?auto_23789 ) ) ( not ( = ?auto_23796 ?auto_23789 ) ) ( SURFACE-AT ?auto_23788 ?auto_23793 ) ( CLEAR ?auto_23788 ) ( IS-CRATE ?auto_23796 ) ( not ( = ?auto_23783 ?auto_23788 ) ) ( not ( = ?auto_23784 ?auto_23788 ) ) ( not ( = ?auto_23794 ?auto_23788 ) ) ( not ( = ?auto_23795 ?auto_23788 ) ) ( not ( = ?auto_23799 ?auto_23788 ) ) ( not ( = ?auto_23796 ?auto_23788 ) ) ( not ( = ?auto_23789 ?auto_23788 ) ) ( AVAILABLE ?auto_23797 ) ( IN ?auto_23796 ?auto_23785 ) ( TRUCK-AT ?auto_23785 ?auto_23787 ) )
    :subtasks
    ( ( !DRIVE ?auto_23785 ?auto_23787 ?auto_23793 )
      ( MAKE-ON ?auto_23783 ?auto_23784 )
      ( MAKE-ON-VERIFY ?auto_23783 ?auto_23784 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23800 - SURFACE
      ?auto_23801 - SURFACE
    )
    :vars
    (
      ?auto_23812 - HOIST
      ?auto_23802 - PLACE
      ?auto_23816 - PLACE
      ?auto_23813 - HOIST
      ?auto_23810 - SURFACE
      ?auto_23815 - SURFACE
      ?auto_23814 - PLACE
      ?auto_23809 - HOIST
      ?auto_23808 - SURFACE
      ?auto_23805 - SURFACE
      ?auto_23804 - PLACE
      ?auto_23803 - HOIST
      ?auto_23806 - SURFACE
      ?auto_23811 - SURFACE
      ?auto_23807 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23812 ?auto_23802 ) ( IS-CRATE ?auto_23800 ) ( not ( = ?auto_23800 ?auto_23801 ) ) ( not ( = ?auto_23816 ?auto_23802 ) ) ( HOIST-AT ?auto_23813 ?auto_23816 ) ( not ( = ?auto_23812 ?auto_23813 ) ) ( AVAILABLE ?auto_23813 ) ( SURFACE-AT ?auto_23800 ?auto_23816 ) ( ON ?auto_23800 ?auto_23810 ) ( CLEAR ?auto_23800 ) ( not ( = ?auto_23800 ?auto_23810 ) ) ( not ( = ?auto_23801 ?auto_23810 ) ) ( IS-CRATE ?auto_23801 ) ( not ( = ?auto_23800 ?auto_23815 ) ) ( not ( = ?auto_23801 ?auto_23815 ) ) ( not ( = ?auto_23810 ?auto_23815 ) ) ( not ( = ?auto_23814 ?auto_23802 ) ) ( not ( = ?auto_23816 ?auto_23814 ) ) ( HOIST-AT ?auto_23809 ?auto_23814 ) ( not ( = ?auto_23812 ?auto_23809 ) ) ( not ( = ?auto_23813 ?auto_23809 ) ) ( SURFACE-AT ?auto_23801 ?auto_23814 ) ( ON ?auto_23801 ?auto_23808 ) ( CLEAR ?auto_23801 ) ( not ( = ?auto_23800 ?auto_23808 ) ) ( not ( = ?auto_23801 ?auto_23808 ) ) ( not ( = ?auto_23810 ?auto_23808 ) ) ( not ( = ?auto_23815 ?auto_23808 ) ) ( IS-CRATE ?auto_23815 ) ( not ( = ?auto_23800 ?auto_23805 ) ) ( not ( = ?auto_23801 ?auto_23805 ) ) ( not ( = ?auto_23810 ?auto_23805 ) ) ( not ( = ?auto_23815 ?auto_23805 ) ) ( not ( = ?auto_23808 ?auto_23805 ) ) ( not ( = ?auto_23804 ?auto_23802 ) ) ( not ( = ?auto_23816 ?auto_23804 ) ) ( not ( = ?auto_23814 ?auto_23804 ) ) ( HOIST-AT ?auto_23803 ?auto_23804 ) ( not ( = ?auto_23812 ?auto_23803 ) ) ( not ( = ?auto_23813 ?auto_23803 ) ) ( not ( = ?auto_23809 ?auto_23803 ) ) ( AVAILABLE ?auto_23803 ) ( SURFACE-AT ?auto_23815 ?auto_23804 ) ( ON ?auto_23815 ?auto_23806 ) ( CLEAR ?auto_23815 ) ( not ( = ?auto_23800 ?auto_23806 ) ) ( not ( = ?auto_23801 ?auto_23806 ) ) ( not ( = ?auto_23810 ?auto_23806 ) ) ( not ( = ?auto_23815 ?auto_23806 ) ) ( not ( = ?auto_23808 ?auto_23806 ) ) ( not ( = ?auto_23805 ?auto_23806 ) ) ( SURFACE-AT ?auto_23811 ?auto_23802 ) ( CLEAR ?auto_23811 ) ( IS-CRATE ?auto_23805 ) ( not ( = ?auto_23800 ?auto_23811 ) ) ( not ( = ?auto_23801 ?auto_23811 ) ) ( not ( = ?auto_23810 ?auto_23811 ) ) ( not ( = ?auto_23815 ?auto_23811 ) ) ( not ( = ?auto_23808 ?auto_23811 ) ) ( not ( = ?auto_23805 ?auto_23811 ) ) ( not ( = ?auto_23806 ?auto_23811 ) ) ( AVAILABLE ?auto_23812 ) ( TRUCK-AT ?auto_23807 ?auto_23814 ) ( LIFTING ?auto_23809 ?auto_23805 ) )
    :subtasks
    ( ( !LOAD ?auto_23809 ?auto_23805 ?auto_23807 ?auto_23814 )
      ( MAKE-ON ?auto_23800 ?auto_23801 )
      ( MAKE-ON-VERIFY ?auto_23800 ?auto_23801 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23817 - SURFACE
      ?auto_23818 - SURFACE
    )
    :vars
    (
      ?auto_23823 - HOIST
      ?auto_23825 - PLACE
      ?auto_23826 - PLACE
      ?auto_23821 - HOIST
      ?auto_23830 - SURFACE
      ?auto_23831 - SURFACE
      ?auto_23822 - PLACE
      ?auto_23820 - HOIST
      ?auto_23819 - SURFACE
      ?auto_23827 - SURFACE
      ?auto_23832 - PLACE
      ?auto_23833 - HOIST
      ?auto_23829 - SURFACE
      ?auto_23824 - SURFACE
      ?auto_23828 - TRUCK
      ?auto_23834 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23823 ?auto_23825 ) ( IS-CRATE ?auto_23817 ) ( not ( = ?auto_23817 ?auto_23818 ) ) ( not ( = ?auto_23826 ?auto_23825 ) ) ( HOIST-AT ?auto_23821 ?auto_23826 ) ( not ( = ?auto_23823 ?auto_23821 ) ) ( AVAILABLE ?auto_23821 ) ( SURFACE-AT ?auto_23817 ?auto_23826 ) ( ON ?auto_23817 ?auto_23830 ) ( CLEAR ?auto_23817 ) ( not ( = ?auto_23817 ?auto_23830 ) ) ( not ( = ?auto_23818 ?auto_23830 ) ) ( IS-CRATE ?auto_23818 ) ( not ( = ?auto_23817 ?auto_23831 ) ) ( not ( = ?auto_23818 ?auto_23831 ) ) ( not ( = ?auto_23830 ?auto_23831 ) ) ( not ( = ?auto_23822 ?auto_23825 ) ) ( not ( = ?auto_23826 ?auto_23822 ) ) ( HOIST-AT ?auto_23820 ?auto_23822 ) ( not ( = ?auto_23823 ?auto_23820 ) ) ( not ( = ?auto_23821 ?auto_23820 ) ) ( SURFACE-AT ?auto_23818 ?auto_23822 ) ( ON ?auto_23818 ?auto_23819 ) ( CLEAR ?auto_23818 ) ( not ( = ?auto_23817 ?auto_23819 ) ) ( not ( = ?auto_23818 ?auto_23819 ) ) ( not ( = ?auto_23830 ?auto_23819 ) ) ( not ( = ?auto_23831 ?auto_23819 ) ) ( IS-CRATE ?auto_23831 ) ( not ( = ?auto_23817 ?auto_23827 ) ) ( not ( = ?auto_23818 ?auto_23827 ) ) ( not ( = ?auto_23830 ?auto_23827 ) ) ( not ( = ?auto_23831 ?auto_23827 ) ) ( not ( = ?auto_23819 ?auto_23827 ) ) ( not ( = ?auto_23832 ?auto_23825 ) ) ( not ( = ?auto_23826 ?auto_23832 ) ) ( not ( = ?auto_23822 ?auto_23832 ) ) ( HOIST-AT ?auto_23833 ?auto_23832 ) ( not ( = ?auto_23823 ?auto_23833 ) ) ( not ( = ?auto_23821 ?auto_23833 ) ) ( not ( = ?auto_23820 ?auto_23833 ) ) ( AVAILABLE ?auto_23833 ) ( SURFACE-AT ?auto_23831 ?auto_23832 ) ( ON ?auto_23831 ?auto_23829 ) ( CLEAR ?auto_23831 ) ( not ( = ?auto_23817 ?auto_23829 ) ) ( not ( = ?auto_23818 ?auto_23829 ) ) ( not ( = ?auto_23830 ?auto_23829 ) ) ( not ( = ?auto_23831 ?auto_23829 ) ) ( not ( = ?auto_23819 ?auto_23829 ) ) ( not ( = ?auto_23827 ?auto_23829 ) ) ( SURFACE-AT ?auto_23824 ?auto_23825 ) ( CLEAR ?auto_23824 ) ( IS-CRATE ?auto_23827 ) ( not ( = ?auto_23817 ?auto_23824 ) ) ( not ( = ?auto_23818 ?auto_23824 ) ) ( not ( = ?auto_23830 ?auto_23824 ) ) ( not ( = ?auto_23831 ?auto_23824 ) ) ( not ( = ?auto_23819 ?auto_23824 ) ) ( not ( = ?auto_23827 ?auto_23824 ) ) ( not ( = ?auto_23829 ?auto_23824 ) ) ( AVAILABLE ?auto_23823 ) ( TRUCK-AT ?auto_23828 ?auto_23822 ) ( AVAILABLE ?auto_23820 ) ( SURFACE-AT ?auto_23827 ?auto_23822 ) ( ON ?auto_23827 ?auto_23834 ) ( CLEAR ?auto_23827 ) ( not ( = ?auto_23817 ?auto_23834 ) ) ( not ( = ?auto_23818 ?auto_23834 ) ) ( not ( = ?auto_23830 ?auto_23834 ) ) ( not ( = ?auto_23831 ?auto_23834 ) ) ( not ( = ?auto_23819 ?auto_23834 ) ) ( not ( = ?auto_23827 ?auto_23834 ) ) ( not ( = ?auto_23829 ?auto_23834 ) ) ( not ( = ?auto_23824 ?auto_23834 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23820 ?auto_23827 ?auto_23834 ?auto_23822 )
      ( MAKE-ON ?auto_23817 ?auto_23818 )
      ( MAKE-ON-VERIFY ?auto_23817 ?auto_23818 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23835 - SURFACE
      ?auto_23836 - SURFACE
    )
    :vars
    (
      ?auto_23844 - HOIST
      ?auto_23837 - PLACE
      ?auto_23852 - PLACE
      ?auto_23839 - HOIST
      ?auto_23846 - SURFACE
      ?auto_23847 - SURFACE
      ?auto_23845 - PLACE
      ?auto_23840 - HOIST
      ?auto_23841 - SURFACE
      ?auto_23843 - SURFACE
      ?auto_23851 - PLACE
      ?auto_23848 - HOIST
      ?auto_23849 - SURFACE
      ?auto_23842 - SURFACE
      ?auto_23838 - SURFACE
      ?auto_23850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23844 ?auto_23837 ) ( IS-CRATE ?auto_23835 ) ( not ( = ?auto_23835 ?auto_23836 ) ) ( not ( = ?auto_23852 ?auto_23837 ) ) ( HOIST-AT ?auto_23839 ?auto_23852 ) ( not ( = ?auto_23844 ?auto_23839 ) ) ( AVAILABLE ?auto_23839 ) ( SURFACE-AT ?auto_23835 ?auto_23852 ) ( ON ?auto_23835 ?auto_23846 ) ( CLEAR ?auto_23835 ) ( not ( = ?auto_23835 ?auto_23846 ) ) ( not ( = ?auto_23836 ?auto_23846 ) ) ( IS-CRATE ?auto_23836 ) ( not ( = ?auto_23835 ?auto_23847 ) ) ( not ( = ?auto_23836 ?auto_23847 ) ) ( not ( = ?auto_23846 ?auto_23847 ) ) ( not ( = ?auto_23845 ?auto_23837 ) ) ( not ( = ?auto_23852 ?auto_23845 ) ) ( HOIST-AT ?auto_23840 ?auto_23845 ) ( not ( = ?auto_23844 ?auto_23840 ) ) ( not ( = ?auto_23839 ?auto_23840 ) ) ( SURFACE-AT ?auto_23836 ?auto_23845 ) ( ON ?auto_23836 ?auto_23841 ) ( CLEAR ?auto_23836 ) ( not ( = ?auto_23835 ?auto_23841 ) ) ( not ( = ?auto_23836 ?auto_23841 ) ) ( not ( = ?auto_23846 ?auto_23841 ) ) ( not ( = ?auto_23847 ?auto_23841 ) ) ( IS-CRATE ?auto_23847 ) ( not ( = ?auto_23835 ?auto_23843 ) ) ( not ( = ?auto_23836 ?auto_23843 ) ) ( not ( = ?auto_23846 ?auto_23843 ) ) ( not ( = ?auto_23847 ?auto_23843 ) ) ( not ( = ?auto_23841 ?auto_23843 ) ) ( not ( = ?auto_23851 ?auto_23837 ) ) ( not ( = ?auto_23852 ?auto_23851 ) ) ( not ( = ?auto_23845 ?auto_23851 ) ) ( HOIST-AT ?auto_23848 ?auto_23851 ) ( not ( = ?auto_23844 ?auto_23848 ) ) ( not ( = ?auto_23839 ?auto_23848 ) ) ( not ( = ?auto_23840 ?auto_23848 ) ) ( AVAILABLE ?auto_23848 ) ( SURFACE-AT ?auto_23847 ?auto_23851 ) ( ON ?auto_23847 ?auto_23849 ) ( CLEAR ?auto_23847 ) ( not ( = ?auto_23835 ?auto_23849 ) ) ( not ( = ?auto_23836 ?auto_23849 ) ) ( not ( = ?auto_23846 ?auto_23849 ) ) ( not ( = ?auto_23847 ?auto_23849 ) ) ( not ( = ?auto_23841 ?auto_23849 ) ) ( not ( = ?auto_23843 ?auto_23849 ) ) ( SURFACE-AT ?auto_23842 ?auto_23837 ) ( CLEAR ?auto_23842 ) ( IS-CRATE ?auto_23843 ) ( not ( = ?auto_23835 ?auto_23842 ) ) ( not ( = ?auto_23836 ?auto_23842 ) ) ( not ( = ?auto_23846 ?auto_23842 ) ) ( not ( = ?auto_23847 ?auto_23842 ) ) ( not ( = ?auto_23841 ?auto_23842 ) ) ( not ( = ?auto_23843 ?auto_23842 ) ) ( not ( = ?auto_23849 ?auto_23842 ) ) ( AVAILABLE ?auto_23844 ) ( AVAILABLE ?auto_23840 ) ( SURFACE-AT ?auto_23843 ?auto_23845 ) ( ON ?auto_23843 ?auto_23838 ) ( CLEAR ?auto_23843 ) ( not ( = ?auto_23835 ?auto_23838 ) ) ( not ( = ?auto_23836 ?auto_23838 ) ) ( not ( = ?auto_23846 ?auto_23838 ) ) ( not ( = ?auto_23847 ?auto_23838 ) ) ( not ( = ?auto_23841 ?auto_23838 ) ) ( not ( = ?auto_23843 ?auto_23838 ) ) ( not ( = ?auto_23849 ?auto_23838 ) ) ( not ( = ?auto_23842 ?auto_23838 ) ) ( TRUCK-AT ?auto_23850 ?auto_23837 ) )
    :subtasks
    ( ( !DRIVE ?auto_23850 ?auto_23837 ?auto_23845 )
      ( MAKE-ON ?auto_23835 ?auto_23836 )
      ( MAKE-ON-VERIFY ?auto_23835 ?auto_23836 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23853 - SURFACE
      ?auto_23854 - SURFACE
    )
    :vars
    (
      ?auto_23861 - HOIST
      ?auto_23863 - PLACE
      ?auto_23858 - PLACE
      ?auto_23857 - HOIST
      ?auto_23859 - SURFACE
      ?auto_23855 - SURFACE
      ?auto_23867 - PLACE
      ?auto_23856 - HOIST
      ?auto_23866 - SURFACE
      ?auto_23860 - SURFACE
      ?auto_23868 - PLACE
      ?auto_23870 - HOIST
      ?auto_23862 - SURFACE
      ?auto_23869 - SURFACE
      ?auto_23865 - SURFACE
      ?auto_23864 - TRUCK
      ?auto_23871 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23861 ?auto_23863 ) ( IS-CRATE ?auto_23853 ) ( not ( = ?auto_23853 ?auto_23854 ) ) ( not ( = ?auto_23858 ?auto_23863 ) ) ( HOIST-AT ?auto_23857 ?auto_23858 ) ( not ( = ?auto_23861 ?auto_23857 ) ) ( AVAILABLE ?auto_23857 ) ( SURFACE-AT ?auto_23853 ?auto_23858 ) ( ON ?auto_23853 ?auto_23859 ) ( CLEAR ?auto_23853 ) ( not ( = ?auto_23853 ?auto_23859 ) ) ( not ( = ?auto_23854 ?auto_23859 ) ) ( IS-CRATE ?auto_23854 ) ( not ( = ?auto_23853 ?auto_23855 ) ) ( not ( = ?auto_23854 ?auto_23855 ) ) ( not ( = ?auto_23859 ?auto_23855 ) ) ( not ( = ?auto_23867 ?auto_23863 ) ) ( not ( = ?auto_23858 ?auto_23867 ) ) ( HOIST-AT ?auto_23856 ?auto_23867 ) ( not ( = ?auto_23861 ?auto_23856 ) ) ( not ( = ?auto_23857 ?auto_23856 ) ) ( SURFACE-AT ?auto_23854 ?auto_23867 ) ( ON ?auto_23854 ?auto_23866 ) ( CLEAR ?auto_23854 ) ( not ( = ?auto_23853 ?auto_23866 ) ) ( not ( = ?auto_23854 ?auto_23866 ) ) ( not ( = ?auto_23859 ?auto_23866 ) ) ( not ( = ?auto_23855 ?auto_23866 ) ) ( IS-CRATE ?auto_23855 ) ( not ( = ?auto_23853 ?auto_23860 ) ) ( not ( = ?auto_23854 ?auto_23860 ) ) ( not ( = ?auto_23859 ?auto_23860 ) ) ( not ( = ?auto_23855 ?auto_23860 ) ) ( not ( = ?auto_23866 ?auto_23860 ) ) ( not ( = ?auto_23868 ?auto_23863 ) ) ( not ( = ?auto_23858 ?auto_23868 ) ) ( not ( = ?auto_23867 ?auto_23868 ) ) ( HOIST-AT ?auto_23870 ?auto_23868 ) ( not ( = ?auto_23861 ?auto_23870 ) ) ( not ( = ?auto_23857 ?auto_23870 ) ) ( not ( = ?auto_23856 ?auto_23870 ) ) ( AVAILABLE ?auto_23870 ) ( SURFACE-AT ?auto_23855 ?auto_23868 ) ( ON ?auto_23855 ?auto_23862 ) ( CLEAR ?auto_23855 ) ( not ( = ?auto_23853 ?auto_23862 ) ) ( not ( = ?auto_23854 ?auto_23862 ) ) ( not ( = ?auto_23859 ?auto_23862 ) ) ( not ( = ?auto_23855 ?auto_23862 ) ) ( not ( = ?auto_23866 ?auto_23862 ) ) ( not ( = ?auto_23860 ?auto_23862 ) ) ( IS-CRATE ?auto_23860 ) ( not ( = ?auto_23853 ?auto_23869 ) ) ( not ( = ?auto_23854 ?auto_23869 ) ) ( not ( = ?auto_23859 ?auto_23869 ) ) ( not ( = ?auto_23855 ?auto_23869 ) ) ( not ( = ?auto_23866 ?auto_23869 ) ) ( not ( = ?auto_23860 ?auto_23869 ) ) ( not ( = ?auto_23862 ?auto_23869 ) ) ( AVAILABLE ?auto_23856 ) ( SURFACE-AT ?auto_23860 ?auto_23867 ) ( ON ?auto_23860 ?auto_23865 ) ( CLEAR ?auto_23860 ) ( not ( = ?auto_23853 ?auto_23865 ) ) ( not ( = ?auto_23854 ?auto_23865 ) ) ( not ( = ?auto_23859 ?auto_23865 ) ) ( not ( = ?auto_23855 ?auto_23865 ) ) ( not ( = ?auto_23866 ?auto_23865 ) ) ( not ( = ?auto_23860 ?auto_23865 ) ) ( not ( = ?auto_23862 ?auto_23865 ) ) ( not ( = ?auto_23869 ?auto_23865 ) ) ( TRUCK-AT ?auto_23864 ?auto_23863 ) ( SURFACE-AT ?auto_23871 ?auto_23863 ) ( CLEAR ?auto_23871 ) ( LIFTING ?auto_23861 ?auto_23869 ) ( IS-CRATE ?auto_23869 ) ( not ( = ?auto_23853 ?auto_23871 ) ) ( not ( = ?auto_23854 ?auto_23871 ) ) ( not ( = ?auto_23859 ?auto_23871 ) ) ( not ( = ?auto_23855 ?auto_23871 ) ) ( not ( = ?auto_23866 ?auto_23871 ) ) ( not ( = ?auto_23860 ?auto_23871 ) ) ( not ( = ?auto_23862 ?auto_23871 ) ) ( not ( = ?auto_23869 ?auto_23871 ) ) ( not ( = ?auto_23865 ?auto_23871 ) ) )
    :subtasks
    ( ( !DROP ?auto_23861 ?auto_23869 ?auto_23871 ?auto_23863 )
      ( MAKE-ON ?auto_23853 ?auto_23854 )
      ( MAKE-ON-VERIFY ?auto_23853 ?auto_23854 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23872 - SURFACE
      ?auto_23873 - SURFACE
    )
    :vars
    (
      ?auto_23876 - HOIST
      ?auto_23879 - PLACE
      ?auto_23885 - PLACE
      ?auto_23884 - HOIST
      ?auto_23886 - SURFACE
      ?auto_23880 - SURFACE
      ?auto_23878 - PLACE
      ?auto_23883 - HOIST
      ?auto_23882 - SURFACE
      ?auto_23887 - SURFACE
      ?auto_23889 - PLACE
      ?auto_23877 - HOIST
      ?auto_23890 - SURFACE
      ?auto_23874 - SURFACE
      ?auto_23888 - SURFACE
      ?auto_23875 - TRUCK
      ?auto_23881 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23876 ?auto_23879 ) ( IS-CRATE ?auto_23872 ) ( not ( = ?auto_23872 ?auto_23873 ) ) ( not ( = ?auto_23885 ?auto_23879 ) ) ( HOIST-AT ?auto_23884 ?auto_23885 ) ( not ( = ?auto_23876 ?auto_23884 ) ) ( AVAILABLE ?auto_23884 ) ( SURFACE-AT ?auto_23872 ?auto_23885 ) ( ON ?auto_23872 ?auto_23886 ) ( CLEAR ?auto_23872 ) ( not ( = ?auto_23872 ?auto_23886 ) ) ( not ( = ?auto_23873 ?auto_23886 ) ) ( IS-CRATE ?auto_23873 ) ( not ( = ?auto_23872 ?auto_23880 ) ) ( not ( = ?auto_23873 ?auto_23880 ) ) ( not ( = ?auto_23886 ?auto_23880 ) ) ( not ( = ?auto_23878 ?auto_23879 ) ) ( not ( = ?auto_23885 ?auto_23878 ) ) ( HOIST-AT ?auto_23883 ?auto_23878 ) ( not ( = ?auto_23876 ?auto_23883 ) ) ( not ( = ?auto_23884 ?auto_23883 ) ) ( SURFACE-AT ?auto_23873 ?auto_23878 ) ( ON ?auto_23873 ?auto_23882 ) ( CLEAR ?auto_23873 ) ( not ( = ?auto_23872 ?auto_23882 ) ) ( not ( = ?auto_23873 ?auto_23882 ) ) ( not ( = ?auto_23886 ?auto_23882 ) ) ( not ( = ?auto_23880 ?auto_23882 ) ) ( IS-CRATE ?auto_23880 ) ( not ( = ?auto_23872 ?auto_23887 ) ) ( not ( = ?auto_23873 ?auto_23887 ) ) ( not ( = ?auto_23886 ?auto_23887 ) ) ( not ( = ?auto_23880 ?auto_23887 ) ) ( not ( = ?auto_23882 ?auto_23887 ) ) ( not ( = ?auto_23889 ?auto_23879 ) ) ( not ( = ?auto_23885 ?auto_23889 ) ) ( not ( = ?auto_23878 ?auto_23889 ) ) ( HOIST-AT ?auto_23877 ?auto_23889 ) ( not ( = ?auto_23876 ?auto_23877 ) ) ( not ( = ?auto_23884 ?auto_23877 ) ) ( not ( = ?auto_23883 ?auto_23877 ) ) ( AVAILABLE ?auto_23877 ) ( SURFACE-AT ?auto_23880 ?auto_23889 ) ( ON ?auto_23880 ?auto_23890 ) ( CLEAR ?auto_23880 ) ( not ( = ?auto_23872 ?auto_23890 ) ) ( not ( = ?auto_23873 ?auto_23890 ) ) ( not ( = ?auto_23886 ?auto_23890 ) ) ( not ( = ?auto_23880 ?auto_23890 ) ) ( not ( = ?auto_23882 ?auto_23890 ) ) ( not ( = ?auto_23887 ?auto_23890 ) ) ( IS-CRATE ?auto_23887 ) ( not ( = ?auto_23872 ?auto_23874 ) ) ( not ( = ?auto_23873 ?auto_23874 ) ) ( not ( = ?auto_23886 ?auto_23874 ) ) ( not ( = ?auto_23880 ?auto_23874 ) ) ( not ( = ?auto_23882 ?auto_23874 ) ) ( not ( = ?auto_23887 ?auto_23874 ) ) ( not ( = ?auto_23890 ?auto_23874 ) ) ( AVAILABLE ?auto_23883 ) ( SURFACE-AT ?auto_23887 ?auto_23878 ) ( ON ?auto_23887 ?auto_23888 ) ( CLEAR ?auto_23887 ) ( not ( = ?auto_23872 ?auto_23888 ) ) ( not ( = ?auto_23873 ?auto_23888 ) ) ( not ( = ?auto_23886 ?auto_23888 ) ) ( not ( = ?auto_23880 ?auto_23888 ) ) ( not ( = ?auto_23882 ?auto_23888 ) ) ( not ( = ?auto_23887 ?auto_23888 ) ) ( not ( = ?auto_23890 ?auto_23888 ) ) ( not ( = ?auto_23874 ?auto_23888 ) ) ( TRUCK-AT ?auto_23875 ?auto_23879 ) ( SURFACE-AT ?auto_23881 ?auto_23879 ) ( CLEAR ?auto_23881 ) ( IS-CRATE ?auto_23874 ) ( not ( = ?auto_23872 ?auto_23881 ) ) ( not ( = ?auto_23873 ?auto_23881 ) ) ( not ( = ?auto_23886 ?auto_23881 ) ) ( not ( = ?auto_23880 ?auto_23881 ) ) ( not ( = ?auto_23882 ?auto_23881 ) ) ( not ( = ?auto_23887 ?auto_23881 ) ) ( not ( = ?auto_23890 ?auto_23881 ) ) ( not ( = ?auto_23874 ?auto_23881 ) ) ( not ( = ?auto_23888 ?auto_23881 ) ) ( AVAILABLE ?auto_23876 ) ( IN ?auto_23874 ?auto_23875 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23876 ?auto_23874 ?auto_23875 ?auto_23879 )
      ( MAKE-ON ?auto_23872 ?auto_23873 )
      ( MAKE-ON-VERIFY ?auto_23872 ?auto_23873 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23891 - SURFACE
      ?auto_23892 - SURFACE
    )
    :vars
    (
      ?auto_23906 - HOIST
      ?auto_23899 - PLACE
      ?auto_23897 - PLACE
      ?auto_23905 - HOIST
      ?auto_23900 - SURFACE
      ?auto_23898 - SURFACE
      ?auto_23895 - PLACE
      ?auto_23907 - HOIST
      ?auto_23896 - SURFACE
      ?auto_23893 - SURFACE
      ?auto_23901 - PLACE
      ?auto_23908 - HOIST
      ?auto_23902 - SURFACE
      ?auto_23903 - SURFACE
      ?auto_23904 - SURFACE
      ?auto_23909 - SURFACE
      ?auto_23894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23906 ?auto_23899 ) ( IS-CRATE ?auto_23891 ) ( not ( = ?auto_23891 ?auto_23892 ) ) ( not ( = ?auto_23897 ?auto_23899 ) ) ( HOIST-AT ?auto_23905 ?auto_23897 ) ( not ( = ?auto_23906 ?auto_23905 ) ) ( AVAILABLE ?auto_23905 ) ( SURFACE-AT ?auto_23891 ?auto_23897 ) ( ON ?auto_23891 ?auto_23900 ) ( CLEAR ?auto_23891 ) ( not ( = ?auto_23891 ?auto_23900 ) ) ( not ( = ?auto_23892 ?auto_23900 ) ) ( IS-CRATE ?auto_23892 ) ( not ( = ?auto_23891 ?auto_23898 ) ) ( not ( = ?auto_23892 ?auto_23898 ) ) ( not ( = ?auto_23900 ?auto_23898 ) ) ( not ( = ?auto_23895 ?auto_23899 ) ) ( not ( = ?auto_23897 ?auto_23895 ) ) ( HOIST-AT ?auto_23907 ?auto_23895 ) ( not ( = ?auto_23906 ?auto_23907 ) ) ( not ( = ?auto_23905 ?auto_23907 ) ) ( SURFACE-AT ?auto_23892 ?auto_23895 ) ( ON ?auto_23892 ?auto_23896 ) ( CLEAR ?auto_23892 ) ( not ( = ?auto_23891 ?auto_23896 ) ) ( not ( = ?auto_23892 ?auto_23896 ) ) ( not ( = ?auto_23900 ?auto_23896 ) ) ( not ( = ?auto_23898 ?auto_23896 ) ) ( IS-CRATE ?auto_23898 ) ( not ( = ?auto_23891 ?auto_23893 ) ) ( not ( = ?auto_23892 ?auto_23893 ) ) ( not ( = ?auto_23900 ?auto_23893 ) ) ( not ( = ?auto_23898 ?auto_23893 ) ) ( not ( = ?auto_23896 ?auto_23893 ) ) ( not ( = ?auto_23901 ?auto_23899 ) ) ( not ( = ?auto_23897 ?auto_23901 ) ) ( not ( = ?auto_23895 ?auto_23901 ) ) ( HOIST-AT ?auto_23908 ?auto_23901 ) ( not ( = ?auto_23906 ?auto_23908 ) ) ( not ( = ?auto_23905 ?auto_23908 ) ) ( not ( = ?auto_23907 ?auto_23908 ) ) ( AVAILABLE ?auto_23908 ) ( SURFACE-AT ?auto_23898 ?auto_23901 ) ( ON ?auto_23898 ?auto_23902 ) ( CLEAR ?auto_23898 ) ( not ( = ?auto_23891 ?auto_23902 ) ) ( not ( = ?auto_23892 ?auto_23902 ) ) ( not ( = ?auto_23900 ?auto_23902 ) ) ( not ( = ?auto_23898 ?auto_23902 ) ) ( not ( = ?auto_23896 ?auto_23902 ) ) ( not ( = ?auto_23893 ?auto_23902 ) ) ( IS-CRATE ?auto_23893 ) ( not ( = ?auto_23891 ?auto_23903 ) ) ( not ( = ?auto_23892 ?auto_23903 ) ) ( not ( = ?auto_23900 ?auto_23903 ) ) ( not ( = ?auto_23898 ?auto_23903 ) ) ( not ( = ?auto_23896 ?auto_23903 ) ) ( not ( = ?auto_23893 ?auto_23903 ) ) ( not ( = ?auto_23902 ?auto_23903 ) ) ( AVAILABLE ?auto_23907 ) ( SURFACE-AT ?auto_23893 ?auto_23895 ) ( ON ?auto_23893 ?auto_23904 ) ( CLEAR ?auto_23893 ) ( not ( = ?auto_23891 ?auto_23904 ) ) ( not ( = ?auto_23892 ?auto_23904 ) ) ( not ( = ?auto_23900 ?auto_23904 ) ) ( not ( = ?auto_23898 ?auto_23904 ) ) ( not ( = ?auto_23896 ?auto_23904 ) ) ( not ( = ?auto_23893 ?auto_23904 ) ) ( not ( = ?auto_23902 ?auto_23904 ) ) ( not ( = ?auto_23903 ?auto_23904 ) ) ( SURFACE-AT ?auto_23909 ?auto_23899 ) ( CLEAR ?auto_23909 ) ( IS-CRATE ?auto_23903 ) ( not ( = ?auto_23891 ?auto_23909 ) ) ( not ( = ?auto_23892 ?auto_23909 ) ) ( not ( = ?auto_23900 ?auto_23909 ) ) ( not ( = ?auto_23898 ?auto_23909 ) ) ( not ( = ?auto_23896 ?auto_23909 ) ) ( not ( = ?auto_23893 ?auto_23909 ) ) ( not ( = ?auto_23902 ?auto_23909 ) ) ( not ( = ?auto_23903 ?auto_23909 ) ) ( not ( = ?auto_23904 ?auto_23909 ) ) ( AVAILABLE ?auto_23906 ) ( IN ?auto_23903 ?auto_23894 ) ( TRUCK-AT ?auto_23894 ?auto_23895 ) )
    :subtasks
    ( ( !DRIVE ?auto_23894 ?auto_23895 ?auto_23899 )
      ( MAKE-ON ?auto_23891 ?auto_23892 )
      ( MAKE-ON-VERIFY ?auto_23891 ?auto_23892 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23910 - SURFACE
      ?auto_23911 - SURFACE
    )
    :vars
    (
      ?auto_23920 - HOIST
      ?auto_23917 - PLACE
      ?auto_23914 - PLACE
      ?auto_23926 - HOIST
      ?auto_23912 - SURFACE
      ?auto_23928 - SURFACE
      ?auto_23919 - PLACE
      ?auto_23913 - HOIST
      ?auto_23927 - SURFACE
      ?auto_23924 - SURFACE
      ?auto_23918 - PLACE
      ?auto_23915 - HOIST
      ?auto_23925 - SURFACE
      ?auto_23921 - SURFACE
      ?auto_23923 - SURFACE
      ?auto_23916 - SURFACE
      ?auto_23922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23920 ?auto_23917 ) ( IS-CRATE ?auto_23910 ) ( not ( = ?auto_23910 ?auto_23911 ) ) ( not ( = ?auto_23914 ?auto_23917 ) ) ( HOIST-AT ?auto_23926 ?auto_23914 ) ( not ( = ?auto_23920 ?auto_23926 ) ) ( AVAILABLE ?auto_23926 ) ( SURFACE-AT ?auto_23910 ?auto_23914 ) ( ON ?auto_23910 ?auto_23912 ) ( CLEAR ?auto_23910 ) ( not ( = ?auto_23910 ?auto_23912 ) ) ( not ( = ?auto_23911 ?auto_23912 ) ) ( IS-CRATE ?auto_23911 ) ( not ( = ?auto_23910 ?auto_23928 ) ) ( not ( = ?auto_23911 ?auto_23928 ) ) ( not ( = ?auto_23912 ?auto_23928 ) ) ( not ( = ?auto_23919 ?auto_23917 ) ) ( not ( = ?auto_23914 ?auto_23919 ) ) ( HOIST-AT ?auto_23913 ?auto_23919 ) ( not ( = ?auto_23920 ?auto_23913 ) ) ( not ( = ?auto_23926 ?auto_23913 ) ) ( SURFACE-AT ?auto_23911 ?auto_23919 ) ( ON ?auto_23911 ?auto_23927 ) ( CLEAR ?auto_23911 ) ( not ( = ?auto_23910 ?auto_23927 ) ) ( not ( = ?auto_23911 ?auto_23927 ) ) ( not ( = ?auto_23912 ?auto_23927 ) ) ( not ( = ?auto_23928 ?auto_23927 ) ) ( IS-CRATE ?auto_23928 ) ( not ( = ?auto_23910 ?auto_23924 ) ) ( not ( = ?auto_23911 ?auto_23924 ) ) ( not ( = ?auto_23912 ?auto_23924 ) ) ( not ( = ?auto_23928 ?auto_23924 ) ) ( not ( = ?auto_23927 ?auto_23924 ) ) ( not ( = ?auto_23918 ?auto_23917 ) ) ( not ( = ?auto_23914 ?auto_23918 ) ) ( not ( = ?auto_23919 ?auto_23918 ) ) ( HOIST-AT ?auto_23915 ?auto_23918 ) ( not ( = ?auto_23920 ?auto_23915 ) ) ( not ( = ?auto_23926 ?auto_23915 ) ) ( not ( = ?auto_23913 ?auto_23915 ) ) ( AVAILABLE ?auto_23915 ) ( SURFACE-AT ?auto_23928 ?auto_23918 ) ( ON ?auto_23928 ?auto_23925 ) ( CLEAR ?auto_23928 ) ( not ( = ?auto_23910 ?auto_23925 ) ) ( not ( = ?auto_23911 ?auto_23925 ) ) ( not ( = ?auto_23912 ?auto_23925 ) ) ( not ( = ?auto_23928 ?auto_23925 ) ) ( not ( = ?auto_23927 ?auto_23925 ) ) ( not ( = ?auto_23924 ?auto_23925 ) ) ( IS-CRATE ?auto_23924 ) ( not ( = ?auto_23910 ?auto_23921 ) ) ( not ( = ?auto_23911 ?auto_23921 ) ) ( not ( = ?auto_23912 ?auto_23921 ) ) ( not ( = ?auto_23928 ?auto_23921 ) ) ( not ( = ?auto_23927 ?auto_23921 ) ) ( not ( = ?auto_23924 ?auto_23921 ) ) ( not ( = ?auto_23925 ?auto_23921 ) ) ( SURFACE-AT ?auto_23924 ?auto_23919 ) ( ON ?auto_23924 ?auto_23923 ) ( CLEAR ?auto_23924 ) ( not ( = ?auto_23910 ?auto_23923 ) ) ( not ( = ?auto_23911 ?auto_23923 ) ) ( not ( = ?auto_23912 ?auto_23923 ) ) ( not ( = ?auto_23928 ?auto_23923 ) ) ( not ( = ?auto_23927 ?auto_23923 ) ) ( not ( = ?auto_23924 ?auto_23923 ) ) ( not ( = ?auto_23925 ?auto_23923 ) ) ( not ( = ?auto_23921 ?auto_23923 ) ) ( SURFACE-AT ?auto_23916 ?auto_23917 ) ( CLEAR ?auto_23916 ) ( IS-CRATE ?auto_23921 ) ( not ( = ?auto_23910 ?auto_23916 ) ) ( not ( = ?auto_23911 ?auto_23916 ) ) ( not ( = ?auto_23912 ?auto_23916 ) ) ( not ( = ?auto_23928 ?auto_23916 ) ) ( not ( = ?auto_23927 ?auto_23916 ) ) ( not ( = ?auto_23924 ?auto_23916 ) ) ( not ( = ?auto_23925 ?auto_23916 ) ) ( not ( = ?auto_23921 ?auto_23916 ) ) ( not ( = ?auto_23923 ?auto_23916 ) ) ( AVAILABLE ?auto_23920 ) ( TRUCK-AT ?auto_23922 ?auto_23919 ) ( LIFTING ?auto_23913 ?auto_23921 ) )
    :subtasks
    ( ( !LOAD ?auto_23913 ?auto_23921 ?auto_23922 ?auto_23919 )
      ( MAKE-ON ?auto_23910 ?auto_23911 )
      ( MAKE-ON-VERIFY ?auto_23910 ?auto_23911 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23929 - SURFACE
      ?auto_23930 - SURFACE
    )
    :vars
    (
      ?auto_23940 - HOIST
      ?auto_23932 - PLACE
      ?auto_23938 - PLACE
      ?auto_23946 - HOIST
      ?auto_23942 - SURFACE
      ?auto_23941 - SURFACE
      ?auto_23947 - PLACE
      ?auto_23931 - HOIST
      ?auto_23945 - SURFACE
      ?auto_23935 - SURFACE
      ?auto_23939 - PLACE
      ?auto_23934 - HOIST
      ?auto_23936 - SURFACE
      ?auto_23937 - SURFACE
      ?auto_23933 - SURFACE
      ?auto_23944 - SURFACE
      ?auto_23943 - TRUCK
      ?auto_23948 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23940 ?auto_23932 ) ( IS-CRATE ?auto_23929 ) ( not ( = ?auto_23929 ?auto_23930 ) ) ( not ( = ?auto_23938 ?auto_23932 ) ) ( HOIST-AT ?auto_23946 ?auto_23938 ) ( not ( = ?auto_23940 ?auto_23946 ) ) ( AVAILABLE ?auto_23946 ) ( SURFACE-AT ?auto_23929 ?auto_23938 ) ( ON ?auto_23929 ?auto_23942 ) ( CLEAR ?auto_23929 ) ( not ( = ?auto_23929 ?auto_23942 ) ) ( not ( = ?auto_23930 ?auto_23942 ) ) ( IS-CRATE ?auto_23930 ) ( not ( = ?auto_23929 ?auto_23941 ) ) ( not ( = ?auto_23930 ?auto_23941 ) ) ( not ( = ?auto_23942 ?auto_23941 ) ) ( not ( = ?auto_23947 ?auto_23932 ) ) ( not ( = ?auto_23938 ?auto_23947 ) ) ( HOIST-AT ?auto_23931 ?auto_23947 ) ( not ( = ?auto_23940 ?auto_23931 ) ) ( not ( = ?auto_23946 ?auto_23931 ) ) ( SURFACE-AT ?auto_23930 ?auto_23947 ) ( ON ?auto_23930 ?auto_23945 ) ( CLEAR ?auto_23930 ) ( not ( = ?auto_23929 ?auto_23945 ) ) ( not ( = ?auto_23930 ?auto_23945 ) ) ( not ( = ?auto_23942 ?auto_23945 ) ) ( not ( = ?auto_23941 ?auto_23945 ) ) ( IS-CRATE ?auto_23941 ) ( not ( = ?auto_23929 ?auto_23935 ) ) ( not ( = ?auto_23930 ?auto_23935 ) ) ( not ( = ?auto_23942 ?auto_23935 ) ) ( not ( = ?auto_23941 ?auto_23935 ) ) ( not ( = ?auto_23945 ?auto_23935 ) ) ( not ( = ?auto_23939 ?auto_23932 ) ) ( not ( = ?auto_23938 ?auto_23939 ) ) ( not ( = ?auto_23947 ?auto_23939 ) ) ( HOIST-AT ?auto_23934 ?auto_23939 ) ( not ( = ?auto_23940 ?auto_23934 ) ) ( not ( = ?auto_23946 ?auto_23934 ) ) ( not ( = ?auto_23931 ?auto_23934 ) ) ( AVAILABLE ?auto_23934 ) ( SURFACE-AT ?auto_23941 ?auto_23939 ) ( ON ?auto_23941 ?auto_23936 ) ( CLEAR ?auto_23941 ) ( not ( = ?auto_23929 ?auto_23936 ) ) ( not ( = ?auto_23930 ?auto_23936 ) ) ( not ( = ?auto_23942 ?auto_23936 ) ) ( not ( = ?auto_23941 ?auto_23936 ) ) ( not ( = ?auto_23945 ?auto_23936 ) ) ( not ( = ?auto_23935 ?auto_23936 ) ) ( IS-CRATE ?auto_23935 ) ( not ( = ?auto_23929 ?auto_23937 ) ) ( not ( = ?auto_23930 ?auto_23937 ) ) ( not ( = ?auto_23942 ?auto_23937 ) ) ( not ( = ?auto_23941 ?auto_23937 ) ) ( not ( = ?auto_23945 ?auto_23937 ) ) ( not ( = ?auto_23935 ?auto_23937 ) ) ( not ( = ?auto_23936 ?auto_23937 ) ) ( SURFACE-AT ?auto_23935 ?auto_23947 ) ( ON ?auto_23935 ?auto_23933 ) ( CLEAR ?auto_23935 ) ( not ( = ?auto_23929 ?auto_23933 ) ) ( not ( = ?auto_23930 ?auto_23933 ) ) ( not ( = ?auto_23942 ?auto_23933 ) ) ( not ( = ?auto_23941 ?auto_23933 ) ) ( not ( = ?auto_23945 ?auto_23933 ) ) ( not ( = ?auto_23935 ?auto_23933 ) ) ( not ( = ?auto_23936 ?auto_23933 ) ) ( not ( = ?auto_23937 ?auto_23933 ) ) ( SURFACE-AT ?auto_23944 ?auto_23932 ) ( CLEAR ?auto_23944 ) ( IS-CRATE ?auto_23937 ) ( not ( = ?auto_23929 ?auto_23944 ) ) ( not ( = ?auto_23930 ?auto_23944 ) ) ( not ( = ?auto_23942 ?auto_23944 ) ) ( not ( = ?auto_23941 ?auto_23944 ) ) ( not ( = ?auto_23945 ?auto_23944 ) ) ( not ( = ?auto_23935 ?auto_23944 ) ) ( not ( = ?auto_23936 ?auto_23944 ) ) ( not ( = ?auto_23937 ?auto_23944 ) ) ( not ( = ?auto_23933 ?auto_23944 ) ) ( AVAILABLE ?auto_23940 ) ( TRUCK-AT ?auto_23943 ?auto_23947 ) ( AVAILABLE ?auto_23931 ) ( SURFACE-AT ?auto_23937 ?auto_23947 ) ( ON ?auto_23937 ?auto_23948 ) ( CLEAR ?auto_23937 ) ( not ( = ?auto_23929 ?auto_23948 ) ) ( not ( = ?auto_23930 ?auto_23948 ) ) ( not ( = ?auto_23942 ?auto_23948 ) ) ( not ( = ?auto_23941 ?auto_23948 ) ) ( not ( = ?auto_23945 ?auto_23948 ) ) ( not ( = ?auto_23935 ?auto_23948 ) ) ( not ( = ?auto_23936 ?auto_23948 ) ) ( not ( = ?auto_23937 ?auto_23948 ) ) ( not ( = ?auto_23933 ?auto_23948 ) ) ( not ( = ?auto_23944 ?auto_23948 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23931 ?auto_23937 ?auto_23948 ?auto_23947 )
      ( MAKE-ON ?auto_23929 ?auto_23930 )
      ( MAKE-ON-VERIFY ?auto_23929 ?auto_23930 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23949 - SURFACE
      ?auto_23950 - SURFACE
    )
    :vars
    (
      ?auto_23965 - HOIST
      ?auto_23967 - PLACE
      ?auto_23963 - PLACE
      ?auto_23952 - HOIST
      ?auto_23962 - SURFACE
      ?auto_23959 - SURFACE
      ?auto_23956 - PLACE
      ?auto_23954 - HOIST
      ?auto_23964 - SURFACE
      ?auto_23961 - SURFACE
      ?auto_23953 - PLACE
      ?auto_23957 - HOIST
      ?auto_23966 - SURFACE
      ?auto_23960 - SURFACE
      ?auto_23968 - SURFACE
      ?auto_23958 - SURFACE
      ?auto_23955 - SURFACE
      ?auto_23951 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23965 ?auto_23967 ) ( IS-CRATE ?auto_23949 ) ( not ( = ?auto_23949 ?auto_23950 ) ) ( not ( = ?auto_23963 ?auto_23967 ) ) ( HOIST-AT ?auto_23952 ?auto_23963 ) ( not ( = ?auto_23965 ?auto_23952 ) ) ( AVAILABLE ?auto_23952 ) ( SURFACE-AT ?auto_23949 ?auto_23963 ) ( ON ?auto_23949 ?auto_23962 ) ( CLEAR ?auto_23949 ) ( not ( = ?auto_23949 ?auto_23962 ) ) ( not ( = ?auto_23950 ?auto_23962 ) ) ( IS-CRATE ?auto_23950 ) ( not ( = ?auto_23949 ?auto_23959 ) ) ( not ( = ?auto_23950 ?auto_23959 ) ) ( not ( = ?auto_23962 ?auto_23959 ) ) ( not ( = ?auto_23956 ?auto_23967 ) ) ( not ( = ?auto_23963 ?auto_23956 ) ) ( HOIST-AT ?auto_23954 ?auto_23956 ) ( not ( = ?auto_23965 ?auto_23954 ) ) ( not ( = ?auto_23952 ?auto_23954 ) ) ( SURFACE-AT ?auto_23950 ?auto_23956 ) ( ON ?auto_23950 ?auto_23964 ) ( CLEAR ?auto_23950 ) ( not ( = ?auto_23949 ?auto_23964 ) ) ( not ( = ?auto_23950 ?auto_23964 ) ) ( not ( = ?auto_23962 ?auto_23964 ) ) ( not ( = ?auto_23959 ?auto_23964 ) ) ( IS-CRATE ?auto_23959 ) ( not ( = ?auto_23949 ?auto_23961 ) ) ( not ( = ?auto_23950 ?auto_23961 ) ) ( not ( = ?auto_23962 ?auto_23961 ) ) ( not ( = ?auto_23959 ?auto_23961 ) ) ( not ( = ?auto_23964 ?auto_23961 ) ) ( not ( = ?auto_23953 ?auto_23967 ) ) ( not ( = ?auto_23963 ?auto_23953 ) ) ( not ( = ?auto_23956 ?auto_23953 ) ) ( HOIST-AT ?auto_23957 ?auto_23953 ) ( not ( = ?auto_23965 ?auto_23957 ) ) ( not ( = ?auto_23952 ?auto_23957 ) ) ( not ( = ?auto_23954 ?auto_23957 ) ) ( AVAILABLE ?auto_23957 ) ( SURFACE-AT ?auto_23959 ?auto_23953 ) ( ON ?auto_23959 ?auto_23966 ) ( CLEAR ?auto_23959 ) ( not ( = ?auto_23949 ?auto_23966 ) ) ( not ( = ?auto_23950 ?auto_23966 ) ) ( not ( = ?auto_23962 ?auto_23966 ) ) ( not ( = ?auto_23959 ?auto_23966 ) ) ( not ( = ?auto_23964 ?auto_23966 ) ) ( not ( = ?auto_23961 ?auto_23966 ) ) ( IS-CRATE ?auto_23961 ) ( not ( = ?auto_23949 ?auto_23960 ) ) ( not ( = ?auto_23950 ?auto_23960 ) ) ( not ( = ?auto_23962 ?auto_23960 ) ) ( not ( = ?auto_23959 ?auto_23960 ) ) ( not ( = ?auto_23964 ?auto_23960 ) ) ( not ( = ?auto_23961 ?auto_23960 ) ) ( not ( = ?auto_23966 ?auto_23960 ) ) ( SURFACE-AT ?auto_23961 ?auto_23956 ) ( ON ?auto_23961 ?auto_23968 ) ( CLEAR ?auto_23961 ) ( not ( = ?auto_23949 ?auto_23968 ) ) ( not ( = ?auto_23950 ?auto_23968 ) ) ( not ( = ?auto_23962 ?auto_23968 ) ) ( not ( = ?auto_23959 ?auto_23968 ) ) ( not ( = ?auto_23964 ?auto_23968 ) ) ( not ( = ?auto_23961 ?auto_23968 ) ) ( not ( = ?auto_23966 ?auto_23968 ) ) ( not ( = ?auto_23960 ?auto_23968 ) ) ( SURFACE-AT ?auto_23958 ?auto_23967 ) ( CLEAR ?auto_23958 ) ( IS-CRATE ?auto_23960 ) ( not ( = ?auto_23949 ?auto_23958 ) ) ( not ( = ?auto_23950 ?auto_23958 ) ) ( not ( = ?auto_23962 ?auto_23958 ) ) ( not ( = ?auto_23959 ?auto_23958 ) ) ( not ( = ?auto_23964 ?auto_23958 ) ) ( not ( = ?auto_23961 ?auto_23958 ) ) ( not ( = ?auto_23966 ?auto_23958 ) ) ( not ( = ?auto_23960 ?auto_23958 ) ) ( not ( = ?auto_23968 ?auto_23958 ) ) ( AVAILABLE ?auto_23965 ) ( AVAILABLE ?auto_23954 ) ( SURFACE-AT ?auto_23960 ?auto_23956 ) ( ON ?auto_23960 ?auto_23955 ) ( CLEAR ?auto_23960 ) ( not ( = ?auto_23949 ?auto_23955 ) ) ( not ( = ?auto_23950 ?auto_23955 ) ) ( not ( = ?auto_23962 ?auto_23955 ) ) ( not ( = ?auto_23959 ?auto_23955 ) ) ( not ( = ?auto_23964 ?auto_23955 ) ) ( not ( = ?auto_23961 ?auto_23955 ) ) ( not ( = ?auto_23966 ?auto_23955 ) ) ( not ( = ?auto_23960 ?auto_23955 ) ) ( not ( = ?auto_23968 ?auto_23955 ) ) ( not ( = ?auto_23958 ?auto_23955 ) ) ( TRUCK-AT ?auto_23951 ?auto_23967 ) )
    :subtasks
    ( ( !DRIVE ?auto_23951 ?auto_23967 ?auto_23956 )
      ( MAKE-ON ?auto_23949 ?auto_23950 )
      ( MAKE-ON-VERIFY ?auto_23949 ?auto_23950 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23971 - SURFACE
      ?auto_23972 - SURFACE
    )
    :vars
    (
      ?auto_23973 - HOIST
      ?auto_23974 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23973 ?auto_23974 ) ( SURFACE-AT ?auto_23972 ?auto_23974 ) ( CLEAR ?auto_23972 ) ( LIFTING ?auto_23973 ?auto_23971 ) ( IS-CRATE ?auto_23971 ) ( not ( = ?auto_23971 ?auto_23972 ) ) )
    :subtasks
    ( ( !DROP ?auto_23973 ?auto_23971 ?auto_23972 ?auto_23974 )
      ( MAKE-ON-VERIFY ?auto_23971 ?auto_23972 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23975 - SURFACE
      ?auto_23976 - SURFACE
    )
    :vars
    (
      ?auto_23977 - HOIST
      ?auto_23978 - PLACE
      ?auto_23979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23977 ?auto_23978 ) ( SURFACE-AT ?auto_23976 ?auto_23978 ) ( CLEAR ?auto_23976 ) ( IS-CRATE ?auto_23975 ) ( not ( = ?auto_23975 ?auto_23976 ) ) ( TRUCK-AT ?auto_23979 ?auto_23978 ) ( AVAILABLE ?auto_23977 ) ( IN ?auto_23975 ?auto_23979 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23977 ?auto_23975 ?auto_23979 ?auto_23978 )
      ( MAKE-ON ?auto_23975 ?auto_23976 )
      ( MAKE-ON-VERIFY ?auto_23975 ?auto_23976 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23980 - SURFACE
      ?auto_23981 - SURFACE
    )
    :vars
    (
      ?auto_23984 - HOIST
      ?auto_23982 - PLACE
      ?auto_23983 - TRUCK
      ?auto_23985 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23984 ?auto_23982 ) ( SURFACE-AT ?auto_23981 ?auto_23982 ) ( CLEAR ?auto_23981 ) ( IS-CRATE ?auto_23980 ) ( not ( = ?auto_23980 ?auto_23981 ) ) ( AVAILABLE ?auto_23984 ) ( IN ?auto_23980 ?auto_23983 ) ( TRUCK-AT ?auto_23983 ?auto_23985 ) ( not ( = ?auto_23985 ?auto_23982 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23983 ?auto_23985 ?auto_23982 )
      ( MAKE-ON ?auto_23980 ?auto_23981 )
      ( MAKE-ON-VERIFY ?auto_23980 ?auto_23981 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23986 - SURFACE
      ?auto_23987 - SURFACE
    )
    :vars
    (
      ?auto_23988 - HOIST
      ?auto_23991 - PLACE
      ?auto_23990 - TRUCK
      ?auto_23989 - PLACE
      ?auto_23992 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23988 ?auto_23991 ) ( SURFACE-AT ?auto_23987 ?auto_23991 ) ( CLEAR ?auto_23987 ) ( IS-CRATE ?auto_23986 ) ( not ( = ?auto_23986 ?auto_23987 ) ) ( AVAILABLE ?auto_23988 ) ( TRUCK-AT ?auto_23990 ?auto_23989 ) ( not ( = ?auto_23989 ?auto_23991 ) ) ( HOIST-AT ?auto_23992 ?auto_23989 ) ( LIFTING ?auto_23992 ?auto_23986 ) ( not ( = ?auto_23988 ?auto_23992 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23992 ?auto_23986 ?auto_23990 ?auto_23989 )
      ( MAKE-ON ?auto_23986 ?auto_23987 )
      ( MAKE-ON-VERIFY ?auto_23986 ?auto_23987 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23993 - SURFACE
      ?auto_23994 - SURFACE
    )
    :vars
    (
      ?auto_23997 - HOIST
      ?auto_23999 - PLACE
      ?auto_23996 - TRUCK
      ?auto_23998 - PLACE
      ?auto_23995 - HOIST
      ?auto_24000 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23997 ?auto_23999 ) ( SURFACE-AT ?auto_23994 ?auto_23999 ) ( CLEAR ?auto_23994 ) ( IS-CRATE ?auto_23993 ) ( not ( = ?auto_23993 ?auto_23994 ) ) ( AVAILABLE ?auto_23997 ) ( TRUCK-AT ?auto_23996 ?auto_23998 ) ( not ( = ?auto_23998 ?auto_23999 ) ) ( HOIST-AT ?auto_23995 ?auto_23998 ) ( not ( = ?auto_23997 ?auto_23995 ) ) ( AVAILABLE ?auto_23995 ) ( SURFACE-AT ?auto_23993 ?auto_23998 ) ( ON ?auto_23993 ?auto_24000 ) ( CLEAR ?auto_23993 ) ( not ( = ?auto_23993 ?auto_24000 ) ) ( not ( = ?auto_23994 ?auto_24000 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23995 ?auto_23993 ?auto_24000 ?auto_23998 )
      ( MAKE-ON ?auto_23993 ?auto_23994 )
      ( MAKE-ON-VERIFY ?auto_23993 ?auto_23994 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24001 - SURFACE
      ?auto_24002 - SURFACE
    )
    :vars
    (
      ?auto_24004 - HOIST
      ?auto_24006 - PLACE
      ?auto_24005 - PLACE
      ?auto_24003 - HOIST
      ?auto_24008 - SURFACE
      ?auto_24007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24004 ?auto_24006 ) ( SURFACE-AT ?auto_24002 ?auto_24006 ) ( CLEAR ?auto_24002 ) ( IS-CRATE ?auto_24001 ) ( not ( = ?auto_24001 ?auto_24002 ) ) ( AVAILABLE ?auto_24004 ) ( not ( = ?auto_24005 ?auto_24006 ) ) ( HOIST-AT ?auto_24003 ?auto_24005 ) ( not ( = ?auto_24004 ?auto_24003 ) ) ( AVAILABLE ?auto_24003 ) ( SURFACE-AT ?auto_24001 ?auto_24005 ) ( ON ?auto_24001 ?auto_24008 ) ( CLEAR ?auto_24001 ) ( not ( = ?auto_24001 ?auto_24008 ) ) ( not ( = ?auto_24002 ?auto_24008 ) ) ( TRUCK-AT ?auto_24007 ?auto_24006 ) )
    :subtasks
    ( ( !DRIVE ?auto_24007 ?auto_24006 ?auto_24005 )
      ( MAKE-ON ?auto_24001 ?auto_24002 )
      ( MAKE-ON-VERIFY ?auto_24001 ?auto_24002 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24009 - SURFACE
      ?auto_24010 - SURFACE
    )
    :vars
    (
      ?auto_24016 - HOIST
      ?auto_24013 - PLACE
      ?auto_24011 - PLACE
      ?auto_24015 - HOIST
      ?auto_24014 - SURFACE
      ?auto_24012 - TRUCK
      ?auto_24017 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24016 ?auto_24013 ) ( IS-CRATE ?auto_24009 ) ( not ( = ?auto_24009 ?auto_24010 ) ) ( not ( = ?auto_24011 ?auto_24013 ) ) ( HOIST-AT ?auto_24015 ?auto_24011 ) ( not ( = ?auto_24016 ?auto_24015 ) ) ( AVAILABLE ?auto_24015 ) ( SURFACE-AT ?auto_24009 ?auto_24011 ) ( ON ?auto_24009 ?auto_24014 ) ( CLEAR ?auto_24009 ) ( not ( = ?auto_24009 ?auto_24014 ) ) ( not ( = ?auto_24010 ?auto_24014 ) ) ( TRUCK-AT ?auto_24012 ?auto_24013 ) ( SURFACE-AT ?auto_24017 ?auto_24013 ) ( CLEAR ?auto_24017 ) ( LIFTING ?auto_24016 ?auto_24010 ) ( IS-CRATE ?auto_24010 ) ( not ( = ?auto_24009 ?auto_24017 ) ) ( not ( = ?auto_24010 ?auto_24017 ) ) ( not ( = ?auto_24014 ?auto_24017 ) ) )
    :subtasks
    ( ( !DROP ?auto_24016 ?auto_24010 ?auto_24017 ?auto_24013 )
      ( MAKE-ON ?auto_24009 ?auto_24010 )
      ( MAKE-ON-VERIFY ?auto_24009 ?auto_24010 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24018 - SURFACE
      ?auto_24019 - SURFACE
    )
    :vars
    (
      ?auto_24026 - HOIST
      ?auto_24024 - PLACE
      ?auto_24022 - PLACE
      ?auto_24020 - HOIST
      ?auto_24023 - SURFACE
      ?auto_24025 - TRUCK
      ?auto_24021 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24026 ?auto_24024 ) ( IS-CRATE ?auto_24018 ) ( not ( = ?auto_24018 ?auto_24019 ) ) ( not ( = ?auto_24022 ?auto_24024 ) ) ( HOIST-AT ?auto_24020 ?auto_24022 ) ( not ( = ?auto_24026 ?auto_24020 ) ) ( AVAILABLE ?auto_24020 ) ( SURFACE-AT ?auto_24018 ?auto_24022 ) ( ON ?auto_24018 ?auto_24023 ) ( CLEAR ?auto_24018 ) ( not ( = ?auto_24018 ?auto_24023 ) ) ( not ( = ?auto_24019 ?auto_24023 ) ) ( TRUCK-AT ?auto_24025 ?auto_24024 ) ( SURFACE-AT ?auto_24021 ?auto_24024 ) ( CLEAR ?auto_24021 ) ( IS-CRATE ?auto_24019 ) ( not ( = ?auto_24018 ?auto_24021 ) ) ( not ( = ?auto_24019 ?auto_24021 ) ) ( not ( = ?auto_24023 ?auto_24021 ) ) ( AVAILABLE ?auto_24026 ) ( IN ?auto_24019 ?auto_24025 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24026 ?auto_24019 ?auto_24025 ?auto_24024 )
      ( MAKE-ON ?auto_24018 ?auto_24019 )
      ( MAKE-ON-VERIFY ?auto_24018 ?auto_24019 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24027 - SURFACE
      ?auto_24028 - SURFACE
    )
    :vars
    (
      ?auto_24035 - HOIST
      ?auto_24030 - PLACE
      ?auto_24034 - PLACE
      ?auto_24033 - HOIST
      ?auto_24029 - SURFACE
      ?auto_24031 - SURFACE
      ?auto_24032 - TRUCK
      ?auto_24036 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24035 ?auto_24030 ) ( IS-CRATE ?auto_24027 ) ( not ( = ?auto_24027 ?auto_24028 ) ) ( not ( = ?auto_24034 ?auto_24030 ) ) ( HOIST-AT ?auto_24033 ?auto_24034 ) ( not ( = ?auto_24035 ?auto_24033 ) ) ( AVAILABLE ?auto_24033 ) ( SURFACE-AT ?auto_24027 ?auto_24034 ) ( ON ?auto_24027 ?auto_24029 ) ( CLEAR ?auto_24027 ) ( not ( = ?auto_24027 ?auto_24029 ) ) ( not ( = ?auto_24028 ?auto_24029 ) ) ( SURFACE-AT ?auto_24031 ?auto_24030 ) ( CLEAR ?auto_24031 ) ( IS-CRATE ?auto_24028 ) ( not ( = ?auto_24027 ?auto_24031 ) ) ( not ( = ?auto_24028 ?auto_24031 ) ) ( not ( = ?auto_24029 ?auto_24031 ) ) ( AVAILABLE ?auto_24035 ) ( IN ?auto_24028 ?auto_24032 ) ( TRUCK-AT ?auto_24032 ?auto_24036 ) ( not ( = ?auto_24036 ?auto_24030 ) ) ( not ( = ?auto_24034 ?auto_24036 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24032 ?auto_24036 ?auto_24030 )
      ( MAKE-ON ?auto_24027 ?auto_24028 )
      ( MAKE-ON-VERIFY ?auto_24027 ?auto_24028 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24037 - SURFACE
      ?auto_24038 - SURFACE
    )
    :vars
    (
      ?auto_24046 - HOIST
      ?auto_24044 - PLACE
      ?auto_24041 - PLACE
      ?auto_24042 - HOIST
      ?auto_24040 - SURFACE
      ?auto_24043 - SURFACE
      ?auto_24045 - TRUCK
      ?auto_24039 - PLACE
      ?auto_24047 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24046 ?auto_24044 ) ( IS-CRATE ?auto_24037 ) ( not ( = ?auto_24037 ?auto_24038 ) ) ( not ( = ?auto_24041 ?auto_24044 ) ) ( HOIST-AT ?auto_24042 ?auto_24041 ) ( not ( = ?auto_24046 ?auto_24042 ) ) ( AVAILABLE ?auto_24042 ) ( SURFACE-AT ?auto_24037 ?auto_24041 ) ( ON ?auto_24037 ?auto_24040 ) ( CLEAR ?auto_24037 ) ( not ( = ?auto_24037 ?auto_24040 ) ) ( not ( = ?auto_24038 ?auto_24040 ) ) ( SURFACE-AT ?auto_24043 ?auto_24044 ) ( CLEAR ?auto_24043 ) ( IS-CRATE ?auto_24038 ) ( not ( = ?auto_24037 ?auto_24043 ) ) ( not ( = ?auto_24038 ?auto_24043 ) ) ( not ( = ?auto_24040 ?auto_24043 ) ) ( AVAILABLE ?auto_24046 ) ( TRUCK-AT ?auto_24045 ?auto_24039 ) ( not ( = ?auto_24039 ?auto_24044 ) ) ( not ( = ?auto_24041 ?auto_24039 ) ) ( HOIST-AT ?auto_24047 ?auto_24039 ) ( LIFTING ?auto_24047 ?auto_24038 ) ( not ( = ?auto_24046 ?auto_24047 ) ) ( not ( = ?auto_24042 ?auto_24047 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24047 ?auto_24038 ?auto_24045 ?auto_24039 )
      ( MAKE-ON ?auto_24037 ?auto_24038 )
      ( MAKE-ON-VERIFY ?auto_24037 ?auto_24038 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24048 - SURFACE
      ?auto_24049 - SURFACE
    )
    :vars
    (
      ?auto_24054 - HOIST
      ?auto_24052 - PLACE
      ?auto_24057 - PLACE
      ?auto_24055 - HOIST
      ?auto_24051 - SURFACE
      ?auto_24050 - SURFACE
      ?auto_24053 - TRUCK
      ?auto_24058 - PLACE
      ?auto_24056 - HOIST
      ?auto_24059 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24054 ?auto_24052 ) ( IS-CRATE ?auto_24048 ) ( not ( = ?auto_24048 ?auto_24049 ) ) ( not ( = ?auto_24057 ?auto_24052 ) ) ( HOIST-AT ?auto_24055 ?auto_24057 ) ( not ( = ?auto_24054 ?auto_24055 ) ) ( AVAILABLE ?auto_24055 ) ( SURFACE-AT ?auto_24048 ?auto_24057 ) ( ON ?auto_24048 ?auto_24051 ) ( CLEAR ?auto_24048 ) ( not ( = ?auto_24048 ?auto_24051 ) ) ( not ( = ?auto_24049 ?auto_24051 ) ) ( SURFACE-AT ?auto_24050 ?auto_24052 ) ( CLEAR ?auto_24050 ) ( IS-CRATE ?auto_24049 ) ( not ( = ?auto_24048 ?auto_24050 ) ) ( not ( = ?auto_24049 ?auto_24050 ) ) ( not ( = ?auto_24051 ?auto_24050 ) ) ( AVAILABLE ?auto_24054 ) ( TRUCK-AT ?auto_24053 ?auto_24058 ) ( not ( = ?auto_24058 ?auto_24052 ) ) ( not ( = ?auto_24057 ?auto_24058 ) ) ( HOIST-AT ?auto_24056 ?auto_24058 ) ( not ( = ?auto_24054 ?auto_24056 ) ) ( not ( = ?auto_24055 ?auto_24056 ) ) ( AVAILABLE ?auto_24056 ) ( SURFACE-AT ?auto_24049 ?auto_24058 ) ( ON ?auto_24049 ?auto_24059 ) ( CLEAR ?auto_24049 ) ( not ( = ?auto_24048 ?auto_24059 ) ) ( not ( = ?auto_24049 ?auto_24059 ) ) ( not ( = ?auto_24051 ?auto_24059 ) ) ( not ( = ?auto_24050 ?auto_24059 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24056 ?auto_24049 ?auto_24059 ?auto_24058 )
      ( MAKE-ON ?auto_24048 ?auto_24049 )
      ( MAKE-ON-VERIFY ?auto_24048 ?auto_24049 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24060 - SURFACE
      ?auto_24061 - SURFACE
    )
    :vars
    (
      ?auto_24071 - HOIST
      ?auto_24068 - PLACE
      ?auto_24066 - PLACE
      ?auto_24062 - HOIST
      ?auto_24067 - SURFACE
      ?auto_24065 - SURFACE
      ?auto_24069 - PLACE
      ?auto_24070 - HOIST
      ?auto_24063 - SURFACE
      ?auto_24064 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24071 ?auto_24068 ) ( IS-CRATE ?auto_24060 ) ( not ( = ?auto_24060 ?auto_24061 ) ) ( not ( = ?auto_24066 ?auto_24068 ) ) ( HOIST-AT ?auto_24062 ?auto_24066 ) ( not ( = ?auto_24071 ?auto_24062 ) ) ( AVAILABLE ?auto_24062 ) ( SURFACE-AT ?auto_24060 ?auto_24066 ) ( ON ?auto_24060 ?auto_24067 ) ( CLEAR ?auto_24060 ) ( not ( = ?auto_24060 ?auto_24067 ) ) ( not ( = ?auto_24061 ?auto_24067 ) ) ( SURFACE-AT ?auto_24065 ?auto_24068 ) ( CLEAR ?auto_24065 ) ( IS-CRATE ?auto_24061 ) ( not ( = ?auto_24060 ?auto_24065 ) ) ( not ( = ?auto_24061 ?auto_24065 ) ) ( not ( = ?auto_24067 ?auto_24065 ) ) ( AVAILABLE ?auto_24071 ) ( not ( = ?auto_24069 ?auto_24068 ) ) ( not ( = ?auto_24066 ?auto_24069 ) ) ( HOIST-AT ?auto_24070 ?auto_24069 ) ( not ( = ?auto_24071 ?auto_24070 ) ) ( not ( = ?auto_24062 ?auto_24070 ) ) ( AVAILABLE ?auto_24070 ) ( SURFACE-AT ?auto_24061 ?auto_24069 ) ( ON ?auto_24061 ?auto_24063 ) ( CLEAR ?auto_24061 ) ( not ( = ?auto_24060 ?auto_24063 ) ) ( not ( = ?auto_24061 ?auto_24063 ) ) ( not ( = ?auto_24067 ?auto_24063 ) ) ( not ( = ?auto_24065 ?auto_24063 ) ) ( TRUCK-AT ?auto_24064 ?auto_24068 ) )
    :subtasks
    ( ( !DRIVE ?auto_24064 ?auto_24068 ?auto_24069 )
      ( MAKE-ON ?auto_24060 ?auto_24061 )
      ( MAKE-ON-VERIFY ?auto_24060 ?auto_24061 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24072 - SURFACE
      ?auto_24073 - SURFACE
    )
    :vars
    (
      ?auto_24081 - HOIST
      ?auto_24074 - PLACE
      ?auto_24076 - PLACE
      ?auto_24080 - HOIST
      ?auto_24075 - SURFACE
      ?auto_24077 - SURFACE
      ?auto_24078 - PLACE
      ?auto_24079 - HOIST
      ?auto_24082 - SURFACE
      ?auto_24083 - TRUCK
      ?auto_24084 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24081 ?auto_24074 ) ( IS-CRATE ?auto_24072 ) ( not ( = ?auto_24072 ?auto_24073 ) ) ( not ( = ?auto_24076 ?auto_24074 ) ) ( HOIST-AT ?auto_24080 ?auto_24076 ) ( not ( = ?auto_24081 ?auto_24080 ) ) ( AVAILABLE ?auto_24080 ) ( SURFACE-AT ?auto_24072 ?auto_24076 ) ( ON ?auto_24072 ?auto_24075 ) ( CLEAR ?auto_24072 ) ( not ( = ?auto_24072 ?auto_24075 ) ) ( not ( = ?auto_24073 ?auto_24075 ) ) ( IS-CRATE ?auto_24073 ) ( not ( = ?auto_24072 ?auto_24077 ) ) ( not ( = ?auto_24073 ?auto_24077 ) ) ( not ( = ?auto_24075 ?auto_24077 ) ) ( not ( = ?auto_24078 ?auto_24074 ) ) ( not ( = ?auto_24076 ?auto_24078 ) ) ( HOIST-AT ?auto_24079 ?auto_24078 ) ( not ( = ?auto_24081 ?auto_24079 ) ) ( not ( = ?auto_24080 ?auto_24079 ) ) ( AVAILABLE ?auto_24079 ) ( SURFACE-AT ?auto_24073 ?auto_24078 ) ( ON ?auto_24073 ?auto_24082 ) ( CLEAR ?auto_24073 ) ( not ( = ?auto_24072 ?auto_24082 ) ) ( not ( = ?auto_24073 ?auto_24082 ) ) ( not ( = ?auto_24075 ?auto_24082 ) ) ( not ( = ?auto_24077 ?auto_24082 ) ) ( TRUCK-AT ?auto_24083 ?auto_24074 ) ( SURFACE-AT ?auto_24084 ?auto_24074 ) ( CLEAR ?auto_24084 ) ( LIFTING ?auto_24081 ?auto_24077 ) ( IS-CRATE ?auto_24077 ) ( not ( = ?auto_24072 ?auto_24084 ) ) ( not ( = ?auto_24073 ?auto_24084 ) ) ( not ( = ?auto_24075 ?auto_24084 ) ) ( not ( = ?auto_24077 ?auto_24084 ) ) ( not ( = ?auto_24082 ?auto_24084 ) ) )
    :subtasks
    ( ( !DROP ?auto_24081 ?auto_24077 ?auto_24084 ?auto_24074 )
      ( MAKE-ON ?auto_24072 ?auto_24073 )
      ( MAKE-ON-VERIFY ?auto_24072 ?auto_24073 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24085 - SURFACE
      ?auto_24086 - SURFACE
    )
    :vars
    (
      ?auto_24089 - HOIST
      ?auto_24096 - PLACE
      ?auto_24091 - PLACE
      ?auto_24088 - HOIST
      ?auto_24087 - SURFACE
      ?auto_24093 - SURFACE
      ?auto_24094 - PLACE
      ?auto_24092 - HOIST
      ?auto_24095 - SURFACE
      ?auto_24090 - TRUCK
      ?auto_24097 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24089 ?auto_24096 ) ( IS-CRATE ?auto_24085 ) ( not ( = ?auto_24085 ?auto_24086 ) ) ( not ( = ?auto_24091 ?auto_24096 ) ) ( HOIST-AT ?auto_24088 ?auto_24091 ) ( not ( = ?auto_24089 ?auto_24088 ) ) ( AVAILABLE ?auto_24088 ) ( SURFACE-AT ?auto_24085 ?auto_24091 ) ( ON ?auto_24085 ?auto_24087 ) ( CLEAR ?auto_24085 ) ( not ( = ?auto_24085 ?auto_24087 ) ) ( not ( = ?auto_24086 ?auto_24087 ) ) ( IS-CRATE ?auto_24086 ) ( not ( = ?auto_24085 ?auto_24093 ) ) ( not ( = ?auto_24086 ?auto_24093 ) ) ( not ( = ?auto_24087 ?auto_24093 ) ) ( not ( = ?auto_24094 ?auto_24096 ) ) ( not ( = ?auto_24091 ?auto_24094 ) ) ( HOIST-AT ?auto_24092 ?auto_24094 ) ( not ( = ?auto_24089 ?auto_24092 ) ) ( not ( = ?auto_24088 ?auto_24092 ) ) ( AVAILABLE ?auto_24092 ) ( SURFACE-AT ?auto_24086 ?auto_24094 ) ( ON ?auto_24086 ?auto_24095 ) ( CLEAR ?auto_24086 ) ( not ( = ?auto_24085 ?auto_24095 ) ) ( not ( = ?auto_24086 ?auto_24095 ) ) ( not ( = ?auto_24087 ?auto_24095 ) ) ( not ( = ?auto_24093 ?auto_24095 ) ) ( TRUCK-AT ?auto_24090 ?auto_24096 ) ( SURFACE-AT ?auto_24097 ?auto_24096 ) ( CLEAR ?auto_24097 ) ( IS-CRATE ?auto_24093 ) ( not ( = ?auto_24085 ?auto_24097 ) ) ( not ( = ?auto_24086 ?auto_24097 ) ) ( not ( = ?auto_24087 ?auto_24097 ) ) ( not ( = ?auto_24093 ?auto_24097 ) ) ( not ( = ?auto_24095 ?auto_24097 ) ) ( AVAILABLE ?auto_24089 ) ( IN ?auto_24093 ?auto_24090 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24089 ?auto_24093 ?auto_24090 ?auto_24096 )
      ( MAKE-ON ?auto_24085 ?auto_24086 )
      ( MAKE-ON-VERIFY ?auto_24085 ?auto_24086 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24098 - SURFACE
      ?auto_24099 - SURFACE
    )
    :vars
    (
      ?auto_24103 - HOIST
      ?auto_24110 - PLACE
      ?auto_24104 - PLACE
      ?auto_24105 - HOIST
      ?auto_24101 - SURFACE
      ?auto_24109 - SURFACE
      ?auto_24100 - PLACE
      ?auto_24102 - HOIST
      ?auto_24108 - SURFACE
      ?auto_24106 - SURFACE
      ?auto_24107 - TRUCK
      ?auto_24111 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24103 ?auto_24110 ) ( IS-CRATE ?auto_24098 ) ( not ( = ?auto_24098 ?auto_24099 ) ) ( not ( = ?auto_24104 ?auto_24110 ) ) ( HOIST-AT ?auto_24105 ?auto_24104 ) ( not ( = ?auto_24103 ?auto_24105 ) ) ( AVAILABLE ?auto_24105 ) ( SURFACE-AT ?auto_24098 ?auto_24104 ) ( ON ?auto_24098 ?auto_24101 ) ( CLEAR ?auto_24098 ) ( not ( = ?auto_24098 ?auto_24101 ) ) ( not ( = ?auto_24099 ?auto_24101 ) ) ( IS-CRATE ?auto_24099 ) ( not ( = ?auto_24098 ?auto_24109 ) ) ( not ( = ?auto_24099 ?auto_24109 ) ) ( not ( = ?auto_24101 ?auto_24109 ) ) ( not ( = ?auto_24100 ?auto_24110 ) ) ( not ( = ?auto_24104 ?auto_24100 ) ) ( HOIST-AT ?auto_24102 ?auto_24100 ) ( not ( = ?auto_24103 ?auto_24102 ) ) ( not ( = ?auto_24105 ?auto_24102 ) ) ( AVAILABLE ?auto_24102 ) ( SURFACE-AT ?auto_24099 ?auto_24100 ) ( ON ?auto_24099 ?auto_24108 ) ( CLEAR ?auto_24099 ) ( not ( = ?auto_24098 ?auto_24108 ) ) ( not ( = ?auto_24099 ?auto_24108 ) ) ( not ( = ?auto_24101 ?auto_24108 ) ) ( not ( = ?auto_24109 ?auto_24108 ) ) ( SURFACE-AT ?auto_24106 ?auto_24110 ) ( CLEAR ?auto_24106 ) ( IS-CRATE ?auto_24109 ) ( not ( = ?auto_24098 ?auto_24106 ) ) ( not ( = ?auto_24099 ?auto_24106 ) ) ( not ( = ?auto_24101 ?auto_24106 ) ) ( not ( = ?auto_24109 ?auto_24106 ) ) ( not ( = ?auto_24108 ?auto_24106 ) ) ( AVAILABLE ?auto_24103 ) ( IN ?auto_24109 ?auto_24107 ) ( TRUCK-AT ?auto_24107 ?auto_24111 ) ( not ( = ?auto_24111 ?auto_24110 ) ) ( not ( = ?auto_24104 ?auto_24111 ) ) ( not ( = ?auto_24100 ?auto_24111 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24107 ?auto_24111 ?auto_24110 )
      ( MAKE-ON ?auto_24098 ?auto_24099 )
      ( MAKE-ON-VERIFY ?auto_24098 ?auto_24099 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24112 - SURFACE
      ?auto_24113 - SURFACE
    )
    :vars
    (
      ?auto_24122 - HOIST
      ?auto_24121 - PLACE
      ?auto_24116 - PLACE
      ?auto_24117 - HOIST
      ?auto_24123 - SURFACE
      ?auto_24119 - SURFACE
      ?auto_24124 - PLACE
      ?auto_24120 - HOIST
      ?auto_24115 - SURFACE
      ?auto_24114 - SURFACE
      ?auto_24118 - TRUCK
      ?auto_24125 - PLACE
      ?auto_24126 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24122 ?auto_24121 ) ( IS-CRATE ?auto_24112 ) ( not ( = ?auto_24112 ?auto_24113 ) ) ( not ( = ?auto_24116 ?auto_24121 ) ) ( HOIST-AT ?auto_24117 ?auto_24116 ) ( not ( = ?auto_24122 ?auto_24117 ) ) ( AVAILABLE ?auto_24117 ) ( SURFACE-AT ?auto_24112 ?auto_24116 ) ( ON ?auto_24112 ?auto_24123 ) ( CLEAR ?auto_24112 ) ( not ( = ?auto_24112 ?auto_24123 ) ) ( not ( = ?auto_24113 ?auto_24123 ) ) ( IS-CRATE ?auto_24113 ) ( not ( = ?auto_24112 ?auto_24119 ) ) ( not ( = ?auto_24113 ?auto_24119 ) ) ( not ( = ?auto_24123 ?auto_24119 ) ) ( not ( = ?auto_24124 ?auto_24121 ) ) ( not ( = ?auto_24116 ?auto_24124 ) ) ( HOIST-AT ?auto_24120 ?auto_24124 ) ( not ( = ?auto_24122 ?auto_24120 ) ) ( not ( = ?auto_24117 ?auto_24120 ) ) ( AVAILABLE ?auto_24120 ) ( SURFACE-AT ?auto_24113 ?auto_24124 ) ( ON ?auto_24113 ?auto_24115 ) ( CLEAR ?auto_24113 ) ( not ( = ?auto_24112 ?auto_24115 ) ) ( not ( = ?auto_24113 ?auto_24115 ) ) ( not ( = ?auto_24123 ?auto_24115 ) ) ( not ( = ?auto_24119 ?auto_24115 ) ) ( SURFACE-AT ?auto_24114 ?auto_24121 ) ( CLEAR ?auto_24114 ) ( IS-CRATE ?auto_24119 ) ( not ( = ?auto_24112 ?auto_24114 ) ) ( not ( = ?auto_24113 ?auto_24114 ) ) ( not ( = ?auto_24123 ?auto_24114 ) ) ( not ( = ?auto_24119 ?auto_24114 ) ) ( not ( = ?auto_24115 ?auto_24114 ) ) ( AVAILABLE ?auto_24122 ) ( TRUCK-AT ?auto_24118 ?auto_24125 ) ( not ( = ?auto_24125 ?auto_24121 ) ) ( not ( = ?auto_24116 ?auto_24125 ) ) ( not ( = ?auto_24124 ?auto_24125 ) ) ( HOIST-AT ?auto_24126 ?auto_24125 ) ( LIFTING ?auto_24126 ?auto_24119 ) ( not ( = ?auto_24122 ?auto_24126 ) ) ( not ( = ?auto_24117 ?auto_24126 ) ) ( not ( = ?auto_24120 ?auto_24126 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24126 ?auto_24119 ?auto_24118 ?auto_24125 )
      ( MAKE-ON ?auto_24112 ?auto_24113 )
      ( MAKE-ON-VERIFY ?auto_24112 ?auto_24113 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24127 - SURFACE
      ?auto_24128 - SURFACE
    )
    :vars
    (
      ?auto_24138 - HOIST
      ?auto_24139 - PLACE
      ?auto_24141 - PLACE
      ?auto_24134 - HOIST
      ?auto_24130 - SURFACE
      ?auto_24129 - SURFACE
      ?auto_24133 - PLACE
      ?auto_24137 - HOIST
      ?auto_24135 - SURFACE
      ?auto_24140 - SURFACE
      ?auto_24132 - TRUCK
      ?auto_24131 - PLACE
      ?auto_24136 - HOIST
      ?auto_24142 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24138 ?auto_24139 ) ( IS-CRATE ?auto_24127 ) ( not ( = ?auto_24127 ?auto_24128 ) ) ( not ( = ?auto_24141 ?auto_24139 ) ) ( HOIST-AT ?auto_24134 ?auto_24141 ) ( not ( = ?auto_24138 ?auto_24134 ) ) ( AVAILABLE ?auto_24134 ) ( SURFACE-AT ?auto_24127 ?auto_24141 ) ( ON ?auto_24127 ?auto_24130 ) ( CLEAR ?auto_24127 ) ( not ( = ?auto_24127 ?auto_24130 ) ) ( not ( = ?auto_24128 ?auto_24130 ) ) ( IS-CRATE ?auto_24128 ) ( not ( = ?auto_24127 ?auto_24129 ) ) ( not ( = ?auto_24128 ?auto_24129 ) ) ( not ( = ?auto_24130 ?auto_24129 ) ) ( not ( = ?auto_24133 ?auto_24139 ) ) ( not ( = ?auto_24141 ?auto_24133 ) ) ( HOIST-AT ?auto_24137 ?auto_24133 ) ( not ( = ?auto_24138 ?auto_24137 ) ) ( not ( = ?auto_24134 ?auto_24137 ) ) ( AVAILABLE ?auto_24137 ) ( SURFACE-AT ?auto_24128 ?auto_24133 ) ( ON ?auto_24128 ?auto_24135 ) ( CLEAR ?auto_24128 ) ( not ( = ?auto_24127 ?auto_24135 ) ) ( not ( = ?auto_24128 ?auto_24135 ) ) ( not ( = ?auto_24130 ?auto_24135 ) ) ( not ( = ?auto_24129 ?auto_24135 ) ) ( SURFACE-AT ?auto_24140 ?auto_24139 ) ( CLEAR ?auto_24140 ) ( IS-CRATE ?auto_24129 ) ( not ( = ?auto_24127 ?auto_24140 ) ) ( not ( = ?auto_24128 ?auto_24140 ) ) ( not ( = ?auto_24130 ?auto_24140 ) ) ( not ( = ?auto_24129 ?auto_24140 ) ) ( not ( = ?auto_24135 ?auto_24140 ) ) ( AVAILABLE ?auto_24138 ) ( TRUCK-AT ?auto_24132 ?auto_24131 ) ( not ( = ?auto_24131 ?auto_24139 ) ) ( not ( = ?auto_24141 ?auto_24131 ) ) ( not ( = ?auto_24133 ?auto_24131 ) ) ( HOIST-AT ?auto_24136 ?auto_24131 ) ( not ( = ?auto_24138 ?auto_24136 ) ) ( not ( = ?auto_24134 ?auto_24136 ) ) ( not ( = ?auto_24137 ?auto_24136 ) ) ( AVAILABLE ?auto_24136 ) ( SURFACE-AT ?auto_24129 ?auto_24131 ) ( ON ?auto_24129 ?auto_24142 ) ( CLEAR ?auto_24129 ) ( not ( = ?auto_24127 ?auto_24142 ) ) ( not ( = ?auto_24128 ?auto_24142 ) ) ( not ( = ?auto_24130 ?auto_24142 ) ) ( not ( = ?auto_24129 ?auto_24142 ) ) ( not ( = ?auto_24135 ?auto_24142 ) ) ( not ( = ?auto_24140 ?auto_24142 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24136 ?auto_24129 ?auto_24142 ?auto_24131 )
      ( MAKE-ON ?auto_24127 ?auto_24128 )
      ( MAKE-ON-VERIFY ?auto_24127 ?auto_24128 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24143 - SURFACE
      ?auto_24144 - SURFACE
    )
    :vars
    (
      ?auto_24149 - HOIST
      ?auto_24151 - PLACE
      ?auto_24155 - PLACE
      ?auto_24146 - HOIST
      ?auto_24147 - SURFACE
      ?auto_24154 - SURFACE
      ?auto_24153 - PLACE
      ?auto_24145 - HOIST
      ?auto_24156 - SURFACE
      ?auto_24148 - SURFACE
      ?auto_24150 - PLACE
      ?auto_24157 - HOIST
      ?auto_24158 - SURFACE
      ?auto_24152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24149 ?auto_24151 ) ( IS-CRATE ?auto_24143 ) ( not ( = ?auto_24143 ?auto_24144 ) ) ( not ( = ?auto_24155 ?auto_24151 ) ) ( HOIST-AT ?auto_24146 ?auto_24155 ) ( not ( = ?auto_24149 ?auto_24146 ) ) ( AVAILABLE ?auto_24146 ) ( SURFACE-AT ?auto_24143 ?auto_24155 ) ( ON ?auto_24143 ?auto_24147 ) ( CLEAR ?auto_24143 ) ( not ( = ?auto_24143 ?auto_24147 ) ) ( not ( = ?auto_24144 ?auto_24147 ) ) ( IS-CRATE ?auto_24144 ) ( not ( = ?auto_24143 ?auto_24154 ) ) ( not ( = ?auto_24144 ?auto_24154 ) ) ( not ( = ?auto_24147 ?auto_24154 ) ) ( not ( = ?auto_24153 ?auto_24151 ) ) ( not ( = ?auto_24155 ?auto_24153 ) ) ( HOIST-AT ?auto_24145 ?auto_24153 ) ( not ( = ?auto_24149 ?auto_24145 ) ) ( not ( = ?auto_24146 ?auto_24145 ) ) ( AVAILABLE ?auto_24145 ) ( SURFACE-AT ?auto_24144 ?auto_24153 ) ( ON ?auto_24144 ?auto_24156 ) ( CLEAR ?auto_24144 ) ( not ( = ?auto_24143 ?auto_24156 ) ) ( not ( = ?auto_24144 ?auto_24156 ) ) ( not ( = ?auto_24147 ?auto_24156 ) ) ( not ( = ?auto_24154 ?auto_24156 ) ) ( SURFACE-AT ?auto_24148 ?auto_24151 ) ( CLEAR ?auto_24148 ) ( IS-CRATE ?auto_24154 ) ( not ( = ?auto_24143 ?auto_24148 ) ) ( not ( = ?auto_24144 ?auto_24148 ) ) ( not ( = ?auto_24147 ?auto_24148 ) ) ( not ( = ?auto_24154 ?auto_24148 ) ) ( not ( = ?auto_24156 ?auto_24148 ) ) ( AVAILABLE ?auto_24149 ) ( not ( = ?auto_24150 ?auto_24151 ) ) ( not ( = ?auto_24155 ?auto_24150 ) ) ( not ( = ?auto_24153 ?auto_24150 ) ) ( HOIST-AT ?auto_24157 ?auto_24150 ) ( not ( = ?auto_24149 ?auto_24157 ) ) ( not ( = ?auto_24146 ?auto_24157 ) ) ( not ( = ?auto_24145 ?auto_24157 ) ) ( AVAILABLE ?auto_24157 ) ( SURFACE-AT ?auto_24154 ?auto_24150 ) ( ON ?auto_24154 ?auto_24158 ) ( CLEAR ?auto_24154 ) ( not ( = ?auto_24143 ?auto_24158 ) ) ( not ( = ?auto_24144 ?auto_24158 ) ) ( not ( = ?auto_24147 ?auto_24158 ) ) ( not ( = ?auto_24154 ?auto_24158 ) ) ( not ( = ?auto_24156 ?auto_24158 ) ) ( not ( = ?auto_24148 ?auto_24158 ) ) ( TRUCK-AT ?auto_24152 ?auto_24151 ) )
    :subtasks
    ( ( !DRIVE ?auto_24152 ?auto_24151 ?auto_24150 )
      ( MAKE-ON ?auto_24143 ?auto_24144 )
      ( MAKE-ON-VERIFY ?auto_24143 ?auto_24144 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24159 - SURFACE
      ?auto_24160 - SURFACE
    )
    :vars
    (
      ?auto_24163 - HOIST
      ?auto_24167 - PLACE
      ?auto_24161 - PLACE
      ?auto_24169 - HOIST
      ?auto_24166 - SURFACE
      ?auto_24162 - SURFACE
      ?auto_24173 - PLACE
      ?auto_24165 - HOIST
      ?auto_24170 - SURFACE
      ?auto_24172 - SURFACE
      ?auto_24174 - PLACE
      ?auto_24164 - HOIST
      ?auto_24171 - SURFACE
      ?auto_24168 - TRUCK
      ?auto_24175 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24163 ?auto_24167 ) ( IS-CRATE ?auto_24159 ) ( not ( = ?auto_24159 ?auto_24160 ) ) ( not ( = ?auto_24161 ?auto_24167 ) ) ( HOIST-AT ?auto_24169 ?auto_24161 ) ( not ( = ?auto_24163 ?auto_24169 ) ) ( AVAILABLE ?auto_24169 ) ( SURFACE-AT ?auto_24159 ?auto_24161 ) ( ON ?auto_24159 ?auto_24166 ) ( CLEAR ?auto_24159 ) ( not ( = ?auto_24159 ?auto_24166 ) ) ( not ( = ?auto_24160 ?auto_24166 ) ) ( IS-CRATE ?auto_24160 ) ( not ( = ?auto_24159 ?auto_24162 ) ) ( not ( = ?auto_24160 ?auto_24162 ) ) ( not ( = ?auto_24166 ?auto_24162 ) ) ( not ( = ?auto_24173 ?auto_24167 ) ) ( not ( = ?auto_24161 ?auto_24173 ) ) ( HOIST-AT ?auto_24165 ?auto_24173 ) ( not ( = ?auto_24163 ?auto_24165 ) ) ( not ( = ?auto_24169 ?auto_24165 ) ) ( AVAILABLE ?auto_24165 ) ( SURFACE-AT ?auto_24160 ?auto_24173 ) ( ON ?auto_24160 ?auto_24170 ) ( CLEAR ?auto_24160 ) ( not ( = ?auto_24159 ?auto_24170 ) ) ( not ( = ?auto_24160 ?auto_24170 ) ) ( not ( = ?auto_24166 ?auto_24170 ) ) ( not ( = ?auto_24162 ?auto_24170 ) ) ( IS-CRATE ?auto_24162 ) ( not ( = ?auto_24159 ?auto_24172 ) ) ( not ( = ?auto_24160 ?auto_24172 ) ) ( not ( = ?auto_24166 ?auto_24172 ) ) ( not ( = ?auto_24162 ?auto_24172 ) ) ( not ( = ?auto_24170 ?auto_24172 ) ) ( not ( = ?auto_24174 ?auto_24167 ) ) ( not ( = ?auto_24161 ?auto_24174 ) ) ( not ( = ?auto_24173 ?auto_24174 ) ) ( HOIST-AT ?auto_24164 ?auto_24174 ) ( not ( = ?auto_24163 ?auto_24164 ) ) ( not ( = ?auto_24169 ?auto_24164 ) ) ( not ( = ?auto_24165 ?auto_24164 ) ) ( AVAILABLE ?auto_24164 ) ( SURFACE-AT ?auto_24162 ?auto_24174 ) ( ON ?auto_24162 ?auto_24171 ) ( CLEAR ?auto_24162 ) ( not ( = ?auto_24159 ?auto_24171 ) ) ( not ( = ?auto_24160 ?auto_24171 ) ) ( not ( = ?auto_24166 ?auto_24171 ) ) ( not ( = ?auto_24162 ?auto_24171 ) ) ( not ( = ?auto_24170 ?auto_24171 ) ) ( not ( = ?auto_24172 ?auto_24171 ) ) ( TRUCK-AT ?auto_24168 ?auto_24167 ) ( SURFACE-AT ?auto_24175 ?auto_24167 ) ( CLEAR ?auto_24175 ) ( LIFTING ?auto_24163 ?auto_24172 ) ( IS-CRATE ?auto_24172 ) ( not ( = ?auto_24159 ?auto_24175 ) ) ( not ( = ?auto_24160 ?auto_24175 ) ) ( not ( = ?auto_24166 ?auto_24175 ) ) ( not ( = ?auto_24162 ?auto_24175 ) ) ( not ( = ?auto_24170 ?auto_24175 ) ) ( not ( = ?auto_24172 ?auto_24175 ) ) ( not ( = ?auto_24171 ?auto_24175 ) ) )
    :subtasks
    ( ( !DROP ?auto_24163 ?auto_24172 ?auto_24175 ?auto_24167 )
      ( MAKE-ON ?auto_24159 ?auto_24160 )
      ( MAKE-ON-VERIFY ?auto_24159 ?auto_24160 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24176 - SURFACE
      ?auto_24177 - SURFACE
    )
    :vars
    (
      ?auto_24190 - HOIST
      ?auto_24178 - PLACE
      ?auto_24191 - PLACE
      ?auto_24180 - HOIST
      ?auto_24183 - SURFACE
      ?auto_24181 - SURFACE
      ?auto_24189 - PLACE
      ?auto_24185 - HOIST
      ?auto_24192 - SURFACE
      ?auto_24179 - SURFACE
      ?auto_24182 - PLACE
      ?auto_24186 - HOIST
      ?auto_24188 - SURFACE
      ?auto_24184 - TRUCK
      ?auto_24187 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24190 ?auto_24178 ) ( IS-CRATE ?auto_24176 ) ( not ( = ?auto_24176 ?auto_24177 ) ) ( not ( = ?auto_24191 ?auto_24178 ) ) ( HOIST-AT ?auto_24180 ?auto_24191 ) ( not ( = ?auto_24190 ?auto_24180 ) ) ( AVAILABLE ?auto_24180 ) ( SURFACE-AT ?auto_24176 ?auto_24191 ) ( ON ?auto_24176 ?auto_24183 ) ( CLEAR ?auto_24176 ) ( not ( = ?auto_24176 ?auto_24183 ) ) ( not ( = ?auto_24177 ?auto_24183 ) ) ( IS-CRATE ?auto_24177 ) ( not ( = ?auto_24176 ?auto_24181 ) ) ( not ( = ?auto_24177 ?auto_24181 ) ) ( not ( = ?auto_24183 ?auto_24181 ) ) ( not ( = ?auto_24189 ?auto_24178 ) ) ( not ( = ?auto_24191 ?auto_24189 ) ) ( HOIST-AT ?auto_24185 ?auto_24189 ) ( not ( = ?auto_24190 ?auto_24185 ) ) ( not ( = ?auto_24180 ?auto_24185 ) ) ( AVAILABLE ?auto_24185 ) ( SURFACE-AT ?auto_24177 ?auto_24189 ) ( ON ?auto_24177 ?auto_24192 ) ( CLEAR ?auto_24177 ) ( not ( = ?auto_24176 ?auto_24192 ) ) ( not ( = ?auto_24177 ?auto_24192 ) ) ( not ( = ?auto_24183 ?auto_24192 ) ) ( not ( = ?auto_24181 ?auto_24192 ) ) ( IS-CRATE ?auto_24181 ) ( not ( = ?auto_24176 ?auto_24179 ) ) ( not ( = ?auto_24177 ?auto_24179 ) ) ( not ( = ?auto_24183 ?auto_24179 ) ) ( not ( = ?auto_24181 ?auto_24179 ) ) ( not ( = ?auto_24192 ?auto_24179 ) ) ( not ( = ?auto_24182 ?auto_24178 ) ) ( not ( = ?auto_24191 ?auto_24182 ) ) ( not ( = ?auto_24189 ?auto_24182 ) ) ( HOIST-AT ?auto_24186 ?auto_24182 ) ( not ( = ?auto_24190 ?auto_24186 ) ) ( not ( = ?auto_24180 ?auto_24186 ) ) ( not ( = ?auto_24185 ?auto_24186 ) ) ( AVAILABLE ?auto_24186 ) ( SURFACE-AT ?auto_24181 ?auto_24182 ) ( ON ?auto_24181 ?auto_24188 ) ( CLEAR ?auto_24181 ) ( not ( = ?auto_24176 ?auto_24188 ) ) ( not ( = ?auto_24177 ?auto_24188 ) ) ( not ( = ?auto_24183 ?auto_24188 ) ) ( not ( = ?auto_24181 ?auto_24188 ) ) ( not ( = ?auto_24192 ?auto_24188 ) ) ( not ( = ?auto_24179 ?auto_24188 ) ) ( TRUCK-AT ?auto_24184 ?auto_24178 ) ( SURFACE-AT ?auto_24187 ?auto_24178 ) ( CLEAR ?auto_24187 ) ( IS-CRATE ?auto_24179 ) ( not ( = ?auto_24176 ?auto_24187 ) ) ( not ( = ?auto_24177 ?auto_24187 ) ) ( not ( = ?auto_24183 ?auto_24187 ) ) ( not ( = ?auto_24181 ?auto_24187 ) ) ( not ( = ?auto_24192 ?auto_24187 ) ) ( not ( = ?auto_24179 ?auto_24187 ) ) ( not ( = ?auto_24188 ?auto_24187 ) ) ( AVAILABLE ?auto_24190 ) ( IN ?auto_24179 ?auto_24184 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24190 ?auto_24179 ?auto_24184 ?auto_24178 )
      ( MAKE-ON ?auto_24176 ?auto_24177 )
      ( MAKE-ON-VERIFY ?auto_24176 ?auto_24177 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24193 - SURFACE
      ?auto_24194 - SURFACE
    )
    :vars
    (
      ?auto_24201 - HOIST
      ?auto_24209 - PLACE
      ?auto_24203 - PLACE
      ?auto_24205 - HOIST
      ?auto_24204 - SURFACE
      ?auto_24206 - SURFACE
      ?auto_24202 - PLACE
      ?auto_24207 - HOIST
      ?auto_24199 - SURFACE
      ?auto_24208 - SURFACE
      ?auto_24195 - PLACE
      ?auto_24198 - HOIST
      ?auto_24200 - SURFACE
      ?auto_24196 - SURFACE
      ?auto_24197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24201 ?auto_24209 ) ( IS-CRATE ?auto_24193 ) ( not ( = ?auto_24193 ?auto_24194 ) ) ( not ( = ?auto_24203 ?auto_24209 ) ) ( HOIST-AT ?auto_24205 ?auto_24203 ) ( not ( = ?auto_24201 ?auto_24205 ) ) ( AVAILABLE ?auto_24205 ) ( SURFACE-AT ?auto_24193 ?auto_24203 ) ( ON ?auto_24193 ?auto_24204 ) ( CLEAR ?auto_24193 ) ( not ( = ?auto_24193 ?auto_24204 ) ) ( not ( = ?auto_24194 ?auto_24204 ) ) ( IS-CRATE ?auto_24194 ) ( not ( = ?auto_24193 ?auto_24206 ) ) ( not ( = ?auto_24194 ?auto_24206 ) ) ( not ( = ?auto_24204 ?auto_24206 ) ) ( not ( = ?auto_24202 ?auto_24209 ) ) ( not ( = ?auto_24203 ?auto_24202 ) ) ( HOIST-AT ?auto_24207 ?auto_24202 ) ( not ( = ?auto_24201 ?auto_24207 ) ) ( not ( = ?auto_24205 ?auto_24207 ) ) ( AVAILABLE ?auto_24207 ) ( SURFACE-AT ?auto_24194 ?auto_24202 ) ( ON ?auto_24194 ?auto_24199 ) ( CLEAR ?auto_24194 ) ( not ( = ?auto_24193 ?auto_24199 ) ) ( not ( = ?auto_24194 ?auto_24199 ) ) ( not ( = ?auto_24204 ?auto_24199 ) ) ( not ( = ?auto_24206 ?auto_24199 ) ) ( IS-CRATE ?auto_24206 ) ( not ( = ?auto_24193 ?auto_24208 ) ) ( not ( = ?auto_24194 ?auto_24208 ) ) ( not ( = ?auto_24204 ?auto_24208 ) ) ( not ( = ?auto_24206 ?auto_24208 ) ) ( not ( = ?auto_24199 ?auto_24208 ) ) ( not ( = ?auto_24195 ?auto_24209 ) ) ( not ( = ?auto_24203 ?auto_24195 ) ) ( not ( = ?auto_24202 ?auto_24195 ) ) ( HOIST-AT ?auto_24198 ?auto_24195 ) ( not ( = ?auto_24201 ?auto_24198 ) ) ( not ( = ?auto_24205 ?auto_24198 ) ) ( not ( = ?auto_24207 ?auto_24198 ) ) ( AVAILABLE ?auto_24198 ) ( SURFACE-AT ?auto_24206 ?auto_24195 ) ( ON ?auto_24206 ?auto_24200 ) ( CLEAR ?auto_24206 ) ( not ( = ?auto_24193 ?auto_24200 ) ) ( not ( = ?auto_24194 ?auto_24200 ) ) ( not ( = ?auto_24204 ?auto_24200 ) ) ( not ( = ?auto_24206 ?auto_24200 ) ) ( not ( = ?auto_24199 ?auto_24200 ) ) ( not ( = ?auto_24208 ?auto_24200 ) ) ( SURFACE-AT ?auto_24196 ?auto_24209 ) ( CLEAR ?auto_24196 ) ( IS-CRATE ?auto_24208 ) ( not ( = ?auto_24193 ?auto_24196 ) ) ( not ( = ?auto_24194 ?auto_24196 ) ) ( not ( = ?auto_24204 ?auto_24196 ) ) ( not ( = ?auto_24206 ?auto_24196 ) ) ( not ( = ?auto_24199 ?auto_24196 ) ) ( not ( = ?auto_24208 ?auto_24196 ) ) ( not ( = ?auto_24200 ?auto_24196 ) ) ( AVAILABLE ?auto_24201 ) ( IN ?auto_24208 ?auto_24197 ) ( TRUCK-AT ?auto_24197 ?auto_24203 ) )
    :subtasks
    ( ( !DRIVE ?auto_24197 ?auto_24203 ?auto_24209 )
      ( MAKE-ON ?auto_24193 ?auto_24194 )
      ( MAKE-ON-VERIFY ?auto_24193 ?auto_24194 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24210 - SURFACE
      ?auto_24211 - SURFACE
    )
    :vars
    (
      ?auto_24220 - HOIST
      ?auto_24226 - PLACE
      ?auto_24212 - PLACE
      ?auto_24218 - HOIST
      ?auto_24224 - SURFACE
      ?auto_24222 - SURFACE
      ?auto_24214 - PLACE
      ?auto_24221 - HOIST
      ?auto_24223 - SURFACE
      ?auto_24213 - SURFACE
      ?auto_24225 - PLACE
      ?auto_24219 - HOIST
      ?auto_24215 - SURFACE
      ?auto_24216 - SURFACE
      ?auto_24217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24220 ?auto_24226 ) ( IS-CRATE ?auto_24210 ) ( not ( = ?auto_24210 ?auto_24211 ) ) ( not ( = ?auto_24212 ?auto_24226 ) ) ( HOIST-AT ?auto_24218 ?auto_24212 ) ( not ( = ?auto_24220 ?auto_24218 ) ) ( SURFACE-AT ?auto_24210 ?auto_24212 ) ( ON ?auto_24210 ?auto_24224 ) ( CLEAR ?auto_24210 ) ( not ( = ?auto_24210 ?auto_24224 ) ) ( not ( = ?auto_24211 ?auto_24224 ) ) ( IS-CRATE ?auto_24211 ) ( not ( = ?auto_24210 ?auto_24222 ) ) ( not ( = ?auto_24211 ?auto_24222 ) ) ( not ( = ?auto_24224 ?auto_24222 ) ) ( not ( = ?auto_24214 ?auto_24226 ) ) ( not ( = ?auto_24212 ?auto_24214 ) ) ( HOIST-AT ?auto_24221 ?auto_24214 ) ( not ( = ?auto_24220 ?auto_24221 ) ) ( not ( = ?auto_24218 ?auto_24221 ) ) ( AVAILABLE ?auto_24221 ) ( SURFACE-AT ?auto_24211 ?auto_24214 ) ( ON ?auto_24211 ?auto_24223 ) ( CLEAR ?auto_24211 ) ( not ( = ?auto_24210 ?auto_24223 ) ) ( not ( = ?auto_24211 ?auto_24223 ) ) ( not ( = ?auto_24224 ?auto_24223 ) ) ( not ( = ?auto_24222 ?auto_24223 ) ) ( IS-CRATE ?auto_24222 ) ( not ( = ?auto_24210 ?auto_24213 ) ) ( not ( = ?auto_24211 ?auto_24213 ) ) ( not ( = ?auto_24224 ?auto_24213 ) ) ( not ( = ?auto_24222 ?auto_24213 ) ) ( not ( = ?auto_24223 ?auto_24213 ) ) ( not ( = ?auto_24225 ?auto_24226 ) ) ( not ( = ?auto_24212 ?auto_24225 ) ) ( not ( = ?auto_24214 ?auto_24225 ) ) ( HOIST-AT ?auto_24219 ?auto_24225 ) ( not ( = ?auto_24220 ?auto_24219 ) ) ( not ( = ?auto_24218 ?auto_24219 ) ) ( not ( = ?auto_24221 ?auto_24219 ) ) ( AVAILABLE ?auto_24219 ) ( SURFACE-AT ?auto_24222 ?auto_24225 ) ( ON ?auto_24222 ?auto_24215 ) ( CLEAR ?auto_24222 ) ( not ( = ?auto_24210 ?auto_24215 ) ) ( not ( = ?auto_24211 ?auto_24215 ) ) ( not ( = ?auto_24224 ?auto_24215 ) ) ( not ( = ?auto_24222 ?auto_24215 ) ) ( not ( = ?auto_24223 ?auto_24215 ) ) ( not ( = ?auto_24213 ?auto_24215 ) ) ( SURFACE-AT ?auto_24216 ?auto_24226 ) ( CLEAR ?auto_24216 ) ( IS-CRATE ?auto_24213 ) ( not ( = ?auto_24210 ?auto_24216 ) ) ( not ( = ?auto_24211 ?auto_24216 ) ) ( not ( = ?auto_24224 ?auto_24216 ) ) ( not ( = ?auto_24222 ?auto_24216 ) ) ( not ( = ?auto_24223 ?auto_24216 ) ) ( not ( = ?auto_24213 ?auto_24216 ) ) ( not ( = ?auto_24215 ?auto_24216 ) ) ( AVAILABLE ?auto_24220 ) ( TRUCK-AT ?auto_24217 ?auto_24212 ) ( LIFTING ?auto_24218 ?auto_24213 ) )
    :subtasks
    ( ( !LOAD ?auto_24218 ?auto_24213 ?auto_24217 ?auto_24212 )
      ( MAKE-ON ?auto_24210 ?auto_24211 )
      ( MAKE-ON-VERIFY ?auto_24210 ?auto_24211 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24227 - SURFACE
      ?auto_24228 - SURFACE
    )
    :vars
    (
      ?auto_24238 - HOIST
      ?auto_24240 - PLACE
      ?auto_24233 - PLACE
      ?auto_24236 - HOIST
      ?auto_24232 - SURFACE
      ?auto_24234 - SURFACE
      ?auto_24229 - PLACE
      ?auto_24241 - HOIST
      ?auto_24242 - SURFACE
      ?auto_24231 - SURFACE
      ?auto_24239 - PLACE
      ?auto_24243 - HOIST
      ?auto_24237 - SURFACE
      ?auto_24230 - SURFACE
      ?auto_24235 - TRUCK
      ?auto_24244 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24238 ?auto_24240 ) ( IS-CRATE ?auto_24227 ) ( not ( = ?auto_24227 ?auto_24228 ) ) ( not ( = ?auto_24233 ?auto_24240 ) ) ( HOIST-AT ?auto_24236 ?auto_24233 ) ( not ( = ?auto_24238 ?auto_24236 ) ) ( SURFACE-AT ?auto_24227 ?auto_24233 ) ( ON ?auto_24227 ?auto_24232 ) ( CLEAR ?auto_24227 ) ( not ( = ?auto_24227 ?auto_24232 ) ) ( not ( = ?auto_24228 ?auto_24232 ) ) ( IS-CRATE ?auto_24228 ) ( not ( = ?auto_24227 ?auto_24234 ) ) ( not ( = ?auto_24228 ?auto_24234 ) ) ( not ( = ?auto_24232 ?auto_24234 ) ) ( not ( = ?auto_24229 ?auto_24240 ) ) ( not ( = ?auto_24233 ?auto_24229 ) ) ( HOIST-AT ?auto_24241 ?auto_24229 ) ( not ( = ?auto_24238 ?auto_24241 ) ) ( not ( = ?auto_24236 ?auto_24241 ) ) ( AVAILABLE ?auto_24241 ) ( SURFACE-AT ?auto_24228 ?auto_24229 ) ( ON ?auto_24228 ?auto_24242 ) ( CLEAR ?auto_24228 ) ( not ( = ?auto_24227 ?auto_24242 ) ) ( not ( = ?auto_24228 ?auto_24242 ) ) ( not ( = ?auto_24232 ?auto_24242 ) ) ( not ( = ?auto_24234 ?auto_24242 ) ) ( IS-CRATE ?auto_24234 ) ( not ( = ?auto_24227 ?auto_24231 ) ) ( not ( = ?auto_24228 ?auto_24231 ) ) ( not ( = ?auto_24232 ?auto_24231 ) ) ( not ( = ?auto_24234 ?auto_24231 ) ) ( not ( = ?auto_24242 ?auto_24231 ) ) ( not ( = ?auto_24239 ?auto_24240 ) ) ( not ( = ?auto_24233 ?auto_24239 ) ) ( not ( = ?auto_24229 ?auto_24239 ) ) ( HOIST-AT ?auto_24243 ?auto_24239 ) ( not ( = ?auto_24238 ?auto_24243 ) ) ( not ( = ?auto_24236 ?auto_24243 ) ) ( not ( = ?auto_24241 ?auto_24243 ) ) ( AVAILABLE ?auto_24243 ) ( SURFACE-AT ?auto_24234 ?auto_24239 ) ( ON ?auto_24234 ?auto_24237 ) ( CLEAR ?auto_24234 ) ( not ( = ?auto_24227 ?auto_24237 ) ) ( not ( = ?auto_24228 ?auto_24237 ) ) ( not ( = ?auto_24232 ?auto_24237 ) ) ( not ( = ?auto_24234 ?auto_24237 ) ) ( not ( = ?auto_24242 ?auto_24237 ) ) ( not ( = ?auto_24231 ?auto_24237 ) ) ( SURFACE-AT ?auto_24230 ?auto_24240 ) ( CLEAR ?auto_24230 ) ( IS-CRATE ?auto_24231 ) ( not ( = ?auto_24227 ?auto_24230 ) ) ( not ( = ?auto_24228 ?auto_24230 ) ) ( not ( = ?auto_24232 ?auto_24230 ) ) ( not ( = ?auto_24234 ?auto_24230 ) ) ( not ( = ?auto_24242 ?auto_24230 ) ) ( not ( = ?auto_24231 ?auto_24230 ) ) ( not ( = ?auto_24237 ?auto_24230 ) ) ( AVAILABLE ?auto_24238 ) ( TRUCK-AT ?auto_24235 ?auto_24233 ) ( AVAILABLE ?auto_24236 ) ( SURFACE-AT ?auto_24231 ?auto_24233 ) ( ON ?auto_24231 ?auto_24244 ) ( CLEAR ?auto_24231 ) ( not ( = ?auto_24227 ?auto_24244 ) ) ( not ( = ?auto_24228 ?auto_24244 ) ) ( not ( = ?auto_24232 ?auto_24244 ) ) ( not ( = ?auto_24234 ?auto_24244 ) ) ( not ( = ?auto_24242 ?auto_24244 ) ) ( not ( = ?auto_24231 ?auto_24244 ) ) ( not ( = ?auto_24237 ?auto_24244 ) ) ( not ( = ?auto_24230 ?auto_24244 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24236 ?auto_24231 ?auto_24244 ?auto_24233 )
      ( MAKE-ON ?auto_24227 ?auto_24228 )
      ( MAKE-ON-VERIFY ?auto_24227 ?auto_24228 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24245 - SURFACE
      ?auto_24246 - SURFACE
    )
    :vars
    (
      ?auto_24255 - HOIST
      ?auto_24248 - PLACE
      ?auto_24261 - PLACE
      ?auto_24258 - HOIST
      ?auto_24260 - SURFACE
      ?auto_24251 - SURFACE
      ?auto_24252 - PLACE
      ?auto_24257 - HOIST
      ?auto_24256 - SURFACE
      ?auto_24250 - SURFACE
      ?auto_24249 - PLACE
      ?auto_24262 - HOIST
      ?auto_24254 - SURFACE
      ?auto_24259 - SURFACE
      ?auto_24253 - SURFACE
      ?auto_24247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24255 ?auto_24248 ) ( IS-CRATE ?auto_24245 ) ( not ( = ?auto_24245 ?auto_24246 ) ) ( not ( = ?auto_24261 ?auto_24248 ) ) ( HOIST-AT ?auto_24258 ?auto_24261 ) ( not ( = ?auto_24255 ?auto_24258 ) ) ( SURFACE-AT ?auto_24245 ?auto_24261 ) ( ON ?auto_24245 ?auto_24260 ) ( CLEAR ?auto_24245 ) ( not ( = ?auto_24245 ?auto_24260 ) ) ( not ( = ?auto_24246 ?auto_24260 ) ) ( IS-CRATE ?auto_24246 ) ( not ( = ?auto_24245 ?auto_24251 ) ) ( not ( = ?auto_24246 ?auto_24251 ) ) ( not ( = ?auto_24260 ?auto_24251 ) ) ( not ( = ?auto_24252 ?auto_24248 ) ) ( not ( = ?auto_24261 ?auto_24252 ) ) ( HOIST-AT ?auto_24257 ?auto_24252 ) ( not ( = ?auto_24255 ?auto_24257 ) ) ( not ( = ?auto_24258 ?auto_24257 ) ) ( AVAILABLE ?auto_24257 ) ( SURFACE-AT ?auto_24246 ?auto_24252 ) ( ON ?auto_24246 ?auto_24256 ) ( CLEAR ?auto_24246 ) ( not ( = ?auto_24245 ?auto_24256 ) ) ( not ( = ?auto_24246 ?auto_24256 ) ) ( not ( = ?auto_24260 ?auto_24256 ) ) ( not ( = ?auto_24251 ?auto_24256 ) ) ( IS-CRATE ?auto_24251 ) ( not ( = ?auto_24245 ?auto_24250 ) ) ( not ( = ?auto_24246 ?auto_24250 ) ) ( not ( = ?auto_24260 ?auto_24250 ) ) ( not ( = ?auto_24251 ?auto_24250 ) ) ( not ( = ?auto_24256 ?auto_24250 ) ) ( not ( = ?auto_24249 ?auto_24248 ) ) ( not ( = ?auto_24261 ?auto_24249 ) ) ( not ( = ?auto_24252 ?auto_24249 ) ) ( HOIST-AT ?auto_24262 ?auto_24249 ) ( not ( = ?auto_24255 ?auto_24262 ) ) ( not ( = ?auto_24258 ?auto_24262 ) ) ( not ( = ?auto_24257 ?auto_24262 ) ) ( AVAILABLE ?auto_24262 ) ( SURFACE-AT ?auto_24251 ?auto_24249 ) ( ON ?auto_24251 ?auto_24254 ) ( CLEAR ?auto_24251 ) ( not ( = ?auto_24245 ?auto_24254 ) ) ( not ( = ?auto_24246 ?auto_24254 ) ) ( not ( = ?auto_24260 ?auto_24254 ) ) ( not ( = ?auto_24251 ?auto_24254 ) ) ( not ( = ?auto_24256 ?auto_24254 ) ) ( not ( = ?auto_24250 ?auto_24254 ) ) ( SURFACE-AT ?auto_24259 ?auto_24248 ) ( CLEAR ?auto_24259 ) ( IS-CRATE ?auto_24250 ) ( not ( = ?auto_24245 ?auto_24259 ) ) ( not ( = ?auto_24246 ?auto_24259 ) ) ( not ( = ?auto_24260 ?auto_24259 ) ) ( not ( = ?auto_24251 ?auto_24259 ) ) ( not ( = ?auto_24256 ?auto_24259 ) ) ( not ( = ?auto_24250 ?auto_24259 ) ) ( not ( = ?auto_24254 ?auto_24259 ) ) ( AVAILABLE ?auto_24255 ) ( AVAILABLE ?auto_24258 ) ( SURFACE-AT ?auto_24250 ?auto_24261 ) ( ON ?auto_24250 ?auto_24253 ) ( CLEAR ?auto_24250 ) ( not ( = ?auto_24245 ?auto_24253 ) ) ( not ( = ?auto_24246 ?auto_24253 ) ) ( not ( = ?auto_24260 ?auto_24253 ) ) ( not ( = ?auto_24251 ?auto_24253 ) ) ( not ( = ?auto_24256 ?auto_24253 ) ) ( not ( = ?auto_24250 ?auto_24253 ) ) ( not ( = ?auto_24254 ?auto_24253 ) ) ( not ( = ?auto_24259 ?auto_24253 ) ) ( TRUCK-AT ?auto_24247 ?auto_24248 ) )
    :subtasks
    ( ( !DRIVE ?auto_24247 ?auto_24248 ?auto_24261 )
      ( MAKE-ON ?auto_24245 ?auto_24246 )
      ( MAKE-ON-VERIFY ?auto_24245 ?auto_24246 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24263 - SURFACE
      ?auto_24264 - SURFACE
    )
    :vars
    (
      ?auto_24279 - HOIST
      ?auto_24280 - PLACE
      ?auto_24271 - PLACE
      ?auto_24275 - HOIST
      ?auto_24274 - SURFACE
      ?auto_24267 - SURFACE
      ?auto_24269 - PLACE
      ?auto_24270 - HOIST
      ?auto_24266 - SURFACE
      ?auto_24265 - SURFACE
      ?auto_24272 - PLACE
      ?auto_24273 - HOIST
      ?auto_24276 - SURFACE
      ?auto_24277 - SURFACE
      ?auto_24278 - SURFACE
      ?auto_24268 - TRUCK
      ?auto_24281 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24279 ?auto_24280 ) ( IS-CRATE ?auto_24263 ) ( not ( = ?auto_24263 ?auto_24264 ) ) ( not ( = ?auto_24271 ?auto_24280 ) ) ( HOIST-AT ?auto_24275 ?auto_24271 ) ( not ( = ?auto_24279 ?auto_24275 ) ) ( SURFACE-AT ?auto_24263 ?auto_24271 ) ( ON ?auto_24263 ?auto_24274 ) ( CLEAR ?auto_24263 ) ( not ( = ?auto_24263 ?auto_24274 ) ) ( not ( = ?auto_24264 ?auto_24274 ) ) ( IS-CRATE ?auto_24264 ) ( not ( = ?auto_24263 ?auto_24267 ) ) ( not ( = ?auto_24264 ?auto_24267 ) ) ( not ( = ?auto_24274 ?auto_24267 ) ) ( not ( = ?auto_24269 ?auto_24280 ) ) ( not ( = ?auto_24271 ?auto_24269 ) ) ( HOIST-AT ?auto_24270 ?auto_24269 ) ( not ( = ?auto_24279 ?auto_24270 ) ) ( not ( = ?auto_24275 ?auto_24270 ) ) ( AVAILABLE ?auto_24270 ) ( SURFACE-AT ?auto_24264 ?auto_24269 ) ( ON ?auto_24264 ?auto_24266 ) ( CLEAR ?auto_24264 ) ( not ( = ?auto_24263 ?auto_24266 ) ) ( not ( = ?auto_24264 ?auto_24266 ) ) ( not ( = ?auto_24274 ?auto_24266 ) ) ( not ( = ?auto_24267 ?auto_24266 ) ) ( IS-CRATE ?auto_24267 ) ( not ( = ?auto_24263 ?auto_24265 ) ) ( not ( = ?auto_24264 ?auto_24265 ) ) ( not ( = ?auto_24274 ?auto_24265 ) ) ( not ( = ?auto_24267 ?auto_24265 ) ) ( not ( = ?auto_24266 ?auto_24265 ) ) ( not ( = ?auto_24272 ?auto_24280 ) ) ( not ( = ?auto_24271 ?auto_24272 ) ) ( not ( = ?auto_24269 ?auto_24272 ) ) ( HOIST-AT ?auto_24273 ?auto_24272 ) ( not ( = ?auto_24279 ?auto_24273 ) ) ( not ( = ?auto_24275 ?auto_24273 ) ) ( not ( = ?auto_24270 ?auto_24273 ) ) ( AVAILABLE ?auto_24273 ) ( SURFACE-AT ?auto_24267 ?auto_24272 ) ( ON ?auto_24267 ?auto_24276 ) ( CLEAR ?auto_24267 ) ( not ( = ?auto_24263 ?auto_24276 ) ) ( not ( = ?auto_24264 ?auto_24276 ) ) ( not ( = ?auto_24274 ?auto_24276 ) ) ( not ( = ?auto_24267 ?auto_24276 ) ) ( not ( = ?auto_24266 ?auto_24276 ) ) ( not ( = ?auto_24265 ?auto_24276 ) ) ( IS-CRATE ?auto_24265 ) ( not ( = ?auto_24263 ?auto_24277 ) ) ( not ( = ?auto_24264 ?auto_24277 ) ) ( not ( = ?auto_24274 ?auto_24277 ) ) ( not ( = ?auto_24267 ?auto_24277 ) ) ( not ( = ?auto_24266 ?auto_24277 ) ) ( not ( = ?auto_24265 ?auto_24277 ) ) ( not ( = ?auto_24276 ?auto_24277 ) ) ( AVAILABLE ?auto_24275 ) ( SURFACE-AT ?auto_24265 ?auto_24271 ) ( ON ?auto_24265 ?auto_24278 ) ( CLEAR ?auto_24265 ) ( not ( = ?auto_24263 ?auto_24278 ) ) ( not ( = ?auto_24264 ?auto_24278 ) ) ( not ( = ?auto_24274 ?auto_24278 ) ) ( not ( = ?auto_24267 ?auto_24278 ) ) ( not ( = ?auto_24266 ?auto_24278 ) ) ( not ( = ?auto_24265 ?auto_24278 ) ) ( not ( = ?auto_24276 ?auto_24278 ) ) ( not ( = ?auto_24277 ?auto_24278 ) ) ( TRUCK-AT ?auto_24268 ?auto_24280 ) ( SURFACE-AT ?auto_24281 ?auto_24280 ) ( CLEAR ?auto_24281 ) ( LIFTING ?auto_24279 ?auto_24277 ) ( IS-CRATE ?auto_24277 ) ( not ( = ?auto_24263 ?auto_24281 ) ) ( not ( = ?auto_24264 ?auto_24281 ) ) ( not ( = ?auto_24274 ?auto_24281 ) ) ( not ( = ?auto_24267 ?auto_24281 ) ) ( not ( = ?auto_24266 ?auto_24281 ) ) ( not ( = ?auto_24265 ?auto_24281 ) ) ( not ( = ?auto_24276 ?auto_24281 ) ) ( not ( = ?auto_24277 ?auto_24281 ) ) ( not ( = ?auto_24278 ?auto_24281 ) ) )
    :subtasks
    ( ( !DROP ?auto_24279 ?auto_24277 ?auto_24281 ?auto_24280 )
      ( MAKE-ON ?auto_24263 ?auto_24264 )
      ( MAKE-ON-VERIFY ?auto_24263 ?auto_24264 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24282 - SURFACE
      ?auto_24283 - SURFACE
    )
    :vars
    (
      ?auto_24291 - HOIST
      ?auto_24295 - PLACE
      ?auto_24294 - PLACE
      ?auto_24288 - HOIST
      ?auto_24290 - SURFACE
      ?auto_24284 - SURFACE
      ?auto_24286 - PLACE
      ?auto_24287 - HOIST
      ?auto_24293 - SURFACE
      ?auto_24298 - SURFACE
      ?auto_24299 - PLACE
      ?auto_24297 - HOIST
      ?auto_24300 - SURFACE
      ?auto_24292 - SURFACE
      ?auto_24289 - SURFACE
      ?auto_24285 - TRUCK
      ?auto_24296 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24291 ?auto_24295 ) ( IS-CRATE ?auto_24282 ) ( not ( = ?auto_24282 ?auto_24283 ) ) ( not ( = ?auto_24294 ?auto_24295 ) ) ( HOIST-AT ?auto_24288 ?auto_24294 ) ( not ( = ?auto_24291 ?auto_24288 ) ) ( SURFACE-AT ?auto_24282 ?auto_24294 ) ( ON ?auto_24282 ?auto_24290 ) ( CLEAR ?auto_24282 ) ( not ( = ?auto_24282 ?auto_24290 ) ) ( not ( = ?auto_24283 ?auto_24290 ) ) ( IS-CRATE ?auto_24283 ) ( not ( = ?auto_24282 ?auto_24284 ) ) ( not ( = ?auto_24283 ?auto_24284 ) ) ( not ( = ?auto_24290 ?auto_24284 ) ) ( not ( = ?auto_24286 ?auto_24295 ) ) ( not ( = ?auto_24294 ?auto_24286 ) ) ( HOIST-AT ?auto_24287 ?auto_24286 ) ( not ( = ?auto_24291 ?auto_24287 ) ) ( not ( = ?auto_24288 ?auto_24287 ) ) ( AVAILABLE ?auto_24287 ) ( SURFACE-AT ?auto_24283 ?auto_24286 ) ( ON ?auto_24283 ?auto_24293 ) ( CLEAR ?auto_24283 ) ( not ( = ?auto_24282 ?auto_24293 ) ) ( not ( = ?auto_24283 ?auto_24293 ) ) ( not ( = ?auto_24290 ?auto_24293 ) ) ( not ( = ?auto_24284 ?auto_24293 ) ) ( IS-CRATE ?auto_24284 ) ( not ( = ?auto_24282 ?auto_24298 ) ) ( not ( = ?auto_24283 ?auto_24298 ) ) ( not ( = ?auto_24290 ?auto_24298 ) ) ( not ( = ?auto_24284 ?auto_24298 ) ) ( not ( = ?auto_24293 ?auto_24298 ) ) ( not ( = ?auto_24299 ?auto_24295 ) ) ( not ( = ?auto_24294 ?auto_24299 ) ) ( not ( = ?auto_24286 ?auto_24299 ) ) ( HOIST-AT ?auto_24297 ?auto_24299 ) ( not ( = ?auto_24291 ?auto_24297 ) ) ( not ( = ?auto_24288 ?auto_24297 ) ) ( not ( = ?auto_24287 ?auto_24297 ) ) ( AVAILABLE ?auto_24297 ) ( SURFACE-AT ?auto_24284 ?auto_24299 ) ( ON ?auto_24284 ?auto_24300 ) ( CLEAR ?auto_24284 ) ( not ( = ?auto_24282 ?auto_24300 ) ) ( not ( = ?auto_24283 ?auto_24300 ) ) ( not ( = ?auto_24290 ?auto_24300 ) ) ( not ( = ?auto_24284 ?auto_24300 ) ) ( not ( = ?auto_24293 ?auto_24300 ) ) ( not ( = ?auto_24298 ?auto_24300 ) ) ( IS-CRATE ?auto_24298 ) ( not ( = ?auto_24282 ?auto_24292 ) ) ( not ( = ?auto_24283 ?auto_24292 ) ) ( not ( = ?auto_24290 ?auto_24292 ) ) ( not ( = ?auto_24284 ?auto_24292 ) ) ( not ( = ?auto_24293 ?auto_24292 ) ) ( not ( = ?auto_24298 ?auto_24292 ) ) ( not ( = ?auto_24300 ?auto_24292 ) ) ( AVAILABLE ?auto_24288 ) ( SURFACE-AT ?auto_24298 ?auto_24294 ) ( ON ?auto_24298 ?auto_24289 ) ( CLEAR ?auto_24298 ) ( not ( = ?auto_24282 ?auto_24289 ) ) ( not ( = ?auto_24283 ?auto_24289 ) ) ( not ( = ?auto_24290 ?auto_24289 ) ) ( not ( = ?auto_24284 ?auto_24289 ) ) ( not ( = ?auto_24293 ?auto_24289 ) ) ( not ( = ?auto_24298 ?auto_24289 ) ) ( not ( = ?auto_24300 ?auto_24289 ) ) ( not ( = ?auto_24292 ?auto_24289 ) ) ( TRUCK-AT ?auto_24285 ?auto_24295 ) ( SURFACE-AT ?auto_24296 ?auto_24295 ) ( CLEAR ?auto_24296 ) ( IS-CRATE ?auto_24292 ) ( not ( = ?auto_24282 ?auto_24296 ) ) ( not ( = ?auto_24283 ?auto_24296 ) ) ( not ( = ?auto_24290 ?auto_24296 ) ) ( not ( = ?auto_24284 ?auto_24296 ) ) ( not ( = ?auto_24293 ?auto_24296 ) ) ( not ( = ?auto_24298 ?auto_24296 ) ) ( not ( = ?auto_24300 ?auto_24296 ) ) ( not ( = ?auto_24292 ?auto_24296 ) ) ( not ( = ?auto_24289 ?auto_24296 ) ) ( AVAILABLE ?auto_24291 ) ( IN ?auto_24292 ?auto_24285 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24291 ?auto_24292 ?auto_24285 ?auto_24295 )
      ( MAKE-ON ?auto_24282 ?auto_24283 )
      ( MAKE-ON-VERIFY ?auto_24282 ?auto_24283 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24301 - SURFACE
      ?auto_24302 - SURFACE
    )
    :vars
    (
      ?auto_24303 - HOIST
      ?auto_24309 - PLACE
      ?auto_24306 - PLACE
      ?auto_24310 - HOIST
      ?auto_24307 - SURFACE
      ?auto_24317 - SURFACE
      ?auto_24308 - PLACE
      ?auto_24313 - HOIST
      ?auto_24316 - SURFACE
      ?auto_24318 - SURFACE
      ?auto_24305 - PLACE
      ?auto_24311 - HOIST
      ?auto_24304 - SURFACE
      ?auto_24315 - SURFACE
      ?auto_24319 - SURFACE
      ?auto_24312 - SURFACE
      ?auto_24314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24303 ?auto_24309 ) ( IS-CRATE ?auto_24301 ) ( not ( = ?auto_24301 ?auto_24302 ) ) ( not ( = ?auto_24306 ?auto_24309 ) ) ( HOIST-AT ?auto_24310 ?auto_24306 ) ( not ( = ?auto_24303 ?auto_24310 ) ) ( SURFACE-AT ?auto_24301 ?auto_24306 ) ( ON ?auto_24301 ?auto_24307 ) ( CLEAR ?auto_24301 ) ( not ( = ?auto_24301 ?auto_24307 ) ) ( not ( = ?auto_24302 ?auto_24307 ) ) ( IS-CRATE ?auto_24302 ) ( not ( = ?auto_24301 ?auto_24317 ) ) ( not ( = ?auto_24302 ?auto_24317 ) ) ( not ( = ?auto_24307 ?auto_24317 ) ) ( not ( = ?auto_24308 ?auto_24309 ) ) ( not ( = ?auto_24306 ?auto_24308 ) ) ( HOIST-AT ?auto_24313 ?auto_24308 ) ( not ( = ?auto_24303 ?auto_24313 ) ) ( not ( = ?auto_24310 ?auto_24313 ) ) ( AVAILABLE ?auto_24313 ) ( SURFACE-AT ?auto_24302 ?auto_24308 ) ( ON ?auto_24302 ?auto_24316 ) ( CLEAR ?auto_24302 ) ( not ( = ?auto_24301 ?auto_24316 ) ) ( not ( = ?auto_24302 ?auto_24316 ) ) ( not ( = ?auto_24307 ?auto_24316 ) ) ( not ( = ?auto_24317 ?auto_24316 ) ) ( IS-CRATE ?auto_24317 ) ( not ( = ?auto_24301 ?auto_24318 ) ) ( not ( = ?auto_24302 ?auto_24318 ) ) ( not ( = ?auto_24307 ?auto_24318 ) ) ( not ( = ?auto_24317 ?auto_24318 ) ) ( not ( = ?auto_24316 ?auto_24318 ) ) ( not ( = ?auto_24305 ?auto_24309 ) ) ( not ( = ?auto_24306 ?auto_24305 ) ) ( not ( = ?auto_24308 ?auto_24305 ) ) ( HOIST-AT ?auto_24311 ?auto_24305 ) ( not ( = ?auto_24303 ?auto_24311 ) ) ( not ( = ?auto_24310 ?auto_24311 ) ) ( not ( = ?auto_24313 ?auto_24311 ) ) ( AVAILABLE ?auto_24311 ) ( SURFACE-AT ?auto_24317 ?auto_24305 ) ( ON ?auto_24317 ?auto_24304 ) ( CLEAR ?auto_24317 ) ( not ( = ?auto_24301 ?auto_24304 ) ) ( not ( = ?auto_24302 ?auto_24304 ) ) ( not ( = ?auto_24307 ?auto_24304 ) ) ( not ( = ?auto_24317 ?auto_24304 ) ) ( not ( = ?auto_24316 ?auto_24304 ) ) ( not ( = ?auto_24318 ?auto_24304 ) ) ( IS-CRATE ?auto_24318 ) ( not ( = ?auto_24301 ?auto_24315 ) ) ( not ( = ?auto_24302 ?auto_24315 ) ) ( not ( = ?auto_24307 ?auto_24315 ) ) ( not ( = ?auto_24317 ?auto_24315 ) ) ( not ( = ?auto_24316 ?auto_24315 ) ) ( not ( = ?auto_24318 ?auto_24315 ) ) ( not ( = ?auto_24304 ?auto_24315 ) ) ( AVAILABLE ?auto_24310 ) ( SURFACE-AT ?auto_24318 ?auto_24306 ) ( ON ?auto_24318 ?auto_24319 ) ( CLEAR ?auto_24318 ) ( not ( = ?auto_24301 ?auto_24319 ) ) ( not ( = ?auto_24302 ?auto_24319 ) ) ( not ( = ?auto_24307 ?auto_24319 ) ) ( not ( = ?auto_24317 ?auto_24319 ) ) ( not ( = ?auto_24316 ?auto_24319 ) ) ( not ( = ?auto_24318 ?auto_24319 ) ) ( not ( = ?auto_24304 ?auto_24319 ) ) ( not ( = ?auto_24315 ?auto_24319 ) ) ( SURFACE-AT ?auto_24312 ?auto_24309 ) ( CLEAR ?auto_24312 ) ( IS-CRATE ?auto_24315 ) ( not ( = ?auto_24301 ?auto_24312 ) ) ( not ( = ?auto_24302 ?auto_24312 ) ) ( not ( = ?auto_24307 ?auto_24312 ) ) ( not ( = ?auto_24317 ?auto_24312 ) ) ( not ( = ?auto_24316 ?auto_24312 ) ) ( not ( = ?auto_24318 ?auto_24312 ) ) ( not ( = ?auto_24304 ?auto_24312 ) ) ( not ( = ?auto_24315 ?auto_24312 ) ) ( not ( = ?auto_24319 ?auto_24312 ) ) ( AVAILABLE ?auto_24303 ) ( IN ?auto_24315 ?auto_24314 ) ( TRUCK-AT ?auto_24314 ?auto_24305 ) )
    :subtasks
    ( ( !DRIVE ?auto_24314 ?auto_24305 ?auto_24309 )
      ( MAKE-ON ?auto_24301 ?auto_24302 )
      ( MAKE-ON-VERIFY ?auto_24301 ?auto_24302 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24320 - SURFACE
      ?auto_24321 - SURFACE
    )
    :vars
    (
      ?auto_24337 - HOIST
      ?auto_24327 - PLACE
      ?auto_24323 - PLACE
      ?auto_24338 - HOIST
      ?auto_24324 - SURFACE
      ?auto_24326 - SURFACE
      ?auto_24329 - PLACE
      ?auto_24322 - HOIST
      ?auto_24331 - SURFACE
      ?auto_24336 - SURFACE
      ?auto_24330 - PLACE
      ?auto_24328 - HOIST
      ?auto_24333 - SURFACE
      ?auto_24332 - SURFACE
      ?auto_24325 - SURFACE
      ?auto_24335 - SURFACE
      ?auto_24334 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24337 ?auto_24327 ) ( IS-CRATE ?auto_24320 ) ( not ( = ?auto_24320 ?auto_24321 ) ) ( not ( = ?auto_24323 ?auto_24327 ) ) ( HOIST-AT ?auto_24338 ?auto_24323 ) ( not ( = ?auto_24337 ?auto_24338 ) ) ( SURFACE-AT ?auto_24320 ?auto_24323 ) ( ON ?auto_24320 ?auto_24324 ) ( CLEAR ?auto_24320 ) ( not ( = ?auto_24320 ?auto_24324 ) ) ( not ( = ?auto_24321 ?auto_24324 ) ) ( IS-CRATE ?auto_24321 ) ( not ( = ?auto_24320 ?auto_24326 ) ) ( not ( = ?auto_24321 ?auto_24326 ) ) ( not ( = ?auto_24324 ?auto_24326 ) ) ( not ( = ?auto_24329 ?auto_24327 ) ) ( not ( = ?auto_24323 ?auto_24329 ) ) ( HOIST-AT ?auto_24322 ?auto_24329 ) ( not ( = ?auto_24337 ?auto_24322 ) ) ( not ( = ?auto_24338 ?auto_24322 ) ) ( AVAILABLE ?auto_24322 ) ( SURFACE-AT ?auto_24321 ?auto_24329 ) ( ON ?auto_24321 ?auto_24331 ) ( CLEAR ?auto_24321 ) ( not ( = ?auto_24320 ?auto_24331 ) ) ( not ( = ?auto_24321 ?auto_24331 ) ) ( not ( = ?auto_24324 ?auto_24331 ) ) ( not ( = ?auto_24326 ?auto_24331 ) ) ( IS-CRATE ?auto_24326 ) ( not ( = ?auto_24320 ?auto_24336 ) ) ( not ( = ?auto_24321 ?auto_24336 ) ) ( not ( = ?auto_24324 ?auto_24336 ) ) ( not ( = ?auto_24326 ?auto_24336 ) ) ( not ( = ?auto_24331 ?auto_24336 ) ) ( not ( = ?auto_24330 ?auto_24327 ) ) ( not ( = ?auto_24323 ?auto_24330 ) ) ( not ( = ?auto_24329 ?auto_24330 ) ) ( HOIST-AT ?auto_24328 ?auto_24330 ) ( not ( = ?auto_24337 ?auto_24328 ) ) ( not ( = ?auto_24338 ?auto_24328 ) ) ( not ( = ?auto_24322 ?auto_24328 ) ) ( SURFACE-AT ?auto_24326 ?auto_24330 ) ( ON ?auto_24326 ?auto_24333 ) ( CLEAR ?auto_24326 ) ( not ( = ?auto_24320 ?auto_24333 ) ) ( not ( = ?auto_24321 ?auto_24333 ) ) ( not ( = ?auto_24324 ?auto_24333 ) ) ( not ( = ?auto_24326 ?auto_24333 ) ) ( not ( = ?auto_24331 ?auto_24333 ) ) ( not ( = ?auto_24336 ?auto_24333 ) ) ( IS-CRATE ?auto_24336 ) ( not ( = ?auto_24320 ?auto_24332 ) ) ( not ( = ?auto_24321 ?auto_24332 ) ) ( not ( = ?auto_24324 ?auto_24332 ) ) ( not ( = ?auto_24326 ?auto_24332 ) ) ( not ( = ?auto_24331 ?auto_24332 ) ) ( not ( = ?auto_24336 ?auto_24332 ) ) ( not ( = ?auto_24333 ?auto_24332 ) ) ( AVAILABLE ?auto_24338 ) ( SURFACE-AT ?auto_24336 ?auto_24323 ) ( ON ?auto_24336 ?auto_24325 ) ( CLEAR ?auto_24336 ) ( not ( = ?auto_24320 ?auto_24325 ) ) ( not ( = ?auto_24321 ?auto_24325 ) ) ( not ( = ?auto_24324 ?auto_24325 ) ) ( not ( = ?auto_24326 ?auto_24325 ) ) ( not ( = ?auto_24331 ?auto_24325 ) ) ( not ( = ?auto_24336 ?auto_24325 ) ) ( not ( = ?auto_24333 ?auto_24325 ) ) ( not ( = ?auto_24332 ?auto_24325 ) ) ( SURFACE-AT ?auto_24335 ?auto_24327 ) ( CLEAR ?auto_24335 ) ( IS-CRATE ?auto_24332 ) ( not ( = ?auto_24320 ?auto_24335 ) ) ( not ( = ?auto_24321 ?auto_24335 ) ) ( not ( = ?auto_24324 ?auto_24335 ) ) ( not ( = ?auto_24326 ?auto_24335 ) ) ( not ( = ?auto_24331 ?auto_24335 ) ) ( not ( = ?auto_24336 ?auto_24335 ) ) ( not ( = ?auto_24333 ?auto_24335 ) ) ( not ( = ?auto_24332 ?auto_24335 ) ) ( not ( = ?auto_24325 ?auto_24335 ) ) ( AVAILABLE ?auto_24337 ) ( TRUCK-AT ?auto_24334 ?auto_24330 ) ( LIFTING ?auto_24328 ?auto_24332 ) )
    :subtasks
    ( ( !LOAD ?auto_24328 ?auto_24332 ?auto_24334 ?auto_24330 )
      ( MAKE-ON ?auto_24320 ?auto_24321 )
      ( MAKE-ON-VERIFY ?auto_24320 ?auto_24321 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24339 - SURFACE
      ?auto_24340 - SURFACE
    )
    :vars
    (
      ?auto_24357 - HOIST
      ?auto_24353 - PLACE
      ?auto_24352 - PLACE
      ?auto_24344 - HOIST
      ?auto_24348 - SURFACE
      ?auto_24346 - SURFACE
      ?auto_24345 - PLACE
      ?auto_24341 - HOIST
      ?auto_24347 - SURFACE
      ?auto_24343 - SURFACE
      ?auto_24355 - PLACE
      ?auto_24354 - HOIST
      ?auto_24351 - SURFACE
      ?auto_24342 - SURFACE
      ?auto_24350 - SURFACE
      ?auto_24356 - SURFACE
      ?auto_24349 - TRUCK
      ?auto_24358 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24357 ?auto_24353 ) ( IS-CRATE ?auto_24339 ) ( not ( = ?auto_24339 ?auto_24340 ) ) ( not ( = ?auto_24352 ?auto_24353 ) ) ( HOIST-AT ?auto_24344 ?auto_24352 ) ( not ( = ?auto_24357 ?auto_24344 ) ) ( SURFACE-AT ?auto_24339 ?auto_24352 ) ( ON ?auto_24339 ?auto_24348 ) ( CLEAR ?auto_24339 ) ( not ( = ?auto_24339 ?auto_24348 ) ) ( not ( = ?auto_24340 ?auto_24348 ) ) ( IS-CRATE ?auto_24340 ) ( not ( = ?auto_24339 ?auto_24346 ) ) ( not ( = ?auto_24340 ?auto_24346 ) ) ( not ( = ?auto_24348 ?auto_24346 ) ) ( not ( = ?auto_24345 ?auto_24353 ) ) ( not ( = ?auto_24352 ?auto_24345 ) ) ( HOIST-AT ?auto_24341 ?auto_24345 ) ( not ( = ?auto_24357 ?auto_24341 ) ) ( not ( = ?auto_24344 ?auto_24341 ) ) ( AVAILABLE ?auto_24341 ) ( SURFACE-AT ?auto_24340 ?auto_24345 ) ( ON ?auto_24340 ?auto_24347 ) ( CLEAR ?auto_24340 ) ( not ( = ?auto_24339 ?auto_24347 ) ) ( not ( = ?auto_24340 ?auto_24347 ) ) ( not ( = ?auto_24348 ?auto_24347 ) ) ( not ( = ?auto_24346 ?auto_24347 ) ) ( IS-CRATE ?auto_24346 ) ( not ( = ?auto_24339 ?auto_24343 ) ) ( not ( = ?auto_24340 ?auto_24343 ) ) ( not ( = ?auto_24348 ?auto_24343 ) ) ( not ( = ?auto_24346 ?auto_24343 ) ) ( not ( = ?auto_24347 ?auto_24343 ) ) ( not ( = ?auto_24355 ?auto_24353 ) ) ( not ( = ?auto_24352 ?auto_24355 ) ) ( not ( = ?auto_24345 ?auto_24355 ) ) ( HOIST-AT ?auto_24354 ?auto_24355 ) ( not ( = ?auto_24357 ?auto_24354 ) ) ( not ( = ?auto_24344 ?auto_24354 ) ) ( not ( = ?auto_24341 ?auto_24354 ) ) ( SURFACE-AT ?auto_24346 ?auto_24355 ) ( ON ?auto_24346 ?auto_24351 ) ( CLEAR ?auto_24346 ) ( not ( = ?auto_24339 ?auto_24351 ) ) ( not ( = ?auto_24340 ?auto_24351 ) ) ( not ( = ?auto_24348 ?auto_24351 ) ) ( not ( = ?auto_24346 ?auto_24351 ) ) ( not ( = ?auto_24347 ?auto_24351 ) ) ( not ( = ?auto_24343 ?auto_24351 ) ) ( IS-CRATE ?auto_24343 ) ( not ( = ?auto_24339 ?auto_24342 ) ) ( not ( = ?auto_24340 ?auto_24342 ) ) ( not ( = ?auto_24348 ?auto_24342 ) ) ( not ( = ?auto_24346 ?auto_24342 ) ) ( not ( = ?auto_24347 ?auto_24342 ) ) ( not ( = ?auto_24343 ?auto_24342 ) ) ( not ( = ?auto_24351 ?auto_24342 ) ) ( AVAILABLE ?auto_24344 ) ( SURFACE-AT ?auto_24343 ?auto_24352 ) ( ON ?auto_24343 ?auto_24350 ) ( CLEAR ?auto_24343 ) ( not ( = ?auto_24339 ?auto_24350 ) ) ( not ( = ?auto_24340 ?auto_24350 ) ) ( not ( = ?auto_24348 ?auto_24350 ) ) ( not ( = ?auto_24346 ?auto_24350 ) ) ( not ( = ?auto_24347 ?auto_24350 ) ) ( not ( = ?auto_24343 ?auto_24350 ) ) ( not ( = ?auto_24351 ?auto_24350 ) ) ( not ( = ?auto_24342 ?auto_24350 ) ) ( SURFACE-AT ?auto_24356 ?auto_24353 ) ( CLEAR ?auto_24356 ) ( IS-CRATE ?auto_24342 ) ( not ( = ?auto_24339 ?auto_24356 ) ) ( not ( = ?auto_24340 ?auto_24356 ) ) ( not ( = ?auto_24348 ?auto_24356 ) ) ( not ( = ?auto_24346 ?auto_24356 ) ) ( not ( = ?auto_24347 ?auto_24356 ) ) ( not ( = ?auto_24343 ?auto_24356 ) ) ( not ( = ?auto_24351 ?auto_24356 ) ) ( not ( = ?auto_24342 ?auto_24356 ) ) ( not ( = ?auto_24350 ?auto_24356 ) ) ( AVAILABLE ?auto_24357 ) ( TRUCK-AT ?auto_24349 ?auto_24355 ) ( AVAILABLE ?auto_24354 ) ( SURFACE-AT ?auto_24342 ?auto_24355 ) ( ON ?auto_24342 ?auto_24358 ) ( CLEAR ?auto_24342 ) ( not ( = ?auto_24339 ?auto_24358 ) ) ( not ( = ?auto_24340 ?auto_24358 ) ) ( not ( = ?auto_24348 ?auto_24358 ) ) ( not ( = ?auto_24346 ?auto_24358 ) ) ( not ( = ?auto_24347 ?auto_24358 ) ) ( not ( = ?auto_24343 ?auto_24358 ) ) ( not ( = ?auto_24351 ?auto_24358 ) ) ( not ( = ?auto_24342 ?auto_24358 ) ) ( not ( = ?auto_24350 ?auto_24358 ) ) ( not ( = ?auto_24356 ?auto_24358 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24354 ?auto_24342 ?auto_24358 ?auto_24355 )
      ( MAKE-ON ?auto_24339 ?auto_24340 )
      ( MAKE-ON-VERIFY ?auto_24339 ?auto_24340 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24359 - SURFACE
      ?auto_24360 - SURFACE
    )
    :vars
    (
      ?auto_24364 - HOIST
      ?auto_24374 - PLACE
      ?auto_24363 - PLACE
      ?auto_24373 - HOIST
      ?auto_24369 - SURFACE
      ?auto_24375 - SURFACE
      ?auto_24362 - PLACE
      ?auto_24365 - HOIST
      ?auto_24366 - SURFACE
      ?auto_24371 - SURFACE
      ?auto_24372 - PLACE
      ?auto_24377 - HOIST
      ?auto_24367 - SURFACE
      ?auto_24376 - SURFACE
      ?auto_24368 - SURFACE
      ?auto_24378 - SURFACE
      ?auto_24370 - SURFACE
      ?auto_24361 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24364 ?auto_24374 ) ( IS-CRATE ?auto_24359 ) ( not ( = ?auto_24359 ?auto_24360 ) ) ( not ( = ?auto_24363 ?auto_24374 ) ) ( HOIST-AT ?auto_24373 ?auto_24363 ) ( not ( = ?auto_24364 ?auto_24373 ) ) ( SURFACE-AT ?auto_24359 ?auto_24363 ) ( ON ?auto_24359 ?auto_24369 ) ( CLEAR ?auto_24359 ) ( not ( = ?auto_24359 ?auto_24369 ) ) ( not ( = ?auto_24360 ?auto_24369 ) ) ( IS-CRATE ?auto_24360 ) ( not ( = ?auto_24359 ?auto_24375 ) ) ( not ( = ?auto_24360 ?auto_24375 ) ) ( not ( = ?auto_24369 ?auto_24375 ) ) ( not ( = ?auto_24362 ?auto_24374 ) ) ( not ( = ?auto_24363 ?auto_24362 ) ) ( HOIST-AT ?auto_24365 ?auto_24362 ) ( not ( = ?auto_24364 ?auto_24365 ) ) ( not ( = ?auto_24373 ?auto_24365 ) ) ( AVAILABLE ?auto_24365 ) ( SURFACE-AT ?auto_24360 ?auto_24362 ) ( ON ?auto_24360 ?auto_24366 ) ( CLEAR ?auto_24360 ) ( not ( = ?auto_24359 ?auto_24366 ) ) ( not ( = ?auto_24360 ?auto_24366 ) ) ( not ( = ?auto_24369 ?auto_24366 ) ) ( not ( = ?auto_24375 ?auto_24366 ) ) ( IS-CRATE ?auto_24375 ) ( not ( = ?auto_24359 ?auto_24371 ) ) ( not ( = ?auto_24360 ?auto_24371 ) ) ( not ( = ?auto_24369 ?auto_24371 ) ) ( not ( = ?auto_24375 ?auto_24371 ) ) ( not ( = ?auto_24366 ?auto_24371 ) ) ( not ( = ?auto_24372 ?auto_24374 ) ) ( not ( = ?auto_24363 ?auto_24372 ) ) ( not ( = ?auto_24362 ?auto_24372 ) ) ( HOIST-AT ?auto_24377 ?auto_24372 ) ( not ( = ?auto_24364 ?auto_24377 ) ) ( not ( = ?auto_24373 ?auto_24377 ) ) ( not ( = ?auto_24365 ?auto_24377 ) ) ( SURFACE-AT ?auto_24375 ?auto_24372 ) ( ON ?auto_24375 ?auto_24367 ) ( CLEAR ?auto_24375 ) ( not ( = ?auto_24359 ?auto_24367 ) ) ( not ( = ?auto_24360 ?auto_24367 ) ) ( not ( = ?auto_24369 ?auto_24367 ) ) ( not ( = ?auto_24375 ?auto_24367 ) ) ( not ( = ?auto_24366 ?auto_24367 ) ) ( not ( = ?auto_24371 ?auto_24367 ) ) ( IS-CRATE ?auto_24371 ) ( not ( = ?auto_24359 ?auto_24376 ) ) ( not ( = ?auto_24360 ?auto_24376 ) ) ( not ( = ?auto_24369 ?auto_24376 ) ) ( not ( = ?auto_24375 ?auto_24376 ) ) ( not ( = ?auto_24366 ?auto_24376 ) ) ( not ( = ?auto_24371 ?auto_24376 ) ) ( not ( = ?auto_24367 ?auto_24376 ) ) ( AVAILABLE ?auto_24373 ) ( SURFACE-AT ?auto_24371 ?auto_24363 ) ( ON ?auto_24371 ?auto_24368 ) ( CLEAR ?auto_24371 ) ( not ( = ?auto_24359 ?auto_24368 ) ) ( not ( = ?auto_24360 ?auto_24368 ) ) ( not ( = ?auto_24369 ?auto_24368 ) ) ( not ( = ?auto_24375 ?auto_24368 ) ) ( not ( = ?auto_24366 ?auto_24368 ) ) ( not ( = ?auto_24371 ?auto_24368 ) ) ( not ( = ?auto_24367 ?auto_24368 ) ) ( not ( = ?auto_24376 ?auto_24368 ) ) ( SURFACE-AT ?auto_24378 ?auto_24374 ) ( CLEAR ?auto_24378 ) ( IS-CRATE ?auto_24376 ) ( not ( = ?auto_24359 ?auto_24378 ) ) ( not ( = ?auto_24360 ?auto_24378 ) ) ( not ( = ?auto_24369 ?auto_24378 ) ) ( not ( = ?auto_24375 ?auto_24378 ) ) ( not ( = ?auto_24366 ?auto_24378 ) ) ( not ( = ?auto_24371 ?auto_24378 ) ) ( not ( = ?auto_24367 ?auto_24378 ) ) ( not ( = ?auto_24376 ?auto_24378 ) ) ( not ( = ?auto_24368 ?auto_24378 ) ) ( AVAILABLE ?auto_24364 ) ( AVAILABLE ?auto_24377 ) ( SURFACE-AT ?auto_24376 ?auto_24372 ) ( ON ?auto_24376 ?auto_24370 ) ( CLEAR ?auto_24376 ) ( not ( = ?auto_24359 ?auto_24370 ) ) ( not ( = ?auto_24360 ?auto_24370 ) ) ( not ( = ?auto_24369 ?auto_24370 ) ) ( not ( = ?auto_24375 ?auto_24370 ) ) ( not ( = ?auto_24366 ?auto_24370 ) ) ( not ( = ?auto_24371 ?auto_24370 ) ) ( not ( = ?auto_24367 ?auto_24370 ) ) ( not ( = ?auto_24376 ?auto_24370 ) ) ( not ( = ?auto_24368 ?auto_24370 ) ) ( not ( = ?auto_24378 ?auto_24370 ) ) ( TRUCK-AT ?auto_24361 ?auto_24374 ) )
    :subtasks
    ( ( !DRIVE ?auto_24361 ?auto_24374 ?auto_24372 )
      ( MAKE-ON ?auto_24359 ?auto_24360 )
      ( MAKE-ON-VERIFY ?auto_24359 ?auto_24360 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24379 - SURFACE
      ?auto_24380 - SURFACE
    )
    :vars
    (
      ?auto_24389 - HOIST
      ?auto_24390 - PLACE
      ?auto_24394 - PLACE
      ?auto_24382 - HOIST
      ?auto_24397 - SURFACE
      ?auto_24396 - SURFACE
      ?auto_24388 - PLACE
      ?auto_24384 - HOIST
      ?auto_24387 - SURFACE
      ?auto_24391 - SURFACE
      ?auto_24393 - PLACE
      ?auto_24385 - HOIST
      ?auto_24392 - SURFACE
      ?auto_24381 - SURFACE
      ?auto_24398 - SURFACE
      ?auto_24386 - SURFACE
      ?auto_24383 - SURFACE
      ?auto_24395 - TRUCK
      ?auto_24399 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24389 ?auto_24390 ) ( IS-CRATE ?auto_24379 ) ( not ( = ?auto_24379 ?auto_24380 ) ) ( not ( = ?auto_24394 ?auto_24390 ) ) ( HOIST-AT ?auto_24382 ?auto_24394 ) ( not ( = ?auto_24389 ?auto_24382 ) ) ( SURFACE-AT ?auto_24379 ?auto_24394 ) ( ON ?auto_24379 ?auto_24397 ) ( CLEAR ?auto_24379 ) ( not ( = ?auto_24379 ?auto_24397 ) ) ( not ( = ?auto_24380 ?auto_24397 ) ) ( IS-CRATE ?auto_24380 ) ( not ( = ?auto_24379 ?auto_24396 ) ) ( not ( = ?auto_24380 ?auto_24396 ) ) ( not ( = ?auto_24397 ?auto_24396 ) ) ( not ( = ?auto_24388 ?auto_24390 ) ) ( not ( = ?auto_24394 ?auto_24388 ) ) ( HOIST-AT ?auto_24384 ?auto_24388 ) ( not ( = ?auto_24389 ?auto_24384 ) ) ( not ( = ?auto_24382 ?auto_24384 ) ) ( AVAILABLE ?auto_24384 ) ( SURFACE-AT ?auto_24380 ?auto_24388 ) ( ON ?auto_24380 ?auto_24387 ) ( CLEAR ?auto_24380 ) ( not ( = ?auto_24379 ?auto_24387 ) ) ( not ( = ?auto_24380 ?auto_24387 ) ) ( not ( = ?auto_24397 ?auto_24387 ) ) ( not ( = ?auto_24396 ?auto_24387 ) ) ( IS-CRATE ?auto_24396 ) ( not ( = ?auto_24379 ?auto_24391 ) ) ( not ( = ?auto_24380 ?auto_24391 ) ) ( not ( = ?auto_24397 ?auto_24391 ) ) ( not ( = ?auto_24396 ?auto_24391 ) ) ( not ( = ?auto_24387 ?auto_24391 ) ) ( not ( = ?auto_24393 ?auto_24390 ) ) ( not ( = ?auto_24394 ?auto_24393 ) ) ( not ( = ?auto_24388 ?auto_24393 ) ) ( HOIST-AT ?auto_24385 ?auto_24393 ) ( not ( = ?auto_24389 ?auto_24385 ) ) ( not ( = ?auto_24382 ?auto_24385 ) ) ( not ( = ?auto_24384 ?auto_24385 ) ) ( SURFACE-AT ?auto_24396 ?auto_24393 ) ( ON ?auto_24396 ?auto_24392 ) ( CLEAR ?auto_24396 ) ( not ( = ?auto_24379 ?auto_24392 ) ) ( not ( = ?auto_24380 ?auto_24392 ) ) ( not ( = ?auto_24397 ?auto_24392 ) ) ( not ( = ?auto_24396 ?auto_24392 ) ) ( not ( = ?auto_24387 ?auto_24392 ) ) ( not ( = ?auto_24391 ?auto_24392 ) ) ( IS-CRATE ?auto_24391 ) ( not ( = ?auto_24379 ?auto_24381 ) ) ( not ( = ?auto_24380 ?auto_24381 ) ) ( not ( = ?auto_24397 ?auto_24381 ) ) ( not ( = ?auto_24396 ?auto_24381 ) ) ( not ( = ?auto_24387 ?auto_24381 ) ) ( not ( = ?auto_24391 ?auto_24381 ) ) ( not ( = ?auto_24392 ?auto_24381 ) ) ( AVAILABLE ?auto_24382 ) ( SURFACE-AT ?auto_24391 ?auto_24394 ) ( ON ?auto_24391 ?auto_24398 ) ( CLEAR ?auto_24391 ) ( not ( = ?auto_24379 ?auto_24398 ) ) ( not ( = ?auto_24380 ?auto_24398 ) ) ( not ( = ?auto_24397 ?auto_24398 ) ) ( not ( = ?auto_24396 ?auto_24398 ) ) ( not ( = ?auto_24387 ?auto_24398 ) ) ( not ( = ?auto_24391 ?auto_24398 ) ) ( not ( = ?auto_24392 ?auto_24398 ) ) ( not ( = ?auto_24381 ?auto_24398 ) ) ( IS-CRATE ?auto_24381 ) ( not ( = ?auto_24379 ?auto_24386 ) ) ( not ( = ?auto_24380 ?auto_24386 ) ) ( not ( = ?auto_24397 ?auto_24386 ) ) ( not ( = ?auto_24396 ?auto_24386 ) ) ( not ( = ?auto_24387 ?auto_24386 ) ) ( not ( = ?auto_24391 ?auto_24386 ) ) ( not ( = ?auto_24392 ?auto_24386 ) ) ( not ( = ?auto_24381 ?auto_24386 ) ) ( not ( = ?auto_24398 ?auto_24386 ) ) ( AVAILABLE ?auto_24385 ) ( SURFACE-AT ?auto_24381 ?auto_24393 ) ( ON ?auto_24381 ?auto_24383 ) ( CLEAR ?auto_24381 ) ( not ( = ?auto_24379 ?auto_24383 ) ) ( not ( = ?auto_24380 ?auto_24383 ) ) ( not ( = ?auto_24397 ?auto_24383 ) ) ( not ( = ?auto_24396 ?auto_24383 ) ) ( not ( = ?auto_24387 ?auto_24383 ) ) ( not ( = ?auto_24391 ?auto_24383 ) ) ( not ( = ?auto_24392 ?auto_24383 ) ) ( not ( = ?auto_24381 ?auto_24383 ) ) ( not ( = ?auto_24398 ?auto_24383 ) ) ( not ( = ?auto_24386 ?auto_24383 ) ) ( TRUCK-AT ?auto_24395 ?auto_24390 ) ( SURFACE-AT ?auto_24399 ?auto_24390 ) ( CLEAR ?auto_24399 ) ( LIFTING ?auto_24389 ?auto_24386 ) ( IS-CRATE ?auto_24386 ) ( not ( = ?auto_24379 ?auto_24399 ) ) ( not ( = ?auto_24380 ?auto_24399 ) ) ( not ( = ?auto_24397 ?auto_24399 ) ) ( not ( = ?auto_24396 ?auto_24399 ) ) ( not ( = ?auto_24387 ?auto_24399 ) ) ( not ( = ?auto_24391 ?auto_24399 ) ) ( not ( = ?auto_24392 ?auto_24399 ) ) ( not ( = ?auto_24381 ?auto_24399 ) ) ( not ( = ?auto_24398 ?auto_24399 ) ) ( not ( = ?auto_24386 ?auto_24399 ) ) ( not ( = ?auto_24383 ?auto_24399 ) ) )
    :subtasks
    ( ( !DROP ?auto_24389 ?auto_24386 ?auto_24399 ?auto_24390 )
      ( MAKE-ON ?auto_24379 ?auto_24380 )
      ( MAKE-ON-VERIFY ?auto_24379 ?auto_24380 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24400 - SURFACE
      ?auto_24401 - SURFACE
    )
    :vars
    (
      ?auto_24410 - HOIST
      ?auto_24420 - PLACE
      ?auto_24418 - PLACE
      ?auto_24416 - HOIST
      ?auto_24403 - SURFACE
      ?auto_24405 - SURFACE
      ?auto_24406 - PLACE
      ?auto_24409 - HOIST
      ?auto_24413 - SURFACE
      ?auto_24419 - SURFACE
      ?auto_24408 - PLACE
      ?auto_24417 - HOIST
      ?auto_24415 - SURFACE
      ?auto_24404 - SURFACE
      ?auto_24402 - SURFACE
      ?auto_24407 - SURFACE
      ?auto_24411 - SURFACE
      ?auto_24412 - TRUCK
      ?auto_24414 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24410 ?auto_24420 ) ( IS-CRATE ?auto_24400 ) ( not ( = ?auto_24400 ?auto_24401 ) ) ( not ( = ?auto_24418 ?auto_24420 ) ) ( HOIST-AT ?auto_24416 ?auto_24418 ) ( not ( = ?auto_24410 ?auto_24416 ) ) ( SURFACE-AT ?auto_24400 ?auto_24418 ) ( ON ?auto_24400 ?auto_24403 ) ( CLEAR ?auto_24400 ) ( not ( = ?auto_24400 ?auto_24403 ) ) ( not ( = ?auto_24401 ?auto_24403 ) ) ( IS-CRATE ?auto_24401 ) ( not ( = ?auto_24400 ?auto_24405 ) ) ( not ( = ?auto_24401 ?auto_24405 ) ) ( not ( = ?auto_24403 ?auto_24405 ) ) ( not ( = ?auto_24406 ?auto_24420 ) ) ( not ( = ?auto_24418 ?auto_24406 ) ) ( HOIST-AT ?auto_24409 ?auto_24406 ) ( not ( = ?auto_24410 ?auto_24409 ) ) ( not ( = ?auto_24416 ?auto_24409 ) ) ( AVAILABLE ?auto_24409 ) ( SURFACE-AT ?auto_24401 ?auto_24406 ) ( ON ?auto_24401 ?auto_24413 ) ( CLEAR ?auto_24401 ) ( not ( = ?auto_24400 ?auto_24413 ) ) ( not ( = ?auto_24401 ?auto_24413 ) ) ( not ( = ?auto_24403 ?auto_24413 ) ) ( not ( = ?auto_24405 ?auto_24413 ) ) ( IS-CRATE ?auto_24405 ) ( not ( = ?auto_24400 ?auto_24419 ) ) ( not ( = ?auto_24401 ?auto_24419 ) ) ( not ( = ?auto_24403 ?auto_24419 ) ) ( not ( = ?auto_24405 ?auto_24419 ) ) ( not ( = ?auto_24413 ?auto_24419 ) ) ( not ( = ?auto_24408 ?auto_24420 ) ) ( not ( = ?auto_24418 ?auto_24408 ) ) ( not ( = ?auto_24406 ?auto_24408 ) ) ( HOIST-AT ?auto_24417 ?auto_24408 ) ( not ( = ?auto_24410 ?auto_24417 ) ) ( not ( = ?auto_24416 ?auto_24417 ) ) ( not ( = ?auto_24409 ?auto_24417 ) ) ( SURFACE-AT ?auto_24405 ?auto_24408 ) ( ON ?auto_24405 ?auto_24415 ) ( CLEAR ?auto_24405 ) ( not ( = ?auto_24400 ?auto_24415 ) ) ( not ( = ?auto_24401 ?auto_24415 ) ) ( not ( = ?auto_24403 ?auto_24415 ) ) ( not ( = ?auto_24405 ?auto_24415 ) ) ( not ( = ?auto_24413 ?auto_24415 ) ) ( not ( = ?auto_24419 ?auto_24415 ) ) ( IS-CRATE ?auto_24419 ) ( not ( = ?auto_24400 ?auto_24404 ) ) ( not ( = ?auto_24401 ?auto_24404 ) ) ( not ( = ?auto_24403 ?auto_24404 ) ) ( not ( = ?auto_24405 ?auto_24404 ) ) ( not ( = ?auto_24413 ?auto_24404 ) ) ( not ( = ?auto_24419 ?auto_24404 ) ) ( not ( = ?auto_24415 ?auto_24404 ) ) ( AVAILABLE ?auto_24416 ) ( SURFACE-AT ?auto_24419 ?auto_24418 ) ( ON ?auto_24419 ?auto_24402 ) ( CLEAR ?auto_24419 ) ( not ( = ?auto_24400 ?auto_24402 ) ) ( not ( = ?auto_24401 ?auto_24402 ) ) ( not ( = ?auto_24403 ?auto_24402 ) ) ( not ( = ?auto_24405 ?auto_24402 ) ) ( not ( = ?auto_24413 ?auto_24402 ) ) ( not ( = ?auto_24419 ?auto_24402 ) ) ( not ( = ?auto_24415 ?auto_24402 ) ) ( not ( = ?auto_24404 ?auto_24402 ) ) ( IS-CRATE ?auto_24404 ) ( not ( = ?auto_24400 ?auto_24407 ) ) ( not ( = ?auto_24401 ?auto_24407 ) ) ( not ( = ?auto_24403 ?auto_24407 ) ) ( not ( = ?auto_24405 ?auto_24407 ) ) ( not ( = ?auto_24413 ?auto_24407 ) ) ( not ( = ?auto_24419 ?auto_24407 ) ) ( not ( = ?auto_24415 ?auto_24407 ) ) ( not ( = ?auto_24404 ?auto_24407 ) ) ( not ( = ?auto_24402 ?auto_24407 ) ) ( AVAILABLE ?auto_24417 ) ( SURFACE-AT ?auto_24404 ?auto_24408 ) ( ON ?auto_24404 ?auto_24411 ) ( CLEAR ?auto_24404 ) ( not ( = ?auto_24400 ?auto_24411 ) ) ( not ( = ?auto_24401 ?auto_24411 ) ) ( not ( = ?auto_24403 ?auto_24411 ) ) ( not ( = ?auto_24405 ?auto_24411 ) ) ( not ( = ?auto_24413 ?auto_24411 ) ) ( not ( = ?auto_24419 ?auto_24411 ) ) ( not ( = ?auto_24415 ?auto_24411 ) ) ( not ( = ?auto_24404 ?auto_24411 ) ) ( not ( = ?auto_24402 ?auto_24411 ) ) ( not ( = ?auto_24407 ?auto_24411 ) ) ( TRUCK-AT ?auto_24412 ?auto_24420 ) ( SURFACE-AT ?auto_24414 ?auto_24420 ) ( CLEAR ?auto_24414 ) ( IS-CRATE ?auto_24407 ) ( not ( = ?auto_24400 ?auto_24414 ) ) ( not ( = ?auto_24401 ?auto_24414 ) ) ( not ( = ?auto_24403 ?auto_24414 ) ) ( not ( = ?auto_24405 ?auto_24414 ) ) ( not ( = ?auto_24413 ?auto_24414 ) ) ( not ( = ?auto_24419 ?auto_24414 ) ) ( not ( = ?auto_24415 ?auto_24414 ) ) ( not ( = ?auto_24404 ?auto_24414 ) ) ( not ( = ?auto_24402 ?auto_24414 ) ) ( not ( = ?auto_24407 ?auto_24414 ) ) ( not ( = ?auto_24411 ?auto_24414 ) ) ( AVAILABLE ?auto_24410 ) ( IN ?auto_24407 ?auto_24412 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24410 ?auto_24407 ?auto_24412 ?auto_24420 )
      ( MAKE-ON ?auto_24400 ?auto_24401 )
      ( MAKE-ON-VERIFY ?auto_24400 ?auto_24401 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24421 - SURFACE
      ?auto_24422 - SURFACE
    )
    :vars
    (
      ?auto_24426 - HOIST
      ?auto_24437 - PLACE
      ?auto_24435 - PLACE
      ?auto_24423 - HOIST
      ?auto_24427 - SURFACE
      ?auto_24439 - SURFACE
      ?auto_24441 - PLACE
      ?auto_24430 - HOIST
      ?auto_24431 - SURFACE
      ?auto_24438 - SURFACE
      ?auto_24425 - PLACE
      ?auto_24436 - HOIST
      ?auto_24432 - SURFACE
      ?auto_24433 - SURFACE
      ?auto_24434 - SURFACE
      ?auto_24428 - SURFACE
      ?auto_24440 - SURFACE
      ?auto_24424 - SURFACE
      ?auto_24429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24426 ?auto_24437 ) ( IS-CRATE ?auto_24421 ) ( not ( = ?auto_24421 ?auto_24422 ) ) ( not ( = ?auto_24435 ?auto_24437 ) ) ( HOIST-AT ?auto_24423 ?auto_24435 ) ( not ( = ?auto_24426 ?auto_24423 ) ) ( SURFACE-AT ?auto_24421 ?auto_24435 ) ( ON ?auto_24421 ?auto_24427 ) ( CLEAR ?auto_24421 ) ( not ( = ?auto_24421 ?auto_24427 ) ) ( not ( = ?auto_24422 ?auto_24427 ) ) ( IS-CRATE ?auto_24422 ) ( not ( = ?auto_24421 ?auto_24439 ) ) ( not ( = ?auto_24422 ?auto_24439 ) ) ( not ( = ?auto_24427 ?auto_24439 ) ) ( not ( = ?auto_24441 ?auto_24437 ) ) ( not ( = ?auto_24435 ?auto_24441 ) ) ( HOIST-AT ?auto_24430 ?auto_24441 ) ( not ( = ?auto_24426 ?auto_24430 ) ) ( not ( = ?auto_24423 ?auto_24430 ) ) ( AVAILABLE ?auto_24430 ) ( SURFACE-AT ?auto_24422 ?auto_24441 ) ( ON ?auto_24422 ?auto_24431 ) ( CLEAR ?auto_24422 ) ( not ( = ?auto_24421 ?auto_24431 ) ) ( not ( = ?auto_24422 ?auto_24431 ) ) ( not ( = ?auto_24427 ?auto_24431 ) ) ( not ( = ?auto_24439 ?auto_24431 ) ) ( IS-CRATE ?auto_24439 ) ( not ( = ?auto_24421 ?auto_24438 ) ) ( not ( = ?auto_24422 ?auto_24438 ) ) ( not ( = ?auto_24427 ?auto_24438 ) ) ( not ( = ?auto_24439 ?auto_24438 ) ) ( not ( = ?auto_24431 ?auto_24438 ) ) ( not ( = ?auto_24425 ?auto_24437 ) ) ( not ( = ?auto_24435 ?auto_24425 ) ) ( not ( = ?auto_24441 ?auto_24425 ) ) ( HOIST-AT ?auto_24436 ?auto_24425 ) ( not ( = ?auto_24426 ?auto_24436 ) ) ( not ( = ?auto_24423 ?auto_24436 ) ) ( not ( = ?auto_24430 ?auto_24436 ) ) ( SURFACE-AT ?auto_24439 ?auto_24425 ) ( ON ?auto_24439 ?auto_24432 ) ( CLEAR ?auto_24439 ) ( not ( = ?auto_24421 ?auto_24432 ) ) ( not ( = ?auto_24422 ?auto_24432 ) ) ( not ( = ?auto_24427 ?auto_24432 ) ) ( not ( = ?auto_24439 ?auto_24432 ) ) ( not ( = ?auto_24431 ?auto_24432 ) ) ( not ( = ?auto_24438 ?auto_24432 ) ) ( IS-CRATE ?auto_24438 ) ( not ( = ?auto_24421 ?auto_24433 ) ) ( not ( = ?auto_24422 ?auto_24433 ) ) ( not ( = ?auto_24427 ?auto_24433 ) ) ( not ( = ?auto_24439 ?auto_24433 ) ) ( not ( = ?auto_24431 ?auto_24433 ) ) ( not ( = ?auto_24438 ?auto_24433 ) ) ( not ( = ?auto_24432 ?auto_24433 ) ) ( AVAILABLE ?auto_24423 ) ( SURFACE-AT ?auto_24438 ?auto_24435 ) ( ON ?auto_24438 ?auto_24434 ) ( CLEAR ?auto_24438 ) ( not ( = ?auto_24421 ?auto_24434 ) ) ( not ( = ?auto_24422 ?auto_24434 ) ) ( not ( = ?auto_24427 ?auto_24434 ) ) ( not ( = ?auto_24439 ?auto_24434 ) ) ( not ( = ?auto_24431 ?auto_24434 ) ) ( not ( = ?auto_24438 ?auto_24434 ) ) ( not ( = ?auto_24432 ?auto_24434 ) ) ( not ( = ?auto_24433 ?auto_24434 ) ) ( IS-CRATE ?auto_24433 ) ( not ( = ?auto_24421 ?auto_24428 ) ) ( not ( = ?auto_24422 ?auto_24428 ) ) ( not ( = ?auto_24427 ?auto_24428 ) ) ( not ( = ?auto_24439 ?auto_24428 ) ) ( not ( = ?auto_24431 ?auto_24428 ) ) ( not ( = ?auto_24438 ?auto_24428 ) ) ( not ( = ?auto_24432 ?auto_24428 ) ) ( not ( = ?auto_24433 ?auto_24428 ) ) ( not ( = ?auto_24434 ?auto_24428 ) ) ( AVAILABLE ?auto_24436 ) ( SURFACE-AT ?auto_24433 ?auto_24425 ) ( ON ?auto_24433 ?auto_24440 ) ( CLEAR ?auto_24433 ) ( not ( = ?auto_24421 ?auto_24440 ) ) ( not ( = ?auto_24422 ?auto_24440 ) ) ( not ( = ?auto_24427 ?auto_24440 ) ) ( not ( = ?auto_24439 ?auto_24440 ) ) ( not ( = ?auto_24431 ?auto_24440 ) ) ( not ( = ?auto_24438 ?auto_24440 ) ) ( not ( = ?auto_24432 ?auto_24440 ) ) ( not ( = ?auto_24433 ?auto_24440 ) ) ( not ( = ?auto_24434 ?auto_24440 ) ) ( not ( = ?auto_24428 ?auto_24440 ) ) ( SURFACE-AT ?auto_24424 ?auto_24437 ) ( CLEAR ?auto_24424 ) ( IS-CRATE ?auto_24428 ) ( not ( = ?auto_24421 ?auto_24424 ) ) ( not ( = ?auto_24422 ?auto_24424 ) ) ( not ( = ?auto_24427 ?auto_24424 ) ) ( not ( = ?auto_24439 ?auto_24424 ) ) ( not ( = ?auto_24431 ?auto_24424 ) ) ( not ( = ?auto_24438 ?auto_24424 ) ) ( not ( = ?auto_24432 ?auto_24424 ) ) ( not ( = ?auto_24433 ?auto_24424 ) ) ( not ( = ?auto_24434 ?auto_24424 ) ) ( not ( = ?auto_24428 ?auto_24424 ) ) ( not ( = ?auto_24440 ?auto_24424 ) ) ( AVAILABLE ?auto_24426 ) ( IN ?auto_24428 ?auto_24429 ) ( TRUCK-AT ?auto_24429 ?auto_24425 ) )
    :subtasks
    ( ( !DRIVE ?auto_24429 ?auto_24425 ?auto_24437 )
      ( MAKE-ON ?auto_24421 ?auto_24422 )
      ( MAKE-ON-VERIFY ?auto_24421 ?auto_24422 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24442 - SURFACE
      ?auto_24443 - SURFACE
    )
    :vars
    (
      ?auto_24444 - HOIST
      ?auto_24456 - PLACE
      ?auto_24449 - PLACE
      ?auto_24452 - HOIST
      ?auto_24453 - SURFACE
      ?auto_24446 - SURFACE
      ?auto_24445 - PLACE
      ?auto_24454 - HOIST
      ?auto_24455 - SURFACE
      ?auto_24451 - SURFACE
      ?auto_24450 - PLACE
      ?auto_24462 - HOIST
      ?auto_24459 - SURFACE
      ?auto_24458 - SURFACE
      ?auto_24460 - SURFACE
      ?auto_24448 - SURFACE
      ?auto_24447 - SURFACE
      ?auto_24457 - SURFACE
      ?auto_24461 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24444 ?auto_24456 ) ( IS-CRATE ?auto_24442 ) ( not ( = ?auto_24442 ?auto_24443 ) ) ( not ( = ?auto_24449 ?auto_24456 ) ) ( HOIST-AT ?auto_24452 ?auto_24449 ) ( not ( = ?auto_24444 ?auto_24452 ) ) ( SURFACE-AT ?auto_24442 ?auto_24449 ) ( ON ?auto_24442 ?auto_24453 ) ( CLEAR ?auto_24442 ) ( not ( = ?auto_24442 ?auto_24453 ) ) ( not ( = ?auto_24443 ?auto_24453 ) ) ( IS-CRATE ?auto_24443 ) ( not ( = ?auto_24442 ?auto_24446 ) ) ( not ( = ?auto_24443 ?auto_24446 ) ) ( not ( = ?auto_24453 ?auto_24446 ) ) ( not ( = ?auto_24445 ?auto_24456 ) ) ( not ( = ?auto_24449 ?auto_24445 ) ) ( HOIST-AT ?auto_24454 ?auto_24445 ) ( not ( = ?auto_24444 ?auto_24454 ) ) ( not ( = ?auto_24452 ?auto_24454 ) ) ( AVAILABLE ?auto_24454 ) ( SURFACE-AT ?auto_24443 ?auto_24445 ) ( ON ?auto_24443 ?auto_24455 ) ( CLEAR ?auto_24443 ) ( not ( = ?auto_24442 ?auto_24455 ) ) ( not ( = ?auto_24443 ?auto_24455 ) ) ( not ( = ?auto_24453 ?auto_24455 ) ) ( not ( = ?auto_24446 ?auto_24455 ) ) ( IS-CRATE ?auto_24446 ) ( not ( = ?auto_24442 ?auto_24451 ) ) ( not ( = ?auto_24443 ?auto_24451 ) ) ( not ( = ?auto_24453 ?auto_24451 ) ) ( not ( = ?auto_24446 ?auto_24451 ) ) ( not ( = ?auto_24455 ?auto_24451 ) ) ( not ( = ?auto_24450 ?auto_24456 ) ) ( not ( = ?auto_24449 ?auto_24450 ) ) ( not ( = ?auto_24445 ?auto_24450 ) ) ( HOIST-AT ?auto_24462 ?auto_24450 ) ( not ( = ?auto_24444 ?auto_24462 ) ) ( not ( = ?auto_24452 ?auto_24462 ) ) ( not ( = ?auto_24454 ?auto_24462 ) ) ( SURFACE-AT ?auto_24446 ?auto_24450 ) ( ON ?auto_24446 ?auto_24459 ) ( CLEAR ?auto_24446 ) ( not ( = ?auto_24442 ?auto_24459 ) ) ( not ( = ?auto_24443 ?auto_24459 ) ) ( not ( = ?auto_24453 ?auto_24459 ) ) ( not ( = ?auto_24446 ?auto_24459 ) ) ( not ( = ?auto_24455 ?auto_24459 ) ) ( not ( = ?auto_24451 ?auto_24459 ) ) ( IS-CRATE ?auto_24451 ) ( not ( = ?auto_24442 ?auto_24458 ) ) ( not ( = ?auto_24443 ?auto_24458 ) ) ( not ( = ?auto_24453 ?auto_24458 ) ) ( not ( = ?auto_24446 ?auto_24458 ) ) ( not ( = ?auto_24455 ?auto_24458 ) ) ( not ( = ?auto_24451 ?auto_24458 ) ) ( not ( = ?auto_24459 ?auto_24458 ) ) ( AVAILABLE ?auto_24452 ) ( SURFACE-AT ?auto_24451 ?auto_24449 ) ( ON ?auto_24451 ?auto_24460 ) ( CLEAR ?auto_24451 ) ( not ( = ?auto_24442 ?auto_24460 ) ) ( not ( = ?auto_24443 ?auto_24460 ) ) ( not ( = ?auto_24453 ?auto_24460 ) ) ( not ( = ?auto_24446 ?auto_24460 ) ) ( not ( = ?auto_24455 ?auto_24460 ) ) ( not ( = ?auto_24451 ?auto_24460 ) ) ( not ( = ?auto_24459 ?auto_24460 ) ) ( not ( = ?auto_24458 ?auto_24460 ) ) ( IS-CRATE ?auto_24458 ) ( not ( = ?auto_24442 ?auto_24448 ) ) ( not ( = ?auto_24443 ?auto_24448 ) ) ( not ( = ?auto_24453 ?auto_24448 ) ) ( not ( = ?auto_24446 ?auto_24448 ) ) ( not ( = ?auto_24455 ?auto_24448 ) ) ( not ( = ?auto_24451 ?auto_24448 ) ) ( not ( = ?auto_24459 ?auto_24448 ) ) ( not ( = ?auto_24458 ?auto_24448 ) ) ( not ( = ?auto_24460 ?auto_24448 ) ) ( SURFACE-AT ?auto_24458 ?auto_24450 ) ( ON ?auto_24458 ?auto_24447 ) ( CLEAR ?auto_24458 ) ( not ( = ?auto_24442 ?auto_24447 ) ) ( not ( = ?auto_24443 ?auto_24447 ) ) ( not ( = ?auto_24453 ?auto_24447 ) ) ( not ( = ?auto_24446 ?auto_24447 ) ) ( not ( = ?auto_24455 ?auto_24447 ) ) ( not ( = ?auto_24451 ?auto_24447 ) ) ( not ( = ?auto_24459 ?auto_24447 ) ) ( not ( = ?auto_24458 ?auto_24447 ) ) ( not ( = ?auto_24460 ?auto_24447 ) ) ( not ( = ?auto_24448 ?auto_24447 ) ) ( SURFACE-AT ?auto_24457 ?auto_24456 ) ( CLEAR ?auto_24457 ) ( IS-CRATE ?auto_24448 ) ( not ( = ?auto_24442 ?auto_24457 ) ) ( not ( = ?auto_24443 ?auto_24457 ) ) ( not ( = ?auto_24453 ?auto_24457 ) ) ( not ( = ?auto_24446 ?auto_24457 ) ) ( not ( = ?auto_24455 ?auto_24457 ) ) ( not ( = ?auto_24451 ?auto_24457 ) ) ( not ( = ?auto_24459 ?auto_24457 ) ) ( not ( = ?auto_24458 ?auto_24457 ) ) ( not ( = ?auto_24460 ?auto_24457 ) ) ( not ( = ?auto_24448 ?auto_24457 ) ) ( not ( = ?auto_24447 ?auto_24457 ) ) ( AVAILABLE ?auto_24444 ) ( TRUCK-AT ?auto_24461 ?auto_24450 ) ( LIFTING ?auto_24462 ?auto_24448 ) )
    :subtasks
    ( ( !LOAD ?auto_24462 ?auto_24448 ?auto_24461 ?auto_24450 )
      ( MAKE-ON ?auto_24442 ?auto_24443 )
      ( MAKE-ON-VERIFY ?auto_24442 ?auto_24443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24463 - SURFACE
      ?auto_24464 - SURFACE
    )
    :vars
    (
      ?auto_24466 - HOIST
      ?auto_24477 - PLACE
      ?auto_24475 - PLACE
      ?auto_24473 - HOIST
      ?auto_24470 - SURFACE
      ?auto_24467 - SURFACE
      ?auto_24481 - PLACE
      ?auto_24479 - HOIST
      ?auto_24478 - SURFACE
      ?auto_24476 - SURFACE
      ?auto_24471 - PLACE
      ?auto_24474 - HOIST
      ?auto_24483 - SURFACE
      ?auto_24465 - SURFACE
      ?auto_24480 - SURFACE
      ?auto_24472 - SURFACE
      ?auto_24468 - SURFACE
      ?auto_24469 - SURFACE
      ?auto_24482 - TRUCK
      ?auto_24484 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24466 ?auto_24477 ) ( IS-CRATE ?auto_24463 ) ( not ( = ?auto_24463 ?auto_24464 ) ) ( not ( = ?auto_24475 ?auto_24477 ) ) ( HOIST-AT ?auto_24473 ?auto_24475 ) ( not ( = ?auto_24466 ?auto_24473 ) ) ( SURFACE-AT ?auto_24463 ?auto_24475 ) ( ON ?auto_24463 ?auto_24470 ) ( CLEAR ?auto_24463 ) ( not ( = ?auto_24463 ?auto_24470 ) ) ( not ( = ?auto_24464 ?auto_24470 ) ) ( IS-CRATE ?auto_24464 ) ( not ( = ?auto_24463 ?auto_24467 ) ) ( not ( = ?auto_24464 ?auto_24467 ) ) ( not ( = ?auto_24470 ?auto_24467 ) ) ( not ( = ?auto_24481 ?auto_24477 ) ) ( not ( = ?auto_24475 ?auto_24481 ) ) ( HOIST-AT ?auto_24479 ?auto_24481 ) ( not ( = ?auto_24466 ?auto_24479 ) ) ( not ( = ?auto_24473 ?auto_24479 ) ) ( AVAILABLE ?auto_24479 ) ( SURFACE-AT ?auto_24464 ?auto_24481 ) ( ON ?auto_24464 ?auto_24478 ) ( CLEAR ?auto_24464 ) ( not ( = ?auto_24463 ?auto_24478 ) ) ( not ( = ?auto_24464 ?auto_24478 ) ) ( not ( = ?auto_24470 ?auto_24478 ) ) ( not ( = ?auto_24467 ?auto_24478 ) ) ( IS-CRATE ?auto_24467 ) ( not ( = ?auto_24463 ?auto_24476 ) ) ( not ( = ?auto_24464 ?auto_24476 ) ) ( not ( = ?auto_24470 ?auto_24476 ) ) ( not ( = ?auto_24467 ?auto_24476 ) ) ( not ( = ?auto_24478 ?auto_24476 ) ) ( not ( = ?auto_24471 ?auto_24477 ) ) ( not ( = ?auto_24475 ?auto_24471 ) ) ( not ( = ?auto_24481 ?auto_24471 ) ) ( HOIST-AT ?auto_24474 ?auto_24471 ) ( not ( = ?auto_24466 ?auto_24474 ) ) ( not ( = ?auto_24473 ?auto_24474 ) ) ( not ( = ?auto_24479 ?auto_24474 ) ) ( SURFACE-AT ?auto_24467 ?auto_24471 ) ( ON ?auto_24467 ?auto_24483 ) ( CLEAR ?auto_24467 ) ( not ( = ?auto_24463 ?auto_24483 ) ) ( not ( = ?auto_24464 ?auto_24483 ) ) ( not ( = ?auto_24470 ?auto_24483 ) ) ( not ( = ?auto_24467 ?auto_24483 ) ) ( not ( = ?auto_24478 ?auto_24483 ) ) ( not ( = ?auto_24476 ?auto_24483 ) ) ( IS-CRATE ?auto_24476 ) ( not ( = ?auto_24463 ?auto_24465 ) ) ( not ( = ?auto_24464 ?auto_24465 ) ) ( not ( = ?auto_24470 ?auto_24465 ) ) ( not ( = ?auto_24467 ?auto_24465 ) ) ( not ( = ?auto_24478 ?auto_24465 ) ) ( not ( = ?auto_24476 ?auto_24465 ) ) ( not ( = ?auto_24483 ?auto_24465 ) ) ( AVAILABLE ?auto_24473 ) ( SURFACE-AT ?auto_24476 ?auto_24475 ) ( ON ?auto_24476 ?auto_24480 ) ( CLEAR ?auto_24476 ) ( not ( = ?auto_24463 ?auto_24480 ) ) ( not ( = ?auto_24464 ?auto_24480 ) ) ( not ( = ?auto_24470 ?auto_24480 ) ) ( not ( = ?auto_24467 ?auto_24480 ) ) ( not ( = ?auto_24478 ?auto_24480 ) ) ( not ( = ?auto_24476 ?auto_24480 ) ) ( not ( = ?auto_24483 ?auto_24480 ) ) ( not ( = ?auto_24465 ?auto_24480 ) ) ( IS-CRATE ?auto_24465 ) ( not ( = ?auto_24463 ?auto_24472 ) ) ( not ( = ?auto_24464 ?auto_24472 ) ) ( not ( = ?auto_24470 ?auto_24472 ) ) ( not ( = ?auto_24467 ?auto_24472 ) ) ( not ( = ?auto_24478 ?auto_24472 ) ) ( not ( = ?auto_24476 ?auto_24472 ) ) ( not ( = ?auto_24483 ?auto_24472 ) ) ( not ( = ?auto_24465 ?auto_24472 ) ) ( not ( = ?auto_24480 ?auto_24472 ) ) ( SURFACE-AT ?auto_24465 ?auto_24471 ) ( ON ?auto_24465 ?auto_24468 ) ( CLEAR ?auto_24465 ) ( not ( = ?auto_24463 ?auto_24468 ) ) ( not ( = ?auto_24464 ?auto_24468 ) ) ( not ( = ?auto_24470 ?auto_24468 ) ) ( not ( = ?auto_24467 ?auto_24468 ) ) ( not ( = ?auto_24478 ?auto_24468 ) ) ( not ( = ?auto_24476 ?auto_24468 ) ) ( not ( = ?auto_24483 ?auto_24468 ) ) ( not ( = ?auto_24465 ?auto_24468 ) ) ( not ( = ?auto_24480 ?auto_24468 ) ) ( not ( = ?auto_24472 ?auto_24468 ) ) ( SURFACE-AT ?auto_24469 ?auto_24477 ) ( CLEAR ?auto_24469 ) ( IS-CRATE ?auto_24472 ) ( not ( = ?auto_24463 ?auto_24469 ) ) ( not ( = ?auto_24464 ?auto_24469 ) ) ( not ( = ?auto_24470 ?auto_24469 ) ) ( not ( = ?auto_24467 ?auto_24469 ) ) ( not ( = ?auto_24478 ?auto_24469 ) ) ( not ( = ?auto_24476 ?auto_24469 ) ) ( not ( = ?auto_24483 ?auto_24469 ) ) ( not ( = ?auto_24465 ?auto_24469 ) ) ( not ( = ?auto_24480 ?auto_24469 ) ) ( not ( = ?auto_24472 ?auto_24469 ) ) ( not ( = ?auto_24468 ?auto_24469 ) ) ( AVAILABLE ?auto_24466 ) ( TRUCK-AT ?auto_24482 ?auto_24471 ) ( AVAILABLE ?auto_24474 ) ( SURFACE-AT ?auto_24472 ?auto_24471 ) ( ON ?auto_24472 ?auto_24484 ) ( CLEAR ?auto_24472 ) ( not ( = ?auto_24463 ?auto_24484 ) ) ( not ( = ?auto_24464 ?auto_24484 ) ) ( not ( = ?auto_24470 ?auto_24484 ) ) ( not ( = ?auto_24467 ?auto_24484 ) ) ( not ( = ?auto_24478 ?auto_24484 ) ) ( not ( = ?auto_24476 ?auto_24484 ) ) ( not ( = ?auto_24483 ?auto_24484 ) ) ( not ( = ?auto_24465 ?auto_24484 ) ) ( not ( = ?auto_24480 ?auto_24484 ) ) ( not ( = ?auto_24472 ?auto_24484 ) ) ( not ( = ?auto_24468 ?auto_24484 ) ) ( not ( = ?auto_24469 ?auto_24484 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24474 ?auto_24472 ?auto_24484 ?auto_24471 )
      ( MAKE-ON ?auto_24463 ?auto_24464 )
      ( MAKE-ON-VERIFY ?auto_24463 ?auto_24464 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24485 - SURFACE
      ?auto_24486 - SURFACE
    )
    :vars
    (
      ?auto_24493 - HOIST
      ?auto_24503 - PLACE
      ?auto_24489 - PLACE
      ?auto_24505 - HOIST
      ?auto_24499 - SURFACE
      ?auto_24496 - SURFACE
      ?auto_24490 - PLACE
      ?auto_24506 - HOIST
      ?auto_24497 - SURFACE
      ?auto_24504 - SURFACE
      ?auto_24500 - PLACE
      ?auto_24488 - HOIST
      ?auto_24492 - SURFACE
      ?auto_24501 - SURFACE
      ?auto_24502 - SURFACE
      ?auto_24498 - SURFACE
      ?auto_24495 - SURFACE
      ?auto_24494 - SURFACE
      ?auto_24487 - SURFACE
      ?auto_24491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24493 ?auto_24503 ) ( IS-CRATE ?auto_24485 ) ( not ( = ?auto_24485 ?auto_24486 ) ) ( not ( = ?auto_24489 ?auto_24503 ) ) ( HOIST-AT ?auto_24505 ?auto_24489 ) ( not ( = ?auto_24493 ?auto_24505 ) ) ( SURFACE-AT ?auto_24485 ?auto_24489 ) ( ON ?auto_24485 ?auto_24499 ) ( CLEAR ?auto_24485 ) ( not ( = ?auto_24485 ?auto_24499 ) ) ( not ( = ?auto_24486 ?auto_24499 ) ) ( IS-CRATE ?auto_24486 ) ( not ( = ?auto_24485 ?auto_24496 ) ) ( not ( = ?auto_24486 ?auto_24496 ) ) ( not ( = ?auto_24499 ?auto_24496 ) ) ( not ( = ?auto_24490 ?auto_24503 ) ) ( not ( = ?auto_24489 ?auto_24490 ) ) ( HOIST-AT ?auto_24506 ?auto_24490 ) ( not ( = ?auto_24493 ?auto_24506 ) ) ( not ( = ?auto_24505 ?auto_24506 ) ) ( AVAILABLE ?auto_24506 ) ( SURFACE-AT ?auto_24486 ?auto_24490 ) ( ON ?auto_24486 ?auto_24497 ) ( CLEAR ?auto_24486 ) ( not ( = ?auto_24485 ?auto_24497 ) ) ( not ( = ?auto_24486 ?auto_24497 ) ) ( not ( = ?auto_24499 ?auto_24497 ) ) ( not ( = ?auto_24496 ?auto_24497 ) ) ( IS-CRATE ?auto_24496 ) ( not ( = ?auto_24485 ?auto_24504 ) ) ( not ( = ?auto_24486 ?auto_24504 ) ) ( not ( = ?auto_24499 ?auto_24504 ) ) ( not ( = ?auto_24496 ?auto_24504 ) ) ( not ( = ?auto_24497 ?auto_24504 ) ) ( not ( = ?auto_24500 ?auto_24503 ) ) ( not ( = ?auto_24489 ?auto_24500 ) ) ( not ( = ?auto_24490 ?auto_24500 ) ) ( HOIST-AT ?auto_24488 ?auto_24500 ) ( not ( = ?auto_24493 ?auto_24488 ) ) ( not ( = ?auto_24505 ?auto_24488 ) ) ( not ( = ?auto_24506 ?auto_24488 ) ) ( SURFACE-AT ?auto_24496 ?auto_24500 ) ( ON ?auto_24496 ?auto_24492 ) ( CLEAR ?auto_24496 ) ( not ( = ?auto_24485 ?auto_24492 ) ) ( not ( = ?auto_24486 ?auto_24492 ) ) ( not ( = ?auto_24499 ?auto_24492 ) ) ( not ( = ?auto_24496 ?auto_24492 ) ) ( not ( = ?auto_24497 ?auto_24492 ) ) ( not ( = ?auto_24504 ?auto_24492 ) ) ( IS-CRATE ?auto_24504 ) ( not ( = ?auto_24485 ?auto_24501 ) ) ( not ( = ?auto_24486 ?auto_24501 ) ) ( not ( = ?auto_24499 ?auto_24501 ) ) ( not ( = ?auto_24496 ?auto_24501 ) ) ( not ( = ?auto_24497 ?auto_24501 ) ) ( not ( = ?auto_24504 ?auto_24501 ) ) ( not ( = ?auto_24492 ?auto_24501 ) ) ( AVAILABLE ?auto_24505 ) ( SURFACE-AT ?auto_24504 ?auto_24489 ) ( ON ?auto_24504 ?auto_24502 ) ( CLEAR ?auto_24504 ) ( not ( = ?auto_24485 ?auto_24502 ) ) ( not ( = ?auto_24486 ?auto_24502 ) ) ( not ( = ?auto_24499 ?auto_24502 ) ) ( not ( = ?auto_24496 ?auto_24502 ) ) ( not ( = ?auto_24497 ?auto_24502 ) ) ( not ( = ?auto_24504 ?auto_24502 ) ) ( not ( = ?auto_24492 ?auto_24502 ) ) ( not ( = ?auto_24501 ?auto_24502 ) ) ( IS-CRATE ?auto_24501 ) ( not ( = ?auto_24485 ?auto_24498 ) ) ( not ( = ?auto_24486 ?auto_24498 ) ) ( not ( = ?auto_24499 ?auto_24498 ) ) ( not ( = ?auto_24496 ?auto_24498 ) ) ( not ( = ?auto_24497 ?auto_24498 ) ) ( not ( = ?auto_24504 ?auto_24498 ) ) ( not ( = ?auto_24492 ?auto_24498 ) ) ( not ( = ?auto_24501 ?auto_24498 ) ) ( not ( = ?auto_24502 ?auto_24498 ) ) ( SURFACE-AT ?auto_24501 ?auto_24500 ) ( ON ?auto_24501 ?auto_24495 ) ( CLEAR ?auto_24501 ) ( not ( = ?auto_24485 ?auto_24495 ) ) ( not ( = ?auto_24486 ?auto_24495 ) ) ( not ( = ?auto_24499 ?auto_24495 ) ) ( not ( = ?auto_24496 ?auto_24495 ) ) ( not ( = ?auto_24497 ?auto_24495 ) ) ( not ( = ?auto_24504 ?auto_24495 ) ) ( not ( = ?auto_24492 ?auto_24495 ) ) ( not ( = ?auto_24501 ?auto_24495 ) ) ( not ( = ?auto_24502 ?auto_24495 ) ) ( not ( = ?auto_24498 ?auto_24495 ) ) ( SURFACE-AT ?auto_24494 ?auto_24503 ) ( CLEAR ?auto_24494 ) ( IS-CRATE ?auto_24498 ) ( not ( = ?auto_24485 ?auto_24494 ) ) ( not ( = ?auto_24486 ?auto_24494 ) ) ( not ( = ?auto_24499 ?auto_24494 ) ) ( not ( = ?auto_24496 ?auto_24494 ) ) ( not ( = ?auto_24497 ?auto_24494 ) ) ( not ( = ?auto_24504 ?auto_24494 ) ) ( not ( = ?auto_24492 ?auto_24494 ) ) ( not ( = ?auto_24501 ?auto_24494 ) ) ( not ( = ?auto_24502 ?auto_24494 ) ) ( not ( = ?auto_24498 ?auto_24494 ) ) ( not ( = ?auto_24495 ?auto_24494 ) ) ( AVAILABLE ?auto_24493 ) ( AVAILABLE ?auto_24488 ) ( SURFACE-AT ?auto_24498 ?auto_24500 ) ( ON ?auto_24498 ?auto_24487 ) ( CLEAR ?auto_24498 ) ( not ( = ?auto_24485 ?auto_24487 ) ) ( not ( = ?auto_24486 ?auto_24487 ) ) ( not ( = ?auto_24499 ?auto_24487 ) ) ( not ( = ?auto_24496 ?auto_24487 ) ) ( not ( = ?auto_24497 ?auto_24487 ) ) ( not ( = ?auto_24504 ?auto_24487 ) ) ( not ( = ?auto_24492 ?auto_24487 ) ) ( not ( = ?auto_24501 ?auto_24487 ) ) ( not ( = ?auto_24502 ?auto_24487 ) ) ( not ( = ?auto_24498 ?auto_24487 ) ) ( not ( = ?auto_24495 ?auto_24487 ) ) ( not ( = ?auto_24494 ?auto_24487 ) ) ( TRUCK-AT ?auto_24491 ?auto_24503 ) )
    :subtasks
    ( ( !DRIVE ?auto_24491 ?auto_24503 ?auto_24500 )
      ( MAKE-ON ?auto_24485 ?auto_24486 )
      ( MAKE-ON-VERIFY ?auto_24485 ?auto_24486 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24509 - SURFACE
      ?auto_24510 - SURFACE
    )
    :vars
    (
      ?auto_24511 - HOIST
      ?auto_24512 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24511 ?auto_24512 ) ( SURFACE-AT ?auto_24510 ?auto_24512 ) ( CLEAR ?auto_24510 ) ( LIFTING ?auto_24511 ?auto_24509 ) ( IS-CRATE ?auto_24509 ) ( not ( = ?auto_24509 ?auto_24510 ) ) )
    :subtasks
    ( ( !DROP ?auto_24511 ?auto_24509 ?auto_24510 ?auto_24512 )
      ( MAKE-ON-VERIFY ?auto_24509 ?auto_24510 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24513 - SURFACE
      ?auto_24514 - SURFACE
    )
    :vars
    (
      ?auto_24515 - HOIST
      ?auto_24516 - PLACE
      ?auto_24517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24515 ?auto_24516 ) ( SURFACE-AT ?auto_24514 ?auto_24516 ) ( CLEAR ?auto_24514 ) ( IS-CRATE ?auto_24513 ) ( not ( = ?auto_24513 ?auto_24514 ) ) ( TRUCK-AT ?auto_24517 ?auto_24516 ) ( AVAILABLE ?auto_24515 ) ( IN ?auto_24513 ?auto_24517 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24515 ?auto_24513 ?auto_24517 ?auto_24516 )
      ( MAKE-ON ?auto_24513 ?auto_24514 )
      ( MAKE-ON-VERIFY ?auto_24513 ?auto_24514 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24518 - SURFACE
      ?auto_24519 - SURFACE
    )
    :vars
    (
      ?auto_24521 - HOIST
      ?auto_24520 - PLACE
      ?auto_24522 - TRUCK
      ?auto_24523 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24521 ?auto_24520 ) ( SURFACE-AT ?auto_24519 ?auto_24520 ) ( CLEAR ?auto_24519 ) ( IS-CRATE ?auto_24518 ) ( not ( = ?auto_24518 ?auto_24519 ) ) ( AVAILABLE ?auto_24521 ) ( IN ?auto_24518 ?auto_24522 ) ( TRUCK-AT ?auto_24522 ?auto_24523 ) ( not ( = ?auto_24523 ?auto_24520 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24522 ?auto_24523 ?auto_24520 )
      ( MAKE-ON ?auto_24518 ?auto_24519 )
      ( MAKE-ON-VERIFY ?auto_24518 ?auto_24519 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24524 - SURFACE
      ?auto_24525 - SURFACE
    )
    :vars
    (
      ?auto_24528 - HOIST
      ?auto_24529 - PLACE
      ?auto_24526 - TRUCK
      ?auto_24527 - PLACE
      ?auto_24530 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24528 ?auto_24529 ) ( SURFACE-AT ?auto_24525 ?auto_24529 ) ( CLEAR ?auto_24525 ) ( IS-CRATE ?auto_24524 ) ( not ( = ?auto_24524 ?auto_24525 ) ) ( AVAILABLE ?auto_24528 ) ( TRUCK-AT ?auto_24526 ?auto_24527 ) ( not ( = ?auto_24527 ?auto_24529 ) ) ( HOIST-AT ?auto_24530 ?auto_24527 ) ( LIFTING ?auto_24530 ?auto_24524 ) ( not ( = ?auto_24528 ?auto_24530 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24530 ?auto_24524 ?auto_24526 ?auto_24527 )
      ( MAKE-ON ?auto_24524 ?auto_24525 )
      ( MAKE-ON-VERIFY ?auto_24524 ?auto_24525 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24531 - SURFACE
      ?auto_24532 - SURFACE
    )
    :vars
    (
      ?auto_24535 - HOIST
      ?auto_24533 - PLACE
      ?auto_24537 - TRUCK
      ?auto_24536 - PLACE
      ?auto_24534 - HOIST
      ?auto_24538 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24535 ?auto_24533 ) ( SURFACE-AT ?auto_24532 ?auto_24533 ) ( CLEAR ?auto_24532 ) ( IS-CRATE ?auto_24531 ) ( not ( = ?auto_24531 ?auto_24532 ) ) ( AVAILABLE ?auto_24535 ) ( TRUCK-AT ?auto_24537 ?auto_24536 ) ( not ( = ?auto_24536 ?auto_24533 ) ) ( HOIST-AT ?auto_24534 ?auto_24536 ) ( not ( = ?auto_24535 ?auto_24534 ) ) ( AVAILABLE ?auto_24534 ) ( SURFACE-AT ?auto_24531 ?auto_24536 ) ( ON ?auto_24531 ?auto_24538 ) ( CLEAR ?auto_24531 ) ( not ( = ?auto_24531 ?auto_24538 ) ) ( not ( = ?auto_24532 ?auto_24538 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24534 ?auto_24531 ?auto_24538 ?auto_24536 )
      ( MAKE-ON ?auto_24531 ?auto_24532 )
      ( MAKE-ON-VERIFY ?auto_24531 ?auto_24532 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24539 - SURFACE
      ?auto_24540 - SURFACE
    )
    :vars
    (
      ?auto_24544 - HOIST
      ?auto_24545 - PLACE
      ?auto_24542 - PLACE
      ?auto_24543 - HOIST
      ?auto_24541 - SURFACE
      ?auto_24546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24544 ?auto_24545 ) ( SURFACE-AT ?auto_24540 ?auto_24545 ) ( CLEAR ?auto_24540 ) ( IS-CRATE ?auto_24539 ) ( not ( = ?auto_24539 ?auto_24540 ) ) ( AVAILABLE ?auto_24544 ) ( not ( = ?auto_24542 ?auto_24545 ) ) ( HOIST-AT ?auto_24543 ?auto_24542 ) ( not ( = ?auto_24544 ?auto_24543 ) ) ( AVAILABLE ?auto_24543 ) ( SURFACE-AT ?auto_24539 ?auto_24542 ) ( ON ?auto_24539 ?auto_24541 ) ( CLEAR ?auto_24539 ) ( not ( = ?auto_24539 ?auto_24541 ) ) ( not ( = ?auto_24540 ?auto_24541 ) ) ( TRUCK-AT ?auto_24546 ?auto_24545 ) )
    :subtasks
    ( ( !DRIVE ?auto_24546 ?auto_24545 ?auto_24542 )
      ( MAKE-ON ?auto_24539 ?auto_24540 )
      ( MAKE-ON-VERIFY ?auto_24539 ?auto_24540 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24547 - SURFACE
      ?auto_24548 - SURFACE
    )
    :vars
    (
      ?auto_24550 - HOIST
      ?auto_24552 - PLACE
      ?auto_24554 - PLACE
      ?auto_24549 - HOIST
      ?auto_24553 - SURFACE
      ?auto_24551 - TRUCK
      ?auto_24555 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24550 ?auto_24552 ) ( IS-CRATE ?auto_24547 ) ( not ( = ?auto_24547 ?auto_24548 ) ) ( not ( = ?auto_24554 ?auto_24552 ) ) ( HOIST-AT ?auto_24549 ?auto_24554 ) ( not ( = ?auto_24550 ?auto_24549 ) ) ( AVAILABLE ?auto_24549 ) ( SURFACE-AT ?auto_24547 ?auto_24554 ) ( ON ?auto_24547 ?auto_24553 ) ( CLEAR ?auto_24547 ) ( not ( = ?auto_24547 ?auto_24553 ) ) ( not ( = ?auto_24548 ?auto_24553 ) ) ( TRUCK-AT ?auto_24551 ?auto_24552 ) ( SURFACE-AT ?auto_24555 ?auto_24552 ) ( CLEAR ?auto_24555 ) ( LIFTING ?auto_24550 ?auto_24548 ) ( IS-CRATE ?auto_24548 ) ( not ( = ?auto_24547 ?auto_24555 ) ) ( not ( = ?auto_24548 ?auto_24555 ) ) ( not ( = ?auto_24553 ?auto_24555 ) ) )
    :subtasks
    ( ( !DROP ?auto_24550 ?auto_24548 ?auto_24555 ?auto_24552 )
      ( MAKE-ON ?auto_24547 ?auto_24548 )
      ( MAKE-ON-VERIFY ?auto_24547 ?auto_24548 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24556 - SURFACE
      ?auto_24557 - SURFACE
    )
    :vars
    (
      ?auto_24561 - HOIST
      ?auto_24563 - PLACE
      ?auto_24562 - PLACE
      ?auto_24564 - HOIST
      ?auto_24559 - SURFACE
      ?auto_24560 - TRUCK
      ?auto_24558 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24561 ?auto_24563 ) ( IS-CRATE ?auto_24556 ) ( not ( = ?auto_24556 ?auto_24557 ) ) ( not ( = ?auto_24562 ?auto_24563 ) ) ( HOIST-AT ?auto_24564 ?auto_24562 ) ( not ( = ?auto_24561 ?auto_24564 ) ) ( AVAILABLE ?auto_24564 ) ( SURFACE-AT ?auto_24556 ?auto_24562 ) ( ON ?auto_24556 ?auto_24559 ) ( CLEAR ?auto_24556 ) ( not ( = ?auto_24556 ?auto_24559 ) ) ( not ( = ?auto_24557 ?auto_24559 ) ) ( TRUCK-AT ?auto_24560 ?auto_24563 ) ( SURFACE-AT ?auto_24558 ?auto_24563 ) ( CLEAR ?auto_24558 ) ( IS-CRATE ?auto_24557 ) ( not ( = ?auto_24556 ?auto_24558 ) ) ( not ( = ?auto_24557 ?auto_24558 ) ) ( not ( = ?auto_24559 ?auto_24558 ) ) ( AVAILABLE ?auto_24561 ) ( IN ?auto_24557 ?auto_24560 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24561 ?auto_24557 ?auto_24560 ?auto_24563 )
      ( MAKE-ON ?auto_24556 ?auto_24557 )
      ( MAKE-ON-VERIFY ?auto_24556 ?auto_24557 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24565 - SURFACE
      ?auto_24566 - SURFACE
    )
    :vars
    (
      ?auto_24572 - HOIST
      ?auto_24567 - PLACE
      ?auto_24571 - PLACE
      ?auto_24570 - HOIST
      ?auto_24569 - SURFACE
      ?auto_24573 - SURFACE
      ?auto_24568 - TRUCK
      ?auto_24574 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24572 ?auto_24567 ) ( IS-CRATE ?auto_24565 ) ( not ( = ?auto_24565 ?auto_24566 ) ) ( not ( = ?auto_24571 ?auto_24567 ) ) ( HOIST-AT ?auto_24570 ?auto_24571 ) ( not ( = ?auto_24572 ?auto_24570 ) ) ( AVAILABLE ?auto_24570 ) ( SURFACE-AT ?auto_24565 ?auto_24571 ) ( ON ?auto_24565 ?auto_24569 ) ( CLEAR ?auto_24565 ) ( not ( = ?auto_24565 ?auto_24569 ) ) ( not ( = ?auto_24566 ?auto_24569 ) ) ( SURFACE-AT ?auto_24573 ?auto_24567 ) ( CLEAR ?auto_24573 ) ( IS-CRATE ?auto_24566 ) ( not ( = ?auto_24565 ?auto_24573 ) ) ( not ( = ?auto_24566 ?auto_24573 ) ) ( not ( = ?auto_24569 ?auto_24573 ) ) ( AVAILABLE ?auto_24572 ) ( IN ?auto_24566 ?auto_24568 ) ( TRUCK-AT ?auto_24568 ?auto_24574 ) ( not ( = ?auto_24574 ?auto_24567 ) ) ( not ( = ?auto_24571 ?auto_24574 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24568 ?auto_24574 ?auto_24567 )
      ( MAKE-ON ?auto_24565 ?auto_24566 )
      ( MAKE-ON-VERIFY ?auto_24565 ?auto_24566 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24575 - SURFACE
      ?auto_24576 - SURFACE
    )
    :vars
    (
      ?auto_24577 - HOIST
      ?auto_24583 - PLACE
      ?auto_24579 - PLACE
      ?auto_24578 - HOIST
      ?auto_24581 - SURFACE
      ?auto_24584 - SURFACE
      ?auto_24580 - TRUCK
      ?auto_24582 - PLACE
      ?auto_24585 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24577 ?auto_24583 ) ( IS-CRATE ?auto_24575 ) ( not ( = ?auto_24575 ?auto_24576 ) ) ( not ( = ?auto_24579 ?auto_24583 ) ) ( HOIST-AT ?auto_24578 ?auto_24579 ) ( not ( = ?auto_24577 ?auto_24578 ) ) ( AVAILABLE ?auto_24578 ) ( SURFACE-AT ?auto_24575 ?auto_24579 ) ( ON ?auto_24575 ?auto_24581 ) ( CLEAR ?auto_24575 ) ( not ( = ?auto_24575 ?auto_24581 ) ) ( not ( = ?auto_24576 ?auto_24581 ) ) ( SURFACE-AT ?auto_24584 ?auto_24583 ) ( CLEAR ?auto_24584 ) ( IS-CRATE ?auto_24576 ) ( not ( = ?auto_24575 ?auto_24584 ) ) ( not ( = ?auto_24576 ?auto_24584 ) ) ( not ( = ?auto_24581 ?auto_24584 ) ) ( AVAILABLE ?auto_24577 ) ( TRUCK-AT ?auto_24580 ?auto_24582 ) ( not ( = ?auto_24582 ?auto_24583 ) ) ( not ( = ?auto_24579 ?auto_24582 ) ) ( HOIST-AT ?auto_24585 ?auto_24582 ) ( LIFTING ?auto_24585 ?auto_24576 ) ( not ( = ?auto_24577 ?auto_24585 ) ) ( not ( = ?auto_24578 ?auto_24585 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24585 ?auto_24576 ?auto_24580 ?auto_24582 )
      ( MAKE-ON ?auto_24575 ?auto_24576 )
      ( MAKE-ON-VERIFY ?auto_24575 ?auto_24576 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24586 - SURFACE
      ?auto_24587 - SURFACE
    )
    :vars
    (
      ?auto_24593 - HOIST
      ?auto_24588 - PLACE
      ?auto_24589 - PLACE
      ?auto_24595 - HOIST
      ?auto_24594 - SURFACE
      ?auto_24591 - SURFACE
      ?auto_24596 - TRUCK
      ?auto_24590 - PLACE
      ?auto_24592 - HOIST
      ?auto_24597 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24593 ?auto_24588 ) ( IS-CRATE ?auto_24586 ) ( not ( = ?auto_24586 ?auto_24587 ) ) ( not ( = ?auto_24589 ?auto_24588 ) ) ( HOIST-AT ?auto_24595 ?auto_24589 ) ( not ( = ?auto_24593 ?auto_24595 ) ) ( AVAILABLE ?auto_24595 ) ( SURFACE-AT ?auto_24586 ?auto_24589 ) ( ON ?auto_24586 ?auto_24594 ) ( CLEAR ?auto_24586 ) ( not ( = ?auto_24586 ?auto_24594 ) ) ( not ( = ?auto_24587 ?auto_24594 ) ) ( SURFACE-AT ?auto_24591 ?auto_24588 ) ( CLEAR ?auto_24591 ) ( IS-CRATE ?auto_24587 ) ( not ( = ?auto_24586 ?auto_24591 ) ) ( not ( = ?auto_24587 ?auto_24591 ) ) ( not ( = ?auto_24594 ?auto_24591 ) ) ( AVAILABLE ?auto_24593 ) ( TRUCK-AT ?auto_24596 ?auto_24590 ) ( not ( = ?auto_24590 ?auto_24588 ) ) ( not ( = ?auto_24589 ?auto_24590 ) ) ( HOIST-AT ?auto_24592 ?auto_24590 ) ( not ( = ?auto_24593 ?auto_24592 ) ) ( not ( = ?auto_24595 ?auto_24592 ) ) ( AVAILABLE ?auto_24592 ) ( SURFACE-AT ?auto_24587 ?auto_24590 ) ( ON ?auto_24587 ?auto_24597 ) ( CLEAR ?auto_24587 ) ( not ( = ?auto_24586 ?auto_24597 ) ) ( not ( = ?auto_24587 ?auto_24597 ) ) ( not ( = ?auto_24594 ?auto_24597 ) ) ( not ( = ?auto_24591 ?auto_24597 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24592 ?auto_24587 ?auto_24597 ?auto_24590 )
      ( MAKE-ON ?auto_24586 ?auto_24587 )
      ( MAKE-ON-VERIFY ?auto_24586 ?auto_24587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24598 - SURFACE
      ?auto_24599 - SURFACE
    )
    :vars
    (
      ?auto_24601 - HOIST
      ?auto_24603 - PLACE
      ?auto_24600 - PLACE
      ?auto_24607 - HOIST
      ?auto_24606 - SURFACE
      ?auto_24602 - SURFACE
      ?auto_24605 - PLACE
      ?auto_24608 - HOIST
      ?auto_24604 - SURFACE
      ?auto_24609 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24601 ?auto_24603 ) ( IS-CRATE ?auto_24598 ) ( not ( = ?auto_24598 ?auto_24599 ) ) ( not ( = ?auto_24600 ?auto_24603 ) ) ( HOIST-AT ?auto_24607 ?auto_24600 ) ( not ( = ?auto_24601 ?auto_24607 ) ) ( AVAILABLE ?auto_24607 ) ( SURFACE-AT ?auto_24598 ?auto_24600 ) ( ON ?auto_24598 ?auto_24606 ) ( CLEAR ?auto_24598 ) ( not ( = ?auto_24598 ?auto_24606 ) ) ( not ( = ?auto_24599 ?auto_24606 ) ) ( SURFACE-AT ?auto_24602 ?auto_24603 ) ( CLEAR ?auto_24602 ) ( IS-CRATE ?auto_24599 ) ( not ( = ?auto_24598 ?auto_24602 ) ) ( not ( = ?auto_24599 ?auto_24602 ) ) ( not ( = ?auto_24606 ?auto_24602 ) ) ( AVAILABLE ?auto_24601 ) ( not ( = ?auto_24605 ?auto_24603 ) ) ( not ( = ?auto_24600 ?auto_24605 ) ) ( HOIST-AT ?auto_24608 ?auto_24605 ) ( not ( = ?auto_24601 ?auto_24608 ) ) ( not ( = ?auto_24607 ?auto_24608 ) ) ( AVAILABLE ?auto_24608 ) ( SURFACE-AT ?auto_24599 ?auto_24605 ) ( ON ?auto_24599 ?auto_24604 ) ( CLEAR ?auto_24599 ) ( not ( = ?auto_24598 ?auto_24604 ) ) ( not ( = ?auto_24599 ?auto_24604 ) ) ( not ( = ?auto_24606 ?auto_24604 ) ) ( not ( = ?auto_24602 ?auto_24604 ) ) ( TRUCK-AT ?auto_24609 ?auto_24603 ) )
    :subtasks
    ( ( !DRIVE ?auto_24609 ?auto_24603 ?auto_24605 )
      ( MAKE-ON ?auto_24598 ?auto_24599 )
      ( MAKE-ON-VERIFY ?auto_24598 ?auto_24599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24610 - SURFACE
      ?auto_24611 - SURFACE
    )
    :vars
    (
      ?auto_24612 - HOIST
      ?auto_24620 - PLACE
      ?auto_24616 - PLACE
      ?auto_24617 - HOIST
      ?auto_24618 - SURFACE
      ?auto_24614 - SURFACE
      ?auto_24613 - PLACE
      ?auto_24615 - HOIST
      ?auto_24619 - SURFACE
      ?auto_24621 - TRUCK
      ?auto_24622 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24612 ?auto_24620 ) ( IS-CRATE ?auto_24610 ) ( not ( = ?auto_24610 ?auto_24611 ) ) ( not ( = ?auto_24616 ?auto_24620 ) ) ( HOIST-AT ?auto_24617 ?auto_24616 ) ( not ( = ?auto_24612 ?auto_24617 ) ) ( AVAILABLE ?auto_24617 ) ( SURFACE-AT ?auto_24610 ?auto_24616 ) ( ON ?auto_24610 ?auto_24618 ) ( CLEAR ?auto_24610 ) ( not ( = ?auto_24610 ?auto_24618 ) ) ( not ( = ?auto_24611 ?auto_24618 ) ) ( IS-CRATE ?auto_24611 ) ( not ( = ?auto_24610 ?auto_24614 ) ) ( not ( = ?auto_24611 ?auto_24614 ) ) ( not ( = ?auto_24618 ?auto_24614 ) ) ( not ( = ?auto_24613 ?auto_24620 ) ) ( not ( = ?auto_24616 ?auto_24613 ) ) ( HOIST-AT ?auto_24615 ?auto_24613 ) ( not ( = ?auto_24612 ?auto_24615 ) ) ( not ( = ?auto_24617 ?auto_24615 ) ) ( AVAILABLE ?auto_24615 ) ( SURFACE-AT ?auto_24611 ?auto_24613 ) ( ON ?auto_24611 ?auto_24619 ) ( CLEAR ?auto_24611 ) ( not ( = ?auto_24610 ?auto_24619 ) ) ( not ( = ?auto_24611 ?auto_24619 ) ) ( not ( = ?auto_24618 ?auto_24619 ) ) ( not ( = ?auto_24614 ?auto_24619 ) ) ( TRUCK-AT ?auto_24621 ?auto_24620 ) ( SURFACE-AT ?auto_24622 ?auto_24620 ) ( CLEAR ?auto_24622 ) ( LIFTING ?auto_24612 ?auto_24614 ) ( IS-CRATE ?auto_24614 ) ( not ( = ?auto_24610 ?auto_24622 ) ) ( not ( = ?auto_24611 ?auto_24622 ) ) ( not ( = ?auto_24618 ?auto_24622 ) ) ( not ( = ?auto_24614 ?auto_24622 ) ) ( not ( = ?auto_24619 ?auto_24622 ) ) )
    :subtasks
    ( ( !DROP ?auto_24612 ?auto_24614 ?auto_24622 ?auto_24620 )
      ( MAKE-ON ?auto_24610 ?auto_24611 )
      ( MAKE-ON-VERIFY ?auto_24610 ?auto_24611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24623 - SURFACE
      ?auto_24624 - SURFACE
    )
    :vars
    (
      ?auto_24634 - HOIST
      ?auto_24633 - PLACE
      ?auto_24629 - PLACE
      ?auto_24627 - HOIST
      ?auto_24630 - SURFACE
      ?auto_24626 - SURFACE
      ?auto_24628 - PLACE
      ?auto_24625 - HOIST
      ?auto_24632 - SURFACE
      ?auto_24631 - TRUCK
      ?auto_24635 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24634 ?auto_24633 ) ( IS-CRATE ?auto_24623 ) ( not ( = ?auto_24623 ?auto_24624 ) ) ( not ( = ?auto_24629 ?auto_24633 ) ) ( HOIST-AT ?auto_24627 ?auto_24629 ) ( not ( = ?auto_24634 ?auto_24627 ) ) ( AVAILABLE ?auto_24627 ) ( SURFACE-AT ?auto_24623 ?auto_24629 ) ( ON ?auto_24623 ?auto_24630 ) ( CLEAR ?auto_24623 ) ( not ( = ?auto_24623 ?auto_24630 ) ) ( not ( = ?auto_24624 ?auto_24630 ) ) ( IS-CRATE ?auto_24624 ) ( not ( = ?auto_24623 ?auto_24626 ) ) ( not ( = ?auto_24624 ?auto_24626 ) ) ( not ( = ?auto_24630 ?auto_24626 ) ) ( not ( = ?auto_24628 ?auto_24633 ) ) ( not ( = ?auto_24629 ?auto_24628 ) ) ( HOIST-AT ?auto_24625 ?auto_24628 ) ( not ( = ?auto_24634 ?auto_24625 ) ) ( not ( = ?auto_24627 ?auto_24625 ) ) ( AVAILABLE ?auto_24625 ) ( SURFACE-AT ?auto_24624 ?auto_24628 ) ( ON ?auto_24624 ?auto_24632 ) ( CLEAR ?auto_24624 ) ( not ( = ?auto_24623 ?auto_24632 ) ) ( not ( = ?auto_24624 ?auto_24632 ) ) ( not ( = ?auto_24630 ?auto_24632 ) ) ( not ( = ?auto_24626 ?auto_24632 ) ) ( TRUCK-AT ?auto_24631 ?auto_24633 ) ( SURFACE-AT ?auto_24635 ?auto_24633 ) ( CLEAR ?auto_24635 ) ( IS-CRATE ?auto_24626 ) ( not ( = ?auto_24623 ?auto_24635 ) ) ( not ( = ?auto_24624 ?auto_24635 ) ) ( not ( = ?auto_24630 ?auto_24635 ) ) ( not ( = ?auto_24626 ?auto_24635 ) ) ( not ( = ?auto_24632 ?auto_24635 ) ) ( AVAILABLE ?auto_24634 ) ( IN ?auto_24626 ?auto_24631 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24634 ?auto_24626 ?auto_24631 ?auto_24633 )
      ( MAKE-ON ?auto_24623 ?auto_24624 )
      ( MAKE-ON-VERIFY ?auto_24623 ?auto_24624 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24636 - SURFACE
      ?auto_24637 - SURFACE
    )
    :vars
    (
      ?auto_24645 - HOIST
      ?auto_24643 - PLACE
      ?auto_24642 - PLACE
      ?auto_24641 - HOIST
      ?auto_24647 - SURFACE
      ?auto_24640 - SURFACE
      ?auto_24638 - PLACE
      ?auto_24639 - HOIST
      ?auto_24646 - SURFACE
      ?auto_24648 - SURFACE
      ?auto_24644 - TRUCK
      ?auto_24649 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24645 ?auto_24643 ) ( IS-CRATE ?auto_24636 ) ( not ( = ?auto_24636 ?auto_24637 ) ) ( not ( = ?auto_24642 ?auto_24643 ) ) ( HOIST-AT ?auto_24641 ?auto_24642 ) ( not ( = ?auto_24645 ?auto_24641 ) ) ( AVAILABLE ?auto_24641 ) ( SURFACE-AT ?auto_24636 ?auto_24642 ) ( ON ?auto_24636 ?auto_24647 ) ( CLEAR ?auto_24636 ) ( not ( = ?auto_24636 ?auto_24647 ) ) ( not ( = ?auto_24637 ?auto_24647 ) ) ( IS-CRATE ?auto_24637 ) ( not ( = ?auto_24636 ?auto_24640 ) ) ( not ( = ?auto_24637 ?auto_24640 ) ) ( not ( = ?auto_24647 ?auto_24640 ) ) ( not ( = ?auto_24638 ?auto_24643 ) ) ( not ( = ?auto_24642 ?auto_24638 ) ) ( HOIST-AT ?auto_24639 ?auto_24638 ) ( not ( = ?auto_24645 ?auto_24639 ) ) ( not ( = ?auto_24641 ?auto_24639 ) ) ( AVAILABLE ?auto_24639 ) ( SURFACE-AT ?auto_24637 ?auto_24638 ) ( ON ?auto_24637 ?auto_24646 ) ( CLEAR ?auto_24637 ) ( not ( = ?auto_24636 ?auto_24646 ) ) ( not ( = ?auto_24637 ?auto_24646 ) ) ( not ( = ?auto_24647 ?auto_24646 ) ) ( not ( = ?auto_24640 ?auto_24646 ) ) ( SURFACE-AT ?auto_24648 ?auto_24643 ) ( CLEAR ?auto_24648 ) ( IS-CRATE ?auto_24640 ) ( not ( = ?auto_24636 ?auto_24648 ) ) ( not ( = ?auto_24637 ?auto_24648 ) ) ( not ( = ?auto_24647 ?auto_24648 ) ) ( not ( = ?auto_24640 ?auto_24648 ) ) ( not ( = ?auto_24646 ?auto_24648 ) ) ( AVAILABLE ?auto_24645 ) ( IN ?auto_24640 ?auto_24644 ) ( TRUCK-AT ?auto_24644 ?auto_24649 ) ( not ( = ?auto_24649 ?auto_24643 ) ) ( not ( = ?auto_24642 ?auto_24649 ) ) ( not ( = ?auto_24638 ?auto_24649 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24644 ?auto_24649 ?auto_24643 )
      ( MAKE-ON ?auto_24636 ?auto_24637 )
      ( MAKE-ON-VERIFY ?auto_24636 ?auto_24637 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24650 - SURFACE
      ?auto_24651 - SURFACE
    )
    :vars
    (
      ?auto_24653 - HOIST
      ?auto_24652 - PLACE
      ?auto_24654 - PLACE
      ?auto_24660 - HOIST
      ?auto_24656 - SURFACE
      ?auto_24657 - SURFACE
      ?auto_24658 - PLACE
      ?auto_24661 - HOIST
      ?auto_24655 - SURFACE
      ?auto_24659 - SURFACE
      ?auto_24663 - TRUCK
      ?auto_24662 - PLACE
      ?auto_24664 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24653 ?auto_24652 ) ( IS-CRATE ?auto_24650 ) ( not ( = ?auto_24650 ?auto_24651 ) ) ( not ( = ?auto_24654 ?auto_24652 ) ) ( HOIST-AT ?auto_24660 ?auto_24654 ) ( not ( = ?auto_24653 ?auto_24660 ) ) ( AVAILABLE ?auto_24660 ) ( SURFACE-AT ?auto_24650 ?auto_24654 ) ( ON ?auto_24650 ?auto_24656 ) ( CLEAR ?auto_24650 ) ( not ( = ?auto_24650 ?auto_24656 ) ) ( not ( = ?auto_24651 ?auto_24656 ) ) ( IS-CRATE ?auto_24651 ) ( not ( = ?auto_24650 ?auto_24657 ) ) ( not ( = ?auto_24651 ?auto_24657 ) ) ( not ( = ?auto_24656 ?auto_24657 ) ) ( not ( = ?auto_24658 ?auto_24652 ) ) ( not ( = ?auto_24654 ?auto_24658 ) ) ( HOIST-AT ?auto_24661 ?auto_24658 ) ( not ( = ?auto_24653 ?auto_24661 ) ) ( not ( = ?auto_24660 ?auto_24661 ) ) ( AVAILABLE ?auto_24661 ) ( SURFACE-AT ?auto_24651 ?auto_24658 ) ( ON ?auto_24651 ?auto_24655 ) ( CLEAR ?auto_24651 ) ( not ( = ?auto_24650 ?auto_24655 ) ) ( not ( = ?auto_24651 ?auto_24655 ) ) ( not ( = ?auto_24656 ?auto_24655 ) ) ( not ( = ?auto_24657 ?auto_24655 ) ) ( SURFACE-AT ?auto_24659 ?auto_24652 ) ( CLEAR ?auto_24659 ) ( IS-CRATE ?auto_24657 ) ( not ( = ?auto_24650 ?auto_24659 ) ) ( not ( = ?auto_24651 ?auto_24659 ) ) ( not ( = ?auto_24656 ?auto_24659 ) ) ( not ( = ?auto_24657 ?auto_24659 ) ) ( not ( = ?auto_24655 ?auto_24659 ) ) ( AVAILABLE ?auto_24653 ) ( TRUCK-AT ?auto_24663 ?auto_24662 ) ( not ( = ?auto_24662 ?auto_24652 ) ) ( not ( = ?auto_24654 ?auto_24662 ) ) ( not ( = ?auto_24658 ?auto_24662 ) ) ( HOIST-AT ?auto_24664 ?auto_24662 ) ( LIFTING ?auto_24664 ?auto_24657 ) ( not ( = ?auto_24653 ?auto_24664 ) ) ( not ( = ?auto_24660 ?auto_24664 ) ) ( not ( = ?auto_24661 ?auto_24664 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24664 ?auto_24657 ?auto_24663 ?auto_24662 )
      ( MAKE-ON ?auto_24650 ?auto_24651 )
      ( MAKE-ON-VERIFY ?auto_24650 ?auto_24651 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24665 - SURFACE
      ?auto_24666 - SURFACE
    )
    :vars
    (
      ?auto_24672 - HOIST
      ?auto_24679 - PLACE
      ?auto_24675 - PLACE
      ?auto_24678 - HOIST
      ?auto_24668 - SURFACE
      ?auto_24673 - SURFACE
      ?auto_24677 - PLACE
      ?auto_24674 - HOIST
      ?auto_24671 - SURFACE
      ?auto_24669 - SURFACE
      ?auto_24667 - TRUCK
      ?auto_24670 - PLACE
      ?auto_24676 - HOIST
      ?auto_24680 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24672 ?auto_24679 ) ( IS-CRATE ?auto_24665 ) ( not ( = ?auto_24665 ?auto_24666 ) ) ( not ( = ?auto_24675 ?auto_24679 ) ) ( HOIST-AT ?auto_24678 ?auto_24675 ) ( not ( = ?auto_24672 ?auto_24678 ) ) ( AVAILABLE ?auto_24678 ) ( SURFACE-AT ?auto_24665 ?auto_24675 ) ( ON ?auto_24665 ?auto_24668 ) ( CLEAR ?auto_24665 ) ( not ( = ?auto_24665 ?auto_24668 ) ) ( not ( = ?auto_24666 ?auto_24668 ) ) ( IS-CRATE ?auto_24666 ) ( not ( = ?auto_24665 ?auto_24673 ) ) ( not ( = ?auto_24666 ?auto_24673 ) ) ( not ( = ?auto_24668 ?auto_24673 ) ) ( not ( = ?auto_24677 ?auto_24679 ) ) ( not ( = ?auto_24675 ?auto_24677 ) ) ( HOIST-AT ?auto_24674 ?auto_24677 ) ( not ( = ?auto_24672 ?auto_24674 ) ) ( not ( = ?auto_24678 ?auto_24674 ) ) ( AVAILABLE ?auto_24674 ) ( SURFACE-AT ?auto_24666 ?auto_24677 ) ( ON ?auto_24666 ?auto_24671 ) ( CLEAR ?auto_24666 ) ( not ( = ?auto_24665 ?auto_24671 ) ) ( not ( = ?auto_24666 ?auto_24671 ) ) ( not ( = ?auto_24668 ?auto_24671 ) ) ( not ( = ?auto_24673 ?auto_24671 ) ) ( SURFACE-AT ?auto_24669 ?auto_24679 ) ( CLEAR ?auto_24669 ) ( IS-CRATE ?auto_24673 ) ( not ( = ?auto_24665 ?auto_24669 ) ) ( not ( = ?auto_24666 ?auto_24669 ) ) ( not ( = ?auto_24668 ?auto_24669 ) ) ( not ( = ?auto_24673 ?auto_24669 ) ) ( not ( = ?auto_24671 ?auto_24669 ) ) ( AVAILABLE ?auto_24672 ) ( TRUCK-AT ?auto_24667 ?auto_24670 ) ( not ( = ?auto_24670 ?auto_24679 ) ) ( not ( = ?auto_24675 ?auto_24670 ) ) ( not ( = ?auto_24677 ?auto_24670 ) ) ( HOIST-AT ?auto_24676 ?auto_24670 ) ( not ( = ?auto_24672 ?auto_24676 ) ) ( not ( = ?auto_24678 ?auto_24676 ) ) ( not ( = ?auto_24674 ?auto_24676 ) ) ( AVAILABLE ?auto_24676 ) ( SURFACE-AT ?auto_24673 ?auto_24670 ) ( ON ?auto_24673 ?auto_24680 ) ( CLEAR ?auto_24673 ) ( not ( = ?auto_24665 ?auto_24680 ) ) ( not ( = ?auto_24666 ?auto_24680 ) ) ( not ( = ?auto_24668 ?auto_24680 ) ) ( not ( = ?auto_24673 ?auto_24680 ) ) ( not ( = ?auto_24671 ?auto_24680 ) ) ( not ( = ?auto_24669 ?auto_24680 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24676 ?auto_24673 ?auto_24680 ?auto_24670 )
      ( MAKE-ON ?auto_24665 ?auto_24666 )
      ( MAKE-ON-VERIFY ?auto_24665 ?auto_24666 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24681 - SURFACE
      ?auto_24682 - SURFACE
    )
    :vars
    (
      ?auto_24687 - HOIST
      ?auto_24694 - PLACE
      ?auto_24686 - PLACE
      ?auto_24684 - HOIST
      ?auto_24689 - SURFACE
      ?auto_24695 - SURFACE
      ?auto_24683 - PLACE
      ?auto_24696 - HOIST
      ?auto_24688 - SURFACE
      ?auto_24692 - SURFACE
      ?auto_24690 - PLACE
      ?auto_24693 - HOIST
      ?auto_24691 - SURFACE
      ?auto_24685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24687 ?auto_24694 ) ( IS-CRATE ?auto_24681 ) ( not ( = ?auto_24681 ?auto_24682 ) ) ( not ( = ?auto_24686 ?auto_24694 ) ) ( HOIST-AT ?auto_24684 ?auto_24686 ) ( not ( = ?auto_24687 ?auto_24684 ) ) ( AVAILABLE ?auto_24684 ) ( SURFACE-AT ?auto_24681 ?auto_24686 ) ( ON ?auto_24681 ?auto_24689 ) ( CLEAR ?auto_24681 ) ( not ( = ?auto_24681 ?auto_24689 ) ) ( not ( = ?auto_24682 ?auto_24689 ) ) ( IS-CRATE ?auto_24682 ) ( not ( = ?auto_24681 ?auto_24695 ) ) ( not ( = ?auto_24682 ?auto_24695 ) ) ( not ( = ?auto_24689 ?auto_24695 ) ) ( not ( = ?auto_24683 ?auto_24694 ) ) ( not ( = ?auto_24686 ?auto_24683 ) ) ( HOIST-AT ?auto_24696 ?auto_24683 ) ( not ( = ?auto_24687 ?auto_24696 ) ) ( not ( = ?auto_24684 ?auto_24696 ) ) ( AVAILABLE ?auto_24696 ) ( SURFACE-AT ?auto_24682 ?auto_24683 ) ( ON ?auto_24682 ?auto_24688 ) ( CLEAR ?auto_24682 ) ( not ( = ?auto_24681 ?auto_24688 ) ) ( not ( = ?auto_24682 ?auto_24688 ) ) ( not ( = ?auto_24689 ?auto_24688 ) ) ( not ( = ?auto_24695 ?auto_24688 ) ) ( SURFACE-AT ?auto_24692 ?auto_24694 ) ( CLEAR ?auto_24692 ) ( IS-CRATE ?auto_24695 ) ( not ( = ?auto_24681 ?auto_24692 ) ) ( not ( = ?auto_24682 ?auto_24692 ) ) ( not ( = ?auto_24689 ?auto_24692 ) ) ( not ( = ?auto_24695 ?auto_24692 ) ) ( not ( = ?auto_24688 ?auto_24692 ) ) ( AVAILABLE ?auto_24687 ) ( not ( = ?auto_24690 ?auto_24694 ) ) ( not ( = ?auto_24686 ?auto_24690 ) ) ( not ( = ?auto_24683 ?auto_24690 ) ) ( HOIST-AT ?auto_24693 ?auto_24690 ) ( not ( = ?auto_24687 ?auto_24693 ) ) ( not ( = ?auto_24684 ?auto_24693 ) ) ( not ( = ?auto_24696 ?auto_24693 ) ) ( AVAILABLE ?auto_24693 ) ( SURFACE-AT ?auto_24695 ?auto_24690 ) ( ON ?auto_24695 ?auto_24691 ) ( CLEAR ?auto_24695 ) ( not ( = ?auto_24681 ?auto_24691 ) ) ( not ( = ?auto_24682 ?auto_24691 ) ) ( not ( = ?auto_24689 ?auto_24691 ) ) ( not ( = ?auto_24695 ?auto_24691 ) ) ( not ( = ?auto_24688 ?auto_24691 ) ) ( not ( = ?auto_24692 ?auto_24691 ) ) ( TRUCK-AT ?auto_24685 ?auto_24694 ) )
    :subtasks
    ( ( !DRIVE ?auto_24685 ?auto_24694 ?auto_24690 )
      ( MAKE-ON ?auto_24681 ?auto_24682 )
      ( MAKE-ON-VERIFY ?auto_24681 ?auto_24682 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24697 - SURFACE
      ?auto_24698 - SURFACE
    )
    :vars
    (
      ?auto_24700 - HOIST
      ?auto_24709 - PLACE
      ?auto_24711 - PLACE
      ?auto_24708 - HOIST
      ?auto_24706 - SURFACE
      ?auto_24704 - SURFACE
      ?auto_24701 - PLACE
      ?auto_24710 - HOIST
      ?auto_24702 - SURFACE
      ?auto_24703 - SURFACE
      ?auto_24707 - PLACE
      ?auto_24699 - HOIST
      ?auto_24712 - SURFACE
      ?auto_24705 - TRUCK
      ?auto_24713 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24700 ?auto_24709 ) ( IS-CRATE ?auto_24697 ) ( not ( = ?auto_24697 ?auto_24698 ) ) ( not ( = ?auto_24711 ?auto_24709 ) ) ( HOIST-AT ?auto_24708 ?auto_24711 ) ( not ( = ?auto_24700 ?auto_24708 ) ) ( AVAILABLE ?auto_24708 ) ( SURFACE-AT ?auto_24697 ?auto_24711 ) ( ON ?auto_24697 ?auto_24706 ) ( CLEAR ?auto_24697 ) ( not ( = ?auto_24697 ?auto_24706 ) ) ( not ( = ?auto_24698 ?auto_24706 ) ) ( IS-CRATE ?auto_24698 ) ( not ( = ?auto_24697 ?auto_24704 ) ) ( not ( = ?auto_24698 ?auto_24704 ) ) ( not ( = ?auto_24706 ?auto_24704 ) ) ( not ( = ?auto_24701 ?auto_24709 ) ) ( not ( = ?auto_24711 ?auto_24701 ) ) ( HOIST-AT ?auto_24710 ?auto_24701 ) ( not ( = ?auto_24700 ?auto_24710 ) ) ( not ( = ?auto_24708 ?auto_24710 ) ) ( AVAILABLE ?auto_24710 ) ( SURFACE-AT ?auto_24698 ?auto_24701 ) ( ON ?auto_24698 ?auto_24702 ) ( CLEAR ?auto_24698 ) ( not ( = ?auto_24697 ?auto_24702 ) ) ( not ( = ?auto_24698 ?auto_24702 ) ) ( not ( = ?auto_24706 ?auto_24702 ) ) ( not ( = ?auto_24704 ?auto_24702 ) ) ( IS-CRATE ?auto_24704 ) ( not ( = ?auto_24697 ?auto_24703 ) ) ( not ( = ?auto_24698 ?auto_24703 ) ) ( not ( = ?auto_24706 ?auto_24703 ) ) ( not ( = ?auto_24704 ?auto_24703 ) ) ( not ( = ?auto_24702 ?auto_24703 ) ) ( not ( = ?auto_24707 ?auto_24709 ) ) ( not ( = ?auto_24711 ?auto_24707 ) ) ( not ( = ?auto_24701 ?auto_24707 ) ) ( HOIST-AT ?auto_24699 ?auto_24707 ) ( not ( = ?auto_24700 ?auto_24699 ) ) ( not ( = ?auto_24708 ?auto_24699 ) ) ( not ( = ?auto_24710 ?auto_24699 ) ) ( AVAILABLE ?auto_24699 ) ( SURFACE-AT ?auto_24704 ?auto_24707 ) ( ON ?auto_24704 ?auto_24712 ) ( CLEAR ?auto_24704 ) ( not ( = ?auto_24697 ?auto_24712 ) ) ( not ( = ?auto_24698 ?auto_24712 ) ) ( not ( = ?auto_24706 ?auto_24712 ) ) ( not ( = ?auto_24704 ?auto_24712 ) ) ( not ( = ?auto_24702 ?auto_24712 ) ) ( not ( = ?auto_24703 ?auto_24712 ) ) ( TRUCK-AT ?auto_24705 ?auto_24709 ) ( SURFACE-AT ?auto_24713 ?auto_24709 ) ( CLEAR ?auto_24713 ) ( LIFTING ?auto_24700 ?auto_24703 ) ( IS-CRATE ?auto_24703 ) ( not ( = ?auto_24697 ?auto_24713 ) ) ( not ( = ?auto_24698 ?auto_24713 ) ) ( not ( = ?auto_24706 ?auto_24713 ) ) ( not ( = ?auto_24704 ?auto_24713 ) ) ( not ( = ?auto_24702 ?auto_24713 ) ) ( not ( = ?auto_24703 ?auto_24713 ) ) ( not ( = ?auto_24712 ?auto_24713 ) ) )
    :subtasks
    ( ( !DROP ?auto_24700 ?auto_24703 ?auto_24713 ?auto_24709 )
      ( MAKE-ON ?auto_24697 ?auto_24698 )
      ( MAKE-ON-VERIFY ?auto_24697 ?auto_24698 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24714 - SURFACE
      ?auto_24715 - SURFACE
    )
    :vars
    (
      ?auto_24716 - HOIST
      ?auto_24730 - PLACE
      ?auto_24721 - PLACE
      ?auto_24724 - HOIST
      ?auto_24719 - SURFACE
      ?auto_24718 - SURFACE
      ?auto_24722 - PLACE
      ?auto_24728 - HOIST
      ?auto_24720 - SURFACE
      ?auto_24725 - SURFACE
      ?auto_24729 - PLACE
      ?auto_24723 - HOIST
      ?auto_24717 - SURFACE
      ?auto_24727 - TRUCK
      ?auto_24726 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24716 ?auto_24730 ) ( IS-CRATE ?auto_24714 ) ( not ( = ?auto_24714 ?auto_24715 ) ) ( not ( = ?auto_24721 ?auto_24730 ) ) ( HOIST-AT ?auto_24724 ?auto_24721 ) ( not ( = ?auto_24716 ?auto_24724 ) ) ( AVAILABLE ?auto_24724 ) ( SURFACE-AT ?auto_24714 ?auto_24721 ) ( ON ?auto_24714 ?auto_24719 ) ( CLEAR ?auto_24714 ) ( not ( = ?auto_24714 ?auto_24719 ) ) ( not ( = ?auto_24715 ?auto_24719 ) ) ( IS-CRATE ?auto_24715 ) ( not ( = ?auto_24714 ?auto_24718 ) ) ( not ( = ?auto_24715 ?auto_24718 ) ) ( not ( = ?auto_24719 ?auto_24718 ) ) ( not ( = ?auto_24722 ?auto_24730 ) ) ( not ( = ?auto_24721 ?auto_24722 ) ) ( HOIST-AT ?auto_24728 ?auto_24722 ) ( not ( = ?auto_24716 ?auto_24728 ) ) ( not ( = ?auto_24724 ?auto_24728 ) ) ( AVAILABLE ?auto_24728 ) ( SURFACE-AT ?auto_24715 ?auto_24722 ) ( ON ?auto_24715 ?auto_24720 ) ( CLEAR ?auto_24715 ) ( not ( = ?auto_24714 ?auto_24720 ) ) ( not ( = ?auto_24715 ?auto_24720 ) ) ( not ( = ?auto_24719 ?auto_24720 ) ) ( not ( = ?auto_24718 ?auto_24720 ) ) ( IS-CRATE ?auto_24718 ) ( not ( = ?auto_24714 ?auto_24725 ) ) ( not ( = ?auto_24715 ?auto_24725 ) ) ( not ( = ?auto_24719 ?auto_24725 ) ) ( not ( = ?auto_24718 ?auto_24725 ) ) ( not ( = ?auto_24720 ?auto_24725 ) ) ( not ( = ?auto_24729 ?auto_24730 ) ) ( not ( = ?auto_24721 ?auto_24729 ) ) ( not ( = ?auto_24722 ?auto_24729 ) ) ( HOIST-AT ?auto_24723 ?auto_24729 ) ( not ( = ?auto_24716 ?auto_24723 ) ) ( not ( = ?auto_24724 ?auto_24723 ) ) ( not ( = ?auto_24728 ?auto_24723 ) ) ( AVAILABLE ?auto_24723 ) ( SURFACE-AT ?auto_24718 ?auto_24729 ) ( ON ?auto_24718 ?auto_24717 ) ( CLEAR ?auto_24718 ) ( not ( = ?auto_24714 ?auto_24717 ) ) ( not ( = ?auto_24715 ?auto_24717 ) ) ( not ( = ?auto_24719 ?auto_24717 ) ) ( not ( = ?auto_24718 ?auto_24717 ) ) ( not ( = ?auto_24720 ?auto_24717 ) ) ( not ( = ?auto_24725 ?auto_24717 ) ) ( TRUCK-AT ?auto_24727 ?auto_24730 ) ( SURFACE-AT ?auto_24726 ?auto_24730 ) ( CLEAR ?auto_24726 ) ( IS-CRATE ?auto_24725 ) ( not ( = ?auto_24714 ?auto_24726 ) ) ( not ( = ?auto_24715 ?auto_24726 ) ) ( not ( = ?auto_24719 ?auto_24726 ) ) ( not ( = ?auto_24718 ?auto_24726 ) ) ( not ( = ?auto_24720 ?auto_24726 ) ) ( not ( = ?auto_24725 ?auto_24726 ) ) ( not ( = ?auto_24717 ?auto_24726 ) ) ( AVAILABLE ?auto_24716 ) ( IN ?auto_24725 ?auto_24727 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24716 ?auto_24725 ?auto_24727 ?auto_24730 )
      ( MAKE-ON ?auto_24714 ?auto_24715 )
      ( MAKE-ON-VERIFY ?auto_24714 ?auto_24715 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24731 - SURFACE
      ?auto_24732 - SURFACE
    )
    :vars
    (
      ?auto_24739 - HOIST
      ?auto_24744 - PLACE
      ?auto_24742 - PLACE
      ?auto_24737 - HOIST
      ?auto_24740 - SURFACE
      ?auto_24741 - SURFACE
      ?auto_24733 - PLACE
      ?auto_24747 - HOIST
      ?auto_24734 - SURFACE
      ?auto_24745 - SURFACE
      ?auto_24735 - PLACE
      ?auto_24746 - HOIST
      ?auto_24736 - SURFACE
      ?auto_24738 - SURFACE
      ?auto_24743 - TRUCK
      ?auto_24748 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24739 ?auto_24744 ) ( IS-CRATE ?auto_24731 ) ( not ( = ?auto_24731 ?auto_24732 ) ) ( not ( = ?auto_24742 ?auto_24744 ) ) ( HOIST-AT ?auto_24737 ?auto_24742 ) ( not ( = ?auto_24739 ?auto_24737 ) ) ( AVAILABLE ?auto_24737 ) ( SURFACE-AT ?auto_24731 ?auto_24742 ) ( ON ?auto_24731 ?auto_24740 ) ( CLEAR ?auto_24731 ) ( not ( = ?auto_24731 ?auto_24740 ) ) ( not ( = ?auto_24732 ?auto_24740 ) ) ( IS-CRATE ?auto_24732 ) ( not ( = ?auto_24731 ?auto_24741 ) ) ( not ( = ?auto_24732 ?auto_24741 ) ) ( not ( = ?auto_24740 ?auto_24741 ) ) ( not ( = ?auto_24733 ?auto_24744 ) ) ( not ( = ?auto_24742 ?auto_24733 ) ) ( HOIST-AT ?auto_24747 ?auto_24733 ) ( not ( = ?auto_24739 ?auto_24747 ) ) ( not ( = ?auto_24737 ?auto_24747 ) ) ( AVAILABLE ?auto_24747 ) ( SURFACE-AT ?auto_24732 ?auto_24733 ) ( ON ?auto_24732 ?auto_24734 ) ( CLEAR ?auto_24732 ) ( not ( = ?auto_24731 ?auto_24734 ) ) ( not ( = ?auto_24732 ?auto_24734 ) ) ( not ( = ?auto_24740 ?auto_24734 ) ) ( not ( = ?auto_24741 ?auto_24734 ) ) ( IS-CRATE ?auto_24741 ) ( not ( = ?auto_24731 ?auto_24745 ) ) ( not ( = ?auto_24732 ?auto_24745 ) ) ( not ( = ?auto_24740 ?auto_24745 ) ) ( not ( = ?auto_24741 ?auto_24745 ) ) ( not ( = ?auto_24734 ?auto_24745 ) ) ( not ( = ?auto_24735 ?auto_24744 ) ) ( not ( = ?auto_24742 ?auto_24735 ) ) ( not ( = ?auto_24733 ?auto_24735 ) ) ( HOIST-AT ?auto_24746 ?auto_24735 ) ( not ( = ?auto_24739 ?auto_24746 ) ) ( not ( = ?auto_24737 ?auto_24746 ) ) ( not ( = ?auto_24747 ?auto_24746 ) ) ( AVAILABLE ?auto_24746 ) ( SURFACE-AT ?auto_24741 ?auto_24735 ) ( ON ?auto_24741 ?auto_24736 ) ( CLEAR ?auto_24741 ) ( not ( = ?auto_24731 ?auto_24736 ) ) ( not ( = ?auto_24732 ?auto_24736 ) ) ( not ( = ?auto_24740 ?auto_24736 ) ) ( not ( = ?auto_24741 ?auto_24736 ) ) ( not ( = ?auto_24734 ?auto_24736 ) ) ( not ( = ?auto_24745 ?auto_24736 ) ) ( SURFACE-AT ?auto_24738 ?auto_24744 ) ( CLEAR ?auto_24738 ) ( IS-CRATE ?auto_24745 ) ( not ( = ?auto_24731 ?auto_24738 ) ) ( not ( = ?auto_24732 ?auto_24738 ) ) ( not ( = ?auto_24740 ?auto_24738 ) ) ( not ( = ?auto_24741 ?auto_24738 ) ) ( not ( = ?auto_24734 ?auto_24738 ) ) ( not ( = ?auto_24745 ?auto_24738 ) ) ( not ( = ?auto_24736 ?auto_24738 ) ) ( AVAILABLE ?auto_24739 ) ( IN ?auto_24745 ?auto_24743 ) ( TRUCK-AT ?auto_24743 ?auto_24748 ) ( not ( = ?auto_24748 ?auto_24744 ) ) ( not ( = ?auto_24742 ?auto_24748 ) ) ( not ( = ?auto_24733 ?auto_24748 ) ) ( not ( = ?auto_24735 ?auto_24748 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24743 ?auto_24748 ?auto_24744 )
      ( MAKE-ON ?auto_24731 ?auto_24732 )
      ( MAKE-ON-VERIFY ?auto_24731 ?auto_24732 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24749 - SURFACE
      ?auto_24750 - SURFACE
    )
    :vars
    (
      ?auto_24762 - HOIST
      ?auto_24760 - PLACE
      ?auto_24758 - PLACE
      ?auto_24759 - HOIST
      ?auto_24764 - SURFACE
      ?auto_24755 - SURFACE
      ?auto_24756 - PLACE
      ?auto_24765 - HOIST
      ?auto_24752 - SURFACE
      ?auto_24766 - SURFACE
      ?auto_24753 - PLACE
      ?auto_24763 - HOIST
      ?auto_24761 - SURFACE
      ?auto_24751 - SURFACE
      ?auto_24754 - TRUCK
      ?auto_24757 - PLACE
      ?auto_24767 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24762 ?auto_24760 ) ( IS-CRATE ?auto_24749 ) ( not ( = ?auto_24749 ?auto_24750 ) ) ( not ( = ?auto_24758 ?auto_24760 ) ) ( HOIST-AT ?auto_24759 ?auto_24758 ) ( not ( = ?auto_24762 ?auto_24759 ) ) ( AVAILABLE ?auto_24759 ) ( SURFACE-AT ?auto_24749 ?auto_24758 ) ( ON ?auto_24749 ?auto_24764 ) ( CLEAR ?auto_24749 ) ( not ( = ?auto_24749 ?auto_24764 ) ) ( not ( = ?auto_24750 ?auto_24764 ) ) ( IS-CRATE ?auto_24750 ) ( not ( = ?auto_24749 ?auto_24755 ) ) ( not ( = ?auto_24750 ?auto_24755 ) ) ( not ( = ?auto_24764 ?auto_24755 ) ) ( not ( = ?auto_24756 ?auto_24760 ) ) ( not ( = ?auto_24758 ?auto_24756 ) ) ( HOIST-AT ?auto_24765 ?auto_24756 ) ( not ( = ?auto_24762 ?auto_24765 ) ) ( not ( = ?auto_24759 ?auto_24765 ) ) ( AVAILABLE ?auto_24765 ) ( SURFACE-AT ?auto_24750 ?auto_24756 ) ( ON ?auto_24750 ?auto_24752 ) ( CLEAR ?auto_24750 ) ( not ( = ?auto_24749 ?auto_24752 ) ) ( not ( = ?auto_24750 ?auto_24752 ) ) ( not ( = ?auto_24764 ?auto_24752 ) ) ( not ( = ?auto_24755 ?auto_24752 ) ) ( IS-CRATE ?auto_24755 ) ( not ( = ?auto_24749 ?auto_24766 ) ) ( not ( = ?auto_24750 ?auto_24766 ) ) ( not ( = ?auto_24764 ?auto_24766 ) ) ( not ( = ?auto_24755 ?auto_24766 ) ) ( not ( = ?auto_24752 ?auto_24766 ) ) ( not ( = ?auto_24753 ?auto_24760 ) ) ( not ( = ?auto_24758 ?auto_24753 ) ) ( not ( = ?auto_24756 ?auto_24753 ) ) ( HOIST-AT ?auto_24763 ?auto_24753 ) ( not ( = ?auto_24762 ?auto_24763 ) ) ( not ( = ?auto_24759 ?auto_24763 ) ) ( not ( = ?auto_24765 ?auto_24763 ) ) ( AVAILABLE ?auto_24763 ) ( SURFACE-AT ?auto_24755 ?auto_24753 ) ( ON ?auto_24755 ?auto_24761 ) ( CLEAR ?auto_24755 ) ( not ( = ?auto_24749 ?auto_24761 ) ) ( not ( = ?auto_24750 ?auto_24761 ) ) ( not ( = ?auto_24764 ?auto_24761 ) ) ( not ( = ?auto_24755 ?auto_24761 ) ) ( not ( = ?auto_24752 ?auto_24761 ) ) ( not ( = ?auto_24766 ?auto_24761 ) ) ( SURFACE-AT ?auto_24751 ?auto_24760 ) ( CLEAR ?auto_24751 ) ( IS-CRATE ?auto_24766 ) ( not ( = ?auto_24749 ?auto_24751 ) ) ( not ( = ?auto_24750 ?auto_24751 ) ) ( not ( = ?auto_24764 ?auto_24751 ) ) ( not ( = ?auto_24755 ?auto_24751 ) ) ( not ( = ?auto_24752 ?auto_24751 ) ) ( not ( = ?auto_24766 ?auto_24751 ) ) ( not ( = ?auto_24761 ?auto_24751 ) ) ( AVAILABLE ?auto_24762 ) ( TRUCK-AT ?auto_24754 ?auto_24757 ) ( not ( = ?auto_24757 ?auto_24760 ) ) ( not ( = ?auto_24758 ?auto_24757 ) ) ( not ( = ?auto_24756 ?auto_24757 ) ) ( not ( = ?auto_24753 ?auto_24757 ) ) ( HOIST-AT ?auto_24767 ?auto_24757 ) ( LIFTING ?auto_24767 ?auto_24766 ) ( not ( = ?auto_24762 ?auto_24767 ) ) ( not ( = ?auto_24759 ?auto_24767 ) ) ( not ( = ?auto_24765 ?auto_24767 ) ) ( not ( = ?auto_24763 ?auto_24767 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24767 ?auto_24766 ?auto_24754 ?auto_24757 )
      ( MAKE-ON ?auto_24749 ?auto_24750 )
      ( MAKE-ON-VERIFY ?auto_24749 ?auto_24750 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24768 - SURFACE
      ?auto_24769 - SURFACE
    )
    :vars
    (
      ?auto_24783 - HOIST
      ?auto_24784 - PLACE
      ?auto_24774 - PLACE
      ?auto_24779 - HOIST
      ?auto_24780 - SURFACE
      ?auto_24781 - SURFACE
      ?auto_24772 - PLACE
      ?auto_24777 - HOIST
      ?auto_24775 - SURFACE
      ?auto_24778 - SURFACE
      ?auto_24773 - PLACE
      ?auto_24785 - HOIST
      ?auto_24782 - SURFACE
      ?auto_24776 - SURFACE
      ?auto_24786 - TRUCK
      ?auto_24770 - PLACE
      ?auto_24771 - HOIST
      ?auto_24787 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24783 ?auto_24784 ) ( IS-CRATE ?auto_24768 ) ( not ( = ?auto_24768 ?auto_24769 ) ) ( not ( = ?auto_24774 ?auto_24784 ) ) ( HOIST-AT ?auto_24779 ?auto_24774 ) ( not ( = ?auto_24783 ?auto_24779 ) ) ( AVAILABLE ?auto_24779 ) ( SURFACE-AT ?auto_24768 ?auto_24774 ) ( ON ?auto_24768 ?auto_24780 ) ( CLEAR ?auto_24768 ) ( not ( = ?auto_24768 ?auto_24780 ) ) ( not ( = ?auto_24769 ?auto_24780 ) ) ( IS-CRATE ?auto_24769 ) ( not ( = ?auto_24768 ?auto_24781 ) ) ( not ( = ?auto_24769 ?auto_24781 ) ) ( not ( = ?auto_24780 ?auto_24781 ) ) ( not ( = ?auto_24772 ?auto_24784 ) ) ( not ( = ?auto_24774 ?auto_24772 ) ) ( HOIST-AT ?auto_24777 ?auto_24772 ) ( not ( = ?auto_24783 ?auto_24777 ) ) ( not ( = ?auto_24779 ?auto_24777 ) ) ( AVAILABLE ?auto_24777 ) ( SURFACE-AT ?auto_24769 ?auto_24772 ) ( ON ?auto_24769 ?auto_24775 ) ( CLEAR ?auto_24769 ) ( not ( = ?auto_24768 ?auto_24775 ) ) ( not ( = ?auto_24769 ?auto_24775 ) ) ( not ( = ?auto_24780 ?auto_24775 ) ) ( not ( = ?auto_24781 ?auto_24775 ) ) ( IS-CRATE ?auto_24781 ) ( not ( = ?auto_24768 ?auto_24778 ) ) ( not ( = ?auto_24769 ?auto_24778 ) ) ( not ( = ?auto_24780 ?auto_24778 ) ) ( not ( = ?auto_24781 ?auto_24778 ) ) ( not ( = ?auto_24775 ?auto_24778 ) ) ( not ( = ?auto_24773 ?auto_24784 ) ) ( not ( = ?auto_24774 ?auto_24773 ) ) ( not ( = ?auto_24772 ?auto_24773 ) ) ( HOIST-AT ?auto_24785 ?auto_24773 ) ( not ( = ?auto_24783 ?auto_24785 ) ) ( not ( = ?auto_24779 ?auto_24785 ) ) ( not ( = ?auto_24777 ?auto_24785 ) ) ( AVAILABLE ?auto_24785 ) ( SURFACE-AT ?auto_24781 ?auto_24773 ) ( ON ?auto_24781 ?auto_24782 ) ( CLEAR ?auto_24781 ) ( not ( = ?auto_24768 ?auto_24782 ) ) ( not ( = ?auto_24769 ?auto_24782 ) ) ( not ( = ?auto_24780 ?auto_24782 ) ) ( not ( = ?auto_24781 ?auto_24782 ) ) ( not ( = ?auto_24775 ?auto_24782 ) ) ( not ( = ?auto_24778 ?auto_24782 ) ) ( SURFACE-AT ?auto_24776 ?auto_24784 ) ( CLEAR ?auto_24776 ) ( IS-CRATE ?auto_24778 ) ( not ( = ?auto_24768 ?auto_24776 ) ) ( not ( = ?auto_24769 ?auto_24776 ) ) ( not ( = ?auto_24780 ?auto_24776 ) ) ( not ( = ?auto_24781 ?auto_24776 ) ) ( not ( = ?auto_24775 ?auto_24776 ) ) ( not ( = ?auto_24778 ?auto_24776 ) ) ( not ( = ?auto_24782 ?auto_24776 ) ) ( AVAILABLE ?auto_24783 ) ( TRUCK-AT ?auto_24786 ?auto_24770 ) ( not ( = ?auto_24770 ?auto_24784 ) ) ( not ( = ?auto_24774 ?auto_24770 ) ) ( not ( = ?auto_24772 ?auto_24770 ) ) ( not ( = ?auto_24773 ?auto_24770 ) ) ( HOIST-AT ?auto_24771 ?auto_24770 ) ( not ( = ?auto_24783 ?auto_24771 ) ) ( not ( = ?auto_24779 ?auto_24771 ) ) ( not ( = ?auto_24777 ?auto_24771 ) ) ( not ( = ?auto_24785 ?auto_24771 ) ) ( AVAILABLE ?auto_24771 ) ( SURFACE-AT ?auto_24778 ?auto_24770 ) ( ON ?auto_24778 ?auto_24787 ) ( CLEAR ?auto_24778 ) ( not ( = ?auto_24768 ?auto_24787 ) ) ( not ( = ?auto_24769 ?auto_24787 ) ) ( not ( = ?auto_24780 ?auto_24787 ) ) ( not ( = ?auto_24781 ?auto_24787 ) ) ( not ( = ?auto_24775 ?auto_24787 ) ) ( not ( = ?auto_24778 ?auto_24787 ) ) ( not ( = ?auto_24782 ?auto_24787 ) ) ( not ( = ?auto_24776 ?auto_24787 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24771 ?auto_24778 ?auto_24787 ?auto_24770 )
      ( MAKE-ON ?auto_24768 ?auto_24769 )
      ( MAKE-ON-VERIFY ?auto_24768 ?auto_24769 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24788 - SURFACE
      ?auto_24789 - SURFACE
    )
    :vars
    (
      ?auto_24806 - HOIST
      ?auto_24807 - PLACE
      ?auto_24802 - PLACE
      ?auto_24804 - HOIST
      ?auto_24801 - SURFACE
      ?auto_24794 - SURFACE
      ?auto_24797 - PLACE
      ?auto_24793 - HOIST
      ?auto_24792 - SURFACE
      ?auto_24805 - SURFACE
      ?auto_24795 - PLACE
      ?auto_24798 - HOIST
      ?auto_24800 - SURFACE
      ?auto_24790 - SURFACE
      ?auto_24791 - PLACE
      ?auto_24796 - HOIST
      ?auto_24799 - SURFACE
      ?auto_24803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24806 ?auto_24807 ) ( IS-CRATE ?auto_24788 ) ( not ( = ?auto_24788 ?auto_24789 ) ) ( not ( = ?auto_24802 ?auto_24807 ) ) ( HOIST-AT ?auto_24804 ?auto_24802 ) ( not ( = ?auto_24806 ?auto_24804 ) ) ( AVAILABLE ?auto_24804 ) ( SURFACE-AT ?auto_24788 ?auto_24802 ) ( ON ?auto_24788 ?auto_24801 ) ( CLEAR ?auto_24788 ) ( not ( = ?auto_24788 ?auto_24801 ) ) ( not ( = ?auto_24789 ?auto_24801 ) ) ( IS-CRATE ?auto_24789 ) ( not ( = ?auto_24788 ?auto_24794 ) ) ( not ( = ?auto_24789 ?auto_24794 ) ) ( not ( = ?auto_24801 ?auto_24794 ) ) ( not ( = ?auto_24797 ?auto_24807 ) ) ( not ( = ?auto_24802 ?auto_24797 ) ) ( HOIST-AT ?auto_24793 ?auto_24797 ) ( not ( = ?auto_24806 ?auto_24793 ) ) ( not ( = ?auto_24804 ?auto_24793 ) ) ( AVAILABLE ?auto_24793 ) ( SURFACE-AT ?auto_24789 ?auto_24797 ) ( ON ?auto_24789 ?auto_24792 ) ( CLEAR ?auto_24789 ) ( not ( = ?auto_24788 ?auto_24792 ) ) ( not ( = ?auto_24789 ?auto_24792 ) ) ( not ( = ?auto_24801 ?auto_24792 ) ) ( not ( = ?auto_24794 ?auto_24792 ) ) ( IS-CRATE ?auto_24794 ) ( not ( = ?auto_24788 ?auto_24805 ) ) ( not ( = ?auto_24789 ?auto_24805 ) ) ( not ( = ?auto_24801 ?auto_24805 ) ) ( not ( = ?auto_24794 ?auto_24805 ) ) ( not ( = ?auto_24792 ?auto_24805 ) ) ( not ( = ?auto_24795 ?auto_24807 ) ) ( not ( = ?auto_24802 ?auto_24795 ) ) ( not ( = ?auto_24797 ?auto_24795 ) ) ( HOIST-AT ?auto_24798 ?auto_24795 ) ( not ( = ?auto_24806 ?auto_24798 ) ) ( not ( = ?auto_24804 ?auto_24798 ) ) ( not ( = ?auto_24793 ?auto_24798 ) ) ( AVAILABLE ?auto_24798 ) ( SURFACE-AT ?auto_24794 ?auto_24795 ) ( ON ?auto_24794 ?auto_24800 ) ( CLEAR ?auto_24794 ) ( not ( = ?auto_24788 ?auto_24800 ) ) ( not ( = ?auto_24789 ?auto_24800 ) ) ( not ( = ?auto_24801 ?auto_24800 ) ) ( not ( = ?auto_24794 ?auto_24800 ) ) ( not ( = ?auto_24792 ?auto_24800 ) ) ( not ( = ?auto_24805 ?auto_24800 ) ) ( SURFACE-AT ?auto_24790 ?auto_24807 ) ( CLEAR ?auto_24790 ) ( IS-CRATE ?auto_24805 ) ( not ( = ?auto_24788 ?auto_24790 ) ) ( not ( = ?auto_24789 ?auto_24790 ) ) ( not ( = ?auto_24801 ?auto_24790 ) ) ( not ( = ?auto_24794 ?auto_24790 ) ) ( not ( = ?auto_24792 ?auto_24790 ) ) ( not ( = ?auto_24805 ?auto_24790 ) ) ( not ( = ?auto_24800 ?auto_24790 ) ) ( AVAILABLE ?auto_24806 ) ( not ( = ?auto_24791 ?auto_24807 ) ) ( not ( = ?auto_24802 ?auto_24791 ) ) ( not ( = ?auto_24797 ?auto_24791 ) ) ( not ( = ?auto_24795 ?auto_24791 ) ) ( HOIST-AT ?auto_24796 ?auto_24791 ) ( not ( = ?auto_24806 ?auto_24796 ) ) ( not ( = ?auto_24804 ?auto_24796 ) ) ( not ( = ?auto_24793 ?auto_24796 ) ) ( not ( = ?auto_24798 ?auto_24796 ) ) ( AVAILABLE ?auto_24796 ) ( SURFACE-AT ?auto_24805 ?auto_24791 ) ( ON ?auto_24805 ?auto_24799 ) ( CLEAR ?auto_24805 ) ( not ( = ?auto_24788 ?auto_24799 ) ) ( not ( = ?auto_24789 ?auto_24799 ) ) ( not ( = ?auto_24801 ?auto_24799 ) ) ( not ( = ?auto_24794 ?auto_24799 ) ) ( not ( = ?auto_24792 ?auto_24799 ) ) ( not ( = ?auto_24805 ?auto_24799 ) ) ( not ( = ?auto_24800 ?auto_24799 ) ) ( not ( = ?auto_24790 ?auto_24799 ) ) ( TRUCK-AT ?auto_24803 ?auto_24807 ) )
    :subtasks
    ( ( !DRIVE ?auto_24803 ?auto_24807 ?auto_24791 )
      ( MAKE-ON ?auto_24788 ?auto_24789 )
      ( MAKE-ON-VERIFY ?auto_24788 ?auto_24789 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24808 - SURFACE
      ?auto_24809 - SURFACE
    )
    :vars
    (
      ?auto_24827 - HOIST
      ?auto_24811 - PLACE
      ?auto_24818 - PLACE
      ?auto_24814 - HOIST
      ?auto_24820 - SURFACE
      ?auto_24810 - SURFACE
      ?auto_24819 - PLACE
      ?auto_24824 - HOIST
      ?auto_24825 - SURFACE
      ?auto_24812 - SURFACE
      ?auto_24817 - PLACE
      ?auto_24823 - HOIST
      ?auto_24813 - SURFACE
      ?auto_24822 - SURFACE
      ?auto_24821 - PLACE
      ?auto_24816 - HOIST
      ?auto_24815 - SURFACE
      ?auto_24826 - TRUCK
      ?auto_24828 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24827 ?auto_24811 ) ( IS-CRATE ?auto_24808 ) ( not ( = ?auto_24808 ?auto_24809 ) ) ( not ( = ?auto_24818 ?auto_24811 ) ) ( HOIST-AT ?auto_24814 ?auto_24818 ) ( not ( = ?auto_24827 ?auto_24814 ) ) ( AVAILABLE ?auto_24814 ) ( SURFACE-AT ?auto_24808 ?auto_24818 ) ( ON ?auto_24808 ?auto_24820 ) ( CLEAR ?auto_24808 ) ( not ( = ?auto_24808 ?auto_24820 ) ) ( not ( = ?auto_24809 ?auto_24820 ) ) ( IS-CRATE ?auto_24809 ) ( not ( = ?auto_24808 ?auto_24810 ) ) ( not ( = ?auto_24809 ?auto_24810 ) ) ( not ( = ?auto_24820 ?auto_24810 ) ) ( not ( = ?auto_24819 ?auto_24811 ) ) ( not ( = ?auto_24818 ?auto_24819 ) ) ( HOIST-AT ?auto_24824 ?auto_24819 ) ( not ( = ?auto_24827 ?auto_24824 ) ) ( not ( = ?auto_24814 ?auto_24824 ) ) ( AVAILABLE ?auto_24824 ) ( SURFACE-AT ?auto_24809 ?auto_24819 ) ( ON ?auto_24809 ?auto_24825 ) ( CLEAR ?auto_24809 ) ( not ( = ?auto_24808 ?auto_24825 ) ) ( not ( = ?auto_24809 ?auto_24825 ) ) ( not ( = ?auto_24820 ?auto_24825 ) ) ( not ( = ?auto_24810 ?auto_24825 ) ) ( IS-CRATE ?auto_24810 ) ( not ( = ?auto_24808 ?auto_24812 ) ) ( not ( = ?auto_24809 ?auto_24812 ) ) ( not ( = ?auto_24820 ?auto_24812 ) ) ( not ( = ?auto_24810 ?auto_24812 ) ) ( not ( = ?auto_24825 ?auto_24812 ) ) ( not ( = ?auto_24817 ?auto_24811 ) ) ( not ( = ?auto_24818 ?auto_24817 ) ) ( not ( = ?auto_24819 ?auto_24817 ) ) ( HOIST-AT ?auto_24823 ?auto_24817 ) ( not ( = ?auto_24827 ?auto_24823 ) ) ( not ( = ?auto_24814 ?auto_24823 ) ) ( not ( = ?auto_24824 ?auto_24823 ) ) ( AVAILABLE ?auto_24823 ) ( SURFACE-AT ?auto_24810 ?auto_24817 ) ( ON ?auto_24810 ?auto_24813 ) ( CLEAR ?auto_24810 ) ( not ( = ?auto_24808 ?auto_24813 ) ) ( not ( = ?auto_24809 ?auto_24813 ) ) ( not ( = ?auto_24820 ?auto_24813 ) ) ( not ( = ?auto_24810 ?auto_24813 ) ) ( not ( = ?auto_24825 ?auto_24813 ) ) ( not ( = ?auto_24812 ?auto_24813 ) ) ( IS-CRATE ?auto_24812 ) ( not ( = ?auto_24808 ?auto_24822 ) ) ( not ( = ?auto_24809 ?auto_24822 ) ) ( not ( = ?auto_24820 ?auto_24822 ) ) ( not ( = ?auto_24810 ?auto_24822 ) ) ( not ( = ?auto_24825 ?auto_24822 ) ) ( not ( = ?auto_24812 ?auto_24822 ) ) ( not ( = ?auto_24813 ?auto_24822 ) ) ( not ( = ?auto_24821 ?auto_24811 ) ) ( not ( = ?auto_24818 ?auto_24821 ) ) ( not ( = ?auto_24819 ?auto_24821 ) ) ( not ( = ?auto_24817 ?auto_24821 ) ) ( HOIST-AT ?auto_24816 ?auto_24821 ) ( not ( = ?auto_24827 ?auto_24816 ) ) ( not ( = ?auto_24814 ?auto_24816 ) ) ( not ( = ?auto_24824 ?auto_24816 ) ) ( not ( = ?auto_24823 ?auto_24816 ) ) ( AVAILABLE ?auto_24816 ) ( SURFACE-AT ?auto_24812 ?auto_24821 ) ( ON ?auto_24812 ?auto_24815 ) ( CLEAR ?auto_24812 ) ( not ( = ?auto_24808 ?auto_24815 ) ) ( not ( = ?auto_24809 ?auto_24815 ) ) ( not ( = ?auto_24820 ?auto_24815 ) ) ( not ( = ?auto_24810 ?auto_24815 ) ) ( not ( = ?auto_24825 ?auto_24815 ) ) ( not ( = ?auto_24812 ?auto_24815 ) ) ( not ( = ?auto_24813 ?auto_24815 ) ) ( not ( = ?auto_24822 ?auto_24815 ) ) ( TRUCK-AT ?auto_24826 ?auto_24811 ) ( SURFACE-AT ?auto_24828 ?auto_24811 ) ( CLEAR ?auto_24828 ) ( LIFTING ?auto_24827 ?auto_24822 ) ( IS-CRATE ?auto_24822 ) ( not ( = ?auto_24808 ?auto_24828 ) ) ( not ( = ?auto_24809 ?auto_24828 ) ) ( not ( = ?auto_24820 ?auto_24828 ) ) ( not ( = ?auto_24810 ?auto_24828 ) ) ( not ( = ?auto_24825 ?auto_24828 ) ) ( not ( = ?auto_24812 ?auto_24828 ) ) ( not ( = ?auto_24813 ?auto_24828 ) ) ( not ( = ?auto_24822 ?auto_24828 ) ) ( not ( = ?auto_24815 ?auto_24828 ) ) )
    :subtasks
    ( ( !DROP ?auto_24827 ?auto_24822 ?auto_24828 ?auto_24811 )
      ( MAKE-ON ?auto_24808 ?auto_24809 )
      ( MAKE-ON-VERIFY ?auto_24808 ?auto_24809 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24829 - SURFACE
      ?auto_24830 - SURFACE
    )
    :vars
    (
      ?auto_24831 - HOIST
      ?auto_24839 - PLACE
      ?auto_24837 - PLACE
      ?auto_24842 - HOIST
      ?auto_24844 - SURFACE
      ?auto_24838 - SURFACE
      ?auto_24832 - PLACE
      ?auto_24833 - HOIST
      ?auto_24848 - SURFACE
      ?auto_24840 - SURFACE
      ?auto_24846 - PLACE
      ?auto_24845 - HOIST
      ?auto_24841 - SURFACE
      ?auto_24834 - SURFACE
      ?auto_24847 - PLACE
      ?auto_24849 - HOIST
      ?auto_24843 - SURFACE
      ?auto_24835 - TRUCK
      ?auto_24836 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24831 ?auto_24839 ) ( IS-CRATE ?auto_24829 ) ( not ( = ?auto_24829 ?auto_24830 ) ) ( not ( = ?auto_24837 ?auto_24839 ) ) ( HOIST-AT ?auto_24842 ?auto_24837 ) ( not ( = ?auto_24831 ?auto_24842 ) ) ( AVAILABLE ?auto_24842 ) ( SURFACE-AT ?auto_24829 ?auto_24837 ) ( ON ?auto_24829 ?auto_24844 ) ( CLEAR ?auto_24829 ) ( not ( = ?auto_24829 ?auto_24844 ) ) ( not ( = ?auto_24830 ?auto_24844 ) ) ( IS-CRATE ?auto_24830 ) ( not ( = ?auto_24829 ?auto_24838 ) ) ( not ( = ?auto_24830 ?auto_24838 ) ) ( not ( = ?auto_24844 ?auto_24838 ) ) ( not ( = ?auto_24832 ?auto_24839 ) ) ( not ( = ?auto_24837 ?auto_24832 ) ) ( HOIST-AT ?auto_24833 ?auto_24832 ) ( not ( = ?auto_24831 ?auto_24833 ) ) ( not ( = ?auto_24842 ?auto_24833 ) ) ( AVAILABLE ?auto_24833 ) ( SURFACE-AT ?auto_24830 ?auto_24832 ) ( ON ?auto_24830 ?auto_24848 ) ( CLEAR ?auto_24830 ) ( not ( = ?auto_24829 ?auto_24848 ) ) ( not ( = ?auto_24830 ?auto_24848 ) ) ( not ( = ?auto_24844 ?auto_24848 ) ) ( not ( = ?auto_24838 ?auto_24848 ) ) ( IS-CRATE ?auto_24838 ) ( not ( = ?auto_24829 ?auto_24840 ) ) ( not ( = ?auto_24830 ?auto_24840 ) ) ( not ( = ?auto_24844 ?auto_24840 ) ) ( not ( = ?auto_24838 ?auto_24840 ) ) ( not ( = ?auto_24848 ?auto_24840 ) ) ( not ( = ?auto_24846 ?auto_24839 ) ) ( not ( = ?auto_24837 ?auto_24846 ) ) ( not ( = ?auto_24832 ?auto_24846 ) ) ( HOIST-AT ?auto_24845 ?auto_24846 ) ( not ( = ?auto_24831 ?auto_24845 ) ) ( not ( = ?auto_24842 ?auto_24845 ) ) ( not ( = ?auto_24833 ?auto_24845 ) ) ( AVAILABLE ?auto_24845 ) ( SURFACE-AT ?auto_24838 ?auto_24846 ) ( ON ?auto_24838 ?auto_24841 ) ( CLEAR ?auto_24838 ) ( not ( = ?auto_24829 ?auto_24841 ) ) ( not ( = ?auto_24830 ?auto_24841 ) ) ( not ( = ?auto_24844 ?auto_24841 ) ) ( not ( = ?auto_24838 ?auto_24841 ) ) ( not ( = ?auto_24848 ?auto_24841 ) ) ( not ( = ?auto_24840 ?auto_24841 ) ) ( IS-CRATE ?auto_24840 ) ( not ( = ?auto_24829 ?auto_24834 ) ) ( not ( = ?auto_24830 ?auto_24834 ) ) ( not ( = ?auto_24844 ?auto_24834 ) ) ( not ( = ?auto_24838 ?auto_24834 ) ) ( not ( = ?auto_24848 ?auto_24834 ) ) ( not ( = ?auto_24840 ?auto_24834 ) ) ( not ( = ?auto_24841 ?auto_24834 ) ) ( not ( = ?auto_24847 ?auto_24839 ) ) ( not ( = ?auto_24837 ?auto_24847 ) ) ( not ( = ?auto_24832 ?auto_24847 ) ) ( not ( = ?auto_24846 ?auto_24847 ) ) ( HOIST-AT ?auto_24849 ?auto_24847 ) ( not ( = ?auto_24831 ?auto_24849 ) ) ( not ( = ?auto_24842 ?auto_24849 ) ) ( not ( = ?auto_24833 ?auto_24849 ) ) ( not ( = ?auto_24845 ?auto_24849 ) ) ( AVAILABLE ?auto_24849 ) ( SURFACE-AT ?auto_24840 ?auto_24847 ) ( ON ?auto_24840 ?auto_24843 ) ( CLEAR ?auto_24840 ) ( not ( = ?auto_24829 ?auto_24843 ) ) ( not ( = ?auto_24830 ?auto_24843 ) ) ( not ( = ?auto_24844 ?auto_24843 ) ) ( not ( = ?auto_24838 ?auto_24843 ) ) ( not ( = ?auto_24848 ?auto_24843 ) ) ( not ( = ?auto_24840 ?auto_24843 ) ) ( not ( = ?auto_24841 ?auto_24843 ) ) ( not ( = ?auto_24834 ?auto_24843 ) ) ( TRUCK-AT ?auto_24835 ?auto_24839 ) ( SURFACE-AT ?auto_24836 ?auto_24839 ) ( CLEAR ?auto_24836 ) ( IS-CRATE ?auto_24834 ) ( not ( = ?auto_24829 ?auto_24836 ) ) ( not ( = ?auto_24830 ?auto_24836 ) ) ( not ( = ?auto_24844 ?auto_24836 ) ) ( not ( = ?auto_24838 ?auto_24836 ) ) ( not ( = ?auto_24848 ?auto_24836 ) ) ( not ( = ?auto_24840 ?auto_24836 ) ) ( not ( = ?auto_24841 ?auto_24836 ) ) ( not ( = ?auto_24834 ?auto_24836 ) ) ( not ( = ?auto_24843 ?auto_24836 ) ) ( AVAILABLE ?auto_24831 ) ( IN ?auto_24834 ?auto_24835 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24831 ?auto_24834 ?auto_24835 ?auto_24839 )
      ( MAKE-ON ?auto_24829 ?auto_24830 )
      ( MAKE-ON-VERIFY ?auto_24829 ?auto_24830 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24850 - SURFACE
      ?auto_24851 - SURFACE
    )
    :vars
    (
      ?auto_24861 - HOIST
      ?auto_24868 - PLACE
      ?auto_24853 - PLACE
      ?auto_24869 - HOIST
      ?auto_24855 - SURFACE
      ?auto_24852 - SURFACE
      ?auto_24858 - PLACE
      ?auto_24857 - HOIST
      ?auto_24864 - SURFACE
      ?auto_24870 - SURFACE
      ?auto_24866 - PLACE
      ?auto_24862 - HOIST
      ?auto_24854 - SURFACE
      ?auto_24867 - SURFACE
      ?auto_24863 - PLACE
      ?auto_24865 - HOIST
      ?auto_24860 - SURFACE
      ?auto_24856 - SURFACE
      ?auto_24859 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24861 ?auto_24868 ) ( IS-CRATE ?auto_24850 ) ( not ( = ?auto_24850 ?auto_24851 ) ) ( not ( = ?auto_24853 ?auto_24868 ) ) ( HOIST-AT ?auto_24869 ?auto_24853 ) ( not ( = ?auto_24861 ?auto_24869 ) ) ( AVAILABLE ?auto_24869 ) ( SURFACE-AT ?auto_24850 ?auto_24853 ) ( ON ?auto_24850 ?auto_24855 ) ( CLEAR ?auto_24850 ) ( not ( = ?auto_24850 ?auto_24855 ) ) ( not ( = ?auto_24851 ?auto_24855 ) ) ( IS-CRATE ?auto_24851 ) ( not ( = ?auto_24850 ?auto_24852 ) ) ( not ( = ?auto_24851 ?auto_24852 ) ) ( not ( = ?auto_24855 ?auto_24852 ) ) ( not ( = ?auto_24858 ?auto_24868 ) ) ( not ( = ?auto_24853 ?auto_24858 ) ) ( HOIST-AT ?auto_24857 ?auto_24858 ) ( not ( = ?auto_24861 ?auto_24857 ) ) ( not ( = ?auto_24869 ?auto_24857 ) ) ( AVAILABLE ?auto_24857 ) ( SURFACE-AT ?auto_24851 ?auto_24858 ) ( ON ?auto_24851 ?auto_24864 ) ( CLEAR ?auto_24851 ) ( not ( = ?auto_24850 ?auto_24864 ) ) ( not ( = ?auto_24851 ?auto_24864 ) ) ( not ( = ?auto_24855 ?auto_24864 ) ) ( not ( = ?auto_24852 ?auto_24864 ) ) ( IS-CRATE ?auto_24852 ) ( not ( = ?auto_24850 ?auto_24870 ) ) ( not ( = ?auto_24851 ?auto_24870 ) ) ( not ( = ?auto_24855 ?auto_24870 ) ) ( not ( = ?auto_24852 ?auto_24870 ) ) ( not ( = ?auto_24864 ?auto_24870 ) ) ( not ( = ?auto_24866 ?auto_24868 ) ) ( not ( = ?auto_24853 ?auto_24866 ) ) ( not ( = ?auto_24858 ?auto_24866 ) ) ( HOIST-AT ?auto_24862 ?auto_24866 ) ( not ( = ?auto_24861 ?auto_24862 ) ) ( not ( = ?auto_24869 ?auto_24862 ) ) ( not ( = ?auto_24857 ?auto_24862 ) ) ( AVAILABLE ?auto_24862 ) ( SURFACE-AT ?auto_24852 ?auto_24866 ) ( ON ?auto_24852 ?auto_24854 ) ( CLEAR ?auto_24852 ) ( not ( = ?auto_24850 ?auto_24854 ) ) ( not ( = ?auto_24851 ?auto_24854 ) ) ( not ( = ?auto_24855 ?auto_24854 ) ) ( not ( = ?auto_24852 ?auto_24854 ) ) ( not ( = ?auto_24864 ?auto_24854 ) ) ( not ( = ?auto_24870 ?auto_24854 ) ) ( IS-CRATE ?auto_24870 ) ( not ( = ?auto_24850 ?auto_24867 ) ) ( not ( = ?auto_24851 ?auto_24867 ) ) ( not ( = ?auto_24855 ?auto_24867 ) ) ( not ( = ?auto_24852 ?auto_24867 ) ) ( not ( = ?auto_24864 ?auto_24867 ) ) ( not ( = ?auto_24870 ?auto_24867 ) ) ( not ( = ?auto_24854 ?auto_24867 ) ) ( not ( = ?auto_24863 ?auto_24868 ) ) ( not ( = ?auto_24853 ?auto_24863 ) ) ( not ( = ?auto_24858 ?auto_24863 ) ) ( not ( = ?auto_24866 ?auto_24863 ) ) ( HOIST-AT ?auto_24865 ?auto_24863 ) ( not ( = ?auto_24861 ?auto_24865 ) ) ( not ( = ?auto_24869 ?auto_24865 ) ) ( not ( = ?auto_24857 ?auto_24865 ) ) ( not ( = ?auto_24862 ?auto_24865 ) ) ( AVAILABLE ?auto_24865 ) ( SURFACE-AT ?auto_24870 ?auto_24863 ) ( ON ?auto_24870 ?auto_24860 ) ( CLEAR ?auto_24870 ) ( not ( = ?auto_24850 ?auto_24860 ) ) ( not ( = ?auto_24851 ?auto_24860 ) ) ( not ( = ?auto_24855 ?auto_24860 ) ) ( not ( = ?auto_24852 ?auto_24860 ) ) ( not ( = ?auto_24864 ?auto_24860 ) ) ( not ( = ?auto_24870 ?auto_24860 ) ) ( not ( = ?auto_24854 ?auto_24860 ) ) ( not ( = ?auto_24867 ?auto_24860 ) ) ( SURFACE-AT ?auto_24856 ?auto_24868 ) ( CLEAR ?auto_24856 ) ( IS-CRATE ?auto_24867 ) ( not ( = ?auto_24850 ?auto_24856 ) ) ( not ( = ?auto_24851 ?auto_24856 ) ) ( not ( = ?auto_24855 ?auto_24856 ) ) ( not ( = ?auto_24852 ?auto_24856 ) ) ( not ( = ?auto_24864 ?auto_24856 ) ) ( not ( = ?auto_24870 ?auto_24856 ) ) ( not ( = ?auto_24854 ?auto_24856 ) ) ( not ( = ?auto_24867 ?auto_24856 ) ) ( not ( = ?auto_24860 ?auto_24856 ) ) ( AVAILABLE ?auto_24861 ) ( IN ?auto_24867 ?auto_24859 ) ( TRUCK-AT ?auto_24859 ?auto_24858 ) )
    :subtasks
    ( ( !DRIVE ?auto_24859 ?auto_24858 ?auto_24868 )
      ( MAKE-ON ?auto_24850 ?auto_24851 )
      ( MAKE-ON-VERIFY ?auto_24850 ?auto_24851 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24871 - SURFACE
      ?auto_24872 - SURFACE
    )
    :vars
    (
      ?auto_24876 - HOIST
      ?auto_24881 - PLACE
      ?auto_24879 - PLACE
      ?auto_24878 - HOIST
      ?auto_24888 - SURFACE
      ?auto_24875 - SURFACE
      ?auto_24887 - PLACE
      ?auto_24889 - HOIST
      ?auto_24891 - SURFACE
      ?auto_24877 - SURFACE
      ?auto_24886 - PLACE
      ?auto_24890 - HOIST
      ?auto_24882 - SURFACE
      ?auto_24873 - SURFACE
      ?auto_24874 - PLACE
      ?auto_24884 - HOIST
      ?auto_24883 - SURFACE
      ?auto_24880 - SURFACE
      ?auto_24885 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24876 ?auto_24881 ) ( IS-CRATE ?auto_24871 ) ( not ( = ?auto_24871 ?auto_24872 ) ) ( not ( = ?auto_24879 ?auto_24881 ) ) ( HOIST-AT ?auto_24878 ?auto_24879 ) ( not ( = ?auto_24876 ?auto_24878 ) ) ( AVAILABLE ?auto_24878 ) ( SURFACE-AT ?auto_24871 ?auto_24879 ) ( ON ?auto_24871 ?auto_24888 ) ( CLEAR ?auto_24871 ) ( not ( = ?auto_24871 ?auto_24888 ) ) ( not ( = ?auto_24872 ?auto_24888 ) ) ( IS-CRATE ?auto_24872 ) ( not ( = ?auto_24871 ?auto_24875 ) ) ( not ( = ?auto_24872 ?auto_24875 ) ) ( not ( = ?auto_24888 ?auto_24875 ) ) ( not ( = ?auto_24887 ?auto_24881 ) ) ( not ( = ?auto_24879 ?auto_24887 ) ) ( HOIST-AT ?auto_24889 ?auto_24887 ) ( not ( = ?auto_24876 ?auto_24889 ) ) ( not ( = ?auto_24878 ?auto_24889 ) ) ( SURFACE-AT ?auto_24872 ?auto_24887 ) ( ON ?auto_24872 ?auto_24891 ) ( CLEAR ?auto_24872 ) ( not ( = ?auto_24871 ?auto_24891 ) ) ( not ( = ?auto_24872 ?auto_24891 ) ) ( not ( = ?auto_24888 ?auto_24891 ) ) ( not ( = ?auto_24875 ?auto_24891 ) ) ( IS-CRATE ?auto_24875 ) ( not ( = ?auto_24871 ?auto_24877 ) ) ( not ( = ?auto_24872 ?auto_24877 ) ) ( not ( = ?auto_24888 ?auto_24877 ) ) ( not ( = ?auto_24875 ?auto_24877 ) ) ( not ( = ?auto_24891 ?auto_24877 ) ) ( not ( = ?auto_24886 ?auto_24881 ) ) ( not ( = ?auto_24879 ?auto_24886 ) ) ( not ( = ?auto_24887 ?auto_24886 ) ) ( HOIST-AT ?auto_24890 ?auto_24886 ) ( not ( = ?auto_24876 ?auto_24890 ) ) ( not ( = ?auto_24878 ?auto_24890 ) ) ( not ( = ?auto_24889 ?auto_24890 ) ) ( AVAILABLE ?auto_24890 ) ( SURFACE-AT ?auto_24875 ?auto_24886 ) ( ON ?auto_24875 ?auto_24882 ) ( CLEAR ?auto_24875 ) ( not ( = ?auto_24871 ?auto_24882 ) ) ( not ( = ?auto_24872 ?auto_24882 ) ) ( not ( = ?auto_24888 ?auto_24882 ) ) ( not ( = ?auto_24875 ?auto_24882 ) ) ( not ( = ?auto_24891 ?auto_24882 ) ) ( not ( = ?auto_24877 ?auto_24882 ) ) ( IS-CRATE ?auto_24877 ) ( not ( = ?auto_24871 ?auto_24873 ) ) ( not ( = ?auto_24872 ?auto_24873 ) ) ( not ( = ?auto_24888 ?auto_24873 ) ) ( not ( = ?auto_24875 ?auto_24873 ) ) ( not ( = ?auto_24891 ?auto_24873 ) ) ( not ( = ?auto_24877 ?auto_24873 ) ) ( not ( = ?auto_24882 ?auto_24873 ) ) ( not ( = ?auto_24874 ?auto_24881 ) ) ( not ( = ?auto_24879 ?auto_24874 ) ) ( not ( = ?auto_24887 ?auto_24874 ) ) ( not ( = ?auto_24886 ?auto_24874 ) ) ( HOIST-AT ?auto_24884 ?auto_24874 ) ( not ( = ?auto_24876 ?auto_24884 ) ) ( not ( = ?auto_24878 ?auto_24884 ) ) ( not ( = ?auto_24889 ?auto_24884 ) ) ( not ( = ?auto_24890 ?auto_24884 ) ) ( AVAILABLE ?auto_24884 ) ( SURFACE-AT ?auto_24877 ?auto_24874 ) ( ON ?auto_24877 ?auto_24883 ) ( CLEAR ?auto_24877 ) ( not ( = ?auto_24871 ?auto_24883 ) ) ( not ( = ?auto_24872 ?auto_24883 ) ) ( not ( = ?auto_24888 ?auto_24883 ) ) ( not ( = ?auto_24875 ?auto_24883 ) ) ( not ( = ?auto_24891 ?auto_24883 ) ) ( not ( = ?auto_24877 ?auto_24883 ) ) ( not ( = ?auto_24882 ?auto_24883 ) ) ( not ( = ?auto_24873 ?auto_24883 ) ) ( SURFACE-AT ?auto_24880 ?auto_24881 ) ( CLEAR ?auto_24880 ) ( IS-CRATE ?auto_24873 ) ( not ( = ?auto_24871 ?auto_24880 ) ) ( not ( = ?auto_24872 ?auto_24880 ) ) ( not ( = ?auto_24888 ?auto_24880 ) ) ( not ( = ?auto_24875 ?auto_24880 ) ) ( not ( = ?auto_24891 ?auto_24880 ) ) ( not ( = ?auto_24877 ?auto_24880 ) ) ( not ( = ?auto_24882 ?auto_24880 ) ) ( not ( = ?auto_24873 ?auto_24880 ) ) ( not ( = ?auto_24883 ?auto_24880 ) ) ( AVAILABLE ?auto_24876 ) ( TRUCK-AT ?auto_24885 ?auto_24887 ) ( LIFTING ?auto_24889 ?auto_24873 ) )
    :subtasks
    ( ( !LOAD ?auto_24889 ?auto_24873 ?auto_24885 ?auto_24887 )
      ( MAKE-ON ?auto_24871 ?auto_24872 )
      ( MAKE-ON-VERIFY ?auto_24871 ?auto_24872 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24892 - SURFACE
      ?auto_24893 - SURFACE
    )
    :vars
    (
      ?auto_24908 - HOIST
      ?auto_24905 - PLACE
      ?auto_24904 - PLACE
      ?auto_24911 - HOIST
      ?auto_24912 - SURFACE
      ?auto_24906 - SURFACE
      ?auto_24897 - PLACE
      ?auto_24902 - HOIST
      ?auto_24900 - SURFACE
      ?auto_24899 - SURFACE
      ?auto_24896 - PLACE
      ?auto_24901 - HOIST
      ?auto_24898 - SURFACE
      ?auto_24895 - SURFACE
      ?auto_24910 - PLACE
      ?auto_24909 - HOIST
      ?auto_24894 - SURFACE
      ?auto_24903 - SURFACE
      ?auto_24907 - TRUCK
      ?auto_24913 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24908 ?auto_24905 ) ( IS-CRATE ?auto_24892 ) ( not ( = ?auto_24892 ?auto_24893 ) ) ( not ( = ?auto_24904 ?auto_24905 ) ) ( HOIST-AT ?auto_24911 ?auto_24904 ) ( not ( = ?auto_24908 ?auto_24911 ) ) ( AVAILABLE ?auto_24911 ) ( SURFACE-AT ?auto_24892 ?auto_24904 ) ( ON ?auto_24892 ?auto_24912 ) ( CLEAR ?auto_24892 ) ( not ( = ?auto_24892 ?auto_24912 ) ) ( not ( = ?auto_24893 ?auto_24912 ) ) ( IS-CRATE ?auto_24893 ) ( not ( = ?auto_24892 ?auto_24906 ) ) ( not ( = ?auto_24893 ?auto_24906 ) ) ( not ( = ?auto_24912 ?auto_24906 ) ) ( not ( = ?auto_24897 ?auto_24905 ) ) ( not ( = ?auto_24904 ?auto_24897 ) ) ( HOIST-AT ?auto_24902 ?auto_24897 ) ( not ( = ?auto_24908 ?auto_24902 ) ) ( not ( = ?auto_24911 ?auto_24902 ) ) ( SURFACE-AT ?auto_24893 ?auto_24897 ) ( ON ?auto_24893 ?auto_24900 ) ( CLEAR ?auto_24893 ) ( not ( = ?auto_24892 ?auto_24900 ) ) ( not ( = ?auto_24893 ?auto_24900 ) ) ( not ( = ?auto_24912 ?auto_24900 ) ) ( not ( = ?auto_24906 ?auto_24900 ) ) ( IS-CRATE ?auto_24906 ) ( not ( = ?auto_24892 ?auto_24899 ) ) ( not ( = ?auto_24893 ?auto_24899 ) ) ( not ( = ?auto_24912 ?auto_24899 ) ) ( not ( = ?auto_24906 ?auto_24899 ) ) ( not ( = ?auto_24900 ?auto_24899 ) ) ( not ( = ?auto_24896 ?auto_24905 ) ) ( not ( = ?auto_24904 ?auto_24896 ) ) ( not ( = ?auto_24897 ?auto_24896 ) ) ( HOIST-AT ?auto_24901 ?auto_24896 ) ( not ( = ?auto_24908 ?auto_24901 ) ) ( not ( = ?auto_24911 ?auto_24901 ) ) ( not ( = ?auto_24902 ?auto_24901 ) ) ( AVAILABLE ?auto_24901 ) ( SURFACE-AT ?auto_24906 ?auto_24896 ) ( ON ?auto_24906 ?auto_24898 ) ( CLEAR ?auto_24906 ) ( not ( = ?auto_24892 ?auto_24898 ) ) ( not ( = ?auto_24893 ?auto_24898 ) ) ( not ( = ?auto_24912 ?auto_24898 ) ) ( not ( = ?auto_24906 ?auto_24898 ) ) ( not ( = ?auto_24900 ?auto_24898 ) ) ( not ( = ?auto_24899 ?auto_24898 ) ) ( IS-CRATE ?auto_24899 ) ( not ( = ?auto_24892 ?auto_24895 ) ) ( not ( = ?auto_24893 ?auto_24895 ) ) ( not ( = ?auto_24912 ?auto_24895 ) ) ( not ( = ?auto_24906 ?auto_24895 ) ) ( not ( = ?auto_24900 ?auto_24895 ) ) ( not ( = ?auto_24899 ?auto_24895 ) ) ( not ( = ?auto_24898 ?auto_24895 ) ) ( not ( = ?auto_24910 ?auto_24905 ) ) ( not ( = ?auto_24904 ?auto_24910 ) ) ( not ( = ?auto_24897 ?auto_24910 ) ) ( not ( = ?auto_24896 ?auto_24910 ) ) ( HOIST-AT ?auto_24909 ?auto_24910 ) ( not ( = ?auto_24908 ?auto_24909 ) ) ( not ( = ?auto_24911 ?auto_24909 ) ) ( not ( = ?auto_24902 ?auto_24909 ) ) ( not ( = ?auto_24901 ?auto_24909 ) ) ( AVAILABLE ?auto_24909 ) ( SURFACE-AT ?auto_24899 ?auto_24910 ) ( ON ?auto_24899 ?auto_24894 ) ( CLEAR ?auto_24899 ) ( not ( = ?auto_24892 ?auto_24894 ) ) ( not ( = ?auto_24893 ?auto_24894 ) ) ( not ( = ?auto_24912 ?auto_24894 ) ) ( not ( = ?auto_24906 ?auto_24894 ) ) ( not ( = ?auto_24900 ?auto_24894 ) ) ( not ( = ?auto_24899 ?auto_24894 ) ) ( not ( = ?auto_24898 ?auto_24894 ) ) ( not ( = ?auto_24895 ?auto_24894 ) ) ( SURFACE-AT ?auto_24903 ?auto_24905 ) ( CLEAR ?auto_24903 ) ( IS-CRATE ?auto_24895 ) ( not ( = ?auto_24892 ?auto_24903 ) ) ( not ( = ?auto_24893 ?auto_24903 ) ) ( not ( = ?auto_24912 ?auto_24903 ) ) ( not ( = ?auto_24906 ?auto_24903 ) ) ( not ( = ?auto_24900 ?auto_24903 ) ) ( not ( = ?auto_24899 ?auto_24903 ) ) ( not ( = ?auto_24898 ?auto_24903 ) ) ( not ( = ?auto_24895 ?auto_24903 ) ) ( not ( = ?auto_24894 ?auto_24903 ) ) ( AVAILABLE ?auto_24908 ) ( TRUCK-AT ?auto_24907 ?auto_24897 ) ( AVAILABLE ?auto_24902 ) ( SURFACE-AT ?auto_24895 ?auto_24897 ) ( ON ?auto_24895 ?auto_24913 ) ( CLEAR ?auto_24895 ) ( not ( = ?auto_24892 ?auto_24913 ) ) ( not ( = ?auto_24893 ?auto_24913 ) ) ( not ( = ?auto_24912 ?auto_24913 ) ) ( not ( = ?auto_24906 ?auto_24913 ) ) ( not ( = ?auto_24900 ?auto_24913 ) ) ( not ( = ?auto_24899 ?auto_24913 ) ) ( not ( = ?auto_24898 ?auto_24913 ) ) ( not ( = ?auto_24895 ?auto_24913 ) ) ( not ( = ?auto_24894 ?auto_24913 ) ) ( not ( = ?auto_24903 ?auto_24913 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24902 ?auto_24895 ?auto_24913 ?auto_24897 )
      ( MAKE-ON ?auto_24892 ?auto_24893 )
      ( MAKE-ON-VERIFY ?auto_24892 ?auto_24893 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24914 - SURFACE
      ?auto_24915 - SURFACE
    )
    :vars
    (
      ?auto_24931 - HOIST
      ?auto_24933 - PLACE
      ?auto_24930 - PLACE
      ?auto_24923 - HOIST
      ?auto_24924 - SURFACE
      ?auto_24919 - SURFACE
      ?auto_24918 - PLACE
      ?auto_24927 - HOIST
      ?auto_24922 - SURFACE
      ?auto_24929 - SURFACE
      ?auto_24925 - PLACE
      ?auto_24932 - HOIST
      ?auto_24935 - SURFACE
      ?auto_24934 - SURFACE
      ?auto_24917 - PLACE
      ?auto_24921 - HOIST
      ?auto_24928 - SURFACE
      ?auto_24920 - SURFACE
      ?auto_24926 - SURFACE
      ?auto_24916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24931 ?auto_24933 ) ( IS-CRATE ?auto_24914 ) ( not ( = ?auto_24914 ?auto_24915 ) ) ( not ( = ?auto_24930 ?auto_24933 ) ) ( HOIST-AT ?auto_24923 ?auto_24930 ) ( not ( = ?auto_24931 ?auto_24923 ) ) ( AVAILABLE ?auto_24923 ) ( SURFACE-AT ?auto_24914 ?auto_24930 ) ( ON ?auto_24914 ?auto_24924 ) ( CLEAR ?auto_24914 ) ( not ( = ?auto_24914 ?auto_24924 ) ) ( not ( = ?auto_24915 ?auto_24924 ) ) ( IS-CRATE ?auto_24915 ) ( not ( = ?auto_24914 ?auto_24919 ) ) ( not ( = ?auto_24915 ?auto_24919 ) ) ( not ( = ?auto_24924 ?auto_24919 ) ) ( not ( = ?auto_24918 ?auto_24933 ) ) ( not ( = ?auto_24930 ?auto_24918 ) ) ( HOIST-AT ?auto_24927 ?auto_24918 ) ( not ( = ?auto_24931 ?auto_24927 ) ) ( not ( = ?auto_24923 ?auto_24927 ) ) ( SURFACE-AT ?auto_24915 ?auto_24918 ) ( ON ?auto_24915 ?auto_24922 ) ( CLEAR ?auto_24915 ) ( not ( = ?auto_24914 ?auto_24922 ) ) ( not ( = ?auto_24915 ?auto_24922 ) ) ( not ( = ?auto_24924 ?auto_24922 ) ) ( not ( = ?auto_24919 ?auto_24922 ) ) ( IS-CRATE ?auto_24919 ) ( not ( = ?auto_24914 ?auto_24929 ) ) ( not ( = ?auto_24915 ?auto_24929 ) ) ( not ( = ?auto_24924 ?auto_24929 ) ) ( not ( = ?auto_24919 ?auto_24929 ) ) ( not ( = ?auto_24922 ?auto_24929 ) ) ( not ( = ?auto_24925 ?auto_24933 ) ) ( not ( = ?auto_24930 ?auto_24925 ) ) ( not ( = ?auto_24918 ?auto_24925 ) ) ( HOIST-AT ?auto_24932 ?auto_24925 ) ( not ( = ?auto_24931 ?auto_24932 ) ) ( not ( = ?auto_24923 ?auto_24932 ) ) ( not ( = ?auto_24927 ?auto_24932 ) ) ( AVAILABLE ?auto_24932 ) ( SURFACE-AT ?auto_24919 ?auto_24925 ) ( ON ?auto_24919 ?auto_24935 ) ( CLEAR ?auto_24919 ) ( not ( = ?auto_24914 ?auto_24935 ) ) ( not ( = ?auto_24915 ?auto_24935 ) ) ( not ( = ?auto_24924 ?auto_24935 ) ) ( not ( = ?auto_24919 ?auto_24935 ) ) ( not ( = ?auto_24922 ?auto_24935 ) ) ( not ( = ?auto_24929 ?auto_24935 ) ) ( IS-CRATE ?auto_24929 ) ( not ( = ?auto_24914 ?auto_24934 ) ) ( not ( = ?auto_24915 ?auto_24934 ) ) ( not ( = ?auto_24924 ?auto_24934 ) ) ( not ( = ?auto_24919 ?auto_24934 ) ) ( not ( = ?auto_24922 ?auto_24934 ) ) ( not ( = ?auto_24929 ?auto_24934 ) ) ( not ( = ?auto_24935 ?auto_24934 ) ) ( not ( = ?auto_24917 ?auto_24933 ) ) ( not ( = ?auto_24930 ?auto_24917 ) ) ( not ( = ?auto_24918 ?auto_24917 ) ) ( not ( = ?auto_24925 ?auto_24917 ) ) ( HOIST-AT ?auto_24921 ?auto_24917 ) ( not ( = ?auto_24931 ?auto_24921 ) ) ( not ( = ?auto_24923 ?auto_24921 ) ) ( not ( = ?auto_24927 ?auto_24921 ) ) ( not ( = ?auto_24932 ?auto_24921 ) ) ( AVAILABLE ?auto_24921 ) ( SURFACE-AT ?auto_24929 ?auto_24917 ) ( ON ?auto_24929 ?auto_24928 ) ( CLEAR ?auto_24929 ) ( not ( = ?auto_24914 ?auto_24928 ) ) ( not ( = ?auto_24915 ?auto_24928 ) ) ( not ( = ?auto_24924 ?auto_24928 ) ) ( not ( = ?auto_24919 ?auto_24928 ) ) ( not ( = ?auto_24922 ?auto_24928 ) ) ( not ( = ?auto_24929 ?auto_24928 ) ) ( not ( = ?auto_24935 ?auto_24928 ) ) ( not ( = ?auto_24934 ?auto_24928 ) ) ( SURFACE-AT ?auto_24920 ?auto_24933 ) ( CLEAR ?auto_24920 ) ( IS-CRATE ?auto_24934 ) ( not ( = ?auto_24914 ?auto_24920 ) ) ( not ( = ?auto_24915 ?auto_24920 ) ) ( not ( = ?auto_24924 ?auto_24920 ) ) ( not ( = ?auto_24919 ?auto_24920 ) ) ( not ( = ?auto_24922 ?auto_24920 ) ) ( not ( = ?auto_24929 ?auto_24920 ) ) ( not ( = ?auto_24935 ?auto_24920 ) ) ( not ( = ?auto_24934 ?auto_24920 ) ) ( not ( = ?auto_24928 ?auto_24920 ) ) ( AVAILABLE ?auto_24931 ) ( AVAILABLE ?auto_24927 ) ( SURFACE-AT ?auto_24934 ?auto_24918 ) ( ON ?auto_24934 ?auto_24926 ) ( CLEAR ?auto_24934 ) ( not ( = ?auto_24914 ?auto_24926 ) ) ( not ( = ?auto_24915 ?auto_24926 ) ) ( not ( = ?auto_24924 ?auto_24926 ) ) ( not ( = ?auto_24919 ?auto_24926 ) ) ( not ( = ?auto_24922 ?auto_24926 ) ) ( not ( = ?auto_24929 ?auto_24926 ) ) ( not ( = ?auto_24935 ?auto_24926 ) ) ( not ( = ?auto_24934 ?auto_24926 ) ) ( not ( = ?auto_24928 ?auto_24926 ) ) ( not ( = ?auto_24920 ?auto_24926 ) ) ( TRUCK-AT ?auto_24916 ?auto_24933 ) )
    :subtasks
    ( ( !DRIVE ?auto_24916 ?auto_24933 ?auto_24918 )
      ( MAKE-ON ?auto_24914 ?auto_24915 )
      ( MAKE-ON-VERIFY ?auto_24914 ?auto_24915 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24936 - SURFACE
      ?auto_24937 - SURFACE
    )
    :vars
    (
      ?auto_24953 - HOIST
      ?auto_24944 - PLACE
      ?auto_24943 - PLACE
      ?auto_24948 - HOIST
      ?auto_24950 - SURFACE
      ?auto_24954 - SURFACE
      ?auto_24952 - PLACE
      ?auto_24939 - HOIST
      ?auto_24938 - SURFACE
      ?auto_24949 - SURFACE
      ?auto_24945 - PLACE
      ?auto_24941 - HOIST
      ?auto_24951 - SURFACE
      ?auto_24957 - SURFACE
      ?auto_24947 - PLACE
      ?auto_24955 - HOIST
      ?auto_24940 - SURFACE
      ?auto_24946 - SURFACE
      ?auto_24956 - SURFACE
      ?auto_24942 - TRUCK
      ?auto_24958 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24953 ?auto_24944 ) ( IS-CRATE ?auto_24936 ) ( not ( = ?auto_24936 ?auto_24937 ) ) ( not ( = ?auto_24943 ?auto_24944 ) ) ( HOIST-AT ?auto_24948 ?auto_24943 ) ( not ( = ?auto_24953 ?auto_24948 ) ) ( AVAILABLE ?auto_24948 ) ( SURFACE-AT ?auto_24936 ?auto_24943 ) ( ON ?auto_24936 ?auto_24950 ) ( CLEAR ?auto_24936 ) ( not ( = ?auto_24936 ?auto_24950 ) ) ( not ( = ?auto_24937 ?auto_24950 ) ) ( IS-CRATE ?auto_24937 ) ( not ( = ?auto_24936 ?auto_24954 ) ) ( not ( = ?auto_24937 ?auto_24954 ) ) ( not ( = ?auto_24950 ?auto_24954 ) ) ( not ( = ?auto_24952 ?auto_24944 ) ) ( not ( = ?auto_24943 ?auto_24952 ) ) ( HOIST-AT ?auto_24939 ?auto_24952 ) ( not ( = ?auto_24953 ?auto_24939 ) ) ( not ( = ?auto_24948 ?auto_24939 ) ) ( SURFACE-AT ?auto_24937 ?auto_24952 ) ( ON ?auto_24937 ?auto_24938 ) ( CLEAR ?auto_24937 ) ( not ( = ?auto_24936 ?auto_24938 ) ) ( not ( = ?auto_24937 ?auto_24938 ) ) ( not ( = ?auto_24950 ?auto_24938 ) ) ( not ( = ?auto_24954 ?auto_24938 ) ) ( IS-CRATE ?auto_24954 ) ( not ( = ?auto_24936 ?auto_24949 ) ) ( not ( = ?auto_24937 ?auto_24949 ) ) ( not ( = ?auto_24950 ?auto_24949 ) ) ( not ( = ?auto_24954 ?auto_24949 ) ) ( not ( = ?auto_24938 ?auto_24949 ) ) ( not ( = ?auto_24945 ?auto_24944 ) ) ( not ( = ?auto_24943 ?auto_24945 ) ) ( not ( = ?auto_24952 ?auto_24945 ) ) ( HOIST-AT ?auto_24941 ?auto_24945 ) ( not ( = ?auto_24953 ?auto_24941 ) ) ( not ( = ?auto_24948 ?auto_24941 ) ) ( not ( = ?auto_24939 ?auto_24941 ) ) ( AVAILABLE ?auto_24941 ) ( SURFACE-AT ?auto_24954 ?auto_24945 ) ( ON ?auto_24954 ?auto_24951 ) ( CLEAR ?auto_24954 ) ( not ( = ?auto_24936 ?auto_24951 ) ) ( not ( = ?auto_24937 ?auto_24951 ) ) ( not ( = ?auto_24950 ?auto_24951 ) ) ( not ( = ?auto_24954 ?auto_24951 ) ) ( not ( = ?auto_24938 ?auto_24951 ) ) ( not ( = ?auto_24949 ?auto_24951 ) ) ( IS-CRATE ?auto_24949 ) ( not ( = ?auto_24936 ?auto_24957 ) ) ( not ( = ?auto_24937 ?auto_24957 ) ) ( not ( = ?auto_24950 ?auto_24957 ) ) ( not ( = ?auto_24954 ?auto_24957 ) ) ( not ( = ?auto_24938 ?auto_24957 ) ) ( not ( = ?auto_24949 ?auto_24957 ) ) ( not ( = ?auto_24951 ?auto_24957 ) ) ( not ( = ?auto_24947 ?auto_24944 ) ) ( not ( = ?auto_24943 ?auto_24947 ) ) ( not ( = ?auto_24952 ?auto_24947 ) ) ( not ( = ?auto_24945 ?auto_24947 ) ) ( HOIST-AT ?auto_24955 ?auto_24947 ) ( not ( = ?auto_24953 ?auto_24955 ) ) ( not ( = ?auto_24948 ?auto_24955 ) ) ( not ( = ?auto_24939 ?auto_24955 ) ) ( not ( = ?auto_24941 ?auto_24955 ) ) ( AVAILABLE ?auto_24955 ) ( SURFACE-AT ?auto_24949 ?auto_24947 ) ( ON ?auto_24949 ?auto_24940 ) ( CLEAR ?auto_24949 ) ( not ( = ?auto_24936 ?auto_24940 ) ) ( not ( = ?auto_24937 ?auto_24940 ) ) ( not ( = ?auto_24950 ?auto_24940 ) ) ( not ( = ?auto_24954 ?auto_24940 ) ) ( not ( = ?auto_24938 ?auto_24940 ) ) ( not ( = ?auto_24949 ?auto_24940 ) ) ( not ( = ?auto_24951 ?auto_24940 ) ) ( not ( = ?auto_24957 ?auto_24940 ) ) ( IS-CRATE ?auto_24957 ) ( not ( = ?auto_24936 ?auto_24946 ) ) ( not ( = ?auto_24937 ?auto_24946 ) ) ( not ( = ?auto_24950 ?auto_24946 ) ) ( not ( = ?auto_24954 ?auto_24946 ) ) ( not ( = ?auto_24938 ?auto_24946 ) ) ( not ( = ?auto_24949 ?auto_24946 ) ) ( not ( = ?auto_24951 ?auto_24946 ) ) ( not ( = ?auto_24957 ?auto_24946 ) ) ( not ( = ?auto_24940 ?auto_24946 ) ) ( AVAILABLE ?auto_24939 ) ( SURFACE-AT ?auto_24957 ?auto_24952 ) ( ON ?auto_24957 ?auto_24956 ) ( CLEAR ?auto_24957 ) ( not ( = ?auto_24936 ?auto_24956 ) ) ( not ( = ?auto_24937 ?auto_24956 ) ) ( not ( = ?auto_24950 ?auto_24956 ) ) ( not ( = ?auto_24954 ?auto_24956 ) ) ( not ( = ?auto_24938 ?auto_24956 ) ) ( not ( = ?auto_24949 ?auto_24956 ) ) ( not ( = ?auto_24951 ?auto_24956 ) ) ( not ( = ?auto_24957 ?auto_24956 ) ) ( not ( = ?auto_24940 ?auto_24956 ) ) ( not ( = ?auto_24946 ?auto_24956 ) ) ( TRUCK-AT ?auto_24942 ?auto_24944 ) ( SURFACE-AT ?auto_24958 ?auto_24944 ) ( CLEAR ?auto_24958 ) ( LIFTING ?auto_24953 ?auto_24946 ) ( IS-CRATE ?auto_24946 ) ( not ( = ?auto_24936 ?auto_24958 ) ) ( not ( = ?auto_24937 ?auto_24958 ) ) ( not ( = ?auto_24950 ?auto_24958 ) ) ( not ( = ?auto_24954 ?auto_24958 ) ) ( not ( = ?auto_24938 ?auto_24958 ) ) ( not ( = ?auto_24949 ?auto_24958 ) ) ( not ( = ?auto_24951 ?auto_24958 ) ) ( not ( = ?auto_24957 ?auto_24958 ) ) ( not ( = ?auto_24940 ?auto_24958 ) ) ( not ( = ?auto_24946 ?auto_24958 ) ) ( not ( = ?auto_24956 ?auto_24958 ) ) )
    :subtasks
    ( ( !DROP ?auto_24953 ?auto_24946 ?auto_24958 ?auto_24944 )
      ( MAKE-ON ?auto_24936 ?auto_24937 )
      ( MAKE-ON-VERIFY ?auto_24936 ?auto_24937 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24959 - SURFACE
      ?auto_24960 - SURFACE
    )
    :vars
    (
      ?auto_24962 - HOIST
      ?auto_24980 - PLACE
      ?auto_24968 - PLACE
      ?auto_24974 - HOIST
      ?auto_24966 - SURFACE
      ?auto_24981 - SURFACE
      ?auto_24979 - PLACE
      ?auto_24963 - HOIST
      ?auto_24961 - SURFACE
      ?auto_24964 - SURFACE
      ?auto_24967 - PLACE
      ?auto_24971 - HOIST
      ?auto_24977 - SURFACE
      ?auto_24965 - SURFACE
      ?auto_24975 - PLACE
      ?auto_24972 - HOIST
      ?auto_24969 - SURFACE
      ?auto_24970 - SURFACE
      ?auto_24973 - SURFACE
      ?auto_24976 - TRUCK
      ?auto_24978 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24962 ?auto_24980 ) ( IS-CRATE ?auto_24959 ) ( not ( = ?auto_24959 ?auto_24960 ) ) ( not ( = ?auto_24968 ?auto_24980 ) ) ( HOIST-AT ?auto_24974 ?auto_24968 ) ( not ( = ?auto_24962 ?auto_24974 ) ) ( AVAILABLE ?auto_24974 ) ( SURFACE-AT ?auto_24959 ?auto_24968 ) ( ON ?auto_24959 ?auto_24966 ) ( CLEAR ?auto_24959 ) ( not ( = ?auto_24959 ?auto_24966 ) ) ( not ( = ?auto_24960 ?auto_24966 ) ) ( IS-CRATE ?auto_24960 ) ( not ( = ?auto_24959 ?auto_24981 ) ) ( not ( = ?auto_24960 ?auto_24981 ) ) ( not ( = ?auto_24966 ?auto_24981 ) ) ( not ( = ?auto_24979 ?auto_24980 ) ) ( not ( = ?auto_24968 ?auto_24979 ) ) ( HOIST-AT ?auto_24963 ?auto_24979 ) ( not ( = ?auto_24962 ?auto_24963 ) ) ( not ( = ?auto_24974 ?auto_24963 ) ) ( SURFACE-AT ?auto_24960 ?auto_24979 ) ( ON ?auto_24960 ?auto_24961 ) ( CLEAR ?auto_24960 ) ( not ( = ?auto_24959 ?auto_24961 ) ) ( not ( = ?auto_24960 ?auto_24961 ) ) ( not ( = ?auto_24966 ?auto_24961 ) ) ( not ( = ?auto_24981 ?auto_24961 ) ) ( IS-CRATE ?auto_24981 ) ( not ( = ?auto_24959 ?auto_24964 ) ) ( not ( = ?auto_24960 ?auto_24964 ) ) ( not ( = ?auto_24966 ?auto_24964 ) ) ( not ( = ?auto_24981 ?auto_24964 ) ) ( not ( = ?auto_24961 ?auto_24964 ) ) ( not ( = ?auto_24967 ?auto_24980 ) ) ( not ( = ?auto_24968 ?auto_24967 ) ) ( not ( = ?auto_24979 ?auto_24967 ) ) ( HOIST-AT ?auto_24971 ?auto_24967 ) ( not ( = ?auto_24962 ?auto_24971 ) ) ( not ( = ?auto_24974 ?auto_24971 ) ) ( not ( = ?auto_24963 ?auto_24971 ) ) ( AVAILABLE ?auto_24971 ) ( SURFACE-AT ?auto_24981 ?auto_24967 ) ( ON ?auto_24981 ?auto_24977 ) ( CLEAR ?auto_24981 ) ( not ( = ?auto_24959 ?auto_24977 ) ) ( not ( = ?auto_24960 ?auto_24977 ) ) ( not ( = ?auto_24966 ?auto_24977 ) ) ( not ( = ?auto_24981 ?auto_24977 ) ) ( not ( = ?auto_24961 ?auto_24977 ) ) ( not ( = ?auto_24964 ?auto_24977 ) ) ( IS-CRATE ?auto_24964 ) ( not ( = ?auto_24959 ?auto_24965 ) ) ( not ( = ?auto_24960 ?auto_24965 ) ) ( not ( = ?auto_24966 ?auto_24965 ) ) ( not ( = ?auto_24981 ?auto_24965 ) ) ( not ( = ?auto_24961 ?auto_24965 ) ) ( not ( = ?auto_24964 ?auto_24965 ) ) ( not ( = ?auto_24977 ?auto_24965 ) ) ( not ( = ?auto_24975 ?auto_24980 ) ) ( not ( = ?auto_24968 ?auto_24975 ) ) ( not ( = ?auto_24979 ?auto_24975 ) ) ( not ( = ?auto_24967 ?auto_24975 ) ) ( HOIST-AT ?auto_24972 ?auto_24975 ) ( not ( = ?auto_24962 ?auto_24972 ) ) ( not ( = ?auto_24974 ?auto_24972 ) ) ( not ( = ?auto_24963 ?auto_24972 ) ) ( not ( = ?auto_24971 ?auto_24972 ) ) ( AVAILABLE ?auto_24972 ) ( SURFACE-AT ?auto_24964 ?auto_24975 ) ( ON ?auto_24964 ?auto_24969 ) ( CLEAR ?auto_24964 ) ( not ( = ?auto_24959 ?auto_24969 ) ) ( not ( = ?auto_24960 ?auto_24969 ) ) ( not ( = ?auto_24966 ?auto_24969 ) ) ( not ( = ?auto_24981 ?auto_24969 ) ) ( not ( = ?auto_24961 ?auto_24969 ) ) ( not ( = ?auto_24964 ?auto_24969 ) ) ( not ( = ?auto_24977 ?auto_24969 ) ) ( not ( = ?auto_24965 ?auto_24969 ) ) ( IS-CRATE ?auto_24965 ) ( not ( = ?auto_24959 ?auto_24970 ) ) ( not ( = ?auto_24960 ?auto_24970 ) ) ( not ( = ?auto_24966 ?auto_24970 ) ) ( not ( = ?auto_24981 ?auto_24970 ) ) ( not ( = ?auto_24961 ?auto_24970 ) ) ( not ( = ?auto_24964 ?auto_24970 ) ) ( not ( = ?auto_24977 ?auto_24970 ) ) ( not ( = ?auto_24965 ?auto_24970 ) ) ( not ( = ?auto_24969 ?auto_24970 ) ) ( AVAILABLE ?auto_24963 ) ( SURFACE-AT ?auto_24965 ?auto_24979 ) ( ON ?auto_24965 ?auto_24973 ) ( CLEAR ?auto_24965 ) ( not ( = ?auto_24959 ?auto_24973 ) ) ( not ( = ?auto_24960 ?auto_24973 ) ) ( not ( = ?auto_24966 ?auto_24973 ) ) ( not ( = ?auto_24981 ?auto_24973 ) ) ( not ( = ?auto_24961 ?auto_24973 ) ) ( not ( = ?auto_24964 ?auto_24973 ) ) ( not ( = ?auto_24977 ?auto_24973 ) ) ( not ( = ?auto_24965 ?auto_24973 ) ) ( not ( = ?auto_24969 ?auto_24973 ) ) ( not ( = ?auto_24970 ?auto_24973 ) ) ( TRUCK-AT ?auto_24976 ?auto_24980 ) ( SURFACE-AT ?auto_24978 ?auto_24980 ) ( CLEAR ?auto_24978 ) ( IS-CRATE ?auto_24970 ) ( not ( = ?auto_24959 ?auto_24978 ) ) ( not ( = ?auto_24960 ?auto_24978 ) ) ( not ( = ?auto_24966 ?auto_24978 ) ) ( not ( = ?auto_24981 ?auto_24978 ) ) ( not ( = ?auto_24961 ?auto_24978 ) ) ( not ( = ?auto_24964 ?auto_24978 ) ) ( not ( = ?auto_24977 ?auto_24978 ) ) ( not ( = ?auto_24965 ?auto_24978 ) ) ( not ( = ?auto_24969 ?auto_24978 ) ) ( not ( = ?auto_24970 ?auto_24978 ) ) ( not ( = ?auto_24973 ?auto_24978 ) ) ( AVAILABLE ?auto_24962 ) ( IN ?auto_24970 ?auto_24976 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24962 ?auto_24970 ?auto_24976 ?auto_24980 )
      ( MAKE-ON ?auto_24959 ?auto_24960 )
      ( MAKE-ON-VERIFY ?auto_24959 ?auto_24960 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24982 - SURFACE
      ?auto_24983 - SURFACE
    )
    :vars
    (
      ?auto_24989 - HOIST
      ?auto_24984 - PLACE
      ?auto_25003 - PLACE
      ?auto_25004 - HOIST
      ?auto_24991 - SURFACE
      ?auto_24996 - SURFACE
      ?auto_24997 - PLACE
      ?auto_24986 - HOIST
      ?auto_24993 - SURFACE
      ?auto_24995 - SURFACE
      ?auto_24998 - PLACE
      ?auto_24985 - HOIST
      ?auto_24988 - SURFACE
      ?auto_24992 - SURFACE
      ?auto_25000 - PLACE
      ?auto_25002 - HOIST
      ?auto_24999 - SURFACE
      ?auto_24990 - SURFACE
      ?auto_25001 - SURFACE
      ?auto_24987 - SURFACE
      ?auto_24994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24989 ?auto_24984 ) ( IS-CRATE ?auto_24982 ) ( not ( = ?auto_24982 ?auto_24983 ) ) ( not ( = ?auto_25003 ?auto_24984 ) ) ( HOIST-AT ?auto_25004 ?auto_25003 ) ( not ( = ?auto_24989 ?auto_25004 ) ) ( AVAILABLE ?auto_25004 ) ( SURFACE-AT ?auto_24982 ?auto_25003 ) ( ON ?auto_24982 ?auto_24991 ) ( CLEAR ?auto_24982 ) ( not ( = ?auto_24982 ?auto_24991 ) ) ( not ( = ?auto_24983 ?auto_24991 ) ) ( IS-CRATE ?auto_24983 ) ( not ( = ?auto_24982 ?auto_24996 ) ) ( not ( = ?auto_24983 ?auto_24996 ) ) ( not ( = ?auto_24991 ?auto_24996 ) ) ( not ( = ?auto_24997 ?auto_24984 ) ) ( not ( = ?auto_25003 ?auto_24997 ) ) ( HOIST-AT ?auto_24986 ?auto_24997 ) ( not ( = ?auto_24989 ?auto_24986 ) ) ( not ( = ?auto_25004 ?auto_24986 ) ) ( SURFACE-AT ?auto_24983 ?auto_24997 ) ( ON ?auto_24983 ?auto_24993 ) ( CLEAR ?auto_24983 ) ( not ( = ?auto_24982 ?auto_24993 ) ) ( not ( = ?auto_24983 ?auto_24993 ) ) ( not ( = ?auto_24991 ?auto_24993 ) ) ( not ( = ?auto_24996 ?auto_24993 ) ) ( IS-CRATE ?auto_24996 ) ( not ( = ?auto_24982 ?auto_24995 ) ) ( not ( = ?auto_24983 ?auto_24995 ) ) ( not ( = ?auto_24991 ?auto_24995 ) ) ( not ( = ?auto_24996 ?auto_24995 ) ) ( not ( = ?auto_24993 ?auto_24995 ) ) ( not ( = ?auto_24998 ?auto_24984 ) ) ( not ( = ?auto_25003 ?auto_24998 ) ) ( not ( = ?auto_24997 ?auto_24998 ) ) ( HOIST-AT ?auto_24985 ?auto_24998 ) ( not ( = ?auto_24989 ?auto_24985 ) ) ( not ( = ?auto_25004 ?auto_24985 ) ) ( not ( = ?auto_24986 ?auto_24985 ) ) ( AVAILABLE ?auto_24985 ) ( SURFACE-AT ?auto_24996 ?auto_24998 ) ( ON ?auto_24996 ?auto_24988 ) ( CLEAR ?auto_24996 ) ( not ( = ?auto_24982 ?auto_24988 ) ) ( not ( = ?auto_24983 ?auto_24988 ) ) ( not ( = ?auto_24991 ?auto_24988 ) ) ( not ( = ?auto_24996 ?auto_24988 ) ) ( not ( = ?auto_24993 ?auto_24988 ) ) ( not ( = ?auto_24995 ?auto_24988 ) ) ( IS-CRATE ?auto_24995 ) ( not ( = ?auto_24982 ?auto_24992 ) ) ( not ( = ?auto_24983 ?auto_24992 ) ) ( not ( = ?auto_24991 ?auto_24992 ) ) ( not ( = ?auto_24996 ?auto_24992 ) ) ( not ( = ?auto_24993 ?auto_24992 ) ) ( not ( = ?auto_24995 ?auto_24992 ) ) ( not ( = ?auto_24988 ?auto_24992 ) ) ( not ( = ?auto_25000 ?auto_24984 ) ) ( not ( = ?auto_25003 ?auto_25000 ) ) ( not ( = ?auto_24997 ?auto_25000 ) ) ( not ( = ?auto_24998 ?auto_25000 ) ) ( HOIST-AT ?auto_25002 ?auto_25000 ) ( not ( = ?auto_24989 ?auto_25002 ) ) ( not ( = ?auto_25004 ?auto_25002 ) ) ( not ( = ?auto_24986 ?auto_25002 ) ) ( not ( = ?auto_24985 ?auto_25002 ) ) ( AVAILABLE ?auto_25002 ) ( SURFACE-AT ?auto_24995 ?auto_25000 ) ( ON ?auto_24995 ?auto_24999 ) ( CLEAR ?auto_24995 ) ( not ( = ?auto_24982 ?auto_24999 ) ) ( not ( = ?auto_24983 ?auto_24999 ) ) ( not ( = ?auto_24991 ?auto_24999 ) ) ( not ( = ?auto_24996 ?auto_24999 ) ) ( not ( = ?auto_24993 ?auto_24999 ) ) ( not ( = ?auto_24995 ?auto_24999 ) ) ( not ( = ?auto_24988 ?auto_24999 ) ) ( not ( = ?auto_24992 ?auto_24999 ) ) ( IS-CRATE ?auto_24992 ) ( not ( = ?auto_24982 ?auto_24990 ) ) ( not ( = ?auto_24983 ?auto_24990 ) ) ( not ( = ?auto_24991 ?auto_24990 ) ) ( not ( = ?auto_24996 ?auto_24990 ) ) ( not ( = ?auto_24993 ?auto_24990 ) ) ( not ( = ?auto_24995 ?auto_24990 ) ) ( not ( = ?auto_24988 ?auto_24990 ) ) ( not ( = ?auto_24992 ?auto_24990 ) ) ( not ( = ?auto_24999 ?auto_24990 ) ) ( AVAILABLE ?auto_24986 ) ( SURFACE-AT ?auto_24992 ?auto_24997 ) ( ON ?auto_24992 ?auto_25001 ) ( CLEAR ?auto_24992 ) ( not ( = ?auto_24982 ?auto_25001 ) ) ( not ( = ?auto_24983 ?auto_25001 ) ) ( not ( = ?auto_24991 ?auto_25001 ) ) ( not ( = ?auto_24996 ?auto_25001 ) ) ( not ( = ?auto_24993 ?auto_25001 ) ) ( not ( = ?auto_24995 ?auto_25001 ) ) ( not ( = ?auto_24988 ?auto_25001 ) ) ( not ( = ?auto_24992 ?auto_25001 ) ) ( not ( = ?auto_24999 ?auto_25001 ) ) ( not ( = ?auto_24990 ?auto_25001 ) ) ( SURFACE-AT ?auto_24987 ?auto_24984 ) ( CLEAR ?auto_24987 ) ( IS-CRATE ?auto_24990 ) ( not ( = ?auto_24982 ?auto_24987 ) ) ( not ( = ?auto_24983 ?auto_24987 ) ) ( not ( = ?auto_24991 ?auto_24987 ) ) ( not ( = ?auto_24996 ?auto_24987 ) ) ( not ( = ?auto_24993 ?auto_24987 ) ) ( not ( = ?auto_24995 ?auto_24987 ) ) ( not ( = ?auto_24988 ?auto_24987 ) ) ( not ( = ?auto_24992 ?auto_24987 ) ) ( not ( = ?auto_24999 ?auto_24987 ) ) ( not ( = ?auto_24990 ?auto_24987 ) ) ( not ( = ?auto_25001 ?auto_24987 ) ) ( AVAILABLE ?auto_24989 ) ( IN ?auto_24990 ?auto_24994 ) ( TRUCK-AT ?auto_24994 ?auto_25000 ) )
    :subtasks
    ( ( !DRIVE ?auto_24994 ?auto_25000 ?auto_24984 )
      ( MAKE-ON ?auto_24982 ?auto_24983 )
      ( MAKE-ON-VERIFY ?auto_24982 ?auto_24983 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25005 - SURFACE
      ?auto_25006 - SURFACE
    )
    :vars
    (
      ?auto_25010 - HOIST
      ?auto_25013 - PLACE
      ?auto_25022 - PLACE
      ?auto_25023 - HOIST
      ?auto_25016 - SURFACE
      ?auto_25020 - SURFACE
      ?auto_25024 - PLACE
      ?auto_25021 - HOIST
      ?auto_25018 - SURFACE
      ?auto_25019 - SURFACE
      ?auto_25014 - PLACE
      ?auto_25015 - HOIST
      ?auto_25025 - SURFACE
      ?auto_25012 - SURFACE
      ?auto_25009 - PLACE
      ?auto_25008 - HOIST
      ?auto_25026 - SURFACE
      ?auto_25027 - SURFACE
      ?auto_25007 - SURFACE
      ?auto_25011 - SURFACE
      ?auto_25017 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25010 ?auto_25013 ) ( IS-CRATE ?auto_25005 ) ( not ( = ?auto_25005 ?auto_25006 ) ) ( not ( = ?auto_25022 ?auto_25013 ) ) ( HOIST-AT ?auto_25023 ?auto_25022 ) ( not ( = ?auto_25010 ?auto_25023 ) ) ( AVAILABLE ?auto_25023 ) ( SURFACE-AT ?auto_25005 ?auto_25022 ) ( ON ?auto_25005 ?auto_25016 ) ( CLEAR ?auto_25005 ) ( not ( = ?auto_25005 ?auto_25016 ) ) ( not ( = ?auto_25006 ?auto_25016 ) ) ( IS-CRATE ?auto_25006 ) ( not ( = ?auto_25005 ?auto_25020 ) ) ( not ( = ?auto_25006 ?auto_25020 ) ) ( not ( = ?auto_25016 ?auto_25020 ) ) ( not ( = ?auto_25024 ?auto_25013 ) ) ( not ( = ?auto_25022 ?auto_25024 ) ) ( HOIST-AT ?auto_25021 ?auto_25024 ) ( not ( = ?auto_25010 ?auto_25021 ) ) ( not ( = ?auto_25023 ?auto_25021 ) ) ( SURFACE-AT ?auto_25006 ?auto_25024 ) ( ON ?auto_25006 ?auto_25018 ) ( CLEAR ?auto_25006 ) ( not ( = ?auto_25005 ?auto_25018 ) ) ( not ( = ?auto_25006 ?auto_25018 ) ) ( not ( = ?auto_25016 ?auto_25018 ) ) ( not ( = ?auto_25020 ?auto_25018 ) ) ( IS-CRATE ?auto_25020 ) ( not ( = ?auto_25005 ?auto_25019 ) ) ( not ( = ?auto_25006 ?auto_25019 ) ) ( not ( = ?auto_25016 ?auto_25019 ) ) ( not ( = ?auto_25020 ?auto_25019 ) ) ( not ( = ?auto_25018 ?auto_25019 ) ) ( not ( = ?auto_25014 ?auto_25013 ) ) ( not ( = ?auto_25022 ?auto_25014 ) ) ( not ( = ?auto_25024 ?auto_25014 ) ) ( HOIST-AT ?auto_25015 ?auto_25014 ) ( not ( = ?auto_25010 ?auto_25015 ) ) ( not ( = ?auto_25023 ?auto_25015 ) ) ( not ( = ?auto_25021 ?auto_25015 ) ) ( AVAILABLE ?auto_25015 ) ( SURFACE-AT ?auto_25020 ?auto_25014 ) ( ON ?auto_25020 ?auto_25025 ) ( CLEAR ?auto_25020 ) ( not ( = ?auto_25005 ?auto_25025 ) ) ( not ( = ?auto_25006 ?auto_25025 ) ) ( not ( = ?auto_25016 ?auto_25025 ) ) ( not ( = ?auto_25020 ?auto_25025 ) ) ( not ( = ?auto_25018 ?auto_25025 ) ) ( not ( = ?auto_25019 ?auto_25025 ) ) ( IS-CRATE ?auto_25019 ) ( not ( = ?auto_25005 ?auto_25012 ) ) ( not ( = ?auto_25006 ?auto_25012 ) ) ( not ( = ?auto_25016 ?auto_25012 ) ) ( not ( = ?auto_25020 ?auto_25012 ) ) ( not ( = ?auto_25018 ?auto_25012 ) ) ( not ( = ?auto_25019 ?auto_25012 ) ) ( not ( = ?auto_25025 ?auto_25012 ) ) ( not ( = ?auto_25009 ?auto_25013 ) ) ( not ( = ?auto_25022 ?auto_25009 ) ) ( not ( = ?auto_25024 ?auto_25009 ) ) ( not ( = ?auto_25014 ?auto_25009 ) ) ( HOIST-AT ?auto_25008 ?auto_25009 ) ( not ( = ?auto_25010 ?auto_25008 ) ) ( not ( = ?auto_25023 ?auto_25008 ) ) ( not ( = ?auto_25021 ?auto_25008 ) ) ( not ( = ?auto_25015 ?auto_25008 ) ) ( SURFACE-AT ?auto_25019 ?auto_25009 ) ( ON ?auto_25019 ?auto_25026 ) ( CLEAR ?auto_25019 ) ( not ( = ?auto_25005 ?auto_25026 ) ) ( not ( = ?auto_25006 ?auto_25026 ) ) ( not ( = ?auto_25016 ?auto_25026 ) ) ( not ( = ?auto_25020 ?auto_25026 ) ) ( not ( = ?auto_25018 ?auto_25026 ) ) ( not ( = ?auto_25019 ?auto_25026 ) ) ( not ( = ?auto_25025 ?auto_25026 ) ) ( not ( = ?auto_25012 ?auto_25026 ) ) ( IS-CRATE ?auto_25012 ) ( not ( = ?auto_25005 ?auto_25027 ) ) ( not ( = ?auto_25006 ?auto_25027 ) ) ( not ( = ?auto_25016 ?auto_25027 ) ) ( not ( = ?auto_25020 ?auto_25027 ) ) ( not ( = ?auto_25018 ?auto_25027 ) ) ( not ( = ?auto_25019 ?auto_25027 ) ) ( not ( = ?auto_25025 ?auto_25027 ) ) ( not ( = ?auto_25012 ?auto_25027 ) ) ( not ( = ?auto_25026 ?auto_25027 ) ) ( AVAILABLE ?auto_25021 ) ( SURFACE-AT ?auto_25012 ?auto_25024 ) ( ON ?auto_25012 ?auto_25007 ) ( CLEAR ?auto_25012 ) ( not ( = ?auto_25005 ?auto_25007 ) ) ( not ( = ?auto_25006 ?auto_25007 ) ) ( not ( = ?auto_25016 ?auto_25007 ) ) ( not ( = ?auto_25020 ?auto_25007 ) ) ( not ( = ?auto_25018 ?auto_25007 ) ) ( not ( = ?auto_25019 ?auto_25007 ) ) ( not ( = ?auto_25025 ?auto_25007 ) ) ( not ( = ?auto_25012 ?auto_25007 ) ) ( not ( = ?auto_25026 ?auto_25007 ) ) ( not ( = ?auto_25027 ?auto_25007 ) ) ( SURFACE-AT ?auto_25011 ?auto_25013 ) ( CLEAR ?auto_25011 ) ( IS-CRATE ?auto_25027 ) ( not ( = ?auto_25005 ?auto_25011 ) ) ( not ( = ?auto_25006 ?auto_25011 ) ) ( not ( = ?auto_25016 ?auto_25011 ) ) ( not ( = ?auto_25020 ?auto_25011 ) ) ( not ( = ?auto_25018 ?auto_25011 ) ) ( not ( = ?auto_25019 ?auto_25011 ) ) ( not ( = ?auto_25025 ?auto_25011 ) ) ( not ( = ?auto_25012 ?auto_25011 ) ) ( not ( = ?auto_25026 ?auto_25011 ) ) ( not ( = ?auto_25027 ?auto_25011 ) ) ( not ( = ?auto_25007 ?auto_25011 ) ) ( AVAILABLE ?auto_25010 ) ( TRUCK-AT ?auto_25017 ?auto_25009 ) ( LIFTING ?auto_25008 ?auto_25027 ) )
    :subtasks
    ( ( !LOAD ?auto_25008 ?auto_25027 ?auto_25017 ?auto_25009 )
      ( MAKE-ON ?auto_25005 ?auto_25006 )
      ( MAKE-ON-VERIFY ?auto_25005 ?auto_25006 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25028 - SURFACE
      ?auto_25029 - SURFACE
    )
    :vars
    (
      ?auto_25046 - HOIST
      ?auto_25031 - PLACE
      ?auto_25037 - PLACE
      ?auto_25030 - HOIST
      ?auto_25035 - SURFACE
      ?auto_25032 - SURFACE
      ?auto_25036 - PLACE
      ?auto_25040 - HOIST
      ?auto_25049 - SURFACE
      ?auto_25048 - SURFACE
      ?auto_25043 - PLACE
      ?auto_25041 - HOIST
      ?auto_25038 - SURFACE
      ?auto_25042 - SURFACE
      ?auto_25044 - PLACE
      ?auto_25045 - HOIST
      ?auto_25034 - SURFACE
      ?auto_25033 - SURFACE
      ?auto_25039 - SURFACE
      ?auto_25047 - SURFACE
      ?auto_25050 - TRUCK
      ?auto_25051 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25046 ?auto_25031 ) ( IS-CRATE ?auto_25028 ) ( not ( = ?auto_25028 ?auto_25029 ) ) ( not ( = ?auto_25037 ?auto_25031 ) ) ( HOIST-AT ?auto_25030 ?auto_25037 ) ( not ( = ?auto_25046 ?auto_25030 ) ) ( AVAILABLE ?auto_25030 ) ( SURFACE-AT ?auto_25028 ?auto_25037 ) ( ON ?auto_25028 ?auto_25035 ) ( CLEAR ?auto_25028 ) ( not ( = ?auto_25028 ?auto_25035 ) ) ( not ( = ?auto_25029 ?auto_25035 ) ) ( IS-CRATE ?auto_25029 ) ( not ( = ?auto_25028 ?auto_25032 ) ) ( not ( = ?auto_25029 ?auto_25032 ) ) ( not ( = ?auto_25035 ?auto_25032 ) ) ( not ( = ?auto_25036 ?auto_25031 ) ) ( not ( = ?auto_25037 ?auto_25036 ) ) ( HOIST-AT ?auto_25040 ?auto_25036 ) ( not ( = ?auto_25046 ?auto_25040 ) ) ( not ( = ?auto_25030 ?auto_25040 ) ) ( SURFACE-AT ?auto_25029 ?auto_25036 ) ( ON ?auto_25029 ?auto_25049 ) ( CLEAR ?auto_25029 ) ( not ( = ?auto_25028 ?auto_25049 ) ) ( not ( = ?auto_25029 ?auto_25049 ) ) ( not ( = ?auto_25035 ?auto_25049 ) ) ( not ( = ?auto_25032 ?auto_25049 ) ) ( IS-CRATE ?auto_25032 ) ( not ( = ?auto_25028 ?auto_25048 ) ) ( not ( = ?auto_25029 ?auto_25048 ) ) ( not ( = ?auto_25035 ?auto_25048 ) ) ( not ( = ?auto_25032 ?auto_25048 ) ) ( not ( = ?auto_25049 ?auto_25048 ) ) ( not ( = ?auto_25043 ?auto_25031 ) ) ( not ( = ?auto_25037 ?auto_25043 ) ) ( not ( = ?auto_25036 ?auto_25043 ) ) ( HOIST-AT ?auto_25041 ?auto_25043 ) ( not ( = ?auto_25046 ?auto_25041 ) ) ( not ( = ?auto_25030 ?auto_25041 ) ) ( not ( = ?auto_25040 ?auto_25041 ) ) ( AVAILABLE ?auto_25041 ) ( SURFACE-AT ?auto_25032 ?auto_25043 ) ( ON ?auto_25032 ?auto_25038 ) ( CLEAR ?auto_25032 ) ( not ( = ?auto_25028 ?auto_25038 ) ) ( not ( = ?auto_25029 ?auto_25038 ) ) ( not ( = ?auto_25035 ?auto_25038 ) ) ( not ( = ?auto_25032 ?auto_25038 ) ) ( not ( = ?auto_25049 ?auto_25038 ) ) ( not ( = ?auto_25048 ?auto_25038 ) ) ( IS-CRATE ?auto_25048 ) ( not ( = ?auto_25028 ?auto_25042 ) ) ( not ( = ?auto_25029 ?auto_25042 ) ) ( not ( = ?auto_25035 ?auto_25042 ) ) ( not ( = ?auto_25032 ?auto_25042 ) ) ( not ( = ?auto_25049 ?auto_25042 ) ) ( not ( = ?auto_25048 ?auto_25042 ) ) ( not ( = ?auto_25038 ?auto_25042 ) ) ( not ( = ?auto_25044 ?auto_25031 ) ) ( not ( = ?auto_25037 ?auto_25044 ) ) ( not ( = ?auto_25036 ?auto_25044 ) ) ( not ( = ?auto_25043 ?auto_25044 ) ) ( HOIST-AT ?auto_25045 ?auto_25044 ) ( not ( = ?auto_25046 ?auto_25045 ) ) ( not ( = ?auto_25030 ?auto_25045 ) ) ( not ( = ?auto_25040 ?auto_25045 ) ) ( not ( = ?auto_25041 ?auto_25045 ) ) ( SURFACE-AT ?auto_25048 ?auto_25044 ) ( ON ?auto_25048 ?auto_25034 ) ( CLEAR ?auto_25048 ) ( not ( = ?auto_25028 ?auto_25034 ) ) ( not ( = ?auto_25029 ?auto_25034 ) ) ( not ( = ?auto_25035 ?auto_25034 ) ) ( not ( = ?auto_25032 ?auto_25034 ) ) ( not ( = ?auto_25049 ?auto_25034 ) ) ( not ( = ?auto_25048 ?auto_25034 ) ) ( not ( = ?auto_25038 ?auto_25034 ) ) ( not ( = ?auto_25042 ?auto_25034 ) ) ( IS-CRATE ?auto_25042 ) ( not ( = ?auto_25028 ?auto_25033 ) ) ( not ( = ?auto_25029 ?auto_25033 ) ) ( not ( = ?auto_25035 ?auto_25033 ) ) ( not ( = ?auto_25032 ?auto_25033 ) ) ( not ( = ?auto_25049 ?auto_25033 ) ) ( not ( = ?auto_25048 ?auto_25033 ) ) ( not ( = ?auto_25038 ?auto_25033 ) ) ( not ( = ?auto_25042 ?auto_25033 ) ) ( not ( = ?auto_25034 ?auto_25033 ) ) ( AVAILABLE ?auto_25040 ) ( SURFACE-AT ?auto_25042 ?auto_25036 ) ( ON ?auto_25042 ?auto_25039 ) ( CLEAR ?auto_25042 ) ( not ( = ?auto_25028 ?auto_25039 ) ) ( not ( = ?auto_25029 ?auto_25039 ) ) ( not ( = ?auto_25035 ?auto_25039 ) ) ( not ( = ?auto_25032 ?auto_25039 ) ) ( not ( = ?auto_25049 ?auto_25039 ) ) ( not ( = ?auto_25048 ?auto_25039 ) ) ( not ( = ?auto_25038 ?auto_25039 ) ) ( not ( = ?auto_25042 ?auto_25039 ) ) ( not ( = ?auto_25034 ?auto_25039 ) ) ( not ( = ?auto_25033 ?auto_25039 ) ) ( SURFACE-AT ?auto_25047 ?auto_25031 ) ( CLEAR ?auto_25047 ) ( IS-CRATE ?auto_25033 ) ( not ( = ?auto_25028 ?auto_25047 ) ) ( not ( = ?auto_25029 ?auto_25047 ) ) ( not ( = ?auto_25035 ?auto_25047 ) ) ( not ( = ?auto_25032 ?auto_25047 ) ) ( not ( = ?auto_25049 ?auto_25047 ) ) ( not ( = ?auto_25048 ?auto_25047 ) ) ( not ( = ?auto_25038 ?auto_25047 ) ) ( not ( = ?auto_25042 ?auto_25047 ) ) ( not ( = ?auto_25034 ?auto_25047 ) ) ( not ( = ?auto_25033 ?auto_25047 ) ) ( not ( = ?auto_25039 ?auto_25047 ) ) ( AVAILABLE ?auto_25046 ) ( TRUCK-AT ?auto_25050 ?auto_25044 ) ( AVAILABLE ?auto_25045 ) ( SURFACE-AT ?auto_25033 ?auto_25044 ) ( ON ?auto_25033 ?auto_25051 ) ( CLEAR ?auto_25033 ) ( not ( = ?auto_25028 ?auto_25051 ) ) ( not ( = ?auto_25029 ?auto_25051 ) ) ( not ( = ?auto_25035 ?auto_25051 ) ) ( not ( = ?auto_25032 ?auto_25051 ) ) ( not ( = ?auto_25049 ?auto_25051 ) ) ( not ( = ?auto_25048 ?auto_25051 ) ) ( not ( = ?auto_25038 ?auto_25051 ) ) ( not ( = ?auto_25042 ?auto_25051 ) ) ( not ( = ?auto_25034 ?auto_25051 ) ) ( not ( = ?auto_25033 ?auto_25051 ) ) ( not ( = ?auto_25039 ?auto_25051 ) ) ( not ( = ?auto_25047 ?auto_25051 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25045 ?auto_25033 ?auto_25051 ?auto_25044 )
      ( MAKE-ON ?auto_25028 ?auto_25029 )
      ( MAKE-ON-VERIFY ?auto_25028 ?auto_25029 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25052 - SURFACE
      ?auto_25053 - SURFACE
    )
    :vars
    (
      ?auto_25067 - HOIST
      ?auto_25063 - PLACE
      ?auto_25060 - PLACE
      ?auto_25073 - HOIST
      ?auto_25056 - SURFACE
      ?auto_25062 - SURFACE
      ?auto_25066 - PLACE
      ?auto_25075 - HOIST
      ?auto_25070 - SURFACE
      ?auto_25069 - SURFACE
      ?auto_25054 - PLACE
      ?auto_25059 - HOIST
      ?auto_25057 - SURFACE
      ?auto_25058 - SURFACE
      ?auto_25065 - PLACE
      ?auto_25072 - HOIST
      ?auto_25055 - SURFACE
      ?auto_25061 - SURFACE
      ?auto_25074 - SURFACE
      ?auto_25068 - SURFACE
      ?auto_25064 - SURFACE
      ?auto_25071 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25067 ?auto_25063 ) ( IS-CRATE ?auto_25052 ) ( not ( = ?auto_25052 ?auto_25053 ) ) ( not ( = ?auto_25060 ?auto_25063 ) ) ( HOIST-AT ?auto_25073 ?auto_25060 ) ( not ( = ?auto_25067 ?auto_25073 ) ) ( AVAILABLE ?auto_25073 ) ( SURFACE-AT ?auto_25052 ?auto_25060 ) ( ON ?auto_25052 ?auto_25056 ) ( CLEAR ?auto_25052 ) ( not ( = ?auto_25052 ?auto_25056 ) ) ( not ( = ?auto_25053 ?auto_25056 ) ) ( IS-CRATE ?auto_25053 ) ( not ( = ?auto_25052 ?auto_25062 ) ) ( not ( = ?auto_25053 ?auto_25062 ) ) ( not ( = ?auto_25056 ?auto_25062 ) ) ( not ( = ?auto_25066 ?auto_25063 ) ) ( not ( = ?auto_25060 ?auto_25066 ) ) ( HOIST-AT ?auto_25075 ?auto_25066 ) ( not ( = ?auto_25067 ?auto_25075 ) ) ( not ( = ?auto_25073 ?auto_25075 ) ) ( SURFACE-AT ?auto_25053 ?auto_25066 ) ( ON ?auto_25053 ?auto_25070 ) ( CLEAR ?auto_25053 ) ( not ( = ?auto_25052 ?auto_25070 ) ) ( not ( = ?auto_25053 ?auto_25070 ) ) ( not ( = ?auto_25056 ?auto_25070 ) ) ( not ( = ?auto_25062 ?auto_25070 ) ) ( IS-CRATE ?auto_25062 ) ( not ( = ?auto_25052 ?auto_25069 ) ) ( not ( = ?auto_25053 ?auto_25069 ) ) ( not ( = ?auto_25056 ?auto_25069 ) ) ( not ( = ?auto_25062 ?auto_25069 ) ) ( not ( = ?auto_25070 ?auto_25069 ) ) ( not ( = ?auto_25054 ?auto_25063 ) ) ( not ( = ?auto_25060 ?auto_25054 ) ) ( not ( = ?auto_25066 ?auto_25054 ) ) ( HOIST-AT ?auto_25059 ?auto_25054 ) ( not ( = ?auto_25067 ?auto_25059 ) ) ( not ( = ?auto_25073 ?auto_25059 ) ) ( not ( = ?auto_25075 ?auto_25059 ) ) ( AVAILABLE ?auto_25059 ) ( SURFACE-AT ?auto_25062 ?auto_25054 ) ( ON ?auto_25062 ?auto_25057 ) ( CLEAR ?auto_25062 ) ( not ( = ?auto_25052 ?auto_25057 ) ) ( not ( = ?auto_25053 ?auto_25057 ) ) ( not ( = ?auto_25056 ?auto_25057 ) ) ( not ( = ?auto_25062 ?auto_25057 ) ) ( not ( = ?auto_25070 ?auto_25057 ) ) ( not ( = ?auto_25069 ?auto_25057 ) ) ( IS-CRATE ?auto_25069 ) ( not ( = ?auto_25052 ?auto_25058 ) ) ( not ( = ?auto_25053 ?auto_25058 ) ) ( not ( = ?auto_25056 ?auto_25058 ) ) ( not ( = ?auto_25062 ?auto_25058 ) ) ( not ( = ?auto_25070 ?auto_25058 ) ) ( not ( = ?auto_25069 ?auto_25058 ) ) ( not ( = ?auto_25057 ?auto_25058 ) ) ( not ( = ?auto_25065 ?auto_25063 ) ) ( not ( = ?auto_25060 ?auto_25065 ) ) ( not ( = ?auto_25066 ?auto_25065 ) ) ( not ( = ?auto_25054 ?auto_25065 ) ) ( HOIST-AT ?auto_25072 ?auto_25065 ) ( not ( = ?auto_25067 ?auto_25072 ) ) ( not ( = ?auto_25073 ?auto_25072 ) ) ( not ( = ?auto_25075 ?auto_25072 ) ) ( not ( = ?auto_25059 ?auto_25072 ) ) ( SURFACE-AT ?auto_25069 ?auto_25065 ) ( ON ?auto_25069 ?auto_25055 ) ( CLEAR ?auto_25069 ) ( not ( = ?auto_25052 ?auto_25055 ) ) ( not ( = ?auto_25053 ?auto_25055 ) ) ( not ( = ?auto_25056 ?auto_25055 ) ) ( not ( = ?auto_25062 ?auto_25055 ) ) ( not ( = ?auto_25070 ?auto_25055 ) ) ( not ( = ?auto_25069 ?auto_25055 ) ) ( not ( = ?auto_25057 ?auto_25055 ) ) ( not ( = ?auto_25058 ?auto_25055 ) ) ( IS-CRATE ?auto_25058 ) ( not ( = ?auto_25052 ?auto_25061 ) ) ( not ( = ?auto_25053 ?auto_25061 ) ) ( not ( = ?auto_25056 ?auto_25061 ) ) ( not ( = ?auto_25062 ?auto_25061 ) ) ( not ( = ?auto_25070 ?auto_25061 ) ) ( not ( = ?auto_25069 ?auto_25061 ) ) ( not ( = ?auto_25057 ?auto_25061 ) ) ( not ( = ?auto_25058 ?auto_25061 ) ) ( not ( = ?auto_25055 ?auto_25061 ) ) ( AVAILABLE ?auto_25075 ) ( SURFACE-AT ?auto_25058 ?auto_25066 ) ( ON ?auto_25058 ?auto_25074 ) ( CLEAR ?auto_25058 ) ( not ( = ?auto_25052 ?auto_25074 ) ) ( not ( = ?auto_25053 ?auto_25074 ) ) ( not ( = ?auto_25056 ?auto_25074 ) ) ( not ( = ?auto_25062 ?auto_25074 ) ) ( not ( = ?auto_25070 ?auto_25074 ) ) ( not ( = ?auto_25069 ?auto_25074 ) ) ( not ( = ?auto_25057 ?auto_25074 ) ) ( not ( = ?auto_25058 ?auto_25074 ) ) ( not ( = ?auto_25055 ?auto_25074 ) ) ( not ( = ?auto_25061 ?auto_25074 ) ) ( SURFACE-AT ?auto_25068 ?auto_25063 ) ( CLEAR ?auto_25068 ) ( IS-CRATE ?auto_25061 ) ( not ( = ?auto_25052 ?auto_25068 ) ) ( not ( = ?auto_25053 ?auto_25068 ) ) ( not ( = ?auto_25056 ?auto_25068 ) ) ( not ( = ?auto_25062 ?auto_25068 ) ) ( not ( = ?auto_25070 ?auto_25068 ) ) ( not ( = ?auto_25069 ?auto_25068 ) ) ( not ( = ?auto_25057 ?auto_25068 ) ) ( not ( = ?auto_25058 ?auto_25068 ) ) ( not ( = ?auto_25055 ?auto_25068 ) ) ( not ( = ?auto_25061 ?auto_25068 ) ) ( not ( = ?auto_25074 ?auto_25068 ) ) ( AVAILABLE ?auto_25067 ) ( AVAILABLE ?auto_25072 ) ( SURFACE-AT ?auto_25061 ?auto_25065 ) ( ON ?auto_25061 ?auto_25064 ) ( CLEAR ?auto_25061 ) ( not ( = ?auto_25052 ?auto_25064 ) ) ( not ( = ?auto_25053 ?auto_25064 ) ) ( not ( = ?auto_25056 ?auto_25064 ) ) ( not ( = ?auto_25062 ?auto_25064 ) ) ( not ( = ?auto_25070 ?auto_25064 ) ) ( not ( = ?auto_25069 ?auto_25064 ) ) ( not ( = ?auto_25057 ?auto_25064 ) ) ( not ( = ?auto_25058 ?auto_25064 ) ) ( not ( = ?auto_25055 ?auto_25064 ) ) ( not ( = ?auto_25061 ?auto_25064 ) ) ( not ( = ?auto_25074 ?auto_25064 ) ) ( not ( = ?auto_25068 ?auto_25064 ) ) ( TRUCK-AT ?auto_25071 ?auto_25063 ) )
    :subtasks
    ( ( !DRIVE ?auto_25071 ?auto_25063 ?auto_25065 )
      ( MAKE-ON ?auto_25052 ?auto_25053 )
      ( MAKE-ON-VERIFY ?auto_25052 ?auto_25053 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25076 - SURFACE
      ?auto_25077 - SURFACE
    )
    :vars
    (
      ?auto_25090 - HOIST
      ?auto_25097 - PLACE
      ?auto_25084 - PLACE
      ?auto_25081 - HOIST
      ?auto_25089 - SURFACE
      ?auto_25086 - SURFACE
      ?auto_25099 - PLACE
      ?auto_25083 - HOIST
      ?auto_25087 - SURFACE
      ?auto_25079 - SURFACE
      ?auto_25098 - PLACE
      ?auto_25092 - HOIST
      ?auto_25094 - SURFACE
      ?auto_25095 - SURFACE
      ?auto_25091 - PLACE
      ?auto_25082 - HOIST
      ?auto_25085 - SURFACE
      ?auto_25096 - SURFACE
      ?auto_25078 - SURFACE
      ?auto_25088 - SURFACE
      ?auto_25093 - SURFACE
      ?auto_25080 - TRUCK
      ?auto_25100 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25090 ?auto_25097 ) ( IS-CRATE ?auto_25076 ) ( not ( = ?auto_25076 ?auto_25077 ) ) ( not ( = ?auto_25084 ?auto_25097 ) ) ( HOIST-AT ?auto_25081 ?auto_25084 ) ( not ( = ?auto_25090 ?auto_25081 ) ) ( AVAILABLE ?auto_25081 ) ( SURFACE-AT ?auto_25076 ?auto_25084 ) ( ON ?auto_25076 ?auto_25089 ) ( CLEAR ?auto_25076 ) ( not ( = ?auto_25076 ?auto_25089 ) ) ( not ( = ?auto_25077 ?auto_25089 ) ) ( IS-CRATE ?auto_25077 ) ( not ( = ?auto_25076 ?auto_25086 ) ) ( not ( = ?auto_25077 ?auto_25086 ) ) ( not ( = ?auto_25089 ?auto_25086 ) ) ( not ( = ?auto_25099 ?auto_25097 ) ) ( not ( = ?auto_25084 ?auto_25099 ) ) ( HOIST-AT ?auto_25083 ?auto_25099 ) ( not ( = ?auto_25090 ?auto_25083 ) ) ( not ( = ?auto_25081 ?auto_25083 ) ) ( SURFACE-AT ?auto_25077 ?auto_25099 ) ( ON ?auto_25077 ?auto_25087 ) ( CLEAR ?auto_25077 ) ( not ( = ?auto_25076 ?auto_25087 ) ) ( not ( = ?auto_25077 ?auto_25087 ) ) ( not ( = ?auto_25089 ?auto_25087 ) ) ( not ( = ?auto_25086 ?auto_25087 ) ) ( IS-CRATE ?auto_25086 ) ( not ( = ?auto_25076 ?auto_25079 ) ) ( not ( = ?auto_25077 ?auto_25079 ) ) ( not ( = ?auto_25089 ?auto_25079 ) ) ( not ( = ?auto_25086 ?auto_25079 ) ) ( not ( = ?auto_25087 ?auto_25079 ) ) ( not ( = ?auto_25098 ?auto_25097 ) ) ( not ( = ?auto_25084 ?auto_25098 ) ) ( not ( = ?auto_25099 ?auto_25098 ) ) ( HOIST-AT ?auto_25092 ?auto_25098 ) ( not ( = ?auto_25090 ?auto_25092 ) ) ( not ( = ?auto_25081 ?auto_25092 ) ) ( not ( = ?auto_25083 ?auto_25092 ) ) ( AVAILABLE ?auto_25092 ) ( SURFACE-AT ?auto_25086 ?auto_25098 ) ( ON ?auto_25086 ?auto_25094 ) ( CLEAR ?auto_25086 ) ( not ( = ?auto_25076 ?auto_25094 ) ) ( not ( = ?auto_25077 ?auto_25094 ) ) ( not ( = ?auto_25089 ?auto_25094 ) ) ( not ( = ?auto_25086 ?auto_25094 ) ) ( not ( = ?auto_25087 ?auto_25094 ) ) ( not ( = ?auto_25079 ?auto_25094 ) ) ( IS-CRATE ?auto_25079 ) ( not ( = ?auto_25076 ?auto_25095 ) ) ( not ( = ?auto_25077 ?auto_25095 ) ) ( not ( = ?auto_25089 ?auto_25095 ) ) ( not ( = ?auto_25086 ?auto_25095 ) ) ( not ( = ?auto_25087 ?auto_25095 ) ) ( not ( = ?auto_25079 ?auto_25095 ) ) ( not ( = ?auto_25094 ?auto_25095 ) ) ( not ( = ?auto_25091 ?auto_25097 ) ) ( not ( = ?auto_25084 ?auto_25091 ) ) ( not ( = ?auto_25099 ?auto_25091 ) ) ( not ( = ?auto_25098 ?auto_25091 ) ) ( HOIST-AT ?auto_25082 ?auto_25091 ) ( not ( = ?auto_25090 ?auto_25082 ) ) ( not ( = ?auto_25081 ?auto_25082 ) ) ( not ( = ?auto_25083 ?auto_25082 ) ) ( not ( = ?auto_25092 ?auto_25082 ) ) ( SURFACE-AT ?auto_25079 ?auto_25091 ) ( ON ?auto_25079 ?auto_25085 ) ( CLEAR ?auto_25079 ) ( not ( = ?auto_25076 ?auto_25085 ) ) ( not ( = ?auto_25077 ?auto_25085 ) ) ( not ( = ?auto_25089 ?auto_25085 ) ) ( not ( = ?auto_25086 ?auto_25085 ) ) ( not ( = ?auto_25087 ?auto_25085 ) ) ( not ( = ?auto_25079 ?auto_25085 ) ) ( not ( = ?auto_25094 ?auto_25085 ) ) ( not ( = ?auto_25095 ?auto_25085 ) ) ( IS-CRATE ?auto_25095 ) ( not ( = ?auto_25076 ?auto_25096 ) ) ( not ( = ?auto_25077 ?auto_25096 ) ) ( not ( = ?auto_25089 ?auto_25096 ) ) ( not ( = ?auto_25086 ?auto_25096 ) ) ( not ( = ?auto_25087 ?auto_25096 ) ) ( not ( = ?auto_25079 ?auto_25096 ) ) ( not ( = ?auto_25094 ?auto_25096 ) ) ( not ( = ?auto_25095 ?auto_25096 ) ) ( not ( = ?auto_25085 ?auto_25096 ) ) ( AVAILABLE ?auto_25083 ) ( SURFACE-AT ?auto_25095 ?auto_25099 ) ( ON ?auto_25095 ?auto_25078 ) ( CLEAR ?auto_25095 ) ( not ( = ?auto_25076 ?auto_25078 ) ) ( not ( = ?auto_25077 ?auto_25078 ) ) ( not ( = ?auto_25089 ?auto_25078 ) ) ( not ( = ?auto_25086 ?auto_25078 ) ) ( not ( = ?auto_25087 ?auto_25078 ) ) ( not ( = ?auto_25079 ?auto_25078 ) ) ( not ( = ?auto_25094 ?auto_25078 ) ) ( not ( = ?auto_25095 ?auto_25078 ) ) ( not ( = ?auto_25085 ?auto_25078 ) ) ( not ( = ?auto_25096 ?auto_25078 ) ) ( IS-CRATE ?auto_25096 ) ( not ( = ?auto_25076 ?auto_25088 ) ) ( not ( = ?auto_25077 ?auto_25088 ) ) ( not ( = ?auto_25089 ?auto_25088 ) ) ( not ( = ?auto_25086 ?auto_25088 ) ) ( not ( = ?auto_25087 ?auto_25088 ) ) ( not ( = ?auto_25079 ?auto_25088 ) ) ( not ( = ?auto_25094 ?auto_25088 ) ) ( not ( = ?auto_25095 ?auto_25088 ) ) ( not ( = ?auto_25085 ?auto_25088 ) ) ( not ( = ?auto_25096 ?auto_25088 ) ) ( not ( = ?auto_25078 ?auto_25088 ) ) ( AVAILABLE ?auto_25082 ) ( SURFACE-AT ?auto_25096 ?auto_25091 ) ( ON ?auto_25096 ?auto_25093 ) ( CLEAR ?auto_25096 ) ( not ( = ?auto_25076 ?auto_25093 ) ) ( not ( = ?auto_25077 ?auto_25093 ) ) ( not ( = ?auto_25089 ?auto_25093 ) ) ( not ( = ?auto_25086 ?auto_25093 ) ) ( not ( = ?auto_25087 ?auto_25093 ) ) ( not ( = ?auto_25079 ?auto_25093 ) ) ( not ( = ?auto_25094 ?auto_25093 ) ) ( not ( = ?auto_25095 ?auto_25093 ) ) ( not ( = ?auto_25085 ?auto_25093 ) ) ( not ( = ?auto_25096 ?auto_25093 ) ) ( not ( = ?auto_25078 ?auto_25093 ) ) ( not ( = ?auto_25088 ?auto_25093 ) ) ( TRUCK-AT ?auto_25080 ?auto_25097 ) ( SURFACE-AT ?auto_25100 ?auto_25097 ) ( CLEAR ?auto_25100 ) ( LIFTING ?auto_25090 ?auto_25088 ) ( IS-CRATE ?auto_25088 ) ( not ( = ?auto_25076 ?auto_25100 ) ) ( not ( = ?auto_25077 ?auto_25100 ) ) ( not ( = ?auto_25089 ?auto_25100 ) ) ( not ( = ?auto_25086 ?auto_25100 ) ) ( not ( = ?auto_25087 ?auto_25100 ) ) ( not ( = ?auto_25079 ?auto_25100 ) ) ( not ( = ?auto_25094 ?auto_25100 ) ) ( not ( = ?auto_25095 ?auto_25100 ) ) ( not ( = ?auto_25085 ?auto_25100 ) ) ( not ( = ?auto_25096 ?auto_25100 ) ) ( not ( = ?auto_25078 ?auto_25100 ) ) ( not ( = ?auto_25088 ?auto_25100 ) ) ( not ( = ?auto_25093 ?auto_25100 ) ) )
    :subtasks
    ( ( !DROP ?auto_25090 ?auto_25088 ?auto_25100 ?auto_25097 )
      ( MAKE-ON ?auto_25076 ?auto_25077 )
      ( MAKE-ON-VERIFY ?auto_25076 ?auto_25077 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25101 - SURFACE
      ?auto_25102 - SURFACE
    )
    :vars
    (
      ?auto_25114 - HOIST
      ?auto_25112 - PLACE
      ?auto_25113 - PLACE
      ?auto_25122 - HOIST
      ?auto_25115 - SURFACE
      ?auto_25123 - SURFACE
      ?auto_25109 - PLACE
      ?auto_25120 - HOIST
      ?auto_25118 - SURFACE
      ?auto_25107 - SURFACE
      ?auto_25108 - PLACE
      ?auto_25103 - HOIST
      ?auto_25106 - SURFACE
      ?auto_25105 - SURFACE
      ?auto_25116 - PLACE
      ?auto_25104 - HOIST
      ?auto_25117 - SURFACE
      ?auto_25111 - SURFACE
      ?auto_25124 - SURFACE
      ?auto_25121 - SURFACE
      ?auto_25110 - SURFACE
      ?auto_25119 - TRUCK
      ?auto_25125 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25114 ?auto_25112 ) ( IS-CRATE ?auto_25101 ) ( not ( = ?auto_25101 ?auto_25102 ) ) ( not ( = ?auto_25113 ?auto_25112 ) ) ( HOIST-AT ?auto_25122 ?auto_25113 ) ( not ( = ?auto_25114 ?auto_25122 ) ) ( AVAILABLE ?auto_25122 ) ( SURFACE-AT ?auto_25101 ?auto_25113 ) ( ON ?auto_25101 ?auto_25115 ) ( CLEAR ?auto_25101 ) ( not ( = ?auto_25101 ?auto_25115 ) ) ( not ( = ?auto_25102 ?auto_25115 ) ) ( IS-CRATE ?auto_25102 ) ( not ( = ?auto_25101 ?auto_25123 ) ) ( not ( = ?auto_25102 ?auto_25123 ) ) ( not ( = ?auto_25115 ?auto_25123 ) ) ( not ( = ?auto_25109 ?auto_25112 ) ) ( not ( = ?auto_25113 ?auto_25109 ) ) ( HOIST-AT ?auto_25120 ?auto_25109 ) ( not ( = ?auto_25114 ?auto_25120 ) ) ( not ( = ?auto_25122 ?auto_25120 ) ) ( SURFACE-AT ?auto_25102 ?auto_25109 ) ( ON ?auto_25102 ?auto_25118 ) ( CLEAR ?auto_25102 ) ( not ( = ?auto_25101 ?auto_25118 ) ) ( not ( = ?auto_25102 ?auto_25118 ) ) ( not ( = ?auto_25115 ?auto_25118 ) ) ( not ( = ?auto_25123 ?auto_25118 ) ) ( IS-CRATE ?auto_25123 ) ( not ( = ?auto_25101 ?auto_25107 ) ) ( not ( = ?auto_25102 ?auto_25107 ) ) ( not ( = ?auto_25115 ?auto_25107 ) ) ( not ( = ?auto_25123 ?auto_25107 ) ) ( not ( = ?auto_25118 ?auto_25107 ) ) ( not ( = ?auto_25108 ?auto_25112 ) ) ( not ( = ?auto_25113 ?auto_25108 ) ) ( not ( = ?auto_25109 ?auto_25108 ) ) ( HOIST-AT ?auto_25103 ?auto_25108 ) ( not ( = ?auto_25114 ?auto_25103 ) ) ( not ( = ?auto_25122 ?auto_25103 ) ) ( not ( = ?auto_25120 ?auto_25103 ) ) ( AVAILABLE ?auto_25103 ) ( SURFACE-AT ?auto_25123 ?auto_25108 ) ( ON ?auto_25123 ?auto_25106 ) ( CLEAR ?auto_25123 ) ( not ( = ?auto_25101 ?auto_25106 ) ) ( not ( = ?auto_25102 ?auto_25106 ) ) ( not ( = ?auto_25115 ?auto_25106 ) ) ( not ( = ?auto_25123 ?auto_25106 ) ) ( not ( = ?auto_25118 ?auto_25106 ) ) ( not ( = ?auto_25107 ?auto_25106 ) ) ( IS-CRATE ?auto_25107 ) ( not ( = ?auto_25101 ?auto_25105 ) ) ( not ( = ?auto_25102 ?auto_25105 ) ) ( not ( = ?auto_25115 ?auto_25105 ) ) ( not ( = ?auto_25123 ?auto_25105 ) ) ( not ( = ?auto_25118 ?auto_25105 ) ) ( not ( = ?auto_25107 ?auto_25105 ) ) ( not ( = ?auto_25106 ?auto_25105 ) ) ( not ( = ?auto_25116 ?auto_25112 ) ) ( not ( = ?auto_25113 ?auto_25116 ) ) ( not ( = ?auto_25109 ?auto_25116 ) ) ( not ( = ?auto_25108 ?auto_25116 ) ) ( HOIST-AT ?auto_25104 ?auto_25116 ) ( not ( = ?auto_25114 ?auto_25104 ) ) ( not ( = ?auto_25122 ?auto_25104 ) ) ( not ( = ?auto_25120 ?auto_25104 ) ) ( not ( = ?auto_25103 ?auto_25104 ) ) ( SURFACE-AT ?auto_25107 ?auto_25116 ) ( ON ?auto_25107 ?auto_25117 ) ( CLEAR ?auto_25107 ) ( not ( = ?auto_25101 ?auto_25117 ) ) ( not ( = ?auto_25102 ?auto_25117 ) ) ( not ( = ?auto_25115 ?auto_25117 ) ) ( not ( = ?auto_25123 ?auto_25117 ) ) ( not ( = ?auto_25118 ?auto_25117 ) ) ( not ( = ?auto_25107 ?auto_25117 ) ) ( not ( = ?auto_25106 ?auto_25117 ) ) ( not ( = ?auto_25105 ?auto_25117 ) ) ( IS-CRATE ?auto_25105 ) ( not ( = ?auto_25101 ?auto_25111 ) ) ( not ( = ?auto_25102 ?auto_25111 ) ) ( not ( = ?auto_25115 ?auto_25111 ) ) ( not ( = ?auto_25123 ?auto_25111 ) ) ( not ( = ?auto_25118 ?auto_25111 ) ) ( not ( = ?auto_25107 ?auto_25111 ) ) ( not ( = ?auto_25106 ?auto_25111 ) ) ( not ( = ?auto_25105 ?auto_25111 ) ) ( not ( = ?auto_25117 ?auto_25111 ) ) ( AVAILABLE ?auto_25120 ) ( SURFACE-AT ?auto_25105 ?auto_25109 ) ( ON ?auto_25105 ?auto_25124 ) ( CLEAR ?auto_25105 ) ( not ( = ?auto_25101 ?auto_25124 ) ) ( not ( = ?auto_25102 ?auto_25124 ) ) ( not ( = ?auto_25115 ?auto_25124 ) ) ( not ( = ?auto_25123 ?auto_25124 ) ) ( not ( = ?auto_25118 ?auto_25124 ) ) ( not ( = ?auto_25107 ?auto_25124 ) ) ( not ( = ?auto_25106 ?auto_25124 ) ) ( not ( = ?auto_25105 ?auto_25124 ) ) ( not ( = ?auto_25117 ?auto_25124 ) ) ( not ( = ?auto_25111 ?auto_25124 ) ) ( IS-CRATE ?auto_25111 ) ( not ( = ?auto_25101 ?auto_25121 ) ) ( not ( = ?auto_25102 ?auto_25121 ) ) ( not ( = ?auto_25115 ?auto_25121 ) ) ( not ( = ?auto_25123 ?auto_25121 ) ) ( not ( = ?auto_25118 ?auto_25121 ) ) ( not ( = ?auto_25107 ?auto_25121 ) ) ( not ( = ?auto_25106 ?auto_25121 ) ) ( not ( = ?auto_25105 ?auto_25121 ) ) ( not ( = ?auto_25117 ?auto_25121 ) ) ( not ( = ?auto_25111 ?auto_25121 ) ) ( not ( = ?auto_25124 ?auto_25121 ) ) ( AVAILABLE ?auto_25104 ) ( SURFACE-AT ?auto_25111 ?auto_25116 ) ( ON ?auto_25111 ?auto_25110 ) ( CLEAR ?auto_25111 ) ( not ( = ?auto_25101 ?auto_25110 ) ) ( not ( = ?auto_25102 ?auto_25110 ) ) ( not ( = ?auto_25115 ?auto_25110 ) ) ( not ( = ?auto_25123 ?auto_25110 ) ) ( not ( = ?auto_25118 ?auto_25110 ) ) ( not ( = ?auto_25107 ?auto_25110 ) ) ( not ( = ?auto_25106 ?auto_25110 ) ) ( not ( = ?auto_25105 ?auto_25110 ) ) ( not ( = ?auto_25117 ?auto_25110 ) ) ( not ( = ?auto_25111 ?auto_25110 ) ) ( not ( = ?auto_25124 ?auto_25110 ) ) ( not ( = ?auto_25121 ?auto_25110 ) ) ( TRUCK-AT ?auto_25119 ?auto_25112 ) ( SURFACE-AT ?auto_25125 ?auto_25112 ) ( CLEAR ?auto_25125 ) ( IS-CRATE ?auto_25121 ) ( not ( = ?auto_25101 ?auto_25125 ) ) ( not ( = ?auto_25102 ?auto_25125 ) ) ( not ( = ?auto_25115 ?auto_25125 ) ) ( not ( = ?auto_25123 ?auto_25125 ) ) ( not ( = ?auto_25118 ?auto_25125 ) ) ( not ( = ?auto_25107 ?auto_25125 ) ) ( not ( = ?auto_25106 ?auto_25125 ) ) ( not ( = ?auto_25105 ?auto_25125 ) ) ( not ( = ?auto_25117 ?auto_25125 ) ) ( not ( = ?auto_25111 ?auto_25125 ) ) ( not ( = ?auto_25124 ?auto_25125 ) ) ( not ( = ?auto_25121 ?auto_25125 ) ) ( not ( = ?auto_25110 ?auto_25125 ) ) ( AVAILABLE ?auto_25114 ) ( IN ?auto_25121 ?auto_25119 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25114 ?auto_25121 ?auto_25119 ?auto_25112 )
      ( MAKE-ON ?auto_25101 ?auto_25102 )
      ( MAKE-ON-VERIFY ?auto_25101 ?auto_25102 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25126 - SURFACE
      ?auto_25127 - SURFACE
    )
    :vars
    (
      ?auto_25133 - HOIST
      ?auto_25132 - PLACE
      ?auto_25130 - PLACE
      ?auto_25138 - HOIST
      ?auto_25142 - SURFACE
      ?auto_25140 - SURFACE
      ?auto_25136 - PLACE
      ?auto_25131 - HOIST
      ?auto_25146 - SURFACE
      ?auto_25147 - SURFACE
      ?auto_25141 - PLACE
      ?auto_25144 - HOIST
      ?auto_25149 - SURFACE
      ?auto_25135 - SURFACE
      ?auto_25128 - PLACE
      ?auto_25129 - HOIST
      ?auto_25145 - SURFACE
      ?auto_25148 - SURFACE
      ?auto_25139 - SURFACE
      ?auto_25134 - SURFACE
      ?auto_25143 - SURFACE
      ?auto_25150 - SURFACE
      ?auto_25137 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25133 ?auto_25132 ) ( IS-CRATE ?auto_25126 ) ( not ( = ?auto_25126 ?auto_25127 ) ) ( not ( = ?auto_25130 ?auto_25132 ) ) ( HOIST-AT ?auto_25138 ?auto_25130 ) ( not ( = ?auto_25133 ?auto_25138 ) ) ( AVAILABLE ?auto_25138 ) ( SURFACE-AT ?auto_25126 ?auto_25130 ) ( ON ?auto_25126 ?auto_25142 ) ( CLEAR ?auto_25126 ) ( not ( = ?auto_25126 ?auto_25142 ) ) ( not ( = ?auto_25127 ?auto_25142 ) ) ( IS-CRATE ?auto_25127 ) ( not ( = ?auto_25126 ?auto_25140 ) ) ( not ( = ?auto_25127 ?auto_25140 ) ) ( not ( = ?auto_25142 ?auto_25140 ) ) ( not ( = ?auto_25136 ?auto_25132 ) ) ( not ( = ?auto_25130 ?auto_25136 ) ) ( HOIST-AT ?auto_25131 ?auto_25136 ) ( not ( = ?auto_25133 ?auto_25131 ) ) ( not ( = ?auto_25138 ?auto_25131 ) ) ( SURFACE-AT ?auto_25127 ?auto_25136 ) ( ON ?auto_25127 ?auto_25146 ) ( CLEAR ?auto_25127 ) ( not ( = ?auto_25126 ?auto_25146 ) ) ( not ( = ?auto_25127 ?auto_25146 ) ) ( not ( = ?auto_25142 ?auto_25146 ) ) ( not ( = ?auto_25140 ?auto_25146 ) ) ( IS-CRATE ?auto_25140 ) ( not ( = ?auto_25126 ?auto_25147 ) ) ( not ( = ?auto_25127 ?auto_25147 ) ) ( not ( = ?auto_25142 ?auto_25147 ) ) ( not ( = ?auto_25140 ?auto_25147 ) ) ( not ( = ?auto_25146 ?auto_25147 ) ) ( not ( = ?auto_25141 ?auto_25132 ) ) ( not ( = ?auto_25130 ?auto_25141 ) ) ( not ( = ?auto_25136 ?auto_25141 ) ) ( HOIST-AT ?auto_25144 ?auto_25141 ) ( not ( = ?auto_25133 ?auto_25144 ) ) ( not ( = ?auto_25138 ?auto_25144 ) ) ( not ( = ?auto_25131 ?auto_25144 ) ) ( AVAILABLE ?auto_25144 ) ( SURFACE-AT ?auto_25140 ?auto_25141 ) ( ON ?auto_25140 ?auto_25149 ) ( CLEAR ?auto_25140 ) ( not ( = ?auto_25126 ?auto_25149 ) ) ( not ( = ?auto_25127 ?auto_25149 ) ) ( not ( = ?auto_25142 ?auto_25149 ) ) ( not ( = ?auto_25140 ?auto_25149 ) ) ( not ( = ?auto_25146 ?auto_25149 ) ) ( not ( = ?auto_25147 ?auto_25149 ) ) ( IS-CRATE ?auto_25147 ) ( not ( = ?auto_25126 ?auto_25135 ) ) ( not ( = ?auto_25127 ?auto_25135 ) ) ( not ( = ?auto_25142 ?auto_25135 ) ) ( not ( = ?auto_25140 ?auto_25135 ) ) ( not ( = ?auto_25146 ?auto_25135 ) ) ( not ( = ?auto_25147 ?auto_25135 ) ) ( not ( = ?auto_25149 ?auto_25135 ) ) ( not ( = ?auto_25128 ?auto_25132 ) ) ( not ( = ?auto_25130 ?auto_25128 ) ) ( not ( = ?auto_25136 ?auto_25128 ) ) ( not ( = ?auto_25141 ?auto_25128 ) ) ( HOIST-AT ?auto_25129 ?auto_25128 ) ( not ( = ?auto_25133 ?auto_25129 ) ) ( not ( = ?auto_25138 ?auto_25129 ) ) ( not ( = ?auto_25131 ?auto_25129 ) ) ( not ( = ?auto_25144 ?auto_25129 ) ) ( SURFACE-AT ?auto_25147 ?auto_25128 ) ( ON ?auto_25147 ?auto_25145 ) ( CLEAR ?auto_25147 ) ( not ( = ?auto_25126 ?auto_25145 ) ) ( not ( = ?auto_25127 ?auto_25145 ) ) ( not ( = ?auto_25142 ?auto_25145 ) ) ( not ( = ?auto_25140 ?auto_25145 ) ) ( not ( = ?auto_25146 ?auto_25145 ) ) ( not ( = ?auto_25147 ?auto_25145 ) ) ( not ( = ?auto_25149 ?auto_25145 ) ) ( not ( = ?auto_25135 ?auto_25145 ) ) ( IS-CRATE ?auto_25135 ) ( not ( = ?auto_25126 ?auto_25148 ) ) ( not ( = ?auto_25127 ?auto_25148 ) ) ( not ( = ?auto_25142 ?auto_25148 ) ) ( not ( = ?auto_25140 ?auto_25148 ) ) ( not ( = ?auto_25146 ?auto_25148 ) ) ( not ( = ?auto_25147 ?auto_25148 ) ) ( not ( = ?auto_25149 ?auto_25148 ) ) ( not ( = ?auto_25135 ?auto_25148 ) ) ( not ( = ?auto_25145 ?auto_25148 ) ) ( AVAILABLE ?auto_25131 ) ( SURFACE-AT ?auto_25135 ?auto_25136 ) ( ON ?auto_25135 ?auto_25139 ) ( CLEAR ?auto_25135 ) ( not ( = ?auto_25126 ?auto_25139 ) ) ( not ( = ?auto_25127 ?auto_25139 ) ) ( not ( = ?auto_25142 ?auto_25139 ) ) ( not ( = ?auto_25140 ?auto_25139 ) ) ( not ( = ?auto_25146 ?auto_25139 ) ) ( not ( = ?auto_25147 ?auto_25139 ) ) ( not ( = ?auto_25149 ?auto_25139 ) ) ( not ( = ?auto_25135 ?auto_25139 ) ) ( not ( = ?auto_25145 ?auto_25139 ) ) ( not ( = ?auto_25148 ?auto_25139 ) ) ( IS-CRATE ?auto_25148 ) ( not ( = ?auto_25126 ?auto_25134 ) ) ( not ( = ?auto_25127 ?auto_25134 ) ) ( not ( = ?auto_25142 ?auto_25134 ) ) ( not ( = ?auto_25140 ?auto_25134 ) ) ( not ( = ?auto_25146 ?auto_25134 ) ) ( not ( = ?auto_25147 ?auto_25134 ) ) ( not ( = ?auto_25149 ?auto_25134 ) ) ( not ( = ?auto_25135 ?auto_25134 ) ) ( not ( = ?auto_25145 ?auto_25134 ) ) ( not ( = ?auto_25148 ?auto_25134 ) ) ( not ( = ?auto_25139 ?auto_25134 ) ) ( AVAILABLE ?auto_25129 ) ( SURFACE-AT ?auto_25148 ?auto_25128 ) ( ON ?auto_25148 ?auto_25143 ) ( CLEAR ?auto_25148 ) ( not ( = ?auto_25126 ?auto_25143 ) ) ( not ( = ?auto_25127 ?auto_25143 ) ) ( not ( = ?auto_25142 ?auto_25143 ) ) ( not ( = ?auto_25140 ?auto_25143 ) ) ( not ( = ?auto_25146 ?auto_25143 ) ) ( not ( = ?auto_25147 ?auto_25143 ) ) ( not ( = ?auto_25149 ?auto_25143 ) ) ( not ( = ?auto_25135 ?auto_25143 ) ) ( not ( = ?auto_25145 ?auto_25143 ) ) ( not ( = ?auto_25148 ?auto_25143 ) ) ( not ( = ?auto_25139 ?auto_25143 ) ) ( not ( = ?auto_25134 ?auto_25143 ) ) ( SURFACE-AT ?auto_25150 ?auto_25132 ) ( CLEAR ?auto_25150 ) ( IS-CRATE ?auto_25134 ) ( not ( = ?auto_25126 ?auto_25150 ) ) ( not ( = ?auto_25127 ?auto_25150 ) ) ( not ( = ?auto_25142 ?auto_25150 ) ) ( not ( = ?auto_25140 ?auto_25150 ) ) ( not ( = ?auto_25146 ?auto_25150 ) ) ( not ( = ?auto_25147 ?auto_25150 ) ) ( not ( = ?auto_25149 ?auto_25150 ) ) ( not ( = ?auto_25135 ?auto_25150 ) ) ( not ( = ?auto_25145 ?auto_25150 ) ) ( not ( = ?auto_25148 ?auto_25150 ) ) ( not ( = ?auto_25139 ?auto_25150 ) ) ( not ( = ?auto_25134 ?auto_25150 ) ) ( not ( = ?auto_25143 ?auto_25150 ) ) ( AVAILABLE ?auto_25133 ) ( IN ?auto_25134 ?auto_25137 ) ( TRUCK-AT ?auto_25137 ?auto_25128 ) )
    :subtasks
    ( ( !DRIVE ?auto_25137 ?auto_25128 ?auto_25132 )
      ( MAKE-ON ?auto_25126 ?auto_25127 )
      ( MAKE-ON-VERIFY ?auto_25126 ?auto_25127 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25151 - SURFACE
      ?auto_25152 - SURFACE
    )
    :vars
    (
      ?auto_25163 - HOIST
      ?auto_25175 - PLACE
      ?auto_25159 - PLACE
      ?auto_25174 - HOIST
      ?auto_25166 - SURFACE
      ?auto_25160 - SURFACE
      ?auto_25165 - PLACE
      ?auto_25161 - HOIST
      ?auto_25154 - SURFACE
      ?auto_25168 - SURFACE
      ?auto_25158 - PLACE
      ?auto_25156 - HOIST
      ?auto_25170 - SURFACE
      ?auto_25153 - SURFACE
      ?auto_25173 - PLACE
      ?auto_25162 - HOIST
      ?auto_25155 - SURFACE
      ?auto_25169 - SURFACE
      ?auto_25164 - SURFACE
      ?auto_25167 - SURFACE
      ?auto_25172 - SURFACE
      ?auto_25171 - SURFACE
      ?auto_25157 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25163 ?auto_25175 ) ( IS-CRATE ?auto_25151 ) ( not ( = ?auto_25151 ?auto_25152 ) ) ( not ( = ?auto_25159 ?auto_25175 ) ) ( HOIST-AT ?auto_25174 ?auto_25159 ) ( not ( = ?auto_25163 ?auto_25174 ) ) ( AVAILABLE ?auto_25174 ) ( SURFACE-AT ?auto_25151 ?auto_25159 ) ( ON ?auto_25151 ?auto_25166 ) ( CLEAR ?auto_25151 ) ( not ( = ?auto_25151 ?auto_25166 ) ) ( not ( = ?auto_25152 ?auto_25166 ) ) ( IS-CRATE ?auto_25152 ) ( not ( = ?auto_25151 ?auto_25160 ) ) ( not ( = ?auto_25152 ?auto_25160 ) ) ( not ( = ?auto_25166 ?auto_25160 ) ) ( not ( = ?auto_25165 ?auto_25175 ) ) ( not ( = ?auto_25159 ?auto_25165 ) ) ( HOIST-AT ?auto_25161 ?auto_25165 ) ( not ( = ?auto_25163 ?auto_25161 ) ) ( not ( = ?auto_25174 ?auto_25161 ) ) ( SURFACE-AT ?auto_25152 ?auto_25165 ) ( ON ?auto_25152 ?auto_25154 ) ( CLEAR ?auto_25152 ) ( not ( = ?auto_25151 ?auto_25154 ) ) ( not ( = ?auto_25152 ?auto_25154 ) ) ( not ( = ?auto_25166 ?auto_25154 ) ) ( not ( = ?auto_25160 ?auto_25154 ) ) ( IS-CRATE ?auto_25160 ) ( not ( = ?auto_25151 ?auto_25168 ) ) ( not ( = ?auto_25152 ?auto_25168 ) ) ( not ( = ?auto_25166 ?auto_25168 ) ) ( not ( = ?auto_25160 ?auto_25168 ) ) ( not ( = ?auto_25154 ?auto_25168 ) ) ( not ( = ?auto_25158 ?auto_25175 ) ) ( not ( = ?auto_25159 ?auto_25158 ) ) ( not ( = ?auto_25165 ?auto_25158 ) ) ( HOIST-AT ?auto_25156 ?auto_25158 ) ( not ( = ?auto_25163 ?auto_25156 ) ) ( not ( = ?auto_25174 ?auto_25156 ) ) ( not ( = ?auto_25161 ?auto_25156 ) ) ( AVAILABLE ?auto_25156 ) ( SURFACE-AT ?auto_25160 ?auto_25158 ) ( ON ?auto_25160 ?auto_25170 ) ( CLEAR ?auto_25160 ) ( not ( = ?auto_25151 ?auto_25170 ) ) ( not ( = ?auto_25152 ?auto_25170 ) ) ( not ( = ?auto_25166 ?auto_25170 ) ) ( not ( = ?auto_25160 ?auto_25170 ) ) ( not ( = ?auto_25154 ?auto_25170 ) ) ( not ( = ?auto_25168 ?auto_25170 ) ) ( IS-CRATE ?auto_25168 ) ( not ( = ?auto_25151 ?auto_25153 ) ) ( not ( = ?auto_25152 ?auto_25153 ) ) ( not ( = ?auto_25166 ?auto_25153 ) ) ( not ( = ?auto_25160 ?auto_25153 ) ) ( not ( = ?auto_25154 ?auto_25153 ) ) ( not ( = ?auto_25168 ?auto_25153 ) ) ( not ( = ?auto_25170 ?auto_25153 ) ) ( not ( = ?auto_25173 ?auto_25175 ) ) ( not ( = ?auto_25159 ?auto_25173 ) ) ( not ( = ?auto_25165 ?auto_25173 ) ) ( not ( = ?auto_25158 ?auto_25173 ) ) ( HOIST-AT ?auto_25162 ?auto_25173 ) ( not ( = ?auto_25163 ?auto_25162 ) ) ( not ( = ?auto_25174 ?auto_25162 ) ) ( not ( = ?auto_25161 ?auto_25162 ) ) ( not ( = ?auto_25156 ?auto_25162 ) ) ( SURFACE-AT ?auto_25168 ?auto_25173 ) ( ON ?auto_25168 ?auto_25155 ) ( CLEAR ?auto_25168 ) ( not ( = ?auto_25151 ?auto_25155 ) ) ( not ( = ?auto_25152 ?auto_25155 ) ) ( not ( = ?auto_25166 ?auto_25155 ) ) ( not ( = ?auto_25160 ?auto_25155 ) ) ( not ( = ?auto_25154 ?auto_25155 ) ) ( not ( = ?auto_25168 ?auto_25155 ) ) ( not ( = ?auto_25170 ?auto_25155 ) ) ( not ( = ?auto_25153 ?auto_25155 ) ) ( IS-CRATE ?auto_25153 ) ( not ( = ?auto_25151 ?auto_25169 ) ) ( not ( = ?auto_25152 ?auto_25169 ) ) ( not ( = ?auto_25166 ?auto_25169 ) ) ( not ( = ?auto_25160 ?auto_25169 ) ) ( not ( = ?auto_25154 ?auto_25169 ) ) ( not ( = ?auto_25168 ?auto_25169 ) ) ( not ( = ?auto_25170 ?auto_25169 ) ) ( not ( = ?auto_25153 ?auto_25169 ) ) ( not ( = ?auto_25155 ?auto_25169 ) ) ( AVAILABLE ?auto_25161 ) ( SURFACE-AT ?auto_25153 ?auto_25165 ) ( ON ?auto_25153 ?auto_25164 ) ( CLEAR ?auto_25153 ) ( not ( = ?auto_25151 ?auto_25164 ) ) ( not ( = ?auto_25152 ?auto_25164 ) ) ( not ( = ?auto_25166 ?auto_25164 ) ) ( not ( = ?auto_25160 ?auto_25164 ) ) ( not ( = ?auto_25154 ?auto_25164 ) ) ( not ( = ?auto_25168 ?auto_25164 ) ) ( not ( = ?auto_25170 ?auto_25164 ) ) ( not ( = ?auto_25153 ?auto_25164 ) ) ( not ( = ?auto_25155 ?auto_25164 ) ) ( not ( = ?auto_25169 ?auto_25164 ) ) ( IS-CRATE ?auto_25169 ) ( not ( = ?auto_25151 ?auto_25167 ) ) ( not ( = ?auto_25152 ?auto_25167 ) ) ( not ( = ?auto_25166 ?auto_25167 ) ) ( not ( = ?auto_25160 ?auto_25167 ) ) ( not ( = ?auto_25154 ?auto_25167 ) ) ( not ( = ?auto_25168 ?auto_25167 ) ) ( not ( = ?auto_25170 ?auto_25167 ) ) ( not ( = ?auto_25153 ?auto_25167 ) ) ( not ( = ?auto_25155 ?auto_25167 ) ) ( not ( = ?auto_25169 ?auto_25167 ) ) ( not ( = ?auto_25164 ?auto_25167 ) ) ( SURFACE-AT ?auto_25169 ?auto_25173 ) ( ON ?auto_25169 ?auto_25172 ) ( CLEAR ?auto_25169 ) ( not ( = ?auto_25151 ?auto_25172 ) ) ( not ( = ?auto_25152 ?auto_25172 ) ) ( not ( = ?auto_25166 ?auto_25172 ) ) ( not ( = ?auto_25160 ?auto_25172 ) ) ( not ( = ?auto_25154 ?auto_25172 ) ) ( not ( = ?auto_25168 ?auto_25172 ) ) ( not ( = ?auto_25170 ?auto_25172 ) ) ( not ( = ?auto_25153 ?auto_25172 ) ) ( not ( = ?auto_25155 ?auto_25172 ) ) ( not ( = ?auto_25169 ?auto_25172 ) ) ( not ( = ?auto_25164 ?auto_25172 ) ) ( not ( = ?auto_25167 ?auto_25172 ) ) ( SURFACE-AT ?auto_25171 ?auto_25175 ) ( CLEAR ?auto_25171 ) ( IS-CRATE ?auto_25167 ) ( not ( = ?auto_25151 ?auto_25171 ) ) ( not ( = ?auto_25152 ?auto_25171 ) ) ( not ( = ?auto_25166 ?auto_25171 ) ) ( not ( = ?auto_25160 ?auto_25171 ) ) ( not ( = ?auto_25154 ?auto_25171 ) ) ( not ( = ?auto_25168 ?auto_25171 ) ) ( not ( = ?auto_25170 ?auto_25171 ) ) ( not ( = ?auto_25153 ?auto_25171 ) ) ( not ( = ?auto_25155 ?auto_25171 ) ) ( not ( = ?auto_25169 ?auto_25171 ) ) ( not ( = ?auto_25164 ?auto_25171 ) ) ( not ( = ?auto_25167 ?auto_25171 ) ) ( not ( = ?auto_25172 ?auto_25171 ) ) ( AVAILABLE ?auto_25163 ) ( TRUCK-AT ?auto_25157 ?auto_25173 ) ( LIFTING ?auto_25162 ?auto_25167 ) )
    :subtasks
    ( ( !LOAD ?auto_25162 ?auto_25167 ?auto_25157 ?auto_25173 )
      ( MAKE-ON ?auto_25151 ?auto_25152 )
      ( MAKE-ON-VERIFY ?auto_25151 ?auto_25152 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25176 - SURFACE
      ?auto_25177 - SURFACE
    )
    :vars
    (
      ?auto_25189 - HOIST
      ?auto_25186 - PLACE
      ?auto_25184 - PLACE
      ?auto_25179 - HOIST
      ?auto_25194 - SURFACE
      ?auto_25198 - SURFACE
      ?auto_25196 - PLACE
      ?auto_25185 - HOIST
      ?auto_25191 - SURFACE
      ?auto_25187 - SURFACE
      ?auto_25190 - PLACE
      ?auto_25195 - HOIST
      ?auto_25178 - SURFACE
      ?auto_25200 - SURFACE
      ?auto_25182 - PLACE
      ?auto_25197 - HOIST
      ?auto_25199 - SURFACE
      ?auto_25180 - SURFACE
      ?auto_25192 - SURFACE
      ?auto_25188 - SURFACE
      ?auto_25181 - SURFACE
      ?auto_25183 - SURFACE
      ?auto_25193 - TRUCK
      ?auto_25201 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25189 ?auto_25186 ) ( IS-CRATE ?auto_25176 ) ( not ( = ?auto_25176 ?auto_25177 ) ) ( not ( = ?auto_25184 ?auto_25186 ) ) ( HOIST-AT ?auto_25179 ?auto_25184 ) ( not ( = ?auto_25189 ?auto_25179 ) ) ( AVAILABLE ?auto_25179 ) ( SURFACE-AT ?auto_25176 ?auto_25184 ) ( ON ?auto_25176 ?auto_25194 ) ( CLEAR ?auto_25176 ) ( not ( = ?auto_25176 ?auto_25194 ) ) ( not ( = ?auto_25177 ?auto_25194 ) ) ( IS-CRATE ?auto_25177 ) ( not ( = ?auto_25176 ?auto_25198 ) ) ( not ( = ?auto_25177 ?auto_25198 ) ) ( not ( = ?auto_25194 ?auto_25198 ) ) ( not ( = ?auto_25196 ?auto_25186 ) ) ( not ( = ?auto_25184 ?auto_25196 ) ) ( HOIST-AT ?auto_25185 ?auto_25196 ) ( not ( = ?auto_25189 ?auto_25185 ) ) ( not ( = ?auto_25179 ?auto_25185 ) ) ( SURFACE-AT ?auto_25177 ?auto_25196 ) ( ON ?auto_25177 ?auto_25191 ) ( CLEAR ?auto_25177 ) ( not ( = ?auto_25176 ?auto_25191 ) ) ( not ( = ?auto_25177 ?auto_25191 ) ) ( not ( = ?auto_25194 ?auto_25191 ) ) ( not ( = ?auto_25198 ?auto_25191 ) ) ( IS-CRATE ?auto_25198 ) ( not ( = ?auto_25176 ?auto_25187 ) ) ( not ( = ?auto_25177 ?auto_25187 ) ) ( not ( = ?auto_25194 ?auto_25187 ) ) ( not ( = ?auto_25198 ?auto_25187 ) ) ( not ( = ?auto_25191 ?auto_25187 ) ) ( not ( = ?auto_25190 ?auto_25186 ) ) ( not ( = ?auto_25184 ?auto_25190 ) ) ( not ( = ?auto_25196 ?auto_25190 ) ) ( HOIST-AT ?auto_25195 ?auto_25190 ) ( not ( = ?auto_25189 ?auto_25195 ) ) ( not ( = ?auto_25179 ?auto_25195 ) ) ( not ( = ?auto_25185 ?auto_25195 ) ) ( AVAILABLE ?auto_25195 ) ( SURFACE-AT ?auto_25198 ?auto_25190 ) ( ON ?auto_25198 ?auto_25178 ) ( CLEAR ?auto_25198 ) ( not ( = ?auto_25176 ?auto_25178 ) ) ( not ( = ?auto_25177 ?auto_25178 ) ) ( not ( = ?auto_25194 ?auto_25178 ) ) ( not ( = ?auto_25198 ?auto_25178 ) ) ( not ( = ?auto_25191 ?auto_25178 ) ) ( not ( = ?auto_25187 ?auto_25178 ) ) ( IS-CRATE ?auto_25187 ) ( not ( = ?auto_25176 ?auto_25200 ) ) ( not ( = ?auto_25177 ?auto_25200 ) ) ( not ( = ?auto_25194 ?auto_25200 ) ) ( not ( = ?auto_25198 ?auto_25200 ) ) ( not ( = ?auto_25191 ?auto_25200 ) ) ( not ( = ?auto_25187 ?auto_25200 ) ) ( not ( = ?auto_25178 ?auto_25200 ) ) ( not ( = ?auto_25182 ?auto_25186 ) ) ( not ( = ?auto_25184 ?auto_25182 ) ) ( not ( = ?auto_25196 ?auto_25182 ) ) ( not ( = ?auto_25190 ?auto_25182 ) ) ( HOIST-AT ?auto_25197 ?auto_25182 ) ( not ( = ?auto_25189 ?auto_25197 ) ) ( not ( = ?auto_25179 ?auto_25197 ) ) ( not ( = ?auto_25185 ?auto_25197 ) ) ( not ( = ?auto_25195 ?auto_25197 ) ) ( SURFACE-AT ?auto_25187 ?auto_25182 ) ( ON ?auto_25187 ?auto_25199 ) ( CLEAR ?auto_25187 ) ( not ( = ?auto_25176 ?auto_25199 ) ) ( not ( = ?auto_25177 ?auto_25199 ) ) ( not ( = ?auto_25194 ?auto_25199 ) ) ( not ( = ?auto_25198 ?auto_25199 ) ) ( not ( = ?auto_25191 ?auto_25199 ) ) ( not ( = ?auto_25187 ?auto_25199 ) ) ( not ( = ?auto_25178 ?auto_25199 ) ) ( not ( = ?auto_25200 ?auto_25199 ) ) ( IS-CRATE ?auto_25200 ) ( not ( = ?auto_25176 ?auto_25180 ) ) ( not ( = ?auto_25177 ?auto_25180 ) ) ( not ( = ?auto_25194 ?auto_25180 ) ) ( not ( = ?auto_25198 ?auto_25180 ) ) ( not ( = ?auto_25191 ?auto_25180 ) ) ( not ( = ?auto_25187 ?auto_25180 ) ) ( not ( = ?auto_25178 ?auto_25180 ) ) ( not ( = ?auto_25200 ?auto_25180 ) ) ( not ( = ?auto_25199 ?auto_25180 ) ) ( AVAILABLE ?auto_25185 ) ( SURFACE-AT ?auto_25200 ?auto_25196 ) ( ON ?auto_25200 ?auto_25192 ) ( CLEAR ?auto_25200 ) ( not ( = ?auto_25176 ?auto_25192 ) ) ( not ( = ?auto_25177 ?auto_25192 ) ) ( not ( = ?auto_25194 ?auto_25192 ) ) ( not ( = ?auto_25198 ?auto_25192 ) ) ( not ( = ?auto_25191 ?auto_25192 ) ) ( not ( = ?auto_25187 ?auto_25192 ) ) ( not ( = ?auto_25178 ?auto_25192 ) ) ( not ( = ?auto_25200 ?auto_25192 ) ) ( not ( = ?auto_25199 ?auto_25192 ) ) ( not ( = ?auto_25180 ?auto_25192 ) ) ( IS-CRATE ?auto_25180 ) ( not ( = ?auto_25176 ?auto_25188 ) ) ( not ( = ?auto_25177 ?auto_25188 ) ) ( not ( = ?auto_25194 ?auto_25188 ) ) ( not ( = ?auto_25198 ?auto_25188 ) ) ( not ( = ?auto_25191 ?auto_25188 ) ) ( not ( = ?auto_25187 ?auto_25188 ) ) ( not ( = ?auto_25178 ?auto_25188 ) ) ( not ( = ?auto_25200 ?auto_25188 ) ) ( not ( = ?auto_25199 ?auto_25188 ) ) ( not ( = ?auto_25180 ?auto_25188 ) ) ( not ( = ?auto_25192 ?auto_25188 ) ) ( SURFACE-AT ?auto_25180 ?auto_25182 ) ( ON ?auto_25180 ?auto_25181 ) ( CLEAR ?auto_25180 ) ( not ( = ?auto_25176 ?auto_25181 ) ) ( not ( = ?auto_25177 ?auto_25181 ) ) ( not ( = ?auto_25194 ?auto_25181 ) ) ( not ( = ?auto_25198 ?auto_25181 ) ) ( not ( = ?auto_25191 ?auto_25181 ) ) ( not ( = ?auto_25187 ?auto_25181 ) ) ( not ( = ?auto_25178 ?auto_25181 ) ) ( not ( = ?auto_25200 ?auto_25181 ) ) ( not ( = ?auto_25199 ?auto_25181 ) ) ( not ( = ?auto_25180 ?auto_25181 ) ) ( not ( = ?auto_25192 ?auto_25181 ) ) ( not ( = ?auto_25188 ?auto_25181 ) ) ( SURFACE-AT ?auto_25183 ?auto_25186 ) ( CLEAR ?auto_25183 ) ( IS-CRATE ?auto_25188 ) ( not ( = ?auto_25176 ?auto_25183 ) ) ( not ( = ?auto_25177 ?auto_25183 ) ) ( not ( = ?auto_25194 ?auto_25183 ) ) ( not ( = ?auto_25198 ?auto_25183 ) ) ( not ( = ?auto_25191 ?auto_25183 ) ) ( not ( = ?auto_25187 ?auto_25183 ) ) ( not ( = ?auto_25178 ?auto_25183 ) ) ( not ( = ?auto_25200 ?auto_25183 ) ) ( not ( = ?auto_25199 ?auto_25183 ) ) ( not ( = ?auto_25180 ?auto_25183 ) ) ( not ( = ?auto_25192 ?auto_25183 ) ) ( not ( = ?auto_25188 ?auto_25183 ) ) ( not ( = ?auto_25181 ?auto_25183 ) ) ( AVAILABLE ?auto_25189 ) ( TRUCK-AT ?auto_25193 ?auto_25182 ) ( AVAILABLE ?auto_25197 ) ( SURFACE-AT ?auto_25188 ?auto_25182 ) ( ON ?auto_25188 ?auto_25201 ) ( CLEAR ?auto_25188 ) ( not ( = ?auto_25176 ?auto_25201 ) ) ( not ( = ?auto_25177 ?auto_25201 ) ) ( not ( = ?auto_25194 ?auto_25201 ) ) ( not ( = ?auto_25198 ?auto_25201 ) ) ( not ( = ?auto_25191 ?auto_25201 ) ) ( not ( = ?auto_25187 ?auto_25201 ) ) ( not ( = ?auto_25178 ?auto_25201 ) ) ( not ( = ?auto_25200 ?auto_25201 ) ) ( not ( = ?auto_25199 ?auto_25201 ) ) ( not ( = ?auto_25180 ?auto_25201 ) ) ( not ( = ?auto_25192 ?auto_25201 ) ) ( not ( = ?auto_25188 ?auto_25201 ) ) ( not ( = ?auto_25181 ?auto_25201 ) ) ( not ( = ?auto_25183 ?auto_25201 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25197 ?auto_25188 ?auto_25201 ?auto_25182 )
      ( MAKE-ON ?auto_25176 ?auto_25177 )
      ( MAKE-ON-VERIFY ?auto_25176 ?auto_25177 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_25202 - SURFACE
      ?auto_25203 - SURFACE
    )
    :vars
    (
      ?auto_25214 - HOIST
      ?auto_25218 - PLACE
      ?auto_25213 - PLACE
      ?auto_25216 - HOIST
      ?auto_25220 - SURFACE
      ?auto_25224 - SURFACE
      ?auto_25222 - PLACE
      ?auto_25206 - HOIST
      ?auto_25217 - SURFACE
      ?auto_25211 - SURFACE
      ?auto_25204 - PLACE
      ?auto_25221 - HOIST
      ?auto_25219 - SURFACE
      ?auto_25226 - SURFACE
      ?auto_25215 - PLACE
      ?auto_25223 - HOIST
      ?auto_25225 - SURFACE
      ?auto_25209 - SURFACE
      ?auto_25208 - SURFACE
      ?auto_25207 - SURFACE
      ?auto_25210 - SURFACE
      ?auto_25205 - SURFACE
      ?auto_25227 - SURFACE
      ?auto_25212 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25214 ?auto_25218 ) ( IS-CRATE ?auto_25202 ) ( not ( = ?auto_25202 ?auto_25203 ) ) ( not ( = ?auto_25213 ?auto_25218 ) ) ( HOIST-AT ?auto_25216 ?auto_25213 ) ( not ( = ?auto_25214 ?auto_25216 ) ) ( AVAILABLE ?auto_25216 ) ( SURFACE-AT ?auto_25202 ?auto_25213 ) ( ON ?auto_25202 ?auto_25220 ) ( CLEAR ?auto_25202 ) ( not ( = ?auto_25202 ?auto_25220 ) ) ( not ( = ?auto_25203 ?auto_25220 ) ) ( IS-CRATE ?auto_25203 ) ( not ( = ?auto_25202 ?auto_25224 ) ) ( not ( = ?auto_25203 ?auto_25224 ) ) ( not ( = ?auto_25220 ?auto_25224 ) ) ( not ( = ?auto_25222 ?auto_25218 ) ) ( not ( = ?auto_25213 ?auto_25222 ) ) ( HOIST-AT ?auto_25206 ?auto_25222 ) ( not ( = ?auto_25214 ?auto_25206 ) ) ( not ( = ?auto_25216 ?auto_25206 ) ) ( SURFACE-AT ?auto_25203 ?auto_25222 ) ( ON ?auto_25203 ?auto_25217 ) ( CLEAR ?auto_25203 ) ( not ( = ?auto_25202 ?auto_25217 ) ) ( not ( = ?auto_25203 ?auto_25217 ) ) ( not ( = ?auto_25220 ?auto_25217 ) ) ( not ( = ?auto_25224 ?auto_25217 ) ) ( IS-CRATE ?auto_25224 ) ( not ( = ?auto_25202 ?auto_25211 ) ) ( not ( = ?auto_25203 ?auto_25211 ) ) ( not ( = ?auto_25220 ?auto_25211 ) ) ( not ( = ?auto_25224 ?auto_25211 ) ) ( not ( = ?auto_25217 ?auto_25211 ) ) ( not ( = ?auto_25204 ?auto_25218 ) ) ( not ( = ?auto_25213 ?auto_25204 ) ) ( not ( = ?auto_25222 ?auto_25204 ) ) ( HOIST-AT ?auto_25221 ?auto_25204 ) ( not ( = ?auto_25214 ?auto_25221 ) ) ( not ( = ?auto_25216 ?auto_25221 ) ) ( not ( = ?auto_25206 ?auto_25221 ) ) ( AVAILABLE ?auto_25221 ) ( SURFACE-AT ?auto_25224 ?auto_25204 ) ( ON ?auto_25224 ?auto_25219 ) ( CLEAR ?auto_25224 ) ( not ( = ?auto_25202 ?auto_25219 ) ) ( not ( = ?auto_25203 ?auto_25219 ) ) ( not ( = ?auto_25220 ?auto_25219 ) ) ( not ( = ?auto_25224 ?auto_25219 ) ) ( not ( = ?auto_25217 ?auto_25219 ) ) ( not ( = ?auto_25211 ?auto_25219 ) ) ( IS-CRATE ?auto_25211 ) ( not ( = ?auto_25202 ?auto_25226 ) ) ( not ( = ?auto_25203 ?auto_25226 ) ) ( not ( = ?auto_25220 ?auto_25226 ) ) ( not ( = ?auto_25224 ?auto_25226 ) ) ( not ( = ?auto_25217 ?auto_25226 ) ) ( not ( = ?auto_25211 ?auto_25226 ) ) ( not ( = ?auto_25219 ?auto_25226 ) ) ( not ( = ?auto_25215 ?auto_25218 ) ) ( not ( = ?auto_25213 ?auto_25215 ) ) ( not ( = ?auto_25222 ?auto_25215 ) ) ( not ( = ?auto_25204 ?auto_25215 ) ) ( HOIST-AT ?auto_25223 ?auto_25215 ) ( not ( = ?auto_25214 ?auto_25223 ) ) ( not ( = ?auto_25216 ?auto_25223 ) ) ( not ( = ?auto_25206 ?auto_25223 ) ) ( not ( = ?auto_25221 ?auto_25223 ) ) ( SURFACE-AT ?auto_25211 ?auto_25215 ) ( ON ?auto_25211 ?auto_25225 ) ( CLEAR ?auto_25211 ) ( not ( = ?auto_25202 ?auto_25225 ) ) ( not ( = ?auto_25203 ?auto_25225 ) ) ( not ( = ?auto_25220 ?auto_25225 ) ) ( not ( = ?auto_25224 ?auto_25225 ) ) ( not ( = ?auto_25217 ?auto_25225 ) ) ( not ( = ?auto_25211 ?auto_25225 ) ) ( not ( = ?auto_25219 ?auto_25225 ) ) ( not ( = ?auto_25226 ?auto_25225 ) ) ( IS-CRATE ?auto_25226 ) ( not ( = ?auto_25202 ?auto_25209 ) ) ( not ( = ?auto_25203 ?auto_25209 ) ) ( not ( = ?auto_25220 ?auto_25209 ) ) ( not ( = ?auto_25224 ?auto_25209 ) ) ( not ( = ?auto_25217 ?auto_25209 ) ) ( not ( = ?auto_25211 ?auto_25209 ) ) ( not ( = ?auto_25219 ?auto_25209 ) ) ( not ( = ?auto_25226 ?auto_25209 ) ) ( not ( = ?auto_25225 ?auto_25209 ) ) ( AVAILABLE ?auto_25206 ) ( SURFACE-AT ?auto_25226 ?auto_25222 ) ( ON ?auto_25226 ?auto_25208 ) ( CLEAR ?auto_25226 ) ( not ( = ?auto_25202 ?auto_25208 ) ) ( not ( = ?auto_25203 ?auto_25208 ) ) ( not ( = ?auto_25220 ?auto_25208 ) ) ( not ( = ?auto_25224 ?auto_25208 ) ) ( not ( = ?auto_25217 ?auto_25208 ) ) ( not ( = ?auto_25211 ?auto_25208 ) ) ( not ( = ?auto_25219 ?auto_25208 ) ) ( not ( = ?auto_25226 ?auto_25208 ) ) ( not ( = ?auto_25225 ?auto_25208 ) ) ( not ( = ?auto_25209 ?auto_25208 ) ) ( IS-CRATE ?auto_25209 ) ( not ( = ?auto_25202 ?auto_25207 ) ) ( not ( = ?auto_25203 ?auto_25207 ) ) ( not ( = ?auto_25220 ?auto_25207 ) ) ( not ( = ?auto_25224 ?auto_25207 ) ) ( not ( = ?auto_25217 ?auto_25207 ) ) ( not ( = ?auto_25211 ?auto_25207 ) ) ( not ( = ?auto_25219 ?auto_25207 ) ) ( not ( = ?auto_25226 ?auto_25207 ) ) ( not ( = ?auto_25225 ?auto_25207 ) ) ( not ( = ?auto_25209 ?auto_25207 ) ) ( not ( = ?auto_25208 ?auto_25207 ) ) ( SURFACE-AT ?auto_25209 ?auto_25215 ) ( ON ?auto_25209 ?auto_25210 ) ( CLEAR ?auto_25209 ) ( not ( = ?auto_25202 ?auto_25210 ) ) ( not ( = ?auto_25203 ?auto_25210 ) ) ( not ( = ?auto_25220 ?auto_25210 ) ) ( not ( = ?auto_25224 ?auto_25210 ) ) ( not ( = ?auto_25217 ?auto_25210 ) ) ( not ( = ?auto_25211 ?auto_25210 ) ) ( not ( = ?auto_25219 ?auto_25210 ) ) ( not ( = ?auto_25226 ?auto_25210 ) ) ( not ( = ?auto_25225 ?auto_25210 ) ) ( not ( = ?auto_25209 ?auto_25210 ) ) ( not ( = ?auto_25208 ?auto_25210 ) ) ( not ( = ?auto_25207 ?auto_25210 ) ) ( SURFACE-AT ?auto_25205 ?auto_25218 ) ( CLEAR ?auto_25205 ) ( IS-CRATE ?auto_25207 ) ( not ( = ?auto_25202 ?auto_25205 ) ) ( not ( = ?auto_25203 ?auto_25205 ) ) ( not ( = ?auto_25220 ?auto_25205 ) ) ( not ( = ?auto_25224 ?auto_25205 ) ) ( not ( = ?auto_25217 ?auto_25205 ) ) ( not ( = ?auto_25211 ?auto_25205 ) ) ( not ( = ?auto_25219 ?auto_25205 ) ) ( not ( = ?auto_25226 ?auto_25205 ) ) ( not ( = ?auto_25225 ?auto_25205 ) ) ( not ( = ?auto_25209 ?auto_25205 ) ) ( not ( = ?auto_25208 ?auto_25205 ) ) ( not ( = ?auto_25207 ?auto_25205 ) ) ( not ( = ?auto_25210 ?auto_25205 ) ) ( AVAILABLE ?auto_25214 ) ( AVAILABLE ?auto_25223 ) ( SURFACE-AT ?auto_25207 ?auto_25215 ) ( ON ?auto_25207 ?auto_25227 ) ( CLEAR ?auto_25207 ) ( not ( = ?auto_25202 ?auto_25227 ) ) ( not ( = ?auto_25203 ?auto_25227 ) ) ( not ( = ?auto_25220 ?auto_25227 ) ) ( not ( = ?auto_25224 ?auto_25227 ) ) ( not ( = ?auto_25217 ?auto_25227 ) ) ( not ( = ?auto_25211 ?auto_25227 ) ) ( not ( = ?auto_25219 ?auto_25227 ) ) ( not ( = ?auto_25226 ?auto_25227 ) ) ( not ( = ?auto_25225 ?auto_25227 ) ) ( not ( = ?auto_25209 ?auto_25227 ) ) ( not ( = ?auto_25208 ?auto_25227 ) ) ( not ( = ?auto_25207 ?auto_25227 ) ) ( not ( = ?auto_25210 ?auto_25227 ) ) ( not ( = ?auto_25205 ?auto_25227 ) ) ( TRUCK-AT ?auto_25212 ?auto_25218 ) )
    :subtasks
    ( ( !DRIVE ?auto_25212 ?auto_25218 ?auto_25215 )
      ( MAKE-ON ?auto_25202 ?auto_25203 )
      ( MAKE-ON-VERIFY ?auto_25202 ?auto_25203 ) )
  )

)

