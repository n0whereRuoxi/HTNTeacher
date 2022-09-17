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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17110 - SURFACE
      ?auto_17111 - SURFACE
      ?auto_17112 - SURFACE
    )
    :vars
    (
      ?auto_17116 - HOIST
      ?auto_17113 - PLACE
      ?auto_17114 - PLACE
      ?auto_17118 - HOIST
      ?auto_17117 - SURFACE
      ?auto_17120 - PLACE
      ?auto_17119 - HOIST
      ?auto_17121 - SURFACE
      ?auto_17115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17116 ?auto_17113 ) ( IS-CRATE ?auto_17112 ) ( not ( = ?auto_17114 ?auto_17113 ) ) ( HOIST-AT ?auto_17118 ?auto_17114 ) ( AVAILABLE ?auto_17118 ) ( SURFACE-AT ?auto_17112 ?auto_17114 ) ( ON ?auto_17112 ?auto_17117 ) ( CLEAR ?auto_17112 ) ( not ( = ?auto_17111 ?auto_17112 ) ) ( not ( = ?auto_17111 ?auto_17117 ) ) ( not ( = ?auto_17112 ?auto_17117 ) ) ( not ( = ?auto_17116 ?auto_17118 ) ) ( SURFACE-AT ?auto_17110 ?auto_17113 ) ( CLEAR ?auto_17110 ) ( IS-CRATE ?auto_17111 ) ( AVAILABLE ?auto_17116 ) ( not ( = ?auto_17120 ?auto_17113 ) ) ( HOIST-AT ?auto_17119 ?auto_17120 ) ( AVAILABLE ?auto_17119 ) ( SURFACE-AT ?auto_17111 ?auto_17120 ) ( ON ?auto_17111 ?auto_17121 ) ( CLEAR ?auto_17111 ) ( TRUCK-AT ?auto_17115 ?auto_17113 ) ( not ( = ?auto_17110 ?auto_17111 ) ) ( not ( = ?auto_17110 ?auto_17121 ) ) ( not ( = ?auto_17111 ?auto_17121 ) ) ( not ( = ?auto_17116 ?auto_17119 ) ) ( not ( = ?auto_17110 ?auto_17112 ) ) ( not ( = ?auto_17110 ?auto_17117 ) ) ( not ( = ?auto_17112 ?auto_17121 ) ) ( not ( = ?auto_17114 ?auto_17120 ) ) ( not ( = ?auto_17118 ?auto_17119 ) ) ( not ( = ?auto_17117 ?auto_17121 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17110 ?auto_17111 )
      ( MAKE-1CRATE ?auto_17111 ?auto_17112 )
      ( MAKE-2CRATE-VERIFY ?auto_17110 ?auto_17111 ?auto_17112 ) )
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
      ?auto_17144 - HOIST
      ?auto_17143 - PLACE
      ?auto_17142 - PLACE
      ?auto_17145 - HOIST
      ?auto_17141 - SURFACE
      ?auto_17147 - SURFACE
      ?auto_17146 - PLACE
      ?auto_17148 - HOIST
      ?auto_17149 - SURFACE
      ?auto_17140 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17144 ?auto_17143 ) ( IS-CRATE ?auto_17139 ) ( not ( = ?auto_17142 ?auto_17143 ) ) ( HOIST-AT ?auto_17145 ?auto_17142 ) ( SURFACE-AT ?auto_17139 ?auto_17142 ) ( ON ?auto_17139 ?auto_17141 ) ( CLEAR ?auto_17139 ) ( not ( = ?auto_17138 ?auto_17139 ) ) ( not ( = ?auto_17138 ?auto_17141 ) ) ( not ( = ?auto_17139 ?auto_17141 ) ) ( not ( = ?auto_17144 ?auto_17145 ) ) ( IS-CRATE ?auto_17138 ) ( AVAILABLE ?auto_17145 ) ( SURFACE-AT ?auto_17138 ?auto_17142 ) ( ON ?auto_17138 ?auto_17147 ) ( CLEAR ?auto_17138 ) ( not ( = ?auto_17137 ?auto_17138 ) ) ( not ( = ?auto_17137 ?auto_17147 ) ) ( not ( = ?auto_17138 ?auto_17147 ) ) ( SURFACE-AT ?auto_17136 ?auto_17143 ) ( CLEAR ?auto_17136 ) ( IS-CRATE ?auto_17137 ) ( AVAILABLE ?auto_17144 ) ( not ( = ?auto_17146 ?auto_17143 ) ) ( HOIST-AT ?auto_17148 ?auto_17146 ) ( AVAILABLE ?auto_17148 ) ( SURFACE-AT ?auto_17137 ?auto_17146 ) ( ON ?auto_17137 ?auto_17149 ) ( CLEAR ?auto_17137 ) ( TRUCK-AT ?auto_17140 ?auto_17143 ) ( not ( = ?auto_17136 ?auto_17137 ) ) ( not ( = ?auto_17136 ?auto_17149 ) ) ( not ( = ?auto_17137 ?auto_17149 ) ) ( not ( = ?auto_17144 ?auto_17148 ) ) ( not ( = ?auto_17136 ?auto_17138 ) ) ( not ( = ?auto_17136 ?auto_17147 ) ) ( not ( = ?auto_17138 ?auto_17149 ) ) ( not ( = ?auto_17142 ?auto_17146 ) ) ( not ( = ?auto_17145 ?auto_17148 ) ) ( not ( = ?auto_17147 ?auto_17149 ) ) ( not ( = ?auto_17136 ?auto_17139 ) ) ( not ( = ?auto_17136 ?auto_17141 ) ) ( not ( = ?auto_17137 ?auto_17139 ) ) ( not ( = ?auto_17137 ?auto_17141 ) ) ( not ( = ?auto_17139 ?auto_17147 ) ) ( not ( = ?auto_17139 ?auto_17149 ) ) ( not ( = ?auto_17141 ?auto_17147 ) ) ( not ( = ?auto_17141 ?auto_17149 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17136 ?auto_17137 ?auto_17138 )
      ( MAKE-1CRATE ?auto_17138 ?auto_17139 )
      ( MAKE-3CRATE-VERIFY ?auto_17136 ?auto_17137 ?auto_17138 ?auto_17139 ) )
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
      ?auto_17171 - HOIST
      ?auto_17170 - PLACE
      ?auto_17173 - PLACE
      ?auto_17175 - HOIST
      ?auto_17174 - SURFACE
      ?auto_17178 - PLACE
      ?auto_17179 - HOIST
      ?auto_17180 - SURFACE
      ?auto_17177 - SURFACE
      ?auto_17181 - PLACE
      ?auto_17176 - HOIST
      ?auto_17182 - SURFACE
      ?auto_17172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17171 ?auto_17170 ) ( IS-CRATE ?auto_17169 ) ( not ( = ?auto_17173 ?auto_17170 ) ) ( HOIST-AT ?auto_17175 ?auto_17173 ) ( AVAILABLE ?auto_17175 ) ( SURFACE-AT ?auto_17169 ?auto_17173 ) ( ON ?auto_17169 ?auto_17174 ) ( CLEAR ?auto_17169 ) ( not ( = ?auto_17168 ?auto_17169 ) ) ( not ( = ?auto_17168 ?auto_17174 ) ) ( not ( = ?auto_17169 ?auto_17174 ) ) ( not ( = ?auto_17171 ?auto_17175 ) ) ( IS-CRATE ?auto_17168 ) ( not ( = ?auto_17178 ?auto_17170 ) ) ( HOIST-AT ?auto_17179 ?auto_17178 ) ( SURFACE-AT ?auto_17168 ?auto_17178 ) ( ON ?auto_17168 ?auto_17180 ) ( CLEAR ?auto_17168 ) ( not ( = ?auto_17167 ?auto_17168 ) ) ( not ( = ?auto_17167 ?auto_17180 ) ) ( not ( = ?auto_17168 ?auto_17180 ) ) ( not ( = ?auto_17171 ?auto_17179 ) ) ( IS-CRATE ?auto_17167 ) ( AVAILABLE ?auto_17179 ) ( SURFACE-AT ?auto_17167 ?auto_17178 ) ( ON ?auto_17167 ?auto_17177 ) ( CLEAR ?auto_17167 ) ( not ( = ?auto_17166 ?auto_17167 ) ) ( not ( = ?auto_17166 ?auto_17177 ) ) ( not ( = ?auto_17167 ?auto_17177 ) ) ( SURFACE-AT ?auto_17165 ?auto_17170 ) ( CLEAR ?auto_17165 ) ( IS-CRATE ?auto_17166 ) ( AVAILABLE ?auto_17171 ) ( not ( = ?auto_17181 ?auto_17170 ) ) ( HOIST-AT ?auto_17176 ?auto_17181 ) ( AVAILABLE ?auto_17176 ) ( SURFACE-AT ?auto_17166 ?auto_17181 ) ( ON ?auto_17166 ?auto_17182 ) ( CLEAR ?auto_17166 ) ( TRUCK-AT ?auto_17172 ?auto_17170 ) ( not ( = ?auto_17165 ?auto_17166 ) ) ( not ( = ?auto_17165 ?auto_17182 ) ) ( not ( = ?auto_17166 ?auto_17182 ) ) ( not ( = ?auto_17171 ?auto_17176 ) ) ( not ( = ?auto_17165 ?auto_17167 ) ) ( not ( = ?auto_17165 ?auto_17177 ) ) ( not ( = ?auto_17167 ?auto_17182 ) ) ( not ( = ?auto_17178 ?auto_17181 ) ) ( not ( = ?auto_17179 ?auto_17176 ) ) ( not ( = ?auto_17177 ?auto_17182 ) ) ( not ( = ?auto_17165 ?auto_17168 ) ) ( not ( = ?auto_17165 ?auto_17180 ) ) ( not ( = ?auto_17166 ?auto_17168 ) ) ( not ( = ?auto_17166 ?auto_17180 ) ) ( not ( = ?auto_17168 ?auto_17177 ) ) ( not ( = ?auto_17168 ?auto_17182 ) ) ( not ( = ?auto_17180 ?auto_17177 ) ) ( not ( = ?auto_17180 ?auto_17182 ) ) ( not ( = ?auto_17165 ?auto_17169 ) ) ( not ( = ?auto_17165 ?auto_17174 ) ) ( not ( = ?auto_17166 ?auto_17169 ) ) ( not ( = ?auto_17166 ?auto_17174 ) ) ( not ( = ?auto_17167 ?auto_17169 ) ) ( not ( = ?auto_17167 ?auto_17174 ) ) ( not ( = ?auto_17169 ?auto_17180 ) ) ( not ( = ?auto_17169 ?auto_17177 ) ) ( not ( = ?auto_17169 ?auto_17182 ) ) ( not ( = ?auto_17173 ?auto_17178 ) ) ( not ( = ?auto_17173 ?auto_17181 ) ) ( not ( = ?auto_17175 ?auto_17179 ) ) ( not ( = ?auto_17175 ?auto_17176 ) ) ( not ( = ?auto_17174 ?auto_17180 ) ) ( not ( = ?auto_17174 ?auto_17177 ) ) ( not ( = ?auto_17174 ?auto_17182 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_17165 ?auto_17166 ?auto_17167 ?auto_17168 )
      ( MAKE-1CRATE ?auto_17168 ?auto_17169 )
      ( MAKE-4CRATE-VERIFY ?auto_17165 ?auto_17166 ?auto_17167 ?auto_17168 ?auto_17169 ) )
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
      ?auto_17208 - HOIST
      ?auto_17206 - PLACE
      ?auto_17210 - PLACE
      ?auto_17205 - HOIST
      ?auto_17209 - SURFACE
      ?auto_17218 - PLACE
      ?auto_17219 - HOIST
      ?auto_17214 - SURFACE
      ?auto_17213 - PLACE
      ?auto_17211 - HOIST
      ?auto_17212 - SURFACE
      ?auto_17220 - SURFACE
      ?auto_17216 - PLACE
      ?auto_17215 - HOIST
      ?auto_17217 - SURFACE
      ?auto_17207 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17208 ?auto_17206 ) ( IS-CRATE ?auto_17204 ) ( not ( = ?auto_17210 ?auto_17206 ) ) ( HOIST-AT ?auto_17205 ?auto_17210 ) ( AVAILABLE ?auto_17205 ) ( SURFACE-AT ?auto_17204 ?auto_17210 ) ( ON ?auto_17204 ?auto_17209 ) ( CLEAR ?auto_17204 ) ( not ( = ?auto_17203 ?auto_17204 ) ) ( not ( = ?auto_17203 ?auto_17209 ) ) ( not ( = ?auto_17204 ?auto_17209 ) ) ( not ( = ?auto_17208 ?auto_17205 ) ) ( IS-CRATE ?auto_17203 ) ( not ( = ?auto_17218 ?auto_17206 ) ) ( HOIST-AT ?auto_17219 ?auto_17218 ) ( AVAILABLE ?auto_17219 ) ( SURFACE-AT ?auto_17203 ?auto_17218 ) ( ON ?auto_17203 ?auto_17214 ) ( CLEAR ?auto_17203 ) ( not ( = ?auto_17202 ?auto_17203 ) ) ( not ( = ?auto_17202 ?auto_17214 ) ) ( not ( = ?auto_17203 ?auto_17214 ) ) ( not ( = ?auto_17208 ?auto_17219 ) ) ( IS-CRATE ?auto_17202 ) ( not ( = ?auto_17213 ?auto_17206 ) ) ( HOIST-AT ?auto_17211 ?auto_17213 ) ( SURFACE-AT ?auto_17202 ?auto_17213 ) ( ON ?auto_17202 ?auto_17212 ) ( CLEAR ?auto_17202 ) ( not ( = ?auto_17201 ?auto_17202 ) ) ( not ( = ?auto_17201 ?auto_17212 ) ) ( not ( = ?auto_17202 ?auto_17212 ) ) ( not ( = ?auto_17208 ?auto_17211 ) ) ( IS-CRATE ?auto_17201 ) ( AVAILABLE ?auto_17211 ) ( SURFACE-AT ?auto_17201 ?auto_17213 ) ( ON ?auto_17201 ?auto_17220 ) ( CLEAR ?auto_17201 ) ( not ( = ?auto_17200 ?auto_17201 ) ) ( not ( = ?auto_17200 ?auto_17220 ) ) ( not ( = ?auto_17201 ?auto_17220 ) ) ( SURFACE-AT ?auto_17199 ?auto_17206 ) ( CLEAR ?auto_17199 ) ( IS-CRATE ?auto_17200 ) ( AVAILABLE ?auto_17208 ) ( not ( = ?auto_17216 ?auto_17206 ) ) ( HOIST-AT ?auto_17215 ?auto_17216 ) ( AVAILABLE ?auto_17215 ) ( SURFACE-AT ?auto_17200 ?auto_17216 ) ( ON ?auto_17200 ?auto_17217 ) ( CLEAR ?auto_17200 ) ( TRUCK-AT ?auto_17207 ?auto_17206 ) ( not ( = ?auto_17199 ?auto_17200 ) ) ( not ( = ?auto_17199 ?auto_17217 ) ) ( not ( = ?auto_17200 ?auto_17217 ) ) ( not ( = ?auto_17208 ?auto_17215 ) ) ( not ( = ?auto_17199 ?auto_17201 ) ) ( not ( = ?auto_17199 ?auto_17220 ) ) ( not ( = ?auto_17201 ?auto_17217 ) ) ( not ( = ?auto_17213 ?auto_17216 ) ) ( not ( = ?auto_17211 ?auto_17215 ) ) ( not ( = ?auto_17220 ?auto_17217 ) ) ( not ( = ?auto_17199 ?auto_17202 ) ) ( not ( = ?auto_17199 ?auto_17212 ) ) ( not ( = ?auto_17200 ?auto_17202 ) ) ( not ( = ?auto_17200 ?auto_17212 ) ) ( not ( = ?auto_17202 ?auto_17220 ) ) ( not ( = ?auto_17202 ?auto_17217 ) ) ( not ( = ?auto_17212 ?auto_17220 ) ) ( not ( = ?auto_17212 ?auto_17217 ) ) ( not ( = ?auto_17199 ?auto_17203 ) ) ( not ( = ?auto_17199 ?auto_17214 ) ) ( not ( = ?auto_17200 ?auto_17203 ) ) ( not ( = ?auto_17200 ?auto_17214 ) ) ( not ( = ?auto_17201 ?auto_17203 ) ) ( not ( = ?auto_17201 ?auto_17214 ) ) ( not ( = ?auto_17203 ?auto_17212 ) ) ( not ( = ?auto_17203 ?auto_17220 ) ) ( not ( = ?auto_17203 ?auto_17217 ) ) ( not ( = ?auto_17218 ?auto_17213 ) ) ( not ( = ?auto_17218 ?auto_17216 ) ) ( not ( = ?auto_17219 ?auto_17211 ) ) ( not ( = ?auto_17219 ?auto_17215 ) ) ( not ( = ?auto_17214 ?auto_17212 ) ) ( not ( = ?auto_17214 ?auto_17220 ) ) ( not ( = ?auto_17214 ?auto_17217 ) ) ( not ( = ?auto_17199 ?auto_17204 ) ) ( not ( = ?auto_17199 ?auto_17209 ) ) ( not ( = ?auto_17200 ?auto_17204 ) ) ( not ( = ?auto_17200 ?auto_17209 ) ) ( not ( = ?auto_17201 ?auto_17204 ) ) ( not ( = ?auto_17201 ?auto_17209 ) ) ( not ( = ?auto_17202 ?auto_17204 ) ) ( not ( = ?auto_17202 ?auto_17209 ) ) ( not ( = ?auto_17204 ?auto_17214 ) ) ( not ( = ?auto_17204 ?auto_17212 ) ) ( not ( = ?auto_17204 ?auto_17220 ) ) ( not ( = ?auto_17204 ?auto_17217 ) ) ( not ( = ?auto_17210 ?auto_17218 ) ) ( not ( = ?auto_17210 ?auto_17213 ) ) ( not ( = ?auto_17210 ?auto_17216 ) ) ( not ( = ?auto_17205 ?auto_17219 ) ) ( not ( = ?auto_17205 ?auto_17211 ) ) ( not ( = ?auto_17205 ?auto_17215 ) ) ( not ( = ?auto_17209 ?auto_17214 ) ) ( not ( = ?auto_17209 ?auto_17212 ) ) ( not ( = ?auto_17209 ?auto_17220 ) ) ( not ( = ?auto_17209 ?auto_17217 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_17199 ?auto_17200 ?auto_17201 ?auto_17202 ?auto_17203 )
      ( MAKE-1CRATE ?auto_17203 ?auto_17204 )
      ( MAKE-5CRATE-VERIFY ?auto_17199 ?auto_17200 ?auto_17201 ?auto_17202 ?auto_17203 ?auto_17204 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_17238 - SURFACE
      ?auto_17239 - SURFACE
      ?auto_17240 - SURFACE
      ?auto_17241 - SURFACE
      ?auto_17242 - SURFACE
      ?auto_17243 - SURFACE
      ?auto_17244 - SURFACE
    )
    :vars
    (
      ?auto_17250 - HOIST
      ?auto_17246 - PLACE
      ?auto_17248 - PLACE
      ?auto_17245 - HOIST
      ?auto_17247 - SURFACE
      ?auto_17252 - PLACE
      ?auto_17259 - HOIST
      ?auto_17258 - SURFACE
      ?auto_17251 - PLACE
      ?auto_17260 - HOIST
      ?auto_17261 - SURFACE
      ?auto_17263 - PLACE
      ?auto_17256 - HOIST
      ?auto_17262 - SURFACE
      ?auto_17257 - SURFACE
      ?auto_17254 - PLACE
      ?auto_17255 - HOIST
      ?auto_17253 - SURFACE
      ?auto_17249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17250 ?auto_17246 ) ( IS-CRATE ?auto_17244 ) ( not ( = ?auto_17248 ?auto_17246 ) ) ( HOIST-AT ?auto_17245 ?auto_17248 ) ( AVAILABLE ?auto_17245 ) ( SURFACE-AT ?auto_17244 ?auto_17248 ) ( ON ?auto_17244 ?auto_17247 ) ( CLEAR ?auto_17244 ) ( not ( = ?auto_17243 ?auto_17244 ) ) ( not ( = ?auto_17243 ?auto_17247 ) ) ( not ( = ?auto_17244 ?auto_17247 ) ) ( not ( = ?auto_17250 ?auto_17245 ) ) ( IS-CRATE ?auto_17243 ) ( not ( = ?auto_17252 ?auto_17246 ) ) ( HOIST-AT ?auto_17259 ?auto_17252 ) ( AVAILABLE ?auto_17259 ) ( SURFACE-AT ?auto_17243 ?auto_17252 ) ( ON ?auto_17243 ?auto_17258 ) ( CLEAR ?auto_17243 ) ( not ( = ?auto_17242 ?auto_17243 ) ) ( not ( = ?auto_17242 ?auto_17258 ) ) ( not ( = ?auto_17243 ?auto_17258 ) ) ( not ( = ?auto_17250 ?auto_17259 ) ) ( IS-CRATE ?auto_17242 ) ( not ( = ?auto_17251 ?auto_17246 ) ) ( HOIST-AT ?auto_17260 ?auto_17251 ) ( AVAILABLE ?auto_17260 ) ( SURFACE-AT ?auto_17242 ?auto_17251 ) ( ON ?auto_17242 ?auto_17261 ) ( CLEAR ?auto_17242 ) ( not ( = ?auto_17241 ?auto_17242 ) ) ( not ( = ?auto_17241 ?auto_17261 ) ) ( not ( = ?auto_17242 ?auto_17261 ) ) ( not ( = ?auto_17250 ?auto_17260 ) ) ( IS-CRATE ?auto_17241 ) ( not ( = ?auto_17263 ?auto_17246 ) ) ( HOIST-AT ?auto_17256 ?auto_17263 ) ( SURFACE-AT ?auto_17241 ?auto_17263 ) ( ON ?auto_17241 ?auto_17262 ) ( CLEAR ?auto_17241 ) ( not ( = ?auto_17240 ?auto_17241 ) ) ( not ( = ?auto_17240 ?auto_17262 ) ) ( not ( = ?auto_17241 ?auto_17262 ) ) ( not ( = ?auto_17250 ?auto_17256 ) ) ( IS-CRATE ?auto_17240 ) ( AVAILABLE ?auto_17256 ) ( SURFACE-AT ?auto_17240 ?auto_17263 ) ( ON ?auto_17240 ?auto_17257 ) ( CLEAR ?auto_17240 ) ( not ( = ?auto_17239 ?auto_17240 ) ) ( not ( = ?auto_17239 ?auto_17257 ) ) ( not ( = ?auto_17240 ?auto_17257 ) ) ( SURFACE-AT ?auto_17238 ?auto_17246 ) ( CLEAR ?auto_17238 ) ( IS-CRATE ?auto_17239 ) ( AVAILABLE ?auto_17250 ) ( not ( = ?auto_17254 ?auto_17246 ) ) ( HOIST-AT ?auto_17255 ?auto_17254 ) ( AVAILABLE ?auto_17255 ) ( SURFACE-AT ?auto_17239 ?auto_17254 ) ( ON ?auto_17239 ?auto_17253 ) ( CLEAR ?auto_17239 ) ( TRUCK-AT ?auto_17249 ?auto_17246 ) ( not ( = ?auto_17238 ?auto_17239 ) ) ( not ( = ?auto_17238 ?auto_17253 ) ) ( not ( = ?auto_17239 ?auto_17253 ) ) ( not ( = ?auto_17250 ?auto_17255 ) ) ( not ( = ?auto_17238 ?auto_17240 ) ) ( not ( = ?auto_17238 ?auto_17257 ) ) ( not ( = ?auto_17240 ?auto_17253 ) ) ( not ( = ?auto_17263 ?auto_17254 ) ) ( not ( = ?auto_17256 ?auto_17255 ) ) ( not ( = ?auto_17257 ?auto_17253 ) ) ( not ( = ?auto_17238 ?auto_17241 ) ) ( not ( = ?auto_17238 ?auto_17262 ) ) ( not ( = ?auto_17239 ?auto_17241 ) ) ( not ( = ?auto_17239 ?auto_17262 ) ) ( not ( = ?auto_17241 ?auto_17257 ) ) ( not ( = ?auto_17241 ?auto_17253 ) ) ( not ( = ?auto_17262 ?auto_17257 ) ) ( not ( = ?auto_17262 ?auto_17253 ) ) ( not ( = ?auto_17238 ?auto_17242 ) ) ( not ( = ?auto_17238 ?auto_17261 ) ) ( not ( = ?auto_17239 ?auto_17242 ) ) ( not ( = ?auto_17239 ?auto_17261 ) ) ( not ( = ?auto_17240 ?auto_17242 ) ) ( not ( = ?auto_17240 ?auto_17261 ) ) ( not ( = ?auto_17242 ?auto_17262 ) ) ( not ( = ?auto_17242 ?auto_17257 ) ) ( not ( = ?auto_17242 ?auto_17253 ) ) ( not ( = ?auto_17251 ?auto_17263 ) ) ( not ( = ?auto_17251 ?auto_17254 ) ) ( not ( = ?auto_17260 ?auto_17256 ) ) ( not ( = ?auto_17260 ?auto_17255 ) ) ( not ( = ?auto_17261 ?auto_17262 ) ) ( not ( = ?auto_17261 ?auto_17257 ) ) ( not ( = ?auto_17261 ?auto_17253 ) ) ( not ( = ?auto_17238 ?auto_17243 ) ) ( not ( = ?auto_17238 ?auto_17258 ) ) ( not ( = ?auto_17239 ?auto_17243 ) ) ( not ( = ?auto_17239 ?auto_17258 ) ) ( not ( = ?auto_17240 ?auto_17243 ) ) ( not ( = ?auto_17240 ?auto_17258 ) ) ( not ( = ?auto_17241 ?auto_17243 ) ) ( not ( = ?auto_17241 ?auto_17258 ) ) ( not ( = ?auto_17243 ?auto_17261 ) ) ( not ( = ?auto_17243 ?auto_17262 ) ) ( not ( = ?auto_17243 ?auto_17257 ) ) ( not ( = ?auto_17243 ?auto_17253 ) ) ( not ( = ?auto_17252 ?auto_17251 ) ) ( not ( = ?auto_17252 ?auto_17263 ) ) ( not ( = ?auto_17252 ?auto_17254 ) ) ( not ( = ?auto_17259 ?auto_17260 ) ) ( not ( = ?auto_17259 ?auto_17256 ) ) ( not ( = ?auto_17259 ?auto_17255 ) ) ( not ( = ?auto_17258 ?auto_17261 ) ) ( not ( = ?auto_17258 ?auto_17262 ) ) ( not ( = ?auto_17258 ?auto_17257 ) ) ( not ( = ?auto_17258 ?auto_17253 ) ) ( not ( = ?auto_17238 ?auto_17244 ) ) ( not ( = ?auto_17238 ?auto_17247 ) ) ( not ( = ?auto_17239 ?auto_17244 ) ) ( not ( = ?auto_17239 ?auto_17247 ) ) ( not ( = ?auto_17240 ?auto_17244 ) ) ( not ( = ?auto_17240 ?auto_17247 ) ) ( not ( = ?auto_17241 ?auto_17244 ) ) ( not ( = ?auto_17241 ?auto_17247 ) ) ( not ( = ?auto_17242 ?auto_17244 ) ) ( not ( = ?auto_17242 ?auto_17247 ) ) ( not ( = ?auto_17244 ?auto_17258 ) ) ( not ( = ?auto_17244 ?auto_17261 ) ) ( not ( = ?auto_17244 ?auto_17262 ) ) ( not ( = ?auto_17244 ?auto_17257 ) ) ( not ( = ?auto_17244 ?auto_17253 ) ) ( not ( = ?auto_17248 ?auto_17252 ) ) ( not ( = ?auto_17248 ?auto_17251 ) ) ( not ( = ?auto_17248 ?auto_17263 ) ) ( not ( = ?auto_17248 ?auto_17254 ) ) ( not ( = ?auto_17245 ?auto_17259 ) ) ( not ( = ?auto_17245 ?auto_17260 ) ) ( not ( = ?auto_17245 ?auto_17256 ) ) ( not ( = ?auto_17245 ?auto_17255 ) ) ( not ( = ?auto_17247 ?auto_17258 ) ) ( not ( = ?auto_17247 ?auto_17261 ) ) ( not ( = ?auto_17247 ?auto_17262 ) ) ( not ( = ?auto_17247 ?auto_17257 ) ) ( not ( = ?auto_17247 ?auto_17253 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_17238 ?auto_17239 ?auto_17240 ?auto_17241 ?auto_17242 ?auto_17243 )
      ( MAKE-1CRATE ?auto_17243 ?auto_17244 )
      ( MAKE-6CRATE-VERIFY ?auto_17238 ?auto_17239 ?auto_17240 ?auto_17241 ?auto_17242 ?auto_17243 ?auto_17244 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_17282 - SURFACE
      ?auto_17283 - SURFACE
      ?auto_17284 - SURFACE
      ?auto_17285 - SURFACE
      ?auto_17286 - SURFACE
      ?auto_17287 - SURFACE
      ?auto_17288 - SURFACE
      ?auto_17289 - SURFACE
    )
    :vars
    (
      ?auto_17295 - HOIST
      ?auto_17293 - PLACE
      ?auto_17292 - PLACE
      ?auto_17294 - HOIST
      ?auto_17290 - SURFACE
      ?auto_17304 - PLACE
      ?auto_17303 - HOIST
      ?auto_17306 - SURFACE
      ?auto_17298 - PLACE
      ?auto_17307 - HOIST
      ?auto_17299 - SURFACE
      ?auto_17296 - PLACE
      ?auto_17309 - HOIST
      ?auto_17308 - SURFACE
      ?auto_17311 - PLACE
      ?auto_17301 - HOIST
      ?auto_17310 - SURFACE
      ?auto_17300 - SURFACE
      ?auto_17297 - PLACE
      ?auto_17302 - HOIST
      ?auto_17305 - SURFACE
      ?auto_17291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17295 ?auto_17293 ) ( IS-CRATE ?auto_17289 ) ( not ( = ?auto_17292 ?auto_17293 ) ) ( HOIST-AT ?auto_17294 ?auto_17292 ) ( AVAILABLE ?auto_17294 ) ( SURFACE-AT ?auto_17289 ?auto_17292 ) ( ON ?auto_17289 ?auto_17290 ) ( CLEAR ?auto_17289 ) ( not ( = ?auto_17288 ?auto_17289 ) ) ( not ( = ?auto_17288 ?auto_17290 ) ) ( not ( = ?auto_17289 ?auto_17290 ) ) ( not ( = ?auto_17295 ?auto_17294 ) ) ( IS-CRATE ?auto_17288 ) ( not ( = ?auto_17304 ?auto_17293 ) ) ( HOIST-AT ?auto_17303 ?auto_17304 ) ( AVAILABLE ?auto_17303 ) ( SURFACE-AT ?auto_17288 ?auto_17304 ) ( ON ?auto_17288 ?auto_17306 ) ( CLEAR ?auto_17288 ) ( not ( = ?auto_17287 ?auto_17288 ) ) ( not ( = ?auto_17287 ?auto_17306 ) ) ( not ( = ?auto_17288 ?auto_17306 ) ) ( not ( = ?auto_17295 ?auto_17303 ) ) ( IS-CRATE ?auto_17287 ) ( not ( = ?auto_17298 ?auto_17293 ) ) ( HOIST-AT ?auto_17307 ?auto_17298 ) ( AVAILABLE ?auto_17307 ) ( SURFACE-AT ?auto_17287 ?auto_17298 ) ( ON ?auto_17287 ?auto_17299 ) ( CLEAR ?auto_17287 ) ( not ( = ?auto_17286 ?auto_17287 ) ) ( not ( = ?auto_17286 ?auto_17299 ) ) ( not ( = ?auto_17287 ?auto_17299 ) ) ( not ( = ?auto_17295 ?auto_17307 ) ) ( IS-CRATE ?auto_17286 ) ( not ( = ?auto_17296 ?auto_17293 ) ) ( HOIST-AT ?auto_17309 ?auto_17296 ) ( AVAILABLE ?auto_17309 ) ( SURFACE-AT ?auto_17286 ?auto_17296 ) ( ON ?auto_17286 ?auto_17308 ) ( CLEAR ?auto_17286 ) ( not ( = ?auto_17285 ?auto_17286 ) ) ( not ( = ?auto_17285 ?auto_17308 ) ) ( not ( = ?auto_17286 ?auto_17308 ) ) ( not ( = ?auto_17295 ?auto_17309 ) ) ( IS-CRATE ?auto_17285 ) ( not ( = ?auto_17311 ?auto_17293 ) ) ( HOIST-AT ?auto_17301 ?auto_17311 ) ( SURFACE-AT ?auto_17285 ?auto_17311 ) ( ON ?auto_17285 ?auto_17310 ) ( CLEAR ?auto_17285 ) ( not ( = ?auto_17284 ?auto_17285 ) ) ( not ( = ?auto_17284 ?auto_17310 ) ) ( not ( = ?auto_17285 ?auto_17310 ) ) ( not ( = ?auto_17295 ?auto_17301 ) ) ( IS-CRATE ?auto_17284 ) ( AVAILABLE ?auto_17301 ) ( SURFACE-AT ?auto_17284 ?auto_17311 ) ( ON ?auto_17284 ?auto_17300 ) ( CLEAR ?auto_17284 ) ( not ( = ?auto_17283 ?auto_17284 ) ) ( not ( = ?auto_17283 ?auto_17300 ) ) ( not ( = ?auto_17284 ?auto_17300 ) ) ( SURFACE-AT ?auto_17282 ?auto_17293 ) ( CLEAR ?auto_17282 ) ( IS-CRATE ?auto_17283 ) ( AVAILABLE ?auto_17295 ) ( not ( = ?auto_17297 ?auto_17293 ) ) ( HOIST-AT ?auto_17302 ?auto_17297 ) ( AVAILABLE ?auto_17302 ) ( SURFACE-AT ?auto_17283 ?auto_17297 ) ( ON ?auto_17283 ?auto_17305 ) ( CLEAR ?auto_17283 ) ( TRUCK-AT ?auto_17291 ?auto_17293 ) ( not ( = ?auto_17282 ?auto_17283 ) ) ( not ( = ?auto_17282 ?auto_17305 ) ) ( not ( = ?auto_17283 ?auto_17305 ) ) ( not ( = ?auto_17295 ?auto_17302 ) ) ( not ( = ?auto_17282 ?auto_17284 ) ) ( not ( = ?auto_17282 ?auto_17300 ) ) ( not ( = ?auto_17284 ?auto_17305 ) ) ( not ( = ?auto_17311 ?auto_17297 ) ) ( not ( = ?auto_17301 ?auto_17302 ) ) ( not ( = ?auto_17300 ?auto_17305 ) ) ( not ( = ?auto_17282 ?auto_17285 ) ) ( not ( = ?auto_17282 ?auto_17310 ) ) ( not ( = ?auto_17283 ?auto_17285 ) ) ( not ( = ?auto_17283 ?auto_17310 ) ) ( not ( = ?auto_17285 ?auto_17300 ) ) ( not ( = ?auto_17285 ?auto_17305 ) ) ( not ( = ?auto_17310 ?auto_17300 ) ) ( not ( = ?auto_17310 ?auto_17305 ) ) ( not ( = ?auto_17282 ?auto_17286 ) ) ( not ( = ?auto_17282 ?auto_17308 ) ) ( not ( = ?auto_17283 ?auto_17286 ) ) ( not ( = ?auto_17283 ?auto_17308 ) ) ( not ( = ?auto_17284 ?auto_17286 ) ) ( not ( = ?auto_17284 ?auto_17308 ) ) ( not ( = ?auto_17286 ?auto_17310 ) ) ( not ( = ?auto_17286 ?auto_17300 ) ) ( not ( = ?auto_17286 ?auto_17305 ) ) ( not ( = ?auto_17296 ?auto_17311 ) ) ( not ( = ?auto_17296 ?auto_17297 ) ) ( not ( = ?auto_17309 ?auto_17301 ) ) ( not ( = ?auto_17309 ?auto_17302 ) ) ( not ( = ?auto_17308 ?auto_17310 ) ) ( not ( = ?auto_17308 ?auto_17300 ) ) ( not ( = ?auto_17308 ?auto_17305 ) ) ( not ( = ?auto_17282 ?auto_17287 ) ) ( not ( = ?auto_17282 ?auto_17299 ) ) ( not ( = ?auto_17283 ?auto_17287 ) ) ( not ( = ?auto_17283 ?auto_17299 ) ) ( not ( = ?auto_17284 ?auto_17287 ) ) ( not ( = ?auto_17284 ?auto_17299 ) ) ( not ( = ?auto_17285 ?auto_17287 ) ) ( not ( = ?auto_17285 ?auto_17299 ) ) ( not ( = ?auto_17287 ?auto_17308 ) ) ( not ( = ?auto_17287 ?auto_17310 ) ) ( not ( = ?auto_17287 ?auto_17300 ) ) ( not ( = ?auto_17287 ?auto_17305 ) ) ( not ( = ?auto_17298 ?auto_17296 ) ) ( not ( = ?auto_17298 ?auto_17311 ) ) ( not ( = ?auto_17298 ?auto_17297 ) ) ( not ( = ?auto_17307 ?auto_17309 ) ) ( not ( = ?auto_17307 ?auto_17301 ) ) ( not ( = ?auto_17307 ?auto_17302 ) ) ( not ( = ?auto_17299 ?auto_17308 ) ) ( not ( = ?auto_17299 ?auto_17310 ) ) ( not ( = ?auto_17299 ?auto_17300 ) ) ( not ( = ?auto_17299 ?auto_17305 ) ) ( not ( = ?auto_17282 ?auto_17288 ) ) ( not ( = ?auto_17282 ?auto_17306 ) ) ( not ( = ?auto_17283 ?auto_17288 ) ) ( not ( = ?auto_17283 ?auto_17306 ) ) ( not ( = ?auto_17284 ?auto_17288 ) ) ( not ( = ?auto_17284 ?auto_17306 ) ) ( not ( = ?auto_17285 ?auto_17288 ) ) ( not ( = ?auto_17285 ?auto_17306 ) ) ( not ( = ?auto_17286 ?auto_17288 ) ) ( not ( = ?auto_17286 ?auto_17306 ) ) ( not ( = ?auto_17288 ?auto_17299 ) ) ( not ( = ?auto_17288 ?auto_17308 ) ) ( not ( = ?auto_17288 ?auto_17310 ) ) ( not ( = ?auto_17288 ?auto_17300 ) ) ( not ( = ?auto_17288 ?auto_17305 ) ) ( not ( = ?auto_17304 ?auto_17298 ) ) ( not ( = ?auto_17304 ?auto_17296 ) ) ( not ( = ?auto_17304 ?auto_17311 ) ) ( not ( = ?auto_17304 ?auto_17297 ) ) ( not ( = ?auto_17303 ?auto_17307 ) ) ( not ( = ?auto_17303 ?auto_17309 ) ) ( not ( = ?auto_17303 ?auto_17301 ) ) ( not ( = ?auto_17303 ?auto_17302 ) ) ( not ( = ?auto_17306 ?auto_17299 ) ) ( not ( = ?auto_17306 ?auto_17308 ) ) ( not ( = ?auto_17306 ?auto_17310 ) ) ( not ( = ?auto_17306 ?auto_17300 ) ) ( not ( = ?auto_17306 ?auto_17305 ) ) ( not ( = ?auto_17282 ?auto_17289 ) ) ( not ( = ?auto_17282 ?auto_17290 ) ) ( not ( = ?auto_17283 ?auto_17289 ) ) ( not ( = ?auto_17283 ?auto_17290 ) ) ( not ( = ?auto_17284 ?auto_17289 ) ) ( not ( = ?auto_17284 ?auto_17290 ) ) ( not ( = ?auto_17285 ?auto_17289 ) ) ( not ( = ?auto_17285 ?auto_17290 ) ) ( not ( = ?auto_17286 ?auto_17289 ) ) ( not ( = ?auto_17286 ?auto_17290 ) ) ( not ( = ?auto_17287 ?auto_17289 ) ) ( not ( = ?auto_17287 ?auto_17290 ) ) ( not ( = ?auto_17289 ?auto_17306 ) ) ( not ( = ?auto_17289 ?auto_17299 ) ) ( not ( = ?auto_17289 ?auto_17308 ) ) ( not ( = ?auto_17289 ?auto_17310 ) ) ( not ( = ?auto_17289 ?auto_17300 ) ) ( not ( = ?auto_17289 ?auto_17305 ) ) ( not ( = ?auto_17292 ?auto_17304 ) ) ( not ( = ?auto_17292 ?auto_17298 ) ) ( not ( = ?auto_17292 ?auto_17296 ) ) ( not ( = ?auto_17292 ?auto_17311 ) ) ( not ( = ?auto_17292 ?auto_17297 ) ) ( not ( = ?auto_17294 ?auto_17303 ) ) ( not ( = ?auto_17294 ?auto_17307 ) ) ( not ( = ?auto_17294 ?auto_17309 ) ) ( not ( = ?auto_17294 ?auto_17301 ) ) ( not ( = ?auto_17294 ?auto_17302 ) ) ( not ( = ?auto_17290 ?auto_17306 ) ) ( not ( = ?auto_17290 ?auto_17299 ) ) ( not ( = ?auto_17290 ?auto_17308 ) ) ( not ( = ?auto_17290 ?auto_17310 ) ) ( not ( = ?auto_17290 ?auto_17300 ) ) ( not ( = ?auto_17290 ?auto_17305 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_17282 ?auto_17283 ?auto_17284 ?auto_17285 ?auto_17286 ?auto_17287 ?auto_17288 )
      ( MAKE-1CRATE ?auto_17288 ?auto_17289 )
      ( MAKE-7CRATE-VERIFY ?auto_17282 ?auto_17283 ?auto_17284 ?auto_17285 ?auto_17286 ?auto_17287 ?auto_17288 ?auto_17289 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_17331 - SURFACE
      ?auto_17332 - SURFACE
      ?auto_17333 - SURFACE
      ?auto_17334 - SURFACE
      ?auto_17335 - SURFACE
      ?auto_17336 - SURFACE
      ?auto_17337 - SURFACE
      ?auto_17338 - SURFACE
      ?auto_17339 - SURFACE
    )
    :vars
    (
      ?auto_17345 - HOIST
      ?auto_17340 - PLACE
      ?auto_17342 - PLACE
      ?auto_17344 - HOIST
      ?auto_17343 - SURFACE
      ?auto_17362 - SURFACE
      ?auto_17347 - PLACE
      ?auto_17354 - HOIST
      ?auto_17346 - SURFACE
      ?auto_17360 - PLACE
      ?auto_17351 - HOIST
      ?auto_17358 - SURFACE
      ?auto_17349 - PLACE
      ?auto_17353 - HOIST
      ?auto_17352 - SURFACE
      ?auto_17348 - PLACE
      ?auto_17356 - HOIST
      ?auto_17361 - SURFACE
      ?auto_17357 - SURFACE
      ?auto_17359 - PLACE
      ?auto_17355 - HOIST
      ?auto_17350 - SURFACE
      ?auto_17341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17345 ?auto_17340 ) ( IS-CRATE ?auto_17339 ) ( not ( = ?auto_17342 ?auto_17340 ) ) ( HOIST-AT ?auto_17344 ?auto_17342 ) ( SURFACE-AT ?auto_17339 ?auto_17342 ) ( ON ?auto_17339 ?auto_17343 ) ( CLEAR ?auto_17339 ) ( not ( = ?auto_17338 ?auto_17339 ) ) ( not ( = ?auto_17338 ?auto_17343 ) ) ( not ( = ?auto_17339 ?auto_17343 ) ) ( not ( = ?auto_17345 ?auto_17344 ) ) ( IS-CRATE ?auto_17338 ) ( AVAILABLE ?auto_17344 ) ( SURFACE-AT ?auto_17338 ?auto_17342 ) ( ON ?auto_17338 ?auto_17362 ) ( CLEAR ?auto_17338 ) ( not ( = ?auto_17337 ?auto_17338 ) ) ( not ( = ?auto_17337 ?auto_17362 ) ) ( not ( = ?auto_17338 ?auto_17362 ) ) ( IS-CRATE ?auto_17337 ) ( not ( = ?auto_17347 ?auto_17340 ) ) ( HOIST-AT ?auto_17354 ?auto_17347 ) ( AVAILABLE ?auto_17354 ) ( SURFACE-AT ?auto_17337 ?auto_17347 ) ( ON ?auto_17337 ?auto_17346 ) ( CLEAR ?auto_17337 ) ( not ( = ?auto_17336 ?auto_17337 ) ) ( not ( = ?auto_17336 ?auto_17346 ) ) ( not ( = ?auto_17337 ?auto_17346 ) ) ( not ( = ?auto_17345 ?auto_17354 ) ) ( IS-CRATE ?auto_17336 ) ( not ( = ?auto_17360 ?auto_17340 ) ) ( HOIST-AT ?auto_17351 ?auto_17360 ) ( AVAILABLE ?auto_17351 ) ( SURFACE-AT ?auto_17336 ?auto_17360 ) ( ON ?auto_17336 ?auto_17358 ) ( CLEAR ?auto_17336 ) ( not ( = ?auto_17335 ?auto_17336 ) ) ( not ( = ?auto_17335 ?auto_17358 ) ) ( not ( = ?auto_17336 ?auto_17358 ) ) ( not ( = ?auto_17345 ?auto_17351 ) ) ( IS-CRATE ?auto_17335 ) ( not ( = ?auto_17349 ?auto_17340 ) ) ( HOIST-AT ?auto_17353 ?auto_17349 ) ( AVAILABLE ?auto_17353 ) ( SURFACE-AT ?auto_17335 ?auto_17349 ) ( ON ?auto_17335 ?auto_17352 ) ( CLEAR ?auto_17335 ) ( not ( = ?auto_17334 ?auto_17335 ) ) ( not ( = ?auto_17334 ?auto_17352 ) ) ( not ( = ?auto_17335 ?auto_17352 ) ) ( not ( = ?auto_17345 ?auto_17353 ) ) ( IS-CRATE ?auto_17334 ) ( not ( = ?auto_17348 ?auto_17340 ) ) ( HOIST-AT ?auto_17356 ?auto_17348 ) ( SURFACE-AT ?auto_17334 ?auto_17348 ) ( ON ?auto_17334 ?auto_17361 ) ( CLEAR ?auto_17334 ) ( not ( = ?auto_17333 ?auto_17334 ) ) ( not ( = ?auto_17333 ?auto_17361 ) ) ( not ( = ?auto_17334 ?auto_17361 ) ) ( not ( = ?auto_17345 ?auto_17356 ) ) ( IS-CRATE ?auto_17333 ) ( AVAILABLE ?auto_17356 ) ( SURFACE-AT ?auto_17333 ?auto_17348 ) ( ON ?auto_17333 ?auto_17357 ) ( CLEAR ?auto_17333 ) ( not ( = ?auto_17332 ?auto_17333 ) ) ( not ( = ?auto_17332 ?auto_17357 ) ) ( not ( = ?auto_17333 ?auto_17357 ) ) ( SURFACE-AT ?auto_17331 ?auto_17340 ) ( CLEAR ?auto_17331 ) ( IS-CRATE ?auto_17332 ) ( AVAILABLE ?auto_17345 ) ( not ( = ?auto_17359 ?auto_17340 ) ) ( HOIST-AT ?auto_17355 ?auto_17359 ) ( AVAILABLE ?auto_17355 ) ( SURFACE-AT ?auto_17332 ?auto_17359 ) ( ON ?auto_17332 ?auto_17350 ) ( CLEAR ?auto_17332 ) ( TRUCK-AT ?auto_17341 ?auto_17340 ) ( not ( = ?auto_17331 ?auto_17332 ) ) ( not ( = ?auto_17331 ?auto_17350 ) ) ( not ( = ?auto_17332 ?auto_17350 ) ) ( not ( = ?auto_17345 ?auto_17355 ) ) ( not ( = ?auto_17331 ?auto_17333 ) ) ( not ( = ?auto_17331 ?auto_17357 ) ) ( not ( = ?auto_17333 ?auto_17350 ) ) ( not ( = ?auto_17348 ?auto_17359 ) ) ( not ( = ?auto_17356 ?auto_17355 ) ) ( not ( = ?auto_17357 ?auto_17350 ) ) ( not ( = ?auto_17331 ?auto_17334 ) ) ( not ( = ?auto_17331 ?auto_17361 ) ) ( not ( = ?auto_17332 ?auto_17334 ) ) ( not ( = ?auto_17332 ?auto_17361 ) ) ( not ( = ?auto_17334 ?auto_17357 ) ) ( not ( = ?auto_17334 ?auto_17350 ) ) ( not ( = ?auto_17361 ?auto_17357 ) ) ( not ( = ?auto_17361 ?auto_17350 ) ) ( not ( = ?auto_17331 ?auto_17335 ) ) ( not ( = ?auto_17331 ?auto_17352 ) ) ( not ( = ?auto_17332 ?auto_17335 ) ) ( not ( = ?auto_17332 ?auto_17352 ) ) ( not ( = ?auto_17333 ?auto_17335 ) ) ( not ( = ?auto_17333 ?auto_17352 ) ) ( not ( = ?auto_17335 ?auto_17361 ) ) ( not ( = ?auto_17335 ?auto_17357 ) ) ( not ( = ?auto_17335 ?auto_17350 ) ) ( not ( = ?auto_17349 ?auto_17348 ) ) ( not ( = ?auto_17349 ?auto_17359 ) ) ( not ( = ?auto_17353 ?auto_17356 ) ) ( not ( = ?auto_17353 ?auto_17355 ) ) ( not ( = ?auto_17352 ?auto_17361 ) ) ( not ( = ?auto_17352 ?auto_17357 ) ) ( not ( = ?auto_17352 ?auto_17350 ) ) ( not ( = ?auto_17331 ?auto_17336 ) ) ( not ( = ?auto_17331 ?auto_17358 ) ) ( not ( = ?auto_17332 ?auto_17336 ) ) ( not ( = ?auto_17332 ?auto_17358 ) ) ( not ( = ?auto_17333 ?auto_17336 ) ) ( not ( = ?auto_17333 ?auto_17358 ) ) ( not ( = ?auto_17334 ?auto_17336 ) ) ( not ( = ?auto_17334 ?auto_17358 ) ) ( not ( = ?auto_17336 ?auto_17352 ) ) ( not ( = ?auto_17336 ?auto_17361 ) ) ( not ( = ?auto_17336 ?auto_17357 ) ) ( not ( = ?auto_17336 ?auto_17350 ) ) ( not ( = ?auto_17360 ?auto_17349 ) ) ( not ( = ?auto_17360 ?auto_17348 ) ) ( not ( = ?auto_17360 ?auto_17359 ) ) ( not ( = ?auto_17351 ?auto_17353 ) ) ( not ( = ?auto_17351 ?auto_17356 ) ) ( not ( = ?auto_17351 ?auto_17355 ) ) ( not ( = ?auto_17358 ?auto_17352 ) ) ( not ( = ?auto_17358 ?auto_17361 ) ) ( not ( = ?auto_17358 ?auto_17357 ) ) ( not ( = ?auto_17358 ?auto_17350 ) ) ( not ( = ?auto_17331 ?auto_17337 ) ) ( not ( = ?auto_17331 ?auto_17346 ) ) ( not ( = ?auto_17332 ?auto_17337 ) ) ( not ( = ?auto_17332 ?auto_17346 ) ) ( not ( = ?auto_17333 ?auto_17337 ) ) ( not ( = ?auto_17333 ?auto_17346 ) ) ( not ( = ?auto_17334 ?auto_17337 ) ) ( not ( = ?auto_17334 ?auto_17346 ) ) ( not ( = ?auto_17335 ?auto_17337 ) ) ( not ( = ?auto_17335 ?auto_17346 ) ) ( not ( = ?auto_17337 ?auto_17358 ) ) ( not ( = ?auto_17337 ?auto_17352 ) ) ( not ( = ?auto_17337 ?auto_17361 ) ) ( not ( = ?auto_17337 ?auto_17357 ) ) ( not ( = ?auto_17337 ?auto_17350 ) ) ( not ( = ?auto_17347 ?auto_17360 ) ) ( not ( = ?auto_17347 ?auto_17349 ) ) ( not ( = ?auto_17347 ?auto_17348 ) ) ( not ( = ?auto_17347 ?auto_17359 ) ) ( not ( = ?auto_17354 ?auto_17351 ) ) ( not ( = ?auto_17354 ?auto_17353 ) ) ( not ( = ?auto_17354 ?auto_17356 ) ) ( not ( = ?auto_17354 ?auto_17355 ) ) ( not ( = ?auto_17346 ?auto_17358 ) ) ( not ( = ?auto_17346 ?auto_17352 ) ) ( not ( = ?auto_17346 ?auto_17361 ) ) ( not ( = ?auto_17346 ?auto_17357 ) ) ( not ( = ?auto_17346 ?auto_17350 ) ) ( not ( = ?auto_17331 ?auto_17338 ) ) ( not ( = ?auto_17331 ?auto_17362 ) ) ( not ( = ?auto_17332 ?auto_17338 ) ) ( not ( = ?auto_17332 ?auto_17362 ) ) ( not ( = ?auto_17333 ?auto_17338 ) ) ( not ( = ?auto_17333 ?auto_17362 ) ) ( not ( = ?auto_17334 ?auto_17338 ) ) ( not ( = ?auto_17334 ?auto_17362 ) ) ( not ( = ?auto_17335 ?auto_17338 ) ) ( not ( = ?auto_17335 ?auto_17362 ) ) ( not ( = ?auto_17336 ?auto_17338 ) ) ( not ( = ?auto_17336 ?auto_17362 ) ) ( not ( = ?auto_17338 ?auto_17346 ) ) ( not ( = ?auto_17338 ?auto_17358 ) ) ( not ( = ?auto_17338 ?auto_17352 ) ) ( not ( = ?auto_17338 ?auto_17361 ) ) ( not ( = ?auto_17338 ?auto_17357 ) ) ( not ( = ?auto_17338 ?auto_17350 ) ) ( not ( = ?auto_17342 ?auto_17347 ) ) ( not ( = ?auto_17342 ?auto_17360 ) ) ( not ( = ?auto_17342 ?auto_17349 ) ) ( not ( = ?auto_17342 ?auto_17348 ) ) ( not ( = ?auto_17342 ?auto_17359 ) ) ( not ( = ?auto_17344 ?auto_17354 ) ) ( not ( = ?auto_17344 ?auto_17351 ) ) ( not ( = ?auto_17344 ?auto_17353 ) ) ( not ( = ?auto_17344 ?auto_17356 ) ) ( not ( = ?auto_17344 ?auto_17355 ) ) ( not ( = ?auto_17362 ?auto_17346 ) ) ( not ( = ?auto_17362 ?auto_17358 ) ) ( not ( = ?auto_17362 ?auto_17352 ) ) ( not ( = ?auto_17362 ?auto_17361 ) ) ( not ( = ?auto_17362 ?auto_17357 ) ) ( not ( = ?auto_17362 ?auto_17350 ) ) ( not ( = ?auto_17331 ?auto_17339 ) ) ( not ( = ?auto_17331 ?auto_17343 ) ) ( not ( = ?auto_17332 ?auto_17339 ) ) ( not ( = ?auto_17332 ?auto_17343 ) ) ( not ( = ?auto_17333 ?auto_17339 ) ) ( not ( = ?auto_17333 ?auto_17343 ) ) ( not ( = ?auto_17334 ?auto_17339 ) ) ( not ( = ?auto_17334 ?auto_17343 ) ) ( not ( = ?auto_17335 ?auto_17339 ) ) ( not ( = ?auto_17335 ?auto_17343 ) ) ( not ( = ?auto_17336 ?auto_17339 ) ) ( not ( = ?auto_17336 ?auto_17343 ) ) ( not ( = ?auto_17337 ?auto_17339 ) ) ( not ( = ?auto_17337 ?auto_17343 ) ) ( not ( = ?auto_17339 ?auto_17362 ) ) ( not ( = ?auto_17339 ?auto_17346 ) ) ( not ( = ?auto_17339 ?auto_17358 ) ) ( not ( = ?auto_17339 ?auto_17352 ) ) ( not ( = ?auto_17339 ?auto_17361 ) ) ( not ( = ?auto_17339 ?auto_17357 ) ) ( not ( = ?auto_17339 ?auto_17350 ) ) ( not ( = ?auto_17343 ?auto_17362 ) ) ( not ( = ?auto_17343 ?auto_17346 ) ) ( not ( = ?auto_17343 ?auto_17358 ) ) ( not ( = ?auto_17343 ?auto_17352 ) ) ( not ( = ?auto_17343 ?auto_17361 ) ) ( not ( = ?auto_17343 ?auto_17357 ) ) ( not ( = ?auto_17343 ?auto_17350 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_17331 ?auto_17332 ?auto_17333 ?auto_17334 ?auto_17335 ?auto_17336 ?auto_17337 ?auto_17338 )
      ( MAKE-1CRATE ?auto_17338 ?auto_17339 )
      ( MAKE-8CRATE-VERIFY ?auto_17331 ?auto_17332 ?auto_17333 ?auto_17334 ?auto_17335 ?auto_17336 ?auto_17337 ?auto_17338 ?auto_17339 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_17383 - SURFACE
      ?auto_17384 - SURFACE
      ?auto_17385 - SURFACE
      ?auto_17386 - SURFACE
      ?auto_17387 - SURFACE
      ?auto_17388 - SURFACE
      ?auto_17389 - SURFACE
      ?auto_17390 - SURFACE
      ?auto_17391 - SURFACE
      ?auto_17392 - SURFACE
    )
    :vars
    (
      ?auto_17393 - HOIST
      ?auto_17398 - PLACE
      ?auto_17396 - PLACE
      ?auto_17397 - HOIST
      ?auto_17394 - SURFACE
      ?auto_17417 - PLACE
      ?auto_17410 - HOIST
      ?auto_17418 - SURFACE
      ?auto_17407 - SURFACE
      ?auto_17413 - PLACE
      ?auto_17415 - HOIST
      ?auto_17406 - SURFACE
      ?auto_17412 - PLACE
      ?auto_17405 - HOIST
      ?auto_17401 - SURFACE
      ?auto_17411 - PLACE
      ?auto_17403 - HOIST
      ?auto_17404 - SURFACE
      ?auto_17409 - PLACE
      ?auto_17416 - HOIST
      ?auto_17414 - SURFACE
      ?auto_17400 - SURFACE
      ?auto_17402 - PLACE
      ?auto_17399 - HOIST
      ?auto_17408 - SURFACE
      ?auto_17395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17393 ?auto_17398 ) ( IS-CRATE ?auto_17392 ) ( not ( = ?auto_17396 ?auto_17398 ) ) ( HOIST-AT ?auto_17397 ?auto_17396 ) ( AVAILABLE ?auto_17397 ) ( SURFACE-AT ?auto_17392 ?auto_17396 ) ( ON ?auto_17392 ?auto_17394 ) ( CLEAR ?auto_17392 ) ( not ( = ?auto_17391 ?auto_17392 ) ) ( not ( = ?auto_17391 ?auto_17394 ) ) ( not ( = ?auto_17392 ?auto_17394 ) ) ( not ( = ?auto_17393 ?auto_17397 ) ) ( IS-CRATE ?auto_17391 ) ( not ( = ?auto_17417 ?auto_17398 ) ) ( HOIST-AT ?auto_17410 ?auto_17417 ) ( SURFACE-AT ?auto_17391 ?auto_17417 ) ( ON ?auto_17391 ?auto_17418 ) ( CLEAR ?auto_17391 ) ( not ( = ?auto_17390 ?auto_17391 ) ) ( not ( = ?auto_17390 ?auto_17418 ) ) ( not ( = ?auto_17391 ?auto_17418 ) ) ( not ( = ?auto_17393 ?auto_17410 ) ) ( IS-CRATE ?auto_17390 ) ( AVAILABLE ?auto_17410 ) ( SURFACE-AT ?auto_17390 ?auto_17417 ) ( ON ?auto_17390 ?auto_17407 ) ( CLEAR ?auto_17390 ) ( not ( = ?auto_17389 ?auto_17390 ) ) ( not ( = ?auto_17389 ?auto_17407 ) ) ( not ( = ?auto_17390 ?auto_17407 ) ) ( IS-CRATE ?auto_17389 ) ( not ( = ?auto_17413 ?auto_17398 ) ) ( HOIST-AT ?auto_17415 ?auto_17413 ) ( AVAILABLE ?auto_17415 ) ( SURFACE-AT ?auto_17389 ?auto_17413 ) ( ON ?auto_17389 ?auto_17406 ) ( CLEAR ?auto_17389 ) ( not ( = ?auto_17388 ?auto_17389 ) ) ( not ( = ?auto_17388 ?auto_17406 ) ) ( not ( = ?auto_17389 ?auto_17406 ) ) ( not ( = ?auto_17393 ?auto_17415 ) ) ( IS-CRATE ?auto_17388 ) ( not ( = ?auto_17412 ?auto_17398 ) ) ( HOIST-AT ?auto_17405 ?auto_17412 ) ( AVAILABLE ?auto_17405 ) ( SURFACE-AT ?auto_17388 ?auto_17412 ) ( ON ?auto_17388 ?auto_17401 ) ( CLEAR ?auto_17388 ) ( not ( = ?auto_17387 ?auto_17388 ) ) ( not ( = ?auto_17387 ?auto_17401 ) ) ( not ( = ?auto_17388 ?auto_17401 ) ) ( not ( = ?auto_17393 ?auto_17405 ) ) ( IS-CRATE ?auto_17387 ) ( not ( = ?auto_17411 ?auto_17398 ) ) ( HOIST-AT ?auto_17403 ?auto_17411 ) ( AVAILABLE ?auto_17403 ) ( SURFACE-AT ?auto_17387 ?auto_17411 ) ( ON ?auto_17387 ?auto_17404 ) ( CLEAR ?auto_17387 ) ( not ( = ?auto_17386 ?auto_17387 ) ) ( not ( = ?auto_17386 ?auto_17404 ) ) ( not ( = ?auto_17387 ?auto_17404 ) ) ( not ( = ?auto_17393 ?auto_17403 ) ) ( IS-CRATE ?auto_17386 ) ( not ( = ?auto_17409 ?auto_17398 ) ) ( HOIST-AT ?auto_17416 ?auto_17409 ) ( SURFACE-AT ?auto_17386 ?auto_17409 ) ( ON ?auto_17386 ?auto_17414 ) ( CLEAR ?auto_17386 ) ( not ( = ?auto_17385 ?auto_17386 ) ) ( not ( = ?auto_17385 ?auto_17414 ) ) ( not ( = ?auto_17386 ?auto_17414 ) ) ( not ( = ?auto_17393 ?auto_17416 ) ) ( IS-CRATE ?auto_17385 ) ( AVAILABLE ?auto_17416 ) ( SURFACE-AT ?auto_17385 ?auto_17409 ) ( ON ?auto_17385 ?auto_17400 ) ( CLEAR ?auto_17385 ) ( not ( = ?auto_17384 ?auto_17385 ) ) ( not ( = ?auto_17384 ?auto_17400 ) ) ( not ( = ?auto_17385 ?auto_17400 ) ) ( SURFACE-AT ?auto_17383 ?auto_17398 ) ( CLEAR ?auto_17383 ) ( IS-CRATE ?auto_17384 ) ( AVAILABLE ?auto_17393 ) ( not ( = ?auto_17402 ?auto_17398 ) ) ( HOIST-AT ?auto_17399 ?auto_17402 ) ( AVAILABLE ?auto_17399 ) ( SURFACE-AT ?auto_17384 ?auto_17402 ) ( ON ?auto_17384 ?auto_17408 ) ( CLEAR ?auto_17384 ) ( TRUCK-AT ?auto_17395 ?auto_17398 ) ( not ( = ?auto_17383 ?auto_17384 ) ) ( not ( = ?auto_17383 ?auto_17408 ) ) ( not ( = ?auto_17384 ?auto_17408 ) ) ( not ( = ?auto_17393 ?auto_17399 ) ) ( not ( = ?auto_17383 ?auto_17385 ) ) ( not ( = ?auto_17383 ?auto_17400 ) ) ( not ( = ?auto_17385 ?auto_17408 ) ) ( not ( = ?auto_17409 ?auto_17402 ) ) ( not ( = ?auto_17416 ?auto_17399 ) ) ( not ( = ?auto_17400 ?auto_17408 ) ) ( not ( = ?auto_17383 ?auto_17386 ) ) ( not ( = ?auto_17383 ?auto_17414 ) ) ( not ( = ?auto_17384 ?auto_17386 ) ) ( not ( = ?auto_17384 ?auto_17414 ) ) ( not ( = ?auto_17386 ?auto_17400 ) ) ( not ( = ?auto_17386 ?auto_17408 ) ) ( not ( = ?auto_17414 ?auto_17400 ) ) ( not ( = ?auto_17414 ?auto_17408 ) ) ( not ( = ?auto_17383 ?auto_17387 ) ) ( not ( = ?auto_17383 ?auto_17404 ) ) ( not ( = ?auto_17384 ?auto_17387 ) ) ( not ( = ?auto_17384 ?auto_17404 ) ) ( not ( = ?auto_17385 ?auto_17387 ) ) ( not ( = ?auto_17385 ?auto_17404 ) ) ( not ( = ?auto_17387 ?auto_17414 ) ) ( not ( = ?auto_17387 ?auto_17400 ) ) ( not ( = ?auto_17387 ?auto_17408 ) ) ( not ( = ?auto_17411 ?auto_17409 ) ) ( not ( = ?auto_17411 ?auto_17402 ) ) ( not ( = ?auto_17403 ?auto_17416 ) ) ( not ( = ?auto_17403 ?auto_17399 ) ) ( not ( = ?auto_17404 ?auto_17414 ) ) ( not ( = ?auto_17404 ?auto_17400 ) ) ( not ( = ?auto_17404 ?auto_17408 ) ) ( not ( = ?auto_17383 ?auto_17388 ) ) ( not ( = ?auto_17383 ?auto_17401 ) ) ( not ( = ?auto_17384 ?auto_17388 ) ) ( not ( = ?auto_17384 ?auto_17401 ) ) ( not ( = ?auto_17385 ?auto_17388 ) ) ( not ( = ?auto_17385 ?auto_17401 ) ) ( not ( = ?auto_17386 ?auto_17388 ) ) ( not ( = ?auto_17386 ?auto_17401 ) ) ( not ( = ?auto_17388 ?auto_17404 ) ) ( not ( = ?auto_17388 ?auto_17414 ) ) ( not ( = ?auto_17388 ?auto_17400 ) ) ( not ( = ?auto_17388 ?auto_17408 ) ) ( not ( = ?auto_17412 ?auto_17411 ) ) ( not ( = ?auto_17412 ?auto_17409 ) ) ( not ( = ?auto_17412 ?auto_17402 ) ) ( not ( = ?auto_17405 ?auto_17403 ) ) ( not ( = ?auto_17405 ?auto_17416 ) ) ( not ( = ?auto_17405 ?auto_17399 ) ) ( not ( = ?auto_17401 ?auto_17404 ) ) ( not ( = ?auto_17401 ?auto_17414 ) ) ( not ( = ?auto_17401 ?auto_17400 ) ) ( not ( = ?auto_17401 ?auto_17408 ) ) ( not ( = ?auto_17383 ?auto_17389 ) ) ( not ( = ?auto_17383 ?auto_17406 ) ) ( not ( = ?auto_17384 ?auto_17389 ) ) ( not ( = ?auto_17384 ?auto_17406 ) ) ( not ( = ?auto_17385 ?auto_17389 ) ) ( not ( = ?auto_17385 ?auto_17406 ) ) ( not ( = ?auto_17386 ?auto_17389 ) ) ( not ( = ?auto_17386 ?auto_17406 ) ) ( not ( = ?auto_17387 ?auto_17389 ) ) ( not ( = ?auto_17387 ?auto_17406 ) ) ( not ( = ?auto_17389 ?auto_17401 ) ) ( not ( = ?auto_17389 ?auto_17404 ) ) ( not ( = ?auto_17389 ?auto_17414 ) ) ( not ( = ?auto_17389 ?auto_17400 ) ) ( not ( = ?auto_17389 ?auto_17408 ) ) ( not ( = ?auto_17413 ?auto_17412 ) ) ( not ( = ?auto_17413 ?auto_17411 ) ) ( not ( = ?auto_17413 ?auto_17409 ) ) ( not ( = ?auto_17413 ?auto_17402 ) ) ( not ( = ?auto_17415 ?auto_17405 ) ) ( not ( = ?auto_17415 ?auto_17403 ) ) ( not ( = ?auto_17415 ?auto_17416 ) ) ( not ( = ?auto_17415 ?auto_17399 ) ) ( not ( = ?auto_17406 ?auto_17401 ) ) ( not ( = ?auto_17406 ?auto_17404 ) ) ( not ( = ?auto_17406 ?auto_17414 ) ) ( not ( = ?auto_17406 ?auto_17400 ) ) ( not ( = ?auto_17406 ?auto_17408 ) ) ( not ( = ?auto_17383 ?auto_17390 ) ) ( not ( = ?auto_17383 ?auto_17407 ) ) ( not ( = ?auto_17384 ?auto_17390 ) ) ( not ( = ?auto_17384 ?auto_17407 ) ) ( not ( = ?auto_17385 ?auto_17390 ) ) ( not ( = ?auto_17385 ?auto_17407 ) ) ( not ( = ?auto_17386 ?auto_17390 ) ) ( not ( = ?auto_17386 ?auto_17407 ) ) ( not ( = ?auto_17387 ?auto_17390 ) ) ( not ( = ?auto_17387 ?auto_17407 ) ) ( not ( = ?auto_17388 ?auto_17390 ) ) ( not ( = ?auto_17388 ?auto_17407 ) ) ( not ( = ?auto_17390 ?auto_17406 ) ) ( not ( = ?auto_17390 ?auto_17401 ) ) ( not ( = ?auto_17390 ?auto_17404 ) ) ( not ( = ?auto_17390 ?auto_17414 ) ) ( not ( = ?auto_17390 ?auto_17400 ) ) ( not ( = ?auto_17390 ?auto_17408 ) ) ( not ( = ?auto_17417 ?auto_17413 ) ) ( not ( = ?auto_17417 ?auto_17412 ) ) ( not ( = ?auto_17417 ?auto_17411 ) ) ( not ( = ?auto_17417 ?auto_17409 ) ) ( not ( = ?auto_17417 ?auto_17402 ) ) ( not ( = ?auto_17410 ?auto_17415 ) ) ( not ( = ?auto_17410 ?auto_17405 ) ) ( not ( = ?auto_17410 ?auto_17403 ) ) ( not ( = ?auto_17410 ?auto_17416 ) ) ( not ( = ?auto_17410 ?auto_17399 ) ) ( not ( = ?auto_17407 ?auto_17406 ) ) ( not ( = ?auto_17407 ?auto_17401 ) ) ( not ( = ?auto_17407 ?auto_17404 ) ) ( not ( = ?auto_17407 ?auto_17414 ) ) ( not ( = ?auto_17407 ?auto_17400 ) ) ( not ( = ?auto_17407 ?auto_17408 ) ) ( not ( = ?auto_17383 ?auto_17391 ) ) ( not ( = ?auto_17383 ?auto_17418 ) ) ( not ( = ?auto_17384 ?auto_17391 ) ) ( not ( = ?auto_17384 ?auto_17418 ) ) ( not ( = ?auto_17385 ?auto_17391 ) ) ( not ( = ?auto_17385 ?auto_17418 ) ) ( not ( = ?auto_17386 ?auto_17391 ) ) ( not ( = ?auto_17386 ?auto_17418 ) ) ( not ( = ?auto_17387 ?auto_17391 ) ) ( not ( = ?auto_17387 ?auto_17418 ) ) ( not ( = ?auto_17388 ?auto_17391 ) ) ( not ( = ?auto_17388 ?auto_17418 ) ) ( not ( = ?auto_17389 ?auto_17391 ) ) ( not ( = ?auto_17389 ?auto_17418 ) ) ( not ( = ?auto_17391 ?auto_17407 ) ) ( not ( = ?auto_17391 ?auto_17406 ) ) ( not ( = ?auto_17391 ?auto_17401 ) ) ( not ( = ?auto_17391 ?auto_17404 ) ) ( not ( = ?auto_17391 ?auto_17414 ) ) ( not ( = ?auto_17391 ?auto_17400 ) ) ( not ( = ?auto_17391 ?auto_17408 ) ) ( not ( = ?auto_17418 ?auto_17407 ) ) ( not ( = ?auto_17418 ?auto_17406 ) ) ( not ( = ?auto_17418 ?auto_17401 ) ) ( not ( = ?auto_17418 ?auto_17404 ) ) ( not ( = ?auto_17418 ?auto_17414 ) ) ( not ( = ?auto_17418 ?auto_17400 ) ) ( not ( = ?auto_17418 ?auto_17408 ) ) ( not ( = ?auto_17383 ?auto_17392 ) ) ( not ( = ?auto_17383 ?auto_17394 ) ) ( not ( = ?auto_17384 ?auto_17392 ) ) ( not ( = ?auto_17384 ?auto_17394 ) ) ( not ( = ?auto_17385 ?auto_17392 ) ) ( not ( = ?auto_17385 ?auto_17394 ) ) ( not ( = ?auto_17386 ?auto_17392 ) ) ( not ( = ?auto_17386 ?auto_17394 ) ) ( not ( = ?auto_17387 ?auto_17392 ) ) ( not ( = ?auto_17387 ?auto_17394 ) ) ( not ( = ?auto_17388 ?auto_17392 ) ) ( not ( = ?auto_17388 ?auto_17394 ) ) ( not ( = ?auto_17389 ?auto_17392 ) ) ( not ( = ?auto_17389 ?auto_17394 ) ) ( not ( = ?auto_17390 ?auto_17392 ) ) ( not ( = ?auto_17390 ?auto_17394 ) ) ( not ( = ?auto_17392 ?auto_17418 ) ) ( not ( = ?auto_17392 ?auto_17407 ) ) ( not ( = ?auto_17392 ?auto_17406 ) ) ( not ( = ?auto_17392 ?auto_17401 ) ) ( not ( = ?auto_17392 ?auto_17404 ) ) ( not ( = ?auto_17392 ?auto_17414 ) ) ( not ( = ?auto_17392 ?auto_17400 ) ) ( not ( = ?auto_17392 ?auto_17408 ) ) ( not ( = ?auto_17396 ?auto_17417 ) ) ( not ( = ?auto_17396 ?auto_17413 ) ) ( not ( = ?auto_17396 ?auto_17412 ) ) ( not ( = ?auto_17396 ?auto_17411 ) ) ( not ( = ?auto_17396 ?auto_17409 ) ) ( not ( = ?auto_17396 ?auto_17402 ) ) ( not ( = ?auto_17397 ?auto_17410 ) ) ( not ( = ?auto_17397 ?auto_17415 ) ) ( not ( = ?auto_17397 ?auto_17405 ) ) ( not ( = ?auto_17397 ?auto_17403 ) ) ( not ( = ?auto_17397 ?auto_17416 ) ) ( not ( = ?auto_17397 ?auto_17399 ) ) ( not ( = ?auto_17394 ?auto_17418 ) ) ( not ( = ?auto_17394 ?auto_17407 ) ) ( not ( = ?auto_17394 ?auto_17406 ) ) ( not ( = ?auto_17394 ?auto_17401 ) ) ( not ( = ?auto_17394 ?auto_17404 ) ) ( not ( = ?auto_17394 ?auto_17414 ) ) ( not ( = ?auto_17394 ?auto_17400 ) ) ( not ( = ?auto_17394 ?auto_17408 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_17383 ?auto_17384 ?auto_17385 ?auto_17386 ?auto_17387 ?auto_17388 ?auto_17389 ?auto_17390 ?auto_17391 )
      ( MAKE-1CRATE ?auto_17391 ?auto_17392 )
      ( MAKE-9CRATE-VERIFY ?auto_17383 ?auto_17384 ?auto_17385 ?auto_17386 ?auto_17387 ?auto_17388 ?auto_17389 ?auto_17390 ?auto_17391 ?auto_17392 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_17440 - SURFACE
      ?auto_17441 - SURFACE
      ?auto_17442 - SURFACE
      ?auto_17443 - SURFACE
      ?auto_17444 - SURFACE
      ?auto_17445 - SURFACE
      ?auto_17446 - SURFACE
      ?auto_17447 - SURFACE
      ?auto_17448 - SURFACE
      ?auto_17449 - SURFACE
      ?auto_17450 - SURFACE
    )
    :vars
    (
      ?auto_17452 - HOIST
      ?auto_17454 - PLACE
      ?auto_17451 - PLACE
      ?auto_17455 - HOIST
      ?auto_17453 - SURFACE
      ?auto_17457 - PLACE
      ?auto_17462 - HOIST
      ?auto_17475 - SURFACE
      ?auto_17465 - PLACE
      ?auto_17477 - HOIST
      ?auto_17463 - SURFACE
      ?auto_17476 - SURFACE
      ?auto_17466 - PLACE
      ?auto_17461 - HOIST
      ?auto_17469 - SURFACE
      ?auto_17468 - PLACE
      ?auto_17470 - HOIST
      ?auto_17460 - SURFACE
      ?auto_17478 - PLACE
      ?auto_17472 - HOIST
      ?auto_17471 - SURFACE
      ?auto_17459 - PLACE
      ?auto_17464 - HOIST
      ?auto_17458 - SURFACE
      ?auto_17474 - SURFACE
      ?auto_17467 - PLACE
      ?auto_17473 - HOIST
      ?auto_17479 - SURFACE
      ?auto_17456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17452 ?auto_17454 ) ( IS-CRATE ?auto_17450 ) ( not ( = ?auto_17451 ?auto_17454 ) ) ( HOIST-AT ?auto_17455 ?auto_17451 ) ( AVAILABLE ?auto_17455 ) ( SURFACE-AT ?auto_17450 ?auto_17451 ) ( ON ?auto_17450 ?auto_17453 ) ( CLEAR ?auto_17450 ) ( not ( = ?auto_17449 ?auto_17450 ) ) ( not ( = ?auto_17449 ?auto_17453 ) ) ( not ( = ?auto_17450 ?auto_17453 ) ) ( not ( = ?auto_17452 ?auto_17455 ) ) ( IS-CRATE ?auto_17449 ) ( not ( = ?auto_17457 ?auto_17454 ) ) ( HOIST-AT ?auto_17462 ?auto_17457 ) ( AVAILABLE ?auto_17462 ) ( SURFACE-AT ?auto_17449 ?auto_17457 ) ( ON ?auto_17449 ?auto_17475 ) ( CLEAR ?auto_17449 ) ( not ( = ?auto_17448 ?auto_17449 ) ) ( not ( = ?auto_17448 ?auto_17475 ) ) ( not ( = ?auto_17449 ?auto_17475 ) ) ( not ( = ?auto_17452 ?auto_17462 ) ) ( IS-CRATE ?auto_17448 ) ( not ( = ?auto_17465 ?auto_17454 ) ) ( HOIST-AT ?auto_17477 ?auto_17465 ) ( SURFACE-AT ?auto_17448 ?auto_17465 ) ( ON ?auto_17448 ?auto_17463 ) ( CLEAR ?auto_17448 ) ( not ( = ?auto_17447 ?auto_17448 ) ) ( not ( = ?auto_17447 ?auto_17463 ) ) ( not ( = ?auto_17448 ?auto_17463 ) ) ( not ( = ?auto_17452 ?auto_17477 ) ) ( IS-CRATE ?auto_17447 ) ( AVAILABLE ?auto_17477 ) ( SURFACE-AT ?auto_17447 ?auto_17465 ) ( ON ?auto_17447 ?auto_17476 ) ( CLEAR ?auto_17447 ) ( not ( = ?auto_17446 ?auto_17447 ) ) ( not ( = ?auto_17446 ?auto_17476 ) ) ( not ( = ?auto_17447 ?auto_17476 ) ) ( IS-CRATE ?auto_17446 ) ( not ( = ?auto_17466 ?auto_17454 ) ) ( HOIST-AT ?auto_17461 ?auto_17466 ) ( AVAILABLE ?auto_17461 ) ( SURFACE-AT ?auto_17446 ?auto_17466 ) ( ON ?auto_17446 ?auto_17469 ) ( CLEAR ?auto_17446 ) ( not ( = ?auto_17445 ?auto_17446 ) ) ( not ( = ?auto_17445 ?auto_17469 ) ) ( not ( = ?auto_17446 ?auto_17469 ) ) ( not ( = ?auto_17452 ?auto_17461 ) ) ( IS-CRATE ?auto_17445 ) ( not ( = ?auto_17468 ?auto_17454 ) ) ( HOIST-AT ?auto_17470 ?auto_17468 ) ( AVAILABLE ?auto_17470 ) ( SURFACE-AT ?auto_17445 ?auto_17468 ) ( ON ?auto_17445 ?auto_17460 ) ( CLEAR ?auto_17445 ) ( not ( = ?auto_17444 ?auto_17445 ) ) ( not ( = ?auto_17444 ?auto_17460 ) ) ( not ( = ?auto_17445 ?auto_17460 ) ) ( not ( = ?auto_17452 ?auto_17470 ) ) ( IS-CRATE ?auto_17444 ) ( not ( = ?auto_17478 ?auto_17454 ) ) ( HOIST-AT ?auto_17472 ?auto_17478 ) ( AVAILABLE ?auto_17472 ) ( SURFACE-AT ?auto_17444 ?auto_17478 ) ( ON ?auto_17444 ?auto_17471 ) ( CLEAR ?auto_17444 ) ( not ( = ?auto_17443 ?auto_17444 ) ) ( not ( = ?auto_17443 ?auto_17471 ) ) ( not ( = ?auto_17444 ?auto_17471 ) ) ( not ( = ?auto_17452 ?auto_17472 ) ) ( IS-CRATE ?auto_17443 ) ( not ( = ?auto_17459 ?auto_17454 ) ) ( HOIST-AT ?auto_17464 ?auto_17459 ) ( SURFACE-AT ?auto_17443 ?auto_17459 ) ( ON ?auto_17443 ?auto_17458 ) ( CLEAR ?auto_17443 ) ( not ( = ?auto_17442 ?auto_17443 ) ) ( not ( = ?auto_17442 ?auto_17458 ) ) ( not ( = ?auto_17443 ?auto_17458 ) ) ( not ( = ?auto_17452 ?auto_17464 ) ) ( IS-CRATE ?auto_17442 ) ( AVAILABLE ?auto_17464 ) ( SURFACE-AT ?auto_17442 ?auto_17459 ) ( ON ?auto_17442 ?auto_17474 ) ( CLEAR ?auto_17442 ) ( not ( = ?auto_17441 ?auto_17442 ) ) ( not ( = ?auto_17441 ?auto_17474 ) ) ( not ( = ?auto_17442 ?auto_17474 ) ) ( SURFACE-AT ?auto_17440 ?auto_17454 ) ( CLEAR ?auto_17440 ) ( IS-CRATE ?auto_17441 ) ( AVAILABLE ?auto_17452 ) ( not ( = ?auto_17467 ?auto_17454 ) ) ( HOIST-AT ?auto_17473 ?auto_17467 ) ( AVAILABLE ?auto_17473 ) ( SURFACE-AT ?auto_17441 ?auto_17467 ) ( ON ?auto_17441 ?auto_17479 ) ( CLEAR ?auto_17441 ) ( TRUCK-AT ?auto_17456 ?auto_17454 ) ( not ( = ?auto_17440 ?auto_17441 ) ) ( not ( = ?auto_17440 ?auto_17479 ) ) ( not ( = ?auto_17441 ?auto_17479 ) ) ( not ( = ?auto_17452 ?auto_17473 ) ) ( not ( = ?auto_17440 ?auto_17442 ) ) ( not ( = ?auto_17440 ?auto_17474 ) ) ( not ( = ?auto_17442 ?auto_17479 ) ) ( not ( = ?auto_17459 ?auto_17467 ) ) ( not ( = ?auto_17464 ?auto_17473 ) ) ( not ( = ?auto_17474 ?auto_17479 ) ) ( not ( = ?auto_17440 ?auto_17443 ) ) ( not ( = ?auto_17440 ?auto_17458 ) ) ( not ( = ?auto_17441 ?auto_17443 ) ) ( not ( = ?auto_17441 ?auto_17458 ) ) ( not ( = ?auto_17443 ?auto_17474 ) ) ( not ( = ?auto_17443 ?auto_17479 ) ) ( not ( = ?auto_17458 ?auto_17474 ) ) ( not ( = ?auto_17458 ?auto_17479 ) ) ( not ( = ?auto_17440 ?auto_17444 ) ) ( not ( = ?auto_17440 ?auto_17471 ) ) ( not ( = ?auto_17441 ?auto_17444 ) ) ( not ( = ?auto_17441 ?auto_17471 ) ) ( not ( = ?auto_17442 ?auto_17444 ) ) ( not ( = ?auto_17442 ?auto_17471 ) ) ( not ( = ?auto_17444 ?auto_17458 ) ) ( not ( = ?auto_17444 ?auto_17474 ) ) ( not ( = ?auto_17444 ?auto_17479 ) ) ( not ( = ?auto_17478 ?auto_17459 ) ) ( not ( = ?auto_17478 ?auto_17467 ) ) ( not ( = ?auto_17472 ?auto_17464 ) ) ( not ( = ?auto_17472 ?auto_17473 ) ) ( not ( = ?auto_17471 ?auto_17458 ) ) ( not ( = ?auto_17471 ?auto_17474 ) ) ( not ( = ?auto_17471 ?auto_17479 ) ) ( not ( = ?auto_17440 ?auto_17445 ) ) ( not ( = ?auto_17440 ?auto_17460 ) ) ( not ( = ?auto_17441 ?auto_17445 ) ) ( not ( = ?auto_17441 ?auto_17460 ) ) ( not ( = ?auto_17442 ?auto_17445 ) ) ( not ( = ?auto_17442 ?auto_17460 ) ) ( not ( = ?auto_17443 ?auto_17445 ) ) ( not ( = ?auto_17443 ?auto_17460 ) ) ( not ( = ?auto_17445 ?auto_17471 ) ) ( not ( = ?auto_17445 ?auto_17458 ) ) ( not ( = ?auto_17445 ?auto_17474 ) ) ( not ( = ?auto_17445 ?auto_17479 ) ) ( not ( = ?auto_17468 ?auto_17478 ) ) ( not ( = ?auto_17468 ?auto_17459 ) ) ( not ( = ?auto_17468 ?auto_17467 ) ) ( not ( = ?auto_17470 ?auto_17472 ) ) ( not ( = ?auto_17470 ?auto_17464 ) ) ( not ( = ?auto_17470 ?auto_17473 ) ) ( not ( = ?auto_17460 ?auto_17471 ) ) ( not ( = ?auto_17460 ?auto_17458 ) ) ( not ( = ?auto_17460 ?auto_17474 ) ) ( not ( = ?auto_17460 ?auto_17479 ) ) ( not ( = ?auto_17440 ?auto_17446 ) ) ( not ( = ?auto_17440 ?auto_17469 ) ) ( not ( = ?auto_17441 ?auto_17446 ) ) ( not ( = ?auto_17441 ?auto_17469 ) ) ( not ( = ?auto_17442 ?auto_17446 ) ) ( not ( = ?auto_17442 ?auto_17469 ) ) ( not ( = ?auto_17443 ?auto_17446 ) ) ( not ( = ?auto_17443 ?auto_17469 ) ) ( not ( = ?auto_17444 ?auto_17446 ) ) ( not ( = ?auto_17444 ?auto_17469 ) ) ( not ( = ?auto_17446 ?auto_17460 ) ) ( not ( = ?auto_17446 ?auto_17471 ) ) ( not ( = ?auto_17446 ?auto_17458 ) ) ( not ( = ?auto_17446 ?auto_17474 ) ) ( not ( = ?auto_17446 ?auto_17479 ) ) ( not ( = ?auto_17466 ?auto_17468 ) ) ( not ( = ?auto_17466 ?auto_17478 ) ) ( not ( = ?auto_17466 ?auto_17459 ) ) ( not ( = ?auto_17466 ?auto_17467 ) ) ( not ( = ?auto_17461 ?auto_17470 ) ) ( not ( = ?auto_17461 ?auto_17472 ) ) ( not ( = ?auto_17461 ?auto_17464 ) ) ( not ( = ?auto_17461 ?auto_17473 ) ) ( not ( = ?auto_17469 ?auto_17460 ) ) ( not ( = ?auto_17469 ?auto_17471 ) ) ( not ( = ?auto_17469 ?auto_17458 ) ) ( not ( = ?auto_17469 ?auto_17474 ) ) ( not ( = ?auto_17469 ?auto_17479 ) ) ( not ( = ?auto_17440 ?auto_17447 ) ) ( not ( = ?auto_17440 ?auto_17476 ) ) ( not ( = ?auto_17441 ?auto_17447 ) ) ( not ( = ?auto_17441 ?auto_17476 ) ) ( not ( = ?auto_17442 ?auto_17447 ) ) ( not ( = ?auto_17442 ?auto_17476 ) ) ( not ( = ?auto_17443 ?auto_17447 ) ) ( not ( = ?auto_17443 ?auto_17476 ) ) ( not ( = ?auto_17444 ?auto_17447 ) ) ( not ( = ?auto_17444 ?auto_17476 ) ) ( not ( = ?auto_17445 ?auto_17447 ) ) ( not ( = ?auto_17445 ?auto_17476 ) ) ( not ( = ?auto_17447 ?auto_17469 ) ) ( not ( = ?auto_17447 ?auto_17460 ) ) ( not ( = ?auto_17447 ?auto_17471 ) ) ( not ( = ?auto_17447 ?auto_17458 ) ) ( not ( = ?auto_17447 ?auto_17474 ) ) ( not ( = ?auto_17447 ?auto_17479 ) ) ( not ( = ?auto_17465 ?auto_17466 ) ) ( not ( = ?auto_17465 ?auto_17468 ) ) ( not ( = ?auto_17465 ?auto_17478 ) ) ( not ( = ?auto_17465 ?auto_17459 ) ) ( not ( = ?auto_17465 ?auto_17467 ) ) ( not ( = ?auto_17477 ?auto_17461 ) ) ( not ( = ?auto_17477 ?auto_17470 ) ) ( not ( = ?auto_17477 ?auto_17472 ) ) ( not ( = ?auto_17477 ?auto_17464 ) ) ( not ( = ?auto_17477 ?auto_17473 ) ) ( not ( = ?auto_17476 ?auto_17469 ) ) ( not ( = ?auto_17476 ?auto_17460 ) ) ( not ( = ?auto_17476 ?auto_17471 ) ) ( not ( = ?auto_17476 ?auto_17458 ) ) ( not ( = ?auto_17476 ?auto_17474 ) ) ( not ( = ?auto_17476 ?auto_17479 ) ) ( not ( = ?auto_17440 ?auto_17448 ) ) ( not ( = ?auto_17440 ?auto_17463 ) ) ( not ( = ?auto_17441 ?auto_17448 ) ) ( not ( = ?auto_17441 ?auto_17463 ) ) ( not ( = ?auto_17442 ?auto_17448 ) ) ( not ( = ?auto_17442 ?auto_17463 ) ) ( not ( = ?auto_17443 ?auto_17448 ) ) ( not ( = ?auto_17443 ?auto_17463 ) ) ( not ( = ?auto_17444 ?auto_17448 ) ) ( not ( = ?auto_17444 ?auto_17463 ) ) ( not ( = ?auto_17445 ?auto_17448 ) ) ( not ( = ?auto_17445 ?auto_17463 ) ) ( not ( = ?auto_17446 ?auto_17448 ) ) ( not ( = ?auto_17446 ?auto_17463 ) ) ( not ( = ?auto_17448 ?auto_17476 ) ) ( not ( = ?auto_17448 ?auto_17469 ) ) ( not ( = ?auto_17448 ?auto_17460 ) ) ( not ( = ?auto_17448 ?auto_17471 ) ) ( not ( = ?auto_17448 ?auto_17458 ) ) ( not ( = ?auto_17448 ?auto_17474 ) ) ( not ( = ?auto_17448 ?auto_17479 ) ) ( not ( = ?auto_17463 ?auto_17476 ) ) ( not ( = ?auto_17463 ?auto_17469 ) ) ( not ( = ?auto_17463 ?auto_17460 ) ) ( not ( = ?auto_17463 ?auto_17471 ) ) ( not ( = ?auto_17463 ?auto_17458 ) ) ( not ( = ?auto_17463 ?auto_17474 ) ) ( not ( = ?auto_17463 ?auto_17479 ) ) ( not ( = ?auto_17440 ?auto_17449 ) ) ( not ( = ?auto_17440 ?auto_17475 ) ) ( not ( = ?auto_17441 ?auto_17449 ) ) ( not ( = ?auto_17441 ?auto_17475 ) ) ( not ( = ?auto_17442 ?auto_17449 ) ) ( not ( = ?auto_17442 ?auto_17475 ) ) ( not ( = ?auto_17443 ?auto_17449 ) ) ( not ( = ?auto_17443 ?auto_17475 ) ) ( not ( = ?auto_17444 ?auto_17449 ) ) ( not ( = ?auto_17444 ?auto_17475 ) ) ( not ( = ?auto_17445 ?auto_17449 ) ) ( not ( = ?auto_17445 ?auto_17475 ) ) ( not ( = ?auto_17446 ?auto_17449 ) ) ( not ( = ?auto_17446 ?auto_17475 ) ) ( not ( = ?auto_17447 ?auto_17449 ) ) ( not ( = ?auto_17447 ?auto_17475 ) ) ( not ( = ?auto_17449 ?auto_17463 ) ) ( not ( = ?auto_17449 ?auto_17476 ) ) ( not ( = ?auto_17449 ?auto_17469 ) ) ( not ( = ?auto_17449 ?auto_17460 ) ) ( not ( = ?auto_17449 ?auto_17471 ) ) ( not ( = ?auto_17449 ?auto_17458 ) ) ( not ( = ?auto_17449 ?auto_17474 ) ) ( not ( = ?auto_17449 ?auto_17479 ) ) ( not ( = ?auto_17457 ?auto_17465 ) ) ( not ( = ?auto_17457 ?auto_17466 ) ) ( not ( = ?auto_17457 ?auto_17468 ) ) ( not ( = ?auto_17457 ?auto_17478 ) ) ( not ( = ?auto_17457 ?auto_17459 ) ) ( not ( = ?auto_17457 ?auto_17467 ) ) ( not ( = ?auto_17462 ?auto_17477 ) ) ( not ( = ?auto_17462 ?auto_17461 ) ) ( not ( = ?auto_17462 ?auto_17470 ) ) ( not ( = ?auto_17462 ?auto_17472 ) ) ( not ( = ?auto_17462 ?auto_17464 ) ) ( not ( = ?auto_17462 ?auto_17473 ) ) ( not ( = ?auto_17475 ?auto_17463 ) ) ( not ( = ?auto_17475 ?auto_17476 ) ) ( not ( = ?auto_17475 ?auto_17469 ) ) ( not ( = ?auto_17475 ?auto_17460 ) ) ( not ( = ?auto_17475 ?auto_17471 ) ) ( not ( = ?auto_17475 ?auto_17458 ) ) ( not ( = ?auto_17475 ?auto_17474 ) ) ( not ( = ?auto_17475 ?auto_17479 ) ) ( not ( = ?auto_17440 ?auto_17450 ) ) ( not ( = ?auto_17440 ?auto_17453 ) ) ( not ( = ?auto_17441 ?auto_17450 ) ) ( not ( = ?auto_17441 ?auto_17453 ) ) ( not ( = ?auto_17442 ?auto_17450 ) ) ( not ( = ?auto_17442 ?auto_17453 ) ) ( not ( = ?auto_17443 ?auto_17450 ) ) ( not ( = ?auto_17443 ?auto_17453 ) ) ( not ( = ?auto_17444 ?auto_17450 ) ) ( not ( = ?auto_17444 ?auto_17453 ) ) ( not ( = ?auto_17445 ?auto_17450 ) ) ( not ( = ?auto_17445 ?auto_17453 ) ) ( not ( = ?auto_17446 ?auto_17450 ) ) ( not ( = ?auto_17446 ?auto_17453 ) ) ( not ( = ?auto_17447 ?auto_17450 ) ) ( not ( = ?auto_17447 ?auto_17453 ) ) ( not ( = ?auto_17448 ?auto_17450 ) ) ( not ( = ?auto_17448 ?auto_17453 ) ) ( not ( = ?auto_17450 ?auto_17475 ) ) ( not ( = ?auto_17450 ?auto_17463 ) ) ( not ( = ?auto_17450 ?auto_17476 ) ) ( not ( = ?auto_17450 ?auto_17469 ) ) ( not ( = ?auto_17450 ?auto_17460 ) ) ( not ( = ?auto_17450 ?auto_17471 ) ) ( not ( = ?auto_17450 ?auto_17458 ) ) ( not ( = ?auto_17450 ?auto_17474 ) ) ( not ( = ?auto_17450 ?auto_17479 ) ) ( not ( = ?auto_17451 ?auto_17457 ) ) ( not ( = ?auto_17451 ?auto_17465 ) ) ( not ( = ?auto_17451 ?auto_17466 ) ) ( not ( = ?auto_17451 ?auto_17468 ) ) ( not ( = ?auto_17451 ?auto_17478 ) ) ( not ( = ?auto_17451 ?auto_17459 ) ) ( not ( = ?auto_17451 ?auto_17467 ) ) ( not ( = ?auto_17455 ?auto_17462 ) ) ( not ( = ?auto_17455 ?auto_17477 ) ) ( not ( = ?auto_17455 ?auto_17461 ) ) ( not ( = ?auto_17455 ?auto_17470 ) ) ( not ( = ?auto_17455 ?auto_17472 ) ) ( not ( = ?auto_17455 ?auto_17464 ) ) ( not ( = ?auto_17455 ?auto_17473 ) ) ( not ( = ?auto_17453 ?auto_17475 ) ) ( not ( = ?auto_17453 ?auto_17463 ) ) ( not ( = ?auto_17453 ?auto_17476 ) ) ( not ( = ?auto_17453 ?auto_17469 ) ) ( not ( = ?auto_17453 ?auto_17460 ) ) ( not ( = ?auto_17453 ?auto_17471 ) ) ( not ( = ?auto_17453 ?auto_17458 ) ) ( not ( = ?auto_17453 ?auto_17474 ) ) ( not ( = ?auto_17453 ?auto_17479 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_17440 ?auto_17441 ?auto_17442 ?auto_17443 ?auto_17444 ?auto_17445 ?auto_17446 ?auto_17447 ?auto_17448 ?auto_17449 )
      ( MAKE-1CRATE ?auto_17449 ?auto_17450 )
      ( MAKE-10CRATE-VERIFY ?auto_17440 ?auto_17441 ?auto_17442 ?auto_17443 ?auto_17444 ?auto_17445 ?auto_17446 ?auto_17447 ?auto_17448 ?auto_17449 ?auto_17450 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_17502 - SURFACE
      ?auto_17503 - SURFACE
      ?auto_17504 - SURFACE
      ?auto_17505 - SURFACE
      ?auto_17506 - SURFACE
      ?auto_17507 - SURFACE
      ?auto_17508 - SURFACE
      ?auto_17509 - SURFACE
      ?auto_17510 - SURFACE
      ?auto_17511 - SURFACE
      ?auto_17512 - SURFACE
      ?auto_17513 - SURFACE
    )
    :vars
    (
      ?auto_17514 - HOIST
      ?auto_17518 - PLACE
      ?auto_17515 - PLACE
      ?auto_17516 - HOIST
      ?auto_17519 - SURFACE
      ?auto_17528 - PLACE
      ?auto_17536 - HOIST
      ?auto_17525 - SURFACE
      ?auto_17527 - PLACE
      ?auto_17530 - HOIST
      ?auto_17533 - SURFACE
      ?auto_17540 - PLACE
      ?auto_17539 - HOIST
      ?auto_17544 - SURFACE
      ?auto_17522 - SURFACE
      ?auto_17521 - PLACE
      ?auto_17541 - HOIST
      ?auto_17520 - SURFACE
      ?auto_17535 - PLACE
      ?auto_17531 - HOIST
      ?auto_17526 - SURFACE
      ?auto_17523 - PLACE
      ?auto_17543 - HOIST
      ?auto_17545 - SURFACE
      ?auto_17524 - PLACE
      ?auto_17538 - HOIST
      ?auto_17542 - SURFACE
      ?auto_17534 - SURFACE
      ?auto_17529 - PLACE
      ?auto_17532 - HOIST
      ?auto_17537 - SURFACE
      ?auto_17517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17514 ?auto_17518 ) ( IS-CRATE ?auto_17513 ) ( not ( = ?auto_17515 ?auto_17518 ) ) ( HOIST-AT ?auto_17516 ?auto_17515 ) ( AVAILABLE ?auto_17516 ) ( SURFACE-AT ?auto_17513 ?auto_17515 ) ( ON ?auto_17513 ?auto_17519 ) ( CLEAR ?auto_17513 ) ( not ( = ?auto_17512 ?auto_17513 ) ) ( not ( = ?auto_17512 ?auto_17519 ) ) ( not ( = ?auto_17513 ?auto_17519 ) ) ( not ( = ?auto_17514 ?auto_17516 ) ) ( IS-CRATE ?auto_17512 ) ( not ( = ?auto_17528 ?auto_17518 ) ) ( HOIST-AT ?auto_17536 ?auto_17528 ) ( AVAILABLE ?auto_17536 ) ( SURFACE-AT ?auto_17512 ?auto_17528 ) ( ON ?auto_17512 ?auto_17525 ) ( CLEAR ?auto_17512 ) ( not ( = ?auto_17511 ?auto_17512 ) ) ( not ( = ?auto_17511 ?auto_17525 ) ) ( not ( = ?auto_17512 ?auto_17525 ) ) ( not ( = ?auto_17514 ?auto_17536 ) ) ( IS-CRATE ?auto_17511 ) ( not ( = ?auto_17527 ?auto_17518 ) ) ( HOIST-AT ?auto_17530 ?auto_17527 ) ( AVAILABLE ?auto_17530 ) ( SURFACE-AT ?auto_17511 ?auto_17527 ) ( ON ?auto_17511 ?auto_17533 ) ( CLEAR ?auto_17511 ) ( not ( = ?auto_17510 ?auto_17511 ) ) ( not ( = ?auto_17510 ?auto_17533 ) ) ( not ( = ?auto_17511 ?auto_17533 ) ) ( not ( = ?auto_17514 ?auto_17530 ) ) ( IS-CRATE ?auto_17510 ) ( not ( = ?auto_17540 ?auto_17518 ) ) ( HOIST-AT ?auto_17539 ?auto_17540 ) ( SURFACE-AT ?auto_17510 ?auto_17540 ) ( ON ?auto_17510 ?auto_17544 ) ( CLEAR ?auto_17510 ) ( not ( = ?auto_17509 ?auto_17510 ) ) ( not ( = ?auto_17509 ?auto_17544 ) ) ( not ( = ?auto_17510 ?auto_17544 ) ) ( not ( = ?auto_17514 ?auto_17539 ) ) ( IS-CRATE ?auto_17509 ) ( AVAILABLE ?auto_17539 ) ( SURFACE-AT ?auto_17509 ?auto_17540 ) ( ON ?auto_17509 ?auto_17522 ) ( CLEAR ?auto_17509 ) ( not ( = ?auto_17508 ?auto_17509 ) ) ( not ( = ?auto_17508 ?auto_17522 ) ) ( not ( = ?auto_17509 ?auto_17522 ) ) ( IS-CRATE ?auto_17508 ) ( not ( = ?auto_17521 ?auto_17518 ) ) ( HOIST-AT ?auto_17541 ?auto_17521 ) ( AVAILABLE ?auto_17541 ) ( SURFACE-AT ?auto_17508 ?auto_17521 ) ( ON ?auto_17508 ?auto_17520 ) ( CLEAR ?auto_17508 ) ( not ( = ?auto_17507 ?auto_17508 ) ) ( not ( = ?auto_17507 ?auto_17520 ) ) ( not ( = ?auto_17508 ?auto_17520 ) ) ( not ( = ?auto_17514 ?auto_17541 ) ) ( IS-CRATE ?auto_17507 ) ( not ( = ?auto_17535 ?auto_17518 ) ) ( HOIST-AT ?auto_17531 ?auto_17535 ) ( AVAILABLE ?auto_17531 ) ( SURFACE-AT ?auto_17507 ?auto_17535 ) ( ON ?auto_17507 ?auto_17526 ) ( CLEAR ?auto_17507 ) ( not ( = ?auto_17506 ?auto_17507 ) ) ( not ( = ?auto_17506 ?auto_17526 ) ) ( not ( = ?auto_17507 ?auto_17526 ) ) ( not ( = ?auto_17514 ?auto_17531 ) ) ( IS-CRATE ?auto_17506 ) ( not ( = ?auto_17523 ?auto_17518 ) ) ( HOIST-AT ?auto_17543 ?auto_17523 ) ( AVAILABLE ?auto_17543 ) ( SURFACE-AT ?auto_17506 ?auto_17523 ) ( ON ?auto_17506 ?auto_17545 ) ( CLEAR ?auto_17506 ) ( not ( = ?auto_17505 ?auto_17506 ) ) ( not ( = ?auto_17505 ?auto_17545 ) ) ( not ( = ?auto_17506 ?auto_17545 ) ) ( not ( = ?auto_17514 ?auto_17543 ) ) ( IS-CRATE ?auto_17505 ) ( not ( = ?auto_17524 ?auto_17518 ) ) ( HOIST-AT ?auto_17538 ?auto_17524 ) ( SURFACE-AT ?auto_17505 ?auto_17524 ) ( ON ?auto_17505 ?auto_17542 ) ( CLEAR ?auto_17505 ) ( not ( = ?auto_17504 ?auto_17505 ) ) ( not ( = ?auto_17504 ?auto_17542 ) ) ( not ( = ?auto_17505 ?auto_17542 ) ) ( not ( = ?auto_17514 ?auto_17538 ) ) ( IS-CRATE ?auto_17504 ) ( AVAILABLE ?auto_17538 ) ( SURFACE-AT ?auto_17504 ?auto_17524 ) ( ON ?auto_17504 ?auto_17534 ) ( CLEAR ?auto_17504 ) ( not ( = ?auto_17503 ?auto_17504 ) ) ( not ( = ?auto_17503 ?auto_17534 ) ) ( not ( = ?auto_17504 ?auto_17534 ) ) ( SURFACE-AT ?auto_17502 ?auto_17518 ) ( CLEAR ?auto_17502 ) ( IS-CRATE ?auto_17503 ) ( AVAILABLE ?auto_17514 ) ( not ( = ?auto_17529 ?auto_17518 ) ) ( HOIST-AT ?auto_17532 ?auto_17529 ) ( AVAILABLE ?auto_17532 ) ( SURFACE-AT ?auto_17503 ?auto_17529 ) ( ON ?auto_17503 ?auto_17537 ) ( CLEAR ?auto_17503 ) ( TRUCK-AT ?auto_17517 ?auto_17518 ) ( not ( = ?auto_17502 ?auto_17503 ) ) ( not ( = ?auto_17502 ?auto_17537 ) ) ( not ( = ?auto_17503 ?auto_17537 ) ) ( not ( = ?auto_17514 ?auto_17532 ) ) ( not ( = ?auto_17502 ?auto_17504 ) ) ( not ( = ?auto_17502 ?auto_17534 ) ) ( not ( = ?auto_17504 ?auto_17537 ) ) ( not ( = ?auto_17524 ?auto_17529 ) ) ( not ( = ?auto_17538 ?auto_17532 ) ) ( not ( = ?auto_17534 ?auto_17537 ) ) ( not ( = ?auto_17502 ?auto_17505 ) ) ( not ( = ?auto_17502 ?auto_17542 ) ) ( not ( = ?auto_17503 ?auto_17505 ) ) ( not ( = ?auto_17503 ?auto_17542 ) ) ( not ( = ?auto_17505 ?auto_17534 ) ) ( not ( = ?auto_17505 ?auto_17537 ) ) ( not ( = ?auto_17542 ?auto_17534 ) ) ( not ( = ?auto_17542 ?auto_17537 ) ) ( not ( = ?auto_17502 ?auto_17506 ) ) ( not ( = ?auto_17502 ?auto_17545 ) ) ( not ( = ?auto_17503 ?auto_17506 ) ) ( not ( = ?auto_17503 ?auto_17545 ) ) ( not ( = ?auto_17504 ?auto_17506 ) ) ( not ( = ?auto_17504 ?auto_17545 ) ) ( not ( = ?auto_17506 ?auto_17542 ) ) ( not ( = ?auto_17506 ?auto_17534 ) ) ( not ( = ?auto_17506 ?auto_17537 ) ) ( not ( = ?auto_17523 ?auto_17524 ) ) ( not ( = ?auto_17523 ?auto_17529 ) ) ( not ( = ?auto_17543 ?auto_17538 ) ) ( not ( = ?auto_17543 ?auto_17532 ) ) ( not ( = ?auto_17545 ?auto_17542 ) ) ( not ( = ?auto_17545 ?auto_17534 ) ) ( not ( = ?auto_17545 ?auto_17537 ) ) ( not ( = ?auto_17502 ?auto_17507 ) ) ( not ( = ?auto_17502 ?auto_17526 ) ) ( not ( = ?auto_17503 ?auto_17507 ) ) ( not ( = ?auto_17503 ?auto_17526 ) ) ( not ( = ?auto_17504 ?auto_17507 ) ) ( not ( = ?auto_17504 ?auto_17526 ) ) ( not ( = ?auto_17505 ?auto_17507 ) ) ( not ( = ?auto_17505 ?auto_17526 ) ) ( not ( = ?auto_17507 ?auto_17545 ) ) ( not ( = ?auto_17507 ?auto_17542 ) ) ( not ( = ?auto_17507 ?auto_17534 ) ) ( not ( = ?auto_17507 ?auto_17537 ) ) ( not ( = ?auto_17535 ?auto_17523 ) ) ( not ( = ?auto_17535 ?auto_17524 ) ) ( not ( = ?auto_17535 ?auto_17529 ) ) ( not ( = ?auto_17531 ?auto_17543 ) ) ( not ( = ?auto_17531 ?auto_17538 ) ) ( not ( = ?auto_17531 ?auto_17532 ) ) ( not ( = ?auto_17526 ?auto_17545 ) ) ( not ( = ?auto_17526 ?auto_17542 ) ) ( not ( = ?auto_17526 ?auto_17534 ) ) ( not ( = ?auto_17526 ?auto_17537 ) ) ( not ( = ?auto_17502 ?auto_17508 ) ) ( not ( = ?auto_17502 ?auto_17520 ) ) ( not ( = ?auto_17503 ?auto_17508 ) ) ( not ( = ?auto_17503 ?auto_17520 ) ) ( not ( = ?auto_17504 ?auto_17508 ) ) ( not ( = ?auto_17504 ?auto_17520 ) ) ( not ( = ?auto_17505 ?auto_17508 ) ) ( not ( = ?auto_17505 ?auto_17520 ) ) ( not ( = ?auto_17506 ?auto_17508 ) ) ( not ( = ?auto_17506 ?auto_17520 ) ) ( not ( = ?auto_17508 ?auto_17526 ) ) ( not ( = ?auto_17508 ?auto_17545 ) ) ( not ( = ?auto_17508 ?auto_17542 ) ) ( not ( = ?auto_17508 ?auto_17534 ) ) ( not ( = ?auto_17508 ?auto_17537 ) ) ( not ( = ?auto_17521 ?auto_17535 ) ) ( not ( = ?auto_17521 ?auto_17523 ) ) ( not ( = ?auto_17521 ?auto_17524 ) ) ( not ( = ?auto_17521 ?auto_17529 ) ) ( not ( = ?auto_17541 ?auto_17531 ) ) ( not ( = ?auto_17541 ?auto_17543 ) ) ( not ( = ?auto_17541 ?auto_17538 ) ) ( not ( = ?auto_17541 ?auto_17532 ) ) ( not ( = ?auto_17520 ?auto_17526 ) ) ( not ( = ?auto_17520 ?auto_17545 ) ) ( not ( = ?auto_17520 ?auto_17542 ) ) ( not ( = ?auto_17520 ?auto_17534 ) ) ( not ( = ?auto_17520 ?auto_17537 ) ) ( not ( = ?auto_17502 ?auto_17509 ) ) ( not ( = ?auto_17502 ?auto_17522 ) ) ( not ( = ?auto_17503 ?auto_17509 ) ) ( not ( = ?auto_17503 ?auto_17522 ) ) ( not ( = ?auto_17504 ?auto_17509 ) ) ( not ( = ?auto_17504 ?auto_17522 ) ) ( not ( = ?auto_17505 ?auto_17509 ) ) ( not ( = ?auto_17505 ?auto_17522 ) ) ( not ( = ?auto_17506 ?auto_17509 ) ) ( not ( = ?auto_17506 ?auto_17522 ) ) ( not ( = ?auto_17507 ?auto_17509 ) ) ( not ( = ?auto_17507 ?auto_17522 ) ) ( not ( = ?auto_17509 ?auto_17520 ) ) ( not ( = ?auto_17509 ?auto_17526 ) ) ( not ( = ?auto_17509 ?auto_17545 ) ) ( not ( = ?auto_17509 ?auto_17542 ) ) ( not ( = ?auto_17509 ?auto_17534 ) ) ( not ( = ?auto_17509 ?auto_17537 ) ) ( not ( = ?auto_17540 ?auto_17521 ) ) ( not ( = ?auto_17540 ?auto_17535 ) ) ( not ( = ?auto_17540 ?auto_17523 ) ) ( not ( = ?auto_17540 ?auto_17524 ) ) ( not ( = ?auto_17540 ?auto_17529 ) ) ( not ( = ?auto_17539 ?auto_17541 ) ) ( not ( = ?auto_17539 ?auto_17531 ) ) ( not ( = ?auto_17539 ?auto_17543 ) ) ( not ( = ?auto_17539 ?auto_17538 ) ) ( not ( = ?auto_17539 ?auto_17532 ) ) ( not ( = ?auto_17522 ?auto_17520 ) ) ( not ( = ?auto_17522 ?auto_17526 ) ) ( not ( = ?auto_17522 ?auto_17545 ) ) ( not ( = ?auto_17522 ?auto_17542 ) ) ( not ( = ?auto_17522 ?auto_17534 ) ) ( not ( = ?auto_17522 ?auto_17537 ) ) ( not ( = ?auto_17502 ?auto_17510 ) ) ( not ( = ?auto_17502 ?auto_17544 ) ) ( not ( = ?auto_17503 ?auto_17510 ) ) ( not ( = ?auto_17503 ?auto_17544 ) ) ( not ( = ?auto_17504 ?auto_17510 ) ) ( not ( = ?auto_17504 ?auto_17544 ) ) ( not ( = ?auto_17505 ?auto_17510 ) ) ( not ( = ?auto_17505 ?auto_17544 ) ) ( not ( = ?auto_17506 ?auto_17510 ) ) ( not ( = ?auto_17506 ?auto_17544 ) ) ( not ( = ?auto_17507 ?auto_17510 ) ) ( not ( = ?auto_17507 ?auto_17544 ) ) ( not ( = ?auto_17508 ?auto_17510 ) ) ( not ( = ?auto_17508 ?auto_17544 ) ) ( not ( = ?auto_17510 ?auto_17522 ) ) ( not ( = ?auto_17510 ?auto_17520 ) ) ( not ( = ?auto_17510 ?auto_17526 ) ) ( not ( = ?auto_17510 ?auto_17545 ) ) ( not ( = ?auto_17510 ?auto_17542 ) ) ( not ( = ?auto_17510 ?auto_17534 ) ) ( not ( = ?auto_17510 ?auto_17537 ) ) ( not ( = ?auto_17544 ?auto_17522 ) ) ( not ( = ?auto_17544 ?auto_17520 ) ) ( not ( = ?auto_17544 ?auto_17526 ) ) ( not ( = ?auto_17544 ?auto_17545 ) ) ( not ( = ?auto_17544 ?auto_17542 ) ) ( not ( = ?auto_17544 ?auto_17534 ) ) ( not ( = ?auto_17544 ?auto_17537 ) ) ( not ( = ?auto_17502 ?auto_17511 ) ) ( not ( = ?auto_17502 ?auto_17533 ) ) ( not ( = ?auto_17503 ?auto_17511 ) ) ( not ( = ?auto_17503 ?auto_17533 ) ) ( not ( = ?auto_17504 ?auto_17511 ) ) ( not ( = ?auto_17504 ?auto_17533 ) ) ( not ( = ?auto_17505 ?auto_17511 ) ) ( not ( = ?auto_17505 ?auto_17533 ) ) ( not ( = ?auto_17506 ?auto_17511 ) ) ( not ( = ?auto_17506 ?auto_17533 ) ) ( not ( = ?auto_17507 ?auto_17511 ) ) ( not ( = ?auto_17507 ?auto_17533 ) ) ( not ( = ?auto_17508 ?auto_17511 ) ) ( not ( = ?auto_17508 ?auto_17533 ) ) ( not ( = ?auto_17509 ?auto_17511 ) ) ( not ( = ?auto_17509 ?auto_17533 ) ) ( not ( = ?auto_17511 ?auto_17544 ) ) ( not ( = ?auto_17511 ?auto_17522 ) ) ( not ( = ?auto_17511 ?auto_17520 ) ) ( not ( = ?auto_17511 ?auto_17526 ) ) ( not ( = ?auto_17511 ?auto_17545 ) ) ( not ( = ?auto_17511 ?auto_17542 ) ) ( not ( = ?auto_17511 ?auto_17534 ) ) ( not ( = ?auto_17511 ?auto_17537 ) ) ( not ( = ?auto_17527 ?auto_17540 ) ) ( not ( = ?auto_17527 ?auto_17521 ) ) ( not ( = ?auto_17527 ?auto_17535 ) ) ( not ( = ?auto_17527 ?auto_17523 ) ) ( not ( = ?auto_17527 ?auto_17524 ) ) ( not ( = ?auto_17527 ?auto_17529 ) ) ( not ( = ?auto_17530 ?auto_17539 ) ) ( not ( = ?auto_17530 ?auto_17541 ) ) ( not ( = ?auto_17530 ?auto_17531 ) ) ( not ( = ?auto_17530 ?auto_17543 ) ) ( not ( = ?auto_17530 ?auto_17538 ) ) ( not ( = ?auto_17530 ?auto_17532 ) ) ( not ( = ?auto_17533 ?auto_17544 ) ) ( not ( = ?auto_17533 ?auto_17522 ) ) ( not ( = ?auto_17533 ?auto_17520 ) ) ( not ( = ?auto_17533 ?auto_17526 ) ) ( not ( = ?auto_17533 ?auto_17545 ) ) ( not ( = ?auto_17533 ?auto_17542 ) ) ( not ( = ?auto_17533 ?auto_17534 ) ) ( not ( = ?auto_17533 ?auto_17537 ) ) ( not ( = ?auto_17502 ?auto_17512 ) ) ( not ( = ?auto_17502 ?auto_17525 ) ) ( not ( = ?auto_17503 ?auto_17512 ) ) ( not ( = ?auto_17503 ?auto_17525 ) ) ( not ( = ?auto_17504 ?auto_17512 ) ) ( not ( = ?auto_17504 ?auto_17525 ) ) ( not ( = ?auto_17505 ?auto_17512 ) ) ( not ( = ?auto_17505 ?auto_17525 ) ) ( not ( = ?auto_17506 ?auto_17512 ) ) ( not ( = ?auto_17506 ?auto_17525 ) ) ( not ( = ?auto_17507 ?auto_17512 ) ) ( not ( = ?auto_17507 ?auto_17525 ) ) ( not ( = ?auto_17508 ?auto_17512 ) ) ( not ( = ?auto_17508 ?auto_17525 ) ) ( not ( = ?auto_17509 ?auto_17512 ) ) ( not ( = ?auto_17509 ?auto_17525 ) ) ( not ( = ?auto_17510 ?auto_17512 ) ) ( not ( = ?auto_17510 ?auto_17525 ) ) ( not ( = ?auto_17512 ?auto_17533 ) ) ( not ( = ?auto_17512 ?auto_17544 ) ) ( not ( = ?auto_17512 ?auto_17522 ) ) ( not ( = ?auto_17512 ?auto_17520 ) ) ( not ( = ?auto_17512 ?auto_17526 ) ) ( not ( = ?auto_17512 ?auto_17545 ) ) ( not ( = ?auto_17512 ?auto_17542 ) ) ( not ( = ?auto_17512 ?auto_17534 ) ) ( not ( = ?auto_17512 ?auto_17537 ) ) ( not ( = ?auto_17528 ?auto_17527 ) ) ( not ( = ?auto_17528 ?auto_17540 ) ) ( not ( = ?auto_17528 ?auto_17521 ) ) ( not ( = ?auto_17528 ?auto_17535 ) ) ( not ( = ?auto_17528 ?auto_17523 ) ) ( not ( = ?auto_17528 ?auto_17524 ) ) ( not ( = ?auto_17528 ?auto_17529 ) ) ( not ( = ?auto_17536 ?auto_17530 ) ) ( not ( = ?auto_17536 ?auto_17539 ) ) ( not ( = ?auto_17536 ?auto_17541 ) ) ( not ( = ?auto_17536 ?auto_17531 ) ) ( not ( = ?auto_17536 ?auto_17543 ) ) ( not ( = ?auto_17536 ?auto_17538 ) ) ( not ( = ?auto_17536 ?auto_17532 ) ) ( not ( = ?auto_17525 ?auto_17533 ) ) ( not ( = ?auto_17525 ?auto_17544 ) ) ( not ( = ?auto_17525 ?auto_17522 ) ) ( not ( = ?auto_17525 ?auto_17520 ) ) ( not ( = ?auto_17525 ?auto_17526 ) ) ( not ( = ?auto_17525 ?auto_17545 ) ) ( not ( = ?auto_17525 ?auto_17542 ) ) ( not ( = ?auto_17525 ?auto_17534 ) ) ( not ( = ?auto_17525 ?auto_17537 ) ) ( not ( = ?auto_17502 ?auto_17513 ) ) ( not ( = ?auto_17502 ?auto_17519 ) ) ( not ( = ?auto_17503 ?auto_17513 ) ) ( not ( = ?auto_17503 ?auto_17519 ) ) ( not ( = ?auto_17504 ?auto_17513 ) ) ( not ( = ?auto_17504 ?auto_17519 ) ) ( not ( = ?auto_17505 ?auto_17513 ) ) ( not ( = ?auto_17505 ?auto_17519 ) ) ( not ( = ?auto_17506 ?auto_17513 ) ) ( not ( = ?auto_17506 ?auto_17519 ) ) ( not ( = ?auto_17507 ?auto_17513 ) ) ( not ( = ?auto_17507 ?auto_17519 ) ) ( not ( = ?auto_17508 ?auto_17513 ) ) ( not ( = ?auto_17508 ?auto_17519 ) ) ( not ( = ?auto_17509 ?auto_17513 ) ) ( not ( = ?auto_17509 ?auto_17519 ) ) ( not ( = ?auto_17510 ?auto_17513 ) ) ( not ( = ?auto_17510 ?auto_17519 ) ) ( not ( = ?auto_17511 ?auto_17513 ) ) ( not ( = ?auto_17511 ?auto_17519 ) ) ( not ( = ?auto_17513 ?auto_17525 ) ) ( not ( = ?auto_17513 ?auto_17533 ) ) ( not ( = ?auto_17513 ?auto_17544 ) ) ( not ( = ?auto_17513 ?auto_17522 ) ) ( not ( = ?auto_17513 ?auto_17520 ) ) ( not ( = ?auto_17513 ?auto_17526 ) ) ( not ( = ?auto_17513 ?auto_17545 ) ) ( not ( = ?auto_17513 ?auto_17542 ) ) ( not ( = ?auto_17513 ?auto_17534 ) ) ( not ( = ?auto_17513 ?auto_17537 ) ) ( not ( = ?auto_17515 ?auto_17528 ) ) ( not ( = ?auto_17515 ?auto_17527 ) ) ( not ( = ?auto_17515 ?auto_17540 ) ) ( not ( = ?auto_17515 ?auto_17521 ) ) ( not ( = ?auto_17515 ?auto_17535 ) ) ( not ( = ?auto_17515 ?auto_17523 ) ) ( not ( = ?auto_17515 ?auto_17524 ) ) ( not ( = ?auto_17515 ?auto_17529 ) ) ( not ( = ?auto_17516 ?auto_17536 ) ) ( not ( = ?auto_17516 ?auto_17530 ) ) ( not ( = ?auto_17516 ?auto_17539 ) ) ( not ( = ?auto_17516 ?auto_17541 ) ) ( not ( = ?auto_17516 ?auto_17531 ) ) ( not ( = ?auto_17516 ?auto_17543 ) ) ( not ( = ?auto_17516 ?auto_17538 ) ) ( not ( = ?auto_17516 ?auto_17532 ) ) ( not ( = ?auto_17519 ?auto_17525 ) ) ( not ( = ?auto_17519 ?auto_17533 ) ) ( not ( = ?auto_17519 ?auto_17544 ) ) ( not ( = ?auto_17519 ?auto_17522 ) ) ( not ( = ?auto_17519 ?auto_17520 ) ) ( not ( = ?auto_17519 ?auto_17526 ) ) ( not ( = ?auto_17519 ?auto_17545 ) ) ( not ( = ?auto_17519 ?auto_17542 ) ) ( not ( = ?auto_17519 ?auto_17534 ) ) ( not ( = ?auto_17519 ?auto_17537 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_17502 ?auto_17503 ?auto_17504 ?auto_17505 ?auto_17506 ?auto_17507 ?auto_17508 ?auto_17509 ?auto_17510 ?auto_17511 ?auto_17512 )
      ( MAKE-1CRATE ?auto_17512 ?auto_17513 )
      ( MAKE-11CRATE-VERIFY ?auto_17502 ?auto_17503 ?auto_17504 ?auto_17505 ?auto_17506 ?auto_17507 ?auto_17508 ?auto_17509 ?auto_17510 ?auto_17511 ?auto_17512 ?auto_17513 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_17569 - SURFACE
      ?auto_17570 - SURFACE
      ?auto_17571 - SURFACE
      ?auto_17572 - SURFACE
      ?auto_17573 - SURFACE
      ?auto_17574 - SURFACE
      ?auto_17575 - SURFACE
      ?auto_17576 - SURFACE
      ?auto_17577 - SURFACE
      ?auto_17578 - SURFACE
      ?auto_17579 - SURFACE
      ?auto_17580 - SURFACE
      ?auto_17581 - SURFACE
    )
    :vars
    (
      ?auto_17582 - HOIST
      ?auto_17584 - PLACE
      ?auto_17586 - PLACE
      ?auto_17587 - HOIST
      ?auto_17585 - SURFACE
      ?auto_17601 - PLACE
      ?auto_17595 - HOIST
      ?auto_17589 - SURFACE
      ?auto_17610 - PLACE
      ?auto_17603 - HOIST
      ?auto_17609 - SURFACE
      ?auto_17611 - PLACE
      ?auto_17598 - HOIST
      ?auto_17608 - SURFACE
      ?auto_17590 - PLACE
      ?auto_17600 - HOIST
      ?auto_17605 - SURFACE
      ?auto_17602 - SURFACE
      ?auto_17588 - PLACE
      ?auto_17596 - HOIST
      ?auto_17607 - SURFACE
      ?auto_17614 - PLACE
      ?auto_17597 - HOIST
      ?auto_17593 - SURFACE
      ?auto_17592 - SURFACE
      ?auto_17604 - PLACE
      ?auto_17606 - HOIST
      ?auto_17591 - SURFACE
      ?auto_17613 - SURFACE
      ?auto_17599 - PLACE
      ?auto_17612 - HOIST
      ?auto_17594 - SURFACE
      ?auto_17583 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17582 ?auto_17584 ) ( IS-CRATE ?auto_17581 ) ( not ( = ?auto_17586 ?auto_17584 ) ) ( HOIST-AT ?auto_17587 ?auto_17586 ) ( SURFACE-AT ?auto_17581 ?auto_17586 ) ( ON ?auto_17581 ?auto_17585 ) ( CLEAR ?auto_17581 ) ( not ( = ?auto_17580 ?auto_17581 ) ) ( not ( = ?auto_17580 ?auto_17585 ) ) ( not ( = ?auto_17581 ?auto_17585 ) ) ( not ( = ?auto_17582 ?auto_17587 ) ) ( IS-CRATE ?auto_17580 ) ( not ( = ?auto_17601 ?auto_17584 ) ) ( HOIST-AT ?auto_17595 ?auto_17601 ) ( AVAILABLE ?auto_17595 ) ( SURFACE-AT ?auto_17580 ?auto_17601 ) ( ON ?auto_17580 ?auto_17589 ) ( CLEAR ?auto_17580 ) ( not ( = ?auto_17579 ?auto_17580 ) ) ( not ( = ?auto_17579 ?auto_17589 ) ) ( not ( = ?auto_17580 ?auto_17589 ) ) ( not ( = ?auto_17582 ?auto_17595 ) ) ( IS-CRATE ?auto_17579 ) ( not ( = ?auto_17610 ?auto_17584 ) ) ( HOIST-AT ?auto_17603 ?auto_17610 ) ( AVAILABLE ?auto_17603 ) ( SURFACE-AT ?auto_17579 ?auto_17610 ) ( ON ?auto_17579 ?auto_17609 ) ( CLEAR ?auto_17579 ) ( not ( = ?auto_17578 ?auto_17579 ) ) ( not ( = ?auto_17578 ?auto_17609 ) ) ( not ( = ?auto_17579 ?auto_17609 ) ) ( not ( = ?auto_17582 ?auto_17603 ) ) ( IS-CRATE ?auto_17578 ) ( not ( = ?auto_17611 ?auto_17584 ) ) ( HOIST-AT ?auto_17598 ?auto_17611 ) ( AVAILABLE ?auto_17598 ) ( SURFACE-AT ?auto_17578 ?auto_17611 ) ( ON ?auto_17578 ?auto_17608 ) ( CLEAR ?auto_17578 ) ( not ( = ?auto_17577 ?auto_17578 ) ) ( not ( = ?auto_17577 ?auto_17608 ) ) ( not ( = ?auto_17578 ?auto_17608 ) ) ( not ( = ?auto_17582 ?auto_17598 ) ) ( IS-CRATE ?auto_17577 ) ( not ( = ?auto_17590 ?auto_17584 ) ) ( HOIST-AT ?auto_17600 ?auto_17590 ) ( SURFACE-AT ?auto_17577 ?auto_17590 ) ( ON ?auto_17577 ?auto_17605 ) ( CLEAR ?auto_17577 ) ( not ( = ?auto_17576 ?auto_17577 ) ) ( not ( = ?auto_17576 ?auto_17605 ) ) ( not ( = ?auto_17577 ?auto_17605 ) ) ( not ( = ?auto_17582 ?auto_17600 ) ) ( IS-CRATE ?auto_17576 ) ( AVAILABLE ?auto_17600 ) ( SURFACE-AT ?auto_17576 ?auto_17590 ) ( ON ?auto_17576 ?auto_17602 ) ( CLEAR ?auto_17576 ) ( not ( = ?auto_17575 ?auto_17576 ) ) ( not ( = ?auto_17575 ?auto_17602 ) ) ( not ( = ?auto_17576 ?auto_17602 ) ) ( IS-CRATE ?auto_17575 ) ( not ( = ?auto_17588 ?auto_17584 ) ) ( HOIST-AT ?auto_17596 ?auto_17588 ) ( AVAILABLE ?auto_17596 ) ( SURFACE-AT ?auto_17575 ?auto_17588 ) ( ON ?auto_17575 ?auto_17607 ) ( CLEAR ?auto_17575 ) ( not ( = ?auto_17574 ?auto_17575 ) ) ( not ( = ?auto_17574 ?auto_17607 ) ) ( not ( = ?auto_17575 ?auto_17607 ) ) ( not ( = ?auto_17582 ?auto_17596 ) ) ( IS-CRATE ?auto_17574 ) ( not ( = ?auto_17614 ?auto_17584 ) ) ( HOIST-AT ?auto_17597 ?auto_17614 ) ( AVAILABLE ?auto_17597 ) ( SURFACE-AT ?auto_17574 ?auto_17614 ) ( ON ?auto_17574 ?auto_17593 ) ( CLEAR ?auto_17574 ) ( not ( = ?auto_17573 ?auto_17574 ) ) ( not ( = ?auto_17573 ?auto_17593 ) ) ( not ( = ?auto_17574 ?auto_17593 ) ) ( not ( = ?auto_17582 ?auto_17597 ) ) ( IS-CRATE ?auto_17573 ) ( AVAILABLE ?auto_17587 ) ( SURFACE-AT ?auto_17573 ?auto_17586 ) ( ON ?auto_17573 ?auto_17592 ) ( CLEAR ?auto_17573 ) ( not ( = ?auto_17572 ?auto_17573 ) ) ( not ( = ?auto_17572 ?auto_17592 ) ) ( not ( = ?auto_17573 ?auto_17592 ) ) ( IS-CRATE ?auto_17572 ) ( not ( = ?auto_17604 ?auto_17584 ) ) ( HOIST-AT ?auto_17606 ?auto_17604 ) ( SURFACE-AT ?auto_17572 ?auto_17604 ) ( ON ?auto_17572 ?auto_17591 ) ( CLEAR ?auto_17572 ) ( not ( = ?auto_17571 ?auto_17572 ) ) ( not ( = ?auto_17571 ?auto_17591 ) ) ( not ( = ?auto_17572 ?auto_17591 ) ) ( not ( = ?auto_17582 ?auto_17606 ) ) ( IS-CRATE ?auto_17571 ) ( AVAILABLE ?auto_17606 ) ( SURFACE-AT ?auto_17571 ?auto_17604 ) ( ON ?auto_17571 ?auto_17613 ) ( CLEAR ?auto_17571 ) ( not ( = ?auto_17570 ?auto_17571 ) ) ( not ( = ?auto_17570 ?auto_17613 ) ) ( not ( = ?auto_17571 ?auto_17613 ) ) ( SURFACE-AT ?auto_17569 ?auto_17584 ) ( CLEAR ?auto_17569 ) ( IS-CRATE ?auto_17570 ) ( AVAILABLE ?auto_17582 ) ( not ( = ?auto_17599 ?auto_17584 ) ) ( HOIST-AT ?auto_17612 ?auto_17599 ) ( AVAILABLE ?auto_17612 ) ( SURFACE-AT ?auto_17570 ?auto_17599 ) ( ON ?auto_17570 ?auto_17594 ) ( CLEAR ?auto_17570 ) ( TRUCK-AT ?auto_17583 ?auto_17584 ) ( not ( = ?auto_17569 ?auto_17570 ) ) ( not ( = ?auto_17569 ?auto_17594 ) ) ( not ( = ?auto_17570 ?auto_17594 ) ) ( not ( = ?auto_17582 ?auto_17612 ) ) ( not ( = ?auto_17569 ?auto_17571 ) ) ( not ( = ?auto_17569 ?auto_17613 ) ) ( not ( = ?auto_17571 ?auto_17594 ) ) ( not ( = ?auto_17604 ?auto_17599 ) ) ( not ( = ?auto_17606 ?auto_17612 ) ) ( not ( = ?auto_17613 ?auto_17594 ) ) ( not ( = ?auto_17569 ?auto_17572 ) ) ( not ( = ?auto_17569 ?auto_17591 ) ) ( not ( = ?auto_17570 ?auto_17572 ) ) ( not ( = ?auto_17570 ?auto_17591 ) ) ( not ( = ?auto_17572 ?auto_17613 ) ) ( not ( = ?auto_17572 ?auto_17594 ) ) ( not ( = ?auto_17591 ?auto_17613 ) ) ( not ( = ?auto_17591 ?auto_17594 ) ) ( not ( = ?auto_17569 ?auto_17573 ) ) ( not ( = ?auto_17569 ?auto_17592 ) ) ( not ( = ?auto_17570 ?auto_17573 ) ) ( not ( = ?auto_17570 ?auto_17592 ) ) ( not ( = ?auto_17571 ?auto_17573 ) ) ( not ( = ?auto_17571 ?auto_17592 ) ) ( not ( = ?auto_17573 ?auto_17591 ) ) ( not ( = ?auto_17573 ?auto_17613 ) ) ( not ( = ?auto_17573 ?auto_17594 ) ) ( not ( = ?auto_17586 ?auto_17604 ) ) ( not ( = ?auto_17586 ?auto_17599 ) ) ( not ( = ?auto_17587 ?auto_17606 ) ) ( not ( = ?auto_17587 ?auto_17612 ) ) ( not ( = ?auto_17592 ?auto_17591 ) ) ( not ( = ?auto_17592 ?auto_17613 ) ) ( not ( = ?auto_17592 ?auto_17594 ) ) ( not ( = ?auto_17569 ?auto_17574 ) ) ( not ( = ?auto_17569 ?auto_17593 ) ) ( not ( = ?auto_17570 ?auto_17574 ) ) ( not ( = ?auto_17570 ?auto_17593 ) ) ( not ( = ?auto_17571 ?auto_17574 ) ) ( not ( = ?auto_17571 ?auto_17593 ) ) ( not ( = ?auto_17572 ?auto_17574 ) ) ( not ( = ?auto_17572 ?auto_17593 ) ) ( not ( = ?auto_17574 ?auto_17592 ) ) ( not ( = ?auto_17574 ?auto_17591 ) ) ( not ( = ?auto_17574 ?auto_17613 ) ) ( not ( = ?auto_17574 ?auto_17594 ) ) ( not ( = ?auto_17614 ?auto_17586 ) ) ( not ( = ?auto_17614 ?auto_17604 ) ) ( not ( = ?auto_17614 ?auto_17599 ) ) ( not ( = ?auto_17597 ?auto_17587 ) ) ( not ( = ?auto_17597 ?auto_17606 ) ) ( not ( = ?auto_17597 ?auto_17612 ) ) ( not ( = ?auto_17593 ?auto_17592 ) ) ( not ( = ?auto_17593 ?auto_17591 ) ) ( not ( = ?auto_17593 ?auto_17613 ) ) ( not ( = ?auto_17593 ?auto_17594 ) ) ( not ( = ?auto_17569 ?auto_17575 ) ) ( not ( = ?auto_17569 ?auto_17607 ) ) ( not ( = ?auto_17570 ?auto_17575 ) ) ( not ( = ?auto_17570 ?auto_17607 ) ) ( not ( = ?auto_17571 ?auto_17575 ) ) ( not ( = ?auto_17571 ?auto_17607 ) ) ( not ( = ?auto_17572 ?auto_17575 ) ) ( not ( = ?auto_17572 ?auto_17607 ) ) ( not ( = ?auto_17573 ?auto_17575 ) ) ( not ( = ?auto_17573 ?auto_17607 ) ) ( not ( = ?auto_17575 ?auto_17593 ) ) ( not ( = ?auto_17575 ?auto_17592 ) ) ( not ( = ?auto_17575 ?auto_17591 ) ) ( not ( = ?auto_17575 ?auto_17613 ) ) ( not ( = ?auto_17575 ?auto_17594 ) ) ( not ( = ?auto_17588 ?auto_17614 ) ) ( not ( = ?auto_17588 ?auto_17586 ) ) ( not ( = ?auto_17588 ?auto_17604 ) ) ( not ( = ?auto_17588 ?auto_17599 ) ) ( not ( = ?auto_17596 ?auto_17597 ) ) ( not ( = ?auto_17596 ?auto_17587 ) ) ( not ( = ?auto_17596 ?auto_17606 ) ) ( not ( = ?auto_17596 ?auto_17612 ) ) ( not ( = ?auto_17607 ?auto_17593 ) ) ( not ( = ?auto_17607 ?auto_17592 ) ) ( not ( = ?auto_17607 ?auto_17591 ) ) ( not ( = ?auto_17607 ?auto_17613 ) ) ( not ( = ?auto_17607 ?auto_17594 ) ) ( not ( = ?auto_17569 ?auto_17576 ) ) ( not ( = ?auto_17569 ?auto_17602 ) ) ( not ( = ?auto_17570 ?auto_17576 ) ) ( not ( = ?auto_17570 ?auto_17602 ) ) ( not ( = ?auto_17571 ?auto_17576 ) ) ( not ( = ?auto_17571 ?auto_17602 ) ) ( not ( = ?auto_17572 ?auto_17576 ) ) ( not ( = ?auto_17572 ?auto_17602 ) ) ( not ( = ?auto_17573 ?auto_17576 ) ) ( not ( = ?auto_17573 ?auto_17602 ) ) ( not ( = ?auto_17574 ?auto_17576 ) ) ( not ( = ?auto_17574 ?auto_17602 ) ) ( not ( = ?auto_17576 ?auto_17607 ) ) ( not ( = ?auto_17576 ?auto_17593 ) ) ( not ( = ?auto_17576 ?auto_17592 ) ) ( not ( = ?auto_17576 ?auto_17591 ) ) ( not ( = ?auto_17576 ?auto_17613 ) ) ( not ( = ?auto_17576 ?auto_17594 ) ) ( not ( = ?auto_17590 ?auto_17588 ) ) ( not ( = ?auto_17590 ?auto_17614 ) ) ( not ( = ?auto_17590 ?auto_17586 ) ) ( not ( = ?auto_17590 ?auto_17604 ) ) ( not ( = ?auto_17590 ?auto_17599 ) ) ( not ( = ?auto_17600 ?auto_17596 ) ) ( not ( = ?auto_17600 ?auto_17597 ) ) ( not ( = ?auto_17600 ?auto_17587 ) ) ( not ( = ?auto_17600 ?auto_17606 ) ) ( not ( = ?auto_17600 ?auto_17612 ) ) ( not ( = ?auto_17602 ?auto_17607 ) ) ( not ( = ?auto_17602 ?auto_17593 ) ) ( not ( = ?auto_17602 ?auto_17592 ) ) ( not ( = ?auto_17602 ?auto_17591 ) ) ( not ( = ?auto_17602 ?auto_17613 ) ) ( not ( = ?auto_17602 ?auto_17594 ) ) ( not ( = ?auto_17569 ?auto_17577 ) ) ( not ( = ?auto_17569 ?auto_17605 ) ) ( not ( = ?auto_17570 ?auto_17577 ) ) ( not ( = ?auto_17570 ?auto_17605 ) ) ( not ( = ?auto_17571 ?auto_17577 ) ) ( not ( = ?auto_17571 ?auto_17605 ) ) ( not ( = ?auto_17572 ?auto_17577 ) ) ( not ( = ?auto_17572 ?auto_17605 ) ) ( not ( = ?auto_17573 ?auto_17577 ) ) ( not ( = ?auto_17573 ?auto_17605 ) ) ( not ( = ?auto_17574 ?auto_17577 ) ) ( not ( = ?auto_17574 ?auto_17605 ) ) ( not ( = ?auto_17575 ?auto_17577 ) ) ( not ( = ?auto_17575 ?auto_17605 ) ) ( not ( = ?auto_17577 ?auto_17602 ) ) ( not ( = ?auto_17577 ?auto_17607 ) ) ( not ( = ?auto_17577 ?auto_17593 ) ) ( not ( = ?auto_17577 ?auto_17592 ) ) ( not ( = ?auto_17577 ?auto_17591 ) ) ( not ( = ?auto_17577 ?auto_17613 ) ) ( not ( = ?auto_17577 ?auto_17594 ) ) ( not ( = ?auto_17605 ?auto_17602 ) ) ( not ( = ?auto_17605 ?auto_17607 ) ) ( not ( = ?auto_17605 ?auto_17593 ) ) ( not ( = ?auto_17605 ?auto_17592 ) ) ( not ( = ?auto_17605 ?auto_17591 ) ) ( not ( = ?auto_17605 ?auto_17613 ) ) ( not ( = ?auto_17605 ?auto_17594 ) ) ( not ( = ?auto_17569 ?auto_17578 ) ) ( not ( = ?auto_17569 ?auto_17608 ) ) ( not ( = ?auto_17570 ?auto_17578 ) ) ( not ( = ?auto_17570 ?auto_17608 ) ) ( not ( = ?auto_17571 ?auto_17578 ) ) ( not ( = ?auto_17571 ?auto_17608 ) ) ( not ( = ?auto_17572 ?auto_17578 ) ) ( not ( = ?auto_17572 ?auto_17608 ) ) ( not ( = ?auto_17573 ?auto_17578 ) ) ( not ( = ?auto_17573 ?auto_17608 ) ) ( not ( = ?auto_17574 ?auto_17578 ) ) ( not ( = ?auto_17574 ?auto_17608 ) ) ( not ( = ?auto_17575 ?auto_17578 ) ) ( not ( = ?auto_17575 ?auto_17608 ) ) ( not ( = ?auto_17576 ?auto_17578 ) ) ( not ( = ?auto_17576 ?auto_17608 ) ) ( not ( = ?auto_17578 ?auto_17605 ) ) ( not ( = ?auto_17578 ?auto_17602 ) ) ( not ( = ?auto_17578 ?auto_17607 ) ) ( not ( = ?auto_17578 ?auto_17593 ) ) ( not ( = ?auto_17578 ?auto_17592 ) ) ( not ( = ?auto_17578 ?auto_17591 ) ) ( not ( = ?auto_17578 ?auto_17613 ) ) ( not ( = ?auto_17578 ?auto_17594 ) ) ( not ( = ?auto_17611 ?auto_17590 ) ) ( not ( = ?auto_17611 ?auto_17588 ) ) ( not ( = ?auto_17611 ?auto_17614 ) ) ( not ( = ?auto_17611 ?auto_17586 ) ) ( not ( = ?auto_17611 ?auto_17604 ) ) ( not ( = ?auto_17611 ?auto_17599 ) ) ( not ( = ?auto_17598 ?auto_17600 ) ) ( not ( = ?auto_17598 ?auto_17596 ) ) ( not ( = ?auto_17598 ?auto_17597 ) ) ( not ( = ?auto_17598 ?auto_17587 ) ) ( not ( = ?auto_17598 ?auto_17606 ) ) ( not ( = ?auto_17598 ?auto_17612 ) ) ( not ( = ?auto_17608 ?auto_17605 ) ) ( not ( = ?auto_17608 ?auto_17602 ) ) ( not ( = ?auto_17608 ?auto_17607 ) ) ( not ( = ?auto_17608 ?auto_17593 ) ) ( not ( = ?auto_17608 ?auto_17592 ) ) ( not ( = ?auto_17608 ?auto_17591 ) ) ( not ( = ?auto_17608 ?auto_17613 ) ) ( not ( = ?auto_17608 ?auto_17594 ) ) ( not ( = ?auto_17569 ?auto_17579 ) ) ( not ( = ?auto_17569 ?auto_17609 ) ) ( not ( = ?auto_17570 ?auto_17579 ) ) ( not ( = ?auto_17570 ?auto_17609 ) ) ( not ( = ?auto_17571 ?auto_17579 ) ) ( not ( = ?auto_17571 ?auto_17609 ) ) ( not ( = ?auto_17572 ?auto_17579 ) ) ( not ( = ?auto_17572 ?auto_17609 ) ) ( not ( = ?auto_17573 ?auto_17579 ) ) ( not ( = ?auto_17573 ?auto_17609 ) ) ( not ( = ?auto_17574 ?auto_17579 ) ) ( not ( = ?auto_17574 ?auto_17609 ) ) ( not ( = ?auto_17575 ?auto_17579 ) ) ( not ( = ?auto_17575 ?auto_17609 ) ) ( not ( = ?auto_17576 ?auto_17579 ) ) ( not ( = ?auto_17576 ?auto_17609 ) ) ( not ( = ?auto_17577 ?auto_17579 ) ) ( not ( = ?auto_17577 ?auto_17609 ) ) ( not ( = ?auto_17579 ?auto_17608 ) ) ( not ( = ?auto_17579 ?auto_17605 ) ) ( not ( = ?auto_17579 ?auto_17602 ) ) ( not ( = ?auto_17579 ?auto_17607 ) ) ( not ( = ?auto_17579 ?auto_17593 ) ) ( not ( = ?auto_17579 ?auto_17592 ) ) ( not ( = ?auto_17579 ?auto_17591 ) ) ( not ( = ?auto_17579 ?auto_17613 ) ) ( not ( = ?auto_17579 ?auto_17594 ) ) ( not ( = ?auto_17610 ?auto_17611 ) ) ( not ( = ?auto_17610 ?auto_17590 ) ) ( not ( = ?auto_17610 ?auto_17588 ) ) ( not ( = ?auto_17610 ?auto_17614 ) ) ( not ( = ?auto_17610 ?auto_17586 ) ) ( not ( = ?auto_17610 ?auto_17604 ) ) ( not ( = ?auto_17610 ?auto_17599 ) ) ( not ( = ?auto_17603 ?auto_17598 ) ) ( not ( = ?auto_17603 ?auto_17600 ) ) ( not ( = ?auto_17603 ?auto_17596 ) ) ( not ( = ?auto_17603 ?auto_17597 ) ) ( not ( = ?auto_17603 ?auto_17587 ) ) ( not ( = ?auto_17603 ?auto_17606 ) ) ( not ( = ?auto_17603 ?auto_17612 ) ) ( not ( = ?auto_17609 ?auto_17608 ) ) ( not ( = ?auto_17609 ?auto_17605 ) ) ( not ( = ?auto_17609 ?auto_17602 ) ) ( not ( = ?auto_17609 ?auto_17607 ) ) ( not ( = ?auto_17609 ?auto_17593 ) ) ( not ( = ?auto_17609 ?auto_17592 ) ) ( not ( = ?auto_17609 ?auto_17591 ) ) ( not ( = ?auto_17609 ?auto_17613 ) ) ( not ( = ?auto_17609 ?auto_17594 ) ) ( not ( = ?auto_17569 ?auto_17580 ) ) ( not ( = ?auto_17569 ?auto_17589 ) ) ( not ( = ?auto_17570 ?auto_17580 ) ) ( not ( = ?auto_17570 ?auto_17589 ) ) ( not ( = ?auto_17571 ?auto_17580 ) ) ( not ( = ?auto_17571 ?auto_17589 ) ) ( not ( = ?auto_17572 ?auto_17580 ) ) ( not ( = ?auto_17572 ?auto_17589 ) ) ( not ( = ?auto_17573 ?auto_17580 ) ) ( not ( = ?auto_17573 ?auto_17589 ) ) ( not ( = ?auto_17574 ?auto_17580 ) ) ( not ( = ?auto_17574 ?auto_17589 ) ) ( not ( = ?auto_17575 ?auto_17580 ) ) ( not ( = ?auto_17575 ?auto_17589 ) ) ( not ( = ?auto_17576 ?auto_17580 ) ) ( not ( = ?auto_17576 ?auto_17589 ) ) ( not ( = ?auto_17577 ?auto_17580 ) ) ( not ( = ?auto_17577 ?auto_17589 ) ) ( not ( = ?auto_17578 ?auto_17580 ) ) ( not ( = ?auto_17578 ?auto_17589 ) ) ( not ( = ?auto_17580 ?auto_17609 ) ) ( not ( = ?auto_17580 ?auto_17608 ) ) ( not ( = ?auto_17580 ?auto_17605 ) ) ( not ( = ?auto_17580 ?auto_17602 ) ) ( not ( = ?auto_17580 ?auto_17607 ) ) ( not ( = ?auto_17580 ?auto_17593 ) ) ( not ( = ?auto_17580 ?auto_17592 ) ) ( not ( = ?auto_17580 ?auto_17591 ) ) ( not ( = ?auto_17580 ?auto_17613 ) ) ( not ( = ?auto_17580 ?auto_17594 ) ) ( not ( = ?auto_17601 ?auto_17610 ) ) ( not ( = ?auto_17601 ?auto_17611 ) ) ( not ( = ?auto_17601 ?auto_17590 ) ) ( not ( = ?auto_17601 ?auto_17588 ) ) ( not ( = ?auto_17601 ?auto_17614 ) ) ( not ( = ?auto_17601 ?auto_17586 ) ) ( not ( = ?auto_17601 ?auto_17604 ) ) ( not ( = ?auto_17601 ?auto_17599 ) ) ( not ( = ?auto_17595 ?auto_17603 ) ) ( not ( = ?auto_17595 ?auto_17598 ) ) ( not ( = ?auto_17595 ?auto_17600 ) ) ( not ( = ?auto_17595 ?auto_17596 ) ) ( not ( = ?auto_17595 ?auto_17597 ) ) ( not ( = ?auto_17595 ?auto_17587 ) ) ( not ( = ?auto_17595 ?auto_17606 ) ) ( not ( = ?auto_17595 ?auto_17612 ) ) ( not ( = ?auto_17589 ?auto_17609 ) ) ( not ( = ?auto_17589 ?auto_17608 ) ) ( not ( = ?auto_17589 ?auto_17605 ) ) ( not ( = ?auto_17589 ?auto_17602 ) ) ( not ( = ?auto_17589 ?auto_17607 ) ) ( not ( = ?auto_17589 ?auto_17593 ) ) ( not ( = ?auto_17589 ?auto_17592 ) ) ( not ( = ?auto_17589 ?auto_17591 ) ) ( not ( = ?auto_17589 ?auto_17613 ) ) ( not ( = ?auto_17589 ?auto_17594 ) ) ( not ( = ?auto_17569 ?auto_17581 ) ) ( not ( = ?auto_17569 ?auto_17585 ) ) ( not ( = ?auto_17570 ?auto_17581 ) ) ( not ( = ?auto_17570 ?auto_17585 ) ) ( not ( = ?auto_17571 ?auto_17581 ) ) ( not ( = ?auto_17571 ?auto_17585 ) ) ( not ( = ?auto_17572 ?auto_17581 ) ) ( not ( = ?auto_17572 ?auto_17585 ) ) ( not ( = ?auto_17573 ?auto_17581 ) ) ( not ( = ?auto_17573 ?auto_17585 ) ) ( not ( = ?auto_17574 ?auto_17581 ) ) ( not ( = ?auto_17574 ?auto_17585 ) ) ( not ( = ?auto_17575 ?auto_17581 ) ) ( not ( = ?auto_17575 ?auto_17585 ) ) ( not ( = ?auto_17576 ?auto_17581 ) ) ( not ( = ?auto_17576 ?auto_17585 ) ) ( not ( = ?auto_17577 ?auto_17581 ) ) ( not ( = ?auto_17577 ?auto_17585 ) ) ( not ( = ?auto_17578 ?auto_17581 ) ) ( not ( = ?auto_17578 ?auto_17585 ) ) ( not ( = ?auto_17579 ?auto_17581 ) ) ( not ( = ?auto_17579 ?auto_17585 ) ) ( not ( = ?auto_17581 ?auto_17589 ) ) ( not ( = ?auto_17581 ?auto_17609 ) ) ( not ( = ?auto_17581 ?auto_17608 ) ) ( not ( = ?auto_17581 ?auto_17605 ) ) ( not ( = ?auto_17581 ?auto_17602 ) ) ( not ( = ?auto_17581 ?auto_17607 ) ) ( not ( = ?auto_17581 ?auto_17593 ) ) ( not ( = ?auto_17581 ?auto_17592 ) ) ( not ( = ?auto_17581 ?auto_17591 ) ) ( not ( = ?auto_17581 ?auto_17613 ) ) ( not ( = ?auto_17581 ?auto_17594 ) ) ( not ( = ?auto_17585 ?auto_17589 ) ) ( not ( = ?auto_17585 ?auto_17609 ) ) ( not ( = ?auto_17585 ?auto_17608 ) ) ( not ( = ?auto_17585 ?auto_17605 ) ) ( not ( = ?auto_17585 ?auto_17602 ) ) ( not ( = ?auto_17585 ?auto_17607 ) ) ( not ( = ?auto_17585 ?auto_17593 ) ) ( not ( = ?auto_17585 ?auto_17592 ) ) ( not ( = ?auto_17585 ?auto_17591 ) ) ( not ( = ?auto_17585 ?auto_17613 ) ) ( not ( = ?auto_17585 ?auto_17594 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_17569 ?auto_17570 ?auto_17571 ?auto_17572 ?auto_17573 ?auto_17574 ?auto_17575 ?auto_17576 ?auto_17577 ?auto_17578 ?auto_17579 ?auto_17580 )
      ( MAKE-1CRATE ?auto_17580 ?auto_17581 )
      ( MAKE-12CRATE-VERIFY ?auto_17569 ?auto_17570 ?auto_17571 ?auto_17572 ?auto_17573 ?auto_17574 ?auto_17575 ?auto_17576 ?auto_17577 ?auto_17578 ?auto_17579 ?auto_17580 ?auto_17581 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_17639 - SURFACE
      ?auto_17640 - SURFACE
      ?auto_17641 - SURFACE
      ?auto_17642 - SURFACE
      ?auto_17643 - SURFACE
      ?auto_17644 - SURFACE
      ?auto_17645 - SURFACE
      ?auto_17646 - SURFACE
      ?auto_17647 - SURFACE
      ?auto_17648 - SURFACE
      ?auto_17649 - SURFACE
      ?auto_17650 - SURFACE
      ?auto_17651 - SURFACE
      ?auto_17652 - SURFACE
    )
    :vars
    (
      ?auto_17655 - HOIST
      ?auto_17656 - PLACE
      ?auto_17654 - PLACE
      ?auto_17653 - HOIST
      ?auto_17658 - SURFACE
      ?auto_17664 - SURFACE
      ?auto_17663 - PLACE
      ?auto_17669 - HOIST
      ?auto_17661 - SURFACE
      ?auto_17672 - PLACE
      ?auto_17666 - HOIST
      ?auto_17682 - SURFACE
      ?auto_17662 - PLACE
      ?auto_17659 - HOIST
      ?auto_17667 - SURFACE
      ?auto_17679 - PLACE
      ?auto_17685 - HOIST
      ?auto_17671 - SURFACE
      ?auto_17673 - SURFACE
      ?auto_17677 - PLACE
      ?auto_17668 - HOIST
      ?auto_17674 - SURFACE
      ?auto_17684 - PLACE
      ?auto_17683 - HOIST
      ?auto_17681 - SURFACE
      ?auto_17675 - SURFACE
      ?auto_17676 - PLACE
      ?auto_17680 - HOIST
      ?auto_17678 - SURFACE
      ?auto_17670 - SURFACE
      ?auto_17665 - PLACE
      ?auto_17686 - HOIST
      ?auto_17660 - SURFACE
      ?auto_17657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17655 ?auto_17656 ) ( IS-CRATE ?auto_17652 ) ( not ( = ?auto_17654 ?auto_17656 ) ) ( HOIST-AT ?auto_17653 ?auto_17654 ) ( SURFACE-AT ?auto_17652 ?auto_17654 ) ( ON ?auto_17652 ?auto_17658 ) ( CLEAR ?auto_17652 ) ( not ( = ?auto_17651 ?auto_17652 ) ) ( not ( = ?auto_17651 ?auto_17658 ) ) ( not ( = ?auto_17652 ?auto_17658 ) ) ( not ( = ?auto_17655 ?auto_17653 ) ) ( IS-CRATE ?auto_17651 ) ( SURFACE-AT ?auto_17651 ?auto_17654 ) ( ON ?auto_17651 ?auto_17664 ) ( CLEAR ?auto_17651 ) ( not ( = ?auto_17650 ?auto_17651 ) ) ( not ( = ?auto_17650 ?auto_17664 ) ) ( not ( = ?auto_17651 ?auto_17664 ) ) ( IS-CRATE ?auto_17650 ) ( not ( = ?auto_17663 ?auto_17656 ) ) ( HOIST-AT ?auto_17669 ?auto_17663 ) ( AVAILABLE ?auto_17669 ) ( SURFACE-AT ?auto_17650 ?auto_17663 ) ( ON ?auto_17650 ?auto_17661 ) ( CLEAR ?auto_17650 ) ( not ( = ?auto_17649 ?auto_17650 ) ) ( not ( = ?auto_17649 ?auto_17661 ) ) ( not ( = ?auto_17650 ?auto_17661 ) ) ( not ( = ?auto_17655 ?auto_17669 ) ) ( IS-CRATE ?auto_17649 ) ( not ( = ?auto_17672 ?auto_17656 ) ) ( HOIST-AT ?auto_17666 ?auto_17672 ) ( AVAILABLE ?auto_17666 ) ( SURFACE-AT ?auto_17649 ?auto_17672 ) ( ON ?auto_17649 ?auto_17682 ) ( CLEAR ?auto_17649 ) ( not ( = ?auto_17648 ?auto_17649 ) ) ( not ( = ?auto_17648 ?auto_17682 ) ) ( not ( = ?auto_17649 ?auto_17682 ) ) ( not ( = ?auto_17655 ?auto_17666 ) ) ( IS-CRATE ?auto_17648 ) ( not ( = ?auto_17662 ?auto_17656 ) ) ( HOIST-AT ?auto_17659 ?auto_17662 ) ( AVAILABLE ?auto_17659 ) ( SURFACE-AT ?auto_17648 ?auto_17662 ) ( ON ?auto_17648 ?auto_17667 ) ( CLEAR ?auto_17648 ) ( not ( = ?auto_17647 ?auto_17648 ) ) ( not ( = ?auto_17647 ?auto_17667 ) ) ( not ( = ?auto_17648 ?auto_17667 ) ) ( not ( = ?auto_17655 ?auto_17659 ) ) ( IS-CRATE ?auto_17647 ) ( not ( = ?auto_17679 ?auto_17656 ) ) ( HOIST-AT ?auto_17685 ?auto_17679 ) ( SURFACE-AT ?auto_17647 ?auto_17679 ) ( ON ?auto_17647 ?auto_17671 ) ( CLEAR ?auto_17647 ) ( not ( = ?auto_17646 ?auto_17647 ) ) ( not ( = ?auto_17646 ?auto_17671 ) ) ( not ( = ?auto_17647 ?auto_17671 ) ) ( not ( = ?auto_17655 ?auto_17685 ) ) ( IS-CRATE ?auto_17646 ) ( AVAILABLE ?auto_17685 ) ( SURFACE-AT ?auto_17646 ?auto_17679 ) ( ON ?auto_17646 ?auto_17673 ) ( CLEAR ?auto_17646 ) ( not ( = ?auto_17645 ?auto_17646 ) ) ( not ( = ?auto_17645 ?auto_17673 ) ) ( not ( = ?auto_17646 ?auto_17673 ) ) ( IS-CRATE ?auto_17645 ) ( not ( = ?auto_17677 ?auto_17656 ) ) ( HOIST-AT ?auto_17668 ?auto_17677 ) ( AVAILABLE ?auto_17668 ) ( SURFACE-AT ?auto_17645 ?auto_17677 ) ( ON ?auto_17645 ?auto_17674 ) ( CLEAR ?auto_17645 ) ( not ( = ?auto_17644 ?auto_17645 ) ) ( not ( = ?auto_17644 ?auto_17674 ) ) ( not ( = ?auto_17645 ?auto_17674 ) ) ( not ( = ?auto_17655 ?auto_17668 ) ) ( IS-CRATE ?auto_17644 ) ( not ( = ?auto_17684 ?auto_17656 ) ) ( HOIST-AT ?auto_17683 ?auto_17684 ) ( AVAILABLE ?auto_17683 ) ( SURFACE-AT ?auto_17644 ?auto_17684 ) ( ON ?auto_17644 ?auto_17681 ) ( CLEAR ?auto_17644 ) ( not ( = ?auto_17643 ?auto_17644 ) ) ( not ( = ?auto_17643 ?auto_17681 ) ) ( not ( = ?auto_17644 ?auto_17681 ) ) ( not ( = ?auto_17655 ?auto_17683 ) ) ( IS-CRATE ?auto_17643 ) ( AVAILABLE ?auto_17653 ) ( SURFACE-AT ?auto_17643 ?auto_17654 ) ( ON ?auto_17643 ?auto_17675 ) ( CLEAR ?auto_17643 ) ( not ( = ?auto_17642 ?auto_17643 ) ) ( not ( = ?auto_17642 ?auto_17675 ) ) ( not ( = ?auto_17643 ?auto_17675 ) ) ( IS-CRATE ?auto_17642 ) ( not ( = ?auto_17676 ?auto_17656 ) ) ( HOIST-AT ?auto_17680 ?auto_17676 ) ( SURFACE-AT ?auto_17642 ?auto_17676 ) ( ON ?auto_17642 ?auto_17678 ) ( CLEAR ?auto_17642 ) ( not ( = ?auto_17641 ?auto_17642 ) ) ( not ( = ?auto_17641 ?auto_17678 ) ) ( not ( = ?auto_17642 ?auto_17678 ) ) ( not ( = ?auto_17655 ?auto_17680 ) ) ( IS-CRATE ?auto_17641 ) ( AVAILABLE ?auto_17680 ) ( SURFACE-AT ?auto_17641 ?auto_17676 ) ( ON ?auto_17641 ?auto_17670 ) ( CLEAR ?auto_17641 ) ( not ( = ?auto_17640 ?auto_17641 ) ) ( not ( = ?auto_17640 ?auto_17670 ) ) ( not ( = ?auto_17641 ?auto_17670 ) ) ( SURFACE-AT ?auto_17639 ?auto_17656 ) ( CLEAR ?auto_17639 ) ( IS-CRATE ?auto_17640 ) ( AVAILABLE ?auto_17655 ) ( not ( = ?auto_17665 ?auto_17656 ) ) ( HOIST-AT ?auto_17686 ?auto_17665 ) ( AVAILABLE ?auto_17686 ) ( SURFACE-AT ?auto_17640 ?auto_17665 ) ( ON ?auto_17640 ?auto_17660 ) ( CLEAR ?auto_17640 ) ( TRUCK-AT ?auto_17657 ?auto_17656 ) ( not ( = ?auto_17639 ?auto_17640 ) ) ( not ( = ?auto_17639 ?auto_17660 ) ) ( not ( = ?auto_17640 ?auto_17660 ) ) ( not ( = ?auto_17655 ?auto_17686 ) ) ( not ( = ?auto_17639 ?auto_17641 ) ) ( not ( = ?auto_17639 ?auto_17670 ) ) ( not ( = ?auto_17641 ?auto_17660 ) ) ( not ( = ?auto_17676 ?auto_17665 ) ) ( not ( = ?auto_17680 ?auto_17686 ) ) ( not ( = ?auto_17670 ?auto_17660 ) ) ( not ( = ?auto_17639 ?auto_17642 ) ) ( not ( = ?auto_17639 ?auto_17678 ) ) ( not ( = ?auto_17640 ?auto_17642 ) ) ( not ( = ?auto_17640 ?auto_17678 ) ) ( not ( = ?auto_17642 ?auto_17670 ) ) ( not ( = ?auto_17642 ?auto_17660 ) ) ( not ( = ?auto_17678 ?auto_17670 ) ) ( not ( = ?auto_17678 ?auto_17660 ) ) ( not ( = ?auto_17639 ?auto_17643 ) ) ( not ( = ?auto_17639 ?auto_17675 ) ) ( not ( = ?auto_17640 ?auto_17643 ) ) ( not ( = ?auto_17640 ?auto_17675 ) ) ( not ( = ?auto_17641 ?auto_17643 ) ) ( not ( = ?auto_17641 ?auto_17675 ) ) ( not ( = ?auto_17643 ?auto_17678 ) ) ( not ( = ?auto_17643 ?auto_17670 ) ) ( not ( = ?auto_17643 ?auto_17660 ) ) ( not ( = ?auto_17654 ?auto_17676 ) ) ( not ( = ?auto_17654 ?auto_17665 ) ) ( not ( = ?auto_17653 ?auto_17680 ) ) ( not ( = ?auto_17653 ?auto_17686 ) ) ( not ( = ?auto_17675 ?auto_17678 ) ) ( not ( = ?auto_17675 ?auto_17670 ) ) ( not ( = ?auto_17675 ?auto_17660 ) ) ( not ( = ?auto_17639 ?auto_17644 ) ) ( not ( = ?auto_17639 ?auto_17681 ) ) ( not ( = ?auto_17640 ?auto_17644 ) ) ( not ( = ?auto_17640 ?auto_17681 ) ) ( not ( = ?auto_17641 ?auto_17644 ) ) ( not ( = ?auto_17641 ?auto_17681 ) ) ( not ( = ?auto_17642 ?auto_17644 ) ) ( not ( = ?auto_17642 ?auto_17681 ) ) ( not ( = ?auto_17644 ?auto_17675 ) ) ( not ( = ?auto_17644 ?auto_17678 ) ) ( not ( = ?auto_17644 ?auto_17670 ) ) ( not ( = ?auto_17644 ?auto_17660 ) ) ( not ( = ?auto_17684 ?auto_17654 ) ) ( not ( = ?auto_17684 ?auto_17676 ) ) ( not ( = ?auto_17684 ?auto_17665 ) ) ( not ( = ?auto_17683 ?auto_17653 ) ) ( not ( = ?auto_17683 ?auto_17680 ) ) ( not ( = ?auto_17683 ?auto_17686 ) ) ( not ( = ?auto_17681 ?auto_17675 ) ) ( not ( = ?auto_17681 ?auto_17678 ) ) ( not ( = ?auto_17681 ?auto_17670 ) ) ( not ( = ?auto_17681 ?auto_17660 ) ) ( not ( = ?auto_17639 ?auto_17645 ) ) ( not ( = ?auto_17639 ?auto_17674 ) ) ( not ( = ?auto_17640 ?auto_17645 ) ) ( not ( = ?auto_17640 ?auto_17674 ) ) ( not ( = ?auto_17641 ?auto_17645 ) ) ( not ( = ?auto_17641 ?auto_17674 ) ) ( not ( = ?auto_17642 ?auto_17645 ) ) ( not ( = ?auto_17642 ?auto_17674 ) ) ( not ( = ?auto_17643 ?auto_17645 ) ) ( not ( = ?auto_17643 ?auto_17674 ) ) ( not ( = ?auto_17645 ?auto_17681 ) ) ( not ( = ?auto_17645 ?auto_17675 ) ) ( not ( = ?auto_17645 ?auto_17678 ) ) ( not ( = ?auto_17645 ?auto_17670 ) ) ( not ( = ?auto_17645 ?auto_17660 ) ) ( not ( = ?auto_17677 ?auto_17684 ) ) ( not ( = ?auto_17677 ?auto_17654 ) ) ( not ( = ?auto_17677 ?auto_17676 ) ) ( not ( = ?auto_17677 ?auto_17665 ) ) ( not ( = ?auto_17668 ?auto_17683 ) ) ( not ( = ?auto_17668 ?auto_17653 ) ) ( not ( = ?auto_17668 ?auto_17680 ) ) ( not ( = ?auto_17668 ?auto_17686 ) ) ( not ( = ?auto_17674 ?auto_17681 ) ) ( not ( = ?auto_17674 ?auto_17675 ) ) ( not ( = ?auto_17674 ?auto_17678 ) ) ( not ( = ?auto_17674 ?auto_17670 ) ) ( not ( = ?auto_17674 ?auto_17660 ) ) ( not ( = ?auto_17639 ?auto_17646 ) ) ( not ( = ?auto_17639 ?auto_17673 ) ) ( not ( = ?auto_17640 ?auto_17646 ) ) ( not ( = ?auto_17640 ?auto_17673 ) ) ( not ( = ?auto_17641 ?auto_17646 ) ) ( not ( = ?auto_17641 ?auto_17673 ) ) ( not ( = ?auto_17642 ?auto_17646 ) ) ( not ( = ?auto_17642 ?auto_17673 ) ) ( not ( = ?auto_17643 ?auto_17646 ) ) ( not ( = ?auto_17643 ?auto_17673 ) ) ( not ( = ?auto_17644 ?auto_17646 ) ) ( not ( = ?auto_17644 ?auto_17673 ) ) ( not ( = ?auto_17646 ?auto_17674 ) ) ( not ( = ?auto_17646 ?auto_17681 ) ) ( not ( = ?auto_17646 ?auto_17675 ) ) ( not ( = ?auto_17646 ?auto_17678 ) ) ( not ( = ?auto_17646 ?auto_17670 ) ) ( not ( = ?auto_17646 ?auto_17660 ) ) ( not ( = ?auto_17679 ?auto_17677 ) ) ( not ( = ?auto_17679 ?auto_17684 ) ) ( not ( = ?auto_17679 ?auto_17654 ) ) ( not ( = ?auto_17679 ?auto_17676 ) ) ( not ( = ?auto_17679 ?auto_17665 ) ) ( not ( = ?auto_17685 ?auto_17668 ) ) ( not ( = ?auto_17685 ?auto_17683 ) ) ( not ( = ?auto_17685 ?auto_17653 ) ) ( not ( = ?auto_17685 ?auto_17680 ) ) ( not ( = ?auto_17685 ?auto_17686 ) ) ( not ( = ?auto_17673 ?auto_17674 ) ) ( not ( = ?auto_17673 ?auto_17681 ) ) ( not ( = ?auto_17673 ?auto_17675 ) ) ( not ( = ?auto_17673 ?auto_17678 ) ) ( not ( = ?auto_17673 ?auto_17670 ) ) ( not ( = ?auto_17673 ?auto_17660 ) ) ( not ( = ?auto_17639 ?auto_17647 ) ) ( not ( = ?auto_17639 ?auto_17671 ) ) ( not ( = ?auto_17640 ?auto_17647 ) ) ( not ( = ?auto_17640 ?auto_17671 ) ) ( not ( = ?auto_17641 ?auto_17647 ) ) ( not ( = ?auto_17641 ?auto_17671 ) ) ( not ( = ?auto_17642 ?auto_17647 ) ) ( not ( = ?auto_17642 ?auto_17671 ) ) ( not ( = ?auto_17643 ?auto_17647 ) ) ( not ( = ?auto_17643 ?auto_17671 ) ) ( not ( = ?auto_17644 ?auto_17647 ) ) ( not ( = ?auto_17644 ?auto_17671 ) ) ( not ( = ?auto_17645 ?auto_17647 ) ) ( not ( = ?auto_17645 ?auto_17671 ) ) ( not ( = ?auto_17647 ?auto_17673 ) ) ( not ( = ?auto_17647 ?auto_17674 ) ) ( not ( = ?auto_17647 ?auto_17681 ) ) ( not ( = ?auto_17647 ?auto_17675 ) ) ( not ( = ?auto_17647 ?auto_17678 ) ) ( not ( = ?auto_17647 ?auto_17670 ) ) ( not ( = ?auto_17647 ?auto_17660 ) ) ( not ( = ?auto_17671 ?auto_17673 ) ) ( not ( = ?auto_17671 ?auto_17674 ) ) ( not ( = ?auto_17671 ?auto_17681 ) ) ( not ( = ?auto_17671 ?auto_17675 ) ) ( not ( = ?auto_17671 ?auto_17678 ) ) ( not ( = ?auto_17671 ?auto_17670 ) ) ( not ( = ?auto_17671 ?auto_17660 ) ) ( not ( = ?auto_17639 ?auto_17648 ) ) ( not ( = ?auto_17639 ?auto_17667 ) ) ( not ( = ?auto_17640 ?auto_17648 ) ) ( not ( = ?auto_17640 ?auto_17667 ) ) ( not ( = ?auto_17641 ?auto_17648 ) ) ( not ( = ?auto_17641 ?auto_17667 ) ) ( not ( = ?auto_17642 ?auto_17648 ) ) ( not ( = ?auto_17642 ?auto_17667 ) ) ( not ( = ?auto_17643 ?auto_17648 ) ) ( not ( = ?auto_17643 ?auto_17667 ) ) ( not ( = ?auto_17644 ?auto_17648 ) ) ( not ( = ?auto_17644 ?auto_17667 ) ) ( not ( = ?auto_17645 ?auto_17648 ) ) ( not ( = ?auto_17645 ?auto_17667 ) ) ( not ( = ?auto_17646 ?auto_17648 ) ) ( not ( = ?auto_17646 ?auto_17667 ) ) ( not ( = ?auto_17648 ?auto_17671 ) ) ( not ( = ?auto_17648 ?auto_17673 ) ) ( not ( = ?auto_17648 ?auto_17674 ) ) ( not ( = ?auto_17648 ?auto_17681 ) ) ( not ( = ?auto_17648 ?auto_17675 ) ) ( not ( = ?auto_17648 ?auto_17678 ) ) ( not ( = ?auto_17648 ?auto_17670 ) ) ( not ( = ?auto_17648 ?auto_17660 ) ) ( not ( = ?auto_17662 ?auto_17679 ) ) ( not ( = ?auto_17662 ?auto_17677 ) ) ( not ( = ?auto_17662 ?auto_17684 ) ) ( not ( = ?auto_17662 ?auto_17654 ) ) ( not ( = ?auto_17662 ?auto_17676 ) ) ( not ( = ?auto_17662 ?auto_17665 ) ) ( not ( = ?auto_17659 ?auto_17685 ) ) ( not ( = ?auto_17659 ?auto_17668 ) ) ( not ( = ?auto_17659 ?auto_17683 ) ) ( not ( = ?auto_17659 ?auto_17653 ) ) ( not ( = ?auto_17659 ?auto_17680 ) ) ( not ( = ?auto_17659 ?auto_17686 ) ) ( not ( = ?auto_17667 ?auto_17671 ) ) ( not ( = ?auto_17667 ?auto_17673 ) ) ( not ( = ?auto_17667 ?auto_17674 ) ) ( not ( = ?auto_17667 ?auto_17681 ) ) ( not ( = ?auto_17667 ?auto_17675 ) ) ( not ( = ?auto_17667 ?auto_17678 ) ) ( not ( = ?auto_17667 ?auto_17670 ) ) ( not ( = ?auto_17667 ?auto_17660 ) ) ( not ( = ?auto_17639 ?auto_17649 ) ) ( not ( = ?auto_17639 ?auto_17682 ) ) ( not ( = ?auto_17640 ?auto_17649 ) ) ( not ( = ?auto_17640 ?auto_17682 ) ) ( not ( = ?auto_17641 ?auto_17649 ) ) ( not ( = ?auto_17641 ?auto_17682 ) ) ( not ( = ?auto_17642 ?auto_17649 ) ) ( not ( = ?auto_17642 ?auto_17682 ) ) ( not ( = ?auto_17643 ?auto_17649 ) ) ( not ( = ?auto_17643 ?auto_17682 ) ) ( not ( = ?auto_17644 ?auto_17649 ) ) ( not ( = ?auto_17644 ?auto_17682 ) ) ( not ( = ?auto_17645 ?auto_17649 ) ) ( not ( = ?auto_17645 ?auto_17682 ) ) ( not ( = ?auto_17646 ?auto_17649 ) ) ( not ( = ?auto_17646 ?auto_17682 ) ) ( not ( = ?auto_17647 ?auto_17649 ) ) ( not ( = ?auto_17647 ?auto_17682 ) ) ( not ( = ?auto_17649 ?auto_17667 ) ) ( not ( = ?auto_17649 ?auto_17671 ) ) ( not ( = ?auto_17649 ?auto_17673 ) ) ( not ( = ?auto_17649 ?auto_17674 ) ) ( not ( = ?auto_17649 ?auto_17681 ) ) ( not ( = ?auto_17649 ?auto_17675 ) ) ( not ( = ?auto_17649 ?auto_17678 ) ) ( not ( = ?auto_17649 ?auto_17670 ) ) ( not ( = ?auto_17649 ?auto_17660 ) ) ( not ( = ?auto_17672 ?auto_17662 ) ) ( not ( = ?auto_17672 ?auto_17679 ) ) ( not ( = ?auto_17672 ?auto_17677 ) ) ( not ( = ?auto_17672 ?auto_17684 ) ) ( not ( = ?auto_17672 ?auto_17654 ) ) ( not ( = ?auto_17672 ?auto_17676 ) ) ( not ( = ?auto_17672 ?auto_17665 ) ) ( not ( = ?auto_17666 ?auto_17659 ) ) ( not ( = ?auto_17666 ?auto_17685 ) ) ( not ( = ?auto_17666 ?auto_17668 ) ) ( not ( = ?auto_17666 ?auto_17683 ) ) ( not ( = ?auto_17666 ?auto_17653 ) ) ( not ( = ?auto_17666 ?auto_17680 ) ) ( not ( = ?auto_17666 ?auto_17686 ) ) ( not ( = ?auto_17682 ?auto_17667 ) ) ( not ( = ?auto_17682 ?auto_17671 ) ) ( not ( = ?auto_17682 ?auto_17673 ) ) ( not ( = ?auto_17682 ?auto_17674 ) ) ( not ( = ?auto_17682 ?auto_17681 ) ) ( not ( = ?auto_17682 ?auto_17675 ) ) ( not ( = ?auto_17682 ?auto_17678 ) ) ( not ( = ?auto_17682 ?auto_17670 ) ) ( not ( = ?auto_17682 ?auto_17660 ) ) ( not ( = ?auto_17639 ?auto_17650 ) ) ( not ( = ?auto_17639 ?auto_17661 ) ) ( not ( = ?auto_17640 ?auto_17650 ) ) ( not ( = ?auto_17640 ?auto_17661 ) ) ( not ( = ?auto_17641 ?auto_17650 ) ) ( not ( = ?auto_17641 ?auto_17661 ) ) ( not ( = ?auto_17642 ?auto_17650 ) ) ( not ( = ?auto_17642 ?auto_17661 ) ) ( not ( = ?auto_17643 ?auto_17650 ) ) ( not ( = ?auto_17643 ?auto_17661 ) ) ( not ( = ?auto_17644 ?auto_17650 ) ) ( not ( = ?auto_17644 ?auto_17661 ) ) ( not ( = ?auto_17645 ?auto_17650 ) ) ( not ( = ?auto_17645 ?auto_17661 ) ) ( not ( = ?auto_17646 ?auto_17650 ) ) ( not ( = ?auto_17646 ?auto_17661 ) ) ( not ( = ?auto_17647 ?auto_17650 ) ) ( not ( = ?auto_17647 ?auto_17661 ) ) ( not ( = ?auto_17648 ?auto_17650 ) ) ( not ( = ?auto_17648 ?auto_17661 ) ) ( not ( = ?auto_17650 ?auto_17682 ) ) ( not ( = ?auto_17650 ?auto_17667 ) ) ( not ( = ?auto_17650 ?auto_17671 ) ) ( not ( = ?auto_17650 ?auto_17673 ) ) ( not ( = ?auto_17650 ?auto_17674 ) ) ( not ( = ?auto_17650 ?auto_17681 ) ) ( not ( = ?auto_17650 ?auto_17675 ) ) ( not ( = ?auto_17650 ?auto_17678 ) ) ( not ( = ?auto_17650 ?auto_17670 ) ) ( not ( = ?auto_17650 ?auto_17660 ) ) ( not ( = ?auto_17663 ?auto_17672 ) ) ( not ( = ?auto_17663 ?auto_17662 ) ) ( not ( = ?auto_17663 ?auto_17679 ) ) ( not ( = ?auto_17663 ?auto_17677 ) ) ( not ( = ?auto_17663 ?auto_17684 ) ) ( not ( = ?auto_17663 ?auto_17654 ) ) ( not ( = ?auto_17663 ?auto_17676 ) ) ( not ( = ?auto_17663 ?auto_17665 ) ) ( not ( = ?auto_17669 ?auto_17666 ) ) ( not ( = ?auto_17669 ?auto_17659 ) ) ( not ( = ?auto_17669 ?auto_17685 ) ) ( not ( = ?auto_17669 ?auto_17668 ) ) ( not ( = ?auto_17669 ?auto_17683 ) ) ( not ( = ?auto_17669 ?auto_17653 ) ) ( not ( = ?auto_17669 ?auto_17680 ) ) ( not ( = ?auto_17669 ?auto_17686 ) ) ( not ( = ?auto_17661 ?auto_17682 ) ) ( not ( = ?auto_17661 ?auto_17667 ) ) ( not ( = ?auto_17661 ?auto_17671 ) ) ( not ( = ?auto_17661 ?auto_17673 ) ) ( not ( = ?auto_17661 ?auto_17674 ) ) ( not ( = ?auto_17661 ?auto_17681 ) ) ( not ( = ?auto_17661 ?auto_17675 ) ) ( not ( = ?auto_17661 ?auto_17678 ) ) ( not ( = ?auto_17661 ?auto_17670 ) ) ( not ( = ?auto_17661 ?auto_17660 ) ) ( not ( = ?auto_17639 ?auto_17651 ) ) ( not ( = ?auto_17639 ?auto_17664 ) ) ( not ( = ?auto_17640 ?auto_17651 ) ) ( not ( = ?auto_17640 ?auto_17664 ) ) ( not ( = ?auto_17641 ?auto_17651 ) ) ( not ( = ?auto_17641 ?auto_17664 ) ) ( not ( = ?auto_17642 ?auto_17651 ) ) ( not ( = ?auto_17642 ?auto_17664 ) ) ( not ( = ?auto_17643 ?auto_17651 ) ) ( not ( = ?auto_17643 ?auto_17664 ) ) ( not ( = ?auto_17644 ?auto_17651 ) ) ( not ( = ?auto_17644 ?auto_17664 ) ) ( not ( = ?auto_17645 ?auto_17651 ) ) ( not ( = ?auto_17645 ?auto_17664 ) ) ( not ( = ?auto_17646 ?auto_17651 ) ) ( not ( = ?auto_17646 ?auto_17664 ) ) ( not ( = ?auto_17647 ?auto_17651 ) ) ( not ( = ?auto_17647 ?auto_17664 ) ) ( not ( = ?auto_17648 ?auto_17651 ) ) ( not ( = ?auto_17648 ?auto_17664 ) ) ( not ( = ?auto_17649 ?auto_17651 ) ) ( not ( = ?auto_17649 ?auto_17664 ) ) ( not ( = ?auto_17651 ?auto_17661 ) ) ( not ( = ?auto_17651 ?auto_17682 ) ) ( not ( = ?auto_17651 ?auto_17667 ) ) ( not ( = ?auto_17651 ?auto_17671 ) ) ( not ( = ?auto_17651 ?auto_17673 ) ) ( not ( = ?auto_17651 ?auto_17674 ) ) ( not ( = ?auto_17651 ?auto_17681 ) ) ( not ( = ?auto_17651 ?auto_17675 ) ) ( not ( = ?auto_17651 ?auto_17678 ) ) ( not ( = ?auto_17651 ?auto_17670 ) ) ( not ( = ?auto_17651 ?auto_17660 ) ) ( not ( = ?auto_17664 ?auto_17661 ) ) ( not ( = ?auto_17664 ?auto_17682 ) ) ( not ( = ?auto_17664 ?auto_17667 ) ) ( not ( = ?auto_17664 ?auto_17671 ) ) ( not ( = ?auto_17664 ?auto_17673 ) ) ( not ( = ?auto_17664 ?auto_17674 ) ) ( not ( = ?auto_17664 ?auto_17681 ) ) ( not ( = ?auto_17664 ?auto_17675 ) ) ( not ( = ?auto_17664 ?auto_17678 ) ) ( not ( = ?auto_17664 ?auto_17670 ) ) ( not ( = ?auto_17664 ?auto_17660 ) ) ( not ( = ?auto_17639 ?auto_17652 ) ) ( not ( = ?auto_17639 ?auto_17658 ) ) ( not ( = ?auto_17640 ?auto_17652 ) ) ( not ( = ?auto_17640 ?auto_17658 ) ) ( not ( = ?auto_17641 ?auto_17652 ) ) ( not ( = ?auto_17641 ?auto_17658 ) ) ( not ( = ?auto_17642 ?auto_17652 ) ) ( not ( = ?auto_17642 ?auto_17658 ) ) ( not ( = ?auto_17643 ?auto_17652 ) ) ( not ( = ?auto_17643 ?auto_17658 ) ) ( not ( = ?auto_17644 ?auto_17652 ) ) ( not ( = ?auto_17644 ?auto_17658 ) ) ( not ( = ?auto_17645 ?auto_17652 ) ) ( not ( = ?auto_17645 ?auto_17658 ) ) ( not ( = ?auto_17646 ?auto_17652 ) ) ( not ( = ?auto_17646 ?auto_17658 ) ) ( not ( = ?auto_17647 ?auto_17652 ) ) ( not ( = ?auto_17647 ?auto_17658 ) ) ( not ( = ?auto_17648 ?auto_17652 ) ) ( not ( = ?auto_17648 ?auto_17658 ) ) ( not ( = ?auto_17649 ?auto_17652 ) ) ( not ( = ?auto_17649 ?auto_17658 ) ) ( not ( = ?auto_17650 ?auto_17652 ) ) ( not ( = ?auto_17650 ?auto_17658 ) ) ( not ( = ?auto_17652 ?auto_17664 ) ) ( not ( = ?auto_17652 ?auto_17661 ) ) ( not ( = ?auto_17652 ?auto_17682 ) ) ( not ( = ?auto_17652 ?auto_17667 ) ) ( not ( = ?auto_17652 ?auto_17671 ) ) ( not ( = ?auto_17652 ?auto_17673 ) ) ( not ( = ?auto_17652 ?auto_17674 ) ) ( not ( = ?auto_17652 ?auto_17681 ) ) ( not ( = ?auto_17652 ?auto_17675 ) ) ( not ( = ?auto_17652 ?auto_17678 ) ) ( not ( = ?auto_17652 ?auto_17670 ) ) ( not ( = ?auto_17652 ?auto_17660 ) ) ( not ( = ?auto_17658 ?auto_17664 ) ) ( not ( = ?auto_17658 ?auto_17661 ) ) ( not ( = ?auto_17658 ?auto_17682 ) ) ( not ( = ?auto_17658 ?auto_17667 ) ) ( not ( = ?auto_17658 ?auto_17671 ) ) ( not ( = ?auto_17658 ?auto_17673 ) ) ( not ( = ?auto_17658 ?auto_17674 ) ) ( not ( = ?auto_17658 ?auto_17681 ) ) ( not ( = ?auto_17658 ?auto_17675 ) ) ( not ( = ?auto_17658 ?auto_17678 ) ) ( not ( = ?auto_17658 ?auto_17670 ) ) ( not ( = ?auto_17658 ?auto_17660 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_17639 ?auto_17640 ?auto_17641 ?auto_17642 ?auto_17643 ?auto_17644 ?auto_17645 ?auto_17646 ?auto_17647 ?auto_17648 ?auto_17649 ?auto_17650 ?auto_17651 )
      ( MAKE-1CRATE ?auto_17651 ?auto_17652 )
      ( MAKE-13CRATE-VERIFY ?auto_17639 ?auto_17640 ?auto_17641 ?auto_17642 ?auto_17643 ?auto_17644 ?auto_17645 ?auto_17646 ?auto_17647 ?auto_17648 ?auto_17649 ?auto_17650 ?auto_17651 ?auto_17652 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_17712 - SURFACE
      ?auto_17713 - SURFACE
      ?auto_17714 - SURFACE
      ?auto_17715 - SURFACE
      ?auto_17716 - SURFACE
      ?auto_17717 - SURFACE
      ?auto_17718 - SURFACE
      ?auto_17719 - SURFACE
      ?auto_17720 - SURFACE
      ?auto_17721 - SURFACE
      ?auto_17722 - SURFACE
      ?auto_17723 - SURFACE
      ?auto_17724 - SURFACE
      ?auto_17725 - SURFACE
      ?auto_17726 - SURFACE
    )
    :vars
    (
      ?auto_17727 - HOIST
      ?auto_17731 - PLACE
      ?auto_17730 - PLACE
      ?auto_17728 - HOIST
      ?auto_17729 - SURFACE
      ?auto_17744 - PLACE
      ?auto_17747 - HOIST
      ?auto_17749 - SURFACE
      ?auto_17742 - SURFACE
      ?auto_17748 - SURFACE
      ?auto_17756 - PLACE
      ?auto_17736 - HOIST
      ?auto_17751 - SURFACE
      ?auto_17759 - PLACE
      ?auto_17755 - HOIST
      ?auto_17738 - SURFACE
      ?auto_17745 - PLACE
      ?auto_17752 - HOIST
      ?auto_17741 - SURFACE
      ?auto_17753 - SURFACE
      ?auto_17757 - PLACE
      ?auto_17735 - HOIST
      ?auto_17734 - SURFACE
      ?auto_17743 - PLACE
      ?auto_17746 - HOIST
      ?auto_17750 - SURFACE
      ?auto_17740 - SURFACE
      ?auto_17737 - PLACE
      ?auto_17739 - HOIST
      ?auto_17760 - SURFACE
      ?auto_17754 - SURFACE
      ?auto_17733 - PLACE
      ?auto_17761 - HOIST
      ?auto_17758 - SURFACE
      ?auto_17732 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17727 ?auto_17731 ) ( IS-CRATE ?auto_17726 ) ( not ( = ?auto_17730 ?auto_17731 ) ) ( HOIST-AT ?auto_17728 ?auto_17730 ) ( SURFACE-AT ?auto_17726 ?auto_17730 ) ( ON ?auto_17726 ?auto_17729 ) ( CLEAR ?auto_17726 ) ( not ( = ?auto_17725 ?auto_17726 ) ) ( not ( = ?auto_17725 ?auto_17729 ) ) ( not ( = ?auto_17726 ?auto_17729 ) ) ( not ( = ?auto_17727 ?auto_17728 ) ) ( IS-CRATE ?auto_17725 ) ( not ( = ?auto_17744 ?auto_17731 ) ) ( HOIST-AT ?auto_17747 ?auto_17744 ) ( SURFACE-AT ?auto_17725 ?auto_17744 ) ( ON ?auto_17725 ?auto_17749 ) ( CLEAR ?auto_17725 ) ( not ( = ?auto_17724 ?auto_17725 ) ) ( not ( = ?auto_17724 ?auto_17749 ) ) ( not ( = ?auto_17725 ?auto_17749 ) ) ( not ( = ?auto_17727 ?auto_17747 ) ) ( IS-CRATE ?auto_17724 ) ( SURFACE-AT ?auto_17724 ?auto_17744 ) ( ON ?auto_17724 ?auto_17742 ) ( CLEAR ?auto_17724 ) ( not ( = ?auto_17723 ?auto_17724 ) ) ( not ( = ?auto_17723 ?auto_17742 ) ) ( not ( = ?auto_17724 ?auto_17742 ) ) ( IS-CRATE ?auto_17723 ) ( AVAILABLE ?auto_17728 ) ( SURFACE-AT ?auto_17723 ?auto_17730 ) ( ON ?auto_17723 ?auto_17748 ) ( CLEAR ?auto_17723 ) ( not ( = ?auto_17722 ?auto_17723 ) ) ( not ( = ?auto_17722 ?auto_17748 ) ) ( not ( = ?auto_17723 ?auto_17748 ) ) ( IS-CRATE ?auto_17722 ) ( not ( = ?auto_17756 ?auto_17731 ) ) ( HOIST-AT ?auto_17736 ?auto_17756 ) ( AVAILABLE ?auto_17736 ) ( SURFACE-AT ?auto_17722 ?auto_17756 ) ( ON ?auto_17722 ?auto_17751 ) ( CLEAR ?auto_17722 ) ( not ( = ?auto_17721 ?auto_17722 ) ) ( not ( = ?auto_17721 ?auto_17751 ) ) ( not ( = ?auto_17722 ?auto_17751 ) ) ( not ( = ?auto_17727 ?auto_17736 ) ) ( IS-CRATE ?auto_17721 ) ( not ( = ?auto_17759 ?auto_17731 ) ) ( HOIST-AT ?auto_17755 ?auto_17759 ) ( AVAILABLE ?auto_17755 ) ( SURFACE-AT ?auto_17721 ?auto_17759 ) ( ON ?auto_17721 ?auto_17738 ) ( CLEAR ?auto_17721 ) ( not ( = ?auto_17720 ?auto_17721 ) ) ( not ( = ?auto_17720 ?auto_17738 ) ) ( not ( = ?auto_17721 ?auto_17738 ) ) ( not ( = ?auto_17727 ?auto_17755 ) ) ( IS-CRATE ?auto_17720 ) ( not ( = ?auto_17745 ?auto_17731 ) ) ( HOIST-AT ?auto_17752 ?auto_17745 ) ( SURFACE-AT ?auto_17720 ?auto_17745 ) ( ON ?auto_17720 ?auto_17741 ) ( CLEAR ?auto_17720 ) ( not ( = ?auto_17719 ?auto_17720 ) ) ( not ( = ?auto_17719 ?auto_17741 ) ) ( not ( = ?auto_17720 ?auto_17741 ) ) ( not ( = ?auto_17727 ?auto_17752 ) ) ( IS-CRATE ?auto_17719 ) ( AVAILABLE ?auto_17752 ) ( SURFACE-AT ?auto_17719 ?auto_17745 ) ( ON ?auto_17719 ?auto_17753 ) ( CLEAR ?auto_17719 ) ( not ( = ?auto_17718 ?auto_17719 ) ) ( not ( = ?auto_17718 ?auto_17753 ) ) ( not ( = ?auto_17719 ?auto_17753 ) ) ( IS-CRATE ?auto_17718 ) ( not ( = ?auto_17757 ?auto_17731 ) ) ( HOIST-AT ?auto_17735 ?auto_17757 ) ( AVAILABLE ?auto_17735 ) ( SURFACE-AT ?auto_17718 ?auto_17757 ) ( ON ?auto_17718 ?auto_17734 ) ( CLEAR ?auto_17718 ) ( not ( = ?auto_17717 ?auto_17718 ) ) ( not ( = ?auto_17717 ?auto_17734 ) ) ( not ( = ?auto_17718 ?auto_17734 ) ) ( not ( = ?auto_17727 ?auto_17735 ) ) ( IS-CRATE ?auto_17717 ) ( not ( = ?auto_17743 ?auto_17731 ) ) ( HOIST-AT ?auto_17746 ?auto_17743 ) ( AVAILABLE ?auto_17746 ) ( SURFACE-AT ?auto_17717 ?auto_17743 ) ( ON ?auto_17717 ?auto_17750 ) ( CLEAR ?auto_17717 ) ( not ( = ?auto_17716 ?auto_17717 ) ) ( not ( = ?auto_17716 ?auto_17750 ) ) ( not ( = ?auto_17717 ?auto_17750 ) ) ( not ( = ?auto_17727 ?auto_17746 ) ) ( IS-CRATE ?auto_17716 ) ( AVAILABLE ?auto_17747 ) ( SURFACE-AT ?auto_17716 ?auto_17744 ) ( ON ?auto_17716 ?auto_17740 ) ( CLEAR ?auto_17716 ) ( not ( = ?auto_17715 ?auto_17716 ) ) ( not ( = ?auto_17715 ?auto_17740 ) ) ( not ( = ?auto_17716 ?auto_17740 ) ) ( IS-CRATE ?auto_17715 ) ( not ( = ?auto_17737 ?auto_17731 ) ) ( HOIST-AT ?auto_17739 ?auto_17737 ) ( SURFACE-AT ?auto_17715 ?auto_17737 ) ( ON ?auto_17715 ?auto_17760 ) ( CLEAR ?auto_17715 ) ( not ( = ?auto_17714 ?auto_17715 ) ) ( not ( = ?auto_17714 ?auto_17760 ) ) ( not ( = ?auto_17715 ?auto_17760 ) ) ( not ( = ?auto_17727 ?auto_17739 ) ) ( IS-CRATE ?auto_17714 ) ( AVAILABLE ?auto_17739 ) ( SURFACE-AT ?auto_17714 ?auto_17737 ) ( ON ?auto_17714 ?auto_17754 ) ( CLEAR ?auto_17714 ) ( not ( = ?auto_17713 ?auto_17714 ) ) ( not ( = ?auto_17713 ?auto_17754 ) ) ( not ( = ?auto_17714 ?auto_17754 ) ) ( SURFACE-AT ?auto_17712 ?auto_17731 ) ( CLEAR ?auto_17712 ) ( IS-CRATE ?auto_17713 ) ( AVAILABLE ?auto_17727 ) ( not ( = ?auto_17733 ?auto_17731 ) ) ( HOIST-AT ?auto_17761 ?auto_17733 ) ( AVAILABLE ?auto_17761 ) ( SURFACE-AT ?auto_17713 ?auto_17733 ) ( ON ?auto_17713 ?auto_17758 ) ( CLEAR ?auto_17713 ) ( TRUCK-AT ?auto_17732 ?auto_17731 ) ( not ( = ?auto_17712 ?auto_17713 ) ) ( not ( = ?auto_17712 ?auto_17758 ) ) ( not ( = ?auto_17713 ?auto_17758 ) ) ( not ( = ?auto_17727 ?auto_17761 ) ) ( not ( = ?auto_17712 ?auto_17714 ) ) ( not ( = ?auto_17712 ?auto_17754 ) ) ( not ( = ?auto_17714 ?auto_17758 ) ) ( not ( = ?auto_17737 ?auto_17733 ) ) ( not ( = ?auto_17739 ?auto_17761 ) ) ( not ( = ?auto_17754 ?auto_17758 ) ) ( not ( = ?auto_17712 ?auto_17715 ) ) ( not ( = ?auto_17712 ?auto_17760 ) ) ( not ( = ?auto_17713 ?auto_17715 ) ) ( not ( = ?auto_17713 ?auto_17760 ) ) ( not ( = ?auto_17715 ?auto_17754 ) ) ( not ( = ?auto_17715 ?auto_17758 ) ) ( not ( = ?auto_17760 ?auto_17754 ) ) ( not ( = ?auto_17760 ?auto_17758 ) ) ( not ( = ?auto_17712 ?auto_17716 ) ) ( not ( = ?auto_17712 ?auto_17740 ) ) ( not ( = ?auto_17713 ?auto_17716 ) ) ( not ( = ?auto_17713 ?auto_17740 ) ) ( not ( = ?auto_17714 ?auto_17716 ) ) ( not ( = ?auto_17714 ?auto_17740 ) ) ( not ( = ?auto_17716 ?auto_17760 ) ) ( not ( = ?auto_17716 ?auto_17754 ) ) ( not ( = ?auto_17716 ?auto_17758 ) ) ( not ( = ?auto_17744 ?auto_17737 ) ) ( not ( = ?auto_17744 ?auto_17733 ) ) ( not ( = ?auto_17747 ?auto_17739 ) ) ( not ( = ?auto_17747 ?auto_17761 ) ) ( not ( = ?auto_17740 ?auto_17760 ) ) ( not ( = ?auto_17740 ?auto_17754 ) ) ( not ( = ?auto_17740 ?auto_17758 ) ) ( not ( = ?auto_17712 ?auto_17717 ) ) ( not ( = ?auto_17712 ?auto_17750 ) ) ( not ( = ?auto_17713 ?auto_17717 ) ) ( not ( = ?auto_17713 ?auto_17750 ) ) ( not ( = ?auto_17714 ?auto_17717 ) ) ( not ( = ?auto_17714 ?auto_17750 ) ) ( not ( = ?auto_17715 ?auto_17717 ) ) ( not ( = ?auto_17715 ?auto_17750 ) ) ( not ( = ?auto_17717 ?auto_17740 ) ) ( not ( = ?auto_17717 ?auto_17760 ) ) ( not ( = ?auto_17717 ?auto_17754 ) ) ( not ( = ?auto_17717 ?auto_17758 ) ) ( not ( = ?auto_17743 ?auto_17744 ) ) ( not ( = ?auto_17743 ?auto_17737 ) ) ( not ( = ?auto_17743 ?auto_17733 ) ) ( not ( = ?auto_17746 ?auto_17747 ) ) ( not ( = ?auto_17746 ?auto_17739 ) ) ( not ( = ?auto_17746 ?auto_17761 ) ) ( not ( = ?auto_17750 ?auto_17740 ) ) ( not ( = ?auto_17750 ?auto_17760 ) ) ( not ( = ?auto_17750 ?auto_17754 ) ) ( not ( = ?auto_17750 ?auto_17758 ) ) ( not ( = ?auto_17712 ?auto_17718 ) ) ( not ( = ?auto_17712 ?auto_17734 ) ) ( not ( = ?auto_17713 ?auto_17718 ) ) ( not ( = ?auto_17713 ?auto_17734 ) ) ( not ( = ?auto_17714 ?auto_17718 ) ) ( not ( = ?auto_17714 ?auto_17734 ) ) ( not ( = ?auto_17715 ?auto_17718 ) ) ( not ( = ?auto_17715 ?auto_17734 ) ) ( not ( = ?auto_17716 ?auto_17718 ) ) ( not ( = ?auto_17716 ?auto_17734 ) ) ( not ( = ?auto_17718 ?auto_17750 ) ) ( not ( = ?auto_17718 ?auto_17740 ) ) ( not ( = ?auto_17718 ?auto_17760 ) ) ( not ( = ?auto_17718 ?auto_17754 ) ) ( not ( = ?auto_17718 ?auto_17758 ) ) ( not ( = ?auto_17757 ?auto_17743 ) ) ( not ( = ?auto_17757 ?auto_17744 ) ) ( not ( = ?auto_17757 ?auto_17737 ) ) ( not ( = ?auto_17757 ?auto_17733 ) ) ( not ( = ?auto_17735 ?auto_17746 ) ) ( not ( = ?auto_17735 ?auto_17747 ) ) ( not ( = ?auto_17735 ?auto_17739 ) ) ( not ( = ?auto_17735 ?auto_17761 ) ) ( not ( = ?auto_17734 ?auto_17750 ) ) ( not ( = ?auto_17734 ?auto_17740 ) ) ( not ( = ?auto_17734 ?auto_17760 ) ) ( not ( = ?auto_17734 ?auto_17754 ) ) ( not ( = ?auto_17734 ?auto_17758 ) ) ( not ( = ?auto_17712 ?auto_17719 ) ) ( not ( = ?auto_17712 ?auto_17753 ) ) ( not ( = ?auto_17713 ?auto_17719 ) ) ( not ( = ?auto_17713 ?auto_17753 ) ) ( not ( = ?auto_17714 ?auto_17719 ) ) ( not ( = ?auto_17714 ?auto_17753 ) ) ( not ( = ?auto_17715 ?auto_17719 ) ) ( not ( = ?auto_17715 ?auto_17753 ) ) ( not ( = ?auto_17716 ?auto_17719 ) ) ( not ( = ?auto_17716 ?auto_17753 ) ) ( not ( = ?auto_17717 ?auto_17719 ) ) ( not ( = ?auto_17717 ?auto_17753 ) ) ( not ( = ?auto_17719 ?auto_17734 ) ) ( not ( = ?auto_17719 ?auto_17750 ) ) ( not ( = ?auto_17719 ?auto_17740 ) ) ( not ( = ?auto_17719 ?auto_17760 ) ) ( not ( = ?auto_17719 ?auto_17754 ) ) ( not ( = ?auto_17719 ?auto_17758 ) ) ( not ( = ?auto_17745 ?auto_17757 ) ) ( not ( = ?auto_17745 ?auto_17743 ) ) ( not ( = ?auto_17745 ?auto_17744 ) ) ( not ( = ?auto_17745 ?auto_17737 ) ) ( not ( = ?auto_17745 ?auto_17733 ) ) ( not ( = ?auto_17752 ?auto_17735 ) ) ( not ( = ?auto_17752 ?auto_17746 ) ) ( not ( = ?auto_17752 ?auto_17747 ) ) ( not ( = ?auto_17752 ?auto_17739 ) ) ( not ( = ?auto_17752 ?auto_17761 ) ) ( not ( = ?auto_17753 ?auto_17734 ) ) ( not ( = ?auto_17753 ?auto_17750 ) ) ( not ( = ?auto_17753 ?auto_17740 ) ) ( not ( = ?auto_17753 ?auto_17760 ) ) ( not ( = ?auto_17753 ?auto_17754 ) ) ( not ( = ?auto_17753 ?auto_17758 ) ) ( not ( = ?auto_17712 ?auto_17720 ) ) ( not ( = ?auto_17712 ?auto_17741 ) ) ( not ( = ?auto_17713 ?auto_17720 ) ) ( not ( = ?auto_17713 ?auto_17741 ) ) ( not ( = ?auto_17714 ?auto_17720 ) ) ( not ( = ?auto_17714 ?auto_17741 ) ) ( not ( = ?auto_17715 ?auto_17720 ) ) ( not ( = ?auto_17715 ?auto_17741 ) ) ( not ( = ?auto_17716 ?auto_17720 ) ) ( not ( = ?auto_17716 ?auto_17741 ) ) ( not ( = ?auto_17717 ?auto_17720 ) ) ( not ( = ?auto_17717 ?auto_17741 ) ) ( not ( = ?auto_17718 ?auto_17720 ) ) ( not ( = ?auto_17718 ?auto_17741 ) ) ( not ( = ?auto_17720 ?auto_17753 ) ) ( not ( = ?auto_17720 ?auto_17734 ) ) ( not ( = ?auto_17720 ?auto_17750 ) ) ( not ( = ?auto_17720 ?auto_17740 ) ) ( not ( = ?auto_17720 ?auto_17760 ) ) ( not ( = ?auto_17720 ?auto_17754 ) ) ( not ( = ?auto_17720 ?auto_17758 ) ) ( not ( = ?auto_17741 ?auto_17753 ) ) ( not ( = ?auto_17741 ?auto_17734 ) ) ( not ( = ?auto_17741 ?auto_17750 ) ) ( not ( = ?auto_17741 ?auto_17740 ) ) ( not ( = ?auto_17741 ?auto_17760 ) ) ( not ( = ?auto_17741 ?auto_17754 ) ) ( not ( = ?auto_17741 ?auto_17758 ) ) ( not ( = ?auto_17712 ?auto_17721 ) ) ( not ( = ?auto_17712 ?auto_17738 ) ) ( not ( = ?auto_17713 ?auto_17721 ) ) ( not ( = ?auto_17713 ?auto_17738 ) ) ( not ( = ?auto_17714 ?auto_17721 ) ) ( not ( = ?auto_17714 ?auto_17738 ) ) ( not ( = ?auto_17715 ?auto_17721 ) ) ( not ( = ?auto_17715 ?auto_17738 ) ) ( not ( = ?auto_17716 ?auto_17721 ) ) ( not ( = ?auto_17716 ?auto_17738 ) ) ( not ( = ?auto_17717 ?auto_17721 ) ) ( not ( = ?auto_17717 ?auto_17738 ) ) ( not ( = ?auto_17718 ?auto_17721 ) ) ( not ( = ?auto_17718 ?auto_17738 ) ) ( not ( = ?auto_17719 ?auto_17721 ) ) ( not ( = ?auto_17719 ?auto_17738 ) ) ( not ( = ?auto_17721 ?auto_17741 ) ) ( not ( = ?auto_17721 ?auto_17753 ) ) ( not ( = ?auto_17721 ?auto_17734 ) ) ( not ( = ?auto_17721 ?auto_17750 ) ) ( not ( = ?auto_17721 ?auto_17740 ) ) ( not ( = ?auto_17721 ?auto_17760 ) ) ( not ( = ?auto_17721 ?auto_17754 ) ) ( not ( = ?auto_17721 ?auto_17758 ) ) ( not ( = ?auto_17759 ?auto_17745 ) ) ( not ( = ?auto_17759 ?auto_17757 ) ) ( not ( = ?auto_17759 ?auto_17743 ) ) ( not ( = ?auto_17759 ?auto_17744 ) ) ( not ( = ?auto_17759 ?auto_17737 ) ) ( not ( = ?auto_17759 ?auto_17733 ) ) ( not ( = ?auto_17755 ?auto_17752 ) ) ( not ( = ?auto_17755 ?auto_17735 ) ) ( not ( = ?auto_17755 ?auto_17746 ) ) ( not ( = ?auto_17755 ?auto_17747 ) ) ( not ( = ?auto_17755 ?auto_17739 ) ) ( not ( = ?auto_17755 ?auto_17761 ) ) ( not ( = ?auto_17738 ?auto_17741 ) ) ( not ( = ?auto_17738 ?auto_17753 ) ) ( not ( = ?auto_17738 ?auto_17734 ) ) ( not ( = ?auto_17738 ?auto_17750 ) ) ( not ( = ?auto_17738 ?auto_17740 ) ) ( not ( = ?auto_17738 ?auto_17760 ) ) ( not ( = ?auto_17738 ?auto_17754 ) ) ( not ( = ?auto_17738 ?auto_17758 ) ) ( not ( = ?auto_17712 ?auto_17722 ) ) ( not ( = ?auto_17712 ?auto_17751 ) ) ( not ( = ?auto_17713 ?auto_17722 ) ) ( not ( = ?auto_17713 ?auto_17751 ) ) ( not ( = ?auto_17714 ?auto_17722 ) ) ( not ( = ?auto_17714 ?auto_17751 ) ) ( not ( = ?auto_17715 ?auto_17722 ) ) ( not ( = ?auto_17715 ?auto_17751 ) ) ( not ( = ?auto_17716 ?auto_17722 ) ) ( not ( = ?auto_17716 ?auto_17751 ) ) ( not ( = ?auto_17717 ?auto_17722 ) ) ( not ( = ?auto_17717 ?auto_17751 ) ) ( not ( = ?auto_17718 ?auto_17722 ) ) ( not ( = ?auto_17718 ?auto_17751 ) ) ( not ( = ?auto_17719 ?auto_17722 ) ) ( not ( = ?auto_17719 ?auto_17751 ) ) ( not ( = ?auto_17720 ?auto_17722 ) ) ( not ( = ?auto_17720 ?auto_17751 ) ) ( not ( = ?auto_17722 ?auto_17738 ) ) ( not ( = ?auto_17722 ?auto_17741 ) ) ( not ( = ?auto_17722 ?auto_17753 ) ) ( not ( = ?auto_17722 ?auto_17734 ) ) ( not ( = ?auto_17722 ?auto_17750 ) ) ( not ( = ?auto_17722 ?auto_17740 ) ) ( not ( = ?auto_17722 ?auto_17760 ) ) ( not ( = ?auto_17722 ?auto_17754 ) ) ( not ( = ?auto_17722 ?auto_17758 ) ) ( not ( = ?auto_17756 ?auto_17759 ) ) ( not ( = ?auto_17756 ?auto_17745 ) ) ( not ( = ?auto_17756 ?auto_17757 ) ) ( not ( = ?auto_17756 ?auto_17743 ) ) ( not ( = ?auto_17756 ?auto_17744 ) ) ( not ( = ?auto_17756 ?auto_17737 ) ) ( not ( = ?auto_17756 ?auto_17733 ) ) ( not ( = ?auto_17736 ?auto_17755 ) ) ( not ( = ?auto_17736 ?auto_17752 ) ) ( not ( = ?auto_17736 ?auto_17735 ) ) ( not ( = ?auto_17736 ?auto_17746 ) ) ( not ( = ?auto_17736 ?auto_17747 ) ) ( not ( = ?auto_17736 ?auto_17739 ) ) ( not ( = ?auto_17736 ?auto_17761 ) ) ( not ( = ?auto_17751 ?auto_17738 ) ) ( not ( = ?auto_17751 ?auto_17741 ) ) ( not ( = ?auto_17751 ?auto_17753 ) ) ( not ( = ?auto_17751 ?auto_17734 ) ) ( not ( = ?auto_17751 ?auto_17750 ) ) ( not ( = ?auto_17751 ?auto_17740 ) ) ( not ( = ?auto_17751 ?auto_17760 ) ) ( not ( = ?auto_17751 ?auto_17754 ) ) ( not ( = ?auto_17751 ?auto_17758 ) ) ( not ( = ?auto_17712 ?auto_17723 ) ) ( not ( = ?auto_17712 ?auto_17748 ) ) ( not ( = ?auto_17713 ?auto_17723 ) ) ( not ( = ?auto_17713 ?auto_17748 ) ) ( not ( = ?auto_17714 ?auto_17723 ) ) ( not ( = ?auto_17714 ?auto_17748 ) ) ( not ( = ?auto_17715 ?auto_17723 ) ) ( not ( = ?auto_17715 ?auto_17748 ) ) ( not ( = ?auto_17716 ?auto_17723 ) ) ( not ( = ?auto_17716 ?auto_17748 ) ) ( not ( = ?auto_17717 ?auto_17723 ) ) ( not ( = ?auto_17717 ?auto_17748 ) ) ( not ( = ?auto_17718 ?auto_17723 ) ) ( not ( = ?auto_17718 ?auto_17748 ) ) ( not ( = ?auto_17719 ?auto_17723 ) ) ( not ( = ?auto_17719 ?auto_17748 ) ) ( not ( = ?auto_17720 ?auto_17723 ) ) ( not ( = ?auto_17720 ?auto_17748 ) ) ( not ( = ?auto_17721 ?auto_17723 ) ) ( not ( = ?auto_17721 ?auto_17748 ) ) ( not ( = ?auto_17723 ?auto_17751 ) ) ( not ( = ?auto_17723 ?auto_17738 ) ) ( not ( = ?auto_17723 ?auto_17741 ) ) ( not ( = ?auto_17723 ?auto_17753 ) ) ( not ( = ?auto_17723 ?auto_17734 ) ) ( not ( = ?auto_17723 ?auto_17750 ) ) ( not ( = ?auto_17723 ?auto_17740 ) ) ( not ( = ?auto_17723 ?auto_17760 ) ) ( not ( = ?auto_17723 ?auto_17754 ) ) ( not ( = ?auto_17723 ?auto_17758 ) ) ( not ( = ?auto_17730 ?auto_17756 ) ) ( not ( = ?auto_17730 ?auto_17759 ) ) ( not ( = ?auto_17730 ?auto_17745 ) ) ( not ( = ?auto_17730 ?auto_17757 ) ) ( not ( = ?auto_17730 ?auto_17743 ) ) ( not ( = ?auto_17730 ?auto_17744 ) ) ( not ( = ?auto_17730 ?auto_17737 ) ) ( not ( = ?auto_17730 ?auto_17733 ) ) ( not ( = ?auto_17728 ?auto_17736 ) ) ( not ( = ?auto_17728 ?auto_17755 ) ) ( not ( = ?auto_17728 ?auto_17752 ) ) ( not ( = ?auto_17728 ?auto_17735 ) ) ( not ( = ?auto_17728 ?auto_17746 ) ) ( not ( = ?auto_17728 ?auto_17747 ) ) ( not ( = ?auto_17728 ?auto_17739 ) ) ( not ( = ?auto_17728 ?auto_17761 ) ) ( not ( = ?auto_17748 ?auto_17751 ) ) ( not ( = ?auto_17748 ?auto_17738 ) ) ( not ( = ?auto_17748 ?auto_17741 ) ) ( not ( = ?auto_17748 ?auto_17753 ) ) ( not ( = ?auto_17748 ?auto_17734 ) ) ( not ( = ?auto_17748 ?auto_17750 ) ) ( not ( = ?auto_17748 ?auto_17740 ) ) ( not ( = ?auto_17748 ?auto_17760 ) ) ( not ( = ?auto_17748 ?auto_17754 ) ) ( not ( = ?auto_17748 ?auto_17758 ) ) ( not ( = ?auto_17712 ?auto_17724 ) ) ( not ( = ?auto_17712 ?auto_17742 ) ) ( not ( = ?auto_17713 ?auto_17724 ) ) ( not ( = ?auto_17713 ?auto_17742 ) ) ( not ( = ?auto_17714 ?auto_17724 ) ) ( not ( = ?auto_17714 ?auto_17742 ) ) ( not ( = ?auto_17715 ?auto_17724 ) ) ( not ( = ?auto_17715 ?auto_17742 ) ) ( not ( = ?auto_17716 ?auto_17724 ) ) ( not ( = ?auto_17716 ?auto_17742 ) ) ( not ( = ?auto_17717 ?auto_17724 ) ) ( not ( = ?auto_17717 ?auto_17742 ) ) ( not ( = ?auto_17718 ?auto_17724 ) ) ( not ( = ?auto_17718 ?auto_17742 ) ) ( not ( = ?auto_17719 ?auto_17724 ) ) ( not ( = ?auto_17719 ?auto_17742 ) ) ( not ( = ?auto_17720 ?auto_17724 ) ) ( not ( = ?auto_17720 ?auto_17742 ) ) ( not ( = ?auto_17721 ?auto_17724 ) ) ( not ( = ?auto_17721 ?auto_17742 ) ) ( not ( = ?auto_17722 ?auto_17724 ) ) ( not ( = ?auto_17722 ?auto_17742 ) ) ( not ( = ?auto_17724 ?auto_17748 ) ) ( not ( = ?auto_17724 ?auto_17751 ) ) ( not ( = ?auto_17724 ?auto_17738 ) ) ( not ( = ?auto_17724 ?auto_17741 ) ) ( not ( = ?auto_17724 ?auto_17753 ) ) ( not ( = ?auto_17724 ?auto_17734 ) ) ( not ( = ?auto_17724 ?auto_17750 ) ) ( not ( = ?auto_17724 ?auto_17740 ) ) ( not ( = ?auto_17724 ?auto_17760 ) ) ( not ( = ?auto_17724 ?auto_17754 ) ) ( not ( = ?auto_17724 ?auto_17758 ) ) ( not ( = ?auto_17742 ?auto_17748 ) ) ( not ( = ?auto_17742 ?auto_17751 ) ) ( not ( = ?auto_17742 ?auto_17738 ) ) ( not ( = ?auto_17742 ?auto_17741 ) ) ( not ( = ?auto_17742 ?auto_17753 ) ) ( not ( = ?auto_17742 ?auto_17734 ) ) ( not ( = ?auto_17742 ?auto_17750 ) ) ( not ( = ?auto_17742 ?auto_17740 ) ) ( not ( = ?auto_17742 ?auto_17760 ) ) ( not ( = ?auto_17742 ?auto_17754 ) ) ( not ( = ?auto_17742 ?auto_17758 ) ) ( not ( = ?auto_17712 ?auto_17725 ) ) ( not ( = ?auto_17712 ?auto_17749 ) ) ( not ( = ?auto_17713 ?auto_17725 ) ) ( not ( = ?auto_17713 ?auto_17749 ) ) ( not ( = ?auto_17714 ?auto_17725 ) ) ( not ( = ?auto_17714 ?auto_17749 ) ) ( not ( = ?auto_17715 ?auto_17725 ) ) ( not ( = ?auto_17715 ?auto_17749 ) ) ( not ( = ?auto_17716 ?auto_17725 ) ) ( not ( = ?auto_17716 ?auto_17749 ) ) ( not ( = ?auto_17717 ?auto_17725 ) ) ( not ( = ?auto_17717 ?auto_17749 ) ) ( not ( = ?auto_17718 ?auto_17725 ) ) ( not ( = ?auto_17718 ?auto_17749 ) ) ( not ( = ?auto_17719 ?auto_17725 ) ) ( not ( = ?auto_17719 ?auto_17749 ) ) ( not ( = ?auto_17720 ?auto_17725 ) ) ( not ( = ?auto_17720 ?auto_17749 ) ) ( not ( = ?auto_17721 ?auto_17725 ) ) ( not ( = ?auto_17721 ?auto_17749 ) ) ( not ( = ?auto_17722 ?auto_17725 ) ) ( not ( = ?auto_17722 ?auto_17749 ) ) ( not ( = ?auto_17723 ?auto_17725 ) ) ( not ( = ?auto_17723 ?auto_17749 ) ) ( not ( = ?auto_17725 ?auto_17742 ) ) ( not ( = ?auto_17725 ?auto_17748 ) ) ( not ( = ?auto_17725 ?auto_17751 ) ) ( not ( = ?auto_17725 ?auto_17738 ) ) ( not ( = ?auto_17725 ?auto_17741 ) ) ( not ( = ?auto_17725 ?auto_17753 ) ) ( not ( = ?auto_17725 ?auto_17734 ) ) ( not ( = ?auto_17725 ?auto_17750 ) ) ( not ( = ?auto_17725 ?auto_17740 ) ) ( not ( = ?auto_17725 ?auto_17760 ) ) ( not ( = ?auto_17725 ?auto_17754 ) ) ( not ( = ?auto_17725 ?auto_17758 ) ) ( not ( = ?auto_17749 ?auto_17742 ) ) ( not ( = ?auto_17749 ?auto_17748 ) ) ( not ( = ?auto_17749 ?auto_17751 ) ) ( not ( = ?auto_17749 ?auto_17738 ) ) ( not ( = ?auto_17749 ?auto_17741 ) ) ( not ( = ?auto_17749 ?auto_17753 ) ) ( not ( = ?auto_17749 ?auto_17734 ) ) ( not ( = ?auto_17749 ?auto_17750 ) ) ( not ( = ?auto_17749 ?auto_17740 ) ) ( not ( = ?auto_17749 ?auto_17760 ) ) ( not ( = ?auto_17749 ?auto_17754 ) ) ( not ( = ?auto_17749 ?auto_17758 ) ) ( not ( = ?auto_17712 ?auto_17726 ) ) ( not ( = ?auto_17712 ?auto_17729 ) ) ( not ( = ?auto_17713 ?auto_17726 ) ) ( not ( = ?auto_17713 ?auto_17729 ) ) ( not ( = ?auto_17714 ?auto_17726 ) ) ( not ( = ?auto_17714 ?auto_17729 ) ) ( not ( = ?auto_17715 ?auto_17726 ) ) ( not ( = ?auto_17715 ?auto_17729 ) ) ( not ( = ?auto_17716 ?auto_17726 ) ) ( not ( = ?auto_17716 ?auto_17729 ) ) ( not ( = ?auto_17717 ?auto_17726 ) ) ( not ( = ?auto_17717 ?auto_17729 ) ) ( not ( = ?auto_17718 ?auto_17726 ) ) ( not ( = ?auto_17718 ?auto_17729 ) ) ( not ( = ?auto_17719 ?auto_17726 ) ) ( not ( = ?auto_17719 ?auto_17729 ) ) ( not ( = ?auto_17720 ?auto_17726 ) ) ( not ( = ?auto_17720 ?auto_17729 ) ) ( not ( = ?auto_17721 ?auto_17726 ) ) ( not ( = ?auto_17721 ?auto_17729 ) ) ( not ( = ?auto_17722 ?auto_17726 ) ) ( not ( = ?auto_17722 ?auto_17729 ) ) ( not ( = ?auto_17723 ?auto_17726 ) ) ( not ( = ?auto_17723 ?auto_17729 ) ) ( not ( = ?auto_17724 ?auto_17726 ) ) ( not ( = ?auto_17724 ?auto_17729 ) ) ( not ( = ?auto_17726 ?auto_17749 ) ) ( not ( = ?auto_17726 ?auto_17742 ) ) ( not ( = ?auto_17726 ?auto_17748 ) ) ( not ( = ?auto_17726 ?auto_17751 ) ) ( not ( = ?auto_17726 ?auto_17738 ) ) ( not ( = ?auto_17726 ?auto_17741 ) ) ( not ( = ?auto_17726 ?auto_17753 ) ) ( not ( = ?auto_17726 ?auto_17734 ) ) ( not ( = ?auto_17726 ?auto_17750 ) ) ( not ( = ?auto_17726 ?auto_17740 ) ) ( not ( = ?auto_17726 ?auto_17760 ) ) ( not ( = ?auto_17726 ?auto_17754 ) ) ( not ( = ?auto_17726 ?auto_17758 ) ) ( not ( = ?auto_17729 ?auto_17749 ) ) ( not ( = ?auto_17729 ?auto_17742 ) ) ( not ( = ?auto_17729 ?auto_17748 ) ) ( not ( = ?auto_17729 ?auto_17751 ) ) ( not ( = ?auto_17729 ?auto_17738 ) ) ( not ( = ?auto_17729 ?auto_17741 ) ) ( not ( = ?auto_17729 ?auto_17753 ) ) ( not ( = ?auto_17729 ?auto_17734 ) ) ( not ( = ?auto_17729 ?auto_17750 ) ) ( not ( = ?auto_17729 ?auto_17740 ) ) ( not ( = ?auto_17729 ?auto_17760 ) ) ( not ( = ?auto_17729 ?auto_17754 ) ) ( not ( = ?auto_17729 ?auto_17758 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_17712 ?auto_17713 ?auto_17714 ?auto_17715 ?auto_17716 ?auto_17717 ?auto_17718 ?auto_17719 ?auto_17720 ?auto_17721 ?auto_17722 ?auto_17723 ?auto_17724 ?auto_17725 )
      ( MAKE-1CRATE ?auto_17725 ?auto_17726 )
      ( MAKE-14CRATE-VERIFY ?auto_17712 ?auto_17713 ?auto_17714 ?auto_17715 ?auto_17716 ?auto_17717 ?auto_17718 ?auto_17719 ?auto_17720 ?auto_17721 ?auto_17722 ?auto_17723 ?auto_17724 ?auto_17725 ?auto_17726 ) )
  )

)

