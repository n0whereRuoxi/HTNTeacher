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

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8264 - OBJ
      ?auto_8265 - LOCATION
    )
    :vars
    (
      ?auto_8266 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8266 ?auto_8265 ) ( IN-TRUCK ?auto_8264 ?auto_8266 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_8264 ?auto_8266 ?auto_8265 )
      ( DELIVER-1PKG-VERIFY ?auto_8264 ?auto_8265 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8269 - OBJ
      ?auto_8270 - LOCATION
    )
    :vars
    (
      ?auto_8271 - TRUCK
      ?auto_8272 - LOCATION
      ?auto_8273 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8269 ?auto_8271 ) ( TRUCK-AT ?auto_8271 ?auto_8272 ) ( IN-CITY ?auto_8272 ?auto_8273 ) ( IN-CITY ?auto_8270 ?auto_8273 ) ( not ( = ?auto_8270 ?auto_8272 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8271 ?auto_8272 ?auto_8270 ?auto_8273 )
      ( DELIVER-1PKG ?auto_8269 ?auto_8270 )
      ( DELIVER-1PKG-VERIFY ?auto_8269 ?auto_8270 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8276 - OBJ
      ?auto_8277 - LOCATION
    )
    :vars
    (
      ?auto_8280 - TRUCK
      ?auto_8278 - LOCATION
      ?auto_8279 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8280 ?auto_8278 ) ( IN-CITY ?auto_8278 ?auto_8279 ) ( IN-CITY ?auto_8277 ?auto_8279 ) ( not ( = ?auto_8277 ?auto_8278 ) ) ( OBJ-AT ?auto_8276 ?auto_8278 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_8276 ?auto_8280 ?auto_8278 )
      ( DELIVER-1PKG ?auto_8276 ?auto_8277 )
      ( DELIVER-1PKG-VERIFY ?auto_8276 ?auto_8277 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8283 - OBJ
      ?auto_8284 - LOCATION
    )
    :vars
    (
      ?auto_8285 - LOCATION
      ?auto_8287 - CITY
      ?auto_8286 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8285 ?auto_8287 ) ( IN-CITY ?auto_8284 ?auto_8287 ) ( not ( = ?auto_8284 ?auto_8285 ) ) ( OBJ-AT ?auto_8283 ?auto_8285 ) ( TRUCK-AT ?auto_8286 ?auto_8284 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8286 ?auto_8284 ?auto_8285 ?auto_8287 )
      ( DELIVER-1PKG ?auto_8283 ?auto_8284 )
      ( DELIVER-1PKG-VERIFY ?auto_8283 ?auto_8284 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8317 - OBJ
      ?auto_8319 - OBJ
      ?auto_8318 - LOCATION
    )
    :vars
    (
      ?auto_8320 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8319 ?auto_8317 ) ( TRUCK-AT ?auto_8320 ?auto_8318 ) ( IN-TRUCK ?auto_8319 ?auto_8320 ) ( OBJ-AT ?auto_8317 ?auto_8318 ) ( not ( = ?auto_8317 ?auto_8319 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8319 ?auto_8318 )
      ( DELIVER-2PKG-VERIFY ?auto_8317 ?auto_8319 ?auto_8318 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8324 - OBJ
      ?auto_8326 - OBJ
      ?auto_8325 - LOCATION
    )
    :vars
    (
      ?auto_8328 - TRUCK
      ?auto_8329 - LOCATION
      ?auto_8327 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8326 ?auto_8324 ) ( IN-TRUCK ?auto_8326 ?auto_8328 ) ( TRUCK-AT ?auto_8328 ?auto_8329 ) ( IN-CITY ?auto_8329 ?auto_8327 ) ( IN-CITY ?auto_8325 ?auto_8327 ) ( not ( = ?auto_8325 ?auto_8329 ) ) ( OBJ-AT ?auto_8324 ?auto_8325 ) ( not ( = ?auto_8324 ?auto_8326 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8326 ?auto_8325 )
      ( DELIVER-2PKG-VERIFY ?auto_8324 ?auto_8326 ?auto_8325 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8333 - OBJ
      ?auto_8335 - OBJ
      ?auto_8334 - LOCATION
    )
    :vars
    (
      ?auto_8338 - TRUCK
      ?auto_8336 - LOCATION
      ?auto_8337 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8335 ?auto_8333 ) ( TRUCK-AT ?auto_8338 ?auto_8336 ) ( IN-CITY ?auto_8336 ?auto_8337 ) ( IN-CITY ?auto_8334 ?auto_8337 ) ( not ( = ?auto_8334 ?auto_8336 ) ) ( OBJ-AT ?auto_8335 ?auto_8336 ) ( OBJ-AT ?auto_8333 ?auto_8334 ) ( not ( = ?auto_8333 ?auto_8335 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8335 ?auto_8334 )
      ( DELIVER-2PKG-VERIFY ?auto_8333 ?auto_8335 ?auto_8334 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8342 - OBJ
      ?auto_8344 - OBJ
      ?auto_8343 - LOCATION
    )
    :vars
    (
      ?auto_8345 - LOCATION
      ?auto_8347 - CITY
      ?auto_8346 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8344 ?auto_8342 ) ( IN-CITY ?auto_8345 ?auto_8347 ) ( IN-CITY ?auto_8343 ?auto_8347 ) ( not ( = ?auto_8343 ?auto_8345 ) ) ( OBJ-AT ?auto_8344 ?auto_8345 ) ( TRUCK-AT ?auto_8346 ?auto_8343 ) ( OBJ-AT ?auto_8342 ?auto_8343 ) ( not ( = ?auto_8342 ?auto_8344 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8344 ?auto_8343 )
      ( DELIVER-2PKG-VERIFY ?auto_8342 ?auto_8344 ?auto_8343 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8351 - OBJ
      ?auto_8353 - OBJ
      ?auto_8352 - LOCATION
    )
    :vars
    (
      ?auto_8355 - LOCATION
      ?auto_8356 - CITY
      ?auto_8354 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8353 ?auto_8351 ) ( IN-CITY ?auto_8355 ?auto_8356 ) ( IN-CITY ?auto_8352 ?auto_8356 ) ( not ( = ?auto_8352 ?auto_8355 ) ) ( OBJ-AT ?auto_8353 ?auto_8355 ) ( TRUCK-AT ?auto_8354 ?auto_8352 ) ( not ( = ?auto_8351 ?auto_8353 ) ) ( IN-TRUCK ?auto_8351 ?auto_8354 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8351 ?auto_8352 )
      ( DELIVER-2PKG ?auto_8351 ?auto_8353 ?auto_8352 )
      ( DELIVER-2PKG-VERIFY ?auto_8351 ?auto_8353 ?auto_8352 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8360 - OBJ
      ?auto_8362 - OBJ
      ?auto_8361 - LOCATION
    )
    :vars
    (
      ?auto_8365 - LOCATION
      ?auto_8364 - CITY
      ?auto_8363 - TRUCK
      ?auto_8366 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8362 ?auto_8360 ) ( IN-CITY ?auto_8365 ?auto_8364 ) ( IN-CITY ?auto_8361 ?auto_8364 ) ( not ( = ?auto_8361 ?auto_8365 ) ) ( OBJ-AT ?auto_8362 ?auto_8365 ) ( not ( = ?auto_8360 ?auto_8362 ) ) ( IN-TRUCK ?auto_8360 ?auto_8363 ) ( TRUCK-AT ?auto_8363 ?auto_8366 ) ( IN-CITY ?auto_8366 ?auto_8364 ) ( not ( = ?auto_8361 ?auto_8366 ) ) ( not ( = ?auto_8365 ?auto_8366 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8363 ?auto_8366 ?auto_8361 ?auto_8364 )
      ( DELIVER-2PKG ?auto_8360 ?auto_8362 ?auto_8361 )
      ( DELIVER-2PKG-VERIFY ?auto_8360 ?auto_8362 ?auto_8361 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8370 - OBJ
      ?auto_8372 - OBJ
      ?auto_8371 - LOCATION
    )
    :vars
    (
      ?auto_8375 - LOCATION
      ?auto_8374 - CITY
      ?auto_8376 - TRUCK
      ?auto_8373 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8372 ?auto_8370 ) ( IN-CITY ?auto_8375 ?auto_8374 ) ( IN-CITY ?auto_8371 ?auto_8374 ) ( not ( = ?auto_8371 ?auto_8375 ) ) ( OBJ-AT ?auto_8372 ?auto_8375 ) ( not ( = ?auto_8370 ?auto_8372 ) ) ( TRUCK-AT ?auto_8376 ?auto_8373 ) ( IN-CITY ?auto_8373 ?auto_8374 ) ( not ( = ?auto_8371 ?auto_8373 ) ) ( not ( = ?auto_8375 ?auto_8373 ) ) ( OBJ-AT ?auto_8370 ?auto_8373 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_8370 ?auto_8376 ?auto_8373 )
      ( DELIVER-2PKG ?auto_8370 ?auto_8372 ?auto_8371 )
      ( DELIVER-2PKG-VERIFY ?auto_8370 ?auto_8372 ?auto_8371 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8380 - OBJ
      ?auto_8382 - OBJ
      ?auto_8381 - LOCATION
    )
    :vars
    (
      ?auto_8385 - LOCATION
      ?auto_8384 - CITY
      ?auto_8386 - LOCATION
      ?auto_8383 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8382 ?auto_8380 ) ( IN-CITY ?auto_8385 ?auto_8384 ) ( IN-CITY ?auto_8381 ?auto_8384 ) ( not ( = ?auto_8381 ?auto_8385 ) ) ( OBJ-AT ?auto_8382 ?auto_8385 ) ( not ( = ?auto_8380 ?auto_8382 ) ) ( IN-CITY ?auto_8386 ?auto_8384 ) ( not ( = ?auto_8381 ?auto_8386 ) ) ( not ( = ?auto_8385 ?auto_8386 ) ) ( OBJ-AT ?auto_8380 ?auto_8386 ) ( TRUCK-AT ?auto_8383 ?auto_8381 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8383 ?auto_8381 ?auto_8386 ?auto_8384 )
      ( DELIVER-2PKG ?auto_8380 ?auto_8382 ?auto_8381 )
      ( DELIVER-2PKG-VERIFY ?auto_8380 ?auto_8382 ?auto_8381 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8417 - OBJ
      ?auto_8419 - OBJ
      ?auto_8420 - OBJ
      ?auto_8418 - LOCATION
    )
    :vars
    (
      ?auto_8421 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8419 ?auto_8417 ) ( GREATER-THAN ?auto_8420 ?auto_8417 ) ( GREATER-THAN ?auto_8420 ?auto_8419 ) ( TRUCK-AT ?auto_8421 ?auto_8418 ) ( IN-TRUCK ?auto_8420 ?auto_8421 ) ( OBJ-AT ?auto_8417 ?auto_8418 ) ( OBJ-AT ?auto_8419 ?auto_8418 ) ( not ( = ?auto_8417 ?auto_8419 ) ) ( not ( = ?auto_8417 ?auto_8420 ) ) ( not ( = ?auto_8419 ?auto_8420 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8420 ?auto_8418 )
      ( DELIVER-3PKG-VERIFY ?auto_8417 ?auto_8419 ?auto_8420 ?auto_8418 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8426 - OBJ
      ?auto_8428 - OBJ
      ?auto_8429 - OBJ
      ?auto_8427 - LOCATION
    )
    :vars
    (
      ?auto_8432 - TRUCK
      ?auto_8431 - LOCATION
      ?auto_8430 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8428 ?auto_8426 ) ( GREATER-THAN ?auto_8429 ?auto_8426 ) ( GREATER-THAN ?auto_8429 ?auto_8428 ) ( IN-TRUCK ?auto_8429 ?auto_8432 ) ( TRUCK-AT ?auto_8432 ?auto_8431 ) ( IN-CITY ?auto_8431 ?auto_8430 ) ( IN-CITY ?auto_8427 ?auto_8430 ) ( not ( = ?auto_8427 ?auto_8431 ) ) ( OBJ-AT ?auto_8426 ?auto_8427 ) ( OBJ-AT ?auto_8428 ?auto_8427 ) ( not ( = ?auto_8426 ?auto_8428 ) ) ( not ( = ?auto_8426 ?auto_8429 ) ) ( not ( = ?auto_8428 ?auto_8429 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8429 ?auto_8427 )
      ( DELIVER-3PKG-VERIFY ?auto_8426 ?auto_8428 ?auto_8429 ?auto_8427 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8437 - OBJ
      ?auto_8439 - OBJ
      ?auto_8440 - OBJ
      ?auto_8438 - LOCATION
    )
    :vars
    (
      ?auto_8443 - TRUCK
      ?auto_8442 - LOCATION
      ?auto_8441 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8439 ?auto_8437 ) ( GREATER-THAN ?auto_8440 ?auto_8437 ) ( GREATER-THAN ?auto_8440 ?auto_8439 ) ( TRUCK-AT ?auto_8443 ?auto_8442 ) ( IN-CITY ?auto_8442 ?auto_8441 ) ( IN-CITY ?auto_8438 ?auto_8441 ) ( not ( = ?auto_8438 ?auto_8442 ) ) ( OBJ-AT ?auto_8440 ?auto_8442 ) ( OBJ-AT ?auto_8437 ?auto_8438 ) ( OBJ-AT ?auto_8439 ?auto_8438 ) ( not ( = ?auto_8437 ?auto_8439 ) ) ( not ( = ?auto_8437 ?auto_8440 ) ) ( not ( = ?auto_8439 ?auto_8440 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8440 ?auto_8438 )
      ( DELIVER-3PKG-VERIFY ?auto_8437 ?auto_8439 ?auto_8440 ?auto_8438 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8448 - OBJ
      ?auto_8450 - OBJ
      ?auto_8451 - OBJ
      ?auto_8449 - LOCATION
    )
    :vars
    (
      ?auto_8454 - LOCATION
      ?auto_8452 - CITY
      ?auto_8453 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8450 ?auto_8448 ) ( GREATER-THAN ?auto_8451 ?auto_8448 ) ( GREATER-THAN ?auto_8451 ?auto_8450 ) ( IN-CITY ?auto_8454 ?auto_8452 ) ( IN-CITY ?auto_8449 ?auto_8452 ) ( not ( = ?auto_8449 ?auto_8454 ) ) ( OBJ-AT ?auto_8451 ?auto_8454 ) ( TRUCK-AT ?auto_8453 ?auto_8449 ) ( OBJ-AT ?auto_8448 ?auto_8449 ) ( OBJ-AT ?auto_8450 ?auto_8449 ) ( not ( = ?auto_8448 ?auto_8450 ) ) ( not ( = ?auto_8448 ?auto_8451 ) ) ( not ( = ?auto_8450 ?auto_8451 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8451 ?auto_8449 )
      ( DELIVER-3PKG-VERIFY ?auto_8448 ?auto_8450 ?auto_8451 ?auto_8449 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8459 - OBJ
      ?auto_8461 - OBJ
      ?auto_8462 - OBJ
      ?auto_8460 - LOCATION
    )
    :vars
    (
      ?auto_8463 - LOCATION
      ?auto_8464 - CITY
      ?auto_8465 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8461 ?auto_8459 ) ( GREATER-THAN ?auto_8462 ?auto_8459 ) ( GREATER-THAN ?auto_8462 ?auto_8461 ) ( IN-CITY ?auto_8463 ?auto_8464 ) ( IN-CITY ?auto_8460 ?auto_8464 ) ( not ( = ?auto_8460 ?auto_8463 ) ) ( OBJ-AT ?auto_8462 ?auto_8463 ) ( TRUCK-AT ?auto_8465 ?auto_8460 ) ( OBJ-AT ?auto_8459 ?auto_8460 ) ( not ( = ?auto_8459 ?auto_8461 ) ) ( not ( = ?auto_8459 ?auto_8462 ) ) ( not ( = ?auto_8461 ?auto_8462 ) ) ( IN-TRUCK ?auto_8461 ?auto_8465 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8461 ?auto_8460 )
      ( DELIVER-3PKG ?auto_8459 ?auto_8461 ?auto_8462 ?auto_8460 )
      ( DELIVER-3PKG-VERIFY ?auto_8459 ?auto_8461 ?auto_8462 ?auto_8460 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8470 - OBJ
      ?auto_8472 - OBJ
      ?auto_8473 - OBJ
      ?auto_8471 - LOCATION
    )
    :vars
    (
      ?auto_8475 - LOCATION
      ?auto_8474 - CITY
      ?auto_8476 - TRUCK
      ?auto_8477 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8472 ?auto_8470 ) ( GREATER-THAN ?auto_8473 ?auto_8470 ) ( GREATER-THAN ?auto_8473 ?auto_8472 ) ( IN-CITY ?auto_8475 ?auto_8474 ) ( IN-CITY ?auto_8471 ?auto_8474 ) ( not ( = ?auto_8471 ?auto_8475 ) ) ( OBJ-AT ?auto_8473 ?auto_8475 ) ( OBJ-AT ?auto_8470 ?auto_8471 ) ( not ( = ?auto_8470 ?auto_8472 ) ) ( not ( = ?auto_8470 ?auto_8473 ) ) ( not ( = ?auto_8472 ?auto_8473 ) ) ( IN-TRUCK ?auto_8472 ?auto_8476 ) ( TRUCK-AT ?auto_8476 ?auto_8477 ) ( IN-CITY ?auto_8477 ?auto_8474 ) ( not ( = ?auto_8471 ?auto_8477 ) ) ( not ( = ?auto_8475 ?auto_8477 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8476 ?auto_8477 ?auto_8471 ?auto_8474 )
      ( DELIVER-3PKG ?auto_8470 ?auto_8472 ?auto_8473 ?auto_8471 )
      ( DELIVER-3PKG-VERIFY ?auto_8470 ?auto_8472 ?auto_8473 ?auto_8471 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8482 - OBJ
      ?auto_8484 - OBJ
      ?auto_8485 - OBJ
      ?auto_8483 - LOCATION
    )
    :vars
    (
      ?auto_8488 - LOCATION
      ?auto_8489 - CITY
      ?auto_8487 - TRUCK
      ?auto_8486 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8484 ?auto_8482 ) ( GREATER-THAN ?auto_8485 ?auto_8482 ) ( GREATER-THAN ?auto_8485 ?auto_8484 ) ( IN-CITY ?auto_8488 ?auto_8489 ) ( IN-CITY ?auto_8483 ?auto_8489 ) ( not ( = ?auto_8483 ?auto_8488 ) ) ( OBJ-AT ?auto_8485 ?auto_8488 ) ( OBJ-AT ?auto_8482 ?auto_8483 ) ( not ( = ?auto_8482 ?auto_8484 ) ) ( not ( = ?auto_8482 ?auto_8485 ) ) ( not ( = ?auto_8484 ?auto_8485 ) ) ( TRUCK-AT ?auto_8487 ?auto_8486 ) ( IN-CITY ?auto_8486 ?auto_8489 ) ( not ( = ?auto_8483 ?auto_8486 ) ) ( not ( = ?auto_8488 ?auto_8486 ) ) ( OBJ-AT ?auto_8484 ?auto_8486 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_8484 ?auto_8487 ?auto_8486 )
      ( DELIVER-3PKG ?auto_8482 ?auto_8484 ?auto_8485 ?auto_8483 )
      ( DELIVER-3PKG-VERIFY ?auto_8482 ?auto_8484 ?auto_8485 ?auto_8483 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8494 - OBJ
      ?auto_8496 - OBJ
      ?auto_8497 - OBJ
      ?auto_8495 - LOCATION
    )
    :vars
    (
      ?auto_8498 - LOCATION
      ?auto_8500 - CITY
      ?auto_8501 - LOCATION
      ?auto_8499 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8496 ?auto_8494 ) ( GREATER-THAN ?auto_8497 ?auto_8494 ) ( GREATER-THAN ?auto_8497 ?auto_8496 ) ( IN-CITY ?auto_8498 ?auto_8500 ) ( IN-CITY ?auto_8495 ?auto_8500 ) ( not ( = ?auto_8495 ?auto_8498 ) ) ( OBJ-AT ?auto_8497 ?auto_8498 ) ( OBJ-AT ?auto_8494 ?auto_8495 ) ( not ( = ?auto_8494 ?auto_8496 ) ) ( not ( = ?auto_8494 ?auto_8497 ) ) ( not ( = ?auto_8496 ?auto_8497 ) ) ( IN-CITY ?auto_8501 ?auto_8500 ) ( not ( = ?auto_8495 ?auto_8501 ) ) ( not ( = ?auto_8498 ?auto_8501 ) ) ( OBJ-AT ?auto_8496 ?auto_8501 ) ( TRUCK-AT ?auto_8499 ?auto_8495 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8499 ?auto_8495 ?auto_8501 ?auto_8500 )
      ( DELIVER-3PKG ?auto_8494 ?auto_8496 ?auto_8497 ?auto_8495 )
      ( DELIVER-3PKG-VERIFY ?auto_8494 ?auto_8496 ?auto_8497 ?auto_8495 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8506 - OBJ
      ?auto_8508 - OBJ
      ?auto_8509 - OBJ
      ?auto_8507 - LOCATION
    )
    :vars
    (
      ?auto_8512 - LOCATION
      ?auto_8513 - CITY
      ?auto_8510 - LOCATION
      ?auto_8511 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8508 ?auto_8506 ) ( GREATER-THAN ?auto_8509 ?auto_8506 ) ( GREATER-THAN ?auto_8509 ?auto_8508 ) ( IN-CITY ?auto_8512 ?auto_8513 ) ( IN-CITY ?auto_8507 ?auto_8513 ) ( not ( = ?auto_8507 ?auto_8512 ) ) ( OBJ-AT ?auto_8509 ?auto_8512 ) ( not ( = ?auto_8506 ?auto_8508 ) ) ( not ( = ?auto_8506 ?auto_8509 ) ) ( not ( = ?auto_8508 ?auto_8509 ) ) ( IN-CITY ?auto_8510 ?auto_8513 ) ( not ( = ?auto_8507 ?auto_8510 ) ) ( not ( = ?auto_8512 ?auto_8510 ) ) ( OBJ-AT ?auto_8508 ?auto_8510 ) ( TRUCK-AT ?auto_8511 ?auto_8507 ) ( IN-TRUCK ?auto_8506 ?auto_8511 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8506 ?auto_8507 )
      ( DELIVER-3PKG ?auto_8506 ?auto_8508 ?auto_8509 ?auto_8507 )
      ( DELIVER-3PKG-VERIFY ?auto_8506 ?auto_8508 ?auto_8509 ?auto_8507 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8518 - OBJ
      ?auto_8520 - OBJ
      ?auto_8521 - OBJ
      ?auto_8519 - LOCATION
    )
    :vars
    (
      ?auto_8525 - LOCATION
      ?auto_8523 - CITY
      ?auto_8522 - LOCATION
      ?auto_8524 - TRUCK
      ?auto_8526 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8520 ?auto_8518 ) ( GREATER-THAN ?auto_8521 ?auto_8518 ) ( GREATER-THAN ?auto_8521 ?auto_8520 ) ( IN-CITY ?auto_8525 ?auto_8523 ) ( IN-CITY ?auto_8519 ?auto_8523 ) ( not ( = ?auto_8519 ?auto_8525 ) ) ( OBJ-AT ?auto_8521 ?auto_8525 ) ( not ( = ?auto_8518 ?auto_8520 ) ) ( not ( = ?auto_8518 ?auto_8521 ) ) ( not ( = ?auto_8520 ?auto_8521 ) ) ( IN-CITY ?auto_8522 ?auto_8523 ) ( not ( = ?auto_8519 ?auto_8522 ) ) ( not ( = ?auto_8525 ?auto_8522 ) ) ( OBJ-AT ?auto_8520 ?auto_8522 ) ( IN-TRUCK ?auto_8518 ?auto_8524 ) ( TRUCK-AT ?auto_8524 ?auto_8526 ) ( IN-CITY ?auto_8526 ?auto_8523 ) ( not ( = ?auto_8519 ?auto_8526 ) ) ( not ( = ?auto_8525 ?auto_8526 ) ) ( not ( = ?auto_8522 ?auto_8526 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8524 ?auto_8526 ?auto_8519 ?auto_8523 )
      ( DELIVER-3PKG ?auto_8518 ?auto_8520 ?auto_8521 ?auto_8519 )
      ( DELIVER-3PKG-VERIFY ?auto_8518 ?auto_8520 ?auto_8521 ?auto_8519 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8531 - OBJ
      ?auto_8533 - OBJ
      ?auto_8534 - OBJ
      ?auto_8532 - LOCATION
    )
    :vars
    (
      ?auto_8537 - LOCATION
      ?auto_8535 - CITY
      ?auto_8536 - LOCATION
      ?auto_8539 - TRUCK
      ?auto_8538 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8533 ?auto_8531 ) ( GREATER-THAN ?auto_8534 ?auto_8531 ) ( GREATER-THAN ?auto_8534 ?auto_8533 ) ( IN-CITY ?auto_8537 ?auto_8535 ) ( IN-CITY ?auto_8532 ?auto_8535 ) ( not ( = ?auto_8532 ?auto_8537 ) ) ( OBJ-AT ?auto_8534 ?auto_8537 ) ( not ( = ?auto_8531 ?auto_8533 ) ) ( not ( = ?auto_8531 ?auto_8534 ) ) ( not ( = ?auto_8533 ?auto_8534 ) ) ( IN-CITY ?auto_8536 ?auto_8535 ) ( not ( = ?auto_8532 ?auto_8536 ) ) ( not ( = ?auto_8537 ?auto_8536 ) ) ( OBJ-AT ?auto_8533 ?auto_8536 ) ( TRUCK-AT ?auto_8539 ?auto_8538 ) ( IN-CITY ?auto_8538 ?auto_8535 ) ( not ( = ?auto_8532 ?auto_8538 ) ) ( not ( = ?auto_8537 ?auto_8538 ) ) ( not ( = ?auto_8536 ?auto_8538 ) ) ( OBJ-AT ?auto_8531 ?auto_8538 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_8531 ?auto_8539 ?auto_8538 )
      ( DELIVER-3PKG ?auto_8531 ?auto_8533 ?auto_8534 ?auto_8532 )
      ( DELIVER-3PKG-VERIFY ?auto_8531 ?auto_8533 ?auto_8534 ?auto_8532 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8544 - OBJ
      ?auto_8546 - OBJ
      ?auto_8547 - OBJ
      ?auto_8545 - LOCATION
    )
    :vars
    (
      ?auto_8550 - LOCATION
      ?auto_8548 - CITY
      ?auto_8552 - LOCATION
      ?auto_8551 - LOCATION
      ?auto_8549 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8546 ?auto_8544 ) ( GREATER-THAN ?auto_8547 ?auto_8544 ) ( GREATER-THAN ?auto_8547 ?auto_8546 ) ( IN-CITY ?auto_8550 ?auto_8548 ) ( IN-CITY ?auto_8545 ?auto_8548 ) ( not ( = ?auto_8545 ?auto_8550 ) ) ( OBJ-AT ?auto_8547 ?auto_8550 ) ( not ( = ?auto_8544 ?auto_8546 ) ) ( not ( = ?auto_8544 ?auto_8547 ) ) ( not ( = ?auto_8546 ?auto_8547 ) ) ( IN-CITY ?auto_8552 ?auto_8548 ) ( not ( = ?auto_8545 ?auto_8552 ) ) ( not ( = ?auto_8550 ?auto_8552 ) ) ( OBJ-AT ?auto_8546 ?auto_8552 ) ( IN-CITY ?auto_8551 ?auto_8548 ) ( not ( = ?auto_8545 ?auto_8551 ) ) ( not ( = ?auto_8550 ?auto_8551 ) ) ( not ( = ?auto_8552 ?auto_8551 ) ) ( OBJ-AT ?auto_8544 ?auto_8551 ) ( TRUCK-AT ?auto_8549 ?auto_8545 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8549 ?auto_8545 ?auto_8551 ?auto_8548 )
      ( DELIVER-3PKG ?auto_8544 ?auto_8546 ?auto_8547 ?auto_8545 )
      ( DELIVER-3PKG-VERIFY ?auto_8544 ?auto_8546 ?auto_8547 ?auto_8545 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_8584 - OBJ
      ?auto_8586 - OBJ
      ?auto_8587 - OBJ
      ?auto_8588 - OBJ
      ?auto_8585 - LOCATION
    )
    :vars
    (
      ?auto_8589 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8586 ?auto_8584 ) ( GREATER-THAN ?auto_8587 ?auto_8584 ) ( GREATER-THAN ?auto_8587 ?auto_8586 ) ( GREATER-THAN ?auto_8588 ?auto_8584 ) ( GREATER-THAN ?auto_8588 ?auto_8586 ) ( GREATER-THAN ?auto_8588 ?auto_8587 ) ( TRUCK-AT ?auto_8589 ?auto_8585 ) ( IN-TRUCK ?auto_8588 ?auto_8589 ) ( OBJ-AT ?auto_8584 ?auto_8585 ) ( OBJ-AT ?auto_8586 ?auto_8585 ) ( OBJ-AT ?auto_8587 ?auto_8585 ) ( not ( = ?auto_8584 ?auto_8586 ) ) ( not ( = ?auto_8584 ?auto_8587 ) ) ( not ( = ?auto_8584 ?auto_8588 ) ) ( not ( = ?auto_8586 ?auto_8587 ) ) ( not ( = ?auto_8586 ?auto_8588 ) ) ( not ( = ?auto_8587 ?auto_8588 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8588 ?auto_8585 )
      ( DELIVER-4PKG-VERIFY ?auto_8584 ?auto_8586 ?auto_8587 ?auto_8588 ?auto_8585 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_8595 - OBJ
      ?auto_8597 - OBJ
      ?auto_8598 - OBJ
      ?auto_8599 - OBJ
      ?auto_8596 - LOCATION
    )
    :vars
    (
      ?auto_8601 - TRUCK
      ?auto_8602 - LOCATION
      ?auto_8600 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8597 ?auto_8595 ) ( GREATER-THAN ?auto_8598 ?auto_8595 ) ( GREATER-THAN ?auto_8598 ?auto_8597 ) ( GREATER-THAN ?auto_8599 ?auto_8595 ) ( GREATER-THAN ?auto_8599 ?auto_8597 ) ( GREATER-THAN ?auto_8599 ?auto_8598 ) ( IN-TRUCK ?auto_8599 ?auto_8601 ) ( TRUCK-AT ?auto_8601 ?auto_8602 ) ( IN-CITY ?auto_8602 ?auto_8600 ) ( IN-CITY ?auto_8596 ?auto_8600 ) ( not ( = ?auto_8596 ?auto_8602 ) ) ( OBJ-AT ?auto_8595 ?auto_8596 ) ( OBJ-AT ?auto_8597 ?auto_8596 ) ( OBJ-AT ?auto_8598 ?auto_8596 ) ( not ( = ?auto_8595 ?auto_8597 ) ) ( not ( = ?auto_8595 ?auto_8598 ) ) ( not ( = ?auto_8595 ?auto_8599 ) ) ( not ( = ?auto_8597 ?auto_8598 ) ) ( not ( = ?auto_8597 ?auto_8599 ) ) ( not ( = ?auto_8598 ?auto_8599 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8599 ?auto_8596 )
      ( DELIVER-4PKG-VERIFY ?auto_8595 ?auto_8597 ?auto_8598 ?auto_8599 ?auto_8596 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_8608 - OBJ
      ?auto_8610 - OBJ
      ?auto_8611 - OBJ
      ?auto_8612 - OBJ
      ?auto_8609 - LOCATION
    )
    :vars
    (
      ?auto_8614 - TRUCK
      ?auto_8615 - LOCATION
      ?auto_8613 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8610 ?auto_8608 ) ( GREATER-THAN ?auto_8611 ?auto_8608 ) ( GREATER-THAN ?auto_8611 ?auto_8610 ) ( GREATER-THAN ?auto_8612 ?auto_8608 ) ( GREATER-THAN ?auto_8612 ?auto_8610 ) ( GREATER-THAN ?auto_8612 ?auto_8611 ) ( TRUCK-AT ?auto_8614 ?auto_8615 ) ( IN-CITY ?auto_8615 ?auto_8613 ) ( IN-CITY ?auto_8609 ?auto_8613 ) ( not ( = ?auto_8609 ?auto_8615 ) ) ( OBJ-AT ?auto_8612 ?auto_8615 ) ( OBJ-AT ?auto_8608 ?auto_8609 ) ( OBJ-AT ?auto_8610 ?auto_8609 ) ( OBJ-AT ?auto_8611 ?auto_8609 ) ( not ( = ?auto_8608 ?auto_8610 ) ) ( not ( = ?auto_8608 ?auto_8611 ) ) ( not ( = ?auto_8608 ?auto_8612 ) ) ( not ( = ?auto_8610 ?auto_8611 ) ) ( not ( = ?auto_8610 ?auto_8612 ) ) ( not ( = ?auto_8611 ?auto_8612 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8612 ?auto_8609 )
      ( DELIVER-4PKG-VERIFY ?auto_8608 ?auto_8610 ?auto_8611 ?auto_8612 ?auto_8609 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_8621 - OBJ
      ?auto_8623 - OBJ
      ?auto_8624 - OBJ
      ?auto_8625 - OBJ
      ?auto_8622 - LOCATION
    )
    :vars
    (
      ?auto_8628 - LOCATION
      ?auto_8627 - CITY
      ?auto_8626 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8623 ?auto_8621 ) ( GREATER-THAN ?auto_8624 ?auto_8621 ) ( GREATER-THAN ?auto_8624 ?auto_8623 ) ( GREATER-THAN ?auto_8625 ?auto_8621 ) ( GREATER-THAN ?auto_8625 ?auto_8623 ) ( GREATER-THAN ?auto_8625 ?auto_8624 ) ( IN-CITY ?auto_8628 ?auto_8627 ) ( IN-CITY ?auto_8622 ?auto_8627 ) ( not ( = ?auto_8622 ?auto_8628 ) ) ( OBJ-AT ?auto_8625 ?auto_8628 ) ( TRUCK-AT ?auto_8626 ?auto_8622 ) ( OBJ-AT ?auto_8621 ?auto_8622 ) ( OBJ-AT ?auto_8623 ?auto_8622 ) ( OBJ-AT ?auto_8624 ?auto_8622 ) ( not ( = ?auto_8621 ?auto_8623 ) ) ( not ( = ?auto_8621 ?auto_8624 ) ) ( not ( = ?auto_8621 ?auto_8625 ) ) ( not ( = ?auto_8623 ?auto_8624 ) ) ( not ( = ?auto_8623 ?auto_8625 ) ) ( not ( = ?auto_8624 ?auto_8625 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8625 ?auto_8622 )
      ( DELIVER-4PKG-VERIFY ?auto_8621 ?auto_8623 ?auto_8624 ?auto_8625 ?auto_8622 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_8634 - OBJ
      ?auto_8636 - OBJ
      ?auto_8637 - OBJ
      ?auto_8638 - OBJ
      ?auto_8635 - LOCATION
    )
    :vars
    (
      ?auto_8639 - LOCATION
      ?auto_8640 - CITY
      ?auto_8641 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8636 ?auto_8634 ) ( GREATER-THAN ?auto_8637 ?auto_8634 ) ( GREATER-THAN ?auto_8637 ?auto_8636 ) ( GREATER-THAN ?auto_8638 ?auto_8634 ) ( GREATER-THAN ?auto_8638 ?auto_8636 ) ( GREATER-THAN ?auto_8638 ?auto_8637 ) ( IN-CITY ?auto_8639 ?auto_8640 ) ( IN-CITY ?auto_8635 ?auto_8640 ) ( not ( = ?auto_8635 ?auto_8639 ) ) ( OBJ-AT ?auto_8638 ?auto_8639 ) ( TRUCK-AT ?auto_8641 ?auto_8635 ) ( OBJ-AT ?auto_8634 ?auto_8635 ) ( OBJ-AT ?auto_8636 ?auto_8635 ) ( not ( = ?auto_8634 ?auto_8636 ) ) ( not ( = ?auto_8634 ?auto_8637 ) ) ( not ( = ?auto_8634 ?auto_8638 ) ) ( not ( = ?auto_8636 ?auto_8637 ) ) ( not ( = ?auto_8636 ?auto_8638 ) ) ( not ( = ?auto_8637 ?auto_8638 ) ) ( IN-TRUCK ?auto_8637 ?auto_8641 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8637 ?auto_8635 )
      ( DELIVER-4PKG ?auto_8634 ?auto_8636 ?auto_8637 ?auto_8638 ?auto_8635 )
      ( DELIVER-4PKG-VERIFY ?auto_8634 ?auto_8636 ?auto_8637 ?auto_8638 ?auto_8635 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_8647 - OBJ
      ?auto_8649 - OBJ
      ?auto_8650 - OBJ
      ?auto_8651 - OBJ
      ?auto_8648 - LOCATION
    )
    :vars
    (
      ?auto_8653 - LOCATION
      ?auto_8654 - CITY
      ?auto_8652 - TRUCK
      ?auto_8655 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8649 ?auto_8647 ) ( GREATER-THAN ?auto_8650 ?auto_8647 ) ( GREATER-THAN ?auto_8650 ?auto_8649 ) ( GREATER-THAN ?auto_8651 ?auto_8647 ) ( GREATER-THAN ?auto_8651 ?auto_8649 ) ( GREATER-THAN ?auto_8651 ?auto_8650 ) ( IN-CITY ?auto_8653 ?auto_8654 ) ( IN-CITY ?auto_8648 ?auto_8654 ) ( not ( = ?auto_8648 ?auto_8653 ) ) ( OBJ-AT ?auto_8651 ?auto_8653 ) ( OBJ-AT ?auto_8647 ?auto_8648 ) ( OBJ-AT ?auto_8649 ?auto_8648 ) ( not ( = ?auto_8647 ?auto_8649 ) ) ( not ( = ?auto_8647 ?auto_8650 ) ) ( not ( = ?auto_8647 ?auto_8651 ) ) ( not ( = ?auto_8649 ?auto_8650 ) ) ( not ( = ?auto_8649 ?auto_8651 ) ) ( not ( = ?auto_8650 ?auto_8651 ) ) ( IN-TRUCK ?auto_8650 ?auto_8652 ) ( TRUCK-AT ?auto_8652 ?auto_8655 ) ( IN-CITY ?auto_8655 ?auto_8654 ) ( not ( = ?auto_8648 ?auto_8655 ) ) ( not ( = ?auto_8653 ?auto_8655 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8652 ?auto_8655 ?auto_8648 ?auto_8654 )
      ( DELIVER-4PKG ?auto_8647 ?auto_8649 ?auto_8650 ?auto_8651 ?auto_8648 )
      ( DELIVER-4PKG-VERIFY ?auto_8647 ?auto_8649 ?auto_8650 ?auto_8651 ?auto_8648 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_8661 - OBJ
      ?auto_8663 - OBJ
      ?auto_8664 - OBJ
      ?auto_8665 - OBJ
      ?auto_8662 - LOCATION
    )
    :vars
    (
      ?auto_8666 - LOCATION
      ?auto_8669 - CITY
      ?auto_8667 - TRUCK
      ?auto_8668 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8663 ?auto_8661 ) ( GREATER-THAN ?auto_8664 ?auto_8661 ) ( GREATER-THAN ?auto_8664 ?auto_8663 ) ( GREATER-THAN ?auto_8665 ?auto_8661 ) ( GREATER-THAN ?auto_8665 ?auto_8663 ) ( GREATER-THAN ?auto_8665 ?auto_8664 ) ( IN-CITY ?auto_8666 ?auto_8669 ) ( IN-CITY ?auto_8662 ?auto_8669 ) ( not ( = ?auto_8662 ?auto_8666 ) ) ( OBJ-AT ?auto_8665 ?auto_8666 ) ( OBJ-AT ?auto_8661 ?auto_8662 ) ( OBJ-AT ?auto_8663 ?auto_8662 ) ( not ( = ?auto_8661 ?auto_8663 ) ) ( not ( = ?auto_8661 ?auto_8664 ) ) ( not ( = ?auto_8661 ?auto_8665 ) ) ( not ( = ?auto_8663 ?auto_8664 ) ) ( not ( = ?auto_8663 ?auto_8665 ) ) ( not ( = ?auto_8664 ?auto_8665 ) ) ( TRUCK-AT ?auto_8667 ?auto_8668 ) ( IN-CITY ?auto_8668 ?auto_8669 ) ( not ( = ?auto_8662 ?auto_8668 ) ) ( not ( = ?auto_8666 ?auto_8668 ) ) ( OBJ-AT ?auto_8664 ?auto_8668 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_8664 ?auto_8667 ?auto_8668 )
      ( DELIVER-4PKG ?auto_8661 ?auto_8663 ?auto_8664 ?auto_8665 ?auto_8662 )
      ( DELIVER-4PKG-VERIFY ?auto_8661 ?auto_8663 ?auto_8664 ?auto_8665 ?auto_8662 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_8675 - OBJ
      ?auto_8677 - OBJ
      ?auto_8678 - OBJ
      ?auto_8679 - OBJ
      ?auto_8676 - LOCATION
    )
    :vars
    (
      ?auto_8681 - LOCATION
      ?auto_8683 - CITY
      ?auto_8680 - LOCATION
      ?auto_8682 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8677 ?auto_8675 ) ( GREATER-THAN ?auto_8678 ?auto_8675 ) ( GREATER-THAN ?auto_8678 ?auto_8677 ) ( GREATER-THAN ?auto_8679 ?auto_8675 ) ( GREATER-THAN ?auto_8679 ?auto_8677 ) ( GREATER-THAN ?auto_8679 ?auto_8678 ) ( IN-CITY ?auto_8681 ?auto_8683 ) ( IN-CITY ?auto_8676 ?auto_8683 ) ( not ( = ?auto_8676 ?auto_8681 ) ) ( OBJ-AT ?auto_8679 ?auto_8681 ) ( OBJ-AT ?auto_8675 ?auto_8676 ) ( OBJ-AT ?auto_8677 ?auto_8676 ) ( not ( = ?auto_8675 ?auto_8677 ) ) ( not ( = ?auto_8675 ?auto_8678 ) ) ( not ( = ?auto_8675 ?auto_8679 ) ) ( not ( = ?auto_8677 ?auto_8678 ) ) ( not ( = ?auto_8677 ?auto_8679 ) ) ( not ( = ?auto_8678 ?auto_8679 ) ) ( IN-CITY ?auto_8680 ?auto_8683 ) ( not ( = ?auto_8676 ?auto_8680 ) ) ( not ( = ?auto_8681 ?auto_8680 ) ) ( OBJ-AT ?auto_8678 ?auto_8680 ) ( TRUCK-AT ?auto_8682 ?auto_8676 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8682 ?auto_8676 ?auto_8680 ?auto_8683 )
      ( DELIVER-4PKG ?auto_8675 ?auto_8677 ?auto_8678 ?auto_8679 ?auto_8676 )
      ( DELIVER-4PKG-VERIFY ?auto_8675 ?auto_8677 ?auto_8678 ?auto_8679 ?auto_8676 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_8689 - OBJ
      ?auto_8691 - OBJ
      ?auto_8692 - OBJ
      ?auto_8693 - OBJ
      ?auto_8690 - LOCATION
    )
    :vars
    (
      ?auto_8696 - LOCATION
      ?auto_8695 - CITY
      ?auto_8694 - LOCATION
      ?auto_8697 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8691 ?auto_8689 ) ( GREATER-THAN ?auto_8692 ?auto_8689 ) ( GREATER-THAN ?auto_8692 ?auto_8691 ) ( GREATER-THAN ?auto_8693 ?auto_8689 ) ( GREATER-THAN ?auto_8693 ?auto_8691 ) ( GREATER-THAN ?auto_8693 ?auto_8692 ) ( IN-CITY ?auto_8696 ?auto_8695 ) ( IN-CITY ?auto_8690 ?auto_8695 ) ( not ( = ?auto_8690 ?auto_8696 ) ) ( OBJ-AT ?auto_8693 ?auto_8696 ) ( OBJ-AT ?auto_8689 ?auto_8690 ) ( not ( = ?auto_8689 ?auto_8691 ) ) ( not ( = ?auto_8689 ?auto_8692 ) ) ( not ( = ?auto_8689 ?auto_8693 ) ) ( not ( = ?auto_8691 ?auto_8692 ) ) ( not ( = ?auto_8691 ?auto_8693 ) ) ( not ( = ?auto_8692 ?auto_8693 ) ) ( IN-CITY ?auto_8694 ?auto_8695 ) ( not ( = ?auto_8690 ?auto_8694 ) ) ( not ( = ?auto_8696 ?auto_8694 ) ) ( OBJ-AT ?auto_8692 ?auto_8694 ) ( TRUCK-AT ?auto_8697 ?auto_8690 ) ( IN-TRUCK ?auto_8691 ?auto_8697 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8691 ?auto_8690 )
      ( DELIVER-4PKG ?auto_8689 ?auto_8691 ?auto_8692 ?auto_8693 ?auto_8690 )
      ( DELIVER-4PKG-VERIFY ?auto_8689 ?auto_8691 ?auto_8692 ?auto_8693 ?auto_8690 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_8703 - OBJ
      ?auto_8705 - OBJ
      ?auto_8706 - OBJ
      ?auto_8707 - OBJ
      ?auto_8704 - LOCATION
    )
    :vars
    (
      ?auto_8711 - LOCATION
      ?auto_8708 - CITY
      ?auto_8710 - LOCATION
      ?auto_8709 - TRUCK
      ?auto_8712 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8705 ?auto_8703 ) ( GREATER-THAN ?auto_8706 ?auto_8703 ) ( GREATER-THAN ?auto_8706 ?auto_8705 ) ( GREATER-THAN ?auto_8707 ?auto_8703 ) ( GREATER-THAN ?auto_8707 ?auto_8705 ) ( GREATER-THAN ?auto_8707 ?auto_8706 ) ( IN-CITY ?auto_8711 ?auto_8708 ) ( IN-CITY ?auto_8704 ?auto_8708 ) ( not ( = ?auto_8704 ?auto_8711 ) ) ( OBJ-AT ?auto_8707 ?auto_8711 ) ( OBJ-AT ?auto_8703 ?auto_8704 ) ( not ( = ?auto_8703 ?auto_8705 ) ) ( not ( = ?auto_8703 ?auto_8706 ) ) ( not ( = ?auto_8703 ?auto_8707 ) ) ( not ( = ?auto_8705 ?auto_8706 ) ) ( not ( = ?auto_8705 ?auto_8707 ) ) ( not ( = ?auto_8706 ?auto_8707 ) ) ( IN-CITY ?auto_8710 ?auto_8708 ) ( not ( = ?auto_8704 ?auto_8710 ) ) ( not ( = ?auto_8711 ?auto_8710 ) ) ( OBJ-AT ?auto_8706 ?auto_8710 ) ( IN-TRUCK ?auto_8705 ?auto_8709 ) ( TRUCK-AT ?auto_8709 ?auto_8712 ) ( IN-CITY ?auto_8712 ?auto_8708 ) ( not ( = ?auto_8704 ?auto_8712 ) ) ( not ( = ?auto_8711 ?auto_8712 ) ) ( not ( = ?auto_8710 ?auto_8712 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8709 ?auto_8712 ?auto_8704 ?auto_8708 )
      ( DELIVER-4PKG ?auto_8703 ?auto_8705 ?auto_8706 ?auto_8707 ?auto_8704 )
      ( DELIVER-4PKG-VERIFY ?auto_8703 ?auto_8705 ?auto_8706 ?auto_8707 ?auto_8704 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_8718 - OBJ
      ?auto_8720 - OBJ
      ?auto_8721 - OBJ
      ?auto_8722 - OBJ
      ?auto_8719 - LOCATION
    )
    :vars
    (
      ?auto_8726 - LOCATION
      ?auto_8727 - CITY
      ?auto_8723 - LOCATION
      ?auto_8725 - TRUCK
      ?auto_8724 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8720 ?auto_8718 ) ( GREATER-THAN ?auto_8721 ?auto_8718 ) ( GREATER-THAN ?auto_8721 ?auto_8720 ) ( GREATER-THAN ?auto_8722 ?auto_8718 ) ( GREATER-THAN ?auto_8722 ?auto_8720 ) ( GREATER-THAN ?auto_8722 ?auto_8721 ) ( IN-CITY ?auto_8726 ?auto_8727 ) ( IN-CITY ?auto_8719 ?auto_8727 ) ( not ( = ?auto_8719 ?auto_8726 ) ) ( OBJ-AT ?auto_8722 ?auto_8726 ) ( OBJ-AT ?auto_8718 ?auto_8719 ) ( not ( = ?auto_8718 ?auto_8720 ) ) ( not ( = ?auto_8718 ?auto_8721 ) ) ( not ( = ?auto_8718 ?auto_8722 ) ) ( not ( = ?auto_8720 ?auto_8721 ) ) ( not ( = ?auto_8720 ?auto_8722 ) ) ( not ( = ?auto_8721 ?auto_8722 ) ) ( IN-CITY ?auto_8723 ?auto_8727 ) ( not ( = ?auto_8719 ?auto_8723 ) ) ( not ( = ?auto_8726 ?auto_8723 ) ) ( OBJ-AT ?auto_8721 ?auto_8723 ) ( TRUCK-AT ?auto_8725 ?auto_8724 ) ( IN-CITY ?auto_8724 ?auto_8727 ) ( not ( = ?auto_8719 ?auto_8724 ) ) ( not ( = ?auto_8726 ?auto_8724 ) ) ( not ( = ?auto_8723 ?auto_8724 ) ) ( OBJ-AT ?auto_8720 ?auto_8724 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_8720 ?auto_8725 ?auto_8724 )
      ( DELIVER-4PKG ?auto_8718 ?auto_8720 ?auto_8721 ?auto_8722 ?auto_8719 )
      ( DELIVER-4PKG-VERIFY ?auto_8718 ?auto_8720 ?auto_8721 ?auto_8722 ?auto_8719 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_8733 - OBJ
      ?auto_8735 - OBJ
      ?auto_8736 - OBJ
      ?auto_8737 - OBJ
      ?auto_8734 - LOCATION
    )
    :vars
    (
      ?auto_8742 - LOCATION
      ?auto_8739 - CITY
      ?auto_8738 - LOCATION
      ?auto_8740 - LOCATION
      ?auto_8741 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8735 ?auto_8733 ) ( GREATER-THAN ?auto_8736 ?auto_8733 ) ( GREATER-THAN ?auto_8736 ?auto_8735 ) ( GREATER-THAN ?auto_8737 ?auto_8733 ) ( GREATER-THAN ?auto_8737 ?auto_8735 ) ( GREATER-THAN ?auto_8737 ?auto_8736 ) ( IN-CITY ?auto_8742 ?auto_8739 ) ( IN-CITY ?auto_8734 ?auto_8739 ) ( not ( = ?auto_8734 ?auto_8742 ) ) ( OBJ-AT ?auto_8737 ?auto_8742 ) ( OBJ-AT ?auto_8733 ?auto_8734 ) ( not ( = ?auto_8733 ?auto_8735 ) ) ( not ( = ?auto_8733 ?auto_8736 ) ) ( not ( = ?auto_8733 ?auto_8737 ) ) ( not ( = ?auto_8735 ?auto_8736 ) ) ( not ( = ?auto_8735 ?auto_8737 ) ) ( not ( = ?auto_8736 ?auto_8737 ) ) ( IN-CITY ?auto_8738 ?auto_8739 ) ( not ( = ?auto_8734 ?auto_8738 ) ) ( not ( = ?auto_8742 ?auto_8738 ) ) ( OBJ-AT ?auto_8736 ?auto_8738 ) ( IN-CITY ?auto_8740 ?auto_8739 ) ( not ( = ?auto_8734 ?auto_8740 ) ) ( not ( = ?auto_8742 ?auto_8740 ) ) ( not ( = ?auto_8738 ?auto_8740 ) ) ( OBJ-AT ?auto_8735 ?auto_8740 ) ( TRUCK-AT ?auto_8741 ?auto_8734 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8741 ?auto_8734 ?auto_8740 ?auto_8739 )
      ( DELIVER-4PKG ?auto_8733 ?auto_8735 ?auto_8736 ?auto_8737 ?auto_8734 )
      ( DELIVER-4PKG-VERIFY ?auto_8733 ?auto_8735 ?auto_8736 ?auto_8737 ?auto_8734 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_8748 - OBJ
      ?auto_8750 - OBJ
      ?auto_8751 - OBJ
      ?auto_8752 - OBJ
      ?auto_8749 - LOCATION
    )
    :vars
    (
      ?auto_8754 - LOCATION
      ?auto_8753 - CITY
      ?auto_8756 - LOCATION
      ?auto_8757 - LOCATION
      ?auto_8755 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8750 ?auto_8748 ) ( GREATER-THAN ?auto_8751 ?auto_8748 ) ( GREATER-THAN ?auto_8751 ?auto_8750 ) ( GREATER-THAN ?auto_8752 ?auto_8748 ) ( GREATER-THAN ?auto_8752 ?auto_8750 ) ( GREATER-THAN ?auto_8752 ?auto_8751 ) ( IN-CITY ?auto_8754 ?auto_8753 ) ( IN-CITY ?auto_8749 ?auto_8753 ) ( not ( = ?auto_8749 ?auto_8754 ) ) ( OBJ-AT ?auto_8752 ?auto_8754 ) ( not ( = ?auto_8748 ?auto_8750 ) ) ( not ( = ?auto_8748 ?auto_8751 ) ) ( not ( = ?auto_8748 ?auto_8752 ) ) ( not ( = ?auto_8750 ?auto_8751 ) ) ( not ( = ?auto_8750 ?auto_8752 ) ) ( not ( = ?auto_8751 ?auto_8752 ) ) ( IN-CITY ?auto_8756 ?auto_8753 ) ( not ( = ?auto_8749 ?auto_8756 ) ) ( not ( = ?auto_8754 ?auto_8756 ) ) ( OBJ-AT ?auto_8751 ?auto_8756 ) ( IN-CITY ?auto_8757 ?auto_8753 ) ( not ( = ?auto_8749 ?auto_8757 ) ) ( not ( = ?auto_8754 ?auto_8757 ) ) ( not ( = ?auto_8756 ?auto_8757 ) ) ( OBJ-AT ?auto_8750 ?auto_8757 ) ( TRUCK-AT ?auto_8755 ?auto_8749 ) ( IN-TRUCK ?auto_8748 ?auto_8755 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8748 ?auto_8749 )
      ( DELIVER-4PKG ?auto_8748 ?auto_8750 ?auto_8751 ?auto_8752 ?auto_8749 )
      ( DELIVER-4PKG-VERIFY ?auto_8748 ?auto_8750 ?auto_8751 ?auto_8752 ?auto_8749 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_8763 - OBJ
      ?auto_8765 - OBJ
      ?auto_8766 - OBJ
      ?auto_8767 - OBJ
      ?auto_8764 - LOCATION
    )
    :vars
    (
      ?auto_8771 - LOCATION
      ?auto_8768 - CITY
      ?auto_8770 - LOCATION
      ?auto_8772 - LOCATION
      ?auto_8769 - TRUCK
      ?auto_8773 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8765 ?auto_8763 ) ( GREATER-THAN ?auto_8766 ?auto_8763 ) ( GREATER-THAN ?auto_8766 ?auto_8765 ) ( GREATER-THAN ?auto_8767 ?auto_8763 ) ( GREATER-THAN ?auto_8767 ?auto_8765 ) ( GREATER-THAN ?auto_8767 ?auto_8766 ) ( IN-CITY ?auto_8771 ?auto_8768 ) ( IN-CITY ?auto_8764 ?auto_8768 ) ( not ( = ?auto_8764 ?auto_8771 ) ) ( OBJ-AT ?auto_8767 ?auto_8771 ) ( not ( = ?auto_8763 ?auto_8765 ) ) ( not ( = ?auto_8763 ?auto_8766 ) ) ( not ( = ?auto_8763 ?auto_8767 ) ) ( not ( = ?auto_8765 ?auto_8766 ) ) ( not ( = ?auto_8765 ?auto_8767 ) ) ( not ( = ?auto_8766 ?auto_8767 ) ) ( IN-CITY ?auto_8770 ?auto_8768 ) ( not ( = ?auto_8764 ?auto_8770 ) ) ( not ( = ?auto_8771 ?auto_8770 ) ) ( OBJ-AT ?auto_8766 ?auto_8770 ) ( IN-CITY ?auto_8772 ?auto_8768 ) ( not ( = ?auto_8764 ?auto_8772 ) ) ( not ( = ?auto_8771 ?auto_8772 ) ) ( not ( = ?auto_8770 ?auto_8772 ) ) ( OBJ-AT ?auto_8765 ?auto_8772 ) ( IN-TRUCK ?auto_8763 ?auto_8769 ) ( TRUCK-AT ?auto_8769 ?auto_8773 ) ( IN-CITY ?auto_8773 ?auto_8768 ) ( not ( = ?auto_8764 ?auto_8773 ) ) ( not ( = ?auto_8771 ?auto_8773 ) ) ( not ( = ?auto_8770 ?auto_8773 ) ) ( not ( = ?auto_8772 ?auto_8773 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8769 ?auto_8773 ?auto_8764 ?auto_8768 )
      ( DELIVER-4PKG ?auto_8763 ?auto_8765 ?auto_8766 ?auto_8767 ?auto_8764 )
      ( DELIVER-4PKG-VERIFY ?auto_8763 ?auto_8765 ?auto_8766 ?auto_8767 ?auto_8764 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_8779 - OBJ
      ?auto_8781 - OBJ
      ?auto_8782 - OBJ
      ?auto_8783 - OBJ
      ?auto_8780 - LOCATION
    )
    :vars
    (
      ?auto_8787 - LOCATION
      ?auto_8789 - CITY
      ?auto_8784 - LOCATION
      ?auto_8788 - LOCATION
      ?auto_8786 - TRUCK
      ?auto_8785 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8781 ?auto_8779 ) ( GREATER-THAN ?auto_8782 ?auto_8779 ) ( GREATER-THAN ?auto_8782 ?auto_8781 ) ( GREATER-THAN ?auto_8783 ?auto_8779 ) ( GREATER-THAN ?auto_8783 ?auto_8781 ) ( GREATER-THAN ?auto_8783 ?auto_8782 ) ( IN-CITY ?auto_8787 ?auto_8789 ) ( IN-CITY ?auto_8780 ?auto_8789 ) ( not ( = ?auto_8780 ?auto_8787 ) ) ( OBJ-AT ?auto_8783 ?auto_8787 ) ( not ( = ?auto_8779 ?auto_8781 ) ) ( not ( = ?auto_8779 ?auto_8782 ) ) ( not ( = ?auto_8779 ?auto_8783 ) ) ( not ( = ?auto_8781 ?auto_8782 ) ) ( not ( = ?auto_8781 ?auto_8783 ) ) ( not ( = ?auto_8782 ?auto_8783 ) ) ( IN-CITY ?auto_8784 ?auto_8789 ) ( not ( = ?auto_8780 ?auto_8784 ) ) ( not ( = ?auto_8787 ?auto_8784 ) ) ( OBJ-AT ?auto_8782 ?auto_8784 ) ( IN-CITY ?auto_8788 ?auto_8789 ) ( not ( = ?auto_8780 ?auto_8788 ) ) ( not ( = ?auto_8787 ?auto_8788 ) ) ( not ( = ?auto_8784 ?auto_8788 ) ) ( OBJ-AT ?auto_8781 ?auto_8788 ) ( TRUCK-AT ?auto_8786 ?auto_8785 ) ( IN-CITY ?auto_8785 ?auto_8789 ) ( not ( = ?auto_8780 ?auto_8785 ) ) ( not ( = ?auto_8787 ?auto_8785 ) ) ( not ( = ?auto_8784 ?auto_8785 ) ) ( not ( = ?auto_8788 ?auto_8785 ) ) ( OBJ-AT ?auto_8779 ?auto_8785 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_8779 ?auto_8786 ?auto_8785 )
      ( DELIVER-4PKG ?auto_8779 ?auto_8781 ?auto_8782 ?auto_8783 ?auto_8780 )
      ( DELIVER-4PKG-VERIFY ?auto_8779 ?auto_8781 ?auto_8782 ?auto_8783 ?auto_8780 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_8795 - OBJ
      ?auto_8797 - OBJ
      ?auto_8798 - OBJ
      ?auto_8799 - OBJ
      ?auto_8796 - LOCATION
    )
    :vars
    (
      ?auto_8805 - LOCATION
      ?auto_8800 - CITY
      ?auto_8804 - LOCATION
      ?auto_8803 - LOCATION
      ?auto_8802 - LOCATION
      ?auto_8801 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8797 ?auto_8795 ) ( GREATER-THAN ?auto_8798 ?auto_8795 ) ( GREATER-THAN ?auto_8798 ?auto_8797 ) ( GREATER-THAN ?auto_8799 ?auto_8795 ) ( GREATER-THAN ?auto_8799 ?auto_8797 ) ( GREATER-THAN ?auto_8799 ?auto_8798 ) ( IN-CITY ?auto_8805 ?auto_8800 ) ( IN-CITY ?auto_8796 ?auto_8800 ) ( not ( = ?auto_8796 ?auto_8805 ) ) ( OBJ-AT ?auto_8799 ?auto_8805 ) ( not ( = ?auto_8795 ?auto_8797 ) ) ( not ( = ?auto_8795 ?auto_8798 ) ) ( not ( = ?auto_8795 ?auto_8799 ) ) ( not ( = ?auto_8797 ?auto_8798 ) ) ( not ( = ?auto_8797 ?auto_8799 ) ) ( not ( = ?auto_8798 ?auto_8799 ) ) ( IN-CITY ?auto_8804 ?auto_8800 ) ( not ( = ?auto_8796 ?auto_8804 ) ) ( not ( = ?auto_8805 ?auto_8804 ) ) ( OBJ-AT ?auto_8798 ?auto_8804 ) ( IN-CITY ?auto_8803 ?auto_8800 ) ( not ( = ?auto_8796 ?auto_8803 ) ) ( not ( = ?auto_8805 ?auto_8803 ) ) ( not ( = ?auto_8804 ?auto_8803 ) ) ( OBJ-AT ?auto_8797 ?auto_8803 ) ( IN-CITY ?auto_8802 ?auto_8800 ) ( not ( = ?auto_8796 ?auto_8802 ) ) ( not ( = ?auto_8805 ?auto_8802 ) ) ( not ( = ?auto_8804 ?auto_8802 ) ) ( not ( = ?auto_8803 ?auto_8802 ) ) ( OBJ-AT ?auto_8795 ?auto_8802 ) ( TRUCK-AT ?auto_8801 ?auto_8796 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8801 ?auto_8796 ?auto_8802 ?auto_8800 )
      ( DELIVER-4PKG ?auto_8795 ?auto_8797 ?auto_8798 ?auto_8799 ?auto_8796 )
      ( DELIVER-4PKG-VERIFY ?auto_8795 ?auto_8797 ?auto_8798 ?auto_8799 ?auto_8796 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8838 - OBJ
      ?auto_8840 - OBJ
      ?auto_8841 - OBJ
      ?auto_8842 - OBJ
      ?auto_8843 - OBJ
      ?auto_8839 - LOCATION
    )
    :vars
    (
      ?auto_8844 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8840 ?auto_8838 ) ( GREATER-THAN ?auto_8841 ?auto_8838 ) ( GREATER-THAN ?auto_8841 ?auto_8840 ) ( GREATER-THAN ?auto_8842 ?auto_8838 ) ( GREATER-THAN ?auto_8842 ?auto_8840 ) ( GREATER-THAN ?auto_8842 ?auto_8841 ) ( GREATER-THAN ?auto_8843 ?auto_8838 ) ( GREATER-THAN ?auto_8843 ?auto_8840 ) ( GREATER-THAN ?auto_8843 ?auto_8841 ) ( GREATER-THAN ?auto_8843 ?auto_8842 ) ( TRUCK-AT ?auto_8844 ?auto_8839 ) ( IN-TRUCK ?auto_8843 ?auto_8844 ) ( OBJ-AT ?auto_8838 ?auto_8839 ) ( OBJ-AT ?auto_8840 ?auto_8839 ) ( OBJ-AT ?auto_8841 ?auto_8839 ) ( OBJ-AT ?auto_8842 ?auto_8839 ) ( not ( = ?auto_8838 ?auto_8840 ) ) ( not ( = ?auto_8838 ?auto_8841 ) ) ( not ( = ?auto_8838 ?auto_8842 ) ) ( not ( = ?auto_8838 ?auto_8843 ) ) ( not ( = ?auto_8840 ?auto_8841 ) ) ( not ( = ?auto_8840 ?auto_8842 ) ) ( not ( = ?auto_8840 ?auto_8843 ) ) ( not ( = ?auto_8841 ?auto_8842 ) ) ( not ( = ?auto_8841 ?auto_8843 ) ) ( not ( = ?auto_8842 ?auto_8843 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8843 ?auto_8839 )
      ( DELIVER-5PKG-VERIFY ?auto_8838 ?auto_8840 ?auto_8841 ?auto_8842 ?auto_8843 ?auto_8839 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8851 - OBJ
      ?auto_8853 - OBJ
      ?auto_8854 - OBJ
      ?auto_8855 - OBJ
      ?auto_8856 - OBJ
      ?auto_8852 - LOCATION
    )
    :vars
    (
      ?auto_8858 - TRUCK
      ?auto_8859 - LOCATION
      ?auto_8857 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8853 ?auto_8851 ) ( GREATER-THAN ?auto_8854 ?auto_8851 ) ( GREATER-THAN ?auto_8854 ?auto_8853 ) ( GREATER-THAN ?auto_8855 ?auto_8851 ) ( GREATER-THAN ?auto_8855 ?auto_8853 ) ( GREATER-THAN ?auto_8855 ?auto_8854 ) ( GREATER-THAN ?auto_8856 ?auto_8851 ) ( GREATER-THAN ?auto_8856 ?auto_8853 ) ( GREATER-THAN ?auto_8856 ?auto_8854 ) ( GREATER-THAN ?auto_8856 ?auto_8855 ) ( IN-TRUCK ?auto_8856 ?auto_8858 ) ( TRUCK-AT ?auto_8858 ?auto_8859 ) ( IN-CITY ?auto_8859 ?auto_8857 ) ( IN-CITY ?auto_8852 ?auto_8857 ) ( not ( = ?auto_8852 ?auto_8859 ) ) ( OBJ-AT ?auto_8851 ?auto_8852 ) ( OBJ-AT ?auto_8853 ?auto_8852 ) ( OBJ-AT ?auto_8854 ?auto_8852 ) ( OBJ-AT ?auto_8855 ?auto_8852 ) ( not ( = ?auto_8851 ?auto_8853 ) ) ( not ( = ?auto_8851 ?auto_8854 ) ) ( not ( = ?auto_8851 ?auto_8855 ) ) ( not ( = ?auto_8851 ?auto_8856 ) ) ( not ( = ?auto_8853 ?auto_8854 ) ) ( not ( = ?auto_8853 ?auto_8855 ) ) ( not ( = ?auto_8853 ?auto_8856 ) ) ( not ( = ?auto_8854 ?auto_8855 ) ) ( not ( = ?auto_8854 ?auto_8856 ) ) ( not ( = ?auto_8855 ?auto_8856 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8856 ?auto_8852 )
      ( DELIVER-5PKG-VERIFY ?auto_8851 ?auto_8853 ?auto_8854 ?auto_8855 ?auto_8856 ?auto_8852 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8866 - OBJ
      ?auto_8868 - OBJ
      ?auto_8869 - OBJ
      ?auto_8870 - OBJ
      ?auto_8871 - OBJ
      ?auto_8867 - LOCATION
    )
    :vars
    (
      ?auto_8872 - TRUCK
      ?auto_8874 - LOCATION
      ?auto_8873 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8868 ?auto_8866 ) ( GREATER-THAN ?auto_8869 ?auto_8866 ) ( GREATER-THAN ?auto_8869 ?auto_8868 ) ( GREATER-THAN ?auto_8870 ?auto_8866 ) ( GREATER-THAN ?auto_8870 ?auto_8868 ) ( GREATER-THAN ?auto_8870 ?auto_8869 ) ( GREATER-THAN ?auto_8871 ?auto_8866 ) ( GREATER-THAN ?auto_8871 ?auto_8868 ) ( GREATER-THAN ?auto_8871 ?auto_8869 ) ( GREATER-THAN ?auto_8871 ?auto_8870 ) ( TRUCK-AT ?auto_8872 ?auto_8874 ) ( IN-CITY ?auto_8874 ?auto_8873 ) ( IN-CITY ?auto_8867 ?auto_8873 ) ( not ( = ?auto_8867 ?auto_8874 ) ) ( OBJ-AT ?auto_8871 ?auto_8874 ) ( OBJ-AT ?auto_8866 ?auto_8867 ) ( OBJ-AT ?auto_8868 ?auto_8867 ) ( OBJ-AT ?auto_8869 ?auto_8867 ) ( OBJ-AT ?auto_8870 ?auto_8867 ) ( not ( = ?auto_8866 ?auto_8868 ) ) ( not ( = ?auto_8866 ?auto_8869 ) ) ( not ( = ?auto_8866 ?auto_8870 ) ) ( not ( = ?auto_8866 ?auto_8871 ) ) ( not ( = ?auto_8868 ?auto_8869 ) ) ( not ( = ?auto_8868 ?auto_8870 ) ) ( not ( = ?auto_8868 ?auto_8871 ) ) ( not ( = ?auto_8869 ?auto_8870 ) ) ( not ( = ?auto_8869 ?auto_8871 ) ) ( not ( = ?auto_8870 ?auto_8871 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8871 ?auto_8867 )
      ( DELIVER-5PKG-VERIFY ?auto_8866 ?auto_8868 ?auto_8869 ?auto_8870 ?auto_8871 ?auto_8867 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8881 - OBJ
      ?auto_8883 - OBJ
      ?auto_8884 - OBJ
      ?auto_8885 - OBJ
      ?auto_8886 - OBJ
      ?auto_8882 - LOCATION
    )
    :vars
    (
      ?auto_8887 - LOCATION
      ?auto_8888 - CITY
      ?auto_8889 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8883 ?auto_8881 ) ( GREATER-THAN ?auto_8884 ?auto_8881 ) ( GREATER-THAN ?auto_8884 ?auto_8883 ) ( GREATER-THAN ?auto_8885 ?auto_8881 ) ( GREATER-THAN ?auto_8885 ?auto_8883 ) ( GREATER-THAN ?auto_8885 ?auto_8884 ) ( GREATER-THAN ?auto_8886 ?auto_8881 ) ( GREATER-THAN ?auto_8886 ?auto_8883 ) ( GREATER-THAN ?auto_8886 ?auto_8884 ) ( GREATER-THAN ?auto_8886 ?auto_8885 ) ( IN-CITY ?auto_8887 ?auto_8888 ) ( IN-CITY ?auto_8882 ?auto_8888 ) ( not ( = ?auto_8882 ?auto_8887 ) ) ( OBJ-AT ?auto_8886 ?auto_8887 ) ( TRUCK-AT ?auto_8889 ?auto_8882 ) ( OBJ-AT ?auto_8881 ?auto_8882 ) ( OBJ-AT ?auto_8883 ?auto_8882 ) ( OBJ-AT ?auto_8884 ?auto_8882 ) ( OBJ-AT ?auto_8885 ?auto_8882 ) ( not ( = ?auto_8881 ?auto_8883 ) ) ( not ( = ?auto_8881 ?auto_8884 ) ) ( not ( = ?auto_8881 ?auto_8885 ) ) ( not ( = ?auto_8881 ?auto_8886 ) ) ( not ( = ?auto_8883 ?auto_8884 ) ) ( not ( = ?auto_8883 ?auto_8885 ) ) ( not ( = ?auto_8883 ?auto_8886 ) ) ( not ( = ?auto_8884 ?auto_8885 ) ) ( not ( = ?auto_8884 ?auto_8886 ) ) ( not ( = ?auto_8885 ?auto_8886 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8886 ?auto_8882 )
      ( DELIVER-5PKG-VERIFY ?auto_8881 ?auto_8883 ?auto_8884 ?auto_8885 ?auto_8886 ?auto_8882 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8896 - OBJ
      ?auto_8898 - OBJ
      ?auto_8899 - OBJ
      ?auto_8900 - OBJ
      ?auto_8901 - OBJ
      ?auto_8897 - LOCATION
    )
    :vars
    (
      ?auto_8904 - LOCATION
      ?auto_8902 - CITY
      ?auto_8903 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8898 ?auto_8896 ) ( GREATER-THAN ?auto_8899 ?auto_8896 ) ( GREATER-THAN ?auto_8899 ?auto_8898 ) ( GREATER-THAN ?auto_8900 ?auto_8896 ) ( GREATER-THAN ?auto_8900 ?auto_8898 ) ( GREATER-THAN ?auto_8900 ?auto_8899 ) ( GREATER-THAN ?auto_8901 ?auto_8896 ) ( GREATER-THAN ?auto_8901 ?auto_8898 ) ( GREATER-THAN ?auto_8901 ?auto_8899 ) ( GREATER-THAN ?auto_8901 ?auto_8900 ) ( IN-CITY ?auto_8904 ?auto_8902 ) ( IN-CITY ?auto_8897 ?auto_8902 ) ( not ( = ?auto_8897 ?auto_8904 ) ) ( OBJ-AT ?auto_8901 ?auto_8904 ) ( TRUCK-AT ?auto_8903 ?auto_8897 ) ( OBJ-AT ?auto_8896 ?auto_8897 ) ( OBJ-AT ?auto_8898 ?auto_8897 ) ( OBJ-AT ?auto_8899 ?auto_8897 ) ( not ( = ?auto_8896 ?auto_8898 ) ) ( not ( = ?auto_8896 ?auto_8899 ) ) ( not ( = ?auto_8896 ?auto_8900 ) ) ( not ( = ?auto_8896 ?auto_8901 ) ) ( not ( = ?auto_8898 ?auto_8899 ) ) ( not ( = ?auto_8898 ?auto_8900 ) ) ( not ( = ?auto_8898 ?auto_8901 ) ) ( not ( = ?auto_8899 ?auto_8900 ) ) ( not ( = ?auto_8899 ?auto_8901 ) ) ( not ( = ?auto_8900 ?auto_8901 ) ) ( IN-TRUCK ?auto_8900 ?auto_8903 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8900 ?auto_8897 )
      ( DELIVER-5PKG ?auto_8896 ?auto_8898 ?auto_8899 ?auto_8900 ?auto_8901 ?auto_8897 )
      ( DELIVER-5PKG-VERIFY ?auto_8896 ?auto_8898 ?auto_8899 ?auto_8900 ?auto_8901 ?auto_8897 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8911 - OBJ
      ?auto_8913 - OBJ
      ?auto_8914 - OBJ
      ?auto_8915 - OBJ
      ?auto_8916 - OBJ
      ?auto_8912 - LOCATION
    )
    :vars
    (
      ?auto_8917 - LOCATION
      ?auto_8918 - CITY
      ?auto_8919 - TRUCK
      ?auto_8920 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8913 ?auto_8911 ) ( GREATER-THAN ?auto_8914 ?auto_8911 ) ( GREATER-THAN ?auto_8914 ?auto_8913 ) ( GREATER-THAN ?auto_8915 ?auto_8911 ) ( GREATER-THAN ?auto_8915 ?auto_8913 ) ( GREATER-THAN ?auto_8915 ?auto_8914 ) ( GREATER-THAN ?auto_8916 ?auto_8911 ) ( GREATER-THAN ?auto_8916 ?auto_8913 ) ( GREATER-THAN ?auto_8916 ?auto_8914 ) ( GREATER-THAN ?auto_8916 ?auto_8915 ) ( IN-CITY ?auto_8917 ?auto_8918 ) ( IN-CITY ?auto_8912 ?auto_8918 ) ( not ( = ?auto_8912 ?auto_8917 ) ) ( OBJ-AT ?auto_8916 ?auto_8917 ) ( OBJ-AT ?auto_8911 ?auto_8912 ) ( OBJ-AT ?auto_8913 ?auto_8912 ) ( OBJ-AT ?auto_8914 ?auto_8912 ) ( not ( = ?auto_8911 ?auto_8913 ) ) ( not ( = ?auto_8911 ?auto_8914 ) ) ( not ( = ?auto_8911 ?auto_8915 ) ) ( not ( = ?auto_8911 ?auto_8916 ) ) ( not ( = ?auto_8913 ?auto_8914 ) ) ( not ( = ?auto_8913 ?auto_8915 ) ) ( not ( = ?auto_8913 ?auto_8916 ) ) ( not ( = ?auto_8914 ?auto_8915 ) ) ( not ( = ?auto_8914 ?auto_8916 ) ) ( not ( = ?auto_8915 ?auto_8916 ) ) ( IN-TRUCK ?auto_8915 ?auto_8919 ) ( TRUCK-AT ?auto_8919 ?auto_8920 ) ( IN-CITY ?auto_8920 ?auto_8918 ) ( not ( = ?auto_8912 ?auto_8920 ) ) ( not ( = ?auto_8917 ?auto_8920 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8919 ?auto_8920 ?auto_8912 ?auto_8918 )
      ( DELIVER-5PKG ?auto_8911 ?auto_8913 ?auto_8914 ?auto_8915 ?auto_8916 ?auto_8912 )
      ( DELIVER-5PKG-VERIFY ?auto_8911 ?auto_8913 ?auto_8914 ?auto_8915 ?auto_8916 ?auto_8912 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8927 - OBJ
      ?auto_8929 - OBJ
      ?auto_8930 - OBJ
      ?auto_8931 - OBJ
      ?auto_8932 - OBJ
      ?auto_8928 - LOCATION
    )
    :vars
    (
      ?auto_8935 - LOCATION
      ?auto_8933 - CITY
      ?auto_8936 - TRUCK
      ?auto_8934 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8929 ?auto_8927 ) ( GREATER-THAN ?auto_8930 ?auto_8927 ) ( GREATER-THAN ?auto_8930 ?auto_8929 ) ( GREATER-THAN ?auto_8931 ?auto_8927 ) ( GREATER-THAN ?auto_8931 ?auto_8929 ) ( GREATER-THAN ?auto_8931 ?auto_8930 ) ( GREATER-THAN ?auto_8932 ?auto_8927 ) ( GREATER-THAN ?auto_8932 ?auto_8929 ) ( GREATER-THAN ?auto_8932 ?auto_8930 ) ( GREATER-THAN ?auto_8932 ?auto_8931 ) ( IN-CITY ?auto_8935 ?auto_8933 ) ( IN-CITY ?auto_8928 ?auto_8933 ) ( not ( = ?auto_8928 ?auto_8935 ) ) ( OBJ-AT ?auto_8932 ?auto_8935 ) ( OBJ-AT ?auto_8927 ?auto_8928 ) ( OBJ-AT ?auto_8929 ?auto_8928 ) ( OBJ-AT ?auto_8930 ?auto_8928 ) ( not ( = ?auto_8927 ?auto_8929 ) ) ( not ( = ?auto_8927 ?auto_8930 ) ) ( not ( = ?auto_8927 ?auto_8931 ) ) ( not ( = ?auto_8927 ?auto_8932 ) ) ( not ( = ?auto_8929 ?auto_8930 ) ) ( not ( = ?auto_8929 ?auto_8931 ) ) ( not ( = ?auto_8929 ?auto_8932 ) ) ( not ( = ?auto_8930 ?auto_8931 ) ) ( not ( = ?auto_8930 ?auto_8932 ) ) ( not ( = ?auto_8931 ?auto_8932 ) ) ( TRUCK-AT ?auto_8936 ?auto_8934 ) ( IN-CITY ?auto_8934 ?auto_8933 ) ( not ( = ?auto_8928 ?auto_8934 ) ) ( not ( = ?auto_8935 ?auto_8934 ) ) ( OBJ-AT ?auto_8931 ?auto_8934 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_8931 ?auto_8936 ?auto_8934 )
      ( DELIVER-5PKG ?auto_8927 ?auto_8929 ?auto_8930 ?auto_8931 ?auto_8932 ?auto_8928 )
      ( DELIVER-5PKG-VERIFY ?auto_8927 ?auto_8929 ?auto_8930 ?auto_8931 ?auto_8932 ?auto_8928 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8943 - OBJ
      ?auto_8945 - OBJ
      ?auto_8946 - OBJ
      ?auto_8947 - OBJ
      ?auto_8948 - OBJ
      ?auto_8944 - LOCATION
    )
    :vars
    (
      ?auto_8951 - LOCATION
      ?auto_8950 - CITY
      ?auto_8949 - LOCATION
      ?auto_8952 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8945 ?auto_8943 ) ( GREATER-THAN ?auto_8946 ?auto_8943 ) ( GREATER-THAN ?auto_8946 ?auto_8945 ) ( GREATER-THAN ?auto_8947 ?auto_8943 ) ( GREATER-THAN ?auto_8947 ?auto_8945 ) ( GREATER-THAN ?auto_8947 ?auto_8946 ) ( GREATER-THAN ?auto_8948 ?auto_8943 ) ( GREATER-THAN ?auto_8948 ?auto_8945 ) ( GREATER-THAN ?auto_8948 ?auto_8946 ) ( GREATER-THAN ?auto_8948 ?auto_8947 ) ( IN-CITY ?auto_8951 ?auto_8950 ) ( IN-CITY ?auto_8944 ?auto_8950 ) ( not ( = ?auto_8944 ?auto_8951 ) ) ( OBJ-AT ?auto_8948 ?auto_8951 ) ( OBJ-AT ?auto_8943 ?auto_8944 ) ( OBJ-AT ?auto_8945 ?auto_8944 ) ( OBJ-AT ?auto_8946 ?auto_8944 ) ( not ( = ?auto_8943 ?auto_8945 ) ) ( not ( = ?auto_8943 ?auto_8946 ) ) ( not ( = ?auto_8943 ?auto_8947 ) ) ( not ( = ?auto_8943 ?auto_8948 ) ) ( not ( = ?auto_8945 ?auto_8946 ) ) ( not ( = ?auto_8945 ?auto_8947 ) ) ( not ( = ?auto_8945 ?auto_8948 ) ) ( not ( = ?auto_8946 ?auto_8947 ) ) ( not ( = ?auto_8946 ?auto_8948 ) ) ( not ( = ?auto_8947 ?auto_8948 ) ) ( IN-CITY ?auto_8949 ?auto_8950 ) ( not ( = ?auto_8944 ?auto_8949 ) ) ( not ( = ?auto_8951 ?auto_8949 ) ) ( OBJ-AT ?auto_8947 ?auto_8949 ) ( TRUCK-AT ?auto_8952 ?auto_8944 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8952 ?auto_8944 ?auto_8949 ?auto_8950 )
      ( DELIVER-5PKG ?auto_8943 ?auto_8945 ?auto_8946 ?auto_8947 ?auto_8948 ?auto_8944 )
      ( DELIVER-5PKG-VERIFY ?auto_8943 ?auto_8945 ?auto_8946 ?auto_8947 ?auto_8948 ?auto_8944 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8959 - OBJ
      ?auto_8961 - OBJ
      ?auto_8962 - OBJ
      ?auto_8963 - OBJ
      ?auto_8964 - OBJ
      ?auto_8960 - LOCATION
    )
    :vars
    (
      ?auto_8966 - LOCATION
      ?auto_8965 - CITY
      ?auto_8967 - LOCATION
      ?auto_8968 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8961 ?auto_8959 ) ( GREATER-THAN ?auto_8962 ?auto_8959 ) ( GREATER-THAN ?auto_8962 ?auto_8961 ) ( GREATER-THAN ?auto_8963 ?auto_8959 ) ( GREATER-THAN ?auto_8963 ?auto_8961 ) ( GREATER-THAN ?auto_8963 ?auto_8962 ) ( GREATER-THAN ?auto_8964 ?auto_8959 ) ( GREATER-THAN ?auto_8964 ?auto_8961 ) ( GREATER-THAN ?auto_8964 ?auto_8962 ) ( GREATER-THAN ?auto_8964 ?auto_8963 ) ( IN-CITY ?auto_8966 ?auto_8965 ) ( IN-CITY ?auto_8960 ?auto_8965 ) ( not ( = ?auto_8960 ?auto_8966 ) ) ( OBJ-AT ?auto_8964 ?auto_8966 ) ( OBJ-AT ?auto_8959 ?auto_8960 ) ( OBJ-AT ?auto_8961 ?auto_8960 ) ( not ( = ?auto_8959 ?auto_8961 ) ) ( not ( = ?auto_8959 ?auto_8962 ) ) ( not ( = ?auto_8959 ?auto_8963 ) ) ( not ( = ?auto_8959 ?auto_8964 ) ) ( not ( = ?auto_8961 ?auto_8962 ) ) ( not ( = ?auto_8961 ?auto_8963 ) ) ( not ( = ?auto_8961 ?auto_8964 ) ) ( not ( = ?auto_8962 ?auto_8963 ) ) ( not ( = ?auto_8962 ?auto_8964 ) ) ( not ( = ?auto_8963 ?auto_8964 ) ) ( IN-CITY ?auto_8967 ?auto_8965 ) ( not ( = ?auto_8960 ?auto_8967 ) ) ( not ( = ?auto_8966 ?auto_8967 ) ) ( OBJ-AT ?auto_8963 ?auto_8967 ) ( TRUCK-AT ?auto_8968 ?auto_8960 ) ( IN-TRUCK ?auto_8962 ?auto_8968 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8962 ?auto_8960 )
      ( DELIVER-5PKG ?auto_8959 ?auto_8961 ?auto_8962 ?auto_8963 ?auto_8964 ?auto_8960 )
      ( DELIVER-5PKG-VERIFY ?auto_8959 ?auto_8961 ?auto_8962 ?auto_8963 ?auto_8964 ?auto_8960 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8975 - OBJ
      ?auto_8977 - OBJ
      ?auto_8978 - OBJ
      ?auto_8979 - OBJ
      ?auto_8980 - OBJ
      ?auto_8976 - LOCATION
    )
    :vars
    (
      ?auto_8984 - LOCATION
      ?auto_8982 - CITY
      ?auto_8983 - LOCATION
      ?auto_8981 - TRUCK
      ?auto_8985 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8977 ?auto_8975 ) ( GREATER-THAN ?auto_8978 ?auto_8975 ) ( GREATER-THAN ?auto_8978 ?auto_8977 ) ( GREATER-THAN ?auto_8979 ?auto_8975 ) ( GREATER-THAN ?auto_8979 ?auto_8977 ) ( GREATER-THAN ?auto_8979 ?auto_8978 ) ( GREATER-THAN ?auto_8980 ?auto_8975 ) ( GREATER-THAN ?auto_8980 ?auto_8977 ) ( GREATER-THAN ?auto_8980 ?auto_8978 ) ( GREATER-THAN ?auto_8980 ?auto_8979 ) ( IN-CITY ?auto_8984 ?auto_8982 ) ( IN-CITY ?auto_8976 ?auto_8982 ) ( not ( = ?auto_8976 ?auto_8984 ) ) ( OBJ-AT ?auto_8980 ?auto_8984 ) ( OBJ-AT ?auto_8975 ?auto_8976 ) ( OBJ-AT ?auto_8977 ?auto_8976 ) ( not ( = ?auto_8975 ?auto_8977 ) ) ( not ( = ?auto_8975 ?auto_8978 ) ) ( not ( = ?auto_8975 ?auto_8979 ) ) ( not ( = ?auto_8975 ?auto_8980 ) ) ( not ( = ?auto_8977 ?auto_8978 ) ) ( not ( = ?auto_8977 ?auto_8979 ) ) ( not ( = ?auto_8977 ?auto_8980 ) ) ( not ( = ?auto_8978 ?auto_8979 ) ) ( not ( = ?auto_8978 ?auto_8980 ) ) ( not ( = ?auto_8979 ?auto_8980 ) ) ( IN-CITY ?auto_8983 ?auto_8982 ) ( not ( = ?auto_8976 ?auto_8983 ) ) ( not ( = ?auto_8984 ?auto_8983 ) ) ( OBJ-AT ?auto_8979 ?auto_8983 ) ( IN-TRUCK ?auto_8978 ?auto_8981 ) ( TRUCK-AT ?auto_8981 ?auto_8985 ) ( IN-CITY ?auto_8985 ?auto_8982 ) ( not ( = ?auto_8976 ?auto_8985 ) ) ( not ( = ?auto_8984 ?auto_8985 ) ) ( not ( = ?auto_8983 ?auto_8985 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8981 ?auto_8985 ?auto_8976 ?auto_8982 )
      ( DELIVER-5PKG ?auto_8975 ?auto_8977 ?auto_8978 ?auto_8979 ?auto_8980 ?auto_8976 )
      ( DELIVER-5PKG-VERIFY ?auto_8975 ?auto_8977 ?auto_8978 ?auto_8979 ?auto_8980 ?auto_8976 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_8992 - OBJ
      ?auto_8994 - OBJ
      ?auto_8995 - OBJ
      ?auto_8996 - OBJ
      ?auto_8997 - OBJ
      ?auto_8993 - LOCATION
    )
    :vars
    (
      ?auto_8998 - LOCATION
      ?auto_9001 - CITY
      ?auto_9002 - LOCATION
      ?auto_8999 - TRUCK
      ?auto_9000 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_8994 ?auto_8992 ) ( GREATER-THAN ?auto_8995 ?auto_8992 ) ( GREATER-THAN ?auto_8995 ?auto_8994 ) ( GREATER-THAN ?auto_8996 ?auto_8992 ) ( GREATER-THAN ?auto_8996 ?auto_8994 ) ( GREATER-THAN ?auto_8996 ?auto_8995 ) ( GREATER-THAN ?auto_8997 ?auto_8992 ) ( GREATER-THAN ?auto_8997 ?auto_8994 ) ( GREATER-THAN ?auto_8997 ?auto_8995 ) ( GREATER-THAN ?auto_8997 ?auto_8996 ) ( IN-CITY ?auto_8998 ?auto_9001 ) ( IN-CITY ?auto_8993 ?auto_9001 ) ( not ( = ?auto_8993 ?auto_8998 ) ) ( OBJ-AT ?auto_8997 ?auto_8998 ) ( OBJ-AT ?auto_8992 ?auto_8993 ) ( OBJ-AT ?auto_8994 ?auto_8993 ) ( not ( = ?auto_8992 ?auto_8994 ) ) ( not ( = ?auto_8992 ?auto_8995 ) ) ( not ( = ?auto_8992 ?auto_8996 ) ) ( not ( = ?auto_8992 ?auto_8997 ) ) ( not ( = ?auto_8994 ?auto_8995 ) ) ( not ( = ?auto_8994 ?auto_8996 ) ) ( not ( = ?auto_8994 ?auto_8997 ) ) ( not ( = ?auto_8995 ?auto_8996 ) ) ( not ( = ?auto_8995 ?auto_8997 ) ) ( not ( = ?auto_8996 ?auto_8997 ) ) ( IN-CITY ?auto_9002 ?auto_9001 ) ( not ( = ?auto_8993 ?auto_9002 ) ) ( not ( = ?auto_8998 ?auto_9002 ) ) ( OBJ-AT ?auto_8996 ?auto_9002 ) ( TRUCK-AT ?auto_8999 ?auto_9000 ) ( IN-CITY ?auto_9000 ?auto_9001 ) ( not ( = ?auto_8993 ?auto_9000 ) ) ( not ( = ?auto_8998 ?auto_9000 ) ) ( not ( = ?auto_9002 ?auto_9000 ) ) ( OBJ-AT ?auto_8995 ?auto_9000 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_8995 ?auto_8999 ?auto_9000 )
      ( DELIVER-5PKG ?auto_8992 ?auto_8994 ?auto_8995 ?auto_8996 ?auto_8997 ?auto_8993 )
      ( DELIVER-5PKG-VERIFY ?auto_8992 ?auto_8994 ?auto_8995 ?auto_8996 ?auto_8997 ?auto_8993 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9009 - OBJ
      ?auto_9011 - OBJ
      ?auto_9012 - OBJ
      ?auto_9013 - OBJ
      ?auto_9014 - OBJ
      ?auto_9010 - LOCATION
    )
    :vars
    (
      ?auto_9018 - LOCATION
      ?auto_9017 - CITY
      ?auto_9016 - LOCATION
      ?auto_9015 - LOCATION
      ?auto_9019 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9011 ?auto_9009 ) ( GREATER-THAN ?auto_9012 ?auto_9009 ) ( GREATER-THAN ?auto_9012 ?auto_9011 ) ( GREATER-THAN ?auto_9013 ?auto_9009 ) ( GREATER-THAN ?auto_9013 ?auto_9011 ) ( GREATER-THAN ?auto_9013 ?auto_9012 ) ( GREATER-THAN ?auto_9014 ?auto_9009 ) ( GREATER-THAN ?auto_9014 ?auto_9011 ) ( GREATER-THAN ?auto_9014 ?auto_9012 ) ( GREATER-THAN ?auto_9014 ?auto_9013 ) ( IN-CITY ?auto_9018 ?auto_9017 ) ( IN-CITY ?auto_9010 ?auto_9017 ) ( not ( = ?auto_9010 ?auto_9018 ) ) ( OBJ-AT ?auto_9014 ?auto_9018 ) ( OBJ-AT ?auto_9009 ?auto_9010 ) ( OBJ-AT ?auto_9011 ?auto_9010 ) ( not ( = ?auto_9009 ?auto_9011 ) ) ( not ( = ?auto_9009 ?auto_9012 ) ) ( not ( = ?auto_9009 ?auto_9013 ) ) ( not ( = ?auto_9009 ?auto_9014 ) ) ( not ( = ?auto_9011 ?auto_9012 ) ) ( not ( = ?auto_9011 ?auto_9013 ) ) ( not ( = ?auto_9011 ?auto_9014 ) ) ( not ( = ?auto_9012 ?auto_9013 ) ) ( not ( = ?auto_9012 ?auto_9014 ) ) ( not ( = ?auto_9013 ?auto_9014 ) ) ( IN-CITY ?auto_9016 ?auto_9017 ) ( not ( = ?auto_9010 ?auto_9016 ) ) ( not ( = ?auto_9018 ?auto_9016 ) ) ( OBJ-AT ?auto_9013 ?auto_9016 ) ( IN-CITY ?auto_9015 ?auto_9017 ) ( not ( = ?auto_9010 ?auto_9015 ) ) ( not ( = ?auto_9018 ?auto_9015 ) ) ( not ( = ?auto_9016 ?auto_9015 ) ) ( OBJ-AT ?auto_9012 ?auto_9015 ) ( TRUCK-AT ?auto_9019 ?auto_9010 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9019 ?auto_9010 ?auto_9015 ?auto_9017 )
      ( DELIVER-5PKG ?auto_9009 ?auto_9011 ?auto_9012 ?auto_9013 ?auto_9014 ?auto_9010 )
      ( DELIVER-5PKG-VERIFY ?auto_9009 ?auto_9011 ?auto_9012 ?auto_9013 ?auto_9014 ?auto_9010 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9026 - OBJ
      ?auto_9028 - OBJ
      ?auto_9029 - OBJ
      ?auto_9030 - OBJ
      ?auto_9031 - OBJ
      ?auto_9027 - LOCATION
    )
    :vars
    (
      ?auto_9035 - LOCATION
      ?auto_9034 - CITY
      ?auto_9033 - LOCATION
      ?auto_9036 - LOCATION
      ?auto_9032 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9028 ?auto_9026 ) ( GREATER-THAN ?auto_9029 ?auto_9026 ) ( GREATER-THAN ?auto_9029 ?auto_9028 ) ( GREATER-THAN ?auto_9030 ?auto_9026 ) ( GREATER-THAN ?auto_9030 ?auto_9028 ) ( GREATER-THAN ?auto_9030 ?auto_9029 ) ( GREATER-THAN ?auto_9031 ?auto_9026 ) ( GREATER-THAN ?auto_9031 ?auto_9028 ) ( GREATER-THAN ?auto_9031 ?auto_9029 ) ( GREATER-THAN ?auto_9031 ?auto_9030 ) ( IN-CITY ?auto_9035 ?auto_9034 ) ( IN-CITY ?auto_9027 ?auto_9034 ) ( not ( = ?auto_9027 ?auto_9035 ) ) ( OBJ-AT ?auto_9031 ?auto_9035 ) ( OBJ-AT ?auto_9026 ?auto_9027 ) ( not ( = ?auto_9026 ?auto_9028 ) ) ( not ( = ?auto_9026 ?auto_9029 ) ) ( not ( = ?auto_9026 ?auto_9030 ) ) ( not ( = ?auto_9026 ?auto_9031 ) ) ( not ( = ?auto_9028 ?auto_9029 ) ) ( not ( = ?auto_9028 ?auto_9030 ) ) ( not ( = ?auto_9028 ?auto_9031 ) ) ( not ( = ?auto_9029 ?auto_9030 ) ) ( not ( = ?auto_9029 ?auto_9031 ) ) ( not ( = ?auto_9030 ?auto_9031 ) ) ( IN-CITY ?auto_9033 ?auto_9034 ) ( not ( = ?auto_9027 ?auto_9033 ) ) ( not ( = ?auto_9035 ?auto_9033 ) ) ( OBJ-AT ?auto_9030 ?auto_9033 ) ( IN-CITY ?auto_9036 ?auto_9034 ) ( not ( = ?auto_9027 ?auto_9036 ) ) ( not ( = ?auto_9035 ?auto_9036 ) ) ( not ( = ?auto_9033 ?auto_9036 ) ) ( OBJ-AT ?auto_9029 ?auto_9036 ) ( TRUCK-AT ?auto_9032 ?auto_9027 ) ( IN-TRUCK ?auto_9028 ?auto_9032 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9028 ?auto_9027 )
      ( DELIVER-5PKG ?auto_9026 ?auto_9028 ?auto_9029 ?auto_9030 ?auto_9031 ?auto_9027 )
      ( DELIVER-5PKG-VERIFY ?auto_9026 ?auto_9028 ?auto_9029 ?auto_9030 ?auto_9031 ?auto_9027 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9043 - OBJ
      ?auto_9045 - OBJ
      ?auto_9046 - OBJ
      ?auto_9047 - OBJ
      ?auto_9048 - OBJ
      ?auto_9044 - LOCATION
    )
    :vars
    (
      ?auto_9053 - LOCATION
      ?auto_9051 - CITY
      ?auto_9050 - LOCATION
      ?auto_9049 - LOCATION
      ?auto_9052 - TRUCK
      ?auto_9054 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9045 ?auto_9043 ) ( GREATER-THAN ?auto_9046 ?auto_9043 ) ( GREATER-THAN ?auto_9046 ?auto_9045 ) ( GREATER-THAN ?auto_9047 ?auto_9043 ) ( GREATER-THAN ?auto_9047 ?auto_9045 ) ( GREATER-THAN ?auto_9047 ?auto_9046 ) ( GREATER-THAN ?auto_9048 ?auto_9043 ) ( GREATER-THAN ?auto_9048 ?auto_9045 ) ( GREATER-THAN ?auto_9048 ?auto_9046 ) ( GREATER-THAN ?auto_9048 ?auto_9047 ) ( IN-CITY ?auto_9053 ?auto_9051 ) ( IN-CITY ?auto_9044 ?auto_9051 ) ( not ( = ?auto_9044 ?auto_9053 ) ) ( OBJ-AT ?auto_9048 ?auto_9053 ) ( OBJ-AT ?auto_9043 ?auto_9044 ) ( not ( = ?auto_9043 ?auto_9045 ) ) ( not ( = ?auto_9043 ?auto_9046 ) ) ( not ( = ?auto_9043 ?auto_9047 ) ) ( not ( = ?auto_9043 ?auto_9048 ) ) ( not ( = ?auto_9045 ?auto_9046 ) ) ( not ( = ?auto_9045 ?auto_9047 ) ) ( not ( = ?auto_9045 ?auto_9048 ) ) ( not ( = ?auto_9046 ?auto_9047 ) ) ( not ( = ?auto_9046 ?auto_9048 ) ) ( not ( = ?auto_9047 ?auto_9048 ) ) ( IN-CITY ?auto_9050 ?auto_9051 ) ( not ( = ?auto_9044 ?auto_9050 ) ) ( not ( = ?auto_9053 ?auto_9050 ) ) ( OBJ-AT ?auto_9047 ?auto_9050 ) ( IN-CITY ?auto_9049 ?auto_9051 ) ( not ( = ?auto_9044 ?auto_9049 ) ) ( not ( = ?auto_9053 ?auto_9049 ) ) ( not ( = ?auto_9050 ?auto_9049 ) ) ( OBJ-AT ?auto_9046 ?auto_9049 ) ( IN-TRUCK ?auto_9045 ?auto_9052 ) ( TRUCK-AT ?auto_9052 ?auto_9054 ) ( IN-CITY ?auto_9054 ?auto_9051 ) ( not ( = ?auto_9044 ?auto_9054 ) ) ( not ( = ?auto_9053 ?auto_9054 ) ) ( not ( = ?auto_9050 ?auto_9054 ) ) ( not ( = ?auto_9049 ?auto_9054 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9052 ?auto_9054 ?auto_9044 ?auto_9051 )
      ( DELIVER-5PKG ?auto_9043 ?auto_9045 ?auto_9046 ?auto_9047 ?auto_9048 ?auto_9044 )
      ( DELIVER-5PKG-VERIFY ?auto_9043 ?auto_9045 ?auto_9046 ?auto_9047 ?auto_9048 ?auto_9044 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9061 - OBJ
      ?auto_9063 - OBJ
      ?auto_9064 - OBJ
      ?auto_9065 - OBJ
      ?auto_9066 - OBJ
      ?auto_9062 - LOCATION
    )
    :vars
    (
      ?auto_9068 - LOCATION
      ?auto_9069 - CITY
      ?auto_9072 - LOCATION
      ?auto_9067 - LOCATION
      ?auto_9071 - TRUCK
      ?auto_9070 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9063 ?auto_9061 ) ( GREATER-THAN ?auto_9064 ?auto_9061 ) ( GREATER-THAN ?auto_9064 ?auto_9063 ) ( GREATER-THAN ?auto_9065 ?auto_9061 ) ( GREATER-THAN ?auto_9065 ?auto_9063 ) ( GREATER-THAN ?auto_9065 ?auto_9064 ) ( GREATER-THAN ?auto_9066 ?auto_9061 ) ( GREATER-THAN ?auto_9066 ?auto_9063 ) ( GREATER-THAN ?auto_9066 ?auto_9064 ) ( GREATER-THAN ?auto_9066 ?auto_9065 ) ( IN-CITY ?auto_9068 ?auto_9069 ) ( IN-CITY ?auto_9062 ?auto_9069 ) ( not ( = ?auto_9062 ?auto_9068 ) ) ( OBJ-AT ?auto_9066 ?auto_9068 ) ( OBJ-AT ?auto_9061 ?auto_9062 ) ( not ( = ?auto_9061 ?auto_9063 ) ) ( not ( = ?auto_9061 ?auto_9064 ) ) ( not ( = ?auto_9061 ?auto_9065 ) ) ( not ( = ?auto_9061 ?auto_9066 ) ) ( not ( = ?auto_9063 ?auto_9064 ) ) ( not ( = ?auto_9063 ?auto_9065 ) ) ( not ( = ?auto_9063 ?auto_9066 ) ) ( not ( = ?auto_9064 ?auto_9065 ) ) ( not ( = ?auto_9064 ?auto_9066 ) ) ( not ( = ?auto_9065 ?auto_9066 ) ) ( IN-CITY ?auto_9072 ?auto_9069 ) ( not ( = ?auto_9062 ?auto_9072 ) ) ( not ( = ?auto_9068 ?auto_9072 ) ) ( OBJ-AT ?auto_9065 ?auto_9072 ) ( IN-CITY ?auto_9067 ?auto_9069 ) ( not ( = ?auto_9062 ?auto_9067 ) ) ( not ( = ?auto_9068 ?auto_9067 ) ) ( not ( = ?auto_9072 ?auto_9067 ) ) ( OBJ-AT ?auto_9064 ?auto_9067 ) ( TRUCK-AT ?auto_9071 ?auto_9070 ) ( IN-CITY ?auto_9070 ?auto_9069 ) ( not ( = ?auto_9062 ?auto_9070 ) ) ( not ( = ?auto_9068 ?auto_9070 ) ) ( not ( = ?auto_9072 ?auto_9070 ) ) ( not ( = ?auto_9067 ?auto_9070 ) ) ( OBJ-AT ?auto_9063 ?auto_9070 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9063 ?auto_9071 ?auto_9070 )
      ( DELIVER-5PKG ?auto_9061 ?auto_9063 ?auto_9064 ?auto_9065 ?auto_9066 ?auto_9062 )
      ( DELIVER-5PKG-VERIFY ?auto_9061 ?auto_9063 ?auto_9064 ?auto_9065 ?auto_9066 ?auto_9062 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9079 - OBJ
      ?auto_9081 - OBJ
      ?auto_9082 - OBJ
      ?auto_9083 - OBJ
      ?auto_9084 - OBJ
      ?auto_9080 - LOCATION
    )
    :vars
    (
      ?auto_9086 - LOCATION
      ?auto_9085 - CITY
      ?auto_9089 - LOCATION
      ?auto_9087 - LOCATION
      ?auto_9090 - LOCATION
      ?auto_9088 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9081 ?auto_9079 ) ( GREATER-THAN ?auto_9082 ?auto_9079 ) ( GREATER-THAN ?auto_9082 ?auto_9081 ) ( GREATER-THAN ?auto_9083 ?auto_9079 ) ( GREATER-THAN ?auto_9083 ?auto_9081 ) ( GREATER-THAN ?auto_9083 ?auto_9082 ) ( GREATER-THAN ?auto_9084 ?auto_9079 ) ( GREATER-THAN ?auto_9084 ?auto_9081 ) ( GREATER-THAN ?auto_9084 ?auto_9082 ) ( GREATER-THAN ?auto_9084 ?auto_9083 ) ( IN-CITY ?auto_9086 ?auto_9085 ) ( IN-CITY ?auto_9080 ?auto_9085 ) ( not ( = ?auto_9080 ?auto_9086 ) ) ( OBJ-AT ?auto_9084 ?auto_9086 ) ( OBJ-AT ?auto_9079 ?auto_9080 ) ( not ( = ?auto_9079 ?auto_9081 ) ) ( not ( = ?auto_9079 ?auto_9082 ) ) ( not ( = ?auto_9079 ?auto_9083 ) ) ( not ( = ?auto_9079 ?auto_9084 ) ) ( not ( = ?auto_9081 ?auto_9082 ) ) ( not ( = ?auto_9081 ?auto_9083 ) ) ( not ( = ?auto_9081 ?auto_9084 ) ) ( not ( = ?auto_9082 ?auto_9083 ) ) ( not ( = ?auto_9082 ?auto_9084 ) ) ( not ( = ?auto_9083 ?auto_9084 ) ) ( IN-CITY ?auto_9089 ?auto_9085 ) ( not ( = ?auto_9080 ?auto_9089 ) ) ( not ( = ?auto_9086 ?auto_9089 ) ) ( OBJ-AT ?auto_9083 ?auto_9089 ) ( IN-CITY ?auto_9087 ?auto_9085 ) ( not ( = ?auto_9080 ?auto_9087 ) ) ( not ( = ?auto_9086 ?auto_9087 ) ) ( not ( = ?auto_9089 ?auto_9087 ) ) ( OBJ-AT ?auto_9082 ?auto_9087 ) ( IN-CITY ?auto_9090 ?auto_9085 ) ( not ( = ?auto_9080 ?auto_9090 ) ) ( not ( = ?auto_9086 ?auto_9090 ) ) ( not ( = ?auto_9089 ?auto_9090 ) ) ( not ( = ?auto_9087 ?auto_9090 ) ) ( OBJ-AT ?auto_9081 ?auto_9090 ) ( TRUCK-AT ?auto_9088 ?auto_9080 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9088 ?auto_9080 ?auto_9090 ?auto_9085 )
      ( DELIVER-5PKG ?auto_9079 ?auto_9081 ?auto_9082 ?auto_9083 ?auto_9084 ?auto_9080 )
      ( DELIVER-5PKG-VERIFY ?auto_9079 ?auto_9081 ?auto_9082 ?auto_9083 ?auto_9084 ?auto_9080 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9097 - OBJ
      ?auto_9099 - OBJ
      ?auto_9100 - OBJ
      ?auto_9101 - OBJ
      ?auto_9102 - OBJ
      ?auto_9098 - LOCATION
    )
    :vars
    (
      ?auto_9103 - LOCATION
      ?auto_9105 - CITY
      ?auto_9108 - LOCATION
      ?auto_9104 - LOCATION
      ?auto_9107 - LOCATION
      ?auto_9106 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9099 ?auto_9097 ) ( GREATER-THAN ?auto_9100 ?auto_9097 ) ( GREATER-THAN ?auto_9100 ?auto_9099 ) ( GREATER-THAN ?auto_9101 ?auto_9097 ) ( GREATER-THAN ?auto_9101 ?auto_9099 ) ( GREATER-THAN ?auto_9101 ?auto_9100 ) ( GREATER-THAN ?auto_9102 ?auto_9097 ) ( GREATER-THAN ?auto_9102 ?auto_9099 ) ( GREATER-THAN ?auto_9102 ?auto_9100 ) ( GREATER-THAN ?auto_9102 ?auto_9101 ) ( IN-CITY ?auto_9103 ?auto_9105 ) ( IN-CITY ?auto_9098 ?auto_9105 ) ( not ( = ?auto_9098 ?auto_9103 ) ) ( OBJ-AT ?auto_9102 ?auto_9103 ) ( not ( = ?auto_9097 ?auto_9099 ) ) ( not ( = ?auto_9097 ?auto_9100 ) ) ( not ( = ?auto_9097 ?auto_9101 ) ) ( not ( = ?auto_9097 ?auto_9102 ) ) ( not ( = ?auto_9099 ?auto_9100 ) ) ( not ( = ?auto_9099 ?auto_9101 ) ) ( not ( = ?auto_9099 ?auto_9102 ) ) ( not ( = ?auto_9100 ?auto_9101 ) ) ( not ( = ?auto_9100 ?auto_9102 ) ) ( not ( = ?auto_9101 ?auto_9102 ) ) ( IN-CITY ?auto_9108 ?auto_9105 ) ( not ( = ?auto_9098 ?auto_9108 ) ) ( not ( = ?auto_9103 ?auto_9108 ) ) ( OBJ-AT ?auto_9101 ?auto_9108 ) ( IN-CITY ?auto_9104 ?auto_9105 ) ( not ( = ?auto_9098 ?auto_9104 ) ) ( not ( = ?auto_9103 ?auto_9104 ) ) ( not ( = ?auto_9108 ?auto_9104 ) ) ( OBJ-AT ?auto_9100 ?auto_9104 ) ( IN-CITY ?auto_9107 ?auto_9105 ) ( not ( = ?auto_9098 ?auto_9107 ) ) ( not ( = ?auto_9103 ?auto_9107 ) ) ( not ( = ?auto_9108 ?auto_9107 ) ) ( not ( = ?auto_9104 ?auto_9107 ) ) ( OBJ-AT ?auto_9099 ?auto_9107 ) ( TRUCK-AT ?auto_9106 ?auto_9098 ) ( IN-TRUCK ?auto_9097 ?auto_9106 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9097 ?auto_9098 )
      ( DELIVER-5PKG ?auto_9097 ?auto_9099 ?auto_9100 ?auto_9101 ?auto_9102 ?auto_9098 )
      ( DELIVER-5PKG-VERIFY ?auto_9097 ?auto_9099 ?auto_9100 ?auto_9101 ?auto_9102 ?auto_9098 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9115 - OBJ
      ?auto_9117 - OBJ
      ?auto_9118 - OBJ
      ?auto_9119 - OBJ
      ?auto_9120 - OBJ
      ?auto_9116 - LOCATION
    )
    :vars
    (
      ?auto_9122 - LOCATION
      ?auto_9121 - CITY
      ?auto_9124 - LOCATION
      ?auto_9126 - LOCATION
      ?auto_9123 - LOCATION
      ?auto_9125 - TRUCK
      ?auto_9127 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9117 ?auto_9115 ) ( GREATER-THAN ?auto_9118 ?auto_9115 ) ( GREATER-THAN ?auto_9118 ?auto_9117 ) ( GREATER-THAN ?auto_9119 ?auto_9115 ) ( GREATER-THAN ?auto_9119 ?auto_9117 ) ( GREATER-THAN ?auto_9119 ?auto_9118 ) ( GREATER-THAN ?auto_9120 ?auto_9115 ) ( GREATER-THAN ?auto_9120 ?auto_9117 ) ( GREATER-THAN ?auto_9120 ?auto_9118 ) ( GREATER-THAN ?auto_9120 ?auto_9119 ) ( IN-CITY ?auto_9122 ?auto_9121 ) ( IN-CITY ?auto_9116 ?auto_9121 ) ( not ( = ?auto_9116 ?auto_9122 ) ) ( OBJ-AT ?auto_9120 ?auto_9122 ) ( not ( = ?auto_9115 ?auto_9117 ) ) ( not ( = ?auto_9115 ?auto_9118 ) ) ( not ( = ?auto_9115 ?auto_9119 ) ) ( not ( = ?auto_9115 ?auto_9120 ) ) ( not ( = ?auto_9117 ?auto_9118 ) ) ( not ( = ?auto_9117 ?auto_9119 ) ) ( not ( = ?auto_9117 ?auto_9120 ) ) ( not ( = ?auto_9118 ?auto_9119 ) ) ( not ( = ?auto_9118 ?auto_9120 ) ) ( not ( = ?auto_9119 ?auto_9120 ) ) ( IN-CITY ?auto_9124 ?auto_9121 ) ( not ( = ?auto_9116 ?auto_9124 ) ) ( not ( = ?auto_9122 ?auto_9124 ) ) ( OBJ-AT ?auto_9119 ?auto_9124 ) ( IN-CITY ?auto_9126 ?auto_9121 ) ( not ( = ?auto_9116 ?auto_9126 ) ) ( not ( = ?auto_9122 ?auto_9126 ) ) ( not ( = ?auto_9124 ?auto_9126 ) ) ( OBJ-AT ?auto_9118 ?auto_9126 ) ( IN-CITY ?auto_9123 ?auto_9121 ) ( not ( = ?auto_9116 ?auto_9123 ) ) ( not ( = ?auto_9122 ?auto_9123 ) ) ( not ( = ?auto_9124 ?auto_9123 ) ) ( not ( = ?auto_9126 ?auto_9123 ) ) ( OBJ-AT ?auto_9117 ?auto_9123 ) ( IN-TRUCK ?auto_9115 ?auto_9125 ) ( TRUCK-AT ?auto_9125 ?auto_9127 ) ( IN-CITY ?auto_9127 ?auto_9121 ) ( not ( = ?auto_9116 ?auto_9127 ) ) ( not ( = ?auto_9122 ?auto_9127 ) ) ( not ( = ?auto_9124 ?auto_9127 ) ) ( not ( = ?auto_9126 ?auto_9127 ) ) ( not ( = ?auto_9123 ?auto_9127 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9125 ?auto_9127 ?auto_9116 ?auto_9121 )
      ( DELIVER-5PKG ?auto_9115 ?auto_9117 ?auto_9118 ?auto_9119 ?auto_9120 ?auto_9116 )
      ( DELIVER-5PKG-VERIFY ?auto_9115 ?auto_9117 ?auto_9118 ?auto_9119 ?auto_9120 ?auto_9116 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9134 - OBJ
      ?auto_9136 - OBJ
      ?auto_9137 - OBJ
      ?auto_9138 - OBJ
      ?auto_9139 - OBJ
      ?auto_9135 - LOCATION
    )
    :vars
    (
      ?auto_9140 - LOCATION
      ?auto_9145 - CITY
      ?auto_9142 - LOCATION
      ?auto_9144 - LOCATION
      ?auto_9146 - LOCATION
      ?auto_9143 - TRUCK
      ?auto_9141 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9136 ?auto_9134 ) ( GREATER-THAN ?auto_9137 ?auto_9134 ) ( GREATER-THAN ?auto_9137 ?auto_9136 ) ( GREATER-THAN ?auto_9138 ?auto_9134 ) ( GREATER-THAN ?auto_9138 ?auto_9136 ) ( GREATER-THAN ?auto_9138 ?auto_9137 ) ( GREATER-THAN ?auto_9139 ?auto_9134 ) ( GREATER-THAN ?auto_9139 ?auto_9136 ) ( GREATER-THAN ?auto_9139 ?auto_9137 ) ( GREATER-THAN ?auto_9139 ?auto_9138 ) ( IN-CITY ?auto_9140 ?auto_9145 ) ( IN-CITY ?auto_9135 ?auto_9145 ) ( not ( = ?auto_9135 ?auto_9140 ) ) ( OBJ-AT ?auto_9139 ?auto_9140 ) ( not ( = ?auto_9134 ?auto_9136 ) ) ( not ( = ?auto_9134 ?auto_9137 ) ) ( not ( = ?auto_9134 ?auto_9138 ) ) ( not ( = ?auto_9134 ?auto_9139 ) ) ( not ( = ?auto_9136 ?auto_9137 ) ) ( not ( = ?auto_9136 ?auto_9138 ) ) ( not ( = ?auto_9136 ?auto_9139 ) ) ( not ( = ?auto_9137 ?auto_9138 ) ) ( not ( = ?auto_9137 ?auto_9139 ) ) ( not ( = ?auto_9138 ?auto_9139 ) ) ( IN-CITY ?auto_9142 ?auto_9145 ) ( not ( = ?auto_9135 ?auto_9142 ) ) ( not ( = ?auto_9140 ?auto_9142 ) ) ( OBJ-AT ?auto_9138 ?auto_9142 ) ( IN-CITY ?auto_9144 ?auto_9145 ) ( not ( = ?auto_9135 ?auto_9144 ) ) ( not ( = ?auto_9140 ?auto_9144 ) ) ( not ( = ?auto_9142 ?auto_9144 ) ) ( OBJ-AT ?auto_9137 ?auto_9144 ) ( IN-CITY ?auto_9146 ?auto_9145 ) ( not ( = ?auto_9135 ?auto_9146 ) ) ( not ( = ?auto_9140 ?auto_9146 ) ) ( not ( = ?auto_9142 ?auto_9146 ) ) ( not ( = ?auto_9144 ?auto_9146 ) ) ( OBJ-AT ?auto_9136 ?auto_9146 ) ( TRUCK-AT ?auto_9143 ?auto_9141 ) ( IN-CITY ?auto_9141 ?auto_9145 ) ( not ( = ?auto_9135 ?auto_9141 ) ) ( not ( = ?auto_9140 ?auto_9141 ) ) ( not ( = ?auto_9142 ?auto_9141 ) ) ( not ( = ?auto_9144 ?auto_9141 ) ) ( not ( = ?auto_9146 ?auto_9141 ) ) ( OBJ-AT ?auto_9134 ?auto_9141 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9134 ?auto_9143 ?auto_9141 )
      ( DELIVER-5PKG ?auto_9134 ?auto_9136 ?auto_9137 ?auto_9138 ?auto_9139 ?auto_9135 )
      ( DELIVER-5PKG-VERIFY ?auto_9134 ?auto_9136 ?auto_9137 ?auto_9138 ?auto_9139 ?auto_9135 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_9153 - OBJ
      ?auto_9155 - OBJ
      ?auto_9156 - OBJ
      ?auto_9157 - OBJ
      ?auto_9158 - OBJ
      ?auto_9154 - LOCATION
    )
    :vars
    (
      ?auto_9164 - LOCATION
      ?auto_9163 - CITY
      ?auto_9165 - LOCATION
      ?auto_9159 - LOCATION
      ?auto_9161 - LOCATION
      ?auto_9160 - LOCATION
      ?auto_9162 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_9155 ?auto_9153 ) ( GREATER-THAN ?auto_9156 ?auto_9153 ) ( GREATER-THAN ?auto_9156 ?auto_9155 ) ( GREATER-THAN ?auto_9157 ?auto_9153 ) ( GREATER-THAN ?auto_9157 ?auto_9155 ) ( GREATER-THAN ?auto_9157 ?auto_9156 ) ( GREATER-THAN ?auto_9158 ?auto_9153 ) ( GREATER-THAN ?auto_9158 ?auto_9155 ) ( GREATER-THAN ?auto_9158 ?auto_9156 ) ( GREATER-THAN ?auto_9158 ?auto_9157 ) ( IN-CITY ?auto_9164 ?auto_9163 ) ( IN-CITY ?auto_9154 ?auto_9163 ) ( not ( = ?auto_9154 ?auto_9164 ) ) ( OBJ-AT ?auto_9158 ?auto_9164 ) ( not ( = ?auto_9153 ?auto_9155 ) ) ( not ( = ?auto_9153 ?auto_9156 ) ) ( not ( = ?auto_9153 ?auto_9157 ) ) ( not ( = ?auto_9153 ?auto_9158 ) ) ( not ( = ?auto_9155 ?auto_9156 ) ) ( not ( = ?auto_9155 ?auto_9157 ) ) ( not ( = ?auto_9155 ?auto_9158 ) ) ( not ( = ?auto_9156 ?auto_9157 ) ) ( not ( = ?auto_9156 ?auto_9158 ) ) ( not ( = ?auto_9157 ?auto_9158 ) ) ( IN-CITY ?auto_9165 ?auto_9163 ) ( not ( = ?auto_9154 ?auto_9165 ) ) ( not ( = ?auto_9164 ?auto_9165 ) ) ( OBJ-AT ?auto_9157 ?auto_9165 ) ( IN-CITY ?auto_9159 ?auto_9163 ) ( not ( = ?auto_9154 ?auto_9159 ) ) ( not ( = ?auto_9164 ?auto_9159 ) ) ( not ( = ?auto_9165 ?auto_9159 ) ) ( OBJ-AT ?auto_9156 ?auto_9159 ) ( IN-CITY ?auto_9161 ?auto_9163 ) ( not ( = ?auto_9154 ?auto_9161 ) ) ( not ( = ?auto_9164 ?auto_9161 ) ) ( not ( = ?auto_9165 ?auto_9161 ) ) ( not ( = ?auto_9159 ?auto_9161 ) ) ( OBJ-AT ?auto_9155 ?auto_9161 ) ( IN-CITY ?auto_9160 ?auto_9163 ) ( not ( = ?auto_9154 ?auto_9160 ) ) ( not ( = ?auto_9164 ?auto_9160 ) ) ( not ( = ?auto_9165 ?auto_9160 ) ) ( not ( = ?auto_9159 ?auto_9160 ) ) ( not ( = ?auto_9161 ?auto_9160 ) ) ( OBJ-AT ?auto_9153 ?auto_9160 ) ( TRUCK-AT ?auto_9162 ?auto_9154 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9162 ?auto_9154 ?auto_9160 ?auto_9163 )
      ( DELIVER-5PKG ?auto_9153 ?auto_9155 ?auto_9156 ?auto_9157 ?auto_9158 ?auto_9154 )
      ( DELIVER-5PKG-VERIFY ?auto_9153 ?auto_9155 ?auto_9156 ?auto_9157 ?auto_9158 ?auto_9154 ) )
  )

)

