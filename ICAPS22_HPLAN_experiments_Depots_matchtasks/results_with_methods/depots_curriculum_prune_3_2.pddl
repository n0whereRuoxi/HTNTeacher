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
      ?auto_299 - SURFACE
      ?auto_300 - SURFACE
    )
    :vars
    (
      ?auto_301 - HOIST
      ?auto_302 - PLACE
      ?auto_304 - PLACE
      ?auto_305 - HOIST
      ?auto_306 - SURFACE
      ?auto_303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_301 ?auto_302 ) ( SURFACE-AT ?auto_299 ?auto_302 ) ( CLEAR ?auto_299 ) ( IS-CRATE ?auto_300 ) ( AVAILABLE ?auto_301 ) ( not ( = ?auto_304 ?auto_302 ) ) ( HOIST-AT ?auto_305 ?auto_304 ) ( AVAILABLE ?auto_305 ) ( SURFACE-AT ?auto_300 ?auto_304 ) ( ON ?auto_300 ?auto_306 ) ( CLEAR ?auto_300 ) ( TRUCK-AT ?auto_303 ?auto_302 ) ( not ( = ?auto_299 ?auto_300 ) ) ( not ( = ?auto_299 ?auto_306 ) ) ( not ( = ?auto_300 ?auto_306 ) ) ( not ( = ?auto_301 ?auto_305 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_303 ?auto_302 ?auto_304 )
      ( !LIFT ?auto_305 ?auto_300 ?auto_306 ?auto_304 )
      ( !LOAD ?auto_305 ?auto_300 ?auto_303 ?auto_304 )
      ( !DRIVE ?auto_303 ?auto_304 ?auto_302 )
      ( !UNLOAD ?auto_301 ?auto_300 ?auto_303 ?auto_302 )
      ( !DROP ?auto_301 ?auto_300 ?auto_299 ?auto_302 )
      ( MAKE-1CRATE-VERIFY ?auto_299 ?auto_300 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_320 - SURFACE
      ?auto_321 - SURFACE
      ?auto_322 - SURFACE
    )
    :vars
    (
      ?auto_327 - HOIST
      ?auto_325 - PLACE
      ?auto_328 - PLACE
      ?auto_326 - HOIST
      ?auto_324 - SURFACE
      ?auto_329 - PLACE
      ?auto_330 - HOIST
      ?auto_331 - SURFACE
      ?auto_323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_327 ?auto_325 ) ( IS-CRATE ?auto_322 ) ( not ( = ?auto_328 ?auto_325 ) ) ( HOIST-AT ?auto_326 ?auto_328 ) ( AVAILABLE ?auto_326 ) ( SURFACE-AT ?auto_322 ?auto_328 ) ( ON ?auto_322 ?auto_324 ) ( CLEAR ?auto_322 ) ( not ( = ?auto_321 ?auto_322 ) ) ( not ( = ?auto_321 ?auto_324 ) ) ( not ( = ?auto_322 ?auto_324 ) ) ( not ( = ?auto_327 ?auto_326 ) ) ( SURFACE-AT ?auto_320 ?auto_325 ) ( CLEAR ?auto_320 ) ( IS-CRATE ?auto_321 ) ( AVAILABLE ?auto_327 ) ( not ( = ?auto_329 ?auto_325 ) ) ( HOIST-AT ?auto_330 ?auto_329 ) ( AVAILABLE ?auto_330 ) ( SURFACE-AT ?auto_321 ?auto_329 ) ( ON ?auto_321 ?auto_331 ) ( CLEAR ?auto_321 ) ( TRUCK-AT ?auto_323 ?auto_325 ) ( not ( = ?auto_320 ?auto_321 ) ) ( not ( = ?auto_320 ?auto_331 ) ) ( not ( = ?auto_321 ?auto_331 ) ) ( not ( = ?auto_327 ?auto_330 ) ) ( not ( = ?auto_320 ?auto_322 ) ) ( not ( = ?auto_320 ?auto_324 ) ) ( not ( = ?auto_322 ?auto_331 ) ) ( not ( = ?auto_328 ?auto_329 ) ) ( not ( = ?auto_326 ?auto_330 ) ) ( not ( = ?auto_324 ?auto_331 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320 ?auto_321 )
      ( MAKE-1CRATE ?auto_321 ?auto_322 )
      ( MAKE-2CRATE-VERIFY ?auto_320 ?auto_321 ?auto_322 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_346 - SURFACE
      ?auto_347 - SURFACE
      ?auto_348 - SURFACE
      ?auto_349 - SURFACE
    )
    :vars
    (
      ?auto_355 - HOIST
      ?auto_353 - PLACE
      ?auto_352 - PLACE
      ?auto_350 - HOIST
      ?auto_354 - SURFACE
      ?auto_358 - PLACE
      ?auto_357 - HOIST
      ?auto_356 - SURFACE
      ?auto_359 - SURFACE
      ?auto_351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_355 ?auto_353 ) ( IS-CRATE ?auto_349 ) ( not ( = ?auto_352 ?auto_353 ) ) ( HOIST-AT ?auto_350 ?auto_352 ) ( SURFACE-AT ?auto_349 ?auto_352 ) ( ON ?auto_349 ?auto_354 ) ( CLEAR ?auto_349 ) ( not ( = ?auto_348 ?auto_349 ) ) ( not ( = ?auto_348 ?auto_354 ) ) ( not ( = ?auto_349 ?auto_354 ) ) ( not ( = ?auto_355 ?auto_350 ) ) ( IS-CRATE ?auto_348 ) ( not ( = ?auto_358 ?auto_353 ) ) ( HOIST-AT ?auto_357 ?auto_358 ) ( AVAILABLE ?auto_357 ) ( SURFACE-AT ?auto_348 ?auto_358 ) ( ON ?auto_348 ?auto_356 ) ( CLEAR ?auto_348 ) ( not ( = ?auto_347 ?auto_348 ) ) ( not ( = ?auto_347 ?auto_356 ) ) ( not ( = ?auto_348 ?auto_356 ) ) ( not ( = ?auto_355 ?auto_357 ) ) ( SURFACE-AT ?auto_346 ?auto_353 ) ( CLEAR ?auto_346 ) ( IS-CRATE ?auto_347 ) ( AVAILABLE ?auto_355 ) ( AVAILABLE ?auto_350 ) ( SURFACE-AT ?auto_347 ?auto_352 ) ( ON ?auto_347 ?auto_359 ) ( CLEAR ?auto_347 ) ( TRUCK-AT ?auto_351 ?auto_353 ) ( not ( = ?auto_346 ?auto_347 ) ) ( not ( = ?auto_346 ?auto_359 ) ) ( not ( = ?auto_347 ?auto_359 ) ) ( not ( = ?auto_346 ?auto_348 ) ) ( not ( = ?auto_346 ?auto_356 ) ) ( not ( = ?auto_348 ?auto_359 ) ) ( not ( = ?auto_358 ?auto_352 ) ) ( not ( = ?auto_357 ?auto_350 ) ) ( not ( = ?auto_356 ?auto_359 ) ) ( not ( = ?auto_346 ?auto_349 ) ) ( not ( = ?auto_346 ?auto_354 ) ) ( not ( = ?auto_347 ?auto_349 ) ) ( not ( = ?auto_347 ?auto_354 ) ) ( not ( = ?auto_349 ?auto_356 ) ) ( not ( = ?auto_349 ?auto_359 ) ) ( not ( = ?auto_354 ?auto_356 ) ) ( not ( = ?auto_354 ?auto_359 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_346 ?auto_347 ?auto_348 )
      ( MAKE-1CRATE ?auto_348 ?auto_349 )
      ( MAKE-3CRATE-VERIFY ?auto_346 ?auto_347 ?auto_348 ?auto_349 ) )
  )

)

