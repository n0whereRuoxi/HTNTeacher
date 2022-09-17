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
      ?auto_8354 - SURFACE
      ?auto_8355 - SURFACE
    )
    :vars
    (
      ?auto_8356 - HOIST
      ?auto_8357 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8356 ?auto_8357 ) ( SURFACE-AT ?auto_8355 ?auto_8357 ) ( CLEAR ?auto_8355 ) ( LIFTING ?auto_8356 ?auto_8354 ) ( IS-CRATE ?auto_8354 ) ( not ( = ?auto_8354 ?auto_8355 ) ) )
    :subtasks
    ( ( !DROP ?auto_8356 ?auto_8354 ?auto_8355 ?auto_8357 )
      ( MAKE-ON-VERIFY ?auto_8354 ?auto_8355 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8358 - SURFACE
      ?auto_8359 - SURFACE
    )
    :vars
    (
      ?auto_8360 - HOIST
      ?auto_8361 - PLACE
      ?auto_8362 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8360 ?auto_8361 ) ( SURFACE-AT ?auto_8359 ?auto_8361 ) ( CLEAR ?auto_8359 ) ( IS-CRATE ?auto_8358 ) ( not ( = ?auto_8358 ?auto_8359 ) ) ( TRUCK-AT ?auto_8362 ?auto_8361 ) ( AVAILABLE ?auto_8360 ) ( IN ?auto_8358 ?auto_8362 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8360 ?auto_8358 ?auto_8362 ?auto_8361 )
      ( MAKE-ON ?auto_8358 ?auto_8359 )
      ( MAKE-ON-VERIFY ?auto_8358 ?auto_8359 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8363 - SURFACE
      ?auto_8364 - SURFACE
    )
    :vars
    (
      ?auto_8365 - HOIST
      ?auto_8366 - PLACE
      ?auto_8367 - TRUCK
      ?auto_8368 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8365 ?auto_8366 ) ( SURFACE-AT ?auto_8364 ?auto_8366 ) ( CLEAR ?auto_8364 ) ( IS-CRATE ?auto_8363 ) ( not ( = ?auto_8363 ?auto_8364 ) ) ( AVAILABLE ?auto_8365 ) ( IN ?auto_8363 ?auto_8367 ) ( TRUCK-AT ?auto_8367 ?auto_8368 ) ( not ( = ?auto_8368 ?auto_8366 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8367 ?auto_8368 ?auto_8366 )
      ( MAKE-ON ?auto_8363 ?auto_8364 )
      ( MAKE-ON-VERIFY ?auto_8363 ?auto_8364 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8369 - SURFACE
      ?auto_8370 - SURFACE
    )
    :vars
    (
      ?auto_8371 - HOIST
      ?auto_8374 - PLACE
      ?auto_8372 - TRUCK
      ?auto_8373 - PLACE
      ?auto_8375 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8371 ?auto_8374 ) ( SURFACE-AT ?auto_8370 ?auto_8374 ) ( CLEAR ?auto_8370 ) ( IS-CRATE ?auto_8369 ) ( not ( = ?auto_8369 ?auto_8370 ) ) ( AVAILABLE ?auto_8371 ) ( TRUCK-AT ?auto_8372 ?auto_8373 ) ( not ( = ?auto_8373 ?auto_8374 ) ) ( HOIST-AT ?auto_8375 ?auto_8373 ) ( LIFTING ?auto_8375 ?auto_8369 ) ( not ( = ?auto_8371 ?auto_8375 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8375 ?auto_8369 ?auto_8372 ?auto_8373 )
      ( MAKE-ON ?auto_8369 ?auto_8370 )
      ( MAKE-ON-VERIFY ?auto_8369 ?auto_8370 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8376 - SURFACE
      ?auto_8377 - SURFACE
    )
    :vars
    (
      ?auto_8380 - HOIST
      ?auto_8382 - PLACE
      ?auto_8379 - TRUCK
      ?auto_8378 - PLACE
      ?auto_8381 - HOIST
      ?auto_8383 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8380 ?auto_8382 ) ( SURFACE-AT ?auto_8377 ?auto_8382 ) ( CLEAR ?auto_8377 ) ( IS-CRATE ?auto_8376 ) ( not ( = ?auto_8376 ?auto_8377 ) ) ( AVAILABLE ?auto_8380 ) ( TRUCK-AT ?auto_8379 ?auto_8378 ) ( not ( = ?auto_8378 ?auto_8382 ) ) ( HOIST-AT ?auto_8381 ?auto_8378 ) ( not ( = ?auto_8380 ?auto_8381 ) ) ( AVAILABLE ?auto_8381 ) ( SURFACE-AT ?auto_8376 ?auto_8378 ) ( ON ?auto_8376 ?auto_8383 ) ( CLEAR ?auto_8376 ) ( not ( = ?auto_8376 ?auto_8383 ) ) ( not ( = ?auto_8377 ?auto_8383 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8381 ?auto_8376 ?auto_8383 ?auto_8378 )
      ( MAKE-ON ?auto_8376 ?auto_8377 )
      ( MAKE-ON-VERIFY ?auto_8376 ?auto_8377 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8384 - SURFACE
      ?auto_8385 - SURFACE
    )
    :vars
    (
      ?auto_8389 - HOIST
      ?auto_8388 - PLACE
      ?auto_8386 - PLACE
      ?auto_8391 - HOIST
      ?auto_8390 - SURFACE
      ?auto_8387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8389 ?auto_8388 ) ( SURFACE-AT ?auto_8385 ?auto_8388 ) ( CLEAR ?auto_8385 ) ( IS-CRATE ?auto_8384 ) ( not ( = ?auto_8384 ?auto_8385 ) ) ( AVAILABLE ?auto_8389 ) ( not ( = ?auto_8386 ?auto_8388 ) ) ( HOIST-AT ?auto_8391 ?auto_8386 ) ( not ( = ?auto_8389 ?auto_8391 ) ) ( AVAILABLE ?auto_8391 ) ( SURFACE-AT ?auto_8384 ?auto_8386 ) ( ON ?auto_8384 ?auto_8390 ) ( CLEAR ?auto_8384 ) ( not ( = ?auto_8384 ?auto_8390 ) ) ( not ( = ?auto_8385 ?auto_8390 ) ) ( TRUCK-AT ?auto_8387 ?auto_8388 ) )
    :subtasks
    ( ( !DRIVE ?auto_8387 ?auto_8388 ?auto_8386 )
      ( MAKE-ON ?auto_8384 ?auto_8385 )
      ( MAKE-ON-VERIFY ?auto_8384 ?auto_8385 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8394 - SURFACE
      ?auto_8395 - SURFACE
    )
    :vars
    (
      ?auto_8396 - HOIST
      ?auto_8397 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8396 ?auto_8397 ) ( SURFACE-AT ?auto_8395 ?auto_8397 ) ( CLEAR ?auto_8395 ) ( LIFTING ?auto_8396 ?auto_8394 ) ( IS-CRATE ?auto_8394 ) ( not ( = ?auto_8394 ?auto_8395 ) ) )
    :subtasks
    ( ( !DROP ?auto_8396 ?auto_8394 ?auto_8395 ?auto_8397 )
      ( MAKE-ON-VERIFY ?auto_8394 ?auto_8395 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8398 - SURFACE
      ?auto_8399 - SURFACE
    )
    :vars
    (
      ?auto_8401 - HOIST
      ?auto_8400 - PLACE
      ?auto_8402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8401 ?auto_8400 ) ( SURFACE-AT ?auto_8399 ?auto_8400 ) ( CLEAR ?auto_8399 ) ( IS-CRATE ?auto_8398 ) ( not ( = ?auto_8398 ?auto_8399 ) ) ( TRUCK-AT ?auto_8402 ?auto_8400 ) ( AVAILABLE ?auto_8401 ) ( IN ?auto_8398 ?auto_8402 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8401 ?auto_8398 ?auto_8402 ?auto_8400 )
      ( MAKE-ON ?auto_8398 ?auto_8399 )
      ( MAKE-ON-VERIFY ?auto_8398 ?auto_8399 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8403 - SURFACE
      ?auto_8404 - SURFACE
    )
    :vars
    (
      ?auto_8405 - HOIST
      ?auto_8406 - PLACE
      ?auto_8407 - TRUCK
      ?auto_8408 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8405 ?auto_8406 ) ( SURFACE-AT ?auto_8404 ?auto_8406 ) ( CLEAR ?auto_8404 ) ( IS-CRATE ?auto_8403 ) ( not ( = ?auto_8403 ?auto_8404 ) ) ( AVAILABLE ?auto_8405 ) ( IN ?auto_8403 ?auto_8407 ) ( TRUCK-AT ?auto_8407 ?auto_8408 ) ( not ( = ?auto_8408 ?auto_8406 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8407 ?auto_8408 ?auto_8406 )
      ( MAKE-ON ?auto_8403 ?auto_8404 )
      ( MAKE-ON-VERIFY ?auto_8403 ?auto_8404 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8409 - SURFACE
      ?auto_8410 - SURFACE
    )
    :vars
    (
      ?auto_8412 - HOIST
      ?auto_8413 - PLACE
      ?auto_8414 - TRUCK
      ?auto_8411 - PLACE
      ?auto_8415 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8412 ?auto_8413 ) ( SURFACE-AT ?auto_8410 ?auto_8413 ) ( CLEAR ?auto_8410 ) ( IS-CRATE ?auto_8409 ) ( not ( = ?auto_8409 ?auto_8410 ) ) ( AVAILABLE ?auto_8412 ) ( TRUCK-AT ?auto_8414 ?auto_8411 ) ( not ( = ?auto_8411 ?auto_8413 ) ) ( HOIST-AT ?auto_8415 ?auto_8411 ) ( LIFTING ?auto_8415 ?auto_8409 ) ( not ( = ?auto_8412 ?auto_8415 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8415 ?auto_8409 ?auto_8414 ?auto_8411 )
      ( MAKE-ON ?auto_8409 ?auto_8410 )
      ( MAKE-ON-VERIFY ?auto_8409 ?auto_8410 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8416 - SURFACE
      ?auto_8417 - SURFACE
    )
    :vars
    (
      ?auto_8421 - HOIST
      ?auto_8422 - PLACE
      ?auto_8420 - TRUCK
      ?auto_8419 - PLACE
      ?auto_8418 - HOIST
      ?auto_8423 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8421 ?auto_8422 ) ( SURFACE-AT ?auto_8417 ?auto_8422 ) ( CLEAR ?auto_8417 ) ( IS-CRATE ?auto_8416 ) ( not ( = ?auto_8416 ?auto_8417 ) ) ( AVAILABLE ?auto_8421 ) ( TRUCK-AT ?auto_8420 ?auto_8419 ) ( not ( = ?auto_8419 ?auto_8422 ) ) ( HOIST-AT ?auto_8418 ?auto_8419 ) ( not ( = ?auto_8421 ?auto_8418 ) ) ( AVAILABLE ?auto_8418 ) ( SURFACE-AT ?auto_8416 ?auto_8419 ) ( ON ?auto_8416 ?auto_8423 ) ( CLEAR ?auto_8416 ) ( not ( = ?auto_8416 ?auto_8423 ) ) ( not ( = ?auto_8417 ?auto_8423 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8418 ?auto_8416 ?auto_8423 ?auto_8419 )
      ( MAKE-ON ?auto_8416 ?auto_8417 )
      ( MAKE-ON-VERIFY ?auto_8416 ?auto_8417 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8424 - SURFACE
      ?auto_8425 - SURFACE
    )
    :vars
    (
      ?auto_8428 - HOIST
      ?auto_8426 - PLACE
      ?auto_8430 - PLACE
      ?auto_8431 - HOIST
      ?auto_8427 - SURFACE
      ?auto_8429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8428 ?auto_8426 ) ( SURFACE-AT ?auto_8425 ?auto_8426 ) ( CLEAR ?auto_8425 ) ( IS-CRATE ?auto_8424 ) ( not ( = ?auto_8424 ?auto_8425 ) ) ( AVAILABLE ?auto_8428 ) ( not ( = ?auto_8430 ?auto_8426 ) ) ( HOIST-AT ?auto_8431 ?auto_8430 ) ( not ( = ?auto_8428 ?auto_8431 ) ) ( AVAILABLE ?auto_8431 ) ( SURFACE-AT ?auto_8424 ?auto_8430 ) ( ON ?auto_8424 ?auto_8427 ) ( CLEAR ?auto_8424 ) ( not ( = ?auto_8424 ?auto_8427 ) ) ( not ( = ?auto_8425 ?auto_8427 ) ) ( TRUCK-AT ?auto_8429 ?auto_8426 ) )
    :subtasks
    ( ( !DRIVE ?auto_8429 ?auto_8426 ?auto_8430 )
      ( MAKE-ON ?auto_8424 ?auto_8425 )
      ( MAKE-ON-VERIFY ?auto_8424 ?auto_8425 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8432 - SURFACE
      ?auto_8433 - SURFACE
    )
    :vars
    (
      ?auto_8435 - HOIST
      ?auto_8434 - PLACE
      ?auto_8437 - PLACE
      ?auto_8438 - HOIST
      ?auto_8439 - SURFACE
      ?auto_8436 - TRUCK
      ?auto_8440 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8435 ?auto_8434 ) ( IS-CRATE ?auto_8432 ) ( not ( = ?auto_8432 ?auto_8433 ) ) ( not ( = ?auto_8437 ?auto_8434 ) ) ( HOIST-AT ?auto_8438 ?auto_8437 ) ( not ( = ?auto_8435 ?auto_8438 ) ) ( AVAILABLE ?auto_8438 ) ( SURFACE-AT ?auto_8432 ?auto_8437 ) ( ON ?auto_8432 ?auto_8439 ) ( CLEAR ?auto_8432 ) ( not ( = ?auto_8432 ?auto_8439 ) ) ( not ( = ?auto_8433 ?auto_8439 ) ) ( TRUCK-AT ?auto_8436 ?auto_8434 ) ( SURFACE-AT ?auto_8440 ?auto_8434 ) ( CLEAR ?auto_8440 ) ( LIFTING ?auto_8435 ?auto_8433 ) ( IS-CRATE ?auto_8433 ) ( not ( = ?auto_8432 ?auto_8440 ) ) ( not ( = ?auto_8433 ?auto_8440 ) ) ( not ( = ?auto_8439 ?auto_8440 ) ) )
    :subtasks
    ( ( !DROP ?auto_8435 ?auto_8433 ?auto_8440 ?auto_8434 )
      ( MAKE-ON ?auto_8432 ?auto_8433 )
      ( MAKE-ON-VERIFY ?auto_8432 ?auto_8433 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8441 - SURFACE
      ?auto_8442 - SURFACE
    )
    :vars
    (
      ?auto_8445 - HOIST
      ?auto_8449 - PLACE
      ?auto_8447 - PLACE
      ?auto_8444 - HOIST
      ?auto_8446 - SURFACE
      ?auto_8443 - TRUCK
      ?auto_8448 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8445 ?auto_8449 ) ( IS-CRATE ?auto_8441 ) ( not ( = ?auto_8441 ?auto_8442 ) ) ( not ( = ?auto_8447 ?auto_8449 ) ) ( HOIST-AT ?auto_8444 ?auto_8447 ) ( not ( = ?auto_8445 ?auto_8444 ) ) ( AVAILABLE ?auto_8444 ) ( SURFACE-AT ?auto_8441 ?auto_8447 ) ( ON ?auto_8441 ?auto_8446 ) ( CLEAR ?auto_8441 ) ( not ( = ?auto_8441 ?auto_8446 ) ) ( not ( = ?auto_8442 ?auto_8446 ) ) ( TRUCK-AT ?auto_8443 ?auto_8449 ) ( SURFACE-AT ?auto_8448 ?auto_8449 ) ( CLEAR ?auto_8448 ) ( IS-CRATE ?auto_8442 ) ( not ( = ?auto_8441 ?auto_8448 ) ) ( not ( = ?auto_8442 ?auto_8448 ) ) ( not ( = ?auto_8446 ?auto_8448 ) ) ( AVAILABLE ?auto_8445 ) ( IN ?auto_8442 ?auto_8443 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8445 ?auto_8442 ?auto_8443 ?auto_8449 )
      ( MAKE-ON ?auto_8441 ?auto_8442 )
      ( MAKE-ON-VERIFY ?auto_8441 ?auto_8442 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8450 - SURFACE
      ?auto_8451 - SURFACE
    )
    :vars
    (
      ?auto_8453 - HOIST
      ?auto_8452 - PLACE
      ?auto_8458 - PLACE
      ?auto_8455 - HOIST
      ?auto_8456 - SURFACE
      ?auto_8454 - SURFACE
      ?auto_8457 - TRUCK
      ?auto_8459 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8453 ?auto_8452 ) ( IS-CRATE ?auto_8450 ) ( not ( = ?auto_8450 ?auto_8451 ) ) ( not ( = ?auto_8458 ?auto_8452 ) ) ( HOIST-AT ?auto_8455 ?auto_8458 ) ( not ( = ?auto_8453 ?auto_8455 ) ) ( AVAILABLE ?auto_8455 ) ( SURFACE-AT ?auto_8450 ?auto_8458 ) ( ON ?auto_8450 ?auto_8456 ) ( CLEAR ?auto_8450 ) ( not ( = ?auto_8450 ?auto_8456 ) ) ( not ( = ?auto_8451 ?auto_8456 ) ) ( SURFACE-AT ?auto_8454 ?auto_8452 ) ( CLEAR ?auto_8454 ) ( IS-CRATE ?auto_8451 ) ( not ( = ?auto_8450 ?auto_8454 ) ) ( not ( = ?auto_8451 ?auto_8454 ) ) ( not ( = ?auto_8456 ?auto_8454 ) ) ( AVAILABLE ?auto_8453 ) ( IN ?auto_8451 ?auto_8457 ) ( TRUCK-AT ?auto_8457 ?auto_8459 ) ( not ( = ?auto_8459 ?auto_8452 ) ) ( not ( = ?auto_8458 ?auto_8459 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8457 ?auto_8459 ?auto_8452 )
      ( MAKE-ON ?auto_8450 ?auto_8451 )
      ( MAKE-ON-VERIFY ?auto_8450 ?auto_8451 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8460 - SURFACE
      ?auto_8461 - SURFACE
    )
    :vars
    (
      ?auto_8465 - HOIST
      ?auto_8462 - PLACE
      ?auto_8469 - PLACE
      ?auto_8468 - HOIST
      ?auto_8463 - SURFACE
      ?auto_8467 - SURFACE
      ?auto_8464 - TRUCK
      ?auto_8466 - PLACE
      ?auto_8470 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8465 ?auto_8462 ) ( IS-CRATE ?auto_8460 ) ( not ( = ?auto_8460 ?auto_8461 ) ) ( not ( = ?auto_8469 ?auto_8462 ) ) ( HOIST-AT ?auto_8468 ?auto_8469 ) ( not ( = ?auto_8465 ?auto_8468 ) ) ( AVAILABLE ?auto_8468 ) ( SURFACE-AT ?auto_8460 ?auto_8469 ) ( ON ?auto_8460 ?auto_8463 ) ( CLEAR ?auto_8460 ) ( not ( = ?auto_8460 ?auto_8463 ) ) ( not ( = ?auto_8461 ?auto_8463 ) ) ( SURFACE-AT ?auto_8467 ?auto_8462 ) ( CLEAR ?auto_8467 ) ( IS-CRATE ?auto_8461 ) ( not ( = ?auto_8460 ?auto_8467 ) ) ( not ( = ?auto_8461 ?auto_8467 ) ) ( not ( = ?auto_8463 ?auto_8467 ) ) ( AVAILABLE ?auto_8465 ) ( TRUCK-AT ?auto_8464 ?auto_8466 ) ( not ( = ?auto_8466 ?auto_8462 ) ) ( not ( = ?auto_8469 ?auto_8466 ) ) ( HOIST-AT ?auto_8470 ?auto_8466 ) ( LIFTING ?auto_8470 ?auto_8461 ) ( not ( = ?auto_8465 ?auto_8470 ) ) ( not ( = ?auto_8468 ?auto_8470 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8470 ?auto_8461 ?auto_8464 ?auto_8466 )
      ( MAKE-ON ?auto_8460 ?auto_8461 )
      ( MAKE-ON-VERIFY ?auto_8460 ?auto_8461 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8471 - SURFACE
      ?auto_8472 - SURFACE
    )
    :vars
    (
      ?auto_8478 - HOIST
      ?auto_8476 - PLACE
      ?auto_8477 - PLACE
      ?auto_8474 - HOIST
      ?auto_8481 - SURFACE
      ?auto_8473 - SURFACE
      ?auto_8479 - TRUCK
      ?auto_8475 - PLACE
      ?auto_8480 - HOIST
      ?auto_8482 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8478 ?auto_8476 ) ( IS-CRATE ?auto_8471 ) ( not ( = ?auto_8471 ?auto_8472 ) ) ( not ( = ?auto_8477 ?auto_8476 ) ) ( HOIST-AT ?auto_8474 ?auto_8477 ) ( not ( = ?auto_8478 ?auto_8474 ) ) ( AVAILABLE ?auto_8474 ) ( SURFACE-AT ?auto_8471 ?auto_8477 ) ( ON ?auto_8471 ?auto_8481 ) ( CLEAR ?auto_8471 ) ( not ( = ?auto_8471 ?auto_8481 ) ) ( not ( = ?auto_8472 ?auto_8481 ) ) ( SURFACE-AT ?auto_8473 ?auto_8476 ) ( CLEAR ?auto_8473 ) ( IS-CRATE ?auto_8472 ) ( not ( = ?auto_8471 ?auto_8473 ) ) ( not ( = ?auto_8472 ?auto_8473 ) ) ( not ( = ?auto_8481 ?auto_8473 ) ) ( AVAILABLE ?auto_8478 ) ( TRUCK-AT ?auto_8479 ?auto_8475 ) ( not ( = ?auto_8475 ?auto_8476 ) ) ( not ( = ?auto_8477 ?auto_8475 ) ) ( HOIST-AT ?auto_8480 ?auto_8475 ) ( not ( = ?auto_8478 ?auto_8480 ) ) ( not ( = ?auto_8474 ?auto_8480 ) ) ( AVAILABLE ?auto_8480 ) ( SURFACE-AT ?auto_8472 ?auto_8475 ) ( ON ?auto_8472 ?auto_8482 ) ( CLEAR ?auto_8472 ) ( not ( = ?auto_8471 ?auto_8482 ) ) ( not ( = ?auto_8472 ?auto_8482 ) ) ( not ( = ?auto_8481 ?auto_8482 ) ) ( not ( = ?auto_8473 ?auto_8482 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8480 ?auto_8472 ?auto_8482 ?auto_8475 )
      ( MAKE-ON ?auto_8471 ?auto_8472 )
      ( MAKE-ON-VERIFY ?auto_8471 ?auto_8472 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8483 - SURFACE
      ?auto_8484 - SURFACE
    )
    :vars
    (
      ?auto_8492 - HOIST
      ?auto_8493 - PLACE
      ?auto_8486 - PLACE
      ?auto_8489 - HOIST
      ?auto_8494 - SURFACE
      ?auto_8488 - SURFACE
      ?auto_8485 - PLACE
      ?auto_8487 - HOIST
      ?auto_8491 - SURFACE
      ?auto_8490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8492 ?auto_8493 ) ( IS-CRATE ?auto_8483 ) ( not ( = ?auto_8483 ?auto_8484 ) ) ( not ( = ?auto_8486 ?auto_8493 ) ) ( HOIST-AT ?auto_8489 ?auto_8486 ) ( not ( = ?auto_8492 ?auto_8489 ) ) ( AVAILABLE ?auto_8489 ) ( SURFACE-AT ?auto_8483 ?auto_8486 ) ( ON ?auto_8483 ?auto_8494 ) ( CLEAR ?auto_8483 ) ( not ( = ?auto_8483 ?auto_8494 ) ) ( not ( = ?auto_8484 ?auto_8494 ) ) ( SURFACE-AT ?auto_8488 ?auto_8493 ) ( CLEAR ?auto_8488 ) ( IS-CRATE ?auto_8484 ) ( not ( = ?auto_8483 ?auto_8488 ) ) ( not ( = ?auto_8484 ?auto_8488 ) ) ( not ( = ?auto_8494 ?auto_8488 ) ) ( AVAILABLE ?auto_8492 ) ( not ( = ?auto_8485 ?auto_8493 ) ) ( not ( = ?auto_8486 ?auto_8485 ) ) ( HOIST-AT ?auto_8487 ?auto_8485 ) ( not ( = ?auto_8492 ?auto_8487 ) ) ( not ( = ?auto_8489 ?auto_8487 ) ) ( AVAILABLE ?auto_8487 ) ( SURFACE-AT ?auto_8484 ?auto_8485 ) ( ON ?auto_8484 ?auto_8491 ) ( CLEAR ?auto_8484 ) ( not ( = ?auto_8483 ?auto_8491 ) ) ( not ( = ?auto_8484 ?auto_8491 ) ) ( not ( = ?auto_8494 ?auto_8491 ) ) ( not ( = ?auto_8488 ?auto_8491 ) ) ( TRUCK-AT ?auto_8490 ?auto_8493 ) )
    :subtasks
    ( ( !DRIVE ?auto_8490 ?auto_8493 ?auto_8485 )
      ( MAKE-ON ?auto_8483 ?auto_8484 )
      ( MAKE-ON-VERIFY ?auto_8483 ?auto_8484 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8497 - SURFACE
      ?auto_8498 - SURFACE
    )
    :vars
    (
      ?auto_8499 - HOIST
      ?auto_8500 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8499 ?auto_8500 ) ( SURFACE-AT ?auto_8498 ?auto_8500 ) ( CLEAR ?auto_8498 ) ( LIFTING ?auto_8499 ?auto_8497 ) ( IS-CRATE ?auto_8497 ) ( not ( = ?auto_8497 ?auto_8498 ) ) )
    :subtasks
    ( ( !DROP ?auto_8499 ?auto_8497 ?auto_8498 ?auto_8500 )
      ( MAKE-ON-VERIFY ?auto_8497 ?auto_8498 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8501 - SURFACE
      ?auto_8502 - SURFACE
    )
    :vars
    (
      ?auto_8504 - HOIST
      ?auto_8503 - PLACE
      ?auto_8505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8504 ?auto_8503 ) ( SURFACE-AT ?auto_8502 ?auto_8503 ) ( CLEAR ?auto_8502 ) ( IS-CRATE ?auto_8501 ) ( not ( = ?auto_8501 ?auto_8502 ) ) ( TRUCK-AT ?auto_8505 ?auto_8503 ) ( AVAILABLE ?auto_8504 ) ( IN ?auto_8501 ?auto_8505 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8504 ?auto_8501 ?auto_8505 ?auto_8503 )
      ( MAKE-ON ?auto_8501 ?auto_8502 )
      ( MAKE-ON-VERIFY ?auto_8501 ?auto_8502 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8506 - SURFACE
      ?auto_8507 - SURFACE
    )
    :vars
    (
      ?auto_8509 - HOIST
      ?auto_8508 - PLACE
      ?auto_8510 - TRUCK
      ?auto_8511 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8509 ?auto_8508 ) ( SURFACE-AT ?auto_8507 ?auto_8508 ) ( CLEAR ?auto_8507 ) ( IS-CRATE ?auto_8506 ) ( not ( = ?auto_8506 ?auto_8507 ) ) ( AVAILABLE ?auto_8509 ) ( IN ?auto_8506 ?auto_8510 ) ( TRUCK-AT ?auto_8510 ?auto_8511 ) ( not ( = ?auto_8511 ?auto_8508 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8510 ?auto_8511 ?auto_8508 )
      ( MAKE-ON ?auto_8506 ?auto_8507 )
      ( MAKE-ON-VERIFY ?auto_8506 ?auto_8507 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8512 - SURFACE
      ?auto_8513 - SURFACE
    )
    :vars
    (
      ?auto_8517 - HOIST
      ?auto_8514 - PLACE
      ?auto_8515 - TRUCK
      ?auto_8516 - PLACE
      ?auto_8518 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8517 ?auto_8514 ) ( SURFACE-AT ?auto_8513 ?auto_8514 ) ( CLEAR ?auto_8513 ) ( IS-CRATE ?auto_8512 ) ( not ( = ?auto_8512 ?auto_8513 ) ) ( AVAILABLE ?auto_8517 ) ( TRUCK-AT ?auto_8515 ?auto_8516 ) ( not ( = ?auto_8516 ?auto_8514 ) ) ( HOIST-AT ?auto_8518 ?auto_8516 ) ( LIFTING ?auto_8518 ?auto_8512 ) ( not ( = ?auto_8517 ?auto_8518 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8518 ?auto_8512 ?auto_8515 ?auto_8516 )
      ( MAKE-ON ?auto_8512 ?auto_8513 )
      ( MAKE-ON-VERIFY ?auto_8512 ?auto_8513 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8519 - SURFACE
      ?auto_8520 - SURFACE
    )
    :vars
    (
      ?auto_8524 - HOIST
      ?auto_8521 - PLACE
      ?auto_8523 - TRUCK
      ?auto_8522 - PLACE
      ?auto_8525 - HOIST
      ?auto_8526 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8524 ?auto_8521 ) ( SURFACE-AT ?auto_8520 ?auto_8521 ) ( CLEAR ?auto_8520 ) ( IS-CRATE ?auto_8519 ) ( not ( = ?auto_8519 ?auto_8520 ) ) ( AVAILABLE ?auto_8524 ) ( TRUCK-AT ?auto_8523 ?auto_8522 ) ( not ( = ?auto_8522 ?auto_8521 ) ) ( HOIST-AT ?auto_8525 ?auto_8522 ) ( not ( = ?auto_8524 ?auto_8525 ) ) ( AVAILABLE ?auto_8525 ) ( SURFACE-AT ?auto_8519 ?auto_8522 ) ( ON ?auto_8519 ?auto_8526 ) ( CLEAR ?auto_8519 ) ( not ( = ?auto_8519 ?auto_8526 ) ) ( not ( = ?auto_8520 ?auto_8526 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8525 ?auto_8519 ?auto_8526 ?auto_8522 )
      ( MAKE-ON ?auto_8519 ?auto_8520 )
      ( MAKE-ON-VERIFY ?auto_8519 ?auto_8520 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8527 - SURFACE
      ?auto_8528 - SURFACE
    )
    :vars
    (
      ?auto_8531 - HOIST
      ?auto_8530 - PLACE
      ?auto_8533 - PLACE
      ?auto_8534 - HOIST
      ?auto_8532 - SURFACE
      ?auto_8529 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8531 ?auto_8530 ) ( SURFACE-AT ?auto_8528 ?auto_8530 ) ( CLEAR ?auto_8528 ) ( IS-CRATE ?auto_8527 ) ( not ( = ?auto_8527 ?auto_8528 ) ) ( AVAILABLE ?auto_8531 ) ( not ( = ?auto_8533 ?auto_8530 ) ) ( HOIST-AT ?auto_8534 ?auto_8533 ) ( not ( = ?auto_8531 ?auto_8534 ) ) ( AVAILABLE ?auto_8534 ) ( SURFACE-AT ?auto_8527 ?auto_8533 ) ( ON ?auto_8527 ?auto_8532 ) ( CLEAR ?auto_8527 ) ( not ( = ?auto_8527 ?auto_8532 ) ) ( not ( = ?auto_8528 ?auto_8532 ) ) ( TRUCK-AT ?auto_8529 ?auto_8530 ) )
    :subtasks
    ( ( !DRIVE ?auto_8529 ?auto_8530 ?auto_8533 )
      ( MAKE-ON ?auto_8527 ?auto_8528 )
      ( MAKE-ON-VERIFY ?auto_8527 ?auto_8528 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8535 - SURFACE
      ?auto_8536 - SURFACE
    )
    :vars
    (
      ?auto_8538 - HOIST
      ?auto_8540 - PLACE
      ?auto_8539 - PLACE
      ?auto_8542 - HOIST
      ?auto_8537 - SURFACE
      ?auto_8541 - TRUCK
      ?auto_8543 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8538 ?auto_8540 ) ( IS-CRATE ?auto_8535 ) ( not ( = ?auto_8535 ?auto_8536 ) ) ( not ( = ?auto_8539 ?auto_8540 ) ) ( HOIST-AT ?auto_8542 ?auto_8539 ) ( not ( = ?auto_8538 ?auto_8542 ) ) ( AVAILABLE ?auto_8542 ) ( SURFACE-AT ?auto_8535 ?auto_8539 ) ( ON ?auto_8535 ?auto_8537 ) ( CLEAR ?auto_8535 ) ( not ( = ?auto_8535 ?auto_8537 ) ) ( not ( = ?auto_8536 ?auto_8537 ) ) ( TRUCK-AT ?auto_8541 ?auto_8540 ) ( SURFACE-AT ?auto_8543 ?auto_8540 ) ( CLEAR ?auto_8543 ) ( LIFTING ?auto_8538 ?auto_8536 ) ( IS-CRATE ?auto_8536 ) ( not ( = ?auto_8535 ?auto_8543 ) ) ( not ( = ?auto_8536 ?auto_8543 ) ) ( not ( = ?auto_8537 ?auto_8543 ) ) )
    :subtasks
    ( ( !DROP ?auto_8538 ?auto_8536 ?auto_8543 ?auto_8540 )
      ( MAKE-ON ?auto_8535 ?auto_8536 )
      ( MAKE-ON-VERIFY ?auto_8535 ?auto_8536 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8544 - SURFACE
      ?auto_8545 - SURFACE
    )
    :vars
    (
      ?auto_8546 - HOIST
      ?auto_8551 - PLACE
      ?auto_8550 - PLACE
      ?auto_8547 - HOIST
      ?auto_8548 - SURFACE
      ?auto_8552 - TRUCK
      ?auto_8549 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8546 ?auto_8551 ) ( IS-CRATE ?auto_8544 ) ( not ( = ?auto_8544 ?auto_8545 ) ) ( not ( = ?auto_8550 ?auto_8551 ) ) ( HOIST-AT ?auto_8547 ?auto_8550 ) ( not ( = ?auto_8546 ?auto_8547 ) ) ( AVAILABLE ?auto_8547 ) ( SURFACE-AT ?auto_8544 ?auto_8550 ) ( ON ?auto_8544 ?auto_8548 ) ( CLEAR ?auto_8544 ) ( not ( = ?auto_8544 ?auto_8548 ) ) ( not ( = ?auto_8545 ?auto_8548 ) ) ( TRUCK-AT ?auto_8552 ?auto_8551 ) ( SURFACE-AT ?auto_8549 ?auto_8551 ) ( CLEAR ?auto_8549 ) ( IS-CRATE ?auto_8545 ) ( not ( = ?auto_8544 ?auto_8549 ) ) ( not ( = ?auto_8545 ?auto_8549 ) ) ( not ( = ?auto_8548 ?auto_8549 ) ) ( AVAILABLE ?auto_8546 ) ( IN ?auto_8545 ?auto_8552 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8546 ?auto_8545 ?auto_8552 ?auto_8551 )
      ( MAKE-ON ?auto_8544 ?auto_8545 )
      ( MAKE-ON-VERIFY ?auto_8544 ?auto_8545 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8553 - SURFACE
      ?auto_8554 - SURFACE
    )
    :vars
    (
      ?auto_8557 - HOIST
      ?auto_8556 - PLACE
      ?auto_8559 - PLACE
      ?auto_8561 - HOIST
      ?auto_8555 - SURFACE
      ?auto_8558 - SURFACE
      ?auto_8560 - TRUCK
      ?auto_8562 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8557 ?auto_8556 ) ( IS-CRATE ?auto_8553 ) ( not ( = ?auto_8553 ?auto_8554 ) ) ( not ( = ?auto_8559 ?auto_8556 ) ) ( HOIST-AT ?auto_8561 ?auto_8559 ) ( not ( = ?auto_8557 ?auto_8561 ) ) ( AVAILABLE ?auto_8561 ) ( SURFACE-AT ?auto_8553 ?auto_8559 ) ( ON ?auto_8553 ?auto_8555 ) ( CLEAR ?auto_8553 ) ( not ( = ?auto_8553 ?auto_8555 ) ) ( not ( = ?auto_8554 ?auto_8555 ) ) ( SURFACE-AT ?auto_8558 ?auto_8556 ) ( CLEAR ?auto_8558 ) ( IS-CRATE ?auto_8554 ) ( not ( = ?auto_8553 ?auto_8558 ) ) ( not ( = ?auto_8554 ?auto_8558 ) ) ( not ( = ?auto_8555 ?auto_8558 ) ) ( AVAILABLE ?auto_8557 ) ( IN ?auto_8554 ?auto_8560 ) ( TRUCK-AT ?auto_8560 ?auto_8562 ) ( not ( = ?auto_8562 ?auto_8556 ) ) ( not ( = ?auto_8559 ?auto_8562 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8560 ?auto_8562 ?auto_8556 )
      ( MAKE-ON ?auto_8553 ?auto_8554 )
      ( MAKE-ON-VERIFY ?auto_8553 ?auto_8554 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8563 - SURFACE
      ?auto_8564 - SURFACE
    )
    :vars
    (
      ?auto_8568 - HOIST
      ?auto_8570 - PLACE
      ?auto_8567 - PLACE
      ?auto_8571 - HOIST
      ?auto_8572 - SURFACE
      ?auto_8565 - SURFACE
      ?auto_8566 - TRUCK
      ?auto_8569 - PLACE
      ?auto_8573 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8568 ?auto_8570 ) ( IS-CRATE ?auto_8563 ) ( not ( = ?auto_8563 ?auto_8564 ) ) ( not ( = ?auto_8567 ?auto_8570 ) ) ( HOIST-AT ?auto_8571 ?auto_8567 ) ( not ( = ?auto_8568 ?auto_8571 ) ) ( AVAILABLE ?auto_8571 ) ( SURFACE-AT ?auto_8563 ?auto_8567 ) ( ON ?auto_8563 ?auto_8572 ) ( CLEAR ?auto_8563 ) ( not ( = ?auto_8563 ?auto_8572 ) ) ( not ( = ?auto_8564 ?auto_8572 ) ) ( SURFACE-AT ?auto_8565 ?auto_8570 ) ( CLEAR ?auto_8565 ) ( IS-CRATE ?auto_8564 ) ( not ( = ?auto_8563 ?auto_8565 ) ) ( not ( = ?auto_8564 ?auto_8565 ) ) ( not ( = ?auto_8572 ?auto_8565 ) ) ( AVAILABLE ?auto_8568 ) ( TRUCK-AT ?auto_8566 ?auto_8569 ) ( not ( = ?auto_8569 ?auto_8570 ) ) ( not ( = ?auto_8567 ?auto_8569 ) ) ( HOIST-AT ?auto_8573 ?auto_8569 ) ( LIFTING ?auto_8573 ?auto_8564 ) ( not ( = ?auto_8568 ?auto_8573 ) ) ( not ( = ?auto_8571 ?auto_8573 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8573 ?auto_8564 ?auto_8566 ?auto_8569 )
      ( MAKE-ON ?auto_8563 ?auto_8564 )
      ( MAKE-ON-VERIFY ?auto_8563 ?auto_8564 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8574 - SURFACE
      ?auto_8575 - SURFACE
    )
    :vars
    (
      ?auto_8578 - HOIST
      ?auto_8581 - PLACE
      ?auto_8576 - PLACE
      ?auto_8577 - HOIST
      ?auto_8579 - SURFACE
      ?auto_8583 - SURFACE
      ?auto_8582 - TRUCK
      ?auto_8580 - PLACE
      ?auto_8584 - HOIST
      ?auto_8585 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8578 ?auto_8581 ) ( IS-CRATE ?auto_8574 ) ( not ( = ?auto_8574 ?auto_8575 ) ) ( not ( = ?auto_8576 ?auto_8581 ) ) ( HOIST-AT ?auto_8577 ?auto_8576 ) ( not ( = ?auto_8578 ?auto_8577 ) ) ( AVAILABLE ?auto_8577 ) ( SURFACE-AT ?auto_8574 ?auto_8576 ) ( ON ?auto_8574 ?auto_8579 ) ( CLEAR ?auto_8574 ) ( not ( = ?auto_8574 ?auto_8579 ) ) ( not ( = ?auto_8575 ?auto_8579 ) ) ( SURFACE-AT ?auto_8583 ?auto_8581 ) ( CLEAR ?auto_8583 ) ( IS-CRATE ?auto_8575 ) ( not ( = ?auto_8574 ?auto_8583 ) ) ( not ( = ?auto_8575 ?auto_8583 ) ) ( not ( = ?auto_8579 ?auto_8583 ) ) ( AVAILABLE ?auto_8578 ) ( TRUCK-AT ?auto_8582 ?auto_8580 ) ( not ( = ?auto_8580 ?auto_8581 ) ) ( not ( = ?auto_8576 ?auto_8580 ) ) ( HOIST-AT ?auto_8584 ?auto_8580 ) ( not ( = ?auto_8578 ?auto_8584 ) ) ( not ( = ?auto_8577 ?auto_8584 ) ) ( AVAILABLE ?auto_8584 ) ( SURFACE-AT ?auto_8575 ?auto_8580 ) ( ON ?auto_8575 ?auto_8585 ) ( CLEAR ?auto_8575 ) ( not ( = ?auto_8574 ?auto_8585 ) ) ( not ( = ?auto_8575 ?auto_8585 ) ) ( not ( = ?auto_8579 ?auto_8585 ) ) ( not ( = ?auto_8583 ?auto_8585 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8584 ?auto_8575 ?auto_8585 ?auto_8580 )
      ( MAKE-ON ?auto_8574 ?auto_8575 )
      ( MAKE-ON-VERIFY ?auto_8574 ?auto_8575 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8586 - SURFACE
      ?auto_8587 - SURFACE
    )
    :vars
    (
      ?auto_8588 - HOIST
      ?auto_8597 - PLACE
      ?auto_8593 - PLACE
      ?auto_8592 - HOIST
      ?auto_8596 - SURFACE
      ?auto_8591 - SURFACE
      ?auto_8590 - PLACE
      ?auto_8595 - HOIST
      ?auto_8589 - SURFACE
      ?auto_8594 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8588 ?auto_8597 ) ( IS-CRATE ?auto_8586 ) ( not ( = ?auto_8586 ?auto_8587 ) ) ( not ( = ?auto_8593 ?auto_8597 ) ) ( HOIST-AT ?auto_8592 ?auto_8593 ) ( not ( = ?auto_8588 ?auto_8592 ) ) ( AVAILABLE ?auto_8592 ) ( SURFACE-AT ?auto_8586 ?auto_8593 ) ( ON ?auto_8586 ?auto_8596 ) ( CLEAR ?auto_8586 ) ( not ( = ?auto_8586 ?auto_8596 ) ) ( not ( = ?auto_8587 ?auto_8596 ) ) ( SURFACE-AT ?auto_8591 ?auto_8597 ) ( CLEAR ?auto_8591 ) ( IS-CRATE ?auto_8587 ) ( not ( = ?auto_8586 ?auto_8591 ) ) ( not ( = ?auto_8587 ?auto_8591 ) ) ( not ( = ?auto_8596 ?auto_8591 ) ) ( AVAILABLE ?auto_8588 ) ( not ( = ?auto_8590 ?auto_8597 ) ) ( not ( = ?auto_8593 ?auto_8590 ) ) ( HOIST-AT ?auto_8595 ?auto_8590 ) ( not ( = ?auto_8588 ?auto_8595 ) ) ( not ( = ?auto_8592 ?auto_8595 ) ) ( AVAILABLE ?auto_8595 ) ( SURFACE-AT ?auto_8587 ?auto_8590 ) ( ON ?auto_8587 ?auto_8589 ) ( CLEAR ?auto_8587 ) ( not ( = ?auto_8586 ?auto_8589 ) ) ( not ( = ?auto_8587 ?auto_8589 ) ) ( not ( = ?auto_8596 ?auto_8589 ) ) ( not ( = ?auto_8591 ?auto_8589 ) ) ( TRUCK-AT ?auto_8594 ?auto_8597 ) )
    :subtasks
    ( ( !DRIVE ?auto_8594 ?auto_8597 ?auto_8590 )
      ( MAKE-ON ?auto_8586 ?auto_8587 )
      ( MAKE-ON-VERIFY ?auto_8586 ?auto_8587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8598 - SURFACE
      ?auto_8599 - SURFACE
    )
    :vars
    (
      ?auto_8606 - HOIST
      ?auto_8604 - PLACE
      ?auto_8608 - PLACE
      ?auto_8607 - HOIST
      ?auto_8600 - SURFACE
      ?auto_8605 - SURFACE
      ?auto_8601 - PLACE
      ?auto_8609 - HOIST
      ?auto_8602 - SURFACE
      ?auto_8603 - TRUCK
      ?auto_8610 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8606 ?auto_8604 ) ( IS-CRATE ?auto_8598 ) ( not ( = ?auto_8598 ?auto_8599 ) ) ( not ( = ?auto_8608 ?auto_8604 ) ) ( HOIST-AT ?auto_8607 ?auto_8608 ) ( not ( = ?auto_8606 ?auto_8607 ) ) ( AVAILABLE ?auto_8607 ) ( SURFACE-AT ?auto_8598 ?auto_8608 ) ( ON ?auto_8598 ?auto_8600 ) ( CLEAR ?auto_8598 ) ( not ( = ?auto_8598 ?auto_8600 ) ) ( not ( = ?auto_8599 ?auto_8600 ) ) ( IS-CRATE ?auto_8599 ) ( not ( = ?auto_8598 ?auto_8605 ) ) ( not ( = ?auto_8599 ?auto_8605 ) ) ( not ( = ?auto_8600 ?auto_8605 ) ) ( not ( = ?auto_8601 ?auto_8604 ) ) ( not ( = ?auto_8608 ?auto_8601 ) ) ( HOIST-AT ?auto_8609 ?auto_8601 ) ( not ( = ?auto_8606 ?auto_8609 ) ) ( not ( = ?auto_8607 ?auto_8609 ) ) ( AVAILABLE ?auto_8609 ) ( SURFACE-AT ?auto_8599 ?auto_8601 ) ( ON ?auto_8599 ?auto_8602 ) ( CLEAR ?auto_8599 ) ( not ( = ?auto_8598 ?auto_8602 ) ) ( not ( = ?auto_8599 ?auto_8602 ) ) ( not ( = ?auto_8600 ?auto_8602 ) ) ( not ( = ?auto_8605 ?auto_8602 ) ) ( TRUCK-AT ?auto_8603 ?auto_8604 ) ( SURFACE-AT ?auto_8610 ?auto_8604 ) ( CLEAR ?auto_8610 ) ( LIFTING ?auto_8606 ?auto_8605 ) ( IS-CRATE ?auto_8605 ) ( not ( = ?auto_8598 ?auto_8610 ) ) ( not ( = ?auto_8599 ?auto_8610 ) ) ( not ( = ?auto_8600 ?auto_8610 ) ) ( not ( = ?auto_8605 ?auto_8610 ) ) ( not ( = ?auto_8602 ?auto_8610 ) ) )
    :subtasks
    ( ( !DROP ?auto_8606 ?auto_8605 ?auto_8610 ?auto_8604 )
      ( MAKE-ON ?auto_8598 ?auto_8599 )
      ( MAKE-ON-VERIFY ?auto_8598 ?auto_8599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8611 - SURFACE
      ?auto_8612 - SURFACE
    )
    :vars
    (
      ?auto_8620 - HOIST
      ?auto_8621 - PLACE
      ?auto_8618 - PLACE
      ?auto_8619 - HOIST
      ?auto_8617 - SURFACE
      ?auto_8614 - SURFACE
      ?auto_8623 - PLACE
      ?auto_8622 - HOIST
      ?auto_8615 - SURFACE
      ?auto_8616 - TRUCK
      ?auto_8613 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8620 ?auto_8621 ) ( IS-CRATE ?auto_8611 ) ( not ( = ?auto_8611 ?auto_8612 ) ) ( not ( = ?auto_8618 ?auto_8621 ) ) ( HOIST-AT ?auto_8619 ?auto_8618 ) ( not ( = ?auto_8620 ?auto_8619 ) ) ( AVAILABLE ?auto_8619 ) ( SURFACE-AT ?auto_8611 ?auto_8618 ) ( ON ?auto_8611 ?auto_8617 ) ( CLEAR ?auto_8611 ) ( not ( = ?auto_8611 ?auto_8617 ) ) ( not ( = ?auto_8612 ?auto_8617 ) ) ( IS-CRATE ?auto_8612 ) ( not ( = ?auto_8611 ?auto_8614 ) ) ( not ( = ?auto_8612 ?auto_8614 ) ) ( not ( = ?auto_8617 ?auto_8614 ) ) ( not ( = ?auto_8623 ?auto_8621 ) ) ( not ( = ?auto_8618 ?auto_8623 ) ) ( HOIST-AT ?auto_8622 ?auto_8623 ) ( not ( = ?auto_8620 ?auto_8622 ) ) ( not ( = ?auto_8619 ?auto_8622 ) ) ( AVAILABLE ?auto_8622 ) ( SURFACE-AT ?auto_8612 ?auto_8623 ) ( ON ?auto_8612 ?auto_8615 ) ( CLEAR ?auto_8612 ) ( not ( = ?auto_8611 ?auto_8615 ) ) ( not ( = ?auto_8612 ?auto_8615 ) ) ( not ( = ?auto_8617 ?auto_8615 ) ) ( not ( = ?auto_8614 ?auto_8615 ) ) ( TRUCK-AT ?auto_8616 ?auto_8621 ) ( SURFACE-AT ?auto_8613 ?auto_8621 ) ( CLEAR ?auto_8613 ) ( IS-CRATE ?auto_8614 ) ( not ( = ?auto_8611 ?auto_8613 ) ) ( not ( = ?auto_8612 ?auto_8613 ) ) ( not ( = ?auto_8617 ?auto_8613 ) ) ( not ( = ?auto_8614 ?auto_8613 ) ) ( not ( = ?auto_8615 ?auto_8613 ) ) ( AVAILABLE ?auto_8620 ) ( IN ?auto_8614 ?auto_8616 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8620 ?auto_8614 ?auto_8616 ?auto_8621 )
      ( MAKE-ON ?auto_8611 ?auto_8612 )
      ( MAKE-ON-VERIFY ?auto_8611 ?auto_8612 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8624 - SURFACE
      ?auto_8625 - SURFACE
    )
    :vars
    (
      ?auto_8629 - HOIST
      ?auto_8626 - PLACE
      ?auto_8632 - PLACE
      ?auto_8631 - HOIST
      ?auto_8633 - SURFACE
      ?auto_8627 - SURFACE
      ?auto_8634 - PLACE
      ?auto_8628 - HOIST
      ?auto_8636 - SURFACE
      ?auto_8630 - SURFACE
      ?auto_8635 - TRUCK
      ?auto_8637 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8629 ?auto_8626 ) ( IS-CRATE ?auto_8624 ) ( not ( = ?auto_8624 ?auto_8625 ) ) ( not ( = ?auto_8632 ?auto_8626 ) ) ( HOIST-AT ?auto_8631 ?auto_8632 ) ( not ( = ?auto_8629 ?auto_8631 ) ) ( AVAILABLE ?auto_8631 ) ( SURFACE-AT ?auto_8624 ?auto_8632 ) ( ON ?auto_8624 ?auto_8633 ) ( CLEAR ?auto_8624 ) ( not ( = ?auto_8624 ?auto_8633 ) ) ( not ( = ?auto_8625 ?auto_8633 ) ) ( IS-CRATE ?auto_8625 ) ( not ( = ?auto_8624 ?auto_8627 ) ) ( not ( = ?auto_8625 ?auto_8627 ) ) ( not ( = ?auto_8633 ?auto_8627 ) ) ( not ( = ?auto_8634 ?auto_8626 ) ) ( not ( = ?auto_8632 ?auto_8634 ) ) ( HOIST-AT ?auto_8628 ?auto_8634 ) ( not ( = ?auto_8629 ?auto_8628 ) ) ( not ( = ?auto_8631 ?auto_8628 ) ) ( AVAILABLE ?auto_8628 ) ( SURFACE-AT ?auto_8625 ?auto_8634 ) ( ON ?auto_8625 ?auto_8636 ) ( CLEAR ?auto_8625 ) ( not ( = ?auto_8624 ?auto_8636 ) ) ( not ( = ?auto_8625 ?auto_8636 ) ) ( not ( = ?auto_8633 ?auto_8636 ) ) ( not ( = ?auto_8627 ?auto_8636 ) ) ( SURFACE-AT ?auto_8630 ?auto_8626 ) ( CLEAR ?auto_8630 ) ( IS-CRATE ?auto_8627 ) ( not ( = ?auto_8624 ?auto_8630 ) ) ( not ( = ?auto_8625 ?auto_8630 ) ) ( not ( = ?auto_8633 ?auto_8630 ) ) ( not ( = ?auto_8627 ?auto_8630 ) ) ( not ( = ?auto_8636 ?auto_8630 ) ) ( AVAILABLE ?auto_8629 ) ( IN ?auto_8627 ?auto_8635 ) ( TRUCK-AT ?auto_8635 ?auto_8637 ) ( not ( = ?auto_8637 ?auto_8626 ) ) ( not ( = ?auto_8632 ?auto_8637 ) ) ( not ( = ?auto_8634 ?auto_8637 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8635 ?auto_8637 ?auto_8626 )
      ( MAKE-ON ?auto_8624 ?auto_8625 )
      ( MAKE-ON-VERIFY ?auto_8624 ?auto_8625 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8638 - SURFACE
      ?auto_8639 - SURFACE
    )
    :vars
    (
      ?auto_8644 - HOIST
      ?auto_8646 - PLACE
      ?auto_8647 - PLACE
      ?auto_8650 - HOIST
      ?auto_8642 - SURFACE
      ?auto_8645 - SURFACE
      ?auto_8651 - PLACE
      ?auto_8648 - HOIST
      ?auto_8640 - SURFACE
      ?auto_8641 - SURFACE
      ?auto_8643 - TRUCK
      ?auto_8649 - PLACE
      ?auto_8652 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8644 ?auto_8646 ) ( IS-CRATE ?auto_8638 ) ( not ( = ?auto_8638 ?auto_8639 ) ) ( not ( = ?auto_8647 ?auto_8646 ) ) ( HOIST-AT ?auto_8650 ?auto_8647 ) ( not ( = ?auto_8644 ?auto_8650 ) ) ( AVAILABLE ?auto_8650 ) ( SURFACE-AT ?auto_8638 ?auto_8647 ) ( ON ?auto_8638 ?auto_8642 ) ( CLEAR ?auto_8638 ) ( not ( = ?auto_8638 ?auto_8642 ) ) ( not ( = ?auto_8639 ?auto_8642 ) ) ( IS-CRATE ?auto_8639 ) ( not ( = ?auto_8638 ?auto_8645 ) ) ( not ( = ?auto_8639 ?auto_8645 ) ) ( not ( = ?auto_8642 ?auto_8645 ) ) ( not ( = ?auto_8651 ?auto_8646 ) ) ( not ( = ?auto_8647 ?auto_8651 ) ) ( HOIST-AT ?auto_8648 ?auto_8651 ) ( not ( = ?auto_8644 ?auto_8648 ) ) ( not ( = ?auto_8650 ?auto_8648 ) ) ( AVAILABLE ?auto_8648 ) ( SURFACE-AT ?auto_8639 ?auto_8651 ) ( ON ?auto_8639 ?auto_8640 ) ( CLEAR ?auto_8639 ) ( not ( = ?auto_8638 ?auto_8640 ) ) ( not ( = ?auto_8639 ?auto_8640 ) ) ( not ( = ?auto_8642 ?auto_8640 ) ) ( not ( = ?auto_8645 ?auto_8640 ) ) ( SURFACE-AT ?auto_8641 ?auto_8646 ) ( CLEAR ?auto_8641 ) ( IS-CRATE ?auto_8645 ) ( not ( = ?auto_8638 ?auto_8641 ) ) ( not ( = ?auto_8639 ?auto_8641 ) ) ( not ( = ?auto_8642 ?auto_8641 ) ) ( not ( = ?auto_8645 ?auto_8641 ) ) ( not ( = ?auto_8640 ?auto_8641 ) ) ( AVAILABLE ?auto_8644 ) ( TRUCK-AT ?auto_8643 ?auto_8649 ) ( not ( = ?auto_8649 ?auto_8646 ) ) ( not ( = ?auto_8647 ?auto_8649 ) ) ( not ( = ?auto_8651 ?auto_8649 ) ) ( HOIST-AT ?auto_8652 ?auto_8649 ) ( LIFTING ?auto_8652 ?auto_8645 ) ( not ( = ?auto_8644 ?auto_8652 ) ) ( not ( = ?auto_8650 ?auto_8652 ) ) ( not ( = ?auto_8648 ?auto_8652 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8652 ?auto_8645 ?auto_8643 ?auto_8649 )
      ( MAKE-ON ?auto_8638 ?auto_8639 )
      ( MAKE-ON-VERIFY ?auto_8638 ?auto_8639 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8653 - SURFACE
      ?auto_8654 - SURFACE
    )
    :vars
    (
      ?auto_8662 - HOIST
      ?auto_8655 - PLACE
      ?auto_8663 - PLACE
      ?auto_8667 - HOIST
      ?auto_8666 - SURFACE
      ?auto_8664 - SURFACE
      ?auto_8656 - PLACE
      ?auto_8660 - HOIST
      ?auto_8659 - SURFACE
      ?auto_8661 - SURFACE
      ?auto_8657 - TRUCK
      ?auto_8665 - PLACE
      ?auto_8658 - HOIST
      ?auto_8668 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8662 ?auto_8655 ) ( IS-CRATE ?auto_8653 ) ( not ( = ?auto_8653 ?auto_8654 ) ) ( not ( = ?auto_8663 ?auto_8655 ) ) ( HOIST-AT ?auto_8667 ?auto_8663 ) ( not ( = ?auto_8662 ?auto_8667 ) ) ( AVAILABLE ?auto_8667 ) ( SURFACE-AT ?auto_8653 ?auto_8663 ) ( ON ?auto_8653 ?auto_8666 ) ( CLEAR ?auto_8653 ) ( not ( = ?auto_8653 ?auto_8666 ) ) ( not ( = ?auto_8654 ?auto_8666 ) ) ( IS-CRATE ?auto_8654 ) ( not ( = ?auto_8653 ?auto_8664 ) ) ( not ( = ?auto_8654 ?auto_8664 ) ) ( not ( = ?auto_8666 ?auto_8664 ) ) ( not ( = ?auto_8656 ?auto_8655 ) ) ( not ( = ?auto_8663 ?auto_8656 ) ) ( HOIST-AT ?auto_8660 ?auto_8656 ) ( not ( = ?auto_8662 ?auto_8660 ) ) ( not ( = ?auto_8667 ?auto_8660 ) ) ( AVAILABLE ?auto_8660 ) ( SURFACE-AT ?auto_8654 ?auto_8656 ) ( ON ?auto_8654 ?auto_8659 ) ( CLEAR ?auto_8654 ) ( not ( = ?auto_8653 ?auto_8659 ) ) ( not ( = ?auto_8654 ?auto_8659 ) ) ( not ( = ?auto_8666 ?auto_8659 ) ) ( not ( = ?auto_8664 ?auto_8659 ) ) ( SURFACE-AT ?auto_8661 ?auto_8655 ) ( CLEAR ?auto_8661 ) ( IS-CRATE ?auto_8664 ) ( not ( = ?auto_8653 ?auto_8661 ) ) ( not ( = ?auto_8654 ?auto_8661 ) ) ( not ( = ?auto_8666 ?auto_8661 ) ) ( not ( = ?auto_8664 ?auto_8661 ) ) ( not ( = ?auto_8659 ?auto_8661 ) ) ( AVAILABLE ?auto_8662 ) ( TRUCK-AT ?auto_8657 ?auto_8665 ) ( not ( = ?auto_8665 ?auto_8655 ) ) ( not ( = ?auto_8663 ?auto_8665 ) ) ( not ( = ?auto_8656 ?auto_8665 ) ) ( HOIST-AT ?auto_8658 ?auto_8665 ) ( not ( = ?auto_8662 ?auto_8658 ) ) ( not ( = ?auto_8667 ?auto_8658 ) ) ( not ( = ?auto_8660 ?auto_8658 ) ) ( AVAILABLE ?auto_8658 ) ( SURFACE-AT ?auto_8664 ?auto_8665 ) ( ON ?auto_8664 ?auto_8668 ) ( CLEAR ?auto_8664 ) ( not ( = ?auto_8653 ?auto_8668 ) ) ( not ( = ?auto_8654 ?auto_8668 ) ) ( not ( = ?auto_8666 ?auto_8668 ) ) ( not ( = ?auto_8664 ?auto_8668 ) ) ( not ( = ?auto_8659 ?auto_8668 ) ) ( not ( = ?auto_8661 ?auto_8668 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8658 ?auto_8664 ?auto_8668 ?auto_8665 )
      ( MAKE-ON ?auto_8653 ?auto_8654 )
      ( MAKE-ON-VERIFY ?auto_8653 ?auto_8654 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8669 - SURFACE
      ?auto_8670 - SURFACE
    )
    :vars
    (
      ?auto_8674 - HOIST
      ?auto_8684 - PLACE
      ?auto_8679 - PLACE
      ?auto_8681 - HOIST
      ?auto_8678 - SURFACE
      ?auto_8677 - SURFACE
      ?auto_8682 - PLACE
      ?auto_8683 - HOIST
      ?auto_8675 - SURFACE
      ?auto_8673 - SURFACE
      ?auto_8671 - PLACE
      ?auto_8672 - HOIST
      ?auto_8680 - SURFACE
      ?auto_8676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8674 ?auto_8684 ) ( IS-CRATE ?auto_8669 ) ( not ( = ?auto_8669 ?auto_8670 ) ) ( not ( = ?auto_8679 ?auto_8684 ) ) ( HOIST-AT ?auto_8681 ?auto_8679 ) ( not ( = ?auto_8674 ?auto_8681 ) ) ( AVAILABLE ?auto_8681 ) ( SURFACE-AT ?auto_8669 ?auto_8679 ) ( ON ?auto_8669 ?auto_8678 ) ( CLEAR ?auto_8669 ) ( not ( = ?auto_8669 ?auto_8678 ) ) ( not ( = ?auto_8670 ?auto_8678 ) ) ( IS-CRATE ?auto_8670 ) ( not ( = ?auto_8669 ?auto_8677 ) ) ( not ( = ?auto_8670 ?auto_8677 ) ) ( not ( = ?auto_8678 ?auto_8677 ) ) ( not ( = ?auto_8682 ?auto_8684 ) ) ( not ( = ?auto_8679 ?auto_8682 ) ) ( HOIST-AT ?auto_8683 ?auto_8682 ) ( not ( = ?auto_8674 ?auto_8683 ) ) ( not ( = ?auto_8681 ?auto_8683 ) ) ( AVAILABLE ?auto_8683 ) ( SURFACE-AT ?auto_8670 ?auto_8682 ) ( ON ?auto_8670 ?auto_8675 ) ( CLEAR ?auto_8670 ) ( not ( = ?auto_8669 ?auto_8675 ) ) ( not ( = ?auto_8670 ?auto_8675 ) ) ( not ( = ?auto_8678 ?auto_8675 ) ) ( not ( = ?auto_8677 ?auto_8675 ) ) ( SURFACE-AT ?auto_8673 ?auto_8684 ) ( CLEAR ?auto_8673 ) ( IS-CRATE ?auto_8677 ) ( not ( = ?auto_8669 ?auto_8673 ) ) ( not ( = ?auto_8670 ?auto_8673 ) ) ( not ( = ?auto_8678 ?auto_8673 ) ) ( not ( = ?auto_8677 ?auto_8673 ) ) ( not ( = ?auto_8675 ?auto_8673 ) ) ( AVAILABLE ?auto_8674 ) ( not ( = ?auto_8671 ?auto_8684 ) ) ( not ( = ?auto_8679 ?auto_8671 ) ) ( not ( = ?auto_8682 ?auto_8671 ) ) ( HOIST-AT ?auto_8672 ?auto_8671 ) ( not ( = ?auto_8674 ?auto_8672 ) ) ( not ( = ?auto_8681 ?auto_8672 ) ) ( not ( = ?auto_8683 ?auto_8672 ) ) ( AVAILABLE ?auto_8672 ) ( SURFACE-AT ?auto_8677 ?auto_8671 ) ( ON ?auto_8677 ?auto_8680 ) ( CLEAR ?auto_8677 ) ( not ( = ?auto_8669 ?auto_8680 ) ) ( not ( = ?auto_8670 ?auto_8680 ) ) ( not ( = ?auto_8678 ?auto_8680 ) ) ( not ( = ?auto_8677 ?auto_8680 ) ) ( not ( = ?auto_8675 ?auto_8680 ) ) ( not ( = ?auto_8673 ?auto_8680 ) ) ( TRUCK-AT ?auto_8676 ?auto_8684 ) )
    :subtasks
    ( ( !DRIVE ?auto_8676 ?auto_8684 ?auto_8671 )
      ( MAKE-ON ?auto_8669 ?auto_8670 )
      ( MAKE-ON-VERIFY ?auto_8669 ?auto_8670 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8687 - SURFACE
      ?auto_8688 - SURFACE
    )
    :vars
    (
      ?auto_8689 - HOIST
      ?auto_8690 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8689 ?auto_8690 ) ( SURFACE-AT ?auto_8688 ?auto_8690 ) ( CLEAR ?auto_8688 ) ( LIFTING ?auto_8689 ?auto_8687 ) ( IS-CRATE ?auto_8687 ) ( not ( = ?auto_8687 ?auto_8688 ) ) )
    :subtasks
    ( ( !DROP ?auto_8689 ?auto_8687 ?auto_8688 ?auto_8690 )
      ( MAKE-ON-VERIFY ?auto_8687 ?auto_8688 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8691 - SURFACE
      ?auto_8692 - SURFACE
    )
    :vars
    (
      ?auto_8694 - HOIST
      ?auto_8693 - PLACE
      ?auto_8695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8694 ?auto_8693 ) ( SURFACE-AT ?auto_8692 ?auto_8693 ) ( CLEAR ?auto_8692 ) ( IS-CRATE ?auto_8691 ) ( not ( = ?auto_8691 ?auto_8692 ) ) ( TRUCK-AT ?auto_8695 ?auto_8693 ) ( AVAILABLE ?auto_8694 ) ( IN ?auto_8691 ?auto_8695 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8694 ?auto_8691 ?auto_8695 ?auto_8693 )
      ( MAKE-ON ?auto_8691 ?auto_8692 )
      ( MAKE-ON-VERIFY ?auto_8691 ?auto_8692 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8696 - SURFACE
      ?auto_8697 - SURFACE
    )
    :vars
    (
      ?auto_8699 - HOIST
      ?auto_8698 - PLACE
      ?auto_8700 - TRUCK
      ?auto_8701 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8699 ?auto_8698 ) ( SURFACE-AT ?auto_8697 ?auto_8698 ) ( CLEAR ?auto_8697 ) ( IS-CRATE ?auto_8696 ) ( not ( = ?auto_8696 ?auto_8697 ) ) ( AVAILABLE ?auto_8699 ) ( IN ?auto_8696 ?auto_8700 ) ( TRUCK-AT ?auto_8700 ?auto_8701 ) ( not ( = ?auto_8701 ?auto_8698 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8700 ?auto_8701 ?auto_8698 )
      ( MAKE-ON ?auto_8696 ?auto_8697 )
      ( MAKE-ON-VERIFY ?auto_8696 ?auto_8697 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8702 - SURFACE
      ?auto_8703 - SURFACE
    )
    :vars
    (
      ?auto_8706 - HOIST
      ?auto_8705 - PLACE
      ?auto_8704 - TRUCK
      ?auto_8707 - PLACE
      ?auto_8708 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8706 ?auto_8705 ) ( SURFACE-AT ?auto_8703 ?auto_8705 ) ( CLEAR ?auto_8703 ) ( IS-CRATE ?auto_8702 ) ( not ( = ?auto_8702 ?auto_8703 ) ) ( AVAILABLE ?auto_8706 ) ( TRUCK-AT ?auto_8704 ?auto_8707 ) ( not ( = ?auto_8707 ?auto_8705 ) ) ( HOIST-AT ?auto_8708 ?auto_8707 ) ( LIFTING ?auto_8708 ?auto_8702 ) ( not ( = ?auto_8706 ?auto_8708 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8708 ?auto_8702 ?auto_8704 ?auto_8707 )
      ( MAKE-ON ?auto_8702 ?auto_8703 )
      ( MAKE-ON-VERIFY ?auto_8702 ?auto_8703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8709 - SURFACE
      ?auto_8710 - SURFACE
    )
    :vars
    (
      ?auto_8713 - HOIST
      ?auto_8711 - PLACE
      ?auto_8712 - TRUCK
      ?auto_8715 - PLACE
      ?auto_8714 - HOIST
      ?auto_8716 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8713 ?auto_8711 ) ( SURFACE-AT ?auto_8710 ?auto_8711 ) ( CLEAR ?auto_8710 ) ( IS-CRATE ?auto_8709 ) ( not ( = ?auto_8709 ?auto_8710 ) ) ( AVAILABLE ?auto_8713 ) ( TRUCK-AT ?auto_8712 ?auto_8715 ) ( not ( = ?auto_8715 ?auto_8711 ) ) ( HOIST-AT ?auto_8714 ?auto_8715 ) ( not ( = ?auto_8713 ?auto_8714 ) ) ( AVAILABLE ?auto_8714 ) ( SURFACE-AT ?auto_8709 ?auto_8715 ) ( ON ?auto_8709 ?auto_8716 ) ( CLEAR ?auto_8709 ) ( not ( = ?auto_8709 ?auto_8716 ) ) ( not ( = ?auto_8710 ?auto_8716 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8714 ?auto_8709 ?auto_8716 ?auto_8715 )
      ( MAKE-ON ?auto_8709 ?auto_8710 )
      ( MAKE-ON-VERIFY ?auto_8709 ?auto_8710 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8717 - SURFACE
      ?auto_8718 - SURFACE
    )
    :vars
    (
      ?auto_8719 - HOIST
      ?auto_8721 - PLACE
      ?auto_8722 - PLACE
      ?auto_8724 - HOIST
      ?auto_8720 - SURFACE
      ?auto_8723 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8719 ?auto_8721 ) ( SURFACE-AT ?auto_8718 ?auto_8721 ) ( CLEAR ?auto_8718 ) ( IS-CRATE ?auto_8717 ) ( not ( = ?auto_8717 ?auto_8718 ) ) ( AVAILABLE ?auto_8719 ) ( not ( = ?auto_8722 ?auto_8721 ) ) ( HOIST-AT ?auto_8724 ?auto_8722 ) ( not ( = ?auto_8719 ?auto_8724 ) ) ( AVAILABLE ?auto_8724 ) ( SURFACE-AT ?auto_8717 ?auto_8722 ) ( ON ?auto_8717 ?auto_8720 ) ( CLEAR ?auto_8717 ) ( not ( = ?auto_8717 ?auto_8720 ) ) ( not ( = ?auto_8718 ?auto_8720 ) ) ( TRUCK-AT ?auto_8723 ?auto_8721 ) )
    :subtasks
    ( ( !DRIVE ?auto_8723 ?auto_8721 ?auto_8722 )
      ( MAKE-ON ?auto_8717 ?auto_8718 )
      ( MAKE-ON-VERIFY ?auto_8717 ?auto_8718 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8725 - SURFACE
      ?auto_8726 - SURFACE
    )
    :vars
    (
      ?auto_8727 - HOIST
      ?auto_8731 - PLACE
      ?auto_8732 - PLACE
      ?auto_8729 - HOIST
      ?auto_8728 - SURFACE
      ?auto_8730 - TRUCK
      ?auto_8733 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8727 ?auto_8731 ) ( IS-CRATE ?auto_8725 ) ( not ( = ?auto_8725 ?auto_8726 ) ) ( not ( = ?auto_8732 ?auto_8731 ) ) ( HOIST-AT ?auto_8729 ?auto_8732 ) ( not ( = ?auto_8727 ?auto_8729 ) ) ( AVAILABLE ?auto_8729 ) ( SURFACE-AT ?auto_8725 ?auto_8732 ) ( ON ?auto_8725 ?auto_8728 ) ( CLEAR ?auto_8725 ) ( not ( = ?auto_8725 ?auto_8728 ) ) ( not ( = ?auto_8726 ?auto_8728 ) ) ( TRUCK-AT ?auto_8730 ?auto_8731 ) ( SURFACE-AT ?auto_8733 ?auto_8731 ) ( CLEAR ?auto_8733 ) ( LIFTING ?auto_8727 ?auto_8726 ) ( IS-CRATE ?auto_8726 ) ( not ( = ?auto_8725 ?auto_8733 ) ) ( not ( = ?auto_8726 ?auto_8733 ) ) ( not ( = ?auto_8728 ?auto_8733 ) ) )
    :subtasks
    ( ( !DROP ?auto_8727 ?auto_8726 ?auto_8733 ?auto_8731 )
      ( MAKE-ON ?auto_8725 ?auto_8726 )
      ( MAKE-ON-VERIFY ?auto_8725 ?auto_8726 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8734 - SURFACE
      ?auto_8735 - SURFACE
    )
    :vars
    (
      ?auto_8742 - HOIST
      ?auto_8736 - PLACE
      ?auto_8737 - PLACE
      ?auto_8739 - HOIST
      ?auto_8738 - SURFACE
      ?auto_8740 - TRUCK
      ?auto_8741 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8742 ?auto_8736 ) ( IS-CRATE ?auto_8734 ) ( not ( = ?auto_8734 ?auto_8735 ) ) ( not ( = ?auto_8737 ?auto_8736 ) ) ( HOIST-AT ?auto_8739 ?auto_8737 ) ( not ( = ?auto_8742 ?auto_8739 ) ) ( AVAILABLE ?auto_8739 ) ( SURFACE-AT ?auto_8734 ?auto_8737 ) ( ON ?auto_8734 ?auto_8738 ) ( CLEAR ?auto_8734 ) ( not ( = ?auto_8734 ?auto_8738 ) ) ( not ( = ?auto_8735 ?auto_8738 ) ) ( TRUCK-AT ?auto_8740 ?auto_8736 ) ( SURFACE-AT ?auto_8741 ?auto_8736 ) ( CLEAR ?auto_8741 ) ( IS-CRATE ?auto_8735 ) ( not ( = ?auto_8734 ?auto_8741 ) ) ( not ( = ?auto_8735 ?auto_8741 ) ) ( not ( = ?auto_8738 ?auto_8741 ) ) ( AVAILABLE ?auto_8742 ) ( IN ?auto_8735 ?auto_8740 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8742 ?auto_8735 ?auto_8740 ?auto_8736 )
      ( MAKE-ON ?auto_8734 ?auto_8735 )
      ( MAKE-ON-VERIFY ?auto_8734 ?auto_8735 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8743 - SURFACE
      ?auto_8744 - SURFACE
    )
    :vars
    (
      ?auto_8751 - HOIST
      ?auto_8748 - PLACE
      ?auto_8749 - PLACE
      ?auto_8746 - HOIST
      ?auto_8745 - SURFACE
      ?auto_8750 - SURFACE
      ?auto_8747 - TRUCK
      ?auto_8752 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8751 ?auto_8748 ) ( IS-CRATE ?auto_8743 ) ( not ( = ?auto_8743 ?auto_8744 ) ) ( not ( = ?auto_8749 ?auto_8748 ) ) ( HOIST-AT ?auto_8746 ?auto_8749 ) ( not ( = ?auto_8751 ?auto_8746 ) ) ( AVAILABLE ?auto_8746 ) ( SURFACE-AT ?auto_8743 ?auto_8749 ) ( ON ?auto_8743 ?auto_8745 ) ( CLEAR ?auto_8743 ) ( not ( = ?auto_8743 ?auto_8745 ) ) ( not ( = ?auto_8744 ?auto_8745 ) ) ( SURFACE-AT ?auto_8750 ?auto_8748 ) ( CLEAR ?auto_8750 ) ( IS-CRATE ?auto_8744 ) ( not ( = ?auto_8743 ?auto_8750 ) ) ( not ( = ?auto_8744 ?auto_8750 ) ) ( not ( = ?auto_8745 ?auto_8750 ) ) ( AVAILABLE ?auto_8751 ) ( IN ?auto_8744 ?auto_8747 ) ( TRUCK-AT ?auto_8747 ?auto_8752 ) ( not ( = ?auto_8752 ?auto_8748 ) ) ( not ( = ?auto_8749 ?auto_8752 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8747 ?auto_8752 ?auto_8748 )
      ( MAKE-ON ?auto_8743 ?auto_8744 )
      ( MAKE-ON-VERIFY ?auto_8743 ?auto_8744 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8753 - SURFACE
      ?auto_8754 - SURFACE
    )
    :vars
    (
      ?auto_8755 - HOIST
      ?auto_8759 - PLACE
      ?auto_8757 - PLACE
      ?auto_8756 - HOIST
      ?auto_8758 - SURFACE
      ?auto_8762 - SURFACE
      ?auto_8760 - TRUCK
      ?auto_8761 - PLACE
      ?auto_8763 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8755 ?auto_8759 ) ( IS-CRATE ?auto_8753 ) ( not ( = ?auto_8753 ?auto_8754 ) ) ( not ( = ?auto_8757 ?auto_8759 ) ) ( HOIST-AT ?auto_8756 ?auto_8757 ) ( not ( = ?auto_8755 ?auto_8756 ) ) ( AVAILABLE ?auto_8756 ) ( SURFACE-AT ?auto_8753 ?auto_8757 ) ( ON ?auto_8753 ?auto_8758 ) ( CLEAR ?auto_8753 ) ( not ( = ?auto_8753 ?auto_8758 ) ) ( not ( = ?auto_8754 ?auto_8758 ) ) ( SURFACE-AT ?auto_8762 ?auto_8759 ) ( CLEAR ?auto_8762 ) ( IS-CRATE ?auto_8754 ) ( not ( = ?auto_8753 ?auto_8762 ) ) ( not ( = ?auto_8754 ?auto_8762 ) ) ( not ( = ?auto_8758 ?auto_8762 ) ) ( AVAILABLE ?auto_8755 ) ( TRUCK-AT ?auto_8760 ?auto_8761 ) ( not ( = ?auto_8761 ?auto_8759 ) ) ( not ( = ?auto_8757 ?auto_8761 ) ) ( HOIST-AT ?auto_8763 ?auto_8761 ) ( LIFTING ?auto_8763 ?auto_8754 ) ( not ( = ?auto_8755 ?auto_8763 ) ) ( not ( = ?auto_8756 ?auto_8763 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8763 ?auto_8754 ?auto_8760 ?auto_8761 )
      ( MAKE-ON ?auto_8753 ?auto_8754 )
      ( MAKE-ON-VERIFY ?auto_8753 ?auto_8754 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8764 - SURFACE
      ?auto_8765 - SURFACE
    )
    :vars
    (
      ?auto_8771 - HOIST
      ?auto_8768 - PLACE
      ?auto_8766 - PLACE
      ?auto_8773 - HOIST
      ?auto_8769 - SURFACE
      ?auto_8772 - SURFACE
      ?auto_8774 - TRUCK
      ?auto_8767 - PLACE
      ?auto_8770 - HOIST
      ?auto_8775 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8771 ?auto_8768 ) ( IS-CRATE ?auto_8764 ) ( not ( = ?auto_8764 ?auto_8765 ) ) ( not ( = ?auto_8766 ?auto_8768 ) ) ( HOIST-AT ?auto_8773 ?auto_8766 ) ( not ( = ?auto_8771 ?auto_8773 ) ) ( AVAILABLE ?auto_8773 ) ( SURFACE-AT ?auto_8764 ?auto_8766 ) ( ON ?auto_8764 ?auto_8769 ) ( CLEAR ?auto_8764 ) ( not ( = ?auto_8764 ?auto_8769 ) ) ( not ( = ?auto_8765 ?auto_8769 ) ) ( SURFACE-AT ?auto_8772 ?auto_8768 ) ( CLEAR ?auto_8772 ) ( IS-CRATE ?auto_8765 ) ( not ( = ?auto_8764 ?auto_8772 ) ) ( not ( = ?auto_8765 ?auto_8772 ) ) ( not ( = ?auto_8769 ?auto_8772 ) ) ( AVAILABLE ?auto_8771 ) ( TRUCK-AT ?auto_8774 ?auto_8767 ) ( not ( = ?auto_8767 ?auto_8768 ) ) ( not ( = ?auto_8766 ?auto_8767 ) ) ( HOIST-AT ?auto_8770 ?auto_8767 ) ( not ( = ?auto_8771 ?auto_8770 ) ) ( not ( = ?auto_8773 ?auto_8770 ) ) ( AVAILABLE ?auto_8770 ) ( SURFACE-AT ?auto_8765 ?auto_8767 ) ( ON ?auto_8765 ?auto_8775 ) ( CLEAR ?auto_8765 ) ( not ( = ?auto_8764 ?auto_8775 ) ) ( not ( = ?auto_8765 ?auto_8775 ) ) ( not ( = ?auto_8769 ?auto_8775 ) ) ( not ( = ?auto_8772 ?auto_8775 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8770 ?auto_8765 ?auto_8775 ?auto_8767 )
      ( MAKE-ON ?auto_8764 ?auto_8765 )
      ( MAKE-ON-VERIFY ?auto_8764 ?auto_8765 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8776 - SURFACE
      ?auto_8777 - SURFACE
    )
    :vars
    (
      ?auto_8784 - HOIST
      ?auto_8778 - PLACE
      ?auto_8785 - PLACE
      ?auto_8780 - HOIST
      ?auto_8781 - SURFACE
      ?auto_8786 - SURFACE
      ?auto_8779 - PLACE
      ?auto_8783 - HOIST
      ?auto_8782 - SURFACE
      ?auto_8787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8784 ?auto_8778 ) ( IS-CRATE ?auto_8776 ) ( not ( = ?auto_8776 ?auto_8777 ) ) ( not ( = ?auto_8785 ?auto_8778 ) ) ( HOIST-AT ?auto_8780 ?auto_8785 ) ( not ( = ?auto_8784 ?auto_8780 ) ) ( AVAILABLE ?auto_8780 ) ( SURFACE-AT ?auto_8776 ?auto_8785 ) ( ON ?auto_8776 ?auto_8781 ) ( CLEAR ?auto_8776 ) ( not ( = ?auto_8776 ?auto_8781 ) ) ( not ( = ?auto_8777 ?auto_8781 ) ) ( SURFACE-AT ?auto_8786 ?auto_8778 ) ( CLEAR ?auto_8786 ) ( IS-CRATE ?auto_8777 ) ( not ( = ?auto_8776 ?auto_8786 ) ) ( not ( = ?auto_8777 ?auto_8786 ) ) ( not ( = ?auto_8781 ?auto_8786 ) ) ( AVAILABLE ?auto_8784 ) ( not ( = ?auto_8779 ?auto_8778 ) ) ( not ( = ?auto_8785 ?auto_8779 ) ) ( HOIST-AT ?auto_8783 ?auto_8779 ) ( not ( = ?auto_8784 ?auto_8783 ) ) ( not ( = ?auto_8780 ?auto_8783 ) ) ( AVAILABLE ?auto_8783 ) ( SURFACE-AT ?auto_8777 ?auto_8779 ) ( ON ?auto_8777 ?auto_8782 ) ( CLEAR ?auto_8777 ) ( not ( = ?auto_8776 ?auto_8782 ) ) ( not ( = ?auto_8777 ?auto_8782 ) ) ( not ( = ?auto_8781 ?auto_8782 ) ) ( not ( = ?auto_8786 ?auto_8782 ) ) ( TRUCK-AT ?auto_8787 ?auto_8778 ) )
    :subtasks
    ( ( !DRIVE ?auto_8787 ?auto_8778 ?auto_8779 )
      ( MAKE-ON ?auto_8776 ?auto_8777 )
      ( MAKE-ON-VERIFY ?auto_8776 ?auto_8777 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8788 - SURFACE
      ?auto_8789 - SURFACE
    )
    :vars
    (
      ?auto_8790 - HOIST
      ?auto_8797 - PLACE
      ?auto_8793 - PLACE
      ?auto_8799 - HOIST
      ?auto_8792 - SURFACE
      ?auto_8798 - SURFACE
      ?auto_8796 - PLACE
      ?auto_8794 - HOIST
      ?auto_8795 - SURFACE
      ?auto_8791 - TRUCK
      ?auto_8800 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8790 ?auto_8797 ) ( IS-CRATE ?auto_8788 ) ( not ( = ?auto_8788 ?auto_8789 ) ) ( not ( = ?auto_8793 ?auto_8797 ) ) ( HOIST-AT ?auto_8799 ?auto_8793 ) ( not ( = ?auto_8790 ?auto_8799 ) ) ( AVAILABLE ?auto_8799 ) ( SURFACE-AT ?auto_8788 ?auto_8793 ) ( ON ?auto_8788 ?auto_8792 ) ( CLEAR ?auto_8788 ) ( not ( = ?auto_8788 ?auto_8792 ) ) ( not ( = ?auto_8789 ?auto_8792 ) ) ( IS-CRATE ?auto_8789 ) ( not ( = ?auto_8788 ?auto_8798 ) ) ( not ( = ?auto_8789 ?auto_8798 ) ) ( not ( = ?auto_8792 ?auto_8798 ) ) ( not ( = ?auto_8796 ?auto_8797 ) ) ( not ( = ?auto_8793 ?auto_8796 ) ) ( HOIST-AT ?auto_8794 ?auto_8796 ) ( not ( = ?auto_8790 ?auto_8794 ) ) ( not ( = ?auto_8799 ?auto_8794 ) ) ( AVAILABLE ?auto_8794 ) ( SURFACE-AT ?auto_8789 ?auto_8796 ) ( ON ?auto_8789 ?auto_8795 ) ( CLEAR ?auto_8789 ) ( not ( = ?auto_8788 ?auto_8795 ) ) ( not ( = ?auto_8789 ?auto_8795 ) ) ( not ( = ?auto_8792 ?auto_8795 ) ) ( not ( = ?auto_8798 ?auto_8795 ) ) ( TRUCK-AT ?auto_8791 ?auto_8797 ) ( SURFACE-AT ?auto_8800 ?auto_8797 ) ( CLEAR ?auto_8800 ) ( LIFTING ?auto_8790 ?auto_8798 ) ( IS-CRATE ?auto_8798 ) ( not ( = ?auto_8788 ?auto_8800 ) ) ( not ( = ?auto_8789 ?auto_8800 ) ) ( not ( = ?auto_8792 ?auto_8800 ) ) ( not ( = ?auto_8798 ?auto_8800 ) ) ( not ( = ?auto_8795 ?auto_8800 ) ) )
    :subtasks
    ( ( !DROP ?auto_8790 ?auto_8798 ?auto_8800 ?auto_8797 )
      ( MAKE-ON ?auto_8788 ?auto_8789 )
      ( MAKE-ON-VERIFY ?auto_8788 ?auto_8789 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8801 - SURFACE
      ?auto_8802 - SURFACE
    )
    :vars
    (
      ?auto_8803 - HOIST
      ?auto_8805 - PLACE
      ?auto_8808 - PLACE
      ?auto_8806 - HOIST
      ?auto_8811 - SURFACE
      ?auto_8813 - SURFACE
      ?auto_8804 - PLACE
      ?auto_8809 - HOIST
      ?auto_8810 - SURFACE
      ?auto_8812 - TRUCK
      ?auto_8807 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8803 ?auto_8805 ) ( IS-CRATE ?auto_8801 ) ( not ( = ?auto_8801 ?auto_8802 ) ) ( not ( = ?auto_8808 ?auto_8805 ) ) ( HOIST-AT ?auto_8806 ?auto_8808 ) ( not ( = ?auto_8803 ?auto_8806 ) ) ( AVAILABLE ?auto_8806 ) ( SURFACE-AT ?auto_8801 ?auto_8808 ) ( ON ?auto_8801 ?auto_8811 ) ( CLEAR ?auto_8801 ) ( not ( = ?auto_8801 ?auto_8811 ) ) ( not ( = ?auto_8802 ?auto_8811 ) ) ( IS-CRATE ?auto_8802 ) ( not ( = ?auto_8801 ?auto_8813 ) ) ( not ( = ?auto_8802 ?auto_8813 ) ) ( not ( = ?auto_8811 ?auto_8813 ) ) ( not ( = ?auto_8804 ?auto_8805 ) ) ( not ( = ?auto_8808 ?auto_8804 ) ) ( HOIST-AT ?auto_8809 ?auto_8804 ) ( not ( = ?auto_8803 ?auto_8809 ) ) ( not ( = ?auto_8806 ?auto_8809 ) ) ( AVAILABLE ?auto_8809 ) ( SURFACE-AT ?auto_8802 ?auto_8804 ) ( ON ?auto_8802 ?auto_8810 ) ( CLEAR ?auto_8802 ) ( not ( = ?auto_8801 ?auto_8810 ) ) ( not ( = ?auto_8802 ?auto_8810 ) ) ( not ( = ?auto_8811 ?auto_8810 ) ) ( not ( = ?auto_8813 ?auto_8810 ) ) ( TRUCK-AT ?auto_8812 ?auto_8805 ) ( SURFACE-AT ?auto_8807 ?auto_8805 ) ( CLEAR ?auto_8807 ) ( IS-CRATE ?auto_8813 ) ( not ( = ?auto_8801 ?auto_8807 ) ) ( not ( = ?auto_8802 ?auto_8807 ) ) ( not ( = ?auto_8811 ?auto_8807 ) ) ( not ( = ?auto_8813 ?auto_8807 ) ) ( not ( = ?auto_8810 ?auto_8807 ) ) ( AVAILABLE ?auto_8803 ) ( IN ?auto_8813 ?auto_8812 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8803 ?auto_8813 ?auto_8812 ?auto_8805 )
      ( MAKE-ON ?auto_8801 ?auto_8802 )
      ( MAKE-ON-VERIFY ?auto_8801 ?auto_8802 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8814 - SURFACE
      ?auto_8815 - SURFACE
    )
    :vars
    (
      ?auto_8823 - HOIST
      ?auto_8821 - PLACE
      ?auto_8817 - PLACE
      ?auto_8826 - HOIST
      ?auto_8819 - SURFACE
      ?auto_8825 - SURFACE
      ?auto_8816 - PLACE
      ?auto_8820 - HOIST
      ?auto_8818 - SURFACE
      ?auto_8824 - SURFACE
      ?auto_8822 - TRUCK
      ?auto_8827 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8823 ?auto_8821 ) ( IS-CRATE ?auto_8814 ) ( not ( = ?auto_8814 ?auto_8815 ) ) ( not ( = ?auto_8817 ?auto_8821 ) ) ( HOIST-AT ?auto_8826 ?auto_8817 ) ( not ( = ?auto_8823 ?auto_8826 ) ) ( AVAILABLE ?auto_8826 ) ( SURFACE-AT ?auto_8814 ?auto_8817 ) ( ON ?auto_8814 ?auto_8819 ) ( CLEAR ?auto_8814 ) ( not ( = ?auto_8814 ?auto_8819 ) ) ( not ( = ?auto_8815 ?auto_8819 ) ) ( IS-CRATE ?auto_8815 ) ( not ( = ?auto_8814 ?auto_8825 ) ) ( not ( = ?auto_8815 ?auto_8825 ) ) ( not ( = ?auto_8819 ?auto_8825 ) ) ( not ( = ?auto_8816 ?auto_8821 ) ) ( not ( = ?auto_8817 ?auto_8816 ) ) ( HOIST-AT ?auto_8820 ?auto_8816 ) ( not ( = ?auto_8823 ?auto_8820 ) ) ( not ( = ?auto_8826 ?auto_8820 ) ) ( AVAILABLE ?auto_8820 ) ( SURFACE-AT ?auto_8815 ?auto_8816 ) ( ON ?auto_8815 ?auto_8818 ) ( CLEAR ?auto_8815 ) ( not ( = ?auto_8814 ?auto_8818 ) ) ( not ( = ?auto_8815 ?auto_8818 ) ) ( not ( = ?auto_8819 ?auto_8818 ) ) ( not ( = ?auto_8825 ?auto_8818 ) ) ( SURFACE-AT ?auto_8824 ?auto_8821 ) ( CLEAR ?auto_8824 ) ( IS-CRATE ?auto_8825 ) ( not ( = ?auto_8814 ?auto_8824 ) ) ( not ( = ?auto_8815 ?auto_8824 ) ) ( not ( = ?auto_8819 ?auto_8824 ) ) ( not ( = ?auto_8825 ?auto_8824 ) ) ( not ( = ?auto_8818 ?auto_8824 ) ) ( AVAILABLE ?auto_8823 ) ( IN ?auto_8825 ?auto_8822 ) ( TRUCK-AT ?auto_8822 ?auto_8827 ) ( not ( = ?auto_8827 ?auto_8821 ) ) ( not ( = ?auto_8817 ?auto_8827 ) ) ( not ( = ?auto_8816 ?auto_8827 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8822 ?auto_8827 ?auto_8821 )
      ( MAKE-ON ?auto_8814 ?auto_8815 )
      ( MAKE-ON-VERIFY ?auto_8814 ?auto_8815 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8828 - SURFACE
      ?auto_8829 - SURFACE
    )
    :vars
    (
      ?auto_8839 - HOIST
      ?auto_8836 - PLACE
      ?auto_8831 - PLACE
      ?auto_8832 - HOIST
      ?auto_8830 - SURFACE
      ?auto_8840 - SURFACE
      ?auto_8837 - PLACE
      ?auto_8838 - HOIST
      ?auto_8835 - SURFACE
      ?auto_8834 - SURFACE
      ?auto_8841 - TRUCK
      ?auto_8833 - PLACE
      ?auto_8842 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8839 ?auto_8836 ) ( IS-CRATE ?auto_8828 ) ( not ( = ?auto_8828 ?auto_8829 ) ) ( not ( = ?auto_8831 ?auto_8836 ) ) ( HOIST-AT ?auto_8832 ?auto_8831 ) ( not ( = ?auto_8839 ?auto_8832 ) ) ( AVAILABLE ?auto_8832 ) ( SURFACE-AT ?auto_8828 ?auto_8831 ) ( ON ?auto_8828 ?auto_8830 ) ( CLEAR ?auto_8828 ) ( not ( = ?auto_8828 ?auto_8830 ) ) ( not ( = ?auto_8829 ?auto_8830 ) ) ( IS-CRATE ?auto_8829 ) ( not ( = ?auto_8828 ?auto_8840 ) ) ( not ( = ?auto_8829 ?auto_8840 ) ) ( not ( = ?auto_8830 ?auto_8840 ) ) ( not ( = ?auto_8837 ?auto_8836 ) ) ( not ( = ?auto_8831 ?auto_8837 ) ) ( HOIST-AT ?auto_8838 ?auto_8837 ) ( not ( = ?auto_8839 ?auto_8838 ) ) ( not ( = ?auto_8832 ?auto_8838 ) ) ( AVAILABLE ?auto_8838 ) ( SURFACE-AT ?auto_8829 ?auto_8837 ) ( ON ?auto_8829 ?auto_8835 ) ( CLEAR ?auto_8829 ) ( not ( = ?auto_8828 ?auto_8835 ) ) ( not ( = ?auto_8829 ?auto_8835 ) ) ( not ( = ?auto_8830 ?auto_8835 ) ) ( not ( = ?auto_8840 ?auto_8835 ) ) ( SURFACE-AT ?auto_8834 ?auto_8836 ) ( CLEAR ?auto_8834 ) ( IS-CRATE ?auto_8840 ) ( not ( = ?auto_8828 ?auto_8834 ) ) ( not ( = ?auto_8829 ?auto_8834 ) ) ( not ( = ?auto_8830 ?auto_8834 ) ) ( not ( = ?auto_8840 ?auto_8834 ) ) ( not ( = ?auto_8835 ?auto_8834 ) ) ( AVAILABLE ?auto_8839 ) ( TRUCK-AT ?auto_8841 ?auto_8833 ) ( not ( = ?auto_8833 ?auto_8836 ) ) ( not ( = ?auto_8831 ?auto_8833 ) ) ( not ( = ?auto_8837 ?auto_8833 ) ) ( HOIST-AT ?auto_8842 ?auto_8833 ) ( LIFTING ?auto_8842 ?auto_8840 ) ( not ( = ?auto_8839 ?auto_8842 ) ) ( not ( = ?auto_8832 ?auto_8842 ) ) ( not ( = ?auto_8838 ?auto_8842 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8842 ?auto_8840 ?auto_8841 ?auto_8833 )
      ( MAKE-ON ?auto_8828 ?auto_8829 )
      ( MAKE-ON-VERIFY ?auto_8828 ?auto_8829 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8843 - SURFACE
      ?auto_8844 - SURFACE
    )
    :vars
    (
      ?auto_8857 - HOIST
      ?auto_8851 - PLACE
      ?auto_8846 - PLACE
      ?auto_8855 - HOIST
      ?auto_8849 - SURFACE
      ?auto_8848 - SURFACE
      ?auto_8856 - PLACE
      ?auto_8853 - HOIST
      ?auto_8854 - SURFACE
      ?auto_8847 - SURFACE
      ?auto_8852 - TRUCK
      ?auto_8845 - PLACE
      ?auto_8850 - HOIST
      ?auto_8858 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8857 ?auto_8851 ) ( IS-CRATE ?auto_8843 ) ( not ( = ?auto_8843 ?auto_8844 ) ) ( not ( = ?auto_8846 ?auto_8851 ) ) ( HOIST-AT ?auto_8855 ?auto_8846 ) ( not ( = ?auto_8857 ?auto_8855 ) ) ( AVAILABLE ?auto_8855 ) ( SURFACE-AT ?auto_8843 ?auto_8846 ) ( ON ?auto_8843 ?auto_8849 ) ( CLEAR ?auto_8843 ) ( not ( = ?auto_8843 ?auto_8849 ) ) ( not ( = ?auto_8844 ?auto_8849 ) ) ( IS-CRATE ?auto_8844 ) ( not ( = ?auto_8843 ?auto_8848 ) ) ( not ( = ?auto_8844 ?auto_8848 ) ) ( not ( = ?auto_8849 ?auto_8848 ) ) ( not ( = ?auto_8856 ?auto_8851 ) ) ( not ( = ?auto_8846 ?auto_8856 ) ) ( HOIST-AT ?auto_8853 ?auto_8856 ) ( not ( = ?auto_8857 ?auto_8853 ) ) ( not ( = ?auto_8855 ?auto_8853 ) ) ( AVAILABLE ?auto_8853 ) ( SURFACE-AT ?auto_8844 ?auto_8856 ) ( ON ?auto_8844 ?auto_8854 ) ( CLEAR ?auto_8844 ) ( not ( = ?auto_8843 ?auto_8854 ) ) ( not ( = ?auto_8844 ?auto_8854 ) ) ( not ( = ?auto_8849 ?auto_8854 ) ) ( not ( = ?auto_8848 ?auto_8854 ) ) ( SURFACE-AT ?auto_8847 ?auto_8851 ) ( CLEAR ?auto_8847 ) ( IS-CRATE ?auto_8848 ) ( not ( = ?auto_8843 ?auto_8847 ) ) ( not ( = ?auto_8844 ?auto_8847 ) ) ( not ( = ?auto_8849 ?auto_8847 ) ) ( not ( = ?auto_8848 ?auto_8847 ) ) ( not ( = ?auto_8854 ?auto_8847 ) ) ( AVAILABLE ?auto_8857 ) ( TRUCK-AT ?auto_8852 ?auto_8845 ) ( not ( = ?auto_8845 ?auto_8851 ) ) ( not ( = ?auto_8846 ?auto_8845 ) ) ( not ( = ?auto_8856 ?auto_8845 ) ) ( HOIST-AT ?auto_8850 ?auto_8845 ) ( not ( = ?auto_8857 ?auto_8850 ) ) ( not ( = ?auto_8855 ?auto_8850 ) ) ( not ( = ?auto_8853 ?auto_8850 ) ) ( AVAILABLE ?auto_8850 ) ( SURFACE-AT ?auto_8848 ?auto_8845 ) ( ON ?auto_8848 ?auto_8858 ) ( CLEAR ?auto_8848 ) ( not ( = ?auto_8843 ?auto_8858 ) ) ( not ( = ?auto_8844 ?auto_8858 ) ) ( not ( = ?auto_8849 ?auto_8858 ) ) ( not ( = ?auto_8848 ?auto_8858 ) ) ( not ( = ?auto_8854 ?auto_8858 ) ) ( not ( = ?auto_8847 ?auto_8858 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8850 ?auto_8848 ?auto_8858 ?auto_8845 )
      ( MAKE-ON ?auto_8843 ?auto_8844 )
      ( MAKE-ON-VERIFY ?auto_8843 ?auto_8844 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8859 - SURFACE
      ?auto_8860 - SURFACE
    )
    :vars
    (
      ?auto_8871 - HOIST
      ?auto_8872 - PLACE
      ?auto_8867 - PLACE
      ?auto_8861 - HOIST
      ?auto_8866 - SURFACE
      ?auto_8874 - SURFACE
      ?auto_8862 - PLACE
      ?auto_8864 - HOIST
      ?auto_8870 - SURFACE
      ?auto_8869 - SURFACE
      ?auto_8863 - PLACE
      ?auto_8865 - HOIST
      ?auto_8868 - SURFACE
      ?auto_8873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8871 ?auto_8872 ) ( IS-CRATE ?auto_8859 ) ( not ( = ?auto_8859 ?auto_8860 ) ) ( not ( = ?auto_8867 ?auto_8872 ) ) ( HOIST-AT ?auto_8861 ?auto_8867 ) ( not ( = ?auto_8871 ?auto_8861 ) ) ( AVAILABLE ?auto_8861 ) ( SURFACE-AT ?auto_8859 ?auto_8867 ) ( ON ?auto_8859 ?auto_8866 ) ( CLEAR ?auto_8859 ) ( not ( = ?auto_8859 ?auto_8866 ) ) ( not ( = ?auto_8860 ?auto_8866 ) ) ( IS-CRATE ?auto_8860 ) ( not ( = ?auto_8859 ?auto_8874 ) ) ( not ( = ?auto_8860 ?auto_8874 ) ) ( not ( = ?auto_8866 ?auto_8874 ) ) ( not ( = ?auto_8862 ?auto_8872 ) ) ( not ( = ?auto_8867 ?auto_8862 ) ) ( HOIST-AT ?auto_8864 ?auto_8862 ) ( not ( = ?auto_8871 ?auto_8864 ) ) ( not ( = ?auto_8861 ?auto_8864 ) ) ( AVAILABLE ?auto_8864 ) ( SURFACE-AT ?auto_8860 ?auto_8862 ) ( ON ?auto_8860 ?auto_8870 ) ( CLEAR ?auto_8860 ) ( not ( = ?auto_8859 ?auto_8870 ) ) ( not ( = ?auto_8860 ?auto_8870 ) ) ( not ( = ?auto_8866 ?auto_8870 ) ) ( not ( = ?auto_8874 ?auto_8870 ) ) ( SURFACE-AT ?auto_8869 ?auto_8872 ) ( CLEAR ?auto_8869 ) ( IS-CRATE ?auto_8874 ) ( not ( = ?auto_8859 ?auto_8869 ) ) ( not ( = ?auto_8860 ?auto_8869 ) ) ( not ( = ?auto_8866 ?auto_8869 ) ) ( not ( = ?auto_8874 ?auto_8869 ) ) ( not ( = ?auto_8870 ?auto_8869 ) ) ( AVAILABLE ?auto_8871 ) ( not ( = ?auto_8863 ?auto_8872 ) ) ( not ( = ?auto_8867 ?auto_8863 ) ) ( not ( = ?auto_8862 ?auto_8863 ) ) ( HOIST-AT ?auto_8865 ?auto_8863 ) ( not ( = ?auto_8871 ?auto_8865 ) ) ( not ( = ?auto_8861 ?auto_8865 ) ) ( not ( = ?auto_8864 ?auto_8865 ) ) ( AVAILABLE ?auto_8865 ) ( SURFACE-AT ?auto_8874 ?auto_8863 ) ( ON ?auto_8874 ?auto_8868 ) ( CLEAR ?auto_8874 ) ( not ( = ?auto_8859 ?auto_8868 ) ) ( not ( = ?auto_8860 ?auto_8868 ) ) ( not ( = ?auto_8866 ?auto_8868 ) ) ( not ( = ?auto_8874 ?auto_8868 ) ) ( not ( = ?auto_8870 ?auto_8868 ) ) ( not ( = ?auto_8869 ?auto_8868 ) ) ( TRUCK-AT ?auto_8873 ?auto_8872 ) )
    :subtasks
    ( ( !DRIVE ?auto_8873 ?auto_8872 ?auto_8863 )
      ( MAKE-ON ?auto_8859 ?auto_8860 )
      ( MAKE-ON-VERIFY ?auto_8859 ?auto_8860 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8875 - SURFACE
      ?auto_8876 - SURFACE
    )
    :vars
    (
      ?auto_8884 - HOIST
      ?auto_8878 - PLACE
      ?auto_8888 - PLACE
      ?auto_8882 - HOIST
      ?auto_8877 - SURFACE
      ?auto_8879 - SURFACE
      ?auto_8890 - PLACE
      ?auto_8880 - HOIST
      ?auto_8885 - SURFACE
      ?auto_8881 - SURFACE
      ?auto_8889 - PLACE
      ?auto_8886 - HOIST
      ?auto_8883 - SURFACE
      ?auto_8887 - TRUCK
      ?auto_8891 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8884 ?auto_8878 ) ( IS-CRATE ?auto_8875 ) ( not ( = ?auto_8875 ?auto_8876 ) ) ( not ( = ?auto_8888 ?auto_8878 ) ) ( HOIST-AT ?auto_8882 ?auto_8888 ) ( not ( = ?auto_8884 ?auto_8882 ) ) ( AVAILABLE ?auto_8882 ) ( SURFACE-AT ?auto_8875 ?auto_8888 ) ( ON ?auto_8875 ?auto_8877 ) ( CLEAR ?auto_8875 ) ( not ( = ?auto_8875 ?auto_8877 ) ) ( not ( = ?auto_8876 ?auto_8877 ) ) ( IS-CRATE ?auto_8876 ) ( not ( = ?auto_8875 ?auto_8879 ) ) ( not ( = ?auto_8876 ?auto_8879 ) ) ( not ( = ?auto_8877 ?auto_8879 ) ) ( not ( = ?auto_8890 ?auto_8878 ) ) ( not ( = ?auto_8888 ?auto_8890 ) ) ( HOIST-AT ?auto_8880 ?auto_8890 ) ( not ( = ?auto_8884 ?auto_8880 ) ) ( not ( = ?auto_8882 ?auto_8880 ) ) ( AVAILABLE ?auto_8880 ) ( SURFACE-AT ?auto_8876 ?auto_8890 ) ( ON ?auto_8876 ?auto_8885 ) ( CLEAR ?auto_8876 ) ( not ( = ?auto_8875 ?auto_8885 ) ) ( not ( = ?auto_8876 ?auto_8885 ) ) ( not ( = ?auto_8877 ?auto_8885 ) ) ( not ( = ?auto_8879 ?auto_8885 ) ) ( IS-CRATE ?auto_8879 ) ( not ( = ?auto_8875 ?auto_8881 ) ) ( not ( = ?auto_8876 ?auto_8881 ) ) ( not ( = ?auto_8877 ?auto_8881 ) ) ( not ( = ?auto_8879 ?auto_8881 ) ) ( not ( = ?auto_8885 ?auto_8881 ) ) ( not ( = ?auto_8889 ?auto_8878 ) ) ( not ( = ?auto_8888 ?auto_8889 ) ) ( not ( = ?auto_8890 ?auto_8889 ) ) ( HOIST-AT ?auto_8886 ?auto_8889 ) ( not ( = ?auto_8884 ?auto_8886 ) ) ( not ( = ?auto_8882 ?auto_8886 ) ) ( not ( = ?auto_8880 ?auto_8886 ) ) ( AVAILABLE ?auto_8886 ) ( SURFACE-AT ?auto_8879 ?auto_8889 ) ( ON ?auto_8879 ?auto_8883 ) ( CLEAR ?auto_8879 ) ( not ( = ?auto_8875 ?auto_8883 ) ) ( not ( = ?auto_8876 ?auto_8883 ) ) ( not ( = ?auto_8877 ?auto_8883 ) ) ( not ( = ?auto_8879 ?auto_8883 ) ) ( not ( = ?auto_8885 ?auto_8883 ) ) ( not ( = ?auto_8881 ?auto_8883 ) ) ( TRUCK-AT ?auto_8887 ?auto_8878 ) ( SURFACE-AT ?auto_8891 ?auto_8878 ) ( CLEAR ?auto_8891 ) ( LIFTING ?auto_8884 ?auto_8881 ) ( IS-CRATE ?auto_8881 ) ( not ( = ?auto_8875 ?auto_8891 ) ) ( not ( = ?auto_8876 ?auto_8891 ) ) ( not ( = ?auto_8877 ?auto_8891 ) ) ( not ( = ?auto_8879 ?auto_8891 ) ) ( not ( = ?auto_8885 ?auto_8891 ) ) ( not ( = ?auto_8881 ?auto_8891 ) ) ( not ( = ?auto_8883 ?auto_8891 ) ) )
    :subtasks
    ( ( !DROP ?auto_8884 ?auto_8881 ?auto_8891 ?auto_8878 )
      ( MAKE-ON ?auto_8875 ?auto_8876 )
      ( MAKE-ON-VERIFY ?auto_8875 ?auto_8876 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8892 - SURFACE
      ?auto_8893 - SURFACE
    )
    :vars
    (
      ?auto_8905 - HOIST
      ?auto_8896 - PLACE
      ?auto_8898 - PLACE
      ?auto_8894 - HOIST
      ?auto_8901 - SURFACE
      ?auto_8902 - SURFACE
      ?auto_8895 - PLACE
      ?auto_8897 - HOIST
      ?auto_8899 - SURFACE
      ?auto_8904 - SURFACE
      ?auto_8903 - PLACE
      ?auto_8900 - HOIST
      ?auto_8906 - SURFACE
      ?auto_8907 - TRUCK
      ?auto_8908 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8905 ?auto_8896 ) ( IS-CRATE ?auto_8892 ) ( not ( = ?auto_8892 ?auto_8893 ) ) ( not ( = ?auto_8898 ?auto_8896 ) ) ( HOIST-AT ?auto_8894 ?auto_8898 ) ( not ( = ?auto_8905 ?auto_8894 ) ) ( AVAILABLE ?auto_8894 ) ( SURFACE-AT ?auto_8892 ?auto_8898 ) ( ON ?auto_8892 ?auto_8901 ) ( CLEAR ?auto_8892 ) ( not ( = ?auto_8892 ?auto_8901 ) ) ( not ( = ?auto_8893 ?auto_8901 ) ) ( IS-CRATE ?auto_8893 ) ( not ( = ?auto_8892 ?auto_8902 ) ) ( not ( = ?auto_8893 ?auto_8902 ) ) ( not ( = ?auto_8901 ?auto_8902 ) ) ( not ( = ?auto_8895 ?auto_8896 ) ) ( not ( = ?auto_8898 ?auto_8895 ) ) ( HOIST-AT ?auto_8897 ?auto_8895 ) ( not ( = ?auto_8905 ?auto_8897 ) ) ( not ( = ?auto_8894 ?auto_8897 ) ) ( AVAILABLE ?auto_8897 ) ( SURFACE-AT ?auto_8893 ?auto_8895 ) ( ON ?auto_8893 ?auto_8899 ) ( CLEAR ?auto_8893 ) ( not ( = ?auto_8892 ?auto_8899 ) ) ( not ( = ?auto_8893 ?auto_8899 ) ) ( not ( = ?auto_8901 ?auto_8899 ) ) ( not ( = ?auto_8902 ?auto_8899 ) ) ( IS-CRATE ?auto_8902 ) ( not ( = ?auto_8892 ?auto_8904 ) ) ( not ( = ?auto_8893 ?auto_8904 ) ) ( not ( = ?auto_8901 ?auto_8904 ) ) ( not ( = ?auto_8902 ?auto_8904 ) ) ( not ( = ?auto_8899 ?auto_8904 ) ) ( not ( = ?auto_8903 ?auto_8896 ) ) ( not ( = ?auto_8898 ?auto_8903 ) ) ( not ( = ?auto_8895 ?auto_8903 ) ) ( HOIST-AT ?auto_8900 ?auto_8903 ) ( not ( = ?auto_8905 ?auto_8900 ) ) ( not ( = ?auto_8894 ?auto_8900 ) ) ( not ( = ?auto_8897 ?auto_8900 ) ) ( AVAILABLE ?auto_8900 ) ( SURFACE-AT ?auto_8902 ?auto_8903 ) ( ON ?auto_8902 ?auto_8906 ) ( CLEAR ?auto_8902 ) ( not ( = ?auto_8892 ?auto_8906 ) ) ( not ( = ?auto_8893 ?auto_8906 ) ) ( not ( = ?auto_8901 ?auto_8906 ) ) ( not ( = ?auto_8902 ?auto_8906 ) ) ( not ( = ?auto_8899 ?auto_8906 ) ) ( not ( = ?auto_8904 ?auto_8906 ) ) ( TRUCK-AT ?auto_8907 ?auto_8896 ) ( SURFACE-AT ?auto_8908 ?auto_8896 ) ( CLEAR ?auto_8908 ) ( IS-CRATE ?auto_8904 ) ( not ( = ?auto_8892 ?auto_8908 ) ) ( not ( = ?auto_8893 ?auto_8908 ) ) ( not ( = ?auto_8901 ?auto_8908 ) ) ( not ( = ?auto_8902 ?auto_8908 ) ) ( not ( = ?auto_8899 ?auto_8908 ) ) ( not ( = ?auto_8904 ?auto_8908 ) ) ( not ( = ?auto_8906 ?auto_8908 ) ) ( AVAILABLE ?auto_8905 ) ( IN ?auto_8904 ?auto_8907 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8905 ?auto_8904 ?auto_8907 ?auto_8896 )
      ( MAKE-ON ?auto_8892 ?auto_8893 )
      ( MAKE-ON-VERIFY ?auto_8892 ?auto_8893 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8909 - SURFACE
      ?auto_8910 - SURFACE
    )
    :vars
    (
      ?auto_8921 - HOIST
      ?auto_8917 - PLACE
      ?auto_8913 - PLACE
      ?auto_8915 - HOIST
      ?auto_8925 - SURFACE
      ?auto_8924 - SURFACE
      ?auto_8923 - PLACE
      ?auto_8916 - HOIST
      ?auto_8918 - SURFACE
      ?auto_8922 - SURFACE
      ?auto_8912 - PLACE
      ?auto_8919 - HOIST
      ?auto_8911 - SURFACE
      ?auto_8920 - SURFACE
      ?auto_8914 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8921 ?auto_8917 ) ( IS-CRATE ?auto_8909 ) ( not ( = ?auto_8909 ?auto_8910 ) ) ( not ( = ?auto_8913 ?auto_8917 ) ) ( HOIST-AT ?auto_8915 ?auto_8913 ) ( not ( = ?auto_8921 ?auto_8915 ) ) ( AVAILABLE ?auto_8915 ) ( SURFACE-AT ?auto_8909 ?auto_8913 ) ( ON ?auto_8909 ?auto_8925 ) ( CLEAR ?auto_8909 ) ( not ( = ?auto_8909 ?auto_8925 ) ) ( not ( = ?auto_8910 ?auto_8925 ) ) ( IS-CRATE ?auto_8910 ) ( not ( = ?auto_8909 ?auto_8924 ) ) ( not ( = ?auto_8910 ?auto_8924 ) ) ( not ( = ?auto_8925 ?auto_8924 ) ) ( not ( = ?auto_8923 ?auto_8917 ) ) ( not ( = ?auto_8913 ?auto_8923 ) ) ( HOIST-AT ?auto_8916 ?auto_8923 ) ( not ( = ?auto_8921 ?auto_8916 ) ) ( not ( = ?auto_8915 ?auto_8916 ) ) ( AVAILABLE ?auto_8916 ) ( SURFACE-AT ?auto_8910 ?auto_8923 ) ( ON ?auto_8910 ?auto_8918 ) ( CLEAR ?auto_8910 ) ( not ( = ?auto_8909 ?auto_8918 ) ) ( not ( = ?auto_8910 ?auto_8918 ) ) ( not ( = ?auto_8925 ?auto_8918 ) ) ( not ( = ?auto_8924 ?auto_8918 ) ) ( IS-CRATE ?auto_8924 ) ( not ( = ?auto_8909 ?auto_8922 ) ) ( not ( = ?auto_8910 ?auto_8922 ) ) ( not ( = ?auto_8925 ?auto_8922 ) ) ( not ( = ?auto_8924 ?auto_8922 ) ) ( not ( = ?auto_8918 ?auto_8922 ) ) ( not ( = ?auto_8912 ?auto_8917 ) ) ( not ( = ?auto_8913 ?auto_8912 ) ) ( not ( = ?auto_8923 ?auto_8912 ) ) ( HOIST-AT ?auto_8919 ?auto_8912 ) ( not ( = ?auto_8921 ?auto_8919 ) ) ( not ( = ?auto_8915 ?auto_8919 ) ) ( not ( = ?auto_8916 ?auto_8919 ) ) ( AVAILABLE ?auto_8919 ) ( SURFACE-AT ?auto_8924 ?auto_8912 ) ( ON ?auto_8924 ?auto_8911 ) ( CLEAR ?auto_8924 ) ( not ( = ?auto_8909 ?auto_8911 ) ) ( not ( = ?auto_8910 ?auto_8911 ) ) ( not ( = ?auto_8925 ?auto_8911 ) ) ( not ( = ?auto_8924 ?auto_8911 ) ) ( not ( = ?auto_8918 ?auto_8911 ) ) ( not ( = ?auto_8922 ?auto_8911 ) ) ( SURFACE-AT ?auto_8920 ?auto_8917 ) ( CLEAR ?auto_8920 ) ( IS-CRATE ?auto_8922 ) ( not ( = ?auto_8909 ?auto_8920 ) ) ( not ( = ?auto_8910 ?auto_8920 ) ) ( not ( = ?auto_8925 ?auto_8920 ) ) ( not ( = ?auto_8924 ?auto_8920 ) ) ( not ( = ?auto_8918 ?auto_8920 ) ) ( not ( = ?auto_8922 ?auto_8920 ) ) ( not ( = ?auto_8911 ?auto_8920 ) ) ( AVAILABLE ?auto_8921 ) ( IN ?auto_8922 ?auto_8914 ) ( TRUCK-AT ?auto_8914 ?auto_8913 ) )
    :subtasks
    ( ( !DRIVE ?auto_8914 ?auto_8913 ?auto_8917 )
      ( MAKE-ON ?auto_8909 ?auto_8910 )
      ( MAKE-ON-VERIFY ?auto_8909 ?auto_8910 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8926 - SURFACE
      ?auto_8927 - SURFACE
    )
    :vars
    (
      ?auto_8933 - HOIST
      ?auto_8938 - PLACE
      ?auto_8932 - PLACE
      ?auto_8935 - HOIST
      ?auto_8937 - SURFACE
      ?auto_8928 - SURFACE
      ?auto_8940 - PLACE
      ?auto_8930 - HOIST
      ?auto_8929 - SURFACE
      ?auto_8936 - SURFACE
      ?auto_8931 - PLACE
      ?auto_8942 - HOIST
      ?auto_8941 - SURFACE
      ?auto_8934 - SURFACE
      ?auto_8939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8933 ?auto_8938 ) ( IS-CRATE ?auto_8926 ) ( not ( = ?auto_8926 ?auto_8927 ) ) ( not ( = ?auto_8932 ?auto_8938 ) ) ( HOIST-AT ?auto_8935 ?auto_8932 ) ( not ( = ?auto_8933 ?auto_8935 ) ) ( SURFACE-AT ?auto_8926 ?auto_8932 ) ( ON ?auto_8926 ?auto_8937 ) ( CLEAR ?auto_8926 ) ( not ( = ?auto_8926 ?auto_8937 ) ) ( not ( = ?auto_8927 ?auto_8937 ) ) ( IS-CRATE ?auto_8927 ) ( not ( = ?auto_8926 ?auto_8928 ) ) ( not ( = ?auto_8927 ?auto_8928 ) ) ( not ( = ?auto_8937 ?auto_8928 ) ) ( not ( = ?auto_8940 ?auto_8938 ) ) ( not ( = ?auto_8932 ?auto_8940 ) ) ( HOIST-AT ?auto_8930 ?auto_8940 ) ( not ( = ?auto_8933 ?auto_8930 ) ) ( not ( = ?auto_8935 ?auto_8930 ) ) ( AVAILABLE ?auto_8930 ) ( SURFACE-AT ?auto_8927 ?auto_8940 ) ( ON ?auto_8927 ?auto_8929 ) ( CLEAR ?auto_8927 ) ( not ( = ?auto_8926 ?auto_8929 ) ) ( not ( = ?auto_8927 ?auto_8929 ) ) ( not ( = ?auto_8937 ?auto_8929 ) ) ( not ( = ?auto_8928 ?auto_8929 ) ) ( IS-CRATE ?auto_8928 ) ( not ( = ?auto_8926 ?auto_8936 ) ) ( not ( = ?auto_8927 ?auto_8936 ) ) ( not ( = ?auto_8937 ?auto_8936 ) ) ( not ( = ?auto_8928 ?auto_8936 ) ) ( not ( = ?auto_8929 ?auto_8936 ) ) ( not ( = ?auto_8931 ?auto_8938 ) ) ( not ( = ?auto_8932 ?auto_8931 ) ) ( not ( = ?auto_8940 ?auto_8931 ) ) ( HOIST-AT ?auto_8942 ?auto_8931 ) ( not ( = ?auto_8933 ?auto_8942 ) ) ( not ( = ?auto_8935 ?auto_8942 ) ) ( not ( = ?auto_8930 ?auto_8942 ) ) ( AVAILABLE ?auto_8942 ) ( SURFACE-AT ?auto_8928 ?auto_8931 ) ( ON ?auto_8928 ?auto_8941 ) ( CLEAR ?auto_8928 ) ( not ( = ?auto_8926 ?auto_8941 ) ) ( not ( = ?auto_8927 ?auto_8941 ) ) ( not ( = ?auto_8937 ?auto_8941 ) ) ( not ( = ?auto_8928 ?auto_8941 ) ) ( not ( = ?auto_8929 ?auto_8941 ) ) ( not ( = ?auto_8936 ?auto_8941 ) ) ( SURFACE-AT ?auto_8934 ?auto_8938 ) ( CLEAR ?auto_8934 ) ( IS-CRATE ?auto_8936 ) ( not ( = ?auto_8926 ?auto_8934 ) ) ( not ( = ?auto_8927 ?auto_8934 ) ) ( not ( = ?auto_8937 ?auto_8934 ) ) ( not ( = ?auto_8928 ?auto_8934 ) ) ( not ( = ?auto_8929 ?auto_8934 ) ) ( not ( = ?auto_8936 ?auto_8934 ) ) ( not ( = ?auto_8941 ?auto_8934 ) ) ( AVAILABLE ?auto_8933 ) ( TRUCK-AT ?auto_8939 ?auto_8932 ) ( LIFTING ?auto_8935 ?auto_8936 ) )
    :subtasks
    ( ( !LOAD ?auto_8935 ?auto_8936 ?auto_8939 ?auto_8932 )
      ( MAKE-ON ?auto_8926 ?auto_8927 )
      ( MAKE-ON-VERIFY ?auto_8926 ?auto_8927 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8943 - SURFACE
      ?auto_8944 - SURFACE
    )
    :vars
    (
      ?auto_8946 - HOIST
      ?auto_8949 - PLACE
      ?auto_8948 - PLACE
      ?auto_8957 - HOIST
      ?auto_8954 - SURFACE
      ?auto_8950 - SURFACE
      ?auto_8956 - PLACE
      ?auto_8953 - HOIST
      ?auto_8955 - SURFACE
      ?auto_8958 - SURFACE
      ?auto_8945 - PLACE
      ?auto_8951 - HOIST
      ?auto_8959 - SURFACE
      ?auto_8947 - SURFACE
      ?auto_8952 - TRUCK
      ?auto_8960 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8946 ?auto_8949 ) ( IS-CRATE ?auto_8943 ) ( not ( = ?auto_8943 ?auto_8944 ) ) ( not ( = ?auto_8948 ?auto_8949 ) ) ( HOIST-AT ?auto_8957 ?auto_8948 ) ( not ( = ?auto_8946 ?auto_8957 ) ) ( SURFACE-AT ?auto_8943 ?auto_8948 ) ( ON ?auto_8943 ?auto_8954 ) ( CLEAR ?auto_8943 ) ( not ( = ?auto_8943 ?auto_8954 ) ) ( not ( = ?auto_8944 ?auto_8954 ) ) ( IS-CRATE ?auto_8944 ) ( not ( = ?auto_8943 ?auto_8950 ) ) ( not ( = ?auto_8944 ?auto_8950 ) ) ( not ( = ?auto_8954 ?auto_8950 ) ) ( not ( = ?auto_8956 ?auto_8949 ) ) ( not ( = ?auto_8948 ?auto_8956 ) ) ( HOIST-AT ?auto_8953 ?auto_8956 ) ( not ( = ?auto_8946 ?auto_8953 ) ) ( not ( = ?auto_8957 ?auto_8953 ) ) ( AVAILABLE ?auto_8953 ) ( SURFACE-AT ?auto_8944 ?auto_8956 ) ( ON ?auto_8944 ?auto_8955 ) ( CLEAR ?auto_8944 ) ( not ( = ?auto_8943 ?auto_8955 ) ) ( not ( = ?auto_8944 ?auto_8955 ) ) ( not ( = ?auto_8954 ?auto_8955 ) ) ( not ( = ?auto_8950 ?auto_8955 ) ) ( IS-CRATE ?auto_8950 ) ( not ( = ?auto_8943 ?auto_8958 ) ) ( not ( = ?auto_8944 ?auto_8958 ) ) ( not ( = ?auto_8954 ?auto_8958 ) ) ( not ( = ?auto_8950 ?auto_8958 ) ) ( not ( = ?auto_8955 ?auto_8958 ) ) ( not ( = ?auto_8945 ?auto_8949 ) ) ( not ( = ?auto_8948 ?auto_8945 ) ) ( not ( = ?auto_8956 ?auto_8945 ) ) ( HOIST-AT ?auto_8951 ?auto_8945 ) ( not ( = ?auto_8946 ?auto_8951 ) ) ( not ( = ?auto_8957 ?auto_8951 ) ) ( not ( = ?auto_8953 ?auto_8951 ) ) ( AVAILABLE ?auto_8951 ) ( SURFACE-AT ?auto_8950 ?auto_8945 ) ( ON ?auto_8950 ?auto_8959 ) ( CLEAR ?auto_8950 ) ( not ( = ?auto_8943 ?auto_8959 ) ) ( not ( = ?auto_8944 ?auto_8959 ) ) ( not ( = ?auto_8954 ?auto_8959 ) ) ( not ( = ?auto_8950 ?auto_8959 ) ) ( not ( = ?auto_8955 ?auto_8959 ) ) ( not ( = ?auto_8958 ?auto_8959 ) ) ( SURFACE-AT ?auto_8947 ?auto_8949 ) ( CLEAR ?auto_8947 ) ( IS-CRATE ?auto_8958 ) ( not ( = ?auto_8943 ?auto_8947 ) ) ( not ( = ?auto_8944 ?auto_8947 ) ) ( not ( = ?auto_8954 ?auto_8947 ) ) ( not ( = ?auto_8950 ?auto_8947 ) ) ( not ( = ?auto_8955 ?auto_8947 ) ) ( not ( = ?auto_8958 ?auto_8947 ) ) ( not ( = ?auto_8959 ?auto_8947 ) ) ( AVAILABLE ?auto_8946 ) ( TRUCK-AT ?auto_8952 ?auto_8948 ) ( AVAILABLE ?auto_8957 ) ( SURFACE-AT ?auto_8958 ?auto_8948 ) ( ON ?auto_8958 ?auto_8960 ) ( CLEAR ?auto_8958 ) ( not ( = ?auto_8943 ?auto_8960 ) ) ( not ( = ?auto_8944 ?auto_8960 ) ) ( not ( = ?auto_8954 ?auto_8960 ) ) ( not ( = ?auto_8950 ?auto_8960 ) ) ( not ( = ?auto_8955 ?auto_8960 ) ) ( not ( = ?auto_8958 ?auto_8960 ) ) ( not ( = ?auto_8959 ?auto_8960 ) ) ( not ( = ?auto_8947 ?auto_8960 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8957 ?auto_8958 ?auto_8960 ?auto_8948 )
      ( MAKE-ON ?auto_8943 ?auto_8944 )
      ( MAKE-ON-VERIFY ?auto_8943 ?auto_8944 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8961 - SURFACE
      ?auto_8962 - SURFACE
    )
    :vars
    (
      ?auto_8974 - HOIST
      ?auto_8963 - PLACE
      ?auto_8970 - PLACE
      ?auto_8966 - HOIST
      ?auto_8977 - SURFACE
      ?auto_8967 - SURFACE
      ?auto_8965 - PLACE
      ?auto_8969 - HOIST
      ?auto_8964 - SURFACE
      ?auto_8971 - SURFACE
      ?auto_8968 - PLACE
      ?auto_8976 - HOIST
      ?auto_8975 - SURFACE
      ?auto_8973 - SURFACE
      ?auto_8978 - SURFACE
      ?auto_8972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8974 ?auto_8963 ) ( IS-CRATE ?auto_8961 ) ( not ( = ?auto_8961 ?auto_8962 ) ) ( not ( = ?auto_8970 ?auto_8963 ) ) ( HOIST-AT ?auto_8966 ?auto_8970 ) ( not ( = ?auto_8974 ?auto_8966 ) ) ( SURFACE-AT ?auto_8961 ?auto_8970 ) ( ON ?auto_8961 ?auto_8977 ) ( CLEAR ?auto_8961 ) ( not ( = ?auto_8961 ?auto_8977 ) ) ( not ( = ?auto_8962 ?auto_8977 ) ) ( IS-CRATE ?auto_8962 ) ( not ( = ?auto_8961 ?auto_8967 ) ) ( not ( = ?auto_8962 ?auto_8967 ) ) ( not ( = ?auto_8977 ?auto_8967 ) ) ( not ( = ?auto_8965 ?auto_8963 ) ) ( not ( = ?auto_8970 ?auto_8965 ) ) ( HOIST-AT ?auto_8969 ?auto_8965 ) ( not ( = ?auto_8974 ?auto_8969 ) ) ( not ( = ?auto_8966 ?auto_8969 ) ) ( AVAILABLE ?auto_8969 ) ( SURFACE-AT ?auto_8962 ?auto_8965 ) ( ON ?auto_8962 ?auto_8964 ) ( CLEAR ?auto_8962 ) ( not ( = ?auto_8961 ?auto_8964 ) ) ( not ( = ?auto_8962 ?auto_8964 ) ) ( not ( = ?auto_8977 ?auto_8964 ) ) ( not ( = ?auto_8967 ?auto_8964 ) ) ( IS-CRATE ?auto_8967 ) ( not ( = ?auto_8961 ?auto_8971 ) ) ( not ( = ?auto_8962 ?auto_8971 ) ) ( not ( = ?auto_8977 ?auto_8971 ) ) ( not ( = ?auto_8967 ?auto_8971 ) ) ( not ( = ?auto_8964 ?auto_8971 ) ) ( not ( = ?auto_8968 ?auto_8963 ) ) ( not ( = ?auto_8970 ?auto_8968 ) ) ( not ( = ?auto_8965 ?auto_8968 ) ) ( HOIST-AT ?auto_8976 ?auto_8968 ) ( not ( = ?auto_8974 ?auto_8976 ) ) ( not ( = ?auto_8966 ?auto_8976 ) ) ( not ( = ?auto_8969 ?auto_8976 ) ) ( AVAILABLE ?auto_8976 ) ( SURFACE-AT ?auto_8967 ?auto_8968 ) ( ON ?auto_8967 ?auto_8975 ) ( CLEAR ?auto_8967 ) ( not ( = ?auto_8961 ?auto_8975 ) ) ( not ( = ?auto_8962 ?auto_8975 ) ) ( not ( = ?auto_8977 ?auto_8975 ) ) ( not ( = ?auto_8967 ?auto_8975 ) ) ( not ( = ?auto_8964 ?auto_8975 ) ) ( not ( = ?auto_8971 ?auto_8975 ) ) ( SURFACE-AT ?auto_8973 ?auto_8963 ) ( CLEAR ?auto_8973 ) ( IS-CRATE ?auto_8971 ) ( not ( = ?auto_8961 ?auto_8973 ) ) ( not ( = ?auto_8962 ?auto_8973 ) ) ( not ( = ?auto_8977 ?auto_8973 ) ) ( not ( = ?auto_8967 ?auto_8973 ) ) ( not ( = ?auto_8964 ?auto_8973 ) ) ( not ( = ?auto_8971 ?auto_8973 ) ) ( not ( = ?auto_8975 ?auto_8973 ) ) ( AVAILABLE ?auto_8974 ) ( AVAILABLE ?auto_8966 ) ( SURFACE-AT ?auto_8971 ?auto_8970 ) ( ON ?auto_8971 ?auto_8978 ) ( CLEAR ?auto_8971 ) ( not ( = ?auto_8961 ?auto_8978 ) ) ( not ( = ?auto_8962 ?auto_8978 ) ) ( not ( = ?auto_8977 ?auto_8978 ) ) ( not ( = ?auto_8967 ?auto_8978 ) ) ( not ( = ?auto_8964 ?auto_8978 ) ) ( not ( = ?auto_8971 ?auto_8978 ) ) ( not ( = ?auto_8975 ?auto_8978 ) ) ( not ( = ?auto_8973 ?auto_8978 ) ) ( TRUCK-AT ?auto_8972 ?auto_8963 ) )
    :subtasks
    ( ( !DRIVE ?auto_8972 ?auto_8963 ?auto_8970 )
      ( MAKE-ON ?auto_8961 ?auto_8962 )
      ( MAKE-ON-VERIFY ?auto_8961 ?auto_8962 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8981 - SURFACE
      ?auto_8982 - SURFACE
    )
    :vars
    (
      ?auto_8983 - HOIST
      ?auto_8984 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8983 ?auto_8984 ) ( SURFACE-AT ?auto_8982 ?auto_8984 ) ( CLEAR ?auto_8982 ) ( LIFTING ?auto_8983 ?auto_8981 ) ( IS-CRATE ?auto_8981 ) ( not ( = ?auto_8981 ?auto_8982 ) ) )
    :subtasks
    ( ( !DROP ?auto_8983 ?auto_8981 ?auto_8982 ?auto_8984 )
      ( MAKE-ON-VERIFY ?auto_8981 ?auto_8982 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8985 - SURFACE
      ?auto_8986 - SURFACE
    )
    :vars
    (
      ?auto_8987 - HOIST
      ?auto_8988 - PLACE
      ?auto_8989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8987 ?auto_8988 ) ( SURFACE-AT ?auto_8986 ?auto_8988 ) ( CLEAR ?auto_8986 ) ( IS-CRATE ?auto_8985 ) ( not ( = ?auto_8985 ?auto_8986 ) ) ( TRUCK-AT ?auto_8989 ?auto_8988 ) ( AVAILABLE ?auto_8987 ) ( IN ?auto_8985 ?auto_8989 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8987 ?auto_8985 ?auto_8989 ?auto_8988 )
      ( MAKE-ON ?auto_8985 ?auto_8986 )
      ( MAKE-ON-VERIFY ?auto_8985 ?auto_8986 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8990 - SURFACE
      ?auto_8991 - SURFACE
    )
    :vars
    (
      ?auto_8992 - HOIST
      ?auto_8993 - PLACE
      ?auto_8994 - TRUCK
      ?auto_8995 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8992 ?auto_8993 ) ( SURFACE-AT ?auto_8991 ?auto_8993 ) ( CLEAR ?auto_8991 ) ( IS-CRATE ?auto_8990 ) ( not ( = ?auto_8990 ?auto_8991 ) ) ( AVAILABLE ?auto_8992 ) ( IN ?auto_8990 ?auto_8994 ) ( TRUCK-AT ?auto_8994 ?auto_8995 ) ( not ( = ?auto_8995 ?auto_8993 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8994 ?auto_8995 ?auto_8993 )
      ( MAKE-ON ?auto_8990 ?auto_8991 )
      ( MAKE-ON-VERIFY ?auto_8990 ?auto_8991 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8996 - SURFACE
      ?auto_8997 - SURFACE
    )
    :vars
    (
      ?auto_9001 - HOIST
      ?auto_9000 - PLACE
      ?auto_8999 - TRUCK
      ?auto_8998 - PLACE
      ?auto_9002 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9001 ?auto_9000 ) ( SURFACE-AT ?auto_8997 ?auto_9000 ) ( CLEAR ?auto_8997 ) ( IS-CRATE ?auto_8996 ) ( not ( = ?auto_8996 ?auto_8997 ) ) ( AVAILABLE ?auto_9001 ) ( TRUCK-AT ?auto_8999 ?auto_8998 ) ( not ( = ?auto_8998 ?auto_9000 ) ) ( HOIST-AT ?auto_9002 ?auto_8998 ) ( LIFTING ?auto_9002 ?auto_8996 ) ( not ( = ?auto_9001 ?auto_9002 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9002 ?auto_8996 ?auto_8999 ?auto_8998 )
      ( MAKE-ON ?auto_8996 ?auto_8997 )
      ( MAKE-ON-VERIFY ?auto_8996 ?auto_8997 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9003 - SURFACE
      ?auto_9004 - SURFACE
    )
    :vars
    (
      ?auto_9007 - HOIST
      ?auto_9006 - PLACE
      ?auto_9008 - TRUCK
      ?auto_9005 - PLACE
      ?auto_9009 - HOIST
      ?auto_9010 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9007 ?auto_9006 ) ( SURFACE-AT ?auto_9004 ?auto_9006 ) ( CLEAR ?auto_9004 ) ( IS-CRATE ?auto_9003 ) ( not ( = ?auto_9003 ?auto_9004 ) ) ( AVAILABLE ?auto_9007 ) ( TRUCK-AT ?auto_9008 ?auto_9005 ) ( not ( = ?auto_9005 ?auto_9006 ) ) ( HOIST-AT ?auto_9009 ?auto_9005 ) ( not ( = ?auto_9007 ?auto_9009 ) ) ( AVAILABLE ?auto_9009 ) ( SURFACE-AT ?auto_9003 ?auto_9005 ) ( ON ?auto_9003 ?auto_9010 ) ( CLEAR ?auto_9003 ) ( not ( = ?auto_9003 ?auto_9010 ) ) ( not ( = ?auto_9004 ?auto_9010 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9009 ?auto_9003 ?auto_9010 ?auto_9005 )
      ( MAKE-ON ?auto_9003 ?auto_9004 )
      ( MAKE-ON-VERIFY ?auto_9003 ?auto_9004 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9011 - SURFACE
      ?auto_9012 - SURFACE
    )
    :vars
    (
      ?auto_9018 - HOIST
      ?auto_9017 - PLACE
      ?auto_9014 - PLACE
      ?auto_9013 - HOIST
      ?auto_9015 - SURFACE
      ?auto_9016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9018 ?auto_9017 ) ( SURFACE-AT ?auto_9012 ?auto_9017 ) ( CLEAR ?auto_9012 ) ( IS-CRATE ?auto_9011 ) ( not ( = ?auto_9011 ?auto_9012 ) ) ( AVAILABLE ?auto_9018 ) ( not ( = ?auto_9014 ?auto_9017 ) ) ( HOIST-AT ?auto_9013 ?auto_9014 ) ( not ( = ?auto_9018 ?auto_9013 ) ) ( AVAILABLE ?auto_9013 ) ( SURFACE-AT ?auto_9011 ?auto_9014 ) ( ON ?auto_9011 ?auto_9015 ) ( CLEAR ?auto_9011 ) ( not ( = ?auto_9011 ?auto_9015 ) ) ( not ( = ?auto_9012 ?auto_9015 ) ) ( TRUCK-AT ?auto_9016 ?auto_9017 ) )
    :subtasks
    ( ( !DRIVE ?auto_9016 ?auto_9017 ?auto_9014 )
      ( MAKE-ON ?auto_9011 ?auto_9012 )
      ( MAKE-ON-VERIFY ?auto_9011 ?auto_9012 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9019 - SURFACE
      ?auto_9020 - SURFACE
    )
    :vars
    (
      ?auto_9021 - HOIST
      ?auto_9025 - PLACE
      ?auto_9026 - PLACE
      ?auto_9022 - HOIST
      ?auto_9023 - SURFACE
      ?auto_9024 - TRUCK
      ?auto_9027 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9021 ?auto_9025 ) ( IS-CRATE ?auto_9019 ) ( not ( = ?auto_9019 ?auto_9020 ) ) ( not ( = ?auto_9026 ?auto_9025 ) ) ( HOIST-AT ?auto_9022 ?auto_9026 ) ( not ( = ?auto_9021 ?auto_9022 ) ) ( AVAILABLE ?auto_9022 ) ( SURFACE-AT ?auto_9019 ?auto_9026 ) ( ON ?auto_9019 ?auto_9023 ) ( CLEAR ?auto_9019 ) ( not ( = ?auto_9019 ?auto_9023 ) ) ( not ( = ?auto_9020 ?auto_9023 ) ) ( TRUCK-AT ?auto_9024 ?auto_9025 ) ( SURFACE-AT ?auto_9027 ?auto_9025 ) ( CLEAR ?auto_9027 ) ( LIFTING ?auto_9021 ?auto_9020 ) ( IS-CRATE ?auto_9020 ) ( not ( = ?auto_9019 ?auto_9027 ) ) ( not ( = ?auto_9020 ?auto_9027 ) ) ( not ( = ?auto_9023 ?auto_9027 ) ) )
    :subtasks
    ( ( !DROP ?auto_9021 ?auto_9020 ?auto_9027 ?auto_9025 )
      ( MAKE-ON ?auto_9019 ?auto_9020 )
      ( MAKE-ON-VERIFY ?auto_9019 ?auto_9020 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9028 - SURFACE
      ?auto_9029 - SURFACE
    )
    :vars
    (
      ?auto_9032 - HOIST
      ?auto_9031 - PLACE
      ?auto_9034 - PLACE
      ?auto_9035 - HOIST
      ?auto_9036 - SURFACE
      ?auto_9030 - TRUCK
      ?auto_9033 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9032 ?auto_9031 ) ( IS-CRATE ?auto_9028 ) ( not ( = ?auto_9028 ?auto_9029 ) ) ( not ( = ?auto_9034 ?auto_9031 ) ) ( HOIST-AT ?auto_9035 ?auto_9034 ) ( not ( = ?auto_9032 ?auto_9035 ) ) ( AVAILABLE ?auto_9035 ) ( SURFACE-AT ?auto_9028 ?auto_9034 ) ( ON ?auto_9028 ?auto_9036 ) ( CLEAR ?auto_9028 ) ( not ( = ?auto_9028 ?auto_9036 ) ) ( not ( = ?auto_9029 ?auto_9036 ) ) ( TRUCK-AT ?auto_9030 ?auto_9031 ) ( SURFACE-AT ?auto_9033 ?auto_9031 ) ( CLEAR ?auto_9033 ) ( IS-CRATE ?auto_9029 ) ( not ( = ?auto_9028 ?auto_9033 ) ) ( not ( = ?auto_9029 ?auto_9033 ) ) ( not ( = ?auto_9036 ?auto_9033 ) ) ( AVAILABLE ?auto_9032 ) ( IN ?auto_9029 ?auto_9030 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9032 ?auto_9029 ?auto_9030 ?auto_9031 )
      ( MAKE-ON ?auto_9028 ?auto_9029 )
      ( MAKE-ON-VERIFY ?auto_9028 ?auto_9029 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9037 - SURFACE
      ?auto_9038 - SURFACE
    )
    :vars
    (
      ?auto_9042 - HOIST
      ?auto_9041 - PLACE
      ?auto_9040 - PLACE
      ?auto_9043 - HOIST
      ?auto_9045 - SURFACE
      ?auto_9039 - SURFACE
      ?auto_9044 - TRUCK
      ?auto_9046 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9042 ?auto_9041 ) ( IS-CRATE ?auto_9037 ) ( not ( = ?auto_9037 ?auto_9038 ) ) ( not ( = ?auto_9040 ?auto_9041 ) ) ( HOIST-AT ?auto_9043 ?auto_9040 ) ( not ( = ?auto_9042 ?auto_9043 ) ) ( AVAILABLE ?auto_9043 ) ( SURFACE-AT ?auto_9037 ?auto_9040 ) ( ON ?auto_9037 ?auto_9045 ) ( CLEAR ?auto_9037 ) ( not ( = ?auto_9037 ?auto_9045 ) ) ( not ( = ?auto_9038 ?auto_9045 ) ) ( SURFACE-AT ?auto_9039 ?auto_9041 ) ( CLEAR ?auto_9039 ) ( IS-CRATE ?auto_9038 ) ( not ( = ?auto_9037 ?auto_9039 ) ) ( not ( = ?auto_9038 ?auto_9039 ) ) ( not ( = ?auto_9045 ?auto_9039 ) ) ( AVAILABLE ?auto_9042 ) ( IN ?auto_9038 ?auto_9044 ) ( TRUCK-AT ?auto_9044 ?auto_9046 ) ( not ( = ?auto_9046 ?auto_9041 ) ) ( not ( = ?auto_9040 ?auto_9046 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9044 ?auto_9046 ?auto_9041 )
      ( MAKE-ON ?auto_9037 ?auto_9038 )
      ( MAKE-ON-VERIFY ?auto_9037 ?auto_9038 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9047 - SURFACE
      ?auto_9048 - SURFACE
    )
    :vars
    (
      ?auto_9052 - HOIST
      ?auto_9053 - PLACE
      ?auto_9055 - PLACE
      ?auto_9056 - HOIST
      ?auto_9051 - SURFACE
      ?auto_9049 - SURFACE
      ?auto_9054 - TRUCK
      ?auto_9050 - PLACE
      ?auto_9057 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9052 ?auto_9053 ) ( IS-CRATE ?auto_9047 ) ( not ( = ?auto_9047 ?auto_9048 ) ) ( not ( = ?auto_9055 ?auto_9053 ) ) ( HOIST-AT ?auto_9056 ?auto_9055 ) ( not ( = ?auto_9052 ?auto_9056 ) ) ( AVAILABLE ?auto_9056 ) ( SURFACE-AT ?auto_9047 ?auto_9055 ) ( ON ?auto_9047 ?auto_9051 ) ( CLEAR ?auto_9047 ) ( not ( = ?auto_9047 ?auto_9051 ) ) ( not ( = ?auto_9048 ?auto_9051 ) ) ( SURFACE-AT ?auto_9049 ?auto_9053 ) ( CLEAR ?auto_9049 ) ( IS-CRATE ?auto_9048 ) ( not ( = ?auto_9047 ?auto_9049 ) ) ( not ( = ?auto_9048 ?auto_9049 ) ) ( not ( = ?auto_9051 ?auto_9049 ) ) ( AVAILABLE ?auto_9052 ) ( TRUCK-AT ?auto_9054 ?auto_9050 ) ( not ( = ?auto_9050 ?auto_9053 ) ) ( not ( = ?auto_9055 ?auto_9050 ) ) ( HOIST-AT ?auto_9057 ?auto_9050 ) ( LIFTING ?auto_9057 ?auto_9048 ) ( not ( = ?auto_9052 ?auto_9057 ) ) ( not ( = ?auto_9056 ?auto_9057 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9057 ?auto_9048 ?auto_9054 ?auto_9050 )
      ( MAKE-ON ?auto_9047 ?auto_9048 )
      ( MAKE-ON-VERIFY ?auto_9047 ?auto_9048 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9058 - SURFACE
      ?auto_9059 - SURFACE
    )
    :vars
    (
      ?auto_9063 - HOIST
      ?auto_9062 - PLACE
      ?auto_9066 - PLACE
      ?auto_9061 - HOIST
      ?auto_9064 - SURFACE
      ?auto_9068 - SURFACE
      ?auto_9065 - TRUCK
      ?auto_9060 - PLACE
      ?auto_9067 - HOIST
      ?auto_9069 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9063 ?auto_9062 ) ( IS-CRATE ?auto_9058 ) ( not ( = ?auto_9058 ?auto_9059 ) ) ( not ( = ?auto_9066 ?auto_9062 ) ) ( HOIST-AT ?auto_9061 ?auto_9066 ) ( not ( = ?auto_9063 ?auto_9061 ) ) ( AVAILABLE ?auto_9061 ) ( SURFACE-AT ?auto_9058 ?auto_9066 ) ( ON ?auto_9058 ?auto_9064 ) ( CLEAR ?auto_9058 ) ( not ( = ?auto_9058 ?auto_9064 ) ) ( not ( = ?auto_9059 ?auto_9064 ) ) ( SURFACE-AT ?auto_9068 ?auto_9062 ) ( CLEAR ?auto_9068 ) ( IS-CRATE ?auto_9059 ) ( not ( = ?auto_9058 ?auto_9068 ) ) ( not ( = ?auto_9059 ?auto_9068 ) ) ( not ( = ?auto_9064 ?auto_9068 ) ) ( AVAILABLE ?auto_9063 ) ( TRUCK-AT ?auto_9065 ?auto_9060 ) ( not ( = ?auto_9060 ?auto_9062 ) ) ( not ( = ?auto_9066 ?auto_9060 ) ) ( HOIST-AT ?auto_9067 ?auto_9060 ) ( not ( = ?auto_9063 ?auto_9067 ) ) ( not ( = ?auto_9061 ?auto_9067 ) ) ( AVAILABLE ?auto_9067 ) ( SURFACE-AT ?auto_9059 ?auto_9060 ) ( ON ?auto_9059 ?auto_9069 ) ( CLEAR ?auto_9059 ) ( not ( = ?auto_9058 ?auto_9069 ) ) ( not ( = ?auto_9059 ?auto_9069 ) ) ( not ( = ?auto_9064 ?auto_9069 ) ) ( not ( = ?auto_9068 ?auto_9069 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9067 ?auto_9059 ?auto_9069 ?auto_9060 )
      ( MAKE-ON ?auto_9058 ?auto_9059 )
      ( MAKE-ON-VERIFY ?auto_9058 ?auto_9059 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9070 - SURFACE
      ?auto_9071 - SURFACE
    )
    :vars
    (
      ?auto_9073 - HOIST
      ?auto_9080 - PLACE
      ?auto_9072 - PLACE
      ?auto_9081 - HOIST
      ?auto_9077 - SURFACE
      ?auto_9076 - SURFACE
      ?auto_9075 - PLACE
      ?auto_9079 - HOIST
      ?auto_9078 - SURFACE
      ?auto_9074 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9073 ?auto_9080 ) ( IS-CRATE ?auto_9070 ) ( not ( = ?auto_9070 ?auto_9071 ) ) ( not ( = ?auto_9072 ?auto_9080 ) ) ( HOIST-AT ?auto_9081 ?auto_9072 ) ( not ( = ?auto_9073 ?auto_9081 ) ) ( AVAILABLE ?auto_9081 ) ( SURFACE-AT ?auto_9070 ?auto_9072 ) ( ON ?auto_9070 ?auto_9077 ) ( CLEAR ?auto_9070 ) ( not ( = ?auto_9070 ?auto_9077 ) ) ( not ( = ?auto_9071 ?auto_9077 ) ) ( SURFACE-AT ?auto_9076 ?auto_9080 ) ( CLEAR ?auto_9076 ) ( IS-CRATE ?auto_9071 ) ( not ( = ?auto_9070 ?auto_9076 ) ) ( not ( = ?auto_9071 ?auto_9076 ) ) ( not ( = ?auto_9077 ?auto_9076 ) ) ( AVAILABLE ?auto_9073 ) ( not ( = ?auto_9075 ?auto_9080 ) ) ( not ( = ?auto_9072 ?auto_9075 ) ) ( HOIST-AT ?auto_9079 ?auto_9075 ) ( not ( = ?auto_9073 ?auto_9079 ) ) ( not ( = ?auto_9081 ?auto_9079 ) ) ( AVAILABLE ?auto_9079 ) ( SURFACE-AT ?auto_9071 ?auto_9075 ) ( ON ?auto_9071 ?auto_9078 ) ( CLEAR ?auto_9071 ) ( not ( = ?auto_9070 ?auto_9078 ) ) ( not ( = ?auto_9071 ?auto_9078 ) ) ( not ( = ?auto_9077 ?auto_9078 ) ) ( not ( = ?auto_9076 ?auto_9078 ) ) ( TRUCK-AT ?auto_9074 ?auto_9080 ) )
    :subtasks
    ( ( !DRIVE ?auto_9074 ?auto_9080 ?auto_9075 )
      ( MAKE-ON ?auto_9070 ?auto_9071 )
      ( MAKE-ON-VERIFY ?auto_9070 ?auto_9071 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9082 - SURFACE
      ?auto_9083 - SURFACE
    )
    :vars
    (
      ?auto_9087 - HOIST
      ?auto_9093 - PLACE
      ?auto_9085 - PLACE
      ?auto_9088 - HOIST
      ?auto_9084 - SURFACE
      ?auto_9091 - SURFACE
      ?auto_9090 - PLACE
      ?auto_9089 - HOIST
      ?auto_9086 - SURFACE
      ?auto_9092 - TRUCK
      ?auto_9094 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9087 ?auto_9093 ) ( IS-CRATE ?auto_9082 ) ( not ( = ?auto_9082 ?auto_9083 ) ) ( not ( = ?auto_9085 ?auto_9093 ) ) ( HOIST-AT ?auto_9088 ?auto_9085 ) ( not ( = ?auto_9087 ?auto_9088 ) ) ( AVAILABLE ?auto_9088 ) ( SURFACE-AT ?auto_9082 ?auto_9085 ) ( ON ?auto_9082 ?auto_9084 ) ( CLEAR ?auto_9082 ) ( not ( = ?auto_9082 ?auto_9084 ) ) ( not ( = ?auto_9083 ?auto_9084 ) ) ( IS-CRATE ?auto_9083 ) ( not ( = ?auto_9082 ?auto_9091 ) ) ( not ( = ?auto_9083 ?auto_9091 ) ) ( not ( = ?auto_9084 ?auto_9091 ) ) ( not ( = ?auto_9090 ?auto_9093 ) ) ( not ( = ?auto_9085 ?auto_9090 ) ) ( HOIST-AT ?auto_9089 ?auto_9090 ) ( not ( = ?auto_9087 ?auto_9089 ) ) ( not ( = ?auto_9088 ?auto_9089 ) ) ( AVAILABLE ?auto_9089 ) ( SURFACE-AT ?auto_9083 ?auto_9090 ) ( ON ?auto_9083 ?auto_9086 ) ( CLEAR ?auto_9083 ) ( not ( = ?auto_9082 ?auto_9086 ) ) ( not ( = ?auto_9083 ?auto_9086 ) ) ( not ( = ?auto_9084 ?auto_9086 ) ) ( not ( = ?auto_9091 ?auto_9086 ) ) ( TRUCK-AT ?auto_9092 ?auto_9093 ) ( SURFACE-AT ?auto_9094 ?auto_9093 ) ( CLEAR ?auto_9094 ) ( LIFTING ?auto_9087 ?auto_9091 ) ( IS-CRATE ?auto_9091 ) ( not ( = ?auto_9082 ?auto_9094 ) ) ( not ( = ?auto_9083 ?auto_9094 ) ) ( not ( = ?auto_9084 ?auto_9094 ) ) ( not ( = ?auto_9091 ?auto_9094 ) ) ( not ( = ?auto_9086 ?auto_9094 ) ) )
    :subtasks
    ( ( !DROP ?auto_9087 ?auto_9091 ?auto_9094 ?auto_9093 )
      ( MAKE-ON ?auto_9082 ?auto_9083 )
      ( MAKE-ON-VERIFY ?auto_9082 ?auto_9083 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9095 - SURFACE
      ?auto_9096 - SURFACE
    )
    :vars
    (
      ?auto_9103 - HOIST
      ?auto_9099 - PLACE
      ?auto_9102 - PLACE
      ?auto_9104 - HOIST
      ?auto_9107 - SURFACE
      ?auto_9098 - SURFACE
      ?auto_9100 - PLACE
      ?auto_9101 - HOIST
      ?auto_9097 - SURFACE
      ?auto_9106 - TRUCK
      ?auto_9105 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9103 ?auto_9099 ) ( IS-CRATE ?auto_9095 ) ( not ( = ?auto_9095 ?auto_9096 ) ) ( not ( = ?auto_9102 ?auto_9099 ) ) ( HOIST-AT ?auto_9104 ?auto_9102 ) ( not ( = ?auto_9103 ?auto_9104 ) ) ( AVAILABLE ?auto_9104 ) ( SURFACE-AT ?auto_9095 ?auto_9102 ) ( ON ?auto_9095 ?auto_9107 ) ( CLEAR ?auto_9095 ) ( not ( = ?auto_9095 ?auto_9107 ) ) ( not ( = ?auto_9096 ?auto_9107 ) ) ( IS-CRATE ?auto_9096 ) ( not ( = ?auto_9095 ?auto_9098 ) ) ( not ( = ?auto_9096 ?auto_9098 ) ) ( not ( = ?auto_9107 ?auto_9098 ) ) ( not ( = ?auto_9100 ?auto_9099 ) ) ( not ( = ?auto_9102 ?auto_9100 ) ) ( HOIST-AT ?auto_9101 ?auto_9100 ) ( not ( = ?auto_9103 ?auto_9101 ) ) ( not ( = ?auto_9104 ?auto_9101 ) ) ( AVAILABLE ?auto_9101 ) ( SURFACE-AT ?auto_9096 ?auto_9100 ) ( ON ?auto_9096 ?auto_9097 ) ( CLEAR ?auto_9096 ) ( not ( = ?auto_9095 ?auto_9097 ) ) ( not ( = ?auto_9096 ?auto_9097 ) ) ( not ( = ?auto_9107 ?auto_9097 ) ) ( not ( = ?auto_9098 ?auto_9097 ) ) ( TRUCK-AT ?auto_9106 ?auto_9099 ) ( SURFACE-AT ?auto_9105 ?auto_9099 ) ( CLEAR ?auto_9105 ) ( IS-CRATE ?auto_9098 ) ( not ( = ?auto_9095 ?auto_9105 ) ) ( not ( = ?auto_9096 ?auto_9105 ) ) ( not ( = ?auto_9107 ?auto_9105 ) ) ( not ( = ?auto_9098 ?auto_9105 ) ) ( not ( = ?auto_9097 ?auto_9105 ) ) ( AVAILABLE ?auto_9103 ) ( IN ?auto_9098 ?auto_9106 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9103 ?auto_9098 ?auto_9106 ?auto_9099 )
      ( MAKE-ON ?auto_9095 ?auto_9096 )
      ( MAKE-ON-VERIFY ?auto_9095 ?auto_9096 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9108 - SURFACE
      ?auto_9109 - SURFACE
    )
    :vars
    (
      ?auto_9113 - HOIST
      ?auto_9111 - PLACE
      ?auto_9114 - PLACE
      ?auto_9117 - HOIST
      ?auto_9115 - SURFACE
      ?auto_9118 - SURFACE
      ?auto_9112 - PLACE
      ?auto_9110 - HOIST
      ?auto_9120 - SURFACE
      ?auto_9119 - SURFACE
      ?auto_9116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9113 ?auto_9111 ) ( IS-CRATE ?auto_9108 ) ( not ( = ?auto_9108 ?auto_9109 ) ) ( not ( = ?auto_9114 ?auto_9111 ) ) ( HOIST-AT ?auto_9117 ?auto_9114 ) ( not ( = ?auto_9113 ?auto_9117 ) ) ( AVAILABLE ?auto_9117 ) ( SURFACE-AT ?auto_9108 ?auto_9114 ) ( ON ?auto_9108 ?auto_9115 ) ( CLEAR ?auto_9108 ) ( not ( = ?auto_9108 ?auto_9115 ) ) ( not ( = ?auto_9109 ?auto_9115 ) ) ( IS-CRATE ?auto_9109 ) ( not ( = ?auto_9108 ?auto_9118 ) ) ( not ( = ?auto_9109 ?auto_9118 ) ) ( not ( = ?auto_9115 ?auto_9118 ) ) ( not ( = ?auto_9112 ?auto_9111 ) ) ( not ( = ?auto_9114 ?auto_9112 ) ) ( HOIST-AT ?auto_9110 ?auto_9112 ) ( not ( = ?auto_9113 ?auto_9110 ) ) ( not ( = ?auto_9117 ?auto_9110 ) ) ( AVAILABLE ?auto_9110 ) ( SURFACE-AT ?auto_9109 ?auto_9112 ) ( ON ?auto_9109 ?auto_9120 ) ( CLEAR ?auto_9109 ) ( not ( = ?auto_9108 ?auto_9120 ) ) ( not ( = ?auto_9109 ?auto_9120 ) ) ( not ( = ?auto_9115 ?auto_9120 ) ) ( not ( = ?auto_9118 ?auto_9120 ) ) ( SURFACE-AT ?auto_9119 ?auto_9111 ) ( CLEAR ?auto_9119 ) ( IS-CRATE ?auto_9118 ) ( not ( = ?auto_9108 ?auto_9119 ) ) ( not ( = ?auto_9109 ?auto_9119 ) ) ( not ( = ?auto_9115 ?auto_9119 ) ) ( not ( = ?auto_9118 ?auto_9119 ) ) ( not ( = ?auto_9120 ?auto_9119 ) ) ( AVAILABLE ?auto_9113 ) ( IN ?auto_9118 ?auto_9116 ) ( TRUCK-AT ?auto_9116 ?auto_9114 ) )
    :subtasks
    ( ( !DRIVE ?auto_9116 ?auto_9114 ?auto_9111 )
      ( MAKE-ON ?auto_9108 ?auto_9109 )
      ( MAKE-ON-VERIFY ?auto_9108 ?auto_9109 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9121 - SURFACE
      ?auto_9122 - SURFACE
    )
    :vars
    (
      ?auto_9126 - HOIST
      ?auto_9125 - PLACE
      ?auto_9124 - PLACE
      ?auto_9128 - HOIST
      ?auto_9129 - SURFACE
      ?auto_9133 - SURFACE
      ?auto_9130 - PLACE
      ?auto_9131 - HOIST
      ?auto_9127 - SURFACE
      ?auto_9123 - SURFACE
      ?auto_9132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9126 ?auto_9125 ) ( IS-CRATE ?auto_9121 ) ( not ( = ?auto_9121 ?auto_9122 ) ) ( not ( = ?auto_9124 ?auto_9125 ) ) ( HOIST-AT ?auto_9128 ?auto_9124 ) ( not ( = ?auto_9126 ?auto_9128 ) ) ( SURFACE-AT ?auto_9121 ?auto_9124 ) ( ON ?auto_9121 ?auto_9129 ) ( CLEAR ?auto_9121 ) ( not ( = ?auto_9121 ?auto_9129 ) ) ( not ( = ?auto_9122 ?auto_9129 ) ) ( IS-CRATE ?auto_9122 ) ( not ( = ?auto_9121 ?auto_9133 ) ) ( not ( = ?auto_9122 ?auto_9133 ) ) ( not ( = ?auto_9129 ?auto_9133 ) ) ( not ( = ?auto_9130 ?auto_9125 ) ) ( not ( = ?auto_9124 ?auto_9130 ) ) ( HOIST-AT ?auto_9131 ?auto_9130 ) ( not ( = ?auto_9126 ?auto_9131 ) ) ( not ( = ?auto_9128 ?auto_9131 ) ) ( AVAILABLE ?auto_9131 ) ( SURFACE-AT ?auto_9122 ?auto_9130 ) ( ON ?auto_9122 ?auto_9127 ) ( CLEAR ?auto_9122 ) ( not ( = ?auto_9121 ?auto_9127 ) ) ( not ( = ?auto_9122 ?auto_9127 ) ) ( not ( = ?auto_9129 ?auto_9127 ) ) ( not ( = ?auto_9133 ?auto_9127 ) ) ( SURFACE-AT ?auto_9123 ?auto_9125 ) ( CLEAR ?auto_9123 ) ( IS-CRATE ?auto_9133 ) ( not ( = ?auto_9121 ?auto_9123 ) ) ( not ( = ?auto_9122 ?auto_9123 ) ) ( not ( = ?auto_9129 ?auto_9123 ) ) ( not ( = ?auto_9133 ?auto_9123 ) ) ( not ( = ?auto_9127 ?auto_9123 ) ) ( AVAILABLE ?auto_9126 ) ( TRUCK-AT ?auto_9132 ?auto_9124 ) ( LIFTING ?auto_9128 ?auto_9133 ) )
    :subtasks
    ( ( !LOAD ?auto_9128 ?auto_9133 ?auto_9132 ?auto_9124 )
      ( MAKE-ON ?auto_9121 ?auto_9122 )
      ( MAKE-ON-VERIFY ?auto_9121 ?auto_9122 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9134 - SURFACE
      ?auto_9135 - SURFACE
    )
    :vars
    (
      ?auto_9140 - HOIST
      ?auto_9137 - PLACE
      ?auto_9136 - PLACE
      ?auto_9141 - HOIST
      ?auto_9145 - SURFACE
      ?auto_9139 - SURFACE
      ?auto_9142 - PLACE
      ?auto_9146 - HOIST
      ?auto_9144 - SURFACE
      ?auto_9143 - SURFACE
      ?auto_9138 - TRUCK
      ?auto_9147 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9140 ?auto_9137 ) ( IS-CRATE ?auto_9134 ) ( not ( = ?auto_9134 ?auto_9135 ) ) ( not ( = ?auto_9136 ?auto_9137 ) ) ( HOIST-AT ?auto_9141 ?auto_9136 ) ( not ( = ?auto_9140 ?auto_9141 ) ) ( SURFACE-AT ?auto_9134 ?auto_9136 ) ( ON ?auto_9134 ?auto_9145 ) ( CLEAR ?auto_9134 ) ( not ( = ?auto_9134 ?auto_9145 ) ) ( not ( = ?auto_9135 ?auto_9145 ) ) ( IS-CRATE ?auto_9135 ) ( not ( = ?auto_9134 ?auto_9139 ) ) ( not ( = ?auto_9135 ?auto_9139 ) ) ( not ( = ?auto_9145 ?auto_9139 ) ) ( not ( = ?auto_9142 ?auto_9137 ) ) ( not ( = ?auto_9136 ?auto_9142 ) ) ( HOIST-AT ?auto_9146 ?auto_9142 ) ( not ( = ?auto_9140 ?auto_9146 ) ) ( not ( = ?auto_9141 ?auto_9146 ) ) ( AVAILABLE ?auto_9146 ) ( SURFACE-AT ?auto_9135 ?auto_9142 ) ( ON ?auto_9135 ?auto_9144 ) ( CLEAR ?auto_9135 ) ( not ( = ?auto_9134 ?auto_9144 ) ) ( not ( = ?auto_9135 ?auto_9144 ) ) ( not ( = ?auto_9145 ?auto_9144 ) ) ( not ( = ?auto_9139 ?auto_9144 ) ) ( SURFACE-AT ?auto_9143 ?auto_9137 ) ( CLEAR ?auto_9143 ) ( IS-CRATE ?auto_9139 ) ( not ( = ?auto_9134 ?auto_9143 ) ) ( not ( = ?auto_9135 ?auto_9143 ) ) ( not ( = ?auto_9145 ?auto_9143 ) ) ( not ( = ?auto_9139 ?auto_9143 ) ) ( not ( = ?auto_9144 ?auto_9143 ) ) ( AVAILABLE ?auto_9140 ) ( TRUCK-AT ?auto_9138 ?auto_9136 ) ( AVAILABLE ?auto_9141 ) ( SURFACE-AT ?auto_9139 ?auto_9136 ) ( ON ?auto_9139 ?auto_9147 ) ( CLEAR ?auto_9139 ) ( not ( = ?auto_9134 ?auto_9147 ) ) ( not ( = ?auto_9135 ?auto_9147 ) ) ( not ( = ?auto_9145 ?auto_9147 ) ) ( not ( = ?auto_9139 ?auto_9147 ) ) ( not ( = ?auto_9144 ?auto_9147 ) ) ( not ( = ?auto_9143 ?auto_9147 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9141 ?auto_9139 ?auto_9147 ?auto_9136 )
      ( MAKE-ON ?auto_9134 ?auto_9135 )
      ( MAKE-ON-VERIFY ?auto_9134 ?auto_9135 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9148 - SURFACE
      ?auto_9149 - SURFACE
    )
    :vars
    (
      ?auto_9161 - HOIST
      ?auto_9157 - PLACE
      ?auto_9156 - PLACE
      ?auto_9153 - HOIST
      ?auto_9152 - SURFACE
      ?auto_9155 - SURFACE
      ?auto_9159 - PLACE
      ?auto_9154 - HOIST
      ?auto_9151 - SURFACE
      ?auto_9158 - SURFACE
      ?auto_9150 - SURFACE
      ?auto_9160 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9161 ?auto_9157 ) ( IS-CRATE ?auto_9148 ) ( not ( = ?auto_9148 ?auto_9149 ) ) ( not ( = ?auto_9156 ?auto_9157 ) ) ( HOIST-AT ?auto_9153 ?auto_9156 ) ( not ( = ?auto_9161 ?auto_9153 ) ) ( SURFACE-AT ?auto_9148 ?auto_9156 ) ( ON ?auto_9148 ?auto_9152 ) ( CLEAR ?auto_9148 ) ( not ( = ?auto_9148 ?auto_9152 ) ) ( not ( = ?auto_9149 ?auto_9152 ) ) ( IS-CRATE ?auto_9149 ) ( not ( = ?auto_9148 ?auto_9155 ) ) ( not ( = ?auto_9149 ?auto_9155 ) ) ( not ( = ?auto_9152 ?auto_9155 ) ) ( not ( = ?auto_9159 ?auto_9157 ) ) ( not ( = ?auto_9156 ?auto_9159 ) ) ( HOIST-AT ?auto_9154 ?auto_9159 ) ( not ( = ?auto_9161 ?auto_9154 ) ) ( not ( = ?auto_9153 ?auto_9154 ) ) ( AVAILABLE ?auto_9154 ) ( SURFACE-AT ?auto_9149 ?auto_9159 ) ( ON ?auto_9149 ?auto_9151 ) ( CLEAR ?auto_9149 ) ( not ( = ?auto_9148 ?auto_9151 ) ) ( not ( = ?auto_9149 ?auto_9151 ) ) ( not ( = ?auto_9152 ?auto_9151 ) ) ( not ( = ?auto_9155 ?auto_9151 ) ) ( SURFACE-AT ?auto_9158 ?auto_9157 ) ( CLEAR ?auto_9158 ) ( IS-CRATE ?auto_9155 ) ( not ( = ?auto_9148 ?auto_9158 ) ) ( not ( = ?auto_9149 ?auto_9158 ) ) ( not ( = ?auto_9152 ?auto_9158 ) ) ( not ( = ?auto_9155 ?auto_9158 ) ) ( not ( = ?auto_9151 ?auto_9158 ) ) ( AVAILABLE ?auto_9161 ) ( AVAILABLE ?auto_9153 ) ( SURFACE-AT ?auto_9155 ?auto_9156 ) ( ON ?auto_9155 ?auto_9150 ) ( CLEAR ?auto_9155 ) ( not ( = ?auto_9148 ?auto_9150 ) ) ( not ( = ?auto_9149 ?auto_9150 ) ) ( not ( = ?auto_9152 ?auto_9150 ) ) ( not ( = ?auto_9155 ?auto_9150 ) ) ( not ( = ?auto_9151 ?auto_9150 ) ) ( not ( = ?auto_9158 ?auto_9150 ) ) ( TRUCK-AT ?auto_9160 ?auto_9157 ) )
    :subtasks
    ( ( !DRIVE ?auto_9160 ?auto_9157 ?auto_9156 )
      ( MAKE-ON ?auto_9148 ?auto_9149 )
      ( MAKE-ON-VERIFY ?auto_9148 ?auto_9149 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9162 - SURFACE
      ?auto_9163 - SURFACE
    )
    :vars
    (
      ?auto_9170 - HOIST
      ?auto_9165 - PLACE
      ?auto_9169 - PLACE
      ?auto_9171 - HOIST
      ?auto_9168 - SURFACE
      ?auto_9172 - SURFACE
      ?auto_9174 - PLACE
      ?auto_9173 - HOIST
      ?auto_9164 - SURFACE
      ?auto_9166 - SURFACE
      ?auto_9167 - SURFACE
      ?auto_9175 - TRUCK
      ?auto_9176 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9170 ?auto_9165 ) ( IS-CRATE ?auto_9162 ) ( not ( = ?auto_9162 ?auto_9163 ) ) ( not ( = ?auto_9169 ?auto_9165 ) ) ( HOIST-AT ?auto_9171 ?auto_9169 ) ( not ( = ?auto_9170 ?auto_9171 ) ) ( SURFACE-AT ?auto_9162 ?auto_9169 ) ( ON ?auto_9162 ?auto_9168 ) ( CLEAR ?auto_9162 ) ( not ( = ?auto_9162 ?auto_9168 ) ) ( not ( = ?auto_9163 ?auto_9168 ) ) ( IS-CRATE ?auto_9163 ) ( not ( = ?auto_9162 ?auto_9172 ) ) ( not ( = ?auto_9163 ?auto_9172 ) ) ( not ( = ?auto_9168 ?auto_9172 ) ) ( not ( = ?auto_9174 ?auto_9165 ) ) ( not ( = ?auto_9169 ?auto_9174 ) ) ( HOIST-AT ?auto_9173 ?auto_9174 ) ( not ( = ?auto_9170 ?auto_9173 ) ) ( not ( = ?auto_9171 ?auto_9173 ) ) ( AVAILABLE ?auto_9173 ) ( SURFACE-AT ?auto_9163 ?auto_9174 ) ( ON ?auto_9163 ?auto_9164 ) ( CLEAR ?auto_9163 ) ( not ( = ?auto_9162 ?auto_9164 ) ) ( not ( = ?auto_9163 ?auto_9164 ) ) ( not ( = ?auto_9168 ?auto_9164 ) ) ( not ( = ?auto_9172 ?auto_9164 ) ) ( IS-CRATE ?auto_9172 ) ( not ( = ?auto_9162 ?auto_9166 ) ) ( not ( = ?auto_9163 ?auto_9166 ) ) ( not ( = ?auto_9168 ?auto_9166 ) ) ( not ( = ?auto_9172 ?auto_9166 ) ) ( not ( = ?auto_9164 ?auto_9166 ) ) ( AVAILABLE ?auto_9171 ) ( SURFACE-AT ?auto_9172 ?auto_9169 ) ( ON ?auto_9172 ?auto_9167 ) ( CLEAR ?auto_9172 ) ( not ( = ?auto_9162 ?auto_9167 ) ) ( not ( = ?auto_9163 ?auto_9167 ) ) ( not ( = ?auto_9168 ?auto_9167 ) ) ( not ( = ?auto_9172 ?auto_9167 ) ) ( not ( = ?auto_9164 ?auto_9167 ) ) ( not ( = ?auto_9166 ?auto_9167 ) ) ( TRUCK-AT ?auto_9175 ?auto_9165 ) ( SURFACE-AT ?auto_9176 ?auto_9165 ) ( CLEAR ?auto_9176 ) ( LIFTING ?auto_9170 ?auto_9166 ) ( IS-CRATE ?auto_9166 ) ( not ( = ?auto_9162 ?auto_9176 ) ) ( not ( = ?auto_9163 ?auto_9176 ) ) ( not ( = ?auto_9168 ?auto_9176 ) ) ( not ( = ?auto_9172 ?auto_9176 ) ) ( not ( = ?auto_9164 ?auto_9176 ) ) ( not ( = ?auto_9166 ?auto_9176 ) ) ( not ( = ?auto_9167 ?auto_9176 ) ) )
    :subtasks
    ( ( !DROP ?auto_9170 ?auto_9166 ?auto_9176 ?auto_9165 )
      ( MAKE-ON ?auto_9162 ?auto_9163 )
      ( MAKE-ON-VERIFY ?auto_9162 ?auto_9163 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9177 - SURFACE
      ?auto_9178 - SURFACE
    )
    :vars
    (
      ?auto_9190 - HOIST
      ?auto_9183 - PLACE
      ?auto_9185 - PLACE
      ?auto_9179 - HOIST
      ?auto_9186 - SURFACE
      ?auto_9188 - SURFACE
      ?auto_9187 - PLACE
      ?auto_9180 - HOIST
      ?auto_9182 - SURFACE
      ?auto_9181 - SURFACE
      ?auto_9184 - SURFACE
      ?auto_9189 - TRUCK
      ?auto_9191 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9190 ?auto_9183 ) ( IS-CRATE ?auto_9177 ) ( not ( = ?auto_9177 ?auto_9178 ) ) ( not ( = ?auto_9185 ?auto_9183 ) ) ( HOIST-AT ?auto_9179 ?auto_9185 ) ( not ( = ?auto_9190 ?auto_9179 ) ) ( SURFACE-AT ?auto_9177 ?auto_9185 ) ( ON ?auto_9177 ?auto_9186 ) ( CLEAR ?auto_9177 ) ( not ( = ?auto_9177 ?auto_9186 ) ) ( not ( = ?auto_9178 ?auto_9186 ) ) ( IS-CRATE ?auto_9178 ) ( not ( = ?auto_9177 ?auto_9188 ) ) ( not ( = ?auto_9178 ?auto_9188 ) ) ( not ( = ?auto_9186 ?auto_9188 ) ) ( not ( = ?auto_9187 ?auto_9183 ) ) ( not ( = ?auto_9185 ?auto_9187 ) ) ( HOIST-AT ?auto_9180 ?auto_9187 ) ( not ( = ?auto_9190 ?auto_9180 ) ) ( not ( = ?auto_9179 ?auto_9180 ) ) ( AVAILABLE ?auto_9180 ) ( SURFACE-AT ?auto_9178 ?auto_9187 ) ( ON ?auto_9178 ?auto_9182 ) ( CLEAR ?auto_9178 ) ( not ( = ?auto_9177 ?auto_9182 ) ) ( not ( = ?auto_9178 ?auto_9182 ) ) ( not ( = ?auto_9186 ?auto_9182 ) ) ( not ( = ?auto_9188 ?auto_9182 ) ) ( IS-CRATE ?auto_9188 ) ( not ( = ?auto_9177 ?auto_9181 ) ) ( not ( = ?auto_9178 ?auto_9181 ) ) ( not ( = ?auto_9186 ?auto_9181 ) ) ( not ( = ?auto_9188 ?auto_9181 ) ) ( not ( = ?auto_9182 ?auto_9181 ) ) ( AVAILABLE ?auto_9179 ) ( SURFACE-AT ?auto_9188 ?auto_9185 ) ( ON ?auto_9188 ?auto_9184 ) ( CLEAR ?auto_9188 ) ( not ( = ?auto_9177 ?auto_9184 ) ) ( not ( = ?auto_9178 ?auto_9184 ) ) ( not ( = ?auto_9186 ?auto_9184 ) ) ( not ( = ?auto_9188 ?auto_9184 ) ) ( not ( = ?auto_9182 ?auto_9184 ) ) ( not ( = ?auto_9181 ?auto_9184 ) ) ( TRUCK-AT ?auto_9189 ?auto_9183 ) ( SURFACE-AT ?auto_9191 ?auto_9183 ) ( CLEAR ?auto_9191 ) ( IS-CRATE ?auto_9181 ) ( not ( = ?auto_9177 ?auto_9191 ) ) ( not ( = ?auto_9178 ?auto_9191 ) ) ( not ( = ?auto_9186 ?auto_9191 ) ) ( not ( = ?auto_9188 ?auto_9191 ) ) ( not ( = ?auto_9182 ?auto_9191 ) ) ( not ( = ?auto_9181 ?auto_9191 ) ) ( not ( = ?auto_9184 ?auto_9191 ) ) ( AVAILABLE ?auto_9190 ) ( IN ?auto_9181 ?auto_9189 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9190 ?auto_9181 ?auto_9189 ?auto_9183 )
      ( MAKE-ON ?auto_9177 ?auto_9178 )
      ( MAKE-ON-VERIFY ?auto_9177 ?auto_9178 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9192 - SURFACE
      ?auto_9193 - SURFACE
    )
    :vars
    (
      ?auto_9204 - HOIST
      ?auto_9197 - PLACE
      ?auto_9202 - PLACE
      ?auto_9199 - HOIST
      ?auto_9200 - SURFACE
      ?auto_9194 - SURFACE
      ?auto_9203 - PLACE
      ?auto_9201 - HOIST
      ?auto_9196 - SURFACE
      ?auto_9205 - SURFACE
      ?auto_9206 - SURFACE
      ?auto_9198 - SURFACE
      ?auto_9195 - TRUCK
      ?auto_9207 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9204 ?auto_9197 ) ( IS-CRATE ?auto_9192 ) ( not ( = ?auto_9192 ?auto_9193 ) ) ( not ( = ?auto_9202 ?auto_9197 ) ) ( HOIST-AT ?auto_9199 ?auto_9202 ) ( not ( = ?auto_9204 ?auto_9199 ) ) ( SURFACE-AT ?auto_9192 ?auto_9202 ) ( ON ?auto_9192 ?auto_9200 ) ( CLEAR ?auto_9192 ) ( not ( = ?auto_9192 ?auto_9200 ) ) ( not ( = ?auto_9193 ?auto_9200 ) ) ( IS-CRATE ?auto_9193 ) ( not ( = ?auto_9192 ?auto_9194 ) ) ( not ( = ?auto_9193 ?auto_9194 ) ) ( not ( = ?auto_9200 ?auto_9194 ) ) ( not ( = ?auto_9203 ?auto_9197 ) ) ( not ( = ?auto_9202 ?auto_9203 ) ) ( HOIST-AT ?auto_9201 ?auto_9203 ) ( not ( = ?auto_9204 ?auto_9201 ) ) ( not ( = ?auto_9199 ?auto_9201 ) ) ( AVAILABLE ?auto_9201 ) ( SURFACE-AT ?auto_9193 ?auto_9203 ) ( ON ?auto_9193 ?auto_9196 ) ( CLEAR ?auto_9193 ) ( not ( = ?auto_9192 ?auto_9196 ) ) ( not ( = ?auto_9193 ?auto_9196 ) ) ( not ( = ?auto_9200 ?auto_9196 ) ) ( not ( = ?auto_9194 ?auto_9196 ) ) ( IS-CRATE ?auto_9194 ) ( not ( = ?auto_9192 ?auto_9205 ) ) ( not ( = ?auto_9193 ?auto_9205 ) ) ( not ( = ?auto_9200 ?auto_9205 ) ) ( not ( = ?auto_9194 ?auto_9205 ) ) ( not ( = ?auto_9196 ?auto_9205 ) ) ( AVAILABLE ?auto_9199 ) ( SURFACE-AT ?auto_9194 ?auto_9202 ) ( ON ?auto_9194 ?auto_9206 ) ( CLEAR ?auto_9194 ) ( not ( = ?auto_9192 ?auto_9206 ) ) ( not ( = ?auto_9193 ?auto_9206 ) ) ( not ( = ?auto_9200 ?auto_9206 ) ) ( not ( = ?auto_9194 ?auto_9206 ) ) ( not ( = ?auto_9196 ?auto_9206 ) ) ( not ( = ?auto_9205 ?auto_9206 ) ) ( SURFACE-AT ?auto_9198 ?auto_9197 ) ( CLEAR ?auto_9198 ) ( IS-CRATE ?auto_9205 ) ( not ( = ?auto_9192 ?auto_9198 ) ) ( not ( = ?auto_9193 ?auto_9198 ) ) ( not ( = ?auto_9200 ?auto_9198 ) ) ( not ( = ?auto_9194 ?auto_9198 ) ) ( not ( = ?auto_9196 ?auto_9198 ) ) ( not ( = ?auto_9205 ?auto_9198 ) ) ( not ( = ?auto_9206 ?auto_9198 ) ) ( AVAILABLE ?auto_9204 ) ( IN ?auto_9205 ?auto_9195 ) ( TRUCK-AT ?auto_9195 ?auto_9207 ) ( not ( = ?auto_9207 ?auto_9197 ) ) ( not ( = ?auto_9202 ?auto_9207 ) ) ( not ( = ?auto_9203 ?auto_9207 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9195 ?auto_9207 ?auto_9197 )
      ( MAKE-ON ?auto_9192 ?auto_9193 )
      ( MAKE-ON-VERIFY ?auto_9192 ?auto_9193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9208 - SURFACE
      ?auto_9209 - SURFACE
    )
    :vars
    (
      ?auto_9218 - HOIST
      ?auto_9219 - PLACE
      ?auto_9221 - PLACE
      ?auto_9216 - HOIST
      ?auto_9210 - SURFACE
      ?auto_9222 - SURFACE
      ?auto_9212 - PLACE
      ?auto_9215 - HOIST
      ?auto_9217 - SURFACE
      ?auto_9223 - SURFACE
      ?auto_9214 - SURFACE
      ?auto_9213 - SURFACE
      ?auto_9211 - TRUCK
      ?auto_9220 - PLACE
      ?auto_9224 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9218 ?auto_9219 ) ( IS-CRATE ?auto_9208 ) ( not ( = ?auto_9208 ?auto_9209 ) ) ( not ( = ?auto_9221 ?auto_9219 ) ) ( HOIST-AT ?auto_9216 ?auto_9221 ) ( not ( = ?auto_9218 ?auto_9216 ) ) ( SURFACE-AT ?auto_9208 ?auto_9221 ) ( ON ?auto_9208 ?auto_9210 ) ( CLEAR ?auto_9208 ) ( not ( = ?auto_9208 ?auto_9210 ) ) ( not ( = ?auto_9209 ?auto_9210 ) ) ( IS-CRATE ?auto_9209 ) ( not ( = ?auto_9208 ?auto_9222 ) ) ( not ( = ?auto_9209 ?auto_9222 ) ) ( not ( = ?auto_9210 ?auto_9222 ) ) ( not ( = ?auto_9212 ?auto_9219 ) ) ( not ( = ?auto_9221 ?auto_9212 ) ) ( HOIST-AT ?auto_9215 ?auto_9212 ) ( not ( = ?auto_9218 ?auto_9215 ) ) ( not ( = ?auto_9216 ?auto_9215 ) ) ( AVAILABLE ?auto_9215 ) ( SURFACE-AT ?auto_9209 ?auto_9212 ) ( ON ?auto_9209 ?auto_9217 ) ( CLEAR ?auto_9209 ) ( not ( = ?auto_9208 ?auto_9217 ) ) ( not ( = ?auto_9209 ?auto_9217 ) ) ( not ( = ?auto_9210 ?auto_9217 ) ) ( not ( = ?auto_9222 ?auto_9217 ) ) ( IS-CRATE ?auto_9222 ) ( not ( = ?auto_9208 ?auto_9223 ) ) ( not ( = ?auto_9209 ?auto_9223 ) ) ( not ( = ?auto_9210 ?auto_9223 ) ) ( not ( = ?auto_9222 ?auto_9223 ) ) ( not ( = ?auto_9217 ?auto_9223 ) ) ( AVAILABLE ?auto_9216 ) ( SURFACE-AT ?auto_9222 ?auto_9221 ) ( ON ?auto_9222 ?auto_9214 ) ( CLEAR ?auto_9222 ) ( not ( = ?auto_9208 ?auto_9214 ) ) ( not ( = ?auto_9209 ?auto_9214 ) ) ( not ( = ?auto_9210 ?auto_9214 ) ) ( not ( = ?auto_9222 ?auto_9214 ) ) ( not ( = ?auto_9217 ?auto_9214 ) ) ( not ( = ?auto_9223 ?auto_9214 ) ) ( SURFACE-AT ?auto_9213 ?auto_9219 ) ( CLEAR ?auto_9213 ) ( IS-CRATE ?auto_9223 ) ( not ( = ?auto_9208 ?auto_9213 ) ) ( not ( = ?auto_9209 ?auto_9213 ) ) ( not ( = ?auto_9210 ?auto_9213 ) ) ( not ( = ?auto_9222 ?auto_9213 ) ) ( not ( = ?auto_9217 ?auto_9213 ) ) ( not ( = ?auto_9223 ?auto_9213 ) ) ( not ( = ?auto_9214 ?auto_9213 ) ) ( AVAILABLE ?auto_9218 ) ( TRUCK-AT ?auto_9211 ?auto_9220 ) ( not ( = ?auto_9220 ?auto_9219 ) ) ( not ( = ?auto_9221 ?auto_9220 ) ) ( not ( = ?auto_9212 ?auto_9220 ) ) ( HOIST-AT ?auto_9224 ?auto_9220 ) ( LIFTING ?auto_9224 ?auto_9223 ) ( not ( = ?auto_9218 ?auto_9224 ) ) ( not ( = ?auto_9216 ?auto_9224 ) ) ( not ( = ?auto_9215 ?auto_9224 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9224 ?auto_9223 ?auto_9211 ?auto_9220 )
      ( MAKE-ON ?auto_9208 ?auto_9209 )
      ( MAKE-ON-VERIFY ?auto_9208 ?auto_9209 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9225 - SURFACE
      ?auto_9226 - SURFACE
    )
    :vars
    (
      ?auto_9228 - HOIST
      ?auto_9231 - PLACE
      ?auto_9232 - PLACE
      ?auto_9241 - HOIST
      ?auto_9238 - SURFACE
      ?auto_9237 - SURFACE
      ?auto_9234 - PLACE
      ?auto_9240 - HOIST
      ?auto_9235 - SURFACE
      ?auto_9227 - SURFACE
      ?auto_9230 - SURFACE
      ?auto_9229 - SURFACE
      ?auto_9236 - TRUCK
      ?auto_9233 - PLACE
      ?auto_9239 - HOIST
      ?auto_9242 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9228 ?auto_9231 ) ( IS-CRATE ?auto_9225 ) ( not ( = ?auto_9225 ?auto_9226 ) ) ( not ( = ?auto_9232 ?auto_9231 ) ) ( HOIST-AT ?auto_9241 ?auto_9232 ) ( not ( = ?auto_9228 ?auto_9241 ) ) ( SURFACE-AT ?auto_9225 ?auto_9232 ) ( ON ?auto_9225 ?auto_9238 ) ( CLEAR ?auto_9225 ) ( not ( = ?auto_9225 ?auto_9238 ) ) ( not ( = ?auto_9226 ?auto_9238 ) ) ( IS-CRATE ?auto_9226 ) ( not ( = ?auto_9225 ?auto_9237 ) ) ( not ( = ?auto_9226 ?auto_9237 ) ) ( not ( = ?auto_9238 ?auto_9237 ) ) ( not ( = ?auto_9234 ?auto_9231 ) ) ( not ( = ?auto_9232 ?auto_9234 ) ) ( HOIST-AT ?auto_9240 ?auto_9234 ) ( not ( = ?auto_9228 ?auto_9240 ) ) ( not ( = ?auto_9241 ?auto_9240 ) ) ( AVAILABLE ?auto_9240 ) ( SURFACE-AT ?auto_9226 ?auto_9234 ) ( ON ?auto_9226 ?auto_9235 ) ( CLEAR ?auto_9226 ) ( not ( = ?auto_9225 ?auto_9235 ) ) ( not ( = ?auto_9226 ?auto_9235 ) ) ( not ( = ?auto_9238 ?auto_9235 ) ) ( not ( = ?auto_9237 ?auto_9235 ) ) ( IS-CRATE ?auto_9237 ) ( not ( = ?auto_9225 ?auto_9227 ) ) ( not ( = ?auto_9226 ?auto_9227 ) ) ( not ( = ?auto_9238 ?auto_9227 ) ) ( not ( = ?auto_9237 ?auto_9227 ) ) ( not ( = ?auto_9235 ?auto_9227 ) ) ( AVAILABLE ?auto_9241 ) ( SURFACE-AT ?auto_9237 ?auto_9232 ) ( ON ?auto_9237 ?auto_9230 ) ( CLEAR ?auto_9237 ) ( not ( = ?auto_9225 ?auto_9230 ) ) ( not ( = ?auto_9226 ?auto_9230 ) ) ( not ( = ?auto_9238 ?auto_9230 ) ) ( not ( = ?auto_9237 ?auto_9230 ) ) ( not ( = ?auto_9235 ?auto_9230 ) ) ( not ( = ?auto_9227 ?auto_9230 ) ) ( SURFACE-AT ?auto_9229 ?auto_9231 ) ( CLEAR ?auto_9229 ) ( IS-CRATE ?auto_9227 ) ( not ( = ?auto_9225 ?auto_9229 ) ) ( not ( = ?auto_9226 ?auto_9229 ) ) ( not ( = ?auto_9238 ?auto_9229 ) ) ( not ( = ?auto_9237 ?auto_9229 ) ) ( not ( = ?auto_9235 ?auto_9229 ) ) ( not ( = ?auto_9227 ?auto_9229 ) ) ( not ( = ?auto_9230 ?auto_9229 ) ) ( AVAILABLE ?auto_9228 ) ( TRUCK-AT ?auto_9236 ?auto_9233 ) ( not ( = ?auto_9233 ?auto_9231 ) ) ( not ( = ?auto_9232 ?auto_9233 ) ) ( not ( = ?auto_9234 ?auto_9233 ) ) ( HOIST-AT ?auto_9239 ?auto_9233 ) ( not ( = ?auto_9228 ?auto_9239 ) ) ( not ( = ?auto_9241 ?auto_9239 ) ) ( not ( = ?auto_9240 ?auto_9239 ) ) ( AVAILABLE ?auto_9239 ) ( SURFACE-AT ?auto_9227 ?auto_9233 ) ( ON ?auto_9227 ?auto_9242 ) ( CLEAR ?auto_9227 ) ( not ( = ?auto_9225 ?auto_9242 ) ) ( not ( = ?auto_9226 ?auto_9242 ) ) ( not ( = ?auto_9238 ?auto_9242 ) ) ( not ( = ?auto_9237 ?auto_9242 ) ) ( not ( = ?auto_9235 ?auto_9242 ) ) ( not ( = ?auto_9227 ?auto_9242 ) ) ( not ( = ?auto_9230 ?auto_9242 ) ) ( not ( = ?auto_9229 ?auto_9242 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9239 ?auto_9227 ?auto_9242 ?auto_9233 )
      ( MAKE-ON ?auto_9225 ?auto_9226 )
      ( MAKE-ON-VERIFY ?auto_9225 ?auto_9226 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9243 - SURFACE
      ?auto_9244 - SURFACE
    )
    :vars
    (
      ?auto_9258 - HOIST
      ?auto_9249 - PLACE
      ?auto_9257 - PLACE
      ?auto_9250 - HOIST
      ?auto_9259 - SURFACE
      ?auto_9246 - SURFACE
      ?auto_9255 - PLACE
      ?auto_9253 - HOIST
      ?auto_9248 - SURFACE
      ?auto_9256 - SURFACE
      ?auto_9254 - SURFACE
      ?auto_9245 - SURFACE
      ?auto_9251 - PLACE
      ?auto_9260 - HOIST
      ?auto_9252 - SURFACE
      ?auto_9247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9258 ?auto_9249 ) ( IS-CRATE ?auto_9243 ) ( not ( = ?auto_9243 ?auto_9244 ) ) ( not ( = ?auto_9257 ?auto_9249 ) ) ( HOIST-AT ?auto_9250 ?auto_9257 ) ( not ( = ?auto_9258 ?auto_9250 ) ) ( SURFACE-AT ?auto_9243 ?auto_9257 ) ( ON ?auto_9243 ?auto_9259 ) ( CLEAR ?auto_9243 ) ( not ( = ?auto_9243 ?auto_9259 ) ) ( not ( = ?auto_9244 ?auto_9259 ) ) ( IS-CRATE ?auto_9244 ) ( not ( = ?auto_9243 ?auto_9246 ) ) ( not ( = ?auto_9244 ?auto_9246 ) ) ( not ( = ?auto_9259 ?auto_9246 ) ) ( not ( = ?auto_9255 ?auto_9249 ) ) ( not ( = ?auto_9257 ?auto_9255 ) ) ( HOIST-AT ?auto_9253 ?auto_9255 ) ( not ( = ?auto_9258 ?auto_9253 ) ) ( not ( = ?auto_9250 ?auto_9253 ) ) ( AVAILABLE ?auto_9253 ) ( SURFACE-AT ?auto_9244 ?auto_9255 ) ( ON ?auto_9244 ?auto_9248 ) ( CLEAR ?auto_9244 ) ( not ( = ?auto_9243 ?auto_9248 ) ) ( not ( = ?auto_9244 ?auto_9248 ) ) ( not ( = ?auto_9259 ?auto_9248 ) ) ( not ( = ?auto_9246 ?auto_9248 ) ) ( IS-CRATE ?auto_9246 ) ( not ( = ?auto_9243 ?auto_9256 ) ) ( not ( = ?auto_9244 ?auto_9256 ) ) ( not ( = ?auto_9259 ?auto_9256 ) ) ( not ( = ?auto_9246 ?auto_9256 ) ) ( not ( = ?auto_9248 ?auto_9256 ) ) ( AVAILABLE ?auto_9250 ) ( SURFACE-AT ?auto_9246 ?auto_9257 ) ( ON ?auto_9246 ?auto_9254 ) ( CLEAR ?auto_9246 ) ( not ( = ?auto_9243 ?auto_9254 ) ) ( not ( = ?auto_9244 ?auto_9254 ) ) ( not ( = ?auto_9259 ?auto_9254 ) ) ( not ( = ?auto_9246 ?auto_9254 ) ) ( not ( = ?auto_9248 ?auto_9254 ) ) ( not ( = ?auto_9256 ?auto_9254 ) ) ( SURFACE-AT ?auto_9245 ?auto_9249 ) ( CLEAR ?auto_9245 ) ( IS-CRATE ?auto_9256 ) ( not ( = ?auto_9243 ?auto_9245 ) ) ( not ( = ?auto_9244 ?auto_9245 ) ) ( not ( = ?auto_9259 ?auto_9245 ) ) ( not ( = ?auto_9246 ?auto_9245 ) ) ( not ( = ?auto_9248 ?auto_9245 ) ) ( not ( = ?auto_9256 ?auto_9245 ) ) ( not ( = ?auto_9254 ?auto_9245 ) ) ( AVAILABLE ?auto_9258 ) ( not ( = ?auto_9251 ?auto_9249 ) ) ( not ( = ?auto_9257 ?auto_9251 ) ) ( not ( = ?auto_9255 ?auto_9251 ) ) ( HOIST-AT ?auto_9260 ?auto_9251 ) ( not ( = ?auto_9258 ?auto_9260 ) ) ( not ( = ?auto_9250 ?auto_9260 ) ) ( not ( = ?auto_9253 ?auto_9260 ) ) ( AVAILABLE ?auto_9260 ) ( SURFACE-AT ?auto_9256 ?auto_9251 ) ( ON ?auto_9256 ?auto_9252 ) ( CLEAR ?auto_9256 ) ( not ( = ?auto_9243 ?auto_9252 ) ) ( not ( = ?auto_9244 ?auto_9252 ) ) ( not ( = ?auto_9259 ?auto_9252 ) ) ( not ( = ?auto_9246 ?auto_9252 ) ) ( not ( = ?auto_9248 ?auto_9252 ) ) ( not ( = ?auto_9256 ?auto_9252 ) ) ( not ( = ?auto_9254 ?auto_9252 ) ) ( not ( = ?auto_9245 ?auto_9252 ) ) ( TRUCK-AT ?auto_9247 ?auto_9249 ) )
    :subtasks
    ( ( !DRIVE ?auto_9247 ?auto_9249 ?auto_9251 )
      ( MAKE-ON ?auto_9243 ?auto_9244 )
      ( MAKE-ON-VERIFY ?auto_9243 ?auto_9244 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9261 - SURFACE
      ?auto_9262 - SURFACE
    )
    :vars
    (
      ?auto_9278 - HOIST
      ?auto_9272 - PLACE
      ?auto_9271 - PLACE
      ?auto_9263 - HOIST
      ?auto_9273 - SURFACE
      ?auto_9267 - SURFACE
      ?auto_9269 - PLACE
      ?auto_9277 - HOIST
      ?auto_9265 - SURFACE
      ?auto_9275 - SURFACE
      ?auto_9268 - SURFACE
      ?auto_9266 - SURFACE
      ?auto_9276 - PLACE
      ?auto_9274 - HOIST
      ?auto_9270 - SURFACE
      ?auto_9264 - TRUCK
      ?auto_9279 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9278 ?auto_9272 ) ( IS-CRATE ?auto_9261 ) ( not ( = ?auto_9261 ?auto_9262 ) ) ( not ( = ?auto_9271 ?auto_9272 ) ) ( HOIST-AT ?auto_9263 ?auto_9271 ) ( not ( = ?auto_9278 ?auto_9263 ) ) ( SURFACE-AT ?auto_9261 ?auto_9271 ) ( ON ?auto_9261 ?auto_9273 ) ( CLEAR ?auto_9261 ) ( not ( = ?auto_9261 ?auto_9273 ) ) ( not ( = ?auto_9262 ?auto_9273 ) ) ( IS-CRATE ?auto_9262 ) ( not ( = ?auto_9261 ?auto_9267 ) ) ( not ( = ?auto_9262 ?auto_9267 ) ) ( not ( = ?auto_9273 ?auto_9267 ) ) ( not ( = ?auto_9269 ?auto_9272 ) ) ( not ( = ?auto_9271 ?auto_9269 ) ) ( HOIST-AT ?auto_9277 ?auto_9269 ) ( not ( = ?auto_9278 ?auto_9277 ) ) ( not ( = ?auto_9263 ?auto_9277 ) ) ( AVAILABLE ?auto_9277 ) ( SURFACE-AT ?auto_9262 ?auto_9269 ) ( ON ?auto_9262 ?auto_9265 ) ( CLEAR ?auto_9262 ) ( not ( = ?auto_9261 ?auto_9265 ) ) ( not ( = ?auto_9262 ?auto_9265 ) ) ( not ( = ?auto_9273 ?auto_9265 ) ) ( not ( = ?auto_9267 ?auto_9265 ) ) ( IS-CRATE ?auto_9267 ) ( not ( = ?auto_9261 ?auto_9275 ) ) ( not ( = ?auto_9262 ?auto_9275 ) ) ( not ( = ?auto_9273 ?auto_9275 ) ) ( not ( = ?auto_9267 ?auto_9275 ) ) ( not ( = ?auto_9265 ?auto_9275 ) ) ( AVAILABLE ?auto_9263 ) ( SURFACE-AT ?auto_9267 ?auto_9271 ) ( ON ?auto_9267 ?auto_9268 ) ( CLEAR ?auto_9267 ) ( not ( = ?auto_9261 ?auto_9268 ) ) ( not ( = ?auto_9262 ?auto_9268 ) ) ( not ( = ?auto_9273 ?auto_9268 ) ) ( not ( = ?auto_9267 ?auto_9268 ) ) ( not ( = ?auto_9265 ?auto_9268 ) ) ( not ( = ?auto_9275 ?auto_9268 ) ) ( IS-CRATE ?auto_9275 ) ( not ( = ?auto_9261 ?auto_9266 ) ) ( not ( = ?auto_9262 ?auto_9266 ) ) ( not ( = ?auto_9273 ?auto_9266 ) ) ( not ( = ?auto_9267 ?auto_9266 ) ) ( not ( = ?auto_9265 ?auto_9266 ) ) ( not ( = ?auto_9275 ?auto_9266 ) ) ( not ( = ?auto_9268 ?auto_9266 ) ) ( not ( = ?auto_9276 ?auto_9272 ) ) ( not ( = ?auto_9271 ?auto_9276 ) ) ( not ( = ?auto_9269 ?auto_9276 ) ) ( HOIST-AT ?auto_9274 ?auto_9276 ) ( not ( = ?auto_9278 ?auto_9274 ) ) ( not ( = ?auto_9263 ?auto_9274 ) ) ( not ( = ?auto_9277 ?auto_9274 ) ) ( AVAILABLE ?auto_9274 ) ( SURFACE-AT ?auto_9275 ?auto_9276 ) ( ON ?auto_9275 ?auto_9270 ) ( CLEAR ?auto_9275 ) ( not ( = ?auto_9261 ?auto_9270 ) ) ( not ( = ?auto_9262 ?auto_9270 ) ) ( not ( = ?auto_9273 ?auto_9270 ) ) ( not ( = ?auto_9267 ?auto_9270 ) ) ( not ( = ?auto_9265 ?auto_9270 ) ) ( not ( = ?auto_9275 ?auto_9270 ) ) ( not ( = ?auto_9268 ?auto_9270 ) ) ( not ( = ?auto_9266 ?auto_9270 ) ) ( TRUCK-AT ?auto_9264 ?auto_9272 ) ( SURFACE-AT ?auto_9279 ?auto_9272 ) ( CLEAR ?auto_9279 ) ( LIFTING ?auto_9278 ?auto_9266 ) ( IS-CRATE ?auto_9266 ) ( not ( = ?auto_9261 ?auto_9279 ) ) ( not ( = ?auto_9262 ?auto_9279 ) ) ( not ( = ?auto_9273 ?auto_9279 ) ) ( not ( = ?auto_9267 ?auto_9279 ) ) ( not ( = ?auto_9265 ?auto_9279 ) ) ( not ( = ?auto_9275 ?auto_9279 ) ) ( not ( = ?auto_9268 ?auto_9279 ) ) ( not ( = ?auto_9266 ?auto_9279 ) ) ( not ( = ?auto_9270 ?auto_9279 ) ) )
    :subtasks
    ( ( !DROP ?auto_9278 ?auto_9266 ?auto_9279 ?auto_9272 )
      ( MAKE-ON ?auto_9261 ?auto_9262 )
      ( MAKE-ON-VERIFY ?auto_9261 ?auto_9262 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9280 - SURFACE
      ?auto_9281 - SURFACE
    )
    :vars
    (
      ?auto_9291 - HOIST
      ?auto_9294 - PLACE
      ?auto_9297 - PLACE
      ?auto_9298 - HOIST
      ?auto_9287 - SURFACE
      ?auto_9282 - SURFACE
      ?auto_9292 - PLACE
      ?auto_9295 - HOIST
      ?auto_9284 - SURFACE
      ?auto_9293 - SURFACE
      ?auto_9286 - SURFACE
      ?auto_9283 - SURFACE
      ?auto_9288 - PLACE
      ?auto_9290 - HOIST
      ?auto_9289 - SURFACE
      ?auto_9285 - TRUCK
      ?auto_9296 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9291 ?auto_9294 ) ( IS-CRATE ?auto_9280 ) ( not ( = ?auto_9280 ?auto_9281 ) ) ( not ( = ?auto_9297 ?auto_9294 ) ) ( HOIST-AT ?auto_9298 ?auto_9297 ) ( not ( = ?auto_9291 ?auto_9298 ) ) ( SURFACE-AT ?auto_9280 ?auto_9297 ) ( ON ?auto_9280 ?auto_9287 ) ( CLEAR ?auto_9280 ) ( not ( = ?auto_9280 ?auto_9287 ) ) ( not ( = ?auto_9281 ?auto_9287 ) ) ( IS-CRATE ?auto_9281 ) ( not ( = ?auto_9280 ?auto_9282 ) ) ( not ( = ?auto_9281 ?auto_9282 ) ) ( not ( = ?auto_9287 ?auto_9282 ) ) ( not ( = ?auto_9292 ?auto_9294 ) ) ( not ( = ?auto_9297 ?auto_9292 ) ) ( HOIST-AT ?auto_9295 ?auto_9292 ) ( not ( = ?auto_9291 ?auto_9295 ) ) ( not ( = ?auto_9298 ?auto_9295 ) ) ( AVAILABLE ?auto_9295 ) ( SURFACE-AT ?auto_9281 ?auto_9292 ) ( ON ?auto_9281 ?auto_9284 ) ( CLEAR ?auto_9281 ) ( not ( = ?auto_9280 ?auto_9284 ) ) ( not ( = ?auto_9281 ?auto_9284 ) ) ( not ( = ?auto_9287 ?auto_9284 ) ) ( not ( = ?auto_9282 ?auto_9284 ) ) ( IS-CRATE ?auto_9282 ) ( not ( = ?auto_9280 ?auto_9293 ) ) ( not ( = ?auto_9281 ?auto_9293 ) ) ( not ( = ?auto_9287 ?auto_9293 ) ) ( not ( = ?auto_9282 ?auto_9293 ) ) ( not ( = ?auto_9284 ?auto_9293 ) ) ( AVAILABLE ?auto_9298 ) ( SURFACE-AT ?auto_9282 ?auto_9297 ) ( ON ?auto_9282 ?auto_9286 ) ( CLEAR ?auto_9282 ) ( not ( = ?auto_9280 ?auto_9286 ) ) ( not ( = ?auto_9281 ?auto_9286 ) ) ( not ( = ?auto_9287 ?auto_9286 ) ) ( not ( = ?auto_9282 ?auto_9286 ) ) ( not ( = ?auto_9284 ?auto_9286 ) ) ( not ( = ?auto_9293 ?auto_9286 ) ) ( IS-CRATE ?auto_9293 ) ( not ( = ?auto_9280 ?auto_9283 ) ) ( not ( = ?auto_9281 ?auto_9283 ) ) ( not ( = ?auto_9287 ?auto_9283 ) ) ( not ( = ?auto_9282 ?auto_9283 ) ) ( not ( = ?auto_9284 ?auto_9283 ) ) ( not ( = ?auto_9293 ?auto_9283 ) ) ( not ( = ?auto_9286 ?auto_9283 ) ) ( not ( = ?auto_9288 ?auto_9294 ) ) ( not ( = ?auto_9297 ?auto_9288 ) ) ( not ( = ?auto_9292 ?auto_9288 ) ) ( HOIST-AT ?auto_9290 ?auto_9288 ) ( not ( = ?auto_9291 ?auto_9290 ) ) ( not ( = ?auto_9298 ?auto_9290 ) ) ( not ( = ?auto_9295 ?auto_9290 ) ) ( AVAILABLE ?auto_9290 ) ( SURFACE-AT ?auto_9293 ?auto_9288 ) ( ON ?auto_9293 ?auto_9289 ) ( CLEAR ?auto_9293 ) ( not ( = ?auto_9280 ?auto_9289 ) ) ( not ( = ?auto_9281 ?auto_9289 ) ) ( not ( = ?auto_9287 ?auto_9289 ) ) ( not ( = ?auto_9282 ?auto_9289 ) ) ( not ( = ?auto_9284 ?auto_9289 ) ) ( not ( = ?auto_9293 ?auto_9289 ) ) ( not ( = ?auto_9286 ?auto_9289 ) ) ( not ( = ?auto_9283 ?auto_9289 ) ) ( TRUCK-AT ?auto_9285 ?auto_9294 ) ( SURFACE-AT ?auto_9296 ?auto_9294 ) ( CLEAR ?auto_9296 ) ( IS-CRATE ?auto_9283 ) ( not ( = ?auto_9280 ?auto_9296 ) ) ( not ( = ?auto_9281 ?auto_9296 ) ) ( not ( = ?auto_9287 ?auto_9296 ) ) ( not ( = ?auto_9282 ?auto_9296 ) ) ( not ( = ?auto_9284 ?auto_9296 ) ) ( not ( = ?auto_9293 ?auto_9296 ) ) ( not ( = ?auto_9286 ?auto_9296 ) ) ( not ( = ?auto_9283 ?auto_9296 ) ) ( not ( = ?auto_9289 ?auto_9296 ) ) ( AVAILABLE ?auto_9291 ) ( IN ?auto_9283 ?auto_9285 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9291 ?auto_9283 ?auto_9285 ?auto_9294 )
      ( MAKE-ON ?auto_9280 ?auto_9281 )
      ( MAKE-ON-VERIFY ?auto_9280 ?auto_9281 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9299 - SURFACE
      ?auto_9300 - SURFACE
    )
    :vars
    (
      ?auto_9304 - HOIST
      ?auto_9309 - PLACE
      ?auto_9302 - PLACE
      ?auto_9305 - HOIST
      ?auto_9301 - SURFACE
      ?auto_9312 - SURFACE
      ?auto_9307 - PLACE
      ?auto_9314 - HOIST
      ?auto_9306 - SURFACE
      ?auto_9317 - SURFACE
      ?auto_9316 - SURFACE
      ?auto_9315 - SURFACE
      ?auto_9308 - PLACE
      ?auto_9310 - HOIST
      ?auto_9311 - SURFACE
      ?auto_9313 - SURFACE
      ?auto_9303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9304 ?auto_9309 ) ( IS-CRATE ?auto_9299 ) ( not ( = ?auto_9299 ?auto_9300 ) ) ( not ( = ?auto_9302 ?auto_9309 ) ) ( HOIST-AT ?auto_9305 ?auto_9302 ) ( not ( = ?auto_9304 ?auto_9305 ) ) ( SURFACE-AT ?auto_9299 ?auto_9302 ) ( ON ?auto_9299 ?auto_9301 ) ( CLEAR ?auto_9299 ) ( not ( = ?auto_9299 ?auto_9301 ) ) ( not ( = ?auto_9300 ?auto_9301 ) ) ( IS-CRATE ?auto_9300 ) ( not ( = ?auto_9299 ?auto_9312 ) ) ( not ( = ?auto_9300 ?auto_9312 ) ) ( not ( = ?auto_9301 ?auto_9312 ) ) ( not ( = ?auto_9307 ?auto_9309 ) ) ( not ( = ?auto_9302 ?auto_9307 ) ) ( HOIST-AT ?auto_9314 ?auto_9307 ) ( not ( = ?auto_9304 ?auto_9314 ) ) ( not ( = ?auto_9305 ?auto_9314 ) ) ( AVAILABLE ?auto_9314 ) ( SURFACE-AT ?auto_9300 ?auto_9307 ) ( ON ?auto_9300 ?auto_9306 ) ( CLEAR ?auto_9300 ) ( not ( = ?auto_9299 ?auto_9306 ) ) ( not ( = ?auto_9300 ?auto_9306 ) ) ( not ( = ?auto_9301 ?auto_9306 ) ) ( not ( = ?auto_9312 ?auto_9306 ) ) ( IS-CRATE ?auto_9312 ) ( not ( = ?auto_9299 ?auto_9317 ) ) ( not ( = ?auto_9300 ?auto_9317 ) ) ( not ( = ?auto_9301 ?auto_9317 ) ) ( not ( = ?auto_9312 ?auto_9317 ) ) ( not ( = ?auto_9306 ?auto_9317 ) ) ( AVAILABLE ?auto_9305 ) ( SURFACE-AT ?auto_9312 ?auto_9302 ) ( ON ?auto_9312 ?auto_9316 ) ( CLEAR ?auto_9312 ) ( not ( = ?auto_9299 ?auto_9316 ) ) ( not ( = ?auto_9300 ?auto_9316 ) ) ( not ( = ?auto_9301 ?auto_9316 ) ) ( not ( = ?auto_9312 ?auto_9316 ) ) ( not ( = ?auto_9306 ?auto_9316 ) ) ( not ( = ?auto_9317 ?auto_9316 ) ) ( IS-CRATE ?auto_9317 ) ( not ( = ?auto_9299 ?auto_9315 ) ) ( not ( = ?auto_9300 ?auto_9315 ) ) ( not ( = ?auto_9301 ?auto_9315 ) ) ( not ( = ?auto_9312 ?auto_9315 ) ) ( not ( = ?auto_9306 ?auto_9315 ) ) ( not ( = ?auto_9317 ?auto_9315 ) ) ( not ( = ?auto_9316 ?auto_9315 ) ) ( not ( = ?auto_9308 ?auto_9309 ) ) ( not ( = ?auto_9302 ?auto_9308 ) ) ( not ( = ?auto_9307 ?auto_9308 ) ) ( HOIST-AT ?auto_9310 ?auto_9308 ) ( not ( = ?auto_9304 ?auto_9310 ) ) ( not ( = ?auto_9305 ?auto_9310 ) ) ( not ( = ?auto_9314 ?auto_9310 ) ) ( AVAILABLE ?auto_9310 ) ( SURFACE-AT ?auto_9317 ?auto_9308 ) ( ON ?auto_9317 ?auto_9311 ) ( CLEAR ?auto_9317 ) ( not ( = ?auto_9299 ?auto_9311 ) ) ( not ( = ?auto_9300 ?auto_9311 ) ) ( not ( = ?auto_9301 ?auto_9311 ) ) ( not ( = ?auto_9312 ?auto_9311 ) ) ( not ( = ?auto_9306 ?auto_9311 ) ) ( not ( = ?auto_9317 ?auto_9311 ) ) ( not ( = ?auto_9316 ?auto_9311 ) ) ( not ( = ?auto_9315 ?auto_9311 ) ) ( SURFACE-AT ?auto_9313 ?auto_9309 ) ( CLEAR ?auto_9313 ) ( IS-CRATE ?auto_9315 ) ( not ( = ?auto_9299 ?auto_9313 ) ) ( not ( = ?auto_9300 ?auto_9313 ) ) ( not ( = ?auto_9301 ?auto_9313 ) ) ( not ( = ?auto_9312 ?auto_9313 ) ) ( not ( = ?auto_9306 ?auto_9313 ) ) ( not ( = ?auto_9317 ?auto_9313 ) ) ( not ( = ?auto_9316 ?auto_9313 ) ) ( not ( = ?auto_9315 ?auto_9313 ) ) ( not ( = ?auto_9311 ?auto_9313 ) ) ( AVAILABLE ?auto_9304 ) ( IN ?auto_9315 ?auto_9303 ) ( TRUCK-AT ?auto_9303 ?auto_9307 ) )
    :subtasks
    ( ( !DRIVE ?auto_9303 ?auto_9307 ?auto_9309 )
      ( MAKE-ON ?auto_9299 ?auto_9300 )
      ( MAKE-ON-VERIFY ?auto_9299 ?auto_9300 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9318 - SURFACE
      ?auto_9319 - SURFACE
    )
    :vars
    (
      ?auto_9334 - HOIST
      ?auto_9329 - PLACE
      ?auto_9322 - PLACE
      ?auto_9333 - HOIST
      ?auto_9320 - SURFACE
      ?auto_9327 - SURFACE
      ?auto_9328 - PLACE
      ?auto_9331 - HOIST
      ?auto_9335 - SURFACE
      ?auto_9325 - SURFACE
      ?auto_9323 - SURFACE
      ?auto_9321 - SURFACE
      ?auto_9332 - PLACE
      ?auto_9326 - HOIST
      ?auto_9336 - SURFACE
      ?auto_9324 - SURFACE
      ?auto_9330 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9334 ?auto_9329 ) ( IS-CRATE ?auto_9318 ) ( not ( = ?auto_9318 ?auto_9319 ) ) ( not ( = ?auto_9322 ?auto_9329 ) ) ( HOIST-AT ?auto_9333 ?auto_9322 ) ( not ( = ?auto_9334 ?auto_9333 ) ) ( SURFACE-AT ?auto_9318 ?auto_9322 ) ( ON ?auto_9318 ?auto_9320 ) ( CLEAR ?auto_9318 ) ( not ( = ?auto_9318 ?auto_9320 ) ) ( not ( = ?auto_9319 ?auto_9320 ) ) ( IS-CRATE ?auto_9319 ) ( not ( = ?auto_9318 ?auto_9327 ) ) ( not ( = ?auto_9319 ?auto_9327 ) ) ( not ( = ?auto_9320 ?auto_9327 ) ) ( not ( = ?auto_9328 ?auto_9329 ) ) ( not ( = ?auto_9322 ?auto_9328 ) ) ( HOIST-AT ?auto_9331 ?auto_9328 ) ( not ( = ?auto_9334 ?auto_9331 ) ) ( not ( = ?auto_9333 ?auto_9331 ) ) ( SURFACE-AT ?auto_9319 ?auto_9328 ) ( ON ?auto_9319 ?auto_9335 ) ( CLEAR ?auto_9319 ) ( not ( = ?auto_9318 ?auto_9335 ) ) ( not ( = ?auto_9319 ?auto_9335 ) ) ( not ( = ?auto_9320 ?auto_9335 ) ) ( not ( = ?auto_9327 ?auto_9335 ) ) ( IS-CRATE ?auto_9327 ) ( not ( = ?auto_9318 ?auto_9325 ) ) ( not ( = ?auto_9319 ?auto_9325 ) ) ( not ( = ?auto_9320 ?auto_9325 ) ) ( not ( = ?auto_9327 ?auto_9325 ) ) ( not ( = ?auto_9335 ?auto_9325 ) ) ( AVAILABLE ?auto_9333 ) ( SURFACE-AT ?auto_9327 ?auto_9322 ) ( ON ?auto_9327 ?auto_9323 ) ( CLEAR ?auto_9327 ) ( not ( = ?auto_9318 ?auto_9323 ) ) ( not ( = ?auto_9319 ?auto_9323 ) ) ( not ( = ?auto_9320 ?auto_9323 ) ) ( not ( = ?auto_9327 ?auto_9323 ) ) ( not ( = ?auto_9335 ?auto_9323 ) ) ( not ( = ?auto_9325 ?auto_9323 ) ) ( IS-CRATE ?auto_9325 ) ( not ( = ?auto_9318 ?auto_9321 ) ) ( not ( = ?auto_9319 ?auto_9321 ) ) ( not ( = ?auto_9320 ?auto_9321 ) ) ( not ( = ?auto_9327 ?auto_9321 ) ) ( not ( = ?auto_9335 ?auto_9321 ) ) ( not ( = ?auto_9325 ?auto_9321 ) ) ( not ( = ?auto_9323 ?auto_9321 ) ) ( not ( = ?auto_9332 ?auto_9329 ) ) ( not ( = ?auto_9322 ?auto_9332 ) ) ( not ( = ?auto_9328 ?auto_9332 ) ) ( HOIST-AT ?auto_9326 ?auto_9332 ) ( not ( = ?auto_9334 ?auto_9326 ) ) ( not ( = ?auto_9333 ?auto_9326 ) ) ( not ( = ?auto_9331 ?auto_9326 ) ) ( AVAILABLE ?auto_9326 ) ( SURFACE-AT ?auto_9325 ?auto_9332 ) ( ON ?auto_9325 ?auto_9336 ) ( CLEAR ?auto_9325 ) ( not ( = ?auto_9318 ?auto_9336 ) ) ( not ( = ?auto_9319 ?auto_9336 ) ) ( not ( = ?auto_9320 ?auto_9336 ) ) ( not ( = ?auto_9327 ?auto_9336 ) ) ( not ( = ?auto_9335 ?auto_9336 ) ) ( not ( = ?auto_9325 ?auto_9336 ) ) ( not ( = ?auto_9323 ?auto_9336 ) ) ( not ( = ?auto_9321 ?auto_9336 ) ) ( SURFACE-AT ?auto_9324 ?auto_9329 ) ( CLEAR ?auto_9324 ) ( IS-CRATE ?auto_9321 ) ( not ( = ?auto_9318 ?auto_9324 ) ) ( not ( = ?auto_9319 ?auto_9324 ) ) ( not ( = ?auto_9320 ?auto_9324 ) ) ( not ( = ?auto_9327 ?auto_9324 ) ) ( not ( = ?auto_9335 ?auto_9324 ) ) ( not ( = ?auto_9325 ?auto_9324 ) ) ( not ( = ?auto_9323 ?auto_9324 ) ) ( not ( = ?auto_9321 ?auto_9324 ) ) ( not ( = ?auto_9336 ?auto_9324 ) ) ( AVAILABLE ?auto_9334 ) ( TRUCK-AT ?auto_9330 ?auto_9328 ) ( LIFTING ?auto_9331 ?auto_9321 ) )
    :subtasks
    ( ( !LOAD ?auto_9331 ?auto_9321 ?auto_9330 ?auto_9328 )
      ( MAKE-ON ?auto_9318 ?auto_9319 )
      ( MAKE-ON-VERIFY ?auto_9318 ?auto_9319 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9337 - SURFACE
      ?auto_9338 - SURFACE
    )
    :vars
    (
      ?auto_9353 - HOIST
      ?auto_9344 - PLACE
      ?auto_9345 - PLACE
      ?auto_9355 - HOIST
      ?auto_9346 - SURFACE
      ?auto_9354 - SURFACE
      ?auto_9350 - PLACE
      ?auto_9339 - HOIST
      ?auto_9352 - SURFACE
      ?auto_9341 - SURFACE
      ?auto_9342 - SURFACE
      ?auto_9340 - SURFACE
      ?auto_9343 - PLACE
      ?auto_9349 - HOIST
      ?auto_9351 - SURFACE
      ?auto_9348 - SURFACE
      ?auto_9347 - TRUCK
      ?auto_9356 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9353 ?auto_9344 ) ( IS-CRATE ?auto_9337 ) ( not ( = ?auto_9337 ?auto_9338 ) ) ( not ( = ?auto_9345 ?auto_9344 ) ) ( HOIST-AT ?auto_9355 ?auto_9345 ) ( not ( = ?auto_9353 ?auto_9355 ) ) ( SURFACE-AT ?auto_9337 ?auto_9345 ) ( ON ?auto_9337 ?auto_9346 ) ( CLEAR ?auto_9337 ) ( not ( = ?auto_9337 ?auto_9346 ) ) ( not ( = ?auto_9338 ?auto_9346 ) ) ( IS-CRATE ?auto_9338 ) ( not ( = ?auto_9337 ?auto_9354 ) ) ( not ( = ?auto_9338 ?auto_9354 ) ) ( not ( = ?auto_9346 ?auto_9354 ) ) ( not ( = ?auto_9350 ?auto_9344 ) ) ( not ( = ?auto_9345 ?auto_9350 ) ) ( HOIST-AT ?auto_9339 ?auto_9350 ) ( not ( = ?auto_9353 ?auto_9339 ) ) ( not ( = ?auto_9355 ?auto_9339 ) ) ( SURFACE-AT ?auto_9338 ?auto_9350 ) ( ON ?auto_9338 ?auto_9352 ) ( CLEAR ?auto_9338 ) ( not ( = ?auto_9337 ?auto_9352 ) ) ( not ( = ?auto_9338 ?auto_9352 ) ) ( not ( = ?auto_9346 ?auto_9352 ) ) ( not ( = ?auto_9354 ?auto_9352 ) ) ( IS-CRATE ?auto_9354 ) ( not ( = ?auto_9337 ?auto_9341 ) ) ( not ( = ?auto_9338 ?auto_9341 ) ) ( not ( = ?auto_9346 ?auto_9341 ) ) ( not ( = ?auto_9354 ?auto_9341 ) ) ( not ( = ?auto_9352 ?auto_9341 ) ) ( AVAILABLE ?auto_9355 ) ( SURFACE-AT ?auto_9354 ?auto_9345 ) ( ON ?auto_9354 ?auto_9342 ) ( CLEAR ?auto_9354 ) ( not ( = ?auto_9337 ?auto_9342 ) ) ( not ( = ?auto_9338 ?auto_9342 ) ) ( not ( = ?auto_9346 ?auto_9342 ) ) ( not ( = ?auto_9354 ?auto_9342 ) ) ( not ( = ?auto_9352 ?auto_9342 ) ) ( not ( = ?auto_9341 ?auto_9342 ) ) ( IS-CRATE ?auto_9341 ) ( not ( = ?auto_9337 ?auto_9340 ) ) ( not ( = ?auto_9338 ?auto_9340 ) ) ( not ( = ?auto_9346 ?auto_9340 ) ) ( not ( = ?auto_9354 ?auto_9340 ) ) ( not ( = ?auto_9352 ?auto_9340 ) ) ( not ( = ?auto_9341 ?auto_9340 ) ) ( not ( = ?auto_9342 ?auto_9340 ) ) ( not ( = ?auto_9343 ?auto_9344 ) ) ( not ( = ?auto_9345 ?auto_9343 ) ) ( not ( = ?auto_9350 ?auto_9343 ) ) ( HOIST-AT ?auto_9349 ?auto_9343 ) ( not ( = ?auto_9353 ?auto_9349 ) ) ( not ( = ?auto_9355 ?auto_9349 ) ) ( not ( = ?auto_9339 ?auto_9349 ) ) ( AVAILABLE ?auto_9349 ) ( SURFACE-AT ?auto_9341 ?auto_9343 ) ( ON ?auto_9341 ?auto_9351 ) ( CLEAR ?auto_9341 ) ( not ( = ?auto_9337 ?auto_9351 ) ) ( not ( = ?auto_9338 ?auto_9351 ) ) ( not ( = ?auto_9346 ?auto_9351 ) ) ( not ( = ?auto_9354 ?auto_9351 ) ) ( not ( = ?auto_9352 ?auto_9351 ) ) ( not ( = ?auto_9341 ?auto_9351 ) ) ( not ( = ?auto_9342 ?auto_9351 ) ) ( not ( = ?auto_9340 ?auto_9351 ) ) ( SURFACE-AT ?auto_9348 ?auto_9344 ) ( CLEAR ?auto_9348 ) ( IS-CRATE ?auto_9340 ) ( not ( = ?auto_9337 ?auto_9348 ) ) ( not ( = ?auto_9338 ?auto_9348 ) ) ( not ( = ?auto_9346 ?auto_9348 ) ) ( not ( = ?auto_9354 ?auto_9348 ) ) ( not ( = ?auto_9352 ?auto_9348 ) ) ( not ( = ?auto_9341 ?auto_9348 ) ) ( not ( = ?auto_9342 ?auto_9348 ) ) ( not ( = ?auto_9340 ?auto_9348 ) ) ( not ( = ?auto_9351 ?auto_9348 ) ) ( AVAILABLE ?auto_9353 ) ( TRUCK-AT ?auto_9347 ?auto_9350 ) ( AVAILABLE ?auto_9339 ) ( SURFACE-AT ?auto_9340 ?auto_9350 ) ( ON ?auto_9340 ?auto_9356 ) ( CLEAR ?auto_9340 ) ( not ( = ?auto_9337 ?auto_9356 ) ) ( not ( = ?auto_9338 ?auto_9356 ) ) ( not ( = ?auto_9346 ?auto_9356 ) ) ( not ( = ?auto_9354 ?auto_9356 ) ) ( not ( = ?auto_9352 ?auto_9356 ) ) ( not ( = ?auto_9341 ?auto_9356 ) ) ( not ( = ?auto_9342 ?auto_9356 ) ) ( not ( = ?auto_9340 ?auto_9356 ) ) ( not ( = ?auto_9351 ?auto_9356 ) ) ( not ( = ?auto_9348 ?auto_9356 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9339 ?auto_9340 ?auto_9356 ?auto_9350 )
      ( MAKE-ON ?auto_9337 ?auto_9338 )
      ( MAKE-ON-VERIFY ?auto_9337 ?auto_9338 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_9357 - SURFACE
      ?auto_9358 - SURFACE
    )
    :vars
    (
      ?auto_9370 - HOIST
      ?auto_9359 - PLACE
      ?auto_9362 - PLACE
      ?auto_9364 - HOIST
      ?auto_9361 - SURFACE
      ?auto_9363 - SURFACE
      ?auto_9369 - PLACE
      ?auto_9376 - HOIST
      ?auto_9366 - SURFACE
      ?auto_9373 - SURFACE
      ?auto_9367 - SURFACE
      ?auto_9368 - SURFACE
      ?auto_9365 - PLACE
      ?auto_9360 - HOIST
      ?auto_9371 - SURFACE
      ?auto_9372 - SURFACE
      ?auto_9374 - SURFACE
      ?auto_9375 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9370 ?auto_9359 ) ( IS-CRATE ?auto_9357 ) ( not ( = ?auto_9357 ?auto_9358 ) ) ( not ( = ?auto_9362 ?auto_9359 ) ) ( HOIST-AT ?auto_9364 ?auto_9362 ) ( not ( = ?auto_9370 ?auto_9364 ) ) ( SURFACE-AT ?auto_9357 ?auto_9362 ) ( ON ?auto_9357 ?auto_9361 ) ( CLEAR ?auto_9357 ) ( not ( = ?auto_9357 ?auto_9361 ) ) ( not ( = ?auto_9358 ?auto_9361 ) ) ( IS-CRATE ?auto_9358 ) ( not ( = ?auto_9357 ?auto_9363 ) ) ( not ( = ?auto_9358 ?auto_9363 ) ) ( not ( = ?auto_9361 ?auto_9363 ) ) ( not ( = ?auto_9369 ?auto_9359 ) ) ( not ( = ?auto_9362 ?auto_9369 ) ) ( HOIST-AT ?auto_9376 ?auto_9369 ) ( not ( = ?auto_9370 ?auto_9376 ) ) ( not ( = ?auto_9364 ?auto_9376 ) ) ( SURFACE-AT ?auto_9358 ?auto_9369 ) ( ON ?auto_9358 ?auto_9366 ) ( CLEAR ?auto_9358 ) ( not ( = ?auto_9357 ?auto_9366 ) ) ( not ( = ?auto_9358 ?auto_9366 ) ) ( not ( = ?auto_9361 ?auto_9366 ) ) ( not ( = ?auto_9363 ?auto_9366 ) ) ( IS-CRATE ?auto_9363 ) ( not ( = ?auto_9357 ?auto_9373 ) ) ( not ( = ?auto_9358 ?auto_9373 ) ) ( not ( = ?auto_9361 ?auto_9373 ) ) ( not ( = ?auto_9363 ?auto_9373 ) ) ( not ( = ?auto_9366 ?auto_9373 ) ) ( AVAILABLE ?auto_9364 ) ( SURFACE-AT ?auto_9363 ?auto_9362 ) ( ON ?auto_9363 ?auto_9367 ) ( CLEAR ?auto_9363 ) ( not ( = ?auto_9357 ?auto_9367 ) ) ( not ( = ?auto_9358 ?auto_9367 ) ) ( not ( = ?auto_9361 ?auto_9367 ) ) ( not ( = ?auto_9363 ?auto_9367 ) ) ( not ( = ?auto_9366 ?auto_9367 ) ) ( not ( = ?auto_9373 ?auto_9367 ) ) ( IS-CRATE ?auto_9373 ) ( not ( = ?auto_9357 ?auto_9368 ) ) ( not ( = ?auto_9358 ?auto_9368 ) ) ( not ( = ?auto_9361 ?auto_9368 ) ) ( not ( = ?auto_9363 ?auto_9368 ) ) ( not ( = ?auto_9366 ?auto_9368 ) ) ( not ( = ?auto_9373 ?auto_9368 ) ) ( not ( = ?auto_9367 ?auto_9368 ) ) ( not ( = ?auto_9365 ?auto_9359 ) ) ( not ( = ?auto_9362 ?auto_9365 ) ) ( not ( = ?auto_9369 ?auto_9365 ) ) ( HOIST-AT ?auto_9360 ?auto_9365 ) ( not ( = ?auto_9370 ?auto_9360 ) ) ( not ( = ?auto_9364 ?auto_9360 ) ) ( not ( = ?auto_9376 ?auto_9360 ) ) ( AVAILABLE ?auto_9360 ) ( SURFACE-AT ?auto_9373 ?auto_9365 ) ( ON ?auto_9373 ?auto_9371 ) ( CLEAR ?auto_9373 ) ( not ( = ?auto_9357 ?auto_9371 ) ) ( not ( = ?auto_9358 ?auto_9371 ) ) ( not ( = ?auto_9361 ?auto_9371 ) ) ( not ( = ?auto_9363 ?auto_9371 ) ) ( not ( = ?auto_9366 ?auto_9371 ) ) ( not ( = ?auto_9373 ?auto_9371 ) ) ( not ( = ?auto_9367 ?auto_9371 ) ) ( not ( = ?auto_9368 ?auto_9371 ) ) ( SURFACE-AT ?auto_9372 ?auto_9359 ) ( CLEAR ?auto_9372 ) ( IS-CRATE ?auto_9368 ) ( not ( = ?auto_9357 ?auto_9372 ) ) ( not ( = ?auto_9358 ?auto_9372 ) ) ( not ( = ?auto_9361 ?auto_9372 ) ) ( not ( = ?auto_9363 ?auto_9372 ) ) ( not ( = ?auto_9366 ?auto_9372 ) ) ( not ( = ?auto_9373 ?auto_9372 ) ) ( not ( = ?auto_9367 ?auto_9372 ) ) ( not ( = ?auto_9368 ?auto_9372 ) ) ( not ( = ?auto_9371 ?auto_9372 ) ) ( AVAILABLE ?auto_9370 ) ( AVAILABLE ?auto_9376 ) ( SURFACE-AT ?auto_9368 ?auto_9369 ) ( ON ?auto_9368 ?auto_9374 ) ( CLEAR ?auto_9368 ) ( not ( = ?auto_9357 ?auto_9374 ) ) ( not ( = ?auto_9358 ?auto_9374 ) ) ( not ( = ?auto_9361 ?auto_9374 ) ) ( not ( = ?auto_9363 ?auto_9374 ) ) ( not ( = ?auto_9366 ?auto_9374 ) ) ( not ( = ?auto_9373 ?auto_9374 ) ) ( not ( = ?auto_9367 ?auto_9374 ) ) ( not ( = ?auto_9368 ?auto_9374 ) ) ( not ( = ?auto_9371 ?auto_9374 ) ) ( not ( = ?auto_9372 ?auto_9374 ) ) ( TRUCK-AT ?auto_9375 ?auto_9359 ) )
    :subtasks
    ( ( !DRIVE ?auto_9375 ?auto_9359 ?auto_9369 )
      ( MAKE-ON ?auto_9357 ?auto_9358 )
      ( MAKE-ON-VERIFY ?auto_9357 ?auto_9358 ) )
  )

)

