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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8976 - SURFACE
      ?auto_8977 - SURFACE
    )
    :vars
    (
      ?auto_8978 - HOIST
      ?auto_8979 - PLACE
      ?auto_8981 - PLACE
      ?auto_8982 - HOIST
      ?auto_8983 - SURFACE
      ?auto_8980 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8978 ?auto_8979 ) ( SURFACE-AT ?auto_8976 ?auto_8979 ) ( CLEAR ?auto_8976 ) ( IS-CRATE ?auto_8977 ) ( AVAILABLE ?auto_8978 ) ( not ( = ?auto_8981 ?auto_8979 ) ) ( HOIST-AT ?auto_8982 ?auto_8981 ) ( AVAILABLE ?auto_8982 ) ( SURFACE-AT ?auto_8977 ?auto_8981 ) ( ON ?auto_8977 ?auto_8983 ) ( CLEAR ?auto_8977 ) ( TRUCK-AT ?auto_8980 ?auto_8979 ) ( not ( = ?auto_8976 ?auto_8977 ) ) ( not ( = ?auto_8976 ?auto_8983 ) ) ( not ( = ?auto_8977 ?auto_8983 ) ) ( not ( = ?auto_8978 ?auto_8982 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8980 ?auto_8979 ?auto_8981 )
      ( !LIFT ?auto_8982 ?auto_8977 ?auto_8983 ?auto_8981 )
      ( !LOAD ?auto_8982 ?auto_8977 ?auto_8980 ?auto_8981 )
      ( !DRIVE ?auto_8980 ?auto_8981 ?auto_8979 )
      ( !UNLOAD ?auto_8978 ?auto_8977 ?auto_8980 ?auto_8979 )
      ( !DROP ?auto_8978 ?auto_8977 ?auto_8976 ?auto_8979 )
      ( MAKE-1CRATE-VERIFY ?auto_8976 ?auto_8977 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8986 - SURFACE
      ?auto_8987 - SURFACE
    )
    :vars
    (
      ?auto_8988 - HOIST
      ?auto_8989 - PLACE
      ?auto_8991 - PLACE
      ?auto_8992 - HOIST
      ?auto_8993 - SURFACE
      ?auto_8990 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8988 ?auto_8989 ) ( SURFACE-AT ?auto_8986 ?auto_8989 ) ( CLEAR ?auto_8986 ) ( IS-CRATE ?auto_8987 ) ( AVAILABLE ?auto_8988 ) ( not ( = ?auto_8991 ?auto_8989 ) ) ( HOIST-AT ?auto_8992 ?auto_8991 ) ( AVAILABLE ?auto_8992 ) ( SURFACE-AT ?auto_8987 ?auto_8991 ) ( ON ?auto_8987 ?auto_8993 ) ( CLEAR ?auto_8987 ) ( TRUCK-AT ?auto_8990 ?auto_8989 ) ( not ( = ?auto_8986 ?auto_8987 ) ) ( not ( = ?auto_8986 ?auto_8993 ) ) ( not ( = ?auto_8987 ?auto_8993 ) ) ( not ( = ?auto_8988 ?auto_8992 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8990 ?auto_8989 ?auto_8991 )
      ( !LIFT ?auto_8992 ?auto_8987 ?auto_8993 ?auto_8991 )
      ( !LOAD ?auto_8992 ?auto_8987 ?auto_8990 ?auto_8991 )
      ( !DRIVE ?auto_8990 ?auto_8991 ?auto_8989 )
      ( !UNLOAD ?auto_8988 ?auto_8987 ?auto_8990 ?auto_8989 )
      ( !DROP ?auto_8988 ?auto_8987 ?auto_8986 ?auto_8989 )
      ( MAKE-1CRATE-VERIFY ?auto_8986 ?auto_8987 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8997 - SURFACE
      ?auto_8998 - SURFACE
      ?auto_8999 - SURFACE
    )
    :vars
    (
      ?auto_9001 - HOIST
      ?auto_9003 - PLACE
      ?auto_9005 - PLACE
      ?auto_9002 - HOIST
      ?auto_9000 - SURFACE
      ?auto_9008 - PLACE
      ?auto_9006 - HOIST
      ?auto_9007 - SURFACE
      ?auto_9004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9001 ?auto_9003 ) ( IS-CRATE ?auto_8999 ) ( not ( = ?auto_9005 ?auto_9003 ) ) ( HOIST-AT ?auto_9002 ?auto_9005 ) ( AVAILABLE ?auto_9002 ) ( SURFACE-AT ?auto_8999 ?auto_9005 ) ( ON ?auto_8999 ?auto_9000 ) ( CLEAR ?auto_8999 ) ( not ( = ?auto_8998 ?auto_8999 ) ) ( not ( = ?auto_8998 ?auto_9000 ) ) ( not ( = ?auto_8999 ?auto_9000 ) ) ( not ( = ?auto_9001 ?auto_9002 ) ) ( SURFACE-AT ?auto_8997 ?auto_9003 ) ( CLEAR ?auto_8997 ) ( IS-CRATE ?auto_8998 ) ( AVAILABLE ?auto_9001 ) ( not ( = ?auto_9008 ?auto_9003 ) ) ( HOIST-AT ?auto_9006 ?auto_9008 ) ( AVAILABLE ?auto_9006 ) ( SURFACE-AT ?auto_8998 ?auto_9008 ) ( ON ?auto_8998 ?auto_9007 ) ( CLEAR ?auto_8998 ) ( TRUCK-AT ?auto_9004 ?auto_9003 ) ( not ( = ?auto_8997 ?auto_8998 ) ) ( not ( = ?auto_8997 ?auto_9007 ) ) ( not ( = ?auto_8998 ?auto_9007 ) ) ( not ( = ?auto_9001 ?auto_9006 ) ) ( not ( = ?auto_8997 ?auto_8999 ) ) ( not ( = ?auto_8997 ?auto_9000 ) ) ( not ( = ?auto_8999 ?auto_9007 ) ) ( not ( = ?auto_9005 ?auto_9008 ) ) ( not ( = ?auto_9002 ?auto_9006 ) ) ( not ( = ?auto_9000 ?auto_9007 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8997 ?auto_8998 )
      ( MAKE-1CRATE ?auto_8998 ?auto_8999 )
      ( MAKE-2CRATE-VERIFY ?auto_8997 ?auto_8998 ?auto_8999 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9011 - SURFACE
      ?auto_9012 - SURFACE
    )
    :vars
    (
      ?auto_9013 - HOIST
      ?auto_9014 - PLACE
      ?auto_9016 - PLACE
      ?auto_9017 - HOIST
      ?auto_9018 - SURFACE
      ?auto_9015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9013 ?auto_9014 ) ( SURFACE-AT ?auto_9011 ?auto_9014 ) ( CLEAR ?auto_9011 ) ( IS-CRATE ?auto_9012 ) ( AVAILABLE ?auto_9013 ) ( not ( = ?auto_9016 ?auto_9014 ) ) ( HOIST-AT ?auto_9017 ?auto_9016 ) ( AVAILABLE ?auto_9017 ) ( SURFACE-AT ?auto_9012 ?auto_9016 ) ( ON ?auto_9012 ?auto_9018 ) ( CLEAR ?auto_9012 ) ( TRUCK-AT ?auto_9015 ?auto_9014 ) ( not ( = ?auto_9011 ?auto_9012 ) ) ( not ( = ?auto_9011 ?auto_9018 ) ) ( not ( = ?auto_9012 ?auto_9018 ) ) ( not ( = ?auto_9013 ?auto_9017 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9015 ?auto_9014 ?auto_9016 )
      ( !LIFT ?auto_9017 ?auto_9012 ?auto_9018 ?auto_9016 )
      ( !LOAD ?auto_9017 ?auto_9012 ?auto_9015 ?auto_9016 )
      ( !DRIVE ?auto_9015 ?auto_9016 ?auto_9014 )
      ( !UNLOAD ?auto_9013 ?auto_9012 ?auto_9015 ?auto_9014 )
      ( !DROP ?auto_9013 ?auto_9012 ?auto_9011 ?auto_9014 )
      ( MAKE-1CRATE-VERIFY ?auto_9011 ?auto_9012 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9023 - SURFACE
      ?auto_9024 - SURFACE
      ?auto_9025 - SURFACE
      ?auto_9026 - SURFACE
    )
    :vars
    (
      ?auto_9031 - HOIST
      ?auto_9027 - PLACE
      ?auto_9030 - PLACE
      ?auto_9029 - HOIST
      ?auto_9032 - SURFACE
      ?auto_9036 - SURFACE
      ?auto_9033 - PLACE
      ?auto_9035 - HOIST
      ?auto_9034 - SURFACE
      ?auto_9028 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9031 ?auto_9027 ) ( IS-CRATE ?auto_9026 ) ( not ( = ?auto_9030 ?auto_9027 ) ) ( HOIST-AT ?auto_9029 ?auto_9030 ) ( SURFACE-AT ?auto_9026 ?auto_9030 ) ( ON ?auto_9026 ?auto_9032 ) ( CLEAR ?auto_9026 ) ( not ( = ?auto_9025 ?auto_9026 ) ) ( not ( = ?auto_9025 ?auto_9032 ) ) ( not ( = ?auto_9026 ?auto_9032 ) ) ( not ( = ?auto_9031 ?auto_9029 ) ) ( IS-CRATE ?auto_9025 ) ( AVAILABLE ?auto_9029 ) ( SURFACE-AT ?auto_9025 ?auto_9030 ) ( ON ?auto_9025 ?auto_9036 ) ( CLEAR ?auto_9025 ) ( not ( = ?auto_9024 ?auto_9025 ) ) ( not ( = ?auto_9024 ?auto_9036 ) ) ( not ( = ?auto_9025 ?auto_9036 ) ) ( SURFACE-AT ?auto_9023 ?auto_9027 ) ( CLEAR ?auto_9023 ) ( IS-CRATE ?auto_9024 ) ( AVAILABLE ?auto_9031 ) ( not ( = ?auto_9033 ?auto_9027 ) ) ( HOIST-AT ?auto_9035 ?auto_9033 ) ( AVAILABLE ?auto_9035 ) ( SURFACE-AT ?auto_9024 ?auto_9033 ) ( ON ?auto_9024 ?auto_9034 ) ( CLEAR ?auto_9024 ) ( TRUCK-AT ?auto_9028 ?auto_9027 ) ( not ( = ?auto_9023 ?auto_9024 ) ) ( not ( = ?auto_9023 ?auto_9034 ) ) ( not ( = ?auto_9024 ?auto_9034 ) ) ( not ( = ?auto_9031 ?auto_9035 ) ) ( not ( = ?auto_9023 ?auto_9025 ) ) ( not ( = ?auto_9023 ?auto_9036 ) ) ( not ( = ?auto_9025 ?auto_9034 ) ) ( not ( = ?auto_9030 ?auto_9033 ) ) ( not ( = ?auto_9029 ?auto_9035 ) ) ( not ( = ?auto_9036 ?auto_9034 ) ) ( not ( = ?auto_9023 ?auto_9026 ) ) ( not ( = ?auto_9023 ?auto_9032 ) ) ( not ( = ?auto_9024 ?auto_9026 ) ) ( not ( = ?auto_9024 ?auto_9032 ) ) ( not ( = ?auto_9026 ?auto_9036 ) ) ( not ( = ?auto_9026 ?auto_9034 ) ) ( not ( = ?auto_9032 ?auto_9036 ) ) ( not ( = ?auto_9032 ?auto_9034 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9023 ?auto_9024 ?auto_9025 )
      ( MAKE-1CRATE ?auto_9025 ?auto_9026 )
      ( MAKE-3CRATE-VERIFY ?auto_9023 ?auto_9024 ?auto_9025 ?auto_9026 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9039 - SURFACE
      ?auto_9040 - SURFACE
    )
    :vars
    (
      ?auto_9041 - HOIST
      ?auto_9042 - PLACE
      ?auto_9044 - PLACE
      ?auto_9045 - HOIST
      ?auto_9046 - SURFACE
      ?auto_9043 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9041 ?auto_9042 ) ( SURFACE-AT ?auto_9039 ?auto_9042 ) ( CLEAR ?auto_9039 ) ( IS-CRATE ?auto_9040 ) ( AVAILABLE ?auto_9041 ) ( not ( = ?auto_9044 ?auto_9042 ) ) ( HOIST-AT ?auto_9045 ?auto_9044 ) ( AVAILABLE ?auto_9045 ) ( SURFACE-AT ?auto_9040 ?auto_9044 ) ( ON ?auto_9040 ?auto_9046 ) ( CLEAR ?auto_9040 ) ( TRUCK-AT ?auto_9043 ?auto_9042 ) ( not ( = ?auto_9039 ?auto_9040 ) ) ( not ( = ?auto_9039 ?auto_9046 ) ) ( not ( = ?auto_9040 ?auto_9046 ) ) ( not ( = ?auto_9041 ?auto_9045 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9043 ?auto_9042 ?auto_9044 )
      ( !LIFT ?auto_9045 ?auto_9040 ?auto_9046 ?auto_9044 )
      ( !LOAD ?auto_9045 ?auto_9040 ?auto_9043 ?auto_9044 )
      ( !DRIVE ?auto_9043 ?auto_9044 ?auto_9042 )
      ( !UNLOAD ?auto_9041 ?auto_9040 ?auto_9043 ?auto_9042 )
      ( !DROP ?auto_9041 ?auto_9040 ?auto_9039 ?auto_9042 )
      ( MAKE-1CRATE-VERIFY ?auto_9039 ?auto_9040 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9052 - SURFACE
      ?auto_9053 - SURFACE
      ?auto_9054 - SURFACE
      ?auto_9055 - SURFACE
      ?auto_9056 - SURFACE
    )
    :vars
    (
      ?auto_9061 - HOIST
      ?auto_9060 - PLACE
      ?auto_9062 - PLACE
      ?auto_9059 - HOIST
      ?auto_9058 - SURFACE
      ?auto_9064 - SURFACE
      ?auto_9063 - SURFACE
      ?auto_9067 - PLACE
      ?auto_9065 - HOIST
      ?auto_9066 - SURFACE
      ?auto_9057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9061 ?auto_9060 ) ( IS-CRATE ?auto_9056 ) ( not ( = ?auto_9062 ?auto_9060 ) ) ( HOIST-AT ?auto_9059 ?auto_9062 ) ( SURFACE-AT ?auto_9056 ?auto_9062 ) ( ON ?auto_9056 ?auto_9058 ) ( CLEAR ?auto_9056 ) ( not ( = ?auto_9055 ?auto_9056 ) ) ( not ( = ?auto_9055 ?auto_9058 ) ) ( not ( = ?auto_9056 ?auto_9058 ) ) ( not ( = ?auto_9061 ?auto_9059 ) ) ( IS-CRATE ?auto_9055 ) ( SURFACE-AT ?auto_9055 ?auto_9062 ) ( ON ?auto_9055 ?auto_9064 ) ( CLEAR ?auto_9055 ) ( not ( = ?auto_9054 ?auto_9055 ) ) ( not ( = ?auto_9054 ?auto_9064 ) ) ( not ( = ?auto_9055 ?auto_9064 ) ) ( IS-CRATE ?auto_9054 ) ( AVAILABLE ?auto_9059 ) ( SURFACE-AT ?auto_9054 ?auto_9062 ) ( ON ?auto_9054 ?auto_9063 ) ( CLEAR ?auto_9054 ) ( not ( = ?auto_9053 ?auto_9054 ) ) ( not ( = ?auto_9053 ?auto_9063 ) ) ( not ( = ?auto_9054 ?auto_9063 ) ) ( SURFACE-AT ?auto_9052 ?auto_9060 ) ( CLEAR ?auto_9052 ) ( IS-CRATE ?auto_9053 ) ( AVAILABLE ?auto_9061 ) ( not ( = ?auto_9067 ?auto_9060 ) ) ( HOIST-AT ?auto_9065 ?auto_9067 ) ( AVAILABLE ?auto_9065 ) ( SURFACE-AT ?auto_9053 ?auto_9067 ) ( ON ?auto_9053 ?auto_9066 ) ( CLEAR ?auto_9053 ) ( TRUCK-AT ?auto_9057 ?auto_9060 ) ( not ( = ?auto_9052 ?auto_9053 ) ) ( not ( = ?auto_9052 ?auto_9066 ) ) ( not ( = ?auto_9053 ?auto_9066 ) ) ( not ( = ?auto_9061 ?auto_9065 ) ) ( not ( = ?auto_9052 ?auto_9054 ) ) ( not ( = ?auto_9052 ?auto_9063 ) ) ( not ( = ?auto_9054 ?auto_9066 ) ) ( not ( = ?auto_9062 ?auto_9067 ) ) ( not ( = ?auto_9059 ?auto_9065 ) ) ( not ( = ?auto_9063 ?auto_9066 ) ) ( not ( = ?auto_9052 ?auto_9055 ) ) ( not ( = ?auto_9052 ?auto_9064 ) ) ( not ( = ?auto_9053 ?auto_9055 ) ) ( not ( = ?auto_9053 ?auto_9064 ) ) ( not ( = ?auto_9055 ?auto_9063 ) ) ( not ( = ?auto_9055 ?auto_9066 ) ) ( not ( = ?auto_9064 ?auto_9063 ) ) ( not ( = ?auto_9064 ?auto_9066 ) ) ( not ( = ?auto_9052 ?auto_9056 ) ) ( not ( = ?auto_9052 ?auto_9058 ) ) ( not ( = ?auto_9053 ?auto_9056 ) ) ( not ( = ?auto_9053 ?auto_9058 ) ) ( not ( = ?auto_9054 ?auto_9056 ) ) ( not ( = ?auto_9054 ?auto_9058 ) ) ( not ( = ?auto_9056 ?auto_9064 ) ) ( not ( = ?auto_9056 ?auto_9063 ) ) ( not ( = ?auto_9056 ?auto_9066 ) ) ( not ( = ?auto_9058 ?auto_9064 ) ) ( not ( = ?auto_9058 ?auto_9063 ) ) ( not ( = ?auto_9058 ?auto_9066 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_9052 ?auto_9053 ?auto_9054 ?auto_9055 )
      ( MAKE-1CRATE ?auto_9055 ?auto_9056 )
      ( MAKE-4CRATE-VERIFY ?auto_9052 ?auto_9053 ?auto_9054 ?auto_9055 ?auto_9056 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9070 - SURFACE
      ?auto_9071 - SURFACE
    )
    :vars
    (
      ?auto_9072 - HOIST
      ?auto_9073 - PLACE
      ?auto_9075 - PLACE
      ?auto_9076 - HOIST
      ?auto_9077 - SURFACE
      ?auto_9074 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9072 ?auto_9073 ) ( SURFACE-AT ?auto_9070 ?auto_9073 ) ( CLEAR ?auto_9070 ) ( IS-CRATE ?auto_9071 ) ( AVAILABLE ?auto_9072 ) ( not ( = ?auto_9075 ?auto_9073 ) ) ( HOIST-AT ?auto_9076 ?auto_9075 ) ( AVAILABLE ?auto_9076 ) ( SURFACE-AT ?auto_9071 ?auto_9075 ) ( ON ?auto_9071 ?auto_9077 ) ( CLEAR ?auto_9071 ) ( TRUCK-AT ?auto_9074 ?auto_9073 ) ( not ( = ?auto_9070 ?auto_9071 ) ) ( not ( = ?auto_9070 ?auto_9077 ) ) ( not ( = ?auto_9071 ?auto_9077 ) ) ( not ( = ?auto_9072 ?auto_9076 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9074 ?auto_9073 ?auto_9075 )
      ( !LIFT ?auto_9076 ?auto_9071 ?auto_9077 ?auto_9075 )
      ( !LOAD ?auto_9076 ?auto_9071 ?auto_9074 ?auto_9075 )
      ( !DRIVE ?auto_9074 ?auto_9075 ?auto_9073 )
      ( !UNLOAD ?auto_9072 ?auto_9071 ?auto_9074 ?auto_9073 )
      ( !DROP ?auto_9072 ?auto_9071 ?auto_9070 ?auto_9073 )
      ( MAKE-1CRATE-VERIFY ?auto_9070 ?auto_9071 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_9084 - SURFACE
      ?auto_9085 - SURFACE
      ?auto_9086 - SURFACE
      ?auto_9087 - SURFACE
      ?auto_9088 - SURFACE
      ?auto_9089 - SURFACE
    )
    :vars
    (
      ?auto_9092 - HOIST
      ?auto_9093 - PLACE
      ?auto_9091 - PLACE
      ?auto_9090 - HOIST
      ?auto_9094 - SURFACE
      ?auto_9099 - PLACE
      ?auto_9103 - HOIST
      ?auto_9100 - SURFACE
      ?auto_9102 - SURFACE
      ?auto_9096 - SURFACE
      ?auto_9101 - PLACE
      ?auto_9098 - HOIST
      ?auto_9097 - SURFACE
      ?auto_9095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9092 ?auto_9093 ) ( IS-CRATE ?auto_9089 ) ( not ( = ?auto_9091 ?auto_9093 ) ) ( HOIST-AT ?auto_9090 ?auto_9091 ) ( AVAILABLE ?auto_9090 ) ( SURFACE-AT ?auto_9089 ?auto_9091 ) ( ON ?auto_9089 ?auto_9094 ) ( CLEAR ?auto_9089 ) ( not ( = ?auto_9088 ?auto_9089 ) ) ( not ( = ?auto_9088 ?auto_9094 ) ) ( not ( = ?auto_9089 ?auto_9094 ) ) ( not ( = ?auto_9092 ?auto_9090 ) ) ( IS-CRATE ?auto_9088 ) ( not ( = ?auto_9099 ?auto_9093 ) ) ( HOIST-AT ?auto_9103 ?auto_9099 ) ( SURFACE-AT ?auto_9088 ?auto_9099 ) ( ON ?auto_9088 ?auto_9100 ) ( CLEAR ?auto_9088 ) ( not ( = ?auto_9087 ?auto_9088 ) ) ( not ( = ?auto_9087 ?auto_9100 ) ) ( not ( = ?auto_9088 ?auto_9100 ) ) ( not ( = ?auto_9092 ?auto_9103 ) ) ( IS-CRATE ?auto_9087 ) ( SURFACE-AT ?auto_9087 ?auto_9099 ) ( ON ?auto_9087 ?auto_9102 ) ( CLEAR ?auto_9087 ) ( not ( = ?auto_9086 ?auto_9087 ) ) ( not ( = ?auto_9086 ?auto_9102 ) ) ( not ( = ?auto_9087 ?auto_9102 ) ) ( IS-CRATE ?auto_9086 ) ( AVAILABLE ?auto_9103 ) ( SURFACE-AT ?auto_9086 ?auto_9099 ) ( ON ?auto_9086 ?auto_9096 ) ( CLEAR ?auto_9086 ) ( not ( = ?auto_9085 ?auto_9086 ) ) ( not ( = ?auto_9085 ?auto_9096 ) ) ( not ( = ?auto_9086 ?auto_9096 ) ) ( SURFACE-AT ?auto_9084 ?auto_9093 ) ( CLEAR ?auto_9084 ) ( IS-CRATE ?auto_9085 ) ( AVAILABLE ?auto_9092 ) ( not ( = ?auto_9101 ?auto_9093 ) ) ( HOIST-AT ?auto_9098 ?auto_9101 ) ( AVAILABLE ?auto_9098 ) ( SURFACE-AT ?auto_9085 ?auto_9101 ) ( ON ?auto_9085 ?auto_9097 ) ( CLEAR ?auto_9085 ) ( TRUCK-AT ?auto_9095 ?auto_9093 ) ( not ( = ?auto_9084 ?auto_9085 ) ) ( not ( = ?auto_9084 ?auto_9097 ) ) ( not ( = ?auto_9085 ?auto_9097 ) ) ( not ( = ?auto_9092 ?auto_9098 ) ) ( not ( = ?auto_9084 ?auto_9086 ) ) ( not ( = ?auto_9084 ?auto_9096 ) ) ( not ( = ?auto_9086 ?auto_9097 ) ) ( not ( = ?auto_9099 ?auto_9101 ) ) ( not ( = ?auto_9103 ?auto_9098 ) ) ( not ( = ?auto_9096 ?auto_9097 ) ) ( not ( = ?auto_9084 ?auto_9087 ) ) ( not ( = ?auto_9084 ?auto_9102 ) ) ( not ( = ?auto_9085 ?auto_9087 ) ) ( not ( = ?auto_9085 ?auto_9102 ) ) ( not ( = ?auto_9087 ?auto_9096 ) ) ( not ( = ?auto_9087 ?auto_9097 ) ) ( not ( = ?auto_9102 ?auto_9096 ) ) ( not ( = ?auto_9102 ?auto_9097 ) ) ( not ( = ?auto_9084 ?auto_9088 ) ) ( not ( = ?auto_9084 ?auto_9100 ) ) ( not ( = ?auto_9085 ?auto_9088 ) ) ( not ( = ?auto_9085 ?auto_9100 ) ) ( not ( = ?auto_9086 ?auto_9088 ) ) ( not ( = ?auto_9086 ?auto_9100 ) ) ( not ( = ?auto_9088 ?auto_9102 ) ) ( not ( = ?auto_9088 ?auto_9096 ) ) ( not ( = ?auto_9088 ?auto_9097 ) ) ( not ( = ?auto_9100 ?auto_9102 ) ) ( not ( = ?auto_9100 ?auto_9096 ) ) ( not ( = ?auto_9100 ?auto_9097 ) ) ( not ( = ?auto_9084 ?auto_9089 ) ) ( not ( = ?auto_9084 ?auto_9094 ) ) ( not ( = ?auto_9085 ?auto_9089 ) ) ( not ( = ?auto_9085 ?auto_9094 ) ) ( not ( = ?auto_9086 ?auto_9089 ) ) ( not ( = ?auto_9086 ?auto_9094 ) ) ( not ( = ?auto_9087 ?auto_9089 ) ) ( not ( = ?auto_9087 ?auto_9094 ) ) ( not ( = ?auto_9089 ?auto_9100 ) ) ( not ( = ?auto_9089 ?auto_9102 ) ) ( not ( = ?auto_9089 ?auto_9096 ) ) ( not ( = ?auto_9089 ?auto_9097 ) ) ( not ( = ?auto_9091 ?auto_9099 ) ) ( not ( = ?auto_9091 ?auto_9101 ) ) ( not ( = ?auto_9090 ?auto_9103 ) ) ( not ( = ?auto_9090 ?auto_9098 ) ) ( not ( = ?auto_9094 ?auto_9100 ) ) ( not ( = ?auto_9094 ?auto_9102 ) ) ( not ( = ?auto_9094 ?auto_9096 ) ) ( not ( = ?auto_9094 ?auto_9097 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_9084 ?auto_9085 ?auto_9086 ?auto_9087 ?auto_9088 )
      ( MAKE-1CRATE ?auto_9088 ?auto_9089 )
      ( MAKE-5CRATE-VERIFY ?auto_9084 ?auto_9085 ?auto_9086 ?auto_9087 ?auto_9088 ?auto_9089 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9106 - SURFACE
      ?auto_9107 - SURFACE
    )
    :vars
    (
      ?auto_9108 - HOIST
      ?auto_9109 - PLACE
      ?auto_9111 - PLACE
      ?auto_9112 - HOIST
      ?auto_9113 - SURFACE
      ?auto_9110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9108 ?auto_9109 ) ( SURFACE-AT ?auto_9106 ?auto_9109 ) ( CLEAR ?auto_9106 ) ( IS-CRATE ?auto_9107 ) ( AVAILABLE ?auto_9108 ) ( not ( = ?auto_9111 ?auto_9109 ) ) ( HOIST-AT ?auto_9112 ?auto_9111 ) ( AVAILABLE ?auto_9112 ) ( SURFACE-AT ?auto_9107 ?auto_9111 ) ( ON ?auto_9107 ?auto_9113 ) ( CLEAR ?auto_9107 ) ( TRUCK-AT ?auto_9110 ?auto_9109 ) ( not ( = ?auto_9106 ?auto_9107 ) ) ( not ( = ?auto_9106 ?auto_9113 ) ) ( not ( = ?auto_9107 ?auto_9113 ) ) ( not ( = ?auto_9108 ?auto_9112 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9110 ?auto_9109 ?auto_9111 )
      ( !LIFT ?auto_9112 ?auto_9107 ?auto_9113 ?auto_9111 )
      ( !LOAD ?auto_9112 ?auto_9107 ?auto_9110 ?auto_9111 )
      ( !DRIVE ?auto_9110 ?auto_9111 ?auto_9109 )
      ( !UNLOAD ?auto_9108 ?auto_9107 ?auto_9110 ?auto_9109 )
      ( !DROP ?auto_9108 ?auto_9107 ?auto_9106 ?auto_9109 )
      ( MAKE-1CRATE-VERIFY ?auto_9106 ?auto_9107 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_9121 - SURFACE
      ?auto_9122 - SURFACE
      ?auto_9123 - SURFACE
      ?auto_9124 - SURFACE
      ?auto_9125 - SURFACE
      ?auto_9127 - SURFACE
      ?auto_9126 - SURFACE
    )
    :vars
    (
      ?auto_9133 - HOIST
      ?auto_9129 - PLACE
      ?auto_9128 - PLACE
      ?auto_9131 - HOIST
      ?auto_9132 - SURFACE
      ?auto_9143 - PLACE
      ?auto_9142 - HOIST
      ?auto_9138 - SURFACE
      ?auto_9139 - PLACE
      ?auto_9137 - HOIST
      ?auto_9140 - SURFACE
      ?auto_9134 - SURFACE
      ?auto_9141 - SURFACE
      ?auto_9135 - PLACE
      ?auto_9144 - HOIST
      ?auto_9136 - SURFACE
      ?auto_9130 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9133 ?auto_9129 ) ( IS-CRATE ?auto_9126 ) ( not ( = ?auto_9128 ?auto_9129 ) ) ( HOIST-AT ?auto_9131 ?auto_9128 ) ( AVAILABLE ?auto_9131 ) ( SURFACE-AT ?auto_9126 ?auto_9128 ) ( ON ?auto_9126 ?auto_9132 ) ( CLEAR ?auto_9126 ) ( not ( = ?auto_9127 ?auto_9126 ) ) ( not ( = ?auto_9127 ?auto_9132 ) ) ( not ( = ?auto_9126 ?auto_9132 ) ) ( not ( = ?auto_9133 ?auto_9131 ) ) ( IS-CRATE ?auto_9127 ) ( not ( = ?auto_9143 ?auto_9129 ) ) ( HOIST-AT ?auto_9142 ?auto_9143 ) ( AVAILABLE ?auto_9142 ) ( SURFACE-AT ?auto_9127 ?auto_9143 ) ( ON ?auto_9127 ?auto_9138 ) ( CLEAR ?auto_9127 ) ( not ( = ?auto_9125 ?auto_9127 ) ) ( not ( = ?auto_9125 ?auto_9138 ) ) ( not ( = ?auto_9127 ?auto_9138 ) ) ( not ( = ?auto_9133 ?auto_9142 ) ) ( IS-CRATE ?auto_9125 ) ( not ( = ?auto_9139 ?auto_9129 ) ) ( HOIST-AT ?auto_9137 ?auto_9139 ) ( SURFACE-AT ?auto_9125 ?auto_9139 ) ( ON ?auto_9125 ?auto_9140 ) ( CLEAR ?auto_9125 ) ( not ( = ?auto_9124 ?auto_9125 ) ) ( not ( = ?auto_9124 ?auto_9140 ) ) ( not ( = ?auto_9125 ?auto_9140 ) ) ( not ( = ?auto_9133 ?auto_9137 ) ) ( IS-CRATE ?auto_9124 ) ( SURFACE-AT ?auto_9124 ?auto_9139 ) ( ON ?auto_9124 ?auto_9134 ) ( CLEAR ?auto_9124 ) ( not ( = ?auto_9123 ?auto_9124 ) ) ( not ( = ?auto_9123 ?auto_9134 ) ) ( not ( = ?auto_9124 ?auto_9134 ) ) ( IS-CRATE ?auto_9123 ) ( AVAILABLE ?auto_9137 ) ( SURFACE-AT ?auto_9123 ?auto_9139 ) ( ON ?auto_9123 ?auto_9141 ) ( CLEAR ?auto_9123 ) ( not ( = ?auto_9122 ?auto_9123 ) ) ( not ( = ?auto_9122 ?auto_9141 ) ) ( not ( = ?auto_9123 ?auto_9141 ) ) ( SURFACE-AT ?auto_9121 ?auto_9129 ) ( CLEAR ?auto_9121 ) ( IS-CRATE ?auto_9122 ) ( AVAILABLE ?auto_9133 ) ( not ( = ?auto_9135 ?auto_9129 ) ) ( HOIST-AT ?auto_9144 ?auto_9135 ) ( AVAILABLE ?auto_9144 ) ( SURFACE-AT ?auto_9122 ?auto_9135 ) ( ON ?auto_9122 ?auto_9136 ) ( CLEAR ?auto_9122 ) ( TRUCK-AT ?auto_9130 ?auto_9129 ) ( not ( = ?auto_9121 ?auto_9122 ) ) ( not ( = ?auto_9121 ?auto_9136 ) ) ( not ( = ?auto_9122 ?auto_9136 ) ) ( not ( = ?auto_9133 ?auto_9144 ) ) ( not ( = ?auto_9121 ?auto_9123 ) ) ( not ( = ?auto_9121 ?auto_9141 ) ) ( not ( = ?auto_9123 ?auto_9136 ) ) ( not ( = ?auto_9139 ?auto_9135 ) ) ( not ( = ?auto_9137 ?auto_9144 ) ) ( not ( = ?auto_9141 ?auto_9136 ) ) ( not ( = ?auto_9121 ?auto_9124 ) ) ( not ( = ?auto_9121 ?auto_9134 ) ) ( not ( = ?auto_9122 ?auto_9124 ) ) ( not ( = ?auto_9122 ?auto_9134 ) ) ( not ( = ?auto_9124 ?auto_9141 ) ) ( not ( = ?auto_9124 ?auto_9136 ) ) ( not ( = ?auto_9134 ?auto_9141 ) ) ( not ( = ?auto_9134 ?auto_9136 ) ) ( not ( = ?auto_9121 ?auto_9125 ) ) ( not ( = ?auto_9121 ?auto_9140 ) ) ( not ( = ?auto_9122 ?auto_9125 ) ) ( not ( = ?auto_9122 ?auto_9140 ) ) ( not ( = ?auto_9123 ?auto_9125 ) ) ( not ( = ?auto_9123 ?auto_9140 ) ) ( not ( = ?auto_9125 ?auto_9134 ) ) ( not ( = ?auto_9125 ?auto_9141 ) ) ( not ( = ?auto_9125 ?auto_9136 ) ) ( not ( = ?auto_9140 ?auto_9134 ) ) ( not ( = ?auto_9140 ?auto_9141 ) ) ( not ( = ?auto_9140 ?auto_9136 ) ) ( not ( = ?auto_9121 ?auto_9127 ) ) ( not ( = ?auto_9121 ?auto_9138 ) ) ( not ( = ?auto_9122 ?auto_9127 ) ) ( not ( = ?auto_9122 ?auto_9138 ) ) ( not ( = ?auto_9123 ?auto_9127 ) ) ( not ( = ?auto_9123 ?auto_9138 ) ) ( not ( = ?auto_9124 ?auto_9127 ) ) ( not ( = ?auto_9124 ?auto_9138 ) ) ( not ( = ?auto_9127 ?auto_9140 ) ) ( not ( = ?auto_9127 ?auto_9134 ) ) ( not ( = ?auto_9127 ?auto_9141 ) ) ( not ( = ?auto_9127 ?auto_9136 ) ) ( not ( = ?auto_9143 ?auto_9139 ) ) ( not ( = ?auto_9143 ?auto_9135 ) ) ( not ( = ?auto_9142 ?auto_9137 ) ) ( not ( = ?auto_9142 ?auto_9144 ) ) ( not ( = ?auto_9138 ?auto_9140 ) ) ( not ( = ?auto_9138 ?auto_9134 ) ) ( not ( = ?auto_9138 ?auto_9141 ) ) ( not ( = ?auto_9138 ?auto_9136 ) ) ( not ( = ?auto_9121 ?auto_9126 ) ) ( not ( = ?auto_9121 ?auto_9132 ) ) ( not ( = ?auto_9122 ?auto_9126 ) ) ( not ( = ?auto_9122 ?auto_9132 ) ) ( not ( = ?auto_9123 ?auto_9126 ) ) ( not ( = ?auto_9123 ?auto_9132 ) ) ( not ( = ?auto_9124 ?auto_9126 ) ) ( not ( = ?auto_9124 ?auto_9132 ) ) ( not ( = ?auto_9125 ?auto_9126 ) ) ( not ( = ?auto_9125 ?auto_9132 ) ) ( not ( = ?auto_9126 ?auto_9138 ) ) ( not ( = ?auto_9126 ?auto_9140 ) ) ( not ( = ?auto_9126 ?auto_9134 ) ) ( not ( = ?auto_9126 ?auto_9141 ) ) ( not ( = ?auto_9126 ?auto_9136 ) ) ( not ( = ?auto_9128 ?auto_9143 ) ) ( not ( = ?auto_9128 ?auto_9139 ) ) ( not ( = ?auto_9128 ?auto_9135 ) ) ( not ( = ?auto_9131 ?auto_9142 ) ) ( not ( = ?auto_9131 ?auto_9137 ) ) ( not ( = ?auto_9131 ?auto_9144 ) ) ( not ( = ?auto_9132 ?auto_9138 ) ) ( not ( = ?auto_9132 ?auto_9140 ) ) ( not ( = ?auto_9132 ?auto_9134 ) ) ( not ( = ?auto_9132 ?auto_9141 ) ) ( not ( = ?auto_9132 ?auto_9136 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_9121 ?auto_9122 ?auto_9123 ?auto_9124 ?auto_9125 ?auto_9127 )
      ( MAKE-1CRATE ?auto_9127 ?auto_9126 )
      ( MAKE-6CRATE-VERIFY ?auto_9121 ?auto_9122 ?auto_9123 ?auto_9124 ?auto_9125 ?auto_9127 ?auto_9126 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9147 - SURFACE
      ?auto_9148 - SURFACE
    )
    :vars
    (
      ?auto_9149 - HOIST
      ?auto_9150 - PLACE
      ?auto_9152 - PLACE
      ?auto_9153 - HOIST
      ?auto_9154 - SURFACE
      ?auto_9151 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9149 ?auto_9150 ) ( SURFACE-AT ?auto_9147 ?auto_9150 ) ( CLEAR ?auto_9147 ) ( IS-CRATE ?auto_9148 ) ( AVAILABLE ?auto_9149 ) ( not ( = ?auto_9152 ?auto_9150 ) ) ( HOIST-AT ?auto_9153 ?auto_9152 ) ( AVAILABLE ?auto_9153 ) ( SURFACE-AT ?auto_9148 ?auto_9152 ) ( ON ?auto_9148 ?auto_9154 ) ( CLEAR ?auto_9148 ) ( TRUCK-AT ?auto_9151 ?auto_9150 ) ( not ( = ?auto_9147 ?auto_9148 ) ) ( not ( = ?auto_9147 ?auto_9154 ) ) ( not ( = ?auto_9148 ?auto_9154 ) ) ( not ( = ?auto_9149 ?auto_9153 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9151 ?auto_9150 ?auto_9152 )
      ( !LIFT ?auto_9153 ?auto_9148 ?auto_9154 ?auto_9152 )
      ( !LOAD ?auto_9153 ?auto_9148 ?auto_9151 ?auto_9152 )
      ( !DRIVE ?auto_9151 ?auto_9152 ?auto_9150 )
      ( !UNLOAD ?auto_9149 ?auto_9148 ?auto_9151 ?auto_9150 )
      ( !DROP ?auto_9149 ?auto_9148 ?auto_9147 ?auto_9150 )
      ( MAKE-1CRATE-VERIFY ?auto_9147 ?auto_9148 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_9163 - SURFACE
      ?auto_9164 - SURFACE
      ?auto_9165 - SURFACE
      ?auto_9166 - SURFACE
      ?auto_9167 - SURFACE
      ?auto_9169 - SURFACE
      ?auto_9168 - SURFACE
      ?auto_9170 - SURFACE
    )
    :vars
    (
      ?auto_9174 - HOIST
      ?auto_9176 - PLACE
      ?auto_9171 - PLACE
      ?auto_9172 - HOIST
      ?auto_9173 - SURFACE
      ?auto_9187 - PLACE
      ?auto_9189 - HOIST
      ?auto_9190 - SURFACE
      ?auto_9182 - PLACE
      ?auto_9179 - HOIST
      ?auto_9186 - SURFACE
      ?auto_9185 - PLACE
      ?auto_9178 - HOIST
      ?auto_9184 - SURFACE
      ?auto_9177 - SURFACE
      ?auto_9183 - SURFACE
      ?auto_9188 - PLACE
      ?auto_9181 - HOIST
      ?auto_9180 - SURFACE
      ?auto_9175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9174 ?auto_9176 ) ( IS-CRATE ?auto_9170 ) ( not ( = ?auto_9171 ?auto_9176 ) ) ( HOIST-AT ?auto_9172 ?auto_9171 ) ( AVAILABLE ?auto_9172 ) ( SURFACE-AT ?auto_9170 ?auto_9171 ) ( ON ?auto_9170 ?auto_9173 ) ( CLEAR ?auto_9170 ) ( not ( = ?auto_9168 ?auto_9170 ) ) ( not ( = ?auto_9168 ?auto_9173 ) ) ( not ( = ?auto_9170 ?auto_9173 ) ) ( not ( = ?auto_9174 ?auto_9172 ) ) ( IS-CRATE ?auto_9168 ) ( not ( = ?auto_9187 ?auto_9176 ) ) ( HOIST-AT ?auto_9189 ?auto_9187 ) ( AVAILABLE ?auto_9189 ) ( SURFACE-AT ?auto_9168 ?auto_9187 ) ( ON ?auto_9168 ?auto_9190 ) ( CLEAR ?auto_9168 ) ( not ( = ?auto_9169 ?auto_9168 ) ) ( not ( = ?auto_9169 ?auto_9190 ) ) ( not ( = ?auto_9168 ?auto_9190 ) ) ( not ( = ?auto_9174 ?auto_9189 ) ) ( IS-CRATE ?auto_9169 ) ( not ( = ?auto_9182 ?auto_9176 ) ) ( HOIST-AT ?auto_9179 ?auto_9182 ) ( AVAILABLE ?auto_9179 ) ( SURFACE-AT ?auto_9169 ?auto_9182 ) ( ON ?auto_9169 ?auto_9186 ) ( CLEAR ?auto_9169 ) ( not ( = ?auto_9167 ?auto_9169 ) ) ( not ( = ?auto_9167 ?auto_9186 ) ) ( not ( = ?auto_9169 ?auto_9186 ) ) ( not ( = ?auto_9174 ?auto_9179 ) ) ( IS-CRATE ?auto_9167 ) ( not ( = ?auto_9185 ?auto_9176 ) ) ( HOIST-AT ?auto_9178 ?auto_9185 ) ( SURFACE-AT ?auto_9167 ?auto_9185 ) ( ON ?auto_9167 ?auto_9184 ) ( CLEAR ?auto_9167 ) ( not ( = ?auto_9166 ?auto_9167 ) ) ( not ( = ?auto_9166 ?auto_9184 ) ) ( not ( = ?auto_9167 ?auto_9184 ) ) ( not ( = ?auto_9174 ?auto_9178 ) ) ( IS-CRATE ?auto_9166 ) ( SURFACE-AT ?auto_9166 ?auto_9185 ) ( ON ?auto_9166 ?auto_9177 ) ( CLEAR ?auto_9166 ) ( not ( = ?auto_9165 ?auto_9166 ) ) ( not ( = ?auto_9165 ?auto_9177 ) ) ( not ( = ?auto_9166 ?auto_9177 ) ) ( IS-CRATE ?auto_9165 ) ( AVAILABLE ?auto_9178 ) ( SURFACE-AT ?auto_9165 ?auto_9185 ) ( ON ?auto_9165 ?auto_9183 ) ( CLEAR ?auto_9165 ) ( not ( = ?auto_9164 ?auto_9165 ) ) ( not ( = ?auto_9164 ?auto_9183 ) ) ( not ( = ?auto_9165 ?auto_9183 ) ) ( SURFACE-AT ?auto_9163 ?auto_9176 ) ( CLEAR ?auto_9163 ) ( IS-CRATE ?auto_9164 ) ( AVAILABLE ?auto_9174 ) ( not ( = ?auto_9188 ?auto_9176 ) ) ( HOIST-AT ?auto_9181 ?auto_9188 ) ( AVAILABLE ?auto_9181 ) ( SURFACE-AT ?auto_9164 ?auto_9188 ) ( ON ?auto_9164 ?auto_9180 ) ( CLEAR ?auto_9164 ) ( TRUCK-AT ?auto_9175 ?auto_9176 ) ( not ( = ?auto_9163 ?auto_9164 ) ) ( not ( = ?auto_9163 ?auto_9180 ) ) ( not ( = ?auto_9164 ?auto_9180 ) ) ( not ( = ?auto_9174 ?auto_9181 ) ) ( not ( = ?auto_9163 ?auto_9165 ) ) ( not ( = ?auto_9163 ?auto_9183 ) ) ( not ( = ?auto_9165 ?auto_9180 ) ) ( not ( = ?auto_9185 ?auto_9188 ) ) ( not ( = ?auto_9178 ?auto_9181 ) ) ( not ( = ?auto_9183 ?auto_9180 ) ) ( not ( = ?auto_9163 ?auto_9166 ) ) ( not ( = ?auto_9163 ?auto_9177 ) ) ( not ( = ?auto_9164 ?auto_9166 ) ) ( not ( = ?auto_9164 ?auto_9177 ) ) ( not ( = ?auto_9166 ?auto_9183 ) ) ( not ( = ?auto_9166 ?auto_9180 ) ) ( not ( = ?auto_9177 ?auto_9183 ) ) ( not ( = ?auto_9177 ?auto_9180 ) ) ( not ( = ?auto_9163 ?auto_9167 ) ) ( not ( = ?auto_9163 ?auto_9184 ) ) ( not ( = ?auto_9164 ?auto_9167 ) ) ( not ( = ?auto_9164 ?auto_9184 ) ) ( not ( = ?auto_9165 ?auto_9167 ) ) ( not ( = ?auto_9165 ?auto_9184 ) ) ( not ( = ?auto_9167 ?auto_9177 ) ) ( not ( = ?auto_9167 ?auto_9183 ) ) ( not ( = ?auto_9167 ?auto_9180 ) ) ( not ( = ?auto_9184 ?auto_9177 ) ) ( not ( = ?auto_9184 ?auto_9183 ) ) ( not ( = ?auto_9184 ?auto_9180 ) ) ( not ( = ?auto_9163 ?auto_9169 ) ) ( not ( = ?auto_9163 ?auto_9186 ) ) ( not ( = ?auto_9164 ?auto_9169 ) ) ( not ( = ?auto_9164 ?auto_9186 ) ) ( not ( = ?auto_9165 ?auto_9169 ) ) ( not ( = ?auto_9165 ?auto_9186 ) ) ( not ( = ?auto_9166 ?auto_9169 ) ) ( not ( = ?auto_9166 ?auto_9186 ) ) ( not ( = ?auto_9169 ?auto_9184 ) ) ( not ( = ?auto_9169 ?auto_9177 ) ) ( not ( = ?auto_9169 ?auto_9183 ) ) ( not ( = ?auto_9169 ?auto_9180 ) ) ( not ( = ?auto_9182 ?auto_9185 ) ) ( not ( = ?auto_9182 ?auto_9188 ) ) ( not ( = ?auto_9179 ?auto_9178 ) ) ( not ( = ?auto_9179 ?auto_9181 ) ) ( not ( = ?auto_9186 ?auto_9184 ) ) ( not ( = ?auto_9186 ?auto_9177 ) ) ( not ( = ?auto_9186 ?auto_9183 ) ) ( not ( = ?auto_9186 ?auto_9180 ) ) ( not ( = ?auto_9163 ?auto_9168 ) ) ( not ( = ?auto_9163 ?auto_9190 ) ) ( not ( = ?auto_9164 ?auto_9168 ) ) ( not ( = ?auto_9164 ?auto_9190 ) ) ( not ( = ?auto_9165 ?auto_9168 ) ) ( not ( = ?auto_9165 ?auto_9190 ) ) ( not ( = ?auto_9166 ?auto_9168 ) ) ( not ( = ?auto_9166 ?auto_9190 ) ) ( not ( = ?auto_9167 ?auto_9168 ) ) ( not ( = ?auto_9167 ?auto_9190 ) ) ( not ( = ?auto_9168 ?auto_9186 ) ) ( not ( = ?auto_9168 ?auto_9184 ) ) ( not ( = ?auto_9168 ?auto_9177 ) ) ( not ( = ?auto_9168 ?auto_9183 ) ) ( not ( = ?auto_9168 ?auto_9180 ) ) ( not ( = ?auto_9187 ?auto_9182 ) ) ( not ( = ?auto_9187 ?auto_9185 ) ) ( not ( = ?auto_9187 ?auto_9188 ) ) ( not ( = ?auto_9189 ?auto_9179 ) ) ( not ( = ?auto_9189 ?auto_9178 ) ) ( not ( = ?auto_9189 ?auto_9181 ) ) ( not ( = ?auto_9190 ?auto_9186 ) ) ( not ( = ?auto_9190 ?auto_9184 ) ) ( not ( = ?auto_9190 ?auto_9177 ) ) ( not ( = ?auto_9190 ?auto_9183 ) ) ( not ( = ?auto_9190 ?auto_9180 ) ) ( not ( = ?auto_9163 ?auto_9170 ) ) ( not ( = ?auto_9163 ?auto_9173 ) ) ( not ( = ?auto_9164 ?auto_9170 ) ) ( not ( = ?auto_9164 ?auto_9173 ) ) ( not ( = ?auto_9165 ?auto_9170 ) ) ( not ( = ?auto_9165 ?auto_9173 ) ) ( not ( = ?auto_9166 ?auto_9170 ) ) ( not ( = ?auto_9166 ?auto_9173 ) ) ( not ( = ?auto_9167 ?auto_9170 ) ) ( not ( = ?auto_9167 ?auto_9173 ) ) ( not ( = ?auto_9169 ?auto_9170 ) ) ( not ( = ?auto_9169 ?auto_9173 ) ) ( not ( = ?auto_9170 ?auto_9190 ) ) ( not ( = ?auto_9170 ?auto_9186 ) ) ( not ( = ?auto_9170 ?auto_9184 ) ) ( not ( = ?auto_9170 ?auto_9177 ) ) ( not ( = ?auto_9170 ?auto_9183 ) ) ( not ( = ?auto_9170 ?auto_9180 ) ) ( not ( = ?auto_9171 ?auto_9187 ) ) ( not ( = ?auto_9171 ?auto_9182 ) ) ( not ( = ?auto_9171 ?auto_9185 ) ) ( not ( = ?auto_9171 ?auto_9188 ) ) ( not ( = ?auto_9172 ?auto_9189 ) ) ( not ( = ?auto_9172 ?auto_9179 ) ) ( not ( = ?auto_9172 ?auto_9178 ) ) ( not ( = ?auto_9172 ?auto_9181 ) ) ( not ( = ?auto_9173 ?auto_9190 ) ) ( not ( = ?auto_9173 ?auto_9186 ) ) ( not ( = ?auto_9173 ?auto_9184 ) ) ( not ( = ?auto_9173 ?auto_9177 ) ) ( not ( = ?auto_9173 ?auto_9183 ) ) ( not ( = ?auto_9173 ?auto_9180 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_9163 ?auto_9164 ?auto_9165 ?auto_9166 ?auto_9167 ?auto_9169 ?auto_9168 )
      ( MAKE-1CRATE ?auto_9168 ?auto_9170 )
      ( MAKE-7CRATE-VERIFY ?auto_9163 ?auto_9164 ?auto_9165 ?auto_9166 ?auto_9167 ?auto_9169 ?auto_9168 ?auto_9170 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9193 - SURFACE
      ?auto_9194 - SURFACE
    )
    :vars
    (
      ?auto_9195 - HOIST
      ?auto_9196 - PLACE
      ?auto_9198 - PLACE
      ?auto_9199 - HOIST
      ?auto_9200 - SURFACE
      ?auto_9197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9195 ?auto_9196 ) ( SURFACE-AT ?auto_9193 ?auto_9196 ) ( CLEAR ?auto_9193 ) ( IS-CRATE ?auto_9194 ) ( AVAILABLE ?auto_9195 ) ( not ( = ?auto_9198 ?auto_9196 ) ) ( HOIST-AT ?auto_9199 ?auto_9198 ) ( AVAILABLE ?auto_9199 ) ( SURFACE-AT ?auto_9194 ?auto_9198 ) ( ON ?auto_9194 ?auto_9200 ) ( CLEAR ?auto_9194 ) ( TRUCK-AT ?auto_9197 ?auto_9196 ) ( not ( = ?auto_9193 ?auto_9194 ) ) ( not ( = ?auto_9193 ?auto_9200 ) ) ( not ( = ?auto_9194 ?auto_9200 ) ) ( not ( = ?auto_9195 ?auto_9199 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9197 ?auto_9196 ?auto_9198 )
      ( !LIFT ?auto_9199 ?auto_9194 ?auto_9200 ?auto_9198 )
      ( !LOAD ?auto_9199 ?auto_9194 ?auto_9197 ?auto_9198 )
      ( !DRIVE ?auto_9197 ?auto_9198 ?auto_9196 )
      ( !UNLOAD ?auto_9195 ?auto_9194 ?auto_9197 ?auto_9196 )
      ( !DROP ?auto_9195 ?auto_9194 ?auto_9193 ?auto_9196 )
      ( MAKE-1CRATE-VERIFY ?auto_9193 ?auto_9194 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_9210 - SURFACE
      ?auto_9211 - SURFACE
      ?auto_9212 - SURFACE
      ?auto_9213 - SURFACE
      ?auto_9214 - SURFACE
      ?auto_9216 - SURFACE
      ?auto_9215 - SURFACE
      ?auto_9218 - SURFACE
      ?auto_9217 - SURFACE
    )
    :vars
    (
      ?auto_9222 - HOIST
      ?auto_9223 - PLACE
      ?auto_9221 - PLACE
      ?auto_9220 - HOIST
      ?auto_9224 - SURFACE
      ?auto_9232 - PLACE
      ?auto_9225 - HOIST
      ?auto_9231 - SURFACE
      ?auto_9233 - PLACE
      ?auto_9236 - HOIST
      ?auto_9237 - SURFACE
      ?auto_9240 - PLACE
      ?auto_9228 - HOIST
      ?auto_9234 - SURFACE
      ?auto_9230 - PLACE
      ?auto_9227 - HOIST
      ?auto_9238 - SURFACE
      ?auto_9229 - SURFACE
      ?auto_9239 - SURFACE
      ?auto_9235 - PLACE
      ?auto_9241 - HOIST
      ?auto_9226 - SURFACE
      ?auto_9219 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9222 ?auto_9223 ) ( IS-CRATE ?auto_9217 ) ( not ( = ?auto_9221 ?auto_9223 ) ) ( HOIST-AT ?auto_9220 ?auto_9221 ) ( AVAILABLE ?auto_9220 ) ( SURFACE-AT ?auto_9217 ?auto_9221 ) ( ON ?auto_9217 ?auto_9224 ) ( CLEAR ?auto_9217 ) ( not ( = ?auto_9218 ?auto_9217 ) ) ( not ( = ?auto_9218 ?auto_9224 ) ) ( not ( = ?auto_9217 ?auto_9224 ) ) ( not ( = ?auto_9222 ?auto_9220 ) ) ( IS-CRATE ?auto_9218 ) ( not ( = ?auto_9232 ?auto_9223 ) ) ( HOIST-AT ?auto_9225 ?auto_9232 ) ( AVAILABLE ?auto_9225 ) ( SURFACE-AT ?auto_9218 ?auto_9232 ) ( ON ?auto_9218 ?auto_9231 ) ( CLEAR ?auto_9218 ) ( not ( = ?auto_9215 ?auto_9218 ) ) ( not ( = ?auto_9215 ?auto_9231 ) ) ( not ( = ?auto_9218 ?auto_9231 ) ) ( not ( = ?auto_9222 ?auto_9225 ) ) ( IS-CRATE ?auto_9215 ) ( not ( = ?auto_9233 ?auto_9223 ) ) ( HOIST-AT ?auto_9236 ?auto_9233 ) ( AVAILABLE ?auto_9236 ) ( SURFACE-AT ?auto_9215 ?auto_9233 ) ( ON ?auto_9215 ?auto_9237 ) ( CLEAR ?auto_9215 ) ( not ( = ?auto_9216 ?auto_9215 ) ) ( not ( = ?auto_9216 ?auto_9237 ) ) ( not ( = ?auto_9215 ?auto_9237 ) ) ( not ( = ?auto_9222 ?auto_9236 ) ) ( IS-CRATE ?auto_9216 ) ( not ( = ?auto_9240 ?auto_9223 ) ) ( HOIST-AT ?auto_9228 ?auto_9240 ) ( AVAILABLE ?auto_9228 ) ( SURFACE-AT ?auto_9216 ?auto_9240 ) ( ON ?auto_9216 ?auto_9234 ) ( CLEAR ?auto_9216 ) ( not ( = ?auto_9214 ?auto_9216 ) ) ( not ( = ?auto_9214 ?auto_9234 ) ) ( not ( = ?auto_9216 ?auto_9234 ) ) ( not ( = ?auto_9222 ?auto_9228 ) ) ( IS-CRATE ?auto_9214 ) ( not ( = ?auto_9230 ?auto_9223 ) ) ( HOIST-AT ?auto_9227 ?auto_9230 ) ( SURFACE-AT ?auto_9214 ?auto_9230 ) ( ON ?auto_9214 ?auto_9238 ) ( CLEAR ?auto_9214 ) ( not ( = ?auto_9213 ?auto_9214 ) ) ( not ( = ?auto_9213 ?auto_9238 ) ) ( not ( = ?auto_9214 ?auto_9238 ) ) ( not ( = ?auto_9222 ?auto_9227 ) ) ( IS-CRATE ?auto_9213 ) ( SURFACE-AT ?auto_9213 ?auto_9230 ) ( ON ?auto_9213 ?auto_9229 ) ( CLEAR ?auto_9213 ) ( not ( = ?auto_9212 ?auto_9213 ) ) ( not ( = ?auto_9212 ?auto_9229 ) ) ( not ( = ?auto_9213 ?auto_9229 ) ) ( IS-CRATE ?auto_9212 ) ( AVAILABLE ?auto_9227 ) ( SURFACE-AT ?auto_9212 ?auto_9230 ) ( ON ?auto_9212 ?auto_9239 ) ( CLEAR ?auto_9212 ) ( not ( = ?auto_9211 ?auto_9212 ) ) ( not ( = ?auto_9211 ?auto_9239 ) ) ( not ( = ?auto_9212 ?auto_9239 ) ) ( SURFACE-AT ?auto_9210 ?auto_9223 ) ( CLEAR ?auto_9210 ) ( IS-CRATE ?auto_9211 ) ( AVAILABLE ?auto_9222 ) ( not ( = ?auto_9235 ?auto_9223 ) ) ( HOIST-AT ?auto_9241 ?auto_9235 ) ( AVAILABLE ?auto_9241 ) ( SURFACE-AT ?auto_9211 ?auto_9235 ) ( ON ?auto_9211 ?auto_9226 ) ( CLEAR ?auto_9211 ) ( TRUCK-AT ?auto_9219 ?auto_9223 ) ( not ( = ?auto_9210 ?auto_9211 ) ) ( not ( = ?auto_9210 ?auto_9226 ) ) ( not ( = ?auto_9211 ?auto_9226 ) ) ( not ( = ?auto_9222 ?auto_9241 ) ) ( not ( = ?auto_9210 ?auto_9212 ) ) ( not ( = ?auto_9210 ?auto_9239 ) ) ( not ( = ?auto_9212 ?auto_9226 ) ) ( not ( = ?auto_9230 ?auto_9235 ) ) ( not ( = ?auto_9227 ?auto_9241 ) ) ( not ( = ?auto_9239 ?auto_9226 ) ) ( not ( = ?auto_9210 ?auto_9213 ) ) ( not ( = ?auto_9210 ?auto_9229 ) ) ( not ( = ?auto_9211 ?auto_9213 ) ) ( not ( = ?auto_9211 ?auto_9229 ) ) ( not ( = ?auto_9213 ?auto_9239 ) ) ( not ( = ?auto_9213 ?auto_9226 ) ) ( not ( = ?auto_9229 ?auto_9239 ) ) ( not ( = ?auto_9229 ?auto_9226 ) ) ( not ( = ?auto_9210 ?auto_9214 ) ) ( not ( = ?auto_9210 ?auto_9238 ) ) ( not ( = ?auto_9211 ?auto_9214 ) ) ( not ( = ?auto_9211 ?auto_9238 ) ) ( not ( = ?auto_9212 ?auto_9214 ) ) ( not ( = ?auto_9212 ?auto_9238 ) ) ( not ( = ?auto_9214 ?auto_9229 ) ) ( not ( = ?auto_9214 ?auto_9239 ) ) ( not ( = ?auto_9214 ?auto_9226 ) ) ( not ( = ?auto_9238 ?auto_9229 ) ) ( not ( = ?auto_9238 ?auto_9239 ) ) ( not ( = ?auto_9238 ?auto_9226 ) ) ( not ( = ?auto_9210 ?auto_9216 ) ) ( not ( = ?auto_9210 ?auto_9234 ) ) ( not ( = ?auto_9211 ?auto_9216 ) ) ( not ( = ?auto_9211 ?auto_9234 ) ) ( not ( = ?auto_9212 ?auto_9216 ) ) ( not ( = ?auto_9212 ?auto_9234 ) ) ( not ( = ?auto_9213 ?auto_9216 ) ) ( not ( = ?auto_9213 ?auto_9234 ) ) ( not ( = ?auto_9216 ?auto_9238 ) ) ( not ( = ?auto_9216 ?auto_9229 ) ) ( not ( = ?auto_9216 ?auto_9239 ) ) ( not ( = ?auto_9216 ?auto_9226 ) ) ( not ( = ?auto_9240 ?auto_9230 ) ) ( not ( = ?auto_9240 ?auto_9235 ) ) ( not ( = ?auto_9228 ?auto_9227 ) ) ( not ( = ?auto_9228 ?auto_9241 ) ) ( not ( = ?auto_9234 ?auto_9238 ) ) ( not ( = ?auto_9234 ?auto_9229 ) ) ( not ( = ?auto_9234 ?auto_9239 ) ) ( not ( = ?auto_9234 ?auto_9226 ) ) ( not ( = ?auto_9210 ?auto_9215 ) ) ( not ( = ?auto_9210 ?auto_9237 ) ) ( not ( = ?auto_9211 ?auto_9215 ) ) ( not ( = ?auto_9211 ?auto_9237 ) ) ( not ( = ?auto_9212 ?auto_9215 ) ) ( not ( = ?auto_9212 ?auto_9237 ) ) ( not ( = ?auto_9213 ?auto_9215 ) ) ( not ( = ?auto_9213 ?auto_9237 ) ) ( not ( = ?auto_9214 ?auto_9215 ) ) ( not ( = ?auto_9214 ?auto_9237 ) ) ( not ( = ?auto_9215 ?auto_9234 ) ) ( not ( = ?auto_9215 ?auto_9238 ) ) ( not ( = ?auto_9215 ?auto_9229 ) ) ( not ( = ?auto_9215 ?auto_9239 ) ) ( not ( = ?auto_9215 ?auto_9226 ) ) ( not ( = ?auto_9233 ?auto_9240 ) ) ( not ( = ?auto_9233 ?auto_9230 ) ) ( not ( = ?auto_9233 ?auto_9235 ) ) ( not ( = ?auto_9236 ?auto_9228 ) ) ( not ( = ?auto_9236 ?auto_9227 ) ) ( not ( = ?auto_9236 ?auto_9241 ) ) ( not ( = ?auto_9237 ?auto_9234 ) ) ( not ( = ?auto_9237 ?auto_9238 ) ) ( not ( = ?auto_9237 ?auto_9229 ) ) ( not ( = ?auto_9237 ?auto_9239 ) ) ( not ( = ?auto_9237 ?auto_9226 ) ) ( not ( = ?auto_9210 ?auto_9218 ) ) ( not ( = ?auto_9210 ?auto_9231 ) ) ( not ( = ?auto_9211 ?auto_9218 ) ) ( not ( = ?auto_9211 ?auto_9231 ) ) ( not ( = ?auto_9212 ?auto_9218 ) ) ( not ( = ?auto_9212 ?auto_9231 ) ) ( not ( = ?auto_9213 ?auto_9218 ) ) ( not ( = ?auto_9213 ?auto_9231 ) ) ( not ( = ?auto_9214 ?auto_9218 ) ) ( not ( = ?auto_9214 ?auto_9231 ) ) ( not ( = ?auto_9216 ?auto_9218 ) ) ( not ( = ?auto_9216 ?auto_9231 ) ) ( not ( = ?auto_9218 ?auto_9237 ) ) ( not ( = ?auto_9218 ?auto_9234 ) ) ( not ( = ?auto_9218 ?auto_9238 ) ) ( not ( = ?auto_9218 ?auto_9229 ) ) ( not ( = ?auto_9218 ?auto_9239 ) ) ( not ( = ?auto_9218 ?auto_9226 ) ) ( not ( = ?auto_9232 ?auto_9233 ) ) ( not ( = ?auto_9232 ?auto_9240 ) ) ( not ( = ?auto_9232 ?auto_9230 ) ) ( not ( = ?auto_9232 ?auto_9235 ) ) ( not ( = ?auto_9225 ?auto_9236 ) ) ( not ( = ?auto_9225 ?auto_9228 ) ) ( not ( = ?auto_9225 ?auto_9227 ) ) ( not ( = ?auto_9225 ?auto_9241 ) ) ( not ( = ?auto_9231 ?auto_9237 ) ) ( not ( = ?auto_9231 ?auto_9234 ) ) ( not ( = ?auto_9231 ?auto_9238 ) ) ( not ( = ?auto_9231 ?auto_9229 ) ) ( not ( = ?auto_9231 ?auto_9239 ) ) ( not ( = ?auto_9231 ?auto_9226 ) ) ( not ( = ?auto_9210 ?auto_9217 ) ) ( not ( = ?auto_9210 ?auto_9224 ) ) ( not ( = ?auto_9211 ?auto_9217 ) ) ( not ( = ?auto_9211 ?auto_9224 ) ) ( not ( = ?auto_9212 ?auto_9217 ) ) ( not ( = ?auto_9212 ?auto_9224 ) ) ( not ( = ?auto_9213 ?auto_9217 ) ) ( not ( = ?auto_9213 ?auto_9224 ) ) ( not ( = ?auto_9214 ?auto_9217 ) ) ( not ( = ?auto_9214 ?auto_9224 ) ) ( not ( = ?auto_9216 ?auto_9217 ) ) ( not ( = ?auto_9216 ?auto_9224 ) ) ( not ( = ?auto_9215 ?auto_9217 ) ) ( not ( = ?auto_9215 ?auto_9224 ) ) ( not ( = ?auto_9217 ?auto_9231 ) ) ( not ( = ?auto_9217 ?auto_9237 ) ) ( not ( = ?auto_9217 ?auto_9234 ) ) ( not ( = ?auto_9217 ?auto_9238 ) ) ( not ( = ?auto_9217 ?auto_9229 ) ) ( not ( = ?auto_9217 ?auto_9239 ) ) ( not ( = ?auto_9217 ?auto_9226 ) ) ( not ( = ?auto_9221 ?auto_9232 ) ) ( not ( = ?auto_9221 ?auto_9233 ) ) ( not ( = ?auto_9221 ?auto_9240 ) ) ( not ( = ?auto_9221 ?auto_9230 ) ) ( not ( = ?auto_9221 ?auto_9235 ) ) ( not ( = ?auto_9220 ?auto_9225 ) ) ( not ( = ?auto_9220 ?auto_9236 ) ) ( not ( = ?auto_9220 ?auto_9228 ) ) ( not ( = ?auto_9220 ?auto_9227 ) ) ( not ( = ?auto_9220 ?auto_9241 ) ) ( not ( = ?auto_9224 ?auto_9231 ) ) ( not ( = ?auto_9224 ?auto_9237 ) ) ( not ( = ?auto_9224 ?auto_9234 ) ) ( not ( = ?auto_9224 ?auto_9238 ) ) ( not ( = ?auto_9224 ?auto_9229 ) ) ( not ( = ?auto_9224 ?auto_9239 ) ) ( not ( = ?auto_9224 ?auto_9226 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_9210 ?auto_9211 ?auto_9212 ?auto_9213 ?auto_9214 ?auto_9216 ?auto_9215 ?auto_9218 )
      ( MAKE-1CRATE ?auto_9218 ?auto_9217 )
      ( MAKE-8CRATE-VERIFY ?auto_9210 ?auto_9211 ?auto_9212 ?auto_9213 ?auto_9214 ?auto_9216 ?auto_9215 ?auto_9218 ?auto_9217 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9244 - SURFACE
      ?auto_9245 - SURFACE
    )
    :vars
    (
      ?auto_9246 - HOIST
      ?auto_9247 - PLACE
      ?auto_9249 - PLACE
      ?auto_9250 - HOIST
      ?auto_9251 - SURFACE
      ?auto_9248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9246 ?auto_9247 ) ( SURFACE-AT ?auto_9244 ?auto_9247 ) ( CLEAR ?auto_9244 ) ( IS-CRATE ?auto_9245 ) ( AVAILABLE ?auto_9246 ) ( not ( = ?auto_9249 ?auto_9247 ) ) ( HOIST-AT ?auto_9250 ?auto_9249 ) ( AVAILABLE ?auto_9250 ) ( SURFACE-AT ?auto_9245 ?auto_9249 ) ( ON ?auto_9245 ?auto_9251 ) ( CLEAR ?auto_9245 ) ( TRUCK-AT ?auto_9248 ?auto_9247 ) ( not ( = ?auto_9244 ?auto_9245 ) ) ( not ( = ?auto_9244 ?auto_9251 ) ) ( not ( = ?auto_9245 ?auto_9251 ) ) ( not ( = ?auto_9246 ?auto_9250 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9248 ?auto_9247 ?auto_9249 )
      ( !LIFT ?auto_9250 ?auto_9245 ?auto_9251 ?auto_9249 )
      ( !LOAD ?auto_9250 ?auto_9245 ?auto_9248 ?auto_9249 )
      ( !DRIVE ?auto_9248 ?auto_9249 ?auto_9247 )
      ( !UNLOAD ?auto_9246 ?auto_9245 ?auto_9248 ?auto_9247 )
      ( !DROP ?auto_9246 ?auto_9245 ?auto_9244 ?auto_9247 )
      ( MAKE-1CRATE-VERIFY ?auto_9244 ?auto_9245 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_9262 - SURFACE
      ?auto_9263 - SURFACE
      ?auto_9264 - SURFACE
      ?auto_9265 - SURFACE
      ?auto_9266 - SURFACE
      ?auto_9269 - SURFACE
      ?auto_9267 - SURFACE
      ?auto_9271 - SURFACE
      ?auto_9270 - SURFACE
      ?auto_9268 - SURFACE
    )
    :vars
    (
      ?auto_9272 - HOIST
      ?auto_9275 - PLACE
      ?auto_9277 - PLACE
      ?auto_9274 - HOIST
      ?auto_9276 - SURFACE
      ?auto_9280 - PLACE
      ?auto_9281 - HOIST
      ?auto_9295 - SURFACE
      ?auto_9291 - PLACE
      ?auto_9282 - HOIST
      ?auto_9292 - SURFACE
      ?auto_9285 - PLACE
      ?auto_9288 - HOIST
      ?auto_9289 - SURFACE
      ?auto_9284 - PLACE
      ?auto_9294 - HOIST
      ?auto_9287 - SURFACE
      ?auto_9290 - SURFACE
      ?auto_9293 - SURFACE
      ?auto_9278 - SURFACE
      ?auto_9286 - PLACE
      ?auto_9283 - HOIST
      ?auto_9279 - SURFACE
      ?auto_9273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9272 ?auto_9275 ) ( IS-CRATE ?auto_9268 ) ( not ( = ?auto_9277 ?auto_9275 ) ) ( HOIST-AT ?auto_9274 ?auto_9277 ) ( SURFACE-AT ?auto_9268 ?auto_9277 ) ( ON ?auto_9268 ?auto_9276 ) ( CLEAR ?auto_9268 ) ( not ( = ?auto_9270 ?auto_9268 ) ) ( not ( = ?auto_9270 ?auto_9276 ) ) ( not ( = ?auto_9268 ?auto_9276 ) ) ( not ( = ?auto_9272 ?auto_9274 ) ) ( IS-CRATE ?auto_9270 ) ( not ( = ?auto_9280 ?auto_9275 ) ) ( HOIST-AT ?auto_9281 ?auto_9280 ) ( AVAILABLE ?auto_9281 ) ( SURFACE-AT ?auto_9270 ?auto_9280 ) ( ON ?auto_9270 ?auto_9295 ) ( CLEAR ?auto_9270 ) ( not ( = ?auto_9271 ?auto_9270 ) ) ( not ( = ?auto_9271 ?auto_9295 ) ) ( not ( = ?auto_9270 ?auto_9295 ) ) ( not ( = ?auto_9272 ?auto_9281 ) ) ( IS-CRATE ?auto_9271 ) ( not ( = ?auto_9291 ?auto_9275 ) ) ( HOIST-AT ?auto_9282 ?auto_9291 ) ( AVAILABLE ?auto_9282 ) ( SURFACE-AT ?auto_9271 ?auto_9291 ) ( ON ?auto_9271 ?auto_9292 ) ( CLEAR ?auto_9271 ) ( not ( = ?auto_9267 ?auto_9271 ) ) ( not ( = ?auto_9267 ?auto_9292 ) ) ( not ( = ?auto_9271 ?auto_9292 ) ) ( not ( = ?auto_9272 ?auto_9282 ) ) ( IS-CRATE ?auto_9267 ) ( not ( = ?auto_9285 ?auto_9275 ) ) ( HOIST-AT ?auto_9288 ?auto_9285 ) ( AVAILABLE ?auto_9288 ) ( SURFACE-AT ?auto_9267 ?auto_9285 ) ( ON ?auto_9267 ?auto_9289 ) ( CLEAR ?auto_9267 ) ( not ( = ?auto_9269 ?auto_9267 ) ) ( not ( = ?auto_9269 ?auto_9289 ) ) ( not ( = ?auto_9267 ?auto_9289 ) ) ( not ( = ?auto_9272 ?auto_9288 ) ) ( IS-CRATE ?auto_9269 ) ( not ( = ?auto_9284 ?auto_9275 ) ) ( HOIST-AT ?auto_9294 ?auto_9284 ) ( AVAILABLE ?auto_9294 ) ( SURFACE-AT ?auto_9269 ?auto_9284 ) ( ON ?auto_9269 ?auto_9287 ) ( CLEAR ?auto_9269 ) ( not ( = ?auto_9266 ?auto_9269 ) ) ( not ( = ?auto_9266 ?auto_9287 ) ) ( not ( = ?auto_9269 ?auto_9287 ) ) ( not ( = ?auto_9272 ?auto_9294 ) ) ( IS-CRATE ?auto_9266 ) ( SURFACE-AT ?auto_9266 ?auto_9277 ) ( ON ?auto_9266 ?auto_9290 ) ( CLEAR ?auto_9266 ) ( not ( = ?auto_9265 ?auto_9266 ) ) ( not ( = ?auto_9265 ?auto_9290 ) ) ( not ( = ?auto_9266 ?auto_9290 ) ) ( IS-CRATE ?auto_9265 ) ( SURFACE-AT ?auto_9265 ?auto_9277 ) ( ON ?auto_9265 ?auto_9293 ) ( CLEAR ?auto_9265 ) ( not ( = ?auto_9264 ?auto_9265 ) ) ( not ( = ?auto_9264 ?auto_9293 ) ) ( not ( = ?auto_9265 ?auto_9293 ) ) ( IS-CRATE ?auto_9264 ) ( AVAILABLE ?auto_9274 ) ( SURFACE-AT ?auto_9264 ?auto_9277 ) ( ON ?auto_9264 ?auto_9278 ) ( CLEAR ?auto_9264 ) ( not ( = ?auto_9263 ?auto_9264 ) ) ( not ( = ?auto_9263 ?auto_9278 ) ) ( not ( = ?auto_9264 ?auto_9278 ) ) ( SURFACE-AT ?auto_9262 ?auto_9275 ) ( CLEAR ?auto_9262 ) ( IS-CRATE ?auto_9263 ) ( AVAILABLE ?auto_9272 ) ( not ( = ?auto_9286 ?auto_9275 ) ) ( HOIST-AT ?auto_9283 ?auto_9286 ) ( AVAILABLE ?auto_9283 ) ( SURFACE-AT ?auto_9263 ?auto_9286 ) ( ON ?auto_9263 ?auto_9279 ) ( CLEAR ?auto_9263 ) ( TRUCK-AT ?auto_9273 ?auto_9275 ) ( not ( = ?auto_9262 ?auto_9263 ) ) ( not ( = ?auto_9262 ?auto_9279 ) ) ( not ( = ?auto_9263 ?auto_9279 ) ) ( not ( = ?auto_9272 ?auto_9283 ) ) ( not ( = ?auto_9262 ?auto_9264 ) ) ( not ( = ?auto_9262 ?auto_9278 ) ) ( not ( = ?auto_9264 ?auto_9279 ) ) ( not ( = ?auto_9277 ?auto_9286 ) ) ( not ( = ?auto_9274 ?auto_9283 ) ) ( not ( = ?auto_9278 ?auto_9279 ) ) ( not ( = ?auto_9262 ?auto_9265 ) ) ( not ( = ?auto_9262 ?auto_9293 ) ) ( not ( = ?auto_9263 ?auto_9265 ) ) ( not ( = ?auto_9263 ?auto_9293 ) ) ( not ( = ?auto_9265 ?auto_9278 ) ) ( not ( = ?auto_9265 ?auto_9279 ) ) ( not ( = ?auto_9293 ?auto_9278 ) ) ( not ( = ?auto_9293 ?auto_9279 ) ) ( not ( = ?auto_9262 ?auto_9266 ) ) ( not ( = ?auto_9262 ?auto_9290 ) ) ( not ( = ?auto_9263 ?auto_9266 ) ) ( not ( = ?auto_9263 ?auto_9290 ) ) ( not ( = ?auto_9264 ?auto_9266 ) ) ( not ( = ?auto_9264 ?auto_9290 ) ) ( not ( = ?auto_9266 ?auto_9293 ) ) ( not ( = ?auto_9266 ?auto_9278 ) ) ( not ( = ?auto_9266 ?auto_9279 ) ) ( not ( = ?auto_9290 ?auto_9293 ) ) ( not ( = ?auto_9290 ?auto_9278 ) ) ( not ( = ?auto_9290 ?auto_9279 ) ) ( not ( = ?auto_9262 ?auto_9269 ) ) ( not ( = ?auto_9262 ?auto_9287 ) ) ( not ( = ?auto_9263 ?auto_9269 ) ) ( not ( = ?auto_9263 ?auto_9287 ) ) ( not ( = ?auto_9264 ?auto_9269 ) ) ( not ( = ?auto_9264 ?auto_9287 ) ) ( not ( = ?auto_9265 ?auto_9269 ) ) ( not ( = ?auto_9265 ?auto_9287 ) ) ( not ( = ?auto_9269 ?auto_9290 ) ) ( not ( = ?auto_9269 ?auto_9293 ) ) ( not ( = ?auto_9269 ?auto_9278 ) ) ( not ( = ?auto_9269 ?auto_9279 ) ) ( not ( = ?auto_9284 ?auto_9277 ) ) ( not ( = ?auto_9284 ?auto_9286 ) ) ( not ( = ?auto_9294 ?auto_9274 ) ) ( not ( = ?auto_9294 ?auto_9283 ) ) ( not ( = ?auto_9287 ?auto_9290 ) ) ( not ( = ?auto_9287 ?auto_9293 ) ) ( not ( = ?auto_9287 ?auto_9278 ) ) ( not ( = ?auto_9287 ?auto_9279 ) ) ( not ( = ?auto_9262 ?auto_9267 ) ) ( not ( = ?auto_9262 ?auto_9289 ) ) ( not ( = ?auto_9263 ?auto_9267 ) ) ( not ( = ?auto_9263 ?auto_9289 ) ) ( not ( = ?auto_9264 ?auto_9267 ) ) ( not ( = ?auto_9264 ?auto_9289 ) ) ( not ( = ?auto_9265 ?auto_9267 ) ) ( not ( = ?auto_9265 ?auto_9289 ) ) ( not ( = ?auto_9266 ?auto_9267 ) ) ( not ( = ?auto_9266 ?auto_9289 ) ) ( not ( = ?auto_9267 ?auto_9287 ) ) ( not ( = ?auto_9267 ?auto_9290 ) ) ( not ( = ?auto_9267 ?auto_9293 ) ) ( not ( = ?auto_9267 ?auto_9278 ) ) ( not ( = ?auto_9267 ?auto_9279 ) ) ( not ( = ?auto_9285 ?auto_9284 ) ) ( not ( = ?auto_9285 ?auto_9277 ) ) ( not ( = ?auto_9285 ?auto_9286 ) ) ( not ( = ?auto_9288 ?auto_9294 ) ) ( not ( = ?auto_9288 ?auto_9274 ) ) ( not ( = ?auto_9288 ?auto_9283 ) ) ( not ( = ?auto_9289 ?auto_9287 ) ) ( not ( = ?auto_9289 ?auto_9290 ) ) ( not ( = ?auto_9289 ?auto_9293 ) ) ( not ( = ?auto_9289 ?auto_9278 ) ) ( not ( = ?auto_9289 ?auto_9279 ) ) ( not ( = ?auto_9262 ?auto_9271 ) ) ( not ( = ?auto_9262 ?auto_9292 ) ) ( not ( = ?auto_9263 ?auto_9271 ) ) ( not ( = ?auto_9263 ?auto_9292 ) ) ( not ( = ?auto_9264 ?auto_9271 ) ) ( not ( = ?auto_9264 ?auto_9292 ) ) ( not ( = ?auto_9265 ?auto_9271 ) ) ( not ( = ?auto_9265 ?auto_9292 ) ) ( not ( = ?auto_9266 ?auto_9271 ) ) ( not ( = ?auto_9266 ?auto_9292 ) ) ( not ( = ?auto_9269 ?auto_9271 ) ) ( not ( = ?auto_9269 ?auto_9292 ) ) ( not ( = ?auto_9271 ?auto_9289 ) ) ( not ( = ?auto_9271 ?auto_9287 ) ) ( not ( = ?auto_9271 ?auto_9290 ) ) ( not ( = ?auto_9271 ?auto_9293 ) ) ( not ( = ?auto_9271 ?auto_9278 ) ) ( not ( = ?auto_9271 ?auto_9279 ) ) ( not ( = ?auto_9291 ?auto_9285 ) ) ( not ( = ?auto_9291 ?auto_9284 ) ) ( not ( = ?auto_9291 ?auto_9277 ) ) ( not ( = ?auto_9291 ?auto_9286 ) ) ( not ( = ?auto_9282 ?auto_9288 ) ) ( not ( = ?auto_9282 ?auto_9294 ) ) ( not ( = ?auto_9282 ?auto_9274 ) ) ( not ( = ?auto_9282 ?auto_9283 ) ) ( not ( = ?auto_9292 ?auto_9289 ) ) ( not ( = ?auto_9292 ?auto_9287 ) ) ( not ( = ?auto_9292 ?auto_9290 ) ) ( not ( = ?auto_9292 ?auto_9293 ) ) ( not ( = ?auto_9292 ?auto_9278 ) ) ( not ( = ?auto_9292 ?auto_9279 ) ) ( not ( = ?auto_9262 ?auto_9270 ) ) ( not ( = ?auto_9262 ?auto_9295 ) ) ( not ( = ?auto_9263 ?auto_9270 ) ) ( not ( = ?auto_9263 ?auto_9295 ) ) ( not ( = ?auto_9264 ?auto_9270 ) ) ( not ( = ?auto_9264 ?auto_9295 ) ) ( not ( = ?auto_9265 ?auto_9270 ) ) ( not ( = ?auto_9265 ?auto_9295 ) ) ( not ( = ?auto_9266 ?auto_9270 ) ) ( not ( = ?auto_9266 ?auto_9295 ) ) ( not ( = ?auto_9269 ?auto_9270 ) ) ( not ( = ?auto_9269 ?auto_9295 ) ) ( not ( = ?auto_9267 ?auto_9270 ) ) ( not ( = ?auto_9267 ?auto_9295 ) ) ( not ( = ?auto_9270 ?auto_9292 ) ) ( not ( = ?auto_9270 ?auto_9289 ) ) ( not ( = ?auto_9270 ?auto_9287 ) ) ( not ( = ?auto_9270 ?auto_9290 ) ) ( not ( = ?auto_9270 ?auto_9293 ) ) ( not ( = ?auto_9270 ?auto_9278 ) ) ( not ( = ?auto_9270 ?auto_9279 ) ) ( not ( = ?auto_9280 ?auto_9291 ) ) ( not ( = ?auto_9280 ?auto_9285 ) ) ( not ( = ?auto_9280 ?auto_9284 ) ) ( not ( = ?auto_9280 ?auto_9277 ) ) ( not ( = ?auto_9280 ?auto_9286 ) ) ( not ( = ?auto_9281 ?auto_9282 ) ) ( not ( = ?auto_9281 ?auto_9288 ) ) ( not ( = ?auto_9281 ?auto_9294 ) ) ( not ( = ?auto_9281 ?auto_9274 ) ) ( not ( = ?auto_9281 ?auto_9283 ) ) ( not ( = ?auto_9295 ?auto_9292 ) ) ( not ( = ?auto_9295 ?auto_9289 ) ) ( not ( = ?auto_9295 ?auto_9287 ) ) ( not ( = ?auto_9295 ?auto_9290 ) ) ( not ( = ?auto_9295 ?auto_9293 ) ) ( not ( = ?auto_9295 ?auto_9278 ) ) ( not ( = ?auto_9295 ?auto_9279 ) ) ( not ( = ?auto_9262 ?auto_9268 ) ) ( not ( = ?auto_9262 ?auto_9276 ) ) ( not ( = ?auto_9263 ?auto_9268 ) ) ( not ( = ?auto_9263 ?auto_9276 ) ) ( not ( = ?auto_9264 ?auto_9268 ) ) ( not ( = ?auto_9264 ?auto_9276 ) ) ( not ( = ?auto_9265 ?auto_9268 ) ) ( not ( = ?auto_9265 ?auto_9276 ) ) ( not ( = ?auto_9266 ?auto_9268 ) ) ( not ( = ?auto_9266 ?auto_9276 ) ) ( not ( = ?auto_9269 ?auto_9268 ) ) ( not ( = ?auto_9269 ?auto_9276 ) ) ( not ( = ?auto_9267 ?auto_9268 ) ) ( not ( = ?auto_9267 ?auto_9276 ) ) ( not ( = ?auto_9271 ?auto_9268 ) ) ( not ( = ?auto_9271 ?auto_9276 ) ) ( not ( = ?auto_9268 ?auto_9295 ) ) ( not ( = ?auto_9268 ?auto_9292 ) ) ( not ( = ?auto_9268 ?auto_9289 ) ) ( not ( = ?auto_9268 ?auto_9287 ) ) ( not ( = ?auto_9268 ?auto_9290 ) ) ( not ( = ?auto_9268 ?auto_9293 ) ) ( not ( = ?auto_9268 ?auto_9278 ) ) ( not ( = ?auto_9268 ?auto_9279 ) ) ( not ( = ?auto_9276 ?auto_9295 ) ) ( not ( = ?auto_9276 ?auto_9292 ) ) ( not ( = ?auto_9276 ?auto_9289 ) ) ( not ( = ?auto_9276 ?auto_9287 ) ) ( not ( = ?auto_9276 ?auto_9290 ) ) ( not ( = ?auto_9276 ?auto_9293 ) ) ( not ( = ?auto_9276 ?auto_9278 ) ) ( not ( = ?auto_9276 ?auto_9279 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_9262 ?auto_9263 ?auto_9264 ?auto_9265 ?auto_9266 ?auto_9269 ?auto_9267 ?auto_9271 ?auto_9270 )
      ( MAKE-1CRATE ?auto_9270 ?auto_9268 )
      ( MAKE-9CRATE-VERIFY ?auto_9262 ?auto_9263 ?auto_9264 ?auto_9265 ?auto_9266 ?auto_9269 ?auto_9267 ?auto_9271 ?auto_9270 ?auto_9268 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9298 - SURFACE
      ?auto_9299 - SURFACE
    )
    :vars
    (
      ?auto_9300 - HOIST
      ?auto_9301 - PLACE
      ?auto_9303 - PLACE
      ?auto_9304 - HOIST
      ?auto_9305 - SURFACE
      ?auto_9302 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9300 ?auto_9301 ) ( SURFACE-AT ?auto_9298 ?auto_9301 ) ( CLEAR ?auto_9298 ) ( IS-CRATE ?auto_9299 ) ( AVAILABLE ?auto_9300 ) ( not ( = ?auto_9303 ?auto_9301 ) ) ( HOIST-AT ?auto_9304 ?auto_9303 ) ( AVAILABLE ?auto_9304 ) ( SURFACE-AT ?auto_9299 ?auto_9303 ) ( ON ?auto_9299 ?auto_9305 ) ( CLEAR ?auto_9299 ) ( TRUCK-AT ?auto_9302 ?auto_9301 ) ( not ( = ?auto_9298 ?auto_9299 ) ) ( not ( = ?auto_9298 ?auto_9305 ) ) ( not ( = ?auto_9299 ?auto_9305 ) ) ( not ( = ?auto_9300 ?auto_9304 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9302 ?auto_9301 ?auto_9303 )
      ( !LIFT ?auto_9304 ?auto_9299 ?auto_9305 ?auto_9303 )
      ( !LOAD ?auto_9304 ?auto_9299 ?auto_9302 ?auto_9303 )
      ( !DRIVE ?auto_9302 ?auto_9303 ?auto_9301 )
      ( !UNLOAD ?auto_9300 ?auto_9299 ?auto_9302 ?auto_9301 )
      ( !DROP ?auto_9300 ?auto_9299 ?auto_9298 ?auto_9301 )
      ( MAKE-1CRATE-VERIFY ?auto_9298 ?auto_9299 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_9317 - SURFACE
      ?auto_9318 - SURFACE
      ?auto_9319 - SURFACE
      ?auto_9320 - SURFACE
      ?auto_9321 - SURFACE
      ?auto_9324 - SURFACE
      ?auto_9322 - SURFACE
      ?auto_9326 - SURFACE
      ?auto_9325 - SURFACE
      ?auto_9323 - SURFACE
      ?auto_9327 - SURFACE
    )
    :vars
    (
      ?auto_9330 - HOIST
      ?auto_9328 - PLACE
      ?auto_9333 - PLACE
      ?auto_9332 - HOIST
      ?auto_9331 - SURFACE
      ?auto_9347 - PLACE
      ?auto_9341 - HOIST
      ?auto_9334 - SURFACE
      ?auto_9345 - PLACE
      ?auto_9340 - HOIST
      ?auto_9339 - SURFACE
      ?auto_9354 - PLACE
      ?auto_9350 - HOIST
      ?auto_9342 - SURFACE
      ?auto_9336 - PLACE
      ?auto_9346 - HOIST
      ?auto_9337 - SURFACE
      ?auto_9348 - PLACE
      ?auto_9344 - HOIST
      ?auto_9353 - SURFACE
      ?auto_9351 - SURFACE
      ?auto_9338 - SURFACE
      ?auto_9335 - SURFACE
      ?auto_9352 - PLACE
      ?auto_9349 - HOIST
      ?auto_9343 - SURFACE
      ?auto_9329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9330 ?auto_9328 ) ( IS-CRATE ?auto_9327 ) ( not ( = ?auto_9333 ?auto_9328 ) ) ( HOIST-AT ?auto_9332 ?auto_9333 ) ( AVAILABLE ?auto_9332 ) ( SURFACE-AT ?auto_9327 ?auto_9333 ) ( ON ?auto_9327 ?auto_9331 ) ( CLEAR ?auto_9327 ) ( not ( = ?auto_9323 ?auto_9327 ) ) ( not ( = ?auto_9323 ?auto_9331 ) ) ( not ( = ?auto_9327 ?auto_9331 ) ) ( not ( = ?auto_9330 ?auto_9332 ) ) ( IS-CRATE ?auto_9323 ) ( not ( = ?auto_9347 ?auto_9328 ) ) ( HOIST-AT ?auto_9341 ?auto_9347 ) ( SURFACE-AT ?auto_9323 ?auto_9347 ) ( ON ?auto_9323 ?auto_9334 ) ( CLEAR ?auto_9323 ) ( not ( = ?auto_9325 ?auto_9323 ) ) ( not ( = ?auto_9325 ?auto_9334 ) ) ( not ( = ?auto_9323 ?auto_9334 ) ) ( not ( = ?auto_9330 ?auto_9341 ) ) ( IS-CRATE ?auto_9325 ) ( not ( = ?auto_9345 ?auto_9328 ) ) ( HOIST-AT ?auto_9340 ?auto_9345 ) ( AVAILABLE ?auto_9340 ) ( SURFACE-AT ?auto_9325 ?auto_9345 ) ( ON ?auto_9325 ?auto_9339 ) ( CLEAR ?auto_9325 ) ( not ( = ?auto_9326 ?auto_9325 ) ) ( not ( = ?auto_9326 ?auto_9339 ) ) ( not ( = ?auto_9325 ?auto_9339 ) ) ( not ( = ?auto_9330 ?auto_9340 ) ) ( IS-CRATE ?auto_9326 ) ( not ( = ?auto_9354 ?auto_9328 ) ) ( HOIST-AT ?auto_9350 ?auto_9354 ) ( AVAILABLE ?auto_9350 ) ( SURFACE-AT ?auto_9326 ?auto_9354 ) ( ON ?auto_9326 ?auto_9342 ) ( CLEAR ?auto_9326 ) ( not ( = ?auto_9322 ?auto_9326 ) ) ( not ( = ?auto_9322 ?auto_9342 ) ) ( not ( = ?auto_9326 ?auto_9342 ) ) ( not ( = ?auto_9330 ?auto_9350 ) ) ( IS-CRATE ?auto_9322 ) ( not ( = ?auto_9336 ?auto_9328 ) ) ( HOIST-AT ?auto_9346 ?auto_9336 ) ( AVAILABLE ?auto_9346 ) ( SURFACE-AT ?auto_9322 ?auto_9336 ) ( ON ?auto_9322 ?auto_9337 ) ( CLEAR ?auto_9322 ) ( not ( = ?auto_9324 ?auto_9322 ) ) ( not ( = ?auto_9324 ?auto_9337 ) ) ( not ( = ?auto_9322 ?auto_9337 ) ) ( not ( = ?auto_9330 ?auto_9346 ) ) ( IS-CRATE ?auto_9324 ) ( not ( = ?auto_9348 ?auto_9328 ) ) ( HOIST-AT ?auto_9344 ?auto_9348 ) ( AVAILABLE ?auto_9344 ) ( SURFACE-AT ?auto_9324 ?auto_9348 ) ( ON ?auto_9324 ?auto_9353 ) ( CLEAR ?auto_9324 ) ( not ( = ?auto_9321 ?auto_9324 ) ) ( not ( = ?auto_9321 ?auto_9353 ) ) ( not ( = ?auto_9324 ?auto_9353 ) ) ( not ( = ?auto_9330 ?auto_9344 ) ) ( IS-CRATE ?auto_9321 ) ( SURFACE-AT ?auto_9321 ?auto_9347 ) ( ON ?auto_9321 ?auto_9351 ) ( CLEAR ?auto_9321 ) ( not ( = ?auto_9320 ?auto_9321 ) ) ( not ( = ?auto_9320 ?auto_9351 ) ) ( not ( = ?auto_9321 ?auto_9351 ) ) ( IS-CRATE ?auto_9320 ) ( SURFACE-AT ?auto_9320 ?auto_9347 ) ( ON ?auto_9320 ?auto_9338 ) ( CLEAR ?auto_9320 ) ( not ( = ?auto_9319 ?auto_9320 ) ) ( not ( = ?auto_9319 ?auto_9338 ) ) ( not ( = ?auto_9320 ?auto_9338 ) ) ( IS-CRATE ?auto_9319 ) ( AVAILABLE ?auto_9341 ) ( SURFACE-AT ?auto_9319 ?auto_9347 ) ( ON ?auto_9319 ?auto_9335 ) ( CLEAR ?auto_9319 ) ( not ( = ?auto_9318 ?auto_9319 ) ) ( not ( = ?auto_9318 ?auto_9335 ) ) ( not ( = ?auto_9319 ?auto_9335 ) ) ( SURFACE-AT ?auto_9317 ?auto_9328 ) ( CLEAR ?auto_9317 ) ( IS-CRATE ?auto_9318 ) ( AVAILABLE ?auto_9330 ) ( not ( = ?auto_9352 ?auto_9328 ) ) ( HOIST-AT ?auto_9349 ?auto_9352 ) ( AVAILABLE ?auto_9349 ) ( SURFACE-AT ?auto_9318 ?auto_9352 ) ( ON ?auto_9318 ?auto_9343 ) ( CLEAR ?auto_9318 ) ( TRUCK-AT ?auto_9329 ?auto_9328 ) ( not ( = ?auto_9317 ?auto_9318 ) ) ( not ( = ?auto_9317 ?auto_9343 ) ) ( not ( = ?auto_9318 ?auto_9343 ) ) ( not ( = ?auto_9330 ?auto_9349 ) ) ( not ( = ?auto_9317 ?auto_9319 ) ) ( not ( = ?auto_9317 ?auto_9335 ) ) ( not ( = ?auto_9319 ?auto_9343 ) ) ( not ( = ?auto_9347 ?auto_9352 ) ) ( not ( = ?auto_9341 ?auto_9349 ) ) ( not ( = ?auto_9335 ?auto_9343 ) ) ( not ( = ?auto_9317 ?auto_9320 ) ) ( not ( = ?auto_9317 ?auto_9338 ) ) ( not ( = ?auto_9318 ?auto_9320 ) ) ( not ( = ?auto_9318 ?auto_9338 ) ) ( not ( = ?auto_9320 ?auto_9335 ) ) ( not ( = ?auto_9320 ?auto_9343 ) ) ( not ( = ?auto_9338 ?auto_9335 ) ) ( not ( = ?auto_9338 ?auto_9343 ) ) ( not ( = ?auto_9317 ?auto_9321 ) ) ( not ( = ?auto_9317 ?auto_9351 ) ) ( not ( = ?auto_9318 ?auto_9321 ) ) ( not ( = ?auto_9318 ?auto_9351 ) ) ( not ( = ?auto_9319 ?auto_9321 ) ) ( not ( = ?auto_9319 ?auto_9351 ) ) ( not ( = ?auto_9321 ?auto_9338 ) ) ( not ( = ?auto_9321 ?auto_9335 ) ) ( not ( = ?auto_9321 ?auto_9343 ) ) ( not ( = ?auto_9351 ?auto_9338 ) ) ( not ( = ?auto_9351 ?auto_9335 ) ) ( not ( = ?auto_9351 ?auto_9343 ) ) ( not ( = ?auto_9317 ?auto_9324 ) ) ( not ( = ?auto_9317 ?auto_9353 ) ) ( not ( = ?auto_9318 ?auto_9324 ) ) ( not ( = ?auto_9318 ?auto_9353 ) ) ( not ( = ?auto_9319 ?auto_9324 ) ) ( not ( = ?auto_9319 ?auto_9353 ) ) ( not ( = ?auto_9320 ?auto_9324 ) ) ( not ( = ?auto_9320 ?auto_9353 ) ) ( not ( = ?auto_9324 ?auto_9351 ) ) ( not ( = ?auto_9324 ?auto_9338 ) ) ( not ( = ?auto_9324 ?auto_9335 ) ) ( not ( = ?auto_9324 ?auto_9343 ) ) ( not ( = ?auto_9348 ?auto_9347 ) ) ( not ( = ?auto_9348 ?auto_9352 ) ) ( not ( = ?auto_9344 ?auto_9341 ) ) ( not ( = ?auto_9344 ?auto_9349 ) ) ( not ( = ?auto_9353 ?auto_9351 ) ) ( not ( = ?auto_9353 ?auto_9338 ) ) ( not ( = ?auto_9353 ?auto_9335 ) ) ( not ( = ?auto_9353 ?auto_9343 ) ) ( not ( = ?auto_9317 ?auto_9322 ) ) ( not ( = ?auto_9317 ?auto_9337 ) ) ( not ( = ?auto_9318 ?auto_9322 ) ) ( not ( = ?auto_9318 ?auto_9337 ) ) ( not ( = ?auto_9319 ?auto_9322 ) ) ( not ( = ?auto_9319 ?auto_9337 ) ) ( not ( = ?auto_9320 ?auto_9322 ) ) ( not ( = ?auto_9320 ?auto_9337 ) ) ( not ( = ?auto_9321 ?auto_9322 ) ) ( not ( = ?auto_9321 ?auto_9337 ) ) ( not ( = ?auto_9322 ?auto_9353 ) ) ( not ( = ?auto_9322 ?auto_9351 ) ) ( not ( = ?auto_9322 ?auto_9338 ) ) ( not ( = ?auto_9322 ?auto_9335 ) ) ( not ( = ?auto_9322 ?auto_9343 ) ) ( not ( = ?auto_9336 ?auto_9348 ) ) ( not ( = ?auto_9336 ?auto_9347 ) ) ( not ( = ?auto_9336 ?auto_9352 ) ) ( not ( = ?auto_9346 ?auto_9344 ) ) ( not ( = ?auto_9346 ?auto_9341 ) ) ( not ( = ?auto_9346 ?auto_9349 ) ) ( not ( = ?auto_9337 ?auto_9353 ) ) ( not ( = ?auto_9337 ?auto_9351 ) ) ( not ( = ?auto_9337 ?auto_9338 ) ) ( not ( = ?auto_9337 ?auto_9335 ) ) ( not ( = ?auto_9337 ?auto_9343 ) ) ( not ( = ?auto_9317 ?auto_9326 ) ) ( not ( = ?auto_9317 ?auto_9342 ) ) ( not ( = ?auto_9318 ?auto_9326 ) ) ( not ( = ?auto_9318 ?auto_9342 ) ) ( not ( = ?auto_9319 ?auto_9326 ) ) ( not ( = ?auto_9319 ?auto_9342 ) ) ( not ( = ?auto_9320 ?auto_9326 ) ) ( not ( = ?auto_9320 ?auto_9342 ) ) ( not ( = ?auto_9321 ?auto_9326 ) ) ( not ( = ?auto_9321 ?auto_9342 ) ) ( not ( = ?auto_9324 ?auto_9326 ) ) ( not ( = ?auto_9324 ?auto_9342 ) ) ( not ( = ?auto_9326 ?auto_9337 ) ) ( not ( = ?auto_9326 ?auto_9353 ) ) ( not ( = ?auto_9326 ?auto_9351 ) ) ( not ( = ?auto_9326 ?auto_9338 ) ) ( not ( = ?auto_9326 ?auto_9335 ) ) ( not ( = ?auto_9326 ?auto_9343 ) ) ( not ( = ?auto_9354 ?auto_9336 ) ) ( not ( = ?auto_9354 ?auto_9348 ) ) ( not ( = ?auto_9354 ?auto_9347 ) ) ( not ( = ?auto_9354 ?auto_9352 ) ) ( not ( = ?auto_9350 ?auto_9346 ) ) ( not ( = ?auto_9350 ?auto_9344 ) ) ( not ( = ?auto_9350 ?auto_9341 ) ) ( not ( = ?auto_9350 ?auto_9349 ) ) ( not ( = ?auto_9342 ?auto_9337 ) ) ( not ( = ?auto_9342 ?auto_9353 ) ) ( not ( = ?auto_9342 ?auto_9351 ) ) ( not ( = ?auto_9342 ?auto_9338 ) ) ( not ( = ?auto_9342 ?auto_9335 ) ) ( not ( = ?auto_9342 ?auto_9343 ) ) ( not ( = ?auto_9317 ?auto_9325 ) ) ( not ( = ?auto_9317 ?auto_9339 ) ) ( not ( = ?auto_9318 ?auto_9325 ) ) ( not ( = ?auto_9318 ?auto_9339 ) ) ( not ( = ?auto_9319 ?auto_9325 ) ) ( not ( = ?auto_9319 ?auto_9339 ) ) ( not ( = ?auto_9320 ?auto_9325 ) ) ( not ( = ?auto_9320 ?auto_9339 ) ) ( not ( = ?auto_9321 ?auto_9325 ) ) ( not ( = ?auto_9321 ?auto_9339 ) ) ( not ( = ?auto_9324 ?auto_9325 ) ) ( not ( = ?auto_9324 ?auto_9339 ) ) ( not ( = ?auto_9322 ?auto_9325 ) ) ( not ( = ?auto_9322 ?auto_9339 ) ) ( not ( = ?auto_9325 ?auto_9342 ) ) ( not ( = ?auto_9325 ?auto_9337 ) ) ( not ( = ?auto_9325 ?auto_9353 ) ) ( not ( = ?auto_9325 ?auto_9351 ) ) ( not ( = ?auto_9325 ?auto_9338 ) ) ( not ( = ?auto_9325 ?auto_9335 ) ) ( not ( = ?auto_9325 ?auto_9343 ) ) ( not ( = ?auto_9345 ?auto_9354 ) ) ( not ( = ?auto_9345 ?auto_9336 ) ) ( not ( = ?auto_9345 ?auto_9348 ) ) ( not ( = ?auto_9345 ?auto_9347 ) ) ( not ( = ?auto_9345 ?auto_9352 ) ) ( not ( = ?auto_9340 ?auto_9350 ) ) ( not ( = ?auto_9340 ?auto_9346 ) ) ( not ( = ?auto_9340 ?auto_9344 ) ) ( not ( = ?auto_9340 ?auto_9341 ) ) ( not ( = ?auto_9340 ?auto_9349 ) ) ( not ( = ?auto_9339 ?auto_9342 ) ) ( not ( = ?auto_9339 ?auto_9337 ) ) ( not ( = ?auto_9339 ?auto_9353 ) ) ( not ( = ?auto_9339 ?auto_9351 ) ) ( not ( = ?auto_9339 ?auto_9338 ) ) ( not ( = ?auto_9339 ?auto_9335 ) ) ( not ( = ?auto_9339 ?auto_9343 ) ) ( not ( = ?auto_9317 ?auto_9323 ) ) ( not ( = ?auto_9317 ?auto_9334 ) ) ( not ( = ?auto_9318 ?auto_9323 ) ) ( not ( = ?auto_9318 ?auto_9334 ) ) ( not ( = ?auto_9319 ?auto_9323 ) ) ( not ( = ?auto_9319 ?auto_9334 ) ) ( not ( = ?auto_9320 ?auto_9323 ) ) ( not ( = ?auto_9320 ?auto_9334 ) ) ( not ( = ?auto_9321 ?auto_9323 ) ) ( not ( = ?auto_9321 ?auto_9334 ) ) ( not ( = ?auto_9324 ?auto_9323 ) ) ( not ( = ?auto_9324 ?auto_9334 ) ) ( not ( = ?auto_9322 ?auto_9323 ) ) ( not ( = ?auto_9322 ?auto_9334 ) ) ( not ( = ?auto_9326 ?auto_9323 ) ) ( not ( = ?auto_9326 ?auto_9334 ) ) ( not ( = ?auto_9323 ?auto_9339 ) ) ( not ( = ?auto_9323 ?auto_9342 ) ) ( not ( = ?auto_9323 ?auto_9337 ) ) ( not ( = ?auto_9323 ?auto_9353 ) ) ( not ( = ?auto_9323 ?auto_9351 ) ) ( not ( = ?auto_9323 ?auto_9338 ) ) ( not ( = ?auto_9323 ?auto_9335 ) ) ( not ( = ?auto_9323 ?auto_9343 ) ) ( not ( = ?auto_9334 ?auto_9339 ) ) ( not ( = ?auto_9334 ?auto_9342 ) ) ( not ( = ?auto_9334 ?auto_9337 ) ) ( not ( = ?auto_9334 ?auto_9353 ) ) ( not ( = ?auto_9334 ?auto_9351 ) ) ( not ( = ?auto_9334 ?auto_9338 ) ) ( not ( = ?auto_9334 ?auto_9335 ) ) ( not ( = ?auto_9334 ?auto_9343 ) ) ( not ( = ?auto_9317 ?auto_9327 ) ) ( not ( = ?auto_9317 ?auto_9331 ) ) ( not ( = ?auto_9318 ?auto_9327 ) ) ( not ( = ?auto_9318 ?auto_9331 ) ) ( not ( = ?auto_9319 ?auto_9327 ) ) ( not ( = ?auto_9319 ?auto_9331 ) ) ( not ( = ?auto_9320 ?auto_9327 ) ) ( not ( = ?auto_9320 ?auto_9331 ) ) ( not ( = ?auto_9321 ?auto_9327 ) ) ( not ( = ?auto_9321 ?auto_9331 ) ) ( not ( = ?auto_9324 ?auto_9327 ) ) ( not ( = ?auto_9324 ?auto_9331 ) ) ( not ( = ?auto_9322 ?auto_9327 ) ) ( not ( = ?auto_9322 ?auto_9331 ) ) ( not ( = ?auto_9326 ?auto_9327 ) ) ( not ( = ?auto_9326 ?auto_9331 ) ) ( not ( = ?auto_9325 ?auto_9327 ) ) ( not ( = ?auto_9325 ?auto_9331 ) ) ( not ( = ?auto_9327 ?auto_9334 ) ) ( not ( = ?auto_9327 ?auto_9339 ) ) ( not ( = ?auto_9327 ?auto_9342 ) ) ( not ( = ?auto_9327 ?auto_9337 ) ) ( not ( = ?auto_9327 ?auto_9353 ) ) ( not ( = ?auto_9327 ?auto_9351 ) ) ( not ( = ?auto_9327 ?auto_9338 ) ) ( not ( = ?auto_9327 ?auto_9335 ) ) ( not ( = ?auto_9327 ?auto_9343 ) ) ( not ( = ?auto_9333 ?auto_9347 ) ) ( not ( = ?auto_9333 ?auto_9345 ) ) ( not ( = ?auto_9333 ?auto_9354 ) ) ( not ( = ?auto_9333 ?auto_9336 ) ) ( not ( = ?auto_9333 ?auto_9348 ) ) ( not ( = ?auto_9333 ?auto_9352 ) ) ( not ( = ?auto_9332 ?auto_9341 ) ) ( not ( = ?auto_9332 ?auto_9340 ) ) ( not ( = ?auto_9332 ?auto_9350 ) ) ( not ( = ?auto_9332 ?auto_9346 ) ) ( not ( = ?auto_9332 ?auto_9344 ) ) ( not ( = ?auto_9332 ?auto_9349 ) ) ( not ( = ?auto_9331 ?auto_9334 ) ) ( not ( = ?auto_9331 ?auto_9339 ) ) ( not ( = ?auto_9331 ?auto_9342 ) ) ( not ( = ?auto_9331 ?auto_9337 ) ) ( not ( = ?auto_9331 ?auto_9353 ) ) ( not ( = ?auto_9331 ?auto_9351 ) ) ( not ( = ?auto_9331 ?auto_9338 ) ) ( not ( = ?auto_9331 ?auto_9335 ) ) ( not ( = ?auto_9331 ?auto_9343 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_9317 ?auto_9318 ?auto_9319 ?auto_9320 ?auto_9321 ?auto_9324 ?auto_9322 ?auto_9326 ?auto_9325 ?auto_9323 )
      ( MAKE-1CRATE ?auto_9323 ?auto_9327 )
      ( MAKE-10CRATE-VERIFY ?auto_9317 ?auto_9318 ?auto_9319 ?auto_9320 ?auto_9321 ?auto_9324 ?auto_9322 ?auto_9326 ?auto_9325 ?auto_9323 ?auto_9327 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9357 - SURFACE
      ?auto_9358 - SURFACE
    )
    :vars
    (
      ?auto_9359 - HOIST
      ?auto_9360 - PLACE
      ?auto_9362 - PLACE
      ?auto_9363 - HOIST
      ?auto_9364 - SURFACE
      ?auto_9361 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9359 ?auto_9360 ) ( SURFACE-AT ?auto_9357 ?auto_9360 ) ( CLEAR ?auto_9357 ) ( IS-CRATE ?auto_9358 ) ( AVAILABLE ?auto_9359 ) ( not ( = ?auto_9362 ?auto_9360 ) ) ( HOIST-AT ?auto_9363 ?auto_9362 ) ( AVAILABLE ?auto_9363 ) ( SURFACE-AT ?auto_9358 ?auto_9362 ) ( ON ?auto_9358 ?auto_9364 ) ( CLEAR ?auto_9358 ) ( TRUCK-AT ?auto_9361 ?auto_9360 ) ( not ( = ?auto_9357 ?auto_9358 ) ) ( not ( = ?auto_9357 ?auto_9364 ) ) ( not ( = ?auto_9358 ?auto_9364 ) ) ( not ( = ?auto_9359 ?auto_9363 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9361 ?auto_9360 ?auto_9362 )
      ( !LIFT ?auto_9363 ?auto_9358 ?auto_9364 ?auto_9362 )
      ( !LOAD ?auto_9363 ?auto_9358 ?auto_9361 ?auto_9362 )
      ( !DRIVE ?auto_9361 ?auto_9362 ?auto_9360 )
      ( !UNLOAD ?auto_9359 ?auto_9358 ?auto_9361 ?auto_9360 )
      ( !DROP ?auto_9359 ?auto_9358 ?auto_9357 ?auto_9360 )
      ( MAKE-1CRATE-VERIFY ?auto_9357 ?auto_9358 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_9377 - SURFACE
      ?auto_9378 - SURFACE
      ?auto_9379 - SURFACE
      ?auto_9380 - SURFACE
      ?auto_9381 - SURFACE
      ?auto_9384 - SURFACE
      ?auto_9382 - SURFACE
      ?auto_9386 - SURFACE
      ?auto_9385 - SURFACE
      ?auto_9383 - SURFACE
      ?auto_9388 - SURFACE
      ?auto_9387 - SURFACE
    )
    :vars
    (
      ?auto_9393 - HOIST
      ?auto_9390 - PLACE
      ?auto_9392 - PLACE
      ?auto_9389 - HOIST
      ?auto_9391 - SURFACE
      ?auto_9416 - PLACE
      ?auto_9398 - HOIST
      ?auto_9414 - SURFACE
      ?auto_9400 - PLACE
      ?auto_9411 - HOIST
      ?auto_9404 - SURFACE
      ?auto_9403 - SURFACE
      ?auto_9412 - PLACE
      ?auto_9407 - HOIST
      ?auto_9402 - SURFACE
      ?auto_9408 - PLACE
      ?auto_9395 - HOIST
      ?auto_9406 - SURFACE
      ?auto_9415 - PLACE
      ?auto_9396 - HOIST
      ?auto_9413 - SURFACE
      ?auto_9409 - SURFACE
      ?auto_9410 - SURFACE
      ?auto_9399 - SURFACE
      ?auto_9405 - PLACE
      ?auto_9401 - HOIST
      ?auto_9397 - SURFACE
      ?auto_9394 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9393 ?auto_9390 ) ( IS-CRATE ?auto_9387 ) ( not ( = ?auto_9392 ?auto_9390 ) ) ( HOIST-AT ?auto_9389 ?auto_9392 ) ( SURFACE-AT ?auto_9387 ?auto_9392 ) ( ON ?auto_9387 ?auto_9391 ) ( CLEAR ?auto_9387 ) ( not ( = ?auto_9388 ?auto_9387 ) ) ( not ( = ?auto_9388 ?auto_9391 ) ) ( not ( = ?auto_9387 ?auto_9391 ) ) ( not ( = ?auto_9393 ?auto_9389 ) ) ( IS-CRATE ?auto_9388 ) ( not ( = ?auto_9416 ?auto_9390 ) ) ( HOIST-AT ?auto_9398 ?auto_9416 ) ( AVAILABLE ?auto_9398 ) ( SURFACE-AT ?auto_9388 ?auto_9416 ) ( ON ?auto_9388 ?auto_9414 ) ( CLEAR ?auto_9388 ) ( not ( = ?auto_9383 ?auto_9388 ) ) ( not ( = ?auto_9383 ?auto_9414 ) ) ( not ( = ?auto_9388 ?auto_9414 ) ) ( not ( = ?auto_9393 ?auto_9398 ) ) ( IS-CRATE ?auto_9383 ) ( not ( = ?auto_9400 ?auto_9390 ) ) ( HOIST-AT ?auto_9411 ?auto_9400 ) ( SURFACE-AT ?auto_9383 ?auto_9400 ) ( ON ?auto_9383 ?auto_9404 ) ( CLEAR ?auto_9383 ) ( not ( = ?auto_9385 ?auto_9383 ) ) ( not ( = ?auto_9385 ?auto_9404 ) ) ( not ( = ?auto_9383 ?auto_9404 ) ) ( not ( = ?auto_9393 ?auto_9411 ) ) ( IS-CRATE ?auto_9385 ) ( AVAILABLE ?auto_9389 ) ( SURFACE-AT ?auto_9385 ?auto_9392 ) ( ON ?auto_9385 ?auto_9403 ) ( CLEAR ?auto_9385 ) ( not ( = ?auto_9386 ?auto_9385 ) ) ( not ( = ?auto_9386 ?auto_9403 ) ) ( not ( = ?auto_9385 ?auto_9403 ) ) ( IS-CRATE ?auto_9386 ) ( not ( = ?auto_9412 ?auto_9390 ) ) ( HOIST-AT ?auto_9407 ?auto_9412 ) ( AVAILABLE ?auto_9407 ) ( SURFACE-AT ?auto_9386 ?auto_9412 ) ( ON ?auto_9386 ?auto_9402 ) ( CLEAR ?auto_9386 ) ( not ( = ?auto_9382 ?auto_9386 ) ) ( not ( = ?auto_9382 ?auto_9402 ) ) ( not ( = ?auto_9386 ?auto_9402 ) ) ( not ( = ?auto_9393 ?auto_9407 ) ) ( IS-CRATE ?auto_9382 ) ( not ( = ?auto_9408 ?auto_9390 ) ) ( HOIST-AT ?auto_9395 ?auto_9408 ) ( AVAILABLE ?auto_9395 ) ( SURFACE-AT ?auto_9382 ?auto_9408 ) ( ON ?auto_9382 ?auto_9406 ) ( CLEAR ?auto_9382 ) ( not ( = ?auto_9384 ?auto_9382 ) ) ( not ( = ?auto_9384 ?auto_9406 ) ) ( not ( = ?auto_9382 ?auto_9406 ) ) ( not ( = ?auto_9393 ?auto_9395 ) ) ( IS-CRATE ?auto_9384 ) ( not ( = ?auto_9415 ?auto_9390 ) ) ( HOIST-AT ?auto_9396 ?auto_9415 ) ( AVAILABLE ?auto_9396 ) ( SURFACE-AT ?auto_9384 ?auto_9415 ) ( ON ?auto_9384 ?auto_9413 ) ( CLEAR ?auto_9384 ) ( not ( = ?auto_9381 ?auto_9384 ) ) ( not ( = ?auto_9381 ?auto_9413 ) ) ( not ( = ?auto_9384 ?auto_9413 ) ) ( not ( = ?auto_9393 ?auto_9396 ) ) ( IS-CRATE ?auto_9381 ) ( SURFACE-AT ?auto_9381 ?auto_9400 ) ( ON ?auto_9381 ?auto_9409 ) ( CLEAR ?auto_9381 ) ( not ( = ?auto_9380 ?auto_9381 ) ) ( not ( = ?auto_9380 ?auto_9409 ) ) ( not ( = ?auto_9381 ?auto_9409 ) ) ( IS-CRATE ?auto_9380 ) ( SURFACE-AT ?auto_9380 ?auto_9400 ) ( ON ?auto_9380 ?auto_9410 ) ( CLEAR ?auto_9380 ) ( not ( = ?auto_9379 ?auto_9380 ) ) ( not ( = ?auto_9379 ?auto_9410 ) ) ( not ( = ?auto_9380 ?auto_9410 ) ) ( IS-CRATE ?auto_9379 ) ( AVAILABLE ?auto_9411 ) ( SURFACE-AT ?auto_9379 ?auto_9400 ) ( ON ?auto_9379 ?auto_9399 ) ( CLEAR ?auto_9379 ) ( not ( = ?auto_9378 ?auto_9379 ) ) ( not ( = ?auto_9378 ?auto_9399 ) ) ( not ( = ?auto_9379 ?auto_9399 ) ) ( SURFACE-AT ?auto_9377 ?auto_9390 ) ( CLEAR ?auto_9377 ) ( IS-CRATE ?auto_9378 ) ( AVAILABLE ?auto_9393 ) ( not ( = ?auto_9405 ?auto_9390 ) ) ( HOIST-AT ?auto_9401 ?auto_9405 ) ( AVAILABLE ?auto_9401 ) ( SURFACE-AT ?auto_9378 ?auto_9405 ) ( ON ?auto_9378 ?auto_9397 ) ( CLEAR ?auto_9378 ) ( TRUCK-AT ?auto_9394 ?auto_9390 ) ( not ( = ?auto_9377 ?auto_9378 ) ) ( not ( = ?auto_9377 ?auto_9397 ) ) ( not ( = ?auto_9378 ?auto_9397 ) ) ( not ( = ?auto_9393 ?auto_9401 ) ) ( not ( = ?auto_9377 ?auto_9379 ) ) ( not ( = ?auto_9377 ?auto_9399 ) ) ( not ( = ?auto_9379 ?auto_9397 ) ) ( not ( = ?auto_9400 ?auto_9405 ) ) ( not ( = ?auto_9411 ?auto_9401 ) ) ( not ( = ?auto_9399 ?auto_9397 ) ) ( not ( = ?auto_9377 ?auto_9380 ) ) ( not ( = ?auto_9377 ?auto_9410 ) ) ( not ( = ?auto_9378 ?auto_9380 ) ) ( not ( = ?auto_9378 ?auto_9410 ) ) ( not ( = ?auto_9380 ?auto_9399 ) ) ( not ( = ?auto_9380 ?auto_9397 ) ) ( not ( = ?auto_9410 ?auto_9399 ) ) ( not ( = ?auto_9410 ?auto_9397 ) ) ( not ( = ?auto_9377 ?auto_9381 ) ) ( not ( = ?auto_9377 ?auto_9409 ) ) ( not ( = ?auto_9378 ?auto_9381 ) ) ( not ( = ?auto_9378 ?auto_9409 ) ) ( not ( = ?auto_9379 ?auto_9381 ) ) ( not ( = ?auto_9379 ?auto_9409 ) ) ( not ( = ?auto_9381 ?auto_9410 ) ) ( not ( = ?auto_9381 ?auto_9399 ) ) ( not ( = ?auto_9381 ?auto_9397 ) ) ( not ( = ?auto_9409 ?auto_9410 ) ) ( not ( = ?auto_9409 ?auto_9399 ) ) ( not ( = ?auto_9409 ?auto_9397 ) ) ( not ( = ?auto_9377 ?auto_9384 ) ) ( not ( = ?auto_9377 ?auto_9413 ) ) ( not ( = ?auto_9378 ?auto_9384 ) ) ( not ( = ?auto_9378 ?auto_9413 ) ) ( not ( = ?auto_9379 ?auto_9384 ) ) ( not ( = ?auto_9379 ?auto_9413 ) ) ( not ( = ?auto_9380 ?auto_9384 ) ) ( not ( = ?auto_9380 ?auto_9413 ) ) ( not ( = ?auto_9384 ?auto_9409 ) ) ( not ( = ?auto_9384 ?auto_9410 ) ) ( not ( = ?auto_9384 ?auto_9399 ) ) ( not ( = ?auto_9384 ?auto_9397 ) ) ( not ( = ?auto_9415 ?auto_9400 ) ) ( not ( = ?auto_9415 ?auto_9405 ) ) ( not ( = ?auto_9396 ?auto_9411 ) ) ( not ( = ?auto_9396 ?auto_9401 ) ) ( not ( = ?auto_9413 ?auto_9409 ) ) ( not ( = ?auto_9413 ?auto_9410 ) ) ( not ( = ?auto_9413 ?auto_9399 ) ) ( not ( = ?auto_9413 ?auto_9397 ) ) ( not ( = ?auto_9377 ?auto_9382 ) ) ( not ( = ?auto_9377 ?auto_9406 ) ) ( not ( = ?auto_9378 ?auto_9382 ) ) ( not ( = ?auto_9378 ?auto_9406 ) ) ( not ( = ?auto_9379 ?auto_9382 ) ) ( not ( = ?auto_9379 ?auto_9406 ) ) ( not ( = ?auto_9380 ?auto_9382 ) ) ( not ( = ?auto_9380 ?auto_9406 ) ) ( not ( = ?auto_9381 ?auto_9382 ) ) ( not ( = ?auto_9381 ?auto_9406 ) ) ( not ( = ?auto_9382 ?auto_9413 ) ) ( not ( = ?auto_9382 ?auto_9409 ) ) ( not ( = ?auto_9382 ?auto_9410 ) ) ( not ( = ?auto_9382 ?auto_9399 ) ) ( not ( = ?auto_9382 ?auto_9397 ) ) ( not ( = ?auto_9408 ?auto_9415 ) ) ( not ( = ?auto_9408 ?auto_9400 ) ) ( not ( = ?auto_9408 ?auto_9405 ) ) ( not ( = ?auto_9395 ?auto_9396 ) ) ( not ( = ?auto_9395 ?auto_9411 ) ) ( not ( = ?auto_9395 ?auto_9401 ) ) ( not ( = ?auto_9406 ?auto_9413 ) ) ( not ( = ?auto_9406 ?auto_9409 ) ) ( not ( = ?auto_9406 ?auto_9410 ) ) ( not ( = ?auto_9406 ?auto_9399 ) ) ( not ( = ?auto_9406 ?auto_9397 ) ) ( not ( = ?auto_9377 ?auto_9386 ) ) ( not ( = ?auto_9377 ?auto_9402 ) ) ( not ( = ?auto_9378 ?auto_9386 ) ) ( not ( = ?auto_9378 ?auto_9402 ) ) ( not ( = ?auto_9379 ?auto_9386 ) ) ( not ( = ?auto_9379 ?auto_9402 ) ) ( not ( = ?auto_9380 ?auto_9386 ) ) ( not ( = ?auto_9380 ?auto_9402 ) ) ( not ( = ?auto_9381 ?auto_9386 ) ) ( not ( = ?auto_9381 ?auto_9402 ) ) ( not ( = ?auto_9384 ?auto_9386 ) ) ( not ( = ?auto_9384 ?auto_9402 ) ) ( not ( = ?auto_9386 ?auto_9406 ) ) ( not ( = ?auto_9386 ?auto_9413 ) ) ( not ( = ?auto_9386 ?auto_9409 ) ) ( not ( = ?auto_9386 ?auto_9410 ) ) ( not ( = ?auto_9386 ?auto_9399 ) ) ( not ( = ?auto_9386 ?auto_9397 ) ) ( not ( = ?auto_9412 ?auto_9408 ) ) ( not ( = ?auto_9412 ?auto_9415 ) ) ( not ( = ?auto_9412 ?auto_9400 ) ) ( not ( = ?auto_9412 ?auto_9405 ) ) ( not ( = ?auto_9407 ?auto_9395 ) ) ( not ( = ?auto_9407 ?auto_9396 ) ) ( not ( = ?auto_9407 ?auto_9411 ) ) ( not ( = ?auto_9407 ?auto_9401 ) ) ( not ( = ?auto_9402 ?auto_9406 ) ) ( not ( = ?auto_9402 ?auto_9413 ) ) ( not ( = ?auto_9402 ?auto_9409 ) ) ( not ( = ?auto_9402 ?auto_9410 ) ) ( not ( = ?auto_9402 ?auto_9399 ) ) ( not ( = ?auto_9402 ?auto_9397 ) ) ( not ( = ?auto_9377 ?auto_9385 ) ) ( not ( = ?auto_9377 ?auto_9403 ) ) ( not ( = ?auto_9378 ?auto_9385 ) ) ( not ( = ?auto_9378 ?auto_9403 ) ) ( not ( = ?auto_9379 ?auto_9385 ) ) ( not ( = ?auto_9379 ?auto_9403 ) ) ( not ( = ?auto_9380 ?auto_9385 ) ) ( not ( = ?auto_9380 ?auto_9403 ) ) ( not ( = ?auto_9381 ?auto_9385 ) ) ( not ( = ?auto_9381 ?auto_9403 ) ) ( not ( = ?auto_9384 ?auto_9385 ) ) ( not ( = ?auto_9384 ?auto_9403 ) ) ( not ( = ?auto_9382 ?auto_9385 ) ) ( not ( = ?auto_9382 ?auto_9403 ) ) ( not ( = ?auto_9385 ?auto_9402 ) ) ( not ( = ?auto_9385 ?auto_9406 ) ) ( not ( = ?auto_9385 ?auto_9413 ) ) ( not ( = ?auto_9385 ?auto_9409 ) ) ( not ( = ?auto_9385 ?auto_9410 ) ) ( not ( = ?auto_9385 ?auto_9399 ) ) ( not ( = ?auto_9385 ?auto_9397 ) ) ( not ( = ?auto_9392 ?auto_9412 ) ) ( not ( = ?auto_9392 ?auto_9408 ) ) ( not ( = ?auto_9392 ?auto_9415 ) ) ( not ( = ?auto_9392 ?auto_9400 ) ) ( not ( = ?auto_9392 ?auto_9405 ) ) ( not ( = ?auto_9389 ?auto_9407 ) ) ( not ( = ?auto_9389 ?auto_9395 ) ) ( not ( = ?auto_9389 ?auto_9396 ) ) ( not ( = ?auto_9389 ?auto_9411 ) ) ( not ( = ?auto_9389 ?auto_9401 ) ) ( not ( = ?auto_9403 ?auto_9402 ) ) ( not ( = ?auto_9403 ?auto_9406 ) ) ( not ( = ?auto_9403 ?auto_9413 ) ) ( not ( = ?auto_9403 ?auto_9409 ) ) ( not ( = ?auto_9403 ?auto_9410 ) ) ( not ( = ?auto_9403 ?auto_9399 ) ) ( not ( = ?auto_9403 ?auto_9397 ) ) ( not ( = ?auto_9377 ?auto_9383 ) ) ( not ( = ?auto_9377 ?auto_9404 ) ) ( not ( = ?auto_9378 ?auto_9383 ) ) ( not ( = ?auto_9378 ?auto_9404 ) ) ( not ( = ?auto_9379 ?auto_9383 ) ) ( not ( = ?auto_9379 ?auto_9404 ) ) ( not ( = ?auto_9380 ?auto_9383 ) ) ( not ( = ?auto_9380 ?auto_9404 ) ) ( not ( = ?auto_9381 ?auto_9383 ) ) ( not ( = ?auto_9381 ?auto_9404 ) ) ( not ( = ?auto_9384 ?auto_9383 ) ) ( not ( = ?auto_9384 ?auto_9404 ) ) ( not ( = ?auto_9382 ?auto_9383 ) ) ( not ( = ?auto_9382 ?auto_9404 ) ) ( not ( = ?auto_9386 ?auto_9383 ) ) ( not ( = ?auto_9386 ?auto_9404 ) ) ( not ( = ?auto_9383 ?auto_9403 ) ) ( not ( = ?auto_9383 ?auto_9402 ) ) ( not ( = ?auto_9383 ?auto_9406 ) ) ( not ( = ?auto_9383 ?auto_9413 ) ) ( not ( = ?auto_9383 ?auto_9409 ) ) ( not ( = ?auto_9383 ?auto_9410 ) ) ( not ( = ?auto_9383 ?auto_9399 ) ) ( not ( = ?auto_9383 ?auto_9397 ) ) ( not ( = ?auto_9404 ?auto_9403 ) ) ( not ( = ?auto_9404 ?auto_9402 ) ) ( not ( = ?auto_9404 ?auto_9406 ) ) ( not ( = ?auto_9404 ?auto_9413 ) ) ( not ( = ?auto_9404 ?auto_9409 ) ) ( not ( = ?auto_9404 ?auto_9410 ) ) ( not ( = ?auto_9404 ?auto_9399 ) ) ( not ( = ?auto_9404 ?auto_9397 ) ) ( not ( = ?auto_9377 ?auto_9388 ) ) ( not ( = ?auto_9377 ?auto_9414 ) ) ( not ( = ?auto_9378 ?auto_9388 ) ) ( not ( = ?auto_9378 ?auto_9414 ) ) ( not ( = ?auto_9379 ?auto_9388 ) ) ( not ( = ?auto_9379 ?auto_9414 ) ) ( not ( = ?auto_9380 ?auto_9388 ) ) ( not ( = ?auto_9380 ?auto_9414 ) ) ( not ( = ?auto_9381 ?auto_9388 ) ) ( not ( = ?auto_9381 ?auto_9414 ) ) ( not ( = ?auto_9384 ?auto_9388 ) ) ( not ( = ?auto_9384 ?auto_9414 ) ) ( not ( = ?auto_9382 ?auto_9388 ) ) ( not ( = ?auto_9382 ?auto_9414 ) ) ( not ( = ?auto_9386 ?auto_9388 ) ) ( not ( = ?auto_9386 ?auto_9414 ) ) ( not ( = ?auto_9385 ?auto_9388 ) ) ( not ( = ?auto_9385 ?auto_9414 ) ) ( not ( = ?auto_9388 ?auto_9404 ) ) ( not ( = ?auto_9388 ?auto_9403 ) ) ( not ( = ?auto_9388 ?auto_9402 ) ) ( not ( = ?auto_9388 ?auto_9406 ) ) ( not ( = ?auto_9388 ?auto_9413 ) ) ( not ( = ?auto_9388 ?auto_9409 ) ) ( not ( = ?auto_9388 ?auto_9410 ) ) ( not ( = ?auto_9388 ?auto_9399 ) ) ( not ( = ?auto_9388 ?auto_9397 ) ) ( not ( = ?auto_9416 ?auto_9400 ) ) ( not ( = ?auto_9416 ?auto_9392 ) ) ( not ( = ?auto_9416 ?auto_9412 ) ) ( not ( = ?auto_9416 ?auto_9408 ) ) ( not ( = ?auto_9416 ?auto_9415 ) ) ( not ( = ?auto_9416 ?auto_9405 ) ) ( not ( = ?auto_9398 ?auto_9411 ) ) ( not ( = ?auto_9398 ?auto_9389 ) ) ( not ( = ?auto_9398 ?auto_9407 ) ) ( not ( = ?auto_9398 ?auto_9395 ) ) ( not ( = ?auto_9398 ?auto_9396 ) ) ( not ( = ?auto_9398 ?auto_9401 ) ) ( not ( = ?auto_9414 ?auto_9404 ) ) ( not ( = ?auto_9414 ?auto_9403 ) ) ( not ( = ?auto_9414 ?auto_9402 ) ) ( not ( = ?auto_9414 ?auto_9406 ) ) ( not ( = ?auto_9414 ?auto_9413 ) ) ( not ( = ?auto_9414 ?auto_9409 ) ) ( not ( = ?auto_9414 ?auto_9410 ) ) ( not ( = ?auto_9414 ?auto_9399 ) ) ( not ( = ?auto_9414 ?auto_9397 ) ) ( not ( = ?auto_9377 ?auto_9387 ) ) ( not ( = ?auto_9377 ?auto_9391 ) ) ( not ( = ?auto_9378 ?auto_9387 ) ) ( not ( = ?auto_9378 ?auto_9391 ) ) ( not ( = ?auto_9379 ?auto_9387 ) ) ( not ( = ?auto_9379 ?auto_9391 ) ) ( not ( = ?auto_9380 ?auto_9387 ) ) ( not ( = ?auto_9380 ?auto_9391 ) ) ( not ( = ?auto_9381 ?auto_9387 ) ) ( not ( = ?auto_9381 ?auto_9391 ) ) ( not ( = ?auto_9384 ?auto_9387 ) ) ( not ( = ?auto_9384 ?auto_9391 ) ) ( not ( = ?auto_9382 ?auto_9387 ) ) ( not ( = ?auto_9382 ?auto_9391 ) ) ( not ( = ?auto_9386 ?auto_9387 ) ) ( not ( = ?auto_9386 ?auto_9391 ) ) ( not ( = ?auto_9385 ?auto_9387 ) ) ( not ( = ?auto_9385 ?auto_9391 ) ) ( not ( = ?auto_9383 ?auto_9387 ) ) ( not ( = ?auto_9383 ?auto_9391 ) ) ( not ( = ?auto_9387 ?auto_9414 ) ) ( not ( = ?auto_9387 ?auto_9404 ) ) ( not ( = ?auto_9387 ?auto_9403 ) ) ( not ( = ?auto_9387 ?auto_9402 ) ) ( not ( = ?auto_9387 ?auto_9406 ) ) ( not ( = ?auto_9387 ?auto_9413 ) ) ( not ( = ?auto_9387 ?auto_9409 ) ) ( not ( = ?auto_9387 ?auto_9410 ) ) ( not ( = ?auto_9387 ?auto_9399 ) ) ( not ( = ?auto_9387 ?auto_9397 ) ) ( not ( = ?auto_9391 ?auto_9414 ) ) ( not ( = ?auto_9391 ?auto_9404 ) ) ( not ( = ?auto_9391 ?auto_9403 ) ) ( not ( = ?auto_9391 ?auto_9402 ) ) ( not ( = ?auto_9391 ?auto_9406 ) ) ( not ( = ?auto_9391 ?auto_9413 ) ) ( not ( = ?auto_9391 ?auto_9409 ) ) ( not ( = ?auto_9391 ?auto_9410 ) ) ( not ( = ?auto_9391 ?auto_9399 ) ) ( not ( = ?auto_9391 ?auto_9397 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_9377 ?auto_9378 ?auto_9379 ?auto_9380 ?auto_9381 ?auto_9384 ?auto_9382 ?auto_9386 ?auto_9385 ?auto_9383 ?auto_9388 )
      ( MAKE-1CRATE ?auto_9388 ?auto_9387 )
      ( MAKE-11CRATE-VERIFY ?auto_9377 ?auto_9378 ?auto_9379 ?auto_9380 ?auto_9381 ?auto_9384 ?auto_9382 ?auto_9386 ?auto_9385 ?auto_9383 ?auto_9388 ?auto_9387 ) )
  )

)

