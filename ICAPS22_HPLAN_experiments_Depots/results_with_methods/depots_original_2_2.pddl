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
      ?auto_281 - SURFACE
      ?auto_282 - SURFACE
    )
    :vars
    (
      ?auto_283 - HOIST
      ?auto_284 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_283 ?auto_284 ) ( SURFACE-AT ?auto_282 ?auto_284 ) ( CLEAR ?auto_282 ) ( LIFTING ?auto_283 ?auto_281 ) ( IS-CRATE ?auto_281 ) ( not ( = ?auto_281 ?auto_282 ) ) )
    :subtasks
    ( ( !DROP ?auto_283 ?auto_281 ?auto_282 ?auto_284 )
      ( MAKE-ON-VERIFY ?auto_281 ?auto_282 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_285 - SURFACE
      ?auto_286 - SURFACE
    )
    :vars
    (
      ?auto_287 - HOIST
      ?auto_288 - PLACE
      ?auto_289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_287 ?auto_288 ) ( SURFACE-AT ?auto_286 ?auto_288 ) ( CLEAR ?auto_286 ) ( IS-CRATE ?auto_285 ) ( not ( = ?auto_285 ?auto_286 ) ) ( TRUCK-AT ?auto_289 ?auto_288 ) ( AVAILABLE ?auto_287 ) ( IN ?auto_285 ?auto_289 ) )
    :subtasks
    ( ( !UNLOAD ?auto_287 ?auto_285 ?auto_289 ?auto_288 )
      ( MAKE-ON ?auto_285 ?auto_286 )
      ( MAKE-ON-VERIFY ?auto_285 ?auto_286 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_290 - SURFACE
      ?auto_291 - SURFACE
    )
    :vars
    (
      ?auto_292 - HOIST
      ?auto_293 - PLACE
      ?auto_294 - TRUCK
      ?auto_295 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_292 ?auto_293 ) ( SURFACE-AT ?auto_291 ?auto_293 ) ( CLEAR ?auto_291 ) ( IS-CRATE ?auto_290 ) ( not ( = ?auto_290 ?auto_291 ) ) ( AVAILABLE ?auto_292 ) ( IN ?auto_290 ?auto_294 ) ( TRUCK-AT ?auto_294 ?auto_295 ) ( not ( = ?auto_295 ?auto_293 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_294 ?auto_295 ?auto_293 )
      ( MAKE-ON ?auto_290 ?auto_291 )
      ( MAKE-ON-VERIFY ?auto_290 ?auto_291 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_296 - SURFACE
      ?auto_297 - SURFACE
    )
    :vars
    (
      ?auto_299 - HOIST
      ?auto_300 - PLACE
      ?auto_301 - TRUCK
      ?auto_298 - PLACE
      ?auto_302 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_299 ?auto_300 ) ( SURFACE-AT ?auto_297 ?auto_300 ) ( CLEAR ?auto_297 ) ( IS-CRATE ?auto_296 ) ( not ( = ?auto_296 ?auto_297 ) ) ( AVAILABLE ?auto_299 ) ( TRUCK-AT ?auto_301 ?auto_298 ) ( not ( = ?auto_298 ?auto_300 ) ) ( HOIST-AT ?auto_302 ?auto_298 ) ( LIFTING ?auto_302 ?auto_296 ) ( not ( = ?auto_299 ?auto_302 ) ) )
    :subtasks
    ( ( !LOAD ?auto_302 ?auto_296 ?auto_301 ?auto_298 )
      ( MAKE-ON ?auto_296 ?auto_297 )
      ( MAKE-ON-VERIFY ?auto_296 ?auto_297 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_303 - SURFACE
      ?auto_304 - SURFACE
    )
    :vars
    (
      ?auto_307 - HOIST
      ?auto_305 - PLACE
      ?auto_308 - TRUCK
      ?auto_309 - PLACE
      ?auto_306 - HOIST
      ?auto_310 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_307 ?auto_305 ) ( SURFACE-AT ?auto_304 ?auto_305 ) ( CLEAR ?auto_304 ) ( IS-CRATE ?auto_303 ) ( not ( = ?auto_303 ?auto_304 ) ) ( AVAILABLE ?auto_307 ) ( TRUCK-AT ?auto_308 ?auto_309 ) ( not ( = ?auto_309 ?auto_305 ) ) ( HOIST-AT ?auto_306 ?auto_309 ) ( not ( = ?auto_307 ?auto_306 ) ) ( AVAILABLE ?auto_306 ) ( SURFACE-AT ?auto_303 ?auto_309 ) ( ON ?auto_303 ?auto_310 ) ( CLEAR ?auto_303 ) ( not ( = ?auto_303 ?auto_310 ) ) ( not ( = ?auto_304 ?auto_310 ) ) )
    :subtasks
    ( ( !LIFT ?auto_306 ?auto_303 ?auto_310 ?auto_309 )
      ( MAKE-ON ?auto_303 ?auto_304 )
      ( MAKE-ON-VERIFY ?auto_303 ?auto_304 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_311 - SURFACE
      ?auto_312 - SURFACE
    )
    :vars
    (
      ?auto_316 - HOIST
      ?auto_314 - PLACE
      ?auto_313 - PLACE
      ?auto_317 - HOIST
      ?auto_315 - SURFACE
      ?auto_318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_316 ?auto_314 ) ( SURFACE-AT ?auto_312 ?auto_314 ) ( CLEAR ?auto_312 ) ( IS-CRATE ?auto_311 ) ( not ( = ?auto_311 ?auto_312 ) ) ( AVAILABLE ?auto_316 ) ( not ( = ?auto_313 ?auto_314 ) ) ( HOIST-AT ?auto_317 ?auto_313 ) ( not ( = ?auto_316 ?auto_317 ) ) ( AVAILABLE ?auto_317 ) ( SURFACE-AT ?auto_311 ?auto_313 ) ( ON ?auto_311 ?auto_315 ) ( CLEAR ?auto_311 ) ( not ( = ?auto_311 ?auto_315 ) ) ( not ( = ?auto_312 ?auto_315 ) ) ( TRUCK-AT ?auto_318 ?auto_314 ) )
    :subtasks
    ( ( !DRIVE ?auto_318 ?auto_314 ?auto_313 )
      ( MAKE-ON ?auto_311 ?auto_312 )
      ( MAKE-ON-VERIFY ?auto_311 ?auto_312 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_321 - SURFACE
      ?auto_322 - SURFACE
    )
    :vars
    (
      ?auto_323 - HOIST
      ?auto_324 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_323 ?auto_324 ) ( SURFACE-AT ?auto_322 ?auto_324 ) ( CLEAR ?auto_322 ) ( LIFTING ?auto_323 ?auto_321 ) ( IS-CRATE ?auto_321 ) ( not ( = ?auto_321 ?auto_322 ) ) )
    :subtasks
    ( ( !DROP ?auto_323 ?auto_321 ?auto_322 ?auto_324 )
      ( MAKE-ON-VERIFY ?auto_321 ?auto_322 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_325 - SURFACE
      ?auto_326 - SURFACE
    )
    :vars
    (
      ?auto_328 - HOIST
      ?auto_327 - PLACE
      ?auto_329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_328 ?auto_327 ) ( SURFACE-AT ?auto_326 ?auto_327 ) ( CLEAR ?auto_326 ) ( IS-CRATE ?auto_325 ) ( not ( = ?auto_325 ?auto_326 ) ) ( TRUCK-AT ?auto_329 ?auto_327 ) ( AVAILABLE ?auto_328 ) ( IN ?auto_325 ?auto_329 ) )
    :subtasks
    ( ( !UNLOAD ?auto_328 ?auto_325 ?auto_329 ?auto_327 )
      ( MAKE-ON ?auto_325 ?auto_326 )
      ( MAKE-ON-VERIFY ?auto_325 ?auto_326 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_330 - SURFACE
      ?auto_331 - SURFACE
    )
    :vars
    (
      ?auto_333 - HOIST
      ?auto_334 - PLACE
      ?auto_332 - TRUCK
      ?auto_335 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_333 ?auto_334 ) ( SURFACE-AT ?auto_331 ?auto_334 ) ( CLEAR ?auto_331 ) ( IS-CRATE ?auto_330 ) ( not ( = ?auto_330 ?auto_331 ) ) ( AVAILABLE ?auto_333 ) ( IN ?auto_330 ?auto_332 ) ( TRUCK-AT ?auto_332 ?auto_335 ) ( not ( = ?auto_335 ?auto_334 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_332 ?auto_335 ?auto_334 )
      ( MAKE-ON ?auto_330 ?auto_331 )
      ( MAKE-ON-VERIFY ?auto_330 ?auto_331 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_336 - SURFACE
      ?auto_337 - SURFACE
    )
    :vars
    (
      ?auto_340 - HOIST
      ?auto_339 - PLACE
      ?auto_341 - TRUCK
      ?auto_338 - PLACE
      ?auto_342 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_340 ?auto_339 ) ( SURFACE-AT ?auto_337 ?auto_339 ) ( CLEAR ?auto_337 ) ( IS-CRATE ?auto_336 ) ( not ( = ?auto_336 ?auto_337 ) ) ( AVAILABLE ?auto_340 ) ( TRUCK-AT ?auto_341 ?auto_338 ) ( not ( = ?auto_338 ?auto_339 ) ) ( HOIST-AT ?auto_342 ?auto_338 ) ( LIFTING ?auto_342 ?auto_336 ) ( not ( = ?auto_340 ?auto_342 ) ) )
    :subtasks
    ( ( !LOAD ?auto_342 ?auto_336 ?auto_341 ?auto_338 )
      ( MAKE-ON ?auto_336 ?auto_337 )
      ( MAKE-ON-VERIFY ?auto_336 ?auto_337 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_343 - SURFACE
      ?auto_344 - SURFACE
    )
    :vars
    (
      ?auto_349 - HOIST
      ?auto_346 - PLACE
      ?auto_347 - TRUCK
      ?auto_345 - PLACE
      ?auto_348 - HOIST
      ?auto_350 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_349 ?auto_346 ) ( SURFACE-AT ?auto_344 ?auto_346 ) ( CLEAR ?auto_344 ) ( IS-CRATE ?auto_343 ) ( not ( = ?auto_343 ?auto_344 ) ) ( AVAILABLE ?auto_349 ) ( TRUCK-AT ?auto_347 ?auto_345 ) ( not ( = ?auto_345 ?auto_346 ) ) ( HOIST-AT ?auto_348 ?auto_345 ) ( not ( = ?auto_349 ?auto_348 ) ) ( AVAILABLE ?auto_348 ) ( SURFACE-AT ?auto_343 ?auto_345 ) ( ON ?auto_343 ?auto_350 ) ( CLEAR ?auto_343 ) ( not ( = ?auto_343 ?auto_350 ) ) ( not ( = ?auto_344 ?auto_350 ) ) )
    :subtasks
    ( ( !LIFT ?auto_348 ?auto_343 ?auto_350 ?auto_345 )
      ( MAKE-ON ?auto_343 ?auto_344 )
      ( MAKE-ON-VERIFY ?auto_343 ?auto_344 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_351 - SURFACE
      ?auto_352 - SURFACE
    )
    :vars
    (
      ?auto_358 - HOIST
      ?auto_353 - PLACE
      ?auto_354 - PLACE
      ?auto_357 - HOIST
      ?auto_355 - SURFACE
      ?auto_356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_358 ?auto_353 ) ( SURFACE-AT ?auto_352 ?auto_353 ) ( CLEAR ?auto_352 ) ( IS-CRATE ?auto_351 ) ( not ( = ?auto_351 ?auto_352 ) ) ( AVAILABLE ?auto_358 ) ( not ( = ?auto_354 ?auto_353 ) ) ( HOIST-AT ?auto_357 ?auto_354 ) ( not ( = ?auto_358 ?auto_357 ) ) ( AVAILABLE ?auto_357 ) ( SURFACE-AT ?auto_351 ?auto_354 ) ( ON ?auto_351 ?auto_355 ) ( CLEAR ?auto_351 ) ( not ( = ?auto_351 ?auto_355 ) ) ( not ( = ?auto_352 ?auto_355 ) ) ( TRUCK-AT ?auto_356 ?auto_353 ) )
    :subtasks
    ( ( !DRIVE ?auto_356 ?auto_353 ?auto_354 )
      ( MAKE-ON ?auto_351 ?auto_352 )
      ( MAKE-ON-VERIFY ?auto_351 ?auto_352 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_359 - SURFACE
      ?auto_360 - SURFACE
    )
    :vars
    (
      ?auto_366 - HOIST
      ?auto_361 - PLACE
      ?auto_362 - PLACE
      ?auto_365 - HOIST
      ?auto_363 - SURFACE
      ?auto_364 - TRUCK
      ?auto_367 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_366 ?auto_361 ) ( IS-CRATE ?auto_359 ) ( not ( = ?auto_359 ?auto_360 ) ) ( not ( = ?auto_362 ?auto_361 ) ) ( HOIST-AT ?auto_365 ?auto_362 ) ( not ( = ?auto_366 ?auto_365 ) ) ( AVAILABLE ?auto_365 ) ( SURFACE-AT ?auto_359 ?auto_362 ) ( ON ?auto_359 ?auto_363 ) ( CLEAR ?auto_359 ) ( not ( = ?auto_359 ?auto_363 ) ) ( not ( = ?auto_360 ?auto_363 ) ) ( TRUCK-AT ?auto_364 ?auto_361 ) ( SURFACE-AT ?auto_367 ?auto_361 ) ( CLEAR ?auto_367 ) ( LIFTING ?auto_366 ?auto_360 ) ( IS-CRATE ?auto_360 ) ( not ( = ?auto_359 ?auto_367 ) ) ( not ( = ?auto_360 ?auto_367 ) ) ( not ( = ?auto_363 ?auto_367 ) ) )
    :subtasks
    ( ( !DROP ?auto_366 ?auto_360 ?auto_367 ?auto_361 )
      ( MAKE-ON ?auto_359 ?auto_360 )
      ( MAKE-ON-VERIFY ?auto_359 ?auto_360 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_368 - SURFACE
      ?auto_369 - SURFACE
    )
    :vars
    (
      ?auto_373 - HOIST
      ?auto_372 - PLACE
      ?auto_374 - PLACE
      ?auto_370 - HOIST
      ?auto_375 - SURFACE
      ?auto_376 - TRUCK
      ?auto_371 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_373 ?auto_372 ) ( IS-CRATE ?auto_368 ) ( not ( = ?auto_368 ?auto_369 ) ) ( not ( = ?auto_374 ?auto_372 ) ) ( HOIST-AT ?auto_370 ?auto_374 ) ( not ( = ?auto_373 ?auto_370 ) ) ( AVAILABLE ?auto_370 ) ( SURFACE-AT ?auto_368 ?auto_374 ) ( ON ?auto_368 ?auto_375 ) ( CLEAR ?auto_368 ) ( not ( = ?auto_368 ?auto_375 ) ) ( not ( = ?auto_369 ?auto_375 ) ) ( TRUCK-AT ?auto_376 ?auto_372 ) ( SURFACE-AT ?auto_371 ?auto_372 ) ( CLEAR ?auto_371 ) ( IS-CRATE ?auto_369 ) ( not ( = ?auto_368 ?auto_371 ) ) ( not ( = ?auto_369 ?auto_371 ) ) ( not ( = ?auto_375 ?auto_371 ) ) ( AVAILABLE ?auto_373 ) ( IN ?auto_369 ?auto_376 ) )
    :subtasks
    ( ( !UNLOAD ?auto_373 ?auto_369 ?auto_376 ?auto_372 )
      ( MAKE-ON ?auto_368 ?auto_369 )
      ( MAKE-ON-VERIFY ?auto_368 ?auto_369 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_377 - SURFACE
      ?auto_378 - SURFACE
    )
    :vars
    (
      ?auto_380 - HOIST
      ?auto_384 - PLACE
      ?auto_382 - PLACE
      ?auto_385 - HOIST
      ?auto_381 - SURFACE
      ?auto_383 - SURFACE
      ?auto_379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_380 ?auto_384 ) ( IS-CRATE ?auto_377 ) ( not ( = ?auto_377 ?auto_378 ) ) ( not ( = ?auto_382 ?auto_384 ) ) ( HOIST-AT ?auto_385 ?auto_382 ) ( not ( = ?auto_380 ?auto_385 ) ) ( AVAILABLE ?auto_385 ) ( SURFACE-AT ?auto_377 ?auto_382 ) ( ON ?auto_377 ?auto_381 ) ( CLEAR ?auto_377 ) ( not ( = ?auto_377 ?auto_381 ) ) ( not ( = ?auto_378 ?auto_381 ) ) ( SURFACE-AT ?auto_383 ?auto_384 ) ( CLEAR ?auto_383 ) ( IS-CRATE ?auto_378 ) ( not ( = ?auto_377 ?auto_383 ) ) ( not ( = ?auto_378 ?auto_383 ) ) ( not ( = ?auto_381 ?auto_383 ) ) ( AVAILABLE ?auto_380 ) ( IN ?auto_378 ?auto_379 ) ( TRUCK-AT ?auto_379 ?auto_382 ) )
    :subtasks
    ( ( !DRIVE ?auto_379 ?auto_382 ?auto_384 )
      ( MAKE-ON ?auto_377 ?auto_378 )
      ( MAKE-ON-VERIFY ?auto_377 ?auto_378 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_386 - SURFACE
      ?auto_387 - SURFACE
    )
    :vars
    (
      ?auto_389 - HOIST
      ?auto_388 - PLACE
      ?auto_391 - PLACE
      ?auto_394 - HOIST
      ?auto_390 - SURFACE
      ?auto_393 - SURFACE
      ?auto_392 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_389 ?auto_388 ) ( IS-CRATE ?auto_386 ) ( not ( = ?auto_386 ?auto_387 ) ) ( not ( = ?auto_391 ?auto_388 ) ) ( HOIST-AT ?auto_394 ?auto_391 ) ( not ( = ?auto_389 ?auto_394 ) ) ( SURFACE-AT ?auto_386 ?auto_391 ) ( ON ?auto_386 ?auto_390 ) ( CLEAR ?auto_386 ) ( not ( = ?auto_386 ?auto_390 ) ) ( not ( = ?auto_387 ?auto_390 ) ) ( SURFACE-AT ?auto_393 ?auto_388 ) ( CLEAR ?auto_393 ) ( IS-CRATE ?auto_387 ) ( not ( = ?auto_386 ?auto_393 ) ) ( not ( = ?auto_387 ?auto_393 ) ) ( not ( = ?auto_390 ?auto_393 ) ) ( AVAILABLE ?auto_389 ) ( TRUCK-AT ?auto_392 ?auto_391 ) ( LIFTING ?auto_394 ?auto_387 ) )
    :subtasks
    ( ( !LOAD ?auto_394 ?auto_387 ?auto_392 ?auto_391 )
      ( MAKE-ON ?auto_386 ?auto_387 )
      ( MAKE-ON-VERIFY ?auto_386 ?auto_387 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_395 - SURFACE
      ?auto_396 - SURFACE
    )
    :vars
    (
      ?auto_403 - HOIST
      ?auto_398 - PLACE
      ?auto_402 - PLACE
      ?auto_399 - HOIST
      ?auto_401 - SURFACE
      ?auto_397 - SURFACE
      ?auto_400 - TRUCK
      ?auto_404 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403 ?auto_398 ) ( IS-CRATE ?auto_395 ) ( not ( = ?auto_395 ?auto_396 ) ) ( not ( = ?auto_402 ?auto_398 ) ) ( HOIST-AT ?auto_399 ?auto_402 ) ( not ( = ?auto_403 ?auto_399 ) ) ( SURFACE-AT ?auto_395 ?auto_402 ) ( ON ?auto_395 ?auto_401 ) ( CLEAR ?auto_395 ) ( not ( = ?auto_395 ?auto_401 ) ) ( not ( = ?auto_396 ?auto_401 ) ) ( SURFACE-AT ?auto_397 ?auto_398 ) ( CLEAR ?auto_397 ) ( IS-CRATE ?auto_396 ) ( not ( = ?auto_395 ?auto_397 ) ) ( not ( = ?auto_396 ?auto_397 ) ) ( not ( = ?auto_401 ?auto_397 ) ) ( AVAILABLE ?auto_403 ) ( TRUCK-AT ?auto_400 ?auto_402 ) ( AVAILABLE ?auto_399 ) ( SURFACE-AT ?auto_396 ?auto_402 ) ( ON ?auto_396 ?auto_404 ) ( CLEAR ?auto_396 ) ( not ( = ?auto_395 ?auto_404 ) ) ( not ( = ?auto_396 ?auto_404 ) ) ( not ( = ?auto_401 ?auto_404 ) ) ( not ( = ?auto_397 ?auto_404 ) ) )
    :subtasks
    ( ( !LIFT ?auto_399 ?auto_396 ?auto_404 ?auto_402 )
      ( MAKE-ON ?auto_395 ?auto_396 )
      ( MAKE-ON-VERIFY ?auto_395 ?auto_396 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_405 - SURFACE
      ?auto_406 - SURFACE
    )
    :vars
    (
      ?auto_413 - HOIST
      ?auto_408 - PLACE
      ?auto_407 - PLACE
      ?auto_409 - HOIST
      ?auto_411 - SURFACE
      ?auto_410 - SURFACE
      ?auto_414 - SURFACE
      ?auto_412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_413 ?auto_408 ) ( IS-CRATE ?auto_405 ) ( not ( = ?auto_405 ?auto_406 ) ) ( not ( = ?auto_407 ?auto_408 ) ) ( HOIST-AT ?auto_409 ?auto_407 ) ( not ( = ?auto_413 ?auto_409 ) ) ( SURFACE-AT ?auto_405 ?auto_407 ) ( ON ?auto_405 ?auto_411 ) ( CLEAR ?auto_405 ) ( not ( = ?auto_405 ?auto_411 ) ) ( not ( = ?auto_406 ?auto_411 ) ) ( SURFACE-AT ?auto_410 ?auto_408 ) ( CLEAR ?auto_410 ) ( IS-CRATE ?auto_406 ) ( not ( = ?auto_405 ?auto_410 ) ) ( not ( = ?auto_406 ?auto_410 ) ) ( not ( = ?auto_411 ?auto_410 ) ) ( AVAILABLE ?auto_413 ) ( AVAILABLE ?auto_409 ) ( SURFACE-AT ?auto_406 ?auto_407 ) ( ON ?auto_406 ?auto_414 ) ( CLEAR ?auto_406 ) ( not ( = ?auto_405 ?auto_414 ) ) ( not ( = ?auto_406 ?auto_414 ) ) ( not ( = ?auto_411 ?auto_414 ) ) ( not ( = ?auto_410 ?auto_414 ) ) ( TRUCK-AT ?auto_412 ?auto_408 ) )
    :subtasks
    ( ( !DRIVE ?auto_412 ?auto_408 ?auto_407 )
      ( MAKE-ON ?auto_405 ?auto_406 )
      ( MAKE-ON-VERIFY ?auto_405 ?auto_406 ) )
  )

)

