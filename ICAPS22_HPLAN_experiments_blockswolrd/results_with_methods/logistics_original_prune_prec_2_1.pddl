( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_254 - OBJ
      ?auto_253 - LOCATION
    )
    :vars
    (
      ?auto_255 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_255 ?auto_253 ) ( IN-TRUCK ?auto_254 ?auto_255 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_254 ?auto_255 ?auto_253 )
      ( DELIVER-1PKG-VERIFY ?auto_254 ?auto_253 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_261 - OBJ
      ?auto_260 - LOCATION
    )
    :vars
    (
      ?auto_262 - TRUCK
      ?auto_263 - LOCATION
      ?auto_264 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_261 ?auto_262 ) ( TRUCK-AT ?auto_262 ?auto_263 ) ( IN-CITY ?auto_263 ?auto_264 ) ( IN-CITY ?auto_260 ?auto_264 ) ( not ( = ?auto_260 ?auto_263 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_262 ?auto_263 ?auto_260 ?auto_264 )
      ( DELIVER-1PKG ?auto_261 ?auto_260 )
      ( DELIVER-1PKG-VERIFY ?auto_261 ?auto_260 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_272 - OBJ
      ?auto_271 - LOCATION
    )
    :vars
    (
      ?auto_273 - TRUCK
      ?auto_274 - LOCATION
      ?auto_275 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_273 ?auto_274 ) ( IN-CITY ?auto_274 ?auto_275 ) ( IN-CITY ?auto_271 ?auto_275 ) ( not ( = ?auto_271 ?auto_274 ) ) ( OBJ-AT ?auto_272 ?auto_274 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_272 ?auto_273 ?auto_274 )
      ( DELIVER-1PKG ?auto_272 ?auto_271 )
      ( DELIVER-1PKG-VERIFY ?auto_272 ?auto_271 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_283 - OBJ
      ?auto_282 - LOCATION
    )
    :vars
    (
      ?auto_286 - LOCATION
      ?auto_284 - CITY
      ?auto_285 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_286 ?auto_284 ) ( IN-CITY ?auto_282 ?auto_284 ) ( not ( = ?auto_282 ?auto_286 ) ) ( OBJ-AT ?auto_283 ?auto_286 ) ( TRUCK-AT ?auto_285 ?auto_282 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_285 ?auto_282 ?auto_286 ?auto_284 )
      ( DELIVER-1PKG ?auto_283 ?auto_282 )
      ( DELIVER-1PKG-VERIFY ?auto_283 ?auto_282 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_308 - OBJ
      ?auto_309 - OBJ
      ?auto_307 - LOCATION
    )
    :vars
    (
      ?auto_310 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_309 ?auto_308 ) ) ( TRUCK-AT ?auto_310 ?auto_307 ) ( IN-TRUCK ?auto_309 ?auto_310 ) ( OBJ-AT ?auto_308 ?auto_307 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_309 ?auto_307 )
      ( DELIVER-2PKG-VERIFY ?auto_308 ?auto_309 ?auto_307 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_312 - OBJ
      ?auto_313 - OBJ
      ?auto_311 - LOCATION
    )
    :vars
    (
      ?auto_314 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_313 ?auto_312 ) ) ( TRUCK-AT ?auto_314 ?auto_311 ) ( IN-TRUCK ?auto_312 ?auto_314 ) ( OBJ-AT ?auto_313 ?auto_311 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_312 ?auto_311 )
      ( DELIVER-2PKG-VERIFY ?auto_312 ?auto_313 ?auto_311 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_325 - OBJ
      ?auto_326 - OBJ
      ?auto_324 - LOCATION
    )
    :vars
    (
      ?auto_327 - TRUCK
      ?auto_328 - LOCATION
      ?auto_329 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_326 ?auto_325 ) ) ( IN-TRUCK ?auto_326 ?auto_327 ) ( TRUCK-AT ?auto_327 ?auto_328 ) ( IN-CITY ?auto_328 ?auto_329 ) ( IN-CITY ?auto_324 ?auto_329 ) ( not ( = ?auto_324 ?auto_328 ) ) ( OBJ-AT ?auto_325 ?auto_324 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_326 ?auto_324 )
      ( DELIVER-2PKG-VERIFY ?auto_325 ?auto_326 ?auto_324 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_331 - OBJ
      ?auto_332 - OBJ
      ?auto_330 - LOCATION
    )
    :vars
    (
      ?auto_333 - TRUCK
      ?auto_335 - LOCATION
      ?auto_334 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_332 ?auto_331 ) ) ( IN-TRUCK ?auto_331 ?auto_333 ) ( TRUCK-AT ?auto_333 ?auto_335 ) ( IN-CITY ?auto_335 ?auto_334 ) ( IN-CITY ?auto_330 ?auto_334 ) ( not ( = ?auto_330 ?auto_335 ) ) ( OBJ-AT ?auto_332 ?auto_330 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_332 ?auto_331 ?auto_330 )
      ( DELIVER-2PKG-VERIFY ?auto_331 ?auto_332 ?auto_330 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_344 - OBJ
      ?auto_343 - LOCATION
    )
    :vars
    (
      ?auto_345 - OBJ
      ?auto_346 - TRUCK
      ?auto_348 - LOCATION
      ?auto_347 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_344 ?auto_345 ) ) ( TRUCK-AT ?auto_346 ?auto_348 ) ( IN-CITY ?auto_348 ?auto_347 ) ( IN-CITY ?auto_343 ?auto_347 ) ( not ( = ?auto_343 ?auto_348 ) ) ( OBJ-AT ?auto_345 ?auto_343 ) ( OBJ-AT ?auto_344 ?auto_348 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_344 ?auto_346 ?auto_348 )
      ( DELIVER-2PKG ?auto_345 ?auto_344 ?auto_343 )
      ( DELIVER-1PKG-VERIFY ?auto_344 ?auto_343 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_350 - OBJ
      ?auto_351 - OBJ
      ?auto_349 - LOCATION
    )
    :vars
    (
      ?auto_354 - TRUCK
      ?auto_352 - LOCATION
      ?auto_353 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_351 ?auto_350 ) ) ( TRUCK-AT ?auto_354 ?auto_352 ) ( IN-CITY ?auto_352 ?auto_353 ) ( IN-CITY ?auto_349 ?auto_353 ) ( not ( = ?auto_349 ?auto_352 ) ) ( OBJ-AT ?auto_350 ?auto_349 ) ( OBJ-AT ?auto_351 ?auto_352 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_351 ?auto_349 )
      ( DELIVER-2PKG-VERIFY ?auto_350 ?auto_351 ?auto_349 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_356 - OBJ
      ?auto_357 - OBJ
      ?auto_355 - LOCATION
    )
    :vars
    (
      ?auto_358 - TRUCK
      ?auto_359 - LOCATION
      ?auto_360 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_357 ?auto_356 ) ) ( TRUCK-AT ?auto_358 ?auto_359 ) ( IN-CITY ?auto_359 ?auto_360 ) ( IN-CITY ?auto_355 ?auto_360 ) ( not ( = ?auto_355 ?auto_359 ) ) ( OBJ-AT ?auto_357 ?auto_355 ) ( OBJ-AT ?auto_356 ?auto_359 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_357 ?auto_356 ?auto_355 )
      ( DELIVER-2PKG-VERIFY ?auto_356 ?auto_357 ?auto_355 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_369 - OBJ
      ?auto_368 - LOCATION
    )
    :vars
    (
      ?auto_370 - OBJ
      ?auto_372 - LOCATION
      ?auto_373 - CITY
      ?auto_371 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_369 ?auto_370 ) ) ( IN-CITY ?auto_372 ?auto_373 ) ( IN-CITY ?auto_368 ?auto_373 ) ( not ( = ?auto_368 ?auto_372 ) ) ( OBJ-AT ?auto_370 ?auto_368 ) ( OBJ-AT ?auto_369 ?auto_372 ) ( TRUCK-AT ?auto_371 ?auto_368 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_371 ?auto_368 ?auto_372 ?auto_373 )
      ( DELIVER-2PKG ?auto_370 ?auto_369 ?auto_368 )
      ( DELIVER-1PKG-VERIFY ?auto_369 ?auto_368 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_375 - OBJ
      ?auto_376 - OBJ
      ?auto_374 - LOCATION
    )
    :vars
    (
      ?auto_378 - LOCATION
      ?auto_379 - CITY
      ?auto_377 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_376 ?auto_375 ) ) ( IN-CITY ?auto_378 ?auto_379 ) ( IN-CITY ?auto_374 ?auto_379 ) ( not ( = ?auto_374 ?auto_378 ) ) ( OBJ-AT ?auto_375 ?auto_374 ) ( OBJ-AT ?auto_376 ?auto_378 ) ( TRUCK-AT ?auto_377 ?auto_374 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_376 ?auto_374 )
      ( DELIVER-2PKG-VERIFY ?auto_375 ?auto_376 ?auto_374 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_381 - OBJ
      ?auto_382 - OBJ
      ?auto_380 - LOCATION
    )
    :vars
    (
      ?auto_385 - LOCATION
      ?auto_383 - CITY
      ?auto_384 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_382 ?auto_381 ) ) ( IN-CITY ?auto_385 ?auto_383 ) ( IN-CITY ?auto_380 ?auto_383 ) ( not ( = ?auto_380 ?auto_385 ) ) ( OBJ-AT ?auto_382 ?auto_380 ) ( OBJ-AT ?auto_381 ?auto_385 ) ( TRUCK-AT ?auto_384 ?auto_380 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_382 ?auto_381 ?auto_380 )
      ( DELIVER-2PKG-VERIFY ?auto_381 ?auto_382 ?auto_380 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_394 - OBJ
      ?auto_393 - LOCATION
    )
    :vars
    (
      ?auto_398 - OBJ
      ?auto_397 - LOCATION
      ?auto_395 - CITY
      ?auto_396 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_394 ?auto_398 ) ) ( IN-CITY ?auto_397 ?auto_395 ) ( IN-CITY ?auto_393 ?auto_395 ) ( not ( = ?auto_393 ?auto_397 ) ) ( OBJ-AT ?auto_394 ?auto_397 ) ( TRUCK-AT ?auto_396 ?auto_393 ) ( IN-TRUCK ?auto_398 ?auto_396 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_398 ?auto_393 )
      ( DELIVER-2PKG ?auto_398 ?auto_394 ?auto_393 )
      ( DELIVER-1PKG-VERIFY ?auto_394 ?auto_393 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_400 - OBJ
      ?auto_401 - OBJ
      ?auto_399 - LOCATION
    )
    :vars
    (
      ?auto_402 - LOCATION
      ?auto_403 - CITY
      ?auto_404 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_401 ?auto_400 ) ) ( IN-CITY ?auto_402 ?auto_403 ) ( IN-CITY ?auto_399 ?auto_403 ) ( not ( = ?auto_399 ?auto_402 ) ) ( OBJ-AT ?auto_401 ?auto_402 ) ( TRUCK-AT ?auto_404 ?auto_399 ) ( IN-TRUCK ?auto_400 ?auto_404 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_401 ?auto_399 )
      ( DELIVER-2PKG-VERIFY ?auto_400 ?auto_401 ?auto_399 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_406 - OBJ
      ?auto_407 - OBJ
      ?auto_405 - LOCATION
    )
    :vars
    (
      ?auto_408 - LOCATION
      ?auto_409 - CITY
      ?auto_410 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_407 ?auto_406 ) ) ( IN-CITY ?auto_408 ?auto_409 ) ( IN-CITY ?auto_405 ?auto_409 ) ( not ( = ?auto_405 ?auto_408 ) ) ( OBJ-AT ?auto_406 ?auto_408 ) ( TRUCK-AT ?auto_410 ?auto_405 ) ( IN-TRUCK ?auto_407 ?auto_410 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_407 ?auto_406 ?auto_405 )
      ( DELIVER-2PKG-VERIFY ?auto_406 ?auto_407 ?auto_405 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_419 - OBJ
      ?auto_418 - LOCATION
    )
    :vars
    (
      ?auto_422 - OBJ
      ?auto_420 - LOCATION
      ?auto_421 - CITY
      ?auto_423 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_419 ?auto_422 ) ) ( IN-CITY ?auto_420 ?auto_421 ) ( IN-CITY ?auto_418 ?auto_421 ) ( not ( = ?auto_418 ?auto_420 ) ) ( OBJ-AT ?auto_419 ?auto_420 ) ( IN-TRUCK ?auto_422 ?auto_423 ) ( TRUCK-AT ?auto_423 ?auto_420 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_423 ?auto_420 ?auto_418 ?auto_421 )
      ( DELIVER-2PKG ?auto_422 ?auto_419 ?auto_418 )
      ( DELIVER-1PKG-VERIFY ?auto_419 ?auto_418 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_425 - OBJ
      ?auto_426 - OBJ
      ?auto_424 - LOCATION
    )
    :vars
    (
      ?auto_428 - LOCATION
      ?auto_427 - CITY
      ?auto_429 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_426 ?auto_425 ) ) ( IN-CITY ?auto_428 ?auto_427 ) ( IN-CITY ?auto_424 ?auto_427 ) ( not ( = ?auto_424 ?auto_428 ) ) ( OBJ-AT ?auto_426 ?auto_428 ) ( IN-TRUCK ?auto_425 ?auto_429 ) ( TRUCK-AT ?auto_429 ?auto_428 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_426 ?auto_424 )
      ( DELIVER-2PKG-VERIFY ?auto_425 ?auto_426 ?auto_424 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_431 - OBJ
      ?auto_432 - OBJ
      ?auto_430 - LOCATION
    )
    :vars
    (
      ?auto_433 - LOCATION
      ?auto_434 - CITY
      ?auto_435 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_432 ?auto_431 ) ) ( IN-CITY ?auto_433 ?auto_434 ) ( IN-CITY ?auto_430 ?auto_434 ) ( not ( = ?auto_430 ?auto_433 ) ) ( OBJ-AT ?auto_431 ?auto_433 ) ( IN-TRUCK ?auto_432 ?auto_435 ) ( TRUCK-AT ?auto_435 ?auto_433 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_432 ?auto_431 ?auto_430 )
      ( DELIVER-2PKG-VERIFY ?auto_431 ?auto_432 ?auto_430 ) )
  )

)

