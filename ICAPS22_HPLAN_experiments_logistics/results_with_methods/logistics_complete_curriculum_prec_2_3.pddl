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
      ?auto_368 - OBJ
      ?auto_369 - LOCATION
    )
    :vars
    (
      ?auto_370 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_370 ?auto_369 ) ( IN-TRUCK ?auto_368 ?auto_370 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_368 ?auto_370 ?auto_369 )
      ( DELIVER-1PKG-VERIFY ?auto_368 ?auto_369 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_373 - OBJ
      ?auto_374 - LOCATION
    )
    :vars
    (
      ?auto_375 - TRUCK
      ?auto_376 - LOCATION
      ?auto_377 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_373 ?auto_375 ) ( TRUCK-AT ?auto_375 ?auto_376 ) ( IN-CITY ?auto_376 ?auto_377 ) ( IN-CITY ?auto_374 ?auto_377 ) ( not ( = ?auto_374 ?auto_376 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_375 ?auto_376 ?auto_374 ?auto_377 )
      ( DELIVER-1PKG ?auto_373 ?auto_374 )
      ( DELIVER-1PKG-VERIFY ?auto_373 ?auto_374 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_380 - OBJ
      ?auto_381 - LOCATION
    )
    :vars
    (
      ?auto_382 - TRUCK
      ?auto_383 - LOCATION
      ?auto_384 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_382 ?auto_383 ) ( IN-CITY ?auto_383 ?auto_384 ) ( IN-CITY ?auto_381 ?auto_384 ) ( not ( = ?auto_381 ?auto_383 ) ) ( OBJ-AT ?auto_380 ?auto_383 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_380 ?auto_382 ?auto_383 )
      ( DELIVER-1PKG ?auto_380 ?auto_381 )
      ( DELIVER-1PKG-VERIFY ?auto_380 ?auto_381 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_387 - OBJ
      ?auto_388 - LOCATION
    )
    :vars
    (
      ?auto_389 - LOCATION
      ?auto_390 - CITY
      ?auto_391 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_389 ?auto_390 ) ( IN-CITY ?auto_388 ?auto_390 ) ( not ( = ?auto_388 ?auto_389 ) ) ( OBJ-AT ?auto_387 ?auto_389 ) ( TRUCK-AT ?auto_391 ?auto_388 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_391 ?auto_388 ?auto_389 ?auto_390 )
      ( DELIVER-1PKG ?auto_387 ?auto_388 )
      ( DELIVER-1PKG-VERIFY ?auto_387 ?auto_388 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_394 - OBJ
      ?auto_395 - LOCATION
    )
    :vars
    (
      ?auto_396 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_396 ?auto_395 ) ( IN-TRUCK ?auto_394 ?auto_396 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_394 ?auto_396 ?auto_395 )
      ( DELIVER-1PKG-VERIFY ?auto_394 ?auto_395 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_399 - OBJ
      ?auto_400 - LOCATION
    )
    :vars
    (
      ?auto_401 - TRUCK
      ?auto_402 - LOCATION
      ?auto_403 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_399 ?auto_401 ) ( TRUCK-AT ?auto_401 ?auto_402 ) ( IN-CITY ?auto_402 ?auto_403 ) ( IN-CITY ?auto_400 ?auto_403 ) ( not ( = ?auto_400 ?auto_402 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_401 ?auto_402 ?auto_400 ?auto_403 )
      ( DELIVER-1PKG ?auto_399 ?auto_400 )
      ( DELIVER-1PKG-VERIFY ?auto_399 ?auto_400 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_406 - OBJ
      ?auto_407 - LOCATION
    )
    :vars
    (
      ?auto_408 - TRUCK
      ?auto_410 - LOCATION
      ?auto_409 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_408 ?auto_410 ) ( IN-CITY ?auto_410 ?auto_409 ) ( IN-CITY ?auto_407 ?auto_409 ) ( not ( = ?auto_407 ?auto_410 ) ) ( OBJ-AT ?auto_406 ?auto_410 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_406 ?auto_408 ?auto_410 )
      ( DELIVER-1PKG ?auto_406 ?auto_407 )
      ( DELIVER-1PKG-VERIFY ?auto_406 ?auto_407 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_413 - OBJ
      ?auto_414 - LOCATION
    )
    :vars
    (
      ?auto_417 - LOCATION
      ?auto_415 - CITY
      ?auto_416 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_417 ?auto_415 ) ( IN-CITY ?auto_414 ?auto_415 ) ( not ( = ?auto_414 ?auto_417 ) ) ( OBJ-AT ?auto_413 ?auto_417 ) ( TRUCK-AT ?auto_416 ?auto_414 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_416 ?auto_414 ?auto_417 ?auto_415 )
      ( DELIVER-1PKG ?auto_413 ?auto_414 )
      ( DELIVER-1PKG-VERIFY ?auto_413 ?auto_414 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_421 - OBJ
      ?auto_423 - OBJ
      ?auto_422 - LOCATION
    )
    :vars
    (
      ?auto_424 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_423 ?auto_421 ) ( TRUCK-AT ?auto_424 ?auto_422 ) ( IN-TRUCK ?auto_423 ?auto_424 ) ( OBJ-AT ?auto_421 ?auto_422 ) ( not ( = ?auto_421 ?auto_423 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_423 ?auto_422 )
      ( DELIVER-2PKG-VERIFY ?auto_421 ?auto_423 ?auto_422 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_428 - OBJ
      ?auto_430 - OBJ
      ?auto_429 - LOCATION
    )
    :vars
    (
      ?auto_431 - TRUCK
      ?auto_433 - LOCATION
      ?auto_432 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_430 ?auto_428 ) ( IN-TRUCK ?auto_430 ?auto_431 ) ( TRUCK-AT ?auto_431 ?auto_433 ) ( IN-CITY ?auto_433 ?auto_432 ) ( IN-CITY ?auto_429 ?auto_432 ) ( not ( = ?auto_429 ?auto_433 ) ) ( OBJ-AT ?auto_428 ?auto_429 ) ( not ( = ?auto_428 ?auto_430 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_430 ?auto_429 )
      ( DELIVER-2PKG-VERIFY ?auto_428 ?auto_430 ?auto_429 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_437 - OBJ
      ?auto_439 - OBJ
      ?auto_438 - LOCATION
    )
    :vars
    (
      ?auto_441 - TRUCK
      ?auto_442 - LOCATION
      ?auto_440 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_439 ?auto_437 ) ( TRUCK-AT ?auto_441 ?auto_442 ) ( IN-CITY ?auto_442 ?auto_440 ) ( IN-CITY ?auto_438 ?auto_440 ) ( not ( = ?auto_438 ?auto_442 ) ) ( OBJ-AT ?auto_439 ?auto_442 ) ( OBJ-AT ?auto_437 ?auto_438 ) ( not ( = ?auto_437 ?auto_439 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_439 ?auto_438 )
      ( DELIVER-2PKG-VERIFY ?auto_437 ?auto_439 ?auto_438 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_446 - OBJ
      ?auto_448 - OBJ
      ?auto_447 - LOCATION
    )
    :vars
    (
      ?auto_449 - LOCATION
      ?auto_451 - CITY
      ?auto_450 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_448 ?auto_446 ) ( IN-CITY ?auto_449 ?auto_451 ) ( IN-CITY ?auto_447 ?auto_451 ) ( not ( = ?auto_447 ?auto_449 ) ) ( OBJ-AT ?auto_448 ?auto_449 ) ( TRUCK-AT ?auto_450 ?auto_447 ) ( OBJ-AT ?auto_446 ?auto_447 ) ( not ( = ?auto_446 ?auto_448 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_448 ?auto_447 )
      ( DELIVER-2PKG-VERIFY ?auto_446 ?auto_448 ?auto_447 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_455 - OBJ
      ?auto_457 - OBJ
      ?auto_456 - LOCATION
    )
    :vars
    (
      ?auto_459 - LOCATION
      ?auto_458 - CITY
      ?auto_460 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_457 ?auto_455 ) ( IN-CITY ?auto_459 ?auto_458 ) ( IN-CITY ?auto_456 ?auto_458 ) ( not ( = ?auto_456 ?auto_459 ) ) ( OBJ-AT ?auto_457 ?auto_459 ) ( TRUCK-AT ?auto_460 ?auto_456 ) ( not ( = ?auto_455 ?auto_457 ) ) ( IN-TRUCK ?auto_455 ?auto_460 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_455 ?auto_456 )
      ( DELIVER-2PKG ?auto_455 ?auto_457 ?auto_456 )
      ( DELIVER-2PKG-VERIFY ?auto_455 ?auto_457 ?auto_456 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_464 - OBJ
      ?auto_466 - OBJ
      ?auto_465 - LOCATION
    )
    :vars
    (
      ?auto_469 - LOCATION
      ?auto_467 - CITY
      ?auto_468 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_466 ?auto_464 ) ( IN-CITY ?auto_469 ?auto_467 ) ( IN-CITY ?auto_465 ?auto_467 ) ( not ( = ?auto_465 ?auto_469 ) ) ( OBJ-AT ?auto_466 ?auto_469 ) ( not ( = ?auto_464 ?auto_466 ) ) ( IN-TRUCK ?auto_464 ?auto_468 ) ( TRUCK-AT ?auto_468 ?auto_469 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_468 ?auto_469 ?auto_465 ?auto_467 )
      ( DELIVER-2PKG ?auto_464 ?auto_466 ?auto_465 )
      ( DELIVER-2PKG-VERIFY ?auto_464 ?auto_466 ?auto_465 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_473 - OBJ
      ?auto_475 - OBJ
      ?auto_474 - LOCATION
    )
    :vars
    (
      ?auto_478 - LOCATION
      ?auto_476 - CITY
      ?auto_477 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_475 ?auto_473 ) ( IN-CITY ?auto_478 ?auto_476 ) ( IN-CITY ?auto_474 ?auto_476 ) ( not ( = ?auto_474 ?auto_478 ) ) ( OBJ-AT ?auto_475 ?auto_478 ) ( not ( = ?auto_473 ?auto_475 ) ) ( TRUCK-AT ?auto_477 ?auto_478 ) ( OBJ-AT ?auto_473 ?auto_478 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_473 ?auto_477 ?auto_478 )
      ( DELIVER-2PKG ?auto_473 ?auto_475 ?auto_474 )
      ( DELIVER-2PKG-VERIFY ?auto_473 ?auto_475 ?auto_474 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_482 - OBJ
      ?auto_484 - OBJ
      ?auto_483 - LOCATION
    )
    :vars
    (
      ?auto_485 - LOCATION
      ?auto_487 - CITY
      ?auto_486 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_484 ?auto_482 ) ( IN-CITY ?auto_485 ?auto_487 ) ( IN-CITY ?auto_483 ?auto_487 ) ( not ( = ?auto_483 ?auto_485 ) ) ( OBJ-AT ?auto_484 ?auto_485 ) ( not ( = ?auto_482 ?auto_484 ) ) ( OBJ-AT ?auto_482 ?auto_485 ) ( TRUCK-AT ?auto_486 ?auto_483 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_486 ?auto_483 ?auto_485 ?auto_487 )
      ( DELIVER-2PKG ?auto_482 ?auto_484 ?auto_483 )
      ( DELIVER-2PKG-VERIFY ?auto_482 ?auto_484 ?auto_483 ) )
  )

)

