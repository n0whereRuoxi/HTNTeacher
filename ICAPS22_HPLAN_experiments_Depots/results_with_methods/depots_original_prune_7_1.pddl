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
      ?auto_9005 - SURFACE
      ?auto_9006 - SURFACE
    )
    :vars
    (
      ?auto_9007 - HOIST
      ?auto_9008 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9007 ?auto_9008 ) ( SURFACE-AT ?auto_9006 ?auto_9008 ) ( CLEAR ?auto_9006 ) ( LIFTING ?auto_9007 ?auto_9005 ) ( IS-CRATE ?auto_9005 ) ( not ( = ?auto_9005 ?auto_9006 ) ) )
    :subtasks
    ( ( !DROP ?auto_9007 ?auto_9005 ?auto_9006 ?auto_9008 )
      ( MAKE-ON-VERIFY ?auto_9005 ?auto_9006 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9009 - SURFACE
      ?auto_9010 - SURFACE
    )
    :vars
    (
      ?auto_9012 - HOIST
      ?auto_9011 - PLACE
      ?auto_9013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9012 ?auto_9011 ) ( SURFACE-AT ?auto_9010 ?auto_9011 ) ( CLEAR ?auto_9010 ) ( IS-CRATE ?auto_9009 ) ( not ( = ?auto_9009 ?auto_9010 ) ) ( TRUCK-AT ?auto_9013 ?auto_9011 ) ( AVAILABLE ?auto_9012 ) ( IN ?auto_9009 ?auto_9013 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9012 ?auto_9009 ?auto_9013 ?auto_9011 )
      ( MAKE-ON ?auto_9009 ?auto_9010 )
      ( MAKE-ON-VERIFY ?auto_9009 ?auto_9010 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9014 - SURFACE
      ?auto_9015 - SURFACE
    )
    :vars
    (
      ?auto_9018 - HOIST
      ?auto_9016 - PLACE
      ?auto_9017 - TRUCK
      ?auto_9019 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9018 ?auto_9016 ) ( SURFACE-AT ?auto_9015 ?auto_9016 ) ( CLEAR ?auto_9015 ) ( IS-CRATE ?auto_9014 ) ( not ( = ?auto_9014 ?auto_9015 ) ) ( AVAILABLE ?auto_9018 ) ( IN ?auto_9014 ?auto_9017 ) ( TRUCK-AT ?auto_9017 ?auto_9019 ) ( not ( = ?auto_9019 ?auto_9016 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9017 ?auto_9019 ?auto_9016 )
      ( MAKE-ON ?auto_9014 ?auto_9015 )
      ( MAKE-ON-VERIFY ?auto_9014 ?auto_9015 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9020 - SURFACE
      ?auto_9021 - SURFACE
    )
    :vars
    (
      ?auto_9022 - HOIST
      ?auto_9025 - PLACE
      ?auto_9023 - TRUCK
      ?auto_9024 - PLACE
      ?auto_9026 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9022 ?auto_9025 ) ( SURFACE-AT ?auto_9021 ?auto_9025 ) ( CLEAR ?auto_9021 ) ( IS-CRATE ?auto_9020 ) ( not ( = ?auto_9020 ?auto_9021 ) ) ( AVAILABLE ?auto_9022 ) ( TRUCK-AT ?auto_9023 ?auto_9024 ) ( not ( = ?auto_9024 ?auto_9025 ) ) ( HOIST-AT ?auto_9026 ?auto_9024 ) ( LIFTING ?auto_9026 ?auto_9020 ) ( not ( = ?auto_9022 ?auto_9026 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9026 ?auto_9020 ?auto_9023 ?auto_9024 )
      ( MAKE-ON ?auto_9020 ?auto_9021 )
      ( MAKE-ON-VERIFY ?auto_9020 ?auto_9021 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9027 - SURFACE
      ?auto_9028 - SURFACE
    )
    :vars
    (
      ?auto_9031 - HOIST
      ?auto_9032 - PLACE
      ?auto_9033 - TRUCK
      ?auto_9029 - PLACE
      ?auto_9030 - HOIST
      ?auto_9034 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9031 ?auto_9032 ) ( SURFACE-AT ?auto_9028 ?auto_9032 ) ( CLEAR ?auto_9028 ) ( IS-CRATE ?auto_9027 ) ( not ( = ?auto_9027 ?auto_9028 ) ) ( AVAILABLE ?auto_9031 ) ( TRUCK-AT ?auto_9033 ?auto_9029 ) ( not ( = ?auto_9029 ?auto_9032 ) ) ( HOIST-AT ?auto_9030 ?auto_9029 ) ( not ( = ?auto_9031 ?auto_9030 ) ) ( AVAILABLE ?auto_9030 ) ( SURFACE-AT ?auto_9027 ?auto_9029 ) ( ON ?auto_9027 ?auto_9034 ) ( CLEAR ?auto_9027 ) ( not ( = ?auto_9027 ?auto_9034 ) ) ( not ( = ?auto_9028 ?auto_9034 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9030 ?auto_9027 ?auto_9034 ?auto_9029 )
      ( MAKE-ON ?auto_9027 ?auto_9028 )
      ( MAKE-ON-VERIFY ?auto_9027 ?auto_9028 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9035 - SURFACE
      ?auto_9036 - SURFACE
    )
    :vars
    (
      ?auto_9039 - HOIST
      ?auto_9042 - PLACE
      ?auto_9040 - PLACE
      ?auto_9038 - HOIST
      ?auto_9041 - SURFACE
      ?auto_9037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9039 ?auto_9042 ) ( SURFACE-AT ?auto_9036 ?auto_9042 ) ( CLEAR ?auto_9036 ) ( IS-CRATE ?auto_9035 ) ( not ( = ?auto_9035 ?auto_9036 ) ) ( AVAILABLE ?auto_9039 ) ( not ( = ?auto_9040 ?auto_9042 ) ) ( HOIST-AT ?auto_9038 ?auto_9040 ) ( not ( = ?auto_9039 ?auto_9038 ) ) ( AVAILABLE ?auto_9038 ) ( SURFACE-AT ?auto_9035 ?auto_9040 ) ( ON ?auto_9035 ?auto_9041 ) ( CLEAR ?auto_9035 ) ( not ( = ?auto_9035 ?auto_9041 ) ) ( not ( = ?auto_9036 ?auto_9041 ) ) ( TRUCK-AT ?auto_9037 ?auto_9042 ) )
    :subtasks
    ( ( !DRIVE ?auto_9037 ?auto_9042 ?auto_9040 )
      ( MAKE-ON ?auto_9035 ?auto_9036 )
      ( MAKE-ON-VERIFY ?auto_9035 ?auto_9036 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9083 - SURFACE
      ?auto_9084 - SURFACE
    )
    :vars
    (
      ?auto_9090 - HOIST
      ?auto_9085 - PLACE
      ?auto_9087 - PLACE
      ?auto_9086 - HOIST
      ?auto_9089 - SURFACE
      ?auto_9088 - TRUCK
      ?auto_9091 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9090 ?auto_9085 ) ( IS-CRATE ?auto_9083 ) ( not ( = ?auto_9083 ?auto_9084 ) ) ( not ( = ?auto_9087 ?auto_9085 ) ) ( HOIST-AT ?auto_9086 ?auto_9087 ) ( not ( = ?auto_9090 ?auto_9086 ) ) ( AVAILABLE ?auto_9086 ) ( SURFACE-AT ?auto_9083 ?auto_9087 ) ( ON ?auto_9083 ?auto_9089 ) ( CLEAR ?auto_9083 ) ( not ( = ?auto_9083 ?auto_9089 ) ) ( not ( = ?auto_9084 ?auto_9089 ) ) ( TRUCK-AT ?auto_9088 ?auto_9085 ) ( SURFACE-AT ?auto_9091 ?auto_9085 ) ( CLEAR ?auto_9091 ) ( LIFTING ?auto_9090 ?auto_9084 ) ( IS-CRATE ?auto_9084 ) ( not ( = ?auto_9083 ?auto_9091 ) ) ( not ( = ?auto_9084 ?auto_9091 ) ) ( not ( = ?auto_9089 ?auto_9091 ) ) )
    :subtasks
    ( ( !DROP ?auto_9090 ?auto_9084 ?auto_9091 ?auto_9085 )
      ( MAKE-ON ?auto_9083 ?auto_9084 )
      ( MAKE-ON-VERIFY ?auto_9083 ?auto_9084 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9092 - SURFACE
      ?auto_9093 - SURFACE
    )
    :vars
    (
      ?auto_9099 - HOIST
      ?auto_9094 - PLACE
      ?auto_9100 - PLACE
      ?auto_9096 - HOIST
      ?auto_9098 - SURFACE
      ?auto_9095 - TRUCK
      ?auto_9097 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9099 ?auto_9094 ) ( IS-CRATE ?auto_9092 ) ( not ( = ?auto_9092 ?auto_9093 ) ) ( not ( = ?auto_9100 ?auto_9094 ) ) ( HOIST-AT ?auto_9096 ?auto_9100 ) ( not ( = ?auto_9099 ?auto_9096 ) ) ( AVAILABLE ?auto_9096 ) ( SURFACE-AT ?auto_9092 ?auto_9100 ) ( ON ?auto_9092 ?auto_9098 ) ( CLEAR ?auto_9092 ) ( not ( = ?auto_9092 ?auto_9098 ) ) ( not ( = ?auto_9093 ?auto_9098 ) ) ( TRUCK-AT ?auto_9095 ?auto_9094 ) ( SURFACE-AT ?auto_9097 ?auto_9094 ) ( CLEAR ?auto_9097 ) ( IS-CRATE ?auto_9093 ) ( not ( = ?auto_9092 ?auto_9097 ) ) ( not ( = ?auto_9093 ?auto_9097 ) ) ( not ( = ?auto_9098 ?auto_9097 ) ) ( AVAILABLE ?auto_9099 ) ( IN ?auto_9093 ?auto_9095 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9099 ?auto_9093 ?auto_9095 ?auto_9094 )
      ( MAKE-ON ?auto_9092 ?auto_9093 )
      ( MAKE-ON-VERIFY ?auto_9092 ?auto_9093 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9107 - SURFACE
      ?auto_9108 - SURFACE
    )
    :vars
    (
      ?auto_9111 - HOIST
      ?auto_9109 - PLACE
      ?auto_9113 - PLACE
      ?auto_9114 - HOIST
      ?auto_9112 - SURFACE
      ?auto_9110 - TRUCK
      ?auto_9115 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9111 ?auto_9109 ) ( SURFACE-AT ?auto_9108 ?auto_9109 ) ( CLEAR ?auto_9108 ) ( IS-CRATE ?auto_9107 ) ( not ( = ?auto_9107 ?auto_9108 ) ) ( AVAILABLE ?auto_9111 ) ( not ( = ?auto_9113 ?auto_9109 ) ) ( HOIST-AT ?auto_9114 ?auto_9113 ) ( not ( = ?auto_9111 ?auto_9114 ) ) ( AVAILABLE ?auto_9114 ) ( SURFACE-AT ?auto_9107 ?auto_9113 ) ( ON ?auto_9107 ?auto_9112 ) ( CLEAR ?auto_9107 ) ( not ( = ?auto_9107 ?auto_9112 ) ) ( not ( = ?auto_9108 ?auto_9112 ) ) ( TRUCK-AT ?auto_9110 ?auto_9115 ) ( not ( = ?auto_9115 ?auto_9109 ) ) ( not ( = ?auto_9113 ?auto_9115 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9110 ?auto_9115 ?auto_9109 )
      ( MAKE-ON ?auto_9107 ?auto_9108 )
      ( MAKE-ON-VERIFY ?auto_9107 ?auto_9108 ) )
  )

)

