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

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_222 - OBJ
      ?auto_221 - LOCATION
    )
    :vars
    (
      ?auto_224 - LOCATION
      ?auto_225 - CITY
      ?auto_223 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_224 ?auto_225 ) ( IN-CITY ?auto_221 ?auto_225 ) ( not ( = ?auto_221 ?auto_224 ) ) ( OBJ-AT ?auto_222 ?auto_224 ) ( TRUCK-AT ?auto_223 ?auto_221 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_223 ?auto_221 ?auto_224 ?auto_225 )
      ( !LOAD-TRUCK ?auto_222 ?auto_223 ?auto_224 )
      ( !DRIVE-TRUCK ?auto_223 ?auto_224 ?auto_221 ?auto_225 )
      ( !UNLOAD-TRUCK ?auto_222 ?auto_223 ?auto_221 )
      ( DELIVER-1PKG-VERIFY ?auto_222 ?auto_221 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_229 - OBJ
      ?auto_228 - LOCATION
    )
    :vars
    (
      ?auto_231 - LOCATION
      ?auto_232 - CITY
      ?auto_230 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_231 ?auto_232 ) ( IN-CITY ?auto_228 ?auto_232 ) ( not ( = ?auto_228 ?auto_231 ) ) ( OBJ-AT ?auto_229 ?auto_231 ) ( TRUCK-AT ?auto_230 ?auto_228 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_230 ?auto_228 ?auto_231 ?auto_232 )
      ( !LOAD-TRUCK ?auto_229 ?auto_230 ?auto_231 )
      ( !DRIVE-TRUCK ?auto_230 ?auto_231 ?auto_228 ?auto_232 )
      ( !UNLOAD-TRUCK ?auto_229 ?auto_230 ?auto_228 )
      ( DELIVER-1PKG-VERIFY ?auto_229 ?auto_228 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_243 - OBJ
      ?auto_244 - OBJ
      ?auto_242 - LOCATION
    )
    :vars
    (
      ?auto_245 - LOCATION
      ?auto_246 - CITY
      ?auto_248 - LOCATION
      ?auto_247 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_245 ?auto_246 ) ( IN-CITY ?auto_242 ?auto_246 ) ( not ( = ?auto_242 ?auto_245 ) ) ( OBJ-AT ?auto_244 ?auto_245 ) ( IN-CITY ?auto_248 ?auto_246 ) ( not ( = ?auto_242 ?auto_248 ) ) ( OBJ-AT ?auto_243 ?auto_248 ) ( TRUCK-AT ?auto_247 ?auto_242 ) ( not ( = ?auto_243 ?auto_244 ) ) ( not ( = ?auto_245 ?auto_248 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_243 ?auto_242 )
      ( DELIVER-1PKG ?auto_244 ?auto_242 )
      ( DELIVER-2PKG-VERIFY ?auto_243 ?auto_244 ?auto_242 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_250 - OBJ
      ?auto_251 - OBJ
      ?auto_249 - LOCATION
    )
    :vars
    (
      ?auto_253 - LOCATION
      ?auto_254 - CITY
      ?auto_255 - LOCATION
      ?auto_252 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_253 ?auto_254 ) ( IN-CITY ?auto_249 ?auto_254 ) ( not ( = ?auto_249 ?auto_253 ) ) ( OBJ-AT ?auto_250 ?auto_253 ) ( IN-CITY ?auto_255 ?auto_254 ) ( not ( = ?auto_249 ?auto_255 ) ) ( OBJ-AT ?auto_251 ?auto_255 ) ( TRUCK-AT ?auto_252 ?auto_249 ) ( not ( = ?auto_251 ?auto_250 ) ) ( not ( = ?auto_253 ?auto_255 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_251 ?auto_250 ?auto_249 )
      ( DELIVER-2PKG-VERIFY ?auto_250 ?auto_251 ?auto_249 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_267 - OBJ
      ?auto_266 - LOCATION
    )
    :vars
    (
      ?auto_269 - LOCATION
      ?auto_270 - CITY
      ?auto_268 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_269 ?auto_270 ) ( IN-CITY ?auto_266 ?auto_270 ) ( not ( = ?auto_266 ?auto_269 ) ) ( OBJ-AT ?auto_267 ?auto_269 ) ( TRUCK-AT ?auto_268 ?auto_266 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_268 ?auto_266 ?auto_269 ?auto_270 )
      ( !LOAD-TRUCK ?auto_267 ?auto_268 ?auto_269 )
      ( !DRIVE-TRUCK ?auto_268 ?auto_269 ?auto_266 ?auto_270 )
      ( !UNLOAD-TRUCK ?auto_267 ?auto_268 ?auto_266 )
      ( DELIVER-1PKG-VERIFY ?auto_267 ?auto_266 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_358 - OBJ
      ?auto_359 - OBJ
      ?auto_360 - OBJ
      ?auto_357 - LOCATION
    )
    :vars
    (
      ?auto_363 - LOCATION
      ?auto_361 - CITY
      ?auto_365 - LOCATION
      ?auto_364 - LOCATION
      ?auto_362 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_363 ?auto_361 ) ( IN-CITY ?auto_357 ?auto_361 ) ( not ( = ?auto_357 ?auto_363 ) ) ( OBJ-AT ?auto_360 ?auto_363 ) ( IN-CITY ?auto_365 ?auto_361 ) ( not ( = ?auto_357 ?auto_365 ) ) ( OBJ-AT ?auto_359 ?auto_365 ) ( IN-CITY ?auto_364 ?auto_361 ) ( not ( = ?auto_357 ?auto_364 ) ) ( OBJ-AT ?auto_358 ?auto_364 ) ( TRUCK-AT ?auto_362 ?auto_357 ) ( not ( = ?auto_358 ?auto_359 ) ) ( not ( = ?auto_365 ?auto_364 ) ) ( not ( = ?auto_358 ?auto_360 ) ) ( not ( = ?auto_359 ?auto_360 ) ) ( not ( = ?auto_363 ?auto_365 ) ) ( not ( = ?auto_363 ?auto_364 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_359 ?auto_358 ?auto_357 )
      ( DELIVER-1PKG ?auto_360 ?auto_357 )
      ( DELIVER-3PKG-VERIFY ?auto_358 ?auto_359 ?auto_360 ?auto_357 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_377 - OBJ
      ?auto_378 - OBJ
      ?auto_379 - OBJ
      ?auto_376 - LOCATION
    )
    :vars
    (
      ?auto_380 - LOCATION
      ?auto_383 - CITY
      ?auto_381 - LOCATION
      ?auto_382 - LOCATION
      ?auto_384 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_380 ?auto_383 ) ( IN-CITY ?auto_376 ?auto_383 ) ( not ( = ?auto_376 ?auto_380 ) ) ( OBJ-AT ?auto_378 ?auto_380 ) ( IN-CITY ?auto_381 ?auto_383 ) ( not ( = ?auto_376 ?auto_381 ) ) ( OBJ-AT ?auto_379 ?auto_381 ) ( IN-CITY ?auto_382 ?auto_383 ) ( not ( = ?auto_376 ?auto_382 ) ) ( OBJ-AT ?auto_377 ?auto_382 ) ( TRUCK-AT ?auto_384 ?auto_376 ) ( not ( = ?auto_377 ?auto_379 ) ) ( not ( = ?auto_381 ?auto_382 ) ) ( not ( = ?auto_377 ?auto_378 ) ) ( not ( = ?auto_379 ?auto_378 ) ) ( not ( = ?auto_380 ?auto_381 ) ) ( not ( = ?auto_380 ?auto_382 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_377 ?auto_379 ?auto_378 ?auto_376 )
      ( DELIVER-3PKG-VERIFY ?auto_377 ?auto_378 ?auto_379 ?auto_376 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_396 - OBJ
      ?auto_397 - OBJ
      ?auto_398 - OBJ
      ?auto_395 - LOCATION
    )
    :vars
    (
      ?auto_402 - LOCATION
      ?auto_400 - CITY
      ?auto_403 - LOCATION
      ?auto_401 - LOCATION
      ?auto_399 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_402 ?auto_400 ) ( IN-CITY ?auto_395 ?auto_400 ) ( not ( = ?auto_395 ?auto_402 ) ) ( OBJ-AT ?auto_398 ?auto_402 ) ( IN-CITY ?auto_403 ?auto_400 ) ( not ( = ?auto_395 ?auto_403 ) ) ( OBJ-AT ?auto_396 ?auto_403 ) ( IN-CITY ?auto_401 ?auto_400 ) ( not ( = ?auto_395 ?auto_401 ) ) ( OBJ-AT ?auto_397 ?auto_401 ) ( TRUCK-AT ?auto_399 ?auto_395 ) ( not ( = ?auto_397 ?auto_396 ) ) ( not ( = ?auto_403 ?auto_401 ) ) ( not ( = ?auto_397 ?auto_398 ) ) ( not ( = ?auto_396 ?auto_398 ) ) ( not ( = ?auto_402 ?auto_403 ) ) ( not ( = ?auto_402 ?auto_401 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_397 ?auto_398 ?auto_396 ?auto_395 )
      ( DELIVER-3PKG-VERIFY ?auto_396 ?auto_397 ?auto_398 ?auto_395 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_415 - OBJ
      ?auto_416 - OBJ
      ?auto_417 - OBJ
      ?auto_414 - LOCATION
    )
    :vars
    (
      ?auto_421 - LOCATION
      ?auto_419 - CITY
      ?auto_422 - LOCATION
      ?auto_420 - LOCATION
      ?auto_418 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_421 ?auto_419 ) ( IN-CITY ?auto_414 ?auto_419 ) ( not ( = ?auto_414 ?auto_421 ) ) ( OBJ-AT ?auto_416 ?auto_421 ) ( IN-CITY ?auto_422 ?auto_419 ) ( not ( = ?auto_414 ?auto_422 ) ) ( OBJ-AT ?auto_415 ?auto_422 ) ( IN-CITY ?auto_420 ?auto_419 ) ( not ( = ?auto_414 ?auto_420 ) ) ( OBJ-AT ?auto_417 ?auto_420 ) ( TRUCK-AT ?auto_418 ?auto_414 ) ( not ( = ?auto_417 ?auto_415 ) ) ( not ( = ?auto_422 ?auto_420 ) ) ( not ( = ?auto_417 ?auto_416 ) ) ( not ( = ?auto_415 ?auto_416 ) ) ( not ( = ?auto_421 ?auto_422 ) ) ( not ( = ?auto_421 ?auto_420 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_417 ?auto_416 ?auto_415 ?auto_414 )
      ( DELIVER-3PKG-VERIFY ?auto_415 ?auto_416 ?auto_417 ?auto_414 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_454 - OBJ
      ?auto_455 - OBJ
      ?auto_456 - OBJ
      ?auto_453 - LOCATION
    )
    :vars
    (
      ?auto_460 - LOCATION
      ?auto_458 - CITY
      ?auto_461 - LOCATION
      ?auto_459 - LOCATION
      ?auto_457 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_460 ?auto_458 ) ( IN-CITY ?auto_453 ?auto_458 ) ( not ( = ?auto_453 ?auto_460 ) ) ( OBJ-AT ?auto_454 ?auto_460 ) ( IN-CITY ?auto_461 ?auto_458 ) ( not ( = ?auto_453 ?auto_461 ) ) ( OBJ-AT ?auto_456 ?auto_461 ) ( IN-CITY ?auto_459 ?auto_458 ) ( not ( = ?auto_453 ?auto_459 ) ) ( OBJ-AT ?auto_455 ?auto_459 ) ( TRUCK-AT ?auto_457 ?auto_453 ) ( not ( = ?auto_455 ?auto_456 ) ) ( not ( = ?auto_461 ?auto_459 ) ) ( not ( = ?auto_455 ?auto_454 ) ) ( not ( = ?auto_456 ?auto_454 ) ) ( not ( = ?auto_460 ?auto_461 ) ) ( not ( = ?auto_460 ?auto_459 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_455 ?auto_454 ?auto_456 ?auto_453 )
      ( DELIVER-3PKG-VERIFY ?auto_454 ?auto_455 ?auto_456 ?auto_453 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_473 - OBJ
      ?auto_474 - OBJ
      ?auto_475 - OBJ
      ?auto_472 - LOCATION
    )
    :vars
    (
      ?auto_479 - LOCATION
      ?auto_477 - CITY
      ?auto_480 - LOCATION
      ?auto_478 - LOCATION
      ?auto_476 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_479 ?auto_477 ) ( IN-CITY ?auto_472 ?auto_477 ) ( not ( = ?auto_472 ?auto_479 ) ) ( OBJ-AT ?auto_473 ?auto_479 ) ( IN-CITY ?auto_480 ?auto_477 ) ( not ( = ?auto_472 ?auto_480 ) ) ( OBJ-AT ?auto_474 ?auto_480 ) ( IN-CITY ?auto_478 ?auto_477 ) ( not ( = ?auto_472 ?auto_478 ) ) ( OBJ-AT ?auto_475 ?auto_478 ) ( TRUCK-AT ?auto_476 ?auto_472 ) ( not ( = ?auto_475 ?auto_474 ) ) ( not ( = ?auto_480 ?auto_478 ) ) ( not ( = ?auto_475 ?auto_473 ) ) ( not ( = ?auto_474 ?auto_473 ) ) ( not ( = ?auto_479 ?auto_480 ) ) ( not ( = ?auto_479 ?auto_478 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_475 ?auto_473 ?auto_474 ?auto_472 )
      ( DELIVER-3PKG-VERIFY ?auto_473 ?auto_474 ?auto_475 ?auto_472 ) )
  )

)

