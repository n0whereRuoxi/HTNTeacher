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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_246 - SURFACE
      ?auto_247 - SURFACE
    )
    :vars
    (
      ?auto_248 - HOIST
      ?auto_249 - PLACE
      ?auto_251 - PLACE
      ?auto_252 - HOIST
      ?auto_253 - SURFACE
      ?auto_250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_248 ?auto_249 ) ( SURFACE-AT ?auto_246 ?auto_249 ) ( CLEAR ?auto_246 ) ( IS-CRATE ?auto_247 ) ( AVAILABLE ?auto_248 ) ( not ( = ?auto_251 ?auto_249 ) ) ( HOIST-AT ?auto_252 ?auto_251 ) ( AVAILABLE ?auto_252 ) ( SURFACE-AT ?auto_247 ?auto_251 ) ( ON ?auto_247 ?auto_253 ) ( CLEAR ?auto_247 ) ( TRUCK-AT ?auto_250 ?auto_249 ) ( not ( = ?auto_246 ?auto_247 ) ) ( not ( = ?auto_246 ?auto_253 ) ) ( not ( = ?auto_247 ?auto_253 ) ) ( not ( = ?auto_248 ?auto_252 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_250 ?auto_249 ?auto_251 )
      ( !LIFT ?auto_252 ?auto_247 ?auto_253 ?auto_251 )
      ( !LOAD ?auto_252 ?auto_247 ?auto_250 ?auto_251 )
      ( !DRIVE ?auto_250 ?auto_251 ?auto_249 )
      ( !UNLOAD ?auto_248 ?auto_247 ?auto_250 ?auto_249 )
      ( !DROP ?auto_248 ?auto_247 ?auto_246 ?auto_249 )
      ( MAKE-1CRATE-VERIFY ?auto_246 ?auto_247 ) )
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
      ?auto_260 - HOIST
      ?auto_261 - PLACE
      ?auto_265 - PLACE
      ?auto_264 - HOIST
      ?auto_262 - SURFACE
      ?auto_267 - PLACE
      ?auto_268 - HOIST
      ?auto_266 - SURFACE
      ?auto_263 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_260 ?auto_261 ) ( IS-CRATE ?auto_259 ) ( not ( = ?auto_265 ?auto_261 ) ) ( HOIST-AT ?auto_264 ?auto_265 ) ( AVAILABLE ?auto_264 ) ( SURFACE-AT ?auto_259 ?auto_265 ) ( ON ?auto_259 ?auto_262 ) ( CLEAR ?auto_259 ) ( not ( = ?auto_258 ?auto_259 ) ) ( not ( = ?auto_258 ?auto_262 ) ) ( not ( = ?auto_259 ?auto_262 ) ) ( not ( = ?auto_260 ?auto_264 ) ) ( SURFACE-AT ?auto_257 ?auto_261 ) ( CLEAR ?auto_257 ) ( IS-CRATE ?auto_258 ) ( AVAILABLE ?auto_260 ) ( not ( = ?auto_267 ?auto_261 ) ) ( HOIST-AT ?auto_268 ?auto_267 ) ( AVAILABLE ?auto_268 ) ( SURFACE-AT ?auto_258 ?auto_267 ) ( ON ?auto_258 ?auto_266 ) ( CLEAR ?auto_258 ) ( TRUCK-AT ?auto_263 ?auto_261 ) ( not ( = ?auto_257 ?auto_258 ) ) ( not ( = ?auto_257 ?auto_266 ) ) ( not ( = ?auto_258 ?auto_266 ) ) ( not ( = ?auto_260 ?auto_268 ) ) ( not ( = ?auto_257 ?auto_259 ) ) ( not ( = ?auto_257 ?auto_262 ) ) ( not ( = ?auto_259 ?auto_266 ) ) ( not ( = ?auto_265 ?auto_267 ) ) ( not ( = ?auto_264 ?auto_268 ) ) ( not ( = ?auto_262 ?auto_266 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_257 ?auto_258 )
      ( MAKE-1CRATE ?auto_258 ?auto_259 )
      ( MAKE-2CRATE-VERIFY ?auto_257 ?auto_258 ?auto_259 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_271 - SURFACE
      ?auto_272 - SURFACE
    )
    :vars
    (
      ?auto_273 - HOIST
      ?auto_274 - PLACE
      ?auto_276 - PLACE
      ?auto_277 - HOIST
      ?auto_278 - SURFACE
      ?auto_275 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_273 ?auto_274 ) ( SURFACE-AT ?auto_271 ?auto_274 ) ( CLEAR ?auto_271 ) ( IS-CRATE ?auto_272 ) ( AVAILABLE ?auto_273 ) ( not ( = ?auto_276 ?auto_274 ) ) ( HOIST-AT ?auto_277 ?auto_276 ) ( AVAILABLE ?auto_277 ) ( SURFACE-AT ?auto_272 ?auto_276 ) ( ON ?auto_272 ?auto_278 ) ( CLEAR ?auto_272 ) ( TRUCK-AT ?auto_275 ?auto_274 ) ( not ( = ?auto_271 ?auto_272 ) ) ( not ( = ?auto_271 ?auto_278 ) ) ( not ( = ?auto_272 ?auto_278 ) ) ( not ( = ?auto_273 ?auto_277 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_275 ?auto_274 ?auto_276 )
      ( !LIFT ?auto_277 ?auto_272 ?auto_278 ?auto_276 )
      ( !LOAD ?auto_277 ?auto_272 ?auto_275 ?auto_276 )
      ( !DRIVE ?auto_275 ?auto_276 ?auto_274 )
      ( !UNLOAD ?auto_273 ?auto_272 ?auto_275 ?auto_274 )
      ( !DROP ?auto_273 ?auto_272 ?auto_271 ?auto_274 )
      ( MAKE-1CRATE-VERIFY ?auto_271 ?auto_272 ) )
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
      ?auto_287 - PLACE
      ?auto_292 - PLACE
      ?auto_290 - HOIST
      ?auto_288 - SURFACE
      ?auto_296 - PLACE
      ?auto_295 - HOIST
      ?auto_294 - SURFACE
      ?auto_293 - SURFACE
      ?auto_291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_289 ?auto_287 ) ( IS-CRATE ?auto_286 ) ( not ( = ?auto_292 ?auto_287 ) ) ( HOIST-AT ?auto_290 ?auto_292 ) ( SURFACE-AT ?auto_286 ?auto_292 ) ( ON ?auto_286 ?auto_288 ) ( CLEAR ?auto_286 ) ( not ( = ?auto_285 ?auto_286 ) ) ( not ( = ?auto_285 ?auto_288 ) ) ( not ( = ?auto_286 ?auto_288 ) ) ( not ( = ?auto_289 ?auto_290 ) ) ( IS-CRATE ?auto_285 ) ( not ( = ?auto_296 ?auto_287 ) ) ( HOIST-AT ?auto_295 ?auto_296 ) ( AVAILABLE ?auto_295 ) ( SURFACE-AT ?auto_285 ?auto_296 ) ( ON ?auto_285 ?auto_294 ) ( CLEAR ?auto_285 ) ( not ( = ?auto_284 ?auto_285 ) ) ( not ( = ?auto_284 ?auto_294 ) ) ( not ( = ?auto_285 ?auto_294 ) ) ( not ( = ?auto_289 ?auto_295 ) ) ( SURFACE-AT ?auto_283 ?auto_287 ) ( CLEAR ?auto_283 ) ( IS-CRATE ?auto_284 ) ( AVAILABLE ?auto_289 ) ( AVAILABLE ?auto_290 ) ( SURFACE-AT ?auto_284 ?auto_292 ) ( ON ?auto_284 ?auto_293 ) ( CLEAR ?auto_284 ) ( TRUCK-AT ?auto_291 ?auto_287 ) ( not ( = ?auto_283 ?auto_284 ) ) ( not ( = ?auto_283 ?auto_293 ) ) ( not ( = ?auto_284 ?auto_293 ) ) ( not ( = ?auto_283 ?auto_285 ) ) ( not ( = ?auto_283 ?auto_294 ) ) ( not ( = ?auto_285 ?auto_293 ) ) ( not ( = ?auto_296 ?auto_292 ) ) ( not ( = ?auto_295 ?auto_290 ) ) ( not ( = ?auto_294 ?auto_293 ) ) ( not ( = ?auto_283 ?auto_286 ) ) ( not ( = ?auto_283 ?auto_288 ) ) ( not ( = ?auto_284 ?auto_286 ) ) ( not ( = ?auto_284 ?auto_288 ) ) ( not ( = ?auto_286 ?auto_294 ) ) ( not ( = ?auto_286 ?auto_293 ) ) ( not ( = ?auto_288 ?auto_294 ) ) ( not ( = ?auto_288 ?auto_293 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_283 ?auto_284 ?auto_285 )
      ( MAKE-1CRATE ?auto_285 ?auto_286 )
      ( MAKE-3CRATE-VERIFY ?auto_283 ?auto_284 ?auto_285 ?auto_286 ) )
  )

)

