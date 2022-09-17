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
      ?auto_263 - OBJ
      ?auto_262 - LOCATION
    )
    :vars
    (
      ?auto_264 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_264 ?auto_262 ) ( IN-TRUCK ?auto_263 ?auto_264 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_263 ?auto_264 ?auto_262 )
      ( DELIVER-1PKG-VERIFY ?auto_263 ?auto_262 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_270 - OBJ
      ?auto_269 - LOCATION
    )
    :vars
    (
      ?auto_271 - TRUCK
      ?auto_272 - LOCATION
      ?auto_273 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_270 ?auto_271 ) ( TRUCK-AT ?auto_271 ?auto_272 ) ( IN-CITY ?auto_272 ?auto_273 ) ( IN-CITY ?auto_269 ?auto_273 ) ( not ( = ?auto_269 ?auto_272 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_271 ?auto_272 ?auto_269 ?auto_273 )
      ( DELIVER-1PKG ?auto_270 ?auto_269 )
      ( DELIVER-1PKG-VERIFY ?auto_270 ?auto_269 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_281 - OBJ
      ?auto_280 - LOCATION
    )
    :vars
    (
      ?auto_284 - TRUCK
      ?auto_282 - LOCATION
      ?auto_283 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_284 ?auto_282 ) ( IN-CITY ?auto_282 ?auto_283 ) ( IN-CITY ?auto_280 ?auto_283 ) ( not ( = ?auto_280 ?auto_282 ) ) ( OBJ-AT ?auto_281 ?auto_282 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_281 ?auto_284 ?auto_282 )
      ( DELIVER-1PKG ?auto_281 ?auto_280 )
      ( DELIVER-1PKG-VERIFY ?auto_281 ?auto_280 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_292 - OBJ
      ?auto_291 - LOCATION
    )
    :vars
    (
      ?auto_294 - LOCATION
      ?auto_293 - CITY
      ?auto_295 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_294 ?auto_293 ) ( IN-CITY ?auto_291 ?auto_293 ) ( not ( = ?auto_291 ?auto_294 ) ) ( OBJ-AT ?auto_292 ?auto_294 ) ( TRUCK-AT ?auto_295 ?auto_291 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_295 ?auto_291 ?auto_294 ?auto_293 )
      ( DELIVER-1PKG ?auto_292 ?auto_291 )
      ( DELIVER-1PKG-VERIFY ?auto_292 ?auto_291 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_314 - OBJ
      ?auto_313 - LOCATION
    )
    :vars
    (
      ?auto_315 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_315 ?auto_313 ) ( IN-TRUCK ?auto_314 ?auto_315 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_314 ?auto_315 ?auto_313 )
      ( DELIVER-1PKG-VERIFY ?auto_314 ?auto_313 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_317 - OBJ
      ?auto_318 - OBJ
      ?auto_316 - LOCATION
    )
    :vars
    (
      ?auto_319 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_319 ?auto_316 ) ( IN-TRUCK ?auto_318 ?auto_319 ) ( OBJ-AT ?auto_317 ?auto_316 ) ( not ( = ?auto_317 ?auto_318 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_318 ?auto_316 )
      ( DELIVER-2PKG-VERIFY ?auto_317 ?auto_318 ?auto_316 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_321 - OBJ
      ?auto_322 - OBJ
      ?auto_320 - LOCATION
    )
    :vars
    (
      ?auto_323 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_323 ?auto_320 ) ( IN-TRUCK ?auto_321 ?auto_323 ) ( OBJ-AT ?auto_322 ?auto_320 ) ( not ( = ?auto_321 ?auto_322 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_321 ?auto_320 )
      ( DELIVER-2PKG-VERIFY ?auto_321 ?auto_322 ?auto_320 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_329 - OBJ
      ?auto_328 - LOCATION
    )
    :vars
    (
      ?auto_330 - TRUCK
      ?auto_331 - LOCATION
      ?auto_332 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_329 ?auto_330 ) ( TRUCK-AT ?auto_330 ?auto_331 ) ( IN-CITY ?auto_331 ?auto_332 ) ( IN-CITY ?auto_328 ?auto_332 ) ( not ( = ?auto_328 ?auto_331 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_330 ?auto_331 ?auto_328 ?auto_332 )
      ( DELIVER-1PKG ?auto_329 ?auto_328 )
      ( DELIVER-1PKG-VERIFY ?auto_329 ?auto_328 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_334 - OBJ
      ?auto_335 - OBJ
      ?auto_333 - LOCATION
    )
    :vars
    (
      ?auto_337 - TRUCK
      ?auto_338 - LOCATION
      ?auto_336 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_335 ?auto_337 ) ( TRUCK-AT ?auto_337 ?auto_338 ) ( IN-CITY ?auto_338 ?auto_336 ) ( IN-CITY ?auto_333 ?auto_336 ) ( not ( = ?auto_333 ?auto_338 ) ) ( OBJ-AT ?auto_334 ?auto_333 ) ( not ( = ?auto_334 ?auto_335 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_335 ?auto_333 )
      ( DELIVER-2PKG-VERIFY ?auto_334 ?auto_335 ?auto_333 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_340 - OBJ
      ?auto_341 - OBJ
      ?auto_339 - LOCATION
    )
    :vars
    (
      ?auto_342 - TRUCK
      ?auto_344 - LOCATION
      ?auto_343 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_340 ?auto_342 ) ( TRUCK-AT ?auto_342 ?auto_344 ) ( IN-CITY ?auto_344 ?auto_343 ) ( IN-CITY ?auto_339 ?auto_343 ) ( not ( = ?auto_339 ?auto_344 ) ) ( OBJ-AT ?auto_341 ?auto_339 ) ( not ( = ?auto_341 ?auto_340 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_341 ?auto_340 ?auto_339 )
      ( DELIVER-2PKG-VERIFY ?auto_340 ?auto_341 ?auto_339 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_353 - OBJ
      ?auto_352 - LOCATION
    )
    :vars
    (
      ?auto_354 - TRUCK
      ?auto_356 - LOCATION
      ?auto_355 - CITY
      ?auto_357 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_354 ?auto_356 ) ( IN-CITY ?auto_356 ?auto_355 ) ( IN-CITY ?auto_352 ?auto_355 ) ( not ( = ?auto_352 ?auto_356 ) ) ( OBJ-AT ?auto_357 ?auto_352 ) ( not ( = ?auto_357 ?auto_353 ) ) ( OBJ-AT ?auto_353 ?auto_356 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_353 ?auto_354 ?auto_356 )
      ( DELIVER-2PKG ?auto_357 ?auto_353 ?auto_352 )
      ( DELIVER-1PKG-VERIFY ?auto_353 ?auto_352 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_359 - OBJ
      ?auto_360 - OBJ
      ?auto_358 - LOCATION
    )
    :vars
    (
      ?auto_362 - TRUCK
      ?auto_363 - LOCATION
      ?auto_361 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_362 ?auto_363 ) ( IN-CITY ?auto_363 ?auto_361 ) ( IN-CITY ?auto_358 ?auto_361 ) ( not ( = ?auto_358 ?auto_363 ) ) ( OBJ-AT ?auto_359 ?auto_358 ) ( not ( = ?auto_359 ?auto_360 ) ) ( OBJ-AT ?auto_360 ?auto_363 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_360 ?auto_358 )
      ( DELIVER-2PKG-VERIFY ?auto_359 ?auto_360 ?auto_358 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_365 - OBJ
      ?auto_366 - OBJ
      ?auto_364 - LOCATION
    )
    :vars
    (
      ?auto_369 - TRUCK
      ?auto_368 - LOCATION
      ?auto_367 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_369 ?auto_368 ) ( IN-CITY ?auto_368 ?auto_367 ) ( IN-CITY ?auto_364 ?auto_367 ) ( not ( = ?auto_364 ?auto_368 ) ) ( OBJ-AT ?auto_366 ?auto_364 ) ( not ( = ?auto_366 ?auto_365 ) ) ( OBJ-AT ?auto_365 ?auto_368 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_366 ?auto_365 ?auto_364 )
      ( DELIVER-2PKG-VERIFY ?auto_365 ?auto_366 ?auto_364 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_378 - OBJ
      ?auto_377 - LOCATION
    )
    :vars
    (
      ?auto_380 - LOCATION
      ?auto_379 - CITY
      ?auto_382 - OBJ
      ?auto_381 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_380 ?auto_379 ) ( IN-CITY ?auto_377 ?auto_379 ) ( not ( = ?auto_377 ?auto_380 ) ) ( OBJ-AT ?auto_382 ?auto_377 ) ( not ( = ?auto_382 ?auto_378 ) ) ( OBJ-AT ?auto_378 ?auto_380 ) ( TRUCK-AT ?auto_381 ?auto_377 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_381 ?auto_377 ?auto_380 ?auto_379 )
      ( DELIVER-2PKG ?auto_382 ?auto_378 ?auto_377 )
      ( DELIVER-1PKG-VERIFY ?auto_378 ?auto_377 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_384 - OBJ
      ?auto_385 - OBJ
      ?auto_383 - LOCATION
    )
    :vars
    (
      ?auto_386 - LOCATION
      ?auto_387 - CITY
      ?auto_388 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_386 ?auto_387 ) ( IN-CITY ?auto_383 ?auto_387 ) ( not ( = ?auto_383 ?auto_386 ) ) ( OBJ-AT ?auto_384 ?auto_383 ) ( not ( = ?auto_384 ?auto_385 ) ) ( OBJ-AT ?auto_385 ?auto_386 ) ( TRUCK-AT ?auto_388 ?auto_383 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_385 ?auto_383 )
      ( DELIVER-2PKG-VERIFY ?auto_384 ?auto_385 ?auto_383 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_390 - OBJ
      ?auto_391 - OBJ
      ?auto_389 - LOCATION
    )
    :vars
    (
      ?auto_393 - LOCATION
      ?auto_392 - CITY
      ?auto_394 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_393 ?auto_392 ) ( IN-CITY ?auto_389 ?auto_392 ) ( not ( = ?auto_389 ?auto_393 ) ) ( OBJ-AT ?auto_391 ?auto_389 ) ( not ( = ?auto_391 ?auto_390 ) ) ( OBJ-AT ?auto_390 ?auto_393 ) ( TRUCK-AT ?auto_394 ?auto_389 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_391 ?auto_390 ?auto_389 )
      ( DELIVER-2PKG-VERIFY ?auto_390 ?auto_391 ?auto_389 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_403 - OBJ
      ?auto_402 - LOCATION
    )
    :vars
    (
      ?auto_405 - LOCATION
      ?auto_404 - CITY
      ?auto_407 - OBJ
      ?auto_406 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_405 ?auto_404 ) ( IN-CITY ?auto_402 ?auto_404 ) ( not ( = ?auto_402 ?auto_405 ) ) ( not ( = ?auto_407 ?auto_403 ) ) ( OBJ-AT ?auto_403 ?auto_405 ) ( TRUCK-AT ?auto_406 ?auto_402 ) ( IN-TRUCK ?auto_407 ?auto_406 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_407 ?auto_402 )
      ( DELIVER-2PKG ?auto_407 ?auto_403 ?auto_402 )
      ( DELIVER-1PKG-VERIFY ?auto_403 ?auto_402 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_409 - OBJ
      ?auto_410 - OBJ
      ?auto_408 - LOCATION
    )
    :vars
    (
      ?auto_413 - LOCATION
      ?auto_412 - CITY
      ?auto_411 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_413 ?auto_412 ) ( IN-CITY ?auto_408 ?auto_412 ) ( not ( = ?auto_408 ?auto_413 ) ) ( not ( = ?auto_409 ?auto_410 ) ) ( OBJ-AT ?auto_410 ?auto_413 ) ( TRUCK-AT ?auto_411 ?auto_408 ) ( IN-TRUCK ?auto_409 ?auto_411 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_410 ?auto_408 )
      ( DELIVER-2PKG-VERIFY ?auto_409 ?auto_410 ?auto_408 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_415 - OBJ
      ?auto_416 - OBJ
      ?auto_414 - LOCATION
    )
    :vars
    (
      ?auto_417 - LOCATION
      ?auto_419 - CITY
      ?auto_418 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_417 ?auto_419 ) ( IN-CITY ?auto_414 ?auto_419 ) ( not ( = ?auto_414 ?auto_417 ) ) ( not ( = ?auto_416 ?auto_415 ) ) ( OBJ-AT ?auto_415 ?auto_417 ) ( TRUCK-AT ?auto_418 ?auto_414 ) ( IN-TRUCK ?auto_416 ?auto_418 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_416 ?auto_415 ?auto_414 )
      ( DELIVER-2PKG-VERIFY ?auto_415 ?auto_416 ?auto_414 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_428 - OBJ
      ?auto_427 - LOCATION
    )
    :vars
    (
      ?auto_429 - LOCATION
      ?auto_432 - CITY
      ?auto_430 - OBJ
      ?auto_431 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_429 ?auto_432 ) ( IN-CITY ?auto_427 ?auto_432 ) ( not ( = ?auto_427 ?auto_429 ) ) ( not ( = ?auto_430 ?auto_428 ) ) ( OBJ-AT ?auto_428 ?auto_429 ) ( IN-TRUCK ?auto_430 ?auto_431 ) ( TRUCK-AT ?auto_431 ?auto_429 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_431 ?auto_429 ?auto_427 ?auto_432 )
      ( DELIVER-2PKG ?auto_430 ?auto_428 ?auto_427 )
      ( DELIVER-1PKG-VERIFY ?auto_428 ?auto_427 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_434 - OBJ
      ?auto_435 - OBJ
      ?auto_433 - LOCATION
    )
    :vars
    (
      ?auto_438 - LOCATION
      ?auto_437 - CITY
      ?auto_436 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_438 ?auto_437 ) ( IN-CITY ?auto_433 ?auto_437 ) ( not ( = ?auto_433 ?auto_438 ) ) ( not ( = ?auto_434 ?auto_435 ) ) ( OBJ-AT ?auto_435 ?auto_438 ) ( IN-TRUCK ?auto_434 ?auto_436 ) ( TRUCK-AT ?auto_436 ?auto_438 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_435 ?auto_433 )
      ( DELIVER-2PKG-VERIFY ?auto_434 ?auto_435 ?auto_433 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_440 - OBJ
      ?auto_441 - OBJ
      ?auto_439 - LOCATION
    )
    :vars
    (
      ?auto_442 - LOCATION
      ?auto_444 - CITY
      ?auto_443 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_442 ?auto_444 ) ( IN-CITY ?auto_439 ?auto_444 ) ( not ( = ?auto_439 ?auto_442 ) ) ( not ( = ?auto_441 ?auto_440 ) ) ( OBJ-AT ?auto_440 ?auto_442 ) ( IN-TRUCK ?auto_441 ?auto_443 ) ( TRUCK-AT ?auto_443 ?auto_442 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_441 ?auto_440 ?auto_439 )
      ( DELIVER-2PKG-VERIFY ?auto_440 ?auto_441 ?auto_439 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_453 - OBJ
      ?auto_452 - LOCATION
    )
    :vars
    (
      ?auto_454 - LOCATION
      ?auto_456 - CITY
      ?auto_457 - OBJ
      ?auto_455 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_454 ?auto_456 ) ( IN-CITY ?auto_452 ?auto_456 ) ( not ( = ?auto_452 ?auto_454 ) ) ( not ( = ?auto_457 ?auto_453 ) ) ( OBJ-AT ?auto_453 ?auto_454 ) ( TRUCK-AT ?auto_455 ?auto_454 ) ( OBJ-AT ?auto_457 ?auto_454 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_457 ?auto_455 ?auto_454 )
      ( DELIVER-2PKG ?auto_457 ?auto_453 ?auto_452 )
      ( DELIVER-1PKG-VERIFY ?auto_453 ?auto_452 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_459 - OBJ
      ?auto_460 - OBJ
      ?auto_458 - LOCATION
    )
    :vars
    (
      ?auto_461 - LOCATION
      ?auto_463 - CITY
      ?auto_462 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_461 ?auto_463 ) ( IN-CITY ?auto_458 ?auto_463 ) ( not ( = ?auto_458 ?auto_461 ) ) ( not ( = ?auto_459 ?auto_460 ) ) ( OBJ-AT ?auto_460 ?auto_461 ) ( TRUCK-AT ?auto_462 ?auto_461 ) ( OBJ-AT ?auto_459 ?auto_461 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_460 ?auto_458 )
      ( DELIVER-2PKG-VERIFY ?auto_459 ?auto_460 ?auto_458 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_465 - OBJ
      ?auto_466 - OBJ
      ?auto_464 - LOCATION
    )
    :vars
    (
      ?auto_467 - LOCATION
      ?auto_468 - CITY
      ?auto_469 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_467 ?auto_468 ) ( IN-CITY ?auto_464 ?auto_468 ) ( not ( = ?auto_464 ?auto_467 ) ) ( not ( = ?auto_466 ?auto_465 ) ) ( OBJ-AT ?auto_465 ?auto_467 ) ( TRUCK-AT ?auto_469 ?auto_467 ) ( OBJ-AT ?auto_466 ?auto_467 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_466 ?auto_465 ?auto_464 )
      ( DELIVER-2PKG-VERIFY ?auto_465 ?auto_466 ?auto_464 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_478 - OBJ
      ?auto_477 - LOCATION
    )
    :vars
    (
      ?auto_479 - LOCATION
      ?auto_480 - CITY
      ?auto_482 - OBJ
      ?auto_481 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_479 ?auto_480 ) ( IN-CITY ?auto_477 ?auto_480 ) ( not ( = ?auto_477 ?auto_479 ) ) ( not ( = ?auto_482 ?auto_478 ) ) ( OBJ-AT ?auto_478 ?auto_479 ) ( OBJ-AT ?auto_482 ?auto_479 ) ( TRUCK-AT ?auto_481 ?auto_477 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_481 ?auto_477 ?auto_479 ?auto_480 )
      ( DELIVER-2PKG ?auto_482 ?auto_478 ?auto_477 )
      ( DELIVER-1PKG-VERIFY ?auto_478 ?auto_477 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_484 - OBJ
      ?auto_485 - OBJ
      ?auto_483 - LOCATION
    )
    :vars
    (
      ?auto_488 - LOCATION
      ?auto_486 - CITY
      ?auto_487 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_488 ?auto_486 ) ( IN-CITY ?auto_483 ?auto_486 ) ( not ( = ?auto_483 ?auto_488 ) ) ( not ( = ?auto_484 ?auto_485 ) ) ( OBJ-AT ?auto_485 ?auto_488 ) ( OBJ-AT ?auto_484 ?auto_488 ) ( TRUCK-AT ?auto_487 ?auto_483 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_485 ?auto_483 )
      ( DELIVER-2PKG-VERIFY ?auto_484 ?auto_485 ?auto_483 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_490 - OBJ
      ?auto_491 - OBJ
      ?auto_489 - LOCATION
    )
    :vars
    (
      ?auto_494 - LOCATION
      ?auto_493 - CITY
      ?auto_492 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_494 ?auto_493 ) ( IN-CITY ?auto_489 ?auto_493 ) ( not ( = ?auto_489 ?auto_494 ) ) ( not ( = ?auto_491 ?auto_490 ) ) ( OBJ-AT ?auto_490 ?auto_494 ) ( OBJ-AT ?auto_491 ?auto_494 ) ( TRUCK-AT ?auto_492 ?auto_489 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_491 ?auto_490 ?auto_489 )
      ( DELIVER-2PKG-VERIFY ?auto_490 ?auto_491 ?auto_489 ) )
  )

)

