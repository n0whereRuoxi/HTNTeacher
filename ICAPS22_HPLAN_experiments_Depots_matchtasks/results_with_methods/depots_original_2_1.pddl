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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_259 - SURFACE
      ?auto_260 - SURFACE
    )
    :vars
    (
      ?auto_261 - HOIST
      ?auto_262 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_261 ?auto_262 ) ( SURFACE-AT ?auto_259 ?auto_262 ) ( CLEAR ?auto_259 ) ( LIFTING ?auto_261 ?auto_260 ) ( IS-CRATE ?auto_260 ) ( not ( = ?auto_259 ?auto_260 ) ) )
    :subtasks
    ( ( !DROP ?auto_261 ?auto_260 ?auto_259 ?auto_262 )
      ( MAKE-1CRATE-VERIFY ?auto_259 ?auto_260 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_263 - SURFACE
      ?auto_264 - SURFACE
    )
    :vars
    (
      ?auto_266 - HOIST
      ?auto_265 - PLACE
      ?auto_267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_266 ?auto_265 ) ( SURFACE-AT ?auto_263 ?auto_265 ) ( CLEAR ?auto_263 ) ( IS-CRATE ?auto_264 ) ( not ( = ?auto_263 ?auto_264 ) ) ( TRUCK-AT ?auto_267 ?auto_265 ) ( AVAILABLE ?auto_266 ) ( IN ?auto_264 ?auto_267 ) )
    :subtasks
    ( ( !UNLOAD ?auto_266 ?auto_264 ?auto_267 ?auto_265 )
      ( MAKE-1CRATE ?auto_263 ?auto_264 )
      ( MAKE-1CRATE-VERIFY ?auto_263 ?auto_264 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_268 - SURFACE
      ?auto_269 - SURFACE
    )
    :vars
    (
      ?auto_270 - HOIST
      ?auto_271 - PLACE
      ?auto_272 - TRUCK
      ?auto_273 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_270 ?auto_271 ) ( SURFACE-AT ?auto_268 ?auto_271 ) ( CLEAR ?auto_268 ) ( IS-CRATE ?auto_269 ) ( not ( = ?auto_268 ?auto_269 ) ) ( AVAILABLE ?auto_270 ) ( IN ?auto_269 ?auto_272 ) ( TRUCK-AT ?auto_272 ?auto_273 ) ( not ( = ?auto_273 ?auto_271 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_272 ?auto_273 ?auto_271 )
      ( MAKE-1CRATE ?auto_268 ?auto_269 )
      ( MAKE-1CRATE-VERIFY ?auto_268 ?auto_269 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_274 - SURFACE
      ?auto_275 - SURFACE
    )
    :vars
    (
      ?auto_277 - HOIST
      ?auto_279 - PLACE
      ?auto_276 - TRUCK
      ?auto_278 - PLACE
      ?auto_280 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_277 ?auto_279 ) ( SURFACE-AT ?auto_274 ?auto_279 ) ( CLEAR ?auto_274 ) ( IS-CRATE ?auto_275 ) ( not ( = ?auto_274 ?auto_275 ) ) ( AVAILABLE ?auto_277 ) ( TRUCK-AT ?auto_276 ?auto_278 ) ( not ( = ?auto_278 ?auto_279 ) ) ( HOIST-AT ?auto_280 ?auto_278 ) ( LIFTING ?auto_280 ?auto_275 ) ( not ( = ?auto_277 ?auto_280 ) ) )
    :subtasks
    ( ( !LOAD ?auto_280 ?auto_275 ?auto_276 ?auto_278 )
      ( MAKE-1CRATE ?auto_274 ?auto_275 )
      ( MAKE-1CRATE-VERIFY ?auto_274 ?auto_275 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_281 - SURFACE
      ?auto_282 - SURFACE
    )
    :vars
    (
      ?auto_287 - HOIST
      ?auto_286 - PLACE
      ?auto_284 - TRUCK
      ?auto_285 - PLACE
      ?auto_283 - HOIST
      ?auto_288 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_287 ?auto_286 ) ( SURFACE-AT ?auto_281 ?auto_286 ) ( CLEAR ?auto_281 ) ( IS-CRATE ?auto_282 ) ( not ( = ?auto_281 ?auto_282 ) ) ( AVAILABLE ?auto_287 ) ( TRUCK-AT ?auto_284 ?auto_285 ) ( not ( = ?auto_285 ?auto_286 ) ) ( HOIST-AT ?auto_283 ?auto_285 ) ( not ( = ?auto_287 ?auto_283 ) ) ( AVAILABLE ?auto_283 ) ( SURFACE-AT ?auto_282 ?auto_285 ) ( ON ?auto_282 ?auto_288 ) ( CLEAR ?auto_282 ) ( not ( = ?auto_281 ?auto_288 ) ) ( not ( = ?auto_282 ?auto_288 ) ) )
    :subtasks
    ( ( !LIFT ?auto_283 ?auto_282 ?auto_288 ?auto_285 )
      ( MAKE-1CRATE ?auto_281 ?auto_282 )
      ( MAKE-1CRATE-VERIFY ?auto_281 ?auto_282 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_289 - SURFACE
      ?auto_290 - SURFACE
    )
    :vars
    (
      ?auto_296 - HOIST
      ?auto_294 - PLACE
      ?auto_291 - PLACE
      ?auto_295 - HOIST
      ?auto_293 - SURFACE
      ?auto_292 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_296 ?auto_294 ) ( SURFACE-AT ?auto_289 ?auto_294 ) ( CLEAR ?auto_289 ) ( IS-CRATE ?auto_290 ) ( not ( = ?auto_289 ?auto_290 ) ) ( AVAILABLE ?auto_296 ) ( not ( = ?auto_291 ?auto_294 ) ) ( HOIST-AT ?auto_295 ?auto_291 ) ( not ( = ?auto_296 ?auto_295 ) ) ( AVAILABLE ?auto_295 ) ( SURFACE-AT ?auto_290 ?auto_291 ) ( ON ?auto_290 ?auto_293 ) ( CLEAR ?auto_290 ) ( not ( = ?auto_289 ?auto_293 ) ) ( not ( = ?auto_290 ?auto_293 ) ) ( TRUCK-AT ?auto_292 ?auto_294 ) )
    :subtasks
    ( ( !DRIVE ?auto_292 ?auto_294 ?auto_291 )
      ( MAKE-1CRATE ?auto_289 ?auto_290 )
      ( MAKE-1CRATE-VERIFY ?auto_289 ?auto_290 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_302 - SURFACE
      ?auto_303 - SURFACE
    )
    :vars
    (
      ?auto_304 - HOIST
      ?auto_305 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_304 ?auto_305 ) ( SURFACE-AT ?auto_302 ?auto_305 ) ( CLEAR ?auto_302 ) ( LIFTING ?auto_304 ?auto_303 ) ( IS-CRATE ?auto_303 ) ( not ( = ?auto_302 ?auto_303 ) ) )
    :subtasks
    ( ( !DROP ?auto_304 ?auto_303 ?auto_302 ?auto_305 )
      ( MAKE-1CRATE-VERIFY ?auto_302 ?auto_303 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_306 - SURFACE
      ?auto_307 - SURFACE
      ?auto_308 - SURFACE
    )
    :vars
    (
      ?auto_310 - HOIST
      ?auto_309 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_310 ?auto_309 ) ( SURFACE-AT ?auto_307 ?auto_309 ) ( CLEAR ?auto_307 ) ( LIFTING ?auto_310 ?auto_308 ) ( IS-CRATE ?auto_308 ) ( not ( = ?auto_307 ?auto_308 ) ) ( ON ?auto_307 ?auto_306 ) ( not ( = ?auto_306 ?auto_307 ) ) ( not ( = ?auto_306 ?auto_308 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_307 ?auto_308 )
      ( MAKE-2CRATE-VERIFY ?auto_306 ?auto_307 ?auto_308 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_311 - SURFACE
      ?auto_312 - SURFACE
    )
    :vars
    (
      ?auto_314 - HOIST
      ?auto_313 - PLACE
      ?auto_315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_314 ?auto_313 ) ( SURFACE-AT ?auto_311 ?auto_313 ) ( CLEAR ?auto_311 ) ( IS-CRATE ?auto_312 ) ( not ( = ?auto_311 ?auto_312 ) ) ( TRUCK-AT ?auto_315 ?auto_313 ) ( AVAILABLE ?auto_314 ) ( IN ?auto_312 ?auto_315 ) )
    :subtasks
    ( ( !UNLOAD ?auto_314 ?auto_312 ?auto_315 ?auto_313 )
      ( MAKE-1CRATE ?auto_311 ?auto_312 )
      ( MAKE-1CRATE-VERIFY ?auto_311 ?auto_312 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_316 - SURFACE
      ?auto_317 - SURFACE
      ?auto_318 - SURFACE
    )
    :vars
    (
      ?auto_319 - HOIST
      ?auto_321 - PLACE
      ?auto_320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_319 ?auto_321 ) ( SURFACE-AT ?auto_317 ?auto_321 ) ( CLEAR ?auto_317 ) ( IS-CRATE ?auto_318 ) ( not ( = ?auto_317 ?auto_318 ) ) ( TRUCK-AT ?auto_320 ?auto_321 ) ( AVAILABLE ?auto_319 ) ( IN ?auto_318 ?auto_320 ) ( ON ?auto_317 ?auto_316 ) ( not ( = ?auto_316 ?auto_317 ) ) ( not ( = ?auto_316 ?auto_318 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_317 ?auto_318 )
      ( MAKE-2CRATE-VERIFY ?auto_316 ?auto_317 ?auto_318 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_322 - SURFACE
      ?auto_323 - SURFACE
    )
    :vars
    (
      ?auto_326 - HOIST
      ?auto_325 - PLACE
      ?auto_327 - TRUCK
      ?auto_324 - SURFACE
      ?auto_328 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_326 ?auto_325 ) ( SURFACE-AT ?auto_322 ?auto_325 ) ( CLEAR ?auto_322 ) ( IS-CRATE ?auto_323 ) ( not ( = ?auto_322 ?auto_323 ) ) ( AVAILABLE ?auto_326 ) ( IN ?auto_323 ?auto_327 ) ( ON ?auto_322 ?auto_324 ) ( not ( = ?auto_324 ?auto_322 ) ) ( not ( = ?auto_324 ?auto_323 ) ) ( TRUCK-AT ?auto_327 ?auto_328 ) ( not ( = ?auto_328 ?auto_325 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_327 ?auto_328 ?auto_325 )
      ( MAKE-2CRATE ?auto_324 ?auto_322 ?auto_323 )
      ( MAKE-1CRATE-VERIFY ?auto_322 ?auto_323 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_329 - SURFACE
      ?auto_330 - SURFACE
      ?auto_331 - SURFACE
    )
    :vars
    (
      ?auto_332 - HOIST
      ?auto_333 - PLACE
      ?auto_335 - TRUCK
      ?auto_334 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_332 ?auto_333 ) ( SURFACE-AT ?auto_330 ?auto_333 ) ( CLEAR ?auto_330 ) ( IS-CRATE ?auto_331 ) ( not ( = ?auto_330 ?auto_331 ) ) ( AVAILABLE ?auto_332 ) ( IN ?auto_331 ?auto_335 ) ( ON ?auto_330 ?auto_329 ) ( not ( = ?auto_329 ?auto_330 ) ) ( not ( = ?auto_329 ?auto_331 ) ) ( TRUCK-AT ?auto_335 ?auto_334 ) ( not ( = ?auto_334 ?auto_333 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_330 ?auto_331 )
      ( MAKE-2CRATE-VERIFY ?auto_329 ?auto_330 ?auto_331 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_336 - SURFACE
      ?auto_337 - SURFACE
    )
    :vars
    (
      ?auto_341 - HOIST
      ?auto_342 - PLACE
      ?auto_338 - SURFACE
      ?auto_339 - TRUCK
      ?auto_340 - PLACE
      ?auto_343 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_341 ?auto_342 ) ( SURFACE-AT ?auto_336 ?auto_342 ) ( CLEAR ?auto_336 ) ( IS-CRATE ?auto_337 ) ( not ( = ?auto_336 ?auto_337 ) ) ( AVAILABLE ?auto_341 ) ( ON ?auto_336 ?auto_338 ) ( not ( = ?auto_338 ?auto_336 ) ) ( not ( = ?auto_338 ?auto_337 ) ) ( TRUCK-AT ?auto_339 ?auto_340 ) ( not ( = ?auto_340 ?auto_342 ) ) ( HOIST-AT ?auto_343 ?auto_340 ) ( LIFTING ?auto_343 ?auto_337 ) ( not ( = ?auto_341 ?auto_343 ) ) )
    :subtasks
    ( ( !LOAD ?auto_343 ?auto_337 ?auto_339 ?auto_340 )
      ( MAKE-2CRATE ?auto_338 ?auto_336 ?auto_337 )
      ( MAKE-1CRATE-VERIFY ?auto_336 ?auto_337 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_344 - SURFACE
      ?auto_345 - SURFACE
      ?auto_346 - SURFACE
    )
    :vars
    (
      ?auto_347 - HOIST
      ?auto_348 - PLACE
      ?auto_350 - TRUCK
      ?auto_351 - PLACE
      ?auto_349 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_347 ?auto_348 ) ( SURFACE-AT ?auto_345 ?auto_348 ) ( CLEAR ?auto_345 ) ( IS-CRATE ?auto_346 ) ( not ( = ?auto_345 ?auto_346 ) ) ( AVAILABLE ?auto_347 ) ( ON ?auto_345 ?auto_344 ) ( not ( = ?auto_344 ?auto_345 ) ) ( not ( = ?auto_344 ?auto_346 ) ) ( TRUCK-AT ?auto_350 ?auto_351 ) ( not ( = ?auto_351 ?auto_348 ) ) ( HOIST-AT ?auto_349 ?auto_351 ) ( LIFTING ?auto_349 ?auto_346 ) ( not ( = ?auto_347 ?auto_349 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_345 ?auto_346 )
      ( MAKE-2CRATE-VERIFY ?auto_344 ?auto_345 ?auto_346 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_352 - SURFACE
      ?auto_353 - SURFACE
    )
    :vars
    (
      ?auto_357 - HOIST
      ?auto_356 - PLACE
      ?auto_355 - SURFACE
      ?auto_354 - TRUCK
      ?auto_358 - PLACE
      ?auto_359 - HOIST
      ?auto_360 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_357 ?auto_356 ) ( SURFACE-AT ?auto_352 ?auto_356 ) ( CLEAR ?auto_352 ) ( IS-CRATE ?auto_353 ) ( not ( = ?auto_352 ?auto_353 ) ) ( AVAILABLE ?auto_357 ) ( ON ?auto_352 ?auto_355 ) ( not ( = ?auto_355 ?auto_352 ) ) ( not ( = ?auto_355 ?auto_353 ) ) ( TRUCK-AT ?auto_354 ?auto_358 ) ( not ( = ?auto_358 ?auto_356 ) ) ( HOIST-AT ?auto_359 ?auto_358 ) ( not ( = ?auto_357 ?auto_359 ) ) ( AVAILABLE ?auto_359 ) ( SURFACE-AT ?auto_353 ?auto_358 ) ( ON ?auto_353 ?auto_360 ) ( CLEAR ?auto_353 ) ( not ( = ?auto_352 ?auto_360 ) ) ( not ( = ?auto_353 ?auto_360 ) ) ( not ( = ?auto_355 ?auto_360 ) ) )
    :subtasks
    ( ( !LIFT ?auto_359 ?auto_353 ?auto_360 ?auto_358 )
      ( MAKE-2CRATE ?auto_355 ?auto_352 ?auto_353 )
      ( MAKE-1CRATE-VERIFY ?auto_352 ?auto_353 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_361 - SURFACE
      ?auto_362 - SURFACE
      ?auto_363 - SURFACE
    )
    :vars
    (
      ?auto_366 - HOIST
      ?auto_369 - PLACE
      ?auto_367 - TRUCK
      ?auto_368 - PLACE
      ?auto_365 - HOIST
      ?auto_364 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_366 ?auto_369 ) ( SURFACE-AT ?auto_362 ?auto_369 ) ( CLEAR ?auto_362 ) ( IS-CRATE ?auto_363 ) ( not ( = ?auto_362 ?auto_363 ) ) ( AVAILABLE ?auto_366 ) ( ON ?auto_362 ?auto_361 ) ( not ( = ?auto_361 ?auto_362 ) ) ( not ( = ?auto_361 ?auto_363 ) ) ( TRUCK-AT ?auto_367 ?auto_368 ) ( not ( = ?auto_368 ?auto_369 ) ) ( HOIST-AT ?auto_365 ?auto_368 ) ( not ( = ?auto_366 ?auto_365 ) ) ( AVAILABLE ?auto_365 ) ( SURFACE-AT ?auto_363 ?auto_368 ) ( ON ?auto_363 ?auto_364 ) ( CLEAR ?auto_363 ) ( not ( = ?auto_362 ?auto_364 ) ) ( not ( = ?auto_363 ?auto_364 ) ) ( not ( = ?auto_361 ?auto_364 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_362 ?auto_363 )
      ( MAKE-2CRATE-VERIFY ?auto_361 ?auto_362 ?auto_363 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_370 - SURFACE
      ?auto_371 - SURFACE
    )
    :vars
    (
      ?auto_376 - HOIST
      ?auto_378 - PLACE
      ?auto_375 - SURFACE
      ?auto_377 - PLACE
      ?auto_372 - HOIST
      ?auto_373 - SURFACE
      ?auto_374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_376 ?auto_378 ) ( SURFACE-AT ?auto_370 ?auto_378 ) ( CLEAR ?auto_370 ) ( IS-CRATE ?auto_371 ) ( not ( = ?auto_370 ?auto_371 ) ) ( AVAILABLE ?auto_376 ) ( ON ?auto_370 ?auto_375 ) ( not ( = ?auto_375 ?auto_370 ) ) ( not ( = ?auto_375 ?auto_371 ) ) ( not ( = ?auto_377 ?auto_378 ) ) ( HOIST-AT ?auto_372 ?auto_377 ) ( not ( = ?auto_376 ?auto_372 ) ) ( AVAILABLE ?auto_372 ) ( SURFACE-AT ?auto_371 ?auto_377 ) ( ON ?auto_371 ?auto_373 ) ( CLEAR ?auto_371 ) ( not ( = ?auto_370 ?auto_373 ) ) ( not ( = ?auto_371 ?auto_373 ) ) ( not ( = ?auto_375 ?auto_373 ) ) ( TRUCK-AT ?auto_374 ?auto_378 ) )
    :subtasks
    ( ( !DRIVE ?auto_374 ?auto_378 ?auto_377 )
      ( MAKE-2CRATE ?auto_375 ?auto_370 ?auto_371 )
      ( MAKE-1CRATE-VERIFY ?auto_370 ?auto_371 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_379 - SURFACE
      ?auto_380 - SURFACE
      ?auto_381 - SURFACE
    )
    :vars
    (
      ?auto_387 - HOIST
      ?auto_383 - PLACE
      ?auto_386 - PLACE
      ?auto_384 - HOIST
      ?auto_382 - SURFACE
      ?auto_385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_387 ?auto_383 ) ( SURFACE-AT ?auto_380 ?auto_383 ) ( CLEAR ?auto_380 ) ( IS-CRATE ?auto_381 ) ( not ( = ?auto_380 ?auto_381 ) ) ( AVAILABLE ?auto_387 ) ( ON ?auto_380 ?auto_379 ) ( not ( = ?auto_379 ?auto_380 ) ) ( not ( = ?auto_379 ?auto_381 ) ) ( not ( = ?auto_386 ?auto_383 ) ) ( HOIST-AT ?auto_384 ?auto_386 ) ( not ( = ?auto_387 ?auto_384 ) ) ( AVAILABLE ?auto_384 ) ( SURFACE-AT ?auto_381 ?auto_386 ) ( ON ?auto_381 ?auto_382 ) ( CLEAR ?auto_381 ) ( not ( = ?auto_380 ?auto_382 ) ) ( not ( = ?auto_381 ?auto_382 ) ) ( not ( = ?auto_379 ?auto_382 ) ) ( TRUCK-AT ?auto_385 ?auto_383 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_380 ?auto_381 )
      ( MAKE-2CRATE-VERIFY ?auto_379 ?auto_380 ?auto_381 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_388 - SURFACE
      ?auto_389 - SURFACE
    )
    :vars
    (
      ?auto_390 - HOIST
      ?auto_395 - PLACE
      ?auto_396 - SURFACE
      ?auto_393 - PLACE
      ?auto_391 - HOIST
      ?auto_394 - SURFACE
      ?auto_392 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_390 ?auto_395 ) ( IS-CRATE ?auto_389 ) ( not ( = ?auto_388 ?auto_389 ) ) ( not ( = ?auto_396 ?auto_388 ) ) ( not ( = ?auto_396 ?auto_389 ) ) ( not ( = ?auto_393 ?auto_395 ) ) ( HOIST-AT ?auto_391 ?auto_393 ) ( not ( = ?auto_390 ?auto_391 ) ) ( AVAILABLE ?auto_391 ) ( SURFACE-AT ?auto_389 ?auto_393 ) ( ON ?auto_389 ?auto_394 ) ( CLEAR ?auto_389 ) ( not ( = ?auto_388 ?auto_394 ) ) ( not ( = ?auto_389 ?auto_394 ) ) ( not ( = ?auto_396 ?auto_394 ) ) ( TRUCK-AT ?auto_392 ?auto_395 ) ( SURFACE-AT ?auto_396 ?auto_395 ) ( CLEAR ?auto_396 ) ( LIFTING ?auto_390 ?auto_388 ) ( IS-CRATE ?auto_388 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_396 ?auto_388 )
      ( MAKE-2CRATE ?auto_396 ?auto_388 ?auto_389 )
      ( MAKE-1CRATE-VERIFY ?auto_388 ?auto_389 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_397 - SURFACE
      ?auto_398 - SURFACE
      ?auto_399 - SURFACE
    )
    :vars
    (
      ?auto_401 - HOIST
      ?auto_405 - PLACE
      ?auto_404 - PLACE
      ?auto_400 - HOIST
      ?auto_402 - SURFACE
      ?auto_403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_401 ?auto_405 ) ( IS-CRATE ?auto_399 ) ( not ( = ?auto_398 ?auto_399 ) ) ( not ( = ?auto_397 ?auto_398 ) ) ( not ( = ?auto_397 ?auto_399 ) ) ( not ( = ?auto_404 ?auto_405 ) ) ( HOIST-AT ?auto_400 ?auto_404 ) ( not ( = ?auto_401 ?auto_400 ) ) ( AVAILABLE ?auto_400 ) ( SURFACE-AT ?auto_399 ?auto_404 ) ( ON ?auto_399 ?auto_402 ) ( CLEAR ?auto_399 ) ( not ( = ?auto_398 ?auto_402 ) ) ( not ( = ?auto_399 ?auto_402 ) ) ( not ( = ?auto_397 ?auto_402 ) ) ( TRUCK-AT ?auto_403 ?auto_405 ) ( SURFACE-AT ?auto_397 ?auto_405 ) ( CLEAR ?auto_397 ) ( LIFTING ?auto_401 ?auto_398 ) ( IS-CRATE ?auto_398 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_398 ?auto_399 )
      ( MAKE-2CRATE-VERIFY ?auto_397 ?auto_398 ?auto_399 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_406 - SURFACE
      ?auto_407 - SURFACE
    )
    :vars
    (
      ?auto_412 - HOIST
      ?auto_414 - PLACE
      ?auto_408 - SURFACE
      ?auto_411 - PLACE
      ?auto_413 - HOIST
      ?auto_409 - SURFACE
      ?auto_410 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412 ?auto_414 ) ( IS-CRATE ?auto_407 ) ( not ( = ?auto_406 ?auto_407 ) ) ( not ( = ?auto_408 ?auto_406 ) ) ( not ( = ?auto_408 ?auto_407 ) ) ( not ( = ?auto_411 ?auto_414 ) ) ( HOIST-AT ?auto_413 ?auto_411 ) ( not ( = ?auto_412 ?auto_413 ) ) ( AVAILABLE ?auto_413 ) ( SURFACE-AT ?auto_407 ?auto_411 ) ( ON ?auto_407 ?auto_409 ) ( CLEAR ?auto_407 ) ( not ( = ?auto_406 ?auto_409 ) ) ( not ( = ?auto_407 ?auto_409 ) ) ( not ( = ?auto_408 ?auto_409 ) ) ( TRUCK-AT ?auto_410 ?auto_414 ) ( SURFACE-AT ?auto_408 ?auto_414 ) ( CLEAR ?auto_408 ) ( IS-CRATE ?auto_406 ) ( AVAILABLE ?auto_412 ) ( IN ?auto_406 ?auto_410 ) )
    :subtasks
    ( ( !UNLOAD ?auto_412 ?auto_406 ?auto_410 ?auto_414 )
      ( MAKE-2CRATE ?auto_408 ?auto_406 ?auto_407 )
      ( MAKE-1CRATE-VERIFY ?auto_406 ?auto_407 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_415 - SURFACE
      ?auto_416 - SURFACE
      ?auto_417 - SURFACE
    )
    :vars
    (
      ?auto_420 - HOIST
      ?auto_423 - PLACE
      ?auto_418 - PLACE
      ?auto_419 - HOIST
      ?auto_421 - SURFACE
      ?auto_422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_420 ?auto_423 ) ( IS-CRATE ?auto_417 ) ( not ( = ?auto_416 ?auto_417 ) ) ( not ( = ?auto_415 ?auto_416 ) ) ( not ( = ?auto_415 ?auto_417 ) ) ( not ( = ?auto_418 ?auto_423 ) ) ( HOIST-AT ?auto_419 ?auto_418 ) ( not ( = ?auto_420 ?auto_419 ) ) ( AVAILABLE ?auto_419 ) ( SURFACE-AT ?auto_417 ?auto_418 ) ( ON ?auto_417 ?auto_421 ) ( CLEAR ?auto_417 ) ( not ( = ?auto_416 ?auto_421 ) ) ( not ( = ?auto_417 ?auto_421 ) ) ( not ( = ?auto_415 ?auto_421 ) ) ( TRUCK-AT ?auto_422 ?auto_423 ) ( SURFACE-AT ?auto_415 ?auto_423 ) ( CLEAR ?auto_415 ) ( IS-CRATE ?auto_416 ) ( AVAILABLE ?auto_420 ) ( IN ?auto_416 ?auto_422 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_416 ?auto_417 )
      ( MAKE-2CRATE-VERIFY ?auto_415 ?auto_416 ?auto_417 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_424 - SURFACE
      ?auto_425 - SURFACE
    )
    :vars
    (
      ?auto_431 - HOIST
      ?auto_430 - PLACE
      ?auto_429 - SURFACE
      ?auto_427 - PLACE
      ?auto_432 - HOIST
      ?auto_428 - SURFACE
      ?auto_426 - TRUCK
      ?auto_433 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_431 ?auto_430 ) ( IS-CRATE ?auto_425 ) ( not ( = ?auto_424 ?auto_425 ) ) ( not ( = ?auto_429 ?auto_424 ) ) ( not ( = ?auto_429 ?auto_425 ) ) ( not ( = ?auto_427 ?auto_430 ) ) ( HOIST-AT ?auto_432 ?auto_427 ) ( not ( = ?auto_431 ?auto_432 ) ) ( AVAILABLE ?auto_432 ) ( SURFACE-AT ?auto_425 ?auto_427 ) ( ON ?auto_425 ?auto_428 ) ( CLEAR ?auto_425 ) ( not ( = ?auto_424 ?auto_428 ) ) ( not ( = ?auto_425 ?auto_428 ) ) ( not ( = ?auto_429 ?auto_428 ) ) ( SURFACE-AT ?auto_429 ?auto_430 ) ( CLEAR ?auto_429 ) ( IS-CRATE ?auto_424 ) ( AVAILABLE ?auto_431 ) ( IN ?auto_424 ?auto_426 ) ( TRUCK-AT ?auto_426 ?auto_433 ) ( not ( = ?auto_433 ?auto_430 ) ) ( not ( = ?auto_427 ?auto_433 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_426 ?auto_433 ?auto_430 )
      ( MAKE-2CRATE ?auto_429 ?auto_424 ?auto_425 )
      ( MAKE-1CRATE-VERIFY ?auto_424 ?auto_425 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_434 - SURFACE
      ?auto_435 - SURFACE
      ?auto_436 - SURFACE
    )
    :vars
    (
      ?auto_442 - HOIST
      ?auto_437 - PLACE
      ?auto_443 - PLACE
      ?auto_440 - HOIST
      ?auto_439 - SURFACE
      ?auto_438 - TRUCK
      ?auto_441 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_442 ?auto_437 ) ( IS-CRATE ?auto_436 ) ( not ( = ?auto_435 ?auto_436 ) ) ( not ( = ?auto_434 ?auto_435 ) ) ( not ( = ?auto_434 ?auto_436 ) ) ( not ( = ?auto_443 ?auto_437 ) ) ( HOIST-AT ?auto_440 ?auto_443 ) ( not ( = ?auto_442 ?auto_440 ) ) ( AVAILABLE ?auto_440 ) ( SURFACE-AT ?auto_436 ?auto_443 ) ( ON ?auto_436 ?auto_439 ) ( CLEAR ?auto_436 ) ( not ( = ?auto_435 ?auto_439 ) ) ( not ( = ?auto_436 ?auto_439 ) ) ( not ( = ?auto_434 ?auto_439 ) ) ( SURFACE-AT ?auto_434 ?auto_437 ) ( CLEAR ?auto_434 ) ( IS-CRATE ?auto_435 ) ( AVAILABLE ?auto_442 ) ( IN ?auto_435 ?auto_438 ) ( TRUCK-AT ?auto_438 ?auto_441 ) ( not ( = ?auto_441 ?auto_437 ) ) ( not ( = ?auto_443 ?auto_441 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_435 ?auto_436 )
      ( MAKE-2CRATE-VERIFY ?auto_434 ?auto_435 ?auto_436 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_444 - SURFACE
      ?auto_445 - SURFACE
    )
    :vars
    (
      ?auto_451 - HOIST
      ?auto_453 - PLACE
      ?auto_450 - SURFACE
      ?auto_449 - PLACE
      ?auto_452 - HOIST
      ?auto_448 - SURFACE
      ?auto_447 - TRUCK
      ?auto_446 - PLACE
      ?auto_454 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_451 ?auto_453 ) ( IS-CRATE ?auto_445 ) ( not ( = ?auto_444 ?auto_445 ) ) ( not ( = ?auto_450 ?auto_444 ) ) ( not ( = ?auto_450 ?auto_445 ) ) ( not ( = ?auto_449 ?auto_453 ) ) ( HOIST-AT ?auto_452 ?auto_449 ) ( not ( = ?auto_451 ?auto_452 ) ) ( AVAILABLE ?auto_452 ) ( SURFACE-AT ?auto_445 ?auto_449 ) ( ON ?auto_445 ?auto_448 ) ( CLEAR ?auto_445 ) ( not ( = ?auto_444 ?auto_448 ) ) ( not ( = ?auto_445 ?auto_448 ) ) ( not ( = ?auto_450 ?auto_448 ) ) ( SURFACE-AT ?auto_450 ?auto_453 ) ( CLEAR ?auto_450 ) ( IS-CRATE ?auto_444 ) ( AVAILABLE ?auto_451 ) ( TRUCK-AT ?auto_447 ?auto_446 ) ( not ( = ?auto_446 ?auto_453 ) ) ( not ( = ?auto_449 ?auto_446 ) ) ( HOIST-AT ?auto_454 ?auto_446 ) ( LIFTING ?auto_454 ?auto_444 ) ( not ( = ?auto_451 ?auto_454 ) ) ( not ( = ?auto_452 ?auto_454 ) ) )
    :subtasks
    ( ( !LOAD ?auto_454 ?auto_444 ?auto_447 ?auto_446 )
      ( MAKE-2CRATE ?auto_450 ?auto_444 ?auto_445 )
      ( MAKE-1CRATE-VERIFY ?auto_444 ?auto_445 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_455 - SURFACE
      ?auto_456 - SURFACE
      ?auto_457 - SURFACE
    )
    :vars
    (
      ?auto_458 - HOIST
      ?auto_460 - PLACE
      ?auto_459 - PLACE
      ?auto_461 - HOIST
      ?auto_465 - SURFACE
      ?auto_463 - TRUCK
      ?auto_464 - PLACE
      ?auto_462 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_458 ?auto_460 ) ( IS-CRATE ?auto_457 ) ( not ( = ?auto_456 ?auto_457 ) ) ( not ( = ?auto_455 ?auto_456 ) ) ( not ( = ?auto_455 ?auto_457 ) ) ( not ( = ?auto_459 ?auto_460 ) ) ( HOIST-AT ?auto_461 ?auto_459 ) ( not ( = ?auto_458 ?auto_461 ) ) ( AVAILABLE ?auto_461 ) ( SURFACE-AT ?auto_457 ?auto_459 ) ( ON ?auto_457 ?auto_465 ) ( CLEAR ?auto_457 ) ( not ( = ?auto_456 ?auto_465 ) ) ( not ( = ?auto_457 ?auto_465 ) ) ( not ( = ?auto_455 ?auto_465 ) ) ( SURFACE-AT ?auto_455 ?auto_460 ) ( CLEAR ?auto_455 ) ( IS-CRATE ?auto_456 ) ( AVAILABLE ?auto_458 ) ( TRUCK-AT ?auto_463 ?auto_464 ) ( not ( = ?auto_464 ?auto_460 ) ) ( not ( = ?auto_459 ?auto_464 ) ) ( HOIST-AT ?auto_462 ?auto_464 ) ( LIFTING ?auto_462 ?auto_456 ) ( not ( = ?auto_458 ?auto_462 ) ) ( not ( = ?auto_461 ?auto_462 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_456 ?auto_457 )
      ( MAKE-2CRATE-VERIFY ?auto_455 ?auto_456 ?auto_457 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_466 - SURFACE
      ?auto_467 - SURFACE
    )
    :vars
    (
      ?auto_470 - HOIST
      ?auto_473 - PLACE
      ?auto_475 - SURFACE
      ?auto_472 - PLACE
      ?auto_474 - HOIST
      ?auto_468 - SURFACE
      ?auto_476 - TRUCK
      ?auto_471 - PLACE
      ?auto_469 - HOIST
      ?auto_477 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_470 ?auto_473 ) ( IS-CRATE ?auto_467 ) ( not ( = ?auto_466 ?auto_467 ) ) ( not ( = ?auto_475 ?auto_466 ) ) ( not ( = ?auto_475 ?auto_467 ) ) ( not ( = ?auto_472 ?auto_473 ) ) ( HOIST-AT ?auto_474 ?auto_472 ) ( not ( = ?auto_470 ?auto_474 ) ) ( AVAILABLE ?auto_474 ) ( SURFACE-AT ?auto_467 ?auto_472 ) ( ON ?auto_467 ?auto_468 ) ( CLEAR ?auto_467 ) ( not ( = ?auto_466 ?auto_468 ) ) ( not ( = ?auto_467 ?auto_468 ) ) ( not ( = ?auto_475 ?auto_468 ) ) ( SURFACE-AT ?auto_475 ?auto_473 ) ( CLEAR ?auto_475 ) ( IS-CRATE ?auto_466 ) ( AVAILABLE ?auto_470 ) ( TRUCK-AT ?auto_476 ?auto_471 ) ( not ( = ?auto_471 ?auto_473 ) ) ( not ( = ?auto_472 ?auto_471 ) ) ( HOIST-AT ?auto_469 ?auto_471 ) ( not ( = ?auto_470 ?auto_469 ) ) ( not ( = ?auto_474 ?auto_469 ) ) ( AVAILABLE ?auto_469 ) ( SURFACE-AT ?auto_466 ?auto_471 ) ( ON ?auto_466 ?auto_477 ) ( CLEAR ?auto_466 ) ( not ( = ?auto_466 ?auto_477 ) ) ( not ( = ?auto_467 ?auto_477 ) ) ( not ( = ?auto_475 ?auto_477 ) ) ( not ( = ?auto_468 ?auto_477 ) ) )
    :subtasks
    ( ( !LIFT ?auto_469 ?auto_466 ?auto_477 ?auto_471 )
      ( MAKE-2CRATE ?auto_475 ?auto_466 ?auto_467 )
      ( MAKE-1CRATE-VERIFY ?auto_466 ?auto_467 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_478 - SURFACE
      ?auto_479 - SURFACE
      ?auto_480 - SURFACE
    )
    :vars
    (
      ?auto_483 - HOIST
      ?auto_484 - PLACE
      ?auto_488 - PLACE
      ?auto_481 - HOIST
      ?auto_482 - SURFACE
      ?auto_486 - TRUCK
      ?auto_485 - PLACE
      ?auto_487 - HOIST
      ?auto_489 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_483 ?auto_484 ) ( IS-CRATE ?auto_480 ) ( not ( = ?auto_479 ?auto_480 ) ) ( not ( = ?auto_478 ?auto_479 ) ) ( not ( = ?auto_478 ?auto_480 ) ) ( not ( = ?auto_488 ?auto_484 ) ) ( HOIST-AT ?auto_481 ?auto_488 ) ( not ( = ?auto_483 ?auto_481 ) ) ( AVAILABLE ?auto_481 ) ( SURFACE-AT ?auto_480 ?auto_488 ) ( ON ?auto_480 ?auto_482 ) ( CLEAR ?auto_480 ) ( not ( = ?auto_479 ?auto_482 ) ) ( not ( = ?auto_480 ?auto_482 ) ) ( not ( = ?auto_478 ?auto_482 ) ) ( SURFACE-AT ?auto_478 ?auto_484 ) ( CLEAR ?auto_478 ) ( IS-CRATE ?auto_479 ) ( AVAILABLE ?auto_483 ) ( TRUCK-AT ?auto_486 ?auto_485 ) ( not ( = ?auto_485 ?auto_484 ) ) ( not ( = ?auto_488 ?auto_485 ) ) ( HOIST-AT ?auto_487 ?auto_485 ) ( not ( = ?auto_483 ?auto_487 ) ) ( not ( = ?auto_481 ?auto_487 ) ) ( AVAILABLE ?auto_487 ) ( SURFACE-AT ?auto_479 ?auto_485 ) ( ON ?auto_479 ?auto_489 ) ( CLEAR ?auto_479 ) ( not ( = ?auto_479 ?auto_489 ) ) ( not ( = ?auto_480 ?auto_489 ) ) ( not ( = ?auto_478 ?auto_489 ) ) ( not ( = ?auto_482 ?auto_489 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479 ?auto_480 )
      ( MAKE-2CRATE-VERIFY ?auto_478 ?auto_479 ?auto_480 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_490 - SURFACE
      ?auto_491 - SURFACE
    )
    :vars
    (
      ?auto_496 - HOIST
      ?auto_493 - PLACE
      ?auto_501 - SURFACE
      ?auto_495 - PLACE
      ?auto_492 - HOIST
      ?auto_494 - SURFACE
      ?auto_500 - PLACE
      ?auto_497 - HOIST
      ?auto_499 - SURFACE
      ?auto_498 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_496 ?auto_493 ) ( IS-CRATE ?auto_491 ) ( not ( = ?auto_490 ?auto_491 ) ) ( not ( = ?auto_501 ?auto_490 ) ) ( not ( = ?auto_501 ?auto_491 ) ) ( not ( = ?auto_495 ?auto_493 ) ) ( HOIST-AT ?auto_492 ?auto_495 ) ( not ( = ?auto_496 ?auto_492 ) ) ( AVAILABLE ?auto_492 ) ( SURFACE-AT ?auto_491 ?auto_495 ) ( ON ?auto_491 ?auto_494 ) ( CLEAR ?auto_491 ) ( not ( = ?auto_490 ?auto_494 ) ) ( not ( = ?auto_491 ?auto_494 ) ) ( not ( = ?auto_501 ?auto_494 ) ) ( SURFACE-AT ?auto_501 ?auto_493 ) ( CLEAR ?auto_501 ) ( IS-CRATE ?auto_490 ) ( AVAILABLE ?auto_496 ) ( not ( = ?auto_500 ?auto_493 ) ) ( not ( = ?auto_495 ?auto_500 ) ) ( HOIST-AT ?auto_497 ?auto_500 ) ( not ( = ?auto_496 ?auto_497 ) ) ( not ( = ?auto_492 ?auto_497 ) ) ( AVAILABLE ?auto_497 ) ( SURFACE-AT ?auto_490 ?auto_500 ) ( ON ?auto_490 ?auto_499 ) ( CLEAR ?auto_490 ) ( not ( = ?auto_490 ?auto_499 ) ) ( not ( = ?auto_491 ?auto_499 ) ) ( not ( = ?auto_501 ?auto_499 ) ) ( not ( = ?auto_494 ?auto_499 ) ) ( TRUCK-AT ?auto_498 ?auto_493 ) )
    :subtasks
    ( ( !DRIVE ?auto_498 ?auto_493 ?auto_500 )
      ( MAKE-2CRATE ?auto_501 ?auto_490 ?auto_491 )
      ( MAKE-1CRATE-VERIFY ?auto_490 ?auto_491 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_502 - SURFACE
      ?auto_503 - SURFACE
      ?auto_504 - SURFACE
    )
    :vars
    (
      ?auto_511 - HOIST
      ?auto_506 - PLACE
      ?auto_507 - PLACE
      ?auto_509 - HOIST
      ?auto_512 - SURFACE
      ?auto_505 - PLACE
      ?auto_513 - HOIST
      ?auto_510 - SURFACE
      ?auto_508 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_511 ?auto_506 ) ( IS-CRATE ?auto_504 ) ( not ( = ?auto_503 ?auto_504 ) ) ( not ( = ?auto_502 ?auto_503 ) ) ( not ( = ?auto_502 ?auto_504 ) ) ( not ( = ?auto_507 ?auto_506 ) ) ( HOIST-AT ?auto_509 ?auto_507 ) ( not ( = ?auto_511 ?auto_509 ) ) ( AVAILABLE ?auto_509 ) ( SURFACE-AT ?auto_504 ?auto_507 ) ( ON ?auto_504 ?auto_512 ) ( CLEAR ?auto_504 ) ( not ( = ?auto_503 ?auto_512 ) ) ( not ( = ?auto_504 ?auto_512 ) ) ( not ( = ?auto_502 ?auto_512 ) ) ( SURFACE-AT ?auto_502 ?auto_506 ) ( CLEAR ?auto_502 ) ( IS-CRATE ?auto_503 ) ( AVAILABLE ?auto_511 ) ( not ( = ?auto_505 ?auto_506 ) ) ( not ( = ?auto_507 ?auto_505 ) ) ( HOIST-AT ?auto_513 ?auto_505 ) ( not ( = ?auto_511 ?auto_513 ) ) ( not ( = ?auto_509 ?auto_513 ) ) ( AVAILABLE ?auto_513 ) ( SURFACE-AT ?auto_503 ?auto_505 ) ( ON ?auto_503 ?auto_510 ) ( CLEAR ?auto_503 ) ( not ( = ?auto_503 ?auto_510 ) ) ( not ( = ?auto_504 ?auto_510 ) ) ( not ( = ?auto_502 ?auto_510 ) ) ( not ( = ?auto_512 ?auto_510 ) ) ( TRUCK-AT ?auto_508 ?auto_506 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_503 ?auto_504 )
      ( MAKE-2CRATE-VERIFY ?auto_502 ?auto_503 ?auto_504 ) )
  )

)

