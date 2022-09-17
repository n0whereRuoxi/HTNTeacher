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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27075 - SURFACE
      ?auto_27076 - SURFACE
      ?auto_27077 - SURFACE
    )
    :vars
    (
      ?auto_27082 - HOIST
      ?auto_27079 - PLACE
      ?auto_27083 - PLACE
      ?auto_27081 - HOIST
      ?auto_27080 - SURFACE
      ?auto_27085 - PLACE
      ?auto_27086 - HOIST
      ?auto_27084 - SURFACE
      ?auto_27078 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27082 ?auto_27079 ) ( IS-CRATE ?auto_27077 ) ( not ( = ?auto_27083 ?auto_27079 ) ) ( HOIST-AT ?auto_27081 ?auto_27083 ) ( AVAILABLE ?auto_27081 ) ( SURFACE-AT ?auto_27077 ?auto_27083 ) ( ON ?auto_27077 ?auto_27080 ) ( CLEAR ?auto_27077 ) ( not ( = ?auto_27076 ?auto_27077 ) ) ( not ( = ?auto_27076 ?auto_27080 ) ) ( not ( = ?auto_27077 ?auto_27080 ) ) ( not ( = ?auto_27082 ?auto_27081 ) ) ( SURFACE-AT ?auto_27075 ?auto_27079 ) ( CLEAR ?auto_27075 ) ( IS-CRATE ?auto_27076 ) ( AVAILABLE ?auto_27082 ) ( not ( = ?auto_27085 ?auto_27079 ) ) ( HOIST-AT ?auto_27086 ?auto_27085 ) ( AVAILABLE ?auto_27086 ) ( SURFACE-AT ?auto_27076 ?auto_27085 ) ( ON ?auto_27076 ?auto_27084 ) ( CLEAR ?auto_27076 ) ( TRUCK-AT ?auto_27078 ?auto_27079 ) ( not ( = ?auto_27075 ?auto_27076 ) ) ( not ( = ?auto_27075 ?auto_27084 ) ) ( not ( = ?auto_27076 ?auto_27084 ) ) ( not ( = ?auto_27082 ?auto_27086 ) ) ( not ( = ?auto_27075 ?auto_27077 ) ) ( not ( = ?auto_27075 ?auto_27080 ) ) ( not ( = ?auto_27077 ?auto_27084 ) ) ( not ( = ?auto_27083 ?auto_27085 ) ) ( not ( = ?auto_27081 ?auto_27086 ) ) ( not ( = ?auto_27080 ?auto_27084 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27075 ?auto_27076 )
      ( MAKE-1CRATE ?auto_27076 ?auto_27077 )
      ( MAKE-2CRATE-VERIFY ?auto_27075 ?auto_27076 ?auto_27077 ) )
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
      ?auto_27110 - HOIST
      ?auto_27109 - PLACE
      ?auto_27106 - PLACE
      ?auto_27105 - HOIST
      ?auto_27108 - SURFACE
      ?auto_27116 - PLACE
      ?auto_27115 - HOIST
      ?auto_27111 - SURFACE
      ?auto_27113 - PLACE
      ?auto_27112 - HOIST
      ?auto_27114 - SURFACE
      ?auto_27107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27110 ?auto_27109 ) ( IS-CRATE ?auto_27104 ) ( not ( = ?auto_27106 ?auto_27109 ) ) ( HOIST-AT ?auto_27105 ?auto_27106 ) ( AVAILABLE ?auto_27105 ) ( SURFACE-AT ?auto_27104 ?auto_27106 ) ( ON ?auto_27104 ?auto_27108 ) ( CLEAR ?auto_27104 ) ( not ( = ?auto_27103 ?auto_27104 ) ) ( not ( = ?auto_27103 ?auto_27108 ) ) ( not ( = ?auto_27104 ?auto_27108 ) ) ( not ( = ?auto_27110 ?auto_27105 ) ) ( IS-CRATE ?auto_27103 ) ( not ( = ?auto_27116 ?auto_27109 ) ) ( HOIST-AT ?auto_27115 ?auto_27116 ) ( AVAILABLE ?auto_27115 ) ( SURFACE-AT ?auto_27103 ?auto_27116 ) ( ON ?auto_27103 ?auto_27111 ) ( CLEAR ?auto_27103 ) ( not ( = ?auto_27102 ?auto_27103 ) ) ( not ( = ?auto_27102 ?auto_27111 ) ) ( not ( = ?auto_27103 ?auto_27111 ) ) ( not ( = ?auto_27110 ?auto_27115 ) ) ( SURFACE-AT ?auto_27101 ?auto_27109 ) ( CLEAR ?auto_27101 ) ( IS-CRATE ?auto_27102 ) ( AVAILABLE ?auto_27110 ) ( not ( = ?auto_27113 ?auto_27109 ) ) ( HOIST-AT ?auto_27112 ?auto_27113 ) ( AVAILABLE ?auto_27112 ) ( SURFACE-AT ?auto_27102 ?auto_27113 ) ( ON ?auto_27102 ?auto_27114 ) ( CLEAR ?auto_27102 ) ( TRUCK-AT ?auto_27107 ?auto_27109 ) ( not ( = ?auto_27101 ?auto_27102 ) ) ( not ( = ?auto_27101 ?auto_27114 ) ) ( not ( = ?auto_27102 ?auto_27114 ) ) ( not ( = ?auto_27110 ?auto_27112 ) ) ( not ( = ?auto_27101 ?auto_27103 ) ) ( not ( = ?auto_27101 ?auto_27111 ) ) ( not ( = ?auto_27103 ?auto_27114 ) ) ( not ( = ?auto_27116 ?auto_27113 ) ) ( not ( = ?auto_27115 ?auto_27112 ) ) ( not ( = ?auto_27111 ?auto_27114 ) ) ( not ( = ?auto_27101 ?auto_27104 ) ) ( not ( = ?auto_27101 ?auto_27108 ) ) ( not ( = ?auto_27102 ?auto_27104 ) ) ( not ( = ?auto_27102 ?auto_27108 ) ) ( not ( = ?auto_27104 ?auto_27111 ) ) ( not ( = ?auto_27104 ?auto_27114 ) ) ( not ( = ?auto_27106 ?auto_27116 ) ) ( not ( = ?auto_27106 ?auto_27113 ) ) ( not ( = ?auto_27105 ?auto_27115 ) ) ( not ( = ?auto_27105 ?auto_27112 ) ) ( not ( = ?auto_27108 ?auto_27111 ) ) ( not ( = ?auto_27108 ?auto_27114 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27101 ?auto_27102 ?auto_27103 )
      ( MAKE-1CRATE ?auto_27103 ?auto_27104 )
      ( MAKE-3CRATE-VERIFY ?auto_27101 ?auto_27102 ?auto_27103 ?auto_27104 ) )
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
      ?auto_27140 - HOIST
      ?auto_27138 - PLACE
      ?auto_27141 - PLACE
      ?auto_27139 - HOIST
      ?auto_27137 - SURFACE
      ?auto_27150 - PLACE
      ?auto_27143 - HOIST
      ?auto_27144 - SURFACE
      ?auto_27145 - PLACE
      ?auto_27146 - HOIST
      ?auto_27151 - SURFACE
      ?auto_27149 - PLACE
      ?auto_27147 - HOIST
      ?auto_27148 - SURFACE
      ?auto_27142 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27140 ?auto_27138 ) ( IS-CRATE ?auto_27136 ) ( not ( = ?auto_27141 ?auto_27138 ) ) ( HOIST-AT ?auto_27139 ?auto_27141 ) ( AVAILABLE ?auto_27139 ) ( SURFACE-AT ?auto_27136 ?auto_27141 ) ( ON ?auto_27136 ?auto_27137 ) ( CLEAR ?auto_27136 ) ( not ( = ?auto_27135 ?auto_27136 ) ) ( not ( = ?auto_27135 ?auto_27137 ) ) ( not ( = ?auto_27136 ?auto_27137 ) ) ( not ( = ?auto_27140 ?auto_27139 ) ) ( IS-CRATE ?auto_27135 ) ( not ( = ?auto_27150 ?auto_27138 ) ) ( HOIST-AT ?auto_27143 ?auto_27150 ) ( AVAILABLE ?auto_27143 ) ( SURFACE-AT ?auto_27135 ?auto_27150 ) ( ON ?auto_27135 ?auto_27144 ) ( CLEAR ?auto_27135 ) ( not ( = ?auto_27134 ?auto_27135 ) ) ( not ( = ?auto_27134 ?auto_27144 ) ) ( not ( = ?auto_27135 ?auto_27144 ) ) ( not ( = ?auto_27140 ?auto_27143 ) ) ( IS-CRATE ?auto_27134 ) ( not ( = ?auto_27145 ?auto_27138 ) ) ( HOIST-AT ?auto_27146 ?auto_27145 ) ( AVAILABLE ?auto_27146 ) ( SURFACE-AT ?auto_27134 ?auto_27145 ) ( ON ?auto_27134 ?auto_27151 ) ( CLEAR ?auto_27134 ) ( not ( = ?auto_27133 ?auto_27134 ) ) ( not ( = ?auto_27133 ?auto_27151 ) ) ( not ( = ?auto_27134 ?auto_27151 ) ) ( not ( = ?auto_27140 ?auto_27146 ) ) ( SURFACE-AT ?auto_27132 ?auto_27138 ) ( CLEAR ?auto_27132 ) ( IS-CRATE ?auto_27133 ) ( AVAILABLE ?auto_27140 ) ( not ( = ?auto_27149 ?auto_27138 ) ) ( HOIST-AT ?auto_27147 ?auto_27149 ) ( AVAILABLE ?auto_27147 ) ( SURFACE-AT ?auto_27133 ?auto_27149 ) ( ON ?auto_27133 ?auto_27148 ) ( CLEAR ?auto_27133 ) ( TRUCK-AT ?auto_27142 ?auto_27138 ) ( not ( = ?auto_27132 ?auto_27133 ) ) ( not ( = ?auto_27132 ?auto_27148 ) ) ( not ( = ?auto_27133 ?auto_27148 ) ) ( not ( = ?auto_27140 ?auto_27147 ) ) ( not ( = ?auto_27132 ?auto_27134 ) ) ( not ( = ?auto_27132 ?auto_27151 ) ) ( not ( = ?auto_27134 ?auto_27148 ) ) ( not ( = ?auto_27145 ?auto_27149 ) ) ( not ( = ?auto_27146 ?auto_27147 ) ) ( not ( = ?auto_27151 ?auto_27148 ) ) ( not ( = ?auto_27132 ?auto_27135 ) ) ( not ( = ?auto_27132 ?auto_27144 ) ) ( not ( = ?auto_27133 ?auto_27135 ) ) ( not ( = ?auto_27133 ?auto_27144 ) ) ( not ( = ?auto_27135 ?auto_27151 ) ) ( not ( = ?auto_27135 ?auto_27148 ) ) ( not ( = ?auto_27150 ?auto_27145 ) ) ( not ( = ?auto_27150 ?auto_27149 ) ) ( not ( = ?auto_27143 ?auto_27146 ) ) ( not ( = ?auto_27143 ?auto_27147 ) ) ( not ( = ?auto_27144 ?auto_27151 ) ) ( not ( = ?auto_27144 ?auto_27148 ) ) ( not ( = ?auto_27132 ?auto_27136 ) ) ( not ( = ?auto_27132 ?auto_27137 ) ) ( not ( = ?auto_27133 ?auto_27136 ) ) ( not ( = ?auto_27133 ?auto_27137 ) ) ( not ( = ?auto_27134 ?auto_27136 ) ) ( not ( = ?auto_27134 ?auto_27137 ) ) ( not ( = ?auto_27136 ?auto_27144 ) ) ( not ( = ?auto_27136 ?auto_27151 ) ) ( not ( = ?auto_27136 ?auto_27148 ) ) ( not ( = ?auto_27141 ?auto_27150 ) ) ( not ( = ?auto_27141 ?auto_27145 ) ) ( not ( = ?auto_27141 ?auto_27149 ) ) ( not ( = ?auto_27139 ?auto_27143 ) ) ( not ( = ?auto_27139 ?auto_27146 ) ) ( not ( = ?auto_27139 ?auto_27147 ) ) ( not ( = ?auto_27137 ?auto_27144 ) ) ( not ( = ?auto_27137 ?auto_27151 ) ) ( not ( = ?auto_27137 ?auto_27148 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_27132 ?auto_27133 ?auto_27134 ?auto_27135 )
      ( MAKE-1CRATE ?auto_27135 ?auto_27136 )
      ( MAKE-4CRATE-VERIFY ?auto_27132 ?auto_27133 ?auto_27134 ?auto_27135 ?auto_27136 ) )
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
      ?auto_27175 - HOIST
      ?auto_27174 - PLACE
      ?auto_27178 - PLACE
      ?auto_27176 - HOIST
      ?auto_27177 - SURFACE
      ?auto_27180 - PLACE
      ?auto_27187 - HOIST
      ?auto_27190 - SURFACE
      ?auto_27181 - PLACE
      ?auto_27188 - HOIST
      ?auto_27184 - SURFACE
      ?auto_27191 - PLACE
      ?auto_27189 - HOIST
      ?auto_27185 - SURFACE
      ?auto_27182 - PLACE
      ?auto_27186 - HOIST
      ?auto_27183 - SURFACE
      ?auto_27179 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27175 ?auto_27174 ) ( IS-CRATE ?auto_27173 ) ( not ( = ?auto_27178 ?auto_27174 ) ) ( HOIST-AT ?auto_27176 ?auto_27178 ) ( AVAILABLE ?auto_27176 ) ( SURFACE-AT ?auto_27173 ?auto_27178 ) ( ON ?auto_27173 ?auto_27177 ) ( CLEAR ?auto_27173 ) ( not ( = ?auto_27172 ?auto_27173 ) ) ( not ( = ?auto_27172 ?auto_27177 ) ) ( not ( = ?auto_27173 ?auto_27177 ) ) ( not ( = ?auto_27175 ?auto_27176 ) ) ( IS-CRATE ?auto_27172 ) ( not ( = ?auto_27180 ?auto_27174 ) ) ( HOIST-AT ?auto_27187 ?auto_27180 ) ( AVAILABLE ?auto_27187 ) ( SURFACE-AT ?auto_27172 ?auto_27180 ) ( ON ?auto_27172 ?auto_27190 ) ( CLEAR ?auto_27172 ) ( not ( = ?auto_27171 ?auto_27172 ) ) ( not ( = ?auto_27171 ?auto_27190 ) ) ( not ( = ?auto_27172 ?auto_27190 ) ) ( not ( = ?auto_27175 ?auto_27187 ) ) ( IS-CRATE ?auto_27171 ) ( not ( = ?auto_27181 ?auto_27174 ) ) ( HOIST-AT ?auto_27188 ?auto_27181 ) ( AVAILABLE ?auto_27188 ) ( SURFACE-AT ?auto_27171 ?auto_27181 ) ( ON ?auto_27171 ?auto_27184 ) ( CLEAR ?auto_27171 ) ( not ( = ?auto_27170 ?auto_27171 ) ) ( not ( = ?auto_27170 ?auto_27184 ) ) ( not ( = ?auto_27171 ?auto_27184 ) ) ( not ( = ?auto_27175 ?auto_27188 ) ) ( IS-CRATE ?auto_27170 ) ( not ( = ?auto_27191 ?auto_27174 ) ) ( HOIST-AT ?auto_27189 ?auto_27191 ) ( AVAILABLE ?auto_27189 ) ( SURFACE-AT ?auto_27170 ?auto_27191 ) ( ON ?auto_27170 ?auto_27185 ) ( CLEAR ?auto_27170 ) ( not ( = ?auto_27169 ?auto_27170 ) ) ( not ( = ?auto_27169 ?auto_27185 ) ) ( not ( = ?auto_27170 ?auto_27185 ) ) ( not ( = ?auto_27175 ?auto_27189 ) ) ( SURFACE-AT ?auto_27168 ?auto_27174 ) ( CLEAR ?auto_27168 ) ( IS-CRATE ?auto_27169 ) ( AVAILABLE ?auto_27175 ) ( not ( = ?auto_27182 ?auto_27174 ) ) ( HOIST-AT ?auto_27186 ?auto_27182 ) ( AVAILABLE ?auto_27186 ) ( SURFACE-AT ?auto_27169 ?auto_27182 ) ( ON ?auto_27169 ?auto_27183 ) ( CLEAR ?auto_27169 ) ( TRUCK-AT ?auto_27179 ?auto_27174 ) ( not ( = ?auto_27168 ?auto_27169 ) ) ( not ( = ?auto_27168 ?auto_27183 ) ) ( not ( = ?auto_27169 ?auto_27183 ) ) ( not ( = ?auto_27175 ?auto_27186 ) ) ( not ( = ?auto_27168 ?auto_27170 ) ) ( not ( = ?auto_27168 ?auto_27185 ) ) ( not ( = ?auto_27170 ?auto_27183 ) ) ( not ( = ?auto_27191 ?auto_27182 ) ) ( not ( = ?auto_27189 ?auto_27186 ) ) ( not ( = ?auto_27185 ?auto_27183 ) ) ( not ( = ?auto_27168 ?auto_27171 ) ) ( not ( = ?auto_27168 ?auto_27184 ) ) ( not ( = ?auto_27169 ?auto_27171 ) ) ( not ( = ?auto_27169 ?auto_27184 ) ) ( not ( = ?auto_27171 ?auto_27185 ) ) ( not ( = ?auto_27171 ?auto_27183 ) ) ( not ( = ?auto_27181 ?auto_27191 ) ) ( not ( = ?auto_27181 ?auto_27182 ) ) ( not ( = ?auto_27188 ?auto_27189 ) ) ( not ( = ?auto_27188 ?auto_27186 ) ) ( not ( = ?auto_27184 ?auto_27185 ) ) ( not ( = ?auto_27184 ?auto_27183 ) ) ( not ( = ?auto_27168 ?auto_27172 ) ) ( not ( = ?auto_27168 ?auto_27190 ) ) ( not ( = ?auto_27169 ?auto_27172 ) ) ( not ( = ?auto_27169 ?auto_27190 ) ) ( not ( = ?auto_27170 ?auto_27172 ) ) ( not ( = ?auto_27170 ?auto_27190 ) ) ( not ( = ?auto_27172 ?auto_27184 ) ) ( not ( = ?auto_27172 ?auto_27185 ) ) ( not ( = ?auto_27172 ?auto_27183 ) ) ( not ( = ?auto_27180 ?auto_27181 ) ) ( not ( = ?auto_27180 ?auto_27191 ) ) ( not ( = ?auto_27180 ?auto_27182 ) ) ( not ( = ?auto_27187 ?auto_27188 ) ) ( not ( = ?auto_27187 ?auto_27189 ) ) ( not ( = ?auto_27187 ?auto_27186 ) ) ( not ( = ?auto_27190 ?auto_27184 ) ) ( not ( = ?auto_27190 ?auto_27185 ) ) ( not ( = ?auto_27190 ?auto_27183 ) ) ( not ( = ?auto_27168 ?auto_27173 ) ) ( not ( = ?auto_27168 ?auto_27177 ) ) ( not ( = ?auto_27169 ?auto_27173 ) ) ( not ( = ?auto_27169 ?auto_27177 ) ) ( not ( = ?auto_27170 ?auto_27173 ) ) ( not ( = ?auto_27170 ?auto_27177 ) ) ( not ( = ?auto_27171 ?auto_27173 ) ) ( not ( = ?auto_27171 ?auto_27177 ) ) ( not ( = ?auto_27173 ?auto_27190 ) ) ( not ( = ?auto_27173 ?auto_27184 ) ) ( not ( = ?auto_27173 ?auto_27185 ) ) ( not ( = ?auto_27173 ?auto_27183 ) ) ( not ( = ?auto_27178 ?auto_27180 ) ) ( not ( = ?auto_27178 ?auto_27181 ) ) ( not ( = ?auto_27178 ?auto_27191 ) ) ( not ( = ?auto_27178 ?auto_27182 ) ) ( not ( = ?auto_27176 ?auto_27187 ) ) ( not ( = ?auto_27176 ?auto_27188 ) ) ( not ( = ?auto_27176 ?auto_27189 ) ) ( not ( = ?auto_27176 ?auto_27186 ) ) ( not ( = ?auto_27177 ?auto_27190 ) ) ( not ( = ?auto_27177 ?auto_27184 ) ) ( not ( = ?auto_27177 ?auto_27185 ) ) ( not ( = ?auto_27177 ?auto_27183 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_27168 ?auto_27169 ?auto_27170 ?auto_27171 ?auto_27172 )
      ( MAKE-1CRATE ?auto_27172 ?auto_27173 )
      ( MAKE-5CRATE-VERIFY ?auto_27168 ?auto_27169 ?auto_27170 ?auto_27171 ?auto_27172 ?auto_27173 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_27209 - SURFACE
      ?auto_27210 - SURFACE
      ?auto_27211 - SURFACE
      ?auto_27212 - SURFACE
      ?auto_27213 - SURFACE
      ?auto_27214 - SURFACE
      ?auto_27215 - SURFACE
    )
    :vars
    (
      ?auto_27221 - HOIST
      ?auto_27220 - PLACE
      ?auto_27216 - PLACE
      ?auto_27217 - HOIST
      ?auto_27218 - SURFACE
      ?auto_27236 - PLACE
      ?auto_27227 - HOIST
      ?auto_27226 - SURFACE
      ?auto_27230 - PLACE
      ?auto_27234 - HOIST
      ?auto_27229 - SURFACE
      ?auto_27224 - PLACE
      ?auto_27232 - HOIST
      ?auto_27222 - SURFACE
      ?auto_27235 - PLACE
      ?auto_27231 - HOIST
      ?auto_27228 - SURFACE
      ?auto_27225 - PLACE
      ?auto_27233 - HOIST
      ?auto_27223 - SURFACE
      ?auto_27219 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27221 ?auto_27220 ) ( IS-CRATE ?auto_27215 ) ( not ( = ?auto_27216 ?auto_27220 ) ) ( HOIST-AT ?auto_27217 ?auto_27216 ) ( AVAILABLE ?auto_27217 ) ( SURFACE-AT ?auto_27215 ?auto_27216 ) ( ON ?auto_27215 ?auto_27218 ) ( CLEAR ?auto_27215 ) ( not ( = ?auto_27214 ?auto_27215 ) ) ( not ( = ?auto_27214 ?auto_27218 ) ) ( not ( = ?auto_27215 ?auto_27218 ) ) ( not ( = ?auto_27221 ?auto_27217 ) ) ( IS-CRATE ?auto_27214 ) ( not ( = ?auto_27236 ?auto_27220 ) ) ( HOIST-AT ?auto_27227 ?auto_27236 ) ( AVAILABLE ?auto_27227 ) ( SURFACE-AT ?auto_27214 ?auto_27236 ) ( ON ?auto_27214 ?auto_27226 ) ( CLEAR ?auto_27214 ) ( not ( = ?auto_27213 ?auto_27214 ) ) ( not ( = ?auto_27213 ?auto_27226 ) ) ( not ( = ?auto_27214 ?auto_27226 ) ) ( not ( = ?auto_27221 ?auto_27227 ) ) ( IS-CRATE ?auto_27213 ) ( not ( = ?auto_27230 ?auto_27220 ) ) ( HOIST-AT ?auto_27234 ?auto_27230 ) ( AVAILABLE ?auto_27234 ) ( SURFACE-AT ?auto_27213 ?auto_27230 ) ( ON ?auto_27213 ?auto_27229 ) ( CLEAR ?auto_27213 ) ( not ( = ?auto_27212 ?auto_27213 ) ) ( not ( = ?auto_27212 ?auto_27229 ) ) ( not ( = ?auto_27213 ?auto_27229 ) ) ( not ( = ?auto_27221 ?auto_27234 ) ) ( IS-CRATE ?auto_27212 ) ( not ( = ?auto_27224 ?auto_27220 ) ) ( HOIST-AT ?auto_27232 ?auto_27224 ) ( AVAILABLE ?auto_27232 ) ( SURFACE-AT ?auto_27212 ?auto_27224 ) ( ON ?auto_27212 ?auto_27222 ) ( CLEAR ?auto_27212 ) ( not ( = ?auto_27211 ?auto_27212 ) ) ( not ( = ?auto_27211 ?auto_27222 ) ) ( not ( = ?auto_27212 ?auto_27222 ) ) ( not ( = ?auto_27221 ?auto_27232 ) ) ( IS-CRATE ?auto_27211 ) ( not ( = ?auto_27235 ?auto_27220 ) ) ( HOIST-AT ?auto_27231 ?auto_27235 ) ( AVAILABLE ?auto_27231 ) ( SURFACE-AT ?auto_27211 ?auto_27235 ) ( ON ?auto_27211 ?auto_27228 ) ( CLEAR ?auto_27211 ) ( not ( = ?auto_27210 ?auto_27211 ) ) ( not ( = ?auto_27210 ?auto_27228 ) ) ( not ( = ?auto_27211 ?auto_27228 ) ) ( not ( = ?auto_27221 ?auto_27231 ) ) ( SURFACE-AT ?auto_27209 ?auto_27220 ) ( CLEAR ?auto_27209 ) ( IS-CRATE ?auto_27210 ) ( AVAILABLE ?auto_27221 ) ( not ( = ?auto_27225 ?auto_27220 ) ) ( HOIST-AT ?auto_27233 ?auto_27225 ) ( AVAILABLE ?auto_27233 ) ( SURFACE-AT ?auto_27210 ?auto_27225 ) ( ON ?auto_27210 ?auto_27223 ) ( CLEAR ?auto_27210 ) ( TRUCK-AT ?auto_27219 ?auto_27220 ) ( not ( = ?auto_27209 ?auto_27210 ) ) ( not ( = ?auto_27209 ?auto_27223 ) ) ( not ( = ?auto_27210 ?auto_27223 ) ) ( not ( = ?auto_27221 ?auto_27233 ) ) ( not ( = ?auto_27209 ?auto_27211 ) ) ( not ( = ?auto_27209 ?auto_27228 ) ) ( not ( = ?auto_27211 ?auto_27223 ) ) ( not ( = ?auto_27235 ?auto_27225 ) ) ( not ( = ?auto_27231 ?auto_27233 ) ) ( not ( = ?auto_27228 ?auto_27223 ) ) ( not ( = ?auto_27209 ?auto_27212 ) ) ( not ( = ?auto_27209 ?auto_27222 ) ) ( not ( = ?auto_27210 ?auto_27212 ) ) ( not ( = ?auto_27210 ?auto_27222 ) ) ( not ( = ?auto_27212 ?auto_27228 ) ) ( not ( = ?auto_27212 ?auto_27223 ) ) ( not ( = ?auto_27224 ?auto_27235 ) ) ( not ( = ?auto_27224 ?auto_27225 ) ) ( not ( = ?auto_27232 ?auto_27231 ) ) ( not ( = ?auto_27232 ?auto_27233 ) ) ( not ( = ?auto_27222 ?auto_27228 ) ) ( not ( = ?auto_27222 ?auto_27223 ) ) ( not ( = ?auto_27209 ?auto_27213 ) ) ( not ( = ?auto_27209 ?auto_27229 ) ) ( not ( = ?auto_27210 ?auto_27213 ) ) ( not ( = ?auto_27210 ?auto_27229 ) ) ( not ( = ?auto_27211 ?auto_27213 ) ) ( not ( = ?auto_27211 ?auto_27229 ) ) ( not ( = ?auto_27213 ?auto_27222 ) ) ( not ( = ?auto_27213 ?auto_27228 ) ) ( not ( = ?auto_27213 ?auto_27223 ) ) ( not ( = ?auto_27230 ?auto_27224 ) ) ( not ( = ?auto_27230 ?auto_27235 ) ) ( not ( = ?auto_27230 ?auto_27225 ) ) ( not ( = ?auto_27234 ?auto_27232 ) ) ( not ( = ?auto_27234 ?auto_27231 ) ) ( not ( = ?auto_27234 ?auto_27233 ) ) ( not ( = ?auto_27229 ?auto_27222 ) ) ( not ( = ?auto_27229 ?auto_27228 ) ) ( not ( = ?auto_27229 ?auto_27223 ) ) ( not ( = ?auto_27209 ?auto_27214 ) ) ( not ( = ?auto_27209 ?auto_27226 ) ) ( not ( = ?auto_27210 ?auto_27214 ) ) ( not ( = ?auto_27210 ?auto_27226 ) ) ( not ( = ?auto_27211 ?auto_27214 ) ) ( not ( = ?auto_27211 ?auto_27226 ) ) ( not ( = ?auto_27212 ?auto_27214 ) ) ( not ( = ?auto_27212 ?auto_27226 ) ) ( not ( = ?auto_27214 ?auto_27229 ) ) ( not ( = ?auto_27214 ?auto_27222 ) ) ( not ( = ?auto_27214 ?auto_27228 ) ) ( not ( = ?auto_27214 ?auto_27223 ) ) ( not ( = ?auto_27236 ?auto_27230 ) ) ( not ( = ?auto_27236 ?auto_27224 ) ) ( not ( = ?auto_27236 ?auto_27235 ) ) ( not ( = ?auto_27236 ?auto_27225 ) ) ( not ( = ?auto_27227 ?auto_27234 ) ) ( not ( = ?auto_27227 ?auto_27232 ) ) ( not ( = ?auto_27227 ?auto_27231 ) ) ( not ( = ?auto_27227 ?auto_27233 ) ) ( not ( = ?auto_27226 ?auto_27229 ) ) ( not ( = ?auto_27226 ?auto_27222 ) ) ( not ( = ?auto_27226 ?auto_27228 ) ) ( not ( = ?auto_27226 ?auto_27223 ) ) ( not ( = ?auto_27209 ?auto_27215 ) ) ( not ( = ?auto_27209 ?auto_27218 ) ) ( not ( = ?auto_27210 ?auto_27215 ) ) ( not ( = ?auto_27210 ?auto_27218 ) ) ( not ( = ?auto_27211 ?auto_27215 ) ) ( not ( = ?auto_27211 ?auto_27218 ) ) ( not ( = ?auto_27212 ?auto_27215 ) ) ( not ( = ?auto_27212 ?auto_27218 ) ) ( not ( = ?auto_27213 ?auto_27215 ) ) ( not ( = ?auto_27213 ?auto_27218 ) ) ( not ( = ?auto_27215 ?auto_27226 ) ) ( not ( = ?auto_27215 ?auto_27229 ) ) ( not ( = ?auto_27215 ?auto_27222 ) ) ( not ( = ?auto_27215 ?auto_27228 ) ) ( not ( = ?auto_27215 ?auto_27223 ) ) ( not ( = ?auto_27216 ?auto_27236 ) ) ( not ( = ?auto_27216 ?auto_27230 ) ) ( not ( = ?auto_27216 ?auto_27224 ) ) ( not ( = ?auto_27216 ?auto_27235 ) ) ( not ( = ?auto_27216 ?auto_27225 ) ) ( not ( = ?auto_27217 ?auto_27227 ) ) ( not ( = ?auto_27217 ?auto_27234 ) ) ( not ( = ?auto_27217 ?auto_27232 ) ) ( not ( = ?auto_27217 ?auto_27231 ) ) ( not ( = ?auto_27217 ?auto_27233 ) ) ( not ( = ?auto_27218 ?auto_27226 ) ) ( not ( = ?auto_27218 ?auto_27229 ) ) ( not ( = ?auto_27218 ?auto_27222 ) ) ( not ( = ?auto_27218 ?auto_27228 ) ) ( not ( = ?auto_27218 ?auto_27223 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_27209 ?auto_27210 ?auto_27211 ?auto_27212 ?auto_27213 ?auto_27214 )
      ( MAKE-1CRATE ?auto_27214 ?auto_27215 )
      ( MAKE-6CRATE-VERIFY ?auto_27209 ?auto_27210 ?auto_27211 ?auto_27212 ?auto_27213 ?auto_27214 ?auto_27215 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_27255 - SURFACE
      ?auto_27256 - SURFACE
      ?auto_27257 - SURFACE
      ?auto_27258 - SURFACE
      ?auto_27259 - SURFACE
      ?auto_27260 - SURFACE
      ?auto_27261 - SURFACE
      ?auto_27262 - SURFACE
    )
    :vars
    (
      ?auto_27266 - HOIST
      ?auto_27263 - PLACE
      ?auto_27265 - PLACE
      ?auto_27264 - HOIST
      ?auto_27267 - SURFACE
      ?auto_27282 - PLACE
      ?auto_27274 - HOIST
      ?auto_27283 - SURFACE
      ?auto_27279 - PLACE
      ?auto_27277 - HOIST
      ?auto_27278 - SURFACE
      ?auto_27273 - PLACE
      ?auto_27269 - HOIST
      ?auto_27284 - SURFACE
      ?auto_27281 - PLACE
      ?auto_27271 - HOIST
      ?auto_27272 - SURFACE
      ?auto_27275 - PLACE
      ?auto_27270 - HOIST
      ?auto_27276 - SURFACE
      ?auto_27280 - SURFACE
      ?auto_27268 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27266 ?auto_27263 ) ( IS-CRATE ?auto_27262 ) ( not ( = ?auto_27265 ?auto_27263 ) ) ( HOIST-AT ?auto_27264 ?auto_27265 ) ( SURFACE-AT ?auto_27262 ?auto_27265 ) ( ON ?auto_27262 ?auto_27267 ) ( CLEAR ?auto_27262 ) ( not ( = ?auto_27261 ?auto_27262 ) ) ( not ( = ?auto_27261 ?auto_27267 ) ) ( not ( = ?auto_27262 ?auto_27267 ) ) ( not ( = ?auto_27266 ?auto_27264 ) ) ( IS-CRATE ?auto_27261 ) ( not ( = ?auto_27282 ?auto_27263 ) ) ( HOIST-AT ?auto_27274 ?auto_27282 ) ( AVAILABLE ?auto_27274 ) ( SURFACE-AT ?auto_27261 ?auto_27282 ) ( ON ?auto_27261 ?auto_27283 ) ( CLEAR ?auto_27261 ) ( not ( = ?auto_27260 ?auto_27261 ) ) ( not ( = ?auto_27260 ?auto_27283 ) ) ( not ( = ?auto_27261 ?auto_27283 ) ) ( not ( = ?auto_27266 ?auto_27274 ) ) ( IS-CRATE ?auto_27260 ) ( not ( = ?auto_27279 ?auto_27263 ) ) ( HOIST-AT ?auto_27277 ?auto_27279 ) ( AVAILABLE ?auto_27277 ) ( SURFACE-AT ?auto_27260 ?auto_27279 ) ( ON ?auto_27260 ?auto_27278 ) ( CLEAR ?auto_27260 ) ( not ( = ?auto_27259 ?auto_27260 ) ) ( not ( = ?auto_27259 ?auto_27278 ) ) ( not ( = ?auto_27260 ?auto_27278 ) ) ( not ( = ?auto_27266 ?auto_27277 ) ) ( IS-CRATE ?auto_27259 ) ( not ( = ?auto_27273 ?auto_27263 ) ) ( HOIST-AT ?auto_27269 ?auto_27273 ) ( AVAILABLE ?auto_27269 ) ( SURFACE-AT ?auto_27259 ?auto_27273 ) ( ON ?auto_27259 ?auto_27284 ) ( CLEAR ?auto_27259 ) ( not ( = ?auto_27258 ?auto_27259 ) ) ( not ( = ?auto_27258 ?auto_27284 ) ) ( not ( = ?auto_27259 ?auto_27284 ) ) ( not ( = ?auto_27266 ?auto_27269 ) ) ( IS-CRATE ?auto_27258 ) ( not ( = ?auto_27281 ?auto_27263 ) ) ( HOIST-AT ?auto_27271 ?auto_27281 ) ( AVAILABLE ?auto_27271 ) ( SURFACE-AT ?auto_27258 ?auto_27281 ) ( ON ?auto_27258 ?auto_27272 ) ( CLEAR ?auto_27258 ) ( not ( = ?auto_27257 ?auto_27258 ) ) ( not ( = ?auto_27257 ?auto_27272 ) ) ( not ( = ?auto_27258 ?auto_27272 ) ) ( not ( = ?auto_27266 ?auto_27271 ) ) ( IS-CRATE ?auto_27257 ) ( not ( = ?auto_27275 ?auto_27263 ) ) ( HOIST-AT ?auto_27270 ?auto_27275 ) ( AVAILABLE ?auto_27270 ) ( SURFACE-AT ?auto_27257 ?auto_27275 ) ( ON ?auto_27257 ?auto_27276 ) ( CLEAR ?auto_27257 ) ( not ( = ?auto_27256 ?auto_27257 ) ) ( not ( = ?auto_27256 ?auto_27276 ) ) ( not ( = ?auto_27257 ?auto_27276 ) ) ( not ( = ?auto_27266 ?auto_27270 ) ) ( SURFACE-AT ?auto_27255 ?auto_27263 ) ( CLEAR ?auto_27255 ) ( IS-CRATE ?auto_27256 ) ( AVAILABLE ?auto_27266 ) ( AVAILABLE ?auto_27264 ) ( SURFACE-AT ?auto_27256 ?auto_27265 ) ( ON ?auto_27256 ?auto_27280 ) ( CLEAR ?auto_27256 ) ( TRUCK-AT ?auto_27268 ?auto_27263 ) ( not ( = ?auto_27255 ?auto_27256 ) ) ( not ( = ?auto_27255 ?auto_27280 ) ) ( not ( = ?auto_27256 ?auto_27280 ) ) ( not ( = ?auto_27255 ?auto_27257 ) ) ( not ( = ?auto_27255 ?auto_27276 ) ) ( not ( = ?auto_27257 ?auto_27280 ) ) ( not ( = ?auto_27275 ?auto_27265 ) ) ( not ( = ?auto_27270 ?auto_27264 ) ) ( not ( = ?auto_27276 ?auto_27280 ) ) ( not ( = ?auto_27255 ?auto_27258 ) ) ( not ( = ?auto_27255 ?auto_27272 ) ) ( not ( = ?auto_27256 ?auto_27258 ) ) ( not ( = ?auto_27256 ?auto_27272 ) ) ( not ( = ?auto_27258 ?auto_27276 ) ) ( not ( = ?auto_27258 ?auto_27280 ) ) ( not ( = ?auto_27281 ?auto_27275 ) ) ( not ( = ?auto_27281 ?auto_27265 ) ) ( not ( = ?auto_27271 ?auto_27270 ) ) ( not ( = ?auto_27271 ?auto_27264 ) ) ( not ( = ?auto_27272 ?auto_27276 ) ) ( not ( = ?auto_27272 ?auto_27280 ) ) ( not ( = ?auto_27255 ?auto_27259 ) ) ( not ( = ?auto_27255 ?auto_27284 ) ) ( not ( = ?auto_27256 ?auto_27259 ) ) ( not ( = ?auto_27256 ?auto_27284 ) ) ( not ( = ?auto_27257 ?auto_27259 ) ) ( not ( = ?auto_27257 ?auto_27284 ) ) ( not ( = ?auto_27259 ?auto_27272 ) ) ( not ( = ?auto_27259 ?auto_27276 ) ) ( not ( = ?auto_27259 ?auto_27280 ) ) ( not ( = ?auto_27273 ?auto_27281 ) ) ( not ( = ?auto_27273 ?auto_27275 ) ) ( not ( = ?auto_27273 ?auto_27265 ) ) ( not ( = ?auto_27269 ?auto_27271 ) ) ( not ( = ?auto_27269 ?auto_27270 ) ) ( not ( = ?auto_27269 ?auto_27264 ) ) ( not ( = ?auto_27284 ?auto_27272 ) ) ( not ( = ?auto_27284 ?auto_27276 ) ) ( not ( = ?auto_27284 ?auto_27280 ) ) ( not ( = ?auto_27255 ?auto_27260 ) ) ( not ( = ?auto_27255 ?auto_27278 ) ) ( not ( = ?auto_27256 ?auto_27260 ) ) ( not ( = ?auto_27256 ?auto_27278 ) ) ( not ( = ?auto_27257 ?auto_27260 ) ) ( not ( = ?auto_27257 ?auto_27278 ) ) ( not ( = ?auto_27258 ?auto_27260 ) ) ( not ( = ?auto_27258 ?auto_27278 ) ) ( not ( = ?auto_27260 ?auto_27284 ) ) ( not ( = ?auto_27260 ?auto_27272 ) ) ( not ( = ?auto_27260 ?auto_27276 ) ) ( not ( = ?auto_27260 ?auto_27280 ) ) ( not ( = ?auto_27279 ?auto_27273 ) ) ( not ( = ?auto_27279 ?auto_27281 ) ) ( not ( = ?auto_27279 ?auto_27275 ) ) ( not ( = ?auto_27279 ?auto_27265 ) ) ( not ( = ?auto_27277 ?auto_27269 ) ) ( not ( = ?auto_27277 ?auto_27271 ) ) ( not ( = ?auto_27277 ?auto_27270 ) ) ( not ( = ?auto_27277 ?auto_27264 ) ) ( not ( = ?auto_27278 ?auto_27284 ) ) ( not ( = ?auto_27278 ?auto_27272 ) ) ( not ( = ?auto_27278 ?auto_27276 ) ) ( not ( = ?auto_27278 ?auto_27280 ) ) ( not ( = ?auto_27255 ?auto_27261 ) ) ( not ( = ?auto_27255 ?auto_27283 ) ) ( not ( = ?auto_27256 ?auto_27261 ) ) ( not ( = ?auto_27256 ?auto_27283 ) ) ( not ( = ?auto_27257 ?auto_27261 ) ) ( not ( = ?auto_27257 ?auto_27283 ) ) ( not ( = ?auto_27258 ?auto_27261 ) ) ( not ( = ?auto_27258 ?auto_27283 ) ) ( not ( = ?auto_27259 ?auto_27261 ) ) ( not ( = ?auto_27259 ?auto_27283 ) ) ( not ( = ?auto_27261 ?auto_27278 ) ) ( not ( = ?auto_27261 ?auto_27284 ) ) ( not ( = ?auto_27261 ?auto_27272 ) ) ( not ( = ?auto_27261 ?auto_27276 ) ) ( not ( = ?auto_27261 ?auto_27280 ) ) ( not ( = ?auto_27282 ?auto_27279 ) ) ( not ( = ?auto_27282 ?auto_27273 ) ) ( not ( = ?auto_27282 ?auto_27281 ) ) ( not ( = ?auto_27282 ?auto_27275 ) ) ( not ( = ?auto_27282 ?auto_27265 ) ) ( not ( = ?auto_27274 ?auto_27277 ) ) ( not ( = ?auto_27274 ?auto_27269 ) ) ( not ( = ?auto_27274 ?auto_27271 ) ) ( not ( = ?auto_27274 ?auto_27270 ) ) ( not ( = ?auto_27274 ?auto_27264 ) ) ( not ( = ?auto_27283 ?auto_27278 ) ) ( not ( = ?auto_27283 ?auto_27284 ) ) ( not ( = ?auto_27283 ?auto_27272 ) ) ( not ( = ?auto_27283 ?auto_27276 ) ) ( not ( = ?auto_27283 ?auto_27280 ) ) ( not ( = ?auto_27255 ?auto_27262 ) ) ( not ( = ?auto_27255 ?auto_27267 ) ) ( not ( = ?auto_27256 ?auto_27262 ) ) ( not ( = ?auto_27256 ?auto_27267 ) ) ( not ( = ?auto_27257 ?auto_27262 ) ) ( not ( = ?auto_27257 ?auto_27267 ) ) ( not ( = ?auto_27258 ?auto_27262 ) ) ( not ( = ?auto_27258 ?auto_27267 ) ) ( not ( = ?auto_27259 ?auto_27262 ) ) ( not ( = ?auto_27259 ?auto_27267 ) ) ( not ( = ?auto_27260 ?auto_27262 ) ) ( not ( = ?auto_27260 ?auto_27267 ) ) ( not ( = ?auto_27262 ?auto_27283 ) ) ( not ( = ?auto_27262 ?auto_27278 ) ) ( not ( = ?auto_27262 ?auto_27284 ) ) ( not ( = ?auto_27262 ?auto_27272 ) ) ( not ( = ?auto_27262 ?auto_27276 ) ) ( not ( = ?auto_27262 ?auto_27280 ) ) ( not ( = ?auto_27267 ?auto_27283 ) ) ( not ( = ?auto_27267 ?auto_27278 ) ) ( not ( = ?auto_27267 ?auto_27284 ) ) ( not ( = ?auto_27267 ?auto_27272 ) ) ( not ( = ?auto_27267 ?auto_27276 ) ) ( not ( = ?auto_27267 ?auto_27280 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_27255 ?auto_27256 ?auto_27257 ?auto_27258 ?auto_27259 ?auto_27260 ?auto_27261 )
      ( MAKE-1CRATE ?auto_27261 ?auto_27262 )
      ( MAKE-7CRATE-VERIFY ?auto_27255 ?auto_27256 ?auto_27257 ?auto_27258 ?auto_27259 ?auto_27260 ?auto_27261 ?auto_27262 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_27304 - SURFACE
      ?auto_27305 - SURFACE
      ?auto_27306 - SURFACE
      ?auto_27307 - SURFACE
      ?auto_27308 - SURFACE
      ?auto_27309 - SURFACE
      ?auto_27310 - SURFACE
      ?auto_27311 - SURFACE
      ?auto_27312 - SURFACE
    )
    :vars
    (
      ?auto_27317 - HOIST
      ?auto_27314 - PLACE
      ?auto_27316 - PLACE
      ?auto_27315 - HOIST
      ?auto_27313 - SURFACE
      ?auto_27331 - PLACE
      ?auto_27319 - HOIST
      ?auto_27327 - SURFACE
      ?auto_27333 - PLACE
      ?auto_27328 - HOIST
      ?auto_27330 - SURFACE
      ?auto_27336 - PLACE
      ?auto_27332 - HOIST
      ?auto_27335 - SURFACE
      ?auto_27337 - PLACE
      ?auto_27320 - HOIST
      ?auto_27326 - SURFACE
      ?auto_27334 - PLACE
      ?auto_27329 - HOIST
      ?auto_27322 - SURFACE
      ?auto_27321 - PLACE
      ?auto_27323 - HOIST
      ?auto_27324 - SURFACE
      ?auto_27325 - SURFACE
      ?auto_27318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27317 ?auto_27314 ) ( IS-CRATE ?auto_27312 ) ( not ( = ?auto_27316 ?auto_27314 ) ) ( HOIST-AT ?auto_27315 ?auto_27316 ) ( AVAILABLE ?auto_27315 ) ( SURFACE-AT ?auto_27312 ?auto_27316 ) ( ON ?auto_27312 ?auto_27313 ) ( CLEAR ?auto_27312 ) ( not ( = ?auto_27311 ?auto_27312 ) ) ( not ( = ?auto_27311 ?auto_27313 ) ) ( not ( = ?auto_27312 ?auto_27313 ) ) ( not ( = ?auto_27317 ?auto_27315 ) ) ( IS-CRATE ?auto_27311 ) ( not ( = ?auto_27331 ?auto_27314 ) ) ( HOIST-AT ?auto_27319 ?auto_27331 ) ( SURFACE-AT ?auto_27311 ?auto_27331 ) ( ON ?auto_27311 ?auto_27327 ) ( CLEAR ?auto_27311 ) ( not ( = ?auto_27310 ?auto_27311 ) ) ( not ( = ?auto_27310 ?auto_27327 ) ) ( not ( = ?auto_27311 ?auto_27327 ) ) ( not ( = ?auto_27317 ?auto_27319 ) ) ( IS-CRATE ?auto_27310 ) ( not ( = ?auto_27333 ?auto_27314 ) ) ( HOIST-AT ?auto_27328 ?auto_27333 ) ( AVAILABLE ?auto_27328 ) ( SURFACE-AT ?auto_27310 ?auto_27333 ) ( ON ?auto_27310 ?auto_27330 ) ( CLEAR ?auto_27310 ) ( not ( = ?auto_27309 ?auto_27310 ) ) ( not ( = ?auto_27309 ?auto_27330 ) ) ( not ( = ?auto_27310 ?auto_27330 ) ) ( not ( = ?auto_27317 ?auto_27328 ) ) ( IS-CRATE ?auto_27309 ) ( not ( = ?auto_27336 ?auto_27314 ) ) ( HOIST-AT ?auto_27332 ?auto_27336 ) ( AVAILABLE ?auto_27332 ) ( SURFACE-AT ?auto_27309 ?auto_27336 ) ( ON ?auto_27309 ?auto_27335 ) ( CLEAR ?auto_27309 ) ( not ( = ?auto_27308 ?auto_27309 ) ) ( not ( = ?auto_27308 ?auto_27335 ) ) ( not ( = ?auto_27309 ?auto_27335 ) ) ( not ( = ?auto_27317 ?auto_27332 ) ) ( IS-CRATE ?auto_27308 ) ( not ( = ?auto_27337 ?auto_27314 ) ) ( HOIST-AT ?auto_27320 ?auto_27337 ) ( AVAILABLE ?auto_27320 ) ( SURFACE-AT ?auto_27308 ?auto_27337 ) ( ON ?auto_27308 ?auto_27326 ) ( CLEAR ?auto_27308 ) ( not ( = ?auto_27307 ?auto_27308 ) ) ( not ( = ?auto_27307 ?auto_27326 ) ) ( not ( = ?auto_27308 ?auto_27326 ) ) ( not ( = ?auto_27317 ?auto_27320 ) ) ( IS-CRATE ?auto_27307 ) ( not ( = ?auto_27334 ?auto_27314 ) ) ( HOIST-AT ?auto_27329 ?auto_27334 ) ( AVAILABLE ?auto_27329 ) ( SURFACE-AT ?auto_27307 ?auto_27334 ) ( ON ?auto_27307 ?auto_27322 ) ( CLEAR ?auto_27307 ) ( not ( = ?auto_27306 ?auto_27307 ) ) ( not ( = ?auto_27306 ?auto_27322 ) ) ( not ( = ?auto_27307 ?auto_27322 ) ) ( not ( = ?auto_27317 ?auto_27329 ) ) ( IS-CRATE ?auto_27306 ) ( not ( = ?auto_27321 ?auto_27314 ) ) ( HOIST-AT ?auto_27323 ?auto_27321 ) ( AVAILABLE ?auto_27323 ) ( SURFACE-AT ?auto_27306 ?auto_27321 ) ( ON ?auto_27306 ?auto_27324 ) ( CLEAR ?auto_27306 ) ( not ( = ?auto_27305 ?auto_27306 ) ) ( not ( = ?auto_27305 ?auto_27324 ) ) ( not ( = ?auto_27306 ?auto_27324 ) ) ( not ( = ?auto_27317 ?auto_27323 ) ) ( SURFACE-AT ?auto_27304 ?auto_27314 ) ( CLEAR ?auto_27304 ) ( IS-CRATE ?auto_27305 ) ( AVAILABLE ?auto_27317 ) ( AVAILABLE ?auto_27319 ) ( SURFACE-AT ?auto_27305 ?auto_27331 ) ( ON ?auto_27305 ?auto_27325 ) ( CLEAR ?auto_27305 ) ( TRUCK-AT ?auto_27318 ?auto_27314 ) ( not ( = ?auto_27304 ?auto_27305 ) ) ( not ( = ?auto_27304 ?auto_27325 ) ) ( not ( = ?auto_27305 ?auto_27325 ) ) ( not ( = ?auto_27304 ?auto_27306 ) ) ( not ( = ?auto_27304 ?auto_27324 ) ) ( not ( = ?auto_27306 ?auto_27325 ) ) ( not ( = ?auto_27321 ?auto_27331 ) ) ( not ( = ?auto_27323 ?auto_27319 ) ) ( not ( = ?auto_27324 ?auto_27325 ) ) ( not ( = ?auto_27304 ?auto_27307 ) ) ( not ( = ?auto_27304 ?auto_27322 ) ) ( not ( = ?auto_27305 ?auto_27307 ) ) ( not ( = ?auto_27305 ?auto_27322 ) ) ( not ( = ?auto_27307 ?auto_27324 ) ) ( not ( = ?auto_27307 ?auto_27325 ) ) ( not ( = ?auto_27334 ?auto_27321 ) ) ( not ( = ?auto_27334 ?auto_27331 ) ) ( not ( = ?auto_27329 ?auto_27323 ) ) ( not ( = ?auto_27329 ?auto_27319 ) ) ( not ( = ?auto_27322 ?auto_27324 ) ) ( not ( = ?auto_27322 ?auto_27325 ) ) ( not ( = ?auto_27304 ?auto_27308 ) ) ( not ( = ?auto_27304 ?auto_27326 ) ) ( not ( = ?auto_27305 ?auto_27308 ) ) ( not ( = ?auto_27305 ?auto_27326 ) ) ( not ( = ?auto_27306 ?auto_27308 ) ) ( not ( = ?auto_27306 ?auto_27326 ) ) ( not ( = ?auto_27308 ?auto_27322 ) ) ( not ( = ?auto_27308 ?auto_27324 ) ) ( not ( = ?auto_27308 ?auto_27325 ) ) ( not ( = ?auto_27337 ?auto_27334 ) ) ( not ( = ?auto_27337 ?auto_27321 ) ) ( not ( = ?auto_27337 ?auto_27331 ) ) ( not ( = ?auto_27320 ?auto_27329 ) ) ( not ( = ?auto_27320 ?auto_27323 ) ) ( not ( = ?auto_27320 ?auto_27319 ) ) ( not ( = ?auto_27326 ?auto_27322 ) ) ( not ( = ?auto_27326 ?auto_27324 ) ) ( not ( = ?auto_27326 ?auto_27325 ) ) ( not ( = ?auto_27304 ?auto_27309 ) ) ( not ( = ?auto_27304 ?auto_27335 ) ) ( not ( = ?auto_27305 ?auto_27309 ) ) ( not ( = ?auto_27305 ?auto_27335 ) ) ( not ( = ?auto_27306 ?auto_27309 ) ) ( not ( = ?auto_27306 ?auto_27335 ) ) ( not ( = ?auto_27307 ?auto_27309 ) ) ( not ( = ?auto_27307 ?auto_27335 ) ) ( not ( = ?auto_27309 ?auto_27326 ) ) ( not ( = ?auto_27309 ?auto_27322 ) ) ( not ( = ?auto_27309 ?auto_27324 ) ) ( not ( = ?auto_27309 ?auto_27325 ) ) ( not ( = ?auto_27336 ?auto_27337 ) ) ( not ( = ?auto_27336 ?auto_27334 ) ) ( not ( = ?auto_27336 ?auto_27321 ) ) ( not ( = ?auto_27336 ?auto_27331 ) ) ( not ( = ?auto_27332 ?auto_27320 ) ) ( not ( = ?auto_27332 ?auto_27329 ) ) ( not ( = ?auto_27332 ?auto_27323 ) ) ( not ( = ?auto_27332 ?auto_27319 ) ) ( not ( = ?auto_27335 ?auto_27326 ) ) ( not ( = ?auto_27335 ?auto_27322 ) ) ( not ( = ?auto_27335 ?auto_27324 ) ) ( not ( = ?auto_27335 ?auto_27325 ) ) ( not ( = ?auto_27304 ?auto_27310 ) ) ( not ( = ?auto_27304 ?auto_27330 ) ) ( not ( = ?auto_27305 ?auto_27310 ) ) ( not ( = ?auto_27305 ?auto_27330 ) ) ( not ( = ?auto_27306 ?auto_27310 ) ) ( not ( = ?auto_27306 ?auto_27330 ) ) ( not ( = ?auto_27307 ?auto_27310 ) ) ( not ( = ?auto_27307 ?auto_27330 ) ) ( not ( = ?auto_27308 ?auto_27310 ) ) ( not ( = ?auto_27308 ?auto_27330 ) ) ( not ( = ?auto_27310 ?auto_27335 ) ) ( not ( = ?auto_27310 ?auto_27326 ) ) ( not ( = ?auto_27310 ?auto_27322 ) ) ( not ( = ?auto_27310 ?auto_27324 ) ) ( not ( = ?auto_27310 ?auto_27325 ) ) ( not ( = ?auto_27333 ?auto_27336 ) ) ( not ( = ?auto_27333 ?auto_27337 ) ) ( not ( = ?auto_27333 ?auto_27334 ) ) ( not ( = ?auto_27333 ?auto_27321 ) ) ( not ( = ?auto_27333 ?auto_27331 ) ) ( not ( = ?auto_27328 ?auto_27332 ) ) ( not ( = ?auto_27328 ?auto_27320 ) ) ( not ( = ?auto_27328 ?auto_27329 ) ) ( not ( = ?auto_27328 ?auto_27323 ) ) ( not ( = ?auto_27328 ?auto_27319 ) ) ( not ( = ?auto_27330 ?auto_27335 ) ) ( not ( = ?auto_27330 ?auto_27326 ) ) ( not ( = ?auto_27330 ?auto_27322 ) ) ( not ( = ?auto_27330 ?auto_27324 ) ) ( not ( = ?auto_27330 ?auto_27325 ) ) ( not ( = ?auto_27304 ?auto_27311 ) ) ( not ( = ?auto_27304 ?auto_27327 ) ) ( not ( = ?auto_27305 ?auto_27311 ) ) ( not ( = ?auto_27305 ?auto_27327 ) ) ( not ( = ?auto_27306 ?auto_27311 ) ) ( not ( = ?auto_27306 ?auto_27327 ) ) ( not ( = ?auto_27307 ?auto_27311 ) ) ( not ( = ?auto_27307 ?auto_27327 ) ) ( not ( = ?auto_27308 ?auto_27311 ) ) ( not ( = ?auto_27308 ?auto_27327 ) ) ( not ( = ?auto_27309 ?auto_27311 ) ) ( not ( = ?auto_27309 ?auto_27327 ) ) ( not ( = ?auto_27311 ?auto_27330 ) ) ( not ( = ?auto_27311 ?auto_27335 ) ) ( not ( = ?auto_27311 ?auto_27326 ) ) ( not ( = ?auto_27311 ?auto_27322 ) ) ( not ( = ?auto_27311 ?auto_27324 ) ) ( not ( = ?auto_27311 ?auto_27325 ) ) ( not ( = ?auto_27327 ?auto_27330 ) ) ( not ( = ?auto_27327 ?auto_27335 ) ) ( not ( = ?auto_27327 ?auto_27326 ) ) ( not ( = ?auto_27327 ?auto_27322 ) ) ( not ( = ?auto_27327 ?auto_27324 ) ) ( not ( = ?auto_27327 ?auto_27325 ) ) ( not ( = ?auto_27304 ?auto_27312 ) ) ( not ( = ?auto_27304 ?auto_27313 ) ) ( not ( = ?auto_27305 ?auto_27312 ) ) ( not ( = ?auto_27305 ?auto_27313 ) ) ( not ( = ?auto_27306 ?auto_27312 ) ) ( not ( = ?auto_27306 ?auto_27313 ) ) ( not ( = ?auto_27307 ?auto_27312 ) ) ( not ( = ?auto_27307 ?auto_27313 ) ) ( not ( = ?auto_27308 ?auto_27312 ) ) ( not ( = ?auto_27308 ?auto_27313 ) ) ( not ( = ?auto_27309 ?auto_27312 ) ) ( not ( = ?auto_27309 ?auto_27313 ) ) ( not ( = ?auto_27310 ?auto_27312 ) ) ( not ( = ?auto_27310 ?auto_27313 ) ) ( not ( = ?auto_27312 ?auto_27327 ) ) ( not ( = ?auto_27312 ?auto_27330 ) ) ( not ( = ?auto_27312 ?auto_27335 ) ) ( not ( = ?auto_27312 ?auto_27326 ) ) ( not ( = ?auto_27312 ?auto_27322 ) ) ( not ( = ?auto_27312 ?auto_27324 ) ) ( not ( = ?auto_27312 ?auto_27325 ) ) ( not ( = ?auto_27316 ?auto_27331 ) ) ( not ( = ?auto_27316 ?auto_27333 ) ) ( not ( = ?auto_27316 ?auto_27336 ) ) ( not ( = ?auto_27316 ?auto_27337 ) ) ( not ( = ?auto_27316 ?auto_27334 ) ) ( not ( = ?auto_27316 ?auto_27321 ) ) ( not ( = ?auto_27315 ?auto_27319 ) ) ( not ( = ?auto_27315 ?auto_27328 ) ) ( not ( = ?auto_27315 ?auto_27332 ) ) ( not ( = ?auto_27315 ?auto_27320 ) ) ( not ( = ?auto_27315 ?auto_27329 ) ) ( not ( = ?auto_27315 ?auto_27323 ) ) ( not ( = ?auto_27313 ?auto_27327 ) ) ( not ( = ?auto_27313 ?auto_27330 ) ) ( not ( = ?auto_27313 ?auto_27335 ) ) ( not ( = ?auto_27313 ?auto_27326 ) ) ( not ( = ?auto_27313 ?auto_27322 ) ) ( not ( = ?auto_27313 ?auto_27324 ) ) ( not ( = ?auto_27313 ?auto_27325 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_27304 ?auto_27305 ?auto_27306 ?auto_27307 ?auto_27308 ?auto_27309 ?auto_27310 ?auto_27311 )
      ( MAKE-1CRATE ?auto_27311 ?auto_27312 )
      ( MAKE-8CRATE-VERIFY ?auto_27304 ?auto_27305 ?auto_27306 ?auto_27307 ?auto_27308 ?auto_27309 ?auto_27310 ?auto_27311 ?auto_27312 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_27358 - SURFACE
      ?auto_27359 - SURFACE
      ?auto_27360 - SURFACE
      ?auto_27361 - SURFACE
      ?auto_27362 - SURFACE
      ?auto_27363 - SURFACE
      ?auto_27364 - SURFACE
      ?auto_27365 - SURFACE
      ?auto_27366 - SURFACE
      ?auto_27367 - SURFACE
    )
    :vars
    (
      ?auto_27369 - HOIST
      ?auto_27372 - PLACE
      ?auto_27370 - PLACE
      ?auto_27371 - HOIST
      ?auto_27373 - SURFACE
      ?auto_27374 - PLACE
      ?auto_27388 - HOIST
      ?auto_27393 - SURFACE
      ?auto_27389 - PLACE
      ?auto_27387 - HOIST
      ?auto_27375 - SURFACE
      ?auto_27386 - PLACE
      ?auto_27382 - HOIST
      ?auto_27376 - SURFACE
      ?auto_27385 - PLACE
      ?auto_27392 - HOIST
      ?auto_27380 - SURFACE
      ?auto_27377 - SURFACE
      ?auto_27384 - PLACE
      ?auto_27383 - HOIST
      ?auto_27390 - SURFACE
      ?auto_27378 - PLACE
      ?auto_27379 - HOIST
      ?auto_27381 - SURFACE
      ?auto_27391 - SURFACE
      ?auto_27368 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27369 ?auto_27372 ) ( IS-CRATE ?auto_27367 ) ( not ( = ?auto_27370 ?auto_27372 ) ) ( HOIST-AT ?auto_27371 ?auto_27370 ) ( SURFACE-AT ?auto_27367 ?auto_27370 ) ( ON ?auto_27367 ?auto_27373 ) ( CLEAR ?auto_27367 ) ( not ( = ?auto_27366 ?auto_27367 ) ) ( not ( = ?auto_27366 ?auto_27373 ) ) ( not ( = ?auto_27367 ?auto_27373 ) ) ( not ( = ?auto_27369 ?auto_27371 ) ) ( IS-CRATE ?auto_27366 ) ( not ( = ?auto_27374 ?auto_27372 ) ) ( HOIST-AT ?auto_27388 ?auto_27374 ) ( AVAILABLE ?auto_27388 ) ( SURFACE-AT ?auto_27366 ?auto_27374 ) ( ON ?auto_27366 ?auto_27393 ) ( CLEAR ?auto_27366 ) ( not ( = ?auto_27365 ?auto_27366 ) ) ( not ( = ?auto_27365 ?auto_27393 ) ) ( not ( = ?auto_27366 ?auto_27393 ) ) ( not ( = ?auto_27369 ?auto_27388 ) ) ( IS-CRATE ?auto_27365 ) ( not ( = ?auto_27389 ?auto_27372 ) ) ( HOIST-AT ?auto_27387 ?auto_27389 ) ( SURFACE-AT ?auto_27365 ?auto_27389 ) ( ON ?auto_27365 ?auto_27375 ) ( CLEAR ?auto_27365 ) ( not ( = ?auto_27364 ?auto_27365 ) ) ( not ( = ?auto_27364 ?auto_27375 ) ) ( not ( = ?auto_27365 ?auto_27375 ) ) ( not ( = ?auto_27369 ?auto_27387 ) ) ( IS-CRATE ?auto_27364 ) ( not ( = ?auto_27386 ?auto_27372 ) ) ( HOIST-AT ?auto_27382 ?auto_27386 ) ( AVAILABLE ?auto_27382 ) ( SURFACE-AT ?auto_27364 ?auto_27386 ) ( ON ?auto_27364 ?auto_27376 ) ( CLEAR ?auto_27364 ) ( not ( = ?auto_27363 ?auto_27364 ) ) ( not ( = ?auto_27363 ?auto_27376 ) ) ( not ( = ?auto_27364 ?auto_27376 ) ) ( not ( = ?auto_27369 ?auto_27382 ) ) ( IS-CRATE ?auto_27363 ) ( not ( = ?auto_27385 ?auto_27372 ) ) ( HOIST-AT ?auto_27392 ?auto_27385 ) ( AVAILABLE ?auto_27392 ) ( SURFACE-AT ?auto_27363 ?auto_27385 ) ( ON ?auto_27363 ?auto_27380 ) ( CLEAR ?auto_27363 ) ( not ( = ?auto_27362 ?auto_27363 ) ) ( not ( = ?auto_27362 ?auto_27380 ) ) ( not ( = ?auto_27363 ?auto_27380 ) ) ( not ( = ?auto_27369 ?auto_27392 ) ) ( IS-CRATE ?auto_27362 ) ( AVAILABLE ?auto_27371 ) ( SURFACE-AT ?auto_27362 ?auto_27370 ) ( ON ?auto_27362 ?auto_27377 ) ( CLEAR ?auto_27362 ) ( not ( = ?auto_27361 ?auto_27362 ) ) ( not ( = ?auto_27361 ?auto_27377 ) ) ( not ( = ?auto_27362 ?auto_27377 ) ) ( IS-CRATE ?auto_27361 ) ( not ( = ?auto_27384 ?auto_27372 ) ) ( HOIST-AT ?auto_27383 ?auto_27384 ) ( AVAILABLE ?auto_27383 ) ( SURFACE-AT ?auto_27361 ?auto_27384 ) ( ON ?auto_27361 ?auto_27390 ) ( CLEAR ?auto_27361 ) ( not ( = ?auto_27360 ?auto_27361 ) ) ( not ( = ?auto_27360 ?auto_27390 ) ) ( not ( = ?auto_27361 ?auto_27390 ) ) ( not ( = ?auto_27369 ?auto_27383 ) ) ( IS-CRATE ?auto_27360 ) ( not ( = ?auto_27378 ?auto_27372 ) ) ( HOIST-AT ?auto_27379 ?auto_27378 ) ( AVAILABLE ?auto_27379 ) ( SURFACE-AT ?auto_27360 ?auto_27378 ) ( ON ?auto_27360 ?auto_27381 ) ( CLEAR ?auto_27360 ) ( not ( = ?auto_27359 ?auto_27360 ) ) ( not ( = ?auto_27359 ?auto_27381 ) ) ( not ( = ?auto_27360 ?auto_27381 ) ) ( not ( = ?auto_27369 ?auto_27379 ) ) ( SURFACE-AT ?auto_27358 ?auto_27372 ) ( CLEAR ?auto_27358 ) ( IS-CRATE ?auto_27359 ) ( AVAILABLE ?auto_27369 ) ( AVAILABLE ?auto_27387 ) ( SURFACE-AT ?auto_27359 ?auto_27389 ) ( ON ?auto_27359 ?auto_27391 ) ( CLEAR ?auto_27359 ) ( TRUCK-AT ?auto_27368 ?auto_27372 ) ( not ( = ?auto_27358 ?auto_27359 ) ) ( not ( = ?auto_27358 ?auto_27391 ) ) ( not ( = ?auto_27359 ?auto_27391 ) ) ( not ( = ?auto_27358 ?auto_27360 ) ) ( not ( = ?auto_27358 ?auto_27381 ) ) ( not ( = ?auto_27360 ?auto_27391 ) ) ( not ( = ?auto_27378 ?auto_27389 ) ) ( not ( = ?auto_27379 ?auto_27387 ) ) ( not ( = ?auto_27381 ?auto_27391 ) ) ( not ( = ?auto_27358 ?auto_27361 ) ) ( not ( = ?auto_27358 ?auto_27390 ) ) ( not ( = ?auto_27359 ?auto_27361 ) ) ( not ( = ?auto_27359 ?auto_27390 ) ) ( not ( = ?auto_27361 ?auto_27381 ) ) ( not ( = ?auto_27361 ?auto_27391 ) ) ( not ( = ?auto_27384 ?auto_27378 ) ) ( not ( = ?auto_27384 ?auto_27389 ) ) ( not ( = ?auto_27383 ?auto_27379 ) ) ( not ( = ?auto_27383 ?auto_27387 ) ) ( not ( = ?auto_27390 ?auto_27381 ) ) ( not ( = ?auto_27390 ?auto_27391 ) ) ( not ( = ?auto_27358 ?auto_27362 ) ) ( not ( = ?auto_27358 ?auto_27377 ) ) ( not ( = ?auto_27359 ?auto_27362 ) ) ( not ( = ?auto_27359 ?auto_27377 ) ) ( not ( = ?auto_27360 ?auto_27362 ) ) ( not ( = ?auto_27360 ?auto_27377 ) ) ( not ( = ?auto_27362 ?auto_27390 ) ) ( not ( = ?auto_27362 ?auto_27381 ) ) ( not ( = ?auto_27362 ?auto_27391 ) ) ( not ( = ?auto_27370 ?auto_27384 ) ) ( not ( = ?auto_27370 ?auto_27378 ) ) ( not ( = ?auto_27370 ?auto_27389 ) ) ( not ( = ?auto_27371 ?auto_27383 ) ) ( not ( = ?auto_27371 ?auto_27379 ) ) ( not ( = ?auto_27371 ?auto_27387 ) ) ( not ( = ?auto_27377 ?auto_27390 ) ) ( not ( = ?auto_27377 ?auto_27381 ) ) ( not ( = ?auto_27377 ?auto_27391 ) ) ( not ( = ?auto_27358 ?auto_27363 ) ) ( not ( = ?auto_27358 ?auto_27380 ) ) ( not ( = ?auto_27359 ?auto_27363 ) ) ( not ( = ?auto_27359 ?auto_27380 ) ) ( not ( = ?auto_27360 ?auto_27363 ) ) ( not ( = ?auto_27360 ?auto_27380 ) ) ( not ( = ?auto_27361 ?auto_27363 ) ) ( not ( = ?auto_27361 ?auto_27380 ) ) ( not ( = ?auto_27363 ?auto_27377 ) ) ( not ( = ?auto_27363 ?auto_27390 ) ) ( not ( = ?auto_27363 ?auto_27381 ) ) ( not ( = ?auto_27363 ?auto_27391 ) ) ( not ( = ?auto_27385 ?auto_27370 ) ) ( not ( = ?auto_27385 ?auto_27384 ) ) ( not ( = ?auto_27385 ?auto_27378 ) ) ( not ( = ?auto_27385 ?auto_27389 ) ) ( not ( = ?auto_27392 ?auto_27371 ) ) ( not ( = ?auto_27392 ?auto_27383 ) ) ( not ( = ?auto_27392 ?auto_27379 ) ) ( not ( = ?auto_27392 ?auto_27387 ) ) ( not ( = ?auto_27380 ?auto_27377 ) ) ( not ( = ?auto_27380 ?auto_27390 ) ) ( not ( = ?auto_27380 ?auto_27381 ) ) ( not ( = ?auto_27380 ?auto_27391 ) ) ( not ( = ?auto_27358 ?auto_27364 ) ) ( not ( = ?auto_27358 ?auto_27376 ) ) ( not ( = ?auto_27359 ?auto_27364 ) ) ( not ( = ?auto_27359 ?auto_27376 ) ) ( not ( = ?auto_27360 ?auto_27364 ) ) ( not ( = ?auto_27360 ?auto_27376 ) ) ( not ( = ?auto_27361 ?auto_27364 ) ) ( not ( = ?auto_27361 ?auto_27376 ) ) ( not ( = ?auto_27362 ?auto_27364 ) ) ( not ( = ?auto_27362 ?auto_27376 ) ) ( not ( = ?auto_27364 ?auto_27380 ) ) ( not ( = ?auto_27364 ?auto_27377 ) ) ( not ( = ?auto_27364 ?auto_27390 ) ) ( not ( = ?auto_27364 ?auto_27381 ) ) ( not ( = ?auto_27364 ?auto_27391 ) ) ( not ( = ?auto_27386 ?auto_27385 ) ) ( not ( = ?auto_27386 ?auto_27370 ) ) ( not ( = ?auto_27386 ?auto_27384 ) ) ( not ( = ?auto_27386 ?auto_27378 ) ) ( not ( = ?auto_27386 ?auto_27389 ) ) ( not ( = ?auto_27382 ?auto_27392 ) ) ( not ( = ?auto_27382 ?auto_27371 ) ) ( not ( = ?auto_27382 ?auto_27383 ) ) ( not ( = ?auto_27382 ?auto_27379 ) ) ( not ( = ?auto_27382 ?auto_27387 ) ) ( not ( = ?auto_27376 ?auto_27380 ) ) ( not ( = ?auto_27376 ?auto_27377 ) ) ( not ( = ?auto_27376 ?auto_27390 ) ) ( not ( = ?auto_27376 ?auto_27381 ) ) ( not ( = ?auto_27376 ?auto_27391 ) ) ( not ( = ?auto_27358 ?auto_27365 ) ) ( not ( = ?auto_27358 ?auto_27375 ) ) ( not ( = ?auto_27359 ?auto_27365 ) ) ( not ( = ?auto_27359 ?auto_27375 ) ) ( not ( = ?auto_27360 ?auto_27365 ) ) ( not ( = ?auto_27360 ?auto_27375 ) ) ( not ( = ?auto_27361 ?auto_27365 ) ) ( not ( = ?auto_27361 ?auto_27375 ) ) ( not ( = ?auto_27362 ?auto_27365 ) ) ( not ( = ?auto_27362 ?auto_27375 ) ) ( not ( = ?auto_27363 ?auto_27365 ) ) ( not ( = ?auto_27363 ?auto_27375 ) ) ( not ( = ?auto_27365 ?auto_27376 ) ) ( not ( = ?auto_27365 ?auto_27380 ) ) ( not ( = ?auto_27365 ?auto_27377 ) ) ( not ( = ?auto_27365 ?auto_27390 ) ) ( not ( = ?auto_27365 ?auto_27381 ) ) ( not ( = ?auto_27365 ?auto_27391 ) ) ( not ( = ?auto_27375 ?auto_27376 ) ) ( not ( = ?auto_27375 ?auto_27380 ) ) ( not ( = ?auto_27375 ?auto_27377 ) ) ( not ( = ?auto_27375 ?auto_27390 ) ) ( not ( = ?auto_27375 ?auto_27381 ) ) ( not ( = ?auto_27375 ?auto_27391 ) ) ( not ( = ?auto_27358 ?auto_27366 ) ) ( not ( = ?auto_27358 ?auto_27393 ) ) ( not ( = ?auto_27359 ?auto_27366 ) ) ( not ( = ?auto_27359 ?auto_27393 ) ) ( not ( = ?auto_27360 ?auto_27366 ) ) ( not ( = ?auto_27360 ?auto_27393 ) ) ( not ( = ?auto_27361 ?auto_27366 ) ) ( not ( = ?auto_27361 ?auto_27393 ) ) ( not ( = ?auto_27362 ?auto_27366 ) ) ( not ( = ?auto_27362 ?auto_27393 ) ) ( not ( = ?auto_27363 ?auto_27366 ) ) ( not ( = ?auto_27363 ?auto_27393 ) ) ( not ( = ?auto_27364 ?auto_27366 ) ) ( not ( = ?auto_27364 ?auto_27393 ) ) ( not ( = ?auto_27366 ?auto_27375 ) ) ( not ( = ?auto_27366 ?auto_27376 ) ) ( not ( = ?auto_27366 ?auto_27380 ) ) ( not ( = ?auto_27366 ?auto_27377 ) ) ( not ( = ?auto_27366 ?auto_27390 ) ) ( not ( = ?auto_27366 ?auto_27381 ) ) ( not ( = ?auto_27366 ?auto_27391 ) ) ( not ( = ?auto_27374 ?auto_27389 ) ) ( not ( = ?auto_27374 ?auto_27386 ) ) ( not ( = ?auto_27374 ?auto_27385 ) ) ( not ( = ?auto_27374 ?auto_27370 ) ) ( not ( = ?auto_27374 ?auto_27384 ) ) ( not ( = ?auto_27374 ?auto_27378 ) ) ( not ( = ?auto_27388 ?auto_27387 ) ) ( not ( = ?auto_27388 ?auto_27382 ) ) ( not ( = ?auto_27388 ?auto_27392 ) ) ( not ( = ?auto_27388 ?auto_27371 ) ) ( not ( = ?auto_27388 ?auto_27383 ) ) ( not ( = ?auto_27388 ?auto_27379 ) ) ( not ( = ?auto_27393 ?auto_27375 ) ) ( not ( = ?auto_27393 ?auto_27376 ) ) ( not ( = ?auto_27393 ?auto_27380 ) ) ( not ( = ?auto_27393 ?auto_27377 ) ) ( not ( = ?auto_27393 ?auto_27390 ) ) ( not ( = ?auto_27393 ?auto_27381 ) ) ( not ( = ?auto_27393 ?auto_27391 ) ) ( not ( = ?auto_27358 ?auto_27367 ) ) ( not ( = ?auto_27358 ?auto_27373 ) ) ( not ( = ?auto_27359 ?auto_27367 ) ) ( not ( = ?auto_27359 ?auto_27373 ) ) ( not ( = ?auto_27360 ?auto_27367 ) ) ( not ( = ?auto_27360 ?auto_27373 ) ) ( not ( = ?auto_27361 ?auto_27367 ) ) ( not ( = ?auto_27361 ?auto_27373 ) ) ( not ( = ?auto_27362 ?auto_27367 ) ) ( not ( = ?auto_27362 ?auto_27373 ) ) ( not ( = ?auto_27363 ?auto_27367 ) ) ( not ( = ?auto_27363 ?auto_27373 ) ) ( not ( = ?auto_27364 ?auto_27367 ) ) ( not ( = ?auto_27364 ?auto_27373 ) ) ( not ( = ?auto_27365 ?auto_27367 ) ) ( not ( = ?auto_27365 ?auto_27373 ) ) ( not ( = ?auto_27367 ?auto_27393 ) ) ( not ( = ?auto_27367 ?auto_27375 ) ) ( not ( = ?auto_27367 ?auto_27376 ) ) ( not ( = ?auto_27367 ?auto_27380 ) ) ( not ( = ?auto_27367 ?auto_27377 ) ) ( not ( = ?auto_27367 ?auto_27390 ) ) ( not ( = ?auto_27367 ?auto_27381 ) ) ( not ( = ?auto_27367 ?auto_27391 ) ) ( not ( = ?auto_27373 ?auto_27393 ) ) ( not ( = ?auto_27373 ?auto_27375 ) ) ( not ( = ?auto_27373 ?auto_27376 ) ) ( not ( = ?auto_27373 ?auto_27380 ) ) ( not ( = ?auto_27373 ?auto_27377 ) ) ( not ( = ?auto_27373 ?auto_27390 ) ) ( not ( = ?auto_27373 ?auto_27381 ) ) ( not ( = ?auto_27373 ?auto_27391 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_27358 ?auto_27359 ?auto_27360 ?auto_27361 ?auto_27362 ?auto_27363 ?auto_27364 ?auto_27365 ?auto_27366 )
      ( MAKE-1CRATE ?auto_27366 ?auto_27367 )
      ( MAKE-9CRATE-VERIFY ?auto_27358 ?auto_27359 ?auto_27360 ?auto_27361 ?auto_27362 ?auto_27363 ?auto_27364 ?auto_27365 ?auto_27366 ?auto_27367 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_27415 - SURFACE
      ?auto_27416 - SURFACE
      ?auto_27417 - SURFACE
      ?auto_27418 - SURFACE
      ?auto_27419 - SURFACE
      ?auto_27420 - SURFACE
      ?auto_27421 - SURFACE
      ?auto_27422 - SURFACE
      ?auto_27423 - SURFACE
      ?auto_27424 - SURFACE
      ?auto_27425 - SURFACE
    )
    :vars
    (
      ?auto_27429 - HOIST
      ?auto_27427 - PLACE
      ?auto_27431 - PLACE
      ?auto_27430 - HOIST
      ?auto_27426 - SURFACE
      ?auto_27437 - PLACE
      ?auto_27451 - HOIST
      ?auto_27433 - SURFACE
      ?auto_27444 - PLACE
      ?auto_27438 - HOIST
      ?auto_27432 - SURFACE
      ?auto_27450 - PLACE
      ?auto_27434 - HOIST
      ?auto_27445 - SURFACE
      ?auto_27452 - PLACE
      ?auto_27447 - HOIST
      ?auto_27440 - SURFACE
      ?auto_27436 - PLACE
      ?auto_27441 - HOIST
      ?auto_27439 - SURFACE
      ?auto_27449 - SURFACE
      ?auto_27446 - PLACE
      ?auto_27435 - HOIST
      ?auto_27443 - SURFACE
      ?auto_27454 - PLACE
      ?auto_27448 - HOIST
      ?auto_27453 - SURFACE
      ?auto_27442 - SURFACE
      ?auto_27428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27429 ?auto_27427 ) ( IS-CRATE ?auto_27425 ) ( not ( = ?auto_27431 ?auto_27427 ) ) ( HOIST-AT ?auto_27430 ?auto_27431 ) ( AVAILABLE ?auto_27430 ) ( SURFACE-AT ?auto_27425 ?auto_27431 ) ( ON ?auto_27425 ?auto_27426 ) ( CLEAR ?auto_27425 ) ( not ( = ?auto_27424 ?auto_27425 ) ) ( not ( = ?auto_27424 ?auto_27426 ) ) ( not ( = ?auto_27425 ?auto_27426 ) ) ( not ( = ?auto_27429 ?auto_27430 ) ) ( IS-CRATE ?auto_27424 ) ( not ( = ?auto_27437 ?auto_27427 ) ) ( HOIST-AT ?auto_27451 ?auto_27437 ) ( SURFACE-AT ?auto_27424 ?auto_27437 ) ( ON ?auto_27424 ?auto_27433 ) ( CLEAR ?auto_27424 ) ( not ( = ?auto_27423 ?auto_27424 ) ) ( not ( = ?auto_27423 ?auto_27433 ) ) ( not ( = ?auto_27424 ?auto_27433 ) ) ( not ( = ?auto_27429 ?auto_27451 ) ) ( IS-CRATE ?auto_27423 ) ( not ( = ?auto_27444 ?auto_27427 ) ) ( HOIST-AT ?auto_27438 ?auto_27444 ) ( AVAILABLE ?auto_27438 ) ( SURFACE-AT ?auto_27423 ?auto_27444 ) ( ON ?auto_27423 ?auto_27432 ) ( CLEAR ?auto_27423 ) ( not ( = ?auto_27422 ?auto_27423 ) ) ( not ( = ?auto_27422 ?auto_27432 ) ) ( not ( = ?auto_27423 ?auto_27432 ) ) ( not ( = ?auto_27429 ?auto_27438 ) ) ( IS-CRATE ?auto_27422 ) ( not ( = ?auto_27450 ?auto_27427 ) ) ( HOIST-AT ?auto_27434 ?auto_27450 ) ( SURFACE-AT ?auto_27422 ?auto_27450 ) ( ON ?auto_27422 ?auto_27445 ) ( CLEAR ?auto_27422 ) ( not ( = ?auto_27421 ?auto_27422 ) ) ( not ( = ?auto_27421 ?auto_27445 ) ) ( not ( = ?auto_27422 ?auto_27445 ) ) ( not ( = ?auto_27429 ?auto_27434 ) ) ( IS-CRATE ?auto_27421 ) ( not ( = ?auto_27452 ?auto_27427 ) ) ( HOIST-AT ?auto_27447 ?auto_27452 ) ( AVAILABLE ?auto_27447 ) ( SURFACE-AT ?auto_27421 ?auto_27452 ) ( ON ?auto_27421 ?auto_27440 ) ( CLEAR ?auto_27421 ) ( not ( = ?auto_27420 ?auto_27421 ) ) ( not ( = ?auto_27420 ?auto_27440 ) ) ( not ( = ?auto_27421 ?auto_27440 ) ) ( not ( = ?auto_27429 ?auto_27447 ) ) ( IS-CRATE ?auto_27420 ) ( not ( = ?auto_27436 ?auto_27427 ) ) ( HOIST-AT ?auto_27441 ?auto_27436 ) ( AVAILABLE ?auto_27441 ) ( SURFACE-AT ?auto_27420 ?auto_27436 ) ( ON ?auto_27420 ?auto_27439 ) ( CLEAR ?auto_27420 ) ( not ( = ?auto_27419 ?auto_27420 ) ) ( not ( = ?auto_27419 ?auto_27439 ) ) ( not ( = ?auto_27420 ?auto_27439 ) ) ( not ( = ?auto_27429 ?auto_27441 ) ) ( IS-CRATE ?auto_27419 ) ( AVAILABLE ?auto_27451 ) ( SURFACE-AT ?auto_27419 ?auto_27437 ) ( ON ?auto_27419 ?auto_27449 ) ( CLEAR ?auto_27419 ) ( not ( = ?auto_27418 ?auto_27419 ) ) ( not ( = ?auto_27418 ?auto_27449 ) ) ( not ( = ?auto_27419 ?auto_27449 ) ) ( IS-CRATE ?auto_27418 ) ( not ( = ?auto_27446 ?auto_27427 ) ) ( HOIST-AT ?auto_27435 ?auto_27446 ) ( AVAILABLE ?auto_27435 ) ( SURFACE-AT ?auto_27418 ?auto_27446 ) ( ON ?auto_27418 ?auto_27443 ) ( CLEAR ?auto_27418 ) ( not ( = ?auto_27417 ?auto_27418 ) ) ( not ( = ?auto_27417 ?auto_27443 ) ) ( not ( = ?auto_27418 ?auto_27443 ) ) ( not ( = ?auto_27429 ?auto_27435 ) ) ( IS-CRATE ?auto_27417 ) ( not ( = ?auto_27454 ?auto_27427 ) ) ( HOIST-AT ?auto_27448 ?auto_27454 ) ( AVAILABLE ?auto_27448 ) ( SURFACE-AT ?auto_27417 ?auto_27454 ) ( ON ?auto_27417 ?auto_27453 ) ( CLEAR ?auto_27417 ) ( not ( = ?auto_27416 ?auto_27417 ) ) ( not ( = ?auto_27416 ?auto_27453 ) ) ( not ( = ?auto_27417 ?auto_27453 ) ) ( not ( = ?auto_27429 ?auto_27448 ) ) ( SURFACE-AT ?auto_27415 ?auto_27427 ) ( CLEAR ?auto_27415 ) ( IS-CRATE ?auto_27416 ) ( AVAILABLE ?auto_27429 ) ( AVAILABLE ?auto_27434 ) ( SURFACE-AT ?auto_27416 ?auto_27450 ) ( ON ?auto_27416 ?auto_27442 ) ( CLEAR ?auto_27416 ) ( TRUCK-AT ?auto_27428 ?auto_27427 ) ( not ( = ?auto_27415 ?auto_27416 ) ) ( not ( = ?auto_27415 ?auto_27442 ) ) ( not ( = ?auto_27416 ?auto_27442 ) ) ( not ( = ?auto_27415 ?auto_27417 ) ) ( not ( = ?auto_27415 ?auto_27453 ) ) ( not ( = ?auto_27417 ?auto_27442 ) ) ( not ( = ?auto_27454 ?auto_27450 ) ) ( not ( = ?auto_27448 ?auto_27434 ) ) ( not ( = ?auto_27453 ?auto_27442 ) ) ( not ( = ?auto_27415 ?auto_27418 ) ) ( not ( = ?auto_27415 ?auto_27443 ) ) ( not ( = ?auto_27416 ?auto_27418 ) ) ( not ( = ?auto_27416 ?auto_27443 ) ) ( not ( = ?auto_27418 ?auto_27453 ) ) ( not ( = ?auto_27418 ?auto_27442 ) ) ( not ( = ?auto_27446 ?auto_27454 ) ) ( not ( = ?auto_27446 ?auto_27450 ) ) ( not ( = ?auto_27435 ?auto_27448 ) ) ( not ( = ?auto_27435 ?auto_27434 ) ) ( not ( = ?auto_27443 ?auto_27453 ) ) ( not ( = ?auto_27443 ?auto_27442 ) ) ( not ( = ?auto_27415 ?auto_27419 ) ) ( not ( = ?auto_27415 ?auto_27449 ) ) ( not ( = ?auto_27416 ?auto_27419 ) ) ( not ( = ?auto_27416 ?auto_27449 ) ) ( not ( = ?auto_27417 ?auto_27419 ) ) ( not ( = ?auto_27417 ?auto_27449 ) ) ( not ( = ?auto_27419 ?auto_27443 ) ) ( not ( = ?auto_27419 ?auto_27453 ) ) ( not ( = ?auto_27419 ?auto_27442 ) ) ( not ( = ?auto_27437 ?auto_27446 ) ) ( not ( = ?auto_27437 ?auto_27454 ) ) ( not ( = ?auto_27437 ?auto_27450 ) ) ( not ( = ?auto_27451 ?auto_27435 ) ) ( not ( = ?auto_27451 ?auto_27448 ) ) ( not ( = ?auto_27451 ?auto_27434 ) ) ( not ( = ?auto_27449 ?auto_27443 ) ) ( not ( = ?auto_27449 ?auto_27453 ) ) ( not ( = ?auto_27449 ?auto_27442 ) ) ( not ( = ?auto_27415 ?auto_27420 ) ) ( not ( = ?auto_27415 ?auto_27439 ) ) ( not ( = ?auto_27416 ?auto_27420 ) ) ( not ( = ?auto_27416 ?auto_27439 ) ) ( not ( = ?auto_27417 ?auto_27420 ) ) ( not ( = ?auto_27417 ?auto_27439 ) ) ( not ( = ?auto_27418 ?auto_27420 ) ) ( not ( = ?auto_27418 ?auto_27439 ) ) ( not ( = ?auto_27420 ?auto_27449 ) ) ( not ( = ?auto_27420 ?auto_27443 ) ) ( not ( = ?auto_27420 ?auto_27453 ) ) ( not ( = ?auto_27420 ?auto_27442 ) ) ( not ( = ?auto_27436 ?auto_27437 ) ) ( not ( = ?auto_27436 ?auto_27446 ) ) ( not ( = ?auto_27436 ?auto_27454 ) ) ( not ( = ?auto_27436 ?auto_27450 ) ) ( not ( = ?auto_27441 ?auto_27451 ) ) ( not ( = ?auto_27441 ?auto_27435 ) ) ( not ( = ?auto_27441 ?auto_27448 ) ) ( not ( = ?auto_27441 ?auto_27434 ) ) ( not ( = ?auto_27439 ?auto_27449 ) ) ( not ( = ?auto_27439 ?auto_27443 ) ) ( not ( = ?auto_27439 ?auto_27453 ) ) ( not ( = ?auto_27439 ?auto_27442 ) ) ( not ( = ?auto_27415 ?auto_27421 ) ) ( not ( = ?auto_27415 ?auto_27440 ) ) ( not ( = ?auto_27416 ?auto_27421 ) ) ( not ( = ?auto_27416 ?auto_27440 ) ) ( not ( = ?auto_27417 ?auto_27421 ) ) ( not ( = ?auto_27417 ?auto_27440 ) ) ( not ( = ?auto_27418 ?auto_27421 ) ) ( not ( = ?auto_27418 ?auto_27440 ) ) ( not ( = ?auto_27419 ?auto_27421 ) ) ( not ( = ?auto_27419 ?auto_27440 ) ) ( not ( = ?auto_27421 ?auto_27439 ) ) ( not ( = ?auto_27421 ?auto_27449 ) ) ( not ( = ?auto_27421 ?auto_27443 ) ) ( not ( = ?auto_27421 ?auto_27453 ) ) ( not ( = ?auto_27421 ?auto_27442 ) ) ( not ( = ?auto_27452 ?auto_27436 ) ) ( not ( = ?auto_27452 ?auto_27437 ) ) ( not ( = ?auto_27452 ?auto_27446 ) ) ( not ( = ?auto_27452 ?auto_27454 ) ) ( not ( = ?auto_27452 ?auto_27450 ) ) ( not ( = ?auto_27447 ?auto_27441 ) ) ( not ( = ?auto_27447 ?auto_27451 ) ) ( not ( = ?auto_27447 ?auto_27435 ) ) ( not ( = ?auto_27447 ?auto_27448 ) ) ( not ( = ?auto_27447 ?auto_27434 ) ) ( not ( = ?auto_27440 ?auto_27439 ) ) ( not ( = ?auto_27440 ?auto_27449 ) ) ( not ( = ?auto_27440 ?auto_27443 ) ) ( not ( = ?auto_27440 ?auto_27453 ) ) ( not ( = ?auto_27440 ?auto_27442 ) ) ( not ( = ?auto_27415 ?auto_27422 ) ) ( not ( = ?auto_27415 ?auto_27445 ) ) ( not ( = ?auto_27416 ?auto_27422 ) ) ( not ( = ?auto_27416 ?auto_27445 ) ) ( not ( = ?auto_27417 ?auto_27422 ) ) ( not ( = ?auto_27417 ?auto_27445 ) ) ( not ( = ?auto_27418 ?auto_27422 ) ) ( not ( = ?auto_27418 ?auto_27445 ) ) ( not ( = ?auto_27419 ?auto_27422 ) ) ( not ( = ?auto_27419 ?auto_27445 ) ) ( not ( = ?auto_27420 ?auto_27422 ) ) ( not ( = ?auto_27420 ?auto_27445 ) ) ( not ( = ?auto_27422 ?auto_27440 ) ) ( not ( = ?auto_27422 ?auto_27439 ) ) ( not ( = ?auto_27422 ?auto_27449 ) ) ( not ( = ?auto_27422 ?auto_27443 ) ) ( not ( = ?auto_27422 ?auto_27453 ) ) ( not ( = ?auto_27422 ?auto_27442 ) ) ( not ( = ?auto_27445 ?auto_27440 ) ) ( not ( = ?auto_27445 ?auto_27439 ) ) ( not ( = ?auto_27445 ?auto_27449 ) ) ( not ( = ?auto_27445 ?auto_27443 ) ) ( not ( = ?auto_27445 ?auto_27453 ) ) ( not ( = ?auto_27445 ?auto_27442 ) ) ( not ( = ?auto_27415 ?auto_27423 ) ) ( not ( = ?auto_27415 ?auto_27432 ) ) ( not ( = ?auto_27416 ?auto_27423 ) ) ( not ( = ?auto_27416 ?auto_27432 ) ) ( not ( = ?auto_27417 ?auto_27423 ) ) ( not ( = ?auto_27417 ?auto_27432 ) ) ( not ( = ?auto_27418 ?auto_27423 ) ) ( not ( = ?auto_27418 ?auto_27432 ) ) ( not ( = ?auto_27419 ?auto_27423 ) ) ( not ( = ?auto_27419 ?auto_27432 ) ) ( not ( = ?auto_27420 ?auto_27423 ) ) ( not ( = ?auto_27420 ?auto_27432 ) ) ( not ( = ?auto_27421 ?auto_27423 ) ) ( not ( = ?auto_27421 ?auto_27432 ) ) ( not ( = ?auto_27423 ?auto_27445 ) ) ( not ( = ?auto_27423 ?auto_27440 ) ) ( not ( = ?auto_27423 ?auto_27439 ) ) ( not ( = ?auto_27423 ?auto_27449 ) ) ( not ( = ?auto_27423 ?auto_27443 ) ) ( not ( = ?auto_27423 ?auto_27453 ) ) ( not ( = ?auto_27423 ?auto_27442 ) ) ( not ( = ?auto_27444 ?auto_27450 ) ) ( not ( = ?auto_27444 ?auto_27452 ) ) ( not ( = ?auto_27444 ?auto_27436 ) ) ( not ( = ?auto_27444 ?auto_27437 ) ) ( not ( = ?auto_27444 ?auto_27446 ) ) ( not ( = ?auto_27444 ?auto_27454 ) ) ( not ( = ?auto_27438 ?auto_27434 ) ) ( not ( = ?auto_27438 ?auto_27447 ) ) ( not ( = ?auto_27438 ?auto_27441 ) ) ( not ( = ?auto_27438 ?auto_27451 ) ) ( not ( = ?auto_27438 ?auto_27435 ) ) ( not ( = ?auto_27438 ?auto_27448 ) ) ( not ( = ?auto_27432 ?auto_27445 ) ) ( not ( = ?auto_27432 ?auto_27440 ) ) ( not ( = ?auto_27432 ?auto_27439 ) ) ( not ( = ?auto_27432 ?auto_27449 ) ) ( not ( = ?auto_27432 ?auto_27443 ) ) ( not ( = ?auto_27432 ?auto_27453 ) ) ( not ( = ?auto_27432 ?auto_27442 ) ) ( not ( = ?auto_27415 ?auto_27424 ) ) ( not ( = ?auto_27415 ?auto_27433 ) ) ( not ( = ?auto_27416 ?auto_27424 ) ) ( not ( = ?auto_27416 ?auto_27433 ) ) ( not ( = ?auto_27417 ?auto_27424 ) ) ( not ( = ?auto_27417 ?auto_27433 ) ) ( not ( = ?auto_27418 ?auto_27424 ) ) ( not ( = ?auto_27418 ?auto_27433 ) ) ( not ( = ?auto_27419 ?auto_27424 ) ) ( not ( = ?auto_27419 ?auto_27433 ) ) ( not ( = ?auto_27420 ?auto_27424 ) ) ( not ( = ?auto_27420 ?auto_27433 ) ) ( not ( = ?auto_27421 ?auto_27424 ) ) ( not ( = ?auto_27421 ?auto_27433 ) ) ( not ( = ?auto_27422 ?auto_27424 ) ) ( not ( = ?auto_27422 ?auto_27433 ) ) ( not ( = ?auto_27424 ?auto_27432 ) ) ( not ( = ?auto_27424 ?auto_27445 ) ) ( not ( = ?auto_27424 ?auto_27440 ) ) ( not ( = ?auto_27424 ?auto_27439 ) ) ( not ( = ?auto_27424 ?auto_27449 ) ) ( not ( = ?auto_27424 ?auto_27443 ) ) ( not ( = ?auto_27424 ?auto_27453 ) ) ( not ( = ?auto_27424 ?auto_27442 ) ) ( not ( = ?auto_27433 ?auto_27432 ) ) ( not ( = ?auto_27433 ?auto_27445 ) ) ( not ( = ?auto_27433 ?auto_27440 ) ) ( not ( = ?auto_27433 ?auto_27439 ) ) ( not ( = ?auto_27433 ?auto_27449 ) ) ( not ( = ?auto_27433 ?auto_27443 ) ) ( not ( = ?auto_27433 ?auto_27453 ) ) ( not ( = ?auto_27433 ?auto_27442 ) ) ( not ( = ?auto_27415 ?auto_27425 ) ) ( not ( = ?auto_27415 ?auto_27426 ) ) ( not ( = ?auto_27416 ?auto_27425 ) ) ( not ( = ?auto_27416 ?auto_27426 ) ) ( not ( = ?auto_27417 ?auto_27425 ) ) ( not ( = ?auto_27417 ?auto_27426 ) ) ( not ( = ?auto_27418 ?auto_27425 ) ) ( not ( = ?auto_27418 ?auto_27426 ) ) ( not ( = ?auto_27419 ?auto_27425 ) ) ( not ( = ?auto_27419 ?auto_27426 ) ) ( not ( = ?auto_27420 ?auto_27425 ) ) ( not ( = ?auto_27420 ?auto_27426 ) ) ( not ( = ?auto_27421 ?auto_27425 ) ) ( not ( = ?auto_27421 ?auto_27426 ) ) ( not ( = ?auto_27422 ?auto_27425 ) ) ( not ( = ?auto_27422 ?auto_27426 ) ) ( not ( = ?auto_27423 ?auto_27425 ) ) ( not ( = ?auto_27423 ?auto_27426 ) ) ( not ( = ?auto_27425 ?auto_27433 ) ) ( not ( = ?auto_27425 ?auto_27432 ) ) ( not ( = ?auto_27425 ?auto_27445 ) ) ( not ( = ?auto_27425 ?auto_27440 ) ) ( not ( = ?auto_27425 ?auto_27439 ) ) ( not ( = ?auto_27425 ?auto_27449 ) ) ( not ( = ?auto_27425 ?auto_27443 ) ) ( not ( = ?auto_27425 ?auto_27453 ) ) ( not ( = ?auto_27425 ?auto_27442 ) ) ( not ( = ?auto_27431 ?auto_27437 ) ) ( not ( = ?auto_27431 ?auto_27444 ) ) ( not ( = ?auto_27431 ?auto_27450 ) ) ( not ( = ?auto_27431 ?auto_27452 ) ) ( not ( = ?auto_27431 ?auto_27436 ) ) ( not ( = ?auto_27431 ?auto_27446 ) ) ( not ( = ?auto_27431 ?auto_27454 ) ) ( not ( = ?auto_27430 ?auto_27451 ) ) ( not ( = ?auto_27430 ?auto_27438 ) ) ( not ( = ?auto_27430 ?auto_27434 ) ) ( not ( = ?auto_27430 ?auto_27447 ) ) ( not ( = ?auto_27430 ?auto_27441 ) ) ( not ( = ?auto_27430 ?auto_27435 ) ) ( not ( = ?auto_27430 ?auto_27448 ) ) ( not ( = ?auto_27426 ?auto_27433 ) ) ( not ( = ?auto_27426 ?auto_27432 ) ) ( not ( = ?auto_27426 ?auto_27445 ) ) ( not ( = ?auto_27426 ?auto_27440 ) ) ( not ( = ?auto_27426 ?auto_27439 ) ) ( not ( = ?auto_27426 ?auto_27449 ) ) ( not ( = ?auto_27426 ?auto_27443 ) ) ( not ( = ?auto_27426 ?auto_27453 ) ) ( not ( = ?auto_27426 ?auto_27442 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_27415 ?auto_27416 ?auto_27417 ?auto_27418 ?auto_27419 ?auto_27420 ?auto_27421 ?auto_27422 ?auto_27423 ?auto_27424 )
      ( MAKE-1CRATE ?auto_27424 ?auto_27425 )
      ( MAKE-10CRATE-VERIFY ?auto_27415 ?auto_27416 ?auto_27417 ?auto_27418 ?auto_27419 ?auto_27420 ?auto_27421 ?auto_27422 ?auto_27423 ?auto_27424 ?auto_27425 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_27477 - SURFACE
      ?auto_27478 - SURFACE
      ?auto_27479 - SURFACE
      ?auto_27480 - SURFACE
      ?auto_27481 - SURFACE
      ?auto_27482 - SURFACE
      ?auto_27483 - SURFACE
      ?auto_27484 - SURFACE
      ?auto_27485 - SURFACE
      ?auto_27486 - SURFACE
      ?auto_27487 - SURFACE
      ?auto_27488 - SURFACE
    )
    :vars
    (
      ?auto_27492 - HOIST
      ?auto_27494 - PLACE
      ?auto_27490 - PLACE
      ?auto_27489 - HOIST
      ?auto_27493 - SURFACE
      ?auto_27510 - PLACE
      ?auto_27497 - HOIST
      ?auto_27501 - SURFACE
      ?auto_27500 - PLACE
      ?auto_27496 - HOIST
      ?auto_27512 - SURFACE
      ?auto_27517 - PLACE
      ?auto_27495 - HOIST
      ?auto_27516 - SURFACE
      ?auto_27511 - PLACE
      ?auto_27505 - HOIST
      ?auto_27520 - SURFACE
      ?auto_27506 - PLACE
      ?auto_27519 - HOIST
      ?auto_27503 - SURFACE
      ?auto_27499 - PLACE
      ?auto_27502 - HOIST
      ?auto_27498 - SURFACE
      ?auto_27504 - SURFACE
      ?auto_27507 - PLACE
      ?auto_27509 - HOIST
      ?auto_27514 - SURFACE
      ?auto_27508 - PLACE
      ?auto_27513 - HOIST
      ?auto_27515 - SURFACE
      ?auto_27518 - SURFACE
      ?auto_27491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27492 ?auto_27494 ) ( IS-CRATE ?auto_27488 ) ( not ( = ?auto_27490 ?auto_27494 ) ) ( HOIST-AT ?auto_27489 ?auto_27490 ) ( AVAILABLE ?auto_27489 ) ( SURFACE-AT ?auto_27488 ?auto_27490 ) ( ON ?auto_27488 ?auto_27493 ) ( CLEAR ?auto_27488 ) ( not ( = ?auto_27487 ?auto_27488 ) ) ( not ( = ?auto_27487 ?auto_27493 ) ) ( not ( = ?auto_27488 ?auto_27493 ) ) ( not ( = ?auto_27492 ?auto_27489 ) ) ( IS-CRATE ?auto_27487 ) ( not ( = ?auto_27510 ?auto_27494 ) ) ( HOIST-AT ?auto_27497 ?auto_27510 ) ( AVAILABLE ?auto_27497 ) ( SURFACE-AT ?auto_27487 ?auto_27510 ) ( ON ?auto_27487 ?auto_27501 ) ( CLEAR ?auto_27487 ) ( not ( = ?auto_27486 ?auto_27487 ) ) ( not ( = ?auto_27486 ?auto_27501 ) ) ( not ( = ?auto_27487 ?auto_27501 ) ) ( not ( = ?auto_27492 ?auto_27497 ) ) ( IS-CRATE ?auto_27486 ) ( not ( = ?auto_27500 ?auto_27494 ) ) ( HOIST-AT ?auto_27496 ?auto_27500 ) ( SURFACE-AT ?auto_27486 ?auto_27500 ) ( ON ?auto_27486 ?auto_27512 ) ( CLEAR ?auto_27486 ) ( not ( = ?auto_27485 ?auto_27486 ) ) ( not ( = ?auto_27485 ?auto_27512 ) ) ( not ( = ?auto_27486 ?auto_27512 ) ) ( not ( = ?auto_27492 ?auto_27496 ) ) ( IS-CRATE ?auto_27485 ) ( not ( = ?auto_27517 ?auto_27494 ) ) ( HOIST-AT ?auto_27495 ?auto_27517 ) ( AVAILABLE ?auto_27495 ) ( SURFACE-AT ?auto_27485 ?auto_27517 ) ( ON ?auto_27485 ?auto_27516 ) ( CLEAR ?auto_27485 ) ( not ( = ?auto_27484 ?auto_27485 ) ) ( not ( = ?auto_27484 ?auto_27516 ) ) ( not ( = ?auto_27485 ?auto_27516 ) ) ( not ( = ?auto_27492 ?auto_27495 ) ) ( IS-CRATE ?auto_27484 ) ( not ( = ?auto_27511 ?auto_27494 ) ) ( HOIST-AT ?auto_27505 ?auto_27511 ) ( SURFACE-AT ?auto_27484 ?auto_27511 ) ( ON ?auto_27484 ?auto_27520 ) ( CLEAR ?auto_27484 ) ( not ( = ?auto_27483 ?auto_27484 ) ) ( not ( = ?auto_27483 ?auto_27520 ) ) ( not ( = ?auto_27484 ?auto_27520 ) ) ( not ( = ?auto_27492 ?auto_27505 ) ) ( IS-CRATE ?auto_27483 ) ( not ( = ?auto_27506 ?auto_27494 ) ) ( HOIST-AT ?auto_27519 ?auto_27506 ) ( AVAILABLE ?auto_27519 ) ( SURFACE-AT ?auto_27483 ?auto_27506 ) ( ON ?auto_27483 ?auto_27503 ) ( CLEAR ?auto_27483 ) ( not ( = ?auto_27482 ?auto_27483 ) ) ( not ( = ?auto_27482 ?auto_27503 ) ) ( not ( = ?auto_27483 ?auto_27503 ) ) ( not ( = ?auto_27492 ?auto_27519 ) ) ( IS-CRATE ?auto_27482 ) ( not ( = ?auto_27499 ?auto_27494 ) ) ( HOIST-AT ?auto_27502 ?auto_27499 ) ( AVAILABLE ?auto_27502 ) ( SURFACE-AT ?auto_27482 ?auto_27499 ) ( ON ?auto_27482 ?auto_27498 ) ( CLEAR ?auto_27482 ) ( not ( = ?auto_27481 ?auto_27482 ) ) ( not ( = ?auto_27481 ?auto_27498 ) ) ( not ( = ?auto_27482 ?auto_27498 ) ) ( not ( = ?auto_27492 ?auto_27502 ) ) ( IS-CRATE ?auto_27481 ) ( AVAILABLE ?auto_27496 ) ( SURFACE-AT ?auto_27481 ?auto_27500 ) ( ON ?auto_27481 ?auto_27504 ) ( CLEAR ?auto_27481 ) ( not ( = ?auto_27480 ?auto_27481 ) ) ( not ( = ?auto_27480 ?auto_27504 ) ) ( not ( = ?auto_27481 ?auto_27504 ) ) ( IS-CRATE ?auto_27480 ) ( not ( = ?auto_27507 ?auto_27494 ) ) ( HOIST-AT ?auto_27509 ?auto_27507 ) ( AVAILABLE ?auto_27509 ) ( SURFACE-AT ?auto_27480 ?auto_27507 ) ( ON ?auto_27480 ?auto_27514 ) ( CLEAR ?auto_27480 ) ( not ( = ?auto_27479 ?auto_27480 ) ) ( not ( = ?auto_27479 ?auto_27514 ) ) ( not ( = ?auto_27480 ?auto_27514 ) ) ( not ( = ?auto_27492 ?auto_27509 ) ) ( IS-CRATE ?auto_27479 ) ( not ( = ?auto_27508 ?auto_27494 ) ) ( HOIST-AT ?auto_27513 ?auto_27508 ) ( AVAILABLE ?auto_27513 ) ( SURFACE-AT ?auto_27479 ?auto_27508 ) ( ON ?auto_27479 ?auto_27515 ) ( CLEAR ?auto_27479 ) ( not ( = ?auto_27478 ?auto_27479 ) ) ( not ( = ?auto_27478 ?auto_27515 ) ) ( not ( = ?auto_27479 ?auto_27515 ) ) ( not ( = ?auto_27492 ?auto_27513 ) ) ( SURFACE-AT ?auto_27477 ?auto_27494 ) ( CLEAR ?auto_27477 ) ( IS-CRATE ?auto_27478 ) ( AVAILABLE ?auto_27492 ) ( AVAILABLE ?auto_27505 ) ( SURFACE-AT ?auto_27478 ?auto_27511 ) ( ON ?auto_27478 ?auto_27518 ) ( CLEAR ?auto_27478 ) ( TRUCK-AT ?auto_27491 ?auto_27494 ) ( not ( = ?auto_27477 ?auto_27478 ) ) ( not ( = ?auto_27477 ?auto_27518 ) ) ( not ( = ?auto_27478 ?auto_27518 ) ) ( not ( = ?auto_27477 ?auto_27479 ) ) ( not ( = ?auto_27477 ?auto_27515 ) ) ( not ( = ?auto_27479 ?auto_27518 ) ) ( not ( = ?auto_27508 ?auto_27511 ) ) ( not ( = ?auto_27513 ?auto_27505 ) ) ( not ( = ?auto_27515 ?auto_27518 ) ) ( not ( = ?auto_27477 ?auto_27480 ) ) ( not ( = ?auto_27477 ?auto_27514 ) ) ( not ( = ?auto_27478 ?auto_27480 ) ) ( not ( = ?auto_27478 ?auto_27514 ) ) ( not ( = ?auto_27480 ?auto_27515 ) ) ( not ( = ?auto_27480 ?auto_27518 ) ) ( not ( = ?auto_27507 ?auto_27508 ) ) ( not ( = ?auto_27507 ?auto_27511 ) ) ( not ( = ?auto_27509 ?auto_27513 ) ) ( not ( = ?auto_27509 ?auto_27505 ) ) ( not ( = ?auto_27514 ?auto_27515 ) ) ( not ( = ?auto_27514 ?auto_27518 ) ) ( not ( = ?auto_27477 ?auto_27481 ) ) ( not ( = ?auto_27477 ?auto_27504 ) ) ( not ( = ?auto_27478 ?auto_27481 ) ) ( not ( = ?auto_27478 ?auto_27504 ) ) ( not ( = ?auto_27479 ?auto_27481 ) ) ( not ( = ?auto_27479 ?auto_27504 ) ) ( not ( = ?auto_27481 ?auto_27514 ) ) ( not ( = ?auto_27481 ?auto_27515 ) ) ( not ( = ?auto_27481 ?auto_27518 ) ) ( not ( = ?auto_27500 ?auto_27507 ) ) ( not ( = ?auto_27500 ?auto_27508 ) ) ( not ( = ?auto_27500 ?auto_27511 ) ) ( not ( = ?auto_27496 ?auto_27509 ) ) ( not ( = ?auto_27496 ?auto_27513 ) ) ( not ( = ?auto_27496 ?auto_27505 ) ) ( not ( = ?auto_27504 ?auto_27514 ) ) ( not ( = ?auto_27504 ?auto_27515 ) ) ( not ( = ?auto_27504 ?auto_27518 ) ) ( not ( = ?auto_27477 ?auto_27482 ) ) ( not ( = ?auto_27477 ?auto_27498 ) ) ( not ( = ?auto_27478 ?auto_27482 ) ) ( not ( = ?auto_27478 ?auto_27498 ) ) ( not ( = ?auto_27479 ?auto_27482 ) ) ( not ( = ?auto_27479 ?auto_27498 ) ) ( not ( = ?auto_27480 ?auto_27482 ) ) ( not ( = ?auto_27480 ?auto_27498 ) ) ( not ( = ?auto_27482 ?auto_27504 ) ) ( not ( = ?auto_27482 ?auto_27514 ) ) ( not ( = ?auto_27482 ?auto_27515 ) ) ( not ( = ?auto_27482 ?auto_27518 ) ) ( not ( = ?auto_27499 ?auto_27500 ) ) ( not ( = ?auto_27499 ?auto_27507 ) ) ( not ( = ?auto_27499 ?auto_27508 ) ) ( not ( = ?auto_27499 ?auto_27511 ) ) ( not ( = ?auto_27502 ?auto_27496 ) ) ( not ( = ?auto_27502 ?auto_27509 ) ) ( not ( = ?auto_27502 ?auto_27513 ) ) ( not ( = ?auto_27502 ?auto_27505 ) ) ( not ( = ?auto_27498 ?auto_27504 ) ) ( not ( = ?auto_27498 ?auto_27514 ) ) ( not ( = ?auto_27498 ?auto_27515 ) ) ( not ( = ?auto_27498 ?auto_27518 ) ) ( not ( = ?auto_27477 ?auto_27483 ) ) ( not ( = ?auto_27477 ?auto_27503 ) ) ( not ( = ?auto_27478 ?auto_27483 ) ) ( not ( = ?auto_27478 ?auto_27503 ) ) ( not ( = ?auto_27479 ?auto_27483 ) ) ( not ( = ?auto_27479 ?auto_27503 ) ) ( not ( = ?auto_27480 ?auto_27483 ) ) ( not ( = ?auto_27480 ?auto_27503 ) ) ( not ( = ?auto_27481 ?auto_27483 ) ) ( not ( = ?auto_27481 ?auto_27503 ) ) ( not ( = ?auto_27483 ?auto_27498 ) ) ( not ( = ?auto_27483 ?auto_27504 ) ) ( not ( = ?auto_27483 ?auto_27514 ) ) ( not ( = ?auto_27483 ?auto_27515 ) ) ( not ( = ?auto_27483 ?auto_27518 ) ) ( not ( = ?auto_27506 ?auto_27499 ) ) ( not ( = ?auto_27506 ?auto_27500 ) ) ( not ( = ?auto_27506 ?auto_27507 ) ) ( not ( = ?auto_27506 ?auto_27508 ) ) ( not ( = ?auto_27506 ?auto_27511 ) ) ( not ( = ?auto_27519 ?auto_27502 ) ) ( not ( = ?auto_27519 ?auto_27496 ) ) ( not ( = ?auto_27519 ?auto_27509 ) ) ( not ( = ?auto_27519 ?auto_27513 ) ) ( not ( = ?auto_27519 ?auto_27505 ) ) ( not ( = ?auto_27503 ?auto_27498 ) ) ( not ( = ?auto_27503 ?auto_27504 ) ) ( not ( = ?auto_27503 ?auto_27514 ) ) ( not ( = ?auto_27503 ?auto_27515 ) ) ( not ( = ?auto_27503 ?auto_27518 ) ) ( not ( = ?auto_27477 ?auto_27484 ) ) ( not ( = ?auto_27477 ?auto_27520 ) ) ( not ( = ?auto_27478 ?auto_27484 ) ) ( not ( = ?auto_27478 ?auto_27520 ) ) ( not ( = ?auto_27479 ?auto_27484 ) ) ( not ( = ?auto_27479 ?auto_27520 ) ) ( not ( = ?auto_27480 ?auto_27484 ) ) ( not ( = ?auto_27480 ?auto_27520 ) ) ( not ( = ?auto_27481 ?auto_27484 ) ) ( not ( = ?auto_27481 ?auto_27520 ) ) ( not ( = ?auto_27482 ?auto_27484 ) ) ( not ( = ?auto_27482 ?auto_27520 ) ) ( not ( = ?auto_27484 ?auto_27503 ) ) ( not ( = ?auto_27484 ?auto_27498 ) ) ( not ( = ?auto_27484 ?auto_27504 ) ) ( not ( = ?auto_27484 ?auto_27514 ) ) ( not ( = ?auto_27484 ?auto_27515 ) ) ( not ( = ?auto_27484 ?auto_27518 ) ) ( not ( = ?auto_27520 ?auto_27503 ) ) ( not ( = ?auto_27520 ?auto_27498 ) ) ( not ( = ?auto_27520 ?auto_27504 ) ) ( not ( = ?auto_27520 ?auto_27514 ) ) ( not ( = ?auto_27520 ?auto_27515 ) ) ( not ( = ?auto_27520 ?auto_27518 ) ) ( not ( = ?auto_27477 ?auto_27485 ) ) ( not ( = ?auto_27477 ?auto_27516 ) ) ( not ( = ?auto_27478 ?auto_27485 ) ) ( not ( = ?auto_27478 ?auto_27516 ) ) ( not ( = ?auto_27479 ?auto_27485 ) ) ( not ( = ?auto_27479 ?auto_27516 ) ) ( not ( = ?auto_27480 ?auto_27485 ) ) ( not ( = ?auto_27480 ?auto_27516 ) ) ( not ( = ?auto_27481 ?auto_27485 ) ) ( not ( = ?auto_27481 ?auto_27516 ) ) ( not ( = ?auto_27482 ?auto_27485 ) ) ( not ( = ?auto_27482 ?auto_27516 ) ) ( not ( = ?auto_27483 ?auto_27485 ) ) ( not ( = ?auto_27483 ?auto_27516 ) ) ( not ( = ?auto_27485 ?auto_27520 ) ) ( not ( = ?auto_27485 ?auto_27503 ) ) ( not ( = ?auto_27485 ?auto_27498 ) ) ( not ( = ?auto_27485 ?auto_27504 ) ) ( not ( = ?auto_27485 ?auto_27514 ) ) ( not ( = ?auto_27485 ?auto_27515 ) ) ( not ( = ?auto_27485 ?auto_27518 ) ) ( not ( = ?auto_27517 ?auto_27511 ) ) ( not ( = ?auto_27517 ?auto_27506 ) ) ( not ( = ?auto_27517 ?auto_27499 ) ) ( not ( = ?auto_27517 ?auto_27500 ) ) ( not ( = ?auto_27517 ?auto_27507 ) ) ( not ( = ?auto_27517 ?auto_27508 ) ) ( not ( = ?auto_27495 ?auto_27505 ) ) ( not ( = ?auto_27495 ?auto_27519 ) ) ( not ( = ?auto_27495 ?auto_27502 ) ) ( not ( = ?auto_27495 ?auto_27496 ) ) ( not ( = ?auto_27495 ?auto_27509 ) ) ( not ( = ?auto_27495 ?auto_27513 ) ) ( not ( = ?auto_27516 ?auto_27520 ) ) ( not ( = ?auto_27516 ?auto_27503 ) ) ( not ( = ?auto_27516 ?auto_27498 ) ) ( not ( = ?auto_27516 ?auto_27504 ) ) ( not ( = ?auto_27516 ?auto_27514 ) ) ( not ( = ?auto_27516 ?auto_27515 ) ) ( not ( = ?auto_27516 ?auto_27518 ) ) ( not ( = ?auto_27477 ?auto_27486 ) ) ( not ( = ?auto_27477 ?auto_27512 ) ) ( not ( = ?auto_27478 ?auto_27486 ) ) ( not ( = ?auto_27478 ?auto_27512 ) ) ( not ( = ?auto_27479 ?auto_27486 ) ) ( not ( = ?auto_27479 ?auto_27512 ) ) ( not ( = ?auto_27480 ?auto_27486 ) ) ( not ( = ?auto_27480 ?auto_27512 ) ) ( not ( = ?auto_27481 ?auto_27486 ) ) ( not ( = ?auto_27481 ?auto_27512 ) ) ( not ( = ?auto_27482 ?auto_27486 ) ) ( not ( = ?auto_27482 ?auto_27512 ) ) ( not ( = ?auto_27483 ?auto_27486 ) ) ( not ( = ?auto_27483 ?auto_27512 ) ) ( not ( = ?auto_27484 ?auto_27486 ) ) ( not ( = ?auto_27484 ?auto_27512 ) ) ( not ( = ?auto_27486 ?auto_27516 ) ) ( not ( = ?auto_27486 ?auto_27520 ) ) ( not ( = ?auto_27486 ?auto_27503 ) ) ( not ( = ?auto_27486 ?auto_27498 ) ) ( not ( = ?auto_27486 ?auto_27504 ) ) ( not ( = ?auto_27486 ?auto_27514 ) ) ( not ( = ?auto_27486 ?auto_27515 ) ) ( not ( = ?auto_27486 ?auto_27518 ) ) ( not ( = ?auto_27512 ?auto_27516 ) ) ( not ( = ?auto_27512 ?auto_27520 ) ) ( not ( = ?auto_27512 ?auto_27503 ) ) ( not ( = ?auto_27512 ?auto_27498 ) ) ( not ( = ?auto_27512 ?auto_27504 ) ) ( not ( = ?auto_27512 ?auto_27514 ) ) ( not ( = ?auto_27512 ?auto_27515 ) ) ( not ( = ?auto_27512 ?auto_27518 ) ) ( not ( = ?auto_27477 ?auto_27487 ) ) ( not ( = ?auto_27477 ?auto_27501 ) ) ( not ( = ?auto_27478 ?auto_27487 ) ) ( not ( = ?auto_27478 ?auto_27501 ) ) ( not ( = ?auto_27479 ?auto_27487 ) ) ( not ( = ?auto_27479 ?auto_27501 ) ) ( not ( = ?auto_27480 ?auto_27487 ) ) ( not ( = ?auto_27480 ?auto_27501 ) ) ( not ( = ?auto_27481 ?auto_27487 ) ) ( not ( = ?auto_27481 ?auto_27501 ) ) ( not ( = ?auto_27482 ?auto_27487 ) ) ( not ( = ?auto_27482 ?auto_27501 ) ) ( not ( = ?auto_27483 ?auto_27487 ) ) ( not ( = ?auto_27483 ?auto_27501 ) ) ( not ( = ?auto_27484 ?auto_27487 ) ) ( not ( = ?auto_27484 ?auto_27501 ) ) ( not ( = ?auto_27485 ?auto_27487 ) ) ( not ( = ?auto_27485 ?auto_27501 ) ) ( not ( = ?auto_27487 ?auto_27512 ) ) ( not ( = ?auto_27487 ?auto_27516 ) ) ( not ( = ?auto_27487 ?auto_27520 ) ) ( not ( = ?auto_27487 ?auto_27503 ) ) ( not ( = ?auto_27487 ?auto_27498 ) ) ( not ( = ?auto_27487 ?auto_27504 ) ) ( not ( = ?auto_27487 ?auto_27514 ) ) ( not ( = ?auto_27487 ?auto_27515 ) ) ( not ( = ?auto_27487 ?auto_27518 ) ) ( not ( = ?auto_27510 ?auto_27500 ) ) ( not ( = ?auto_27510 ?auto_27517 ) ) ( not ( = ?auto_27510 ?auto_27511 ) ) ( not ( = ?auto_27510 ?auto_27506 ) ) ( not ( = ?auto_27510 ?auto_27499 ) ) ( not ( = ?auto_27510 ?auto_27507 ) ) ( not ( = ?auto_27510 ?auto_27508 ) ) ( not ( = ?auto_27497 ?auto_27496 ) ) ( not ( = ?auto_27497 ?auto_27495 ) ) ( not ( = ?auto_27497 ?auto_27505 ) ) ( not ( = ?auto_27497 ?auto_27519 ) ) ( not ( = ?auto_27497 ?auto_27502 ) ) ( not ( = ?auto_27497 ?auto_27509 ) ) ( not ( = ?auto_27497 ?auto_27513 ) ) ( not ( = ?auto_27501 ?auto_27512 ) ) ( not ( = ?auto_27501 ?auto_27516 ) ) ( not ( = ?auto_27501 ?auto_27520 ) ) ( not ( = ?auto_27501 ?auto_27503 ) ) ( not ( = ?auto_27501 ?auto_27498 ) ) ( not ( = ?auto_27501 ?auto_27504 ) ) ( not ( = ?auto_27501 ?auto_27514 ) ) ( not ( = ?auto_27501 ?auto_27515 ) ) ( not ( = ?auto_27501 ?auto_27518 ) ) ( not ( = ?auto_27477 ?auto_27488 ) ) ( not ( = ?auto_27477 ?auto_27493 ) ) ( not ( = ?auto_27478 ?auto_27488 ) ) ( not ( = ?auto_27478 ?auto_27493 ) ) ( not ( = ?auto_27479 ?auto_27488 ) ) ( not ( = ?auto_27479 ?auto_27493 ) ) ( not ( = ?auto_27480 ?auto_27488 ) ) ( not ( = ?auto_27480 ?auto_27493 ) ) ( not ( = ?auto_27481 ?auto_27488 ) ) ( not ( = ?auto_27481 ?auto_27493 ) ) ( not ( = ?auto_27482 ?auto_27488 ) ) ( not ( = ?auto_27482 ?auto_27493 ) ) ( not ( = ?auto_27483 ?auto_27488 ) ) ( not ( = ?auto_27483 ?auto_27493 ) ) ( not ( = ?auto_27484 ?auto_27488 ) ) ( not ( = ?auto_27484 ?auto_27493 ) ) ( not ( = ?auto_27485 ?auto_27488 ) ) ( not ( = ?auto_27485 ?auto_27493 ) ) ( not ( = ?auto_27486 ?auto_27488 ) ) ( not ( = ?auto_27486 ?auto_27493 ) ) ( not ( = ?auto_27488 ?auto_27501 ) ) ( not ( = ?auto_27488 ?auto_27512 ) ) ( not ( = ?auto_27488 ?auto_27516 ) ) ( not ( = ?auto_27488 ?auto_27520 ) ) ( not ( = ?auto_27488 ?auto_27503 ) ) ( not ( = ?auto_27488 ?auto_27498 ) ) ( not ( = ?auto_27488 ?auto_27504 ) ) ( not ( = ?auto_27488 ?auto_27514 ) ) ( not ( = ?auto_27488 ?auto_27515 ) ) ( not ( = ?auto_27488 ?auto_27518 ) ) ( not ( = ?auto_27490 ?auto_27510 ) ) ( not ( = ?auto_27490 ?auto_27500 ) ) ( not ( = ?auto_27490 ?auto_27517 ) ) ( not ( = ?auto_27490 ?auto_27511 ) ) ( not ( = ?auto_27490 ?auto_27506 ) ) ( not ( = ?auto_27490 ?auto_27499 ) ) ( not ( = ?auto_27490 ?auto_27507 ) ) ( not ( = ?auto_27490 ?auto_27508 ) ) ( not ( = ?auto_27489 ?auto_27497 ) ) ( not ( = ?auto_27489 ?auto_27496 ) ) ( not ( = ?auto_27489 ?auto_27495 ) ) ( not ( = ?auto_27489 ?auto_27505 ) ) ( not ( = ?auto_27489 ?auto_27519 ) ) ( not ( = ?auto_27489 ?auto_27502 ) ) ( not ( = ?auto_27489 ?auto_27509 ) ) ( not ( = ?auto_27489 ?auto_27513 ) ) ( not ( = ?auto_27493 ?auto_27501 ) ) ( not ( = ?auto_27493 ?auto_27512 ) ) ( not ( = ?auto_27493 ?auto_27516 ) ) ( not ( = ?auto_27493 ?auto_27520 ) ) ( not ( = ?auto_27493 ?auto_27503 ) ) ( not ( = ?auto_27493 ?auto_27498 ) ) ( not ( = ?auto_27493 ?auto_27504 ) ) ( not ( = ?auto_27493 ?auto_27514 ) ) ( not ( = ?auto_27493 ?auto_27515 ) ) ( not ( = ?auto_27493 ?auto_27518 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_27477 ?auto_27478 ?auto_27479 ?auto_27480 ?auto_27481 ?auto_27482 ?auto_27483 ?auto_27484 ?auto_27485 ?auto_27486 ?auto_27487 )
      ( MAKE-1CRATE ?auto_27487 ?auto_27488 )
      ( MAKE-11CRATE-VERIFY ?auto_27477 ?auto_27478 ?auto_27479 ?auto_27480 ?auto_27481 ?auto_27482 ?auto_27483 ?auto_27484 ?auto_27485 ?auto_27486 ?auto_27487 ?auto_27488 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_27544 - SURFACE
      ?auto_27545 - SURFACE
      ?auto_27546 - SURFACE
      ?auto_27547 - SURFACE
      ?auto_27548 - SURFACE
      ?auto_27549 - SURFACE
      ?auto_27550 - SURFACE
      ?auto_27551 - SURFACE
      ?auto_27552 - SURFACE
      ?auto_27553 - SURFACE
      ?auto_27554 - SURFACE
      ?auto_27555 - SURFACE
      ?auto_27556 - SURFACE
    )
    :vars
    (
      ?auto_27558 - HOIST
      ?auto_27562 - PLACE
      ?auto_27559 - PLACE
      ?auto_27557 - HOIST
      ?auto_27561 - SURFACE
      ?auto_27585 - PLACE
      ?auto_27568 - HOIST
      ?auto_27572 - SURFACE
      ?auto_27589 - PLACE
      ?auto_27579 - HOIST
      ?auto_27578 - SURFACE
      ?auto_27587 - PLACE
      ?auto_27575 - HOIST
      ?auto_27584 - SURFACE
      ?auto_27590 - PLACE
      ?auto_27583 - HOIST
      ?auto_27563 - SURFACE
      ?auto_27570 - PLACE
      ?auto_27576 - HOIST
      ?auto_27580 - SURFACE
      ?auto_27586 - PLACE
      ?auto_27565 - HOIST
      ?auto_27591 - SURFACE
      ?auto_27571 - PLACE
      ?auto_27574 - HOIST
      ?auto_27567 - SURFACE
      ?auto_27577 - SURFACE
      ?auto_27564 - PLACE
      ?auto_27588 - HOIST
      ?auto_27581 - SURFACE
      ?auto_27573 - PLACE
      ?auto_27582 - HOIST
      ?auto_27569 - SURFACE
      ?auto_27566 - SURFACE
      ?auto_27560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27558 ?auto_27562 ) ( IS-CRATE ?auto_27556 ) ( not ( = ?auto_27559 ?auto_27562 ) ) ( HOIST-AT ?auto_27557 ?auto_27559 ) ( AVAILABLE ?auto_27557 ) ( SURFACE-AT ?auto_27556 ?auto_27559 ) ( ON ?auto_27556 ?auto_27561 ) ( CLEAR ?auto_27556 ) ( not ( = ?auto_27555 ?auto_27556 ) ) ( not ( = ?auto_27555 ?auto_27561 ) ) ( not ( = ?auto_27556 ?auto_27561 ) ) ( not ( = ?auto_27558 ?auto_27557 ) ) ( IS-CRATE ?auto_27555 ) ( not ( = ?auto_27585 ?auto_27562 ) ) ( HOIST-AT ?auto_27568 ?auto_27585 ) ( AVAILABLE ?auto_27568 ) ( SURFACE-AT ?auto_27555 ?auto_27585 ) ( ON ?auto_27555 ?auto_27572 ) ( CLEAR ?auto_27555 ) ( not ( = ?auto_27554 ?auto_27555 ) ) ( not ( = ?auto_27554 ?auto_27572 ) ) ( not ( = ?auto_27555 ?auto_27572 ) ) ( not ( = ?auto_27558 ?auto_27568 ) ) ( IS-CRATE ?auto_27554 ) ( not ( = ?auto_27589 ?auto_27562 ) ) ( HOIST-AT ?auto_27579 ?auto_27589 ) ( AVAILABLE ?auto_27579 ) ( SURFACE-AT ?auto_27554 ?auto_27589 ) ( ON ?auto_27554 ?auto_27578 ) ( CLEAR ?auto_27554 ) ( not ( = ?auto_27553 ?auto_27554 ) ) ( not ( = ?auto_27553 ?auto_27578 ) ) ( not ( = ?auto_27554 ?auto_27578 ) ) ( not ( = ?auto_27558 ?auto_27579 ) ) ( IS-CRATE ?auto_27553 ) ( not ( = ?auto_27587 ?auto_27562 ) ) ( HOIST-AT ?auto_27575 ?auto_27587 ) ( SURFACE-AT ?auto_27553 ?auto_27587 ) ( ON ?auto_27553 ?auto_27584 ) ( CLEAR ?auto_27553 ) ( not ( = ?auto_27552 ?auto_27553 ) ) ( not ( = ?auto_27552 ?auto_27584 ) ) ( not ( = ?auto_27553 ?auto_27584 ) ) ( not ( = ?auto_27558 ?auto_27575 ) ) ( IS-CRATE ?auto_27552 ) ( not ( = ?auto_27590 ?auto_27562 ) ) ( HOIST-AT ?auto_27583 ?auto_27590 ) ( AVAILABLE ?auto_27583 ) ( SURFACE-AT ?auto_27552 ?auto_27590 ) ( ON ?auto_27552 ?auto_27563 ) ( CLEAR ?auto_27552 ) ( not ( = ?auto_27551 ?auto_27552 ) ) ( not ( = ?auto_27551 ?auto_27563 ) ) ( not ( = ?auto_27552 ?auto_27563 ) ) ( not ( = ?auto_27558 ?auto_27583 ) ) ( IS-CRATE ?auto_27551 ) ( not ( = ?auto_27570 ?auto_27562 ) ) ( HOIST-AT ?auto_27576 ?auto_27570 ) ( SURFACE-AT ?auto_27551 ?auto_27570 ) ( ON ?auto_27551 ?auto_27580 ) ( CLEAR ?auto_27551 ) ( not ( = ?auto_27550 ?auto_27551 ) ) ( not ( = ?auto_27550 ?auto_27580 ) ) ( not ( = ?auto_27551 ?auto_27580 ) ) ( not ( = ?auto_27558 ?auto_27576 ) ) ( IS-CRATE ?auto_27550 ) ( not ( = ?auto_27586 ?auto_27562 ) ) ( HOIST-AT ?auto_27565 ?auto_27586 ) ( AVAILABLE ?auto_27565 ) ( SURFACE-AT ?auto_27550 ?auto_27586 ) ( ON ?auto_27550 ?auto_27591 ) ( CLEAR ?auto_27550 ) ( not ( = ?auto_27549 ?auto_27550 ) ) ( not ( = ?auto_27549 ?auto_27591 ) ) ( not ( = ?auto_27550 ?auto_27591 ) ) ( not ( = ?auto_27558 ?auto_27565 ) ) ( IS-CRATE ?auto_27549 ) ( not ( = ?auto_27571 ?auto_27562 ) ) ( HOIST-AT ?auto_27574 ?auto_27571 ) ( AVAILABLE ?auto_27574 ) ( SURFACE-AT ?auto_27549 ?auto_27571 ) ( ON ?auto_27549 ?auto_27567 ) ( CLEAR ?auto_27549 ) ( not ( = ?auto_27548 ?auto_27549 ) ) ( not ( = ?auto_27548 ?auto_27567 ) ) ( not ( = ?auto_27549 ?auto_27567 ) ) ( not ( = ?auto_27558 ?auto_27574 ) ) ( IS-CRATE ?auto_27548 ) ( AVAILABLE ?auto_27575 ) ( SURFACE-AT ?auto_27548 ?auto_27587 ) ( ON ?auto_27548 ?auto_27577 ) ( CLEAR ?auto_27548 ) ( not ( = ?auto_27547 ?auto_27548 ) ) ( not ( = ?auto_27547 ?auto_27577 ) ) ( not ( = ?auto_27548 ?auto_27577 ) ) ( IS-CRATE ?auto_27547 ) ( not ( = ?auto_27564 ?auto_27562 ) ) ( HOIST-AT ?auto_27588 ?auto_27564 ) ( AVAILABLE ?auto_27588 ) ( SURFACE-AT ?auto_27547 ?auto_27564 ) ( ON ?auto_27547 ?auto_27581 ) ( CLEAR ?auto_27547 ) ( not ( = ?auto_27546 ?auto_27547 ) ) ( not ( = ?auto_27546 ?auto_27581 ) ) ( not ( = ?auto_27547 ?auto_27581 ) ) ( not ( = ?auto_27558 ?auto_27588 ) ) ( IS-CRATE ?auto_27546 ) ( not ( = ?auto_27573 ?auto_27562 ) ) ( HOIST-AT ?auto_27582 ?auto_27573 ) ( AVAILABLE ?auto_27582 ) ( SURFACE-AT ?auto_27546 ?auto_27573 ) ( ON ?auto_27546 ?auto_27569 ) ( CLEAR ?auto_27546 ) ( not ( = ?auto_27545 ?auto_27546 ) ) ( not ( = ?auto_27545 ?auto_27569 ) ) ( not ( = ?auto_27546 ?auto_27569 ) ) ( not ( = ?auto_27558 ?auto_27582 ) ) ( SURFACE-AT ?auto_27544 ?auto_27562 ) ( CLEAR ?auto_27544 ) ( IS-CRATE ?auto_27545 ) ( AVAILABLE ?auto_27558 ) ( AVAILABLE ?auto_27576 ) ( SURFACE-AT ?auto_27545 ?auto_27570 ) ( ON ?auto_27545 ?auto_27566 ) ( CLEAR ?auto_27545 ) ( TRUCK-AT ?auto_27560 ?auto_27562 ) ( not ( = ?auto_27544 ?auto_27545 ) ) ( not ( = ?auto_27544 ?auto_27566 ) ) ( not ( = ?auto_27545 ?auto_27566 ) ) ( not ( = ?auto_27544 ?auto_27546 ) ) ( not ( = ?auto_27544 ?auto_27569 ) ) ( not ( = ?auto_27546 ?auto_27566 ) ) ( not ( = ?auto_27573 ?auto_27570 ) ) ( not ( = ?auto_27582 ?auto_27576 ) ) ( not ( = ?auto_27569 ?auto_27566 ) ) ( not ( = ?auto_27544 ?auto_27547 ) ) ( not ( = ?auto_27544 ?auto_27581 ) ) ( not ( = ?auto_27545 ?auto_27547 ) ) ( not ( = ?auto_27545 ?auto_27581 ) ) ( not ( = ?auto_27547 ?auto_27569 ) ) ( not ( = ?auto_27547 ?auto_27566 ) ) ( not ( = ?auto_27564 ?auto_27573 ) ) ( not ( = ?auto_27564 ?auto_27570 ) ) ( not ( = ?auto_27588 ?auto_27582 ) ) ( not ( = ?auto_27588 ?auto_27576 ) ) ( not ( = ?auto_27581 ?auto_27569 ) ) ( not ( = ?auto_27581 ?auto_27566 ) ) ( not ( = ?auto_27544 ?auto_27548 ) ) ( not ( = ?auto_27544 ?auto_27577 ) ) ( not ( = ?auto_27545 ?auto_27548 ) ) ( not ( = ?auto_27545 ?auto_27577 ) ) ( not ( = ?auto_27546 ?auto_27548 ) ) ( not ( = ?auto_27546 ?auto_27577 ) ) ( not ( = ?auto_27548 ?auto_27581 ) ) ( not ( = ?auto_27548 ?auto_27569 ) ) ( not ( = ?auto_27548 ?auto_27566 ) ) ( not ( = ?auto_27587 ?auto_27564 ) ) ( not ( = ?auto_27587 ?auto_27573 ) ) ( not ( = ?auto_27587 ?auto_27570 ) ) ( not ( = ?auto_27575 ?auto_27588 ) ) ( not ( = ?auto_27575 ?auto_27582 ) ) ( not ( = ?auto_27575 ?auto_27576 ) ) ( not ( = ?auto_27577 ?auto_27581 ) ) ( not ( = ?auto_27577 ?auto_27569 ) ) ( not ( = ?auto_27577 ?auto_27566 ) ) ( not ( = ?auto_27544 ?auto_27549 ) ) ( not ( = ?auto_27544 ?auto_27567 ) ) ( not ( = ?auto_27545 ?auto_27549 ) ) ( not ( = ?auto_27545 ?auto_27567 ) ) ( not ( = ?auto_27546 ?auto_27549 ) ) ( not ( = ?auto_27546 ?auto_27567 ) ) ( not ( = ?auto_27547 ?auto_27549 ) ) ( not ( = ?auto_27547 ?auto_27567 ) ) ( not ( = ?auto_27549 ?auto_27577 ) ) ( not ( = ?auto_27549 ?auto_27581 ) ) ( not ( = ?auto_27549 ?auto_27569 ) ) ( not ( = ?auto_27549 ?auto_27566 ) ) ( not ( = ?auto_27571 ?auto_27587 ) ) ( not ( = ?auto_27571 ?auto_27564 ) ) ( not ( = ?auto_27571 ?auto_27573 ) ) ( not ( = ?auto_27571 ?auto_27570 ) ) ( not ( = ?auto_27574 ?auto_27575 ) ) ( not ( = ?auto_27574 ?auto_27588 ) ) ( not ( = ?auto_27574 ?auto_27582 ) ) ( not ( = ?auto_27574 ?auto_27576 ) ) ( not ( = ?auto_27567 ?auto_27577 ) ) ( not ( = ?auto_27567 ?auto_27581 ) ) ( not ( = ?auto_27567 ?auto_27569 ) ) ( not ( = ?auto_27567 ?auto_27566 ) ) ( not ( = ?auto_27544 ?auto_27550 ) ) ( not ( = ?auto_27544 ?auto_27591 ) ) ( not ( = ?auto_27545 ?auto_27550 ) ) ( not ( = ?auto_27545 ?auto_27591 ) ) ( not ( = ?auto_27546 ?auto_27550 ) ) ( not ( = ?auto_27546 ?auto_27591 ) ) ( not ( = ?auto_27547 ?auto_27550 ) ) ( not ( = ?auto_27547 ?auto_27591 ) ) ( not ( = ?auto_27548 ?auto_27550 ) ) ( not ( = ?auto_27548 ?auto_27591 ) ) ( not ( = ?auto_27550 ?auto_27567 ) ) ( not ( = ?auto_27550 ?auto_27577 ) ) ( not ( = ?auto_27550 ?auto_27581 ) ) ( not ( = ?auto_27550 ?auto_27569 ) ) ( not ( = ?auto_27550 ?auto_27566 ) ) ( not ( = ?auto_27586 ?auto_27571 ) ) ( not ( = ?auto_27586 ?auto_27587 ) ) ( not ( = ?auto_27586 ?auto_27564 ) ) ( not ( = ?auto_27586 ?auto_27573 ) ) ( not ( = ?auto_27586 ?auto_27570 ) ) ( not ( = ?auto_27565 ?auto_27574 ) ) ( not ( = ?auto_27565 ?auto_27575 ) ) ( not ( = ?auto_27565 ?auto_27588 ) ) ( not ( = ?auto_27565 ?auto_27582 ) ) ( not ( = ?auto_27565 ?auto_27576 ) ) ( not ( = ?auto_27591 ?auto_27567 ) ) ( not ( = ?auto_27591 ?auto_27577 ) ) ( not ( = ?auto_27591 ?auto_27581 ) ) ( not ( = ?auto_27591 ?auto_27569 ) ) ( not ( = ?auto_27591 ?auto_27566 ) ) ( not ( = ?auto_27544 ?auto_27551 ) ) ( not ( = ?auto_27544 ?auto_27580 ) ) ( not ( = ?auto_27545 ?auto_27551 ) ) ( not ( = ?auto_27545 ?auto_27580 ) ) ( not ( = ?auto_27546 ?auto_27551 ) ) ( not ( = ?auto_27546 ?auto_27580 ) ) ( not ( = ?auto_27547 ?auto_27551 ) ) ( not ( = ?auto_27547 ?auto_27580 ) ) ( not ( = ?auto_27548 ?auto_27551 ) ) ( not ( = ?auto_27548 ?auto_27580 ) ) ( not ( = ?auto_27549 ?auto_27551 ) ) ( not ( = ?auto_27549 ?auto_27580 ) ) ( not ( = ?auto_27551 ?auto_27591 ) ) ( not ( = ?auto_27551 ?auto_27567 ) ) ( not ( = ?auto_27551 ?auto_27577 ) ) ( not ( = ?auto_27551 ?auto_27581 ) ) ( not ( = ?auto_27551 ?auto_27569 ) ) ( not ( = ?auto_27551 ?auto_27566 ) ) ( not ( = ?auto_27580 ?auto_27591 ) ) ( not ( = ?auto_27580 ?auto_27567 ) ) ( not ( = ?auto_27580 ?auto_27577 ) ) ( not ( = ?auto_27580 ?auto_27581 ) ) ( not ( = ?auto_27580 ?auto_27569 ) ) ( not ( = ?auto_27580 ?auto_27566 ) ) ( not ( = ?auto_27544 ?auto_27552 ) ) ( not ( = ?auto_27544 ?auto_27563 ) ) ( not ( = ?auto_27545 ?auto_27552 ) ) ( not ( = ?auto_27545 ?auto_27563 ) ) ( not ( = ?auto_27546 ?auto_27552 ) ) ( not ( = ?auto_27546 ?auto_27563 ) ) ( not ( = ?auto_27547 ?auto_27552 ) ) ( not ( = ?auto_27547 ?auto_27563 ) ) ( not ( = ?auto_27548 ?auto_27552 ) ) ( not ( = ?auto_27548 ?auto_27563 ) ) ( not ( = ?auto_27549 ?auto_27552 ) ) ( not ( = ?auto_27549 ?auto_27563 ) ) ( not ( = ?auto_27550 ?auto_27552 ) ) ( not ( = ?auto_27550 ?auto_27563 ) ) ( not ( = ?auto_27552 ?auto_27580 ) ) ( not ( = ?auto_27552 ?auto_27591 ) ) ( not ( = ?auto_27552 ?auto_27567 ) ) ( not ( = ?auto_27552 ?auto_27577 ) ) ( not ( = ?auto_27552 ?auto_27581 ) ) ( not ( = ?auto_27552 ?auto_27569 ) ) ( not ( = ?auto_27552 ?auto_27566 ) ) ( not ( = ?auto_27590 ?auto_27570 ) ) ( not ( = ?auto_27590 ?auto_27586 ) ) ( not ( = ?auto_27590 ?auto_27571 ) ) ( not ( = ?auto_27590 ?auto_27587 ) ) ( not ( = ?auto_27590 ?auto_27564 ) ) ( not ( = ?auto_27590 ?auto_27573 ) ) ( not ( = ?auto_27583 ?auto_27576 ) ) ( not ( = ?auto_27583 ?auto_27565 ) ) ( not ( = ?auto_27583 ?auto_27574 ) ) ( not ( = ?auto_27583 ?auto_27575 ) ) ( not ( = ?auto_27583 ?auto_27588 ) ) ( not ( = ?auto_27583 ?auto_27582 ) ) ( not ( = ?auto_27563 ?auto_27580 ) ) ( not ( = ?auto_27563 ?auto_27591 ) ) ( not ( = ?auto_27563 ?auto_27567 ) ) ( not ( = ?auto_27563 ?auto_27577 ) ) ( not ( = ?auto_27563 ?auto_27581 ) ) ( not ( = ?auto_27563 ?auto_27569 ) ) ( not ( = ?auto_27563 ?auto_27566 ) ) ( not ( = ?auto_27544 ?auto_27553 ) ) ( not ( = ?auto_27544 ?auto_27584 ) ) ( not ( = ?auto_27545 ?auto_27553 ) ) ( not ( = ?auto_27545 ?auto_27584 ) ) ( not ( = ?auto_27546 ?auto_27553 ) ) ( not ( = ?auto_27546 ?auto_27584 ) ) ( not ( = ?auto_27547 ?auto_27553 ) ) ( not ( = ?auto_27547 ?auto_27584 ) ) ( not ( = ?auto_27548 ?auto_27553 ) ) ( not ( = ?auto_27548 ?auto_27584 ) ) ( not ( = ?auto_27549 ?auto_27553 ) ) ( not ( = ?auto_27549 ?auto_27584 ) ) ( not ( = ?auto_27550 ?auto_27553 ) ) ( not ( = ?auto_27550 ?auto_27584 ) ) ( not ( = ?auto_27551 ?auto_27553 ) ) ( not ( = ?auto_27551 ?auto_27584 ) ) ( not ( = ?auto_27553 ?auto_27563 ) ) ( not ( = ?auto_27553 ?auto_27580 ) ) ( not ( = ?auto_27553 ?auto_27591 ) ) ( not ( = ?auto_27553 ?auto_27567 ) ) ( not ( = ?auto_27553 ?auto_27577 ) ) ( not ( = ?auto_27553 ?auto_27581 ) ) ( not ( = ?auto_27553 ?auto_27569 ) ) ( not ( = ?auto_27553 ?auto_27566 ) ) ( not ( = ?auto_27584 ?auto_27563 ) ) ( not ( = ?auto_27584 ?auto_27580 ) ) ( not ( = ?auto_27584 ?auto_27591 ) ) ( not ( = ?auto_27584 ?auto_27567 ) ) ( not ( = ?auto_27584 ?auto_27577 ) ) ( not ( = ?auto_27584 ?auto_27581 ) ) ( not ( = ?auto_27584 ?auto_27569 ) ) ( not ( = ?auto_27584 ?auto_27566 ) ) ( not ( = ?auto_27544 ?auto_27554 ) ) ( not ( = ?auto_27544 ?auto_27578 ) ) ( not ( = ?auto_27545 ?auto_27554 ) ) ( not ( = ?auto_27545 ?auto_27578 ) ) ( not ( = ?auto_27546 ?auto_27554 ) ) ( not ( = ?auto_27546 ?auto_27578 ) ) ( not ( = ?auto_27547 ?auto_27554 ) ) ( not ( = ?auto_27547 ?auto_27578 ) ) ( not ( = ?auto_27548 ?auto_27554 ) ) ( not ( = ?auto_27548 ?auto_27578 ) ) ( not ( = ?auto_27549 ?auto_27554 ) ) ( not ( = ?auto_27549 ?auto_27578 ) ) ( not ( = ?auto_27550 ?auto_27554 ) ) ( not ( = ?auto_27550 ?auto_27578 ) ) ( not ( = ?auto_27551 ?auto_27554 ) ) ( not ( = ?auto_27551 ?auto_27578 ) ) ( not ( = ?auto_27552 ?auto_27554 ) ) ( not ( = ?auto_27552 ?auto_27578 ) ) ( not ( = ?auto_27554 ?auto_27584 ) ) ( not ( = ?auto_27554 ?auto_27563 ) ) ( not ( = ?auto_27554 ?auto_27580 ) ) ( not ( = ?auto_27554 ?auto_27591 ) ) ( not ( = ?auto_27554 ?auto_27567 ) ) ( not ( = ?auto_27554 ?auto_27577 ) ) ( not ( = ?auto_27554 ?auto_27581 ) ) ( not ( = ?auto_27554 ?auto_27569 ) ) ( not ( = ?auto_27554 ?auto_27566 ) ) ( not ( = ?auto_27589 ?auto_27587 ) ) ( not ( = ?auto_27589 ?auto_27590 ) ) ( not ( = ?auto_27589 ?auto_27570 ) ) ( not ( = ?auto_27589 ?auto_27586 ) ) ( not ( = ?auto_27589 ?auto_27571 ) ) ( not ( = ?auto_27589 ?auto_27564 ) ) ( not ( = ?auto_27589 ?auto_27573 ) ) ( not ( = ?auto_27579 ?auto_27575 ) ) ( not ( = ?auto_27579 ?auto_27583 ) ) ( not ( = ?auto_27579 ?auto_27576 ) ) ( not ( = ?auto_27579 ?auto_27565 ) ) ( not ( = ?auto_27579 ?auto_27574 ) ) ( not ( = ?auto_27579 ?auto_27588 ) ) ( not ( = ?auto_27579 ?auto_27582 ) ) ( not ( = ?auto_27578 ?auto_27584 ) ) ( not ( = ?auto_27578 ?auto_27563 ) ) ( not ( = ?auto_27578 ?auto_27580 ) ) ( not ( = ?auto_27578 ?auto_27591 ) ) ( not ( = ?auto_27578 ?auto_27567 ) ) ( not ( = ?auto_27578 ?auto_27577 ) ) ( not ( = ?auto_27578 ?auto_27581 ) ) ( not ( = ?auto_27578 ?auto_27569 ) ) ( not ( = ?auto_27578 ?auto_27566 ) ) ( not ( = ?auto_27544 ?auto_27555 ) ) ( not ( = ?auto_27544 ?auto_27572 ) ) ( not ( = ?auto_27545 ?auto_27555 ) ) ( not ( = ?auto_27545 ?auto_27572 ) ) ( not ( = ?auto_27546 ?auto_27555 ) ) ( not ( = ?auto_27546 ?auto_27572 ) ) ( not ( = ?auto_27547 ?auto_27555 ) ) ( not ( = ?auto_27547 ?auto_27572 ) ) ( not ( = ?auto_27548 ?auto_27555 ) ) ( not ( = ?auto_27548 ?auto_27572 ) ) ( not ( = ?auto_27549 ?auto_27555 ) ) ( not ( = ?auto_27549 ?auto_27572 ) ) ( not ( = ?auto_27550 ?auto_27555 ) ) ( not ( = ?auto_27550 ?auto_27572 ) ) ( not ( = ?auto_27551 ?auto_27555 ) ) ( not ( = ?auto_27551 ?auto_27572 ) ) ( not ( = ?auto_27552 ?auto_27555 ) ) ( not ( = ?auto_27552 ?auto_27572 ) ) ( not ( = ?auto_27553 ?auto_27555 ) ) ( not ( = ?auto_27553 ?auto_27572 ) ) ( not ( = ?auto_27555 ?auto_27578 ) ) ( not ( = ?auto_27555 ?auto_27584 ) ) ( not ( = ?auto_27555 ?auto_27563 ) ) ( not ( = ?auto_27555 ?auto_27580 ) ) ( not ( = ?auto_27555 ?auto_27591 ) ) ( not ( = ?auto_27555 ?auto_27567 ) ) ( not ( = ?auto_27555 ?auto_27577 ) ) ( not ( = ?auto_27555 ?auto_27581 ) ) ( not ( = ?auto_27555 ?auto_27569 ) ) ( not ( = ?auto_27555 ?auto_27566 ) ) ( not ( = ?auto_27585 ?auto_27589 ) ) ( not ( = ?auto_27585 ?auto_27587 ) ) ( not ( = ?auto_27585 ?auto_27590 ) ) ( not ( = ?auto_27585 ?auto_27570 ) ) ( not ( = ?auto_27585 ?auto_27586 ) ) ( not ( = ?auto_27585 ?auto_27571 ) ) ( not ( = ?auto_27585 ?auto_27564 ) ) ( not ( = ?auto_27585 ?auto_27573 ) ) ( not ( = ?auto_27568 ?auto_27579 ) ) ( not ( = ?auto_27568 ?auto_27575 ) ) ( not ( = ?auto_27568 ?auto_27583 ) ) ( not ( = ?auto_27568 ?auto_27576 ) ) ( not ( = ?auto_27568 ?auto_27565 ) ) ( not ( = ?auto_27568 ?auto_27574 ) ) ( not ( = ?auto_27568 ?auto_27588 ) ) ( not ( = ?auto_27568 ?auto_27582 ) ) ( not ( = ?auto_27572 ?auto_27578 ) ) ( not ( = ?auto_27572 ?auto_27584 ) ) ( not ( = ?auto_27572 ?auto_27563 ) ) ( not ( = ?auto_27572 ?auto_27580 ) ) ( not ( = ?auto_27572 ?auto_27591 ) ) ( not ( = ?auto_27572 ?auto_27567 ) ) ( not ( = ?auto_27572 ?auto_27577 ) ) ( not ( = ?auto_27572 ?auto_27581 ) ) ( not ( = ?auto_27572 ?auto_27569 ) ) ( not ( = ?auto_27572 ?auto_27566 ) ) ( not ( = ?auto_27544 ?auto_27556 ) ) ( not ( = ?auto_27544 ?auto_27561 ) ) ( not ( = ?auto_27545 ?auto_27556 ) ) ( not ( = ?auto_27545 ?auto_27561 ) ) ( not ( = ?auto_27546 ?auto_27556 ) ) ( not ( = ?auto_27546 ?auto_27561 ) ) ( not ( = ?auto_27547 ?auto_27556 ) ) ( not ( = ?auto_27547 ?auto_27561 ) ) ( not ( = ?auto_27548 ?auto_27556 ) ) ( not ( = ?auto_27548 ?auto_27561 ) ) ( not ( = ?auto_27549 ?auto_27556 ) ) ( not ( = ?auto_27549 ?auto_27561 ) ) ( not ( = ?auto_27550 ?auto_27556 ) ) ( not ( = ?auto_27550 ?auto_27561 ) ) ( not ( = ?auto_27551 ?auto_27556 ) ) ( not ( = ?auto_27551 ?auto_27561 ) ) ( not ( = ?auto_27552 ?auto_27556 ) ) ( not ( = ?auto_27552 ?auto_27561 ) ) ( not ( = ?auto_27553 ?auto_27556 ) ) ( not ( = ?auto_27553 ?auto_27561 ) ) ( not ( = ?auto_27554 ?auto_27556 ) ) ( not ( = ?auto_27554 ?auto_27561 ) ) ( not ( = ?auto_27556 ?auto_27572 ) ) ( not ( = ?auto_27556 ?auto_27578 ) ) ( not ( = ?auto_27556 ?auto_27584 ) ) ( not ( = ?auto_27556 ?auto_27563 ) ) ( not ( = ?auto_27556 ?auto_27580 ) ) ( not ( = ?auto_27556 ?auto_27591 ) ) ( not ( = ?auto_27556 ?auto_27567 ) ) ( not ( = ?auto_27556 ?auto_27577 ) ) ( not ( = ?auto_27556 ?auto_27581 ) ) ( not ( = ?auto_27556 ?auto_27569 ) ) ( not ( = ?auto_27556 ?auto_27566 ) ) ( not ( = ?auto_27559 ?auto_27585 ) ) ( not ( = ?auto_27559 ?auto_27589 ) ) ( not ( = ?auto_27559 ?auto_27587 ) ) ( not ( = ?auto_27559 ?auto_27590 ) ) ( not ( = ?auto_27559 ?auto_27570 ) ) ( not ( = ?auto_27559 ?auto_27586 ) ) ( not ( = ?auto_27559 ?auto_27571 ) ) ( not ( = ?auto_27559 ?auto_27564 ) ) ( not ( = ?auto_27559 ?auto_27573 ) ) ( not ( = ?auto_27557 ?auto_27568 ) ) ( not ( = ?auto_27557 ?auto_27579 ) ) ( not ( = ?auto_27557 ?auto_27575 ) ) ( not ( = ?auto_27557 ?auto_27583 ) ) ( not ( = ?auto_27557 ?auto_27576 ) ) ( not ( = ?auto_27557 ?auto_27565 ) ) ( not ( = ?auto_27557 ?auto_27574 ) ) ( not ( = ?auto_27557 ?auto_27588 ) ) ( not ( = ?auto_27557 ?auto_27582 ) ) ( not ( = ?auto_27561 ?auto_27572 ) ) ( not ( = ?auto_27561 ?auto_27578 ) ) ( not ( = ?auto_27561 ?auto_27584 ) ) ( not ( = ?auto_27561 ?auto_27563 ) ) ( not ( = ?auto_27561 ?auto_27580 ) ) ( not ( = ?auto_27561 ?auto_27591 ) ) ( not ( = ?auto_27561 ?auto_27567 ) ) ( not ( = ?auto_27561 ?auto_27577 ) ) ( not ( = ?auto_27561 ?auto_27581 ) ) ( not ( = ?auto_27561 ?auto_27569 ) ) ( not ( = ?auto_27561 ?auto_27566 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_27544 ?auto_27545 ?auto_27546 ?auto_27547 ?auto_27548 ?auto_27549 ?auto_27550 ?auto_27551 ?auto_27552 ?auto_27553 ?auto_27554 ?auto_27555 )
      ( MAKE-1CRATE ?auto_27555 ?auto_27556 )
      ( MAKE-12CRATE-VERIFY ?auto_27544 ?auto_27545 ?auto_27546 ?auto_27547 ?auto_27548 ?auto_27549 ?auto_27550 ?auto_27551 ?auto_27552 ?auto_27553 ?auto_27554 ?auto_27555 ?auto_27556 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_27616 - SURFACE
      ?auto_27617 - SURFACE
      ?auto_27618 - SURFACE
      ?auto_27619 - SURFACE
      ?auto_27620 - SURFACE
      ?auto_27621 - SURFACE
      ?auto_27622 - SURFACE
      ?auto_27623 - SURFACE
      ?auto_27624 - SURFACE
      ?auto_27625 - SURFACE
      ?auto_27626 - SURFACE
      ?auto_27627 - SURFACE
      ?auto_27628 - SURFACE
      ?auto_27629 - SURFACE
    )
    :vars
    (
      ?auto_27630 - HOIST
      ?auto_27633 - PLACE
      ?auto_27631 - PLACE
      ?auto_27632 - HOIST
      ?auto_27634 - SURFACE
      ?auto_27652 - PLACE
      ?auto_27649 - HOIST
      ?auto_27653 - SURFACE
      ?auto_27657 - PLACE
      ?auto_27665 - HOIST
      ?auto_27660 - SURFACE
      ?auto_27658 - PLACE
      ?auto_27650 - HOIST
      ?auto_27648 - SURFACE
      ?auto_27664 - PLACE
      ?auto_27637 - HOIST
      ?auto_27640 - SURFACE
      ?auto_27662 - PLACE
      ?auto_27654 - HOIST
      ?auto_27667 - SURFACE
      ?auto_27639 - PLACE
      ?auto_27651 - HOIST
      ?auto_27643 - SURFACE
      ?auto_27638 - PLACE
      ?auto_27666 - HOIST
      ?auto_27656 - SURFACE
      ?auto_27645 - PLACE
      ?auto_27646 - HOIST
      ?auto_27659 - SURFACE
      ?auto_27636 - SURFACE
      ?auto_27655 - PLACE
      ?auto_27644 - HOIST
      ?auto_27647 - SURFACE
      ?auto_27663 - PLACE
      ?auto_27642 - HOIST
      ?auto_27641 - SURFACE
      ?auto_27661 - SURFACE
      ?auto_27635 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27630 ?auto_27633 ) ( IS-CRATE ?auto_27629 ) ( not ( = ?auto_27631 ?auto_27633 ) ) ( HOIST-AT ?auto_27632 ?auto_27631 ) ( AVAILABLE ?auto_27632 ) ( SURFACE-AT ?auto_27629 ?auto_27631 ) ( ON ?auto_27629 ?auto_27634 ) ( CLEAR ?auto_27629 ) ( not ( = ?auto_27628 ?auto_27629 ) ) ( not ( = ?auto_27628 ?auto_27634 ) ) ( not ( = ?auto_27629 ?auto_27634 ) ) ( not ( = ?auto_27630 ?auto_27632 ) ) ( IS-CRATE ?auto_27628 ) ( not ( = ?auto_27652 ?auto_27633 ) ) ( HOIST-AT ?auto_27649 ?auto_27652 ) ( AVAILABLE ?auto_27649 ) ( SURFACE-AT ?auto_27628 ?auto_27652 ) ( ON ?auto_27628 ?auto_27653 ) ( CLEAR ?auto_27628 ) ( not ( = ?auto_27627 ?auto_27628 ) ) ( not ( = ?auto_27627 ?auto_27653 ) ) ( not ( = ?auto_27628 ?auto_27653 ) ) ( not ( = ?auto_27630 ?auto_27649 ) ) ( IS-CRATE ?auto_27627 ) ( not ( = ?auto_27657 ?auto_27633 ) ) ( HOIST-AT ?auto_27665 ?auto_27657 ) ( AVAILABLE ?auto_27665 ) ( SURFACE-AT ?auto_27627 ?auto_27657 ) ( ON ?auto_27627 ?auto_27660 ) ( CLEAR ?auto_27627 ) ( not ( = ?auto_27626 ?auto_27627 ) ) ( not ( = ?auto_27626 ?auto_27660 ) ) ( not ( = ?auto_27627 ?auto_27660 ) ) ( not ( = ?auto_27630 ?auto_27665 ) ) ( IS-CRATE ?auto_27626 ) ( not ( = ?auto_27658 ?auto_27633 ) ) ( HOIST-AT ?auto_27650 ?auto_27658 ) ( AVAILABLE ?auto_27650 ) ( SURFACE-AT ?auto_27626 ?auto_27658 ) ( ON ?auto_27626 ?auto_27648 ) ( CLEAR ?auto_27626 ) ( not ( = ?auto_27625 ?auto_27626 ) ) ( not ( = ?auto_27625 ?auto_27648 ) ) ( not ( = ?auto_27626 ?auto_27648 ) ) ( not ( = ?auto_27630 ?auto_27650 ) ) ( IS-CRATE ?auto_27625 ) ( not ( = ?auto_27664 ?auto_27633 ) ) ( HOIST-AT ?auto_27637 ?auto_27664 ) ( SURFACE-AT ?auto_27625 ?auto_27664 ) ( ON ?auto_27625 ?auto_27640 ) ( CLEAR ?auto_27625 ) ( not ( = ?auto_27624 ?auto_27625 ) ) ( not ( = ?auto_27624 ?auto_27640 ) ) ( not ( = ?auto_27625 ?auto_27640 ) ) ( not ( = ?auto_27630 ?auto_27637 ) ) ( IS-CRATE ?auto_27624 ) ( not ( = ?auto_27662 ?auto_27633 ) ) ( HOIST-AT ?auto_27654 ?auto_27662 ) ( AVAILABLE ?auto_27654 ) ( SURFACE-AT ?auto_27624 ?auto_27662 ) ( ON ?auto_27624 ?auto_27667 ) ( CLEAR ?auto_27624 ) ( not ( = ?auto_27623 ?auto_27624 ) ) ( not ( = ?auto_27623 ?auto_27667 ) ) ( not ( = ?auto_27624 ?auto_27667 ) ) ( not ( = ?auto_27630 ?auto_27654 ) ) ( IS-CRATE ?auto_27623 ) ( not ( = ?auto_27639 ?auto_27633 ) ) ( HOIST-AT ?auto_27651 ?auto_27639 ) ( SURFACE-AT ?auto_27623 ?auto_27639 ) ( ON ?auto_27623 ?auto_27643 ) ( CLEAR ?auto_27623 ) ( not ( = ?auto_27622 ?auto_27623 ) ) ( not ( = ?auto_27622 ?auto_27643 ) ) ( not ( = ?auto_27623 ?auto_27643 ) ) ( not ( = ?auto_27630 ?auto_27651 ) ) ( IS-CRATE ?auto_27622 ) ( not ( = ?auto_27638 ?auto_27633 ) ) ( HOIST-AT ?auto_27666 ?auto_27638 ) ( AVAILABLE ?auto_27666 ) ( SURFACE-AT ?auto_27622 ?auto_27638 ) ( ON ?auto_27622 ?auto_27656 ) ( CLEAR ?auto_27622 ) ( not ( = ?auto_27621 ?auto_27622 ) ) ( not ( = ?auto_27621 ?auto_27656 ) ) ( not ( = ?auto_27622 ?auto_27656 ) ) ( not ( = ?auto_27630 ?auto_27666 ) ) ( IS-CRATE ?auto_27621 ) ( not ( = ?auto_27645 ?auto_27633 ) ) ( HOIST-AT ?auto_27646 ?auto_27645 ) ( AVAILABLE ?auto_27646 ) ( SURFACE-AT ?auto_27621 ?auto_27645 ) ( ON ?auto_27621 ?auto_27659 ) ( CLEAR ?auto_27621 ) ( not ( = ?auto_27620 ?auto_27621 ) ) ( not ( = ?auto_27620 ?auto_27659 ) ) ( not ( = ?auto_27621 ?auto_27659 ) ) ( not ( = ?auto_27630 ?auto_27646 ) ) ( IS-CRATE ?auto_27620 ) ( AVAILABLE ?auto_27637 ) ( SURFACE-AT ?auto_27620 ?auto_27664 ) ( ON ?auto_27620 ?auto_27636 ) ( CLEAR ?auto_27620 ) ( not ( = ?auto_27619 ?auto_27620 ) ) ( not ( = ?auto_27619 ?auto_27636 ) ) ( not ( = ?auto_27620 ?auto_27636 ) ) ( IS-CRATE ?auto_27619 ) ( not ( = ?auto_27655 ?auto_27633 ) ) ( HOIST-AT ?auto_27644 ?auto_27655 ) ( AVAILABLE ?auto_27644 ) ( SURFACE-AT ?auto_27619 ?auto_27655 ) ( ON ?auto_27619 ?auto_27647 ) ( CLEAR ?auto_27619 ) ( not ( = ?auto_27618 ?auto_27619 ) ) ( not ( = ?auto_27618 ?auto_27647 ) ) ( not ( = ?auto_27619 ?auto_27647 ) ) ( not ( = ?auto_27630 ?auto_27644 ) ) ( IS-CRATE ?auto_27618 ) ( not ( = ?auto_27663 ?auto_27633 ) ) ( HOIST-AT ?auto_27642 ?auto_27663 ) ( AVAILABLE ?auto_27642 ) ( SURFACE-AT ?auto_27618 ?auto_27663 ) ( ON ?auto_27618 ?auto_27641 ) ( CLEAR ?auto_27618 ) ( not ( = ?auto_27617 ?auto_27618 ) ) ( not ( = ?auto_27617 ?auto_27641 ) ) ( not ( = ?auto_27618 ?auto_27641 ) ) ( not ( = ?auto_27630 ?auto_27642 ) ) ( SURFACE-AT ?auto_27616 ?auto_27633 ) ( CLEAR ?auto_27616 ) ( IS-CRATE ?auto_27617 ) ( AVAILABLE ?auto_27630 ) ( AVAILABLE ?auto_27651 ) ( SURFACE-AT ?auto_27617 ?auto_27639 ) ( ON ?auto_27617 ?auto_27661 ) ( CLEAR ?auto_27617 ) ( TRUCK-AT ?auto_27635 ?auto_27633 ) ( not ( = ?auto_27616 ?auto_27617 ) ) ( not ( = ?auto_27616 ?auto_27661 ) ) ( not ( = ?auto_27617 ?auto_27661 ) ) ( not ( = ?auto_27616 ?auto_27618 ) ) ( not ( = ?auto_27616 ?auto_27641 ) ) ( not ( = ?auto_27618 ?auto_27661 ) ) ( not ( = ?auto_27663 ?auto_27639 ) ) ( not ( = ?auto_27642 ?auto_27651 ) ) ( not ( = ?auto_27641 ?auto_27661 ) ) ( not ( = ?auto_27616 ?auto_27619 ) ) ( not ( = ?auto_27616 ?auto_27647 ) ) ( not ( = ?auto_27617 ?auto_27619 ) ) ( not ( = ?auto_27617 ?auto_27647 ) ) ( not ( = ?auto_27619 ?auto_27641 ) ) ( not ( = ?auto_27619 ?auto_27661 ) ) ( not ( = ?auto_27655 ?auto_27663 ) ) ( not ( = ?auto_27655 ?auto_27639 ) ) ( not ( = ?auto_27644 ?auto_27642 ) ) ( not ( = ?auto_27644 ?auto_27651 ) ) ( not ( = ?auto_27647 ?auto_27641 ) ) ( not ( = ?auto_27647 ?auto_27661 ) ) ( not ( = ?auto_27616 ?auto_27620 ) ) ( not ( = ?auto_27616 ?auto_27636 ) ) ( not ( = ?auto_27617 ?auto_27620 ) ) ( not ( = ?auto_27617 ?auto_27636 ) ) ( not ( = ?auto_27618 ?auto_27620 ) ) ( not ( = ?auto_27618 ?auto_27636 ) ) ( not ( = ?auto_27620 ?auto_27647 ) ) ( not ( = ?auto_27620 ?auto_27641 ) ) ( not ( = ?auto_27620 ?auto_27661 ) ) ( not ( = ?auto_27664 ?auto_27655 ) ) ( not ( = ?auto_27664 ?auto_27663 ) ) ( not ( = ?auto_27664 ?auto_27639 ) ) ( not ( = ?auto_27637 ?auto_27644 ) ) ( not ( = ?auto_27637 ?auto_27642 ) ) ( not ( = ?auto_27637 ?auto_27651 ) ) ( not ( = ?auto_27636 ?auto_27647 ) ) ( not ( = ?auto_27636 ?auto_27641 ) ) ( not ( = ?auto_27636 ?auto_27661 ) ) ( not ( = ?auto_27616 ?auto_27621 ) ) ( not ( = ?auto_27616 ?auto_27659 ) ) ( not ( = ?auto_27617 ?auto_27621 ) ) ( not ( = ?auto_27617 ?auto_27659 ) ) ( not ( = ?auto_27618 ?auto_27621 ) ) ( not ( = ?auto_27618 ?auto_27659 ) ) ( not ( = ?auto_27619 ?auto_27621 ) ) ( not ( = ?auto_27619 ?auto_27659 ) ) ( not ( = ?auto_27621 ?auto_27636 ) ) ( not ( = ?auto_27621 ?auto_27647 ) ) ( not ( = ?auto_27621 ?auto_27641 ) ) ( not ( = ?auto_27621 ?auto_27661 ) ) ( not ( = ?auto_27645 ?auto_27664 ) ) ( not ( = ?auto_27645 ?auto_27655 ) ) ( not ( = ?auto_27645 ?auto_27663 ) ) ( not ( = ?auto_27645 ?auto_27639 ) ) ( not ( = ?auto_27646 ?auto_27637 ) ) ( not ( = ?auto_27646 ?auto_27644 ) ) ( not ( = ?auto_27646 ?auto_27642 ) ) ( not ( = ?auto_27646 ?auto_27651 ) ) ( not ( = ?auto_27659 ?auto_27636 ) ) ( not ( = ?auto_27659 ?auto_27647 ) ) ( not ( = ?auto_27659 ?auto_27641 ) ) ( not ( = ?auto_27659 ?auto_27661 ) ) ( not ( = ?auto_27616 ?auto_27622 ) ) ( not ( = ?auto_27616 ?auto_27656 ) ) ( not ( = ?auto_27617 ?auto_27622 ) ) ( not ( = ?auto_27617 ?auto_27656 ) ) ( not ( = ?auto_27618 ?auto_27622 ) ) ( not ( = ?auto_27618 ?auto_27656 ) ) ( not ( = ?auto_27619 ?auto_27622 ) ) ( not ( = ?auto_27619 ?auto_27656 ) ) ( not ( = ?auto_27620 ?auto_27622 ) ) ( not ( = ?auto_27620 ?auto_27656 ) ) ( not ( = ?auto_27622 ?auto_27659 ) ) ( not ( = ?auto_27622 ?auto_27636 ) ) ( not ( = ?auto_27622 ?auto_27647 ) ) ( not ( = ?auto_27622 ?auto_27641 ) ) ( not ( = ?auto_27622 ?auto_27661 ) ) ( not ( = ?auto_27638 ?auto_27645 ) ) ( not ( = ?auto_27638 ?auto_27664 ) ) ( not ( = ?auto_27638 ?auto_27655 ) ) ( not ( = ?auto_27638 ?auto_27663 ) ) ( not ( = ?auto_27638 ?auto_27639 ) ) ( not ( = ?auto_27666 ?auto_27646 ) ) ( not ( = ?auto_27666 ?auto_27637 ) ) ( not ( = ?auto_27666 ?auto_27644 ) ) ( not ( = ?auto_27666 ?auto_27642 ) ) ( not ( = ?auto_27666 ?auto_27651 ) ) ( not ( = ?auto_27656 ?auto_27659 ) ) ( not ( = ?auto_27656 ?auto_27636 ) ) ( not ( = ?auto_27656 ?auto_27647 ) ) ( not ( = ?auto_27656 ?auto_27641 ) ) ( not ( = ?auto_27656 ?auto_27661 ) ) ( not ( = ?auto_27616 ?auto_27623 ) ) ( not ( = ?auto_27616 ?auto_27643 ) ) ( not ( = ?auto_27617 ?auto_27623 ) ) ( not ( = ?auto_27617 ?auto_27643 ) ) ( not ( = ?auto_27618 ?auto_27623 ) ) ( not ( = ?auto_27618 ?auto_27643 ) ) ( not ( = ?auto_27619 ?auto_27623 ) ) ( not ( = ?auto_27619 ?auto_27643 ) ) ( not ( = ?auto_27620 ?auto_27623 ) ) ( not ( = ?auto_27620 ?auto_27643 ) ) ( not ( = ?auto_27621 ?auto_27623 ) ) ( not ( = ?auto_27621 ?auto_27643 ) ) ( not ( = ?auto_27623 ?auto_27656 ) ) ( not ( = ?auto_27623 ?auto_27659 ) ) ( not ( = ?auto_27623 ?auto_27636 ) ) ( not ( = ?auto_27623 ?auto_27647 ) ) ( not ( = ?auto_27623 ?auto_27641 ) ) ( not ( = ?auto_27623 ?auto_27661 ) ) ( not ( = ?auto_27643 ?auto_27656 ) ) ( not ( = ?auto_27643 ?auto_27659 ) ) ( not ( = ?auto_27643 ?auto_27636 ) ) ( not ( = ?auto_27643 ?auto_27647 ) ) ( not ( = ?auto_27643 ?auto_27641 ) ) ( not ( = ?auto_27643 ?auto_27661 ) ) ( not ( = ?auto_27616 ?auto_27624 ) ) ( not ( = ?auto_27616 ?auto_27667 ) ) ( not ( = ?auto_27617 ?auto_27624 ) ) ( not ( = ?auto_27617 ?auto_27667 ) ) ( not ( = ?auto_27618 ?auto_27624 ) ) ( not ( = ?auto_27618 ?auto_27667 ) ) ( not ( = ?auto_27619 ?auto_27624 ) ) ( not ( = ?auto_27619 ?auto_27667 ) ) ( not ( = ?auto_27620 ?auto_27624 ) ) ( not ( = ?auto_27620 ?auto_27667 ) ) ( not ( = ?auto_27621 ?auto_27624 ) ) ( not ( = ?auto_27621 ?auto_27667 ) ) ( not ( = ?auto_27622 ?auto_27624 ) ) ( not ( = ?auto_27622 ?auto_27667 ) ) ( not ( = ?auto_27624 ?auto_27643 ) ) ( not ( = ?auto_27624 ?auto_27656 ) ) ( not ( = ?auto_27624 ?auto_27659 ) ) ( not ( = ?auto_27624 ?auto_27636 ) ) ( not ( = ?auto_27624 ?auto_27647 ) ) ( not ( = ?auto_27624 ?auto_27641 ) ) ( not ( = ?auto_27624 ?auto_27661 ) ) ( not ( = ?auto_27662 ?auto_27639 ) ) ( not ( = ?auto_27662 ?auto_27638 ) ) ( not ( = ?auto_27662 ?auto_27645 ) ) ( not ( = ?auto_27662 ?auto_27664 ) ) ( not ( = ?auto_27662 ?auto_27655 ) ) ( not ( = ?auto_27662 ?auto_27663 ) ) ( not ( = ?auto_27654 ?auto_27651 ) ) ( not ( = ?auto_27654 ?auto_27666 ) ) ( not ( = ?auto_27654 ?auto_27646 ) ) ( not ( = ?auto_27654 ?auto_27637 ) ) ( not ( = ?auto_27654 ?auto_27644 ) ) ( not ( = ?auto_27654 ?auto_27642 ) ) ( not ( = ?auto_27667 ?auto_27643 ) ) ( not ( = ?auto_27667 ?auto_27656 ) ) ( not ( = ?auto_27667 ?auto_27659 ) ) ( not ( = ?auto_27667 ?auto_27636 ) ) ( not ( = ?auto_27667 ?auto_27647 ) ) ( not ( = ?auto_27667 ?auto_27641 ) ) ( not ( = ?auto_27667 ?auto_27661 ) ) ( not ( = ?auto_27616 ?auto_27625 ) ) ( not ( = ?auto_27616 ?auto_27640 ) ) ( not ( = ?auto_27617 ?auto_27625 ) ) ( not ( = ?auto_27617 ?auto_27640 ) ) ( not ( = ?auto_27618 ?auto_27625 ) ) ( not ( = ?auto_27618 ?auto_27640 ) ) ( not ( = ?auto_27619 ?auto_27625 ) ) ( not ( = ?auto_27619 ?auto_27640 ) ) ( not ( = ?auto_27620 ?auto_27625 ) ) ( not ( = ?auto_27620 ?auto_27640 ) ) ( not ( = ?auto_27621 ?auto_27625 ) ) ( not ( = ?auto_27621 ?auto_27640 ) ) ( not ( = ?auto_27622 ?auto_27625 ) ) ( not ( = ?auto_27622 ?auto_27640 ) ) ( not ( = ?auto_27623 ?auto_27625 ) ) ( not ( = ?auto_27623 ?auto_27640 ) ) ( not ( = ?auto_27625 ?auto_27667 ) ) ( not ( = ?auto_27625 ?auto_27643 ) ) ( not ( = ?auto_27625 ?auto_27656 ) ) ( not ( = ?auto_27625 ?auto_27659 ) ) ( not ( = ?auto_27625 ?auto_27636 ) ) ( not ( = ?auto_27625 ?auto_27647 ) ) ( not ( = ?auto_27625 ?auto_27641 ) ) ( not ( = ?auto_27625 ?auto_27661 ) ) ( not ( = ?auto_27640 ?auto_27667 ) ) ( not ( = ?auto_27640 ?auto_27643 ) ) ( not ( = ?auto_27640 ?auto_27656 ) ) ( not ( = ?auto_27640 ?auto_27659 ) ) ( not ( = ?auto_27640 ?auto_27636 ) ) ( not ( = ?auto_27640 ?auto_27647 ) ) ( not ( = ?auto_27640 ?auto_27641 ) ) ( not ( = ?auto_27640 ?auto_27661 ) ) ( not ( = ?auto_27616 ?auto_27626 ) ) ( not ( = ?auto_27616 ?auto_27648 ) ) ( not ( = ?auto_27617 ?auto_27626 ) ) ( not ( = ?auto_27617 ?auto_27648 ) ) ( not ( = ?auto_27618 ?auto_27626 ) ) ( not ( = ?auto_27618 ?auto_27648 ) ) ( not ( = ?auto_27619 ?auto_27626 ) ) ( not ( = ?auto_27619 ?auto_27648 ) ) ( not ( = ?auto_27620 ?auto_27626 ) ) ( not ( = ?auto_27620 ?auto_27648 ) ) ( not ( = ?auto_27621 ?auto_27626 ) ) ( not ( = ?auto_27621 ?auto_27648 ) ) ( not ( = ?auto_27622 ?auto_27626 ) ) ( not ( = ?auto_27622 ?auto_27648 ) ) ( not ( = ?auto_27623 ?auto_27626 ) ) ( not ( = ?auto_27623 ?auto_27648 ) ) ( not ( = ?auto_27624 ?auto_27626 ) ) ( not ( = ?auto_27624 ?auto_27648 ) ) ( not ( = ?auto_27626 ?auto_27640 ) ) ( not ( = ?auto_27626 ?auto_27667 ) ) ( not ( = ?auto_27626 ?auto_27643 ) ) ( not ( = ?auto_27626 ?auto_27656 ) ) ( not ( = ?auto_27626 ?auto_27659 ) ) ( not ( = ?auto_27626 ?auto_27636 ) ) ( not ( = ?auto_27626 ?auto_27647 ) ) ( not ( = ?auto_27626 ?auto_27641 ) ) ( not ( = ?auto_27626 ?auto_27661 ) ) ( not ( = ?auto_27658 ?auto_27664 ) ) ( not ( = ?auto_27658 ?auto_27662 ) ) ( not ( = ?auto_27658 ?auto_27639 ) ) ( not ( = ?auto_27658 ?auto_27638 ) ) ( not ( = ?auto_27658 ?auto_27645 ) ) ( not ( = ?auto_27658 ?auto_27655 ) ) ( not ( = ?auto_27658 ?auto_27663 ) ) ( not ( = ?auto_27650 ?auto_27637 ) ) ( not ( = ?auto_27650 ?auto_27654 ) ) ( not ( = ?auto_27650 ?auto_27651 ) ) ( not ( = ?auto_27650 ?auto_27666 ) ) ( not ( = ?auto_27650 ?auto_27646 ) ) ( not ( = ?auto_27650 ?auto_27644 ) ) ( not ( = ?auto_27650 ?auto_27642 ) ) ( not ( = ?auto_27648 ?auto_27640 ) ) ( not ( = ?auto_27648 ?auto_27667 ) ) ( not ( = ?auto_27648 ?auto_27643 ) ) ( not ( = ?auto_27648 ?auto_27656 ) ) ( not ( = ?auto_27648 ?auto_27659 ) ) ( not ( = ?auto_27648 ?auto_27636 ) ) ( not ( = ?auto_27648 ?auto_27647 ) ) ( not ( = ?auto_27648 ?auto_27641 ) ) ( not ( = ?auto_27648 ?auto_27661 ) ) ( not ( = ?auto_27616 ?auto_27627 ) ) ( not ( = ?auto_27616 ?auto_27660 ) ) ( not ( = ?auto_27617 ?auto_27627 ) ) ( not ( = ?auto_27617 ?auto_27660 ) ) ( not ( = ?auto_27618 ?auto_27627 ) ) ( not ( = ?auto_27618 ?auto_27660 ) ) ( not ( = ?auto_27619 ?auto_27627 ) ) ( not ( = ?auto_27619 ?auto_27660 ) ) ( not ( = ?auto_27620 ?auto_27627 ) ) ( not ( = ?auto_27620 ?auto_27660 ) ) ( not ( = ?auto_27621 ?auto_27627 ) ) ( not ( = ?auto_27621 ?auto_27660 ) ) ( not ( = ?auto_27622 ?auto_27627 ) ) ( not ( = ?auto_27622 ?auto_27660 ) ) ( not ( = ?auto_27623 ?auto_27627 ) ) ( not ( = ?auto_27623 ?auto_27660 ) ) ( not ( = ?auto_27624 ?auto_27627 ) ) ( not ( = ?auto_27624 ?auto_27660 ) ) ( not ( = ?auto_27625 ?auto_27627 ) ) ( not ( = ?auto_27625 ?auto_27660 ) ) ( not ( = ?auto_27627 ?auto_27648 ) ) ( not ( = ?auto_27627 ?auto_27640 ) ) ( not ( = ?auto_27627 ?auto_27667 ) ) ( not ( = ?auto_27627 ?auto_27643 ) ) ( not ( = ?auto_27627 ?auto_27656 ) ) ( not ( = ?auto_27627 ?auto_27659 ) ) ( not ( = ?auto_27627 ?auto_27636 ) ) ( not ( = ?auto_27627 ?auto_27647 ) ) ( not ( = ?auto_27627 ?auto_27641 ) ) ( not ( = ?auto_27627 ?auto_27661 ) ) ( not ( = ?auto_27657 ?auto_27658 ) ) ( not ( = ?auto_27657 ?auto_27664 ) ) ( not ( = ?auto_27657 ?auto_27662 ) ) ( not ( = ?auto_27657 ?auto_27639 ) ) ( not ( = ?auto_27657 ?auto_27638 ) ) ( not ( = ?auto_27657 ?auto_27645 ) ) ( not ( = ?auto_27657 ?auto_27655 ) ) ( not ( = ?auto_27657 ?auto_27663 ) ) ( not ( = ?auto_27665 ?auto_27650 ) ) ( not ( = ?auto_27665 ?auto_27637 ) ) ( not ( = ?auto_27665 ?auto_27654 ) ) ( not ( = ?auto_27665 ?auto_27651 ) ) ( not ( = ?auto_27665 ?auto_27666 ) ) ( not ( = ?auto_27665 ?auto_27646 ) ) ( not ( = ?auto_27665 ?auto_27644 ) ) ( not ( = ?auto_27665 ?auto_27642 ) ) ( not ( = ?auto_27660 ?auto_27648 ) ) ( not ( = ?auto_27660 ?auto_27640 ) ) ( not ( = ?auto_27660 ?auto_27667 ) ) ( not ( = ?auto_27660 ?auto_27643 ) ) ( not ( = ?auto_27660 ?auto_27656 ) ) ( not ( = ?auto_27660 ?auto_27659 ) ) ( not ( = ?auto_27660 ?auto_27636 ) ) ( not ( = ?auto_27660 ?auto_27647 ) ) ( not ( = ?auto_27660 ?auto_27641 ) ) ( not ( = ?auto_27660 ?auto_27661 ) ) ( not ( = ?auto_27616 ?auto_27628 ) ) ( not ( = ?auto_27616 ?auto_27653 ) ) ( not ( = ?auto_27617 ?auto_27628 ) ) ( not ( = ?auto_27617 ?auto_27653 ) ) ( not ( = ?auto_27618 ?auto_27628 ) ) ( not ( = ?auto_27618 ?auto_27653 ) ) ( not ( = ?auto_27619 ?auto_27628 ) ) ( not ( = ?auto_27619 ?auto_27653 ) ) ( not ( = ?auto_27620 ?auto_27628 ) ) ( not ( = ?auto_27620 ?auto_27653 ) ) ( not ( = ?auto_27621 ?auto_27628 ) ) ( not ( = ?auto_27621 ?auto_27653 ) ) ( not ( = ?auto_27622 ?auto_27628 ) ) ( not ( = ?auto_27622 ?auto_27653 ) ) ( not ( = ?auto_27623 ?auto_27628 ) ) ( not ( = ?auto_27623 ?auto_27653 ) ) ( not ( = ?auto_27624 ?auto_27628 ) ) ( not ( = ?auto_27624 ?auto_27653 ) ) ( not ( = ?auto_27625 ?auto_27628 ) ) ( not ( = ?auto_27625 ?auto_27653 ) ) ( not ( = ?auto_27626 ?auto_27628 ) ) ( not ( = ?auto_27626 ?auto_27653 ) ) ( not ( = ?auto_27628 ?auto_27660 ) ) ( not ( = ?auto_27628 ?auto_27648 ) ) ( not ( = ?auto_27628 ?auto_27640 ) ) ( not ( = ?auto_27628 ?auto_27667 ) ) ( not ( = ?auto_27628 ?auto_27643 ) ) ( not ( = ?auto_27628 ?auto_27656 ) ) ( not ( = ?auto_27628 ?auto_27659 ) ) ( not ( = ?auto_27628 ?auto_27636 ) ) ( not ( = ?auto_27628 ?auto_27647 ) ) ( not ( = ?auto_27628 ?auto_27641 ) ) ( not ( = ?auto_27628 ?auto_27661 ) ) ( not ( = ?auto_27652 ?auto_27657 ) ) ( not ( = ?auto_27652 ?auto_27658 ) ) ( not ( = ?auto_27652 ?auto_27664 ) ) ( not ( = ?auto_27652 ?auto_27662 ) ) ( not ( = ?auto_27652 ?auto_27639 ) ) ( not ( = ?auto_27652 ?auto_27638 ) ) ( not ( = ?auto_27652 ?auto_27645 ) ) ( not ( = ?auto_27652 ?auto_27655 ) ) ( not ( = ?auto_27652 ?auto_27663 ) ) ( not ( = ?auto_27649 ?auto_27665 ) ) ( not ( = ?auto_27649 ?auto_27650 ) ) ( not ( = ?auto_27649 ?auto_27637 ) ) ( not ( = ?auto_27649 ?auto_27654 ) ) ( not ( = ?auto_27649 ?auto_27651 ) ) ( not ( = ?auto_27649 ?auto_27666 ) ) ( not ( = ?auto_27649 ?auto_27646 ) ) ( not ( = ?auto_27649 ?auto_27644 ) ) ( not ( = ?auto_27649 ?auto_27642 ) ) ( not ( = ?auto_27653 ?auto_27660 ) ) ( not ( = ?auto_27653 ?auto_27648 ) ) ( not ( = ?auto_27653 ?auto_27640 ) ) ( not ( = ?auto_27653 ?auto_27667 ) ) ( not ( = ?auto_27653 ?auto_27643 ) ) ( not ( = ?auto_27653 ?auto_27656 ) ) ( not ( = ?auto_27653 ?auto_27659 ) ) ( not ( = ?auto_27653 ?auto_27636 ) ) ( not ( = ?auto_27653 ?auto_27647 ) ) ( not ( = ?auto_27653 ?auto_27641 ) ) ( not ( = ?auto_27653 ?auto_27661 ) ) ( not ( = ?auto_27616 ?auto_27629 ) ) ( not ( = ?auto_27616 ?auto_27634 ) ) ( not ( = ?auto_27617 ?auto_27629 ) ) ( not ( = ?auto_27617 ?auto_27634 ) ) ( not ( = ?auto_27618 ?auto_27629 ) ) ( not ( = ?auto_27618 ?auto_27634 ) ) ( not ( = ?auto_27619 ?auto_27629 ) ) ( not ( = ?auto_27619 ?auto_27634 ) ) ( not ( = ?auto_27620 ?auto_27629 ) ) ( not ( = ?auto_27620 ?auto_27634 ) ) ( not ( = ?auto_27621 ?auto_27629 ) ) ( not ( = ?auto_27621 ?auto_27634 ) ) ( not ( = ?auto_27622 ?auto_27629 ) ) ( not ( = ?auto_27622 ?auto_27634 ) ) ( not ( = ?auto_27623 ?auto_27629 ) ) ( not ( = ?auto_27623 ?auto_27634 ) ) ( not ( = ?auto_27624 ?auto_27629 ) ) ( not ( = ?auto_27624 ?auto_27634 ) ) ( not ( = ?auto_27625 ?auto_27629 ) ) ( not ( = ?auto_27625 ?auto_27634 ) ) ( not ( = ?auto_27626 ?auto_27629 ) ) ( not ( = ?auto_27626 ?auto_27634 ) ) ( not ( = ?auto_27627 ?auto_27629 ) ) ( not ( = ?auto_27627 ?auto_27634 ) ) ( not ( = ?auto_27629 ?auto_27653 ) ) ( not ( = ?auto_27629 ?auto_27660 ) ) ( not ( = ?auto_27629 ?auto_27648 ) ) ( not ( = ?auto_27629 ?auto_27640 ) ) ( not ( = ?auto_27629 ?auto_27667 ) ) ( not ( = ?auto_27629 ?auto_27643 ) ) ( not ( = ?auto_27629 ?auto_27656 ) ) ( not ( = ?auto_27629 ?auto_27659 ) ) ( not ( = ?auto_27629 ?auto_27636 ) ) ( not ( = ?auto_27629 ?auto_27647 ) ) ( not ( = ?auto_27629 ?auto_27641 ) ) ( not ( = ?auto_27629 ?auto_27661 ) ) ( not ( = ?auto_27631 ?auto_27652 ) ) ( not ( = ?auto_27631 ?auto_27657 ) ) ( not ( = ?auto_27631 ?auto_27658 ) ) ( not ( = ?auto_27631 ?auto_27664 ) ) ( not ( = ?auto_27631 ?auto_27662 ) ) ( not ( = ?auto_27631 ?auto_27639 ) ) ( not ( = ?auto_27631 ?auto_27638 ) ) ( not ( = ?auto_27631 ?auto_27645 ) ) ( not ( = ?auto_27631 ?auto_27655 ) ) ( not ( = ?auto_27631 ?auto_27663 ) ) ( not ( = ?auto_27632 ?auto_27649 ) ) ( not ( = ?auto_27632 ?auto_27665 ) ) ( not ( = ?auto_27632 ?auto_27650 ) ) ( not ( = ?auto_27632 ?auto_27637 ) ) ( not ( = ?auto_27632 ?auto_27654 ) ) ( not ( = ?auto_27632 ?auto_27651 ) ) ( not ( = ?auto_27632 ?auto_27666 ) ) ( not ( = ?auto_27632 ?auto_27646 ) ) ( not ( = ?auto_27632 ?auto_27644 ) ) ( not ( = ?auto_27632 ?auto_27642 ) ) ( not ( = ?auto_27634 ?auto_27653 ) ) ( not ( = ?auto_27634 ?auto_27660 ) ) ( not ( = ?auto_27634 ?auto_27648 ) ) ( not ( = ?auto_27634 ?auto_27640 ) ) ( not ( = ?auto_27634 ?auto_27667 ) ) ( not ( = ?auto_27634 ?auto_27643 ) ) ( not ( = ?auto_27634 ?auto_27656 ) ) ( not ( = ?auto_27634 ?auto_27659 ) ) ( not ( = ?auto_27634 ?auto_27636 ) ) ( not ( = ?auto_27634 ?auto_27647 ) ) ( not ( = ?auto_27634 ?auto_27641 ) ) ( not ( = ?auto_27634 ?auto_27661 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_27616 ?auto_27617 ?auto_27618 ?auto_27619 ?auto_27620 ?auto_27621 ?auto_27622 ?auto_27623 ?auto_27624 ?auto_27625 ?auto_27626 ?auto_27627 ?auto_27628 )
      ( MAKE-1CRATE ?auto_27628 ?auto_27629 )
      ( MAKE-13CRATE-VERIFY ?auto_27616 ?auto_27617 ?auto_27618 ?auto_27619 ?auto_27620 ?auto_27621 ?auto_27622 ?auto_27623 ?auto_27624 ?auto_27625 ?auto_27626 ?auto_27627 ?auto_27628 ?auto_27629 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_27693 - SURFACE
      ?auto_27694 - SURFACE
      ?auto_27695 - SURFACE
      ?auto_27696 - SURFACE
      ?auto_27697 - SURFACE
      ?auto_27698 - SURFACE
      ?auto_27699 - SURFACE
      ?auto_27700 - SURFACE
      ?auto_27701 - SURFACE
      ?auto_27702 - SURFACE
      ?auto_27703 - SURFACE
      ?auto_27704 - SURFACE
      ?auto_27705 - SURFACE
      ?auto_27706 - SURFACE
      ?auto_27707 - SURFACE
    )
    :vars
    (
      ?auto_27709 - HOIST
      ?auto_27712 - PLACE
      ?auto_27708 - PLACE
      ?auto_27713 - HOIST
      ?auto_27711 - SURFACE
      ?auto_27724 - PLACE
      ?auto_27734 - HOIST
      ?auto_27743 - SURFACE
      ?auto_27729 - PLACE
      ?auto_27723 - HOIST
      ?auto_27732 - SURFACE
      ?auto_27718 - SURFACE
      ?auto_27737 - PLACE
      ?auto_27735 - HOIST
      ?auto_27719 - SURFACE
      ?auto_27715 - PLACE
      ?auto_27725 - HOIST
      ?auto_27727 - SURFACE
      ?auto_27730 - PLACE
      ?auto_27744 - HOIST
      ?auto_27726 - SURFACE
      ?auto_27728 - PLACE
      ?auto_27736 - HOIST
      ?auto_27746 - SURFACE
      ?auto_27733 - PLACE
      ?auto_27716 - HOIST
      ?auto_27740 - SURFACE
      ?auto_27714 - PLACE
      ?auto_27721 - HOIST
      ?auto_27742 - SURFACE
      ?auto_27722 - SURFACE
      ?auto_27741 - PLACE
      ?auto_27739 - HOIST
      ?auto_27745 - SURFACE
      ?auto_27738 - PLACE
      ?auto_27720 - HOIST
      ?auto_27731 - SURFACE
      ?auto_27717 - SURFACE
      ?auto_27710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27709 ?auto_27712 ) ( IS-CRATE ?auto_27707 ) ( not ( = ?auto_27708 ?auto_27712 ) ) ( HOIST-AT ?auto_27713 ?auto_27708 ) ( SURFACE-AT ?auto_27707 ?auto_27708 ) ( ON ?auto_27707 ?auto_27711 ) ( CLEAR ?auto_27707 ) ( not ( = ?auto_27706 ?auto_27707 ) ) ( not ( = ?auto_27706 ?auto_27711 ) ) ( not ( = ?auto_27707 ?auto_27711 ) ) ( not ( = ?auto_27709 ?auto_27713 ) ) ( IS-CRATE ?auto_27706 ) ( not ( = ?auto_27724 ?auto_27712 ) ) ( HOIST-AT ?auto_27734 ?auto_27724 ) ( AVAILABLE ?auto_27734 ) ( SURFACE-AT ?auto_27706 ?auto_27724 ) ( ON ?auto_27706 ?auto_27743 ) ( CLEAR ?auto_27706 ) ( not ( = ?auto_27705 ?auto_27706 ) ) ( not ( = ?auto_27705 ?auto_27743 ) ) ( not ( = ?auto_27706 ?auto_27743 ) ) ( not ( = ?auto_27709 ?auto_27734 ) ) ( IS-CRATE ?auto_27705 ) ( not ( = ?auto_27729 ?auto_27712 ) ) ( HOIST-AT ?auto_27723 ?auto_27729 ) ( AVAILABLE ?auto_27723 ) ( SURFACE-AT ?auto_27705 ?auto_27729 ) ( ON ?auto_27705 ?auto_27732 ) ( CLEAR ?auto_27705 ) ( not ( = ?auto_27704 ?auto_27705 ) ) ( not ( = ?auto_27704 ?auto_27732 ) ) ( not ( = ?auto_27705 ?auto_27732 ) ) ( not ( = ?auto_27709 ?auto_27723 ) ) ( IS-CRATE ?auto_27704 ) ( AVAILABLE ?auto_27713 ) ( SURFACE-AT ?auto_27704 ?auto_27708 ) ( ON ?auto_27704 ?auto_27718 ) ( CLEAR ?auto_27704 ) ( not ( = ?auto_27703 ?auto_27704 ) ) ( not ( = ?auto_27703 ?auto_27718 ) ) ( not ( = ?auto_27704 ?auto_27718 ) ) ( IS-CRATE ?auto_27703 ) ( not ( = ?auto_27737 ?auto_27712 ) ) ( HOIST-AT ?auto_27735 ?auto_27737 ) ( AVAILABLE ?auto_27735 ) ( SURFACE-AT ?auto_27703 ?auto_27737 ) ( ON ?auto_27703 ?auto_27719 ) ( CLEAR ?auto_27703 ) ( not ( = ?auto_27702 ?auto_27703 ) ) ( not ( = ?auto_27702 ?auto_27719 ) ) ( not ( = ?auto_27703 ?auto_27719 ) ) ( not ( = ?auto_27709 ?auto_27735 ) ) ( IS-CRATE ?auto_27702 ) ( not ( = ?auto_27715 ?auto_27712 ) ) ( HOIST-AT ?auto_27725 ?auto_27715 ) ( SURFACE-AT ?auto_27702 ?auto_27715 ) ( ON ?auto_27702 ?auto_27727 ) ( CLEAR ?auto_27702 ) ( not ( = ?auto_27701 ?auto_27702 ) ) ( not ( = ?auto_27701 ?auto_27727 ) ) ( not ( = ?auto_27702 ?auto_27727 ) ) ( not ( = ?auto_27709 ?auto_27725 ) ) ( IS-CRATE ?auto_27701 ) ( not ( = ?auto_27730 ?auto_27712 ) ) ( HOIST-AT ?auto_27744 ?auto_27730 ) ( AVAILABLE ?auto_27744 ) ( SURFACE-AT ?auto_27701 ?auto_27730 ) ( ON ?auto_27701 ?auto_27726 ) ( CLEAR ?auto_27701 ) ( not ( = ?auto_27700 ?auto_27701 ) ) ( not ( = ?auto_27700 ?auto_27726 ) ) ( not ( = ?auto_27701 ?auto_27726 ) ) ( not ( = ?auto_27709 ?auto_27744 ) ) ( IS-CRATE ?auto_27700 ) ( not ( = ?auto_27728 ?auto_27712 ) ) ( HOIST-AT ?auto_27736 ?auto_27728 ) ( SURFACE-AT ?auto_27700 ?auto_27728 ) ( ON ?auto_27700 ?auto_27746 ) ( CLEAR ?auto_27700 ) ( not ( = ?auto_27699 ?auto_27700 ) ) ( not ( = ?auto_27699 ?auto_27746 ) ) ( not ( = ?auto_27700 ?auto_27746 ) ) ( not ( = ?auto_27709 ?auto_27736 ) ) ( IS-CRATE ?auto_27699 ) ( not ( = ?auto_27733 ?auto_27712 ) ) ( HOIST-AT ?auto_27716 ?auto_27733 ) ( AVAILABLE ?auto_27716 ) ( SURFACE-AT ?auto_27699 ?auto_27733 ) ( ON ?auto_27699 ?auto_27740 ) ( CLEAR ?auto_27699 ) ( not ( = ?auto_27698 ?auto_27699 ) ) ( not ( = ?auto_27698 ?auto_27740 ) ) ( not ( = ?auto_27699 ?auto_27740 ) ) ( not ( = ?auto_27709 ?auto_27716 ) ) ( IS-CRATE ?auto_27698 ) ( not ( = ?auto_27714 ?auto_27712 ) ) ( HOIST-AT ?auto_27721 ?auto_27714 ) ( AVAILABLE ?auto_27721 ) ( SURFACE-AT ?auto_27698 ?auto_27714 ) ( ON ?auto_27698 ?auto_27742 ) ( CLEAR ?auto_27698 ) ( not ( = ?auto_27697 ?auto_27698 ) ) ( not ( = ?auto_27697 ?auto_27742 ) ) ( not ( = ?auto_27698 ?auto_27742 ) ) ( not ( = ?auto_27709 ?auto_27721 ) ) ( IS-CRATE ?auto_27697 ) ( AVAILABLE ?auto_27725 ) ( SURFACE-AT ?auto_27697 ?auto_27715 ) ( ON ?auto_27697 ?auto_27722 ) ( CLEAR ?auto_27697 ) ( not ( = ?auto_27696 ?auto_27697 ) ) ( not ( = ?auto_27696 ?auto_27722 ) ) ( not ( = ?auto_27697 ?auto_27722 ) ) ( IS-CRATE ?auto_27696 ) ( not ( = ?auto_27741 ?auto_27712 ) ) ( HOIST-AT ?auto_27739 ?auto_27741 ) ( AVAILABLE ?auto_27739 ) ( SURFACE-AT ?auto_27696 ?auto_27741 ) ( ON ?auto_27696 ?auto_27745 ) ( CLEAR ?auto_27696 ) ( not ( = ?auto_27695 ?auto_27696 ) ) ( not ( = ?auto_27695 ?auto_27745 ) ) ( not ( = ?auto_27696 ?auto_27745 ) ) ( not ( = ?auto_27709 ?auto_27739 ) ) ( IS-CRATE ?auto_27695 ) ( not ( = ?auto_27738 ?auto_27712 ) ) ( HOIST-AT ?auto_27720 ?auto_27738 ) ( AVAILABLE ?auto_27720 ) ( SURFACE-AT ?auto_27695 ?auto_27738 ) ( ON ?auto_27695 ?auto_27731 ) ( CLEAR ?auto_27695 ) ( not ( = ?auto_27694 ?auto_27695 ) ) ( not ( = ?auto_27694 ?auto_27731 ) ) ( not ( = ?auto_27695 ?auto_27731 ) ) ( not ( = ?auto_27709 ?auto_27720 ) ) ( SURFACE-AT ?auto_27693 ?auto_27712 ) ( CLEAR ?auto_27693 ) ( IS-CRATE ?auto_27694 ) ( AVAILABLE ?auto_27709 ) ( AVAILABLE ?auto_27736 ) ( SURFACE-AT ?auto_27694 ?auto_27728 ) ( ON ?auto_27694 ?auto_27717 ) ( CLEAR ?auto_27694 ) ( TRUCK-AT ?auto_27710 ?auto_27712 ) ( not ( = ?auto_27693 ?auto_27694 ) ) ( not ( = ?auto_27693 ?auto_27717 ) ) ( not ( = ?auto_27694 ?auto_27717 ) ) ( not ( = ?auto_27693 ?auto_27695 ) ) ( not ( = ?auto_27693 ?auto_27731 ) ) ( not ( = ?auto_27695 ?auto_27717 ) ) ( not ( = ?auto_27738 ?auto_27728 ) ) ( not ( = ?auto_27720 ?auto_27736 ) ) ( not ( = ?auto_27731 ?auto_27717 ) ) ( not ( = ?auto_27693 ?auto_27696 ) ) ( not ( = ?auto_27693 ?auto_27745 ) ) ( not ( = ?auto_27694 ?auto_27696 ) ) ( not ( = ?auto_27694 ?auto_27745 ) ) ( not ( = ?auto_27696 ?auto_27731 ) ) ( not ( = ?auto_27696 ?auto_27717 ) ) ( not ( = ?auto_27741 ?auto_27738 ) ) ( not ( = ?auto_27741 ?auto_27728 ) ) ( not ( = ?auto_27739 ?auto_27720 ) ) ( not ( = ?auto_27739 ?auto_27736 ) ) ( not ( = ?auto_27745 ?auto_27731 ) ) ( not ( = ?auto_27745 ?auto_27717 ) ) ( not ( = ?auto_27693 ?auto_27697 ) ) ( not ( = ?auto_27693 ?auto_27722 ) ) ( not ( = ?auto_27694 ?auto_27697 ) ) ( not ( = ?auto_27694 ?auto_27722 ) ) ( not ( = ?auto_27695 ?auto_27697 ) ) ( not ( = ?auto_27695 ?auto_27722 ) ) ( not ( = ?auto_27697 ?auto_27745 ) ) ( not ( = ?auto_27697 ?auto_27731 ) ) ( not ( = ?auto_27697 ?auto_27717 ) ) ( not ( = ?auto_27715 ?auto_27741 ) ) ( not ( = ?auto_27715 ?auto_27738 ) ) ( not ( = ?auto_27715 ?auto_27728 ) ) ( not ( = ?auto_27725 ?auto_27739 ) ) ( not ( = ?auto_27725 ?auto_27720 ) ) ( not ( = ?auto_27725 ?auto_27736 ) ) ( not ( = ?auto_27722 ?auto_27745 ) ) ( not ( = ?auto_27722 ?auto_27731 ) ) ( not ( = ?auto_27722 ?auto_27717 ) ) ( not ( = ?auto_27693 ?auto_27698 ) ) ( not ( = ?auto_27693 ?auto_27742 ) ) ( not ( = ?auto_27694 ?auto_27698 ) ) ( not ( = ?auto_27694 ?auto_27742 ) ) ( not ( = ?auto_27695 ?auto_27698 ) ) ( not ( = ?auto_27695 ?auto_27742 ) ) ( not ( = ?auto_27696 ?auto_27698 ) ) ( not ( = ?auto_27696 ?auto_27742 ) ) ( not ( = ?auto_27698 ?auto_27722 ) ) ( not ( = ?auto_27698 ?auto_27745 ) ) ( not ( = ?auto_27698 ?auto_27731 ) ) ( not ( = ?auto_27698 ?auto_27717 ) ) ( not ( = ?auto_27714 ?auto_27715 ) ) ( not ( = ?auto_27714 ?auto_27741 ) ) ( not ( = ?auto_27714 ?auto_27738 ) ) ( not ( = ?auto_27714 ?auto_27728 ) ) ( not ( = ?auto_27721 ?auto_27725 ) ) ( not ( = ?auto_27721 ?auto_27739 ) ) ( not ( = ?auto_27721 ?auto_27720 ) ) ( not ( = ?auto_27721 ?auto_27736 ) ) ( not ( = ?auto_27742 ?auto_27722 ) ) ( not ( = ?auto_27742 ?auto_27745 ) ) ( not ( = ?auto_27742 ?auto_27731 ) ) ( not ( = ?auto_27742 ?auto_27717 ) ) ( not ( = ?auto_27693 ?auto_27699 ) ) ( not ( = ?auto_27693 ?auto_27740 ) ) ( not ( = ?auto_27694 ?auto_27699 ) ) ( not ( = ?auto_27694 ?auto_27740 ) ) ( not ( = ?auto_27695 ?auto_27699 ) ) ( not ( = ?auto_27695 ?auto_27740 ) ) ( not ( = ?auto_27696 ?auto_27699 ) ) ( not ( = ?auto_27696 ?auto_27740 ) ) ( not ( = ?auto_27697 ?auto_27699 ) ) ( not ( = ?auto_27697 ?auto_27740 ) ) ( not ( = ?auto_27699 ?auto_27742 ) ) ( not ( = ?auto_27699 ?auto_27722 ) ) ( not ( = ?auto_27699 ?auto_27745 ) ) ( not ( = ?auto_27699 ?auto_27731 ) ) ( not ( = ?auto_27699 ?auto_27717 ) ) ( not ( = ?auto_27733 ?auto_27714 ) ) ( not ( = ?auto_27733 ?auto_27715 ) ) ( not ( = ?auto_27733 ?auto_27741 ) ) ( not ( = ?auto_27733 ?auto_27738 ) ) ( not ( = ?auto_27733 ?auto_27728 ) ) ( not ( = ?auto_27716 ?auto_27721 ) ) ( not ( = ?auto_27716 ?auto_27725 ) ) ( not ( = ?auto_27716 ?auto_27739 ) ) ( not ( = ?auto_27716 ?auto_27720 ) ) ( not ( = ?auto_27716 ?auto_27736 ) ) ( not ( = ?auto_27740 ?auto_27742 ) ) ( not ( = ?auto_27740 ?auto_27722 ) ) ( not ( = ?auto_27740 ?auto_27745 ) ) ( not ( = ?auto_27740 ?auto_27731 ) ) ( not ( = ?auto_27740 ?auto_27717 ) ) ( not ( = ?auto_27693 ?auto_27700 ) ) ( not ( = ?auto_27693 ?auto_27746 ) ) ( not ( = ?auto_27694 ?auto_27700 ) ) ( not ( = ?auto_27694 ?auto_27746 ) ) ( not ( = ?auto_27695 ?auto_27700 ) ) ( not ( = ?auto_27695 ?auto_27746 ) ) ( not ( = ?auto_27696 ?auto_27700 ) ) ( not ( = ?auto_27696 ?auto_27746 ) ) ( not ( = ?auto_27697 ?auto_27700 ) ) ( not ( = ?auto_27697 ?auto_27746 ) ) ( not ( = ?auto_27698 ?auto_27700 ) ) ( not ( = ?auto_27698 ?auto_27746 ) ) ( not ( = ?auto_27700 ?auto_27740 ) ) ( not ( = ?auto_27700 ?auto_27742 ) ) ( not ( = ?auto_27700 ?auto_27722 ) ) ( not ( = ?auto_27700 ?auto_27745 ) ) ( not ( = ?auto_27700 ?auto_27731 ) ) ( not ( = ?auto_27700 ?auto_27717 ) ) ( not ( = ?auto_27746 ?auto_27740 ) ) ( not ( = ?auto_27746 ?auto_27742 ) ) ( not ( = ?auto_27746 ?auto_27722 ) ) ( not ( = ?auto_27746 ?auto_27745 ) ) ( not ( = ?auto_27746 ?auto_27731 ) ) ( not ( = ?auto_27746 ?auto_27717 ) ) ( not ( = ?auto_27693 ?auto_27701 ) ) ( not ( = ?auto_27693 ?auto_27726 ) ) ( not ( = ?auto_27694 ?auto_27701 ) ) ( not ( = ?auto_27694 ?auto_27726 ) ) ( not ( = ?auto_27695 ?auto_27701 ) ) ( not ( = ?auto_27695 ?auto_27726 ) ) ( not ( = ?auto_27696 ?auto_27701 ) ) ( not ( = ?auto_27696 ?auto_27726 ) ) ( not ( = ?auto_27697 ?auto_27701 ) ) ( not ( = ?auto_27697 ?auto_27726 ) ) ( not ( = ?auto_27698 ?auto_27701 ) ) ( not ( = ?auto_27698 ?auto_27726 ) ) ( not ( = ?auto_27699 ?auto_27701 ) ) ( not ( = ?auto_27699 ?auto_27726 ) ) ( not ( = ?auto_27701 ?auto_27746 ) ) ( not ( = ?auto_27701 ?auto_27740 ) ) ( not ( = ?auto_27701 ?auto_27742 ) ) ( not ( = ?auto_27701 ?auto_27722 ) ) ( not ( = ?auto_27701 ?auto_27745 ) ) ( not ( = ?auto_27701 ?auto_27731 ) ) ( not ( = ?auto_27701 ?auto_27717 ) ) ( not ( = ?auto_27730 ?auto_27728 ) ) ( not ( = ?auto_27730 ?auto_27733 ) ) ( not ( = ?auto_27730 ?auto_27714 ) ) ( not ( = ?auto_27730 ?auto_27715 ) ) ( not ( = ?auto_27730 ?auto_27741 ) ) ( not ( = ?auto_27730 ?auto_27738 ) ) ( not ( = ?auto_27744 ?auto_27736 ) ) ( not ( = ?auto_27744 ?auto_27716 ) ) ( not ( = ?auto_27744 ?auto_27721 ) ) ( not ( = ?auto_27744 ?auto_27725 ) ) ( not ( = ?auto_27744 ?auto_27739 ) ) ( not ( = ?auto_27744 ?auto_27720 ) ) ( not ( = ?auto_27726 ?auto_27746 ) ) ( not ( = ?auto_27726 ?auto_27740 ) ) ( not ( = ?auto_27726 ?auto_27742 ) ) ( not ( = ?auto_27726 ?auto_27722 ) ) ( not ( = ?auto_27726 ?auto_27745 ) ) ( not ( = ?auto_27726 ?auto_27731 ) ) ( not ( = ?auto_27726 ?auto_27717 ) ) ( not ( = ?auto_27693 ?auto_27702 ) ) ( not ( = ?auto_27693 ?auto_27727 ) ) ( not ( = ?auto_27694 ?auto_27702 ) ) ( not ( = ?auto_27694 ?auto_27727 ) ) ( not ( = ?auto_27695 ?auto_27702 ) ) ( not ( = ?auto_27695 ?auto_27727 ) ) ( not ( = ?auto_27696 ?auto_27702 ) ) ( not ( = ?auto_27696 ?auto_27727 ) ) ( not ( = ?auto_27697 ?auto_27702 ) ) ( not ( = ?auto_27697 ?auto_27727 ) ) ( not ( = ?auto_27698 ?auto_27702 ) ) ( not ( = ?auto_27698 ?auto_27727 ) ) ( not ( = ?auto_27699 ?auto_27702 ) ) ( not ( = ?auto_27699 ?auto_27727 ) ) ( not ( = ?auto_27700 ?auto_27702 ) ) ( not ( = ?auto_27700 ?auto_27727 ) ) ( not ( = ?auto_27702 ?auto_27726 ) ) ( not ( = ?auto_27702 ?auto_27746 ) ) ( not ( = ?auto_27702 ?auto_27740 ) ) ( not ( = ?auto_27702 ?auto_27742 ) ) ( not ( = ?auto_27702 ?auto_27722 ) ) ( not ( = ?auto_27702 ?auto_27745 ) ) ( not ( = ?auto_27702 ?auto_27731 ) ) ( not ( = ?auto_27702 ?auto_27717 ) ) ( not ( = ?auto_27727 ?auto_27726 ) ) ( not ( = ?auto_27727 ?auto_27746 ) ) ( not ( = ?auto_27727 ?auto_27740 ) ) ( not ( = ?auto_27727 ?auto_27742 ) ) ( not ( = ?auto_27727 ?auto_27722 ) ) ( not ( = ?auto_27727 ?auto_27745 ) ) ( not ( = ?auto_27727 ?auto_27731 ) ) ( not ( = ?auto_27727 ?auto_27717 ) ) ( not ( = ?auto_27693 ?auto_27703 ) ) ( not ( = ?auto_27693 ?auto_27719 ) ) ( not ( = ?auto_27694 ?auto_27703 ) ) ( not ( = ?auto_27694 ?auto_27719 ) ) ( not ( = ?auto_27695 ?auto_27703 ) ) ( not ( = ?auto_27695 ?auto_27719 ) ) ( not ( = ?auto_27696 ?auto_27703 ) ) ( not ( = ?auto_27696 ?auto_27719 ) ) ( not ( = ?auto_27697 ?auto_27703 ) ) ( not ( = ?auto_27697 ?auto_27719 ) ) ( not ( = ?auto_27698 ?auto_27703 ) ) ( not ( = ?auto_27698 ?auto_27719 ) ) ( not ( = ?auto_27699 ?auto_27703 ) ) ( not ( = ?auto_27699 ?auto_27719 ) ) ( not ( = ?auto_27700 ?auto_27703 ) ) ( not ( = ?auto_27700 ?auto_27719 ) ) ( not ( = ?auto_27701 ?auto_27703 ) ) ( not ( = ?auto_27701 ?auto_27719 ) ) ( not ( = ?auto_27703 ?auto_27727 ) ) ( not ( = ?auto_27703 ?auto_27726 ) ) ( not ( = ?auto_27703 ?auto_27746 ) ) ( not ( = ?auto_27703 ?auto_27740 ) ) ( not ( = ?auto_27703 ?auto_27742 ) ) ( not ( = ?auto_27703 ?auto_27722 ) ) ( not ( = ?auto_27703 ?auto_27745 ) ) ( not ( = ?auto_27703 ?auto_27731 ) ) ( not ( = ?auto_27703 ?auto_27717 ) ) ( not ( = ?auto_27737 ?auto_27715 ) ) ( not ( = ?auto_27737 ?auto_27730 ) ) ( not ( = ?auto_27737 ?auto_27728 ) ) ( not ( = ?auto_27737 ?auto_27733 ) ) ( not ( = ?auto_27737 ?auto_27714 ) ) ( not ( = ?auto_27737 ?auto_27741 ) ) ( not ( = ?auto_27737 ?auto_27738 ) ) ( not ( = ?auto_27735 ?auto_27725 ) ) ( not ( = ?auto_27735 ?auto_27744 ) ) ( not ( = ?auto_27735 ?auto_27736 ) ) ( not ( = ?auto_27735 ?auto_27716 ) ) ( not ( = ?auto_27735 ?auto_27721 ) ) ( not ( = ?auto_27735 ?auto_27739 ) ) ( not ( = ?auto_27735 ?auto_27720 ) ) ( not ( = ?auto_27719 ?auto_27727 ) ) ( not ( = ?auto_27719 ?auto_27726 ) ) ( not ( = ?auto_27719 ?auto_27746 ) ) ( not ( = ?auto_27719 ?auto_27740 ) ) ( not ( = ?auto_27719 ?auto_27742 ) ) ( not ( = ?auto_27719 ?auto_27722 ) ) ( not ( = ?auto_27719 ?auto_27745 ) ) ( not ( = ?auto_27719 ?auto_27731 ) ) ( not ( = ?auto_27719 ?auto_27717 ) ) ( not ( = ?auto_27693 ?auto_27704 ) ) ( not ( = ?auto_27693 ?auto_27718 ) ) ( not ( = ?auto_27694 ?auto_27704 ) ) ( not ( = ?auto_27694 ?auto_27718 ) ) ( not ( = ?auto_27695 ?auto_27704 ) ) ( not ( = ?auto_27695 ?auto_27718 ) ) ( not ( = ?auto_27696 ?auto_27704 ) ) ( not ( = ?auto_27696 ?auto_27718 ) ) ( not ( = ?auto_27697 ?auto_27704 ) ) ( not ( = ?auto_27697 ?auto_27718 ) ) ( not ( = ?auto_27698 ?auto_27704 ) ) ( not ( = ?auto_27698 ?auto_27718 ) ) ( not ( = ?auto_27699 ?auto_27704 ) ) ( not ( = ?auto_27699 ?auto_27718 ) ) ( not ( = ?auto_27700 ?auto_27704 ) ) ( not ( = ?auto_27700 ?auto_27718 ) ) ( not ( = ?auto_27701 ?auto_27704 ) ) ( not ( = ?auto_27701 ?auto_27718 ) ) ( not ( = ?auto_27702 ?auto_27704 ) ) ( not ( = ?auto_27702 ?auto_27718 ) ) ( not ( = ?auto_27704 ?auto_27719 ) ) ( not ( = ?auto_27704 ?auto_27727 ) ) ( not ( = ?auto_27704 ?auto_27726 ) ) ( not ( = ?auto_27704 ?auto_27746 ) ) ( not ( = ?auto_27704 ?auto_27740 ) ) ( not ( = ?auto_27704 ?auto_27742 ) ) ( not ( = ?auto_27704 ?auto_27722 ) ) ( not ( = ?auto_27704 ?auto_27745 ) ) ( not ( = ?auto_27704 ?auto_27731 ) ) ( not ( = ?auto_27704 ?auto_27717 ) ) ( not ( = ?auto_27708 ?auto_27737 ) ) ( not ( = ?auto_27708 ?auto_27715 ) ) ( not ( = ?auto_27708 ?auto_27730 ) ) ( not ( = ?auto_27708 ?auto_27728 ) ) ( not ( = ?auto_27708 ?auto_27733 ) ) ( not ( = ?auto_27708 ?auto_27714 ) ) ( not ( = ?auto_27708 ?auto_27741 ) ) ( not ( = ?auto_27708 ?auto_27738 ) ) ( not ( = ?auto_27713 ?auto_27735 ) ) ( not ( = ?auto_27713 ?auto_27725 ) ) ( not ( = ?auto_27713 ?auto_27744 ) ) ( not ( = ?auto_27713 ?auto_27736 ) ) ( not ( = ?auto_27713 ?auto_27716 ) ) ( not ( = ?auto_27713 ?auto_27721 ) ) ( not ( = ?auto_27713 ?auto_27739 ) ) ( not ( = ?auto_27713 ?auto_27720 ) ) ( not ( = ?auto_27718 ?auto_27719 ) ) ( not ( = ?auto_27718 ?auto_27727 ) ) ( not ( = ?auto_27718 ?auto_27726 ) ) ( not ( = ?auto_27718 ?auto_27746 ) ) ( not ( = ?auto_27718 ?auto_27740 ) ) ( not ( = ?auto_27718 ?auto_27742 ) ) ( not ( = ?auto_27718 ?auto_27722 ) ) ( not ( = ?auto_27718 ?auto_27745 ) ) ( not ( = ?auto_27718 ?auto_27731 ) ) ( not ( = ?auto_27718 ?auto_27717 ) ) ( not ( = ?auto_27693 ?auto_27705 ) ) ( not ( = ?auto_27693 ?auto_27732 ) ) ( not ( = ?auto_27694 ?auto_27705 ) ) ( not ( = ?auto_27694 ?auto_27732 ) ) ( not ( = ?auto_27695 ?auto_27705 ) ) ( not ( = ?auto_27695 ?auto_27732 ) ) ( not ( = ?auto_27696 ?auto_27705 ) ) ( not ( = ?auto_27696 ?auto_27732 ) ) ( not ( = ?auto_27697 ?auto_27705 ) ) ( not ( = ?auto_27697 ?auto_27732 ) ) ( not ( = ?auto_27698 ?auto_27705 ) ) ( not ( = ?auto_27698 ?auto_27732 ) ) ( not ( = ?auto_27699 ?auto_27705 ) ) ( not ( = ?auto_27699 ?auto_27732 ) ) ( not ( = ?auto_27700 ?auto_27705 ) ) ( not ( = ?auto_27700 ?auto_27732 ) ) ( not ( = ?auto_27701 ?auto_27705 ) ) ( not ( = ?auto_27701 ?auto_27732 ) ) ( not ( = ?auto_27702 ?auto_27705 ) ) ( not ( = ?auto_27702 ?auto_27732 ) ) ( not ( = ?auto_27703 ?auto_27705 ) ) ( not ( = ?auto_27703 ?auto_27732 ) ) ( not ( = ?auto_27705 ?auto_27718 ) ) ( not ( = ?auto_27705 ?auto_27719 ) ) ( not ( = ?auto_27705 ?auto_27727 ) ) ( not ( = ?auto_27705 ?auto_27726 ) ) ( not ( = ?auto_27705 ?auto_27746 ) ) ( not ( = ?auto_27705 ?auto_27740 ) ) ( not ( = ?auto_27705 ?auto_27742 ) ) ( not ( = ?auto_27705 ?auto_27722 ) ) ( not ( = ?auto_27705 ?auto_27745 ) ) ( not ( = ?auto_27705 ?auto_27731 ) ) ( not ( = ?auto_27705 ?auto_27717 ) ) ( not ( = ?auto_27729 ?auto_27708 ) ) ( not ( = ?auto_27729 ?auto_27737 ) ) ( not ( = ?auto_27729 ?auto_27715 ) ) ( not ( = ?auto_27729 ?auto_27730 ) ) ( not ( = ?auto_27729 ?auto_27728 ) ) ( not ( = ?auto_27729 ?auto_27733 ) ) ( not ( = ?auto_27729 ?auto_27714 ) ) ( not ( = ?auto_27729 ?auto_27741 ) ) ( not ( = ?auto_27729 ?auto_27738 ) ) ( not ( = ?auto_27723 ?auto_27713 ) ) ( not ( = ?auto_27723 ?auto_27735 ) ) ( not ( = ?auto_27723 ?auto_27725 ) ) ( not ( = ?auto_27723 ?auto_27744 ) ) ( not ( = ?auto_27723 ?auto_27736 ) ) ( not ( = ?auto_27723 ?auto_27716 ) ) ( not ( = ?auto_27723 ?auto_27721 ) ) ( not ( = ?auto_27723 ?auto_27739 ) ) ( not ( = ?auto_27723 ?auto_27720 ) ) ( not ( = ?auto_27732 ?auto_27718 ) ) ( not ( = ?auto_27732 ?auto_27719 ) ) ( not ( = ?auto_27732 ?auto_27727 ) ) ( not ( = ?auto_27732 ?auto_27726 ) ) ( not ( = ?auto_27732 ?auto_27746 ) ) ( not ( = ?auto_27732 ?auto_27740 ) ) ( not ( = ?auto_27732 ?auto_27742 ) ) ( not ( = ?auto_27732 ?auto_27722 ) ) ( not ( = ?auto_27732 ?auto_27745 ) ) ( not ( = ?auto_27732 ?auto_27731 ) ) ( not ( = ?auto_27732 ?auto_27717 ) ) ( not ( = ?auto_27693 ?auto_27706 ) ) ( not ( = ?auto_27693 ?auto_27743 ) ) ( not ( = ?auto_27694 ?auto_27706 ) ) ( not ( = ?auto_27694 ?auto_27743 ) ) ( not ( = ?auto_27695 ?auto_27706 ) ) ( not ( = ?auto_27695 ?auto_27743 ) ) ( not ( = ?auto_27696 ?auto_27706 ) ) ( not ( = ?auto_27696 ?auto_27743 ) ) ( not ( = ?auto_27697 ?auto_27706 ) ) ( not ( = ?auto_27697 ?auto_27743 ) ) ( not ( = ?auto_27698 ?auto_27706 ) ) ( not ( = ?auto_27698 ?auto_27743 ) ) ( not ( = ?auto_27699 ?auto_27706 ) ) ( not ( = ?auto_27699 ?auto_27743 ) ) ( not ( = ?auto_27700 ?auto_27706 ) ) ( not ( = ?auto_27700 ?auto_27743 ) ) ( not ( = ?auto_27701 ?auto_27706 ) ) ( not ( = ?auto_27701 ?auto_27743 ) ) ( not ( = ?auto_27702 ?auto_27706 ) ) ( not ( = ?auto_27702 ?auto_27743 ) ) ( not ( = ?auto_27703 ?auto_27706 ) ) ( not ( = ?auto_27703 ?auto_27743 ) ) ( not ( = ?auto_27704 ?auto_27706 ) ) ( not ( = ?auto_27704 ?auto_27743 ) ) ( not ( = ?auto_27706 ?auto_27732 ) ) ( not ( = ?auto_27706 ?auto_27718 ) ) ( not ( = ?auto_27706 ?auto_27719 ) ) ( not ( = ?auto_27706 ?auto_27727 ) ) ( not ( = ?auto_27706 ?auto_27726 ) ) ( not ( = ?auto_27706 ?auto_27746 ) ) ( not ( = ?auto_27706 ?auto_27740 ) ) ( not ( = ?auto_27706 ?auto_27742 ) ) ( not ( = ?auto_27706 ?auto_27722 ) ) ( not ( = ?auto_27706 ?auto_27745 ) ) ( not ( = ?auto_27706 ?auto_27731 ) ) ( not ( = ?auto_27706 ?auto_27717 ) ) ( not ( = ?auto_27724 ?auto_27729 ) ) ( not ( = ?auto_27724 ?auto_27708 ) ) ( not ( = ?auto_27724 ?auto_27737 ) ) ( not ( = ?auto_27724 ?auto_27715 ) ) ( not ( = ?auto_27724 ?auto_27730 ) ) ( not ( = ?auto_27724 ?auto_27728 ) ) ( not ( = ?auto_27724 ?auto_27733 ) ) ( not ( = ?auto_27724 ?auto_27714 ) ) ( not ( = ?auto_27724 ?auto_27741 ) ) ( not ( = ?auto_27724 ?auto_27738 ) ) ( not ( = ?auto_27734 ?auto_27723 ) ) ( not ( = ?auto_27734 ?auto_27713 ) ) ( not ( = ?auto_27734 ?auto_27735 ) ) ( not ( = ?auto_27734 ?auto_27725 ) ) ( not ( = ?auto_27734 ?auto_27744 ) ) ( not ( = ?auto_27734 ?auto_27736 ) ) ( not ( = ?auto_27734 ?auto_27716 ) ) ( not ( = ?auto_27734 ?auto_27721 ) ) ( not ( = ?auto_27734 ?auto_27739 ) ) ( not ( = ?auto_27734 ?auto_27720 ) ) ( not ( = ?auto_27743 ?auto_27732 ) ) ( not ( = ?auto_27743 ?auto_27718 ) ) ( not ( = ?auto_27743 ?auto_27719 ) ) ( not ( = ?auto_27743 ?auto_27727 ) ) ( not ( = ?auto_27743 ?auto_27726 ) ) ( not ( = ?auto_27743 ?auto_27746 ) ) ( not ( = ?auto_27743 ?auto_27740 ) ) ( not ( = ?auto_27743 ?auto_27742 ) ) ( not ( = ?auto_27743 ?auto_27722 ) ) ( not ( = ?auto_27743 ?auto_27745 ) ) ( not ( = ?auto_27743 ?auto_27731 ) ) ( not ( = ?auto_27743 ?auto_27717 ) ) ( not ( = ?auto_27693 ?auto_27707 ) ) ( not ( = ?auto_27693 ?auto_27711 ) ) ( not ( = ?auto_27694 ?auto_27707 ) ) ( not ( = ?auto_27694 ?auto_27711 ) ) ( not ( = ?auto_27695 ?auto_27707 ) ) ( not ( = ?auto_27695 ?auto_27711 ) ) ( not ( = ?auto_27696 ?auto_27707 ) ) ( not ( = ?auto_27696 ?auto_27711 ) ) ( not ( = ?auto_27697 ?auto_27707 ) ) ( not ( = ?auto_27697 ?auto_27711 ) ) ( not ( = ?auto_27698 ?auto_27707 ) ) ( not ( = ?auto_27698 ?auto_27711 ) ) ( not ( = ?auto_27699 ?auto_27707 ) ) ( not ( = ?auto_27699 ?auto_27711 ) ) ( not ( = ?auto_27700 ?auto_27707 ) ) ( not ( = ?auto_27700 ?auto_27711 ) ) ( not ( = ?auto_27701 ?auto_27707 ) ) ( not ( = ?auto_27701 ?auto_27711 ) ) ( not ( = ?auto_27702 ?auto_27707 ) ) ( not ( = ?auto_27702 ?auto_27711 ) ) ( not ( = ?auto_27703 ?auto_27707 ) ) ( not ( = ?auto_27703 ?auto_27711 ) ) ( not ( = ?auto_27704 ?auto_27707 ) ) ( not ( = ?auto_27704 ?auto_27711 ) ) ( not ( = ?auto_27705 ?auto_27707 ) ) ( not ( = ?auto_27705 ?auto_27711 ) ) ( not ( = ?auto_27707 ?auto_27743 ) ) ( not ( = ?auto_27707 ?auto_27732 ) ) ( not ( = ?auto_27707 ?auto_27718 ) ) ( not ( = ?auto_27707 ?auto_27719 ) ) ( not ( = ?auto_27707 ?auto_27727 ) ) ( not ( = ?auto_27707 ?auto_27726 ) ) ( not ( = ?auto_27707 ?auto_27746 ) ) ( not ( = ?auto_27707 ?auto_27740 ) ) ( not ( = ?auto_27707 ?auto_27742 ) ) ( not ( = ?auto_27707 ?auto_27722 ) ) ( not ( = ?auto_27707 ?auto_27745 ) ) ( not ( = ?auto_27707 ?auto_27731 ) ) ( not ( = ?auto_27707 ?auto_27717 ) ) ( not ( = ?auto_27711 ?auto_27743 ) ) ( not ( = ?auto_27711 ?auto_27732 ) ) ( not ( = ?auto_27711 ?auto_27718 ) ) ( not ( = ?auto_27711 ?auto_27719 ) ) ( not ( = ?auto_27711 ?auto_27727 ) ) ( not ( = ?auto_27711 ?auto_27726 ) ) ( not ( = ?auto_27711 ?auto_27746 ) ) ( not ( = ?auto_27711 ?auto_27740 ) ) ( not ( = ?auto_27711 ?auto_27742 ) ) ( not ( = ?auto_27711 ?auto_27722 ) ) ( not ( = ?auto_27711 ?auto_27745 ) ) ( not ( = ?auto_27711 ?auto_27731 ) ) ( not ( = ?auto_27711 ?auto_27717 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_27693 ?auto_27694 ?auto_27695 ?auto_27696 ?auto_27697 ?auto_27698 ?auto_27699 ?auto_27700 ?auto_27701 ?auto_27702 ?auto_27703 ?auto_27704 ?auto_27705 ?auto_27706 )
      ( MAKE-1CRATE ?auto_27706 ?auto_27707 )
      ( MAKE-14CRATE-VERIFY ?auto_27693 ?auto_27694 ?auto_27695 ?auto_27696 ?auto_27697 ?auto_27698 ?auto_27699 ?auto_27700 ?auto_27701 ?auto_27702 ?auto_27703 ?auto_27704 ?auto_27705 ?auto_27706 ?auto_27707 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_27773 - SURFACE
      ?auto_27774 - SURFACE
      ?auto_27775 - SURFACE
      ?auto_27776 - SURFACE
      ?auto_27777 - SURFACE
      ?auto_27778 - SURFACE
      ?auto_27779 - SURFACE
      ?auto_27780 - SURFACE
      ?auto_27781 - SURFACE
      ?auto_27782 - SURFACE
      ?auto_27783 - SURFACE
      ?auto_27784 - SURFACE
      ?auto_27785 - SURFACE
      ?auto_27786 - SURFACE
      ?auto_27787 - SURFACE
      ?auto_27788 - SURFACE
    )
    :vars
    (
      ?auto_27794 - HOIST
      ?auto_27791 - PLACE
      ?auto_27790 - PLACE
      ?auto_27789 - HOIST
      ?auto_27793 - SURFACE
      ?auto_27828 - PLACE
      ?auto_27825 - HOIST
      ?auto_27807 - SURFACE
      ?auto_27821 - PLACE
      ?auto_27799 - HOIST
      ?auto_27815 - SURFACE
      ?auto_27808 - PLACE
      ?auto_27804 - HOIST
      ?auto_27817 - SURFACE
      ?auto_27816 - SURFACE
      ?auto_27798 - PLACE
      ?auto_27822 - HOIST
      ?auto_27814 - SURFACE
      ?auto_27796 - SURFACE
      ?auto_27820 - PLACE
      ?auto_27824 - HOIST
      ?auto_27819 - SURFACE
      ?auto_27827 - PLACE
      ?auto_27809 - HOIST
      ?auto_27813 - SURFACE
      ?auto_27802 - PLACE
      ?auto_27803 - HOIST
      ?auto_27823 - SURFACE
      ?auto_27818 - PLACE
      ?auto_27801 - HOIST
      ?auto_27810 - SURFACE
      ?auto_27806 - SURFACE
      ?auto_27797 - PLACE
      ?auto_27811 - HOIST
      ?auto_27800 - SURFACE
      ?auto_27812 - PLACE
      ?auto_27805 - HOIST
      ?auto_27795 - SURFACE
      ?auto_27826 - SURFACE
      ?auto_27792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27794 ?auto_27791 ) ( IS-CRATE ?auto_27788 ) ( not ( = ?auto_27790 ?auto_27791 ) ) ( HOIST-AT ?auto_27789 ?auto_27790 ) ( SURFACE-AT ?auto_27788 ?auto_27790 ) ( ON ?auto_27788 ?auto_27793 ) ( CLEAR ?auto_27788 ) ( not ( = ?auto_27787 ?auto_27788 ) ) ( not ( = ?auto_27787 ?auto_27793 ) ) ( not ( = ?auto_27788 ?auto_27793 ) ) ( not ( = ?auto_27794 ?auto_27789 ) ) ( IS-CRATE ?auto_27787 ) ( not ( = ?auto_27828 ?auto_27791 ) ) ( HOIST-AT ?auto_27825 ?auto_27828 ) ( SURFACE-AT ?auto_27787 ?auto_27828 ) ( ON ?auto_27787 ?auto_27807 ) ( CLEAR ?auto_27787 ) ( not ( = ?auto_27786 ?auto_27787 ) ) ( not ( = ?auto_27786 ?auto_27807 ) ) ( not ( = ?auto_27787 ?auto_27807 ) ) ( not ( = ?auto_27794 ?auto_27825 ) ) ( IS-CRATE ?auto_27786 ) ( not ( = ?auto_27821 ?auto_27791 ) ) ( HOIST-AT ?auto_27799 ?auto_27821 ) ( AVAILABLE ?auto_27799 ) ( SURFACE-AT ?auto_27786 ?auto_27821 ) ( ON ?auto_27786 ?auto_27815 ) ( CLEAR ?auto_27786 ) ( not ( = ?auto_27785 ?auto_27786 ) ) ( not ( = ?auto_27785 ?auto_27815 ) ) ( not ( = ?auto_27786 ?auto_27815 ) ) ( not ( = ?auto_27794 ?auto_27799 ) ) ( IS-CRATE ?auto_27785 ) ( not ( = ?auto_27808 ?auto_27791 ) ) ( HOIST-AT ?auto_27804 ?auto_27808 ) ( AVAILABLE ?auto_27804 ) ( SURFACE-AT ?auto_27785 ?auto_27808 ) ( ON ?auto_27785 ?auto_27817 ) ( CLEAR ?auto_27785 ) ( not ( = ?auto_27784 ?auto_27785 ) ) ( not ( = ?auto_27784 ?auto_27817 ) ) ( not ( = ?auto_27785 ?auto_27817 ) ) ( not ( = ?auto_27794 ?auto_27804 ) ) ( IS-CRATE ?auto_27784 ) ( AVAILABLE ?auto_27825 ) ( SURFACE-AT ?auto_27784 ?auto_27828 ) ( ON ?auto_27784 ?auto_27816 ) ( CLEAR ?auto_27784 ) ( not ( = ?auto_27783 ?auto_27784 ) ) ( not ( = ?auto_27783 ?auto_27816 ) ) ( not ( = ?auto_27784 ?auto_27816 ) ) ( IS-CRATE ?auto_27783 ) ( not ( = ?auto_27798 ?auto_27791 ) ) ( HOIST-AT ?auto_27822 ?auto_27798 ) ( AVAILABLE ?auto_27822 ) ( SURFACE-AT ?auto_27783 ?auto_27798 ) ( ON ?auto_27783 ?auto_27814 ) ( CLEAR ?auto_27783 ) ( not ( = ?auto_27782 ?auto_27783 ) ) ( not ( = ?auto_27782 ?auto_27814 ) ) ( not ( = ?auto_27783 ?auto_27814 ) ) ( not ( = ?auto_27794 ?auto_27822 ) ) ( IS-CRATE ?auto_27782 ) ( SURFACE-AT ?auto_27782 ?auto_27790 ) ( ON ?auto_27782 ?auto_27796 ) ( CLEAR ?auto_27782 ) ( not ( = ?auto_27781 ?auto_27782 ) ) ( not ( = ?auto_27781 ?auto_27796 ) ) ( not ( = ?auto_27782 ?auto_27796 ) ) ( IS-CRATE ?auto_27781 ) ( not ( = ?auto_27820 ?auto_27791 ) ) ( HOIST-AT ?auto_27824 ?auto_27820 ) ( AVAILABLE ?auto_27824 ) ( SURFACE-AT ?auto_27781 ?auto_27820 ) ( ON ?auto_27781 ?auto_27819 ) ( CLEAR ?auto_27781 ) ( not ( = ?auto_27780 ?auto_27781 ) ) ( not ( = ?auto_27780 ?auto_27819 ) ) ( not ( = ?auto_27781 ?auto_27819 ) ) ( not ( = ?auto_27794 ?auto_27824 ) ) ( IS-CRATE ?auto_27780 ) ( not ( = ?auto_27827 ?auto_27791 ) ) ( HOIST-AT ?auto_27809 ?auto_27827 ) ( SURFACE-AT ?auto_27780 ?auto_27827 ) ( ON ?auto_27780 ?auto_27813 ) ( CLEAR ?auto_27780 ) ( not ( = ?auto_27779 ?auto_27780 ) ) ( not ( = ?auto_27779 ?auto_27813 ) ) ( not ( = ?auto_27780 ?auto_27813 ) ) ( not ( = ?auto_27794 ?auto_27809 ) ) ( IS-CRATE ?auto_27779 ) ( not ( = ?auto_27802 ?auto_27791 ) ) ( HOIST-AT ?auto_27803 ?auto_27802 ) ( AVAILABLE ?auto_27803 ) ( SURFACE-AT ?auto_27779 ?auto_27802 ) ( ON ?auto_27779 ?auto_27823 ) ( CLEAR ?auto_27779 ) ( not ( = ?auto_27778 ?auto_27779 ) ) ( not ( = ?auto_27778 ?auto_27823 ) ) ( not ( = ?auto_27779 ?auto_27823 ) ) ( not ( = ?auto_27794 ?auto_27803 ) ) ( IS-CRATE ?auto_27778 ) ( not ( = ?auto_27818 ?auto_27791 ) ) ( HOIST-AT ?auto_27801 ?auto_27818 ) ( AVAILABLE ?auto_27801 ) ( SURFACE-AT ?auto_27778 ?auto_27818 ) ( ON ?auto_27778 ?auto_27810 ) ( CLEAR ?auto_27778 ) ( not ( = ?auto_27777 ?auto_27778 ) ) ( not ( = ?auto_27777 ?auto_27810 ) ) ( not ( = ?auto_27778 ?auto_27810 ) ) ( not ( = ?auto_27794 ?auto_27801 ) ) ( IS-CRATE ?auto_27777 ) ( AVAILABLE ?auto_27789 ) ( SURFACE-AT ?auto_27777 ?auto_27790 ) ( ON ?auto_27777 ?auto_27806 ) ( CLEAR ?auto_27777 ) ( not ( = ?auto_27776 ?auto_27777 ) ) ( not ( = ?auto_27776 ?auto_27806 ) ) ( not ( = ?auto_27777 ?auto_27806 ) ) ( IS-CRATE ?auto_27776 ) ( not ( = ?auto_27797 ?auto_27791 ) ) ( HOIST-AT ?auto_27811 ?auto_27797 ) ( AVAILABLE ?auto_27811 ) ( SURFACE-AT ?auto_27776 ?auto_27797 ) ( ON ?auto_27776 ?auto_27800 ) ( CLEAR ?auto_27776 ) ( not ( = ?auto_27775 ?auto_27776 ) ) ( not ( = ?auto_27775 ?auto_27800 ) ) ( not ( = ?auto_27776 ?auto_27800 ) ) ( not ( = ?auto_27794 ?auto_27811 ) ) ( IS-CRATE ?auto_27775 ) ( not ( = ?auto_27812 ?auto_27791 ) ) ( HOIST-AT ?auto_27805 ?auto_27812 ) ( AVAILABLE ?auto_27805 ) ( SURFACE-AT ?auto_27775 ?auto_27812 ) ( ON ?auto_27775 ?auto_27795 ) ( CLEAR ?auto_27775 ) ( not ( = ?auto_27774 ?auto_27775 ) ) ( not ( = ?auto_27774 ?auto_27795 ) ) ( not ( = ?auto_27775 ?auto_27795 ) ) ( not ( = ?auto_27794 ?auto_27805 ) ) ( SURFACE-AT ?auto_27773 ?auto_27791 ) ( CLEAR ?auto_27773 ) ( IS-CRATE ?auto_27774 ) ( AVAILABLE ?auto_27794 ) ( AVAILABLE ?auto_27809 ) ( SURFACE-AT ?auto_27774 ?auto_27827 ) ( ON ?auto_27774 ?auto_27826 ) ( CLEAR ?auto_27774 ) ( TRUCK-AT ?auto_27792 ?auto_27791 ) ( not ( = ?auto_27773 ?auto_27774 ) ) ( not ( = ?auto_27773 ?auto_27826 ) ) ( not ( = ?auto_27774 ?auto_27826 ) ) ( not ( = ?auto_27773 ?auto_27775 ) ) ( not ( = ?auto_27773 ?auto_27795 ) ) ( not ( = ?auto_27775 ?auto_27826 ) ) ( not ( = ?auto_27812 ?auto_27827 ) ) ( not ( = ?auto_27805 ?auto_27809 ) ) ( not ( = ?auto_27795 ?auto_27826 ) ) ( not ( = ?auto_27773 ?auto_27776 ) ) ( not ( = ?auto_27773 ?auto_27800 ) ) ( not ( = ?auto_27774 ?auto_27776 ) ) ( not ( = ?auto_27774 ?auto_27800 ) ) ( not ( = ?auto_27776 ?auto_27795 ) ) ( not ( = ?auto_27776 ?auto_27826 ) ) ( not ( = ?auto_27797 ?auto_27812 ) ) ( not ( = ?auto_27797 ?auto_27827 ) ) ( not ( = ?auto_27811 ?auto_27805 ) ) ( not ( = ?auto_27811 ?auto_27809 ) ) ( not ( = ?auto_27800 ?auto_27795 ) ) ( not ( = ?auto_27800 ?auto_27826 ) ) ( not ( = ?auto_27773 ?auto_27777 ) ) ( not ( = ?auto_27773 ?auto_27806 ) ) ( not ( = ?auto_27774 ?auto_27777 ) ) ( not ( = ?auto_27774 ?auto_27806 ) ) ( not ( = ?auto_27775 ?auto_27777 ) ) ( not ( = ?auto_27775 ?auto_27806 ) ) ( not ( = ?auto_27777 ?auto_27800 ) ) ( not ( = ?auto_27777 ?auto_27795 ) ) ( not ( = ?auto_27777 ?auto_27826 ) ) ( not ( = ?auto_27790 ?auto_27797 ) ) ( not ( = ?auto_27790 ?auto_27812 ) ) ( not ( = ?auto_27790 ?auto_27827 ) ) ( not ( = ?auto_27789 ?auto_27811 ) ) ( not ( = ?auto_27789 ?auto_27805 ) ) ( not ( = ?auto_27789 ?auto_27809 ) ) ( not ( = ?auto_27806 ?auto_27800 ) ) ( not ( = ?auto_27806 ?auto_27795 ) ) ( not ( = ?auto_27806 ?auto_27826 ) ) ( not ( = ?auto_27773 ?auto_27778 ) ) ( not ( = ?auto_27773 ?auto_27810 ) ) ( not ( = ?auto_27774 ?auto_27778 ) ) ( not ( = ?auto_27774 ?auto_27810 ) ) ( not ( = ?auto_27775 ?auto_27778 ) ) ( not ( = ?auto_27775 ?auto_27810 ) ) ( not ( = ?auto_27776 ?auto_27778 ) ) ( not ( = ?auto_27776 ?auto_27810 ) ) ( not ( = ?auto_27778 ?auto_27806 ) ) ( not ( = ?auto_27778 ?auto_27800 ) ) ( not ( = ?auto_27778 ?auto_27795 ) ) ( not ( = ?auto_27778 ?auto_27826 ) ) ( not ( = ?auto_27818 ?auto_27790 ) ) ( not ( = ?auto_27818 ?auto_27797 ) ) ( not ( = ?auto_27818 ?auto_27812 ) ) ( not ( = ?auto_27818 ?auto_27827 ) ) ( not ( = ?auto_27801 ?auto_27789 ) ) ( not ( = ?auto_27801 ?auto_27811 ) ) ( not ( = ?auto_27801 ?auto_27805 ) ) ( not ( = ?auto_27801 ?auto_27809 ) ) ( not ( = ?auto_27810 ?auto_27806 ) ) ( not ( = ?auto_27810 ?auto_27800 ) ) ( not ( = ?auto_27810 ?auto_27795 ) ) ( not ( = ?auto_27810 ?auto_27826 ) ) ( not ( = ?auto_27773 ?auto_27779 ) ) ( not ( = ?auto_27773 ?auto_27823 ) ) ( not ( = ?auto_27774 ?auto_27779 ) ) ( not ( = ?auto_27774 ?auto_27823 ) ) ( not ( = ?auto_27775 ?auto_27779 ) ) ( not ( = ?auto_27775 ?auto_27823 ) ) ( not ( = ?auto_27776 ?auto_27779 ) ) ( not ( = ?auto_27776 ?auto_27823 ) ) ( not ( = ?auto_27777 ?auto_27779 ) ) ( not ( = ?auto_27777 ?auto_27823 ) ) ( not ( = ?auto_27779 ?auto_27810 ) ) ( not ( = ?auto_27779 ?auto_27806 ) ) ( not ( = ?auto_27779 ?auto_27800 ) ) ( not ( = ?auto_27779 ?auto_27795 ) ) ( not ( = ?auto_27779 ?auto_27826 ) ) ( not ( = ?auto_27802 ?auto_27818 ) ) ( not ( = ?auto_27802 ?auto_27790 ) ) ( not ( = ?auto_27802 ?auto_27797 ) ) ( not ( = ?auto_27802 ?auto_27812 ) ) ( not ( = ?auto_27802 ?auto_27827 ) ) ( not ( = ?auto_27803 ?auto_27801 ) ) ( not ( = ?auto_27803 ?auto_27789 ) ) ( not ( = ?auto_27803 ?auto_27811 ) ) ( not ( = ?auto_27803 ?auto_27805 ) ) ( not ( = ?auto_27803 ?auto_27809 ) ) ( not ( = ?auto_27823 ?auto_27810 ) ) ( not ( = ?auto_27823 ?auto_27806 ) ) ( not ( = ?auto_27823 ?auto_27800 ) ) ( not ( = ?auto_27823 ?auto_27795 ) ) ( not ( = ?auto_27823 ?auto_27826 ) ) ( not ( = ?auto_27773 ?auto_27780 ) ) ( not ( = ?auto_27773 ?auto_27813 ) ) ( not ( = ?auto_27774 ?auto_27780 ) ) ( not ( = ?auto_27774 ?auto_27813 ) ) ( not ( = ?auto_27775 ?auto_27780 ) ) ( not ( = ?auto_27775 ?auto_27813 ) ) ( not ( = ?auto_27776 ?auto_27780 ) ) ( not ( = ?auto_27776 ?auto_27813 ) ) ( not ( = ?auto_27777 ?auto_27780 ) ) ( not ( = ?auto_27777 ?auto_27813 ) ) ( not ( = ?auto_27778 ?auto_27780 ) ) ( not ( = ?auto_27778 ?auto_27813 ) ) ( not ( = ?auto_27780 ?auto_27823 ) ) ( not ( = ?auto_27780 ?auto_27810 ) ) ( not ( = ?auto_27780 ?auto_27806 ) ) ( not ( = ?auto_27780 ?auto_27800 ) ) ( not ( = ?auto_27780 ?auto_27795 ) ) ( not ( = ?auto_27780 ?auto_27826 ) ) ( not ( = ?auto_27813 ?auto_27823 ) ) ( not ( = ?auto_27813 ?auto_27810 ) ) ( not ( = ?auto_27813 ?auto_27806 ) ) ( not ( = ?auto_27813 ?auto_27800 ) ) ( not ( = ?auto_27813 ?auto_27795 ) ) ( not ( = ?auto_27813 ?auto_27826 ) ) ( not ( = ?auto_27773 ?auto_27781 ) ) ( not ( = ?auto_27773 ?auto_27819 ) ) ( not ( = ?auto_27774 ?auto_27781 ) ) ( not ( = ?auto_27774 ?auto_27819 ) ) ( not ( = ?auto_27775 ?auto_27781 ) ) ( not ( = ?auto_27775 ?auto_27819 ) ) ( not ( = ?auto_27776 ?auto_27781 ) ) ( not ( = ?auto_27776 ?auto_27819 ) ) ( not ( = ?auto_27777 ?auto_27781 ) ) ( not ( = ?auto_27777 ?auto_27819 ) ) ( not ( = ?auto_27778 ?auto_27781 ) ) ( not ( = ?auto_27778 ?auto_27819 ) ) ( not ( = ?auto_27779 ?auto_27781 ) ) ( not ( = ?auto_27779 ?auto_27819 ) ) ( not ( = ?auto_27781 ?auto_27813 ) ) ( not ( = ?auto_27781 ?auto_27823 ) ) ( not ( = ?auto_27781 ?auto_27810 ) ) ( not ( = ?auto_27781 ?auto_27806 ) ) ( not ( = ?auto_27781 ?auto_27800 ) ) ( not ( = ?auto_27781 ?auto_27795 ) ) ( not ( = ?auto_27781 ?auto_27826 ) ) ( not ( = ?auto_27820 ?auto_27827 ) ) ( not ( = ?auto_27820 ?auto_27802 ) ) ( not ( = ?auto_27820 ?auto_27818 ) ) ( not ( = ?auto_27820 ?auto_27790 ) ) ( not ( = ?auto_27820 ?auto_27797 ) ) ( not ( = ?auto_27820 ?auto_27812 ) ) ( not ( = ?auto_27824 ?auto_27809 ) ) ( not ( = ?auto_27824 ?auto_27803 ) ) ( not ( = ?auto_27824 ?auto_27801 ) ) ( not ( = ?auto_27824 ?auto_27789 ) ) ( not ( = ?auto_27824 ?auto_27811 ) ) ( not ( = ?auto_27824 ?auto_27805 ) ) ( not ( = ?auto_27819 ?auto_27813 ) ) ( not ( = ?auto_27819 ?auto_27823 ) ) ( not ( = ?auto_27819 ?auto_27810 ) ) ( not ( = ?auto_27819 ?auto_27806 ) ) ( not ( = ?auto_27819 ?auto_27800 ) ) ( not ( = ?auto_27819 ?auto_27795 ) ) ( not ( = ?auto_27819 ?auto_27826 ) ) ( not ( = ?auto_27773 ?auto_27782 ) ) ( not ( = ?auto_27773 ?auto_27796 ) ) ( not ( = ?auto_27774 ?auto_27782 ) ) ( not ( = ?auto_27774 ?auto_27796 ) ) ( not ( = ?auto_27775 ?auto_27782 ) ) ( not ( = ?auto_27775 ?auto_27796 ) ) ( not ( = ?auto_27776 ?auto_27782 ) ) ( not ( = ?auto_27776 ?auto_27796 ) ) ( not ( = ?auto_27777 ?auto_27782 ) ) ( not ( = ?auto_27777 ?auto_27796 ) ) ( not ( = ?auto_27778 ?auto_27782 ) ) ( not ( = ?auto_27778 ?auto_27796 ) ) ( not ( = ?auto_27779 ?auto_27782 ) ) ( not ( = ?auto_27779 ?auto_27796 ) ) ( not ( = ?auto_27780 ?auto_27782 ) ) ( not ( = ?auto_27780 ?auto_27796 ) ) ( not ( = ?auto_27782 ?auto_27819 ) ) ( not ( = ?auto_27782 ?auto_27813 ) ) ( not ( = ?auto_27782 ?auto_27823 ) ) ( not ( = ?auto_27782 ?auto_27810 ) ) ( not ( = ?auto_27782 ?auto_27806 ) ) ( not ( = ?auto_27782 ?auto_27800 ) ) ( not ( = ?auto_27782 ?auto_27795 ) ) ( not ( = ?auto_27782 ?auto_27826 ) ) ( not ( = ?auto_27796 ?auto_27819 ) ) ( not ( = ?auto_27796 ?auto_27813 ) ) ( not ( = ?auto_27796 ?auto_27823 ) ) ( not ( = ?auto_27796 ?auto_27810 ) ) ( not ( = ?auto_27796 ?auto_27806 ) ) ( not ( = ?auto_27796 ?auto_27800 ) ) ( not ( = ?auto_27796 ?auto_27795 ) ) ( not ( = ?auto_27796 ?auto_27826 ) ) ( not ( = ?auto_27773 ?auto_27783 ) ) ( not ( = ?auto_27773 ?auto_27814 ) ) ( not ( = ?auto_27774 ?auto_27783 ) ) ( not ( = ?auto_27774 ?auto_27814 ) ) ( not ( = ?auto_27775 ?auto_27783 ) ) ( not ( = ?auto_27775 ?auto_27814 ) ) ( not ( = ?auto_27776 ?auto_27783 ) ) ( not ( = ?auto_27776 ?auto_27814 ) ) ( not ( = ?auto_27777 ?auto_27783 ) ) ( not ( = ?auto_27777 ?auto_27814 ) ) ( not ( = ?auto_27778 ?auto_27783 ) ) ( not ( = ?auto_27778 ?auto_27814 ) ) ( not ( = ?auto_27779 ?auto_27783 ) ) ( not ( = ?auto_27779 ?auto_27814 ) ) ( not ( = ?auto_27780 ?auto_27783 ) ) ( not ( = ?auto_27780 ?auto_27814 ) ) ( not ( = ?auto_27781 ?auto_27783 ) ) ( not ( = ?auto_27781 ?auto_27814 ) ) ( not ( = ?auto_27783 ?auto_27796 ) ) ( not ( = ?auto_27783 ?auto_27819 ) ) ( not ( = ?auto_27783 ?auto_27813 ) ) ( not ( = ?auto_27783 ?auto_27823 ) ) ( not ( = ?auto_27783 ?auto_27810 ) ) ( not ( = ?auto_27783 ?auto_27806 ) ) ( not ( = ?auto_27783 ?auto_27800 ) ) ( not ( = ?auto_27783 ?auto_27795 ) ) ( not ( = ?auto_27783 ?auto_27826 ) ) ( not ( = ?auto_27798 ?auto_27790 ) ) ( not ( = ?auto_27798 ?auto_27820 ) ) ( not ( = ?auto_27798 ?auto_27827 ) ) ( not ( = ?auto_27798 ?auto_27802 ) ) ( not ( = ?auto_27798 ?auto_27818 ) ) ( not ( = ?auto_27798 ?auto_27797 ) ) ( not ( = ?auto_27798 ?auto_27812 ) ) ( not ( = ?auto_27822 ?auto_27789 ) ) ( not ( = ?auto_27822 ?auto_27824 ) ) ( not ( = ?auto_27822 ?auto_27809 ) ) ( not ( = ?auto_27822 ?auto_27803 ) ) ( not ( = ?auto_27822 ?auto_27801 ) ) ( not ( = ?auto_27822 ?auto_27811 ) ) ( not ( = ?auto_27822 ?auto_27805 ) ) ( not ( = ?auto_27814 ?auto_27796 ) ) ( not ( = ?auto_27814 ?auto_27819 ) ) ( not ( = ?auto_27814 ?auto_27813 ) ) ( not ( = ?auto_27814 ?auto_27823 ) ) ( not ( = ?auto_27814 ?auto_27810 ) ) ( not ( = ?auto_27814 ?auto_27806 ) ) ( not ( = ?auto_27814 ?auto_27800 ) ) ( not ( = ?auto_27814 ?auto_27795 ) ) ( not ( = ?auto_27814 ?auto_27826 ) ) ( not ( = ?auto_27773 ?auto_27784 ) ) ( not ( = ?auto_27773 ?auto_27816 ) ) ( not ( = ?auto_27774 ?auto_27784 ) ) ( not ( = ?auto_27774 ?auto_27816 ) ) ( not ( = ?auto_27775 ?auto_27784 ) ) ( not ( = ?auto_27775 ?auto_27816 ) ) ( not ( = ?auto_27776 ?auto_27784 ) ) ( not ( = ?auto_27776 ?auto_27816 ) ) ( not ( = ?auto_27777 ?auto_27784 ) ) ( not ( = ?auto_27777 ?auto_27816 ) ) ( not ( = ?auto_27778 ?auto_27784 ) ) ( not ( = ?auto_27778 ?auto_27816 ) ) ( not ( = ?auto_27779 ?auto_27784 ) ) ( not ( = ?auto_27779 ?auto_27816 ) ) ( not ( = ?auto_27780 ?auto_27784 ) ) ( not ( = ?auto_27780 ?auto_27816 ) ) ( not ( = ?auto_27781 ?auto_27784 ) ) ( not ( = ?auto_27781 ?auto_27816 ) ) ( not ( = ?auto_27782 ?auto_27784 ) ) ( not ( = ?auto_27782 ?auto_27816 ) ) ( not ( = ?auto_27784 ?auto_27814 ) ) ( not ( = ?auto_27784 ?auto_27796 ) ) ( not ( = ?auto_27784 ?auto_27819 ) ) ( not ( = ?auto_27784 ?auto_27813 ) ) ( not ( = ?auto_27784 ?auto_27823 ) ) ( not ( = ?auto_27784 ?auto_27810 ) ) ( not ( = ?auto_27784 ?auto_27806 ) ) ( not ( = ?auto_27784 ?auto_27800 ) ) ( not ( = ?auto_27784 ?auto_27795 ) ) ( not ( = ?auto_27784 ?auto_27826 ) ) ( not ( = ?auto_27828 ?auto_27798 ) ) ( not ( = ?auto_27828 ?auto_27790 ) ) ( not ( = ?auto_27828 ?auto_27820 ) ) ( not ( = ?auto_27828 ?auto_27827 ) ) ( not ( = ?auto_27828 ?auto_27802 ) ) ( not ( = ?auto_27828 ?auto_27818 ) ) ( not ( = ?auto_27828 ?auto_27797 ) ) ( not ( = ?auto_27828 ?auto_27812 ) ) ( not ( = ?auto_27825 ?auto_27822 ) ) ( not ( = ?auto_27825 ?auto_27789 ) ) ( not ( = ?auto_27825 ?auto_27824 ) ) ( not ( = ?auto_27825 ?auto_27809 ) ) ( not ( = ?auto_27825 ?auto_27803 ) ) ( not ( = ?auto_27825 ?auto_27801 ) ) ( not ( = ?auto_27825 ?auto_27811 ) ) ( not ( = ?auto_27825 ?auto_27805 ) ) ( not ( = ?auto_27816 ?auto_27814 ) ) ( not ( = ?auto_27816 ?auto_27796 ) ) ( not ( = ?auto_27816 ?auto_27819 ) ) ( not ( = ?auto_27816 ?auto_27813 ) ) ( not ( = ?auto_27816 ?auto_27823 ) ) ( not ( = ?auto_27816 ?auto_27810 ) ) ( not ( = ?auto_27816 ?auto_27806 ) ) ( not ( = ?auto_27816 ?auto_27800 ) ) ( not ( = ?auto_27816 ?auto_27795 ) ) ( not ( = ?auto_27816 ?auto_27826 ) ) ( not ( = ?auto_27773 ?auto_27785 ) ) ( not ( = ?auto_27773 ?auto_27817 ) ) ( not ( = ?auto_27774 ?auto_27785 ) ) ( not ( = ?auto_27774 ?auto_27817 ) ) ( not ( = ?auto_27775 ?auto_27785 ) ) ( not ( = ?auto_27775 ?auto_27817 ) ) ( not ( = ?auto_27776 ?auto_27785 ) ) ( not ( = ?auto_27776 ?auto_27817 ) ) ( not ( = ?auto_27777 ?auto_27785 ) ) ( not ( = ?auto_27777 ?auto_27817 ) ) ( not ( = ?auto_27778 ?auto_27785 ) ) ( not ( = ?auto_27778 ?auto_27817 ) ) ( not ( = ?auto_27779 ?auto_27785 ) ) ( not ( = ?auto_27779 ?auto_27817 ) ) ( not ( = ?auto_27780 ?auto_27785 ) ) ( not ( = ?auto_27780 ?auto_27817 ) ) ( not ( = ?auto_27781 ?auto_27785 ) ) ( not ( = ?auto_27781 ?auto_27817 ) ) ( not ( = ?auto_27782 ?auto_27785 ) ) ( not ( = ?auto_27782 ?auto_27817 ) ) ( not ( = ?auto_27783 ?auto_27785 ) ) ( not ( = ?auto_27783 ?auto_27817 ) ) ( not ( = ?auto_27785 ?auto_27816 ) ) ( not ( = ?auto_27785 ?auto_27814 ) ) ( not ( = ?auto_27785 ?auto_27796 ) ) ( not ( = ?auto_27785 ?auto_27819 ) ) ( not ( = ?auto_27785 ?auto_27813 ) ) ( not ( = ?auto_27785 ?auto_27823 ) ) ( not ( = ?auto_27785 ?auto_27810 ) ) ( not ( = ?auto_27785 ?auto_27806 ) ) ( not ( = ?auto_27785 ?auto_27800 ) ) ( not ( = ?auto_27785 ?auto_27795 ) ) ( not ( = ?auto_27785 ?auto_27826 ) ) ( not ( = ?auto_27808 ?auto_27828 ) ) ( not ( = ?auto_27808 ?auto_27798 ) ) ( not ( = ?auto_27808 ?auto_27790 ) ) ( not ( = ?auto_27808 ?auto_27820 ) ) ( not ( = ?auto_27808 ?auto_27827 ) ) ( not ( = ?auto_27808 ?auto_27802 ) ) ( not ( = ?auto_27808 ?auto_27818 ) ) ( not ( = ?auto_27808 ?auto_27797 ) ) ( not ( = ?auto_27808 ?auto_27812 ) ) ( not ( = ?auto_27804 ?auto_27825 ) ) ( not ( = ?auto_27804 ?auto_27822 ) ) ( not ( = ?auto_27804 ?auto_27789 ) ) ( not ( = ?auto_27804 ?auto_27824 ) ) ( not ( = ?auto_27804 ?auto_27809 ) ) ( not ( = ?auto_27804 ?auto_27803 ) ) ( not ( = ?auto_27804 ?auto_27801 ) ) ( not ( = ?auto_27804 ?auto_27811 ) ) ( not ( = ?auto_27804 ?auto_27805 ) ) ( not ( = ?auto_27817 ?auto_27816 ) ) ( not ( = ?auto_27817 ?auto_27814 ) ) ( not ( = ?auto_27817 ?auto_27796 ) ) ( not ( = ?auto_27817 ?auto_27819 ) ) ( not ( = ?auto_27817 ?auto_27813 ) ) ( not ( = ?auto_27817 ?auto_27823 ) ) ( not ( = ?auto_27817 ?auto_27810 ) ) ( not ( = ?auto_27817 ?auto_27806 ) ) ( not ( = ?auto_27817 ?auto_27800 ) ) ( not ( = ?auto_27817 ?auto_27795 ) ) ( not ( = ?auto_27817 ?auto_27826 ) ) ( not ( = ?auto_27773 ?auto_27786 ) ) ( not ( = ?auto_27773 ?auto_27815 ) ) ( not ( = ?auto_27774 ?auto_27786 ) ) ( not ( = ?auto_27774 ?auto_27815 ) ) ( not ( = ?auto_27775 ?auto_27786 ) ) ( not ( = ?auto_27775 ?auto_27815 ) ) ( not ( = ?auto_27776 ?auto_27786 ) ) ( not ( = ?auto_27776 ?auto_27815 ) ) ( not ( = ?auto_27777 ?auto_27786 ) ) ( not ( = ?auto_27777 ?auto_27815 ) ) ( not ( = ?auto_27778 ?auto_27786 ) ) ( not ( = ?auto_27778 ?auto_27815 ) ) ( not ( = ?auto_27779 ?auto_27786 ) ) ( not ( = ?auto_27779 ?auto_27815 ) ) ( not ( = ?auto_27780 ?auto_27786 ) ) ( not ( = ?auto_27780 ?auto_27815 ) ) ( not ( = ?auto_27781 ?auto_27786 ) ) ( not ( = ?auto_27781 ?auto_27815 ) ) ( not ( = ?auto_27782 ?auto_27786 ) ) ( not ( = ?auto_27782 ?auto_27815 ) ) ( not ( = ?auto_27783 ?auto_27786 ) ) ( not ( = ?auto_27783 ?auto_27815 ) ) ( not ( = ?auto_27784 ?auto_27786 ) ) ( not ( = ?auto_27784 ?auto_27815 ) ) ( not ( = ?auto_27786 ?auto_27817 ) ) ( not ( = ?auto_27786 ?auto_27816 ) ) ( not ( = ?auto_27786 ?auto_27814 ) ) ( not ( = ?auto_27786 ?auto_27796 ) ) ( not ( = ?auto_27786 ?auto_27819 ) ) ( not ( = ?auto_27786 ?auto_27813 ) ) ( not ( = ?auto_27786 ?auto_27823 ) ) ( not ( = ?auto_27786 ?auto_27810 ) ) ( not ( = ?auto_27786 ?auto_27806 ) ) ( not ( = ?auto_27786 ?auto_27800 ) ) ( not ( = ?auto_27786 ?auto_27795 ) ) ( not ( = ?auto_27786 ?auto_27826 ) ) ( not ( = ?auto_27821 ?auto_27808 ) ) ( not ( = ?auto_27821 ?auto_27828 ) ) ( not ( = ?auto_27821 ?auto_27798 ) ) ( not ( = ?auto_27821 ?auto_27790 ) ) ( not ( = ?auto_27821 ?auto_27820 ) ) ( not ( = ?auto_27821 ?auto_27827 ) ) ( not ( = ?auto_27821 ?auto_27802 ) ) ( not ( = ?auto_27821 ?auto_27818 ) ) ( not ( = ?auto_27821 ?auto_27797 ) ) ( not ( = ?auto_27821 ?auto_27812 ) ) ( not ( = ?auto_27799 ?auto_27804 ) ) ( not ( = ?auto_27799 ?auto_27825 ) ) ( not ( = ?auto_27799 ?auto_27822 ) ) ( not ( = ?auto_27799 ?auto_27789 ) ) ( not ( = ?auto_27799 ?auto_27824 ) ) ( not ( = ?auto_27799 ?auto_27809 ) ) ( not ( = ?auto_27799 ?auto_27803 ) ) ( not ( = ?auto_27799 ?auto_27801 ) ) ( not ( = ?auto_27799 ?auto_27811 ) ) ( not ( = ?auto_27799 ?auto_27805 ) ) ( not ( = ?auto_27815 ?auto_27817 ) ) ( not ( = ?auto_27815 ?auto_27816 ) ) ( not ( = ?auto_27815 ?auto_27814 ) ) ( not ( = ?auto_27815 ?auto_27796 ) ) ( not ( = ?auto_27815 ?auto_27819 ) ) ( not ( = ?auto_27815 ?auto_27813 ) ) ( not ( = ?auto_27815 ?auto_27823 ) ) ( not ( = ?auto_27815 ?auto_27810 ) ) ( not ( = ?auto_27815 ?auto_27806 ) ) ( not ( = ?auto_27815 ?auto_27800 ) ) ( not ( = ?auto_27815 ?auto_27795 ) ) ( not ( = ?auto_27815 ?auto_27826 ) ) ( not ( = ?auto_27773 ?auto_27787 ) ) ( not ( = ?auto_27773 ?auto_27807 ) ) ( not ( = ?auto_27774 ?auto_27787 ) ) ( not ( = ?auto_27774 ?auto_27807 ) ) ( not ( = ?auto_27775 ?auto_27787 ) ) ( not ( = ?auto_27775 ?auto_27807 ) ) ( not ( = ?auto_27776 ?auto_27787 ) ) ( not ( = ?auto_27776 ?auto_27807 ) ) ( not ( = ?auto_27777 ?auto_27787 ) ) ( not ( = ?auto_27777 ?auto_27807 ) ) ( not ( = ?auto_27778 ?auto_27787 ) ) ( not ( = ?auto_27778 ?auto_27807 ) ) ( not ( = ?auto_27779 ?auto_27787 ) ) ( not ( = ?auto_27779 ?auto_27807 ) ) ( not ( = ?auto_27780 ?auto_27787 ) ) ( not ( = ?auto_27780 ?auto_27807 ) ) ( not ( = ?auto_27781 ?auto_27787 ) ) ( not ( = ?auto_27781 ?auto_27807 ) ) ( not ( = ?auto_27782 ?auto_27787 ) ) ( not ( = ?auto_27782 ?auto_27807 ) ) ( not ( = ?auto_27783 ?auto_27787 ) ) ( not ( = ?auto_27783 ?auto_27807 ) ) ( not ( = ?auto_27784 ?auto_27787 ) ) ( not ( = ?auto_27784 ?auto_27807 ) ) ( not ( = ?auto_27785 ?auto_27787 ) ) ( not ( = ?auto_27785 ?auto_27807 ) ) ( not ( = ?auto_27787 ?auto_27815 ) ) ( not ( = ?auto_27787 ?auto_27817 ) ) ( not ( = ?auto_27787 ?auto_27816 ) ) ( not ( = ?auto_27787 ?auto_27814 ) ) ( not ( = ?auto_27787 ?auto_27796 ) ) ( not ( = ?auto_27787 ?auto_27819 ) ) ( not ( = ?auto_27787 ?auto_27813 ) ) ( not ( = ?auto_27787 ?auto_27823 ) ) ( not ( = ?auto_27787 ?auto_27810 ) ) ( not ( = ?auto_27787 ?auto_27806 ) ) ( not ( = ?auto_27787 ?auto_27800 ) ) ( not ( = ?auto_27787 ?auto_27795 ) ) ( not ( = ?auto_27787 ?auto_27826 ) ) ( not ( = ?auto_27807 ?auto_27815 ) ) ( not ( = ?auto_27807 ?auto_27817 ) ) ( not ( = ?auto_27807 ?auto_27816 ) ) ( not ( = ?auto_27807 ?auto_27814 ) ) ( not ( = ?auto_27807 ?auto_27796 ) ) ( not ( = ?auto_27807 ?auto_27819 ) ) ( not ( = ?auto_27807 ?auto_27813 ) ) ( not ( = ?auto_27807 ?auto_27823 ) ) ( not ( = ?auto_27807 ?auto_27810 ) ) ( not ( = ?auto_27807 ?auto_27806 ) ) ( not ( = ?auto_27807 ?auto_27800 ) ) ( not ( = ?auto_27807 ?auto_27795 ) ) ( not ( = ?auto_27807 ?auto_27826 ) ) ( not ( = ?auto_27773 ?auto_27788 ) ) ( not ( = ?auto_27773 ?auto_27793 ) ) ( not ( = ?auto_27774 ?auto_27788 ) ) ( not ( = ?auto_27774 ?auto_27793 ) ) ( not ( = ?auto_27775 ?auto_27788 ) ) ( not ( = ?auto_27775 ?auto_27793 ) ) ( not ( = ?auto_27776 ?auto_27788 ) ) ( not ( = ?auto_27776 ?auto_27793 ) ) ( not ( = ?auto_27777 ?auto_27788 ) ) ( not ( = ?auto_27777 ?auto_27793 ) ) ( not ( = ?auto_27778 ?auto_27788 ) ) ( not ( = ?auto_27778 ?auto_27793 ) ) ( not ( = ?auto_27779 ?auto_27788 ) ) ( not ( = ?auto_27779 ?auto_27793 ) ) ( not ( = ?auto_27780 ?auto_27788 ) ) ( not ( = ?auto_27780 ?auto_27793 ) ) ( not ( = ?auto_27781 ?auto_27788 ) ) ( not ( = ?auto_27781 ?auto_27793 ) ) ( not ( = ?auto_27782 ?auto_27788 ) ) ( not ( = ?auto_27782 ?auto_27793 ) ) ( not ( = ?auto_27783 ?auto_27788 ) ) ( not ( = ?auto_27783 ?auto_27793 ) ) ( not ( = ?auto_27784 ?auto_27788 ) ) ( not ( = ?auto_27784 ?auto_27793 ) ) ( not ( = ?auto_27785 ?auto_27788 ) ) ( not ( = ?auto_27785 ?auto_27793 ) ) ( not ( = ?auto_27786 ?auto_27788 ) ) ( not ( = ?auto_27786 ?auto_27793 ) ) ( not ( = ?auto_27788 ?auto_27807 ) ) ( not ( = ?auto_27788 ?auto_27815 ) ) ( not ( = ?auto_27788 ?auto_27817 ) ) ( not ( = ?auto_27788 ?auto_27816 ) ) ( not ( = ?auto_27788 ?auto_27814 ) ) ( not ( = ?auto_27788 ?auto_27796 ) ) ( not ( = ?auto_27788 ?auto_27819 ) ) ( not ( = ?auto_27788 ?auto_27813 ) ) ( not ( = ?auto_27788 ?auto_27823 ) ) ( not ( = ?auto_27788 ?auto_27810 ) ) ( not ( = ?auto_27788 ?auto_27806 ) ) ( not ( = ?auto_27788 ?auto_27800 ) ) ( not ( = ?auto_27788 ?auto_27795 ) ) ( not ( = ?auto_27788 ?auto_27826 ) ) ( not ( = ?auto_27793 ?auto_27807 ) ) ( not ( = ?auto_27793 ?auto_27815 ) ) ( not ( = ?auto_27793 ?auto_27817 ) ) ( not ( = ?auto_27793 ?auto_27816 ) ) ( not ( = ?auto_27793 ?auto_27814 ) ) ( not ( = ?auto_27793 ?auto_27796 ) ) ( not ( = ?auto_27793 ?auto_27819 ) ) ( not ( = ?auto_27793 ?auto_27813 ) ) ( not ( = ?auto_27793 ?auto_27823 ) ) ( not ( = ?auto_27793 ?auto_27810 ) ) ( not ( = ?auto_27793 ?auto_27806 ) ) ( not ( = ?auto_27793 ?auto_27800 ) ) ( not ( = ?auto_27793 ?auto_27795 ) ) ( not ( = ?auto_27793 ?auto_27826 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_27773 ?auto_27774 ?auto_27775 ?auto_27776 ?auto_27777 ?auto_27778 ?auto_27779 ?auto_27780 ?auto_27781 ?auto_27782 ?auto_27783 ?auto_27784 ?auto_27785 ?auto_27786 ?auto_27787 )
      ( MAKE-1CRATE ?auto_27787 ?auto_27788 )
      ( MAKE-15CRATE-VERIFY ?auto_27773 ?auto_27774 ?auto_27775 ?auto_27776 ?auto_27777 ?auto_27778 ?auto_27779 ?auto_27780 ?auto_27781 ?auto_27782 ?auto_27783 ?auto_27784 ?auto_27785 ?auto_27786 ?auto_27787 ?auto_27788 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_27856 - SURFACE
      ?auto_27857 - SURFACE
      ?auto_27858 - SURFACE
      ?auto_27859 - SURFACE
      ?auto_27860 - SURFACE
      ?auto_27861 - SURFACE
      ?auto_27862 - SURFACE
      ?auto_27863 - SURFACE
      ?auto_27864 - SURFACE
      ?auto_27865 - SURFACE
      ?auto_27866 - SURFACE
      ?auto_27867 - SURFACE
      ?auto_27868 - SURFACE
      ?auto_27869 - SURFACE
      ?auto_27870 - SURFACE
      ?auto_27871 - SURFACE
      ?auto_27872 - SURFACE
    )
    :vars
    (
      ?auto_27873 - HOIST
      ?auto_27876 - PLACE
      ?auto_27874 - PLACE
      ?auto_27875 - HOIST
      ?auto_27877 - SURFACE
      ?auto_27906 - PLACE
      ?auto_27892 - HOIST
      ?auto_27882 - SURFACE
      ?auto_27893 - PLACE
      ?auto_27884 - HOIST
      ?auto_27903 - SURFACE
      ?auto_27907 - PLACE
      ?auto_27886 - HOIST
      ?auto_27909 - SURFACE
      ?auto_27898 - SURFACE
      ?auto_27885 - SURFACE
      ?auto_27888 - PLACE
      ?auto_27883 - HOIST
      ?auto_27881 - SURFACE
      ?auto_27896 - SURFACE
      ?auto_27904 - PLACE
      ?auto_27908 - HOIST
      ?auto_27889 - SURFACE
      ?auto_27890 - PLACE
      ?auto_27880 - HOIST
      ?auto_27899 - SURFACE
      ?auto_27912 - PLACE
      ?auto_27895 - HOIST
      ?auto_27902 - SURFACE
      ?auto_27887 - PLACE
      ?auto_27910 - HOIST
      ?auto_27905 - SURFACE
      ?auto_27901 - SURFACE
      ?auto_27897 - PLACE
      ?auto_27911 - HOIST
      ?auto_27894 - SURFACE
      ?auto_27879 - PLACE
      ?auto_27913 - HOIST
      ?auto_27891 - SURFACE
      ?auto_27900 - SURFACE
      ?auto_27878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27873 ?auto_27876 ) ( IS-CRATE ?auto_27872 ) ( not ( = ?auto_27874 ?auto_27876 ) ) ( HOIST-AT ?auto_27875 ?auto_27874 ) ( SURFACE-AT ?auto_27872 ?auto_27874 ) ( ON ?auto_27872 ?auto_27877 ) ( CLEAR ?auto_27872 ) ( not ( = ?auto_27871 ?auto_27872 ) ) ( not ( = ?auto_27871 ?auto_27877 ) ) ( not ( = ?auto_27872 ?auto_27877 ) ) ( not ( = ?auto_27873 ?auto_27875 ) ) ( IS-CRATE ?auto_27871 ) ( not ( = ?auto_27906 ?auto_27876 ) ) ( HOIST-AT ?auto_27892 ?auto_27906 ) ( SURFACE-AT ?auto_27871 ?auto_27906 ) ( ON ?auto_27871 ?auto_27882 ) ( CLEAR ?auto_27871 ) ( not ( = ?auto_27870 ?auto_27871 ) ) ( not ( = ?auto_27870 ?auto_27882 ) ) ( not ( = ?auto_27871 ?auto_27882 ) ) ( not ( = ?auto_27873 ?auto_27892 ) ) ( IS-CRATE ?auto_27870 ) ( not ( = ?auto_27893 ?auto_27876 ) ) ( HOIST-AT ?auto_27884 ?auto_27893 ) ( SURFACE-AT ?auto_27870 ?auto_27893 ) ( ON ?auto_27870 ?auto_27903 ) ( CLEAR ?auto_27870 ) ( not ( = ?auto_27869 ?auto_27870 ) ) ( not ( = ?auto_27869 ?auto_27903 ) ) ( not ( = ?auto_27870 ?auto_27903 ) ) ( not ( = ?auto_27873 ?auto_27884 ) ) ( IS-CRATE ?auto_27869 ) ( not ( = ?auto_27907 ?auto_27876 ) ) ( HOIST-AT ?auto_27886 ?auto_27907 ) ( AVAILABLE ?auto_27886 ) ( SURFACE-AT ?auto_27869 ?auto_27907 ) ( ON ?auto_27869 ?auto_27909 ) ( CLEAR ?auto_27869 ) ( not ( = ?auto_27868 ?auto_27869 ) ) ( not ( = ?auto_27868 ?auto_27909 ) ) ( not ( = ?auto_27869 ?auto_27909 ) ) ( not ( = ?auto_27873 ?auto_27886 ) ) ( IS-CRATE ?auto_27868 ) ( AVAILABLE ?auto_27875 ) ( SURFACE-AT ?auto_27868 ?auto_27874 ) ( ON ?auto_27868 ?auto_27898 ) ( CLEAR ?auto_27868 ) ( not ( = ?auto_27867 ?auto_27868 ) ) ( not ( = ?auto_27867 ?auto_27898 ) ) ( not ( = ?auto_27868 ?auto_27898 ) ) ( IS-CRATE ?auto_27867 ) ( AVAILABLE ?auto_27884 ) ( SURFACE-AT ?auto_27867 ?auto_27893 ) ( ON ?auto_27867 ?auto_27885 ) ( CLEAR ?auto_27867 ) ( not ( = ?auto_27866 ?auto_27867 ) ) ( not ( = ?auto_27866 ?auto_27885 ) ) ( not ( = ?auto_27867 ?auto_27885 ) ) ( IS-CRATE ?auto_27866 ) ( not ( = ?auto_27888 ?auto_27876 ) ) ( HOIST-AT ?auto_27883 ?auto_27888 ) ( AVAILABLE ?auto_27883 ) ( SURFACE-AT ?auto_27866 ?auto_27888 ) ( ON ?auto_27866 ?auto_27881 ) ( CLEAR ?auto_27866 ) ( not ( = ?auto_27865 ?auto_27866 ) ) ( not ( = ?auto_27865 ?auto_27881 ) ) ( not ( = ?auto_27866 ?auto_27881 ) ) ( not ( = ?auto_27873 ?auto_27883 ) ) ( IS-CRATE ?auto_27865 ) ( SURFACE-AT ?auto_27865 ?auto_27906 ) ( ON ?auto_27865 ?auto_27896 ) ( CLEAR ?auto_27865 ) ( not ( = ?auto_27864 ?auto_27865 ) ) ( not ( = ?auto_27864 ?auto_27896 ) ) ( not ( = ?auto_27865 ?auto_27896 ) ) ( IS-CRATE ?auto_27864 ) ( not ( = ?auto_27904 ?auto_27876 ) ) ( HOIST-AT ?auto_27908 ?auto_27904 ) ( AVAILABLE ?auto_27908 ) ( SURFACE-AT ?auto_27864 ?auto_27904 ) ( ON ?auto_27864 ?auto_27889 ) ( CLEAR ?auto_27864 ) ( not ( = ?auto_27863 ?auto_27864 ) ) ( not ( = ?auto_27863 ?auto_27889 ) ) ( not ( = ?auto_27864 ?auto_27889 ) ) ( not ( = ?auto_27873 ?auto_27908 ) ) ( IS-CRATE ?auto_27863 ) ( not ( = ?auto_27890 ?auto_27876 ) ) ( HOIST-AT ?auto_27880 ?auto_27890 ) ( SURFACE-AT ?auto_27863 ?auto_27890 ) ( ON ?auto_27863 ?auto_27899 ) ( CLEAR ?auto_27863 ) ( not ( = ?auto_27862 ?auto_27863 ) ) ( not ( = ?auto_27862 ?auto_27899 ) ) ( not ( = ?auto_27863 ?auto_27899 ) ) ( not ( = ?auto_27873 ?auto_27880 ) ) ( IS-CRATE ?auto_27862 ) ( not ( = ?auto_27912 ?auto_27876 ) ) ( HOIST-AT ?auto_27895 ?auto_27912 ) ( AVAILABLE ?auto_27895 ) ( SURFACE-AT ?auto_27862 ?auto_27912 ) ( ON ?auto_27862 ?auto_27902 ) ( CLEAR ?auto_27862 ) ( not ( = ?auto_27861 ?auto_27862 ) ) ( not ( = ?auto_27861 ?auto_27902 ) ) ( not ( = ?auto_27862 ?auto_27902 ) ) ( not ( = ?auto_27873 ?auto_27895 ) ) ( IS-CRATE ?auto_27861 ) ( not ( = ?auto_27887 ?auto_27876 ) ) ( HOIST-AT ?auto_27910 ?auto_27887 ) ( AVAILABLE ?auto_27910 ) ( SURFACE-AT ?auto_27861 ?auto_27887 ) ( ON ?auto_27861 ?auto_27905 ) ( CLEAR ?auto_27861 ) ( not ( = ?auto_27860 ?auto_27861 ) ) ( not ( = ?auto_27860 ?auto_27905 ) ) ( not ( = ?auto_27861 ?auto_27905 ) ) ( not ( = ?auto_27873 ?auto_27910 ) ) ( IS-CRATE ?auto_27860 ) ( AVAILABLE ?auto_27892 ) ( SURFACE-AT ?auto_27860 ?auto_27906 ) ( ON ?auto_27860 ?auto_27901 ) ( CLEAR ?auto_27860 ) ( not ( = ?auto_27859 ?auto_27860 ) ) ( not ( = ?auto_27859 ?auto_27901 ) ) ( not ( = ?auto_27860 ?auto_27901 ) ) ( IS-CRATE ?auto_27859 ) ( not ( = ?auto_27897 ?auto_27876 ) ) ( HOIST-AT ?auto_27911 ?auto_27897 ) ( AVAILABLE ?auto_27911 ) ( SURFACE-AT ?auto_27859 ?auto_27897 ) ( ON ?auto_27859 ?auto_27894 ) ( CLEAR ?auto_27859 ) ( not ( = ?auto_27858 ?auto_27859 ) ) ( not ( = ?auto_27858 ?auto_27894 ) ) ( not ( = ?auto_27859 ?auto_27894 ) ) ( not ( = ?auto_27873 ?auto_27911 ) ) ( IS-CRATE ?auto_27858 ) ( not ( = ?auto_27879 ?auto_27876 ) ) ( HOIST-AT ?auto_27913 ?auto_27879 ) ( AVAILABLE ?auto_27913 ) ( SURFACE-AT ?auto_27858 ?auto_27879 ) ( ON ?auto_27858 ?auto_27891 ) ( CLEAR ?auto_27858 ) ( not ( = ?auto_27857 ?auto_27858 ) ) ( not ( = ?auto_27857 ?auto_27891 ) ) ( not ( = ?auto_27858 ?auto_27891 ) ) ( not ( = ?auto_27873 ?auto_27913 ) ) ( SURFACE-AT ?auto_27856 ?auto_27876 ) ( CLEAR ?auto_27856 ) ( IS-CRATE ?auto_27857 ) ( AVAILABLE ?auto_27873 ) ( AVAILABLE ?auto_27880 ) ( SURFACE-AT ?auto_27857 ?auto_27890 ) ( ON ?auto_27857 ?auto_27900 ) ( CLEAR ?auto_27857 ) ( TRUCK-AT ?auto_27878 ?auto_27876 ) ( not ( = ?auto_27856 ?auto_27857 ) ) ( not ( = ?auto_27856 ?auto_27900 ) ) ( not ( = ?auto_27857 ?auto_27900 ) ) ( not ( = ?auto_27856 ?auto_27858 ) ) ( not ( = ?auto_27856 ?auto_27891 ) ) ( not ( = ?auto_27858 ?auto_27900 ) ) ( not ( = ?auto_27879 ?auto_27890 ) ) ( not ( = ?auto_27913 ?auto_27880 ) ) ( not ( = ?auto_27891 ?auto_27900 ) ) ( not ( = ?auto_27856 ?auto_27859 ) ) ( not ( = ?auto_27856 ?auto_27894 ) ) ( not ( = ?auto_27857 ?auto_27859 ) ) ( not ( = ?auto_27857 ?auto_27894 ) ) ( not ( = ?auto_27859 ?auto_27891 ) ) ( not ( = ?auto_27859 ?auto_27900 ) ) ( not ( = ?auto_27897 ?auto_27879 ) ) ( not ( = ?auto_27897 ?auto_27890 ) ) ( not ( = ?auto_27911 ?auto_27913 ) ) ( not ( = ?auto_27911 ?auto_27880 ) ) ( not ( = ?auto_27894 ?auto_27891 ) ) ( not ( = ?auto_27894 ?auto_27900 ) ) ( not ( = ?auto_27856 ?auto_27860 ) ) ( not ( = ?auto_27856 ?auto_27901 ) ) ( not ( = ?auto_27857 ?auto_27860 ) ) ( not ( = ?auto_27857 ?auto_27901 ) ) ( not ( = ?auto_27858 ?auto_27860 ) ) ( not ( = ?auto_27858 ?auto_27901 ) ) ( not ( = ?auto_27860 ?auto_27894 ) ) ( not ( = ?auto_27860 ?auto_27891 ) ) ( not ( = ?auto_27860 ?auto_27900 ) ) ( not ( = ?auto_27906 ?auto_27897 ) ) ( not ( = ?auto_27906 ?auto_27879 ) ) ( not ( = ?auto_27906 ?auto_27890 ) ) ( not ( = ?auto_27892 ?auto_27911 ) ) ( not ( = ?auto_27892 ?auto_27913 ) ) ( not ( = ?auto_27892 ?auto_27880 ) ) ( not ( = ?auto_27901 ?auto_27894 ) ) ( not ( = ?auto_27901 ?auto_27891 ) ) ( not ( = ?auto_27901 ?auto_27900 ) ) ( not ( = ?auto_27856 ?auto_27861 ) ) ( not ( = ?auto_27856 ?auto_27905 ) ) ( not ( = ?auto_27857 ?auto_27861 ) ) ( not ( = ?auto_27857 ?auto_27905 ) ) ( not ( = ?auto_27858 ?auto_27861 ) ) ( not ( = ?auto_27858 ?auto_27905 ) ) ( not ( = ?auto_27859 ?auto_27861 ) ) ( not ( = ?auto_27859 ?auto_27905 ) ) ( not ( = ?auto_27861 ?auto_27901 ) ) ( not ( = ?auto_27861 ?auto_27894 ) ) ( not ( = ?auto_27861 ?auto_27891 ) ) ( not ( = ?auto_27861 ?auto_27900 ) ) ( not ( = ?auto_27887 ?auto_27906 ) ) ( not ( = ?auto_27887 ?auto_27897 ) ) ( not ( = ?auto_27887 ?auto_27879 ) ) ( not ( = ?auto_27887 ?auto_27890 ) ) ( not ( = ?auto_27910 ?auto_27892 ) ) ( not ( = ?auto_27910 ?auto_27911 ) ) ( not ( = ?auto_27910 ?auto_27913 ) ) ( not ( = ?auto_27910 ?auto_27880 ) ) ( not ( = ?auto_27905 ?auto_27901 ) ) ( not ( = ?auto_27905 ?auto_27894 ) ) ( not ( = ?auto_27905 ?auto_27891 ) ) ( not ( = ?auto_27905 ?auto_27900 ) ) ( not ( = ?auto_27856 ?auto_27862 ) ) ( not ( = ?auto_27856 ?auto_27902 ) ) ( not ( = ?auto_27857 ?auto_27862 ) ) ( not ( = ?auto_27857 ?auto_27902 ) ) ( not ( = ?auto_27858 ?auto_27862 ) ) ( not ( = ?auto_27858 ?auto_27902 ) ) ( not ( = ?auto_27859 ?auto_27862 ) ) ( not ( = ?auto_27859 ?auto_27902 ) ) ( not ( = ?auto_27860 ?auto_27862 ) ) ( not ( = ?auto_27860 ?auto_27902 ) ) ( not ( = ?auto_27862 ?auto_27905 ) ) ( not ( = ?auto_27862 ?auto_27901 ) ) ( not ( = ?auto_27862 ?auto_27894 ) ) ( not ( = ?auto_27862 ?auto_27891 ) ) ( not ( = ?auto_27862 ?auto_27900 ) ) ( not ( = ?auto_27912 ?auto_27887 ) ) ( not ( = ?auto_27912 ?auto_27906 ) ) ( not ( = ?auto_27912 ?auto_27897 ) ) ( not ( = ?auto_27912 ?auto_27879 ) ) ( not ( = ?auto_27912 ?auto_27890 ) ) ( not ( = ?auto_27895 ?auto_27910 ) ) ( not ( = ?auto_27895 ?auto_27892 ) ) ( not ( = ?auto_27895 ?auto_27911 ) ) ( not ( = ?auto_27895 ?auto_27913 ) ) ( not ( = ?auto_27895 ?auto_27880 ) ) ( not ( = ?auto_27902 ?auto_27905 ) ) ( not ( = ?auto_27902 ?auto_27901 ) ) ( not ( = ?auto_27902 ?auto_27894 ) ) ( not ( = ?auto_27902 ?auto_27891 ) ) ( not ( = ?auto_27902 ?auto_27900 ) ) ( not ( = ?auto_27856 ?auto_27863 ) ) ( not ( = ?auto_27856 ?auto_27899 ) ) ( not ( = ?auto_27857 ?auto_27863 ) ) ( not ( = ?auto_27857 ?auto_27899 ) ) ( not ( = ?auto_27858 ?auto_27863 ) ) ( not ( = ?auto_27858 ?auto_27899 ) ) ( not ( = ?auto_27859 ?auto_27863 ) ) ( not ( = ?auto_27859 ?auto_27899 ) ) ( not ( = ?auto_27860 ?auto_27863 ) ) ( not ( = ?auto_27860 ?auto_27899 ) ) ( not ( = ?auto_27861 ?auto_27863 ) ) ( not ( = ?auto_27861 ?auto_27899 ) ) ( not ( = ?auto_27863 ?auto_27902 ) ) ( not ( = ?auto_27863 ?auto_27905 ) ) ( not ( = ?auto_27863 ?auto_27901 ) ) ( not ( = ?auto_27863 ?auto_27894 ) ) ( not ( = ?auto_27863 ?auto_27891 ) ) ( not ( = ?auto_27863 ?auto_27900 ) ) ( not ( = ?auto_27899 ?auto_27902 ) ) ( not ( = ?auto_27899 ?auto_27905 ) ) ( not ( = ?auto_27899 ?auto_27901 ) ) ( not ( = ?auto_27899 ?auto_27894 ) ) ( not ( = ?auto_27899 ?auto_27891 ) ) ( not ( = ?auto_27899 ?auto_27900 ) ) ( not ( = ?auto_27856 ?auto_27864 ) ) ( not ( = ?auto_27856 ?auto_27889 ) ) ( not ( = ?auto_27857 ?auto_27864 ) ) ( not ( = ?auto_27857 ?auto_27889 ) ) ( not ( = ?auto_27858 ?auto_27864 ) ) ( not ( = ?auto_27858 ?auto_27889 ) ) ( not ( = ?auto_27859 ?auto_27864 ) ) ( not ( = ?auto_27859 ?auto_27889 ) ) ( not ( = ?auto_27860 ?auto_27864 ) ) ( not ( = ?auto_27860 ?auto_27889 ) ) ( not ( = ?auto_27861 ?auto_27864 ) ) ( not ( = ?auto_27861 ?auto_27889 ) ) ( not ( = ?auto_27862 ?auto_27864 ) ) ( not ( = ?auto_27862 ?auto_27889 ) ) ( not ( = ?auto_27864 ?auto_27899 ) ) ( not ( = ?auto_27864 ?auto_27902 ) ) ( not ( = ?auto_27864 ?auto_27905 ) ) ( not ( = ?auto_27864 ?auto_27901 ) ) ( not ( = ?auto_27864 ?auto_27894 ) ) ( not ( = ?auto_27864 ?auto_27891 ) ) ( not ( = ?auto_27864 ?auto_27900 ) ) ( not ( = ?auto_27904 ?auto_27890 ) ) ( not ( = ?auto_27904 ?auto_27912 ) ) ( not ( = ?auto_27904 ?auto_27887 ) ) ( not ( = ?auto_27904 ?auto_27906 ) ) ( not ( = ?auto_27904 ?auto_27897 ) ) ( not ( = ?auto_27904 ?auto_27879 ) ) ( not ( = ?auto_27908 ?auto_27880 ) ) ( not ( = ?auto_27908 ?auto_27895 ) ) ( not ( = ?auto_27908 ?auto_27910 ) ) ( not ( = ?auto_27908 ?auto_27892 ) ) ( not ( = ?auto_27908 ?auto_27911 ) ) ( not ( = ?auto_27908 ?auto_27913 ) ) ( not ( = ?auto_27889 ?auto_27899 ) ) ( not ( = ?auto_27889 ?auto_27902 ) ) ( not ( = ?auto_27889 ?auto_27905 ) ) ( not ( = ?auto_27889 ?auto_27901 ) ) ( not ( = ?auto_27889 ?auto_27894 ) ) ( not ( = ?auto_27889 ?auto_27891 ) ) ( not ( = ?auto_27889 ?auto_27900 ) ) ( not ( = ?auto_27856 ?auto_27865 ) ) ( not ( = ?auto_27856 ?auto_27896 ) ) ( not ( = ?auto_27857 ?auto_27865 ) ) ( not ( = ?auto_27857 ?auto_27896 ) ) ( not ( = ?auto_27858 ?auto_27865 ) ) ( not ( = ?auto_27858 ?auto_27896 ) ) ( not ( = ?auto_27859 ?auto_27865 ) ) ( not ( = ?auto_27859 ?auto_27896 ) ) ( not ( = ?auto_27860 ?auto_27865 ) ) ( not ( = ?auto_27860 ?auto_27896 ) ) ( not ( = ?auto_27861 ?auto_27865 ) ) ( not ( = ?auto_27861 ?auto_27896 ) ) ( not ( = ?auto_27862 ?auto_27865 ) ) ( not ( = ?auto_27862 ?auto_27896 ) ) ( not ( = ?auto_27863 ?auto_27865 ) ) ( not ( = ?auto_27863 ?auto_27896 ) ) ( not ( = ?auto_27865 ?auto_27889 ) ) ( not ( = ?auto_27865 ?auto_27899 ) ) ( not ( = ?auto_27865 ?auto_27902 ) ) ( not ( = ?auto_27865 ?auto_27905 ) ) ( not ( = ?auto_27865 ?auto_27901 ) ) ( not ( = ?auto_27865 ?auto_27894 ) ) ( not ( = ?auto_27865 ?auto_27891 ) ) ( not ( = ?auto_27865 ?auto_27900 ) ) ( not ( = ?auto_27896 ?auto_27889 ) ) ( not ( = ?auto_27896 ?auto_27899 ) ) ( not ( = ?auto_27896 ?auto_27902 ) ) ( not ( = ?auto_27896 ?auto_27905 ) ) ( not ( = ?auto_27896 ?auto_27901 ) ) ( not ( = ?auto_27896 ?auto_27894 ) ) ( not ( = ?auto_27896 ?auto_27891 ) ) ( not ( = ?auto_27896 ?auto_27900 ) ) ( not ( = ?auto_27856 ?auto_27866 ) ) ( not ( = ?auto_27856 ?auto_27881 ) ) ( not ( = ?auto_27857 ?auto_27866 ) ) ( not ( = ?auto_27857 ?auto_27881 ) ) ( not ( = ?auto_27858 ?auto_27866 ) ) ( not ( = ?auto_27858 ?auto_27881 ) ) ( not ( = ?auto_27859 ?auto_27866 ) ) ( not ( = ?auto_27859 ?auto_27881 ) ) ( not ( = ?auto_27860 ?auto_27866 ) ) ( not ( = ?auto_27860 ?auto_27881 ) ) ( not ( = ?auto_27861 ?auto_27866 ) ) ( not ( = ?auto_27861 ?auto_27881 ) ) ( not ( = ?auto_27862 ?auto_27866 ) ) ( not ( = ?auto_27862 ?auto_27881 ) ) ( not ( = ?auto_27863 ?auto_27866 ) ) ( not ( = ?auto_27863 ?auto_27881 ) ) ( not ( = ?auto_27864 ?auto_27866 ) ) ( not ( = ?auto_27864 ?auto_27881 ) ) ( not ( = ?auto_27866 ?auto_27896 ) ) ( not ( = ?auto_27866 ?auto_27889 ) ) ( not ( = ?auto_27866 ?auto_27899 ) ) ( not ( = ?auto_27866 ?auto_27902 ) ) ( not ( = ?auto_27866 ?auto_27905 ) ) ( not ( = ?auto_27866 ?auto_27901 ) ) ( not ( = ?auto_27866 ?auto_27894 ) ) ( not ( = ?auto_27866 ?auto_27891 ) ) ( not ( = ?auto_27866 ?auto_27900 ) ) ( not ( = ?auto_27888 ?auto_27906 ) ) ( not ( = ?auto_27888 ?auto_27904 ) ) ( not ( = ?auto_27888 ?auto_27890 ) ) ( not ( = ?auto_27888 ?auto_27912 ) ) ( not ( = ?auto_27888 ?auto_27887 ) ) ( not ( = ?auto_27888 ?auto_27897 ) ) ( not ( = ?auto_27888 ?auto_27879 ) ) ( not ( = ?auto_27883 ?auto_27892 ) ) ( not ( = ?auto_27883 ?auto_27908 ) ) ( not ( = ?auto_27883 ?auto_27880 ) ) ( not ( = ?auto_27883 ?auto_27895 ) ) ( not ( = ?auto_27883 ?auto_27910 ) ) ( not ( = ?auto_27883 ?auto_27911 ) ) ( not ( = ?auto_27883 ?auto_27913 ) ) ( not ( = ?auto_27881 ?auto_27896 ) ) ( not ( = ?auto_27881 ?auto_27889 ) ) ( not ( = ?auto_27881 ?auto_27899 ) ) ( not ( = ?auto_27881 ?auto_27902 ) ) ( not ( = ?auto_27881 ?auto_27905 ) ) ( not ( = ?auto_27881 ?auto_27901 ) ) ( not ( = ?auto_27881 ?auto_27894 ) ) ( not ( = ?auto_27881 ?auto_27891 ) ) ( not ( = ?auto_27881 ?auto_27900 ) ) ( not ( = ?auto_27856 ?auto_27867 ) ) ( not ( = ?auto_27856 ?auto_27885 ) ) ( not ( = ?auto_27857 ?auto_27867 ) ) ( not ( = ?auto_27857 ?auto_27885 ) ) ( not ( = ?auto_27858 ?auto_27867 ) ) ( not ( = ?auto_27858 ?auto_27885 ) ) ( not ( = ?auto_27859 ?auto_27867 ) ) ( not ( = ?auto_27859 ?auto_27885 ) ) ( not ( = ?auto_27860 ?auto_27867 ) ) ( not ( = ?auto_27860 ?auto_27885 ) ) ( not ( = ?auto_27861 ?auto_27867 ) ) ( not ( = ?auto_27861 ?auto_27885 ) ) ( not ( = ?auto_27862 ?auto_27867 ) ) ( not ( = ?auto_27862 ?auto_27885 ) ) ( not ( = ?auto_27863 ?auto_27867 ) ) ( not ( = ?auto_27863 ?auto_27885 ) ) ( not ( = ?auto_27864 ?auto_27867 ) ) ( not ( = ?auto_27864 ?auto_27885 ) ) ( not ( = ?auto_27865 ?auto_27867 ) ) ( not ( = ?auto_27865 ?auto_27885 ) ) ( not ( = ?auto_27867 ?auto_27881 ) ) ( not ( = ?auto_27867 ?auto_27896 ) ) ( not ( = ?auto_27867 ?auto_27889 ) ) ( not ( = ?auto_27867 ?auto_27899 ) ) ( not ( = ?auto_27867 ?auto_27902 ) ) ( not ( = ?auto_27867 ?auto_27905 ) ) ( not ( = ?auto_27867 ?auto_27901 ) ) ( not ( = ?auto_27867 ?auto_27894 ) ) ( not ( = ?auto_27867 ?auto_27891 ) ) ( not ( = ?auto_27867 ?auto_27900 ) ) ( not ( = ?auto_27893 ?auto_27888 ) ) ( not ( = ?auto_27893 ?auto_27906 ) ) ( not ( = ?auto_27893 ?auto_27904 ) ) ( not ( = ?auto_27893 ?auto_27890 ) ) ( not ( = ?auto_27893 ?auto_27912 ) ) ( not ( = ?auto_27893 ?auto_27887 ) ) ( not ( = ?auto_27893 ?auto_27897 ) ) ( not ( = ?auto_27893 ?auto_27879 ) ) ( not ( = ?auto_27884 ?auto_27883 ) ) ( not ( = ?auto_27884 ?auto_27892 ) ) ( not ( = ?auto_27884 ?auto_27908 ) ) ( not ( = ?auto_27884 ?auto_27880 ) ) ( not ( = ?auto_27884 ?auto_27895 ) ) ( not ( = ?auto_27884 ?auto_27910 ) ) ( not ( = ?auto_27884 ?auto_27911 ) ) ( not ( = ?auto_27884 ?auto_27913 ) ) ( not ( = ?auto_27885 ?auto_27881 ) ) ( not ( = ?auto_27885 ?auto_27896 ) ) ( not ( = ?auto_27885 ?auto_27889 ) ) ( not ( = ?auto_27885 ?auto_27899 ) ) ( not ( = ?auto_27885 ?auto_27902 ) ) ( not ( = ?auto_27885 ?auto_27905 ) ) ( not ( = ?auto_27885 ?auto_27901 ) ) ( not ( = ?auto_27885 ?auto_27894 ) ) ( not ( = ?auto_27885 ?auto_27891 ) ) ( not ( = ?auto_27885 ?auto_27900 ) ) ( not ( = ?auto_27856 ?auto_27868 ) ) ( not ( = ?auto_27856 ?auto_27898 ) ) ( not ( = ?auto_27857 ?auto_27868 ) ) ( not ( = ?auto_27857 ?auto_27898 ) ) ( not ( = ?auto_27858 ?auto_27868 ) ) ( not ( = ?auto_27858 ?auto_27898 ) ) ( not ( = ?auto_27859 ?auto_27868 ) ) ( not ( = ?auto_27859 ?auto_27898 ) ) ( not ( = ?auto_27860 ?auto_27868 ) ) ( not ( = ?auto_27860 ?auto_27898 ) ) ( not ( = ?auto_27861 ?auto_27868 ) ) ( not ( = ?auto_27861 ?auto_27898 ) ) ( not ( = ?auto_27862 ?auto_27868 ) ) ( not ( = ?auto_27862 ?auto_27898 ) ) ( not ( = ?auto_27863 ?auto_27868 ) ) ( not ( = ?auto_27863 ?auto_27898 ) ) ( not ( = ?auto_27864 ?auto_27868 ) ) ( not ( = ?auto_27864 ?auto_27898 ) ) ( not ( = ?auto_27865 ?auto_27868 ) ) ( not ( = ?auto_27865 ?auto_27898 ) ) ( not ( = ?auto_27866 ?auto_27868 ) ) ( not ( = ?auto_27866 ?auto_27898 ) ) ( not ( = ?auto_27868 ?auto_27885 ) ) ( not ( = ?auto_27868 ?auto_27881 ) ) ( not ( = ?auto_27868 ?auto_27896 ) ) ( not ( = ?auto_27868 ?auto_27889 ) ) ( not ( = ?auto_27868 ?auto_27899 ) ) ( not ( = ?auto_27868 ?auto_27902 ) ) ( not ( = ?auto_27868 ?auto_27905 ) ) ( not ( = ?auto_27868 ?auto_27901 ) ) ( not ( = ?auto_27868 ?auto_27894 ) ) ( not ( = ?auto_27868 ?auto_27891 ) ) ( not ( = ?auto_27868 ?auto_27900 ) ) ( not ( = ?auto_27874 ?auto_27893 ) ) ( not ( = ?auto_27874 ?auto_27888 ) ) ( not ( = ?auto_27874 ?auto_27906 ) ) ( not ( = ?auto_27874 ?auto_27904 ) ) ( not ( = ?auto_27874 ?auto_27890 ) ) ( not ( = ?auto_27874 ?auto_27912 ) ) ( not ( = ?auto_27874 ?auto_27887 ) ) ( not ( = ?auto_27874 ?auto_27897 ) ) ( not ( = ?auto_27874 ?auto_27879 ) ) ( not ( = ?auto_27875 ?auto_27884 ) ) ( not ( = ?auto_27875 ?auto_27883 ) ) ( not ( = ?auto_27875 ?auto_27892 ) ) ( not ( = ?auto_27875 ?auto_27908 ) ) ( not ( = ?auto_27875 ?auto_27880 ) ) ( not ( = ?auto_27875 ?auto_27895 ) ) ( not ( = ?auto_27875 ?auto_27910 ) ) ( not ( = ?auto_27875 ?auto_27911 ) ) ( not ( = ?auto_27875 ?auto_27913 ) ) ( not ( = ?auto_27898 ?auto_27885 ) ) ( not ( = ?auto_27898 ?auto_27881 ) ) ( not ( = ?auto_27898 ?auto_27896 ) ) ( not ( = ?auto_27898 ?auto_27889 ) ) ( not ( = ?auto_27898 ?auto_27899 ) ) ( not ( = ?auto_27898 ?auto_27902 ) ) ( not ( = ?auto_27898 ?auto_27905 ) ) ( not ( = ?auto_27898 ?auto_27901 ) ) ( not ( = ?auto_27898 ?auto_27894 ) ) ( not ( = ?auto_27898 ?auto_27891 ) ) ( not ( = ?auto_27898 ?auto_27900 ) ) ( not ( = ?auto_27856 ?auto_27869 ) ) ( not ( = ?auto_27856 ?auto_27909 ) ) ( not ( = ?auto_27857 ?auto_27869 ) ) ( not ( = ?auto_27857 ?auto_27909 ) ) ( not ( = ?auto_27858 ?auto_27869 ) ) ( not ( = ?auto_27858 ?auto_27909 ) ) ( not ( = ?auto_27859 ?auto_27869 ) ) ( not ( = ?auto_27859 ?auto_27909 ) ) ( not ( = ?auto_27860 ?auto_27869 ) ) ( not ( = ?auto_27860 ?auto_27909 ) ) ( not ( = ?auto_27861 ?auto_27869 ) ) ( not ( = ?auto_27861 ?auto_27909 ) ) ( not ( = ?auto_27862 ?auto_27869 ) ) ( not ( = ?auto_27862 ?auto_27909 ) ) ( not ( = ?auto_27863 ?auto_27869 ) ) ( not ( = ?auto_27863 ?auto_27909 ) ) ( not ( = ?auto_27864 ?auto_27869 ) ) ( not ( = ?auto_27864 ?auto_27909 ) ) ( not ( = ?auto_27865 ?auto_27869 ) ) ( not ( = ?auto_27865 ?auto_27909 ) ) ( not ( = ?auto_27866 ?auto_27869 ) ) ( not ( = ?auto_27866 ?auto_27909 ) ) ( not ( = ?auto_27867 ?auto_27869 ) ) ( not ( = ?auto_27867 ?auto_27909 ) ) ( not ( = ?auto_27869 ?auto_27898 ) ) ( not ( = ?auto_27869 ?auto_27885 ) ) ( not ( = ?auto_27869 ?auto_27881 ) ) ( not ( = ?auto_27869 ?auto_27896 ) ) ( not ( = ?auto_27869 ?auto_27889 ) ) ( not ( = ?auto_27869 ?auto_27899 ) ) ( not ( = ?auto_27869 ?auto_27902 ) ) ( not ( = ?auto_27869 ?auto_27905 ) ) ( not ( = ?auto_27869 ?auto_27901 ) ) ( not ( = ?auto_27869 ?auto_27894 ) ) ( not ( = ?auto_27869 ?auto_27891 ) ) ( not ( = ?auto_27869 ?auto_27900 ) ) ( not ( = ?auto_27907 ?auto_27874 ) ) ( not ( = ?auto_27907 ?auto_27893 ) ) ( not ( = ?auto_27907 ?auto_27888 ) ) ( not ( = ?auto_27907 ?auto_27906 ) ) ( not ( = ?auto_27907 ?auto_27904 ) ) ( not ( = ?auto_27907 ?auto_27890 ) ) ( not ( = ?auto_27907 ?auto_27912 ) ) ( not ( = ?auto_27907 ?auto_27887 ) ) ( not ( = ?auto_27907 ?auto_27897 ) ) ( not ( = ?auto_27907 ?auto_27879 ) ) ( not ( = ?auto_27886 ?auto_27875 ) ) ( not ( = ?auto_27886 ?auto_27884 ) ) ( not ( = ?auto_27886 ?auto_27883 ) ) ( not ( = ?auto_27886 ?auto_27892 ) ) ( not ( = ?auto_27886 ?auto_27908 ) ) ( not ( = ?auto_27886 ?auto_27880 ) ) ( not ( = ?auto_27886 ?auto_27895 ) ) ( not ( = ?auto_27886 ?auto_27910 ) ) ( not ( = ?auto_27886 ?auto_27911 ) ) ( not ( = ?auto_27886 ?auto_27913 ) ) ( not ( = ?auto_27909 ?auto_27898 ) ) ( not ( = ?auto_27909 ?auto_27885 ) ) ( not ( = ?auto_27909 ?auto_27881 ) ) ( not ( = ?auto_27909 ?auto_27896 ) ) ( not ( = ?auto_27909 ?auto_27889 ) ) ( not ( = ?auto_27909 ?auto_27899 ) ) ( not ( = ?auto_27909 ?auto_27902 ) ) ( not ( = ?auto_27909 ?auto_27905 ) ) ( not ( = ?auto_27909 ?auto_27901 ) ) ( not ( = ?auto_27909 ?auto_27894 ) ) ( not ( = ?auto_27909 ?auto_27891 ) ) ( not ( = ?auto_27909 ?auto_27900 ) ) ( not ( = ?auto_27856 ?auto_27870 ) ) ( not ( = ?auto_27856 ?auto_27903 ) ) ( not ( = ?auto_27857 ?auto_27870 ) ) ( not ( = ?auto_27857 ?auto_27903 ) ) ( not ( = ?auto_27858 ?auto_27870 ) ) ( not ( = ?auto_27858 ?auto_27903 ) ) ( not ( = ?auto_27859 ?auto_27870 ) ) ( not ( = ?auto_27859 ?auto_27903 ) ) ( not ( = ?auto_27860 ?auto_27870 ) ) ( not ( = ?auto_27860 ?auto_27903 ) ) ( not ( = ?auto_27861 ?auto_27870 ) ) ( not ( = ?auto_27861 ?auto_27903 ) ) ( not ( = ?auto_27862 ?auto_27870 ) ) ( not ( = ?auto_27862 ?auto_27903 ) ) ( not ( = ?auto_27863 ?auto_27870 ) ) ( not ( = ?auto_27863 ?auto_27903 ) ) ( not ( = ?auto_27864 ?auto_27870 ) ) ( not ( = ?auto_27864 ?auto_27903 ) ) ( not ( = ?auto_27865 ?auto_27870 ) ) ( not ( = ?auto_27865 ?auto_27903 ) ) ( not ( = ?auto_27866 ?auto_27870 ) ) ( not ( = ?auto_27866 ?auto_27903 ) ) ( not ( = ?auto_27867 ?auto_27870 ) ) ( not ( = ?auto_27867 ?auto_27903 ) ) ( not ( = ?auto_27868 ?auto_27870 ) ) ( not ( = ?auto_27868 ?auto_27903 ) ) ( not ( = ?auto_27870 ?auto_27909 ) ) ( not ( = ?auto_27870 ?auto_27898 ) ) ( not ( = ?auto_27870 ?auto_27885 ) ) ( not ( = ?auto_27870 ?auto_27881 ) ) ( not ( = ?auto_27870 ?auto_27896 ) ) ( not ( = ?auto_27870 ?auto_27889 ) ) ( not ( = ?auto_27870 ?auto_27899 ) ) ( not ( = ?auto_27870 ?auto_27902 ) ) ( not ( = ?auto_27870 ?auto_27905 ) ) ( not ( = ?auto_27870 ?auto_27901 ) ) ( not ( = ?auto_27870 ?auto_27894 ) ) ( not ( = ?auto_27870 ?auto_27891 ) ) ( not ( = ?auto_27870 ?auto_27900 ) ) ( not ( = ?auto_27903 ?auto_27909 ) ) ( not ( = ?auto_27903 ?auto_27898 ) ) ( not ( = ?auto_27903 ?auto_27885 ) ) ( not ( = ?auto_27903 ?auto_27881 ) ) ( not ( = ?auto_27903 ?auto_27896 ) ) ( not ( = ?auto_27903 ?auto_27889 ) ) ( not ( = ?auto_27903 ?auto_27899 ) ) ( not ( = ?auto_27903 ?auto_27902 ) ) ( not ( = ?auto_27903 ?auto_27905 ) ) ( not ( = ?auto_27903 ?auto_27901 ) ) ( not ( = ?auto_27903 ?auto_27894 ) ) ( not ( = ?auto_27903 ?auto_27891 ) ) ( not ( = ?auto_27903 ?auto_27900 ) ) ( not ( = ?auto_27856 ?auto_27871 ) ) ( not ( = ?auto_27856 ?auto_27882 ) ) ( not ( = ?auto_27857 ?auto_27871 ) ) ( not ( = ?auto_27857 ?auto_27882 ) ) ( not ( = ?auto_27858 ?auto_27871 ) ) ( not ( = ?auto_27858 ?auto_27882 ) ) ( not ( = ?auto_27859 ?auto_27871 ) ) ( not ( = ?auto_27859 ?auto_27882 ) ) ( not ( = ?auto_27860 ?auto_27871 ) ) ( not ( = ?auto_27860 ?auto_27882 ) ) ( not ( = ?auto_27861 ?auto_27871 ) ) ( not ( = ?auto_27861 ?auto_27882 ) ) ( not ( = ?auto_27862 ?auto_27871 ) ) ( not ( = ?auto_27862 ?auto_27882 ) ) ( not ( = ?auto_27863 ?auto_27871 ) ) ( not ( = ?auto_27863 ?auto_27882 ) ) ( not ( = ?auto_27864 ?auto_27871 ) ) ( not ( = ?auto_27864 ?auto_27882 ) ) ( not ( = ?auto_27865 ?auto_27871 ) ) ( not ( = ?auto_27865 ?auto_27882 ) ) ( not ( = ?auto_27866 ?auto_27871 ) ) ( not ( = ?auto_27866 ?auto_27882 ) ) ( not ( = ?auto_27867 ?auto_27871 ) ) ( not ( = ?auto_27867 ?auto_27882 ) ) ( not ( = ?auto_27868 ?auto_27871 ) ) ( not ( = ?auto_27868 ?auto_27882 ) ) ( not ( = ?auto_27869 ?auto_27871 ) ) ( not ( = ?auto_27869 ?auto_27882 ) ) ( not ( = ?auto_27871 ?auto_27903 ) ) ( not ( = ?auto_27871 ?auto_27909 ) ) ( not ( = ?auto_27871 ?auto_27898 ) ) ( not ( = ?auto_27871 ?auto_27885 ) ) ( not ( = ?auto_27871 ?auto_27881 ) ) ( not ( = ?auto_27871 ?auto_27896 ) ) ( not ( = ?auto_27871 ?auto_27889 ) ) ( not ( = ?auto_27871 ?auto_27899 ) ) ( not ( = ?auto_27871 ?auto_27902 ) ) ( not ( = ?auto_27871 ?auto_27905 ) ) ( not ( = ?auto_27871 ?auto_27901 ) ) ( not ( = ?auto_27871 ?auto_27894 ) ) ( not ( = ?auto_27871 ?auto_27891 ) ) ( not ( = ?auto_27871 ?auto_27900 ) ) ( not ( = ?auto_27882 ?auto_27903 ) ) ( not ( = ?auto_27882 ?auto_27909 ) ) ( not ( = ?auto_27882 ?auto_27898 ) ) ( not ( = ?auto_27882 ?auto_27885 ) ) ( not ( = ?auto_27882 ?auto_27881 ) ) ( not ( = ?auto_27882 ?auto_27896 ) ) ( not ( = ?auto_27882 ?auto_27889 ) ) ( not ( = ?auto_27882 ?auto_27899 ) ) ( not ( = ?auto_27882 ?auto_27902 ) ) ( not ( = ?auto_27882 ?auto_27905 ) ) ( not ( = ?auto_27882 ?auto_27901 ) ) ( not ( = ?auto_27882 ?auto_27894 ) ) ( not ( = ?auto_27882 ?auto_27891 ) ) ( not ( = ?auto_27882 ?auto_27900 ) ) ( not ( = ?auto_27856 ?auto_27872 ) ) ( not ( = ?auto_27856 ?auto_27877 ) ) ( not ( = ?auto_27857 ?auto_27872 ) ) ( not ( = ?auto_27857 ?auto_27877 ) ) ( not ( = ?auto_27858 ?auto_27872 ) ) ( not ( = ?auto_27858 ?auto_27877 ) ) ( not ( = ?auto_27859 ?auto_27872 ) ) ( not ( = ?auto_27859 ?auto_27877 ) ) ( not ( = ?auto_27860 ?auto_27872 ) ) ( not ( = ?auto_27860 ?auto_27877 ) ) ( not ( = ?auto_27861 ?auto_27872 ) ) ( not ( = ?auto_27861 ?auto_27877 ) ) ( not ( = ?auto_27862 ?auto_27872 ) ) ( not ( = ?auto_27862 ?auto_27877 ) ) ( not ( = ?auto_27863 ?auto_27872 ) ) ( not ( = ?auto_27863 ?auto_27877 ) ) ( not ( = ?auto_27864 ?auto_27872 ) ) ( not ( = ?auto_27864 ?auto_27877 ) ) ( not ( = ?auto_27865 ?auto_27872 ) ) ( not ( = ?auto_27865 ?auto_27877 ) ) ( not ( = ?auto_27866 ?auto_27872 ) ) ( not ( = ?auto_27866 ?auto_27877 ) ) ( not ( = ?auto_27867 ?auto_27872 ) ) ( not ( = ?auto_27867 ?auto_27877 ) ) ( not ( = ?auto_27868 ?auto_27872 ) ) ( not ( = ?auto_27868 ?auto_27877 ) ) ( not ( = ?auto_27869 ?auto_27872 ) ) ( not ( = ?auto_27869 ?auto_27877 ) ) ( not ( = ?auto_27870 ?auto_27872 ) ) ( not ( = ?auto_27870 ?auto_27877 ) ) ( not ( = ?auto_27872 ?auto_27882 ) ) ( not ( = ?auto_27872 ?auto_27903 ) ) ( not ( = ?auto_27872 ?auto_27909 ) ) ( not ( = ?auto_27872 ?auto_27898 ) ) ( not ( = ?auto_27872 ?auto_27885 ) ) ( not ( = ?auto_27872 ?auto_27881 ) ) ( not ( = ?auto_27872 ?auto_27896 ) ) ( not ( = ?auto_27872 ?auto_27889 ) ) ( not ( = ?auto_27872 ?auto_27899 ) ) ( not ( = ?auto_27872 ?auto_27902 ) ) ( not ( = ?auto_27872 ?auto_27905 ) ) ( not ( = ?auto_27872 ?auto_27901 ) ) ( not ( = ?auto_27872 ?auto_27894 ) ) ( not ( = ?auto_27872 ?auto_27891 ) ) ( not ( = ?auto_27872 ?auto_27900 ) ) ( not ( = ?auto_27877 ?auto_27882 ) ) ( not ( = ?auto_27877 ?auto_27903 ) ) ( not ( = ?auto_27877 ?auto_27909 ) ) ( not ( = ?auto_27877 ?auto_27898 ) ) ( not ( = ?auto_27877 ?auto_27885 ) ) ( not ( = ?auto_27877 ?auto_27881 ) ) ( not ( = ?auto_27877 ?auto_27896 ) ) ( not ( = ?auto_27877 ?auto_27889 ) ) ( not ( = ?auto_27877 ?auto_27899 ) ) ( not ( = ?auto_27877 ?auto_27902 ) ) ( not ( = ?auto_27877 ?auto_27905 ) ) ( not ( = ?auto_27877 ?auto_27901 ) ) ( not ( = ?auto_27877 ?auto_27894 ) ) ( not ( = ?auto_27877 ?auto_27891 ) ) ( not ( = ?auto_27877 ?auto_27900 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_27856 ?auto_27857 ?auto_27858 ?auto_27859 ?auto_27860 ?auto_27861 ?auto_27862 ?auto_27863 ?auto_27864 ?auto_27865 ?auto_27866 ?auto_27867 ?auto_27868 ?auto_27869 ?auto_27870 ?auto_27871 )
      ( MAKE-1CRATE ?auto_27871 ?auto_27872 )
      ( MAKE-16CRATE-VERIFY ?auto_27856 ?auto_27857 ?auto_27858 ?auto_27859 ?auto_27860 ?auto_27861 ?auto_27862 ?auto_27863 ?auto_27864 ?auto_27865 ?auto_27866 ?auto_27867 ?auto_27868 ?auto_27869 ?auto_27870 ?auto_27871 ?auto_27872 ) )
  )

)

