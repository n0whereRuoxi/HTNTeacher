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
      ?auto_26190 - SURFACE
      ?auto_26191 - SURFACE
    )
    :vars
    (
      ?auto_26192 - HOIST
      ?auto_26193 - PLACE
      ?auto_26195 - PLACE
      ?auto_26196 - HOIST
      ?auto_26197 - SURFACE
      ?auto_26194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26192 ?auto_26193 ) ( SURFACE-AT ?auto_26190 ?auto_26193 ) ( CLEAR ?auto_26190 ) ( IS-CRATE ?auto_26191 ) ( AVAILABLE ?auto_26192 ) ( not ( = ?auto_26195 ?auto_26193 ) ) ( HOIST-AT ?auto_26196 ?auto_26195 ) ( AVAILABLE ?auto_26196 ) ( SURFACE-AT ?auto_26191 ?auto_26195 ) ( ON ?auto_26191 ?auto_26197 ) ( CLEAR ?auto_26191 ) ( TRUCK-AT ?auto_26194 ?auto_26193 ) ( not ( = ?auto_26190 ?auto_26191 ) ) ( not ( = ?auto_26190 ?auto_26197 ) ) ( not ( = ?auto_26191 ?auto_26197 ) ) ( not ( = ?auto_26192 ?auto_26196 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26194 ?auto_26193 ?auto_26195 )
      ( !LIFT ?auto_26196 ?auto_26191 ?auto_26197 ?auto_26195 )
      ( !LOAD ?auto_26196 ?auto_26191 ?auto_26194 ?auto_26195 )
      ( !DRIVE ?auto_26194 ?auto_26195 ?auto_26193 )
      ( !UNLOAD ?auto_26192 ?auto_26191 ?auto_26194 ?auto_26193 )
      ( !DROP ?auto_26192 ?auto_26191 ?auto_26190 ?auto_26193 )
      ( MAKE-1CRATE-VERIFY ?auto_26190 ?auto_26191 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26211 - SURFACE
      ?auto_26212 - SURFACE
      ?auto_26213 - SURFACE
    )
    :vars
    (
      ?auto_26215 - HOIST
      ?auto_26216 - PLACE
      ?auto_26218 - PLACE
      ?auto_26214 - HOIST
      ?auto_26219 - SURFACE
      ?auto_26221 - PLACE
      ?auto_26222 - HOIST
      ?auto_26220 - SURFACE
      ?auto_26217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26215 ?auto_26216 ) ( IS-CRATE ?auto_26213 ) ( not ( = ?auto_26218 ?auto_26216 ) ) ( HOIST-AT ?auto_26214 ?auto_26218 ) ( AVAILABLE ?auto_26214 ) ( SURFACE-AT ?auto_26213 ?auto_26218 ) ( ON ?auto_26213 ?auto_26219 ) ( CLEAR ?auto_26213 ) ( not ( = ?auto_26212 ?auto_26213 ) ) ( not ( = ?auto_26212 ?auto_26219 ) ) ( not ( = ?auto_26213 ?auto_26219 ) ) ( not ( = ?auto_26215 ?auto_26214 ) ) ( SURFACE-AT ?auto_26211 ?auto_26216 ) ( CLEAR ?auto_26211 ) ( IS-CRATE ?auto_26212 ) ( AVAILABLE ?auto_26215 ) ( not ( = ?auto_26221 ?auto_26216 ) ) ( HOIST-AT ?auto_26222 ?auto_26221 ) ( AVAILABLE ?auto_26222 ) ( SURFACE-AT ?auto_26212 ?auto_26221 ) ( ON ?auto_26212 ?auto_26220 ) ( CLEAR ?auto_26212 ) ( TRUCK-AT ?auto_26217 ?auto_26216 ) ( not ( = ?auto_26211 ?auto_26212 ) ) ( not ( = ?auto_26211 ?auto_26220 ) ) ( not ( = ?auto_26212 ?auto_26220 ) ) ( not ( = ?auto_26215 ?auto_26222 ) ) ( not ( = ?auto_26211 ?auto_26213 ) ) ( not ( = ?auto_26211 ?auto_26219 ) ) ( not ( = ?auto_26213 ?auto_26220 ) ) ( not ( = ?auto_26218 ?auto_26221 ) ) ( not ( = ?auto_26214 ?auto_26222 ) ) ( not ( = ?auto_26219 ?auto_26220 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26211 ?auto_26212 )
      ( MAKE-1CRATE ?auto_26212 ?auto_26213 )
      ( MAKE-2CRATE-VERIFY ?auto_26211 ?auto_26212 ?auto_26213 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26237 - SURFACE
      ?auto_26238 - SURFACE
      ?auto_26239 - SURFACE
      ?auto_26240 - SURFACE
    )
    :vars
    (
      ?auto_26245 - HOIST
      ?auto_26243 - PLACE
      ?auto_26241 - PLACE
      ?auto_26244 - HOIST
      ?auto_26242 - SURFACE
      ?auto_26248 - PLACE
      ?auto_26251 - HOIST
      ?auto_26249 - SURFACE
      ?auto_26250 - PLACE
      ?auto_26252 - HOIST
      ?auto_26247 - SURFACE
      ?auto_26246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26245 ?auto_26243 ) ( IS-CRATE ?auto_26240 ) ( not ( = ?auto_26241 ?auto_26243 ) ) ( HOIST-AT ?auto_26244 ?auto_26241 ) ( AVAILABLE ?auto_26244 ) ( SURFACE-AT ?auto_26240 ?auto_26241 ) ( ON ?auto_26240 ?auto_26242 ) ( CLEAR ?auto_26240 ) ( not ( = ?auto_26239 ?auto_26240 ) ) ( not ( = ?auto_26239 ?auto_26242 ) ) ( not ( = ?auto_26240 ?auto_26242 ) ) ( not ( = ?auto_26245 ?auto_26244 ) ) ( IS-CRATE ?auto_26239 ) ( not ( = ?auto_26248 ?auto_26243 ) ) ( HOIST-AT ?auto_26251 ?auto_26248 ) ( AVAILABLE ?auto_26251 ) ( SURFACE-AT ?auto_26239 ?auto_26248 ) ( ON ?auto_26239 ?auto_26249 ) ( CLEAR ?auto_26239 ) ( not ( = ?auto_26238 ?auto_26239 ) ) ( not ( = ?auto_26238 ?auto_26249 ) ) ( not ( = ?auto_26239 ?auto_26249 ) ) ( not ( = ?auto_26245 ?auto_26251 ) ) ( SURFACE-AT ?auto_26237 ?auto_26243 ) ( CLEAR ?auto_26237 ) ( IS-CRATE ?auto_26238 ) ( AVAILABLE ?auto_26245 ) ( not ( = ?auto_26250 ?auto_26243 ) ) ( HOIST-AT ?auto_26252 ?auto_26250 ) ( AVAILABLE ?auto_26252 ) ( SURFACE-AT ?auto_26238 ?auto_26250 ) ( ON ?auto_26238 ?auto_26247 ) ( CLEAR ?auto_26238 ) ( TRUCK-AT ?auto_26246 ?auto_26243 ) ( not ( = ?auto_26237 ?auto_26238 ) ) ( not ( = ?auto_26237 ?auto_26247 ) ) ( not ( = ?auto_26238 ?auto_26247 ) ) ( not ( = ?auto_26245 ?auto_26252 ) ) ( not ( = ?auto_26237 ?auto_26239 ) ) ( not ( = ?auto_26237 ?auto_26249 ) ) ( not ( = ?auto_26239 ?auto_26247 ) ) ( not ( = ?auto_26248 ?auto_26250 ) ) ( not ( = ?auto_26251 ?auto_26252 ) ) ( not ( = ?auto_26249 ?auto_26247 ) ) ( not ( = ?auto_26237 ?auto_26240 ) ) ( not ( = ?auto_26237 ?auto_26242 ) ) ( not ( = ?auto_26238 ?auto_26240 ) ) ( not ( = ?auto_26238 ?auto_26242 ) ) ( not ( = ?auto_26240 ?auto_26249 ) ) ( not ( = ?auto_26240 ?auto_26247 ) ) ( not ( = ?auto_26241 ?auto_26248 ) ) ( not ( = ?auto_26241 ?auto_26250 ) ) ( not ( = ?auto_26244 ?auto_26251 ) ) ( not ( = ?auto_26244 ?auto_26252 ) ) ( not ( = ?auto_26242 ?auto_26249 ) ) ( not ( = ?auto_26242 ?auto_26247 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26237 ?auto_26238 ?auto_26239 )
      ( MAKE-1CRATE ?auto_26239 ?auto_26240 )
      ( MAKE-3CRATE-VERIFY ?auto_26237 ?auto_26238 ?auto_26239 ?auto_26240 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26268 - SURFACE
      ?auto_26269 - SURFACE
      ?auto_26270 - SURFACE
      ?auto_26271 - SURFACE
      ?auto_26272 - SURFACE
    )
    :vars
    (
      ?auto_26278 - HOIST
      ?auto_26275 - PLACE
      ?auto_26277 - PLACE
      ?auto_26274 - HOIST
      ?auto_26273 - SURFACE
      ?auto_26280 - PLACE
      ?auto_26283 - HOIST
      ?auto_26284 - SURFACE
      ?auto_26281 - PLACE
      ?auto_26285 - HOIST
      ?auto_26282 - SURFACE
      ?auto_26286 - PLACE
      ?auto_26279 - HOIST
      ?auto_26287 - SURFACE
      ?auto_26276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26278 ?auto_26275 ) ( IS-CRATE ?auto_26272 ) ( not ( = ?auto_26277 ?auto_26275 ) ) ( HOIST-AT ?auto_26274 ?auto_26277 ) ( AVAILABLE ?auto_26274 ) ( SURFACE-AT ?auto_26272 ?auto_26277 ) ( ON ?auto_26272 ?auto_26273 ) ( CLEAR ?auto_26272 ) ( not ( = ?auto_26271 ?auto_26272 ) ) ( not ( = ?auto_26271 ?auto_26273 ) ) ( not ( = ?auto_26272 ?auto_26273 ) ) ( not ( = ?auto_26278 ?auto_26274 ) ) ( IS-CRATE ?auto_26271 ) ( not ( = ?auto_26280 ?auto_26275 ) ) ( HOIST-AT ?auto_26283 ?auto_26280 ) ( AVAILABLE ?auto_26283 ) ( SURFACE-AT ?auto_26271 ?auto_26280 ) ( ON ?auto_26271 ?auto_26284 ) ( CLEAR ?auto_26271 ) ( not ( = ?auto_26270 ?auto_26271 ) ) ( not ( = ?auto_26270 ?auto_26284 ) ) ( not ( = ?auto_26271 ?auto_26284 ) ) ( not ( = ?auto_26278 ?auto_26283 ) ) ( IS-CRATE ?auto_26270 ) ( not ( = ?auto_26281 ?auto_26275 ) ) ( HOIST-AT ?auto_26285 ?auto_26281 ) ( AVAILABLE ?auto_26285 ) ( SURFACE-AT ?auto_26270 ?auto_26281 ) ( ON ?auto_26270 ?auto_26282 ) ( CLEAR ?auto_26270 ) ( not ( = ?auto_26269 ?auto_26270 ) ) ( not ( = ?auto_26269 ?auto_26282 ) ) ( not ( = ?auto_26270 ?auto_26282 ) ) ( not ( = ?auto_26278 ?auto_26285 ) ) ( SURFACE-AT ?auto_26268 ?auto_26275 ) ( CLEAR ?auto_26268 ) ( IS-CRATE ?auto_26269 ) ( AVAILABLE ?auto_26278 ) ( not ( = ?auto_26286 ?auto_26275 ) ) ( HOIST-AT ?auto_26279 ?auto_26286 ) ( AVAILABLE ?auto_26279 ) ( SURFACE-AT ?auto_26269 ?auto_26286 ) ( ON ?auto_26269 ?auto_26287 ) ( CLEAR ?auto_26269 ) ( TRUCK-AT ?auto_26276 ?auto_26275 ) ( not ( = ?auto_26268 ?auto_26269 ) ) ( not ( = ?auto_26268 ?auto_26287 ) ) ( not ( = ?auto_26269 ?auto_26287 ) ) ( not ( = ?auto_26278 ?auto_26279 ) ) ( not ( = ?auto_26268 ?auto_26270 ) ) ( not ( = ?auto_26268 ?auto_26282 ) ) ( not ( = ?auto_26270 ?auto_26287 ) ) ( not ( = ?auto_26281 ?auto_26286 ) ) ( not ( = ?auto_26285 ?auto_26279 ) ) ( not ( = ?auto_26282 ?auto_26287 ) ) ( not ( = ?auto_26268 ?auto_26271 ) ) ( not ( = ?auto_26268 ?auto_26284 ) ) ( not ( = ?auto_26269 ?auto_26271 ) ) ( not ( = ?auto_26269 ?auto_26284 ) ) ( not ( = ?auto_26271 ?auto_26282 ) ) ( not ( = ?auto_26271 ?auto_26287 ) ) ( not ( = ?auto_26280 ?auto_26281 ) ) ( not ( = ?auto_26280 ?auto_26286 ) ) ( not ( = ?auto_26283 ?auto_26285 ) ) ( not ( = ?auto_26283 ?auto_26279 ) ) ( not ( = ?auto_26284 ?auto_26282 ) ) ( not ( = ?auto_26284 ?auto_26287 ) ) ( not ( = ?auto_26268 ?auto_26272 ) ) ( not ( = ?auto_26268 ?auto_26273 ) ) ( not ( = ?auto_26269 ?auto_26272 ) ) ( not ( = ?auto_26269 ?auto_26273 ) ) ( not ( = ?auto_26270 ?auto_26272 ) ) ( not ( = ?auto_26270 ?auto_26273 ) ) ( not ( = ?auto_26272 ?auto_26284 ) ) ( not ( = ?auto_26272 ?auto_26282 ) ) ( not ( = ?auto_26272 ?auto_26287 ) ) ( not ( = ?auto_26277 ?auto_26280 ) ) ( not ( = ?auto_26277 ?auto_26281 ) ) ( not ( = ?auto_26277 ?auto_26286 ) ) ( not ( = ?auto_26274 ?auto_26283 ) ) ( not ( = ?auto_26274 ?auto_26285 ) ) ( not ( = ?auto_26274 ?auto_26279 ) ) ( not ( = ?auto_26273 ?auto_26284 ) ) ( not ( = ?auto_26273 ?auto_26282 ) ) ( not ( = ?auto_26273 ?auto_26287 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_26268 ?auto_26269 ?auto_26270 ?auto_26271 )
      ( MAKE-1CRATE ?auto_26271 ?auto_26272 )
      ( MAKE-4CRATE-VERIFY ?auto_26268 ?auto_26269 ?auto_26270 ?auto_26271 ?auto_26272 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26304 - SURFACE
      ?auto_26305 - SURFACE
      ?auto_26306 - SURFACE
      ?auto_26307 - SURFACE
      ?auto_26308 - SURFACE
      ?auto_26309 - SURFACE
    )
    :vars
    (
      ?auto_26311 - HOIST
      ?auto_26314 - PLACE
      ?auto_26313 - PLACE
      ?auto_26310 - HOIST
      ?auto_26312 - SURFACE
      ?auto_26319 - PLACE
      ?auto_26318 - HOIST
      ?auto_26317 - SURFACE
      ?auto_26326 - PLACE
      ?auto_26323 - HOIST
      ?auto_26322 - SURFACE
      ?auto_26327 - PLACE
      ?auto_26321 - HOIST
      ?auto_26325 - SURFACE
      ?auto_26320 - PLACE
      ?auto_26324 - HOIST
      ?auto_26316 - SURFACE
      ?auto_26315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26311 ?auto_26314 ) ( IS-CRATE ?auto_26309 ) ( not ( = ?auto_26313 ?auto_26314 ) ) ( HOIST-AT ?auto_26310 ?auto_26313 ) ( AVAILABLE ?auto_26310 ) ( SURFACE-AT ?auto_26309 ?auto_26313 ) ( ON ?auto_26309 ?auto_26312 ) ( CLEAR ?auto_26309 ) ( not ( = ?auto_26308 ?auto_26309 ) ) ( not ( = ?auto_26308 ?auto_26312 ) ) ( not ( = ?auto_26309 ?auto_26312 ) ) ( not ( = ?auto_26311 ?auto_26310 ) ) ( IS-CRATE ?auto_26308 ) ( not ( = ?auto_26319 ?auto_26314 ) ) ( HOIST-AT ?auto_26318 ?auto_26319 ) ( AVAILABLE ?auto_26318 ) ( SURFACE-AT ?auto_26308 ?auto_26319 ) ( ON ?auto_26308 ?auto_26317 ) ( CLEAR ?auto_26308 ) ( not ( = ?auto_26307 ?auto_26308 ) ) ( not ( = ?auto_26307 ?auto_26317 ) ) ( not ( = ?auto_26308 ?auto_26317 ) ) ( not ( = ?auto_26311 ?auto_26318 ) ) ( IS-CRATE ?auto_26307 ) ( not ( = ?auto_26326 ?auto_26314 ) ) ( HOIST-AT ?auto_26323 ?auto_26326 ) ( AVAILABLE ?auto_26323 ) ( SURFACE-AT ?auto_26307 ?auto_26326 ) ( ON ?auto_26307 ?auto_26322 ) ( CLEAR ?auto_26307 ) ( not ( = ?auto_26306 ?auto_26307 ) ) ( not ( = ?auto_26306 ?auto_26322 ) ) ( not ( = ?auto_26307 ?auto_26322 ) ) ( not ( = ?auto_26311 ?auto_26323 ) ) ( IS-CRATE ?auto_26306 ) ( not ( = ?auto_26327 ?auto_26314 ) ) ( HOIST-AT ?auto_26321 ?auto_26327 ) ( AVAILABLE ?auto_26321 ) ( SURFACE-AT ?auto_26306 ?auto_26327 ) ( ON ?auto_26306 ?auto_26325 ) ( CLEAR ?auto_26306 ) ( not ( = ?auto_26305 ?auto_26306 ) ) ( not ( = ?auto_26305 ?auto_26325 ) ) ( not ( = ?auto_26306 ?auto_26325 ) ) ( not ( = ?auto_26311 ?auto_26321 ) ) ( SURFACE-AT ?auto_26304 ?auto_26314 ) ( CLEAR ?auto_26304 ) ( IS-CRATE ?auto_26305 ) ( AVAILABLE ?auto_26311 ) ( not ( = ?auto_26320 ?auto_26314 ) ) ( HOIST-AT ?auto_26324 ?auto_26320 ) ( AVAILABLE ?auto_26324 ) ( SURFACE-AT ?auto_26305 ?auto_26320 ) ( ON ?auto_26305 ?auto_26316 ) ( CLEAR ?auto_26305 ) ( TRUCK-AT ?auto_26315 ?auto_26314 ) ( not ( = ?auto_26304 ?auto_26305 ) ) ( not ( = ?auto_26304 ?auto_26316 ) ) ( not ( = ?auto_26305 ?auto_26316 ) ) ( not ( = ?auto_26311 ?auto_26324 ) ) ( not ( = ?auto_26304 ?auto_26306 ) ) ( not ( = ?auto_26304 ?auto_26325 ) ) ( not ( = ?auto_26306 ?auto_26316 ) ) ( not ( = ?auto_26327 ?auto_26320 ) ) ( not ( = ?auto_26321 ?auto_26324 ) ) ( not ( = ?auto_26325 ?auto_26316 ) ) ( not ( = ?auto_26304 ?auto_26307 ) ) ( not ( = ?auto_26304 ?auto_26322 ) ) ( not ( = ?auto_26305 ?auto_26307 ) ) ( not ( = ?auto_26305 ?auto_26322 ) ) ( not ( = ?auto_26307 ?auto_26325 ) ) ( not ( = ?auto_26307 ?auto_26316 ) ) ( not ( = ?auto_26326 ?auto_26327 ) ) ( not ( = ?auto_26326 ?auto_26320 ) ) ( not ( = ?auto_26323 ?auto_26321 ) ) ( not ( = ?auto_26323 ?auto_26324 ) ) ( not ( = ?auto_26322 ?auto_26325 ) ) ( not ( = ?auto_26322 ?auto_26316 ) ) ( not ( = ?auto_26304 ?auto_26308 ) ) ( not ( = ?auto_26304 ?auto_26317 ) ) ( not ( = ?auto_26305 ?auto_26308 ) ) ( not ( = ?auto_26305 ?auto_26317 ) ) ( not ( = ?auto_26306 ?auto_26308 ) ) ( not ( = ?auto_26306 ?auto_26317 ) ) ( not ( = ?auto_26308 ?auto_26322 ) ) ( not ( = ?auto_26308 ?auto_26325 ) ) ( not ( = ?auto_26308 ?auto_26316 ) ) ( not ( = ?auto_26319 ?auto_26326 ) ) ( not ( = ?auto_26319 ?auto_26327 ) ) ( not ( = ?auto_26319 ?auto_26320 ) ) ( not ( = ?auto_26318 ?auto_26323 ) ) ( not ( = ?auto_26318 ?auto_26321 ) ) ( not ( = ?auto_26318 ?auto_26324 ) ) ( not ( = ?auto_26317 ?auto_26322 ) ) ( not ( = ?auto_26317 ?auto_26325 ) ) ( not ( = ?auto_26317 ?auto_26316 ) ) ( not ( = ?auto_26304 ?auto_26309 ) ) ( not ( = ?auto_26304 ?auto_26312 ) ) ( not ( = ?auto_26305 ?auto_26309 ) ) ( not ( = ?auto_26305 ?auto_26312 ) ) ( not ( = ?auto_26306 ?auto_26309 ) ) ( not ( = ?auto_26306 ?auto_26312 ) ) ( not ( = ?auto_26307 ?auto_26309 ) ) ( not ( = ?auto_26307 ?auto_26312 ) ) ( not ( = ?auto_26309 ?auto_26317 ) ) ( not ( = ?auto_26309 ?auto_26322 ) ) ( not ( = ?auto_26309 ?auto_26325 ) ) ( not ( = ?auto_26309 ?auto_26316 ) ) ( not ( = ?auto_26313 ?auto_26319 ) ) ( not ( = ?auto_26313 ?auto_26326 ) ) ( not ( = ?auto_26313 ?auto_26327 ) ) ( not ( = ?auto_26313 ?auto_26320 ) ) ( not ( = ?auto_26310 ?auto_26318 ) ) ( not ( = ?auto_26310 ?auto_26323 ) ) ( not ( = ?auto_26310 ?auto_26321 ) ) ( not ( = ?auto_26310 ?auto_26324 ) ) ( not ( = ?auto_26312 ?auto_26317 ) ) ( not ( = ?auto_26312 ?auto_26322 ) ) ( not ( = ?auto_26312 ?auto_26325 ) ) ( not ( = ?auto_26312 ?auto_26316 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_26304 ?auto_26305 ?auto_26306 ?auto_26307 ?auto_26308 )
      ( MAKE-1CRATE ?auto_26308 ?auto_26309 )
      ( MAKE-5CRATE-VERIFY ?auto_26304 ?auto_26305 ?auto_26306 ?auto_26307 ?auto_26308 ?auto_26309 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_26345 - SURFACE
      ?auto_26346 - SURFACE
      ?auto_26347 - SURFACE
      ?auto_26348 - SURFACE
      ?auto_26349 - SURFACE
      ?auto_26350 - SURFACE
      ?auto_26351 - SURFACE
    )
    :vars
    (
      ?auto_26355 - HOIST
      ?auto_26353 - PLACE
      ?auto_26354 - PLACE
      ?auto_26357 - HOIST
      ?auto_26352 - SURFACE
      ?auto_26367 - PLACE
      ?auto_26360 - HOIST
      ?auto_26362 - SURFACE
      ?auto_26364 - PLACE
      ?auto_26361 - HOIST
      ?auto_26372 - SURFACE
      ?auto_26366 - PLACE
      ?auto_26368 - HOIST
      ?auto_26369 - SURFACE
      ?auto_26359 - PLACE
      ?auto_26370 - HOIST
      ?auto_26358 - SURFACE
      ?auto_26371 - PLACE
      ?auto_26363 - HOIST
      ?auto_26365 - SURFACE
      ?auto_26356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26355 ?auto_26353 ) ( IS-CRATE ?auto_26351 ) ( not ( = ?auto_26354 ?auto_26353 ) ) ( HOIST-AT ?auto_26357 ?auto_26354 ) ( AVAILABLE ?auto_26357 ) ( SURFACE-AT ?auto_26351 ?auto_26354 ) ( ON ?auto_26351 ?auto_26352 ) ( CLEAR ?auto_26351 ) ( not ( = ?auto_26350 ?auto_26351 ) ) ( not ( = ?auto_26350 ?auto_26352 ) ) ( not ( = ?auto_26351 ?auto_26352 ) ) ( not ( = ?auto_26355 ?auto_26357 ) ) ( IS-CRATE ?auto_26350 ) ( not ( = ?auto_26367 ?auto_26353 ) ) ( HOIST-AT ?auto_26360 ?auto_26367 ) ( AVAILABLE ?auto_26360 ) ( SURFACE-AT ?auto_26350 ?auto_26367 ) ( ON ?auto_26350 ?auto_26362 ) ( CLEAR ?auto_26350 ) ( not ( = ?auto_26349 ?auto_26350 ) ) ( not ( = ?auto_26349 ?auto_26362 ) ) ( not ( = ?auto_26350 ?auto_26362 ) ) ( not ( = ?auto_26355 ?auto_26360 ) ) ( IS-CRATE ?auto_26349 ) ( not ( = ?auto_26364 ?auto_26353 ) ) ( HOIST-AT ?auto_26361 ?auto_26364 ) ( AVAILABLE ?auto_26361 ) ( SURFACE-AT ?auto_26349 ?auto_26364 ) ( ON ?auto_26349 ?auto_26372 ) ( CLEAR ?auto_26349 ) ( not ( = ?auto_26348 ?auto_26349 ) ) ( not ( = ?auto_26348 ?auto_26372 ) ) ( not ( = ?auto_26349 ?auto_26372 ) ) ( not ( = ?auto_26355 ?auto_26361 ) ) ( IS-CRATE ?auto_26348 ) ( not ( = ?auto_26366 ?auto_26353 ) ) ( HOIST-AT ?auto_26368 ?auto_26366 ) ( AVAILABLE ?auto_26368 ) ( SURFACE-AT ?auto_26348 ?auto_26366 ) ( ON ?auto_26348 ?auto_26369 ) ( CLEAR ?auto_26348 ) ( not ( = ?auto_26347 ?auto_26348 ) ) ( not ( = ?auto_26347 ?auto_26369 ) ) ( not ( = ?auto_26348 ?auto_26369 ) ) ( not ( = ?auto_26355 ?auto_26368 ) ) ( IS-CRATE ?auto_26347 ) ( not ( = ?auto_26359 ?auto_26353 ) ) ( HOIST-AT ?auto_26370 ?auto_26359 ) ( AVAILABLE ?auto_26370 ) ( SURFACE-AT ?auto_26347 ?auto_26359 ) ( ON ?auto_26347 ?auto_26358 ) ( CLEAR ?auto_26347 ) ( not ( = ?auto_26346 ?auto_26347 ) ) ( not ( = ?auto_26346 ?auto_26358 ) ) ( not ( = ?auto_26347 ?auto_26358 ) ) ( not ( = ?auto_26355 ?auto_26370 ) ) ( SURFACE-AT ?auto_26345 ?auto_26353 ) ( CLEAR ?auto_26345 ) ( IS-CRATE ?auto_26346 ) ( AVAILABLE ?auto_26355 ) ( not ( = ?auto_26371 ?auto_26353 ) ) ( HOIST-AT ?auto_26363 ?auto_26371 ) ( AVAILABLE ?auto_26363 ) ( SURFACE-AT ?auto_26346 ?auto_26371 ) ( ON ?auto_26346 ?auto_26365 ) ( CLEAR ?auto_26346 ) ( TRUCK-AT ?auto_26356 ?auto_26353 ) ( not ( = ?auto_26345 ?auto_26346 ) ) ( not ( = ?auto_26345 ?auto_26365 ) ) ( not ( = ?auto_26346 ?auto_26365 ) ) ( not ( = ?auto_26355 ?auto_26363 ) ) ( not ( = ?auto_26345 ?auto_26347 ) ) ( not ( = ?auto_26345 ?auto_26358 ) ) ( not ( = ?auto_26347 ?auto_26365 ) ) ( not ( = ?auto_26359 ?auto_26371 ) ) ( not ( = ?auto_26370 ?auto_26363 ) ) ( not ( = ?auto_26358 ?auto_26365 ) ) ( not ( = ?auto_26345 ?auto_26348 ) ) ( not ( = ?auto_26345 ?auto_26369 ) ) ( not ( = ?auto_26346 ?auto_26348 ) ) ( not ( = ?auto_26346 ?auto_26369 ) ) ( not ( = ?auto_26348 ?auto_26358 ) ) ( not ( = ?auto_26348 ?auto_26365 ) ) ( not ( = ?auto_26366 ?auto_26359 ) ) ( not ( = ?auto_26366 ?auto_26371 ) ) ( not ( = ?auto_26368 ?auto_26370 ) ) ( not ( = ?auto_26368 ?auto_26363 ) ) ( not ( = ?auto_26369 ?auto_26358 ) ) ( not ( = ?auto_26369 ?auto_26365 ) ) ( not ( = ?auto_26345 ?auto_26349 ) ) ( not ( = ?auto_26345 ?auto_26372 ) ) ( not ( = ?auto_26346 ?auto_26349 ) ) ( not ( = ?auto_26346 ?auto_26372 ) ) ( not ( = ?auto_26347 ?auto_26349 ) ) ( not ( = ?auto_26347 ?auto_26372 ) ) ( not ( = ?auto_26349 ?auto_26369 ) ) ( not ( = ?auto_26349 ?auto_26358 ) ) ( not ( = ?auto_26349 ?auto_26365 ) ) ( not ( = ?auto_26364 ?auto_26366 ) ) ( not ( = ?auto_26364 ?auto_26359 ) ) ( not ( = ?auto_26364 ?auto_26371 ) ) ( not ( = ?auto_26361 ?auto_26368 ) ) ( not ( = ?auto_26361 ?auto_26370 ) ) ( not ( = ?auto_26361 ?auto_26363 ) ) ( not ( = ?auto_26372 ?auto_26369 ) ) ( not ( = ?auto_26372 ?auto_26358 ) ) ( not ( = ?auto_26372 ?auto_26365 ) ) ( not ( = ?auto_26345 ?auto_26350 ) ) ( not ( = ?auto_26345 ?auto_26362 ) ) ( not ( = ?auto_26346 ?auto_26350 ) ) ( not ( = ?auto_26346 ?auto_26362 ) ) ( not ( = ?auto_26347 ?auto_26350 ) ) ( not ( = ?auto_26347 ?auto_26362 ) ) ( not ( = ?auto_26348 ?auto_26350 ) ) ( not ( = ?auto_26348 ?auto_26362 ) ) ( not ( = ?auto_26350 ?auto_26372 ) ) ( not ( = ?auto_26350 ?auto_26369 ) ) ( not ( = ?auto_26350 ?auto_26358 ) ) ( not ( = ?auto_26350 ?auto_26365 ) ) ( not ( = ?auto_26367 ?auto_26364 ) ) ( not ( = ?auto_26367 ?auto_26366 ) ) ( not ( = ?auto_26367 ?auto_26359 ) ) ( not ( = ?auto_26367 ?auto_26371 ) ) ( not ( = ?auto_26360 ?auto_26361 ) ) ( not ( = ?auto_26360 ?auto_26368 ) ) ( not ( = ?auto_26360 ?auto_26370 ) ) ( not ( = ?auto_26360 ?auto_26363 ) ) ( not ( = ?auto_26362 ?auto_26372 ) ) ( not ( = ?auto_26362 ?auto_26369 ) ) ( not ( = ?auto_26362 ?auto_26358 ) ) ( not ( = ?auto_26362 ?auto_26365 ) ) ( not ( = ?auto_26345 ?auto_26351 ) ) ( not ( = ?auto_26345 ?auto_26352 ) ) ( not ( = ?auto_26346 ?auto_26351 ) ) ( not ( = ?auto_26346 ?auto_26352 ) ) ( not ( = ?auto_26347 ?auto_26351 ) ) ( not ( = ?auto_26347 ?auto_26352 ) ) ( not ( = ?auto_26348 ?auto_26351 ) ) ( not ( = ?auto_26348 ?auto_26352 ) ) ( not ( = ?auto_26349 ?auto_26351 ) ) ( not ( = ?auto_26349 ?auto_26352 ) ) ( not ( = ?auto_26351 ?auto_26362 ) ) ( not ( = ?auto_26351 ?auto_26372 ) ) ( not ( = ?auto_26351 ?auto_26369 ) ) ( not ( = ?auto_26351 ?auto_26358 ) ) ( not ( = ?auto_26351 ?auto_26365 ) ) ( not ( = ?auto_26354 ?auto_26367 ) ) ( not ( = ?auto_26354 ?auto_26364 ) ) ( not ( = ?auto_26354 ?auto_26366 ) ) ( not ( = ?auto_26354 ?auto_26359 ) ) ( not ( = ?auto_26354 ?auto_26371 ) ) ( not ( = ?auto_26357 ?auto_26360 ) ) ( not ( = ?auto_26357 ?auto_26361 ) ) ( not ( = ?auto_26357 ?auto_26368 ) ) ( not ( = ?auto_26357 ?auto_26370 ) ) ( not ( = ?auto_26357 ?auto_26363 ) ) ( not ( = ?auto_26352 ?auto_26362 ) ) ( not ( = ?auto_26352 ?auto_26372 ) ) ( not ( = ?auto_26352 ?auto_26369 ) ) ( not ( = ?auto_26352 ?auto_26358 ) ) ( not ( = ?auto_26352 ?auto_26365 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_26345 ?auto_26346 ?auto_26347 ?auto_26348 ?auto_26349 ?auto_26350 )
      ( MAKE-1CRATE ?auto_26350 ?auto_26351 )
      ( MAKE-6CRATE-VERIFY ?auto_26345 ?auto_26346 ?auto_26347 ?auto_26348 ?auto_26349 ?auto_26350 ?auto_26351 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_26391 - SURFACE
      ?auto_26392 - SURFACE
      ?auto_26393 - SURFACE
      ?auto_26394 - SURFACE
      ?auto_26395 - SURFACE
      ?auto_26396 - SURFACE
      ?auto_26397 - SURFACE
      ?auto_26398 - SURFACE
    )
    :vars
    (
      ?auto_26401 - HOIST
      ?auto_26399 - PLACE
      ?auto_26404 - PLACE
      ?auto_26402 - HOIST
      ?auto_26403 - SURFACE
      ?auto_26422 - PLACE
      ?auto_26413 - HOIST
      ?auto_26405 - SURFACE
      ?auto_26417 - PLACE
      ?auto_26407 - HOIST
      ?auto_26421 - SURFACE
      ?auto_26412 - PLACE
      ?auto_26406 - HOIST
      ?auto_26408 - SURFACE
      ?auto_26410 - PLACE
      ?auto_26416 - HOIST
      ?auto_26418 - SURFACE
      ?auto_26414 - PLACE
      ?auto_26419 - HOIST
      ?auto_26409 - SURFACE
      ?auto_26411 - PLACE
      ?auto_26420 - HOIST
      ?auto_26415 - SURFACE
      ?auto_26400 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26401 ?auto_26399 ) ( IS-CRATE ?auto_26398 ) ( not ( = ?auto_26404 ?auto_26399 ) ) ( HOIST-AT ?auto_26402 ?auto_26404 ) ( AVAILABLE ?auto_26402 ) ( SURFACE-AT ?auto_26398 ?auto_26404 ) ( ON ?auto_26398 ?auto_26403 ) ( CLEAR ?auto_26398 ) ( not ( = ?auto_26397 ?auto_26398 ) ) ( not ( = ?auto_26397 ?auto_26403 ) ) ( not ( = ?auto_26398 ?auto_26403 ) ) ( not ( = ?auto_26401 ?auto_26402 ) ) ( IS-CRATE ?auto_26397 ) ( not ( = ?auto_26422 ?auto_26399 ) ) ( HOIST-AT ?auto_26413 ?auto_26422 ) ( AVAILABLE ?auto_26413 ) ( SURFACE-AT ?auto_26397 ?auto_26422 ) ( ON ?auto_26397 ?auto_26405 ) ( CLEAR ?auto_26397 ) ( not ( = ?auto_26396 ?auto_26397 ) ) ( not ( = ?auto_26396 ?auto_26405 ) ) ( not ( = ?auto_26397 ?auto_26405 ) ) ( not ( = ?auto_26401 ?auto_26413 ) ) ( IS-CRATE ?auto_26396 ) ( not ( = ?auto_26417 ?auto_26399 ) ) ( HOIST-AT ?auto_26407 ?auto_26417 ) ( AVAILABLE ?auto_26407 ) ( SURFACE-AT ?auto_26396 ?auto_26417 ) ( ON ?auto_26396 ?auto_26421 ) ( CLEAR ?auto_26396 ) ( not ( = ?auto_26395 ?auto_26396 ) ) ( not ( = ?auto_26395 ?auto_26421 ) ) ( not ( = ?auto_26396 ?auto_26421 ) ) ( not ( = ?auto_26401 ?auto_26407 ) ) ( IS-CRATE ?auto_26395 ) ( not ( = ?auto_26412 ?auto_26399 ) ) ( HOIST-AT ?auto_26406 ?auto_26412 ) ( AVAILABLE ?auto_26406 ) ( SURFACE-AT ?auto_26395 ?auto_26412 ) ( ON ?auto_26395 ?auto_26408 ) ( CLEAR ?auto_26395 ) ( not ( = ?auto_26394 ?auto_26395 ) ) ( not ( = ?auto_26394 ?auto_26408 ) ) ( not ( = ?auto_26395 ?auto_26408 ) ) ( not ( = ?auto_26401 ?auto_26406 ) ) ( IS-CRATE ?auto_26394 ) ( not ( = ?auto_26410 ?auto_26399 ) ) ( HOIST-AT ?auto_26416 ?auto_26410 ) ( AVAILABLE ?auto_26416 ) ( SURFACE-AT ?auto_26394 ?auto_26410 ) ( ON ?auto_26394 ?auto_26418 ) ( CLEAR ?auto_26394 ) ( not ( = ?auto_26393 ?auto_26394 ) ) ( not ( = ?auto_26393 ?auto_26418 ) ) ( not ( = ?auto_26394 ?auto_26418 ) ) ( not ( = ?auto_26401 ?auto_26416 ) ) ( IS-CRATE ?auto_26393 ) ( not ( = ?auto_26414 ?auto_26399 ) ) ( HOIST-AT ?auto_26419 ?auto_26414 ) ( AVAILABLE ?auto_26419 ) ( SURFACE-AT ?auto_26393 ?auto_26414 ) ( ON ?auto_26393 ?auto_26409 ) ( CLEAR ?auto_26393 ) ( not ( = ?auto_26392 ?auto_26393 ) ) ( not ( = ?auto_26392 ?auto_26409 ) ) ( not ( = ?auto_26393 ?auto_26409 ) ) ( not ( = ?auto_26401 ?auto_26419 ) ) ( SURFACE-AT ?auto_26391 ?auto_26399 ) ( CLEAR ?auto_26391 ) ( IS-CRATE ?auto_26392 ) ( AVAILABLE ?auto_26401 ) ( not ( = ?auto_26411 ?auto_26399 ) ) ( HOIST-AT ?auto_26420 ?auto_26411 ) ( AVAILABLE ?auto_26420 ) ( SURFACE-AT ?auto_26392 ?auto_26411 ) ( ON ?auto_26392 ?auto_26415 ) ( CLEAR ?auto_26392 ) ( TRUCK-AT ?auto_26400 ?auto_26399 ) ( not ( = ?auto_26391 ?auto_26392 ) ) ( not ( = ?auto_26391 ?auto_26415 ) ) ( not ( = ?auto_26392 ?auto_26415 ) ) ( not ( = ?auto_26401 ?auto_26420 ) ) ( not ( = ?auto_26391 ?auto_26393 ) ) ( not ( = ?auto_26391 ?auto_26409 ) ) ( not ( = ?auto_26393 ?auto_26415 ) ) ( not ( = ?auto_26414 ?auto_26411 ) ) ( not ( = ?auto_26419 ?auto_26420 ) ) ( not ( = ?auto_26409 ?auto_26415 ) ) ( not ( = ?auto_26391 ?auto_26394 ) ) ( not ( = ?auto_26391 ?auto_26418 ) ) ( not ( = ?auto_26392 ?auto_26394 ) ) ( not ( = ?auto_26392 ?auto_26418 ) ) ( not ( = ?auto_26394 ?auto_26409 ) ) ( not ( = ?auto_26394 ?auto_26415 ) ) ( not ( = ?auto_26410 ?auto_26414 ) ) ( not ( = ?auto_26410 ?auto_26411 ) ) ( not ( = ?auto_26416 ?auto_26419 ) ) ( not ( = ?auto_26416 ?auto_26420 ) ) ( not ( = ?auto_26418 ?auto_26409 ) ) ( not ( = ?auto_26418 ?auto_26415 ) ) ( not ( = ?auto_26391 ?auto_26395 ) ) ( not ( = ?auto_26391 ?auto_26408 ) ) ( not ( = ?auto_26392 ?auto_26395 ) ) ( not ( = ?auto_26392 ?auto_26408 ) ) ( not ( = ?auto_26393 ?auto_26395 ) ) ( not ( = ?auto_26393 ?auto_26408 ) ) ( not ( = ?auto_26395 ?auto_26418 ) ) ( not ( = ?auto_26395 ?auto_26409 ) ) ( not ( = ?auto_26395 ?auto_26415 ) ) ( not ( = ?auto_26412 ?auto_26410 ) ) ( not ( = ?auto_26412 ?auto_26414 ) ) ( not ( = ?auto_26412 ?auto_26411 ) ) ( not ( = ?auto_26406 ?auto_26416 ) ) ( not ( = ?auto_26406 ?auto_26419 ) ) ( not ( = ?auto_26406 ?auto_26420 ) ) ( not ( = ?auto_26408 ?auto_26418 ) ) ( not ( = ?auto_26408 ?auto_26409 ) ) ( not ( = ?auto_26408 ?auto_26415 ) ) ( not ( = ?auto_26391 ?auto_26396 ) ) ( not ( = ?auto_26391 ?auto_26421 ) ) ( not ( = ?auto_26392 ?auto_26396 ) ) ( not ( = ?auto_26392 ?auto_26421 ) ) ( not ( = ?auto_26393 ?auto_26396 ) ) ( not ( = ?auto_26393 ?auto_26421 ) ) ( not ( = ?auto_26394 ?auto_26396 ) ) ( not ( = ?auto_26394 ?auto_26421 ) ) ( not ( = ?auto_26396 ?auto_26408 ) ) ( not ( = ?auto_26396 ?auto_26418 ) ) ( not ( = ?auto_26396 ?auto_26409 ) ) ( not ( = ?auto_26396 ?auto_26415 ) ) ( not ( = ?auto_26417 ?auto_26412 ) ) ( not ( = ?auto_26417 ?auto_26410 ) ) ( not ( = ?auto_26417 ?auto_26414 ) ) ( not ( = ?auto_26417 ?auto_26411 ) ) ( not ( = ?auto_26407 ?auto_26406 ) ) ( not ( = ?auto_26407 ?auto_26416 ) ) ( not ( = ?auto_26407 ?auto_26419 ) ) ( not ( = ?auto_26407 ?auto_26420 ) ) ( not ( = ?auto_26421 ?auto_26408 ) ) ( not ( = ?auto_26421 ?auto_26418 ) ) ( not ( = ?auto_26421 ?auto_26409 ) ) ( not ( = ?auto_26421 ?auto_26415 ) ) ( not ( = ?auto_26391 ?auto_26397 ) ) ( not ( = ?auto_26391 ?auto_26405 ) ) ( not ( = ?auto_26392 ?auto_26397 ) ) ( not ( = ?auto_26392 ?auto_26405 ) ) ( not ( = ?auto_26393 ?auto_26397 ) ) ( not ( = ?auto_26393 ?auto_26405 ) ) ( not ( = ?auto_26394 ?auto_26397 ) ) ( not ( = ?auto_26394 ?auto_26405 ) ) ( not ( = ?auto_26395 ?auto_26397 ) ) ( not ( = ?auto_26395 ?auto_26405 ) ) ( not ( = ?auto_26397 ?auto_26421 ) ) ( not ( = ?auto_26397 ?auto_26408 ) ) ( not ( = ?auto_26397 ?auto_26418 ) ) ( not ( = ?auto_26397 ?auto_26409 ) ) ( not ( = ?auto_26397 ?auto_26415 ) ) ( not ( = ?auto_26422 ?auto_26417 ) ) ( not ( = ?auto_26422 ?auto_26412 ) ) ( not ( = ?auto_26422 ?auto_26410 ) ) ( not ( = ?auto_26422 ?auto_26414 ) ) ( not ( = ?auto_26422 ?auto_26411 ) ) ( not ( = ?auto_26413 ?auto_26407 ) ) ( not ( = ?auto_26413 ?auto_26406 ) ) ( not ( = ?auto_26413 ?auto_26416 ) ) ( not ( = ?auto_26413 ?auto_26419 ) ) ( not ( = ?auto_26413 ?auto_26420 ) ) ( not ( = ?auto_26405 ?auto_26421 ) ) ( not ( = ?auto_26405 ?auto_26408 ) ) ( not ( = ?auto_26405 ?auto_26418 ) ) ( not ( = ?auto_26405 ?auto_26409 ) ) ( not ( = ?auto_26405 ?auto_26415 ) ) ( not ( = ?auto_26391 ?auto_26398 ) ) ( not ( = ?auto_26391 ?auto_26403 ) ) ( not ( = ?auto_26392 ?auto_26398 ) ) ( not ( = ?auto_26392 ?auto_26403 ) ) ( not ( = ?auto_26393 ?auto_26398 ) ) ( not ( = ?auto_26393 ?auto_26403 ) ) ( not ( = ?auto_26394 ?auto_26398 ) ) ( not ( = ?auto_26394 ?auto_26403 ) ) ( not ( = ?auto_26395 ?auto_26398 ) ) ( not ( = ?auto_26395 ?auto_26403 ) ) ( not ( = ?auto_26396 ?auto_26398 ) ) ( not ( = ?auto_26396 ?auto_26403 ) ) ( not ( = ?auto_26398 ?auto_26405 ) ) ( not ( = ?auto_26398 ?auto_26421 ) ) ( not ( = ?auto_26398 ?auto_26408 ) ) ( not ( = ?auto_26398 ?auto_26418 ) ) ( not ( = ?auto_26398 ?auto_26409 ) ) ( not ( = ?auto_26398 ?auto_26415 ) ) ( not ( = ?auto_26404 ?auto_26422 ) ) ( not ( = ?auto_26404 ?auto_26417 ) ) ( not ( = ?auto_26404 ?auto_26412 ) ) ( not ( = ?auto_26404 ?auto_26410 ) ) ( not ( = ?auto_26404 ?auto_26414 ) ) ( not ( = ?auto_26404 ?auto_26411 ) ) ( not ( = ?auto_26402 ?auto_26413 ) ) ( not ( = ?auto_26402 ?auto_26407 ) ) ( not ( = ?auto_26402 ?auto_26406 ) ) ( not ( = ?auto_26402 ?auto_26416 ) ) ( not ( = ?auto_26402 ?auto_26419 ) ) ( not ( = ?auto_26402 ?auto_26420 ) ) ( not ( = ?auto_26403 ?auto_26405 ) ) ( not ( = ?auto_26403 ?auto_26421 ) ) ( not ( = ?auto_26403 ?auto_26408 ) ) ( not ( = ?auto_26403 ?auto_26418 ) ) ( not ( = ?auto_26403 ?auto_26409 ) ) ( not ( = ?auto_26403 ?auto_26415 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_26391 ?auto_26392 ?auto_26393 ?auto_26394 ?auto_26395 ?auto_26396 ?auto_26397 )
      ( MAKE-1CRATE ?auto_26397 ?auto_26398 )
      ( MAKE-7CRATE-VERIFY ?auto_26391 ?auto_26392 ?auto_26393 ?auto_26394 ?auto_26395 ?auto_26396 ?auto_26397 ?auto_26398 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_26442 - SURFACE
      ?auto_26443 - SURFACE
      ?auto_26444 - SURFACE
      ?auto_26445 - SURFACE
      ?auto_26446 - SURFACE
      ?auto_26447 - SURFACE
      ?auto_26448 - SURFACE
      ?auto_26449 - SURFACE
      ?auto_26450 - SURFACE
    )
    :vars
    (
      ?auto_26453 - HOIST
      ?auto_26454 - PLACE
      ?auto_26455 - PLACE
      ?auto_26456 - HOIST
      ?auto_26451 - SURFACE
      ?auto_26458 - SURFACE
      ?auto_26475 - PLACE
      ?auto_26469 - HOIST
      ?auto_26473 - SURFACE
      ?auto_26459 - PLACE
      ?auto_26457 - HOIST
      ?auto_26474 - SURFACE
      ?auto_26461 - PLACE
      ?auto_26467 - HOIST
      ?auto_26465 - SURFACE
      ?auto_26463 - PLACE
      ?auto_26472 - HOIST
      ?auto_26460 - SURFACE
      ?auto_26471 - PLACE
      ?auto_26466 - HOIST
      ?auto_26464 - SURFACE
      ?auto_26462 - PLACE
      ?auto_26468 - HOIST
      ?auto_26470 - SURFACE
      ?auto_26452 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26453 ?auto_26454 ) ( IS-CRATE ?auto_26450 ) ( not ( = ?auto_26455 ?auto_26454 ) ) ( HOIST-AT ?auto_26456 ?auto_26455 ) ( SURFACE-AT ?auto_26450 ?auto_26455 ) ( ON ?auto_26450 ?auto_26451 ) ( CLEAR ?auto_26450 ) ( not ( = ?auto_26449 ?auto_26450 ) ) ( not ( = ?auto_26449 ?auto_26451 ) ) ( not ( = ?auto_26450 ?auto_26451 ) ) ( not ( = ?auto_26453 ?auto_26456 ) ) ( IS-CRATE ?auto_26449 ) ( AVAILABLE ?auto_26456 ) ( SURFACE-AT ?auto_26449 ?auto_26455 ) ( ON ?auto_26449 ?auto_26458 ) ( CLEAR ?auto_26449 ) ( not ( = ?auto_26448 ?auto_26449 ) ) ( not ( = ?auto_26448 ?auto_26458 ) ) ( not ( = ?auto_26449 ?auto_26458 ) ) ( IS-CRATE ?auto_26448 ) ( not ( = ?auto_26475 ?auto_26454 ) ) ( HOIST-AT ?auto_26469 ?auto_26475 ) ( AVAILABLE ?auto_26469 ) ( SURFACE-AT ?auto_26448 ?auto_26475 ) ( ON ?auto_26448 ?auto_26473 ) ( CLEAR ?auto_26448 ) ( not ( = ?auto_26447 ?auto_26448 ) ) ( not ( = ?auto_26447 ?auto_26473 ) ) ( not ( = ?auto_26448 ?auto_26473 ) ) ( not ( = ?auto_26453 ?auto_26469 ) ) ( IS-CRATE ?auto_26447 ) ( not ( = ?auto_26459 ?auto_26454 ) ) ( HOIST-AT ?auto_26457 ?auto_26459 ) ( AVAILABLE ?auto_26457 ) ( SURFACE-AT ?auto_26447 ?auto_26459 ) ( ON ?auto_26447 ?auto_26474 ) ( CLEAR ?auto_26447 ) ( not ( = ?auto_26446 ?auto_26447 ) ) ( not ( = ?auto_26446 ?auto_26474 ) ) ( not ( = ?auto_26447 ?auto_26474 ) ) ( not ( = ?auto_26453 ?auto_26457 ) ) ( IS-CRATE ?auto_26446 ) ( not ( = ?auto_26461 ?auto_26454 ) ) ( HOIST-AT ?auto_26467 ?auto_26461 ) ( AVAILABLE ?auto_26467 ) ( SURFACE-AT ?auto_26446 ?auto_26461 ) ( ON ?auto_26446 ?auto_26465 ) ( CLEAR ?auto_26446 ) ( not ( = ?auto_26445 ?auto_26446 ) ) ( not ( = ?auto_26445 ?auto_26465 ) ) ( not ( = ?auto_26446 ?auto_26465 ) ) ( not ( = ?auto_26453 ?auto_26467 ) ) ( IS-CRATE ?auto_26445 ) ( not ( = ?auto_26463 ?auto_26454 ) ) ( HOIST-AT ?auto_26472 ?auto_26463 ) ( AVAILABLE ?auto_26472 ) ( SURFACE-AT ?auto_26445 ?auto_26463 ) ( ON ?auto_26445 ?auto_26460 ) ( CLEAR ?auto_26445 ) ( not ( = ?auto_26444 ?auto_26445 ) ) ( not ( = ?auto_26444 ?auto_26460 ) ) ( not ( = ?auto_26445 ?auto_26460 ) ) ( not ( = ?auto_26453 ?auto_26472 ) ) ( IS-CRATE ?auto_26444 ) ( not ( = ?auto_26471 ?auto_26454 ) ) ( HOIST-AT ?auto_26466 ?auto_26471 ) ( AVAILABLE ?auto_26466 ) ( SURFACE-AT ?auto_26444 ?auto_26471 ) ( ON ?auto_26444 ?auto_26464 ) ( CLEAR ?auto_26444 ) ( not ( = ?auto_26443 ?auto_26444 ) ) ( not ( = ?auto_26443 ?auto_26464 ) ) ( not ( = ?auto_26444 ?auto_26464 ) ) ( not ( = ?auto_26453 ?auto_26466 ) ) ( SURFACE-AT ?auto_26442 ?auto_26454 ) ( CLEAR ?auto_26442 ) ( IS-CRATE ?auto_26443 ) ( AVAILABLE ?auto_26453 ) ( not ( = ?auto_26462 ?auto_26454 ) ) ( HOIST-AT ?auto_26468 ?auto_26462 ) ( AVAILABLE ?auto_26468 ) ( SURFACE-AT ?auto_26443 ?auto_26462 ) ( ON ?auto_26443 ?auto_26470 ) ( CLEAR ?auto_26443 ) ( TRUCK-AT ?auto_26452 ?auto_26454 ) ( not ( = ?auto_26442 ?auto_26443 ) ) ( not ( = ?auto_26442 ?auto_26470 ) ) ( not ( = ?auto_26443 ?auto_26470 ) ) ( not ( = ?auto_26453 ?auto_26468 ) ) ( not ( = ?auto_26442 ?auto_26444 ) ) ( not ( = ?auto_26442 ?auto_26464 ) ) ( not ( = ?auto_26444 ?auto_26470 ) ) ( not ( = ?auto_26471 ?auto_26462 ) ) ( not ( = ?auto_26466 ?auto_26468 ) ) ( not ( = ?auto_26464 ?auto_26470 ) ) ( not ( = ?auto_26442 ?auto_26445 ) ) ( not ( = ?auto_26442 ?auto_26460 ) ) ( not ( = ?auto_26443 ?auto_26445 ) ) ( not ( = ?auto_26443 ?auto_26460 ) ) ( not ( = ?auto_26445 ?auto_26464 ) ) ( not ( = ?auto_26445 ?auto_26470 ) ) ( not ( = ?auto_26463 ?auto_26471 ) ) ( not ( = ?auto_26463 ?auto_26462 ) ) ( not ( = ?auto_26472 ?auto_26466 ) ) ( not ( = ?auto_26472 ?auto_26468 ) ) ( not ( = ?auto_26460 ?auto_26464 ) ) ( not ( = ?auto_26460 ?auto_26470 ) ) ( not ( = ?auto_26442 ?auto_26446 ) ) ( not ( = ?auto_26442 ?auto_26465 ) ) ( not ( = ?auto_26443 ?auto_26446 ) ) ( not ( = ?auto_26443 ?auto_26465 ) ) ( not ( = ?auto_26444 ?auto_26446 ) ) ( not ( = ?auto_26444 ?auto_26465 ) ) ( not ( = ?auto_26446 ?auto_26460 ) ) ( not ( = ?auto_26446 ?auto_26464 ) ) ( not ( = ?auto_26446 ?auto_26470 ) ) ( not ( = ?auto_26461 ?auto_26463 ) ) ( not ( = ?auto_26461 ?auto_26471 ) ) ( not ( = ?auto_26461 ?auto_26462 ) ) ( not ( = ?auto_26467 ?auto_26472 ) ) ( not ( = ?auto_26467 ?auto_26466 ) ) ( not ( = ?auto_26467 ?auto_26468 ) ) ( not ( = ?auto_26465 ?auto_26460 ) ) ( not ( = ?auto_26465 ?auto_26464 ) ) ( not ( = ?auto_26465 ?auto_26470 ) ) ( not ( = ?auto_26442 ?auto_26447 ) ) ( not ( = ?auto_26442 ?auto_26474 ) ) ( not ( = ?auto_26443 ?auto_26447 ) ) ( not ( = ?auto_26443 ?auto_26474 ) ) ( not ( = ?auto_26444 ?auto_26447 ) ) ( not ( = ?auto_26444 ?auto_26474 ) ) ( not ( = ?auto_26445 ?auto_26447 ) ) ( not ( = ?auto_26445 ?auto_26474 ) ) ( not ( = ?auto_26447 ?auto_26465 ) ) ( not ( = ?auto_26447 ?auto_26460 ) ) ( not ( = ?auto_26447 ?auto_26464 ) ) ( not ( = ?auto_26447 ?auto_26470 ) ) ( not ( = ?auto_26459 ?auto_26461 ) ) ( not ( = ?auto_26459 ?auto_26463 ) ) ( not ( = ?auto_26459 ?auto_26471 ) ) ( not ( = ?auto_26459 ?auto_26462 ) ) ( not ( = ?auto_26457 ?auto_26467 ) ) ( not ( = ?auto_26457 ?auto_26472 ) ) ( not ( = ?auto_26457 ?auto_26466 ) ) ( not ( = ?auto_26457 ?auto_26468 ) ) ( not ( = ?auto_26474 ?auto_26465 ) ) ( not ( = ?auto_26474 ?auto_26460 ) ) ( not ( = ?auto_26474 ?auto_26464 ) ) ( not ( = ?auto_26474 ?auto_26470 ) ) ( not ( = ?auto_26442 ?auto_26448 ) ) ( not ( = ?auto_26442 ?auto_26473 ) ) ( not ( = ?auto_26443 ?auto_26448 ) ) ( not ( = ?auto_26443 ?auto_26473 ) ) ( not ( = ?auto_26444 ?auto_26448 ) ) ( not ( = ?auto_26444 ?auto_26473 ) ) ( not ( = ?auto_26445 ?auto_26448 ) ) ( not ( = ?auto_26445 ?auto_26473 ) ) ( not ( = ?auto_26446 ?auto_26448 ) ) ( not ( = ?auto_26446 ?auto_26473 ) ) ( not ( = ?auto_26448 ?auto_26474 ) ) ( not ( = ?auto_26448 ?auto_26465 ) ) ( not ( = ?auto_26448 ?auto_26460 ) ) ( not ( = ?auto_26448 ?auto_26464 ) ) ( not ( = ?auto_26448 ?auto_26470 ) ) ( not ( = ?auto_26475 ?auto_26459 ) ) ( not ( = ?auto_26475 ?auto_26461 ) ) ( not ( = ?auto_26475 ?auto_26463 ) ) ( not ( = ?auto_26475 ?auto_26471 ) ) ( not ( = ?auto_26475 ?auto_26462 ) ) ( not ( = ?auto_26469 ?auto_26457 ) ) ( not ( = ?auto_26469 ?auto_26467 ) ) ( not ( = ?auto_26469 ?auto_26472 ) ) ( not ( = ?auto_26469 ?auto_26466 ) ) ( not ( = ?auto_26469 ?auto_26468 ) ) ( not ( = ?auto_26473 ?auto_26474 ) ) ( not ( = ?auto_26473 ?auto_26465 ) ) ( not ( = ?auto_26473 ?auto_26460 ) ) ( not ( = ?auto_26473 ?auto_26464 ) ) ( not ( = ?auto_26473 ?auto_26470 ) ) ( not ( = ?auto_26442 ?auto_26449 ) ) ( not ( = ?auto_26442 ?auto_26458 ) ) ( not ( = ?auto_26443 ?auto_26449 ) ) ( not ( = ?auto_26443 ?auto_26458 ) ) ( not ( = ?auto_26444 ?auto_26449 ) ) ( not ( = ?auto_26444 ?auto_26458 ) ) ( not ( = ?auto_26445 ?auto_26449 ) ) ( not ( = ?auto_26445 ?auto_26458 ) ) ( not ( = ?auto_26446 ?auto_26449 ) ) ( not ( = ?auto_26446 ?auto_26458 ) ) ( not ( = ?auto_26447 ?auto_26449 ) ) ( not ( = ?auto_26447 ?auto_26458 ) ) ( not ( = ?auto_26449 ?auto_26473 ) ) ( not ( = ?auto_26449 ?auto_26474 ) ) ( not ( = ?auto_26449 ?auto_26465 ) ) ( not ( = ?auto_26449 ?auto_26460 ) ) ( not ( = ?auto_26449 ?auto_26464 ) ) ( not ( = ?auto_26449 ?auto_26470 ) ) ( not ( = ?auto_26455 ?auto_26475 ) ) ( not ( = ?auto_26455 ?auto_26459 ) ) ( not ( = ?auto_26455 ?auto_26461 ) ) ( not ( = ?auto_26455 ?auto_26463 ) ) ( not ( = ?auto_26455 ?auto_26471 ) ) ( not ( = ?auto_26455 ?auto_26462 ) ) ( not ( = ?auto_26456 ?auto_26469 ) ) ( not ( = ?auto_26456 ?auto_26457 ) ) ( not ( = ?auto_26456 ?auto_26467 ) ) ( not ( = ?auto_26456 ?auto_26472 ) ) ( not ( = ?auto_26456 ?auto_26466 ) ) ( not ( = ?auto_26456 ?auto_26468 ) ) ( not ( = ?auto_26458 ?auto_26473 ) ) ( not ( = ?auto_26458 ?auto_26474 ) ) ( not ( = ?auto_26458 ?auto_26465 ) ) ( not ( = ?auto_26458 ?auto_26460 ) ) ( not ( = ?auto_26458 ?auto_26464 ) ) ( not ( = ?auto_26458 ?auto_26470 ) ) ( not ( = ?auto_26442 ?auto_26450 ) ) ( not ( = ?auto_26442 ?auto_26451 ) ) ( not ( = ?auto_26443 ?auto_26450 ) ) ( not ( = ?auto_26443 ?auto_26451 ) ) ( not ( = ?auto_26444 ?auto_26450 ) ) ( not ( = ?auto_26444 ?auto_26451 ) ) ( not ( = ?auto_26445 ?auto_26450 ) ) ( not ( = ?auto_26445 ?auto_26451 ) ) ( not ( = ?auto_26446 ?auto_26450 ) ) ( not ( = ?auto_26446 ?auto_26451 ) ) ( not ( = ?auto_26447 ?auto_26450 ) ) ( not ( = ?auto_26447 ?auto_26451 ) ) ( not ( = ?auto_26448 ?auto_26450 ) ) ( not ( = ?auto_26448 ?auto_26451 ) ) ( not ( = ?auto_26450 ?auto_26458 ) ) ( not ( = ?auto_26450 ?auto_26473 ) ) ( not ( = ?auto_26450 ?auto_26474 ) ) ( not ( = ?auto_26450 ?auto_26465 ) ) ( not ( = ?auto_26450 ?auto_26460 ) ) ( not ( = ?auto_26450 ?auto_26464 ) ) ( not ( = ?auto_26450 ?auto_26470 ) ) ( not ( = ?auto_26451 ?auto_26458 ) ) ( not ( = ?auto_26451 ?auto_26473 ) ) ( not ( = ?auto_26451 ?auto_26474 ) ) ( not ( = ?auto_26451 ?auto_26465 ) ) ( not ( = ?auto_26451 ?auto_26460 ) ) ( not ( = ?auto_26451 ?auto_26464 ) ) ( not ( = ?auto_26451 ?auto_26470 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_26442 ?auto_26443 ?auto_26444 ?auto_26445 ?auto_26446 ?auto_26447 ?auto_26448 ?auto_26449 )
      ( MAKE-1CRATE ?auto_26449 ?auto_26450 )
      ( MAKE-8CRATE-VERIFY ?auto_26442 ?auto_26443 ?auto_26444 ?auto_26445 ?auto_26446 ?auto_26447 ?auto_26448 ?auto_26449 ?auto_26450 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_26496 - SURFACE
      ?auto_26497 - SURFACE
      ?auto_26498 - SURFACE
      ?auto_26499 - SURFACE
      ?auto_26500 - SURFACE
      ?auto_26501 - SURFACE
      ?auto_26502 - SURFACE
      ?auto_26503 - SURFACE
      ?auto_26504 - SURFACE
      ?auto_26505 - SURFACE
    )
    :vars
    (
      ?auto_26508 - HOIST
      ?auto_26511 - PLACE
      ?auto_26510 - PLACE
      ?auto_26507 - HOIST
      ?auto_26506 - SURFACE
      ?auto_26528 - PLACE
      ?auto_26519 - HOIST
      ?auto_26522 - SURFACE
      ?auto_26514 - SURFACE
      ?auto_26523 - PLACE
      ?auto_26526 - HOIST
      ?auto_26512 - SURFACE
      ?auto_26513 - PLACE
      ?auto_26529 - HOIST
      ?auto_26524 - SURFACE
      ?auto_26515 - SURFACE
      ?auto_26517 - PLACE
      ?auto_26530 - HOIST
      ?auto_26527 - SURFACE
      ?auto_26531 - PLACE
      ?auto_26520 - HOIST
      ?auto_26516 - SURFACE
      ?auto_26518 - PLACE
      ?auto_26521 - HOIST
      ?auto_26525 - SURFACE
      ?auto_26509 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26508 ?auto_26511 ) ( IS-CRATE ?auto_26505 ) ( not ( = ?auto_26510 ?auto_26511 ) ) ( HOIST-AT ?auto_26507 ?auto_26510 ) ( SURFACE-AT ?auto_26505 ?auto_26510 ) ( ON ?auto_26505 ?auto_26506 ) ( CLEAR ?auto_26505 ) ( not ( = ?auto_26504 ?auto_26505 ) ) ( not ( = ?auto_26504 ?auto_26506 ) ) ( not ( = ?auto_26505 ?auto_26506 ) ) ( not ( = ?auto_26508 ?auto_26507 ) ) ( IS-CRATE ?auto_26504 ) ( not ( = ?auto_26528 ?auto_26511 ) ) ( HOIST-AT ?auto_26519 ?auto_26528 ) ( SURFACE-AT ?auto_26504 ?auto_26528 ) ( ON ?auto_26504 ?auto_26522 ) ( CLEAR ?auto_26504 ) ( not ( = ?auto_26503 ?auto_26504 ) ) ( not ( = ?auto_26503 ?auto_26522 ) ) ( not ( = ?auto_26504 ?auto_26522 ) ) ( not ( = ?auto_26508 ?auto_26519 ) ) ( IS-CRATE ?auto_26503 ) ( AVAILABLE ?auto_26519 ) ( SURFACE-AT ?auto_26503 ?auto_26528 ) ( ON ?auto_26503 ?auto_26514 ) ( CLEAR ?auto_26503 ) ( not ( = ?auto_26502 ?auto_26503 ) ) ( not ( = ?auto_26502 ?auto_26514 ) ) ( not ( = ?auto_26503 ?auto_26514 ) ) ( IS-CRATE ?auto_26502 ) ( not ( = ?auto_26523 ?auto_26511 ) ) ( HOIST-AT ?auto_26526 ?auto_26523 ) ( AVAILABLE ?auto_26526 ) ( SURFACE-AT ?auto_26502 ?auto_26523 ) ( ON ?auto_26502 ?auto_26512 ) ( CLEAR ?auto_26502 ) ( not ( = ?auto_26501 ?auto_26502 ) ) ( not ( = ?auto_26501 ?auto_26512 ) ) ( not ( = ?auto_26502 ?auto_26512 ) ) ( not ( = ?auto_26508 ?auto_26526 ) ) ( IS-CRATE ?auto_26501 ) ( not ( = ?auto_26513 ?auto_26511 ) ) ( HOIST-AT ?auto_26529 ?auto_26513 ) ( AVAILABLE ?auto_26529 ) ( SURFACE-AT ?auto_26501 ?auto_26513 ) ( ON ?auto_26501 ?auto_26524 ) ( CLEAR ?auto_26501 ) ( not ( = ?auto_26500 ?auto_26501 ) ) ( not ( = ?auto_26500 ?auto_26524 ) ) ( not ( = ?auto_26501 ?auto_26524 ) ) ( not ( = ?auto_26508 ?auto_26529 ) ) ( IS-CRATE ?auto_26500 ) ( AVAILABLE ?auto_26507 ) ( SURFACE-AT ?auto_26500 ?auto_26510 ) ( ON ?auto_26500 ?auto_26515 ) ( CLEAR ?auto_26500 ) ( not ( = ?auto_26499 ?auto_26500 ) ) ( not ( = ?auto_26499 ?auto_26515 ) ) ( not ( = ?auto_26500 ?auto_26515 ) ) ( IS-CRATE ?auto_26499 ) ( not ( = ?auto_26517 ?auto_26511 ) ) ( HOIST-AT ?auto_26530 ?auto_26517 ) ( AVAILABLE ?auto_26530 ) ( SURFACE-AT ?auto_26499 ?auto_26517 ) ( ON ?auto_26499 ?auto_26527 ) ( CLEAR ?auto_26499 ) ( not ( = ?auto_26498 ?auto_26499 ) ) ( not ( = ?auto_26498 ?auto_26527 ) ) ( not ( = ?auto_26499 ?auto_26527 ) ) ( not ( = ?auto_26508 ?auto_26530 ) ) ( IS-CRATE ?auto_26498 ) ( not ( = ?auto_26531 ?auto_26511 ) ) ( HOIST-AT ?auto_26520 ?auto_26531 ) ( AVAILABLE ?auto_26520 ) ( SURFACE-AT ?auto_26498 ?auto_26531 ) ( ON ?auto_26498 ?auto_26516 ) ( CLEAR ?auto_26498 ) ( not ( = ?auto_26497 ?auto_26498 ) ) ( not ( = ?auto_26497 ?auto_26516 ) ) ( not ( = ?auto_26498 ?auto_26516 ) ) ( not ( = ?auto_26508 ?auto_26520 ) ) ( SURFACE-AT ?auto_26496 ?auto_26511 ) ( CLEAR ?auto_26496 ) ( IS-CRATE ?auto_26497 ) ( AVAILABLE ?auto_26508 ) ( not ( = ?auto_26518 ?auto_26511 ) ) ( HOIST-AT ?auto_26521 ?auto_26518 ) ( AVAILABLE ?auto_26521 ) ( SURFACE-AT ?auto_26497 ?auto_26518 ) ( ON ?auto_26497 ?auto_26525 ) ( CLEAR ?auto_26497 ) ( TRUCK-AT ?auto_26509 ?auto_26511 ) ( not ( = ?auto_26496 ?auto_26497 ) ) ( not ( = ?auto_26496 ?auto_26525 ) ) ( not ( = ?auto_26497 ?auto_26525 ) ) ( not ( = ?auto_26508 ?auto_26521 ) ) ( not ( = ?auto_26496 ?auto_26498 ) ) ( not ( = ?auto_26496 ?auto_26516 ) ) ( not ( = ?auto_26498 ?auto_26525 ) ) ( not ( = ?auto_26531 ?auto_26518 ) ) ( not ( = ?auto_26520 ?auto_26521 ) ) ( not ( = ?auto_26516 ?auto_26525 ) ) ( not ( = ?auto_26496 ?auto_26499 ) ) ( not ( = ?auto_26496 ?auto_26527 ) ) ( not ( = ?auto_26497 ?auto_26499 ) ) ( not ( = ?auto_26497 ?auto_26527 ) ) ( not ( = ?auto_26499 ?auto_26516 ) ) ( not ( = ?auto_26499 ?auto_26525 ) ) ( not ( = ?auto_26517 ?auto_26531 ) ) ( not ( = ?auto_26517 ?auto_26518 ) ) ( not ( = ?auto_26530 ?auto_26520 ) ) ( not ( = ?auto_26530 ?auto_26521 ) ) ( not ( = ?auto_26527 ?auto_26516 ) ) ( not ( = ?auto_26527 ?auto_26525 ) ) ( not ( = ?auto_26496 ?auto_26500 ) ) ( not ( = ?auto_26496 ?auto_26515 ) ) ( not ( = ?auto_26497 ?auto_26500 ) ) ( not ( = ?auto_26497 ?auto_26515 ) ) ( not ( = ?auto_26498 ?auto_26500 ) ) ( not ( = ?auto_26498 ?auto_26515 ) ) ( not ( = ?auto_26500 ?auto_26527 ) ) ( not ( = ?auto_26500 ?auto_26516 ) ) ( not ( = ?auto_26500 ?auto_26525 ) ) ( not ( = ?auto_26510 ?auto_26517 ) ) ( not ( = ?auto_26510 ?auto_26531 ) ) ( not ( = ?auto_26510 ?auto_26518 ) ) ( not ( = ?auto_26507 ?auto_26530 ) ) ( not ( = ?auto_26507 ?auto_26520 ) ) ( not ( = ?auto_26507 ?auto_26521 ) ) ( not ( = ?auto_26515 ?auto_26527 ) ) ( not ( = ?auto_26515 ?auto_26516 ) ) ( not ( = ?auto_26515 ?auto_26525 ) ) ( not ( = ?auto_26496 ?auto_26501 ) ) ( not ( = ?auto_26496 ?auto_26524 ) ) ( not ( = ?auto_26497 ?auto_26501 ) ) ( not ( = ?auto_26497 ?auto_26524 ) ) ( not ( = ?auto_26498 ?auto_26501 ) ) ( not ( = ?auto_26498 ?auto_26524 ) ) ( not ( = ?auto_26499 ?auto_26501 ) ) ( not ( = ?auto_26499 ?auto_26524 ) ) ( not ( = ?auto_26501 ?auto_26515 ) ) ( not ( = ?auto_26501 ?auto_26527 ) ) ( not ( = ?auto_26501 ?auto_26516 ) ) ( not ( = ?auto_26501 ?auto_26525 ) ) ( not ( = ?auto_26513 ?auto_26510 ) ) ( not ( = ?auto_26513 ?auto_26517 ) ) ( not ( = ?auto_26513 ?auto_26531 ) ) ( not ( = ?auto_26513 ?auto_26518 ) ) ( not ( = ?auto_26529 ?auto_26507 ) ) ( not ( = ?auto_26529 ?auto_26530 ) ) ( not ( = ?auto_26529 ?auto_26520 ) ) ( not ( = ?auto_26529 ?auto_26521 ) ) ( not ( = ?auto_26524 ?auto_26515 ) ) ( not ( = ?auto_26524 ?auto_26527 ) ) ( not ( = ?auto_26524 ?auto_26516 ) ) ( not ( = ?auto_26524 ?auto_26525 ) ) ( not ( = ?auto_26496 ?auto_26502 ) ) ( not ( = ?auto_26496 ?auto_26512 ) ) ( not ( = ?auto_26497 ?auto_26502 ) ) ( not ( = ?auto_26497 ?auto_26512 ) ) ( not ( = ?auto_26498 ?auto_26502 ) ) ( not ( = ?auto_26498 ?auto_26512 ) ) ( not ( = ?auto_26499 ?auto_26502 ) ) ( not ( = ?auto_26499 ?auto_26512 ) ) ( not ( = ?auto_26500 ?auto_26502 ) ) ( not ( = ?auto_26500 ?auto_26512 ) ) ( not ( = ?auto_26502 ?auto_26524 ) ) ( not ( = ?auto_26502 ?auto_26515 ) ) ( not ( = ?auto_26502 ?auto_26527 ) ) ( not ( = ?auto_26502 ?auto_26516 ) ) ( not ( = ?auto_26502 ?auto_26525 ) ) ( not ( = ?auto_26523 ?auto_26513 ) ) ( not ( = ?auto_26523 ?auto_26510 ) ) ( not ( = ?auto_26523 ?auto_26517 ) ) ( not ( = ?auto_26523 ?auto_26531 ) ) ( not ( = ?auto_26523 ?auto_26518 ) ) ( not ( = ?auto_26526 ?auto_26529 ) ) ( not ( = ?auto_26526 ?auto_26507 ) ) ( not ( = ?auto_26526 ?auto_26530 ) ) ( not ( = ?auto_26526 ?auto_26520 ) ) ( not ( = ?auto_26526 ?auto_26521 ) ) ( not ( = ?auto_26512 ?auto_26524 ) ) ( not ( = ?auto_26512 ?auto_26515 ) ) ( not ( = ?auto_26512 ?auto_26527 ) ) ( not ( = ?auto_26512 ?auto_26516 ) ) ( not ( = ?auto_26512 ?auto_26525 ) ) ( not ( = ?auto_26496 ?auto_26503 ) ) ( not ( = ?auto_26496 ?auto_26514 ) ) ( not ( = ?auto_26497 ?auto_26503 ) ) ( not ( = ?auto_26497 ?auto_26514 ) ) ( not ( = ?auto_26498 ?auto_26503 ) ) ( not ( = ?auto_26498 ?auto_26514 ) ) ( not ( = ?auto_26499 ?auto_26503 ) ) ( not ( = ?auto_26499 ?auto_26514 ) ) ( not ( = ?auto_26500 ?auto_26503 ) ) ( not ( = ?auto_26500 ?auto_26514 ) ) ( not ( = ?auto_26501 ?auto_26503 ) ) ( not ( = ?auto_26501 ?auto_26514 ) ) ( not ( = ?auto_26503 ?auto_26512 ) ) ( not ( = ?auto_26503 ?auto_26524 ) ) ( not ( = ?auto_26503 ?auto_26515 ) ) ( not ( = ?auto_26503 ?auto_26527 ) ) ( not ( = ?auto_26503 ?auto_26516 ) ) ( not ( = ?auto_26503 ?auto_26525 ) ) ( not ( = ?auto_26528 ?auto_26523 ) ) ( not ( = ?auto_26528 ?auto_26513 ) ) ( not ( = ?auto_26528 ?auto_26510 ) ) ( not ( = ?auto_26528 ?auto_26517 ) ) ( not ( = ?auto_26528 ?auto_26531 ) ) ( not ( = ?auto_26528 ?auto_26518 ) ) ( not ( = ?auto_26519 ?auto_26526 ) ) ( not ( = ?auto_26519 ?auto_26529 ) ) ( not ( = ?auto_26519 ?auto_26507 ) ) ( not ( = ?auto_26519 ?auto_26530 ) ) ( not ( = ?auto_26519 ?auto_26520 ) ) ( not ( = ?auto_26519 ?auto_26521 ) ) ( not ( = ?auto_26514 ?auto_26512 ) ) ( not ( = ?auto_26514 ?auto_26524 ) ) ( not ( = ?auto_26514 ?auto_26515 ) ) ( not ( = ?auto_26514 ?auto_26527 ) ) ( not ( = ?auto_26514 ?auto_26516 ) ) ( not ( = ?auto_26514 ?auto_26525 ) ) ( not ( = ?auto_26496 ?auto_26504 ) ) ( not ( = ?auto_26496 ?auto_26522 ) ) ( not ( = ?auto_26497 ?auto_26504 ) ) ( not ( = ?auto_26497 ?auto_26522 ) ) ( not ( = ?auto_26498 ?auto_26504 ) ) ( not ( = ?auto_26498 ?auto_26522 ) ) ( not ( = ?auto_26499 ?auto_26504 ) ) ( not ( = ?auto_26499 ?auto_26522 ) ) ( not ( = ?auto_26500 ?auto_26504 ) ) ( not ( = ?auto_26500 ?auto_26522 ) ) ( not ( = ?auto_26501 ?auto_26504 ) ) ( not ( = ?auto_26501 ?auto_26522 ) ) ( not ( = ?auto_26502 ?auto_26504 ) ) ( not ( = ?auto_26502 ?auto_26522 ) ) ( not ( = ?auto_26504 ?auto_26514 ) ) ( not ( = ?auto_26504 ?auto_26512 ) ) ( not ( = ?auto_26504 ?auto_26524 ) ) ( not ( = ?auto_26504 ?auto_26515 ) ) ( not ( = ?auto_26504 ?auto_26527 ) ) ( not ( = ?auto_26504 ?auto_26516 ) ) ( not ( = ?auto_26504 ?auto_26525 ) ) ( not ( = ?auto_26522 ?auto_26514 ) ) ( not ( = ?auto_26522 ?auto_26512 ) ) ( not ( = ?auto_26522 ?auto_26524 ) ) ( not ( = ?auto_26522 ?auto_26515 ) ) ( not ( = ?auto_26522 ?auto_26527 ) ) ( not ( = ?auto_26522 ?auto_26516 ) ) ( not ( = ?auto_26522 ?auto_26525 ) ) ( not ( = ?auto_26496 ?auto_26505 ) ) ( not ( = ?auto_26496 ?auto_26506 ) ) ( not ( = ?auto_26497 ?auto_26505 ) ) ( not ( = ?auto_26497 ?auto_26506 ) ) ( not ( = ?auto_26498 ?auto_26505 ) ) ( not ( = ?auto_26498 ?auto_26506 ) ) ( not ( = ?auto_26499 ?auto_26505 ) ) ( not ( = ?auto_26499 ?auto_26506 ) ) ( not ( = ?auto_26500 ?auto_26505 ) ) ( not ( = ?auto_26500 ?auto_26506 ) ) ( not ( = ?auto_26501 ?auto_26505 ) ) ( not ( = ?auto_26501 ?auto_26506 ) ) ( not ( = ?auto_26502 ?auto_26505 ) ) ( not ( = ?auto_26502 ?auto_26506 ) ) ( not ( = ?auto_26503 ?auto_26505 ) ) ( not ( = ?auto_26503 ?auto_26506 ) ) ( not ( = ?auto_26505 ?auto_26522 ) ) ( not ( = ?auto_26505 ?auto_26514 ) ) ( not ( = ?auto_26505 ?auto_26512 ) ) ( not ( = ?auto_26505 ?auto_26524 ) ) ( not ( = ?auto_26505 ?auto_26515 ) ) ( not ( = ?auto_26505 ?auto_26527 ) ) ( not ( = ?auto_26505 ?auto_26516 ) ) ( not ( = ?auto_26505 ?auto_26525 ) ) ( not ( = ?auto_26506 ?auto_26522 ) ) ( not ( = ?auto_26506 ?auto_26514 ) ) ( not ( = ?auto_26506 ?auto_26512 ) ) ( not ( = ?auto_26506 ?auto_26524 ) ) ( not ( = ?auto_26506 ?auto_26515 ) ) ( not ( = ?auto_26506 ?auto_26527 ) ) ( not ( = ?auto_26506 ?auto_26516 ) ) ( not ( = ?auto_26506 ?auto_26525 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_26496 ?auto_26497 ?auto_26498 ?auto_26499 ?auto_26500 ?auto_26501 ?auto_26502 ?auto_26503 ?auto_26504 )
      ( MAKE-1CRATE ?auto_26504 ?auto_26505 )
      ( MAKE-9CRATE-VERIFY ?auto_26496 ?auto_26497 ?auto_26498 ?auto_26499 ?auto_26500 ?auto_26501 ?auto_26502 ?auto_26503 ?auto_26504 ?auto_26505 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_26553 - SURFACE
      ?auto_26554 - SURFACE
      ?auto_26555 - SURFACE
      ?auto_26556 - SURFACE
      ?auto_26557 - SURFACE
      ?auto_26558 - SURFACE
      ?auto_26559 - SURFACE
      ?auto_26560 - SURFACE
      ?auto_26561 - SURFACE
      ?auto_26562 - SURFACE
      ?auto_26563 - SURFACE
    )
    :vars
    (
      ?auto_26566 - HOIST
      ?auto_26568 - PLACE
      ?auto_26564 - PLACE
      ?auto_26567 - HOIST
      ?auto_26565 - SURFACE
      ?auto_26577 - PLACE
      ?auto_26578 - HOIST
      ?auto_26583 - SURFACE
      ?auto_26575 - PLACE
      ?auto_26591 - HOIST
      ?auto_26574 - SURFACE
      ?auto_26580 - SURFACE
      ?auto_26586 - PLACE
      ?auto_26590 - HOIST
      ?auto_26581 - SURFACE
      ?auto_26585 - PLACE
      ?auto_26571 - HOIST
      ?auto_26582 - SURFACE
      ?auto_26573 - SURFACE
      ?auto_26589 - PLACE
      ?auto_26587 - HOIST
      ?auto_26572 - SURFACE
      ?auto_26579 - PLACE
      ?auto_26584 - HOIST
      ?auto_26570 - SURFACE
      ?auto_26576 - PLACE
      ?auto_26592 - HOIST
      ?auto_26588 - SURFACE
      ?auto_26569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26566 ?auto_26568 ) ( IS-CRATE ?auto_26563 ) ( not ( = ?auto_26564 ?auto_26568 ) ) ( HOIST-AT ?auto_26567 ?auto_26564 ) ( AVAILABLE ?auto_26567 ) ( SURFACE-AT ?auto_26563 ?auto_26564 ) ( ON ?auto_26563 ?auto_26565 ) ( CLEAR ?auto_26563 ) ( not ( = ?auto_26562 ?auto_26563 ) ) ( not ( = ?auto_26562 ?auto_26565 ) ) ( not ( = ?auto_26563 ?auto_26565 ) ) ( not ( = ?auto_26566 ?auto_26567 ) ) ( IS-CRATE ?auto_26562 ) ( not ( = ?auto_26577 ?auto_26568 ) ) ( HOIST-AT ?auto_26578 ?auto_26577 ) ( SURFACE-AT ?auto_26562 ?auto_26577 ) ( ON ?auto_26562 ?auto_26583 ) ( CLEAR ?auto_26562 ) ( not ( = ?auto_26561 ?auto_26562 ) ) ( not ( = ?auto_26561 ?auto_26583 ) ) ( not ( = ?auto_26562 ?auto_26583 ) ) ( not ( = ?auto_26566 ?auto_26578 ) ) ( IS-CRATE ?auto_26561 ) ( not ( = ?auto_26575 ?auto_26568 ) ) ( HOIST-AT ?auto_26591 ?auto_26575 ) ( SURFACE-AT ?auto_26561 ?auto_26575 ) ( ON ?auto_26561 ?auto_26574 ) ( CLEAR ?auto_26561 ) ( not ( = ?auto_26560 ?auto_26561 ) ) ( not ( = ?auto_26560 ?auto_26574 ) ) ( not ( = ?auto_26561 ?auto_26574 ) ) ( not ( = ?auto_26566 ?auto_26591 ) ) ( IS-CRATE ?auto_26560 ) ( AVAILABLE ?auto_26591 ) ( SURFACE-AT ?auto_26560 ?auto_26575 ) ( ON ?auto_26560 ?auto_26580 ) ( CLEAR ?auto_26560 ) ( not ( = ?auto_26559 ?auto_26560 ) ) ( not ( = ?auto_26559 ?auto_26580 ) ) ( not ( = ?auto_26560 ?auto_26580 ) ) ( IS-CRATE ?auto_26559 ) ( not ( = ?auto_26586 ?auto_26568 ) ) ( HOIST-AT ?auto_26590 ?auto_26586 ) ( AVAILABLE ?auto_26590 ) ( SURFACE-AT ?auto_26559 ?auto_26586 ) ( ON ?auto_26559 ?auto_26581 ) ( CLEAR ?auto_26559 ) ( not ( = ?auto_26558 ?auto_26559 ) ) ( not ( = ?auto_26558 ?auto_26581 ) ) ( not ( = ?auto_26559 ?auto_26581 ) ) ( not ( = ?auto_26566 ?auto_26590 ) ) ( IS-CRATE ?auto_26558 ) ( not ( = ?auto_26585 ?auto_26568 ) ) ( HOIST-AT ?auto_26571 ?auto_26585 ) ( AVAILABLE ?auto_26571 ) ( SURFACE-AT ?auto_26558 ?auto_26585 ) ( ON ?auto_26558 ?auto_26582 ) ( CLEAR ?auto_26558 ) ( not ( = ?auto_26557 ?auto_26558 ) ) ( not ( = ?auto_26557 ?auto_26582 ) ) ( not ( = ?auto_26558 ?auto_26582 ) ) ( not ( = ?auto_26566 ?auto_26571 ) ) ( IS-CRATE ?auto_26557 ) ( AVAILABLE ?auto_26578 ) ( SURFACE-AT ?auto_26557 ?auto_26577 ) ( ON ?auto_26557 ?auto_26573 ) ( CLEAR ?auto_26557 ) ( not ( = ?auto_26556 ?auto_26557 ) ) ( not ( = ?auto_26556 ?auto_26573 ) ) ( not ( = ?auto_26557 ?auto_26573 ) ) ( IS-CRATE ?auto_26556 ) ( not ( = ?auto_26589 ?auto_26568 ) ) ( HOIST-AT ?auto_26587 ?auto_26589 ) ( AVAILABLE ?auto_26587 ) ( SURFACE-AT ?auto_26556 ?auto_26589 ) ( ON ?auto_26556 ?auto_26572 ) ( CLEAR ?auto_26556 ) ( not ( = ?auto_26555 ?auto_26556 ) ) ( not ( = ?auto_26555 ?auto_26572 ) ) ( not ( = ?auto_26556 ?auto_26572 ) ) ( not ( = ?auto_26566 ?auto_26587 ) ) ( IS-CRATE ?auto_26555 ) ( not ( = ?auto_26579 ?auto_26568 ) ) ( HOIST-AT ?auto_26584 ?auto_26579 ) ( AVAILABLE ?auto_26584 ) ( SURFACE-AT ?auto_26555 ?auto_26579 ) ( ON ?auto_26555 ?auto_26570 ) ( CLEAR ?auto_26555 ) ( not ( = ?auto_26554 ?auto_26555 ) ) ( not ( = ?auto_26554 ?auto_26570 ) ) ( not ( = ?auto_26555 ?auto_26570 ) ) ( not ( = ?auto_26566 ?auto_26584 ) ) ( SURFACE-AT ?auto_26553 ?auto_26568 ) ( CLEAR ?auto_26553 ) ( IS-CRATE ?auto_26554 ) ( AVAILABLE ?auto_26566 ) ( not ( = ?auto_26576 ?auto_26568 ) ) ( HOIST-AT ?auto_26592 ?auto_26576 ) ( AVAILABLE ?auto_26592 ) ( SURFACE-AT ?auto_26554 ?auto_26576 ) ( ON ?auto_26554 ?auto_26588 ) ( CLEAR ?auto_26554 ) ( TRUCK-AT ?auto_26569 ?auto_26568 ) ( not ( = ?auto_26553 ?auto_26554 ) ) ( not ( = ?auto_26553 ?auto_26588 ) ) ( not ( = ?auto_26554 ?auto_26588 ) ) ( not ( = ?auto_26566 ?auto_26592 ) ) ( not ( = ?auto_26553 ?auto_26555 ) ) ( not ( = ?auto_26553 ?auto_26570 ) ) ( not ( = ?auto_26555 ?auto_26588 ) ) ( not ( = ?auto_26579 ?auto_26576 ) ) ( not ( = ?auto_26584 ?auto_26592 ) ) ( not ( = ?auto_26570 ?auto_26588 ) ) ( not ( = ?auto_26553 ?auto_26556 ) ) ( not ( = ?auto_26553 ?auto_26572 ) ) ( not ( = ?auto_26554 ?auto_26556 ) ) ( not ( = ?auto_26554 ?auto_26572 ) ) ( not ( = ?auto_26556 ?auto_26570 ) ) ( not ( = ?auto_26556 ?auto_26588 ) ) ( not ( = ?auto_26589 ?auto_26579 ) ) ( not ( = ?auto_26589 ?auto_26576 ) ) ( not ( = ?auto_26587 ?auto_26584 ) ) ( not ( = ?auto_26587 ?auto_26592 ) ) ( not ( = ?auto_26572 ?auto_26570 ) ) ( not ( = ?auto_26572 ?auto_26588 ) ) ( not ( = ?auto_26553 ?auto_26557 ) ) ( not ( = ?auto_26553 ?auto_26573 ) ) ( not ( = ?auto_26554 ?auto_26557 ) ) ( not ( = ?auto_26554 ?auto_26573 ) ) ( not ( = ?auto_26555 ?auto_26557 ) ) ( not ( = ?auto_26555 ?auto_26573 ) ) ( not ( = ?auto_26557 ?auto_26572 ) ) ( not ( = ?auto_26557 ?auto_26570 ) ) ( not ( = ?auto_26557 ?auto_26588 ) ) ( not ( = ?auto_26577 ?auto_26589 ) ) ( not ( = ?auto_26577 ?auto_26579 ) ) ( not ( = ?auto_26577 ?auto_26576 ) ) ( not ( = ?auto_26578 ?auto_26587 ) ) ( not ( = ?auto_26578 ?auto_26584 ) ) ( not ( = ?auto_26578 ?auto_26592 ) ) ( not ( = ?auto_26573 ?auto_26572 ) ) ( not ( = ?auto_26573 ?auto_26570 ) ) ( not ( = ?auto_26573 ?auto_26588 ) ) ( not ( = ?auto_26553 ?auto_26558 ) ) ( not ( = ?auto_26553 ?auto_26582 ) ) ( not ( = ?auto_26554 ?auto_26558 ) ) ( not ( = ?auto_26554 ?auto_26582 ) ) ( not ( = ?auto_26555 ?auto_26558 ) ) ( not ( = ?auto_26555 ?auto_26582 ) ) ( not ( = ?auto_26556 ?auto_26558 ) ) ( not ( = ?auto_26556 ?auto_26582 ) ) ( not ( = ?auto_26558 ?auto_26573 ) ) ( not ( = ?auto_26558 ?auto_26572 ) ) ( not ( = ?auto_26558 ?auto_26570 ) ) ( not ( = ?auto_26558 ?auto_26588 ) ) ( not ( = ?auto_26585 ?auto_26577 ) ) ( not ( = ?auto_26585 ?auto_26589 ) ) ( not ( = ?auto_26585 ?auto_26579 ) ) ( not ( = ?auto_26585 ?auto_26576 ) ) ( not ( = ?auto_26571 ?auto_26578 ) ) ( not ( = ?auto_26571 ?auto_26587 ) ) ( not ( = ?auto_26571 ?auto_26584 ) ) ( not ( = ?auto_26571 ?auto_26592 ) ) ( not ( = ?auto_26582 ?auto_26573 ) ) ( not ( = ?auto_26582 ?auto_26572 ) ) ( not ( = ?auto_26582 ?auto_26570 ) ) ( not ( = ?auto_26582 ?auto_26588 ) ) ( not ( = ?auto_26553 ?auto_26559 ) ) ( not ( = ?auto_26553 ?auto_26581 ) ) ( not ( = ?auto_26554 ?auto_26559 ) ) ( not ( = ?auto_26554 ?auto_26581 ) ) ( not ( = ?auto_26555 ?auto_26559 ) ) ( not ( = ?auto_26555 ?auto_26581 ) ) ( not ( = ?auto_26556 ?auto_26559 ) ) ( not ( = ?auto_26556 ?auto_26581 ) ) ( not ( = ?auto_26557 ?auto_26559 ) ) ( not ( = ?auto_26557 ?auto_26581 ) ) ( not ( = ?auto_26559 ?auto_26582 ) ) ( not ( = ?auto_26559 ?auto_26573 ) ) ( not ( = ?auto_26559 ?auto_26572 ) ) ( not ( = ?auto_26559 ?auto_26570 ) ) ( not ( = ?auto_26559 ?auto_26588 ) ) ( not ( = ?auto_26586 ?auto_26585 ) ) ( not ( = ?auto_26586 ?auto_26577 ) ) ( not ( = ?auto_26586 ?auto_26589 ) ) ( not ( = ?auto_26586 ?auto_26579 ) ) ( not ( = ?auto_26586 ?auto_26576 ) ) ( not ( = ?auto_26590 ?auto_26571 ) ) ( not ( = ?auto_26590 ?auto_26578 ) ) ( not ( = ?auto_26590 ?auto_26587 ) ) ( not ( = ?auto_26590 ?auto_26584 ) ) ( not ( = ?auto_26590 ?auto_26592 ) ) ( not ( = ?auto_26581 ?auto_26582 ) ) ( not ( = ?auto_26581 ?auto_26573 ) ) ( not ( = ?auto_26581 ?auto_26572 ) ) ( not ( = ?auto_26581 ?auto_26570 ) ) ( not ( = ?auto_26581 ?auto_26588 ) ) ( not ( = ?auto_26553 ?auto_26560 ) ) ( not ( = ?auto_26553 ?auto_26580 ) ) ( not ( = ?auto_26554 ?auto_26560 ) ) ( not ( = ?auto_26554 ?auto_26580 ) ) ( not ( = ?auto_26555 ?auto_26560 ) ) ( not ( = ?auto_26555 ?auto_26580 ) ) ( not ( = ?auto_26556 ?auto_26560 ) ) ( not ( = ?auto_26556 ?auto_26580 ) ) ( not ( = ?auto_26557 ?auto_26560 ) ) ( not ( = ?auto_26557 ?auto_26580 ) ) ( not ( = ?auto_26558 ?auto_26560 ) ) ( not ( = ?auto_26558 ?auto_26580 ) ) ( not ( = ?auto_26560 ?auto_26581 ) ) ( not ( = ?auto_26560 ?auto_26582 ) ) ( not ( = ?auto_26560 ?auto_26573 ) ) ( not ( = ?auto_26560 ?auto_26572 ) ) ( not ( = ?auto_26560 ?auto_26570 ) ) ( not ( = ?auto_26560 ?auto_26588 ) ) ( not ( = ?auto_26575 ?auto_26586 ) ) ( not ( = ?auto_26575 ?auto_26585 ) ) ( not ( = ?auto_26575 ?auto_26577 ) ) ( not ( = ?auto_26575 ?auto_26589 ) ) ( not ( = ?auto_26575 ?auto_26579 ) ) ( not ( = ?auto_26575 ?auto_26576 ) ) ( not ( = ?auto_26591 ?auto_26590 ) ) ( not ( = ?auto_26591 ?auto_26571 ) ) ( not ( = ?auto_26591 ?auto_26578 ) ) ( not ( = ?auto_26591 ?auto_26587 ) ) ( not ( = ?auto_26591 ?auto_26584 ) ) ( not ( = ?auto_26591 ?auto_26592 ) ) ( not ( = ?auto_26580 ?auto_26581 ) ) ( not ( = ?auto_26580 ?auto_26582 ) ) ( not ( = ?auto_26580 ?auto_26573 ) ) ( not ( = ?auto_26580 ?auto_26572 ) ) ( not ( = ?auto_26580 ?auto_26570 ) ) ( not ( = ?auto_26580 ?auto_26588 ) ) ( not ( = ?auto_26553 ?auto_26561 ) ) ( not ( = ?auto_26553 ?auto_26574 ) ) ( not ( = ?auto_26554 ?auto_26561 ) ) ( not ( = ?auto_26554 ?auto_26574 ) ) ( not ( = ?auto_26555 ?auto_26561 ) ) ( not ( = ?auto_26555 ?auto_26574 ) ) ( not ( = ?auto_26556 ?auto_26561 ) ) ( not ( = ?auto_26556 ?auto_26574 ) ) ( not ( = ?auto_26557 ?auto_26561 ) ) ( not ( = ?auto_26557 ?auto_26574 ) ) ( not ( = ?auto_26558 ?auto_26561 ) ) ( not ( = ?auto_26558 ?auto_26574 ) ) ( not ( = ?auto_26559 ?auto_26561 ) ) ( not ( = ?auto_26559 ?auto_26574 ) ) ( not ( = ?auto_26561 ?auto_26580 ) ) ( not ( = ?auto_26561 ?auto_26581 ) ) ( not ( = ?auto_26561 ?auto_26582 ) ) ( not ( = ?auto_26561 ?auto_26573 ) ) ( not ( = ?auto_26561 ?auto_26572 ) ) ( not ( = ?auto_26561 ?auto_26570 ) ) ( not ( = ?auto_26561 ?auto_26588 ) ) ( not ( = ?auto_26574 ?auto_26580 ) ) ( not ( = ?auto_26574 ?auto_26581 ) ) ( not ( = ?auto_26574 ?auto_26582 ) ) ( not ( = ?auto_26574 ?auto_26573 ) ) ( not ( = ?auto_26574 ?auto_26572 ) ) ( not ( = ?auto_26574 ?auto_26570 ) ) ( not ( = ?auto_26574 ?auto_26588 ) ) ( not ( = ?auto_26553 ?auto_26562 ) ) ( not ( = ?auto_26553 ?auto_26583 ) ) ( not ( = ?auto_26554 ?auto_26562 ) ) ( not ( = ?auto_26554 ?auto_26583 ) ) ( not ( = ?auto_26555 ?auto_26562 ) ) ( not ( = ?auto_26555 ?auto_26583 ) ) ( not ( = ?auto_26556 ?auto_26562 ) ) ( not ( = ?auto_26556 ?auto_26583 ) ) ( not ( = ?auto_26557 ?auto_26562 ) ) ( not ( = ?auto_26557 ?auto_26583 ) ) ( not ( = ?auto_26558 ?auto_26562 ) ) ( not ( = ?auto_26558 ?auto_26583 ) ) ( not ( = ?auto_26559 ?auto_26562 ) ) ( not ( = ?auto_26559 ?auto_26583 ) ) ( not ( = ?auto_26560 ?auto_26562 ) ) ( not ( = ?auto_26560 ?auto_26583 ) ) ( not ( = ?auto_26562 ?auto_26574 ) ) ( not ( = ?auto_26562 ?auto_26580 ) ) ( not ( = ?auto_26562 ?auto_26581 ) ) ( not ( = ?auto_26562 ?auto_26582 ) ) ( not ( = ?auto_26562 ?auto_26573 ) ) ( not ( = ?auto_26562 ?auto_26572 ) ) ( not ( = ?auto_26562 ?auto_26570 ) ) ( not ( = ?auto_26562 ?auto_26588 ) ) ( not ( = ?auto_26583 ?auto_26574 ) ) ( not ( = ?auto_26583 ?auto_26580 ) ) ( not ( = ?auto_26583 ?auto_26581 ) ) ( not ( = ?auto_26583 ?auto_26582 ) ) ( not ( = ?auto_26583 ?auto_26573 ) ) ( not ( = ?auto_26583 ?auto_26572 ) ) ( not ( = ?auto_26583 ?auto_26570 ) ) ( not ( = ?auto_26583 ?auto_26588 ) ) ( not ( = ?auto_26553 ?auto_26563 ) ) ( not ( = ?auto_26553 ?auto_26565 ) ) ( not ( = ?auto_26554 ?auto_26563 ) ) ( not ( = ?auto_26554 ?auto_26565 ) ) ( not ( = ?auto_26555 ?auto_26563 ) ) ( not ( = ?auto_26555 ?auto_26565 ) ) ( not ( = ?auto_26556 ?auto_26563 ) ) ( not ( = ?auto_26556 ?auto_26565 ) ) ( not ( = ?auto_26557 ?auto_26563 ) ) ( not ( = ?auto_26557 ?auto_26565 ) ) ( not ( = ?auto_26558 ?auto_26563 ) ) ( not ( = ?auto_26558 ?auto_26565 ) ) ( not ( = ?auto_26559 ?auto_26563 ) ) ( not ( = ?auto_26559 ?auto_26565 ) ) ( not ( = ?auto_26560 ?auto_26563 ) ) ( not ( = ?auto_26560 ?auto_26565 ) ) ( not ( = ?auto_26561 ?auto_26563 ) ) ( not ( = ?auto_26561 ?auto_26565 ) ) ( not ( = ?auto_26563 ?auto_26583 ) ) ( not ( = ?auto_26563 ?auto_26574 ) ) ( not ( = ?auto_26563 ?auto_26580 ) ) ( not ( = ?auto_26563 ?auto_26581 ) ) ( not ( = ?auto_26563 ?auto_26582 ) ) ( not ( = ?auto_26563 ?auto_26573 ) ) ( not ( = ?auto_26563 ?auto_26572 ) ) ( not ( = ?auto_26563 ?auto_26570 ) ) ( not ( = ?auto_26563 ?auto_26588 ) ) ( not ( = ?auto_26564 ?auto_26577 ) ) ( not ( = ?auto_26564 ?auto_26575 ) ) ( not ( = ?auto_26564 ?auto_26586 ) ) ( not ( = ?auto_26564 ?auto_26585 ) ) ( not ( = ?auto_26564 ?auto_26589 ) ) ( not ( = ?auto_26564 ?auto_26579 ) ) ( not ( = ?auto_26564 ?auto_26576 ) ) ( not ( = ?auto_26567 ?auto_26578 ) ) ( not ( = ?auto_26567 ?auto_26591 ) ) ( not ( = ?auto_26567 ?auto_26590 ) ) ( not ( = ?auto_26567 ?auto_26571 ) ) ( not ( = ?auto_26567 ?auto_26587 ) ) ( not ( = ?auto_26567 ?auto_26584 ) ) ( not ( = ?auto_26567 ?auto_26592 ) ) ( not ( = ?auto_26565 ?auto_26583 ) ) ( not ( = ?auto_26565 ?auto_26574 ) ) ( not ( = ?auto_26565 ?auto_26580 ) ) ( not ( = ?auto_26565 ?auto_26581 ) ) ( not ( = ?auto_26565 ?auto_26582 ) ) ( not ( = ?auto_26565 ?auto_26573 ) ) ( not ( = ?auto_26565 ?auto_26572 ) ) ( not ( = ?auto_26565 ?auto_26570 ) ) ( not ( = ?auto_26565 ?auto_26588 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_26553 ?auto_26554 ?auto_26555 ?auto_26556 ?auto_26557 ?auto_26558 ?auto_26559 ?auto_26560 ?auto_26561 ?auto_26562 )
      ( MAKE-1CRATE ?auto_26562 ?auto_26563 )
      ( MAKE-10CRATE-VERIFY ?auto_26553 ?auto_26554 ?auto_26555 ?auto_26556 ?auto_26557 ?auto_26558 ?auto_26559 ?auto_26560 ?auto_26561 ?auto_26562 ?auto_26563 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_26615 - SURFACE
      ?auto_26616 - SURFACE
      ?auto_26617 - SURFACE
      ?auto_26618 - SURFACE
      ?auto_26619 - SURFACE
      ?auto_26620 - SURFACE
      ?auto_26621 - SURFACE
      ?auto_26622 - SURFACE
      ?auto_26623 - SURFACE
      ?auto_26624 - SURFACE
      ?auto_26625 - SURFACE
      ?auto_26626 - SURFACE
    )
    :vars
    (
      ?auto_26630 - HOIST
      ?auto_26627 - PLACE
      ?auto_26629 - PLACE
      ?auto_26628 - HOIST
      ?auto_26631 - SURFACE
      ?auto_26647 - PLACE
      ?auto_26634 - HOIST
      ?auto_26646 - SURFACE
      ?auto_26657 - PLACE
      ?auto_26651 - HOIST
      ?auto_26645 - SURFACE
      ?auto_26652 - PLACE
      ?auto_26642 - HOIST
      ?auto_26656 - SURFACE
      ?auto_26654 - SURFACE
      ?auto_26638 - PLACE
      ?auto_26644 - HOIST
      ?auto_26640 - SURFACE
      ?auto_26648 - PLACE
      ?auto_26649 - HOIST
      ?auto_26633 - SURFACE
      ?auto_26636 - SURFACE
      ?auto_26658 - PLACE
      ?auto_26641 - HOIST
      ?auto_26635 - SURFACE
      ?auto_26653 - PLACE
      ?auto_26655 - HOIST
      ?auto_26637 - SURFACE
      ?auto_26650 - PLACE
      ?auto_26643 - HOIST
      ?auto_26639 - SURFACE
      ?auto_26632 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26630 ?auto_26627 ) ( IS-CRATE ?auto_26626 ) ( not ( = ?auto_26629 ?auto_26627 ) ) ( HOIST-AT ?auto_26628 ?auto_26629 ) ( AVAILABLE ?auto_26628 ) ( SURFACE-AT ?auto_26626 ?auto_26629 ) ( ON ?auto_26626 ?auto_26631 ) ( CLEAR ?auto_26626 ) ( not ( = ?auto_26625 ?auto_26626 ) ) ( not ( = ?auto_26625 ?auto_26631 ) ) ( not ( = ?auto_26626 ?auto_26631 ) ) ( not ( = ?auto_26630 ?auto_26628 ) ) ( IS-CRATE ?auto_26625 ) ( not ( = ?auto_26647 ?auto_26627 ) ) ( HOIST-AT ?auto_26634 ?auto_26647 ) ( AVAILABLE ?auto_26634 ) ( SURFACE-AT ?auto_26625 ?auto_26647 ) ( ON ?auto_26625 ?auto_26646 ) ( CLEAR ?auto_26625 ) ( not ( = ?auto_26624 ?auto_26625 ) ) ( not ( = ?auto_26624 ?auto_26646 ) ) ( not ( = ?auto_26625 ?auto_26646 ) ) ( not ( = ?auto_26630 ?auto_26634 ) ) ( IS-CRATE ?auto_26624 ) ( not ( = ?auto_26657 ?auto_26627 ) ) ( HOIST-AT ?auto_26651 ?auto_26657 ) ( SURFACE-AT ?auto_26624 ?auto_26657 ) ( ON ?auto_26624 ?auto_26645 ) ( CLEAR ?auto_26624 ) ( not ( = ?auto_26623 ?auto_26624 ) ) ( not ( = ?auto_26623 ?auto_26645 ) ) ( not ( = ?auto_26624 ?auto_26645 ) ) ( not ( = ?auto_26630 ?auto_26651 ) ) ( IS-CRATE ?auto_26623 ) ( not ( = ?auto_26652 ?auto_26627 ) ) ( HOIST-AT ?auto_26642 ?auto_26652 ) ( SURFACE-AT ?auto_26623 ?auto_26652 ) ( ON ?auto_26623 ?auto_26656 ) ( CLEAR ?auto_26623 ) ( not ( = ?auto_26622 ?auto_26623 ) ) ( not ( = ?auto_26622 ?auto_26656 ) ) ( not ( = ?auto_26623 ?auto_26656 ) ) ( not ( = ?auto_26630 ?auto_26642 ) ) ( IS-CRATE ?auto_26622 ) ( AVAILABLE ?auto_26642 ) ( SURFACE-AT ?auto_26622 ?auto_26652 ) ( ON ?auto_26622 ?auto_26654 ) ( CLEAR ?auto_26622 ) ( not ( = ?auto_26621 ?auto_26622 ) ) ( not ( = ?auto_26621 ?auto_26654 ) ) ( not ( = ?auto_26622 ?auto_26654 ) ) ( IS-CRATE ?auto_26621 ) ( not ( = ?auto_26638 ?auto_26627 ) ) ( HOIST-AT ?auto_26644 ?auto_26638 ) ( AVAILABLE ?auto_26644 ) ( SURFACE-AT ?auto_26621 ?auto_26638 ) ( ON ?auto_26621 ?auto_26640 ) ( CLEAR ?auto_26621 ) ( not ( = ?auto_26620 ?auto_26621 ) ) ( not ( = ?auto_26620 ?auto_26640 ) ) ( not ( = ?auto_26621 ?auto_26640 ) ) ( not ( = ?auto_26630 ?auto_26644 ) ) ( IS-CRATE ?auto_26620 ) ( not ( = ?auto_26648 ?auto_26627 ) ) ( HOIST-AT ?auto_26649 ?auto_26648 ) ( AVAILABLE ?auto_26649 ) ( SURFACE-AT ?auto_26620 ?auto_26648 ) ( ON ?auto_26620 ?auto_26633 ) ( CLEAR ?auto_26620 ) ( not ( = ?auto_26619 ?auto_26620 ) ) ( not ( = ?auto_26619 ?auto_26633 ) ) ( not ( = ?auto_26620 ?auto_26633 ) ) ( not ( = ?auto_26630 ?auto_26649 ) ) ( IS-CRATE ?auto_26619 ) ( AVAILABLE ?auto_26651 ) ( SURFACE-AT ?auto_26619 ?auto_26657 ) ( ON ?auto_26619 ?auto_26636 ) ( CLEAR ?auto_26619 ) ( not ( = ?auto_26618 ?auto_26619 ) ) ( not ( = ?auto_26618 ?auto_26636 ) ) ( not ( = ?auto_26619 ?auto_26636 ) ) ( IS-CRATE ?auto_26618 ) ( not ( = ?auto_26658 ?auto_26627 ) ) ( HOIST-AT ?auto_26641 ?auto_26658 ) ( AVAILABLE ?auto_26641 ) ( SURFACE-AT ?auto_26618 ?auto_26658 ) ( ON ?auto_26618 ?auto_26635 ) ( CLEAR ?auto_26618 ) ( not ( = ?auto_26617 ?auto_26618 ) ) ( not ( = ?auto_26617 ?auto_26635 ) ) ( not ( = ?auto_26618 ?auto_26635 ) ) ( not ( = ?auto_26630 ?auto_26641 ) ) ( IS-CRATE ?auto_26617 ) ( not ( = ?auto_26653 ?auto_26627 ) ) ( HOIST-AT ?auto_26655 ?auto_26653 ) ( AVAILABLE ?auto_26655 ) ( SURFACE-AT ?auto_26617 ?auto_26653 ) ( ON ?auto_26617 ?auto_26637 ) ( CLEAR ?auto_26617 ) ( not ( = ?auto_26616 ?auto_26617 ) ) ( not ( = ?auto_26616 ?auto_26637 ) ) ( not ( = ?auto_26617 ?auto_26637 ) ) ( not ( = ?auto_26630 ?auto_26655 ) ) ( SURFACE-AT ?auto_26615 ?auto_26627 ) ( CLEAR ?auto_26615 ) ( IS-CRATE ?auto_26616 ) ( AVAILABLE ?auto_26630 ) ( not ( = ?auto_26650 ?auto_26627 ) ) ( HOIST-AT ?auto_26643 ?auto_26650 ) ( AVAILABLE ?auto_26643 ) ( SURFACE-AT ?auto_26616 ?auto_26650 ) ( ON ?auto_26616 ?auto_26639 ) ( CLEAR ?auto_26616 ) ( TRUCK-AT ?auto_26632 ?auto_26627 ) ( not ( = ?auto_26615 ?auto_26616 ) ) ( not ( = ?auto_26615 ?auto_26639 ) ) ( not ( = ?auto_26616 ?auto_26639 ) ) ( not ( = ?auto_26630 ?auto_26643 ) ) ( not ( = ?auto_26615 ?auto_26617 ) ) ( not ( = ?auto_26615 ?auto_26637 ) ) ( not ( = ?auto_26617 ?auto_26639 ) ) ( not ( = ?auto_26653 ?auto_26650 ) ) ( not ( = ?auto_26655 ?auto_26643 ) ) ( not ( = ?auto_26637 ?auto_26639 ) ) ( not ( = ?auto_26615 ?auto_26618 ) ) ( not ( = ?auto_26615 ?auto_26635 ) ) ( not ( = ?auto_26616 ?auto_26618 ) ) ( not ( = ?auto_26616 ?auto_26635 ) ) ( not ( = ?auto_26618 ?auto_26637 ) ) ( not ( = ?auto_26618 ?auto_26639 ) ) ( not ( = ?auto_26658 ?auto_26653 ) ) ( not ( = ?auto_26658 ?auto_26650 ) ) ( not ( = ?auto_26641 ?auto_26655 ) ) ( not ( = ?auto_26641 ?auto_26643 ) ) ( not ( = ?auto_26635 ?auto_26637 ) ) ( not ( = ?auto_26635 ?auto_26639 ) ) ( not ( = ?auto_26615 ?auto_26619 ) ) ( not ( = ?auto_26615 ?auto_26636 ) ) ( not ( = ?auto_26616 ?auto_26619 ) ) ( not ( = ?auto_26616 ?auto_26636 ) ) ( not ( = ?auto_26617 ?auto_26619 ) ) ( not ( = ?auto_26617 ?auto_26636 ) ) ( not ( = ?auto_26619 ?auto_26635 ) ) ( not ( = ?auto_26619 ?auto_26637 ) ) ( not ( = ?auto_26619 ?auto_26639 ) ) ( not ( = ?auto_26657 ?auto_26658 ) ) ( not ( = ?auto_26657 ?auto_26653 ) ) ( not ( = ?auto_26657 ?auto_26650 ) ) ( not ( = ?auto_26651 ?auto_26641 ) ) ( not ( = ?auto_26651 ?auto_26655 ) ) ( not ( = ?auto_26651 ?auto_26643 ) ) ( not ( = ?auto_26636 ?auto_26635 ) ) ( not ( = ?auto_26636 ?auto_26637 ) ) ( not ( = ?auto_26636 ?auto_26639 ) ) ( not ( = ?auto_26615 ?auto_26620 ) ) ( not ( = ?auto_26615 ?auto_26633 ) ) ( not ( = ?auto_26616 ?auto_26620 ) ) ( not ( = ?auto_26616 ?auto_26633 ) ) ( not ( = ?auto_26617 ?auto_26620 ) ) ( not ( = ?auto_26617 ?auto_26633 ) ) ( not ( = ?auto_26618 ?auto_26620 ) ) ( not ( = ?auto_26618 ?auto_26633 ) ) ( not ( = ?auto_26620 ?auto_26636 ) ) ( not ( = ?auto_26620 ?auto_26635 ) ) ( not ( = ?auto_26620 ?auto_26637 ) ) ( not ( = ?auto_26620 ?auto_26639 ) ) ( not ( = ?auto_26648 ?auto_26657 ) ) ( not ( = ?auto_26648 ?auto_26658 ) ) ( not ( = ?auto_26648 ?auto_26653 ) ) ( not ( = ?auto_26648 ?auto_26650 ) ) ( not ( = ?auto_26649 ?auto_26651 ) ) ( not ( = ?auto_26649 ?auto_26641 ) ) ( not ( = ?auto_26649 ?auto_26655 ) ) ( not ( = ?auto_26649 ?auto_26643 ) ) ( not ( = ?auto_26633 ?auto_26636 ) ) ( not ( = ?auto_26633 ?auto_26635 ) ) ( not ( = ?auto_26633 ?auto_26637 ) ) ( not ( = ?auto_26633 ?auto_26639 ) ) ( not ( = ?auto_26615 ?auto_26621 ) ) ( not ( = ?auto_26615 ?auto_26640 ) ) ( not ( = ?auto_26616 ?auto_26621 ) ) ( not ( = ?auto_26616 ?auto_26640 ) ) ( not ( = ?auto_26617 ?auto_26621 ) ) ( not ( = ?auto_26617 ?auto_26640 ) ) ( not ( = ?auto_26618 ?auto_26621 ) ) ( not ( = ?auto_26618 ?auto_26640 ) ) ( not ( = ?auto_26619 ?auto_26621 ) ) ( not ( = ?auto_26619 ?auto_26640 ) ) ( not ( = ?auto_26621 ?auto_26633 ) ) ( not ( = ?auto_26621 ?auto_26636 ) ) ( not ( = ?auto_26621 ?auto_26635 ) ) ( not ( = ?auto_26621 ?auto_26637 ) ) ( not ( = ?auto_26621 ?auto_26639 ) ) ( not ( = ?auto_26638 ?auto_26648 ) ) ( not ( = ?auto_26638 ?auto_26657 ) ) ( not ( = ?auto_26638 ?auto_26658 ) ) ( not ( = ?auto_26638 ?auto_26653 ) ) ( not ( = ?auto_26638 ?auto_26650 ) ) ( not ( = ?auto_26644 ?auto_26649 ) ) ( not ( = ?auto_26644 ?auto_26651 ) ) ( not ( = ?auto_26644 ?auto_26641 ) ) ( not ( = ?auto_26644 ?auto_26655 ) ) ( not ( = ?auto_26644 ?auto_26643 ) ) ( not ( = ?auto_26640 ?auto_26633 ) ) ( not ( = ?auto_26640 ?auto_26636 ) ) ( not ( = ?auto_26640 ?auto_26635 ) ) ( not ( = ?auto_26640 ?auto_26637 ) ) ( not ( = ?auto_26640 ?auto_26639 ) ) ( not ( = ?auto_26615 ?auto_26622 ) ) ( not ( = ?auto_26615 ?auto_26654 ) ) ( not ( = ?auto_26616 ?auto_26622 ) ) ( not ( = ?auto_26616 ?auto_26654 ) ) ( not ( = ?auto_26617 ?auto_26622 ) ) ( not ( = ?auto_26617 ?auto_26654 ) ) ( not ( = ?auto_26618 ?auto_26622 ) ) ( not ( = ?auto_26618 ?auto_26654 ) ) ( not ( = ?auto_26619 ?auto_26622 ) ) ( not ( = ?auto_26619 ?auto_26654 ) ) ( not ( = ?auto_26620 ?auto_26622 ) ) ( not ( = ?auto_26620 ?auto_26654 ) ) ( not ( = ?auto_26622 ?auto_26640 ) ) ( not ( = ?auto_26622 ?auto_26633 ) ) ( not ( = ?auto_26622 ?auto_26636 ) ) ( not ( = ?auto_26622 ?auto_26635 ) ) ( not ( = ?auto_26622 ?auto_26637 ) ) ( not ( = ?auto_26622 ?auto_26639 ) ) ( not ( = ?auto_26652 ?auto_26638 ) ) ( not ( = ?auto_26652 ?auto_26648 ) ) ( not ( = ?auto_26652 ?auto_26657 ) ) ( not ( = ?auto_26652 ?auto_26658 ) ) ( not ( = ?auto_26652 ?auto_26653 ) ) ( not ( = ?auto_26652 ?auto_26650 ) ) ( not ( = ?auto_26642 ?auto_26644 ) ) ( not ( = ?auto_26642 ?auto_26649 ) ) ( not ( = ?auto_26642 ?auto_26651 ) ) ( not ( = ?auto_26642 ?auto_26641 ) ) ( not ( = ?auto_26642 ?auto_26655 ) ) ( not ( = ?auto_26642 ?auto_26643 ) ) ( not ( = ?auto_26654 ?auto_26640 ) ) ( not ( = ?auto_26654 ?auto_26633 ) ) ( not ( = ?auto_26654 ?auto_26636 ) ) ( not ( = ?auto_26654 ?auto_26635 ) ) ( not ( = ?auto_26654 ?auto_26637 ) ) ( not ( = ?auto_26654 ?auto_26639 ) ) ( not ( = ?auto_26615 ?auto_26623 ) ) ( not ( = ?auto_26615 ?auto_26656 ) ) ( not ( = ?auto_26616 ?auto_26623 ) ) ( not ( = ?auto_26616 ?auto_26656 ) ) ( not ( = ?auto_26617 ?auto_26623 ) ) ( not ( = ?auto_26617 ?auto_26656 ) ) ( not ( = ?auto_26618 ?auto_26623 ) ) ( not ( = ?auto_26618 ?auto_26656 ) ) ( not ( = ?auto_26619 ?auto_26623 ) ) ( not ( = ?auto_26619 ?auto_26656 ) ) ( not ( = ?auto_26620 ?auto_26623 ) ) ( not ( = ?auto_26620 ?auto_26656 ) ) ( not ( = ?auto_26621 ?auto_26623 ) ) ( not ( = ?auto_26621 ?auto_26656 ) ) ( not ( = ?auto_26623 ?auto_26654 ) ) ( not ( = ?auto_26623 ?auto_26640 ) ) ( not ( = ?auto_26623 ?auto_26633 ) ) ( not ( = ?auto_26623 ?auto_26636 ) ) ( not ( = ?auto_26623 ?auto_26635 ) ) ( not ( = ?auto_26623 ?auto_26637 ) ) ( not ( = ?auto_26623 ?auto_26639 ) ) ( not ( = ?auto_26656 ?auto_26654 ) ) ( not ( = ?auto_26656 ?auto_26640 ) ) ( not ( = ?auto_26656 ?auto_26633 ) ) ( not ( = ?auto_26656 ?auto_26636 ) ) ( not ( = ?auto_26656 ?auto_26635 ) ) ( not ( = ?auto_26656 ?auto_26637 ) ) ( not ( = ?auto_26656 ?auto_26639 ) ) ( not ( = ?auto_26615 ?auto_26624 ) ) ( not ( = ?auto_26615 ?auto_26645 ) ) ( not ( = ?auto_26616 ?auto_26624 ) ) ( not ( = ?auto_26616 ?auto_26645 ) ) ( not ( = ?auto_26617 ?auto_26624 ) ) ( not ( = ?auto_26617 ?auto_26645 ) ) ( not ( = ?auto_26618 ?auto_26624 ) ) ( not ( = ?auto_26618 ?auto_26645 ) ) ( not ( = ?auto_26619 ?auto_26624 ) ) ( not ( = ?auto_26619 ?auto_26645 ) ) ( not ( = ?auto_26620 ?auto_26624 ) ) ( not ( = ?auto_26620 ?auto_26645 ) ) ( not ( = ?auto_26621 ?auto_26624 ) ) ( not ( = ?auto_26621 ?auto_26645 ) ) ( not ( = ?auto_26622 ?auto_26624 ) ) ( not ( = ?auto_26622 ?auto_26645 ) ) ( not ( = ?auto_26624 ?auto_26656 ) ) ( not ( = ?auto_26624 ?auto_26654 ) ) ( not ( = ?auto_26624 ?auto_26640 ) ) ( not ( = ?auto_26624 ?auto_26633 ) ) ( not ( = ?auto_26624 ?auto_26636 ) ) ( not ( = ?auto_26624 ?auto_26635 ) ) ( not ( = ?auto_26624 ?auto_26637 ) ) ( not ( = ?auto_26624 ?auto_26639 ) ) ( not ( = ?auto_26645 ?auto_26656 ) ) ( not ( = ?auto_26645 ?auto_26654 ) ) ( not ( = ?auto_26645 ?auto_26640 ) ) ( not ( = ?auto_26645 ?auto_26633 ) ) ( not ( = ?auto_26645 ?auto_26636 ) ) ( not ( = ?auto_26645 ?auto_26635 ) ) ( not ( = ?auto_26645 ?auto_26637 ) ) ( not ( = ?auto_26645 ?auto_26639 ) ) ( not ( = ?auto_26615 ?auto_26625 ) ) ( not ( = ?auto_26615 ?auto_26646 ) ) ( not ( = ?auto_26616 ?auto_26625 ) ) ( not ( = ?auto_26616 ?auto_26646 ) ) ( not ( = ?auto_26617 ?auto_26625 ) ) ( not ( = ?auto_26617 ?auto_26646 ) ) ( not ( = ?auto_26618 ?auto_26625 ) ) ( not ( = ?auto_26618 ?auto_26646 ) ) ( not ( = ?auto_26619 ?auto_26625 ) ) ( not ( = ?auto_26619 ?auto_26646 ) ) ( not ( = ?auto_26620 ?auto_26625 ) ) ( not ( = ?auto_26620 ?auto_26646 ) ) ( not ( = ?auto_26621 ?auto_26625 ) ) ( not ( = ?auto_26621 ?auto_26646 ) ) ( not ( = ?auto_26622 ?auto_26625 ) ) ( not ( = ?auto_26622 ?auto_26646 ) ) ( not ( = ?auto_26623 ?auto_26625 ) ) ( not ( = ?auto_26623 ?auto_26646 ) ) ( not ( = ?auto_26625 ?auto_26645 ) ) ( not ( = ?auto_26625 ?auto_26656 ) ) ( not ( = ?auto_26625 ?auto_26654 ) ) ( not ( = ?auto_26625 ?auto_26640 ) ) ( not ( = ?auto_26625 ?auto_26633 ) ) ( not ( = ?auto_26625 ?auto_26636 ) ) ( not ( = ?auto_26625 ?auto_26635 ) ) ( not ( = ?auto_26625 ?auto_26637 ) ) ( not ( = ?auto_26625 ?auto_26639 ) ) ( not ( = ?auto_26647 ?auto_26657 ) ) ( not ( = ?auto_26647 ?auto_26652 ) ) ( not ( = ?auto_26647 ?auto_26638 ) ) ( not ( = ?auto_26647 ?auto_26648 ) ) ( not ( = ?auto_26647 ?auto_26658 ) ) ( not ( = ?auto_26647 ?auto_26653 ) ) ( not ( = ?auto_26647 ?auto_26650 ) ) ( not ( = ?auto_26634 ?auto_26651 ) ) ( not ( = ?auto_26634 ?auto_26642 ) ) ( not ( = ?auto_26634 ?auto_26644 ) ) ( not ( = ?auto_26634 ?auto_26649 ) ) ( not ( = ?auto_26634 ?auto_26641 ) ) ( not ( = ?auto_26634 ?auto_26655 ) ) ( not ( = ?auto_26634 ?auto_26643 ) ) ( not ( = ?auto_26646 ?auto_26645 ) ) ( not ( = ?auto_26646 ?auto_26656 ) ) ( not ( = ?auto_26646 ?auto_26654 ) ) ( not ( = ?auto_26646 ?auto_26640 ) ) ( not ( = ?auto_26646 ?auto_26633 ) ) ( not ( = ?auto_26646 ?auto_26636 ) ) ( not ( = ?auto_26646 ?auto_26635 ) ) ( not ( = ?auto_26646 ?auto_26637 ) ) ( not ( = ?auto_26646 ?auto_26639 ) ) ( not ( = ?auto_26615 ?auto_26626 ) ) ( not ( = ?auto_26615 ?auto_26631 ) ) ( not ( = ?auto_26616 ?auto_26626 ) ) ( not ( = ?auto_26616 ?auto_26631 ) ) ( not ( = ?auto_26617 ?auto_26626 ) ) ( not ( = ?auto_26617 ?auto_26631 ) ) ( not ( = ?auto_26618 ?auto_26626 ) ) ( not ( = ?auto_26618 ?auto_26631 ) ) ( not ( = ?auto_26619 ?auto_26626 ) ) ( not ( = ?auto_26619 ?auto_26631 ) ) ( not ( = ?auto_26620 ?auto_26626 ) ) ( not ( = ?auto_26620 ?auto_26631 ) ) ( not ( = ?auto_26621 ?auto_26626 ) ) ( not ( = ?auto_26621 ?auto_26631 ) ) ( not ( = ?auto_26622 ?auto_26626 ) ) ( not ( = ?auto_26622 ?auto_26631 ) ) ( not ( = ?auto_26623 ?auto_26626 ) ) ( not ( = ?auto_26623 ?auto_26631 ) ) ( not ( = ?auto_26624 ?auto_26626 ) ) ( not ( = ?auto_26624 ?auto_26631 ) ) ( not ( = ?auto_26626 ?auto_26646 ) ) ( not ( = ?auto_26626 ?auto_26645 ) ) ( not ( = ?auto_26626 ?auto_26656 ) ) ( not ( = ?auto_26626 ?auto_26654 ) ) ( not ( = ?auto_26626 ?auto_26640 ) ) ( not ( = ?auto_26626 ?auto_26633 ) ) ( not ( = ?auto_26626 ?auto_26636 ) ) ( not ( = ?auto_26626 ?auto_26635 ) ) ( not ( = ?auto_26626 ?auto_26637 ) ) ( not ( = ?auto_26626 ?auto_26639 ) ) ( not ( = ?auto_26629 ?auto_26647 ) ) ( not ( = ?auto_26629 ?auto_26657 ) ) ( not ( = ?auto_26629 ?auto_26652 ) ) ( not ( = ?auto_26629 ?auto_26638 ) ) ( not ( = ?auto_26629 ?auto_26648 ) ) ( not ( = ?auto_26629 ?auto_26658 ) ) ( not ( = ?auto_26629 ?auto_26653 ) ) ( not ( = ?auto_26629 ?auto_26650 ) ) ( not ( = ?auto_26628 ?auto_26634 ) ) ( not ( = ?auto_26628 ?auto_26651 ) ) ( not ( = ?auto_26628 ?auto_26642 ) ) ( not ( = ?auto_26628 ?auto_26644 ) ) ( not ( = ?auto_26628 ?auto_26649 ) ) ( not ( = ?auto_26628 ?auto_26641 ) ) ( not ( = ?auto_26628 ?auto_26655 ) ) ( not ( = ?auto_26628 ?auto_26643 ) ) ( not ( = ?auto_26631 ?auto_26646 ) ) ( not ( = ?auto_26631 ?auto_26645 ) ) ( not ( = ?auto_26631 ?auto_26656 ) ) ( not ( = ?auto_26631 ?auto_26654 ) ) ( not ( = ?auto_26631 ?auto_26640 ) ) ( not ( = ?auto_26631 ?auto_26633 ) ) ( not ( = ?auto_26631 ?auto_26636 ) ) ( not ( = ?auto_26631 ?auto_26635 ) ) ( not ( = ?auto_26631 ?auto_26637 ) ) ( not ( = ?auto_26631 ?auto_26639 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_26615 ?auto_26616 ?auto_26617 ?auto_26618 ?auto_26619 ?auto_26620 ?auto_26621 ?auto_26622 ?auto_26623 ?auto_26624 ?auto_26625 )
      ( MAKE-1CRATE ?auto_26625 ?auto_26626 )
      ( MAKE-11CRATE-VERIFY ?auto_26615 ?auto_26616 ?auto_26617 ?auto_26618 ?auto_26619 ?auto_26620 ?auto_26621 ?auto_26622 ?auto_26623 ?auto_26624 ?auto_26625 ?auto_26626 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_26682 - SURFACE
      ?auto_26683 - SURFACE
      ?auto_26684 - SURFACE
      ?auto_26685 - SURFACE
      ?auto_26686 - SURFACE
      ?auto_26687 - SURFACE
      ?auto_26688 - SURFACE
      ?auto_26689 - SURFACE
      ?auto_26690 - SURFACE
      ?auto_26691 - SURFACE
      ?auto_26692 - SURFACE
      ?auto_26693 - SURFACE
      ?auto_26694 - SURFACE
    )
    :vars
    (
      ?auto_26696 - HOIST
      ?auto_26700 - PLACE
      ?auto_26698 - PLACE
      ?auto_26697 - HOIST
      ?auto_26695 - SURFACE
      ?auto_26706 - PLACE
      ?auto_26729 - HOIST
      ?auto_26720 - SURFACE
      ?auto_26708 - PLACE
      ?auto_26712 - HOIST
      ?auto_26717 - SURFACE
      ?auto_26724 - PLACE
      ?auto_26714 - HOIST
      ?auto_26704 - SURFACE
      ?auto_26707 - PLACE
      ?auto_26721 - HOIST
      ?auto_26723 - SURFACE
      ?auto_26727 - SURFACE
      ?auto_26726 - PLACE
      ?auto_26709 - HOIST
      ?auto_26705 - SURFACE
      ?auto_26719 - PLACE
      ?auto_26728 - HOIST
      ?auto_26711 - SURFACE
      ?auto_26710 - SURFACE
      ?auto_26703 - PLACE
      ?auto_26713 - HOIST
      ?auto_26718 - SURFACE
      ?auto_26722 - PLACE
      ?auto_26725 - HOIST
      ?auto_26715 - SURFACE
      ?auto_26702 - PLACE
      ?auto_26716 - HOIST
      ?auto_26701 - SURFACE
      ?auto_26699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26696 ?auto_26700 ) ( IS-CRATE ?auto_26694 ) ( not ( = ?auto_26698 ?auto_26700 ) ) ( HOIST-AT ?auto_26697 ?auto_26698 ) ( AVAILABLE ?auto_26697 ) ( SURFACE-AT ?auto_26694 ?auto_26698 ) ( ON ?auto_26694 ?auto_26695 ) ( CLEAR ?auto_26694 ) ( not ( = ?auto_26693 ?auto_26694 ) ) ( not ( = ?auto_26693 ?auto_26695 ) ) ( not ( = ?auto_26694 ?auto_26695 ) ) ( not ( = ?auto_26696 ?auto_26697 ) ) ( IS-CRATE ?auto_26693 ) ( not ( = ?auto_26706 ?auto_26700 ) ) ( HOIST-AT ?auto_26729 ?auto_26706 ) ( AVAILABLE ?auto_26729 ) ( SURFACE-AT ?auto_26693 ?auto_26706 ) ( ON ?auto_26693 ?auto_26720 ) ( CLEAR ?auto_26693 ) ( not ( = ?auto_26692 ?auto_26693 ) ) ( not ( = ?auto_26692 ?auto_26720 ) ) ( not ( = ?auto_26693 ?auto_26720 ) ) ( not ( = ?auto_26696 ?auto_26729 ) ) ( IS-CRATE ?auto_26692 ) ( not ( = ?auto_26708 ?auto_26700 ) ) ( HOIST-AT ?auto_26712 ?auto_26708 ) ( AVAILABLE ?auto_26712 ) ( SURFACE-AT ?auto_26692 ?auto_26708 ) ( ON ?auto_26692 ?auto_26717 ) ( CLEAR ?auto_26692 ) ( not ( = ?auto_26691 ?auto_26692 ) ) ( not ( = ?auto_26691 ?auto_26717 ) ) ( not ( = ?auto_26692 ?auto_26717 ) ) ( not ( = ?auto_26696 ?auto_26712 ) ) ( IS-CRATE ?auto_26691 ) ( not ( = ?auto_26724 ?auto_26700 ) ) ( HOIST-AT ?auto_26714 ?auto_26724 ) ( SURFACE-AT ?auto_26691 ?auto_26724 ) ( ON ?auto_26691 ?auto_26704 ) ( CLEAR ?auto_26691 ) ( not ( = ?auto_26690 ?auto_26691 ) ) ( not ( = ?auto_26690 ?auto_26704 ) ) ( not ( = ?auto_26691 ?auto_26704 ) ) ( not ( = ?auto_26696 ?auto_26714 ) ) ( IS-CRATE ?auto_26690 ) ( not ( = ?auto_26707 ?auto_26700 ) ) ( HOIST-AT ?auto_26721 ?auto_26707 ) ( SURFACE-AT ?auto_26690 ?auto_26707 ) ( ON ?auto_26690 ?auto_26723 ) ( CLEAR ?auto_26690 ) ( not ( = ?auto_26689 ?auto_26690 ) ) ( not ( = ?auto_26689 ?auto_26723 ) ) ( not ( = ?auto_26690 ?auto_26723 ) ) ( not ( = ?auto_26696 ?auto_26721 ) ) ( IS-CRATE ?auto_26689 ) ( AVAILABLE ?auto_26721 ) ( SURFACE-AT ?auto_26689 ?auto_26707 ) ( ON ?auto_26689 ?auto_26727 ) ( CLEAR ?auto_26689 ) ( not ( = ?auto_26688 ?auto_26689 ) ) ( not ( = ?auto_26688 ?auto_26727 ) ) ( not ( = ?auto_26689 ?auto_26727 ) ) ( IS-CRATE ?auto_26688 ) ( not ( = ?auto_26726 ?auto_26700 ) ) ( HOIST-AT ?auto_26709 ?auto_26726 ) ( AVAILABLE ?auto_26709 ) ( SURFACE-AT ?auto_26688 ?auto_26726 ) ( ON ?auto_26688 ?auto_26705 ) ( CLEAR ?auto_26688 ) ( not ( = ?auto_26687 ?auto_26688 ) ) ( not ( = ?auto_26687 ?auto_26705 ) ) ( not ( = ?auto_26688 ?auto_26705 ) ) ( not ( = ?auto_26696 ?auto_26709 ) ) ( IS-CRATE ?auto_26687 ) ( not ( = ?auto_26719 ?auto_26700 ) ) ( HOIST-AT ?auto_26728 ?auto_26719 ) ( AVAILABLE ?auto_26728 ) ( SURFACE-AT ?auto_26687 ?auto_26719 ) ( ON ?auto_26687 ?auto_26711 ) ( CLEAR ?auto_26687 ) ( not ( = ?auto_26686 ?auto_26687 ) ) ( not ( = ?auto_26686 ?auto_26711 ) ) ( not ( = ?auto_26687 ?auto_26711 ) ) ( not ( = ?auto_26696 ?auto_26728 ) ) ( IS-CRATE ?auto_26686 ) ( AVAILABLE ?auto_26714 ) ( SURFACE-AT ?auto_26686 ?auto_26724 ) ( ON ?auto_26686 ?auto_26710 ) ( CLEAR ?auto_26686 ) ( not ( = ?auto_26685 ?auto_26686 ) ) ( not ( = ?auto_26685 ?auto_26710 ) ) ( not ( = ?auto_26686 ?auto_26710 ) ) ( IS-CRATE ?auto_26685 ) ( not ( = ?auto_26703 ?auto_26700 ) ) ( HOIST-AT ?auto_26713 ?auto_26703 ) ( AVAILABLE ?auto_26713 ) ( SURFACE-AT ?auto_26685 ?auto_26703 ) ( ON ?auto_26685 ?auto_26718 ) ( CLEAR ?auto_26685 ) ( not ( = ?auto_26684 ?auto_26685 ) ) ( not ( = ?auto_26684 ?auto_26718 ) ) ( not ( = ?auto_26685 ?auto_26718 ) ) ( not ( = ?auto_26696 ?auto_26713 ) ) ( IS-CRATE ?auto_26684 ) ( not ( = ?auto_26722 ?auto_26700 ) ) ( HOIST-AT ?auto_26725 ?auto_26722 ) ( AVAILABLE ?auto_26725 ) ( SURFACE-AT ?auto_26684 ?auto_26722 ) ( ON ?auto_26684 ?auto_26715 ) ( CLEAR ?auto_26684 ) ( not ( = ?auto_26683 ?auto_26684 ) ) ( not ( = ?auto_26683 ?auto_26715 ) ) ( not ( = ?auto_26684 ?auto_26715 ) ) ( not ( = ?auto_26696 ?auto_26725 ) ) ( SURFACE-AT ?auto_26682 ?auto_26700 ) ( CLEAR ?auto_26682 ) ( IS-CRATE ?auto_26683 ) ( AVAILABLE ?auto_26696 ) ( not ( = ?auto_26702 ?auto_26700 ) ) ( HOIST-AT ?auto_26716 ?auto_26702 ) ( AVAILABLE ?auto_26716 ) ( SURFACE-AT ?auto_26683 ?auto_26702 ) ( ON ?auto_26683 ?auto_26701 ) ( CLEAR ?auto_26683 ) ( TRUCK-AT ?auto_26699 ?auto_26700 ) ( not ( = ?auto_26682 ?auto_26683 ) ) ( not ( = ?auto_26682 ?auto_26701 ) ) ( not ( = ?auto_26683 ?auto_26701 ) ) ( not ( = ?auto_26696 ?auto_26716 ) ) ( not ( = ?auto_26682 ?auto_26684 ) ) ( not ( = ?auto_26682 ?auto_26715 ) ) ( not ( = ?auto_26684 ?auto_26701 ) ) ( not ( = ?auto_26722 ?auto_26702 ) ) ( not ( = ?auto_26725 ?auto_26716 ) ) ( not ( = ?auto_26715 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26685 ) ) ( not ( = ?auto_26682 ?auto_26718 ) ) ( not ( = ?auto_26683 ?auto_26685 ) ) ( not ( = ?auto_26683 ?auto_26718 ) ) ( not ( = ?auto_26685 ?auto_26715 ) ) ( not ( = ?auto_26685 ?auto_26701 ) ) ( not ( = ?auto_26703 ?auto_26722 ) ) ( not ( = ?auto_26703 ?auto_26702 ) ) ( not ( = ?auto_26713 ?auto_26725 ) ) ( not ( = ?auto_26713 ?auto_26716 ) ) ( not ( = ?auto_26718 ?auto_26715 ) ) ( not ( = ?auto_26718 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26686 ) ) ( not ( = ?auto_26682 ?auto_26710 ) ) ( not ( = ?auto_26683 ?auto_26686 ) ) ( not ( = ?auto_26683 ?auto_26710 ) ) ( not ( = ?auto_26684 ?auto_26686 ) ) ( not ( = ?auto_26684 ?auto_26710 ) ) ( not ( = ?auto_26686 ?auto_26718 ) ) ( not ( = ?auto_26686 ?auto_26715 ) ) ( not ( = ?auto_26686 ?auto_26701 ) ) ( not ( = ?auto_26724 ?auto_26703 ) ) ( not ( = ?auto_26724 ?auto_26722 ) ) ( not ( = ?auto_26724 ?auto_26702 ) ) ( not ( = ?auto_26714 ?auto_26713 ) ) ( not ( = ?auto_26714 ?auto_26725 ) ) ( not ( = ?auto_26714 ?auto_26716 ) ) ( not ( = ?auto_26710 ?auto_26718 ) ) ( not ( = ?auto_26710 ?auto_26715 ) ) ( not ( = ?auto_26710 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26687 ) ) ( not ( = ?auto_26682 ?auto_26711 ) ) ( not ( = ?auto_26683 ?auto_26687 ) ) ( not ( = ?auto_26683 ?auto_26711 ) ) ( not ( = ?auto_26684 ?auto_26687 ) ) ( not ( = ?auto_26684 ?auto_26711 ) ) ( not ( = ?auto_26685 ?auto_26687 ) ) ( not ( = ?auto_26685 ?auto_26711 ) ) ( not ( = ?auto_26687 ?auto_26710 ) ) ( not ( = ?auto_26687 ?auto_26718 ) ) ( not ( = ?auto_26687 ?auto_26715 ) ) ( not ( = ?auto_26687 ?auto_26701 ) ) ( not ( = ?auto_26719 ?auto_26724 ) ) ( not ( = ?auto_26719 ?auto_26703 ) ) ( not ( = ?auto_26719 ?auto_26722 ) ) ( not ( = ?auto_26719 ?auto_26702 ) ) ( not ( = ?auto_26728 ?auto_26714 ) ) ( not ( = ?auto_26728 ?auto_26713 ) ) ( not ( = ?auto_26728 ?auto_26725 ) ) ( not ( = ?auto_26728 ?auto_26716 ) ) ( not ( = ?auto_26711 ?auto_26710 ) ) ( not ( = ?auto_26711 ?auto_26718 ) ) ( not ( = ?auto_26711 ?auto_26715 ) ) ( not ( = ?auto_26711 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26688 ) ) ( not ( = ?auto_26682 ?auto_26705 ) ) ( not ( = ?auto_26683 ?auto_26688 ) ) ( not ( = ?auto_26683 ?auto_26705 ) ) ( not ( = ?auto_26684 ?auto_26688 ) ) ( not ( = ?auto_26684 ?auto_26705 ) ) ( not ( = ?auto_26685 ?auto_26688 ) ) ( not ( = ?auto_26685 ?auto_26705 ) ) ( not ( = ?auto_26686 ?auto_26688 ) ) ( not ( = ?auto_26686 ?auto_26705 ) ) ( not ( = ?auto_26688 ?auto_26711 ) ) ( not ( = ?auto_26688 ?auto_26710 ) ) ( not ( = ?auto_26688 ?auto_26718 ) ) ( not ( = ?auto_26688 ?auto_26715 ) ) ( not ( = ?auto_26688 ?auto_26701 ) ) ( not ( = ?auto_26726 ?auto_26719 ) ) ( not ( = ?auto_26726 ?auto_26724 ) ) ( not ( = ?auto_26726 ?auto_26703 ) ) ( not ( = ?auto_26726 ?auto_26722 ) ) ( not ( = ?auto_26726 ?auto_26702 ) ) ( not ( = ?auto_26709 ?auto_26728 ) ) ( not ( = ?auto_26709 ?auto_26714 ) ) ( not ( = ?auto_26709 ?auto_26713 ) ) ( not ( = ?auto_26709 ?auto_26725 ) ) ( not ( = ?auto_26709 ?auto_26716 ) ) ( not ( = ?auto_26705 ?auto_26711 ) ) ( not ( = ?auto_26705 ?auto_26710 ) ) ( not ( = ?auto_26705 ?auto_26718 ) ) ( not ( = ?auto_26705 ?auto_26715 ) ) ( not ( = ?auto_26705 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26689 ) ) ( not ( = ?auto_26682 ?auto_26727 ) ) ( not ( = ?auto_26683 ?auto_26689 ) ) ( not ( = ?auto_26683 ?auto_26727 ) ) ( not ( = ?auto_26684 ?auto_26689 ) ) ( not ( = ?auto_26684 ?auto_26727 ) ) ( not ( = ?auto_26685 ?auto_26689 ) ) ( not ( = ?auto_26685 ?auto_26727 ) ) ( not ( = ?auto_26686 ?auto_26689 ) ) ( not ( = ?auto_26686 ?auto_26727 ) ) ( not ( = ?auto_26687 ?auto_26689 ) ) ( not ( = ?auto_26687 ?auto_26727 ) ) ( not ( = ?auto_26689 ?auto_26705 ) ) ( not ( = ?auto_26689 ?auto_26711 ) ) ( not ( = ?auto_26689 ?auto_26710 ) ) ( not ( = ?auto_26689 ?auto_26718 ) ) ( not ( = ?auto_26689 ?auto_26715 ) ) ( not ( = ?auto_26689 ?auto_26701 ) ) ( not ( = ?auto_26707 ?auto_26726 ) ) ( not ( = ?auto_26707 ?auto_26719 ) ) ( not ( = ?auto_26707 ?auto_26724 ) ) ( not ( = ?auto_26707 ?auto_26703 ) ) ( not ( = ?auto_26707 ?auto_26722 ) ) ( not ( = ?auto_26707 ?auto_26702 ) ) ( not ( = ?auto_26721 ?auto_26709 ) ) ( not ( = ?auto_26721 ?auto_26728 ) ) ( not ( = ?auto_26721 ?auto_26714 ) ) ( not ( = ?auto_26721 ?auto_26713 ) ) ( not ( = ?auto_26721 ?auto_26725 ) ) ( not ( = ?auto_26721 ?auto_26716 ) ) ( not ( = ?auto_26727 ?auto_26705 ) ) ( not ( = ?auto_26727 ?auto_26711 ) ) ( not ( = ?auto_26727 ?auto_26710 ) ) ( not ( = ?auto_26727 ?auto_26718 ) ) ( not ( = ?auto_26727 ?auto_26715 ) ) ( not ( = ?auto_26727 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26690 ) ) ( not ( = ?auto_26682 ?auto_26723 ) ) ( not ( = ?auto_26683 ?auto_26690 ) ) ( not ( = ?auto_26683 ?auto_26723 ) ) ( not ( = ?auto_26684 ?auto_26690 ) ) ( not ( = ?auto_26684 ?auto_26723 ) ) ( not ( = ?auto_26685 ?auto_26690 ) ) ( not ( = ?auto_26685 ?auto_26723 ) ) ( not ( = ?auto_26686 ?auto_26690 ) ) ( not ( = ?auto_26686 ?auto_26723 ) ) ( not ( = ?auto_26687 ?auto_26690 ) ) ( not ( = ?auto_26687 ?auto_26723 ) ) ( not ( = ?auto_26688 ?auto_26690 ) ) ( not ( = ?auto_26688 ?auto_26723 ) ) ( not ( = ?auto_26690 ?auto_26727 ) ) ( not ( = ?auto_26690 ?auto_26705 ) ) ( not ( = ?auto_26690 ?auto_26711 ) ) ( not ( = ?auto_26690 ?auto_26710 ) ) ( not ( = ?auto_26690 ?auto_26718 ) ) ( not ( = ?auto_26690 ?auto_26715 ) ) ( not ( = ?auto_26690 ?auto_26701 ) ) ( not ( = ?auto_26723 ?auto_26727 ) ) ( not ( = ?auto_26723 ?auto_26705 ) ) ( not ( = ?auto_26723 ?auto_26711 ) ) ( not ( = ?auto_26723 ?auto_26710 ) ) ( not ( = ?auto_26723 ?auto_26718 ) ) ( not ( = ?auto_26723 ?auto_26715 ) ) ( not ( = ?auto_26723 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26691 ) ) ( not ( = ?auto_26682 ?auto_26704 ) ) ( not ( = ?auto_26683 ?auto_26691 ) ) ( not ( = ?auto_26683 ?auto_26704 ) ) ( not ( = ?auto_26684 ?auto_26691 ) ) ( not ( = ?auto_26684 ?auto_26704 ) ) ( not ( = ?auto_26685 ?auto_26691 ) ) ( not ( = ?auto_26685 ?auto_26704 ) ) ( not ( = ?auto_26686 ?auto_26691 ) ) ( not ( = ?auto_26686 ?auto_26704 ) ) ( not ( = ?auto_26687 ?auto_26691 ) ) ( not ( = ?auto_26687 ?auto_26704 ) ) ( not ( = ?auto_26688 ?auto_26691 ) ) ( not ( = ?auto_26688 ?auto_26704 ) ) ( not ( = ?auto_26689 ?auto_26691 ) ) ( not ( = ?auto_26689 ?auto_26704 ) ) ( not ( = ?auto_26691 ?auto_26723 ) ) ( not ( = ?auto_26691 ?auto_26727 ) ) ( not ( = ?auto_26691 ?auto_26705 ) ) ( not ( = ?auto_26691 ?auto_26711 ) ) ( not ( = ?auto_26691 ?auto_26710 ) ) ( not ( = ?auto_26691 ?auto_26718 ) ) ( not ( = ?auto_26691 ?auto_26715 ) ) ( not ( = ?auto_26691 ?auto_26701 ) ) ( not ( = ?auto_26704 ?auto_26723 ) ) ( not ( = ?auto_26704 ?auto_26727 ) ) ( not ( = ?auto_26704 ?auto_26705 ) ) ( not ( = ?auto_26704 ?auto_26711 ) ) ( not ( = ?auto_26704 ?auto_26710 ) ) ( not ( = ?auto_26704 ?auto_26718 ) ) ( not ( = ?auto_26704 ?auto_26715 ) ) ( not ( = ?auto_26704 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26692 ) ) ( not ( = ?auto_26682 ?auto_26717 ) ) ( not ( = ?auto_26683 ?auto_26692 ) ) ( not ( = ?auto_26683 ?auto_26717 ) ) ( not ( = ?auto_26684 ?auto_26692 ) ) ( not ( = ?auto_26684 ?auto_26717 ) ) ( not ( = ?auto_26685 ?auto_26692 ) ) ( not ( = ?auto_26685 ?auto_26717 ) ) ( not ( = ?auto_26686 ?auto_26692 ) ) ( not ( = ?auto_26686 ?auto_26717 ) ) ( not ( = ?auto_26687 ?auto_26692 ) ) ( not ( = ?auto_26687 ?auto_26717 ) ) ( not ( = ?auto_26688 ?auto_26692 ) ) ( not ( = ?auto_26688 ?auto_26717 ) ) ( not ( = ?auto_26689 ?auto_26692 ) ) ( not ( = ?auto_26689 ?auto_26717 ) ) ( not ( = ?auto_26690 ?auto_26692 ) ) ( not ( = ?auto_26690 ?auto_26717 ) ) ( not ( = ?auto_26692 ?auto_26704 ) ) ( not ( = ?auto_26692 ?auto_26723 ) ) ( not ( = ?auto_26692 ?auto_26727 ) ) ( not ( = ?auto_26692 ?auto_26705 ) ) ( not ( = ?auto_26692 ?auto_26711 ) ) ( not ( = ?auto_26692 ?auto_26710 ) ) ( not ( = ?auto_26692 ?auto_26718 ) ) ( not ( = ?auto_26692 ?auto_26715 ) ) ( not ( = ?auto_26692 ?auto_26701 ) ) ( not ( = ?auto_26708 ?auto_26724 ) ) ( not ( = ?auto_26708 ?auto_26707 ) ) ( not ( = ?auto_26708 ?auto_26726 ) ) ( not ( = ?auto_26708 ?auto_26719 ) ) ( not ( = ?auto_26708 ?auto_26703 ) ) ( not ( = ?auto_26708 ?auto_26722 ) ) ( not ( = ?auto_26708 ?auto_26702 ) ) ( not ( = ?auto_26712 ?auto_26714 ) ) ( not ( = ?auto_26712 ?auto_26721 ) ) ( not ( = ?auto_26712 ?auto_26709 ) ) ( not ( = ?auto_26712 ?auto_26728 ) ) ( not ( = ?auto_26712 ?auto_26713 ) ) ( not ( = ?auto_26712 ?auto_26725 ) ) ( not ( = ?auto_26712 ?auto_26716 ) ) ( not ( = ?auto_26717 ?auto_26704 ) ) ( not ( = ?auto_26717 ?auto_26723 ) ) ( not ( = ?auto_26717 ?auto_26727 ) ) ( not ( = ?auto_26717 ?auto_26705 ) ) ( not ( = ?auto_26717 ?auto_26711 ) ) ( not ( = ?auto_26717 ?auto_26710 ) ) ( not ( = ?auto_26717 ?auto_26718 ) ) ( not ( = ?auto_26717 ?auto_26715 ) ) ( not ( = ?auto_26717 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26693 ) ) ( not ( = ?auto_26682 ?auto_26720 ) ) ( not ( = ?auto_26683 ?auto_26693 ) ) ( not ( = ?auto_26683 ?auto_26720 ) ) ( not ( = ?auto_26684 ?auto_26693 ) ) ( not ( = ?auto_26684 ?auto_26720 ) ) ( not ( = ?auto_26685 ?auto_26693 ) ) ( not ( = ?auto_26685 ?auto_26720 ) ) ( not ( = ?auto_26686 ?auto_26693 ) ) ( not ( = ?auto_26686 ?auto_26720 ) ) ( not ( = ?auto_26687 ?auto_26693 ) ) ( not ( = ?auto_26687 ?auto_26720 ) ) ( not ( = ?auto_26688 ?auto_26693 ) ) ( not ( = ?auto_26688 ?auto_26720 ) ) ( not ( = ?auto_26689 ?auto_26693 ) ) ( not ( = ?auto_26689 ?auto_26720 ) ) ( not ( = ?auto_26690 ?auto_26693 ) ) ( not ( = ?auto_26690 ?auto_26720 ) ) ( not ( = ?auto_26691 ?auto_26693 ) ) ( not ( = ?auto_26691 ?auto_26720 ) ) ( not ( = ?auto_26693 ?auto_26717 ) ) ( not ( = ?auto_26693 ?auto_26704 ) ) ( not ( = ?auto_26693 ?auto_26723 ) ) ( not ( = ?auto_26693 ?auto_26727 ) ) ( not ( = ?auto_26693 ?auto_26705 ) ) ( not ( = ?auto_26693 ?auto_26711 ) ) ( not ( = ?auto_26693 ?auto_26710 ) ) ( not ( = ?auto_26693 ?auto_26718 ) ) ( not ( = ?auto_26693 ?auto_26715 ) ) ( not ( = ?auto_26693 ?auto_26701 ) ) ( not ( = ?auto_26706 ?auto_26708 ) ) ( not ( = ?auto_26706 ?auto_26724 ) ) ( not ( = ?auto_26706 ?auto_26707 ) ) ( not ( = ?auto_26706 ?auto_26726 ) ) ( not ( = ?auto_26706 ?auto_26719 ) ) ( not ( = ?auto_26706 ?auto_26703 ) ) ( not ( = ?auto_26706 ?auto_26722 ) ) ( not ( = ?auto_26706 ?auto_26702 ) ) ( not ( = ?auto_26729 ?auto_26712 ) ) ( not ( = ?auto_26729 ?auto_26714 ) ) ( not ( = ?auto_26729 ?auto_26721 ) ) ( not ( = ?auto_26729 ?auto_26709 ) ) ( not ( = ?auto_26729 ?auto_26728 ) ) ( not ( = ?auto_26729 ?auto_26713 ) ) ( not ( = ?auto_26729 ?auto_26725 ) ) ( not ( = ?auto_26729 ?auto_26716 ) ) ( not ( = ?auto_26720 ?auto_26717 ) ) ( not ( = ?auto_26720 ?auto_26704 ) ) ( not ( = ?auto_26720 ?auto_26723 ) ) ( not ( = ?auto_26720 ?auto_26727 ) ) ( not ( = ?auto_26720 ?auto_26705 ) ) ( not ( = ?auto_26720 ?auto_26711 ) ) ( not ( = ?auto_26720 ?auto_26710 ) ) ( not ( = ?auto_26720 ?auto_26718 ) ) ( not ( = ?auto_26720 ?auto_26715 ) ) ( not ( = ?auto_26720 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26694 ) ) ( not ( = ?auto_26682 ?auto_26695 ) ) ( not ( = ?auto_26683 ?auto_26694 ) ) ( not ( = ?auto_26683 ?auto_26695 ) ) ( not ( = ?auto_26684 ?auto_26694 ) ) ( not ( = ?auto_26684 ?auto_26695 ) ) ( not ( = ?auto_26685 ?auto_26694 ) ) ( not ( = ?auto_26685 ?auto_26695 ) ) ( not ( = ?auto_26686 ?auto_26694 ) ) ( not ( = ?auto_26686 ?auto_26695 ) ) ( not ( = ?auto_26687 ?auto_26694 ) ) ( not ( = ?auto_26687 ?auto_26695 ) ) ( not ( = ?auto_26688 ?auto_26694 ) ) ( not ( = ?auto_26688 ?auto_26695 ) ) ( not ( = ?auto_26689 ?auto_26694 ) ) ( not ( = ?auto_26689 ?auto_26695 ) ) ( not ( = ?auto_26690 ?auto_26694 ) ) ( not ( = ?auto_26690 ?auto_26695 ) ) ( not ( = ?auto_26691 ?auto_26694 ) ) ( not ( = ?auto_26691 ?auto_26695 ) ) ( not ( = ?auto_26692 ?auto_26694 ) ) ( not ( = ?auto_26692 ?auto_26695 ) ) ( not ( = ?auto_26694 ?auto_26720 ) ) ( not ( = ?auto_26694 ?auto_26717 ) ) ( not ( = ?auto_26694 ?auto_26704 ) ) ( not ( = ?auto_26694 ?auto_26723 ) ) ( not ( = ?auto_26694 ?auto_26727 ) ) ( not ( = ?auto_26694 ?auto_26705 ) ) ( not ( = ?auto_26694 ?auto_26711 ) ) ( not ( = ?auto_26694 ?auto_26710 ) ) ( not ( = ?auto_26694 ?auto_26718 ) ) ( not ( = ?auto_26694 ?auto_26715 ) ) ( not ( = ?auto_26694 ?auto_26701 ) ) ( not ( = ?auto_26698 ?auto_26706 ) ) ( not ( = ?auto_26698 ?auto_26708 ) ) ( not ( = ?auto_26698 ?auto_26724 ) ) ( not ( = ?auto_26698 ?auto_26707 ) ) ( not ( = ?auto_26698 ?auto_26726 ) ) ( not ( = ?auto_26698 ?auto_26719 ) ) ( not ( = ?auto_26698 ?auto_26703 ) ) ( not ( = ?auto_26698 ?auto_26722 ) ) ( not ( = ?auto_26698 ?auto_26702 ) ) ( not ( = ?auto_26697 ?auto_26729 ) ) ( not ( = ?auto_26697 ?auto_26712 ) ) ( not ( = ?auto_26697 ?auto_26714 ) ) ( not ( = ?auto_26697 ?auto_26721 ) ) ( not ( = ?auto_26697 ?auto_26709 ) ) ( not ( = ?auto_26697 ?auto_26728 ) ) ( not ( = ?auto_26697 ?auto_26713 ) ) ( not ( = ?auto_26697 ?auto_26725 ) ) ( not ( = ?auto_26697 ?auto_26716 ) ) ( not ( = ?auto_26695 ?auto_26720 ) ) ( not ( = ?auto_26695 ?auto_26717 ) ) ( not ( = ?auto_26695 ?auto_26704 ) ) ( not ( = ?auto_26695 ?auto_26723 ) ) ( not ( = ?auto_26695 ?auto_26727 ) ) ( not ( = ?auto_26695 ?auto_26705 ) ) ( not ( = ?auto_26695 ?auto_26711 ) ) ( not ( = ?auto_26695 ?auto_26710 ) ) ( not ( = ?auto_26695 ?auto_26718 ) ) ( not ( = ?auto_26695 ?auto_26715 ) ) ( not ( = ?auto_26695 ?auto_26701 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_26682 ?auto_26683 ?auto_26684 ?auto_26685 ?auto_26686 ?auto_26687 ?auto_26688 ?auto_26689 ?auto_26690 ?auto_26691 ?auto_26692 ?auto_26693 )
      ( MAKE-1CRATE ?auto_26693 ?auto_26694 )
      ( MAKE-12CRATE-VERIFY ?auto_26682 ?auto_26683 ?auto_26684 ?auto_26685 ?auto_26686 ?auto_26687 ?auto_26688 ?auto_26689 ?auto_26690 ?auto_26691 ?auto_26692 ?auto_26693 ?auto_26694 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_26754 - SURFACE
      ?auto_26755 - SURFACE
      ?auto_26756 - SURFACE
      ?auto_26757 - SURFACE
      ?auto_26758 - SURFACE
      ?auto_26759 - SURFACE
      ?auto_26760 - SURFACE
      ?auto_26761 - SURFACE
      ?auto_26762 - SURFACE
      ?auto_26763 - SURFACE
      ?auto_26764 - SURFACE
      ?auto_26765 - SURFACE
      ?auto_26766 - SURFACE
      ?auto_26767 - SURFACE
    )
    :vars
    (
      ?auto_26769 - HOIST
      ?auto_26772 - PLACE
      ?auto_26770 - PLACE
      ?auto_26773 - HOIST
      ?auto_26768 - SURFACE
      ?auto_26788 - PLACE
      ?auto_26783 - HOIST
      ?auto_26793 - SURFACE
      ?auto_26805 - PLACE
      ?auto_26795 - HOIST
      ?auto_26802 - SURFACE
      ?auto_26775 - PLACE
      ?auto_26796 - HOIST
      ?auto_26782 - SURFACE
      ?auto_26787 - PLACE
      ?auto_26803 - HOIST
      ?auto_26777 - SURFACE
      ?auto_26800 - PLACE
      ?auto_26794 - HOIST
      ?auto_26774 - SURFACE
      ?auto_26790 - SURFACE
      ?auto_26779 - PLACE
      ?auto_26799 - HOIST
      ?auto_26789 - SURFACE
      ?auto_26792 - PLACE
      ?auto_26801 - HOIST
      ?auto_26778 - SURFACE
      ?auto_26780 - SURFACE
      ?auto_26776 - PLACE
      ?auto_26804 - HOIST
      ?auto_26785 - SURFACE
      ?auto_26781 - PLACE
      ?auto_26784 - HOIST
      ?auto_26786 - SURFACE
      ?auto_26798 - PLACE
      ?auto_26797 - HOIST
      ?auto_26791 - SURFACE
      ?auto_26771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26769 ?auto_26772 ) ( IS-CRATE ?auto_26767 ) ( not ( = ?auto_26770 ?auto_26772 ) ) ( HOIST-AT ?auto_26773 ?auto_26770 ) ( AVAILABLE ?auto_26773 ) ( SURFACE-AT ?auto_26767 ?auto_26770 ) ( ON ?auto_26767 ?auto_26768 ) ( CLEAR ?auto_26767 ) ( not ( = ?auto_26766 ?auto_26767 ) ) ( not ( = ?auto_26766 ?auto_26768 ) ) ( not ( = ?auto_26767 ?auto_26768 ) ) ( not ( = ?auto_26769 ?auto_26773 ) ) ( IS-CRATE ?auto_26766 ) ( not ( = ?auto_26788 ?auto_26772 ) ) ( HOIST-AT ?auto_26783 ?auto_26788 ) ( AVAILABLE ?auto_26783 ) ( SURFACE-AT ?auto_26766 ?auto_26788 ) ( ON ?auto_26766 ?auto_26793 ) ( CLEAR ?auto_26766 ) ( not ( = ?auto_26765 ?auto_26766 ) ) ( not ( = ?auto_26765 ?auto_26793 ) ) ( not ( = ?auto_26766 ?auto_26793 ) ) ( not ( = ?auto_26769 ?auto_26783 ) ) ( IS-CRATE ?auto_26765 ) ( not ( = ?auto_26805 ?auto_26772 ) ) ( HOIST-AT ?auto_26795 ?auto_26805 ) ( AVAILABLE ?auto_26795 ) ( SURFACE-AT ?auto_26765 ?auto_26805 ) ( ON ?auto_26765 ?auto_26802 ) ( CLEAR ?auto_26765 ) ( not ( = ?auto_26764 ?auto_26765 ) ) ( not ( = ?auto_26764 ?auto_26802 ) ) ( not ( = ?auto_26765 ?auto_26802 ) ) ( not ( = ?auto_26769 ?auto_26795 ) ) ( IS-CRATE ?auto_26764 ) ( not ( = ?auto_26775 ?auto_26772 ) ) ( HOIST-AT ?auto_26796 ?auto_26775 ) ( AVAILABLE ?auto_26796 ) ( SURFACE-AT ?auto_26764 ?auto_26775 ) ( ON ?auto_26764 ?auto_26782 ) ( CLEAR ?auto_26764 ) ( not ( = ?auto_26763 ?auto_26764 ) ) ( not ( = ?auto_26763 ?auto_26782 ) ) ( not ( = ?auto_26764 ?auto_26782 ) ) ( not ( = ?auto_26769 ?auto_26796 ) ) ( IS-CRATE ?auto_26763 ) ( not ( = ?auto_26787 ?auto_26772 ) ) ( HOIST-AT ?auto_26803 ?auto_26787 ) ( SURFACE-AT ?auto_26763 ?auto_26787 ) ( ON ?auto_26763 ?auto_26777 ) ( CLEAR ?auto_26763 ) ( not ( = ?auto_26762 ?auto_26763 ) ) ( not ( = ?auto_26762 ?auto_26777 ) ) ( not ( = ?auto_26763 ?auto_26777 ) ) ( not ( = ?auto_26769 ?auto_26803 ) ) ( IS-CRATE ?auto_26762 ) ( not ( = ?auto_26800 ?auto_26772 ) ) ( HOIST-AT ?auto_26794 ?auto_26800 ) ( SURFACE-AT ?auto_26762 ?auto_26800 ) ( ON ?auto_26762 ?auto_26774 ) ( CLEAR ?auto_26762 ) ( not ( = ?auto_26761 ?auto_26762 ) ) ( not ( = ?auto_26761 ?auto_26774 ) ) ( not ( = ?auto_26762 ?auto_26774 ) ) ( not ( = ?auto_26769 ?auto_26794 ) ) ( IS-CRATE ?auto_26761 ) ( AVAILABLE ?auto_26794 ) ( SURFACE-AT ?auto_26761 ?auto_26800 ) ( ON ?auto_26761 ?auto_26790 ) ( CLEAR ?auto_26761 ) ( not ( = ?auto_26760 ?auto_26761 ) ) ( not ( = ?auto_26760 ?auto_26790 ) ) ( not ( = ?auto_26761 ?auto_26790 ) ) ( IS-CRATE ?auto_26760 ) ( not ( = ?auto_26779 ?auto_26772 ) ) ( HOIST-AT ?auto_26799 ?auto_26779 ) ( AVAILABLE ?auto_26799 ) ( SURFACE-AT ?auto_26760 ?auto_26779 ) ( ON ?auto_26760 ?auto_26789 ) ( CLEAR ?auto_26760 ) ( not ( = ?auto_26759 ?auto_26760 ) ) ( not ( = ?auto_26759 ?auto_26789 ) ) ( not ( = ?auto_26760 ?auto_26789 ) ) ( not ( = ?auto_26769 ?auto_26799 ) ) ( IS-CRATE ?auto_26759 ) ( not ( = ?auto_26792 ?auto_26772 ) ) ( HOIST-AT ?auto_26801 ?auto_26792 ) ( AVAILABLE ?auto_26801 ) ( SURFACE-AT ?auto_26759 ?auto_26792 ) ( ON ?auto_26759 ?auto_26778 ) ( CLEAR ?auto_26759 ) ( not ( = ?auto_26758 ?auto_26759 ) ) ( not ( = ?auto_26758 ?auto_26778 ) ) ( not ( = ?auto_26759 ?auto_26778 ) ) ( not ( = ?auto_26769 ?auto_26801 ) ) ( IS-CRATE ?auto_26758 ) ( AVAILABLE ?auto_26803 ) ( SURFACE-AT ?auto_26758 ?auto_26787 ) ( ON ?auto_26758 ?auto_26780 ) ( CLEAR ?auto_26758 ) ( not ( = ?auto_26757 ?auto_26758 ) ) ( not ( = ?auto_26757 ?auto_26780 ) ) ( not ( = ?auto_26758 ?auto_26780 ) ) ( IS-CRATE ?auto_26757 ) ( not ( = ?auto_26776 ?auto_26772 ) ) ( HOIST-AT ?auto_26804 ?auto_26776 ) ( AVAILABLE ?auto_26804 ) ( SURFACE-AT ?auto_26757 ?auto_26776 ) ( ON ?auto_26757 ?auto_26785 ) ( CLEAR ?auto_26757 ) ( not ( = ?auto_26756 ?auto_26757 ) ) ( not ( = ?auto_26756 ?auto_26785 ) ) ( not ( = ?auto_26757 ?auto_26785 ) ) ( not ( = ?auto_26769 ?auto_26804 ) ) ( IS-CRATE ?auto_26756 ) ( not ( = ?auto_26781 ?auto_26772 ) ) ( HOIST-AT ?auto_26784 ?auto_26781 ) ( AVAILABLE ?auto_26784 ) ( SURFACE-AT ?auto_26756 ?auto_26781 ) ( ON ?auto_26756 ?auto_26786 ) ( CLEAR ?auto_26756 ) ( not ( = ?auto_26755 ?auto_26756 ) ) ( not ( = ?auto_26755 ?auto_26786 ) ) ( not ( = ?auto_26756 ?auto_26786 ) ) ( not ( = ?auto_26769 ?auto_26784 ) ) ( SURFACE-AT ?auto_26754 ?auto_26772 ) ( CLEAR ?auto_26754 ) ( IS-CRATE ?auto_26755 ) ( AVAILABLE ?auto_26769 ) ( not ( = ?auto_26798 ?auto_26772 ) ) ( HOIST-AT ?auto_26797 ?auto_26798 ) ( AVAILABLE ?auto_26797 ) ( SURFACE-AT ?auto_26755 ?auto_26798 ) ( ON ?auto_26755 ?auto_26791 ) ( CLEAR ?auto_26755 ) ( TRUCK-AT ?auto_26771 ?auto_26772 ) ( not ( = ?auto_26754 ?auto_26755 ) ) ( not ( = ?auto_26754 ?auto_26791 ) ) ( not ( = ?auto_26755 ?auto_26791 ) ) ( not ( = ?auto_26769 ?auto_26797 ) ) ( not ( = ?auto_26754 ?auto_26756 ) ) ( not ( = ?auto_26754 ?auto_26786 ) ) ( not ( = ?auto_26756 ?auto_26791 ) ) ( not ( = ?auto_26781 ?auto_26798 ) ) ( not ( = ?auto_26784 ?auto_26797 ) ) ( not ( = ?auto_26786 ?auto_26791 ) ) ( not ( = ?auto_26754 ?auto_26757 ) ) ( not ( = ?auto_26754 ?auto_26785 ) ) ( not ( = ?auto_26755 ?auto_26757 ) ) ( not ( = ?auto_26755 ?auto_26785 ) ) ( not ( = ?auto_26757 ?auto_26786 ) ) ( not ( = ?auto_26757 ?auto_26791 ) ) ( not ( = ?auto_26776 ?auto_26781 ) ) ( not ( = ?auto_26776 ?auto_26798 ) ) ( not ( = ?auto_26804 ?auto_26784 ) ) ( not ( = ?auto_26804 ?auto_26797 ) ) ( not ( = ?auto_26785 ?auto_26786 ) ) ( not ( = ?auto_26785 ?auto_26791 ) ) ( not ( = ?auto_26754 ?auto_26758 ) ) ( not ( = ?auto_26754 ?auto_26780 ) ) ( not ( = ?auto_26755 ?auto_26758 ) ) ( not ( = ?auto_26755 ?auto_26780 ) ) ( not ( = ?auto_26756 ?auto_26758 ) ) ( not ( = ?auto_26756 ?auto_26780 ) ) ( not ( = ?auto_26758 ?auto_26785 ) ) ( not ( = ?auto_26758 ?auto_26786 ) ) ( not ( = ?auto_26758 ?auto_26791 ) ) ( not ( = ?auto_26787 ?auto_26776 ) ) ( not ( = ?auto_26787 ?auto_26781 ) ) ( not ( = ?auto_26787 ?auto_26798 ) ) ( not ( = ?auto_26803 ?auto_26804 ) ) ( not ( = ?auto_26803 ?auto_26784 ) ) ( not ( = ?auto_26803 ?auto_26797 ) ) ( not ( = ?auto_26780 ?auto_26785 ) ) ( not ( = ?auto_26780 ?auto_26786 ) ) ( not ( = ?auto_26780 ?auto_26791 ) ) ( not ( = ?auto_26754 ?auto_26759 ) ) ( not ( = ?auto_26754 ?auto_26778 ) ) ( not ( = ?auto_26755 ?auto_26759 ) ) ( not ( = ?auto_26755 ?auto_26778 ) ) ( not ( = ?auto_26756 ?auto_26759 ) ) ( not ( = ?auto_26756 ?auto_26778 ) ) ( not ( = ?auto_26757 ?auto_26759 ) ) ( not ( = ?auto_26757 ?auto_26778 ) ) ( not ( = ?auto_26759 ?auto_26780 ) ) ( not ( = ?auto_26759 ?auto_26785 ) ) ( not ( = ?auto_26759 ?auto_26786 ) ) ( not ( = ?auto_26759 ?auto_26791 ) ) ( not ( = ?auto_26792 ?auto_26787 ) ) ( not ( = ?auto_26792 ?auto_26776 ) ) ( not ( = ?auto_26792 ?auto_26781 ) ) ( not ( = ?auto_26792 ?auto_26798 ) ) ( not ( = ?auto_26801 ?auto_26803 ) ) ( not ( = ?auto_26801 ?auto_26804 ) ) ( not ( = ?auto_26801 ?auto_26784 ) ) ( not ( = ?auto_26801 ?auto_26797 ) ) ( not ( = ?auto_26778 ?auto_26780 ) ) ( not ( = ?auto_26778 ?auto_26785 ) ) ( not ( = ?auto_26778 ?auto_26786 ) ) ( not ( = ?auto_26778 ?auto_26791 ) ) ( not ( = ?auto_26754 ?auto_26760 ) ) ( not ( = ?auto_26754 ?auto_26789 ) ) ( not ( = ?auto_26755 ?auto_26760 ) ) ( not ( = ?auto_26755 ?auto_26789 ) ) ( not ( = ?auto_26756 ?auto_26760 ) ) ( not ( = ?auto_26756 ?auto_26789 ) ) ( not ( = ?auto_26757 ?auto_26760 ) ) ( not ( = ?auto_26757 ?auto_26789 ) ) ( not ( = ?auto_26758 ?auto_26760 ) ) ( not ( = ?auto_26758 ?auto_26789 ) ) ( not ( = ?auto_26760 ?auto_26778 ) ) ( not ( = ?auto_26760 ?auto_26780 ) ) ( not ( = ?auto_26760 ?auto_26785 ) ) ( not ( = ?auto_26760 ?auto_26786 ) ) ( not ( = ?auto_26760 ?auto_26791 ) ) ( not ( = ?auto_26779 ?auto_26792 ) ) ( not ( = ?auto_26779 ?auto_26787 ) ) ( not ( = ?auto_26779 ?auto_26776 ) ) ( not ( = ?auto_26779 ?auto_26781 ) ) ( not ( = ?auto_26779 ?auto_26798 ) ) ( not ( = ?auto_26799 ?auto_26801 ) ) ( not ( = ?auto_26799 ?auto_26803 ) ) ( not ( = ?auto_26799 ?auto_26804 ) ) ( not ( = ?auto_26799 ?auto_26784 ) ) ( not ( = ?auto_26799 ?auto_26797 ) ) ( not ( = ?auto_26789 ?auto_26778 ) ) ( not ( = ?auto_26789 ?auto_26780 ) ) ( not ( = ?auto_26789 ?auto_26785 ) ) ( not ( = ?auto_26789 ?auto_26786 ) ) ( not ( = ?auto_26789 ?auto_26791 ) ) ( not ( = ?auto_26754 ?auto_26761 ) ) ( not ( = ?auto_26754 ?auto_26790 ) ) ( not ( = ?auto_26755 ?auto_26761 ) ) ( not ( = ?auto_26755 ?auto_26790 ) ) ( not ( = ?auto_26756 ?auto_26761 ) ) ( not ( = ?auto_26756 ?auto_26790 ) ) ( not ( = ?auto_26757 ?auto_26761 ) ) ( not ( = ?auto_26757 ?auto_26790 ) ) ( not ( = ?auto_26758 ?auto_26761 ) ) ( not ( = ?auto_26758 ?auto_26790 ) ) ( not ( = ?auto_26759 ?auto_26761 ) ) ( not ( = ?auto_26759 ?auto_26790 ) ) ( not ( = ?auto_26761 ?auto_26789 ) ) ( not ( = ?auto_26761 ?auto_26778 ) ) ( not ( = ?auto_26761 ?auto_26780 ) ) ( not ( = ?auto_26761 ?auto_26785 ) ) ( not ( = ?auto_26761 ?auto_26786 ) ) ( not ( = ?auto_26761 ?auto_26791 ) ) ( not ( = ?auto_26800 ?auto_26779 ) ) ( not ( = ?auto_26800 ?auto_26792 ) ) ( not ( = ?auto_26800 ?auto_26787 ) ) ( not ( = ?auto_26800 ?auto_26776 ) ) ( not ( = ?auto_26800 ?auto_26781 ) ) ( not ( = ?auto_26800 ?auto_26798 ) ) ( not ( = ?auto_26794 ?auto_26799 ) ) ( not ( = ?auto_26794 ?auto_26801 ) ) ( not ( = ?auto_26794 ?auto_26803 ) ) ( not ( = ?auto_26794 ?auto_26804 ) ) ( not ( = ?auto_26794 ?auto_26784 ) ) ( not ( = ?auto_26794 ?auto_26797 ) ) ( not ( = ?auto_26790 ?auto_26789 ) ) ( not ( = ?auto_26790 ?auto_26778 ) ) ( not ( = ?auto_26790 ?auto_26780 ) ) ( not ( = ?auto_26790 ?auto_26785 ) ) ( not ( = ?auto_26790 ?auto_26786 ) ) ( not ( = ?auto_26790 ?auto_26791 ) ) ( not ( = ?auto_26754 ?auto_26762 ) ) ( not ( = ?auto_26754 ?auto_26774 ) ) ( not ( = ?auto_26755 ?auto_26762 ) ) ( not ( = ?auto_26755 ?auto_26774 ) ) ( not ( = ?auto_26756 ?auto_26762 ) ) ( not ( = ?auto_26756 ?auto_26774 ) ) ( not ( = ?auto_26757 ?auto_26762 ) ) ( not ( = ?auto_26757 ?auto_26774 ) ) ( not ( = ?auto_26758 ?auto_26762 ) ) ( not ( = ?auto_26758 ?auto_26774 ) ) ( not ( = ?auto_26759 ?auto_26762 ) ) ( not ( = ?auto_26759 ?auto_26774 ) ) ( not ( = ?auto_26760 ?auto_26762 ) ) ( not ( = ?auto_26760 ?auto_26774 ) ) ( not ( = ?auto_26762 ?auto_26790 ) ) ( not ( = ?auto_26762 ?auto_26789 ) ) ( not ( = ?auto_26762 ?auto_26778 ) ) ( not ( = ?auto_26762 ?auto_26780 ) ) ( not ( = ?auto_26762 ?auto_26785 ) ) ( not ( = ?auto_26762 ?auto_26786 ) ) ( not ( = ?auto_26762 ?auto_26791 ) ) ( not ( = ?auto_26774 ?auto_26790 ) ) ( not ( = ?auto_26774 ?auto_26789 ) ) ( not ( = ?auto_26774 ?auto_26778 ) ) ( not ( = ?auto_26774 ?auto_26780 ) ) ( not ( = ?auto_26774 ?auto_26785 ) ) ( not ( = ?auto_26774 ?auto_26786 ) ) ( not ( = ?auto_26774 ?auto_26791 ) ) ( not ( = ?auto_26754 ?auto_26763 ) ) ( not ( = ?auto_26754 ?auto_26777 ) ) ( not ( = ?auto_26755 ?auto_26763 ) ) ( not ( = ?auto_26755 ?auto_26777 ) ) ( not ( = ?auto_26756 ?auto_26763 ) ) ( not ( = ?auto_26756 ?auto_26777 ) ) ( not ( = ?auto_26757 ?auto_26763 ) ) ( not ( = ?auto_26757 ?auto_26777 ) ) ( not ( = ?auto_26758 ?auto_26763 ) ) ( not ( = ?auto_26758 ?auto_26777 ) ) ( not ( = ?auto_26759 ?auto_26763 ) ) ( not ( = ?auto_26759 ?auto_26777 ) ) ( not ( = ?auto_26760 ?auto_26763 ) ) ( not ( = ?auto_26760 ?auto_26777 ) ) ( not ( = ?auto_26761 ?auto_26763 ) ) ( not ( = ?auto_26761 ?auto_26777 ) ) ( not ( = ?auto_26763 ?auto_26774 ) ) ( not ( = ?auto_26763 ?auto_26790 ) ) ( not ( = ?auto_26763 ?auto_26789 ) ) ( not ( = ?auto_26763 ?auto_26778 ) ) ( not ( = ?auto_26763 ?auto_26780 ) ) ( not ( = ?auto_26763 ?auto_26785 ) ) ( not ( = ?auto_26763 ?auto_26786 ) ) ( not ( = ?auto_26763 ?auto_26791 ) ) ( not ( = ?auto_26777 ?auto_26774 ) ) ( not ( = ?auto_26777 ?auto_26790 ) ) ( not ( = ?auto_26777 ?auto_26789 ) ) ( not ( = ?auto_26777 ?auto_26778 ) ) ( not ( = ?auto_26777 ?auto_26780 ) ) ( not ( = ?auto_26777 ?auto_26785 ) ) ( not ( = ?auto_26777 ?auto_26786 ) ) ( not ( = ?auto_26777 ?auto_26791 ) ) ( not ( = ?auto_26754 ?auto_26764 ) ) ( not ( = ?auto_26754 ?auto_26782 ) ) ( not ( = ?auto_26755 ?auto_26764 ) ) ( not ( = ?auto_26755 ?auto_26782 ) ) ( not ( = ?auto_26756 ?auto_26764 ) ) ( not ( = ?auto_26756 ?auto_26782 ) ) ( not ( = ?auto_26757 ?auto_26764 ) ) ( not ( = ?auto_26757 ?auto_26782 ) ) ( not ( = ?auto_26758 ?auto_26764 ) ) ( not ( = ?auto_26758 ?auto_26782 ) ) ( not ( = ?auto_26759 ?auto_26764 ) ) ( not ( = ?auto_26759 ?auto_26782 ) ) ( not ( = ?auto_26760 ?auto_26764 ) ) ( not ( = ?auto_26760 ?auto_26782 ) ) ( not ( = ?auto_26761 ?auto_26764 ) ) ( not ( = ?auto_26761 ?auto_26782 ) ) ( not ( = ?auto_26762 ?auto_26764 ) ) ( not ( = ?auto_26762 ?auto_26782 ) ) ( not ( = ?auto_26764 ?auto_26777 ) ) ( not ( = ?auto_26764 ?auto_26774 ) ) ( not ( = ?auto_26764 ?auto_26790 ) ) ( not ( = ?auto_26764 ?auto_26789 ) ) ( not ( = ?auto_26764 ?auto_26778 ) ) ( not ( = ?auto_26764 ?auto_26780 ) ) ( not ( = ?auto_26764 ?auto_26785 ) ) ( not ( = ?auto_26764 ?auto_26786 ) ) ( not ( = ?auto_26764 ?auto_26791 ) ) ( not ( = ?auto_26775 ?auto_26787 ) ) ( not ( = ?auto_26775 ?auto_26800 ) ) ( not ( = ?auto_26775 ?auto_26779 ) ) ( not ( = ?auto_26775 ?auto_26792 ) ) ( not ( = ?auto_26775 ?auto_26776 ) ) ( not ( = ?auto_26775 ?auto_26781 ) ) ( not ( = ?auto_26775 ?auto_26798 ) ) ( not ( = ?auto_26796 ?auto_26803 ) ) ( not ( = ?auto_26796 ?auto_26794 ) ) ( not ( = ?auto_26796 ?auto_26799 ) ) ( not ( = ?auto_26796 ?auto_26801 ) ) ( not ( = ?auto_26796 ?auto_26804 ) ) ( not ( = ?auto_26796 ?auto_26784 ) ) ( not ( = ?auto_26796 ?auto_26797 ) ) ( not ( = ?auto_26782 ?auto_26777 ) ) ( not ( = ?auto_26782 ?auto_26774 ) ) ( not ( = ?auto_26782 ?auto_26790 ) ) ( not ( = ?auto_26782 ?auto_26789 ) ) ( not ( = ?auto_26782 ?auto_26778 ) ) ( not ( = ?auto_26782 ?auto_26780 ) ) ( not ( = ?auto_26782 ?auto_26785 ) ) ( not ( = ?auto_26782 ?auto_26786 ) ) ( not ( = ?auto_26782 ?auto_26791 ) ) ( not ( = ?auto_26754 ?auto_26765 ) ) ( not ( = ?auto_26754 ?auto_26802 ) ) ( not ( = ?auto_26755 ?auto_26765 ) ) ( not ( = ?auto_26755 ?auto_26802 ) ) ( not ( = ?auto_26756 ?auto_26765 ) ) ( not ( = ?auto_26756 ?auto_26802 ) ) ( not ( = ?auto_26757 ?auto_26765 ) ) ( not ( = ?auto_26757 ?auto_26802 ) ) ( not ( = ?auto_26758 ?auto_26765 ) ) ( not ( = ?auto_26758 ?auto_26802 ) ) ( not ( = ?auto_26759 ?auto_26765 ) ) ( not ( = ?auto_26759 ?auto_26802 ) ) ( not ( = ?auto_26760 ?auto_26765 ) ) ( not ( = ?auto_26760 ?auto_26802 ) ) ( not ( = ?auto_26761 ?auto_26765 ) ) ( not ( = ?auto_26761 ?auto_26802 ) ) ( not ( = ?auto_26762 ?auto_26765 ) ) ( not ( = ?auto_26762 ?auto_26802 ) ) ( not ( = ?auto_26763 ?auto_26765 ) ) ( not ( = ?auto_26763 ?auto_26802 ) ) ( not ( = ?auto_26765 ?auto_26782 ) ) ( not ( = ?auto_26765 ?auto_26777 ) ) ( not ( = ?auto_26765 ?auto_26774 ) ) ( not ( = ?auto_26765 ?auto_26790 ) ) ( not ( = ?auto_26765 ?auto_26789 ) ) ( not ( = ?auto_26765 ?auto_26778 ) ) ( not ( = ?auto_26765 ?auto_26780 ) ) ( not ( = ?auto_26765 ?auto_26785 ) ) ( not ( = ?auto_26765 ?auto_26786 ) ) ( not ( = ?auto_26765 ?auto_26791 ) ) ( not ( = ?auto_26805 ?auto_26775 ) ) ( not ( = ?auto_26805 ?auto_26787 ) ) ( not ( = ?auto_26805 ?auto_26800 ) ) ( not ( = ?auto_26805 ?auto_26779 ) ) ( not ( = ?auto_26805 ?auto_26792 ) ) ( not ( = ?auto_26805 ?auto_26776 ) ) ( not ( = ?auto_26805 ?auto_26781 ) ) ( not ( = ?auto_26805 ?auto_26798 ) ) ( not ( = ?auto_26795 ?auto_26796 ) ) ( not ( = ?auto_26795 ?auto_26803 ) ) ( not ( = ?auto_26795 ?auto_26794 ) ) ( not ( = ?auto_26795 ?auto_26799 ) ) ( not ( = ?auto_26795 ?auto_26801 ) ) ( not ( = ?auto_26795 ?auto_26804 ) ) ( not ( = ?auto_26795 ?auto_26784 ) ) ( not ( = ?auto_26795 ?auto_26797 ) ) ( not ( = ?auto_26802 ?auto_26782 ) ) ( not ( = ?auto_26802 ?auto_26777 ) ) ( not ( = ?auto_26802 ?auto_26774 ) ) ( not ( = ?auto_26802 ?auto_26790 ) ) ( not ( = ?auto_26802 ?auto_26789 ) ) ( not ( = ?auto_26802 ?auto_26778 ) ) ( not ( = ?auto_26802 ?auto_26780 ) ) ( not ( = ?auto_26802 ?auto_26785 ) ) ( not ( = ?auto_26802 ?auto_26786 ) ) ( not ( = ?auto_26802 ?auto_26791 ) ) ( not ( = ?auto_26754 ?auto_26766 ) ) ( not ( = ?auto_26754 ?auto_26793 ) ) ( not ( = ?auto_26755 ?auto_26766 ) ) ( not ( = ?auto_26755 ?auto_26793 ) ) ( not ( = ?auto_26756 ?auto_26766 ) ) ( not ( = ?auto_26756 ?auto_26793 ) ) ( not ( = ?auto_26757 ?auto_26766 ) ) ( not ( = ?auto_26757 ?auto_26793 ) ) ( not ( = ?auto_26758 ?auto_26766 ) ) ( not ( = ?auto_26758 ?auto_26793 ) ) ( not ( = ?auto_26759 ?auto_26766 ) ) ( not ( = ?auto_26759 ?auto_26793 ) ) ( not ( = ?auto_26760 ?auto_26766 ) ) ( not ( = ?auto_26760 ?auto_26793 ) ) ( not ( = ?auto_26761 ?auto_26766 ) ) ( not ( = ?auto_26761 ?auto_26793 ) ) ( not ( = ?auto_26762 ?auto_26766 ) ) ( not ( = ?auto_26762 ?auto_26793 ) ) ( not ( = ?auto_26763 ?auto_26766 ) ) ( not ( = ?auto_26763 ?auto_26793 ) ) ( not ( = ?auto_26764 ?auto_26766 ) ) ( not ( = ?auto_26764 ?auto_26793 ) ) ( not ( = ?auto_26766 ?auto_26802 ) ) ( not ( = ?auto_26766 ?auto_26782 ) ) ( not ( = ?auto_26766 ?auto_26777 ) ) ( not ( = ?auto_26766 ?auto_26774 ) ) ( not ( = ?auto_26766 ?auto_26790 ) ) ( not ( = ?auto_26766 ?auto_26789 ) ) ( not ( = ?auto_26766 ?auto_26778 ) ) ( not ( = ?auto_26766 ?auto_26780 ) ) ( not ( = ?auto_26766 ?auto_26785 ) ) ( not ( = ?auto_26766 ?auto_26786 ) ) ( not ( = ?auto_26766 ?auto_26791 ) ) ( not ( = ?auto_26788 ?auto_26805 ) ) ( not ( = ?auto_26788 ?auto_26775 ) ) ( not ( = ?auto_26788 ?auto_26787 ) ) ( not ( = ?auto_26788 ?auto_26800 ) ) ( not ( = ?auto_26788 ?auto_26779 ) ) ( not ( = ?auto_26788 ?auto_26792 ) ) ( not ( = ?auto_26788 ?auto_26776 ) ) ( not ( = ?auto_26788 ?auto_26781 ) ) ( not ( = ?auto_26788 ?auto_26798 ) ) ( not ( = ?auto_26783 ?auto_26795 ) ) ( not ( = ?auto_26783 ?auto_26796 ) ) ( not ( = ?auto_26783 ?auto_26803 ) ) ( not ( = ?auto_26783 ?auto_26794 ) ) ( not ( = ?auto_26783 ?auto_26799 ) ) ( not ( = ?auto_26783 ?auto_26801 ) ) ( not ( = ?auto_26783 ?auto_26804 ) ) ( not ( = ?auto_26783 ?auto_26784 ) ) ( not ( = ?auto_26783 ?auto_26797 ) ) ( not ( = ?auto_26793 ?auto_26802 ) ) ( not ( = ?auto_26793 ?auto_26782 ) ) ( not ( = ?auto_26793 ?auto_26777 ) ) ( not ( = ?auto_26793 ?auto_26774 ) ) ( not ( = ?auto_26793 ?auto_26790 ) ) ( not ( = ?auto_26793 ?auto_26789 ) ) ( not ( = ?auto_26793 ?auto_26778 ) ) ( not ( = ?auto_26793 ?auto_26780 ) ) ( not ( = ?auto_26793 ?auto_26785 ) ) ( not ( = ?auto_26793 ?auto_26786 ) ) ( not ( = ?auto_26793 ?auto_26791 ) ) ( not ( = ?auto_26754 ?auto_26767 ) ) ( not ( = ?auto_26754 ?auto_26768 ) ) ( not ( = ?auto_26755 ?auto_26767 ) ) ( not ( = ?auto_26755 ?auto_26768 ) ) ( not ( = ?auto_26756 ?auto_26767 ) ) ( not ( = ?auto_26756 ?auto_26768 ) ) ( not ( = ?auto_26757 ?auto_26767 ) ) ( not ( = ?auto_26757 ?auto_26768 ) ) ( not ( = ?auto_26758 ?auto_26767 ) ) ( not ( = ?auto_26758 ?auto_26768 ) ) ( not ( = ?auto_26759 ?auto_26767 ) ) ( not ( = ?auto_26759 ?auto_26768 ) ) ( not ( = ?auto_26760 ?auto_26767 ) ) ( not ( = ?auto_26760 ?auto_26768 ) ) ( not ( = ?auto_26761 ?auto_26767 ) ) ( not ( = ?auto_26761 ?auto_26768 ) ) ( not ( = ?auto_26762 ?auto_26767 ) ) ( not ( = ?auto_26762 ?auto_26768 ) ) ( not ( = ?auto_26763 ?auto_26767 ) ) ( not ( = ?auto_26763 ?auto_26768 ) ) ( not ( = ?auto_26764 ?auto_26767 ) ) ( not ( = ?auto_26764 ?auto_26768 ) ) ( not ( = ?auto_26765 ?auto_26767 ) ) ( not ( = ?auto_26765 ?auto_26768 ) ) ( not ( = ?auto_26767 ?auto_26793 ) ) ( not ( = ?auto_26767 ?auto_26802 ) ) ( not ( = ?auto_26767 ?auto_26782 ) ) ( not ( = ?auto_26767 ?auto_26777 ) ) ( not ( = ?auto_26767 ?auto_26774 ) ) ( not ( = ?auto_26767 ?auto_26790 ) ) ( not ( = ?auto_26767 ?auto_26789 ) ) ( not ( = ?auto_26767 ?auto_26778 ) ) ( not ( = ?auto_26767 ?auto_26780 ) ) ( not ( = ?auto_26767 ?auto_26785 ) ) ( not ( = ?auto_26767 ?auto_26786 ) ) ( not ( = ?auto_26767 ?auto_26791 ) ) ( not ( = ?auto_26770 ?auto_26788 ) ) ( not ( = ?auto_26770 ?auto_26805 ) ) ( not ( = ?auto_26770 ?auto_26775 ) ) ( not ( = ?auto_26770 ?auto_26787 ) ) ( not ( = ?auto_26770 ?auto_26800 ) ) ( not ( = ?auto_26770 ?auto_26779 ) ) ( not ( = ?auto_26770 ?auto_26792 ) ) ( not ( = ?auto_26770 ?auto_26776 ) ) ( not ( = ?auto_26770 ?auto_26781 ) ) ( not ( = ?auto_26770 ?auto_26798 ) ) ( not ( = ?auto_26773 ?auto_26783 ) ) ( not ( = ?auto_26773 ?auto_26795 ) ) ( not ( = ?auto_26773 ?auto_26796 ) ) ( not ( = ?auto_26773 ?auto_26803 ) ) ( not ( = ?auto_26773 ?auto_26794 ) ) ( not ( = ?auto_26773 ?auto_26799 ) ) ( not ( = ?auto_26773 ?auto_26801 ) ) ( not ( = ?auto_26773 ?auto_26804 ) ) ( not ( = ?auto_26773 ?auto_26784 ) ) ( not ( = ?auto_26773 ?auto_26797 ) ) ( not ( = ?auto_26768 ?auto_26793 ) ) ( not ( = ?auto_26768 ?auto_26802 ) ) ( not ( = ?auto_26768 ?auto_26782 ) ) ( not ( = ?auto_26768 ?auto_26777 ) ) ( not ( = ?auto_26768 ?auto_26774 ) ) ( not ( = ?auto_26768 ?auto_26790 ) ) ( not ( = ?auto_26768 ?auto_26789 ) ) ( not ( = ?auto_26768 ?auto_26778 ) ) ( not ( = ?auto_26768 ?auto_26780 ) ) ( not ( = ?auto_26768 ?auto_26785 ) ) ( not ( = ?auto_26768 ?auto_26786 ) ) ( not ( = ?auto_26768 ?auto_26791 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_26754 ?auto_26755 ?auto_26756 ?auto_26757 ?auto_26758 ?auto_26759 ?auto_26760 ?auto_26761 ?auto_26762 ?auto_26763 ?auto_26764 ?auto_26765 ?auto_26766 )
      ( MAKE-1CRATE ?auto_26766 ?auto_26767 )
      ( MAKE-13CRATE-VERIFY ?auto_26754 ?auto_26755 ?auto_26756 ?auto_26757 ?auto_26758 ?auto_26759 ?auto_26760 ?auto_26761 ?auto_26762 ?auto_26763 ?auto_26764 ?auto_26765 ?auto_26766 ?auto_26767 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_26831 - SURFACE
      ?auto_26832 - SURFACE
      ?auto_26833 - SURFACE
      ?auto_26834 - SURFACE
      ?auto_26835 - SURFACE
      ?auto_26836 - SURFACE
      ?auto_26837 - SURFACE
      ?auto_26838 - SURFACE
      ?auto_26839 - SURFACE
      ?auto_26840 - SURFACE
      ?auto_26841 - SURFACE
      ?auto_26842 - SURFACE
      ?auto_26843 - SURFACE
      ?auto_26844 - SURFACE
      ?auto_26845 - SURFACE
    )
    :vars
    (
      ?auto_26846 - HOIST
      ?auto_26849 - PLACE
      ?auto_26847 - PLACE
      ?auto_26850 - HOIST
      ?auto_26851 - SURFACE
      ?auto_26867 - PLACE
      ?auto_26860 - HOIST
      ?auto_26861 - SURFACE
      ?auto_26868 - PLACE
      ?auto_26852 - HOIST
      ?auto_26856 - SURFACE
      ?auto_26865 - PLACE
      ?auto_26878 - HOIST
      ?auto_26859 - SURFACE
      ?auto_26864 - PLACE
      ?auto_26874 - HOIST
      ?auto_26866 - SURFACE
      ?auto_26884 - PLACE
      ?auto_26876 - HOIST
      ?auto_26862 - SURFACE
      ?auto_26858 - PLACE
      ?auto_26881 - HOIST
      ?auto_26883 - SURFACE
      ?auto_26879 - SURFACE
      ?auto_26873 - PLACE
      ?auto_26872 - HOIST
      ?auto_26870 - SURFACE
      ?auto_26875 - PLACE
      ?auto_26882 - HOIST
      ?auto_26863 - SURFACE
      ?auto_26877 - SURFACE
      ?auto_26853 - PLACE
      ?auto_26857 - HOIST
      ?auto_26871 - SURFACE
      ?auto_26869 - SURFACE
      ?auto_26880 - PLACE
      ?auto_26855 - HOIST
      ?auto_26854 - SURFACE
      ?auto_26848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26846 ?auto_26849 ) ( IS-CRATE ?auto_26845 ) ( not ( = ?auto_26847 ?auto_26849 ) ) ( HOIST-AT ?auto_26850 ?auto_26847 ) ( SURFACE-AT ?auto_26845 ?auto_26847 ) ( ON ?auto_26845 ?auto_26851 ) ( CLEAR ?auto_26845 ) ( not ( = ?auto_26844 ?auto_26845 ) ) ( not ( = ?auto_26844 ?auto_26851 ) ) ( not ( = ?auto_26845 ?auto_26851 ) ) ( not ( = ?auto_26846 ?auto_26850 ) ) ( IS-CRATE ?auto_26844 ) ( not ( = ?auto_26867 ?auto_26849 ) ) ( HOIST-AT ?auto_26860 ?auto_26867 ) ( AVAILABLE ?auto_26860 ) ( SURFACE-AT ?auto_26844 ?auto_26867 ) ( ON ?auto_26844 ?auto_26861 ) ( CLEAR ?auto_26844 ) ( not ( = ?auto_26843 ?auto_26844 ) ) ( not ( = ?auto_26843 ?auto_26861 ) ) ( not ( = ?auto_26844 ?auto_26861 ) ) ( not ( = ?auto_26846 ?auto_26860 ) ) ( IS-CRATE ?auto_26843 ) ( not ( = ?auto_26868 ?auto_26849 ) ) ( HOIST-AT ?auto_26852 ?auto_26868 ) ( AVAILABLE ?auto_26852 ) ( SURFACE-AT ?auto_26843 ?auto_26868 ) ( ON ?auto_26843 ?auto_26856 ) ( CLEAR ?auto_26843 ) ( not ( = ?auto_26842 ?auto_26843 ) ) ( not ( = ?auto_26842 ?auto_26856 ) ) ( not ( = ?auto_26843 ?auto_26856 ) ) ( not ( = ?auto_26846 ?auto_26852 ) ) ( IS-CRATE ?auto_26842 ) ( not ( = ?auto_26865 ?auto_26849 ) ) ( HOIST-AT ?auto_26878 ?auto_26865 ) ( AVAILABLE ?auto_26878 ) ( SURFACE-AT ?auto_26842 ?auto_26865 ) ( ON ?auto_26842 ?auto_26859 ) ( CLEAR ?auto_26842 ) ( not ( = ?auto_26841 ?auto_26842 ) ) ( not ( = ?auto_26841 ?auto_26859 ) ) ( not ( = ?auto_26842 ?auto_26859 ) ) ( not ( = ?auto_26846 ?auto_26878 ) ) ( IS-CRATE ?auto_26841 ) ( not ( = ?auto_26864 ?auto_26849 ) ) ( HOIST-AT ?auto_26874 ?auto_26864 ) ( AVAILABLE ?auto_26874 ) ( SURFACE-AT ?auto_26841 ?auto_26864 ) ( ON ?auto_26841 ?auto_26866 ) ( CLEAR ?auto_26841 ) ( not ( = ?auto_26840 ?auto_26841 ) ) ( not ( = ?auto_26840 ?auto_26866 ) ) ( not ( = ?auto_26841 ?auto_26866 ) ) ( not ( = ?auto_26846 ?auto_26874 ) ) ( IS-CRATE ?auto_26840 ) ( not ( = ?auto_26884 ?auto_26849 ) ) ( HOIST-AT ?auto_26876 ?auto_26884 ) ( SURFACE-AT ?auto_26840 ?auto_26884 ) ( ON ?auto_26840 ?auto_26862 ) ( CLEAR ?auto_26840 ) ( not ( = ?auto_26839 ?auto_26840 ) ) ( not ( = ?auto_26839 ?auto_26862 ) ) ( not ( = ?auto_26840 ?auto_26862 ) ) ( not ( = ?auto_26846 ?auto_26876 ) ) ( IS-CRATE ?auto_26839 ) ( not ( = ?auto_26858 ?auto_26849 ) ) ( HOIST-AT ?auto_26881 ?auto_26858 ) ( SURFACE-AT ?auto_26839 ?auto_26858 ) ( ON ?auto_26839 ?auto_26883 ) ( CLEAR ?auto_26839 ) ( not ( = ?auto_26838 ?auto_26839 ) ) ( not ( = ?auto_26838 ?auto_26883 ) ) ( not ( = ?auto_26839 ?auto_26883 ) ) ( not ( = ?auto_26846 ?auto_26881 ) ) ( IS-CRATE ?auto_26838 ) ( AVAILABLE ?auto_26881 ) ( SURFACE-AT ?auto_26838 ?auto_26858 ) ( ON ?auto_26838 ?auto_26879 ) ( CLEAR ?auto_26838 ) ( not ( = ?auto_26837 ?auto_26838 ) ) ( not ( = ?auto_26837 ?auto_26879 ) ) ( not ( = ?auto_26838 ?auto_26879 ) ) ( IS-CRATE ?auto_26837 ) ( not ( = ?auto_26873 ?auto_26849 ) ) ( HOIST-AT ?auto_26872 ?auto_26873 ) ( AVAILABLE ?auto_26872 ) ( SURFACE-AT ?auto_26837 ?auto_26873 ) ( ON ?auto_26837 ?auto_26870 ) ( CLEAR ?auto_26837 ) ( not ( = ?auto_26836 ?auto_26837 ) ) ( not ( = ?auto_26836 ?auto_26870 ) ) ( not ( = ?auto_26837 ?auto_26870 ) ) ( not ( = ?auto_26846 ?auto_26872 ) ) ( IS-CRATE ?auto_26836 ) ( not ( = ?auto_26875 ?auto_26849 ) ) ( HOIST-AT ?auto_26882 ?auto_26875 ) ( AVAILABLE ?auto_26882 ) ( SURFACE-AT ?auto_26836 ?auto_26875 ) ( ON ?auto_26836 ?auto_26863 ) ( CLEAR ?auto_26836 ) ( not ( = ?auto_26835 ?auto_26836 ) ) ( not ( = ?auto_26835 ?auto_26863 ) ) ( not ( = ?auto_26836 ?auto_26863 ) ) ( not ( = ?auto_26846 ?auto_26882 ) ) ( IS-CRATE ?auto_26835 ) ( AVAILABLE ?auto_26876 ) ( SURFACE-AT ?auto_26835 ?auto_26884 ) ( ON ?auto_26835 ?auto_26877 ) ( CLEAR ?auto_26835 ) ( not ( = ?auto_26834 ?auto_26835 ) ) ( not ( = ?auto_26834 ?auto_26877 ) ) ( not ( = ?auto_26835 ?auto_26877 ) ) ( IS-CRATE ?auto_26834 ) ( not ( = ?auto_26853 ?auto_26849 ) ) ( HOIST-AT ?auto_26857 ?auto_26853 ) ( AVAILABLE ?auto_26857 ) ( SURFACE-AT ?auto_26834 ?auto_26853 ) ( ON ?auto_26834 ?auto_26871 ) ( CLEAR ?auto_26834 ) ( not ( = ?auto_26833 ?auto_26834 ) ) ( not ( = ?auto_26833 ?auto_26871 ) ) ( not ( = ?auto_26834 ?auto_26871 ) ) ( not ( = ?auto_26846 ?auto_26857 ) ) ( IS-CRATE ?auto_26833 ) ( AVAILABLE ?auto_26850 ) ( SURFACE-AT ?auto_26833 ?auto_26847 ) ( ON ?auto_26833 ?auto_26869 ) ( CLEAR ?auto_26833 ) ( not ( = ?auto_26832 ?auto_26833 ) ) ( not ( = ?auto_26832 ?auto_26869 ) ) ( not ( = ?auto_26833 ?auto_26869 ) ) ( SURFACE-AT ?auto_26831 ?auto_26849 ) ( CLEAR ?auto_26831 ) ( IS-CRATE ?auto_26832 ) ( AVAILABLE ?auto_26846 ) ( not ( = ?auto_26880 ?auto_26849 ) ) ( HOIST-AT ?auto_26855 ?auto_26880 ) ( AVAILABLE ?auto_26855 ) ( SURFACE-AT ?auto_26832 ?auto_26880 ) ( ON ?auto_26832 ?auto_26854 ) ( CLEAR ?auto_26832 ) ( TRUCK-AT ?auto_26848 ?auto_26849 ) ( not ( = ?auto_26831 ?auto_26832 ) ) ( not ( = ?auto_26831 ?auto_26854 ) ) ( not ( = ?auto_26832 ?auto_26854 ) ) ( not ( = ?auto_26846 ?auto_26855 ) ) ( not ( = ?auto_26831 ?auto_26833 ) ) ( not ( = ?auto_26831 ?auto_26869 ) ) ( not ( = ?auto_26833 ?auto_26854 ) ) ( not ( = ?auto_26847 ?auto_26880 ) ) ( not ( = ?auto_26850 ?auto_26855 ) ) ( not ( = ?auto_26869 ?auto_26854 ) ) ( not ( = ?auto_26831 ?auto_26834 ) ) ( not ( = ?auto_26831 ?auto_26871 ) ) ( not ( = ?auto_26832 ?auto_26834 ) ) ( not ( = ?auto_26832 ?auto_26871 ) ) ( not ( = ?auto_26834 ?auto_26869 ) ) ( not ( = ?auto_26834 ?auto_26854 ) ) ( not ( = ?auto_26853 ?auto_26847 ) ) ( not ( = ?auto_26853 ?auto_26880 ) ) ( not ( = ?auto_26857 ?auto_26850 ) ) ( not ( = ?auto_26857 ?auto_26855 ) ) ( not ( = ?auto_26871 ?auto_26869 ) ) ( not ( = ?auto_26871 ?auto_26854 ) ) ( not ( = ?auto_26831 ?auto_26835 ) ) ( not ( = ?auto_26831 ?auto_26877 ) ) ( not ( = ?auto_26832 ?auto_26835 ) ) ( not ( = ?auto_26832 ?auto_26877 ) ) ( not ( = ?auto_26833 ?auto_26835 ) ) ( not ( = ?auto_26833 ?auto_26877 ) ) ( not ( = ?auto_26835 ?auto_26871 ) ) ( not ( = ?auto_26835 ?auto_26869 ) ) ( not ( = ?auto_26835 ?auto_26854 ) ) ( not ( = ?auto_26884 ?auto_26853 ) ) ( not ( = ?auto_26884 ?auto_26847 ) ) ( not ( = ?auto_26884 ?auto_26880 ) ) ( not ( = ?auto_26876 ?auto_26857 ) ) ( not ( = ?auto_26876 ?auto_26850 ) ) ( not ( = ?auto_26876 ?auto_26855 ) ) ( not ( = ?auto_26877 ?auto_26871 ) ) ( not ( = ?auto_26877 ?auto_26869 ) ) ( not ( = ?auto_26877 ?auto_26854 ) ) ( not ( = ?auto_26831 ?auto_26836 ) ) ( not ( = ?auto_26831 ?auto_26863 ) ) ( not ( = ?auto_26832 ?auto_26836 ) ) ( not ( = ?auto_26832 ?auto_26863 ) ) ( not ( = ?auto_26833 ?auto_26836 ) ) ( not ( = ?auto_26833 ?auto_26863 ) ) ( not ( = ?auto_26834 ?auto_26836 ) ) ( not ( = ?auto_26834 ?auto_26863 ) ) ( not ( = ?auto_26836 ?auto_26877 ) ) ( not ( = ?auto_26836 ?auto_26871 ) ) ( not ( = ?auto_26836 ?auto_26869 ) ) ( not ( = ?auto_26836 ?auto_26854 ) ) ( not ( = ?auto_26875 ?auto_26884 ) ) ( not ( = ?auto_26875 ?auto_26853 ) ) ( not ( = ?auto_26875 ?auto_26847 ) ) ( not ( = ?auto_26875 ?auto_26880 ) ) ( not ( = ?auto_26882 ?auto_26876 ) ) ( not ( = ?auto_26882 ?auto_26857 ) ) ( not ( = ?auto_26882 ?auto_26850 ) ) ( not ( = ?auto_26882 ?auto_26855 ) ) ( not ( = ?auto_26863 ?auto_26877 ) ) ( not ( = ?auto_26863 ?auto_26871 ) ) ( not ( = ?auto_26863 ?auto_26869 ) ) ( not ( = ?auto_26863 ?auto_26854 ) ) ( not ( = ?auto_26831 ?auto_26837 ) ) ( not ( = ?auto_26831 ?auto_26870 ) ) ( not ( = ?auto_26832 ?auto_26837 ) ) ( not ( = ?auto_26832 ?auto_26870 ) ) ( not ( = ?auto_26833 ?auto_26837 ) ) ( not ( = ?auto_26833 ?auto_26870 ) ) ( not ( = ?auto_26834 ?auto_26837 ) ) ( not ( = ?auto_26834 ?auto_26870 ) ) ( not ( = ?auto_26835 ?auto_26837 ) ) ( not ( = ?auto_26835 ?auto_26870 ) ) ( not ( = ?auto_26837 ?auto_26863 ) ) ( not ( = ?auto_26837 ?auto_26877 ) ) ( not ( = ?auto_26837 ?auto_26871 ) ) ( not ( = ?auto_26837 ?auto_26869 ) ) ( not ( = ?auto_26837 ?auto_26854 ) ) ( not ( = ?auto_26873 ?auto_26875 ) ) ( not ( = ?auto_26873 ?auto_26884 ) ) ( not ( = ?auto_26873 ?auto_26853 ) ) ( not ( = ?auto_26873 ?auto_26847 ) ) ( not ( = ?auto_26873 ?auto_26880 ) ) ( not ( = ?auto_26872 ?auto_26882 ) ) ( not ( = ?auto_26872 ?auto_26876 ) ) ( not ( = ?auto_26872 ?auto_26857 ) ) ( not ( = ?auto_26872 ?auto_26850 ) ) ( not ( = ?auto_26872 ?auto_26855 ) ) ( not ( = ?auto_26870 ?auto_26863 ) ) ( not ( = ?auto_26870 ?auto_26877 ) ) ( not ( = ?auto_26870 ?auto_26871 ) ) ( not ( = ?auto_26870 ?auto_26869 ) ) ( not ( = ?auto_26870 ?auto_26854 ) ) ( not ( = ?auto_26831 ?auto_26838 ) ) ( not ( = ?auto_26831 ?auto_26879 ) ) ( not ( = ?auto_26832 ?auto_26838 ) ) ( not ( = ?auto_26832 ?auto_26879 ) ) ( not ( = ?auto_26833 ?auto_26838 ) ) ( not ( = ?auto_26833 ?auto_26879 ) ) ( not ( = ?auto_26834 ?auto_26838 ) ) ( not ( = ?auto_26834 ?auto_26879 ) ) ( not ( = ?auto_26835 ?auto_26838 ) ) ( not ( = ?auto_26835 ?auto_26879 ) ) ( not ( = ?auto_26836 ?auto_26838 ) ) ( not ( = ?auto_26836 ?auto_26879 ) ) ( not ( = ?auto_26838 ?auto_26870 ) ) ( not ( = ?auto_26838 ?auto_26863 ) ) ( not ( = ?auto_26838 ?auto_26877 ) ) ( not ( = ?auto_26838 ?auto_26871 ) ) ( not ( = ?auto_26838 ?auto_26869 ) ) ( not ( = ?auto_26838 ?auto_26854 ) ) ( not ( = ?auto_26858 ?auto_26873 ) ) ( not ( = ?auto_26858 ?auto_26875 ) ) ( not ( = ?auto_26858 ?auto_26884 ) ) ( not ( = ?auto_26858 ?auto_26853 ) ) ( not ( = ?auto_26858 ?auto_26847 ) ) ( not ( = ?auto_26858 ?auto_26880 ) ) ( not ( = ?auto_26881 ?auto_26872 ) ) ( not ( = ?auto_26881 ?auto_26882 ) ) ( not ( = ?auto_26881 ?auto_26876 ) ) ( not ( = ?auto_26881 ?auto_26857 ) ) ( not ( = ?auto_26881 ?auto_26850 ) ) ( not ( = ?auto_26881 ?auto_26855 ) ) ( not ( = ?auto_26879 ?auto_26870 ) ) ( not ( = ?auto_26879 ?auto_26863 ) ) ( not ( = ?auto_26879 ?auto_26877 ) ) ( not ( = ?auto_26879 ?auto_26871 ) ) ( not ( = ?auto_26879 ?auto_26869 ) ) ( not ( = ?auto_26879 ?auto_26854 ) ) ( not ( = ?auto_26831 ?auto_26839 ) ) ( not ( = ?auto_26831 ?auto_26883 ) ) ( not ( = ?auto_26832 ?auto_26839 ) ) ( not ( = ?auto_26832 ?auto_26883 ) ) ( not ( = ?auto_26833 ?auto_26839 ) ) ( not ( = ?auto_26833 ?auto_26883 ) ) ( not ( = ?auto_26834 ?auto_26839 ) ) ( not ( = ?auto_26834 ?auto_26883 ) ) ( not ( = ?auto_26835 ?auto_26839 ) ) ( not ( = ?auto_26835 ?auto_26883 ) ) ( not ( = ?auto_26836 ?auto_26839 ) ) ( not ( = ?auto_26836 ?auto_26883 ) ) ( not ( = ?auto_26837 ?auto_26839 ) ) ( not ( = ?auto_26837 ?auto_26883 ) ) ( not ( = ?auto_26839 ?auto_26879 ) ) ( not ( = ?auto_26839 ?auto_26870 ) ) ( not ( = ?auto_26839 ?auto_26863 ) ) ( not ( = ?auto_26839 ?auto_26877 ) ) ( not ( = ?auto_26839 ?auto_26871 ) ) ( not ( = ?auto_26839 ?auto_26869 ) ) ( not ( = ?auto_26839 ?auto_26854 ) ) ( not ( = ?auto_26883 ?auto_26879 ) ) ( not ( = ?auto_26883 ?auto_26870 ) ) ( not ( = ?auto_26883 ?auto_26863 ) ) ( not ( = ?auto_26883 ?auto_26877 ) ) ( not ( = ?auto_26883 ?auto_26871 ) ) ( not ( = ?auto_26883 ?auto_26869 ) ) ( not ( = ?auto_26883 ?auto_26854 ) ) ( not ( = ?auto_26831 ?auto_26840 ) ) ( not ( = ?auto_26831 ?auto_26862 ) ) ( not ( = ?auto_26832 ?auto_26840 ) ) ( not ( = ?auto_26832 ?auto_26862 ) ) ( not ( = ?auto_26833 ?auto_26840 ) ) ( not ( = ?auto_26833 ?auto_26862 ) ) ( not ( = ?auto_26834 ?auto_26840 ) ) ( not ( = ?auto_26834 ?auto_26862 ) ) ( not ( = ?auto_26835 ?auto_26840 ) ) ( not ( = ?auto_26835 ?auto_26862 ) ) ( not ( = ?auto_26836 ?auto_26840 ) ) ( not ( = ?auto_26836 ?auto_26862 ) ) ( not ( = ?auto_26837 ?auto_26840 ) ) ( not ( = ?auto_26837 ?auto_26862 ) ) ( not ( = ?auto_26838 ?auto_26840 ) ) ( not ( = ?auto_26838 ?auto_26862 ) ) ( not ( = ?auto_26840 ?auto_26883 ) ) ( not ( = ?auto_26840 ?auto_26879 ) ) ( not ( = ?auto_26840 ?auto_26870 ) ) ( not ( = ?auto_26840 ?auto_26863 ) ) ( not ( = ?auto_26840 ?auto_26877 ) ) ( not ( = ?auto_26840 ?auto_26871 ) ) ( not ( = ?auto_26840 ?auto_26869 ) ) ( not ( = ?auto_26840 ?auto_26854 ) ) ( not ( = ?auto_26862 ?auto_26883 ) ) ( not ( = ?auto_26862 ?auto_26879 ) ) ( not ( = ?auto_26862 ?auto_26870 ) ) ( not ( = ?auto_26862 ?auto_26863 ) ) ( not ( = ?auto_26862 ?auto_26877 ) ) ( not ( = ?auto_26862 ?auto_26871 ) ) ( not ( = ?auto_26862 ?auto_26869 ) ) ( not ( = ?auto_26862 ?auto_26854 ) ) ( not ( = ?auto_26831 ?auto_26841 ) ) ( not ( = ?auto_26831 ?auto_26866 ) ) ( not ( = ?auto_26832 ?auto_26841 ) ) ( not ( = ?auto_26832 ?auto_26866 ) ) ( not ( = ?auto_26833 ?auto_26841 ) ) ( not ( = ?auto_26833 ?auto_26866 ) ) ( not ( = ?auto_26834 ?auto_26841 ) ) ( not ( = ?auto_26834 ?auto_26866 ) ) ( not ( = ?auto_26835 ?auto_26841 ) ) ( not ( = ?auto_26835 ?auto_26866 ) ) ( not ( = ?auto_26836 ?auto_26841 ) ) ( not ( = ?auto_26836 ?auto_26866 ) ) ( not ( = ?auto_26837 ?auto_26841 ) ) ( not ( = ?auto_26837 ?auto_26866 ) ) ( not ( = ?auto_26838 ?auto_26841 ) ) ( not ( = ?auto_26838 ?auto_26866 ) ) ( not ( = ?auto_26839 ?auto_26841 ) ) ( not ( = ?auto_26839 ?auto_26866 ) ) ( not ( = ?auto_26841 ?auto_26862 ) ) ( not ( = ?auto_26841 ?auto_26883 ) ) ( not ( = ?auto_26841 ?auto_26879 ) ) ( not ( = ?auto_26841 ?auto_26870 ) ) ( not ( = ?auto_26841 ?auto_26863 ) ) ( not ( = ?auto_26841 ?auto_26877 ) ) ( not ( = ?auto_26841 ?auto_26871 ) ) ( not ( = ?auto_26841 ?auto_26869 ) ) ( not ( = ?auto_26841 ?auto_26854 ) ) ( not ( = ?auto_26864 ?auto_26884 ) ) ( not ( = ?auto_26864 ?auto_26858 ) ) ( not ( = ?auto_26864 ?auto_26873 ) ) ( not ( = ?auto_26864 ?auto_26875 ) ) ( not ( = ?auto_26864 ?auto_26853 ) ) ( not ( = ?auto_26864 ?auto_26847 ) ) ( not ( = ?auto_26864 ?auto_26880 ) ) ( not ( = ?auto_26874 ?auto_26876 ) ) ( not ( = ?auto_26874 ?auto_26881 ) ) ( not ( = ?auto_26874 ?auto_26872 ) ) ( not ( = ?auto_26874 ?auto_26882 ) ) ( not ( = ?auto_26874 ?auto_26857 ) ) ( not ( = ?auto_26874 ?auto_26850 ) ) ( not ( = ?auto_26874 ?auto_26855 ) ) ( not ( = ?auto_26866 ?auto_26862 ) ) ( not ( = ?auto_26866 ?auto_26883 ) ) ( not ( = ?auto_26866 ?auto_26879 ) ) ( not ( = ?auto_26866 ?auto_26870 ) ) ( not ( = ?auto_26866 ?auto_26863 ) ) ( not ( = ?auto_26866 ?auto_26877 ) ) ( not ( = ?auto_26866 ?auto_26871 ) ) ( not ( = ?auto_26866 ?auto_26869 ) ) ( not ( = ?auto_26866 ?auto_26854 ) ) ( not ( = ?auto_26831 ?auto_26842 ) ) ( not ( = ?auto_26831 ?auto_26859 ) ) ( not ( = ?auto_26832 ?auto_26842 ) ) ( not ( = ?auto_26832 ?auto_26859 ) ) ( not ( = ?auto_26833 ?auto_26842 ) ) ( not ( = ?auto_26833 ?auto_26859 ) ) ( not ( = ?auto_26834 ?auto_26842 ) ) ( not ( = ?auto_26834 ?auto_26859 ) ) ( not ( = ?auto_26835 ?auto_26842 ) ) ( not ( = ?auto_26835 ?auto_26859 ) ) ( not ( = ?auto_26836 ?auto_26842 ) ) ( not ( = ?auto_26836 ?auto_26859 ) ) ( not ( = ?auto_26837 ?auto_26842 ) ) ( not ( = ?auto_26837 ?auto_26859 ) ) ( not ( = ?auto_26838 ?auto_26842 ) ) ( not ( = ?auto_26838 ?auto_26859 ) ) ( not ( = ?auto_26839 ?auto_26842 ) ) ( not ( = ?auto_26839 ?auto_26859 ) ) ( not ( = ?auto_26840 ?auto_26842 ) ) ( not ( = ?auto_26840 ?auto_26859 ) ) ( not ( = ?auto_26842 ?auto_26866 ) ) ( not ( = ?auto_26842 ?auto_26862 ) ) ( not ( = ?auto_26842 ?auto_26883 ) ) ( not ( = ?auto_26842 ?auto_26879 ) ) ( not ( = ?auto_26842 ?auto_26870 ) ) ( not ( = ?auto_26842 ?auto_26863 ) ) ( not ( = ?auto_26842 ?auto_26877 ) ) ( not ( = ?auto_26842 ?auto_26871 ) ) ( not ( = ?auto_26842 ?auto_26869 ) ) ( not ( = ?auto_26842 ?auto_26854 ) ) ( not ( = ?auto_26865 ?auto_26864 ) ) ( not ( = ?auto_26865 ?auto_26884 ) ) ( not ( = ?auto_26865 ?auto_26858 ) ) ( not ( = ?auto_26865 ?auto_26873 ) ) ( not ( = ?auto_26865 ?auto_26875 ) ) ( not ( = ?auto_26865 ?auto_26853 ) ) ( not ( = ?auto_26865 ?auto_26847 ) ) ( not ( = ?auto_26865 ?auto_26880 ) ) ( not ( = ?auto_26878 ?auto_26874 ) ) ( not ( = ?auto_26878 ?auto_26876 ) ) ( not ( = ?auto_26878 ?auto_26881 ) ) ( not ( = ?auto_26878 ?auto_26872 ) ) ( not ( = ?auto_26878 ?auto_26882 ) ) ( not ( = ?auto_26878 ?auto_26857 ) ) ( not ( = ?auto_26878 ?auto_26850 ) ) ( not ( = ?auto_26878 ?auto_26855 ) ) ( not ( = ?auto_26859 ?auto_26866 ) ) ( not ( = ?auto_26859 ?auto_26862 ) ) ( not ( = ?auto_26859 ?auto_26883 ) ) ( not ( = ?auto_26859 ?auto_26879 ) ) ( not ( = ?auto_26859 ?auto_26870 ) ) ( not ( = ?auto_26859 ?auto_26863 ) ) ( not ( = ?auto_26859 ?auto_26877 ) ) ( not ( = ?auto_26859 ?auto_26871 ) ) ( not ( = ?auto_26859 ?auto_26869 ) ) ( not ( = ?auto_26859 ?auto_26854 ) ) ( not ( = ?auto_26831 ?auto_26843 ) ) ( not ( = ?auto_26831 ?auto_26856 ) ) ( not ( = ?auto_26832 ?auto_26843 ) ) ( not ( = ?auto_26832 ?auto_26856 ) ) ( not ( = ?auto_26833 ?auto_26843 ) ) ( not ( = ?auto_26833 ?auto_26856 ) ) ( not ( = ?auto_26834 ?auto_26843 ) ) ( not ( = ?auto_26834 ?auto_26856 ) ) ( not ( = ?auto_26835 ?auto_26843 ) ) ( not ( = ?auto_26835 ?auto_26856 ) ) ( not ( = ?auto_26836 ?auto_26843 ) ) ( not ( = ?auto_26836 ?auto_26856 ) ) ( not ( = ?auto_26837 ?auto_26843 ) ) ( not ( = ?auto_26837 ?auto_26856 ) ) ( not ( = ?auto_26838 ?auto_26843 ) ) ( not ( = ?auto_26838 ?auto_26856 ) ) ( not ( = ?auto_26839 ?auto_26843 ) ) ( not ( = ?auto_26839 ?auto_26856 ) ) ( not ( = ?auto_26840 ?auto_26843 ) ) ( not ( = ?auto_26840 ?auto_26856 ) ) ( not ( = ?auto_26841 ?auto_26843 ) ) ( not ( = ?auto_26841 ?auto_26856 ) ) ( not ( = ?auto_26843 ?auto_26859 ) ) ( not ( = ?auto_26843 ?auto_26866 ) ) ( not ( = ?auto_26843 ?auto_26862 ) ) ( not ( = ?auto_26843 ?auto_26883 ) ) ( not ( = ?auto_26843 ?auto_26879 ) ) ( not ( = ?auto_26843 ?auto_26870 ) ) ( not ( = ?auto_26843 ?auto_26863 ) ) ( not ( = ?auto_26843 ?auto_26877 ) ) ( not ( = ?auto_26843 ?auto_26871 ) ) ( not ( = ?auto_26843 ?auto_26869 ) ) ( not ( = ?auto_26843 ?auto_26854 ) ) ( not ( = ?auto_26868 ?auto_26865 ) ) ( not ( = ?auto_26868 ?auto_26864 ) ) ( not ( = ?auto_26868 ?auto_26884 ) ) ( not ( = ?auto_26868 ?auto_26858 ) ) ( not ( = ?auto_26868 ?auto_26873 ) ) ( not ( = ?auto_26868 ?auto_26875 ) ) ( not ( = ?auto_26868 ?auto_26853 ) ) ( not ( = ?auto_26868 ?auto_26847 ) ) ( not ( = ?auto_26868 ?auto_26880 ) ) ( not ( = ?auto_26852 ?auto_26878 ) ) ( not ( = ?auto_26852 ?auto_26874 ) ) ( not ( = ?auto_26852 ?auto_26876 ) ) ( not ( = ?auto_26852 ?auto_26881 ) ) ( not ( = ?auto_26852 ?auto_26872 ) ) ( not ( = ?auto_26852 ?auto_26882 ) ) ( not ( = ?auto_26852 ?auto_26857 ) ) ( not ( = ?auto_26852 ?auto_26850 ) ) ( not ( = ?auto_26852 ?auto_26855 ) ) ( not ( = ?auto_26856 ?auto_26859 ) ) ( not ( = ?auto_26856 ?auto_26866 ) ) ( not ( = ?auto_26856 ?auto_26862 ) ) ( not ( = ?auto_26856 ?auto_26883 ) ) ( not ( = ?auto_26856 ?auto_26879 ) ) ( not ( = ?auto_26856 ?auto_26870 ) ) ( not ( = ?auto_26856 ?auto_26863 ) ) ( not ( = ?auto_26856 ?auto_26877 ) ) ( not ( = ?auto_26856 ?auto_26871 ) ) ( not ( = ?auto_26856 ?auto_26869 ) ) ( not ( = ?auto_26856 ?auto_26854 ) ) ( not ( = ?auto_26831 ?auto_26844 ) ) ( not ( = ?auto_26831 ?auto_26861 ) ) ( not ( = ?auto_26832 ?auto_26844 ) ) ( not ( = ?auto_26832 ?auto_26861 ) ) ( not ( = ?auto_26833 ?auto_26844 ) ) ( not ( = ?auto_26833 ?auto_26861 ) ) ( not ( = ?auto_26834 ?auto_26844 ) ) ( not ( = ?auto_26834 ?auto_26861 ) ) ( not ( = ?auto_26835 ?auto_26844 ) ) ( not ( = ?auto_26835 ?auto_26861 ) ) ( not ( = ?auto_26836 ?auto_26844 ) ) ( not ( = ?auto_26836 ?auto_26861 ) ) ( not ( = ?auto_26837 ?auto_26844 ) ) ( not ( = ?auto_26837 ?auto_26861 ) ) ( not ( = ?auto_26838 ?auto_26844 ) ) ( not ( = ?auto_26838 ?auto_26861 ) ) ( not ( = ?auto_26839 ?auto_26844 ) ) ( not ( = ?auto_26839 ?auto_26861 ) ) ( not ( = ?auto_26840 ?auto_26844 ) ) ( not ( = ?auto_26840 ?auto_26861 ) ) ( not ( = ?auto_26841 ?auto_26844 ) ) ( not ( = ?auto_26841 ?auto_26861 ) ) ( not ( = ?auto_26842 ?auto_26844 ) ) ( not ( = ?auto_26842 ?auto_26861 ) ) ( not ( = ?auto_26844 ?auto_26856 ) ) ( not ( = ?auto_26844 ?auto_26859 ) ) ( not ( = ?auto_26844 ?auto_26866 ) ) ( not ( = ?auto_26844 ?auto_26862 ) ) ( not ( = ?auto_26844 ?auto_26883 ) ) ( not ( = ?auto_26844 ?auto_26879 ) ) ( not ( = ?auto_26844 ?auto_26870 ) ) ( not ( = ?auto_26844 ?auto_26863 ) ) ( not ( = ?auto_26844 ?auto_26877 ) ) ( not ( = ?auto_26844 ?auto_26871 ) ) ( not ( = ?auto_26844 ?auto_26869 ) ) ( not ( = ?auto_26844 ?auto_26854 ) ) ( not ( = ?auto_26867 ?auto_26868 ) ) ( not ( = ?auto_26867 ?auto_26865 ) ) ( not ( = ?auto_26867 ?auto_26864 ) ) ( not ( = ?auto_26867 ?auto_26884 ) ) ( not ( = ?auto_26867 ?auto_26858 ) ) ( not ( = ?auto_26867 ?auto_26873 ) ) ( not ( = ?auto_26867 ?auto_26875 ) ) ( not ( = ?auto_26867 ?auto_26853 ) ) ( not ( = ?auto_26867 ?auto_26847 ) ) ( not ( = ?auto_26867 ?auto_26880 ) ) ( not ( = ?auto_26860 ?auto_26852 ) ) ( not ( = ?auto_26860 ?auto_26878 ) ) ( not ( = ?auto_26860 ?auto_26874 ) ) ( not ( = ?auto_26860 ?auto_26876 ) ) ( not ( = ?auto_26860 ?auto_26881 ) ) ( not ( = ?auto_26860 ?auto_26872 ) ) ( not ( = ?auto_26860 ?auto_26882 ) ) ( not ( = ?auto_26860 ?auto_26857 ) ) ( not ( = ?auto_26860 ?auto_26850 ) ) ( not ( = ?auto_26860 ?auto_26855 ) ) ( not ( = ?auto_26861 ?auto_26856 ) ) ( not ( = ?auto_26861 ?auto_26859 ) ) ( not ( = ?auto_26861 ?auto_26866 ) ) ( not ( = ?auto_26861 ?auto_26862 ) ) ( not ( = ?auto_26861 ?auto_26883 ) ) ( not ( = ?auto_26861 ?auto_26879 ) ) ( not ( = ?auto_26861 ?auto_26870 ) ) ( not ( = ?auto_26861 ?auto_26863 ) ) ( not ( = ?auto_26861 ?auto_26877 ) ) ( not ( = ?auto_26861 ?auto_26871 ) ) ( not ( = ?auto_26861 ?auto_26869 ) ) ( not ( = ?auto_26861 ?auto_26854 ) ) ( not ( = ?auto_26831 ?auto_26845 ) ) ( not ( = ?auto_26831 ?auto_26851 ) ) ( not ( = ?auto_26832 ?auto_26845 ) ) ( not ( = ?auto_26832 ?auto_26851 ) ) ( not ( = ?auto_26833 ?auto_26845 ) ) ( not ( = ?auto_26833 ?auto_26851 ) ) ( not ( = ?auto_26834 ?auto_26845 ) ) ( not ( = ?auto_26834 ?auto_26851 ) ) ( not ( = ?auto_26835 ?auto_26845 ) ) ( not ( = ?auto_26835 ?auto_26851 ) ) ( not ( = ?auto_26836 ?auto_26845 ) ) ( not ( = ?auto_26836 ?auto_26851 ) ) ( not ( = ?auto_26837 ?auto_26845 ) ) ( not ( = ?auto_26837 ?auto_26851 ) ) ( not ( = ?auto_26838 ?auto_26845 ) ) ( not ( = ?auto_26838 ?auto_26851 ) ) ( not ( = ?auto_26839 ?auto_26845 ) ) ( not ( = ?auto_26839 ?auto_26851 ) ) ( not ( = ?auto_26840 ?auto_26845 ) ) ( not ( = ?auto_26840 ?auto_26851 ) ) ( not ( = ?auto_26841 ?auto_26845 ) ) ( not ( = ?auto_26841 ?auto_26851 ) ) ( not ( = ?auto_26842 ?auto_26845 ) ) ( not ( = ?auto_26842 ?auto_26851 ) ) ( not ( = ?auto_26843 ?auto_26845 ) ) ( not ( = ?auto_26843 ?auto_26851 ) ) ( not ( = ?auto_26845 ?auto_26861 ) ) ( not ( = ?auto_26845 ?auto_26856 ) ) ( not ( = ?auto_26845 ?auto_26859 ) ) ( not ( = ?auto_26845 ?auto_26866 ) ) ( not ( = ?auto_26845 ?auto_26862 ) ) ( not ( = ?auto_26845 ?auto_26883 ) ) ( not ( = ?auto_26845 ?auto_26879 ) ) ( not ( = ?auto_26845 ?auto_26870 ) ) ( not ( = ?auto_26845 ?auto_26863 ) ) ( not ( = ?auto_26845 ?auto_26877 ) ) ( not ( = ?auto_26845 ?auto_26871 ) ) ( not ( = ?auto_26845 ?auto_26869 ) ) ( not ( = ?auto_26845 ?auto_26854 ) ) ( not ( = ?auto_26851 ?auto_26861 ) ) ( not ( = ?auto_26851 ?auto_26856 ) ) ( not ( = ?auto_26851 ?auto_26859 ) ) ( not ( = ?auto_26851 ?auto_26866 ) ) ( not ( = ?auto_26851 ?auto_26862 ) ) ( not ( = ?auto_26851 ?auto_26883 ) ) ( not ( = ?auto_26851 ?auto_26879 ) ) ( not ( = ?auto_26851 ?auto_26870 ) ) ( not ( = ?auto_26851 ?auto_26863 ) ) ( not ( = ?auto_26851 ?auto_26877 ) ) ( not ( = ?auto_26851 ?auto_26871 ) ) ( not ( = ?auto_26851 ?auto_26869 ) ) ( not ( = ?auto_26851 ?auto_26854 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_26831 ?auto_26832 ?auto_26833 ?auto_26834 ?auto_26835 ?auto_26836 ?auto_26837 ?auto_26838 ?auto_26839 ?auto_26840 ?auto_26841 ?auto_26842 ?auto_26843 ?auto_26844 )
      ( MAKE-1CRATE ?auto_26844 ?auto_26845 )
      ( MAKE-14CRATE-VERIFY ?auto_26831 ?auto_26832 ?auto_26833 ?auto_26834 ?auto_26835 ?auto_26836 ?auto_26837 ?auto_26838 ?auto_26839 ?auto_26840 ?auto_26841 ?auto_26842 ?auto_26843 ?auto_26844 ?auto_26845 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_26911 - SURFACE
      ?auto_26912 - SURFACE
      ?auto_26913 - SURFACE
      ?auto_26914 - SURFACE
      ?auto_26915 - SURFACE
      ?auto_26916 - SURFACE
      ?auto_26917 - SURFACE
      ?auto_26918 - SURFACE
      ?auto_26919 - SURFACE
      ?auto_26920 - SURFACE
      ?auto_26921 - SURFACE
      ?auto_26922 - SURFACE
      ?auto_26923 - SURFACE
      ?auto_26924 - SURFACE
      ?auto_26925 - SURFACE
      ?auto_26926 - SURFACE
    )
    :vars
    (
      ?auto_26930 - HOIST
      ?auto_26931 - PLACE
      ?auto_26927 - PLACE
      ?auto_26928 - HOIST
      ?auto_26929 - SURFACE
      ?auto_26946 - PLACE
      ?auto_26966 - HOIST
      ?auto_26938 - SURFACE
      ?auto_26956 - PLACE
      ?auto_26959 - HOIST
      ?auto_26940 - SURFACE
      ?auto_26945 - PLACE
      ?auto_26952 - HOIST
      ?auto_26941 - SURFACE
      ?auto_26944 - PLACE
      ?auto_26957 - HOIST
      ?auto_26950 - SURFACE
      ?auto_26942 - PLACE
      ?auto_26955 - HOIST
      ?auto_26961 - SURFACE
      ?auto_26963 - SURFACE
      ?auto_26960 - PLACE
      ?auto_26954 - HOIST
      ?auto_26949 - SURFACE
      ?auto_26947 - SURFACE
      ?auto_26962 - PLACE
      ?auto_26934 - HOIST
      ?auto_26937 - SURFACE
      ?auto_26948 - PLACE
      ?auto_26953 - HOIST
      ?auto_26933 - SURFACE
      ?auto_26939 - SURFACE
      ?auto_26936 - PLACE
      ?auto_26965 - HOIST
      ?auto_26951 - SURFACE
      ?auto_26943 - SURFACE
      ?auto_26935 - PLACE
      ?auto_26958 - HOIST
      ?auto_26964 - SURFACE
      ?auto_26932 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26930 ?auto_26931 ) ( IS-CRATE ?auto_26926 ) ( not ( = ?auto_26927 ?auto_26931 ) ) ( HOIST-AT ?auto_26928 ?auto_26927 ) ( SURFACE-AT ?auto_26926 ?auto_26927 ) ( ON ?auto_26926 ?auto_26929 ) ( CLEAR ?auto_26926 ) ( not ( = ?auto_26925 ?auto_26926 ) ) ( not ( = ?auto_26925 ?auto_26929 ) ) ( not ( = ?auto_26926 ?auto_26929 ) ) ( not ( = ?auto_26930 ?auto_26928 ) ) ( IS-CRATE ?auto_26925 ) ( not ( = ?auto_26946 ?auto_26931 ) ) ( HOIST-AT ?auto_26966 ?auto_26946 ) ( SURFACE-AT ?auto_26925 ?auto_26946 ) ( ON ?auto_26925 ?auto_26938 ) ( CLEAR ?auto_26925 ) ( not ( = ?auto_26924 ?auto_26925 ) ) ( not ( = ?auto_26924 ?auto_26938 ) ) ( not ( = ?auto_26925 ?auto_26938 ) ) ( not ( = ?auto_26930 ?auto_26966 ) ) ( IS-CRATE ?auto_26924 ) ( not ( = ?auto_26956 ?auto_26931 ) ) ( HOIST-AT ?auto_26959 ?auto_26956 ) ( AVAILABLE ?auto_26959 ) ( SURFACE-AT ?auto_26924 ?auto_26956 ) ( ON ?auto_26924 ?auto_26940 ) ( CLEAR ?auto_26924 ) ( not ( = ?auto_26923 ?auto_26924 ) ) ( not ( = ?auto_26923 ?auto_26940 ) ) ( not ( = ?auto_26924 ?auto_26940 ) ) ( not ( = ?auto_26930 ?auto_26959 ) ) ( IS-CRATE ?auto_26923 ) ( not ( = ?auto_26945 ?auto_26931 ) ) ( HOIST-AT ?auto_26952 ?auto_26945 ) ( AVAILABLE ?auto_26952 ) ( SURFACE-AT ?auto_26923 ?auto_26945 ) ( ON ?auto_26923 ?auto_26941 ) ( CLEAR ?auto_26923 ) ( not ( = ?auto_26922 ?auto_26923 ) ) ( not ( = ?auto_26922 ?auto_26941 ) ) ( not ( = ?auto_26923 ?auto_26941 ) ) ( not ( = ?auto_26930 ?auto_26952 ) ) ( IS-CRATE ?auto_26922 ) ( not ( = ?auto_26944 ?auto_26931 ) ) ( HOIST-AT ?auto_26957 ?auto_26944 ) ( AVAILABLE ?auto_26957 ) ( SURFACE-AT ?auto_26922 ?auto_26944 ) ( ON ?auto_26922 ?auto_26950 ) ( CLEAR ?auto_26922 ) ( not ( = ?auto_26921 ?auto_26922 ) ) ( not ( = ?auto_26921 ?auto_26950 ) ) ( not ( = ?auto_26922 ?auto_26950 ) ) ( not ( = ?auto_26930 ?auto_26957 ) ) ( IS-CRATE ?auto_26921 ) ( not ( = ?auto_26942 ?auto_26931 ) ) ( HOIST-AT ?auto_26955 ?auto_26942 ) ( AVAILABLE ?auto_26955 ) ( SURFACE-AT ?auto_26921 ?auto_26942 ) ( ON ?auto_26921 ?auto_26961 ) ( CLEAR ?auto_26921 ) ( not ( = ?auto_26920 ?auto_26921 ) ) ( not ( = ?auto_26920 ?auto_26961 ) ) ( not ( = ?auto_26921 ?auto_26961 ) ) ( not ( = ?auto_26930 ?auto_26955 ) ) ( IS-CRATE ?auto_26920 ) ( SURFACE-AT ?auto_26920 ?auto_26927 ) ( ON ?auto_26920 ?auto_26963 ) ( CLEAR ?auto_26920 ) ( not ( = ?auto_26919 ?auto_26920 ) ) ( not ( = ?auto_26919 ?auto_26963 ) ) ( not ( = ?auto_26920 ?auto_26963 ) ) ( IS-CRATE ?auto_26919 ) ( not ( = ?auto_26960 ?auto_26931 ) ) ( HOIST-AT ?auto_26954 ?auto_26960 ) ( SURFACE-AT ?auto_26919 ?auto_26960 ) ( ON ?auto_26919 ?auto_26949 ) ( CLEAR ?auto_26919 ) ( not ( = ?auto_26918 ?auto_26919 ) ) ( not ( = ?auto_26918 ?auto_26949 ) ) ( not ( = ?auto_26919 ?auto_26949 ) ) ( not ( = ?auto_26930 ?auto_26954 ) ) ( IS-CRATE ?auto_26918 ) ( AVAILABLE ?auto_26954 ) ( SURFACE-AT ?auto_26918 ?auto_26960 ) ( ON ?auto_26918 ?auto_26947 ) ( CLEAR ?auto_26918 ) ( not ( = ?auto_26917 ?auto_26918 ) ) ( not ( = ?auto_26917 ?auto_26947 ) ) ( not ( = ?auto_26918 ?auto_26947 ) ) ( IS-CRATE ?auto_26917 ) ( not ( = ?auto_26962 ?auto_26931 ) ) ( HOIST-AT ?auto_26934 ?auto_26962 ) ( AVAILABLE ?auto_26934 ) ( SURFACE-AT ?auto_26917 ?auto_26962 ) ( ON ?auto_26917 ?auto_26937 ) ( CLEAR ?auto_26917 ) ( not ( = ?auto_26916 ?auto_26917 ) ) ( not ( = ?auto_26916 ?auto_26937 ) ) ( not ( = ?auto_26917 ?auto_26937 ) ) ( not ( = ?auto_26930 ?auto_26934 ) ) ( IS-CRATE ?auto_26916 ) ( not ( = ?auto_26948 ?auto_26931 ) ) ( HOIST-AT ?auto_26953 ?auto_26948 ) ( AVAILABLE ?auto_26953 ) ( SURFACE-AT ?auto_26916 ?auto_26948 ) ( ON ?auto_26916 ?auto_26933 ) ( CLEAR ?auto_26916 ) ( not ( = ?auto_26915 ?auto_26916 ) ) ( not ( = ?auto_26915 ?auto_26933 ) ) ( not ( = ?auto_26916 ?auto_26933 ) ) ( not ( = ?auto_26930 ?auto_26953 ) ) ( IS-CRATE ?auto_26915 ) ( AVAILABLE ?auto_26928 ) ( SURFACE-AT ?auto_26915 ?auto_26927 ) ( ON ?auto_26915 ?auto_26939 ) ( CLEAR ?auto_26915 ) ( not ( = ?auto_26914 ?auto_26915 ) ) ( not ( = ?auto_26914 ?auto_26939 ) ) ( not ( = ?auto_26915 ?auto_26939 ) ) ( IS-CRATE ?auto_26914 ) ( not ( = ?auto_26936 ?auto_26931 ) ) ( HOIST-AT ?auto_26965 ?auto_26936 ) ( AVAILABLE ?auto_26965 ) ( SURFACE-AT ?auto_26914 ?auto_26936 ) ( ON ?auto_26914 ?auto_26951 ) ( CLEAR ?auto_26914 ) ( not ( = ?auto_26913 ?auto_26914 ) ) ( not ( = ?auto_26913 ?auto_26951 ) ) ( not ( = ?auto_26914 ?auto_26951 ) ) ( not ( = ?auto_26930 ?auto_26965 ) ) ( IS-CRATE ?auto_26913 ) ( AVAILABLE ?auto_26966 ) ( SURFACE-AT ?auto_26913 ?auto_26946 ) ( ON ?auto_26913 ?auto_26943 ) ( CLEAR ?auto_26913 ) ( not ( = ?auto_26912 ?auto_26913 ) ) ( not ( = ?auto_26912 ?auto_26943 ) ) ( not ( = ?auto_26913 ?auto_26943 ) ) ( SURFACE-AT ?auto_26911 ?auto_26931 ) ( CLEAR ?auto_26911 ) ( IS-CRATE ?auto_26912 ) ( AVAILABLE ?auto_26930 ) ( not ( = ?auto_26935 ?auto_26931 ) ) ( HOIST-AT ?auto_26958 ?auto_26935 ) ( AVAILABLE ?auto_26958 ) ( SURFACE-AT ?auto_26912 ?auto_26935 ) ( ON ?auto_26912 ?auto_26964 ) ( CLEAR ?auto_26912 ) ( TRUCK-AT ?auto_26932 ?auto_26931 ) ( not ( = ?auto_26911 ?auto_26912 ) ) ( not ( = ?auto_26911 ?auto_26964 ) ) ( not ( = ?auto_26912 ?auto_26964 ) ) ( not ( = ?auto_26930 ?auto_26958 ) ) ( not ( = ?auto_26911 ?auto_26913 ) ) ( not ( = ?auto_26911 ?auto_26943 ) ) ( not ( = ?auto_26913 ?auto_26964 ) ) ( not ( = ?auto_26946 ?auto_26935 ) ) ( not ( = ?auto_26966 ?auto_26958 ) ) ( not ( = ?auto_26943 ?auto_26964 ) ) ( not ( = ?auto_26911 ?auto_26914 ) ) ( not ( = ?auto_26911 ?auto_26951 ) ) ( not ( = ?auto_26912 ?auto_26914 ) ) ( not ( = ?auto_26912 ?auto_26951 ) ) ( not ( = ?auto_26914 ?auto_26943 ) ) ( not ( = ?auto_26914 ?auto_26964 ) ) ( not ( = ?auto_26936 ?auto_26946 ) ) ( not ( = ?auto_26936 ?auto_26935 ) ) ( not ( = ?auto_26965 ?auto_26966 ) ) ( not ( = ?auto_26965 ?auto_26958 ) ) ( not ( = ?auto_26951 ?auto_26943 ) ) ( not ( = ?auto_26951 ?auto_26964 ) ) ( not ( = ?auto_26911 ?auto_26915 ) ) ( not ( = ?auto_26911 ?auto_26939 ) ) ( not ( = ?auto_26912 ?auto_26915 ) ) ( not ( = ?auto_26912 ?auto_26939 ) ) ( not ( = ?auto_26913 ?auto_26915 ) ) ( not ( = ?auto_26913 ?auto_26939 ) ) ( not ( = ?auto_26915 ?auto_26951 ) ) ( not ( = ?auto_26915 ?auto_26943 ) ) ( not ( = ?auto_26915 ?auto_26964 ) ) ( not ( = ?auto_26927 ?auto_26936 ) ) ( not ( = ?auto_26927 ?auto_26946 ) ) ( not ( = ?auto_26927 ?auto_26935 ) ) ( not ( = ?auto_26928 ?auto_26965 ) ) ( not ( = ?auto_26928 ?auto_26966 ) ) ( not ( = ?auto_26928 ?auto_26958 ) ) ( not ( = ?auto_26939 ?auto_26951 ) ) ( not ( = ?auto_26939 ?auto_26943 ) ) ( not ( = ?auto_26939 ?auto_26964 ) ) ( not ( = ?auto_26911 ?auto_26916 ) ) ( not ( = ?auto_26911 ?auto_26933 ) ) ( not ( = ?auto_26912 ?auto_26916 ) ) ( not ( = ?auto_26912 ?auto_26933 ) ) ( not ( = ?auto_26913 ?auto_26916 ) ) ( not ( = ?auto_26913 ?auto_26933 ) ) ( not ( = ?auto_26914 ?auto_26916 ) ) ( not ( = ?auto_26914 ?auto_26933 ) ) ( not ( = ?auto_26916 ?auto_26939 ) ) ( not ( = ?auto_26916 ?auto_26951 ) ) ( not ( = ?auto_26916 ?auto_26943 ) ) ( not ( = ?auto_26916 ?auto_26964 ) ) ( not ( = ?auto_26948 ?auto_26927 ) ) ( not ( = ?auto_26948 ?auto_26936 ) ) ( not ( = ?auto_26948 ?auto_26946 ) ) ( not ( = ?auto_26948 ?auto_26935 ) ) ( not ( = ?auto_26953 ?auto_26928 ) ) ( not ( = ?auto_26953 ?auto_26965 ) ) ( not ( = ?auto_26953 ?auto_26966 ) ) ( not ( = ?auto_26953 ?auto_26958 ) ) ( not ( = ?auto_26933 ?auto_26939 ) ) ( not ( = ?auto_26933 ?auto_26951 ) ) ( not ( = ?auto_26933 ?auto_26943 ) ) ( not ( = ?auto_26933 ?auto_26964 ) ) ( not ( = ?auto_26911 ?auto_26917 ) ) ( not ( = ?auto_26911 ?auto_26937 ) ) ( not ( = ?auto_26912 ?auto_26917 ) ) ( not ( = ?auto_26912 ?auto_26937 ) ) ( not ( = ?auto_26913 ?auto_26917 ) ) ( not ( = ?auto_26913 ?auto_26937 ) ) ( not ( = ?auto_26914 ?auto_26917 ) ) ( not ( = ?auto_26914 ?auto_26937 ) ) ( not ( = ?auto_26915 ?auto_26917 ) ) ( not ( = ?auto_26915 ?auto_26937 ) ) ( not ( = ?auto_26917 ?auto_26933 ) ) ( not ( = ?auto_26917 ?auto_26939 ) ) ( not ( = ?auto_26917 ?auto_26951 ) ) ( not ( = ?auto_26917 ?auto_26943 ) ) ( not ( = ?auto_26917 ?auto_26964 ) ) ( not ( = ?auto_26962 ?auto_26948 ) ) ( not ( = ?auto_26962 ?auto_26927 ) ) ( not ( = ?auto_26962 ?auto_26936 ) ) ( not ( = ?auto_26962 ?auto_26946 ) ) ( not ( = ?auto_26962 ?auto_26935 ) ) ( not ( = ?auto_26934 ?auto_26953 ) ) ( not ( = ?auto_26934 ?auto_26928 ) ) ( not ( = ?auto_26934 ?auto_26965 ) ) ( not ( = ?auto_26934 ?auto_26966 ) ) ( not ( = ?auto_26934 ?auto_26958 ) ) ( not ( = ?auto_26937 ?auto_26933 ) ) ( not ( = ?auto_26937 ?auto_26939 ) ) ( not ( = ?auto_26937 ?auto_26951 ) ) ( not ( = ?auto_26937 ?auto_26943 ) ) ( not ( = ?auto_26937 ?auto_26964 ) ) ( not ( = ?auto_26911 ?auto_26918 ) ) ( not ( = ?auto_26911 ?auto_26947 ) ) ( not ( = ?auto_26912 ?auto_26918 ) ) ( not ( = ?auto_26912 ?auto_26947 ) ) ( not ( = ?auto_26913 ?auto_26918 ) ) ( not ( = ?auto_26913 ?auto_26947 ) ) ( not ( = ?auto_26914 ?auto_26918 ) ) ( not ( = ?auto_26914 ?auto_26947 ) ) ( not ( = ?auto_26915 ?auto_26918 ) ) ( not ( = ?auto_26915 ?auto_26947 ) ) ( not ( = ?auto_26916 ?auto_26918 ) ) ( not ( = ?auto_26916 ?auto_26947 ) ) ( not ( = ?auto_26918 ?auto_26937 ) ) ( not ( = ?auto_26918 ?auto_26933 ) ) ( not ( = ?auto_26918 ?auto_26939 ) ) ( not ( = ?auto_26918 ?auto_26951 ) ) ( not ( = ?auto_26918 ?auto_26943 ) ) ( not ( = ?auto_26918 ?auto_26964 ) ) ( not ( = ?auto_26960 ?auto_26962 ) ) ( not ( = ?auto_26960 ?auto_26948 ) ) ( not ( = ?auto_26960 ?auto_26927 ) ) ( not ( = ?auto_26960 ?auto_26936 ) ) ( not ( = ?auto_26960 ?auto_26946 ) ) ( not ( = ?auto_26960 ?auto_26935 ) ) ( not ( = ?auto_26954 ?auto_26934 ) ) ( not ( = ?auto_26954 ?auto_26953 ) ) ( not ( = ?auto_26954 ?auto_26928 ) ) ( not ( = ?auto_26954 ?auto_26965 ) ) ( not ( = ?auto_26954 ?auto_26966 ) ) ( not ( = ?auto_26954 ?auto_26958 ) ) ( not ( = ?auto_26947 ?auto_26937 ) ) ( not ( = ?auto_26947 ?auto_26933 ) ) ( not ( = ?auto_26947 ?auto_26939 ) ) ( not ( = ?auto_26947 ?auto_26951 ) ) ( not ( = ?auto_26947 ?auto_26943 ) ) ( not ( = ?auto_26947 ?auto_26964 ) ) ( not ( = ?auto_26911 ?auto_26919 ) ) ( not ( = ?auto_26911 ?auto_26949 ) ) ( not ( = ?auto_26912 ?auto_26919 ) ) ( not ( = ?auto_26912 ?auto_26949 ) ) ( not ( = ?auto_26913 ?auto_26919 ) ) ( not ( = ?auto_26913 ?auto_26949 ) ) ( not ( = ?auto_26914 ?auto_26919 ) ) ( not ( = ?auto_26914 ?auto_26949 ) ) ( not ( = ?auto_26915 ?auto_26919 ) ) ( not ( = ?auto_26915 ?auto_26949 ) ) ( not ( = ?auto_26916 ?auto_26919 ) ) ( not ( = ?auto_26916 ?auto_26949 ) ) ( not ( = ?auto_26917 ?auto_26919 ) ) ( not ( = ?auto_26917 ?auto_26949 ) ) ( not ( = ?auto_26919 ?auto_26947 ) ) ( not ( = ?auto_26919 ?auto_26937 ) ) ( not ( = ?auto_26919 ?auto_26933 ) ) ( not ( = ?auto_26919 ?auto_26939 ) ) ( not ( = ?auto_26919 ?auto_26951 ) ) ( not ( = ?auto_26919 ?auto_26943 ) ) ( not ( = ?auto_26919 ?auto_26964 ) ) ( not ( = ?auto_26949 ?auto_26947 ) ) ( not ( = ?auto_26949 ?auto_26937 ) ) ( not ( = ?auto_26949 ?auto_26933 ) ) ( not ( = ?auto_26949 ?auto_26939 ) ) ( not ( = ?auto_26949 ?auto_26951 ) ) ( not ( = ?auto_26949 ?auto_26943 ) ) ( not ( = ?auto_26949 ?auto_26964 ) ) ( not ( = ?auto_26911 ?auto_26920 ) ) ( not ( = ?auto_26911 ?auto_26963 ) ) ( not ( = ?auto_26912 ?auto_26920 ) ) ( not ( = ?auto_26912 ?auto_26963 ) ) ( not ( = ?auto_26913 ?auto_26920 ) ) ( not ( = ?auto_26913 ?auto_26963 ) ) ( not ( = ?auto_26914 ?auto_26920 ) ) ( not ( = ?auto_26914 ?auto_26963 ) ) ( not ( = ?auto_26915 ?auto_26920 ) ) ( not ( = ?auto_26915 ?auto_26963 ) ) ( not ( = ?auto_26916 ?auto_26920 ) ) ( not ( = ?auto_26916 ?auto_26963 ) ) ( not ( = ?auto_26917 ?auto_26920 ) ) ( not ( = ?auto_26917 ?auto_26963 ) ) ( not ( = ?auto_26918 ?auto_26920 ) ) ( not ( = ?auto_26918 ?auto_26963 ) ) ( not ( = ?auto_26920 ?auto_26949 ) ) ( not ( = ?auto_26920 ?auto_26947 ) ) ( not ( = ?auto_26920 ?auto_26937 ) ) ( not ( = ?auto_26920 ?auto_26933 ) ) ( not ( = ?auto_26920 ?auto_26939 ) ) ( not ( = ?auto_26920 ?auto_26951 ) ) ( not ( = ?auto_26920 ?auto_26943 ) ) ( not ( = ?auto_26920 ?auto_26964 ) ) ( not ( = ?auto_26963 ?auto_26949 ) ) ( not ( = ?auto_26963 ?auto_26947 ) ) ( not ( = ?auto_26963 ?auto_26937 ) ) ( not ( = ?auto_26963 ?auto_26933 ) ) ( not ( = ?auto_26963 ?auto_26939 ) ) ( not ( = ?auto_26963 ?auto_26951 ) ) ( not ( = ?auto_26963 ?auto_26943 ) ) ( not ( = ?auto_26963 ?auto_26964 ) ) ( not ( = ?auto_26911 ?auto_26921 ) ) ( not ( = ?auto_26911 ?auto_26961 ) ) ( not ( = ?auto_26912 ?auto_26921 ) ) ( not ( = ?auto_26912 ?auto_26961 ) ) ( not ( = ?auto_26913 ?auto_26921 ) ) ( not ( = ?auto_26913 ?auto_26961 ) ) ( not ( = ?auto_26914 ?auto_26921 ) ) ( not ( = ?auto_26914 ?auto_26961 ) ) ( not ( = ?auto_26915 ?auto_26921 ) ) ( not ( = ?auto_26915 ?auto_26961 ) ) ( not ( = ?auto_26916 ?auto_26921 ) ) ( not ( = ?auto_26916 ?auto_26961 ) ) ( not ( = ?auto_26917 ?auto_26921 ) ) ( not ( = ?auto_26917 ?auto_26961 ) ) ( not ( = ?auto_26918 ?auto_26921 ) ) ( not ( = ?auto_26918 ?auto_26961 ) ) ( not ( = ?auto_26919 ?auto_26921 ) ) ( not ( = ?auto_26919 ?auto_26961 ) ) ( not ( = ?auto_26921 ?auto_26963 ) ) ( not ( = ?auto_26921 ?auto_26949 ) ) ( not ( = ?auto_26921 ?auto_26947 ) ) ( not ( = ?auto_26921 ?auto_26937 ) ) ( not ( = ?auto_26921 ?auto_26933 ) ) ( not ( = ?auto_26921 ?auto_26939 ) ) ( not ( = ?auto_26921 ?auto_26951 ) ) ( not ( = ?auto_26921 ?auto_26943 ) ) ( not ( = ?auto_26921 ?auto_26964 ) ) ( not ( = ?auto_26942 ?auto_26927 ) ) ( not ( = ?auto_26942 ?auto_26960 ) ) ( not ( = ?auto_26942 ?auto_26962 ) ) ( not ( = ?auto_26942 ?auto_26948 ) ) ( not ( = ?auto_26942 ?auto_26936 ) ) ( not ( = ?auto_26942 ?auto_26946 ) ) ( not ( = ?auto_26942 ?auto_26935 ) ) ( not ( = ?auto_26955 ?auto_26928 ) ) ( not ( = ?auto_26955 ?auto_26954 ) ) ( not ( = ?auto_26955 ?auto_26934 ) ) ( not ( = ?auto_26955 ?auto_26953 ) ) ( not ( = ?auto_26955 ?auto_26965 ) ) ( not ( = ?auto_26955 ?auto_26966 ) ) ( not ( = ?auto_26955 ?auto_26958 ) ) ( not ( = ?auto_26961 ?auto_26963 ) ) ( not ( = ?auto_26961 ?auto_26949 ) ) ( not ( = ?auto_26961 ?auto_26947 ) ) ( not ( = ?auto_26961 ?auto_26937 ) ) ( not ( = ?auto_26961 ?auto_26933 ) ) ( not ( = ?auto_26961 ?auto_26939 ) ) ( not ( = ?auto_26961 ?auto_26951 ) ) ( not ( = ?auto_26961 ?auto_26943 ) ) ( not ( = ?auto_26961 ?auto_26964 ) ) ( not ( = ?auto_26911 ?auto_26922 ) ) ( not ( = ?auto_26911 ?auto_26950 ) ) ( not ( = ?auto_26912 ?auto_26922 ) ) ( not ( = ?auto_26912 ?auto_26950 ) ) ( not ( = ?auto_26913 ?auto_26922 ) ) ( not ( = ?auto_26913 ?auto_26950 ) ) ( not ( = ?auto_26914 ?auto_26922 ) ) ( not ( = ?auto_26914 ?auto_26950 ) ) ( not ( = ?auto_26915 ?auto_26922 ) ) ( not ( = ?auto_26915 ?auto_26950 ) ) ( not ( = ?auto_26916 ?auto_26922 ) ) ( not ( = ?auto_26916 ?auto_26950 ) ) ( not ( = ?auto_26917 ?auto_26922 ) ) ( not ( = ?auto_26917 ?auto_26950 ) ) ( not ( = ?auto_26918 ?auto_26922 ) ) ( not ( = ?auto_26918 ?auto_26950 ) ) ( not ( = ?auto_26919 ?auto_26922 ) ) ( not ( = ?auto_26919 ?auto_26950 ) ) ( not ( = ?auto_26920 ?auto_26922 ) ) ( not ( = ?auto_26920 ?auto_26950 ) ) ( not ( = ?auto_26922 ?auto_26961 ) ) ( not ( = ?auto_26922 ?auto_26963 ) ) ( not ( = ?auto_26922 ?auto_26949 ) ) ( not ( = ?auto_26922 ?auto_26947 ) ) ( not ( = ?auto_26922 ?auto_26937 ) ) ( not ( = ?auto_26922 ?auto_26933 ) ) ( not ( = ?auto_26922 ?auto_26939 ) ) ( not ( = ?auto_26922 ?auto_26951 ) ) ( not ( = ?auto_26922 ?auto_26943 ) ) ( not ( = ?auto_26922 ?auto_26964 ) ) ( not ( = ?auto_26944 ?auto_26942 ) ) ( not ( = ?auto_26944 ?auto_26927 ) ) ( not ( = ?auto_26944 ?auto_26960 ) ) ( not ( = ?auto_26944 ?auto_26962 ) ) ( not ( = ?auto_26944 ?auto_26948 ) ) ( not ( = ?auto_26944 ?auto_26936 ) ) ( not ( = ?auto_26944 ?auto_26946 ) ) ( not ( = ?auto_26944 ?auto_26935 ) ) ( not ( = ?auto_26957 ?auto_26955 ) ) ( not ( = ?auto_26957 ?auto_26928 ) ) ( not ( = ?auto_26957 ?auto_26954 ) ) ( not ( = ?auto_26957 ?auto_26934 ) ) ( not ( = ?auto_26957 ?auto_26953 ) ) ( not ( = ?auto_26957 ?auto_26965 ) ) ( not ( = ?auto_26957 ?auto_26966 ) ) ( not ( = ?auto_26957 ?auto_26958 ) ) ( not ( = ?auto_26950 ?auto_26961 ) ) ( not ( = ?auto_26950 ?auto_26963 ) ) ( not ( = ?auto_26950 ?auto_26949 ) ) ( not ( = ?auto_26950 ?auto_26947 ) ) ( not ( = ?auto_26950 ?auto_26937 ) ) ( not ( = ?auto_26950 ?auto_26933 ) ) ( not ( = ?auto_26950 ?auto_26939 ) ) ( not ( = ?auto_26950 ?auto_26951 ) ) ( not ( = ?auto_26950 ?auto_26943 ) ) ( not ( = ?auto_26950 ?auto_26964 ) ) ( not ( = ?auto_26911 ?auto_26923 ) ) ( not ( = ?auto_26911 ?auto_26941 ) ) ( not ( = ?auto_26912 ?auto_26923 ) ) ( not ( = ?auto_26912 ?auto_26941 ) ) ( not ( = ?auto_26913 ?auto_26923 ) ) ( not ( = ?auto_26913 ?auto_26941 ) ) ( not ( = ?auto_26914 ?auto_26923 ) ) ( not ( = ?auto_26914 ?auto_26941 ) ) ( not ( = ?auto_26915 ?auto_26923 ) ) ( not ( = ?auto_26915 ?auto_26941 ) ) ( not ( = ?auto_26916 ?auto_26923 ) ) ( not ( = ?auto_26916 ?auto_26941 ) ) ( not ( = ?auto_26917 ?auto_26923 ) ) ( not ( = ?auto_26917 ?auto_26941 ) ) ( not ( = ?auto_26918 ?auto_26923 ) ) ( not ( = ?auto_26918 ?auto_26941 ) ) ( not ( = ?auto_26919 ?auto_26923 ) ) ( not ( = ?auto_26919 ?auto_26941 ) ) ( not ( = ?auto_26920 ?auto_26923 ) ) ( not ( = ?auto_26920 ?auto_26941 ) ) ( not ( = ?auto_26921 ?auto_26923 ) ) ( not ( = ?auto_26921 ?auto_26941 ) ) ( not ( = ?auto_26923 ?auto_26950 ) ) ( not ( = ?auto_26923 ?auto_26961 ) ) ( not ( = ?auto_26923 ?auto_26963 ) ) ( not ( = ?auto_26923 ?auto_26949 ) ) ( not ( = ?auto_26923 ?auto_26947 ) ) ( not ( = ?auto_26923 ?auto_26937 ) ) ( not ( = ?auto_26923 ?auto_26933 ) ) ( not ( = ?auto_26923 ?auto_26939 ) ) ( not ( = ?auto_26923 ?auto_26951 ) ) ( not ( = ?auto_26923 ?auto_26943 ) ) ( not ( = ?auto_26923 ?auto_26964 ) ) ( not ( = ?auto_26945 ?auto_26944 ) ) ( not ( = ?auto_26945 ?auto_26942 ) ) ( not ( = ?auto_26945 ?auto_26927 ) ) ( not ( = ?auto_26945 ?auto_26960 ) ) ( not ( = ?auto_26945 ?auto_26962 ) ) ( not ( = ?auto_26945 ?auto_26948 ) ) ( not ( = ?auto_26945 ?auto_26936 ) ) ( not ( = ?auto_26945 ?auto_26946 ) ) ( not ( = ?auto_26945 ?auto_26935 ) ) ( not ( = ?auto_26952 ?auto_26957 ) ) ( not ( = ?auto_26952 ?auto_26955 ) ) ( not ( = ?auto_26952 ?auto_26928 ) ) ( not ( = ?auto_26952 ?auto_26954 ) ) ( not ( = ?auto_26952 ?auto_26934 ) ) ( not ( = ?auto_26952 ?auto_26953 ) ) ( not ( = ?auto_26952 ?auto_26965 ) ) ( not ( = ?auto_26952 ?auto_26966 ) ) ( not ( = ?auto_26952 ?auto_26958 ) ) ( not ( = ?auto_26941 ?auto_26950 ) ) ( not ( = ?auto_26941 ?auto_26961 ) ) ( not ( = ?auto_26941 ?auto_26963 ) ) ( not ( = ?auto_26941 ?auto_26949 ) ) ( not ( = ?auto_26941 ?auto_26947 ) ) ( not ( = ?auto_26941 ?auto_26937 ) ) ( not ( = ?auto_26941 ?auto_26933 ) ) ( not ( = ?auto_26941 ?auto_26939 ) ) ( not ( = ?auto_26941 ?auto_26951 ) ) ( not ( = ?auto_26941 ?auto_26943 ) ) ( not ( = ?auto_26941 ?auto_26964 ) ) ( not ( = ?auto_26911 ?auto_26924 ) ) ( not ( = ?auto_26911 ?auto_26940 ) ) ( not ( = ?auto_26912 ?auto_26924 ) ) ( not ( = ?auto_26912 ?auto_26940 ) ) ( not ( = ?auto_26913 ?auto_26924 ) ) ( not ( = ?auto_26913 ?auto_26940 ) ) ( not ( = ?auto_26914 ?auto_26924 ) ) ( not ( = ?auto_26914 ?auto_26940 ) ) ( not ( = ?auto_26915 ?auto_26924 ) ) ( not ( = ?auto_26915 ?auto_26940 ) ) ( not ( = ?auto_26916 ?auto_26924 ) ) ( not ( = ?auto_26916 ?auto_26940 ) ) ( not ( = ?auto_26917 ?auto_26924 ) ) ( not ( = ?auto_26917 ?auto_26940 ) ) ( not ( = ?auto_26918 ?auto_26924 ) ) ( not ( = ?auto_26918 ?auto_26940 ) ) ( not ( = ?auto_26919 ?auto_26924 ) ) ( not ( = ?auto_26919 ?auto_26940 ) ) ( not ( = ?auto_26920 ?auto_26924 ) ) ( not ( = ?auto_26920 ?auto_26940 ) ) ( not ( = ?auto_26921 ?auto_26924 ) ) ( not ( = ?auto_26921 ?auto_26940 ) ) ( not ( = ?auto_26922 ?auto_26924 ) ) ( not ( = ?auto_26922 ?auto_26940 ) ) ( not ( = ?auto_26924 ?auto_26941 ) ) ( not ( = ?auto_26924 ?auto_26950 ) ) ( not ( = ?auto_26924 ?auto_26961 ) ) ( not ( = ?auto_26924 ?auto_26963 ) ) ( not ( = ?auto_26924 ?auto_26949 ) ) ( not ( = ?auto_26924 ?auto_26947 ) ) ( not ( = ?auto_26924 ?auto_26937 ) ) ( not ( = ?auto_26924 ?auto_26933 ) ) ( not ( = ?auto_26924 ?auto_26939 ) ) ( not ( = ?auto_26924 ?auto_26951 ) ) ( not ( = ?auto_26924 ?auto_26943 ) ) ( not ( = ?auto_26924 ?auto_26964 ) ) ( not ( = ?auto_26956 ?auto_26945 ) ) ( not ( = ?auto_26956 ?auto_26944 ) ) ( not ( = ?auto_26956 ?auto_26942 ) ) ( not ( = ?auto_26956 ?auto_26927 ) ) ( not ( = ?auto_26956 ?auto_26960 ) ) ( not ( = ?auto_26956 ?auto_26962 ) ) ( not ( = ?auto_26956 ?auto_26948 ) ) ( not ( = ?auto_26956 ?auto_26936 ) ) ( not ( = ?auto_26956 ?auto_26946 ) ) ( not ( = ?auto_26956 ?auto_26935 ) ) ( not ( = ?auto_26959 ?auto_26952 ) ) ( not ( = ?auto_26959 ?auto_26957 ) ) ( not ( = ?auto_26959 ?auto_26955 ) ) ( not ( = ?auto_26959 ?auto_26928 ) ) ( not ( = ?auto_26959 ?auto_26954 ) ) ( not ( = ?auto_26959 ?auto_26934 ) ) ( not ( = ?auto_26959 ?auto_26953 ) ) ( not ( = ?auto_26959 ?auto_26965 ) ) ( not ( = ?auto_26959 ?auto_26966 ) ) ( not ( = ?auto_26959 ?auto_26958 ) ) ( not ( = ?auto_26940 ?auto_26941 ) ) ( not ( = ?auto_26940 ?auto_26950 ) ) ( not ( = ?auto_26940 ?auto_26961 ) ) ( not ( = ?auto_26940 ?auto_26963 ) ) ( not ( = ?auto_26940 ?auto_26949 ) ) ( not ( = ?auto_26940 ?auto_26947 ) ) ( not ( = ?auto_26940 ?auto_26937 ) ) ( not ( = ?auto_26940 ?auto_26933 ) ) ( not ( = ?auto_26940 ?auto_26939 ) ) ( not ( = ?auto_26940 ?auto_26951 ) ) ( not ( = ?auto_26940 ?auto_26943 ) ) ( not ( = ?auto_26940 ?auto_26964 ) ) ( not ( = ?auto_26911 ?auto_26925 ) ) ( not ( = ?auto_26911 ?auto_26938 ) ) ( not ( = ?auto_26912 ?auto_26925 ) ) ( not ( = ?auto_26912 ?auto_26938 ) ) ( not ( = ?auto_26913 ?auto_26925 ) ) ( not ( = ?auto_26913 ?auto_26938 ) ) ( not ( = ?auto_26914 ?auto_26925 ) ) ( not ( = ?auto_26914 ?auto_26938 ) ) ( not ( = ?auto_26915 ?auto_26925 ) ) ( not ( = ?auto_26915 ?auto_26938 ) ) ( not ( = ?auto_26916 ?auto_26925 ) ) ( not ( = ?auto_26916 ?auto_26938 ) ) ( not ( = ?auto_26917 ?auto_26925 ) ) ( not ( = ?auto_26917 ?auto_26938 ) ) ( not ( = ?auto_26918 ?auto_26925 ) ) ( not ( = ?auto_26918 ?auto_26938 ) ) ( not ( = ?auto_26919 ?auto_26925 ) ) ( not ( = ?auto_26919 ?auto_26938 ) ) ( not ( = ?auto_26920 ?auto_26925 ) ) ( not ( = ?auto_26920 ?auto_26938 ) ) ( not ( = ?auto_26921 ?auto_26925 ) ) ( not ( = ?auto_26921 ?auto_26938 ) ) ( not ( = ?auto_26922 ?auto_26925 ) ) ( not ( = ?auto_26922 ?auto_26938 ) ) ( not ( = ?auto_26923 ?auto_26925 ) ) ( not ( = ?auto_26923 ?auto_26938 ) ) ( not ( = ?auto_26925 ?auto_26940 ) ) ( not ( = ?auto_26925 ?auto_26941 ) ) ( not ( = ?auto_26925 ?auto_26950 ) ) ( not ( = ?auto_26925 ?auto_26961 ) ) ( not ( = ?auto_26925 ?auto_26963 ) ) ( not ( = ?auto_26925 ?auto_26949 ) ) ( not ( = ?auto_26925 ?auto_26947 ) ) ( not ( = ?auto_26925 ?auto_26937 ) ) ( not ( = ?auto_26925 ?auto_26933 ) ) ( not ( = ?auto_26925 ?auto_26939 ) ) ( not ( = ?auto_26925 ?auto_26951 ) ) ( not ( = ?auto_26925 ?auto_26943 ) ) ( not ( = ?auto_26925 ?auto_26964 ) ) ( not ( = ?auto_26938 ?auto_26940 ) ) ( not ( = ?auto_26938 ?auto_26941 ) ) ( not ( = ?auto_26938 ?auto_26950 ) ) ( not ( = ?auto_26938 ?auto_26961 ) ) ( not ( = ?auto_26938 ?auto_26963 ) ) ( not ( = ?auto_26938 ?auto_26949 ) ) ( not ( = ?auto_26938 ?auto_26947 ) ) ( not ( = ?auto_26938 ?auto_26937 ) ) ( not ( = ?auto_26938 ?auto_26933 ) ) ( not ( = ?auto_26938 ?auto_26939 ) ) ( not ( = ?auto_26938 ?auto_26951 ) ) ( not ( = ?auto_26938 ?auto_26943 ) ) ( not ( = ?auto_26938 ?auto_26964 ) ) ( not ( = ?auto_26911 ?auto_26926 ) ) ( not ( = ?auto_26911 ?auto_26929 ) ) ( not ( = ?auto_26912 ?auto_26926 ) ) ( not ( = ?auto_26912 ?auto_26929 ) ) ( not ( = ?auto_26913 ?auto_26926 ) ) ( not ( = ?auto_26913 ?auto_26929 ) ) ( not ( = ?auto_26914 ?auto_26926 ) ) ( not ( = ?auto_26914 ?auto_26929 ) ) ( not ( = ?auto_26915 ?auto_26926 ) ) ( not ( = ?auto_26915 ?auto_26929 ) ) ( not ( = ?auto_26916 ?auto_26926 ) ) ( not ( = ?auto_26916 ?auto_26929 ) ) ( not ( = ?auto_26917 ?auto_26926 ) ) ( not ( = ?auto_26917 ?auto_26929 ) ) ( not ( = ?auto_26918 ?auto_26926 ) ) ( not ( = ?auto_26918 ?auto_26929 ) ) ( not ( = ?auto_26919 ?auto_26926 ) ) ( not ( = ?auto_26919 ?auto_26929 ) ) ( not ( = ?auto_26920 ?auto_26926 ) ) ( not ( = ?auto_26920 ?auto_26929 ) ) ( not ( = ?auto_26921 ?auto_26926 ) ) ( not ( = ?auto_26921 ?auto_26929 ) ) ( not ( = ?auto_26922 ?auto_26926 ) ) ( not ( = ?auto_26922 ?auto_26929 ) ) ( not ( = ?auto_26923 ?auto_26926 ) ) ( not ( = ?auto_26923 ?auto_26929 ) ) ( not ( = ?auto_26924 ?auto_26926 ) ) ( not ( = ?auto_26924 ?auto_26929 ) ) ( not ( = ?auto_26926 ?auto_26938 ) ) ( not ( = ?auto_26926 ?auto_26940 ) ) ( not ( = ?auto_26926 ?auto_26941 ) ) ( not ( = ?auto_26926 ?auto_26950 ) ) ( not ( = ?auto_26926 ?auto_26961 ) ) ( not ( = ?auto_26926 ?auto_26963 ) ) ( not ( = ?auto_26926 ?auto_26949 ) ) ( not ( = ?auto_26926 ?auto_26947 ) ) ( not ( = ?auto_26926 ?auto_26937 ) ) ( not ( = ?auto_26926 ?auto_26933 ) ) ( not ( = ?auto_26926 ?auto_26939 ) ) ( not ( = ?auto_26926 ?auto_26951 ) ) ( not ( = ?auto_26926 ?auto_26943 ) ) ( not ( = ?auto_26926 ?auto_26964 ) ) ( not ( = ?auto_26929 ?auto_26938 ) ) ( not ( = ?auto_26929 ?auto_26940 ) ) ( not ( = ?auto_26929 ?auto_26941 ) ) ( not ( = ?auto_26929 ?auto_26950 ) ) ( not ( = ?auto_26929 ?auto_26961 ) ) ( not ( = ?auto_26929 ?auto_26963 ) ) ( not ( = ?auto_26929 ?auto_26949 ) ) ( not ( = ?auto_26929 ?auto_26947 ) ) ( not ( = ?auto_26929 ?auto_26937 ) ) ( not ( = ?auto_26929 ?auto_26933 ) ) ( not ( = ?auto_26929 ?auto_26939 ) ) ( not ( = ?auto_26929 ?auto_26951 ) ) ( not ( = ?auto_26929 ?auto_26943 ) ) ( not ( = ?auto_26929 ?auto_26964 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_26911 ?auto_26912 ?auto_26913 ?auto_26914 ?auto_26915 ?auto_26916 ?auto_26917 ?auto_26918 ?auto_26919 ?auto_26920 ?auto_26921 ?auto_26922 ?auto_26923 ?auto_26924 ?auto_26925 )
      ( MAKE-1CRATE ?auto_26925 ?auto_26926 )
      ( MAKE-15CRATE-VERIFY ?auto_26911 ?auto_26912 ?auto_26913 ?auto_26914 ?auto_26915 ?auto_26916 ?auto_26917 ?auto_26918 ?auto_26919 ?auto_26920 ?auto_26921 ?auto_26922 ?auto_26923 ?auto_26924 ?auto_26925 ?auto_26926 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_26994 - SURFACE
      ?auto_26995 - SURFACE
      ?auto_26996 - SURFACE
      ?auto_26997 - SURFACE
      ?auto_26998 - SURFACE
      ?auto_26999 - SURFACE
      ?auto_27000 - SURFACE
      ?auto_27001 - SURFACE
      ?auto_27002 - SURFACE
      ?auto_27003 - SURFACE
      ?auto_27004 - SURFACE
      ?auto_27005 - SURFACE
      ?auto_27006 - SURFACE
      ?auto_27007 - SURFACE
      ?auto_27008 - SURFACE
      ?auto_27009 - SURFACE
      ?auto_27010 - SURFACE
    )
    :vars
    (
      ?auto_27011 - HOIST
      ?auto_27016 - PLACE
      ?auto_27014 - PLACE
      ?auto_27015 - HOIST
      ?auto_27012 - SURFACE
      ?auto_27047 - PLACE
      ?auto_27035 - HOIST
      ?auto_27038 - SURFACE
      ?auto_27033 - PLACE
      ?auto_27019 - HOIST
      ?auto_27024 - SURFACE
      ?auto_27043 - PLACE
      ?auto_27044 - HOIST
      ?auto_27023 - SURFACE
      ?auto_27030 - PLACE
      ?auto_27025 - HOIST
      ?auto_27021 - SURFACE
      ?auto_27039 - SURFACE
      ?auto_27051 - PLACE
      ?auto_27042 - HOIST
      ?auto_27017 - SURFACE
      ?auto_27037 - SURFACE
      ?auto_27034 - PLACE
      ?auto_27036 - HOIST
      ?auto_27032 - SURFACE
      ?auto_27018 - SURFACE
      ?auto_27046 - PLACE
      ?auto_27022 - HOIST
      ?auto_27029 - SURFACE
      ?auto_27026 - PLACE
      ?auto_27045 - HOIST
      ?auto_27040 - SURFACE
      ?auto_27031 - SURFACE
      ?auto_27020 - PLACE
      ?auto_27041 - HOIST
      ?auto_27049 - SURFACE
      ?auto_27048 - SURFACE
      ?auto_27027 - PLACE
      ?auto_27050 - HOIST
      ?auto_27028 - SURFACE
      ?auto_27013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27011 ?auto_27016 ) ( IS-CRATE ?auto_27010 ) ( not ( = ?auto_27014 ?auto_27016 ) ) ( HOIST-AT ?auto_27015 ?auto_27014 ) ( SURFACE-AT ?auto_27010 ?auto_27014 ) ( ON ?auto_27010 ?auto_27012 ) ( CLEAR ?auto_27010 ) ( not ( = ?auto_27009 ?auto_27010 ) ) ( not ( = ?auto_27009 ?auto_27012 ) ) ( not ( = ?auto_27010 ?auto_27012 ) ) ( not ( = ?auto_27011 ?auto_27015 ) ) ( IS-CRATE ?auto_27009 ) ( not ( = ?auto_27047 ?auto_27016 ) ) ( HOIST-AT ?auto_27035 ?auto_27047 ) ( SURFACE-AT ?auto_27009 ?auto_27047 ) ( ON ?auto_27009 ?auto_27038 ) ( CLEAR ?auto_27009 ) ( not ( = ?auto_27008 ?auto_27009 ) ) ( not ( = ?auto_27008 ?auto_27038 ) ) ( not ( = ?auto_27009 ?auto_27038 ) ) ( not ( = ?auto_27011 ?auto_27035 ) ) ( IS-CRATE ?auto_27008 ) ( not ( = ?auto_27033 ?auto_27016 ) ) ( HOIST-AT ?auto_27019 ?auto_27033 ) ( SURFACE-AT ?auto_27008 ?auto_27033 ) ( ON ?auto_27008 ?auto_27024 ) ( CLEAR ?auto_27008 ) ( not ( = ?auto_27007 ?auto_27008 ) ) ( not ( = ?auto_27007 ?auto_27024 ) ) ( not ( = ?auto_27008 ?auto_27024 ) ) ( not ( = ?auto_27011 ?auto_27019 ) ) ( IS-CRATE ?auto_27007 ) ( not ( = ?auto_27043 ?auto_27016 ) ) ( HOIST-AT ?auto_27044 ?auto_27043 ) ( AVAILABLE ?auto_27044 ) ( SURFACE-AT ?auto_27007 ?auto_27043 ) ( ON ?auto_27007 ?auto_27023 ) ( CLEAR ?auto_27007 ) ( not ( = ?auto_27006 ?auto_27007 ) ) ( not ( = ?auto_27006 ?auto_27023 ) ) ( not ( = ?auto_27007 ?auto_27023 ) ) ( not ( = ?auto_27011 ?auto_27044 ) ) ( IS-CRATE ?auto_27006 ) ( not ( = ?auto_27030 ?auto_27016 ) ) ( HOIST-AT ?auto_27025 ?auto_27030 ) ( AVAILABLE ?auto_27025 ) ( SURFACE-AT ?auto_27006 ?auto_27030 ) ( ON ?auto_27006 ?auto_27021 ) ( CLEAR ?auto_27006 ) ( not ( = ?auto_27005 ?auto_27006 ) ) ( not ( = ?auto_27005 ?auto_27021 ) ) ( not ( = ?auto_27006 ?auto_27021 ) ) ( not ( = ?auto_27011 ?auto_27025 ) ) ( IS-CRATE ?auto_27005 ) ( AVAILABLE ?auto_27015 ) ( SURFACE-AT ?auto_27005 ?auto_27014 ) ( ON ?auto_27005 ?auto_27039 ) ( CLEAR ?auto_27005 ) ( not ( = ?auto_27004 ?auto_27005 ) ) ( not ( = ?auto_27004 ?auto_27039 ) ) ( not ( = ?auto_27005 ?auto_27039 ) ) ( IS-CRATE ?auto_27004 ) ( not ( = ?auto_27051 ?auto_27016 ) ) ( HOIST-AT ?auto_27042 ?auto_27051 ) ( AVAILABLE ?auto_27042 ) ( SURFACE-AT ?auto_27004 ?auto_27051 ) ( ON ?auto_27004 ?auto_27017 ) ( CLEAR ?auto_27004 ) ( not ( = ?auto_27003 ?auto_27004 ) ) ( not ( = ?auto_27003 ?auto_27017 ) ) ( not ( = ?auto_27004 ?auto_27017 ) ) ( not ( = ?auto_27011 ?auto_27042 ) ) ( IS-CRATE ?auto_27003 ) ( SURFACE-AT ?auto_27003 ?auto_27047 ) ( ON ?auto_27003 ?auto_27037 ) ( CLEAR ?auto_27003 ) ( not ( = ?auto_27002 ?auto_27003 ) ) ( not ( = ?auto_27002 ?auto_27037 ) ) ( not ( = ?auto_27003 ?auto_27037 ) ) ( IS-CRATE ?auto_27002 ) ( not ( = ?auto_27034 ?auto_27016 ) ) ( HOIST-AT ?auto_27036 ?auto_27034 ) ( SURFACE-AT ?auto_27002 ?auto_27034 ) ( ON ?auto_27002 ?auto_27032 ) ( CLEAR ?auto_27002 ) ( not ( = ?auto_27001 ?auto_27002 ) ) ( not ( = ?auto_27001 ?auto_27032 ) ) ( not ( = ?auto_27002 ?auto_27032 ) ) ( not ( = ?auto_27011 ?auto_27036 ) ) ( IS-CRATE ?auto_27001 ) ( AVAILABLE ?auto_27036 ) ( SURFACE-AT ?auto_27001 ?auto_27034 ) ( ON ?auto_27001 ?auto_27018 ) ( CLEAR ?auto_27001 ) ( not ( = ?auto_27000 ?auto_27001 ) ) ( not ( = ?auto_27000 ?auto_27018 ) ) ( not ( = ?auto_27001 ?auto_27018 ) ) ( IS-CRATE ?auto_27000 ) ( not ( = ?auto_27046 ?auto_27016 ) ) ( HOIST-AT ?auto_27022 ?auto_27046 ) ( AVAILABLE ?auto_27022 ) ( SURFACE-AT ?auto_27000 ?auto_27046 ) ( ON ?auto_27000 ?auto_27029 ) ( CLEAR ?auto_27000 ) ( not ( = ?auto_26999 ?auto_27000 ) ) ( not ( = ?auto_26999 ?auto_27029 ) ) ( not ( = ?auto_27000 ?auto_27029 ) ) ( not ( = ?auto_27011 ?auto_27022 ) ) ( IS-CRATE ?auto_26999 ) ( not ( = ?auto_27026 ?auto_27016 ) ) ( HOIST-AT ?auto_27045 ?auto_27026 ) ( AVAILABLE ?auto_27045 ) ( SURFACE-AT ?auto_26999 ?auto_27026 ) ( ON ?auto_26999 ?auto_27040 ) ( CLEAR ?auto_26999 ) ( not ( = ?auto_26998 ?auto_26999 ) ) ( not ( = ?auto_26998 ?auto_27040 ) ) ( not ( = ?auto_26999 ?auto_27040 ) ) ( not ( = ?auto_27011 ?auto_27045 ) ) ( IS-CRATE ?auto_26998 ) ( AVAILABLE ?auto_27035 ) ( SURFACE-AT ?auto_26998 ?auto_27047 ) ( ON ?auto_26998 ?auto_27031 ) ( CLEAR ?auto_26998 ) ( not ( = ?auto_26997 ?auto_26998 ) ) ( not ( = ?auto_26997 ?auto_27031 ) ) ( not ( = ?auto_26998 ?auto_27031 ) ) ( IS-CRATE ?auto_26997 ) ( not ( = ?auto_27020 ?auto_27016 ) ) ( HOIST-AT ?auto_27041 ?auto_27020 ) ( AVAILABLE ?auto_27041 ) ( SURFACE-AT ?auto_26997 ?auto_27020 ) ( ON ?auto_26997 ?auto_27049 ) ( CLEAR ?auto_26997 ) ( not ( = ?auto_26996 ?auto_26997 ) ) ( not ( = ?auto_26996 ?auto_27049 ) ) ( not ( = ?auto_26997 ?auto_27049 ) ) ( not ( = ?auto_27011 ?auto_27041 ) ) ( IS-CRATE ?auto_26996 ) ( AVAILABLE ?auto_27019 ) ( SURFACE-AT ?auto_26996 ?auto_27033 ) ( ON ?auto_26996 ?auto_27048 ) ( CLEAR ?auto_26996 ) ( not ( = ?auto_26995 ?auto_26996 ) ) ( not ( = ?auto_26995 ?auto_27048 ) ) ( not ( = ?auto_26996 ?auto_27048 ) ) ( SURFACE-AT ?auto_26994 ?auto_27016 ) ( CLEAR ?auto_26994 ) ( IS-CRATE ?auto_26995 ) ( AVAILABLE ?auto_27011 ) ( not ( = ?auto_27027 ?auto_27016 ) ) ( HOIST-AT ?auto_27050 ?auto_27027 ) ( AVAILABLE ?auto_27050 ) ( SURFACE-AT ?auto_26995 ?auto_27027 ) ( ON ?auto_26995 ?auto_27028 ) ( CLEAR ?auto_26995 ) ( TRUCK-AT ?auto_27013 ?auto_27016 ) ( not ( = ?auto_26994 ?auto_26995 ) ) ( not ( = ?auto_26994 ?auto_27028 ) ) ( not ( = ?auto_26995 ?auto_27028 ) ) ( not ( = ?auto_27011 ?auto_27050 ) ) ( not ( = ?auto_26994 ?auto_26996 ) ) ( not ( = ?auto_26994 ?auto_27048 ) ) ( not ( = ?auto_26996 ?auto_27028 ) ) ( not ( = ?auto_27033 ?auto_27027 ) ) ( not ( = ?auto_27019 ?auto_27050 ) ) ( not ( = ?auto_27048 ?auto_27028 ) ) ( not ( = ?auto_26994 ?auto_26997 ) ) ( not ( = ?auto_26994 ?auto_27049 ) ) ( not ( = ?auto_26995 ?auto_26997 ) ) ( not ( = ?auto_26995 ?auto_27049 ) ) ( not ( = ?auto_26997 ?auto_27048 ) ) ( not ( = ?auto_26997 ?auto_27028 ) ) ( not ( = ?auto_27020 ?auto_27033 ) ) ( not ( = ?auto_27020 ?auto_27027 ) ) ( not ( = ?auto_27041 ?auto_27019 ) ) ( not ( = ?auto_27041 ?auto_27050 ) ) ( not ( = ?auto_27049 ?auto_27048 ) ) ( not ( = ?auto_27049 ?auto_27028 ) ) ( not ( = ?auto_26994 ?auto_26998 ) ) ( not ( = ?auto_26994 ?auto_27031 ) ) ( not ( = ?auto_26995 ?auto_26998 ) ) ( not ( = ?auto_26995 ?auto_27031 ) ) ( not ( = ?auto_26996 ?auto_26998 ) ) ( not ( = ?auto_26996 ?auto_27031 ) ) ( not ( = ?auto_26998 ?auto_27049 ) ) ( not ( = ?auto_26998 ?auto_27048 ) ) ( not ( = ?auto_26998 ?auto_27028 ) ) ( not ( = ?auto_27047 ?auto_27020 ) ) ( not ( = ?auto_27047 ?auto_27033 ) ) ( not ( = ?auto_27047 ?auto_27027 ) ) ( not ( = ?auto_27035 ?auto_27041 ) ) ( not ( = ?auto_27035 ?auto_27019 ) ) ( not ( = ?auto_27035 ?auto_27050 ) ) ( not ( = ?auto_27031 ?auto_27049 ) ) ( not ( = ?auto_27031 ?auto_27048 ) ) ( not ( = ?auto_27031 ?auto_27028 ) ) ( not ( = ?auto_26994 ?auto_26999 ) ) ( not ( = ?auto_26994 ?auto_27040 ) ) ( not ( = ?auto_26995 ?auto_26999 ) ) ( not ( = ?auto_26995 ?auto_27040 ) ) ( not ( = ?auto_26996 ?auto_26999 ) ) ( not ( = ?auto_26996 ?auto_27040 ) ) ( not ( = ?auto_26997 ?auto_26999 ) ) ( not ( = ?auto_26997 ?auto_27040 ) ) ( not ( = ?auto_26999 ?auto_27031 ) ) ( not ( = ?auto_26999 ?auto_27049 ) ) ( not ( = ?auto_26999 ?auto_27048 ) ) ( not ( = ?auto_26999 ?auto_27028 ) ) ( not ( = ?auto_27026 ?auto_27047 ) ) ( not ( = ?auto_27026 ?auto_27020 ) ) ( not ( = ?auto_27026 ?auto_27033 ) ) ( not ( = ?auto_27026 ?auto_27027 ) ) ( not ( = ?auto_27045 ?auto_27035 ) ) ( not ( = ?auto_27045 ?auto_27041 ) ) ( not ( = ?auto_27045 ?auto_27019 ) ) ( not ( = ?auto_27045 ?auto_27050 ) ) ( not ( = ?auto_27040 ?auto_27031 ) ) ( not ( = ?auto_27040 ?auto_27049 ) ) ( not ( = ?auto_27040 ?auto_27048 ) ) ( not ( = ?auto_27040 ?auto_27028 ) ) ( not ( = ?auto_26994 ?auto_27000 ) ) ( not ( = ?auto_26994 ?auto_27029 ) ) ( not ( = ?auto_26995 ?auto_27000 ) ) ( not ( = ?auto_26995 ?auto_27029 ) ) ( not ( = ?auto_26996 ?auto_27000 ) ) ( not ( = ?auto_26996 ?auto_27029 ) ) ( not ( = ?auto_26997 ?auto_27000 ) ) ( not ( = ?auto_26997 ?auto_27029 ) ) ( not ( = ?auto_26998 ?auto_27000 ) ) ( not ( = ?auto_26998 ?auto_27029 ) ) ( not ( = ?auto_27000 ?auto_27040 ) ) ( not ( = ?auto_27000 ?auto_27031 ) ) ( not ( = ?auto_27000 ?auto_27049 ) ) ( not ( = ?auto_27000 ?auto_27048 ) ) ( not ( = ?auto_27000 ?auto_27028 ) ) ( not ( = ?auto_27046 ?auto_27026 ) ) ( not ( = ?auto_27046 ?auto_27047 ) ) ( not ( = ?auto_27046 ?auto_27020 ) ) ( not ( = ?auto_27046 ?auto_27033 ) ) ( not ( = ?auto_27046 ?auto_27027 ) ) ( not ( = ?auto_27022 ?auto_27045 ) ) ( not ( = ?auto_27022 ?auto_27035 ) ) ( not ( = ?auto_27022 ?auto_27041 ) ) ( not ( = ?auto_27022 ?auto_27019 ) ) ( not ( = ?auto_27022 ?auto_27050 ) ) ( not ( = ?auto_27029 ?auto_27040 ) ) ( not ( = ?auto_27029 ?auto_27031 ) ) ( not ( = ?auto_27029 ?auto_27049 ) ) ( not ( = ?auto_27029 ?auto_27048 ) ) ( not ( = ?auto_27029 ?auto_27028 ) ) ( not ( = ?auto_26994 ?auto_27001 ) ) ( not ( = ?auto_26994 ?auto_27018 ) ) ( not ( = ?auto_26995 ?auto_27001 ) ) ( not ( = ?auto_26995 ?auto_27018 ) ) ( not ( = ?auto_26996 ?auto_27001 ) ) ( not ( = ?auto_26996 ?auto_27018 ) ) ( not ( = ?auto_26997 ?auto_27001 ) ) ( not ( = ?auto_26997 ?auto_27018 ) ) ( not ( = ?auto_26998 ?auto_27001 ) ) ( not ( = ?auto_26998 ?auto_27018 ) ) ( not ( = ?auto_26999 ?auto_27001 ) ) ( not ( = ?auto_26999 ?auto_27018 ) ) ( not ( = ?auto_27001 ?auto_27029 ) ) ( not ( = ?auto_27001 ?auto_27040 ) ) ( not ( = ?auto_27001 ?auto_27031 ) ) ( not ( = ?auto_27001 ?auto_27049 ) ) ( not ( = ?auto_27001 ?auto_27048 ) ) ( not ( = ?auto_27001 ?auto_27028 ) ) ( not ( = ?auto_27034 ?auto_27046 ) ) ( not ( = ?auto_27034 ?auto_27026 ) ) ( not ( = ?auto_27034 ?auto_27047 ) ) ( not ( = ?auto_27034 ?auto_27020 ) ) ( not ( = ?auto_27034 ?auto_27033 ) ) ( not ( = ?auto_27034 ?auto_27027 ) ) ( not ( = ?auto_27036 ?auto_27022 ) ) ( not ( = ?auto_27036 ?auto_27045 ) ) ( not ( = ?auto_27036 ?auto_27035 ) ) ( not ( = ?auto_27036 ?auto_27041 ) ) ( not ( = ?auto_27036 ?auto_27019 ) ) ( not ( = ?auto_27036 ?auto_27050 ) ) ( not ( = ?auto_27018 ?auto_27029 ) ) ( not ( = ?auto_27018 ?auto_27040 ) ) ( not ( = ?auto_27018 ?auto_27031 ) ) ( not ( = ?auto_27018 ?auto_27049 ) ) ( not ( = ?auto_27018 ?auto_27048 ) ) ( not ( = ?auto_27018 ?auto_27028 ) ) ( not ( = ?auto_26994 ?auto_27002 ) ) ( not ( = ?auto_26994 ?auto_27032 ) ) ( not ( = ?auto_26995 ?auto_27002 ) ) ( not ( = ?auto_26995 ?auto_27032 ) ) ( not ( = ?auto_26996 ?auto_27002 ) ) ( not ( = ?auto_26996 ?auto_27032 ) ) ( not ( = ?auto_26997 ?auto_27002 ) ) ( not ( = ?auto_26997 ?auto_27032 ) ) ( not ( = ?auto_26998 ?auto_27002 ) ) ( not ( = ?auto_26998 ?auto_27032 ) ) ( not ( = ?auto_26999 ?auto_27002 ) ) ( not ( = ?auto_26999 ?auto_27032 ) ) ( not ( = ?auto_27000 ?auto_27002 ) ) ( not ( = ?auto_27000 ?auto_27032 ) ) ( not ( = ?auto_27002 ?auto_27018 ) ) ( not ( = ?auto_27002 ?auto_27029 ) ) ( not ( = ?auto_27002 ?auto_27040 ) ) ( not ( = ?auto_27002 ?auto_27031 ) ) ( not ( = ?auto_27002 ?auto_27049 ) ) ( not ( = ?auto_27002 ?auto_27048 ) ) ( not ( = ?auto_27002 ?auto_27028 ) ) ( not ( = ?auto_27032 ?auto_27018 ) ) ( not ( = ?auto_27032 ?auto_27029 ) ) ( not ( = ?auto_27032 ?auto_27040 ) ) ( not ( = ?auto_27032 ?auto_27031 ) ) ( not ( = ?auto_27032 ?auto_27049 ) ) ( not ( = ?auto_27032 ?auto_27048 ) ) ( not ( = ?auto_27032 ?auto_27028 ) ) ( not ( = ?auto_26994 ?auto_27003 ) ) ( not ( = ?auto_26994 ?auto_27037 ) ) ( not ( = ?auto_26995 ?auto_27003 ) ) ( not ( = ?auto_26995 ?auto_27037 ) ) ( not ( = ?auto_26996 ?auto_27003 ) ) ( not ( = ?auto_26996 ?auto_27037 ) ) ( not ( = ?auto_26997 ?auto_27003 ) ) ( not ( = ?auto_26997 ?auto_27037 ) ) ( not ( = ?auto_26998 ?auto_27003 ) ) ( not ( = ?auto_26998 ?auto_27037 ) ) ( not ( = ?auto_26999 ?auto_27003 ) ) ( not ( = ?auto_26999 ?auto_27037 ) ) ( not ( = ?auto_27000 ?auto_27003 ) ) ( not ( = ?auto_27000 ?auto_27037 ) ) ( not ( = ?auto_27001 ?auto_27003 ) ) ( not ( = ?auto_27001 ?auto_27037 ) ) ( not ( = ?auto_27003 ?auto_27032 ) ) ( not ( = ?auto_27003 ?auto_27018 ) ) ( not ( = ?auto_27003 ?auto_27029 ) ) ( not ( = ?auto_27003 ?auto_27040 ) ) ( not ( = ?auto_27003 ?auto_27031 ) ) ( not ( = ?auto_27003 ?auto_27049 ) ) ( not ( = ?auto_27003 ?auto_27048 ) ) ( not ( = ?auto_27003 ?auto_27028 ) ) ( not ( = ?auto_27037 ?auto_27032 ) ) ( not ( = ?auto_27037 ?auto_27018 ) ) ( not ( = ?auto_27037 ?auto_27029 ) ) ( not ( = ?auto_27037 ?auto_27040 ) ) ( not ( = ?auto_27037 ?auto_27031 ) ) ( not ( = ?auto_27037 ?auto_27049 ) ) ( not ( = ?auto_27037 ?auto_27048 ) ) ( not ( = ?auto_27037 ?auto_27028 ) ) ( not ( = ?auto_26994 ?auto_27004 ) ) ( not ( = ?auto_26994 ?auto_27017 ) ) ( not ( = ?auto_26995 ?auto_27004 ) ) ( not ( = ?auto_26995 ?auto_27017 ) ) ( not ( = ?auto_26996 ?auto_27004 ) ) ( not ( = ?auto_26996 ?auto_27017 ) ) ( not ( = ?auto_26997 ?auto_27004 ) ) ( not ( = ?auto_26997 ?auto_27017 ) ) ( not ( = ?auto_26998 ?auto_27004 ) ) ( not ( = ?auto_26998 ?auto_27017 ) ) ( not ( = ?auto_26999 ?auto_27004 ) ) ( not ( = ?auto_26999 ?auto_27017 ) ) ( not ( = ?auto_27000 ?auto_27004 ) ) ( not ( = ?auto_27000 ?auto_27017 ) ) ( not ( = ?auto_27001 ?auto_27004 ) ) ( not ( = ?auto_27001 ?auto_27017 ) ) ( not ( = ?auto_27002 ?auto_27004 ) ) ( not ( = ?auto_27002 ?auto_27017 ) ) ( not ( = ?auto_27004 ?auto_27037 ) ) ( not ( = ?auto_27004 ?auto_27032 ) ) ( not ( = ?auto_27004 ?auto_27018 ) ) ( not ( = ?auto_27004 ?auto_27029 ) ) ( not ( = ?auto_27004 ?auto_27040 ) ) ( not ( = ?auto_27004 ?auto_27031 ) ) ( not ( = ?auto_27004 ?auto_27049 ) ) ( not ( = ?auto_27004 ?auto_27048 ) ) ( not ( = ?auto_27004 ?auto_27028 ) ) ( not ( = ?auto_27051 ?auto_27047 ) ) ( not ( = ?auto_27051 ?auto_27034 ) ) ( not ( = ?auto_27051 ?auto_27046 ) ) ( not ( = ?auto_27051 ?auto_27026 ) ) ( not ( = ?auto_27051 ?auto_27020 ) ) ( not ( = ?auto_27051 ?auto_27033 ) ) ( not ( = ?auto_27051 ?auto_27027 ) ) ( not ( = ?auto_27042 ?auto_27035 ) ) ( not ( = ?auto_27042 ?auto_27036 ) ) ( not ( = ?auto_27042 ?auto_27022 ) ) ( not ( = ?auto_27042 ?auto_27045 ) ) ( not ( = ?auto_27042 ?auto_27041 ) ) ( not ( = ?auto_27042 ?auto_27019 ) ) ( not ( = ?auto_27042 ?auto_27050 ) ) ( not ( = ?auto_27017 ?auto_27037 ) ) ( not ( = ?auto_27017 ?auto_27032 ) ) ( not ( = ?auto_27017 ?auto_27018 ) ) ( not ( = ?auto_27017 ?auto_27029 ) ) ( not ( = ?auto_27017 ?auto_27040 ) ) ( not ( = ?auto_27017 ?auto_27031 ) ) ( not ( = ?auto_27017 ?auto_27049 ) ) ( not ( = ?auto_27017 ?auto_27048 ) ) ( not ( = ?auto_27017 ?auto_27028 ) ) ( not ( = ?auto_26994 ?auto_27005 ) ) ( not ( = ?auto_26994 ?auto_27039 ) ) ( not ( = ?auto_26995 ?auto_27005 ) ) ( not ( = ?auto_26995 ?auto_27039 ) ) ( not ( = ?auto_26996 ?auto_27005 ) ) ( not ( = ?auto_26996 ?auto_27039 ) ) ( not ( = ?auto_26997 ?auto_27005 ) ) ( not ( = ?auto_26997 ?auto_27039 ) ) ( not ( = ?auto_26998 ?auto_27005 ) ) ( not ( = ?auto_26998 ?auto_27039 ) ) ( not ( = ?auto_26999 ?auto_27005 ) ) ( not ( = ?auto_26999 ?auto_27039 ) ) ( not ( = ?auto_27000 ?auto_27005 ) ) ( not ( = ?auto_27000 ?auto_27039 ) ) ( not ( = ?auto_27001 ?auto_27005 ) ) ( not ( = ?auto_27001 ?auto_27039 ) ) ( not ( = ?auto_27002 ?auto_27005 ) ) ( not ( = ?auto_27002 ?auto_27039 ) ) ( not ( = ?auto_27003 ?auto_27005 ) ) ( not ( = ?auto_27003 ?auto_27039 ) ) ( not ( = ?auto_27005 ?auto_27017 ) ) ( not ( = ?auto_27005 ?auto_27037 ) ) ( not ( = ?auto_27005 ?auto_27032 ) ) ( not ( = ?auto_27005 ?auto_27018 ) ) ( not ( = ?auto_27005 ?auto_27029 ) ) ( not ( = ?auto_27005 ?auto_27040 ) ) ( not ( = ?auto_27005 ?auto_27031 ) ) ( not ( = ?auto_27005 ?auto_27049 ) ) ( not ( = ?auto_27005 ?auto_27048 ) ) ( not ( = ?auto_27005 ?auto_27028 ) ) ( not ( = ?auto_27014 ?auto_27051 ) ) ( not ( = ?auto_27014 ?auto_27047 ) ) ( not ( = ?auto_27014 ?auto_27034 ) ) ( not ( = ?auto_27014 ?auto_27046 ) ) ( not ( = ?auto_27014 ?auto_27026 ) ) ( not ( = ?auto_27014 ?auto_27020 ) ) ( not ( = ?auto_27014 ?auto_27033 ) ) ( not ( = ?auto_27014 ?auto_27027 ) ) ( not ( = ?auto_27015 ?auto_27042 ) ) ( not ( = ?auto_27015 ?auto_27035 ) ) ( not ( = ?auto_27015 ?auto_27036 ) ) ( not ( = ?auto_27015 ?auto_27022 ) ) ( not ( = ?auto_27015 ?auto_27045 ) ) ( not ( = ?auto_27015 ?auto_27041 ) ) ( not ( = ?auto_27015 ?auto_27019 ) ) ( not ( = ?auto_27015 ?auto_27050 ) ) ( not ( = ?auto_27039 ?auto_27017 ) ) ( not ( = ?auto_27039 ?auto_27037 ) ) ( not ( = ?auto_27039 ?auto_27032 ) ) ( not ( = ?auto_27039 ?auto_27018 ) ) ( not ( = ?auto_27039 ?auto_27029 ) ) ( not ( = ?auto_27039 ?auto_27040 ) ) ( not ( = ?auto_27039 ?auto_27031 ) ) ( not ( = ?auto_27039 ?auto_27049 ) ) ( not ( = ?auto_27039 ?auto_27048 ) ) ( not ( = ?auto_27039 ?auto_27028 ) ) ( not ( = ?auto_26994 ?auto_27006 ) ) ( not ( = ?auto_26994 ?auto_27021 ) ) ( not ( = ?auto_26995 ?auto_27006 ) ) ( not ( = ?auto_26995 ?auto_27021 ) ) ( not ( = ?auto_26996 ?auto_27006 ) ) ( not ( = ?auto_26996 ?auto_27021 ) ) ( not ( = ?auto_26997 ?auto_27006 ) ) ( not ( = ?auto_26997 ?auto_27021 ) ) ( not ( = ?auto_26998 ?auto_27006 ) ) ( not ( = ?auto_26998 ?auto_27021 ) ) ( not ( = ?auto_26999 ?auto_27006 ) ) ( not ( = ?auto_26999 ?auto_27021 ) ) ( not ( = ?auto_27000 ?auto_27006 ) ) ( not ( = ?auto_27000 ?auto_27021 ) ) ( not ( = ?auto_27001 ?auto_27006 ) ) ( not ( = ?auto_27001 ?auto_27021 ) ) ( not ( = ?auto_27002 ?auto_27006 ) ) ( not ( = ?auto_27002 ?auto_27021 ) ) ( not ( = ?auto_27003 ?auto_27006 ) ) ( not ( = ?auto_27003 ?auto_27021 ) ) ( not ( = ?auto_27004 ?auto_27006 ) ) ( not ( = ?auto_27004 ?auto_27021 ) ) ( not ( = ?auto_27006 ?auto_27039 ) ) ( not ( = ?auto_27006 ?auto_27017 ) ) ( not ( = ?auto_27006 ?auto_27037 ) ) ( not ( = ?auto_27006 ?auto_27032 ) ) ( not ( = ?auto_27006 ?auto_27018 ) ) ( not ( = ?auto_27006 ?auto_27029 ) ) ( not ( = ?auto_27006 ?auto_27040 ) ) ( not ( = ?auto_27006 ?auto_27031 ) ) ( not ( = ?auto_27006 ?auto_27049 ) ) ( not ( = ?auto_27006 ?auto_27048 ) ) ( not ( = ?auto_27006 ?auto_27028 ) ) ( not ( = ?auto_27030 ?auto_27014 ) ) ( not ( = ?auto_27030 ?auto_27051 ) ) ( not ( = ?auto_27030 ?auto_27047 ) ) ( not ( = ?auto_27030 ?auto_27034 ) ) ( not ( = ?auto_27030 ?auto_27046 ) ) ( not ( = ?auto_27030 ?auto_27026 ) ) ( not ( = ?auto_27030 ?auto_27020 ) ) ( not ( = ?auto_27030 ?auto_27033 ) ) ( not ( = ?auto_27030 ?auto_27027 ) ) ( not ( = ?auto_27025 ?auto_27015 ) ) ( not ( = ?auto_27025 ?auto_27042 ) ) ( not ( = ?auto_27025 ?auto_27035 ) ) ( not ( = ?auto_27025 ?auto_27036 ) ) ( not ( = ?auto_27025 ?auto_27022 ) ) ( not ( = ?auto_27025 ?auto_27045 ) ) ( not ( = ?auto_27025 ?auto_27041 ) ) ( not ( = ?auto_27025 ?auto_27019 ) ) ( not ( = ?auto_27025 ?auto_27050 ) ) ( not ( = ?auto_27021 ?auto_27039 ) ) ( not ( = ?auto_27021 ?auto_27017 ) ) ( not ( = ?auto_27021 ?auto_27037 ) ) ( not ( = ?auto_27021 ?auto_27032 ) ) ( not ( = ?auto_27021 ?auto_27018 ) ) ( not ( = ?auto_27021 ?auto_27029 ) ) ( not ( = ?auto_27021 ?auto_27040 ) ) ( not ( = ?auto_27021 ?auto_27031 ) ) ( not ( = ?auto_27021 ?auto_27049 ) ) ( not ( = ?auto_27021 ?auto_27048 ) ) ( not ( = ?auto_27021 ?auto_27028 ) ) ( not ( = ?auto_26994 ?auto_27007 ) ) ( not ( = ?auto_26994 ?auto_27023 ) ) ( not ( = ?auto_26995 ?auto_27007 ) ) ( not ( = ?auto_26995 ?auto_27023 ) ) ( not ( = ?auto_26996 ?auto_27007 ) ) ( not ( = ?auto_26996 ?auto_27023 ) ) ( not ( = ?auto_26997 ?auto_27007 ) ) ( not ( = ?auto_26997 ?auto_27023 ) ) ( not ( = ?auto_26998 ?auto_27007 ) ) ( not ( = ?auto_26998 ?auto_27023 ) ) ( not ( = ?auto_26999 ?auto_27007 ) ) ( not ( = ?auto_26999 ?auto_27023 ) ) ( not ( = ?auto_27000 ?auto_27007 ) ) ( not ( = ?auto_27000 ?auto_27023 ) ) ( not ( = ?auto_27001 ?auto_27007 ) ) ( not ( = ?auto_27001 ?auto_27023 ) ) ( not ( = ?auto_27002 ?auto_27007 ) ) ( not ( = ?auto_27002 ?auto_27023 ) ) ( not ( = ?auto_27003 ?auto_27007 ) ) ( not ( = ?auto_27003 ?auto_27023 ) ) ( not ( = ?auto_27004 ?auto_27007 ) ) ( not ( = ?auto_27004 ?auto_27023 ) ) ( not ( = ?auto_27005 ?auto_27007 ) ) ( not ( = ?auto_27005 ?auto_27023 ) ) ( not ( = ?auto_27007 ?auto_27021 ) ) ( not ( = ?auto_27007 ?auto_27039 ) ) ( not ( = ?auto_27007 ?auto_27017 ) ) ( not ( = ?auto_27007 ?auto_27037 ) ) ( not ( = ?auto_27007 ?auto_27032 ) ) ( not ( = ?auto_27007 ?auto_27018 ) ) ( not ( = ?auto_27007 ?auto_27029 ) ) ( not ( = ?auto_27007 ?auto_27040 ) ) ( not ( = ?auto_27007 ?auto_27031 ) ) ( not ( = ?auto_27007 ?auto_27049 ) ) ( not ( = ?auto_27007 ?auto_27048 ) ) ( not ( = ?auto_27007 ?auto_27028 ) ) ( not ( = ?auto_27043 ?auto_27030 ) ) ( not ( = ?auto_27043 ?auto_27014 ) ) ( not ( = ?auto_27043 ?auto_27051 ) ) ( not ( = ?auto_27043 ?auto_27047 ) ) ( not ( = ?auto_27043 ?auto_27034 ) ) ( not ( = ?auto_27043 ?auto_27046 ) ) ( not ( = ?auto_27043 ?auto_27026 ) ) ( not ( = ?auto_27043 ?auto_27020 ) ) ( not ( = ?auto_27043 ?auto_27033 ) ) ( not ( = ?auto_27043 ?auto_27027 ) ) ( not ( = ?auto_27044 ?auto_27025 ) ) ( not ( = ?auto_27044 ?auto_27015 ) ) ( not ( = ?auto_27044 ?auto_27042 ) ) ( not ( = ?auto_27044 ?auto_27035 ) ) ( not ( = ?auto_27044 ?auto_27036 ) ) ( not ( = ?auto_27044 ?auto_27022 ) ) ( not ( = ?auto_27044 ?auto_27045 ) ) ( not ( = ?auto_27044 ?auto_27041 ) ) ( not ( = ?auto_27044 ?auto_27019 ) ) ( not ( = ?auto_27044 ?auto_27050 ) ) ( not ( = ?auto_27023 ?auto_27021 ) ) ( not ( = ?auto_27023 ?auto_27039 ) ) ( not ( = ?auto_27023 ?auto_27017 ) ) ( not ( = ?auto_27023 ?auto_27037 ) ) ( not ( = ?auto_27023 ?auto_27032 ) ) ( not ( = ?auto_27023 ?auto_27018 ) ) ( not ( = ?auto_27023 ?auto_27029 ) ) ( not ( = ?auto_27023 ?auto_27040 ) ) ( not ( = ?auto_27023 ?auto_27031 ) ) ( not ( = ?auto_27023 ?auto_27049 ) ) ( not ( = ?auto_27023 ?auto_27048 ) ) ( not ( = ?auto_27023 ?auto_27028 ) ) ( not ( = ?auto_26994 ?auto_27008 ) ) ( not ( = ?auto_26994 ?auto_27024 ) ) ( not ( = ?auto_26995 ?auto_27008 ) ) ( not ( = ?auto_26995 ?auto_27024 ) ) ( not ( = ?auto_26996 ?auto_27008 ) ) ( not ( = ?auto_26996 ?auto_27024 ) ) ( not ( = ?auto_26997 ?auto_27008 ) ) ( not ( = ?auto_26997 ?auto_27024 ) ) ( not ( = ?auto_26998 ?auto_27008 ) ) ( not ( = ?auto_26998 ?auto_27024 ) ) ( not ( = ?auto_26999 ?auto_27008 ) ) ( not ( = ?auto_26999 ?auto_27024 ) ) ( not ( = ?auto_27000 ?auto_27008 ) ) ( not ( = ?auto_27000 ?auto_27024 ) ) ( not ( = ?auto_27001 ?auto_27008 ) ) ( not ( = ?auto_27001 ?auto_27024 ) ) ( not ( = ?auto_27002 ?auto_27008 ) ) ( not ( = ?auto_27002 ?auto_27024 ) ) ( not ( = ?auto_27003 ?auto_27008 ) ) ( not ( = ?auto_27003 ?auto_27024 ) ) ( not ( = ?auto_27004 ?auto_27008 ) ) ( not ( = ?auto_27004 ?auto_27024 ) ) ( not ( = ?auto_27005 ?auto_27008 ) ) ( not ( = ?auto_27005 ?auto_27024 ) ) ( not ( = ?auto_27006 ?auto_27008 ) ) ( not ( = ?auto_27006 ?auto_27024 ) ) ( not ( = ?auto_27008 ?auto_27023 ) ) ( not ( = ?auto_27008 ?auto_27021 ) ) ( not ( = ?auto_27008 ?auto_27039 ) ) ( not ( = ?auto_27008 ?auto_27017 ) ) ( not ( = ?auto_27008 ?auto_27037 ) ) ( not ( = ?auto_27008 ?auto_27032 ) ) ( not ( = ?auto_27008 ?auto_27018 ) ) ( not ( = ?auto_27008 ?auto_27029 ) ) ( not ( = ?auto_27008 ?auto_27040 ) ) ( not ( = ?auto_27008 ?auto_27031 ) ) ( not ( = ?auto_27008 ?auto_27049 ) ) ( not ( = ?auto_27008 ?auto_27048 ) ) ( not ( = ?auto_27008 ?auto_27028 ) ) ( not ( = ?auto_27024 ?auto_27023 ) ) ( not ( = ?auto_27024 ?auto_27021 ) ) ( not ( = ?auto_27024 ?auto_27039 ) ) ( not ( = ?auto_27024 ?auto_27017 ) ) ( not ( = ?auto_27024 ?auto_27037 ) ) ( not ( = ?auto_27024 ?auto_27032 ) ) ( not ( = ?auto_27024 ?auto_27018 ) ) ( not ( = ?auto_27024 ?auto_27029 ) ) ( not ( = ?auto_27024 ?auto_27040 ) ) ( not ( = ?auto_27024 ?auto_27031 ) ) ( not ( = ?auto_27024 ?auto_27049 ) ) ( not ( = ?auto_27024 ?auto_27048 ) ) ( not ( = ?auto_27024 ?auto_27028 ) ) ( not ( = ?auto_26994 ?auto_27009 ) ) ( not ( = ?auto_26994 ?auto_27038 ) ) ( not ( = ?auto_26995 ?auto_27009 ) ) ( not ( = ?auto_26995 ?auto_27038 ) ) ( not ( = ?auto_26996 ?auto_27009 ) ) ( not ( = ?auto_26996 ?auto_27038 ) ) ( not ( = ?auto_26997 ?auto_27009 ) ) ( not ( = ?auto_26997 ?auto_27038 ) ) ( not ( = ?auto_26998 ?auto_27009 ) ) ( not ( = ?auto_26998 ?auto_27038 ) ) ( not ( = ?auto_26999 ?auto_27009 ) ) ( not ( = ?auto_26999 ?auto_27038 ) ) ( not ( = ?auto_27000 ?auto_27009 ) ) ( not ( = ?auto_27000 ?auto_27038 ) ) ( not ( = ?auto_27001 ?auto_27009 ) ) ( not ( = ?auto_27001 ?auto_27038 ) ) ( not ( = ?auto_27002 ?auto_27009 ) ) ( not ( = ?auto_27002 ?auto_27038 ) ) ( not ( = ?auto_27003 ?auto_27009 ) ) ( not ( = ?auto_27003 ?auto_27038 ) ) ( not ( = ?auto_27004 ?auto_27009 ) ) ( not ( = ?auto_27004 ?auto_27038 ) ) ( not ( = ?auto_27005 ?auto_27009 ) ) ( not ( = ?auto_27005 ?auto_27038 ) ) ( not ( = ?auto_27006 ?auto_27009 ) ) ( not ( = ?auto_27006 ?auto_27038 ) ) ( not ( = ?auto_27007 ?auto_27009 ) ) ( not ( = ?auto_27007 ?auto_27038 ) ) ( not ( = ?auto_27009 ?auto_27024 ) ) ( not ( = ?auto_27009 ?auto_27023 ) ) ( not ( = ?auto_27009 ?auto_27021 ) ) ( not ( = ?auto_27009 ?auto_27039 ) ) ( not ( = ?auto_27009 ?auto_27017 ) ) ( not ( = ?auto_27009 ?auto_27037 ) ) ( not ( = ?auto_27009 ?auto_27032 ) ) ( not ( = ?auto_27009 ?auto_27018 ) ) ( not ( = ?auto_27009 ?auto_27029 ) ) ( not ( = ?auto_27009 ?auto_27040 ) ) ( not ( = ?auto_27009 ?auto_27031 ) ) ( not ( = ?auto_27009 ?auto_27049 ) ) ( not ( = ?auto_27009 ?auto_27048 ) ) ( not ( = ?auto_27009 ?auto_27028 ) ) ( not ( = ?auto_27038 ?auto_27024 ) ) ( not ( = ?auto_27038 ?auto_27023 ) ) ( not ( = ?auto_27038 ?auto_27021 ) ) ( not ( = ?auto_27038 ?auto_27039 ) ) ( not ( = ?auto_27038 ?auto_27017 ) ) ( not ( = ?auto_27038 ?auto_27037 ) ) ( not ( = ?auto_27038 ?auto_27032 ) ) ( not ( = ?auto_27038 ?auto_27018 ) ) ( not ( = ?auto_27038 ?auto_27029 ) ) ( not ( = ?auto_27038 ?auto_27040 ) ) ( not ( = ?auto_27038 ?auto_27031 ) ) ( not ( = ?auto_27038 ?auto_27049 ) ) ( not ( = ?auto_27038 ?auto_27048 ) ) ( not ( = ?auto_27038 ?auto_27028 ) ) ( not ( = ?auto_26994 ?auto_27010 ) ) ( not ( = ?auto_26994 ?auto_27012 ) ) ( not ( = ?auto_26995 ?auto_27010 ) ) ( not ( = ?auto_26995 ?auto_27012 ) ) ( not ( = ?auto_26996 ?auto_27010 ) ) ( not ( = ?auto_26996 ?auto_27012 ) ) ( not ( = ?auto_26997 ?auto_27010 ) ) ( not ( = ?auto_26997 ?auto_27012 ) ) ( not ( = ?auto_26998 ?auto_27010 ) ) ( not ( = ?auto_26998 ?auto_27012 ) ) ( not ( = ?auto_26999 ?auto_27010 ) ) ( not ( = ?auto_26999 ?auto_27012 ) ) ( not ( = ?auto_27000 ?auto_27010 ) ) ( not ( = ?auto_27000 ?auto_27012 ) ) ( not ( = ?auto_27001 ?auto_27010 ) ) ( not ( = ?auto_27001 ?auto_27012 ) ) ( not ( = ?auto_27002 ?auto_27010 ) ) ( not ( = ?auto_27002 ?auto_27012 ) ) ( not ( = ?auto_27003 ?auto_27010 ) ) ( not ( = ?auto_27003 ?auto_27012 ) ) ( not ( = ?auto_27004 ?auto_27010 ) ) ( not ( = ?auto_27004 ?auto_27012 ) ) ( not ( = ?auto_27005 ?auto_27010 ) ) ( not ( = ?auto_27005 ?auto_27012 ) ) ( not ( = ?auto_27006 ?auto_27010 ) ) ( not ( = ?auto_27006 ?auto_27012 ) ) ( not ( = ?auto_27007 ?auto_27010 ) ) ( not ( = ?auto_27007 ?auto_27012 ) ) ( not ( = ?auto_27008 ?auto_27010 ) ) ( not ( = ?auto_27008 ?auto_27012 ) ) ( not ( = ?auto_27010 ?auto_27038 ) ) ( not ( = ?auto_27010 ?auto_27024 ) ) ( not ( = ?auto_27010 ?auto_27023 ) ) ( not ( = ?auto_27010 ?auto_27021 ) ) ( not ( = ?auto_27010 ?auto_27039 ) ) ( not ( = ?auto_27010 ?auto_27017 ) ) ( not ( = ?auto_27010 ?auto_27037 ) ) ( not ( = ?auto_27010 ?auto_27032 ) ) ( not ( = ?auto_27010 ?auto_27018 ) ) ( not ( = ?auto_27010 ?auto_27029 ) ) ( not ( = ?auto_27010 ?auto_27040 ) ) ( not ( = ?auto_27010 ?auto_27031 ) ) ( not ( = ?auto_27010 ?auto_27049 ) ) ( not ( = ?auto_27010 ?auto_27048 ) ) ( not ( = ?auto_27010 ?auto_27028 ) ) ( not ( = ?auto_27012 ?auto_27038 ) ) ( not ( = ?auto_27012 ?auto_27024 ) ) ( not ( = ?auto_27012 ?auto_27023 ) ) ( not ( = ?auto_27012 ?auto_27021 ) ) ( not ( = ?auto_27012 ?auto_27039 ) ) ( not ( = ?auto_27012 ?auto_27017 ) ) ( not ( = ?auto_27012 ?auto_27037 ) ) ( not ( = ?auto_27012 ?auto_27032 ) ) ( not ( = ?auto_27012 ?auto_27018 ) ) ( not ( = ?auto_27012 ?auto_27029 ) ) ( not ( = ?auto_27012 ?auto_27040 ) ) ( not ( = ?auto_27012 ?auto_27031 ) ) ( not ( = ?auto_27012 ?auto_27049 ) ) ( not ( = ?auto_27012 ?auto_27048 ) ) ( not ( = ?auto_27012 ?auto_27028 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_26994 ?auto_26995 ?auto_26996 ?auto_26997 ?auto_26998 ?auto_26999 ?auto_27000 ?auto_27001 ?auto_27002 ?auto_27003 ?auto_27004 ?auto_27005 ?auto_27006 ?auto_27007 ?auto_27008 ?auto_27009 )
      ( MAKE-1CRATE ?auto_27009 ?auto_27010 )
      ( MAKE-16CRATE-VERIFY ?auto_26994 ?auto_26995 ?auto_26996 ?auto_26997 ?auto_26998 ?auto_26999 ?auto_27000 ?auto_27001 ?auto_27002 ?auto_27003 ?auto_27004 ?auto_27005 ?auto_27006 ?auto_27007 ?auto_27008 ?auto_27009 ?auto_27010 ) )
  )

)

