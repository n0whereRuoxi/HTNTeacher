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
    ( GREATER-THAN ?p - OBJ ?q - OBJ )
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
      ?auto_241 - OBJ
      ?auto_240 - LOCATION
    )
    :vars
    (
      ?auto_242 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_242 ?auto_240 ) ( IN-TRUCK ?auto_241 ?auto_242 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_241 ?auto_242 ?auto_240 )
      ( DELIVER-1PKG-VERIFY ?auto_241 ?auto_240 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_248 - OBJ
      ?auto_247 - LOCATION
    )
    :vars
    (
      ?auto_249 - TRUCK
      ?auto_250 - LOCATION
      ?auto_251 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_248 ?auto_249 ) ( TRUCK-AT ?auto_249 ?auto_250 ) ( IN-CITY ?auto_250 ?auto_251 ) ( IN-CITY ?auto_247 ?auto_251 ) ( not ( = ?auto_247 ?auto_250 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_249 ?auto_250 ?auto_247 ?auto_251 )
      ( DELIVER-1PKG ?auto_248 ?auto_247 )
      ( DELIVER-1PKG-VERIFY ?auto_248 ?auto_247 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_259 - OBJ
      ?auto_258 - LOCATION
    )
    :vars
    (
      ?auto_261 - TRUCK
      ?auto_262 - LOCATION
      ?auto_260 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_261 ?auto_262 ) ( IN-CITY ?auto_262 ?auto_260 ) ( IN-CITY ?auto_258 ?auto_260 ) ( not ( = ?auto_258 ?auto_262 ) ) ( OBJ-AT ?auto_259 ?auto_262 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_259 ?auto_261 ?auto_262 )
      ( DELIVER-1PKG ?auto_259 ?auto_258 )
      ( DELIVER-1PKG-VERIFY ?auto_259 ?auto_258 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_270 - OBJ
      ?auto_269 - LOCATION
    )
    :vars
    (
      ?auto_271 - LOCATION
      ?auto_272 - CITY
      ?auto_273 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_271 ?auto_272 ) ( IN-CITY ?auto_269 ?auto_272 ) ( not ( = ?auto_269 ?auto_271 ) ) ( OBJ-AT ?auto_270 ?auto_271 ) ( TRUCK-AT ?auto_273 ?auto_269 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_273 ?auto_269 ?auto_271 ?auto_272 )
      ( DELIVER-1PKG ?auto_270 ?auto_269 )
      ( DELIVER-1PKG-VERIFY ?auto_270 ?auto_269 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_295 - OBJ
      ?auto_296 - OBJ
      ?auto_294 - LOCATION
    )
    :vars
    (
      ?auto_297 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_297 ?auto_294 ) ( IN-TRUCK ?auto_296 ?auto_297 ) ( OBJ-AT ?auto_295 ?auto_294 ) ( not ( = ?auto_295 ?auto_296 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_296 ?auto_294 )
      ( DELIVER-2PKG-VERIFY ?auto_295 ?auto_296 ?auto_294 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_299 - OBJ
      ?auto_300 - OBJ
      ?auto_298 - LOCATION
    )
    :vars
    (
      ?auto_301 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_301 ?auto_298 ) ( IN-TRUCK ?auto_299 ?auto_301 ) ( OBJ-AT ?auto_300 ?auto_298 ) ( not ( = ?auto_299 ?auto_300 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_299 ?auto_298 )
      ( DELIVER-2PKG-VERIFY ?auto_299 ?auto_300 ?auto_298 ) )
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
      ?auto_315 - TRUCK
      ?auto_316 - LOCATION
      ?auto_314 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_313 ?auto_315 ) ( TRUCK-AT ?auto_315 ?auto_316 ) ( IN-CITY ?auto_316 ?auto_314 ) ( IN-CITY ?auto_311 ?auto_314 ) ( not ( = ?auto_311 ?auto_316 ) ) ( OBJ-AT ?auto_312 ?auto_311 ) ( not ( = ?auto_312 ?auto_313 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_313 ?auto_311 )
      ( DELIVER-2PKG-VERIFY ?auto_312 ?auto_313 ?auto_311 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_318 - OBJ
      ?auto_319 - OBJ
      ?auto_317 - LOCATION
    )
    :vars
    (
      ?auto_320 - TRUCK
      ?auto_322 - LOCATION
      ?auto_321 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_318 ?auto_320 ) ( TRUCK-AT ?auto_320 ?auto_322 ) ( IN-CITY ?auto_322 ?auto_321 ) ( IN-CITY ?auto_317 ?auto_321 ) ( not ( = ?auto_317 ?auto_322 ) ) ( OBJ-AT ?auto_319 ?auto_317 ) ( not ( = ?auto_319 ?auto_318 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_319 ?auto_318 ?auto_317 )
      ( DELIVER-2PKG-VERIFY ?auto_318 ?auto_319 ?auto_317 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_331 - OBJ
      ?auto_330 - LOCATION
    )
    :vars
    (
      ?auto_332 - TRUCK
      ?auto_335 - LOCATION
      ?auto_334 - CITY
      ?auto_333 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_332 ?auto_335 ) ( IN-CITY ?auto_335 ?auto_334 ) ( IN-CITY ?auto_330 ?auto_334 ) ( not ( = ?auto_330 ?auto_335 ) ) ( OBJ-AT ?auto_333 ?auto_330 ) ( not ( = ?auto_333 ?auto_331 ) ) ( OBJ-AT ?auto_331 ?auto_335 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_331 ?auto_332 ?auto_335 )
      ( DELIVER-2PKG ?auto_333 ?auto_331 ?auto_330 )
      ( DELIVER-1PKG-VERIFY ?auto_331 ?auto_330 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_337 - OBJ
      ?auto_338 - OBJ
      ?auto_336 - LOCATION
    )
    :vars
    (
      ?auto_341 - TRUCK
      ?auto_339 - LOCATION
      ?auto_340 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_341 ?auto_339 ) ( IN-CITY ?auto_339 ?auto_340 ) ( IN-CITY ?auto_336 ?auto_340 ) ( not ( = ?auto_336 ?auto_339 ) ) ( OBJ-AT ?auto_337 ?auto_336 ) ( not ( = ?auto_337 ?auto_338 ) ) ( OBJ-AT ?auto_338 ?auto_339 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_338 ?auto_336 )
      ( DELIVER-2PKG-VERIFY ?auto_337 ?auto_338 ?auto_336 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_343 - OBJ
      ?auto_344 - OBJ
      ?auto_342 - LOCATION
    )
    :vars
    (
      ?auto_347 - TRUCK
      ?auto_345 - LOCATION
      ?auto_346 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_347 ?auto_345 ) ( IN-CITY ?auto_345 ?auto_346 ) ( IN-CITY ?auto_342 ?auto_346 ) ( not ( = ?auto_342 ?auto_345 ) ) ( OBJ-AT ?auto_344 ?auto_342 ) ( not ( = ?auto_344 ?auto_343 ) ) ( OBJ-AT ?auto_343 ?auto_345 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_344 ?auto_343 ?auto_342 )
      ( DELIVER-2PKG-VERIFY ?auto_343 ?auto_344 ?auto_342 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_356 - OBJ
      ?auto_355 - LOCATION
    )
    :vars
    (
      ?auto_357 - LOCATION
      ?auto_358 - CITY
      ?auto_359 - OBJ
      ?auto_360 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_357 ?auto_358 ) ( IN-CITY ?auto_355 ?auto_358 ) ( not ( = ?auto_355 ?auto_357 ) ) ( OBJ-AT ?auto_359 ?auto_355 ) ( not ( = ?auto_359 ?auto_356 ) ) ( OBJ-AT ?auto_356 ?auto_357 ) ( TRUCK-AT ?auto_360 ?auto_355 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_360 ?auto_355 ?auto_357 ?auto_358 )
      ( DELIVER-2PKG ?auto_359 ?auto_356 ?auto_355 )
      ( DELIVER-1PKG-VERIFY ?auto_356 ?auto_355 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_362 - OBJ
      ?auto_363 - OBJ
      ?auto_361 - LOCATION
    )
    :vars
    (
      ?auto_365 - LOCATION
      ?auto_366 - CITY
      ?auto_364 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_365 ?auto_366 ) ( IN-CITY ?auto_361 ?auto_366 ) ( not ( = ?auto_361 ?auto_365 ) ) ( OBJ-AT ?auto_362 ?auto_361 ) ( not ( = ?auto_362 ?auto_363 ) ) ( OBJ-AT ?auto_363 ?auto_365 ) ( TRUCK-AT ?auto_364 ?auto_361 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_363 ?auto_361 )
      ( DELIVER-2PKG-VERIFY ?auto_362 ?auto_363 ?auto_361 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_368 - OBJ
      ?auto_369 - OBJ
      ?auto_367 - LOCATION
    )
    :vars
    (
      ?auto_370 - LOCATION
      ?auto_371 - CITY
      ?auto_372 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_370 ?auto_371 ) ( IN-CITY ?auto_367 ?auto_371 ) ( not ( = ?auto_367 ?auto_370 ) ) ( OBJ-AT ?auto_369 ?auto_367 ) ( not ( = ?auto_369 ?auto_368 ) ) ( OBJ-AT ?auto_368 ?auto_370 ) ( TRUCK-AT ?auto_372 ?auto_367 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_369 ?auto_368 ?auto_367 )
      ( DELIVER-2PKG-VERIFY ?auto_368 ?auto_369 ?auto_367 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_381 - OBJ
      ?auto_380 - LOCATION
    )
    :vars
    (
      ?auto_382 - LOCATION
      ?auto_383 - CITY
      ?auto_385 - OBJ
      ?auto_384 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_382 ?auto_383 ) ( IN-CITY ?auto_380 ?auto_383 ) ( not ( = ?auto_380 ?auto_382 ) ) ( not ( = ?auto_385 ?auto_381 ) ) ( OBJ-AT ?auto_381 ?auto_382 ) ( TRUCK-AT ?auto_384 ?auto_380 ) ( IN-TRUCK ?auto_385 ?auto_384 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_385 ?auto_380 )
      ( DELIVER-2PKG ?auto_385 ?auto_381 ?auto_380 )
      ( DELIVER-1PKG-VERIFY ?auto_381 ?auto_380 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_387 - OBJ
      ?auto_388 - OBJ
      ?auto_386 - LOCATION
    )
    :vars
    (
      ?auto_391 - LOCATION
      ?auto_390 - CITY
      ?auto_389 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_391 ?auto_390 ) ( IN-CITY ?auto_386 ?auto_390 ) ( not ( = ?auto_386 ?auto_391 ) ) ( not ( = ?auto_387 ?auto_388 ) ) ( OBJ-AT ?auto_388 ?auto_391 ) ( TRUCK-AT ?auto_389 ?auto_386 ) ( IN-TRUCK ?auto_387 ?auto_389 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_388 ?auto_386 )
      ( DELIVER-2PKG-VERIFY ?auto_387 ?auto_388 ?auto_386 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_393 - OBJ
      ?auto_394 - OBJ
      ?auto_392 - LOCATION
    )
    :vars
    (
      ?auto_395 - LOCATION
      ?auto_397 - CITY
      ?auto_396 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_395 ?auto_397 ) ( IN-CITY ?auto_392 ?auto_397 ) ( not ( = ?auto_392 ?auto_395 ) ) ( not ( = ?auto_394 ?auto_393 ) ) ( OBJ-AT ?auto_393 ?auto_395 ) ( TRUCK-AT ?auto_396 ?auto_392 ) ( IN-TRUCK ?auto_394 ?auto_396 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_394 ?auto_393 ?auto_392 )
      ( DELIVER-2PKG-VERIFY ?auto_393 ?auto_394 ?auto_392 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_406 - OBJ
      ?auto_405 - LOCATION
    )
    :vars
    (
      ?auto_407 - LOCATION
      ?auto_409 - CITY
      ?auto_410 - OBJ
      ?auto_408 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_407 ?auto_409 ) ( IN-CITY ?auto_405 ?auto_409 ) ( not ( = ?auto_405 ?auto_407 ) ) ( not ( = ?auto_410 ?auto_406 ) ) ( OBJ-AT ?auto_406 ?auto_407 ) ( IN-TRUCK ?auto_410 ?auto_408 ) ( TRUCK-AT ?auto_408 ?auto_407 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_408 ?auto_407 ?auto_405 ?auto_409 )
      ( DELIVER-2PKG ?auto_410 ?auto_406 ?auto_405 )
      ( DELIVER-1PKG-VERIFY ?auto_406 ?auto_405 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_412 - OBJ
      ?auto_413 - OBJ
      ?auto_411 - LOCATION
    )
    :vars
    (
      ?auto_416 - LOCATION
      ?auto_415 - CITY
      ?auto_414 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_416 ?auto_415 ) ( IN-CITY ?auto_411 ?auto_415 ) ( not ( = ?auto_411 ?auto_416 ) ) ( not ( = ?auto_412 ?auto_413 ) ) ( OBJ-AT ?auto_413 ?auto_416 ) ( IN-TRUCK ?auto_412 ?auto_414 ) ( TRUCK-AT ?auto_414 ?auto_416 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_413 ?auto_411 )
      ( DELIVER-2PKG-VERIFY ?auto_412 ?auto_413 ?auto_411 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_418 - OBJ
      ?auto_419 - OBJ
      ?auto_417 - LOCATION
    )
    :vars
    (
      ?auto_422 - LOCATION
      ?auto_420 - CITY
      ?auto_421 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_422 ?auto_420 ) ( IN-CITY ?auto_417 ?auto_420 ) ( not ( = ?auto_417 ?auto_422 ) ) ( not ( = ?auto_419 ?auto_418 ) ) ( OBJ-AT ?auto_418 ?auto_422 ) ( IN-TRUCK ?auto_419 ?auto_421 ) ( TRUCK-AT ?auto_421 ?auto_422 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_419 ?auto_418 ?auto_417 )
      ( DELIVER-2PKG-VERIFY ?auto_418 ?auto_419 ?auto_417 ) )
  )

)

