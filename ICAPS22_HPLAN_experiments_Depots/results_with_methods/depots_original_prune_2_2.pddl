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
      ?auto_251 - SURFACE
      ?auto_252 - SURFACE
    )
    :vars
    (
      ?auto_253 - HOIST
      ?auto_254 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_253 ?auto_254 ) ( SURFACE-AT ?auto_252 ?auto_254 ) ( CLEAR ?auto_252 ) ( LIFTING ?auto_253 ?auto_251 ) ( IS-CRATE ?auto_251 ) ( not ( = ?auto_251 ?auto_252 ) ) )
    :subtasks
    ( ( !DROP ?auto_253 ?auto_251 ?auto_252 ?auto_254 )
      ( MAKE-ON-VERIFY ?auto_251 ?auto_252 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_255 - SURFACE
      ?auto_256 - SURFACE
    )
    :vars
    (
      ?auto_258 - HOIST
      ?auto_257 - PLACE
      ?auto_259 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_258 ?auto_257 ) ( SURFACE-AT ?auto_256 ?auto_257 ) ( CLEAR ?auto_256 ) ( IS-CRATE ?auto_255 ) ( not ( = ?auto_255 ?auto_256 ) ) ( TRUCK-AT ?auto_259 ?auto_257 ) ( AVAILABLE ?auto_258 ) ( IN ?auto_255 ?auto_259 ) )
    :subtasks
    ( ( !UNLOAD ?auto_258 ?auto_255 ?auto_259 ?auto_257 )
      ( MAKE-ON ?auto_255 ?auto_256 )
      ( MAKE-ON-VERIFY ?auto_255 ?auto_256 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_260 - SURFACE
      ?auto_261 - SURFACE
    )
    :vars
    (
      ?auto_264 - HOIST
      ?auto_263 - PLACE
      ?auto_262 - TRUCK
      ?auto_265 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264 ?auto_263 ) ( SURFACE-AT ?auto_261 ?auto_263 ) ( CLEAR ?auto_261 ) ( IS-CRATE ?auto_260 ) ( not ( = ?auto_260 ?auto_261 ) ) ( AVAILABLE ?auto_264 ) ( IN ?auto_260 ?auto_262 ) ( TRUCK-AT ?auto_262 ?auto_265 ) ( not ( = ?auto_265 ?auto_263 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_262 ?auto_265 ?auto_263 )
      ( MAKE-ON ?auto_260 ?auto_261 )
      ( MAKE-ON-VERIFY ?auto_260 ?auto_261 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_266 - SURFACE
      ?auto_267 - SURFACE
    )
    :vars
    (
      ?auto_268 - HOIST
      ?auto_270 - PLACE
      ?auto_271 - TRUCK
      ?auto_269 - PLACE
      ?auto_272 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_268 ?auto_270 ) ( SURFACE-AT ?auto_267 ?auto_270 ) ( CLEAR ?auto_267 ) ( IS-CRATE ?auto_266 ) ( not ( = ?auto_266 ?auto_267 ) ) ( AVAILABLE ?auto_268 ) ( TRUCK-AT ?auto_271 ?auto_269 ) ( not ( = ?auto_269 ?auto_270 ) ) ( HOIST-AT ?auto_272 ?auto_269 ) ( LIFTING ?auto_272 ?auto_266 ) ( not ( = ?auto_268 ?auto_272 ) ) )
    :subtasks
    ( ( !LOAD ?auto_272 ?auto_266 ?auto_271 ?auto_269 )
      ( MAKE-ON ?auto_266 ?auto_267 )
      ( MAKE-ON-VERIFY ?auto_266 ?auto_267 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_273 - SURFACE
      ?auto_274 - SURFACE
    )
    :vars
    (
      ?auto_275 - HOIST
      ?auto_276 - PLACE
      ?auto_277 - TRUCK
      ?auto_278 - PLACE
      ?auto_279 - HOIST
      ?auto_280 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_275 ?auto_276 ) ( SURFACE-AT ?auto_274 ?auto_276 ) ( CLEAR ?auto_274 ) ( IS-CRATE ?auto_273 ) ( not ( = ?auto_273 ?auto_274 ) ) ( AVAILABLE ?auto_275 ) ( TRUCK-AT ?auto_277 ?auto_278 ) ( not ( = ?auto_278 ?auto_276 ) ) ( HOIST-AT ?auto_279 ?auto_278 ) ( not ( = ?auto_275 ?auto_279 ) ) ( AVAILABLE ?auto_279 ) ( SURFACE-AT ?auto_273 ?auto_278 ) ( ON ?auto_273 ?auto_280 ) ( CLEAR ?auto_273 ) ( not ( = ?auto_273 ?auto_280 ) ) ( not ( = ?auto_274 ?auto_280 ) ) )
    :subtasks
    ( ( !LIFT ?auto_279 ?auto_273 ?auto_280 ?auto_278 )
      ( MAKE-ON ?auto_273 ?auto_274 )
      ( MAKE-ON-VERIFY ?auto_273 ?auto_274 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_281 - SURFACE
      ?auto_282 - SURFACE
    )
    :vars
    (
      ?auto_284 - HOIST
      ?auto_286 - PLACE
      ?auto_287 - PLACE
      ?auto_288 - HOIST
      ?auto_285 - SURFACE
      ?auto_283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_284 ?auto_286 ) ( SURFACE-AT ?auto_282 ?auto_286 ) ( CLEAR ?auto_282 ) ( IS-CRATE ?auto_281 ) ( not ( = ?auto_281 ?auto_282 ) ) ( AVAILABLE ?auto_284 ) ( not ( = ?auto_287 ?auto_286 ) ) ( HOIST-AT ?auto_288 ?auto_287 ) ( not ( = ?auto_284 ?auto_288 ) ) ( AVAILABLE ?auto_288 ) ( SURFACE-AT ?auto_281 ?auto_287 ) ( ON ?auto_281 ?auto_285 ) ( CLEAR ?auto_281 ) ( not ( = ?auto_281 ?auto_285 ) ) ( not ( = ?auto_282 ?auto_285 ) ) ( TRUCK-AT ?auto_283 ?auto_286 ) )
    :subtasks
    ( ( !DRIVE ?auto_283 ?auto_286 ?auto_287 )
      ( MAKE-ON ?auto_281 ?auto_282 )
      ( MAKE-ON-VERIFY ?auto_281 ?auto_282 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_329 - SURFACE
      ?auto_330 - SURFACE
    )
    :vars
    (
      ?auto_333 - HOIST
      ?auto_334 - PLACE
      ?auto_336 - PLACE
      ?auto_335 - HOIST
      ?auto_332 - SURFACE
      ?auto_331 - TRUCK
      ?auto_337 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_333 ?auto_334 ) ( IS-CRATE ?auto_329 ) ( not ( = ?auto_329 ?auto_330 ) ) ( not ( = ?auto_336 ?auto_334 ) ) ( HOIST-AT ?auto_335 ?auto_336 ) ( not ( = ?auto_333 ?auto_335 ) ) ( AVAILABLE ?auto_335 ) ( SURFACE-AT ?auto_329 ?auto_336 ) ( ON ?auto_329 ?auto_332 ) ( CLEAR ?auto_329 ) ( not ( = ?auto_329 ?auto_332 ) ) ( not ( = ?auto_330 ?auto_332 ) ) ( TRUCK-AT ?auto_331 ?auto_334 ) ( SURFACE-AT ?auto_337 ?auto_334 ) ( CLEAR ?auto_337 ) ( LIFTING ?auto_333 ?auto_330 ) ( IS-CRATE ?auto_330 ) ( not ( = ?auto_329 ?auto_337 ) ) ( not ( = ?auto_330 ?auto_337 ) ) ( not ( = ?auto_332 ?auto_337 ) ) )
    :subtasks
    ( ( !DROP ?auto_333 ?auto_330 ?auto_337 ?auto_334 )
      ( MAKE-ON ?auto_329 ?auto_330 )
      ( MAKE-ON-VERIFY ?auto_329 ?auto_330 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_338 - SURFACE
      ?auto_339 - SURFACE
    )
    :vars
    (
      ?auto_344 - HOIST
      ?auto_346 - PLACE
      ?auto_343 - PLACE
      ?auto_341 - HOIST
      ?auto_340 - SURFACE
      ?auto_345 - TRUCK
      ?auto_342 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_344 ?auto_346 ) ( IS-CRATE ?auto_338 ) ( not ( = ?auto_338 ?auto_339 ) ) ( not ( = ?auto_343 ?auto_346 ) ) ( HOIST-AT ?auto_341 ?auto_343 ) ( not ( = ?auto_344 ?auto_341 ) ) ( AVAILABLE ?auto_341 ) ( SURFACE-AT ?auto_338 ?auto_343 ) ( ON ?auto_338 ?auto_340 ) ( CLEAR ?auto_338 ) ( not ( = ?auto_338 ?auto_340 ) ) ( not ( = ?auto_339 ?auto_340 ) ) ( TRUCK-AT ?auto_345 ?auto_346 ) ( SURFACE-AT ?auto_342 ?auto_346 ) ( CLEAR ?auto_342 ) ( IS-CRATE ?auto_339 ) ( not ( = ?auto_338 ?auto_342 ) ) ( not ( = ?auto_339 ?auto_342 ) ) ( not ( = ?auto_340 ?auto_342 ) ) ( AVAILABLE ?auto_344 ) ( IN ?auto_339 ?auto_345 ) )
    :subtasks
    ( ( !UNLOAD ?auto_344 ?auto_339 ?auto_345 ?auto_346 )
      ( MAKE-ON ?auto_338 ?auto_339 )
      ( MAKE-ON-VERIFY ?auto_338 ?auto_339 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_347 - SURFACE
      ?auto_348 - SURFACE
    )
    :vars
    (
      ?auto_352 - HOIST
      ?auto_349 - PLACE
      ?auto_351 - PLACE
      ?auto_353 - HOIST
      ?auto_355 - SURFACE
      ?auto_350 - SURFACE
      ?auto_354 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_352 ?auto_349 ) ( IS-CRATE ?auto_347 ) ( not ( = ?auto_347 ?auto_348 ) ) ( not ( = ?auto_351 ?auto_349 ) ) ( HOIST-AT ?auto_353 ?auto_351 ) ( not ( = ?auto_352 ?auto_353 ) ) ( AVAILABLE ?auto_353 ) ( SURFACE-AT ?auto_347 ?auto_351 ) ( ON ?auto_347 ?auto_355 ) ( CLEAR ?auto_347 ) ( not ( = ?auto_347 ?auto_355 ) ) ( not ( = ?auto_348 ?auto_355 ) ) ( SURFACE-AT ?auto_350 ?auto_349 ) ( CLEAR ?auto_350 ) ( IS-CRATE ?auto_348 ) ( not ( = ?auto_347 ?auto_350 ) ) ( not ( = ?auto_348 ?auto_350 ) ) ( not ( = ?auto_355 ?auto_350 ) ) ( AVAILABLE ?auto_352 ) ( IN ?auto_348 ?auto_354 ) ( TRUCK-AT ?auto_354 ?auto_351 ) )
    :subtasks
    ( ( !DRIVE ?auto_354 ?auto_351 ?auto_349 )
      ( MAKE-ON ?auto_347 ?auto_348 )
      ( MAKE-ON-VERIFY ?auto_347 ?auto_348 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_356 - SURFACE
      ?auto_357 - SURFACE
    )
    :vars
    (
      ?auto_362 - HOIST
      ?auto_358 - PLACE
      ?auto_359 - PLACE
      ?auto_360 - HOIST
      ?auto_364 - SURFACE
      ?auto_361 - SURFACE
      ?auto_363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_362 ?auto_358 ) ( IS-CRATE ?auto_356 ) ( not ( = ?auto_356 ?auto_357 ) ) ( not ( = ?auto_359 ?auto_358 ) ) ( HOIST-AT ?auto_360 ?auto_359 ) ( not ( = ?auto_362 ?auto_360 ) ) ( SURFACE-AT ?auto_356 ?auto_359 ) ( ON ?auto_356 ?auto_364 ) ( CLEAR ?auto_356 ) ( not ( = ?auto_356 ?auto_364 ) ) ( not ( = ?auto_357 ?auto_364 ) ) ( SURFACE-AT ?auto_361 ?auto_358 ) ( CLEAR ?auto_361 ) ( IS-CRATE ?auto_357 ) ( not ( = ?auto_356 ?auto_361 ) ) ( not ( = ?auto_357 ?auto_361 ) ) ( not ( = ?auto_364 ?auto_361 ) ) ( AVAILABLE ?auto_362 ) ( TRUCK-AT ?auto_363 ?auto_359 ) ( LIFTING ?auto_360 ?auto_357 ) )
    :subtasks
    ( ( !LOAD ?auto_360 ?auto_357 ?auto_363 ?auto_359 )
      ( MAKE-ON ?auto_356 ?auto_357 )
      ( MAKE-ON-VERIFY ?auto_356 ?auto_357 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_365 - SURFACE
      ?auto_366 - SURFACE
    )
    :vars
    (
      ?auto_370 - HOIST
      ?auto_372 - PLACE
      ?auto_369 - PLACE
      ?auto_367 - HOIST
      ?auto_371 - SURFACE
      ?auto_373 - SURFACE
      ?auto_368 - TRUCK
      ?auto_374 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_370 ?auto_372 ) ( IS-CRATE ?auto_365 ) ( not ( = ?auto_365 ?auto_366 ) ) ( not ( = ?auto_369 ?auto_372 ) ) ( HOIST-AT ?auto_367 ?auto_369 ) ( not ( = ?auto_370 ?auto_367 ) ) ( SURFACE-AT ?auto_365 ?auto_369 ) ( ON ?auto_365 ?auto_371 ) ( CLEAR ?auto_365 ) ( not ( = ?auto_365 ?auto_371 ) ) ( not ( = ?auto_366 ?auto_371 ) ) ( SURFACE-AT ?auto_373 ?auto_372 ) ( CLEAR ?auto_373 ) ( IS-CRATE ?auto_366 ) ( not ( = ?auto_365 ?auto_373 ) ) ( not ( = ?auto_366 ?auto_373 ) ) ( not ( = ?auto_371 ?auto_373 ) ) ( AVAILABLE ?auto_370 ) ( TRUCK-AT ?auto_368 ?auto_369 ) ( AVAILABLE ?auto_367 ) ( SURFACE-AT ?auto_366 ?auto_369 ) ( ON ?auto_366 ?auto_374 ) ( CLEAR ?auto_366 ) ( not ( = ?auto_365 ?auto_374 ) ) ( not ( = ?auto_366 ?auto_374 ) ) ( not ( = ?auto_371 ?auto_374 ) ) ( not ( = ?auto_373 ?auto_374 ) ) )
    :subtasks
    ( ( !LIFT ?auto_367 ?auto_366 ?auto_374 ?auto_369 )
      ( MAKE-ON ?auto_365 ?auto_366 )
      ( MAKE-ON-VERIFY ?auto_365 ?auto_366 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_375 - SURFACE
      ?auto_376 - SURFACE
    )
    :vars
    (
      ?auto_378 - HOIST
      ?auto_381 - PLACE
      ?auto_379 - PLACE
      ?auto_377 - HOIST
      ?auto_382 - SURFACE
      ?auto_384 - SURFACE
      ?auto_380 - SURFACE
      ?auto_383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_378 ?auto_381 ) ( IS-CRATE ?auto_375 ) ( not ( = ?auto_375 ?auto_376 ) ) ( not ( = ?auto_379 ?auto_381 ) ) ( HOIST-AT ?auto_377 ?auto_379 ) ( not ( = ?auto_378 ?auto_377 ) ) ( SURFACE-AT ?auto_375 ?auto_379 ) ( ON ?auto_375 ?auto_382 ) ( CLEAR ?auto_375 ) ( not ( = ?auto_375 ?auto_382 ) ) ( not ( = ?auto_376 ?auto_382 ) ) ( SURFACE-AT ?auto_384 ?auto_381 ) ( CLEAR ?auto_384 ) ( IS-CRATE ?auto_376 ) ( not ( = ?auto_375 ?auto_384 ) ) ( not ( = ?auto_376 ?auto_384 ) ) ( not ( = ?auto_382 ?auto_384 ) ) ( AVAILABLE ?auto_378 ) ( AVAILABLE ?auto_377 ) ( SURFACE-AT ?auto_376 ?auto_379 ) ( ON ?auto_376 ?auto_380 ) ( CLEAR ?auto_376 ) ( not ( = ?auto_375 ?auto_380 ) ) ( not ( = ?auto_376 ?auto_380 ) ) ( not ( = ?auto_382 ?auto_380 ) ) ( not ( = ?auto_384 ?auto_380 ) ) ( TRUCK-AT ?auto_383 ?auto_381 ) )
    :subtasks
    ( ( !DRIVE ?auto_383 ?auto_381 ?auto_379 )
      ( MAKE-ON ?auto_375 ?auto_376 )
      ( MAKE-ON-VERIFY ?auto_375 ?auto_376 ) )
  )

)

