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

  ( :method MAKE-16CRATE-VERIFY
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
      ?c16 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( ON ?c16 ?c15 ) ( CLEAR ?c16 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27054 - SURFACE
      ?auto_27055 - SURFACE
    )
    :vars
    (
      ?auto_27056 - HOIST
      ?auto_27057 - PLACE
      ?auto_27059 - PLACE
      ?auto_27060 - HOIST
      ?auto_27061 - SURFACE
      ?auto_27058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27056 ?auto_27057 ) ( SURFACE-AT ?auto_27054 ?auto_27057 ) ( CLEAR ?auto_27054 ) ( IS-CRATE ?auto_27055 ) ( AVAILABLE ?auto_27056 ) ( not ( = ?auto_27059 ?auto_27057 ) ) ( HOIST-AT ?auto_27060 ?auto_27059 ) ( AVAILABLE ?auto_27060 ) ( SURFACE-AT ?auto_27055 ?auto_27059 ) ( ON ?auto_27055 ?auto_27061 ) ( CLEAR ?auto_27055 ) ( TRUCK-AT ?auto_27058 ?auto_27057 ) ( not ( = ?auto_27054 ?auto_27055 ) ) ( not ( = ?auto_27054 ?auto_27061 ) ) ( not ( = ?auto_27055 ?auto_27061 ) ) ( not ( = ?auto_27056 ?auto_27060 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27058 ?auto_27057 ?auto_27059 )
      ( !LIFT ?auto_27060 ?auto_27055 ?auto_27061 ?auto_27059 )
      ( !LOAD ?auto_27060 ?auto_27055 ?auto_27058 ?auto_27059 )
      ( !DRIVE ?auto_27058 ?auto_27059 ?auto_27057 )
      ( !UNLOAD ?auto_27056 ?auto_27055 ?auto_27058 ?auto_27057 )
      ( !DROP ?auto_27056 ?auto_27055 ?auto_27054 ?auto_27057 )
      ( MAKE-1CRATE-VERIFY ?auto_27054 ?auto_27055 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27064 - SURFACE
      ?auto_27065 - SURFACE
    )
    :vars
    (
      ?auto_27066 - HOIST
      ?auto_27067 - PLACE
      ?auto_27069 - PLACE
      ?auto_27070 - HOIST
      ?auto_27071 - SURFACE
      ?auto_27068 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27066 ?auto_27067 ) ( SURFACE-AT ?auto_27064 ?auto_27067 ) ( CLEAR ?auto_27064 ) ( IS-CRATE ?auto_27065 ) ( AVAILABLE ?auto_27066 ) ( not ( = ?auto_27069 ?auto_27067 ) ) ( HOIST-AT ?auto_27070 ?auto_27069 ) ( AVAILABLE ?auto_27070 ) ( SURFACE-AT ?auto_27065 ?auto_27069 ) ( ON ?auto_27065 ?auto_27071 ) ( CLEAR ?auto_27065 ) ( TRUCK-AT ?auto_27068 ?auto_27067 ) ( not ( = ?auto_27064 ?auto_27065 ) ) ( not ( = ?auto_27064 ?auto_27071 ) ) ( not ( = ?auto_27065 ?auto_27071 ) ) ( not ( = ?auto_27066 ?auto_27070 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27068 ?auto_27067 ?auto_27069 )
      ( !LIFT ?auto_27070 ?auto_27065 ?auto_27071 ?auto_27069 )
      ( !LOAD ?auto_27070 ?auto_27065 ?auto_27068 ?auto_27069 )
      ( !DRIVE ?auto_27068 ?auto_27069 ?auto_27067 )
      ( !UNLOAD ?auto_27066 ?auto_27065 ?auto_27068 ?auto_27067 )
      ( !DROP ?auto_27066 ?auto_27065 ?auto_27064 ?auto_27067 )
      ( MAKE-1CRATE-VERIFY ?auto_27064 ?auto_27065 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27075 - SURFACE
      ?auto_27076 - SURFACE
      ?auto_27077 - SURFACE
    )
    :vars
    (
      ?auto_27080 - HOIST
      ?auto_27079 - PLACE
      ?auto_27082 - PLACE
      ?auto_27078 - HOIST
      ?auto_27081 - SURFACE
      ?auto_27084 - PLACE
      ?auto_27086 - HOIST
      ?auto_27085 - SURFACE
      ?auto_27083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27080 ?auto_27079 ) ( IS-CRATE ?auto_27077 ) ( not ( = ?auto_27082 ?auto_27079 ) ) ( HOIST-AT ?auto_27078 ?auto_27082 ) ( AVAILABLE ?auto_27078 ) ( SURFACE-AT ?auto_27077 ?auto_27082 ) ( ON ?auto_27077 ?auto_27081 ) ( CLEAR ?auto_27077 ) ( not ( = ?auto_27076 ?auto_27077 ) ) ( not ( = ?auto_27076 ?auto_27081 ) ) ( not ( = ?auto_27077 ?auto_27081 ) ) ( not ( = ?auto_27080 ?auto_27078 ) ) ( SURFACE-AT ?auto_27075 ?auto_27079 ) ( CLEAR ?auto_27075 ) ( IS-CRATE ?auto_27076 ) ( AVAILABLE ?auto_27080 ) ( not ( = ?auto_27084 ?auto_27079 ) ) ( HOIST-AT ?auto_27086 ?auto_27084 ) ( AVAILABLE ?auto_27086 ) ( SURFACE-AT ?auto_27076 ?auto_27084 ) ( ON ?auto_27076 ?auto_27085 ) ( CLEAR ?auto_27076 ) ( TRUCK-AT ?auto_27083 ?auto_27079 ) ( not ( = ?auto_27075 ?auto_27076 ) ) ( not ( = ?auto_27075 ?auto_27085 ) ) ( not ( = ?auto_27076 ?auto_27085 ) ) ( not ( = ?auto_27080 ?auto_27086 ) ) ( not ( = ?auto_27075 ?auto_27077 ) ) ( not ( = ?auto_27075 ?auto_27081 ) ) ( not ( = ?auto_27077 ?auto_27085 ) ) ( not ( = ?auto_27082 ?auto_27084 ) ) ( not ( = ?auto_27078 ?auto_27086 ) ) ( not ( = ?auto_27081 ?auto_27085 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27075 ?auto_27076 )
      ( MAKE-1CRATE ?auto_27076 ?auto_27077 )
      ( MAKE-2CRATE-VERIFY ?auto_27075 ?auto_27076 ?auto_27077 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27089 - SURFACE
      ?auto_27090 - SURFACE
    )
    :vars
    (
      ?auto_27091 - HOIST
      ?auto_27092 - PLACE
      ?auto_27094 - PLACE
      ?auto_27095 - HOIST
      ?auto_27096 - SURFACE
      ?auto_27093 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27091 ?auto_27092 ) ( SURFACE-AT ?auto_27089 ?auto_27092 ) ( CLEAR ?auto_27089 ) ( IS-CRATE ?auto_27090 ) ( AVAILABLE ?auto_27091 ) ( not ( = ?auto_27094 ?auto_27092 ) ) ( HOIST-AT ?auto_27095 ?auto_27094 ) ( AVAILABLE ?auto_27095 ) ( SURFACE-AT ?auto_27090 ?auto_27094 ) ( ON ?auto_27090 ?auto_27096 ) ( CLEAR ?auto_27090 ) ( TRUCK-AT ?auto_27093 ?auto_27092 ) ( not ( = ?auto_27089 ?auto_27090 ) ) ( not ( = ?auto_27089 ?auto_27096 ) ) ( not ( = ?auto_27090 ?auto_27096 ) ) ( not ( = ?auto_27091 ?auto_27095 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27093 ?auto_27092 ?auto_27094 )
      ( !LIFT ?auto_27095 ?auto_27090 ?auto_27096 ?auto_27094 )
      ( !LOAD ?auto_27095 ?auto_27090 ?auto_27093 ?auto_27094 )
      ( !DRIVE ?auto_27093 ?auto_27094 ?auto_27092 )
      ( !UNLOAD ?auto_27091 ?auto_27090 ?auto_27093 ?auto_27092 )
      ( !DROP ?auto_27091 ?auto_27090 ?auto_27089 ?auto_27092 )
      ( MAKE-1CRATE-VERIFY ?auto_27089 ?auto_27090 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27101 - SURFACE
      ?auto_27102 - SURFACE
      ?auto_27103 - SURFACE
      ?auto_27104 - SURFACE
    )
    :vars
    (
      ?auto_27106 - HOIST
      ?auto_27105 - PLACE
      ?auto_27110 - PLACE
      ?auto_27108 - HOIST
      ?auto_27109 - SURFACE
      ?auto_27114 - PLACE
      ?auto_27113 - HOIST
      ?auto_27115 - SURFACE
      ?auto_27116 - PLACE
      ?auto_27112 - HOIST
      ?auto_27111 - SURFACE
      ?auto_27107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27106 ?auto_27105 ) ( IS-CRATE ?auto_27104 ) ( not ( = ?auto_27110 ?auto_27105 ) ) ( HOIST-AT ?auto_27108 ?auto_27110 ) ( AVAILABLE ?auto_27108 ) ( SURFACE-AT ?auto_27104 ?auto_27110 ) ( ON ?auto_27104 ?auto_27109 ) ( CLEAR ?auto_27104 ) ( not ( = ?auto_27103 ?auto_27104 ) ) ( not ( = ?auto_27103 ?auto_27109 ) ) ( not ( = ?auto_27104 ?auto_27109 ) ) ( not ( = ?auto_27106 ?auto_27108 ) ) ( IS-CRATE ?auto_27103 ) ( not ( = ?auto_27114 ?auto_27105 ) ) ( HOIST-AT ?auto_27113 ?auto_27114 ) ( AVAILABLE ?auto_27113 ) ( SURFACE-AT ?auto_27103 ?auto_27114 ) ( ON ?auto_27103 ?auto_27115 ) ( CLEAR ?auto_27103 ) ( not ( = ?auto_27102 ?auto_27103 ) ) ( not ( = ?auto_27102 ?auto_27115 ) ) ( not ( = ?auto_27103 ?auto_27115 ) ) ( not ( = ?auto_27106 ?auto_27113 ) ) ( SURFACE-AT ?auto_27101 ?auto_27105 ) ( CLEAR ?auto_27101 ) ( IS-CRATE ?auto_27102 ) ( AVAILABLE ?auto_27106 ) ( not ( = ?auto_27116 ?auto_27105 ) ) ( HOIST-AT ?auto_27112 ?auto_27116 ) ( AVAILABLE ?auto_27112 ) ( SURFACE-AT ?auto_27102 ?auto_27116 ) ( ON ?auto_27102 ?auto_27111 ) ( CLEAR ?auto_27102 ) ( TRUCK-AT ?auto_27107 ?auto_27105 ) ( not ( = ?auto_27101 ?auto_27102 ) ) ( not ( = ?auto_27101 ?auto_27111 ) ) ( not ( = ?auto_27102 ?auto_27111 ) ) ( not ( = ?auto_27106 ?auto_27112 ) ) ( not ( = ?auto_27101 ?auto_27103 ) ) ( not ( = ?auto_27101 ?auto_27115 ) ) ( not ( = ?auto_27103 ?auto_27111 ) ) ( not ( = ?auto_27114 ?auto_27116 ) ) ( not ( = ?auto_27113 ?auto_27112 ) ) ( not ( = ?auto_27115 ?auto_27111 ) ) ( not ( = ?auto_27101 ?auto_27104 ) ) ( not ( = ?auto_27101 ?auto_27109 ) ) ( not ( = ?auto_27102 ?auto_27104 ) ) ( not ( = ?auto_27102 ?auto_27109 ) ) ( not ( = ?auto_27104 ?auto_27115 ) ) ( not ( = ?auto_27104 ?auto_27111 ) ) ( not ( = ?auto_27110 ?auto_27114 ) ) ( not ( = ?auto_27110 ?auto_27116 ) ) ( not ( = ?auto_27108 ?auto_27113 ) ) ( not ( = ?auto_27108 ?auto_27112 ) ) ( not ( = ?auto_27109 ?auto_27115 ) ) ( not ( = ?auto_27109 ?auto_27111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27101 ?auto_27102 ?auto_27103 )
      ( MAKE-1CRATE ?auto_27103 ?auto_27104 )
      ( MAKE-3CRATE-VERIFY ?auto_27101 ?auto_27102 ?auto_27103 ?auto_27104 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27119 - SURFACE
      ?auto_27120 - SURFACE
    )
    :vars
    (
      ?auto_27121 - HOIST
      ?auto_27122 - PLACE
      ?auto_27124 - PLACE
      ?auto_27125 - HOIST
      ?auto_27126 - SURFACE
      ?auto_27123 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27121 ?auto_27122 ) ( SURFACE-AT ?auto_27119 ?auto_27122 ) ( CLEAR ?auto_27119 ) ( IS-CRATE ?auto_27120 ) ( AVAILABLE ?auto_27121 ) ( not ( = ?auto_27124 ?auto_27122 ) ) ( HOIST-AT ?auto_27125 ?auto_27124 ) ( AVAILABLE ?auto_27125 ) ( SURFACE-AT ?auto_27120 ?auto_27124 ) ( ON ?auto_27120 ?auto_27126 ) ( CLEAR ?auto_27120 ) ( TRUCK-AT ?auto_27123 ?auto_27122 ) ( not ( = ?auto_27119 ?auto_27120 ) ) ( not ( = ?auto_27119 ?auto_27126 ) ) ( not ( = ?auto_27120 ?auto_27126 ) ) ( not ( = ?auto_27121 ?auto_27125 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27123 ?auto_27122 ?auto_27124 )
      ( !LIFT ?auto_27125 ?auto_27120 ?auto_27126 ?auto_27124 )
      ( !LOAD ?auto_27125 ?auto_27120 ?auto_27123 ?auto_27124 )
      ( !DRIVE ?auto_27123 ?auto_27124 ?auto_27122 )
      ( !UNLOAD ?auto_27121 ?auto_27120 ?auto_27123 ?auto_27122 )
      ( !DROP ?auto_27121 ?auto_27120 ?auto_27119 ?auto_27122 )
      ( MAKE-1CRATE-VERIFY ?auto_27119 ?auto_27120 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27132 - SURFACE
      ?auto_27133 - SURFACE
      ?auto_27134 - SURFACE
      ?auto_27135 - SURFACE
      ?auto_27136 - SURFACE
    )
    :vars
    (
      ?auto_27137 - HOIST
      ?auto_27141 - PLACE
      ?auto_27140 - PLACE
      ?auto_27139 - HOIST
      ?auto_27142 - SURFACE
      ?auto_27147 - PLACE
      ?auto_27144 - HOIST
      ?auto_27145 - SURFACE
      ?auto_27151 - PLACE
      ?auto_27150 - HOIST
      ?auto_27148 - SURFACE
      ?auto_27149 - PLACE
      ?auto_27146 - HOIST
      ?auto_27143 - SURFACE
      ?auto_27138 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27137 ?auto_27141 ) ( IS-CRATE ?auto_27136 ) ( not ( = ?auto_27140 ?auto_27141 ) ) ( HOIST-AT ?auto_27139 ?auto_27140 ) ( AVAILABLE ?auto_27139 ) ( SURFACE-AT ?auto_27136 ?auto_27140 ) ( ON ?auto_27136 ?auto_27142 ) ( CLEAR ?auto_27136 ) ( not ( = ?auto_27135 ?auto_27136 ) ) ( not ( = ?auto_27135 ?auto_27142 ) ) ( not ( = ?auto_27136 ?auto_27142 ) ) ( not ( = ?auto_27137 ?auto_27139 ) ) ( IS-CRATE ?auto_27135 ) ( not ( = ?auto_27147 ?auto_27141 ) ) ( HOIST-AT ?auto_27144 ?auto_27147 ) ( AVAILABLE ?auto_27144 ) ( SURFACE-AT ?auto_27135 ?auto_27147 ) ( ON ?auto_27135 ?auto_27145 ) ( CLEAR ?auto_27135 ) ( not ( = ?auto_27134 ?auto_27135 ) ) ( not ( = ?auto_27134 ?auto_27145 ) ) ( not ( = ?auto_27135 ?auto_27145 ) ) ( not ( = ?auto_27137 ?auto_27144 ) ) ( IS-CRATE ?auto_27134 ) ( not ( = ?auto_27151 ?auto_27141 ) ) ( HOIST-AT ?auto_27150 ?auto_27151 ) ( AVAILABLE ?auto_27150 ) ( SURFACE-AT ?auto_27134 ?auto_27151 ) ( ON ?auto_27134 ?auto_27148 ) ( CLEAR ?auto_27134 ) ( not ( = ?auto_27133 ?auto_27134 ) ) ( not ( = ?auto_27133 ?auto_27148 ) ) ( not ( = ?auto_27134 ?auto_27148 ) ) ( not ( = ?auto_27137 ?auto_27150 ) ) ( SURFACE-AT ?auto_27132 ?auto_27141 ) ( CLEAR ?auto_27132 ) ( IS-CRATE ?auto_27133 ) ( AVAILABLE ?auto_27137 ) ( not ( = ?auto_27149 ?auto_27141 ) ) ( HOIST-AT ?auto_27146 ?auto_27149 ) ( AVAILABLE ?auto_27146 ) ( SURFACE-AT ?auto_27133 ?auto_27149 ) ( ON ?auto_27133 ?auto_27143 ) ( CLEAR ?auto_27133 ) ( TRUCK-AT ?auto_27138 ?auto_27141 ) ( not ( = ?auto_27132 ?auto_27133 ) ) ( not ( = ?auto_27132 ?auto_27143 ) ) ( not ( = ?auto_27133 ?auto_27143 ) ) ( not ( = ?auto_27137 ?auto_27146 ) ) ( not ( = ?auto_27132 ?auto_27134 ) ) ( not ( = ?auto_27132 ?auto_27148 ) ) ( not ( = ?auto_27134 ?auto_27143 ) ) ( not ( = ?auto_27151 ?auto_27149 ) ) ( not ( = ?auto_27150 ?auto_27146 ) ) ( not ( = ?auto_27148 ?auto_27143 ) ) ( not ( = ?auto_27132 ?auto_27135 ) ) ( not ( = ?auto_27132 ?auto_27145 ) ) ( not ( = ?auto_27133 ?auto_27135 ) ) ( not ( = ?auto_27133 ?auto_27145 ) ) ( not ( = ?auto_27135 ?auto_27148 ) ) ( not ( = ?auto_27135 ?auto_27143 ) ) ( not ( = ?auto_27147 ?auto_27151 ) ) ( not ( = ?auto_27147 ?auto_27149 ) ) ( not ( = ?auto_27144 ?auto_27150 ) ) ( not ( = ?auto_27144 ?auto_27146 ) ) ( not ( = ?auto_27145 ?auto_27148 ) ) ( not ( = ?auto_27145 ?auto_27143 ) ) ( not ( = ?auto_27132 ?auto_27136 ) ) ( not ( = ?auto_27132 ?auto_27142 ) ) ( not ( = ?auto_27133 ?auto_27136 ) ) ( not ( = ?auto_27133 ?auto_27142 ) ) ( not ( = ?auto_27134 ?auto_27136 ) ) ( not ( = ?auto_27134 ?auto_27142 ) ) ( not ( = ?auto_27136 ?auto_27145 ) ) ( not ( = ?auto_27136 ?auto_27148 ) ) ( not ( = ?auto_27136 ?auto_27143 ) ) ( not ( = ?auto_27140 ?auto_27147 ) ) ( not ( = ?auto_27140 ?auto_27151 ) ) ( not ( = ?auto_27140 ?auto_27149 ) ) ( not ( = ?auto_27139 ?auto_27144 ) ) ( not ( = ?auto_27139 ?auto_27150 ) ) ( not ( = ?auto_27139 ?auto_27146 ) ) ( not ( = ?auto_27142 ?auto_27145 ) ) ( not ( = ?auto_27142 ?auto_27148 ) ) ( not ( = ?auto_27142 ?auto_27143 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_27132 ?auto_27133 ?auto_27134 ?auto_27135 )
      ( MAKE-1CRATE ?auto_27135 ?auto_27136 )
      ( MAKE-4CRATE-VERIFY ?auto_27132 ?auto_27133 ?auto_27134 ?auto_27135 ?auto_27136 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27154 - SURFACE
      ?auto_27155 - SURFACE
    )
    :vars
    (
      ?auto_27156 - HOIST
      ?auto_27157 - PLACE
      ?auto_27159 - PLACE
      ?auto_27160 - HOIST
      ?auto_27161 - SURFACE
      ?auto_27158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27156 ?auto_27157 ) ( SURFACE-AT ?auto_27154 ?auto_27157 ) ( CLEAR ?auto_27154 ) ( IS-CRATE ?auto_27155 ) ( AVAILABLE ?auto_27156 ) ( not ( = ?auto_27159 ?auto_27157 ) ) ( HOIST-AT ?auto_27160 ?auto_27159 ) ( AVAILABLE ?auto_27160 ) ( SURFACE-AT ?auto_27155 ?auto_27159 ) ( ON ?auto_27155 ?auto_27161 ) ( CLEAR ?auto_27155 ) ( TRUCK-AT ?auto_27158 ?auto_27157 ) ( not ( = ?auto_27154 ?auto_27155 ) ) ( not ( = ?auto_27154 ?auto_27161 ) ) ( not ( = ?auto_27155 ?auto_27161 ) ) ( not ( = ?auto_27156 ?auto_27160 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27158 ?auto_27157 ?auto_27159 )
      ( !LIFT ?auto_27160 ?auto_27155 ?auto_27161 ?auto_27159 )
      ( !LOAD ?auto_27160 ?auto_27155 ?auto_27158 ?auto_27159 )
      ( !DRIVE ?auto_27158 ?auto_27159 ?auto_27157 )
      ( !UNLOAD ?auto_27156 ?auto_27155 ?auto_27158 ?auto_27157 )
      ( !DROP ?auto_27156 ?auto_27155 ?auto_27154 ?auto_27157 )
      ( MAKE-1CRATE-VERIFY ?auto_27154 ?auto_27155 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27168 - SURFACE
      ?auto_27169 - SURFACE
      ?auto_27170 - SURFACE
      ?auto_27171 - SURFACE
      ?auto_27172 - SURFACE
      ?auto_27173 - SURFACE
    )
    :vars
    (
      ?auto_27179 - HOIST
      ?auto_27178 - PLACE
      ?auto_27176 - PLACE
      ?auto_27177 - HOIST
      ?auto_27174 - SURFACE
      ?auto_27180 - PLACE
      ?auto_27190 - HOIST
      ?auto_27187 - SURFACE
      ?auto_27182 - PLACE
      ?auto_27181 - HOIST
      ?auto_27185 - SURFACE
      ?auto_27189 - PLACE
      ?auto_27183 - HOIST
      ?auto_27191 - SURFACE
      ?auto_27184 - PLACE
      ?auto_27186 - HOIST
      ?auto_27188 - SURFACE
      ?auto_27175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27179 ?auto_27178 ) ( IS-CRATE ?auto_27173 ) ( not ( = ?auto_27176 ?auto_27178 ) ) ( HOIST-AT ?auto_27177 ?auto_27176 ) ( AVAILABLE ?auto_27177 ) ( SURFACE-AT ?auto_27173 ?auto_27176 ) ( ON ?auto_27173 ?auto_27174 ) ( CLEAR ?auto_27173 ) ( not ( = ?auto_27172 ?auto_27173 ) ) ( not ( = ?auto_27172 ?auto_27174 ) ) ( not ( = ?auto_27173 ?auto_27174 ) ) ( not ( = ?auto_27179 ?auto_27177 ) ) ( IS-CRATE ?auto_27172 ) ( not ( = ?auto_27180 ?auto_27178 ) ) ( HOIST-AT ?auto_27190 ?auto_27180 ) ( AVAILABLE ?auto_27190 ) ( SURFACE-AT ?auto_27172 ?auto_27180 ) ( ON ?auto_27172 ?auto_27187 ) ( CLEAR ?auto_27172 ) ( not ( = ?auto_27171 ?auto_27172 ) ) ( not ( = ?auto_27171 ?auto_27187 ) ) ( not ( = ?auto_27172 ?auto_27187 ) ) ( not ( = ?auto_27179 ?auto_27190 ) ) ( IS-CRATE ?auto_27171 ) ( not ( = ?auto_27182 ?auto_27178 ) ) ( HOIST-AT ?auto_27181 ?auto_27182 ) ( AVAILABLE ?auto_27181 ) ( SURFACE-AT ?auto_27171 ?auto_27182 ) ( ON ?auto_27171 ?auto_27185 ) ( CLEAR ?auto_27171 ) ( not ( = ?auto_27170 ?auto_27171 ) ) ( not ( = ?auto_27170 ?auto_27185 ) ) ( not ( = ?auto_27171 ?auto_27185 ) ) ( not ( = ?auto_27179 ?auto_27181 ) ) ( IS-CRATE ?auto_27170 ) ( not ( = ?auto_27189 ?auto_27178 ) ) ( HOIST-AT ?auto_27183 ?auto_27189 ) ( AVAILABLE ?auto_27183 ) ( SURFACE-AT ?auto_27170 ?auto_27189 ) ( ON ?auto_27170 ?auto_27191 ) ( CLEAR ?auto_27170 ) ( not ( = ?auto_27169 ?auto_27170 ) ) ( not ( = ?auto_27169 ?auto_27191 ) ) ( not ( = ?auto_27170 ?auto_27191 ) ) ( not ( = ?auto_27179 ?auto_27183 ) ) ( SURFACE-AT ?auto_27168 ?auto_27178 ) ( CLEAR ?auto_27168 ) ( IS-CRATE ?auto_27169 ) ( AVAILABLE ?auto_27179 ) ( not ( = ?auto_27184 ?auto_27178 ) ) ( HOIST-AT ?auto_27186 ?auto_27184 ) ( AVAILABLE ?auto_27186 ) ( SURFACE-AT ?auto_27169 ?auto_27184 ) ( ON ?auto_27169 ?auto_27188 ) ( CLEAR ?auto_27169 ) ( TRUCK-AT ?auto_27175 ?auto_27178 ) ( not ( = ?auto_27168 ?auto_27169 ) ) ( not ( = ?auto_27168 ?auto_27188 ) ) ( not ( = ?auto_27169 ?auto_27188 ) ) ( not ( = ?auto_27179 ?auto_27186 ) ) ( not ( = ?auto_27168 ?auto_27170 ) ) ( not ( = ?auto_27168 ?auto_27191 ) ) ( not ( = ?auto_27170 ?auto_27188 ) ) ( not ( = ?auto_27189 ?auto_27184 ) ) ( not ( = ?auto_27183 ?auto_27186 ) ) ( not ( = ?auto_27191 ?auto_27188 ) ) ( not ( = ?auto_27168 ?auto_27171 ) ) ( not ( = ?auto_27168 ?auto_27185 ) ) ( not ( = ?auto_27169 ?auto_27171 ) ) ( not ( = ?auto_27169 ?auto_27185 ) ) ( not ( = ?auto_27171 ?auto_27191 ) ) ( not ( = ?auto_27171 ?auto_27188 ) ) ( not ( = ?auto_27182 ?auto_27189 ) ) ( not ( = ?auto_27182 ?auto_27184 ) ) ( not ( = ?auto_27181 ?auto_27183 ) ) ( not ( = ?auto_27181 ?auto_27186 ) ) ( not ( = ?auto_27185 ?auto_27191 ) ) ( not ( = ?auto_27185 ?auto_27188 ) ) ( not ( = ?auto_27168 ?auto_27172 ) ) ( not ( = ?auto_27168 ?auto_27187 ) ) ( not ( = ?auto_27169 ?auto_27172 ) ) ( not ( = ?auto_27169 ?auto_27187 ) ) ( not ( = ?auto_27170 ?auto_27172 ) ) ( not ( = ?auto_27170 ?auto_27187 ) ) ( not ( = ?auto_27172 ?auto_27185 ) ) ( not ( = ?auto_27172 ?auto_27191 ) ) ( not ( = ?auto_27172 ?auto_27188 ) ) ( not ( = ?auto_27180 ?auto_27182 ) ) ( not ( = ?auto_27180 ?auto_27189 ) ) ( not ( = ?auto_27180 ?auto_27184 ) ) ( not ( = ?auto_27190 ?auto_27181 ) ) ( not ( = ?auto_27190 ?auto_27183 ) ) ( not ( = ?auto_27190 ?auto_27186 ) ) ( not ( = ?auto_27187 ?auto_27185 ) ) ( not ( = ?auto_27187 ?auto_27191 ) ) ( not ( = ?auto_27187 ?auto_27188 ) ) ( not ( = ?auto_27168 ?auto_27173 ) ) ( not ( = ?auto_27168 ?auto_27174 ) ) ( not ( = ?auto_27169 ?auto_27173 ) ) ( not ( = ?auto_27169 ?auto_27174 ) ) ( not ( = ?auto_27170 ?auto_27173 ) ) ( not ( = ?auto_27170 ?auto_27174 ) ) ( not ( = ?auto_27171 ?auto_27173 ) ) ( not ( = ?auto_27171 ?auto_27174 ) ) ( not ( = ?auto_27173 ?auto_27187 ) ) ( not ( = ?auto_27173 ?auto_27185 ) ) ( not ( = ?auto_27173 ?auto_27191 ) ) ( not ( = ?auto_27173 ?auto_27188 ) ) ( not ( = ?auto_27176 ?auto_27180 ) ) ( not ( = ?auto_27176 ?auto_27182 ) ) ( not ( = ?auto_27176 ?auto_27189 ) ) ( not ( = ?auto_27176 ?auto_27184 ) ) ( not ( = ?auto_27177 ?auto_27190 ) ) ( not ( = ?auto_27177 ?auto_27181 ) ) ( not ( = ?auto_27177 ?auto_27183 ) ) ( not ( = ?auto_27177 ?auto_27186 ) ) ( not ( = ?auto_27174 ?auto_27187 ) ) ( not ( = ?auto_27174 ?auto_27185 ) ) ( not ( = ?auto_27174 ?auto_27191 ) ) ( not ( = ?auto_27174 ?auto_27188 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_27168 ?auto_27169 ?auto_27170 ?auto_27171 ?auto_27172 )
      ( MAKE-1CRATE ?auto_27172 ?auto_27173 )
      ( MAKE-5CRATE-VERIFY ?auto_27168 ?auto_27169 ?auto_27170 ?auto_27171 ?auto_27172 ?auto_27173 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27194 - SURFACE
      ?auto_27195 - SURFACE
    )
    :vars
    (
      ?auto_27196 - HOIST
      ?auto_27197 - PLACE
      ?auto_27199 - PLACE
      ?auto_27200 - HOIST
      ?auto_27201 - SURFACE
      ?auto_27198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27196 ?auto_27197 ) ( SURFACE-AT ?auto_27194 ?auto_27197 ) ( CLEAR ?auto_27194 ) ( IS-CRATE ?auto_27195 ) ( AVAILABLE ?auto_27196 ) ( not ( = ?auto_27199 ?auto_27197 ) ) ( HOIST-AT ?auto_27200 ?auto_27199 ) ( AVAILABLE ?auto_27200 ) ( SURFACE-AT ?auto_27195 ?auto_27199 ) ( ON ?auto_27195 ?auto_27201 ) ( CLEAR ?auto_27195 ) ( TRUCK-AT ?auto_27198 ?auto_27197 ) ( not ( = ?auto_27194 ?auto_27195 ) ) ( not ( = ?auto_27194 ?auto_27201 ) ) ( not ( = ?auto_27195 ?auto_27201 ) ) ( not ( = ?auto_27196 ?auto_27200 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27198 ?auto_27197 ?auto_27199 )
      ( !LIFT ?auto_27200 ?auto_27195 ?auto_27201 ?auto_27199 )
      ( !LOAD ?auto_27200 ?auto_27195 ?auto_27198 ?auto_27199 )
      ( !DRIVE ?auto_27198 ?auto_27199 ?auto_27197 )
      ( !UNLOAD ?auto_27196 ?auto_27195 ?auto_27198 ?auto_27197 )
      ( !DROP ?auto_27196 ?auto_27195 ?auto_27194 ?auto_27197 )
      ( MAKE-1CRATE-VERIFY ?auto_27194 ?auto_27195 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_27209 - SURFACE
      ?auto_27210 - SURFACE
      ?auto_27211 - SURFACE
      ?auto_27212 - SURFACE
      ?auto_27213 - SURFACE
      ?auto_27215 - SURFACE
      ?auto_27214 - SURFACE
    )
    :vars
    (
      ?auto_27219 - HOIST
      ?auto_27221 - PLACE
      ?auto_27216 - PLACE
      ?auto_27220 - HOIST
      ?auto_27218 - SURFACE
      ?auto_27226 - PLACE
      ?auto_27234 - HOIST
      ?auto_27235 - SURFACE
      ?auto_27236 - PLACE
      ?auto_27227 - HOIST
      ?auto_27223 - SURFACE
      ?auto_27229 - PLACE
      ?auto_27228 - HOIST
      ?auto_27225 - SURFACE
      ?auto_27232 - PLACE
      ?auto_27222 - HOIST
      ?auto_27233 - SURFACE
      ?auto_27231 - PLACE
      ?auto_27224 - HOIST
      ?auto_27230 - SURFACE
      ?auto_27217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27219 ?auto_27221 ) ( IS-CRATE ?auto_27214 ) ( not ( = ?auto_27216 ?auto_27221 ) ) ( HOIST-AT ?auto_27220 ?auto_27216 ) ( AVAILABLE ?auto_27220 ) ( SURFACE-AT ?auto_27214 ?auto_27216 ) ( ON ?auto_27214 ?auto_27218 ) ( CLEAR ?auto_27214 ) ( not ( = ?auto_27215 ?auto_27214 ) ) ( not ( = ?auto_27215 ?auto_27218 ) ) ( not ( = ?auto_27214 ?auto_27218 ) ) ( not ( = ?auto_27219 ?auto_27220 ) ) ( IS-CRATE ?auto_27215 ) ( not ( = ?auto_27226 ?auto_27221 ) ) ( HOIST-AT ?auto_27234 ?auto_27226 ) ( AVAILABLE ?auto_27234 ) ( SURFACE-AT ?auto_27215 ?auto_27226 ) ( ON ?auto_27215 ?auto_27235 ) ( CLEAR ?auto_27215 ) ( not ( = ?auto_27213 ?auto_27215 ) ) ( not ( = ?auto_27213 ?auto_27235 ) ) ( not ( = ?auto_27215 ?auto_27235 ) ) ( not ( = ?auto_27219 ?auto_27234 ) ) ( IS-CRATE ?auto_27213 ) ( not ( = ?auto_27236 ?auto_27221 ) ) ( HOIST-AT ?auto_27227 ?auto_27236 ) ( AVAILABLE ?auto_27227 ) ( SURFACE-AT ?auto_27213 ?auto_27236 ) ( ON ?auto_27213 ?auto_27223 ) ( CLEAR ?auto_27213 ) ( not ( = ?auto_27212 ?auto_27213 ) ) ( not ( = ?auto_27212 ?auto_27223 ) ) ( not ( = ?auto_27213 ?auto_27223 ) ) ( not ( = ?auto_27219 ?auto_27227 ) ) ( IS-CRATE ?auto_27212 ) ( not ( = ?auto_27229 ?auto_27221 ) ) ( HOIST-AT ?auto_27228 ?auto_27229 ) ( AVAILABLE ?auto_27228 ) ( SURFACE-AT ?auto_27212 ?auto_27229 ) ( ON ?auto_27212 ?auto_27225 ) ( CLEAR ?auto_27212 ) ( not ( = ?auto_27211 ?auto_27212 ) ) ( not ( = ?auto_27211 ?auto_27225 ) ) ( not ( = ?auto_27212 ?auto_27225 ) ) ( not ( = ?auto_27219 ?auto_27228 ) ) ( IS-CRATE ?auto_27211 ) ( not ( = ?auto_27232 ?auto_27221 ) ) ( HOIST-AT ?auto_27222 ?auto_27232 ) ( AVAILABLE ?auto_27222 ) ( SURFACE-AT ?auto_27211 ?auto_27232 ) ( ON ?auto_27211 ?auto_27233 ) ( CLEAR ?auto_27211 ) ( not ( = ?auto_27210 ?auto_27211 ) ) ( not ( = ?auto_27210 ?auto_27233 ) ) ( not ( = ?auto_27211 ?auto_27233 ) ) ( not ( = ?auto_27219 ?auto_27222 ) ) ( SURFACE-AT ?auto_27209 ?auto_27221 ) ( CLEAR ?auto_27209 ) ( IS-CRATE ?auto_27210 ) ( AVAILABLE ?auto_27219 ) ( not ( = ?auto_27231 ?auto_27221 ) ) ( HOIST-AT ?auto_27224 ?auto_27231 ) ( AVAILABLE ?auto_27224 ) ( SURFACE-AT ?auto_27210 ?auto_27231 ) ( ON ?auto_27210 ?auto_27230 ) ( CLEAR ?auto_27210 ) ( TRUCK-AT ?auto_27217 ?auto_27221 ) ( not ( = ?auto_27209 ?auto_27210 ) ) ( not ( = ?auto_27209 ?auto_27230 ) ) ( not ( = ?auto_27210 ?auto_27230 ) ) ( not ( = ?auto_27219 ?auto_27224 ) ) ( not ( = ?auto_27209 ?auto_27211 ) ) ( not ( = ?auto_27209 ?auto_27233 ) ) ( not ( = ?auto_27211 ?auto_27230 ) ) ( not ( = ?auto_27232 ?auto_27231 ) ) ( not ( = ?auto_27222 ?auto_27224 ) ) ( not ( = ?auto_27233 ?auto_27230 ) ) ( not ( = ?auto_27209 ?auto_27212 ) ) ( not ( = ?auto_27209 ?auto_27225 ) ) ( not ( = ?auto_27210 ?auto_27212 ) ) ( not ( = ?auto_27210 ?auto_27225 ) ) ( not ( = ?auto_27212 ?auto_27233 ) ) ( not ( = ?auto_27212 ?auto_27230 ) ) ( not ( = ?auto_27229 ?auto_27232 ) ) ( not ( = ?auto_27229 ?auto_27231 ) ) ( not ( = ?auto_27228 ?auto_27222 ) ) ( not ( = ?auto_27228 ?auto_27224 ) ) ( not ( = ?auto_27225 ?auto_27233 ) ) ( not ( = ?auto_27225 ?auto_27230 ) ) ( not ( = ?auto_27209 ?auto_27213 ) ) ( not ( = ?auto_27209 ?auto_27223 ) ) ( not ( = ?auto_27210 ?auto_27213 ) ) ( not ( = ?auto_27210 ?auto_27223 ) ) ( not ( = ?auto_27211 ?auto_27213 ) ) ( not ( = ?auto_27211 ?auto_27223 ) ) ( not ( = ?auto_27213 ?auto_27225 ) ) ( not ( = ?auto_27213 ?auto_27233 ) ) ( not ( = ?auto_27213 ?auto_27230 ) ) ( not ( = ?auto_27236 ?auto_27229 ) ) ( not ( = ?auto_27236 ?auto_27232 ) ) ( not ( = ?auto_27236 ?auto_27231 ) ) ( not ( = ?auto_27227 ?auto_27228 ) ) ( not ( = ?auto_27227 ?auto_27222 ) ) ( not ( = ?auto_27227 ?auto_27224 ) ) ( not ( = ?auto_27223 ?auto_27225 ) ) ( not ( = ?auto_27223 ?auto_27233 ) ) ( not ( = ?auto_27223 ?auto_27230 ) ) ( not ( = ?auto_27209 ?auto_27215 ) ) ( not ( = ?auto_27209 ?auto_27235 ) ) ( not ( = ?auto_27210 ?auto_27215 ) ) ( not ( = ?auto_27210 ?auto_27235 ) ) ( not ( = ?auto_27211 ?auto_27215 ) ) ( not ( = ?auto_27211 ?auto_27235 ) ) ( not ( = ?auto_27212 ?auto_27215 ) ) ( not ( = ?auto_27212 ?auto_27235 ) ) ( not ( = ?auto_27215 ?auto_27223 ) ) ( not ( = ?auto_27215 ?auto_27225 ) ) ( not ( = ?auto_27215 ?auto_27233 ) ) ( not ( = ?auto_27215 ?auto_27230 ) ) ( not ( = ?auto_27226 ?auto_27236 ) ) ( not ( = ?auto_27226 ?auto_27229 ) ) ( not ( = ?auto_27226 ?auto_27232 ) ) ( not ( = ?auto_27226 ?auto_27231 ) ) ( not ( = ?auto_27234 ?auto_27227 ) ) ( not ( = ?auto_27234 ?auto_27228 ) ) ( not ( = ?auto_27234 ?auto_27222 ) ) ( not ( = ?auto_27234 ?auto_27224 ) ) ( not ( = ?auto_27235 ?auto_27223 ) ) ( not ( = ?auto_27235 ?auto_27225 ) ) ( not ( = ?auto_27235 ?auto_27233 ) ) ( not ( = ?auto_27235 ?auto_27230 ) ) ( not ( = ?auto_27209 ?auto_27214 ) ) ( not ( = ?auto_27209 ?auto_27218 ) ) ( not ( = ?auto_27210 ?auto_27214 ) ) ( not ( = ?auto_27210 ?auto_27218 ) ) ( not ( = ?auto_27211 ?auto_27214 ) ) ( not ( = ?auto_27211 ?auto_27218 ) ) ( not ( = ?auto_27212 ?auto_27214 ) ) ( not ( = ?auto_27212 ?auto_27218 ) ) ( not ( = ?auto_27213 ?auto_27214 ) ) ( not ( = ?auto_27213 ?auto_27218 ) ) ( not ( = ?auto_27214 ?auto_27235 ) ) ( not ( = ?auto_27214 ?auto_27223 ) ) ( not ( = ?auto_27214 ?auto_27225 ) ) ( not ( = ?auto_27214 ?auto_27233 ) ) ( not ( = ?auto_27214 ?auto_27230 ) ) ( not ( = ?auto_27216 ?auto_27226 ) ) ( not ( = ?auto_27216 ?auto_27236 ) ) ( not ( = ?auto_27216 ?auto_27229 ) ) ( not ( = ?auto_27216 ?auto_27232 ) ) ( not ( = ?auto_27216 ?auto_27231 ) ) ( not ( = ?auto_27220 ?auto_27234 ) ) ( not ( = ?auto_27220 ?auto_27227 ) ) ( not ( = ?auto_27220 ?auto_27228 ) ) ( not ( = ?auto_27220 ?auto_27222 ) ) ( not ( = ?auto_27220 ?auto_27224 ) ) ( not ( = ?auto_27218 ?auto_27235 ) ) ( not ( = ?auto_27218 ?auto_27223 ) ) ( not ( = ?auto_27218 ?auto_27225 ) ) ( not ( = ?auto_27218 ?auto_27233 ) ) ( not ( = ?auto_27218 ?auto_27230 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_27209 ?auto_27210 ?auto_27211 ?auto_27212 ?auto_27213 ?auto_27215 )
      ( MAKE-1CRATE ?auto_27215 ?auto_27214 )
      ( MAKE-6CRATE-VERIFY ?auto_27209 ?auto_27210 ?auto_27211 ?auto_27212 ?auto_27213 ?auto_27215 ?auto_27214 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27239 - SURFACE
      ?auto_27240 - SURFACE
    )
    :vars
    (
      ?auto_27241 - HOIST
      ?auto_27242 - PLACE
      ?auto_27244 - PLACE
      ?auto_27245 - HOIST
      ?auto_27246 - SURFACE
      ?auto_27243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27241 ?auto_27242 ) ( SURFACE-AT ?auto_27239 ?auto_27242 ) ( CLEAR ?auto_27239 ) ( IS-CRATE ?auto_27240 ) ( AVAILABLE ?auto_27241 ) ( not ( = ?auto_27244 ?auto_27242 ) ) ( HOIST-AT ?auto_27245 ?auto_27244 ) ( AVAILABLE ?auto_27245 ) ( SURFACE-AT ?auto_27240 ?auto_27244 ) ( ON ?auto_27240 ?auto_27246 ) ( CLEAR ?auto_27240 ) ( TRUCK-AT ?auto_27243 ?auto_27242 ) ( not ( = ?auto_27239 ?auto_27240 ) ) ( not ( = ?auto_27239 ?auto_27246 ) ) ( not ( = ?auto_27240 ?auto_27246 ) ) ( not ( = ?auto_27241 ?auto_27245 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27243 ?auto_27242 ?auto_27244 )
      ( !LIFT ?auto_27245 ?auto_27240 ?auto_27246 ?auto_27244 )
      ( !LOAD ?auto_27245 ?auto_27240 ?auto_27243 ?auto_27244 )
      ( !DRIVE ?auto_27243 ?auto_27244 ?auto_27242 )
      ( !UNLOAD ?auto_27241 ?auto_27240 ?auto_27243 ?auto_27242 )
      ( !DROP ?auto_27241 ?auto_27240 ?auto_27239 ?auto_27242 )
      ( MAKE-1CRATE-VERIFY ?auto_27239 ?auto_27240 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_27255 - SURFACE
      ?auto_27256 - SURFACE
      ?auto_27257 - SURFACE
      ?auto_27258 - SURFACE
      ?auto_27259 - SURFACE
      ?auto_27261 - SURFACE
      ?auto_27260 - SURFACE
      ?auto_27262 - SURFACE
    )
    :vars
    (
      ?auto_27263 - HOIST
      ?auto_27267 - PLACE
      ?auto_27268 - PLACE
      ?auto_27266 - HOIST
      ?auto_27265 - SURFACE
      ?auto_27281 - PLACE
      ?auto_27279 - HOIST
      ?auto_27280 - SURFACE
      ?auto_27284 - PLACE
      ?auto_27276 - HOIST
      ?auto_27277 - SURFACE
      ?auto_27274 - PLACE
      ?auto_27283 - HOIST
      ?auto_27273 - SURFACE
      ?auto_27278 - PLACE
      ?auto_27282 - HOIST
      ?auto_27272 - SURFACE
      ?auto_27270 - PLACE
      ?auto_27271 - HOIST
      ?auto_27275 - SURFACE
      ?auto_27269 - SURFACE
      ?auto_27264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27263 ?auto_27267 ) ( IS-CRATE ?auto_27262 ) ( not ( = ?auto_27268 ?auto_27267 ) ) ( HOIST-AT ?auto_27266 ?auto_27268 ) ( SURFACE-AT ?auto_27262 ?auto_27268 ) ( ON ?auto_27262 ?auto_27265 ) ( CLEAR ?auto_27262 ) ( not ( = ?auto_27260 ?auto_27262 ) ) ( not ( = ?auto_27260 ?auto_27265 ) ) ( not ( = ?auto_27262 ?auto_27265 ) ) ( not ( = ?auto_27263 ?auto_27266 ) ) ( IS-CRATE ?auto_27260 ) ( not ( = ?auto_27281 ?auto_27267 ) ) ( HOIST-AT ?auto_27279 ?auto_27281 ) ( AVAILABLE ?auto_27279 ) ( SURFACE-AT ?auto_27260 ?auto_27281 ) ( ON ?auto_27260 ?auto_27280 ) ( CLEAR ?auto_27260 ) ( not ( = ?auto_27261 ?auto_27260 ) ) ( not ( = ?auto_27261 ?auto_27280 ) ) ( not ( = ?auto_27260 ?auto_27280 ) ) ( not ( = ?auto_27263 ?auto_27279 ) ) ( IS-CRATE ?auto_27261 ) ( not ( = ?auto_27284 ?auto_27267 ) ) ( HOIST-AT ?auto_27276 ?auto_27284 ) ( AVAILABLE ?auto_27276 ) ( SURFACE-AT ?auto_27261 ?auto_27284 ) ( ON ?auto_27261 ?auto_27277 ) ( CLEAR ?auto_27261 ) ( not ( = ?auto_27259 ?auto_27261 ) ) ( not ( = ?auto_27259 ?auto_27277 ) ) ( not ( = ?auto_27261 ?auto_27277 ) ) ( not ( = ?auto_27263 ?auto_27276 ) ) ( IS-CRATE ?auto_27259 ) ( not ( = ?auto_27274 ?auto_27267 ) ) ( HOIST-AT ?auto_27283 ?auto_27274 ) ( AVAILABLE ?auto_27283 ) ( SURFACE-AT ?auto_27259 ?auto_27274 ) ( ON ?auto_27259 ?auto_27273 ) ( CLEAR ?auto_27259 ) ( not ( = ?auto_27258 ?auto_27259 ) ) ( not ( = ?auto_27258 ?auto_27273 ) ) ( not ( = ?auto_27259 ?auto_27273 ) ) ( not ( = ?auto_27263 ?auto_27283 ) ) ( IS-CRATE ?auto_27258 ) ( not ( = ?auto_27278 ?auto_27267 ) ) ( HOIST-AT ?auto_27282 ?auto_27278 ) ( AVAILABLE ?auto_27282 ) ( SURFACE-AT ?auto_27258 ?auto_27278 ) ( ON ?auto_27258 ?auto_27272 ) ( CLEAR ?auto_27258 ) ( not ( = ?auto_27257 ?auto_27258 ) ) ( not ( = ?auto_27257 ?auto_27272 ) ) ( not ( = ?auto_27258 ?auto_27272 ) ) ( not ( = ?auto_27263 ?auto_27282 ) ) ( IS-CRATE ?auto_27257 ) ( not ( = ?auto_27270 ?auto_27267 ) ) ( HOIST-AT ?auto_27271 ?auto_27270 ) ( AVAILABLE ?auto_27271 ) ( SURFACE-AT ?auto_27257 ?auto_27270 ) ( ON ?auto_27257 ?auto_27275 ) ( CLEAR ?auto_27257 ) ( not ( = ?auto_27256 ?auto_27257 ) ) ( not ( = ?auto_27256 ?auto_27275 ) ) ( not ( = ?auto_27257 ?auto_27275 ) ) ( not ( = ?auto_27263 ?auto_27271 ) ) ( SURFACE-AT ?auto_27255 ?auto_27267 ) ( CLEAR ?auto_27255 ) ( IS-CRATE ?auto_27256 ) ( AVAILABLE ?auto_27263 ) ( AVAILABLE ?auto_27266 ) ( SURFACE-AT ?auto_27256 ?auto_27268 ) ( ON ?auto_27256 ?auto_27269 ) ( CLEAR ?auto_27256 ) ( TRUCK-AT ?auto_27264 ?auto_27267 ) ( not ( = ?auto_27255 ?auto_27256 ) ) ( not ( = ?auto_27255 ?auto_27269 ) ) ( not ( = ?auto_27256 ?auto_27269 ) ) ( not ( = ?auto_27255 ?auto_27257 ) ) ( not ( = ?auto_27255 ?auto_27275 ) ) ( not ( = ?auto_27257 ?auto_27269 ) ) ( not ( = ?auto_27270 ?auto_27268 ) ) ( not ( = ?auto_27271 ?auto_27266 ) ) ( not ( = ?auto_27275 ?auto_27269 ) ) ( not ( = ?auto_27255 ?auto_27258 ) ) ( not ( = ?auto_27255 ?auto_27272 ) ) ( not ( = ?auto_27256 ?auto_27258 ) ) ( not ( = ?auto_27256 ?auto_27272 ) ) ( not ( = ?auto_27258 ?auto_27275 ) ) ( not ( = ?auto_27258 ?auto_27269 ) ) ( not ( = ?auto_27278 ?auto_27270 ) ) ( not ( = ?auto_27278 ?auto_27268 ) ) ( not ( = ?auto_27282 ?auto_27271 ) ) ( not ( = ?auto_27282 ?auto_27266 ) ) ( not ( = ?auto_27272 ?auto_27275 ) ) ( not ( = ?auto_27272 ?auto_27269 ) ) ( not ( = ?auto_27255 ?auto_27259 ) ) ( not ( = ?auto_27255 ?auto_27273 ) ) ( not ( = ?auto_27256 ?auto_27259 ) ) ( not ( = ?auto_27256 ?auto_27273 ) ) ( not ( = ?auto_27257 ?auto_27259 ) ) ( not ( = ?auto_27257 ?auto_27273 ) ) ( not ( = ?auto_27259 ?auto_27272 ) ) ( not ( = ?auto_27259 ?auto_27275 ) ) ( not ( = ?auto_27259 ?auto_27269 ) ) ( not ( = ?auto_27274 ?auto_27278 ) ) ( not ( = ?auto_27274 ?auto_27270 ) ) ( not ( = ?auto_27274 ?auto_27268 ) ) ( not ( = ?auto_27283 ?auto_27282 ) ) ( not ( = ?auto_27283 ?auto_27271 ) ) ( not ( = ?auto_27283 ?auto_27266 ) ) ( not ( = ?auto_27273 ?auto_27272 ) ) ( not ( = ?auto_27273 ?auto_27275 ) ) ( not ( = ?auto_27273 ?auto_27269 ) ) ( not ( = ?auto_27255 ?auto_27261 ) ) ( not ( = ?auto_27255 ?auto_27277 ) ) ( not ( = ?auto_27256 ?auto_27261 ) ) ( not ( = ?auto_27256 ?auto_27277 ) ) ( not ( = ?auto_27257 ?auto_27261 ) ) ( not ( = ?auto_27257 ?auto_27277 ) ) ( not ( = ?auto_27258 ?auto_27261 ) ) ( not ( = ?auto_27258 ?auto_27277 ) ) ( not ( = ?auto_27261 ?auto_27273 ) ) ( not ( = ?auto_27261 ?auto_27272 ) ) ( not ( = ?auto_27261 ?auto_27275 ) ) ( not ( = ?auto_27261 ?auto_27269 ) ) ( not ( = ?auto_27284 ?auto_27274 ) ) ( not ( = ?auto_27284 ?auto_27278 ) ) ( not ( = ?auto_27284 ?auto_27270 ) ) ( not ( = ?auto_27284 ?auto_27268 ) ) ( not ( = ?auto_27276 ?auto_27283 ) ) ( not ( = ?auto_27276 ?auto_27282 ) ) ( not ( = ?auto_27276 ?auto_27271 ) ) ( not ( = ?auto_27276 ?auto_27266 ) ) ( not ( = ?auto_27277 ?auto_27273 ) ) ( not ( = ?auto_27277 ?auto_27272 ) ) ( not ( = ?auto_27277 ?auto_27275 ) ) ( not ( = ?auto_27277 ?auto_27269 ) ) ( not ( = ?auto_27255 ?auto_27260 ) ) ( not ( = ?auto_27255 ?auto_27280 ) ) ( not ( = ?auto_27256 ?auto_27260 ) ) ( not ( = ?auto_27256 ?auto_27280 ) ) ( not ( = ?auto_27257 ?auto_27260 ) ) ( not ( = ?auto_27257 ?auto_27280 ) ) ( not ( = ?auto_27258 ?auto_27260 ) ) ( not ( = ?auto_27258 ?auto_27280 ) ) ( not ( = ?auto_27259 ?auto_27260 ) ) ( not ( = ?auto_27259 ?auto_27280 ) ) ( not ( = ?auto_27260 ?auto_27277 ) ) ( not ( = ?auto_27260 ?auto_27273 ) ) ( not ( = ?auto_27260 ?auto_27272 ) ) ( not ( = ?auto_27260 ?auto_27275 ) ) ( not ( = ?auto_27260 ?auto_27269 ) ) ( not ( = ?auto_27281 ?auto_27284 ) ) ( not ( = ?auto_27281 ?auto_27274 ) ) ( not ( = ?auto_27281 ?auto_27278 ) ) ( not ( = ?auto_27281 ?auto_27270 ) ) ( not ( = ?auto_27281 ?auto_27268 ) ) ( not ( = ?auto_27279 ?auto_27276 ) ) ( not ( = ?auto_27279 ?auto_27283 ) ) ( not ( = ?auto_27279 ?auto_27282 ) ) ( not ( = ?auto_27279 ?auto_27271 ) ) ( not ( = ?auto_27279 ?auto_27266 ) ) ( not ( = ?auto_27280 ?auto_27277 ) ) ( not ( = ?auto_27280 ?auto_27273 ) ) ( not ( = ?auto_27280 ?auto_27272 ) ) ( not ( = ?auto_27280 ?auto_27275 ) ) ( not ( = ?auto_27280 ?auto_27269 ) ) ( not ( = ?auto_27255 ?auto_27262 ) ) ( not ( = ?auto_27255 ?auto_27265 ) ) ( not ( = ?auto_27256 ?auto_27262 ) ) ( not ( = ?auto_27256 ?auto_27265 ) ) ( not ( = ?auto_27257 ?auto_27262 ) ) ( not ( = ?auto_27257 ?auto_27265 ) ) ( not ( = ?auto_27258 ?auto_27262 ) ) ( not ( = ?auto_27258 ?auto_27265 ) ) ( not ( = ?auto_27259 ?auto_27262 ) ) ( not ( = ?auto_27259 ?auto_27265 ) ) ( not ( = ?auto_27261 ?auto_27262 ) ) ( not ( = ?auto_27261 ?auto_27265 ) ) ( not ( = ?auto_27262 ?auto_27280 ) ) ( not ( = ?auto_27262 ?auto_27277 ) ) ( not ( = ?auto_27262 ?auto_27273 ) ) ( not ( = ?auto_27262 ?auto_27272 ) ) ( not ( = ?auto_27262 ?auto_27275 ) ) ( not ( = ?auto_27262 ?auto_27269 ) ) ( not ( = ?auto_27265 ?auto_27280 ) ) ( not ( = ?auto_27265 ?auto_27277 ) ) ( not ( = ?auto_27265 ?auto_27273 ) ) ( not ( = ?auto_27265 ?auto_27272 ) ) ( not ( = ?auto_27265 ?auto_27275 ) ) ( not ( = ?auto_27265 ?auto_27269 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_27255 ?auto_27256 ?auto_27257 ?auto_27258 ?auto_27259 ?auto_27261 ?auto_27260 )
      ( MAKE-1CRATE ?auto_27260 ?auto_27262 )
      ( MAKE-7CRATE-VERIFY ?auto_27255 ?auto_27256 ?auto_27257 ?auto_27258 ?auto_27259 ?auto_27261 ?auto_27260 ?auto_27262 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27287 - SURFACE
      ?auto_27288 - SURFACE
    )
    :vars
    (
      ?auto_27289 - HOIST
      ?auto_27290 - PLACE
      ?auto_27292 - PLACE
      ?auto_27293 - HOIST
      ?auto_27294 - SURFACE
      ?auto_27291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27289 ?auto_27290 ) ( SURFACE-AT ?auto_27287 ?auto_27290 ) ( CLEAR ?auto_27287 ) ( IS-CRATE ?auto_27288 ) ( AVAILABLE ?auto_27289 ) ( not ( = ?auto_27292 ?auto_27290 ) ) ( HOIST-AT ?auto_27293 ?auto_27292 ) ( AVAILABLE ?auto_27293 ) ( SURFACE-AT ?auto_27288 ?auto_27292 ) ( ON ?auto_27288 ?auto_27294 ) ( CLEAR ?auto_27288 ) ( TRUCK-AT ?auto_27291 ?auto_27290 ) ( not ( = ?auto_27287 ?auto_27288 ) ) ( not ( = ?auto_27287 ?auto_27294 ) ) ( not ( = ?auto_27288 ?auto_27294 ) ) ( not ( = ?auto_27289 ?auto_27293 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27291 ?auto_27290 ?auto_27292 )
      ( !LIFT ?auto_27293 ?auto_27288 ?auto_27294 ?auto_27292 )
      ( !LOAD ?auto_27293 ?auto_27288 ?auto_27291 ?auto_27292 )
      ( !DRIVE ?auto_27291 ?auto_27292 ?auto_27290 )
      ( !UNLOAD ?auto_27289 ?auto_27288 ?auto_27291 ?auto_27290 )
      ( !DROP ?auto_27289 ?auto_27288 ?auto_27287 ?auto_27290 )
      ( MAKE-1CRATE-VERIFY ?auto_27287 ?auto_27288 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_27304 - SURFACE
      ?auto_27305 - SURFACE
      ?auto_27306 - SURFACE
      ?auto_27307 - SURFACE
      ?auto_27308 - SURFACE
      ?auto_27310 - SURFACE
      ?auto_27309 - SURFACE
      ?auto_27312 - SURFACE
      ?auto_27311 - SURFACE
    )
    :vars
    (
      ?auto_27315 - HOIST
      ?auto_27318 - PLACE
      ?auto_27313 - PLACE
      ?auto_27317 - HOIST
      ?auto_27314 - SURFACE
      ?auto_27327 - PLACE
      ?auto_27320 - HOIST
      ?auto_27319 - SURFACE
      ?auto_27324 - PLACE
      ?auto_27321 - HOIST
      ?auto_27323 - SURFACE
      ?auto_27336 - PLACE
      ?auto_27326 - HOIST
      ?auto_27337 - SURFACE
      ?auto_27329 - PLACE
      ?auto_27332 - HOIST
      ?auto_27330 - SURFACE
      ?auto_27322 - PLACE
      ?auto_27325 - HOIST
      ?auto_27335 - SURFACE
      ?auto_27334 - PLACE
      ?auto_27331 - HOIST
      ?auto_27328 - SURFACE
      ?auto_27333 - SURFACE
      ?auto_27316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27315 ?auto_27318 ) ( IS-CRATE ?auto_27311 ) ( not ( = ?auto_27313 ?auto_27318 ) ) ( HOIST-AT ?auto_27317 ?auto_27313 ) ( AVAILABLE ?auto_27317 ) ( SURFACE-AT ?auto_27311 ?auto_27313 ) ( ON ?auto_27311 ?auto_27314 ) ( CLEAR ?auto_27311 ) ( not ( = ?auto_27312 ?auto_27311 ) ) ( not ( = ?auto_27312 ?auto_27314 ) ) ( not ( = ?auto_27311 ?auto_27314 ) ) ( not ( = ?auto_27315 ?auto_27317 ) ) ( IS-CRATE ?auto_27312 ) ( not ( = ?auto_27327 ?auto_27318 ) ) ( HOIST-AT ?auto_27320 ?auto_27327 ) ( SURFACE-AT ?auto_27312 ?auto_27327 ) ( ON ?auto_27312 ?auto_27319 ) ( CLEAR ?auto_27312 ) ( not ( = ?auto_27309 ?auto_27312 ) ) ( not ( = ?auto_27309 ?auto_27319 ) ) ( not ( = ?auto_27312 ?auto_27319 ) ) ( not ( = ?auto_27315 ?auto_27320 ) ) ( IS-CRATE ?auto_27309 ) ( not ( = ?auto_27324 ?auto_27318 ) ) ( HOIST-AT ?auto_27321 ?auto_27324 ) ( AVAILABLE ?auto_27321 ) ( SURFACE-AT ?auto_27309 ?auto_27324 ) ( ON ?auto_27309 ?auto_27323 ) ( CLEAR ?auto_27309 ) ( not ( = ?auto_27310 ?auto_27309 ) ) ( not ( = ?auto_27310 ?auto_27323 ) ) ( not ( = ?auto_27309 ?auto_27323 ) ) ( not ( = ?auto_27315 ?auto_27321 ) ) ( IS-CRATE ?auto_27310 ) ( not ( = ?auto_27336 ?auto_27318 ) ) ( HOIST-AT ?auto_27326 ?auto_27336 ) ( AVAILABLE ?auto_27326 ) ( SURFACE-AT ?auto_27310 ?auto_27336 ) ( ON ?auto_27310 ?auto_27337 ) ( CLEAR ?auto_27310 ) ( not ( = ?auto_27308 ?auto_27310 ) ) ( not ( = ?auto_27308 ?auto_27337 ) ) ( not ( = ?auto_27310 ?auto_27337 ) ) ( not ( = ?auto_27315 ?auto_27326 ) ) ( IS-CRATE ?auto_27308 ) ( not ( = ?auto_27329 ?auto_27318 ) ) ( HOIST-AT ?auto_27332 ?auto_27329 ) ( AVAILABLE ?auto_27332 ) ( SURFACE-AT ?auto_27308 ?auto_27329 ) ( ON ?auto_27308 ?auto_27330 ) ( CLEAR ?auto_27308 ) ( not ( = ?auto_27307 ?auto_27308 ) ) ( not ( = ?auto_27307 ?auto_27330 ) ) ( not ( = ?auto_27308 ?auto_27330 ) ) ( not ( = ?auto_27315 ?auto_27332 ) ) ( IS-CRATE ?auto_27307 ) ( not ( = ?auto_27322 ?auto_27318 ) ) ( HOIST-AT ?auto_27325 ?auto_27322 ) ( AVAILABLE ?auto_27325 ) ( SURFACE-AT ?auto_27307 ?auto_27322 ) ( ON ?auto_27307 ?auto_27335 ) ( CLEAR ?auto_27307 ) ( not ( = ?auto_27306 ?auto_27307 ) ) ( not ( = ?auto_27306 ?auto_27335 ) ) ( not ( = ?auto_27307 ?auto_27335 ) ) ( not ( = ?auto_27315 ?auto_27325 ) ) ( IS-CRATE ?auto_27306 ) ( not ( = ?auto_27334 ?auto_27318 ) ) ( HOIST-AT ?auto_27331 ?auto_27334 ) ( AVAILABLE ?auto_27331 ) ( SURFACE-AT ?auto_27306 ?auto_27334 ) ( ON ?auto_27306 ?auto_27328 ) ( CLEAR ?auto_27306 ) ( not ( = ?auto_27305 ?auto_27306 ) ) ( not ( = ?auto_27305 ?auto_27328 ) ) ( not ( = ?auto_27306 ?auto_27328 ) ) ( not ( = ?auto_27315 ?auto_27331 ) ) ( SURFACE-AT ?auto_27304 ?auto_27318 ) ( CLEAR ?auto_27304 ) ( IS-CRATE ?auto_27305 ) ( AVAILABLE ?auto_27315 ) ( AVAILABLE ?auto_27320 ) ( SURFACE-AT ?auto_27305 ?auto_27327 ) ( ON ?auto_27305 ?auto_27333 ) ( CLEAR ?auto_27305 ) ( TRUCK-AT ?auto_27316 ?auto_27318 ) ( not ( = ?auto_27304 ?auto_27305 ) ) ( not ( = ?auto_27304 ?auto_27333 ) ) ( not ( = ?auto_27305 ?auto_27333 ) ) ( not ( = ?auto_27304 ?auto_27306 ) ) ( not ( = ?auto_27304 ?auto_27328 ) ) ( not ( = ?auto_27306 ?auto_27333 ) ) ( not ( = ?auto_27334 ?auto_27327 ) ) ( not ( = ?auto_27331 ?auto_27320 ) ) ( not ( = ?auto_27328 ?auto_27333 ) ) ( not ( = ?auto_27304 ?auto_27307 ) ) ( not ( = ?auto_27304 ?auto_27335 ) ) ( not ( = ?auto_27305 ?auto_27307 ) ) ( not ( = ?auto_27305 ?auto_27335 ) ) ( not ( = ?auto_27307 ?auto_27328 ) ) ( not ( = ?auto_27307 ?auto_27333 ) ) ( not ( = ?auto_27322 ?auto_27334 ) ) ( not ( = ?auto_27322 ?auto_27327 ) ) ( not ( = ?auto_27325 ?auto_27331 ) ) ( not ( = ?auto_27325 ?auto_27320 ) ) ( not ( = ?auto_27335 ?auto_27328 ) ) ( not ( = ?auto_27335 ?auto_27333 ) ) ( not ( = ?auto_27304 ?auto_27308 ) ) ( not ( = ?auto_27304 ?auto_27330 ) ) ( not ( = ?auto_27305 ?auto_27308 ) ) ( not ( = ?auto_27305 ?auto_27330 ) ) ( not ( = ?auto_27306 ?auto_27308 ) ) ( not ( = ?auto_27306 ?auto_27330 ) ) ( not ( = ?auto_27308 ?auto_27335 ) ) ( not ( = ?auto_27308 ?auto_27328 ) ) ( not ( = ?auto_27308 ?auto_27333 ) ) ( not ( = ?auto_27329 ?auto_27322 ) ) ( not ( = ?auto_27329 ?auto_27334 ) ) ( not ( = ?auto_27329 ?auto_27327 ) ) ( not ( = ?auto_27332 ?auto_27325 ) ) ( not ( = ?auto_27332 ?auto_27331 ) ) ( not ( = ?auto_27332 ?auto_27320 ) ) ( not ( = ?auto_27330 ?auto_27335 ) ) ( not ( = ?auto_27330 ?auto_27328 ) ) ( not ( = ?auto_27330 ?auto_27333 ) ) ( not ( = ?auto_27304 ?auto_27310 ) ) ( not ( = ?auto_27304 ?auto_27337 ) ) ( not ( = ?auto_27305 ?auto_27310 ) ) ( not ( = ?auto_27305 ?auto_27337 ) ) ( not ( = ?auto_27306 ?auto_27310 ) ) ( not ( = ?auto_27306 ?auto_27337 ) ) ( not ( = ?auto_27307 ?auto_27310 ) ) ( not ( = ?auto_27307 ?auto_27337 ) ) ( not ( = ?auto_27310 ?auto_27330 ) ) ( not ( = ?auto_27310 ?auto_27335 ) ) ( not ( = ?auto_27310 ?auto_27328 ) ) ( not ( = ?auto_27310 ?auto_27333 ) ) ( not ( = ?auto_27336 ?auto_27329 ) ) ( not ( = ?auto_27336 ?auto_27322 ) ) ( not ( = ?auto_27336 ?auto_27334 ) ) ( not ( = ?auto_27336 ?auto_27327 ) ) ( not ( = ?auto_27326 ?auto_27332 ) ) ( not ( = ?auto_27326 ?auto_27325 ) ) ( not ( = ?auto_27326 ?auto_27331 ) ) ( not ( = ?auto_27326 ?auto_27320 ) ) ( not ( = ?auto_27337 ?auto_27330 ) ) ( not ( = ?auto_27337 ?auto_27335 ) ) ( not ( = ?auto_27337 ?auto_27328 ) ) ( not ( = ?auto_27337 ?auto_27333 ) ) ( not ( = ?auto_27304 ?auto_27309 ) ) ( not ( = ?auto_27304 ?auto_27323 ) ) ( not ( = ?auto_27305 ?auto_27309 ) ) ( not ( = ?auto_27305 ?auto_27323 ) ) ( not ( = ?auto_27306 ?auto_27309 ) ) ( not ( = ?auto_27306 ?auto_27323 ) ) ( not ( = ?auto_27307 ?auto_27309 ) ) ( not ( = ?auto_27307 ?auto_27323 ) ) ( not ( = ?auto_27308 ?auto_27309 ) ) ( not ( = ?auto_27308 ?auto_27323 ) ) ( not ( = ?auto_27309 ?auto_27337 ) ) ( not ( = ?auto_27309 ?auto_27330 ) ) ( not ( = ?auto_27309 ?auto_27335 ) ) ( not ( = ?auto_27309 ?auto_27328 ) ) ( not ( = ?auto_27309 ?auto_27333 ) ) ( not ( = ?auto_27324 ?auto_27336 ) ) ( not ( = ?auto_27324 ?auto_27329 ) ) ( not ( = ?auto_27324 ?auto_27322 ) ) ( not ( = ?auto_27324 ?auto_27334 ) ) ( not ( = ?auto_27324 ?auto_27327 ) ) ( not ( = ?auto_27321 ?auto_27326 ) ) ( not ( = ?auto_27321 ?auto_27332 ) ) ( not ( = ?auto_27321 ?auto_27325 ) ) ( not ( = ?auto_27321 ?auto_27331 ) ) ( not ( = ?auto_27321 ?auto_27320 ) ) ( not ( = ?auto_27323 ?auto_27337 ) ) ( not ( = ?auto_27323 ?auto_27330 ) ) ( not ( = ?auto_27323 ?auto_27335 ) ) ( not ( = ?auto_27323 ?auto_27328 ) ) ( not ( = ?auto_27323 ?auto_27333 ) ) ( not ( = ?auto_27304 ?auto_27312 ) ) ( not ( = ?auto_27304 ?auto_27319 ) ) ( not ( = ?auto_27305 ?auto_27312 ) ) ( not ( = ?auto_27305 ?auto_27319 ) ) ( not ( = ?auto_27306 ?auto_27312 ) ) ( not ( = ?auto_27306 ?auto_27319 ) ) ( not ( = ?auto_27307 ?auto_27312 ) ) ( not ( = ?auto_27307 ?auto_27319 ) ) ( not ( = ?auto_27308 ?auto_27312 ) ) ( not ( = ?auto_27308 ?auto_27319 ) ) ( not ( = ?auto_27310 ?auto_27312 ) ) ( not ( = ?auto_27310 ?auto_27319 ) ) ( not ( = ?auto_27312 ?auto_27323 ) ) ( not ( = ?auto_27312 ?auto_27337 ) ) ( not ( = ?auto_27312 ?auto_27330 ) ) ( not ( = ?auto_27312 ?auto_27335 ) ) ( not ( = ?auto_27312 ?auto_27328 ) ) ( not ( = ?auto_27312 ?auto_27333 ) ) ( not ( = ?auto_27319 ?auto_27323 ) ) ( not ( = ?auto_27319 ?auto_27337 ) ) ( not ( = ?auto_27319 ?auto_27330 ) ) ( not ( = ?auto_27319 ?auto_27335 ) ) ( not ( = ?auto_27319 ?auto_27328 ) ) ( not ( = ?auto_27319 ?auto_27333 ) ) ( not ( = ?auto_27304 ?auto_27311 ) ) ( not ( = ?auto_27304 ?auto_27314 ) ) ( not ( = ?auto_27305 ?auto_27311 ) ) ( not ( = ?auto_27305 ?auto_27314 ) ) ( not ( = ?auto_27306 ?auto_27311 ) ) ( not ( = ?auto_27306 ?auto_27314 ) ) ( not ( = ?auto_27307 ?auto_27311 ) ) ( not ( = ?auto_27307 ?auto_27314 ) ) ( not ( = ?auto_27308 ?auto_27311 ) ) ( not ( = ?auto_27308 ?auto_27314 ) ) ( not ( = ?auto_27310 ?auto_27311 ) ) ( not ( = ?auto_27310 ?auto_27314 ) ) ( not ( = ?auto_27309 ?auto_27311 ) ) ( not ( = ?auto_27309 ?auto_27314 ) ) ( not ( = ?auto_27311 ?auto_27319 ) ) ( not ( = ?auto_27311 ?auto_27323 ) ) ( not ( = ?auto_27311 ?auto_27337 ) ) ( not ( = ?auto_27311 ?auto_27330 ) ) ( not ( = ?auto_27311 ?auto_27335 ) ) ( not ( = ?auto_27311 ?auto_27328 ) ) ( not ( = ?auto_27311 ?auto_27333 ) ) ( not ( = ?auto_27313 ?auto_27327 ) ) ( not ( = ?auto_27313 ?auto_27324 ) ) ( not ( = ?auto_27313 ?auto_27336 ) ) ( not ( = ?auto_27313 ?auto_27329 ) ) ( not ( = ?auto_27313 ?auto_27322 ) ) ( not ( = ?auto_27313 ?auto_27334 ) ) ( not ( = ?auto_27317 ?auto_27320 ) ) ( not ( = ?auto_27317 ?auto_27321 ) ) ( not ( = ?auto_27317 ?auto_27326 ) ) ( not ( = ?auto_27317 ?auto_27332 ) ) ( not ( = ?auto_27317 ?auto_27325 ) ) ( not ( = ?auto_27317 ?auto_27331 ) ) ( not ( = ?auto_27314 ?auto_27319 ) ) ( not ( = ?auto_27314 ?auto_27323 ) ) ( not ( = ?auto_27314 ?auto_27337 ) ) ( not ( = ?auto_27314 ?auto_27330 ) ) ( not ( = ?auto_27314 ?auto_27335 ) ) ( not ( = ?auto_27314 ?auto_27328 ) ) ( not ( = ?auto_27314 ?auto_27333 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_27304 ?auto_27305 ?auto_27306 ?auto_27307 ?auto_27308 ?auto_27310 ?auto_27309 ?auto_27312 )
      ( MAKE-1CRATE ?auto_27312 ?auto_27311 )
      ( MAKE-8CRATE-VERIFY ?auto_27304 ?auto_27305 ?auto_27306 ?auto_27307 ?auto_27308 ?auto_27310 ?auto_27309 ?auto_27312 ?auto_27311 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27340 - SURFACE
      ?auto_27341 - SURFACE
    )
    :vars
    (
      ?auto_27342 - HOIST
      ?auto_27343 - PLACE
      ?auto_27345 - PLACE
      ?auto_27346 - HOIST
      ?auto_27347 - SURFACE
      ?auto_27344 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27342 ?auto_27343 ) ( SURFACE-AT ?auto_27340 ?auto_27343 ) ( CLEAR ?auto_27340 ) ( IS-CRATE ?auto_27341 ) ( AVAILABLE ?auto_27342 ) ( not ( = ?auto_27345 ?auto_27343 ) ) ( HOIST-AT ?auto_27346 ?auto_27345 ) ( AVAILABLE ?auto_27346 ) ( SURFACE-AT ?auto_27341 ?auto_27345 ) ( ON ?auto_27341 ?auto_27347 ) ( CLEAR ?auto_27341 ) ( TRUCK-AT ?auto_27344 ?auto_27343 ) ( not ( = ?auto_27340 ?auto_27341 ) ) ( not ( = ?auto_27340 ?auto_27347 ) ) ( not ( = ?auto_27341 ?auto_27347 ) ) ( not ( = ?auto_27342 ?auto_27346 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27344 ?auto_27343 ?auto_27345 )
      ( !LIFT ?auto_27346 ?auto_27341 ?auto_27347 ?auto_27345 )
      ( !LOAD ?auto_27346 ?auto_27341 ?auto_27344 ?auto_27345 )
      ( !DRIVE ?auto_27344 ?auto_27345 ?auto_27343 )
      ( !UNLOAD ?auto_27342 ?auto_27341 ?auto_27344 ?auto_27343 )
      ( !DROP ?auto_27342 ?auto_27341 ?auto_27340 ?auto_27343 )
      ( MAKE-1CRATE-VERIFY ?auto_27340 ?auto_27341 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_27358 - SURFACE
      ?auto_27359 - SURFACE
      ?auto_27360 - SURFACE
      ?auto_27361 - SURFACE
      ?auto_27362 - SURFACE
      ?auto_27365 - SURFACE
      ?auto_27363 - SURFACE
      ?auto_27367 - SURFACE
      ?auto_27366 - SURFACE
      ?auto_27364 - SURFACE
    )
    :vars
    (
      ?auto_27372 - HOIST
      ?auto_27371 - PLACE
      ?auto_27369 - PLACE
      ?auto_27370 - HOIST
      ?auto_27373 - SURFACE
      ?auto_27388 - PLACE
      ?auto_27383 - HOIST
      ?auto_27385 - SURFACE
      ?auto_27374 - PLACE
      ?auto_27389 - HOIST
      ?auto_27390 - SURFACE
      ?auto_27380 - PLACE
      ?auto_27387 - HOIST
      ?auto_27381 - SURFACE
      ?auto_27384 - PLACE
      ?auto_27378 - HOIST
      ?auto_27392 - SURFACE
      ?auto_27376 - SURFACE
      ?auto_27382 - PLACE
      ?auto_27379 - HOIST
      ?auto_27391 - SURFACE
      ?auto_27393 - PLACE
      ?auto_27377 - HOIST
      ?auto_27375 - SURFACE
      ?auto_27386 - SURFACE
      ?auto_27368 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27372 ?auto_27371 ) ( IS-CRATE ?auto_27364 ) ( not ( = ?auto_27369 ?auto_27371 ) ) ( HOIST-AT ?auto_27370 ?auto_27369 ) ( SURFACE-AT ?auto_27364 ?auto_27369 ) ( ON ?auto_27364 ?auto_27373 ) ( CLEAR ?auto_27364 ) ( not ( = ?auto_27366 ?auto_27364 ) ) ( not ( = ?auto_27366 ?auto_27373 ) ) ( not ( = ?auto_27364 ?auto_27373 ) ) ( not ( = ?auto_27372 ?auto_27370 ) ) ( IS-CRATE ?auto_27366 ) ( not ( = ?auto_27388 ?auto_27371 ) ) ( HOIST-AT ?auto_27383 ?auto_27388 ) ( AVAILABLE ?auto_27383 ) ( SURFACE-AT ?auto_27366 ?auto_27388 ) ( ON ?auto_27366 ?auto_27385 ) ( CLEAR ?auto_27366 ) ( not ( = ?auto_27367 ?auto_27366 ) ) ( not ( = ?auto_27367 ?auto_27385 ) ) ( not ( = ?auto_27366 ?auto_27385 ) ) ( not ( = ?auto_27372 ?auto_27383 ) ) ( IS-CRATE ?auto_27367 ) ( not ( = ?auto_27374 ?auto_27371 ) ) ( HOIST-AT ?auto_27389 ?auto_27374 ) ( SURFACE-AT ?auto_27367 ?auto_27374 ) ( ON ?auto_27367 ?auto_27390 ) ( CLEAR ?auto_27367 ) ( not ( = ?auto_27363 ?auto_27367 ) ) ( not ( = ?auto_27363 ?auto_27390 ) ) ( not ( = ?auto_27367 ?auto_27390 ) ) ( not ( = ?auto_27372 ?auto_27389 ) ) ( IS-CRATE ?auto_27363 ) ( not ( = ?auto_27380 ?auto_27371 ) ) ( HOIST-AT ?auto_27387 ?auto_27380 ) ( AVAILABLE ?auto_27387 ) ( SURFACE-AT ?auto_27363 ?auto_27380 ) ( ON ?auto_27363 ?auto_27381 ) ( CLEAR ?auto_27363 ) ( not ( = ?auto_27365 ?auto_27363 ) ) ( not ( = ?auto_27365 ?auto_27381 ) ) ( not ( = ?auto_27363 ?auto_27381 ) ) ( not ( = ?auto_27372 ?auto_27387 ) ) ( IS-CRATE ?auto_27365 ) ( not ( = ?auto_27384 ?auto_27371 ) ) ( HOIST-AT ?auto_27378 ?auto_27384 ) ( AVAILABLE ?auto_27378 ) ( SURFACE-AT ?auto_27365 ?auto_27384 ) ( ON ?auto_27365 ?auto_27392 ) ( CLEAR ?auto_27365 ) ( not ( = ?auto_27362 ?auto_27365 ) ) ( not ( = ?auto_27362 ?auto_27392 ) ) ( not ( = ?auto_27365 ?auto_27392 ) ) ( not ( = ?auto_27372 ?auto_27378 ) ) ( IS-CRATE ?auto_27362 ) ( AVAILABLE ?auto_27370 ) ( SURFACE-AT ?auto_27362 ?auto_27369 ) ( ON ?auto_27362 ?auto_27376 ) ( CLEAR ?auto_27362 ) ( not ( = ?auto_27361 ?auto_27362 ) ) ( not ( = ?auto_27361 ?auto_27376 ) ) ( not ( = ?auto_27362 ?auto_27376 ) ) ( IS-CRATE ?auto_27361 ) ( not ( = ?auto_27382 ?auto_27371 ) ) ( HOIST-AT ?auto_27379 ?auto_27382 ) ( AVAILABLE ?auto_27379 ) ( SURFACE-AT ?auto_27361 ?auto_27382 ) ( ON ?auto_27361 ?auto_27391 ) ( CLEAR ?auto_27361 ) ( not ( = ?auto_27360 ?auto_27361 ) ) ( not ( = ?auto_27360 ?auto_27391 ) ) ( not ( = ?auto_27361 ?auto_27391 ) ) ( not ( = ?auto_27372 ?auto_27379 ) ) ( IS-CRATE ?auto_27360 ) ( not ( = ?auto_27393 ?auto_27371 ) ) ( HOIST-AT ?auto_27377 ?auto_27393 ) ( AVAILABLE ?auto_27377 ) ( SURFACE-AT ?auto_27360 ?auto_27393 ) ( ON ?auto_27360 ?auto_27375 ) ( CLEAR ?auto_27360 ) ( not ( = ?auto_27359 ?auto_27360 ) ) ( not ( = ?auto_27359 ?auto_27375 ) ) ( not ( = ?auto_27360 ?auto_27375 ) ) ( not ( = ?auto_27372 ?auto_27377 ) ) ( SURFACE-AT ?auto_27358 ?auto_27371 ) ( CLEAR ?auto_27358 ) ( IS-CRATE ?auto_27359 ) ( AVAILABLE ?auto_27372 ) ( AVAILABLE ?auto_27389 ) ( SURFACE-AT ?auto_27359 ?auto_27374 ) ( ON ?auto_27359 ?auto_27386 ) ( CLEAR ?auto_27359 ) ( TRUCK-AT ?auto_27368 ?auto_27371 ) ( not ( = ?auto_27358 ?auto_27359 ) ) ( not ( = ?auto_27358 ?auto_27386 ) ) ( not ( = ?auto_27359 ?auto_27386 ) ) ( not ( = ?auto_27358 ?auto_27360 ) ) ( not ( = ?auto_27358 ?auto_27375 ) ) ( not ( = ?auto_27360 ?auto_27386 ) ) ( not ( = ?auto_27393 ?auto_27374 ) ) ( not ( = ?auto_27377 ?auto_27389 ) ) ( not ( = ?auto_27375 ?auto_27386 ) ) ( not ( = ?auto_27358 ?auto_27361 ) ) ( not ( = ?auto_27358 ?auto_27391 ) ) ( not ( = ?auto_27359 ?auto_27361 ) ) ( not ( = ?auto_27359 ?auto_27391 ) ) ( not ( = ?auto_27361 ?auto_27375 ) ) ( not ( = ?auto_27361 ?auto_27386 ) ) ( not ( = ?auto_27382 ?auto_27393 ) ) ( not ( = ?auto_27382 ?auto_27374 ) ) ( not ( = ?auto_27379 ?auto_27377 ) ) ( not ( = ?auto_27379 ?auto_27389 ) ) ( not ( = ?auto_27391 ?auto_27375 ) ) ( not ( = ?auto_27391 ?auto_27386 ) ) ( not ( = ?auto_27358 ?auto_27362 ) ) ( not ( = ?auto_27358 ?auto_27376 ) ) ( not ( = ?auto_27359 ?auto_27362 ) ) ( not ( = ?auto_27359 ?auto_27376 ) ) ( not ( = ?auto_27360 ?auto_27362 ) ) ( not ( = ?auto_27360 ?auto_27376 ) ) ( not ( = ?auto_27362 ?auto_27391 ) ) ( not ( = ?auto_27362 ?auto_27375 ) ) ( not ( = ?auto_27362 ?auto_27386 ) ) ( not ( = ?auto_27369 ?auto_27382 ) ) ( not ( = ?auto_27369 ?auto_27393 ) ) ( not ( = ?auto_27369 ?auto_27374 ) ) ( not ( = ?auto_27370 ?auto_27379 ) ) ( not ( = ?auto_27370 ?auto_27377 ) ) ( not ( = ?auto_27370 ?auto_27389 ) ) ( not ( = ?auto_27376 ?auto_27391 ) ) ( not ( = ?auto_27376 ?auto_27375 ) ) ( not ( = ?auto_27376 ?auto_27386 ) ) ( not ( = ?auto_27358 ?auto_27365 ) ) ( not ( = ?auto_27358 ?auto_27392 ) ) ( not ( = ?auto_27359 ?auto_27365 ) ) ( not ( = ?auto_27359 ?auto_27392 ) ) ( not ( = ?auto_27360 ?auto_27365 ) ) ( not ( = ?auto_27360 ?auto_27392 ) ) ( not ( = ?auto_27361 ?auto_27365 ) ) ( not ( = ?auto_27361 ?auto_27392 ) ) ( not ( = ?auto_27365 ?auto_27376 ) ) ( not ( = ?auto_27365 ?auto_27391 ) ) ( not ( = ?auto_27365 ?auto_27375 ) ) ( not ( = ?auto_27365 ?auto_27386 ) ) ( not ( = ?auto_27384 ?auto_27369 ) ) ( not ( = ?auto_27384 ?auto_27382 ) ) ( not ( = ?auto_27384 ?auto_27393 ) ) ( not ( = ?auto_27384 ?auto_27374 ) ) ( not ( = ?auto_27378 ?auto_27370 ) ) ( not ( = ?auto_27378 ?auto_27379 ) ) ( not ( = ?auto_27378 ?auto_27377 ) ) ( not ( = ?auto_27378 ?auto_27389 ) ) ( not ( = ?auto_27392 ?auto_27376 ) ) ( not ( = ?auto_27392 ?auto_27391 ) ) ( not ( = ?auto_27392 ?auto_27375 ) ) ( not ( = ?auto_27392 ?auto_27386 ) ) ( not ( = ?auto_27358 ?auto_27363 ) ) ( not ( = ?auto_27358 ?auto_27381 ) ) ( not ( = ?auto_27359 ?auto_27363 ) ) ( not ( = ?auto_27359 ?auto_27381 ) ) ( not ( = ?auto_27360 ?auto_27363 ) ) ( not ( = ?auto_27360 ?auto_27381 ) ) ( not ( = ?auto_27361 ?auto_27363 ) ) ( not ( = ?auto_27361 ?auto_27381 ) ) ( not ( = ?auto_27362 ?auto_27363 ) ) ( not ( = ?auto_27362 ?auto_27381 ) ) ( not ( = ?auto_27363 ?auto_27392 ) ) ( not ( = ?auto_27363 ?auto_27376 ) ) ( not ( = ?auto_27363 ?auto_27391 ) ) ( not ( = ?auto_27363 ?auto_27375 ) ) ( not ( = ?auto_27363 ?auto_27386 ) ) ( not ( = ?auto_27380 ?auto_27384 ) ) ( not ( = ?auto_27380 ?auto_27369 ) ) ( not ( = ?auto_27380 ?auto_27382 ) ) ( not ( = ?auto_27380 ?auto_27393 ) ) ( not ( = ?auto_27380 ?auto_27374 ) ) ( not ( = ?auto_27387 ?auto_27378 ) ) ( not ( = ?auto_27387 ?auto_27370 ) ) ( not ( = ?auto_27387 ?auto_27379 ) ) ( not ( = ?auto_27387 ?auto_27377 ) ) ( not ( = ?auto_27387 ?auto_27389 ) ) ( not ( = ?auto_27381 ?auto_27392 ) ) ( not ( = ?auto_27381 ?auto_27376 ) ) ( not ( = ?auto_27381 ?auto_27391 ) ) ( not ( = ?auto_27381 ?auto_27375 ) ) ( not ( = ?auto_27381 ?auto_27386 ) ) ( not ( = ?auto_27358 ?auto_27367 ) ) ( not ( = ?auto_27358 ?auto_27390 ) ) ( not ( = ?auto_27359 ?auto_27367 ) ) ( not ( = ?auto_27359 ?auto_27390 ) ) ( not ( = ?auto_27360 ?auto_27367 ) ) ( not ( = ?auto_27360 ?auto_27390 ) ) ( not ( = ?auto_27361 ?auto_27367 ) ) ( not ( = ?auto_27361 ?auto_27390 ) ) ( not ( = ?auto_27362 ?auto_27367 ) ) ( not ( = ?auto_27362 ?auto_27390 ) ) ( not ( = ?auto_27365 ?auto_27367 ) ) ( not ( = ?auto_27365 ?auto_27390 ) ) ( not ( = ?auto_27367 ?auto_27381 ) ) ( not ( = ?auto_27367 ?auto_27392 ) ) ( not ( = ?auto_27367 ?auto_27376 ) ) ( not ( = ?auto_27367 ?auto_27391 ) ) ( not ( = ?auto_27367 ?auto_27375 ) ) ( not ( = ?auto_27367 ?auto_27386 ) ) ( not ( = ?auto_27390 ?auto_27381 ) ) ( not ( = ?auto_27390 ?auto_27392 ) ) ( not ( = ?auto_27390 ?auto_27376 ) ) ( not ( = ?auto_27390 ?auto_27391 ) ) ( not ( = ?auto_27390 ?auto_27375 ) ) ( not ( = ?auto_27390 ?auto_27386 ) ) ( not ( = ?auto_27358 ?auto_27366 ) ) ( not ( = ?auto_27358 ?auto_27385 ) ) ( not ( = ?auto_27359 ?auto_27366 ) ) ( not ( = ?auto_27359 ?auto_27385 ) ) ( not ( = ?auto_27360 ?auto_27366 ) ) ( not ( = ?auto_27360 ?auto_27385 ) ) ( not ( = ?auto_27361 ?auto_27366 ) ) ( not ( = ?auto_27361 ?auto_27385 ) ) ( not ( = ?auto_27362 ?auto_27366 ) ) ( not ( = ?auto_27362 ?auto_27385 ) ) ( not ( = ?auto_27365 ?auto_27366 ) ) ( not ( = ?auto_27365 ?auto_27385 ) ) ( not ( = ?auto_27363 ?auto_27366 ) ) ( not ( = ?auto_27363 ?auto_27385 ) ) ( not ( = ?auto_27366 ?auto_27390 ) ) ( not ( = ?auto_27366 ?auto_27381 ) ) ( not ( = ?auto_27366 ?auto_27392 ) ) ( not ( = ?auto_27366 ?auto_27376 ) ) ( not ( = ?auto_27366 ?auto_27391 ) ) ( not ( = ?auto_27366 ?auto_27375 ) ) ( not ( = ?auto_27366 ?auto_27386 ) ) ( not ( = ?auto_27388 ?auto_27374 ) ) ( not ( = ?auto_27388 ?auto_27380 ) ) ( not ( = ?auto_27388 ?auto_27384 ) ) ( not ( = ?auto_27388 ?auto_27369 ) ) ( not ( = ?auto_27388 ?auto_27382 ) ) ( not ( = ?auto_27388 ?auto_27393 ) ) ( not ( = ?auto_27383 ?auto_27389 ) ) ( not ( = ?auto_27383 ?auto_27387 ) ) ( not ( = ?auto_27383 ?auto_27378 ) ) ( not ( = ?auto_27383 ?auto_27370 ) ) ( not ( = ?auto_27383 ?auto_27379 ) ) ( not ( = ?auto_27383 ?auto_27377 ) ) ( not ( = ?auto_27385 ?auto_27390 ) ) ( not ( = ?auto_27385 ?auto_27381 ) ) ( not ( = ?auto_27385 ?auto_27392 ) ) ( not ( = ?auto_27385 ?auto_27376 ) ) ( not ( = ?auto_27385 ?auto_27391 ) ) ( not ( = ?auto_27385 ?auto_27375 ) ) ( not ( = ?auto_27385 ?auto_27386 ) ) ( not ( = ?auto_27358 ?auto_27364 ) ) ( not ( = ?auto_27358 ?auto_27373 ) ) ( not ( = ?auto_27359 ?auto_27364 ) ) ( not ( = ?auto_27359 ?auto_27373 ) ) ( not ( = ?auto_27360 ?auto_27364 ) ) ( not ( = ?auto_27360 ?auto_27373 ) ) ( not ( = ?auto_27361 ?auto_27364 ) ) ( not ( = ?auto_27361 ?auto_27373 ) ) ( not ( = ?auto_27362 ?auto_27364 ) ) ( not ( = ?auto_27362 ?auto_27373 ) ) ( not ( = ?auto_27365 ?auto_27364 ) ) ( not ( = ?auto_27365 ?auto_27373 ) ) ( not ( = ?auto_27363 ?auto_27364 ) ) ( not ( = ?auto_27363 ?auto_27373 ) ) ( not ( = ?auto_27367 ?auto_27364 ) ) ( not ( = ?auto_27367 ?auto_27373 ) ) ( not ( = ?auto_27364 ?auto_27385 ) ) ( not ( = ?auto_27364 ?auto_27390 ) ) ( not ( = ?auto_27364 ?auto_27381 ) ) ( not ( = ?auto_27364 ?auto_27392 ) ) ( not ( = ?auto_27364 ?auto_27376 ) ) ( not ( = ?auto_27364 ?auto_27391 ) ) ( not ( = ?auto_27364 ?auto_27375 ) ) ( not ( = ?auto_27364 ?auto_27386 ) ) ( not ( = ?auto_27373 ?auto_27385 ) ) ( not ( = ?auto_27373 ?auto_27390 ) ) ( not ( = ?auto_27373 ?auto_27381 ) ) ( not ( = ?auto_27373 ?auto_27392 ) ) ( not ( = ?auto_27373 ?auto_27376 ) ) ( not ( = ?auto_27373 ?auto_27391 ) ) ( not ( = ?auto_27373 ?auto_27375 ) ) ( not ( = ?auto_27373 ?auto_27386 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_27358 ?auto_27359 ?auto_27360 ?auto_27361 ?auto_27362 ?auto_27365 ?auto_27363 ?auto_27367 ?auto_27366 )
      ( MAKE-1CRATE ?auto_27366 ?auto_27364 )
      ( MAKE-9CRATE-VERIFY ?auto_27358 ?auto_27359 ?auto_27360 ?auto_27361 ?auto_27362 ?auto_27365 ?auto_27363 ?auto_27367 ?auto_27366 ?auto_27364 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27396 - SURFACE
      ?auto_27397 - SURFACE
    )
    :vars
    (
      ?auto_27398 - HOIST
      ?auto_27399 - PLACE
      ?auto_27401 - PLACE
      ?auto_27402 - HOIST
      ?auto_27403 - SURFACE
      ?auto_27400 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27398 ?auto_27399 ) ( SURFACE-AT ?auto_27396 ?auto_27399 ) ( CLEAR ?auto_27396 ) ( IS-CRATE ?auto_27397 ) ( AVAILABLE ?auto_27398 ) ( not ( = ?auto_27401 ?auto_27399 ) ) ( HOIST-AT ?auto_27402 ?auto_27401 ) ( AVAILABLE ?auto_27402 ) ( SURFACE-AT ?auto_27397 ?auto_27401 ) ( ON ?auto_27397 ?auto_27403 ) ( CLEAR ?auto_27397 ) ( TRUCK-AT ?auto_27400 ?auto_27399 ) ( not ( = ?auto_27396 ?auto_27397 ) ) ( not ( = ?auto_27396 ?auto_27403 ) ) ( not ( = ?auto_27397 ?auto_27403 ) ) ( not ( = ?auto_27398 ?auto_27402 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27400 ?auto_27399 ?auto_27401 )
      ( !LIFT ?auto_27402 ?auto_27397 ?auto_27403 ?auto_27401 )
      ( !LOAD ?auto_27402 ?auto_27397 ?auto_27400 ?auto_27401 )
      ( !DRIVE ?auto_27400 ?auto_27401 ?auto_27399 )
      ( !UNLOAD ?auto_27398 ?auto_27397 ?auto_27400 ?auto_27399 )
      ( !DROP ?auto_27398 ?auto_27397 ?auto_27396 ?auto_27399 )
      ( MAKE-1CRATE-VERIFY ?auto_27396 ?auto_27397 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_27415 - SURFACE
      ?auto_27416 - SURFACE
      ?auto_27417 - SURFACE
      ?auto_27418 - SURFACE
      ?auto_27419 - SURFACE
      ?auto_27422 - SURFACE
      ?auto_27420 - SURFACE
      ?auto_27424 - SURFACE
      ?auto_27423 - SURFACE
      ?auto_27421 - SURFACE
      ?auto_27425 - SURFACE
    )
    :vars
    (
      ?auto_27430 - HOIST
      ?auto_27427 - PLACE
      ?auto_27431 - PLACE
      ?auto_27426 - HOIST
      ?auto_27429 - SURFACE
      ?auto_27454 - PLACE
      ?auto_27451 - HOIST
      ?auto_27440 - SURFACE
      ?auto_27452 - PLACE
      ?auto_27435 - HOIST
      ?auto_27433 - SURFACE
      ?auto_27448 - PLACE
      ?auto_27446 - HOIST
      ?auto_27442 - SURFACE
      ?auto_27437 - PLACE
      ?auto_27434 - HOIST
      ?auto_27432 - SURFACE
      ?auto_27444 - PLACE
      ?auto_27438 - HOIST
      ?auto_27445 - SURFACE
      ?auto_27443 - SURFACE
      ?auto_27436 - PLACE
      ?auto_27439 - HOIST
      ?auto_27449 - SURFACE
      ?auto_27441 - PLACE
      ?auto_27450 - HOIST
      ?auto_27453 - SURFACE
      ?auto_27447 - SURFACE
      ?auto_27428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27430 ?auto_27427 ) ( IS-CRATE ?auto_27425 ) ( not ( = ?auto_27431 ?auto_27427 ) ) ( HOIST-AT ?auto_27426 ?auto_27431 ) ( AVAILABLE ?auto_27426 ) ( SURFACE-AT ?auto_27425 ?auto_27431 ) ( ON ?auto_27425 ?auto_27429 ) ( CLEAR ?auto_27425 ) ( not ( = ?auto_27421 ?auto_27425 ) ) ( not ( = ?auto_27421 ?auto_27429 ) ) ( not ( = ?auto_27425 ?auto_27429 ) ) ( not ( = ?auto_27430 ?auto_27426 ) ) ( IS-CRATE ?auto_27421 ) ( not ( = ?auto_27454 ?auto_27427 ) ) ( HOIST-AT ?auto_27451 ?auto_27454 ) ( SURFACE-AT ?auto_27421 ?auto_27454 ) ( ON ?auto_27421 ?auto_27440 ) ( CLEAR ?auto_27421 ) ( not ( = ?auto_27423 ?auto_27421 ) ) ( not ( = ?auto_27423 ?auto_27440 ) ) ( not ( = ?auto_27421 ?auto_27440 ) ) ( not ( = ?auto_27430 ?auto_27451 ) ) ( IS-CRATE ?auto_27423 ) ( not ( = ?auto_27452 ?auto_27427 ) ) ( HOIST-AT ?auto_27435 ?auto_27452 ) ( AVAILABLE ?auto_27435 ) ( SURFACE-AT ?auto_27423 ?auto_27452 ) ( ON ?auto_27423 ?auto_27433 ) ( CLEAR ?auto_27423 ) ( not ( = ?auto_27424 ?auto_27423 ) ) ( not ( = ?auto_27424 ?auto_27433 ) ) ( not ( = ?auto_27423 ?auto_27433 ) ) ( not ( = ?auto_27430 ?auto_27435 ) ) ( IS-CRATE ?auto_27424 ) ( not ( = ?auto_27448 ?auto_27427 ) ) ( HOIST-AT ?auto_27446 ?auto_27448 ) ( SURFACE-AT ?auto_27424 ?auto_27448 ) ( ON ?auto_27424 ?auto_27442 ) ( CLEAR ?auto_27424 ) ( not ( = ?auto_27420 ?auto_27424 ) ) ( not ( = ?auto_27420 ?auto_27442 ) ) ( not ( = ?auto_27424 ?auto_27442 ) ) ( not ( = ?auto_27430 ?auto_27446 ) ) ( IS-CRATE ?auto_27420 ) ( not ( = ?auto_27437 ?auto_27427 ) ) ( HOIST-AT ?auto_27434 ?auto_27437 ) ( AVAILABLE ?auto_27434 ) ( SURFACE-AT ?auto_27420 ?auto_27437 ) ( ON ?auto_27420 ?auto_27432 ) ( CLEAR ?auto_27420 ) ( not ( = ?auto_27422 ?auto_27420 ) ) ( not ( = ?auto_27422 ?auto_27432 ) ) ( not ( = ?auto_27420 ?auto_27432 ) ) ( not ( = ?auto_27430 ?auto_27434 ) ) ( IS-CRATE ?auto_27422 ) ( not ( = ?auto_27444 ?auto_27427 ) ) ( HOIST-AT ?auto_27438 ?auto_27444 ) ( AVAILABLE ?auto_27438 ) ( SURFACE-AT ?auto_27422 ?auto_27444 ) ( ON ?auto_27422 ?auto_27445 ) ( CLEAR ?auto_27422 ) ( not ( = ?auto_27419 ?auto_27422 ) ) ( not ( = ?auto_27419 ?auto_27445 ) ) ( not ( = ?auto_27422 ?auto_27445 ) ) ( not ( = ?auto_27430 ?auto_27438 ) ) ( IS-CRATE ?auto_27419 ) ( AVAILABLE ?auto_27451 ) ( SURFACE-AT ?auto_27419 ?auto_27454 ) ( ON ?auto_27419 ?auto_27443 ) ( CLEAR ?auto_27419 ) ( not ( = ?auto_27418 ?auto_27419 ) ) ( not ( = ?auto_27418 ?auto_27443 ) ) ( not ( = ?auto_27419 ?auto_27443 ) ) ( IS-CRATE ?auto_27418 ) ( not ( = ?auto_27436 ?auto_27427 ) ) ( HOIST-AT ?auto_27439 ?auto_27436 ) ( AVAILABLE ?auto_27439 ) ( SURFACE-AT ?auto_27418 ?auto_27436 ) ( ON ?auto_27418 ?auto_27449 ) ( CLEAR ?auto_27418 ) ( not ( = ?auto_27417 ?auto_27418 ) ) ( not ( = ?auto_27417 ?auto_27449 ) ) ( not ( = ?auto_27418 ?auto_27449 ) ) ( not ( = ?auto_27430 ?auto_27439 ) ) ( IS-CRATE ?auto_27417 ) ( not ( = ?auto_27441 ?auto_27427 ) ) ( HOIST-AT ?auto_27450 ?auto_27441 ) ( AVAILABLE ?auto_27450 ) ( SURFACE-AT ?auto_27417 ?auto_27441 ) ( ON ?auto_27417 ?auto_27453 ) ( CLEAR ?auto_27417 ) ( not ( = ?auto_27416 ?auto_27417 ) ) ( not ( = ?auto_27416 ?auto_27453 ) ) ( not ( = ?auto_27417 ?auto_27453 ) ) ( not ( = ?auto_27430 ?auto_27450 ) ) ( SURFACE-AT ?auto_27415 ?auto_27427 ) ( CLEAR ?auto_27415 ) ( IS-CRATE ?auto_27416 ) ( AVAILABLE ?auto_27430 ) ( AVAILABLE ?auto_27446 ) ( SURFACE-AT ?auto_27416 ?auto_27448 ) ( ON ?auto_27416 ?auto_27447 ) ( CLEAR ?auto_27416 ) ( TRUCK-AT ?auto_27428 ?auto_27427 ) ( not ( = ?auto_27415 ?auto_27416 ) ) ( not ( = ?auto_27415 ?auto_27447 ) ) ( not ( = ?auto_27416 ?auto_27447 ) ) ( not ( = ?auto_27415 ?auto_27417 ) ) ( not ( = ?auto_27415 ?auto_27453 ) ) ( not ( = ?auto_27417 ?auto_27447 ) ) ( not ( = ?auto_27441 ?auto_27448 ) ) ( not ( = ?auto_27450 ?auto_27446 ) ) ( not ( = ?auto_27453 ?auto_27447 ) ) ( not ( = ?auto_27415 ?auto_27418 ) ) ( not ( = ?auto_27415 ?auto_27449 ) ) ( not ( = ?auto_27416 ?auto_27418 ) ) ( not ( = ?auto_27416 ?auto_27449 ) ) ( not ( = ?auto_27418 ?auto_27453 ) ) ( not ( = ?auto_27418 ?auto_27447 ) ) ( not ( = ?auto_27436 ?auto_27441 ) ) ( not ( = ?auto_27436 ?auto_27448 ) ) ( not ( = ?auto_27439 ?auto_27450 ) ) ( not ( = ?auto_27439 ?auto_27446 ) ) ( not ( = ?auto_27449 ?auto_27453 ) ) ( not ( = ?auto_27449 ?auto_27447 ) ) ( not ( = ?auto_27415 ?auto_27419 ) ) ( not ( = ?auto_27415 ?auto_27443 ) ) ( not ( = ?auto_27416 ?auto_27419 ) ) ( not ( = ?auto_27416 ?auto_27443 ) ) ( not ( = ?auto_27417 ?auto_27419 ) ) ( not ( = ?auto_27417 ?auto_27443 ) ) ( not ( = ?auto_27419 ?auto_27449 ) ) ( not ( = ?auto_27419 ?auto_27453 ) ) ( not ( = ?auto_27419 ?auto_27447 ) ) ( not ( = ?auto_27454 ?auto_27436 ) ) ( not ( = ?auto_27454 ?auto_27441 ) ) ( not ( = ?auto_27454 ?auto_27448 ) ) ( not ( = ?auto_27451 ?auto_27439 ) ) ( not ( = ?auto_27451 ?auto_27450 ) ) ( not ( = ?auto_27451 ?auto_27446 ) ) ( not ( = ?auto_27443 ?auto_27449 ) ) ( not ( = ?auto_27443 ?auto_27453 ) ) ( not ( = ?auto_27443 ?auto_27447 ) ) ( not ( = ?auto_27415 ?auto_27422 ) ) ( not ( = ?auto_27415 ?auto_27445 ) ) ( not ( = ?auto_27416 ?auto_27422 ) ) ( not ( = ?auto_27416 ?auto_27445 ) ) ( not ( = ?auto_27417 ?auto_27422 ) ) ( not ( = ?auto_27417 ?auto_27445 ) ) ( not ( = ?auto_27418 ?auto_27422 ) ) ( not ( = ?auto_27418 ?auto_27445 ) ) ( not ( = ?auto_27422 ?auto_27443 ) ) ( not ( = ?auto_27422 ?auto_27449 ) ) ( not ( = ?auto_27422 ?auto_27453 ) ) ( not ( = ?auto_27422 ?auto_27447 ) ) ( not ( = ?auto_27444 ?auto_27454 ) ) ( not ( = ?auto_27444 ?auto_27436 ) ) ( not ( = ?auto_27444 ?auto_27441 ) ) ( not ( = ?auto_27444 ?auto_27448 ) ) ( not ( = ?auto_27438 ?auto_27451 ) ) ( not ( = ?auto_27438 ?auto_27439 ) ) ( not ( = ?auto_27438 ?auto_27450 ) ) ( not ( = ?auto_27438 ?auto_27446 ) ) ( not ( = ?auto_27445 ?auto_27443 ) ) ( not ( = ?auto_27445 ?auto_27449 ) ) ( not ( = ?auto_27445 ?auto_27453 ) ) ( not ( = ?auto_27445 ?auto_27447 ) ) ( not ( = ?auto_27415 ?auto_27420 ) ) ( not ( = ?auto_27415 ?auto_27432 ) ) ( not ( = ?auto_27416 ?auto_27420 ) ) ( not ( = ?auto_27416 ?auto_27432 ) ) ( not ( = ?auto_27417 ?auto_27420 ) ) ( not ( = ?auto_27417 ?auto_27432 ) ) ( not ( = ?auto_27418 ?auto_27420 ) ) ( not ( = ?auto_27418 ?auto_27432 ) ) ( not ( = ?auto_27419 ?auto_27420 ) ) ( not ( = ?auto_27419 ?auto_27432 ) ) ( not ( = ?auto_27420 ?auto_27445 ) ) ( not ( = ?auto_27420 ?auto_27443 ) ) ( not ( = ?auto_27420 ?auto_27449 ) ) ( not ( = ?auto_27420 ?auto_27453 ) ) ( not ( = ?auto_27420 ?auto_27447 ) ) ( not ( = ?auto_27437 ?auto_27444 ) ) ( not ( = ?auto_27437 ?auto_27454 ) ) ( not ( = ?auto_27437 ?auto_27436 ) ) ( not ( = ?auto_27437 ?auto_27441 ) ) ( not ( = ?auto_27437 ?auto_27448 ) ) ( not ( = ?auto_27434 ?auto_27438 ) ) ( not ( = ?auto_27434 ?auto_27451 ) ) ( not ( = ?auto_27434 ?auto_27439 ) ) ( not ( = ?auto_27434 ?auto_27450 ) ) ( not ( = ?auto_27434 ?auto_27446 ) ) ( not ( = ?auto_27432 ?auto_27445 ) ) ( not ( = ?auto_27432 ?auto_27443 ) ) ( not ( = ?auto_27432 ?auto_27449 ) ) ( not ( = ?auto_27432 ?auto_27453 ) ) ( not ( = ?auto_27432 ?auto_27447 ) ) ( not ( = ?auto_27415 ?auto_27424 ) ) ( not ( = ?auto_27415 ?auto_27442 ) ) ( not ( = ?auto_27416 ?auto_27424 ) ) ( not ( = ?auto_27416 ?auto_27442 ) ) ( not ( = ?auto_27417 ?auto_27424 ) ) ( not ( = ?auto_27417 ?auto_27442 ) ) ( not ( = ?auto_27418 ?auto_27424 ) ) ( not ( = ?auto_27418 ?auto_27442 ) ) ( not ( = ?auto_27419 ?auto_27424 ) ) ( not ( = ?auto_27419 ?auto_27442 ) ) ( not ( = ?auto_27422 ?auto_27424 ) ) ( not ( = ?auto_27422 ?auto_27442 ) ) ( not ( = ?auto_27424 ?auto_27432 ) ) ( not ( = ?auto_27424 ?auto_27445 ) ) ( not ( = ?auto_27424 ?auto_27443 ) ) ( not ( = ?auto_27424 ?auto_27449 ) ) ( not ( = ?auto_27424 ?auto_27453 ) ) ( not ( = ?auto_27424 ?auto_27447 ) ) ( not ( = ?auto_27442 ?auto_27432 ) ) ( not ( = ?auto_27442 ?auto_27445 ) ) ( not ( = ?auto_27442 ?auto_27443 ) ) ( not ( = ?auto_27442 ?auto_27449 ) ) ( not ( = ?auto_27442 ?auto_27453 ) ) ( not ( = ?auto_27442 ?auto_27447 ) ) ( not ( = ?auto_27415 ?auto_27423 ) ) ( not ( = ?auto_27415 ?auto_27433 ) ) ( not ( = ?auto_27416 ?auto_27423 ) ) ( not ( = ?auto_27416 ?auto_27433 ) ) ( not ( = ?auto_27417 ?auto_27423 ) ) ( not ( = ?auto_27417 ?auto_27433 ) ) ( not ( = ?auto_27418 ?auto_27423 ) ) ( not ( = ?auto_27418 ?auto_27433 ) ) ( not ( = ?auto_27419 ?auto_27423 ) ) ( not ( = ?auto_27419 ?auto_27433 ) ) ( not ( = ?auto_27422 ?auto_27423 ) ) ( not ( = ?auto_27422 ?auto_27433 ) ) ( not ( = ?auto_27420 ?auto_27423 ) ) ( not ( = ?auto_27420 ?auto_27433 ) ) ( not ( = ?auto_27423 ?auto_27442 ) ) ( not ( = ?auto_27423 ?auto_27432 ) ) ( not ( = ?auto_27423 ?auto_27445 ) ) ( not ( = ?auto_27423 ?auto_27443 ) ) ( not ( = ?auto_27423 ?auto_27449 ) ) ( not ( = ?auto_27423 ?auto_27453 ) ) ( not ( = ?auto_27423 ?auto_27447 ) ) ( not ( = ?auto_27452 ?auto_27448 ) ) ( not ( = ?auto_27452 ?auto_27437 ) ) ( not ( = ?auto_27452 ?auto_27444 ) ) ( not ( = ?auto_27452 ?auto_27454 ) ) ( not ( = ?auto_27452 ?auto_27436 ) ) ( not ( = ?auto_27452 ?auto_27441 ) ) ( not ( = ?auto_27435 ?auto_27446 ) ) ( not ( = ?auto_27435 ?auto_27434 ) ) ( not ( = ?auto_27435 ?auto_27438 ) ) ( not ( = ?auto_27435 ?auto_27451 ) ) ( not ( = ?auto_27435 ?auto_27439 ) ) ( not ( = ?auto_27435 ?auto_27450 ) ) ( not ( = ?auto_27433 ?auto_27442 ) ) ( not ( = ?auto_27433 ?auto_27432 ) ) ( not ( = ?auto_27433 ?auto_27445 ) ) ( not ( = ?auto_27433 ?auto_27443 ) ) ( not ( = ?auto_27433 ?auto_27449 ) ) ( not ( = ?auto_27433 ?auto_27453 ) ) ( not ( = ?auto_27433 ?auto_27447 ) ) ( not ( = ?auto_27415 ?auto_27421 ) ) ( not ( = ?auto_27415 ?auto_27440 ) ) ( not ( = ?auto_27416 ?auto_27421 ) ) ( not ( = ?auto_27416 ?auto_27440 ) ) ( not ( = ?auto_27417 ?auto_27421 ) ) ( not ( = ?auto_27417 ?auto_27440 ) ) ( not ( = ?auto_27418 ?auto_27421 ) ) ( not ( = ?auto_27418 ?auto_27440 ) ) ( not ( = ?auto_27419 ?auto_27421 ) ) ( not ( = ?auto_27419 ?auto_27440 ) ) ( not ( = ?auto_27422 ?auto_27421 ) ) ( not ( = ?auto_27422 ?auto_27440 ) ) ( not ( = ?auto_27420 ?auto_27421 ) ) ( not ( = ?auto_27420 ?auto_27440 ) ) ( not ( = ?auto_27424 ?auto_27421 ) ) ( not ( = ?auto_27424 ?auto_27440 ) ) ( not ( = ?auto_27421 ?auto_27433 ) ) ( not ( = ?auto_27421 ?auto_27442 ) ) ( not ( = ?auto_27421 ?auto_27432 ) ) ( not ( = ?auto_27421 ?auto_27445 ) ) ( not ( = ?auto_27421 ?auto_27443 ) ) ( not ( = ?auto_27421 ?auto_27449 ) ) ( not ( = ?auto_27421 ?auto_27453 ) ) ( not ( = ?auto_27421 ?auto_27447 ) ) ( not ( = ?auto_27440 ?auto_27433 ) ) ( not ( = ?auto_27440 ?auto_27442 ) ) ( not ( = ?auto_27440 ?auto_27432 ) ) ( not ( = ?auto_27440 ?auto_27445 ) ) ( not ( = ?auto_27440 ?auto_27443 ) ) ( not ( = ?auto_27440 ?auto_27449 ) ) ( not ( = ?auto_27440 ?auto_27453 ) ) ( not ( = ?auto_27440 ?auto_27447 ) ) ( not ( = ?auto_27415 ?auto_27425 ) ) ( not ( = ?auto_27415 ?auto_27429 ) ) ( not ( = ?auto_27416 ?auto_27425 ) ) ( not ( = ?auto_27416 ?auto_27429 ) ) ( not ( = ?auto_27417 ?auto_27425 ) ) ( not ( = ?auto_27417 ?auto_27429 ) ) ( not ( = ?auto_27418 ?auto_27425 ) ) ( not ( = ?auto_27418 ?auto_27429 ) ) ( not ( = ?auto_27419 ?auto_27425 ) ) ( not ( = ?auto_27419 ?auto_27429 ) ) ( not ( = ?auto_27422 ?auto_27425 ) ) ( not ( = ?auto_27422 ?auto_27429 ) ) ( not ( = ?auto_27420 ?auto_27425 ) ) ( not ( = ?auto_27420 ?auto_27429 ) ) ( not ( = ?auto_27424 ?auto_27425 ) ) ( not ( = ?auto_27424 ?auto_27429 ) ) ( not ( = ?auto_27423 ?auto_27425 ) ) ( not ( = ?auto_27423 ?auto_27429 ) ) ( not ( = ?auto_27425 ?auto_27440 ) ) ( not ( = ?auto_27425 ?auto_27433 ) ) ( not ( = ?auto_27425 ?auto_27442 ) ) ( not ( = ?auto_27425 ?auto_27432 ) ) ( not ( = ?auto_27425 ?auto_27445 ) ) ( not ( = ?auto_27425 ?auto_27443 ) ) ( not ( = ?auto_27425 ?auto_27449 ) ) ( not ( = ?auto_27425 ?auto_27453 ) ) ( not ( = ?auto_27425 ?auto_27447 ) ) ( not ( = ?auto_27431 ?auto_27454 ) ) ( not ( = ?auto_27431 ?auto_27452 ) ) ( not ( = ?auto_27431 ?auto_27448 ) ) ( not ( = ?auto_27431 ?auto_27437 ) ) ( not ( = ?auto_27431 ?auto_27444 ) ) ( not ( = ?auto_27431 ?auto_27436 ) ) ( not ( = ?auto_27431 ?auto_27441 ) ) ( not ( = ?auto_27426 ?auto_27451 ) ) ( not ( = ?auto_27426 ?auto_27435 ) ) ( not ( = ?auto_27426 ?auto_27446 ) ) ( not ( = ?auto_27426 ?auto_27434 ) ) ( not ( = ?auto_27426 ?auto_27438 ) ) ( not ( = ?auto_27426 ?auto_27439 ) ) ( not ( = ?auto_27426 ?auto_27450 ) ) ( not ( = ?auto_27429 ?auto_27440 ) ) ( not ( = ?auto_27429 ?auto_27433 ) ) ( not ( = ?auto_27429 ?auto_27442 ) ) ( not ( = ?auto_27429 ?auto_27432 ) ) ( not ( = ?auto_27429 ?auto_27445 ) ) ( not ( = ?auto_27429 ?auto_27443 ) ) ( not ( = ?auto_27429 ?auto_27449 ) ) ( not ( = ?auto_27429 ?auto_27453 ) ) ( not ( = ?auto_27429 ?auto_27447 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_27415 ?auto_27416 ?auto_27417 ?auto_27418 ?auto_27419 ?auto_27422 ?auto_27420 ?auto_27424 ?auto_27423 ?auto_27421 )
      ( MAKE-1CRATE ?auto_27421 ?auto_27425 )
      ( MAKE-10CRATE-VERIFY ?auto_27415 ?auto_27416 ?auto_27417 ?auto_27418 ?auto_27419 ?auto_27422 ?auto_27420 ?auto_27424 ?auto_27423 ?auto_27421 ?auto_27425 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27457 - SURFACE
      ?auto_27458 - SURFACE
    )
    :vars
    (
      ?auto_27459 - HOIST
      ?auto_27460 - PLACE
      ?auto_27462 - PLACE
      ?auto_27463 - HOIST
      ?auto_27464 - SURFACE
      ?auto_27461 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27459 ?auto_27460 ) ( SURFACE-AT ?auto_27457 ?auto_27460 ) ( CLEAR ?auto_27457 ) ( IS-CRATE ?auto_27458 ) ( AVAILABLE ?auto_27459 ) ( not ( = ?auto_27462 ?auto_27460 ) ) ( HOIST-AT ?auto_27463 ?auto_27462 ) ( AVAILABLE ?auto_27463 ) ( SURFACE-AT ?auto_27458 ?auto_27462 ) ( ON ?auto_27458 ?auto_27464 ) ( CLEAR ?auto_27458 ) ( TRUCK-AT ?auto_27461 ?auto_27460 ) ( not ( = ?auto_27457 ?auto_27458 ) ) ( not ( = ?auto_27457 ?auto_27464 ) ) ( not ( = ?auto_27458 ?auto_27464 ) ) ( not ( = ?auto_27459 ?auto_27463 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27461 ?auto_27460 ?auto_27462 )
      ( !LIFT ?auto_27463 ?auto_27458 ?auto_27464 ?auto_27462 )
      ( !LOAD ?auto_27463 ?auto_27458 ?auto_27461 ?auto_27462 )
      ( !DRIVE ?auto_27461 ?auto_27462 ?auto_27460 )
      ( !UNLOAD ?auto_27459 ?auto_27458 ?auto_27461 ?auto_27460 )
      ( !DROP ?auto_27459 ?auto_27458 ?auto_27457 ?auto_27460 )
      ( MAKE-1CRATE-VERIFY ?auto_27457 ?auto_27458 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_27477 - SURFACE
      ?auto_27478 - SURFACE
      ?auto_27479 - SURFACE
      ?auto_27480 - SURFACE
      ?auto_27481 - SURFACE
      ?auto_27484 - SURFACE
      ?auto_27482 - SURFACE
      ?auto_27486 - SURFACE
      ?auto_27485 - SURFACE
      ?auto_27483 - SURFACE
      ?auto_27488 - SURFACE
      ?auto_27487 - SURFACE
    )
    :vars
    (
      ?auto_27490 - HOIST
      ?auto_27493 - PLACE
      ?auto_27494 - PLACE
      ?auto_27489 - HOIST
      ?auto_27492 - SURFACE
      ?auto_27497 - PLACE
      ?auto_27498 - HOIST
      ?auto_27495 - SURFACE
      ?auto_27517 - PLACE
      ?auto_27519 - HOIST
      ?auto_27506 - SURFACE
      ?auto_27516 - PLACE
      ?auto_27509 - HOIST
      ?auto_27496 - SURFACE
      ?auto_27511 - PLACE
      ?auto_27499 - HOIST
      ?auto_27504 - SURFACE
      ?auto_27507 - PLACE
      ?auto_27512 - HOIST
      ?auto_27508 - SURFACE
      ?auto_27503 - PLACE
      ?auto_27500 - HOIST
      ?auto_27501 - SURFACE
      ?auto_27513 - SURFACE
      ?auto_27515 - PLACE
      ?auto_27518 - HOIST
      ?auto_27514 - SURFACE
      ?auto_27505 - PLACE
      ?auto_27510 - HOIST
      ?auto_27520 - SURFACE
      ?auto_27502 - SURFACE
      ?auto_27491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27490 ?auto_27493 ) ( IS-CRATE ?auto_27487 ) ( not ( = ?auto_27494 ?auto_27493 ) ) ( HOIST-AT ?auto_27489 ?auto_27494 ) ( AVAILABLE ?auto_27489 ) ( SURFACE-AT ?auto_27487 ?auto_27494 ) ( ON ?auto_27487 ?auto_27492 ) ( CLEAR ?auto_27487 ) ( not ( = ?auto_27488 ?auto_27487 ) ) ( not ( = ?auto_27488 ?auto_27492 ) ) ( not ( = ?auto_27487 ?auto_27492 ) ) ( not ( = ?auto_27490 ?auto_27489 ) ) ( IS-CRATE ?auto_27488 ) ( not ( = ?auto_27497 ?auto_27493 ) ) ( HOIST-AT ?auto_27498 ?auto_27497 ) ( AVAILABLE ?auto_27498 ) ( SURFACE-AT ?auto_27488 ?auto_27497 ) ( ON ?auto_27488 ?auto_27495 ) ( CLEAR ?auto_27488 ) ( not ( = ?auto_27483 ?auto_27488 ) ) ( not ( = ?auto_27483 ?auto_27495 ) ) ( not ( = ?auto_27488 ?auto_27495 ) ) ( not ( = ?auto_27490 ?auto_27498 ) ) ( IS-CRATE ?auto_27483 ) ( not ( = ?auto_27517 ?auto_27493 ) ) ( HOIST-AT ?auto_27519 ?auto_27517 ) ( SURFACE-AT ?auto_27483 ?auto_27517 ) ( ON ?auto_27483 ?auto_27506 ) ( CLEAR ?auto_27483 ) ( not ( = ?auto_27485 ?auto_27483 ) ) ( not ( = ?auto_27485 ?auto_27506 ) ) ( not ( = ?auto_27483 ?auto_27506 ) ) ( not ( = ?auto_27490 ?auto_27519 ) ) ( IS-CRATE ?auto_27485 ) ( not ( = ?auto_27516 ?auto_27493 ) ) ( HOIST-AT ?auto_27509 ?auto_27516 ) ( AVAILABLE ?auto_27509 ) ( SURFACE-AT ?auto_27485 ?auto_27516 ) ( ON ?auto_27485 ?auto_27496 ) ( CLEAR ?auto_27485 ) ( not ( = ?auto_27486 ?auto_27485 ) ) ( not ( = ?auto_27486 ?auto_27496 ) ) ( not ( = ?auto_27485 ?auto_27496 ) ) ( not ( = ?auto_27490 ?auto_27509 ) ) ( IS-CRATE ?auto_27486 ) ( not ( = ?auto_27511 ?auto_27493 ) ) ( HOIST-AT ?auto_27499 ?auto_27511 ) ( SURFACE-AT ?auto_27486 ?auto_27511 ) ( ON ?auto_27486 ?auto_27504 ) ( CLEAR ?auto_27486 ) ( not ( = ?auto_27482 ?auto_27486 ) ) ( not ( = ?auto_27482 ?auto_27504 ) ) ( not ( = ?auto_27486 ?auto_27504 ) ) ( not ( = ?auto_27490 ?auto_27499 ) ) ( IS-CRATE ?auto_27482 ) ( not ( = ?auto_27507 ?auto_27493 ) ) ( HOIST-AT ?auto_27512 ?auto_27507 ) ( AVAILABLE ?auto_27512 ) ( SURFACE-AT ?auto_27482 ?auto_27507 ) ( ON ?auto_27482 ?auto_27508 ) ( CLEAR ?auto_27482 ) ( not ( = ?auto_27484 ?auto_27482 ) ) ( not ( = ?auto_27484 ?auto_27508 ) ) ( not ( = ?auto_27482 ?auto_27508 ) ) ( not ( = ?auto_27490 ?auto_27512 ) ) ( IS-CRATE ?auto_27484 ) ( not ( = ?auto_27503 ?auto_27493 ) ) ( HOIST-AT ?auto_27500 ?auto_27503 ) ( AVAILABLE ?auto_27500 ) ( SURFACE-AT ?auto_27484 ?auto_27503 ) ( ON ?auto_27484 ?auto_27501 ) ( CLEAR ?auto_27484 ) ( not ( = ?auto_27481 ?auto_27484 ) ) ( not ( = ?auto_27481 ?auto_27501 ) ) ( not ( = ?auto_27484 ?auto_27501 ) ) ( not ( = ?auto_27490 ?auto_27500 ) ) ( IS-CRATE ?auto_27481 ) ( AVAILABLE ?auto_27519 ) ( SURFACE-AT ?auto_27481 ?auto_27517 ) ( ON ?auto_27481 ?auto_27513 ) ( CLEAR ?auto_27481 ) ( not ( = ?auto_27480 ?auto_27481 ) ) ( not ( = ?auto_27480 ?auto_27513 ) ) ( not ( = ?auto_27481 ?auto_27513 ) ) ( IS-CRATE ?auto_27480 ) ( not ( = ?auto_27515 ?auto_27493 ) ) ( HOIST-AT ?auto_27518 ?auto_27515 ) ( AVAILABLE ?auto_27518 ) ( SURFACE-AT ?auto_27480 ?auto_27515 ) ( ON ?auto_27480 ?auto_27514 ) ( CLEAR ?auto_27480 ) ( not ( = ?auto_27479 ?auto_27480 ) ) ( not ( = ?auto_27479 ?auto_27514 ) ) ( not ( = ?auto_27480 ?auto_27514 ) ) ( not ( = ?auto_27490 ?auto_27518 ) ) ( IS-CRATE ?auto_27479 ) ( not ( = ?auto_27505 ?auto_27493 ) ) ( HOIST-AT ?auto_27510 ?auto_27505 ) ( AVAILABLE ?auto_27510 ) ( SURFACE-AT ?auto_27479 ?auto_27505 ) ( ON ?auto_27479 ?auto_27520 ) ( CLEAR ?auto_27479 ) ( not ( = ?auto_27478 ?auto_27479 ) ) ( not ( = ?auto_27478 ?auto_27520 ) ) ( not ( = ?auto_27479 ?auto_27520 ) ) ( not ( = ?auto_27490 ?auto_27510 ) ) ( SURFACE-AT ?auto_27477 ?auto_27493 ) ( CLEAR ?auto_27477 ) ( IS-CRATE ?auto_27478 ) ( AVAILABLE ?auto_27490 ) ( AVAILABLE ?auto_27499 ) ( SURFACE-AT ?auto_27478 ?auto_27511 ) ( ON ?auto_27478 ?auto_27502 ) ( CLEAR ?auto_27478 ) ( TRUCK-AT ?auto_27491 ?auto_27493 ) ( not ( = ?auto_27477 ?auto_27478 ) ) ( not ( = ?auto_27477 ?auto_27502 ) ) ( not ( = ?auto_27478 ?auto_27502 ) ) ( not ( = ?auto_27477 ?auto_27479 ) ) ( not ( = ?auto_27477 ?auto_27520 ) ) ( not ( = ?auto_27479 ?auto_27502 ) ) ( not ( = ?auto_27505 ?auto_27511 ) ) ( not ( = ?auto_27510 ?auto_27499 ) ) ( not ( = ?auto_27520 ?auto_27502 ) ) ( not ( = ?auto_27477 ?auto_27480 ) ) ( not ( = ?auto_27477 ?auto_27514 ) ) ( not ( = ?auto_27478 ?auto_27480 ) ) ( not ( = ?auto_27478 ?auto_27514 ) ) ( not ( = ?auto_27480 ?auto_27520 ) ) ( not ( = ?auto_27480 ?auto_27502 ) ) ( not ( = ?auto_27515 ?auto_27505 ) ) ( not ( = ?auto_27515 ?auto_27511 ) ) ( not ( = ?auto_27518 ?auto_27510 ) ) ( not ( = ?auto_27518 ?auto_27499 ) ) ( not ( = ?auto_27514 ?auto_27520 ) ) ( not ( = ?auto_27514 ?auto_27502 ) ) ( not ( = ?auto_27477 ?auto_27481 ) ) ( not ( = ?auto_27477 ?auto_27513 ) ) ( not ( = ?auto_27478 ?auto_27481 ) ) ( not ( = ?auto_27478 ?auto_27513 ) ) ( not ( = ?auto_27479 ?auto_27481 ) ) ( not ( = ?auto_27479 ?auto_27513 ) ) ( not ( = ?auto_27481 ?auto_27514 ) ) ( not ( = ?auto_27481 ?auto_27520 ) ) ( not ( = ?auto_27481 ?auto_27502 ) ) ( not ( = ?auto_27517 ?auto_27515 ) ) ( not ( = ?auto_27517 ?auto_27505 ) ) ( not ( = ?auto_27517 ?auto_27511 ) ) ( not ( = ?auto_27519 ?auto_27518 ) ) ( not ( = ?auto_27519 ?auto_27510 ) ) ( not ( = ?auto_27519 ?auto_27499 ) ) ( not ( = ?auto_27513 ?auto_27514 ) ) ( not ( = ?auto_27513 ?auto_27520 ) ) ( not ( = ?auto_27513 ?auto_27502 ) ) ( not ( = ?auto_27477 ?auto_27484 ) ) ( not ( = ?auto_27477 ?auto_27501 ) ) ( not ( = ?auto_27478 ?auto_27484 ) ) ( not ( = ?auto_27478 ?auto_27501 ) ) ( not ( = ?auto_27479 ?auto_27484 ) ) ( not ( = ?auto_27479 ?auto_27501 ) ) ( not ( = ?auto_27480 ?auto_27484 ) ) ( not ( = ?auto_27480 ?auto_27501 ) ) ( not ( = ?auto_27484 ?auto_27513 ) ) ( not ( = ?auto_27484 ?auto_27514 ) ) ( not ( = ?auto_27484 ?auto_27520 ) ) ( not ( = ?auto_27484 ?auto_27502 ) ) ( not ( = ?auto_27503 ?auto_27517 ) ) ( not ( = ?auto_27503 ?auto_27515 ) ) ( not ( = ?auto_27503 ?auto_27505 ) ) ( not ( = ?auto_27503 ?auto_27511 ) ) ( not ( = ?auto_27500 ?auto_27519 ) ) ( not ( = ?auto_27500 ?auto_27518 ) ) ( not ( = ?auto_27500 ?auto_27510 ) ) ( not ( = ?auto_27500 ?auto_27499 ) ) ( not ( = ?auto_27501 ?auto_27513 ) ) ( not ( = ?auto_27501 ?auto_27514 ) ) ( not ( = ?auto_27501 ?auto_27520 ) ) ( not ( = ?auto_27501 ?auto_27502 ) ) ( not ( = ?auto_27477 ?auto_27482 ) ) ( not ( = ?auto_27477 ?auto_27508 ) ) ( not ( = ?auto_27478 ?auto_27482 ) ) ( not ( = ?auto_27478 ?auto_27508 ) ) ( not ( = ?auto_27479 ?auto_27482 ) ) ( not ( = ?auto_27479 ?auto_27508 ) ) ( not ( = ?auto_27480 ?auto_27482 ) ) ( not ( = ?auto_27480 ?auto_27508 ) ) ( not ( = ?auto_27481 ?auto_27482 ) ) ( not ( = ?auto_27481 ?auto_27508 ) ) ( not ( = ?auto_27482 ?auto_27501 ) ) ( not ( = ?auto_27482 ?auto_27513 ) ) ( not ( = ?auto_27482 ?auto_27514 ) ) ( not ( = ?auto_27482 ?auto_27520 ) ) ( not ( = ?auto_27482 ?auto_27502 ) ) ( not ( = ?auto_27507 ?auto_27503 ) ) ( not ( = ?auto_27507 ?auto_27517 ) ) ( not ( = ?auto_27507 ?auto_27515 ) ) ( not ( = ?auto_27507 ?auto_27505 ) ) ( not ( = ?auto_27507 ?auto_27511 ) ) ( not ( = ?auto_27512 ?auto_27500 ) ) ( not ( = ?auto_27512 ?auto_27519 ) ) ( not ( = ?auto_27512 ?auto_27518 ) ) ( not ( = ?auto_27512 ?auto_27510 ) ) ( not ( = ?auto_27512 ?auto_27499 ) ) ( not ( = ?auto_27508 ?auto_27501 ) ) ( not ( = ?auto_27508 ?auto_27513 ) ) ( not ( = ?auto_27508 ?auto_27514 ) ) ( not ( = ?auto_27508 ?auto_27520 ) ) ( not ( = ?auto_27508 ?auto_27502 ) ) ( not ( = ?auto_27477 ?auto_27486 ) ) ( not ( = ?auto_27477 ?auto_27504 ) ) ( not ( = ?auto_27478 ?auto_27486 ) ) ( not ( = ?auto_27478 ?auto_27504 ) ) ( not ( = ?auto_27479 ?auto_27486 ) ) ( not ( = ?auto_27479 ?auto_27504 ) ) ( not ( = ?auto_27480 ?auto_27486 ) ) ( not ( = ?auto_27480 ?auto_27504 ) ) ( not ( = ?auto_27481 ?auto_27486 ) ) ( not ( = ?auto_27481 ?auto_27504 ) ) ( not ( = ?auto_27484 ?auto_27486 ) ) ( not ( = ?auto_27484 ?auto_27504 ) ) ( not ( = ?auto_27486 ?auto_27508 ) ) ( not ( = ?auto_27486 ?auto_27501 ) ) ( not ( = ?auto_27486 ?auto_27513 ) ) ( not ( = ?auto_27486 ?auto_27514 ) ) ( not ( = ?auto_27486 ?auto_27520 ) ) ( not ( = ?auto_27486 ?auto_27502 ) ) ( not ( = ?auto_27504 ?auto_27508 ) ) ( not ( = ?auto_27504 ?auto_27501 ) ) ( not ( = ?auto_27504 ?auto_27513 ) ) ( not ( = ?auto_27504 ?auto_27514 ) ) ( not ( = ?auto_27504 ?auto_27520 ) ) ( not ( = ?auto_27504 ?auto_27502 ) ) ( not ( = ?auto_27477 ?auto_27485 ) ) ( not ( = ?auto_27477 ?auto_27496 ) ) ( not ( = ?auto_27478 ?auto_27485 ) ) ( not ( = ?auto_27478 ?auto_27496 ) ) ( not ( = ?auto_27479 ?auto_27485 ) ) ( not ( = ?auto_27479 ?auto_27496 ) ) ( not ( = ?auto_27480 ?auto_27485 ) ) ( not ( = ?auto_27480 ?auto_27496 ) ) ( not ( = ?auto_27481 ?auto_27485 ) ) ( not ( = ?auto_27481 ?auto_27496 ) ) ( not ( = ?auto_27484 ?auto_27485 ) ) ( not ( = ?auto_27484 ?auto_27496 ) ) ( not ( = ?auto_27482 ?auto_27485 ) ) ( not ( = ?auto_27482 ?auto_27496 ) ) ( not ( = ?auto_27485 ?auto_27504 ) ) ( not ( = ?auto_27485 ?auto_27508 ) ) ( not ( = ?auto_27485 ?auto_27501 ) ) ( not ( = ?auto_27485 ?auto_27513 ) ) ( not ( = ?auto_27485 ?auto_27514 ) ) ( not ( = ?auto_27485 ?auto_27520 ) ) ( not ( = ?auto_27485 ?auto_27502 ) ) ( not ( = ?auto_27516 ?auto_27511 ) ) ( not ( = ?auto_27516 ?auto_27507 ) ) ( not ( = ?auto_27516 ?auto_27503 ) ) ( not ( = ?auto_27516 ?auto_27517 ) ) ( not ( = ?auto_27516 ?auto_27515 ) ) ( not ( = ?auto_27516 ?auto_27505 ) ) ( not ( = ?auto_27509 ?auto_27499 ) ) ( not ( = ?auto_27509 ?auto_27512 ) ) ( not ( = ?auto_27509 ?auto_27500 ) ) ( not ( = ?auto_27509 ?auto_27519 ) ) ( not ( = ?auto_27509 ?auto_27518 ) ) ( not ( = ?auto_27509 ?auto_27510 ) ) ( not ( = ?auto_27496 ?auto_27504 ) ) ( not ( = ?auto_27496 ?auto_27508 ) ) ( not ( = ?auto_27496 ?auto_27501 ) ) ( not ( = ?auto_27496 ?auto_27513 ) ) ( not ( = ?auto_27496 ?auto_27514 ) ) ( not ( = ?auto_27496 ?auto_27520 ) ) ( not ( = ?auto_27496 ?auto_27502 ) ) ( not ( = ?auto_27477 ?auto_27483 ) ) ( not ( = ?auto_27477 ?auto_27506 ) ) ( not ( = ?auto_27478 ?auto_27483 ) ) ( not ( = ?auto_27478 ?auto_27506 ) ) ( not ( = ?auto_27479 ?auto_27483 ) ) ( not ( = ?auto_27479 ?auto_27506 ) ) ( not ( = ?auto_27480 ?auto_27483 ) ) ( not ( = ?auto_27480 ?auto_27506 ) ) ( not ( = ?auto_27481 ?auto_27483 ) ) ( not ( = ?auto_27481 ?auto_27506 ) ) ( not ( = ?auto_27484 ?auto_27483 ) ) ( not ( = ?auto_27484 ?auto_27506 ) ) ( not ( = ?auto_27482 ?auto_27483 ) ) ( not ( = ?auto_27482 ?auto_27506 ) ) ( not ( = ?auto_27486 ?auto_27483 ) ) ( not ( = ?auto_27486 ?auto_27506 ) ) ( not ( = ?auto_27483 ?auto_27496 ) ) ( not ( = ?auto_27483 ?auto_27504 ) ) ( not ( = ?auto_27483 ?auto_27508 ) ) ( not ( = ?auto_27483 ?auto_27501 ) ) ( not ( = ?auto_27483 ?auto_27513 ) ) ( not ( = ?auto_27483 ?auto_27514 ) ) ( not ( = ?auto_27483 ?auto_27520 ) ) ( not ( = ?auto_27483 ?auto_27502 ) ) ( not ( = ?auto_27506 ?auto_27496 ) ) ( not ( = ?auto_27506 ?auto_27504 ) ) ( not ( = ?auto_27506 ?auto_27508 ) ) ( not ( = ?auto_27506 ?auto_27501 ) ) ( not ( = ?auto_27506 ?auto_27513 ) ) ( not ( = ?auto_27506 ?auto_27514 ) ) ( not ( = ?auto_27506 ?auto_27520 ) ) ( not ( = ?auto_27506 ?auto_27502 ) ) ( not ( = ?auto_27477 ?auto_27488 ) ) ( not ( = ?auto_27477 ?auto_27495 ) ) ( not ( = ?auto_27478 ?auto_27488 ) ) ( not ( = ?auto_27478 ?auto_27495 ) ) ( not ( = ?auto_27479 ?auto_27488 ) ) ( not ( = ?auto_27479 ?auto_27495 ) ) ( not ( = ?auto_27480 ?auto_27488 ) ) ( not ( = ?auto_27480 ?auto_27495 ) ) ( not ( = ?auto_27481 ?auto_27488 ) ) ( not ( = ?auto_27481 ?auto_27495 ) ) ( not ( = ?auto_27484 ?auto_27488 ) ) ( not ( = ?auto_27484 ?auto_27495 ) ) ( not ( = ?auto_27482 ?auto_27488 ) ) ( not ( = ?auto_27482 ?auto_27495 ) ) ( not ( = ?auto_27486 ?auto_27488 ) ) ( not ( = ?auto_27486 ?auto_27495 ) ) ( not ( = ?auto_27485 ?auto_27488 ) ) ( not ( = ?auto_27485 ?auto_27495 ) ) ( not ( = ?auto_27488 ?auto_27506 ) ) ( not ( = ?auto_27488 ?auto_27496 ) ) ( not ( = ?auto_27488 ?auto_27504 ) ) ( not ( = ?auto_27488 ?auto_27508 ) ) ( not ( = ?auto_27488 ?auto_27501 ) ) ( not ( = ?auto_27488 ?auto_27513 ) ) ( not ( = ?auto_27488 ?auto_27514 ) ) ( not ( = ?auto_27488 ?auto_27520 ) ) ( not ( = ?auto_27488 ?auto_27502 ) ) ( not ( = ?auto_27497 ?auto_27517 ) ) ( not ( = ?auto_27497 ?auto_27516 ) ) ( not ( = ?auto_27497 ?auto_27511 ) ) ( not ( = ?auto_27497 ?auto_27507 ) ) ( not ( = ?auto_27497 ?auto_27503 ) ) ( not ( = ?auto_27497 ?auto_27515 ) ) ( not ( = ?auto_27497 ?auto_27505 ) ) ( not ( = ?auto_27498 ?auto_27519 ) ) ( not ( = ?auto_27498 ?auto_27509 ) ) ( not ( = ?auto_27498 ?auto_27499 ) ) ( not ( = ?auto_27498 ?auto_27512 ) ) ( not ( = ?auto_27498 ?auto_27500 ) ) ( not ( = ?auto_27498 ?auto_27518 ) ) ( not ( = ?auto_27498 ?auto_27510 ) ) ( not ( = ?auto_27495 ?auto_27506 ) ) ( not ( = ?auto_27495 ?auto_27496 ) ) ( not ( = ?auto_27495 ?auto_27504 ) ) ( not ( = ?auto_27495 ?auto_27508 ) ) ( not ( = ?auto_27495 ?auto_27501 ) ) ( not ( = ?auto_27495 ?auto_27513 ) ) ( not ( = ?auto_27495 ?auto_27514 ) ) ( not ( = ?auto_27495 ?auto_27520 ) ) ( not ( = ?auto_27495 ?auto_27502 ) ) ( not ( = ?auto_27477 ?auto_27487 ) ) ( not ( = ?auto_27477 ?auto_27492 ) ) ( not ( = ?auto_27478 ?auto_27487 ) ) ( not ( = ?auto_27478 ?auto_27492 ) ) ( not ( = ?auto_27479 ?auto_27487 ) ) ( not ( = ?auto_27479 ?auto_27492 ) ) ( not ( = ?auto_27480 ?auto_27487 ) ) ( not ( = ?auto_27480 ?auto_27492 ) ) ( not ( = ?auto_27481 ?auto_27487 ) ) ( not ( = ?auto_27481 ?auto_27492 ) ) ( not ( = ?auto_27484 ?auto_27487 ) ) ( not ( = ?auto_27484 ?auto_27492 ) ) ( not ( = ?auto_27482 ?auto_27487 ) ) ( not ( = ?auto_27482 ?auto_27492 ) ) ( not ( = ?auto_27486 ?auto_27487 ) ) ( not ( = ?auto_27486 ?auto_27492 ) ) ( not ( = ?auto_27485 ?auto_27487 ) ) ( not ( = ?auto_27485 ?auto_27492 ) ) ( not ( = ?auto_27483 ?auto_27487 ) ) ( not ( = ?auto_27483 ?auto_27492 ) ) ( not ( = ?auto_27487 ?auto_27495 ) ) ( not ( = ?auto_27487 ?auto_27506 ) ) ( not ( = ?auto_27487 ?auto_27496 ) ) ( not ( = ?auto_27487 ?auto_27504 ) ) ( not ( = ?auto_27487 ?auto_27508 ) ) ( not ( = ?auto_27487 ?auto_27501 ) ) ( not ( = ?auto_27487 ?auto_27513 ) ) ( not ( = ?auto_27487 ?auto_27514 ) ) ( not ( = ?auto_27487 ?auto_27520 ) ) ( not ( = ?auto_27487 ?auto_27502 ) ) ( not ( = ?auto_27494 ?auto_27497 ) ) ( not ( = ?auto_27494 ?auto_27517 ) ) ( not ( = ?auto_27494 ?auto_27516 ) ) ( not ( = ?auto_27494 ?auto_27511 ) ) ( not ( = ?auto_27494 ?auto_27507 ) ) ( not ( = ?auto_27494 ?auto_27503 ) ) ( not ( = ?auto_27494 ?auto_27515 ) ) ( not ( = ?auto_27494 ?auto_27505 ) ) ( not ( = ?auto_27489 ?auto_27498 ) ) ( not ( = ?auto_27489 ?auto_27519 ) ) ( not ( = ?auto_27489 ?auto_27509 ) ) ( not ( = ?auto_27489 ?auto_27499 ) ) ( not ( = ?auto_27489 ?auto_27512 ) ) ( not ( = ?auto_27489 ?auto_27500 ) ) ( not ( = ?auto_27489 ?auto_27518 ) ) ( not ( = ?auto_27489 ?auto_27510 ) ) ( not ( = ?auto_27492 ?auto_27495 ) ) ( not ( = ?auto_27492 ?auto_27506 ) ) ( not ( = ?auto_27492 ?auto_27496 ) ) ( not ( = ?auto_27492 ?auto_27504 ) ) ( not ( = ?auto_27492 ?auto_27508 ) ) ( not ( = ?auto_27492 ?auto_27501 ) ) ( not ( = ?auto_27492 ?auto_27513 ) ) ( not ( = ?auto_27492 ?auto_27514 ) ) ( not ( = ?auto_27492 ?auto_27520 ) ) ( not ( = ?auto_27492 ?auto_27502 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_27477 ?auto_27478 ?auto_27479 ?auto_27480 ?auto_27481 ?auto_27484 ?auto_27482 ?auto_27486 ?auto_27485 ?auto_27483 ?auto_27488 )
      ( MAKE-1CRATE ?auto_27488 ?auto_27487 )
      ( MAKE-11CRATE-VERIFY ?auto_27477 ?auto_27478 ?auto_27479 ?auto_27480 ?auto_27481 ?auto_27484 ?auto_27482 ?auto_27486 ?auto_27485 ?auto_27483 ?auto_27488 ?auto_27487 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27523 - SURFACE
      ?auto_27524 - SURFACE
    )
    :vars
    (
      ?auto_27525 - HOIST
      ?auto_27526 - PLACE
      ?auto_27528 - PLACE
      ?auto_27529 - HOIST
      ?auto_27530 - SURFACE
      ?auto_27527 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27525 ?auto_27526 ) ( SURFACE-AT ?auto_27523 ?auto_27526 ) ( CLEAR ?auto_27523 ) ( IS-CRATE ?auto_27524 ) ( AVAILABLE ?auto_27525 ) ( not ( = ?auto_27528 ?auto_27526 ) ) ( HOIST-AT ?auto_27529 ?auto_27528 ) ( AVAILABLE ?auto_27529 ) ( SURFACE-AT ?auto_27524 ?auto_27528 ) ( ON ?auto_27524 ?auto_27530 ) ( CLEAR ?auto_27524 ) ( TRUCK-AT ?auto_27527 ?auto_27526 ) ( not ( = ?auto_27523 ?auto_27524 ) ) ( not ( = ?auto_27523 ?auto_27530 ) ) ( not ( = ?auto_27524 ?auto_27530 ) ) ( not ( = ?auto_27525 ?auto_27529 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27527 ?auto_27526 ?auto_27528 )
      ( !LIFT ?auto_27529 ?auto_27524 ?auto_27530 ?auto_27528 )
      ( !LOAD ?auto_27529 ?auto_27524 ?auto_27527 ?auto_27528 )
      ( !DRIVE ?auto_27527 ?auto_27528 ?auto_27526 )
      ( !UNLOAD ?auto_27525 ?auto_27524 ?auto_27527 ?auto_27526 )
      ( !DROP ?auto_27525 ?auto_27524 ?auto_27523 ?auto_27526 )
      ( MAKE-1CRATE-VERIFY ?auto_27523 ?auto_27524 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_27544 - SURFACE
      ?auto_27545 - SURFACE
      ?auto_27546 - SURFACE
      ?auto_27547 - SURFACE
      ?auto_27548 - SURFACE
      ?auto_27551 - SURFACE
      ?auto_27549 - SURFACE
      ?auto_27553 - SURFACE
      ?auto_27552 - SURFACE
      ?auto_27550 - SURFACE
      ?auto_27555 - SURFACE
      ?auto_27554 - SURFACE
      ?auto_27556 - SURFACE
    )
    :vars
    (
      ?auto_27558 - HOIST
      ?auto_27559 - PLACE
      ?auto_27562 - PLACE
      ?auto_27561 - HOIST
      ?auto_27557 - SURFACE
      ?auto_27576 - PLACE
      ?auto_27586 - HOIST
      ?auto_27574 - SURFACE
      ?auto_27564 - PLACE
      ?auto_27581 - HOIST
      ?auto_27575 - SURFACE
      ?auto_27566 - PLACE
      ?auto_27563 - HOIST
      ?auto_27591 - SURFACE
      ?auto_27573 - PLACE
      ?auto_27583 - HOIST
      ?auto_27584 - SURFACE
      ?auto_27567 - PLACE
      ?auto_27588 - HOIST
      ?auto_27579 - SURFACE
      ?auto_27572 - PLACE
      ?auto_27569 - HOIST
      ?auto_27587 - SURFACE
      ?auto_27582 - PLACE
      ?auto_27590 - HOIST
      ?auto_27568 - SURFACE
      ?auto_27589 - SURFACE
      ?auto_27585 - PLACE
      ?auto_27565 - HOIST
      ?auto_27580 - SURFACE
      ?auto_27578 - PLACE
      ?auto_27577 - HOIST
      ?auto_27570 - SURFACE
      ?auto_27571 - SURFACE
      ?auto_27560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27558 ?auto_27559 ) ( IS-CRATE ?auto_27556 ) ( not ( = ?auto_27562 ?auto_27559 ) ) ( HOIST-AT ?auto_27561 ?auto_27562 ) ( AVAILABLE ?auto_27561 ) ( SURFACE-AT ?auto_27556 ?auto_27562 ) ( ON ?auto_27556 ?auto_27557 ) ( CLEAR ?auto_27556 ) ( not ( = ?auto_27554 ?auto_27556 ) ) ( not ( = ?auto_27554 ?auto_27557 ) ) ( not ( = ?auto_27556 ?auto_27557 ) ) ( not ( = ?auto_27558 ?auto_27561 ) ) ( IS-CRATE ?auto_27554 ) ( not ( = ?auto_27576 ?auto_27559 ) ) ( HOIST-AT ?auto_27586 ?auto_27576 ) ( AVAILABLE ?auto_27586 ) ( SURFACE-AT ?auto_27554 ?auto_27576 ) ( ON ?auto_27554 ?auto_27574 ) ( CLEAR ?auto_27554 ) ( not ( = ?auto_27555 ?auto_27554 ) ) ( not ( = ?auto_27555 ?auto_27574 ) ) ( not ( = ?auto_27554 ?auto_27574 ) ) ( not ( = ?auto_27558 ?auto_27586 ) ) ( IS-CRATE ?auto_27555 ) ( not ( = ?auto_27564 ?auto_27559 ) ) ( HOIST-AT ?auto_27581 ?auto_27564 ) ( AVAILABLE ?auto_27581 ) ( SURFACE-AT ?auto_27555 ?auto_27564 ) ( ON ?auto_27555 ?auto_27575 ) ( CLEAR ?auto_27555 ) ( not ( = ?auto_27550 ?auto_27555 ) ) ( not ( = ?auto_27550 ?auto_27575 ) ) ( not ( = ?auto_27555 ?auto_27575 ) ) ( not ( = ?auto_27558 ?auto_27581 ) ) ( IS-CRATE ?auto_27550 ) ( not ( = ?auto_27566 ?auto_27559 ) ) ( HOIST-AT ?auto_27563 ?auto_27566 ) ( SURFACE-AT ?auto_27550 ?auto_27566 ) ( ON ?auto_27550 ?auto_27591 ) ( CLEAR ?auto_27550 ) ( not ( = ?auto_27552 ?auto_27550 ) ) ( not ( = ?auto_27552 ?auto_27591 ) ) ( not ( = ?auto_27550 ?auto_27591 ) ) ( not ( = ?auto_27558 ?auto_27563 ) ) ( IS-CRATE ?auto_27552 ) ( not ( = ?auto_27573 ?auto_27559 ) ) ( HOIST-AT ?auto_27583 ?auto_27573 ) ( AVAILABLE ?auto_27583 ) ( SURFACE-AT ?auto_27552 ?auto_27573 ) ( ON ?auto_27552 ?auto_27584 ) ( CLEAR ?auto_27552 ) ( not ( = ?auto_27553 ?auto_27552 ) ) ( not ( = ?auto_27553 ?auto_27584 ) ) ( not ( = ?auto_27552 ?auto_27584 ) ) ( not ( = ?auto_27558 ?auto_27583 ) ) ( IS-CRATE ?auto_27553 ) ( not ( = ?auto_27567 ?auto_27559 ) ) ( HOIST-AT ?auto_27588 ?auto_27567 ) ( SURFACE-AT ?auto_27553 ?auto_27567 ) ( ON ?auto_27553 ?auto_27579 ) ( CLEAR ?auto_27553 ) ( not ( = ?auto_27549 ?auto_27553 ) ) ( not ( = ?auto_27549 ?auto_27579 ) ) ( not ( = ?auto_27553 ?auto_27579 ) ) ( not ( = ?auto_27558 ?auto_27588 ) ) ( IS-CRATE ?auto_27549 ) ( not ( = ?auto_27572 ?auto_27559 ) ) ( HOIST-AT ?auto_27569 ?auto_27572 ) ( AVAILABLE ?auto_27569 ) ( SURFACE-AT ?auto_27549 ?auto_27572 ) ( ON ?auto_27549 ?auto_27587 ) ( CLEAR ?auto_27549 ) ( not ( = ?auto_27551 ?auto_27549 ) ) ( not ( = ?auto_27551 ?auto_27587 ) ) ( not ( = ?auto_27549 ?auto_27587 ) ) ( not ( = ?auto_27558 ?auto_27569 ) ) ( IS-CRATE ?auto_27551 ) ( not ( = ?auto_27582 ?auto_27559 ) ) ( HOIST-AT ?auto_27590 ?auto_27582 ) ( AVAILABLE ?auto_27590 ) ( SURFACE-AT ?auto_27551 ?auto_27582 ) ( ON ?auto_27551 ?auto_27568 ) ( CLEAR ?auto_27551 ) ( not ( = ?auto_27548 ?auto_27551 ) ) ( not ( = ?auto_27548 ?auto_27568 ) ) ( not ( = ?auto_27551 ?auto_27568 ) ) ( not ( = ?auto_27558 ?auto_27590 ) ) ( IS-CRATE ?auto_27548 ) ( AVAILABLE ?auto_27563 ) ( SURFACE-AT ?auto_27548 ?auto_27566 ) ( ON ?auto_27548 ?auto_27589 ) ( CLEAR ?auto_27548 ) ( not ( = ?auto_27547 ?auto_27548 ) ) ( not ( = ?auto_27547 ?auto_27589 ) ) ( not ( = ?auto_27548 ?auto_27589 ) ) ( IS-CRATE ?auto_27547 ) ( not ( = ?auto_27585 ?auto_27559 ) ) ( HOIST-AT ?auto_27565 ?auto_27585 ) ( AVAILABLE ?auto_27565 ) ( SURFACE-AT ?auto_27547 ?auto_27585 ) ( ON ?auto_27547 ?auto_27580 ) ( CLEAR ?auto_27547 ) ( not ( = ?auto_27546 ?auto_27547 ) ) ( not ( = ?auto_27546 ?auto_27580 ) ) ( not ( = ?auto_27547 ?auto_27580 ) ) ( not ( = ?auto_27558 ?auto_27565 ) ) ( IS-CRATE ?auto_27546 ) ( not ( = ?auto_27578 ?auto_27559 ) ) ( HOIST-AT ?auto_27577 ?auto_27578 ) ( AVAILABLE ?auto_27577 ) ( SURFACE-AT ?auto_27546 ?auto_27578 ) ( ON ?auto_27546 ?auto_27570 ) ( CLEAR ?auto_27546 ) ( not ( = ?auto_27545 ?auto_27546 ) ) ( not ( = ?auto_27545 ?auto_27570 ) ) ( not ( = ?auto_27546 ?auto_27570 ) ) ( not ( = ?auto_27558 ?auto_27577 ) ) ( SURFACE-AT ?auto_27544 ?auto_27559 ) ( CLEAR ?auto_27544 ) ( IS-CRATE ?auto_27545 ) ( AVAILABLE ?auto_27558 ) ( AVAILABLE ?auto_27588 ) ( SURFACE-AT ?auto_27545 ?auto_27567 ) ( ON ?auto_27545 ?auto_27571 ) ( CLEAR ?auto_27545 ) ( TRUCK-AT ?auto_27560 ?auto_27559 ) ( not ( = ?auto_27544 ?auto_27545 ) ) ( not ( = ?auto_27544 ?auto_27571 ) ) ( not ( = ?auto_27545 ?auto_27571 ) ) ( not ( = ?auto_27544 ?auto_27546 ) ) ( not ( = ?auto_27544 ?auto_27570 ) ) ( not ( = ?auto_27546 ?auto_27571 ) ) ( not ( = ?auto_27578 ?auto_27567 ) ) ( not ( = ?auto_27577 ?auto_27588 ) ) ( not ( = ?auto_27570 ?auto_27571 ) ) ( not ( = ?auto_27544 ?auto_27547 ) ) ( not ( = ?auto_27544 ?auto_27580 ) ) ( not ( = ?auto_27545 ?auto_27547 ) ) ( not ( = ?auto_27545 ?auto_27580 ) ) ( not ( = ?auto_27547 ?auto_27570 ) ) ( not ( = ?auto_27547 ?auto_27571 ) ) ( not ( = ?auto_27585 ?auto_27578 ) ) ( not ( = ?auto_27585 ?auto_27567 ) ) ( not ( = ?auto_27565 ?auto_27577 ) ) ( not ( = ?auto_27565 ?auto_27588 ) ) ( not ( = ?auto_27580 ?auto_27570 ) ) ( not ( = ?auto_27580 ?auto_27571 ) ) ( not ( = ?auto_27544 ?auto_27548 ) ) ( not ( = ?auto_27544 ?auto_27589 ) ) ( not ( = ?auto_27545 ?auto_27548 ) ) ( not ( = ?auto_27545 ?auto_27589 ) ) ( not ( = ?auto_27546 ?auto_27548 ) ) ( not ( = ?auto_27546 ?auto_27589 ) ) ( not ( = ?auto_27548 ?auto_27580 ) ) ( not ( = ?auto_27548 ?auto_27570 ) ) ( not ( = ?auto_27548 ?auto_27571 ) ) ( not ( = ?auto_27566 ?auto_27585 ) ) ( not ( = ?auto_27566 ?auto_27578 ) ) ( not ( = ?auto_27566 ?auto_27567 ) ) ( not ( = ?auto_27563 ?auto_27565 ) ) ( not ( = ?auto_27563 ?auto_27577 ) ) ( not ( = ?auto_27563 ?auto_27588 ) ) ( not ( = ?auto_27589 ?auto_27580 ) ) ( not ( = ?auto_27589 ?auto_27570 ) ) ( not ( = ?auto_27589 ?auto_27571 ) ) ( not ( = ?auto_27544 ?auto_27551 ) ) ( not ( = ?auto_27544 ?auto_27568 ) ) ( not ( = ?auto_27545 ?auto_27551 ) ) ( not ( = ?auto_27545 ?auto_27568 ) ) ( not ( = ?auto_27546 ?auto_27551 ) ) ( not ( = ?auto_27546 ?auto_27568 ) ) ( not ( = ?auto_27547 ?auto_27551 ) ) ( not ( = ?auto_27547 ?auto_27568 ) ) ( not ( = ?auto_27551 ?auto_27589 ) ) ( not ( = ?auto_27551 ?auto_27580 ) ) ( not ( = ?auto_27551 ?auto_27570 ) ) ( not ( = ?auto_27551 ?auto_27571 ) ) ( not ( = ?auto_27582 ?auto_27566 ) ) ( not ( = ?auto_27582 ?auto_27585 ) ) ( not ( = ?auto_27582 ?auto_27578 ) ) ( not ( = ?auto_27582 ?auto_27567 ) ) ( not ( = ?auto_27590 ?auto_27563 ) ) ( not ( = ?auto_27590 ?auto_27565 ) ) ( not ( = ?auto_27590 ?auto_27577 ) ) ( not ( = ?auto_27590 ?auto_27588 ) ) ( not ( = ?auto_27568 ?auto_27589 ) ) ( not ( = ?auto_27568 ?auto_27580 ) ) ( not ( = ?auto_27568 ?auto_27570 ) ) ( not ( = ?auto_27568 ?auto_27571 ) ) ( not ( = ?auto_27544 ?auto_27549 ) ) ( not ( = ?auto_27544 ?auto_27587 ) ) ( not ( = ?auto_27545 ?auto_27549 ) ) ( not ( = ?auto_27545 ?auto_27587 ) ) ( not ( = ?auto_27546 ?auto_27549 ) ) ( not ( = ?auto_27546 ?auto_27587 ) ) ( not ( = ?auto_27547 ?auto_27549 ) ) ( not ( = ?auto_27547 ?auto_27587 ) ) ( not ( = ?auto_27548 ?auto_27549 ) ) ( not ( = ?auto_27548 ?auto_27587 ) ) ( not ( = ?auto_27549 ?auto_27568 ) ) ( not ( = ?auto_27549 ?auto_27589 ) ) ( not ( = ?auto_27549 ?auto_27580 ) ) ( not ( = ?auto_27549 ?auto_27570 ) ) ( not ( = ?auto_27549 ?auto_27571 ) ) ( not ( = ?auto_27572 ?auto_27582 ) ) ( not ( = ?auto_27572 ?auto_27566 ) ) ( not ( = ?auto_27572 ?auto_27585 ) ) ( not ( = ?auto_27572 ?auto_27578 ) ) ( not ( = ?auto_27572 ?auto_27567 ) ) ( not ( = ?auto_27569 ?auto_27590 ) ) ( not ( = ?auto_27569 ?auto_27563 ) ) ( not ( = ?auto_27569 ?auto_27565 ) ) ( not ( = ?auto_27569 ?auto_27577 ) ) ( not ( = ?auto_27569 ?auto_27588 ) ) ( not ( = ?auto_27587 ?auto_27568 ) ) ( not ( = ?auto_27587 ?auto_27589 ) ) ( not ( = ?auto_27587 ?auto_27580 ) ) ( not ( = ?auto_27587 ?auto_27570 ) ) ( not ( = ?auto_27587 ?auto_27571 ) ) ( not ( = ?auto_27544 ?auto_27553 ) ) ( not ( = ?auto_27544 ?auto_27579 ) ) ( not ( = ?auto_27545 ?auto_27553 ) ) ( not ( = ?auto_27545 ?auto_27579 ) ) ( not ( = ?auto_27546 ?auto_27553 ) ) ( not ( = ?auto_27546 ?auto_27579 ) ) ( not ( = ?auto_27547 ?auto_27553 ) ) ( not ( = ?auto_27547 ?auto_27579 ) ) ( not ( = ?auto_27548 ?auto_27553 ) ) ( not ( = ?auto_27548 ?auto_27579 ) ) ( not ( = ?auto_27551 ?auto_27553 ) ) ( not ( = ?auto_27551 ?auto_27579 ) ) ( not ( = ?auto_27553 ?auto_27587 ) ) ( not ( = ?auto_27553 ?auto_27568 ) ) ( not ( = ?auto_27553 ?auto_27589 ) ) ( not ( = ?auto_27553 ?auto_27580 ) ) ( not ( = ?auto_27553 ?auto_27570 ) ) ( not ( = ?auto_27553 ?auto_27571 ) ) ( not ( = ?auto_27579 ?auto_27587 ) ) ( not ( = ?auto_27579 ?auto_27568 ) ) ( not ( = ?auto_27579 ?auto_27589 ) ) ( not ( = ?auto_27579 ?auto_27580 ) ) ( not ( = ?auto_27579 ?auto_27570 ) ) ( not ( = ?auto_27579 ?auto_27571 ) ) ( not ( = ?auto_27544 ?auto_27552 ) ) ( not ( = ?auto_27544 ?auto_27584 ) ) ( not ( = ?auto_27545 ?auto_27552 ) ) ( not ( = ?auto_27545 ?auto_27584 ) ) ( not ( = ?auto_27546 ?auto_27552 ) ) ( not ( = ?auto_27546 ?auto_27584 ) ) ( not ( = ?auto_27547 ?auto_27552 ) ) ( not ( = ?auto_27547 ?auto_27584 ) ) ( not ( = ?auto_27548 ?auto_27552 ) ) ( not ( = ?auto_27548 ?auto_27584 ) ) ( not ( = ?auto_27551 ?auto_27552 ) ) ( not ( = ?auto_27551 ?auto_27584 ) ) ( not ( = ?auto_27549 ?auto_27552 ) ) ( not ( = ?auto_27549 ?auto_27584 ) ) ( not ( = ?auto_27552 ?auto_27579 ) ) ( not ( = ?auto_27552 ?auto_27587 ) ) ( not ( = ?auto_27552 ?auto_27568 ) ) ( not ( = ?auto_27552 ?auto_27589 ) ) ( not ( = ?auto_27552 ?auto_27580 ) ) ( not ( = ?auto_27552 ?auto_27570 ) ) ( not ( = ?auto_27552 ?auto_27571 ) ) ( not ( = ?auto_27573 ?auto_27567 ) ) ( not ( = ?auto_27573 ?auto_27572 ) ) ( not ( = ?auto_27573 ?auto_27582 ) ) ( not ( = ?auto_27573 ?auto_27566 ) ) ( not ( = ?auto_27573 ?auto_27585 ) ) ( not ( = ?auto_27573 ?auto_27578 ) ) ( not ( = ?auto_27583 ?auto_27588 ) ) ( not ( = ?auto_27583 ?auto_27569 ) ) ( not ( = ?auto_27583 ?auto_27590 ) ) ( not ( = ?auto_27583 ?auto_27563 ) ) ( not ( = ?auto_27583 ?auto_27565 ) ) ( not ( = ?auto_27583 ?auto_27577 ) ) ( not ( = ?auto_27584 ?auto_27579 ) ) ( not ( = ?auto_27584 ?auto_27587 ) ) ( not ( = ?auto_27584 ?auto_27568 ) ) ( not ( = ?auto_27584 ?auto_27589 ) ) ( not ( = ?auto_27584 ?auto_27580 ) ) ( not ( = ?auto_27584 ?auto_27570 ) ) ( not ( = ?auto_27584 ?auto_27571 ) ) ( not ( = ?auto_27544 ?auto_27550 ) ) ( not ( = ?auto_27544 ?auto_27591 ) ) ( not ( = ?auto_27545 ?auto_27550 ) ) ( not ( = ?auto_27545 ?auto_27591 ) ) ( not ( = ?auto_27546 ?auto_27550 ) ) ( not ( = ?auto_27546 ?auto_27591 ) ) ( not ( = ?auto_27547 ?auto_27550 ) ) ( not ( = ?auto_27547 ?auto_27591 ) ) ( not ( = ?auto_27548 ?auto_27550 ) ) ( not ( = ?auto_27548 ?auto_27591 ) ) ( not ( = ?auto_27551 ?auto_27550 ) ) ( not ( = ?auto_27551 ?auto_27591 ) ) ( not ( = ?auto_27549 ?auto_27550 ) ) ( not ( = ?auto_27549 ?auto_27591 ) ) ( not ( = ?auto_27553 ?auto_27550 ) ) ( not ( = ?auto_27553 ?auto_27591 ) ) ( not ( = ?auto_27550 ?auto_27584 ) ) ( not ( = ?auto_27550 ?auto_27579 ) ) ( not ( = ?auto_27550 ?auto_27587 ) ) ( not ( = ?auto_27550 ?auto_27568 ) ) ( not ( = ?auto_27550 ?auto_27589 ) ) ( not ( = ?auto_27550 ?auto_27580 ) ) ( not ( = ?auto_27550 ?auto_27570 ) ) ( not ( = ?auto_27550 ?auto_27571 ) ) ( not ( = ?auto_27591 ?auto_27584 ) ) ( not ( = ?auto_27591 ?auto_27579 ) ) ( not ( = ?auto_27591 ?auto_27587 ) ) ( not ( = ?auto_27591 ?auto_27568 ) ) ( not ( = ?auto_27591 ?auto_27589 ) ) ( not ( = ?auto_27591 ?auto_27580 ) ) ( not ( = ?auto_27591 ?auto_27570 ) ) ( not ( = ?auto_27591 ?auto_27571 ) ) ( not ( = ?auto_27544 ?auto_27555 ) ) ( not ( = ?auto_27544 ?auto_27575 ) ) ( not ( = ?auto_27545 ?auto_27555 ) ) ( not ( = ?auto_27545 ?auto_27575 ) ) ( not ( = ?auto_27546 ?auto_27555 ) ) ( not ( = ?auto_27546 ?auto_27575 ) ) ( not ( = ?auto_27547 ?auto_27555 ) ) ( not ( = ?auto_27547 ?auto_27575 ) ) ( not ( = ?auto_27548 ?auto_27555 ) ) ( not ( = ?auto_27548 ?auto_27575 ) ) ( not ( = ?auto_27551 ?auto_27555 ) ) ( not ( = ?auto_27551 ?auto_27575 ) ) ( not ( = ?auto_27549 ?auto_27555 ) ) ( not ( = ?auto_27549 ?auto_27575 ) ) ( not ( = ?auto_27553 ?auto_27555 ) ) ( not ( = ?auto_27553 ?auto_27575 ) ) ( not ( = ?auto_27552 ?auto_27555 ) ) ( not ( = ?auto_27552 ?auto_27575 ) ) ( not ( = ?auto_27555 ?auto_27591 ) ) ( not ( = ?auto_27555 ?auto_27584 ) ) ( not ( = ?auto_27555 ?auto_27579 ) ) ( not ( = ?auto_27555 ?auto_27587 ) ) ( not ( = ?auto_27555 ?auto_27568 ) ) ( not ( = ?auto_27555 ?auto_27589 ) ) ( not ( = ?auto_27555 ?auto_27580 ) ) ( not ( = ?auto_27555 ?auto_27570 ) ) ( not ( = ?auto_27555 ?auto_27571 ) ) ( not ( = ?auto_27564 ?auto_27566 ) ) ( not ( = ?auto_27564 ?auto_27573 ) ) ( not ( = ?auto_27564 ?auto_27567 ) ) ( not ( = ?auto_27564 ?auto_27572 ) ) ( not ( = ?auto_27564 ?auto_27582 ) ) ( not ( = ?auto_27564 ?auto_27585 ) ) ( not ( = ?auto_27564 ?auto_27578 ) ) ( not ( = ?auto_27581 ?auto_27563 ) ) ( not ( = ?auto_27581 ?auto_27583 ) ) ( not ( = ?auto_27581 ?auto_27588 ) ) ( not ( = ?auto_27581 ?auto_27569 ) ) ( not ( = ?auto_27581 ?auto_27590 ) ) ( not ( = ?auto_27581 ?auto_27565 ) ) ( not ( = ?auto_27581 ?auto_27577 ) ) ( not ( = ?auto_27575 ?auto_27591 ) ) ( not ( = ?auto_27575 ?auto_27584 ) ) ( not ( = ?auto_27575 ?auto_27579 ) ) ( not ( = ?auto_27575 ?auto_27587 ) ) ( not ( = ?auto_27575 ?auto_27568 ) ) ( not ( = ?auto_27575 ?auto_27589 ) ) ( not ( = ?auto_27575 ?auto_27580 ) ) ( not ( = ?auto_27575 ?auto_27570 ) ) ( not ( = ?auto_27575 ?auto_27571 ) ) ( not ( = ?auto_27544 ?auto_27554 ) ) ( not ( = ?auto_27544 ?auto_27574 ) ) ( not ( = ?auto_27545 ?auto_27554 ) ) ( not ( = ?auto_27545 ?auto_27574 ) ) ( not ( = ?auto_27546 ?auto_27554 ) ) ( not ( = ?auto_27546 ?auto_27574 ) ) ( not ( = ?auto_27547 ?auto_27554 ) ) ( not ( = ?auto_27547 ?auto_27574 ) ) ( not ( = ?auto_27548 ?auto_27554 ) ) ( not ( = ?auto_27548 ?auto_27574 ) ) ( not ( = ?auto_27551 ?auto_27554 ) ) ( not ( = ?auto_27551 ?auto_27574 ) ) ( not ( = ?auto_27549 ?auto_27554 ) ) ( not ( = ?auto_27549 ?auto_27574 ) ) ( not ( = ?auto_27553 ?auto_27554 ) ) ( not ( = ?auto_27553 ?auto_27574 ) ) ( not ( = ?auto_27552 ?auto_27554 ) ) ( not ( = ?auto_27552 ?auto_27574 ) ) ( not ( = ?auto_27550 ?auto_27554 ) ) ( not ( = ?auto_27550 ?auto_27574 ) ) ( not ( = ?auto_27554 ?auto_27575 ) ) ( not ( = ?auto_27554 ?auto_27591 ) ) ( not ( = ?auto_27554 ?auto_27584 ) ) ( not ( = ?auto_27554 ?auto_27579 ) ) ( not ( = ?auto_27554 ?auto_27587 ) ) ( not ( = ?auto_27554 ?auto_27568 ) ) ( not ( = ?auto_27554 ?auto_27589 ) ) ( not ( = ?auto_27554 ?auto_27580 ) ) ( not ( = ?auto_27554 ?auto_27570 ) ) ( not ( = ?auto_27554 ?auto_27571 ) ) ( not ( = ?auto_27576 ?auto_27564 ) ) ( not ( = ?auto_27576 ?auto_27566 ) ) ( not ( = ?auto_27576 ?auto_27573 ) ) ( not ( = ?auto_27576 ?auto_27567 ) ) ( not ( = ?auto_27576 ?auto_27572 ) ) ( not ( = ?auto_27576 ?auto_27582 ) ) ( not ( = ?auto_27576 ?auto_27585 ) ) ( not ( = ?auto_27576 ?auto_27578 ) ) ( not ( = ?auto_27586 ?auto_27581 ) ) ( not ( = ?auto_27586 ?auto_27563 ) ) ( not ( = ?auto_27586 ?auto_27583 ) ) ( not ( = ?auto_27586 ?auto_27588 ) ) ( not ( = ?auto_27586 ?auto_27569 ) ) ( not ( = ?auto_27586 ?auto_27590 ) ) ( not ( = ?auto_27586 ?auto_27565 ) ) ( not ( = ?auto_27586 ?auto_27577 ) ) ( not ( = ?auto_27574 ?auto_27575 ) ) ( not ( = ?auto_27574 ?auto_27591 ) ) ( not ( = ?auto_27574 ?auto_27584 ) ) ( not ( = ?auto_27574 ?auto_27579 ) ) ( not ( = ?auto_27574 ?auto_27587 ) ) ( not ( = ?auto_27574 ?auto_27568 ) ) ( not ( = ?auto_27574 ?auto_27589 ) ) ( not ( = ?auto_27574 ?auto_27580 ) ) ( not ( = ?auto_27574 ?auto_27570 ) ) ( not ( = ?auto_27574 ?auto_27571 ) ) ( not ( = ?auto_27544 ?auto_27556 ) ) ( not ( = ?auto_27544 ?auto_27557 ) ) ( not ( = ?auto_27545 ?auto_27556 ) ) ( not ( = ?auto_27545 ?auto_27557 ) ) ( not ( = ?auto_27546 ?auto_27556 ) ) ( not ( = ?auto_27546 ?auto_27557 ) ) ( not ( = ?auto_27547 ?auto_27556 ) ) ( not ( = ?auto_27547 ?auto_27557 ) ) ( not ( = ?auto_27548 ?auto_27556 ) ) ( not ( = ?auto_27548 ?auto_27557 ) ) ( not ( = ?auto_27551 ?auto_27556 ) ) ( not ( = ?auto_27551 ?auto_27557 ) ) ( not ( = ?auto_27549 ?auto_27556 ) ) ( not ( = ?auto_27549 ?auto_27557 ) ) ( not ( = ?auto_27553 ?auto_27556 ) ) ( not ( = ?auto_27553 ?auto_27557 ) ) ( not ( = ?auto_27552 ?auto_27556 ) ) ( not ( = ?auto_27552 ?auto_27557 ) ) ( not ( = ?auto_27550 ?auto_27556 ) ) ( not ( = ?auto_27550 ?auto_27557 ) ) ( not ( = ?auto_27555 ?auto_27556 ) ) ( not ( = ?auto_27555 ?auto_27557 ) ) ( not ( = ?auto_27556 ?auto_27574 ) ) ( not ( = ?auto_27556 ?auto_27575 ) ) ( not ( = ?auto_27556 ?auto_27591 ) ) ( not ( = ?auto_27556 ?auto_27584 ) ) ( not ( = ?auto_27556 ?auto_27579 ) ) ( not ( = ?auto_27556 ?auto_27587 ) ) ( not ( = ?auto_27556 ?auto_27568 ) ) ( not ( = ?auto_27556 ?auto_27589 ) ) ( not ( = ?auto_27556 ?auto_27580 ) ) ( not ( = ?auto_27556 ?auto_27570 ) ) ( not ( = ?auto_27556 ?auto_27571 ) ) ( not ( = ?auto_27562 ?auto_27576 ) ) ( not ( = ?auto_27562 ?auto_27564 ) ) ( not ( = ?auto_27562 ?auto_27566 ) ) ( not ( = ?auto_27562 ?auto_27573 ) ) ( not ( = ?auto_27562 ?auto_27567 ) ) ( not ( = ?auto_27562 ?auto_27572 ) ) ( not ( = ?auto_27562 ?auto_27582 ) ) ( not ( = ?auto_27562 ?auto_27585 ) ) ( not ( = ?auto_27562 ?auto_27578 ) ) ( not ( = ?auto_27561 ?auto_27586 ) ) ( not ( = ?auto_27561 ?auto_27581 ) ) ( not ( = ?auto_27561 ?auto_27563 ) ) ( not ( = ?auto_27561 ?auto_27583 ) ) ( not ( = ?auto_27561 ?auto_27588 ) ) ( not ( = ?auto_27561 ?auto_27569 ) ) ( not ( = ?auto_27561 ?auto_27590 ) ) ( not ( = ?auto_27561 ?auto_27565 ) ) ( not ( = ?auto_27561 ?auto_27577 ) ) ( not ( = ?auto_27557 ?auto_27574 ) ) ( not ( = ?auto_27557 ?auto_27575 ) ) ( not ( = ?auto_27557 ?auto_27591 ) ) ( not ( = ?auto_27557 ?auto_27584 ) ) ( not ( = ?auto_27557 ?auto_27579 ) ) ( not ( = ?auto_27557 ?auto_27587 ) ) ( not ( = ?auto_27557 ?auto_27568 ) ) ( not ( = ?auto_27557 ?auto_27589 ) ) ( not ( = ?auto_27557 ?auto_27580 ) ) ( not ( = ?auto_27557 ?auto_27570 ) ) ( not ( = ?auto_27557 ?auto_27571 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_27544 ?auto_27545 ?auto_27546 ?auto_27547 ?auto_27548 ?auto_27551 ?auto_27549 ?auto_27553 ?auto_27552 ?auto_27550 ?auto_27555 ?auto_27554 )
      ( MAKE-1CRATE ?auto_27554 ?auto_27556 )
      ( MAKE-12CRATE-VERIFY ?auto_27544 ?auto_27545 ?auto_27546 ?auto_27547 ?auto_27548 ?auto_27551 ?auto_27549 ?auto_27553 ?auto_27552 ?auto_27550 ?auto_27555 ?auto_27554 ?auto_27556 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27594 - SURFACE
      ?auto_27595 - SURFACE
    )
    :vars
    (
      ?auto_27596 - HOIST
      ?auto_27597 - PLACE
      ?auto_27599 - PLACE
      ?auto_27600 - HOIST
      ?auto_27601 - SURFACE
      ?auto_27598 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27596 ?auto_27597 ) ( SURFACE-AT ?auto_27594 ?auto_27597 ) ( CLEAR ?auto_27594 ) ( IS-CRATE ?auto_27595 ) ( AVAILABLE ?auto_27596 ) ( not ( = ?auto_27599 ?auto_27597 ) ) ( HOIST-AT ?auto_27600 ?auto_27599 ) ( AVAILABLE ?auto_27600 ) ( SURFACE-AT ?auto_27595 ?auto_27599 ) ( ON ?auto_27595 ?auto_27601 ) ( CLEAR ?auto_27595 ) ( TRUCK-AT ?auto_27598 ?auto_27597 ) ( not ( = ?auto_27594 ?auto_27595 ) ) ( not ( = ?auto_27594 ?auto_27601 ) ) ( not ( = ?auto_27595 ?auto_27601 ) ) ( not ( = ?auto_27596 ?auto_27600 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27598 ?auto_27597 ?auto_27599 )
      ( !LIFT ?auto_27600 ?auto_27595 ?auto_27601 ?auto_27599 )
      ( !LOAD ?auto_27600 ?auto_27595 ?auto_27598 ?auto_27599 )
      ( !DRIVE ?auto_27598 ?auto_27599 ?auto_27597 )
      ( !UNLOAD ?auto_27596 ?auto_27595 ?auto_27598 ?auto_27597 )
      ( !DROP ?auto_27596 ?auto_27595 ?auto_27594 ?auto_27597 )
      ( MAKE-1CRATE-VERIFY ?auto_27594 ?auto_27595 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_27616 - SURFACE
      ?auto_27617 - SURFACE
      ?auto_27618 - SURFACE
      ?auto_27619 - SURFACE
      ?auto_27620 - SURFACE
      ?auto_27623 - SURFACE
      ?auto_27621 - SURFACE
      ?auto_27625 - SURFACE
      ?auto_27624 - SURFACE
      ?auto_27622 - SURFACE
      ?auto_27627 - SURFACE
      ?auto_27626 - SURFACE
      ?auto_27628 - SURFACE
      ?auto_27629 - SURFACE
    )
    :vars
    (
      ?auto_27633 - HOIST
      ?auto_27631 - PLACE
      ?auto_27634 - PLACE
      ?auto_27632 - HOIST
      ?auto_27635 - SURFACE
      ?auto_27642 - PLACE
      ?auto_27643 - HOIST
      ?auto_27654 - SURFACE
      ?auto_27648 - PLACE
      ?auto_27666 - HOIST
      ?auto_27637 - SURFACE
      ?auto_27656 - PLACE
      ?auto_27663 - HOIST
      ?auto_27664 - SURFACE
      ?auto_27649 - PLACE
      ?auto_27647 - HOIST
      ?auto_27638 - SURFACE
      ?auto_27667 - PLACE
      ?auto_27636 - HOIST
      ?auto_27640 - SURFACE
      ?auto_27639 - PLACE
      ?auto_27659 - HOIST
      ?auto_27665 - SURFACE
      ?auto_27652 - PLACE
      ?auto_27657 - HOIST
      ?auto_27653 - SURFACE
      ?auto_27645 - PLACE
      ?auto_27658 - HOIST
      ?auto_27650 - SURFACE
      ?auto_27646 - SURFACE
      ?auto_27662 - PLACE
      ?auto_27651 - HOIST
      ?auto_27660 - SURFACE
      ?auto_27641 - PLACE
      ?auto_27661 - HOIST
      ?auto_27644 - SURFACE
      ?auto_27655 - SURFACE
      ?auto_27630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27633 ?auto_27631 ) ( IS-CRATE ?auto_27629 ) ( not ( = ?auto_27634 ?auto_27631 ) ) ( HOIST-AT ?auto_27632 ?auto_27634 ) ( AVAILABLE ?auto_27632 ) ( SURFACE-AT ?auto_27629 ?auto_27634 ) ( ON ?auto_27629 ?auto_27635 ) ( CLEAR ?auto_27629 ) ( not ( = ?auto_27628 ?auto_27629 ) ) ( not ( = ?auto_27628 ?auto_27635 ) ) ( not ( = ?auto_27629 ?auto_27635 ) ) ( not ( = ?auto_27633 ?auto_27632 ) ) ( IS-CRATE ?auto_27628 ) ( not ( = ?auto_27642 ?auto_27631 ) ) ( HOIST-AT ?auto_27643 ?auto_27642 ) ( AVAILABLE ?auto_27643 ) ( SURFACE-AT ?auto_27628 ?auto_27642 ) ( ON ?auto_27628 ?auto_27654 ) ( CLEAR ?auto_27628 ) ( not ( = ?auto_27626 ?auto_27628 ) ) ( not ( = ?auto_27626 ?auto_27654 ) ) ( not ( = ?auto_27628 ?auto_27654 ) ) ( not ( = ?auto_27633 ?auto_27643 ) ) ( IS-CRATE ?auto_27626 ) ( not ( = ?auto_27648 ?auto_27631 ) ) ( HOIST-AT ?auto_27666 ?auto_27648 ) ( AVAILABLE ?auto_27666 ) ( SURFACE-AT ?auto_27626 ?auto_27648 ) ( ON ?auto_27626 ?auto_27637 ) ( CLEAR ?auto_27626 ) ( not ( = ?auto_27627 ?auto_27626 ) ) ( not ( = ?auto_27627 ?auto_27637 ) ) ( not ( = ?auto_27626 ?auto_27637 ) ) ( not ( = ?auto_27633 ?auto_27666 ) ) ( IS-CRATE ?auto_27627 ) ( not ( = ?auto_27656 ?auto_27631 ) ) ( HOIST-AT ?auto_27663 ?auto_27656 ) ( AVAILABLE ?auto_27663 ) ( SURFACE-AT ?auto_27627 ?auto_27656 ) ( ON ?auto_27627 ?auto_27664 ) ( CLEAR ?auto_27627 ) ( not ( = ?auto_27622 ?auto_27627 ) ) ( not ( = ?auto_27622 ?auto_27664 ) ) ( not ( = ?auto_27627 ?auto_27664 ) ) ( not ( = ?auto_27633 ?auto_27663 ) ) ( IS-CRATE ?auto_27622 ) ( not ( = ?auto_27649 ?auto_27631 ) ) ( HOIST-AT ?auto_27647 ?auto_27649 ) ( SURFACE-AT ?auto_27622 ?auto_27649 ) ( ON ?auto_27622 ?auto_27638 ) ( CLEAR ?auto_27622 ) ( not ( = ?auto_27624 ?auto_27622 ) ) ( not ( = ?auto_27624 ?auto_27638 ) ) ( not ( = ?auto_27622 ?auto_27638 ) ) ( not ( = ?auto_27633 ?auto_27647 ) ) ( IS-CRATE ?auto_27624 ) ( not ( = ?auto_27667 ?auto_27631 ) ) ( HOIST-AT ?auto_27636 ?auto_27667 ) ( AVAILABLE ?auto_27636 ) ( SURFACE-AT ?auto_27624 ?auto_27667 ) ( ON ?auto_27624 ?auto_27640 ) ( CLEAR ?auto_27624 ) ( not ( = ?auto_27625 ?auto_27624 ) ) ( not ( = ?auto_27625 ?auto_27640 ) ) ( not ( = ?auto_27624 ?auto_27640 ) ) ( not ( = ?auto_27633 ?auto_27636 ) ) ( IS-CRATE ?auto_27625 ) ( not ( = ?auto_27639 ?auto_27631 ) ) ( HOIST-AT ?auto_27659 ?auto_27639 ) ( SURFACE-AT ?auto_27625 ?auto_27639 ) ( ON ?auto_27625 ?auto_27665 ) ( CLEAR ?auto_27625 ) ( not ( = ?auto_27621 ?auto_27625 ) ) ( not ( = ?auto_27621 ?auto_27665 ) ) ( not ( = ?auto_27625 ?auto_27665 ) ) ( not ( = ?auto_27633 ?auto_27659 ) ) ( IS-CRATE ?auto_27621 ) ( not ( = ?auto_27652 ?auto_27631 ) ) ( HOIST-AT ?auto_27657 ?auto_27652 ) ( AVAILABLE ?auto_27657 ) ( SURFACE-AT ?auto_27621 ?auto_27652 ) ( ON ?auto_27621 ?auto_27653 ) ( CLEAR ?auto_27621 ) ( not ( = ?auto_27623 ?auto_27621 ) ) ( not ( = ?auto_27623 ?auto_27653 ) ) ( not ( = ?auto_27621 ?auto_27653 ) ) ( not ( = ?auto_27633 ?auto_27657 ) ) ( IS-CRATE ?auto_27623 ) ( not ( = ?auto_27645 ?auto_27631 ) ) ( HOIST-AT ?auto_27658 ?auto_27645 ) ( AVAILABLE ?auto_27658 ) ( SURFACE-AT ?auto_27623 ?auto_27645 ) ( ON ?auto_27623 ?auto_27650 ) ( CLEAR ?auto_27623 ) ( not ( = ?auto_27620 ?auto_27623 ) ) ( not ( = ?auto_27620 ?auto_27650 ) ) ( not ( = ?auto_27623 ?auto_27650 ) ) ( not ( = ?auto_27633 ?auto_27658 ) ) ( IS-CRATE ?auto_27620 ) ( AVAILABLE ?auto_27647 ) ( SURFACE-AT ?auto_27620 ?auto_27649 ) ( ON ?auto_27620 ?auto_27646 ) ( CLEAR ?auto_27620 ) ( not ( = ?auto_27619 ?auto_27620 ) ) ( not ( = ?auto_27619 ?auto_27646 ) ) ( not ( = ?auto_27620 ?auto_27646 ) ) ( IS-CRATE ?auto_27619 ) ( not ( = ?auto_27662 ?auto_27631 ) ) ( HOIST-AT ?auto_27651 ?auto_27662 ) ( AVAILABLE ?auto_27651 ) ( SURFACE-AT ?auto_27619 ?auto_27662 ) ( ON ?auto_27619 ?auto_27660 ) ( CLEAR ?auto_27619 ) ( not ( = ?auto_27618 ?auto_27619 ) ) ( not ( = ?auto_27618 ?auto_27660 ) ) ( not ( = ?auto_27619 ?auto_27660 ) ) ( not ( = ?auto_27633 ?auto_27651 ) ) ( IS-CRATE ?auto_27618 ) ( not ( = ?auto_27641 ?auto_27631 ) ) ( HOIST-AT ?auto_27661 ?auto_27641 ) ( AVAILABLE ?auto_27661 ) ( SURFACE-AT ?auto_27618 ?auto_27641 ) ( ON ?auto_27618 ?auto_27644 ) ( CLEAR ?auto_27618 ) ( not ( = ?auto_27617 ?auto_27618 ) ) ( not ( = ?auto_27617 ?auto_27644 ) ) ( not ( = ?auto_27618 ?auto_27644 ) ) ( not ( = ?auto_27633 ?auto_27661 ) ) ( SURFACE-AT ?auto_27616 ?auto_27631 ) ( CLEAR ?auto_27616 ) ( IS-CRATE ?auto_27617 ) ( AVAILABLE ?auto_27633 ) ( AVAILABLE ?auto_27659 ) ( SURFACE-AT ?auto_27617 ?auto_27639 ) ( ON ?auto_27617 ?auto_27655 ) ( CLEAR ?auto_27617 ) ( TRUCK-AT ?auto_27630 ?auto_27631 ) ( not ( = ?auto_27616 ?auto_27617 ) ) ( not ( = ?auto_27616 ?auto_27655 ) ) ( not ( = ?auto_27617 ?auto_27655 ) ) ( not ( = ?auto_27616 ?auto_27618 ) ) ( not ( = ?auto_27616 ?auto_27644 ) ) ( not ( = ?auto_27618 ?auto_27655 ) ) ( not ( = ?auto_27641 ?auto_27639 ) ) ( not ( = ?auto_27661 ?auto_27659 ) ) ( not ( = ?auto_27644 ?auto_27655 ) ) ( not ( = ?auto_27616 ?auto_27619 ) ) ( not ( = ?auto_27616 ?auto_27660 ) ) ( not ( = ?auto_27617 ?auto_27619 ) ) ( not ( = ?auto_27617 ?auto_27660 ) ) ( not ( = ?auto_27619 ?auto_27644 ) ) ( not ( = ?auto_27619 ?auto_27655 ) ) ( not ( = ?auto_27662 ?auto_27641 ) ) ( not ( = ?auto_27662 ?auto_27639 ) ) ( not ( = ?auto_27651 ?auto_27661 ) ) ( not ( = ?auto_27651 ?auto_27659 ) ) ( not ( = ?auto_27660 ?auto_27644 ) ) ( not ( = ?auto_27660 ?auto_27655 ) ) ( not ( = ?auto_27616 ?auto_27620 ) ) ( not ( = ?auto_27616 ?auto_27646 ) ) ( not ( = ?auto_27617 ?auto_27620 ) ) ( not ( = ?auto_27617 ?auto_27646 ) ) ( not ( = ?auto_27618 ?auto_27620 ) ) ( not ( = ?auto_27618 ?auto_27646 ) ) ( not ( = ?auto_27620 ?auto_27660 ) ) ( not ( = ?auto_27620 ?auto_27644 ) ) ( not ( = ?auto_27620 ?auto_27655 ) ) ( not ( = ?auto_27649 ?auto_27662 ) ) ( not ( = ?auto_27649 ?auto_27641 ) ) ( not ( = ?auto_27649 ?auto_27639 ) ) ( not ( = ?auto_27647 ?auto_27651 ) ) ( not ( = ?auto_27647 ?auto_27661 ) ) ( not ( = ?auto_27647 ?auto_27659 ) ) ( not ( = ?auto_27646 ?auto_27660 ) ) ( not ( = ?auto_27646 ?auto_27644 ) ) ( not ( = ?auto_27646 ?auto_27655 ) ) ( not ( = ?auto_27616 ?auto_27623 ) ) ( not ( = ?auto_27616 ?auto_27650 ) ) ( not ( = ?auto_27617 ?auto_27623 ) ) ( not ( = ?auto_27617 ?auto_27650 ) ) ( not ( = ?auto_27618 ?auto_27623 ) ) ( not ( = ?auto_27618 ?auto_27650 ) ) ( not ( = ?auto_27619 ?auto_27623 ) ) ( not ( = ?auto_27619 ?auto_27650 ) ) ( not ( = ?auto_27623 ?auto_27646 ) ) ( not ( = ?auto_27623 ?auto_27660 ) ) ( not ( = ?auto_27623 ?auto_27644 ) ) ( not ( = ?auto_27623 ?auto_27655 ) ) ( not ( = ?auto_27645 ?auto_27649 ) ) ( not ( = ?auto_27645 ?auto_27662 ) ) ( not ( = ?auto_27645 ?auto_27641 ) ) ( not ( = ?auto_27645 ?auto_27639 ) ) ( not ( = ?auto_27658 ?auto_27647 ) ) ( not ( = ?auto_27658 ?auto_27651 ) ) ( not ( = ?auto_27658 ?auto_27661 ) ) ( not ( = ?auto_27658 ?auto_27659 ) ) ( not ( = ?auto_27650 ?auto_27646 ) ) ( not ( = ?auto_27650 ?auto_27660 ) ) ( not ( = ?auto_27650 ?auto_27644 ) ) ( not ( = ?auto_27650 ?auto_27655 ) ) ( not ( = ?auto_27616 ?auto_27621 ) ) ( not ( = ?auto_27616 ?auto_27653 ) ) ( not ( = ?auto_27617 ?auto_27621 ) ) ( not ( = ?auto_27617 ?auto_27653 ) ) ( not ( = ?auto_27618 ?auto_27621 ) ) ( not ( = ?auto_27618 ?auto_27653 ) ) ( not ( = ?auto_27619 ?auto_27621 ) ) ( not ( = ?auto_27619 ?auto_27653 ) ) ( not ( = ?auto_27620 ?auto_27621 ) ) ( not ( = ?auto_27620 ?auto_27653 ) ) ( not ( = ?auto_27621 ?auto_27650 ) ) ( not ( = ?auto_27621 ?auto_27646 ) ) ( not ( = ?auto_27621 ?auto_27660 ) ) ( not ( = ?auto_27621 ?auto_27644 ) ) ( not ( = ?auto_27621 ?auto_27655 ) ) ( not ( = ?auto_27652 ?auto_27645 ) ) ( not ( = ?auto_27652 ?auto_27649 ) ) ( not ( = ?auto_27652 ?auto_27662 ) ) ( not ( = ?auto_27652 ?auto_27641 ) ) ( not ( = ?auto_27652 ?auto_27639 ) ) ( not ( = ?auto_27657 ?auto_27658 ) ) ( not ( = ?auto_27657 ?auto_27647 ) ) ( not ( = ?auto_27657 ?auto_27651 ) ) ( not ( = ?auto_27657 ?auto_27661 ) ) ( not ( = ?auto_27657 ?auto_27659 ) ) ( not ( = ?auto_27653 ?auto_27650 ) ) ( not ( = ?auto_27653 ?auto_27646 ) ) ( not ( = ?auto_27653 ?auto_27660 ) ) ( not ( = ?auto_27653 ?auto_27644 ) ) ( not ( = ?auto_27653 ?auto_27655 ) ) ( not ( = ?auto_27616 ?auto_27625 ) ) ( not ( = ?auto_27616 ?auto_27665 ) ) ( not ( = ?auto_27617 ?auto_27625 ) ) ( not ( = ?auto_27617 ?auto_27665 ) ) ( not ( = ?auto_27618 ?auto_27625 ) ) ( not ( = ?auto_27618 ?auto_27665 ) ) ( not ( = ?auto_27619 ?auto_27625 ) ) ( not ( = ?auto_27619 ?auto_27665 ) ) ( not ( = ?auto_27620 ?auto_27625 ) ) ( not ( = ?auto_27620 ?auto_27665 ) ) ( not ( = ?auto_27623 ?auto_27625 ) ) ( not ( = ?auto_27623 ?auto_27665 ) ) ( not ( = ?auto_27625 ?auto_27653 ) ) ( not ( = ?auto_27625 ?auto_27650 ) ) ( not ( = ?auto_27625 ?auto_27646 ) ) ( not ( = ?auto_27625 ?auto_27660 ) ) ( not ( = ?auto_27625 ?auto_27644 ) ) ( not ( = ?auto_27625 ?auto_27655 ) ) ( not ( = ?auto_27665 ?auto_27653 ) ) ( not ( = ?auto_27665 ?auto_27650 ) ) ( not ( = ?auto_27665 ?auto_27646 ) ) ( not ( = ?auto_27665 ?auto_27660 ) ) ( not ( = ?auto_27665 ?auto_27644 ) ) ( not ( = ?auto_27665 ?auto_27655 ) ) ( not ( = ?auto_27616 ?auto_27624 ) ) ( not ( = ?auto_27616 ?auto_27640 ) ) ( not ( = ?auto_27617 ?auto_27624 ) ) ( not ( = ?auto_27617 ?auto_27640 ) ) ( not ( = ?auto_27618 ?auto_27624 ) ) ( not ( = ?auto_27618 ?auto_27640 ) ) ( not ( = ?auto_27619 ?auto_27624 ) ) ( not ( = ?auto_27619 ?auto_27640 ) ) ( not ( = ?auto_27620 ?auto_27624 ) ) ( not ( = ?auto_27620 ?auto_27640 ) ) ( not ( = ?auto_27623 ?auto_27624 ) ) ( not ( = ?auto_27623 ?auto_27640 ) ) ( not ( = ?auto_27621 ?auto_27624 ) ) ( not ( = ?auto_27621 ?auto_27640 ) ) ( not ( = ?auto_27624 ?auto_27665 ) ) ( not ( = ?auto_27624 ?auto_27653 ) ) ( not ( = ?auto_27624 ?auto_27650 ) ) ( not ( = ?auto_27624 ?auto_27646 ) ) ( not ( = ?auto_27624 ?auto_27660 ) ) ( not ( = ?auto_27624 ?auto_27644 ) ) ( not ( = ?auto_27624 ?auto_27655 ) ) ( not ( = ?auto_27667 ?auto_27639 ) ) ( not ( = ?auto_27667 ?auto_27652 ) ) ( not ( = ?auto_27667 ?auto_27645 ) ) ( not ( = ?auto_27667 ?auto_27649 ) ) ( not ( = ?auto_27667 ?auto_27662 ) ) ( not ( = ?auto_27667 ?auto_27641 ) ) ( not ( = ?auto_27636 ?auto_27659 ) ) ( not ( = ?auto_27636 ?auto_27657 ) ) ( not ( = ?auto_27636 ?auto_27658 ) ) ( not ( = ?auto_27636 ?auto_27647 ) ) ( not ( = ?auto_27636 ?auto_27651 ) ) ( not ( = ?auto_27636 ?auto_27661 ) ) ( not ( = ?auto_27640 ?auto_27665 ) ) ( not ( = ?auto_27640 ?auto_27653 ) ) ( not ( = ?auto_27640 ?auto_27650 ) ) ( not ( = ?auto_27640 ?auto_27646 ) ) ( not ( = ?auto_27640 ?auto_27660 ) ) ( not ( = ?auto_27640 ?auto_27644 ) ) ( not ( = ?auto_27640 ?auto_27655 ) ) ( not ( = ?auto_27616 ?auto_27622 ) ) ( not ( = ?auto_27616 ?auto_27638 ) ) ( not ( = ?auto_27617 ?auto_27622 ) ) ( not ( = ?auto_27617 ?auto_27638 ) ) ( not ( = ?auto_27618 ?auto_27622 ) ) ( not ( = ?auto_27618 ?auto_27638 ) ) ( not ( = ?auto_27619 ?auto_27622 ) ) ( not ( = ?auto_27619 ?auto_27638 ) ) ( not ( = ?auto_27620 ?auto_27622 ) ) ( not ( = ?auto_27620 ?auto_27638 ) ) ( not ( = ?auto_27623 ?auto_27622 ) ) ( not ( = ?auto_27623 ?auto_27638 ) ) ( not ( = ?auto_27621 ?auto_27622 ) ) ( not ( = ?auto_27621 ?auto_27638 ) ) ( not ( = ?auto_27625 ?auto_27622 ) ) ( not ( = ?auto_27625 ?auto_27638 ) ) ( not ( = ?auto_27622 ?auto_27640 ) ) ( not ( = ?auto_27622 ?auto_27665 ) ) ( not ( = ?auto_27622 ?auto_27653 ) ) ( not ( = ?auto_27622 ?auto_27650 ) ) ( not ( = ?auto_27622 ?auto_27646 ) ) ( not ( = ?auto_27622 ?auto_27660 ) ) ( not ( = ?auto_27622 ?auto_27644 ) ) ( not ( = ?auto_27622 ?auto_27655 ) ) ( not ( = ?auto_27638 ?auto_27640 ) ) ( not ( = ?auto_27638 ?auto_27665 ) ) ( not ( = ?auto_27638 ?auto_27653 ) ) ( not ( = ?auto_27638 ?auto_27650 ) ) ( not ( = ?auto_27638 ?auto_27646 ) ) ( not ( = ?auto_27638 ?auto_27660 ) ) ( not ( = ?auto_27638 ?auto_27644 ) ) ( not ( = ?auto_27638 ?auto_27655 ) ) ( not ( = ?auto_27616 ?auto_27627 ) ) ( not ( = ?auto_27616 ?auto_27664 ) ) ( not ( = ?auto_27617 ?auto_27627 ) ) ( not ( = ?auto_27617 ?auto_27664 ) ) ( not ( = ?auto_27618 ?auto_27627 ) ) ( not ( = ?auto_27618 ?auto_27664 ) ) ( not ( = ?auto_27619 ?auto_27627 ) ) ( not ( = ?auto_27619 ?auto_27664 ) ) ( not ( = ?auto_27620 ?auto_27627 ) ) ( not ( = ?auto_27620 ?auto_27664 ) ) ( not ( = ?auto_27623 ?auto_27627 ) ) ( not ( = ?auto_27623 ?auto_27664 ) ) ( not ( = ?auto_27621 ?auto_27627 ) ) ( not ( = ?auto_27621 ?auto_27664 ) ) ( not ( = ?auto_27625 ?auto_27627 ) ) ( not ( = ?auto_27625 ?auto_27664 ) ) ( not ( = ?auto_27624 ?auto_27627 ) ) ( not ( = ?auto_27624 ?auto_27664 ) ) ( not ( = ?auto_27627 ?auto_27638 ) ) ( not ( = ?auto_27627 ?auto_27640 ) ) ( not ( = ?auto_27627 ?auto_27665 ) ) ( not ( = ?auto_27627 ?auto_27653 ) ) ( not ( = ?auto_27627 ?auto_27650 ) ) ( not ( = ?auto_27627 ?auto_27646 ) ) ( not ( = ?auto_27627 ?auto_27660 ) ) ( not ( = ?auto_27627 ?auto_27644 ) ) ( not ( = ?auto_27627 ?auto_27655 ) ) ( not ( = ?auto_27656 ?auto_27649 ) ) ( not ( = ?auto_27656 ?auto_27667 ) ) ( not ( = ?auto_27656 ?auto_27639 ) ) ( not ( = ?auto_27656 ?auto_27652 ) ) ( not ( = ?auto_27656 ?auto_27645 ) ) ( not ( = ?auto_27656 ?auto_27662 ) ) ( not ( = ?auto_27656 ?auto_27641 ) ) ( not ( = ?auto_27663 ?auto_27647 ) ) ( not ( = ?auto_27663 ?auto_27636 ) ) ( not ( = ?auto_27663 ?auto_27659 ) ) ( not ( = ?auto_27663 ?auto_27657 ) ) ( not ( = ?auto_27663 ?auto_27658 ) ) ( not ( = ?auto_27663 ?auto_27651 ) ) ( not ( = ?auto_27663 ?auto_27661 ) ) ( not ( = ?auto_27664 ?auto_27638 ) ) ( not ( = ?auto_27664 ?auto_27640 ) ) ( not ( = ?auto_27664 ?auto_27665 ) ) ( not ( = ?auto_27664 ?auto_27653 ) ) ( not ( = ?auto_27664 ?auto_27650 ) ) ( not ( = ?auto_27664 ?auto_27646 ) ) ( not ( = ?auto_27664 ?auto_27660 ) ) ( not ( = ?auto_27664 ?auto_27644 ) ) ( not ( = ?auto_27664 ?auto_27655 ) ) ( not ( = ?auto_27616 ?auto_27626 ) ) ( not ( = ?auto_27616 ?auto_27637 ) ) ( not ( = ?auto_27617 ?auto_27626 ) ) ( not ( = ?auto_27617 ?auto_27637 ) ) ( not ( = ?auto_27618 ?auto_27626 ) ) ( not ( = ?auto_27618 ?auto_27637 ) ) ( not ( = ?auto_27619 ?auto_27626 ) ) ( not ( = ?auto_27619 ?auto_27637 ) ) ( not ( = ?auto_27620 ?auto_27626 ) ) ( not ( = ?auto_27620 ?auto_27637 ) ) ( not ( = ?auto_27623 ?auto_27626 ) ) ( not ( = ?auto_27623 ?auto_27637 ) ) ( not ( = ?auto_27621 ?auto_27626 ) ) ( not ( = ?auto_27621 ?auto_27637 ) ) ( not ( = ?auto_27625 ?auto_27626 ) ) ( not ( = ?auto_27625 ?auto_27637 ) ) ( not ( = ?auto_27624 ?auto_27626 ) ) ( not ( = ?auto_27624 ?auto_27637 ) ) ( not ( = ?auto_27622 ?auto_27626 ) ) ( not ( = ?auto_27622 ?auto_27637 ) ) ( not ( = ?auto_27626 ?auto_27664 ) ) ( not ( = ?auto_27626 ?auto_27638 ) ) ( not ( = ?auto_27626 ?auto_27640 ) ) ( not ( = ?auto_27626 ?auto_27665 ) ) ( not ( = ?auto_27626 ?auto_27653 ) ) ( not ( = ?auto_27626 ?auto_27650 ) ) ( not ( = ?auto_27626 ?auto_27646 ) ) ( not ( = ?auto_27626 ?auto_27660 ) ) ( not ( = ?auto_27626 ?auto_27644 ) ) ( not ( = ?auto_27626 ?auto_27655 ) ) ( not ( = ?auto_27648 ?auto_27656 ) ) ( not ( = ?auto_27648 ?auto_27649 ) ) ( not ( = ?auto_27648 ?auto_27667 ) ) ( not ( = ?auto_27648 ?auto_27639 ) ) ( not ( = ?auto_27648 ?auto_27652 ) ) ( not ( = ?auto_27648 ?auto_27645 ) ) ( not ( = ?auto_27648 ?auto_27662 ) ) ( not ( = ?auto_27648 ?auto_27641 ) ) ( not ( = ?auto_27666 ?auto_27663 ) ) ( not ( = ?auto_27666 ?auto_27647 ) ) ( not ( = ?auto_27666 ?auto_27636 ) ) ( not ( = ?auto_27666 ?auto_27659 ) ) ( not ( = ?auto_27666 ?auto_27657 ) ) ( not ( = ?auto_27666 ?auto_27658 ) ) ( not ( = ?auto_27666 ?auto_27651 ) ) ( not ( = ?auto_27666 ?auto_27661 ) ) ( not ( = ?auto_27637 ?auto_27664 ) ) ( not ( = ?auto_27637 ?auto_27638 ) ) ( not ( = ?auto_27637 ?auto_27640 ) ) ( not ( = ?auto_27637 ?auto_27665 ) ) ( not ( = ?auto_27637 ?auto_27653 ) ) ( not ( = ?auto_27637 ?auto_27650 ) ) ( not ( = ?auto_27637 ?auto_27646 ) ) ( not ( = ?auto_27637 ?auto_27660 ) ) ( not ( = ?auto_27637 ?auto_27644 ) ) ( not ( = ?auto_27637 ?auto_27655 ) ) ( not ( = ?auto_27616 ?auto_27628 ) ) ( not ( = ?auto_27616 ?auto_27654 ) ) ( not ( = ?auto_27617 ?auto_27628 ) ) ( not ( = ?auto_27617 ?auto_27654 ) ) ( not ( = ?auto_27618 ?auto_27628 ) ) ( not ( = ?auto_27618 ?auto_27654 ) ) ( not ( = ?auto_27619 ?auto_27628 ) ) ( not ( = ?auto_27619 ?auto_27654 ) ) ( not ( = ?auto_27620 ?auto_27628 ) ) ( not ( = ?auto_27620 ?auto_27654 ) ) ( not ( = ?auto_27623 ?auto_27628 ) ) ( not ( = ?auto_27623 ?auto_27654 ) ) ( not ( = ?auto_27621 ?auto_27628 ) ) ( not ( = ?auto_27621 ?auto_27654 ) ) ( not ( = ?auto_27625 ?auto_27628 ) ) ( not ( = ?auto_27625 ?auto_27654 ) ) ( not ( = ?auto_27624 ?auto_27628 ) ) ( not ( = ?auto_27624 ?auto_27654 ) ) ( not ( = ?auto_27622 ?auto_27628 ) ) ( not ( = ?auto_27622 ?auto_27654 ) ) ( not ( = ?auto_27627 ?auto_27628 ) ) ( not ( = ?auto_27627 ?auto_27654 ) ) ( not ( = ?auto_27628 ?auto_27637 ) ) ( not ( = ?auto_27628 ?auto_27664 ) ) ( not ( = ?auto_27628 ?auto_27638 ) ) ( not ( = ?auto_27628 ?auto_27640 ) ) ( not ( = ?auto_27628 ?auto_27665 ) ) ( not ( = ?auto_27628 ?auto_27653 ) ) ( not ( = ?auto_27628 ?auto_27650 ) ) ( not ( = ?auto_27628 ?auto_27646 ) ) ( not ( = ?auto_27628 ?auto_27660 ) ) ( not ( = ?auto_27628 ?auto_27644 ) ) ( not ( = ?auto_27628 ?auto_27655 ) ) ( not ( = ?auto_27642 ?auto_27648 ) ) ( not ( = ?auto_27642 ?auto_27656 ) ) ( not ( = ?auto_27642 ?auto_27649 ) ) ( not ( = ?auto_27642 ?auto_27667 ) ) ( not ( = ?auto_27642 ?auto_27639 ) ) ( not ( = ?auto_27642 ?auto_27652 ) ) ( not ( = ?auto_27642 ?auto_27645 ) ) ( not ( = ?auto_27642 ?auto_27662 ) ) ( not ( = ?auto_27642 ?auto_27641 ) ) ( not ( = ?auto_27643 ?auto_27666 ) ) ( not ( = ?auto_27643 ?auto_27663 ) ) ( not ( = ?auto_27643 ?auto_27647 ) ) ( not ( = ?auto_27643 ?auto_27636 ) ) ( not ( = ?auto_27643 ?auto_27659 ) ) ( not ( = ?auto_27643 ?auto_27657 ) ) ( not ( = ?auto_27643 ?auto_27658 ) ) ( not ( = ?auto_27643 ?auto_27651 ) ) ( not ( = ?auto_27643 ?auto_27661 ) ) ( not ( = ?auto_27654 ?auto_27637 ) ) ( not ( = ?auto_27654 ?auto_27664 ) ) ( not ( = ?auto_27654 ?auto_27638 ) ) ( not ( = ?auto_27654 ?auto_27640 ) ) ( not ( = ?auto_27654 ?auto_27665 ) ) ( not ( = ?auto_27654 ?auto_27653 ) ) ( not ( = ?auto_27654 ?auto_27650 ) ) ( not ( = ?auto_27654 ?auto_27646 ) ) ( not ( = ?auto_27654 ?auto_27660 ) ) ( not ( = ?auto_27654 ?auto_27644 ) ) ( not ( = ?auto_27654 ?auto_27655 ) ) ( not ( = ?auto_27616 ?auto_27629 ) ) ( not ( = ?auto_27616 ?auto_27635 ) ) ( not ( = ?auto_27617 ?auto_27629 ) ) ( not ( = ?auto_27617 ?auto_27635 ) ) ( not ( = ?auto_27618 ?auto_27629 ) ) ( not ( = ?auto_27618 ?auto_27635 ) ) ( not ( = ?auto_27619 ?auto_27629 ) ) ( not ( = ?auto_27619 ?auto_27635 ) ) ( not ( = ?auto_27620 ?auto_27629 ) ) ( not ( = ?auto_27620 ?auto_27635 ) ) ( not ( = ?auto_27623 ?auto_27629 ) ) ( not ( = ?auto_27623 ?auto_27635 ) ) ( not ( = ?auto_27621 ?auto_27629 ) ) ( not ( = ?auto_27621 ?auto_27635 ) ) ( not ( = ?auto_27625 ?auto_27629 ) ) ( not ( = ?auto_27625 ?auto_27635 ) ) ( not ( = ?auto_27624 ?auto_27629 ) ) ( not ( = ?auto_27624 ?auto_27635 ) ) ( not ( = ?auto_27622 ?auto_27629 ) ) ( not ( = ?auto_27622 ?auto_27635 ) ) ( not ( = ?auto_27627 ?auto_27629 ) ) ( not ( = ?auto_27627 ?auto_27635 ) ) ( not ( = ?auto_27626 ?auto_27629 ) ) ( not ( = ?auto_27626 ?auto_27635 ) ) ( not ( = ?auto_27629 ?auto_27654 ) ) ( not ( = ?auto_27629 ?auto_27637 ) ) ( not ( = ?auto_27629 ?auto_27664 ) ) ( not ( = ?auto_27629 ?auto_27638 ) ) ( not ( = ?auto_27629 ?auto_27640 ) ) ( not ( = ?auto_27629 ?auto_27665 ) ) ( not ( = ?auto_27629 ?auto_27653 ) ) ( not ( = ?auto_27629 ?auto_27650 ) ) ( not ( = ?auto_27629 ?auto_27646 ) ) ( not ( = ?auto_27629 ?auto_27660 ) ) ( not ( = ?auto_27629 ?auto_27644 ) ) ( not ( = ?auto_27629 ?auto_27655 ) ) ( not ( = ?auto_27634 ?auto_27642 ) ) ( not ( = ?auto_27634 ?auto_27648 ) ) ( not ( = ?auto_27634 ?auto_27656 ) ) ( not ( = ?auto_27634 ?auto_27649 ) ) ( not ( = ?auto_27634 ?auto_27667 ) ) ( not ( = ?auto_27634 ?auto_27639 ) ) ( not ( = ?auto_27634 ?auto_27652 ) ) ( not ( = ?auto_27634 ?auto_27645 ) ) ( not ( = ?auto_27634 ?auto_27662 ) ) ( not ( = ?auto_27634 ?auto_27641 ) ) ( not ( = ?auto_27632 ?auto_27643 ) ) ( not ( = ?auto_27632 ?auto_27666 ) ) ( not ( = ?auto_27632 ?auto_27663 ) ) ( not ( = ?auto_27632 ?auto_27647 ) ) ( not ( = ?auto_27632 ?auto_27636 ) ) ( not ( = ?auto_27632 ?auto_27659 ) ) ( not ( = ?auto_27632 ?auto_27657 ) ) ( not ( = ?auto_27632 ?auto_27658 ) ) ( not ( = ?auto_27632 ?auto_27651 ) ) ( not ( = ?auto_27632 ?auto_27661 ) ) ( not ( = ?auto_27635 ?auto_27654 ) ) ( not ( = ?auto_27635 ?auto_27637 ) ) ( not ( = ?auto_27635 ?auto_27664 ) ) ( not ( = ?auto_27635 ?auto_27638 ) ) ( not ( = ?auto_27635 ?auto_27640 ) ) ( not ( = ?auto_27635 ?auto_27665 ) ) ( not ( = ?auto_27635 ?auto_27653 ) ) ( not ( = ?auto_27635 ?auto_27650 ) ) ( not ( = ?auto_27635 ?auto_27646 ) ) ( not ( = ?auto_27635 ?auto_27660 ) ) ( not ( = ?auto_27635 ?auto_27644 ) ) ( not ( = ?auto_27635 ?auto_27655 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_27616 ?auto_27617 ?auto_27618 ?auto_27619 ?auto_27620 ?auto_27623 ?auto_27621 ?auto_27625 ?auto_27624 ?auto_27622 ?auto_27627 ?auto_27626 ?auto_27628 )
      ( MAKE-1CRATE ?auto_27628 ?auto_27629 )
      ( MAKE-13CRATE-VERIFY ?auto_27616 ?auto_27617 ?auto_27618 ?auto_27619 ?auto_27620 ?auto_27623 ?auto_27621 ?auto_27625 ?auto_27624 ?auto_27622 ?auto_27627 ?auto_27626 ?auto_27628 ?auto_27629 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27670 - SURFACE
      ?auto_27671 - SURFACE
    )
    :vars
    (
      ?auto_27672 - HOIST
      ?auto_27673 - PLACE
      ?auto_27675 - PLACE
      ?auto_27676 - HOIST
      ?auto_27677 - SURFACE
      ?auto_27674 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27672 ?auto_27673 ) ( SURFACE-AT ?auto_27670 ?auto_27673 ) ( CLEAR ?auto_27670 ) ( IS-CRATE ?auto_27671 ) ( AVAILABLE ?auto_27672 ) ( not ( = ?auto_27675 ?auto_27673 ) ) ( HOIST-AT ?auto_27676 ?auto_27675 ) ( AVAILABLE ?auto_27676 ) ( SURFACE-AT ?auto_27671 ?auto_27675 ) ( ON ?auto_27671 ?auto_27677 ) ( CLEAR ?auto_27671 ) ( TRUCK-AT ?auto_27674 ?auto_27673 ) ( not ( = ?auto_27670 ?auto_27671 ) ) ( not ( = ?auto_27670 ?auto_27677 ) ) ( not ( = ?auto_27671 ?auto_27677 ) ) ( not ( = ?auto_27672 ?auto_27676 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27674 ?auto_27673 ?auto_27675 )
      ( !LIFT ?auto_27676 ?auto_27671 ?auto_27677 ?auto_27675 )
      ( !LOAD ?auto_27676 ?auto_27671 ?auto_27674 ?auto_27675 )
      ( !DRIVE ?auto_27674 ?auto_27675 ?auto_27673 )
      ( !UNLOAD ?auto_27672 ?auto_27671 ?auto_27674 ?auto_27673 )
      ( !DROP ?auto_27672 ?auto_27671 ?auto_27670 ?auto_27673 )
      ( MAKE-1CRATE-VERIFY ?auto_27670 ?auto_27671 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_27693 - SURFACE
      ?auto_27694 - SURFACE
      ?auto_27695 - SURFACE
      ?auto_27696 - SURFACE
      ?auto_27697 - SURFACE
      ?auto_27700 - SURFACE
      ?auto_27698 - SURFACE
      ?auto_27702 - SURFACE
      ?auto_27701 - SURFACE
      ?auto_27699 - SURFACE
      ?auto_27704 - SURFACE
      ?auto_27703 - SURFACE
      ?auto_27705 - SURFACE
      ?auto_27706 - SURFACE
      ?auto_27707 - SURFACE
    )
    :vars
    (
      ?auto_27709 - HOIST
      ?auto_27712 - PLACE
      ?auto_27710 - PLACE
      ?auto_27708 - HOIST
      ?auto_27713 - SURFACE
      ?auto_27720 - PLACE
      ?auto_27740 - HOIST
      ?auto_27715 - SURFACE
      ?auto_27725 - PLACE
      ?auto_27714 - HOIST
      ?auto_27730 - SURFACE
      ?auto_27744 - SURFACE
      ?auto_27732 - PLACE
      ?auto_27724 - HOIST
      ?auto_27738 - SURFACE
      ?auto_27735 - PLACE
      ?auto_27736 - HOIST
      ?auto_27739 - SURFACE
      ?auto_27743 - PLACE
      ?auto_27742 - HOIST
      ?auto_27745 - SURFACE
      ?auto_27746 - PLACE
      ?auto_27727 - HOIST
      ?auto_27733 - SURFACE
      ?auto_27722 - PLACE
      ?auto_27726 - HOIST
      ?auto_27728 - SURFACE
      ?auto_27721 - PLACE
      ?auto_27719 - HOIST
      ?auto_27741 - SURFACE
      ?auto_27717 - SURFACE
      ?auto_27737 - PLACE
      ?auto_27723 - HOIST
      ?auto_27731 - SURFACE
      ?auto_27718 - PLACE
      ?auto_27716 - HOIST
      ?auto_27734 - SURFACE
      ?auto_27729 - SURFACE
      ?auto_27711 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27709 ?auto_27712 ) ( IS-CRATE ?auto_27707 ) ( not ( = ?auto_27710 ?auto_27712 ) ) ( HOIST-AT ?auto_27708 ?auto_27710 ) ( SURFACE-AT ?auto_27707 ?auto_27710 ) ( ON ?auto_27707 ?auto_27713 ) ( CLEAR ?auto_27707 ) ( not ( = ?auto_27706 ?auto_27707 ) ) ( not ( = ?auto_27706 ?auto_27713 ) ) ( not ( = ?auto_27707 ?auto_27713 ) ) ( not ( = ?auto_27709 ?auto_27708 ) ) ( IS-CRATE ?auto_27706 ) ( not ( = ?auto_27720 ?auto_27712 ) ) ( HOIST-AT ?auto_27740 ?auto_27720 ) ( AVAILABLE ?auto_27740 ) ( SURFACE-AT ?auto_27706 ?auto_27720 ) ( ON ?auto_27706 ?auto_27715 ) ( CLEAR ?auto_27706 ) ( not ( = ?auto_27705 ?auto_27706 ) ) ( not ( = ?auto_27705 ?auto_27715 ) ) ( not ( = ?auto_27706 ?auto_27715 ) ) ( not ( = ?auto_27709 ?auto_27740 ) ) ( IS-CRATE ?auto_27705 ) ( not ( = ?auto_27725 ?auto_27712 ) ) ( HOIST-AT ?auto_27714 ?auto_27725 ) ( AVAILABLE ?auto_27714 ) ( SURFACE-AT ?auto_27705 ?auto_27725 ) ( ON ?auto_27705 ?auto_27730 ) ( CLEAR ?auto_27705 ) ( not ( = ?auto_27703 ?auto_27705 ) ) ( not ( = ?auto_27703 ?auto_27730 ) ) ( not ( = ?auto_27705 ?auto_27730 ) ) ( not ( = ?auto_27709 ?auto_27714 ) ) ( IS-CRATE ?auto_27703 ) ( AVAILABLE ?auto_27708 ) ( SURFACE-AT ?auto_27703 ?auto_27710 ) ( ON ?auto_27703 ?auto_27744 ) ( CLEAR ?auto_27703 ) ( not ( = ?auto_27704 ?auto_27703 ) ) ( not ( = ?auto_27704 ?auto_27744 ) ) ( not ( = ?auto_27703 ?auto_27744 ) ) ( IS-CRATE ?auto_27704 ) ( not ( = ?auto_27732 ?auto_27712 ) ) ( HOIST-AT ?auto_27724 ?auto_27732 ) ( AVAILABLE ?auto_27724 ) ( SURFACE-AT ?auto_27704 ?auto_27732 ) ( ON ?auto_27704 ?auto_27738 ) ( CLEAR ?auto_27704 ) ( not ( = ?auto_27699 ?auto_27704 ) ) ( not ( = ?auto_27699 ?auto_27738 ) ) ( not ( = ?auto_27704 ?auto_27738 ) ) ( not ( = ?auto_27709 ?auto_27724 ) ) ( IS-CRATE ?auto_27699 ) ( not ( = ?auto_27735 ?auto_27712 ) ) ( HOIST-AT ?auto_27736 ?auto_27735 ) ( SURFACE-AT ?auto_27699 ?auto_27735 ) ( ON ?auto_27699 ?auto_27739 ) ( CLEAR ?auto_27699 ) ( not ( = ?auto_27701 ?auto_27699 ) ) ( not ( = ?auto_27701 ?auto_27739 ) ) ( not ( = ?auto_27699 ?auto_27739 ) ) ( not ( = ?auto_27709 ?auto_27736 ) ) ( IS-CRATE ?auto_27701 ) ( not ( = ?auto_27743 ?auto_27712 ) ) ( HOIST-AT ?auto_27742 ?auto_27743 ) ( AVAILABLE ?auto_27742 ) ( SURFACE-AT ?auto_27701 ?auto_27743 ) ( ON ?auto_27701 ?auto_27745 ) ( CLEAR ?auto_27701 ) ( not ( = ?auto_27702 ?auto_27701 ) ) ( not ( = ?auto_27702 ?auto_27745 ) ) ( not ( = ?auto_27701 ?auto_27745 ) ) ( not ( = ?auto_27709 ?auto_27742 ) ) ( IS-CRATE ?auto_27702 ) ( not ( = ?auto_27746 ?auto_27712 ) ) ( HOIST-AT ?auto_27727 ?auto_27746 ) ( SURFACE-AT ?auto_27702 ?auto_27746 ) ( ON ?auto_27702 ?auto_27733 ) ( CLEAR ?auto_27702 ) ( not ( = ?auto_27698 ?auto_27702 ) ) ( not ( = ?auto_27698 ?auto_27733 ) ) ( not ( = ?auto_27702 ?auto_27733 ) ) ( not ( = ?auto_27709 ?auto_27727 ) ) ( IS-CRATE ?auto_27698 ) ( not ( = ?auto_27722 ?auto_27712 ) ) ( HOIST-AT ?auto_27726 ?auto_27722 ) ( AVAILABLE ?auto_27726 ) ( SURFACE-AT ?auto_27698 ?auto_27722 ) ( ON ?auto_27698 ?auto_27728 ) ( CLEAR ?auto_27698 ) ( not ( = ?auto_27700 ?auto_27698 ) ) ( not ( = ?auto_27700 ?auto_27728 ) ) ( not ( = ?auto_27698 ?auto_27728 ) ) ( not ( = ?auto_27709 ?auto_27726 ) ) ( IS-CRATE ?auto_27700 ) ( not ( = ?auto_27721 ?auto_27712 ) ) ( HOIST-AT ?auto_27719 ?auto_27721 ) ( AVAILABLE ?auto_27719 ) ( SURFACE-AT ?auto_27700 ?auto_27721 ) ( ON ?auto_27700 ?auto_27741 ) ( CLEAR ?auto_27700 ) ( not ( = ?auto_27697 ?auto_27700 ) ) ( not ( = ?auto_27697 ?auto_27741 ) ) ( not ( = ?auto_27700 ?auto_27741 ) ) ( not ( = ?auto_27709 ?auto_27719 ) ) ( IS-CRATE ?auto_27697 ) ( AVAILABLE ?auto_27736 ) ( SURFACE-AT ?auto_27697 ?auto_27735 ) ( ON ?auto_27697 ?auto_27717 ) ( CLEAR ?auto_27697 ) ( not ( = ?auto_27696 ?auto_27697 ) ) ( not ( = ?auto_27696 ?auto_27717 ) ) ( not ( = ?auto_27697 ?auto_27717 ) ) ( IS-CRATE ?auto_27696 ) ( not ( = ?auto_27737 ?auto_27712 ) ) ( HOIST-AT ?auto_27723 ?auto_27737 ) ( AVAILABLE ?auto_27723 ) ( SURFACE-AT ?auto_27696 ?auto_27737 ) ( ON ?auto_27696 ?auto_27731 ) ( CLEAR ?auto_27696 ) ( not ( = ?auto_27695 ?auto_27696 ) ) ( not ( = ?auto_27695 ?auto_27731 ) ) ( not ( = ?auto_27696 ?auto_27731 ) ) ( not ( = ?auto_27709 ?auto_27723 ) ) ( IS-CRATE ?auto_27695 ) ( not ( = ?auto_27718 ?auto_27712 ) ) ( HOIST-AT ?auto_27716 ?auto_27718 ) ( AVAILABLE ?auto_27716 ) ( SURFACE-AT ?auto_27695 ?auto_27718 ) ( ON ?auto_27695 ?auto_27734 ) ( CLEAR ?auto_27695 ) ( not ( = ?auto_27694 ?auto_27695 ) ) ( not ( = ?auto_27694 ?auto_27734 ) ) ( not ( = ?auto_27695 ?auto_27734 ) ) ( not ( = ?auto_27709 ?auto_27716 ) ) ( SURFACE-AT ?auto_27693 ?auto_27712 ) ( CLEAR ?auto_27693 ) ( IS-CRATE ?auto_27694 ) ( AVAILABLE ?auto_27709 ) ( AVAILABLE ?auto_27727 ) ( SURFACE-AT ?auto_27694 ?auto_27746 ) ( ON ?auto_27694 ?auto_27729 ) ( CLEAR ?auto_27694 ) ( TRUCK-AT ?auto_27711 ?auto_27712 ) ( not ( = ?auto_27693 ?auto_27694 ) ) ( not ( = ?auto_27693 ?auto_27729 ) ) ( not ( = ?auto_27694 ?auto_27729 ) ) ( not ( = ?auto_27693 ?auto_27695 ) ) ( not ( = ?auto_27693 ?auto_27734 ) ) ( not ( = ?auto_27695 ?auto_27729 ) ) ( not ( = ?auto_27718 ?auto_27746 ) ) ( not ( = ?auto_27716 ?auto_27727 ) ) ( not ( = ?auto_27734 ?auto_27729 ) ) ( not ( = ?auto_27693 ?auto_27696 ) ) ( not ( = ?auto_27693 ?auto_27731 ) ) ( not ( = ?auto_27694 ?auto_27696 ) ) ( not ( = ?auto_27694 ?auto_27731 ) ) ( not ( = ?auto_27696 ?auto_27734 ) ) ( not ( = ?auto_27696 ?auto_27729 ) ) ( not ( = ?auto_27737 ?auto_27718 ) ) ( not ( = ?auto_27737 ?auto_27746 ) ) ( not ( = ?auto_27723 ?auto_27716 ) ) ( not ( = ?auto_27723 ?auto_27727 ) ) ( not ( = ?auto_27731 ?auto_27734 ) ) ( not ( = ?auto_27731 ?auto_27729 ) ) ( not ( = ?auto_27693 ?auto_27697 ) ) ( not ( = ?auto_27693 ?auto_27717 ) ) ( not ( = ?auto_27694 ?auto_27697 ) ) ( not ( = ?auto_27694 ?auto_27717 ) ) ( not ( = ?auto_27695 ?auto_27697 ) ) ( not ( = ?auto_27695 ?auto_27717 ) ) ( not ( = ?auto_27697 ?auto_27731 ) ) ( not ( = ?auto_27697 ?auto_27734 ) ) ( not ( = ?auto_27697 ?auto_27729 ) ) ( not ( = ?auto_27735 ?auto_27737 ) ) ( not ( = ?auto_27735 ?auto_27718 ) ) ( not ( = ?auto_27735 ?auto_27746 ) ) ( not ( = ?auto_27736 ?auto_27723 ) ) ( not ( = ?auto_27736 ?auto_27716 ) ) ( not ( = ?auto_27736 ?auto_27727 ) ) ( not ( = ?auto_27717 ?auto_27731 ) ) ( not ( = ?auto_27717 ?auto_27734 ) ) ( not ( = ?auto_27717 ?auto_27729 ) ) ( not ( = ?auto_27693 ?auto_27700 ) ) ( not ( = ?auto_27693 ?auto_27741 ) ) ( not ( = ?auto_27694 ?auto_27700 ) ) ( not ( = ?auto_27694 ?auto_27741 ) ) ( not ( = ?auto_27695 ?auto_27700 ) ) ( not ( = ?auto_27695 ?auto_27741 ) ) ( not ( = ?auto_27696 ?auto_27700 ) ) ( not ( = ?auto_27696 ?auto_27741 ) ) ( not ( = ?auto_27700 ?auto_27717 ) ) ( not ( = ?auto_27700 ?auto_27731 ) ) ( not ( = ?auto_27700 ?auto_27734 ) ) ( not ( = ?auto_27700 ?auto_27729 ) ) ( not ( = ?auto_27721 ?auto_27735 ) ) ( not ( = ?auto_27721 ?auto_27737 ) ) ( not ( = ?auto_27721 ?auto_27718 ) ) ( not ( = ?auto_27721 ?auto_27746 ) ) ( not ( = ?auto_27719 ?auto_27736 ) ) ( not ( = ?auto_27719 ?auto_27723 ) ) ( not ( = ?auto_27719 ?auto_27716 ) ) ( not ( = ?auto_27719 ?auto_27727 ) ) ( not ( = ?auto_27741 ?auto_27717 ) ) ( not ( = ?auto_27741 ?auto_27731 ) ) ( not ( = ?auto_27741 ?auto_27734 ) ) ( not ( = ?auto_27741 ?auto_27729 ) ) ( not ( = ?auto_27693 ?auto_27698 ) ) ( not ( = ?auto_27693 ?auto_27728 ) ) ( not ( = ?auto_27694 ?auto_27698 ) ) ( not ( = ?auto_27694 ?auto_27728 ) ) ( not ( = ?auto_27695 ?auto_27698 ) ) ( not ( = ?auto_27695 ?auto_27728 ) ) ( not ( = ?auto_27696 ?auto_27698 ) ) ( not ( = ?auto_27696 ?auto_27728 ) ) ( not ( = ?auto_27697 ?auto_27698 ) ) ( not ( = ?auto_27697 ?auto_27728 ) ) ( not ( = ?auto_27698 ?auto_27741 ) ) ( not ( = ?auto_27698 ?auto_27717 ) ) ( not ( = ?auto_27698 ?auto_27731 ) ) ( not ( = ?auto_27698 ?auto_27734 ) ) ( not ( = ?auto_27698 ?auto_27729 ) ) ( not ( = ?auto_27722 ?auto_27721 ) ) ( not ( = ?auto_27722 ?auto_27735 ) ) ( not ( = ?auto_27722 ?auto_27737 ) ) ( not ( = ?auto_27722 ?auto_27718 ) ) ( not ( = ?auto_27722 ?auto_27746 ) ) ( not ( = ?auto_27726 ?auto_27719 ) ) ( not ( = ?auto_27726 ?auto_27736 ) ) ( not ( = ?auto_27726 ?auto_27723 ) ) ( not ( = ?auto_27726 ?auto_27716 ) ) ( not ( = ?auto_27726 ?auto_27727 ) ) ( not ( = ?auto_27728 ?auto_27741 ) ) ( not ( = ?auto_27728 ?auto_27717 ) ) ( not ( = ?auto_27728 ?auto_27731 ) ) ( not ( = ?auto_27728 ?auto_27734 ) ) ( not ( = ?auto_27728 ?auto_27729 ) ) ( not ( = ?auto_27693 ?auto_27702 ) ) ( not ( = ?auto_27693 ?auto_27733 ) ) ( not ( = ?auto_27694 ?auto_27702 ) ) ( not ( = ?auto_27694 ?auto_27733 ) ) ( not ( = ?auto_27695 ?auto_27702 ) ) ( not ( = ?auto_27695 ?auto_27733 ) ) ( not ( = ?auto_27696 ?auto_27702 ) ) ( not ( = ?auto_27696 ?auto_27733 ) ) ( not ( = ?auto_27697 ?auto_27702 ) ) ( not ( = ?auto_27697 ?auto_27733 ) ) ( not ( = ?auto_27700 ?auto_27702 ) ) ( not ( = ?auto_27700 ?auto_27733 ) ) ( not ( = ?auto_27702 ?auto_27728 ) ) ( not ( = ?auto_27702 ?auto_27741 ) ) ( not ( = ?auto_27702 ?auto_27717 ) ) ( not ( = ?auto_27702 ?auto_27731 ) ) ( not ( = ?auto_27702 ?auto_27734 ) ) ( not ( = ?auto_27702 ?auto_27729 ) ) ( not ( = ?auto_27733 ?auto_27728 ) ) ( not ( = ?auto_27733 ?auto_27741 ) ) ( not ( = ?auto_27733 ?auto_27717 ) ) ( not ( = ?auto_27733 ?auto_27731 ) ) ( not ( = ?auto_27733 ?auto_27734 ) ) ( not ( = ?auto_27733 ?auto_27729 ) ) ( not ( = ?auto_27693 ?auto_27701 ) ) ( not ( = ?auto_27693 ?auto_27745 ) ) ( not ( = ?auto_27694 ?auto_27701 ) ) ( not ( = ?auto_27694 ?auto_27745 ) ) ( not ( = ?auto_27695 ?auto_27701 ) ) ( not ( = ?auto_27695 ?auto_27745 ) ) ( not ( = ?auto_27696 ?auto_27701 ) ) ( not ( = ?auto_27696 ?auto_27745 ) ) ( not ( = ?auto_27697 ?auto_27701 ) ) ( not ( = ?auto_27697 ?auto_27745 ) ) ( not ( = ?auto_27700 ?auto_27701 ) ) ( not ( = ?auto_27700 ?auto_27745 ) ) ( not ( = ?auto_27698 ?auto_27701 ) ) ( not ( = ?auto_27698 ?auto_27745 ) ) ( not ( = ?auto_27701 ?auto_27733 ) ) ( not ( = ?auto_27701 ?auto_27728 ) ) ( not ( = ?auto_27701 ?auto_27741 ) ) ( not ( = ?auto_27701 ?auto_27717 ) ) ( not ( = ?auto_27701 ?auto_27731 ) ) ( not ( = ?auto_27701 ?auto_27734 ) ) ( not ( = ?auto_27701 ?auto_27729 ) ) ( not ( = ?auto_27743 ?auto_27746 ) ) ( not ( = ?auto_27743 ?auto_27722 ) ) ( not ( = ?auto_27743 ?auto_27721 ) ) ( not ( = ?auto_27743 ?auto_27735 ) ) ( not ( = ?auto_27743 ?auto_27737 ) ) ( not ( = ?auto_27743 ?auto_27718 ) ) ( not ( = ?auto_27742 ?auto_27727 ) ) ( not ( = ?auto_27742 ?auto_27726 ) ) ( not ( = ?auto_27742 ?auto_27719 ) ) ( not ( = ?auto_27742 ?auto_27736 ) ) ( not ( = ?auto_27742 ?auto_27723 ) ) ( not ( = ?auto_27742 ?auto_27716 ) ) ( not ( = ?auto_27745 ?auto_27733 ) ) ( not ( = ?auto_27745 ?auto_27728 ) ) ( not ( = ?auto_27745 ?auto_27741 ) ) ( not ( = ?auto_27745 ?auto_27717 ) ) ( not ( = ?auto_27745 ?auto_27731 ) ) ( not ( = ?auto_27745 ?auto_27734 ) ) ( not ( = ?auto_27745 ?auto_27729 ) ) ( not ( = ?auto_27693 ?auto_27699 ) ) ( not ( = ?auto_27693 ?auto_27739 ) ) ( not ( = ?auto_27694 ?auto_27699 ) ) ( not ( = ?auto_27694 ?auto_27739 ) ) ( not ( = ?auto_27695 ?auto_27699 ) ) ( not ( = ?auto_27695 ?auto_27739 ) ) ( not ( = ?auto_27696 ?auto_27699 ) ) ( not ( = ?auto_27696 ?auto_27739 ) ) ( not ( = ?auto_27697 ?auto_27699 ) ) ( not ( = ?auto_27697 ?auto_27739 ) ) ( not ( = ?auto_27700 ?auto_27699 ) ) ( not ( = ?auto_27700 ?auto_27739 ) ) ( not ( = ?auto_27698 ?auto_27699 ) ) ( not ( = ?auto_27698 ?auto_27739 ) ) ( not ( = ?auto_27702 ?auto_27699 ) ) ( not ( = ?auto_27702 ?auto_27739 ) ) ( not ( = ?auto_27699 ?auto_27745 ) ) ( not ( = ?auto_27699 ?auto_27733 ) ) ( not ( = ?auto_27699 ?auto_27728 ) ) ( not ( = ?auto_27699 ?auto_27741 ) ) ( not ( = ?auto_27699 ?auto_27717 ) ) ( not ( = ?auto_27699 ?auto_27731 ) ) ( not ( = ?auto_27699 ?auto_27734 ) ) ( not ( = ?auto_27699 ?auto_27729 ) ) ( not ( = ?auto_27739 ?auto_27745 ) ) ( not ( = ?auto_27739 ?auto_27733 ) ) ( not ( = ?auto_27739 ?auto_27728 ) ) ( not ( = ?auto_27739 ?auto_27741 ) ) ( not ( = ?auto_27739 ?auto_27717 ) ) ( not ( = ?auto_27739 ?auto_27731 ) ) ( not ( = ?auto_27739 ?auto_27734 ) ) ( not ( = ?auto_27739 ?auto_27729 ) ) ( not ( = ?auto_27693 ?auto_27704 ) ) ( not ( = ?auto_27693 ?auto_27738 ) ) ( not ( = ?auto_27694 ?auto_27704 ) ) ( not ( = ?auto_27694 ?auto_27738 ) ) ( not ( = ?auto_27695 ?auto_27704 ) ) ( not ( = ?auto_27695 ?auto_27738 ) ) ( not ( = ?auto_27696 ?auto_27704 ) ) ( not ( = ?auto_27696 ?auto_27738 ) ) ( not ( = ?auto_27697 ?auto_27704 ) ) ( not ( = ?auto_27697 ?auto_27738 ) ) ( not ( = ?auto_27700 ?auto_27704 ) ) ( not ( = ?auto_27700 ?auto_27738 ) ) ( not ( = ?auto_27698 ?auto_27704 ) ) ( not ( = ?auto_27698 ?auto_27738 ) ) ( not ( = ?auto_27702 ?auto_27704 ) ) ( not ( = ?auto_27702 ?auto_27738 ) ) ( not ( = ?auto_27701 ?auto_27704 ) ) ( not ( = ?auto_27701 ?auto_27738 ) ) ( not ( = ?auto_27704 ?auto_27739 ) ) ( not ( = ?auto_27704 ?auto_27745 ) ) ( not ( = ?auto_27704 ?auto_27733 ) ) ( not ( = ?auto_27704 ?auto_27728 ) ) ( not ( = ?auto_27704 ?auto_27741 ) ) ( not ( = ?auto_27704 ?auto_27717 ) ) ( not ( = ?auto_27704 ?auto_27731 ) ) ( not ( = ?auto_27704 ?auto_27734 ) ) ( not ( = ?auto_27704 ?auto_27729 ) ) ( not ( = ?auto_27732 ?auto_27735 ) ) ( not ( = ?auto_27732 ?auto_27743 ) ) ( not ( = ?auto_27732 ?auto_27746 ) ) ( not ( = ?auto_27732 ?auto_27722 ) ) ( not ( = ?auto_27732 ?auto_27721 ) ) ( not ( = ?auto_27732 ?auto_27737 ) ) ( not ( = ?auto_27732 ?auto_27718 ) ) ( not ( = ?auto_27724 ?auto_27736 ) ) ( not ( = ?auto_27724 ?auto_27742 ) ) ( not ( = ?auto_27724 ?auto_27727 ) ) ( not ( = ?auto_27724 ?auto_27726 ) ) ( not ( = ?auto_27724 ?auto_27719 ) ) ( not ( = ?auto_27724 ?auto_27723 ) ) ( not ( = ?auto_27724 ?auto_27716 ) ) ( not ( = ?auto_27738 ?auto_27739 ) ) ( not ( = ?auto_27738 ?auto_27745 ) ) ( not ( = ?auto_27738 ?auto_27733 ) ) ( not ( = ?auto_27738 ?auto_27728 ) ) ( not ( = ?auto_27738 ?auto_27741 ) ) ( not ( = ?auto_27738 ?auto_27717 ) ) ( not ( = ?auto_27738 ?auto_27731 ) ) ( not ( = ?auto_27738 ?auto_27734 ) ) ( not ( = ?auto_27738 ?auto_27729 ) ) ( not ( = ?auto_27693 ?auto_27703 ) ) ( not ( = ?auto_27693 ?auto_27744 ) ) ( not ( = ?auto_27694 ?auto_27703 ) ) ( not ( = ?auto_27694 ?auto_27744 ) ) ( not ( = ?auto_27695 ?auto_27703 ) ) ( not ( = ?auto_27695 ?auto_27744 ) ) ( not ( = ?auto_27696 ?auto_27703 ) ) ( not ( = ?auto_27696 ?auto_27744 ) ) ( not ( = ?auto_27697 ?auto_27703 ) ) ( not ( = ?auto_27697 ?auto_27744 ) ) ( not ( = ?auto_27700 ?auto_27703 ) ) ( not ( = ?auto_27700 ?auto_27744 ) ) ( not ( = ?auto_27698 ?auto_27703 ) ) ( not ( = ?auto_27698 ?auto_27744 ) ) ( not ( = ?auto_27702 ?auto_27703 ) ) ( not ( = ?auto_27702 ?auto_27744 ) ) ( not ( = ?auto_27701 ?auto_27703 ) ) ( not ( = ?auto_27701 ?auto_27744 ) ) ( not ( = ?auto_27699 ?auto_27703 ) ) ( not ( = ?auto_27699 ?auto_27744 ) ) ( not ( = ?auto_27703 ?auto_27738 ) ) ( not ( = ?auto_27703 ?auto_27739 ) ) ( not ( = ?auto_27703 ?auto_27745 ) ) ( not ( = ?auto_27703 ?auto_27733 ) ) ( not ( = ?auto_27703 ?auto_27728 ) ) ( not ( = ?auto_27703 ?auto_27741 ) ) ( not ( = ?auto_27703 ?auto_27717 ) ) ( not ( = ?auto_27703 ?auto_27731 ) ) ( not ( = ?auto_27703 ?auto_27734 ) ) ( not ( = ?auto_27703 ?auto_27729 ) ) ( not ( = ?auto_27710 ?auto_27732 ) ) ( not ( = ?auto_27710 ?auto_27735 ) ) ( not ( = ?auto_27710 ?auto_27743 ) ) ( not ( = ?auto_27710 ?auto_27746 ) ) ( not ( = ?auto_27710 ?auto_27722 ) ) ( not ( = ?auto_27710 ?auto_27721 ) ) ( not ( = ?auto_27710 ?auto_27737 ) ) ( not ( = ?auto_27710 ?auto_27718 ) ) ( not ( = ?auto_27708 ?auto_27724 ) ) ( not ( = ?auto_27708 ?auto_27736 ) ) ( not ( = ?auto_27708 ?auto_27742 ) ) ( not ( = ?auto_27708 ?auto_27727 ) ) ( not ( = ?auto_27708 ?auto_27726 ) ) ( not ( = ?auto_27708 ?auto_27719 ) ) ( not ( = ?auto_27708 ?auto_27723 ) ) ( not ( = ?auto_27708 ?auto_27716 ) ) ( not ( = ?auto_27744 ?auto_27738 ) ) ( not ( = ?auto_27744 ?auto_27739 ) ) ( not ( = ?auto_27744 ?auto_27745 ) ) ( not ( = ?auto_27744 ?auto_27733 ) ) ( not ( = ?auto_27744 ?auto_27728 ) ) ( not ( = ?auto_27744 ?auto_27741 ) ) ( not ( = ?auto_27744 ?auto_27717 ) ) ( not ( = ?auto_27744 ?auto_27731 ) ) ( not ( = ?auto_27744 ?auto_27734 ) ) ( not ( = ?auto_27744 ?auto_27729 ) ) ( not ( = ?auto_27693 ?auto_27705 ) ) ( not ( = ?auto_27693 ?auto_27730 ) ) ( not ( = ?auto_27694 ?auto_27705 ) ) ( not ( = ?auto_27694 ?auto_27730 ) ) ( not ( = ?auto_27695 ?auto_27705 ) ) ( not ( = ?auto_27695 ?auto_27730 ) ) ( not ( = ?auto_27696 ?auto_27705 ) ) ( not ( = ?auto_27696 ?auto_27730 ) ) ( not ( = ?auto_27697 ?auto_27705 ) ) ( not ( = ?auto_27697 ?auto_27730 ) ) ( not ( = ?auto_27700 ?auto_27705 ) ) ( not ( = ?auto_27700 ?auto_27730 ) ) ( not ( = ?auto_27698 ?auto_27705 ) ) ( not ( = ?auto_27698 ?auto_27730 ) ) ( not ( = ?auto_27702 ?auto_27705 ) ) ( not ( = ?auto_27702 ?auto_27730 ) ) ( not ( = ?auto_27701 ?auto_27705 ) ) ( not ( = ?auto_27701 ?auto_27730 ) ) ( not ( = ?auto_27699 ?auto_27705 ) ) ( not ( = ?auto_27699 ?auto_27730 ) ) ( not ( = ?auto_27704 ?auto_27705 ) ) ( not ( = ?auto_27704 ?auto_27730 ) ) ( not ( = ?auto_27705 ?auto_27744 ) ) ( not ( = ?auto_27705 ?auto_27738 ) ) ( not ( = ?auto_27705 ?auto_27739 ) ) ( not ( = ?auto_27705 ?auto_27745 ) ) ( not ( = ?auto_27705 ?auto_27733 ) ) ( not ( = ?auto_27705 ?auto_27728 ) ) ( not ( = ?auto_27705 ?auto_27741 ) ) ( not ( = ?auto_27705 ?auto_27717 ) ) ( not ( = ?auto_27705 ?auto_27731 ) ) ( not ( = ?auto_27705 ?auto_27734 ) ) ( not ( = ?auto_27705 ?auto_27729 ) ) ( not ( = ?auto_27725 ?auto_27710 ) ) ( not ( = ?auto_27725 ?auto_27732 ) ) ( not ( = ?auto_27725 ?auto_27735 ) ) ( not ( = ?auto_27725 ?auto_27743 ) ) ( not ( = ?auto_27725 ?auto_27746 ) ) ( not ( = ?auto_27725 ?auto_27722 ) ) ( not ( = ?auto_27725 ?auto_27721 ) ) ( not ( = ?auto_27725 ?auto_27737 ) ) ( not ( = ?auto_27725 ?auto_27718 ) ) ( not ( = ?auto_27714 ?auto_27708 ) ) ( not ( = ?auto_27714 ?auto_27724 ) ) ( not ( = ?auto_27714 ?auto_27736 ) ) ( not ( = ?auto_27714 ?auto_27742 ) ) ( not ( = ?auto_27714 ?auto_27727 ) ) ( not ( = ?auto_27714 ?auto_27726 ) ) ( not ( = ?auto_27714 ?auto_27719 ) ) ( not ( = ?auto_27714 ?auto_27723 ) ) ( not ( = ?auto_27714 ?auto_27716 ) ) ( not ( = ?auto_27730 ?auto_27744 ) ) ( not ( = ?auto_27730 ?auto_27738 ) ) ( not ( = ?auto_27730 ?auto_27739 ) ) ( not ( = ?auto_27730 ?auto_27745 ) ) ( not ( = ?auto_27730 ?auto_27733 ) ) ( not ( = ?auto_27730 ?auto_27728 ) ) ( not ( = ?auto_27730 ?auto_27741 ) ) ( not ( = ?auto_27730 ?auto_27717 ) ) ( not ( = ?auto_27730 ?auto_27731 ) ) ( not ( = ?auto_27730 ?auto_27734 ) ) ( not ( = ?auto_27730 ?auto_27729 ) ) ( not ( = ?auto_27693 ?auto_27706 ) ) ( not ( = ?auto_27693 ?auto_27715 ) ) ( not ( = ?auto_27694 ?auto_27706 ) ) ( not ( = ?auto_27694 ?auto_27715 ) ) ( not ( = ?auto_27695 ?auto_27706 ) ) ( not ( = ?auto_27695 ?auto_27715 ) ) ( not ( = ?auto_27696 ?auto_27706 ) ) ( not ( = ?auto_27696 ?auto_27715 ) ) ( not ( = ?auto_27697 ?auto_27706 ) ) ( not ( = ?auto_27697 ?auto_27715 ) ) ( not ( = ?auto_27700 ?auto_27706 ) ) ( not ( = ?auto_27700 ?auto_27715 ) ) ( not ( = ?auto_27698 ?auto_27706 ) ) ( not ( = ?auto_27698 ?auto_27715 ) ) ( not ( = ?auto_27702 ?auto_27706 ) ) ( not ( = ?auto_27702 ?auto_27715 ) ) ( not ( = ?auto_27701 ?auto_27706 ) ) ( not ( = ?auto_27701 ?auto_27715 ) ) ( not ( = ?auto_27699 ?auto_27706 ) ) ( not ( = ?auto_27699 ?auto_27715 ) ) ( not ( = ?auto_27704 ?auto_27706 ) ) ( not ( = ?auto_27704 ?auto_27715 ) ) ( not ( = ?auto_27703 ?auto_27706 ) ) ( not ( = ?auto_27703 ?auto_27715 ) ) ( not ( = ?auto_27706 ?auto_27730 ) ) ( not ( = ?auto_27706 ?auto_27744 ) ) ( not ( = ?auto_27706 ?auto_27738 ) ) ( not ( = ?auto_27706 ?auto_27739 ) ) ( not ( = ?auto_27706 ?auto_27745 ) ) ( not ( = ?auto_27706 ?auto_27733 ) ) ( not ( = ?auto_27706 ?auto_27728 ) ) ( not ( = ?auto_27706 ?auto_27741 ) ) ( not ( = ?auto_27706 ?auto_27717 ) ) ( not ( = ?auto_27706 ?auto_27731 ) ) ( not ( = ?auto_27706 ?auto_27734 ) ) ( not ( = ?auto_27706 ?auto_27729 ) ) ( not ( = ?auto_27720 ?auto_27725 ) ) ( not ( = ?auto_27720 ?auto_27710 ) ) ( not ( = ?auto_27720 ?auto_27732 ) ) ( not ( = ?auto_27720 ?auto_27735 ) ) ( not ( = ?auto_27720 ?auto_27743 ) ) ( not ( = ?auto_27720 ?auto_27746 ) ) ( not ( = ?auto_27720 ?auto_27722 ) ) ( not ( = ?auto_27720 ?auto_27721 ) ) ( not ( = ?auto_27720 ?auto_27737 ) ) ( not ( = ?auto_27720 ?auto_27718 ) ) ( not ( = ?auto_27740 ?auto_27714 ) ) ( not ( = ?auto_27740 ?auto_27708 ) ) ( not ( = ?auto_27740 ?auto_27724 ) ) ( not ( = ?auto_27740 ?auto_27736 ) ) ( not ( = ?auto_27740 ?auto_27742 ) ) ( not ( = ?auto_27740 ?auto_27727 ) ) ( not ( = ?auto_27740 ?auto_27726 ) ) ( not ( = ?auto_27740 ?auto_27719 ) ) ( not ( = ?auto_27740 ?auto_27723 ) ) ( not ( = ?auto_27740 ?auto_27716 ) ) ( not ( = ?auto_27715 ?auto_27730 ) ) ( not ( = ?auto_27715 ?auto_27744 ) ) ( not ( = ?auto_27715 ?auto_27738 ) ) ( not ( = ?auto_27715 ?auto_27739 ) ) ( not ( = ?auto_27715 ?auto_27745 ) ) ( not ( = ?auto_27715 ?auto_27733 ) ) ( not ( = ?auto_27715 ?auto_27728 ) ) ( not ( = ?auto_27715 ?auto_27741 ) ) ( not ( = ?auto_27715 ?auto_27717 ) ) ( not ( = ?auto_27715 ?auto_27731 ) ) ( not ( = ?auto_27715 ?auto_27734 ) ) ( not ( = ?auto_27715 ?auto_27729 ) ) ( not ( = ?auto_27693 ?auto_27707 ) ) ( not ( = ?auto_27693 ?auto_27713 ) ) ( not ( = ?auto_27694 ?auto_27707 ) ) ( not ( = ?auto_27694 ?auto_27713 ) ) ( not ( = ?auto_27695 ?auto_27707 ) ) ( not ( = ?auto_27695 ?auto_27713 ) ) ( not ( = ?auto_27696 ?auto_27707 ) ) ( not ( = ?auto_27696 ?auto_27713 ) ) ( not ( = ?auto_27697 ?auto_27707 ) ) ( not ( = ?auto_27697 ?auto_27713 ) ) ( not ( = ?auto_27700 ?auto_27707 ) ) ( not ( = ?auto_27700 ?auto_27713 ) ) ( not ( = ?auto_27698 ?auto_27707 ) ) ( not ( = ?auto_27698 ?auto_27713 ) ) ( not ( = ?auto_27702 ?auto_27707 ) ) ( not ( = ?auto_27702 ?auto_27713 ) ) ( not ( = ?auto_27701 ?auto_27707 ) ) ( not ( = ?auto_27701 ?auto_27713 ) ) ( not ( = ?auto_27699 ?auto_27707 ) ) ( not ( = ?auto_27699 ?auto_27713 ) ) ( not ( = ?auto_27704 ?auto_27707 ) ) ( not ( = ?auto_27704 ?auto_27713 ) ) ( not ( = ?auto_27703 ?auto_27707 ) ) ( not ( = ?auto_27703 ?auto_27713 ) ) ( not ( = ?auto_27705 ?auto_27707 ) ) ( not ( = ?auto_27705 ?auto_27713 ) ) ( not ( = ?auto_27707 ?auto_27715 ) ) ( not ( = ?auto_27707 ?auto_27730 ) ) ( not ( = ?auto_27707 ?auto_27744 ) ) ( not ( = ?auto_27707 ?auto_27738 ) ) ( not ( = ?auto_27707 ?auto_27739 ) ) ( not ( = ?auto_27707 ?auto_27745 ) ) ( not ( = ?auto_27707 ?auto_27733 ) ) ( not ( = ?auto_27707 ?auto_27728 ) ) ( not ( = ?auto_27707 ?auto_27741 ) ) ( not ( = ?auto_27707 ?auto_27717 ) ) ( not ( = ?auto_27707 ?auto_27731 ) ) ( not ( = ?auto_27707 ?auto_27734 ) ) ( not ( = ?auto_27707 ?auto_27729 ) ) ( not ( = ?auto_27713 ?auto_27715 ) ) ( not ( = ?auto_27713 ?auto_27730 ) ) ( not ( = ?auto_27713 ?auto_27744 ) ) ( not ( = ?auto_27713 ?auto_27738 ) ) ( not ( = ?auto_27713 ?auto_27739 ) ) ( not ( = ?auto_27713 ?auto_27745 ) ) ( not ( = ?auto_27713 ?auto_27733 ) ) ( not ( = ?auto_27713 ?auto_27728 ) ) ( not ( = ?auto_27713 ?auto_27741 ) ) ( not ( = ?auto_27713 ?auto_27717 ) ) ( not ( = ?auto_27713 ?auto_27731 ) ) ( not ( = ?auto_27713 ?auto_27734 ) ) ( not ( = ?auto_27713 ?auto_27729 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_27693 ?auto_27694 ?auto_27695 ?auto_27696 ?auto_27697 ?auto_27700 ?auto_27698 ?auto_27702 ?auto_27701 ?auto_27699 ?auto_27704 ?auto_27703 ?auto_27705 ?auto_27706 )
      ( MAKE-1CRATE ?auto_27706 ?auto_27707 )
      ( MAKE-14CRATE-VERIFY ?auto_27693 ?auto_27694 ?auto_27695 ?auto_27696 ?auto_27697 ?auto_27700 ?auto_27698 ?auto_27702 ?auto_27701 ?auto_27699 ?auto_27704 ?auto_27703 ?auto_27705 ?auto_27706 ?auto_27707 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27749 - SURFACE
      ?auto_27750 - SURFACE
    )
    :vars
    (
      ?auto_27751 - HOIST
      ?auto_27752 - PLACE
      ?auto_27754 - PLACE
      ?auto_27755 - HOIST
      ?auto_27756 - SURFACE
      ?auto_27753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27751 ?auto_27752 ) ( SURFACE-AT ?auto_27749 ?auto_27752 ) ( CLEAR ?auto_27749 ) ( IS-CRATE ?auto_27750 ) ( AVAILABLE ?auto_27751 ) ( not ( = ?auto_27754 ?auto_27752 ) ) ( HOIST-AT ?auto_27755 ?auto_27754 ) ( AVAILABLE ?auto_27755 ) ( SURFACE-AT ?auto_27750 ?auto_27754 ) ( ON ?auto_27750 ?auto_27756 ) ( CLEAR ?auto_27750 ) ( TRUCK-AT ?auto_27753 ?auto_27752 ) ( not ( = ?auto_27749 ?auto_27750 ) ) ( not ( = ?auto_27749 ?auto_27756 ) ) ( not ( = ?auto_27750 ?auto_27756 ) ) ( not ( = ?auto_27751 ?auto_27755 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27753 ?auto_27752 ?auto_27754 )
      ( !LIFT ?auto_27755 ?auto_27750 ?auto_27756 ?auto_27754 )
      ( !LOAD ?auto_27755 ?auto_27750 ?auto_27753 ?auto_27754 )
      ( !DRIVE ?auto_27753 ?auto_27754 ?auto_27752 )
      ( !UNLOAD ?auto_27751 ?auto_27750 ?auto_27753 ?auto_27752 )
      ( !DROP ?auto_27751 ?auto_27750 ?auto_27749 ?auto_27752 )
      ( MAKE-1CRATE-VERIFY ?auto_27749 ?auto_27750 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_27773 - SURFACE
      ?auto_27774 - SURFACE
      ?auto_27775 - SURFACE
      ?auto_27776 - SURFACE
      ?auto_27777 - SURFACE
      ?auto_27780 - SURFACE
      ?auto_27778 - SURFACE
      ?auto_27782 - SURFACE
      ?auto_27781 - SURFACE
      ?auto_27779 - SURFACE
      ?auto_27784 - SURFACE
      ?auto_27783 - SURFACE
      ?auto_27785 - SURFACE
      ?auto_27787 - SURFACE
      ?auto_27788 - SURFACE
      ?auto_27786 - SURFACE
    )
    :vars
    (
      ?auto_27794 - HOIST
      ?auto_27789 - PLACE
      ?auto_27793 - PLACE
      ?auto_27790 - HOIST
      ?auto_27791 - SURFACE
      ?auto_27825 - PLACE
      ?auto_27818 - HOIST
      ?auto_27803 - SURFACE
      ?auto_27819 - PLACE
      ?auto_27809 - HOIST
      ?auto_27800 - SURFACE
      ?auto_27795 - PLACE
      ?auto_27805 - HOIST
      ?auto_27807 - SURFACE
      ?auto_27817 - SURFACE
      ?auto_27799 - PLACE
      ?auto_27816 - HOIST
      ?auto_27801 - SURFACE
      ?auto_27802 - SURFACE
      ?auto_27797 - PLACE
      ?auto_27808 - HOIST
      ?auto_27824 - SURFACE
      ?auto_27826 - PLACE
      ?auto_27827 - HOIST
      ?auto_27823 - SURFACE
      ?auto_27820 - PLACE
      ?auto_27806 - HOIST
      ?auto_27812 - SURFACE
      ?auto_27822 - PLACE
      ?auto_27798 - HOIST
      ?auto_27814 - SURFACE
      ?auto_27811 - SURFACE
      ?auto_27796 - PLACE
      ?auto_27821 - HOIST
      ?auto_27815 - SURFACE
      ?auto_27813 - PLACE
      ?auto_27804 - HOIST
      ?auto_27828 - SURFACE
      ?auto_27810 - SURFACE
      ?auto_27792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27794 ?auto_27789 ) ( IS-CRATE ?auto_27786 ) ( not ( = ?auto_27793 ?auto_27789 ) ) ( HOIST-AT ?auto_27790 ?auto_27793 ) ( SURFACE-AT ?auto_27786 ?auto_27793 ) ( ON ?auto_27786 ?auto_27791 ) ( CLEAR ?auto_27786 ) ( not ( = ?auto_27788 ?auto_27786 ) ) ( not ( = ?auto_27788 ?auto_27791 ) ) ( not ( = ?auto_27786 ?auto_27791 ) ) ( not ( = ?auto_27794 ?auto_27790 ) ) ( IS-CRATE ?auto_27788 ) ( not ( = ?auto_27825 ?auto_27789 ) ) ( HOIST-AT ?auto_27818 ?auto_27825 ) ( SURFACE-AT ?auto_27788 ?auto_27825 ) ( ON ?auto_27788 ?auto_27803 ) ( CLEAR ?auto_27788 ) ( not ( = ?auto_27787 ?auto_27788 ) ) ( not ( = ?auto_27787 ?auto_27803 ) ) ( not ( = ?auto_27788 ?auto_27803 ) ) ( not ( = ?auto_27794 ?auto_27818 ) ) ( IS-CRATE ?auto_27787 ) ( not ( = ?auto_27819 ?auto_27789 ) ) ( HOIST-AT ?auto_27809 ?auto_27819 ) ( AVAILABLE ?auto_27809 ) ( SURFACE-AT ?auto_27787 ?auto_27819 ) ( ON ?auto_27787 ?auto_27800 ) ( CLEAR ?auto_27787 ) ( not ( = ?auto_27785 ?auto_27787 ) ) ( not ( = ?auto_27785 ?auto_27800 ) ) ( not ( = ?auto_27787 ?auto_27800 ) ) ( not ( = ?auto_27794 ?auto_27809 ) ) ( IS-CRATE ?auto_27785 ) ( not ( = ?auto_27795 ?auto_27789 ) ) ( HOIST-AT ?auto_27805 ?auto_27795 ) ( AVAILABLE ?auto_27805 ) ( SURFACE-AT ?auto_27785 ?auto_27795 ) ( ON ?auto_27785 ?auto_27807 ) ( CLEAR ?auto_27785 ) ( not ( = ?auto_27783 ?auto_27785 ) ) ( not ( = ?auto_27783 ?auto_27807 ) ) ( not ( = ?auto_27785 ?auto_27807 ) ) ( not ( = ?auto_27794 ?auto_27805 ) ) ( IS-CRATE ?auto_27783 ) ( AVAILABLE ?auto_27818 ) ( SURFACE-AT ?auto_27783 ?auto_27825 ) ( ON ?auto_27783 ?auto_27817 ) ( CLEAR ?auto_27783 ) ( not ( = ?auto_27784 ?auto_27783 ) ) ( not ( = ?auto_27784 ?auto_27817 ) ) ( not ( = ?auto_27783 ?auto_27817 ) ) ( IS-CRATE ?auto_27784 ) ( not ( = ?auto_27799 ?auto_27789 ) ) ( HOIST-AT ?auto_27816 ?auto_27799 ) ( AVAILABLE ?auto_27816 ) ( SURFACE-AT ?auto_27784 ?auto_27799 ) ( ON ?auto_27784 ?auto_27801 ) ( CLEAR ?auto_27784 ) ( not ( = ?auto_27779 ?auto_27784 ) ) ( not ( = ?auto_27779 ?auto_27801 ) ) ( not ( = ?auto_27784 ?auto_27801 ) ) ( not ( = ?auto_27794 ?auto_27816 ) ) ( IS-CRATE ?auto_27779 ) ( SURFACE-AT ?auto_27779 ?auto_27793 ) ( ON ?auto_27779 ?auto_27802 ) ( CLEAR ?auto_27779 ) ( not ( = ?auto_27781 ?auto_27779 ) ) ( not ( = ?auto_27781 ?auto_27802 ) ) ( not ( = ?auto_27779 ?auto_27802 ) ) ( IS-CRATE ?auto_27781 ) ( not ( = ?auto_27797 ?auto_27789 ) ) ( HOIST-AT ?auto_27808 ?auto_27797 ) ( AVAILABLE ?auto_27808 ) ( SURFACE-AT ?auto_27781 ?auto_27797 ) ( ON ?auto_27781 ?auto_27824 ) ( CLEAR ?auto_27781 ) ( not ( = ?auto_27782 ?auto_27781 ) ) ( not ( = ?auto_27782 ?auto_27824 ) ) ( not ( = ?auto_27781 ?auto_27824 ) ) ( not ( = ?auto_27794 ?auto_27808 ) ) ( IS-CRATE ?auto_27782 ) ( not ( = ?auto_27826 ?auto_27789 ) ) ( HOIST-AT ?auto_27827 ?auto_27826 ) ( SURFACE-AT ?auto_27782 ?auto_27826 ) ( ON ?auto_27782 ?auto_27823 ) ( CLEAR ?auto_27782 ) ( not ( = ?auto_27778 ?auto_27782 ) ) ( not ( = ?auto_27778 ?auto_27823 ) ) ( not ( = ?auto_27782 ?auto_27823 ) ) ( not ( = ?auto_27794 ?auto_27827 ) ) ( IS-CRATE ?auto_27778 ) ( not ( = ?auto_27820 ?auto_27789 ) ) ( HOIST-AT ?auto_27806 ?auto_27820 ) ( AVAILABLE ?auto_27806 ) ( SURFACE-AT ?auto_27778 ?auto_27820 ) ( ON ?auto_27778 ?auto_27812 ) ( CLEAR ?auto_27778 ) ( not ( = ?auto_27780 ?auto_27778 ) ) ( not ( = ?auto_27780 ?auto_27812 ) ) ( not ( = ?auto_27778 ?auto_27812 ) ) ( not ( = ?auto_27794 ?auto_27806 ) ) ( IS-CRATE ?auto_27780 ) ( not ( = ?auto_27822 ?auto_27789 ) ) ( HOIST-AT ?auto_27798 ?auto_27822 ) ( AVAILABLE ?auto_27798 ) ( SURFACE-AT ?auto_27780 ?auto_27822 ) ( ON ?auto_27780 ?auto_27814 ) ( CLEAR ?auto_27780 ) ( not ( = ?auto_27777 ?auto_27780 ) ) ( not ( = ?auto_27777 ?auto_27814 ) ) ( not ( = ?auto_27780 ?auto_27814 ) ) ( not ( = ?auto_27794 ?auto_27798 ) ) ( IS-CRATE ?auto_27777 ) ( AVAILABLE ?auto_27790 ) ( SURFACE-AT ?auto_27777 ?auto_27793 ) ( ON ?auto_27777 ?auto_27811 ) ( CLEAR ?auto_27777 ) ( not ( = ?auto_27776 ?auto_27777 ) ) ( not ( = ?auto_27776 ?auto_27811 ) ) ( not ( = ?auto_27777 ?auto_27811 ) ) ( IS-CRATE ?auto_27776 ) ( not ( = ?auto_27796 ?auto_27789 ) ) ( HOIST-AT ?auto_27821 ?auto_27796 ) ( AVAILABLE ?auto_27821 ) ( SURFACE-AT ?auto_27776 ?auto_27796 ) ( ON ?auto_27776 ?auto_27815 ) ( CLEAR ?auto_27776 ) ( not ( = ?auto_27775 ?auto_27776 ) ) ( not ( = ?auto_27775 ?auto_27815 ) ) ( not ( = ?auto_27776 ?auto_27815 ) ) ( not ( = ?auto_27794 ?auto_27821 ) ) ( IS-CRATE ?auto_27775 ) ( not ( = ?auto_27813 ?auto_27789 ) ) ( HOIST-AT ?auto_27804 ?auto_27813 ) ( AVAILABLE ?auto_27804 ) ( SURFACE-AT ?auto_27775 ?auto_27813 ) ( ON ?auto_27775 ?auto_27828 ) ( CLEAR ?auto_27775 ) ( not ( = ?auto_27774 ?auto_27775 ) ) ( not ( = ?auto_27774 ?auto_27828 ) ) ( not ( = ?auto_27775 ?auto_27828 ) ) ( not ( = ?auto_27794 ?auto_27804 ) ) ( SURFACE-AT ?auto_27773 ?auto_27789 ) ( CLEAR ?auto_27773 ) ( IS-CRATE ?auto_27774 ) ( AVAILABLE ?auto_27794 ) ( AVAILABLE ?auto_27827 ) ( SURFACE-AT ?auto_27774 ?auto_27826 ) ( ON ?auto_27774 ?auto_27810 ) ( CLEAR ?auto_27774 ) ( TRUCK-AT ?auto_27792 ?auto_27789 ) ( not ( = ?auto_27773 ?auto_27774 ) ) ( not ( = ?auto_27773 ?auto_27810 ) ) ( not ( = ?auto_27774 ?auto_27810 ) ) ( not ( = ?auto_27773 ?auto_27775 ) ) ( not ( = ?auto_27773 ?auto_27828 ) ) ( not ( = ?auto_27775 ?auto_27810 ) ) ( not ( = ?auto_27813 ?auto_27826 ) ) ( not ( = ?auto_27804 ?auto_27827 ) ) ( not ( = ?auto_27828 ?auto_27810 ) ) ( not ( = ?auto_27773 ?auto_27776 ) ) ( not ( = ?auto_27773 ?auto_27815 ) ) ( not ( = ?auto_27774 ?auto_27776 ) ) ( not ( = ?auto_27774 ?auto_27815 ) ) ( not ( = ?auto_27776 ?auto_27828 ) ) ( not ( = ?auto_27776 ?auto_27810 ) ) ( not ( = ?auto_27796 ?auto_27813 ) ) ( not ( = ?auto_27796 ?auto_27826 ) ) ( not ( = ?auto_27821 ?auto_27804 ) ) ( not ( = ?auto_27821 ?auto_27827 ) ) ( not ( = ?auto_27815 ?auto_27828 ) ) ( not ( = ?auto_27815 ?auto_27810 ) ) ( not ( = ?auto_27773 ?auto_27777 ) ) ( not ( = ?auto_27773 ?auto_27811 ) ) ( not ( = ?auto_27774 ?auto_27777 ) ) ( not ( = ?auto_27774 ?auto_27811 ) ) ( not ( = ?auto_27775 ?auto_27777 ) ) ( not ( = ?auto_27775 ?auto_27811 ) ) ( not ( = ?auto_27777 ?auto_27815 ) ) ( not ( = ?auto_27777 ?auto_27828 ) ) ( not ( = ?auto_27777 ?auto_27810 ) ) ( not ( = ?auto_27793 ?auto_27796 ) ) ( not ( = ?auto_27793 ?auto_27813 ) ) ( not ( = ?auto_27793 ?auto_27826 ) ) ( not ( = ?auto_27790 ?auto_27821 ) ) ( not ( = ?auto_27790 ?auto_27804 ) ) ( not ( = ?auto_27790 ?auto_27827 ) ) ( not ( = ?auto_27811 ?auto_27815 ) ) ( not ( = ?auto_27811 ?auto_27828 ) ) ( not ( = ?auto_27811 ?auto_27810 ) ) ( not ( = ?auto_27773 ?auto_27780 ) ) ( not ( = ?auto_27773 ?auto_27814 ) ) ( not ( = ?auto_27774 ?auto_27780 ) ) ( not ( = ?auto_27774 ?auto_27814 ) ) ( not ( = ?auto_27775 ?auto_27780 ) ) ( not ( = ?auto_27775 ?auto_27814 ) ) ( not ( = ?auto_27776 ?auto_27780 ) ) ( not ( = ?auto_27776 ?auto_27814 ) ) ( not ( = ?auto_27780 ?auto_27811 ) ) ( not ( = ?auto_27780 ?auto_27815 ) ) ( not ( = ?auto_27780 ?auto_27828 ) ) ( not ( = ?auto_27780 ?auto_27810 ) ) ( not ( = ?auto_27822 ?auto_27793 ) ) ( not ( = ?auto_27822 ?auto_27796 ) ) ( not ( = ?auto_27822 ?auto_27813 ) ) ( not ( = ?auto_27822 ?auto_27826 ) ) ( not ( = ?auto_27798 ?auto_27790 ) ) ( not ( = ?auto_27798 ?auto_27821 ) ) ( not ( = ?auto_27798 ?auto_27804 ) ) ( not ( = ?auto_27798 ?auto_27827 ) ) ( not ( = ?auto_27814 ?auto_27811 ) ) ( not ( = ?auto_27814 ?auto_27815 ) ) ( not ( = ?auto_27814 ?auto_27828 ) ) ( not ( = ?auto_27814 ?auto_27810 ) ) ( not ( = ?auto_27773 ?auto_27778 ) ) ( not ( = ?auto_27773 ?auto_27812 ) ) ( not ( = ?auto_27774 ?auto_27778 ) ) ( not ( = ?auto_27774 ?auto_27812 ) ) ( not ( = ?auto_27775 ?auto_27778 ) ) ( not ( = ?auto_27775 ?auto_27812 ) ) ( not ( = ?auto_27776 ?auto_27778 ) ) ( not ( = ?auto_27776 ?auto_27812 ) ) ( not ( = ?auto_27777 ?auto_27778 ) ) ( not ( = ?auto_27777 ?auto_27812 ) ) ( not ( = ?auto_27778 ?auto_27814 ) ) ( not ( = ?auto_27778 ?auto_27811 ) ) ( not ( = ?auto_27778 ?auto_27815 ) ) ( not ( = ?auto_27778 ?auto_27828 ) ) ( not ( = ?auto_27778 ?auto_27810 ) ) ( not ( = ?auto_27820 ?auto_27822 ) ) ( not ( = ?auto_27820 ?auto_27793 ) ) ( not ( = ?auto_27820 ?auto_27796 ) ) ( not ( = ?auto_27820 ?auto_27813 ) ) ( not ( = ?auto_27820 ?auto_27826 ) ) ( not ( = ?auto_27806 ?auto_27798 ) ) ( not ( = ?auto_27806 ?auto_27790 ) ) ( not ( = ?auto_27806 ?auto_27821 ) ) ( not ( = ?auto_27806 ?auto_27804 ) ) ( not ( = ?auto_27806 ?auto_27827 ) ) ( not ( = ?auto_27812 ?auto_27814 ) ) ( not ( = ?auto_27812 ?auto_27811 ) ) ( not ( = ?auto_27812 ?auto_27815 ) ) ( not ( = ?auto_27812 ?auto_27828 ) ) ( not ( = ?auto_27812 ?auto_27810 ) ) ( not ( = ?auto_27773 ?auto_27782 ) ) ( not ( = ?auto_27773 ?auto_27823 ) ) ( not ( = ?auto_27774 ?auto_27782 ) ) ( not ( = ?auto_27774 ?auto_27823 ) ) ( not ( = ?auto_27775 ?auto_27782 ) ) ( not ( = ?auto_27775 ?auto_27823 ) ) ( not ( = ?auto_27776 ?auto_27782 ) ) ( not ( = ?auto_27776 ?auto_27823 ) ) ( not ( = ?auto_27777 ?auto_27782 ) ) ( not ( = ?auto_27777 ?auto_27823 ) ) ( not ( = ?auto_27780 ?auto_27782 ) ) ( not ( = ?auto_27780 ?auto_27823 ) ) ( not ( = ?auto_27782 ?auto_27812 ) ) ( not ( = ?auto_27782 ?auto_27814 ) ) ( not ( = ?auto_27782 ?auto_27811 ) ) ( not ( = ?auto_27782 ?auto_27815 ) ) ( not ( = ?auto_27782 ?auto_27828 ) ) ( not ( = ?auto_27782 ?auto_27810 ) ) ( not ( = ?auto_27823 ?auto_27812 ) ) ( not ( = ?auto_27823 ?auto_27814 ) ) ( not ( = ?auto_27823 ?auto_27811 ) ) ( not ( = ?auto_27823 ?auto_27815 ) ) ( not ( = ?auto_27823 ?auto_27828 ) ) ( not ( = ?auto_27823 ?auto_27810 ) ) ( not ( = ?auto_27773 ?auto_27781 ) ) ( not ( = ?auto_27773 ?auto_27824 ) ) ( not ( = ?auto_27774 ?auto_27781 ) ) ( not ( = ?auto_27774 ?auto_27824 ) ) ( not ( = ?auto_27775 ?auto_27781 ) ) ( not ( = ?auto_27775 ?auto_27824 ) ) ( not ( = ?auto_27776 ?auto_27781 ) ) ( not ( = ?auto_27776 ?auto_27824 ) ) ( not ( = ?auto_27777 ?auto_27781 ) ) ( not ( = ?auto_27777 ?auto_27824 ) ) ( not ( = ?auto_27780 ?auto_27781 ) ) ( not ( = ?auto_27780 ?auto_27824 ) ) ( not ( = ?auto_27778 ?auto_27781 ) ) ( not ( = ?auto_27778 ?auto_27824 ) ) ( not ( = ?auto_27781 ?auto_27823 ) ) ( not ( = ?auto_27781 ?auto_27812 ) ) ( not ( = ?auto_27781 ?auto_27814 ) ) ( not ( = ?auto_27781 ?auto_27811 ) ) ( not ( = ?auto_27781 ?auto_27815 ) ) ( not ( = ?auto_27781 ?auto_27828 ) ) ( not ( = ?auto_27781 ?auto_27810 ) ) ( not ( = ?auto_27797 ?auto_27826 ) ) ( not ( = ?auto_27797 ?auto_27820 ) ) ( not ( = ?auto_27797 ?auto_27822 ) ) ( not ( = ?auto_27797 ?auto_27793 ) ) ( not ( = ?auto_27797 ?auto_27796 ) ) ( not ( = ?auto_27797 ?auto_27813 ) ) ( not ( = ?auto_27808 ?auto_27827 ) ) ( not ( = ?auto_27808 ?auto_27806 ) ) ( not ( = ?auto_27808 ?auto_27798 ) ) ( not ( = ?auto_27808 ?auto_27790 ) ) ( not ( = ?auto_27808 ?auto_27821 ) ) ( not ( = ?auto_27808 ?auto_27804 ) ) ( not ( = ?auto_27824 ?auto_27823 ) ) ( not ( = ?auto_27824 ?auto_27812 ) ) ( not ( = ?auto_27824 ?auto_27814 ) ) ( not ( = ?auto_27824 ?auto_27811 ) ) ( not ( = ?auto_27824 ?auto_27815 ) ) ( not ( = ?auto_27824 ?auto_27828 ) ) ( not ( = ?auto_27824 ?auto_27810 ) ) ( not ( = ?auto_27773 ?auto_27779 ) ) ( not ( = ?auto_27773 ?auto_27802 ) ) ( not ( = ?auto_27774 ?auto_27779 ) ) ( not ( = ?auto_27774 ?auto_27802 ) ) ( not ( = ?auto_27775 ?auto_27779 ) ) ( not ( = ?auto_27775 ?auto_27802 ) ) ( not ( = ?auto_27776 ?auto_27779 ) ) ( not ( = ?auto_27776 ?auto_27802 ) ) ( not ( = ?auto_27777 ?auto_27779 ) ) ( not ( = ?auto_27777 ?auto_27802 ) ) ( not ( = ?auto_27780 ?auto_27779 ) ) ( not ( = ?auto_27780 ?auto_27802 ) ) ( not ( = ?auto_27778 ?auto_27779 ) ) ( not ( = ?auto_27778 ?auto_27802 ) ) ( not ( = ?auto_27782 ?auto_27779 ) ) ( not ( = ?auto_27782 ?auto_27802 ) ) ( not ( = ?auto_27779 ?auto_27824 ) ) ( not ( = ?auto_27779 ?auto_27823 ) ) ( not ( = ?auto_27779 ?auto_27812 ) ) ( not ( = ?auto_27779 ?auto_27814 ) ) ( not ( = ?auto_27779 ?auto_27811 ) ) ( not ( = ?auto_27779 ?auto_27815 ) ) ( not ( = ?auto_27779 ?auto_27828 ) ) ( not ( = ?auto_27779 ?auto_27810 ) ) ( not ( = ?auto_27802 ?auto_27824 ) ) ( not ( = ?auto_27802 ?auto_27823 ) ) ( not ( = ?auto_27802 ?auto_27812 ) ) ( not ( = ?auto_27802 ?auto_27814 ) ) ( not ( = ?auto_27802 ?auto_27811 ) ) ( not ( = ?auto_27802 ?auto_27815 ) ) ( not ( = ?auto_27802 ?auto_27828 ) ) ( not ( = ?auto_27802 ?auto_27810 ) ) ( not ( = ?auto_27773 ?auto_27784 ) ) ( not ( = ?auto_27773 ?auto_27801 ) ) ( not ( = ?auto_27774 ?auto_27784 ) ) ( not ( = ?auto_27774 ?auto_27801 ) ) ( not ( = ?auto_27775 ?auto_27784 ) ) ( not ( = ?auto_27775 ?auto_27801 ) ) ( not ( = ?auto_27776 ?auto_27784 ) ) ( not ( = ?auto_27776 ?auto_27801 ) ) ( not ( = ?auto_27777 ?auto_27784 ) ) ( not ( = ?auto_27777 ?auto_27801 ) ) ( not ( = ?auto_27780 ?auto_27784 ) ) ( not ( = ?auto_27780 ?auto_27801 ) ) ( not ( = ?auto_27778 ?auto_27784 ) ) ( not ( = ?auto_27778 ?auto_27801 ) ) ( not ( = ?auto_27782 ?auto_27784 ) ) ( not ( = ?auto_27782 ?auto_27801 ) ) ( not ( = ?auto_27781 ?auto_27784 ) ) ( not ( = ?auto_27781 ?auto_27801 ) ) ( not ( = ?auto_27784 ?auto_27802 ) ) ( not ( = ?auto_27784 ?auto_27824 ) ) ( not ( = ?auto_27784 ?auto_27823 ) ) ( not ( = ?auto_27784 ?auto_27812 ) ) ( not ( = ?auto_27784 ?auto_27814 ) ) ( not ( = ?auto_27784 ?auto_27811 ) ) ( not ( = ?auto_27784 ?auto_27815 ) ) ( not ( = ?auto_27784 ?auto_27828 ) ) ( not ( = ?auto_27784 ?auto_27810 ) ) ( not ( = ?auto_27799 ?auto_27793 ) ) ( not ( = ?auto_27799 ?auto_27797 ) ) ( not ( = ?auto_27799 ?auto_27826 ) ) ( not ( = ?auto_27799 ?auto_27820 ) ) ( not ( = ?auto_27799 ?auto_27822 ) ) ( not ( = ?auto_27799 ?auto_27796 ) ) ( not ( = ?auto_27799 ?auto_27813 ) ) ( not ( = ?auto_27816 ?auto_27790 ) ) ( not ( = ?auto_27816 ?auto_27808 ) ) ( not ( = ?auto_27816 ?auto_27827 ) ) ( not ( = ?auto_27816 ?auto_27806 ) ) ( not ( = ?auto_27816 ?auto_27798 ) ) ( not ( = ?auto_27816 ?auto_27821 ) ) ( not ( = ?auto_27816 ?auto_27804 ) ) ( not ( = ?auto_27801 ?auto_27802 ) ) ( not ( = ?auto_27801 ?auto_27824 ) ) ( not ( = ?auto_27801 ?auto_27823 ) ) ( not ( = ?auto_27801 ?auto_27812 ) ) ( not ( = ?auto_27801 ?auto_27814 ) ) ( not ( = ?auto_27801 ?auto_27811 ) ) ( not ( = ?auto_27801 ?auto_27815 ) ) ( not ( = ?auto_27801 ?auto_27828 ) ) ( not ( = ?auto_27801 ?auto_27810 ) ) ( not ( = ?auto_27773 ?auto_27783 ) ) ( not ( = ?auto_27773 ?auto_27817 ) ) ( not ( = ?auto_27774 ?auto_27783 ) ) ( not ( = ?auto_27774 ?auto_27817 ) ) ( not ( = ?auto_27775 ?auto_27783 ) ) ( not ( = ?auto_27775 ?auto_27817 ) ) ( not ( = ?auto_27776 ?auto_27783 ) ) ( not ( = ?auto_27776 ?auto_27817 ) ) ( not ( = ?auto_27777 ?auto_27783 ) ) ( not ( = ?auto_27777 ?auto_27817 ) ) ( not ( = ?auto_27780 ?auto_27783 ) ) ( not ( = ?auto_27780 ?auto_27817 ) ) ( not ( = ?auto_27778 ?auto_27783 ) ) ( not ( = ?auto_27778 ?auto_27817 ) ) ( not ( = ?auto_27782 ?auto_27783 ) ) ( not ( = ?auto_27782 ?auto_27817 ) ) ( not ( = ?auto_27781 ?auto_27783 ) ) ( not ( = ?auto_27781 ?auto_27817 ) ) ( not ( = ?auto_27779 ?auto_27783 ) ) ( not ( = ?auto_27779 ?auto_27817 ) ) ( not ( = ?auto_27783 ?auto_27801 ) ) ( not ( = ?auto_27783 ?auto_27802 ) ) ( not ( = ?auto_27783 ?auto_27824 ) ) ( not ( = ?auto_27783 ?auto_27823 ) ) ( not ( = ?auto_27783 ?auto_27812 ) ) ( not ( = ?auto_27783 ?auto_27814 ) ) ( not ( = ?auto_27783 ?auto_27811 ) ) ( not ( = ?auto_27783 ?auto_27815 ) ) ( not ( = ?auto_27783 ?auto_27828 ) ) ( not ( = ?auto_27783 ?auto_27810 ) ) ( not ( = ?auto_27825 ?auto_27799 ) ) ( not ( = ?auto_27825 ?auto_27793 ) ) ( not ( = ?auto_27825 ?auto_27797 ) ) ( not ( = ?auto_27825 ?auto_27826 ) ) ( not ( = ?auto_27825 ?auto_27820 ) ) ( not ( = ?auto_27825 ?auto_27822 ) ) ( not ( = ?auto_27825 ?auto_27796 ) ) ( not ( = ?auto_27825 ?auto_27813 ) ) ( not ( = ?auto_27818 ?auto_27816 ) ) ( not ( = ?auto_27818 ?auto_27790 ) ) ( not ( = ?auto_27818 ?auto_27808 ) ) ( not ( = ?auto_27818 ?auto_27827 ) ) ( not ( = ?auto_27818 ?auto_27806 ) ) ( not ( = ?auto_27818 ?auto_27798 ) ) ( not ( = ?auto_27818 ?auto_27821 ) ) ( not ( = ?auto_27818 ?auto_27804 ) ) ( not ( = ?auto_27817 ?auto_27801 ) ) ( not ( = ?auto_27817 ?auto_27802 ) ) ( not ( = ?auto_27817 ?auto_27824 ) ) ( not ( = ?auto_27817 ?auto_27823 ) ) ( not ( = ?auto_27817 ?auto_27812 ) ) ( not ( = ?auto_27817 ?auto_27814 ) ) ( not ( = ?auto_27817 ?auto_27811 ) ) ( not ( = ?auto_27817 ?auto_27815 ) ) ( not ( = ?auto_27817 ?auto_27828 ) ) ( not ( = ?auto_27817 ?auto_27810 ) ) ( not ( = ?auto_27773 ?auto_27785 ) ) ( not ( = ?auto_27773 ?auto_27807 ) ) ( not ( = ?auto_27774 ?auto_27785 ) ) ( not ( = ?auto_27774 ?auto_27807 ) ) ( not ( = ?auto_27775 ?auto_27785 ) ) ( not ( = ?auto_27775 ?auto_27807 ) ) ( not ( = ?auto_27776 ?auto_27785 ) ) ( not ( = ?auto_27776 ?auto_27807 ) ) ( not ( = ?auto_27777 ?auto_27785 ) ) ( not ( = ?auto_27777 ?auto_27807 ) ) ( not ( = ?auto_27780 ?auto_27785 ) ) ( not ( = ?auto_27780 ?auto_27807 ) ) ( not ( = ?auto_27778 ?auto_27785 ) ) ( not ( = ?auto_27778 ?auto_27807 ) ) ( not ( = ?auto_27782 ?auto_27785 ) ) ( not ( = ?auto_27782 ?auto_27807 ) ) ( not ( = ?auto_27781 ?auto_27785 ) ) ( not ( = ?auto_27781 ?auto_27807 ) ) ( not ( = ?auto_27779 ?auto_27785 ) ) ( not ( = ?auto_27779 ?auto_27807 ) ) ( not ( = ?auto_27784 ?auto_27785 ) ) ( not ( = ?auto_27784 ?auto_27807 ) ) ( not ( = ?auto_27785 ?auto_27817 ) ) ( not ( = ?auto_27785 ?auto_27801 ) ) ( not ( = ?auto_27785 ?auto_27802 ) ) ( not ( = ?auto_27785 ?auto_27824 ) ) ( not ( = ?auto_27785 ?auto_27823 ) ) ( not ( = ?auto_27785 ?auto_27812 ) ) ( not ( = ?auto_27785 ?auto_27814 ) ) ( not ( = ?auto_27785 ?auto_27811 ) ) ( not ( = ?auto_27785 ?auto_27815 ) ) ( not ( = ?auto_27785 ?auto_27828 ) ) ( not ( = ?auto_27785 ?auto_27810 ) ) ( not ( = ?auto_27795 ?auto_27825 ) ) ( not ( = ?auto_27795 ?auto_27799 ) ) ( not ( = ?auto_27795 ?auto_27793 ) ) ( not ( = ?auto_27795 ?auto_27797 ) ) ( not ( = ?auto_27795 ?auto_27826 ) ) ( not ( = ?auto_27795 ?auto_27820 ) ) ( not ( = ?auto_27795 ?auto_27822 ) ) ( not ( = ?auto_27795 ?auto_27796 ) ) ( not ( = ?auto_27795 ?auto_27813 ) ) ( not ( = ?auto_27805 ?auto_27818 ) ) ( not ( = ?auto_27805 ?auto_27816 ) ) ( not ( = ?auto_27805 ?auto_27790 ) ) ( not ( = ?auto_27805 ?auto_27808 ) ) ( not ( = ?auto_27805 ?auto_27827 ) ) ( not ( = ?auto_27805 ?auto_27806 ) ) ( not ( = ?auto_27805 ?auto_27798 ) ) ( not ( = ?auto_27805 ?auto_27821 ) ) ( not ( = ?auto_27805 ?auto_27804 ) ) ( not ( = ?auto_27807 ?auto_27817 ) ) ( not ( = ?auto_27807 ?auto_27801 ) ) ( not ( = ?auto_27807 ?auto_27802 ) ) ( not ( = ?auto_27807 ?auto_27824 ) ) ( not ( = ?auto_27807 ?auto_27823 ) ) ( not ( = ?auto_27807 ?auto_27812 ) ) ( not ( = ?auto_27807 ?auto_27814 ) ) ( not ( = ?auto_27807 ?auto_27811 ) ) ( not ( = ?auto_27807 ?auto_27815 ) ) ( not ( = ?auto_27807 ?auto_27828 ) ) ( not ( = ?auto_27807 ?auto_27810 ) ) ( not ( = ?auto_27773 ?auto_27787 ) ) ( not ( = ?auto_27773 ?auto_27800 ) ) ( not ( = ?auto_27774 ?auto_27787 ) ) ( not ( = ?auto_27774 ?auto_27800 ) ) ( not ( = ?auto_27775 ?auto_27787 ) ) ( not ( = ?auto_27775 ?auto_27800 ) ) ( not ( = ?auto_27776 ?auto_27787 ) ) ( not ( = ?auto_27776 ?auto_27800 ) ) ( not ( = ?auto_27777 ?auto_27787 ) ) ( not ( = ?auto_27777 ?auto_27800 ) ) ( not ( = ?auto_27780 ?auto_27787 ) ) ( not ( = ?auto_27780 ?auto_27800 ) ) ( not ( = ?auto_27778 ?auto_27787 ) ) ( not ( = ?auto_27778 ?auto_27800 ) ) ( not ( = ?auto_27782 ?auto_27787 ) ) ( not ( = ?auto_27782 ?auto_27800 ) ) ( not ( = ?auto_27781 ?auto_27787 ) ) ( not ( = ?auto_27781 ?auto_27800 ) ) ( not ( = ?auto_27779 ?auto_27787 ) ) ( not ( = ?auto_27779 ?auto_27800 ) ) ( not ( = ?auto_27784 ?auto_27787 ) ) ( not ( = ?auto_27784 ?auto_27800 ) ) ( not ( = ?auto_27783 ?auto_27787 ) ) ( not ( = ?auto_27783 ?auto_27800 ) ) ( not ( = ?auto_27787 ?auto_27807 ) ) ( not ( = ?auto_27787 ?auto_27817 ) ) ( not ( = ?auto_27787 ?auto_27801 ) ) ( not ( = ?auto_27787 ?auto_27802 ) ) ( not ( = ?auto_27787 ?auto_27824 ) ) ( not ( = ?auto_27787 ?auto_27823 ) ) ( not ( = ?auto_27787 ?auto_27812 ) ) ( not ( = ?auto_27787 ?auto_27814 ) ) ( not ( = ?auto_27787 ?auto_27811 ) ) ( not ( = ?auto_27787 ?auto_27815 ) ) ( not ( = ?auto_27787 ?auto_27828 ) ) ( not ( = ?auto_27787 ?auto_27810 ) ) ( not ( = ?auto_27819 ?auto_27795 ) ) ( not ( = ?auto_27819 ?auto_27825 ) ) ( not ( = ?auto_27819 ?auto_27799 ) ) ( not ( = ?auto_27819 ?auto_27793 ) ) ( not ( = ?auto_27819 ?auto_27797 ) ) ( not ( = ?auto_27819 ?auto_27826 ) ) ( not ( = ?auto_27819 ?auto_27820 ) ) ( not ( = ?auto_27819 ?auto_27822 ) ) ( not ( = ?auto_27819 ?auto_27796 ) ) ( not ( = ?auto_27819 ?auto_27813 ) ) ( not ( = ?auto_27809 ?auto_27805 ) ) ( not ( = ?auto_27809 ?auto_27818 ) ) ( not ( = ?auto_27809 ?auto_27816 ) ) ( not ( = ?auto_27809 ?auto_27790 ) ) ( not ( = ?auto_27809 ?auto_27808 ) ) ( not ( = ?auto_27809 ?auto_27827 ) ) ( not ( = ?auto_27809 ?auto_27806 ) ) ( not ( = ?auto_27809 ?auto_27798 ) ) ( not ( = ?auto_27809 ?auto_27821 ) ) ( not ( = ?auto_27809 ?auto_27804 ) ) ( not ( = ?auto_27800 ?auto_27807 ) ) ( not ( = ?auto_27800 ?auto_27817 ) ) ( not ( = ?auto_27800 ?auto_27801 ) ) ( not ( = ?auto_27800 ?auto_27802 ) ) ( not ( = ?auto_27800 ?auto_27824 ) ) ( not ( = ?auto_27800 ?auto_27823 ) ) ( not ( = ?auto_27800 ?auto_27812 ) ) ( not ( = ?auto_27800 ?auto_27814 ) ) ( not ( = ?auto_27800 ?auto_27811 ) ) ( not ( = ?auto_27800 ?auto_27815 ) ) ( not ( = ?auto_27800 ?auto_27828 ) ) ( not ( = ?auto_27800 ?auto_27810 ) ) ( not ( = ?auto_27773 ?auto_27788 ) ) ( not ( = ?auto_27773 ?auto_27803 ) ) ( not ( = ?auto_27774 ?auto_27788 ) ) ( not ( = ?auto_27774 ?auto_27803 ) ) ( not ( = ?auto_27775 ?auto_27788 ) ) ( not ( = ?auto_27775 ?auto_27803 ) ) ( not ( = ?auto_27776 ?auto_27788 ) ) ( not ( = ?auto_27776 ?auto_27803 ) ) ( not ( = ?auto_27777 ?auto_27788 ) ) ( not ( = ?auto_27777 ?auto_27803 ) ) ( not ( = ?auto_27780 ?auto_27788 ) ) ( not ( = ?auto_27780 ?auto_27803 ) ) ( not ( = ?auto_27778 ?auto_27788 ) ) ( not ( = ?auto_27778 ?auto_27803 ) ) ( not ( = ?auto_27782 ?auto_27788 ) ) ( not ( = ?auto_27782 ?auto_27803 ) ) ( not ( = ?auto_27781 ?auto_27788 ) ) ( not ( = ?auto_27781 ?auto_27803 ) ) ( not ( = ?auto_27779 ?auto_27788 ) ) ( not ( = ?auto_27779 ?auto_27803 ) ) ( not ( = ?auto_27784 ?auto_27788 ) ) ( not ( = ?auto_27784 ?auto_27803 ) ) ( not ( = ?auto_27783 ?auto_27788 ) ) ( not ( = ?auto_27783 ?auto_27803 ) ) ( not ( = ?auto_27785 ?auto_27788 ) ) ( not ( = ?auto_27785 ?auto_27803 ) ) ( not ( = ?auto_27788 ?auto_27800 ) ) ( not ( = ?auto_27788 ?auto_27807 ) ) ( not ( = ?auto_27788 ?auto_27817 ) ) ( not ( = ?auto_27788 ?auto_27801 ) ) ( not ( = ?auto_27788 ?auto_27802 ) ) ( not ( = ?auto_27788 ?auto_27824 ) ) ( not ( = ?auto_27788 ?auto_27823 ) ) ( not ( = ?auto_27788 ?auto_27812 ) ) ( not ( = ?auto_27788 ?auto_27814 ) ) ( not ( = ?auto_27788 ?auto_27811 ) ) ( not ( = ?auto_27788 ?auto_27815 ) ) ( not ( = ?auto_27788 ?auto_27828 ) ) ( not ( = ?auto_27788 ?auto_27810 ) ) ( not ( = ?auto_27803 ?auto_27800 ) ) ( not ( = ?auto_27803 ?auto_27807 ) ) ( not ( = ?auto_27803 ?auto_27817 ) ) ( not ( = ?auto_27803 ?auto_27801 ) ) ( not ( = ?auto_27803 ?auto_27802 ) ) ( not ( = ?auto_27803 ?auto_27824 ) ) ( not ( = ?auto_27803 ?auto_27823 ) ) ( not ( = ?auto_27803 ?auto_27812 ) ) ( not ( = ?auto_27803 ?auto_27814 ) ) ( not ( = ?auto_27803 ?auto_27811 ) ) ( not ( = ?auto_27803 ?auto_27815 ) ) ( not ( = ?auto_27803 ?auto_27828 ) ) ( not ( = ?auto_27803 ?auto_27810 ) ) ( not ( = ?auto_27773 ?auto_27786 ) ) ( not ( = ?auto_27773 ?auto_27791 ) ) ( not ( = ?auto_27774 ?auto_27786 ) ) ( not ( = ?auto_27774 ?auto_27791 ) ) ( not ( = ?auto_27775 ?auto_27786 ) ) ( not ( = ?auto_27775 ?auto_27791 ) ) ( not ( = ?auto_27776 ?auto_27786 ) ) ( not ( = ?auto_27776 ?auto_27791 ) ) ( not ( = ?auto_27777 ?auto_27786 ) ) ( not ( = ?auto_27777 ?auto_27791 ) ) ( not ( = ?auto_27780 ?auto_27786 ) ) ( not ( = ?auto_27780 ?auto_27791 ) ) ( not ( = ?auto_27778 ?auto_27786 ) ) ( not ( = ?auto_27778 ?auto_27791 ) ) ( not ( = ?auto_27782 ?auto_27786 ) ) ( not ( = ?auto_27782 ?auto_27791 ) ) ( not ( = ?auto_27781 ?auto_27786 ) ) ( not ( = ?auto_27781 ?auto_27791 ) ) ( not ( = ?auto_27779 ?auto_27786 ) ) ( not ( = ?auto_27779 ?auto_27791 ) ) ( not ( = ?auto_27784 ?auto_27786 ) ) ( not ( = ?auto_27784 ?auto_27791 ) ) ( not ( = ?auto_27783 ?auto_27786 ) ) ( not ( = ?auto_27783 ?auto_27791 ) ) ( not ( = ?auto_27785 ?auto_27786 ) ) ( not ( = ?auto_27785 ?auto_27791 ) ) ( not ( = ?auto_27787 ?auto_27786 ) ) ( not ( = ?auto_27787 ?auto_27791 ) ) ( not ( = ?auto_27786 ?auto_27803 ) ) ( not ( = ?auto_27786 ?auto_27800 ) ) ( not ( = ?auto_27786 ?auto_27807 ) ) ( not ( = ?auto_27786 ?auto_27817 ) ) ( not ( = ?auto_27786 ?auto_27801 ) ) ( not ( = ?auto_27786 ?auto_27802 ) ) ( not ( = ?auto_27786 ?auto_27824 ) ) ( not ( = ?auto_27786 ?auto_27823 ) ) ( not ( = ?auto_27786 ?auto_27812 ) ) ( not ( = ?auto_27786 ?auto_27814 ) ) ( not ( = ?auto_27786 ?auto_27811 ) ) ( not ( = ?auto_27786 ?auto_27815 ) ) ( not ( = ?auto_27786 ?auto_27828 ) ) ( not ( = ?auto_27786 ?auto_27810 ) ) ( not ( = ?auto_27791 ?auto_27803 ) ) ( not ( = ?auto_27791 ?auto_27800 ) ) ( not ( = ?auto_27791 ?auto_27807 ) ) ( not ( = ?auto_27791 ?auto_27817 ) ) ( not ( = ?auto_27791 ?auto_27801 ) ) ( not ( = ?auto_27791 ?auto_27802 ) ) ( not ( = ?auto_27791 ?auto_27824 ) ) ( not ( = ?auto_27791 ?auto_27823 ) ) ( not ( = ?auto_27791 ?auto_27812 ) ) ( not ( = ?auto_27791 ?auto_27814 ) ) ( not ( = ?auto_27791 ?auto_27811 ) ) ( not ( = ?auto_27791 ?auto_27815 ) ) ( not ( = ?auto_27791 ?auto_27828 ) ) ( not ( = ?auto_27791 ?auto_27810 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_27773 ?auto_27774 ?auto_27775 ?auto_27776 ?auto_27777 ?auto_27780 ?auto_27778 ?auto_27782 ?auto_27781 ?auto_27779 ?auto_27784 ?auto_27783 ?auto_27785 ?auto_27787 ?auto_27788 )
      ( MAKE-1CRATE ?auto_27788 ?auto_27786 )
      ( MAKE-15CRATE-VERIFY ?auto_27773 ?auto_27774 ?auto_27775 ?auto_27776 ?auto_27777 ?auto_27780 ?auto_27778 ?auto_27782 ?auto_27781 ?auto_27779 ?auto_27784 ?auto_27783 ?auto_27785 ?auto_27787 ?auto_27788 ?auto_27786 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27831 - SURFACE
      ?auto_27832 - SURFACE
    )
    :vars
    (
      ?auto_27833 - HOIST
      ?auto_27834 - PLACE
      ?auto_27836 - PLACE
      ?auto_27837 - HOIST
      ?auto_27838 - SURFACE
      ?auto_27835 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27833 ?auto_27834 ) ( SURFACE-AT ?auto_27831 ?auto_27834 ) ( CLEAR ?auto_27831 ) ( IS-CRATE ?auto_27832 ) ( AVAILABLE ?auto_27833 ) ( not ( = ?auto_27836 ?auto_27834 ) ) ( HOIST-AT ?auto_27837 ?auto_27836 ) ( AVAILABLE ?auto_27837 ) ( SURFACE-AT ?auto_27832 ?auto_27836 ) ( ON ?auto_27832 ?auto_27838 ) ( CLEAR ?auto_27832 ) ( TRUCK-AT ?auto_27835 ?auto_27834 ) ( not ( = ?auto_27831 ?auto_27832 ) ) ( not ( = ?auto_27831 ?auto_27838 ) ) ( not ( = ?auto_27832 ?auto_27838 ) ) ( not ( = ?auto_27833 ?auto_27837 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27835 ?auto_27834 ?auto_27836 )
      ( !LIFT ?auto_27837 ?auto_27832 ?auto_27838 ?auto_27836 )
      ( !LOAD ?auto_27837 ?auto_27832 ?auto_27835 ?auto_27836 )
      ( !DRIVE ?auto_27835 ?auto_27836 ?auto_27834 )
      ( !UNLOAD ?auto_27833 ?auto_27832 ?auto_27835 ?auto_27834 )
      ( !DROP ?auto_27833 ?auto_27832 ?auto_27831 ?auto_27834 )
      ( MAKE-1CRATE-VERIFY ?auto_27831 ?auto_27832 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_27856 - SURFACE
      ?auto_27857 - SURFACE
      ?auto_27858 - SURFACE
      ?auto_27859 - SURFACE
      ?auto_27860 - SURFACE
      ?auto_27863 - SURFACE
      ?auto_27861 - SURFACE
      ?auto_27865 - SURFACE
      ?auto_27864 - SURFACE
      ?auto_27862 - SURFACE
      ?auto_27867 - SURFACE
      ?auto_27866 - SURFACE
      ?auto_27868 - SURFACE
      ?auto_27870 - SURFACE
      ?auto_27871 - SURFACE
      ?auto_27869 - SURFACE
      ?auto_27872 - SURFACE
    )
    :vars
    (
      ?auto_27878 - HOIST
      ?auto_27873 - PLACE
      ?auto_27875 - PLACE
      ?auto_27874 - HOIST
      ?auto_27876 - SURFACE
      ?auto_27913 - PLACE
      ?auto_27906 - HOIST
      ?auto_27899 - SURFACE
      ?auto_27904 - PLACE
      ?auto_27892 - HOIST
      ?auto_27879 - SURFACE
      ?auto_27885 - PLACE
      ?auto_27902 - HOIST
      ?auto_27882 - SURFACE
      ?auto_27912 - SURFACE
      ?auto_27894 - SURFACE
      ?auto_27886 - PLACE
      ?auto_27903 - HOIST
      ?auto_27910 - SURFACE
      ?auto_27881 - SURFACE
      ?auto_27887 - PLACE
      ?auto_27889 - HOIST
      ?auto_27908 - SURFACE
      ?auto_27890 - PLACE
      ?auto_27891 - HOIST
      ?auto_27900 - SURFACE
      ?auto_27896 - PLACE
      ?auto_27897 - HOIST
      ?auto_27901 - SURFACE
      ?auto_27905 - PLACE
      ?auto_27888 - HOIST
      ?auto_27883 - SURFACE
      ?auto_27911 - SURFACE
      ?auto_27880 - PLACE
      ?auto_27898 - HOIST
      ?auto_27909 - SURFACE
      ?auto_27893 - PLACE
      ?auto_27884 - HOIST
      ?auto_27907 - SURFACE
      ?auto_27895 - SURFACE
      ?auto_27877 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27878 ?auto_27873 ) ( IS-CRATE ?auto_27872 ) ( not ( = ?auto_27875 ?auto_27873 ) ) ( HOIST-AT ?auto_27874 ?auto_27875 ) ( SURFACE-AT ?auto_27872 ?auto_27875 ) ( ON ?auto_27872 ?auto_27876 ) ( CLEAR ?auto_27872 ) ( not ( = ?auto_27869 ?auto_27872 ) ) ( not ( = ?auto_27869 ?auto_27876 ) ) ( not ( = ?auto_27872 ?auto_27876 ) ) ( not ( = ?auto_27878 ?auto_27874 ) ) ( IS-CRATE ?auto_27869 ) ( not ( = ?auto_27913 ?auto_27873 ) ) ( HOIST-AT ?auto_27906 ?auto_27913 ) ( SURFACE-AT ?auto_27869 ?auto_27913 ) ( ON ?auto_27869 ?auto_27899 ) ( CLEAR ?auto_27869 ) ( not ( = ?auto_27871 ?auto_27869 ) ) ( not ( = ?auto_27871 ?auto_27899 ) ) ( not ( = ?auto_27869 ?auto_27899 ) ) ( not ( = ?auto_27878 ?auto_27906 ) ) ( IS-CRATE ?auto_27871 ) ( not ( = ?auto_27904 ?auto_27873 ) ) ( HOIST-AT ?auto_27892 ?auto_27904 ) ( SURFACE-AT ?auto_27871 ?auto_27904 ) ( ON ?auto_27871 ?auto_27879 ) ( CLEAR ?auto_27871 ) ( not ( = ?auto_27870 ?auto_27871 ) ) ( not ( = ?auto_27870 ?auto_27879 ) ) ( not ( = ?auto_27871 ?auto_27879 ) ) ( not ( = ?auto_27878 ?auto_27892 ) ) ( IS-CRATE ?auto_27870 ) ( not ( = ?auto_27885 ?auto_27873 ) ) ( HOIST-AT ?auto_27902 ?auto_27885 ) ( AVAILABLE ?auto_27902 ) ( SURFACE-AT ?auto_27870 ?auto_27885 ) ( ON ?auto_27870 ?auto_27882 ) ( CLEAR ?auto_27870 ) ( not ( = ?auto_27868 ?auto_27870 ) ) ( not ( = ?auto_27868 ?auto_27882 ) ) ( not ( = ?auto_27870 ?auto_27882 ) ) ( not ( = ?auto_27878 ?auto_27902 ) ) ( IS-CRATE ?auto_27868 ) ( AVAILABLE ?auto_27874 ) ( SURFACE-AT ?auto_27868 ?auto_27875 ) ( ON ?auto_27868 ?auto_27912 ) ( CLEAR ?auto_27868 ) ( not ( = ?auto_27866 ?auto_27868 ) ) ( not ( = ?auto_27866 ?auto_27912 ) ) ( not ( = ?auto_27868 ?auto_27912 ) ) ( IS-CRATE ?auto_27866 ) ( AVAILABLE ?auto_27892 ) ( SURFACE-AT ?auto_27866 ?auto_27904 ) ( ON ?auto_27866 ?auto_27894 ) ( CLEAR ?auto_27866 ) ( not ( = ?auto_27867 ?auto_27866 ) ) ( not ( = ?auto_27867 ?auto_27894 ) ) ( not ( = ?auto_27866 ?auto_27894 ) ) ( IS-CRATE ?auto_27867 ) ( not ( = ?auto_27886 ?auto_27873 ) ) ( HOIST-AT ?auto_27903 ?auto_27886 ) ( AVAILABLE ?auto_27903 ) ( SURFACE-AT ?auto_27867 ?auto_27886 ) ( ON ?auto_27867 ?auto_27910 ) ( CLEAR ?auto_27867 ) ( not ( = ?auto_27862 ?auto_27867 ) ) ( not ( = ?auto_27862 ?auto_27910 ) ) ( not ( = ?auto_27867 ?auto_27910 ) ) ( not ( = ?auto_27878 ?auto_27903 ) ) ( IS-CRATE ?auto_27862 ) ( SURFACE-AT ?auto_27862 ?auto_27913 ) ( ON ?auto_27862 ?auto_27881 ) ( CLEAR ?auto_27862 ) ( not ( = ?auto_27864 ?auto_27862 ) ) ( not ( = ?auto_27864 ?auto_27881 ) ) ( not ( = ?auto_27862 ?auto_27881 ) ) ( IS-CRATE ?auto_27864 ) ( not ( = ?auto_27887 ?auto_27873 ) ) ( HOIST-AT ?auto_27889 ?auto_27887 ) ( AVAILABLE ?auto_27889 ) ( SURFACE-AT ?auto_27864 ?auto_27887 ) ( ON ?auto_27864 ?auto_27908 ) ( CLEAR ?auto_27864 ) ( not ( = ?auto_27865 ?auto_27864 ) ) ( not ( = ?auto_27865 ?auto_27908 ) ) ( not ( = ?auto_27864 ?auto_27908 ) ) ( not ( = ?auto_27878 ?auto_27889 ) ) ( IS-CRATE ?auto_27865 ) ( not ( = ?auto_27890 ?auto_27873 ) ) ( HOIST-AT ?auto_27891 ?auto_27890 ) ( SURFACE-AT ?auto_27865 ?auto_27890 ) ( ON ?auto_27865 ?auto_27900 ) ( CLEAR ?auto_27865 ) ( not ( = ?auto_27861 ?auto_27865 ) ) ( not ( = ?auto_27861 ?auto_27900 ) ) ( not ( = ?auto_27865 ?auto_27900 ) ) ( not ( = ?auto_27878 ?auto_27891 ) ) ( IS-CRATE ?auto_27861 ) ( not ( = ?auto_27896 ?auto_27873 ) ) ( HOIST-AT ?auto_27897 ?auto_27896 ) ( AVAILABLE ?auto_27897 ) ( SURFACE-AT ?auto_27861 ?auto_27896 ) ( ON ?auto_27861 ?auto_27901 ) ( CLEAR ?auto_27861 ) ( not ( = ?auto_27863 ?auto_27861 ) ) ( not ( = ?auto_27863 ?auto_27901 ) ) ( not ( = ?auto_27861 ?auto_27901 ) ) ( not ( = ?auto_27878 ?auto_27897 ) ) ( IS-CRATE ?auto_27863 ) ( not ( = ?auto_27905 ?auto_27873 ) ) ( HOIST-AT ?auto_27888 ?auto_27905 ) ( AVAILABLE ?auto_27888 ) ( SURFACE-AT ?auto_27863 ?auto_27905 ) ( ON ?auto_27863 ?auto_27883 ) ( CLEAR ?auto_27863 ) ( not ( = ?auto_27860 ?auto_27863 ) ) ( not ( = ?auto_27860 ?auto_27883 ) ) ( not ( = ?auto_27863 ?auto_27883 ) ) ( not ( = ?auto_27878 ?auto_27888 ) ) ( IS-CRATE ?auto_27860 ) ( AVAILABLE ?auto_27906 ) ( SURFACE-AT ?auto_27860 ?auto_27913 ) ( ON ?auto_27860 ?auto_27911 ) ( CLEAR ?auto_27860 ) ( not ( = ?auto_27859 ?auto_27860 ) ) ( not ( = ?auto_27859 ?auto_27911 ) ) ( not ( = ?auto_27860 ?auto_27911 ) ) ( IS-CRATE ?auto_27859 ) ( not ( = ?auto_27880 ?auto_27873 ) ) ( HOIST-AT ?auto_27898 ?auto_27880 ) ( AVAILABLE ?auto_27898 ) ( SURFACE-AT ?auto_27859 ?auto_27880 ) ( ON ?auto_27859 ?auto_27909 ) ( CLEAR ?auto_27859 ) ( not ( = ?auto_27858 ?auto_27859 ) ) ( not ( = ?auto_27858 ?auto_27909 ) ) ( not ( = ?auto_27859 ?auto_27909 ) ) ( not ( = ?auto_27878 ?auto_27898 ) ) ( IS-CRATE ?auto_27858 ) ( not ( = ?auto_27893 ?auto_27873 ) ) ( HOIST-AT ?auto_27884 ?auto_27893 ) ( AVAILABLE ?auto_27884 ) ( SURFACE-AT ?auto_27858 ?auto_27893 ) ( ON ?auto_27858 ?auto_27907 ) ( CLEAR ?auto_27858 ) ( not ( = ?auto_27857 ?auto_27858 ) ) ( not ( = ?auto_27857 ?auto_27907 ) ) ( not ( = ?auto_27858 ?auto_27907 ) ) ( not ( = ?auto_27878 ?auto_27884 ) ) ( SURFACE-AT ?auto_27856 ?auto_27873 ) ( CLEAR ?auto_27856 ) ( IS-CRATE ?auto_27857 ) ( AVAILABLE ?auto_27878 ) ( AVAILABLE ?auto_27891 ) ( SURFACE-AT ?auto_27857 ?auto_27890 ) ( ON ?auto_27857 ?auto_27895 ) ( CLEAR ?auto_27857 ) ( TRUCK-AT ?auto_27877 ?auto_27873 ) ( not ( = ?auto_27856 ?auto_27857 ) ) ( not ( = ?auto_27856 ?auto_27895 ) ) ( not ( = ?auto_27857 ?auto_27895 ) ) ( not ( = ?auto_27856 ?auto_27858 ) ) ( not ( = ?auto_27856 ?auto_27907 ) ) ( not ( = ?auto_27858 ?auto_27895 ) ) ( not ( = ?auto_27893 ?auto_27890 ) ) ( not ( = ?auto_27884 ?auto_27891 ) ) ( not ( = ?auto_27907 ?auto_27895 ) ) ( not ( = ?auto_27856 ?auto_27859 ) ) ( not ( = ?auto_27856 ?auto_27909 ) ) ( not ( = ?auto_27857 ?auto_27859 ) ) ( not ( = ?auto_27857 ?auto_27909 ) ) ( not ( = ?auto_27859 ?auto_27907 ) ) ( not ( = ?auto_27859 ?auto_27895 ) ) ( not ( = ?auto_27880 ?auto_27893 ) ) ( not ( = ?auto_27880 ?auto_27890 ) ) ( not ( = ?auto_27898 ?auto_27884 ) ) ( not ( = ?auto_27898 ?auto_27891 ) ) ( not ( = ?auto_27909 ?auto_27907 ) ) ( not ( = ?auto_27909 ?auto_27895 ) ) ( not ( = ?auto_27856 ?auto_27860 ) ) ( not ( = ?auto_27856 ?auto_27911 ) ) ( not ( = ?auto_27857 ?auto_27860 ) ) ( not ( = ?auto_27857 ?auto_27911 ) ) ( not ( = ?auto_27858 ?auto_27860 ) ) ( not ( = ?auto_27858 ?auto_27911 ) ) ( not ( = ?auto_27860 ?auto_27909 ) ) ( not ( = ?auto_27860 ?auto_27907 ) ) ( not ( = ?auto_27860 ?auto_27895 ) ) ( not ( = ?auto_27913 ?auto_27880 ) ) ( not ( = ?auto_27913 ?auto_27893 ) ) ( not ( = ?auto_27913 ?auto_27890 ) ) ( not ( = ?auto_27906 ?auto_27898 ) ) ( not ( = ?auto_27906 ?auto_27884 ) ) ( not ( = ?auto_27906 ?auto_27891 ) ) ( not ( = ?auto_27911 ?auto_27909 ) ) ( not ( = ?auto_27911 ?auto_27907 ) ) ( not ( = ?auto_27911 ?auto_27895 ) ) ( not ( = ?auto_27856 ?auto_27863 ) ) ( not ( = ?auto_27856 ?auto_27883 ) ) ( not ( = ?auto_27857 ?auto_27863 ) ) ( not ( = ?auto_27857 ?auto_27883 ) ) ( not ( = ?auto_27858 ?auto_27863 ) ) ( not ( = ?auto_27858 ?auto_27883 ) ) ( not ( = ?auto_27859 ?auto_27863 ) ) ( not ( = ?auto_27859 ?auto_27883 ) ) ( not ( = ?auto_27863 ?auto_27911 ) ) ( not ( = ?auto_27863 ?auto_27909 ) ) ( not ( = ?auto_27863 ?auto_27907 ) ) ( not ( = ?auto_27863 ?auto_27895 ) ) ( not ( = ?auto_27905 ?auto_27913 ) ) ( not ( = ?auto_27905 ?auto_27880 ) ) ( not ( = ?auto_27905 ?auto_27893 ) ) ( not ( = ?auto_27905 ?auto_27890 ) ) ( not ( = ?auto_27888 ?auto_27906 ) ) ( not ( = ?auto_27888 ?auto_27898 ) ) ( not ( = ?auto_27888 ?auto_27884 ) ) ( not ( = ?auto_27888 ?auto_27891 ) ) ( not ( = ?auto_27883 ?auto_27911 ) ) ( not ( = ?auto_27883 ?auto_27909 ) ) ( not ( = ?auto_27883 ?auto_27907 ) ) ( not ( = ?auto_27883 ?auto_27895 ) ) ( not ( = ?auto_27856 ?auto_27861 ) ) ( not ( = ?auto_27856 ?auto_27901 ) ) ( not ( = ?auto_27857 ?auto_27861 ) ) ( not ( = ?auto_27857 ?auto_27901 ) ) ( not ( = ?auto_27858 ?auto_27861 ) ) ( not ( = ?auto_27858 ?auto_27901 ) ) ( not ( = ?auto_27859 ?auto_27861 ) ) ( not ( = ?auto_27859 ?auto_27901 ) ) ( not ( = ?auto_27860 ?auto_27861 ) ) ( not ( = ?auto_27860 ?auto_27901 ) ) ( not ( = ?auto_27861 ?auto_27883 ) ) ( not ( = ?auto_27861 ?auto_27911 ) ) ( not ( = ?auto_27861 ?auto_27909 ) ) ( not ( = ?auto_27861 ?auto_27907 ) ) ( not ( = ?auto_27861 ?auto_27895 ) ) ( not ( = ?auto_27896 ?auto_27905 ) ) ( not ( = ?auto_27896 ?auto_27913 ) ) ( not ( = ?auto_27896 ?auto_27880 ) ) ( not ( = ?auto_27896 ?auto_27893 ) ) ( not ( = ?auto_27896 ?auto_27890 ) ) ( not ( = ?auto_27897 ?auto_27888 ) ) ( not ( = ?auto_27897 ?auto_27906 ) ) ( not ( = ?auto_27897 ?auto_27898 ) ) ( not ( = ?auto_27897 ?auto_27884 ) ) ( not ( = ?auto_27897 ?auto_27891 ) ) ( not ( = ?auto_27901 ?auto_27883 ) ) ( not ( = ?auto_27901 ?auto_27911 ) ) ( not ( = ?auto_27901 ?auto_27909 ) ) ( not ( = ?auto_27901 ?auto_27907 ) ) ( not ( = ?auto_27901 ?auto_27895 ) ) ( not ( = ?auto_27856 ?auto_27865 ) ) ( not ( = ?auto_27856 ?auto_27900 ) ) ( not ( = ?auto_27857 ?auto_27865 ) ) ( not ( = ?auto_27857 ?auto_27900 ) ) ( not ( = ?auto_27858 ?auto_27865 ) ) ( not ( = ?auto_27858 ?auto_27900 ) ) ( not ( = ?auto_27859 ?auto_27865 ) ) ( not ( = ?auto_27859 ?auto_27900 ) ) ( not ( = ?auto_27860 ?auto_27865 ) ) ( not ( = ?auto_27860 ?auto_27900 ) ) ( not ( = ?auto_27863 ?auto_27865 ) ) ( not ( = ?auto_27863 ?auto_27900 ) ) ( not ( = ?auto_27865 ?auto_27901 ) ) ( not ( = ?auto_27865 ?auto_27883 ) ) ( not ( = ?auto_27865 ?auto_27911 ) ) ( not ( = ?auto_27865 ?auto_27909 ) ) ( not ( = ?auto_27865 ?auto_27907 ) ) ( not ( = ?auto_27865 ?auto_27895 ) ) ( not ( = ?auto_27900 ?auto_27901 ) ) ( not ( = ?auto_27900 ?auto_27883 ) ) ( not ( = ?auto_27900 ?auto_27911 ) ) ( not ( = ?auto_27900 ?auto_27909 ) ) ( not ( = ?auto_27900 ?auto_27907 ) ) ( not ( = ?auto_27900 ?auto_27895 ) ) ( not ( = ?auto_27856 ?auto_27864 ) ) ( not ( = ?auto_27856 ?auto_27908 ) ) ( not ( = ?auto_27857 ?auto_27864 ) ) ( not ( = ?auto_27857 ?auto_27908 ) ) ( not ( = ?auto_27858 ?auto_27864 ) ) ( not ( = ?auto_27858 ?auto_27908 ) ) ( not ( = ?auto_27859 ?auto_27864 ) ) ( not ( = ?auto_27859 ?auto_27908 ) ) ( not ( = ?auto_27860 ?auto_27864 ) ) ( not ( = ?auto_27860 ?auto_27908 ) ) ( not ( = ?auto_27863 ?auto_27864 ) ) ( not ( = ?auto_27863 ?auto_27908 ) ) ( not ( = ?auto_27861 ?auto_27864 ) ) ( not ( = ?auto_27861 ?auto_27908 ) ) ( not ( = ?auto_27864 ?auto_27900 ) ) ( not ( = ?auto_27864 ?auto_27901 ) ) ( not ( = ?auto_27864 ?auto_27883 ) ) ( not ( = ?auto_27864 ?auto_27911 ) ) ( not ( = ?auto_27864 ?auto_27909 ) ) ( not ( = ?auto_27864 ?auto_27907 ) ) ( not ( = ?auto_27864 ?auto_27895 ) ) ( not ( = ?auto_27887 ?auto_27890 ) ) ( not ( = ?auto_27887 ?auto_27896 ) ) ( not ( = ?auto_27887 ?auto_27905 ) ) ( not ( = ?auto_27887 ?auto_27913 ) ) ( not ( = ?auto_27887 ?auto_27880 ) ) ( not ( = ?auto_27887 ?auto_27893 ) ) ( not ( = ?auto_27889 ?auto_27891 ) ) ( not ( = ?auto_27889 ?auto_27897 ) ) ( not ( = ?auto_27889 ?auto_27888 ) ) ( not ( = ?auto_27889 ?auto_27906 ) ) ( not ( = ?auto_27889 ?auto_27898 ) ) ( not ( = ?auto_27889 ?auto_27884 ) ) ( not ( = ?auto_27908 ?auto_27900 ) ) ( not ( = ?auto_27908 ?auto_27901 ) ) ( not ( = ?auto_27908 ?auto_27883 ) ) ( not ( = ?auto_27908 ?auto_27911 ) ) ( not ( = ?auto_27908 ?auto_27909 ) ) ( not ( = ?auto_27908 ?auto_27907 ) ) ( not ( = ?auto_27908 ?auto_27895 ) ) ( not ( = ?auto_27856 ?auto_27862 ) ) ( not ( = ?auto_27856 ?auto_27881 ) ) ( not ( = ?auto_27857 ?auto_27862 ) ) ( not ( = ?auto_27857 ?auto_27881 ) ) ( not ( = ?auto_27858 ?auto_27862 ) ) ( not ( = ?auto_27858 ?auto_27881 ) ) ( not ( = ?auto_27859 ?auto_27862 ) ) ( not ( = ?auto_27859 ?auto_27881 ) ) ( not ( = ?auto_27860 ?auto_27862 ) ) ( not ( = ?auto_27860 ?auto_27881 ) ) ( not ( = ?auto_27863 ?auto_27862 ) ) ( not ( = ?auto_27863 ?auto_27881 ) ) ( not ( = ?auto_27861 ?auto_27862 ) ) ( not ( = ?auto_27861 ?auto_27881 ) ) ( not ( = ?auto_27865 ?auto_27862 ) ) ( not ( = ?auto_27865 ?auto_27881 ) ) ( not ( = ?auto_27862 ?auto_27908 ) ) ( not ( = ?auto_27862 ?auto_27900 ) ) ( not ( = ?auto_27862 ?auto_27901 ) ) ( not ( = ?auto_27862 ?auto_27883 ) ) ( not ( = ?auto_27862 ?auto_27911 ) ) ( not ( = ?auto_27862 ?auto_27909 ) ) ( not ( = ?auto_27862 ?auto_27907 ) ) ( not ( = ?auto_27862 ?auto_27895 ) ) ( not ( = ?auto_27881 ?auto_27908 ) ) ( not ( = ?auto_27881 ?auto_27900 ) ) ( not ( = ?auto_27881 ?auto_27901 ) ) ( not ( = ?auto_27881 ?auto_27883 ) ) ( not ( = ?auto_27881 ?auto_27911 ) ) ( not ( = ?auto_27881 ?auto_27909 ) ) ( not ( = ?auto_27881 ?auto_27907 ) ) ( not ( = ?auto_27881 ?auto_27895 ) ) ( not ( = ?auto_27856 ?auto_27867 ) ) ( not ( = ?auto_27856 ?auto_27910 ) ) ( not ( = ?auto_27857 ?auto_27867 ) ) ( not ( = ?auto_27857 ?auto_27910 ) ) ( not ( = ?auto_27858 ?auto_27867 ) ) ( not ( = ?auto_27858 ?auto_27910 ) ) ( not ( = ?auto_27859 ?auto_27867 ) ) ( not ( = ?auto_27859 ?auto_27910 ) ) ( not ( = ?auto_27860 ?auto_27867 ) ) ( not ( = ?auto_27860 ?auto_27910 ) ) ( not ( = ?auto_27863 ?auto_27867 ) ) ( not ( = ?auto_27863 ?auto_27910 ) ) ( not ( = ?auto_27861 ?auto_27867 ) ) ( not ( = ?auto_27861 ?auto_27910 ) ) ( not ( = ?auto_27865 ?auto_27867 ) ) ( not ( = ?auto_27865 ?auto_27910 ) ) ( not ( = ?auto_27864 ?auto_27867 ) ) ( not ( = ?auto_27864 ?auto_27910 ) ) ( not ( = ?auto_27867 ?auto_27881 ) ) ( not ( = ?auto_27867 ?auto_27908 ) ) ( not ( = ?auto_27867 ?auto_27900 ) ) ( not ( = ?auto_27867 ?auto_27901 ) ) ( not ( = ?auto_27867 ?auto_27883 ) ) ( not ( = ?auto_27867 ?auto_27911 ) ) ( not ( = ?auto_27867 ?auto_27909 ) ) ( not ( = ?auto_27867 ?auto_27907 ) ) ( not ( = ?auto_27867 ?auto_27895 ) ) ( not ( = ?auto_27886 ?auto_27913 ) ) ( not ( = ?auto_27886 ?auto_27887 ) ) ( not ( = ?auto_27886 ?auto_27890 ) ) ( not ( = ?auto_27886 ?auto_27896 ) ) ( not ( = ?auto_27886 ?auto_27905 ) ) ( not ( = ?auto_27886 ?auto_27880 ) ) ( not ( = ?auto_27886 ?auto_27893 ) ) ( not ( = ?auto_27903 ?auto_27906 ) ) ( not ( = ?auto_27903 ?auto_27889 ) ) ( not ( = ?auto_27903 ?auto_27891 ) ) ( not ( = ?auto_27903 ?auto_27897 ) ) ( not ( = ?auto_27903 ?auto_27888 ) ) ( not ( = ?auto_27903 ?auto_27898 ) ) ( not ( = ?auto_27903 ?auto_27884 ) ) ( not ( = ?auto_27910 ?auto_27881 ) ) ( not ( = ?auto_27910 ?auto_27908 ) ) ( not ( = ?auto_27910 ?auto_27900 ) ) ( not ( = ?auto_27910 ?auto_27901 ) ) ( not ( = ?auto_27910 ?auto_27883 ) ) ( not ( = ?auto_27910 ?auto_27911 ) ) ( not ( = ?auto_27910 ?auto_27909 ) ) ( not ( = ?auto_27910 ?auto_27907 ) ) ( not ( = ?auto_27910 ?auto_27895 ) ) ( not ( = ?auto_27856 ?auto_27866 ) ) ( not ( = ?auto_27856 ?auto_27894 ) ) ( not ( = ?auto_27857 ?auto_27866 ) ) ( not ( = ?auto_27857 ?auto_27894 ) ) ( not ( = ?auto_27858 ?auto_27866 ) ) ( not ( = ?auto_27858 ?auto_27894 ) ) ( not ( = ?auto_27859 ?auto_27866 ) ) ( not ( = ?auto_27859 ?auto_27894 ) ) ( not ( = ?auto_27860 ?auto_27866 ) ) ( not ( = ?auto_27860 ?auto_27894 ) ) ( not ( = ?auto_27863 ?auto_27866 ) ) ( not ( = ?auto_27863 ?auto_27894 ) ) ( not ( = ?auto_27861 ?auto_27866 ) ) ( not ( = ?auto_27861 ?auto_27894 ) ) ( not ( = ?auto_27865 ?auto_27866 ) ) ( not ( = ?auto_27865 ?auto_27894 ) ) ( not ( = ?auto_27864 ?auto_27866 ) ) ( not ( = ?auto_27864 ?auto_27894 ) ) ( not ( = ?auto_27862 ?auto_27866 ) ) ( not ( = ?auto_27862 ?auto_27894 ) ) ( not ( = ?auto_27866 ?auto_27910 ) ) ( not ( = ?auto_27866 ?auto_27881 ) ) ( not ( = ?auto_27866 ?auto_27908 ) ) ( not ( = ?auto_27866 ?auto_27900 ) ) ( not ( = ?auto_27866 ?auto_27901 ) ) ( not ( = ?auto_27866 ?auto_27883 ) ) ( not ( = ?auto_27866 ?auto_27911 ) ) ( not ( = ?auto_27866 ?auto_27909 ) ) ( not ( = ?auto_27866 ?auto_27907 ) ) ( not ( = ?auto_27866 ?auto_27895 ) ) ( not ( = ?auto_27904 ?auto_27886 ) ) ( not ( = ?auto_27904 ?auto_27913 ) ) ( not ( = ?auto_27904 ?auto_27887 ) ) ( not ( = ?auto_27904 ?auto_27890 ) ) ( not ( = ?auto_27904 ?auto_27896 ) ) ( not ( = ?auto_27904 ?auto_27905 ) ) ( not ( = ?auto_27904 ?auto_27880 ) ) ( not ( = ?auto_27904 ?auto_27893 ) ) ( not ( = ?auto_27892 ?auto_27903 ) ) ( not ( = ?auto_27892 ?auto_27906 ) ) ( not ( = ?auto_27892 ?auto_27889 ) ) ( not ( = ?auto_27892 ?auto_27891 ) ) ( not ( = ?auto_27892 ?auto_27897 ) ) ( not ( = ?auto_27892 ?auto_27888 ) ) ( not ( = ?auto_27892 ?auto_27898 ) ) ( not ( = ?auto_27892 ?auto_27884 ) ) ( not ( = ?auto_27894 ?auto_27910 ) ) ( not ( = ?auto_27894 ?auto_27881 ) ) ( not ( = ?auto_27894 ?auto_27908 ) ) ( not ( = ?auto_27894 ?auto_27900 ) ) ( not ( = ?auto_27894 ?auto_27901 ) ) ( not ( = ?auto_27894 ?auto_27883 ) ) ( not ( = ?auto_27894 ?auto_27911 ) ) ( not ( = ?auto_27894 ?auto_27909 ) ) ( not ( = ?auto_27894 ?auto_27907 ) ) ( not ( = ?auto_27894 ?auto_27895 ) ) ( not ( = ?auto_27856 ?auto_27868 ) ) ( not ( = ?auto_27856 ?auto_27912 ) ) ( not ( = ?auto_27857 ?auto_27868 ) ) ( not ( = ?auto_27857 ?auto_27912 ) ) ( not ( = ?auto_27858 ?auto_27868 ) ) ( not ( = ?auto_27858 ?auto_27912 ) ) ( not ( = ?auto_27859 ?auto_27868 ) ) ( not ( = ?auto_27859 ?auto_27912 ) ) ( not ( = ?auto_27860 ?auto_27868 ) ) ( not ( = ?auto_27860 ?auto_27912 ) ) ( not ( = ?auto_27863 ?auto_27868 ) ) ( not ( = ?auto_27863 ?auto_27912 ) ) ( not ( = ?auto_27861 ?auto_27868 ) ) ( not ( = ?auto_27861 ?auto_27912 ) ) ( not ( = ?auto_27865 ?auto_27868 ) ) ( not ( = ?auto_27865 ?auto_27912 ) ) ( not ( = ?auto_27864 ?auto_27868 ) ) ( not ( = ?auto_27864 ?auto_27912 ) ) ( not ( = ?auto_27862 ?auto_27868 ) ) ( not ( = ?auto_27862 ?auto_27912 ) ) ( not ( = ?auto_27867 ?auto_27868 ) ) ( not ( = ?auto_27867 ?auto_27912 ) ) ( not ( = ?auto_27868 ?auto_27894 ) ) ( not ( = ?auto_27868 ?auto_27910 ) ) ( not ( = ?auto_27868 ?auto_27881 ) ) ( not ( = ?auto_27868 ?auto_27908 ) ) ( not ( = ?auto_27868 ?auto_27900 ) ) ( not ( = ?auto_27868 ?auto_27901 ) ) ( not ( = ?auto_27868 ?auto_27883 ) ) ( not ( = ?auto_27868 ?auto_27911 ) ) ( not ( = ?auto_27868 ?auto_27909 ) ) ( not ( = ?auto_27868 ?auto_27907 ) ) ( not ( = ?auto_27868 ?auto_27895 ) ) ( not ( = ?auto_27875 ?auto_27904 ) ) ( not ( = ?auto_27875 ?auto_27886 ) ) ( not ( = ?auto_27875 ?auto_27913 ) ) ( not ( = ?auto_27875 ?auto_27887 ) ) ( not ( = ?auto_27875 ?auto_27890 ) ) ( not ( = ?auto_27875 ?auto_27896 ) ) ( not ( = ?auto_27875 ?auto_27905 ) ) ( not ( = ?auto_27875 ?auto_27880 ) ) ( not ( = ?auto_27875 ?auto_27893 ) ) ( not ( = ?auto_27874 ?auto_27892 ) ) ( not ( = ?auto_27874 ?auto_27903 ) ) ( not ( = ?auto_27874 ?auto_27906 ) ) ( not ( = ?auto_27874 ?auto_27889 ) ) ( not ( = ?auto_27874 ?auto_27891 ) ) ( not ( = ?auto_27874 ?auto_27897 ) ) ( not ( = ?auto_27874 ?auto_27888 ) ) ( not ( = ?auto_27874 ?auto_27898 ) ) ( not ( = ?auto_27874 ?auto_27884 ) ) ( not ( = ?auto_27912 ?auto_27894 ) ) ( not ( = ?auto_27912 ?auto_27910 ) ) ( not ( = ?auto_27912 ?auto_27881 ) ) ( not ( = ?auto_27912 ?auto_27908 ) ) ( not ( = ?auto_27912 ?auto_27900 ) ) ( not ( = ?auto_27912 ?auto_27901 ) ) ( not ( = ?auto_27912 ?auto_27883 ) ) ( not ( = ?auto_27912 ?auto_27911 ) ) ( not ( = ?auto_27912 ?auto_27909 ) ) ( not ( = ?auto_27912 ?auto_27907 ) ) ( not ( = ?auto_27912 ?auto_27895 ) ) ( not ( = ?auto_27856 ?auto_27870 ) ) ( not ( = ?auto_27856 ?auto_27882 ) ) ( not ( = ?auto_27857 ?auto_27870 ) ) ( not ( = ?auto_27857 ?auto_27882 ) ) ( not ( = ?auto_27858 ?auto_27870 ) ) ( not ( = ?auto_27858 ?auto_27882 ) ) ( not ( = ?auto_27859 ?auto_27870 ) ) ( not ( = ?auto_27859 ?auto_27882 ) ) ( not ( = ?auto_27860 ?auto_27870 ) ) ( not ( = ?auto_27860 ?auto_27882 ) ) ( not ( = ?auto_27863 ?auto_27870 ) ) ( not ( = ?auto_27863 ?auto_27882 ) ) ( not ( = ?auto_27861 ?auto_27870 ) ) ( not ( = ?auto_27861 ?auto_27882 ) ) ( not ( = ?auto_27865 ?auto_27870 ) ) ( not ( = ?auto_27865 ?auto_27882 ) ) ( not ( = ?auto_27864 ?auto_27870 ) ) ( not ( = ?auto_27864 ?auto_27882 ) ) ( not ( = ?auto_27862 ?auto_27870 ) ) ( not ( = ?auto_27862 ?auto_27882 ) ) ( not ( = ?auto_27867 ?auto_27870 ) ) ( not ( = ?auto_27867 ?auto_27882 ) ) ( not ( = ?auto_27866 ?auto_27870 ) ) ( not ( = ?auto_27866 ?auto_27882 ) ) ( not ( = ?auto_27870 ?auto_27912 ) ) ( not ( = ?auto_27870 ?auto_27894 ) ) ( not ( = ?auto_27870 ?auto_27910 ) ) ( not ( = ?auto_27870 ?auto_27881 ) ) ( not ( = ?auto_27870 ?auto_27908 ) ) ( not ( = ?auto_27870 ?auto_27900 ) ) ( not ( = ?auto_27870 ?auto_27901 ) ) ( not ( = ?auto_27870 ?auto_27883 ) ) ( not ( = ?auto_27870 ?auto_27911 ) ) ( not ( = ?auto_27870 ?auto_27909 ) ) ( not ( = ?auto_27870 ?auto_27907 ) ) ( not ( = ?auto_27870 ?auto_27895 ) ) ( not ( = ?auto_27885 ?auto_27875 ) ) ( not ( = ?auto_27885 ?auto_27904 ) ) ( not ( = ?auto_27885 ?auto_27886 ) ) ( not ( = ?auto_27885 ?auto_27913 ) ) ( not ( = ?auto_27885 ?auto_27887 ) ) ( not ( = ?auto_27885 ?auto_27890 ) ) ( not ( = ?auto_27885 ?auto_27896 ) ) ( not ( = ?auto_27885 ?auto_27905 ) ) ( not ( = ?auto_27885 ?auto_27880 ) ) ( not ( = ?auto_27885 ?auto_27893 ) ) ( not ( = ?auto_27902 ?auto_27874 ) ) ( not ( = ?auto_27902 ?auto_27892 ) ) ( not ( = ?auto_27902 ?auto_27903 ) ) ( not ( = ?auto_27902 ?auto_27906 ) ) ( not ( = ?auto_27902 ?auto_27889 ) ) ( not ( = ?auto_27902 ?auto_27891 ) ) ( not ( = ?auto_27902 ?auto_27897 ) ) ( not ( = ?auto_27902 ?auto_27888 ) ) ( not ( = ?auto_27902 ?auto_27898 ) ) ( not ( = ?auto_27902 ?auto_27884 ) ) ( not ( = ?auto_27882 ?auto_27912 ) ) ( not ( = ?auto_27882 ?auto_27894 ) ) ( not ( = ?auto_27882 ?auto_27910 ) ) ( not ( = ?auto_27882 ?auto_27881 ) ) ( not ( = ?auto_27882 ?auto_27908 ) ) ( not ( = ?auto_27882 ?auto_27900 ) ) ( not ( = ?auto_27882 ?auto_27901 ) ) ( not ( = ?auto_27882 ?auto_27883 ) ) ( not ( = ?auto_27882 ?auto_27911 ) ) ( not ( = ?auto_27882 ?auto_27909 ) ) ( not ( = ?auto_27882 ?auto_27907 ) ) ( not ( = ?auto_27882 ?auto_27895 ) ) ( not ( = ?auto_27856 ?auto_27871 ) ) ( not ( = ?auto_27856 ?auto_27879 ) ) ( not ( = ?auto_27857 ?auto_27871 ) ) ( not ( = ?auto_27857 ?auto_27879 ) ) ( not ( = ?auto_27858 ?auto_27871 ) ) ( not ( = ?auto_27858 ?auto_27879 ) ) ( not ( = ?auto_27859 ?auto_27871 ) ) ( not ( = ?auto_27859 ?auto_27879 ) ) ( not ( = ?auto_27860 ?auto_27871 ) ) ( not ( = ?auto_27860 ?auto_27879 ) ) ( not ( = ?auto_27863 ?auto_27871 ) ) ( not ( = ?auto_27863 ?auto_27879 ) ) ( not ( = ?auto_27861 ?auto_27871 ) ) ( not ( = ?auto_27861 ?auto_27879 ) ) ( not ( = ?auto_27865 ?auto_27871 ) ) ( not ( = ?auto_27865 ?auto_27879 ) ) ( not ( = ?auto_27864 ?auto_27871 ) ) ( not ( = ?auto_27864 ?auto_27879 ) ) ( not ( = ?auto_27862 ?auto_27871 ) ) ( not ( = ?auto_27862 ?auto_27879 ) ) ( not ( = ?auto_27867 ?auto_27871 ) ) ( not ( = ?auto_27867 ?auto_27879 ) ) ( not ( = ?auto_27866 ?auto_27871 ) ) ( not ( = ?auto_27866 ?auto_27879 ) ) ( not ( = ?auto_27868 ?auto_27871 ) ) ( not ( = ?auto_27868 ?auto_27879 ) ) ( not ( = ?auto_27871 ?auto_27882 ) ) ( not ( = ?auto_27871 ?auto_27912 ) ) ( not ( = ?auto_27871 ?auto_27894 ) ) ( not ( = ?auto_27871 ?auto_27910 ) ) ( not ( = ?auto_27871 ?auto_27881 ) ) ( not ( = ?auto_27871 ?auto_27908 ) ) ( not ( = ?auto_27871 ?auto_27900 ) ) ( not ( = ?auto_27871 ?auto_27901 ) ) ( not ( = ?auto_27871 ?auto_27883 ) ) ( not ( = ?auto_27871 ?auto_27911 ) ) ( not ( = ?auto_27871 ?auto_27909 ) ) ( not ( = ?auto_27871 ?auto_27907 ) ) ( not ( = ?auto_27871 ?auto_27895 ) ) ( not ( = ?auto_27879 ?auto_27882 ) ) ( not ( = ?auto_27879 ?auto_27912 ) ) ( not ( = ?auto_27879 ?auto_27894 ) ) ( not ( = ?auto_27879 ?auto_27910 ) ) ( not ( = ?auto_27879 ?auto_27881 ) ) ( not ( = ?auto_27879 ?auto_27908 ) ) ( not ( = ?auto_27879 ?auto_27900 ) ) ( not ( = ?auto_27879 ?auto_27901 ) ) ( not ( = ?auto_27879 ?auto_27883 ) ) ( not ( = ?auto_27879 ?auto_27911 ) ) ( not ( = ?auto_27879 ?auto_27909 ) ) ( not ( = ?auto_27879 ?auto_27907 ) ) ( not ( = ?auto_27879 ?auto_27895 ) ) ( not ( = ?auto_27856 ?auto_27869 ) ) ( not ( = ?auto_27856 ?auto_27899 ) ) ( not ( = ?auto_27857 ?auto_27869 ) ) ( not ( = ?auto_27857 ?auto_27899 ) ) ( not ( = ?auto_27858 ?auto_27869 ) ) ( not ( = ?auto_27858 ?auto_27899 ) ) ( not ( = ?auto_27859 ?auto_27869 ) ) ( not ( = ?auto_27859 ?auto_27899 ) ) ( not ( = ?auto_27860 ?auto_27869 ) ) ( not ( = ?auto_27860 ?auto_27899 ) ) ( not ( = ?auto_27863 ?auto_27869 ) ) ( not ( = ?auto_27863 ?auto_27899 ) ) ( not ( = ?auto_27861 ?auto_27869 ) ) ( not ( = ?auto_27861 ?auto_27899 ) ) ( not ( = ?auto_27865 ?auto_27869 ) ) ( not ( = ?auto_27865 ?auto_27899 ) ) ( not ( = ?auto_27864 ?auto_27869 ) ) ( not ( = ?auto_27864 ?auto_27899 ) ) ( not ( = ?auto_27862 ?auto_27869 ) ) ( not ( = ?auto_27862 ?auto_27899 ) ) ( not ( = ?auto_27867 ?auto_27869 ) ) ( not ( = ?auto_27867 ?auto_27899 ) ) ( not ( = ?auto_27866 ?auto_27869 ) ) ( not ( = ?auto_27866 ?auto_27899 ) ) ( not ( = ?auto_27868 ?auto_27869 ) ) ( not ( = ?auto_27868 ?auto_27899 ) ) ( not ( = ?auto_27870 ?auto_27869 ) ) ( not ( = ?auto_27870 ?auto_27899 ) ) ( not ( = ?auto_27869 ?auto_27879 ) ) ( not ( = ?auto_27869 ?auto_27882 ) ) ( not ( = ?auto_27869 ?auto_27912 ) ) ( not ( = ?auto_27869 ?auto_27894 ) ) ( not ( = ?auto_27869 ?auto_27910 ) ) ( not ( = ?auto_27869 ?auto_27881 ) ) ( not ( = ?auto_27869 ?auto_27908 ) ) ( not ( = ?auto_27869 ?auto_27900 ) ) ( not ( = ?auto_27869 ?auto_27901 ) ) ( not ( = ?auto_27869 ?auto_27883 ) ) ( not ( = ?auto_27869 ?auto_27911 ) ) ( not ( = ?auto_27869 ?auto_27909 ) ) ( not ( = ?auto_27869 ?auto_27907 ) ) ( not ( = ?auto_27869 ?auto_27895 ) ) ( not ( = ?auto_27899 ?auto_27879 ) ) ( not ( = ?auto_27899 ?auto_27882 ) ) ( not ( = ?auto_27899 ?auto_27912 ) ) ( not ( = ?auto_27899 ?auto_27894 ) ) ( not ( = ?auto_27899 ?auto_27910 ) ) ( not ( = ?auto_27899 ?auto_27881 ) ) ( not ( = ?auto_27899 ?auto_27908 ) ) ( not ( = ?auto_27899 ?auto_27900 ) ) ( not ( = ?auto_27899 ?auto_27901 ) ) ( not ( = ?auto_27899 ?auto_27883 ) ) ( not ( = ?auto_27899 ?auto_27911 ) ) ( not ( = ?auto_27899 ?auto_27909 ) ) ( not ( = ?auto_27899 ?auto_27907 ) ) ( not ( = ?auto_27899 ?auto_27895 ) ) ( not ( = ?auto_27856 ?auto_27872 ) ) ( not ( = ?auto_27856 ?auto_27876 ) ) ( not ( = ?auto_27857 ?auto_27872 ) ) ( not ( = ?auto_27857 ?auto_27876 ) ) ( not ( = ?auto_27858 ?auto_27872 ) ) ( not ( = ?auto_27858 ?auto_27876 ) ) ( not ( = ?auto_27859 ?auto_27872 ) ) ( not ( = ?auto_27859 ?auto_27876 ) ) ( not ( = ?auto_27860 ?auto_27872 ) ) ( not ( = ?auto_27860 ?auto_27876 ) ) ( not ( = ?auto_27863 ?auto_27872 ) ) ( not ( = ?auto_27863 ?auto_27876 ) ) ( not ( = ?auto_27861 ?auto_27872 ) ) ( not ( = ?auto_27861 ?auto_27876 ) ) ( not ( = ?auto_27865 ?auto_27872 ) ) ( not ( = ?auto_27865 ?auto_27876 ) ) ( not ( = ?auto_27864 ?auto_27872 ) ) ( not ( = ?auto_27864 ?auto_27876 ) ) ( not ( = ?auto_27862 ?auto_27872 ) ) ( not ( = ?auto_27862 ?auto_27876 ) ) ( not ( = ?auto_27867 ?auto_27872 ) ) ( not ( = ?auto_27867 ?auto_27876 ) ) ( not ( = ?auto_27866 ?auto_27872 ) ) ( not ( = ?auto_27866 ?auto_27876 ) ) ( not ( = ?auto_27868 ?auto_27872 ) ) ( not ( = ?auto_27868 ?auto_27876 ) ) ( not ( = ?auto_27870 ?auto_27872 ) ) ( not ( = ?auto_27870 ?auto_27876 ) ) ( not ( = ?auto_27871 ?auto_27872 ) ) ( not ( = ?auto_27871 ?auto_27876 ) ) ( not ( = ?auto_27872 ?auto_27899 ) ) ( not ( = ?auto_27872 ?auto_27879 ) ) ( not ( = ?auto_27872 ?auto_27882 ) ) ( not ( = ?auto_27872 ?auto_27912 ) ) ( not ( = ?auto_27872 ?auto_27894 ) ) ( not ( = ?auto_27872 ?auto_27910 ) ) ( not ( = ?auto_27872 ?auto_27881 ) ) ( not ( = ?auto_27872 ?auto_27908 ) ) ( not ( = ?auto_27872 ?auto_27900 ) ) ( not ( = ?auto_27872 ?auto_27901 ) ) ( not ( = ?auto_27872 ?auto_27883 ) ) ( not ( = ?auto_27872 ?auto_27911 ) ) ( not ( = ?auto_27872 ?auto_27909 ) ) ( not ( = ?auto_27872 ?auto_27907 ) ) ( not ( = ?auto_27872 ?auto_27895 ) ) ( not ( = ?auto_27876 ?auto_27899 ) ) ( not ( = ?auto_27876 ?auto_27879 ) ) ( not ( = ?auto_27876 ?auto_27882 ) ) ( not ( = ?auto_27876 ?auto_27912 ) ) ( not ( = ?auto_27876 ?auto_27894 ) ) ( not ( = ?auto_27876 ?auto_27910 ) ) ( not ( = ?auto_27876 ?auto_27881 ) ) ( not ( = ?auto_27876 ?auto_27908 ) ) ( not ( = ?auto_27876 ?auto_27900 ) ) ( not ( = ?auto_27876 ?auto_27901 ) ) ( not ( = ?auto_27876 ?auto_27883 ) ) ( not ( = ?auto_27876 ?auto_27911 ) ) ( not ( = ?auto_27876 ?auto_27909 ) ) ( not ( = ?auto_27876 ?auto_27907 ) ) ( not ( = ?auto_27876 ?auto_27895 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_27856 ?auto_27857 ?auto_27858 ?auto_27859 ?auto_27860 ?auto_27863 ?auto_27861 ?auto_27865 ?auto_27864 ?auto_27862 ?auto_27867 ?auto_27866 ?auto_27868 ?auto_27870 ?auto_27871 ?auto_27869 )
      ( MAKE-1CRATE ?auto_27869 ?auto_27872 )
      ( MAKE-16CRATE-VERIFY ?auto_27856 ?auto_27857 ?auto_27858 ?auto_27859 ?auto_27860 ?auto_27863 ?auto_27861 ?auto_27865 ?auto_27864 ?auto_27862 ?auto_27867 ?auto_27866 ?auto_27868 ?auto_27870 ?auto_27871 ?auto_27869 ?auto_27872 ) )
  )

)

