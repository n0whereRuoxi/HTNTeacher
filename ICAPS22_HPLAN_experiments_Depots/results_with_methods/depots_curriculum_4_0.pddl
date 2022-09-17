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
      ?auto_252 - SURFACE
      ?auto_253 - SURFACE
    )
    :vars
    (
      ?auto_254 - HOIST
      ?auto_255 - PLACE
      ?auto_257 - PLACE
      ?auto_258 - HOIST
      ?auto_259 - SURFACE
      ?auto_256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_254 ?auto_255 ) ( SURFACE-AT ?auto_253 ?auto_255 ) ( CLEAR ?auto_253 ) ( IS-CRATE ?auto_252 ) ( AVAILABLE ?auto_254 ) ( not ( = ?auto_257 ?auto_255 ) ) ( HOIST-AT ?auto_258 ?auto_257 ) ( AVAILABLE ?auto_258 ) ( SURFACE-AT ?auto_252 ?auto_257 ) ( ON ?auto_252 ?auto_259 ) ( CLEAR ?auto_252 ) ( TRUCK-AT ?auto_256 ?auto_255 ) ( not ( = ?auto_252 ?auto_253 ) ) ( not ( = ?auto_252 ?auto_259 ) ) ( not ( = ?auto_253 ?auto_259 ) ) ( not ( = ?auto_254 ?auto_258 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_256 ?auto_255 ?auto_257 )
      ( !LIFT ?auto_258 ?auto_252 ?auto_259 ?auto_257 )
      ( !LOAD ?auto_258 ?auto_252 ?auto_256 ?auto_257 )
      ( !DRIVE ?auto_256 ?auto_257 ?auto_255 )
      ( !UNLOAD ?auto_254 ?auto_252 ?auto_256 ?auto_255 )
      ( !DROP ?auto_254 ?auto_252 ?auto_253 ?auto_255 )
      ( MAKE-ON-VERIFY ?auto_252 ?auto_253 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_262 - SURFACE
      ?auto_263 - SURFACE
    )
    :vars
    (
      ?auto_264 - HOIST
      ?auto_265 - PLACE
      ?auto_267 - PLACE
      ?auto_268 - HOIST
      ?auto_269 - SURFACE
      ?auto_266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264 ?auto_265 ) ( SURFACE-AT ?auto_263 ?auto_265 ) ( CLEAR ?auto_263 ) ( IS-CRATE ?auto_262 ) ( AVAILABLE ?auto_264 ) ( not ( = ?auto_267 ?auto_265 ) ) ( HOIST-AT ?auto_268 ?auto_267 ) ( AVAILABLE ?auto_268 ) ( SURFACE-AT ?auto_262 ?auto_267 ) ( ON ?auto_262 ?auto_269 ) ( CLEAR ?auto_262 ) ( TRUCK-AT ?auto_266 ?auto_265 ) ( not ( = ?auto_262 ?auto_263 ) ) ( not ( = ?auto_262 ?auto_269 ) ) ( not ( = ?auto_263 ?auto_269 ) ) ( not ( = ?auto_264 ?auto_268 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_266 ?auto_265 ?auto_267 )
      ( !LIFT ?auto_268 ?auto_262 ?auto_269 ?auto_267 )
      ( !LOAD ?auto_268 ?auto_262 ?auto_266 ?auto_267 )
      ( !DRIVE ?auto_266 ?auto_267 ?auto_265 )
      ( !UNLOAD ?auto_264 ?auto_262 ?auto_266 ?auto_265 )
      ( !DROP ?auto_264 ?auto_262 ?auto_263 ?auto_265 )
      ( MAKE-ON-VERIFY ?auto_262 ?auto_263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_272 - SURFACE
      ?auto_273 - SURFACE
    )
    :vars
    (
      ?auto_274 - HOIST
      ?auto_275 - PLACE
      ?auto_277 - PLACE
      ?auto_278 - HOIST
      ?auto_279 - SURFACE
      ?auto_276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_274 ?auto_275 ) ( SURFACE-AT ?auto_273 ?auto_275 ) ( CLEAR ?auto_273 ) ( IS-CRATE ?auto_272 ) ( AVAILABLE ?auto_274 ) ( not ( = ?auto_277 ?auto_275 ) ) ( HOIST-AT ?auto_278 ?auto_277 ) ( AVAILABLE ?auto_278 ) ( SURFACE-AT ?auto_272 ?auto_277 ) ( ON ?auto_272 ?auto_279 ) ( CLEAR ?auto_272 ) ( TRUCK-AT ?auto_276 ?auto_275 ) ( not ( = ?auto_272 ?auto_273 ) ) ( not ( = ?auto_272 ?auto_279 ) ) ( not ( = ?auto_273 ?auto_279 ) ) ( not ( = ?auto_274 ?auto_278 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_276 ?auto_275 ?auto_277 )
      ( !LIFT ?auto_278 ?auto_272 ?auto_279 ?auto_277 )
      ( !LOAD ?auto_278 ?auto_272 ?auto_276 ?auto_277 )
      ( !DRIVE ?auto_276 ?auto_277 ?auto_275 )
      ( !UNLOAD ?auto_274 ?auto_272 ?auto_276 ?auto_275 )
      ( !DROP ?auto_274 ?auto_272 ?auto_273 ?auto_275 )
      ( MAKE-ON-VERIFY ?auto_272 ?auto_273 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_282 - SURFACE
      ?auto_283 - SURFACE
    )
    :vars
    (
      ?auto_284 - HOIST
      ?auto_285 - PLACE
      ?auto_287 - PLACE
      ?auto_288 - HOIST
      ?auto_289 - SURFACE
      ?auto_286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_284 ?auto_285 ) ( SURFACE-AT ?auto_283 ?auto_285 ) ( CLEAR ?auto_283 ) ( IS-CRATE ?auto_282 ) ( AVAILABLE ?auto_284 ) ( not ( = ?auto_287 ?auto_285 ) ) ( HOIST-AT ?auto_288 ?auto_287 ) ( AVAILABLE ?auto_288 ) ( SURFACE-AT ?auto_282 ?auto_287 ) ( ON ?auto_282 ?auto_289 ) ( CLEAR ?auto_282 ) ( TRUCK-AT ?auto_286 ?auto_285 ) ( not ( = ?auto_282 ?auto_283 ) ) ( not ( = ?auto_282 ?auto_289 ) ) ( not ( = ?auto_283 ?auto_289 ) ) ( not ( = ?auto_284 ?auto_288 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_286 ?auto_285 ?auto_287 )
      ( !LIFT ?auto_288 ?auto_282 ?auto_289 ?auto_287 )
      ( !LOAD ?auto_288 ?auto_282 ?auto_286 ?auto_287 )
      ( !DRIVE ?auto_286 ?auto_287 ?auto_285 )
      ( !UNLOAD ?auto_284 ?auto_282 ?auto_286 ?auto_285 )
      ( !DROP ?auto_284 ?auto_282 ?auto_283 ?auto_285 )
      ( MAKE-ON-VERIFY ?auto_282 ?auto_283 ) )
  )

)

