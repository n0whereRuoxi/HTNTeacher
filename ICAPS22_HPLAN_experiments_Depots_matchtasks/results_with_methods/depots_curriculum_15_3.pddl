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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22088 - SURFACE
      ?auto_22089 - SURFACE
    )
    :vars
    (
      ?auto_22090 - HOIST
      ?auto_22091 - PLACE
      ?auto_22093 - PLACE
      ?auto_22094 - HOIST
      ?auto_22095 - SURFACE
      ?auto_22092 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22090 ?auto_22091 ) ( SURFACE-AT ?auto_22088 ?auto_22091 ) ( CLEAR ?auto_22088 ) ( IS-CRATE ?auto_22089 ) ( AVAILABLE ?auto_22090 ) ( not ( = ?auto_22093 ?auto_22091 ) ) ( HOIST-AT ?auto_22094 ?auto_22093 ) ( AVAILABLE ?auto_22094 ) ( SURFACE-AT ?auto_22089 ?auto_22093 ) ( ON ?auto_22089 ?auto_22095 ) ( CLEAR ?auto_22089 ) ( TRUCK-AT ?auto_22092 ?auto_22091 ) ( not ( = ?auto_22088 ?auto_22089 ) ) ( not ( = ?auto_22088 ?auto_22095 ) ) ( not ( = ?auto_22089 ?auto_22095 ) ) ( not ( = ?auto_22090 ?auto_22094 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22092 ?auto_22091 ?auto_22093 )
      ( !LIFT ?auto_22094 ?auto_22089 ?auto_22095 ?auto_22093 )
      ( !LOAD ?auto_22094 ?auto_22089 ?auto_22092 ?auto_22093 )
      ( !DRIVE ?auto_22092 ?auto_22093 ?auto_22091 )
      ( !UNLOAD ?auto_22090 ?auto_22089 ?auto_22092 ?auto_22091 )
      ( !DROP ?auto_22090 ?auto_22089 ?auto_22088 ?auto_22091 )
      ( MAKE-1CRATE-VERIFY ?auto_22088 ?auto_22089 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22098 - SURFACE
      ?auto_22099 - SURFACE
    )
    :vars
    (
      ?auto_22100 - HOIST
      ?auto_22101 - PLACE
      ?auto_22103 - PLACE
      ?auto_22104 - HOIST
      ?auto_22105 - SURFACE
      ?auto_22102 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22100 ?auto_22101 ) ( SURFACE-AT ?auto_22098 ?auto_22101 ) ( CLEAR ?auto_22098 ) ( IS-CRATE ?auto_22099 ) ( AVAILABLE ?auto_22100 ) ( not ( = ?auto_22103 ?auto_22101 ) ) ( HOIST-AT ?auto_22104 ?auto_22103 ) ( AVAILABLE ?auto_22104 ) ( SURFACE-AT ?auto_22099 ?auto_22103 ) ( ON ?auto_22099 ?auto_22105 ) ( CLEAR ?auto_22099 ) ( TRUCK-AT ?auto_22102 ?auto_22101 ) ( not ( = ?auto_22098 ?auto_22099 ) ) ( not ( = ?auto_22098 ?auto_22105 ) ) ( not ( = ?auto_22099 ?auto_22105 ) ) ( not ( = ?auto_22100 ?auto_22104 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22102 ?auto_22101 ?auto_22103 )
      ( !LIFT ?auto_22104 ?auto_22099 ?auto_22105 ?auto_22103 )
      ( !LOAD ?auto_22104 ?auto_22099 ?auto_22102 ?auto_22103 )
      ( !DRIVE ?auto_22102 ?auto_22103 ?auto_22101 )
      ( !UNLOAD ?auto_22100 ?auto_22099 ?auto_22102 ?auto_22101 )
      ( !DROP ?auto_22100 ?auto_22099 ?auto_22098 ?auto_22101 )
      ( MAKE-1CRATE-VERIFY ?auto_22098 ?auto_22099 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22109 - SURFACE
      ?auto_22110 - SURFACE
      ?auto_22111 - SURFACE
    )
    :vars
    (
      ?auto_22114 - HOIST
      ?auto_22112 - PLACE
      ?auto_22113 - PLACE
      ?auto_22116 - HOIST
      ?auto_22117 - SURFACE
      ?auto_22119 - PLACE
      ?auto_22118 - HOIST
      ?auto_22120 - SURFACE
      ?auto_22115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22114 ?auto_22112 ) ( IS-CRATE ?auto_22111 ) ( not ( = ?auto_22113 ?auto_22112 ) ) ( HOIST-AT ?auto_22116 ?auto_22113 ) ( AVAILABLE ?auto_22116 ) ( SURFACE-AT ?auto_22111 ?auto_22113 ) ( ON ?auto_22111 ?auto_22117 ) ( CLEAR ?auto_22111 ) ( not ( = ?auto_22110 ?auto_22111 ) ) ( not ( = ?auto_22110 ?auto_22117 ) ) ( not ( = ?auto_22111 ?auto_22117 ) ) ( not ( = ?auto_22114 ?auto_22116 ) ) ( SURFACE-AT ?auto_22109 ?auto_22112 ) ( CLEAR ?auto_22109 ) ( IS-CRATE ?auto_22110 ) ( AVAILABLE ?auto_22114 ) ( not ( = ?auto_22119 ?auto_22112 ) ) ( HOIST-AT ?auto_22118 ?auto_22119 ) ( AVAILABLE ?auto_22118 ) ( SURFACE-AT ?auto_22110 ?auto_22119 ) ( ON ?auto_22110 ?auto_22120 ) ( CLEAR ?auto_22110 ) ( TRUCK-AT ?auto_22115 ?auto_22112 ) ( not ( = ?auto_22109 ?auto_22110 ) ) ( not ( = ?auto_22109 ?auto_22120 ) ) ( not ( = ?auto_22110 ?auto_22120 ) ) ( not ( = ?auto_22114 ?auto_22118 ) ) ( not ( = ?auto_22109 ?auto_22111 ) ) ( not ( = ?auto_22109 ?auto_22117 ) ) ( not ( = ?auto_22111 ?auto_22120 ) ) ( not ( = ?auto_22113 ?auto_22119 ) ) ( not ( = ?auto_22116 ?auto_22118 ) ) ( not ( = ?auto_22117 ?auto_22120 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22109 ?auto_22110 )
      ( MAKE-1CRATE ?auto_22110 ?auto_22111 )
      ( MAKE-2CRATE-VERIFY ?auto_22109 ?auto_22110 ?auto_22111 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22123 - SURFACE
      ?auto_22124 - SURFACE
    )
    :vars
    (
      ?auto_22125 - HOIST
      ?auto_22126 - PLACE
      ?auto_22128 - PLACE
      ?auto_22129 - HOIST
      ?auto_22130 - SURFACE
      ?auto_22127 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22125 ?auto_22126 ) ( SURFACE-AT ?auto_22123 ?auto_22126 ) ( CLEAR ?auto_22123 ) ( IS-CRATE ?auto_22124 ) ( AVAILABLE ?auto_22125 ) ( not ( = ?auto_22128 ?auto_22126 ) ) ( HOIST-AT ?auto_22129 ?auto_22128 ) ( AVAILABLE ?auto_22129 ) ( SURFACE-AT ?auto_22124 ?auto_22128 ) ( ON ?auto_22124 ?auto_22130 ) ( CLEAR ?auto_22124 ) ( TRUCK-AT ?auto_22127 ?auto_22126 ) ( not ( = ?auto_22123 ?auto_22124 ) ) ( not ( = ?auto_22123 ?auto_22130 ) ) ( not ( = ?auto_22124 ?auto_22130 ) ) ( not ( = ?auto_22125 ?auto_22129 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22127 ?auto_22126 ?auto_22128 )
      ( !LIFT ?auto_22129 ?auto_22124 ?auto_22130 ?auto_22128 )
      ( !LOAD ?auto_22129 ?auto_22124 ?auto_22127 ?auto_22128 )
      ( !DRIVE ?auto_22127 ?auto_22128 ?auto_22126 )
      ( !UNLOAD ?auto_22125 ?auto_22124 ?auto_22127 ?auto_22126 )
      ( !DROP ?auto_22125 ?auto_22124 ?auto_22123 ?auto_22126 )
      ( MAKE-1CRATE-VERIFY ?auto_22123 ?auto_22124 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22135 - SURFACE
      ?auto_22136 - SURFACE
      ?auto_22137 - SURFACE
      ?auto_22138 - SURFACE
    )
    :vars
    (
      ?auto_22143 - HOIST
      ?auto_22141 - PLACE
      ?auto_22144 - PLACE
      ?auto_22140 - HOIST
      ?auto_22139 - SURFACE
      ?auto_22146 - PLACE
      ?auto_22149 - HOIST
      ?auto_22145 - SURFACE
      ?auto_22148 - PLACE
      ?auto_22150 - HOIST
      ?auto_22147 - SURFACE
      ?auto_22142 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22143 ?auto_22141 ) ( IS-CRATE ?auto_22138 ) ( not ( = ?auto_22144 ?auto_22141 ) ) ( HOIST-AT ?auto_22140 ?auto_22144 ) ( AVAILABLE ?auto_22140 ) ( SURFACE-AT ?auto_22138 ?auto_22144 ) ( ON ?auto_22138 ?auto_22139 ) ( CLEAR ?auto_22138 ) ( not ( = ?auto_22137 ?auto_22138 ) ) ( not ( = ?auto_22137 ?auto_22139 ) ) ( not ( = ?auto_22138 ?auto_22139 ) ) ( not ( = ?auto_22143 ?auto_22140 ) ) ( IS-CRATE ?auto_22137 ) ( not ( = ?auto_22146 ?auto_22141 ) ) ( HOIST-AT ?auto_22149 ?auto_22146 ) ( AVAILABLE ?auto_22149 ) ( SURFACE-AT ?auto_22137 ?auto_22146 ) ( ON ?auto_22137 ?auto_22145 ) ( CLEAR ?auto_22137 ) ( not ( = ?auto_22136 ?auto_22137 ) ) ( not ( = ?auto_22136 ?auto_22145 ) ) ( not ( = ?auto_22137 ?auto_22145 ) ) ( not ( = ?auto_22143 ?auto_22149 ) ) ( SURFACE-AT ?auto_22135 ?auto_22141 ) ( CLEAR ?auto_22135 ) ( IS-CRATE ?auto_22136 ) ( AVAILABLE ?auto_22143 ) ( not ( = ?auto_22148 ?auto_22141 ) ) ( HOIST-AT ?auto_22150 ?auto_22148 ) ( AVAILABLE ?auto_22150 ) ( SURFACE-AT ?auto_22136 ?auto_22148 ) ( ON ?auto_22136 ?auto_22147 ) ( CLEAR ?auto_22136 ) ( TRUCK-AT ?auto_22142 ?auto_22141 ) ( not ( = ?auto_22135 ?auto_22136 ) ) ( not ( = ?auto_22135 ?auto_22147 ) ) ( not ( = ?auto_22136 ?auto_22147 ) ) ( not ( = ?auto_22143 ?auto_22150 ) ) ( not ( = ?auto_22135 ?auto_22137 ) ) ( not ( = ?auto_22135 ?auto_22145 ) ) ( not ( = ?auto_22137 ?auto_22147 ) ) ( not ( = ?auto_22146 ?auto_22148 ) ) ( not ( = ?auto_22149 ?auto_22150 ) ) ( not ( = ?auto_22145 ?auto_22147 ) ) ( not ( = ?auto_22135 ?auto_22138 ) ) ( not ( = ?auto_22135 ?auto_22139 ) ) ( not ( = ?auto_22136 ?auto_22138 ) ) ( not ( = ?auto_22136 ?auto_22139 ) ) ( not ( = ?auto_22138 ?auto_22145 ) ) ( not ( = ?auto_22138 ?auto_22147 ) ) ( not ( = ?auto_22144 ?auto_22146 ) ) ( not ( = ?auto_22144 ?auto_22148 ) ) ( not ( = ?auto_22140 ?auto_22149 ) ) ( not ( = ?auto_22140 ?auto_22150 ) ) ( not ( = ?auto_22139 ?auto_22145 ) ) ( not ( = ?auto_22139 ?auto_22147 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22135 ?auto_22136 ?auto_22137 )
      ( MAKE-1CRATE ?auto_22137 ?auto_22138 )
      ( MAKE-3CRATE-VERIFY ?auto_22135 ?auto_22136 ?auto_22137 ?auto_22138 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22153 - SURFACE
      ?auto_22154 - SURFACE
    )
    :vars
    (
      ?auto_22155 - HOIST
      ?auto_22156 - PLACE
      ?auto_22158 - PLACE
      ?auto_22159 - HOIST
      ?auto_22160 - SURFACE
      ?auto_22157 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22155 ?auto_22156 ) ( SURFACE-AT ?auto_22153 ?auto_22156 ) ( CLEAR ?auto_22153 ) ( IS-CRATE ?auto_22154 ) ( AVAILABLE ?auto_22155 ) ( not ( = ?auto_22158 ?auto_22156 ) ) ( HOIST-AT ?auto_22159 ?auto_22158 ) ( AVAILABLE ?auto_22159 ) ( SURFACE-AT ?auto_22154 ?auto_22158 ) ( ON ?auto_22154 ?auto_22160 ) ( CLEAR ?auto_22154 ) ( TRUCK-AT ?auto_22157 ?auto_22156 ) ( not ( = ?auto_22153 ?auto_22154 ) ) ( not ( = ?auto_22153 ?auto_22160 ) ) ( not ( = ?auto_22154 ?auto_22160 ) ) ( not ( = ?auto_22155 ?auto_22159 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22157 ?auto_22156 ?auto_22158 )
      ( !LIFT ?auto_22159 ?auto_22154 ?auto_22160 ?auto_22158 )
      ( !LOAD ?auto_22159 ?auto_22154 ?auto_22157 ?auto_22158 )
      ( !DRIVE ?auto_22157 ?auto_22158 ?auto_22156 )
      ( !UNLOAD ?auto_22155 ?auto_22154 ?auto_22157 ?auto_22156 )
      ( !DROP ?auto_22155 ?auto_22154 ?auto_22153 ?auto_22156 )
      ( MAKE-1CRATE-VERIFY ?auto_22153 ?auto_22154 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22166 - SURFACE
      ?auto_22167 - SURFACE
      ?auto_22168 - SURFACE
      ?auto_22169 - SURFACE
      ?auto_22170 - SURFACE
    )
    :vars
    (
      ?auto_22173 - HOIST
      ?auto_22175 - PLACE
      ?auto_22171 - PLACE
      ?auto_22174 - HOIST
      ?auto_22176 - SURFACE
      ?auto_22179 - PLACE
      ?auto_22182 - HOIST
      ?auto_22178 - SURFACE
      ?auto_22185 - PLACE
      ?auto_22177 - HOIST
      ?auto_22180 - SURFACE
      ?auto_22184 - PLACE
      ?auto_22183 - HOIST
      ?auto_22181 - SURFACE
      ?auto_22172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22173 ?auto_22175 ) ( IS-CRATE ?auto_22170 ) ( not ( = ?auto_22171 ?auto_22175 ) ) ( HOIST-AT ?auto_22174 ?auto_22171 ) ( AVAILABLE ?auto_22174 ) ( SURFACE-AT ?auto_22170 ?auto_22171 ) ( ON ?auto_22170 ?auto_22176 ) ( CLEAR ?auto_22170 ) ( not ( = ?auto_22169 ?auto_22170 ) ) ( not ( = ?auto_22169 ?auto_22176 ) ) ( not ( = ?auto_22170 ?auto_22176 ) ) ( not ( = ?auto_22173 ?auto_22174 ) ) ( IS-CRATE ?auto_22169 ) ( not ( = ?auto_22179 ?auto_22175 ) ) ( HOIST-AT ?auto_22182 ?auto_22179 ) ( AVAILABLE ?auto_22182 ) ( SURFACE-AT ?auto_22169 ?auto_22179 ) ( ON ?auto_22169 ?auto_22178 ) ( CLEAR ?auto_22169 ) ( not ( = ?auto_22168 ?auto_22169 ) ) ( not ( = ?auto_22168 ?auto_22178 ) ) ( not ( = ?auto_22169 ?auto_22178 ) ) ( not ( = ?auto_22173 ?auto_22182 ) ) ( IS-CRATE ?auto_22168 ) ( not ( = ?auto_22185 ?auto_22175 ) ) ( HOIST-AT ?auto_22177 ?auto_22185 ) ( AVAILABLE ?auto_22177 ) ( SURFACE-AT ?auto_22168 ?auto_22185 ) ( ON ?auto_22168 ?auto_22180 ) ( CLEAR ?auto_22168 ) ( not ( = ?auto_22167 ?auto_22168 ) ) ( not ( = ?auto_22167 ?auto_22180 ) ) ( not ( = ?auto_22168 ?auto_22180 ) ) ( not ( = ?auto_22173 ?auto_22177 ) ) ( SURFACE-AT ?auto_22166 ?auto_22175 ) ( CLEAR ?auto_22166 ) ( IS-CRATE ?auto_22167 ) ( AVAILABLE ?auto_22173 ) ( not ( = ?auto_22184 ?auto_22175 ) ) ( HOIST-AT ?auto_22183 ?auto_22184 ) ( AVAILABLE ?auto_22183 ) ( SURFACE-AT ?auto_22167 ?auto_22184 ) ( ON ?auto_22167 ?auto_22181 ) ( CLEAR ?auto_22167 ) ( TRUCK-AT ?auto_22172 ?auto_22175 ) ( not ( = ?auto_22166 ?auto_22167 ) ) ( not ( = ?auto_22166 ?auto_22181 ) ) ( not ( = ?auto_22167 ?auto_22181 ) ) ( not ( = ?auto_22173 ?auto_22183 ) ) ( not ( = ?auto_22166 ?auto_22168 ) ) ( not ( = ?auto_22166 ?auto_22180 ) ) ( not ( = ?auto_22168 ?auto_22181 ) ) ( not ( = ?auto_22185 ?auto_22184 ) ) ( not ( = ?auto_22177 ?auto_22183 ) ) ( not ( = ?auto_22180 ?auto_22181 ) ) ( not ( = ?auto_22166 ?auto_22169 ) ) ( not ( = ?auto_22166 ?auto_22178 ) ) ( not ( = ?auto_22167 ?auto_22169 ) ) ( not ( = ?auto_22167 ?auto_22178 ) ) ( not ( = ?auto_22169 ?auto_22180 ) ) ( not ( = ?auto_22169 ?auto_22181 ) ) ( not ( = ?auto_22179 ?auto_22185 ) ) ( not ( = ?auto_22179 ?auto_22184 ) ) ( not ( = ?auto_22182 ?auto_22177 ) ) ( not ( = ?auto_22182 ?auto_22183 ) ) ( not ( = ?auto_22178 ?auto_22180 ) ) ( not ( = ?auto_22178 ?auto_22181 ) ) ( not ( = ?auto_22166 ?auto_22170 ) ) ( not ( = ?auto_22166 ?auto_22176 ) ) ( not ( = ?auto_22167 ?auto_22170 ) ) ( not ( = ?auto_22167 ?auto_22176 ) ) ( not ( = ?auto_22168 ?auto_22170 ) ) ( not ( = ?auto_22168 ?auto_22176 ) ) ( not ( = ?auto_22170 ?auto_22178 ) ) ( not ( = ?auto_22170 ?auto_22180 ) ) ( not ( = ?auto_22170 ?auto_22181 ) ) ( not ( = ?auto_22171 ?auto_22179 ) ) ( not ( = ?auto_22171 ?auto_22185 ) ) ( not ( = ?auto_22171 ?auto_22184 ) ) ( not ( = ?auto_22174 ?auto_22182 ) ) ( not ( = ?auto_22174 ?auto_22177 ) ) ( not ( = ?auto_22174 ?auto_22183 ) ) ( not ( = ?auto_22176 ?auto_22178 ) ) ( not ( = ?auto_22176 ?auto_22180 ) ) ( not ( = ?auto_22176 ?auto_22181 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_22166 ?auto_22167 ?auto_22168 ?auto_22169 )
      ( MAKE-1CRATE ?auto_22169 ?auto_22170 )
      ( MAKE-4CRATE-VERIFY ?auto_22166 ?auto_22167 ?auto_22168 ?auto_22169 ?auto_22170 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22188 - SURFACE
      ?auto_22189 - SURFACE
    )
    :vars
    (
      ?auto_22190 - HOIST
      ?auto_22191 - PLACE
      ?auto_22193 - PLACE
      ?auto_22194 - HOIST
      ?auto_22195 - SURFACE
      ?auto_22192 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22190 ?auto_22191 ) ( SURFACE-AT ?auto_22188 ?auto_22191 ) ( CLEAR ?auto_22188 ) ( IS-CRATE ?auto_22189 ) ( AVAILABLE ?auto_22190 ) ( not ( = ?auto_22193 ?auto_22191 ) ) ( HOIST-AT ?auto_22194 ?auto_22193 ) ( AVAILABLE ?auto_22194 ) ( SURFACE-AT ?auto_22189 ?auto_22193 ) ( ON ?auto_22189 ?auto_22195 ) ( CLEAR ?auto_22189 ) ( TRUCK-AT ?auto_22192 ?auto_22191 ) ( not ( = ?auto_22188 ?auto_22189 ) ) ( not ( = ?auto_22188 ?auto_22195 ) ) ( not ( = ?auto_22189 ?auto_22195 ) ) ( not ( = ?auto_22190 ?auto_22194 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22192 ?auto_22191 ?auto_22193 )
      ( !LIFT ?auto_22194 ?auto_22189 ?auto_22195 ?auto_22193 )
      ( !LOAD ?auto_22194 ?auto_22189 ?auto_22192 ?auto_22193 )
      ( !DRIVE ?auto_22192 ?auto_22193 ?auto_22191 )
      ( !UNLOAD ?auto_22190 ?auto_22189 ?auto_22192 ?auto_22191 )
      ( !DROP ?auto_22190 ?auto_22189 ?auto_22188 ?auto_22191 )
      ( MAKE-1CRATE-VERIFY ?auto_22188 ?auto_22189 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22202 - SURFACE
      ?auto_22203 - SURFACE
      ?auto_22204 - SURFACE
      ?auto_22205 - SURFACE
      ?auto_22206 - SURFACE
      ?auto_22207 - SURFACE
    )
    :vars
    (
      ?auto_22208 - HOIST
      ?auto_22211 - PLACE
      ?auto_22209 - PLACE
      ?auto_22212 - HOIST
      ?auto_22210 - SURFACE
      ?auto_22215 - PLACE
      ?auto_22214 - HOIST
      ?auto_22222 - SURFACE
      ?auto_22217 - PLACE
      ?auto_22219 - HOIST
      ?auto_22216 - SURFACE
      ?auto_22220 - SURFACE
      ?auto_22221 - PLACE
      ?auto_22223 - HOIST
      ?auto_22218 - SURFACE
      ?auto_22213 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22208 ?auto_22211 ) ( IS-CRATE ?auto_22207 ) ( not ( = ?auto_22209 ?auto_22211 ) ) ( HOIST-AT ?auto_22212 ?auto_22209 ) ( SURFACE-AT ?auto_22207 ?auto_22209 ) ( ON ?auto_22207 ?auto_22210 ) ( CLEAR ?auto_22207 ) ( not ( = ?auto_22206 ?auto_22207 ) ) ( not ( = ?auto_22206 ?auto_22210 ) ) ( not ( = ?auto_22207 ?auto_22210 ) ) ( not ( = ?auto_22208 ?auto_22212 ) ) ( IS-CRATE ?auto_22206 ) ( not ( = ?auto_22215 ?auto_22211 ) ) ( HOIST-AT ?auto_22214 ?auto_22215 ) ( AVAILABLE ?auto_22214 ) ( SURFACE-AT ?auto_22206 ?auto_22215 ) ( ON ?auto_22206 ?auto_22222 ) ( CLEAR ?auto_22206 ) ( not ( = ?auto_22205 ?auto_22206 ) ) ( not ( = ?auto_22205 ?auto_22222 ) ) ( not ( = ?auto_22206 ?auto_22222 ) ) ( not ( = ?auto_22208 ?auto_22214 ) ) ( IS-CRATE ?auto_22205 ) ( not ( = ?auto_22217 ?auto_22211 ) ) ( HOIST-AT ?auto_22219 ?auto_22217 ) ( AVAILABLE ?auto_22219 ) ( SURFACE-AT ?auto_22205 ?auto_22217 ) ( ON ?auto_22205 ?auto_22216 ) ( CLEAR ?auto_22205 ) ( not ( = ?auto_22204 ?auto_22205 ) ) ( not ( = ?auto_22204 ?auto_22216 ) ) ( not ( = ?auto_22205 ?auto_22216 ) ) ( not ( = ?auto_22208 ?auto_22219 ) ) ( IS-CRATE ?auto_22204 ) ( AVAILABLE ?auto_22212 ) ( SURFACE-AT ?auto_22204 ?auto_22209 ) ( ON ?auto_22204 ?auto_22220 ) ( CLEAR ?auto_22204 ) ( not ( = ?auto_22203 ?auto_22204 ) ) ( not ( = ?auto_22203 ?auto_22220 ) ) ( not ( = ?auto_22204 ?auto_22220 ) ) ( SURFACE-AT ?auto_22202 ?auto_22211 ) ( CLEAR ?auto_22202 ) ( IS-CRATE ?auto_22203 ) ( AVAILABLE ?auto_22208 ) ( not ( = ?auto_22221 ?auto_22211 ) ) ( HOIST-AT ?auto_22223 ?auto_22221 ) ( AVAILABLE ?auto_22223 ) ( SURFACE-AT ?auto_22203 ?auto_22221 ) ( ON ?auto_22203 ?auto_22218 ) ( CLEAR ?auto_22203 ) ( TRUCK-AT ?auto_22213 ?auto_22211 ) ( not ( = ?auto_22202 ?auto_22203 ) ) ( not ( = ?auto_22202 ?auto_22218 ) ) ( not ( = ?auto_22203 ?auto_22218 ) ) ( not ( = ?auto_22208 ?auto_22223 ) ) ( not ( = ?auto_22202 ?auto_22204 ) ) ( not ( = ?auto_22202 ?auto_22220 ) ) ( not ( = ?auto_22204 ?auto_22218 ) ) ( not ( = ?auto_22209 ?auto_22221 ) ) ( not ( = ?auto_22212 ?auto_22223 ) ) ( not ( = ?auto_22220 ?auto_22218 ) ) ( not ( = ?auto_22202 ?auto_22205 ) ) ( not ( = ?auto_22202 ?auto_22216 ) ) ( not ( = ?auto_22203 ?auto_22205 ) ) ( not ( = ?auto_22203 ?auto_22216 ) ) ( not ( = ?auto_22205 ?auto_22220 ) ) ( not ( = ?auto_22205 ?auto_22218 ) ) ( not ( = ?auto_22217 ?auto_22209 ) ) ( not ( = ?auto_22217 ?auto_22221 ) ) ( not ( = ?auto_22219 ?auto_22212 ) ) ( not ( = ?auto_22219 ?auto_22223 ) ) ( not ( = ?auto_22216 ?auto_22220 ) ) ( not ( = ?auto_22216 ?auto_22218 ) ) ( not ( = ?auto_22202 ?auto_22206 ) ) ( not ( = ?auto_22202 ?auto_22222 ) ) ( not ( = ?auto_22203 ?auto_22206 ) ) ( not ( = ?auto_22203 ?auto_22222 ) ) ( not ( = ?auto_22204 ?auto_22206 ) ) ( not ( = ?auto_22204 ?auto_22222 ) ) ( not ( = ?auto_22206 ?auto_22216 ) ) ( not ( = ?auto_22206 ?auto_22220 ) ) ( not ( = ?auto_22206 ?auto_22218 ) ) ( not ( = ?auto_22215 ?auto_22217 ) ) ( not ( = ?auto_22215 ?auto_22209 ) ) ( not ( = ?auto_22215 ?auto_22221 ) ) ( not ( = ?auto_22214 ?auto_22219 ) ) ( not ( = ?auto_22214 ?auto_22212 ) ) ( not ( = ?auto_22214 ?auto_22223 ) ) ( not ( = ?auto_22222 ?auto_22216 ) ) ( not ( = ?auto_22222 ?auto_22220 ) ) ( not ( = ?auto_22222 ?auto_22218 ) ) ( not ( = ?auto_22202 ?auto_22207 ) ) ( not ( = ?auto_22202 ?auto_22210 ) ) ( not ( = ?auto_22203 ?auto_22207 ) ) ( not ( = ?auto_22203 ?auto_22210 ) ) ( not ( = ?auto_22204 ?auto_22207 ) ) ( not ( = ?auto_22204 ?auto_22210 ) ) ( not ( = ?auto_22205 ?auto_22207 ) ) ( not ( = ?auto_22205 ?auto_22210 ) ) ( not ( = ?auto_22207 ?auto_22222 ) ) ( not ( = ?auto_22207 ?auto_22216 ) ) ( not ( = ?auto_22207 ?auto_22220 ) ) ( not ( = ?auto_22207 ?auto_22218 ) ) ( not ( = ?auto_22210 ?auto_22222 ) ) ( not ( = ?auto_22210 ?auto_22216 ) ) ( not ( = ?auto_22210 ?auto_22220 ) ) ( not ( = ?auto_22210 ?auto_22218 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_22202 ?auto_22203 ?auto_22204 ?auto_22205 ?auto_22206 )
      ( MAKE-1CRATE ?auto_22206 ?auto_22207 )
      ( MAKE-5CRATE-VERIFY ?auto_22202 ?auto_22203 ?auto_22204 ?auto_22205 ?auto_22206 ?auto_22207 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22226 - SURFACE
      ?auto_22227 - SURFACE
    )
    :vars
    (
      ?auto_22228 - HOIST
      ?auto_22229 - PLACE
      ?auto_22231 - PLACE
      ?auto_22232 - HOIST
      ?auto_22233 - SURFACE
      ?auto_22230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22228 ?auto_22229 ) ( SURFACE-AT ?auto_22226 ?auto_22229 ) ( CLEAR ?auto_22226 ) ( IS-CRATE ?auto_22227 ) ( AVAILABLE ?auto_22228 ) ( not ( = ?auto_22231 ?auto_22229 ) ) ( HOIST-AT ?auto_22232 ?auto_22231 ) ( AVAILABLE ?auto_22232 ) ( SURFACE-AT ?auto_22227 ?auto_22231 ) ( ON ?auto_22227 ?auto_22233 ) ( CLEAR ?auto_22227 ) ( TRUCK-AT ?auto_22230 ?auto_22229 ) ( not ( = ?auto_22226 ?auto_22227 ) ) ( not ( = ?auto_22226 ?auto_22233 ) ) ( not ( = ?auto_22227 ?auto_22233 ) ) ( not ( = ?auto_22228 ?auto_22232 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22230 ?auto_22229 ?auto_22231 )
      ( !LIFT ?auto_22232 ?auto_22227 ?auto_22233 ?auto_22231 )
      ( !LOAD ?auto_22232 ?auto_22227 ?auto_22230 ?auto_22231 )
      ( !DRIVE ?auto_22230 ?auto_22231 ?auto_22229 )
      ( !UNLOAD ?auto_22228 ?auto_22227 ?auto_22230 ?auto_22229 )
      ( !DROP ?auto_22228 ?auto_22227 ?auto_22226 ?auto_22229 )
      ( MAKE-1CRATE-VERIFY ?auto_22226 ?auto_22227 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_22241 - SURFACE
      ?auto_22242 - SURFACE
      ?auto_22243 - SURFACE
      ?auto_22244 - SURFACE
      ?auto_22245 - SURFACE
      ?auto_22247 - SURFACE
      ?auto_22246 - SURFACE
    )
    :vars
    (
      ?auto_22250 - HOIST
      ?auto_22252 - PLACE
      ?auto_22253 - PLACE
      ?auto_22251 - HOIST
      ?auto_22248 - SURFACE
      ?auto_22254 - PLACE
      ?auto_22259 - HOIST
      ?auto_22260 - SURFACE
      ?auto_22258 - PLACE
      ?auto_22262 - HOIST
      ?auto_22256 - SURFACE
      ?auto_22257 - PLACE
      ?auto_22263 - HOIST
      ?auto_22266 - SURFACE
      ?auto_22261 - SURFACE
      ?auto_22264 - PLACE
      ?auto_22255 - HOIST
      ?auto_22265 - SURFACE
      ?auto_22249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22250 ?auto_22252 ) ( IS-CRATE ?auto_22246 ) ( not ( = ?auto_22253 ?auto_22252 ) ) ( HOIST-AT ?auto_22251 ?auto_22253 ) ( AVAILABLE ?auto_22251 ) ( SURFACE-AT ?auto_22246 ?auto_22253 ) ( ON ?auto_22246 ?auto_22248 ) ( CLEAR ?auto_22246 ) ( not ( = ?auto_22247 ?auto_22246 ) ) ( not ( = ?auto_22247 ?auto_22248 ) ) ( not ( = ?auto_22246 ?auto_22248 ) ) ( not ( = ?auto_22250 ?auto_22251 ) ) ( IS-CRATE ?auto_22247 ) ( not ( = ?auto_22254 ?auto_22252 ) ) ( HOIST-AT ?auto_22259 ?auto_22254 ) ( SURFACE-AT ?auto_22247 ?auto_22254 ) ( ON ?auto_22247 ?auto_22260 ) ( CLEAR ?auto_22247 ) ( not ( = ?auto_22245 ?auto_22247 ) ) ( not ( = ?auto_22245 ?auto_22260 ) ) ( not ( = ?auto_22247 ?auto_22260 ) ) ( not ( = ?auto_22250 ?auto_22259 ) ) ( IS-CRATE ?auto_22245 ) ( not ( = ?auto_22258 ?auto_22252 ) ) ( HOIST-AT ?auto_22262 ?auto_22258 ) ( AVAILABLE ?auto_22262 ) ( SURFACE-AT ?auto_22245 ?auto_22258 ) ( ON ?auto_22245 ?auto_22256 ) ( CLEAR ?auto_22245 ) ( not ( = ?auto_22244 ?auto_22245 ) ) ( not ( = ?auto_22244 ?auto_22256 ) ) ( not ( = ?auto_22245 ?auto_22256 ) ) ( not ( = ?auto_22250 ?auto_22262 ) ) ( IS-CRATE ?auto_22244 ) ( not ( = ?auto_22257 ?auto_22252 ) ) ( HOIST-AT ?auto_22263 ?auto_22257 ) ( AVAILABLE ?auto_22263 ) ( SURFACE-AT ?auto_22244 ?auto_22257 ) ( ON ?auto_22244 ?auto_22266 ) ( CLEAR ?auto_22244 ) ( not ( = ?auto_22243 ?auto_22244 ) ) ( not ( = ?auto_22243 ?auto_22266 ) ) ( not ( = ?auto_22244 ?auto_22266 ) ) ( not ( = ?auto_22250 ?auto_22263 ) ) ( IS-CRATE ?auto_22243 ) ( AVAILABLE ?auto_22259 ) ( SURFACE-AT ?auto_22243 ?auto_22254 ) ( ON ?auto_22243 ?auto_22261 ) ( CLEAR ?auto_22243 ) ( not ( = ?auto_22242 ?auto_22243 ) ) ( not ( = ?auto_22242 ?auto_22261 ) ) ( not ( = ?auto_22243 ?auto_22261 ) ) ( SURFACE-AT ?auto_22241 ?auto_22252 ) ( CLEAR ?auto_22241 ) ( IS-CRATE ?auto_22242 ) ( AVAILABLE ?auto_22250 ) ( not ( = ?auto_22264 ?auto_22252 ) ) ( HOIST-AT ?auto_22255 ?auto_22264 ) ( AVAILABLE ?auto_22255 ) ( SURFACE-AT ?auto_22242 ?auto_22264 ) ( ON ?auto_22242 ?auto_22265 ) ( CLEAR ?auto_22242 ) ( TRUCK-AT ?auto_22249 ?auto_22252 ) ( not ( = ?auto_22241 ?auto_22242 ) ) ( not ( = ?auto_22241 ?auto_22265 ) ) ( not ( = ?auto_22242 ?auto_22265 ) ) ( not ( = ?auto_22250 ?auto_22255 ) ) ( not ( = ?auto_22241 ?auto_22243 ) ) ( not ( = ?auto_22241 ?auto_22261 ) ) ( not ( = ?auto_22243 ?auto_22265 ) ) ( not ( = ?auto_22254 ?auto_22264 ) ) ( not ( = ?auto_22259 ?auto_22255 ) ) ( not ( = ?auto_22261 ?auto_22265 ) ) ( not ( = ?auto_22241 ?auto_22244 ) ) ( not ( = ?auto_22241 ?auto_22266 ) ) ( not ( = ?auto_22242 ?auto_22244 ) ) ( not ( = ?auto_22242 ?auto_22266 ) ) ( not ( = ?auto_22244 ?auto_22261 ) ) ( not ( = ?auto_22244 ?auto_22265 ) ) ( not ( = ?auto_22257 ?auto_22254 ) ) ( not ( = ?auto_22257 ?auto_22264 ) ) ( not ( = ?auto_22263 ?auto_22259 ) ) ( not ( = ?auto_22263 ?auto_22255 ) ) ( not ( = ?auto_22266 ?auto_22261 ) ) ( not ( = ?auto_22266 ?auto_22265 ) ) ( not ( = ?auto_22241 ?auto_22245 ) ) ( not ( = ?auto_22241 ?auto_22256 ) ) ( not ( = ?auto_22242 ?auto_22245 ) ) ( not ( = ?auto_22242 ?auto_22256 ) ) ( not ( = ?auto_22243 ?auto_22245 ) ) ( not ( = ?auto_22243 ?auto_22256 ) ) ( not ( = ?auto_22245 ?auto_22266 ) ) ( not ( = ?auto_22245 ?auto_22261 ) ) ( not ( = ?auto_22245 ?auto_22265 ) ) ( not ( = ?auto_22258 ?auto_22257 ) ) ( not ( = ?auto_22258 ?auto_22254 ) ) ( not ( = ?auto_22258 ?auto_22264 ) ) ( not ( = ?auto_22262 ?auto_22263 ) ) ( not ( = ?auto_22262 ?auto_22259 ) ) ( not ( = ?auto_22262 ?auto_22255 ) ) ( not ( = ?auto_22256 ?auto_22266 ) ) ( not ( = ?auto_22256 ?auto_22261 ) ) ( not ( = ?auto_22256 ?auto_22265 ) ) ( not ( = ?auto_22241 ?auto_22247 ) ) ( not ( = ?auto_22241 ?auto_22260 ) ) ( not ( = ?auto_22242 ?auto_22247 ) ) ( not ( = ?auto_22242 ?auto_22260 ) ) ( not ( = ?auto_22243 ?auto_22247 ) ) ( not ( = ?auto_22243 ?auto_22260 ) ) ( not ( = ?auto_22244 ?auto_22247 ) ) ( not ( = ?auto_22244 ?auto_22260 ) ) ( not ( = ?auto_22247 ?auto_22256 ) ) ( not ( = ?auto_22247 ?auto_22266 ) ) ( not ( = ?auto_22247 ?auto_22261 ) ) ( not ( = ?auto_22247 ?auto_22265 ) ) ( not ( = ?auto_22260 ?auto_22256 ) ) ( not ( = ?auto_22260 ?auto_22266 ) ) ( not ( = ?auto_22260 ?auto_22261 ) ) ( not ( = ?auto_22260 ?auto_22265 ) ) ( not ( = ?auto_22241 ?auto_22246 ) ) ( not ( = ?auto_22241 ?auto_22248 ) ) ( not ( = ?auto_22242 ?auto_22246 ) ) ( not ( = ?auto_22242 ?auto_22248 ) ) ( not ( = ?auto_22243 ?auto_22246 ) ) ( not ( = ?auto_22243 ?auto_22248 ) ) ( not ( = ?auto_22244 ?auto_22246 ) ) ( not ( = ?auto_22244 ?auto_22248 ) ) ( not ( = ?auto_22245 ?auto_22246 ) ) ( not ( = ?auto_22245 ?auto_22248 ) ) ( not ( = ?auto_22246 ?auto_22260 ) ) ( not ( = ?auto_22246 ?auto_22256 ) ) ( not ( = ?auto_22246 ?auto_22266 ) ) ( not ( = ?auto_22246 ?auto_22261 ) ) ( not ( = ?auto_22246 ?auto_22265 ) ) ( not ( = ?auto_22253 ?auto_22254 ) ) ( not ( = ?auto_22253 ?auto_22258 ) ) ( not ( = ?auto_22253 ?auto_22257 ) ) ( not ( = ?auto_22253 ?auto_22264 ) ) ( not ( = ?auto_22251 ?auto_22259 ) ) ( not ( = ?auto_22251 ?auto_22262 ) ) ( not ( = ?auto_22251 ?auto_22263 ) ) ( not ( = ?auto_22251 ?auto_22255 ) ) ( not ( = ?auto_22248 ?auto_22260 ) ) ( not ( = ?auto_22248 ?auto_22256 ) ) ( not ( = ?auto_22248 ?auto_22266 ) ) ( not ( = ?auto_22248 ?auto_22261 ) ) ( not ( = ?auto_22248 ?auto_22265 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_22241 ?auto_22242 ?auto_22243 ?auto_22244 ?auto_22245 ?auto_22247 )
      ( MAKE-1CRATE ?auto_22247 ?auto_22246 )
      ( MAKE-6CRATE-VERIFY ?auto_22241 ?auto_22242 ?auto_22243 ?auto_22244 ?auto_22245 ?auto_22247 ?auto_22246 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22269 - SURFACE
      ?auto_22270 - SURFACE
    )
    :vars
    (
      ?auto_22271 - HOIST
      ?auto_22272 - PLACE
      ?auto_22274 - PLACE
      ?auto_22275 - HOIST
      ?auto_22276 - SURFACE
      ?auto_22273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22271 ?auto_22272 ) ( SURFACE-AT ?auto_22269 ?auto_22272 ) ( CLEAR ?auto_22269 ) ( IS-CRATE ?auto_22270 ) ( AVAILABLE ?auto_22271 ) ( not ( = ?auto_22274 ?auto_22272 ) ) ( HOIST-AT ?auto_22275 ?auto_22274 ) ( AVAILABLE ?auto_22275 ) ( SURFACE-AT ?auto_22270 ?auto_22274 ) ( ON ?auto_22270 ?auto_22276 ) ( CLEAR ?auto_22270 ) ( TRUCK-AT ?auto_22273 ?auto_22272 ) ( not ( = ?auto_22269 ?auto_22270 ) ) ( not ( = ?auto_22269 ?auto_22276 ) ) ( not ( = ?auto_22270 ?auto_22276 ) ) ( not ( = ?auto_22271 ?auto_22275 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22273 ?auto_22272 ?auto_22274 )
      ( !LIFT ?auto_22275 ?auto_22270 ?auto_22276 ?auto_22274 )
      ( !LOAD ?auto_22275 ?auto_22270 ?auto_22273 ?auto_22274 )
      ( !DRIVE ?auto_22273 ?auto_22274 ?auto_22272 )
      ( !UNLOAD ?auto_22271 ?auto_22270 ?auto_22273 ?auto_22272 )
      ( !DROP ?auto_22271 ?auto_22270 ?auto_22269 ?auto_22272 )
      ( MAKE-1CRATE-VERIFY ?auto_22269 ?auto_22270 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_22285 - SURFACE
      ?auto_22286 - SURFACE
      ?auto_22287 - SURFACE
      ?auto_22288 - SURFACE
      ?auto_22289 - SURFACE
      ?auto_22291 - SURFACE
      ?auto_22290 - SURFACE
      ?auto_22292 - SURFACE
    )
    :vars
    (
      ?auto_22294 - HOIST
      ?auto_22295 - PLACE
      ?auto_22297 - PLACE
      ?auto_22296 - HOIST
      ?auto_22298 - SURFACE
      ?auto_22309 - PLACE
      ?auto_22301 - HOIST
      ?auto_22300 - SURFACE
      ?auto_22303 - PLACE
      ?auto_22314 - HOIST
      ?auto_22313 - SURFACE
      ?auto_22308 - PLACE
      ?auto_22311 - HOIST
      ?auto_22310 - SURFACE
      ?auto_22299 - PLACE
      ?auto_22305 - HOIST
      ?auto_22307 - SURFACE
      ?auto_22312 - SURFACE
      ?auto_22304 - PLACE
      ?auto_22302 - HOIST
      ?auto_22306 - SURFACE
      ?auto_22293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22294 ?auto_22295 ) ( IS-CRATE ?auto_22292 ) ( not ( = ?auto_22297 ?auto_22295 ) ) ( HOIST-AT ?auto_22296 ?auto_22297 ) ( AVAILABLE ?auto_22296 ) ( SURFACE-AT ?auto_22292 ?auto_22297 ) ( ON ?auto_22292 ?auto_22298 ) ( CLEAR ?auto_22292 ) ( not ( = ?auto_22290 ?auto_22292 ) ) ( not ( = ?auto_22290 ?auto_22298 ) ) ( not ( = ?auto_22292 ?auto_22298 ) ) ( not ( = ?auto_22294 ?auto_22296 ) ) ( IS-CRATE ?auto_22290 ) ( not ( = ?auto_22309 ?auto_22295 ) ) ( HOIST-AT ?auto_22301 ?auto_22309 ) ( AVAILABLE ?auto_22301 ) ( SURFACE-AT ?auto_22290 ?auto_22309 ) ( ON ?auto_22290 ?auto_22300 ) ( CLEAR ?auto_22290 ) ( not ( = ?auto_22291 ?auto_22290 ) ) ( not ( = ?auto_22291 ?auto_22300 ) ) ( not ( = ?auto_22290 ?auto_22300 ) ) ( not ( = ?auto_22294 ?auto_22301 ) ) ( IS-CRATE ?auto_22291 ) ( not ( = ?auto_22303 ?auto_22295 ) ) ( HOIST-AT ?auto_22314 ?auto_22303 ) ( SURFACE-AT ?auto_22291 ?auto_22303 ) ( ON ?auto_22291 ?auto_22313 ) ( CLEAR ?auto_22291 ) ( not ( = ?auto_22289 ?auto_22291 ) ) ( not ( = ?auto_22289 ?auto_22313 ) ) ( not ( = ?auto_22291 ?auto_22313 ) ) ( not ( = ?auto_22294 ?auto_22314 ) ) ( IS-CRATE ?auto_22289 ) ( not ( = ?auto_22308 ?auto_22295 ) ) ( HOIST-AT ?auto_22311 ?auto_22308 ) ( AVAILABLE ?auto_22311 ) ( SURFACE-AT ?auto_22289 ?auto_22308 ) ( ON ?auto_22289 ?auto_22310 ) ( CLEAR ?auto_22289 ) ( not ( = ?auto_22288 ?auto_22289 ) ) ( not ( = ?auto_22288 ?auto_22310 ) ) ( not ( = ?auto_22289 ?auto_22310 ) ) ( not ( = ?auto_22294 ?auto_22311 ) ) ( IS-CRATE ?auto_22288 ) ( not ( = ?auto_22299 ?auto_22295 ) ) ( HOIST-AT ?auto_22305 ?auto_22299 ) ( AVAILABLE ?auto_22305 ) ( SURFACE-AT ?auto_22288 ?auto_22299 ) ( ON ?auto_22288 ?auto_22307 ) ( CLEAR ?auto_22288 ) ( not ( = ?auto_22287 ?auto_22288 ) ) ( not ( = ?auto_22287 ?auto_22307 ) ) ( not ( = ?auto_22288 ?auto_22307 ) ) ( not ( = ?auto_22294 ?auto_22305 ) ) ( IS-CRATE ?auto_22287 ) ( AVAILABLE ?auto_22314 ) ( SURFACE-AT ?auto_22287 ?auto_22303 ) ( ON ?auto_22287 ?auto_22312 ) ( CLEAR ?auto_22287 ) ( not ( = ?auto_22286 ?auto_22287 ) ) ( not ( = ?auto_22286 ?auto_22312 ) ) ( not ( = ?auto_22287 ?auto_22312 ) ) ( SURFACE-AT ?auto_22285 ?auto_22295 ) ( CLEAR ?auto_22285 ) ( IS-CRATE ?auto_22286 ) ( AVAILABLE ?auto_22294 ) ( not ( = ?auto_22304 ?auto_22295 ) ) ( HOIST-AT ?auto_22302 ?auto_22304 ) ( AVAILABLE ?auto_22302 ) ( SURFACE-AT ?auto_22286 ?auto_22304 ) ( ON ?auto_22286 ?auto_22306 ) ( CLEAR ?auto_22286 ) ( TRUCK-AT ?auto_22293 ?auto_22295 ) ( not ( = ?auto_22285 ?auto_22286 ) ) ( not ( = ?auto_22285 ?auto_22306 ) ) ( not ( = ?auto_22286 ?auto_22306 ) ) ( not ( = ?auto_22294 ?auto_22302 ) ) ( not ( = ?auto_22285 ?auto_22287 ) ) ( not ( = ?auto_22285 ?auto_22312 ) ) ( not ( = ?auto_22287 ?auto_22306 ) ) ( not ( = ?auto_22303 ?auto_22304 ) ) ( not ( = ?auto_22314 ?auto_22302 ) ) ( not ( = ?auto_22312 ?auto_22306 ) ) ( not ( = ?auto_22285 ?auto_22288 ) ) ( not ( = ?auto_22285 ?auto_22307 ) ) ( not ( = ?auto_22286 ?auto_22288 ) ) ( not ( = ?auto_22286 ?auto_22307 ) ) ( not ( = ?auto_22288 ?auto_22312 ) ) ( not ( = ?auto_22288 ?auto_22306 ) ) ( not ( = ?auto_22299 ?auto_22303 ) ) ( not ( = ?auto_22299 ?auto_22304 ) ) ( not ( = ?auto_22305 ?auto_22314 ) ) ( not ( = ?auto_22305 ?auto_22302 ) ) ( not ( = ?auto_22307 ?auto_22312 ) ) ( not ( = ?auto_22307 ?auto_22306 ) ) ( not ( = ?auto_22285 ?auto_22289 ) ) ( not ( = ?auto_22285 ?auto_22310 ) ) ( not ( = ?auto_22286 ?auto_22289 ) ) ( not ( = ?auto_22286 ?auto_22310 ) ) ( not ( = ?auto_22287 ?auto_22289 ) ) ( not ( = ?auto_22287 ?auto_22310 ) ) ( not ( = ?auto_22289 ?auto_22307 ) ) ( not ( = ?auto_22289 ?auto_22312 ) ) ( not ( = ?auto_22289 ?auto_22306 ) ) ( not ( = ?auto_22308 ?auto_22299 ) ) ( not ( = ?auto_22308 ?auto_22303 ) ) ( not ( = ?auto_22308 ?auto_22304 ) ) ( not ( = ?auto_22311 ?auto_22305 ) ) ( not ( = ?auto_22311 ?auto_22314 ) ) ( not ( = ?auto_22311 ?auto_22302 ) ) ( not ( = ?auto_22310 ?auto_22307 ) ) ( not ( = ?auto_22310 ?auto_22312 ) ) ( not ( = ?auto_22310 ?auto_22306 ) ) ( not ( = ?auto_22285 ?auto_22291 ) ) ( not ( = ?auto_22285 ?auto_22313 ) ) ( not ( = ?auto_22286 ?auto_22291 ) ) ( not ( = ?auto_22286 ?auto_22313 ) ) ( not ( = ?auto_22287 ?auto_22291 ) ) ( not ( = ?auto_22287 ?auto_22313 ) ) ( not ( = ?auto_22288 ?auto_22291 ) ) ( not ( = ?auto_22288 ?auto_22313 ) ) ( not ( = ?auto_22291 ?auto_22310 ) ) ( not ( = ?auto_22291 ?auto_22307 ) ) ( not ( = ?auto_22291 ?auto_22312 ) ) ( not ( = ?auto_22291 ?auto_22306 ) ) ( not ( = ?auto_22313 ?auto_22310 ) ) ( not ( = ?auto_22313 ?auto_22307 ) ) ( not ( = ?auto_22313 ?auto_22312 ) ) ( not ( = ?auto_22313 ?auto_22306 ) ) ( not ( = ?auto_22285 ?auto_22290 ) ) ( not ( = ?auto_22285 ?auto_22300 ) ) ( not ( = ?auto_22286 ?auto_22290 ) ) ( not ( = ?auto_22286 ?auto_22300 ) ) ( not ( = ?auto_22287 ?auto_22290 ) ) ( not ( = ?auto_22287 ?auto_22300 ) ) ( not ( = ?auto_22288 ?auto_22290 ) ) ( not ( = ?auto_22288 ?auto_22300 ) ) ( not ( = ?auto_22289 ?auto_22290 ) ) ( not ( = ?auto_22289 ?auto_22300 ) ) ( not ( = ?auto_22290 ?auto_22313 ) ) ( not ( = ?auto_22290 ?auto_22310 ) ) ( not ( = ?auto_22290 ?auto_22307 ) ) ( not ( = ?auto_22290 ?auto_22312 ) ) ( not ( = ?auto_22290 ?auto_22306 ) ) ( not ( = ?auto_22309 ?auto_22303 ) ) ( not ( = ?auto_22309 ?auto_22308 ) ) ( not ( = ?auto_22309 ?auto_22299 ) ) ( not ( = ?auto_22309 ?auto_22304 ) ) ( not ( = ?auto_22301 ?auto_22314 ) ) ( not ( = ?auto_22301 ?auto_22311 ) ) ( not ( = ?auto_22301 ?auto_22305 ) ) ( not ( = ?auto_22301 ?auto_22302 ) ) ( not ( = ?auto_22300 ?auto_22313 ) ) ( not ( = ?auto_22300 ?auto_22310 ) ) ( not ( = ?auto_22300 ?auto_22307 ) ) ( not ( = ?auto_22300 ?auto_22312 ) ) ( not ( = ?auto_22300 ?auto_22306 ) ) ( not ( = ?auto_22285 ?auto_22292 ) ) ( not ( = ?auto_22285 ?auto_22298 ) ) ( not ( = ?auto_22286 ?auto_22292 ) ) ( not ( = ?auto_22286 ?auto_22298 ) ) ( not ( = ?auto_22287 ?auto_22292 ) ) ( not ( = ?auto_22287 ?auto_22298 ) ) ( not ( = ?auto_22288 ?auto_22292 ) ) ( not ( = ?auto_22288 ?auto_22298 ) ) ( not ( = ?auto_22289 ?auto_22292 ) ) ( not ( = ?auto_22289 ?auto_22298 ) ) ( not ( = ?auto_22291 ?auto_22292 ) ) ( not ( = ?auto_22291 ?auto_22298 ) ) ( not ( = ?auto_22292 ?auto_22300 ) ) ( not ( = ?auto_22292 ?auto_22313 ) ) ( not ( = ?auto_22292 ?auto_22310 ) ) ( not ( = ?auto_22292 ?auto_22307 ) ) ( not ( = ?auto_22292 ?auto_22312 ) ) ( not ( = ?auto_22292 ?auto_22306 ) ) ( not ( = ?auto_22297 ?auto_22309 ) ) ( not ( = ?auto_22297 ?auto_22303 ) ) ( not ( = ?auto_22297 ?auto_22308 ) ) ( not ( = ?auto_22297 ?auto_22299 ) ) ( not ( = ?auto_22297 ?auto_22304 ) ) ( not ( = ?auto_22296 ?auto_22301 ) ) ( not ( = ?auto_22296 ?auto_22314 ) ) ( not ( = ?auto_22296 ?auto_22311 ) ) ( not ( = ?auto_22296 ?auto_22305 ) ) ( not ( = ?auto_22296 ?auto_22302 ) ) ( not ( = ?auto_22298 ?auto_22300 ) ) ( not ( = ?auto_22298 ?auto_22313 ) ) ( not ( = ?auto_22298 ?auto_22310 ) ) ( not ( = ?auto_22298 ?auto_22307 ) ) ( not ( = ?auto_22298 ?auto_22312 ) ) ( not ( = ?auto_22298 ?auto_22306 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_22285 ?auto_22286 ?auto_22287 ?auto_22288 ?auto_22289 ?auto_22291 ?auto_22290 )
      ( MAKE-1CRATE ?auto_22290 ?auto_22292 )
      ( MAKE-7CRATE-VERIFY ?auto_22285 ?auto_22286 ?auto_22287 ?auto_22288 ?auto_22289 ?auto_22291 ?auto_22290 ?auto_22292 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22317 - SURFACE
      ?auto_22318 - SURFACE
    )
    :vars
    (
      ?auto_22319 - HOIST
      ?auto_22320 - PLACE
      ?auto_22322 - PLACE
      ?auto_22323 - HOIST
      ?auto_22324 - SURFACE
      ?auto_22321 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22319 ?auto_22320 ) ( SURFACE-AT ?auto_22317 ?auto_22320 ) ( CLEAR ?auto_22317 ) ( IS-CRATE ?auto_22318 ) ( AVAILABLE ?auto_22319 ) ( not ( = ?auto_22322 ?auto_22320 ) ) ( HOIST-AT ?auto_22323 ?auto_22322 ) ( AVAILABLE ?auto_22323 ) ( SURFACE-AT ?auto_22318 ?auto_22322 ) ( ON ?auto_22318 ?auto_22324 ) ( CLEAR ?auto_22318 ) ( TRUCK-AT ?auto_22321 ?auto_22320 ) ( not ( = ?auto_22317 ?auto_22318 ) ) ( not ( = ?auto_22317 ?auto_22324 ) ) ( not ( = ?auto_22318 ?auto_22324 ) ) ( not ( = ?auto_22319 ?auto_22323 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22321 ?auto_22320 ?auto_22322 )
      ( !LIFT ?auto_22323 ?auto_22318 ?auto_22324 ?auto_22322 )
      ( !LOAD ?auto_22323 ?auto_22318 ?auto_22321 ?auto_22322 )
      ( !DRIVE ?auto_22321 ?auto_22322 ?auto_22320 )
      ( !UNLOAD ?auto_22319 ?auto_22318 ?auto_22321 ?auto_22320 )
      ( !DROP ?auto_22319 ?auto_22318 ?auto_22317 ?auto_22320 )
      ( MAKE-1CRATE-VERIFY ?auto_22317 ?auto_22318 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_22334 - SURFACE
      ?auto_22335 - SURFACE
      ?auto_22336 - SURFACE
      ?auto_22337 - SURFACE
      ?auto_22338 - SURFACE
      ?auto_22340 - SURFACE
      ?auto_22339 - SURFACE
      ?auto_22342 - SURFACE
      ?auto_22341 - SURFACE
    )
    :vars
    (
      ?auto_22343 - HOIST
      ?auto_22345 - PLACE
      ?auto_22347 - PLACE
      ?auto_22348 - HOIST
      ?auto_22346 - SURFACE
      ?auto_22367 - PLACE
      ?auto_22354 - HOIST
      ?auto_22353 - SURFACE
      ?auto_22364 - PLACE
      ?auto_22357 - HOIST
      ?auto_22366 - SURFACE
      ?auto_22356 - PLACE
      ?auto_22352 - HOIST
      ?auto_22349 - SURFACE
      ?auto_22359 - PLACE
      ?auto_22360 - HOIST
      ?auto_22365 - SURFACE
      ?auto_22350 - PLACE
      ?auto_22363 - HOIST
      ?auto_22351 - SURFACE
      ?auto_22361 - SURFACE
      ?auto_22355 - PLACE
      ?auto_22358 - HOIST
      ?auto_22362 - SURFACE
      ?auto_22344 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22343 ?auto_22345 ) ( IS-CRATE ?auto_22341 ) ( not ( = ?auto_22347 ?auto_22345 ) ) ( HOIST-AT ?auto_22348 ?auto_22347 ) ( AVAILABLE ?auto_22348 ) ( SURFACE-AT ?auto_22341 ?auto_22347 ) ( ON ?auto_22341 ?auto_22346 ) ( CLEAR ?auto_22341 ) ( not ( = ?auto_22342 ?auto_22341 ) ) ( not ( = ?auto_22342 ?auto_22346 ) ) ( not ( = ?auto_22341 ?auto_22346 ) ) ( not ( = ?auto_22343 ?auto_22348 ) ) ( IS-CRATE ?auto_22342 ) ( not ( = ?auto_22367 ?auto_22345 ) ) ( HOIST-AT ?auto_22354 ?auto_22367 ) ( AVAILABLE ?auto_22354 ) ( SURFACE-AT ?auto_22342 ?auto_22367 ) ( ON ?auto_22342 ?auto_22353 ) ( CLEAR ?auto_22342 ) ( not ( = ?auto_22339 ?auto_22342 ) ) ( not ( = ?auto_22339 ?auto_22353 ) ) ( not ( = ?auto_22342 ?auto_22353 ) ) ( not ( = ?auto_22343 ?auto_22354 ) ) ( IS-CRATE ?auto_22339 ) ( not ( = ?auto_22364 ?auto_22345 ) ) ( HOIST-AT ?auto_22357 ?auto_22364 ) ( AVAILABLE ?auto_22357 ) ( SURFACE-AT ?auto_22339 ?auto_22364 ) ( ON ?auto_22339 ?auto_22366 ) ( CLEAR ?auto_22339 ) ( not ( = ?auto_22340 ?auto_22339 ) ) ( not ( = ?auto_22340 ?auto_22366 ) ) ( not ( = ?auto_22339 ?auto_22366 ) ) ( not ( = ?auto_22343 ?auto_22357 ) ) ( IS-CRATE ?auto_22340 ) ( not ( = ?auto_22356 ?auto_22345 ) ) ( HOIST-AT ?auto_22352 ?auto_22356 ) ( SURFACE-AT ?auto_22340 ?auto_22356 ) ( ON ?auto_22340 ?auto_22349 ) ( CLEAR ?auto_22340 ) ( not ( = ?auto_22338 ?auto_22340 ) ) ( not ( = ?auto_22338 ?auto_22349 ) ) ( not ( = ?auto_22340 ?auto_22349 ) ) ( not ( = ?auto_22343 ?auto_22352 ) ) ( IS-CRATE ?auto_22338 ) ( not ( = ?auto_22359 ?auto_22345 ) ) ( HOIST-AT ?auto_22360 ?auto_22359 ) ( AVAILABLE ?auto_22360 ) ( SURFACE-AT ?auto_22338 ?auto_22359 ) ( ON ?auto_22338 ?auto_22365 ) ( CLEAR ?auto_22338 ) ( not ( = ?auto_22337 ?auto_22338 ) ) ( not ( = ?auto_22337 ?auto_22365 ) ) ( not ( = ?auto_22338 ?auto_22365 ) ) ( not ( = ?auto_22343 ?auto_22360 ) ) ( IS-CRATE ?auto_22337 ) ( not ( = ?auto_22350 ?auto_22345 ) ) ( HOIST-AT ?auto_22363 ?auto_22350 ) ( AVAILABLE ?auto_22363 ) ( SURFACE-AT ?auto_22337 ?auto_22350 ) ( ON ?auto_22337 ?auto_22351 ) ( CLEAR ?auto_22337 ) ( not ( = ?auto_22336 ?auto_22337 ) ) ( not ( = ?auto_22336 ?auto_22351 ) ) ( not ( = ?auto_22337 ?auto_22351 ) ) ( not ( = ?auto_22343 ?auto_22363 ) ) ( IS-CRATE ?auto_22336 ) ( AVAILABLE ?auto_22352 ) ( SURFACE-AT ?auto_22336 ?auto_22356 ) ( ON ?auto_22336 ?auto_22361 ) ( CLEAR ?auto_22336 ) ( not ( = ?auto_22335 ?auto_22336 ) ) ( not ( = ?auto_22335 ?auto_22361 ) ) ( not ( = ?auto_22336 ?auto_22361 ) ) ( SURFACE-AT ?auto_22334 ?auto_22345 ) ( CLEAR ?auto_22334 ) ( IS-CRATE ?auto_22335 ) ( AVAILABLE ?auto_22343 ) ( not ( = ?auto_22355 ?auto_22345 ) ) ( HOIST-AT ?auto_22358 ?auto_22355 ) ( AVAILABLE ?auto_22358 ) ( SURFACE-AT ?auto_22335 ?auto_22355 ) ( ON ?auto_22335 ?auto_22362 ) ( CLEAR ?auto_22335 ) ( TRUCK-AT ?auto_22344 ?auto_22345 ) ( not ( = ?auto_22334 ?auto_22335 ) ) ( not ( = ?auto_22334 ?auto_22362 ) ) ( not ( = ?auto_22335 ?auto_22362 ) ) ( not ( = ?auto_22343 ?auto_22358 ) ) ( not ( = ?auto_22334 ?auto_22336 ) ) ( not ( = ?auto_22334 ?auto_22361 ) ) ( not ( = ?auto_22336 ?auto_22362 ) ) ( not ( = ?auto_22356 ?auto_22355 ) ) ( not ( = ?auto_22352 ?auto_22358 ) ) ( not ( = ?auto_22361 ?auto_22362 ) ) ( not ( = ?auto_22334 ?auto_22337 ) ) ( not ( = ?auto_22334 ?auto_22351 ) ) ( not ( = ?auto_22335 ?auto_22337 ) ) ( not ( = ?auto_22335 ?auto_22351 ) ) ( not ( = ?auto_22337 ?auto_22361 ) ) ( not ( = ?auto_22337 ?auto_22362 ) ) ( not ( = ?auto_22350 ?auto_22356 ) ) ( not ( = ?auto_22350 ?auto_22355 ) ) ( not ( = ?auto_22363 ?auto_22352 ) ) ( not ( = ?auto_22363 ?auto_22358 ) ) ( not ( = ?auto_22351 ?auto_22361 ) ) ( not ( = ?auto_22351 ?auto_22362 ) ) ( not ( = ?auto_22334 ?auto_22338 ) ) ( not ( = ?auto_22334 ?auto_22365 ) ) ( not ( = ?auto_22335 ?auto_22338 ) ) ( not ( = ?auto_22335 ?auto_22365 ) ) ( not ( = ?auto_22336 ?auto_22338 ) ) ( not ( = ?auto_22336 ?auto_22365 ) ) ( not ( = ?auto_22338 ?auto_22351 ) ) ( not ( = ?auto_22338 ?auto_22361 ) ) ( not ( = ?auto_22338 ?auto_22362 ) ) ( not ( = ?auto_22359 ?auto_22350 ) ) ( not ( = ?auto_22359 ?auto_22356 ) ) ( not ( = ?auto_22359 ?auto_22355 ) ) ( not ( = ?auto_22360 ?auto_22363 ) ) ( not ( = ?auto_22360 ?auto_22352 ) ) ( not ( = ?auto_22360 ?auto_22358 ) ) ( not ( = ?auto_22365 ?auto_22351 ) ) ( not ( = ?auto_22365 ?auto_22361 ) ) ( not ( = ?auto_22365 ?auto_22362 ) ) ( not ( = ?auto_22334 ?auto_22340 ) ) ( not ( = ?auto_22334 ?auto_22349 ) ) ( not ( = ?auto_22335 ?auto_22340 ) ) ( not ( = ?auto_22335 ?auto_22349 ) ) ( not ( = ?auto_22336 ?auto_22340 ) ) ( not ( = ?auto_22336 ?auto_22349 ) ) ( not ( = ?auto_22337 ?auto_22340 ) ) ( not ( = ?auto_22337 ?auto_22349 ) ) ( not ( = ?auto_22340 ?auto_22365 ) ) ( not ( = ?auto_22340 ?auto_22351 ) ) ( not ( = ?auto_22340 ?auto_22361 ) ) ( not ( = ?auto_22340 ?auto_22362 ) ) ( not ( = ?auto_22349 ?auto_22365 ) ) ( not ( = ?auto_22349 ?auto_22351 ) ) ( not ( = ?auto_22349 ?auto_22361 ) ) ( not ( = ?auto_22349 ?auto_22362 ) ) ( not ( = ?auto_22334 ?auto_22339 ) ) ( not ( = ?auto_22334 ?auto_22366 ) ) ( not ( = ?auto_22335 ?auto_22339 ) ) ( not ( = ?auto_22335 ?auto_22366 ) ) ( not ( = ?auto_22336 ?auto_22339 ) ) ( not ( = ?auto_22336 ?auto_22366 ) ) ( not ( = ?auto_22337 ?auto_22339 ) ) ( not ( = ?auto_22337 ?auto_22366 ) ) ( not ( = ?auto_22338 ?auto_22339 ) ) ( not ( = ?auto_22338 ?auto_22366 ) ) ( not ( = ?auto_22339 ?auto_22349 ) ) ( not ( = ?auto_22339 ?auto_22365 ) ) ( not ( = ?auto_22339 ?auto_22351 ) ) ( not ( = ?auto_22339 ?auto_22361 ) ) ( not ( = ?auto_22339 ?auto_22362 ) ) ( not ( = ?auto_22364 ?auto_22356 ) ) ( not ( = ?auto_22364 ?auto_22359 ) ) ( not ( = ?auto_22364 ?auto_22350 ) ) ( not ( = ?auto_22364 ?auto_22355 ) ) ( not ( = ?auto_22357 ?auto_22352 ) ) ( not ( = ?auto_22357 ?auto_22360 ) ) ( not ( = ?auto_22357 ?auto_22363 ) ) ( not ( = ?auto_22357 ?auto_22358 ) ) ( not ( = ?auto_22366 ?auto_22349 ) ) ( not ( = ?auto_22366 ?auto_22365 ) ) ( not ( = ?auto_22366 ?auto_22351 ) ) ( not ( = ?auto_22366 ?auto_22361 ) ) ( not ( = ?auto_22366 ?auto_22362 ) ) ( not ( = ?auto_22334 ?auto_22342 ) ) ( not ( = ?auto_22334 ?auto_22353 ) ) ( not ( = ?auto_22335 ?auto_22342 ) ) ( not ( = ?auto_22335 ?auto_22353 ) ) ( not ( = ?auto_22336 ?auto_22342 ) ) ( not ( = ?auto_22336 ?auto_22353 ) ) ( not ( = ?auto_22337 ?auto_22342 ) ) ( not ( = ?auto_22337 ?auto_22353 ) ) ( not ( = ?auto_22338 ?auto_22342 ) ) ( not ( = ?auto_22338 ?auto_22353 ) ) ( not ( = ?auto_22340 ?auto_22342 ) ) ( not ( = ?auto_22340 ?auto_22353 ) ) ( not ( = ?auto_22342 ?auto_22366 ) ) ( not ( = ?auto_22342 ?auto_22349 ) ) ( not ( = ?auto_22342 ?auto_22365 ) ) ( not ( = ?auto_22342 ?auto_22351 ) ) ( not ( = ?auto_22342 ?auto_22361 ) ) ( not ( = ?auto_22342 ?auto_22362 ) ) ( not ( = ?auto_22367 ?auto_22364 ) ) ( not ( = ?auto_22367 ?auto_22356 ) ) ( not ( = ?auto_22367 ?auto_22359 ) ) ( not ( = ?auto_22367 ?auto_22350 ) ) ( not ( = ?auto_22367 ?auto_22355 ) ) ( not ( = ?auto_22354 ?auto_22357 ) ) ( not ( = ?auto_22354 ?auto_22352 ) ) ( not ( = ?auto_22354 ?auto_22360 ) ) ( not ( = ?auto_22354 ?auto_22363 ) ) ( not ( = ?auto_22354 ?auto_22358 ) ) ( not ( = ?auto_22353 ?auto_22366 ) ) ( not ( = ?auto_22353 ?auto_22349 ) ) ( not ( = ?auto_22353 ?auto_22365 ) ) ( not ( = ?auto_22353 ?auto_22351 ) ) ( not ( = ?auto_22353 ?auto_22361 ) ) ( not ( = ?auto_22353 ?auto_22362 ) ) ( not ( = ?auto_22334 ?auto_22341 ) ) ( not ( = ?auto_22334 ?auto_22346 ) ) ( not ( = ?auto_22335 ?auto_22341 ) ) ( not ( = ?auto_22335 ?auto_22346 ) ) ( not ( = ?auto_22336 ?auto_22341 ) ) ( not ( = ?auto_22336 ?auto_22346 ) ) ( not ( = ?auto_22337 ?auto_22341 ) ) ( not ( = ?auto_22337 ?auto_22346 ) ) ( not ( = ?auto_22338 ?auto_22341 ) ) ( not ( = ?auto_22338 ?auto_22346 ) ) ( not ( = ?auto_22340 ?auto_22341 ) ) ( not ( = ?auto_22340 ?auto_22346 ) ) ( not ( = ?auto_22339 ?auto_22341 ) ) ( not ( = ?auto_22339 ?auto_22346 ) ) ( not ( = ?auto_22341 ?auto_22353 ) ) ( not ( = ?auto_22341 ?auto_22366 ) ) ( not ( = ?auto_22341 ?auto_22349 ) ) ( not ( = ?auto_22341 ?auto_22365 ) ) ( not ( = ?auto_22341 ?auto_22351 ) ) ( not ( = ?auto_22341 ?auto_22361 ) ) ( not ( = ?auto_22341 ?auto_22362 ) ) ( not ( = ?auto_22347 ?auto_22367 ) ) ( not ( = ?auto_22347 ?auto_22364 ) ) ( not ( = ?auto_22347 ?auto_22356 ) ) ( not ( = ?auto_22347 ?auto_22359 ) ) ( not ( = ?auto_22347 ?auto_22350 ) ) ( not ( = ?auto_22347 ?auto_22355 ) ) ( not ( = ?auto_22348 ?auto_22354 ) ) ( not ( = ?auto_22348 ?auto_22357 ) ) ( not ( = ?auto_22348 ?auto_22352 ) ) ( not ( = ?auto_22348 ?auto_22360 ) ) ( not ( = ?auto_22348 ?auto_22363 ) ) ( not ( = ?auto_22348 ?auto_22358 ) ) ( not ( = ?auto_22346 ?auto_22353 ) ) ( not ( = ?auto_22346 ?auto_22366 ) ) ( not ( = ?auto_22346 ?auto_22349 ) ) ( not ( = ?auto_22346 ?auto_22365 ) ) ( not ( = ?auto_22346 ?auto_22351 ) ) ( not ( = ?auto_22346 ?auto_22361 ) ) ( not ( = ?auto_22346 ?auto_22362 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_22334 ?auto_22335 ?auto_22336 ?auto_22337 ?auto_22338 ?auto_22340 ?auto_22339 ?auto_22342 )
      ( MAKE-1CRATE ?auto_22342 ?auto_22341 )
      ( MAKE-8CRATE-VERIFY ?auto_22334 ?auto_22335 ?auto_22336 ?auto_22337 ?auto_22338 ?auto_22340 ?auto_22339 ?auto_22342 ?auto_22341 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22370 - SURFACE
      ?auto_22371 - SURFACE
    )
    :vars
    (
      ?auto_22372 - HOIST
      ?auto_22373 - PLACE
      ?auto_22375 - PLACE
      ?auto_22376 - HOIST
      ?auto_22377 - SURFACE
      ?auto_22374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22372 ?auto_22373 ) ( SURFACE-AT ?auto_22370 ?auto_22373 ) ( CLEAR ?auto_22370 ) ( IS-CRATE ?auto_22371 ) ( AVAILABLE ?auto_22372 ) ( not ( = ?auto_22375 ?auto_22373 ) ) ( HOIST-AT ?auto_22376 ?auto_22375 ) ( AVAILABLE ?auto_22376 ) ( SURFACE-AT ?auto_22371 ?auto_22375 ) ( ON ?auto_22371 ?auto_22377 ) ( CLEAR ?auto_22371 ) ( TRUCK-AT ?auto_22374 ?auto_22373 ) ( not ( = ?auto_22370 ?auto_22371 ) ) ( not ( = ?auto_22370 ?auto_22377 ) ) ( not ( = ?auto_22371 ?auto_22377 ) ) ( not ( = ?auto_22372 ?auto_22376 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22374 ?auto_22373 ?auto_22375 )
      ( !LIFT ?auto_22376 ?auto_22371 ?auto_22377 ?auto_22375 )
      ( !LOAD ?auto_22376 ?auto_22371 ?auto_22374 ?auto_22375 )
      ( !DRIVE ?auto_22374 ?auto_22375 ?auto_22373 )
      ( !UNLOAD ?auto_22372 ?auto_22371 ?auto_22374 ?auto_22373 )
      ( !DROP ?auto_22372 ?auto_22371 ?auto_22370 ?auto_22373 )
      ( MAKE-1CRATE-VERIFY ?auto_22370 ?auto_22371 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_22388 - SURFACE
      ?auto_22389 - SURFACE
      ?auto_22390 - SURFACE
      ?auto_22391 - SURFACE
      ?auto_22392 - SURFACE
      ?auto_22395 - SURFACE
      ?auto_22393 - SURFACE
      ?auto_22397 - SURFACE
      ?auto_22396 - SURFACE
      ?auto_22394 - SURFACE
    )
    :vars
    (
      ?auto_22403 - HOIST
      ?auto_22398 - PLACE
      ?auto_22401 - PLACE
      ?auto_22399 - HOIST
      ?auto_22400 - SURFACE
      ?auto_22404 - PLACE
      ?auto_22405 - HOIST
      ?auto_22414 - SURFACE
      ?auto_22413 - PLACE
      ?auto_22420 - HOIST
      ?auto_22421 - SURFACE
      ?auto_22406 - PLACE
      ?auto_22407 - HOIST
      ?auto_22410 - SURFACE
      ?auto_22419 - PLACE
      ?auto_22422 - HOIST
      ?auto_22411 - SURFACE
      ?auto_22415 - PLACE
      ?auto_22416 - HOIST
      ?auto_22412 - SURFACE
      ?auto_22409 - PLACE
      ?auto_22408 - HOIST
      ?auto_22423 - SURFACE
      ?auto_22417 - SURFACE
      ?auto_22418 - SURFACE
      ?auto_22402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22403 ?auto_22398 ) ( IS-CRATE ?auto_22394 ) ( not ( = ?auto_22401 ?auto_22398 ) ) ( HOIST-AT ?auto_22399 ?auto_22401 ) ( SURFACE-AT ?auto_22394 ?auto_22401 ) ( ON ?auto_22394 ?auto_22400 ) ( CLEAR ?auto_22394 ) ( not ( = ?auto_22396 ?auto_22394 ) ) ( not ( = ?auto_22396 ?auto_22400 ) ) ( not ( = ?auto_22394 ?auto_22400 ) ) ( not ( = ?auto_22403 ?auto_22399 ) ) ( IS-CRATE ?auto_22396 ) ( not ( = ?auto_22404 ?auto_22398 ) ) ( HOIST-AT ?auto_22405 ?auto_22404 ) ( AVAILABLE ?auto_22405 ) ( SURFACE-AT ?auto_22396 ?auto_22404 ) ( ON ?auto_22396 ?auto_22414 ) ( CLEAR ?auto_22396 ) ( not ( = ?auto_22397 ?auto_22396 ) ) ( not ( = ?auto_22397 ?auto_22414 ) ) ( not ( = ?auto_22396 ?auto_22414 ) ) ( not ( = ?auto_22403 ?auto_22405 ) ) ( IS-CRATE ?auto_22397 ) ( not ( = ?auto_22413 ?auto_22398 ) ) ( HOIST-AT ?auto_22420 ?auto_22413 ) ( AVAILABLE ?auto_22420 ) ( SURFACE-AT ?auto_22397 ?auto_22413 ) ( ON ?auto_22397 ?auto_22421 ) ( CLEAR ?auto_22397 ) ( not ( = ?auto_22393 ?auto_22397 ) ) ( not ( = ?auto_22393 ?auto_22421 ) ) ( not ( = ?auto_22397 ?auto_22421 ) ) ( not ( = ?auto_22403 ?auto_22420 ) ) ( IS-CRATE ?auto_22393 ) ( not ( = ?auto_22406 ?auto_22398 ) ) ( HOIST-AT ?auto_22407 ?auto_22406 ) ( AVAILABLE ?auto_22407 ) ( SURFACE-AT ?auto_22393 ?auto_22406 ) ( ON ?auto_22393 ?auto_22410 ) ( CLEAR ?auto_22393 ) ( not ( = ?auto_22395 ?auto_22393 ) ) ( not ( = ?auto_22395 ?auto_22410 ) ) ( not ( = ?auto_22393 ?auto_22410 ) ) ( not ( = ?auto_22403 ?auto_22407 ) ) ( IS-CRATE ?auto_22395 ) ( not ( = ?auto_22419 ?auto_22398 ) ) ( HOIST-AT ?auto_22422 ?auto_22419 ) ( SURFACE-AT ?auto_22395 ?auto_22419 ) ( ON ?auto_22395 ?auto_22411 ) ( CLEAR ?auto_22395 ) ( not ( = ?auto_22392 ?auto_22395 ) ) ( not ( = ?auto_22392 ?auto_22411 ) ) ( not ( = ?auto_22395 ?auto_22411 ) ) ( not ( = ?auto_22403 ?auto_22422 ) ) ( IS-CRATE ?auto_22392 ) ( not ( = ?auto_22415 ?auto_22398 ) ) ( HOIST-AT ?auto_22416 ?auto_22415 ) ( AVAILABLE ?auto_22416 ) ( SURFACE-AT ?auto_22392 ?auto_22415 ) ( ON ?auto_22392 ?auto_22412 ) ( CLEAR ?auto_22392 ) ( not ( = ?auto_22391 ?auto_22392 ) ) ( not ( = ?auto_22391 ?auto_22412 ) ) ( not ( = ?auto_22392 ?auto_22412 ) ) ( not ( = ?auto_22403 ?auto_22416 ) ) ( IS-CRATE ?auto_22391 ) ( not ( = ?auto_22409 ?auto_22398 ) ) ( HOIST-AT ?auto_22408 ?auto_22409 ) ( AVAILABLE ?auto_22408 ) ( SURFACE-AT ?auto_22391 ?auto_22409 ) ( ON ?auto_22391 ?auto_22423 ) ( CLEAR ?auto_22391 ) ( not ( = ?auto_22390 ?auto_22391 ) ) ( not ( = ?auto_22390 ?auto_22423 ) ) ( not ( = ?auto_22391 ?auto_22423 ) ) ( not ( = ?auto_22403 ?auto_22408 ) ) ( IS-CRATE ?auto_22390 ) ( AVAILABLE ?auto_22422 ) ( SURFACE-AT ?auto_22390 ?auto_22419 ) ( ON ?auto_22390 ?auto_22417 ) ( CLEAR ?auto_22390 ) ( not ( = ?auto_22389 ?auto_22390 ) ) ( not ( = ?auto_22389 ?auto_22417 ) ) ( not ( = ?auto_22390 ?auto_22417 ) ) ( SURFACE-AT ?auto_22388 ?auto_22398 ) ( CLEAR ?auto_22388 ) ( IS-CRATE ?auto_22389 ) ( AVAILABLE ?auto_22403 ) ( AVAILABLE ?auto_22399 ) ( SURFACE-AT ?auto_22389 ?auto_22401 ) ( ON ?auto_22389 ?auto_22418 ) ( CLEAR ?auto_22389 ) ( TRUCK-AT ?auto_22402 ?auto_22398 ) ( not ( = ?auto_22388 ?auto_22389 ) ) ( not ( = ?auto_22388 ?auto_22418 ) ) ( not ( = ?auto_22389 ?auto_22418 ) ) ( not ( = ?auto_22388 ?auto_22390 ) ) ( not ( = ?auto_22388 ?auto_22417 ) ) ( not ( = ?auto_22390 ?auto_22418 ) ) ( not ( = ?auto_22419 ?auto_22401 ) ) ( not ( = ?auto_22422 ?auto_22399 ) ) ( not ( = ?auto_22417 ?auto_22418 ) ) ( not ( = ?auto_22388 ?auto_22391 ) ) ( not ( = ?auto_22388 ?auto_22423 ) ) ( not ( = ?auto_22389 ?auto_22391 ) ) ( not ( = ?auto_22389 ?auto_22423 ) ) ( not ( = ?auto_22391 ?auto_22417 ) ) ( not ( = ?auto_22391 ?auto_22418 ) ) ( not ( = ?auto_22409 ?auto_22419 ) ) ( not ( = ?auto_22409 ?auto_22401 ) ) ( not ( = ?auto_22408 ?auto_22422 ) ) ( not ( = ?auto_22408 ?auto_22399 ) ) ( not ( = ?auto_22423 ?auto_22417 ) ) ( not ( = ?auto_22423 ?auto_22418 ) ) ( not ( = ?auto_22388 ?auto_22392 ) ) ( not ( = ?auto_22388 ?auto_22412 ) ) ( not ( = ?auto_22389 ?auto_22392 ) ) ( not ( = ?auto_22389 ?auto_22412 ) ) ( not ( = ?auto_22390 ?auto_22392 ) ) ( not ( = ?auto_22390 ?auto_22412 ) ) ( not ( = ?auto_22392 ?auto_22423 ) ) ( not ( = ?auto_22392 ?auto_22417 ) ) ( not ( = ?auto_22392 ?auto_22418 ) ) ( not ( = ?auto_22415 ?auto_22409 ) ) ( not ( = ?auto_22415 ?auto_22419 ) ) ( not ( = ?auto_22415 ?auto_22401 ) ) ( not ( = ?auto_22416 ?auto_22408 ) ) ( not ( = ?auto_22416 ?auto_22422 ) ) ( not ( = ?auto_22416 ?auto_22399 ) ) ( not ( = ?auto_22412 ?auto_22423 ) ) ( not ( = ?auto_22412 ?auto_22417 ) ) ( not ( = ?auto_22412 ?auto_22418 ) ) ( not ( = ?auto_22388 ?auto_22395 ) ) ( not ( = ?auto_22388 ?auto_22411 ) ) ( not ( = ?auto_22389 ?auto_22395 ) ) ( not ( = ?auto_22389 ?auto_22411 ) ) ( not ( = ?auto_22390 ?auto_22395 ) ) ( not ( = ?auto_22390 ?auto_22411 ) ) ( not ( = ?auto_22391 ?auto_22395 ) ) ( not ( = ?auto_22391 ?auto_22411 ) ) ( not ( = ?auto_22395 ?auto_22412 ) ) ( not ( = ?auto_22395 ?auto_22423 ) ) ( not ( = ?auto_22395 ?auto_22417 ) ) ( not ( = ?auto_22395 ?auto_22418 ) ) ( not ( = ?auto_22411 ?auto_22412 ) ) ( not ( = ?auto_22411 ?auto_22423 ) ) ( not ( = ?auto_22411 ?auto_22417 ) ) ( not ( = ?auto_22411 ?auto_22418 ) ) ( not ( = ?auto_22388 ?auto_22393 ) ) ( not ( = ?auto_22388 ?auto_22410 ) ) ( not ( = ?auto_22389 ?auto_22393 ) ) ( not ( = ?auto_22389 ?auto_22410 ) ) ( not ( = ?auto_22390 ?auto_22393 ) ) ( not ( = ?auto_22390 ?auto_22410 ) ) ( not ( = ?auto_22391 ?auto_22393 ) ) ( not ( = ?auto_22391 ?auto_22410 ) ) ( not ( = ?auto_22392 ?auto_22393 ) ) ( not ( = ?auto_22392 ?auto_22410 ) ) ( not ( = ?auto_22393 ?auto_22411 ) ) ( not ( = ?auto_22393 ?auto_22412 ) ) ( not ( = ?auto_22393 ?auto_22423 ) ) ( not ( = ?auto_22393 ?auto_22417 ) ) ( not ( = ?auto_22393 ?auto_22418 ) ) ( not ( = ?auto_22406 ?auto_22419 ) ) ( not ( = ?auto_22406 ?auto_22415 ) ) ( not ( = ?auto_22406 ?auto_22409 ) ) ( not ( = ?auto_22406 ?auto_22401 ) ) ( not ( = ?auto_22407 ?auto_22422 ) ) ( not ( = ?auto_22407 ?auto_22416 ) ) ( not ( = ?auto_22407 ?auto_22408 ) ) ( not ( = ?auto_22407 ?auto_22399 ) ) ( not ( = ?auto_22410 ?auto_22411 ) ) ( not ( = ?auto_22410 ?auto_22412 ) ) ( not ( = ?auto_22410 ?auto_22423 ) ) ( not ( = ?auto_22410 ?auto_22417 ) ) ( not ( = ?auto_22410 ?auto_22418 ) ) ( not ( = ?auto_22388 ?auto_22397 ) ) ( not ( = ?auto_22388 ?auto_22421 ) ) ( not ( = ?auto_22389 ?auto_22397 ) ) ( not ( = ?auto_22389 ?auto_22421 ) ) ( not ( = ?auto_22390 ?auto_22397 ) ) ( not ( = ?auto_22390 ?auto_22421 ) ) ( not ( = ?auto_22391 ?auto_22397 ) ) ( not ( = ?auto_22391 ?auto_22421 ) ) ( not ( = ?auto_22392 ?auto_22397 ) ) ( not ( = ?auto_22392 ?auto_22421 ) ) ( not ( = ?auto_22395 ?auto_22397 ) ) ( not ( = ?auto_22395 ?auto_22421 ) ) ( not ( = ?auto_22397 ?auto_22410 ) ) ( not ( = ?auto_22397 ?auto_22411 ) ) ( not ( = ?auto_22397 ?auto_22412 ) ) ( not ( = ?auto_22397 ?auto_22423 ) ) ( not ( = ?auto_22397 ?auto_22417 ) ) ( not ( = ?auto_22397 ?auto_22418 ) ) ( not ( = ?auto_22413 ?auto_22406 ) ) ( not ( = ?auto_22413 ?auto_22419 ) ) ( not ( = ?auto_22413 ?auto_22415 ) ) ( not ( = ?auto_22413 ?auto_22409 ) ) ( not ( = ?auto_22413 ?auto_22401 ) ) ( not ( = ?auto_22420 ?auto_22407 ) ) ( not ( = ?auto_22420 ?auto_22422 ) ) ( not ( = ?auto_22420 ?auto_22416 ) ) ( not ( = ?auto_22420 ?auto_22408 ) ) ( not ( = ?auto_22420 ?auto_22399 ) ) ( not ( = ?auto_22421 ?auto_22410 ) ) ( not ( = ?auto_22421 ?auto_22411 ) ) ( not ( = ?auto_22421 ?auto_22412 ) ) ( not ( = ?auto_22421 ?auto_22423 ) ) ( not ( = ?auto_22421 ?auto_22417 ) ) ( not ( = ?auto_22421 ?auto_22418 ) ) ( not ( = ?auto_22388 ?auto_22396 ) ) ( not ( = ?auto_22388 ?auto_22414 ) ) ( not ( = ?auto_22389 ?auto_22396 ) ) ( not ( = ?auto_22389 ?auto_22414 ) ) ( not ( = ?auto_22390 ?auto_22396 ) ) ( not ( = ?auto_22390 ?auto_22414 ) ) ( not ( = ?auto_22391 ?auto_22396 ) ) ( not ( = ?auto_22391 ?auto_22414 ) ) ( not ( = ?auto_22392 ?auto_22396 ) ) ( not ( = ?auto_22392 ?auto_22414 ) ) ( not ( = ?auto_22395 ?auto_22396 ) ) ( not ( = ?auto_22395 ?auto_22414 ) ) ( not ( = ?auto_22393 ?auto_22396 ) ) ( not ( = ?auto_22393 ?auto_22414 ) ) ( not ( = ?auto_22396 ?auto_22421 ) ) ( not ( = ?auto_22396 ?auto_22410 ) ) ( not ( = ?auto_22396 ?auto_22411 ) ) ( not ( = ?auto_22396 ?auto_22412 ) ) ( not ( = ?auto_22396 ?auto_22423 ) ) ( not ( = ?auto_22396 ?auto_22417 ) ) ( not ( = ?auto_22396 ?auto_22418 ) ) ( not ( = ?auto_22404 ?auto_22413 ) ) ( not ( = ?auto_22404 ?auto_22406 ) ) ( not ( = ?auto_22404 ?auto_22419 ) ) ( not ( = ?auto_22404 ?auto_22415 ) ) ( not ( = ?auto_22404 ?auto_22409 ) ) ( not ( = ?auto_22404 ?auto_22401 ) ) ( not ( = ?auto_22405 ?auto_22420 ) ) ( not ( = ?auto_22405 ?auto_22407 ) ) ( not ( = ?auto_22405 ?auto_22422 ) ) ( not ( = ?auto_22405 ?auto_22416 ) ) ( not ( = ?auto_22405 ?auto_22408 ) ) ( not ( = ?auto_22405 ?auto_22399 ) ) ( not ( = ?auto_22414 ?auto_22421 ) ) ( not ( = ?auto_22414 ?auto_22410 ) ) ( not ( = ?auto_22414 ?auto_22411 ) ) ( not ( = ?auto_22414 ?auto_22412 ) ) ( not ( = ?auto_22414 ?auto_22423 ) ) ( not ( = ?auto_22414 ?auto_22417 ) ) ( not ( = ?auto_22414 ?auto_22418 ) ) ( not ( = ?auto_22388 ?auto_22394 ) ) ( not ( = ?auto_22388 ?auto_22400 ) ) ( not ( = ?auto_22389 ?auto_22394 ) ) ( not ( = ?auto_22389 ?auto_22400 ) ) ( not ( = ?auto_22390 ?auto_22394 ) ) ( not ( = ?auto_22390 ?auto_22400 ) ) ( not ( = ?auto_22391 ?auto_22394 ) ) ( not ( = ?auto_22391 ?auto_22400 ) ) ( not ( = ?auto_22392 ?auto_22394 ) ) ( not ( = ?auto_22392 ?auto_22400 ) ) ( not ( = ?auto_22395 ?auto_22394 ) ) ( not ( = ?auto_22395 ?auto_22400 ) ) ( not ( = ?auto_22393 ?auto_22394 ) ) ( not ( = ?auto_22393 ?auto_22400 ) ) ( not ( = ?auto_22397 ?auto_22394 ) ) ( not ( = ?auto_22397 ?auto_22400 ) ) ( not ( = ?auto_22394 ?auto_22414 ) ) ( not ( = ?auto_22394 ?auto_22421 ) ) ( not ( = ?auto_22394 ?auto_22410 ) ) ( not ( = ?auto_22394 ?auto_22411 ) ) ( not ( = ?auto_22394 ?auto_22412 ) ) ( not ( = ?auto_22394 ?auto_22423 ) ) ( not ( = ?auto_22394 ?auto_22417 ) ) ( not ( = ?auto_22394 ?auto_22418 ) ) ( not ( = ?auto_22400 ?auto_22414 ) ) ( not ( = ?auto_22400 ?auto_22421 ) ) ( not ( = ?auto_22400 ?auto_22410 ) ) ( not ( = ?auto_22400 ?auto_22411 ) ) ( not ( = ?auto_22400 ?auto_22412 ) ) ( not ( = ?auto_22400 ?auto_22423 ) ) ( not ( = ?auto_22400 ?auto_22417 ) ) ( not ( = ?auto_22400 ?auto_22418 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_22388 ?auto_22389 ?auto_22390 ?auto_22391 ?auto_22392 ?auto_22395 ?auto_22393 ?auto_22397 ?auto_22396 )
      ( MAKE-1CRATE ?auto_22396 ?auto_22394 )
      ( MAKE-9CRATE-VERIFY ?auto_22388 ?auto_22389 ?auto_22390 ?auto_22391 ?auto_22392 ?auto_22395 ?auto_22393 ?auto_22397 ?auto_22396 ?auto_22394 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22426 - SURFACE
      ?auto_22427 - SURFACE
    )
    :vars
    (
      ?auto_22428 - HOIST
      ?auto_22429 - PLACE
      ?auto_22431 - PLACE
      ?auto_22432 - HOIST
      ?auto_22433 - SURFACE
      ?auto_22430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22428 ?auto_22429 ) ( SURFACE-AT ?auto_22426 ?auto_22429 ) ( CLEAR ?auto_22426 ) ( IS-CRATE ?auto_22427 ) ( AVAILABLE ?auto_22428 ) ( not ( = ?auto_22431 ?auto_22429 ) ) ( HOIST-AT ?auto_22432 ?auto_22431 ) ( AVAILABLE ?auto_22432 ) ( SURFACE-AT ?auto_22427 ?auto_22431 ) ( ON ?auto_22427 ?auto_22433 ) ( CLEAR ?auto_22427 ) ( TRUCK-AT ?auto_22430 ?auto_22429 ) ( not ( = ?auto_22426 ?auto_22427 ) ) ( not ( = ?auto_22426 ?auto_22433 ) ) ( not ( = ?auto_22427 ?auto_22433 ) ) ( not ( = ?auto_22428 ?auto_22432 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22430 ?auto_22429 ?auto_22431 )
      ( !LIFT ?auto_22432 ?auto_22427 ?auto_22433 ?auto_22431 )
      ( !LOAD ?auto_22432 ?auto_22427 ?auto_22430 ?auto_22431 )
      ( !DRIVE ?auto_22430 ?auto_22431 ?auto_22429 )
      ( !UNLOAD ?auto_22428 ?auto_22427 ?auto_22430 ?auto_22429 )
      ( !DROP ?auto_22428 ?auto_22427 ?auto_22426 ?auto_22429 )
      ( MAKE-1CRATE-VERIFY ?auto_22426 ?auto_22427 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_22445 - SURFACE
      ?auto_22446 - SURFACE
      ?auto_22447 - SURFACE
      ?auto_22448 - SURFACE
      ?auto_22449 - SURFACE
      ?auto_22452 - SURFACE
      ?auto_22450 - SURFACE
      ?auto_22454 - SURFACE
      ?auto_22453 - SURFACE
      ?auto_22451 - SURFACE
      ?auto_22455 - SURFACE
    )
    :vars
    (
      ?auto_22457 - HOIST
      ?auto_22459 - PLACE
      ?auto_22460 - PLACE
      ?auto_22461 - HOIST
      ?auto_22456 - SURFACE
      ?auto_22465 - PLACE
      ?auto_22482 - HOIST
      ?auto_22463 - SURFACE
      ?auto_22471 - PLACE
      ?auto_22467 - HOIST
      ?auto_22478 - SURFACE
      ?auto_22470 - PLACE
      ?auto_22477 - HOIST
      ?auto_22462 - SURFACE
      ?auto_22473 - SURFACE
      ?auto_22480 - PLACE
      ?auto_22466 - HOIST
      ?auto_22472 - SURFACE
      ?auto_22479 - PLACE
      ?auto_22481 - HOIST
      ?auto_22468 - SURFACE
      ?auto_22474 - PLACE
      ?auto_22475 - HOIST
      ?auto_22476 - SURFACE
      ?auto_22469 - SURFACE
      ?auto_22464 - SURFACE
      ?auto_22458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22457 ?auto_22459 ) ( IS-CRATE ?auto_22455 ) ( not ( = ?auto_22460 ?auto_22459 ) ) ( HOIST-AT ?auto_22461 ?auto_22460 ) ( SURFACE-AT ?auto_22455 ?auto_22460 ) ( ON ?auto_22455 ?auto_22456 ) ( CLEAR ?auto_22455 ) ( not ( = ?auto_22451 ?auto_22455 ) ) ( not ( = ?auto_22451 ?auto_22456 ) ) ( not ( = ?auto_22455 ?auto_22456 ) ) ( not ( = ?auto_22457 ?auto_22461 ) ) ( IS-CRATE ?auto_22451 ) ( not ( = ?auto_22465 ?auto_22459 ) ) ( HOIST-AT ?auto_22482 ?auto_22465 ) ( SURFACE-AT ?auto_22451 ?auto_22465 ) ( ON ?auto_22451 ?auto_22463 ) ( CLEAR ?auto_22451 ) ( not ( = ?auto_22453 ?auto_22451 ) ) ( not ( = ?auto_22453 ?auto_22463 ) ) ( not ( = ?auto_22451 ?auto_22463 ) ) ( not ( = ?auto_22457 ?auto_22482 ) ) ( IS-CRATE ?auto_22453 ) ( not ( = ?auto_22471 ?auto_22459 ) ) ( HOIST-AT ?auto_22467 ?auto_22471 ) ( AVAILABLE ?auto_22467 ) ( SURFACE-AT ?auto_22453 ?auto_22471 ) ( ON ?auto_22453 ?auto_22478 ) ( CLEAR ?auto_22453 ) ( not ( = ?auto_22454 ?auto_22453 ) ) ( not ( = ?auto_22454 ?auto_22478 ) ) ( not ( = ?auto_22453 ?auto_22478 ) ) ( not ( = ?auto_22457 ?auto_22467 ) ) ( IS-CRATE ?auto_22454 ) ( not ( = ?auto_22470 ?auto_22459 ) ) ( HOIST-AT ?auto_22477 ?auto_22470 ) ( AVAILABLE ?auto_22477 ) ( SURFACE-AT ?auto_22454 ?auto_22470 ) ( ON ?auto_22454 ?auto_22462 ) ( CLEAR ?auto_22454 ) ( not ( = ?auto_22450 ?auto_22454 ) ) ( not ( = ?auto_22450 ?auto_22462 ) ) ( not ( = ?auto_22454 ?auto_22462 ) ) ( not ( = ?auto_22457 ?auto_22477 ) ) ( IS-CRATE ?auto_22450 ) ( AVAILABLE ?auto_22461 ) ( SURFACE-AT ?auto_22450 ?auto_22460 ) ( ON ?auto_22450 ?auto_22473 ) ( CLEAR ?auto_22450 ) ( not ( = ?auto_22452 ?auto_22450 ) ) ( not ( = ?auto_22452 ?auto_22473 ) ) ( not ( = ?auto_22450 ?auto_22473 ) ) ( IS-CRATE ?auto_22452 ) ( not ( = ?auto_22480 ?auto_22459 ) ) ( HOIST-AT ?auto_22466 ?auto_22480 ) ( SURFACE-AT ?auto_22452 ?auto_22480 ) ( ON ?auto_22452 ?auto_22472 ) ( CLEAR ?auto_22452 ) ( not ( = ?auto_22449 ?auto_22452 ) ) ( not ( = ?auto_22449 ?auto_22472 ) ) ( not ( = ?auto_22452 ?auto_22472 ) ) ( not ( = ?auto_22457 ?auto_22466 ) ) ( IS-CRATE ?auto_22449 ) ( not ( = ?auto_22479 ?auto_22459 ) ) ( HOIST-AT ?auto_22481 ?auto_22479 ) ( AVAILABLE ?auto_22481 ) ( SURFACE-AT ?auto_22449 ?auto_22479 ) ( ON ?auto_22449 ?auto_22468 ) ( CLEAR ?auto_22449 ) ( not ( = ?auto_22448 ?auto_22449 ) ) ( not ( = ?auto_22448 ?auto_22468 ) ) ( not ( = ?auto_22449 ?auto_22468 ) ) ( not ( = ?auto_22457 ?auto_22481 ) ) ( IS-CRATE ?auto_22448 ) ( not ( = ?auto_22474 ?auto_22459 ) ) ( HOIST-AT ?auto_22475 ?auto_22474 ) ( AVAILABLE ?auto_22475 ) ( SURFACE-AT ?auto_22448 ?auto_22474 ) ( ON ?auto_22448 ?auto_22476 ) ( CLEAR ?auto_22448 ) ( not ( = ?auto_22447 ?auto_22448 ) ) ( not ( = ?auto_22447 ?auto_22476 ) ) ( not ( = ?auto_22448 ?auto_22476 ) ) ( not ( = ?auto_22457 ?auto_22475 ) ) ( IS-CRATE ?auto_22447 ) ( AVAILABLE ?auto_22466 ) ( SURFACE-AT ?auto_22447 ?auto_22480 ) ( ON ?auto_22447 ?auto_22469 ) ( CLEAR ?auto_22447 ) ( not ( = ?auto_22446 ?auto_22447 ) ) ( not ( = ?auto_22446 ?auto_22469 ) ) ( not ( = ?auto_22447 ?auto_22469 ) ) ( SURFACE-AT ?auto_22445 ?auto_22459 ) ( CLEAR ?auto_22445 ) ( IS-CRATE ?auto_22446 ) ( AVAILABLE ?auto_22457 ) ( AVAILABLE ?auto_22482 ) ( SURFACE-AT ?auto_22446 ?auto_22465 ) ( ON ?auto_22446 ?auto_22464 ) ( CLEAR ?auto_22446 ) ( TRUCK-AT ?auto_22458 ?auto_22459 ) ( not ( = ?auto_22445 ?auto_22446 ) ) ( not ( = ?auto_22445 ?auto_22464 ) ) ( not ( = ?auto_22446 ?auto_22464 ) ) ( not ( = ?auto_22445 ?auto_22447 ) ) ( not ( = ?auto_22445 ?auto_22469 ) ) ( not ( = ?auto_22447 ?auto_22464 ) ) ( not ( = ?auto_22480 ?auto_22465 ) ) ( not ( = ?auto_22466 ?auto_22482 ) ) ( not ( = ?auto_22469 ?auto_22464 ) ) ( not ( = ?auto_22445 ?auto_22448 ) ) ( not ( = ?auto_22445 ?auto_22476 ) ) ( not ( = ?auto_22446 ?auto_22448 ) ) ( not ( = ?auto_22446 ?auto_22476 ) ) ( not ( = ?auto_22448 ?auto_22469 ) ) ( not ( = ?auto_22448 ?auto_22464 ) ) ( not ( = ?auto_22474 ?auto_22480 ) ) ( not ( = ?auto_22474 ?auto_22465 ) ) ( not ( = ?auto_22475 ?auto_22466 ) ) ( not ( = ?auto_22475 ?auto_22482 ) ) ( not ( = ?auto_22476 ?auto_22469 ) ) ( not ( = ?auto_22476 ?auto_22464 ) ) ( not ( = ?auto_22445 ?auto_22449 ) ) ( not ( = ?auto_22445 ?auto_22468 ) ) ( not ( = ?auto_22446 ?auto_22449 ) ) ( not ( = ?auto_22446 ?auto_22468 ) ) ( not ( = ?auto_22447 ?auto_22449 ) ) ( not ( = ?auto_22447 ?auto_22468 ) ) ( not ( = ?auto_22449 ?auto_22476 ) ) ( not ( = ?auto_22449 ?auto_22469 ) ) ( not ( = ?auto_22449 ?auto_22464 ) ) ( not ( = ?auto_22479 ?auto_22474 ) ) ( not ( = ?auto_22479 ?auto_22480 ) ) ( not ( = ?auto_22479 ?auto_22465 ) ) ( not ( = ?auto_22481 ?auto_22475 ) ) ( not ( = ?auto_22481 ?auto_22466 ) ) ( not ( = ?auto_22481 ?auto_22482 ) ) ( not ( = ?auto_22468 ?auto_22476 ) ) ( not ( = ?auto_22468 ?auto_22469 ) ) ( not ( = ?auto_22468 ?auto_22464 ) ) ( not ( = ?auto_22445 ?auto_22452 ) ) ( not ( = ?auto_22445 ?auto_22472 ) ) ( not ( = ?auto_22446 ?auto_22452 ) ) ( not ( = ?auto_22446 ?auto_22472 ) ) ( not ( = ?auto_22447 ?auto_22452 ) ) ( not ( = ?auto_22447 ?auto_22472 ) ) ( not ( = ?auto_22448 ?auto_22452 ) ) ( not ( = ?auto_22448 ?auto_22472 ) ) ( not ( = ?auto_22452 ?auto_22468 ) ) ( not ( = ?auto_22452 ?auto_22476 ) ) ( not ( = ?auto_22452 ?auto_22469 ) ) ( not ( = ?auto_22452 ?auto_22464 ) ) ( not ( = ?auto_22472 ?auto_22468 ) ) ( not ( = ?auto_22472 ?auto_22476 ) ) ( not ( = ?auto_22472 ?auto_22469 ) ) ( not ( = ?auto_22472 ?auto_22464 ) ) ( not ( = ?auto_22445 ?auto_22450 ) ) ( not ( = ?auto_22445 ?auto_22473 ) ) ( not ( = ?auto_22446 ?auto_22450 ) ) ( not ( = ?auto_22446 ?auto_22473 ) ) ( not ( = ?auto_22447 ?auto_22450 ) ) ( not ( = ?auto_22447 ?auto_22473 ) ) ( not ( = ?auto_22448 ?auto_22450 ) ) ( not ( = ?auto_22448 ?auto_22473 ) ) ( not ( = ?auto_22449 ?auto_22450 ) ) ( not ( = ?auto_22449 ?auto_22473 ) ) ( not ( = ?auto_22450 ?auto_22472 ) ) ( not ( = ?auto_22450 ?auto_22468 ) ) ( not ( = ?auto_22450 ?auto_22476 ) ) ( not ( = ?auto_22450 ?auto_22469 ) ) ( not ( = ?auto_22450 ?auto_22464 ) ) ( not ( = ?auto_22460 ?auto_22480 ) ) ( not ( = ?auto_22460 ?auto_22479 ) ) ( not ( = ?auto_22460 ?auto_22474 ) ) ( not ( = ?auto_22460 ?auto_22465 ) ) ( not ( = ?auto_22461 ?auto_22466 ) ) ( not ( = ?auto_22461 ?auto_22481 ) ) ( not ( = ?auto_22461 ?auto_22475 ) ) ( not ( = ?auto_22461 ?auto_22482 ) ) ( not ( = ?auto_22473 ?auto_22472 ) ) ( not ( = ?auto_22473 ?auto_22468 ) ) ( not ( = ?auto_22473 ?auto_22476 ) ) ( not ( = ?auto_22473 ?auto_22469 ) ) ( not ( = ?auto_22473 ?auto_22464 ) ) ( not ( = ?auto_22445 ?auto_22454 ) ) ( not ( = ?auto_22445 ?auto_22462 ) ) ( not ( = ?auto_22446 ?auto_22454 ) ) ( not ( = ?auto_22446 ?auto_22462 ) ) ( not ( = ?auto_22447 ?auto_22454 ) ) ( not ( = ?auto_22447 ?auto_22462 ) ) ( not ( = ?auto_22448 ?auto_22454 ) ) ( not ( = ?auto_22448 ?auto_22462 ) ) ( not ( = ?auto_22449 ?auto_22454 ) ) ( not ( = ?auto_22449 ?auto_22462 ) ) ( not ( = ?auto_22452 ?auto_22454 ) ) ( not ( = ?auto_22452 ?auto_22462 ) ) ( not ( = ?auto_22454 ?auto_22473 ) ) ( not ( = ?auto_22454 ?auto_22472 ) ) ( not ( = ?auto_22454 ?auto_22468 ) ) ( not ( = ?auto_22454 ?auto_22476 ) ) ( not ( = ?auto_22454 ?auto_22469 ) ) ( not ( = ?auto_22454 ?auto_22464 ) ) ( not ( = ?auto_22470 ?auto_22460 ) ) ( not ( = ?auto_22470 ?auto_22480 ) ) ( not ( = ?auto_22470 ?auto_22479 ) ) ( not ( = ?auto_22470 ?auto_22474 ) ) ( not ( = ?auto_22470 ?auto_22465 ) ) ( not ( = ?auto_22477 ?auto_22461 ) ) ( not ( = ?auto_22477 ?auto_22466 ) ) ( not ( = ?auto_22477 ?auto_22481 ) ) ( not ( = ?auto_22477 ?auto_22475 ) ) ( not ( = ?auto_22477 ?auto_22482 ) ) ( not ( = ?auto_22462 ?auto_22473 ) ) ( not ( = ?auto_22462 ?auto_22472 ) ) ( not ( = ?auto_22462 ?auto_22468 ) ) ( not ( = ?auto_22462 ?auto_22476 ) ) ( not ( = ?auto_22462 ?auto_22469 ) ) ( not ( = ?auto_22462 ?auto_22464 ) ) ( not ( = ?auto_22445 ?auto_22453 ) ) ( not ( = ?auto_22445 ?auto_22478 ) ) ( not ( = ?auto_22446 ?auto_22453 ) ) ( not ( = ?auto_22446 ?auto_22478 ) ) ( not ( = ?auto_22447 ?auto_22453 ) ) ( not ( = ?auto_22447 ?auto_22478 ) ) ( not ( = ?auto_22448 ?auto_22453 ) ) ( not ( = ?auto_22448 ?auto_22478 ) ) ( not ( = ?auto_22449 ?auto_22453 ) ) ( not ( = ?auto_22449 ?auto_22478 ) ) ( not ( = ?auto_22452 ?auto_22453 ) ) ( not ( = ?auto_22452 ?auto_22478 ) ) ( not ( = ?auto_22450 ?auto_22453 ) ) ( not ( = ?auto_22450 ?auto_22478 ) ) ( not ( = ?auto_22453 ?auto_22462 ) ) ( not ( = ?auto_22453 ?auto_22473 ) ) ( not ( = ?auto_22453 ?auto_22472 ) ) ( not ( = ?auto_22453 ?auto_22468 ) ) ( not ( = ?auto_22453 ?auto_22476 ) ) ( not ( = ?auto_22453 ?auto_22469 ) ) ( not ( = ?auto_22453 ?auto_22464 ) ) ( not ( = ?auto_22471 ?auto_22470 ) ) ( not ( = ?auto_22471 ?auto_22460 ) ) ( not ( = ?auto_22471 ?auto_22480 ) ) ( not ( = ?auto_22471 ?auto_22479 ) ) ( not ( = ?auto_22471 ?auto_22474 ) ) ( not ( = ?auto_22471 ?auto_22465 ) ) ( not ( = ?auto_22467 ?auto_22477 ) ) ( not ( = ?auto_22467 ?auto_22461 ) ) ( not ( = ?auto_22467 ?auto_22466 ) ) ( not ( = ?auto_22467 ?auto_22481 ) ) ( not ( = ?auto_22467 ?auto_22475 ) ) ( not ( = ?auto_22467 ?auto_22482 ) ) ( not ( = ?auto_22478 ?auto_22462 ) ) ( not ( = ?auto_22478 ?auto_22473 ) ) ( not ( = ?auto_22478 ?auto_22472 ) ) ( not ( = ?auto_22478 ?auto_22468 ) ) ( not ( = ?auto_22478 ?auto_22476 ) ) ( not ( = ?auto_22478 ?auto_22469 ) ) ( not ( = ?auto_22478 ?auto_22464 ) ) ( not ( = ?auto_22445 ?auto_22451 ) ) ( not ( = ?auto_22445 ?auto_22463 ) ) ( not ( = ?auto_22446 ?auto_22451 ) ) ( not ( = ?auto_22446 ?auto_22463 ) ) ( not ( = ?auto_22447 ?auto_22451 ) ) ( not ( = ?auto_22447 ?auto_22463 ) ) ( not ( = ?auto_22448 ?auto_22451 ) ) ( not ( = ?auto_22448 ?auto_22463 ) ) ( not ( = ?auto_22449 ?auto_22451 ) ) ( not ( = ?auto_22449 ?auto_22463 ) ) ( not ( = ?auto_22452 ?auto_22451 ) ) ( not ( = ?auto_22452 ?auto_22463 ) ) ( not ( = ?auto_22450 ?auto_22451 ) ) ( not ( = ?auto_22450 ?auto_22463 ) ) ( not ( = ?auto_22454 ?auto_22451 ) ) ( not ( = ?auto_22454 ?auto_22463 ) ) ( not ( = ?auto_22451 ?auto_22478 ) ) ( not ( = ?auto_22451 ?auto_22462 ) ) ( not ( = ?auto_22451 ?auto_22473 ) ) ( not ( = ?auto_22451 ?auto_22472 ) ) ( not ( = ?auto_22451 ?auto_22468 ) ) ( not ( = ?auto_22451 ?auto_22476 ) ) ( not ( = ?auto_22451 ?auto_22469 ) ) ( not ( = ?auto_22451 ?auto_22464 ) ) ( not ( = ?auto_22463 ?auto_22478 ) ) ( not ( = ?auto_22463 ?auto_22462 ) ) ( not ( = ?auto_22463 ?auto_22473 ) ) ( not ( = ?auto_22463 ?auto_22472 ) ) ( not ( = ?auto_22463 ?auto_22468 ) ) ( not ( = ?auto_22463 ?auto_22476 ) ) ( not ( = ?auto_22463 ?auto_22469 ) ) ( not ( = ?auto_22463 ?auto_22464 ) ) ( not ( = ?auto_22445 ?auto_22455 ) ) ( not ( = ?auto_22445 ?auto_22456 ) ) ( not ( = ?auto_22446 ?auto_22455 ) ) ( not ( = ?auto_22446 ?auto_22456 ) ) ( not ( = ?auto_22447 ?auto_22455 ) ) ( not ( = ?auto_22447 ?auto_22456 ) ) ( not ( = ?auto_22448 ?auto_22455 ) ) ( not ( = ?auto_22448 ?auto_22456 ) ) ( not ( = ?auto_22449 ?auto_22455 ) ) ( not ( = ?auto_22449 ?auto_22456 ) ) ( not ( = ?auto_22452 ?auto_22455 ) ) ( not ( = ?auto_22452 ?auto_22456 ) ) ( not ( = ?auto_22450 ?auto_22455 ) ) ( not ( = ?auto_22450 ?auto_22456 ) ) ( not ( = ?auto_22454 ?auto_22455 ) ) ( not ( = ?auto_22454 ?auto_22456 ) ) ( not ( = ?auto_22453 ?auto_22455 ) ) ( not ( = ?auto_22453 ?auto_22456 ) ) ( not ( = ?auto_22455 ?auto_22463 ) ) ( not ( = ?auto_22455 ?auto_22478 ) ) ( not ( = ?auto_22455 ?auto_22462 ) ) ( not ( = ?auto_22455 ?auto_22473 ) ) ( not ( = ?auto_22455 ?auto_22472 ) ) ( not ( = ?auto_22455 ?auto_22468 ) ) ( not ( = ?auto_22455 ?auto_22476 ) ) ( not ( = ?auto_22455 ?auto_22469 ) ) ( not ( = ?auto_22455 ?auto_22464 ) ) ( not ( = ?auto_22456 ?auto_22463 ) ) ( not ( = ?auto_22456 ?auto_22478 ) ) ( not ( = ?auto_22456 ?auto_22462 ) ) ( not ( = ?auto_22456 ?auto_22473 ) ) ( not ( = ?auto_22456 ?auto_22472 ) ) ( not ( = ?auto_22456 ?auto_22468 ) ) ( not ( = ?auto_22456 ?auto_22476 ) ) ( not ( = ?auto_22456 ?auto_22469 ) ) ( not ( = ?auto_22456 ?auto_22464 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_22445 ?auto_22446 ?auto_22447 ?auto_22448 ?auto_22449 ?auto_22452 ?auto_22450 ?auto_22454 ?auto_22453 ?auto_22451 )
      ( MAKE-1CRATE ?auto_22451 ?auto_22455 )
      ( MAKE-10CRATE-VERIFY ?auto_22445 ?auto_22446 ?auto_22447 ?auto_22448 ?auto_22449 ?auto_22452 ?auto_22450 ?auto_22454 ?auto_22453 ?auto_22451 ?auto_22455 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22485 - SURFACE
      ?auto_22486 - SURFACE
    )
    :vars
    (
      ?auto_22487 - HOIST
      ?auto_22488 - PLACE
      ?auto_22490 - PLACE
      ?auto_22491 - HOIST
      ?auto_22492 - SURFACE
      ?auto_22489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22487 ?auto_22488 ) ( SURFACE-AT ?auto_22485 ?auto_22488 ) ( CLEAR ?auto_22485 ) ( IS-CRATE ?auto_22486 ) ( AVAILABLE ?auto_22487 ) ( not ( = ?auto_22490 ?auto_22488 ) ) ( HOIST-AT ?auto_22491 ?auto_22490 ) ( AVAILABLE ?auto_22491 ) ( SURFACE-AT ?auto_22486 ?auto_22490 ) ( ON ?auto_22486 ?auto_22492 ) ( CLEAR ?auto_22486 ) ( TRUCK-AT ?auto_22489 ?auto_22488 ) ( not ( = ?auto_22485 ?auto_22486 ) ) ( not ( = ?auto_22485 ?auto_22492 ) ) ( not ( = ?auto_22486 ?auto_22492 ) ) ( not ( = ?auto_22487 ?auto_22491 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22489 ?auto_22488 ?auto_22490 )
      ( !LIFT ?auto_22491 ?auto_22486 ?auto_22492 ?auto_22490 )
      ( !LOAD ?auto_22491 ?auto_22486 ?auto_22489 ?auto_22490 )
      ( !DRIVE ?auto_22489 ?auto_22490 ?auto_22488 )
      ( !UNLOAD ?auto_22487 ?auto_22486 ?auto_22489 ?auto_22488 )
      ( !DROP ?auto_22487 ?auto_22486 ?auto_22485 ?auto_22488 )
      ( MAKE-1CRATE-VERIFY ?auto_22485 ?auto_22486 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_22505 - SURFACE
      ?auto_22506 - SURFACE
      ?auto_22507 - SURFACE
      ?auto_22508 - SURFACE
      ?auto_22509 - SURFACE
      ?auto_22512 - SURFACE
      ?auto_22510 - SURFACE
      ?auto_22514 - SURFACE
      ?auto_22513 - SURFACE
      ?auto_22511 - SURFACE
      ?auto_22516 - SURFACE
      ?auto_22515 - SURFACE
    )
    :vars
    (
      ?auto_22521 - HOIST
      ?auto_22522 - PLACE
      ?auto_22518 - PLACE
      ?auto_22520 - HOIST
      ?auto_22517 - SURFACE
      ?auto_22525 - PLACE
      ?auto_22526 - HOIST
      ?auto_22534 - SURFACE
      ?auto_22536 - PLACE
      ?auto_22528 - HOIST
      ?auto_22530 - SURFACE
      ?auto_22543 - PLACE
      ?auto_22538 - HOIST
      ?auto_22523 - SURFACE
      ?auto_22539 - PLACE
      ?auto_22532 - HOIST
      ?auto_22537 - SURFACE
      ?auto_22540 - SURFACE
      ?auto_22535 - PLACE
      ?auto_22542 - HOIST
      ?auto_22544 - SURFACE
      ?auto_22541 - PLACE
      ?auto_22529 - HOIST
      ?auto_22531 - SURFACE
      ?auto_22533 - SURFACE
      ?auto_22527 - SURFACE
      ?auto_22524 - SURFACE
      ?auto_22519 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22521 ?auto_22522 ) ( IS-CRATE ?auto_22515 ) ( not ( = ?auto_22518 ?auto_22522 ) ) ( HOIST-AT ?auto_22520 ?auto_22518 ) ( SURFACE-AT ?auto_22515 ?auto_22518 ) ( ON ?auto_22515 ?auto_22517 ) ( CLEAR ?auto_22515 ) ( not ( = ?auto_22516 ?auto_22515 ) ) ( not ( = ?auto_22516 ?auto_22517 ) ) ( not ( = ?auto_22515 ?auto_22517 ) ) ( not ( = ?auto_22521 ?auto_22520 ) ) ( IS-CRATE ?auto_22516 ) ( not ( = ?auto_22525 ?auto_22522 ) ) ( HOIST-AT ?auto_22526 ?auto_22525 ) ( SURFACE-AT ?auto_22516 ?auto_22525 ) ( ON ?auto_22516 ?auto_22534 ) ( CLEAR ?auto_22516 ) ( not ( = ?auto_22511 ?auto_22516 ) ) ( not ( = ?auto_22511 ?auto_22534 ) ) ( not ( = ?auto_22516 ?auto_22534 ) ) ( not ( = ?auto_22521 ?auto_22526 ) ) ( IS-CRATE ?auto_22511 ) ( not ( = ?auto_22536 ?auto_22522 ) ) ( HOIST-AT ?auto_22528 ?auto_22536 ) ( SURFACE-AT ?auto_22511 ?auto_22536 ) ( ON ?auto_22511 ?auto_22530 ) ( CLEAR ?auto_22511 ) ( not ( = ?auto_22513 ?auto_22511 ) ) ( not ( = ?auto_22513 ?auto_22530 ) ) ( not ( = ?auto_22511 ?auto_22530 ) ) ( not ( = ?auto_22521 ?auto_22528 ) ) ( IS-CRATE ?auto_22513 ) ( not ( = ?auto_22543 ?auto_22522 ) ) ( HOIST-AT ?auto_22538 ?auto_22543 ) ( AVAILABLE ?auto_22538 ) ( SURFACE-AT ?auto_22513 ?auto_22543 ) ( ON ?auto_22513 ?auto_22523 ) ( CLEAR ?auto_22513 ) ( not ( = ?auto_22514 ?auto_22513 ) ) ( not ( = ?auto_22514 ?auto_22523 ) ) ( not ( = ?auto_22513 ?auto_22523 ) ) ( not ( = ?auto_22521 ?auto_22538 ) ) ( IS-CRATE ?auto_22514 ) ( not ( = ?auto_22539 ?auto_22522 ) ) ( HOIST-AT ?auto_22532 ?auto_22539 ) ( AVAILABLE ?auto_22532 ) ( SURFACE-AT ?auto_22514 ?auto_22539 ) ( ON ?auto_22514 ?auto_22537 ) ( CLEAR ?auto_22514 ) ( not ( = ?auto_22510 ?auto_22514 ) ) ( not ( = ?auto_22510 ?auto_22537 ) ) ( not ( = ?auto_22514 ?auto_22537 ) ) ( not ( = ?auto_22521 ?auto_22532 ) ) ( IS-CRATE ?auto_22510 ) ( AVAILABLE ?auto_22526 ) ( SURFACE-AT ?auto_22510 ?auto_22525 ) ( ON ?auto_22510 ?auto_22540 ) ( CLEAR ?auto_22510 ) ( not ( = ?auto_22512 ?auto_22510 ) ) ( not ( = ?auto_22512 ?auto_22540 ) ) ( not ( = ?auto_22510 ?auto_22540 ) ) ( IS-CRATE ?auto_22512 ) ( not ( = ?auto_22535 ?auto_22522 ) ) ( HOIST-AT ?auto_22542 ?auto_22535 ) ( SURFACE-AT ?auto_22512 ?auto_22535 ) ( ON ?auto_22512 ?auto_22544 ) ( CLEAR ?auto_22512 ) ( not ( = ?auto_22509 ?auto_22512 ) ) ( not ( = ?auto_22509 ?auto_22544 ) ) ( not ( = ?auto_22512 ?auto_22544 ) ) ( not ( = ?auto_22521 ?auto_22542 ) ) ( IS-CRATE ?auto_22509 ) ( not ( = ?auto_22541 ?auto_22522 ) ) ( HOIST-AT ?auto_22529 ?auto_22541 ) ( AVAILABLE ?auto_22529 ) ( SURFACE-AT ?auto_22509 ?auto_22541 ) ( ON ?auto_22509 ?auto_22531 ) ( CLEAR ?auto_22509 ) ( not ( = ?auto_22508 ?auto_22509 ) ) ( not ( = ?auto_22508 ?auto_22531 ) ) ( not ( = ?auto_22509 ?auto_22531 ) ) ( not ( = ?auto_22521 ?auto_22529 ) ) ( IS-CRATE ?auto_22508 ) ( AVAILABLE ?auto_22520 ) ( SURFACE-AT ?auto_22508 ?auto_22518 ) ( ON ?auto_22508 ?auto_22533 ) ( CLEAR ?auto_22508 ) ( not ( = ?auto_22507 ?auto_22508 ) ) ( not ( = ?auto_22507 ?auto_22533 ) ) ( not ( = ?auto_22508 ?auto_22533 ) ) ( IS-CRATE ?auto_22507 ) ( AVAILABLE ?auto_22542 ) ( SURFACE-AT ?auto_22507 ?auto_22535 ) ( ON ?auto_22507 ?auto_22527 ) ( CLEAR ?auto_22507 ) ( not ( = ?auto_22506 ?auto_22507 ) ) ( not ( = ?auto_22506 ?auto_22527 ) ) ( not ( = ?auto_22507 ?auto_22527 ) ) ( SURFACE-AT ?auto_22505 ?auto_22522 ) ( CLEAR ?auto_22505 ) ( IS-CRATE ?auto_22506 ) ( AVAILABLE ?auto_22521 ) ( AVAILABLE ?auto_22528 ) ( SURFACE-AT ?auto_22506 ?auto_22536 ) ( ON ?auto_22506 ?auto_22524 ) ( CLEAR ?auto_22506 ) ( TRUCK-AT ?auto_22519 ?auto_22522 ) ( not ( = ?auto_22505 ?auto_22506 ) ) ( not ( = ?auto_22505 ?auto_22524 ) ) ( not ( = ?auto_22506 ?auto_22524 ) ) ( not ( = ?auto_22505 ?auto_22507 ) ) ( not ( = ?auto_22505 ?auto_22527 ) ) ( not ( = ?auto_22507 ?auto_22524 ) ) ( not ( = ?auto_22535 ?auto_22536 ) ) ( not ( = ?auto_22542 ?auto_22528 ) ) ( not ( = ?auto_22527 ?auto_22524 ) ) ( not ( = ?auto_22505 ?auto_22508 ) ) ( not ( = ?auto_22505 ?auto_22533 ) ) ( not ( = ?auto_22506 ?auto_22508 ) ) ( not ( = ?auto_22506 ?auto_22533 ) ) ( not ( = ?auto_22508 ?auto_22527 ) ) ( not ( = ?auto_22508 ?auto_22524 ) ) ( not ( = ?auto_22518 ?auto_22535 ) ) ( not ( = ?auto_22518 ?auto_22536 ) ) ( not ( = ?auto_22520 ?auto_22542 ) ) ( not ( = ?auto_22520 ?auto_22528 ) ) ( not ( = ?auto_22533 ?auto_22527 ) ) ( not ( = ?auto_22533 ?auto_22524 ) ) ( not ( = ?auto_22505 ?auto_22509 ) ) ( not ( = ?auto_22505 ?auto_22531 ) ) ( not ( = ?auto_22506 ?auto_22509 ) ) ( not ( = ?auto_22506 ?auto_22531 ) ) ( not ( = ?auto_22507 ?auto_22509 ) ) ( not ( = ?auto_22507 ?auto_22531 ) ) ( not ( = ?auto_22509 ?auto_22533 ) ) ( not ( = ?auto_22509 ?auto_22527 ) ) ( not ( = ?auto_22509 ?auto_22524 ) ) ( not ( = ?auto_22541 ?auto_22518 ) ) ( not ( = ?auto_22541 ?auto_22535 ) ) ( not ( = ?auto_22541 ?auto_22536 ) ) ( not ( = ?auto_22529 ?auto_22520 ) ) ( not ( = ?auto_22529 ?auto_22542 ) ) ( not ( = ?auto_22529 ?auto_22528 ) ) ( not ( = ?auto_22531 ?auto_22533 ) ) ( not ( = ?auto_22531 ?auto_22527 ) ) ( not ( = ?auto_22531 ?auto_22524 ) ) ( not ( = ?auto_22505 ?auto_22512 ) ) ( not ( = ?auto_22505 ?auto_22544 ) ) ( not ( = ?auto_22506 ?auto_22512 ) ) ( not ( = ?auto_22506 ?auto_22544 ) ) ( not ( = ?auto_22507 ?auto_22512 ) ) ( not ( = ?auto_22507 ?auto_22544 ) ) ( not ( = ?auto_22508 ?auto_22512 ) ) ( not ( = ?auto_22508 ?auto_22544 ) ) ( not ( = ?auto_22512 ?auto_22531 ) ) ( not ( = ?auto_22512 ?auto_22533 ) ) ( not ( = ?auto_22512 ?auto_22527 ) ) ( not ( = ?auto_22512 ?auto_22524 ) ) ( not ( = ?auto_22544 ?auto_22531 ) ) ( not ( = ?auto_22544 ?auto_22533 ) ) ( not ( = ?auto_22544 ?auto_22527 ) ) ( not ( = ?auto_22544 ?auto_22524 ) ) ( not ( = ?auto_22505 ?auto_22510 ) ) ( not ( = ?auto_22505 ?auto_22540 ) ) ( not ( = ?auto_22506 ?auto_22510 ) ) ( not ( = ?auto_22506 ?auto_22540 ) ) ( not ( = ?auto_22507 ?auto_22510 ) ) ( not ( = ?auto_22507 ?auto_22540 ) ) ( not ( = ?auto_22508 ?auto_22510 ) ) ( not ( = ?auto_22508 ?auto_22540 ) ) ( not ( = ?auto_22509 ?auto_22510 ) ) ( not ( = ?auto_22509 ?auto_22540 ) ) ( not ( = ?auto_22510 ?auto_22544 ) ) ( not ( = ?auto_22510 ?auto_22531 ) ) ( not ( = ?auto_22510 ?auto_22533 ) ) ( not ( = ?auto_22510 ?auto_22527 ) ) ( not ( = ?auto_22510 ?auto_22524 ) ) ( not ( = ?auto_22525 ?auto_22535 ) ) ( not ( = ?auto_22525 ?auto_22541 ) ) ( not ( = ?auto_22525 ?auto_22518 ) ) ( not ( = ?auto_22525 ?auto_22536 ) ) ( not ( = ?auto_22526 ?auto_22542 ) ) ( not ( = ?auto_22526 ?auto_22529 ) ) ( not ( = ?auto_22526 ?auto_22520 ) ) ( not ( = ?auto_22526 ?auto_22528 ) ) ( not ( = ?auto_22540 ?auto_22544 ) ) ( not ( = ?auto_22540 ?auto_22531 ) ) ( not ( = ?auto_22540 ?auto_22533 ) ) ( not ( = ?auto_22540 ?auto_22527 ) ) ( not ( = ?auto_22540 ?auto_22524 ) ) ( not ( = ?auto_22505 ?auto_22514 ) ) ( not ( = ?auto_22505 ?auto_22537 ) ) ( not ( = ?auto_22506 ?auto_22514 ) ) ( not ( = ?auto_22506 ?auto_22537 ) ) ( not ( = ?auto_22507 ?auto_22514 ) ) ( not ( = ?auto_22507 ?auto_22537 ) ) ( not ( = ?auto_22508 ?auto_22514 ) ) ( not ( = ?auto_22508 ?auto_22537 ) ) ( not ( = ?auto_22509 ?auto_22514 ) ) ( not ( = ?auto_22509 ?auto_22537 ) ) ( not ( = ?auto_22512 ?auto_22514 ) ) ( not ( = ?auto_22512 ?auto_22537 ) ) ( not ( = ?auto_22514 ?auto_22540 ) ) ( not ( = ?auto_22514 ?auto_22544 ) ) ( not ( = ?auto_22514 ?auto_22531 ) ) ( not ( = ?auto_22514 ?auto_22533 ) ) ( not ( = ?auto_22514 ?auto_22527 ) ) ( not ( = ?auto_22514 ?auto_22524 ) ) ( not ( = ?auto_22539 ?auto_22525 ) ) ( not ( = ?auto_22539 ?auto_22535 ) ) ( not ( = ?auto_22539 ?auto_22541 ) ) ( not ( = ?auto_22539 ?auto_22518 ) ) ( not ( = ?auto_22539 ?auto_22536 ) ) ( not ( = ?auto_22532 ?auto_22526 ) ) ( not ( = ?auto_22532 ?auto_22542 ) ) ( not ( = ?auto_22532 ?auto_22529 ) ) ( not ( = ?auto_22532 ?auto_22520 ) ) ( not ( = ?auto_22532 ?auto_22528 ) ) ( not ( = ?auto_22537 ?auto_22540 ) ) ( not ( = ?auto_22537 ?auto_22544 ) ) ( not ( = ?auto_22537 ?auto_22531 ) ) ( not ( = ?auto_22537 ?auto_22533 ) ) ( not ( = ?auto_22537 ?auto_22527 ) ) ( not ( = ?auto_22537 ?auto_22524 ) ) ( not ( = ?auto_22505 ?auto_22513 ) ) ( not ( = ?auto_22505 ?auto_22523 ) ) ( not ( = ?auto_22506 ?auto_22513 ) ) ( not ( = ?auto_22506 ?auto_22523 ) ) ( not ( = ?auto_22507 ?auto_22513 ) ) ( not ( = ?auto_22507 ?auto_22523 ) ) ( not ( = ?auto_22508 ?auto_22513 ) ) ( not ( = ?auto_22508 ?auto_22523 ) ) ( not ( = ?auto_22509 ?auto_22513 ) ) ( not ( = ?auto_22509 ?auto_22523 ) ) ( not ( = ?auto_22512 ?auto_22513 ) ) ( not ( = ?auto_22512 ?auto_22523 ) ) ( not ( = ?auto_22510 ?auto_22513 ) ) ( not ( = ?auto_22510 ?auto_22523 ) ) ( not ( = ?auto_22513 ?auto_22537 ) ) ( not ( = ?auto_22513 ?auto_22540 ) ) ( not ( = ?auto_22513 ?auto_22544 ) ) ( not ( = ?auto_22513 ?auto_22531 ) ) ( not ( = ?auto_22513 ?auto_22533 ) ) ( not ( = ?auto_22513 ?auto_22527 ) ) ( not ( = ?auto_22513 ?auto_22524 ) ) ( not ( = ?auto_22543 ?auto_22539 ) ) ( not ( = ?auto_22543 ?auto_22525 ) ) ( not ( = ?auto_22543 ?auto_22535 ) ) ( not ( = ?auto_22543 ?auto_22541 ) ) ( not ( = ?auto_22543 ?auto_22518 ) ) ( not ( = ?auto_22543 ?auto_22536 ) ) ( not ( = ?auto_22538 ?auto_22532 ) ) ( not ( = ?auto_22538 ?auto_22526 ) ) ( not ( = ?auto_22538 ?auto_22542 ) ) ( not ( = ?auto_22538 ?auto_22529 ) ) ( not ( = ?auto_22538 ?auto_22520 ) ) ( not ( = ?auto_22538 ?auto_22528 ) ) ( not ( = ?auto_22523 ?auto_22537 ) ) ( not ( = ?auto_22523 ?auto_22540 ) ) ( not ( = ?auto_22523 ?auto_22544 ) ) ( not ( = ?auto_22523 ?auto_22531 ) ) ( not ( = ?auto_22523 ?auto_22533 ) ) ( not ( = ?auto_22523 ?auto_22527 ) ) ( not ( = ?auto_22523 ?auto_22524 ) ) ( not ( = ?auto_22505 ?auto_22511 ) ) ( not ( = ?auto_22505 ?auto_22530 ) ) ( not ( = ?auto_22506 ?auto_22511 ) ) ( not ( = ?auto_22506 ?auto_22530 ) ) ( not ( = ?auto_22507 ?auto_22511 ) ) ( not ( = ?auto_22507 ?auto_22530 ) ) ( not ( = ?auto_22508 ?auto_22511 ) ) ( not ( = ?auto_22508 ?auto_22530 ) ) ( not ( = ?auto_22509 ?auto_22511 ) ) ( not ( = ?auto_22509 ?auto_22530 ) ) ( not ( = ?auto_22512 ?auto_22511 ) ) ( not ( = ?auto_22512 ?auto_22530 ) ) ( not ( = ?auto_22510 ?auto_22511 ) ) ( not ( = ?auto_22510 ?auto_22530 ) ) ( not ( = ?auto_22514 ?auto_22511 ) ) ( not ( = ?auto_22514 ?auto_22530 ) ) ( not ( = ?auto_22511 ?auto_22523 ) ) ( not ( = ?auto_22511 ?auto_22537 ) ) ( not ( = ?auto_22511 ?auto_22540 ) ) ( not ( = ?auto_22511 ?auto_22544 ) ) ( not ( = ?auto_22511 ?auto_22531 ) ) ( not ( = ?auto_22511 ?auto_22533 ) ) ( not ( = ?auto_22511 ?auto_22527 ) ) ( not ( = ?auto_22511 ?auto_22524 ) ) ( not ( = ?auto_22530 ?auto_22523 ) ) ( not ( = ?auto_22530 ?auto_22537 ) ) ( not ( = ?auto_22530 ?auto_22540 ) ) ( not ( = ?auto_22530 ?auto_22544 ) ) ( not ( = ?auto_22530 ?auto_22531 ) ) ( not ( = ?auto_22530 ?auto_22533 ) ) ( not ( = ?auto_22530 ?auto_22527 ) ) ( not ( = ?auto_22530 ?auto_22524 ) ) ( not ( = ?auto_22505 ?auto_22516 ) ) ( not ( = ?auto_22505 ?auto_22534 ) ) ( not ( = ?auto_22506 ?auto_22516 ) ) ( not ( = ?auto_22506 ?auto_22534 ) ) ( not ( = ?auto_22507 ?auto_22516 ) ) ( not ( = ?auto_22507 ?auto_22534 ) ) ( not ( = ?auto_22508 ?auto_22516 ) ) ( not ( = ?auto_22508 ?auto_22534 ) ) ( not ( = ?auto_22509 ?auto_22516 ) ) ( not ( = ?auto_22509 ?auto_22534 ) ) ( not ( = ?auto_22512 ?auto_22516 ) ) ( not ( = ?auto_22512 ?auto_22534 ) ) ( not ( = ?auto_22510 ?auto_22516 ) ) ( not ( = ?auto_22510 ?auto_22534 ) ) ( not ( = ?auto_22514 ?auto_22516 ) ) ( not ( = ?auto_22514 ?auto_22534 ) ) ( not ( = ?auto_22513 ?auto_22516 ) ) ( not ( = ?auto_22513 ?auto_22534 ) ) ( not ( = ?auto_22516 ?auto_22530 ) ) ( not ( = ?auto_22516 ?auto_22523 ) ) ( not ( = ?auto_22516 ?auto_22537 ) ) ( not ( = ?auto_22516 ?auto_22540 ) ) ( not ( = ?auto_22516 ?auto_22544 ) ) ( not ( = ?auto_22516 ?auto_22531 ) ) ( not ( = ?auto_22516 ?auto_22533 ) ) ( not ( = ?auto_22516 ?auto_22527 ) ) ( not ( = ?auto_22516 ?auto_22524 ) ) ( not ( = ?auto_22534 ?auto_22530 ) ) ( not ( = ?auto_22534 ?auto_22523 ) ) ( not ( = ?auto_22534 ?auto_22537 ) ) ( not ( = ?auto_22534 ?auto_22540 ) ) ( not ( = ?auto_22534 ?auto_22544 ) ) ( not ( = ?auto_22534 ?auto_22531 ) ) ( not ( = ?auto_22534 ?auto_22533 ) ) ( not ( = ?auto_22534 ?auto_22527 ) ) ( not ( = ?auto_22534 ?auto_22524 ) ) ( not ( = ?auto_22505 ?auto_22515 ) ) ( not ( = ?auto_22505 ?auto_22517 ) ) ( not ( = ?auto_22506 ?auto_22515 ) ) ( not ( = ?auto_22506 ?auto_22517 ) ) ( not ( = ?auto_22507 ?auto_22515 ) ) ( not ( = ?auto_22507 ?auto_22517 ) ) ( not ( = ?auto_22508 ?auto_22515 ) ) ( not ( = ?auto_22508 ?auto_22517 ) ) ( not ( = ?auto_22509 ?auto_22515 ) ) ( not ( = ?auto_22509 ?auto_22517 ) ) ( not ( = ?auto_22512 ?auto_22515 ) ) ( not ( = ?auto_22512 ?auto_22517 ) ) ( not ( = ?auto_22510 ?auto_22515 ) ) ( not ( = ?auto_22510 ?auto_22517 ) ) ( not ( = ?auto_22514 ?auto_22515 ) ) ( not ( = ?auto_22514 ?auto_22517 ) ) ( not ( = ?auto_22513 ?auto_22515 ) ) ( not ( = ?auto_22513 ?auto_22517 ) ) ( not ( = ?auto_22511 ?auto_22515 ) ) ( not ( = ?auto_22511 ?auto_22517 ) ) ( not ( = ?auto_22515 ?auto_22534 ) ) ( not ( = ?auto_22515 ?auto_22530 ) ) ( not ( = ?auto_22515 ?auto_22523 ) ) ( not ( = ?auto_22515 ?auto_22537 ) ) ( not ( = ?auto_22515 ?auto_22540 ) ) ( not ( = ?auto_22515 ?auto_22544 ) ) ( not ( = ?auto_22515 ?auto_22531 ) ) ( not ( = ?auto_22515 ?auto_22533 ) ) ( not ( = ?auto_22515 ?auto_22527 ) ) ( not ( = ?auto_22515 ?auto_22524 ) ) ( not ( = ?auto_22517 ?auto_22534 ) ) ( not ( = ?auto_22517 ?auto_22530 ) ) ( not ( = ?auto_22517 ?auto_22523 ) ) ( not ( = ?auto_22517 ?auto_22537 ) ) ( not ( = ?auto_22517 ?auto_22540 ) ) ( not ( = ?auto_22517 ?auto_22544 ) ) ( not ( = ?auto_22517 ?auto_22531 ) ) ( not ( = ?auto_22517 ?auto_22533 ) ) ( not ( = ?auto_22517 ?auto_22527 ) ) ( not ( = ?auto_22517 ?auto_22524 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_22505 ?auto_22506 ?auto_22507 ?auto_22508 ?auto_22509 ?auto_22512 ?auto_22510 ?auto_22514 ?auto_22513 ?auto_22511 ?auto_22516 )
      ( MAKE-1CRATE ?auto_22516 ?auto_22515 )
      ( MAKE-11CRATE-VERIFY ?auto_22505 ?auto_22506 ?auto_22507 ?auto_22508 ?auto_22509 ?auto_22512 ?auto_22510 ?auto_22514 ?auto_22513 ?auto_22511 ?auto_22516 ?auto_22515 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22547 - SURFACE
      ?auto_22548 - SURFACE
    )
    :vars
    (
      ?auto_22549 - HOIST
      ?auto_22550 - PLACE
      ?auto_22552 - PLACE
      ?auto_22553 - HOIST
      ?auto_22554 - SURFACE
      ?auto_22551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22549 ?auto_22550 ) ( SURFACE-AT ?auto_22547 ?auto_22550 ) ( CLEAR ?auto_22547 ) ( IS-CRATE ?auto_22548 ) ( AVAILABLE ?auto_22549 ) ( not ( = ?auto_22552 ?auto_22550 ) ) ( HOIST-AT ?auto_22553 ?auto_22552 ) ( AVAILABLE ?auto_22553 ) ( SURFACE-AT ?auto_22548 ?auto_22552 ) ( ON ?auto_22548 ?auto_22554 ) ( CLEAR ?auto_22548 ) ( TRUCK-AT ?auto_22551 ?auto_22550 ) ( not ( = ?auto_22547 ?auto_22548 ) ) ( not ( = ?auto_22547 ?auto_22554 ) ) ( not ( = ?auto_22548 ?auto_22554 ) ) ( not ( = ?auto_22549 ?auto_22553 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22551 ?auto_22550 ?auto_22552 )
      ( !LIFT ?auto_22553 ?auto_22548 ?auto_22554 ?auto_22552 )
      ( !LOAD ?auto_22553 ?auto_22548 ?auto_22551 ?auto_22552 )
      ( !DRIVE ?auto_22551 ?auto_22552 ?auto_22550 )
      ( !UNLOAD ?auto_22549 ?auto_22548 ?auto_22551 ?auto_22550 )
      ( !DROP ?auto_22549 ?auto_22548 ?auto_22547 ?auto_22550 )
      ( MAKE-1CRATE-VERIFY ?auto_22547 ?auto_22548 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_22568 - SURFACE
      ?auto_22569 - SURFACE
      ?auto_22570 - SURFACE
      ?auto_22571 - SURFACE
      ?auto_22572 - SURFACE
      ?auto_22575 - SURFACE
      ?auto_22573 - SURFACE
      ?auto_22577 - SURFACE
      ?auto_22576 - SURFACE
      ?auto_22574 - SURFACE
      ?auto_22579 - SURFACE
      ?auto_22578 - SURFACE
      ?auto_22580 - SURFACE
    )
    :vars
    (
      ?auto_22584 - HOIST
      ?auto_22586 - PLACE
      ?auto_22581 - PLACE
      ?auto_22585 - HOIST
      ?auto_22583 - SURFACE
      ?auto_22598 - PLACE
      ?auto_22591 - HOIST
      ?auto_22599 - SURFACE
      ?auto_22590 - PLACE
      ?auto_22588 - HOIST
      ?auto_22596 - SURFACE
      ?auto_22593 - PLACE
      ?auto_22604 - HOIST
      ?auto_22608 - SURFACE
      ?auto_22600 - PLACE
      ?auto_22603 - HOIST
      ?auto_22587 - SURFACE
      ?auto_22606 - PLACE
      ?auto_22602 - HOIST
      ?auto_22589 - SURFACE
      ?auto_22607 - SURFACE
      ?auto_22609 - PLACE
      ?auto_22595 - HOIST
      ?auto_22594 - SURFACE
      ?auto_22605 - SURFACE
      ?auto_22601 - SURFACE
      ?auto_22597 - SURFACE
      ?auto_22592 - SURFACE
      ?auto_22582 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22584 ?auto_22586 ) ( IS-CRATE ?auto_22580 ) ( not ( = ?auto_22581 ?auto_22586 ) ) ( HOIST-AT ?auto_22585 ?auto_22581 ) ( SURFACE-AT ?auto_22580 ?auto_22581 ) ( ON ?auto_22580 ?auto_22583 ) ( CLEAR ?auto_22580 ) ( not ( = ?auto_22578 ?auto_22580 ) ) ( not ( = ?auto_22578 ?auto_22583 ) ) ( not ( = ?auto_22580 ?auto_22583 ) ) ( not ( = ?auto_22584 ?auto_22585 ) ) ( IS-CRATE ?auto_22578 ) ( not ( = ?auto_22598 ?auto_22586 ) ) ( HOIST-AT ?auto_22591 ?auto_22598 ) ( SURFACE-AT ?auto_22578 ?auto_22598 ) ( ON ?auto_22578 ?auto_22599 ) ( CLEAR ?auto_22578 ) ( not ( = ?auto_22579 ?auto_22578 ) ) ( not ( = ?auto_22579 ?auto_22599 ) ) ( not ( = ?auto_22578 ?auto_22599 ) ) ( not ( = ?auto_22584 ?auto_22591 ) ) ( IS-CRATE ?auto_22579 ) ( not ( = ?auto_22590 ?auto_22586 ) ) ( HOIST-AT ?auto_22588 ?auto_22590 ) ( SURFACE-AT ?auto_22579 ?auto_22590 ) ( ON ?auto_22579 ?auto_22596 ) ( CLEAR ?auto_22579 ) ( not ( = ?auto_22574 ?auto_22579 ) ) ( not ( = ?auto_22574 ?auto_22596 ) ) ( not ( = ?auto_22579 ?auto_22596 ) ) ( not ( = ?auto_22584 ?auto_22588 ) ) ( IS-CRATE ?auto_22574 ) ( not ( = ?auto_22593 ?auto_22586 ) ) ( HOIST-AT ?auto_22604 ?auto_22593 ) ( SURFACE-AT ?auto_22574 ?auto_22593 ) ( ON ?auto_22574 ?auto_22608 ) ( CLEAR ?auto_22574 ) ( not ( = ?auto_22576 ?auto_22574 ) ) ( not ( = ?auto_22576 ?auto_22608 ) ) ( not ( = ?auto_22574 ?auto_22608 ) ) ( not ( = ?auto_22584 ?auto_22604 ) ) ( IS-CRATE ?auto_22576 ) ( not ( = ?auto_22600 ?auto_22586 ) ) ( HOIST-AT ?auto_22603 ?auto_22600 ) ( AVAILABLE ?auto_22603 ) ( SURFACE-AT ?auto_22576 ?auto_22600 ) ( ON ?auto_22576 ?auto_22587 ) ( CLEAR ?auto_22576 ) ( not ( = ?auto_22577 ?auto_22576 ) ) ( not ( = ?auto_22577 ?auto_22587 ) ) ( not ( = ?auto_22576 ?auto_22587 ) ) ( not ( = ?auto_22584 ?auto_22603 ) ) ( IS-CRATE ?auto_22577 ) ( not ( = ?auto_22606 ?auto_22586 ) ) ( HOIST-AT ?auto_22602 ?auto_22606 ) ( AVAILABLE ?auto_22602 ) ( SURFACE-AT ?auto_22577 ?auto_22606 ) ( ON ?auto_22577 ?auto_22589 ) ( CLEAR ?auto_22577 ) ( not ( = ?auto_22573 ?auto_22577 ) ) ( not ( = ?auto_22573 ?auto_22589 ) ) ( not ( = ?auto_22577 ?auto_22589 ) ) ( not ( = ?auto_22584 ?auto_22602 ) ) ( IS-CRATE ?auto_22573 ) ( AVAILABLE ?auto_22588 ) ( SURFACE-AT ?auto_22573 ?auto_22590 ) ( ON ?auto_22573 ?auto_22607 ) ( CLEAR ?auto_22573 ) ( not ( = ?auto_22575 ?auto_22573 ) ) ( not ( = ?auto_22575 ?auto_22607 ) ) ( not ( = ?auto_22573 ?auto_22607 ) ) ( IS-CRATE ?auto_22575 ) ( not ( = ?auto_22609 ?auto_22586 ) ) ( HOIST-AT ?auto_22595 ?auto_22609 ) ( SURFACE-AT ?auto_22575 ?auto_22609 ) ( ON ?auto_22575 ?auto_22594 ) ( CLEAR ?auto_22575 ) ( not ( = ?auto_22572 ?auto_22575 ) ) ( not ( = ?auto_22572 ?auto_22594 ) ) ( not ( = ?auto_22575 ?auto_22594 ) ) ( not ( = ?auto_22584 ?auto_22595 ) ) ( IS-CRATE ?auto_22572 ) ( AVAILABLE ?auto_22585 ) ( SURFACE-AT ?auto_22572 ?auto_22581 ) ( ON ?auto_22572 ?auto_22605 ) ( CLEAR ?auto_22572 ) ( not ( = ?auto_22571 ?auto_22572 ) ) ( not ( = ?auto_22571 ?auto_22605 ) ) ( not ( = ?auto_22572 ?auto_22605 ) ) ( IS-CRATE ?auto_22571 ) ( AVAILABLE ?auto_22591 ) ( SURFACE-AT ?auto_22571 ?auto_22598 ) ( ON ?auto_22571 ?auto_22601 ) ( CLEAR ?auto_22571 ) ( not ( = ?auto_22570 ?auto_22571 ) ) ( not ( = ?auto_22570 ?auto_22601 ) ) ( not ( = ?auto_22571 ?auto_22601 ) ) ( IS-CRATE ?auto_22570 ) ( AVAILABLE ?auto_22595 ) ( SURFACE-AT ?auto_22570 ?auto_22609 ) ( ON ?auto_22570 ?auto_22597 ) ( CLEAR ?auto_22570 ) ( not ( = ?auto_22569 ?auto_22570 ) ) ( not ( = ?auto_22569 ?auto_22597 ) ) ( not ( = ?auto_22570 ?auto_22597 ) ) ( SURFACE-AT ?auto_22568 ?auto_22586 ) ( CLEAR ?auto_22568 ) ( IS-CRATE ?auto_22569 ) ( AVAILABLE ?auto_22584 ) ( AVAILABLE ?auto_22604 ) ( SURFACE-AT ?auto_22569 ?auto_22593 ) ( ON ?auto_22569 ?auto_22592 ) ( CLEAR ?auto_22569 ) ( TRUCK-AT ?auto_22582 ?auto_22586 ) ( not ( = ?auto_22568 ?auto_22569 ) ) ( not ( = ?auto_22568 ?auto_22592 ) ) ( not ( = ?auto_22569 ?auto_22592 ) ) ( not ( = ?auto_22568 ?auto_22570 ) ) ( not ( = ?auto_22568 ?auto_22597 ) ) ( not ( = ?auto_22570 ?auto_22592 ) ) ( not ( = ?auto_22609 ?auto_22593 ) ) ( not ( = ?auto_22595 ?auto_22604 ) ) ( not ( = ?auto_22597 ?auto_22592 ) ) ( not ( = ?auto_22568 ?auto_22571 ) ) ( not ( = ?auto_22568 ?auto_22601 ) ) ( not ( = ?auto_22569 ?auto_22571 ) ) ( not ( = ?auto_22569 ?auto_22601 ) ) ( not ( = ?auto_22571 ?auto_22597 ) ) ( not ( = ?auto_22571 ?auto_22592 ) ) ( not ( = ?auto_22598 ?auto_22609 ) ) ( not ( = ?auto_22598 ?auto_22593 ) ) ( not ( = ?auto_22591 ?auto_22595 ) ) ( not ( = ?auto_22591 ?auto_22604 ) ) ( not ( = ?auto_22601 ?auto_22597 ) ) ( not ( = ?auto_22601 ?auto_22592 ) ) ( not ( = ?auto_22568 ?auto_22572 ) ) ( not ( = ?auto_22568 ?auto_22605 ) ) ( not ( = ?auto_22569 ?auto_22572 ) ) ( not ( = ?auto_22569 ?auto_22605 ) ) ( not ( = ?auto_22570 ?auto_22572 ) ) ( not ( = ?auto_22570 ?auto_22605 ) ) ( not ( = ?auto_22572 ?auto_22601 ) ) ( not ( = ?auto_22572 ?auto_22597 ) ) ( not ( = ?auto_22572 ?auto_22592 ) ) ( not ( = ?auto_22581 ?auto_22598 ) ) ( not ( = ?auto_22581 ?auto_22609 ) ) ( not ( = ?auto_22581 ?auto_22593 ) ) ( not ( = ?auto_22585 ?auto_22591 ) ) ( not ( = ?auto_22585 ?auto_22595 ) ) ( not ( = ?auto_22585 ?auto_22604 ) ) ( not ( = ?auto_22605 ?auto_22601 ) ) ( not ( = ?auto_22605 ?auto_22597 ) ) ( not ( = ?auto_22605 ?auto_22592 ) ) ( not ( = ?auto_22568 ?auto_22575 ) ) ( not ( = ?auto_22568 ?auto_22594 ) ) ( not ( = ?auto_22569 ?auto_22575 ) ) ( not ( = ?auto_22569 ?auto_22594 ) ) ( not ( = ?auto_22570 ?auto_22575 ) ) ( not ( = ?auto_22570 ?auto_22594 ) ) ( not ( = ?auto_22571 ?auto_22575 ) ) ( not ( = ?auto_22571 ?auto_22594 ) ) ( not ( = ?auto_22575 ?auto_22605 ) ) ( not ( = ?auto_22575 ?auto_22601 ) ) ( not ( = ?auto_22575 ?auto_22597 ) ) ( not ( = ?auto_22575 ?auto_22592 ) ) ( not ( = ?auto_22594 ?auto_22605 ) ) ( not ( = ?auto_22594 ?auto_22601 ) ) ( not ( = ?auto_22594 ?auto_22597 ) ) ( not ( = ?auto_22594 ?auto_22592 ) ) ( not ( = ?auto_22568 ?auto_22573 ) ) ( not ( = ?auto_22568 ?auto_22607 ) ) ( not ( = ?auto_22569 ?auto_22573 ) ) ( not ( = ?auto_22569 ?auto_22607 ) ) ( not ( = ?auto_22570 ?auto_22573 ) ) ( not ( = ?auto_22570 ?auto_22607 ) ) ( not ( = ?auto_22571 ?auto_22573 ) ) ( not ( = ?auto_22571 ?auto_22607 ) ) ( not ( = ?auto_22572 ?auto_22573 ) ) ( not ( = ?auto_22572 ?auto_22607 ) ) ( not ( = ?auto_22573 ?auto_22594 ) ) ( not ( = ?auto_22573 ?auto_22605 ) ) ( not ( = ?auto_22573 ?auto_22601 ) ) ( not ( = ?auto_22573 ?auto_22597 ) ) ( not ( = ?auto_22573 ?auto_22592 ) ) ( not ( = ?auto_22590 ?auto_22609 ) ) ( not ( = ?auto_22590 ?auto_22581 ) ) ( not ( = ?auto_22590 ?auto_22598 ) ) ( not ( = ?auto_22590 ?auto_22593 ) ) ( not ( = ?auto_22588 ?auto_22595 ) ) ( not ( = ?auto_22588 ?auto_22585 ) ) ( not ( = ?auto_22588 ?auto_22591 ) ) ( not ( = ?auto_22588 ?auto_22604 ) ) ( not ( = ?auto_22607 ?auto_22594 ) ) ( not ( = ?auto_22607 ?auto_22605 ) ) ( not ( = ?auto_22607 ?auto_22601 ) ) ( not ( = ?auto_22607 ?auto_22597 ) ) ( not ( = ?auto_22607 ?auto_22592 ) ) ( not ( = ?auto_22568 ?auto_22577 ) ) ( not ( = ?auto_22568 ?auto_22589 ) ) ( not ( = ?auto_22569 ?auto_22577 ) ) ( not ( = ?auto_22569 ?auto_22589 ) ) ( not ( = ?auto_22570 ?auto_22577 ) ) ( not ( = ?auto_22570 ?auto_22589 ) ) ( not ( = ?auto_22571 ?auto_22577 ) ) ( not ( = ?auto_22571 ?auto_22589 ) ) ( not ( = ?auto_22572 ?auto_22577 ) ) ( not ( = ?auto_22572 ?auto_22589 ) ) ( not ( = ?auto_22575 ?auto_22577 ) ) ( not ( = ?auto_22575 ?auto_22589 ) ) ( not ( = ?auto_22577 ?auto_22607 ) ) ( not ( = ?auto_22577 ?auto_22594 ) ) ( not ( = ?auto_22577 ?auto_22605 ) ) ( not ( = ?auto_22577 ?auto_22601 ) ) ( not ( = ?auto_22577 ?auto_22597 ) ) ( not ( = ?auto_22577 ?auto_22592 ) ) ( not ( = ?auto_22606 ?auto_22590 ) ) ( not ( = ?auto_22606 ?auto_22609 ) ) ( not ( = ?auto_22606 ?auto_22581 ) ) ( not ( = ?auto_22606 ?auto_22598 ) ) ( not ( = ?auto_22606 ?auto_22593 ) ) ( not ( = ?auto_22602 ?auto_22588 ) ) ( not ( = ?auto_22602 ?auto_22595 ) ) ( not ( = ?auto_22602 ?auto_22585 ) ) ( not ( = ?auto_22602 ?auto_22591 ) ) ( not ( = ?auto_22602 ?auto_22604 ) ) ( not ( = ?auto_22589 ?auto_22607 ) ) ( not ( = ?auto_22589 ?auto_22594 ) ) ( not ( = ?auto_22589 ?auto_22605 ) ) ( not ( = ?auto_22589 ?auto_22601 ) ) ( not ( = ?auto_22589 ?auto_22597 ) ) ( not ( = ?auto_22589 ?auto_22592 ) ) ( not ( = ?auto_22568 ?auto_22576 ) ) ( not ( = ?auto_22568 ?auto_22587 ) ) ( not ( = ?auto_22569 ?auto_22576 ) ) ( not ( = ?auto_22569 ?auto_22587 ) ) ( not ( = ?auto_22570 ?auto_22576 ) ) ( not ( = ?auto_22570 ?auto_22587 ) ) ( not ( = ?auto_22571 ?auto_22576 ) ) ( not ( = ?auto_22571 ?auto_22587 ) ) ( not ( = ?auto_22572 ?auto_22576 ) ) ( not ( = ?auto_22572 ?auto_22587 ) ) ( not ( = ?auto_22575 ?auto_22576 ) ) ( not ( = ?auto_22575 ?auto_22587 ) ) ( not ( = ?auto_22573 ?auto_22576 ) ) ( not ( = ?auto_22573 ?auto_22587 ) ) ( not ( = ?auto_22576 ?auto_22589 ) ) ( not ( = ?auto_22576 ?auto_22607 ) ) ( not ( = ?auto_22576 ?auto_22594 ) ) ( not ( = ?auto_22576 ?auto_22605 ) ) ( not ( = ?auto_22576 ?auto_22601 ) ) ( not ( = ?auto_22576 ?auto_22597 ) ) ( not ( = ?auto_22576 ?auto_22592 ) ) ( not ( = ?auto_22600 ?auto_22606 ) ) ( not ( = ?auto_22600 ?auto_22590 ) ) ( not ( = ?auto_22600 ?auto_22609 ) ) ( not ( = ?auto_22600 ?auto_22581 ) ) ( not ( = ?auto_22600 ?auto_22598 ) ) ( not ( = ?auto_22600 ?auto_22593 ) ) ( not ( = ?auto_22603 ?auto_22602 ) ) ( not ( = ?auto_22603 ?auto_22588 ) ) ( not ( = ?auto_22603 ?auto_22595 ) ) ( not ( = ?auto_22603 ?auto_22585 ) ) ( not ( = ?auto_22603 ?auto_22591 ) ) ( not ( = ?auto_22603 ?auto_22604 ) ) ( not ( = ?auto_22587 ?auto_22589 ) ) ( not ( = ?auto_22587 ?auto_22607 ) ) ( not ( = ?auto_22587 ?auto_22594 ) ) ( not ( = ?auto_22587 ?auto_22605 ) ) ( not ( = ?auto_22587 ?auto_22601 ) ) ( not ( = ?auto_22587 ?auto_22597 ) ) ( not ( = ?auto_22587 ?auto_22592 ) ) ( not ( = ?auto_22568 ?auto_22574 ) ) ( not ( = ?auto_22568 ?auto_22608 ) ) ( not ( = ?auto_22569 ?auto_22574 ) ) ( not ( = ?auto_22569 ?auto_22608 ) ) ( not ( = ?auto_22570 ?auto_22574 ) ) ( not ( = ?auto_22570 ?auto_22608 ) ) ( not ( = ?auto_22571 ?auto_22574 ) ) ( not ( = ?auto_22571 ?auto_22608 ) ) ( not ( = ?auto_22572 ?auto_22574 ) ) ( not ( = ?auto_22572 ?auto_22608 ) ) ( not ( = ?auto_22575 ?auto_22574 ) ) ( not ( = ?auto_22575 ?auto_22608 ) ) ( not ( = ?auto_22573 ?auto_22574 ) ) ( not ( = ?auto_22573 ?auto_22608 ) ) ( not ( = ?auto_22577 ?auto_22574 ) ) ( not ( = ?auto_22577 ?auto_22608 ) ) ( not ( = ?auto_22574 ?auto_22587 ) ) ( not ( = ?auto_22574 ?auto_22589 ) ) ( not ( = ?auto_22574 ?auto_22607 ) ) ( not ( = ?auto_22574 ?auto_22594 ) ) ( not ( = ?auto_22574 ?auto_22605 ) ) ( not ( = ?auto_22574 ?auto_22601 ) ) ( not ( = ?auto_22574 ?auto_22597 ) ) ( not ( = ?auto_22574 ?auto_22592 ) ) ( not ( = ?auto_22608 ?auto_22587 ) ) ( not ( = ?auto_22608 ?auto_22589 ) ) ( not ( = ?auto_22608 ?auto_22607 ) ) ( not ( = ?auto_22608 ?auto_22594 ) ) ( not ( = ?auto_22608 ?auto_22605 ) ) ( not ( = ?auto_22608 ?auto_22601 ) ) ( not ( = ?auto_22608 ?auto_22597 ) ) ( not ( = ?auto_22608 ?auto_22592 ) ) ( not ( = ?auto_22568 ?auto_22579 ) ) ( not ( = ?auto_22568 ?auto_22596 ) ) ( not ( = ?auto_22569 ?auto_22579 ) ) ( not ( = ?auto_22569 ?auto_22596 ) ) ( not ( = ?auto_22570 ?auto_22579 ) ) ( not ( = ?auto_22570 ?auto_22596 ) ) ( not ( = ?auto_22571 ?auto_22579 ) ) ( not ( = ?auto_22571 ?auto_22596 ) ) ( not ( = ?auto_22572 ?auto_22579 ) ) ( not ( = ?auto_22572 ?auto_22596 ) ) ( not ( = ?auto_22575 ?auto_22579 ) ) ( not ( = ?auto_22575 ?auto_22596 ) ) ( not ( = ?auto_22573 ?auto_22579 ) ) ( not ( = ?auto_22573 ?auto_22596 ) ) ( not ( = ?auto_22577 ?auto_22579 ) ) ( not ( = ?auto_22577 ?auto_22596 ) ) ( not ( = ?auto_22576 ?auto_22579 ) ) ( not ( = ?auto_22576 ?auto_22596 ) ) ( not ( = ?auto_22579 ?auto_22608 ) ) ( not ( = ?auto_22579 ?auto_22587 ) ) ( not ( = ?auto_22579 ?auto_22589 ) ) ( not ( = ?auto_22579 ?auto_22607 ) ) ( not ( = ?auto_22579 ?auto_22594 ) ) ( not ( = ?auto_22579 ?auto_22605 ) ) ( not ( = ?auto_22579 ?auto_22601 ) ) ( not ( = ?auto_22579 ?auto_22597 ) ) ( not ( = ?auto_22579 ?auto_22592 ) ) ( not ( = ?auto_22596 ?auto_22608 ) ) ( not ( = ?auto_22596 ?auto_22587 ) ) ( not ( = ?auto_22596 ?auto_22589 ) ) ( not ( = ?auto_22596 ?auto_22607 ) ) ( not ( = ?auto_22596 ?auto_22594 ) ) ( not ( = ?auto_22596 ?auto_22605 ) ) ( not ( = ?auto_22596 ?auto_22601 ) ) ( not ( = ?auto_22596 ?auto_22597 ) ) ( not ( = ?auto_22596 ?auto_22592 ) ) ( not ( = ?auto_22568 ?auto_22578 ) ) ( not ( = ?auto_22568 ?auto_22599 ) ) ( not ( = ?auto_22569 ?auto_22578 ) ) ( not ( = ?auto_22569 ?auto_22599 ) ) ( not ( = ?auto_22570 ?auto_22578 ) ) ( not ( = ?auto_22570 ?auto_22599 ) ) ( not ( = ?auto_22571 ?auto_22578 ) ) ( not ( = ?auto_22571 ?auto_22599 ) ) ( not ( = ?auto_22572 ?auto_22578 ) ) ( not ( = ?auto_22572 ?auto_22599 ) ) ( not ( = ?auto_22575 ?auto_22578 ) ) ( not ( = ?auto_22575 ?auto_22599 ) ) ( not ( = ?auto_22573 ?auto_22578 ) ) ( not ( = ?auto_22573 ?auto_22599 ) ) ( not ( = ?auto_22577 ?auto_22578 ) ) ( not ( = ?auto_22577 ?auto_22599 ) ) ( not ( = ?auto_22576 ?auto_22578 ) ) ( not ( = ?auto_22576 ?auto_22599 ) ) ( not ( = ?auto_22574 ?auto_22578 ) ) ( not ( = ?auto_22574 ?auto_22599 ) ) ( not ( = ?auto_22578 ?auto_22596 ) ) ( not ( = ?auto_22578 ?auto_22608 ) ) ( not ( = ?auto_22578 ?auto_22587 ) ) ( not ( = ?auto_22578 ?auto_22589 ) ) ( not ( = ?auto_22578 ?auto_22607 ) ) ( not ( = ?auto_22578 ?auto_22594 ) ) ( not ( = ?auto_22578 ?auto_22605 ) ) ( not ( = ?auto_22578 ?auto_22601 ) ) ( not ( = ?auto_22578 ?auto_22597 ) ) ( not ( = ?auto_22578 ?auto_22592 ) ) ( not ( = ?auto_22599 ?auto_22596 ) ) ( not ( = ?auto_22599 ?auto_22608 ) ) ( not ( = ?auto_22599 ?auto_22587 ) ) ( not ( = ?auto_22599 ?auto_22589 ) ) ( not ( = ?auto_22599 ?auto_22607 ) ) ( not ( = ?auto_22599 ?auto_22594 ) ) ( not ( = ?auto_22599 ?auto_22605 ) ) ( not ( = ?auto_22599 ?auto_22601 ) ) ( not ( = ?auto_22599 ?auto_22597 ) ) ( not ( = ?auto_22599 ?auto_22592 ) ) ( not ( = ?auto_22568 ?auto_22580 ) ) ( not ( = ?auto_22568 ?auto_22583 ) ) ( not ( = ?auto_22569 ?auto_22580 ) ) ( not ( = ?auto_22569 ?auto_22583 ) ) ( not ( = ?auto_22570 ?auto_22580 ) ) ( not ( = ?auto_22570 ?auto_22583 ) ) ( not ( = ?auto_22571 ?auto_22580 ) ) ( not ( = ?auto_22571 ?auto_22583 ) ) ( not ( = ?auto_22572 ?auto_22580 ) ) ( not ( = ?auto_22572 ?auto_22583 ) ) ( not ( = ?auto_22575 ?auto_22580 ) ) ( not ( = ?auto_22575 ?auto_22583 ) ) ( not ( = ?auto_22573 ?auto_22580 ) ) ( not ( = ?auto_22573 ?auto_22583 ) ) ( not ( = ?auto_22577 ?auto_22580 ) ) ( not ( = ?auto_22577 ?auto_22583 ) ) ( not ( = ?auto_22576 ?auto_22580 ) ) ( not ( = ?auto_22576 ?auto_22583 ) ) ( not ( = ?auto_22574 ?auto_22580 ) ) ( not ( = ?auto_22574 ?auto_22583 ) ) ( not ( = ?auto_22579 ?auto_22580 ) ) ( not ( = ?auto_22579 ?auto_22583 ) ) ( not ( = ?auto_22580 ?auto_22599 ) ) ( not ( = ?auto_22580 ?auto_22596 ) ) ( not ( = ?auto_22580 ?auto_22608 ) ) ( not ( = ?auto_22580 ?auto_22587 ) ) ( not ( = ?auto_22580 ?auto_22589 ) ) ( not ( = ?auto_22580 ?auto_22607 ) ) ( not ( = ?auto_22580 ?auto_22594 ) ) ( not ( = ?auto_22580 ?auto_22605 ) ) ( not ( = ?auto_22580 ?auto_22601 ) ) ( not ( = ?auto_22580 ?auto_22597 ) ) ( not ( = ?auto_22580 ?auto_22592 ) ) ( not ( = ?auto_22583 ?auto_22599 ) ) ( not ( = ?auto_22583 ?auto_22596 ) ) ( not ( = ?auto_22583 ?auto_22608 ) ) ( not ( = ?auto_22583 ?auto_22587 ) ) ( not ( = ?auto_22583 ?auto_22589 ) ) ( not ( = ?auto_22583 ?auto_22607 ) ) ( not ( = ?auto_22583 ?auto_22594 ) ) ( not ( = ?auto_22583 ?auto_22605 ) ) ( not ( = ?auto_22583 ?auto_22601 ) ) ( not ( = ?auto_22583 ?auto_22597 ) ) ( not ( = ?auto_22583 ?auto_22592 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_22568 ?auto_22569 ?auto_22570 ?auto_22571 ?auto_22572 ?auto_22575 ?auto_22573 ?auto_22577 ?auto_22576 ?auto_22574 ?auto_22579 ?auto_22578 )
      ( MAKE-1CRATE ?auto_22578 ?auto_22580 )
      ( MAKE-12CRATE-VERIFY ?auto_22568 ?auto_22569 ?auto_22570 ?auto_22571 ?auto_22572 ?auto_22575 ?auto_22573 ?auto_22577 ?auto_22576 ?auto_22574 ?auto_22579 ?auto_22578 ?auto_22580 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22612 - SURFACE
      ?auto_22613 - SURFACE
    )
    :vars
    (
      ?auto_22614 - HOIST
      ?auto_22615 - PLACE
      ?auto_22617 - PLACE
      ?auto_22618 - HOIST
      ?auto_22619 - SURFACE
      ?auto_22616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22614 ?auto_22615 ) ( SURFACE-AT ?auto_22612 ?auto_22615 ) ( CLEAR ?auto_22612 ) ( IS-CRATE ?auto_22613 ) ( AVAILABLE ?auto_22614 ) ( not ( = ?auto_22617 ?auto_22615 ) ) ( HOIST-AT ?auto_22618 ?auto_22617 ) ( AVAILABLE ?auto_22618 ) ( SURFACE-AT ?auto_22613 ?auto_22617 ) ( ON ?auto_22613 ?auto_22619 ) ( CLEAR ?auto_22613 ) ( TRUCK-AT ?auto_22616 ?auto_22615 ) ( not ( = ?auto_22612 ?auto_22613 ) ) ( not ( = ?auto_22612 ?auto_22619 ) ) ( not ( = ?auto_22613 ?auto_22619 ) ) ( not ( = ?auto_22614 ?auto_22618 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22616 ?auto_22615 ?auto_22617 )
      ( !LIFT ?auto_22618 ?auto_22613 ?auto_22619 ?auto_22617 )
      ( !LOAD ?auto_22618 ?auto_22613 ?auto_22616 ?auto_22617 )
      ( !DRIVE ?auto_22616 ?auto_22617 ?auto_22615 )
      ( !UNLOAD ?auto_22614 ?auto_22613 ?auto_22616 ?auto_22615 )
      ( !DROP ?auto_22614 ?auto_22613 ?auto_22612 ?auto_22615 )
      ( MAKE-1CRATE-VERIFY ?auto_22612 ?auto_22613 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_22634 - SURFACE
      ?auto_22635 - SURFACE
      ?auto_22636 - SURFACE
      ?auto_22637 - SURFACE
      ?auto_22638 - SURFACE
      ?auto_22641 - SURFACE
      ?auto_22639 - SURFACE
      ?auto_22643 - SURFACE
      ?auto_22642 - SURFACE
      ?auto_22640 - SURFACE
      ?auto_22645 - SURFACE
      ?auto_22644 - SURFACE
      ?auto_22646 - SURFACE
      ?auto_22647 - SURFACE
    )
    :vars
    (
      ?auto_22653 - HOIST
      ?auto_22649 - PLACE
      ?auto_22652 - PLACE
      ?auto_22651 - HOIST
      ?auto_22650 - SURFACE
      ?auto_22674 - PLACE
      ?auto_22657 - HOIST
      ?auto_22678 - SURFACE
      ?auto_22665 - PLACE
      ?auto_22664 - HOIST
      ?auto_22677 - SURFACE
      ?auto_22658 - PLACE
      ?auto_22669 - HOIST
      ?auto_22661 - SURFACE
      ?auto_22654 - PLACE
      ?auto_22671 - HOIST
      ?auto_22662 - SURFACE
      ?auto_22676 - PLACE
      ?auto_22679 - HOIST
      ?auto_22655 - SURFACE
      ?auto_22656 - PLACE
      ?auto_22666 - HOIST
      ?auto_22660 - SURFACE
      ?auto_22667 - SURFACE
      ?auto_22673 - PLACE
      ?auto_22668 - HOIST
      ?auto_22675 - SURFACE
      ?auto_22670 - SURFACE
      ?auto_22672 - SURFACE
      ?auto_22663 - SURFACE
      ?auto_22659 - SURFACE
      ?auto_22648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22653 ?auto_22649 ) ( IS-CRATE ?auto_22647 ) ( not ( = ?auto_22652 ?auto_22649 ) ) ( HOIST-AT ?auto_22651 ?auto_22652 ) ( AVAILABLE ?auto_22651 ) ( SURFACE-AT ?auto_22647 ?auto_22652 ) ( ON ?auto_22647 ?auto_22650 ) ( CLEAR ?auto_22647 ) ( not ( = ?auto_22646 ?auto_22647 ) ) ( not ( = ?auto_22646 ?auto_22650 ) ) ( not ( = ?auto_22647 ?auto_22650 ) ) ( not ( = ?auto_22653 ?auto_22651 ) ) ( IS-CRATE ?auto_22646 ) ( not ( = ?auto_22674 ?auto_22649 ) ) ( HOIST-AT ?auto_22657 ?auto_22674 ) ( SURFACE-AT ?auto_22646 ?auto_22674 ) ( ON ?auto_22646 ?auto_22678 ) ( CLEAR ?auto_22646 ) ( not ( = ?auto_22644 ?auto_22646 ) ) ( not ( = ?auto_22644 ?auto_22678 ) ) ( not ( = ?auto_22646 ?auto_22678 ) ) ( not ( = ?auto_22653 ?auto_22657 ) ) ( IS-CRATE ?auto_22644 ) ( not ( = ?auto_22665 ?auto_22649 ) ) ( HOIST-AT ?auto_22664 ?auto_22665 ) ( SURFACE-AT ?auto_22644 ?auto_22665 ) ( ON ?auto_22644 ?auto_22677 ) ( CLEAR ?auto_22644 ) ( not ( = ?auto_22645 ?auto_22644 ) ) ( not ( = ?auto_22645 ?auto_22677 ) ) ( not ( = ?auto_22644 ?auto_22677 ) ) ( not ( = ?auto_22653 ?auto_22664 ) ) ( IS-CRATE ?auto_22645 ) ( not ( = ?auto_22658 ?auto_22649 ) ) ( HOIST-AT ?auto_22669 ?auto_22658 ) ( SURFACE-AT ?auto_22645 ?auto_22658 ) ( ON ?auto_22645 ?auto_22661 ) ( CLEAR ?auto_22645 ) ( not ( = ?auto_22640 ?auto_22645 ) ) ( not ( = ?auto_22640 ?auto_22661 ) ) ( not ( = ?auto_22645 ?auto_22661 ) ) ( not ( = ?auto_22653 ?auto_22669 ) ) ( IS-CRATE ?auto_22640 ) ( not ( = ?auto_22654 ?auto_22649 ) ) ( HOIST-AT ?auto_22671 ?auto_22654 ) ( SURFACE-AT ?auto_22640 ?auto_22654 ) ( ON ?auto_22640 ?auto_22662 ) ( CLEAR ?auto_22640 ) ( not ( = ?auto_22642 ?auto_22640 ) ) ( not ( = ?auto_22642 ?auto_22662 ) ) ( not ( = ?auto_22640 ?auto_22662 ) ) ( not ( = ?auto_22653 ?auto_22671 ) ) ( IS-CRATE ?auto_22642 ) ( not ( = ?auto_22676 ?auto_22649 ) ) ( HOIST-AT ?auto_22679 ?auto_22676 ) ( AVAILABLE ?auto_22679 ) ( SURFACE-AT ?auto_22642 ?auto_22676 ) ( ON ?auto_22642 ?auto_22655 ) ( CLEAR ?auto_22642 ) ( not ( = ?auto_22643 ?auto_22642 ) ) ( not ( = ?auto_22643 ?auto_22655 ) ) ( not ( = ?auto_22642 ?auto_22655 ) ) ( not ( = ?auto_22653 ?auto_22679 ) ) ( IS-CRATE ?auto_22643 ) ( not ( = ?auto_22656 ?auto_22649 ) ) ( HOIST-AT ?auto_22666 ?auto_22656 ) ( AVAILABLE ?auto_22666 ) ( SURFACE-AT ?auto_22643 ?auto_22656 ) ( ON ?auto_22643 ?auto_22660 ) ( CLEAR ?auto_22643 ) ( not ( = ?auto_22639 ?auto_22643 ) ) ( not ( = ?auto_22639 ?auto_22660 ) ) ( not ( = ?auto_22643 ?auto_22660 ) ) ( not ( = ?auto_22653 ?auto_22666 ) ) ( IS-CRATE ?auto_22639 ) ( AVAILABLE ?auto_22669 ) ( SURFACE-AT ?auto_22639 ?auto_22658 ) ( ON ?auto_22639 ?auto_22667 ) ( CLEAR ?auto_22639 ) ( not ( = ?auto_22641 ?auto_22639 ) ) ( not ( = ?auto_22641 ?auto_22667 ) ) ( not ( = ?auto_22639 ?auto_22667 ) ) ( IS-CRATE ?auto_22641 ) ( not ( = ?auto_22673 ?auto_22649 ) ) ( HOIST-AT ?auto_22668 ?auto_22673 ) ( SURFACE-AT ?auto_22641 ?auto_22673 ) ( ON ?auto_22641 ?auto_22675 ) ( CLEAR ?auto_22641 ) ( not ( = ?auto_22638 ?auto_22641 ) ) ( not ( = ?auto_22638 ?auto_22675 ) ) ( not ( = ?auto_22641 ?auto_22675 ) ) ( not ( = ?auto_22653 ?auto_22668 ) ) ( IS-CRATE ?auto_22638 ) ( AVAILABLE ?auto_22657 ) ( SURFACE-AT ?auto_22638 ?auto_22674 ) ( ON ?auto_22638 ?auto_22670 ) ( CLEAR ?auto_22638 ) ( not ( = ?auto_22637 ?auto_22638 ) ) ( not ( = ?auto_22637 ?auto_22670 ) ) ( not ( = ?auto_22638 ?auto_22670 ) ) ( IS-CRATE ?auto_22637 ) ( AVAILABLE ?auto_22664 ) ( SURFACE-AT ?auto_22637 ?auto_22665 ) ( ON ?auto_22637 ?auto_22672 ) ( CLEAR ?auto_22637 ) ( not ( = ?auto_22636 ?auto_22637 ) ) ( not ( = ?auto_22636 ?auto_22672 ) ) ( not ( = ?auto_22637 ?auto_22672 ) ) ( IS-CRATE ?auto_22636 ) ( AVAILABLE ?auto_22668 ) ( SURFACE-AT ?auto_22636 ?auto_22673 ) ( ON ?auto_22636 ?auto_22663 ) ( CLEAR ?auto_22636 ) ( not ( = ?auto_22635 ?auto_22636 ) ) ( not ( = ?auto_22635 ?auto_22663 ) ) ( not ( = ?auto_22636 ?auto_22663 ) ) ( SURFACE-AT ?auto_22634 ?auto_22649 ) ( CLEAR ?auto_22634 ) ( IS-CRATE ?auto_22635 ) ( AVAILABLE ?auto_22653 ) ( AVAILABLE ?auto_22671 ) ( SURFACE-AT ?auto_22635 ?auto_22654 ) ( ON ?auto_22635 ?auto_22659 ) ( CLEAR ?auto_22635 ) ( TRUCK-AT ?auto_22648 ?auto_22649 ) ( not ( = ?auto_22634 ?auto_22635 ) ) ( not ( = ?auto_22634 ?auto_22659 ) ) ( not ( = ?auto_22635 ?auto_22659 ) ) ( not ( = ?auto_22634 ?auto_22636 ) ) ( not ( = ?auto_22634 ?auto_22663 ) ) ( not ( = ?auto_22636 ?auto_22659 ) ) ( not ( = ?auto_22673 ?auto_22654 ) ) ( not ( = ?auto_22668 ?auto_22671 ) ) ( not ( = ?auto_22663 ?auto_22659 ) ) ( not ( = ?auto_22634 ?auto_22637 ) ) ( not ( = ?auto_22634 ?auto_22672 ) ) ( not ( = ?auto_22635 ?auto_22637 ) ) ( not ( = ?auto_22635 ?auto_22672 ) ) ( not ( = ?auto_22637 ?auto_22663 ) ) ( not ( = ?auto_22637 ?auto_22659 ) ) ( not ( = ?auto_22665 ?auto_22673 ) ) ( not ( = ?auto_22665 ?auto_22654 ) ) ( not ( = ?auto_22664 ?auto_22668 ) ) ( not ( = ?auto_22664 ?auto_22671 ) ) ( not ( = ?auto_22672 ?auto_22663 ) ) ( not ( = ?auto_22672 ?auto_22659 ) ) ( not ( = ?auto_22634 ?auto_22638 ) ) ( not ( = ?auto_22634 ?auto_22670 ) ) ( not ( = ?auto_22635 ?auto_22638 ) ) ( not ( = ?auto_22635 ?auto_22670 ) ) ( not ( = ?auto_22636 ?auto_22638 ) ) ( not ( = ?auto_22636 ?auto_22670 ) ) ( not ( = ?auto_22638 ?auto_22672 ) ) ( not ( = ?auto_22638 ?auto_22663 ) ) ( not ( = ?auto_22638 ?auto_22659 ) ) ( not ( = ?auto_22674 ?auto_22665 ) ) ( not ( = ?auto_22674 ?auto_22673 ) ) ( not ( = ?auto_22674 ?auto_22654 ) ) ( not ( = ?auto_22657 ?auto_22664 ) ) ( not ( = ?auto_22657 ?auto_22668 ) ) ( not ( = ?auto_22657 ?auto_22671 ) ) ( not ( = ?auto_22670 ?auto_22672 ) ) ( not ( = ?auto_22670 ?auto_22663 ) ) ( not ( = ?auto_22670 ?auto_22659 ) ) ( not ( = ?auto_22634 ?auto_22641 ) ) ( not ( = ?auto_22634 ?auto_22675 ) ) ( not ( = ?auto_22635 ?auto_22641 ) ) ( not ( = ?auto_22635 ?auto_22675 ) ) ( not ( = ?auto_22636 ?auto_22641 ) ) ( not ( = ?auto_22636 ?auto_22675 ) ) ( not ( = ?auto_22637 ?auto_22641 ) ) ( not ( = ?auto_22637 ?auto_22675 ) ) ( not ( = ?auto_22641 ?auto_22670 ) ) ( not ( = ?auto_22641 ?auto_22672 ) ) ( not ( = ?auto_22641 ?auto_22663 ) ) ( not ( = ?auto_22641 ?auto_22659 ) ) ( not ( = ?auto_22675 ?auto_22670 ) ) ( not ( = ?auto_22675 ?auto_22672 ) ) ( not ( = ?auto_22675 ?auto_22663 ) ) ( not ( = ?auto_22675 ?auto_22659 ) ) ( not ( = ?auto_22634 ?auto_22639 ) ) ( not ( = ?auto_22634 ?auto_22667 ) ) ( not ( = ?auto_22635 ?auto_22639 ) ) ( not ( = ?auto_22635 ?auto_22667 ) ) ( not ( = ?auto_22636 ?auto_22639 ) ) ( not ( = ?auto_22636 ?auto_22667 ) ) ( not ( = ?auto_22637 ?auto_22639 ) ) ( not ( = ?auto_22637 ?auto_22667 ) ) ( not ( = ?auto_22638 ?auto_22639 ) ) ( not ( = ?auto_22638 ?auto_22667 ) ) ( not ( = ?auto_22639 ?auto_22675 ) ) ( not ( = ?auto_22639 ?auto_22670 ) ) ( not ( = ?auto_22639 ?auto_22672 ) ) ( not ( = ?auto_22639 ?auto_22663 ) ) ( not ( = ?auto_22639 ?auto_22659 ) ) ( not ( = ?auto_22658 ?auto_22673 ) ) ( not ( = ?auto_22658 ?auto_22674 ) ) ( not ( = ?auto_22658 ?auto_22665 ) ) ( not ( = ?auto_22658 ?auto_22654 ) ) ( not ( = ?auto_22669 ?auto_22668 ) ) ( not ( = ?auto_22669 ?auto_22657 ) ) ( not ( = ?auto_22669 ?auto_22664 ) ) ( not ( = ?auto_22669 ?auto_22671 ) ) ( not ( = ?auto_22667 ?auto_22675 ) ) ( not ( = ?auto_22667 ?auto_22670 ) ) ( not ( = ?auto_22667 ?auto_22672 ) ) ( not ( = ?auto_22667 ?auto_22663 ) ) ( not ( = ?auto_22667 ?auto_22659 ) ) ( not ( = ?auto_22634 ?auto_22643 ) ) ( not ( = ?auto_22634 ?auto_22660 ) ) ( not ( = ?auto_22635 ?auto_22643 ) ) ( not ( = ?auto_22635 ?auto_22660 ) ) ( not ( = ?auto_22636 ?auto_22643 ) ) ( not ( = ?auto_22636 ?auto_22660 ) ) ( not ( = ?auto_22637 ?auto_22643 ) ) ( not ( = ?auto_22637 ?auto_22660 ) ) ( not ( = ?auto_22638 ?auto_22643 ) ) ( not ( = ?auto_22638 ?auto_22660 ) ) ( not ( = ?auto_22641 ?auto_22643 ) ) ( not ( = ?auto_22641 ?auto_22660 ) ) ( not ( = ?auto_22643 ?auto_22667 ) ) ( not ( = ?auto_22643 ?auto_22675 ) ) ( not ( = ?auto_22643 ?auto_22670 ) ) ( not ( = ?auto_22643 ?auto_22672 ) ) ( not ( = ?auto_22643 ?auto_22663 ) ) ( not ( = ?auto_22643 ?auto_22659 ) ) ( not ( = ?auto_22656 ?auto_22658 ) ) ( not ( = ?auto_22656 ?auto_22673 ) ) ( not ( = ?auto_22656 ?auto_22674 ) ) ( not ( = ?auto_22656 ?auto_22665 ) ) ( not ( = ?auto_22656 ?auto_22654 ) ) ( not ( = ?auto_22666 ?auto_22669 ) ) ( not ( = ?auto_22666 ?auto_22668 ) ) ( not ( = ?auto_22666 ?auto_22657 ) ) ( not ( = ?auto_22666 ?auto_22664 ) ) ( not ( = ?auto_22666 ?auto_22671 ) ) ( not ( = ?auto_22660 ?auto_22667 ) ) ( not ( = ?auto_22660 ?auto_22675 ) ) ( not ( = ?auto_22660 ?auto_22670 ) ) ( not ( = ?auto_22660 ?auto_22672 ) ) ( not ( = ?auto_22660 ?auto_22663 ) ) ( not ( = ?auto_22660 ?auto_22659 ) ) ( not ( = ?auto_22634 ?auto_22642 ) ) ( not ( = ?auto_22634 ?auto_22655 ) ) ( not ( = ?auto_22635 ?auto_22642 ) ) ( not ( = ?auto_22635 ?auto_22655 ) ) ( not ( = ?auto_22636 ?auto_22642 ) ) ( not ( = ?auto_22636 ?auto_22655 ) ) ( not ( = ?auto_22637 ?auto_22642 ) ) ( not ( = ?auto_22637 ?auto_22655 ) ) ( not ( = ?auto_22638 ?auto_22642 ) ) ( not ( = ?auto_22638 ?auto_22655 ) ) ( not ( = ?auto_22641 ?auto_22642 ) ) ( not ( = ?auto_22641 ?auto_22655 ) ) ( not ( = ?auto_22639 ?auto_22642 ) ) ( not ( = ?auto_22639 ?auto_22655 ) ) ( not ( = ?auto_22642 ?auto_22660 ) ) ( not ( = ?auto_22642 ?auto_22667 ) ) ( not ( = ?auto_22642 ?auto_22675 ) ) ( not ( = ?auto_22642 ?auto_22670 ) ) ( not ( = ?auto_22642 ?auto_22672 ) ) ( not ( = ?auto_22642 ?auto_22663 ) ) ( not ( = ?auto_22642 ?auto_22659 ) ) ( not ( = ?auto_22676 ?auto_22656 ) ) ( not ( = ?auto_22676 ?auto_22658 ) ) ( not ( = ?auto_22676 ?auto_22673 ) ) ( not ( = ?auto_22676 ?auto_22674 ) ) ( not ( = ?auto_22676 ?auto_22665 ) ) ( not ( = ?auto_22676 ?auto_22654 ) ) ( not ( = ?auto_22679 ?auto_22666 ) ) ( not ( = ?auto_22679 ?auto_22669 ) ) ( not ( = ?auto_22679 ?auto_22668 ) ) ( not ( = ?auto_22679 ?auto_22657 ) ) ( not ( = ?auto_22679 ?auto_22664 ) ) ( not ( = ?auto_22679 ?auto_22671 ) ) ( not ( = ?auto_22655 ?auto_22660 ) ) ( not ( = ?auto_22655 ?auto_22667 ) ) ( not ( = ?auto_22655 ?auto_22675 ) ) ( not ( = ?auto_22655 ?auto_22670 ) ) ( not ( = ?auto_22655 ?auto_22672 ) ) ( not ( = ?auto_22655 ?auto_22663 ) ) ( not ( = ?auto_22655 ?auto_22659 ) ) ( not ( = ?auto_22634 ?auto_22640 ) ) ( not ( = ?auto_22634 ?auto_22662 ) ) ( not ( = ?auto_22635 ?auto_22640 ) ) ( not ( = ?auto_22635 ?auto_22662 ) ) ( not ( = ?auto_22636 ?auto_22640 ) ) ( not ( = ?auto_22636 ?auto_22662 ) ) ( not ( = ?auto_22637 ?auto_22640 ) ) ( not ( = ?auto_22637 ?auto_22662 ) ) ( not ( = ?auto_22638 ?auto_22640 ) ) ( not ( = ?auto_22638 ?auto_22662 ) ) ( not ( = ?auto_22641 ?auto_22640 ) ) ( not ( = ?auto_22641 ?auto_22662 ) ) ( not ( = ?auto_22639 ?auto_22640 ) ) ( not ( = ?auto_22639 ?auto_22662 ) ) ( not ( = ?auto_22643 ?auto_22640 ) ) ( not ( = ?auto_22643 ?auto_22662 ) ) ( not ( = ?auto_22640 ?auto_22655 ) ) ( not ( = ?auto_22640 ?auto_22660 ) ) ( not ( = ?auto_22640 ?auto_22667 ) ) ( not ( = ?auto_22640 ?auto_22675 ) ) ( not ( = ?auto_22640 ?auto_22670 ) ) ( not ( = ?auto_22640 ?auto_22672 ) ) ( not ( = ?auto_22640 ?auto_22663 ) ) ( not ( = ?auto_22640 ?auto_22659 ) ) ( not ( = ?auto_22662 ?auto_22655 ) ) ( not ( = ?auto_22662 ?auto_22660 ) ) ( not ( = ?auto_22662 ?auto_22667 ) ) ( not ( = ?auto_22662 ?auto_22675 ) ) ( not ( = ?auto_22662 ?auto_22670 ) ) ( not ( = ?auto_22662 ?auto_22672 ) ) ( not ( = ?auto_22662 ?auto_22663 ) ) ( not ( = ?auto_22662 ?auto_22659 ) ) ( not ( = ?auto_22634 ?auto_22645 ) ) ( not ( = ?auto_22634 ?auto_22661 ) ) ( not ( = ?auto_22635 ?auto_22645 ) ) ( not ( = ?auto_22635 ?auto_22661 ) ) ( not ( = ?auto_22636 ?auto_22645 ) ) ( not ( = ?auto_22636 ?auto_22661 ) ) ( not ( = ?auto_22637 ?auto_22645 ) ) ( not ( = ?auto_22637 ?auto_22661 ) ) ( not ( = ?auto_22638 ?auto_22645 ) ) ( not ( = ?auto_22638 ?auto_22661 ) ) ( not ( = ?auto_22641 ?auto_22645 ) ) ( not ( = ?auto_22641 ?auto_22661 ) ) ( not ( = ?auto_22639 ?auto_22645 ) ) ( not ( = ?auto_22639 ?auto_22661 ) ) ( not ( = ?auto_22643 ?auto_22645 ) ) ( not ( = ?auto_22643 ?auto_22661 ) ) ( not ( = ?auto_22642 ?auto_22645 ) ) ( not ( = ?auto_22642 ?auto_22661 ) ) ( not ( = ?auto_22645 ?auto_22662 ) ) ( not ( = ?auto_22645 ?auto_22655 ) ) ( not ( = ?auto_22645 ?auto_22660 ) ) ( not ( = ?auto_22645 ?auto_22667 ) ) ( not ( = ?auto_22645 ?auto_22675 ) ) ( not ( = ?auto_22645 ?auto_22670 ) ) ( not ( = ?auto_22645 ?auto_22672 ) ) ( not ( = ?auto_22645 ?auto_22663 ) ) ( not ( = ?auto_22645 ?auto_22659 ) ) ( not ( = ?auto_22661 ?auto_22662 ) ) ( not ( = ?auto_22661 ?auto_22655 ) ) ( not ( = ?auto_22661 ?auto_22660 ) ) ( not ( = ?auto_22661 ?auto_22667 ) ) ( not ( = ?auto_22661 ?auto_22675 ) ) ( not ( = ?auto_22661 ?auto_22670 ) ) ( not ( = ?auto_22661 ?auto_22672 ) ) ( not ( = ?auto_22661 ?auto_22663 ) ) ( not ( = ?auto_22661 ?auto_22659 ) ) ( not ( = ?auto_22634 ?auto_22644 ) ) ( not ( = ?auto_22634 ?auto_22677 ) ) ( not ( = ?auto_22635 ?auto_22644 ) ) ( not ( = ?auto_22635 ?auto_22677 ) ) ( not ( = ?auto_22636 ?auto_22644 ) ) ( not ( = ?auto_22636 ?auto_22677 ) ) ( not ( = ?auto_22637 ?auto_22644 ) ) ( not ( = ?auto_22637 ?auto_22677 ) ) ( not ( = ?auto_22638 ?auto_22644 ) ) ( not ( = ?auto_22638 ?auto_22677 ) ) ( not ( = ?auto_22641 ?auto_22644 ) ) ( not ( = ?auto_22641 ?auto_22677 ) ) ( not ( = ?auto_22639 ?auto_22644 ) ) ( not ( = ?auto_22639 ?auto_22677 ) ) ( not ( = ?auto_22643 ?auto_22644 ) ) ( not ( = ?auto_22643 ?auto_22677 ) ) ( not ( = ?auto_22642 ?auto_22644 ) ) ( not ( = ?auto_22642 ?auto_22677 ) ) ( not ( = ?auto_22640 ?auto_22644 ) ) ( not ( = ?auto_22640 ?auto_22677 ) ) ( not ( = ?auto_22644 ?auto_22661 ) ) ( not ( = ?auto_22644 ?auto_22662 ) ) ( not ( = ?auto_22644 ?auto_22655 ) ) ( not ( = ?auto_22644 ?auto_22660 ) ) ( not ( = ?auto_22644 ?auto_22667 ) ) ( not ( = ?auto_22644 ?auto_22675 ) ) ( not ( = ?auto_22644 ?auto_22670 ) ) ( not ( = ?auto_22644 ?auto_22672 ) ) ( not ( = ?auto_22644 ?auto_22663 ) ) ( not ( = ?auto_22644 ?auto_22659 ) ) ( not ( = ?auto_22677 ?auto_22661 ) ) ( not ( = ?auto_22677 ?auto_22662 ) ) ( not ( = ?auto_22677 ?auto_22655 ) ) ( not ( = ?auto_22677 ?auto_22660 ) ) ( not ( = ?auto_22677 ?auto_22667 ) ) ( not ( = ?auto_22677 ?auto_22675 ) ) ( not ( = ?auto_22677 ?auto_22670 ) ) ( not ( = ?auto_22677 ?auto_22672 ) ) ( not ( = ?auto_22677 ?auto_22663 ) ) ( not ( = ?auto_22677 ?auto_22659 ) ) ( not ( = ?auto_22634 ?auto_22646 ) ) ( not ( = ?auto_22634 ?auto_22678 ) ) ( not ( = ?auto_22635 ?auto_22646 ) ) ( not ( = ?auto_22635 ?auto_22678 ) ) ( not ( = ?auto_22636 ?auto_22646 ) ) ( not ( = ?auto_22636 ?auto_22678 ) ) ( not ( = ?auto_22637 ?auto_22646 ) ) ( not ( = ?auto_22637 ?auto_22678 ) ) ( not ( = ?auto_22638 ?auto_22646 ) ) ( not ( = ?auto_22638 ?auto_22678 ) ) ( not ( = ?auto_22641 ?auto_22646 ) ) ( not ( = ?auto_22641 ?auto_22678 ) ) ( not ( = ?auto_22639 ?auto_22646 ) ) ( not ( = ?auto_22639 ?auto_22678 ) ) ( not ( = ?auto_22643 ?auto_22646 ) ) ( not ( = ?auto_22643 ?auto_22678 ) ) ( not ( = ?auto_22642 ?auto_22646 ) ) ( not ( = ?auto_22642 ?auto_22678 ) ) ( not ( = ?auto_22640 ?auto_22646 ) ) ( not ( = ?auto_22640 ?auto_22678 ) ) ( not ( = ?auto_22645 ?auto_22646 ) ) ( not ( = ?auto_22645 ?auto_22678 ) ) ( not ( = ?auto_22646 ?auto_22677 ) ) ( not ( = ?auto_22646 ?auto_22661 ) ) ( not ( = ?auto_22646 ?auto_22662 ) ) ( not ( = ?auto_22646 ?auto_22655 ) ) ( not ( = ?auto_22646 ?auto_22660 ) ) ( not ( = ?auto_22646 ?auto_22667 ) ) ( not ( = ?auto_22646 ?auto_22675 ) ) ( not ( = ?auto_22646 ?auto_22670 ) ) ( not ( = ?auto_22646 ?auto_22672 ) ) ( not ( = ?auto_22646 ?auto_22663 ) ) ( not ( = ?auto_22646 ?auto_22659 ) ) ( not ( = ?auto_22678 ?auto_22677 ) ) ( not ( = ?auto_22678 ?auto_22661 ) ) ( not ( = ?auto_22678 ?auto_22662 ) ) ( not ( = ?auto_22678 ?auto_22655 ) ) ( not ( = ?auto_22678 ?auto_22660 ) ) ( not ( = ?auto_22678 ?auto_22667 ) ) ( not ( = ?auto_22678 ?auto_22675 ) ) ( not ( = ?auto_22678 ?auto_22670 ) ) ( not ( = ?auto_22678 ?auto_22672 ) ) ( not ( = ?auto_22678 ?auto_22663 ) ) ( not ( = ?auto_22678 ?auto_22659 ) ) ( not ( = ?auto_22634 ?auto_22647 ) ) ( not ( = ?auto_22634 ?auto_22650 ) ) ( not ( = ?auto_22635 ?auto_22647 ) ) ( not ( = ?auto_22635 ?auto_22650 ) ) ( not ( = ?auto_22636 ?auto_22647 ) ) ( not ( = ?auto_22636 ?auto_22650 ) ) ( not ( = ?auto_22637 ?auto_22647 ) ) ( not ( = ?auto_22637 ?auto_22650 ) ) ( not ( = ?auto_22638 ?auto_22647 ) ) ( not ( = ?auto_22638 ?auto_22650 ) ) ( not ( = ?auto_22641 ?auto_22647 ) ) ( not ( = ?auto_22641 ?auto_22650 ) ) ( not ( = ?auto_22639 ?auto_22647 ) ) ( not ( = ?auto_22639 ?auto_22650 ) ) ( not ( = ?auto_22643 ?auto_22647 ) ) ( not ( = ?auto_22643 ?auto_22650 ) ) ( not ( = ?auto_22642 ?auto_22647 ) ) ( not ( = ?auto_22642 ?auto_22650 ) ) ( not ( = ?auto_22640 ?auto_22647 ) ) ( not ( = ?auto_22640 ?auto_22650 ) ) ( not ( = ?auto_22645 ?auto_22647 ) ) ( not ( = ?auto_22645 ?auto_22650 ) ) ( not ( = ?auto_22644 ?auto_22647 ) ) ( not ( = ?auto_22644 ?auto_22650 ) ) ( not ( = ?auto_22647 ?auto_22678 ) ) ( not ( = ?auto_22647 ?auto_22677 ) ) ( not ( = ?auto_22647 ?auto_22661 ) ) ( not ( = ?auto_22647 ?auto_22662 ) ) ( not ( = ?auto_22647 ?auto_22655 ) ) ( not ( = ?auto_22647 ?auto_22660 ) ) ( not ( = ?auto_22647 ?auto_22667 ) ) ( not ( = ?auto_22647 ?auto_22675 ) ) ( not ( = ?auto_22647 ?auto_22670 ) ) ( not ( = ?auto_22647 ?auto_22672 ) ) ( not ( = ?auto_22647 ?auto_22663 ) ) ( not ( = ?auto_22647 ?auto_22659 ) ) ( not ( = ?auto_22652 ?auto_22674 ) ) ( not ( = ?auto_22652 ?auto_22665 ) ) ( not ( = ?auto_22652 ?auto_22658 ) ) ( not ( = ?auto_22652 ?auto_22654 ) ) ( not ( = ?auto_22652 ?auto_22676 ) ) ( not ( = ?auto_22652 ?auto_22656 ) ) ( not ( = ?auto_22652 ?auto_22673 ) ) ( not ( = ?auto_22651 ?auto_22657 ) ) ( not ( = ?auto_22651 ?auto_22664 ) ) ( not ( = ?auto_22651 ?auto_22669 ) ) ( not ( = ?auto_22651 ?auto_22671 ) ) ( not ( = ?auto_22651 ?auto_22679 ) ) ( not ( = ?auto_22651 ?auto_22666 ) ) ( not ( = ?auto_22651 ?auto_22668 ) ) ( not ( = ?auto_22650 ?auto_22678 ) ) ( not ( = ?auto_22650 ?auto_22677 ) ) ( not ( = ?auto_22650 ?auto_22661 ) ) ( not ( = ?auto_22650 ?auto_22662 ) ) ( not ( = ?auto_22650 ?auto_22655 ) ) ( not ( = ?auto_22650 ?auto_22660 ) ) ( not ( = ?auto_22650 ?auto_22667 ) ) ( not ( = ?auto_22650 ?auto_22675 ) ) ( not ( = ?auto_22650 ?auto_22670 ) ) ( not ( = ?auto_22650 ?auto_22672 ) ) ( not ( = ?auto_22650 ?auto_22663 ) ) ( not ( = ?auto_22650 ?auto_22659 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_22634 ?auto_22635 ?auto_22636 ?auto_22637 ?auto_22638 ?auto_22641 ?auto_22639 ?auto_22643 ?auto_22642 ?auto_22640 ?auto_22645 ?auto_22644 ?auto_22646 )
      ( MAKE-1CRATE ?auto_22646 ?auto_22647 )
      ( MAKE-13CRATE-VERIFY ?auto_22634 ?auto_22635 ?auto_22636 ?auto_22637 ?auto_22638 ?auto_22641 ?auto_22639 ?auto_22643 ?auto_22642 ?auto_22640 ?auto_22645 ?auto_22644 ?auto_22646 ?auto_22647 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22682 - SURFACE
      ?auto_22683 - SURFACE
    )
    :vars
    (
      ?auto_22684 - HOIST
      ?auto_22685 - PLACE
      ?auto_22687 - PLACE
      ?auto_22688 - HOIST
      ?auto_22689 - SURFACE
      ?auto_22686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22684 ?auto_22685 ) ( SURFACE-AT ?auto_22682 ?auto_22685 ) ( CLEAR ?auto_22682 ) ( IS-CRATE ?auto_22683 ) ( AVAILABLE ?auto_22684 ) ( not ( = ?auto_22687 ?auto_22685 ) ) ( HOIST-AT ?auto_22688 ?auto_22687 ) ( AVAILABLE ?auto_22688 ) ( SURFACE-AT ?auto_22683 ?auto_22687 ) ( ON ?auto_22683 ?auto_22689 ) ( CLEAR ?auto_22683 ) ( TRUCK-AT ?auto_22686 ?auto_22685 ) ( not ( = ?auto_22682 ?auto_22683 ) ) ( not ( = ?auto_22682 ?auto_22689 ) ) ( not ( = ?auto_22683 ?auto_22689 ) ) ( not ( = ?auto_22684 ?auto_22688 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22686 ?auto_22685 ?auto_22687 )
      ( !LIFT ?auto_22688 ?auto_22683 ?auto_22689 ?auto_22687 )
      ( !LOAD ?auto_22688 ?auto_22683 ?auto_22686 ?auto_22687 )
      ( !DRIVE ?auto_22686 ?auto_22687 ?auto_22685 )
      ( !UNLOAD ?auto_22684 ?auto_22683 ?auto_22686 ?auto_22685 )
      ( !DROP ?auto_22684 ?auto_22683 ?auto_22682 ?auto_22685 )
      ( MAKE-1CRATE-VERIFY ?auto_22682 ?auto_22683 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_22705 - SURFACE
      ?auto_22706 - SURFACE
      ?auto_22707 - SURFACE
      ?auto_22708 - SURFACE
      ?auto_22709 - SURFACE
      ?auto_22712 - SURFACE
      ?auto_22710 - SURFACE
      ?auto_22714 - SURFACE
      ?auto_22713 - SURFACE
      ?auto_22711 - SURFACE
      ?auto_22716 - SURFACE
      ?auto_22715 - SURFACE
      ?auto_22717 - SURFACE
      ?auto_22718 - SURFACE
      ?auto_22719 - SURFACE
    )
    :vars
    (
      ?auto_22721 - HOIST
      ?auto_22720 - PLACE
      ?auto_22724 - PLACE
      ?auto_22722 - HOIST
      ?auto_22723 - SURFACE
      ?auto_22746 - PLACE
      ?auto_22727 - HOIST
      ?auto_22750 - SURFACE
      ?auto_22735 - PLACE
      ?auto_22737 - HOIST
      ?auto_22734 - SURFACE
      ?auto_22728 - PLACE
      ?auto_22744 - HOIST
      ?auto_22748 - SURFACE
      ?auto_22752 - PLACE
      ?auto_22743 - HOIST
      ?auto_22754 - SURFACE
      ?auto_22730 - PLACE
      ?auto_22749 - HOIST
      ?auto_22726 - SURFACE
      ?auto_22733 - PLACE
      ?auto_22738 - HOIST
      ?auto_22753 - SURFACE
      ?auto_22736 - PLACE
      ?auto_22742 - HOIST
      ?auto_22739 - SURFACE
      ?auto_22729 - SURFACE
      ?auto_22731 - PLACE
      ?auto_22751 - HOIST
      ?auto_22740 - SURFACE
      ?auto_22741 - SURFACE
      ?auto_22732 - SURFACE
      ?auto_22747 - SURFACE
      ?auto_22745 - SURFACE
      ?auto_22725 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22721 ?auto_22720 ) ( IS-CRATE ?auto_22719 ) ( not ( = ?auto_22724 ?auto_22720 ) ) ( HOIST-AT ?auto_22722 ?auto_22724 ) ( AVAILABLE ?auto_22722 ) ( SURFACE-AT ?auto_22719 ?auto_22724 ) ( ON ?auto_22719 ?auto_22723 ) ( CLEAR ?auto_22719 ) ( not ( = ?auto_22718 ?auto_22719 ) ) ( not ( = ?auto_22718 ?auto_22723 ) ) ( not ( = ?auto_22719 ?auto_22723 ) ) ( not ( = ?auto_22721 ?auto_22722 ) ) ( IS-CRATE ?auto_22718 ) ( not ( = ?auto_22746 ?auto_22720 ) ) ( HOIST-AT ?auto_22727 ?auto_22746 ) ( AVAILABLE ?auto_22727 ) ( SURFACE-AT ?auto_22718 ?auto_22746 ) ( ON ?auto_22718 ?auto_22750 ) ( CLEAR ?auto_22718 ) ( not ( = ?auto_22717 ?auto_22718 ) ) ( not ( = ?auto_22717 ?auto_22750 ) ) ( not ( = ?auto_22718 ?auto_22750 ) ) ( not ( = ?auto_22721 ?auto_22727 ) ) ( IS-CRATE ?auto_22717 ) ( not ( = ?auto_22735 ?auto_22720 ) ) ( HOIST-AT ?auto_22737 ?auto_22735 ) ( SURFACE-AT ?auto_22717 ?auto_22735 ) ( ON ?auto_22717 ?auto_22734 ) ( CLEAR ?auto_22717 ) ( not ( = ?auto_22715 ?auto_22717 ) ) ( not ( = ?auto_22715 ?auto_22734 ) ) ( not ( = ?auto_22717 ?auto_22734 ) ) ( not ( = ?auto_22721 ?auto_22737 ) ) ( IS-CRATE ?auto_22715 ) ( not ( = ?auto_22728 ?auto_22720 ) ) ( HOIST-AT ?auto_22744 ?auto_22728 ) ( SURFACE-AT ?auto_22715 ?auto_22728 ) ( ON ?auto_22715 ?auto_22748 ) ( CLEAR ?auto_22715 ) ( not ( = ?auto_22716 ?auto_22715 ) ) ( not ( = ?auto_22716 ?auto_22748 ) ) ( not ( = ?auto_22715 ?auto_22748 ) ) ( not ( = ?auto_22721 ?auto_22744 ) ) ( IS-CRATE ?auto_22716 ) ( not ( = ?auto_22752 ?auto_22720 ) ) ( HOIST-AT ?auto_22743 ?auto_22752 ) ( SURFACE-AT ?auto_22716 ?auto_22752 ) ( ON ?auto_22716 ?auto_22754 ) ( CLEAR ?auto_22716 ) ( not ( = ?auto_22711 ?auto_22716 ) ) ( not ( = ?auto_22711 ?auto_22754 ) ) ( not ( = ?auto_22716 ?auto_22754 ) ) ( not ( = ?auto_22721 ?auto_22743 ) ) ( IS-CRATE ?auto_22711 ) ( not ( = ?auto_22730 ?auto_22720 ) ) ( HOIST-AT ?auto_22749 ?auto_22730 ) ( SURFACE-AT ?auto_22711 ?auto_22730 ) ( ON ?auto_22711 ?auto_22726 ) ( CLEAR ?auto_22711 ) ( not ( = ?auto_22713 ?auto_22711 ) ) ( not ( = ?auto_22713 ?auto_22726 ) ) ( not ( = ?auto_22711 ?auto_22726 ) ) ( not ( = ?auto_22721 ?auto_22749 ) ) ( IS-CRATE ?auto_22713 ) ( not ( = ?auto_22733 ?auto_22720 ) ) ( HOIST-AT ?auto_22738 ?auto_22733 ) ( AVAILABLE ?auto_22738 ) ( SURFACE-AT ?auto_22713 ?auto_22733 ) ( ON ?auto_22713 ?auto_22753 ) ( CLEAR ?auto_22713 ) ( not ( = ?auto_22714 ?auto_22713 ) ) ( not ( = ?auto_22714 ?auto_22753 ) ) ( not ( = ?auto_22713 ?auto_22753 ) ) ( not ( = ?auto_22721 ?auto_22738 ) ) ( IS-CRATE ?auto_22714 ) ( not ( = ?auto_22736 ?auto_22720 ) ) ( HOIST-AT ?auto_22742 ?auto_22736 ) ( AVAILABLE ?auto_22742 ) ( SURFACE-AT ?auto_22714 ?auto_22736 ) ( ON ?auto_22714 ?auto_22739 ) ( CLEAR ?auto_22714 ) ( not ( = ?auto_22710 ?auto_22714 ) ) ( not ( = ?auto_22710 ?auto_22739 ) ) ( not ( = ?auto_22714 ?auto_22739 ) ) ( not ( = ?auto_22721 ?auto_22742 ) ) ( IS-CRATE ?auto_22710 ) ( AVAILABLE ?auto_22743 ) ( SURFACE-AT ?auto_22710 ?auto_22752 ) ( ON ?auto_22710 ?auto_22729 ) ( CLEAR ?auto_22710 ) ( not ( = ?auto_22712 ?auto_22710 ) ) ( not ( = ?auto_22712 ?auto_22729 ) ) ( not ( = ?auto_22710 ?auto_22729 ) ) ( IS-CRATE ?auto_22712 ) ( not ( = ?auto_22731 ?auto_22720 ) ) ( HOIST-AT ?auto_22751 ?auto_22731 ) ( SURFACE-AT ?auto_22712 ?auto_22731 ) ( ON ?auto_22712 ?auto_22740 ) ( CLEAR ?auto_22712 ) ( not ( = ?auto_22709 ?auto_22712 ) ) ( not ( = ?auto_22709 ?auto_22740 ) ) ( not ( = ?auto_22712 ?auto_22740 ) ) ( not ( = ?auto_22721 ?auto_22751 ) ) ( IS-CRATE ?auto_22709 ) ( AVAILABLE ?auto_22737 ) ( SURFACE-AT ?auto_22709 ?auto_22735 ) ( ON ?auto_22709 ?auto_22741 ) ( CLEAR ?auto_22709 ) ( not ( = ?auto_22708 ?auto_22709 ) ) ( not ( = ?auto_22708 ?auto_22741 ) ) ( not ( = ?auto_22709 ?auto_22741 ) ) ( IS-CRATE ?auto_22708 ) ( AVAILABLE ?auto_22744 ) ( SURFACE-AT ?auto_22708 ?auto_22728 ) ( ON ?auto_22708 ?auto_22732 ) ( CLEAR ?auto_22708 ) ( not ( = ?auto_22707 ?auto_22708 ) ) ( not ( = ?auto_22707 ?auto_22732 ) ) ( not ( = ?auto_22708 ?auto_22732 ) ) ( IS-CRATE ?auto_22707 ) ( AVAILABLE ?auto_22751 ) ( SURFACE-AT ?auto_22707 ?auto_22731 ) ( ON ?auto_22707 ?auto_22747 ) ( CLEAR ?auto_22707 ) ( not ( = ?auto_22706 ?auto_22707 ) ) ( not ( = ?auto_22706 ?auto_22747 ) ) ( not ( = ?auto_22707 ?auto_22747 ) ) ( SURFACE-AT ?auto_22705 ?auto_22720 ) ( CLEAR ?auto_22705 ) ( IS-CRATE ?auto_22706 ) ( AVAILABLE ?auto_22721 ) ( AVAILABLE ?auto_22749 ) ( SURFACE-AT ?auto_22706 ?auto_22730 ) ( ON ?auto_22706 ?auto_22745 ) ( CLEAR ?auto_22706 ) ( TRUCK-AT ?auto_22725 ?auto_22720 ) ( not ( = ?auto_22705 ?auto_22706 ) ) ( not ( = ?auto_22705 ?auto_22745 ) ) ( not ( = ?auto_22706 ?auto_22745 ) ) ( not ( = ?auto_22705 ?auto_22707 ) ) ( not ( = ?auto_22705 ?auto_22747 ) ) ( not ( = ?auto_22707 ?auto_22745 ) ) ( not ( = ?auto_22731 ?auto_22730 ) ) ( not ( = ?auto_22751 ?auto_22749 ) ) ( not ( = ?auto_22747 ?auto_22745 ) ) ( not ( = ?auto_22705 ?auto_22708 ) ) ( not ( = ?auto_22705 ?auto_22732 ) ) ( not ( = ?auto_22706 ?auto_22708 ) ) ( not ( = ?auto_22706 ?auto_22732 ) ) ( not ( = ?auto_22708 ?auto_22747 ) ) ( not ( = ?auto_22708 ?auto_22745 ) ) ( not ( = ?auto_22728 ?auto_22731 ) ) ( not ( = ?auto_22728 ?auto_22730 ) ) ( not ( = ?auto_22744 ?auto_22751 ) ) ( not ( = ?auto_22744 ?auto_22749 ) ) ( not ( = ?auto_22732 ?auto_22747 ) ) ( not ( = ?auto_22732 ?auto_22745 ) ) ( not ( = ?auto_22705 ?auto_22709 ) ) ( not ( = ?auto_22705 ?auto_22741 ) ) ( not ( = ?auto_22706 ?auto_22709 ) ) ( not ( = ?auto_22706 ?auto_22741 ) ) ( not ( = ?auto_22707 ?auto_22709 ) ) ( not ( = ?auto_22707 ?auto_22741 ) ) ( not ( = ?auto_22709 ?auto_22732 ) ) ( not ( = ?auto_22709 ?auto_22747 ) ) ( not ( = ?auto_22709 ?auto_22745 ) ) ( not ( = ?auto_22735 ?auto_22728 ) ) ( not ( = ?auto_22735 ?auto_22731 ) ) ( not ( = ?auto_22735 ?auto_22730 ) ) ( not ( = ?auto_22737 ?auto_22744 ) ) ( not ( = ?auto_22737 ?auto_22751 ) ) ( not ( = ?auto_22737 ?auto_22749 ) ) ( not ( = ?auto_22741 ?auto_22732 ) ) ( not ( = ?auto_22741 ?auto_22747 ) ) ( not ( = ?auto_22741 ?auto_22745 ) ) ( not ( = ?auto_22705 ?auto_22712 ) ) ( not ( = ?auto_22705 ?auto_22740 ) ) ( not ( = ?auto_22706 ?auto_22712 ) ) ( not ( = ?auto_22706 ?auto_22740 ) ) ( not ( = ?auto_22707 ?auto_22712 ) ) ( not ( = ?auto_22707 ?auto_22740 ) ) ( not ( = ?auto_22708 ?auto_22712 ) ) ( not ( = ?auto_22708 ?auto_22740 ) ) ( not ( = ?auto_22712 ?auto_22741 ) ) ( not ( = ?auto_22712 ?auto_22732 ) ) ( not ( = ?auto_22712 ?auto_22747 ) ) ( not ( = ?auto_22712 ?auto_22745 ) ) ( not ( = ?auto_22740 ?auto_22741 ) ) ( not ( = ?auto_22740 ?auto_22732 ) ) ( not ( = ?auto_22740 ?auto_22747 ) ) ( not ( = ?auto_22740 ?auto_22745 ) ) ( not ( = ?auto_22705 ?auto_22710 ) ) ( not ( = ?auto_22705 ?auto_22729 ) ) ( not ( = ?auto_22706 ?auto_22710 ) ) ( not ( = ?auto_22706 ?auto_22729 ) ) ( not ( = ?auto_22707 ?auto_22710 ) ) ( not ( = ?auto_22707 ?auto_22729 ) ) ( not ( = ?auto_22708 ?auto_22710 ) ) ( not ( = ?auto_22708 ?auto_22729 ) ) ( not ( = ?auto_22709 ?auto_22710 ) ) ( not ( = ?auto_22709 ?auto_22729 ) ) ( not ( = ?auto_22710 ?auto_22740 ) ) ( not ( = ?auto_22710 ?auto_22741 ) ) ( not ( = ?auto_22710 ?auto_22732 ) ) ( not ( = ?auto_22710 ?auto_22747 ) ) ( not ( = ?auto_22710 ?auto_22745 ) ) ( not ( = ?auto_22752 ?auto_22731 ) ) ( not ( = ?auto_22752 ?auto_22735 ) ) ( not ( = ?auto_22752 ?auto_22728 ) ) ( not ( = ?auto_22752 ?auto_22730 ) ) ( not ( = ?auto_22743 ?auto_22751 ) ) ( not ( = ?auto_22743 ?auto_22737 ) ) ( not ( = ?auto_22743 ?auto_22744 ) ) ( not ( = ?auto_22743 ?auto_22749 ) ) ( not ( = ?auto_22729 ?auto_22740 ) ) ( not ( = ?auto_22729 ?auto_22741 ) ) ( not ( = ?auto_22729 ?auto_22732 ) ) ( not ( = ?auto_22729 ?auto_22747 ) ) ( not ( = ?auto_22729 ?auto_22745 ) ) ( not ( = ?auto_22705 ?auto_22714 ) ) ( not ( = ?auto_22705 ?auto_22739 ) ) ( not ( = ?auto_22706 ?auto_22714 ) ) ( not ( = ?auto_22706 ?auto_22739 ) ) ( not ( = ?auto_22707 ?auto_22714 ) ) ( not ( = ?auto_22707 ?auto_22739 ) ) ( not ( = ?auto_22708 ?auto_22714 ) ) ( not ( = ?auto_22708 ?auto_22739 ) ) ( not ( = ?auto_22709 ?auto_22714 ) ) ( not ( = ?auto_22709 ?auto_22739 ) ) ( not ( = ?auto_22712 ?auto_22714 ) ) ( not ( = ?auto_22712 ?auto_22739 ) ) ( not ( = ?auto_22714 ?auto_22729 ) ) ( not ( = ?auto_22714 ?auto_22740 ) ) ( not ( = ?auto_22714 ?auto_22741 ) ) ( not ( = ?auto_22714 ?auto_22732 ) ) ( not ( = ?auto_22714 ?auto_22747 ) ) ( not ( = ?auto_22714 ?auto_22745 ) ) ( not ( = ?auto_22736 ?auto_22752 ) ) ( not ( = ?auto_22736 ?auto_22731 ) ) ( not ( = ?auto_22736 ?auto_22735 ) ) ( not ( = ?auto_22736 ?auto_22728 ) ) ( not ( = ?auto_22736 ?auto_22730 ) ) ( not ( = ?auto_22742 ?auto_22743 ) ) ( not ( = ?auto_22742 ?auto_22751 ) ) ( not ( = ?auto_22742 ?auto_22737 ) ) ( not ( = ?auto_22742 ?auto_22744 ) ) ( not ( = ?auto_22742 ?auto_22749 ) ) ( not ( = ?auto_22739 ?auto_22729 ) ) ( not ( = ?auto_22739 ?auto_22740 ) ) ( not ( = ?auto_22739 ?auto_22741 ) ) ( not ( = ?auto_22739 ?auto_22732 ) ) ( not ( = ?auto_22739 ?auto_22747 ) ) ( not ( = ?auto_22739 ?auto_22745 ) ) ( not ( = ?auto_22705 ?auto_22713 ) ) ( not ( = ?auto_22705 ?auto_22753 ) ) ( not ( = ?auto_22706 ?auto_22713 ) ) ( not ( = ?auto_22706 ?auto_22753 ) ) ( not ( = ?auto_22707 ?auto_22713 ) ) ( not ( = ?auto_22707 ?auto_22753 ) ) ( not ( = ?auto_22708 ?auto_22713 ) ) ( not ( = ?auto_22708 ?auto_22753 ) ) ( not ( = ?auto_22709 ?auto_22713 ) ) ( not ( = ?auto_22709 ?auto_22753 ) ) ( not ( = ?auto_22712 ?auto_22713 ) ) ( not ( = ?auto_22712 ?auto_22753 ) ) ( not ( = ?auto_22710 ?auto_22713 ) ) ( not ( = ?auto_22710 ?auto_22753 ) ) ( not ( = ?auto_22713 ?auto_22739 ) ) ( not ( = ?auto_22713 ?auto_22729 ) ) ( not ( = ?auto_22713 ?auto_22740 ) ) ( not ( = ?auto_22713 ?auto_22741 ) ) ( not ( = ?auto_22713 ?auto_22732 ) ) ( not ( = ?auto_22713 ?auto_22747 ) ) ( not ( = ?auto_22713 ?auto_22745 ) ) ( not ( = ?auto_22733 ?auto_22736 ) ) ( not ( = ?auto_22733 ?auto_22752 ) ) ( not ( = ?auto_22733 ?auto_22731 ) ) ( not ( = ?auto_22733 ?auto_22735 ) ) ( not ( = ?auto_22733 ?auto_22728 ) ) ( not ( = ?auto_22733 ?auto_22730 ) ) ( not ( = ?auto_22738 ?auto_22742 ) ) ( not ( = ?auto_22738 ?auto_22743 ) ) ( not ( = ?auto_22738 ?auto_22751 ) ) ( not ( = ?auto_22738 ?auto_22737 ) ) ( not ( = ?auto_22738 ?auto_22744 ) ) ( not ( = ?auto_22738 ?auto_22749 ) ) ( not ( = ?auto_22753 ?auto_22739 ) ) ( not ( = ?auto_22753 ?auto_22729 ) ) ( not ( = ?auto_22753 ?auto_22740 ) ) ( not ( = ?auto_22753 ?auto_22741 ) ) ( not ( = ?auto_22753 ?auto_22732 ) ) ( not ( = ?auto_22753 ?auto_22747 ) ) ( not ( = ?auto_22753 ?auto_22745 ) ) ( not ( = ?auto_22705 ?auto_22711 ) ) ( not ( = ?auto_22705 ?auto_22726 ) ) ( not ( = ?auto_22706 ?auto_22711 ) ) ( not ( = ?auto_22706 ?auto_22726 ) ) ( not ( = ?auto_22707 ?auto_22711 ) ) ( not ( = ?auto_22707 ?auto_22726 ) ) ( not ( = ?auto_22708 ?auto_22711 ) ) ( not ( = ?auto_22708 ?auto_22726 ) ) ( not ( = ?auto_22709 ?auto_22711 ) ) ( not ( = ?auto_22709 ?auto_22726 ) ) ( not ( = ?auto_22712 ?auto_22711 ) ) ( not ( = ?auto_22712 ?auto_22726 ) ) ( not ( = ?auto_22710 ?auto_22711 ) ) ( not ( = ?auto_22710 ?auto_22726 ) ) ( not ( = ?auto_22714 ?auto_22711 ) ) ( not ( = ?auto_22714 ?auto_22726 ) ) ( not ( = ?auto_22711 ?auto_22753 ) ) ( not ( = ?auto_22711 ?auto_22739 ) ) ( not ( = ?auto_22711 ?auto_22729 ) ) ( not ( = ?auto_22711 ?auto_22740 ) ) ( not ( = ?auto_22711 ?auto_22741 ) ) ( not ( = ?auto_22711 ?auto_22732 ) ) ( not ( = ?auto_22711 ?auto_22747 ) ) ( not ( = ?auto_22711 ?auto_22745 ) ) ( not ( = ?auto_22726 ?auto_22753 ) ) ( not ( = ?auto_22726 ?auto_22739 ) ) ( not ( = ?auto_22726 ?auto_22729 ) ) ( not ( = ?auto_22726 ?auto_22740 ) ) ( not ( = ?auto_22726 ?auto_22741 ) ) ( not ( = ?auto_22726 ?auto_22732 ) ) ( not ( = ?auto_22726 ?auto_22747 ) ) ( not ( = ?auto_22726 ?auto_22745 ) ) ( not ( = ?auto_22705 ?auto_22716 ) ) ( not ( = ?auto_22705 ?auto_22754 ) ) ( not ( = ?auto_22706 ?auto_22716 ) ) ( not ( = ?auto_22706 ?auto_22754 ) ) ( not ( = ?auto_22707 ?auto_22716 ) ) ( not ( = ?auto_22707 ?auto_22754 ) ) ( not ( = ?auto_22708 ?auto_22716 ) ) ( not ( = ?auto_22708 ?auto_22754 ) ) ( not ( = ?auto_22709 ?auto_22716 ) ) ( not ( = ?auto_22709 ?auto_22754 ) ) ( not ( = ?auto_22712 ?auto_22716 ) ) ( not ( = ?auto_22712 ?auto_22754 ) ) ( not ( = ?auto_22710 ?auto_22716 ) ) ( not ( = ?auto_22710 ?auto_22754 ) ) ( not ( = ?auto_22714 ?auto_22716 ) ) ( not ( = ?auto_22714 ?auto_22754 ) ) ( not ( = ?auto_22713 ?auto_22716 ) ) ( not ( = ?auto_22713 ?auto_22754 ) ) ( not ( = ?auto_22716 ?auto_22726 ) ) ( not ( = ?auto_22716 ?auto_22753 ) ) ( not ( = ?auto_22716 ?auto_22739 ) ) ( not ( = ?auto_22716 ?auto_22729 ) ) ( not ( = ?auto_22716 ?auto_22740 ) ) ( not ( = ?auto_22716 ?auto_22741 ) ) ( not ( = ?auto_22716 ?auto_22732 ) ) ( not ( = ?auto_22716 ?auto_22747 ) ) ( not ( = ?auto_22716 ?auto_22745 ) ) ( not ( = ?auto_22754 ?auto_22726 ) ) ( not ( = ?auto_22754 ?auto_22753 ) ) ( not ( = ?auto_22754 ?auto_22739 ) ) ( not ( = ?auto_22754 ?auto_22729 ) ) ( not ( = ?auto_22754 ?auto_22740 ) ) ( not ( = ?auto_22754 ?auto_22741 ) ) ( not ( = ?auto_22754 ?auto_22732 ) ) ( not ( = ?auto_22754 ?auto_22747 ) ) ( not ( = ?auto_22754 ?auto_22745 ) ) ( not ( = ?auto_22705 ?auto_22715 ) ) ( not ( = ?auto_22705 ?auto_22748 ) ) ( not ( = ?auto_22706 ?auto_22715 ) ) ( not ( = ?auto_22706 ?auto_22748 ) ) ( not ( = ?auto_22707 ?auto_22715 ) ) ( not ( = ?auto_22707 ?auto_22748 ) ) ( not ( = ?auto_22708 ?auto_22715 ) ) ( not ( = ?auto_22708 ?auto_22748 ) ) ( not ( = ?auto_22709 ?auto_22715 ) ) ( not ( = ?auto_22709 ?auto_22748 ) ) ( not ( = ?auto_22712 ?auto_22715 ) ) ( not ( = ?auto_22712 ?auto_22748 ) ) ( not ( = ?auto_22710 ?auto_22715 ) ) ( not ( = ?auto_22710 ?auto_22748 ) ) ( not ( = ?auto_22714 ?auto_22715 ) ) ( not ( = ?auto_22714 ?auto_22748 ) ) ( not ( = ?auto_22713 ?auto_22715 ) ) ( not ( = ?auto_22713 ?auto_22748 ) ) ( not ( = ?auto_22711 ?auto_22715 ) ) ( not ( = ?auto_22711 ?auto_22748 ) ) ( not ( = ?auto_22715 ?auto_22754 ) ) ( not ( = ?auto_22715 ?auto_22726 ) ) ( not ( = ?auto_22715 ?auto_22753 ) ) ( not ( = ?auto_22715 ?auto_22739 ) ) ( not ( = ?auto_22715 ?auto_22729 ) ) ( not ( = ?auto_22715 ?auto_22740 ) ) ( not ( = ?auto_22715 ?auto_22741 ) ) ( not ( = ?auto_22715 ?auto_22732 ) ) ( not ( = ?auto_22715 ?auto_22747 ) ) ( not ( = ?auto_22715 ?auto_22745 ) ) ( not ( = ?auto_22748 ?auto_22754 ) ) ( not ( = ?auto_22748 ?auto_22726 ) ) ( not ( = ?auto_22748 ?auto_22753 ) ) ( not ( = ?auto_22748 ?auto_22739 ) ) ( not ( = ?auto_22748 ?auto_22729 ) ) ( not ( = ?auto_22748 ?auto_22740 ) ) ( not ( = ?auto_22748 ?auto_22741 ) ) ( not ( = ?auto_22748 ?auto_22732 ) ) ( not ( = ?auto_22748 ?auto_22747 ) ) ( not ( = ?auto_22748 ?auto_22745 ) ) ( not ( = ?auto_22705 ?auto_22717 ) ) ( not ( = ?auto_22705 ?auto_22734 ) ) ( not ( = ?auto_22706 ?auto_22717 ) ) ( not ( = ?auto_22706 ?auto_22734 ) ) ( not ( = ?auto_22707 ?auto_22717 ) ) ( not ( = ?auto_22707 ?auto_22734 ) ) ( not ( = ?auto_22708 ?auto_22717 ) ) ( not ( = ?auto_22708 ?auto_22734 ) ) ( not ( = ?auto_22709 ?auto_22717 ) ) ( not ( = ?auto_22709 ?auto_22734 ) ) ( not ( = ?auto_22712 ?auto_22717 ) ) ( not ( = ?auto_22712 ?auto_22734 ) ) ( not ( = ?auto_22710 ?auto_22717 ) ) ( not ( = ?auto_22710 ?auto_22734 ) ) ( not ( = ?auto_22714 ?auto_22717 ) ) ( not ( = ?auto_22714 ?auto_22734 ) ) ( not ( = ?auto_22713 ?auto_22717 ) ) ( not ( = ?auto_22713 ?auto_22734 ) ) ( not ( = ?auto_22711 ?auto_22717 ) ) ( not ( = ?auto_22711 ?auto_22734 ) ) ( not ( = ?auto_22716 ?auto_22717 ) ) ( not ( = ?auto_22716 ?auto_22734 ) ) ( not ( = ?auto_22717 ?auto_22748 ) ) ( not ( = ?auto_22717 ?auto_22754 ) ) ( not ( = ?auto_22717 ?auto_22726 ) ) ( not ( = ?auto_22717 ?auto_22753 ) ) ( not ( = ?auto_22717 ?auto_22739 ) ) ( not ( = ?auto_22717 ?auto_22729 ) ) ( not ( = ?auto_22717 ?auto_22740 ) ) ( not ( = ?auto_22717 ?auto_22741 ) ) ( not ( = ?auto_22717 ?auto_22732 ) ) ( not ( = ?auto_22717 ?auto_22747 ) ) ( not ( = ?auto_22717 ?auto_22745 ) ) ( not ( = ?auto_22734 ?auto_22748 ) ) ( not ( = ?auto_22734 ?auto_22754 ) ) ( not ( = ?auto_22734 ?auto_22726 ) ) ( not ( = ?auto_22734 ?auto_22753 ) ) ( not ( = ?auto_22734 ?auto_22739 ) ) ( not ( = ?auto_22734 ?auto_22729 ) ) ( not ( = ?auto_22734 ?auto_22740 ) ) ( not ( = ?auto_22734 ?auto_22741 ) ) ( not ( = ?auto_22734 ?auto_22732 ) ) ( not ( = ?auto_22734 ?auto_22747 ) ) ( not ( = ?auto_22734 ?auto_22745 ) ) ( not ( = ?auto_22705 ?auto_22718 ) ) ( not ( = ?auto_22705 ?auto_22750 ) ) ( not ( = ?auto_22706 ?auto_22718 ) ) ( not ( = ?auto_22706 ?auto_22750 ) ) ( not ( = ?auto_22707 ?auto_22718 ) ) ( not ( = ?auto_22707 ?auto_22750 ) ) ( not ( = ?auto_22708 ?auto_22718 ) ) ( not ( = ?auto_22708 ?auto_22750 ) ) ( not ( = ?auto_22709 ?auto_22718 ) ) ( not ( = ?auto_22709 ?auto_22750 ) ) ( not ( = ?auto_22712 ?auto_22718 ) ) ( not ( = ?auto_22712 ?auto_22750 ) ) ( not ( = ?auto_22710 ?auto_22718 ) ) ( not ( = ?auto_22710 ?auto_22750 ) ) ( not ( = ?auto_22714 ?auto_22718 ) ) ( not ( = ?auto_22714 ?auto_22750 ) ) ( not ( = ?auto_22713 ?auto_22718 ) ) ( not ( = ?auto_22713 ?auto_22750 ) ) ( not ( = ?auto_22711 ?auto_22718 ) ) ( not ( = ?auto_22711 ?auto_22750 ) ) ( not ( = ?auto_22716 ?auto_22718 ) ) ( not ( = ?auto_22716 ?auto_22750 ) ) ( not ( = ?auto_22715 ?auto_22718 ) ) ( not ( = ?auto_22715 ?auto_22750 ) ) ( not ( = ?auto_22718 ?auto_22734 ) ) ( not ( = ?auto_22718 ?auto_22748 ) ) ( not ( = ?auto_22718 ?auto_22754 ) ) ( not ( = ?auto_22718 ?auto_22726 ) ) ( not ( = ?auto_22718 ?auto_22753 ) ) ( not ( = ?auto_22718 ?auto_22739 ) ) ( not ( = ?auto_22718 ?auto_22729 ) ) ( not ( = ?auto_22718 ?auto_22740 ) ) ( not ( = ?auto_22718 ?auto_22741 ) ) ( not ( = ?auto_22718 ?auto_22732 ) ) ( not ( = ?auto_22718 ?auto_22747 ) ) ( not ( = ?auto_22718 ?auto_22745 ) ) ( not ( = ?auto_22746 ?auto_22735 ) ) ( not ( = ?auto_22746 ?auto_22728 ) ) ( not ( = ?auto_22746 ?auto_22752 ) ) ( not ( = ?auto_22746 ?auto_22730 ) ) ( not ( = ?auto_22746 ?auto_22733 ) ) ( not ( = ?auto_22746 ?auto_22736 ) ) ( not ( = ?auto_22746 ?auto_22731 ) ) ( not ( = ?auto_22727 ?auto_22737 ) ) ( not ( = ?auto_22727 ?auto_22744 ) ) ( not ( = ?auto_22727 ?auto_22743 ) ) ( not ( = ?auto_22727 ?auto_22749 ) ) ( not ( = ?auto_22727 ?auto_22738 ) ) ( not ( = ?auto_22727 ?auto_22742 ) ) ( not ( = ?auto_22727 ?auto_22751 ) ) ( not ( = ?auto_22750 ?auto_22734 ) ) ( not ( = ?auto_22750 ?auto_22748 ) ) ( not ( = ?auto_22750 ?auto_22754 ) ) ( not ( = ?auto_22750 ?auto_22726 ) ) ( not ( = ?auto_22750 ?auto_22753 ) ) ( not ( = ?auto_22750 ?auto_22739 ) ) ( not ( = ?auto_22750 ?auto_22729 ) ) ( not ( = ?auto_22750 ?auto_22740 ) ) ( not ( = ?auto_22750 ?auto_22741 ) ) ( not ( = ?auto_22750 ?auto_22732 ) ) ( not ( = ?auto_22750 ?auto_22747 ) ) ( not ( = ?auto_22750 ?auto_22745 ) ) ( not ( = ?auto_22705 ?auto_22719 ) ) ( not ( = ?auto_22705 ?auto_22723 ) ) ( not ( = ?auto_22706 ?auto_22719 ) ) ( not ( = ?auto_22706 ?auto_22723 ) ) ( not ( = ?auto_22707 ?auto_22719 ) ) ( not ( = ?auto_22707 ?auto_22723 ) ) ( not ( = ?auto_22708 ?auto_22719 ) ) ( not ( = ?auto_22708 ?auto_22723 ) ) ( not ( = ?auto_22709 ?auto_22719 ) ) ( not ( = ?auto_22709 ?auto_22723 ) ) ( not ( = ?auto_22712 ?auto_22719 ) ) ( not ( = ?auto_22712 ?auto_22723 ) ) ( not ( = ?auto_22710 ?auto_22719 ) ) ( not ( = ?auto_22710 ?auto_22723 ) ) ( not ( = ?auto_22714 ?auto_22719 ) ) ( not ( = ?auto_22714 ?auto_22723 ) ) ( not ( = ?auto_22713 ?auto_22719 ) ) ( not ( = ?auto_22713 ?auto_22723 ) ) ( not ( = ?auto_22711 ?auto_22719 ) ) ( not ( = ?auto_22711 ?auto_22723 ) ) ( not ( = ?auto_22716 ?auto_22719 ) ) ( not ( = ?auto_22716 ?auto_22723 ) ) ( not ( = ?auto_22715 ?auto_22719 ) ) ( not ( = ?auto_22715 ?auto_22723 ) ) ( not ( = ?auto_22717 ?auto_22719 ) ) ( not ( = ?auto_22717 ?auto_22723 ) ) ( not ( = ?auto_22719 ?auto_22750 ) ) ( not ( = ?auto_22719 ?auto_22734 ) ) ( not ( = ?auto_22719 ?auto_22748 ) ) ( not ( = ?auto_22719 ?auto_22754 ) ) ( not ( = ?auto_22719 ?auto_22726 ) ) ( not ( = ?auto_22719 ?auto_22753 ) ) ( not ( = ?auto_22719 ?auto_22739 ) ) ( not ( = ?auto_22719 ?auto_22729 ) ) ( not ( = ?auto_22719 ?auto_22740 ) ) ( not ( = ?auto_22719 ?auto_22741 ) ) ( not ( = ?auto_22719 ?auto_22732 ) ) ( not ( = ?auto_22719 ?auto_22747 ) ) ( not ( = ?auto_22719 ?auto_22745 ) ) ( not ( = ?auto_22724 ?auto_22746 ) ) ( not ( = ?auto_22724 ?auto_22735 ) ) ( not ( = ?auto_22724 ?auto_22728 ) ) ( not ( = ?auto_22724 ?auto_22752 ) ) ( not ( = ?auto_22724 ?auto_22730 ) ) ( not ( = ?auto_22724 ?auto_22733 ) ) ( not ( = ?auto_22724 ?auto_22736 ) ) ( not ( = ?auto_22724 ?auto_22731 ) ) ( not ( = ?auto_22722 ?auto_22727 ) ) ( not ( = ?auto_22722 ?auto_22737 ) ) ( not ( = ?auto_22722 ?auto_22744 ) ) ( not ( = ?auto_22722 ?auto_22743 ) ) ( not ( = ?auto_22722 ?auto_22749 ) ) ( not ( = ?auto_22722 ?auto_22738 ) ) ( not ( = ?auto_22722 ?auto_22742 ) ) ( not ( = ?auto_22722 ?auto_22751 ) ) ( not ( = ?auto_22723 ?auto_22750 ) ) ( not ( = ?auto_22723 ?auto_22734 ) ) ( not ( = ?auto_22723 ?auto_22748 ) ) ( not ( = ?auto_22723 ?auto_22754 ) ) ( not ( = ?auto_22723 ?auto_22726 ) ) ( not ( = ?auto_22723 ?auto_22753 ) ) ( not ( = ?auto_22723 ?auto_22739 ) ) ( not ( = ?auto_22723 ?auto_22729 ) ) ( not ( = ?auto_22723 ?auto_22740 ) ) ( not ( = ?auto_22723 ?auto_22741 ) ) ( not ( = ?auto_22723 ?auto_22732 ) ) ( not ( = ?auto_22723 ?auto_22747 ) ) ( not ( = ?auto_22723 ?auto_22745 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_22705 ?auto_22706 ?auto_22707 ?auto_22708 ?auto_22709 ?auto_22712 ?auto_22710 ?auto_22714 ?auto_22713 ?auto_22711 ?auto_22716 ?auto_22715 ?auto_22717 ?auto_22718 )
      ( MAKE-1CRATE ?auto_22718 ?auto_22719 )
      ( MAKE-14CRATE-VERIFY ?auto_22705 ?auto_22706 ?auto_22707 ?auto_22708 ?auto_22709 ?auto_22712 ?auto_22710 ?auto_22714 ?auto_22713 ?auto_22711 ?auto_22716 ?auto_22715 ?auto_22717 ?auto_22718 ?auto_22719 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22757 - SURFACE
      ?auto_22758 - SURFACE
    )
    :vars
    (
      ?auto_22759 - HOIST
      ?auto_22760 - PLACE
      ?auto_22762 - PLACE
      ?auto_22763 - HOIST
      ?auto_22764 - SURFACE
      ?auto_22761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22759 ?auto_22760 ) ( SURFACE-AT ?auto_22757 ?auto_22760 ) ( CLEAR ?auto_22757 ) ( IS-CRATE ?auto_22758 ) ( AVAILABLE ?auto_22759 ) ( not ( = ?auto_22762 ?auto_22760 ) ) ( HOIST-AT ?auto_22763 ?auto_22762 ) ( AVAILABLE ?auto_22763 ) ( SURFACE-AT ?auto_22758 ?auto_22762 ) ( ON ?auto_22758 ?auto_22764 ) ( CLEAR ?auto_22758 ) ( TRUCK-AT ?auto_22761 ?auto_22760 ) ( not ( = ?auto_22757 ?auto_22758 ) ) ( not ( = ?auto_22757 ?auto_22764 ) ) ( not ( = ?auto_22758 ?auto_22764 ) ) ( not ( = ?auto_22759 ?auto_22763 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22761 ?auto_22760 ?auto_22762 )
      ( !LIFT ?auto_22763 ?auto_22758 ?auto_22764 ?auto_22762 )
      ( !LOAD ?auto_22763 ?auto_22758 ?auto_22761 ?auto_22762 )
      ( !DRIVE ?auto_22761 ?auto_22762 ?auto_22760 )
      ( !UNLOAD ?auto_22759 ?auto_22758 ?auto_22761 ?auto_22760 )
      ( !DROP ?auto_22759 ?auto_22758 ?auto_22757 ?auto_22760 )
      ( MAKE-1CRATE-VERIFY ?auto_22757 ?auto_22758 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_22781 - SURFACE
      ?auto_22782 - SURFACE
      ?auto_22783 - SURFACE
      ?auto_22784 - SURFACE
      ?auto_22785 - SURFACE
      ?auto_22788 - SURFACE
      ?auto_22786 - SURFACE
      ?auto_22790 - SURFACE
      ?auto_22789 - SURFACE
      ?auto_22787 - SURFACE
      ?auto_22792 - SURFACE
      ?auto_22791 - SURFACE
      ?auto_22793 - SURFACE
      ?auto_22795 - SURFACE
      ?auto_22796 - SURFACE
      ?auto_22794 - SURFACE
    )
    :vars
    (
      ?auto_22799 - HOIST
      ?auto_22798 - PLACE
      ?auto_22800 - PLACE
      ?auto_22801 - HOIST
      ?auto_22802 - SURFACE
      ?auto_22824 - PLACE
      ?auto_22819 - HOIST
      ?auto_22805 - SURFACE
      ?auto_22822 - SURFACE
      ?auto_22829 - PLACE
      ?auto_22811 - HOIST
      ?auto_22828 - SURFACE
      ?auto_22826 - PLACE
      ?auto_22821 - HOIST
      ?auto_22808 - SURFACE
      ?auto_22812 - PLACE
      ?auto_22806 - HOIST
      ?auto_22810 - SURFACE
      ?auto_22817 - PLACE
      ?auto_22809 - HOIST
      ?auto_22804 - SURFACE
      ?auto_22830 - PLACE
      ?auto_22820 - HOIST
      ?auto_22803 - SURFACE
      ?auto_22807 - PLACE
      ?auto_22818 - HOIST
      ?auto_22825 - SURFACE
      ?auto_22814 - SURFACE
      ?auto_22832 - PLACE
      ?auto_22823 - HOIST
      ?auto_22815 - SURFACE
      ?auto_22813 - SURFACE
      ?auto_22827 - SURFACE
      ?auto_22816 - SURFACE
      ?auto_22831 - SURFACE
      ?auto_22797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22799 ?auto_22798 ) ( IS-CRATE ?auto_22794 ) ( not ( = ?auto_22800 ?auto_22798 ) ) ( HOIST-AT ?auto_22801 ?auto_22800 ) ( SURFACE-AT ?auto_22794 ?auto_22800 ) ( ON ?auto_22794 ?auto_22802 ) ( CLEAR ?auto_22794 ) ( not ( = ?auto_22796 ?auto_22794 ) ) ( not ( = ?auto_22796 ?auto_22802 ) ) ( not ( = ?auto_22794 ?auto_22802 ) ) ( not ( = ?auto_22799 ?auto_22801 ) ) ( IS-CRATE ?auto_22796 ) ( not ( = ?auto_22824 ?auto_22798 ) ) ( HOIST-AT ?auto_22819 ?auto_22824 ) ( AVAILABLE ?auto_22819 ) ( SURFACE-AT ?auto_22796 ?auto_22824 ) ( ON ?auto_22796 ?auto_22805 ) ( CLEAR ?auto_22796 ) ( not ( = ?auto_22795 ?auto_22796 ) ) ( not ( = ?auto_22795 ?auto_22805 ) ) ( not ( = ?auto_22796 ?auto_22805 ) ) ( not ( = ?auto_22799 ?auto_22819 ) ) ( IS-CRATE ?auto_22795 ) ( AVAILABLE ?auto_22801 ) ( SURFACE-AT ?auto_22795 ?auto_22800 ) ( ON ?auto_22795 ?auto_22822 ) ( CLEAR ?auto_22795 ) ( not ( = ?auto_22793 ?auto_22795 ) ) ( not ( = ?auto_22793 ?auto_22822 ) ) ( not ( = ?auto_22795 ?auto_22822 ) ) ( IS-CRATE ?auto_22793 ) ( not ( = ?auto_22829 ?auto_22798 ) ) ( HOIST-AT ?auto_22811 ?auto_22829 ) ( SURFACE-AT ?auto_22793 ?auto_22829 ) ( ON ?auto_22793 ?auto_22828 ) ( CLEAR ?auto_22793 ) ( not ( = ?auto_22791 ?auto_22793 ) ) ( not ( = ?auto_22791 ?auto_22828 ) ) ( not ( = ?auto_22793 ?auto_22828 ) ) ( not ( = ?auto_22799 ?auto_22811 ) ) ( IS-CRATE ?auto_22791 ) ( not ( = ?auto_22826 ?auto_22798 ) ) ( HOIST-AT ?auto_22821 ?auto_22826 ) ( SURFACE-AT ?auto_22791 ?auto_22826 ) ( ON ?auto_22791 ?auto_22808 ) ( CLEAR ?auto_22791 ) ( not ( = ?auto_22792 ?auto_22791 ) ) ( not ( = ?auto_22792 ?auto_22808 ) ) ( not ( = ?auto_22791 ?auto_22808 ) ) ( not ( = ?auto_22799 ?auto_22821 ) ) ( IS-CRATE ?auto_22792 ) ( not ( = ?auto_22812 ?auto_22798 ) ) ( HOIST-AT ?auto_22806 ?auto_22812 ) ( SURFACE-AT ?auto_22792 ?auto_22812 ) ( ON ?auto_22792 ?auto_22810 ) ( CLEAR ?auto_22792 ) ( not ( = ?auto_22787 ?auto_22792 ) ) ( not ( = ?auto_22787 ?auto_22810 ) ) ( not ( = ?auto_22792 ?auto_22810 ) ) ( not ( = ?auto_22799 ?auto_22806 ) ) ( IS-CRATE ?auto_22787 ) ( not ( = ?auto_22817 ?auto_22798 ) ) ( HOIST-AT ?auto_22809 ?auto_22817 ) ( SURFACE-AT ?auto_22787 ?auto_22817 ) ( ON ?auto_22787 ?auto_22804 ) ( CLEAR ?auto_22787 ) ( not ( = ?auto_22789 ?auto_22787 ) ) ( not ( = ?auto_22789 ?auto_22804 ) ) ( not ( = ?auto_22787 ?auto_22804 ) ) ( not ( = ?auto_22799 ?auto_22809 ) ) ( IS-CRATE ?auto_22789 ) ( not ( = ?auto_22830 ?auto_22798 ) ) ( HOIST-AT ?auto_22820 ?auto_22830 ) ( AVAILABLE ?auto_22820 ) ( SURFACE-AT ?auto_22789 ?auto_22830 ) ( ON ?auto_22789 ?auto_22803 ) ( CLEAR ?auto_22789 ) ( not ( = ?auto_22790 ?auto_22789 ) ) ( not ( = ?auto_22790 ?auto_22803 ) ) ( not ( = ?auto_22789 ?auto_22803 ) ) ( not ( = ?auto_22799 ?auto_22820 ) ) ( IS-CRATE ?auto_22790 ) ( not ( = ?auto_22807 ?auto_22798 ) ) ( HOIST-AT ?auto_22818 ?auto_22807 ) ( AVAILABLE ?auto_22818 ) ( SURFACE-AT ?auto_22790 ?auto_22807 ) ( ON ?auto_22790 ?auto_22825 ) ( CLEAR ?auto_22790 ) ( not ( = ?auto_22786 ?auto_22790 ) ) ( not ( = ?auto_22786 ?auto_22825 ) ) ( not ( = ?auto_22790 ?auto_22825 ) ) ( not ( = ?auto_22799 ?auto_22818 ) ) ( IS-CRATE ?auto_22786 ) ( AVAILABLE ?auto_22806 ) ( SURFACE-AT ?auto_22786 ?auto_22812 ) ( ON ?auto_22786 ?auto_22814 ) ( CLEAR ?auto_22786 ) ( not ( = ?auto_22788 ?auto_22786 ) ) ( not ( = ?auto_22788 ?auto_22814 ) ) ( not ( = ?auto_22786 ?auto_22814 ) ) ( IS-CRATE ?auto_22788 ) ( not ( = ?auto_22832 ?auto_22798 ) ) ( HOIST-AT ?auto_22823 ?auto_22832 ) ( SURFACE-AT ?auto_22788 ?auto_22832 ) ( ON ?auto_22788 ?auto_22815 ) ( CLEAR ?auto_22788 ) ( not ( = ?auto_22785 ?auto_22788 ) ) ( not ( = ?auto_22785 ?auto_22815 ) ) ( not ( = ?auto_22788 ?auto_22815 ) ) ( not ( = ?auto_22799 ?auto_22823 ) ) ( IS-CRATE ?auto_22785 ) ( AVAILABLE ?auto_22811 ) ( SURFACE-AT ?auto_22785 ?auto_22829 ) ( ON ?auto_22785 ?auto_22813 ) ( CLEAR ?auto_22785 ) ( not ( = ?auto_22784 ?auto_22785 ) ) ( not ( = ?auto_22784 ?auto_22813 ) ) ( not ( = ?auto_22785 ?auto_22813 ) ) ( IS-CRATE ?auto_22784 ) ( AVAILABLE ?auto_22821 ) ( SURFACE-AT ?auto_22784 ?auto_22826 ) ( ON ?auto_22784 ?auto_22827 ) ( CLEAR ?auto_22784 ) ( not ( = ?auto_22783 ?auto_22784 ) ) ( not ( = ?auto_22783 ?auto_22827 ) ) ( not ( = ?auto_22784 ?auto_22827 ) ) ( IS-CRATE ?auto_22783 ) ( AVAILABLE ?auto_22823 ) ( SURFACE-AT ?auto_22783 ?auto_22832 ) ( ON ?auto_22783 ?auto_22816 ) ( CLEAR ?auto_22783 ) ( not ( = ?auto_22782 ?auto_22783 ) ) ( not ( = ?auto_22782 ?auto_22816 ) ) ( not ( = ?auto_22783 ?auto_22816 ) ) ( SURFACE-AT ?auto_22781 ?auto_22798 ) ( CLEAR ?auto_22781 ) ( IS-CRATE ?auto_22782 ) ( AVAILABLE ?auto_22799 ) ( AVAILABLE ?auto_22809 ) ( SURFACE-AT ?auto_22782 ?auto_22817 ) ( ON ?auto_22782 ?auto_22831 ) ( CLEAR ?auto_22782 ) ( TRUCK-AT ?auto_22797 ?auto_22798 ) ( not ( = ?auto_22781 ?auto_22782 ) ) ( not ( = ?auto_22781 ?auto_22831 ) ) ( not ( = ?auto_22782 ?auto_22831 ) ) ( not ( = ?auto_22781 ?auto_22783 ) ) ( not ( = ?auto_22781 ?auto_22816 ) ) ( not ( = ?auto_22783 ?auto_22831 ) ) ( not ( = ?auto_22832 ?auto_22817 ) ) ( not ( = ?auto_22823 ?auto_22809 ) ) ( not ( = ?auto_22816 ?auto_22831 ) ) ( not ( = ?auto_22781 ?auto_22784 ) ) ( not ( = ?auto_22781 ?auto_22827 ) ) ( not ( = ?auto_22782 ?auto_22784 ) ) ( not ( = ?auto_22782 ?auto_22827 ) ) ( not ( = ?auto_22784 ?auto_22816 ) ) ( not ( = ?auto_22784 ?auto_22831 ) ) ( not ( = ?auto_22826 ?auto_22832 ) ) ( not ( = ?auto_22826 ?auto_22817 ) ) ( not ( = ?auto_22821 ?auto_22823 ) ) ( not ( = ?auto_22821 ?auto_22809 ) ) ( not ( = ?auto_22827 ?auto_22816 ) ) ( not ( = ?auto_22827 ?auto_22831 ) ) ( not ( = ?auto_22781 ?auto_22785 ) ) ( not ( = ?auto_22781 ?auto_22813 ) ) ( not ( = ?auto_22782 ?auto_22785 ) ) ( not ( = ?auto_22782 ?auto_22813 ) ) ( not ( = ?auto_22783 ?auto_22785 ) ) ( not ( = ?auto_22783 ?auto_22813 ) ) ( not ( = ?auto_22785 ?auto_22827 ) ) ( not ( = ?auto_22785 ?auto_22816 ) ) ( not ( = ?auto_22785 ?auto_22831 ) ) ( not ( = ?auto_22829 ?auto_22826 ) ) ( not ( = ?auto_22829 ?auto_22832 ) ) ( not ( = ?auto_22829 ?auto_22817 ) ) ( not ( = ?auto_22811 ?auto_22821 ) ) ( not ( = ?auto_22811 ?auto_22823 ) ) ( not ( = ?auto_22811 ?auto_22809 ) ) ( not ( = ?auto_22813 ?auto_22827 ) ) ( not ( = ?auto_22813 ?auto_22816 ) ) ( not ( = ?auto_22813 ?auto_22831 ) ) ( not ( = ?auto_22781 ?auto_22788 ) ) ( not ( = ?auto_22781 ?auto_22815 ) ) ( not ( = ?auto_22782 ?auto_22788 ) ) ( not ( = ?auto_22782 ?auto_22815 ) ) ( not ( = ?auto_22783 ?auto_22788 ) ) ( not ( = ?auto_22783 ?auto_22815 ) ) ( not ( = ?auto_22784 ?auto_22788 ) ) ( not ( = ?auto_22784 ?auto_22815 ) ) ( not ( = ?auto_22788 ?auto_22813 ) ) ( not ( = ?auto_22788 ?auto_22827 ) ) ( not ( = ?auto_22788 ?auto_22816 ) ) ( not ( = ?auto_22788 ?auto_22831 ) ) ( not ( = ?auto_22815 ?auto_22813 ) ) ( not ( = ?auto_22815 ?auto_22827 ) ) ( not ( = ?auto_22815 ?auto_22816 ) ) ( not ( = ?auto_22815 ?auto_22831 ) ) ( not ( = ?auto_22781 ?auto_22786 ) ) ( not ( = ?auto_22781 ?auto_22814 ) ) ( not ( = ?auto_22782 ?auto_22786 ) ) ( not ( = ?auto_22782 ?auto_22814 ) ) ( not ( = ?auto_22783 ?auto_22786 ) ) ( not ( = ?auto_22783 ?auto_22814 ) ) ( not ( = ?auto_22784 ?auto_22786 ) ) ( not ( = ?auto_22784 ?auto_22814 ) ) ( not ( = ?auto_22785 ?auto_22786 ) ) ( not ( = ?auto_22785 ?auto_22814 ) ) ( not ( = ?auto_22786 ?auto_22815 ) ) ( not ( = ?auto_22786 ?auto_22813 ) ) ( not ( = ?auto_22786 ?auto_22827 ) ) ( not ( = ?auto_22786 ?auto_22816 ) ) ( not ( = ?auto_22786 ?auto_22831 ) ) ( not ( = ?auto_22812 ?auto_22832 ) ) ( not ( = ?auto_22812 ?auto_22829 ) ) ( not ( = ?auto_22812 ?auto_22826 ) ) ( not ( = ?auto_22812 ?auto_22817 ) ) ( not ( = ?auto_22806 ?auto_22823 ) ) ( not ( = ?auto_22806 ?auto_22811 ) ) ( not ( = ?auto_22806 ?auto_22821 ) ) ( not ( = ?auto_22806 ?auto_22809 ) ) ( not ( = ?auto_22814 ?auto_22815 ) ) ( not ( = ?auto_22814 ?auto_22813 ) ) ( not ( = ?auto_22814 ?auto_22827 ) ) ( not ( = ?auto_22814 ?auto_22816 ) ) ( not ( = ?auto_22814 ?auto_22831 ) ) ( not ( = ?auto_22781 ?auto_22790 ) ) ( not ( = ?auto_22781 ?auto_22825 ) ) ( not ( = ?auto_22782 ?auto_22790 ) ) ( not ( = ?auto_22782 ?auto_22825 ) ) ( not ( = ?auto_22783 ?auto_22790 ) ) ( not ( = ?auto_22783 ?auto_22825 ) ) ( not ( = ?auto_22784 ?auto_22790 ) ) ( not ( = ?auto_22784 ?auto_22825 ) ) ( not ( = ?auto_22785 ?auto_22790 ) ) ( not ( = ?auto_22785 ?auto_22825 ) ) ( not ( = ?auto_22788 ?auto_22790 ) ) ( not ( = ?auto_22788 ?auto_22825 ) ) ( not ( = ?auto_22790 ?auto_22814 ) ) ( not ( = ?auto_22790 ?auto_22815 ) ) ( not ( = ?auto_22790 ?auto_22813 ) ) ( not ( = ?auto_22790 ?auto_22827 ) ) ( not ( = ?auto_22790 ?auto_22816 ) ) ( not ( = ?auto_22790 ?auto_22831 ) ) ( not ( = ?auto_22807 ?auto_22812 ) ) ( not ( = ?auto_22807 ?auto_22832 ) ) ( not ( = ?auto_22807 ?auto_22829 ) ) ( not ( = ?auto_22807 ?auto_22826 ) ) ( not ( = ?auto_22807 ?auto_22817 ) ) ( not ( = ?auto_22818 ?auto_22806 ) ) ( not ( = ?auto_22818 ?auto_22823 ) ) ( not ( = ?auto_22818 ?auto_22811 ) ) ( not ( = ?auto_22818 ?auto_22821 ) ) ( not ( = ?auto_22818 ?auto_22809 ) ) ( not ( = ?auto_22825 ?auto_22814 ) ) ( not ( = ?auto_22825 ?auto_22815 ) ) ( not ( = ?auto_22825 ?auto_22813 ) ) ( not ( = ?auto_22825 ?auto_22827 ) ) ( not ( = ?auto_22825 ?auto_22816 ) ) ( not ( = ?auto_22825 ?auto_22831 ) ) ( not ( = ?auto_22781 ?auto_22789 ) ) ( not ( = ?auto_22781 ?auto_22803 ) ) ( not ( = ?auto_22782 ?auto_22789 ) ) ( not ( = ?auto_22782 ?auto_22803 ) ) ( not ( = ?auto_22783 ?auto_22789 ) ) ( not ( = ?auto_22783 ?auto_22803 ) ) ( not ( = ?auto_22784 ?auto_22789 ) ) ( not ( = ?auto_22784 ?auto_22803 ) ) ( not ( = ?auto_22785 ?auto_22789 ) ) ( not ( = ?auto_22785 ?auto_22803 ) ) ( not ( = ?auto_22788 ?auto_22789 ) ) ( not ( = ?auto_22788 ?auto_22803 ) ) ( not ( = ?auto_22786 ?auto_22789 ) ) ( not ( = ?auto_22786 ?auto_22803 ) ) ( not ( = ?auto_22789 ?auto_22825 ) ) ( not ( = ?auto_22789 ?auto_22814 ) ) ( not ( = ?auto_22789 ?auto_22815 ) ) ( not ( = ?auto_22789 ?auto_22813 ) ) ( not ( = ?auto_22789 ?auto_22827 ) ) ( not ( = ?auto_22789 ?auto_22816 ) ) ( not ( = ?auto_22789 ?auto_22831 ) ) ( not ( = ?auto_22830 ?auto_22807 ) ) ( not ( = ?auto_22830 ?auto_22812 ) ) ( not ( = ?auto_22830 ?auto_22832 ) ) ( not ( = ?auto_22830 ?auto_22829 ) ) ( not ( = ?auto_22830 ?auto_22826 ) ) ( not ( = ?auto_22830 ?auto_22817 ) ) ( not ( = ?auto_22820 ?auto_22818 ) ) ( not ( = ?auto_22820 ?auto_22806 ) ) ( not ( = ?auto_22820 ?auto_22823 ) ) ( not ( = ?auto_22820 ?auto_22811 ) ) ( not ( = ?auto_22820 ?auto_22821 ) ) ( not ( = ?auto_22820 ?auto_22809 ) ) ( not ( = ?auto_22803 ?auto_22825 ) ) ( not ( = ?auto_22803 ?auto_22814 ) ) ( not ( = ?auto_22803 ?auto_22815 ) ) ( not ( = ?auto_22803 ?auto_22813 ) ) ( not ( = ?auto_22803 ?auto_22827 ) ) ( not ( = ?auto_22803 ?auto_22816 ) ) ( not ( = ?auto_22803 ?auto_22831 ) ) ( not ( = ?auto_22781 ?auto_22787 ) ) ( not ( = ?auto_22781 ?auto_22804 ) ) ( not ( = ?auto_22782 ?auto_22787 ) ) ( not ( = ?auto_22782 ?auto_22804 ) ) ( not ( = ?auto_22783 ?auto_22787 ) ) ( not ( = ?auto_22783 ?auto_22804 ) ) ( not ( = ?auto_22784 ?auto_22787 ) ) ( not ( = ?auto_22784 ?auto_22804 ) ) ( not ( = ?auto_22785 ?auto_22787 ) ) ( not ( = ?auto_22785 ?auto_22804 ) ) ( not ( = ?auto_22788 ?auto_22787 ) ) ( not ( = ?auto_22788 ?auto_22804 ) ) ( not ( = ?auto_22786 ?auto_22787 ) ) ( not ( = ?auto_22786 ?auto_22804 ) ) ( not ( = ?auto_22790 ?auto_22787 ) ) ( not ( = ?auto_22790 ?auto_22804 ) ) ( not ( = ?auto_22787 ?auto_22803 ) ) ( not ( = ?auto_22787 ?auto_22825 ) ) ( not ( = ?auto_22787 ?auto_22814 ) ) ( not ( = ?auto_22787 ?auto_22815 ) ) ( not ( = ?auto_22787 ?auto_22813 ) ) ( not ( = ?auto_22787 ?auto_22827 ) ) ( not ( = ?auto_22787 ?auto_22816 ) ) ( not ( = ?auto_22787 ?auto_22831 ) ) ( not ( = ?auto_22804 ?auto_22803 ) ) ( not ( = ?auto_22804 ?auto_22825 ) ) ( not ( = ?auto_22804 ?auto_22814 ) ) ( not ( = ?auto_22804 ?auto_22815 ) ) ( not ( = ?auto_22804 ?auto_22813 ) ) ( not ( = ?auto_22804 ?auto_22827 ) ) ( not ( = ?auto_22804 ?auto_22816 ) ) ( not ( = ?auto_22804 ?auto_22831 ) ) ( not ( = ?auto_22781 ?auto_22792 ) ) ( not ( = ?auto_22781 ?auto_22810 ) ) ( not ( = ?auto_22782 ?auto_22792 ) ) ( not ( = ?auto_22782 ?auto_22810 ) ) ( not ( = ?auto_22783 ?auto_22792 ) ) ( not ( = ?auto_22783 ?auto_22810 ) ) ( not ( = ?auto_22784 ?auto_22792 ) ) ( not ( = ?auto_22784 ?auto_22810 ) ) ( not ( = ?auto_22785 ?auto_22792 ) ) ( not ( = ?auto_22785 ?auto_22810 ) ) ( not ( = ?auto_22788 ?auto_22792 ) ) ( not ( = ?auto_22788 ?auto_22810 ) ) ( not ( = ?auto_22786 ?auto_22792 ) ) ( not ( = ?auto_22786 ?auto_22810 ) ) ( not ( = ?auto_22790 ?auto_22792 ) ) ( not ( = ?auto_22790 ?auto_22810 ) ) ( not ( = ?auto_22789 ?auto_22792 ) ) ( not ( = ?auto_22789 ?auto_22810 ) ) ( not ( = ?auto_22792 ?auto_22804 ) ) ( not ( = ?auto_22792 ?auto_22803 ) ) ( not ( = ?auto_22792 ?auto_22825 ) ) ( not ( = ?auto_22792 ?auto_22814 ) ) ( not ( = ?auto_22792 ?auto_22815 ) ) ( not ( = ?auto_22792 ?auto_22813 ) ) ( not ( = ?auto_22792 ?auto_22827 ) ) ( not ( = ?auto_22792 ?auto_22816 ) ) ( not ( = ?auto_22792 ?auto_22831 ) ) ( not ( = ?auto_22810 ?auto_22804 ) ) ( not ( = ?auto_22810 ?auto_22803 ) ) ( not ( = ?auto_22810 ?auto_22825 ) ) ( not ( = ?auto_22810 ?auto_22814 ) ) ( not ( = ?auto_22810 ?auto_22815 ) ) ( not ( = ?auto_22810 ?auto_22813 ) ) ( not ( = ?auto_22810 ?auto_22827 ) ) ( not ( = ?auto_22810 ?auto_22816 ) ) ( not ( = ?auto_22810 ?auto_22831 ) ) ( not ( = ?auto_22781 ?auto_22791 ) ) ( not ( = ?auto_22781 ?auto_22808 ) ) ( not ( = ?auto_22782 ?auto_22791 ) ) ( not ( = ?auto_22782 ?auto_22808 ) ) ( not ( = ?auto_22783 ?auto_22791 ) ) ( not ( = ?auto_22783 ?auto_22808 ) ) ( not ( = ?auto_22784 ?auto_22791 ) ) ( not ( = ?auto_22784 ?auto_22808 ) ) ( not ( = ?auto_22785 ?auto_22791 ) ) ( not ( = ?auto_22785 ?auto_22808 ) ) ( not ( = ?auto_22788 ?auto_22791 ) ) ( not ( = ?auto_22788 ?auto_22808 ) ) ( not ( = ?auto_22786 ?auto_22791 ) ) ( not ( = ?auto_22786 ?auto_22808 ) ) ( not ( = ?auto_22790 ?auto_22791 ) ) ( not ( = ?auto_22790 ?auto_22808 ) ) ( not ( = ?auto_22789 ?auto_22791 ) ) ( not ( = ?auto_22789 ?auto_22808 ) ) ( not ( = ?auto_22787 ?auto_22791 ) ) ( not ( = ?auto_22787 ?auto_22808 ) ) ( not ( = ?auto_22791 ?auto_22810 ) ) ( not ( = ?auto_22791 ?auto_22804 ) ) ( not ( = ?auto_22791 ?auto_22803 ) ) ( not ( = ?auto_22791 ?auto_22825 ) ) ( not ( = ?auto_22791 ?auto_22814 ) ) ( not ( = ?auto_22791 ?auto_22815 ) ) ( not ( = ?auto_22791 ?auto_22813 ) ) ( not ( = ?auto_22791 ?auto_22827 ) ) ( not ( = ?auto_22791 ?auto_22816 ) ) ( not ( = ?auto_22791 ?auto_22831 ) ) ( not ( = ?auto_22808 ?auto_22810 ) ) ( not ( = ?auto_22808 ?auto_22804 ) ) ( not ( = ?auto_22808 ?auto_22803 ) ) ( not ( = ?auto_22808 ?auto_22825 ) ) ( not ( = ?auto_22808 ?auto_22814 ) ) ( not ( = ?auto_22808 ?auto_22815 ) ) ( not ( = ?auto_22808 ?auto_22813 ) ) ( not ( = ?auto_22808 ?auto_22827 ) ) ( not ( = ?auto_22808 ?auto_22816 ) ) ( not ( = ?auto_22808 ?auto_22831 ) ) ( not ( = ?auto_22781 ?auto_22793 ) ) ( not ( = ?auto_22781 ?auto_22828 ) ) ( not ( = ?auto_22782 ?auto_22793 ) ) ( not ( = ?auto_22782 ?auto_22828 ) ) ( not ( = ?auto_22783 ?auto_22793 ) ) ( not ( = ?auto_22783 ?auto_22828 ) ) ( not ( = ?auto_22784 ?auto_22793 ) ) ( not ( = ?auto_22784 ?auto_22828 ) ) ( not ( = ?auto_22785 ?auto_22793 ) ) ( not ( = ?auto_22785 ?auto_22828 ) ) ( not ( = ?auto_22788 ?auto_22793 ) ) ( not ( = ?auto_22788 ?auto_22828 ) ) ( not ( = ?auto_22786 ?auto_22793 ) ) ( not ( = ?auto_22786 ?auto_22828 ) ) ( not ( = ?auto_22790 ?auto_22793 ) ) ( not ( = ?auto_22790 ?auto_22828 ) ) ( not ( = ?auto_22789 ?auto_22793 ) ) ( not ( = ?auto_22789 ?auto_22828 ) ) ( not ( = ?auto_22787 ?auto_22793 ) ) ( not ( = ?auto_22787 ?auto_22828 ) ) ( not ( = ?auto_22792 ?auto_22793 ) ) ( not ( = ?auto_22792 ?auto_22828 ) ) ( not ( = ?auto_22793 ?auto_22808 ) ) ( not ( = ?auto_22793 ?auto_22810 ) ) ( not ( = ?auto_22793 ?auto_22804 ) ) ( not ( = ?auto_22793 ?auto_22803 ) ) ( not ( = ?auto_22793 ?auto_22825 ) ) ( not ( = ?auto_22793 ?auto_22814 ) ) ( not ( = ?auto_22793 ?auto_22815 ) ) ( not ( = ?auto_22793 ?auto_22813 ) ) ( not ( = ?auto_22793 ?auto_22827 ) ) ( not ( = ?auto_22793 ?auto_22816 ) ) ( not ( = ?auto_22793 ?auto_22831 ) ) ( not ( = ?auto_22828 ?auto_22808 ) ) ( not ( = ?auto_22828 ?auto_22810 ) ) ( not ( = ?auto_22828 ?auto_22804 ) ) ( not ( = ?auto_22828 ?auto_22803 ) ) ( not ( = ?auto_22828 ?auto_22825 ) ) ( not ( = ?auto_22828 ?auto_22814 ) ) ( not ( = ?auto_22828 ?auto_22815 ) ) ( not ( = ?auto_22828 ?auto_22813 ) ) ( not ( = ?auto_22828 ?auto_22827 ) ) ( not ( = ?auto_22828 ?auto_22816 ) ) ( not ( = ?auto_22828 ?auto_22831 ) ) ( not ( = ?auto_22781 ?auto_22795 ) ) ( not ( = ?auto_22781 ?auto_22822 ) ) ( not ( = ?auto_22782 ?auto_22795 ) ) ( not ( = ?auto_22782 ?auto_22822 ) ) ( not ( = ?auto_22783 ?auto_22795 ) ) ( not ( = ?auto_22783 ?auto_22822 ) ) ( not ( = ?auto_22784 ?auto_22795 ) ) ( not ( = ?auto_22784 ?auto_22822 ) ) ( not ( = ?auto_22785 ?auto_22795 ) ) ( not ( = ?auto_22785 ?auto_22822 ) ) ( not ( = ?auto_22788 ?auto_22795 ) ) ( not ( = ?auto_22788 ?auto_22822 ) ) ( not ( = ?auto_22786 ?auto_22795 ) ) ( not ( = ?auto_22786 ?auto_22822 ) ) ( not ( = ?auto_22790 ?auto_22795 ) ) ( not ( = ?auto_22790 ?auto_22822 ) ) ( not ( = ?auto_22789 ?auto_22795 ) ) ( not ( = ?auto_22789 ?auto_22822 ) ) ( not ( = ?auto_22787 ?auto_22795 ) ) ( not ( = ?auto_22787 ?auto_22822 ) ) ( not ( = ?auto_22792 ?auto_22795 ) ) ( not ( = ?auto_22792 ?auto_22822 ) ) ( not ( = ?auto_22791 ?auto_22795 ) ) ( not ( = ?auto_22791 ?auto_22822 ) ) ( not ( = ?auto_22795 ?auto_22828 ) ) ( not ( = ?auto_22795 ?auto_22808 ) ) ( not ( = ?auto_22795 ?auto_22810 ) ) ( not ( = ?auto_22795 ?auto_22804 ) ) ( not ( = ?auto_22795 ?auto_22803 ) ) ( not ( = ?auto_22795 ?auto_22825 ) ) ( not ( = ?auto_22795 ?auto_22814 ) ) ( not ( = ?auto_22795 ?auto_22815 ) ) ( not ( = ?auto_22795 ?auto_22813 ) ) ( not ( = ?auto_22795 ?auto_22827 ) ) ( not ( = ?auto_22795 ?auto_22816 ) ) ( not ( = ?auto_22795 ?auto_22831 ) ) ( not ( = ?auto_22800 ?auto_22829 ) ) ( not ( = ?auto_22800 ?auto_22826 ) ) ( not ( = ?auto_22800 ?auto_22812 ) ) ( not ( = ?auto_22800 ?auto_22817 ) ) ( not ( = ?auto_22800 ?auto_22830 ) ) ( not ( = ?auto_22800 ?auto_22807 ) ) ( not ( = ?auto_22800 ?auto_22832 ) ) ( not ( = ?auto_22801 ?auto_22811 ) ) ( not ( = ?auto_22801 ?auto_22821 ) ) ( not ( = ?auto_22801 ?auto_22806 ) ) ( not ( = ?auto_22801 ?auto_22809 ) ) ( not ( = ?auto_22801 ?auto_22820 ) ) ( not ( = ?auto_22801 ?auto_22818 ) ) ( not ( = ?auto_22801 ?auto_22823 ) ) ( not ( = ?auto_22822 ?auto_22828 ) ) ( not ( = ?auto_22822 ?auto_22808 ) ) ( not ( = ?auto_22822 ?auto_22810 ) ) ( not ( = ?auto_22822 ?auto_22804 ) ) ( not ( = ?auto_22822 ?auto_22803 ) ) ( not ( = ?auto_22822 ?auto_22825 ) ) ( not ( = ?auto_22822 ?auto_22814 ) ) ( not ( = ?auto_22822 ?auto_22815 ) ) ( not ( = ?auto_22822 ?auto_22813 ) ) ( not ( = ?auto_22822 ?auto_22827 ) ) ( not ( = ?auto_22822 ?auto_22816 ) ) ( not ( = ?auto_22822 ?auto_22831 ) ) ( not ( = ?auto_22781 ?auto_22796 ) ) ( not ( = ?auto_22781 ?auto_22805 ) ) ( not ( = ?auto_22782 ?auto_22796 ) ) ( not ( = ?auto_22782 ?auto_22805 ) ) ( not ( = ?auto_22783 ?auto_22796 ) ) ( not ( = ?auto_22783 ?auto_22805 ) ) ( not ( = ?auto_22784 ?auto_22796 ) ) ( not ( = ?auto_22784 ?auto_22805 ) ) ( not ( = ?auto_22785 ?auto_22796 ) ) ( not ( = ?auto_22785 ?auto_22805 ) ) ( not ( = ?auto_22788 ?auto_22796 ) ) ( not ( = ?auto_22788 ?auto_22805 ) ) ( not ( = ?auto_22786 ?auto_22796 ) ) ( not ( = ?auto_22786 ?auto_22805 ) ) ( not ( = ?auto_22790 ?auto_22796 ) ) ( not ( = ?auto_22790 ?auto_22805 ) ) ( not ( = ?auto_22789 ?auto_22796 ) ) ( not ( = ?auto_22789 ?auto_22805 ) ) ( not ( = ?auto_22787 ?auto_22796 ) ) ( not ( = ?auto_22787 ?auto_22805 ) ) ( not ( = ?auto_22792 ?auto_22796 ) ) ( not ( = ?auto_22792 ?auto_22805 ) ) ( not ( = ?auto_22791 ?auto_22796 ) ) ( not ( = ?auto_22791 ?auto_22805 ) ) ( not ( = ?auto_22793 ?auto_22796 ) ) ( not ( = ?auto_22793 ?auto_22805 ) ) ( not ( = ?auto_22796 ?auto_22822 ) ) ( not ( = ?auto_22796 ?auto_22828 ) ) ( not ( = ?auto_22796 ?auto_22808 ) ) ( not ( = ?auto_22796 ?auto_22810 ) ) ( not ( = ?auto_22796 ?auto_22804 ) ) ( not ( = ?auto_22796 ?auto_22803 ) ) ( not ( = ?auto_22796 ?auto_22825 ) ) ( not ( = ?auto_22796 ?auto_22814 ) ) ( not ( = ?auto_22796 ?auto_22815 ) ) ( not ( = ?auto_22796 ?auto_22813 ) ) ( not ( = ?auto_22796 ?auto_22827 ) ) ( not ( = ?auto_22796 ?auto_22816 ) ) ( not ( = ?auto_22796 ?auto_22831 ) ) ( not ( = ?auto_22824 ?auto_22800 ) ) ( not ( = ?auto_22824 ?auto_22829 ) ) ( not ( = ?auto_22824 ?auto_22826 ) ) ( not ( = ?auto_22824 ?auto_22812 ) ) ( not ( = ?auto_22824 ?auto_22817 ) ) ( not ( = ?auto_22824 ?auto_22830 ) ) ( not ( = ?auto_22824 ?auto_22807 ) ) ( not ( = ?auto_22824 ?auto_22832 ) ) ( not ( = ?auto_22819 ?auto_22801 ) ) ( not ( = ?auto_22819 ?auto_22811 ) ) ( not ( = ?auto_22819 ?auto_22821 ) ) ( not ( = ?auto_22819 ?auto_22806 ) ) ( not ( = ?auto_22819 ?auto_22809 ) ) ( not ( = ?auto_22819 ?auto_22820 ) ) ( not ( = ?auto_22819 ?auto_22818 ) ) ( not ( = ?auto_22819 ?auto_22823 ) ) ( not ( = ?auto_22805 ?auto_22822 ) ) ( not ( = ?auto_22805 ?auto_22828 ) ) ( not ( = ?auto_22805 ?auto_22808 ) ) ( not ( = ?auto_22805 ?auto_22810 ) ) ( not ( = ?auto_22805 ?auto_22804 ) ) ( not ( = ?auto_22805 ?auto_22803 ) ) ( not ( = ?auto_22805 ?auto_22825 ) ) ( not ( = ?auto_22805 ?auto_22814 ) ) ( not ( = ?auto_22805 ?auto_22815 ) ) ( not ( = ?auto_22805 ?auto_22813 ) ) ( not ( = ?auto_22805 ?auto_22827 ) ) ( not ( = ?auto_22805 ?auto_22816 ) ) ( not ( = ?auto_22805 ?auto_22831 ) ) ( not ( = ?auto_22781 ?auto_22794 ) ) ( not ( = ?auto_22781 ?auto_22802 ) ) ( not ( = ?auto_22782 ?auto_22794 ) ) ( not ( = ?auto_22782 ?auto_22802 ) ) ( not ( = ?auto_22783 ?auto_22794 ) ) ( not ( = ?auto_22783 ?auto_22802 ) ) ( not ( = ?auto_22784 ?auto_22794 ) ) ( not ( = ?auto_22784 ?auto_22802 ) ) ( not ( = ?auto_22785 ?auto_22794 ) ) ( not ( = ?auto_22785 ?auto_22802 ) ) ( not ( = ?auto_22788 ?auto_22794 ) ) ( not ( = ?auto_22788 ?auto_22802 ) ) ( not ( = ?auto_22786 ?auto_22794 ) ) ( not ( = ?auto_22786 ?auto_22802 ) ) ( not ( = ?auto_22790 ?auto_22794 ) ) ( not ( = ?auto_22790 ?auto_22802 ) ) ( not ( = ?auto_22789 ?auto_22794 ) ) ( not ( = ?auto_22789 ?auto_22802 ) ) ( not ( = ?auto_22787 ?auto_22794 ) ) ( not ( = ?auto_22787 ?auto_22802 ) ) ( not ( = ?auto_22792 ?auto_22794 ) ) ( not ( = ?auto_22792 ?auto_22802 ) ) ( not ( = ?auto_22791 ?auto_22794 ) ) ( not ( = ?auto_22791 ?auto_22802 ) ) ( not ( = ?auto_22793 ?auto_22794 ) ) ( not ( = ?auto_22793 ?auto_22802 ) ) ( not ( = ?auto_22795 ?auto_22794 ) ) ( not ( = ?auto_22795 ?auto_22802 ) ) ( not ( = ?auto_22794 ?auto_22805 ) ) ( not ( = ?auto_22794 ?auto_22822 ) ) ( not ( = ?auto_22794 ?auto_22828 ) ) ( not ( = ?auto_22794 ?auto_22808 ) ) ( not ( = ?auto_22794 ?auto_22810 ) ) ( not ( = ?auto_22794 ?auto_22804 ) ) ( not ( = ?auto_22794 ?auto_22803 ) ) ( not ( = ?auto_22794 ?auto_22825 ) ) ( not ( = ?auto_22794 ?auto_22814 ) ) ( not ( = ?auto_22794 ?auto_22815 ) ) ( not ( = ?auto_22794 ?auto_22813 ) ) ( not ( = ?auto_22794 ?auto_22827 ) ) ( not ( = ?auto_22794 ?auto_22816 ) ) ( not ( = ?auto_22794 ?auto_22831 ) ) ( not ( = ?auto_22802 ?auto_22805 ) ) ( not ( = ?auto_22802 ?auto_22822 ) ) ( not ( = ?auto_22802 ?auto_22828 ) ) ( not ( = ?auto_22802 ?auto_22808 ) ) ( not ( = ?auto_22802 ?auto_22810 ) ) ( not ( = ?auto_22802 ?auto_22804 ) ) ( not ( = ?auto_22802 ?auto_22803 ) ) ( not ( = ?auto_22802 ?auto_22825 ) ) ( not ( = ?auto_22802 ?auto_22814 ) ) ( not ( = ?auto_22802 ?auto_22815 ) ) ( not ( = ?auto_22802 ?auto_22813 ) ) ( not ( = ?auto_22802 ?auto_22827 ) ) ( not ( = ?auto_22802 ?auto_22816 ) ) ( not ( = ?auto_22802 ?auto_22831 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_22781 ?auto_22782 ?auto_22783 ?auto_22784 ?auto_22785 ?auto_22788 ?auto_22786 ?auto_22790 ?auto_22789 ?auto_22787 ?auto_22792 ?auto_22791 ?auto_22793 ?auto_22795 ?auto_22796 )
      ( MAKE-1CRATE ?auto_22796 ?auto_22794 )
      ( MAKE-15CRATE-VERIFY ?auto_22781 ?auto_22782 ?auto_22783 ?auto_22784 ?auto_22785 ?auto_22788 ?auto_22786 ?auto_22790 ?auto_22789 ?auto_22787 ?auto_22792 ?auto_22791 ?auto_22793 ?auto_22795 ?auto_22796 ?auto_22794 ) )
  )

)

