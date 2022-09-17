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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8997 - SURFACE
      ?auto_8998 - SURFACE
      ?auto_8999 - SURFACE
    )
    :vars
    (
      ?auto_9002 - HOIST
      ?auto_9005 - PLACE
      ?auto_9004 - PLACE
      ?auto_9000 - HOIST
      ?auto_9003 - SURFACE
      ?auto_9007 - PLACE
      ?auto_9006 - HOIST
      ?auto_9008 - SURFACE
      ?auto_9001 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9002 ?auto_9005 ) ( IS-CRATE ?auto_8999 ) ( not ( = ?auto_9004 ?auto_9005 ) ) ( HOIST-AT ?auto_9000 ?auto_9004 ) ( AVAILABLE ?auto_9000 ) ( SURFACE-AT ?auto_8999 ?auto_9004 ) ( ON ?auto_8999 ?auto_9003 ) ( CLEAR ?auto_8999 ) ( not ( = ?auto_8998 ?auto_8999 ) ) ( not ( = ?auto_8998 ?auto_9003 ) ) ( not ( = ?auto_8999 ?auto_9003 ) ) ( not ( = ?auto_9002 ?auto_9000 ) ) ( SURFACE-AT ?auto_8997 ?auto_9005 ) ( CLEAR ?auto_8997 ) ( IS-CRATE ?auto_8998 ) ( AVAILABLE ?auto_9002 ) ( not ( = ?auto_9007 ?auto_9005 ) ) ( HOIST-AT ?auto_9006 ?auto_9007 ) ( AVAILABLE ?auto_9006 ) ( SURFACE-AT ?auto_8998 ?auto_9007 ) ( ON ?auto_8998 ?auto_9008 ) ( CLEAR ?auto_8998 ) ( TRUCK-AT ?auto_9001 ?auto_9005 ) ( not ( = ?auto_8997 ?auto_8998 ) ) ( not ( = ?auto_8997 ?auto_9008 ) ) ( not ( = ?auto_8998 ?auto_9008 ) ) ( not ( = ?auto_9002 ?auto_9006 ) ) ( not ( = ?auto_8997 ?auto_8999 ) ) ( not ( = ?auto_8997 ?auto_9003 ) ) ( not ( = ?auto_8999 ?auto_9008 ) ) ( not ( = ?auto_9004 ?auto_9007 ) ) ( not ( = ?auto_9000 ?auto_9006 ) ) ( not ( = ?auto_9003 ?auto_9008 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8997 ?auto_8998 )
      ( MAKE-1CRATE ?auto_8998 ?auto_8999 )
      ( MAKE-2CRATE-VERIFY ?auto_8997 ?auto_8998 ?auto_8999 ) )
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
      ?auto_9027 - HOIST
      ?auto_9031 - PLACE
      ?auto_9028 - PLACE
      ?auto_9032 - HOIST
      ?auto_9029 - SURFACE
      ?auto_9035 - SURFACE
      ?auto_9036 - PLACE
      ?auto_9033 - HOIST
      ?auto_9034 - SURFACE
      ?auto_9030 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9027 ?auto_9031 ) ( IS-CRATE ?auto_9026 ) ( not ( = ?auto_9028 ?auto_9031 ) ) ( HOIST-AT ?auto_9032 ?auto_9028 ) ( SURFACE-AT ?auto_9026 ?auto_9028 ) ( ON ?auto_9026 ?auto_9029 ) ( CLEAR ?auto_9026 ) ( not ( = ?auto_9025 ?auto_9026 ) ) ( not ( = ?auto_9025 ?auto_9029 ) ) ( not ( = ?auto_9026 ?auto_9029 ) ) ( not ( = ?auto_9027 ?auto_9032 ) ) ( IS-CRATE ?auto_9025 ) ( AVAILABLE ?auto_9032 ) ( SURFACE-AT ?auto_9025 ?auto_9028 ) ( ON ?auto_9025 ?auto_9035 ) ( CLEAR ?auto_9025 ) ( not ( = ?auto_9024 ?auto_9025 ) ) ( not ( = ?auto_9024 ?auto_9035 ) ) ( not ( = ?auto_9025 ?auto_9035 ) ) ( SURFACE-AT ?auto_9023 ?auto_9031 ) ( CLEAR ?auto_9023 ) ( IS-CRATE ?auto_9024 ) ( AVAILABLE ?auto_9027 ) ( not ( = ?auto_9036 ?auto_9031 ) ) ( HOIST-AT ?auto_9033 ?auto_9036 ) ( AVAILABLE ?auto_9033 ) ( SURFACE-AT ?auto_9024 ?auto_9036 ) ( ON ?auto_9024 ?auto_9034 ) ( CLEAR ?auto_9024 ) ( TRUCK-AT ?auto_9030 ?auto_9031 ) ( not ( = ?auto_9023 ?auto_9024 ) ) ( not ( = ?auto_9023 ?auto_9034 ) ) ( not ( = ?auto_9024 ?auto_9034 ) ) ( not ( = ?auto_9027 ?auto_9033 ) ) ( not ( = ?auto_9023 ?auto_9025 ) ) ( not ( = ?auto_9023 ?auto_9035 ) ) ( not ( = ?auto_9025 ?auto_9034 ) ) ( not ( = ?auto_9028 ?auto_9036 ) ) ( not ( = ?auto_9032 ?auto_9033 ) ) ( not ( = ?auto_9035 ?auto_9034 ) ) ( not ( = ?auto_9023 ?auto_9026 ) ) ( not ( = ?auto_9023 ?auto_9029 ) ) ( not ( = ?auto_9024 ?auto_9026 ) ) ( not ( = ?auto_9024 ?auto_9029 ) ) ( not ( = ?auto_9026 ?auto_9035 ) ) ( not ( = ?auto_9026 ?auto_9034 ) ) ( not ( = ?auto_9029 ?auto_9035 ) ) ( not ( = ?auto_9029 ?auto_9034 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9023 ?auto_9024 ?auto_9025 )
      ( MAKE-1CRATE ?auto_9025 ?auto_9026 )
      ( MAKE-3CRATE-VERIFY ?auto_9023 ?auto_9024 ?auto_9025 ?auto_9026 ) )
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
      ?auto_9057 - HOIST
      ?auto_9062 - PLACE
      ?auto_9061 - PLACE
      ?auto_9060 - HOIST
      ?auto_9058 - SURFACE
      ?auto_9067 - SURFACE
      ?auto_9066 - SURFACE
      ?auto_9063 - PLACE
      ?auto_9065 - HOIST
      ?auto_9064 - SURFACE
      ?auto_9059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9057 ?auto_9062 ) ( IS-CRATE ?auto_9056 ) ( not ( = ?auto_9061 ?auto_9062 ) ) ( HOIST-AT ?auto_9060 ?auto_9061 ) ( SURFACE-AT ?auto_9056 ?auto_9061 ) ( ON ?auto_9056 ?auto_9058 ) ( CLEAR ?auto_9056 ) ( not ( = ?auto_9055 ?auto_9056 ) ) ( not ( = ?auto_9055 ?auto_9058 ) ) ( not ( = ?auto_9056 ?auto_9058 ) ) ( not ( = ?auto_9057 ?auto_9060 ) ) ( IS-CRATE ?auto_9055 ) ( SURFACE-AT ?auto_9055 ?auto_9061 ) ( ON ?auto_9055 ?auto_9067 ) ( CLEAR ?auto_9055 ) ( not ( = ?auto_9054 ?auto_9055 ) ) ( not ( = ?auto_9054 ?auto_9067 ) ) ( not ( = ?auto_9055 ?auto_9067 ) ) ( IS-CRATE ?auto_9054 ) ( AVAILABLE ?auto_9060 ) ( SURFACE-AT ?auto_9054 ?auto_9061 ) ( ON ?auto_9054 ?auto_9066 ) ( CLEAR ?auto_9054 ) ( not ( = ?auto_9053 ?auto_9054 ) ) ( not ( = ?auto_9053 ?auto_9066 ) ) ( not ( = ?auto_9054 ?auto_9066 ) ) ( SURFACE-AT ?auto_9052 ?auto_9062 ) ( CLEAR ?auto_9052 ) ( IS-CRATE ?auto_9053 ) ( AVAILABLE ?auto_9057 ) ( not ( = ?auto_9063 ?auto_9062 ) ) ( HOIST-AT ?auto_9065 ?auto_9063 ) ( AVAILABLE ?auto_9065 ) ( SURFACE-AT ?auto_9053 ?auto_9063 ) ( ON ?auto_9053 ?auto_9064 ) ( CLEAR ?auto_9053 ) ( TRUCK-AT ?auto_9059 ?auto_9062 ) ( not ( = ?auto_9052 ?auto_9053 ) ) ( not ( = ?auto_9052 ?auto_9064 ) ) ( not ( = ?auto_9053 ?auto_9064 ) ) ( not ( = ?auto_9057 ?auto_9065 ) ) ( not ( = ?auto_9052 ?auto_9054 ) ) ( not ( = ?auto_9052 ?auto_9066 ) ) ( not ( = ?auto_9054 ?auto_9064 ) ) ( not ( = ?auto_9061 ?auto_9063 ) ) ( not ( = ?auto_9060 ?auto_9065 ) ) ( not ( = ?auto_9066 ?auto_9064 ) ) ( not ( = ?auto_9052 ?auto_9055 ) ) ( not ( = ?auto_9052 ?auto_9067 ) ) ( not ( = ?auto_9053 ?auto_9055 ) ) ( not ( = ?auto_9053 ?auto_9067 ) ) ( not ( = ?auto_9055 ?auto_9066 ) ) ( not ( = ?auto_9055 ?auto_9064 ) ) ( not ( = ?auto_9067 ?auto_9066 ) ) ( not ( = ?auto_9067 ?auto_9064 ) ) ( not ( = ?auto_9052 ?auto_9056 ) ) ( not ( = ?auto_9052 ?auto_9058 ) ) ( not ( = ?auto_9053 ?auto_9056 ) ) ( not ( = ?auto_9053 ?auto_9058 ) ) ( not ( = ?auto_9054 ?auto_9056 ) ) ( not ( = ?auto_9054 ?auto_9058 ) ) ( not ( = ?auto_9056 ?auto_9067 ) ) ( not ( = ?auto_9056 ?auto_9066 ) ) ( not ( = ?auto_9056 ?auto_9064 ) ) ( not ( = ?auto_9058 ?auto_9067 ) ) ( not ( = ?auto_9058 ?auto_9066 ) ) ( not ( = ?auto_9058 ?auto_9064 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_9052 ?auto_9053 ?auto_9054 ?auto_9055 )
      ( MAKE-1CRATE ?auto_9055 ?auto_9056 )
      ( MAKE-4CRATE-VERIFY ?auto_9052 ?auto_9053 ?auto_9054 ?auto_9055 ?auto_9056 ) )
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
      ?auto_9094 - HOIST
      ?auto_9091 - PLACE
      ?auto_9092 - PLACE
      ?auto_9090 - HOIST
      ?auto_9095 - SURFACE
      ?auto_9098 - PLACE
      ?auto_9100 - HOIST
      ?auto_9099 - SURFACE
      ?auto_9097 - SURFACE
      ?auto_9096 - SURFACE
      ?auto_9102 - PLACE
      ?auto_9101 - HOIST
      ?auto_9103 - SURFACE
      ?auto_9093 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9094 ?auto_9091 ) ( IS-CRATE ?auto_9089 ) ( not ( = ?auto_9092 ?auto_9091 ) ) ( HOIST-AT ?auto_9090 ?auto_9092 ) ( AVAILABLE ?auto_9090 ) ( SURFACE-AT ?auto_9089 ?auto_9092 ) ( ON ?auto_9089 ?auto_9095 ) ( CLEAR ?auto_9089 ) ( not ( = ?auto_9088 ?auto_9089 ) ) ( not ( = ?auto_9088 ?auto_9095 ) ) ( not ( = ?auto_9089 ?auto_9095 ) ) ( not ( = ?auto_9094 ?auto_9090 ) ) ( IS-CRATE ?auto_9088 ) ( not ( = ?auto_9098 ?auto_9091 ) ) ( HOIST-AT ?auto_9100 ?auto_9098 ) ( SURFACE-AT ?auto_9088 ?auto_9098 ) ( ON ?auto_9088 ?auto_9099 ) ( CLEAR ?auto_9088 ) ( not ( = ?auto_9087 ?auto_9088 ) ) ( not ( = ?auto_9087 ?auto_9099 ) ) ( not ( = ?auto_9088 ?auto_9099 ) ) ( not ( = ?auto_9094 ?auto_9100 ) ) ( IS-CRATE ?auto_9087 ) ( SURFACE-AT ?auto_9087 ?auto_9098 ) ( ON ?auto_9087 ?auto_9097 ) ( CLEAR ?auto_9087 ) ( not ( = ?auto_9086 ?auto_9087 ) ) ( not ( = ?auto_9086 ?auto_9097 ) ) ( not ( = ?auto_9087 ?auto_9097 ) ) ( IS-CRATE ?auto_9086 ) ( AVAILABLE ?auto_9100 ) ( SURFACE-AT ?auto_9086 ?auto_9098 ) ( ON ?auto_9086 ?auto_9096 ) ( CLEAR ?auto_9086 ) ( not ( = ?auto_9085 ?auto_9086 ) ) ( not ( = ?auto_9085 ?auto_9096 ) ) ( not ( = ?auto_9086 ?auto_9096 ) ) ( SURFACE-AT ?auto_9084 ?auto_9091 ) ( CLEAR ?auto_9084 ) ( IS-CRATE ?auto_9085 ) ( AVAILABLE ?auto_9094 ) ( not ( = ?auto_9102 ?auto_9091 ) ) ( HOIST-AT ?auto_9101 ?auto_9102 ) ( AVAILABLE ?auto_9101 ) ( SURFACE-AT ?auto_9085 ?auto_9102 ) ( ON ?auto_9085 ?auto_9103 ) ( CLEAR ?auto_9085 ) ( TRUCK-AT ?auto_9093 ?auto_9091 ) ( not ( = ?auto_9084 ?auto_9085 ) ) ( not ( = ?auto_9084 ?auto_9103 ) ) ( not ( = ?auto_9085 ?auto_9103 ) ) ( not ( = ?auto_9094 ?auto_9101 ) ) ( not ( = ?auto_9084 ?auto_9086 ) ) ( not ( = ?auto_9084 ?auto_9096 ) ) ( not ( = ?auto_9086 ?auto_9103 ) ) ( not ( = ?auto_9098 ?auto_9102 ) ) ( not ( = ?auto_9100 ?auto_9101 ) ) ( not ( = ?auto_9096 ?auto_9103 ) ) ( not ( = ?auto_9084 ?auto_9087 ) ) ( not ( = ?auto_9084 ?auto_9097 ) ) ( not ( = ?auto_9085 ?auto_9087 ) ) ( not ( = ?auto_9085 ?auto_9097 ) ) ( not ( = ?auto_9087 ?auto_9096 ) ) ( not ( = ?auto_9087 ?auto_9103 ) ) ( not ( = ?auto_9097 ?auto_9096 ) ) ( not ( = ?auto_9097 ?auto_9103 ) ) ( not ( = ?auto_9084 ?auto_9088 ) ) ( not ( = ?auto_9084 ?auto_9099 ) ) ( not ( = ?auto_9085 ?auto_9088 ) ) ( not ( = ?auto_9085 ?auto_9099 ) ) ( not ( = ?auto_9086 ?auto_9088 ) ) ( not ( = ?auto_9086 ?auto_9099 ) ) ( not ( = ?auto_9088 ?auto_9097 ) ) ( not ( = ?auto_9088 ?auto_9096 ) ) ( not ( = ?auto_9088 ?auto_9103 ) ) ( not ( = ?auto_9099 ?auto_9097 ) ) ( not ( = ?auto_9099 ?auto_9096 ) ) ( not ( = ?auto_9099 ?auto_9103 ) ) ( not ( = ?auto_9084 ?auto_9089 ) ) ( not ( = ?auto_9084 ?auto_9095 ) ) ( not ( = ?auto_9085 ?auto_9089 ) ) ( not ( = ?auto_9085 ?auto_9095 ) ) ( not ( = ?auto_9086 ?auto_9089 ) ) ( not ( = ?auto_9086 ?auto_9095 ) ) ( not ( = ?auto_9087 ?auto_9089 ) ) ( not ( = ?auto_9087 ?auto_9095 ) ) ( not ( = ?auto_9089 ?auto_9099 ) ) ( not ( = ?auto_9089 ?auto_9097 ) ) ( not ( = ?auto_9089 ?auto_9096 ) ) ( not ( = ?auto_9089 ?auto_9103 ) ) ( not ( = ?auto_9092 ?auto_9098 ) ) ( not ( = ?auto_9092 ?auto_9102 ) ) ( not ( = ?auto_9090 ?auto_9100 ) ) ( not ( = ?auto_9090 ?auto_9101 ) ) ( not ( = ?auto_9095 ?auto_9099 ) ) ( not ( = ?auto_9095 ?auto_9097 ) ) ( not ( = ?auto_9095 ?auto_9096 ) ) ( not ( = ?auto_9095 ?auto_9103 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_9084 ?auto_9085 ?auto_9086 ?auto_9087 ?auto_9088 )
      ( MAKE-1CRATE ?auto_9088 ?auto_9089 )
      ( MAKE-5CRATE-VERIFY ?auto_9084 ?auto_9085 ?auto_9086 ?auto_9087 ?auto_9088 ?auto_9089 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_9121 - SURFACE
      ?auto_9122 - SURFACE
      ?auto_9123 - SURFACE
      ?auto_9124 - SURFACE
      ?auto_9125 - SURFACE
      ?auto_9126 - SURFACE
      ?auto_9127 - SURFACE
    )
    :vars
    (
      ?auto_9133 - HOIST
      ?auto_9131 - PLACE
      ?auto_9128 - PLACE
      ?auto_9129 - HOIST
      ?auto_9132 - SURFACE
      ?auto_9143 - PLACE
      ?auto_9137 - HOIST
      ?auto_9144 - SURFACE
      ?auto_9138 - PLACE
      ?auto_9134 - HOIST
      ?auto_9142 - SURFACE
      ?auto_9141 - SURFACE
      ?auto_9139 - SURFACE
      ?auto_9140 - PLACE
      ?auto_9135 - HOIST
      ?auto_9136 - SURFACE
      ?auto_9130 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9133 ?auto_9131 ) ( IS-CRATE ?auto_9127 ) ( not ( = ?auto_9128 ?auto_9131 ) ) ( HOIST-AT ?auto_9129 ?auto_9128 ) ( AVAILABLE ?auto_9129 ) ( SURFACE-AT ?auto_9127 ?auto_9128 ) ( ON ?auto_9127 ?auto_9132 ) ( CLEAR ?auto_9127 ) ( not ( = ?auto_9126 ?auto_9127 ) ) ( not ( = ?auto_9126 ?auto_9132 ) ) ( not ( = ?auto_9127 ?auto_9132 ) ) ( not ( = ?auto_9133 ?auto_9129 ) ) ( IS-CRATE ?auto_9126 ) ( not ( = ?auto_9143 ?auto_9131 ) ) ( HOIST-AT ?auto_9137 ?auto_9143 ) ( AVAILABLE ?auto_9137 ) ( SURFACE-AT ?auto_9126 ?auto_9143 ) ( ON ?auto_9126 ?auto_9144 ) ( CLEAR ?auto_9126 ) ( not ( = ?auto_9125 ?auto_9126 ) ) ( not ( = ?auto_9125 ?auto_9144 ) ) ( not ( = ?auto_9126 ?auto_9144 ) ) ( not ( = ?auto_9133 ?auto_9137 ) ) ( IS-CRATE ?auto_9125 ) ( not ( = ?auto_9138 ?auto_9131 ) ) ( HOIST-AT ?auto_9134 ?auto_9138 ) ( SURFACE-AT ?auto_9125 ?auto_9138 ) ( ON ?auto_9125 ?auto_9142 ) ( CLEAR ?auto_9125 ) ( not ( = ?auto_9124 ?auto_9125 ) ) ( not ( = ?auto_9124 ?auto_9142 ) ) ( not ( = ?auto_9125 ?auto_9142 ) ) ( not ( = ?auto_9133 ?auto_9134 ) ) ( IS-CRATE ?auto_9124 ) ( SURFACE-AT ?auto_9124 ?auto_9138 ) ( ON ?auto_9124 ?auto_9141 ) ( CLEAR ?auto_9124 ) ( not ( = ?auto_9123 ?auto_9124 ) ) ( not ( = ?auto_9123 ?auto_9141 ) ) ( not ( = ?auto_9124 ?auto_9141 ) ) ( IS-CRATE ?auto_9123 ) ( AVAILABLE ?auto_9134 ) ( SURFACE-AT ?auto_9123 ?auto_9138 ) ( ON ?auto_9123 ?auto_9139 ) ( CLEAR ?auto_9123 ) ( not ( = ?auto_9122 ?auto_9123 ) ) ( not ( = ?auto_9122 ?auto_9139 ) ) ( not ( = ?auto_9123 ?auto_9139 ) ) ( SURFACE-AT ?auto_9121 ?auto_9131 ) ( CLEAR ?auto_9121 ) ( IS-CRATE ?auto_9122 ) ( AVAILABLE ?auto_9133 ) ( not ( = ?auto_9140 ?auto_9131 ) ) ( HOIST-AT ?auto_9135 ?auto_9140 ) ( AVAILABLE ?auto_9135 ) ( SURFACE-AT ?auto_9122 ?auto_9140 ) ( ON ?auto_9122 ?auto_9136 ) ( CLEAR ?auto_9122 ) ( TRUCK-AT ?auto_9130 ?auto_9131 ) ( not ( = ?auto_9121 ?auto_9122 ) ) ( not ( = ?auto_9121 ?auto_9136 ) ) ( not ( = ?auto_9122 ?auto_9136 ) ) ( not ( = ?auto_9133 ?auto_9135 ) ) ( not ( = ?auto_9121 ?auto_9123 ) ) ( not ( = ?auto_9121 ?auto_9139 ) ) ( not ( = ?auto_9123 ?auto_9136 ) ) ( not ( = ?auto_9138 ?auto_9140 ) ) ( not ( = ?auto_9134 ?auto_9135 ) ) ( not ( = ?auto_9139 ?auto_9136 ) ) ( not ( = ?auto_9121 ?auto_9124 ) ) ( not ( = ?auto_9121 ?auto_9141 ) ) ( not ( = ?auto_9122 ?auto_9124 ) ) ( not ( = ?auto_9122 ?auto_9141 ) ) ( not ( = ?auto_9124 ?auto_9139 ) ) ( not ( = ?auto_9124 ?auto_9136 ) ) ( not ( = ?auto_9141 ?auto_9139 ) ) ( not ( = ?auto_9141 ?auto_9136 ) ) ( not ( = ?auto_9121 ?auto_9125 ) ) ( not ( = ?auto_9121 ?auto_9142 ) ) ( not ( = ?auto_9122 ?auto_9125 ) ) ( not ( = ?auto_9122 ?auto_9142 ) ) ( not ( = ?auto_9123 ?auto_9125 ) ) ( not ( = ?auto_9123 ?auto_9142 ) ) ( not ( = ?auto_9125 ?auto_9141 ) ) ( not ( = ?auto_9125 ?auto_9139 ) ) ( not ( = ?auto_9125 ?auto_9136 ) ) ( not ( = ?auto_9142 ?auto_9141 ) ) ( not ( = ?auto_9142 ?auto_9139 ) ) ( not ( = ?auto_9142 ?auto_9136 ) ) ( not ( = ?auto_9121 ?auto_9126 ) ) ( not ( = ?auto_9121 ?auto_9144 ) ) ( not ( = ?auto_9122 ?auto_9126 ) ) ( not ( = ?auto_9122 ?auto_9144 ) ) ( not ( = ?auto_9123 ?auto_9126 ) ) ( not ( = ?auto_9123 ?auto_9144 ) ) ( not ( = ?auto_9124 ?auto_9126 ) ) ( not ( = ?auto_9124 ?auto_9144 ) ) ( not ( = ?auto_9126 ?auto_9142 ) ) ( not ( = ?auto_9126 ?auto_9141 ) ) ( not ( = ?auto_9126 ?auto_9139 ) ) ( not ( = ?auto_9126 ?auto_9136 ) ) ( not ( = ?auto_9143 ?auto_9138 ) ) ( not ( = ?auto_9143 ?auto_9140 ) ) ( not ( = ?auto_9137 ?auto_9134 ) ) ( not ( = ?auto_9137 ?auto_9135 ) ) ( not ( = ?auto_9144 ?auto_9142 ) ) ( not ( = ?auto_9144 ?auto_9141 ) ) ( not ( = ?auto_9144 ?auto_9139 ) ) ( not ( = ?auto_9144 ?auto_9136 ) ) ( not ( = ?auto_9121 ?auto_9127 ) ) ( not ( = ?auto_9121 ?auto_9132 ) ) ( not ( = ?auto_9122 ?auto_9127 ) ) ( not ( = ?auto_9122 ?auto_9132 ) ) ( not ( = ?auto_9123 ?auto_9127 ) ) ( not ( = ?auto_9123 ?auto_9132 ) ) ( not ( = ?auto_9124 ?auto_9127 ) ) ( not ( = ?auto_9124 ?auto_9132 ) ) ( not ( = ?auto_9125 ?auto_9127 ) ) ( not ( = ?auto_9125 ?auto_9132 ) ) ( not ( = ?auto_9127 ?auto_9144 ) ) ( not ( = ?auto_9127 ?auto_9142 ) ) ( not ( = ?auto_9127 ?auto_9141 ) ) ( not ( = ?auto_9127 ?auto_9139 ) ) ( not ( = ?auto_9127 ?auto_9136 ) ) ( not ( = ?auto_9128 ?auto_9143 ) ) ( not ( = ?auto_9128 ?auto_9138 ) ) ( not ( = ?auto_9128 ?auto_9140 ) ) ( not ( = ?auto_9129 ?auto_9137 ) ) ( not ( = ?auto_9129 ?auto_9134 ) ) ( not ( = ?auto_9129 ?auto_9135 ) ) ( not ( = ?auto_9132 ?auto_9144 ) ) ( not ( = ?auto_9132 ?auto_9142 ) ) ( not ( = ?auto_9132 ?auto_9141 ) ) ( not ( = ?auto_9132 ?auto_9139 ) ) ( not ( = ?auto_9132 ?auto_9136 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_9121 ?auto_9122 ?auto_9123 ?auto_9124 ?auto_9125 ?auto_9126 )
      ( MAKE-1CRATE ?auto_9126 ?auto_9127 )
      ( MAKE-6CRATE-VERIFY ?auto_9121 ?auto_9122 ?auto_9123 ?auto_9124 ?auto_9125 ?auto_9126 ?auto_9127 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_9163 - SURFACE
      ?auto_9164 - SURFACE
      ?auto_9165 - SURFACE
      ?auto_9166 - SURFACE
      ?auto_9167 - SURFACE
      ?auto_9168 - SURFACE
      ?auto_9169 - SURFACE
      ?auto_9170 - SURFACE
    )
    :vars
    (
      ?auto_9175 - HOIST
      ?auto_9174 - PLACE
      ?auto_9171 - PLACE
      ?auto_9176 - HOIST
      ?auto_9172 - SURFACE
      ?auto_9185 - PLACE
      ?auto_9190 - HOIST
      ?auto_9188 - SURFACE
      ?auto_9180 - PLACE
      ?auto_9186 - HOIST
      ?auto_9184 - SURFACE
      ?auto_9183 - PLACE
      ?auto_9177 - HOIST
      ?auto_9178 - SURFACE
      ?auto_9181 - SURFACE
      ?auto_9187 - SURFACE
      ?auto_9182 - PLACE
      ?auto_9189 - HOIST
      ?auto_9179 - SURFACE
      ?auto_9173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9175 ?auto_9174 ) ( IS-CRATE ?auto_9170 ) ( not ( = ?auto_9171 ?auto_9174 ) ) ( HOIST-AT ?auto_9176 ?auto_9171 ) ( AVAILABLE ?auto_9176 ) ( SURFACE-AT ?auto_9170 ?auto_9171 ) ( ON ?auto_9170 ?auto_9172 ) ( CLEAR ?auto_9170 ) ( not ( = ?auto_9169 ?auto_9170 ) ) ( not ( = ?auto_9169 ?auto_9172 ) ) ( not ( = ?auto_9170 ?auto_9172 ) ) ( not ( = ?auto_9175 ?auto_9176 ) ) ( IS-CRATE ?auto_9169 ) ( not ( = ?auto_9185 ?auto_9174 ) ) ( HOIST-AT ?auto_9190 ?auto_9185 ) ( AVAILABLE ?auto_9190 ) ( SURFACE-AT ?auto_9169 ?auto_9185 ) ( ON ?auto_9169 ?auto_9188 ) ( CLEAR ?auto_9169 ) ( not ( = ?auto_9168 ?auto_9169 ) ) ( not ( = ?auto_9168 ?auto_9188 ) ) ( not ( = ?auto_9169 ?auto_9188 ) ) ( not ( = ?auto_9175 ?auto_9190 ) ) ( IS-CRATE ?auto_9168 ) ( not ( = ?auto_9180 ?auto_9174 ) ) ( HOIST-AT ?auto_9186 ?auto_9180 ) ( AVAILABLE ?auto_9186 ) ( SURFACE-AT ?auto_9168 ?auto_9180 ) ( ON ?auto_9168 ?auto_9184 ) ( CLEAR ?auto_9168 ) ( not ( = ?auto_9167 ?auto_9168 ) ) ( not ( = ?auto_9167 ?auto_9184 ) ) ( not ( = ?auto_9168 ?auto_9184 ) ) ( not ( = ?auto_9175 ?auto_9186 ) ) ( IS-CRATE ?auto_9167 ) ( not ( = ?auto_9183 ?auto_9174 ) ) ( HOIST-AT ?auto_9177 ?auto_9183 ) ( SURFACE-AT ?auto_9167 ?auto_9183 ) ( ON ?auto_9167 ?auto_9178 ) ( CLEAR ?auto_9167 ) ( not ( = ?auto_9166 ?auto_9167 ) ) ( not ( = ?auto_9166 ?auto_9178 ) ) ( not ( = ?auto_9167 ?auto_9178 ) ) ( not ( = ?auto_9175 ?auto_9177 ) ) ( IS-CRATE ?auto_9166 ) ( SURFACE-AT ?auto_9166 ?auto_9183 ) ( ON ?auto_9166 ?auto_9181 ) ( CLEAR ?auto_9166 ) ( not ( = ?auto_9165 ?auto_9166 ) ) ( not ( = ?auto_9165 ?auto_9181 ) ) ( not ( = ?auto_9166 ?auto_9181 ) ) ( IS-CRATE ?auto_9165 ) ( AVAILABLE ?auto_9177 ) ( SURFACE-AT ?auto_9165 ?auto_9183 ) ( ON ?auto_9165 ?auto_9187 ) ( CLEAR ?auto_9165 ) ( not ( = ?auto_9164 ?auto_9165 ) ) ( not ( = ?auto_9164 ?auto_9187 ) ) ( not ( = ?auto_9165 ?auto_9187 ) ) ( SURFACE-AT ?auto_9163 ?auto_9174 ) ( CLEAR ?auto_9163 ) ( IS-CRATE ?auto_9164 ) ( AVAILABLE ?auto_9175 ) ( not ( = ?auto_9182 ?auto_9174 ) ) ( HOIST-AT ?auto_9189 ?auto_9182 ) ( AVAILABLE ?auto_9189 ) ( SURFACE-AT ?auto_9164 ?auto_9182 ) ( ON ?auto_9164 ?auto_9179 ) ( CLEAR ?auto_9164 ) ( TRUCK-AT ?auto_9173 ?auto_9174 ) ( not ( = ?auto_9163 ?auto_9164 ) ) ( not ( = ?auto_9163 ?auto_9179 ) ) ( not ( = ?auto_9164 ?auto_9179 ) ) ( not ( = ?auto_9175 ?auto_9189 ) ) ( not ( = ?auto_9163 ?auto_9165 ) ) ( not ( = ?auto_9163 ?auto_9187 ) ) ( not ( = ?auto_9165 ?auto_9179 ) ) ( not ( = ?auto_9183 ?auto_9182 ) ) ( not ( = ?auto_9177 ?auto_9189 ) ) ( not ( = ?auto_9187 ?auto_9179 ) ) ( not ( = ?auto_9163 ?auto_9166 ) ) ( not ( = ?auto_9163 ?auto_9181 ) ) ( not ( = ?auto_9164 ?auto_9166 ) ) ( not ( = ?auto_9164 ?auto_9181 ) ) ( not ( = ?auto_9166 ?auto_9187 ) ) ( not ( = ?auto_9166 ?auto_9179 ) ) ( not ( = ?auto_9181 ?auto_9187 ) ) ( not ( = ?auto_9181 ?auto_9179 ) ) ( not ( = ?auto_9163 ?auto_9167 ) ) ( not ( = ?auto_9163 ?auto_9178 ) ) ( not ( = ?auto_9164 ?auto_9167 ) ) ( not ( = ?auto_9164 ?auto_9178 ) ) ( not ( = ?auto_9165 ?auto_9167 ) ) ( not ( = ?auto_9165 ?auto_9178 ) ) ( not ( = ?auto_9167 ?auto_9181 ) ) ( not ( = ?auto_9167 ?auto_9187 ) ) ( not ( = ?auto_9167 ?auto_9179 ) ) ( not ( = ?auto_9178 ?auto_9181 ) ) ( not ( = ?auto_9178 ?auto_9187 ) ) ( not ( = ?auto_9178 ?auto_9179 ) ) ( not ( = ?auto_9163 ?auto_9168 ) ) ( not ( = ?auto_9163 ?auto_9184 ) ) ( not ( = ?auto_9164 ?auto_9168 ) ) ( not ( = ?auto_9164 ?auto_9184 ) ) ( not ( = ?auto_9165 ?auto_9168 ) ) ( not ( = ?auto_9165 ?auto_9184 ) ) ( not ( = ?auto_9166 ?auto_9168 ) ) ( not ( = ?auto_9166 ?auto_9184 ) ) ( not ( = ?auto_9168 ?auto_9178 ) ) ( not ( = ?auto_9168 ?auto_9181 ) ) ( not ( = ?auto_9168 ?auto_9187 ) ) ( not ( = ?auto_9168 ?auto_9179 ) ) ( not ( = ?auto_9180 ?auto_9183 ) ) ( not ( = ?auto_9180 ?auto_9182 ) ) ( not ( = ?auto_9186 ?auto_9177 ) ) ( not ( = ?auto_9186 ?auto_9189 ) ) ( not ( = ?auto_9184 ?auto_9178 ) ) ( not ( = ?auto_9184 ?auto_9181 ) ) ( not ( = ?auto_9184 ?auto_9187 ) ) ( not ( = ?auto_9184 ?auto_9179 ) ) ( not ( = ?auto_9163 ?auto_9169 ) ) ( not ( = ?auto_9163 ?auto_9188 ) ) ( not ( = ?auto_9164 ?auto_9169 ) ) ( not ( = ?auto_9164 ?auto_9188 ) ) ( not ( = ?auto_9165 ?auto_9169 ) ) ( not ( = ?auto_9165 ?auto_9188 ) ) ( not ( = ?auto_9166 ?auto_9169 ) ) ( not ( = ?auto_9166 ?auto_9188 ) ) ( not ( = ?auto_9167 ?auto_9169 ) ) ( not ( = ?auto_9167 ?auto_9188 ) ) ( not ( = ?auto_9169 ?auto_9184 ) ) ( not ( = ?auto_9169 ?auto_9178 ) ) ( not ( = ?auto_9169 ?auto_9181 ) ) ( not ( = ?auto_9169 ?auto_9187 ) ) ( not ( = ?auto_9169 ?auto_9179 ) ) ( not ( = ?auto_9185 ?auto_9180 ) ) ( not ( = ?auto_9185 ?auto_9183 ) ) ( not ( = ?auto_9185 ?auto_9182 ) ) ( not ( = ?auto_9190 ?auto_9186 ) ) ( not ( = ?auto_9190 ?auto_9177 ) ) ( not ( = ?auto_9190 ?auto_9189 ) ) ( not ( = ?auto_9188 ?auto_9184 ) ) ( not ( = ?auto_9188 ?auto_9178 ) ) ( not ( = ?auto_9188 ?auto_9181 ) ) ( not ( = ?auto_9188 ?auto_9187 ) ) ( not ( = ?auto_9188 ?auto_9179 ) ) ( not ( = ?auto_9163 ?auto_9170 ) ) ( not ( = ?auto_9163 ?auto_9172 ) ) ( not ( = ?auto_9164 ?auto_9170 ) ) ( not ( = ?auto_9164 ?auto_9172 ) ) ( not ( = ?auto_9165 ?auto_9170 ) ) ( not ( = ?auto_9165 ?auto_9172 ) ) ( not ( = ?auto_9166 ?auto_9170 ) ) ( not ( = ?auto_9166 ?auto_9172 ) ) ( not ( = ?auto_9167 ?auto_9170 ) ) ( not ( = ?auto_9167 ?auto_9172 ) ) ( not ( = ?auto_9168 ?auto_9170 ) ) ( not ( = ?auto_9168 ?auto_9172 ) ) ( not ( = ?auto_9170 ?auto_9188 ) ) ( not ( = ?auto_9170 ?auto_9184 ) ) ( not ( = ?auto_9170 ?auto_9178 ) ) ( not ( = ?auto_9170 ?auto_9181 ) ) ( not ( = ?auto_9170 ?auto_9187 ) ) ( not ( = ?auto_9170 ?auto_9179 ) ) ( not ( = ?auto_9171 ?auto_9185 ) ) ( not ( = ?auto_9171 ?auto_9180 ) ) ( not ( = ?auto_9171 ?auto_9183 ) ) ( not ( = ?auto_9171 ?auto_9182 ) ) ( not ( = ?auto_9176 ?auto_9190 ) ) ( not ( = ?auto_9176 ?auto_9186 ) ) ( not ( = ?auto_9176 ?auto_9177 ) ) ( not ( = ?auto_9176 ?auto_9189 ) ) ( not ( = ?auto_9172 ?auto_9188 ) ) ( not ( = ?auto_9172 ?auto_9184 ) ) ( not ( = ?auto_9172 ?auto_9178 ) ) ( not ( = ?auto_9172 ?auto_9181 ) ) ( not ( = ?auto_9172 ?auto_9187 ) ) ( not ( = ?auto_9172 ?auto_9179 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_9163 ?auto_9164 ?auto_9165 ?auto_9166 ?auto_9167 ?auto_9168 ?auto_9169 )
      ( MAKE-1CRATE ?auto_9169 ?auto_9170 )
      ( MAKE-7CRATE-VERIFY ?auto_9163 ?auto_9164 ?auto_9165 ?auto_9166 ?auto_9167 ?auto_9168 ?auto_9169 ?auto_9170 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_9210 - SURFACE
      ?auto_9211 - SURFACE
      ?auto_9212 - SURFACE
      ?auto_9213 - SURFACE
      ?auto_9214 - SURFACE
      ?auto_9215 - SURFACE
      ?auto_9216 - SURFACE
      ?auto_9217 - SURFACE
      ?auto_9218 - SURFACE
    )
    :vars
    (
      ?auto_9221 - HOIST
      ?auto_9219 - PLACE
      ?auto_9220 - PLACE
      ?auto_9222 - HOIST
      ?auto_9224 - SURFACE
      ?auto_9232 - PLACE
      ?auto_9237 - HOIST
      ?auto_9238 - SURFACE
      ?auto_9228 - PLACE
      ?auto_9236 - HOIST
      ?auto_9241 - SURFACE
      ?auto_9225 - PLACE
      ?auto_9229 - HOIST
      ?auto_9226 - SURFACE
      ?auto_9227 - PLACE
      ?auto_9235 - HOIST
      ?auto_9230 - SURFACE
      ?auto_9240 - SURFACE
      ?auto_9234 - SURFACE
      ?auto_9233 - PLACE
      ?auto_9239 - HOIST
      ?auto_9231 - SURFACE
      ?auto_9223 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9221 ?auto_9219 ) ( IS-CRATE ?auto_9218 ) ( not ( = ?auto_9220 ?auto_9219 ) ) ( HOIST-AT ?auto_9222 ?auto_9220 ) ( AVAILABLE ?auto_9222 ) ( SURFACE-AT ?auto_9218 ?auto_9220 ) ( ON ?auto_9218 ?auto_9224 ) ( CLEAR ?auto_9218 ) ( not ( = ?auto_9217 ?auto_9218 ) ) ( not ( = ?auto_9217 ?auto_9224 ) ) ( not ( = ?auto_9218 ?auto_9224 ) ) ( not ( = ?auto_9221 ?auto_9222 ) ) ( IS-CRATE ?auto_9217 ) ( not ( = ?auto_9232 ?auto_9219 ) ) ( HOIST-AT ?auto_9237 ?auto_9232 ) ( AVAILABLE ?auto_9237 ) ( SURFACE-AT ?auto_9217 ?auto_9232 ) ( ON ?auto_9217 ?auto_9238 ) ( CLEAR ?auto_9217 ) ( not ( = ?auto_9216 ?auto_9217 ) ) ( not ( = ?auto_9216 ?auto_9238 ) ) ( not ( = ?auto_9217 ?auto_9238 ) ) ( not ( = ?auto_9221 ?auto_9237 ) ) ( IS-CRATE ?auto_9216 ) ( not ( = ?auto_9228 ?auto_9219 ) ) ( HOIST-AT ?auto_9236 ?auto_9228 ) ( AVAILABLE ?auto_9236 ) ( SURFACE-AT ?auto_9216 ?auto_9228 ) ( ON ?auto_9216 ?auto_9241 ) ( CLEAR ?auto_9216 ) ( not ( = ?auto_9215 ?auto_9216 ) ) ( not ( = ?auto_9215 ?auto_9241 ) ) ( not ( = ?auto_9216 ?auto_9241 ) ) ( not ( = ?auto_9221 ?auto_9236 ) ) ( IS-CRATE ?auto_9215 ) ( not ( = ?auto_9225 ?auto_9219 ) ) ( HOIST-AT ?auto_9229 ?auto_9225 ) ( AVAILABLE ?auto_9229 ) ( SURFACE-AT ?auto_9215 ?auto_9225 ) ( ON ?auto_9215 ?auto_9226 ) ( CLEAR ?auto_9215 ) ( not ( = ?auto_9214 ?auto_9215 ) ) ( not ( = ?auto_9214 ?auto_9226 ) ) ( not ( = ?auto_9215 ?auto_9226 ) ) ( not ( = ?auto_9221 ?auto_9229 ) ) ( IS-CRATE ?auto_9214 ) ( not ( = ?auto_9227 ?auto_9219 ) ) ( HOIST-AT ?auto_9235 ?auto_9227 ) ( SURFACE-AT ?auto_9214 ?auto_9227 ) ( ON ?auto_9214 ?auto_9230 ) ( CLEAR ?auto_9214 ) ( not ( = ?auto_9213 ?auto_9214 ) ) ( not ( = ?auto_9213 ?auto_9230 ) ) ( not ( = ?auto_9214 ?auto_9230 ) ) ( not ( = ?auto_9221 ?auto_9235 ) ) ( IS-CRATE ?auto_9213 ) ( SURFACE-AT ?auto_9213 ?auto_9227 ) ( ON ?auto_9213 ?auto_9240 ) ( CLEAR ?auto_9213 ) ( not ( = ?auto_9212 ?auto_9213 ) ) ( not ( = ?auto_9212 ?auto_9240 ) ) ( not ( = ?auto_9213 ?auto_9240 ) ) ( IS-CRATE ?auto_9212 ) ( AVAILABLE ?auto_9235 ) ( SURFACE-AT ?auto_9212 ?auto_9227 ) ( ON ?auto_9212 ?auto_9234 ) ( CLEAR ?auto_9212 ) ( not ( = ?auto_9211 ?auto_9212 ) ) ( not ( = ?auto_9211 ?auto_9234 ) ) ( not ( = ?auto_9212 ?auto_9234 ) ) ( SURFACE-AT ?auto_9210 ?auto_9219 ) ( CLEAR ?auto_9210 ) ( IS-CRATE ?auto_9211 ) ( AVAILABLE ?auto_9221 ) ( not ( = ?auto_9233 ?auto_9219 ) ) ( HOIST-AT ?auto_9239 ?auto_9233 ) ( AVAILABLE ?auto_9239 ) ( SURFACE-AT ?auto_9211 ?auto_9233 ) ( ON ?auto_9211 ?auto_9231 ) ( CLEAR ?auto_9211 ) ( TRUCK-AT ?auto_9223 ?auto_9219 ) ( not ( = ?auto_9210 ?auto_9211 ) ) ( not ( = ?auto_9210 ?auto_9231 ) ) ( not ( = ?auto_9211 ?auto_9231 ) ) ( not ( = ?auto_9221 ?auto_9239 ) ) ( not ( = ?auto_9210 ?auto_9212 ) ) ( not ( = ?auto_9210 ?auto_9234 ) ) ( not ( = ?auto_9212 ?auto_9231 ) ) ( not ( = ?auto_9227 ?auto_9233 ) ) ( not ( = ?auto_9235 ?auto_9239 ) ) ( not ( = ?auto_9234 ?auto_9231 ) ) ( not ( = ?auto_9210 ?auto_9213 ) ) ( not ( = ?auto_9210 ?auto_9240 ) ) ( not ( = ?auto_9211 ?auto_9213 ) ) ( not ( = ?auto_9211 ?auto_9240 ) ) ( not ( = ?auto_9213 ?auto_9234 ) ) ( not ( = ?auto_9213 ?auto_9231 ) ) ( not ( = ?auto_9240 ?auto_9234 ) ) ( not ( = ?auto_9240 ?auto_9231 ) ) ( not ( = ?auto_9210 ?auto_9214 ) ) ( not ( = ?auto_9210 ?auto_9230 ) ) ( not ( = ?auto_9211 ?auto_9214 ) ) ( not ( = ?auto_9211 ?auto_9230 ) ) ( not ( = ?auto_9212 ?auto_9214 ) ) ( not ( = ?auto_9212 ?auto_9230 ) ) ( not ( = ?auto_9214 ?auto_9240 ) ) ( not ( = ?auto_9214 ?auto_9234 ) ) ( not ( = ?auto_9214 ?auto_9231 ) ) ( not ( = ?auto_9230 ?auto_9240 ) ) ( not ( = ?auto_9230 ?auto_9234 ) ) ( not ( = ?auto_9230 ?auto_9231 ) ) ( not ( = ?auto_9210 ?auto_9215 ) ) ( not ( = ?auto_9210 ?auto_9226 ) ) ( not ( = ?auto_9211 ?auto_9215 ) ) ( not ( = ?auto_9211 ?auto_9226 ) ) ( not ( = ?auto_9212 ?auto_9215 ) ) ( not ( = ?auto_9212 ?auto_9226 ) ) ( not ( = ?auto_9213 ?auto_9215 ) ) ( not ( = ?auto_9213 ?auto_9226 ) ) ( not ( = ?auto_9215 ?auto_9230 ) ) ( not ( = ?auto_9215 ?auto_9240 ) ) ( not ( = ?auto_9215 ?auto_9234 ) ) ( not ( = ?auto_9215 ?auto_9231 ) ) ( not ( = ?auto_9225 ?auto_9227 ) ) ( not ( = ?auto_9225 ?auto_9233 ) ) ( not ( = ?auto_9229 ?auto_9235 ) ) ( not ( = ?auto_9229 ?auto_9239 ) ) ( not ( = ?auto_9226 ?auto_9230 ) ) ( not ( = ?auto_9226 ?auto_9240 ) ) ( not ( = ?auto_9226 ?auto_9234 ) ) ( not ( = ?auto_9226 ?auto_9231 ) ) ( not ( = ?auto_9210 ?auto_9216 ) ) ( not ( = ?auto_9210 ?auto_9241 ) ) ( not ( = ?auto_9211 ?auto_9216 ) ) ( not ( = ?auto_9211 ?auto_9241 ) ) ( not ( = ?auto_9212 ?auto_9216 ) ) ( not ( = ?auto_9212 ?auto_9241 ) ) ( not ( = ?auto_9213 ?auto_9216 ) ) ( not ( = ?auto_9213 ?auto_9241 ) ) ( not ( = ?auto_9214 ?auto_9216 ) ) ( not ( = ?auto_9214 ?auto_9241 ) ) ( not ( = ?auto_9216 ?auto_9226 ) ) ( not ( = ?auto_9216 ?auto_9230 ) ) ( not ( = ?auto_9216 ?auto_9240 ) ) ( not ( = ?auto_9216 ?auto_9234 ) ) ( not ( = ?auto_9216 ?auto_9231 ) ) ( not ( = ?auto_9228 ?auto_9225 ) ) ( not ( = ?auto_9228 ?auto_9227 ) ) ( not ( = ?auto_9228 ?auto_9233 ) ) ( not ( = ?auto_9236 ?auto_9229 ) ) ( not ( = ?auto_9236 ?auto_9235 ) ) ( not ( = ?auto_9236 ?auto_9239 ) ) ( not ( = ?auto_9241 ?auto_9226 ) ) ( not ( = ?auto_9241 ?auto_9230 ) ) ( not ( = ?auto_9241 ?auto_9240 ) ) ( not ( = ?auto_9241 ?auto_9234 ) ) ( not ( = ?auto_9241 ?auto_9231 ) ) ( not ( = ?auto_9210 ?auto_9217 ) ) ( not ( = ?auto_9210 ?auto_9238 ) ) ( not ( = ?auto_9211 ?auto_9217 ) ) ( not ( = ?auto_9211 ?auto_9238 ) ) ( not ( = ?auto_9212 ?auto_9217 ) ) ( not ( = ?auto_9212 ?auto_9238 ) ) ( not ( = ?auto_9213 ?auto_9217 ) ) ( not ( = ?auto_9213 ?auto_9238 ) ) ( not ( = ?auto_9214 ?auto_9217 ) ) ( not ( = ?auto_9214 ?auto_9238 ) ) ( not ( = ?auto_9215 ?auto_9217 ) ) ( not ( = ?auto_9215 ?auto_9238 ) ) ( not ( = ?auto_9217 ?auto_9241 ) ) ( not ( = ?auto_9217 ?auto_9226 ) ) ( not ( = ?auto_9217 ?auto_9230 ) ) ( not ( = ?auto_9217 ?auto_9240 ) ) ( not ( = ?auto_9217 ?auto_9234 ) ) ( not ( = ?auto_9217 ?auto_9231 ) ) ( not ( = ?auto_9232 ?auto_9228 ) ) ( not ( = ?auto_9232 ?auto_9225 ) ) ( not ( = ?auto_9232 ?auto_9227 ) ) ( not ( = ?auto_9232 ?auto_9233 ) ) ( not ( = ?auto_9237 ?auto_9236 ) ) ( not ( = ?auto_9237 ?auto_9229 ) ) ( not ( = ?auto_9237 ?auto_9235 ) ) ( not ( = ?auto_9237 ?auto_9239 ) ) ( not ( = ?auto_9238 ?auto_9241 ) ) ( not ( = ?auto_9238 ?auto_9226 ) ) ( not ( = ?auto_9238 ?auto_9230 ) ) ( not ( = ?auto_9238 ?auto_9240 ) ) ( not ( = ?auto_9238 ?auto_9234 ) ) ( not ( = ?auto_9238 ?auto_9231 ) ) ( not ( = ?auto_9210 ?auto_9218 ) ) ( not ( = ?auto_9210 ?auto_9224 ) ) ( not ( = ?auto_9211 ?auto_9218 ) ) ( not ( = ?auto_9211 ?auto_9224 ) ) ( not ( = ?auto_9212 ?auto_9218 ) ) ( not ( = ?auto_9212 ?auto_9224 ) ) ( not ( = ?auto_9213 ?auto_9218 ) ) ( not ( = ?auto_9213 ?auto_9224 ) ) ( not ( = ?auto_9214 ?auto_9218 ) ) ( not ( = ?auto_9214 ?auto_9224 ) ) ( not ( = ?auto_9215 ?auto_9218 ) ) ( not ( = ?auto_9215 ?auto_9224 ) ) ( not ( = ?auto_9216 ?auto_9218 ) ) ( not ( = ?auto_9216 ?auto_9224 ) ) ( not ( = ?auto_9218 ?auto_9238 ) ) ( not ( = ?auto_9218 ?auto_9241 ) ) ( not ( = ?auto_9218 ?auto_9226 ) ) ( not ( = ?auto_9218 ?auto_9230 ) ) ( not ( = ?auto_9218 ?auto_9240 ) ) ( not ( = ?auto_9218 ?auto_9234 ) ) ( not ( = ?auto_9218 ?auto_9231 ) ) ( not ( = ?auto_9220 ?auto_9232 ) ) ( not ( = ?auto_9220 ?auto_9228 ) ) ( not ( = ?auto_9220 ?auto_9225 ) ) ( not ( = ?auto_9220 ?auto_9227 ) ) ( not ( = ?auto_9220 ?auto_9233 ) ) ( not ( = ?auto_9222 ?auto_9237 ) ) ( not ( = ?auto_9222 ?auto_9236 ) ) ( not ( = ?auto_9222 ?auto_9229 ) ) ( not ( = ?auto_9222 ?auto_9235 ) ) ( not ( = ?auto_9222 ?auto_9239 ) ) ( not ( = ?auto_9224 ?auto_9238 ) ) ( not ( = ?auto_9224 ?auto_9241 ) ) ( not ( = ?auto_9224 ?auto_9226 ) ) ( not ( = ?auto_9224 ?auto_9230 ) ) ( not ( = ?auto_9224 ?auto_9240 ) ) ( not ( = ?auto_9224 ?auto_9234 ) ) ( not ( = ?auto_9224 ?auto_9231 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_9210 ?auto_9211 ?auto_9212 ?auto_9213 ?auto_9214 ?auto_9215 ?auto_9216 ?auto_9217 )
      ( MAKE-1CRATE ?auto_9217 ?auto_9218 )
      ( MAKE-8CRATE-VERIFY ?auto_9210 ?auto_9211 ?auto_9212 ?auto_9213 ?auto_9214 ?auto_9215 ?auto_9216 ?auto_9217 ?auto_9218 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_9262 - SURFACE
      ?auto_9263 - SURFACE
      ?auto_9264 - SURFACE
      ?auto_9265 - SURFACE
      ?auto_9266 - SURFACE
      ?auto_9267 - SURFACE
      ?auto_9268 - SURFACE
      ?auto_9269 - SURFACE
      ?auto_9270 - SURFACE
      ?auto_9271 - SURFACE
    )
    :vars
    (
      ?auto_9273 - HOIST
      ?auto_9275 - PLACE
      ?auto_9274 - PLACE
      ?auto_9272 - HOIST
      ?auto_9277 - SURFACE
      ?auto_9278 - PLACE
      ?auto_9286 - HOIST
      ?auto_9287 - SURFACE
      ?auto_9289 - PLACE
      ?auto_9291 - HOIST
      ?auto_9280 - SURFACE
      ?auto_9290 - PLACE
      ?auto_9293 - HOIST
      ?auto_9292 - SURFACE
      ?auto_9285 - PLACE
      ?auto_9288 - HOIST
      ?auto_9281 - SURFACE
      ?auto_9284 - SURFACE
      ?auto_9283 - SURFACE
      ?auto_9294 - SURFACE
      ?auto_9279 - PLACE
      ?auto_9282 - HOIST
      ?auto_9295 - SURFACE
      ?auto_9276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9273 ?auto_9275 ) ( IS-CRATE ?auto_9271 ) ( not ( = ?auto_9274 ?auto_9275 ) ) ( HOIST-AT ?auto_9272 ?auto_9274 ) ( SURFACE-AT ?auto_9271 ?auto_9274 ) ( ON ?auto_9271 ?auto_9277 ) ( CLEAR ?auto_9271 ) ( not ( = ?auto_9270 ?auto_9271 ) ) ( not ( = ?auto_9270 ?auto_9277 ) ) ( not ( = ?auto_9271 ?auto_9277 ) ) ( not ( = ?auto_9273 ?auto_9272 ) ) ( IS-CRATE ?auto_9270 ) ( not ( = ?auto_9278 ?auto_9275 ) ) ( HOIST-AT ?auto_9286 ?auto_9278 ) ( AVAILABLE ?auto_9286 ) ( SURFACE-AT ?auto_9270 ?auto_9278 ) ( ON ?auto_9270 ?auto_9287 ) ( CLEAR ?auto_9270 ) ( not ( = ?auto_9269 ?auto_9270 ) ) ( not ( = ?auto_9269 ?auto_9287 ) ) ( not ( = ?auto_9270 ?auto_9287 ) ) ( not ( = ?auto_9273 ?auto_9286 ) ) ( IS-CRATE ?auto_9269 ) ( not ( = ?auto_9289 ?auto_9275 ) ) ( HOIST-AT ?auto_9291 ?auto_9289 ) ( AVAILABLE ?auto_9291 ) ( SURFACE-AT ?auto_9269 ?auto_9289 ) ( ON ?auto_9269 ?auto_9280 ) ( CLEAR ?auto_9269 ) ( not ( = ?auto_9268 ?auto_9269 ) ) ( not ( = ?auto_9268 ?auto_9280 ) ) ( not ( = ?auto_9269 ?auto_9280 ) ) ( not ( = ?auto_9273 ?auto_9291 ) ) ( IS-CRATE ?auto_9268 ) ( not ( = ?auto_9290 ?auto_9275 ) ) ( HOIST-AT ?auto_9293 ?auto_9290 ) ( AVAILABLE ?auto_9293 ) ( SURFACE-AT ?auto_9268 ?auto_9290 ) ( ON ?auto_9268 ?auto_9292 ) ( CLEAR ?auto_9268 ) ( not ( = ?auto_9267 ?auto_9268 ) ) ( not ( = ?auto_9267 ?auto_9292 ) ) ( not ( = ?auto_9268 ?auto_9292 ) ) ( not ( = ?auto_9273 ?auto_9293 ) ) ( IS-CRATE ?auto_9267 ) ( not ( = ?auto_9285 ?auto_9275 ) ) ( HOIST-AT ?auto_9288 ?auto_9285 ) ( AVAILABLE ?auto_9288 ) ( SURFACE-AT ?auto_9267 ?auto_9285 ) ( ON ?auto_9267 ?auto_9281 ) ( CLEAR ?auto_9267 ) ( not ( = ?auto_9266 ?auto_9267 ) ) ( not ( = ?auto_9266 ?auto_9281 ) ) ( not ( = ?auto_9267 ?auto_9281 ) ) ( not ( = ?auto_9273 ?auto_9288 ) ) ( IS-CRATE ?auto_9266 ) ( SURFACE-AT ?auto_9266 ?auto_9274 ) ( ON ?auto_9266 ?auto_9284 ) ( CLEAR ?auto_9266 ) ( not ( = ?auto_9265 ?auto_9266 ) ) ( not ( = ?auto_9265 ?auto_9284 ) ) ( not ( = ?auto_9266 ?auto_9284 ) ) ( IS-CRATE ?auto_9265 ) ( SURFACE-AT ?auto_9265 ?auto_9274 ) ( ON ?auto_9265 ?auto_9283 ) ( CLEAR ?auto_9265 ) ( not ( = ?auto_9264 ?auto_9265 ) ) ( not ( = ?auto_9264 ?auto_9283 ) ) ( not ( = ?auto_9265 ?auto_9283 ) ) ( IS-CRATE ?auto_9264 ) ( AVAILABLE ?auto_9272 ) ( SURFACE-AT ?auto_9264 ?auto_9274 ) ( ON ?auto_9264 ?auto_9294 ) ( CLEAR ?auto_9264 ) ( not ( = ?auto_9263 ?auto_9264 ) ) ( not ( = ?auto_9263 ?auto_9294 ) ) ( not ( = ?auto_9264 ?auto_9294 ) ) ( SURFACE-AT ?auto_9262 ?auto_9275 ) ( CLEAR ?auto_9262 ) ( IS-CRATE ?auto_9263 ) ( AVAILABLE ?auto_9273 ) ( not ( = ?auto_9279 ?auto_9275 ) ) ( HOIST-AT ?auto_9282 ?auto_9279 ) ( AVAILABLE ?auto_9282 ) ( SURFACE-AT ?auto_9263 ?auto_9279 ) ( ON ?auto_9263 ?auto_9295 ) ( CLEAR ?auto_9263 ) ( TRUCK-AT ?auto_9276 ?auto_9275 ) ( not ( = ?auto_9262 ?auto_9263 ) ) ( not ( = ?auto_9262 ?auto_9295 ) ) ( not ( = ?auto_9263 ?auto_9295 ) ) ( not ( = ?auto_9273 ?auto_9282 ) ) ( not ( = ?auto_9262 ?auto_9264 ) ) ( not ( = ?auto_9262 ?auto_9294 ) ) ( not ( = ?auto_9264 ?auto_9295 ) ) ( not ( = ?auto_9274 ?auto_9279 ) ) ( not ( = ?auto_9272 ?auto_9282 ) ) ( not ( = ?auto_9294 ?auto_9295 ) ) ( not ( = ?auto_9262 ?auto_9265 ) ) ( not ( = ?auto_9262 ?auto_9283 ) ) ( not ( = ?auto_9263 ?auto_9265 ) ) ( not ( = ?auto_9263 ?auto_9283 ) ) ( not ( = ?auto_9265 ?auto_9294 ) ) ( not ( = ?auto_9265 ?auto_9295 ) ) ( not ( = ?auto_9283 ?auto_9294 ) ) ( not ( = ?auto_9283 ?auto_9295 ) ) ( not ( = ?auto_9262 ?auto_9266 ) ) ( not ( = ?auto_9262 ?auto_9284 ) ) ( not ( = ?auto_9263 ?auto_9266 ) ) ( not ( = ?auto_9263 ?auto_9284 ) ) ( not ( = ?auto_9264 ?auto_9266 ) ) ( not ( = ?auto_9264 ?auto_9284 ) ) ( not ( = ?auto_9266 ?auto_9283 ) ) ( not ( = ?auto_9266 ?auto_9294 ) ) ( not ( = ?auto_9266 ?auto_9295 ) ) ( not ( = ?auto_9284 ?auto_9283 ) ) ( not ( = ?auto_9284 ?auto_9294 ) ) ( not ( = ?auto_9284 ?auto_9295 ) ) ( not ( = ?auto_9262 ?auto_9267 ) ) ( not ( = ?auto_9262 ?auto_9281 ) ) ( not ( = ?auto_9263 ?auto_9267 ) ) ( not ( = ?auto_9263 ?auto_9281 ) ) ( not ( = ?auto_9264 ?auto_9267 ) ) ( not ( = ?auto_9264 ?auto_9281 ) ) ( not ( = ?auto_9265 ?auto_9267 ) ) ( not ( = ?auto_9265 ?auto_9281 ) ) ( not ( = ?auto_9267 ?auto_9284 ) ) ( not ( = ?auto_9267 ?auto_9283 ) ) ( not ( = ?auto_9267 ?auto_9294 ) ) ( not ( = ?auto_9267 ?auto_9295 ) ) ( not ( = ?auto_9285 ?auto_9274 ) ) ( not ( = ?auto_9285 ?auto_9279 ) ) ( not ( = ?auto_9288 ?auto_9272 ) ) ( not ( = ?auto_9288 ?auto_9282 ) ) ( not ( = ?auto_9281 ?auto_9284 ) ) ( not ( = ?auto_9281 ?auto_9283 ) ) ( not ( = ?auto_9281 ?auto_9294 ) ) ( not ( = ?auto_9281 ?auto_9295 ) ) ( not ( = ?auto_9262 ?auto_9268 ) ) ( not ( = ?auto_9262 ?auto_9292 ) ) ( not ( = ?auto_9263 ?auto_9268 ) ) ( not ( = ?auto_9263 ?auto_9292 ) ) ( not ( = ?auto_9264 ?auto_9268 ) ) ( not ( = ?auto_9264 ?auto_9292 ) ) ( not ( = ?auto_9265 ?auto_9268 ) ) ( not ( = ?auto_9265 ?auto_9292 ) ) ( not ( = ?auto_9266 ?auto_9268 ) ) ( not ( = ?auto_9266 ?auto_9292 ) ) ( not ( = ?auto_9268 ?auto_9281 ) ) ( not ( = ?auto_9268 ?auto_9284 ) ) ( not ( = ?auto_9268 ?auto_9283 ) ) ( not ( = ?auto_9268 ?auto_9294 ) ) ( not ( = ?auto_9268 ?auto_9295 ) ) ( not ( = ?auto_9290 ?auto_9285 ) ) ( not ( = ?auto_9290 ?auto_9274 ) ) ( not ( = ?auto_9290 ?auto_9279 ) ) ( not ( = ?auto_9293 ?auto_9288 ) ) ( not ( = ?auto_9293 ?auto_9272 ) ) ( not ( = ?auto_9293 ?auto_9282 ) ) ( not ( = ?auto_9292 ?auto_9281 ) ) ( not ( = ?auto_9292 ?auto_9284 ) ) ( not ( = ?auto_9292 ?auto_9283 ) ) ( not ( = ?auto_9292 ?auto_9294 ) ) ( not ( = ?auto_9292 ?auto_9295 ) ) ( not ( = ?auto_9262 ?auto_9269 ) ) ( not ( = ?auto_9262 ?auto_9280 ) ) ( not ( = ?auto_9263 ?auto_9269 ) ) ( not ( = ?auto_9263 ?auto_9280 ) ) ( not ( = ?auto_9264 ?auto_9269 ) ) ( not ( = ?auto_9264 ?auto_9280 ) ) ( not ( = ?auto_9265 ?auto_9269 ) ) ( not ( = ?auto_9265 ?auto_9280 ) ) ( not ( = ?auto_9266 ?auto_9269 ) ) ( not ( = ?auto_9266 ?auto_9280 ) ) ( not ( = ?auto_9267 ?auto_9269 ) ) ( not ( = ?auto_9267 ?auto_9280 ) ) ( not ( = ?auto_9269 ?auto_9292 ) ) ( not ( = ?auto_9269 ?auto_9281 ) ) ( not ( = ?auto_9269 ?auto_9284 ) ) ( not ( = ?auto_9269 ?auto_9283 ) ) ( not ( = ?auto_9269 ?auto_9294 ) ) ( not ( = ?auto_9269 ?auto_9295 ) ) ( not ( = ?auto_9289 ?auto_9290 ) ) ( not ( = ?auto_9289 ?auto_9285 ) ) ( not ( = ?auto_9289 ?auto_9274 ) ) ( not ( = ?auto_9289 ?auto_9279 ) ) ( not ( = ?auto_9291 ?auto_9293 ) ) ( not ( = ?auto_9291 ?auto_9288 ) ) ( not ( = ?auto_9291 ?auto_9272 ) ) ( not ( = ?auto_9291 ?auto_9282 ) ) ( not ( = ?auto_9280 ?auto_9292 ) ) ( not ( = ?auto_9280 ?auto_9281 ) ) ( not ( = ?auto_9280 ?auto_9284 ) ) ( not ( = ?auto_9280 ?auto_9283 ) ) ( not ( = ?auto_9280 ?auto_9294 ) ) ( not ( = ?auto_9280 ?auto_9295 ) ) ( not ( = ?auto_9262 ?auto_9270 ) ) ( not ( = ?auto_9262 ?auto_9287 ) ) ( not ( = ?auto_9263 ?auto_9270 ) ) ( not ( = ?auto_9263 ?auto_9287 ) ) ( not ( = ?auto_9264 ?auto_9270 ) ) ( not ( = ?auto_9264 ?auto_9287 ) ) ( not ( = ?auto_9265 ?auto_9270 ) ) ( not ( = ?auto_9265 ?auto_9287 ) ) ( not ( = ?auto_9266 ?auto_9270 ) ) ( not ( = ?auto_9266 ?auto_9287 ) ) ( not ( = ?auto_9267 ?auto_9270 ) ) ( not ( = ?auto_9267 ?auto_9287 ) ) ( not ( = ?auto_9268 ?auto_9270 ) ) ( not ( = ?auto_9268 ?auto_9287 ) ) ( not ( = ?auto_9270 ?auto_9280 ) ) ( not ( = ?auto_9270 ?auto_9292 ) ) ( not ( = ?auto_9270 ?auto_9281 ) ) ( not ( = ?auto_9270 ?auto_9284 ) ) ( not ( = ?auto_9270 ?auto_9283 ) ) ( not ( = ?auto_9270 ?auto_9294 ) ) ( not ( = ?auto_9270 ?auto_9295 ) ) ( not ( = ?auto_9278 ?auto_9289 ) ) ( not ( = ?auto_9278 ?auto_9290 ) ) ( not ( = ?auto_9278 ?auto_9285 ) ) ( not ( = ?auto_9278 ?auto_9274 ) ) ( not ( = ?auto_9278 ?auto_9279 ) ) ( not ( = ?auto_9286 ?auto_9291 ) ) ( not ( = ?auto_9286 ?auto_9293 ) ) ( not ( = ?auto_9286 ?auto_9288 ) ) ( not ( = ?auto_9286 ?auto_9272 ) ) ( not ( = ?auto_9286 ?auto_9282 ) ) ( not ( = ?auto_9287 ?auto_9280 ) ) ( not ( = ?auto_9287 ?auto_9292 ) ) ( not ( = ?auto_9287 ?auto_9281 ) ) ( not ( = ?auto_9287 ?auto_9284 ) ) ( not ( = ?auto_9287 ?auto_9283 ) ) ( not ( = ?auto_9287 ?auto_9294 ) ) ( not ( = ?auto_9287 ?auto_9295 ) ) ( not ( = ?auto_9262 ?auto_9271 ) ) ( not ( = ?auto_9262 ?auto_9277 ) ) ( not ( = ?auto_9263 ?auto_9271 ) ) ( not ( = ?auto_9263 ?auto_9277 ) ) ( not ( = ?auto_9264 ?auto_9271 ) ) ( not ( = ?auto_9264 ?auto_9277 ) ) ( not ( = ?auto_9265 ?auto_9271 ) ) ( not ( = ?auto_9265 ?auto_9277 ) ) ( not ( = ?auto_9266 ?auto_9271 ) ) ( not ( = ?auto_9266 ?auto_9277 ) ) ( not ( = ?auto_9267 ?auto_9271 ) ) ( not ( = ?auto_9267 ?auto_9277 ) ) ( not ( = ?auto_9268 ?auto_9271 ) ) ( not ( = ?auto_9268 ?auto_9277 ) ) ( not ( = ?auto_9269 ?auto_9271 ) ) ( not ( = ?auto_9269 ?auto_9277 ) ) ( not ( = ?auto_9271 ?auto_9287 ) ) ( not ( = ?auto_9271 ?auto_9280 ) ) ( not ( = ?auto_9271 ?auto_9292 ) ) ( not ( = ?auto_9271 ?auto_9281 ) ) ( not ( = ?auto_9271 ?auto_9284 ) ) ( not ( = ?auto_9271 ?auto_9283 ) ) ( not ( = ?auto_9271 ?auto_9294 ) ) ( not ( = ?auto_9271 ?auto_9295 ) ) ( not ( = ?auto_9277 ?auto_9287 ) ) ( not ( = ?auto_9277 ?auto_9280 ) ) ( not ( = ?auto_9277 ?auto_9292 ) ) ( not ( = ?auto_9277 ?auto_9281 ) ) ( not ( = ?auto_9277 ?auto_9284 ) ) ( not ( = ?auto_9277 ?auto_9283 ) ) ( not ( = ?auto_9277 ?auto_9294 ) ) ( not ( = ?auto_9277 ?auto_9295 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_9262 ?auto_9263 ?auto_9264 ?auto_9265 ?auto_9266 ?auto_9267 ?auto_9268 ?auto_9269 ?auto_9270 )
      ( MAKE-1CRATE ?auto_9270 ?auto_9271 )
      ( MAKE-9CRATE-VERIFY ?auto_9262 ?auto_9263 ?auto_9264 ?auto_9265 ?auto_9266 ?auto_9267 ?auto_9268 ?auto_9269 ?auto_9270 ?auto_9271 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_9317 - SURFACE
      ?auto_9318 - SURFACE
      ?auto_9319 - SURFACE
      ?auto_9320 - SURFACE
      ?auto_9321 - SURFACE
      ?auto_9322 - SURFACE
      ?auto_9323 - SURFACE
      ?auto_9324 - SURFACE
      ?auto_9325 - SURFACE
      ?auto_9326 - SURFACE
      ?auto_9327 - SURFACE
    )
    :vars
    (
      ?auto_9333 - HOIST
      ?auto_9331 - PLACE
      ?auto_9332 - PLACE
      ?auto_9328 - HOIST
      ?auto_9330 - SURFACE
      ?auto_9338 - PLACE
      ?auto_9344 - HOIST
      ?auto_9351 - SURFACE
      ?auto_9349 - PLACE
      ?auto_9336 - HOIST
      ?auto_9342 - SURFACE
      ?auto_9345 - PLACE
      ?auto_9337 - HOIST
      ?auto_9353 - SURFACE
      ?auto_9354 - PLACE
      ?auto_9341 - HOIST
      ?auto_9340 - SURFACE
      ?auto_9352 - PLACE
      ?auto_9346 - HOIST
      ?auto_9339 - SURFACE
      ?auto_9335 - SURFACE
      ?auto_9334 - SURFACE
      ?auto_9343 - SURFACE
      ?auto_9350 - PLACE
      ?auto_9347 - HOIST
      ?auto_9348 - SURFACE
      ?auto_9329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9333 ?auto_9331 ) ( IS-CRATE ?auto_9327 ) ( not ( = ?auto_9332 ?auto_9331 ) ) ( HOIST-AT ?auto_9328 ?auto_9332 ) ( AVAILABLE ?auto_9328 ) ( SURFACE-AT ?auto_9327 ?auto_9332 ) ( ON ?auto_9327 ?auto_9330 ) ( CLEAR ?auto_9327 ) ( not ( = ?auto_9326 ?auto_9327 ) ) ( not ( = ?auto_9326 ?auto_9330 ) ) ( not ( = ?auto_9327 ?auto_9330 ) ) ( not ( = ?auto_9333 ?auto_9328 ) ) ( IS-CRATE ?auto_9326 ) ( not ( = ?auto_9338 ?auto_9331 ) ) ( HOIST-AT ?auto_9344 ?auto_9338 ) ( SURFACE-AT ?auto_9326 ?auto_9338 ) ( ON ?auto_9326 ?auto_9351 ) ( CLEAR ?auto_9326 ) ( not ( = ?auto_9325 ?auto_9326 ) ) ( not ( = ?auto_9325 ?auto_9351 ) ) ( not ( = ?auto_9326 ?auto_9351 ) ) ( not ( = ?auto_9333 ?auto_9344 ) ) ( IS-CRATE ?auto_9325 ) ( not ( = ?auto_9349 ?auto_9331 ) ) ( HOIST-AT ?auto_9336 ?auto_9349 ) ( AVAILABLE ?auto_9336 ) ( SURFACE-AT ?auto_9325 ?auto_9349 ) ( ON ?auto_9325 ?auto_9342 ) ( CLEAR ?auto_9325 ) ( not ( = ?auto_9324 ?auto_9325 ) ) ( not ( = ?auto_9324 ?auto_9342 ) ) ( not ( = ?auto_9325 ?auto_9342 ) ) ( not ( = ?auto_9333 ?auto_9336 ) ) ( IS-CRATE ?auto_9324 ) ( not ( = ?auto_9345 ?auto_9331 ) ) ( HOIST-AT ?auto_9337 ?auto_9345 ) ( AVAILABLE ?auto_9337 ) ( SURFACE-AT ?auto_9324 ?auto_9345 ) ( ON ?auto_9324 ?auto_9353 ) ( CLEAR ?auto_9324 ) ( not ( = ?auto_9323 ?auto_9324 ) ) ( not ( = ?auto_9323 ?auto_9353 ) ) ( not ( = ?auto_9324 ?auto_9353 ) ) ( not ( = ?auto_9333 ?auto_9337 ) ) ( IS-CRATE ?auto_9323 ) ( not ( = ?auto_9354 ?auto_9331 ) ) ( HOIST-AT ?auto_9341 ?auto_9354 ) ( AVAILABLE ?auto_9341 ) ( SURFACE-AT ?auto_9323 ?auto_9354 ) ( ON ?auto_9323 ?auto_9340 ) ( CLEAR ?auto_9323 ) ( not ( = ?auto_9322 ?auto_9323 ) ) ( not ( = ?auto_9322 ?auto_9340 ) ) ( not ( = ?auto_9323 ?auto_9340 ) ) ( not ( = ?auto_9333 ?auto_9341 ) ) ( IS-CRATE ?auto_9322 ) ( not ( = ?auto_9352 ?auto_9331 ) ) ( HOIST-AT ?auto_9346 ?auto_9352 ) ( AVAILABLE ?auto_9346 ) ( SURFACE-AT ?auto_9322 ?auto_9352 ) ( ON ?auto_9322 ?auto_9339 ) ( CLEAR ?auto_9322 ) ( not ( = ?auto_9321 ?auto_9322 ) ) ( not ( = ?auto_9321 ?auto_9339 ) ) ( not ( = ?auto_9322 ?auto_9339 ) ) ( not ( = ?auto_9333 ?auto_9346 ) ) ( IS-CRATE ?auto_9321 ) ( SURFACE-AT ?auto_9321 ?auto_9338 ) ( ON ?auto_9321 ?auto_9335 ) ( CLEAR ?auto_9321 ) ( not ( = ?auto_9320 ?auto_9321 ) ) ( not ( = ?auto_9320 ?auto_9335 ) ) ( not ( = ?auto_9321 ?auto_9335 ) ) ( IS-CRATE ?auto_9320 ) ( SURFACE-AT ?auto_9320 ?auto_9338 ) ( ON ?auto_9320 ?auto_9334 ) ( CLEAR ?auto_9320 ) ( not ( = ?auto_9319 ?auto_9320 ) ) ( not ( = ?auto_9319 ?auto_9334 ) ) ( not ( = ?auto_9320 ?auto_9334 ) ) ( IS-CRATE ?auto_9319 ) ( AVAILABLE ?auto_9344 ) ( SURFACE-AT ?auto_9319 ?auto_9338 ) ( ON ?auto_9319 ?auto_9343 ) ( CLEAR ?auto_9319 ) ( not ( = ?auto_9318 ?auto_9319 ) ) ( not ( = ?auto_9318 ?auto_9343 ) ) ( not ( = ?auto_9319 ?auto_9343 ) ) ( SURFACE-AT ?auto_9317 ?auto_9331 ) ( CLEAR ?auto_9317 ) ( IS-CRATE ?auto_9318 ) ( AVAILABLE ?auto_9333 ) ( not ( = ?auto_9350 ?auto_9331 ) ) ( HOIST-AT ?auto_9347 ?auto_9350 ) ( AVAILABLE ?auto_9347 ) ( SURFACE-AT ?auto_9318 ?auto_9350 ) ( ON ?auto_9318 ?auto_9348 ) ( CLEAR ?auto_9318 ) ( TRUCK-AT ?auto_9329 ?auto_9331 ) ( not ( = ?auto_9317 ?auto_9318 ) ) ( not ( = ?auto_9317 ?auto_9348 ) ) ( not ( = ?auto_9318 ?auto_9348 ) ) ( not ( = ?auto_9333 ?auto_9347 ) ) ( not ( = ?auto_9317 ?auto_9319 ) ) ( not ( = ?auto_9317 ?auto_9343 ) ) ( not ( = ?auto_9319 ?auto_9348 ) ) ( not ( = ?auto_9338 ?auto_9350 ) ) ( not ( = ?auto_9344 ?auto_9347 ) ) ( not ( = ?auto_9343 ?auto_9348 ) ) ( not ( = ?auto_9317 ?auto_9320 ) ) ( not ( = ?auto_9317 ?auto_9334 ) ) ( not ( = ?auto_9318 ?auto_9320 ) ) ( not ( = ?auto_9318 ?auto_9334 ) ) ( not ( = ?auto_9320 ?auto_9343 ) ) ( not ( = ?auto_9320 ?auto_9348 ) ) ( not ( = ?auto_9334 ?auto_9343 ) ) ( not ( = ?auto_9334 ?auto_9348 ) ) ( not ( = ?auto_9317 ?auto_9321 ) ) ( not ( = ?auto_9317 ?auto_9335 ) ) ( not ( = ?auto_9318 ?auto_9321 ) ) ( not ( = ?auto_9318 ?auto_9335 ) ) ( not ( = ?auto_9319 ?auto_9321 ) ) ( not ( = ?auto_9319 ?auto_9335 ) ) ( not ( = ?auto_9321 ?auto_9334 ) ) ( not ( = ?auto_9321 ?auto_9343 ) ) ( not ( = ?auto_9321 ?auto_9348 ) ) ( not ( = ?auto_9335 ?auto_9334 ) ) ( not ( = ?auto_9335 ?auto_9343 ) ) ( not ( = ?auto_9335 ?auto_9348 ) ) ( not ( = ?auto_9317 ?auto_9322 ) ) ( not ( = ?auto_9317 ?auto_9339 ) ) ( not ( = ?auto_9318 ?auto_9322 ) ) ( not ( = ?auto_9318 ?auto_9339 ) ) ( not ( = ?auto_9319 ?auto_9322 ) ) ( not ( = ?auto_9319 ?auto_9339 ) ) ( not ( = ?auto_9320 ?auto_9322 ) ) ( not ( = ?auto_9320 ?auto_9339 ) ) ( not ( = ?auto_9322 ?auto_9335 ) ) ( not ( = ?auto_9322 ?auto_9334 ) ) ( not ( = ?auto_9322 ?auto_9343 ) ) ( not ( = ?auto_9322 ?auto_9348 ) ) ( not ( = ?auto_9352 ?auto_9338 ) ) ( not ( = ?auto_9352 ?auto_9350 ) ) ( not ( = ?auto_9346 ?auto_9344 ) ) ( not ( = ?auto_9346 ?auto_9347 ) ) ( not ( = ?auto_9339 ?auto_9335 ) ) ( not ( = ?auto_9339 ?auto_9334 ) ) ( not ( = ?auto_9339 ?auto_9343 ) ) ( not ( = ?auto_9339 ?auto_9348 ) ) ( not ( = ?auto_9317 ?auto_9323 ) ) ( not ( = ?auto_9317 ?auto_9340 ) ) ( not ( = ?auto_9318 ?auto_9323 ) ) ( not ( = ?auto_9318 ?auto_9340 ) ) ( not ( = ?auto_9319 ?auto_9323 ) ) ( not ( = ?auto_9319 ?auto_9340 ) ) ( not ( = ?auto_9320 ?auto_9323 ) ) ( not ( = ?auto_9320 ?auto_9340 ) ) ( not ( = ?auto_9321 ?auto_9323 ) ) ( not ( = ?auto_9321 ?auto_9340 ) ) ( not ( = ?auto_9323 ?auto_9339 ) ) ( not ( = ?auto_9323 ?auto_9335 ) ) ( not ( = ?auto_9323 ?auto_9334 ) ) ( not ( = ?auto_9323 ?auto_9343 ) ) ( not ( = ?auto_9323 ?auto_9348 ) ) ( not ( = ?auto_9354 ?auto_9352 ) ) ( not ( = ?auto_9354 ?auto_9338 ) ) ( not ( = ?auto_9354 ?auto_9350 ) ) ( not ( = ?auto_9341 ?auto_9346 ) ) ( not ( = ?auto_9341 ?auto_9344 ) ) ( not ( = ?auto_9341 ?auto_9347 ) ) ( not ( = ?auto_9340 ?auto_9339 ) ) ( not ( = ?auto_9340 ?auto_9335 ) ) ( not ( = ?auto_9340 ?auto_9334 ) ) ( not ( = ?auto_9340 ?auto_9343 ) ) ( not ( = ?auto_9340 ?auto_9348 ) ) ( not ( = ?auto_9317 ?auto_9324 ) ) ( not ( = ?auto_9317 ?auto_9353 ) ) ( not ( = ?auto_9318 ?auto_9324 ) ) ( not ( = ?auto_9318 ?auto_9353 ) ) ( not ( = ?auto_9319 ?auto_9324 ) ) ( not ( = ?auto_9319 ?auto_9353 ) ) ( not ( = ?auto_9320 ?auto_9324 ) ) ( not ( = ?auto_9320 ?auto_9353 ) ) ( not ( = ?auto_9321 ?auto_9324 ) ) ( not ( = ?auto_9321 ?auto_9353 ) ) ( not ( = ?auto_9322 ?auto_9324 ) ) ( not ( = ?auto_9322 ?auto_9353 ) ) ( not ( = ?auto_9324 ?auto_9340 ) ) ( not ( = ?auto_9324 ?auto_9339 ) ) ( not ( = ?auto_9324 ?auto_9335 ) ) ( not ( = ?auto_9324 ?auto_9334 ) ) ( not ( = ?auto_9324 ?auto_9343 ) ) ( not ( = ?auto_9324 ?auto_9348 ) ) ( not ( = ?auto_9345 ?auto_9354 ) ) ( not ( = ?auto_9345 ?auto_9352 ) ) ( not ( = ?auto_9345 ?auto_9338 ) ) ( not ( = ?auto_9345 ?auto_9350 ) ) ( not ( = ?auto_9337 ?auto_9341 ) ) ( not ( = ?auto_9337 ?auto_9346 ) ) ( not ( = ?auto_9337 ?auto_9344 ) ) ( not ( = ?auto_9337 ?auto_9347 ) ) ( not ( = ?auto_9353 ?auto_9340 ) ) ( not ( = ?auto_9353 ?auto_9339 ) ) ( not ( = ?auto_9353 ?auto_9335 ) ) ( not ( = ?auto_9353 ?auto_9334 ) ) ( not ( = ?auto_9353 ?auto_9343 ) ) ( not ( = ?auto_9353 ?auto_9348 ) ) ( not ( = ?auto_9317 ?auto_9325 ) ) ( not ( = ?auto_9317 ?auto_9342 ) ) ( not ( = ?auto_9318 ?auto_9325 ) ) ( not ( = ?auto_9318 ?auto_9342 ) ) ( not ( = ?auto_9319 ?auto_9325 ) ) ( not ( = ?auto_9319 ?auto_9342 ) ) ( not ( = ?auto_9320 ?auto_9325 ) ) ( not ( = ?auto_9320 ?auto_9342 ) ) ( not ( = ?auto_9321 ?auto_9325 ) ) ( not ( = ?auto_9321 ?auto_9342 ) ) ( not ( = ?auto_9322 ?auto_9325 ) ) ( not ( = ?auto_9322 ?auto_9342 ) ) ( not ( = ?auto_9323 ?auto_9325 ) ) ( not ( = ?auto_9323 ?auto_9342 ) ) ( not ( = ?auto_9325 ?auto_9353 ) ) ( not ( = ?auto_9325 ?auto_9340 ) ) ( not ( = ?auto_9325 ?auto_9339 ) ) ( not ( = ?auto_9325 ?auto_9335 ) ) ( not ( = ?auto_9325 ?auto_9334 ) ) ( not ( = ?auto_9325 ?auto_9343 ) ) ( not ( = ?auto_9325 ?auto_9348 ) ) ( not ( = ?auto_9349 ?auto_9345 ) ) ( not ( = ?auto_9349 ?auto_9354 ) ) ( not ( = ?auto_9349 ?auto_9352 ) ) ( not ( = ?auto_9349 ?auto_9338 ) ) ( not ( = ?auto_9349 ?auto_9350 ) ) ( not ( = ?auto_9336 ?auto_9337 ) ) ( not ( = ?auto_9336 ?auto_9341 ) ) ( not ( = ?auto_9336 ?auto_9346 ) ) ( not ( = ?auto_9336 ?auto_9344 ) ) ( not ( = ?auto_9336 ?auto_9347 ) ) ( not ( = ?auto_9342 ?auto_9353 ) ) ( not ( = ?auto_9342 ?auto_9340 ) ) ( not ( = ?auto_9342 ?auto_9339 ) ) ( not ( = ?auto_9342 ?auto_9335 ) ) ( not ( = ?auto_9342 ?auto_9334 ) ) ( not ( = ?auto_9342 ?auto_9343 ) ) ( not ( = ?auto_9342 ?auto_9348 ) ) ( not ( = ?auto_9317 ?auto_9326 ) ) ( not ( = ?auto_9317 ?auto_9351 ) ) ( not ( = ?auto_9318 ?auto_9326 ) ) ( not ( = ?auto_9318 ?auto_9351 ) ) ( not ( = ?auto_9319 ?auto_9326 ) ) ( not ( = ?auto_9319 ?auto_9351 ) ) ( not ( = ?auto_9320 ?auto_9326 ) ) ( not ( = ?auto_9320 ?auto_9351 ) ) ( not ( = ?auto_9321 ?auto_9326 ) ) ( not ( = ?auto_9321 ?auto_9351 ) ) ( not ( = ?auto_9322 ?auto_9326 ) ) ( not ( = ?auto_9322 ?auto_9351 ) ) ( not ( = ?auto_9323 ?auto_9326 ) ) ( not ( = ?auto_9323 ?auto_9351 ) ) ( not ( = ?auto_9324 ?auto_9326 ) ) ( not ( = ?auto_9324 ?auto_9351 ) ) ( not ( = ?auto_9326 ?auto_9342 ) ) ( not ( = ?auto_9326 ?auto_9353 ) ) ( not ( = ?auto_9326 ?auto_9340 ) ) ( not ( = ?auto_9326 ?auto_9339 ) ) ( not ( = ?auto_9326 ?auto_9335 ) ) ( not ( = ?auto_9326 ?auto_9334 ) ) ( not ( = ?auto_9326 ?auto_9343 ) ) ( not ( = ?auto_9326 ?auto_9348 ) ) ( not ( = ?auto_9351 ?auto_9342 ) ) ( not ( = ?auto_9351 ?auto_9353 ) ) ( not ( = ?auto_9351 ?auto_9340 ) ) ( not ( = ?auto_9351 ?auto_9339 ) ) ( not ( = ?auto_9351 ?auto_9335 ) ) ( not ( = ?auto_9351 ?auto_9334 ) ) ( not ( = ?auto_9351 ?auto_9343 ) ) ( not ( = ?auto_9351 ?auto_9348 ) ) ( not ( = ?auto_9317 ?auto_9327 ) ) ( not ( = ?auto_9317 ?auto_9330 ) ) ( not ( = ?auto_9318 ?auto_9327 ) ) ( not ( = ?auto_9318 ?auto_9330 ) ) ( not ( = ?auto_9319 ?auto_9327 ) ) ( not ( = ?auto_9319 ?auto_9330 ) ) ( not ( = ?auto_9320 ?auto_9327 ) ) ( not ( = ?auto_9320 ?auto_9330 ) ) ( not ( = ?auto_9321 ?auto_9327 ) ) ( not ( = ?auto_9321 ?auto_9330 ) ) ( not ( = ?auto_9322 ?auto_9327 ) ) ( not ( = ?auto_9322 ?auto_9330 ) ) ( not ( = ?auto_9323 ?auto_9327 ) ) ( not ( = ?auto_9323 ?auto_9330 ) ) ( not ( = ?auto_9324 ?auto_9327 ) ) ( not ( = ?auto_9324 ?auto_9330 ) ) ( not ( = ?auto_9325 ?auto_9327 ) ) ( not ( = ?auto_9325 ?auto_9330 ) ) ( not ( = ?auto_9327 ?auto_9351 ) ) ( not ( = ?auto_9327 ?auto_9342 ) ) ( not ( = ?auto_9327 ?auto_9353 ) ) ( not ( = ?auto_9327 ?auto_9340 ) ) ( not ( = ?auto_9327 ?auto_9339 ) ) ( not ( = ?auto_9327 ?auto_9335 ) ) ( not ( = ?auto_9327 ?auto_9334 ) ) ( not ( = ?auto_9327 ?auto_9343 ) ) ( not ( = ?auto_9327 ?auto_9348 ) ) ( not ( = ?auto_9332 ?auto_9338 ) ) ( not ( = ?auto_9332 ?auto_9349 ) ) ( not ( = ?auto_9332 ?auto_9345 ) ) ( not ( = ?auto_9332 ?auto_9354 ) ) ( not ( = ?auto_9332 ?auto_9352 ) ) ( not ( = ?auto_9332 ?auto_9350 ) ) ( not ( = ?auto_9328 ?auto_9344 ) ) ( not ( = ?auto_9328 ?auto_9336 ) ) ( not ( = ?auto_9328 ?auto_9337 ) ) ( not ( = ?auto_9328 ?auto_9341 ) ) ( not ( = ?auto_9328 ?auto_9346 ) ) ( not ( = ?auto_9328 ?auto_9347 ) ) ( not ( = ?auto_9330 ?auto_9351 ) ) ( not ( = ?auto_9330 ?auto_9342 ) ) ( not ( = ?auto_9330 ?auto_9353 ) ) ( not ( = ?auto_9330 ?auto_9340 ) ) ( not ( = ?auto_9330 ?auto_9339 ) ) ( not ( = ?auto_9330 ?auto_9335 ) ) ( not ( = ?auto_9330 ?auto_9334 ) ) ( not ( = ?auto_9330 ?auto_9343 ) ) ( not ( = ?auto_9330 ?auto_9348 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_9317 ?auto_9318 ?auto_9319 ?auto_9320 ?auto_9321 ?auto_9322 ?auto_9323 ?auto_9324 ?auto_9325 ?auto_9326 )
      ( MAKE-1CRATE ?auto_9326 ?auto_9327 )
      ( MAKE-10CRATE-VERIFY ?auto_9317 ?auto_9318 ?auto_9319 ?auto_9320 ?auto_9321 ?auto_9322 ?auto_9323 ?auto_9324 ?auto_9325 ?auto_9326 ?auto_9327 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_9377 - SURFACE
      ?auto_9378 - SURFACE
      ?auto_9379 - SURFACE
      ?auto_9380 - SURFACE
      ?auto_9381 - SURFACE
      ?auto_9382 - SURFACE
      ?auto_9383 - SURFACE
      ?auto_9384 - SURFACE
      ?auto_9385 - SURFACE
      ?auto_9386 - SURFACE
      ?auto_9387 - SURFACE
      ?auto_9388 - SURFACE
    )
    :vars
    (
      ?auto_9393 - HOIST
      ?auto_9391 - PLACE
      ?auto_9389 - PLACE
      ?auto_9394 - HOIST
      ?auto_9392 - SURFACE
      ?auto_9411 - PLACE
      ?auto_9410 - HOIST
      ?auto_9405 - SURFACE
      ?auto_9398 - PLACE
      ?auto_9406 - HOIST
      ?auto_9412 - SURFACE
      ?auto_9397 - SURFACE
      ?auto_9399 - PLACE
      ?auto_9395 - HOIST
      ?auto_9407 - SURFACE
      ?auto_9404 - PLACE
      ?auto_9396 - HOIST
      ?auto_9416 - SURFACE
      ?auto_9402 - PLACE
      ?auto_9414 - HOIST
      ?auto_9408 - SURFACE
      ?auto_9401 - SURFACE
      ?auto_9403 - SURFACE
      ?auto_9409 - SURFACE
      ?auto_9400 - PLACE
      ?auto_9415 - HOIST
      ?auto_9413 - SURFACE
      ?auto_9390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9393 ?auto_9391 ) ( IS-CRATE ?auto_9388 ) ( not ( = ?auto_9389 ?auto_9391 ) ) ( HOIST-AT ?auto_9394 ?auto_9389 ) ( SURFACE-AT ?auto_9388 ?auto_9389 ) ( ON ?auto_9388 ?auto_9392 ) ( CLEAR ?auto_9388 ) ( not ( = ?auto_9387 ?auto_9388 ) ) ( not ( = ?auto_9387 ?auto_9392 ) ) ( not ( = ?auto_9388 ?auto_9392 ) ) ( not ( = ?auto_9393 ?auto_9394 ) ) ( IS-CRATE ?auto_9387 ) ( not ( = ?auto_9411 ?auto_9391 ) ) ( HOIST-AT ?auto_9410 ?auto_9411 ) ( AVAILABLE ?auto_9410 ) ( SURFACE-AT ?auto_9387 ?auto_9411 ) ( ON ?auto_9387 ?auto_9405 ) ( CLEAR ?auto_9387 ) ( not ( = ?auto_9386 ?auto_9387 ) ) ( not ( = ?auto_9386 ?auto_9405 ) ) ( not ( = ?auto_9387 ?auto_9405 ) ) ( not ( = ?auto_9393 ?auto_9410 ) ) ( IS-CRATE ?auto_9386 ) ( not ( = ?auto_9398 ?auto_9391 ) ) ( HOIST-AT ?auto_9406 ?auto_9398 ) ( SURFACE-AT ?auto_9386 ?auto_9398 ) ( ON ?auto_9386 ?auto_9412 ) ( CLEAR ?auto_9386 ) ( not ( = ?auto_9385 ?auto_9386 ) ) ( not ( = ?auto_9385 ?auto_9412 ) ) ( not ( = ?auto_9386 ?auto_9412 ) ) ( not ( = ?auto_9393 ?auto_9406 ) ) ( IS-CRATE ?auto_9385 ) ( AVAILABLE ?auto_9394 ) ( SURFACE-AT ?auto_9385 ?auto_9389 ) ( ON ?auto_9385 ?auto_9397 ) ( CLEAR ?auto_9385 ) ( not ( = ?auto_9384 ?auto_9385 ) ) ( not ( = ?auto_9384 ?auto_9397 ) ) ( not ( = ?auto_9385 ?auto_9397 ) ) ( IS-CRATE ?auto_9384 ) ( not ( = ?auto_9399 ?auto_9391 ) ) ( HOIST-AT ?auto_9395 ?auto_9399 ) ( AVAILABLE ?auto_9395 ) ( SURFACE-AT ?auto_9384 ?auto_9399 ) ( ON ?auto_9384 ?auto_9407 ) ( CLEAR ?auto_9384 ) ( not ( = ?auto_9383 ?auto_9384 ) ) ( not ( = ?auto_9383 ?auto_9407 ) ) ( not ( = ?auto_9384 ?auto_9407 ) ) ( not ( = ?auto_9393 ?auto_9395 ) ) ( IS-CRATE ?auto_9383 ) ( not ( = ?auto_9404 ?auto_9391 ) ) ( HOIST-AT ?auto_9396 ?auto_9404 ) ( AVAILABLE ?auto_9396 ) ( SURFACE-AT ?auto_9383 ?auto_9404 ) ( ON ?auto_9383 ?auto_9416 ) ( CLEAR ?auto_9383 ) ( not ( = ?auto_9382 ?auto_9383 ) ) ( not ( = ?auto_9382 ?auto_9416 ) ) ( not ( = ?auto_9383 ?auto_9416 ) ) ( not ( = ?auto_9393 ?auto_9396 ) ) ( IS-CRATE ?auto_9382 ) ( not ( = ?auto_9402 ?auto_9391 ) ) ( HOIST-AT ?auto_9414 ?auto_9402 ) ( AVAILABLE ?auto_9414 ) ( SURFACE-AT ?auto_9382 ?auto_9402 ) ( ON ?auto_9382 ?auto_9408 ) ( CLEAR ?auto_9382 ) ( not ( = ?auto_9381 ?auto_9382 ) ) ( not ( = ?auto_9381 ?auto_9408 ) ) ( not ( = ?auto_9382 ?auto_9408 ) ) ( not ( = ?auto_9393 ?auto_9414 ) ) ( IS-CRATE ?auto_9381 ) ( SURFACE-AT ?auto_9381 ?auto_9398 ) ( ON ?auto_9381 ?auto_9401 ) ( CLEAR ?auto_9381 ) ( not ( = ?auto_9380 ?auto_9381 ) ) ( not ( = ?auto_9380 ?auto_9401 ) ) ( not ( = ?auto_9381 ?auto_9401 ) ) ( IS-CRATE ?auto_9380 ) ( SURFACE-AT ?auto_9380 ?auto_9398 ) ( ON ?auto_9380 ?auto_9403 ) ( CLEAR ?auto_9380 ) ( not ( = ?auto_9379 ?auto_9380 ) ) ( not ( = ?auto_9379 ?auto_9403 ) ) ( not ( = ?auto_9380 ?auto_9403 ) ) ( IS-CRATE ?auto_9379 ) ( AVAILABLE ?auto_9406 ) ( SURFACE-AT ?auto_9379 ?auto_9398 ) ( ON ?auto_9379 ?auto_9409 ) ( CLEAR ?auto_9379 ) ( not ( = ?auto_9378 ?auto_9379 ) ) ( not ( = ?auto_9378 ?auto_9409 ) ) ( not ( = ?auto_9379 ?auto_9409 ) ) ( SURFACE-AT ?auto_9377 ?auto_9391 ) ( CLEAR ?auto_9377 ) ( IS-CRATE ?auto_9378 ) ( AVAILABLE ?auto_9393 ) ( not ( = ?auto_9400 ?auto_9391 ) ) ( HOIST-AT ?auto_9415 ?auto_9400 ) ( AVAILABLE ?auto_9415 ) ( SURFACE-AT ?auto_9378 ?auto_9400 ) ( ON ?auto_9378 ?auto_9413 ) ( CLEAR ?auto_9378 ) ( TRUCK-AT ?auto_9390 ?auto_9391 ) ( not ( = ?auto_9377 ?auto_9378 ) ) ( not ( = ?auto_9377 ?auto_9413 ) ) ( not ( = ?auto_9378 ?auto_9413 ) ) ( not ( = ?auto_9393 ?auto_9415 ) ) ( not ( = ?auto_9377 ?auto_9379 ) ) ( not ( = ?auto_9377 ?auto_9409 ) ) ( not ( = ?auto_9379 ?auto_9413 ) ) ( not ( = ?auto_9398 ?auto_9400 ) ) ( not ( = ?auto_9406 ?auto_9415 ) ) ( not ( = ?auto_9409 ?auto_9413 ) ) ( not ( = ?auto_9377 ?auto_9380 ) ) ( not ( = ?auto_9377 ?auto_9403 ) ) ( not ( = ?auto_9378 ?auto_9380 ) ) ( not ( = ?auto_9378 ?auto_9403 ) ) ( not ( = ?auto_9380 ?auto_9409 ) ) ( not ( = ?auto_9380 ?auto_9413 ) ) ( not ( = ?auto_9403 ?auto_9409 ) ) ( not ( = ?auto_9403 ?auto_9413 ) ) ( not ( = ?auto_9377 ?auto_9381 ) ) ( not ( = ?auto_9377 ?auto_9401 ) ) ( not ( = ?auto_9378 ?auto_9381 ) ) ( not ( = ?auto_9378 ?auto_9401 ) ) ( not ( = ?auto_9379 ?auto_9381 ) ) ( not ( = ?auto_9379 ?auto_9401 ) ) ( not ( = ?auto_9381 ?auto_9403 ) ) ( not ( = ?auto_9381 ?auto_9409 ) ) ( not ( = ?auto_9381 ?auto_9413 ) ) ( not ( = ?auto_9401 ?auto_9403 ) ) ( not ( = ?auto_9401 ?auto_9409 ) ) ( not ( = ?auto_9401 ?auto_9413 ) ) ( not ( = ?auto_9377 ?auto_9382 ) ) ( not ( = ?auto_9377 ?auto_9408 ) ) ( not ( = ?auto_9378 ?auto_9382 ) ) ( not ( = ?auto_9378 ?auto_9408 ) ) ( not ( = ?auto_9379 ?auto_9382 ) ) ( not ( = ?auto_9379 ?auto_9408 ) ) ( not ( = ?auto_9380 ?auto_9382 ) ) ( not ( = ?auto_9380 ?auto_9408 ) ) ( not ( = ?auto_9382 ?auto_9401 ) ) ( not ( = ?auto_9382 ?auto_9403 ) ) ( not ( = ?auto_9382 ?auto_9409 ) ) ( not ( = ?auto_9382 ?auto_9413 ) ) ( not ( = ?auto_9402 ?auto_9398 ) ) ( not ( = ?auto_9402 ?auto_9400 ) ) ( not ( = ?auto_9414 ?auto_9406 ) ) ( not ( = ?auto_9414 ?auto_9415 ) ) ( not ( = ?auto_9408 ?auto_9401 ) ) ( not ( = ?auto_9408 ?auto_9403 ) ) ( not ( = ?auto_9408 ?auto_9409 ) ) ( not ( = ?auto_9408 ?auto_9413 ) ) ( not ( = ?auto_9377 ?auto_9383 ) ) ( not ( = ?auto_9377 ?auto_9416 ) ) ( not ( = ?auto_9378 ?auto_9383 ) ) ( not ( = ?auto_9378 ?auto_9416 ) ) ( not ( = ?auto_9379 ?auto_9383 ) ) ( not ( = ?auto_9379 ?auto_9416 ) ) ( not ( = ?auto_9380 ?auto_9383 ) ) ( not ( = ?auto_9380 ?auto_9416 ) ) ( not ( = ?auto_9381 ?auto_9383 ) ) ( not ( = ?auto_9381 ?auto_9416 ) ) ( not ( = ?auto_9383 ?auto_9408 ) ) ( not ( = ?auto_9383 ?auto_9401 ) ) ( not ( = ?auto_9383 ?auto_9403 ) ) ( not ( = ?auto_9383 ?auto_9409 ) ) ( not ( = ?auto_9383 ?auto_9413 ) ) ( not ( = ?auto_9404 ?auto_9402 ) ) ( not ( = ?auto_9404 ?auto_9398 ) ) ( not ( = ?auto_9404 ?auto_9400 ) ) ( not ( = ?auto_9396 ?auto_9414 ) ) ( not ( = ?auto_9396 ?auto_9406 ) ) ( not ( = ?auto_9396 ?auto_9415 ) ) ( not ( = ?auto_9416 ?auto_9408 ) ) ( not ( = ?auto_9416 ?auto_9401 ) ) ( not ( = ?auto_9416 ?auto_9403 ) ) ( not ( = ?auto_9416 ?auto_9409 ) ) ( not ( = ?auto_9416 ?auto_9413 ) ) ( not ( = ?auto_9377 ?auto_9384 ) ) ( not ( = ?auto_9377 ?auto_9407 ) ) ( not ( = ?auto_9378 ?auto_9384 ) ) ( not ( = ?auto_9378 ?auto_9407 ) ) ( not ( = ?auto_9379 ?auto_9384 ) ) ( not ( = ?auto_9379 ?auto_9407 ) ) ( not ( = ?auto_9380 ?auto_9384 ) ) ( not ( = ?auto_9380 ?auto_9407 ) ) ( not ( = ?auto_9381 ?auto_9384 ) ) ( not ( = ?auto_9381 ?auto_9407 ) ) ( not ( = ?auto_9382 ?auto_9384 ) ) ( not ( = ?auto_9382 ?auto_9407 ) ) ( not ( = ?auto_9384 ?auto_9416 ) ) ( not ( = ?auto_9384 ?auto_9408 ) ) ( not ( = ?auto_9384 ?auto_9401 ) ) ( not ( = ?auto_9384 ?auto_9403 ) ) ( not ( = ?auto_9384 ?auto_9409 ) ) ( not ( = ?auto_9384 ?auto_9413 ) ) ( not ( = ?auto_9399 ?auto_9404 ) ) ( not ( = ?auto_9399 ?auto_9402 ) ) ( not ( = ?auto_9399 ?auto_9398 ) ) ( not ( = ?auto_9399 ?auto_9400 ) ) ( not ( = ?auto_9395 ?auto_9396 ) ) ( not ( = ?auto_9395 ?auto_9414 ) ) ( not ( = ?auto_9395 ?auto_9406 ) ) ( not ( = ?auto_9395 ?auto_9415 ) ) ( not ( = ?auto_9407 ?auto_9416 ) ) ( not ( = ?auto_9407 ?auto_9408 ) ) ( not ( = ?auto_9407 ?auto_9401 ) ) ( not ( = ?auto_9407 ?auto_9403 ) ) ( not ( = ?auto_9407 ?auto_9409 ) ) ( not ( = ?auto_9407 ?auto_9413 ) ) ( not ( = ?auto_9377 ?auto_9385 ) ) ( not ( = ?auto_9377 ?auto_9397 ) ) ( not ( = ?auto_9378 ?auto_9385 ) ) ( not ( = ?auto_9378 ?auto_9397 ) ) ( not ( = ?auto_9379 ?auto_9385 ) ) ( not ( = ?auto_9379 ?auto_9397 ) ) ( not ( = ?auto_9380 ?auto_9385 ) ) ( not ( = ?auto_9380 ?auto_9397 ) ) ( not ( = ?auto_9381 ?auto_9385 ) ) ( not ( = ?auto_9381 ?auto_9397 ) ) ( not ( = ?auto_9382 ?auto_9385 ) ) ( not ( = ?auto_9382 ?auto_9397 ) ) ( not ( = ?auto_9383 ?auto_9385 ) ) ( not ( = ?auto_9383 ?auto_9397 ) ) ( not ( = ?auto_9385 ?auto_9407 ) ) ( not ( = ?auto_9385 ?auto_9416 ) ) ( not ( = ?auto_9385 ?auto_9408 ) ) ( not ( = ?auto_9385 ?auto_9401 ) ) ( not ( = ?auto_9385 ?auto_9403 ) ) ( not ( = ?auto_9385 ?auto_9409 ) ) ( not ( = ?auto_9385 ?auto_9413 ) ) ( not ( = ?auto_9389 ?auto_9399 ) ) ( not ( = ?auto_9389 ?auto_9404 ) ) ( not ( = ?auto_9389 ?auto_9402 ) ) ( not ( = ?auto_9389 ?auto_9398 ) ) ( not ( = ?auto_9389 ?auto_9400 ) ) ( not ( = ?auto_9394 ?auto_9395 ) ) ( not ( = ?auto_9394 ?auto_9396 ) ) ( not ( = ?auto_9394 ?auto_9414 ) ) ( not ( = ?auto_9394 ?auto_9406 ) ) ( not ( = ?auto_9394 ?auto_9415 ) ) ( not ( = ?auto_9397 ?auto_9407 ) ) ( not ( = ?auto_9397 ?auto_9416 ) ) ( not ( = ?auto_9397 ?auto_9408 ) ) ( not ( = ?auto_9397 ?auto_9401 ) ) ( not ( = ?auto_9397 ?auto_9403 ) ) ( not ( = ?auto_9397 ?auto_9409 ) ) ( not ( = ?auto_9397 ?auto_9413 ) ) ( not ( = ?auto_9377 ?auto_9386 ) ) ( not ( = ?auto_9377 ?auto_9412 ) ) ( not ( = ?auto_9378 ?auto_9386 ) ) ( not ( = ?auto_9378 ?auto_9412 ) ) ( not ( = ?auto_9379 ?auto_9386 ) ) ( not ( = ?auto_9379 ?auto_9412 ) ) ( not ( = ?auto_9380 ?auto_9386 ) ) ( not ( = ?auto_9380 ?auto_9412 ) ) ( not ( = ?auto_9381 ?auto_9386 ) ) ( not ( = ?auto_9381 ?auto_9412 ) ) ( not ( = ?auto_9382 ?auto_9386 ) ) ( not ( = ?auto_9382 ?auto_9412 ) ) ( not ( = ?auto_9383 ?auto_9386 ) ) ( not ( = ?auto_9383 ?auto_9412 ) ) ( not ( = ?auto_9384 ?auto_9386 ) ) ( not ( = ?auto_9384 ?auto_9412 ) ) ( not ( = ?auto_9386 ?auto_9397 ) ) ( not ( = ?auto_9386 ?auto_9407 ) ) ( not ( = ?auto_9386 ?auto_9416 ) ) ( not ( = ?auto_9386 ?auto_9408 ) ) ( not ( = ?auto_9386 ?auto_9401 ) ) ( not ( = ?auto_9386 ?auto_9403 ) ) ( not ( = ?auto_9386 ?auto_9409 ) ) ( not ( = ?auto_9386 ?auto_9413 ) ) ( not ( = ?auto_9412 ?auto_9397 ) ) ( not ( = ?auto_9412 ?auto_9407 ) ) ( not ( = ?auto_9412 ?auto_9416 ) ) ( not ( = ?auto_9412 ?auto_9408 ) ) ( not ( = ?auto_9412 ?auto_9401 ) ) ( not ( = ?auto_9412 ?auto_9403 ) ) ( not ( = ?auto_9412 ?auto_9409 ) ) ( not ( = ?auto_9412 ?auto_9413 ) ) ( not ( = ?auto_9377 ?auto_9387 ) ) ( not ( = ?auto_9377 ?auto_9405 ) ) ( not ( = ?auto_9378 ?auto_9387 ) ) ( not ( = ?auto_9378 ?auto_9405 ) ) ( not ( = ?auto_9379 ?auto_9387 ) ) ( not ( = ?auto_9379 ?auto_9405 ) ) ( not ( = ?auto_9380 ?auto_9387 ) ) ( not ( = ?auto_9380 ?auto_9405 ) ) ( not ( = ?auto_9381 ?auto_9387 ) ) ( not ( = ?auto_9381 ?auto_9405 ) ) ( not ( = ?auto_9382 ?auto_9387 ) ) ( not ( = ?auto_9382 ?auto_9405 ) ) ( not ( = ?auto_9383 ?auto_9387 ) ) ( not ( = ?auto_9383 ?auto_9405 ) ) ( not ( = ?auto_9384 ?auto_9387 ) ) ( not ( = ?auto_9384 ?auto_9405 ) ) ( not ( = ?auto_9385 ?auto_9387 ) ) ( not ( = ?auto_9385 ?auto_9405 ) ) ( not ( = ?auto_9387 ?auto_9412 ) ) ( not ( = ?auto_9387 ?auto_9397 ) ) ( not ( = ?auto_9387 ?auto_9407 ) ) ( not ( = ?auto_9387 ?auto_9416 ) ) ( not ( = ?auto_9387 ?auto_9408 ) ) ( not ( = ?auto_9387 ?auto_9401 ) ) ( not ( = ?auto_9387 ?auto_9403 ) ) ( not ( = ?auto_9387 ?auto_9409 ) ) ( not ( = ?auto_9387 ?auto_9413 ) ) ( not ( = ?auto_9411 ?auto_9398 ) ) ( not ( = ?auto_9411 ?auto_9389 ) ) ( not ( = ?auto_9411 ?auto_9399 ) ) ( not ( = ?auto_9411 ?auto_9404 ) ) ( not ( = ?auto_9411 ?auto_9402 ) ) ( not ( = ?auto_9411 ?auto_9400 ) ) ( not ( = ?auto_9410 ?auto_9406 ) ) ( not ( = ?auto_9410 ?auto_9394 ) ) ( not ( = ?auto_9410 ?auto_9395 ) ) ( not ( = ?auto_9410 ?auto_9396 ) ) ( not ( = ?auto_9410 ?auto_9414 ) ) ( not ( = ?auto_9410 ?auto_9415 ) ) ( not ( = ?auto_9405 ?auto_9412 ) ) ( not ( = ?auto_9405 ?auto_9397 ) ) ( not ( = ?auto_9405 ?auto_9407 ) ) ( not ( = ?auto_9405 ?auto_9416 ) ) ( not ( = ?auto_9405 ?auto_9408 ) ) ( not ( = ?auto_9405 ?auto_9401 ) ) ( not ( = ?auto_9405 ?auto_9403 ) ) ( not ( = ?auto_9405 ?auto_9409 ) ) ( not ( = ?auto_9405 ?auto_9413 ) ) ( not ( = ?auto_9377 ?auto_9388 ) ) ( not ( = ?auto_9377 ?auto_9392 ) ) ( not ( = ?auto_9378 ?auto_9388 ) ) ( not ( = ?auto_9378 ?auto_9392 ) ) ( not ( = ?auto_9379 ?auto_9388 ) ) ( not ( = ?auto_9379 ?auto_9392 ) ) ( not ( = ?auto_9380 ?auto_9388 ) ) ( not ( = ?auto_9380 ?auto_9392 ) ) ( not ( = ?auto_9381 ?auto_9388 ) ) ( not ( = ?auto_9381 ?auto_9392 ) ) ( not ( = ?auto_9382 ?auto_9388 ) ) ( not ( = ?auto_9382 ?auto_9392 ) ) ( not ( = ?auto_9383 ?auto_9388 ) ) ( not ( = ?auto_9383 ?auto_9392 ) ) ( not ( = ?auto_9384 ?auto_9388 ) ) ( not ( = ?auto_9384 ?auto_9392 ) ) ( not ( = ?auto_9385 ?auto_9388 ) ) ( not ( = ?auto_9385 ?auto_9392 ) ) ( not ( = ?auto_9386 ?auto_9388 ) ) ( not ( = ?auto_9386 ?auto_9392 ) ) ( not ( = ?auto_9388 ?auto_9405 ) ) ( not ( = ?auto_9388 ?auto_9412 ) ) ( not ( = ?auto_9388 ?auto_9397 ) ) ( not ( = ?auto_9388 ?auto_9407 ) ) ( not ( = ?auto_9388 ?auto_9416 ) ) ( not ( = ?auto_9388 ?auto_9408 ) ) ( not ( = ?auto_9388 ?auto_9401 ) ) ( not ( = ?auto_9388 ?auto_9403 ) ) ( not ( = ?auto_9388 ?auto_9409 ) ) ( not ( = ?auto_9388 ?auto_9413 ) ) ( not ( = ?auto_9392 ?auto_9405 ) ) ( not ( = ?auto_9392 ?auto_9412 ) ) ( not ( = ?auto_9392 ?auto_9397 ) ) ( not ( = ?auto_9392 ?auto_9407 ) ) ( not ( = ?auto_9392 ?auto_9416 ) ) ( not ( = ?auto_9392 ?auto_9408 ) ) ( not ( = ?auto_9392 ?auto_9401 ) ) ( not ( = ?auto_9392 ?auto_9403 ) ) ( not ( = ?auto_9392 ?auto_9409 ) ) ( not ( = ?auto_9392 ?auto_9413 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_9377 ?auto_9378 ?auto_9379 ?auto_9380 ?auto_9381 ?auto_9382 ?auto_9383 ?auto_9384 ?auto_9385 ?auto_9386 ?auto_9387 )
      ( MAKE-1CRATE ?auto_9387 ?auto_9388 )
      ( MAKE-11CRATE-VERIFY ?auto_9377 ?auto_9378 ?auto_9379 ?auto_9380 ?auto_9381 ?auto_9382 ?auto_9383 ?auto_9384 ?auto_9385 ?auto_9386 ?auto_9387 ?auto_9388 ) )
  )

)

