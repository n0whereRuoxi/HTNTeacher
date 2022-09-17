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
      ?auto_292 - SURFACE
      ?auto_293 - SURFACE
    )
    :vars
    (
      ?auto_294 - HOIST
      ?auto_295 - PLACE
      ?auto_297 - PLACE
      ?auto_298 - HOIST
      ?auto_299 - SURFACE
      ?auto_296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_294 ?auto_295 ) ( SURFACE-AT ?auto_293 ?auto_295 ) ( CLEAR ?auto_293 ) ( IS-CRATE ?auto_292 ) ( AVAILABLE ?auto_294 ) ( not ( = ?auto_297 ?auto_295 ) ) ( HOIST-AT ?auto_298 ?auto_297 ) ( AVAILABLE ?auto_298 ) ( SURFACE-AT ?auto_292 ?auto_297 ) ( ON ?auto_292 ?auto_299 ) ( CLEAR ?auto_292 ) ( TRUCK-AT ?auto_296 ?auto_295 ) ( not ( = ?auto_292 ?auto_293 ) ) ( not ( = ?auto_292 ?auto_299 ) ) ( not ( = ?auto_293 ?auto_299 ) ) ( not ( = ?auto_294 ?auto_298 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_296 ?auto_295 ?auto_297 )
      ( !LIFT ?auto_298 ?auto_292 ?auto_299 ?auto_297 )
      ( !LOAD ?auto_298 ?auto_292 ?auto_296 ?auto_297 )
      ( !DRIVE ?auto_296 ?auto_297 ?auto_295 )
      ( !UNLOAD ?auto_294 ?auto_292 ?auto_296 ?auto_295 )
      ( !DROP ?auto_294 ?auto_292 ?auto_293 ?auto_295 )
      ( MAKE-ON-VERIFY ?auto_292 ?auto_293 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_302 - SURFACE
      ?auto_303 - SURFACE
    )
    :vars
    (
      ?auto_304 - HOIST
      ?auto_305 - PLACE
      ?auto_307 - PLACE
      ?auto_308 - HOIST
      ?auto_309 - SURFACE
      ?auto_306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_304 ?auto_305 ) ( SURFACE-AT ?auto_303 ?auto_305 ) ( CLEAR ?auto_303 ) ( IS-CRATE ?auto_302 ) ( AVAILABLE ?auto_304 ) ( not ( = ?auto_307 ?auto_305 ) ) ( HOIST-AT ?auto_308 ?auto_307 ) ( AVAILABLE ?auto_308 ) ( SURFACE-AT ?auto_302 ?auto_307 ) ( ON ?auto_302 ?auto_309 ) ( CLEAR ?auto_302 ) ( TRUCK-AT ?auto_306 ?auto_305 ) ( not ( = ?auto_302 ?auto_303 ) ) ( not ( = ?auto_302 ?auto_309 ) ) ( not ( = ?auto_303 ?auto_309 ) ) ( not ( = ?auto_304 ?auto_308 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_306 ?auto_305 ?auto_307 )
      ( !LIFT ?auto_308 ?auto_302 ?auto_309 ?auto_307 )
      ( !LOAD ?auto_308 ?auto_302 ?auto_306 ?auto_307 )
      ( !DRIVE ?auto_306 ?auto_307 ?auto_305 )
      ( !UNLOAD ?auto_304 ?auto_302 ?auto_306 ?auto_305 )
      ( !DROP ?auto_304 ?auto_302 ?auto_303 ?auto_305 )
      ( MAKE-ON-VERIFY ?auto_302 ?auto_303 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_312 - SURFACE
      ?auto_313 - SURFACE
    )
    :vars
    (
      ?auto_314 - HOIST
      ?auto_315 - PLACE
      ?auto_317 - PLACE
      ?auto_318 - HOIST
      ?auto_319 - SURFACE
      ?auto_316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_314 ?auto_315 ) ( SURFACE-AT ?auto_313 ?auto_315 ) ( CLEAR ?auto_313 ) ( IS-CRATE ?auto_312 ) ( AVAILABLE ?auto_314 ) ( not ( = ?auto_317 ?auto_315 ) ) ( HOIST-AT ?auto_318 ?auto_317 ) ( AVAILABLE ?auto_318 ) ( SURFACE-AT ?auto_312 ?auto_317 ) ( ON ?auto_312 ?auto_319 ) ( CLEAR ?auto_312 ) ( TRUCK-AT ?auto_316 ?auto_315 ) ( not ( = ?auto_312 ?auto_313 ) ) ( not ( = ?auto_312 ?auto_319 ) ) ( not ( = ?auto_313 ?auto_319 ) ) ( not ( = ?auto_314 ?auto_318 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_316 ?auto_315 ?auto_317 )
      ( !LIFT ?auto_318 ?auto_312 ?auto_319 ?auto_317 )
      ( !LOAD ?auto_318 ?auto_312 ?auto_316 ?auto_317 )
      ( !DRIVE ?auto_316 ?auto_317 ?auto_315 )
      ( !UNLOAD ?auto_314 ?auto_312 ?auto_316 ?auto_315 )
      ( !DROP ?auto_314 ?auto_312 ?auto_313 ?auto_315 )
      ( MAKE-ON-VERIFY ?auto_312 ?auto_313 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_322 - SURFACE
      ?auto_323 - SURFACE
    )
    :vars
    (
      ?auto_324 - HOIST
      ?auto_325 - PLACE
      ?auto_327 - PLACE
      ?auto_328 - HOIST
      ?auto_329 - SURFACE
      ?auto_326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_324 ?auto_325 ) ( SURFACE-AT ?auto_323 ?auto_325 ) ( CLEAR ?auto_323 ) ( IS-CRATE ?auto_322 ) ( AVAILABLE ?auto_324 ) ( not ( = ?auto_327 ?auto_325 ) ) ( HOIST-AT ?auto_328 ?auto_327 ) ( AVAILABLE ?auto_328 ) ( SURFACE-AT ?auto_322 ?auto_327 ) ( ON ?auto_322 ?auto_329 ) ( CLEAR ?auto_322 ) ( TRUCK-AT ?auto_326 ?auto_325 ) ( not ( = ?auto_322 ?auto_323 ) ) ( not ( = ?auto_322 ?auto_329 ) ) ( not ( = ?auto_323 ?auto_329 ) ) ( not ( = ?auto_324 ?auto_328 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_326 ?auto_325 ?auto_327 )
      ( !LIFT ?auto_328 ?auto_322 ?auto_329 ?auto_327 )
      ( !LOAD ?auto_328 ?auto_322 ?auto_326 ?auto_327 )
      ( !DRIVE ?auto_326 ?auto_327 ?auto_325 )
      ( !UNLOAD ?auto_324 ?auto_322 ?auto_326 ?auto_325 )
      ( !DROP ?auto_324 ?auto_322 ?auto_323 ?auto_325 )
      ( MAKE-ON-VERIFY ?auto_322 ?auto_323 ) )
  )

)

