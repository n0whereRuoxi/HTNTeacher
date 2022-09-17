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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17089 - SURFACE
      ?auto_17090 - SURFACE
    )
    :vars
    (
      ?auto_17091 - HOIST
      ?auto_17092 - PLACE
      ?auto_17094 - PLACE
      ?auto_17095 - HOIST
      ?auto_17096 - SURFACE
      ?auto_17093 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17091 ?auto_17092 ) ( SURFACE-AT ?auto_17089 ?auto_17092 ) ( CLEAR ?auto_17089 ) ( IS-CRATE ?auto_17090 ) ( AVAILABLE ?auto_17091 ) ( not ( = ?auto_17094 ?auto_17092 ) ) ( HOIST-AT ?auto_17095 ?auto_17094 ) ( AVAILABLE ?auto_17095 ) ( SURFACE-AT ?auto_17090 ?auto_17094 ) ( ON ?auto_17090 ?auto_17096 ) ( CLEAR ?auto_17090 ) ( TRUCK-AT ?auto_17093 ?auto_17092 ) ( not ( = ?auto_17089 ?auto_17090 ) ) ( not ( = ?auto_17089 ?auto_17096 ) ) ( not ( = ?auto_17090 ?auto_17096 ) ) ( not ( = ?auto_17091 ?auto_17095 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17093 ?auto_17092 ?auto_17094 )
      ( !LIFT ?auto_17095 ?auto_17090 ?auto_17096 ?auto_17094 )
      ( !LOAD ?auto_17095 ?auto_17090 ?auto_17093 ?auto_17094 )
      ( !DRIVE ?auto_17093 ?auto_17094 ?auto_17092 )
      ( !UNLOAD ?auto_17091 ?auto_17090 ?auto_17093 ?auto_17092 )
      ( !DROP ?auto_17091 ?auto_17090 ?auto_17089 ?auto_17092 )
      ( MAKE-1CRATE-VERIFY ?auto_17089 ?auto_17090 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17099 - SURFACE
      ?auto_17100 - SURFACE
    )
    :vars
    (
      ?auto_17101 - HOIST
      ?auto_17102 - PLACE
      ?auto_17104 - PLACE
      ?auto_17105 - HOIST
      ?auto_17106 - SURFACE
      ?auto_17103 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17101 ?auto_17102 ) ( SURFACE-AT ?auto_17099 ?auto_17102 ) ( CLEAR ?auto_17099 ) ( IS-CRATE ?auto_17100 ) ( AVAILABLE ?auto_17101 ) ( not ( = ?auto_17104 ?auto_17102 ) ) ( HOIST-AT ?auto_17105 ?auto_17104 ) ( AVAILABLE ?auto_17105 ) ( SURFACE-AT ?auto_17100 ?auto_17104 ) ( ON ?auto_17100 ?auto_17106 ) ( CLEAR ?auto_17100 ) ( TRUCK-AT ?auto_17103 ?auto_17102 ) ( not ( = ?auto_17099 ?auto_17100 ) ) ( not ( = ?auto_17099 ?auto_17106 ) ) ( not ( = ?auto_17100 ?auto_17106 ) ) ( not ( = ?auto_17101 ?auto_17105 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17103 ?auto_17102 ?auto_17104 )
      ( !LIFT ?auto_17105 ?auto_17100 ?auto_17106 ?auto_17104 )
      ( !LOAD ?auto_17105 ?auto_17100 ?auto_17103 ?auto_17104 )
      ( !DRIVE ?auto_17103 ?auto_17104 ?auto_17102 )
      ( !UNLOAD ?auto_17101 ?auto_17100 ?auto_17103 ?auto_17102 )
      ( !DROP ?auto_17101 ?auto_17100 ?auto_17099 ?auto_17102 )
      ( MAKE-1CRATE-VERIFY ?auto_17099 ?auto_17100 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17110 - SURFACE
      ?auto_17111 - SURFACE
      ?auto_17112 - SURFACE
    )
    :vars
    (
      ?auto_17118 - HOIST
      ?auto_17115 - PLACE
      ?auto_17116 - PLACE
      ?auto_17114 - HOIST
      ?auto_17113 - SURFACE
      ?auto_17120 - PLACE
      ?auto_17121 - HOIST
      ?auto_17119 - SURFACE
      ?auto_17117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17118 ?auto_17115 ) ( IS-CRATE ?auto_17112 ) ( not ( = ?auto_17116 ?auto_17115 ) ) ( HOIST-AT ?auto_17114 ?auto_17116 ) ( AVAILABLE ?auto_17114 ) ( SURFACE-AT ?auto_17112 ?auto_17116 ) ( ON ?auto_17112 ?auto_17113 ) ( CLEAR ?auto_17112 ) ( not ( = ?auto_17111 ?auto_17112 ) ) ( not ( = ?auto_17111 ?auto_17113 ) ) ( not ( = ?auto_17112 ?auto_17113 ) ) ( not ( = ?auto_17118 ?auto_17114 ) ) ( SURFACE-AT ?auto_17110 ?auto_17115 ) ( CLEAR ?auto_17110 ) ( IS-CRATE ?auto_17111 ) ( AVAILABLE ?auto_17118 ) ( not ( = ?auto_17120 ?auto_17115 ) ) ( HOIST-AT ?auto_17121 ?auto_17120 ) ( AVAILABLE ?auto_17121 ) ( SURFACE-AT ?auto_17111 ?auto_17120 ) ( ON ?auto_17111 ?auto_17119 ) ( CLEAR ?auto_17111 ) ( TRUCK-AT ?auto_17117 ?auto_17115 ) ( not ( = ?auto_17110 ?auto_17111 ) ) ( not ( = ?auto_17110 ?auto_17119 ) ) ( not ( = ?auto_17111 ?auto_17119 ) ) ( not ( = ?auto_17118 ?auto_17121 ) ) ( not ( = ?auto_17110 ?auto_17112 ) ) ( not ( = ?auto_17110 ?auto_17113 ) ) ( not ( = ?auto_17112 ?auto_17119 ) ) ( not ( = ?auto_17116 ?auto_17120 ) ) ( not ( = ?auto_17114 ?auto_17121 ) ) ( not ( = ?auto_17113 ?auto_17119 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17110 ?auto_17111 )
      ( MAKE-1CRATE ?auto_17111 ?auto_17112 )
      ( MAKE-2CRATE-VERIFY ?auto_17110 ?auto_17111 ?auto_17112 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17124 - SURFACE
      ?auto_17125 - SURFACE
    )
    :vars
    (
      ?auto_17126 - HOIST
      ?auto_17127 - PLACE
      ?auto_17129 - PLACE
      ?auto_17130 - HOIST
      ?auto_17131 - SURFACE
      ?auto_17128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17126 ?auto_17127 ) ( SURFACE-AT ?auto_17124 ?auto_17127 ) ( CLEAR ?auto_17124 ) ( IS-CRATE ?auto_17125 ) ( AVAILABLE ?auto_17126 ) ( not ( = ?auto_17129 ?auto_17127 ) ) ( HOIST-AT ?auto_17130 ?auto_17129 ) ( AVAILABLE ?auto_17130 ) ( SURFACE-AT ?auto_17125 ?auto_17129 ) ( ON ?auto_17125 ?auto_17131 ) ( CLEAR ?auto_17125 ) ( TRUCK-AT ?auto_17128 ?auto_17127 ) ( not ( = ?auto_17124 ?auto_17125 ) ) ( not ( = ?auto_17124 ?auto_17131 ) ) ( not ( = ?auto_17125 ?auto_17131 ) ) ( not ( = ?auto_17126 ?auto_17130 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17128 ?auto_17127 ?auto_17129 )
      ( !LIFT ?auto_17130 ?auto_17125 ?auto_17131 ?auto_17129 )
      ( !LOAD ?auto_17130 ?auto_17125 ?auto_17128 ?auto_17129 )
      ( !DRIVE ?auto_17128 ?auto_17129 ?auto_17127 )
      ( !UNLOAD ?auto_17126 ?auto_17125 ?auto_17128 ?auto_17127 )
      ( !DROP ?auto_17126 ?auto_17125 ?auto_17124 ?auto_17127 )
      ( MAKE-1CRATE-VERIFY ?auto_17124 ?auto_17125 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17136 - SURFACE
      ?auto_17137 - SURFACE
      ?auto_17138 - SURFACE
      ?auto_17139 - SURFACE
    )
    :vars
    (
      ?auto_17141 - HOIST
      ?auto_17145 - PLACE
      ?auto_17140 - PLACE
      ?auto_17142 - HOIST
      ?auto_17144 - SURFACE
      ?auto_17149 - SURFACE
      ?auto_17148 - PLACE
      ?auto_17146 - HOIST
      ?auto_17147 - SURFACE
      ?auto_17143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17141 ?auto_17145 ) ( IS-CRATE ?auto_17139 ) ( not ( = ?auto_17140 ?auto_17145 ) ) ( HOIST-AT ?auto_17142 ?auto_17140 ) ( SURFACE-AT ?auto_17139 ?auto_17140 ) ( ON ?auto_17139 ?auto_17144 ) ( CLEAR ?auto_17139 ) ( not ( = ?auto_17138 ?auto_17139 ) ) ( not ( = ?auto_17138 ?auto_17144 ) ) ( not ( = ?auto_17139 ?auto_17144 ) ) ( not ( = ?auto_17141 ?auto_17142 ) ) ( IS-CRATE ?auto_17138 ) ( AVAILABLE ?auto_17142 ) ( SURFACE-AT ?auto_17138 ?auto_17140 ) ( ON ?auto_17138 ?auto_17149 ) ( CLEAR ?auto_17138 ) ( not ( = ?auto_17137 ?auto_17138 ) ) ( not ( = ?auto_17137 ?auto_17149 ) ) ( not ( = ?auto_17138 ?auto_17149 ) ) ( SURFACE-AT ?auto_17136 ?auto_17145 ) ( CLEAR ?auto_17136 ) ( IS-CRATE ?auto_17137 ) ( AVAILABLE ?auto_17141 ) ( not ( = ?auto_17148 ?auto_17145 ) ) ( HOIST-AT ?auto_17146 ?auto_17148 ) ( AVAILABLE ?auto_17146 ) ( SURFACE-AT ?auto_17137 ?auto_17148 ) ( ON ?auto_17137 ?auto_17147 ) ( CLEAR ?auto_17137 ) ( TRUCK-AT ?auto_17143 ?auto_17145 ) ( not ( = ?auto_17136 ?auto_17137 ) ) ( not ( = ?auto_17136 ?auto_17147 ) ) ( not ( = ?auto_17137 ?auto_17147 ) ) ( not ( = ?auto_17141 ?auto_17146 ) ) ( not ( = ?auto_17136 ?auto_17138 ) ) ( not ( = ?auto_17136 ?auto_17149 ) ) ( not ( = ?auto_17138 ?auto_17147 ) ) ( not ( = ?auto_17140 ?auto_17148 ) ) ( not ( = ?auto_17142 ?auto_17146 ) ) ( not ( = ?auto_17149 ?auto_17147 ) ) ( not ( = ?auto_17136 ?auto_17139 ) ) ( not ( = ?auto_17136 ?auto_17144 ) ) ( not ( = ?auto_17137 ?auto_17139 ) ) ( not ( = ?auto_17137 ?auto_17144 ) ) ( not ( = ?auto_17139 ?auto_17149 ) ) ( not ( = ?auto_17139 ?auto_17147 ) ) ( not ( = ?auto_17144 ?auto_17149 ) ) ( not ( = ?auto_17144 ?auto_17147 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17136 ?auto_17137 ?auto_17138 )
      ( MAKE-1CRATE ?auto_17138 ?auto_17139 )
      ( MAKE-3CRATE-VERIFY ?auto_17136 ?auto_17137 ?auto_17138 ?auto_17139 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17152 - SURFACE
      ?auto_17153 - SURFACE
    )
    :vars
    (
      ?auto_17154 - HOIST
      ?auto_17155 - PLACE
      ?auto_17157 - PLACE
      ?auto_17158 - HOIST
      ?auto_17159 - SURFACE
      ?auto_17156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17154 ?auto_17155 ) ( SURFACE-AT ?auto_17152 ?auto_17155 ) ( CLEAR ?auto_17152 ) ( IS-CRATE ?auto_17153 ) ( AVAILABLE ?auto_17154 ) ( not ( = ?auto_17157 ?auto_17155 ) ) ( HOIST-AT ?auto_17158 ?auto_17157 ) ( AVAILABLE ?auto_17158 ) ( SURFACE-AT ?auto_17153 ?auto_17157 ) ( ON ?auto_17153 ?auto_17159 ) ( CLEAR ?auto_17153 ) ( TRUCK-AT ?auto_17156 ?auto_17155 ) ( not ( = ?auto_17152 ?auto_17153 ) ) ( not ( = ?auto_17152 ?auto_17159 ) ) ( not ( = ?auto_17153 ?auto_17159 ) ) ( not ( = ?auto_17154 ?auto_17158 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17156 ?auto_17155 ?auto_17157 )
      ( !LIFT ?auto_17158 ?auto_17153 ?auto_17159 ?auto_17157 )
      ( !LOAD ?auto_17158 ?auto_17153 ?auto_17156 ?auto_17157 )
      ( !DRIVE ?auto_17156 ?auto_17157 ?auto_17155 )
      ( !UNLOAD ?auto_17154 ?auto_17153 ?auto_17156 ?auto_17155 )
      ( !DROP ?auto_17154 ?auto_17153 ?auto_17152 ?auto_17155 )
      ( MAKE-1CRATE-VERIFY ?auto_17152 ?auto_17153 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17165 - SURFACE
      ?auto_17166 - SURFACE
      ?auto_17167 - SURFACE
      ?auto_17168 - SURFACE
      ?auto_17169 - SURFACE
    )
    :vars
    (
      ?auto_17173 - HOIST
      ?auto_17174 - PLACE
      ?auto_17175 - PLACE
      ?auto_17171 - HOIST
      ?auto_17172 - SURFACE
      ?auto_17180 - PLACE
      ?auto_17179 - HOIST
      ?auto_17178 - SURFACE
      ?auto_17177 - SURFACE
      ?auto_17182 - PLACE
      ?auto_17181 - HOIST
      ?auto_17176 - SURFACE
      ?auto_17170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17173 ?auto_17174 ) ( IS-CRATE ?auto_17169 ) ( not ( = ?auto_17175 ?auto_17174 ) ) ( HOIST-AT ?auto_17171 ?auto_17175 ) ( AVAILABLE ?auto_17171 ) ( SURFACE-AT ?auto_17169 ?auto_17175 ) ( ON ?auto_17169 ?auto_17172 ) ( CLEAR ?auto_17169 ) ( not ( = ?auto_17168 ?auto_17169 ) ) ( not ( = ?auto_17168 ?auto_17172 ) ) ( not ( = ?auto_17169 ?auto_17172 ) ) ( not ( = ?auto_17173 ?auto_17171 ) ) ( IS-CRATE ?auto_17168 ) ( not ( = ?auto_17180 ?auto_17174 ) ) ( HOIST-AT ?auto_17179 ?auto_17180 ) ( SURFACE-AT ?auto_17168 ?auto_17180 ) ( ON ?auto_17168 ?auto_17178 ) ( CLEAR ?auto_17168 ) ( not ( = ?auto_17167 ?auto_17168 ) ) ( not ( = ?auto_17167 ?auto_17178 ) ) ( not ( = ?auto_17168 ?auto_17178 ) ) ( not ( = ?auto_17173 ?auto_17179 ) ) ( IS-CRATE ?auto_17167 ) ( AVAILABLE ?auto_17179 ) ( SURFACE-AT ?auto_17167 ?auto_17180 ) ( ON ?auto_17167 ?auto_17177 ) ( CLEAR ?auto_17167 ) ( not ( = ?auto_17166 ?auto_17167 ) ) ( not ( = ?auto_17166 ?auto_17177 ) ) ( not ( = ?auto_17167 ?auto_17177 ) ) ( SURFACE-AT ?auto_17165 ?auto_17174 ) ( CLEAR ?auto_17165 ) ( IS-CRATE ?auto_17166 ) ( AVAILABLE ?auto_17173 ) ( not ( = ?auto_17182 ?auto_17174 ) ) ( HOIST-AT ?auto_17181 ?auto_17182 ) ( AVAILABLE ?auto_17181 ) ( SURFACE-AT ?auto_17166 ?auto_17182 ) ( ON ?auto_17166 ?auto_17176 ) ( CLEAR ?auto_17166 ) ( TRUCK-AT ?auto_17170 ?auto_17174 ) ( not ( = ?auto_17165 ?auto_17166 ) ) ( not ( = ?auto_17165 ?auto_17176 ) ) ( not ( = ?auto_17166 ?auto_17176 ) ) ( not ( = ?auto_17173 ?auto_17181 ) ) ( not ( = ?auto_17165 ?auto_17167 ) ) ( not ( = ?auto_17165 ?auto_17177 ) ) ( not ( = ?auto_17167 ?auto_17176 ) ) ( not ( = ?auto_17180 ?auto_17182 ) ) ( not ( = ?auto_17179 ?auto_17181 ) ) ( not ( = ?auto_17177 ?auto_17176 ) ) ( not ( = ?auto_17165 ?auto_17168 ) ) ( not ( = ?auto_17165 ?auto_17178 ) ) ( not ( = ?auto_17166 ?auto_17168 ) ) ( not ( = ?auto_17166 ?auto_17178 ) ) ( not ( = ?auto_17168 ?auto_17177 ) ) ( not ( = ?auto_17168 ?auto_17176 ) ) ( not ( = ?auto_17178 ?auto_17177 ) ) ( not ( = ?auto_17178 ?auto_17176 ) ) ( not ( = ?auto_17165 ?auto_17169 ) ) ( not ( = ?auto_17165 ?auto_17172 ) ) ( not ( = ?auto_17166 ?auto_17169 ) ) ( not ( = ?auto_17166 ?auto_17172 ) ) ( not ( = ?auto_17167 ?auto_17169 ) ) ( not ( = ?auto_17167 ?auto_17172 ) ) ( not ( = ?auto_17169 ?auto_17178 ) ) ( not ( = ?auto_17169 ?auto_17177 ) ) ( not ( = ?auto_17169 ?auto_17176 ) ) ( not ( = ?auto_17175 ?auto_17180 ) ) ( not ( = ?auto_17175 ?auto_17182 ) ) ( not ( = ?auto_17171 ?auto_17179 ) ) ( not ( = ?auto_17171 ?auto_17181 ) ) ( not ( = ?auto_17172 ?auto_17178 ) ) ( not ( = ?auto_17172 ?auto_17177 ) ) ( not ( = ?auto_17172 ?auto_17176 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_17165 ?auto_17166 ?auto_17167 ?auto_17168 )
      ( MAKE-1CRATE ?auto_17168 ?auto_17169 )
      ( MAKE-4CRATE-VERIFY ?auto_17165 ?auto_17166 ?auto_17167 ?auto_17168 ?auto_17169 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17185 - SURFACE
      ?auto_17186 - SURFACE
    )
    :vars
    (
      ?auto_17187 - HOIST
      ?auto_17188 - PLACE
      ?auto_17190 - PLACE
      ?auto_17191 - HOIST
      ?auto_17192 - SURFACE
      ?auto_17189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17187 ?auto_17188 ) ( SURFACE-AT ?auto_17185 ?auto_17188 ) ( CLEAR ?auto_17185 ) ( IS-CRATE ?auto_17186 ) ( AVAILABLE ?auto_17187 ) ( not ( = ?auto_17190 ?auto_17188 ) ) ( HOIST-AT ?auto_17191 ?auto_17190 ) ( AVAILABLE ?auto_17191 ) ( SURFACE-AT ?auto_17186 ?auto_17190 ) ( ON ?auto_17186 ?auto_17192 ) ( CLEAR ?auto_17186 ) ( TRUCK-AT ?auto_17189 ?auto_17188 ) ( not ( = ?auto_17185 ?auto_17186 ) ) ( not ( = ?auto_17185 ?auto_17192 ) ) ( not ( = ?auto_17186 ?auto_17192 ) ) ( not ( = ?auto_17187 ?auto_17191 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17189 ?auto_17188 ?auto_17190 )
      ( !LIFT ?auto_17191 ?auto_17186 ?auto_17192 ?auto_17190 )
      ( !LOAD ?auto_17191 ?auto_17186 ?auto_17189 ?auto_17190 )
      ( !DRIVE ?auto_17189 ?auto_17190 ?auto_17188 )
      ( !UNLOAD ?auto_17187 ?auto_17186 ?auto_17189 ?auto_17188 )
      ( !DROP ?auto_17187 ?auto_17186 ?auto_17185 ?auto_17188 )
      ( MAKE-1CRATE-VERIFY ?auto_17185 ?auto_17186 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17199 - SURFACE
      ?auto_17200 - SURFACE
      ?auto_17201 - SURFACE
      ?auto_17202 - SURFACE
      ?auto_17203 - SURFACE
      ?auto_17204 - SURFACE
    )
    :vars
    (
      ?auto_17210 - HOIST
      ?auto_17206 - PLACE
      ?auto_17205 - PLACE
      ?auto_17207 - HOIST
      ?auto_17209 - SURFACE
      ?auto_17219 - PLACE
      ?auto_17212 - HOIST
      ?auto_17211 - SURFACE
      ?auto_17220 - PLACE
      ?auto_17218 - HOIST
      ?auto_17216 - SURFACE
      ?auto_17217 - SURFACE
      ?auto_17214 - PLACE
      ?auto_17213 - HOIST
      ?auto_17215 - SURFACE
      ?auto_17208 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17210 ?auto_17206 ) ( IS-CRATE ?auto_17204 ) ( not ( = ?auto_17205 ?auto_17206 ) ) ( HOIST-AT ?auto_17207 ?auto_17205 ) ( AVAILABLE ?auto_17207 ) ( SURFACE-AT ?auto_17204 ?auto_17205 ) ( ON ?auto_17204 ?auto_17209 ) ( CLEAR ?auto_17204 ) ( not ( = ?auto_17203 ?auto_17204 ) ) ( not ( = ?auto_17203 ?auto_17209 ) ) ( not ( = ?auto_17204 ?auto_17209 ) ) ( not ( = ?auto_17210 ?auto_17207 ) ) ( IS-CRATE ?auto_17203 ) ( not ( = ?auto_17219 ?auto_17206 ) ) ( HOIST-AT ?auto_17212 ?auto_17219 ) ( AVAILABLE ?auto_17212 ) ( SURFACE-AT ?auto_17203 ?auto_17219 ) ( ON ?auto_17203 ?auto_17211 ) ( CLEAR ?auto_17203 ) ( not ( = ?auto_17202 ?auto_17203 ) ) ( not ( = ?auto_17202 ?auto_17211 ) ) ( not ( = ?auto_17203 ?auto_17211 ) ) ( not ( = ?auto_17210 ?auto_17212 ) ) ( IS-CRATE ?auto_17202 ) ( not ( = ?auto_17220 ?auto_17206 ) ) ( HOIST-AT ?auto_17218 ?auto_17220 ) ( SURFACE-AT ?auto_17202 ?auto_17220 ) ( ON ?auto_17202 ?auto_17216 ) ( CLEAR ?auto_17202 ) ( not ( = ?auto_17201 ?auto_17202 ) ) ( not ( = ?auto_17201 ?auto_17216 ) ) ( not ( = ?auto_17202 ?auto_17216 ) ) ( not ( = ?auto_17210 ?auto_17218 ) ) ( IS-CRATE ?auto_17201 ) ( AVAILABLE ?auto_17218 ) ( SURFACE-AT ?auto_17201 ?auto_17220 ) ( ON ?auto_17201 ?auto_17217 ) ( CLEAR ?auto_17201 ) ( not ( = ?auto_17200 ?auto_17201 ) ) ( not ( = ?auto_17200 ?auto_17217 ) ) ( not ( = ?auto_17201 ?auto_17217 ) ) ( SURFACE-AT ?auto_17199 ?auto_17206 ) ( CLEAR ?auto_17199 ) ( IS-CRATE ?auto_17200 ) ( AVAILABLE ?auto_17210 ) ( not ( = ?auto_17214 ?auto_17206 ) ) ( HOIST-AT ?auto_17213 ?auto_17214 ) ( AVAILABLE ?auto_17213 ) ( SURFACE-AT ?auto_17200 ?auto_17214 ) ( ON ?auto_17200 ?auto_17215 ) ( CLEAR ?auto_17200 ) ( TRUCK-AT ?auto_17208 ?auto_17206 ) ( not ( = ?auto_17199 ?auto_17200 ) ) ( not ( = ?auto_17199 ?auto_17215 ) ) ( not ( = ?auto_17200 ?auto_17215 ) ) ( not ( = ?auto_17210 ?auto_17213 ) ) ( not ( = ?auto_17199 ?auto_17201 ) ) ( not ( = ?auto_17199 ?auto_17217 ) ) ( not ( = ?auto_17201 ?auto_17215 ) ) ( not ( = ?auto_17220 ?auto_17214 ) ) ( not ( = ?auto_17218 ?auto_17213 ) ) ( not ( = ?auto_17217 ?auto_17215 ) ) ( not ( = ?auto_17199 ?auto_17202 ) ) ( not ( = ?auto_17199 ?auto_17216 ) ) ( not ( = ?auto_17200 ?auto_17202 ) ) ( not ( = ?auto_17200 ?auto_17216 ) ) ( not ( = ?auto_17202 ?auto_17217 ) ) ( not ( = ?auto_17202 ?auto_17215 ) ) ( not ( = ?auto_17216 ?auto_17217 ) ) ( not ( = ?auto_17216 ?auto_17215 ) ) ( not ( = ?auto_17199 ?auto_17203 ) ) ( not ( = ?auto_17199 ?auto_17211 ) ) ( not ( = ?auto_17200 ?auto_17203 ) ) ( not ( = ?auto_17200 ?auto_17211 ) ) ( not ( = ?auto_17201 ?auto_17203 ) ) ( not ( = ?auto_17201 ?auto_17211 ) ) ( not ( = ?auto_17203 ?auto_17216 ) ) ( not ( = ?auto_17203 ?auto_17217 ) ) ( not ( = ?auto_17203 ?auto_17215 ) ) ( not ( = ?auto_17219 ?auto_17220 ) ) ( not ( = ?auto_17219 ?auto_17214 ) ) ( not ( = ?auto_17212 ?auto_17218 ) ) ( not ( = ?auto_17212 ?auto_17213 ) ) ( not ( = ?auto_17211 ?auto_17216 ) ) ( not ( = ?auto_17211 ?auto_17217 ) ) ( not ( = ?auto_17211 ?auto_17215 ) ) ( not ( = ?auto_17199 ?auto_17204 ) ) ( not ( = ?auto_17199 ?auto_17209 ) ) ( not ( = ?auto_17200 ?auto_17204 ) ) ( not ( = ?auto_17200 ?auto_17209 ) ) ( not ( = ?auto_17201 ?auto_17204 ) ) ( not ( = ?auto_17201 ?auto_17209 ) ) ( not ( = ?auto_17202 ?auto_17204 ) ) ( not ( = ?auto_17202 ?auto_17209 ) ) ( not ( = ?auto_17204 ?auto_17211 ) ) ( not ( = ?auto_17204 ?auto_17216 ) ) ( not ( = ?auto_17204 ?auto_17217 ) ) ( not ( = ?auto_17204 ?auto_17215 ) ) ( not ( = ?auto_17205 ?auto_17219 ) ) ( not ( = ?auto_17205 ?auto_17220 ) ) ( not ( = ?auto_17205 ?auto_17214 ) ) ( not ( = ?auto_17207 ?auto_17212 ) ) ( not ( = ?auto_17207 ?auto_17218 ) ) ( not ( = ?auto_17207 ?auto_17213 ) ) ( not ( = ?auto_17209 ?auto_17211 ) ) ( not ( = ?auto_17209 ?auto_17216 ) ) ( not ( = ?auto_17209 ?auto_17217 ) ) ( not ( = ?auto_17209 ?auto_17215 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_17199 ?auto_17200 ?auto_17201 ?auto_17202 ?auto_17203 )
      ( MAKE-1CRATE ?auto_17203 ?auto_17204 )
      ( MAKE-5CRATE-VERIFY ?auto_17199 ?auto_17200 ?auto_17201 ?auto_17202 ?auto_17203 ?auto_17204 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17223 - SURFACE
      ?auto_17224 - SURFACE
    )
    :vars
    (
      ?auto_17225 - HOIST
      ?auto_17226 - PLACE
      ?auto_17228 - PLACE
      ?auto_17229 - HOIST
      ?auto_17230 - SURFACE
      ?auto_17227 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17225 ?auto_17226 ) ( SURFACE-AT ?auto_17223 ?auto_17226 ) ( CLEAR ?auto_17223 ) ( IS-CRATE ?auto_17224 ) ( AVAILABLE ?auto_17225 ) ( not ( = ?auto_17228 ?auto_17226 ) ) ( HOIST-AT ?auto_17229 ?auto_17228 ) ( AVAILABLE ?auto_17229 ) ( SURFACE-AT ?auto_17224 ?auto_17228 ) ( ON ?auto_17224 ?auto_17230 ) ( CLEAR ?auto_17224 ) ( TRUCK-AT ?auto_17227 ?auto_17226 ) ( not ( = ?auto_17223 ?auto_17224 ) ) ( not ( = ?auto_17223 ?auto_17230 ) ) ( not ( = ?auto_17224 ?auto_17230 ) ) ( not ( = ?auto_17225 ?auto_17229 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17227 ?auto_17226 ?auto_17228 )
      ( !LIFT ?auto_17229 ?auto_17224 ?auto_17230 ?auto_17228 )
      ( !LOAD ?auto_17229 ?auto_17224 ?auto_17227 ?auto_17228 )
      ( !DRIVE ?auto_17227 ?auto_17228 ?auto_17226 )
      ( !UNLOAD ?auto_17225 ?auto_17224 ?auto_17227 ?auto_17226 )
      ( !DROP ?auto_17225 ?auto_17224 ?auto_17223 ?auto_17226 )
      ( MAKE-1CRATE-VERIFY ?auto_17223 ?auto_17224 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_17238 - SURFACE
      ?auto_17239 - SURFACE
      ?auto_17240 - SURFACE
      ?auto_17241 - SURFACE
      ?auto_17242 - SURFACE
      ?auto_17244 - SURFACE
      ?auto_17243 - SURFACE
    )
    :vars
    (
      ?auto_17247 - HOIST
      ?auto_17245 - PLACE
      ?auto_17250 - PLACE
      ?auto_17249 - HOIST
      ?auto_17248 - SURFACE
      ?auto_17251 - PLACE
      ?auto_17258 - HOIST
      ?auto_17262 - SURFACE
      ?auto_17261 - PLACE
      ?auto_17263 - HOIST
      ?auto_17252 - SURFACE
      ?auto_17253 - PLACE
      ?auto_17254 - HOIST
      ?auto_17256 - SURFACE
      ?auto_17255 - SURFACE
      ?auto_17260 - PLACE
      ?auto_17259 - HOIST
      ?auto_17257 - SURFACE
      ?auto_17246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17247 ?auto_17245 ) ( IS-CRATE ?auto_17243 ) ( not ( = ?auto_17250 ?auto_17245 ) ) ( HOIST-AT ?auto_17249 ?auto_17250 ) ( AVAILABLE ?auto_17249 ) ( SURFACE-AT ?auto_17243 ?auto_17250 ) ( ON ?auto_17243 ?auto_17248 ) ( CLEAR ?auto_17243 ) ( not ( = ?auto_17244 ?auto_17243 ) ) ( not ( = ?auto_17244 ?auto_17248 ) ) ( not ( = ?auto_17243 ?auto_17248 ) ) ( not ( = ?auto_17247 ?auto_17249 ) ) ( IS-CRATE ?auto_17244 ) ( not ( = ?auto_17251 ?auto_17245 ) ) ( HOIST-AT ?auto_17258 ?auto_17251 ) ( AVAILABLE ?auto_17258 ) ( SURFACE-AT ?auto_17244 ?auto_17251 ) ( ON ?auto_17244 ?auto_17262 ) ( CLEAR ?auto_17244 ) ( not ( = ?auto_17242 ?auto_17244 ) ) ( not ( = ?auto_17242 ?auto_17262 ) ) ( not ( = ?auto_17244 ?auto_17262 ) ) ( not ( = ?auto_17247 ?auto_17258 ) ) ( IS-CRATE ?auto_17242 ) ( not ( = ?auto_17261 ?auto_17245 ) ) ( HOIST-AT ?auto_17263 ?auto_17261 ) ( AVAILABLE ?auto_17263 ) ( SURFACE-AT ?auto_17242 ?auto_17261 ) ( ON ?auto_17242 ?auto_17252 ) ( CLEAR ?auto_17242 ) ( not ( = ?auto_17241 ?auto_17242 ) ) ( not ( = ?auto_17241 ?auto_17252 ) ) ( not ( = ?auto_17242 ?auto_17252 ) ) ( not ( = ?auto_17247 ?auto_17263 ) ) ( IS-CRATE ?auto_17241 ) ( not ( = ?auto_17253 ?auto_17245 ) ) ( HOIST-AT ?auto_17254 ?auto_17253 ) ( SURFACE-AT ?auto_17241 ?auto_17253 ) ( ON ?auto_17241 ?auto_17256 ) ( CLEAR ?auto_17241 ) ( not ( = ?auto_17240 ?auto_17241 ) ) ( not ( = ?auto_17240 ?auto_17256 ) ) ( not ( = ?auto_17241 ?auto_17256 ) ) ( not ( = ?auto_17247 ?auto_17254 ) ) ( IS-CRATE ?auto_17240 ) ( AVAILABLE ?auto_17254 ) ( SURFACE-AT ?auto_17240 ?auto_17253 ) ( ON ?auto_17240 ?auto_17255 ) ( CLEAR ?auto_17240 ) ( not ( = ?auto_17239 ?auto_17240 ) ) ( not ( = ?auto_17239 ?auto_17255 ) ) ( not ( = ?auto_17240 ?auto_17255 ) ) ( SURFACE-AT ?auto_17238 ?auto_17245 ) ( CLEAR ?auto_17238 ) ( IS-CRATE ?auto_17239 ) ( AVAILABLE ?auto_17247 ) ( not ( = ?auto_17260 ?auto_17245 ) ) ( HOIST-AT ?auto_17259 ?auto_17260 ) ( AVAILABLE ?auto_17259 ) ( SURFACE-AT ?auto_17239 ?auto_17260 ) ( ON ?auto_17239 ?auto_17257 ) ( CLEAR ?auto_17239 ) ( TRUCK-AT ?auto_17246 ?auto_17245 ) ( not ( = ?auto_17238 ?auto_17239 ) ) ( not ( = ?auto_17238 ?auto_17257 ) ) ( not ( = ?auto_17239 ?auto_17257 ) ) ( not ( = ?auto_17247 ?auto_17259 ) ) ( not ( = ?auto_17238 ?auto_17240 ) ) ( not ( = ?auto_17238 ?auto_17255 ) ) ( not ( = ?auto_17240 ?auto_17257 ) ) ( not ( = ?auto_17253 ?auto_17260 ) ) ( not ( = ?auto_17254 ?auto_17259 ) ) ( not ( = ?auto_17255 ?auto_17257 ) ) ( not ( = ?auto_17238 ?auto_17241 ) ) ( not ( = ?auto_17238 ?auto_17256 ) ) ( not ( = ?auto_17239 ?auto_17241 ) ) ( not ( = ?auto_17239 ?auto_17256 ) ) ( not ( = ?auto_17241 ?auto_17255 ) ) ( not ( = ?auto_17241 ?auto_17257 ) ) ( not ( = ?auto_17256 ?auto_17255 ) ) ( not ( = ?auto_17256 ?auto_17257 ) ) ( not ( = ?auto_17238 ?auto_17242 ) ) ( not ( = ?auto_17238 ?auto_17252 ) ) ( not ( = ?auto_17239 ?auto_17242 ) ) ( not ( = ?auto_17239 ?auto_17252 ) ) ( not ( = ?auto_17240 ?auto_17242 ) ) ( not ( = ?auto_17240 ?auto_17252 ) ) ( not ( = ?auto_17242 ?auto_17256 ) ) ( not ( = ?auto_17242 ?auto_17255 ) ) ( not ( = ?auto_17242 ?auto_17257 ) ) ( not ( = ?auto_17261 ?auto_17253 ) ) ( not ( = ?auto_17261 ?auto_17260 ) ) ( not ( = ?auto_17263 ?auto_17254 ) ) ( not ( = ?auto_17263 ?auto_17259 ) ) ( not ( = ?auto_17252 ?auto_17256 ) ) ( not ( = ?auto_17252 ?auto_17255 ) ) ( not ( = ?auto_17252 ?auto_17257 ) ) ( not ( = ?auto_17238 ?auto_17244 ) ) ( not ( = ?auto_17238 ?auto_17262 ) ) ( not ( = ?auto_17239 ?auto_17244 ) ) ( not ( = ?auto_17239 ?auto_17262 ) ) ( not ( = ?auto_17240 ?auto_17244 ) ) ( not ( = ?auto_17240 ?auto_17262 ) ) ( not ( = ?auto_17241 ?auto_17244 ) ) ( not ( = ?auto_17241 ?auto_17262 ) ) ( not ( = ?auto_17244 ?auto_17252 ) ) ( not ( = ?auto_17244 ?auto_17256 ) ) ( not ( = ?auto_17244 ?auto_17255 ) ) ( not ( = ?auto_17244 ?auto_17257 ) ) ( not ( = ?auto_17251 ?auto_17261 ) ) ( not ( = ?auto_17251 ?auto_17253 ) ) ( not ( = ?auto_17251 ?auto_17260 ) ) ( not ( = ?auto_17258 ?auto_17263 ) ) ( not ( = ?auto_17258 ?auto_17254 ) ) ( not ( = ?auto_17258 ?auto_17259 ) ) ( not ( = ?auto_17262 ?auto_17252 ) ) ( not ( = ?auto_17262 ?auto_17256 ) ) ( not ( = ?auto_17262 ?auto_17255 ) ) ( not ( = ?auto_17262 ?auto_17257 ) ) ( not ( = ?auto_17238 ?auto_17243 ) ) ( not ( = ?auto_17238 ?auto_17248 ) ) ( not ( = ?auto_17239 ?auto_17243 ) ) ( not ( = ?auto_17239 ?auto_17248 ) ) ( not ( = ?auto_17240 ?auto_17243 ) ) ( not ( = ?auto_17240 ?auto_17248 ) ) ( not ( = ?auto_17241 ?auto_17243 ) ) ( not ( = ?auto_17241 ?auto_17248 ) ) ( not ( = ?auto_17242 ?auto_17243 ) ) ( not ( = ?auto_17242 ?auto_17248 ) ) ( not ( = ?auto_17243 ?auto_17262 ) ) ( not ( = ?auto_17243 ?auto_17252 ) ) ( not ( = ?auto_17243 ?auto_17256 ) ) ( not ( = ?auto_17243 ?auto_17255 ) ) ( not ( = ?auto_17243 ?auto_17257 ) ) ( not ( = ?auto_17250 ?auto_17251 ) ) ( not ( = ?auto_17250 ?auto_17261 ) ) ( not ( = ?auto_17250 ?auto_17253 ) ) ( not ( = ?auto_17250 ?auto_17260 ) ) ( not ( = ?auto_17249 ?auto_17258 ) ) ( not ( = ?auto_17249 ?auto_17263 ) ) ( not ( = ?auto_17249 ?auto_17254 ) ) ( not ( = ?auto_17249 ?auto_17259 ) ) ( not ( = ?auto_17248 ?auto_17262 ) ) ( not ( = ?auto_17248 ?auto_17252 ) ) ( not ( = ?auto_17248 ?auto_17256 ) ) ( not ( = ?auto_17248 ?auto_17255 ) ) ( not ( = ?auto_17248 ?auto_17257 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_17238 ?auto_17239 ?auto_17240 ?auto_17241 ?auto_17242 ?auto_17244 )
      ( MAKE-1CRATE ?auto_17244 ?auto_17243 )
      ( MAKE-6CRATE-VERIFY ?auto_17238 ?auto_17239 ?auto_17240 ?auto_17241 ?auto_17242 ?auto_17244 ?auto_17243 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17266 - SURFACE
      ?auto_17267 - SURFACE
    )
    :vars
    (
      ?auto_17268 - HOIST
      ?auto_17269 - PLACE
      ?auto_17271 - PLACE
      ?auto_17272 - HOIST
      ?auto_17273 - SURFACE
      ?auto_17270 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17268 ?auto_17269 ) ( SURFACE-AT ?auto_17266 ?auto_17269 ) ( CLEAR ?auto_17266 ) ( IS-CRATE ?auto_17267 ) ( AVAILABLE ?auto_17268 ) ( not ( = ?auto_17271 ?auto_17269 ) ) ( HOIST-AT ?auto_17272 ?auto_17271 ) ( AVAILABLE ?auto_17272 ) ( SURFACE-AT ?auto_17267 ?auto_17271 ) ( ON ?auto_17267 ?auto_17273 ) ( CLEAR ?auto_17267 ) ( TRUCK-AT ?auto_17270 ?auto_17269 ) ( not ( = ?auto_17266 ?auto_17267 ) ) ( not ( = ?auto_17266 ?auto_17273 ) ) ( not ( = ?auto_17267 ?auto_17273 ) ) ( not ( = ?auto_17268 ?auto_17272 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17270 ?auto_17269 ?auto_17271 )
      ( !LIFT ?auto_17272 ?auto_17267 ?auto_17273 ?auto_17271 )
      ( !LOAD ?auto_17272 ?auto_17267 ?auto_17270 ?auto_17271 )
      ( !DRIVE ?auto_17270 ?auto_17271 ?auto_17269 )
      ( !UNLOAD ?auto_17268 ?auto_17267 ?auto_17270 ?auto_17269 )
      ( !DROP ?auto_17268 ?auto_17267 ?auto_17266 ?auto_17269 )
      ( MAKE-1CRATE-VERIFY ?auto_17266 ?auto_17267 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_17282 - SURFACE
      ?auto_17283 - SURFACE
      ?auto_17284 - SURFACE
      ?auto_17285 - SURFACE
      ?auto_17286 - SURFACE
      ?auto_17288 - SURFACE
      ?auto_17287 - SURFACE
      ?auto_17289 - SURFACE
    )
    :vars
    (
      ?auto_17291 - HOIST
      ?auto_17293 - PLACE
      ?auto_17294 - PLACE
      ?auto_17295 - HOIST
      ?auto_17292 - SURFACE
      ?auto_17299 - PLACE
      ?auto_17298 - HOIST
      ?auto_17311 - SURFACE
      ?auto_17303 - PLACE
      ?auto_17309 - HOIST
      ?auto_17307 - SURFACE
      ?auto_17305 - PLACE
      ?auto_17308 - HOIST
      ?auto_17300 - SURFACE
      ?auto_17301 - PLACE
      ?auto_17302 - HOIST
      ?auto_17296 - SURFACE
      ?auto_17297 - SURFACE
      ?auto_17306 - PLACE
      ?auto_17304 - HOIST
      ?auto_17310 - SURFACE
      ?auto_17290 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17291 ?auto_17293 ) ( IS-CRATE ?auto_17289 ) ( not ( = ?auto_17294 ?auto_17293 ) ) ( HOIST-AT ?auto_17295 ?auto_17294 ) ( AVAILABLE ?auto_17295 ) ( SURFACE-AT ?auto_17289 ?auto_17294 ) ( ON ?auto_17289 ?auto_17292 ) ( CLEAR ?auto_17289 ) ( not ( = ?auto_17287 ?auto_17289 ) ) ( not ( = ?auto_17287 ?auto_17292 ) ) ( not ( = ?auto_17289 ?auto_17292 ) ) ( not ( = ?auto_17291 ?auto_17295 ) ) ( IS-CRATE ?auto_17287 ) ( not ( = ?auto_17299 ?auto_17293 ) ) ( HOIST-AT ?auto_17298 ?auto_17299 ) ( AVAILABLE ?auto_17298 ) ( SURFACE-AT ?auto_17287 ?auto_17299 ) ( ON ?auto_17287 ?auto_17311 ) ( CLEAR ?auto_17287 ) ( not ( = ?auto_17288 ?auto_17287 ) ) ( not ( = ?auto_17288 ?auto_17311 ) ) ( not ( = ?auto_17287 ?auto_17311 ) ) ( not ( = ?auto_17291 ?auto_17298 ) ) ( IS-CRATE ?auto_17288 ) ( not ( = ?auto_17303 ?auto_17293 ) ) ( HOIST-AT ?auto_17309 ?auto_17303 ) ( AVAILABLE ?auto_17309 ) ( SURFACE-AT ?auto_17288 ?auto_17303 ) ( ON ?auto_17288 ?auto_17307 ) ( CLEAR ?auto_17288 ) ( not ( = ?auto_17286 ?auto_17288 ) ) ( not ( = ?auto_17286 ?auto_17307 ) ) ( not ( = ?auto_17288 ?auto_17307 ) ) ( not ( = ?auto_17291 ?auto_17309 ) ) ( IS-CRATE ?auto_17286 ) ( not ( = ?auto_17305 ?auto_17293 ) ) ( HOIST-AT ?auto_17308 ?auto_17305 ) ( AVAILABLE ?auto_17308 ) ( SURFACE-AT ?auto_17286 ?auto_17305 ) ( ON ?auto_17286 ?auto_17300 ) ( CLEAR ?auto_17286 ) ( not ( = ?auto_17285 ?auto_17286 ) ) ( not ( = ?auto_17285 ?auto_17300 ) ) ( not ( = ?auto_17286 ?auto_17300 ) ) ( not ( = ?auto_17291 ?auto_17308 ) ) ( IS-CRATE ?auto_17285 ) ( not ( = ?auto_17301 ?auto_17293 ) ) ( HOIST-AT ?auto_17302 ?auto_17301 ) ( SURFACE-AT ?auto_17285 ?auto_17301 ) ( ON ?auto_17285 ?auto_17296 ) ( CLEAR ?auto_17285 ) ( not ( = ?auto_17284 ?auto_17285 ) ) ( not ( = ?auto_17284 ?auto_17296 ) ) ( not ( = ?auto_17285 ?auto_17296 ) ) ( not ( = ?auto_17291 ?auto_17302 ) ) ( IS-CRATE ?auto_17284 ) ( AVAILABLE ?auto_17302 ) ( SURFACE-AT ?auto_17284 ?auto_17301 ) ( ON ?auto_17284 ?auto_17297 ) ( CLEAR ?auto_17284 ) ( not ( = ?auto_17283 ?auto_17284 ) ) ( not ( = ?auto_17283 ?auto_17297 ) ) ( not ( = ?auto_17284 ?auto_17297 ) ) ( SURFACE-AT ?auto_17282 ?auto_17293 ) ( CLEAR ?auto_17282 ) ( IS-CRATE ?auto_17283 ) ( AVAILABLE ?auto_17291 ) ( not ( = ?auto_17306 ?auto_17293 ) ) ( HOIST-AT ?auto_17304 ?auto_17306 ) ( AVAILABLE ?auto_17304 ) ( SURFACE-AT ?auto_17283 ?auto_17306 ) ( ON ?auto_17283 ?auto_17310 ) ( CLEAR ?auto_17283 ) ( TRUCK-AT ?auto_17290 ?auto_17293 ) ( not ( = ?auto_17282 ?auto_17283 ) ) ( not ( = ?auto_17282 ?auto_17310 ) ) ( not ( = ?auto_17283 ?auto_17310 ) ) ( not ( = ?auto_17291 ?auto_17304 ) ) ( not ( = ?auto_17282 ?auto_17284 ) ) ( not ( = ?auto_17282 ?auto_17297 ) ) ( not ( = ?auto_17284 ?auto_17310 ) ) ( not ( = ?auto_17301 ?auto_17306 ) ) ( not ( = ?auto_17302 ?auto_17304 ) ) ( not ( = ?auto_17297 ?auto_17310 ) ) ( not ( = ?auto_17282 ?auto_17285 ) ) ( not ( = ?auto_17282 ?auto_17296 ) ) ( not ( = ?auto_17283 ?auto_17285 ) ) ( not ( = ?auto_17283 ?auto_17296 ) ) ( not ( = ?auto_17285 ?auto_17297 ) ) ( not ( = ?auto_17285 ?auto_17310 ) ) ( not ( = ?auto_17296 ?auto_17297 ) ) ( not ( = ?auto_17296 ?auto_17310 ) ) ( not ( = ?auto_17282 ?auto_17286 ) ) ( not ( = ?auto_17282 ?auto_17300 ) ) ( not ( = ?auto_17283 ?auto_17286 ) ) ( not ( = ?auto_17283 ?auto_17300 ) ) ( not ( = ?auto_17284 ?auto_17286 ) ) ( not ( = ?auto_17284 ?auto_17300 ) ) ( not ( = ?auto_17286 ?auto_17296 ) ) ( not ( = ?auto_17286 ?auto_17297 ) ) ( not ( = ?auto_17286 ?auto_17310 ) ) ( not ( = ?auto_17305 ?auto_17301 ) ) ( not ( = ?auto_17305 ?auto_17306 ) ) ( not ( = ?auto_17308 ?auto_17302 ) ) ( not ( = ?auto_17308 ?auto_17304 ) ) ( not ( = ?auto_17300 ?auto_17296 ) ) ( not ( = ?auto_17300 ?auto_17297 ) ) ( not ( = ?auto_17300 ?auto_17310 ) ) ( not ( = ?auto_17282 ?auto_17288 ) ) ( not ( = ?auto_17282 ?auto_17307 ) ) ( not ( = ?auto_17283 ?auto_17288 ) ) ( not ( = ?auto_17283 ?auto_17307 ) ) ( not ( = ?auto_17284 ?auto_17288 ) ) ( not ( = ?auto_17284 ?auto_17307 ) ) ( not ( = ?auto_17285 ?auto_17288 ) ) ( not ( = ?auto_17285 ?auto_17307 ) ) ( not ( = ?auto_17288 ?auto_17300 ) ) ( not ( = ?auto_17288 ?auto_17296 ) ) ( not ( = ?auto_17288 ?auto_17297 ) ) ( not ( = ?auto_17288 ?auto_17310 ) ) ( not ( = ?auto_17303 ?auto_17305 ) ) ( not ( = ?auto_17303 ?auto_17301 ) ) ( not ( = ?auto_17303 ?auto_17306 ) ) ( not ( = ?auto_17309 ?auto_17308 ) ) ( not ( = ?auto_17309 ?auto_17302 ) ) ( not ( = ?auto_17309 ?auto_17304 ) ) ( not ( = ?auto_17307 ?auto_17300 ) ) ( not ( = ?auto_17307 ?auto_17296 ) ) ( not ( = ?auto_17307 ?auto_17297 ) ) ( not ( = ?auto_17307 ?auto_17310 ) ) ( not ( = ?auto_17282 ?auto_17287 ) ) ( not ( = ?auto_17282 ?auto_17311 ) ) ( not ( = ?auto_17283 ?auto_17287 ) ) ( not ( = ?auto_17283 ?auto_17311 ) ) ( not ( = ?auto_17284 ?auto_17287 ) ) ( not ( = ?auto_17284 ?auto_17311 ) ) ( not ( = ?auto_17285 ?auto_17287 ) ) ( not ( = ?auto_17285 ?auto_17311 ) ) ( not ( = ?auto_17286 ?auto_17287 ) ) ( not ( = ?auto_17286 ?auto_17311 ) ) ( not ( = ?auto_17287 ?auto_17307 ) ) ( not ( = ?auto_17287 ?auto_17300 ) ) ( not ( = ?auto_17287 ?auto_17296 ) ) ( not ( = ?auto_17287 ?auto_17297 ) ) ( not ( = ?auto_17287 ?auto_17310 ) ) ( not ( = ?auto_17299 ?auto_17303 ) ) ( not ( = ?auto_17299 ?auto_17305 ) ) ( not ( = ?auto_17299 ?auto_17301 ) ) ( not ( = ?auto_17299 ?auto_17306 ) ) ( not ( = ?auto_17298 ?auto_17309 ) ) ( not ( = ?auto_17298 ?auto_17308 ) ) ( not ( = ?auto_17298 ?auto_17302 ) ) ( not ( = ?auto_17298 ?auto_17304 ) ) ( not ( = ?auto_17311 ?auto_17307 ) ) ( not ( = ?auto_17311 ?auto_17300 ) ) ( not ( = ?auto_17311 ?auto_17296 ) ) ( not ( = ?auto_17311 ?auto_17297 ) ) ( not ( = ?auto_17311 ?auto_17310 ) ) ( not ( = ?auto_17282 ?auto_17289 ) ) ( not ( = ?auto_17282 ?auto_17292 ) ) ( not ( = ?auto_17283 ?auto_17289 ) ) ( not ( = ?auto_17283 ?auto_17292 ) ) ( not ( = ?auto_17284 ?auto_17289 ) ) ( not ( = ?auto_17284 ?auto_17292 ) ) ( not ( = ?auto_17285 ?auto_17289 ) ) ( not ( = ?auto_17285 ?auto_17292 ) ) ( not ( = ?auto_17286 ?auto_17289 ) ) ( not ( = ?auto_17286 ?auto_17292 ) ) ( not ( = ?auto_17288 ?auto_17289 ) ) ( not ( = ?auto_17288 ?auto_17292 ) ) ( not ( = ?auto_17289 ?auto_17311 ) ) ( not ( = ?auto_17289 ?auto_17307 ) ) ( not ( = ?auto_17289 ?auto_17300 ) ) ( not ( = ?auto_17289 ?auto_17296 ) ) ( not ( = ?auto_17289 ?auto_17297 ) ) ( not ( = ?auto_17289 ?auto_17310 ) ) ( not ( = ?auto_17294 ?auto_17299 ) ) ( not ( = ?auto_17294 ?auto_17303 ) ) ( not ( = ?auto_17294 ?auto_17305 ) ) ( not ( = ?auto_17294 ?auto_17301 ) ) ( not ( = ?auto_17294 ?auto_17306 ) ) ( not ( = ?auto_17295 ?auto_17298 ) ) ( not ( = ?auto_17295 ?auto_17309 ) ) ( not ( = ?auto_17295 ?auto_17308 ) ) ( not ( = ?auto_17295 ?auto_17302 ) ) ( not ( = ?auto_17295 ?auto_17304 ) ) ( not ( = ?auto_17292 ?auto_17311 ) ) ( not ( = ?auto_17292 ?auto_17307 ) ) ( not ( = ?auto_17292 ?auto_17300 ) ) ( not ( = ?auto_17292 ?auto_17296 ) ) ( not ( = ?auto_17292 ?auto_17297 ) ) ( not ( = ?auto_17292 ?auto_17310 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_17282 ?auto_17283 ?auto_17284 ?auto_17285 ?auto_17286 ?auto_17288 ?auto_17287 )
      ( MAKE-1CRATE ?auto_17287 ?auto_17289 )
      ( MAKE-7CRATE-VERIFY ?auto_17282 ?auto_17283 ?auto_17284 ?auto_17285 ?auto_17286 ?auto_17288 ?auto_17287 ?auto_17289 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17314 - SURFACE
      ?auto_17315 - SURFACE
    )
    :vars
    (
      ?auto_17316 - HOIST
      ?auto_17317 - PLACE
      ?auto_17319 - PLACE
      ?auto_17320 - HOIST
      ?auto_17321 - SURFACE
      ?auto_17318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17316 ?auto_17317 ) ( SURFACE-AT ?auto_17314 ?auto_17317 ) ( CLEAR ?auto_17314 ) ( IS-CRATE ?auto_17315 ) ( AVAILABLE ?auto_17316 ) ( not ( = ?auto_17319 ?auto_17317 ) ) ( HOIST-AT ?auto_17320 ?auto_17319 ) ( AVAILABLE ?auto_17320 ) ( SURFACE-AT ?auto_17315 ?auto_17319 ) ( ON ?auto_17315 ?auto_17321 ) ( CLEAR ?auto_17315 ) ( TRUCK-AT ?auto_17318 ?auto_17317 ) ( not ( = ?auto_17314 ?auto_17315 ) ) ( not ( = ?auto_17314 ?auto_17321 ) ) ( not ( = ?auto_17315 ?auto_17321 ) ) ( not ( = ?auto_17316 ?auto_17320 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17318 ?auto_17317 ?auto_17319 )
      ( !LIFT ?auto_17320 ?auto_17315 ?auto_17321 ?auto_17319 )
      ( !LOAD ?auto_17320 ?auto_17315 ?auto_17318 ?auto_17319 )
      ( !DRIVE ?auto_17318 ?auto_17319 ?auto_17317 )
      ( !UNLOAD ?auto_17316 ?auto_17315 ?auto_17318 ?auto_17317 )
      ( !DROP ?auto_17316 ?auto_17315 ?auto_17314 ?auto_17317 )
      ( MAKE-1CRATE-VERIFY ?auto_17314 ?auto_17315 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_17331 - SURFACE
      ?auto_17332 - SURFACE
      ?auto_17333 - SURFACE
      ?auto_17334 - SURFACE
      ?auto_17335 - SURFACE
      ?auto_17337 - SURFACE
      ?auto_17336 - SURFACE
      ?auto_17339 - SURFACE
      ?auto_17338 - SURFACE
    )
    :vars
    (
      ?auto_17341 - HOIST
      ?auto_17340 - PLACE
      ?auto_17342 - PLACE
      ?auto_17343 - HOIST
      ?auto_17344 - SURFACE
      ?auto_17353 - SURFACE
      ?auto_17350 - PLACE
      ?auto_17348 - HOIST
      ?auto_17351 - SURFACE
      ?auto_17359 - PLACE
      ?auto_17358 - HOIST
      ?auto_17355 - SURFACE
      ?auto_17352 - PLACE
      ?auto_17356 - HOIST
      ?auto_17362 - SURFACE
      ?auto_17361 - PLACE
      ?auto_17360 - HOIST
      ?auto_17357 - SURFACE
      ?auto_17349 - SURFACE
      ?auto_17354 - PLACE
      ?auto_17346 - HOIST
      ?auto_17347 - SURFACE
      ?auto_17345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17341 ?auto_17340 ) ( IS-CRATE ?auto_17338 ) ( not ( = ?auto_17342 ?auto_17340 ) ) ( HOIST-AT ?auto_17343 ?auto_17342 ) ( SURFACE-AT ?auto_17338 ?auto_17342 ) ( ON ?auto_17338 ?auto_17344 ) ( CLEAR ?auto_17338 ) ( not ( = ?auto_17339 ?auto_17338 ) ) ( not ( = ?auto_17339 ?auto_17344 ) ) ( not ( = ?auto_17338 ?auto_17344 ) ) ( not ( = ?auto_17341 ?auto_17343 ) ) ( IS-CRATE ?auto_17339 ) ( AVAILABLE ?auto_17343 ) ( SURFACE-AT ?auto_17339 ?auto_17342 ) ( ON ?auto_17339 ?auto_17353 ) ( CLEAR ?auto_17339 ) ( not ( = ?auto_17336 ?auto_17339 ) ) ( not ( = ?auto_17336 ?auto_17353 ) ) ( not ( = ?auto_17339 ?auto_17353 ) ) ( IS-CRATE ?auto_17336 ) ( not ( = ?auto_17350 ?auto_17340 ) ) ( HOIST-AT ?auto_17348 ?auto_17350 ) ( AVAILABLE ?auto_17348 ) ( SURFACE-AT ?auto_17336 ?auto_17350 ) ( ON ?auto_17336 ?auto_17351 ) ( CLEAR ?auto_17336 ) ( not ( = ?auto_17337 ?auto_17336 ) ) ( not ( = ?auto_17337 ?auto_17351 ) ) ( not ( = ?auto_17336 ?auto_17351 ) ) ( not ( = ?auto_17341 ?auto_17348 ) ) ( IS-CRATE ?auto_17337 ) ( not ( = ?auto_17359 ?auto_17340 ) ) ( HOIST-AT ?auto_17358 ?auto_17359 ) ( AVAILABLE ?auto_17358 ) ( SURFACE-AT ?auto_17337 ?auto_17359 ) ( ON ?auto_17337 ?auto_17355 ) ( CLEAR ?auto_17337 ) ( not ( = ?auto_17335 ?auto_17337 ) ) ( not ( = ?auto_17335 ?auto_17355 ) ) ( not ( = ?auto_17337 ?auto_17355 ) ) ( not ( = ?auto_17341 ?auto_17358 ) ) ( IS-CRATE ?auto_17335 ) ( not ( = ?auto_17352 ?auto_17340 ) ) ( HOIST-AT ?auto_17356 ?auto_17352 ) ( AVAILABLE ?auto_17356 ) ( SURFACE-AT ?auto_17335 ?auto_17352 ) ( ON ?auto_17335 ?auto_17362 ) ( CLEAR ?auto_17335 ) ( not ( = ?auto_17334 ?auto_17335 ) ) ( not ( = ?auto_17334 ?auto_17362 ) ) ( not ( = ?auto_17335 ?auto_17362 ) ) ( not ( = ?auto_17341 ?auto_17356 ) ) ( IS-CRATE ?auto_17334 ) ( not ( = ?auto_17361 ?auto_17340 ) ) ( HOIST-AT ?auto_17360 ?auto_17361 ) ( SURFACE-AT ?auto_17334 ?auto_17361 ) ( ON ?auto_17334 ?auto_17357 ) ( CLEAR ?auto_17334 ) ( not ( = ?auto_17333 ?auto_17334 ) ) ( not ( = ?auto_17333 ?auto_17357 ) ) ( not ( = ?auto_17334 ?auto_17357 ) ) ( not ( = ?auto_17341 ?auto_17360 ) ) ( IS-CRATE ?auto_17333 ) ( AVAILABLE ?auto_17360 ) ( SURFACE-AT ?auto_17333 ?auto_17361 ) ( ON ?auto_17333 ?auto_17349 ) ( CLEAR ?auto_17333 ) ( not ( = ?auto_17332 ?auto_17333 ) ) ( not ( = ?auto_17332 ?auto_17349 ) ) ( not ( = ?auto_17333 ?auto_17349 ) ) ( SURFACE-AT ?auto_17331 ?auto_17340 ) ( CLEAR ?auto_17331 ) ( IS-CRATE ?auto_17332 ) ( AVAILABLE ?auto_17341 ) ( not ( = ?auto_17354 ?auto_17340 ) ) ( HOIST-AT ?auto_17346 ?auto_17354 ) ( AVAILABLE ?auto_17346 ) ( SURFACE-AT ?auto_17332 ?auto_17354 ) ( ON ?auto_17332 ?auto_17347 ) ( CLEAR ?auto_17332 ) ( TRUCK-AT ?auto_17345 ?auto_17340 ) ( not ( = ?auto_17331 ?auto_17332 ) ) ( not ( = ?auto_17331 ?auto_17347 ) ) ( not ( = ?auto_17332 ?auto_17347 ) ) ( not ( = ?auto_17341 ?auto_17346 ) ) ( not ( = ?auto_17331 ?auto_17333 ) ) ( not ( = ?auto_17331 ?auto_17349 ) ) ( not ( = ?auto_17333 ?auto_17347 ) ) ( not ( = ?auto_17361 ?auto_17354 ) ) ( not ( = ?auto_17360 ?auto_17346 ) ) ( not ( = ?auto_17349 ?auto_17347 ) ) ( not ( = ?auto_17331 ?auto_17334 ) ) ( not ( = ?auto_17331 ?auto_17357 ) ) ( not ( = ?auto_17332 ?auto_17334 ) ) ( not ( = ?auto_17332 ?auto_17357 ) ) ( not ( = ?auto_17334 ?auto_17349 ) ) ( not ( = ?auto_17334 ?auto_17347 ) ) ( not ( = ?auto_17357 ?auto_17349 ) ) ( not ( = ?auto_17357 ?auto_17347 ) ) ( not ( = ?auto_17331 ?auto_17335 ) ) ( not ( = ?auto_17331 ?auto_17362 ) ) ( not ( = ?auto_17332 ?auto_17335 ) ) ( not ( = ?auto_17332 ?auto_17362 ) ) ( not ( = ?auto_17333 ?auto_17335 ) ) ( not ( = ?auto_17333 ?auto_17362 ) ) ( not ( = ?auto_17335 ?auto_17357 ) ) ( not ( = ?auto_17335 ?auto_17349 ) ) ( not ( = ?auto_17335 ?auto_17347 ) ) ( not ( = ?auto_17352 ?auto_17361 ) ) ( not ( = ?auto_17352 ?auto_17354 ) ) ( not ( = ?auto_17356 ?auto_17360 ) ) ( not ( = ?auto_17356 ?auto_17346 ) ) ( not ( = ?auto_17362 ?auto_17357 ) ) ( not ( = ?auto_17362 ?auto_17349 ) ) ( not ( = ?auto_17362 ?auto_17347 ) ) ( not ( = ?auto_17331 ?auto_17337 ) ) ( not ( = ?auto_17331 ?auto_17355 ) ) ( not ( = ?auto_17332 ?auto_17337 ) ) ( not ( = ?auto_17332 ?auto_17355 ) ) ( not ( = ?auto_17333 ?auto_17337 ) ) ( not ( = ?auto_17333 ?auto_17355 ) ) ( not ( = ?auto_17334 ?auto_17337 ) ) ( not ( = ?auto_17334 ?auto_17355 ) ) ( not ( = ?auto_17337 ?auto_17362 ) ) ( not ( = ?auto_17337 ?auto_17357 ) ) ( not ( = ?auto_17337 ?auto_17349 ) ) ( not ( = ?auto_17337 ?auto_17347 ) ) ( not ( = ?auto_17359 ?auto_17352 ) ) ( not ( = ?auto_17359 ?auto_17361 ) ) ( not ( = ?auto_17359 ?auto_17354 ) ) ( not ( = ?auto_17358 ?auto_17356 ) ) ( not ( = ?auto_17358 ?auto_17360 ) ) ( not ( = ?auto_17358 ?auto_17346 ) ) ( not ( = ?auto_17355 ?auto_17362 ) ) ( not ( = ?auto_17355 ?auto_17357 ) ) ( not ( = ?auto_17355 ?auto_17349 ) ) ( not ( = ?auto_17355 ?auto_17347 ) ) ( not ( = ?auto_17331 ?auto_17336 ) ) ( not ( = ?auto_17331 ?auto_17351 ) ) ( not ( = ?auto_17332 ?auto_17336 ) ) ( not ( = ?auto_17332 ?auto_17351 ) ) ( not ( = ?auto_17333 ?auto_17336 ) ) ( not ( = ?auto_17333 ?auto_17351 ) ) ( not ( = ?auto_17334 ?auto_17336 ) ) ( not ( = ?auto_17334 ?auto_17351 ) ) ( not ( = ?auto_17335 ?auto_17336 ) ) ( not ( = ?auto_17335 ?auto_17351 ) ) ( not ( = ?auto_17336 ?auto_17355 ) ) ( not ( = ?auto_17336 ?auto_17362 ) ) ( not ( = ?auto_17336 ?auto_17357 ) ) ( not ( = ?auto_17336 ?auto_17349 ) ) ( not ( = ?auto_17336 ?auto_17347 ) ) ( not ( = ?auto_17350 ?auto_17359 ) ) ( not ( = ?auto_17350 ?auto_17352 ) ) ( not ( = ?auto_17350 ?auto_17361 ) ) ( not ( = ?auto_17350 ?auto_17354 ) ) ( not ( = ?auto_17348 ?auto_17358 ) ) ( not ( = ?auto_17348 ?auto_17356 ) ) ( not ( = ?auto_17348 ?auto_17360 ) ) ( not ( = ?auto_17348 ?auto_17346 ) ) ( not ( = ?auto_17351 ?auto_17355 ) ) ( not ( = ?auto_17351 ?auto_17362 ) ) ( not ( = ?auto_17351 ?auto_17357 ) ) ( not ( = ?auto_17351 ?auto_17349 ) ) ( not ( = ?auto_17351 ?auto_17347 ) ) ( not ( = ?auto_17331 ?auto_17339 ) ) ( not ( = ?auto_17331 ?auto_17353 ) ) ( not ( = ?auto_17332 ?auto_17339 ) ) ( not ( = ?auto_17332 ?auto_17353 ) ) ( not ( = ?auto_17333 ?auto_17339 ) ) ( not ( = ?auto_17333 ?auto_17353 ) ) ( not ( = ?auto_17334 ?auto_17339 ) ) ( not ( = ?auto_17334 ?auto_17353 ) ) ( not ( = ?auto_17335 ?auto_17339 ) ) ( not ( = ?auto_17335 ?auto_17353 ) ) ( not ( = ?auto_17337 ?auto_17339 ) ) ( not ( = ?auto_17337 ?auto_17353 ) ) ( not ( = ?auto_17339 ?auto_17351 ) ) ( not ( = ?auto_17339 ?auto_17355 ) ) ( not ( = ?auto_17339 ?auto_17362 ) ) ( not ( = ?auto_17339 ?auto_17357 ) ) ( not ( = ?auto_17339 ?auto_17349 ) ) ( not ( = ?auto_17339 ?auto_17347 ) ) ( not ( = ?auto_17342 ?auto_17350 ) ) ( not ( = ?auto_17342 ?auto_17359 ) ) ( not ( = ?auto_17342 ?auto_17352 ) ) ( not ( = ?auto_17342 ?auto_17361 ) ) ( not ( = ?auto_17342 ?auto_17354 ) ) ( not ( = ?auto_17343 ?auto_17348 ) ) ( not ( = ?auto_17343 ?auto_17358 ) ) ( not ( = ?auto_17343 ?auto_17356 ) ) ( not ( = ?auto_17343 ?auto_17360 ) ) ( not ( = ?auto_17343 ?auto_17346 ) ) ( not ( = ?auto_17353 ?auto_17351 ) ) ( not ( = ?auto_17353 ?auto_17355 ) ) ( not ( = ?auto_17353 ?auto_17362 ) ) ( not ( = ?auto_17353 ?auto_17357 ) ) ( not ( = ?auto_17353 ?auto_17349 ) ) ( not ( = ?auto_17353 ?auto_17347 ) ) ( not ( = ?auto_17331 ?auto_17338 ) ) ( not ( = ?auto_17331 ?auto_17344 ) ) ( not ( = ?auto_17332 ?auto_17338 ) ) ( not ( = ?auto_17332 ?auto_17344 ) ) ( not ( = ?auto_17333 ?auto_17338 ) ) ( not ( = ?auto_17333 ?auto_17344 ) ) ( not ( = ?auto_17334 ?auto_17338 ) ) ( not ( = ?auto_17334 ?auto_17344 ) ) ( not ( = ?auto_17335 ?auto_17338 ) ) ( not ( = ?auto_17335 ?auto_17344 ) ) ( not ( = ?auto_17337 ?auto_17338 ) ) ( not ( = ?auto_17337 ?auto_17344 ) ) ( not ( = ?auto_17336 ?auto_17338 ) ) ( not ( = ?auto_17336 ?auto_17344 ) ) ( not ( = ?auto_17338 ?auto_17353 ) ) ( not ( = ?auto_17338 ?auto_17351 ) ) ( not ( = ?auto_17338 ?auto_17355 ) ) ( not ( = ?auto_17338 ?auto_17362 ) ) ( not ( = ?auto_17338 ?auto_17357 ) ) ( not ( = ?auto_17338 ?auto_17349 ) ) ( not ( = ?auto_17338 ?auto_17347 ) ) ( not ( = ?auto_17344 ?auto_17353 ) ) ( not ( = ?auto_17344 ?auto_17351 ) ) ( not ( = ?auto_17344 ?auto_17355 ) ) ( not ( = ?auto_17344 ?auto_17362 ) ) ( not ( = ?auto_17344 ?auto_17357 ) ) ( not ( = ?auto_17344 ?auto_17349 ) ) ( not ( = ?auto_17344 ?auto_17347 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_17331 ?auto_17332 ?auto_17333 ?auto_17334 ?auto_17335 ?auto_17337 ?auto_17336 ?auto_17339 )
      ( MAKE-1CRATE ?auto_17339 ?auto_17338 )
      ( MAKE-8CRATE-VERIFY ?auto_17331 ?auto_17332 ?auto_17333 ?auto_17334 ?auto_17335 ?auto_17337 ?auto_17336 ?auto_17339 ?auto_17338 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17365 - SURFACE
      ?auto_17366 - SURFACE
    )
    :vars
    (
      ?auto_17367 - HOIST
      ?auto_17368 - PLACE
      ?auto_17370 - PLACE
      ?auto_17371 - HOIST
      ?auto_17372 - SURFACE
      ?auto_17369 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17367 ?auto_17368 ) ( SURFACE-AT ?auto_17365 ?auto_17368 ) ( CLEAR ?auto_17365 ) ( IS-CRATE ?auto_17366 ) ( AVAILABLE ?auto_17367 ) ( not ( = ?auto_17370 ?auto_17368 ) ) ( HOIST-AT ?auto_17371 ?auto_17370 ) ( AVAILABLE ?auto_17371 ) ( SURFACE-AT ?auto_17366 ?auto_17370 ) ( ON ?auto_17366 ?auto_17372 ) ( CLEAR ?auto_17366 ) ( TRUCK-AT ?auto_17369 ?auto_17368 ) ( not ( = ?auto_17365 ?auto_17366 ) ) ( not ( = ?auto_17365 ?auto_17372 ) ) ( not ( = ?auto_17366 ?auto_17372 ) ) ( not ( = ?auto_17367 ?auto_17371 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17369 ?auto_17368 ?auto_17370 )
      ( !LIFT ?auto_17371 ?auto_17366 ?auto_17372 ?auto_17370 )
      ( !LOAD ?auto_17371 ?auto_17366 ?auto_17369 ?auto_17370 )
      ( !DRIVE ?auto_17369 ?auto_17370 ?auto_17368 )
      ( !UNLOAD ?auto_17367 ?auto_17366 ?auto_17369 ?auto_17368 )
      ( !DROP ?auto_17367 ?auto_17366 ?auto_17365 ?auto_17368 )
      ( MAKE-1CRATE-VERIFY ?auto_17365 ?auto_17366 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_17383 - SURFACE
      ?auto_17384 - SURFACE
      ?auto_17385 - SURFACE
      ?auto_17386 - SURFACE
      ?auto_17387 - SURFACE
      ?auto_17390 - SURFACE
      ?auto_17388 - SURFACE
      ?auto_17392 - SURFACE
      ?auto_17391 - SURFACE
      ?auto_17389 - SURFACE
    )
    :vars
    (
      ?auto_17397 - HOIST
      ?auto_17398 - PLACE
      ?auto_17394 - PLACE
      ?auto_17396 - HOIST
      ?auto_17393 - SURFACE
      ?auto_17399 - PLACE
      ?auto_17406 - HOIST
      ?auto_17417 - SURFACE
      ?auto_17402 - SURFACE
      ?auto_17405 - PLACE
      ?auto_17401 - HOIST
      ?auto_17404 - SURFACE
      ?auto_17415 - PLACE
      ?auto_17414 - HOIST
      ?auto_17411 - SURFACE
      ?auto_17403 - PLACE
      ?auto_17413 - HOIST
      ?auto_17400 - SURFACE
      ?auto_17410 - PLACE
      ?auto_17407 - HOIST
      ?auto_17412 - SURFACE
      ?auto_17416 - SURFACE
      ?auto_17409 - PLACE
      ?auto_17408 - HOIST
      ?auto_17418 - SURFACE
      ?auto_17395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17397 ?auto_17398 ) ( IS-CRATE ?auto_17389 ) ( not ( = ?auto_17394 ?auto_17398 ) ) ( HOIST-AT ?auto_17396 ?auto_17394 ) ( AVAILABLE ?auto_17396 ) ( SURFACE-AT ?auto_17389 ?auto_17394 ) ( ON ?auto_17389 ?auto_17393 ) ( CLEAR ?auto_17389 ) ( not ( = ?auto_17391 ?auto_17389 ) ) ( not ( = ?auto_17391 ?auto_17393 ) ) ( not ( = ?auto_17389 ?auto_17393 ) ) ( not ( = ?auto_17397 ?auto_17396 ) ) ( IS-CRATE ?auto_17391 ) ( not ( = ?auto_17399 ?auto_17398 ) ) ( HOIST-AT ?auto_17406 ?auto_17399 ) ( SURFACE-AT ?auto_17391 ?auto_17399 ) ( ON ?auto_17391 ?auto_17417 ) ( CLEAR ?auto_17391 ) ( not ( = ?auto_17392 ?auto_17391 ) ) ( not ( = ?auto_17392 ?auto_17417 ) ) ( not ( = ?auto_17391 ?auto_17417 ) ) ( not ( = ?auto_17397 ?auto_17406 ) ) ( IS-CRATE ?auto_17392 ) ( AVAILABLE ?auto_17406 ) ( SURFACE-AT ?auto_17392 ?auto_17399 ) ( ON ?auto_17392 ?auto_17402 ) ( CLEAR ?auto_17392 ) ( not ( = ?auto_17388 ?auto_17392 ) ) ( not ( = ?auto_17388 ?auto_17402 ) ) ( not ( = ?auto_17392 ?auto_17402 ) ) ( IS-CRATE ?auto_17388 ) ( not ( = ?auto_17405 ?auto_17398 ) ) ( HOIST-AT ?auto_17401 ?auto_17405 ) ( AVAILABLE ?auto_17401 ) ( SURFACE-AT ?auto_17388 ?auto_17405 ) ( ON ?auto_17388 ?auto_17404 ) ( CLEAR ?auto_17388 ) ( not ( = ?auto_17390 ?auto_17388 ) ) ( not ( = ?auto_17390 ?auto_17404 ) ) ( not ( = ?auto_17388 ?auto_17404 ) ) ( not ( = ?auto_17397 ?auto_17401 ) ) ( IS-CRATE ?auto_17390 ) ( not ( = ?auto_17415 ?auto_17398 ) ) ( HOIST-AT ?auto_17414 ?auto_17415 ) ( AVAILABLE ?auto_17414 ) ( SURFACE-AT ?auto_17390 ?auto_17415 ) ( ON ?auto_17390 ?auto_17411 ) ( CLEAR ?auto_17390 ) ( not ( = ?auto_17387 ?auto_17390 ) ) ( not ( = ?auto_17387 ?auto_17411 ) ) ( not ( = ?auto_17390 ?auto_17411 ) ) ( not ( = ?auto_17397 ?auto_17414 ) ) ( IS-CRATE ?auto_17387 ) ( not ( = ?auto_17403 ?auto_17398 ) ) ( HOIST-AT ?auto_17413 ?auto_17403 ) ( AVAILABLE ?auto_17413 ) ( SURFACE-AT ?auto_17387 ?auto_17403 ) ( ON ?auto_17387 ?auto_17400 ) ( CLEAR ?auto_17387 ) ( not ( = ?auto_17386 ?auto_17387 ) ) ( not ( = ?auto_17386 ?auto_17400 ) ) ( not ( = ?auto_17387 ?auto_17400 ) ) ( not ( = ?auto_17397 ?auto_17413 ) ) ( IS-CRATE ?auto_17386 ) ( not ( = ?auto_17410 ?auto_17398 ) ) ( HOIST-AT ?auto_17407 ?auto_17410 ) ( SURFACE-AT ?auto_17386 ?auto_17410 ) ( ON ?auto_17386 ?auto_17412 ) ( CLEAR ?auto_17386 ) ( not ( = ?auto_17385 ?auto_17386 ) ) ( not ( = ?auto_17385 ?auto_17412 ) ) ( not ( = ?auto_17386 ?auto_17412 ) ) ( not ( = ?auto_17397 ?auto_17407 ) ) ( IS-CRATE ?auto_17385 ) ( AVAILABLE ?auto_17407 ) ( SURFACE-AT ?auto_17385 ?auto_17410 ) ( ON ?auto_17385 ?auto_17416 ) ( CLEAR ?auto_17385 ) ( not ( = ?auto_17384 ?auto_17385 ) ) ( not ( = ?auto_17384 ?auto_17416 ) ) ( not ( = ?auto_17385 ?auto_17416 ) ) ( SURFACE-AT ?auto_17383 ?auto_17398 ) ( CLEAR ?auto_17383 ) ( IS-CRATE ?auto_17384 ) ( AVAILABLE ?auto_17397 ) ( not ( = ?auto_17409 ?auto_17398 ) ) ( HOIST-AT ?auto_17408 ?auto_17409 ) ( AVAILABLE ?auto_17408 ) ( SURFACE-AT ?auto_17384 ?auto_17409 ) ( ON ?auto_17384 ?auto_17418 ) ( CLEAR ?auto_17384 ) ( TRUCK-AT ?auto_17395 ?auto_17398 ) ( not ( = ?auto_17383 ?auto_17384 ) ) ( not ( = ?auto_17383 ?auto_17418 ) ) ( not ( = ?auto_17384 ?auto_17418 ) ) ( not ( = ?auto_17397 ?auto_17408 ) ) ( not ( = ?auto_17383 ?auto_17385 ) ) ( not ( = ?auto_17383 ?auto_17416 ) ) ( not ( = ?auto_17385 ?auto_17418 ) ) ( not ( = ?auto_17410 ?auto_17409 ) ) ( not ( = ?auto_17407 ?auto_17408 ) ) ( not ( = ?auto_17416 ?auto_17418 ) ) ( not ( = ?auto_17383 ?auto_17386 ) ) ( not ( = ?auto_17383 ?auto_17412 ) ) ( not ( = ?auto_17384 ?auto_17386 ) ) ( not ( = ?auto_17384 ?auto_17412 ) ) ( not ( = ?auto_17386 ?auto_17416 ) ) ( not ( = ?auto_17386 ?auto_17418 ) ) ( not ( = ?auto_17412 ?auto_17416 ) ) ( not ( = ?auto_17412 ?auto_17418 ) ) ( not ( = ?auto_17383 ?auto_17387 ) ) ( not ( = ?auto_17383 ?auto_17400 ) ) ( not ( = ?auto_17384 ?auto_17387 ) ) ( not ( = ?auto_17384 ?auto_17400 ) ) ( not ( = ?auto_17385 ?auto_17387 ) ) ( not ( = ?auto_17385 ?auto_17400 ) ) ( not ( = ?auto_17387 ?auto_17412 ) ) ( not ( = ?auto_17387 ?auto_17416 ) ) ( not ( = ?auto_17387 ?auto_17418 ) ) ( not ( = ?auto_17403 ?auto_17410 ) ) ( not ( = ?auto_17403 ?auto_17409 ) ) ( not ( = ?auto_17413 ?auto_17407 ) ) ( not ( = ?auto_17413 ?auto_17408 ) ) ( not ( = ?auto_17400 ?auto_17412 ) ) ( not ( = ?auto_17400 ?auto_17416 ) ) ( not ( = ?auto_17400 ?auto_17418 ) ) ( not ( = ?auto_17383 ?auto_17390 ) ) ( not ( = ?auto_17383 ?auto_17411 ) ) ( not ( = ?auto_17384 ?auto_17390 ) ) ( not ( = ?auto_17384 ?auto_17411 ) ) ( not ( = ?auto_17385 ?auto_17390 ) ) ( not ( = ?auto_17385 ?auto_17411 ) ) ( not ( = ?auto_17386 ?auto_17390 ) ) ( not ( = ?auto_17386 ?auto_17411 ) ) ( not ( = ?auto_17390 ?auto_17400 ) ) ( not ( = ?auto_17390 ?auto_17412 ) ) ( not ( = ?auto_17390 ?auto_17416 ) ) ( not ( = ?auto_17390 ?auto_17418 ) ) ( not ( = ?auto_17415 ?auto_17403 ) ) ( not ( = ?auto_17415 ?auto_17410 ) ) ( not ( = ?auto_17415 ?auto_17409 ) ) ( not ( = ?auto_17414 ?auto_17413 ) ) ( not ( = ?auto_17414 ?auto_17407 ) ) ( not ( = ?auto_17414 ?auto_17408 ) ) ( not ( = ?auto_17411 ?auto_17400 ) ) ( not ( = ?auto_17411 ?auto_17412 ) ) ( not ( = ?auto_17411 ?auto_17416 ) ) ( not ( = ?auto_17411 ?auto_17418 ) ) ( not ( = ?auto_17383 ?auto_17388 ) ) ( not ( = ?auto_17383 ?auto_17404 ) ) ( not ( = ?auto_17384 ?auto_17388 ) ) ( not ( = ?auto_17384 ?auto_17404 ) ) ( not ( = ?auto_17385 ?auto_17388 ) ) ( not ( = ?auto_17385 ?auto_17404 ) ) ( not ( = ?auto_17386 ?auto_17388 ) ) ( not ( = ?auto_17386 ?auto_17404 ) ) ( not ( = ?auto_17387 ?auto_17388 ) ) ( not ( = ?auto_17387 ?auto_17404 ) ) ( not ( = ?auto_17388 ?auto_17411 ) ) ( not ( = ?auto_17388 ?auto_17400 ) ) ( not ( = ?auto_17388 ?auto_17412 ) ) ( not ( = ?auto_17388 ?auto_17416 ) ) ( not ( = ?auto_17388 ?auto_17418 ) ) ( not ( = ?auto_17405 ?auto_17415 ) ) ( not ( = ?auto_17405 ?auto_17403 ) ) ( not ( = ?auto_17405 ?auto_17410 ) ) ( not ( = ?auto_17405 ?auto_17409 ) ) ( not ( = ?auto_17401 ?auto_17414 ) ) ( not ( = ?auto_17401 ?auto_17413 ) ) ( not ( = ?auto_17401 ?auto_17407 ) ) ( not ( = ?auto_17401 ?auto_17408 ) ) ( not ( = ?auto_17404 ?auto_17411 ) ) ( not ( = ?auto_17404 ?auto_17400 ) ) ( not ( = ?auto_17404 ?auto_17412 ) ) ( not ( = ?auto_17404 ?auto_17416 ) ) ( not ( = ?auto_17404 ?auto_17418 ) ) ( not ( = ?auto_17383 ?auto_17392 ) ) ( not ( = ?auto_17383 ?auto_17402 ) ) ( not ( = ?auto_17384 ?auto_17392 ) ) ( not ( = ?auto_17384 ?auto_17402 ) ) ( not ( = ?auto_17385 ?auto_17392 ) ) ( not ( = ?auto_17385 ?auto_17402 ) ) ( not ( = ?auto_17386 ?auto_17392 ) ) ( not ( = ?auto_17386 ?auto_17402 ) ) ( not ( = ?auto_17387 ?auto_17392 ) ) ( not ( = ?auto_17387 ?auto_17402 ) ) ( not ( = ?auto_17390 ?auto_17392 ) ) ( not ( = ?auto_17390 ?auto_17402 ) ) ( not ( = ?auto_17392 ?auto_17404 ) ) ( not ( = ?auto_17392 ?auto_17411 ) ) ( not ( = ?auto_17392 ?auto_17400 ) ) ( not ( = ?auto_17392 ?auto_17412 ) ) ( not ( = ?auto_17392 ?auto_17416 ) ) ( not ( = ?auto_17392 ?auto_17418 ) ) ( not ( = ?auto_17399 ?auto_17405 ) ) ( not ( = ?auto_17399 ?auto_17415 ) ) ( not ( = ?auto_17399 ?auto_17403 ) ) ( not ( = ?auto_17399 ?auto_17410 ) ) ( not ( = ?auto_17399 ?auto_17409 ) ) ( not ( = ?auto_17406 ?auto_17401 ) ) ( not ( = ?auto_17406 ?auto_17414 ) ) ( not ( = ?auto_17406 ?auto_17413 ) ) ( not ( = ?auto_17406 ?auto_17407 ) ) ( not ( = ?auto_17406 ?auto_17408 ) ) ( not ( = ?auto_17402 ?auto_17404 ) ) ( not ( = ?auto_17402 ?auto_17411 ) ) ( not ( = ?auto_17402 ?auto_17400 ) ) ( not ( = ?auto_17402 ?auto_17412 ) ) ( not ( = ?auto_17402 ?auto_17416 ) ) ( not ( = ?auto_17402 ?auto_17418 ) ) ( not ( = ?auto_17383 ?auto_17391 ) ) ( not ( = ?auto_17383 ?auto_17417 ) ) ( not ( = ?auto_17384 ?auto_17391 ) ) ( not ( = ?auto_17384 ?auto_17417 ) ) ( not ( = ?auto_17385 ?auto_17391 ) ) ( not ( = ?auto_17385 ?auto_17417 ) ) ( not ( = ?auto_17386 ?auto_17391 ) ) ( not ( = ?auto_17386 ?auto_17417 ) ) ( not ( = ?auto_17387 ?auto_17391 ) ) ( not ( = ?auto_17387 ?auto_17417 ) ) ( not ( = ?auto_17390 ?auto_17391 ) ) ( not ( = ?auto_17390 ?auto_17417 ) ) ( not ( = ?auto_17388 ?auto_17391 ) ) ( not ( = ?auto_17388 ?auto_17417 ) ) ( not ( = ?auto_17391 ?auto_17402 ) ) ( not ( = ?auto_17391 ?auto_17404 ) ) ( not ( = ?auto_17391 ?auto_17411 ) ) ( not ( = ?auto_17391 ?auto_17400 ) ) ( not ( = ?auto_17391 ?auto_17412 ) ) ( not ( = ?auto_17391 ?auto_17416 ) ) ( not ( = ?auto_17391 ?auto_17418 ) ) ( not ( = ?auto_17417 ?auto_17402 ) ) ( not ( = ?auto_17417 ?auto_17404 ) ) ( not ( = ?auto_17417 ?auto_17411 ) ) ( not ( = ?auto_17417 ?auto_17400 ) ) ( not ( = ?auto_17417 ?auto_17412 ) ) ( not ( = ?auto_17417 ?auto_17416 ) ) ( not ( = ?auto_17417 ?auto_17418 ) ) ( not ( = ?auto_17383 ?auto_17389 ) ) ( not ( = ?auto_17383 ?auto_17393 ) ) ( not ( = ?auto_17384 ?auto_17389 ) ) ( not ( = ?auto_17384 ?auto_17393 ) ) ( not ( = ?auto_17385 ?auto_17389 ) ) ( not ( = ?auto_17385 ?auto_17393 ) ) ( not ( = ?auto_17386 ?auto_17389 ) ) ( not ( = ?auto_17386 ?auto_17393 ) ) ( not ( = ?auto_17387 ?auto_17389 ) ) ( not ( = ?auto_17387 ?auto_17393 ) ) ( not ( = ?auto_17390 ?auto_17389 ) ) ( not ( = ?auto_17390 ?auto_17393 ) ) ( not ( = ?auto_17388 ?auto_17389 ) ) ( not ( = ?auto_17388 ?auto_17393 ) ) ( not ( = ?auto_17392 ?auto_17389 ) ) ( not ( = ?auto_17392 ?auto_17393 ) ) ( not ( = ?auto_17389 ?auto_17417 ) ) ( not ( = ?auto_17389 ?auto_17402 ) ) ( not ( = ?auto_17389 ?auto_17404 ) ) ( not ( = ?auto_17389 ?auto_17411 ) ) ( not ( = ?auto_17389 ?auto_17400 ) ) ( not ( = ?auto_17389 ?auto_17412 ) ) ( not ( = ?auto_17389 ?auto_17416 ) ) ( not ( = ?auto_17389 ?auto_17418 ) ) ( not ( = ?auto_17394 ?auto_17399 ) ) ( not ( = ?auto_17394 ?auto_17405 ) ) ( not ( = ?auto_17394 ?auto_17415 ) ) ( not ( = ?auto_17394 ?auto_17403 ) ) ( not ( = ?auto_17394 ?auto_17410 ) ) ( not ( = ?auto_17394 ?auto_17409 ) ) ( not ( = ?auto_17396 ?auto_17406 ) ) ( not ( = ?auto_17396 ?auto_17401 ) ) ( not ( = ?auto_17396 ?auto_17414 ) ) ( not ( = ?auto_17396 ?auto_17413 ) ) ( not ( = ?auto_17396 ?auto_17407 ) ) ( not ( = ?auto_17396 ?auto_17408 ) ) ( not ( = ?auto_17393 ?auto_17417 ) ) ( not ( = ?auto_17393 ?auto_17402 ) ) ( not ( = ?auto_17393 ?auto_17404 ) ) ( not ( = ?auto_17393 ?auto_17411 ) ) ( not ( = ?auto_17393 ?auto_17400 ) ) ( not ( = ?auto_17393 ?auto_17412 ) ) ( not ( = ?auto_17393 ?auto_17416 ) ) ( not ( = ?auto_17393 ?auto_17418 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_17383 ?auto_17384 ?auto_17385 ?auto_17386 ?auto_17387 ?auto_17390 ?auto_17388 ?auto_17392 ?auto_17391 )
      ( MAKE-1CRATE ?auto_17391 ?auto_17389 )
      ( MAKE-9CRATE-VERIFY ?auto_17383 ?auto_17384 ?auto_17385 ?auto_17386 ?auto_17387 ?auto_17390 ?auto_17388 ?auto_17392 ?auto_17391 ?auto_17389 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17421 - SURFACE
      ?auto_17422 - SURFACE
    )
    :vars
    (
      ?auto_17423 - HOIST
      ?auto_17424 - PLACE
      ?auto_17426 - PLACE
      ?auto_17427 - HOIST
      ?auto_17428 - SURFACE
      ?auto_17425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17423 ?auto_17424 ) ( SURFACE-AT ?auto_17421 ?auto_17424 ) ( CLEAR ?auto_17421 ) ( IS-CRATE ?auto_17422 ) ( AVAILABLE ?auto_17423 ) ( not ( = ?auto_17426 ?auto_17424 ) ) ( HOIST-AT ?auto_17427 ?auto_17426 ) ( AVAILABLE ?auto_17427 ) ( SURFACE-AT ?auto_17422 ?auto_17426 ) ( ON ?auto_17422 ?auto_17428 ) ( CLEAR ?auto_17422 ) ( TRUCK-AT ?auto_17425 ?auto_17424 ) ( not ( = ?auto_17421 ?auto_17422 ) ) ( not ( = ?auto_17421 ?auto_17428 ) ) ( not ( = ?auto_17422 ?auto_17428 ) ) ( not ( = ?auto_17423 ?auto_17427 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17425 ?auto_17424 ?auto_17426 )
      ( !LIFT ?auto_17427 ?auto_17422 ?auto_17428 ?auto_17426 )
      ( !LOAD ?auto_17427 ?auto_17422 ?auto_17425 ?auto_17426 )
      ( !DRIVE ?auto_17425 ?auto_17426 ?auto_17424 )
      ( !UNLOAD ?auto_17423 ?auto_17422 ?auto_17425 ?auto_17424 )
      ( !DROP ?auto_17423 ?auto_17422 ?auto_17421 ?auto_17424 )
      ( MAKE-1CRATE-VERIFY ?auto_17421 ?auto_17422 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_17440 - SURFACE
      ?auto_17441 - SURFACE
      ?auto_17442 - SURFACE
      ?auto_17443 - SURFACE
      ?auto_17444 - SURFACE
      ?auto_17447 - SURFACE
      ?auto_17445 - SURFACE
      ?auto_17449 - SURFACE
      ?auto_17448 - SURFACE
      ?auto_17446 - SURFACE
      ?auto_17450 - SURFACE
    )
    :vars
    (
      ?auto_17451 - HOIST
      ?auto_17453 - PLACE
      ?auto_17452 - PLACE
      ?auto_17454 - HOIST
      ?auto_17455 - SURFACE
      ?auto_17466 - PLACE
      ?auto_17463 - HOIST
      ?auto_17477 - SURFACE
      ?auto_17467 - PLACE
      ?auto_17472 - HOIST
      ?auto_17473 - SURFACE
      ?auto_17470 - SURFACE
      ?auto_17474 - PLACE
      ?auto_17479 - HOIST
      ?auto_17475 - SURFACE
      ?auto_17460 - PLACE
      ?auto_17459 - HOIST
      ?auto_17468 - SURFACE
      ?auto_17476 - PLACE
      ?auto_17458 - HOIST
      ?auto_17465 - SURFACE
      ?auto_17464 - PLACE
      ?auto_17461 - HOIST
      ?auto_17469 - SURFACE
      ?auto_17471 - SURFACE
      ?auto_17457 - PLACE
      ?auto_17462 - HOIST
      ?auto_17478 - SURFACE
      ?auto_17456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17451 ?auto_17453 ) ( IS-CRATE ?auto_17450 ) ( not ( = ?auto_17452 ?auto_17453 ) ) ( HOIST-AT ?auto_17454 ?auto_17452 ) ( AVAILABLE ?auto_17454 ) ( SURFACE-AT ?auto_17450 ?auto_17452 ) ( ON ?auto_17450 ?auto_17455 ) ( CLEAR ?auto_17450 ) ( not ( = ?auto_17446 ?auto_17450 ) ) ( not ( = ?auto_17446 ?auto_17455 ) ) ( not ( = ?auto_17450 ?auto_17455 ) ) ( not ( = ?auto_17451 ?auto_17454 ) ) ( IS-CRATE ?auto_17446 ) ( not ( = ?auto_17466 ?auto_17453 ) ) ( HOIST-AT ?auto_17463 ?auto_17466 ) ( AVAILABLE ?auto_17463 ) ( SURFACE-AT ?auto_17446 ?auto_17466 ) ( ON ?auto_17446 ?auto_17477 ) ( CLEAR ?auto_17446 ) ( not ( = ?auto_17448 ?auto_17446 ) ) ( not ( = ?auto_17448 ?auto_17477 ) ) ( not ( = ?auto_17446 ?auto_17477 ) ) ( not ( = ?auto_17451 ?auto_17463 ) ) ( IS-CRATE ?auto_17448 ) ( not ( = ?auto_17467 ?auto_17453 ) ) ( HOIST-AT ?auto_17472 ?auto_17467 ) ( SURFACE-AT ?auto_17448 ?auto_17467 ) ( ON ?auto_17448 ?auto_17473 ) ( CLEAR ?auto_17448 ) ( not ( = ?auto_17449 ?auto_17448 ) ) ( not ( = ?auto_17449 ?auto_17473 ) ) ( not ( = ?auto_17448 ?auto_17473 ) ) ( not ( = ?auto_17451 ?auto_17472 ) ) ( IS-CRATE ?auto_17449 ) ( AVAILABLE ?auto_17472 ) ( SURFACE-AT ?auto_17449 ?auto_17467 ) ( ON ?auto_17449 ?auto_17470 ) ( CLEAR ?auto_17449 ) ( not ( = ?auto_17445 ?auto_17449 ) ) ( not ( = ?auto_17445 ?auto_17470 ) ) ( not ( = ?auto_17449 ?auto_17470 ) ) ( IS-CRATE ?auto_17445 ) ( not ( = ?auto_17474 ?auto_17453 ) ) ( HOIST-AT ?auto_17479 ?auto_17474 ) ( AVAILABLE ?auto_17479 ) ( SURFACE-AT ?auto_17445 ?auto_17474 ) ( ON ?auto_17445 ?auto_17475 ) ( CLEAR ?auto_17445 ) ( not ( = ?auto_17447 ?auto_17445 ) ) ( not ( = ?auto_17447 ?auto_17475 ) ) ( not ( = ?auto_17445 ?auto_17475 ) ) ( not ( = ?auto_17451 ?auto_17479 ) ) ( IS-CRATE ?auto_17447 ) ( not ( = ?auto_17460 ?auto_17453 ) ) ( HOIST-AT ?auto_17459 ?auto_17460 ) ( AVAILABLE ?auto_17459 ) ( SURFACE-AT ?auto_17447 ?auto_17460 ) ( ON ?auto_17447 ?auto_17468 ) ( CLEAR ?auto_17447 ) ( not ( = ?auto_17444 ?auto_17447 ) ) ( not ( = ?auto_17444 ?auto_17468 ) ) ( not ( = ?auto_17447 ?auto_17468 ) ) ( not ( = ?auto_17451 ?auto_17459 ) ) ( IS-CRATE ?auto_17444 ) ( not ( = ?auto_17476 ?auto_17453 ) ) ( HOIST-AT ?auto_17458 ?auto_17476 ) ( AVAILABLE ?auto_17458 ) ( SURFACE-AT ?auto_17444 ?auto_17476 ) ( ON ?auto_17444 ?auto_17465 ) ( CLEAR ?auto_17444 ) ( not ( = ?auto_17443 ?auto_17444 ) ) ( not ( = ?auto_17443 ?auto_17465 ) ) ( not ( = ?auto_17444 ?auto_17465 ) ) ( not ( = ?auto_17451 ?auto_17458 ) ) ( IS-CRATE ?auto_17443 ) ( not ( = ?auto_17464 ?auto_17453 ) ) ( HOIST-AT ?auto_17461 ?auto_17464 ) ( SURFACE-AT ?auto_17443 ?auto_17464 ) ( ON ?auto_17443 ?auto_17469 ) ( CLEAR ?auto_17443 ) ( not ( = ?auto_17442 ?auto_17443 ) ) ( not ( = ?auto_17442 ?auto_17469 ) ) ( not ( = ?auto_17443 ?auto_17469 ) ) ( not ( = ?auto_17451 ?auto_17461 ) ) ( IS-CRATE ?auto_17442 ) ( AVAILABLE ?auto_17461 ) ( SURFACE-AT ?auto_17442 ?auto_17464 ) ( ON ?auto_17442 ?auto_17471 ) ( CLEAR ?auto_17442 ) ( not ( = ?auto_17441 ?auto_17442 ) ) ( not ( = ?auto_17441 ?auto_17471 ) ) ( not ( = ?auto_17442 ?auto_17471 ) ) ( SURFACE-AT ?auto_17440 ?auto_17453 ) ( CLEAR ?auto_17440 ) ( IS-CRATE ?auto_17441 ) ( AVAILABLE ?auto_17451 ) ( not ( = ?auto_17457 ?auto_17453 ) ) ( HOIST-AT ?auto_17462 ?auto_17457 ) ( AVAILABLE ?auto_17462 ) ( SURFACE-AT ?auto_17441 ?auto_17457 ) ( ON ?auto_17441 ?auto_17478 ) ( CLEAR ?auto_17441 ) ( TRUCK-AT ?auto_17456 ?auto_17453 ) ( not ( = ?auto_17440 ?auto_17441 ) ) ( not ( = ?auto_17440 ?auto_17478 ) ) ( not ( = ?auto_17441 ?auto_17478 ) ) ( not ( = ?auto_17451 ?auto_17462 ) ) ( not ( = ?auto_17440 ?auto_17442 ) ) ( not ( = ?auto_17440 ?auto_17471 ) ) ( not ( = ?auto_17442 ?auto_17478 ) ) ( not ( = ?auto_17464 ?auto_17457 ) ) ( not ( = ?auto_17461 ?auto_17462 ) ) ( not ( = ?auto_17471 ?auto_17478 ) ) ( not ( = ?auto_17440 ?auto_17443 ) ) ( not ( = ?auto_17440 ?auto_17469 ) ) ( not ( = ?auto_17441 ?auto_17443 ) ) ( not ( = ?auto_17441 ?auto_17469 ) ) ( not ( = ?auto_17443 ?auto_17471 ) ) ( not ( = ?auto_17443 ?auto_17478 ) ) ( not ( = ?auto_17469 ?auto_17471 ) ) ( not ( = ?auto_17469 ?auto_17478 ) ) ( not ( = ?auto_17440 ?auto_17444 ) ) ( not ( = ?auto_17440 ?auto_17465 ) ) ( not ( = ?auto_17441 ?auto_17444 ) ) ( not ( = ?auto_17441 ?auto_17465 ) ) ( not ( = ?auto_17442 ?auto_17444 ) ) ( not ( = ?auto_17442 ?auto_17465 ) ) ( not ( = ?auto_17444 ?auto_17469 ) ) ( not ( = ?auto_17444 ?auto_17471 ) ) ( not ( = ?auto_17444 ?auto_17478 ) ) ( not ( = ?auto_17476 ?auto_17464 ) ) ( not ( = ?auto_17476 ?auto_17457 ) ) ( not ( = ?auto_17458 ?auto_17461 ) ) ( not ( = ?auto_17458 ?auto_17462 ) ) ( not ( = ?auto_17465 ?auto_17469 ) ) ( not ( = ?auto_17465 ?auto_17471 ) ) ( not ( = ?auto_17465 ?auto_17478 ) ) ( not ( = ?auto_17440 ?auto_17447 ) ) ( not ( = ?auto_17440 ?auto_17468 ) ) ( not ( = ?auto_17441 ?auto_17447 ) ) ( not ( = ?auto_17441 ?auto_17468 ) ) ( not ( = ?auto_17442 ?auto_17447 ) ) ( not ( = ?auto_17442 ?auto_17468 ) ) ( not ( = ?auto_17443 ?auto_17447 ) ) ( not ( = ?auto_17443 ?auto_17468 ) ) ( not ( = ?auto_17447 ?auto_17465 ) ) ( not ( = ?auto_17447 ?auto_17469 ) ) ( not ( = ?auto_17447 ?auto_17471 ) ) ( not ( = ?auto_17447 ?auto_17478 ) ) ( not ( = ?auto_17460 ?auto_17476 ) ) ( not ( = ?auto_17460 ?auto_17464 ) ) ( not ( = ?auto_17460 ?auto_17457 ) ) ( not ( = ?auto_17459 ?auto_17458 ) ) ( not ( = ?auto_17459 ?auto_17461 ) ) ( not ( = ?auto_17459 ?auto_17462 ) ) ( not ( = ?auto_17468 ?auto_17465 ) ) ( not ( = ?auto_17468 ?auto_17469 ) ) ( not ( = ?auto_17468 ?auto_17471 ) ) ( not ( = ?auto_17468 ?auto_17478 ) ) ( not ( = ?auto_17440 ?auto_17445 ) ) ( not ( = ?auto_17440 ?auto_17475 ) ) ( not ( = ?auto_17441 ?auto_17445 ) ) ( not ( = ?auto_17441 ?auto_17475 ) ) ( not ( = ?auto_17442 ?auto_17445 ) ) ( not ( = ?auto_17442 ?auto_17475 ) ) ( not ( = ?auto_17443 ?auto_17445 ) ) ( not ( = ?auto_17443 ?auto_17475 ) ) ( not ( = ?auto_17444 ?auto_17445 ) ) ( not ( = ?auto_17444 ?auto_17475 ) ) ( not ( = ?auto_17445 ?auto_17468 ) ) ( not ( = ?auto_17445 ?auto_17465 ) ) ( not ( = ?auto_17445 ?auto_17469 ) ) ( not ( = ?auto_17445 ?auto_17471 ) ) ( not ( = ?auto_17445 ?auto_17478 ) ) ( not ( = ?auto_17474 ?auto_17460 ) ) ( not ( = ?auto_17474 ?auto_17476 ) ) ( not ( = ?auto_17474 ?auto_17464 ) ) ( not ( = ?auto_17474 ?auto_17457 ) ) ( not ( = ?auto_17479 ?auto_17459 ) ) ( not ( = ?auto_17479 ?auto_17458 ) ) ( not ( = ?auto_17479 ?auto_17461 ) ) ( not ( = ?auto_17479 ?auto_17462 ) ) ( not ( = ?auto_17475 ?auto_17468 ) ) ( not ( = ?auto_17475 ?auto_17465 ) ) ( not ( = ?auto_17475 ?auto_17469 ) ) ( not ( = ?auto_17475 ?auto_17471 ) ) ( not ( = ?auto_17475 ?auto_17478 ) ) ( not ( = ?auto_17440 ?auto_17449 ) ) ( not ( = ?auto_17440 ?auto_17470 ) ) ( not ( = ?auto_17441 ?auto_17449 ) ) ( not ( = ?auto_17441 ?auto_17470 ) ) ( not ( = ?auto_17442 ?auto_17449 ) ) ( not ( = ?auto_17442 ?auto_17470 ) ) ( not ( = ?auto_17443 ?auto_17449 ) ) ( not ( = ?auto_17443 ?auto_17470 ) ) ( not ( = ?auto_17444 ?auto_17449 ) ) ( not ( = ?auto_17444 ?auto_17470 ) ) ( not ( = ?auto_17447 ?auto_17449 ) ) ( not ( = ?auto_17447 ?auto_17470 ) ) ( not ( = ?auto_17449 ?auto_17475 ) ) ( not ( = ?auto_17449 ?auto_17468 ) ) ( not ( = ?auto_17449 ?auto_17465 ) ) ( not ( = ?auto_17449 ?auto_17469 ) ) ( not ( = ?auto_17449 ?auto_17471 ) ) ( not ( = ?auto_17449 ?auto_17478 ) ) ( not ( = ?auto_17467 ?auto_17474 ) ) ( not ( = ?auto_17467 ?auto_17460 ) ) ( not ( = ?auto_17467 ?auto_17476 ) ) ( not ( = ?auto_17467 ?auto_17464 ) ) ( not ( = ?auto_17467 ?auto_17457 ) ) ( not ( = ?auto_17472 ?auto_17479 ) ) ( not ( = ?auto_17472 ?auto_17459 ) ) ( not ( = ?auto_17472 ?auto_17458 ) ) ( not ( = ?auto_17472 ?auto_17461 ) ) ( not ( = ?auto_17472 ?auto_17462 ) ) ( not ( = ?auto_17470 ?auto_17475 ) ) ( not ( = ?auto_17470 ?auto_17468 ) ) ( not ( = ?auto_17470 ?auto_17465 ) ) ( not ( = ?auto_17470 ?auto_17469 ) ) ( not ( = ?auto_17470 ?auto_17471 ) ) ( not ( = ?auto_17470 ?auto_17478 ) ) ( not ( = ?auto_17440 ?auto_17448 ) ) ( not ( = ?auto_17440 ?auto_17473 ) ) ( not ( = ?auto_17441 ?auto_17448 ) ) ( not ( = ?auto_17441 ?auto_17473 ) ) ( not ( = ?auto_17442 ?auto_17448 ) ) ( not ( = ?auto_17442 ?auto_17473 ) ) ( not ( = ?auto_17443 ?auto_17448 ) ) ( not ( = ?auto_17443 ?auto_17473 ) ) ( not ( = ?auto_17444 ?auto_17448 ) ) ( not ( = ?auto_17444 ?auto_17473 ) ) ( not ( = ?auto_17447 ?auto_17448 ) ) ( not ( = ?auto_17447 ?auto_17473 ) ) ( not ( = ?auto_17445 ?auto_17448 ) ) ( not ( = ?auto_17445 ?auto_17473 ) ) ( not ( = ?auto_17448 ?auto_17470 ) ) ( not ( = ?auto_17448 ?auto_17475 ) ) ( not ( = ?auto_17448 ?auto_17468 ) ) ( not ( = ?auto_17448 ?auto_17465 ) ) ( not ( = ?auto_17448 ?auto_17469 ) ) ( not ( = ?auto_17448 ?auto_17471 ) ) ( not ( = ?auto_17448 ?auto_17478 ) ) ( not ( = ?auto_17473 ?auto_17470 ) ) ( not ( = ?auto_17473 ?auto_17475 ) ) ( not ( = ?auto_17473 ?auto_17468 ) ) ( not ( = ?auto_17473 ?auto_17465 ) ) ( not ( = ?auto_17473 ?auto_17469 ) ) ( not ( = ?auto_17473 ?auto_17471 ) ) ( not ( = ?auto_17473 ?auto_17478 ) ) ( not ( = ?auto_17440 ?auto_17446 ) ) ( not ( = ?auto_17440 ?auto_17477 ) ) ( not ( = ?auto_17441 ?auto_17446 ) ) ( not ( = ?auto_17441 ?auto_17477 ) ) ( not ( = ?auto_17442 ?auto_17446 ) ) ( not ( = ?auto_17442 ?auto_17477 ) ) ( not ( = ?auto_17443 ?auto_17446 ) ) ( not ( = ?auto_17443 ?auto_17477 ) ) ( not ( = ?auto_17444 ?auto_17446 ) ) ( not ( = ?auto_17444 ?auto_17477 ) ) ( not ( = ?auto_17447 ?auto_17446 ) ) ( not ( = ?auto_17447 ?auto_17477 ) ) ( not ( = ?auto_17445 ?auto_17446 ) ) ( not ( = ?auto_17445 ?auto_17477 ) ) ( not ( = ?auto_17449 ?auto_17446 ) ) ( not ( = ?auto_17449 ?auto_17477 ) ) ( not ( = ?auto_17446 ?auto_17473 ) ) ( not ( = ?auto_17446 ?auto_17470 ) ) ( not ( = ?auto_17446 ?auto_17475 ) ) ( not ( = ?auto_17446 ?auto_17468 ) ) ( not ( = ?auto_17446 ?auto_17465 ) ) ( not ( = ?auto_17446 ?auto_17469 ) ) ( not ( = ?auto_17446 ?auto_17471 ) ) ( not ( = ?auto_17446 ?auto_17478 ) ) ( not ( = ?auto_17466 ?auto_17467 ) ) ( not ( = ?auto_17466 ?auto_17474 ) ) ( not ( = ?auto_17466 ?auto_17460 ) ) ( not ( = ?auto_17466 ?auto_17476 ) ) ( not ( = ?auto_17466 ?auto_17464 ) ) ( not ( = ?auto_17466 ?auto_17457 ) ) ( not ( = ?auto_17463 ?auto_17472 ) ) ( not ( = ?auto_17463 ?auto_17479 ) ) ( not ( = ?auto_17463 ?auto_17459 ) ) ( not ( = ?auto_17463 ?auto_17458 ) ) ( not ( = ?auto_17463 ?auto_17461 ) ) ( not ( = ?auto_17463 ?auto_17462 ) ) ( not ( = ?auto_17477 ?auto_17473 ) ) ( not ( = ?auto_17477 ?auto_17470 ) ) ( not ( = ?auto_17477 ?auto_17475 ) ) ( not ( = ?auto_17477 ?auto_17468 ) ) ( not ( = ?auto_17477 ?auto_17465 ) ) ( not ( = ?auto_17477 ?auto_17469 ) ) ( not ( = ?auto_17477 ?auto_17471 ) ) ( not ( = ?auto_17477 ?auto_17478 ) ) ( not ( = ?auto_17440 ?auto_17450 ) ) ( not ( = ?auto_17440 ?auto_17455 ) ) ( not ( = ?auto_17441 ?auto_17450 ) ) ( not ( = ?auto_17441 ?auto_17455 ) ) ( not ( = ?auto_17442 ?auto_17450 ) ) ( not ( = ?auto_17442 ?auto_17455 ) ) ( not ( = ?auto_17443 ?auto_17450 ) ) ( not ( = ?auto_17443 ?auto_17455 ) ) ( not ( = ?auto_17444 ?auto_17450 ) ) ( not ( = ?auto_17444 ?auto_17455 ) ) ( not ( = ?auto_17447 ?auto_17450 ) ) ( not ( = ?auto_17447 ?auto_17455 ) ) ( not ( = ?auto_17445 ?auto_17450 ) ) ( not ( = ?auto_17445 ?auto_17455 ) ) ( not ( = ?auto_17449 ?auto_17450 ) ) ( not ( = ?auto_17449 ?auto_17455 ) ) ( not ( = ?auto_17448 ?auto_17450 ) ) ( not ( = ?auto_17448 ?auto_17455 ) ) ( not ( = ?auto_17450 ?auto_17477 ) ) ( not ( = ?auto_17450 ?auto_17473 ) ) ( not ( = ?auto_17450 ?auto_17470 ) ) ( not ( = ?auto_17450 ?auto_17475 ) ) ( not ( = ?auto_17450 ?auto_17468 ) ) ( not ( = ?auto_17450 ?auto_17465 ) ) ( not ( = ?auto_17450 ?auto_17469 ) ) ( not ( = ?auto_17450 ?auto_17471 ) ) ( not ( = ?auto_17450 ?auto_17478 ) ) ( not ( = ?auto_17452 ?auto_17466 ) ) ( not ( = ?auto_17452 ?auto_17467 ) ) ( not ( = ?auto_17452 ?auto_17474 ) ) ( not ( = ?auto_17452 ?auto_17460 ) ) ( not ( = ?auto_17452 ?auto_17476 ) ) ( not ( = ?auto_17452 ?auto_17464 ) ) ( not ( = ?auto_17452 ?auto_17457 ) ) ( not ( = ?auto_17454 ?auto_17463 ) ) ( not ( = ?auto_17454 ?auto_17472 ) ) ( not ( = ?auto_17454 ?auto_17479 ) ) ( not ( = ?auto_17454 ?auto_17459 ) ) ( not ( = ?auto_17454 ?auto_17458 ) ) ( not ( = ?auto_17454 ?auto_17461 ) ) ( not ( = ?auto_17454 ?auto_17462 ) ) ( not ( = ?auto_17455 ?auto_17477 ) ) ( not ( = ?auto_17455 ?auto_17473 ) ) ( not ( = ?auto_17455 ?auto_17470 ) ) ( not ( = ?auto_17455 ?auto_17475 ) ) ( not ( = ?auto_17455 ?auto_17468 ) ) ( not ( = ?auto_17455 ?auto_17465 ) ) ( not ( = ?auto_17455 ?auto_17469 ) ) ( not ( = ?auto_17455 ?auto_17471 ) ) ( not ( = ?auto_17455 ?auto_17478 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_17440 ?auto_17441 ?auto_17442 ?auto_17443 ?auto_17444 ?auto_17447 ?auto_17445 ?auto_17449 ?auto_17448 ?auto_17446 )
      ( MAKE-1CRATE ?auto_17446 ?auto_17450 )
      ( MAKE-10CRATE-VERIFY ?auto_17440 ?auto_17441 ?auto_17442 ?auto_17443 ?auto_17444 ?auto_17447 ?auto_17445 ?auto_17449 ?auto_17448 ?auto_17446 ?auto_17450 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17482 - SURFACE
      ?auto_17483 - SURFACE
    )
    :vars
    (
      ?auto_17484 - HOIST
      ?auto_17485 - PLACE
      ?auto_17487 - PLACE
      ?auto_17488 - HOIST
      ?auto_17489 - SURFACE
      ?auto_17486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17484 ?auto_17485 ) ( SURFACE-AT ?auto_17482 ?auto_17485 ) ( CLEAR ?auto_17482 ) ( IS-CRATE ?auto_17483 ) ( AVAILABLE ?auto_17484 ) ( not ( = ?auto_17487 ?auto_17485 ) ) ( HOIST-AT ?auto_17488 ?auto_17487 ) ( AVAILABLE ?auto_17488 ) ( SURFACE-AT ?auto_17483 ?auto_17487 ) ( ON ?auto_17483 ?auto_17489 ) ( CLEAR ?auto_17483 ) ( TRUCK-AT ?auto_17486 ?auto_17485 ) ( not ( = ?auto_17482 ?auto_17483 ) ) ( not ( = ?auto_17482 ?auto_17489 ) ) ( not ( = ?auto_17483 ?auto_17489 ) ) ( not ( = ?auto_17484 ?auto_17488 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17486 ?auto_17485 ?auto_17487 )
      ( !LIFT ?auto_17488 ?auto_17483 ?auto_17489 ?auto_17487 )
      ( !LOAD ?auto_17488 ?auto_17483 ?auto_17486 ?auto_17487 )
      ( !DRIVE ?auto_17486 ?auto_17487 ?auto_17485 )
      ( !UNLOAD ?auto_17484 ?auto_17483 ?auto_17486 ?auto_17485 )
      ( !DROP ?auto_17484 ?auto_17483 ?auto_17482 ?auto_17485 )
      ( MAKE-1CRATE-VERIFY ?auto_17482 ?auto_17483 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_17502 - SURFACE
      ?auto_17503 - SURFACE
      ?auto_17504 - SURFACE
      ?auto_17505 - SURFACE
      ?auto_17506 - SURFACE
      ?auto_17509 - SURFACE
      ?auto_17507 - SURFACE
      ?auto_17511 - SURFACE
      ?auto_17510 - SURFACE
      ?auto_17508 - SURFACE
      ?auto_17513 - SURFACE
      ?auto_17512 - SURFACE
    )
    :vars
    (
      ?auto_17517 - HOIST
      ?auto_17519 - PLACE
      ?auto_17515 - PLACE
      ?auto_17514 - HOIST
      ?auto_17516 - SURFACE
      ?auto_17531 - PLACE
      ?auto_17530 - HOIST
      ?auto_17524 - SURFACE
      ?auto_17528 - PLACE
      ?auto_17538 - HOIST
      ?auto_17545 - SURFACE
      ?auto_17521 - PLACE
      ?auto_17525 - HOIST
      ?auto_17544 - SURFACE
      ?auto_17529 - SURFACE
      ?auto_17535 - PLACE
      ?auto_17520 - HOIST
      ?auto_17534 - SURFACE
      ?auto_17542 - PLACE
      ?auto_17533 - HOIST
      ?auto_17543 - SURFACE
      ?auto_17526 - PLACE
      ?auto_17537 - HOIST
      ?auto_17539 - SURFACE
      ?auto_17523 - PLACE
      ?auto_17536 - HOIST
      ?auto_17522 - SURFACE
      ?auto_17532 - SURFACE
      ?auto_17541 - PLACE
      ?auto_17540 - HOIST
      ?auto_17527 - SURFACE
      ?auto_17518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17517 ?auto_17519 ) ( IS-CRATE ?auto_17512 ) ( not ( = ?auto_17515 ?auto_17519 ) ) ( HOIST-AT ?auto_17514 ?auto_17515 ) ( AVAILABLE ?auto_17514 ) ( SURFACE-AT ?auto_17512 ?auto_17515 ) ( ON ?auto_17512 ?auto_17516 ) ( CLEAR ?auto_17512 ) ( not ( = ?auto_17513 ?auto_17512 ) ) ( not ( = ?auto_17513 ?auto_17516 ) ) ( not ( = ?auto_17512 ?auto_17516 ) ) ( not ( = ?auto_17517 ?auto_17514 ) ) ( IS-CRATE ?auto_17513 ) ( not ( = ?auto_17531 ?auto_17519 ) ) ( HOIST-AT ?auto_17530 ?auto_17531 ) ( AVAILABLE ?auto_17530 ) ( SURFACE-AT ?auto_17513 ?auto_17531 ) ( ON ?auto_17513 ?auto_17524 ) ( CLEAR ?auto_17513 ) ( not ( = ?auto_17508 ?auto_17513 ) ) ( not ( = ?auto_17508 ?auto_17524 ) ) ( not ( = ?auto_17513 ?auto_17524 ) ) ( not ( = ?auto_17517 ?auto_17530 ) ) ( IS-CRATE ?auto_17508 ) ( not ( = ?auto_17528 ?auto_17519 ) ) ( HOIST-AT ?auto_17538 ?auto_17528 ) ( AVAILABLE ?auto_17538 ) ( SURFACE-AT ?auto_17508 ?auto_17528 ) ( ON ?auto_17508 ?auto_17545 ) ( CLEAR ?auto_17508 ) ( not ( = ?auto_17510 ?auto_17508 ) ) ( not ( = ?auto_17510 ?auto_17545 ) ) ( not ( = ?auto_17508 ?auto_17545 ) ) ( not ( = ?auto_17517 ?auto_17538 ) ) ( IS-CRATE ?auto_17510 ) ( not ( = ?auto_17521 ?auto_17519 ) ) ( HOIST-AT ?auto_17525 ?auto_17521 ) ( SURFACE-AT ?auto_17510 ?auto_17521 ) ( ON ?auto_17510 ?auto_17544 ) ( CLEAR ?auto_17510 ) ( not ( = ?auto_17511 ?auto_17510 ) ) ( not ( = ?auto_17511 ?auto_17544 ) ) ( not ( = ?auto_17510 ?auto_17544 ) ) ( not ( = ?auto_17517 ?auto_17525 ) ) ( IS-CRATE ?auto_17511 ) ( AVAILABLE ?auto_17525 ) ( SURFACE-AT ?auto_17511 ?auto_17521 ) ( ON ?auto_17511 ?auto_17529 ) ( CLEAR ?auto_17511 ) ( not ( = ?auto_17507 ?auto_17511 ) ) ( not ( = ?auto_17507 ?auto_17529 ) ) ( not ( = ?auto_17511 ?auto_17529 ) ) ( IS-CRATE ?auto_17507 ) ( not ( = ?auto_17535 ?auto_17519 ) ) ( HOIST-AT ?auto_17520 ?auto_17535 ) ( AVAILABLE ?auto_17520 ) ( SURFACE-AT ?auto_17507 ?auto_17535 ) ( ON ?auto_17507 ?auto_17534 ) ( CLEAR ?auto_17507 ) ( not ( = ?auto_17509 ?auto_17507 ) ) ( not ( = ?auto_17509 ?auto_17534 ) ) ( not ( = ?auto_17507 ?auto_17534 ) ) ( not ( = ?auto_17517 ?auto_17520 ) ) ( IS-CRATE ?auto_17509 ) ( not ( = ?auto_17542 ?auto_17519 ) ) ( HOIST-AT ?auto_17533 ?auto_17542 ) ( AVAILABLE ?auto_17533 ) ( SURFACE-AT ?auto_17509 ?auto_17542 ) ( ON ?auto_17509 ?auto_17543 ) ( CLEAR ?auto_17509 ) ( not ( = ?auto_17506 ?auto_17509 ) ) ( not ( = ?auto_17506 ?auto_17543 ) ) ( not ( = ?auto_17509 ?auto_17543 ) ) ( not ( = ?auto_17517 ?auto_17533 ) ) ( IS-CRATE ?auto_17506 ) ( not ( = ?auto_17526 ?auto_17519 ) ) ( HOIST-AT ?auto_17537 ?auto_17526 ) ( AVAILABLE ?auto_17537 ) ( SURFACE-AT ?auto_17506 ?auto_17526 ) ( ON ?auto_17506 ?auto_17539 ) ( CLEAR ?auto_17506 ) ( not ( = ?auto_17505 ?auto_17506 ) ) ( not ( = ?auto_17505 ?auto_17539 ) ) ( not ( = ?auto_17506 ?auto_17539 ) ) ( not ( = ?auto_17517 ?auto_17537 ) ) ( IS-CRATE ?auto_17505 ) ( not ( = ?auto_17523 ?auto_17519 ) ) ( HOIST-AT ?auto_17536 ?auto_17523 ) ( SURFACE-AT ?auto_17505 ?auto_17523 ) ( ON ?auto_17505 ?auto_17522 ) ( CLEAR ?auto_17505 ) ( not ( = ?auto_17504 ?auto_17505 ) ) ( not ( = ?auto_17504 ?auto_17522 ) ) ( not ( = ?auto_17505 ?auto_17522 ) ) ( not ( = ?auto_17517 ?auto_17536 ) ) ( IS-CRATE ?auto_17504 ) ( AVAILABLE ?auto_17536 ) ( SURFACE-AT ?auto_17504 ?auto_17523 ) ( ON ?auto_17504 ?auto_17532 ) ( CLEAR ?auto_17504 ) ( not ( = ?auto_17503 ?auto_17504 ) ) ( not ( = ?auto_17503 ?auto_17532 ) ) ( not ( = ?auto_17504 ?auto_17532 ) ) ( SURFACE-AT ?auto_17502 ?auto_17519 ) ( CLEAR ?auto_17502 ) ( IS-CRATE ?auto_17503 ) ( AVAILABLE ?auto_17517 ) ( not ( = ?auto_17541 ?auto_17519 ) ) ( HOIST-AT ?auto_17540 ?auto_17541 ) ( AVAILABLE ?auto_17540 ) ( SURFACE-AT ?auto_17503 ?auto_17541 ) ( ON ?auto_17503 ?auto_17527 ) ( CLEAR ?auto_17503 ) ( TRUCK-AT ?auto_17518 ?auto_17519 ) ( not ( = ?auto_17502 ?auto_17503 ) ) ( not ( = ?auto_17502 ?auto_17527 ) ) ( not ( = ?auto_17503 ?auto_17527 ) ) ( not ( = ?auto_17517 ?auto_17540 ) ) ( not ( = ?auto_17502 ?auto_17504 ) ) ( not ( = ?auto_17502 ?auto_17532 ) ) ( not ( = ?auto_17504 ?auto_17527 ) ) ( not ( = ?auto_17523 ?auto_17541 ) ) ( not ( = ?auto_17536 ?auto_17540 ) ) ( not ( = ?auto_17532 ?auto_17527 ) ) ( not ( = ?auto_17502 ?auto_17505 ) ) ( not ( = ?auto_17502 ?auto_17522 ) ) ( not ( = ?auto_17503 ?auto_17505 ) ) ( not ( = ?auto_17503 ?auto_17522 ) ) ( not ( = ?auto_17505 ?auto_17532 ) ) ( not ( = ?auto_17505 ?auto_17527 ) ) ( not ( = ?auto_17522 ?auto_17532 ) ) ( not ( = ?auto_17522 ?auto_17527 ) ) ( not ( = ?auto_17502 ?auto_17506 ) ) ( not ( = ?auto_17502 ?auto_17539 ) ) ( not ( = ?auto_17503 ?auto_17506 ) ) ( not ( = ?auto_17503 ?auto_17539 ) ) ( not ( = ?auto_17504 ?auto_17506 ) ) ( not ( = ?auto_17504 ?auto_17539 ) ) ( not ( = ?auto_17506 ?auto_17522 ) ) ( not ( = ?auto_17506 ?auto_17532 ) ) ( not ( = ?auto_17506 ?auto_17527 ) ) ( not ( = ?auto_17526 ?auto_17523 ) ) ( not ( = ?auto_17526 ?auto_17541 ) ) ( not ( = ?auto_17537 ?auto_17536 ) ) ( not ( = ?auto_17537 ?auto_17540 ) ) ( not ( = ?auto_17539 ?auto_17522 ) ) ( not ( = ?auto_17539 ?auto_17532 ) ) ( not ( = ?auto_17539 ?auto_17527 ) ) ( not ( = ?auto_17502 ?auto_17509 ) ) ( not ( = ?auto_17502 ?auto_17543 ) ) ( not ( = ?auto_17503 ?auto_17509 ) ) ( not ( = ?auto_17503 ?auto_17543 ) ) ( not ( = ?auto_17504 ?auto_17509 ) ) ( not ( = ?auto_17504 ?auto_17543 ) ) ( not ( = ?auto_17505 ?auto_17509 ) ) ( not ( = ?auto_17505 ?auto_17543 ) ) ( not ( = ?auto_17509 ?auto_17539 ) ) ( not ( = ?auto_17509 ?auto_17522 ) ) ( not ( = ?auto_17509 ?auto_17532 ) ) ( not ( = ?auto_17509 ?auto_17527 ) ) ( not ( = ?auto_17542 ?auto_17526 ) ) ( not ( = ?auto_17542 ?auto_17523 ) ) ( not ( = ?auto_17542 ?auto_17541 ) ) ( not ( = ?auto_17533 ?auto_17537 ) ) ( not ( = ?auto_17533 ?auto_17536 ) ) ( not ( = ?auto_17533 ?auto_17540 ) ) ( not ( = ?auto_17543 ?auto_17539 ) ) ( not ( = ?auto_17543 ?auto_17522 ) ) ( not ( = ?auto_17543 ?auto_17532 ) ) ( not ( = ?auto_17543 ?auto_17527 ) ) ( not ( = ?auto_17502 ?auto_17507 ) ) ( not ( = ?auto_17502 ?auto_17534 ) ) ( not ( = ?auto_17503 ?auto_17507 ) ) ( not ( = ?auto_17503 ?auto_17534 ) ) ( not ( = ?auto_17504 ?auto_17507 ) ) ( not ( = ?auto_17504 ?auto_17534 ) ) ( not ( = ?auto_17505 ?auto_17507 ) ) ( not ( = ?auto_17505 ?auto_17534 ) ) ( not ( = ?auto_17506 ?auto_17507 ) ) ( not ( = ?auto_17506 ?auto_17534 ) ) ( not ( = ?auto_17507 ?auto_17543 ) ) ( not ( = ?auto_17507 ?auto_17539 ) ) ( not ( = ?auto_17507 ?auto_17522 ) ) ( not ( = ?auto_17507 ?auto_17532 ) ) ( not ( = ?auto_17507 ?auto_17527 ) ) ( not ( = ?auto_17535 ?auto_17542 ) ) ( not ( = ?auto_17535 ?auto_17526 ) ) ( not ( = ?auto_17535 ?auto_17523 ) ) ( not ( = ?auto_17535 ?auto_17541 ) ) ( not ( = ?auto_17520 ?auto_17533 ) ) ( not ( = ?auto_17520 ?auto_17537 ) ) ( not ( = ?auto_17520 ?auto_17536 ) ) ( not ( = ?auto_17520 ?auto_17540 ) ) ( not ( = ?auto_17534 ?auto_17543 ) ) ( not ( = ?auto_17534 ?auto_17539 ) ) ( not ( = ?auto_17534 ?auto_17522 ) ) ( not ( = ?auto_17534 ?auto_17532 ) ) ( not ( = ?auto_17534 ?auto_17527 ) ) ( not ( = ?auto_17502 ?auto_17511 ) ) ( not ( = ?auto_17502 ?auto_17529 ) ) ( not ( = ?auto_17503 ?auto_17511 ) ) ( not ( = ?auto_17503 ?auto_17529 ) ) ( not ( = ?auto_17504 ?auto_17511 ) ) ( not ( = ?auto_17504 ?auto_17529 ) ) ( not ( = ?auto_17505 ?auto_17511 ) ) ( not ( = ?auto_17505 ?auto_17529 ) ) ( not ( = ?auto_17506 ?auto_17511 ) ) ( not ( = ?auto_17506 ?auto_17529 ) ) ( not ( = ?auto_17509 ?auto_17511 ) ) ( not ( = ?auto_17509 ?auto_17529 ) ) ( not ( = ?auto_17511 ?auto_17534 ) ) ( not ( = ?auto_17511 ?auto_17543 ) ) ( not ( = ?auto_17511 ?auto_17539 ) ) ( not ( = ?auto_17511 ?auto_17522 ) ) ( not ( = ?auto_17511 ?auto_17532 ) ) ( not ( = ?auto_17511 ?auto_17527 ) ) ( not ( = ?auto_17521 ?auto_17535 ) ) ( not ( = ?auto_17521 ?auto_17542 ) ) ( not ( = ?auto_17521 ?auto_17526 ) ) ( not ( = ?auto_17521 ?auto_17523 ) ) ( not ( = ?auto_17521 ?auto_17541 ) ) ( not ( = ?auto_17525 ?auto_17520 ) ) ( not ( = ?auto_17525 ?auto_17533 ) ) ( not ( = ?auto_17525 ?auto_17537 ) ) ( not ( = ?auto_17525 ?auto_17536 ) ) ( not ( = ?auto_17525 ?auto_17540 ) ) ( not ( = ?auto_17529 ?auto_17534 ) ) ( not ( = ?auto_17529 ?auto_17543 ) ) ( not ( = ?auto_17529 ?auto_17539 ) ) ( not ( = ?auto_17529 ?auto_17522 ) ) ( not ( = ?auto_17529 ?auto_17532 ) ) ( not ( = ?auto_17529 ?auto_17527 ) ) ( not ( = ?auto_17502 ?auto_17510 ) ) ( not ( = ?auto_17502 ?auto_17544 ) ) ( not ( = ?auto_17503 ?auto_17510 ) ) ( not ( = ?auto_17503 ?auto_17544 ) ) ( not ( = ?auto_17504 ?auto_17510 ) ) ( not ( = ?auto_17504 ?auto_17544 ) ) ( not ( = ?auto_17505 ?auto_17510 ) ) ( not ( = ?auto_17505 ?auto_17544 ) ) ( not ( = ?auto_17506 ?auto_17510 ) ) ( not ( = ?auto_17506 ?auto_17544 ) ) ( not ( = ?auto_17509 ?auto_17510 ) ) ( not ( = ?auto_17509 ?auto_17544 ) ) ( not ( = ?auto_17507 ?auto_17510 ) ) ( not ( = ?auto_17507 ?auto_17544 ) ) ( not ( = ?auto_17510 ?auto_17529 ) ) ( not ( = ?auto_17510 ?auto_17534 ) ) ( not ( = ?auto_17510 ?auto_17543 ) ) ( not ( = ?auto_17510 ?auto_17539 ) ) ( not ( = ?auto_17510 ?auto_17522 ) ) ( not ( = ?auto_17510 ?auto_17532 ) ) ( not ( = ?auto_17510 ?auto_17527 ) ) ( not ( = ?auto_17544 ?auto_17529 ) ) ( not ( = ?auto_17544 ?auto_17534 ) ) ( not ( = ?auto_17544 ?auto_17543 ) ) ( not ( = ?auto_17544 ?auto_17539 ) ) ( not ( = ?auto_17544 ?auto_17522 ) ) ( not ( = ?auto_17544 ?auto_17532 ) ) ( not ( = ?auto_17544 ?auto_17527 ) ) ( not ( = ?auto_17502 ?auto_17508 ) ) ( not ( = ?auto_17502 ?auto_17545 ) ) ( not ( = ?auto_17503 ?auto_17508 ) ) ( not ( = ?auto_17503 ?auto_17545 ) ) ( not ( = ?auto_17504 ?auto_17508 ) ) ( not ( = ?auto_17504 ?auto_17545 ) ) ( not ( = ?auto_17505 ?auto_17508 ) ) ( not ( = ?auto_17505 ?auto_17545 ) ) ( not ( = ?auto_17506 ?auto_17508 ) ) ( not ( = ?auto_17506 ?auto_17545 ) ) ( not ( = ?auto_17509 ?auto_17508 ) ) ( not ( = ?auto_17509 ?auto_17545 ) ) ( not ( = ?auto_17507 ?auto_17508 ) ) ( not ( = ?auto_17507 ?auto_17545 ) ) ( not ( = ?auto_17511 ?auto_17508 ) ) ( not ( = ?auto_17511 ?auto_17545 ) ) ( not ( = ?auto_17508 ?auto_17544 ) ) ( not ( = ?auto_17508 ?auto_17529 ) ) ( not ( = ?auto_17508 ?auto_17534 ) ) ( not ( = ?auto_17508 ?auto_17543 ) ) ( not ( = ?auto_17508 ?auto_17539 ) ) ( not ( = ?auto_17508 ?auto_17522 ) ) ( not ( = ?auto_17508 ?auto_17532 ) ) ( not ( = ?auto_17508 ?auto_17527 ) ) ( not ( = ?auto_17528 ?auto_17521 ) ) ( not ( = ?auto_17528 ?auto_17535 ) ) ( not ( = ?auto_17528 ?auto_17542 ) ) ( not ( = ?auto_17528 ?auto_17526 ) ) ( not ( = ?auto_17528 ?auto_17523 ) ) ( not ( = ?auto_17528 ?auto_17541 ) ) ( not ( = ?auto_17538 ?auto_17525 ) ) ( not ( = ?auto_17538 ?auto_17520 ) ) ( not ( = ?auto_17538 ?auto_17533 ) ) ( not ( = ?auto_17538 ?auto_17537 ) ) ( not ( = ?auto_17538 ?auto_17536 ) ) ( not ( = ?auto_17538 ?auto_17540 ) ) ( not ( = ?auto_17545 ?auto_17544 ) ) ( not ( = ?auto_17545 ?auto_17529 ) ) ( not ( = ?auto_17545 ?auto_17534 ) ) ( not ( = ?auto_17545 ?auto_17543 ) ) ( not ( = ?auto_17545 ?auto_17539 ) ) ( not ( = ?auto_17545 ?auto_17522 ) ) ( not ( = ?auto_17545 ?auto_17532 ) ) ( not ( = ?auto_17545 ?auto_17527 ) ) ( not ( = ?auto_17502 ?auto_17513 ) ) ( not ( = ?auto_17502 ?auto_17524 ) ) ( not ( = ?auto_17503 ?auto_17513 ) ) ( not ( = ?auto_17503 ?auto_17524 ) ) ( not ( = ?auto_17504 ?auto_17513 ) ) ( not ( = ?auto_17504 ?auto_17524 ) ) ( not ( = ?auto_17505 ?auto_17513 ) ) ( not ( = ?auto_17505 ?auto_17524 ) ) ( not ( = ?auto_17506 ?auto_17513 ) ) ( not ( = ?auto_17506 ?auto_17524 ) ) ( not ( = ?auto_17509 ?auto_17513 ) ) ( not ( = ?auto_17509 ?auto_17524 ) ) ( not ( = ?auto_17507 ?auto_17513 ) ) ( not ( = ?auto_17507 ?auto_17524 ) ) ( not ( = ?auto_17511 ?auto_17513 ) ) ( not ( = ?auto_17511 ?auto_17524 ) ) ( not ( = ?auto_17510 ?auto_17513 ) ) ( not ( = ?auto_17510 ?auto_17524 ) ) ( not ( = ?auto_17513 ?auto_17545 ) ) ( not ( = ?auto_17513 ?auto_17544 ) ) ( not ( = ?auto_17513 ?auto_17529 ) ) ( not ( = ?auto_17513 ?auto_17534 ) ) ( not ( = ?auto_17513 ?auto_17543 ) ) ( not ( = ?auto_17513 ?auto_17539 ) ) ( not ( = ?auto_17513 ?auto_17522 ) ) ( not ( = ?auto_17513 ?auto_17532 ) ) ( not ( = ?auto_17513 ?auto_17527 ) ) ( not ( = ?auto_17531 ?auto_17528 ) ) ( not ( = ?auto_17531 ?auto_17521 ) ) ( not ( = ?auto_17531 ?auto_17535 ) ) ( not ( = ?auto_17531 ?auto_17542 ) ) ( not ( = ?auto_17531 ?auto_17526 ) ) ( not ( = ?auto_17531 ?auto_17523 ) ) ( not ( = ?auto_17531 ?auto_17541 ) ) ( not ( = ?auto_17530 ?auto_17538 ) ) ( not ( = ?auto_17530 ?auto_17525 ) ) ( not ( = ?auto_17530 ?auto_17520 ) ) ( not ( = ?auto_17530 ?auto_17533 ) ) ( not ( = ?auto_17530 ?auto_17537 ) ) ( not ( = ?auto_17530 ?auto_17536 ) ) ( not ( = ?auto_17530 ?auto_17540 ) ) ( not ( = ?auto_17524 ?auto_17545 ) ) ( not ( = ?auto_17524 ?auto_17544 ) ) ( not ( = ?auto_17524 ?auto_17529 ) ) ( not ( = ?auto_17524 ?auto_17534 ) ) ( not ( = ?auto_17524 ?auto_17543 ) ) ( not ( = ?auto_17524 ?auto_17539 ) ) ( not ( = ?auto_17524 ?auto_17522 ) ) ( not ( = ?auto_17524 ?auto_17532 ) ) ( not ( = ?auto_17524 ?auto_17527 ) ) ( not ( = ?auto_17502 ?auto_17512 ) ) ( not ( = ?auto_17502 ?auto_17516 ) ) ( not ( = ?auto_17503 ?auto_17512 ) ) ( not ( = ?auto_17503 ?auto_17516 ) ) ( not ( = ?auto_17504 ?auto_17512 ) ) ( not ( = ?auto_17504 ?auto_17516 ) ) ( not ( = ?auto_17505 ?auto_17512 ) ) ( not ( = ?auto_17505 ?auto_17516 ) ) ( not ( = ?auto_17506 ?auto_17512 ) ) ( not ( = ?auto_17506 ?auto_17516 ) ) ( not ( = ?auto_17509 ?auto_17512 ) ) ( not ( = ?auto_17509 ?auto_17516 ) ) ( not ( = ?auto_17507 ?auto_17512 ) ) ( not ( = ?auto_17507 ?auto_17516 ) ) ( not ( = ?auto_17511 ?auto_17512 ) ) ( not ( = ?auto_17511 ?auto_17516 ) ) ( not ( = ?auto_17510 ?auto_17512 ) ) ( not ( = ?auto_17510 ?auto_17516 ) ) ( not ( = ?auto_17508 ?auto_17512 ) ) ( not ( = ?auto_17508 ?auto_17516 ) ) ( not ( = ?auto_17512 ?auto_17524 ) ) ( not ( = ?auto_17512 ?auto_17545 ) ) ( not ( = ?auto_17512 ?auto_17544 ) ) ( not ( = ?auto_17512 ?auto_17529 ) ) ( not ( = ?auto_17512 ?auto_17534 ) ) ( not ( = ?auto_17512 ?auto_17543 ) ) ( not ( = ?auto_17512 ?auto_17539 ) ) ( not ( = ?auto_17512 ?auto_17522 ) ) ( not ( = ?auto_17512 ?auto_17532 ) ) ( not ( = ?auto_17512 ?auto_17527 ) ) ( not ( = ?auto_17515 ?auto_17531 ) ) ( not ( = ?auto_17515 ?auto_17528 ) ) ( not ( = ?auto_17515 ?auto_17521 ) ) ( not ( = ?auto_17515 ?auto_17535 ) ) ( not ( = ?auto_17515 ?auto_17542 ) ) ( not ( = ?auto_17515 ?auto_17526 ) ) ( not ( = ?auto_17515 ?auto_17523 ) ) ( not ( = ?auto_17515 ?auto_17541 ) ) ( not ( = ?auto_17514 ?auto_17530 ) ) ( not ( = ?auto_17514 ?auto_17538 ) ) ( not ( = ?auto_17514 ?auto_17525 ) ) ( not ( = ?auto_17514 ?auto_17520 ) ) ( not ( = ?auto_17514 ?auto_17533 ) ) ( not ( = ?auto_17514 ?auto_17537 ) ) ( not ( = ?auto_17514 ?auto_17536 ) ) ( not ( = ?auto_17514 ?auto_17540 ) ) ( not ( = ?auto_17516 ?auto_17524 ) ) ( not ( = ?auto_17516 ?auto_17545 ) ) ( not ( = ?auto_17516 ?auto_17544 ) ) ( not ( = ?auto_17516 ?auto_17529 ) ) ( not ( = ?auto_17516 ?auto_17534 ) ) ( not ( = ?auto_17516 ?auto_17543 ) ) ( not ( = ?auto_17516 ?auto_17539 ) ) ( not ( = ?auto_17516 ?auto_17522 ) ) ( not ( = ?auto_17516 ?auto_17532 ) ) ( not ( = ?auto_17516 ?auto_17527 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_17502 ?auto_17503 ?auto_17504 ?auto_17505 ?auto_17506 ?auto_17509 ?auto_17507 ?auto_17511 ?auto_17510 ?auto_17508 ?auto_17513 )
      ( MAKE-1CRATE ?auto_17513 ?auto_17512 )
      ( MAKE-11CRATE-VERIFY ?auto_17502 ?auto_17503 ?auto_17504 ?auto_17505 ?auto_17506 ?auto_17509 ?auto_17507 ?auto_17511 ?auto_17510 ?auto_17508 ?auto_17513 ?auto_17512 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17548 - SURFACE
      ?auto_17549 - SURFACE
    )
    :vars
    (
      ?auto_17550 - HOIST
      ?auto_17551 - PLACE
      ?auto_17553 - PLACE
      ?auto_17554 - HOIST
      ?auto_17555 - SURFACE
      ?auto_17552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17550 ?auto_17551 ) ( SURFACE-AT ?auto_17548 ?auto_17551 ) ( CLEAR ?auto_17548 ) ( IS-CRATE ?auto_17549 ) ( AVAILABLE ?auto_17550 ) ( not ( = ?auto_17553 ?auto_17551 ) ) ( HOIST-AT ?auto_17554 ?auto_17553 ) ( AVAILABLE ?auto_17554 ) ( SURFACE-AT ?auto_17549 ?auto_17553 ) ( ON ?auto_17549 ?auto_17555 ) ( CLEAR ?auto_17549 ) ( TRUCK-AT ?auto_17552 ?auto_17551 ) ( not ( = ?auto_17548 ?auto_17549 ) ) ( not ( = ?auto_17548 ?auto_17555 ) ) ( not ( = ?auto_17549 ?auto_17555 ) ) ( not ( = ?auto_17550 ?auto_17554 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17552 ?auto_17551 ?auto_17553 )
      ( !LIFT ?auto_17554 ?auto_17549 ?auto_17555 ?auto_17553 )
      ( !LOAD ?auto_17554 ?auto_17549 ?auto_17552 ?auto_17553 )
      ( !DRIVE ?auto_17552 ?auto_17553 ?auto_17551 )
      ( !UNLOAD ?auto_17550 ?auto_17549 ?auto_17552 ?auto_17551 )
      ( !DROP ?auto_17550 ?auto_17549 ?auto_17548 ?auto_17551 )
      ( MAKE-1CRATE-VERIFY ?auto_17548 ?auto_17549 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_17569 - SURFACE
      ?auto_17570 - SURFACE
      ?auto_17571 - SURFACE
      ?auto_17572 - SURFACE
      ?auto_17573 - SURFACE
      ?auto_17576 - SURFACE
      ?auto_17574 - SURFACE
      ?auto_17578 - SURFACE
      ?auto_17577 - SURFACE
      ?auto_17575 - SURFACE
      ?auto_17580 - SURFACE
      ?auto_17579 - SURFACE
      ?auto_17581 - SURFACE
    )
    :vars
    (
      ?auto_17584 - HOIST
      ?auto_17582 - PLACE
      ?auto_17587 - PLACE
      ?auto_17585 - HOIST
      ?auto_17586 - SURFACE
      ?auto_17588 - PLACE
      ?auto_17610 - HOIST
      ?auto_17593 - SURFACE
      ?auto_17597 - PLACE
      ?auto_17611 - HOIST
      ?auto_17603 - SURFACE
      ?auto_17594 - PLACE
      ?auto_17595 - HOIST
      ?auto_17600 - SURFACE
      ?auto_17598 - PLACE
      ?auto_17596 - HOIST
      ?auto_17589 - SURFACE
      ?auto_17612 - SURFACE
      ?auto_17613 - PLACE
      ?auto_17606 - HOIST
      ?auto_17604 - SURFACE
      ?auto_17592 - PLACE
      ?auto_17602 - HOIST
      ?auto_17607 - SURFACE
      ?auto_17590 - SURFACE
      ?auto_17605 - PLACE
      ?auto_17609 - HOIST
      ?auto_17608 - SURFACE
      ?auto_17601 - SURFACE
      ?auto_17591 - PLACE
      ?auto_17614 - HOIST
      ?auto_17599 - SURFACE
      ?auto_17583 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17584 ?auto_17582 ) ( IS-CRATE ?auto_17581 ) ( not ( = ?auto_17587 ?auto_17582 ) ) ( HOIST-AT ?auto_17585 ?auto_17587 ) ( SURFACE-AT ?auto_17581 ?auto_17587 ) ( ON ?auto_17581 ?auto_17586 ) ( CLEAR ?auto_17581 ) ( not ( = ?auto_17579 ?auto_17581 ) ) ( not ( = ?auto_17579 ?auto_17586 ) ) ( not ( = ?auto_17581 ?auto_17586 ) ) ( not ( = ?auto_17584 ?auto_17585 ) ) ( IS-CRATE ?auto_17579 ) ( not ( = ?auto_17588 ?auto_17582 ) ) ( HOIST-AT ?auto_17610 ?auto_17588 ) ( AVAILABLE ?auto_17610 ) ( SURFACE-AT ?auto_17579 ?auto_17588 ) ( ON ?auto_17579 ?auto_17593 ) ( CLEAR ?auto_17579 ) ( not ( = ?auto_17580 ?auto_17579 ) ) ( not ( = ?auto_17580 ?auto_17593 ) ) ( not ( = ?auto_17579 ?auto_17593 ) ) ( not ( = ?auto_17584 ?auto_17610 ) ) ( IS-CRATE ?auto_17580 ) ( not ( = ?auto_17597 ?auto_17582 ) ) ( HOIST-AT ?auto_17611 ?auto_17597 ) ( AVAILABLE ?auto_17611 ) ( SURFACE-AT ?auto_17580 ?auto_17597 ) ( ON ?auto_17580 ?auto_17603 ) ( CLEAR ?auto_17580 ) ( not ( = ?auto_17575 ?auto_17580 ) ) ( not ( = ?auto_17575 ?auto_17603 ) ) ( not ( = ?auto_17580 ?auto_17603 ) ) ( not ( = ?auto_17584 ?auto_17611 ) ) ( IS-CRATE ?auto_17575 ) ( not ( = ?auto_17594 ?auto_17582 ) ) ( HOIST-AT ?auto_17595 ?auto_17594 ) ( AVAILABLE ?auto_17595 ) ( SURFACE-AT ?auto_17575 ?auto_17594 ) ( ON ?auto_17575 ?auto_17600 ) ( CLEAR ?auto_17575 ) ( not ( = ?auto_17577 ?auto_17575 ) ) ( not ( = ?auto_17577 ?auto_17600 ) ) ( not ( = ?auto_17575 ?auto_17600 ) ) ( not ( = ?auto_17584 ?auto_17595 ) ) ( IS-CRATE ?auto_17577 ) ( not ( = ?auto_17598 ?auto_17582 ) ) ( HOIST-AT ?auto_17596 ?auto_17598 ) ( SURFACE-AT ?auto_17577 ?auto_17598 ) ( ON ?auto_17577 ?auto_17589 ) ( CLEAR ?auto_17577 ) ( not ( = ?auto_17578 ?auto_17577 ) ) ( not ( = ?auto_17578 ?auto_17589 ) ) ( not ( = ?auto_17577 ?auto_17589 ) ) ( not ( = ?auto_17584 ?auto_17596 ) ) ( IS-CRATE ?auto_17578 ) ( AVAILABLE ?auto_17596 ) ( SURFACE-AT ?auto_17578 ?auto_17598 ) ( ON ?auto_17578 ?auto_17612 ) ( CLEAR ?auto_17578 ) ( not ( = ?auto_17574 ?auto_17578 ) ) ( not ( = ?auto_17574 ?auto_17612 ) ) ( not ( = ?auto_17578 ?auto_17612 ) ) ( IS-CRATE ?auto_17574 ) ( not ( = ?auto_17613 ?auto_17582 ) ) ( HOIST-AT ?auto_17606 ?auto_17613 ) ( AVAILABLE ?auto_17606 ) ( SURFACE-AT ?auto_17574 ?auto_17613 ) ( ON ?auto_17574 ?auto_17604 ) ( CLEAR ?auto_17574 ) ( not ( = ?auto_17576 ?auto_17574 ) ) ( not ( = ?auto_17576 ?auto_17604 ) ) ( not ( = ?auto_17574 ?auto_17604 ) ) ( not ( = ?auto_17584 ?auto_17606 ) ) ( IS-CRATE ?auto_17576 ) ( not ( = ?auto_17592 ?auto_17582 ) ) ( HOIST-AT ?auto_17602 ?auto_17592 ) ( AVAILABLE ?auto_17602 ) ( SURFACE-AT ?auto_17576 ?auto_17592 ) ( ON ?auto_17576 ?auto_17607 ) ( CLEAR ?auto_17576 ) ( not ( = ?auto_17573 ?auto_17576 ) ) ( not ( = ?auto_17573 ?auto_17607 ) ) ( not ( = ?auto_17576 ?auto_17607 ) ) ( not ( = ?auto_17584 ?auto_17602 ) ) ( IS-CRATE ?auto_17573 ) ( AVAILABLE ?auto_17585 ) ( SURFACE-AT ?auto_17573 ?auto_17587 ) ( ON ?auto_17573 ?auto_17590 ) ( CLEAR ?auto_17573 ) ( not ( = ?auto_17572 ?auto_17573 ) ) ( not ( = ?auto_17572 ?auto_17590 ) ) ( not ( = ?auto_17573 ?auto_17590 ) ) ( IS-CRATE ?auto_17572 ) ( not ( = ?auto_17605 ?auto_17582 ) ) ( HOIST-AT ?auto_17609 ?auto_17605 ) ( SURFACE-AT ?auto_17572 ?auto_17605 ) ( ON ?auto_17572 ?auto_17608 ) ( CLEAR ?auto_17572 ) ( not ( = ?auto_17571 ?auto_17572 ) ) ( not ( = ?auto_17571 ?auto_17608 ) ) ( not ( = ?auto_17572 ?auto_17608 ) ) ( not ( = ?auto_17584 ?auto_17609 ) ) ( IS-CRATE ?auto_17571 ) ( AVAILABLE ?auto_17609 ) ( SURFACE-AT ?auto_17571 ?auto_17605 ) ( ON ?auto_17571 ?auto_17601 ) ( CLEAR ?auto_17571 ) ( not ( = ?auto_17570 ?auto_17571 ) ) ( not ( = ?auto_17570 ?auto_17601 ) ) ( not ( = ?auto_17571 ?auto_17601 ) ) ( SURFACE-AT ?auto_17569 ?auto_17582 ) ( CLEAR ?auto_17569 ) ( IS-CRATE ?auto_17570 ) ( AVAILABLE ?auto_17584 ) ( not ( = ?auto_17591 ?auto_17582 ) ) ( HOIST-AT ?auto_17614 ?auto_17591 ) ( AVAILABLE ?auto_17614 ) ( SURFACE-AT ?auto_17570 ?auto_17591 ) ( ON ?auto_17570 ?auto_17599 ) ( CLEAR ?auto_17570 ) ( TRUCK-AT ?auto_17583 ?auto_17582 ) ( not ( = ?auto_17569 ?auto_17570 ) ) ( not ( = ?auto_17569 ?auto_17599 ) ) ( not ( = ?auto_17570 ?auto_17599 ) ) ( not ( = ?auto_17584 ?auto_17614 ) ) ( not ( = ?auto_17569 ?auto_17571 ) ) ( not ( = ?auto_17569 ?auto_17601 ) ) ( not ( = ?auto_17571 ?auto_17599 ) ) ( not ( = ?auto_17605 ?auto_17591 ) ) ( not ( = ?auto_17609 ?auto_17614 ) ) ( not ( = ?auto_17601 ?auto_17599 ) ) ( not ( = ?auto_17569 ?auto_17572 ) ) ( not ( = ?auto_17569 ?auto_17608 ) ) ( not ( = ?auto_17570 ?auto_17572 ) ) ( not ( = ?auto_17570 ?auto_17608 ) ) ( not ( = ?auto_17572 ?auto_17601 ) ) ( not ( = ?auto_17572 ?auto_17599 ) ) ( not ( = ?auto_17608 ?auto_17601 ) ) ( not ( = ?auto_17608 ?auto_17599 ) ) ( not ( = ?auto_17569 ?auto_17573 ) ) ( not ( = ?auto_17569 ?auto_17590 ) ) ( not ( = ?auto_17570 ?auto_17573 ) ) ( not ( = ?auto_17570 ?auto_17590 ) ) ( not ( = ?auto_17571 ?auto_17573 ) ) ( not ( = ?auto_17571 ?auto_17590 ) ) ( not ( = ?auto_17573 ?auto_17608 ) ) ( not ( = ?auto_17573 ?auto_17601 ) ) ( not ( = ?auto_17573 ?auto_17599 ) ) ( not ( = ?auto_17587 ?auto_17605 ) ) ( not ( = ?auto_17587 ?auto_17591 ) ) ( not ( = ?auto_17585 ?auto_17609 ) ) ( not ( = ?auto_17585 ?auto_17614 ) ) ( not ( = ?auto_17590 ?auto_17608 ) ) ( not ( = ?auto_17590 ?auto_17601 ) ) ( not ( = ?auto_17590 ?auto_17599 ) ) ( not ( = ?auto_17569 ?auto_17576 ) ) ( not ( = ?auto_17569 ?auto_17607 ) ) ( not ( = ?auto_17570 ?auto_17576 ) ) ( not ( = ?auto_17570 ?auto_17607 ) ) ( not ( = ?auto_17571 ?auto_17576 ) ) ( not ( = ?auto_17571 ?auto_17607 ) ) ( not ( = ?auto_17572 ?auto_17576 ) ) ( not ( = ?auto_17572 ?auto_17607 ) ) ( not ( = ?auto_17576 ?auto_17590 ) ) ( not ( = ?auto_17576 ?auto_17608 ) ) ( not ( = ?auto_17576 ?auto_17601 ) ) ( not ( = ?auto_17576 ?auto_17599 ) ) ( not ( = ?auto_17592 ?auto_17587 ) ) ( not ( = ?auto_17592 ?auto_17605 ) ) ( not ( = ?auto_17592 ?auto_17591 ) ) ( not ( = ?auto_17602 ?auto_17585 ) ) ( not ( = ?auto_17602 ?auto_17609 ) ) ( not ( = ?auto_17602 ?auto_17614 ) ) ( not ( = ?auto_17607 ?auto_17590 ) ) ( not ( = ?auto_17607 ?auto_17608 ) ) ( not ( = ?auto_17607 ?auto_17601 ) ) ( not ( = ?auto_17607 ?auto_17599 ) ) ( not ( = ?auto_17569 ?auto_17574 ) ) ( not ( = ?auto_17569 ?auto_17604 ) ) ( not ( = ?auto_17570 ?auto_17574 ) ) ( not ( = ?auto_17570 ?auto_17604 ) ) ( not ( = ?auto_17571 ?auto_17574 ) ) ( not ( = ?auto_17571 ?auto_17604 ) ) ( not ( = ?auto_17572 ?auto_17574 ) ) ( not ( = ?auto_17572 ?auto_17604 ) ) ( not ( = ?auto_17573 ?auto_17574 ) ) ( not ( = ?auto_17573 ?auto_17604 ) ) ( not ( = ?auto_17574 ?auto_17607 ) ) ( not ( = ?auto_17574 ?auto_17590 ) ) ( not ( = ?auto_17574 ?auto_17608 ) ) ( not ( = ?auto_17574 ?auto_17601 ) ) ( not ( = ?auto_17574 ?auto_17599 ) ) ( not ( = ?auto_17613 ?auto_17592 ) ) ( not ( = ?auto_17613 ?auto_17587 ) ) ( not ( = ?auto_17613 ?auto_17605 ) ) ( not ( = ?auto_17613 ?auto_17591 ) ) ( not ( = ?auto_17606 ?auto_17602 ) ) ( not ( = ?auto_17606 ?auto_17585 ) ) ( not ( = ?auto_17606 ?auto_17609 ) ) ( not ( = ?auto_17606 ?auto_17614 ) ) ( not ( = ?auto_17604 ?auto_17607 ) ) ( not ( = ?auto_17604 ?auto_17590 ) ) ( not ( = ?auto_17604 ?auto_17608 ) ) ( not ( = ?auto_17604 ?auto_17601 ) ) ( not ( = ?auto_17604 ?auto_17599 ) ) ( not ( = ?auto_17569 ?auto_17578 ) ) ( not ( = ?auto_17569 ?auto_17612 ) ) ( not ( = ?auto_17570 ?auto_17578 ) ) ( not ( = ?auto_17570 ?auto_17612 ) ) ( not ( = ?auto_17571 ?auto_17578 ) ) ( not ( = ?auto_17571 ?auto_17612 ) ) ( not ( = ?auto_17572 ?auto_17578 ) ) ( not ( = ?auto_17572 ?auto_17612 ) ) ( not ( = ?auto_17573 ?auto_17578 ) ) ( not ( = ?auto_17573 ?auto_17612 ) ) ( not ( = ?auto_17576 ?auto_17578 ) ) ( not ( = ?auto_17576 ?auto_17612 ) ) ( not ( = ?auto_17578 ?auto_17604 ) ) ( not ( = ?auto_17578 ?auto_17607 ) ) ( not ( = ?auto_17578 ?auto_17590 ) ) ( not ( = ?auto_17578 ?auto_17608 ) ) ( not ( = ?auto_17578 ?auto_17601 ) ) ( not ( = ?auto_17578 ?auto_17599 ) ) ( not ( = ?auto_17598 ?auto_17613 ) ) ( not ( = ?auto_17598 ?auto_17592 ) ) ( not ( = ?auto_17598 ?auto_17587 ) ) ( not ( = ?auto_17598 ?auto_17605 ) ) ( not ( = ?auto_17598 ?auto_17591 ) ) ( not ( = ?auto_17596 ?auto_17606 ) ) ( not ( = ?auto_17596 ?auto_17602 ) ) ( not ( = ?auto_17596 ?auto_17585 ) ) ( not ( = ?auto_17596 ?auto_17609 ) ) ( not ( = ?auto_17596 ?auto_17614 ) ) ( not ( = ?auto_17612 ?auto_17604 ) ) ( not ( = ?auto_17612 ?auto_17607 ) ) ( not ( = ?auto_17612 ?auto_17590 ) ) ( not ( = ?auto_17612 ?auto_17608 ) ) ( not ( = ?auto_17612 ?auto_17601 ) ) ( not ( = ?auto_17612 ?auto_17599 ) ) ( not ( = ?auto_17569 ?auto_17577 ) ) ( not ( = ?auto_17569 ?auto_17589 ) ) ( not ( = ?auto_17570 ?auto_17577 ) ) ( not ( = ?auto_17570 ?auto_17589 ) ) ( not ( = ?auto_17571 ?auto_17577 ) ) ( not ( = ?auto_17571 ?auto_17589 ) ) ( not ( = ?auto_17572 ?auto_17577 ) ) ( not ( = ?auto_17572 ?auto_17589 ) ) ( not ( = ?auto_17573 ?auto_17577 ) ) ( not ( = ?auto_17573 ?auto_17589 ) ) ( not ( = ?auto_17576 ?auto_17577 ) ) ( not ( = ?auto_17576 ?auto_17589 ) ) ( not ( = ?auto_17574 ?auto_17577 ) ) ( not ( = ?auto_17574 ?auto_17589 ) ) ( not ( = ?auto_17577 ?auto_17612 ) ) ( not ( = ?auto_17577 ?auto_17604 ) ) ( not ( = ?auto_17577 ?auto_17607 ) ) ( not ( = ?auto_17577 ?auto_17590 ) ) ( not ( = ?auto_17577 ?auto_17608 ) ) ( not ( = ?auto_17577 ?auto_17601 ) ) ( not ( = ?auto_17577 ?auto_17599 ) ) ( not ( = ?auto_17589 ?auto_17612 ) ) ( not ( = ?auto_17589 ?auto_17604 ) ) ( not ( = ?auto_17589 ?auto_17607 ) ) ( not ( = ?auto_17589 ?auto_17590 ) ) ( not ( = ?auto_17589 ?auto_17608 ) ) ( not ( = ?auto_17589 ?auto_17601 ) ) ( not ( = ?auto_17589 ?auto_17599 ) ) ( not ( = ?auto_17569 ?auto_17575 ) ) ( not ( = ?auto_17569 ?auto_17600 ) ) ( not ( = ?auto_17570 ?auto_17575 ) ) ( not ( = ?auto_17570 ?auto_17600 ) ) ( not ( = ?auto_17571 ?auto_17575 ) ) ( not ( = ?auto_17571 ?auto_17600 ) ) ( not ( = ?auto_17572 ?auto_17575 ) ) ( not ( = ?auto_17572 ?auto_17600 ) ) ( not ( = ?auto_17573 ?auto_17575 ) ) ( not ( = ?auto_17573 ?auto_17600 ) ) ( not ( = ?auto_17576 ?auto_17575 ) ) ( not ( = ?auto_17576 ?auto_17600 ) ) ( not ( = ?auto_17574 ?auto_17575 ) ) ( not ( = ?auto_17574 ?auto_17600 ) ) ( not ( = ?auto_17578 ?auto_17575 ) ) ( not ( = ?auto_17578 ?auto_17600 ) ) ( not ( = ?auto_17575 ?auto_17589 ) ) ( not ( = ?auto_17575 ?auto_17612 ) ) ( not ( = ?auto_17575 ?auto_17604 ) ) ( not ( = ?auto_17575 ?auto_17607 ) ) ( not ( = ?auto_17575 ?auto_17590 ) ) ( not ( = ?auto_17575 ?auto_17608 ) ) ( not ( = ?auto_17575 ?auto_17601 ) ) ( not ( = ?auto_17575 ?auto_17599 ) ) ( not ( = ?auto_17594 ?auto_17598 ) ) ( not ( = ?auto_17594 ?auto_17613 ) ) ( not ( = ?auto_17594 ?auto_17592 ) ) ( not ( = ?auto_17594 ?auto_17587 ) ) ( not ( = ?auto_17594 ?auto_17605 ) ) ( not ( = ?auto_17594 ?auto_17591 ) ) ( not ( = ?auto_17595 ?auto_17596 ) ) ( not ( = ?auto_17595 ?auto_17606 ) ) ( not ( = ?auto_17595 ?auto_17602 ) ) ( not ( = ?auto_17595 ?auto_17585 ) ) ( not ( = ?auto_17595 ?auto_17609 ) ) ( not ( = ?auto_17595 ?auto_17614 ) ) ( not ( = ?auto_17600 ?auto_17589 ) ) ( not ( = ?auto_17600 ?auto_17612 ) ) ( not ( = ?auto_17600 ?auto_17604 ) ) ( not ( = ?auto_17600 ?auto_17607 ) ) ( not ( = ?auto_17600 ?auto_17590 ) ) ( not ( = ?auto_17600 ?auto_17608 ) ) ( not ( = ?auto_17600 ?auto_17601 ) ) ( not ( = ?auto_17600 ?auto_17599 ) ) ( not ( = ?auto_17569 ?auto_17580 ) ) ( not ( = ?auto_17569 ?auto_17603 ) ) ( not ( = ?auto_17570 ?auto_17580 ) ) ( not ( = ?auto_17570 ?auto_17603 ) ) ( not ( = ?auto_17571 ?auto_17580 ) ) ( not ( = ?auto_17571 ?auto_17603 ) ) ( not ( = ?auto_17572 ?auto_17580 ) ) ( not ( = ?auto_17572 ?auto_17603 ) ) ( not ( = ?auto_17573 ?auto_17580 ) ) ( not ( = ?auto_17573 ?auto_17603 ) ) ( not ( = ?auto_17576 ?auto_17580 ) ) ( not ( = ?auto_17576 ?auto_17603 ) ) ( not ( = ?auto_17574 ?auto_17580 ) ) ( not ( = ?auto_17574 ?auto_17603 ) ) ( not ( = ?auto_17578 ?auto_17580 ) ) ( not ( = ?auto_17578 ?auto_17603 ) ) ( not ( = ?auto_17577 ?auto_17580 ) ) ( not ( = ?auto_17577 ?auto_17603 ) ) ( not ( = ?auto_17580 ?auto_17600 ) ) ( not ( = ?auto_17580 ?auto_17589 ) ) ( not ( = ?auto_17580 ?auto_17612 ) ) ( not ( = ?auto_17580 ?auto_17604 ) ) ( not ( = ?auto_17580 ?auto_17607 ) ) ( not ( = ?auto_17580 ?auto_17590 ) ) ( not ( = ?auto_17580 ?auto_17608 ) ) ( not ( = ?auto_17580 ?auto_17601 ) ) ( not ( = ?auto_17580 ?auto_17599 ) ) ( not ( = ?auto_17597 ?auto_17594 ) ) ( not ( = ?auto_17597 ?auto_17598 ) ) ( not ( = ?auto_17597 ?auto_17613 ) ) ( not ( = ?auto_17597 ?auto_17592 ) ) ( not ( = ?auto_17597 ?auto_17587 ) ) ( not ( = ?auto_17597 ?auto_17605 ) ) ( not ( = ?auto_17597 ?auto_17591 ) ) ( not ( = ?auto_17611 ?auto_17595 ) ) ( not ( = ?auto_17611 ?auto_17596 ) ) ( not ( = ?auto_17611 ?auto_17606 ) ) ( not ( = ?auto_17611 ?auto_17602 ) ) ( not ( = ?auto_17611 ?auto_17585 ) ) ( not ( = ?auto_17611 ?auto_17609 ) ) ( not ( = ?auto_17611 ?auto_17614 ) ) ( not ( = ?auto_17603 ?auto_17600 ) ) ( not ( = ?auto_17603 ?auto_17589 ) ) ( not ( = ?auto_17603 ?auto_17612 ) ) ( not ( = ?auto_17603 ?auto_17604 ) ) ( not ( = ?auto_17603 ?auto_17607 ) ) ( not ( = ?auto_17603 ?auto_17590 ) ) ( not ( = ?auto_17603 ?auto_17608 ) ) ( not ( = ?auto_17603 ?auto_17601 ) ) ( not ( = ?auto_17603 ?auto_17599 ) ) ( not ( = ?auto_17569 ?auto_17579 ) ) ( not ( = ?auto_17569 ?auto_17593 ) ) ( not ( = ?auto_17570 ?auto_17579 ) ) ( not ( = ?auto_17570 ?auto_17593 ) ) ( not ( = ?auto_17571 ?auto_17579 ) ) ( not ( = ?auto_17571 ?auto_17593 ) ) ( not ( = ?auto_17572 ?auto_17579 ) ) ( not ( = ?auto_17572 ?auto_17593 ) ) ( not ( = ?auto_17573 ?auto_17579 ) ) ( not ( = ?auto_17573 ?auto_17593 ) ) ( not ( = ?auto_17576 ?auto_17579 ) ) ( not ( = ?auto_17576 ?auto_17593 ) ) ( not ( = ?auto_17574 ?auto_17579 ) ) ( not ( = ?auto_17574 ?auto_17593 ) ) ( not ( = ?auto_17578 ?auto_17579 ) ) ( not ( = ?auto_17578 ?auto_17593 ) ) ( not ( = ?auto_17577 ?auto_17579 ) ) ( not ( = ?auto_17577 ?auto_17593 ) ) ( not ( = ?auto_17575 ?auto_17579 ) ) ( not ( = ?auto_17575 ?auto_17593 ) ) ( not ( = ?auto_17579 ?auto_17603 ) ) ( not ( = ?auto_17579 ?auto_17600 ) ) ( not ( = ?auto_17579 ?auto_17589 ) ) ( not ( = ?auto_17579 ?auto_17612 ) ) ( not ( = ?auto_17579 ?auto_17604 ) ) ( not ( = ?auto_17579 ?auto_17607 ) ) ( not ( = ?auto_17579 ?auto_17590 ) ) ( not ( = ?auto_17579 ?auto_17608 ) ) ( not ( = ?auto_17579 ?auto_17601 ) ) ( not ( = ?auto_17579 ?auto_17599 ) ) ( not ( = ?auto_17588 ?auto_17597 ) ) ( not ( = ?auto_17588 ?auto_17594 ) ) ( not ( = ?auto_17588 ?auto_17598 ) ) ( not ( = ?auto_17588 ?auto_17613 ) ) ( not ( = ?auto_17588 ?auto_17592 ) ) ( not ( = ?auto_17588 ?auto_17587 ) ) ( not ( = ?auto_17588 ?auto_17605 ) ) ( not ( = ?auto_17588 ?auto_17591 ) ) ( not ( = ?auto_17610 ?auto_17611 ) ) ( not ( = ?auto_17610 ?auto_17595 ) ) ( not ( = ?auto_17610 ?auto_17596 ) ) ( not ( = ?auto_17610 ?auto_17606 ) ) ( not ( = ?auto_17610 ?auto_17602 ) ) ( not ( = ?auto_17610 ?auto_17585 ) ) ( not ( = ?auto_17610 ?auto_17609 ) ) ( not ( = ?auto_17610 ?auto_17614 ) ) ( not ( = ?auto_17593 ?auto_17603 ) ) ( not ( = ?auto_17593 ?auto_17600 ) ) ( not ( = ?auto_17593 ?auto_17589 ) ) ( not ( = ?auto_17593 ?auto_17612 ) ) ( not ( = ?auto_17593 ?auto_17604 ) ) ( not ( = ?auto_17593 ?auto_17607 ) ) ( not ( = ?auto_17593 ?auto_17590 ) ) ( not ( = ?auto_17593 ?auto_17608 ) ) ( not ( = ?auto_17593 ?auto_17601 ) ) ( not ( = ?auto_17593 ?auto_17599 ) ) ( not ( = ?auto_17569 ?auto_17581 ) ) ( not ( = ?auto_17569 ?auto_17586 ) ) ( not ( = ?auto_17570 ?auto_17581 ) ) ( not ( = ?auto_17570 ?auto_17586 ) ) ( not ( = ?auto_17571 ?auto_17581 ) ) ( not ( = ?auto_17571 ?auto_17586 ) ) ( not ( = ?auto_17572 ?auto_17581 ) ) ( not ( = ?auto_17572 ?auto_17586 ) ) ( not ( = ?auto_17573 ?auto_17581 ) ) ( not ( = ?auto_17573 ?auto_17586 ) ) ( not ( = ?auto_17576 ?auto_17581 ) ) ( not ( = ?auto_17576 ?auto_17586 ) ) ( not ( = ?auto_17574 ?auto_17581 ) ) ( not ( = ?auto_17574 ?auto_17586 ) ) ( not ( = ?auto_17578 ?auto_17581 ) ) ( not ( = ?auto_17578 ?auto_17586 ) ) ( not ( = ?auto_17577 ?auto_17581 ) ) ( not ( = ?auto_17577 ?auto_17586 ) ) ( not ( = ?auto_17575 ?auto_17581 ) ) ( not ( = ?auto_17575 ?auto_17586 ) ) ( not ( = ?auto_17580 ?auto_17581 ) ) ( not ( = ?auto_17580 ?auto_17586 ) ) ( not ( = ?auto_17581 ?auto_17593 ) ) ( not ( = ?auto_17581 ?auto_17603 ) ) ( not ( = ?auto_17581 ?auto_17600 ) ) ( not ( = ?auto_17581 ?auto_17589 ) ) ( not ( = ?auto_17581 ?auto_17612 ) ) ( not ( = ?auto_17581 ?auto_17604 ) ) ( not ( = ?auto_17581 ?auto_17607 ) ) ( not ( = ?auto_17581 ?auto_17590 ) ) ( not ( = ?auto_17581 ?auto_17608 ) ) ( not ( = ?auto_17581 ?auto_17601 ) ) ( not ( = ?auto_17581 ?auto_17599 ) ) ( not ( = ?auto_17586 ?auto_17593 ) ) ( not ( = ?auto_17586 ?auto_17603 ) ) ( not ( = ?auto_17586 ?auto_17600 ) ) ( not ( = ?auto_17586 ?auto_17589 ) ) ( not ( = ?auto_17586 ?auto_17612 ) ) ( not ( = ?auto_17586 ?auto_17604 ) ) ( not ( = ?auto_17586 ?auto_17607 ) ) ( not ( = ?auto_17586 ?auto_17590 ) ) ( not ( = ?auto_17586 ?auto_17608 ) ) ( not ( = ?auto_17586 ?auto_17601 ) ) ( not ( = ?auto_17586 ?auto_17599 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_17569 ?auto_17570 ?auto_17571 ?auto_17572 ?auto_17573 ?auto_17576 ?auto_17574 ?auto_17578 ?auto_17577 ?auto_17575 ?auto_17580 ?auto_17579 )
      ( MAKE-1CRATE ?auto_17579 ?auto_17581 )
      ( MAKE-12CRATE-VERIFY ?auto_17569 ?auto_17570 ?auto_17571 ?auto_17572 ?auto_17573 ?auto_17576 ?auto_17574 ?auto_17578 ?auto_17577 ?auto_17575 ?auto_17580 ?auto_17579 ?auto_17581 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17617 - SURFACE
      ?auto_17618 - SURFACE
    )
    :vars
    (
      ?auto_17619 - HOIST
      ?auto_17620 - PLACE
      ?auto_17622 - PLACE
      ?auto_17623 - HOIST
      ?auto_17624 - SURFACE
      ?auto_17621 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17619 ?auto_17620 ) ( SURFACE-AT ?auto_17617 ?auto_17620 ) ( CLEAR ?auto_17617 ) ( IS-CRATE ?auto_17618 ) ( AVAILABLE ?auto_17619 ) ( not ( = ?auto_17622 ?auto_17620 ) ) ( HOIST-AT ?auto_17623 ?auto_17622 ) ( AVAILABLE ?auto_17623 ) ( SURFACE-AT ?auto_17618 ?auto_17622 ) ( ON ?auto_17618 ?auto_17624 ) ( CLEAR ?auto_17618 ) ( TRUCK-AT ?auto_17621 ?auto_17620 ) ( not ( = ?auto_17617 ?auto_17618 ) ) ( not ( = ?auto_17617 ?auto_17624 ) ) ( not ( = ?auto_17618 ?auto_17624 ) ) ( not ( = ?auto_17619 ?auto_17623 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17621 ?auto_17620 ?auto_17622 )
      ( !LIFT ?auto_17623 ?auto_17618 ?auto_17624 ?auto_17622 )
      ( !LOAD ?auto_17623 ?auto_17618 ?auto_17621 ?auto_17622 )
      ( !DRIVE ?auto_17621 ?auto_17622 ?auto_17620 )
      ( !UNLOAD ?auto_17619 ?auto_17618 ?auto_17621 ?auto_17620 )
      ( !DROP ?auto_17619 ?auto_17618 ?auto_17617 ?auto_17620 )
      ( MAKE-1CRATE-VERIFY ?auto_17617 ?auto_17618 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_17639 - SURFACE
      ?auto_17640 - SURFACE
      ?auto_17641 - SURFACE
      ?auto_17642 - SURFACE
      ?auto_17643 - SURFACE
      ?auto_17646 - SURFACE
      ?auto_17644 - SURFACE
      ?auto_17648 - SURFACE
      ?auto_17647 - SURFACE
      ?auto_17645 - SURFACE
      ?auto_17650 - SURFACE
      ?auto_17649 - SURFACE
      ?auto_17651 - SURFACE
      ?auto_17652 - SURFACE
    )
    :vars
    (
      ?auto_17657 - HOIST
      ?auto_17654 - PLACE
      ?auto_17653 - PLACE
      ?auto_17655 - HOIST
      ?auto_17658 - SURFACE
      ?auto_17681 - SURFACE
      ?auto_17661 - PLACE
      ?auto_17672 - HOIST
      ?auto_17664 - SURFACE
      ?auto_17665 - PLACE
      ?auto_17686 - HOIST
      ?auto_17682 - SURFACE
      ?auto_17659 - PLACE
      ?auto_17675 - HOIST
      ?auto_17660 - SURFACE
      ?auto_17677 - PLACE
      ?auto_17684 - HOIST
      ?auto_17683 - SURFACE
      ?auto_17667 - SURFACE
      ?auto_17680 - PLACE
      ?auto_17676 - HOIST
      ?auto_17670 - SURFACE
      ?auto_17678 - PLACE
      ?auto_17673 - HOIST
      ?auto_17674 - SURFACE
      ?auto_17663 - SURFACE
      ?auto_17671 - PLACE
      ?auto_17666 - HOIST
      ?auto_17685 - SURFACE
      ?auto_17669 - SURFACE
      ?auto_17662 - PLACE
      ?auto_17668 - HOIST
      ?auto_17679 - SURFACE
      ?auto_17656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17657 ?auto_17654 ) ( IS-CRATE ?auto_17652 ) ( not ( = ?auto_17653 ?auto_17654 ) ) ( HOIST-AT ?auto_17655 ?auto_17653 ) ( SURFACE-AT ?auto_17652 ?auto_17653 ) ( ON ?auto_17652 ?auto_17658 ) ( CLEAR ?auto_17652 ) ( not ( = ?auto_17651 ?auto_17652 ) ) ( not ( = ?auto_17651 ?auto_17658 ) ) ( not ( = ?auto_17652 ?auto_17658 ) ) ( not ( = ?auto_17657 ?auto_17655 ) ) ( IS-CRATE ?auto_17651 ) ( SURFACE-AT ?auto_17651 ?auto_17653 ) ( ON ?auto_17651 ?auto_17681 ) ( CLEAR ?auto_17651 ) ( not ( = ?auto_17649 ?auto_17651 ) ) ( not ( = ?auto_17649 ?auto_17681 ) ) ( not ( = ?auto_17651 ?auto_17681 ) ) ( IS-CRATE ?auto_17649 ) ( not ( = ?auto_17661 ?auto_17654 ) ) ( HOIST-AT ?auto_17672 ?auto_17661 ) ( AVAILABLE ?auto_17672 ) ( SURFACE-AT ?auto_17649 ?auto_17661 ) ( ON ?auto_17649 ?auto_17664 ) ( CLEAR ?auto_17649 ) ( not ( = ?auto_17650 ?auto_17649 ) ) ( not ( = ?auto_17650 ?auto_17664 ) ) ( not ( = ?auto_17649 ?auto_17664 ) ) ( not ( = ?auto_17657 ?auto_17672 ) ) ( IS-CRATE ?auto_17650 ) ( not ( = ?auto_17665 ?auto_17654 ) ) ( HOIST-AT ?auto_17686 ?auto_17665 ) ( AVAILABLE ?auto_17686 ) ( SURFACE-AT ?auto_17650 ?auto_17665 ) ( ON ?auto_17650 ?auto_17682 ) ( CLEAR ?auto_17650 ) ( not ( = ?auto_17645 ?auto_17650 ) ) ( not ( = ?auto_17645 ?auto_17682 ) ) ( not ( = ?auto_17650 ?auto_17682 ) ) ( not ( = ?auto_17657 ?auto_17686 ) ) ( IS-CRATE ?auto_17645 ) ( not ( = ?auto_17659 ?auto_17654 ) ) ( HOIST-AT ?auto_17675 ?auto_17659 ) ( AVAILABLE ?auto_17675 ) ( SURFACE-AT ?auto_17645 ?auto_17659 ) ( ON ?auto_17645 ?auto_17660 ) ( CLEAR ?auto_17645 ) ( not ( = ?auto_17647 ?auto_17645 ) ) ( not ( = ?auto_17647 ?auto_17660 ) ) ( not ( = ?auto_17645 ?auto_17660 ) ) ( not ( = ?auto_17657 ?auto_17675 ) ) ( IS-CRATE ?auto_17647 ) ( not ( = ?auto_17677 ?auto_17654 ) ) ( HOIST-AT ?auto_17684 ?auto_17677 ) ( SURFACE-AT ?auto_17647 ?auto_17677 ) ( ON ?auto_17647 ?auto_17683 ) ( CLEAR ?auto_17647 ) ( not ( = ?auto_17648 ?auto_17647 ) ) ( not ( = ?auto_17648 ?auto_17683 ) ) ( not ( = ?auto_17647 ?auto_17683 ) ) ( not ( = ?auto_17657 ?auto_17684 ) ) ( IS-CRATE ?auto_17648 ) ( AVAILABLE ?auto_17684 ) ( SURFACE-AT ?auto_17648 ?auto_17677 ) ( ON ?auto_17648 ?auto_17667 ) ( CLEAR ?auto_17648 ) ( not ( = ?auto_17644 ?auto_17648 ) ) ( not ( = ?auto_17644 ?auto_17667 ) ) ( not ( = ?auto_17648 ?auto_17667 ) ) ( IS-CRATE ?auto_17644 ) ( not ( = ?auto_17680 ?auto_17654 ) ) ( HOIST-AT ?auto_17676 ?auto_17680 ) ( AVAILABLE ?auto_17676 ) ( SURFACE-AT ?auto_17644 ?auto_17680 ) ( ON ?auto_17644 ?auto_17670 ) ( CLEAR ?auto_17644 ) ( not ( = ?auto_17646 ?auto_17644 ) ) ( not ( = ?auto_17646 ?auto_17670 ) ) ( not ( = ?auto_17644 ?auto_17670 ) ) ( not ( = ?auto_17657 ?auto_17676 ) ) ( IS-CRATE ?auto_17646 ) ( not ( = ?auto_17678 ?auto_17654 ) ) ( HOIST-AT ?auto_17673 ?auto_17678 ) ( AVAILABLE ?auto_17673 ) ( SURFACE-AT ?auto_17646 ?auto_17678 ) ( ON ?auto_17646 ?auto_17674 ) ( CLEAR ?auto_17646 ) ( not ( = ?auto_17643 ?auto_17646 ) ) ( not ( = ?auto_17643 ?auto_17674 ) ) ( not ( = ?auto_17646 ?auto_17674 ) ) ( not ( = ?auto_17657 ?auto_17673 ) ) ( IS-CRATE ?auto_17643 ) ( AVAILABLE ?auto_17655 ) ( SURFACE-AT ?auto_17643 ?auto_17653 ) ( ON ?auto_17643 ?auto_17663 ) ( CLEAR ?auto_17643 ) ( not ( = ?auto_17642 ?auto_17643 ) ) ( not ( = ?auto_17642 ?auto_17663 ) ) ( not ( = ?auto_17643 ?auto_17663 ) ) ( IS-CRATE ?auto_17642 ) ( not ( = ?auto_17671 ?auto_17654 ) ) ( HOIST-AT ?auto_17666 ?auto_17671 ) ( SURFACE-AT ?auto_17642 ?auto_17671 ) ( ON ?auto_17642 ?auto_17685 ) ( CLEAR ?auto_17642 ) ( not ( = ?auto_17641 ?auto_17642 ) ) ( not ( = ?auto_17641 ?auto_17685 ) ) ( not ( = ?auto_17642 ?auto_17685 ) ) ( not ( = ?auto_17657 ?auto_17666 ) ) ( IS-CRATE ?auto_17641 ) ( AVAILABLE ?auto_17666 ) ( SURFACE-AT ?auto_17641 ?auto_17671 ) ( ON ?auto_17641 ?auto_17669 ) ( CLEAR ?auto_17641 ) ( not ( = ?auto_17640 ?auto_17641 ) ) ( not ( = ?auto_17640 ?auto_17669 ) ) ( not ( = ?auto_17641 ?auto_17669 ) ) ( SURFACE-AT ?auto_17639 ?auto_17654 ) ( CLEAR ?auto_17639 ) ( IS-CRATE ?auto_17640 ) ( AVAILABLE ?auto_17657 ) ( not ( = ?auto_17662 ?auto_17654 ) ) ( HOIST-AT ?auto_17668 ?auto_17662 ) ( AVAILABLE ?auto_17668 ) ( SURFACE-AT ?auto_17640 ?auto_17662 ) ( ON ?auto_17640 ?auto_17679 ) ( CLEAR ?auto_17640 ) ( TRUCK-AT ?auto_17656 ?auto_17654 ) ( not ( = ?auto_17639 ?auto_17640 ) ) ( not ( = ?auto_17639 ?auto_17679 ) ) ( not ( = ?auto_17640 ?auto_17679 ) ) ( not ( = ?auto_17657 ?auto_17668 ) ) ( not ( = ?auto_17639 ?auto_17641 ) ) ( not ( = ?auto_17639 ?auto_17669 ) ) ( not ( = ?auto_17641 ?auto_17679 ) ) ( not ( = ?auto_17671 ?auto_17662 ) ) ( not ( = ?auto_17666 ?auto_17668 ) ) ( not ( = ?auto_17669 ?auto_17679 ) ) ( not ( = ?auto_17639 ?auto_17642 ) ) ( not ( = ?auto_17639 ?auto_17685 ) ) ( not ( = ?auto_17640 ?auto_17642 ) ) ( not ( = ?auto_17640 ?auto_17685 ) ) ( not ( = ?auto_17642 ?auto_17669 ) ) ( not ( = ?auto_17642 ?auto_17679 ) ) ( not ( = ?auto_17685 ?auto_17669 ) ) ( not ( = ?auto_17685 ?auto_17679 ) ) ( not ( = ?auto_17639 ?auto_17643 ) ) ( not ( = ?auto_17639 ?auto_17663 ) ) ( not ( = ?auto_17640 ?auto_17643 ) ) ( not ( = ?auto_17640 ?auto_17663 ) ) ( not ( = ?auto_17641 ?auto_17643 ) ) ( not ( = ?auto_17641 ?auto_17663 ) ) ( not ( = ?auto_17643 ?auto_17685 ) ) ( not ( = ?auto_17643 ?auto_17669 ) ) ( not ( = ?auto_17643 ?auto_17679 ) ) ( not ( = ?auto_17653 ?auto_17671 ) ) ( not ( = ?auto_17653 ?auto_17662 ) ) ( not ( = ?auto_17655 ?auto_17666 ) ) ( not ( = ?auto_17655 ?auto_17668 ) ) ( not ( = ?auto_17663 ?auto_17685 ) ) ( not ( = ?auto_17663 ?auto_17669 ) ) ( not ( = ?auto_17663 ?auto_17679 ) ) ( not ( = ?auto_17639 ?auto_17646 ) ) ( not ( = ?auto_17639 ?auto_17674 ) ) ( not ( = ?auto_17640 ?auto_17646 ) ) ( not ( = ?auto_17640 ?auto_17674 ) ) ( not ( = ?auto_17641 ?auto_17646 ) ) ( not ( = ?auto_17641 ?auto_17674 ) ) ( not ( = ?auto_17642 ?auto_17646 ) ) ( not ( = ?auto_17642 ?auto_17674 ) ) ( not ( = ?auto_17646 ?auto_17663 ) ) ( not ( = ?auto_17646 ?auto_17685 ) ) ( not ( = ?auto_17646 ?auto_17669 ) ) ( not ( = ?auto_17646 ?auto_17679 ) ) ( not ( = ?auto_17678 ?auto_17653 ) ) ( not ( = ?auto_17678 ?auto_17671 ) ) ( not ( = ?auto_17678 ?auto_17662 ) ) ( not ( = ?auto_17673 ?auto_17655 ) ) ( not ( = ?auto_17673 ?auto_17666 ) ) ( not ( = ?auto_17673 ?auto_17668 ) ) ( not ( = ?auto_17674 ?auto_17663 ) ) ( not ( = ?auto_17674 ?auto_17685 ) ) ( not ( = ?auto_17674 ?auto_17669 ) ) ( not ( = ?auto_17674 ?auto_17679 ) ) ( not ( = ?auto_17639 ?auto_17644 ) ) ( not ( = ?auto_17639 ?auto_17670 ) ) ( not ( = ?auto_17640 ?auto_17644 ) ) ( not ( = ?auto_17640 ?auto_17670 ) ) ( not ( = ?auto_17641 ?auto_17644 ) ) ( not ( = ?auto_17641 ?auto_17670 ) ) ( not ( = ?auto_17642 ?auto_17644 ) ) ( not ( = ?auto_17642 ?auto_17670 ) ) ( not ( = ?auto_17643 ?auto_17644 ) ) ( not ( = ?auto_17643 ?auto_17670 ) ) ( not ( = ?auto_17644 ?auto_17674 ) ) ( not ( = ?auto_17644 ?auto_17663 ) ) ( not ( = ?auto_17644 ?auto_17685 ) ) ( not ( = ?auto_17644 ?auto_17669 ) ) ( not ( = ?auto_17644 ?auto_17679 ) ) ( not ( = ?auto_17680 ?auto_17678 ) ) ( not ( = ?auto_17680 ?auto_17653 ) ) ( not ( = ?auto_17680 ?auto_17671 ) ) ( not ( = ?auto_17680 ?auto_17662 ) ) ( not ( = ?auto_17676 ?auto_17673 ) ) ( not ( = ?auto_17676 ?auto_17655 ) ) ( not ( = ?auto_17676 ?auto_17666 ) ) ( not ( = ?auto_17676 ?auto_17668 ) ) ( not ( = ?auto_17670 ?auto_17674 ) ) ( not ( = ?auto_17670 ?auto_17663 ) ) ( not ( = ?auto_17670 ?auto_17685 ) ) ( not ( = ?auto_17670 ?auto_17669 ) ) ( not ( = ?auto_17670 ?auto_17679 ) ) ( not ( = ?auto_17639 ?auto_17648 ) ) ( not ( = ?auto_17639 ?auto_17667 ) ) ( not ( = ?auto_17640 ?auto_17648 ) ) ( not ( = ?auto_17640 ?auto_17667 ) ) ( not ( = ?auto_17641 ?auto_17648 ) ) ( not ( = ?auto_17641 ?auto_17667 ) ) ( not ( = ?auto_17642 ?auto_17648 ) ) ( not ( = ?auto_17642 ?auto_17667 ) ) ( not ( = ?auto_17643 ?auto_17648 ) ) ( not ( = ?auto_17643 ?auto_17667 ) ) ( not ( = ?auto_17646 ?auto_17648 ) ) ( not ( = ?auto_17646 ?auto_17667 ) ) ( not ( = ?auto_17648 ?auto_17670 ) ) ( not ( = ?auto_17648 ?auto_17674 ) ) ( not ( = ?auto_17648 ?auto_17663 ) ) ( not ( = ?auto_17648 ?auto_17685 ) ) ( not ( = ?auto_17648 ?auto_17669 ) ) ( not ( = ?auto_17648 ?auto_17679 ) ) ( not ( = ?auto_17677 ?auto_17680 ) ) ( not ( = ?auto_17677 ?auto_17678 ) ) ( not ( = ?auto_17677 ?auto_17653 ) ) ( not ( = ?auto_17677 ?auto_17671 ) ) ( not ( = ?auto_17677 ?auto_17662 ) ) ( not ( = ?auto_17684 ?auto_17676 ) ) ( not ( = ?auto_17684 ?auto_17673 ) ) ( not ( = ?auto_17684 ?auto_17655 ) ) ( not ( = ?auto_17684 ?auto_17666 ) ) ( not ( = ?auto_17684 ?auto_17668 ) ) ( not ( = ?auto_17667 ?auto_17670 ) ) ( not ( = ?auto_17667 ?auto_17674 ) ) ( not ( = ?auto_17667 ?auto_17663 ) ) ( not ( = ?auto_17667 ?auto_17685 ) ) ( not ( = ?auto_17667 ?auto_17669 ) ) ( not ( = ?auto_17667 ?auto_17679 ) ) ( not ( = ?auto_17639 ?auto_17647 ) ) ( not ( = ?auto_17639 ?auto_17683 ) ) ( not ( = ?auto_17640 ?auto_17647 ) ) ( not ( = ?auto_17640 ?auto_17683 ) ) ( not ( = ?auto_17641 ?auto_17647 ) ) ( not ( = ?auto_17641 ?auto_17683 ) ) ( not ( = ?auto_17642 ?auto_17647 ) ) ( not ( = ?auto_17642 ?auto_17683 ) ) ( not ( = ?auto_17643 ?auto_17647 ) ) ( not ( = ?auto_17643 ?auto_17683 ) ) ( not ( = ?auto_17646 ?auto_17647 ) ) ( not ( = ?auto_17646 ?auto_17683 ) ) ( not ( = ?auto_17644 ?auto_17647 ) ) ( not ( = ?auto_17644 ?auto_17683 ) ) ( not ( = ?auto_17647 ?auto_17667 ) ) ( not ( = ?auto_17647 ?auto_17670 ) ) ( not ( = ?auto_17647 ?auto_17674 ) ) ( not ( = ?auto_17647 ?auto_17663 ) ) ( not ( = ?auto_17647 ?auto_17685 ) ) ( not ( = ?auto_17647 ?auto_17669 ) ) ( not ( = ?auto_17647 ?auto_17679 ) ) ( not ( = ?auto_17683 ?auto_17667 ) ) ( not ( = ?auto_17683 ?auto_17670 ) ) ( not ( = ?auto_17683 ?auto_17674 ) ) ( not ( = ?auto_17683 ?auto_17663 ) ) ( not ( = ?auto_17683 ?auto_17685 ) ) ( not ( = ?auto_17683 ?auto_17669 ) ) ( not ( = ?auto_17683 ?auto_17679 ) ) ( not ( = ?auto_17639 ?auto_17645 ) ) ( not ( = ?auto_17639 ?auto_17660 ) ) ( not ( = ?auto_17640 ?auto_17645 ) ) ( not ( = ?auto_17640 ?auto_17660 ) ) ( not ( = ?auto_17641 ?auto_17645 ) ) ( not ( = ?auto_17641 ?auto_17660 ) ) ( not ( = ?auto_17642 ?auto_17645 ) ) ( not ( = ?auto_17642 ?auto_17660 ) ) ( not ( = ?auto_17643 ?auto_17645 ) ) ( not ( = ?auto_17643 ?auto_17660 ) ) ( not ( = ?auto_17646 ?auto_17645 ) ) ( not ( = ?auto_17646 ?auto_17660 ) ) ( not ( = ?auto_17644 ?auto_17645 ) ) ( not ( = ?auto_17644 ?auto_17660 ) ) ( not ( = ?auto_17648 ?auto_17645 ) ) ( not ( = ?auto_17648 ?auto_17660 ) ) ( not ( = ?auto_17645 ?auto_17683 ) ) ( not ( = ?auto_17645 ?auto_17667 ) ) ( not ( = ?auto_17645 ?auto_17670 ) ) ( not ( = ?auto_17645 ?auto_17674 ) ) ( not ( = ?auto_17645 ?auto_17663 ) ) ( not ( = ?auto_17645 ?auto_17685 ) ) ( not ( = ?auto_17645 ?auto_17669 ) ) ( not ( = ?auto_17645 ?auto_17679 ) ) ( not ( = ?auto_17659 ?auto_17677 ) ) ( not ( = ?auto_17659 ?auto_17680 ) ) ( not ( = ?auto_17659 ?auto_17678 ) ) ( not ( = ?auto_17659 ?auto_17653 ) ) ( not ( = ?auto_17659 ?auto_17671 ) ) ( not ( = ?auto_17659 ?auto_17662 ) ) ( not ( = ?auto_17675 ?auto_17684 ) ) ( not ( = ?auto_17675 ?auto_17676 ) ) ( not ( = ?auto_17675 ?auto_17673 ) ) ( not ( = ?auto_17675 ?auto_17655 ) ) ( not ( = ?auto_17675 ?auto_17666 ) ) ( not ( = ?auto_17675 ?auto_17668 ) ) ( not ( = ?auto_17660 ?auto_17683 ) ) ( not ( = ?auto_17660 ?auto_17667 ) ) ( not ( = ?auto_17660 ?auto_17670 ) ) ( not ( = ?auto_17660 ?auto_17674 ) ) ( not ( = ?auto_17660 ?auto_17663 ) ) ( not ( = ?auto_17660 ?auto_17685 ) ) ( not ( = ?auto_17660 ?auto_17669 ) ) ( not ( = ?auto_17660 ?auto_17679 ) ) ( not ( = ?auto_17639 ?auto_17650 ) ) ( not ( = ?auto_17639 ?auto_17682 ) ) ( not ( = ?auto_17640 ?auto_17650 ) ) ( not ( = ?auto_17640 ?auto_17682 ) ) ( not ( = ?auto_17641 ?auto_17650 ) ) ( not ( = ?auto_17641 ?auto_17682 ) ) ( not ( = ?auto_17642 ?auto_17650 ) ) ( not ( = ?auto_17642 ?auto_17682 ) ) ( not ( = ?auto_17643 ?auto_17650 ) ) ( not ( = ?auto_17643 ?auto_17682 ) ) ( not ( = ?auto_17646 ?auto_17650 ) ) ( not ( = ?auto_17646 ?auto_17682 ) ) ( not ( = ?auto_17644 ?auto_17650 ) ) ( not ( = ?auto_17644 ?auto_17682 ) ) ( not ( = ?auto_17648 ?auto_17650 ) ) ( not ( = ?auto_17648 ?auto_17682 ) ) ( not ( = ?auto_17647 ?auto_17650 ) ) ( not ( = ?auto_17647 ?auto_17682 ) ) ( not ( = ?auto_17650 ?auto_17660 ) ) ( not ( = ?auto_17650 ?auto_17683 ) ) ( not ( = ?auto_17650 ?auto_17667 ) ) ( not ( = ?auto_17650 ?auto_17670 ) ) ( not ( = ?auto_17650 ?auto_17674 ) ) ( not ( = ?auto_17650 ?auto_17663 ) ) ( not ( = ?auto_17650 ?auto_17685 ) ) ( not ( = ?auto_17650 ?auto_17669 ) ) ( not ( = ?auto_17650 ?auto_17679 ) ) ( not ( = ?auto_17665 ?auto_17659 ) ) ( not ( = ?auto_17665 ?auto_17677 ) ) ( not ( = ?auto_17665 ?auto_17680 ) ) ( not ( = ?auto_17665 ?auto_17678 ) ) ( not ( = ?auto_17665 ?auto_17653 ) ) ( not ( = ?auto_17665 ?auto_17671 ) ) ( not ( = ?auto_17665 ?auto_17662 ) ) ( not ( = ?auto_17686 ?auto_17675 ) ) ( not ( = ?auto_17686 ?auto_17684 ) ) ( not ( = ?auto_17686 ?auto_17676 ) ) ( not ( = ?auto_17686 ?auto_17673 ) ) ( not ( = ?auto_17686 ?auto_17655 ) ) ( not ( = ?auto_17686 ?auto_17666 ) ) ( not ( = ?auto_17686 ?auto_17668 ) ) ( not ( = ?auto_17682 ?auto_17660 ) ) ( not ( = ?auto_17682 ?auto_17683 ) ) ( not ( = ?auto_17682 ?auto_17667 ) ) ( not ( = ?auto_17682 ?auto_17670 ) ) ( not ( = ?auto_17682 ?auto_17674 ) ) ( not ( = ?auto_17682 ?auto_17663 ) ) ( not ( = ?auto_17682 ?auto_17685 ) ) ( not ( = ?auto_17682 ?auto_17669 ) ) ( not ( = ?auto_17682 ?auto_17679 ) ) ( not ( = ?auto_17639 ?auto_17649 ) ) ( not ( = ?auto_17639 ?auto_17664 ) ) ( not ( = ?auto_17640 ?auto_17649 ) ) ( not ( = ?auto_17640 ?auto_17664 ) ) ( not ( = ?auto_17641 ?auto_17649 ) ) ( not ( = ?auto_17641 ?auto_17664 ) ) ( not ( = ?auto_17642 ?auto_17649 ) ) ( not ( = ?auto_17642 ?auto_17664 ) ) ( not ( = ?auto_17643 ?auto_17649 ) ) ( not ( = ?auto_17643 ?auto_17664 ) ) ( not ( = ?auto_17646 ?auto_17649 ) ) ( not ( = ?auto_17646 ?auto_17664 ) ) ( not ( = ?auto_17644 ?auto_17649 ) ) ( not ( = ?auto_17644 ?auto_17664 ) ) ( not ( = ?auto_17648 ?auto_17649 ) ) ( not ( = ?auto_17648 ?auto_17664 ) ) ( not ( = ?auto_17647 ?auto_17649 ) ) ( not ( = ?auto_17647 ?auto_17664 ) ) ( not ( = ?auto_17645 ?auto_17649 ) ) ( not ( = ?auto_17645 ?auto_17664 ) ) ( not ( = ?auto_17649 ?auto_17682 ) ) ( not ( = ?auto_17649 ?auto_17660 ) ) ( not ( = ?auto_17649 ?auto_17683 ) ) ( not ( = ?auto_17649 ?auto_17667 ) ) ( not ( = ?auto_17649 ?auto_17670 ) ) ( not ( = ?auto_17649 ?auto_17674 ) ) ( not ( = ?auto_17649 ?auto_17663 ) ) ( not ( = ?auto_17649 ?auto_17685 ) ) ( not ( = ?auto_17649 ?auto_17669 ) ) ( not ( = ?auto_17649 ?auto_17679 ) ) ( not ( = ?auto_17661 ?auto_17665 ) ) ( not ( = ?auto_17661 ?auto_17659 ) ) ( not ( = ?auto_17661 ?auto_17677 ) ) ( not ( = ?auto_17661 ?auto_17680 ) ) ( not ( = ?auto_17661 ?auto_17678 ) ) ( not ( = ?auto_17661 ?auto_17653 ) ) ( not ( = ?auto_17661 ?auto_17671 ) ) ( not ( = ?auto_17661 ?auto_17662 ) ) ( not ( = ?auto_17672 ?auto_17686 ) ) ( not ( = ?auto_17672 ?auto_17675 ) ) ( not ( = ?auto_17672 ?auto_17684 ) ) ( not ( = ?auto_17672 ?auto_17676 ) ) ( not ( = ?auto_17672 ?auto_17673 ) ) ( not ( = ?auto_17672 ?auto_17655 ) ) ( not ( = ?auto_17672 ?auto_17666 ) ) ( not ( = ?auto_17672 ?auto_17668 ) ) ( not ( = ?auto_17664 ?auto_17682 ) ) ( not ( = ?auto_17664 ?auto_17660 ) ) ( not ( = ?auto_17664 ?auto_17683 ) ) ( not ( = ?auto_17664 ?auto_17667 ) ) ( not ( = ?auto_17664 ?auto_17670 ) ) ( not ( = ?auto_17664 ?auto_17674 ) ) ( not ( = ?auto_17664 ?auto_17663 ) ) ( not ( = ?auto_17664 ?auto_17685 ) ) ( not ( = ?auto_17664 ?auto_17669 ) ) ( not ( = ?auto_17664 ?auto_17679 ) ) ( not ( = ?auto_17639 ?auto_17651 ) ) ( not ( = ?auto_17639 ?auto_17681 ) ) ( not ( = ?auto_17640 ?auto_17651 ) ) ( not ( = ?auto_17640 ?auto_17681 ) ) ( not ( = ?auto_17641 ?auto_17651 ) ) ( not ( = ?auto_17641 ?auto_17681 ) ) ( not ( = ?auto_17642 ?auto_17651 ) ) ( not ( = ?auto_17642 ?auto_17681 ) ) ( not ( = ?auto_17643 ?auto_17651 ) ) ( not ( = ?auto_17643 ?auto_17681 ) ) ( not ( = ?auto_17646 ?auto_17651 ) ) ( not ( = ?auto_17646 ?auto_17681 ) ) ( not ( = ?auto_17644 ?auto_17651 ) ) ( not ( = ?auto_17644 ?auto_17681 ) ) ( not ( = ?auto_17648 ?auto_17651 ) ) ( not ( = ?auto_17648 ?auto_17681 ) ) ( not ( = ?auto_17647 ?auto_17651 ) ) ( not ( = ?auto_17647 ?auto_17681 ) ) ( not ( = ?auto_17645 ?auto_17651 ) ) ( not ( = ?auto_17645 ?auto_17681 ) ) ( not ( = ?auto_17650 ?auto_17651 ) ) ( not ( = ?auto_17650 ?auto_17681 ) ) ( not ( = ?auto_17651 ?auto_17664 ) ) ( not ( = ?auto_17651 ?auto_17682 ) ) ( not ( = ?auto_17651 ?auto_17660 ) ) ( not ( = ?auto_17651 ?auto_17683 ) ) ( not ( = ?auto_17651 ?auto_17667 ) ) ( not ( = ?auto_17651 ?auto_17670 ) ) ( not ( = ?auto_17651 ?auto_17674 ) ) ( not ( = ?auto_17651 ?auto_17663 ) ) ( not ( = ?auto_17651 ?auto_17685 ) ) ( not ( = ?auto_17651 ?auto_17669 ) ) ( not ( = ?auto_17651 ?auto_17679 ) ) ( not ( = ?auto_17681 ?auto_17664 ) ) ( not ( = ?auto_17681 ?auto_17682 ) ) ( not ( = ?auto_17681 ?auto_17660 ) ) ( not ( = ?auto_17681 ?auto_17683 ) ) ( not ( = ?auto_17681 ?auto_17667 ) ) ( not ( = ?auto_17681 ?auto_17670 ) ) ( not ( = ?auto_17681 ?auto_17674 ) ) ( not ( = ?auto_17681 ?auto_17663 ) ) ( not ( = ?auto_17681 ?auto_17685 ) ) ( not ( = ?auto_17681 ?auto_17669 ) ) ( not ( = ?auto_17681 ?auto_17679 ) ) ( not ( = ?auto_17639 ?auto_17652 ) ) ( not ( = ?auto_17639 ?auto_17658 ) ) ( not ( = ?auto_17640 ?auto_17652 ) ) ( not ( = ?auto_17640 ?auto_17658 ) ) ( not ( = ?auto_17641 ?auto_17652 ) ) ( not ( = ?auto_17641 ?auto_17658 ) ) ( not ( = ?auto_17642 ?auto_17652 ) ) ( not ( = ?auto_17642 ?auto_17658 ) ) ( not ( = ?auto_17643 ?auto_17652 ) ) ( not ( = ?auto_17643 ?auto_17658 ) ) ( not ( = ?auto_17646 ?auto_17652 ) ) ( not ( = ?auto_17646 ?auto_17658 ) ) ( not ( = ?auto_17644 ?auto_17652 ) ) ( not ( = ?auto_17644 ?auto_17658 ) ) ( not ( = ?auto_17648 ?auto_17652 ) ) ( not ( = ?auto_17648 ?auto_17658 ) ) ( not ( = ?auto_17647 ?auto_17652 ) ) ( not ( = ?auto_17647 ?auto_17658 ) ) ( not ( = ?auto_17645 ?auto_17652 ) ) ( not ( = ?auto_17645 ?auto_17658 ) ) ( not ( = ?auto_17650 ?auto_17652 ) ) ( not ( = ?auto_17650 ?auto_17658 ) ) ( not ( = ?auto_17649 ?auto_17652 ) ) ( not ( = ?auto_17649 ?auto_17658 ) ) ( not ( = ?auto_17652 ?auto_17681 ) ) ( not ( = ?auto_17652 ?auto_17664 ) ) ( not ( = ?auto_17652 ?auto_17682 ) ) ( not ( = ?auto_17652 ?auto_17660 ) ) ( not ( = ?auto_17652 ?auto_17683 ) ) ( not ( = ?auto_17652 ?auto_17667 ) ) ( not ( = ?auto_17652 ?auto_17670 ) ) ( not ( = ?auto_17652 ?auto_17674 ) ) ( not ( = ?auto_17652 ?auto_17663 ) ) ( not ( = ?auto_17652 ?auto_17685 ) ) ( not ( = ?auto_17652 ?auto_17669 ) ) ( not ( = ?auto_17652 ?auto_17679 ) ) ( not ( = ?auto_17658 ?auto_17681 ) ) ( not ( = ?auto_17658 ?auto_17664 ) ) ( not ( = ?auto_17658 ?auto_17682 ) ) ( not ( = ?auto_17658 ?auto_17660 ) ) ( not ( = ?auto_17658 ?auto_17683 ) ) ( not ( = ?auto_17658 ?auto_17667 ) ) ( not ( = ?auto_17658 ?auto_17670 ) ) ( not ( = ?auto_17658 ?auto_17674 ) ) ( not ( = ?auto_17658 ?auto_17663 ) ) ( not ( = ?auto_17658 ?auto_17685 ) ) ( not ( = ?auto_17658 ?auto_17669 ) ) ( not ( = ?auto_17658 ?auto_17679 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_17639 ?auto_17640 ?auto_17641 ?auto_17642 ?auto_17643 ?auto_17646 ?auto_17644 ?auto_17648 ?auto_17647 ?auto_17645 ?auto_17650 ?auto_17649 ?auto_17651 )
      ( MAKE-1CRATE ?auto_17651 ?auto_17652 )
      ( MAKE-13CRATE-VERIFY ?auto_17639 ?auto_17640 ?auto_17641 ?auto_17642 ?auto_17643 ?auto_17646 ?auto_17644 ?auto_17648 ?auto_17647 ?auto_17645 ?auto_17650 ?auto_17649 ?auto_17651 ?auto_17652 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17689 - SURFACE
      ?auto_17690 - SURFACE
    )
    :vars
    (
      ?auto_17691 - HOIST
      ?auto_17692 - PLACE
      ?auto_17694 - PLACE
      ?auto_17695 - HOIST
      ?auto_17696 - SURFACE
      ?auto_17693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17691 ?auto_17692 ) ( SURFACE-AT ?auto_17689 ?auto_17692 ) ( CLEAR ?auto_17689 ) ( IS-CRATE ?auto_17690 ) ( AVAILABLE ?auto_17691 ) ( not ( = ?auto_17694 ?auto_17692 ) ) ( HOIST-AT ?auto_17695 ?auto_17694 ) ( AVAILABLE ?auto_17695 ) ( SURFACE-AT ?auto_17690 ?auto_17694 ) ( ON ?auto_17690 ?auto_17696 ) ( CLEAR ?auto_17690 ) ( TRUCK-AT ?auto_17693 ?auto_17692 ) ( not ( = ?auto_17689 ?auto_17690 ) ) ( not ( = ?auto_17689 ?auto_17696 ) ) ( not ( = ?auto_17690 ?auto_17696 ) ) ( not ( = ?auto_17691 ?auto_17695 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17693 ?auto_17692 ?auto_17694 )
      ( !LIFT ?auto_17695 ?auto_17690 ?auto_17696 ?auto_17694 )
      ( !LOAD ?auto_17695 ?auto_17690 ?auto_17693 ?auto_17694 )
      ( !DRIVE ?auto_17693 ?auto_17694 ?auto_17692 )
      ( !UNLOAD ?auto_17691 ?auto_17690 ?auto_17693 ?auto_17692 )
      ( !DROP ?auto_17691 ?auto_17690 ?auto_17689 ?auto_17692 )
      ( MAKE-1CRATE-VERIFY ?auto_17689 ?auto_17690 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_17712 - SURFACE
      ?auto_17713 - SURFACE
      ?auto_17714 - SURFACE
      ?auto_17715 - SURFACE
      ?auto_17716 - SURFACE
      ?auto_17719 - SURFACE
      ?auto_17717 - SURFACE
      ?auto_17721 - SURFACE
      ?auto_17720 - SURFACE
      ?auto_17718 - SURFACE
      ?auto_17723 - SURFACE
      ?auto_17722 - SURFACE
      ?auto_17724 - SURFACE
      ?auto_17725 - SURFACE
      ?auto_17726 - SURFACE
    )
    :vars
    (
      ?auto_17730 - HOIST
      ?auto_17728 - PLACE
      ?auto_17731 - PLACE
      ?auto_17729 - HOIST
      ?auto_17732 - SURFACE
      ?auto_17733 - PLACE
      ?auto_17761 - HOIST
      ?auto_17758 - SURFACE
      ?auto_17748 - SURFACE
      ?auto_17759 - SURFACE
      ?auto_17749 - PLACE
      ?auto_17734 - HOIST
      ?auto_17742 - SURFACE
      ?auto_17755 - PLACE
      ?auto_17751 - HOIST
      ?auto_17746 - SURFACE
      ?auto_17739 - PLACE
      ?auto_17756 - HOIST
      ?auto_17738 - SURFACE
      ?auto_17747 - SURFACE
      ?auto_17750 - PLACE
      ?auto_17741 - HOIST
      ?auto_17735 - SURFACE
      ?auto_17743 - PLACE
      ?auto_17757 - HOIST
      ?auto_17753 - SURFACE
      ?auto_17745 - SURFACE
      ?auto_17752 - PLACE
      ?auto_17740 - HOIST
      ?auto_17737 - SURFACE
      ?auto_17754 - SURFACE
      ?auto_17744 - PLACE
      ?auto_17736 - HOIST
      ?auto_17760 - SURFACE
      ?auto_17727 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17730 ?auto_17728 ) ( IS-CRATE ?auto_17726 ) ( not ( = ?auto_17731 ?auto_17728 ) ) ( HOIST-AT ?auto_17729 ?auto_17731 ) ( SURFACE-AT ?auto_17726 ?auto_17731 ) ( ON ?auto_17726 ?auto_17732 ) ( CLEAR ?auto_17726 ) ( not ( = ?auto_17725 ?auto_17726 ) ) ( not ( = ?auto_17725 ?auto_17732 ) ) ( not ( = ?auto_17726 ?auto_17732 ) ) ( not ( = ?auto_17730 ?auto_17729 ) ) ( IS-CRATE ?auto_17725 ) ( not ( = ?auto_17733 ?auto_17728 ) ) ( HOIST-AT ?auto_17761 ?auto_17733 ) ( SURFACE-AT ?auto_17725 ?auto_17733 ) ( ON ?auto_17725 ?auto_17758 ) ( CLEAR ?auto_17725 ) ( not ( = ?auto_17724 ?auto_17725 ) ) ( not ( = ?auto_17724 ?auto_17758 ) ) ( not ( = ?auto_17725 ?auto_17758 ) ) ( not ( = ?auto_17730 ?auto_17761 ) ) ( IS-CRATE ?auto_17724 ) ( SURFACE-AT ?auto_17724 ?auto_17733 ) ( ON ?auto_17724 ?auto_17748 ) ( CLEAR ?auto_17724 ) ( not ( = ?auto_17722 ?auto_17724 ) ) ( not ( = ?auto_17722 ?auto_17748 ) ) ( not ( = ?auto_17724 ?auto_17748 ) ) ( IS-CRATE ?auto_17722 ) ( AVAILABLE ?auto_17729 ) ( SURFACE-AT ?auto_17722 ?auto_17731 ) ( ON ?auto_17722 ?auto_17759 ) ( CLEAR ?auto_17722 ) ( not ( = ?auto_17723 ?auto_17722 ) ) ( not ( = ?auto_17723 ?auto_17759 ) ) ( not ( = ?auto_17722 ?auto_17759 ) ) ( IS-CRATE ?auto_17723 ) ( not ( = ?auto_17749 ?auto_17728 ) ) ( HOIST-AT ?auto_17734 ?auto_17749 ) ( AVAILABLE ?auto_17734 ) ( SURFACE-AT ?auto_17723 ?auto_17749 ) ( ON ?auto_17723 ?auto_17742 ) ( CLEAR ?auto_17723 ) ( not ( = ?auto_17718 ?auto_17723 ) ) ( not ( = ?auto_17718 ?auto_17742 ) ) ( not ( = ?auto_17723 ?auto_17742 ) ) ( not ( = ?auto_17730 ?auto_17734 ) ) ( IS-CRATE ?auto_17718 ) ( not ( = ?auto_17755 ?auto_17728 ) ) ( HOIST-AT ?auto_17751 ?auto_17755 ) ( AVAILABLE ?auto_17751 ) ( SURFACE-AT ?auto_17718 ?auto_17755 ) ( ON ?auto_17718 ?auto_17746 ) ( CLEAR ?auto_17718 ) ( not ( = ?auto_17720 ?auto_17718 ) ) ( not ( = ?auto_17720 ?auto_17746 ) ) ( not ( = ?auto_17718 ?auto_17746 ) ) ( not ( = ?auto_17730 ?auto_17751 ) ) ( IS-CRATE ?auto_17720 ) ( not ( = ?auto_17739 ?auto_17728 ) ) ( HOIST-AT ?auto_17756 ?auto_17739 ) ( SURFACE-AT ?auto_17720 ?auto_17739 ) ( ON ?auto_17720 ?auto_17738 ) ( CLEAR ?auto_17720 ) ( not ( = ?auto_17721 ?auto_17720 ) ) ( not ( = ?auto_17721 ?auto_17738 ) ) ( not ( = ?auto_17720 ?auto_17738 ) ) ( not ( = ?auto_17730 ?auto_17756 ) ) ( IS-CRATE ?auto_17721 ) ( AVAILABLE ?auto_17756 ) ( SURFACE-AT ?auto_17721 ?auto_17739 ) ( ON ?auto_17721 ?auto_17747 ) ( CLEAR ?auto_17721 ) ( not ( = ?auto_17717 ?auto_17721 ) ) ( not ( = ?auto_17717 ?auto_17747 ) ) ( not ( = ?auto_17721 ?auto_17747 ) ) ( IS-CRATE ?auto_17717 ) ( not ( = ?auto_17750 ?auto_17728 ) ) ( HOIST-AT ?auto_17741 ?auto_17750 ) ( AVAILABLE ?auto_17741 ) ( SURFACE-AT ?auto_17717 ?auto_17750 ) ( ON ?auto_17717 ?auto_17735 ) ( CLEAR ?auto_17717 ) ( not ( = ?auto_17719 ?auto_17717 ) ) ( not ( = ?auto_17719 ?auto_17735 ) ) ( not ( = ?auto_17717 ?auto_17735 ) ) ( not ( = ?auto_17730 ?auto_17741 ) ) ( IS-CRATE ?auto_17719 ) ( not ( = ?auto_17743 ?auto_17728 ) ) ( HOIST-AT ?auto_17757 ?auto_17743 ) ( AVAILABLE ?auto_17757 ) ( SURFACE-AT ?auto_17719 ?auto_17743 ) ( ON ?auto_17719 ?auto_17753 ) ( CLEAR ?auto_17719 ) ( not ( = ?auto_17716 ?auto_17719 ) ) ( not ( = ?auto_17716 ?auto_17753 ) ) ( not ( = ?auto_17719 ?auto_17753 ) ) ( not ( = ?auto_17730 ?auto_17757 ) ) ( IS-CRATE ?auto_17716 ) ( AVAILABLE ?auto_17761 ) ( SURFACE-AT ?auto_17716 ?auto_17733 ) ( ON ?auto_17716 ?auto_17745 ) ( CLEAR ?auto_17716 ) ( not ( = ?auto_17715 ?auto_17716 ) ) ( not ( = ?auto_17715 ?auto_17745 ) ) ( not ( = ?auto_17716 ?auto_17745 ) ) ( IS-CRATE ?auto_17715 ) ( not ( = ?auto_17752 ?auto_17728 ) ) ( HOIST-AT ?auto_17740 ?auto_17752 ) ( SURFACE-AT ?auto_17715 ?auto_17752 ) ( ON ?auto_17715 ?auto_17737 ) ( CLEAR ?auto_17715 ) ( not ( = ?auto_17714 ?auto_17715 ) ) ( not ( = ?auto_17714 ?auto_17737 ) ) ( not ( = ?auto_17715 ?auto_17737 ) ) ( not ( = ?auto_17730 ?auto_17740 ) ) ( IS-CRATE ?auto_17714 ) ( AVAILABLE ?auto_17740 ) ( SURFACE-AT ?auto_17714 ?auto_17752 ) ( ON ?auto_17714 ?auto_17754 ) ( CLEAR ?auto_17714 ) ( not ( = ?auto_17713 ?auto_17714 ) ) ( not ( = ?auto_17713 ?auto_17754 ) ) ( not ( = ?auto_17714 ?auto_17754 ) ) ( SURFACE-AT ?auto_17712 ?auto_17728 ) ( CLEAR ?auto_17712 ) ( IS-CRATE ?auto_17713 ) ( AVAILABLE ?auto_17730 ) ( not ( = ?auto_17744 ?auto_17728 ) ) ( HOIST-AT ?auto_17736 ?auto_17744 ) ( AVAILABLE ?auto_17736 ) ( SURFACE-AT ?auto_17713 ?auto_17744 ) ( ON ?auto_17713 ?auto_17760 ) ( CLEAR ?auto_17713 ) ( TRUCK-AT ?auto_17727 ?auto_17728 ) ( not ( = ?auto_17712 ?auto_17713 ) ) ( not ( = ?auto_17712 ?auto_17760 ) ) ( not ( = ?auto_17713 ?auto_17760 ) ) ( not ( = ?auto_17730 ?auto_17736 ) ) ( not ( = ?auto_17712 ?auto_17714 ) ) ( not ( = ?auto_17712 ?auto_17754 ) ) ( not ( = ?auto_17714 ?auto_17760 ) ) ( not ( = ?auto_17752 ?auto_17744 ) ) ( not ( = ?auto_17740 ?auto_17736 ) ) ( not ( = ?auto_17754 ?auto_17760 ) ) ( not ( = ?auto_17712 ?auto_17715 ) ) ( not ( = ?auto_17712 ?auto_17737 ) ) ( not ( = ?auto_17713 ?auto_17715 ) ) ( not ( = ?auto_17713 ?auto_17737 ) ) ( not ( = ?auto_17715 ?auto_17754 ) ) ( not ( = ?auto_17715 ?auto_17760 ) ) ( not ( = ?auto_17737 ?auto_17754 ) ) ( not ( = ?auto_17737 ?auto_17760 ) ) ( not ( = ?auto_17712 ?auto_17716 ) ) ( not ( = ?auto_17712 ?auto_17745 ) ) ( not ( = ?auto_17713 ?auto_17716 ) ) ( not ( = ?auto_17713 ?auto_17745 ) ) ( not ( = ?auto_17714 ?auto_17716 ) ) ( not ( = ?auto_17714 ?auto_17745 ) ) ( not ( = ?auto_17716 ?auto_17737 ) ) ( not ( = ?auto_17716 ?auto_17754 ) ) ( not ( = ?auto_17716 ?auto_17760 ) ) ( not ( = ?auto_17733 ?auto_17752 ) ) ( not ( = ?auto_17733 ?auto_17744 ) ) ( not ( = ?auto_17761 ?auto_17740 ) ) ( not ( = ?auto_17761 ?auto_17736 ) ) ( not ( = ?auto_17745 ?auto_17737 ) ) ( not ( = ?auto_17745 ?auto_17754 ) ) ( not ( = ?auto_17745 ?auto_17760 ) ) ( not ( = ?auto_17712 ?auto_17719 ) ) ( not ( = ?auto_17712 ?auto_17753 ) ) ( not ( = ?auto_17713 ?auto_17719 ) ) ( not ( = ?auto_17713 ?auto_17753 ) ) ( not ( = ?auto_17714 ?auto_17719 ) ) ( not ( = ?auto_17714 ?auto_17753 ) ) ( not ( = ?auto_17715 ?auto_17719 ) ) ( not ( = ?auto_17715 ?auto_17753 ) ) ( not ( = ?auto_17719 ?auto_17745 ) ) ( not ( = ?auto_17719 ?auto_17737 ) ) ( not ( = ?auto_17719 ?auto_17754 ) ) ( not ( = ?auto_17719 ?auto_17760 ) ) ( not ( = ?auto_17743 ?auto_17733 ) ) ( not ( = ?auto_17743 ?auto_17752 ) ) ( not ( = ?auto_17743 ?auto_17744 ) ) ( not ( = ?auto_17757 ?auto_17761 ) ) ( not ( = ?auto_17757 ?auto_17740 ) ) ( not ( = ?auto_17757 ?auto_17736 ) ) ( not ( = ?auto_17753 ?auto_17745 ) ) ( not ( = ?auto_17753 ?auto_17737 ) ) ( not ( = ?auto_17753 ?auto_17754 ) ) ( not ( = ?auto_17753 ?auto_17760 ) ) ( not ( = ?auto_17712 ?auto_17717 ) ) ( not ( = ?auto_17712 ?auto_17735 ) ) ( not ( = ?auto_17713 ?auto_17717 ) ) ( not ( = ?auto_17713 ?auto_17735 ) ) ( not ( = ?auto_17714 ?auto_17717 ) ) ( not ( = ?auto_17714 ?auto_17735 ) ) ( not ( = ?auto_17715 ?auto_17717 ) ) ( not ( = ?auto_17715 ?auto_17735 ) ) ( not ( = ?auto_17716 ?auto_17717 ) ) ( not ( = ?auto_17716 ?auto_17735 ) ) ( not ( = ?auto_17717 ?auto_17753 ) ) ( not ( = ?auto_17717 ?auto_17745 ) ) ( not ( = ?auto_17717 ?auto_17737 ) ) ( not ( = ?auto_17717 ?auto_17754 ) ) ( not ( = ?auto_17717 ?auto_17760 ) ) ( not ( = ?auto_17750 ?auto_17743 ) ) ( not ( = ?auto_17750 ?auto_17733 ) ) ( not ( = ?auto_17750 ?auto_17752 ) ) ( not ( = ?auto_17750 ?auto_17744 ) ) ( not ( = ?auto_17741 ?auto_17757 ) ) ( not ( = ?auto_17741 ?auto_17761 ) ) ( not ( = ?auto_17741 ?auto_17740 ) ) ( not ( = ?auto_17741 ?auto_17736 ) ) ( not ( = ?auto_17735 ?auto_17753 ) ) ( not ( = ?auto_17735 ?auto_17745 ) ) ( not ( = ?auto_17735 ?auto_17737 ) ) ( not ( = ?auto_17735 ?auto_17754 ) ) ( not ( = ?auto_17735 ?auto_17760 ) ) ( not ( = ?auto_17712 ?auto_17721 ) ) ( not ( = ?auto_17712 ?auto_17747 ) ) ( not ( = ?auto_17713 ?auto_17721 ) ) ( not ( = ?auto_17713 ?auto_17747 ) ) ( not ( = ?auto_17714 ?auto_17721 ) ) ( not ( = ?auto_17714 ?auto_17747 ) ) ( not ( = ?auto_17715 ?auto_17721 ) ) ( not ( = ?auto_17715 ?auto_17747 ) ) ( not ( = ?auto_17716 ?auto_17721 ) ) ( not ( = ?auto_17716 ?auto_17747 ) ) ( not ( = ?auto_17719 ?auto_17721 ) ) ( not ( = ?auto_17719 ?auto_17747 ) ) ( not ( = ?auto_17721 ?auto_17735 ) ) ( not ( = ?auto_17721 ?auto_17753 ) ) ( not ( = ?auto_17721 ?auto_17745 ) ) ( not ( = ?auto_17721 ?auto_17737 ) ) ( not ( = ?auto_17721 ?auto_17754 ) ) ( not ( = ?auto_17721 ?auto_17760 ) ) ( not ( = ?auto_17739 ?auto_17750 ) ) ( not ( = ?auto_17739 ?auto_17743 ) ) ( not ( = ?auto_17739 ?auto_17733 ) ) ( not ( = ?auto_17739 ?auto_17752 ) ) ( not ( = ?auto_17739 ?auto_17744 ) ) ( not ( = ?auto_17756 ?auto_17741 ) ) ( not ( = ?auto_17756 ?auto_17757 ) ) ( not ( = ?auto_17756 ?auto_17761 ) ) ( not ( = ?auto_17756 ?auto_17740 ) ) ( not ( = ?auto_17756 ?auto_17736 ) ) ( not ( = ?auto_17747 ?auto_17735 ) ) ( not ( = ?auto_17747 ?auto_17753 ) ) ( not ( = ?auto_17747 ?auto_17745 ) ) ( not ( = ?auto_17747 ?auto_17737 ) ) ( not ( = ?auto_17747 ?auto_17754 ) ) ( not ( = ?auto_17747 ?auto_17760 ) ) ( not ( = ?auto_17712 ?auto_17720 ) ) ( not ( = ?auto_17712 ?auto_17738 ) ) ( not ( = ?auto_17713 ?auto_17720 ) ) ( not ( = ?auto_17713 ?auto_17738 ) ) ( not ( = ?auto_17714 ?auto_17720 ) ) ( not ( = ?auto_17714 ?auto_17738 ) ) ( not ( = ?auto_17715 ?auto_17720 ) ) ( not ( = ?auto_17715 ?auto_17738 ) ) ( not ( = ?auto_17716 ?auto_17720 ) ) ( not ( = ?auto_17716 ?auto_17738 ) ) ( not ( = ?auto_17719 ?auto_17720 ) ) ( not ( = ?auto_17719 ?auto_17738 ) ) ( not ( = ?auto_17717 ?auto_17720 ) ) ( not ( = ?auto_17717 ?auto_17738 ) ) ( not ( = ?auto_17720 ?auto_17747 ) ) ( not ( = ?auto_17720 ?auto_17735 ) ) ( not ( = ?auto_17720 ?auto_17753 ) ) ( not ( = ?auto_17720 ?auto_17745 ) ) ( not ( = ?auto_17720 ?auto_17737 ) ) ( not ( = ?auto_17720 ?auto_17754 ) ) ( not ( = ?auto_17720 ?auto_17760 ) ) ( not ( = ?auto_17738 ?auto_17747 ) ) ( not ( = ?auto_17738 ?auto_17735 ) ) ( not ( = ?auto_17738 ?auto_17753 ) ) ( not ( = ?auto_17738 ?auto_17745 ) ) ( not ( = ?auto_17738 ?auto_17737 ) ) ( not ( = ?auto_17738 ?auto_17754 ) ) ( not ( = ?auto_17738 ?auto_17760 ) ) ( not ( = ?auto_17712 ?auto_17718 ) ) ( not ( = ?auto_17712 ?auto_17746 ) ) ( not ( = ?auto_17713 ?auto_17718 ) ) ( not ( = ?auto_17713 ?auto_17746 ) ) ( not ( = ?auto_17714 ?auto_17718 ) ) ( not ( = ?auto_17714 ?auto_17746 ) ) ( not ( = ?auto_17715 ?auto_17718 ) ) ( not ( = ?auto_17715 ?auto_17746 ) ) ( not ( = ?auto_17716 ?auto_17718 ) ) ( not ( = ?auto_17716 ?auto_17746 ) ) ( not ( = ?auto_17719 ?auto_17718 ) ) ( not ( = ?auto_17719 ?auto_17746 ) ) ( not ( = ?auto_17717 ?auto_17718 ) ) ( not ( = ?auto_17717 ?auto_17746 ) ) ( not ( = ?auto_17721 ?auto_17718 ) ) ( not ( = ?auto_17721 ?auto_17746 ) ) ( not ( = ?auto_17718 ?auto_17738 ) ) ( not ( = ?auto_17718 ?auto_17747 ) ) ( not ( = ?auto_17718 ?auto_17735 ) ) ( not ( = ?auto_17718 ?auto_17753 ) ) ( not ( = ?auto_17718 ?auto_17745 ) ) ( not ( = ?auto_17718 ?auto_17737 ) ) ( not ( = ?auto_17718 ?auto_17754 ) ) ( not ( = ?auto_17718 ?auto_17760 ) ) ( not ( = ?auto_17755 ?auto_17739 ) ) ( not ( = ?auto_17755 ?auto_17750 ) ) ( not ( = ?auto_17755 ?auto_17743 ) ) ( not ( = ?auto_17755 ?auto_17733 ) ) ( not ( = ?auto_17755 ?auto_17752 ) ) ( not ( = ?auto_17755 ?auto_17744 ) ) ( not ( = ?auto_17751 ?auto_17756 ) ) ( not ( = ?auto_17751 ?auto_17741 ) ) ( not ( = ?auto_17751 ?auto_17757 ) ) ( not ( = ?auto_17751 ?auto_17761 ) ) ( not ( = ?auto_17751 ?auto_17740 ) ) ( not ( = ?auto_17751 ?auto_17736 ) ) ( not ( = ?auto_17746 ?auto_17738 ) ) ( not ( = ?auto_17746 ?auto_17747 ) ) ( not ( = ?auto_17746 ?auto_17735 ) ) ( not ( = ?auto_17746 ?auto_17753 ) ) ( not ( = ?auto_17746 ?auto_17745 ) ) ( not ( = ?auto_17746 ?auto_17737 ) ) ( not ( = ?auto_17746 ?auto_17754 ) ) ( not ( = ?auto_17746 ?auto_17760 ) ) ( not ( = ?auto_17712 ?auto_17723 ) ) ( not ( = ?auto_17712 ?auto_17742 ) ) ( not ( = ?auto_17713 ?auto_17723 ) ) ( not ( = ?auto_17713 ?auto_17742 ) ) ( not ( = ?auto_17714 ?auto_17723 ) ) ( not ( = ?auto_17714 ?auto_17742 ) ) ( not ( = ?auto_17715 ?auto_17723 ) ) ( not ( = ?auto_17715 ?auto_17742 ) ) ( not ( = ?auto_17716 ?auto_17723 ) ) ( not ( = ?auto_17716 ?auto_17742 ) ) ( not ( = ?auto_17719 ?auto_17723 ) ) ( not ( = ?auto_17719 ?auto_17742 ) ) ( not ( = ?auto_17717 ?auto_17723 ) ) ( not ( = ?auto_17717 ?auto_17742 ) ) ( not ( = ?auto_17721 ?auto_17723 ) ) ( not ( = ?auto_17721 ?auto_17742 ) ) ( not ( = ?auto_17720 ?auto_17723 ) ) ( not ( = ?auto_17720 ?auto_17742 ) ) ( not ( = ?auto_17723 ?auto_17746 ) ) ( not ( = ?auto_17723 ?auto_17738 ) ) ( not ( = ?auto_17723 ?auto_17747 ) ) ( not ( = ?auto_17723 ?auto_17735 ) ) ( not ( = ?auto_17723 ?auto_17753 ) ) ( not ( = ?auto_17723 ?auto_17745 ) ) ( not ( = ?auto_17723 ?auto_17737 ) ) ( not ( = ?auto_17723 ?auto_17754 ) ) ( not ( = ?auto_17723 ?auto_17760 ) ) ( not ( = ?auto_17749 ?auto_17755 ) ) ( not ( = ?auto_17749 ?auto_17739 ) ) ( not ( = ?auto_17749 ?auto_17750 ) ) ( not ( = ?auto_17749 ?auto_17743 ) ) ( not ( = ?auto_17749 ?auto_17733 ) ) ( not ( = ?auto_17749 ?auto_17752 ) ) ( not ( = ?auto_17749 ?auto_17744 ) ) ( not ( = ?auto_17734 ?auto_17751 ) ) ( not ( = ?auto_17734 ?auto_17756 ) ) ( not ( = ?auto_17734 ?auto_17741 ) ) ( not ( = ?auto_17734 ?auto_17757 ) ) ( not ( = ?auto_17734 ?auto_17761 ) ) ( not ( = ?auto_17734 ?auto_17740 ) ) ( not ( = ?auto_17734 ?auto_17736 ) ) ( not ( = ?auto_17742 ?auto_17746 ) ) ( not ( = ?auto_17742 ?auto_17738 ) ) ( not ( = ?auto_17742 ?auto_17747 ) ) ( not ( = ?auto_17742 ?auto_17735 ) ) ( not ( = ?auto_17742 ?auto_17753 ) ) ( not ( = ?auto_17742 ?auto_17745 ) ) ( not ( = ?auto_17742 ?auto_17737 ) ) ( not ( = ?auto_17742 ?auto_17754 ) ) ( not ( = ?auto_17742 ?auto_17760 ) ) ( not ( = ?auto_17712 ?auto_17722 ) ) ( not ( = ?auto_17712 ?auto_17759 ) ) ( not ( = ?auto_17713 ?auto_17722 ) ) ( not ( = ?auto_17713 ?auto_17759 ) ) ( not ( = ?auto_17714 ?auto_17722 ) ) ( not ( = ?auto_17714 ?auto_17759 ) ) ( not ( = ?auto_17715 ?auto_17722 ) ) ( not ( = ?auto_17715 ?auto_17759 ) ) ( not ( = ?auto_17716 ?auto_17722 ) ) ( not ( = ?auto_17716 ?auto_17759 ) ) ( not ( = ?auto_17719 ?auto_17722 ) ) ( not ( = ?auto_17719 ?auto_17759 ) ) ( not ( = ?auto_17717 ?auto_17722 ) ) ( not ( = ?auto_17717 ?auto_17759 ) ) ( not ( = ?auto_17721 ?auto_17722 ) ) ( not ( = ?auto_17721 ?auto_17759 ) ) ( not ( = ?auto_17720 ?auto_17722 ) ) ( not ( = ?auto_17720 ?auto_17759 ) ) ( not ( = ?auto_17718 ?auto_17722 ) ) ( not ( = ?auto_17718 ?auto_17759 ) ) ( not ( = ?auto_17722 ?auto_17742 ) ) ( not ( = ?auto_17722 ?auto_17746 ) ) ( not ( = ?auto_17722 ?auto_17738 ) ) ( not ( = ?auto_17722 ?auto_17747 ) ) ( not ( = ?auto_17722 ?auto_17735 ) ) ( not ( = ?auto_17722 ?auto_17753 ) ) ( not ( = ?auto_17722 ?auto_17745 ) ) ( not ( = ?auto_17722 ?auto_17737 ) ) ( not ( = ?auto_17722 ?auto_17754 ) ) ( not ( = ?auto_17722 ?auto_17760 ) ) ( not ( = ?auto_17731 ?auto_17749 ) ) ( not ( = ?auto_17731 ?auto_17755 ) ) ( not ( = ?auto_17731 ?auto_17739 ) ) ( not ( = ?auto_17731 ?auto_17750 ) ) ( not ( = ?auto_17731 ?auto_17743 ) ) ( not ( = ?auto_17731 ?auto_17733 ) ) ( not ( = ?auto_17731 ?auto_17752 ) ) ( not ( = ?auto_17731 ?auto_17744 ) ) ( not ( = ?auto_17729 ?auto_17734 ) ) ( not ( = ?auto_17729 ?auto_17751 ) ) ( not ( = ?auto_17729 ?auto_17756 ) ) ( not ( = ?auto_17729 ?auto_17741 ) ) ( not ( = ?auto_17729 ?auto_17757 ) ) ( not ( = ?auto_17729 ?auto_17761 ) ) ( not ( = ?auto_17729 ?auto_17740 ) ) ( not ( = ?auto_17729 ?auto_17736 ) ) ( not ( = ?auto_17759 ?auto_17742 ) ) ( not ( = ?auto_17759 ?auto_17746 ) ) ( not ( = ?auto_17759 ?auto_17738 ) ) ( not ( = ?auto_17759 ?auto_17747 ) ) ( not ( = ?auto_17759 ?auto_17735 ) ) ( not ( = ?auto_17759 ?auto_17753 ) ) ( not ( = ?auto_17759 ?auto_17745 ) ) ( not ( = ?auto_17759 ?auto_17737 ) ) ( not ( = ?auto_17759 ?auto_17754 ) ) ( not ( = ?auto_17759 ?auto_17760 ) ) ( not ( = ?auto_17712 ?auto_17724 ) ) ( not ( = ?auto_17712 ?auto_17748 ) ) ( not ( = ?auto_17713 ?auto_17724 ) ) ( not ( = ?auto_17713 ?auto_17748 ) ) ( not ( = ?auto_17714 ?auto_17724 ) ) ( not ( = ?auto_17714 ?auto_17748 ) ) ( not ( = ?auto_17715 ?auto_17724 ) ) ( not ( = ?auto_17715 ?auto_17748 ) ) ( not ( = ?auto_17716 ?auto_17724 ) ) ( not ( = ?auto_17716 ?auto_17748 ) ) ( not ( = ?auto_17719 ?auto_17724 ) ) ( not ( = ?auto_17719 ?auto_17748 ) ) ( not ( = ?auto_17717 ?auto_17724 ) ) ( not ( = ?auto_17717 ?auto_17748 ) ) ( not ( = ?auto_17721 ?auto_17724 ) ) ( not ( = ?auto_17721 ?auto_17748 ) ) ( not ( = ?auto_17720 ?auto_17724 ) ) ( not ( = ?auto_17720 ?auto_17748 ) ) ( not ( = ?auto_17718 ?auto_17724 ) ) ( not ( = ?auto_17718 ?auto_17748 ) ) ( not ( = ?auto_17723 ?auto_17724 ) ) ( not ( = ?auto_17723 ?auto_17748 ) ) ( not ( = ?auto_17724 ?auto_17759 ) ) ( not ( = ?auto_17724 ?auto_17742 ) ) ( not ( = ?auto_17724 ?auto_17746 ) ) ( not ( = ?auto_17724 ?auto_17738 ) ) ( not ( = ?auto_17724 ?auto_17747 ) ) ( not ( = ?auto_17724 ?auto_17735 ) ) ( not ( = ?auto_17724 ?auto_17753 ) ) ( not ( = ?auto_17724 ?auto_17745 ) ) ( not ( = ?auto_17724 ?auto_17737 ) ) ( not ( = ?auto_17724 ?auto_17754 ) ) ( not ( = ?auto_17724 ?auto_17760 ) ) ( not ( = ?auto_17748 ?auto_17759 ) ) ( not ( = ?auto_17748 ?auto_17742 ) ) ( not ( = ?auto_17748 ?auto_17746 ) ) ( not ( = ?auto_17748 ?auto_17738 ) ) ( not ( = ?auto_17748 ?auto_17747 ) ) ( not ( = ?auto_17748 ?auto_17735 ) ) ( not ( = ?auto_17748 ?auto_17753 ) ) ( not ( = ?auto_17748 ?auto_17745 ) ) ( not ( = ?auto_17748 ?auto_17737 ) ) ( not ( = ?auto_17748 ?auto_17754 ) ) ( not ( = ?auto_17748 ?auto_17760 ) ) ( not ( = ?auto_17712 ?auto_17725 ) ) ( not ( = ?auto_17712 ?auto_17758 ) ) ( not ( = ?auto_17713 ?auto_17725 ) ) ( not ( = ?auto_17713 ?auto_17758 ) ) ( not ( = ?auto_17714 ?auto_17725 ) ) ( not ( = ?auto_17714 ?auto_17758 ) ) ( not ( = ?auto_17715 ?auto_17725 ) ) ( not ( = ?auto_17715 ?auto_17758 ) ) ( not ( = ?auto_17716 ?auto_17725 ) ) ( not ( = ?auto_17716 ?auto_17758 ) ) ( not ( = ?auto_17719 ?auto_17725 ) ) ( not ( = ?auto_17719 ?auto_17758 ) ) ( not ( = ?auto_17717 ?auto_17725 ) ) ( not ( = ?auto_17717 ?auto_17758 ) ) ( not ( = ?auto_17721 ?auto_17725 ) ) ( not ( = ?auto_17721 ?auto_17758 ) ) ( not ( = ?auto_17720 ?auto_17725 ) ) ( not ( = ?auto_17720 ?auto_17758 ) ) ( not ( = ?auto_17718 ?auto_17725 ) ) ( not ( = ?auto_17718 ?auto_17758 ) ) ( not ( = ?auto_17723 ?auto_17725 ) ) ( not ( = ?auto_17723 ?auto_17758 ) ) ( not ( = ?auto_17722 ?auto_17725 ) ) ( not ( = ?auto_17722 ?auto_17758 ) ) ( not ( = ?auto_17725 ?auto_17748 ) ) ( not ( = ?auto_17725 ?auto_17759 ) ) ( not ( = ?auto_17725 ?auto_17742 ) ) ( not ( = ?auto_17725 ?auto_17746 ) ) ( not ( = ?auto_17725 ?auto_17738 ) ) ( not ( = ?auto_17725 ?auto_17747 ) ) ( not ( = ?auto_17725 ?auto_17735 ) ) ( not ( = ?auto_17725 ?auto_17753 ) ) ( not ( = ?auto_17725 ?auto_17745 ) ) ( not ( = ?auto_17725 ?auto_17737 ) ) ( not ( = ?auto_17725 ?auto_17754 ) ) ( not ( = ?auto_17725 ?auto_17760 ) ) ( not ( = ?auto_17758 ?auto_17748 ) ) ( not ( = ?auto_17758 ?auto_17759 ) ) ( not ( = ?auto_17758 ?auto_17742 ) ) ( not ( = ?auto_17758 ?auto_17746 ) ) ( not ( = ?auto_17758 ?auto_17738 ) ) ( not ( = ?auto_17758 ?auto_17747 ) ) ( not ( = ?auto_17758 ?auto_17735 ) ) ( not ( = ?auto_17758 ?auto_17753 ) ) ( not ( = ?auto_17758 ?auto_17745 ) ) ( not ( = ?auto_17758 ?auto_17737 ) ) ( not ( = ?auto_17758 ?auto_17754 ) ) ( not ( = ?auto_17758 ?auto_17760 ) ) ( not ( = ?auto_17712 ?auto_17726 ) ) ( not ( = ?auto_17712 ?auto_17732 ) ) ( not ( = ?auto_17713 ?auto_17726 ) ) ( not ( = ?auto_17713 ?auto_17732 ) ) ( not ( = ?auto_17714 ?auto_17726 ) ) ( not ( = ?auto_17714 ?auto_17732 ) ) ( not ( = ?auto_17715 ?auto_17726 ) ) ( not ( = ?auto_17715 ?auto_17732 ) ) ( not ( = ?auto_17716 ?auto_17726 ) ) ( not ( = ?auto_17716 ?auto_17732 ) ) ( not ( = ?auto_17719 ?auto_17726 ) ) ( not ( = ?auto_17719 ?auto_17732 ) ) ( not ( = ?auto_17717 ?auto_17726 ) ) ( not ( = ?auto_17717 ?auto_17732 ) ) ( not ( = ?auto_17721 ?auto_17726 ) ) ( not ( = ?auto_17721 ?auto_17732 ) ) ( not ( = ?auto_17720 ?auto_17726 ) ) ( not ( = ?auto_17720 ?auto_17732 ) ) ( not ( = ?auto_17718 ?auto_17726 ) ) ( not ( = ?auto_17718 ?auto_17732 ) ) ( not ( = ?auto_17723 ?auto_17726 ) ) ( not ( = ?auto_17723 ?auto_17732 ) ) ( not ( = ?auto_17722 ?auto_17726 ) ) ( not ( = ?auto_17722 ?auto_17732 ) ) ( not ( = ?auto_17724 ?auto_17726 ) ) ( not ( = ?auto_17724 ?auto_17732 ) ) ( not ( = ?auto_17726 ?auto_17758 ) ) ( not ( = ?auto_17726 ?auto_17748 ) ) ( not ( = ?auto_17726 ?auto_17759 ) ) ( not ( = ?auto_17726 ?auto_17742 ) ) ( not ( = ?auto_17726 ?auto_17746 ) ) ( not ( = ?auto_17726 ?auto_17738 ) ) ( not ( = ?auto_17726 ?auto_17747 ) ) ( not ( = ?auto_17726 ?auto_17735 ) ) ( not ( = ?auto_17726 ?auto_17753 ) ) ( not ( = ?auto_17726 ?auto_17745 ) ) ( not ( = ?auto_17726 ?auto_17737 ) ) ( not ( = ?auto_17726 ?auto_17754 ) ) ( not ( = ?auto_17726 ?auto_17760 ) ) ( not ( = ?auto_17732 ?auto_17758 ) ) ( not ( = ?auto_17732 ?auto_17748 ) ) ( not ( = ?auto_17732 ?auto_17759 ) ) ( not ( = ?auto_17732 ?auto_17742 ) ) ( not ( = ?auto_17732 ?auto_17746 ) ) ( not ( = ?auto_17732 ?auto_17738 ) ) ( not ( = ?auto_17732 ?auto_17747 ) ) ( not ( = ?auto_17732 ?auto_17735 ) ) ( not ( = ?auto_17732 ?auto_17753 ) ) ( not ( = ?auto_17732 ?auto_17745 ) ) ( not ( = ?auto_17732 ?auto_17737 ) ) ( not ( = ?auto_17732 ?auto_17754 ) ) ( not ( = ?auto_17732 ?auto_17760 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_17712 ?auto_17713 ?auto_17714 ?auto_17715 ?auto_17716 ?auto_17719 ?auto_17717 ?auto_17721 ?auto_17720 ?auto_17718 ?auto_17723 ?auto_17722 ?auto_17724 ?auto_17725 )
      ( MAKE-1CRATE ?auto_17725 ?auto_17726 )
      ( MAKE-14CRATE-VERIFY ?auto_17712 ?auto_17713 ?auto_17714 ?auto_17715 ?auto_17716 ?auto_17719 ?auto_17717 ?auto_17721 ?auto_17720 ?auto_17718 ?auto_17723 ?auto_17722 ?auto_17724 ?auto_17725 ?auto_17726 ) )
  )

)

