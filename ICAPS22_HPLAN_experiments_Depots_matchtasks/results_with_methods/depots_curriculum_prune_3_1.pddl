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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_236 - SURFACE
      ?auto_237 - SURFACE
    )
    :vars
    (
      ?auto_238 - HOIST
      ?auto_239 - PLACE
      ?auto_241 - PLACE
      ?auto_242 - HOIST
      ?auto_243 - SURFACE
      ?auto_240 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_238 ?auto_239 ) ( SURFACE-AT ?auto_236 ?auto_239 ) ( CLEAR ?auto_236 ) ( IS-CRATE ?auto_237 ) ( AVAILABLE ?auto_238 ) ( not ( = ?auto_241 ?auto_239 ) ) ( HOIST-AT ?auto_242 ?auto_241 ) ( AVAILABLE ?auto_242 ) ( SURFACE-AT ?auto_237 ?auto_241 ) ( ON ?auto_237 ?auto_243 ) ( CLEAR ?auto_237 ) ( TRUCK-AT ?auto_240 ?auto_239 ) ( not ( = ?auto_236 ?auto_237 ) ) ( not ( = ?auto_236 ?auto_243 ) ) ( not ( = ?auto_237 ?auto_243 ) ) ( not ( = ?auto_238 ?auto_242 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_240 ?auto_239 ?auto_241 )
      ( !LIFT ?auto_242 ?auto_237 ?auto_243 ?auto_241 )
      ( !LOAD ?auto_242 ?auto_237 ?auto_240 ?auto_241 )
      ( !DRIVE ?auto_240 ?auto_241 ?auto_239 )
      ( !UNLOAD ?auto_238 ?auto_237 ?auto_240 ?auto_239 )
      ( !DROP ?auto_238 ?auto_237 ?auto_236 ?auto_239 )
      ( MAKE-1CRATE-VERIFY ?auto_236 ?auto_237 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_257 - SURFACE
      ?auto_258 - SURFACE
      ?auto_259 - SURFACE
    )
    :vars
    (
      ?auto_262 - HOIST
      ?auto_263 - PLACE
      ?auto_261 - PLACE
      ?auto_264 - HOIST
      ?auto_260 - SURFACE
      ?auto_266 - PLACE
      ?auto_267 - HOIST
      ?auto_268 - SURFACE
      ?auto_265 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_262 ?auto_263 ) ( IS-CRATE ?auto_259 ) ( not ( = ?auto_261 ?auto_263 ) ) ( HOIST-AT ?auto_264 ?auto_261 ) ( AVAILABLE ?auto_264 ) ( SURFACE-AT ?auto_259 ?auto_261 ) ( ON ?auto_259 ?auto_260 ) ( CLEAR ?auto_259 ) ( not ( = ?auto_258 ?auto_259 ) ) ( not ( = ?auto_258 ?auto_260 ) ) ( not ( = ?auto_259 ?auto_260 ) ) ( not ( = ?auto_262 ?auto_264 ) ) ( SURFACE-AT ?auto_257 ?auto_263 ) ( CLEAR ?auto_257 ) ( IS-CRATE ?auto_258 ) ( AVAILABLE ?auto_262 ) ( not ( = ?auto_266 ?auto_263 ) ) ( HOIST-AT ?auto_267 ?auto_266 ) ( AVAILABLE ?auto_267 ) ( SURFACE-AT ?auto_258 ?auto_266 ) ( ON ?auto_258 ?auto_268 ) ( CLEAR ?auto_258 ) ( TRUCK-AT ?auto_265 ?auto_263 ) ( not ( = ?auto_257 ?auto_258 ) ) ( not ( = ?auto_257 ?auto_268 ) ) ( not ( = ?auto_258 ?auto_268 ) ) ( not ( = ?auto_262 ?auto_267 ) ) ( not ( = ?auto_257 ?auto_259 ) ) ( not ( = ?auto_257 ?auto_260 ) ) ( not ( = ?auto_259 ?auto_268 ) ) ( not ( = ?auto_261 ?auto_266 ) ) ( not ( = ?auto_264 ?auto_267 ) ) ( not ( = ?auto_260 ?auto_268 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_257 ?auto_258 )
      ( MAKE-1CRATE ?auto_258 ?auto_259 )
      ( MAKE-2CRATE-VERIFY ?auto_257 ?auto_258 ?auto_259 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_283 - SURFACE
      ?auto_284 - SURFACE
      ?auto_285 - SURFACE
      ?auto_286 - SURFACE
    )
    :vars
    (
      ?auto_289 - HOIST
      ?auto_291 - PLACE
      ?auto_290 - PLACE
      ?auto_287 - HOIST
      ?auto_288 - SURFACE
      ?auto_294 - PLACE
      ?auto_296 - HOIST
      ?auto_293 - SURFACE
      ?auto_295 - SURFACE
      ?auto_292 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_289 ?auto_291 ) ( IS-CRATE ?auto_286 ) ( not ( = ?auto_290 ?auto_291 ) ) ( HOIST-AT ?auto_287 ?auto_290 ) ( SURFACE-AT ?auto_286 ?auto_290 ) ( ON ?auto_286 ?auto_288 ) ( CLEAR ?auto_286 ) ( not ( = ?auto_285 ?auto_286 ) ) ( not ( = ?auto_285 ?auto_288 ) ) ( not ( = ?auto_286 ?auto_288 ) ) ( not ( = ?auto_289 ?auto_287 ) ) ( IS-CRATE ?auto_285 ) ( not ( = ?auto_294 ?auto_291 ) ) ( HOIST-AT ?auto_296 ?auto_294 ) ( AVAILABLE ?auto_296 ) ( SURFACE-AT ?auto_285 ?auto_294 ) ( ON ?auto_285 ?auto_293 ) ( CLEAR ?auto_285 ) ( not ( = ?auto_284 ?auto_285 ) ) ( not ( = ?auto_284 ?auto_293 ) ) ( not ( = ?auto_285 ?auto_293 ) ) ( not ( = ?auto_289 ?auto_296 ) ) ( SURFACE-AT ?auto_283 ?auto_291 ) ( CLEAR ?auto_283 ) ( IS-CRATE ?auto_284 ) ( AVAILABLE ?auto_289 ) ( AVAILABLE ?auto_287 ) ( SURFACE-AT ?auto_284 ?auto_290 ) ( ON ?auto_284 ?auto_295 ) ( CLEAR ?auto_284 ) ( TRUCK-AT ?auto_292 ?auto_291 ) ( not ( = ?auto_283 ?auto_284 ) ) ( not ( = ?auto_283 ?auto_295 ) ) ( not ( = ?auto_284 ?auto_295 ) ) ( not ( = ?auto_283 ?auto_285 ) ) ( not ( = ?auto_283 ?auto_293 ) ) ( not ( = ?auto_285 ?auto_295 ) ) ( not ( = ?auto_294 ?auto_290 ) ) ( not ( = ?auto_296 ?auto_287 ) ) ( not ( = ?auto_293 ?auto_295 ) ) ( not ( = ?auto_283 ?auto_286 ) ) ( not ( = ?auto_283 ?auto_288 ) ) ( not ( = ?auto_284 ?auto_286 ) ) ( not ( = ?auto_284 ?auto_288 ) ) ( not ( = ?auto_286 ?auto_293 ) ) ( not ( = ?auto_286 ?auto_295 ) ) ( not ( = ?auto_288 ?auto_293 ) ) ( not ( = ?auto_288 ?auto_295 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_283 ?auto_284 ?auto_285 )
      ( MAKE-1CRATE ?auto_285 ?auto_286 )
      ( MAKE-3CRATE-VERIFY ?auto_283 ?auto_284 ?auto_285 ?auto_286 ) )
  )

)

