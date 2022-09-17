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
      ?auto_59393 - SURFACE
      ?auto_59394 - SURFACE
    )
    :vars
    (
      ?auto_59395 - HOIST
      ?auto_59396 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59395 ?auto_59396 ) ( SURFACE-AT ?auto_59394 ?auto_59396 ) ( CLEAR ?auto_59394 ) ( LIFTING ?auto_59395 ?auto_59393 ) ( IS-CRATE ?auto_59393 ) ( not ( = ?auto_59393 ?auto_59394 ) ) )
    :subtasks
    ( ( !DROP ?auto_59395 ?auto_59393 ?auto_59394 ?auto_59396 )
      ( MAKE-ON-VERIFY ?auto_59393 ?auto_59394 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59397 - SURFACE
      ?auto_59398 - SURFACE
    )
    :vars
    (
      ?auto_59400 - HOIST
      ?auto_59399 - PLACE
      ?auto_59401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_59400 ?auto_59399 ) ( SURFACE-AT ?auto_59398 ?auto_59399 ) ( CLEAR ?auto_59398 ) ( IS-CRATE ?auto_59397 ) ( not ( = ?auto_59397 ?auto_59398 ) ) ( TRUCK-AT ?auto_59401 ?auto_59399 ) ( AVAILABLE ?auto_59400 ) ( IN ?auto_59397 ?auto_59401 ) )
    :subtasks
    ( ( !UNLOAD ?auto_59400 ?auto_59397 ?auto_59401 ?auto_59399 )
      ( MAKE-ON ?auto_59397 ?auto_59398 )
      ( MAKE-ON-VERIFY ?auto_59397 ?auto_59398 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59402 - SURFACE
      ?auto_59403 - SURFACE
    )
    :vars
    (
      ?auto_59406 - HOIST
      ?auto_59404 - PLACE
      ?auto_59405 - TRUCK
      ?auto_59407 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59406 ?auto_59404 ) ( SURFACE-AT ?auto_59403 ?auto_59404 ) ( CLEAR ?auto_59403 ) ( IS-CRATE ?auto_59402 ) ( not ( = ?auto_59402 ?auto_59403 ) ) ( AVAILABLE ?auto_59406 ) ( IN ?auto_59402 ?auto_59405 ) ( TRUCK-AT ?auto_59405 ?auto_59407 ) ( not ( = ?auto_59407 ?auto_59404 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_59405 ?auto_59407 ?auto_59404 )
      ( MAKE-ON ?auto_59402 ?auto_59403 )
      ( MAKE-ON-VERIFY ?auto_59402 ?auto_59403 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59408 - SURFACE
      ?auto_59409 - SURFACE
    )
    :vars
    (
      ?auto_59410 - HOIST
      ?auto_59411 - PLACE
      ?auto_59412 - TRUCK
      ?auto_59413 - PLACE
      ?auto_59414 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_59410 ?auto_59411 ) ( SURFACE-AT ?auto_59409 ?auto_59411 ) ( CLEAR ?auto_59409 ) ( IS-CRATE ?auto_59408 ) ( not ( = ?auto_59408 ?auto_59409 ) ) ( AVAILABLE ?auto_59410 ) ( TRUCK-AT ?auto_59412 ?auto_59413 ) ( not ( = ?auto_59413 ?auto_59411 ) ) ( HOIST-AT ?auto_59414 ?auto_59413 ) ( LIFTING ?auto_59414 ?auto_59408 ) ( not ( = ?auto_59410 ?auto_59414 ) ) )
    :subtasks
    ( ( !LOAD ?auto_59414 ?auto_59408 ?auto_59412 ?auto_59413 )
      ( MAKE-ON ?auto_59408 ?auto_59409 )
      ( MAKE-ON-VERIFY ?auto_59408 ?auto_59409 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59415 - SURFACE
      ?auto_59416 - SURFACE
    )
    :vars
    (
      ?auto_59417 - HOIST
      ?auto_59421 - PLACE
      ?auto_59419 - TRUCK
      ?auto_59418 - PLACE
      ?auto_59420 - HOIST
      ?auto_59422 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59417 ?auto_59421 ) ( SURFACE-AT ?auto_59416 ?auto_59421 ) ( CLEAR ?auto_59416 ) ( IS-CRATE ?auto_59415 ) ( not ( = ?auto_59415 ?auto_59416 ) ) ( AVAILABLE ?auto_59417 ) ( TRUCK-AT ?auto_59419 ?auto_59418 ) ( not ( = ?auto_59418 ?auto_59421 ) ) ( HOIST-AT ?auto_59420 ?auto_59418 ) ( not ( = ?auto_59417 ?auto_59420 ) ) ( AVAILABLE ?auto_59420 ) ( SURFACE-AT ?auto_59415 ?auto_59418 ) ( ON ?auto_59415 ?auto_59422 ) ( CLEAR ?auto_59415 ) ( not ( = ?auto_59415 ?auto_59422 ) ) ( not ( = ?auto_59416 ?auto_59422 ) ) )
    :subtasks
    ( ( !LIFT ?auto_59420 ?auto_59415 ?auto_59422 ?auto_59418 )
      ( MAKE-ON ?auto_59415 ?auto_59416 )
      ( MAKE-ON-VERIFY ?auto_59415 ?auto_59416 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59423 - SURFACE
      ?auto_59424 - SURFACE
    )
    :vars
    (
      ?auto_59428 - HOIST
      ?auto_59429 - PLACE
      ?auto_59427 - PLACE
      ?auto_59425 - HOIST
      ?auto_59430 - SURFACE
      ?auto_59426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_59428 ?auto_59429 ) ( SURFACE-AT ?auto_59424 ?auto_59429 ) ( CLEAR ?auto_59424 ) ( IS-CRATE ?auto_59423 ) ( not ( = ?auto_59423 ?auto_59424 ) ) ( AVAILABLE ?auto_59428 ) ( not ( = ?auto_59427 ?auto_59429 ) ) ( HOIST-AT ?auto_59425 ?auto_59427 ) ( not ( = ?auto_59428 ?auto_59425 ) ) ( AVAILABLE ?auto_59425 ) ( SURFACE-AT ?auto_59423 ?auto_59427 ) ( ON ?auto_59423 ?auto_59430 ) ( CLEAR ?auto_59423 ) ( not ( = ?auto_59423 ?auto_59430 ) ) ( not ( = ?auto_59424 ?auto_59430 ) ) ( TRUCK-AT ?auto_59426 ?auto_59429 ) )
    :subtasks
    ( ( !DRIVE ?auto_59426 ?auto_59429 ?auto_59427 )
      ( MAKE-ON ?auto_59423 ?auto_59424 )
      ( MAKE-ON-VERIFY ?auto_59423 ?auto_59424 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59433 - SURFACE
      ?auto_59434 - SURFACE
    )
    :vars
    (
      ?auto_59435 - HOIST
      ?auto_59436 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59435 ?auto_59436 ) ( SURFACE-AT ?auto_59434 ?auto_59436 ) ( CLEAR ?auto_59434 ) ( LIFTING ?auto_59435 ?auto_59433 ) ( IS-CRATE ?auto_59433 ) ( not ( = ?auto_59433 ?auto_59434 ) ) )
    :subtasks
    ( ( !DROP ?auto_59435 ?auto_59433 ?auto_59434 ?auto_59436 )
      ( MAKE-ON-VERIFY ?auto_59433 ?auto_59434 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59437 - SURFACE
      ?auto_59438 - SURFACE
    )
    :vars
    (
      ?auto_59439 - HOIST
      ?auto_59440 - PLACE
      ?auto_59441 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_59439 ?auto_59440 ) ( SURFACE-AT ?auto_59438 ?auto_59440 ) ( CLEAR ?auto_59438 ) ( IS-CRATE ?auto_59437 ) ( not ( = ?auto_59437 ?auto_59438 ) ) ( TRUCK-AT ?auto_59441 ?auto_59440 ) ( AVAILABLE ?auto_59439 ) ( IN ?auto_59437 ?auto_59441 ) )
    :subtasks
    ( ( !UNLOAD ?auto_59439 ?auto_59437 ?auto_59441 ?auto_59440 )
      ( MAKE-ON ?auto_59437 ?auto_59438 )
      ( MAKE-ON-VERIFY ?auto_59437 ?auto_59438 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59442 - SURFACE
      ?auto_59443 - SURFACE
    )
    :vars
    (
      ?auto_59445 - HOIST
      ?auto_59446 - PLACE
      ?auto_59444 - TRUCK
      ?auto_59447 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59445 ?auto_59446 ) ( SURFACE-AT ?auto_59443 ?auto_59446 ) ( CLEAR ?auto_59443 ) ( IS-CRATE ?auto_59442 ) ( not ( = ?auto_59442 ?auto_59443 ) ) ( AVAILABLE ?auto_59445 ) ( IN ?auto_59442 ?auto_59444 ) ( TRUCK-AT ?auto_59444 ?auto_59447 ) ( not ( = ?auto_59447 ?auto_59446 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_59444 ?auto_59447 ?auto_59446 )
      ( MAKE-ON ?auto_59442 ?auto_59443 )
      ( MAKE-ON-VERIFY ?auto_59442 ?auto_59443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59448 - SURFACE
      ?auto_59449 - SURFACE
    )
    :vars
    (
      ?auto_59453 - HOIST
      ?auto_59451 - PLACE
      ?auto_59452 - TRUCK
      ?auto_59450 - PLACE
      ?auto_59454 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_59453 ?auto_59451 ) ( SURFACE-AT ?auto_59449 ?auto_59451 ) ( CLEAR ?auto_59449 ) ( IS-CRATE ?auto_59448 ) ( not ( = ?auto_59448 ?auto_59449 ) ) ( AVAILABLE ?auto_59453 ) ( TRUCK-AT ?auto_59452 ?auto_59450 ) ( not ( = ?auto_59450 ?auto_59451 ) ) ( HOIST-AT ?auto_59454 ?auto_59450 ) ( LIFTING ?auto_59454 ?auto_59448 ) ( not ( = ?auto_59453 ?auto_59454 ) ) )
    :subtasks
    ( ( !LOAD ?auto_59454 ?auto_59448 ?auto_59452 ?auto_59450 )
      ( MAKE-ON ?auto_59448 ?auto_59449 )
      ( MAKE-ON-VERIFY ?auto_59448 ?auto_59449 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59455 - SURFACE
      ?auto_59456 - SURFACE
    )
    :vars
    (
      ?auto_59459 - HOIST
      ?auto_59457 - PLACE
      ?auto_59461 - TRUCK
      ?auto_59458 - PLACE
      ?auto_59460 - HOIST
      ?auto_59462 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59459 ?auto_59457 ) ( SURFACE-AT ?auto_59456 ?auto_59457 ) ( CLEAR ?auto_59456 ) ( IS-CRATE ?auto_59455 ) ( not ( = ?auto_59455 ?auto_59456 ) ) ( AVAILABLE ?auto_59459 ) ( TRUCK-AT ?auto_59461 ?auto_59458 ) ( not ( = ?auto_59458 ?auto_59457 ) ) ( HOIST-AT ?auto_59460 ?auto_59458 ) ( not ( = ?auto_59459 ?auto_59460 ) ) ( AVAILABLE ?auto_59460 ) ( SURFACE-AT ?auto_59455 ?auto_59458 ) ( ON ?auto_59455 ?auto_59462 ) ( CLEAR ?auto_59455 ) ( not ( = ?auto_59455 ?auto_59462 ) ) ( not ( = ?auto_59456 ?auto_59462 ) ) )
    :subtasks
    ( ( !LIFT ?auto_59460 ?auto_59455 ?auto_59462 ?auto_59458 )
      ( MAKE-ON ?auto_59455 ?auto_59456 )
      ( MAKE-ON-VERIFY ?auto_59455 ?auto_59456 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59463 - SURFACE
      ?auto_59464 - SURFACE
    )
    :vars
    (
      ?auto_59470 - HOIST
      ?auto_59466 - PLACE
      ?auto_59469 - PLACE
      ?auto_59467 - HOIST
      ?auto_59465 - SURFACE
      ?auto_59468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_59470 ?auto_59466 ) ( SURFACE-AT ?auto_59464 ?auto_59466 ) ( CLEAR ?auto_59464 ) ( IS-CRATE ?auto_59463 ) ( not ( = ?auto_59463 ?auto_59464 ) ) ( AVAILABLE ?auto_59470 ) ( not ( = ?auto_59469 ?auto_59466 ) ) ( HOIST-AT ?auto_59467 ?auto_59469 ) ( not ( = ?auto_59470 ?auto_59467 ) ) ( AVAILABLE ?auto_59467 ) ( SURFACE-AT ?auto_59463 ?auto_59469 ) ( ON ?auto_59463 ?auto_59465 ) ( CLEAR ?auto_59463 ) ( not ( = ?auto_59463 ?auto_59465 ) ) ( not ( = ?auto_59464 ?auto_59465 ) ) ( TRUCK-AT ?auto_59468 ?auto_59466 ) )
    :subtasks
    ( ( !DRIVE ?auto_59468 ?auto_59466 ?auto_59469 )
      ( MAKE-ON ?auto_59463 ?auto_59464 )
      ( MAKE-ON-VERIFY ?auto_59463 ?auto_59464 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59471 - SURFACE
      ?auto_59472 - SURFACE
    )
    :vars
    (
      ?auto_59474 - HOIST
      ?auto_59478 - PLACE
      ?auto_59475 - PLACE
      ?auto_59473 - HOIST
      ?auto_59476 - SURFACE
      ?auto_59477 - TRUCK
      ?auto_59479 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59474 ?auto_59478 ) ( IS-CRATE ?auto_59471 ) ( not ( = ?auto_59471 ?auto_59472 ) ) ( not ( = ?auto_59475 ?auto_59478 ) ) ( HOIST-AT ?auto_59473 ?auto_59475 ) ( not ( = ?auto_59474 ?auto_59473 ) ) ( AVAILABLE ?auto_59473 ) ( SURFACE-AT ?auto_59471 ?auto_59475 ) ( ON ?auto_59471 ?auto_59476 ) ( CLEAR ?auto_59471 ) ( not ( = ?auto_59471 ?auto_59476 ) ) ( not ( = ?auto_59472 ?auto_59476 ) ) ( TRUCK-AT ?auto_59477 ?auto_59478 ) ( SURFACE-AT ?auto_59479 ?auto_59478 ) ( CLEAR ?auto_59479 ) ( LIFTING ?auto_59474 ?auto_59472 ) ( IS-CRATE ?auto_59472 ) ( not ( = ?auto_59471 ?auto_59479 ) ) ( not ( = ?auto_59472 ?auto_59479 ) ) ( not ( = ?auto_59476 ?auto_59479 ) ) )
    :subtasks
    ( ( !DROP ?auto_59474 ?auto_59472 ?auto_59479 ?auto_59478 )
      ( MAKE-ON ?auto_59471 ?auto_59472 )
      ( MAKE-ON-VERIFY ?auto_59471 ?auto_59472 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59480 - SURFACE
      ?auto_59481 - SURFACE
    )
    :vars
    (
      ?auto_59485 - HOIST
      ?auto_59482 - PLACE
      ?auto_59483 - PLACE
      ?auto_59488 - HOIST
      ?auto_59484 - SURFACE
      ?auto_59487 - TRUCK
      ?auto_59486 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59485 ?auto_59482 ) ( IS-CRATE ?auto_59480 ) ( not ( = ?auto_59480 ?auto_59481 ) ) ( not ( = ?auto_59483 ?auto_59482 ) ) ( HOIST-AT ?auto_59488 ?auto_59483 ) ( not ( = ?auto_59485 ?auto_59488 ) ) ( AVAILABLE ?auto_59488 ) ( SURFACE-AT ?auto_59480 ?auto_59483 ) ( ON ?auto_59480 ?auto_59484 ) ( CLEAR ?auto_59480 ) ( not ( = ?auto_59480 ?auto_59484 ) ) ( not ( = ?auto_59481 ?auto_59484 ) ) ( TRUCK-AT ?auto_59487 ?auto_59482 ) ( SURFACE-AT ?auto_59486 ?auto_59482 ) ( CLEAR ?auto_59486 ) ( IS-CRATE ?auto_59481 ) ( not ( = ?auto_59480 ?auto_59486 ) ) ( not ( = ?auto_59481 ?auto_59486 ) ) ( not ( = ?auto_59484 ?auto_59486 ) ) ( AVAILABLE ?auto_59485 ) ( IN ?auto_59481 ?auto_59487 ) )
    :subtasks
    ( ( !UNLOAD ?auto_59485 ?auto_59481 ?auto_59487 ?auto_59482 )
      ( MAKE-ON ?auto_59480 ?auto_59481 )
      ( MAKE-ON-VERIFY ?auto_59480 ?auto_59481 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59489 - SURFACE
      ?auto_59490 - SURFACE
    )
    :vars
    (
      ?auto_59495 - HOIST
      ?auto_59494 - PLACE
      ?auto_59497 - PLACE
      ?auto_59493 - HOIST
      ?auto_59496 - SURFACE
      ?auto_59491 - SURFACE
      ?auto_59492 - TRUCK
      ?auto_59498 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59495 ?auto_59494 ) ( IS-CRATE ?auto_59489 ) ( not ( = ?auto_59489 ?auto_59490 ) ) ( not ( = ?auto_59497 ?auto_59494 ) ) ( HOIST-AT ?auto_59493 ?auto_59497 ) ( not ( = ?auto_59495 ?auto_59493 ) ) ( AVAILABLE ?auto_59493 ) ( SURFACE-AT ?auto_59489 ?auto_59497 ) ( ON ?auto_59489 ?auto_59496 ) ( CLEAR ?auto_59489 ) ( not ( = ?auto_59489 ?auto_59496 ) ) ( not ( = ?auto_59490 ?auto_59496 ) ) ( SURFACE-AT ?auto_59491 ?auto_59494 ) ( CLEAR ?auto_59491 ) ( IS-CRATE ?auto_59490 ) ( not ( = ?auto_59489 ?auto_59491 ) ) ( not ( = ?auto_59490 ?auto_59491 ) ) ( not ( = ?auto_59496 ?auto_59491 ) ) ( AVAILABLE ?auto_59495 ) ( IN ?auto_59490 ?auto_59492 ) ( TRUCK-AT ?auto_59492 ?auto_59498 ) ( not ( = ?auto_59498 ?auto_59494 ) ) ( not ( = ?auto_59497 ?auto_59498 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_59492 ?auto_59498 ?auto_59494 )
      ( MAKE-ON ?auto_59489 ?auto_59490 )
      ( MAKE-ON-VERIFY ?auto_59489 ?auto_59490 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59499 - SURFACE
      ?auto_59500 - SURFACE
    )
    :vars
    (
      ?auto_59502 - HOIST
      ?auto_59507 - PLACE
      ?auto_59508 - PLACE
      ?auto_59504 - HOIST
      ?auto_59503 - SURFACE
      ?auto_59505 - SURFACE
      ?auto_59501 - TRUCK
      ?auto_59506 - PLACE
      ?auto_59509 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_59502 ?auto_59507 ) ( IS-CRATE ?auto_59499 ) ( not ( = ?auto_59499 ?auto_59500 ) ) ( not ( = ?auto_59508 ?auto_59507 ) ) ( HOIST-AT ?auto_59504 ?auto_59508 ) ( not ( = ?auto_59502 ?auto_59504 ) ) ( AVAILABLE ?auto_59504 ) ( SURFACE-AT ?auto_59499 ?auto_59508 ) ( ON ?auto_59499 ?auto_59503 ) ( CLEAR ?auto_59499 ) ( not ( = ?auto_59499 ?auto_59503 ) ) ( not ( = ?auto_59500 ?auto_59503 ) ) ( SURFACE-AT ?auto_59505 ?auto_59507 ) ( CLEAR ?auto_59505 ) ( IS-CRATE ?auto_59500 ) ( not ( = ?auto_59499 ?auto_59505 ) ) ( not ( = ?auto_59500 ?auto_59505 ) ) ( not ( = ?auto_59503 ?auto_59505 ) ) ( AVAILABLE ?auto_59502 ) ( TRUCK-AT ?auto_59501 ?auto_59506 ) ( not ( = ?auto_59506 ?auto_59507 ) ) ( not ( = ?auto_59508 ?auto_59506 ) ) ( HOIST-AT ?auto_59509 ?auto_59506 ) ( LIFTING ?auto_59509 ?auto_59500 ) ( not ( = ?auto_59502 ?auto_59509 ) ) ( not ( = ?auto_59504 ?auto_59509 ) ) )
    :subtasks
    ( ( !LOAD ?auto_59509 ?auto_59500 ?auto_59501 ?auto_59506 )
      ( MAKE-ON ?auto_59499 ?auto_59500 )
      ( MAKE-ON-VERIFY ?auto_59499 ?auto_59500 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59510 - SURFACE
      ?auto_59511 - SURFACE
    )
    :vars
    (
      ?auto_59512 - HOIST
      ?auto_59515 - PLACE
      ?auto_59518 - PLACE
      ?auto_59514 - HOIST
      ?auto_59513 - SURFACE
      ?auto_59519 - SURFACE
      ?auto_59520 - TRUCK
      ?auto_59517 - PLACE
      ?auto_59516 - HOIST
      ?auto_59521 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59512 ?auto_59515 ) ( IS-CRATE ?auto_59510 ) ( not ( = ?auto_59510 ?auto_59511 ) ) ( not ( = ?auto_59518 ?auto_59515 ) ) ( HOIST-AT ?auto_59514 ?auto_59518 ) ( not ( = ?auto_59512 ?auto_59514 ) ) ( AVAILABLE ?auto_59514 ) ( SURFACE-AT ?auto_59510 ?auto_59518 ) ( ON ?auto_59510 ?auto_59513 ) ( CLEAR ?auto_59510 ) ( not ( = ?auto_59510 ?auto_59513 ) ) ( not ( = ?auto_59511 ?auto_59513 ) ) ( SURFACE-AT ?auto_59519 ?auto_59515 ) ( CLEAR ?auto_59519 ) ( IS-CRATE ?auto_59511 ) ( not ( = ?auto_59510 ?auto_59519 ) ) ( not ( = ?auto_59511 ?auto_59519 ) ) ( not ( = ?auto_59513 ?auto_59519 ) ) ( AVAILABLE ?auto_59512 ) ( TRUCK-AT ?auto_59520 ?auto_59517 ) ( not ( = ?auto_59517 ?auto_59515 ) ) ( not ( = ?auto_59518 ?auto_59517 ) ) ( HOIST-AT ?auto_59516 ?auto_59517 ) ( not ( = ?auto_59512 ?auto_59516 ) ) ( not ( = ?auto_59514 ?auto_59516 ) ) ( AVAILABLE ?auto_59516 ) ( SURFACE-AT ?auto_59511 ?auto_59517 ) ( ON ?auto_59511 ?auto_59521 ) ( CLEAR ?auto_59511 ) ( not ( = ?auto_59510 ?auto_59521 ) ) ( not ( = ?auto_59511 ?auto_59521 ) ) ( not ( = ?auto_59513 ?auto_59521 ) ) ( not ( = ?auto_59519 ?auto_59521 ) ) )
    :subtasks
    ( ( !LIFT ?auto_59516 ?auto_59511 ?auto_59521 ?auto_59517 )
      ( MAKE-ON ?auto_59510 ?auto_59511 )
      ( MAKE-ON-VERIFY ?auto_59510 ?auto_59511 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59522 - SURFACE
      ?auto_59523 - SURFACE
    )
    :vars
    (
      ?auto_59530 - HOIST
      ?auto_59533 - PLACE
      ?auto_59527 - PLACE
      ?auto_59525 - HOIST
      ?auto_59529 - SURFACE
      ?auto_59528 - SURFACE
      ?auto_59524 - PLACE
      ?auto_59531 - HOIST
      ?auto_59526 - SURFACE
      ?auto_59532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_59530 ?auto_59533 ) ( IS-CRATE ?auto_59522 ) ( not ( = ?auto_59522 ?auto_59523 ) ) ( not ( = ?auto_59527 ?auto_59533 ) ) ( HOIST-AT ?auto_59525 ?auto_59527 ) ( not ( = ?auto_59530 ?auto_59525 ) ) ( AVAILABLE ?auto_59525 ) ( SURFACE-AT ?auto_59522 ?auto_59527 ) ( ON ?auto_59522 ?auto_59529 ) ( CLEAR ?auto_59522 ) ( not ( = ?auto_59522 ?auto_59529 ) ) ( not ( = ?auto_59523 ?auto_59529 ) ) ( SURFACE-AT ?auto_59528 ?auto_59533 ) ( CLEAR ?auto_59528 ) ( IS-CRATE ?auto_59523 ) ( not ( = ?auto_59522 ?auto_59528 ) ) ( not ( = ?auto_59523 ?auto_59528 ) ) ( not ( = ?auto_59529 ?auto_59528 ) ) ( AVAILABLE ?auto_59530 ) ( not ( = ?auto_59524 ?auto_59533 ) ) ( not ( = ?auto_59527 ?auto_59524 ) ) ( HOIST-AT ?auto_59531 ?auto_59524 ) ( not ( = ?auto_59530 ?auto_59531 ) ) ( not ( = ?auto_59525 ?auto_59531 ) ) ( AVAILABLE ?auto_59531 ) ( SURFACE-AT ?auto_59523 ?auto_59524 ) ( ON ?auto_59523 ?auto_59526 ) ( CLEAR ?auto_59523 ) ( not ( = ?auto_59522 ?auto_59526 ) ) ( not ( = ?auto_59523 ?auto_59526 ) ) ( not ( = ?auto_59529 ?auto_59526 ) ) ( not ( = ?auto_59528 ?auto_59526 ) ) ( TRUCK-AT ?auto_59532 ?auto_59533 ) )
    :subtasks
    ( ( !DRIVE ?auto_59532 ?auto_59533 ?auto_59524 )
      ( MAKE-ON ?auto_59522 ?auto_59523 )
      ( MAKE-ON-VERIFY ?auto_59522 ?auto_59523 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59536 - SURFACE
      ?auto_59537 - SURFACE
    )
    :vars
    (
      ?auto_59538 - HOIST
      ?auto_59539 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59538 ?auto_59539 ) ( SURFACE-AT ?auto_59537 ?auto_59539 ) ( CLEAR ?auto_59537 ) ( LIFTING ?auto_59538 ?auto_59536 ) ( IS-CRATE ?auto_59536 ) ( not ( = ?auto_59536 ?auto_59537 ) ) )
    :subtasks
    ( ( !DROP ?auto_59538 ?auto_59536 ?auto_59537 ?auto_59539 )
      ( MAKE-ON-VERIFY ?auto_59536 ?auto_59537 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59540 - SURFACE
      ?auto_59541 - SURFACE
    )
    :vars
    (
      ?auto_59542 - HOIST
      ?auto_59543 - PLACE
      ?auto_59544 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_59542 ?auto_59543 ) ( SURFACE-AT ?auto_59541 ?auto_59543 ) ( CLEAR ?auto_59541 ) ( IS-CRATE ?auto_59540 ) ( not ( = ?auto_59540 ?auto_59541 ) ) ( TRUCK-AT ?auto_59544 ?auto_59543 ) ( AVAILABLE ?auto_59542 ) ( IN ?auto_59540 ?auto_59544 ) )
    :subtasks
    ( ( !UNLOAD ?auto_59542 ?auto_59540 ?auto_59544 ?auto_59543 )
      ( MAKE-ON ?auto_59540 ?auto_59541 )
      ( MAKE-ON-VERIFY ?auto_59540 ?auto_59541 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59545 - SURFACE
      ?auto_59546 - SURFACE
    )
    :vars
    (
      ?auto_59547 - HOIST
      ?auto_59549 - PLACE
      ?auto_59548 - TRUCK
      ?auto_59550 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59547 ?auto_59549 ) ( SURFACE-AT ?auto_59546 ?auto_59549 ) ( CLEAR ?auto_59546 ) ( IS-CRATE ?auto_59545 ) ( not ( = ?auto_59545 ?auto_59546 ) ) ( AVAILABLE ?auto_59547 ) ( IN ?auto_59545 ?auto_59548 ) ( TRUCK-AT ?auto_59548 ?auto_59550 ) ( not ( = ?auto_59550 ?auto_59549 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_59548 ?auto_59550 ?auto_59549 )
      ( MAKE-ON ?auto_59545 ?auto_59546 )
      ( MAKE-ON-VERIFY ?auto_59545 ?auto_59546 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59551 - SURFACE
      ?auto_59552 - SURFACE
    )
    :vars
    (
      ?auto_59556 - HOIST
      ?auto_59554 - PLACE
      ?auto_59553 - TRUCK
      ?auto_59555 - PLACE
      ?auto_59557 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_59556 ?auto_59554 ) ( SURFACE-AT ?auto_59552 ?auto_59554 ) ( CLEAR ?auto_59552 ) ( IS-CRATE ?auto_59551 ) ( not ( = ?auto_59551 ?auto_59552 ) ) ( AVAILABLE ?auto_59556 ) ( TRUCK-AT ?auto_59553 ?auto_59555 ) ( not ( = ?auto_59555 ?auto_59554 ) ) ( HOIST-AT ?auto_59557 ?auto_59555 ) ( LIFTING ?auto_59557 ?auto_59551 ) ( not ( = ?auto_59556 ?auto_59557 ) ) )
    :subtasks
    ( ( !LOAD ?auto_59557 ?auto_59551 ?auto_59553 ?auto_59555 )
      ( MAKE-ON ?auto_59551 ?auto_59552 )
      ( MAKE-ON-VERIFY ?auto_59551 ?auto_59552 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59558 - SURFACE
      ?auto_59559 - SURFACE
    )
    :vars
    (
      ?auto_59564 - HOIST
      ?auto_59562 - PLACE
      ?auto_59561 - TRUCK
      ?auto_59563 - PLACE
      ?auto_59560 - HOIST
      ?auto_59565 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59564 ?auto_59562 ) ( SURFACE-AT ?auto_59559 ?auto_59562 ) ( CLEAR ?auto_59559 ) ( IS-CRATE ?auto_59558 ) ( not ( = ?auto_59558 ?auto_59559 ) ) ( AVAILABLE ?auto_59564 ) ( TRUCK-AT ?auto_59561 ?auto_59563 ) ( not ( = ?auto_59563 ?auto_59562 ) ) ( HOIST-AT ?auto_59560 ?auto_59563 ) ( not ( = ?auto_59564 ?auto_59560 ) ) ( AVAILABLE ?auto_59560 ) ( SURFACE-AT ?auto_59558 ?auto_59563 ) ( ON ?auto_59558 ?auto_59565 ) ( CLEAR ?auto_59558 ) ( not ( = ?auto_59558 ?auto_59565 ) ) ( not ( = ?auto_59559 ?auto_59565 ) ) )
    :subtasks
    ( ( !LIFT ?auto_59560 ?auto_59558 ?auto_59565 ?auto_59563 )
      ( MAKE-ON ?auto_59558 ?auto_59559 )
      ( MAKE-ON-VERIFY ?auto_59558 ?auto_59559 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59566 - SURFACE
      ?auto_59567 - SURFACE
    )
    :vars
    (
      ?auto_59571 - HOIST
      ?auto_59572 - PLACE
      ?auto_59569 - PLACE
      ?auto_59570 - HOIST
      ?auto_59568 - SURFACE
      ?auto_59573 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_59571 ?auto_59572 ) ( SURFACE-AT ?auto_59567 ?auto_59572 ) ( CLEAR ?auto_59567 ) ( IS-CRATE ?auto_59566 ) ( not ( = ?auto_59566 ?auto_59567 ) ) ( AVAILABLE ?auto_59571 ) ( not ( = ?auto_59569 ?auto_59572 ) ) ( HOIST-AT ?auto_59570 ?auto_59569 ) ( not ( = ?auto_59571 ?auto_59570 ) ) ( AVAILABLE ?auto_59570 ) ( SURFACE-AT ?auto_59566 ?auto_59569 ) ( ON ?auto_59566 ?auto_59568 ) ( CLEAR ?auto_59566 ) ( not ( = ?auto_59566 ?auto_59568 ) ) ( not ( = ?auto_59567 ?auto_59568 ) ) ( TRUCK-AT ?auto_59573 ?auto_59572 ) )
    :subtasks
    ( ( !DRIVE ?auto_59573 ?auto_59572 ?auto_59569 )
      ( MAKE-ON ?auto_59566 ?auto_59567 )
      ( MAKE-ON-VERIFY ?auto_59566 ?auto_59567 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59574 - SURFACE
      ?auto_59575 - SURFACE
    )
    :vars
    (
      ?auto_59576 - HOIST
      ?auto_59577 - PLACE
      ?auto_59578 - PLACE
      ?auto_59579 - HOIST
      ?auto_59580 - SURFACE
      ?auto_59581 - TRUCK
      ?auto_59582 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59576 ?auto_59577 ) ( IS-CRATE ?auto_59574 ) ( not ( = ?auto_59574 ?auto_59575 ) ) ( not ( = ?auto_59578 ?auto_59577 ) ) ( HOIST-AT ?auto_59579 ?auto_59578 ) ( not ( = ?auto_59576 ?auto_59579 ) ) ( AVAILABLE ?auto_59579 ) ( SURFACE-AT ?auto_59574 ?auto_59578 ) ( ON ?auto_59574 ?auto_59580 ) ( CLEAR ?auto_59574 ) ( not ( = ?auto_59574 ?auto_59580 ) ) ( not ( = ?auto_59575 ?auto_59580 ) ) ( TRUCK-AT ?auto_59581 ?auto_59577 ) ( SURFACE-AT ?auto_59582 ?auto_59577 ) ( CLEAR ?auto_59582 ) ( LIFTING ?auto_59576 ?auto_59575 ) ( IS-CRATE ?auto_59575 ) ( not ( = ?auto_59574 ?auto_59582 ) ) ( not ( = ?auto_59575 ?auto_59582 ) ) ( not ( = ?auto_59580 ?auto_59582 ) ) )
    :subtasks
    ( ( !DROP ?auto_59576 ?auto_59575 ?auto_59582 ?auto_59577 )
      ( MAKE-ON ?auto_59574 ?auto_59575 )
      ( MAKE-ON-VERIFY ?auto_59574 ?auto_59575 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59583 - SURFACE
      ?auto_59584 - SURFACE
    )
    :vars
    (
      ?auto_59585 - HOIST
      ?auto_59586 - PLACE
      ?auto_59589 - PLACE
      ?auto_59587 - HOIST
      ?auto_59588 - SURFACE
      ?auto_59590 - TRUCK
      ?auto_59591 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59585 ?auto_59586 ) ( IS-CRATE ?auto_59583 ) ( not ( = ?auto_59583 ?auto_59584 ) ) ( not ( = ?auto_59589 ?auto_59586 ) ) ( HOIST-AT ?auto_59587 ?auto_59589 ) ( not ( = ?auto_59585 ?auto_59587 ) ) ( AVAILABLE ?auto_59587 ) ( SURFACE-AT ?auto_59583 ?auto_59589 ) ( ON ?auto_59583 ?auto_59588 ) ( CLEAR ?auto_59583 ) ( not ( = ?auto_59583 ?auto_59588 ) ) ( not ( = ?auto_59584 ?auto_59588 ) ) ( TRUCK-AT ?auto_59590 ?auto_59586 ) ( SURFACE-AT ?auto_59591 ?auto_59586 ) ( CLEAR ?auto_59591 ) ( IS-CRATE ?auto_59584 ) ( not ( = ?auto_59583 ?auto_59591 ) ) ( not ( = ?auto_59584 ?auto_59591 ) ) ( not ( = ?auto_59588 ?auto_59591 ) ) ( AVAILABLE ?auto_59585 ) ( IN ?auto_59584 ?auto_59590 ) )
    :subtasks
    ( ( !UNLOAD ?auto_59585 ?auto_59584 ?auto_59590 ?auto_59586 )
      ( MAKE-ON ?auto_59583 ?auto_59584 )
      ( MAKE-ON-VERIFY ?auto_59583 ?auto_59584 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59592 - SURFACE
      ?auto_59593 - SURFACE
    )
    :vars
    (
      ?auto_59600 - HOIST
      ?auto_59598 - PLACE
      ?auto_59599 - PLACE
      ?auto_59595 - HOIST
      ?auto_59597 - SURFACE
      ?auto_59596 - SURFACE
      ?auto_59594 - TRUCK
      ?auto_59601 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59600 ?auto_59598 ) ( IS-CRATE ?auto_59592 ) ( not ( = ?auto_59592 ?auto_59593 ) ) ( not ( = ?auto_59599 ?auto_59598 ) ) ( HOIST-AT ?auto_59595 ?auto_59599 ) ( not ( = ?auto_59600 ?auto_59595 ) ) ( AVAILABLE ?auto_59595 ) ( SURFACE-AT ?auto_59592 ?auto_59599 ) ( ON ?auto_59592 ?auto_59597 ) ( CLEAR ?auto_59592 ) ( not ( = ?auto_59592 ?auto_59597 ) ) ( not ( = ?auto_59593 ?auto_59597 ) ) ( SURFACE-AT ?auto_59596 ?auto_59598 ) ( CLEAR ?auto_59596 ) ( IS-CRATE ?auto_59593 ) ( not ( = ?auto_59592 ?auto_59596 ) ) ( not ( = ?auto_59593 ?auto_59596 ) ) ( not ( = ?auto_59597 ?auto_59596 ) ) ( AVAILABLE ?auto_59600 ) ( IN ?auto_59593 ?auto_59594 ) ( TRUCK-AT ?auto_59594 ?auto_59601 ) ( not ( = ?auto_59601 ?auto_59598 ) ) ( not ( = ?auto_59599 ?auto_59601 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_59594 ?auto_59601 ?auto_59598 )
      ( MAKE-ON ?auto_59592 ?auto_59593 )
      ( MAKE-ON-VERIFY ?auto_59592 ?auto_59593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59602 - SURFACE
      ?auto_59603 - SURFACE
    )
    :vars
    (
      ?auto_59604 - HOIST
      ?auto_59606 - PLACE
      ?auto_59607 - PLACE
      ?auto_59605 - HOIST
      ?auto_59609 - SURFACE
      ?auto_59608 - SURFACE
      ?auto_59610 - TRUCK
      ?auto_59611 - PLACE
      ?auto_59612 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_59604 ?auto_59606 ) ( IS-CRATE ?auto_59602 ) ( not ( = ?auto_59602 ?auto_59603 ) ) ( not ( = ?auto_59607 ?auto_59606 ) ) ( HOIST-AT ?auto_59605 ?auto_59607 ) ( not ( = ?auto_59604 ?auto_59605 ) ) ( AVAILABLE ?auto_59605 ) ( SURFACE-AT ?auto_59602 ?auto_59607 ) ( ON ?auto_59602 ?auto_59609 ) ( CLEAR ?auto_59602 ) ( not ( = ?auto_59602 ?auto_59609 ) ) ( not ( = ?auto_59603 ?auto_59609 ) ) ( SURFACE-AT ?auto_59608 ?auto_59606 ) ( CLEAR ?auto_59608 ) ( IS-CRATE ?auto_59603 ) ( not ( = ?auto_59602 ?auto_59608 ) ) ( not ( = ?auto_59603 ?auto_59608 ) ) ( not ( = ?auto_59609 ?auto_59608 ) ) ( AVAILABLE ?auto_59604 ) ( TRUCK-AT ?auto_59610 ?auto_59611 ) ( not ( = ?auto_59611 ?auto_59606 ) ) ( not ( = ?auto_59607 ?auto_59611 ) ) ( HOIST-AT ?auto_59612 ?auto_59611 ) ( LIFTING ?auto_59612 ?auto_59603 ) ( not ( = ?auto_59604 ?auto_59612 ) ) ( not ( = ?auto_59605 ?auto_59612 ) ) )
    :subtasks
    ( ( !LOAD ?auto_59612 ?auto_59603 ?auto_59610 ?auto_59611 )
      ( MAKE-ON ?auto_59602 ?auto_59603 )
      ( MAKE-ON-VERIFY ?auto_59602 ?auto_59603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59613 - SURFACE
      ?auto_59614 - SURFACE
    )
    :vars
    (
      ?auto_59616 - HOIST
      ?auto_59622 - PLACE
      ?auto_59619 - PLACE
      ?auto_59617 - HOIST
      ?auto_59618 - SURFACE
      ?auto_59623 - SURFACE
      ?auto_59615 - TRUCK
      ?auto_59621 - PLACE
      ?auto_59620 - HOIST
      ?auto_59624 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59616 ?auto_59622 ) ( IS-CRATE ?auto_59613 ) ( not ( = ?auto_59613 ?auto_59614 ) ) ( not ( = ?auto_59619 ?auto_59622 ) ) ( HOIST-AT ?auto_59617 ?auto_59619 ) ( not ( = ?auto_59616 ?auto_59617 ) ) ( AVAILABLE ?auto_59617 ) ( SURFACE-AT ?auto_59613 ?auto_59619 ) ( ON ?auto_59613 ?auto_59618 ) ( CLEAR ?auto_59613 ) ( not ( = ?auto_59613 ?auto_59618 ) ) ( not ( = ?auto_59614 ?auto_59618 ) ) ( SURFACE-AT ?auto_59623 ?auto_59622 ) ( CLEAR ?auto_59623 ) ( IS-CRATE ?auto_59614 ) ( not ( = ?auto_59613 ?auto_59623 ) ) ( not ( = ?auto_59614 ?auto_59623 ) ) ( not ( = ?auto_59618 ?auto_59623 ) ) ( AVAILABLE ?auto_59616 ) ( TRUCK-AT ?auto_59615 ?auto_59621 ) ( not ( = ?auto_59621 ?auto_59622 ) ) ( not ( = ?auto_59619 ?auto_59621 ) ) ( HOIST-AT ?auto_59620 ?auto_59621 ) ( not ( = ?auto_59616 ?auto_59620 ) ) ( not ( = ?auto_59617 ?auto_59620 ) ) ( AVAILABLE ?auto_59620 ) ( SURFACE-AT ?auto_59614 ?auto_59621 ) ( ON ?auto_59614 ?auto_59624 ) ( CLEAR ?auto_59614 ) ( not ( = ?auto_59613 ?auto_59624 ) ) ( not ( = ?auto_59614 ?auto_59624 ) ) ( not ( = ?auto_59618 ?auto_59624 ) ) ( not ( = ?auto_59623 ?auto_59624 ) ) )
    :subtasks
    ( ( !LIFT ?auto_59620 ?auto_59614 ?auto_59624 ?auto_59621 )
      ( MAKE-ON ?auto_59613 ?auto_59614 )
      ( MAKE-ON-VERIFY ?auto_59613 ?auto_59614 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59625 - SURFACE
      ?auto_59626 - SURFACE
    )
    :vars
    (
      ?auto_59629 - HOIST
      ?auto_59633 - PLACE
      ?auto_59634 - PLACE
      ?auto_59630 - HOIST
      ?auto_59628 - SURFACE
      ?auto_59636 - SURFACE
      ?auto_59631 - PLACE
      ?auto_59632 - HOIST
      ?auto_59635 - SURFACE
      ?auto_59627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_59629 ?auto_59633 ) ( IS-CRATE ?auto_59625 ) ( not ( = ?auto_59625 ?auto_59626 ) ) ( not ( = ?auto_59634 ?auto_59633 ) ) ( HOIST-AT ?auto_59630 ?auto_59634 ) ( not ( = ?auto_59629 ?auto_59630 ) ) ( AVAILABLE ?auto_59630 ) ( SURFACE-AT ?auto_59625 ?auto_59634 ) ( ON ?auto_59625 ?auto_59628 ) ( CLEAR ?auto_59625 ) ( not ( = ?auto_59625 ?auto_59628 ) ) ( not ( = ?auto_59626 ?auto_59628 ) ) ( SURFACE-AT ?auto_59636 ?auto_59633 ) ( CLEAR ?auto_59636 ) ( IS-CRATE ?auto_59626 ) ( not ( = ?auto_59625 ?auto_59636 ) ) ( not ( = ?auto_59626 ?auto_59636 ) ) ( not ( = ?auto_59628 ?auto_59636 ) ) ( AVAILABLE ?auto_59629 ) ( not ( = ?auto_59631 ?auto_59633 ) ) ( not ( = ?auto_59634 ?auto_59631 ) ) ( HOIST-AT ?auto_59632 ?auto_59631 ) ( not ( = ?auto_59629 ?auto_59632 ) ) ( not ( = ?auto_59630 ?auto_59632 ) ) ( AVAILABLE ?auto_59632 ) ( SURFACE-AT ?auto_59626 ?auto_59631 ) ( ON ?auto_59626 ?auto_59635 ) ( CLEAR ?auto_59626 ) ( not ( = ?auto_59625 ?auto_59635 ) ) ( not ( = ?auto_59626 ?auto_59635 ) ) ( not ( = ?auto_59628 ?auto_59635 ) ) ( not ( = ?auto_59636 ?auto_59635 ) ) ( TRUCK-AT ?auto_59627 ?auto_59633 ) )
    :subtasks
    ( ( !DRIVE ?auto_59627 ?auto_59633 ?auto_59631 )
      ( MAKE-ON ?auto_59625 ?auto_59626 )
      ( MAKE-ON-VERIFY ?auto_59625 ?auto_59626 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59637 - SURFACE
      ?auto_59638 - SURFACE
    )
    :vars
    (
      ?auto_59642 - HOIST
      ?auto_59647 - PLACE
      ?auto_59646 - PLACE
      ?auto_59648 - HOIST
      ?auto_59639 - SURFACE
      ?auto_59641 - SURFACE
      ?auto_59643 - PLACE
      ?auto_59645 - HOIST
      ?auto_59644 - SURFACE
      ?auto_59640 - TRUCK
      ?auto_59649 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59642 ?auto_59647 ) ( IS-CRATE ?auto_59637 ) ( not ( = ?auto_59637 ?auto_59638 ) ) ( not ( = ?auto_59646 ?auto_59647 ) ) ( HOIST-AT ?auto_59648 ?auto_59646 ) ( not ( = ?auto_59642 ?auto_59648 ) ) ( AVAILABLE ?auto_59648 ) ( SURFACE-AT ?auto_59637 ?auto_59646 ) ( ON ?auto_59637 ?auto_59639 ) ( CLEAR ?auto_59637 ) ( not ( = ?auto_59637 ?auto_59639 ) ) ( not ( = ?auto_59638 ?auto_59639 ) ) ( IS-CRATE ?auto_59638 ) ( not ( = ?auto_59637 ?auto_59641 ) ) ( not ( = ?auto_59638 ?auto_59641 ) ) ( not ( = ?auto_59639 ?auto_59641 ) ) ( not ( = ?auto_59643 ?auto_59647 ) ) ( not ( = ?auto_59646 ?auto_59643 ) ) ( HOIST-AT ?auto_59645 ?auto_59643 ) ( not ( = ?auto_59642 ?auto_59645 ) ) ( not ( = ?auto_59648 ?auto_59645 ) ) ( AVAILABLE ?auto_59645 ) ( SURFACE-AT ?auto_59638 ?auto_59643 ) ( ON ?auto_59638 ?auto_59644 ) ( CLEAR ?auto_59638 ) ( not ( = ?auto_59637 ?auto_59644 ) ) ( not ( = ?auto_59638 ?auto_59644 ) ) ( not ( = ?auto_59639 ?auto_59644 ) ) ( not ( = ?auto_59641 ?auto_59644 ) ) ( TRUCK-AT ?auto_59640 ?auto_59647 ) ( SURFACE-AT ?auto_59649 ?auto_59647 ) ( CLEAR ?auto_59649 ) ( LIFTING ?auto_59642 ?auto_59641 ) ( IS-CRATE ?auto_59641 ) ( not ( = ?auto_59637 ?auto_59649 ) ) ( not ( = ?auto_59638 ?auto_59649 ) ) ( not ( = ?auto_59639 ?auto_59649 ) ) ( not ( = ?auto_59641 ?auto_59649 ) ) ( not ( = ?auto_59644 ?auto_59649 ) ) )
    :subtasks
    ( ( !DROP ?auto_59642 ?auto_59641 ?auto_59649 ?auto_59647 )
      ( MAKE-ON ?auto_59637 ?auto_59638 )
      ( MAKE-ON-VERIFY ?auto_59637 ?auto_59638 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59650 - SURFACE
      ?auto_59651 - SURFACE
    )
    :vars
    (
      ?auto_59656 - HOIST
      ?auto_59660 - PLACE
      ?auto_59652 - PLACE
      ?auto_59654 - HOIST
      ?auto_59658 - SURFACE
      ?auto_59657 - SURFACE
      ?auto_59655 - PLACE
      ?auto_59659 - HOIST
      ?auto_59653 - SURFACE
      ?auto_59661 - TRUCK
      ?auto_59662 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59656 ?auto_59660 ) ( IS-CRATE ?auto_59650 ) ( not ( = ?auto_59650 ?auto_59651 ) ) ( not ( = ?auto_59652 ?auto_59660 ) ) ( HOIST-AT ?auto_59654 ?auto_59652 ) ( not ( = ?auto_59656 ?auto_59654 ) ) ( AVAILABLE ?auto_59654 ) ( SURFACE-AT ?auto_59650 ?auto_59652 ) ( ON ?auto_59650 ?auto_59658 ) ( CLEAR ?auto_59650 ) ( not ( = ?auto_59650 ?auto_59658 ) ) ( not ( = ?auto_59651 ?auto_59658 ) ) ( IS-CRATE ?auto_59651 ) ( not ( = ?auto_59650 ?auto_59657 ) ) ( not ( = ?auto_59651 ?auto_59657 ) ) ( not ( = ?auto_59658 ?auto_59657 ) ) ( not ( = ?auto_59655 ?auto_59660 ) ) ( not ( = ?auto_59652 ?auto_59655 ) ) ( HOIST-AT ?auto_59659 ?auto_59655 ) ( not ( = ?auto_59656 ?auto_59659 ) ) ( not ( = ?auto_59654 ?auto_59659 ) ) ( AVAILABLE ?auto_59659 ) ( SURFACE-AT ?auto_59651 ?auto_59655 ) ( ON ?auto_59651 ?auto_59653 ) ( CLEAR ?auto_59651 ) ( not ( = ?auto_59650 ?auto_59653 ) ) ( not ( = ?auto_59651 ?auto_59653 ) ) ( not ( = ?auto_59658 ?auto_59653 ) ) ( not ( = ?auto_59657 ?auto_59653 ) ) ( TRUCK-AT ?auto_59661 ?auto_59660 ) ( SURFACE-AT ?auto_59662 ?auto_59660 ) ( CLEAR ?auto_59662 ) ( IS-CRATE ?auto_59657 ) ( not ( = ?auto_59650 ?auto_59662 ) ) ( not ( = ?auto_59651 ?auto_59662 ) ) ( not ( = ?auto_59658 ?auto_59662 ) ) ( not ( = ?auto_59657 ?auto_59662 ) ) ( not ( = ?auto_59653 ?auto_59662 ) ) ( AVAILABLE ?auto_59656 ) ( IN ?auto_59657 ?auto_59661 ) )
    :subtasks
    ( ( !UNLOAD ?auto_59656 ?auto_59657 ?auto_59661 ?auto_59660 )
      ( MAKE-ON ?auto_59650 ?auto_59651 )
      ( MAKE-ON-VERIFY ?auto_59650 ?auto_59651 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59663 - SURFACE
      ?auto_59664 - SURFACE
    )
    :vars
    (
      ?auto_59669 - HOIST
      ?auto_59675 - PLACE
      ?auto_59668 - PLACE
      ?auto_59674 - HOIST
      ?auto_59670 - SURFACE
      ?auto_59671 - SURFACE
      ?auto_59665 - PLACE
      ?auto_59672 - HOIST
      ?auto_59667 - SURFACE
      ?auto_59673 - SURFACE
      ?auto_59666 - TRUCK
      ?auto_59676 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59669 ?auto_59675 ) ( IS-CRATE ?auto_59663 ) ( not ( = ?auto_59663 ?auto_59664 ) ) ( not ( = ?auto_59668 ?auto_59675 ) ) ( HOIST-AT ?auto_59674 ?auto_59668 ) ( not ( = ?auto_59669 ?auto_59674 ) ) ( AVAILABLE ?auto_59674 ) ( SURFACE-AT ?auto_59663 ?auto_59668 ) ( ON ?auto_59663 ?auto_59670 ) ( CLEAR ?auto_59663 ) ( not ( = ?auto_59663 ?auto_59670 ) ) ( not ( = ?auto_59664 ?auto_59670 ) ) ( IS-CRATE ?auto_59664 ) ( not ( = ?auto_59663 ?auto_59671 ) ) ( not ( = ?auto_59664 ?auto_59671 ) ) ( not ( = ?auto_59670 ?auto_59671 ) ) ( not ( = ?auto_59665 ?auto_59675 ) ) ( not ( = ?auto_59668 ?auto_59665 ) ) ( HOIST-AT ?auto_59672 ?auto_59665 ) ( not ( = ?auto_59669 ?auto_59672 ) ) ( not ( = ?auto_59674 ?auto_59672 ) ) ( AVAILABLE ?auto_59672 ) ( SURFACE-AT ?auto_59664 ?auto_59665 ) ( ON ?auto_59664 ?auto_59667 ) ( CLEAR ?auto_59664 ) ( not ( = ?auto_59663 ?auto_59667 ) ) ( not ( = ?auto_59664 ?auto_59667 ) ) ( not ( = ?auto_59670 ?auto_59667 ) ) ( not ( = ?auto_59671 ?auto_59667 ) ) ( SURFACE-AT ?auto_59673 ?auto_59675 ) ( CLEAR ?auto_59673 ) ( IS-CRATE ?auto_59671 ) ( not ( = ?auto_59663 ?auto_59673 ) ) ( not ( = ?auto_59664 ?auto_59673 ) ) ( not ( = ?auto_59670 ?auto_59673 ) ) ( not ( = ?auto_59671 ?auto_59673 ) ) ( not ( = ?auto_59667 ?auto_59673 ) ) ( AVAILABLE ?auto_59669 ) ( IN ?auto_59671 ?auto_59666 ) ( TRUCK-AT ?auto_59666 ?auto_59676 ) ( not ( = ?auto_59676 ?auto_59675 ) ) ( not ( = ?auto_59668 ?auto_59676 ) ) ( not ( = ?auto_59665 ?auto_59676 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_59666 ?auto_59676 ?auto_59675 )
      ( MAKE-ON ?auto_59663 ?auto_59664 )
      ( MAKE-ON-VERIFY ?auto_59663 ?auto_59664 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59677 - SURFACE
      ?auto_59678 - SURFACE
    )
    :vars
    (
      ?auto_59687 - HOIST
      ?auto_59689 - PLACE
      ?auto_59682 - PLACE
      ?auto_59688 - HOIST
      ?auto_59684 - SURFACE
      ?auto_59679 - SURFACE
      ?auto_59686 - PLACE
      ?auto_59685 - HOIST
      ?auto_59681 - SURFACE
      ?auto_59683 - SURFACE
      ?auto_59690 - TRUCK
      ?auto_59680 - PLACE
      ?auto_59691 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_59687 ?auto_59689 ) ( IS-CRATE ?auto_59677 ) ( not ( = ?auto_59677 ?auto_59678 ) ) ( not ( = ?auto_59682 ?auto_59689 ) ) ( HOIST-AT ?auto_59688 ?auto_59682 ) ( not ( = ?auto_59687 ?auto_59688 ) ) ( AVAILABLE ?auto_59688 ) ( SURFACE-AT ?auto_59677 ?auto_59682 ) ( ON ?auto_59677 ?auto_59684 ) ( CLEAR ?auto_59677 ) ( not ( = ?auto_59677 ?auto_59684 ) ) ( not ( = ?auto_59678 ?auto_59684 ) ) ( IS-CRATE ?auto_59678 ) ( not ( = ?auto_59677 ?auto_59679 ) ) ( not ( = ?auto_59678 ?auto_59679 ) ) ( not ( = ?auto_59684 ?auto_59679 ) ) ( not ( = ?auto_59686 ?auto_59689 ) ) ( not ( = ?auto_59682 ?auto_59686 ) ) ( HOIST-AT ?auto_59685 ?auto_59686 ) ( not ( = ?auto_59687 ?auto_59685 ) ) ( not ( = ?auto_59688 ?auto_59685 ) ) ( AVAILABLE ?auto_59685 ) ( SURFACE-AT ?auto_59678 ?auto_59686 ) ( ON ?auto_59678 ?auto_59681 ) ( CLEAR ?auto_59678 ) ( not ( = ?auto_59677 ?auto_59681 ) ) ( not ( = ?auto_59678 ?auto_59681 ) ) ( not ( = ?auto_59684 ?auto_59681 ) ) ( not ( = ?auto_59679 ?auto_59681 ) ) ( SURFACE-AT ?auto_59683 ?auto_59689 ) ( CLEAR ?auto_59683 ) ( IS-CRATE ?auto_59679 ) ( not ( = ?auto_59677 ?auto_59683 ) ) ( not ( = ?auto_59678 ?auto_59683 ) ) ( not ( = ?auto_59684 ?auto_59683 ) ) ( not ( = ?auto_59679 ?auto_59683 ) ) ( not ( = ?auto_59681 ?auto_59683 ) ) ( AVAILABLE ?auto_59687 ) ( TRUCK-AT ?auto_59690 ?auto_59680 ) ( not ( = ?auto_59680 ?auto_59689 ) ) ( not ( = ?auto_59682 ?auto_59680 ) ) ( not ( = ?auto_59686 ?auto_59680 ) ) ( HOIST-AT ?auto_59691 ?auto_59680 ) ( LIFTING ?auto_59691 ?auto_59679 ) ( not ( = ?auto_59687 ?auto_59691 ) ) ( not ( = ?auto_59688 ?auto_59691 ) ) ( not ( = ?auto_59685 ?auto_59691 ) ) )
    :subtasks
    ( ( !LOAD ?auto_59691 ?auto_59679 ?auto_59690 ?auto_59680 )
      ( MAKE-ON ?auto_59677 ?auto_59678 )
      ( MAKE-ON-VERIFY ?auto_59677 ?auto_59678 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59692 - SURFACE
      ?auto_59693 - SURFACE
    )
    :vars
    (
      ?auto_59701 - HOIST
      ?auto_59705 - PLACE
      ?auto_59694 - PLACE
      ?auto_59706 - HOIST
      ?auto_59699 - SURFACE
      ?auto_59704 - SURFACE
      ?auto_59696 - PLACE
      ?auto_59702 - HOIST
      ?auto_59698 - SURFACE
      ?auto_59695 - SURFACE
      ?auto_59697 - TRUCK
      ?auto_59703 - PLACE
      ?auto_59700 - HOIST
      ?auto_59707 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59701 ?auto_59705 ) ( IS-CRATE ?auto_59692 ) ( not ( = ?auto_59692 ?auto_59693 ) ) ( not ( = ?auto_59694 ?auto_59705 ) ) ( HOIST-AT ?auto_59706 ?auto_59694 ) ( not ( = ?auto_59701 ?auto_59706 ) ) ( AVAILABLE ?auto_59706 ) ( SURFACE-AT ?auto_59692 ?auto_59694 ) ( ON ?auto_59692 ?auto_59699 ) ( CLEAR ?auto_59692 ) ( not ( = ?auto_59692 ?auto_59699 ) ) ( not ( = ?auto_59693 ?auto_59699 ) ) ( IS-CRATE ?auto_59693 ) ( not ( = ?auto_59692 ?auto_59704 ) ) ( not ( = ?auto_59693 ?auto_59704 ) ) ( not ( = ?auto_59699 ?auto_59704 ) ) ( not ( = ?auto_59696 ?auto_59705 ) ) ( not ( = ?auto_59694 ?auto_59696 ) ) ( HOIST-AT ?auto_59702 ?auto_59696 ) ( not ( = ?auto_59701 ?auto_59702 ) ) ( not ( = ?auto_59706 ?auto_59702 ) ) ( AVAILABLE ?auto_59702 ) ( SURFACE-AT ?auto_59693 ?auto_59696 ) ( ON ?auto_59693 ?auto_59698 ) ( CLEAR ?auto_59693 ) ( not ( = ?auto_59692 ?auto_59698 ) ) ( not ( = ?auto_59693 ?auto_59698 ) ) ( not ( = ?auto_59699 ?auto_59698 ) ) ( not ( = ?auto_59704 ?auto_59698 ) ) ( SURFACE-AT ?auto_59695 ?auto_59705 ) ( CLEAR ?auto_59695 ) ( IS-CRATE ?auto_59704 ) ( not ( = ?auto_59692 ?auto_59695 ) ) ( not ( = ?auto_59693 ?auto_59695 ) ) ( not ( = ?auto_59699 ?auto_59695 ) ) ( not ( = ?auto_59704 ?auto_59695 ) ) ( not ( = ?auto_59698 ?auto_59695 ) ) ( AVAILABLE ?auto_59701 ) ( TRUCK-AT ?auto_59697 ?auto_59703 ) ( not ( = ?auto_59703 ?auto_59705 ) ) ( not ( = ?auto_59694 ?auto_59703 ) ) ( not ( = ?auto_59696 ?auto_59703 ) ) ( HOIST-AT ?auto_59700 ?auto_59703 ) ( not ( = ?auto_59701 ?auto_59700 ) ) ( not ( = ?auto_59706 ?auto_59700 ) ) ( not ( = ?auto_59702 ?auto_59700 ) ) ( AVAILABLE ?auto_59700 ) ( SURFACE-AT ?auto_59704 ?auto_59703 ) ( ON ?auto_59704 ?auto_59707 ) ( CLEAR ?auto_59704 ) ( not ( = ?auto_59692 ?auto_59707 ) ) ( not ( = ?auto_59693 ?auto_59707 ) ) ( not ( = ?auto_59699 ?auto_59707 ) ) ( not ( = ?auto_59704 ?auto_59707 ) ) ( not ( = ?auto_59698 ?auto_59707 ) ) ( not ( = ?auto_59695 ?auto_59707 ) ) )
    :subtasks
    ( ( !LIFT ?auto_59700 ?auto_59704 ?auto_59707 ?auto_59703 )
      ( MAKE-ON ?auto_59692 ?auto_59693 )
      ( MAKE-ON-VERIFY ?auto_59692 ?auto_59693 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59708 - SURFACE
      ?auto_59709 - SURFACE
    )
    :vars
    (
      ?auto_59721 - HOIST
      ?auto_59716 - PLACE
      ?auto_59717 - PLACE
      ?auto_59720 - HOIST
      ?auto_59722 - SURFACE
      ?auto_59713 - SURFACE
      ?auto_59723 - PLACE
      ?auto_59715 - HOIST
      ?auto_59718 - SURFACE
      ?auto_59710 - SURFACE
      ?auto_59719 - PLACE
      ?auto_59711 - HOIST
      ?auto_59712 - SURFACE
      ?auto_59714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_59721 ?auto_59716 ) ( IS-CRATE ?auto_59708 ) ( not ( = ?auto_59708 ?auto_59709 ) ) ( not ( = ?auto_59717 ?auto_59716 ) ) ( HOIST-AT ?auto_59720 ?auto_59717 ) ( not ( = ?auto_59721 ?auto_59720 ) ) ( AVAILABLE ?auto_59720 ) ( SURFACE-AT ?auto_59708 ?auto_59717 ) ( ON ?auto_59708 ?auto_59722 ) ( CLEAR ?auto_59708 ) ( not ( = ?auto_59708 ?auto_59722 ) ) ( not ( = ?auto_59709 ?auto_59722 ) ) ( IS-CRATE ?auto_59709 ) ( not ( = ?auto_59708 ?auto_59713 ) ) ( not ( = ?auto_59709 ?auto_59713 ) ) ( not ( = ?auto_59722 ?auto_59713 ) ) ( not ( = ?auto_59723 ?auto_59716 ) ) ( not ( = ?auto_59717 ?auto_59723 ) ) ( HOIST-AT ?auto_59715 ?auto_59723 ) ( not ( = ?auto_59721 ?auto_59715 ) ) ( not ( = ?auto_59720 ?auto_59715 ) ) ( AVAILABLE ?auto_59715 ) ( SURFACE-AT ?auto_59709 ?auto_59723 ) ( ON ?auto_59709 ?auto_59718 ) ( CLEAR ?auto_59709 ) ( not ( = ?auto_59708 ?auto_59718 ) ) ( not ( = ?auto_59709 ?auto_59718 ) ) ( not ( = ?auto_59722 ?auto_59718 ) ) ( not ( = ?auto_59713 ?auto_59718 ) ) ( SURFACE-AT ?auto_59710 ?auto_59716 ) ( CLEAR ?auto_59710 ) ( IS-CRATE ?auto_59713 ) ( not ( = ?auto_59708 ?auto_59710 ) ) ( not ( = ?auto_59709 ?auto_59710 ) ) ( not ( = ?auto_59722 ?auto_59710 ) ) ( not ( = ?auto_59713 ?auto_59710 ) ) ( not ( = ?auto_59718 ?auto_59710 ) ) ( AVAILABLE ?auto_59721 ) ( not ( = ?auto_59719 ?auto_59716 ) ) ( not ( = ?auto_59717 ?auto_59719 ) ) ( not ( = ?auto_59723 ?auto_59719 ) ) ( HOIST-AT ?auto_59711 ?auto_59719 ) ( not ( = ?auto_59721 ?auto_59711 ) ) ( not ( = ?auto_59720 ?auto_59711 ) ) ( not ( = ?auto_59715 ?auto_59711 ) ) ( AVAILABLE ?auto_59711 ) ( SURFACE-AT ?auto_59713 ?auto_59719 ) ( ON ?auto_59713 ?auto_59712 ) ( CLEAR ?auto_59713 ) ( not ( = ?auto_59708 ?auto_59712 ) ) ( not ( = ?auto_59709 ?auto_59712 ) ) ( not ( = ?auto_59722 ?auto_59712 ) ) ( not ( = ?auto_59713 ?auto_59712 ) ) ( not ( = ?auto_59718 ?auto_59712 ) ) ( not ( = ?auto_59710 ?auto_59712 ) ) ( TRUCK-AT ?auto_59714 ?auto_59716 ) )
    :subtasks
    ( ( !DRIVE ?auto_59714 ?auto_59716 ?auto_59719 )
      ( MAKE-ON ?auto_59708 ?auto_59709 )
      ( MAKE-ON-VERIFY ?auto_59708 ?auto_59709 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59726 - SURFACE
      ?auto_59727 - SURFACE
    )
    :vars
    (
      ?auto_59728 - HOIST
      ?auto_59729 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59728 ?auto_59729 ) ( SURFACE-AT ?auto_59727 ?auto_59729 ) ( CLEAR ?auto_59727 ) ( LIFTING ?auto_59728 ?auto_59726 ) ( IS-CRATE ?auto_59726 ) ( not ( = ?auto_59726 ?auto_59727 ) ) )
    :subtasks
    ( ( !DROP ?auto_59728 ?auto_59726 ?auto_59727 ?auto_59729 )
      ( MAKE-ON-VERIFY ?auto_59726 ?auto_59727 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59730 - SURFACE
      ?auto_59731 - SURFACE
    )
    :vars
    (
      ?auto_59733 - HOIST
      ?auto_59732 - PLACE
      ?auto_59734 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_59733 ?auto_59732 ) ( SURFACE-AT ?auto_59731 ?auto_59732 ) ( CLEAR ?auto_59731 ) ( IS-CRATE ?auto_59730 ) ( not ( = ?auto_59730 ?auto_59731 ) ) ( TRUCK-AT ?auto_59734 ?auto_59732 ) ( AVAILABLE ?auto_59733 ) ( IN ?auto_59730 ?auto_59734 ) )
    :subtasks
    ( ( !UNLOAD ?auto_59733 ?auto_59730 ?auto_59734 ?auto_59732 )
      ( MAKE-ON ?auto_59730 ?auto_59731 )
      ( MAKE-ON-VERIFY ?auto_59730 ?auto_59731 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59735 - SURFACE
      ?auto_59736 - SURFACE
    )
    :vars
    (
      ?auto_59739 - HOIST
      ?auto_59737 - PLACE
      ?auto_59738 - TRUCK
      ?auto_59740 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59739 ?auto_59737 ) ( SURFACE-AT ?auto_59736 ?auto_59737 ) ( CLEAR ?auto_59736 ) ( IS-CRATE ?auto_59735 ) ( not ( = ?auto_59735 ?auto_59736 ) ) ( AVAILABLE ?auto_59739 ) ( IN ?auto_59735 ?auto_59738 ) ( TRUCK-AT ?auto_59738 ?auto_59740 ) ( not ( = ?auto_59740 ?auto_59737 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_59738 ?auto_59740 ?auto_59737 )
      ( MAKE-ON ?auto_59735 ?auto_59736 )
      ( MAKE-ON-VERIFY ?auto_59735 ?auto_59736 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59741 - SURFACE
      ?auto_59742 - SURFACE
    )
    :vars
    (
      ?auto_59743 - HOIST
      ?auto_59746 - PLACE
      ?auto_59745 - TRUCK
      ?auto_59744 - PLACE
      ?auto_59747 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_59743 ?auto_59746 ) ( SURFACE-AT ?auto_59742 ?auto_59746 ) ( CLEAR ?auto_59742 ) ( IS-CRATE ?auto_59741 ) ( not ( = ?auto_59741 ?auto_59742 ) ) ( AVAILABLE ?auto_59743 ) ( TRUCK-AT ?auto_59745 ?auto_59744 ) ( not ( = ?auto_59744 ?auto_59746 ) ) ( HOIST-AT ?auto_59747 ?auto_59744 ) ( LIFTING ?auto_59747 ?auto_59741 ) ( not ( = ?auto_59743 ?auto_59747 ) ) )
    :subtasks
    ( ( !LOAD ?auto_59747 ?auto_59741 ?auto_59745 ?auto_59744 )
      ( MAKE-ON ?auto_59741 ?auto_59742 )
      ( MAKE-ON-VERIFY ?auto_59741 ?auto_59742 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59748 - SURFACE
      ?auto_59749 - SURFACE
    )
    :vars
    (
      ?auto_59752 - HOIST
      ?auto_59754 - PLACE
      ?auto_59753 - TRUCK
      ?auto_59751 - PLACE
      ?auto_59750 - HOIST
      ?auto_59755 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59752 ?auto_59754 ) ( SURFACE-AT ?auto_59749 ?auto_59754 ) ( CLEAR ?auto_59749 ) ( IS-CRATE ?auto_59748 ) ( not ( = ?auto_59748 ?auto_59749 ) ) ( AVAILABLE ?auto_59752 ) ( TRUCK-AT ?auto_59753 ?auto_59751 ) ( not ( = ?auto_59751 ?auto_59754 ) ) ( HOIST-AT ?auto_59750 ?auto_59751 ) ( not ( = ?auto_59752 ?auto_59750 ) ) ( AVAILABLE ?auto_59750 ) ( SURFACE-AT ?auto_59748 ?auto_59751 ) ( ON ?auto_59748 ?auto_59755 ) ( CLEAR ?auto_59748 ) ( not ( = ?auto_59748 ?auto_59755 ) ) ( not ( = ?auto_59749 ?auto_59755 ) ) )
    :subtasks
    ( ( !LIFT ?auto_59750 ?auto_59748 ?auto_59755 ?auto_59751 )
      ( MAKE-ON ?auto_59748 ?auto_59749 )
      ( MAKE-ON-VERIFY ?auto_59748 ?auto_59749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59756 - SURFACE
      ?auto_59757 - SURFACE
    )
    :vars
    (
      ?auto_59763 - HOIST
      ?auto_59762 - PLACE
      ?auto_59760 - PLACE
      ?auto_59759 - HOIST
      ?auto_59758 - SURFACE
      ?auto_59761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_59763 ?auto_59762 ) ( SURFACE-AT ?auto_59757 ?auto_59762 ) ( CLEAR ?auto_59757 ) ( IS-CRATE ?auto_59756 ) ( not ( = ?auto_59756 ?auto_59757 ) ) ( AVAILABLE ?auto_59763 ) ( not ( = ?auto_59760 ?auto_59762 ) ) ( HOIST-AT ?auto_59759 ?auto_59760 ) ( not ( = ?auto_59763 ?auto_59759 ) ) ( AVAILABLE ?auto_59759 ) ( SURFACE-AT ?auto_59756 ?auto_59760 ) ( ON ?auto_59756 ?auto_59758 ) ( CLEAR ?auto_59756 ) ( not ( = ?auto_59756 ?auto_59758 ) ) ( not ( = ?auto_59757 ?auto_59758 ) ) ( TRUCK-AT ?auto_59761 ?auto_59762 ) )
    :subtasks
    ( ( !DRIVE ?auto_59761 ?auto_59762 ?auto_59760 )
      ( MAKE-ON ?auto_59756 ?auto_59757 )
      ( MAKE-ON-VERIFY ?auto_59756 ?auto_59757 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59764 - SURFACE
      ?auto_59765 - SURFACE
    )
    :vars
    (
      ?auto_59770 - HOIST
      ?auto_59769 - PLACE
      ?auto_59766 - PLACE
      ?auto_59767 - HOIST
      ?auto_59768 - SURFACE
      ?auto_59771 - TRUCK
      ?auto_59772 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59770 ?auto_59769 ) ( IS-CRATE ?auto_59764 ) ( not ( = ?auto_59764 ?auto_59765 ) ) ( not ( = ?auto_59766 ?auto_59769 ) ) ( HOIST-AT ?auto_59767 ?auto_59766 ) ( not ( = ?auto_59770 ?auto_59767 ) ) ( AVAILABLE ?auto_59767 ) ( SURFACE-AT ?auto_59764 ?auto_59766 ) ( ON ?auto_59764 ?auto_59768 ) ( CLEAR ?auto_59764 ) ( not ( = ?auto_59764 ?auto_59768 ) ) ( not ( = ?auto_59765 ?auto_59768 ) ) ( TRUCK-AT ?auto_59771 ?auto_59769 ) ( SURFACE-AT ?auto_59772 ?auto_59769 ) ( CLEAR ?auto_59772 ) ( LIFTING ?auto_59770 ?auto_59765 ) ( IS-CRATE ?auto_59765 ) ( not ( = ?auto_59764 ?auto_59772 ) ) ( not ( = ?auto_59765 ?auto_59772 ) ) ( not ( = ?auto_59768 ?auto_59772 ) ) )
    :subtasks
    ( ( !DROP ?auto_59770 ?auto_59765 ?auto_59772 ?auto_59769 )
      ( MAKE-ON ?auto_59764 ?auto_59765 )
      ( MAKE-ON-VERIFY ?auto_59764 ?auto_59765 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59773 - SURFACE
      ?auto_59774 - SURFACE
    )
    :vars
    (
      ?auto_59776 - HOIST
      ?auto_59777 - PLACE
      ?auto_59778 - PLACE
      ?auto_59781 - HOIST
      ?auto_59780 - SURFACE
      ?auto_59775 - TRUCK
      ?auto_59779 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59776 ?auto_59777 ) ( IS-CRATE ?auto_59773 ) ( not ( = ?auto_59773 ?auto_59774 ) ) ( not ( = ?auto_59778 ?auto_59777 ) ) ( HOIST-AT ?auto_59781 ?auto_59778 ) ( not ( = ?auto_59776 ?auto_59781 ) ) ( AVAILABLE ?auto_59781 ) ( SURFACE-AT ?auto_59773 ?auto_59778 ) ( ON ?auto_59773 ?auto_59780 ) ( CLEAR ?auto_59773 ) ( not ( = ?auto_59773 ?auto_59780 ) ) ( not ( = ?auto_59774 ?auto_59780 ) ) ( TRUCK-AT ?auto_59775 ?auto_59777 ) ( SURFACE-AT ?auto_59779 ?auto_59777 ) ( CLEAR ?auto_59779 ) ( IS-CRATE ?auto_59774 ) ( not ( = ?auto_59773 ?auto_59779 ) ) ( not ( = ?auto_59774 ?auto_59779 ) ) ( not ( = ?auto_59780 ?auto_59779 ) ) ( AVAILABLE ?auto_59776 ) ( IN ?auto_59774 ?auto_59775 ) )
    :subtasks
    ( ( !UNLOAD ?auto_59776 ?auto_59774 ?auto_59775 ?auto_59777 )
      ( MAKE-ON ?auto_59773 ?auto_59774 )
      ( MAKE-ON-VERIFY ?auto_59773 ?auto_59774 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59782 - SURFACE
      ?auto_59783 - SURFACE
    )
    :vars
    (
      ?auto_59784 - HOIST
      ?auto_59790 - PLACE
      ?auto_59788 - PLACE
      ?auto_59787 - HOIST
      ?auto_59785 - SURFACE
      ?auto_59786 - SURFACE
      ?auto_59789 - TRUCK
      ?auto_59791 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59784 ?auto_59790 ) ( IS-CRATE ?auto_59782 ) ( not ( = ?auto_59782 ?auto_59783 ) ) ( not ( = ?auto_59788 ?auto_59790 ) ) ( HOIST-AT ?auto_59787 ?auto_59788 ) ( not ( = ?auto_59784 ?auto_59787 ) ) ( AVAILABLE ?auto_59787 ) ( SURFACE-AT ?auto_59782 ?auto_59788 ) ( ON ?auto_59782 ?auto_59785 ) ( CLEAR ?auto_59782 ) ( not ( = ?auto_59782 ?auto_59785 ) ) ( not ( = ?auto_59783 ?auto_59785 ) ) ( SURFACE-AT ?auto_59786 ?auto_59790 ) ( CLEAR ?auto_59786 ) ( IS-CRATE ?auto_59783 ) ( not ( = ?auto_59782 ?auto_59786 ) ) ( not ( = ?auto_59783 ?auto_59786 ) ) ( not ( = ?auto_59785 ?auto_59786 ) ) ( AVAILABLE ?auto_59784 ) ( IN ?auto_59783 ?auto_59789 ) ( TRUCK-AT ?auto_59789 ?auto_59791 ) ( not ( = ?auto_59791 ?auto_59790 ) ) ( not ( = ?auto_59788 ?auto_59791 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_59789 ?auto_59791 ?auto_59790 )
      ( MAKE-ON ?auto_59782 ?auto_59783 )
      ( MAKE-ON-VERIFY ?auto_59782 ?auto_59783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59792 - SURFACE
      ?auto_59793 - SURFACE
    )
    :vars
    (
      ?auto_59794 - HOIST
      ?auto_59796 - PLACE
      ?auto_59797 - PLACE
      ?auto_59799 - HOIST
      ?auto_59798 - SURFACE
      ?auto_59800 - SURFACE
      ?auto_59801 - TRUCK
      ?auto_59795 - PLACE
      ?auto_59802 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_59794 ?auto_59796 ) ( IS-CRATE ?auto_59792 ) ( not ( = ?auto_59792 ?auto_59793 ) ) ( not ( = ?auto_59797 ?auto_59796 ) ) ( HOIST-AT ?auto_59799 ?auto_59797 ) ( not ( = ?auto_59794 ?auto_59799 ) ) ( AVAILABLE ?auto_59799 ) ( SURFACE-AT ?auto_59792 ?auto_59797 ) ( ON ?auto_59792 ?auto_59798 ) ( CLEAR ?auto_59792 ) ( not ( = ?auto_59792 ?auto_59798 ) ) ( not ( = ?auto_59793 ?auto_59798 ) ) ( SURFACE-AT ?auto_59800 ?auto_59796 ) ( CLEAR ?auto_59800 ) ( IS-CRATE ?auto_59793 ) ( not ( = ?auto_59792 ?auto_59800 ) ) ( not ( = ?auto_59793 ?auto_59800 ) ) ( not ( = ?auto_59798 ?auto_59800 ) ) ( AVAILABLE ?auto_59794 ) ( TRUCK-AT ?auto_59801 ?auto_59795 ) ( not ( = ?auto_59795 ?auto_59796 ) ) ( not ( = ?auto_59797 ?auto_59795 ) ) ( HOIST-AT ?auto_59802 ?auto_59795 ) ( LIFTING ?auto_59802 ?auto_59793 ) ( not ( = ?auto_59794 ?auto_59802 ) ) ( not ( = ?auto_59799 ?auto_59802 ) ) )
    :subtasks
    ( ( !LOAD ?auto_59802 ?auto_59793 ?auto_59801 ?auto_59795 )
      ( MAKE-ON ?auto_59792 ?auto_59793 )
      ( MAKE-ON-VERIFY ?auto_59792 ?auto_59793 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59803 - SURFACE
      ?auto_59804 - SURFACE
    )
    :vars
    (
      ?auto_59807 - HOIST
      ?auto_59813 - PLACE
      ?auto_59809 - PLACE
      ?auto_59806 - HOIST
      ?auto_59808 - SURFACE
      ?auto_59812 - SURFACE
      ?auto_59805 - TRUCK
      ?auto_59811 - PLACE
      ?auto_59810 - HOIST
      ?auto_59814 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59807 ?auto_59813 ) ( IS-CRATE ?auto_59803 ) ( not ( = ?auto_59803 ?auto_59804 ) ) ( not ( = ?auto_59809 ?auto_59813 ) ) ( HOIST-AT ?auto_59806 ?auto_59809 ) ( not ( = ?auto_59807 ?auto_59806 ) ) ( AVAILABLE ?auto_59806 ) ( SURFACE-AT ?auto_59803 ?auto_59809 ) ( ON ?auto_59803 ?auto_59808 ) ( CLEAR ?auto_59803 ) ( not ( = ?auto_59803 ?auto_59808 ) ) ( not ( = ?auto_59804 ?auto_59808 ) ) ( SURFACE-AT ?auto_59812 ?auto_59813 ) ( CLEAR ?auto_59812 ) ( IS-CRATE ?auto_59804 ) ( not ( = ?auto_59803 ?auto_59812 ) ) ( not ( = ?auto_59804 ?auto_59812 ) ) ( not ( = ?auto_59808 ?auto_59812 ) ) ( AVAILABLE ?auto_59807 ) ( TRUCK-AT ?auto_59805 ?auto_59811 ) ( not ( = ?auto_59811 ?auto_59813 ) ) ( not ( = ?auto_59809 ?auto_59811 ) ) ( HOIST-AT ?auto_59810 ?auto_59811 ) ( not ( = ?auto_59807 ?auto_59810 ) ) ( not ( = ?auto_59806 ?auto_59810 ) ) ( AVAILABLE ?auto_59810 ) ( SURFACE-AT ?auto_59804 ?auto_59811 ) ( ON ?auto_59804 ?auto_59814 ) ( CLEAR ?auto_59804 ) ( not ( = ?auto_59803 ?auto_59814 ) ) ( not ( = ?auto_59804 ?auto_59814 ) ) ( not ( = ?auto_59808 ?auto_59814 ) ) ( not ( = ?auto_59812 ?auto_59814 ) ) )
    :subtasks
    ( ( !LIFT ?auto_59810 ?auto_59804 ?auto_59814 ?auto_59811 )
      ( MAKE-ON ?auto_59803 ?auto_59804 )
      ( MAKE-ON-VERIFY ?auto_59803 ?auto_59804 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59815 - SURFACE
      ?auto_59816 - SURFACE
    )
    :vars
    (
      ?auto_59824 - HOIST
      ?auto_59818 - PLACE
      ?auto_59825 - PLACE
      ?auto_59819 - HOIST
      ?auto_59820 - SURFACE
      ?auto_59817 - SURFACE
      ?auto_59821 - PLACE
      ?auto_59822 - HOIST
      ?auto_59823 - SURFACE
      ?auto_59826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_59824 ?auto_59818 ) ( IS-CRATE ?auto_59815 ) ( not ( = ?auto_59815 ?auto_59816 ) ) ( not ( = ?auto_59825 ?auto_59818 ) ) ( HOIST-AT ?auto_59819 ?auto_59825 ) ( not ( = ?auto_59824 ?auto_59819 ) ) ( AVAILABLE ?auto_59819 ) ( SURFACE-AT ?auto_59815 ?auto_59825 ) ( ON ?auto_59815 ?auto_59820 ) ( CLEAR ?auto_59815 ) ( not ( = ?auto_59815 ?auto_59820 ) ) ( not ( = ?auto_59816 ?auto_59820 ) ) ( SURFACE-AT ?auto_59817 ?auto_59818 ) ( CLEAR ?auto_59817 ) ( IS-CRATE ?auto_59816 ) ( not ( = ?auto_59815 ?auto_59817 ) ) ( not ( = ?auto_59816 ?auto_59817 ) ) ( not ( = ?auto_59820 ?auto_59817 ) ) ( AVAILABLE ?auto_59824 ) ( not ( = ?auto_59821 ?auto_59818 ) ) ( not ( = ?auto_59825 ?auto_59821 ) ) ( HOIST-AT ?auto_59822 ?auto_59821 ) ( not ( = ?auto_59824 ?auto_59822 ) ) ( not ( = ?auto_59819 ?auto_59822 ) ) ( AVAILABLE ?auto_59822 ) ( SURFACE-AT ?auto_59816 ?auto_59821 ) ( ON ?auto_59816 ?auto_59823 ) ( CLEAR ?auto_59816 ) ( not ( = ?auto_59815 ?auto_59823 ) ) ( not ( = ?auto_59816 ?auto_59823 ) ) ( not ( = ?auto_59820 ?auto_59823 ) ) ( not ( = ?auto_59817 ?auto_59823 ) ) ( TRUCK-AT ?auto_59826 ?auto_59818 ) )
    :subtasks
    ( ( !DRIVE ?auto_59826 ?auto_59818 ?auto_59821 )
      ( MAKE-ON ?auto_59815 ?auto_59816 )
      ( MAKE-ON-VERIFY ?auto_59815 ?auto_59816 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59827 - SURFACE
      ?auto_59828 - SURFACE
    )
    :vars
    (
      ?auto_59833 - HOIST
      ?auto_59834 - PLACE
      ?auto_59837 - PLACE
      ?auto_59836 - HOIST
      ?auto_59835 - SURFACE
      ?auto_59830 - SURFACE
      ?auto_59829 - PLACE
      ?auto_59838 - HOIST
      ?auto_59831 - SURFACE
      ?auto_59832 - TRUCK
      ?auto_59839 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59833 ?auto_59834 ) ( IS-CRATE ?auto_59827 ) ( not ( = ?auto_59827 ?auto_59828 ) ) ( not ( = ?auto_59837 ?auto_59834 ) ) ( HOIST-AT ?auto_59836 ?auto_59837 ) ( not ( = ?auto_59833 ?auto_59836 ) ) ( AVAILABLE ?auto_59836 ) ( SURFACE-AT ?auto_59827 ?auto_59837 ) ( ON ?auto_59827 ?auto_59835 ) ( CLEAR ?auto_59827 ) ( not ( = ?auto_59827 ?auto_59835 ) ) ( not ( = ?auto_59828 ?auto_59835 ) ) ( IS-CRATE ?auto_59828 ) ( not ( = ?auto_59827 ?auto_59830 ) ) ( not ( = ?auto_59828 ?auto_59830 ) ) ( not ( = ?auto_59835 ?auto_59830 ) ) ( not ( = ?auto_59829 ?auto_59834 ) ) ( not ( = ?auto_59837 ?auto_59829 ) ) ( HOIST-AT ?auto_59838 ?auto_59829 ) ( not ( = ?auto_59833 ?auto_59838 ) ) ( not ( = ?auto_59836 ?auto_59838 ) ) ( AVAILABLE ?auto_59838 ) ( SURFACE-AT ?auto_59828 ?auto_59829 ) ( ON ?auto_59828 ?auto_59831 ) ( CLEAR ?auto_59828 ) ( not ( = ?auto_59827 ?auto_59831 ) ) ( not ( = ?auto_59828 ?auto_59831 ) ) ( not ( = ?auto_59835 ?auto_59831 ) ) ( not ( = ?auto_59830 ?auto_59831 ) ) ( TRUCK-AT ?auto_59832 ?auto_59834 ) ( SURFACE-AT ?auto_59839 ?auto_59834 ) ( CLEAR ?auto_59839 ) ( LIFTING ?auto_59833 ?auto_59830 ) ( IS-CRATE ?auto_59830 ) ( not ( = ?auto_59827 ?auto_59839 ) ) ( not ( = ?auto_59828 ?auto_59839 ) ) ( not ( = ?auto_59835 ?auto_59839 ) ) ( not ( = ?auto_59830 ?auto_59839 ) ) ( not ( = ?auto_59831 ?auto_59839 ) ) )
    :subtasks
    ( ( !DROP ?auto_59833 ?auto_59830 ?auto_59839 ?auto_59834 )
      ( MAKE-ON ?auto_59827 ?auto_59828 )
      ( MAKE-ON-VERIFY ?auto_59827 ?auto_59828 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59840 - SURFACE
      ?auto_59841 - SURFACE
    )
    :vars
    (
      ?auto_59846 - HOIST
      ?auto_59843 - PLACE
      ?auto_59842 - PLACE
      ?auto_59849 - HOIST
      ?auto_59850 - SURFACE
      ?auto_59852 - SURFACE
      ?auto_59851 - PLACE
      ?auto_59845 - HOIST
      ?auto_59847 - SURFACE
      ?auto_59848 - TRUCK
      ?auto_59844 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59846 ?auto_59843 ) ( IS-CRATE ?auto_59840 ) ( not ( = ?auto_59840 ?auto_59841 ) ) ( not ( = ?auto_59842 ?auto_59843 ) ) ( HOIST-AT ?auto_59849 ?auto_59842 ) ( not ( = ?auto_59846 ?auto_59849 ) ) ( AVAILABLE ?auto_59849 ) ( SURFACE-AT ?auto_59840 ?auto_59842 ) ( ON ?auto_59840 ?auto_59850 ) ( CLEAR ?auto_59840 ) ( not ( = ?auto_59840 ?auto_59850 ) ) ( not ( = ?auto_59841 ?auto_59850 ) ) ( IS-CRATE ?auto_59841 ) ( not ( = ?auto_59840 ?auto_59852 ) ) ( not ( = ?auto_59841 ?auto_59852 ) ) ( not ( = ?auto_59850 ?auto_59852 ) ) ( not ( = ?auto_59851 ?auto_59843 ) ) ( not ( = ?auto_59842 ?auto_59851 ) ) ( HOIST-AT ?auto_59845 ?auto_59851 ) ( not ( = ?auto_59846 ?auto_59845 ) ) ( not ( = ?auto_59849 ?auto_59845 ) ) ( AVAILABLE ?auto_59845 ) ( SURFACE-AT ?auto_59841 ?auto_59851 ) ( ON ?auto_59841 ?auto_59847 ) ( CLEAR ?auto_59841 ) ( not ( = ?auto_59840 ?auto_59847 ) ) ( not ( = ?auto_59841 ?auto_59847 ) ) ( not ( = ?auto_59850 ?auto_59847 ) ) ( not ( = ?auto_59852 ?auto_59847 ) ) ( TRUCK-AT ?auto_59848 ?auto_59843 ) ( SURFACE-AT ?auto_59844 ?auto_59843 ) ( CLEAR ?auto_59844 ) ( IS-CRATE ?auto_59852 ) ( not ( = ?auto_59840 ?auto_59844 ) ) ( not ( = ?auto_59841 ?auto_59844 ) ) ( not ( = ?auto_59850 ?auto_59844 ) ) ( not ( = ?auto_59852 ?auto_59844 ) ) ( not ( = ?auto_59847 ?auto_59844 ) ) ( AVAILABLE ?auto_59846 ) ( IN ?auto_59852 ?auto_59848 ) )
    :subtasks
    ( ( !UNLOAD ?auto_59846 ?auto_59852 ?auto_59848 ?auto_59843 )
      ( MAKE-ON ?auto_59840 ?auto_59841 )
      ( MAKE-ON-VERIFY ?auto_59840 ?auto_59841 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59853 - SURFACE
      ?auto_59854 - SURFACE
    )
    :vars
    (
      ?auto_59858 - HOIST
      ?auto_59857 - PLACE
      ?auto_59856 - PLACE
      ?auto_59860 - HOIST
      ?auto_59863 - SURFACE
      ?auto_59861 - SURFACE
      ?auto_59864 - PLACE
      ?auto_59859 - HOIST
      ?auto_59865 - SURFACE
      ?auto_59862 - SURFACE
      ?auto_59855 - TRUCK
      ?auto_59866 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59858 ?auto_59857 ) ( IS-CRATE ?auto_59853 ) ( not ( = ?auto_59853 ?auto_59854 ) ) ( not ( = ?auto_59856 ?auto_59857 ) ) ( HOIST-AT ?auto_59860 ?auto_59856 ) ( not ( = ?auto_59858 ?auto_59860 ) ) ( AVAILABLE ?auto_59860 ) ( SURFACE-AT ?auto_59853 ?auto_59856 ) ( ON ?auto_59853 ?auto_59863 ) ( CLEAR ?auto_59853 ) ( not ( = ?auto_59853 ?auto_59863 ) ) ( not ( = ?auto_59854 ?auto_59863 ) ) ( IS-CRATE ?auto_59854 ) ( not ( = ?auto_59853 ?auto_59861 ) ) ( not ( = ?auto_59854 ?auto_59861 ) ) ( not ( = ?auto_59863 ?auto_59861 ) ) ( not ( = ?auto_59864 ?auto_59857 ) ) ( not ( = ?auto_59856 ?auto_59864 ) ) ( HOIST-AT ?auto_59859 ?auto_59864 ) ( not ( = ?auto_59858 ?auto_59859 ) ) ( not ( = ?auto_59860 ?auto_59859 ) ) ( AVAILABLE ?auto_59859 ) ( SURFACE-AT ?auto_59854 ?auto_59864 ) ( ON ?auto_59854 ?auto_59865 ) ( CLEAR ?auto_59854 ) ( not ( = ?auto_59853 ?auto_59865 ) ) ( not ( = ?auto_59854 ?auto_59865 ) ) ( not ( = ?auto_59863 ?auto_59865 ) ) ( not ( = ?auto_59861 ?auto_59865 ) ) ( SURFACE-AT ?auto_59862 ?auto_59857 ) ( CLEAR ?auto_59862 ) ( IS-CRATE ?auto_59861 ) ( not ( = ?auto_59853 ?auto_59862 ) ) ( not ( = ?auto_59854 ?auto_59862 ) ) ( not ( = ?auto_59863 ?auto_59862 ) ) ( not ( = ?auto_59861 ?auto_59862 ) ) ( not ( = ?auto_59865 ?auto_59862 ) ) ( AVAILABLE ?auto_59858 ) ( IN ?auto_59861 ?auto_59855 ) ( TRUCK-AT ?auto_59855 ?auto_59866 ) ( not ( = ?auto_59866 ?auto_59857 ) ) ( not ( = ?auto_59856 ?auto_59866 ) ) ( not ( = ?auto_59864 ?auto_59866 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_59855 ?auto_59866 ?auto_59857 )
      ( MAKE-ON ?auto_59853 ?auto_59854 )
      ( MAKE-ON-VERIFY ?auto_59853 ?auto_59854 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59867 - SURFACE
      ?auto_59868 - SURFACE
    )
    :vars
    (
      ?auto_59878 - HOIST
      ?auto_59874 - PLACE
      ?auto_59880 - PLACE
      ?auto_59870 - HOIST
      ?auto_59876 - SURFACE
      ?auto_59879 - SURFACE
      ?auto_59869 - PLACE
      ?auto_59873 - HOIST
      ?auto_59875 - SURFACE
      ?auto_59871 - SURFACE
      ?auto_59877 - TRUCK
      ?auto_59872 - PLACE
      ?auto_59881 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_59878 ?auto_59874 ) ( IS-CRATE ?auto_59867 ) ( not ( = ?auto_59867 ?auto_59868 ) ) ( not ( = ?auto_59880 ?auto_59874 ) ) ( HOIST-AT ?auto_59870 ?auto_59880 ) ( not ( = ?auto_59878 ?auto_59870 ) ) ( AVAILABLE ?auto_59870 ) ( SURFACE-AT ?auto_59867 ?auto_59880 ) ( ON ?auto_59867 ?auto_59876 ) ( CLEAR ?auto_59867 ) ( not ( = ?auto_59867 ?auto_59876 ) ) ( not ( = ?auto_59868 ?auto_59876 ) ) ( IS-CRATE ?auto_59868 ) ( not ( = ?auto_59867 ?auto_59879 ) ) ( not ( = ?auto_59868 ?auto_59879 ) ) ( not ( = ?auto_59876 ?auto_59879 ) ) ( not ( = ?auto_59869 ?auto_59874 ) ) ( not ( = ?auto_59880 ?auto_59869 ) ) ( HOIST-AT ?auto_59873 ?auto_59869 ) ( not ( = ?auto_59878 ?auto_59873 ) ) ( not ( = ?auto_59870 ?auto_59873 ) ) ( AVAILABLE ?auto_59873 ) ( SURFACE-AT ?auto_59868 ?auto_59869 ) ( ON ?auto_59868 ?auto_59875 ) ( CLEAR ?auto_59868 ) ( not ( = ?auto_59867 ?auto_59875 ) ) ( not ( = ?auto_59868 ?auto_59875 ) ) ( not ( = ?auto_59876 ?auto_59875 ) ) ( not ( = ?auto_59879 ?auto_59875 ) ) ( SURFACE-AT ?auto_59871 ?auto_59874 ) ( CLEAR ?auto_59871 ) ( IS-CRATE ?auto_59879 ) ( not ( = ?auto_59867 ?auto_59871 ) ) ( not ( = ?auto_59868 ?auto_59871 ) ) ( not ( = ?auto_59876 ?auto_59871 ) ) ( not ( = ?auto_59879 ?auto_59871 ) ) ( not ( = ?auto_59875 ?auto_59871 ) ) ( AVAILABLE ?auto_59878 ) ( TRUCK-AT ?auto_59877 ?auto_59872 ) ( not ( = ?auto_59872 ?auto_59874 ) ) ( not ( = ?auto_59880 ?auto_59872 ) ) ( not ( = ?auto_59869 ?auto_59872 ) ) ( HOIST-AT ?auto_59881 ?auto_59872 ) ( LIFTING ?auto_59881 ?auto_59879 ) ( not ( = ?auto_59878 ?auto_59881 ) ) ( not ( = ?auto_59870 ?auto_59881 ) ) ( not ( = ?auto_59873 ?auto_59881 ) ) )
    :subtasks
    ( ( !LOAD ?auto_59881 ?auto_59879 ?auto_59877 ?auto_59872 )
      ( MAKE-ON ?auto_59867 ?auto_59868 )
      ( MAKE-ON-VERIFY ?auto_59867 ?auto_59868 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59882 - SURFACE
      ?auto_59883 - SURFACE
    )
    :vars
    (
      ?auto_59895 - HOIST
      ?auto_59884 - PLACE
      ?auto_59894 - PLACE
      ?auto_59896 - HOIST
      ?auto_59885 - SURFACE
      ?auto_59888 - SURFACE
      ?auto_59891 - PLACE
      ?auto_59890 - HOIST
      ?auto_59893 - SURFACE
      ?auto_59886 - SURFACE
      ?auto_59889 - TRUCK
      ?auto_59887 - PLACE
      ?auto_59892 - HOIST
      ?auto_59897 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59895 ?auto_59884 ) ( IS-CRATE ?auto_59882 ) ( not ( = ?auto_59882 ?auto_59883 ) ) ( not ( = ?auto_59894 ?auto_59884 ) ) ( HOIST-AT ?auto_59896 ?auto_59894 ) ( not ( = ?auto_59895 ?auto_59896 ) ) ( AVAILABLE ?auto_59896 ) ( SURFACE-AT ?auto_59882 ?auto_59894 ) ( ON ?auto_59882 ?auto_59885 ) ( CLEAR ?auto_59882 ) ( not ( = ?auto_59882 ?auto_59885 ) ) ( not ( = ?auto_59883 ?auto_59885 ) ) ( IS-CRATE ?auto_59883 ) ( not ( = ?auto_59882 ?auto_59888 ) ) ( not ( = ?auto_59883 ?auto_59888 ) ) ( not ( = ?auto_59885 ?auto_59888 ) ) ( not ( = ?auto_59891 ?auto_59884 ) ) ( not ( = ?auto_59894 ?auto_59891 ) ) ( HOIST-AT ?auto_59890 ?auto_59891 ) ( not ( = ?auto_59895 ?auto_59890 ) ) ( not ( = ?auto_59896 ?auto_59890 ) ) ( AVAILABLE ?auto_59890 ) ( SURFACE-AT ?auto_59883 ?auto_59891 ) ( ON ?auto_59883 ?auto_59893 ) ( CLEAR ?auto_59883 ) ( not ( = ?auto_59882 ?auto_59893 ) ) ( not ( = ?auto_59883 ?auto_59893 ) ) ( not ( = ?auto_59885 ?auto_59893 ) ) ( not ( = ?auto_59888 ?auto_59893 ) ) ( SURFACE-AT ?auto_59886 ?auto_59884 ) ( CLEAR ?auto_59886 ) ( IS-CRATE ?auto_59888 ) ( not ( = ?auto_59882 ?auto_59886 ) ) ( not ( = ?auto_59883 ?auto_59886 ) ) ( not ( = ?auto_59885 ?auto_59886 ) ) ( not ( = ?auto_59888 ?auto_59886 ) ) ( not ( = ?auto_59893 ?auto_59886 ) ) ( AVAILABLE ?auto_59895 ) ( TRUCK-AT ?auto_59889 ?auto_59887 ) ( not ( = ?auto_59887 ?auto_59884 ) ) ( not ( = ?auto_59894 ?auto_59887 ) ) ( not ( = ?auto_59891 ?auto_59887 ) ) ( HOIST-AT ?auto_59892 ?auto_59887 ) ( not ( = ?auto_59895 ?auto_59892 ) ) ( not ( = ?auto_59896 ?auto_59892 ) ) ( not ( = ?auto_59890 ?auto_59892 ) ) ( AVAILABLE ?auto_59892 ) ( SURFACE-AT ?auto_59888 ?auto_59887 ) ( ON ?auto_59888 ?auto_59897 ) ( CLEAR ?auto_59888 ) ( not ( = ?auto_59882 ?auto_59897 ) ) ( not ( = ?auto_59883 ?auto_59897 ) ) ( not ( = ?auto_59885 ?auto_59897 ) ) ( not ( = ?auto_59888 ?auto_59897 ) ) ( not ( = ?auto_59893 ?auto_59897 ) ) ( not ( = ?auto_59886 ?auto_59897 ) ) )
    :subtasks
    ( ( !LIFT ?auto_59892 ?auto_59888 ?auto_59897 ?auto_59887 )
      ( MAKE-ON ?auto_59882 ?auto_59883 )
      ( MAKE-ON-VERIFY ?auto_59882 ?auto_59883 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59898 - SURFACE
      ?auto_59899 - SURFACE
    )
    :vars
    (
      ?auto_59900 - HOIST
      ?auto_59906 - PLACE
      ?auto_59913 - PLACE
      ?auto_59905 - HOIST
      ?auto_59909 - SURFACE
      ?auto_59903 - SURFACE
      ?auto_59907 - PLACE
      ?auto_59902 - HOIST
      ?auto_59912 - SURFACE
      ?auto_59908 - SURFACE
      ?auto_59911 - PLACE
      ?auto_59910 - HOIST
      ?auto_59904 - SURFACE
      ?auto_59901 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_59900 ?auto_59906 ) ( IS-CRATE ?auto_59898 ) ( not ( = ?auto_59898 ?auto_59899 ) ) ( not ( = ?auto_59913 ?auto_59906 ) ) ( HOIST-AT ?auto_59905 ?auto_59913 ) ( not ( = ?auto_59900 ?auto_59905 ) ) ( AVAILABLE ?auto_59905 ) ( SURFACE-AT ?auto_59898 ?auto_59913 ) ( ON ?auto_59898 ?auto_59909 ) ( CLEAR ?auto_59898 ) ( not ( = ?auto_59898 ?auto_59909 ) ) ( not ( = ?auto_59899 ?auto_59909 ) ) ( IS-CRATE ?auto_59899 ) ( not ( = ?auto_59898 ?auto_59903 ) ) ( not ( = ?auto_59899 ?auto_59903 ) ) ( not ( = ?auto_59909 ?auto_59903 ) ) ( not ( = ?auto_59907 ?auto_59906 ) ) ( not ( = ?auto_59913 ?auto_59907 ) ) ( HOIST-AT ?auto_59902 ?auto_59907 ) ( not ( = ?auto_59900 ?auto_59902 ) ) ( not ( = ?auto_59905 ?auto_59902 ) ) ( AVAILABLE ?auto_59902 ) ( SURFACE-AT ?auto_59899 ?auto_59907 ) ( ON ?auto_59899 ?auto_59912 ) ( CLEAR ?auto_59899 ) ( not ( = ?auto_59898 ?auto_59912 ) ) ( not ( = ?auto_59899 ?auto_59912 ) ) ( not ( = ?auto_59909 ?auto_59912 ) ) ( not ( = ?auto_59903 ?auto_59912 ) ) ( SURFACE-AT ?auto_59908 ?auto_59906 ) ( CLEAR ?auto_59908 ) ( IS-CRATE ?auto_59903 ) ( not ( = ?auto_59898 ?auto_59908 ) ) ( not ( = ?auto_59899 ?auto_59908 ) ) ( not ( = ?auto_59909 ?auto_59908 ) ) ( not ( = ?auto_59903 ?auto_59908 ) ) ( not ( = ?auto_59912 ?auto_59908 ) ) ( AVAILABLE ?auto_59900 ) ( not ( = ?auto_59911 ?auto_59906 ) ) ( not ( = ?auto_59913 ?auto_59911 ) ) ( not ( = ?auto_59907 ?auto_59911 ) ) ( HOIST-AT ?auto_59910 ?auto_59911 ) ( not ( = ?auto_59900 ?auto_59910 ) ) ( not ( = ?auto_59905 ?auto_59910 ) ) ( not ( = ?auto_59902 ?auto_59910 ) ) ( AVAILABLE ?auto_59910 ) ( SURFACE-AT ?auto_59903 ?auto_59911 ) ( ON ?auto_59903 ?auto_59904 ) ( CLEAR ?auto_59903 ) ( not ( = ?auto_59898 ?auto_59904 ) ) ( not ( = ?auto_59899 ?auto_59904 ) ) ( not ( = ?auto_59909 ?auto_59904 ) ) ( not ( = ?auto_59903 ?auto_59904 ) ) ( not ( = ?auto_59912 ?auto_59904 ) ) ( not ( = ?auto_59908 ?auto_59904 ) ) ( TRUCK-AT ?auto_59901 ?auto_59906 ) )
    :subtasks
    ( ( !DRIVE ?auto_59901 ?auto_59906 ?auto_59911 )
      ( MAKE-ON ?auto_59898 ?auto_59899 )
      ( MAKE-ON-VERIFY ?auto_59898 ?auto_59899 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59914 - SURFACE
      ?auto_59915 - SURFACE
    )
    :vars
    (
      ?auto_59926 - HOIST
      ?auto_59924 - PLACE
      ?auto_59925 - PLACE
      ?auto_59920 - HOIST
      ?auto_59922 - SURFACE
      ?auto_59919 - SURFACE
      ?auto_59917 - PLACE
      ?auto_59923 - HOIST
      ?auto_59916 - SURFACE
      ?auto_59927 - SURFACE
      ?auto_59918 - PLACE
      ?auto_59929 - HOIST
      ?auto_59921 - SURFACE
      ?auto_59928 - TRUCK
      ?auto_59930 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59926 ?auto_59924 ) ( IS-CRATE ?auto_59914 ) ( not ( = ?auto_59914 ?auto_59915 ) ) ( not ( = ?auto_59925 ?auto_59924 ) ) ( HOIST-AT ?auto_59920 ?auto_59925 ) ( not ( = ?auto_59926 ?auto_59920 ) ) ( AVAILABLE ?auto_59920 ) ( SURFACE-AT ?auto_59914 ?auto_59925 ) ( ON ?auto_59914 ?auto_59922 ) ( CLEAR ?auto_59914 ) ( not ( = ?auto_59914 ?auto_59922 ) ) ( not ( = ?auto_59915 ?auto_59922 ) ) ( IS-CRATE ?auto_59915 ) ( not ( = ?auto_59914 ?auto_59919 ) ) ( not ( = ?auto_59915 ?auto_59919 ) ) ( not ( = ?auto_59922 ?auto_59919 ) ) ( not ( = ?auto_59917 ?auto_59924 ) ) ( not ( = ?auto_59925 ?auto_59917 ) ) ( HOIST-AT ?auto_59923 ?auto_59917 ) ( not ( = ?auto_59926 ?auto_59923 ) ) ( not ( = ?auto_59920 ?auto_59923 ) ) ( AVAILABLE ?auto_59923 ) ( SURFACE-AT ?auto_59915 ?auto_59917 ) ( ON ?auto_59915 ?auto_59916 ) ( CLEAR ?auto_59915 ) ( not ( = ?auto_59914 ?auto_59916 ) ) ( not ( = ?auto_59915 ?auto_59916 ) ) ( not ( = ?auto_59922 ?auto_59916 ) ) ( not ( = ?auto_59919 ?auto_59916 ) ) ( IS-CRATE ?auto_59919 ) ( not ( = ?auto_59914 ?auto_59927 ) ) ( not ( = ?auto_59915 ?auto_59927 ) ) ( not ( = ?auto_59922 ?auto_59927 ) ) ( not ( = ?auto_59919 ?auto_59927 ) ) ( not ( = ?auto_59916 ?auto_59927 ) ) ( not ( = ?auto_59918 ?auto_59924 ) ) ( not ( = ?auto_59925 ?auto_59918 ) ) ( not ( = ?auto_59917 ?auto_59918 ) ) ( HOIST-AT ?auto_59929 ?auto_59918 ) ( not ( = ?auto_59926 ?auto_59929 ) ) ( not ( = ?auto_59920 ?auto_59929 ) ) ( not ( = ?auto_59923 ?auto_59929 ) ) ( AVAILABLE ?auto_59929 ) ( SURFACE-AT ?auto_59919 ?auto_59918 ) ( ON ?auto_59919 ?auto_59921 ) ( CLEAR ?auto_59919 ) ( not ( = ?auto_59914 ?auto_59921 ) ) ( not ( = ?auto_59915 ?auto_59921 ) ) ( not ( = ?auto_59922 ?auto_59921 ) ) ( not ( = ?auto_59919 ?auto_59921 ) ) ( not ( = ?auto_59916 ?auto_59921 ) ) ( not ( = ?auto_59927 ?auto_59921 ) ) ( TRUCK-AT ?auto_59928 ?auto_59924 ) ( SURFACE-AT ?auto_59930 ?auto_59924 ) ( CLEAR ?auto_59930 ) ( LIFTING ?auto_59926 ?auto_59927 ) ( IS-CRATE ?auto_59927 ) ( not ( = ?auto_59914 ?auto_59930 ) ) ( not ( = ?auto_59915 ?auto_59930 ) ) ( not ( = ?auto_59922 ?auto_59930 ) ) ( not ( = ?auto_59919 ?auto_59930 ) ) ( not ( = ?auto_59916 ?auto_59930 ) ) ( not ( = ?auto_59927 ?auto_59930 ) ) ( not ( = ?auto_59921 ?auto_59930 ) ) )
    :subtasks
    ( ( !DROP ?auto_59926 ?auto_59927 ?auto_59930 ?auto_59924 )
      ( MAKE-ON ?auto_59914 ?auto_59915 )
      ( MAKE-ON-VERIFY ?auto_59914 ?auto_59915 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59931 - SURFACE
      ?auto_59932 - SURFACE
    )
    :vars
    (
      ?auto_59941 - HOIST
      ?auto_59940 - PLACE
      ?auto_59946 - PLACE
      ?auto_59936 - HOIST
      ?auto_59943 - SURFACE
      ?auto_59935 - SURFACE
      ?auto_59944 - PLACE
      ?auto_59933 - HOIST
      ?auto_59938 - SURFACE
      ?auto_59937 - SURFACE
      ?auto_59939 - PLACE
      ?auto_59947 - HOIST
      ?auto_59934 - SURFACE
      ?auto_59942 - TRUCK
      ?auto_59945 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59941 ?auto_59940 ) ( IS-CRATE ?auto_59931 ) ( not ( = ?auto_59931 ?auto_59932 ) ) ( not ( = ?auto_59946 ?auto_59940 ) ) ( HOIST-AT ?auto_59936 ?auto_59946 ) ( not ( = ?auto_59941 ?auto_59936 ) ) ( AVAILABLE ?auto_59936 ) ( SURFACE-AT ?auto_59931 ?auto_59946 ) ( ON ?auto_59931 ?auto_59943 ) ( CLEAR ?auto_59931 ) ( not ( = ?auto_59931 ?auto_59943 ) ) ( not ( = ?auto_59932 ?auto_59943 ) ) ( IS-CRATE ?auto_59932 ) ( not ( = ?auto_59931 ?auto_59935 ) ) ( not ( = ?auto_59932 ?auto_59935 ) ) ( not ( = ?auto_59943 ?auto_59935 ) ) ( not ( = ?auto_59944 ?auto_59940 ) ) ( not ( = ?auto_59946 ?auto_59944 ) ) ( HOIST-AT ?auto_59933 ?auto_59944 ) ( not ( = ?auto_59941 ?auto_59933 ) ) ( not ( = ?auto_59936 ?auto_59933 ) ) ( AVAILABLE ?auto_59933 ) ( SURFACE-AT ?auto_59932 ?auto_59944 ) ( ON ?auto_59932 ?auto_59938 ) ( CLEAR ?auto_59932 ) ( not ( = ?auto_59931 ?auto_59938 ) ) ( not ( = ?auto_59932 ?auto_59938 ) ) ( not ( = ?auto_59943 ?auto_59938 ) ) ( not ( = ?auto_59935 ?auto_59938 ) ) ( IS-CRATE ?auto_59935 ) ( not ( = ?auto_59931 ?auto_59937 ) ) ( not ( = ?auto_59932 ?auto_59937 ) ) ( not ( = ?auto_59943 ?auto_59937 ) ) ( not ( = ?auto_59935 ?auto_59937 ) ) ( not ( = ?auto_59938 ?auto_59937 ) ) ( not ( = ?auto_59939 ?auto_59940 ) ) ( not ( = ?auto_59946 ?auto_59939 ) ) ( not ( = ?auto_59944 ?auto_59939 ) ) ( HOIST-AT ?auto_59947 ?auto_59939 ) ( not ( = ?auto_59941 ?auto_59947 ) ) ( not ( = ?auto_59936 ?auto_59947 ) ) ( not ( = ?auto_59933 ?auto_59947 ) ) ( AVAILABLE ?auto_59947 ) ( SURFACE-AT ?auto_59935 ?auto_59939 ) ( ON ?auto_59935 ?auto_59934 ) ( CLEAR ?auto_59935 ) ( not ( = ?auto_59931 ?auto_59934 ) ) ( not ( = ?auto_59932 ?auto_59934 ) ) ( not ( = ?auto_59943 ?auto_59934 ) ) ( not ( = ?auto_59935 ?auto_59934 ) ) ( not ( = ?auto_59938 ?auto_59934 ) ) ( not ( = ?auto_59937 ?auto_59934 ) ) ( TRUCK-AT ?auto_59942 ?auto_59940 ) ( SURFACE-AT ?auto_59945 ?auto_59940 ) ( CLEAR ?auto_59945 ) ( IS-CRATE ?auto_59937 ) ( not ( = ?auto_59931 ?auto_59945 ) ) ( not ( = ?auto_59932 ?auto_59945 ) ) ( not ( = ?auto_59943 ?auto_59945 ) ) ( not ( = ?auto_59935 ?auto_59945 ) ) ( not ( = ?auto_59938 ?auto_59945 ) ) ( not ( = ?auto_59937 ?auto_59945 ) ) ( not ( = ?auto_59934 ?auto_59945 ) ) ( AVAILABLE ?auto_59941 ) ( IN ?auto_59937 ?auto_59942 ) )
    :subtasks
    ( ( !UNLOAD ?auto_59941 ?auto_59937 ?auto_59942 ?auto_59940 )
      ( MAKE-ON ?auto_59931 ?auto_59932 )
      ( MAKE-ON-VERIFY ?auto_59931 ?auto_59932 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59948 - SURFACE
      ?auto_59949 - SURFACE
    )
    :vars
    (
      ?auto_59959 - HOIST
      ?auto_59964 - PLACE
      ?auto_59962 - PLACE
      ?auto_59951 - HOIST
      ?auto_59956 - SURFACE
      ?auto_59960 - SURFACE
      ?auto_59963 - PLACE
      ?auto_59953 - HOIST
      ?auto_59961 - SURFACE
      ?auto_59957 - SURFACE
      ?auto_59950 - PLACE
      ?auto_59952 - HOIST
      ?auto_59954 - SURFACE
      ?auto_59955 - SURFACE
      ?auto_59958 - TRUCK
      ?auto_59965 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59959 ?auto_59964 ) ( IS-CRATE ?auto_59948 ) ( not ( = ?auto_59948 ?auto_59949 ) ) ( not ( = ?auto_59962 ?auto_59964 ) ) ( HOIST-AT ?auto_59951 ?auto_59962 ) ( not ( = ?auto_59959 ?auto_59951 ) ) ( AVAILABLE ?auto_59951 ) ( SURFACE-AT ?auto_59948 ?auto_59962 ) ( ON ?auto_59948 ?auto_59956 ) ( CLEAR ?auto_59948 ) ( not ( = ?auto_59948 ?auto_59956 ) ) ( not ( = ?auto_59949 ?auto_59956 ) ) ( IS-CRATE ?auto_59949 ) ( not ( = ?auto_59948 ?auto_59960 ) ) ( not ( = ?auto_59949 ?auto_59960 ) ) ( not ( = ?auto_59956 ?auto_59960 ) ) ( not ( = ?auto_59963 ?auto_59964 ) ) ( not ( = ?auto_59962 ?auto_59963 ) ) ( HOIST-AT ?auto_59953 ?auto_59963 ) ( not ( = ?auto_59959 ?auto_59953 ) ) ( not ( = ?auto_59951 ?auto_59953 ) ) ( AVAILABLE ?auto_59953 ) ( SURFACE-AT ?auto_59949 ?auto_59963 ) ( ON ?auto_59949 ?auto_59961 ) ( CLEAR ?auto_59949 ) ( not ( = ?auto_59948 ?auto_59961 ) ) ( not ( = ?auto_59949 ?auto_59961 ) ) ( not ( = ?auto_59956 ?auto_59961 ) ) ( not ( = ?auto_59960 ?auto_59961 ) ) ( IS-CRATE ?auto_59960 ) ( not ( = ?auto_59948 ?auto_59957 ) ) ( not ( = ?auto_59949 ?auto_59957 ) ) ( not ( = ?auto_59956 ?auto_59957 ) ) ( not ( = ?auto_59960 ?auto_59957 ) ) ( not ( = ?auto_59961 ?auto_59957 ) ) ( not ( = ?auto_59950 ?auto_59964 ) ) ( not ( = ?auto_59962 ?auto_59950 ) ) ( not ( = ?auto_59963 ?auto_59950 ) ) ( HOIST-AT ?auto_59952 ?auto_59950 ) ( not ( = ?auto_59959 ?auto_59952 ) ) ( not ( = ?auto_59951 ?auto_59952 ) ) ( not ( = ?auto_59953 ?auto_59952 ) ) ( AVAILABLE ?auto_59952 ) ( SURFACE-AT ?auto_59960 ?auto_59950 ) ( ON ?auto_59960 ?auto_59954 ) ( CLEAR ?auto_59960 ) ( not ( = ?auto_59948 ?auto_59954 ) ) ( not ( = ?auto_59949 ?auto_59954 ) ) ( not ( = ?auto_59956 ?auto_59954 ) ) ( not ( = ?auto_59960 ?auto_59954 ) ) ( not ( = ?auto_59961 ?auto_59954 ) ) ( not ( = ?auto_59957 ?auto_59954 ) ) ( SURFACE-AT ?auto_59955 ?auto_59964 ) ( CLEAR ?auto_59955 ) ( IS-CRATE ?auto_59957 ) ( not ( = ?auto_59948 ?auto_59955 ) ) ( not ( = ?auto_59949 ?auto_59955 ) ) ( not ( = ?auto_59956 ?auto_59955 ) ) ( not ( = ?auto_59960 ?auto_59955 ) ) ( not ( = ?auto_59961 ?auto_59955 ) ) ( not ( = ?auto_59957 ?auto_59955 ) ) ( not ( = ?auto_59954 ?auto_59955 ) ) ( AVAILABLE ?auto_59959 ) ( IN ?auto_59957 ?auto_59958 ) ( TRUCK-AT ?auto_59958 ?auto_59965 ) ( not ( = ?auto_59965 ?auto_59964 ) ) ( not ( = ?auto_59962 ?auto_59965 ) ) ( not ( = ?auto_59963 ?auto_59965 ) ) ( not ( = ?auto_59950 ?auto_59965 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_59958 ?auto_59965 ?auto_59964 )
      ( MAKE-ON ?auto_59948 ?auto_59949 )
      ( MAKE-ON-VERIFY ?auto_59948 ?auto_59949 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59966 - SURFACE
      ?auto_59967 - SURFACE
    )
    :vars
    (
      ?auto_59983 - HOIST
      ?auto_59972 - PLACE
      ?auto_59977 - PLACE
      ?auto_59969 - HOIST
      ?auto_59981 - SURFACE
      ?auto_59978 - SURFACE
      ?auto_59968 - PLACE
      ?auto_59975 - HOIST
      ?auto_59970 - SURFACE
      ?auto_59980 - SURFACE
      ?auto_59973 - PLACE
      ?auto_59971 - HOIST
      ?auto_59982 - SURFACE
      ?auto_59974 - SURFACE
      ?auto_59976 - TRUCK
      ?auto_59979 - PLACE
      ?auto_59984 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_59983 ?auto_59972 ) ( IS-CRATE ?auto_59966 ) ( not ( = ?auto_59966 ?auto_59967 ) ) ( not ( = ?auto_59977 ?auto_59972 ) ) ( HOIST-AT ?auto_59969 ?auto_59977 ) ( not ( = ?auto_59983 ?auto_59969 ) ) ( AVAILABLE ?auto_59969 ) ( SURFACE-AT ?auto_59966 ?auto_59977 ) ( ON ?auto_59966 ?auto_59981 ) ( CLEAR ?auto_59966 ) ( not ( = ?auto_59966 ?auto_59981 ) ) ( not ( = ?auto_59967 ?auto_59981 ) ) ( IS-CRATE ?auto_59967 ) ( not ( = ?auto_59966 ?auto_59978 ) ) ( not ( = ?auto_59967 ?auto_59978 ) ) ( not ( = ?auto_59981 ?auto_59978 ) ) ( not ( = ?auto_59968 ?auto_59972 ) ) ( not ( = ?auto_59977 ?auto_59968 ) ) ( HOIST-AT ?auto_59975 ?auto_59968 ) ( not ( = ?auto_59983 ?auto_59975 ) ) ( not ( = ?auto_59969 ?auto_59975 ) ) ( AVAILABLE ?auto_59975 ) ( SURFACE-AT ?auto_59967 ?auto_59968 ) ( ON ?auto_59967 ?auto_59970 ) ( CLEAR ?auto_59967 ) ( not ( = ?auto_59966 ?auto_59970 ) ) ( not ( = ?auto_59967 ?auto_59970 ) ) ( not ( = ?auto_59981 ?auto_59970 ) ) ( not ( = ?auto_59978 ?auto_59970 ) ) ( IS-CRATE ?auto_59978 ) ( not ( = ?auto_59966 ?auto_59980 ) ) ( not ( = ?auto_59967 ?auto_59980 ) ) ( not ( = ?auto_59981 ?auto_59980 ) ) ( not ( = ?auto_59978 ?auto_59980 ) ) ( not ( = ?auto_59970 ?auto_59980 ) ) ( not ( = ?auto_59973 ?auto_59972 ) ) ( not ( = ?auto_59977 ?auto_59973 ) ) ( not ( = ?auto_59968 ?auto_59973 ) ) ( HOIST-AT ?auto_59971 ?auto_59973 ) ( not ( = ?auto_59983 ?auto_59971 ) ) ( not ( = ?auto_59969 ?auto_59971 ) ) ( not ( = ?auto_59975 ?auto_59971 ) ) ( AVAILABLE ?auto_59971 ) ( SURFACE-AT ?auto_59978 ?auto_59973 ) ( ON ?auto_59978 ?auto_59982 ) ( CLEAR ?auto_59978 ) ( not ( = ?auto_59966 ?auto_59982 ) ) ( not ( = ?auto_59967 ?auto_59982 ) ) ( not ( = ?auto_59981 ?auto_59982 ) ) ( not ( = ?auto_59978 ?auto_59982 ) ) ( not ( = ?auto_59970 ?auto_59982 ) ) ( not ( = ?auto_59980 ?auto_59982 ) ) ( SURFACE-AT ?auto_59974 ?auto_59972 ) ( CLEAR ?auto_59974 ) ( IS-CRATE ?auto_59980 ) ( not ( = ?auto_59966 ?auto_59974 ) ) ( not ( = ?auto_59967 ?auto_59974 ) ) ( not ( = ?auto_59981 ?auto_59974 ) ) ( not ( = ?auto_59978 ?auto_59974 ) ) ( not ( = ?auto_59970 ?auto_59974 ) ) ( not ( = ?auto_59980 ?auto_59974 ) ) ( not ( = ?auto_59982 ?auto_59974 ) ) ( AVAILABLE ?auto_59983 ) ( TRUCK-AT ?auto_59976 ?auto_59979 ) ( not ( = ?auto_59979 ?auto_59972 ) ) ( not ( = ?auto_59977 ?auto_59979 ) ) ( not ( = ?auto_59968 ?auto_59979 ) ) ( not ( = ?auto_59973 ?auto_59979 ) ) ( HOIST-AT ?auto_59984 ?auto_59979 ) ( LIFTING ?auto_59984 ?auto_59980 ) ( not ( = ?auto_59983 ?auto_59984 ) ) ( not ( = ?auto_59969 ?auto_59984 ) ) ( not ( = ?auto_59975 ?auto_59984 ) ) ( not ( = ?auto_59971 ?auto_59984 ) ) )
    :subtasks
    ( ( !LOAD ?auto_59984 ?auto_59980 ?auto_59976 ?auto_59979 )
      ( MAKE-ON ?auto_59966 ?auto_59967 )
      ( MAKE-ON-VERIFY ?auto_59966 ?auto_59967 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_59985 - SURFACE
      ?auto_59986 - SURFACE
    )
    :vars
    (
      ?auto_59996 - HOIST
      ?auto_59999 - PLACE
      ?auto_59987 - PLACE
      ?auto_59997 - HOIST
      ?auto_59998 - SURFACE
      ?auto_59991 - SURFACE
      ?auto_60000 - PLACE
      ?auto_59995 - HOIST
      ?auto_60003 - SURFACE
      ?auto_59993 - SURFACE
      ?auto_59992 - PLACE
      ?auto_59994 - HOIST
      ?auto_60001 - SURFACE
      ?auto_59989 - SURFACE
      ?auto_59988 - TRUCK
      ?auto_60002 - PLACE
      ?auto_59990 - HOIST
      ?auto_60004 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_59996 ?auto_59999 ) ( IS-CRATE ?auto_59985 ) ( not ( = ?auto_59985 ?auto_59986 ) ) ( not ( = ?auto_59987 ?auto_59999 ) ) ( HOIST-AT ?auto_59997 ?auto_59987 ) ( not ( = ?auto_59996 ?auto_59997 ) ) ( AVAILABLE ?auto_59997 ) ( SURFACE-AT ?auto_59985 ?auto_59987 ) ( ON ?auto_59985 ?auto_59998 ) ( CLEAR ?auto_59985 ) ( not ( = ?auto_59985 ?auto_59998 ) ) ( not ( = ?auto_59986 ?auto_59998 ) ) ( IS-CRATE ?auto_59986 ) ( not ( = ?auto_59985 ?auto_59991 ) ) ( not ( = ?auto_59986 ?auto_59991 ) ) ( not ( = ?auto_59998 ?auto_59991 ) ) ( not ( = ?auto_60000 ?auto_59999 ) ) ( not ( = ?auto_59987 ?auto_60000 ) ) ( HOIST-AT ?auto_59995 ?auto_60000 ) ( not ( = ?auto_59996 ?auto_59995 ) ) ( not ( = ?auto_59997 ?auto_59995 ) ) ( AVAILABLE ?auto_59995 ) ( SURFACE-AT ?auto_59986 ?auto_60000 ) ( ON ?auto_59986 ?auto_60003 ) ( CLEAR ?auto_59986 ) ( not ( = ?auto_59985 ?auto_60003 ) ) ( not ( = ?auto_59986 ?auto_60003 ) ) ( not ( = ?auto_59998 ?auto_60003 ) ) ( not ( = ?auto_59991 ?auto_60003 ) ) ( IS-CRATE ?auto_59991 ) ( not ( = ?auto_59985 ?auto_59993 ) ) ( not ( = ?auto_59986 ?auto_59993 ) ) ( not ( = ?auto_59998 ?auto_59993 ) ) ( not ( = ?auto_59991 ?auto_59993 ) ) ( not ( = ?auto_60003 ?auto_59993 ) ) ( not ( = ?auto_59992 ?auto_59999 ) ) ( not ( = ?auto_59987 ?auto_59992 ) ) ( not ( = ?auto_60000 ?auto_59992 ) ) ( HOIST-AT ?auto_59994 ?auto_59992 ) ( not ( = ?auto_59996 ?auto_59994 ) ) ( not ( = ?auto_59997 ?auto_59994 ) ) ( not ( = ?auto_59995 ?auto_59994 ) ) ( AVAILABLE ?auto_59994 ) ( SURFACE-AT ?auto_59991 ?auto_59992 ) ( ON ?auto_59991 ?auto_60001 ) ( CLEAR ?auto_59991 ) ( not ( = ?auto_59985 ?auto_60001 ) ) ( not ( = ?auto_59986 ?auto_60001 ) ) ( not ( = ?auto_59998 ?auto_60001 ) ) ( not ( = ?auto_59991 ?auto_60001 ) ) ( not ( = ?auto_60003 ?auto_60001 ) ) ( not ( = ?auto_59993 ?auto_60001 ) ) ( SURFACE-AT ?auto_59989 ?auto_59999 ) ( CLEAR ?auto_59989 ) ( IS-CRATE ?auto_59993 ) ( not ( = ?auto_59985 ?auto_59989 ) ) ( not ( = ?auto_59986 ?auto_59989 ) ) ( not ( = ?auto_59998 ?auto_59989 ) ) ( not ( = ?auto_59991 ?auto_59989 ) ) ( not ( = ?auto_60003 ?auto_59989 ) ) ( not ( = ?auto_59993 ?auto_59989 ) ) ( not ( = ?auto_60001 ?auto_59989 ) ) ( AVAILABLE ?auto_59996 ) ( TRUCK-AT ?auto_59988 ?auto_60002 ) ( not ( = ?auto_60002 ?auto_59999 ) ) ( not ( = ?auto_59987 ?auto_60002 ) ) ( not ( = ?auto_60000 ?auto_60002 ) ) ( not ( = ?auto_59992 ?auto_60002 ) ) ( HOIST-AT ?auto_59990 ?auto_60002 ) ( not ( = ?auto_59996 ?auto_59990 ) ) ( not ( = ?auto_59997 ?auto_59990 ) ) ( not ( = ?auto_59995 ?auto_59990 ) ) ( not ( = ?auto_59994 ?auto_59990 ) ) ( AVAILABLE ?auto_59990 ) ( SURFACE-AT ?auto_59993 ?auto_60002 ) ( ON ?auto_59993 ?auto_60004 ) ( CLEAR ?auto_59993 ) ( not ( = ?auto_59985 ?auto_60004 ) ) ( not ( = ?auto_59986 ?auto_60004 ) ) ( not ( = ?auto_59998 ?auto_60004 ) ) ( not ( = ?auto_59991 ?auto_60004 ) ) ( not ( = ?auto_60003 ?auto_60004 ) ) ( not ( = ?auto_59993 ?auto_60004 ) ) ( not ( = ?auto_60001 ?auto_60004 ) ) ( not ( = ?auto_59989 ?auto_60004 ) ) )
    :subtasks
    ( ( !LIFT ?auto_59990 ?auto_59993 ?auto_60004 ?auto_60002 )
      ( MAKE-ON ?auto_59985 ?auto_59986 )
      ( MAKE-ON-VERIFY ?auto_59985 ?auto_59986 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60005 - SURFACE
      ?auto_60006 - SURFACE
    )
    :vars
    (
      ?auto_60010 - HOIST
      ?auto_60019 - PLACE
      ?auto_60007 - PLACE
      ?auto_60018 - HOIST
      ?auto_60016 - SURFACE
      ?auto_60009 - SURFACE
      ?auto_60017 - PLACE
      ?auto_60011 - HOIST
      ?auto_60020 - SURFACE
      ?auto_60024 - SURFACE
      ?auto_60015 - PLACE
      ?auto_60014 - HOIST
      ?auto_60021 - SURFACE
      ?auto_60013 - SURFACE
      ?auto_60023 - PLACE
      ?auto_60008 - HOIST
      ?auto_60022 - SURFACE
      ?auto_60012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60010 ?auto_60019 ) ( IS-CRATE ?auto_60005 ) ( not ( = ?auto_60005 ?auto_60006 ) ) ( not ( = ?auto_60007 ?auto_60019 ) ) ( HOIST-AT ?auto_60018 ?auto_60007 ) ( not ( = ?auto_60010 ?auto_60018 ) ) ( AVAILABLE ?auto_60018 ) ( SURFACE-AT ?auto_60005 ?auto_60007 ) ( ON ?auto_60005 ?auto_60016 ) ( CLEAR ?auto_60005 ) ( not ( = ?auto_60005 ?auto_60016 ) ) ( not ( = ?auto_60006 ?auto_60016 ) ) ( IS-CRATE ?auto_60006 ) ( not ( = ?auto_60005 ?auto_60009 ) ) ( not ( = ?auto_60006 ?auto_60009 ) ) ( not ( = ?auto_60016 ?auto_60009 ) ) ( not ( = ?auto_60017 ?auto_60019 ) ) ( not ( = ?auto_60007 ?auto_60017 ) ) ( HOIST-AT ?auto_60011 ?auto_60017 ) ( not ( = ?auto_60010 ?auto_60011 ) ) ( not ( = ?auto_60018 ?auto_60011 ) ) ( AVAILABLE ?auto_60011 ) ( SURFACE-AT ?auto_60006 ?auto_60017 ) ( ON ?auto_60006 ?auto_60020 ) ( CLEAR ?auto_60006 ) ( not ( = ?auto_60005 ?auto_60020 ) ) ( not ( = ?auto_60006 ?auto_60020 ) ) ( not ( = ?auto_60016 ?auto_60020 ) ) ( not ( = ?auto_60009 ?auto_60020 ) ) ( IS-CRATE ?auto_60009 ) ( not ( = ?auto_60005 ?auto_60024 ) ) ( not ( = ?auto_60006 ?auto_60024 ) ) ( not ( = ?auto_60016 ?auto_60024 ) ) ( not ( = ?auto_60009 ?auto_60024 ) ) ( not ( = ?auto_60020 ?auto_60024 ) ) ( not ( = ?auto_60015 ?auto_60019 ) ) ( not ( = ?auto_60007 ?auto_60015 ) ) ( not ( = ?auto_60017 ?auto_60015 ) ) ( HOIST-AT ?auto_60014 ?auto_60015 ) ( not ( = ?auto_60010 ?auto_60014 ) ) ( not ( = ?auto_60018 ?auto_60014 ) ) ( not ( = ?auto_60011 ?auto_60014 ) ) ( AVAILABLE ?auto_60014 ) ( SURFACE-AT ?auto_60009 ?auto_60015 ) ( ON ?auto_60009 ?auto_60021 ) ( CLEAR ?auto_60009 ) ( not ( = ?auto_60005 ?auto_60021 ) ) ( not ( = ?auto_60006 ?auto_60021 ) ) ( not ( = ?auto_60016 ?auto_60021 ) ) ( not ( = ?auto_60009 ?auto_60021 ) ) ( not ( = ?auto_60020 ?auto_60021 ) ) ( not ( = ?auto_60024 ?auto_60021 ) ) ( SURFACE-AT ?auto_60013 ?auto_60019 ) ( CLEAR ?auto_60013 ) ( IS-CRATE ?auto_60024 ) ( not ( = ?auto_60005 ?auto_60013 ) ) ( not ( = ?auto_60006 ?auto_60013 ) ) ( not ( = ?auto_60016 ?auto_60013 ) ) ( not ( = ?auto_60009 ?auto_60013 ) ) ( not ( = ?auto_60020 ?auto_60013 ) ) ( not ( = ?auto_60024 ?auto_60013 ) ) ( not ( = ?auto_60021 ?auto_60013 ) ) ( AVAILABLE ?auto_60010 ) ( not ( = ?auto_60023 ?auto_60019 ) ) ( not ( = ?auto_60007 ?auto_60023 ) ) ( not ( = ?auto_60017 ?auto_60023 ) ) ( not ( = ?auto_60015 ?auto_60023 ) ) ( HOIST-AT ?auto_60008 ?auto_60023 ) ( not ( = ?auto_60010 ?auto_60008 ) ) ( not ( = ?auto_60018 ?auto_60008 ) ) ( not ( = ?auto_60011 ?auto_60008 ) ) ( not ( = ?auto_60014 ?auto_60008 ) ) ( AVAILABLE ?auto_60008 ) ( SURFACE-AT ?auto_60024 ?auto_60023 ) ( ON ?auto_60024 ?auto_60022 ) ( CLEAR ?auto_60024 ) ( not ( = ?auto_60005 ?auto_60022 ) ) ( not ( = ?auto_60006 ?auto_60022 ) ) ( not ( = ?auto_60016 ?auto_60022 ) ) ( not ( = ?auto_60009 ?auto_60022 ) ) ( not ( = ?auto_60020 ?auto_60022 ) ) ( not ( = ?auto_60024 ?auto_60022 ) ) ( not ( = ?auto_60021 ?auto_60022 ) ) ( not ( = ?auto_60013 ?auto_60022 ) ) ( TRUCK-AT ?auto_60012 ?auto_60019 ) )
    :subtasks
    ( ( !DRIVE ?auto_60012 ?auto_60019 ?auto_60023 )
      ( MAKE-ON ?auto_60005 ?auto_60006 )
      ( MAKE-ON-VERIFY ?auto_60005 ?auto_60006 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60027 - SURFACE
      ?auto_60028 - SURFACE
    )
    :vars
    (
      ?auto_60029 - HOIST
      ?auto_60030 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60029 ?auto_60030 ) ( SURFACE-AT ?auto_60028 ?auto_60030 ) ( CLEAR ?auto_60028 ) ( LIFTING ?auto_60029 ?auto_60027 ) ( IS-CRATE ?auto_60027 ) ( not ( = ?auto_60027 ?auto_60028 ) ) )
    :subtasks
    ( ( !DROP ?auto_60029 ?auto_60027 ?auto_60028 ?auto_60030 )
      ( MAKE-ON-VERIFY ?auto_60027 ?auto_60028 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60031 - SURFACE
      ?auto_60032 - SURFACE
    )
    :vars
    (
      ?auto_60033 - HOIST
      ?auto_60034 - PLACE
      ?auto_60035 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60033 ?auto_60034 ) ( SURFACE-AT ?auto_60032 ?auto_60034 ) ( CLEAR ?auto_60032 ) ( IS-CRATE ?auto_60031 ) ( not ( = ?auto_60031 ?auto_60032 ) ) ( TRUCK-AT ?auto_60035 ?auto_60034 ) ( AVAILABLE ?auto_60033 ) ( IN ?auto_60031 ?auto_60035 ) )
    :subtasks
    ( ( !UNLOAD ?auto_60033 ?auto_60031 ?auto_60035 ?auto_60034 )
      ( MAKE-ON ?auto_60031 ?auto_60032 )
      ( MAKE-ON-VERIFY ?auto_60031 ?auto_60032 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60036 - SURFACE
      ?auto_60037 - SURFACE
    )
    :vars
    (
      ?auto_60038 - HOIST
      ?auto_60039 - PLACE
      ?auto_60040 - TRUCK
      ?auto_60041 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60038 ?auto_60039 ) ( SURFACE-AT ?auto_60037 ?auto_60039 ) ( CLEAR ?auto_60037 ) ( IS-CRATE ?auto_60036 ) ( not ( = ?auto_60036 ?auto_60037 ) ) ( AVAILABLE ?auto_60038 ) ( IN ?auto_60036 ?auto_60040 ) ( TRUCK-AT ?auto_60040 ?auto_60041 ) ( not ( = ?auto_60041 ?auto_60039 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_60040 ?auto_60041 ?auto_60039 )
      ( MAKE-ON ?auto_60036 ?auto_60037 )
      ( MAKE-ON-VERIFY ?auto_60036 ?auto_60037 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60042 - SURFACE
      ?auto_60043 - SURFACE
    )
    :vars
    (
      ?auto_60045 - HOIST
      ?auto_60044 - PLACE
      ?auto_60047 - TRUCK
      ?auto_60046 - PLACE
      ?auto_60048 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_60045 ?auto_60044 ) ( SURFACE-AT ?auto_60043 ?auto_60044 ) ( CLEAR ?auto_60043 ) ( IS-CRATE ?auto_60042 ) ( not ( = ?auto_60042 ?auto_60043 ) ) ( AVAILABLE ?auto_60045 ) ( TRUCK-AT ?auto_60047 ?auto_60046 ) ( not ( = ?auto_60046 ?auto_60044 ) ) ( HOIST-AT ?auto_60048 ?auto_60046 ) ( LIFTING ?auto_60048 ?auto_60042 ) ( not ( = ?auto_60045 ?auto_60048 ) ) )
    :subtasks
    ( ( !LOAD ?auto_60048 ?auto_60042 ?auto_60047 ?auto_60046 )
      ( MAKE-ON ?auto_60042 ?auto_60043 )
      ( MAKE-ON-VERIFY ?auto_60042 ?auto_60043 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60049 - SURFACE
      ?auto_60050 - SURFACE
    )
    :vars
    (
      ?auto_60053 - HOIST
      ?auto_60052 - PLACE
      ?auto_60051 - TRUCK
      ?auto_60055 - PLACE
      ?auto_60054 - HOIST
      ?auto_60056 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60053 ?auto_60052 ) ( SURFACE-AT ?auto_60050 ?auto_60052 ) ( CLEAR ?auto_60050 ) ( IS-CRATE ?auto_60049 ) ( not ( = ?auto_60049 ?auto_60050 ) ) ( AVAILABLE ?auto_60053 ) ( TRUCK-AT ?auto_60051 ?auto_60055 ) ( not ( = ?auto_60055 ?auto_60052 ) ) ( HOIST-AT ?auto_60054 ?auto_60055 ) ( not ( = ?auto_60053 ?auto_60054 ) ) ( AVAILABLE ?auto_60054 ) ( SURFACE-AT ?auto_60049 ?auto_60055 ) ( ON ?auto_60049 ?auto_60056 ) ( CLEAR ?auto_60049 ) ( not ( = ?auto_60049 ?auto_60056 ) ) ( not ( = ?auto_60050 ?auto_60056 ) ) )
    :subtasks
    ( ( !LIFT ?auto_60054 ?auto_60049 ?auto_60056 ?auto_60055 )
      ( MAKE-ON ?auto_60049 ?auto_60050 )
      ( MAKE-ON-VERIFY ?auto_60049 ?auto_60050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60057 - SURFACE
      ?auto_60058 - SURFACE
    )
    :vars
    (
      ?auto_60059 - HOIST
      ?auto_60064 - PLACE
      ?auto_60061 - PLACE
      ?auto_60063 - HOIST
      ?auto_60060 - SURFACE
      ?auto_60062 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60059 ?auto_60064 ) ( SURFACE-AT ?auto_60058 ?auto_60064 ) ( CLEAR ?auto_60058 ) ( IS-CRATE ?auto_60057 ) ( not ( = ?auto_60057 ?auto_60058 ) ) ( AVAILABLE ?auto_60059 ) ( not ( = ?auto_60061 ?auto_60064 ) ) ( HOIST-AT ?auto_60063 ?auto_60061 ) ( not ( = ?auto_60059 ?auto_60063 ) ) ( AVAILABLE ?auto_60063 ) ( SURFACE-AT ?auto_60057 ?auto_60061 ) ( ON ?auto_60057 ?auto_60060 ) ( CLEAR ?auto_60057 ) ( not ( = ?auto_60057 ?auto_60060 ) ) ( not ( = ?auto_60058 ?auto_60060 ) ) ( TRUCK-AT ?auto_60062 ?auto_60064 ) )
    :subtasks
    ( ( !DRIVE ?auto_60062 ?auto_60064 ?auto_60061 )
      ( MAKE-ON ?auto_60057 ?auto_60058 )
      ( MAKE-ON-VERIFY ?auto_60057 ?auto_60058 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60065 - SURFACE
      ?auto_60066 - SURFACE
    )
    :vars
    (
      ?auto_60067 - HOIST
      ?auto_60069 - PLACE
      ?auto_60072 - PLACE
      ?auto_60068 - HOIST
      ?auto_60070 - SURFACE
      ?auto_60071 - TRUCK
      ?auto_60073 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60067 ?auto_60069 ) ( IS-CRATE ?auto_60065 ) ( not ( = ?auto_60065 ?auto_60066 ) ) ( not ( = ?auto_60072 ?auto_60069 ) ) ( HOIST-AT ?auto_60068 ?auto_60072 ) ( not ( = ?auto_60067 ?auto_60068 ) ) ( AVAILABLE ?auto_60068 ) ( SURFACE-AT ?auto_60065 ?auto_60072 ) ( ON ?auto_60065 ?auto_60070 ) ( CLEAR ?auto_60065 ) ( not ( = ?auto_60065 ?auto_60070 ) ) ( not ( = ?auto_60066 ?auto_60070 ) ) ( TRUCK-AT ?auto_60071 ?auto_60069 ) ( SURFACE-AT ?auto_60073 ?auto_60069 ) ( CLEAR ?auto_60073 ) ( LIFTING ?auto_60067 ?auto_60066 ) ( IS-CRATE ?auto_60066 ) ( not ( = ?auto_60065 ?auto_60073 ) ) ( not ( = ?auto_60066 ?auto_60073 ) ) ( not ( = ?auto_60070 ?auto_60073 ) ) )
    :subtasks
    ( ( !DROP ?auto_60067 ?auto_60066 ?auto_60073 ?auto_60069 )
      ( MAKE-ON ?auto_60065 ?auto_60066 )
      ( MAKE-ON-VERIFY ?auto_60065 ?auto_60066 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60074 - SURFACE
      ?auto_60075 - SURFACE
    )
    :vars
    (
      ?auto_60082 - HOIST
      ?auto_60077 - PLACE
      ?auto_60079 - PLACE
      ?auto_60081 - HOIST
      ?auto_60078 - SURFACE
      ?auto_60080 - TRUCK
      ?auto_60076 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60082 ?auto_60077 ) ( IS-CRATE ?auto_60074 ) ( not ( = ?auto_60074 ?auto_60075 ) ) ( not ( = ?auto_60079 ?auto_60077 ) ) ( HOIST-AT ?auto_60081 ?auto_60079 ) ( not ( = ?auto_60082 ?auto_60081 ) ) ( AVAILABLE ?auto_60081 ) ( SURFACE-AT ?auto_60074 ?auto_60079 ) ( ON ?auto_60074 ?auto_60078 ) ( CLEAR ?auto_60074 ) ( not ( = ?auto_60074 ?auto_60078 ) ) ( not ( = ?auto_60075 ?auto_60078 ) ) ( TRUCK-AT ?auto_60080 ?auto_60077 ) ( SURFACE-AT ?auto_60076 ?auto_60077 ) ( CLEAR ?auto_60076 ) ( IS-CRATE ?auto_60075 ) ( not ( = ?auto_60074 ?auto_60076 ) ) ( not ( = ?auto_60075 ?auto_60076 ) ) ( not ( = ?auto_60078 ?auto_60076 ) ) ( AVAILABLE ?auto_60082 ) ( IN ?auto_60075 ?auto_60080 ) )
    :subtasks
    ( ( !UNLOAD ?auto_60082 ?auto_60075 ?auto_60080 ?auto_60077 )
      ( MAKE-ON ?auto_60074 ?auto_60075 )
      ( MAKE-ON-VERIFY ?auto_60074 ?auto_60075 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60083 - SURFACE
      ?auto_60084 - SURFACE
    )
    :vars
    (
      ?auto_60087 - HOIST
      ?auto_60091 - PLACE
      ?auto_60089 - PLACE
      ?auto_60086 - HOIST
      ?auto_60085 - SURFACE
      ?auto_60090 - SURFACE
      ?auto_60088 - TRUCK
      ?auto_60092 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60087 ?auto_60091 ) ( IS-CRATE ?auto_60083 ) ( not ( = ?auto_60083 ?auto_60084 ) ) ( not ( = ?auto_60089 ?auto_60091 ) ) ( HOIST-AT ?auto_60086 ?auto_60089 ) ( not ( = ?auto_60087 ?auto_60086 ) ) ( AVAILABLE ?auto_60086 ) ( SURFACE-AT ?auto_60083 ?auto_60089 ) ( ON ?auto_60083 ?auto_60085 ) ( CLEAR ?auto_60083 ) ( not ( = ?auto_60083 ?auto_60085 ) ) ( not ( = ?auto_60084 ?auto_60085 ) ) ( SURFACE-AT ?auto_60090 ?auto_60091 ) ( CLEAR ?auto_60090 ) ( IS-CRATE ?auto_60084 ) ( not ( = ?auto_60083 ?auto_60090 ) ) ( not ( = ?auto_60084 ?auto_60090 ) ) ( not ( = ?auto_60085 ?auto_60090 ) ) ( AVAILABLE ?auto_60087 ) ( IN ?auto_60084 ?auto_60088 ) ( TRUCK-AT ?auto_60088 ?auto_60092 ) ( not ( = ?auto_60092 ?auto_60091 ) ) ( not ( = ?auto_60089 ?auto_60092 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_60088 ?auto_60092 ?auto_60091 )
      ( MAKE-ON ?auto_60083 ?auto_60084 )
      ( MAKE-ON-VERIFY ?auto_60083 ?auto_60084 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60093 - SURFACE
      ?auto_60094 - SURFACE
    )
    :vars
    (
      ?auto_60099 - HOIST
      ?auto_60098 - PLACE
      ?auto_60101 - PLACE
      ?auto_60100 - HOIST
      ?auto_60096 - SURFACE
      ?auto_60095 - SURFACE
      ?auto_60102 - TRUCK
      ?auto_60097 - PLACE
      ?auto_60103 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_60099 ?auto_60098 ) ( IS-CRATE ?auto_60093 ) ( not ( = ?auto_60093 ?auto_60094 ) ) ( not ( = ?auto_60101 ?auto_60098 ) ) ( HOIST-AT ?auto_60100 ?auto_60101 ) ( not ( = ?auto_60099 ?auto_60100 ) ) ( AVAILABLE ?auto_60100 ) ( SURFACE-AT ?auto_60093 ?auto_60101 ) ( ON ?auto_60093 ?auto_60096 ) ( CLEAR ?auto_60093 ) ( not ( = ?auto_60093 ?auto_60096 ) ) ( not ( = ?auto_60094 ?auto_60096 ) ) ( SURFACE-AT ?auto_60095 ?auto_60098 ) ( CLEAR ?auto_60095 ) ( IS-CRATE ?auto_60094 ) ( not ( = ?auto_60093 ?auto_60095 ) ) ( not ( = ?auto_60094 ?auto_60095 ) ) ( not ( = ?auto_60096 ?auto_60095 ) ) ( AVAILABLE ?auto_60099 ) ( TRUCK-AT ?auto_60102 ?auto_60097 ) ( not ( = ?auto_60097 ?auto_60098 ) ) ( not ( = ?auto_60101 ?auto_60097 ) ) ( HOIST-AT ?auto_60103 ?auto_60097 ) ( LIFTING ?auto_60103 ?auto_60094 ) ( not ( = ?auto_60099 ?auto_60103 ) ) ( not ( = ?auto_60100 ?auto_60103 ) ) )
    :subtasks
    ( ( !LOAD ?auto_60103 ?auto_60094 ?auto_60102 ?auto_60097 )
      ( MAKE-ON ?auto_60093 ?auto_60094 )
      ( MAKE-ON-VERIFY ?auto_60093 ?auto_60094 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60104 - SURFACE
      ?auto_60105 - SURFACE
    )
    :vars
    (
      ?auto_60108 - HOIST
      ?auto_60106 - PLACE
      ?auto_60109 - PLACE
      ?auto_60113 - HOIST
      ?auto_60114 - SURFACE
      ?auto_60112 - SURFACE
      ?auto_60111 - TRUCK
      ?auto_60110 - PLACE
      ?auto_60107 - HOIST
      ?auto_60115 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60108 ?auto_60106 ) ( IS-CRATE ?auto_60104 ) ( not ( = ?auto_60104 ?auto_60105 ) ) ( not ( = ?auto_60109 ?auto_60106 ) ) ( HOIST-AT ?auto_60113 ?auto_60109 ) ( not ( = ?auto_60108 ?auto_60113 ) ) ( AVAILABLE ?auto_60113 ) ( SURFACE-AT ?auto_60104 ?auto_60109 ) ( ON ?auto_60104 ?auto_60114 ) ( CLEAR ?auto_60104 ) ( not ( = ?auto_60104 ?auto_60114 ) ) ( not ( = ?auto_60105 ?auto_60114 ) ) ( SURFACE-AT ?auto_60112 ?auto_60106 ) ( CLEAR ?auto_60112 ) ( IS-CRATE ?auto_60105 ) ( not ( = ?auto_60104 ?auto_60112 ) ) ( not ( = ?auto_60105 ?auto_60112 ) ) ( not ( = ?auto_60114 ?auto_60112 ) ) ( AVAILABLE ?auto_60108 ) ( TRUCK-AT ?auto_60111 ?auto_60110 ) ( not ( = ?auto_60110 ?auto_60106 ) ) ( not ( = ?auto_60109 ?auto_60110 ) ) ( HOIST-AT ?auto_60107 ?auto_60110 ) ( not ( = ?auto_60108 ?auto_60107 ) ) ( not ( = ?auto_60113 ?auto_60107 ) ) ( AVAILABLE ?auto_60107 ) ( SURFACE-AT ?auto_60105 ?auto_60110 ) ( ON ?auto_60105 ?auto_60115 ) ( CLEAR ?auto_60105 ) ( not ( = ?auto_60104 ?auto_60115 ) ) ( not ( = ?auto_60105 ?auto_60115 ) ) ( not ( = ?auto_60114 ?auto_60115 ) ) ( not ( = ?auto_60112 ?auto_60115 ) ) )
    :subtasks
    ( ( !LIFT ?auto_60107 ?auto_60105 ?auto_60115 ?auto_60110 )
      ( MAKE-ON ?auto_60104 ?auto_60105 )
      ( MAKE-ON-VERIFY ?auto_60104 ?auto_60105 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60116 - SURFACE
      ?auto_60117 - SURFACE
    )
    :vars
    (
      ?auto_60127 - HOIST
      ?auto_60126 - PLACE
      ?auto_60122 - PLACE
      ?auto_60125 - HOIST
      ?auto_60123 - SURFACE
      ?auto_60119 - SURFACE
      ?auto_60120 - PLACE
      ?auto_60124 - HOIST
      ?auto_60121 - SURFACE
      ?auto_60118 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60127 ?auto_60126 ) ( IS-CRATE ?auto_60116 ) ( not ( = ?auto_60116 ?auto_60117 ) ) ( not ( = ?auto_60122 ?auto_60126 ) ) ( HOIST-AT ?auto_60125 ?auto_60122 ) ( not ( = ?auto_60127 ?auto_60125 ) ) ( AVAILABLE ?auto_60125 ) ( SURFACE-AT ?auto_60116 ?auto_60122 ) ( ON ?auto_60116 ?auto_60123 ) ( CLEAR ?auto_60116 ) ( not ( = ?auto_60116 ?auto_60123 ) ) ( not ( = ?auto_60117 ?auto_60123 ) ) ( SURFACE-AT ?auto_60119 ?auto_60126 ) ( CLEAR ?auto_60119 ) ( IS-CRATE ?auto_60117 ) ( not ( = ?auto_60116 ?auto_60119 ) ) ( not ( = ?auto_60117 ?auto_60119 ) ) ( not ( = ?auto_60123 ?auto_60119 ) ) ( AVAILABLE ?auto_60127 ) ( not ( = ?auto_60120 ?auto_60126 ) ) ( not ( = ?auto_60122 ?auto_60120 ) ) ( HOIST-AT ?auto_60124 ?auto_60120 ) ( not ( = ?auto_60127 ?auto_60124 ) ) ( not ( = ?auto_60125 ?auto_60124 ) ) ( AVAILABLE ?auto_60124 ) ( SURFACE-AT ?auto_60117 ?auto_60120 ) ( ON ?auto_60117 ?auto_60121 ) ( CLEAR ?auto_60117 ) ( not ( = ?auto_60116 ?auto_60121 ) ) ( not ( = ?auto_60117 ?auto_60121 ) ) ( not ( = ?auto_60123 ?auto_60121 ) ) ( not ( = ?auto_60119 ?auto_60121 ) ) ( TRUCK-AT ?auto_60118 ?auto_60126 ) )
    :subtasks
    ( ( !DRIVE ?auto_60118 ?auto_60126 ?auto_60120 )
      ( MAKE-ON ?auto_60116 ?auto_60117 )
      ( MAKE-ON-VERIFY ?auto_60116 ?auto_60117 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60128 - SURFACE
      ?auto_60129 - SURFACE
    )
    :vars
    (
      ?auto_60138 - HOIST
      ?auto_60133 - PLACE
      ?auto_60136 - PLACE
      ?auto_60130 - HOIST
      ?auto_60131 - SURFACE
      ?auto_60137 - SURFACE
      ?auto_60139 - PLACE
      ?auto_60135 - HOIST
      ?auto_60134 - SURFACE
      ?auto_60132 - TRUCK
      ?auto_60140 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60138 ?auto_60133 ) ( IS-CRATE ?auto_60128 ) ( not ( = ?auto_60128 ?auto_60129 ) ) ( not ( = ?auto_60136 ?auto_60133 ) ) ( HOIST-AT ?auto_60130 ?auto_60136 ) ( not ( = ?auto_60138 ?auto_60130 ) ) ( AVAILABLE ?auto_60130 ) ( SURFACE-AT ?auto_60128 ?auto_60136 ) ( ON ?auto_60128 ?auto_60131 ) ( CLEAR ?auto_60128 ) ( not ( = ?auto_60128 ?auto_60131 ) ) ( not ( = ?auto_60129 ?auto_60131 ) ) ( IS-CRATE ?auto_60129 ) ( not ( = ?auto_60128 ?auto_60137 ) ) ( not ( = ?auto_60129 ?auto_60137 ) ) ( not ( = ?auto_60131 ?auto_60137 ) ) ( not ( = ?auto_60139 ?auto_60133 ) ) ( not ( = ?auto_60136 ?auto_60139 ) ) ( HOIST-AT ?auto_60135 ?auto_60139 ) ( not ( = ?auto_60138 ?auto_60135 ) ) ( not ( = ?auto_60130 ?auto_60135 ) ) ( AVAILABLE ?auto_60135 ) ( SURFACE-AT ?auto_60129 ?auto_60139 ) ( ON ?auto_60129 ?auto_60134 ) ( CLEAR ?auto_60129 ) ( not ( = ?auto_60128 ?auto_60134 ) ) ( not ( = ?auto_60129 ?auto_60134 ) ) ( not ( = ?auto_60131 ?auto_60134 ) ) ( not ( = ?auto_60137 ?auto_60134 ) ) ( TRUCK-AT ?auto_60132 ?auto_60133 ) ( SURFACE-AT ?auto_60140 ?auto_60133 ) ( CLEAR ?auto_60140 ) ( LIFTING ?auto_60138 ?auto_60137 ) ( IS-CRATE ?auto_60137 ) ( not ( = ?auto_60128 ?auto_60140 ) ) ( not ( = ?auto_60129 ?auto_60140 ) ) ( not ( = ?auto_60131 ?auto_60140 ) ) ( not ( = ?auto_60137 ?auto_60140 ) ) ( not ( = ?auto_60134 ?auto_60140 ) ) )
    :subtasks
    ( ( !DROP ?auto_60138 ?auto_60137 ?auto_60140 ?auto_60133 )
      ( MAKE-ON ?auto_60128 ?auto_60129 )
      ( MAKE-ON-VERIFY ?auto_60128 ?auto_60129 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60141 - SURFACE
      ?auto_60142 - SURFACE
    )
    :vars
    (
      ?auto_60152 - HOIST
      ?auto_60143 - PLACE
      ?auto_60146 - PLACE
      ?auto_60153 - HOIST
      ?auto_60151 - SURFACE
      ?auto_60147 - SURFACE
      ?auto_60149 - PLACE
      ?auto_60150 - HOIST
      ?auto_60144 - SURFACE
      ?auto_60145 - TRUCK
      ?auto_60148 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60152 ?auto_60143 ) ( IS-CRATE ?auto_60141 ) ( not ( = ?auto_60141 ?auto_60142 ) ) ( not ( = ?auto_60146 ?auto_60143 ) ) ( HOIST-AT ?auto_60153 ?auto_60146 ) ( not ( = ?auto_60152 ?auto_60153 ) ) ( AVAILABLE ?auto_60153 ) ( SURFACE-AT ?auto_60141 ?auto_60146 ) ( ON ?auto_60141 ?auto_60151 ) ( CLEAR ?auto_60141 ) ( not ( = ?auto_60141 ?auto_60151 ) ) ( not ( = ?auto_60142 ?auto_60151 ) ) ( IS-CRATE ?auto_60142 ) ( not ( = ?auto_60141 ?auto_60147 ) ) ( not ( = ?auto_60142 ?auto_60147 ) ) ( not ( = ?auto_60151 ?auto_60147 ) ) ( not ( = ?auto_60149 ?auto_60143 ) ) ( not ( = ?auto_60146 ?auto_60149 ) ) ( HOIST-AT ?auto_60150 ?auto_60149 ) ( not ( = ?auto_60152 ?auto_60150 ) ) ( not ( = ?auto_60153 ?auto_60150 ) ) ( AVAILABLE ?auto_60150 ) ( SURFACE-AT ?auto_60142 ?auto_60149 ) ( ON ?auto_60142 ?auto_60144 ) ( CLEAR ?auto_60142 ) ( not ( = ?auto_60141 ?auto_60144 ) ) ( not ( = ?auto_60142 ?auto_60144 ) ) ( not ( = ?auto_60151 ?auto_60144 ) ) ( not ( = ?auto_60147 ?auto_60144 ) ) ( TRUCK-AT ?auto_60145 ?auto_60143 ) ( SURFACE-AT ?auto_60148 ?auto_60143 ) ( CLEAR ?auto_60148 ) ( IS-CRATE ?auto_60147 ) ( not ( = ?auto_60141 ?auto_60148 ) ) ( not ( = ?auto_60142 ?auto_60148 ) ) ( not ( = ?auto_60151 ?auto_60148 ) ) ( not ( = ?auto_60147 ?auto_60148 ) ) ( not ( = ?auto_60144 ?auto_60148 ) ) ( AVAILABLE ?auto_60152 ) ( IN ?auto_60147 ?auto_60145 ) )
    :subtasks
    ( ( !UNLOAD ?auto_60152 ?auto_60147 ?auto_60145 ?auto_60143 )
      ( MAKE-ON ?auto_60141 ?auto_60142 )
      ( MAKE-ON-VERIFY ?auto_60141 ?auto_60142 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60154 - SURFACE
      ?auto_60155 - SURFACE
    )
    :vars
    (
      ?auto_60162 - HOIST
      ?auto_60164 - PLACE
      ?auto_60166 - PLACE
      ?auto_60163 - HOIST
      ?auto_60157 - SURFACE
      ?auto_60165 - SURFACE
      ?auto_60161 - PLACE
      ?auto_60159 - HOIST
      ?auto_60156 - SURFACE
      ?auto_60158 - SURFACE
      ?auto_60160 - TRUCK
      ?auto_60167 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60162 ?auto_60164 ) ( IS-CRATE ?auto_60154 ) ( not ( = ?auto_60154 ?auto_60155 ) ) ( not ( = ?auto_60166 ?auto_60164 ) ) ( HOIST-AT ?auto_60163 ?auto_60166 ) ( not ( = ?auto_60162 ?auto_60163 ) ) ( AVAILABLE ?auto_60163 ) ( SURFACE-AT ?auto_60154 ?auto_60166 ) ( ON ?auto_60154 ?auto_60157 ) ( CLEAR ?auto_60154 ) ( not ( = ?auto_60154 ?auto_60157 ) ) ( not ( = ?auto_60155 ?auto_60157 ) ) ( IS-CRATE ?auto_60155 ) ( not ( = ?auto_60154 ?auto_60165 ) ) ( not ( = ?auto_60155 ?auto_60165 ) ) ( not ( = ?auto_60157 ?auto_60165 ) ) ( not ( = ?auto_60161 ?auto_60164 ) ) ( not ( = ?auto_60166 ?auto_60161 ) ) ( HOIST-AT ?auto_60159 ?auto_60161 ) ( not ( = ?auto_60162 ?auto_60159 ) ) ( not ( = ?auto_60163 ?auto_60159 ) ) ( AVAILABLE ?auto_60159 ) ( SURFACE-AT ?auto_60155 ?auto_60161 ) ( ON ?auto_60155 ?auto_60156 ) ( CLEAR ?auto_60155 ) ( not ( = ?auto_60154 ?auto_60156 ) ) ( not ( = ?auto_60155 ?auto_60156 ) ) ( not ( = ?auto_60157 ?auto_60156 ) ) ( not ( = ?auto_60165 ?auto_60156 ) ) ( SURFACE-AT ?auto_60158 ?auto_60164 ) ( CLEAR ?auto_60158 ) ( IS-CRATE ?auto_60165 ) ( not ( = ?auto_60154 ?auto_60158 ) ) ( not ( = ?auto_60155 ?auto_60158 ) ) ( not ( = ?auto_60157 ?auto_60158 ) ) ( not ( = ?auto_60165 ?auto_60158 ) ) ( not ( = ?auto_60156 ?auto_60158 ) ) ( AVAILABLE ?auto_60162 ) ( IN ?auto_60165 ?auto_60160 ) ( TRUCK-AT ?auto_60160 ?auto_60167 ) ( not ( = ?auto_60167 ?auto_60164 ) ) ( not ( = ?auto_60166 ?auto_60167 ) ) ( not ( = ?auto_60161 ?auto_60167 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_60160 ?auto_60167 ?auto_60164 )
      ( MAKE-ON ?auto_60154 ?auto_60155 )
      ( MAKE-ON-VERIFY ?auto_60154 ?auto_60155 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60168 - SURFACE
      ?auto_60169 - SURFACE
    )
    :vars
    (
      ?auto_60179 - HOIST
      ?auto_60175 - PLACE
      ?auto_60170 - PLACE
      ?auto_60173 - HOIST
      ?auto_60174 - SURFACE
      ?auto_60176 - SURFACE
      ?auto_60181 - PLACE
      ?auto_60171 - HOIST
      ?auto_60172 - SURFACE
      ?auto_60180 - SURFACE
      ?auto_60177 - TRUCK
      ?auto_60178 - PLACE
      ?auto_60182 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_60179 ?auto_60175 ) ( IS-CRATE ?auto_60168 ) ( not ( = ?auto_60168 ?auto_60169 ) ) ( not ( = ?auto_60170 ?auto_60175 ) ) ( HOIST-AT ?auto_60173 ?auto_60170 ) ( not ( = ?auto_60179 ?auto_60173 ) ) ( AVAILABLE ?auto_60173 ) ( SURFACE-AT ?auto_60168 ?auto_60170 ) ( ON ?auto_60168 ?auto_60174 ) ( CLEAR ?auto_60168 ) ( not ( = ?auto_60168 ?auto_60174 ) ) ( not ( = ?auto_60169 ?auto_60174 ) ) ( IS-CRATE ?auto_60169 ) ( not ( = ?auto_60168 ?auto_60176 ) ) ( not ( = ?auto_60169 ?auto_60176 ) ) ( not ( = ?auto_60174 ?auto_60176 ) ) ( not ( = ?auto_60181 ?auto_60175 ) ) ( not ( = ?auto_60170 ?auto_60181 ) ) ( HOIST-AT ?auto_60171 ?auto_60181 ) ( not ( = ?auto_60179 ?auto_60171 ) ) ( not ( = ?auto_60173 ?auto_60171 ) ) ( AVAILABLE ?auto_60171 ) ( SURFACE-AT ?auto_60169 ?auto_60181 ) ( ON ?auto_60169 ?auto_60172 ) ( CLEAR ?auto_60169 ) ( not ( = ?auto_60168 ?auto_60172 ) ) ( not ( = ?auto_60169 ?auto_60172 ) ) ( not ( = ?auto_60174 ?auto_60172 ) ) ( not ( = ?auto_60176 ?auto_60172 ) ) ( SURFACE-AT ?auto_60180 ?auto_60175 ) ( CLEAR ?auto_60180 ) ( IS-CRATE ?auto_60176 ) ( not ( = ?auto_60168 ?auto_60180 ) ) ( not ( = ?auto_60169 ?auto_60180 ) ) ( not ( = ?auto_60174 ?auto_60180 ) ) ( not ( = ?auto_60176 ?auto_60180 ) ) ( not ( = ?auto_60172 ?auto_60180 ) ) ( AVAILABLE ?auto_60179 ) ( TRUCK-AT ?auto_60177 ?auto_60178 ) ( not ( = ?auto_60178 ?auto_60175 ) ) ( not ( = ?auto_60170 ?auto_60178 ) ) ( not ( = ?auto_60181 ?auto_60178 ) ) ( HOIST-AT ?auto_60182 ?auto_60178 ) ( LIFTING ?auto_60182 ?auto_60176 ) ( not ( = ?auto_60179 ?auto_60182 ) ) ( not ( = ?auto_60173 ?auto_60182 ) ) ( not ( = ?auto_60171 ?auto_60182 ) ) )
    :subtasks
    ( ( !LOAD ?auto_60182 ?auto_60176 ?auto_60177 ?auto_60178 )
      ( MAKE-ON ?auto_60168 ?auto_60169 )
      ( MAKE-ON-VERIFY ?auto_60168 ?auto_60169 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60183 - SURFACE
      ?auto_60184 - SURFACE
    )
    :vars
    (
      ?auto_60191 - HOIST
      ?auto_60197 - PLACE
      ?auto_60188 - PLACE
      ?auto_60186 - HOIST
      ?auto_60187 - SURFACE
      ?auto_60189 - SURFACE
      ?auto_60190 - PLACE
      ?auto_60185 - HOIST
      ?auto_60194 - SURFACE
      ?auto_60195 - SURFACE
      ?auto_60196 - TRUCK
      ?auto_60193 - PLACE
      ?auto_60192 - HOIST
      ?auto_60198 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60191 ?auto_60197 ) ( IS-CRATE ?auto_60183 ) ( not ( = ?auto_60183 ?auto_60184 ) ) ( not ( = ?auto_60188 ?auto_60197 ) ) ( HOIST-AT ?auto_60186 ?auto_60188 ) ( not ( = ?auto_60191 ?auto_60186 ) ) ( AVAILABLE ?auto_60186 ) ( SURFACE-AT ?auto_60183 ?auto_60188 ) ( ON ?auto_60183 ?auto_60187 ) ( CLEAR ?auto_60183 ) ( not ( = ?auto_60183 ?auto_60187 ) ) ( not ( = ?auto_60184 ?auto_60187 ) ) ( IS-CRATE ?auto_60184 ) ( not ( = ?auto_60183 ?auto_60189 ) ) ( not ( = ?auto_60184 ?auto_60189 ) ) ( not ( = ?auto_60187 ?auto_60189 ) ) ( not ( = ?auto_60190 ?auto_60197 ) ) ( not ( = ?auto_60188 ?auto_60190 ) ) ( HOIST-AT ?auto_60185 ?auto_60190 ) ( not ( = ?auto_60191 ?auto_60185 ) ) ( not ( = ?auto_60186 ?auto_60185 ) ) ( AVAILABLE ?auto_60185 ) ( SURFACE-AT ?auto_60184 ?auto_60190 ) ( ON ?auto_60184 ?auto_60194 ) ( CLEAR ?auto_60184 ) ( not ( = ?auto_60183 ?auto_60194 ) ) ( not ( = ?auto_60184 ?auto_60194 ) ) ( not ( = ?auto_60187 ?auto_60194 ) ) ( not ( = ?auto_60189 ?auto_60194 ) ) ( SURFACE-AT ?auto_60195 ?auto_60197 ) ( CLEAR ?auto_60195 ) ( IS-CRATE ?auto_60189 ) ( not ( = ?auto_60183 ?auto_60195 ) ) ( not ( = ?auto_60184 ?auto_60195 ) ) ( not ( = ?auto_60187 ?auto_60195 ) ) ( not ( = ?auto_60189 ?auto_60195 ) ) ( not ( = ?auto_60194 ?auto_60195 ) ) ( AVAILABLE ?auto_60191 ) ( TRUCK-AT ?auto_60196 ?auto_60193 ) ( not ( = ?auto_60193 ?auto_60197 ) ) ( not ( = ?auto_60188 ?auto_60193 ) ) ( not ( = ?auto_60190 ?auto_60193 ) ) ( HOIST-AT ?auto_60192 ?auto_60193 ) ( not ( = ?auto_60191 ?auto_60192 ) ) ( not ( = ?auto_60186 ?auto_60192 ) ) ( not ( = ?auto_60185 ?auto_60192 ) ) ( AVAILABLE ?auto_60192 ) ( SURFACE-AT ?auto_60189 ?auto_60193 ) ( ON ?auto_60189 ?auto_60198 ) ( CLEAR ?auto_60189 ) ( not ( = ?auto_60183 ?auto_60198 ) ) ( not ( = ?auto_60184 ?auto_60198 ) ) ( not ( = ?auto_60187 ?auto_60198 ) ) ( not ( = ?auto_60189 ?auto_60198 ) ) ( not ( = ?auto_60194 ?auto_60198 ) ) ( not ( = ?auto_60195 ?auto_60198 ) ) )
    :subtasks
    ( ( !LIFT ?auto_60192 ?auto_60189 ?auto_60198 ?auto_60193 )
      ( MAKE-ON ?auto_60183 ?auto_60184 )
      ( MAKE-ON-VERIFY ?auto_60183 ?auto_60184 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60199 - SURFACE
      ?auto_60200 - SURFACE
    )
    :vars
    (
      ?auto_60204 - HOIST
      ?auto_60214 - PLACE
      ?auto_60202 - PLACE
      ?auto_60209 - HOIST
      ?auto_60208 - SURFACE
      ?auto_60205 - SURFACE
      ?auto_60206 - PLACE
      ?auto_60203 - HOIST
      ?auto_60207 - SURFACE
      ?auto_60212 - SURFACE
      ?auto_60211 - PLACE
      ?auto_60201 - HOIST
      ?auto_60210 - SURFACE
      ?auto_60213 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60204 ?auto_60214 ) ( IS-CRATE ?auto_60199 ) ( not ( = ?auto_60199 ?auto_60200 ) ) ( not ( = ?auto_60202 ?auto_60214 ) ) ( HOIST-AT ?auto_60209 ?auto_60202 ) ( not ( = ?auto_60204 ?auto_60209 ) ) ( AVAILABLE ?auto_60209 ) ( SURFACE-AT ?auto_60199 ?auto_60202 ) ( ON ?auto_60199 ?auto_60208 ) ( CLEAR ?auto_60199 ) ( not ( = ?auto_60199 ?auto_60208 ) ) ( not ( = ?auto_60200 ?auto_60208 ) ) ( IS-CRATE ?auto_60200 ) ( not ( = ?auto_60199 ?auto_60205 ) ) ( not ( = ?auto_60200 ?auto_60205 ) ) ( not ( = ?auto_60208 ?auto_60205 ) ) ( not ( = ?auto_60206 ?auto_60214 ) ) ( not ( = ?auto_60202 ?auto_60206 ) ) ( HOIST-AT ?auto_60203 ?auto_60206 ) ( not ( = ?auto_60204 ?auto_60203 ) ) ( not ( = ?auto_60209 ?auto_60203 ) ) ( AVAILABLE ?auto_60203 ) ( SURFACE-AT ?auto_60200 ?auto_60206 ) ( ON ?auto_60200 ?auto_60207 ) ( CLEAR ?auto_60200 ) ( not ( = ?auto_60199 ?auto_60207 ) ) ( not ( = ?auto_60200 ?auto_60207 ) ) ( not ( = ?auto_60208 ?auto_60207 ) ) ( not ( = ?auto_60205 ?auto_60207 ) ) ( SURFACE-AT ?auto_60212 ?auto_60214 ) ( CLEAR ?auto_60212 ) ( IS-CRATE ?auto_60205 ) ( not ( = ?auto_60199 ?auto_60212 ) ) ( not ( = ?auto_60200 ?auto_60212 ) ) ( not ( = ?auto_60208 ?auto_60212 ) ) ( not ( = ?auto_60205 ?auto_60212 ) ) ( not ( = ?auto_60207 ?auto_60212 ) ) ( AVAILABLE ?auto_60204 ) ( not ( = ?auto_60211 ?auto_60214 ) ) ( not ( = ?auto_60202 ?auto_60211 ) ) ( not ( = ?auto_60206 ?auto_60211 ) ) ( HOIST-AT ?auto_60201 ?auto_60211 ) ( not ( = ?auto_60204 ?auto_60201 ) ) ( not ( = ?auto_60209 ?auto_60201 ) ) ( not ( = ?auto_60203 ?auto_60201 ) ) ( AVAILABLE ?auto_60201 ) ( SURFACE-AT ?auto_60205 ?auto_60211 ) ( ON ?auto_60205 ?auto_60210 ) ( CLEAR ?auto_60205 ) ( not ( = ?auto_60199 ?auto_60210 ) ) ( not ( = ?auto_60200 ?auto_60210 ) ) ( not ( = ?auto_60208 ?auto_60210 ) ) ( not ( = ?auto_60205 ?auto_60210 ) ) ( not ( = ?auto_60207 ?auto_60210 ) ) ( not ( = ?auto_60212 ?auto_60210 ) ) ( TRUCK-AT ?auto_60213 ?auto_60214 ) )
    :subtasks
    ( ( !DRIVE ?auto_60213 ?auto_60214 ?auto_60211 )
      ( MAKE-ON ?auto_60199 ?auto_60200 )
      ( MAKE-ON-VERIFY ?auto_60199 ?auto_60200 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60215 - SURFACE
      ?auto_60216 - SURFACE
    )
    :vars
    (
      ?auto_60219 - HOIST
      ?auto_60228 - PLACE
      ?auto_60220 - PLACE
      ?auto_60226 - HOIST
      ?auto_60221 - SURFACE
      ?auto_60217 - SURFACE
      ?auto_60224 - PLACE
      ?auto_60230 - HOIST
      ?auto_60225 - SURFACE
      ?auto_60223 - SURFACE
      ?auto_60218 - PLACE
      ?auto_60229 - HOIST
      ?auto_60227 - SURFACE
      ?auto_60222 - TRUCK
      ?auto_60231 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60219 ?auto_60228 ) ( IS-CRATE ?auto_60215 ) ( not ( = ?auto_60215 ?auto_60216 ) ) ( not ( = ?auto_60220 ?auto_60228 ) ) ( HOIST-AT ?auto_60226 ?auto_60220 ) ( not ( = ?auto_60219 ?auto_60226 ) ) ( AVAILABLE ?auto_60226 ) ( SURFACE-AT ?auto_60215 ?auto_60220 ) ( ON ?auto_60215 ?auto_60221 ) ( CLEAR ?auto_60215 ) ( not ( = ?auto_60215 ?auto_60221 ) ) ( not ( = ?auto_60216 ?auto_60221 ) ) ( IS-CRATE ?auto_60216 ) ( not ( = ?auto_60215 ?auto_60217 ) ) ( not ( = ?auto_60216 ?auto_60217 ) ) ( not ( = ?auto_60221 ?auto_60217 ) ) ( not ( = ?auto_60224 ?auto_60228 ) ) ( not ( = ?auto_60220 ?auto_60224 ) ) ( HOIST-AT ?auto_60230 ?auto_60224 ) ( not ( = ?auto_60219 ?auto_60230 ) ) ( not ( = ?auto_60226 ?auto_60230 ) ) ( AVAILABLE ?auto_60230 ) ( SURFACE-AT ?auto_60216 ?auto_60224 ) ( ON ?auto_60216 ?auto_60225 ) ( CLEAR ?auto_60216 ) ( not ( = ?auto_60215 ?auto_60225 ) ) ( not ( = ?auto_60216 ?auto_60225 ) ) ( not ( = ?auto_60221 ?auto_60225 ) ) ( not ( = ?auto_60217 ?auto_60225 ) ) ( IS-CRATE ?auto_60217 ) ( not ( = ?auto_60215 ?auto_60223 ) ) ( not ( = ?auto_60216 ?auto_60223 ) ) ( not ( = ?auto_60221 ?auto_60223 ) ) ( not ( = ?auto_60217 ?auto_60223 ) ) ( not ( = ?auto_60225 ?auto_60223 ) ) ( not ( = ?auto_60218 ?auto_60228 ) ) ( not ( = ?auto_60220 ?auto_60218 ) ) ( not ( = ?auto_60224 ?auto_60218 ) ) ( HOIST-AT ?auto_60229 ?auto_60218 ) ( not ( = ?auto_60219 ?auto_60229 ) ) ( not ( = ?auto_60226 ?auto_60229 ) ) ( not ( = ?auto_60230 ?auto_60229 ) ) ( AVAILABLE ?auto_60229 ) ( SURFACE-AT ?auto_60217 ?auto_60218 ) ( ON ?auto_60217 ?auto_60227 ) ( CLEAR ?auto_60217 ) ( not ( = ?auto_60215 ?auto_60227 ) ) ( not ( = ?auto_60216 ?auto_60227 ) ) ( not ( = ?auto_60221 ?auto_60227 ) ) ( not ( = ?auto_60217 ?auto_60227 ) ) ( not ( = ?auto_60225 ?auto_60227 ) ) ( not ( = ?auto_60223 ?auto_60227 ) ) ( TRUCK-AT ?auto_60222 ?auto_60228 ) ( SURFACE-AT ?auto_60231 ?auto_60228 ) ( CLEAR ?auto_60231 ) ( LIFTING ?auto_60219 ?auto_60223 ) ( IS-CRATE ?auto_60223 ) ( not ( = ?auto_60215 ?auto_60231 ) ) ( not ( = ?auto_60216 ?auto_60231 ) ) ( not ( = ?auto_60221 ?auto_60231 ) ) ( not ( = ?auto_60217 ?auto_60231 ) ) ( not ( = ?auto_60225 ?auto_60231 ) ) ( not ( = ?auto_60223 ?auto_60231 ) ) ( not ( = ?auto_60227 ?auto_60231 ) ) )
    :subtasks
    ( ( !DROP ?auto_60219 ?auto_60223 ?auto_60231 ?auto_60228 )
      ( MAKE-ON ?auto_60215 ?auto_60216 )
      ( MAKE-ON-VERIFY ?auto_60215 ?auto_60216 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60232 - SURFACE
      ?auto_60233 - SURFACE
    )
    :vars
    (
      ?auto_60246 - HOIST
      ?auto_60237 - PLACE
      ?auto_60248 - PLACE
      ?auto_60235 - HOIST
      ?auto_60239 - SURFACE
      ?auto_60244 - SURFACE
      ?auto_60238 - PLACE
      ?auto_60241 - HOIST
      ?auto_60234 - SURFACE
      ?auto_60245 - SURFACE
      ?auto_60247 - PLACE
      ?auto_60240 - HOIST
      ?auto_60236 - SURFACE
      ?auto_60242 - TRUCK
      ?auto_60243 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60246 ?auto_60237 ) ( IS-CRATE ?auto_60232 ) ( not ( = ?auto_60232 ?auto_60233 ) ) ( not ( = ?auto_60248 ?auto_60237 ) ) ( HOIST-AT ?auto_60235 ?auto_60248 ) ( not ( = ?auto_60246 ?auto_60235 ) ) ( AVAILABLE ?auto_60235 ) ( SURFACE-AT ?auto_60232 ?auto_60248 ) ( ON ?auto_60232 ?auto_60239 ) ( CLEAR ?auto_60232 ) ( not ( = ?auto_60232 ?auto_60239 ) ) ( not ( = ?auto_60233 ?auto_60239 ) ) ( IS-CRATE ?auto_60233 ) ( not ( = ?auto_60232 ?auto_60244 ) ) ( not ( = ?auto_60233 ?auto_60244 ) ) ( not ( = ?auto_60239 ?auto_60244 ) ) ( not ( = ?auto_60238 ?auto_60237 ) ) ( not ( = ?auto_60248 ?auto_60238 ) ) ( HOIST-AT ?auto_60241 ?auto_60238 ) ( not ( = ?auto_60246 ?auto_60241 ) ) ( not ( = ?auto_60235 ?auto_60241 ) ) ( AVAILABLE ?auto_60241 ) ( SURFACE-AT ?auto_60233 ?auto_60238 ) ( ON ?auto_60233 ?auto_60234 ) ( CLEAR ?auto_60233 ) ( not ( = ?auto_60232 ?auto_60234 ) ) ( not ( = ?auto_60233 ?auto_60234 ) ) ( not ( = ?auto_60239 ?auto_60234 ) ) ( not ( = ?auto_60244 ?auto_60234 ) ) ( IS-CRATE ?auto_60244 ) ( not ( = ?auto_60232 ?auto_60245 ) ) ( not ( = ?auto_60233 ?auto_60245 ) ) ( not ( = ?auto_60239 ?auto_60245 ) ) ( not ( = ?auto_60244 ?auto_60245 ) ) ( not ( = ?auto_60234 ?auto_60245 ) ) ( not ( = ?auto_60247 ?auto_60237 ) ) ( not ( = ?auto_60248 ?auto_60247 ) ) ( not ( = ?auto_60238 ?auto_60247 ) ) ( HOIST-AT ?auto_60240 ?auto_60247 ) ( not ( = ?auto_60246 ?auto_60240 ) ) ( not ( = ?auto_60235 ?auto_60240 ) ) ( not ( = ?auto_60241 ?auto_60240 ) ) ( AVAILABLE ?auto_60240 ) ( SURFACE-AT ?auto_60244 ?auto_60247 ) ( ON ?auto_60244 ?auto_60236 ) ( CLEAR ?auto_60244 ) ( not ( = ?auto_60232 ?auto_60236 ) ) ( not ( = ?auto_60233 ?auto_60236 ) ) ( not ( = ?auto_60239 ?auto_60236 ) ) ( not ( = ?auto_60244 ?auto_60236 ) ) ( not ( = ?auto_60234 ?auto_60236 ) ) ( not ( = ?auto_60245 ?auto_60236 ) ) ( TRUCK-AT ?auto_60242 ?auto_60237 ) ( SURFACE-AT ?auto_60243 ?auto_60237 ) ( CLEAR ?auto_60243 ) ( IS-CRATE ?auto_60245 ) ( not ( = ?auto_60232 ?auto_60243 ) ) ( not ( = ?auto_60233 ?auto_60243 ) ) ( not ( = ?auto_60239 ?auto_60243 ) ) ( not ( = ?auto_60244 ?auto_60243 ) ) ( not ( = ?auto_60234 ?auto_60243 ) ) ( not ( = ?auto_60245 ?auto_60243 ) ) ( not ( = ?auto_60236 ?auto_60243 ) ) ( AVAILABLE ?auto_60246 ) ( IN ?auto_60245 ?auto_60242 ) )
    :subtasks
    ( ( !UNLOAD ?auto_60246 ?auto_60245 ?auto_60242 ?auto_60237 )
      ( MAKE-ON ?auto_60232 ?auto_60233 )
      ( MAKE-ON-VERIFY ?auto_60232 ?auto_60233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60249 - SURFACE
      ?auto_60250 - SURFACE
    )
    :vars
    (
      ?auto_60255 - HOIST
      ?auto_60251 - PLACE
      ?auto_60265 - PLACE
      ?auto_60264 - HOIST
      ?auto_60259 - SURFACE
      ?auto_60254 - SURFACE
      ?auto_60262 - PLACE
      ?auto_60261 - HOIST
      ?auto_60252 - SURFACE
      ?auto_60257 - SURFACE
      ?auto_60263 - PLACE
      ?auto_60253 - HOIST
      ?auto_60260 - SURFACE
      ?auto_60256 - SURFACE
      ?auto_60258 - TRUCK
      ?auto_60266 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60255 ?auto_60251 ) ( IS-CRATE ?auto_60249 ) ( not ( = ?auto_60249 ?auto_60250 ) ) ( not ( = ?auto_60265 ?auto_60251 ) ) ( HOIST-AT ?auto_60264 ?auto_60265 ) ( not ( = ?auto_60255 ?auto_60264 ) ) ( AVAILABLE ?auto_60264 ) ( SURFACE-AT ?auto_60249 ?auto_60265 ) ( ON ?auto_60249 ?auto_60259 ) ( CLEAR ?auto_60249 ) ( not ( = ?auto_60249 ?auto_60259 ) ) ( not ( = ?auto_60250 ?auto_60259 ) ) ( IS-CRATE ?auto_60250 ) ( not ( = ?auto_60249 ?auto_60254 ) ) ( not ( = ?auto_60250 ?auto_60254 ) ) ( not ( = ?auto_60259 ?auto_60254 ) ) ( not ( = ?auto_60262 ?auto_60251 ) ) ( not ( = ?auto_60265 ?auto_60262 ) ) ( HOIST-AT ?auto_60261 ?auto_60262 ) ( not ( = ?auto_60255 ?auto_60261 ) ) ( not ( = ?auto_60264 ?auto_60261 ) ) ( AVAILABLE ?auto_60261 ) ( SURFACE-AT ?auto_60250 ?auto_60262 ) ( ON ?auto_60250 ?auto_60252 ) ( CLEAR ?auto_60250 ) ( not ( = ?auto_60249 ?auto_60252 ) ) ( not ( = ?auto_60250 ?auto_60252 ) ) ( not ( = ?auto_60259 ?auto_60252 ) ) ( not ( = ?auto_60254 ?auto_60252 ) ) ( IS-CRATE ?auto_60254 ) ( not ( = ?auto_60249 ?auto_60257 ) ) ( not ( = ?auto_60250 ?auto_60257 ) ) ( not ( = ?auto_60259 ?auto_60257 ) ) ( not ( = ?auto_60254 ?auto_60257 ) ) ( not ( = ?auto_60252 ?auto_60257 ) ) ( not ( = ?auto_60263 ?auto_60251 ) ) ( not ( = ?auto_60265 ?auto_60263 ) ) ( not ( = ?auto_60262 ?auto_60263 ) ) ( HOIST-AT ?auto_60253 ?auto_60263 ) ( not ( = ?auto_60255 ?auto_60253 ) ) ( not ( = ?auto_60264 ?auto_60253 ) ) ( not ( = ?auto_60261 ?auto_60253 ) ) ( AVAILABLE ?auto_60253 ) ( SURFACE-AT ?auto_60254 ?auto_60263 ) ( ON ?auto_60254 ?auto_60260 ) ( CLEAR ?auto_60254 ) ( not ( = ?auto_60249 ?auto_60260 ) ) ( not ( = ?auto_60250 ?auto_60260 ) ) ( not ( = ?auto_60259 ?auto_60260 ) ) ( not ( = ?auto_60254 ?auto_60260 ) ) ( not ( = ?auto_60252 ?auto_60260 ) ) ( not ( = ?auto_60257 ?auto_60260 ) ) ( SURFACE-AT ?auto_60256 ?auto_60251 ) ( CLEAR ?auto_60256 ) ( IS-CRATE ?auto_60257 ) ( not ( = ?auto_60249 ?auto_60256 ) ) ( not ( = ?auto_60250 ?auto_60256 ) ) ( not ( = ?auto_60259 ?auto_60256 ) ) ( not ( = ?auto_60254 ?auto_60256 ) ) ( not ( = ?auto_60252 ?auto_60256 ) ) ( not ( = ?auto_60257 ?auto_60256 ) ) ( not ( = ?auto_60260 ?auto_60256 ) ) ( AVAILABLE ?auto_60255 ) ( IN ?auto_60257 ?auto_60258 ) ( TRUCK-AT ?auto_60258 ?auto_60266 ) ( not ( = ?auto_60266 ?auto_60251 ) ) ( not ( = ?auto_60265 ?auto_60266 ) ) ( not ( = ?auto_60262 ?auto_60266 ) ) ( not ( = ?auto_60263 ?auto_60266 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_60258 ?auto_60266 ?auto_60251 )
      ( MAKE-ON ?auto_60249 ?auto_60250 )
      ( MAKE-ON-VERIFY ?auto_60249 ?auto_60250 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60267 - SURFACE
      ?auto_60268 - SURFACE
    )
    :vars
    (
      ?auto_60282 - HOIST
      ?auto_60272 - PLACE
      ?auto_60278 - PLACE
      ?auto_60269 - HOIST
      ?auto_60274 - SURFACE
      ?auto_60279 - SURFACE
      ?auto_60277 - PLACE
      ?auto_60275 - HOIST
      ?auto_60273 - SURFACE
      ?auto_60281 - SURFACE
      ?auto_60283 - PLACE
      ?auto_60284 - HOIST
      ?auto_60280 - SURFACE
      ?auto_60271 - SURFACE
      ?auto_60270 - TRUCK
      ?auto_60276 - PLACE
      ?auto_60285 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_60282 ?auto_60272 ) ( IS-CRATE ?auto_60267 ) ( not ( = ?auto_60267 ?auto_60268 ) ) ( not ( = ?auto_60278 ?auto_60272 ) ) ( HOIST-AT ?auto_60269 ?auto_60278 ) ( not ( = ?auto_60282 ?auto_60269 ) ) ( AVAILABLE ?auto_60269 ) ( SURFACE-AT ?auto_60267 ?auto_60278 ) ( ON ?auto_60267 ?auto_60274 ) ( CLEAR ?auto_60267 ) ( not ( = ?auto_60267 ?auto_60274 ) ) ( not ( = ?auto_60268 ?auto_60274 ) ) ( IS-CRATE ?auto_60268 ) ( not ( = ?auto_60267 ?auto_60279 ) ) ( not ( = ?auto_60268 ?auto_60279 ) ) ( not ( = ?auto_60274 ?auto_60279 ) ) ( not ( = ?auto_60277 ?auto_60272 ) ) ( not ( = ?auto_60278 ?auto_60277 ) ) ( HOIST-AT ?auto_60275 ?auto_60277 ) ( not ( = ?auto_60282 ?auto_60275 ) ) ( not ( = ?auto_60269 ?auto_60275 ) ) ( AVAILABLE ?auto_60275 ) ( SURFACE-AT ?auto_60268 ?auto_60277 ) ( ON ?auto_60268 ?auto_60273 ) ( CLEAR ?auto_60268 ) ( not ( = ?auto_60267 ?auto_60273 ) ) ( not ( = ?auto_60268 ?auto_60273 ) ) ( not ( = ?auto_60274 ?auto_60273 ) ) ( not ( = ?auto_60279 ?auto_60273 ) ) ( IS-CRATE ?auto_60279 ) ( not ( = ?auto_60267 ?auto_60281 ) ) ( not ( = ?auto_60268 ?auto_60281 ) ) ( not ( = ?auto_60274 ?auto_60281 ) ) ( not ( = ?auto_60279 ?auto_60281 ) ) ( not ( = ?auto_60273 ?auto_60281 ) ) ( not ( = ?auto_60283 ?auto_60272 ) ) ( not ( = ?auto_60278 ?auto_60283 ) ) ( not ( = ?auto_60277 ?auto_60283 ) ) ( HOIST-AT ?auto_60284 ?auto_60283 ) ( not ( = ?auto_60282 ?auto_60284 ) ) ( not ( = ?auto_60269 ?auto_60284 ) ) ( not ( = ?auto_60275 ?auto_60284 ) ) ( AVAILABLE ?auto_60284 ) ( SURFACE-AT ?auto_60279 ?auto_60283 ) ( ON ?auto_60279 ?auto_60280 ) ( CLEAR ?auto_60279 ) ( not ( = ?auto_60267 ?auto_60280 ) ) ( not ( = ?auto_60268 ?auto_60280 ) ) ( not ( = ?auto_60274 ?auto_60280 ) ) ( not ( = ?auto_60279 ?auto_60280 ) ) ( not ( = ?auto_60273 ?auto_60280 ) ) ( not ( = ?auto_60281 ?auto_60280 ) ) ( SURFACE-AT ?auto_60271 ?auto_60272 ) ( CLEAR ?auto_60271 ) ( IS-CRATE ?auto_60281 ) ( not ( = ?auto_60267 ?auto_60271 ) ) ( not ( = ?auto_60268 ?auto_60271 ) ) ( not ( = ?auto_60274 ?auto_60271 ) ) ( not ( = ?auto_60279 ?auto_60271 ) ) ( not ( = ?auto_60273 ?auto_60271 ) ) ( not ( = ?auto_60281 ?auto_60271 ) ) ( not ( = ?auto_60280 ?auto_60271 ) ) ( AVAILABLE ?auto_60282 ) ( TRUCK-AT ?auto_60270 ?auto_60276 ) ( not ( = ?auto_60276 ?auto_60272 ) ) ( not ( = ?auto_60278 ?auto_60276 ) ) ( not ( = ?auto_60277 ?auto_60276 ) ) ( not ( = ?auto_60283 ?auto_60276 ) ) ( HOIST-AT ?auto_60285 ?auto_60276 ) ( LIFTING ?auto_60285 ?auto_60281 ) ( not ( = ?auto_60282 ?auto_60285 ) ) ( not ( = ?auto_60269 ?auto_60285 ) ) ( not ( = ?auto_60275 ?auto_60285 ) ) ( not ( = ?auto_60284 ?auto_60285 ) ) )
    :subtasks
    ( ( !LOAD ?auto_60285 ?auto_60281 ?auto_60270 ?auto_60276 )
      ( MAKE-ON ?auto_60267 ?auto_60268 )
      ( MAKE-ON-VERIFY ?auto_60267 ?auto_60268 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60286 - SURFACE
      ?auto_60287 - SURFACE
    )
    :vars
    (
      ?auto_60296 - HOIST
      ?auto_60304 - PLACE
      ?auto_60289 - PLACE
      ?auto_60295 - HOIST
      ?auto_60300 - SURFACE
      ?auto_60290 - SURFACE
      ?auto_60303 - PLACE
      ?auto_60299 - HOIST
      ?auto_60294 - SURFACE
      ?auto_60298 - SURFACE
      ?auto_60292 - PLACE
      ?auto_60302 - HOIST
      ?auto_60291 - SURFACE
      ?auto_60293 - SURFACE
      ?auto_60288 - TRUCK
      ?auto_60301 - PLACE
      ?auto_60297 - HOIST
      ?auto_60305 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60296 ?auto_60304 ) ( IS-CRATE ?auto_60286 ) ( not ( = ?auto_60286 ?auto_60287 ) ) ( not ( = ?auto_60289 ?auto_60304 ) ) ( HOIST-AT ?auto_60295 ?auto_60289 ) ( not ( = ?auto_60296 ?auto_60295 ) ) ( AVAILABLE ?auto_60295 ) ( SURFACE-AT ?auto_60286 ?auto_60289 ) ( ON ?auto_60286 ?auto_60300 ) ( CLEAR ?auto_60286 ) ( not ( = ?auto_60286 ?auto_60300 ) ) ( not ( = ?auto_60287 ?auto_60300 ) ) ( IS-CRATE ?auto_60287 ) ( not ( = ?auto_60286 ?auto_60290 ) ) ( not ( = ?auto_60287 ?auto_60290 ) ) ( not ( = ?auto_60300 ?auto_60290 ) ) ( not ( = ?auto_60303 ?auto_60304 ) ) ( not ( = ?auto_60289 ?auto_60303 ) ) ( HOIST-AT ?auto_60299 ?auto_60303 ) ( not ( = ?auto_60296 ?auto_60299 ) ) ( not ( = ?auto_60295 ?auto_60299 ) ) ( AVAILABLE ?auto_60299 ) ( SURFACE-AT ?auto_60287 ?auto_60303 ) ( ON ?auto_60287 ?auto_60294 ) ( CLEAR ?auto_60287 ) ( not ( = ?auto_60286 ?auto_60294 ) ) ( not ( = ?auto_60287 ?auto_60294 ) ) ( not ( = ?auto_60300 ?auto_60294 ) ) ( not ( = ?auto_60290 ?auto_60294 ) ) ( IS-CRATE ?auto_60290 ) ( not ( = ?auto_60286 ?auto_60298 ) ) ( not ( = ?auto_60287 ?auto_60298 ) ) ( not ( = ?auto_60300 ?auto_60298 ) ) ( not ( = ?auto_60290 ?auto_60298 ) ) ( not ( = ?auto_60294 ?auto_60298 ) ) ( not ( = ?auto_60292 ?auto_60304 ) ) ( not ( = ?auto_60289 ?auto_60292 ) ) ( not ( = ?auto_60303 ?auto_60292 ) ) ( HOIST-AT ?auto_60302 ?auto_60292 ) ( not ( = ?auto_60296 ?auto_60302 ) ) ( not ( = ?auto_60295 ?auto_60302 ) ) ( not ( = ?auto_60299 ?auto_60302 ) ) ( AVAILABLE ?auto_60302 ) ( SURFACE-AT ?auto_60290 ?auto_60292 ) ( ON ?auto_60290 ?auto_60291 ) ( CLEAR ?auto_60290 ) ( not ( = ?auto_60286 ?auto_60291 ) ) ( not ( = ?auto_60287 ?auto_60291 ) ) ( not ( = ?auto_60300 ?auto_60291 ) ) ( not ( = ?auto_60290 ?auto_60291 ) ) ( not ( = ?auto_60294 ?auto_60291 ) ) ( not ( = ?auto_60298 ?auto_60291 ) ) ( SURFACE-AT ?auto_60293 ?auto_60304 ) ( CLEAR ?auto_60293 ) ( IS-CRATE ?auto_60298 ) ( not ( = ?auto_60286 ?auto_60293 ) ) ( not ( = ?auto_60287 ?auto_60293 ) ) ( not ( = ?auto_60300 ?auto_60293 ) ) ( not ( = ?auto_60290 ?auto_60293 ) ) ( not ( = ?auto_60294 ?auto_60293 ) ) ( not ( = ?auto_60298 ?auto_60293 ) ) ( not ( = ?auto_60291 ?auto_60293 ) ) ( AVAILABLE ?auto_60296 ) ( TRUCK-AT ?auto_60288 ?auto_60301 ) ( not ( = ?auto_60301 ?auto_60304 ) ) ( not ( = ?auto_60289 ?auto_60301 ) ) ( not ( = ?auto_60303 ?auto_60301 ) ) ( not ( = ?auto_60292 ?auto_60301 ) ) ( HOIST-AT ?auto_60297 ?auto_60301 ) ( not ( = ?auto_60296 ?auto_60297 ) ) ( not ( = ?auto_60295 ?auto_60297 ) ) ( not ( = ?auto_60299 ?auto_60297 ) ) ( not ( = ?auto_60302 ?auto_60297 ) ) ( AVAILABLE ?auto_60297 ) ( SURFACE-AT ?auto_60298 ?auto_60301 ) ( ON ?auto_60298 ?auto_60305 ) ( CLEAR ?auto_60298 ) ( not ( = ?auto_60286 ?auto_60305 ) ) ( not ( = ?auto_60287 ?auto_60305 ) ) ( not ( = ?auto_60300 ?auto_60305 ) ) ( not ( = ?auto_60290 ?auto_60305 ) ) ( not ( = ?auto_60294 ?auto_60305 ) ) ( not ( = ?auto_60298 ?auto_60305 ) ) ( not ( = ?auto_60291 ?auto_60305 ) ) ( not ( = ?auto_60293 ?auto_60305 ) ) )
    :subtasks
    ( ( !LIFT ?auto_60297 ?auto_60298 ?auto_60305 ?auto_60301 )
      ( MAKE-ON ?auto_60286 ?auto_60287 )
      ( MAKE-ON-VERIFY ?auto_60286 ?auto_60287 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60306 - SURFACE
      ?auto_60307 - SURFACE
    )
    :vars
    (
      ?auto_60313 - HOIST
      ?auto_60325 - PLACE
      ?auto_60310 - PLACE
      ?auto_60311 - HOIST
      ?auto_60323 - SURFACE
      ?auto_60317 - SURFACE
      ?auto_60321 - PLACE
      ?auto_60316 - HOIST
      ?auto_60308 - SURFACE
      ?auto_60315 - SURFACE
      ?auto_60319 - PLACE
      ?auto_60309 - HOIST
      ?auto_60312 - SURFACE
      ?auto_60320 - SURFACE
      ?auto_60314 - PLACE
      ?auto_60322 - HOIST
      ?auto_60318 - SURFACE
      ?auto_60324 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60313 ?auto_60325 ) ( IS-CRATE ?auto_60306 ) ( not ( = ?auto_60306 ?auto_60307 ) ) ( not ( = ?auto_60310 ?auto_60325 ) ) ( HOIST-AT ?auto_60311 ?auto_60310 ) ( not ( = ?auto_60313 ?auto_60311 ) ) ( AVAILABLE ?auto_60311 ) ( SURFACE-AT ?auto_60306 ?auto_60310 ) ( ON ?auto_60306 ?auto_60323 ) ( CLEAR ?auto_60306 ) ( not ( = ?auto_60306 ?auto_60323 ) ) ( not ( = ?auto_60307 ?auto_60323 ) ) ( IS-CRATE ?auto_60307 ) ( not ( = ?auto_60306 ?auto_60317 ) ) ( not ( = ?auto_60307 ?auto_60317 ) ) ( not ( = ?auto_60323 ?auto_60317 ) ) ( not ( = ?auto_60321 ?auto_60325 ) ) ( not ( = ?auto_60310 ?auto_60321 ) ) ( HOIST-AT ?auto_60316 ?auto_60321 ) ( not ( = ?auto_60313 ?auto_60316 ) ) ( not ( = ?auto_60311 ?auto_60316 ) ) ( AVAILABLE ?auto_60316 ) ( SURFACE-AT ?auto_60307 ?auto_60321 ) ( ON ?auto_60307 ?auto_60308 ) ( CLEAR ?auto_60307 ) ( not ( = ?auto_60306 ?auto_60308 ) ) ( not ( = ?auto_60307 ?auto_60308 ) ) ( not ( = ?auto_60323 ?auto_60308 ) ) ( not ( = ?auto_60317 ?auto_60308 ) ) ( IS-CRATE ?auto_60317 ) ( not ( = ?auto_60306 ?auto_60315 ) ) ( not ( = ?auto_60307 ?auto_60315 ) ) ( not ( = ?auto_60323 ?auto_60315 ) ) ( not ( = ?auto_60317 ?auto_60315 ) ) ( not ( = ?auto_60308 ?auto_60315 ) ) ( not ( = ?auto_60319 ?auto_60325 ) ) ( not ( = ?auto_60310 ?auto_60319 ) ) ( not ( = ?auto_60321 ?auto_60319 ) ) ( HOIST-AT ?auto_60309 ?auto_60319 ) ( not ( = ?auto_60313 ?auto_60309 ) ) ( not ( = ?auto_60311 ?auto_60309 ) ) ( not ( = ?auto_60316 ?auto_60309 ) ) ( AVAILABLE ?auto_60309 ) ( SURFACE-AT ?auto_60317 ?auto_60319 ) ( ON ?auto_60317 ?auto_60312 ) ( CLEAR ?auto_60317 ) ( not ( = ?auto_60306 ?auto_60312 ) ) ( not ( = ?auto_60307 ?auto_60312 ) ) ( not ( = ?auto_60323 ?auto_60312 ) ) ( not ( = ?auto_60317 ?auto_60312 ) ) ( not ( = ?auto_60308 ?auto_60312 ) ) ( not ( = ?auto_60315 ?auto_60312 ) ) ( SURFACE-AT ?auto_60320 ?auto_60325 ) ( CLEAR ?auto_60320 ) ( IS-CRATE ?auto_60315 ) ( not ( = ?auto_60306 ?auto_60320 ) ) ( not ( = ?auto_60307 ?auto_60320 ) ) ( not ( = ?auto_60323 ?auto_60320 ) ) ( not ( = ?auto_60317 ?auto_60320 ) ) ( not ( = ?auto_60308 ?auto_60320 ) ) ( not ( = ?auto_60315 ?auto_60320 ) ) ( not ( = ?auto_60312 ?auto_60320 ) ) ( AVAILABLE ?auto_60313 ) ( not ( = ?auto_60314 ?auto_60325 ) ) ( not ( = ?auto_60310 ?auto_60314 ) ) ( not ( = ?auto_60321 ?auto_60314 ) ) ( not ( = ?auto_60319 ?auto_60314 ) ) ( HOIST-AT ?auto_60322 ?auto_60314 ) ( not ( = ?auto_60313 ?auto_60322 ) ) ( not ( = ?auto_60311 ?auto_60322 ) ) ( not ( = ?auto_60316 ?auto_60322 ) ) ( not ( = ?auto_60309 ?auto_60322 ) ) ( AVAILABLE ?auto_60322 ) ( SURFACE-AT ?auto_60315 ?auto_60314 ) ( ON ?auto_60315 ?auto_60318 ) ( CLEAR ?auto_60315 ) ( not ( = ?auto_60306 ?auto_60318 ) ) ( not ( = ?auto_60307 ?auto_60318 ) ) ( not ( = ?auto_60323 ?auto_60318 ) ) ( not ( = ?auto_60317 ?auto_60318 ) ) ( not ( = ?auto_60308 ?auto_60318 ) ) ( not ( = ?auto_60315 ?auto_60318 ) ) ( not ( = ?auto_60312 ?auto_60318 ) ) ( not ( = ?auto_60320 ?auto_60318 ) ) ( TRUCK-AT ?auto_60324 ?auto_60325 ) )
    :subtasks
    ( ( !DRIVE ?auto_60324 ?auto_60325 ?auto_60314 )
      ( MAKE-ON ?auto_60306 ?auto_60307 )
      ( MAKE-ON-VERIFY ?auto_60306 ?auto_60307 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60326 - SURFACE
      ?auto_60327 - SURFACE
    )
    :vars
    (
      ?auto_60336 - HOIST
      ?auto_60343 - PLACE
      ?auto_60345 - PLACE
      ?auto_60329 - HOIST
      ?auto_60339 - SURFACE
      ?auto_60334 - SURFACE
      ?auto_60344 - PLACE
      ?auto_60330 - HOIST
      ?auto_60332 - SURFACE
      ?auto_60331 - SURFACE
      ?auto_60335 - PLACE
      ?auto_60340 - HOIST
      ?auto_60328 - SURFACE
      ?auto_60333 - SURFACE
      ?auto_60338 - PLACE
      ?auto_60337 - HOIST
      ?auto_60341 - SURFACE
      ?auto_60342 - TRUCK
      ?auto_60346 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60336 ?auto_60343 ) ( IS-CRATE ?auto_60326 ) ( not ( = ?auto_60326 ?auto_60327 ) ) ( not ( = ?auto_60345 ?auto_60343 ) ) ( HOIST-AT ?auto_60329 ?auto_60345 ) ( not ( = ?auto_60336 ?auto_60329 ) ) ( AVAILABLE ?auto_60329 ) ( SURFACE-AT ?auto_60326 ?auto_60345 ) ( ON ?auto_60326 ?auto_60339 ) ( CLEAR ?auto_60326 ) ( not ( = ?auto_60326 ?auto_60339 ) ) ( not ( = ?auto_60327 ?auto_60339 ) ) ( IS-CRATE ?auto_60327 ) ( not ( = ?auto_60326 ?auto_60334 ) ) ( not ( = ?auto_60327 ?auto_60334 ) ) ( not ( = ?auto_60339 ?auto_60334 ) ) ( not ( = ?auto_60344 ?auto_60343 ) ) ( not ( = ?auto_60345 ?auto_60344 ) ) ( HOIST-AT ?auto_60330 ?auto_60344 ) ( not ( = ?auto_60336 ?auto_60330 ) ) ( not ( = ?auto_60329 ?auto_60330 ) ) ( AVAILABLE ?auto_60330 ) ( SURFACE-AT ?auto_60327 ?auto_60344 ) ( ON ?auto_60327 ?auto_60332 ) ( CLEAR ?auto_60327 ) ( not ( = ?auto_60326 ?auto_60332 ) ) ( not ( = ?auto_60327 ?auto_60332 ) ) ( not ( = ?auto_60339 ?auto_60332 ) ) ( not ( = ?auto_60334 ?auto_60332 ) ) ( IS-CRATE ?auto_60334 ) ( not ( = ?auto_60326 ?auto_60331 ) ) ( not ( = ?auto_60327 ?auto_60331 ) ) ( not ( = ?auto_60339 ?auto_60331 ) ) ( not ( = ?auto_60334 ?auto_60331 ) ) ( not ( = ?auto_60332 ?auto_60331 ) ) ( not ( = ?auto_60335 ?auto_60343 ) ) ( not ( = ?auto_60345 ?auto_60335 ) ) ( not ( = ?auto_60344 ?auto_60335 ) ) ( HOIST-AT ?auto_60340 ?auto_60335 ) ( not ( = ?auto_60336 ?auto_60340 ) ) ( not ( = ?auto_60329 ?auto_60340 ) ) ( not ( = ?auto_60330 ?auto_60340 ) ) ( AVAILABLE ?auto_60340 ) ( SURFACE-AT ?auto_60334 ?auto_60335 ) ( ON ?auto_60334 ?auto_60328 ) ( CLEAR ?auto_60334 ) ( not ( = ?auto_60326 ?auto_60328 ) ) ( not ( = ?auto_60327 ?auto_60328 ) ) ( not ( = ?auto_60339 ?auto_60328 ) ) ( not ( = ?auto_60334 ?auto_60328 ) ) ( not ( = ?auto_60332 ?auto_60328 ) ) ( not ( = ?auto_60331 ?auto_60328 ) ) ( IS-CRATE ?auto_60331 ) ( not ( = ?auto_60326 ?auto_60333 ) ) ( not ( = ?auto_60327 ?auto_60333 ) ) ( not ( = ?auto_60339 ?auto_60333 ) ) ( not ( = ?auto_60334 ?auto_60333 ) ) ( not ( = ?auto_60332 ?auto_60333 ) ) ( not ( = ?auto_60331 ?auto_60333 ) ) ( not ( = ?auto_60328 ?auto_60333 ) ) ( not ( = ?auto_60338 ?auto_60343 ) ) ( not ( = ?auto_60345 ?auto_60338 ) ) ( not ( = ?auto_60344 ?auto_60338 ) ) ( not ( = ?auto_60335 ?auto_60338 ) ) ( HOIST-AT ?auto_60337 ?auto_60338 ) ( not ( = ?auto_60336 ?auto_60337 ) ) ( not ( = ?auto_60329 ?auto_60337 ) ) ( not ( = ?auto_60330 ?auto_60337 ) ) ( not ( = ?auto_60340 ?auto_60337 ) ) ( AVAILABLE ?auto_60337 ) ( SURFACE-AT ?auto_60331 ?auto_60338 ) ( ON ?auto_60331 ?auto_60341 ) ( CLEAR ?auto_60331 ) ( not ( = ?auto_60326 ?auto_60341 ) ) ( not ( = ?auto_60327 ?auto_60341 ) ) ( not ( = ?auto_60339 ?auto_60341 ) ) ( not ( = ?auto_60334 ?auto_60341 ) ) ( not ( = ?auto_60332 ?auto_60341 ) ) ( not ( = ?auto_60331 ?auto_60341 ) ) ( not ( = ?auto_60328 ?auto_60341 ) ) ( not ( = ?auto_60333 ?auto_60341 ) ) ( TRUCK-AT ?auto_60342 ?auto_60343 ) ( SURFACE-AT ?auto_60346 ?auto_60343 ) ( CLEAR ?auto_60346 ) ( LIFTING ?auto_60336 ?auto_60333 ) ( IS-CRATE ?auto_60333 ) ( not ( = ?auto_60326 ?auto_60346 ) ) ( not ( = ?auto_60327 ?auto_60346 ) ) ( not ( = ?auto_60339 ?auto_60346 ) ) ( not ( = ?auto_60334 ?auto_60346 ) ) ( not ( = ?auto_60332 ?auto_60346 ) ) ( not ( = ?auto_60331 ?auto_60346 ) ) ( not ( = ?auto_60328 ?auto_60346 ) ) ( not ( = ?auto_60333 ?auto_60346 ) ) ( not ( = ?auto_60341 ?auto_60346 ) ) )
    :subtasks
    ( ( !DROP ?auto_60336 ?auto_60333 ?auto_60346 ?auto_60343 )
      ( MAKE-ON ?auto_60326 ?auto_60327 )
      ( MAKE-ON-VERIFY ?auto_60326 ?auto_60327 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60347 - SURFACE
      ?auto_60348 - SURFACE
    )
    :vars
    (
      ?auto_60365 - HOIST
      ?auto_60360 - PLACE
      ?auto_60351 - PLACE
      ?auto_60358 - HOIST
      ?auto_60367 - SURFACE
      ?auto_60357 - SURFACE
      ?auto_60366 - PLACE
      ?auto_60349 - HOIST
      ?auto_60352 - SURFACE
      ?auto_60350 - SURFACE
      ?auto_60353 - PLACE
      ?auto_60356 - HOIST
      ?auto_60354 - SURFACE
      ?auto_60355 - SURFACE
      ?auto_60361 - PLACE
      ?auto_60364 - HOIST
      ?auto_60362 - SURFACE
      ?auto_60363 - TRUCK
      ?auto_60359 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60365 ?auto_60360 ) ( IS-CRATE ?auto_60347 ) ( not ( = ?auto_60347 ?auto_60348 ) ) ( not ( = ?auto_60351 ?auto_60360 ) ) ( HOIST-AT ?auto_60358 ?auto_60351 ) ( not ( = ?auto_60365 ?auto_60358 ) ) ( AVAILABLE ?auto_60358 ) ( SURFACE-AT ?auto_60347 ?auto_60351 ) ( ON ?auto_60347 ?auto_60367 ) ( CLEAR ?auto_60347 ) ( not ( = ?auto_60347 ?auto_60367 ) ) ( not ( = ?auto_60348 ?auto_60367 ) ) ( IS-CRATE ?auto_60348 ) ( not ( = ?auto_60347 ?auto_60357 ) ) ( not ( = ?auto_60348 ?auto_60357 ) ) ( not ( = ?auto_60367 ?auto_60357 ) ) ( not ( = ?auto_60366 ?auto_60360 ) ) ( not ( = ?auto_60351 ?auto_60366 ) ) ( HOIST-AT ?auto_60349 ?auto_60366 ) ( not ( = ?auto_60365 ?auto_60349 ) ) ( not ( = ?auto_60358 ?auto_60349 ) ) ( AVAILABLE ?auto_60349 ) ( SURFACE-AT ?auto_60348 ?auto_60366 ) ( ON ?auto_60348 ?auto_60352 ) ( CLEAR ?auto_60348 ) ( not ( = ?auto_60347 ?auto_60352 ) ) ( not ( = ?auto_60348 ?auto_60352 ) ) ( not ( = ?auto_60367 ?auto_60352 ) ) ( not ( = ?auto_60357 ?auto_60352 ) ) ( IS-CRATE ?auto_60357 ) ( not ( = ?auto_60347 ?auto_60350 ) ) ( not ( = ?auto_60348 ?auto_60350 ) ) ( not ( = ?auto_60367 ?auto_60350 ) ) ( not ( = ?auto_60357 ?auto_60350 ) ) ( not ( = ?auto_60352 ?auto_60350 ) ) ( not ( = ?auto_60353 ?auto_60360 ) ) ( not ( = ?auto_60351 ?auto_60353 ) ) ( not ( = ?auto_60366 ?auto_60353 ) ) ( HOIST-AT ?auto_60356 ?auto_60353 ) ( not ( = ?auto_60365 ?auto_60356 ) ) ( not ( = ?auto_60358 ?auto_60356 ) ) ( not ( = ?auto_60349 ?auto_60356 ) ) ( AVAILABLE ?auto_60356 ) ( SURFACE-AT ?auto_60357 ?auto_60353 ) ( ON ?auto_60357 ?auto_60354 ) ( CLEAR ?auto_60357 ) ( not ( = ?auto_60347 ?auto_60354 ) ) ( not ( = ?auto_60348 ?auto_60354 ) ) ( not ( = ?auto_60367 ?auto_60354 ) ) ( not ( = ?auto_60357 ?auto_60354 ) ) ( not ( = ?auto_60352 ?auto_60354 ) ) ( not ( = ?auto_60350 ?auto_60354 ) ) ( IS-CRATE ?auto_60350 ) ( not ( = ?auto_60347 ?auto_60355 ) ) ( not ( = ?auto_60348 ?auto_60355 ) ) ( not ( = ?auto_60367 ?auto_60355 ) ) ( not ( = ?auto_60357 ?auto_60355 ) ) ( not ( = ?auto_60352 ?auto_60355 ) ) ( not ( = ?auto_60350 ?auto_60355 ) ) ( not ( = ?auto_60354 ?auto_60355 ) ) ( not ( = ?auto_60361 ?auto_60360 ) ) ( not ( = ?auto_60351 ?auto_60361 ) ) ( not ( = ?auto_60366 ?auto_60361 ) ) ( not ( = ?auto_60353 ?auto_60361 ) ) ( HOIST-AT ?auto_60364 ?auto_60361 ) ( not ( = ?auto_60365 ?auto_60364 ) ) ( not ( = ?auto_60358 ?auto_60364 ) ) ( not ( = ?auto_60349 ?auto_60364 ) ) ( not ( = ?auto_60356 ?auto_60364 ) ) ( AVAILABLE ?auto_60364 ) ( SURFACE-AT ?auto_60350 ?auto_60361 ) ( ON ?auto_60350 ?auto_60362 ) ( CLEAR ?auto_60350 ) ( not ( = ?auto_60347 ?auto_60362 ) ) ( not ( = ?auto_60348 ?auto_60362 ) ) ( not ( = ?auto_60367 ?auto_60362 ) ) ( not ( = ?auto_60357 ?auto_60362 ) ) ( not ( = ?auto_60352 ?auto_60362 ) ) ( not ( = ?auto_60350 ?auto_60362 ) ) ( not ( = ?auto_60354 ?auto_60362 ) ) ( not ( = ?auto_60355 ?auto_60362 ) ) ( TRUCK-AT ?auto_60363 ?auto_60360 ) ( SURFACE-AT ?auto_60359 ?auto_60360 ) ( CLEAR ?auto_60359 ) ( IS-CRATE ?auto_60355 ) ( not ( = ?auto_60347 ?auto_60359 ) ) ( not ( = ?auto_60348 ?auto_60359 ) ) ( not ( = ?auto_60367 ?auto_60359 ) ) ( not ( = ?auto_60357 ?auto_60359 ) ) ( not ( = ?auto_60352 ?auto_60359 ) ) ( not ( = ?auto_60350 ?auto_60359 ) ) ( not ( = ?auto_60354 ?auto_60359 ) ) ( not ( = ?auto_60355 ?auto_60359 ) ) ( not ( = ?auto_60362 ?auto_60359 ) ) ( AVAILABLE ?auto_60365 ) ( IN ?auto_60355 ?auto_60363 ) )
    :subtasks
    ( ( !UNLOAD ?auto_60365 ?auto_60355 ?auto_60363 ?auto_60360 )
      ( MAKE-ON ?auto_60347 ?auto_60348 )
      ( MAKE-ON-VERIFY ?auto_60347 ?auto_60348 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60368 - SURFACE
      ?auto_60369 - SURFACE
    )
    :vars
    (
      ?auto_60380 - HOIST
      ?auto_60376 - PLACE
      ?auto_60374 - PLACE
      ?auto_60383 - HOIST
      ?auto_60377 - SURFACE
      ?auto_60373 - SURFACE
      ?auto_60372 - PLACE
      ?auto_60385 - HOIST
      ?auto_60379 - SURFACE
      ?auto_60378 - SURFACE
      ?auto_60371 - PLACE
      ?auto_60382 - HOIST
      ?auto_60387 - SURFACE
      ?auto_60370 - SURFACE
      ?auto_60375 - PLACE
      ?auto_60384 - HOIST
      ?auto_60388 - SURFACE
      ?auto_60386 - SURFACE
      ?auto_60381 - TRUCK
      ?auto_60389 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60380 ?auto_60376 ) ( IS-CRATE ?auto_60368 ) ( not ( = ?auto_60368 ?auto_60369 ) ) ( not ( = ?auto_60374 ?auto_60376 ) ) ( HOIST-AT ?auto_60383 ?auto_60374 ) ( not ( = ?auto_60380 ?auto_60383 ) ) ( AVAILABLE ?auto_60383 ) ( SURFACE-AT ?auto_60368 ?auto_60374 ) ( ON ?auto_60368 ?auto_60377 ) ( CLEAR ?auto_60368 ) ( not ( = ?auto_60368 ?auto_60377 ) ) ( not ( = ?auto_60369 ?auto_60377 ) ) ( IS-CRATE ?auto_60369 ) ( not ( = ?auto_60368 ?auto_60373 ) ) ( not ( = ?auto_60369 ?auto_60373 ) ) ( not ( = ?auto_60377 ?auto_60373 ) ) ( not ( = ?auto_60372 ?auto_60376 ) ) ( not ( = ?auto_60374 ?auto_60372 ) ) ( HOIST-AT ?auto_60385 ?auto_60372 ) ( not ( = ?auto_60380 ?auto_60385 ) ) ( not ( = ?auto_60383 ?auto_60385 ) ) ( AVAILABLE ?auto_60385 ) ( SURFACE-AT ?auto_60369 ?auto_60372 ) ( ON ?auto_60369 ?auto_60379 ) ( CLEAR ?auto_60369 ) ( not ( = ?auto_60368 ?auto_60379 ) ) ( not ( = ?auto_60369 ?auto_60379 ) ) ( not ( = ?auto_60377 ?auto_60379 ) ) ( not ( = ?auto_60373 ?auto_60379 ) ) ( IS-CRATE ?auto_60373 ) ( not ( = ?auto_60368 ?auto_60378 ) ) ( not ( = ?auto_60369 ?auto_60378 ) ) ( not ( = ?auto_60377 ?auto_60378 ) ) ( not ( = ?auto_60373 ?auto_60378 ) ) ( not ( = ?auto_60379 ?auto_60378 ) ) ( not ( = ?auto_60371 ?auto_60376 ) ) ( not ( = ?auto_60374 ?auto_60371 ) ) ( not ( = ?auto_60372 ?auto_60371 ) ) ( HOIST-AT ?auto_60382 ?auto_60371 ) ( not ( = ?auto_60380 ?auto_60382 ) ) ( not ( = ?auto_60383 ?auto_60382 ) ) ( not ( = ?auto_60385 ?auto_60382 ) ) ( AVAILABLE ?auto_60382 ) ( SURFACE-AT ?auto_60373 ?auto_60371 ) ( ON ?auto_60373 ?auto_60387 ) ( CLEAR ?auto_60373 ) ( not ( = ?auto_60368 ?auto_60387 ) ) ( not ( = ?auto_60369 ?auto_60387 ) ) ( not ( = ?auto_60377 ?auto_60387 ) ) ( not ( = ?auto_60373 ?auto_60387 ) ) ( not ( = ?auto_60379 ?auto_60387 ) ) ( not ( = ?auto_60378 ?auto_60387 ) ) ( IS-CRATE ?auto_60378 ) ( not ( = ?auto_60368 ?auto_60370 ) ) ( not ( = ?auto_60369 ?auto_60370 ) ) ( not ( = ?auto_60377 ?auto_60370 ) ) ( not ( = ?auto_60373 ?auto_60370 ) ) ( not ( = ?auto_60379 ?auto_60370 ) ) ( not ( = ?auto_60378 ?auto_60370 ) ) ( not ( = ?auto_60387 ?auto_60370 ) ) ( not ( = ?auto_60375 ?auto_60376 ) ) ( not ( = ?auto_60374 ?auto_60375 ) ) ( not ( = ?auto_60372 ?auto_60375 ) ) ( not ( = ?auto_60371 ?auto_60375 ) ) ( HOIST-AT ?auto_60384 ?auto_60375 ) ( not ( = ?auto_60380 ?auto_60384 ) ) ( not ( = ?auto_60383 ?auto_60384 ) ) ( not ( = ?auto_60385 ?auto_60384 ) ) ( not ( = ?auto_60382 ?auto_60384 ) ) ( AVAILABLE ?auto_60384 ) ( SURFACE-AT ?auto_60378 ?auto_60375 ) ( ON ?auto_60378 ?auto_60388 ) ( CLEAR ?auto_60378 ) ( not ( = ?auto_60368 ?auto_60388 ) ) ( not ( = ?auto_60369 ?auto_60388 ) ) ( not ( = ?auto_60377 ?auto_60388 ) ) ( not ( = ?auto_60373 ?auto_60388 ) ) ( not ( = ?auto_60379 ?auto_60388 ) ) ( not ( = ?auto_60378 ?auto_60388 ) ) ( not ( = ?auto_60387 ?auto_60388 ) ) ( not ( = ?auto_60370 ?auto_60388 ) ) ( SURFACE-AT ?auto_60386 ?auto_60376 ) ( CLEAR ?auto_60386 ) ( IS-CRATE ?auto_60370 ) ( not ( = ?auto_60368 ?auto_60386 ) ) ( not ( = ?auto_60369 ?auto_60386 ) ) ( not ( = ?auto_60377 ?auto_60386 ) ) ( not ( = ?auto_60373 ?auto_60386 ) ) ( not ( = ?auto_60379 ?auto_60386 ) ) ( not ( = ?auto_60378 ?auto_60386 ) ) ( not ( = ?auto_60387 ?auto_60386 ) ) ( not ( = ?auto_60370 ?auto_60386 ) ) ( not ( = ?auto_60388 ?auto_60386 ) ) ( AVAILABLE ?auto_60380 ) ( IN ?auto_60370 ?auto_60381 ) ( TRUCK-AT ?auto_60381 ?auto_60389 ) ( not ( = ?auto_60389 ?auto_60376 ) ) ( not ( = ?auto_60374 ?auto_60389 ) ) ( not ( = ?auto_60372 ?auto_60389 ) ) ( not ( = ?auto_60371 ?auto_60389 ) ) ( not ( = ?auto_60375 ?auto_60389 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_60381 ?auto_60389 ?auto_60376 )
      ( MAKE-ON ?auto_60368 ?auto_60369 )
      ( MAKE-ON-VERIFY ?auto_60368 ?auto_60369 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60390 - SURFACE
      ?auto_60391 - SURFACE
    )
    :vars
    (
      ?auto_60394 - HOIST
      ?auto_60411 - PLACE
      ?auto_60403 - PLACE
      ?auto_60392 - HOIST
      ?auto_60395 - SURFACE
      ?auto_60401 - SURFACE
      ?auto_60409 - PLACE
      ?auto_60404 - HOIST
      ?auto_60393 - SURFACE
      ?auto_60410 - SURFACE
      ?auto_60398 - PLACE
      ?auto_60406 - HOIST
      ?auto_60396 - SURFACE
      ?auto_60405 - SURFACE
      ?auto_60407 - PLACE
      ?auto_60400 - HOIST
      ?auto_60397 - SURFACE
      ?auto_60408 - SURFACE
      ?auto_60399 - TRUCK
      ?auto_60402 - PLACE
      ?auto_60412 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_60394 ?auto_60411 ) ( IS-CRATE ?auto_60390 ) ( not ( = ?auto_60390 ?auto_60391 ) ) ( not ( = ?auto_60403 ?auto_60411 ) ) ( HOIST-AT ?auto_60392 ?auto_60403 ) ( not ( = ?auto_60394 ?auto_60392 ) ) ( AVAILABLE ?auto_60392 ) ( SURFACE-AT ?auto_60390 ?auto_60403 ) ( ON ?auto_60390 ?auto_60395 ) ( CLEAR ?auto_60390 ) ( not ( = ?auto_60390 ?auto_60395 ) ) ( not ( = ?auto_60391 ?auto_60395 ) ) ( IS-CRATE ?auto_60391 ) ( not ( = ?auto_60390 ?auto_60401 ) ) ( not ( = ?auto_60391 ?auto_60401 ) ) ( not ( = ?auto_60395 ?auto_60401 ) ) ( not ( = ?auto_60409 ?auto_60411 ) ) ( not ( = ?auto_60403 ?auto_60409 ) ) ( HOIST-AT ?auto_60404 ?auto_60409 ) ( not ( = ?auto_60394 ?auto_60404 ) ) ( not ( = ?auto_60392 ?auto_60404 ) ) ( AVAILABLE ?auto_60404 ) ( SURFACE-AT ?auto_60391 ?auto_60409 ) ( ON ?auto_60391 ?auto_60393 ) ( CLEAR ?auto_60391 ) ( not ( = ?auto_60390 ?auto_60393 ) ) ( not ( = ?auto_60391 ?auto_60393 ) ) ( not ( = ?auto_60395 ?auto_60393 ) ) ( not ( = ?auto_60401 ?auto_60393 ) ) ( IS-CRATE ?auto_60401 ) ( not ( = ?auto_60390 ?auto_60410 ) ) ( not ( = ?auto_60391 ?auto_60410 ) ) ( not ( = ?auto_60395 ?auto_60410 ) ) ( not ( = ?auto_60401 ?auto_60410 ) ) ( not ( = ?auto_60393 ?auto_60410 ) ) ( not ( = ?auto_60398 ?auto_60411 ) ) ( not ( = ?auto_60403 ?auto_60398 ) ) ( not ( = ?auto_60409 ?auto_60398 ) ) ( HOIST-AT ?auto_60406 ?auto_60398 ) ( not ( = ?auto_60394 ?auto_60406 ) ) ( not ( = ?auto_60392 ?auto_60406 ) ) ( not ( = ?auto_60404 ?auto_60406 ) ) ( AVAILABLE ?auto_60406 ) ( SURFACE-AT ?auto_60401 ?auto_60398 ) ( ON ?auto_60401 ?auto_60396 ) ( CLEAR ?auto_60401 ) ( not ( = ?auto_60390 ?auto_60396 ) ) ( not ( = ?auto_60391 ?auto_60396 ) ) ( not ( = ?auto_60395 ?auto_60396 ) ) ( not ( = ?auto_60401 ?auto_60396 ) ) ( not ( = ?auto_60393 ?auto_60396 ) ) ( not ( = ?auto_60410 ?auto_60396 ) ) ( IS-CRATE ?auto_60410 ) ( not ( = ?auto_60390 ?auto_60405 ) ) ( not ( = ?auto_60391 ?auto_60405 ) ) ( not ( = ?auto_60395 ?auto_60405 ) ) ( not ( = ?auto_60401 ?auto_60405 ) ) ( not ( = ?auto_60393 ?auto_60405 ) ) ( not ( = ?auto_60410 ?auto_60405 ) ) ( not ( = ?auto_60396 ?auto_60405 ) ) ( not ( = ?auto_60407 ?auto_60411 ) ) ( not ( = ?auto_60403 ?auto_60407 ) ) ( not ( = ?auto_60409 ?auto_60407 ) ) ( not ( = ?auto_60398 ?auto_60407 ) ) ( HOIST-AT ?auto_60400 ?auto_60407 ) ( not ( = ?auto_60394 ?auto_60400 ) ) ( not ( = ?auto_60392 ?auto_60400 ) ) ( not ( = ?auto_60404 ?auto_60400 ) ) ( not ( = ?auto_60406 ?auto_60400 ) ) ( AVAILABLE ?auto_60400 ) ( SURFACE-AT ?auto_60410 ?auto_60407 ) ( ON ?auto_60410 ?auto_60397 ) ( CLEAR ?auto_60410 ) ( not ( = ?auto_60390 ?auto_60397 ) ) ( not ( = ?auto_60391 ?auto_60397 ) ) ( not ( = ?auto_60395 ?auto_60397 ) ) ( not ( = ?auto_60401 ?auto_60397 ) ) ( not ( = ?auto_60393 ?auto_60397 ) ) ( not ( = ?auto_60410 ?auto_60397 ) ) ( not ( = ?auto_60396 ?auto_60397 ) ) ( not ( = ?auto_60405 ?auto_60397 ) ) ( SURFACE-AT ?auto_60408 ?auto_60411 ) ( CLEAR ?auto_60408 ) ( IS-CRATE ?auto_60405 ) ( not ( = ?auto_60390 ?auto_60408 ) ) ( not ( = ?auto_60391 ?auto_60408 ) ) ( not ( = ?auto_60395 ?auto_60408 ) ) ( not ( = ?auto_60401 ?auto_60408 ) ) ( not ( = ?auto_60393 ?auto_60408 ) ) ( not ( = ?auto_60410 ?auto_60408 ) ) ( not ( = ?auto_60396 ?auto_60408 ) ) ( not ( = ?auto_60405 ?auto_60408 ) ) ( not ( = ?auto_60397 ?auto_60408 ) ) ( AVAILABLE ?auto_60394 ) ( TRUCK-AT ?auto_60399 ?auto_60402 ) ( not ( = ?auto_60402 ?auto_60411 ) ) ( not ( = ?auto_60403 ?auto_60402 ) ) ( not ( = ?auto_60409 ?auto_60402 ) ) ( not ( = ?auto_60398 ?auto_60402 ) ) ( not ( = ?auto_60407 ?auto_60402 ) ) ( HOIST-AT ?auto_60412 ?auto_60402 ) ( LIFTING ?auto_60412 ?auto_60405 ) ( not ( = ?auto_60394 ?auto_60412 ) ) ( not ( = ?auto_60392 ?auto_60412 ) ) ( not ( = ?auto_60404 ?auto_60412 ) ) ( not ( = ?auto_60406 ?auto_60412 ) ) ( not ( = ?auto_60400 ?auto_60412 ) ) )
    :subtasks
    ( ( !LOAD ?auto_60412 ?auto_60405 ?auto_60399 ?auto_60402 )
      ( MAKE-ON ?auto_60390 ?auto_60391 )
      ( MAKE-ON-VERIFY ?auto_60390 ?auto_60391 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60413 - SURFACE
      ?auto_60414 - SURFACE
    )
    :vars
    (
      ?auto_60415 - HOIST
      ?auto_60421 - PLACE
      ?auto_60430 - PLACE
      ?auto_60423 - HOIST
      ?auto_60419 - SURFACE
      ?auto_60434 - SURFACE
      ?auto_60427 - PLACE
      ?auto_60416 - HOIST
      ?auto_60420 - SURFACE
      ?auto_60431 - SURFACE
      ?auto_60426 - PLACE
      ?auto_60418 - HOIST
      ?auto_60424 - SURFACE
      ?auto_60435 - SURFACE
      ?auto_60422 - PLACE
      ?auto_60428 - HOIST
      ?auto_60432 - SURFACE
      ?auto_60417 - SURFACE
      ?auto_60429 - TRUCK
      ?auto_60433 - PLACE
      ?auto_60425 - HOIST
      ?auto_60436 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60415 ?auto_60421 ) ( IS-CRATE ?auto_60413 ) ( not ( = ?auto_60413 ?auto_60414 ) ) ( not ( = ?auto_60430 ?auto_60421 ) ) ( HOIST-AT ?auto_60423 ?auto_60430 ) ( not ( = ?auto_60415 ?auto_60423 ) ) ( AVAILABLE ?auto_60423 ) ( SURFACE-AT ?auto_60413 ?auto_60430 ) ( ON ?auto_60413 ?auto_60419 ) ( CLEAR ?auto_60413 ) ( not ( = ?auto_60413 ?auto_60419 ) ) ( not ( = ?auto_60414 ?auto_60419 ) ) ( IS-CRATE ?auto_60414 ) ( not ( = ?auto_60413 ?auto_60434 ) ) ( not ( = ?auto_60414 ?auto_60434 ) ) ( not ( = ?auto_60419 ?auto_60434 ) ) ( not ( = ?auto_60427 ?auto_60421 ) ) ( not ( = ?auto_60430 ?auto_60427 ) ) ( HOIST-AT ?auto_60416 ?auto_60427 ) ( not ( = ?auto_60415 ?auto_60416 ) ) ( not ( = ?auto_60423 ?auto_60416 ) ) ( AVAILABLE ?auto_60416 ) ( SURFACE-AT ?auto_60414 ?auto_60427 ) ( ON ?auto_60414 ?auto_60420 ) ( CLEAR ?auto_60414 ) ( not ( = ?auto_60413 ?auto_60420 ) ) ( not ( = ?auto_60414 ?auto_60420 ) ) ( not ( = ?auto_60419 ?auto_60420 ) ) ( not ( = ?auto_60434 ?auto_60420 ) ) ( IS-CRATE ?auto_60434 ) ( not ( = ?auto_60413 ?auto_60431 ) ) ( not ( = ?auto_60414 ?auto_60431 ) ) ( not ( = ?auto_60419 ?auto_60431 ) ) ( not ( = ?auto_60434 ?auto_60431 ) ) ( not ( = ?auto_60420 ?auto_60431 ) ) ( not ( = ?auto_60426 ?auto_60421 ) ) ( not ( = ?auto_60430 ?auto_60426 ) ) ( not ( = ?auto_60427 ?auto_60426 ) ) ( HOIST-AT ?auto_60418 ?auto_60426 ) ( not ( = ?auto_60415 ?auto_60418 ) ) ( not ( = ?auto_60423 ?auto_60418 ) ) ( not ( = ?auto_60416 ?auto_60418 ) ) ( AVAILABLE ?auto_60418 ) ( SURFACE-AT ?auto_60434 ?auto_60426 ) ( ON ?auto_60434 ?auto_60424 ) ( CLEAR ?auto_60434 ) ( not ( = ?auto_60413 ?auto_60424 ) ) ( not ( = ?auto_60414 ?auto_60424 ) ) ( not ( = ?auto_60419 ?auto_60424 ) ) ( not ( = ?auto_60434 ?auto_60424 ) ) ( not ( = ?auto_60420 ?auto_60424 ) ) ( not ( = ?auto_60431 ?auto_60424 ) ) ( IS-CRATE ?auto_60431 ) ( not ( = ?auto_60413 ?auto_60435 ) ) ( not ( = ?auto_60414 ?auto_60435 ) ) ( not ( = ?auto_60419 ?auto_60435 ) ) ( not ( = ?auto_60434 ?auto_60435 ) ) ( not ( = ?auto_60420 ?auto_60435 ) ) ( not ( = ?auto_60431 ?auto_60435 ) ) ( not ( = ?auto_60424 ?auto_60435 ) ) ( not ( = ?auto_60422 ?auto_60421 ) ) ( not ( = ?auto_60430 ?auto_60422 ) ) ( not ( = ?auto_60427 ?auto_60422 ) ) ( not ( = ?auto_60426 ?auto_60422 ) ) ( HOIST-AT ?auto_60428 ?auto_60422 ) ( not ( = ?auto_60415 ?auto_60428 ) ) ( not ( = ?auto_60423 ?auto_60428 ) ) ( not ( = ?auto_60416 ?auto_60428 ) ) ( not ( = ?auto_60418 ?auto_60428 ) ) ( AVAILABLE ?auto_60428 ) ( SURFACE-AT ?auto_60431 ?auto_60422 ) ( ON ?auto_60431 ?auto_60432 ) ( CLEAR ?auto_60431 ) ( not ( = ?auto_60413 ?auto_60432 ) ) ( not ( = ?auto_60414 ?auto_60432 ) ) ( not ( = ?auto_60419 ?auto_60432 ) ) ( not ( = ?auto_60434 ?auto_60432 ) ) ( not ( = ?auto_60420 ?auto_60432 ) ) ( not ( = ?auto_60431 ?auto_60432 ) ) ( not ( = ?auto_60424 ?auto_60432 ) ) ( not ( = ?auto_60435 ?auto_60432 ) ) ( SURFACE-AT ?auto_60417 ?auto_60421 ) ( CLEAR ?auto_60417 ) ( IS-CRATE ?auto_60435 ) ( not ( = ?auto_60413 ?auto_60417 ) ) ( not ( = ?auto_60414 ?auto_60417 ) ) ( not ( = ?auto_60419 ?auto_60417 ) ) ( not ( = ?auto_60434 ?auto_60417 ) ) ( not ( = ?auto_60420 ?auto_60417 ) ) ( not ( = ?auto_60431 ?auto_60417 ) ) ( not ( = ?auto_60424 ?auto_60417 ) ) ( not ( = ?auto_60435 ?auto_60417 ) ) ( not ( = ?auto_60432 ?auto_60417 ) ) ( AVAILABLE ?auto_60415 ) ( TRUCK-AT ?auto_60429 ?auto_60433 ) ( not ( = ?auto_60433 ?auto_60421 ) ) ( not ( = ?auto_60430 ?auto_60433 ) ) ( not ( = ?auto_60427 ?auto_60433 ) ) ( not ( = ?auto_60426 ?auto_60433 ) ) ( not ( = ?auto_60422 ?auto_60433 ) ) ( HOIST-AT ?auto_60425 ?auto_60433 ) ( not ( = ?auto_60415 ?auto_60425 ) ) ( not ( = ?auto_60423 ?auto_60425 ) ) ( not ( = ?auto_60416 ?auto_60425 ) ) ( not ( = ?auto_60418 ?auto_60425 ) ) ( not ( = ?auto_60428 ?auto_60425 ) ) ( AVAILABLE ?auto_60425 ) ( SURFACE-AT ?auto_60435 ?auto_60433 ) ( ON ?auto_60435 ?auto_60436 ) ( CLEAR ?auto_60435 ) ( not ( = ?auto_60413 ?auto_60436 ) ) ( not ( = ?auto_60414 ?auto_60436 ) ) ( not ( = ?auto_60419 ?auto_60436 ) ) ( not ( = ?auto_60434 ?auto_60436 ) ) ( not ( = ?auto_60420 ?auto_60436 ) ) ( not ( = ?auto_60431 ?auto_60436 ) ) ( not ( = ?auto_60424 ?auto_60436 ) ) ( not ( = ?auto_60435 ?auto_60436 ) ) ( not ( = ?auto_60432 ?auto_60436 ) ) ( not ( = ?auto_60417 ?auto_60436 ) ) )
    :subtasks
    ( ( !LIFT ?auto_60425 ?auto_60435 ?auto_60436 ?auto_60433 )
      ( MAKE-ON ?auto_60413 ?auto_60414 )
      ( MAKE-ON-VERIFY ?auto_60413 ?auto_60414 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60437 - SURFACE
      ?auto_60438 - SURFACE
    )
    :vars
    (
      ?auto_60439 - HOIST
      ?auto_60448 - PLACE
      ?auto_60444 - PLACE
      ?auto_60441 - HOIST
      ?auto_60455 - SURFACE
      ?auto_60450 - SURFACE
      ?auto_60457 - PLACE
      ?auto_60460 - HOIST
      ?auto_60459 - SURFACE
      ?auto_60456 - SURFACE
      ?auto_60454 - PLACE
      ?auto_60458 - HOIST
      ?auto_60445 - SURFACE
      ?auto_60452 - SURFACE
      ?auto_60447 - PLACE
      ?auto_60446 - HOIST
      ?auto_60453 - SURFACE
      ?auto_60442 - SURFACE
      ?auto_60451 - PLACE
      ?auto_60443 - HOIST
      ?auto_60449 - SURFACE
      ?auto_60440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60439 ?auto_60448 ) ( IS-CRATE ?auto_60437 ) ( not ( = ?auto_60437 ?auto_60438 ) ) ( not ( = ?auto_60444 ?auto_60448 ) ) ( HOIST-AT ?auto_60441 ?auto_60444 ) ( not ( = ?auto_60439 ?auto_60441 ) ) ( AVAILABLE ?auto_60441 ) ( SURFACE-AT ?auto_60437 ?auto_60444 ) ( ON ?auto_60437 ?auto_60455 ) ( CLEAR ?auto_60437 ) ( not ( = ?auto_60437 ?auto_60455 ) ) ( not ( = ?auto_60438 ?auto_60455 ) ) ( IS-CRATE ?auto_60438 ) ( not ( = ?auto_60437 ?auto_60450 ) ) ( not ( = ?auto_60438 ?auto_60450 ) ) ( not ( = ?auto_60455 ?auto_60450 ) ) ( not ( = ?auto_60457 ?auto_60448 ) ) ( not ( = ?auto_60444 ?auto_60457 ) ) ( HOIST-AT ?auto_60460 ?auto_60457 ) ( not ( = ?auto_60439 ?auto_60460 ) ) ( not ( = ?auto_60441 ?auto_60460 ) ) ( AVAILABLE ?auto_60460 ) ( SURFACE-AT ?auto_60438 ?auto_60457 ) ( ON ?auto_60438 ?auto_60459 ) ( CLEAR ?auto_60438 ) ( not ( = ?auto_60437 ?auto_60459 ) ) ( not ( = ?auto_60438 ?auto_60459 ) ) ( not ( = ?auto_60455 ?auto_60459 ) ) ( not ( = ?auto_60450 ?auto_60459 ) ) ( IS-CRATE ?auto_60450 ) ( not ( = ?auto_60437 ?auto_60456 ) ) ( not ( = ?auto_60438 ?auto_60456 ) ) ( not ( = ?auto_60455 ?auto_60456 ) ) ( not ( = ?auto_60450 ?auto_60456 ) ) ( not ( = ?auto_60459 ?auto_60456 ) ) ( not ( = ?auto_60454 ?auto_60448 ) ) ( not ( = ?auto_60444 ?auto_60454 ) ) ( not ( = ?auto_60457 ?auto_60454 ) ) ( HOIST-AT ?auto_60458 ?auto_60454 ) ( not ( = ?auto_60439 ?auto_60458 ) ) ( not ( = ?auto_60441 ?auto_60458 ) ) ( not ( = ?auto_60460 ?auto_60458 ) ) ( AVAILABLE ?auto_60458 ) ( SURFACE-AT ?auto_60450 ?auto_60454 ) ( ON ?auto_60450 ?auto_60445 ) ( CLEAR ?auto_60450 ) ( not ( = ?auto_60437 ?auto_60445 ) ) ( not ( = ?auto_60438 ?auto_60445 ) ) ( not ( = ?auto_60455 ?auto_60445 ) ) ( not ( = ?auto_60450 ?auto_60445 ) ) ( not ( = ?auto_60459 ?auto_60445 ) ) ( not ( = ?auto_60456 ?auto_60445 ) ) ( IS-CRATE ?auto_60456 ) ( not ( = ?auto_60437 ?auto_60452 ) ) ( not ( = ?auto_60438 ?auto_60452 ) ) ( not ( = ?auto_60455 ?auto_60452 ) ) ( not ( = ?auto_60450 ?auto_60452 ) ) ( not ( = ?auto_60459 ?auto_60452 ) ) ( not ( = ?auto_60456 ?auto_60452 ) ) ( not ( = ?auto_60445 ?auto_60452 ) ) ( not ( = ?auto_60447 ?auto_60448 ) ) ( not ( = ?auto_60444 ?auto_60447 ) ) ( not ( = ?auto_60457 ?auto_60447 ) ) ( not ( = ?auto_60454 ?auto_60447 ) ) ( HOIST-AT ?auto_60446 ?auto_60447 ) ( not ( = ?auto_60439 ?auto_60446 ) ) ( not ( = ?auto_60441 ?auto_60446 ) ) ( not ( = ?auto_60460 ?auto_60446 ) ) ( not ( = ?auto_60458 ?auto_60446 ) ) ( AVAILABLE ?auto_60446 ) ( SURFACE-AT ?auto_60456 ?auto_60447 ) ( ON ?auto_60456 ?auto_60453 ) ( CLEAR ?auto_60456 ) ( not ( = ?auto_60437 ?auto_60453 ) ) ( not ( = ?auto_60438 ?auto_60453 ) ) ( not ( = ?auto_60455 ?auto_60453 ) ) ( not ( = ?auto_60450 ?auto_60453 ) ) ( not ( = ?auto_60459 ?auto_60453 ) ) ( not ( = ?auto_60456 ?auto_60453 ) ) ( not ( = ?auto_60445 ?auto_60453 ) ) ( not ( = ?auto_60452 ?auto_60453 ) ) ( SURFACE-AT ?auto_60442 ?auto_60448 ) ( CLEAR ?auto_60442 ) ( IS-CRATE ?auto_60452 ) ( not ( = ?auto_60437 ?auto_60442 ) ) ( not ( = ?auto_60438 ?auto_60442 ) ) ( not ( = ?auto_60455 ?auto_60442 ) ) ( not ( = ?auto_60450 ?auto_60442 ) ) ( not ( = ?auto_60459 ?auto_60442 ) ) ( not ( = ?auto_60456 ?auto_60442 ) ) ( not ( = ?auto_60445 ?auto_60442 ) ) ( not ( = ?auto_60452 ?auto_60442 ) ) ( not ( = ?auto_60453 ?auto_60442 ) ) ( AVAILABLE ?auto_60439 ) ( not ( = ?auto_60451 ?auto_60448 ) ) ( not ( = ?auto_60444 ?auto_60451 ) ) ( not ( = ?auto_60457 ?auto_60451 ) ) ( not ( = ?auto_60454 ?auto_60451 ) ) ( not ( = ?auto_60447 ?auto_60451 ) ) ( HOIST-AT ?auto_60443 ?auto_60451 ) ( not ( = ?auto_60439 ?auto_60443 ) ) ( not ( = ?auto_60441 ?auto_60443 ) ) ( not ( = ?auto_60460 ?auto_60443 ) ) ( not ( = ?auto_60458 ?auto_60443 ) ) ( not ( = ?auto_60446 ?auto_60443 ) ) ( AVAILABLE ?auto_60443 ) ( SURFACE-AT ?auto_60452 ?auto_60451 ) ( ON ?auto_60452 ?auto_60449 ) ( CLEAR ?auto_60452 ) ( not ( = ?auto_60437 ?auto_60449 ) ) ( not ( = ?auto_60438 ?auto_60449 ) ) ( not ( = ?auto_60455 ?auto_60449 ) ) ( not ( = ?auto_60450 ?auto_60449 ) ) ( not ( = ?auto_60459 ?auto_60449 ) ) ( not ( = ?auto_60456 ?auto_60449 ) ) ( not ( = ?auto_60445 ?auto_60449 ) ) ( not ( = ?auto_60452 ?auto_60449 ) ) ( not ( = ?auto_60453 ?auto_60449 ) ) ( not ( = ?auto_60442 ?auto_60449 ) ) ( TRUCK-AT ?auto_60440 ?auto_60448 ) )
    :subtasks
    ( ( !DRIVE ?auto_60440 ?auto_60448 ?auto_60451 )
      ( MAKE-ON ?auto_60437 ?auto_60438 )
      ( MAKE-ON-VERIFY ?auto_60437 ?auto_60438 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60463 - SURFACE
      ?auto_60464 - SURFACE
    )
    :vars
    (
      ?auto_60465 - HOIST
      ?auto_60466 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60465 ?auto_60466 ) ( SURFACE-AT ?auto_60464 ?auto_60466 ) ( CLEAR ?auto_60464 ) ( LIFTING ?auto_60465 ?auto_60463 ) ( IS-CRATE ?auto_60463 ) ( not ( = ?auto_60463 ?auto_60464 ) ) )
    :subtasks
    ( ( !DROP ?auto_60465 ?auto_60463 ?auto_60464 ?auto_60466 )
      ( MAKE-ON-VERIFY ?auto_60463 ?auto_60464 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60467 - SURFACE
      ?auto_60468 - SURFACE
    )
    :vars
    (
      ?auto_60470 - HOIST
      ?auto_60469 - PLACE
      ?auto_60471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60470 ?auto_60469 ) ( SURFACE-AT ?auto_60468 ?auto_60469 ) ( CLEAR ?auto_60468 ) ( IS-CRATE ?auto_60467 ) ( not ( = ?auto_60467 ?auto_60468 ) ) ( TRUCK-AT ?auto_60471 ?auto_60469 ) ( AVAILABLE ?auto_60470 ) ( IN ?auto_60467 ?auto_60471 ) )
    :subtasks
    ( ( !UNLOAD ?auto_60470 ?auto_60467 ?auto_60471 ?auto_60469 )
      ( MAKE-ON ?auto_60467 ?auto_60468 )
      ( MAKE-ON-VERIFY ?auto_60467 ?auto_60468 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60472 - SURFACE
      ?auto_60473 - SURFACE
    )
    :vars
    (
      ?auto_60476 - HOIST
      ?auto_60474 - PLACE
      ?auto_60475 - TRUCK
      ?auto_60477 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60476 ?auto_60474 ) ( SURFACE-AT ?auto_60473 ?auto_60474 ) ( CLEAR ?auto_60473 ) ( IS-CRATE ?auto_60472 ) ( not ( = ?auto_60472 ?auto_60473 ) ) ( AVAILABLE ?auto_60476 ) ( IN ?auto_60472 ?auto_60475 ) ( TRUCK-AT ?auto_60475 ?auto_60477 ) ( not ( = ?auto_60477 ?auto_60474 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_60475 ?auto_60477 ?auto_60474 )
      ( MAKE-ON ?auto_60472 ?auto_60473 )
      ( MAKE-ON-VERIFY ?auto_60472 ?auto_60473 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60478 - SURFACE
      ?auto_60479 - SURFACE
    )
    :vars
    (
      ?auto_60480 - HOIST
      ?auto_60481 - PLACE
      ?auto_60483 - TRUCK
      ?auto_60482 - PLACE
      ?auto_60484 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_60480 ?auto_60481 ) ( SURFACE-AT ?auto_60479 ?auto_60481 ) ( CLEAR ?auto_60479 ) ( IS-CRATE ?auto_60478 ) ( not ( = ?auto_60478 ?auto_60479 ) ) ( AVAILABLE ?auto_60480 ) ( TRUCK-AT ?auto_60483 ?auto_60482 ) ( not ( = ?auto_60482 ?auto_60481 ) ) ( HOIST-AT ?auto_60484 ?auto_60482 ) ( LIFTING ?auto_60484 ?auto_60478 ) ( not ( = ?auto_60480 ?auto_60484 ) ) )
    :subtasks
    ( ( !LOAD ?auto_60484 ?auto_60478 ?auto_60483 ?auto_60482 )
      ( MAKE-ON ?auto_60478 ?auto_60479 )
      ( MAKE-ON-VERIFY ?auto_60478 ?auto_60479 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60485 - SURFACE
      ?auto_60486 - SURFACE
    )
    :vars
    (
      ?auto_60491 - HOIST
      ?auto_60490 - PLACE
      ?auto_60487 - TRUCK
      ?auto_60489 - PLACE
      ?auto_60488 - HOIST
      ?auto_60492 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60491 ?auto_60490 ) ( SURFACE-AT ?auto_60486 ?auto_60490 ) ( CLEAR ?auto_60486 ) ( IS-CRATE ?auto_60485 ) ( not ( = ?auto_60485 ?auto_60486 ) ) ( AVAILABLE ?auto_60491 ) ( TRUCK-AT ?auto_60487 ?auto_60489 ) ( not ( = ?auto_60489 ?auto_60490 ) ) ( HOIST-AT ?auto_60488 ?auto_60489 ) ( not ( = ?auto_60491 ?auto_60488 ) ) ( AVAILABLE ?auto_60488 ) ( SURFACE-AT ?auto_60485 ?auto_60489 ) ( ON ?auto_60485 ?auto_60492 ) ( CLEAR ?auto_60485 ) ( not ( = ?auto_60485 ?auto_60492 ) ) ( not ( = ?auto_60486 ?auto_60492 ) ) )
    :subtasks
    ( ( !LIFT ?auto_60488 ?auto_60485 ?auto_60492 ?auto_60489 )
      ( MAKE-ON ?auto_60485 ?auto_60486 )
      ( MAKE-ON-VERIFY ?auto_60485 ?auto_60486 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60493 - SURFACE
      ?auto_60494 - SURFACE
    )
    :vars
    (
      ?auto_60496 - HOIST
      ?auto_60497 - PLACE
      ?auto_60495 - PLACE
      ?auto_60498 - HOIST
      ?auto_60500 - SURFACE
      ?auto_60499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60496 ?auto_60497 ) ( SURFACE-AT ?auto_60494 ?auto_60497 ) ( CLEAR ?auto_60494 ) ( IS-CRATE ?auto_60493 ) ( not ( = ?auto_60493 ?auto_60494 ) ) ( AVAILABLE ?auto_60496 ) ( not ( = ?auto_60495 ?auto_60497 ) ) ( HOIST-AT ?auto_60498 ?auto_60495 ) ( not ( = ?auto_60496 ?auto_60498 ) ) ( AVAILABLE ?auto_60498 ) ( SURFACE-AT ?auto_60493 ?auto_60495 ) ( ON ?auto_60493 ?auto_60500 ) ( CLEAR ?auto_60493 ) ( not ( = ?auto_60493 ?auto_60500 ) ) ( not ( = ?auto_60494 ?auto_60500 ) ) ( TRUCK-AT ?auto_60499 ?auto_60497 ) )
    :subtasks
    ( ( !DRIVE ?auto_60499 ?auto_60497 ?auto_60495 )
      ( MAKE-ON ?auto_60493 ?auto_60494 )
      ( MAKE-ON-VERIFY ?auto_60493 ?auto_60494 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60501 - SURFACE
      ?auto_60502 - SURFACE
    )
    :vars
    (
      ?auto_60506 - HOIST
      ?auto_60503 - PLACE
      ?auto_60507 - PLACE
      ?auto_60508 - HOIST
      ?auto_60504 - SURFACE
      ?auto_60505 - TRUCK
      ?auto_60509 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60506 ?auto_60503 ) ( IS-CRATE ?auto_60501 ) ( not ( = ?auto_60501 ?auto_60502 ) ) ( not ( = ?auto_60507 ?auto_60503 ) ) ( HOIST-AT ?auto_60508 ?auto_60507 ) ( not ( = ?auto_60506 ?auto_60508 ) ) ( AVAILABLE ?auto_60508 ) ( SURFACE-AT ?auto_60501 ?auto_60507 ) ( ON ?auto_60501 ?auto_60504 ) ( CLEAR ?auto_60501 ) ( not ( = ?auto_60501 ?auto_60504 ) ) ( not ( = ?auto_60502 ?auto_60504 ) ) ( TRUCK-AT ?auto_60505 ?auto_60503 ) ( SURFACE-AT ?auto_60509 ?auto_60503 ) ( CLEAR ?auto_60509 ) ( LIFTING ?auto_60506 ?auto_60502 ) ( IS-CRATE ?auto_60502 ) ( not ( = ?auto_60501 ?auto_60509 ) ) ( not ( = ?auto_60502 ?auto_60509 ) ) ( not ( = ?auto_60504 ?auto_60509 ) ) )
    :subtasks
    ( ( !DROP ?auto_60506 ?auto_60502 ?auto_60509 ?auto_60503 )
      ( MAKE-ON ?auto_60501 ?auto_60502 )
      ( MAKE-ON-VERIFY ?auto_60501 ?auto_60502 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60510 - SURFACE
      ?auto_60511 - SURFACE
    )
    :vars
    (
      ?auto_60517 - HOIST
      ?auto_60514 - PLACE
      ?auto_60518 - PLACE
      ?auto_60513 - HOIST
      ?auto_60515 - SURFACE
      ?auto_60512 - TRUCK
      ?auto_60516 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60517 ?auto_60514 ) ( IS-CRATE ?auto_60510 ) ( not ( = ?auto_60510 ?auto_60511 ) ) ( not ( = ?auto_60518 ?auto_60514 ) ) ( HOIST-AT ?auto_60513 ?auto_60518 ) ( not ( = ?auto_60517 ?auto_60513 ) ) ( AVAILABLE ?auto_60513 ) ( SURFACE-AT ?auto_60510 ?auto_60518 ) ( ON ?auto_60510 ?auto_60515 ) ( CLEAR ?auto_60510 ) ( not ( = ?auto_60510 ?auto_60515 ) ) ( not ( = ?auto_60511 ?auto_60515 ) ) ( TRUCK-AT ?auto_60512 ?auto_60514 ) ( SURFACE-AT ?auto_60516 ?auto_60514 ) ( CLEAR ?auto_60516 ) ( IS-CRATE ?auto_60511 ) ( not ( = ?auto_60510 ?auto_60516 ) ) ( not ( = ?auto_60511 ?auto_60516 ) ) ( not ( = ?auto_60515 ?auto_60516 ) ) ( AVAILABLE ?auto_60517 ) ( IN ?auto_60511 ?auto_60512 ) )
    :subtasks
    ( ( !UNLOAD ?auto_60517 ?auto_60511 ?auto_60512 ?auto_60514 )
      ( MAKE-ON ?auto_60510 ?auto_60511 )
      ( MAKE-ON-VERIFY ?auto_60510 ?auto_60511 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60519 - SURFACE
      ?auto_60520 - SURFACE
    )
    :vars
    (
      ?auto_60522 - HOIST
      ?auto_60526 - PLACE
      ?auto_60521 - PLACE
      ?auto_60527 - HOIST
      ?auto_60524 - SURFACE
      ?auto_60523 - SURFACE
      ?auto_60525 - TRUCK
      ?auto_60528 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60522 ?auto_60526 ) ( IS-CRATE ?auto_60519 ) ( not ( = ?auto_60519 ?auto_60520 ) ) ( not ( = ?auto_60521 ?auto_60526 ) ) ( HOIST-AT ?auto_60527 ?auto_60521 ) ( not ( = ?auto_60522 ?auto_60527 ) ) ( AVAILABLE ?auto_60527 ) ( SURFACE-AT ?auto_60519 ?auto_60521 ) ( ON ?auto_60519 ?auto_60524 ) ( CLEAR ?auto_60519 ) ( not ( = ?auto_60519 ?auto_60524 ) ) ( not ( = ?auto_60520 ?auto_60524 ) ) ( SURFACE-AT ?auto_60523 ?auto_60526 ) ( CLEAR ?auto_60523 ) ( IS-CRATE ?auto_60520 ) ( not ( = ?auto_60519 ?auto_60523 ) ) ( not ( = ?auto_60520 ?auto_60523 ) ) ( not ( = ?auto_60524 ?auto_60523 ) ) ( AVAILABLE ?auto_60522 ) ( IN ?auto_60520 ?auto_60525 ) ( TRUCK-AT ?auto_60525 ?auto_60528 ) ( not ( = ?auto_60528 ?auto_60526 ) ) ( not ( = ?auto_60521 ?auto_60528 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_60525 ?auto_60528 ?auto_60526 )
      ( MAKE-ON ?auto_60519 ?auto_60520 )
      ( MAKE-ON-VERIFY ?auto_60519 ?auto_60520 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60529 - SURFACE
      ?auto_60530 - SURFACE
    )
    :vars
    (
      ?auto_60532 - HOIST
      ?auto_60535 - PLACE
      ?auto_60531 - PLACE
      ?auto_60538 - HOIST
      ?auto_60536 - SURFACE
      ?auto_60537 - SURFACE
      ?auto_60533 - TRUCK
      ?auto_60534 - PLACE
      ?auto_60539 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_60532 ?auto_60535 ) ( IS-CRATE ?auto_60529 ) ( not ( = ?auto_60529 ?auto_60530 ) ) ( not ( = ?auto_60531 ?auto_60535 ) ) ( HOIST-AT ?auto_60538 ?auto_60531 ) ( not ( = ?auto_60532 ?auto_60538 ) ) ( AVAILABLE ?auto_60538 ) ( SURFACE-AT ?auto_60529 ?auto_60531 ) ( ON ?auto_60529 ?auto_60536 ) ( CLEAR ?auto_60529 ) ( not ( = ?auto_60529 ?auto_60536 ) ) ( not ( = ?auto_60530 ?auto_60536 ) ) ( SURFACE-AT ?auto_60537 ?auto_60535 ) ( CLEAR ?auto_60537 ) ( IS-CRATE ?auto_60530 ) ( not ( = ?auto_60529 ?auto_60537 ) ) ( not ( = ?auto_60530 ?auto_60537 ) ) ( not ( = ?auto_60536 ?auto_60537 ) ) ( AVAILABLE ?auto_60532 ) ( TRUCK-AT ?auto_60533 ?auto_60534 ) ( not ( = ?auto_60534 ?auto_60535 ) ) ( not ( = ?auto_60531 ?auto_60534 ) ) ( HOIST-AT ?auto_60539 ?auto_60534 ) ( LIFTING ?auto_60539 ?auto_60530 ) ( not ( = ?auto_60532 ?auto_60539 ) ) ( not ( = ?auto_60538 ?auto_60539 ) ) )
    :subtasks
    ( ( !LOAD ?auto_60539 ?auto_60530 ?auto_60533 ?auto_60534 )
      ( MAKE-ON ?auto_60529 ?auto_60530 )
      ( MAKE-ON-VERIFY ?auto_60529 ?auto_60530 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60540 - SURFACE
      ?auto_60541 - SURFACE
    )
    :vars
    (
      ?auto_60546 - HOIST
      ?auto_60545 - PLACE
      ?auto_60548 - PLACE
      ?auto_60549 - HOIST
      ?auto_60547 - SURFACE
      ?auto_60544 - SURFACE
      ?auto_60542 - TRUCK
      ?auto_60543 - PLACE
      ?auto_60550 - HOIST
      ?auto_60551 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60546 ?auto_60545 ) ( IS-CRATE ?auto_60540 ) ( not ( = ?auto_60540 ?auto_60541 ) ) ( not ( = ?auto_60548 ?auto_60545 ) ) ( HOIST-AT ?auto_60549 ?auto_60548 ) ( not ( = ?auto_60546 ?auto_60549 ) ) ( AVAILABLE ?auto_60549 ) ( SURFACE-AT ?auto_60540 ?auto_60548 ) ( ON ?auto_60540 ?auto_60547 ) ( CLEAR ?auto_60540 ) ( not ( = ?auto_60540 ?auto_60547 ) ) ( not ( = ?auto_60541 ?auto_60547 ) ) ( SURFACE-AT ?auto_60544 ?auto_60545 ) ( CLEAR ?auto_60544 ) ( IS-CRATE ?auto_60541 ) ( not ( = ?auto_60540 ?auto_60544 ) ) ( not ( = ?auto_60541 ?auto_60544 ) ) ( not ( = ?auto_60547 ?auto_60544 ) ) ( AVAILABLE ?auto_60546 ) ( TRUCK-AT ?auto_60542 ?auto_60543 ) ( not ( = ?auto_60543 ?auto_60545 ) ) ( not ( = ?auto_60548 ?auto_60543 ) ) ( HOIST-AT ?auto_60550 ?auto_60543 ) ( not ( = ?auto_60546 ?auto_60550 ) ) ( not ( = ?auto_60549 ?auto_60550 ) ) ( AVAILABLE ?auto_60550 ) ( SURFACE-AT ?auto_60541 ?auto_60543 ) ( ON ?auto_60541 ?auto_60551 ) ( CLEAR ?auto_60541 ) ( not ( = ?auto_60540 ?auto_60551 ) ) ( not ( = ?auto_60541 ?auto_60551 ) ) ( not ( = ?auto_60547 ?auto_60551 ) ) ( not ( = ?auto_60544 ?auto_60551 ) ) )
    :subtasks
    ( ( !LIFT ?auto_60550 ?auto_60541 ?auto_60551 ?auto_60543 )
      ( MAKE-ON ?auto_60540 ?auto_60541 )
      ( MAKE-ON-VERIFY ?auto_60540 ?auto_60541 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60552 - SURFACE
      ?auto_60553 - SURFACE
    )
    :vars
    (
      ?auto_60560 - HOIST
      ?auto_60557 - PLACE
      ?auto_60555 - PLACE
      ?auto_60559 - HOIST
      ?auto_60562 - SURFACE
      ?auto_60558 - SURFACE
      ?auto_60554 - PLACE
      ?auto_60563 - HOIST
      ?auto_60561 - SURFACE
      ?auto_60556 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60560 ?auto_60557 ) ( IS-CRATE ?auto_60552 ) ( not ( = ?auto_60552 ?auto_60553 ) ) ( not ( = ?auto_60555 ?auto_60557 ) ) ( HOIST-AT ?auto_60559 ?auto_60555 ) ( not ( = ?auto_60560 ?auto_60559 ) ) ( AVAILABLE ?auto_60559 ) ( SURFACE-AT ?auto_60552 ?auto_60555 ) ( ON ?auto_60552 ?auto_60562 ) ( CLEAR ?auto_60552 ) ( not ( = ?auto_60552 ?auto_60562 ) ) ( not ( = ?auto_60553 ?auto_60562 ) ) ( SURFACE-AT ?auto_60558 ?auto_60557 ) ( CLEAR ?auto_60558 ) ( IS-CRATE ?auto_60553 ) ( not ( = ?auto_60552 ?auto_60558 ) ) ( not ( = ?auto_60553 ?auto_60558 ) ) ( not ( = ?auto_60562 ?auto_60558 ) ) ( AVAILABLE ?auto_60560 ) ( not ( = ?auto_60554 ?auto_60557 ) ) ( not ( = ?auto_60555 ?auto_60554 ) ) ( HOIST-AT ?auto_60563 ?auto_60554 ) ( not ( = ?auto_60560 ?auto_60563 ) ) ( not ( = ?auto_60559 ?auto_60563 ) ) ( AVAILABLE ?auto_60563 ) ( SURFACE-AT ?auto_60553 ?auto_60554 ) ( ON ?auto_60553 ?auto_60561 ) ( CLEAR ?auto_60553 ) ( not ( = ?auto_60552 ?auto_60561 ) ) ( not ( = ?auto_60553 ?auto_60561 ) ) ( not ( = ?auto_60562 ?auto_60561 ) ) ( not ( = ?auto_60558 ?auto_60561 ) ) ( TRUCK-AT ?auto_60556 ?auto_60557 ) )
    :subtasks
    ( ( !DRIVE ?auto_60556 ?auto_60557 ?auto_60554 )
      ( MAKE-ON ?auto_60552 ?auto_60553 )
      ( MAKE-ON-VERIFY ?auto_60552 ?auto_60553 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60564 - SURFACE
      ?auto_60565 - SURFACE
    )
    :vars
    (
      ?auto_60568 - HOIST
      ?auto_60570 - PLACE
      ?auto_60574 - PLACE
      ?auto_60575 - HOIST
      ?auto_60567 - SURFACE
      ?auto_60569 - SURFACE
      ?auto_60571 - PLACE
      ?auto_60572 - HOIST
      ?auto_60566 - SURFACE
      ?auto_60573 - TRUCK
      ?auto_60576 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60568 ?auto_60570 ) ( IS-CRATE ?auto_60564 ) ( not ( = ?auto_60564 ?auto_60565 ) ) ( not ( = ?auto_60574 ?auto_60570 ) ) ( HOIST-AT ?auto_60575 ?auto_60574 ) ( not ( = ?auto_60568 ?auto_60575 ) ) ( AVAILABLE ?auto_60575 ) ( SURFACE-AT ?auto_60564 ?auto_60574 ) ( ON ?auto_60564 ?auto_60567 ) ( CLEAR ?auto_60564 ) ( not ( = ?auto_60564 ?auto_60567 ) ) ( not ( = ?auto_60565 ?auto_60567 ) ) ( IS-CRATE ?auto_60565 ) ( not ( = ?auto_60564 ?auto_60569 ) ) ( not ( = ?auto_60565 ?auto_60569 ) ) ( not ( = ?auto_60567 ?auto_60569 ) ) ( not ( = ?auto_60571 ?auto_60570 ) ) ( not ( = ?auto_60574 ?auto_60571 ) ) ( HOIST-AT ?auto_60572 ?auto_60571 ) ( not ( = ?auto_60568 ?auto_60572 ) ) ( not ( = ?auto_60575 ?auto_60572 ) ) ( AVAILABLE ?auto_60572 ) ( SURFACE-AT ?auto_60565 ?auto_60571 ) ( ON ?auto_60565 ?auto_60566 ) ( CLEAR ?auto_60565 ) ( not ( = ?auto_60564 ?auto_60566 ) ) ( not ( = ?auto_60565 ?auto_60566 ) ) ( not ( = ?auto_60567 ?auto_60566 ) ) ( not ( = ?auto_60569 ?auto_60566 ) ) ( TRUCK-AT ?auto_60573 ?auto_60570 ) ( SURFACE-AT ?auto_60576 ?auto_60570 ) ( CLEAR ?auto_60576 ) ( LIFTING ?auto_60568 ?auto_60569 ) ( IS-CRATE ?auto_60569 ) ( not ( = ?auto_60564 ?auto_60576 ) ) ( not ( = ?auto_60565 ?auto_60576 ) ) ( not ( = ?auto_60567 ?auto_60576 ) ) ( not ( = ?auto_60569 ?auto_60576 ) ) ( not ( = ?auto_60566 ?auto_60576 ) ) )
    :subtasks
    ( ( !DROP ?auto_60568 ?auto_60569 ?auto_60576 ?auto_60570 )
      ( MAKE-ON ?auto_60564 ?auto_60565 )
      ( MAKE-ON-VERIFY ?auto_60564 ?auto_60565 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60577 - SURFACE
      ?auto_60578 - SURFACE
    )
    :vars
    (
      ?auto_60582 - HOIST
      ?auto_60587 - PLACE
      ?auto_60586 - PLACE
      ?auto_60585 - HOIST
      ?auto_60588 - SURFACE
      ?auto_60580 - SURFACE
      ?auto_60581 - PLACE
      ?auto_60579 - HOIST
      ?auto_60589 - SURFACE
      ?auto_60583 - TRUCK
      ?auto_60584 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60582 ?auto_60587 ) ( IS-CRATE ?auto_60577 ) ( not ( = ?auto_60577 ?auto_60578 ) ) ( not ( = ?auto_60586 ?auto_60587 ) ) ( HOIST-AT ?auto_60585 ?auto_60586 ) ( not ( = ?auto_60582 ?auto_60585 ) ) ( AVAILABLE ?auto_60585 ) ( SURFACE-AT ?auto_60577 ?auto_60586 ) ( ON ?auto_60577 ?auto_60588 ) ( CLEAR ?auto_60577 ) ( not ( = ?auto_60577 ?auto_60588 ) ) ( not ( = ?auto_60578 ?auto_60588 ) ) ( IS-CRATE ?auto_60578 ) ( not ( = ?auto_60577 ?auto_60580 ) ) ( not ( = ?auto_60578 ?auto_60580 ) ) ( not ( = ?auto_60588 ?auto_60580 ) ) ( not ( = ?auto_60581 ?auto_60587 ) ) ( not ( = ?auto_60586 ?auto_60581 ) ) ( HOIST-AT ?auto_60579 ?auto_60581 ) ( not ( = ?auto_60582 ?auto_60579 ) ) ( not ( = ?auto_60585 ?auto_60579 ) ) ( AVAILABLE ?auto_60579 ) ( SURFACE-AT ?auto_60578 ?auto_60581 ) ( ON ?auto_60578 ?auto_60589 ) ( CLEAR ?auto_60578 ) ( not ( = ?auto_60577 ?auto_60589 ) ) ( not ( = ?auto_60578 ?auto_60589 ) ) ( not ( = ?auto_60588 ?auto_60589 ) ) ( not ( = ?auto_60580 ?auto_60589 ) ) ( TRUCK-AT ?auto_60583 ?auto_60587 ) ( SURFACE-AT ?auto_60584 ?auto_60587 ) ( CLEAR ?auto_60584 ) ( IS-CRATE ?auto_60580 ) ( not ( = ?auto_60577 ?auto_60584 ) ) ( not ( = ?auto_60578 ?auto_60584 ) ) ( not ( = ?auto_60588 ?auto_60584 ) ) ( not ( = ?auto_60580 ?auto_60584 ) ) ( not ( = ?auto_60589 ?auto_60584 ) ) ( AVAILABLE ?auto_60582 ) ( IN ?auto_60580 ?auto_60583 ) )
    :subtasks
    ( ( !UNLOAD ?auto_60582 ?auto_60580 ?auto_60583 ?auto_60587 )
      ( MAKE-ON ?auto_60577 ?auto_60578 )
      ( MAKE-ON-VERIFY ?auto_60577 ?auto_60578 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60590 - SURFACE
      ?auto_60591 - SURFACE
    )
    :vars
    (
      ?auto_60593 - HOIST
      ?auto_60594 - PLACE
      ?auto_60596 - PLACE
      ?auto_60597 - HOIST
      ?auto_60595 - SURFACE
      ?auto_60600 - SURFACE
      ?auto_60601 - PLACE
      ?auto_60592 - HOIST
      ?auto_60598 - SURFACE
      ?auto_60599 - SURFACE
      ?auto_60602 - TRUCK
      ?auto_60603 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60593 ?auto_60594 ) ( IS-CRATE ?auto_60590 ) ( not ( = ?auto_60590 ?auto_60591 ) ) ( not ( = ?auto_60596 ?auto_60594 ) ) ( HOIST-AT ?auto_60597 ?auto_60596 ) ( not ( = ?auto_60593 ?auto_60597 ) ) ( AVAILABLE ?auto_60597 ) ( SURFACE-AT ?auto_60590 ?auto_60596 ) ( ON ?auto_60590 ?auto_60595 ) ( CLEAR ?auto_60590 ) ( not ( = ?auto_60590 ?auto_60595 ) ) ( not ( = ?auto_60591 ?auto_60595 ) ) ( IS-CRATE ?auto_60591 ) ( not ( = ?auto_60590 ?auto_60600 ) ) ( not ( = ?auto_60591 ?auto_60600 ) ) ( not ( = ?auto_60595 ?auto_60600 ) ) ( not ( = ?auto_60601 ?auto_60594 ) ) ( not ( = ?auto_60596 ?auto_60601 ) ) ( HOIST-AT ?auto_60592 ?auto_60601 ) ( not ( = ?auto_60593 ?auto_60592 ) ) ( not ( = ?auto_60597 ?auto_60592 ) ) ( AVAILABLE ?auto_60592 ) ( SURFACE-AT ?auto_60591 ?auto_60601 ) ( ON ?auto_60591 ?auto_60598 ) ( CLEAR ?auto_60591 ) ( not ( = ?auto_60590 ?auto_60598 ) ) ( not ( = ?auto_60591 ?auto_60598 ) ) ( not ( = ?auto_60595 ?auto_60598 ) ) ( not ( = ?auto_60600 ?auto_60598 ) ) ( SURFACE-AT ?auto_60599 ?auto_60594 ) ( CLEAR ?auto_60599 ) ( IS-CRATE ?auto_60600 ) ( not ( = ?auto_60590 ?auto_60599 ) ) ( not ( = ?auto_60591 ?auto_60599 ) ) ( not ( = ?auto_60595 ?auto_60599 ) ) ( not ( = ?auto_60600 ?auto_60599 ) ) ( not ( = ?auto_60598 ?auto_60599 ) ) ( AVAILABLE ?auto_60593 ) ( IN ?auto_60600 ?auto_60602 ) ( TRUCK-AT ?auto_60602 ?auto_60603 ) ( not ( = ?auto_60603 ?auto_60594 ) ) ( not ( = ?auto_60596 ?auto_60603 ) ) ( not ( = ?auto_60601 ?auto_60603 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_60602 ?auto_60603 ?auto_60594 )
      ( MAKE-ON ?auto_60590 ?auto_60591 )
      ( MAKE-ON-VERIFY ?auto_60590 ?auto_60591 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60604 - SURFACE
      ?auto_60605 - SURFACE
    )
    :vars
    (
      ?auto_60613 - HOIST
      ?auto_60607 - PLACE
      ?auto_60615 - PLACE
      ?auto_60611 - HOIST
      ?auto_60606 - SURFACE
      ?auto_60614 - SURFACE
      ?auto_60617 - PLACE
      ?auto_60608 - HOIST
      ?auto_60610 - SURFACE
      ?auto_60616 - SURFACE
      ?auto_60609 - TRUCK
      ?auto_60612 - PLACE
      ?auto_60618 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_60613 ?auto_60607 ) ( IS-CRATE ?auto_60604 ) ( not ( = ?auto_60604 ?auto_60605 ) ) ( not ( = ?auto_60615 ?auto_60607 ) ) ( HOIST-AT ?auto_60611 ?auto_60615 ) ( not ( = ?auto_60613 ?auto_60611 ) ) ( AVAILABLE ?auto_60611 ) ( SURFACE-AT ?auto_60604 ?auto_60615 ) ( ON ?auto_60604 ?auto_60606 ) ( CLEAR ?auto_60604 ) ( not ( = ?auto_60604 ?auto_60606 ) ) ( not ( = ?auto_60605 ?auto_60606 ) ) ( IS-CRATE ?auto_60605 ) ( not ( = ?auto_60604 ?auto_60614 ) ) ( not ( = ?auto_60605 ?auto_60614 ) ) ( not ( = ?auto_60606 ?auto_60614 ) ) ( not ( = ?auto_60617 ?auto_60607 ) ) ( not ( = ?auto_60615 ?auto_60617 ) ) ( HOIST-AT ?auto_60608 ?auto_60617 ) ( not ( = ?auto_60613 ?auto_60608 ) ) ( not ( = ?auto_60611 ?auto_60608 ) ) ( AVAILABLE ?auto_60608 ) ( SURFACE-AT ?auto_60605 ?auto_60617 ) ( ON ?auto_60605 ?auto_60610 ) ( CLEAR ?auto_60605 ) ( not ( = ?auto_60604 ?auto_60610 ) ) ( not ( = ?auto_60605 ?auto_60610 ) ) ( not ( = ?auto_60606 ?auto_60610 ) ) ( not ( = ?auto_60614 ?auto_60610 ) ) ( SURFACE-AT ?auto_60616 ?auto_60607 ) ( CLEAR ?auto_60616 ) ( IS-CRATE ?auto_60614 ) ( not ( = ?auto_60604 ?auto_60616 ) ) ( not ( = ?auto_60605 ?auto_60616 ) ) ( not ( = ?auto_60606 ?auto_60616 ) ) ( not ( = ?auto_60614 ?auto_60616 ) ) ( not ( = ?auto_60610 ?auto_60616 ) ) ( AVAILABLE ?auto_60613 ) ( TRUCK-AT ?auto_60609 ?auto_60612 ) ( not ( = ?auto_60612 ?auto_60607 ) ) ( not ( = ?auto_60615 ?auto_60612 ) ) ( not ( = ?auto_60617 ?auto_60612 ) ) ( HOIST-AT ?auto_60618 ?auto_60612 ) ( LIFTING ?auto_60618 ?auto_60614 ) ( not ( = ?auto_60613 ?auto_60618 ) ) ( not ( = ?auto_60611 ?auto_60618 ) ) ( not ( = ?auto_60608 ?auto_60618 ) ) )
    :subtasks
    ( ( !LOAD ?auto_60618 ?auto_60614 ?auto_60609 ?auto_60612 )
      ( MAKE-ON ?auto_60604 ?auto_60605 )
      ( MAKE-ON-VERIFY ?auto_60604 ?auto_60605 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60619 - SURFACE
      ?auto_60620 - SURFACE
    )
    :vars
    (
      ?auto_60625 - HOIST
      ?auto_60632 - PLACE
      ?auto_60621 - PLACE
      ?auto_60627 - HOIST
      ?auto_60629 - SURFACE
      ?auto_60633 - SURFACE
      ?auto_60626 - PLACE
      ?auto_60622 - HOIST
      ?auto_60628 - SURFACE
      ?auto_60630 - SURFACE
      ?auto_60631 - TRUCK
      ?auto_60624 - PLACE
      ?auto_60623 - HOIST
      ?auto_60634 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60625 ?auto_60632 ) ( IS-CRATE ?auto_60619 ) ( not ( = ?auto_60619 ?auto_60620 ) ) ( not ( = ?auto_60621 ?auto_60632 ) ) ( HOIST-AT ?auto_60627 ?auto_60621 ) ( not ( = ?auto_60625 ?auto_60627 ) ) ( AVAILABLE ?auto_60627 ) ( SURFACE-AT ?auto_60619 ?auto_60621 ) ( ON ?auto_60619 ?auto_60629 ) ( CLEAR ?auto_60619 ) ( not ( = ?auto_60619 ?auto_60629 ) ) ( not ( = ?auto_60620 ?auto_60629 ) ) ( IS-CRATE ?auto_60620 ) ( not ( = ?auto_60619 ?auto_60633 ) ) ( not ( = ?auto_60620 ?auto_60633 ) ) ( not ( = ?auto_60629 ?auto_60633 ) ) ( not ( = ?auto_60626 ?auto_60632 ) ) ( not ( = ?auto_60621 ?auto_60626 ) ) ( HOIST-AT ?auto_60622 ?auto_60626 ) ( not ( = ?auto_60625 ?auto_60622 ) ) ( not ( = ?auto_60627 ?auto_60622 ) ) ( AVAILABLE ?auto_60622 ) ( SURFACE-AT ?auto_60620 ?auto_60626 ) ( ON ?auto_60620 ?auto_60628 ) ( CLEAR ?auto_60620 ) ( not ( = ?auto_60619 ?auto_60628 ) ) ( not ( = ?auto_60620 ?auto_60628 ) ) ( not ( = ?auto_60629 ?auto_60628 ) ) ( not ( = ?auto_60633 ?auto_60628 ) ) ( SURFACE-AT ?auto_60630 ?auto_60632 ) ( CLEAR ?auto_60630 ) ( IS-CRATE ?auto_60633 ) ( not ( = ?auto_60619 ?auto_60630 ) ) ( not ( = ?auto_60620 ?auto_60630 ) ) ( not ( = ?auto_60629 ?auto_60630 ) ) ( not ( = ?auto_60633 ?auto_60630 ) ) ( not ( = ?auto_60628 ?auto_60630 ) ) ( AVAILABLE ?auto_60625 ) ( TRUCK-AT ?auto_60631 ?auto_60624 ) ( not ( = ?auto_60624 ?auto_60632 ) ) ( not ( = ?auto_60621 ?auto_60624 ) ) ( not ( = ?auto_60626 ?auto_60624 ) ) ( HOIST-AT ?auto_60623 ?auto_60624 ) ( not ( = ?auto_60625 ?auto_60623 ) ) ( not ( = ?auto_60627 ?auto_60623 ) ) ( not ( = ?auto_60622 ?auto_60623 ) ) ( AVAILABLE ?auto_60623 ) ( SURFACE-AT ?auto_60633 ?auto_60624 ) ( ON ?auto_60633 ?auto_60634 ) ( CLEAR ?auto_60633 ) ( not ( = ?auto_60619 ?auto_60634 ) ) ( not ( = ?auto_60620 ?auto_60634 ) ) ( not ( = ?auto_60629 ?auto_60634 ) ) ( not ( = ?auto_60633 ?auto_60634 ) ) ( not ( = ?auto_60628 ?auto_60634 ) ) ( not ( = ?auto_60630 ?auto_60634 ) ) )
    :subtasks
    ( ( !LIFT ?auto_60623 ?auto_60633 ?auto_60634 ?auto_60624 )
      ( MAKE-ON ?auto_60619 ?auto_60620 )
      ( MAKE-ON-VERIFY ?auto_60619 ?auto_60620 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60635 - SURFACE
      ?auto_60636 - SURFACE
    )
    :vars
    (
      ?auto_60639 - HOIST
      ?auto_60640 - PLACE
      ?auto_60648 - PLACE
      ?auto_60643 - HOIST
      ?auto_60649 - SURFACE
      ?auto_60646 - SURFACE
      ?auto_60638 - PLACE
      ?auto_60637 - HOIST
      ?auto_60644 - SURFACE
      ?auto_60647 - SURFACE
      ?auto_60642 - PLACE
      ?auto_60645 - HOIST
      ?auto_60650 - SURFACE
      ?auto_60641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60639 ?auto_60640 ) ( IS-CRATE ?auto_60635 ) ( not ( = ?auto_60635 ?auto_60636 ) ) ( not ( = ?auto_60648 ?auto_60640 ) ) ( HOIST-AT ?auto_60643 ?auto_60648 ) ( not ( = ?auto_60639 ?auto_60643 ) ) ( AVAILABLE ?auto_60643 ) ( SURFACE-AT ?auto_60635 ?auto_60648 ) ( ON ?auto_60635 ?auto_60649 ) ( CLEAR ?auto_60635 ) ( not ( = ?auto_60635 ?auto_60649 ) ) ( not ( = ?auto_60636 ?auto_60649 ) ) ( IS-CRATE ?auto_60636 ) ( not ( = ?auto_60635 ?auto_60646 ) ) ( not ( = ?auto_60636 ?auto_60646 ) ) ( not ( = ?auto_60649 ?auto_60646 ) ) ( not ( = ?auto_60638 ?auto_60640 ) ) ( not ( = ?auto_60648 ?auto_60638 ) ) ( HOIST-AT ?auto_60637 ?auto_60638 ) ( not ( = ?auto_60639 ?auto_60637 ) ) ( not ( = ?auto_60643 ?auto_60637 ) ) ( AVAILABLE ?auto_60637 ) ( SURFACE-AT ?auto_60636 ?auto_60638 ) ( ON ?auto_60636 ?auto_60644 ) ( CLEAR ?auto_60636 ) ( not ( = ?auto_60635 ?auto_60644 ) ) ( not ( = ?auto_60636 ?auto_60644 ) ) ( not ( = ?auto_60649 ?auto_60644 ) ) ( not ( = ?auto_60646 ?auto_60644 ) ) ( SURFACE-AT ?auto_60647 ?auto_60640 ) ( CLEAR ?auto_60647 ) ( IS-CRATE ?auto_60646 ) ( not ( = ?auto_60635 ?auto_60647 ) ) ( not ( = ?auto_60636 ?auto_60647 ) ) ( not ( = ?auto_60649 ?auto_60647 ) ) ( not ( = ?auto_60646 ?auto_60647 ) ) ( not ( = ?auto_60644 ?auto_60647 ) ) ( AVAILABLE ?auto_60639 ) ( not ( = ?auto_60642 ?auto_60640 ) ) ( not ( = ?auto_60648 ?auto_60642 ) ) ( not ( = ?auto_60638 ?auto_60642 ) ) ( HOIST-AT ?auto_60645 ?auto_60642 ) ( not ( = ?auto_60639 ?auto_60645 ) ) ( not ( = ?auto_60643 ?auto_60645 ) ) ( not ( = ?auto_60637 ?auto_60645 ) ) ( AVAILABLE ?auto_60645 ) ( SURFACE-AT ?auto_60646 ?auto_60642 ) ( ON ?auto_60646 ?auto_60650 ) ( CLEAR ?auto_60646 ) ( not ( = ?auto_60635 ?auto_60650 ) ) ( not ( = ?auto_60636 ?auto_60650 ) ) ( not ( = ?auto_60649 ?auto_60650 ) ) ( not ( = ?auto_60646 ?auto_60650 ) ) ( not ( = ?auto_60644 ?auto_60650 ) ) ( not ( = ?auto_60647 ?auto_60650 ) ) ( TRUCK-AT ?auto_60641 ?auto_60640 ) )
    :subtasks
    ( ( !DRIVE ?auto_60641 ?auto_60640 ?auto_60642 )
      ( MAKE-ON ?auto_60635 ?auto_60636 )
      ( MAKE-ON-VERIFY ?auto_60635 ?auto_60636 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60651 - SURFACE
      ?auto_60652 - SURFACE
    )
    :vars
    (
      ?auto_60662 - HOIST
      ?auto_60666 - PLACE
      ?auto_60655 - PLACE
      ?auto_60661 - HOIST
      ?auto_60654 - SURFACE
      ?auto_60656 - SURFACE
      ?auto_60658 - PLACE
      ?auto_60659 - HOIST
      ?auto_60657 - SURFACE
      ?auto_60660 - SURFACE
      ?auto_60663 - PLACE
      ?auto_60665 - HOIST
      ?auto_60653 - SURFACE
      ?auto_60664 - TRUCK
      ?auto_60667 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60662 ?auto_60666 ) ( IS-CRATE ?auto_60651 ) ( not ( = ?auto_60651 ?auto_60652 ) ) ( not ( = ?auto_60655 ?auto_60666 ) ) ( HOIST-AT ?auto_60661 ?auto_60655 ) ( not ( = ?auto_60662 ?auto_60661 ) ) ( AVAILABLE ?auto_60661 ) ( SURFACE-AT ?auto_60651 ?auto_60655 ) ( ON ?auto_60651 ?auto_60654 ) ( CLEAR ?auto_60651 ) ( not ( = ?auto_60651 ?auto_60654 ) ) ( not ( = ?auto_60652 ?auto_60654 ) ) ( IS-CRATE ?auto_60652 ) ( not ( = ?auto_60651 ?auto_60656 ) ) ( not ( = ?auto_60652 ?auto_60656 ) ) ( not ( = ?auto_60654 ?auto_60656 ) ) ( not ( = ?auto_60658 ?auto_60666 ) ) ( not ( = ?auto_60655 ?auto_60658 ) ) ( HOIST-AT ?auto_60659 ?auto_60658 ) ( not ( = ?auto_60662 ?auto_60659 ) ) ( not ( = ?auto_60661 ?auto_60659 ) ) ( AVAILABLE ?auto_60659 ) ( SURFACE-AT ?auto_60652 ?auto_60658 ) ( ON ?auto_60652 ?auto_60657 ) ( CLEAR ?auto_60652 ) ( not ( = ?auto_60651 ?auto_60657 ) ) ( not ( = ?auto_60652 ?auto_60657 ) ) ( not ( = ?auto_60654 ?auto_60657 ) ) ( not ( = ?auto_60656 ?auto_60657 ) ) ( IS-CRATE ?auto_60656 ) ( not ( = ?auto_60651 ?auto_60660 ) ) ( not ( = ?auto_60652 ?auto_60660 ) ) ( not ( = ?auto_60654 ?auto_60660 ) ) ( not ( = ?auto_60656 ?auto_60660 ) ) ( not ( = ?auto_60657 ?auto_60660 ) ) ( not ( = ?auto_60663 ?auto_60666 ) ) ( not ( = ?auto_60655 ?auto_60663 ) ) ( not ( = ?auto_60658 ?auto_60663 ) ) ( HOIST-AT ?auto_60665 ?auto_60663 ) ( not ( = ?auto_60662 ?auto_60665 ) ) ( not ( = ?auto_60661 ?auto_60665 ) ) ( not ( = ?auto_60659 ?auto_60665 ) ) ( AVAILABLE ?auto_60665 ) ( SURFACE-AT ?auto_60656 ?auto_60663 ) ( ON ?auto_60656 ?auto_60653 ) ( CLEAR ?auto_60656 ) ( not ( = ?auto_60651 ?auto_60653 ) ) ( not ( = ?auto_60652 ?auto_60653 ) ) ( not ( = ?auto_60654 ?auto_60653 ) ) ( not ( = ?auto_60656 ?auto_60653 ) ) ( not ( = ?auto_60657 ?auto_60653 ) ) ( not ( = ?auto_60660 ?auto_60653 ) ) ( TRUCK-AT ?auto_60664 ?auto_60666 ) ( SURFACE-AT ?auto_60667 ?auto_60666 ) ( CLEAR ?auto_60667 ) ( LIFTING ?auto_60662 ?auto_60660 ) ( IS-CRATE ?auto_60660 ) ( not ( = ?auto_60651 ?auto_60667 ) ) ( not ( = ?auto_60652 ?auto_60667 ) ) ( not ( = ?auto_60654 ?auto_60667 ) ) ( not ( = ?auto_60656 ?auto_60667 ) ) ( not ( = ?auto_60657 ?auto_60667 ) ) ( not ( = ?auto_60660 ?auto_60667 ) ) ( not ( = ?auto_60653 ?auto_60667 ) ) )
    :subtasks
    ( ( !DROP ?auto_60662 ?auto_60660 ?auto_60667 ?auto_60666 )
      ( MAKE-ON ?auto_60651 ?auto_60652 )
      ( MAKE-ON-VERIFY ?auto_60651 ?auto_60652 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60668 - SURFACE
      ?auto_60669 - SURFACE
    )
    :vars
    (
      ?auto_60681 - HOIST
      ?auto_60670 - PLACE
      ?auto_60680 - PLACE
      ?auto_60676 - HOIST
      ?auto_60671 - SURFACE
      ?auto_60672 - SURFACE
      ?auto_60679 - PLACE
      ?auto_60684 - HOIST
      ?auto_60682 - SURFACE
      ?auto_60678 - SURFACE
      ?auto_60677 - PLACE
      ?auto_60683 - HOIST
      ?auto_60674 - SURFACE
      ?auto_60675 - TRUCK
      ?auto_60673 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60681 ?auto_60670 ) ( IS-CRATE ?auto_60668 ) ( not ( = ?auto_60668 ?auto_60669 ) ) ( not ( = ?auto_60680 ?auto_60670 ) ) ( HOIST-AT ?auto_60676 ?auto_60680 ) ( not ( = ?auto_60681 ?auto_60676 ) ) ( AVAILABLE ?auto_60676 ) ( SURFACE-AT ?auto_60668 ?auto_60680 ) ( ON ?auto_60668 ?auto_60671 ) ( CLEAR ?auto_60668 ) ( not ( = ?auto_60668 ?auto_60671 ) ) ( not ( = ?auto_60669 ?auto_60671 ) ) ( IS-CRATE ?auto_60669 ) ( not ( = ?auto_60668 ?auto_60672 ) ) ( not ( = ?auto_60669 ?auto_60672 ) ) ( not ( = ?auto_60671 ?auto_60672 ) ) ( not ( = ?auto_60679 ?auto_60670 ) ) ( not ( = ?auto_60680 ?auto_60679 ) ) ( HOIST-AT ?auto_60684 ?auto_60679 ) ( not ( = ?auto_60681 ?auto_60684 ) ) ( not ( = ?auto_60676 ?auto_60684 ) ) ( AVAILABLE ?auto_60684 ) ( SURFACE-AT ?auto_60669 ?auto_60679 ) ( ON ?auto_60669 ?auto_60682 ) ( CLEAR ?auto_60669 ) ( not ( = ?auto_60668 ?auto_60682 ) ) ( not ( = ?auto_60669 ?auto_60682 ) ) ( not ( = ?auto_60671 ?auto_60682 ) ) ( not ( = ?auto_60672 ?auto_60682 ) ) ( IS-CRATE ?auto_60672 ) ( not ( = ?auto_60668 ?auto_60678 ) ) ( not ( = ?auto_60669 ?auto_60678 ) ) ( not ( = ?auto_60671 ?auto_60678 ) ) ( not ( = ?auto_60672 ?auto_60678 ) ) ( not ( = ?auto_60682 ?auto_60678 ) ) ( not ( = ?auto_60677 ?auto_60670 ) ) ( not ( = ?auto_60680 ?auto_60677 ) ) ( not ( = ?auto_60679 ?auto_60677 ) ) ( HOIST-AT ?auto_60683 ?auto_60677 ) ( not ( = ?auto_60681 ?auto_60683 ) ) ( not ( = ?auto_60676 ?auto_60683 ) ) ( not ( = ?auto_60684 ?auto_60683 ) ) ( AVAILABLE ?auto_60683 ) ( SURFACE-AT ?auto_60672 ?auto_60677 ) ( ON ?auto_60672 ?auto_60674 ) ( CLEAR ?auto_60672 ) ( not ( = ?auto_60668 ?auto_60674 ) ) ( not ( = ?auto_60669 ?auto_60674 ) ) ( not ( = ?auto_60671 ?auto_60674 ) ) ( not ( = ?auto_60672 ?auto_60674 ) ) ( not ( = ?auto_60682 ?auto_60674 ) ) ( not ( = ?auto_60678 ?auto_60674 ) ) ( TRUCK-AT ?auto_60675 ?auto_60670 ) ( SURFACE-AT ?auto_60673 ?auto_60670 ) ( CLEAR ?auto_60673 ) ( IS-CRATE ?auto_60678 ) ( not ( = ?auto_60668 ?auto_60673 ) ) ( not ( = ?auto_60669 ?auto_60673 ) ) ( not ( = ?auto_60671 ?auto_60673 ) ) ( not ( = ?auto_60672 ?auto_60673 ) ) ( not ( = ?auto_60682 ?auto_60673 ) ) ( not ( = ?auto_60678 ?auto_60673 ) ) ( not ( = ?auto_60674 ?auto_60673 ) ) ( AVAILABLE ?auto_60681 ) ( IN ?auto_60678 ?auto_60675 ) )
    :subtasks
    ( ( !UNLOAD ?auto_60681 ?auto_60678 ?auto_60675 ?auto_60670 )
      ( MAKE-ON ?auto_60668 ?auto_60669 )
      ( MAKE-ON-VERIFY ?auto_60668 ?auto_60669 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60685 - SURFACE
      ?auto_60686 - SURFACE
    )
    :vars
    (
      ?auto_60690 - HOIST
      ?auto_60691 - PLACE
      ?auto_60689 - PLACE
      ?auto_60687 - HOIST
      ?auto_60696 - SURFACE
      ?auto_60698 - SURFACE
      ?auto_60694 - PLACE
      ?auto_60688 - HOIST
      ?auto_60700 - SURFACE
      ?auto_60701 - SURFACE
      ?auto_60693 - PLACE
      ?auto_60695 - HOIST
      ?auto_60697 - SURFACE
      ?auto_60692 - SURFACE
      ?auto_60699 - TRUCK
      ?auto_60702 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60690 ?auto_60691 ) ( IS-CRATE ?auto_60685 ) ( not ( = ?auto_60685 ?auto_60686 ) ) ( not ( = ?auto_60689 ?auto_60691 ) ) ( HOIST-AT ?auto_60687 ?auto_60689 ) ( not ( = ?auto_60690 ?auto_60687 ) ) ( AVAILABLE ?auto_60687 ) ( SURFACE-AT ?auto_60685 ?auto_60689 ) ( ON ?auto_60685 ?auto_60696 ) ( CLEAR ?auto_60685 ) ( not ( = ?auto_60685 ?auto_60696 ) ) ( not ( = ?auto_60686 ?auto_60696 ) ) ( IS-CRATE ?auto_60686 ) ( not ( = ?auto_60685 ?auto_60698 ) ) ( not ( = ?auto_60686 ?auto_60698 ) ) ( not ( = ?auto_60696 ?auto_60698 ) ) ( not ( = ?auto_60694 ?auto_60691 ) ) ( not ( = ?auto_60689 ?auto_60694 ) ) ( HOIST-AT ?auto_60688 ?auto_60694 ) ( not ( = ?auto_60690 ?auto_60688 ) ) ( not ( = ?auto_60687 ?auto_60688 ) ) ( AVAILABLE ?auto_60688 ) ( SURFACE-AT ?auto_60686 ?auto_60694 ) ( ON ?auto_60686 ?auto_60700 ) ( CLEAR ?auto_60686 ) ( not ( = ?auto_60685 ?auto_60700 ) ) ( not ( = ?auto_60686 ?auto_60700 ) ) ( not ( = ?auto_60696 ?auto_60700 ) ) ( not ( = ?auto_60698 ?auto_60700 ) ) ( IS-CRATE ?auto_60698 ) ( not ( = ?auto_60685 ?auto_60701 ) ) ( not ( = ?auto_60686 ?auto_60701 ) ) ( not ( = ?auto_60696 ?auto_60701 ) ) ( not ( = ?auto_60698 ?auto_60701 ) ) ( not ( = ?auto_60700 ?auto_60701 ) ) ( not ( = ?auto_60693 ?auto_60691 ) ) ( not ( = ?auto_60689 ?auto_60693 ) ) ( not ( = ?auto_60694 ?auto_60693 ) ) ( HOIST-AT ?auto_60695 ?auto_60693 ) ( not ( = ?auto_60690 ?auto_60695 ) ) ( not ( = ?auto_60687 ?auto_60695 ) ) ( not ( = ?auto_60688 ?auto_60695 ) ) ( AVAILABLE ?auto_60695 ) ( SURFACE-AT ?auto_60698 ?auto_60693 ) ( ON ?auto_60698 ?auto_60697 ) ( CLEAR ?auto_60698 ) ( not ( = ?auto_60685 ?auto_60697 ) ) ( not ( = ?auto_60686 ?auto_60697 ) ) ( not ( = ?auto_60696 ?auto_60697 ) ) ( not ( = ?auto_60698 ?auto_60697 ) ) ( not ( = ?auto_60700 ?auto_60697 ) ) ( not ( = ?auto_60701 ?auto_60697 ) ) ( SURFACE-AT ?auto_60692 ?auto_60691 ) ( CLEAR ?auto_60692 ) ( IS-CRATE ?auto_60701 ) ( not ( = ?auto_60685 ?auto_60692 ) ) ( not ( = ?auto_60686 ?auto_60692 ) ) ( not ( = ?auto_60696 ?auto_60692 ) ) ( not ( = ?auto_60698 ?auto_60692 ) ) ( not ( = ?auto_60700 ?auto_60692 ) ) ( not ( = ?auto_60701 ?auto_60692 ) ) ( not ( = ?auto_60697 ?auto_60692 ) ) ( AVAILABLE ?auto_60690 ) ( IN ?auto_60701 ?auto_60699 ) ( TRUCK-AT ?auto_60699 ?auto_60702 ) ( not ( = ?auto_60702 ?auto_60691 ) ) ( not ( = ?auto_60689 ?auto_60702 ) ) ( not ( = ?auto_60694 ?auto_60702 ) ) ( not ( = ?auto_60693 ?auto_60702 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_60699 ?auto_60702 ?auto_60691 )
      ( MAKE-ON ?auto_60685 ?auto_60686 )
      ( MAKE-ON-VERIFY ?auto_60685 ?auto_60686 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60703 - SURFACE
      ?auto_60704 - SURFACE
    )
    :vars
    (
      ?auto_60720 - HOIST
      ?auto_60706 - PLACE
      ?auto_60718 - PLACE
      ?auto_60711 - HOIST
      ?auto_60705 - SURFACE
      ?auto_60712 - SURFACE
      ?auto_60708 - PLACE
      ?auto_60710 - HOIST
      ?auto_60707 - SURFACE
      ?auto_60714 - SURFACE
      ?auto_60713 - PLACE
      ?auto_60715 - HOIST
      ?auto_60719 - SURFACE
      ?auto_60709 - SURFACE
      ?auto_60717 - TRUCK
      ?auto_60716 - PLACE
      ?auto_60721 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_60720 ?auto_60706 ) ( IS-CRATE ?auto_60703 ) ( not ( = ?auto_60703 ?auto_60704 ) ) ( not ( = ?auto_60718 ?auto_60706 ) ) ( HOIST-AT ?auto_60711 ?auto_60718 ) ( not ( = ?auto_60720 ?auto_60711 ) ) ( AVAILABLE ?auto_60711 ) ( SURFACE-AT ?auto_60703 ?auto_60718 ) ( ON ?auto_60703 ?auto_60705 ) ( CLEAR ?auto_60703 ) ( not ( = ?auto_60703 ?auto_60705 ) ) ( not ( = ?auto_60704 ?auto_60705 ) ) ( IS-CRATE ?auto_60704 ) ( not ( = ?auto_60703 ?auto_60712 ) ) ( not ( = ?auto_60704 ?auto_60712 ) ) ( not ( = ?auto_60705 ?auto_60712 ) ) ( not ( = ?auto_60708 ?auto_60706 ) ) ( not ( = ?auto_60718 ?auto_60708 ) ) ( HOIST-AT ?auto_60710 ?auto_60708 ) ( not ( = ?auto_60720 ?auto_60710 ) ) ( not ( = ?auto_60711 ?auto_60710 ) ) ( AVAILABLE ?auto_60710 ) ( SURFACE-AT ?auto_60704 ?auto_60708 ) ( ON ?auto_60704 ?auto_60707 ) ( CLEAR ?auto_60704 ) ( not ( = ?auto_60703 ?auto_60707 ) ) ( not ( = ?auto_60704 ?auto_60707 ) ) ( not ( = ?auto_60705 ?auto_60707 ) ) ( not ( = ?auto_60712 ?auto_60707 ) ) ( IS-CRATE ?auto_60712 ) ( not ( = ?auto_60703 ?auto_60714 ) ) ( not ( = ?auto_60704 ?auto_60714 ) ) ( not ( = ?auto_60705 ?auto_60714 ) ) ( not ( = ?auto_60712 ?auto_60714 ) ) ( not ( = ?auto_60707 ?auto_60714 ) ) ( not ( = ?auto_60713 ?auto_60706 ) ) ( not ( = ?auto_60718 ?auto_60713 ) ) ( not ( = ?auto_60708 ?auto_60713 ) ) ( HOIST-AT ?auto_60715 ?auto_60713 ) ( not ( = ?auto_60720 ?auto_60715 ) ) ( not ( = ?auto_60711 ?auto_60715 ) ) ( not ( = ?auto_60710 ?auto_60715 ) ) ( AVAILABLE ?auto_60715 ) ( SURFACE-AT ?auto_60712 ?auto_60713 ) ( ON ?auto_60712 ?auto_60719 ) ( CLEAR ?auto_60712 ) ( not ( = ?auto_60703 ?auto_60719 ) ) ( not ( = ?auto_60704 ?auto_60719 ) ) ( not ( = ?auto_60705 ?auto_60719 ) ) ( not ( = ?auto_60712 ?auto_60719 ) ) ( not ( = ?auto_60707 ?auto_60719 ) ) ( not ( = ?auto_60714 ?auto_60719 ) ) ( SURFACE-AT ?auto_60709 ?auto_60706 ) ( CLEAR ?auto_60709 ) ( IS-CRATE ?auto_60714 ) ( not ( = ?auto_60703 ?auto_60709 ) ) ( not ( = ?auto_60704 ?auto_60709 ) ) ( not ( = ?auto_60705 ?auto_60709 ) ) ( not ( = ?auto_60712 ?auto_60709 ) ) ( not ( = ?auto_60707 ?auto_60709 ) ) ( not ( = ?auto_60714 ?auto_60709 ) ) ( not ( = ?auto_60719 ?auto_60709 ) ) ( AVAILABLE ?auto_60720 ) ( TRUCK-AT ?auto_60717 ?auto_60716 ) ( not ( = ?auto_60716 ?auto_60706 ) ) ( not ( = ?auto_60718 ?auto_60716 ) ) ( not ( = ?auto_60708 ?auto_60716 ) ) ( not ( = ?auto_60713 ?auto_60716 ) ) ( HOIST-AT ?auto_60721 ?auto_60716 ) ( LIFTING ?auto_60721 ?auto_60714 ) ( not ( = ?auto_60720 ?auto_60721 ) ) ( not ( = ?auto_60711 ?auto_60721 ) ) ( not ( = ?auto_60710 ?auto_60721 ) ) ( not ( = ?auto_60715 ?auto_60721 ) ) )
    :subtasks
    ( ( !LOAD ?auto_60721 ?auto_60714 ?auto_60717 ?auto_60716 )
      ( MAKE-ON ?auto_60703 ?auto_60704 )
      ( MAKE-ON-VERIFY ?auto_60703 ?auto_60704 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60722 - SURFACE
      ?auto_60723 - SURFACE
    )
    :vars
    (
      ?auto_60725 - HOIST
      ?auto_60724 - PLACE
      ?auto_60732 - PLACE
      ?auto_60727 - HOIST
      ?auto_60736 - SURFACE
      ?auto_60728 - SURFACE
      ?auto_60730 - PLACE
      ?auto_60737 - HOIST
      ?auto_60729 - SURFACE
      ?auto_60735 - SURFACE
      ?auto_60731 - PLACE
      ?auto_60740 - HOIST
      ?auto_60738 - SURFACE
      ?auto_60739 - SURFACE
      ?auto_60733 - TRUCK
      ?auto_60734 - PLACE
      ?auto_60726 - HOIST
      ?auto_60741 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60725 ?auto_60724 ) ( IS-CRATE ?auto_60722 ) ( not ( = ?auto_60722 ?auto_60723 ) ) ( not ( = ?auto_60732 ?auto_60724 ) ) ( HOIST-AT ?auto_60727 ?auto_60732 ) ( not ( = ?auto_60725 ?auto_60727 ) ) ( AVAILABLE ?auto_60727 ) ( SURFACE-AT ?auto_60722 ?auto_60732 ) ( ON ?auto_60722 ?auto_60736 ) ( CLEAR ?auto_60722 ) ( not ( = ?auto_60722 ?auto_60736 ) ) ( not ( = ?auto_60723 ?auto_60736 ) ) ( IS-CRATE ?auto_60723 ) ( not ( = ?auto_60722 ?auto_60728 ) ) ( not ( = ?auto_60723 ?auto_60728 ) ) ( not ( = ?auto_60736 ?auto_60728 ) ) ( not ( = ?auto_60730 ?auto_60724 ) ) ( not ( = ?auto_60732 ?auto_60730 ) ) ( HOIST-AT ?auto_60737 ?auto_60730 ) ( not ( = ?auto_60725 ?auto_60737 ) ) ( not ( = ?auto_60727 ?auto_60737 ) ) ( AVAILABLE ?auto_60737 ) ( SURFACE-AT ?auto_60723 ?auto_60730 ) ( ON ?auto_60723 ?auto_60729 ) ( CLEAR ?auto_60723 ) ( not ( = ?auto_60722 ?auto_60729 ) ) ( not ( = ?auto_60723 ?auto_60729 ) ) ( not ( = ?auto_60736 ?auto_60729 ) ) ( not ( = ?auto_60728 ?auto_60729 ) ) ( IS-CRATE ?auto_60728 ) ( not ( = ?auto_60722 ?auto_60735 ) ) ( not ( = ?auto_60723 ?auto_60735 ) ) ( not ( = ?auto_60736 ?auto_60735 ) ) ( not ( = ?auto_60728 ?auto_60735 ) ) ( not ( = ?auto_60729 ?auto_60735 ) ) ( not ( = ?auto_60731 ?auto_60724 ) ) ( not ( = ?auto_60732 ?auto_60731 ) ) ( not ( = ?auto_60730 ?auto_60731 ) ) ( HOIST-AT ?auto_60740 ?auto_60731 ) ( not ( = ?auto_60725 ?auto_60740 ) ) ( not ( = ?auto_60727 ?auto_60740 ) ) ( not ( = ?auto_60737 ?auto_60740 ) ) ( AVAILABLE ?auto_60740 ) ( SURFACE-AT ?auto_60728 ?auto_60731 ) ( ON ?auto_60728 ?auto_60738 ) ( CLEAR ?auto_60728 ) ( not ( = ?auto_60722 ?auto_60738 ) ) ( not ( = ?auto_60723 ?auto_60738 ) ) ( not ( = ?auto_60736 ?auto_60738 ) ) ( not ( = ?auto_60728 ?auto_60738 ) ) ( not ( = ?auto_60729 ?auto_60738 ) ) ( not ( = ?auto_60735 ?auto_60738 ) ) ( SURFACE-AT ?auto_60739 ?auto_60724 ) ( CLEAR ?auto_60739 ) ( IS-CRATE ?auto_60735 ) ( not ( = ?auto_60722 ?auto_60739 ) ) ( not ( = ?auto_60723 ?auto_60739 ) ) ( not ( = ?auto_60736 ?auto_60739 ) ) ( not ( = ?auto_60728 ?auto_60739 ) ) ( not ( = ?auto_60729 ?auto_60739 ) ) ( not ( = ?auto_60735 ?auto_60739 ) ) ( not ( = ?auto_60738 ?auto_60739 ) ) ( AVAILABLE ?auto_60725 ) ( TRUCK-AT ?auto_60733 ?auto_60734 ) ( not ( = ?auto_60734 ?auto_60724 ) ) ( not ( = ?auto_60732 ?auto_60734 ) ) ( not ( = ?auto_60730 ?auto_60734 ) ) ( not ( = ?auto_60731 ?auto_60734 ) ) ( HOIST-AT ?auto_60726 ?auto_60734 ) ( not ( = ?auto_60725 ?auto_60726 ) ) ( not ( = ?auto_60727 ?auto_60726 ) ) ( not ( = ?auto_60737 ?auto_60726 ) ) ( not ( = ?auto_60740 ?auto_60726 ) ) ( AVAILABLE ?auto_60726 ) ( SURFACE-AT ?auto_60735 ?auto_60734 ) ( ON ?auto_60735 ?auto_60741 ) ( CLEAR ?auto_60735 ) ( not ( = ?auto_60722 ?auto_60741 ) ) ( not ( = ?auto_60723 ?auto_60741 ) ) ( not ( = ?auto_60736 ?auto_60741 ) ) ( not ( = ?auto_60728 ?auto_60741 ) ) ( not ( = ?auto_60729 ?auto_60741 ) ) ( not ( = ?auto_60735 ?auto_60741 ) ) ( not ( = ?auto_60738 ?auto_60741 ) ) ( not ( = ?auto_60739 ?auto_60741 ) ) )
    :subtasks
    ( ( !LIFT ?auto_60726 ?auto_60735 ?auto_60741 ?auto_60734 )
      ( MAKE-ON ?auto_60722 ?auto_60723 )
      ( MAKE-ON-VERIFY ?auto_60722 ?auto_60723 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60742 - SURFACE
      ?auto_60743 - SURFACE
    )
    :vars
    (
      ?auto_60756 - HOIST
      ?auto_60758 - PLACE
      ?auto_60755 - PLACE
      ?auto_60750 - HOIST
      ?auto_60746 - SURFACE
      ?auto_60749 - SURFACE
      ?auto_60744 - PLACE
      ?auto_60754 - HOIST
      ?auto_60759 - SURFACE
      ?auto_60748 - SURFACE
      ?auto_60751 - PLACE
      ?auto_60753 - HOIST
      ?auto_60760 - SURFACE
      ?auto_60761 - SURFACE
      ?auto_60747 - PLACE
      ?auto_60757 - HOIST
      ?auto_60745 - SURFACE
      ?auto_60752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60756 ?auto_60758 ) ( IS-CRATE ?auto_60742 ) ( not ( = ?auto_60742 ?auto_60743 ) ) ( not ( = ?auto_60755 ?auto_60758 ) ) ( HOIST-AT ?auto_60750 ?auto_60755 ) ( not ( = ?auto_60756 ?auto_60750 ) ) ( AVAILABLE ?auto_60750 ) ( SURFACE-AT ?auto_60742 ?auto_60755 ) ( ON ?auto_60742 ?auto_60746 ) ( CLEAR ?auto_60742 ) ( not ( = ?auto_60742 ?auto_60746 ) ) ( not ( = ?auto_60743 ?auto_60746 ) ) ( IS-CRATE ?auto_60743 ) ( not ( = ?auto_60742 ?auto_60749 ) ) ( not ( = ?auto_60743 ?auto_60749 ) ) ( not ( = ?auto_60746 ?auto_60749 ) ) ( not ( = ?auto_60744 ?auto_60758 ) ) ( not ( = ?auto_60755 ?auto_60744 ) ) ( HOIST-AT ?auto_60754 ?auto_60744 ) ( not ( = ?auto_60756 ?auto_60754 ) ) ( not ( = ?auto_60750 ?auto_60754 ) ) ( AVAILABLE ?auto_60754 ) ( SURFACE-AT ?auto_60743 ?auto_60744 ) ( ON ?auto_60743 ?auto_60759 ) ( CLEAR ?auto_60743 ) ( not ( = ?auto_60742 ?auto_60759 ) ) ( not ( = ?auto_60743 ?auto_60759 ) ) ( not ( = ?auto_60746 ?auto_60759 ) ) ( not ( = ?auto_60749 ?auto_60759 ) ) ( IS-CRATE ?auto_60749 ) ( not ( = ?auto_60742 ?auto_60748 ) ) ( not ( = ?auto_60743 ?auto_60748 ) ) ( not ( = ?auto_60746 ?auto_60748 ) ) ( not ( = ?auto_60749 ?auto_60748 ) ) ( not ( = ?auto_60759 ?auto_60748 ) ) ( not ( = ?auto_60751 ?auto_60758 ) ) ( not ( = ?auto_60755 ?auto_60751 ) ) ( not ( = ?auto_60744 ?auto_60751 ) ) ( HOIST-AT ?auto_60753 ?auto_60751 ) ( not ( = ?auto_60756 ?auto_60753 ) ) ( not ( = ?auto_60750 ?auto_60753 ) ) ( not ( = ?auto_60754 ?auto_60753 ) ) ( AVAILABLE ?auto_60753 ) ( SURFACE-AT ?auto_60749 ?auto_60751 ) ( ON ?auto_60749 ?auto_60760 ) ( CLEAR ?auto_60749 ) ( not ( = ?auto_60742 ?auto_60760 ) ) ( not ( = ?auto_60743 ?auto_60760 ) ) ( not ( = ?auto_60746 ?auto_60760 ) ) ( not ( = ?auto_60749 ?auto_60760 ) ) ( not ( = ?auto_60759 ?auto_60760 ) ) ( not ( = ?auto_60748 ?auto_60760 ) ) ( SURFACE-AT ?auto_60761 ?auto_60758 ) ( CLEAR ?auto_60761 ) ( IS-CRATE ?auto_60748 ) ( not ( = ?auto_60742 ?auto_60761 ) ) ( not ( = ?auto_60743 ?auto_60761 ) ) ( not ( = ?auto_60746 ?auto_60761 ) ) ( not ( = ?auto_60749 ?auto_60761 ) ) ( not ( = ?auto_60759 ?auto_60761 ) ) ( not ( = ?auto_60748 ?auto_60761 ) ) ( not ( = ?auto_60760 ?auto_60761 ) ) ( AVAILABLE ?auto_60756 ) ( not ( = ?auto_60747 ?auto_60758 ) ) ( not ( = ?auto_60755 ?auto_60747 ) ) ( not ( = ?auto_60744 ?auto_60747 ) ) ( not ( = ?auto_60751 ?auto_60747 ) ) ( HOIST-AT ?auto_60757 ?auto_60747 ) ( not ( = ?auto_60756 ?auto_60757 ) ) ( not ( = ?auto_60750 ?auto_60757 ) ) ( not ( = ?auto_60754 ?auto_60757 ) ) ( not ( = ?auto_60753 ?auto_60757 ) ) ( AVAILABLE ?auto_60757 ) ( SURFACE-AT ?auto_60748 ?auto_60747 ) ( ON ?auto_60748 ?auto_60745 ) ( CLEAR ?auto_60748 ) ( not ( = ?auto_60742 ?auto_60745 ) ) ( not ( = ?auto_60743 ?auto_60745 ) ) ( not ( = ?auto_60746 ?auto_60745 ) ) ( not ( = ?auto_60749 ?auto_60745 ) ) ( not ( = ?auto_60759 ?auto_60745 ) ) ( not ( = ?auto_60748 ?auto_60745 ) ) ( not ( = ?auto_60760 ?auto_60745 ) ) ( not ( = ?auto_60761 ?auto_60745 ) ) ( TRUCK-AT ?auto_60752 ?auto_60758 ) )
    :subtasks
    ( ( !DRIVE ?auto_60752 ?auto_60758 ?auto_60747 )
      ( MAKE-ON ?auto_60742 ?auto_60743 )
      ( MAKE-ON-VERIFY ?auto_60742 ?auto_60743 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60762 - SURFACE
      ?auto_60763 - SURFACE
    )
    :vars
    (
      ?auto_60775 - HOIST
      ?auto_60764 - PLACE
      ?auto_60778 - PLACE
      ?auto_60780 - HOIST
      ?auto_60770 - SURFACE
      ?auto_60774 - SURFACE
      ?auto_60772 - PLACE
      ?auto_60766 - HOIST
      ?auto_60781 - SURFACE
      ?auto_60776 - SURFACE
      ?auto_60779 - PLACE
      ?auto_60765 - HOIST
      ?auto_60773 - SURFACE
      ?auto_60769 - SURFACE
      ?auto_60771 - PLACE
      ?auto_60768 - HOIST
      ?auto_60767 - SURFACE
      ?auto_60777 - TRUCK
      ?auto_60782 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60775 ?auto_60764 ) ( IS-CRATE ?auto_60762 ) ( not ( = ?auto_60762 ?auto_60763 ) ) ( not ( = ?auto_60778 ?auto_60764 ) ) ( HOIST-AT ?auto_60780 ?auto_60778 ) ( not ( = ?auto_60775 ?auto_60780 ) ) ( AVAILABLE ?auto_60780 ) ( SURFACE-AT ?auto_60762 ?auto_60778 ) ( ON ?auto_60762 ?auto_60770 ) ( CLEAR ?auto_60762 ) ( not ( = ?auto_60762 ?auto_60770 ) ) ( not ( = ?auto_60763 ?auto_60770 ) ) ( IS-CRATE ?auto_60763 ) ( not ( = ?auto_60762 ?auto_60774 ) ) ( not ( = ?auto_60763 ?auto_60774 ) ) ( not ( = ?auto_60770 ?auto_60774 ) ) ( not ( = ?auto_60772 ?auto_60764 ) ) ( not ( = ?auto_60778 ?auto_60772 ) ) ( HOIST-AT ?auto_60766 ?auto_60772 ) ( not ( = ?auto_60775 ?auto_60766 ) ) ( not ( = ?auto_60780 ?auto_60766 ) ) ( AVAILABLE ?auto_60766 ) ( SURFACE-AT ?auto_60763 ?auto_60772 ) ( ON ?auto_60763 ?auto_60781 ) ( CLEAR ?auto_60763 ) ( not ( = ?auto_60762 ?auto_60781 ) ) ( not ( = ?auto_60763 ?auto_60781 ) ) ( not ( = ?auto_60770 ?auto_60781 ) ) ( not ( = ?auto_60774 ?auto_60781 ) ) ( IS-CRATE ?auto_60774 ) ( not ( = ?auto_60762 ?auto_60776 ) ) ( not ( = ?auto_60763 ?auto_60776 ) ) ( not ( = ?auto_60770 ?auto_60776 ) ) ( not ( = ?auto_60774 ?auto_60776 ) ) ( not ( = ?auto_60781 ?auto_60776 ) ) ( not ( = ?auto_60779 ?auto_60764 ) ) ( not ( = ?auto_60778 ?auto_60779 ) ) ( not ( = ?auto_60772 ?auto_60779 ) ) ( HOIST-AT ?auto_60765 ?auto_60779 ) ( not ( = ?auto_60775 ?auto_60765 ) ) ( not ( = ?auto_60780 ?auto_60765 ) ) ( not ( = ?auto_60766 ?auto_60765 ) ) ( AVAILABLE ?auto_60765 ) ( SURFACE-AT ?auto_60774 ?auto_60779 ) ( ON ?auto_60774 ?auto_60773 ) ( CLEAR ?auto_60774 ) ( not ( = ?auto_60762 ?auto_60773 ) ) ( not ( = ?auto_60763 ?auto_60773 ) ) ( not ( = ?auto_60770 ?auto_60773 ) ) ( not ( = ?auto_60774 ?auto_60773 ) ) ( not ( = ?auto_60781 ?auto_60773 ) ) ( not ( = ?auto_60776 ?auto_60773 ) ) ( IS-CRATE ?auto_60776 ) ( not ( = ?auto_60762 ?auto_60769 ) ) ( not ( = ?auto_60763 ?auto_60769 ) ) ( not ( = ?auto_60770 ?auto_60769 ) ) ( not ( = ?auto_60774 ?auto_60769 ) ) ( not ( = ?auto_60781 ?auto_60769 ) ) ( not ( = ?auto_60776 ?auto_60769 ) ) ( not ( = ?auto_60773 ?auto_60769 ) ) ( not ( = ?auto_60771 ?auto_60764 ) ) ( not ( = ?auto_60778 ?auto_60771 ) ) ( not ( = ?auto_60772 ?auto_60771 ) ) ( not ( = ?auto_60779 ?auto_60771 ) ) ( HOIST-AT ?auto_60768 ?auto_60771 ) ( not ( = ?auto_60775 ?auto_60768 ) ) ( not ( = ?auto_60780 ?auto_60768 ) ) ( not ( = ?auto_60766 ?auto_60768 ) ) ( not ( = ?auto_60765 ?auto_60768 ) ) ( AVAILABLE ?auto_60768 ) ( SURFACE-AT ?auto_60776 ?auto_60771 ) ( ON ?auto_60776 ?auto_60767 ) ( CLEAR ?auto_60776 ) ( not ( = ?auto_60762 ?auto_60767 ) ) ( not ( = ?auto_60763 ?auto_60767 ) ) ( not ( = ?auto_60770 ?auto_60767 ) ) ( not ( = ?auto_60774 ?auto_60767 ) ) ( not ( = ?auto_60781 ?auto_60767 ) ) ( not ( = ?auto_60776 ?auto_60767 ) ) ( not ( = ?auto_60773 ?auto_60767 ) ) ( not ( = ?auto_60769 ?auto_60767 ) ) ( TRUCK-AT ?auto_60777 ?auto_60764 ) ( SURFACE-AT ?auto_60782 ?auto_60764 ) ( CLEAR ?auto_60782 ) ( LIFTING ?auto_60775 ?auto_60769 ) ( IS-CRATE ?auto_60769 ) ( not ( = ?auto_60762 ?auto_60782 ) ) ( not ( = ?auto_60763 ?auto_60782 ) ) ( not ( = ?auto_60770 ?auto_60782 ) ) ( not ( = ?auto_60774 ?auto_60782 ) ) ( not ( = ?auto_60781 ?auto_60782 ) ) ( not ( = ?auto_60776 ?auto_60782 ) ) ( not ( = ?auto_60773 ?auto_60782 ) ) ( not ( = ?auto_60769 ?auto_60782 ) ) ( not ( = ?auto_60767 ?auto_60782 ) ) )
    :subtasks
    ( ( !DROP ?auto_60775 ?auto_60769 ?auto_60782 ?auto_60764 )
      ( MAKE-ON ?auto_60762 ?auto_60763 )
      ( MAKE-ON-VERIFY ?auto_60762 ?auto_60763 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60783 - SURFACE
      ?auto_60784 - SURFACE
    )
    :vars
    (
      ?auto_60791 - HOIST
      ?auto_60787 - PLACE
      ?auto_60797 - PLACE
      ?auto_60802 - HOIST
      ?auto_60785 - SURFACE
      ?auto_60793 - SURFACE
      ?auto_60792 - PLACE
      ?auto_60789 - HOIST
      ?auto_60803 - SURFACE
      ?auto_60788 - SURFACE
      ?auto_60799 - PLACE
      ?auto_60786 - HOIST
      ?auto_60798 - SURFACE
      ?auto_60794 - SURFACE
      ?auto_60801 - PLACE
      ?auto_60795 - HOIST
      ?auto_60796 - SURFACE
      ?auto_60800 - TRUCK
      ?auto_60790 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60791 ?auto_60787 ) ( IS-CRATE ?auto_60783 ) ( not ( = ?auto_60783 ?auto_60784 ) ) ( not ( = ?auto_60797 ?auto_60787 ) ) ( HOIST-AT ?auto_60802 ?auto_60797 ) ( not ( = ?auto_60791 ?auto_60802 ) ) ( AVAILABLE ?auto_60802 ) ( SURFACE-AT ?auto_60783 ?auto_60797 ) ( ON ?auto_60783 ?auto_60785 ) ( CLEAR ?auto_60783 ) ( not ( = ?auto_60783 ?auto_60785 ) ) ( not ( = ?auto_60784 ?auto_60785 ) ) ( IS-CRATE ?auto_60784 ) ( not ( = ?auto_60783 ?auto_60793 ) ) ( not ( = ?auto_60784 ?auto_60793 ) ) ( not ( = ?auto_60785 ?auto_60793 ) ) ( not ( = ?auto_60792 ?auto_60787 ) ) ( not ( = ?auto_60797 ?auto_60792 ) ) ( HOIST-AT ?auto_60789 ?auto_60792 ) ( not ( = ?auto_60791 ?auto_60789 ) ) ( not ( = ?auto_60802 ?auto_60789 ) ) ( AVAILABLE ?auto_60789 ) ( SURFACE-AT ?auto_60784 ?auto_60792 ) ( ON ?auto_60784 ?auto_60803 ) ( CLEAR ?auto_60784 ) ( not ( = ?auto_60783 ?auto_60803 ) ) ( not ( = ?auto_60784 ?auto_60803 ) ) ( not ( = ?auto_60785 ?auto_60803 ) ) ( not ( = ?auto_60793 ?auto_60803 ) ) ( IS-CRATE ?auto_60793 ) ( not ( = ?auto_60783 ?auto_60788 ) ) ( not ( = ?auto_60784 ?auto_60788 ) ) ( not ( = ?auto_60785 ?auto_60788 ) ) ( not ( = ?auto_60793 ?auto_60788 ) ) ( not ( = ?auto_60803 ?auto_60788 ) ) ( not ( = ?auto_60799 ?auto_60787 ) ) ( not ( = ?auto_60797 ?auto_60799 ) ) ( not ( = ?auto_60792 ?auto_60799 ) ) ( HOIST-AT ?auto_60786 ?auto_60799 ) ( not ( = ?auto_60791 ?auto_60786 ) ) ( not ( = ?auto_60802 ?auto_60786 ) ) ( not ( = ?auto_60789 ?auto_60786 ) ) ( AVAILABLE ?auto_60786 ) ( SURFACE-AT ?auto_60793 ?auto_60799 ) ( ON ?auto_60793 ?auto_60798 ) ( CLEAR ?auto_60793 ) ( not ( = ?auto_60783 ?auto_60798 ) ) ( not ( = ?auto_60784 ?auto_60798 ) ) ( not ( = ?auto_60785 ?auto_60798 ) ) ( not ( = ?auto_60793 ?auto_60798 ) ) ( not ( = ?auto_60803 ?auto_60798 ) ) ( not ( = ?auto_60788 ?auto_60798 ) ) ( IS-CRATE ?auto_60788 ) ( not ( = ?auto_60783 ?auto_60794 ) ) ( not ( = ?auto_60784 ?auto_60794 ) ) ( not ( = ?auto_60785 ?auto_60794 ) ) ( not ( = ?auto_60793 ?auto_60794 ) ) ( not ( = ?auto_60803 ?auto_60794 ) ) ( not ( = ?auto_60788 ?auto_60794 ) ) ( not ( = ?auto_60798 ?auto_60794 ) ) ( not ( = ?auto_60801 ?auto_60787 ) ) ( not ( = ?auto_60797 ?auto_60801 ) ) ( not ( = ?auto_60792 ?auto_60801 ) ) ( not ( = ?auto_60799 ?auto_60801 ) ) ( HOIST-AT ?auto_60795 ?auto_60801 ) ( not ( = ?auto_60791 ?auto_60795 ) ) ( not ( = ?auto_60802 ?auto_60795 ) ) ( not ( = ?auto_60789 ?auto_60795 ) ) ( not ( = ?auto_60786 ?auto_60795 ) ) ( AVAILABLE ?auto_60795 ) ( SURFACE-AT ?auto_60788 ?auto_60801 ) ( ON ?auto_60788 ?auto_60796 ) ( CLEAR ?auto_60788 ) ( not ( = ?auto_60783 ?auto_60796 ) ) ( not ( = ?auto_60784 ?auto_60796 ) ) ( not ( = ?auto_60785 ?auto_60796 ) ) ( not ( = ?auto_60793 ?auto_60796 ) ) ( not ( = ?auto_60803 ?auto_60796 ) ) ( not ( = ?auto_60788 ?auto_60796 ) ) ( not ( = ?auto_60798 ?auto_60796 ) ) ( not ( = ?auto_60794 ?auto_60796 ) ) ( TRUCK-AT ?auto_60800 ?auto_60787 ) ( SURFACE-AT ?auto_60790 ?auto_60787 ) ( CLEAR ?auto_60790 ) ( IS-CRATE ?auto_60794 ) ( not ( = ?auto_60783 ?auto_60790 ) ) ( not ( = ?auto_60784 ?auto_60790 ) ) ( not ( = ?auto_60785 ?auto_60790 ) ) ( not ( = ?auto_60793 ?auto_60790 ) ) ( not ( = ?auto_60803 ?auto_60790 ) ) ( not ( = ?auto_60788 ?auto_60790 ) ) ( not ( = ?auto_60798 ?auto_60790 ) ) ( not ( = ?auto_60794 ?auto_60790 ) ) ( not ( = ?auto_60796 ?auto_60790 ) ) ( AVAILABLE ?auto_60791 ) ( IN ?auto_60794 ?auto_60800 ) )
    :subtasks
    ( ( !UNLOAD ?auto_60791 ?auto_60794 ?auto_60800 ?auto_60787 )
      ( MAKE-ON ?auto_60783 ?auto_60784 )
      ( MAKE-ON-VERIFY ?auto_60783 ?auto_60784 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60804 - SURFACE
      ?auto_60805 - SURFACE
    )
    :vars
    (
      ?auto_60806 - HOIST
      ?auto_60812 - PLACE
      ?auto_60809 - PLACE
      ?auto_60820 - HOIST
      ?auto_60815 - SURFACE
      ?auto_60818 - SURFACE
      ?auto_60810 - PLACE
      ?auto_60814 - HOIST
      ?auto_60819 - SURFACE
      ?auto_60807 - SURFACE
      ?auto_60822 - PLACE
      ?auto_60817 - HOIST
      ?auto_60816 - SURFACE
      ?auto_60823 - SURFACE
      ?auto_60824 - PLACE
      ?auto_60813 - HOIST
      ?auto_60821 - SURFACE
      ?auto_60811 - SURFACE
      ?auto_60808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60806 ?auto_60812 ) ( IS-CRATE ?auto_60804 ) ( not ( = ?auto_60804 ?auto_60805 ) ) ( not ( = ?auto_60809 ?auto_60812 ) ) ( HOIST-AT ?auto_60820 ?auto_60809 ) ( not ( = ?auto_60806 ?auto_60820 ) ) ( AVAILABLE ?auto_60820 ) ( SURFACE-AT ?auto_60804 ?auto_60809 ) ( ON ?auto_60804 ?auto_60815 ) ( CLEAR ?auto_60804 ) ( not ( = ?auto_60804 ?auto_60815 ) ) ( not ( = ?auto_60805 ?auto_60815 ) ) ( IS-CRATE ?auto_60805 ) ( not ( = ?auto_60804 ?auto_60818 ) ) ( not ( = ?auto_60805 ?auto_60818 ) ) ( not ( = ?auto_60815 ?auto_60818 ) ) ( not ( = ?auto_60810 ?auto_60812 ) ) ( not ( = ?auto_60809 ?auto_60810 ) ) ( HOIST-AT ?auto_60814 ?auto_60810 ) ( not ( = ?auto_60806 ?auto_60814 ) ) ( not ( = ?auto_60820 ?auto_60814 ) ) ( AVAILABLE ?auto_60814 ) ( SURFACE-AT ?auto_60805 ?auto_60810 ) ( ON ?auto_60805 ?auto_60819 ) ( CLEAR ?auto_60805 ) ( not ( = ?auto_60804 ?auto_60819 ) ) ( not ( = ?auto_60805 ?auto_60819 ) ) ( not ( = ?auto_60815 ?auto_60819 ) ) ( not ( = ?auto_60818 ?auto_60819 ) ) ( IS-CRATE ?auto_60818 ) ( not ( = ?auto_60804 ?auto_60807 ) ) ( not ( = ?auto_60805 ?auto_60807 ) ) ( not ( = ?auto_60815 ?auto_60807 ) ) ( not ( = ?auto_60818 ?auto_60807 ) ) ( not ( = ?auto_60819 ?auto_60807 ) ) ( not ( = ?auto_60822 ?auto_60812 ) ) ( not ( = ?auto_60809 ?auto_60822 ) ) ( not ( = ?auto_60810 ?auto_60822 ) ) ( HOIST-AT ?auto_60817 ?auto_60822 ) ( not ( = ?auto_60806 ?auto_60817 ) ) ( not ( = ?auto_60820 ?auto_60817 ) ) ( not ( = ?auto_60814 ?auto_60817 ) ) ( AVAILABLE ?auto_60817 ) ( SURFACE-AT ?auto_60818 ?auto_60822 ) ( ON ?auto_60818 ?auto_60816 ) ( CLEAR ?auto_60818 ) ( not ( = ?auto_60804 ?auto_60816 ) ) ( not ( = ?auto_60805 ?auto_60816 ) ) ( not ( = ?auto_60815 ?auto_60816 ) ) ( not ( = ?auto_60818 ?auto_60816 ) ) ( not ( = ?auto_60819 ?auto_60816 ) ) ( not ( = ?auto_60807 ?auto_60816 ) ) ( IS-CRATE ?auto_60807 ) ( not ( = ?auto_60804 ?auto_60823 ) ) ( not ( = ?auto_60805 ?auto_60823 ) ) ( not ( = ?auto_60815 ?auto_60823 ) ) ( not ( = ?auto_60818 ?auto_60823 ) ) ( not ( = ?auto_60819 ?auto_60823 ) ) ( not ( = ?auto_60807 ?auto_60823 ) ) ( not ( = ?auto_60816 ?auto_60823 ) ) ( not ( = ?auto_60824 ?auto_60812 ) ) ( not ( = ?auto_60809 ?auto_60824 ) ) ( not ( = ?auto_60810 ?auto_60824 ) ) ( not ( = ?auto_60822 ?auto_60824 ) ) ( HOIST-AT ?auto_60813 ?auto_60824 ) ( not ( = ?auto_60806 ?auto_60813 ) ) ( not ( = ?auto_60820 ?auto_60813 ) ) ( not ( = ?auto_60814 ?auto_60813 ) ) ( not ( = ?auto_60817 ?auto_60813 ) ) ( AVAILABLE ?auto_60813 ) ( SURFACE-AT ?auto_60807 ?auto_60824 ) ( ON ?auto_60807 ?auto_60821 ) ( CLEAR ?auto_60807 ) ( not ( = ?auto_60804 ?auto_60821 ) ) ( not ( = ?auto_60805 ?auto_60821 ) ) ( not ( = ?auto_60815 ?auto_60821 ) ) ( not ( = ?auto_60818 ?auto_60821 ) ) ( not ( = ?auto_60819 ?auto_60821 ) ) ( not ( = ?auto_60807 ?auto_60821 ) ) ( not ( = ?auto_60816 ?auto_60821 ) ) ( not ( = ?auto_60823 ?auto_60821 ) ) ( SURFACE-AT ?auto_60811 ?auto_60812 ) ( CLEAR ?auto_60811 ) ( IS-CRATE ?auto_60823 ) ( not ( = ?auto_60804 ?auto_60811 ) ) ( not ( = ?auto_60805 ?auto_60811 ) ) ( not ( = ?auto_60815 ?auto_60811 ) ) ( not ( = ?auto_60818 ?auto_60811 ) ) ( not ( = ?auto_60819 ?auto_60811 ) ) ( not ( = ?auto_60807 ?auto_60811 ) ) ( not ( = ?auto_60816 ?auto_60811 ) ) ( not ( = ?auto_60823 ?auto_60811 ) ) ( not ( = ?auto_60821 ?auto_60811 ) ) ( AVAILABLE ?auto_60806 ) ( IN ?auto_60823 ?auto_60808 ) ( TRUCK-AT ?auto_60808 ?auto_60809 ) )
    :subtasks
    ( ( !DRIVE ?auto_60808 ?auto_60809 ?auto_60812 )
      ( MAKE-ON ?auto_60804 ?auto_60805 )
      ( MAKE-ON-VERIFY ?auto_60804 ?auto_60805 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60825 - SURFACE
      ?auto_60826 - SURFACE
    )
    :vars
    (
      ?auto_60841 - HOIST
      ?auto_60837 - PLACE
      ?auto_60840 - PLACE
      ?auto_60839 - HOIST
      ?auto_60830 - SURFACE
      ?auto_60828 - SURFACE
      ?auto_60827 - PLACE
      ?auto_60836 - HOIST
      ?auto_60831 - SURFACE
      ?auto_60833 - SURFACE
      ?auto_60838 - PLACE
      ?auto_60829 - HOIST
      ?auto_60832 - SURFACE
      ?auto_60834 - SURFACE
      ?auto_60843 - PLACE
      ?auto_60844 - HOIST
      ?auto_60842 - SURFACE
      ?auto_60845 - SURFACE
      ?auto_60835 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60841 ?auto_60837 ) ( IS-CRATE ?auto_60825 ) ( not ( = ?auto_60825 ?auto_60826 ) ) ( not ( = ?auto_60840 ?auto_60837 ) ) ( HOIST-AT ?auto_60839 ?auto_60840 ) ( not ( = ?auto_60841 ?auto_60839 ) ) ( SURFACE-AT ?auto_60825 ?auto_60840 ) ( ON ?auto_60825 ?auto_60830 ) ( CLEAR ?auto_60825 ) ( not ( = ?auto_60825 ?auto_60830 ) ) ( not ( = ?auto_60826 ?auto_60830 ) ) ( IS-CRATE ?auto_60826 ) ( not ( = ?auto_60825 ?auto_60828 ) ) ( not ( = ?auto_60826 ?auto_60828 ) ) ( not ( = ?auto_60830 ?auto_60828 ) ) ( not ( = ?auto_60827 ?auto_60837 ) ) ( not ( = ?auto_60840 ?auto_60827 ) ) ( HOIST-AT ?auto_60836 ?auto_60827 ) ( not ( = ?auto_60841 ?auto_60836 ) ) ( not ( = ?auto_60839 ?auto_60836 ) ) ( AVAILABLE ?auto_60836 ) ( SURFACE-AT ?auto_60826 ?auto_60827 ) ( ON ?auto_60826 ?auto_60831 ) ( CLEAR ?auto_60826 ) ( not ( = ?auto_60825 ?auto_60831 ) ) ( not ( = ?auto_60826 ?auto_60831 ) ) ( not ( = ?auto_60830 ?auto_60831 ) ) ( not ( = ?auto_60828 ?auto_60831 ) ) ( IS-CRATE ?auto_60828 ) ( not ( = ?auto_60825 ?auto_60833 ) ) ( not ( = ?auto_60826 ?auto_60833 ) ) ( not ( = ?auto_60830 ?auto_60833 ) ) ( not ( = ?auto_60828 ?auto_60833 ) ) ( not ( = ?auto_60831 ?auto_60833 ) ) ( not ( = ?auto_60838 ?auto_60837 ) ) ( not ( = ?auto_60840 ?auto_60838 ) ) ( not ( = ?auto_60827 ?auto_60838 ) ) ( HOIST-AT ?auto_60829 ?auto_60838 ) ( not ( = ?auto_60841 ?auto_60829 ) ) ( not ( = ?auto_60839 ?auto_60829 ) ) ( not ( = ?auto_60836 ?auto_60829 ) ) ( AVAILABLE ?auto_60829 ) ( SURFACE-AT ?auto_60828 ?auto_60838 ) ( ON ?auto_60828 ?auto_60832 ) ( CLEAR ?auto_60828 ) ( not ( = ?auto_60825 ?auto_60832 ) ) ( not ( = ?auto_60826 ?auto_60832 ) ) ( not ( = ?auto_60830 ?auto_60832 ) ) ( not ( = ?auto_60828 ?auto_60832 ) ) ( not ( = ?auto_60831 ?auto_60832 ) ) ( not ( = ?auto_60833 ?auto_60832 ) ) ( IS-CRATE ?auto_60833 ) ( not ( = ?auto_60825 ?auto_60834 ) ) ( not ( = ?auto_60826 ?auto_60834 ) ) ( not ( = ?auto_60830 ?auto_60834 ) ) ( not ( = ?auto_60828 ?auto_60834 ) ) ( not ( = ?auto_60831 ?auto_60834 ) ) ( not ( = ?auto_60833 ?auto_60834 ) ) ( not ( = ?auto_60832 ?auto_60834 ) ) ( not ( = ?auto_60843 ?auto_60837 ) ) ( not ( = ?auto_60840 ?auto_60843 ) ) ( not ( = ?auto_60827 ?auto_60843 ) ) ( not ( = ?auto_60838 ?auto_60843 ) ) ( HOIST-AT ?auto_60844 ?auto_60843 ) ( not ( = ?auto_60841 ?auto_60844 ) ) ( not ( = ?auto_60839 ?auto_60844 ) ) ( not ( = ?auto_60836 ?auto_60844 ) ) ( not ( = ?auto_60829 ?auto_60844 ) ) ( AVAILABLE ?auto_60844 ) ( SURFACE-AT ?auto_60833 ?auto_60843 ) ( ON ?auto_60833 ?auto_60842 ) ( CLEAR ?auto_60833 ) ( not ( = ?auto_60825 ?auto_60842 ) ) ( not ( = ?auto_60826 ?auto_60842 ) ) ( not ( = ?auto_60830 ?auto_60842 ) ) ( not ( = ?auto_60828 ?auto_60842 ) ) ( not ( = ?auto_60831 ?auto_60842 ) ) ( not ( = ?auto_60833 ?auto_60842 ) ) ( not ( = ?auto_60832 ?auto_60842 ) ) ( not ( = ?auto_60834 ?auto_60842 ) ) ( SURFACE-AT ?auto_60845 ?auto_60837 ) ( CLEAR ?auto_60845 ) ( IS-CRATE ?auto_60834 ) ( not ( = ?auto_60825 ?auto_60845 ) ) ( not ( = ?auto_60826 ?auto_60845 ) ) ( not ( = ?auto_60830 ?auto_60845 ) ) ( not ( = ?auto_60828 ?auto_60845 ) ) ( not ( = ?auto_60831 ?auto_60845 ) ) ( not ( = ?auto_60833 ?auto_60845 ) ) ( not ( = ?auto_60832 ?auto_60845 ) ) ( not ( = ?auto_60834 ?auto_60845 ) ) ( not ( = ?auto_60842 ?auto_60845 ) ) ( AVAILABLE ?auto_60841 ) ( TRUCK-AT ?auto_60835 ?auto_60840 ) ( LIFTING ?auto_60839 ?auto_60834 ) )
    :subtasks
    ( ( !LOAD ?auto_60839 ?auto_60834 ?auto_60835 ?auto_60840 )
      ( MAKE-ON ?auto_60825 ?auto_60826 )
      ( MAKE-ON-VERIFY ?auto_60825 ?auto_60826 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60846 - SURFACE
      ?auto_60847 - SURFACE
    )
    :vars
    (
      ?auto_60851 - HOIST
      ?auto_60852 - PLACE
      ?auto_60864 - PLACE
      ?auto_60856 - HOIST
      ?auto_60854 - SURFACE
      ?auto_60848 - SURFACE
      ?auto_60853 - PLACE
      ?auto_60865 - HOIST
      ?auto_60860 - SURFACE
      ?auto_60859 - SURFACE
      ?auto_60855 - PLACE
      ?auto_60857 - HOIST
      ?auto_60849 - SURFACE
      ?auto_60866 - SURFACE
      ?auto_60862 - PLACE
      ?auto_60858 - HOIST
      ?auto_60850 - SURFACE
      ?auto_60861 - SURFACE
      ?auto_60863 - TRUCK
      ?auto_60867 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60851 ?auto_60852 ) ( IS-CRATE ?auto_60846 ) ( not ( = ?auto_60846 ?auto_60847 ) ) ( not ( = ?auto_60864 ?auto_60852 ) ) ( HOIST-AT ?auto_60856 ?auto_60864 ) ( not ( = ?auto_60851 ?auto_60856 ) ) ( SURFACE-AT ?auto_60846 ?auto_60864 ) ( ON ?auto_60846 ?auto_60854 ) ( CLEAR ?auto_60846 ) ( not ( = ?auto_60846 ?auto_60854 ) ) ( not ( = ?auto_60847 ?auto_60854 ) ) ( IS-CRATE ?auto_60847 ) ( not ( = ?auto_60846 ?auto_60848 ) ) ( not ( = ?auto_60847 ?auto_60848 ) ) ( not ( = ?auto_60854 ?auto_60848 ) ) ( not ( = ?auto_60853 ?auto_60852 ) ) ( not ( = ?auto_60864 ?auto_60853 ) ) ( HOIST-AT ?auto_60865 ?auto_60853 ) ( not ( = ?auto_60851 ?auto_60865 ) ) ( not ( = ?auto_60856 ?auto_60865 ) ) ( AVAILABLE ?auto_60865 ) ( SURFACE-AT ?auto_60847 ?auto_60853 ) ( ON ?auto_60847 ?auto_60860 ) ( CLEAR ?auto_60847 ) ( not ( = ?auto_60846 ?auto_60860 ) ) ( not ( = ?auto_60847 ?auto_60860 ) ) ( not ( = ?auto_60854 ?auto_60860 ) ) ( not ( = ?auto_60848 ?auto_60860 ) ) ( IS-CRATE ?auto_60848 ) ( not ( = ?auto_60846 ?auto_60859 ) ) ( not ( = ?auto_60847 ?auto_60859 ) ) ( not ( = ?auto_60854 ?auto_60859 ) ) ( not ( = ?auto_60848 ?auto_60859 ) ) ( not ( = ?auto_60860 ?auto_60859 ) ) ( not ( = ?auto_60855 ?auto_60852 ) ) ( not ( = ?auto_60864 ?auto_60855 ) ) ( not ( = ?auto_60853 ?auto_60855 ) ) ( HOIST-AT ?auto_60857 ?auto_60855 ) ( not ( = ?auto_60851 ?auto_60857 ) ) ( not ( = ?auto_60856 ?auto_60857 ) ) ( not ( = ?auto_60865 ?auto_60857 ) ) ( AVAILABLE ?auto_60857 ) ( SURFACE-AT ?auto_60848 ?auto_60855 ) ( ON ?auto_60848 ?auto_60849 ) ( CLEAR ?auto_60848 ) ( not ( = ?auto_60846 ?auto_60849 ) ) ( not ( = ?auto_60847 ?auto_60849 ) ) ( not ( = ?auto_60854 ?auto_60849 ) ) ( not ( = ?auto_60848 ?auto_60849 ) ) ( not ( = ?auto_60860 ?auto_60849 ) ) ( not ( = ?auto_60859 ?auto_60849 ) ) ( IS-CRATE ?auto_60859 ) ( not ( = ?auto_60846 ?auto_60866 ) ) ( not ( = ?auto_60847 ?auto_60866 ) ) ( not ( = ?auto_60854 ?auto_60866 ) ) ( not ( = ?auto_60848 ?auto_60866 ) ) ( not ( = ?auto_60860 ?auto_60866 ) ) ( not ( = ?auto_60859 ?auto_60866 ) ) ( not ( = ?auto_60849 ?auto_60866 ) ) ( not ( = ?auto_60862 ?auto_60852 ) ) ( not ( = ?auto_60864 ?auto_60862 ) ) ( not ( = ?auto_60853 ?auto_60862 ) ) ( not ( = ?auto_60855 ?auto_60862 ) ) ( HOIST-AT ?auto_60858 ?auto_60862 ) ( not ( = ?auto_60851 ?auto_60858 ) ) ( not ( = ?auto_60856 ?auto_60858 ) ) ( not ( = ?auto_60865 ?auto_60858 ) ) ( not ( = ?auto_60857 ?auto_60858 ) ) ( AVAILABLE ?auto_60858 ) ( SURFACE-AT ?auto_60859 ?auto_60862 ) ( ON ?auto_60859 ?auto_60850 ) ( CLEAR ?auto_60859 ) ( not ( = ?auto_60846 ?auto_60850 ) ) ( not ( = ?auto_60847 ?auto_60850 ) ) ( not ( = ?auto_60854 ?auto_60850 ) ) ( not ( = ?auto_60848 ?auto_60850 ) ) ( not ( = ?auto_60860 ?auto_60850 ) ) ( not ( = ?auto_60859 ?auto_60850 ) ) ( not ( = ?auto_60849 ?auto_60850 ) ) ( not ( = ?auto_60866 ?auto_60850 ) ) ( SURFACE-AT ?auto_60861 ?auto_60852 ) ( CLEAR ?auto_60861 ) ( IS-CRATE ?auto_60866 ) ( not ( = ?auto_60846 ?auto_60861 ) ) ( not ( = ?auto_60847 ?auto_60861 ) ) ( not ( = ?auto_60854 ?auto_60861 ) ) ( not ( = ?auto_60848 ?auto_60861 ) ) ( not ( = ?auto_60860 ?auto_60861 ) ) ( not ( = ?auto_60859 ?auto_60861 ) ) ( not ( = ?auto_60849 ?auto_60861 ) ) ( not ( = ?auto_60866 ?auto_60861 ) ) ( not ( = ?auto_60850 ?auto_60861 ) ) ( AVAILABLE ?auto_60851 ) ( TRUCK-AT ?auto_60863 ?auto_60864 ) ( AVAILABLE ?auto_60856 ) ( SURFACE-AT ?auto_60866 ?auto_60864 ) ( ON ?auto_60866 ?auto_60867 ) ( CLEAR ?auto_60866 ) ( not ( = ?auto_60846 ?auto_60867 ) ) ( not ( = ?auto_60847 ?auto_60867 ) ) ( not ( = ?auto_60854 ?auto_60867 ) ) ( not ( = ?auto_60848 ?auto_60867 ) ) ( not ( = ?auto_60860 ?auto_60867 ) ) ( not ( = ?auto_60859 ?auto_60867 ) ) ( not ( = ?auto_60849 ?auto_60867 ) ) ( not ( = ?auto_60866 ?auto_60867 ) ) ( not ( = ?auto_60850 ?auto_60867 ) ) ( not ( = ?auto_60861 ?auto_60867 ) ) )
    :subtasks
    ( ( !LIFT ?auto_60856 ?auto_60866 ?auto_60867 ?auto_60864 )
      ( MAKE-ON ?auto_60846 ?auto_60847 )
      ( MAKE-ON-VERIFY ?auto_60846 ?auto_60847 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60868 - SURFACE
      ?auto_60869 - SURFACE
    )
    :vars
    (
      ?auto_60888 - HOIST
      ?auto_60876 - PLACE
      ?auto_60887 - PLACE
      ?auto_60884 - HOIST
      ?auto_60879 - SURFACE
      ?auto_60889 - SURFACE
      ?auto_60885 - PLACE
      ?auto_60871 - HOIST
      ?auto_60881 - SURFACE
      ?auto_60874 - SURFACE
      ?auto_60875 - PLACE
      ?auto_60882 - HOIST
      ?auto_60873 - SURFACE
      ?auto_60872 - SURFACE
      ?auto_60877 - PLACE
      ?auto_60886 - HOIST
      ?auto_60880 - SURFACE
      ?auto_60870 - SURFACE
      ?auto_60883 - SURFACE
      ?auto_60878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60888 ?auto_60876 ) ( IS-CRATE ?auto_60868 ) ( not ( = ?auto_60868 ?auto_60869 ) ) ( not ( = ?auto_60887 ?auto_60876 ) ) ( HOIST-AT ?auto_60884 ?auto_60887 ) ( not ( = ?auto_60888 ?auto_60884 ) ) ( SURFACE-AT ?auto_60868 ?auto_60887 ) ( ON ?auto_60868 ?auto_60879 ) ( CLEAR ?auto_60868 ) ( not ( = ?auto_60868 ?auto_60879 ) ) ( not ( = ?auto_60869 ?auto_60879 ) ) ( IS-CRATE ?auto_60869 ) ( not ( = ?auto_60868 ?auto_60889 ) ) ( not ( = ?auto_60869 ?auto_60889 ) ) ( not ( = ?auto_60879 ?auto_60889 ) ) ( not ( = ?auto_60885 ?auto_60876 ) ) ( not ( = ?auto_60887 ?auto_60885 ) ) ( HOIST-AT ?auto_60871 ?auto_60885 ) ( not ( = ?auto_60888 ?auto_60871 ) ) ( not ( = ?auto_60884 ?auto_60871 ) ) ( AVAILABLE ?auto_60871 ) ( SURFACE-AT ?auto_60869 ?auto_60885 ) ( ON ?auto_60869 ?auto_60881 ) ( CLEAR ?auto_60869 ) ( not ( = ?auto_60868 ?auto_60881 ) ) ( not ( = ?auto_60869 ?auto_60881 ) ) ( not ( = ?auto_60879 ?auto_60881 ) ) ( not ( = ?auto_60889 ?auto_60881 ) ) ( IS-CRATE ?auto_60889 ) ( not ( = ?auto_60868 ?auto_60874 ) ) ( not ( = ?auto_60869 ?auto_60874 ) ) ( not ( = ?auto_60879 ?auto_60874 ) ) ( not ( = ?auto_60889 ?auto_60874 ) ) ( not ( = ?auto_60881 ?auto_60874 ) ) ( not ( = ?auto_60875 ?auto_60876 ) ) ( not ( = ?auto_60887 ?auto_60875 ) ) ( not ( = ?auto_60885 ?auto_60875 ) ) ( HOIST-AT ?auto_60882 ?auto_60875 ) ( not ( = ?auto_60888 ?auto_60882 ) ) ( not ( = ?auto_60884 ?auto_60882 ) ) ( not ( = ?auto_60871 ?auto_60882 ) ) ( AVAILABLE ?auto_60882 ) ( SURFACE-AT ?auto_60889 ?auto_60875 ) ( ON ?auto_60889 ?auto_60873 ) ( CLEAR ?auto_60889 ) ( not ( = ?auto_60868 ?auto_60873 ) ) ( not ( = ?auto_60869 ?auto_60873 ) ) ( not ( = ?auto_60879 ?auto_60873 ) ) ( not ( = ?auto_60889 ?auto_60873 ) ) ( not ( = ?auto_60881 ?auto_60873 ) ) ( not ( = ?auto_60874 ?auto_60873 ) ) ( IS-CRATE ?auto_60874 ) ( not ( = ?auto_60868 ?auto_60872 ) ) ( not ( = ?auto_60869 ?auto_60872 ) ) ( not ( = ?auto_60879 ?auto_60872 ) ) ( not ( = ?auto_60889 ?auto_60872 ) ) ( not ( = ?auto_60881 ?auto_60872 ) ) ( not ( = ?auto_60874 ?auto_60872 ) ) ( not ( = ?auto_60873 ?auto_60872 ) ) ( not ( = ?auto_60877 ?auto_60876 ) ) ( not ( = ?auto_60887 ?auto_60877 ) ) ( not ( = ?auto_60885 ?auto_60877 ) ) ( not ( = ?auto_60875 ?auto_60877 ) ) ( HOIST-AT ?auto_60886 ?auto_60877 ) ( not ( = ?auto_60888 ?auto_60886 ) ) ( not ( = ?auto_60884 ?auto_60886 ) ) ( not ( = ?auto_60871 ?auto_60886 ) ) ( not ( = ?auto_60882 ?auto_60886 ) ) ( AVAILABLE ?auto_60886 ) ( SURFACE-AT ?auto_60874 ?auto_60877 ) ( ON ?auto_60874 ?auto_60880 ) ( CLEAR ?auto_60874 ) ( not ( = ?auto_60868 ?auto_60880 ) ) ( not ( = ?auto_60869 ?auto_60880 ) ) ( not ( = ?auto_60879 ?auto_60880 ) ) ( not ( = ?auto_60889 ?auto_60880 ) ) ( not ( = ?auto_60881 ?auto_60880 ) ) ( not ( = ?auto_60874 ?auto_60880 ) ) ( not ( = ?auto_60873 ?auto_60880 ) ) ( not ( = ?auto_60872 ?auto_60880 ) ) ( SURFACE-AT ?auto_60870 ?auto_60876 ) ( CLEAR ?auto_60870 ) ( IS-CRATE ?auto_60872 ) ( not ( = ?auto_60868 ?auto_60870 ) ) ( not ( = ?auto_60869 ?auto_60870 ) ) ( not ( = ?auto_60879 ?auto_60870 ) ) ( not ( = ?auto_60889 ?auto_60870 ) ) ( not ( = ?auto_60881 ?auto_60870 ) ) ( not ( = ?auto_60874 ?auto_60870 ) ) ( not ( = ?auto_60873 ?auto_60870 ) ) ( not ( = ?auto_60872 ?auto_60870 ) ) ( not ( = ?auto_60880 ?auto_60870 ) ) ( AVAILABLE ?auto_60888 ) ( AVAILABLE ?auto_60884 ) ( SURFACE-AT ?auto_60872 ?auto_60887 ) ( ON ?auto_60872 ?auto_60883 ) ( CLEAR ?auto_60872 ) ( not ( = ?auto_60868 ?auto_60883 ) ) ( not ( = ?auto_60869 ?auto_60883 ) ) ( not ( = ?auto_60879 ?auto_60883 ) ) ( not ( = ?auto_60889 ?auto_60883 ) ) ( not ( = ?auto_60881 ?auto_60883 ) ) ( not ( = ?auto_60874 ?auto_60883 ) ) ( not ( = ?auto_60873 ?auto_60883 ) ) ( not ( = ?auto_60872 ?auto_60883 ) ) ( not ( = ?auto_60880 ?auto_60883 ) ) ( not ( = ?auto_60870 ?auto_60883 ) ) ( TRUCK-AT ?auto_60878 ?auto_60876 ) )
    :subtasks
    ( ( !DRIVE ?auto_60878 ?auto_60876 ?auto_60887 )
      ( MAKE-ON ?auto_60868 ?auto_60869 )
      ( MAKE-ON-VERIFY ?auto_60868 ?auto_60869 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60890 - SURFACE
      ?auto_60891 - SURFACE
    )
    :vars
    (
      ?auto_60893 - HOIST
      ?auto_60896 - PLACE
      ?auto_60908 - PLACE
      ?auto_60900 - HOIST
      ?auto_60902 - SURFACE
      ?auto_60909 - SURFACE
      ?auto_60911 - PLACE
      ?auto_60907 - HOIST
      ?auto_60897 - SURFACE
      ?auto_60898 - SURFACE
      ?auto_60904 - PLACE
      ?auto_60899 - HOIST
      ?auto_60905 - SURFACE
      ?auto_60910 - SURFACE
      ?auto_60894 - PLACE
      ?auto_60892 - HOIST
      ?auto_60895 - SURFACE
      ?auto_60901 - SURFACE
      ?auto_60906 - SURFACE
      ?auto_60903 - TRUCK
      ?auto_60912 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60893 ?auto_60896 ) ( IS-CRATE ?auto_60890 ) ( not ( = ?auto_60890 ?auto_60891 ) ) ( not ( = ?auto_60908 ?auto_60896 ) ) ( HOIST-AT ?auto_60900 ?auto_60908 ) ( not ( = ?auto_60893 ?auto_60900 ) ) ( SURFACE-AT ?auto_60890 ?auto_60908 ) ( ON ?auto_60890 ?auto_60902 ) ( CLEAR ?auto_60890 ) ( not ( = ?auto_60890 ?auto_60902 ) ) ( not ( = ?auto_60891 ?auto_60902 ) ) ( IS-CRATE ?auto_60891 ) ( not ( = ?auto_60890 ?auto_60909 ) ) ( not ( = ?auto_60891 ?auto_60909 ) ) ( not ( = ?auto_60902 ?auto_60909 ) ) ( not ( = ?auto_60911 ?auto_60896 ) ) ( not ( = ?auto_60908 ?auto_60911 ) ) ( HOIST-AT ?auto_60907 ?auto_60911 ) ( not ( = ?auto_60893 ?auto_60907 ) ) ( not ( = ?auto_60900 ?auto_60907 ) ) ( AVAILABLE ?auto_60907 ) ( SURFACE-AT ?auto_60891 ?auto_60911 ) ( ON ?auto_60891 ?auto_60897 ) ( CLEAR ?auto_60891 ) ( not ( = ?auto_60890 ?auto_60897 ) ) ( not ( = ?auto_60891 ?auto_60897 ) ) ( not ( = ?auto_60902 ?auto_60897 ) ) ( not ( = ?auto_60909 ?auto_60897 ) ) ( IS-CRATE ?auto_60909 ) ( not ( = ?auto_60890 ?auto_60898 ) ) ( not ( = ?auto_60891 ?auto_60898 ) ) ( not ( = ?auto_60902 ?auto_60898 ) ) ( not ( = ?auto_60909 ?auto_60898 ) ) ( not ( = ?auto_60897 ?auto_60898 ) ) ( not ( = ?auto_60904 ?auto_60896 ) ) ( not ( = ?auto_60908 ?auto_60904 ) ) ( not ( = ?auto_60911 ?auto_60904 ) ) ( HOIST-AT ?auto_60899 ?auto_60904 ) ( not ( = ?auto_60893 ?auto_60899 ) ) ( not ( = ?auto_60900 ?auto_60899 ) ) ( not ( = ?auto_60907 ?auto_60899 ) ) ( AVAILABLE ?auto_60899 ) ( SURFACE-AT ?auto_60909 ?auto_60904 ) ( ON ?auto_60909 ?auto_60905 ) ( CLEAR ?auto_60909 ) ( not ( = ?auto_60890 ?auto_60905 ) ) ( not ( = ?auto_60891 ?auto_60905 ) ) ( not ( = ?auto_60902 ?auto_60905 ) ) ( not ( = ?auto_60909 ?auto_60905 ) ) ( not ( = ?auto_60897 ?auto_60905 ) ) ( not ( = ?auto_60898 ?auto_60905 ) ) ( IS-CRATE ?auto_60898 ) ( not ( = ?auto_60890 ?auto_60910 ) ) ( not ( = ?auto_60891 ?auto_60910 ) ) ( not ( = ?auto_60902 ?auto_60910 ) ) ( not ( = ?auto_60909 ?auto_60910 ) ) ( not ( = ?auto_60897 ?auto_60910 ) ) ( not ( = ?auto_60898 ?auto_60910 ) ) ( not ( = ?auto_60905 ?auto_60910 ) ) ( not ( = ?auto_60894 ?auto_60896 ) ) ( not ( = ?auto_60908 ?auto_60894 ) ) ( not ( = ?auto_60911 ?auto_60894 ) ) ( not ( = ?auto_60904 ?auto_60894 ) ) ( HOIST-AT ?auto_60892 ?auto_60894 ) ( not ( = ?auto_60893 ?auto_60892 ) ) ( not ( = ?auto_60900 ?auto_60892 ) ) ( not ( = ?auto_60907 ?auto_60892 ) ) ( not ( = ?auto_60899 ?auto_60892 ) ) ( AVAILABLE ?auto_60892 ) ( SURFACE-AT ?auto_60898 ?auto_60894 ) ( ON ?auto_60898 ?auto_60895 ) ( CLEAR ?auto_60898 ) ( not ( = ?auto_60890 ?auto_60895 ) ) ( not ( = ?auto_60891 ?auto_60895 ) ) ( not ( = ?auto_60902 ?auto_60895 ) ) ( not ( = ?auto_60909 ?auto_60895 ) ) ( not ( = ?auto_60897 ?auto_60895 ) ) ( not ( = ?auto_60898 ?auto_60895 ) ) ( not ( = ?auto_60905 ?auto_60895 ) ) ( not ( = ?auto_60910 ?auto_60895 ) ) ( IS-CRATE ?auto_60910 ) ( not ( = ?auto_60890 ?auto_60901 ) ) ( not ( = ?auto_60891 ?auto_60901 ) ) ( not ( = ?auto_60902 ?auto_60901 ) ) ( not ( = ?auto_60909 ?auto_60901 ) ) ( not ( = ?auto_60897 ?auto_60901 ) ) ( not ( = ?auto_60898 ?auto_60901 ) ) ( not ( = ?auto_60905 ?auto_60901 ) ) ( not ( = ?auto_60910 ?auto_60901 ) ) ( not ( = ?auto_60895 ?auto_60901 ) ) ( AVAILABLE ?auto_60900 ) ( SURFACE-AT ?auto_60910 ?auto_60908 ) ( ON ?auto_60910 ?auto_60906 ) ( CLEAR ?auto_60910 ) ( not ( = ?auto_60890 ?auto_60906 ) ) ( not ( = ?auto_60891 ?auto_60906 ) ) ( not ( = ?auto_60902 ?auto_60906 ) ) ( not ( = ?auto_60909 ?auto_60906 ) ) ( not ( = ?auto_60897 ?auto_60906 ) ) ( not ( = ?auto_60898 ?auto_60906 ) ) ( not ( = ?auto_60905 ?auto_60906 ) ) ( not ( = ?auto_60910 ?auto_60906 ) ) ( not ( = ?auto_60895 ?auto_60906 ) ) ( not ( = ?auto_60901 ?auto_60906 ) ) ( TRUCK-AT ?auto_60903 ?auto_60896 ) ( SURFACE-AT ?auto_60912 ?auto_60896 ) ( CLEAR ?auto_60912 ) ( LIFTING ?auto_60893 ?auto_60901 ) ( IS-CRATE ?auto_60901 ) ( not ( = ?auto_60890 ?auto_60912 ) ) ( not ( = ?auto_60891 ?auto_60912 ) ) ( not ( = ?auto_60902 ?auto_60912 ) ) ( not ( = ?auto_60909 ?auto_60912 ) ) ( not ( = ?auto_60897 ?auto_60912 ) ) ( not ( = ?auto_60898 ?auto_60912 ) ) ( not ( = ?auto_60905 ?auto_60912 ) ) ( not ( = ?auto_60910 ?auto_60912 ) ) ( not ( = ?auto_60895 ?auto_60912 ) ) ( not ( = ?auto_60901 ?auto_60912 ) ) ( not ( = ?auto_60906 ?auto_60912 ) ) )
    :subtasks
    ( ( !DROP ?auto_60893 ?auto_60901 ?auto_60912 ?auto_60896 )
      ( MAKE-ON ?auto_60890 ?auto_60891 )
      ( MAKE-ON-VERIFY ?auto_60890 ?auto_60891 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60913 - SURFACE
      ?auto_60914 - SURFACE
    )
    :vars
    (
      ?auto_60923 - HOIST
      ?auto_60924 - PLACE
      ?auto_60917 - PLACE
      ?auto_60920 - HOIST
      ?auto_60921 - SURFACE
      ?auto_60931 - SURFACE
      ?auto_60929 - PLACE
      ?auto_60934 - HOIST
      ?auto_60915 - SURFACE
      ?auto_60918 - SURFACE
      ?auto_60916 - PLACE
      ?auto_60919 - HOIST
      ?auto_60933 - SURFACE
      ?auto_60930 - SURFACE
      ?auto_60928 - PLACE
      ?auto_60935 - HOIST
      ?auto_60925 - SURFACE
      ?auto_60922 - SURFACE
      ?auto_60927 - SURFACE
      ?auto_60932 - TRUCK
      ?auto_60926 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60923 ?auto_60924 ) ( IS-CRATE ?auto_60913 ) ( not ( = ?auto_60913 ?auto_60914 ) ) ( not ( = ?auto_60917 ?auto_60924 ) ) ( HOIST-AT ?auto_60920 ?auto_60917 ) ( not ( = ?auto_60923 ?auto_60920 ) ) ( SURFACE-AT ?auto_60913 ?auto_60917 ) ( ON ?auto_60913 ?auto_60921 ) ( CLEAR ?auto_60913 ) ( not ( = ?auto_60913 ?auto_60921 ) ) ( not ( = ?auto_60914 ?auto_60921 ) ) ( IS-CRATE ?auto_60914 ) ( not ( = ?auto_60913 ?auto_60931 ) ) ( not ( = ?auto_60914 ?auto_60931 ) ) ( not ( = ?auto_60921 ?auto_60931 ) ) ( not ( = ?auto_60929 ?auto_60924 ) ) ( not ( = ?auto_60917 ?auto_60929 ) ) ( HOIST-AT ?auto_60934 ?auto_60929 ) ( not ( = ?auto_60923 ?auto_60934 ) ) ( not ( = ?auto_60920 ?auto_60934 ) ) ( AVAILABLE ?auto_60934 ) ( SURFACE-AT ?auto_60914 ?auto_60929 ) ( ON ?auto_60914 ?auto_60915 ) ( CLEAR ?auto_60914 ) ( not ( = ?auto_60913 ?auto_60915 ) ) ( not ( = ?auto_60914 ?auto_60915 ) ) ( not ( = ?auto_60921 ?auto_60915 ) ) ( not ( = ?auto_60931 ?auto_60915 ) ) ( IS-CRATE ?auto_60931 ) ( not ( = ?auto_60913 ?auto_60918 ) ) ( not ( = ?auto_60914 ?auto_60918 ) ) ( not ( = ?auto_60921 ?auto_60918 ) ) ( not ( = ?auto_60931 ?auto_60918 ) ) ( not ( = ?auto_60915 ?auto_60918 ) ) ( not ( = ?auto_60916 ?auto_60924 ) ) ( not ( = ?auto_60917 ?auto_60916 ) ) ( not ( = ?auto_60929 ?auto_60916 ) ) ( HOIST-AT ?auto_60919 ?auto_60916 ) ( not ( = ?auto_60923 ?auto_60919 ) ) ( not ( = ?auto_60920 ?auto_60919 ) ) ( not ( = ?auto_60934 ?auto_60919 ) ) ( AVAILABLE ?auto_60919 ) ( SURFACE-AT ?auto_60931 ?auto_60916 ) ( ON ?auto_60931 ?auto_60933 ) ( CLEAR ?auto_60931 ) ( not ( = ?auto_60913 ?auto_60933 ) ) ( not ( = ?auto_60914 ?auto_60933 ) ) ( not ( = ?auto_60921 ?auto_60933 ) ) ( not ( = ?auto_60931 ?auto_60933 ) ) ( not ( = ?auto_60915 ?auto_60933 ) ) ( not ( = ?auto_60918 ?auto_60933 ) ) ( IS-CRATE ?auto_60918 ) ( not ( = ?auto_60913 ?auto_60930 ) ) ( not ( = ?auto_60914 ?auto_60930 ) ) ( not ( = ?auto_60921 ?auto_60930 ) ) ( not ( = ?auto_60931 ?auto_60930 ) ) ( not ( = ?auto_60915 ?auto_60930 ) ) ( not ( = ?auto_60918 ?auto_60930 ) ) ( not ( = ?auto_60933 ?auto_60930 ) ) ( not ( = ?auto_60928 ?auto_60924 ) ) ( not ( = ?auto_60917 ?auto_60928 ) ) ( not ( = ?auto_60929 ?auto_60928 ) ) ( not ( = ?auto_60916 ?auto_60928 ) ) ( HOIST-AT ?auto_60935 ?auto_60928 ) ( not ( = ?auto_60923 ?auto_60935 ) ) ( not ( = ?auto_60920 ?auto_60935 ) ) ( not ( = ?auto_60934 ?auto_60935 ) ) ( not ( = ?auto_60919 ?auto_60935 ) ) ( AVAILABLE ?auto_60935 ) ( SURFACE-AT ?auto_60918 ?auto_60928 ) ( ON ?auto_60918 ?auto_60925 ) ( CLEAR ?auto_60918 ) ( not ( = ?auto_60913 ?auto_60925 ) ) ( not ( = ?auto_60914 ?auto_60925 ) ) ( not ( = ?auto_60921 ?auto_60925 ) ) ( not ( = ?auto_60931 ?auto_60925 ) ) ( not ( = ?auto_60915 ?auto_60925 ) ) ( not ( = ?auto_60918 ?auto_60925 ) ) ( not ( = ?auto_60933 ?auto_60925 ) ) ( not ( = ?auto_60930 ?auto_60925 ) ) ( IS-CRATE ?auto_60930 ) ( not ( = ?auto_60913 ?auto_60922 ) ) ( not ( = ?auto_60914 ?auto_60922 ) ) ( not ( = ?auto_60921 ?auto_60922 ) ) ( not ( = ?auto_60931 ?auto_60922 ) ) ( not ( = ?auto_60915 ?auto_60922 ) ) ( not ( = ?auto_60918 ?auto_60922 ) ) ( not ( = ?auto_60933 ?auto_60922 ) ) ( not ( = ?auto_60930 ?auto_60922 ) ) ( not ( = ?auto_60925 ?auto_60922 ) ) ( AVAILABLE ?auto_60920 ) ( SURFACE-AT ?auto_60930 ?auto_60917 ) ( ON ?auto_60930 ?auto_60927 ) ( CLEAR ?auto_60930 ) ( not ( = ?auto_60913 ?auto_60927 ) ) ( not ( = ?auto_60914 ?auto_60927 ) ) ( not ( = ?auto_60921 ?auto_60927 ) ) ( not ( = ?auto_60931 ?auto_60927 ) ) ( not ( = ?auto_60915 ?auto_60927 ) ) ( not ( = ?auto_60918 ?auto_60927 ) ) ( not ( = ?auto_60933 ?auto_60927 ) ) ( not ( = ?auto_60930 ?auto_60927 ) ) ( not ( = ?auto_60925 ?auto_60927 ) ) ( not ( = ?auto_60922 ?auto_60927 ) ) ( TRUCK-AT ?auto_60932 ?auto_60924 ) ( SURFACE-AT ?auto_60926 ?auto_60924 ) ( CLEAR ?auto_60926 ) ( IS-CRATE ?auto_60922 ) ( not ( = ?auto_60913 ?auto_60926 ) ) ( not ( = ?auto_60914 ?auto_60926 ) ) ( not ( = ?auto_60921 ?auto_60926 ) ) ( not ( = ?auto_60931 ?auto_60926 ) ) ( not ( = ?auto_60915 ?auto_60926 ) ) ( not ( = ?auto_60918 ?auto_60926 ) ) ( not ( = ?auto_60933 ?auto_60926 ) ) ( not ( = ?auto_60930 ?auto_60926 ) ) ( not ( = ?auto_60925 ?auto_60926 ) ) ( not ( = ?auto_60922 ?auto_60926 ) ) ( not ( = ?auto_60927 ?auto_60926 ) ) ( AVAILABLE ?auto_60923 ) ( IN ?auto_60922 ?auto_60932 ) )
    :subtasks
    ( ( !UNLOAD ?auto_60923 ?auto_60922 ?auto_60932 ?auto_60924 )
      ( MAKE-ON ?auto_60913 ?auto_60914 )
      ( MAKE-ON-VERIFY ?auto_60913 ?auto_60914 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60936 - SURFACE
      ?auto_60937 - SURFACE
    )
    :vars
    (
      ?auto_60952 - HOIST
      ?auto_60939 - PLACE
      ?auto_60948 - PLACE
      ?auto_60949 - HOIST
      ?auto_60954 - SURFACE
      ?auto_60951 - SURFACE
      ?auto_60944 - PLACE
      ?auto_60942 - HOIST
      ?auto_60940 - SURFACE
      ?auto_60938 - SURFACE
      ?auto_60950 - PLACE
      ?auto_60945 - HOIST
      ?auto_60953 - SURFACE
      ?auto_60947 - SURFACE
      ?auto_60946 - PLACE
      ?auto_60941 - HOIST
      ?auto_60943 - SURFACE
      ?auto_60958 - SURFACE
      ?auto_60956 - SURFACE
      ?auto_60957 - SURFACE
      ?auto_60955 - TRUCK
      ?auto_60959 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60952 ?auto_60939 ) ( IS-CRATE ?auto_60936 ) ( not ( = ?auto_60936 ?auto_60937 ) ) ( not ( = ?auto_60948 ?auto_60939 ) ) ( HOIST-AT ?auto_60949 ?auto_60948 ) ( not ( = ?auto_60952 ?auto_60949 ) ) ( SURFACE-AT ?auto_60936 ?auto_60948 ) ( ON ?auto_60936 ?auto_60954 ) ( CLEAR ?auto_60936 ) ( not ( = ?auto_60936 ?auto_60954 ) ) ( not ( = ?auto_60937 ?auto_60954 ) ) ( IS-CRATE ?auto_60937 ) ( not ( = ?auto_60936 ?auto_60951 ) ) ( not ( = ?auto_60937 ?auto_60951 ) ) ( not ( = ?auto_60954 ?auto_60951 ) ) ( not ( = ?auto_60944 ?auto_60939 ) ) ( not ( = ?auto_60948 ?auto_60944 ) ) ( HOIST-AT ?auto_60942 ?auto_60944 ) ( not ( = ?auto_60952 ?auto_60942 ) ) ( not ( = ?auto_60949 ?auto_60942 ) ) ( AVAILABLE ?auto_60942 ) ( SURFACE-AT ?auto_60937 ?auto_60944 ) ( ON ?auto_60937 ?auto_60940 ) ( CLEAR ?auto_60937 ) ( not ( = ?auto_60936 ?auto_60940 ) ) ( not ( = ?auto_60937 ?auto_60940 ) ) ( not ( = ?auto_60954 ?auto_60940 ) ) ( not ( = ?auto_60951 ?auto_60940 ) ) ( IS-CRATE ?auto_60951 ) ( not ( = ?auto_60936 ?auto_60938 ) ) ( not ( = ?auto_60937 ?auto_60938 ) ) ( not ( = ?auto_60954 ?auto_60938 ) ) ( not ( = ?auto_60951 ?auto_60938 ) ) ( not ( = ?auto_60940 ?auto_60938 ) ) ( not ( = ?auto_60950 ?auto_60939 ) ) ( not ( = ?auto_60948 ?auto_60950 ) ) ( not ( = ?auto_60944 ?auto_60950 ) ) ( HOIST-AT ?auto_60945 ?auto_60950 ) ( not ( = ?auto_60952 ?auto_60945 ) ) ( not ( = ?auto_60949 ?auto_60945 ) ) ( not ( = ?auto_60942 ?auto_60945 ) ) ( AVAILABLE ?auto_60945 ) ( SURFACE-AT ?auto_60951 ?auto_60950 ) ( ON ?auto_60951 ?auto_60953 ) ( CLEAR ?auto_60951 ) ( not ( = ?auto_60936 ?auto_60953 ) ) ( not ( = ?auto_60937 ?auto_60953 ) ) ( not ( = ?auto_60954 ?auto_60953 ) ) ( not ( = ?auto_60951 ?auto_60953 ) ) ( not ( = ?auto_60940 ?auto_60953 ) ) ( not ( = ?auto_60938 ?auto_60953 ) ) ( IS-CRATE ?auto_60938 ) ( not ( = ?auto_60936 ?auto_60947 ) ) ( not ( = ?auto_60937 ?auto_60947 ) ) ( not ( = ?auto_60954 ?auto_60947 ) ) ( not ( = ?auto_60951 ?auto_60947 ) ) ( not ( = ?auto_60940 ?auto_60947 ) ) ( not ( = ?auto_60938 ?auto_60947 ) ) ( not ( = ?auto_60953 ?auto_60947 ) ) ( not ( = ?auto_60946 ?auto_60939 ) ) ( not ( = ?auto_60948 ?auto_60946 ) ) ( not ( = ?auto_60944 ?auto_60946 ) ) ( not ( = ?auto_60950 ?auto_60946 ) ) ( HOIST-AT ?auto_60941 ?auto_60946 ) ( not ( = ?auto_60952 ?auto_60941 ) ) ( not ( = ?auto_60949 ?auto_60941 ) ) ( not ( = ?auto_60942 ?auto_60941 ) ) ( not ( = ?auto_60945 ?auto_60941 ) ) ( AVAILABLE ?auto_60941 ) ( SURFACE-AT ?auto_60938 ?auto_60946 ) ( ON ?auto_60938 ?auto_60943 ) ( CLEAR ?auto_60938 ) ( not ( = ?auto_60936 ?auto_60943 ) ) ( not ( = ?auto_60937 ?auto_60943 ) ) ( not ( = ?auto_60954 ?auto_60943 ) ) ( not ( = ?auto_60951 ?auto_60943 ) ) ( not ( = ?auto_60940 ?auto_60943 ) ) ( not ( = ?auto_60938 ?auto_60943 ) ) ( not ( = ?auto_60953 ?auto_60943 ) ) ( not ( = ?auto_60947 ?auto_60943 ) ) ( IS-CRATE ?auto_60947 ) ( not ( = ?auto_60936 ?auto_60958 ) ) ( not ( = ?auto_60937 ?auto_60958 ) ) ( not ( = ?auto_60954 ?auto_60958 ) ) ( not ( = ?auto_60951 ?auto_60958 ) ) ( not ( = ?auto_60940 ?auto_60958 ) ) ( not ( = ?auto_60938 ?auto_60958 ) ) ( not ( = ?auto_60953 ?auto_60958 ) ) ( not ( = ?auto_60947 ?auto_60958 ) ) ( not ( = ?auto_60943 ?auto_60958 ) ) ( AVAILABLE ?auto_60949 ) ( SURFACE-AT ?auto_60947 ?auto_60948 ) ( ON ?auto_60947 ?auto_60956 ) ( CLEAR ?auto_60947 ) ( not ( = ?auto_60936 ?auto_60956 ) ) ( not ( = ?auto_60937 ?auto_60956 ) ) ( not ( = ?auto_60954 ?auto_60956 ) ) ( not ( = ?auto_60951 ?auto_60956 ) ) ( not ( = ?auto_60940 ?auto_60956 ) ) ( not ( = ?auto_60938 ?auto_60956 ) ) ( not ( = ?auto_60953 ?auto_60956 ) ) ( not ( = ?auto_60947 ?auto_60956 ) ) ( not ( = ?auto_60943 ?auto_60956 ) ) ( not ( = ?auto_60958 ?auto_60956 ) ) ( SURFACE-AT ?auto_60957 ?auto_60939 ) ( CLEAR ?auto_60957 ) ( IS-CRATE ?auto_60958 ) ( not ( = ?auto_60936 ?auto_60957 ) ) ( not ( = ?auto_60937 ?auto_60957 ) ) ( not ( = ?auto_60954 ?auto_60957 ) ) ( not ( = ?auto_60951 ?auto_60957 ) ) ( not ( = ?auto_60940 ?auto_60957 ) ) ( not ( = ?auto_60938 ?auto_60957 ) ) ( not ( = ?auto_60953 ?auto_60957 ) ) ( not ( = ?auto_60947 ?auto_60957 ) ) ( not ( = ?auto_60943 ?auto_60957 ) ) ( not ( = ?auto_60958 ?auto_60957 ) ) ( not ( = ?auto_60956 ?auto_60957 ) ) ( AVAILABLE ?auto_60952 ) ( IN ?auto_60958 ?auto_60955 ) ( TRUCK-AT ?auto_60955 ?auto_60959 ) ( not ( = ?auto_60959 ?auto_60939 ) ) ( not ( = ?auto_60948 ?auto_60959 ) ) ( not ( = ?auto_60944 ?auto_60959 ) ) ( not ( = ?auto_60950 ?auto_60959 ) ) ( not ( = ?auto_60946 ?auto_60959 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_60955 ?auto_60959 ?auto_60939 )
      ( MAKE-ON ?auto_60936 ?auto_60937 )
      ( MAKE-ON-VERIFY ?auto_60936 ?auto_60937 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60960 - SURFACE
      ?auto_60961 - SURFACE
    )
    :vars
    (
      ?auto_60964 - HOIST
      ?auto_60965 - PLACE
      ?auto_60982 - PLACE
      ?auto_60981 - HOIST
      ?auto_60979 - SURFACE
      ?auto_60973 - SURFACE
      ?auto_60972 - PLACE
      ?auto_60983 - HOIST
      ?auto_60962 - SURFACE
      ?auto_60975 - SURFACE
      ?auto_60970 - PLACE
      ?auto_60966 - HOIST
      ?auto_60971 - SURFACE
      ?auto_60980 - SURFACE
      ?auto_60968 - PLACE
      ?auto_60978 - HOIST
      ?auto_60963 - SURFACE
      ?auto_60977 - SURFACE
      ?auto_60969 - SURFACE
      ?auto_60976 - SURFACE
      ?auto_60974 - TRUCK
      ?auto_60967 - PLACE
      ?auto_60984 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_60964 ?auto_60965 ) ( IS-CRATE ?auto_60960 ) ( not ( = ?auto_60960 ?auto_60961 ) ) ( not ( = ?auto_60982 ?auto_60965 ) ) ( HOIST-AT ?auto_60981 ?auto_60982 ) ( not ( = ?auto_60964 ?auto_60981 ) ) ( SURFACE-AT ?auto_60960 ?auto_60982 ) ( ON ?auto_60960 ?auto_60979 ) ( CLEAR ?auto_60960 ) ( not ( = ?auto_60960 ?auto_60979 ) ) ( not ( = ?auto_60961 ?auto_60979 ) ) ( IS-CRATE ?auto_60961 ) ( not ( = ?auto_60960 ?auto_60973 ) ) ( not ( = ?auto_60961 ?auto_60973 ) ) ( not ( = ?auto_60979 ?auto_60973 ) ) ( not ( = ?auto_60972 ?auto_60965 ) ) ( not ( = ?auto_60982 ?auto_60972 ) ) ( HOIST-AT ?auto_60983 ?auto_60972 ) ( not ( = ?auto_60964 ?auto_60983 ) ) ( not ( = ?auto_60981 ?auto_60983 ) ) ( AVAILABLE ?auto_60983 ) ( SURFACE-AT ?auto_60961 ?auto_60972 ) ( ON ?auto_60961 ?auto_60962 ) ( CLEAR ?auto_60961 ) ( not ( = ?auto_60960 ?auto_60962 ) ) ( not ( = ?auto_60961 ?auto_60962 ) ) ( not ( = ?auto_60979 ?auto_60962 ) ) ( not ( = ?auto_60973 ?auto_60962 ) ) ( IS-CRATE ?auto_60973 ) ( not ( = ?auto_60960 ?auto_60975 ) ) ( not ( = ?auto_60961 ?auto_60975 ) ) ( not ( = ?auto_60979 ?auto_60975 ) ) ( not ( = ?auto_60973 ?auto_60975 ) ) ( not ( = ?auto_60962 ?auto_60975 ) ) ( not ( = ?auto_60970 ?auto_60965 ) ) ( not ( = ?auto_60982 ?auto_60970 ) ) ( not ( = ?auto_60972 ?auto_60970 ) ) ( HOIST-AT ?auto_60966 ?auto_60970 ) ( not ( = ?auto_60964 ?auto_60966 ) ) ( not ( = ?auto_60981 ?auto_60966 ) ) ( not ( = ?auto_60983 ?auto_60966 ) ) ( AVAILABLE ?auto_60966 ) ( SURFACE-AT ?auto_60973 ?auto_60970 ) ( ON ?auto_60973 ?auto_60971 ) ( CLEAR ?auto_60973 ) ( not ( = ?auto_60960 ?auto_60971 ) ) ( not ( = ?auto_60961 ?auto_60971 ) ) ( not ( = ?auto_60979 ?auto_60971 ) ) ( not ( = ?auto_60973 ?auto_60971 ) ) ( not ( = ?auto_60962 ?auto_60971 ) ) ( not ( = ?auto_60975 ?auto_60971 ) ) ( IS-CRATE ?auto_60975 ) ( not ( = ?auto_60960 ?auto_60980 ) ) ( not ( = ?auto_60961 ?auto_60980 ) ) ( not ( = ?auto_60979 ?auto_60980 ) ) ( not ( = ?auto_60973 ?auto_60980 ) ) ( not ( = ?auto_60962 ?auto_60980 ) ) ( not ( = ?auto_60975 ?auto_60980 ) ) ( not ( = ?auto_60971 ?auto_60980 ) ) ( not ( = ?auto_60968 ?auto_60965 ) ) ( not ( = ?auto_60982 ?auto_60968 ) ) ( not ( = ?auto_60972 ?auto_60968 ) ) ( not ( = ?auto_60970 ?auto_60968 ) ) ( HOIST-AT ?auto_60978 ?auto_60968 ) ( not ( = ?auto_60964 ?auto_60978 ) ) ( not ( = ?auto_60981 ?auto_60978 ) ) ( not ( = ?auto_60983 ?auto_60978 ) ) ( not ( = ?auto_60966 ?auto_60978 ) ) ( AVAILABLE ?auto_60978 ) ( SURFACE-AT ?auto_60975 ?auto_60968 ) ( ON ?auto_60975 ?auto_60963 ) ( CLEAR ?auto_60975 ) ( not ( = ?auto_60960 ?auto_60963 ) ) ( not ( = ?auto_60961 ?auto_60963 ) ) ( not ( = ?auto_60979 ?auto_60963 ) ) ( not ( = ?auto_60973 ?auto_60963 ) ) ( not ( = ?auto_60962 ?auto_60963 ) ) ( not ( = ?auto_60975 ?auto_60963 ) ) ( not ( = ?auto_60971 ?auto_60963 ) ) ( not ( = ?auto_60980 ?auto_60963 ) ) ( IS-CRATE ?auto_60980 ) ( not ( = ?auto_60960 ?auto_60977 ) ) ( not ( = ?auto_60961 ?auto_60977 ) ) ( not ( = ?auto_60979 ?auto_60977 ) ) ( not ( = ?auto_60973 ?auto_60977 ) ) ( not ( = ?auto_60962 ?auto_60977 ) ) ( not ( = ?auto_60975 ?auto_60977 ) ) ( not ( = ?auto_60971 ?auto_60977 ) ) ( not ( = ?auto_60980 ?auto_60977 ) ) ( not ( = ?auto_60963 ?auto_60977 ) ) ( AVAILABLE ?auto_60981 ) ( SURFACE-AT ?auto_60980 ?auto_60982 ) ( ON ?auto_60980 ?auto_60969 ) ( CLEAR ?auto_60980 ) ( not ( = ?auto_60960 ?auto_60969 ) ) ( not ( = ?auto_60961 ?auto_60969 ) ) ( not ( = ?auto_60979 ?auto_60969 ) ) ( not ( = ?auto_60973 ?auto_60969 ) ) ( not ( = ?auto_60962 ?auto_60969 ) ) ( not ( = ?auto_60975 ?auto_60969 ) ) ( not ( = ?auto_60971 ?auto_60969 ) ) ( not ( = ?auto_60980 ?auto_60969 ) ) ( not ( = ?auto_60963 ?auto_60969 ) ) ( not ( = ?auto_60977 ?auto_60969 ) ) ( SURFACE-AT ?auto_60976 ?auto_60965 ) ( CLEAR ?auto_60976 ) ( IS-CRATE ?auto_60977 ) ( not ( = ?auto_60960 ?auto_60976 ) ) ( not ( = ?auto_60961 ?auto_60976 ) ) ( not ( = ?auto_60979 ?auto_60976 ) ) ( not ( = ?auto_60973 ?auto_60976 ) ) ( not ( = ?auto_60962 ?auto_60976 ) ) ( not ( = ?auto_60975 ?auto_60976 ) ) ( not ( = ?auto_60971 ?auto_60976 ) ) ( not ( = ?auto_60980 ?auto_60976 ) ) ( not ( = ?auto_60963 ?auto_60976 ) ) ( not ( = ?auto_60977 ?auto_60976 ) ) ( not ( = ?auto_60969 ?auto_60976 ) ) ( AVAILABLE ?auto_60964 ) ( TRUCK-AT ?auto_60974 ?auto_60967 ) ( not ( = ?auto_60967 ?auto_60965 ) ) ( not ( = ?auto_60982 ?auto_60967 ) ) ( not ( = ?auto_60972 ?auto_60967 ) ) ( not ( = ?auto_60970 ?auto_60967 ) ) ( not ( = ?auto_60968 ?auto_60967 ) ) ( HOIST-AT ?auto_60984 ?auto_60967 ) ( LIFTING ?auto_60984 ?auto_60977 ) ( not ( = ?auto_60964 ?auto_60984 ) ) ( not ( = ?auto_60981 ?auto_60984 ) ) ( not ( = ?auto_60983 ?auto_60984 ) ) ( not ( = ?auto_60966 ?auto_60984 ) ) ( not ( = ?auto_60978 ?auto_60984 ) ) )
    :subtasks
    ( ( !LOAD ?auto_60984 ?auto_60977 ?auto_60974 ?auto_60967 )
      ( MAKE-ON ?auto_60960 ?auto_60961 )
      ( MAKE-ON-VERIFY ?auto_60960 ?auto_60961 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_60985 - SURFACE
      ?auto_60986 - SURFACE
    )
    :vars
    (
      ?auto_61002 - HOIST
      ?auto_61003 - PLACE
      ?auto_61008 - PLACE
      ?auto_61007 - HOIST
      ?auto_60999 - SURFACE
      ?auto_60995 - SURFACE
      ?auto_60994 - PLACE
      ?auto_60992 - HOIST
      ?auto_61000 - SURFACE
      ?auto_61006 - SURFACE
      ?auto_60989 - PLACE
      ?auto_60987 - HOIST
      ?auto_60993 - SURFACE
      ?auto_60988 - SURFACE
      ?auto_61009 - PLACE
      ?auto_60998 - HOIST
      ?auto_61005 - SURFACE
      ?auto_61001 - SURFACE
      ?auto_61004 - SURFACE
      ?auto_60996 - SURFACE
      ?auto_60991 - TRUCK
      ?auto_60990 - PLACE
      ?auto_60997 - HOIST
      ?auto_61010 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61002 ?auto_61003 ) ( IS-CRATE ?auto_60985 ) ( not ( = ?auto_60985 ?auto_60986 ) ) ( not ( = ?auto_61008 ?auto_61003 ) ) ( HOIST-AT ?auto_61007 ?auto_61008 ) ( not ( = ?auto_61002 ?auto_61007 ) ) ( SURFACE-AT ?auto_60985 ?auto_61008 ) ( ON ?auto_60985 ?auto_60999 ) ( CLEAR ?auto_60985 ) ( not ( = ?auto_60985 ?auto_60999 ) ) ( not ( = ?auto_60986 ?auto_60999 ) ) ( IS-CRATE ?auto_60986 ) ( not ( = ?auto_60985 ?auto_60995 ) ) ( not ( = ?auto_60986 ?auto_60995 ) ) ( not ( = ?auto_60999 ?auto_60995 ) ) ( not ( = ?auto_60994 ?auto_61003 ) ) ( not ( = ?auto_61008 ?auto_60994 ) ) ( HOIST-AT ?auto_60992 ?auto_60994 ) ( not ( = ?auto_61002 ?auto_60992 ) ) ( not ( = ?auto_61007 ?auto_60992 ) ) ( AVAILABLE ?auto_60992 ) ( SURFACE-AT ?auto_60986 ?auto_60994 ) ( ON ?auto_60986 ?auto_61000 ) ( CLEAR ?auto_60986 ) ( not ( = ?auto_60985 ?auto_61000 ) ) ( not ( = ?auto_60986 ?auto_61000 ) ) ( not ( = ?auto_60999 ?auto_61000 ) ) ( not ( = ?auto_60995 ?auto_61000 ) ) ( IS-CRATE ?auto_60995 ) ( not ( = ?auto_60985 ?auto_61006 ) ) ( not ( = ?auto_60986 ?auto_61006 ) ) ( not ( = ?auto_60999 ?auto_61006 ) ) ( not ( = ?auto_60995 ?auto_61006 ) ) ( not ( = ?auto_61000 ?auto_61006 ) ) ( not ( = ?auto_60989 ?auto_61003 ) ) ( not ( = ?auto_61008 ?auto_60989 ) ) ( not ( = ?auto_60994 ?auto_60989 ) ) ( HOIST-AT ?auto_60987 ?auto_60989 ) ( not ( = ?auto_61002 ?auto_60987 ) ) ( not ( = ?auto_61007 ?auto_60987 ) ) ( not ( = ?auto_60992 ?auto_60987 ) ) ( AVAILABLE ?auto_60987 ) ( SURFACE-AT ?auto_60995 ?auto_60989 ) ( ON ?auto_60995 ?auto_60993 ) ( CLEAR ?auto_60995 ) ( not ( = ?auto_60985 ?auto_60993 ) ) ( not ( = ?auto_60986 ?auto_60993 ) ) ( not ( = ?auto_60999 ?auto_60993 ) ) ( not ( = ?auto_60995 ?auto_60993 ) ) ( not ( = ?auto_61000 ?auto_60993 ) ) ( not ( = ?auto_61006 ?auto_60993 ) ) ( IS-CRATE ?auto_61006 ) ( not ( = ?auto_60985 ?auto_60988 ) ) ( not ( = ?auto_60986 ?auto_60988 ) ) ( not ( = ?auto_60999 ?auto_60988 ) ) ( not ( = ?auto_60995 ?auto_60988 ) ) ( not ( = ?auto_61000 ?auto_60988 ) ) ( not ( = ?auto_61006 ?auto_60988 ) ) ( not ( = ?auto_60993 ?auto_60988 ) ) ( not ( = ?auto_61009 ?auto_61003 ) ) ( not ( = ?auto_61008 ?auto_61009 ) ) ( not ( = ?auto_60994 ?auto_61009 ) ) ( not ( = ?auto_60989 ?auto_61009 ) ) ( HOIST-AT ?auto_60998 ?auto_61009 ) ( not ( = ?auto_61002 ?auto_60998 ) ) ( not ( = ?auto_61007 ?auto_60998 ) ) ( not ( = ?auto_60992 ?auto_60998 ) ) ( not ( = ?auto_60987 ?auto_60998 ) ) ( AVAILABLE ?auto_60998 ) ( SURFACE-AT ?auto_61006 ?auto_61009 ) ( ON ?auto_61006 ?auto_61005 ) ( CLEAR ?auto_61006 ) ( not ( = ?auto_60985 ?auto_61005 ) ) ( not ( = ?auto_60986 ?auto_61005 ) ) ( not ( = ?auto_60999 ?auto_61005 ) ) ( not ( = ?auto_60995 ?auto_61005 ) ) ( not ( = ?auto_61000 ?auto_61005 ) ) ( not ( = ?auto_61006 ?auto_61005 ) ) ( not ( = ?auto_60993 ?auto_61005 ) ) ( not ( = ?auto_60988 ?auto_61005 ) ) ( IS-CRATE ?auto_60988 ) ( not ( = ?auto_60985 ?auto_61001 ) ) ( not ( = ?auto_60986 ?auto_61001 ) ) ( not ( = ?auto_60999 ?auto_61001 ) ) ( not ( = ?auto_60995 ?auto_61001 ) ) ( not ( = ?auto_61000 ?auto_61001 ) ) ( not ( = ?auto_61006 ?auto_61001 ) ) ( not ( = ?auto_60993 ?auto_61001 ) ) ( not ( = ?auto_60988 ?auto_61001 ) ) ( not ( = ?auto_61005 ?auto_61001 ) ) ( AVAILABLE ?auto_61007 ) ( SURFACE-AT ?auto_60988 ?auto_61008 ) ( ON ?auto_60988 ?auto_61004 ) ( CLEAR ?auto_60988 ) ( not ( = ?auto_60985 ?auto_61004 ) ) ( not ( = ?auto_60986 ?auto_61004 ) ) ( not ( = ?auto_60999 ?auto_61004 ) ) ( not ( = ?auto_60995 ?auto_61004 ) ) ( not ( = ?auto_61000 ?auto_61004 ) ) ( not ( = ?auto_61006 ?auto_61004 ) ) ( not ( = ?auto_60993 ?auto_61004 ) ) ( not ( = ?auto_60988 ?auto_61004 ) ) ( not ( = ?auto_61005 ?auto_61004 ) ) ( not ( = ?auto_61001 ?auto_61004 ) ) ( SURFACE-AT ?auto_60996 ?auto_61003 ) ( CLEAR ?auto_60996 ) ( IS-CRATE ?auto_61001 ) ( not ( = ?auto_60985 ?auto_60996 ) ) ( not ( = ?auto_60986 ?auto_60996 ) ) ( not ( = ?auto_60999 ?auto_60996 ) ) ( not ( = ?auto_60995 ?auto_60996 ) ) ( not ( = ?auto_61000 ?auto_60996 ) ) ( not ( = ?auto_61006 ?auto_60996 ) ) ( not ( = ?auto_60993 ?auto_60996 ) ) ( not ( = ?auto_60988 ?auto_60996 ) ) ( not ( = ?auto_61005 ?auto_60996 ) ) ( not ( = ?auto_61001 ?auto_60996 ) ) ( not ( = ?auto_61004 ?auto_60996 ) ) ( AVAILABLE ?auto_61002 ) ( TRUCK-AT ?auto_60991 ?auto_60990 ) ( not ( = ?auto_60990 ?auto_61003 ) ) ( not ( = ?auto_61008 ?auto_60990 ) ) ( not ( = ?auto_60994 ?auto_60990 ) ) ( not ( = ?auto_60989 ?auto_60990 ) ) ( not ( = ?auto_61009 ?auto_60990 ) ) ( HOIST-AT ?auto_60997 ?auto_60990 ) ( not ( = ?auto_61002 ?auto_60997 ) ) ( not ( = ?auto_61007 ?auto_60997 ) ) ( not ( = ?auto_60992 ?auto_60997 ) ) ( not ( = ?auto_60987 ?auto_60997 ) ) ( not ( = ?auto_60998 ?auto_60997 ) ) ( AVAILABLE ?auto_60997 ) ( SURFACE-AT ?auto_61001 ?auto_60990 ) ( ON ?auto_61001 ?auto_61010 ) ( CLEAR ?auto_61001 ) ( not ( = ?auto_60985 ?auto_61010 ) ) ( not ( = ?auto_60986 ?auto_61010 ) ) ( not ( = ?auto_60999 ?auto_61010 ) ) ( not ( = ?auto_60995 ?auto_61010 ) ) ( not ( = ?auto_61000 ?auto_61010 ) ) ( not ( = ?auto_61006 ?auto_61010 ) ) ( not ( = ?auto_60993 ?auto_61010 ) ) ( not ( = ?auto_60988 ?auto_61010 ) ) ( not ( = ?auto_61005 ?auto_61010 ) ) ( not ( = ?auto_61001 ?auto_61010 ) ) ( not ( = ?auto_61004 ?auto_61010 ) ) ( not ( = ?auto_60996 ?auto_61010 ) ) )
    :subtasks
    ( ( !LIFT ?auto_60997 ?auto_61001 ?auto_61010 ?auto_60990 )
      ( MAKE-ON ?auto_60985 ?auto_60986 )
      ( MAKE-ON-VERIFY ?auto_60985 ?auto_60986 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61011 - SURFACE
      ?auto_61012 - SURFACE
    )
    :vars
    (
      ?auto_61036 - HOIST
      ?auto_61016 - PLACE
      ?auto_61014 - PLACE
      ?auto_61034 - HOIST
      ?auto_61030 - SURFACE
      ?auto_61033 - SURFACE
      ?auto_61021 - PLACE
      ?auto_61032 - HOIST
      ?auto_61015 - SURFACE
      ?auto_61035 - SURFACE
      ?auto_61022 - PLACE
      ?auto_61028 - HOIST
      ?auto_61013 - SURFACE
      ?auto_61020 - SURFACE
      ?auto_61019 - PLACE
      ?auto_61031 - HOIST
      ?auto_61026 - SURFACE
      ?auto_61027 - SURFACE
      ?auto_61025 - SURFACE
      ?auto_61017 - SURFACE
      ?auto_61024 - PLACE
      ?auto_61018 - HOIST
      ?auto_61029 - SURFACE
      ?auto_61023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_61036 ?auto_61016 ) ( IS-CRATE ?auto_61011 ) ( not ( = ?auto_61011 ?auto_61012 ) ) ( not ( = ?auto_61014 ?auto_61016 ) ) ( HOIST-AT ?auto_61034 ?auto_61014 ) ( not ( = ?auto_61036 ?auto_61034 ) ) ( SURFACE-AT ?auto_61011 ?auto_61014 ) ( ON ?auto_61011 ?auto_61030 ) ( CLEAR ?auto_61011 ) ( not ( = ?auto_61011 ?auto_61030 ) ) ( not ( = ?auto_61012 ?auto_61030 ) ) ( IS-CRATE ?auto_61012 ) ( not ( = ?auto_61011 ?auto_61033 ) ) ( not ( = ?auto_61012 ?auto_61033 ) ) ( not ( = ?auto_61030 ?auto_61033 ) ) ( not ( = ?auto_61021 ?auto_61016 ) ) ( not ( = ?auto_61014 ?auto_61021 ) ) ( HOIST-AT ?auto_61032 ?auto_61021 ) ( not ( = ?auto_61036 ?auto_61032 ) ) ( not ( = ?auto_61034 ?auto_61032 ) ) ( AVAILABLE ?auto_61032 ) ( SURFACE-AT ?auto_61012 ?auto_61021 ) ( ON ?auto_61012 ?auto_61015 ) ( CLEAR ?auto_61012 ) ( not ( = ?auto_61011 ?auto_61015 ) ) ( not ( = ?auto_61012 ?auto_61015 ) ) ( not ( = ?auto_61030 ?auto_61015 ) ) ( not ( = ?auto_61033 ?auto_61015 ) ) ( IS-CRATE ?auto_61033 ) ( not ( = ?auto_61011 ?auto_61035 ) ) ( not ( = ?auto_61012 ?auto_61035 ) ) ( not ( = ?auto_61030 ?auto_61035 ) ) ( not ( = ?auto_61033 ?auto_61035 ) ) ( not ( = ?auto_61015 ?auto_61035 ) ) ( not ( = ?auto_61022 ?auto_61016 ) ) ( not ( = ?auto_61014 ?auto_61022 ) ) ( not ( = ?auto_61021 ?auto_61022 ) ) ( HOIST-AT ?auto_61028 ?auto_61022 ) ( not ( = ?auto_61036 ?auto_61028 ) ) ( not ( = ?auto_61034 ?auto_61028 ) ) ( not ( = ?auto_61032 ?auto_61028 ) ) ( AVAILABLE ?auto_61028 ) ( SURFACE-AT ?auto_61033 ?auto_61022 ) ( ON ?auto_61033 ?auto_61013 ) ( CLEAR ?auto_61033 ) ( not ( = ?auto_61011 ?auto_61013 ) ) ( not ( = ?auto_61012 ?auto_61013 ) ) ( not ( = ?auto_61030 ?auto_61013 ) ) ( not ( = ?auto_61033 ?auto_61013 ) ) ( not ( = ?auto_61015 ?auto_61013 ) ) ( not ( = ?auto_61035 ?auto_61013 ) ) ( IS-CRATE ?auto_61035 ) ( not ( = ?auto_61011 ?auto_61020 ) ) ( not ( = ?auto_61012 ?auto_61020 ) ) ( not ( = ?auto_61030 ?auto_61020 ) ) ( not ( = ?auto_61033 ?auto_61020 ) ) ( not ( = ?auto_61015 ?auto_61020 ) ) ( not ( = ?auto_61035 ?auto_61020 ) ) ( not ( = ?auto_61013 ?auto_61020 ) ) ( not ( = ?auto_61019 ?auto_61016 ) ) ( not ( = ?auto_61014 ?auto_61019 ) ) ( not ( = ?auto_61021 ?auto_61019 ) ) ( not ( = ?auto_61022 ?auto_61019 ) ) ( HOIST-AT ?auto_61031 ?auto_61019 ) ( not ( = ?auto_61036 ?auto_61031 ) ) ( not ( = ?auto_61034 ?auto_61031 ) ) ( not ( = ?auto_61032 ?auto_61031 ) ) ( not ( = ?auto_61028 ?auto_61031 ) ) ( AVAILABLE ?auto_61031 ) ( SURFACE-AT ?auto_61035 ?auto_61019 ) ( ON ?auto_61035 ?auto_61026 ) ( CLEAR ?auto_61035 ) ( not ( = ?auto_61011 ?auto_61026 ) ) ( not ( = ?auto_61012 ?auto_61026 ) ) ( not ( = ?auto_61030 ?auto_61026 ) ) ( not ( = ?auto_61033 ?auto_61026 ) ) ( not ( = ?auto_61015 ?auto_61026 ) ) ( not ( = ?auto_61035 ?auto_61026 ) ) ( not ( = ?auto_61013 ?auto_61026 ) ) ( not ( = ?auto_61020 ?auto_61026 ) ) ( IS-CRATE ?auto_61020 ) ( not ( = ?auto_61011 ?auto_61027 ) ) ( not ( = ?auto_61012 ?auto_61027 ) ) ( not ( = ?auto_61030 ?auto_61027 ) ) ( not ( = ?auto_61033 ?auto_61027 ) ) ( not ( = ?auto_61015 ?auto_61027 ) ) ( not ( = ?auto_61035 ?auto_61027 ) ) ( not ( = ?auto_61013 ?auto_61027 ) ) ( not ( = ?auto_61020 ?auto_61027 ) ) ( not ( = ?auto_61026 ?auto_61027 ) ) ( AVAILABLE ?auto_61034 ) ( SURFACE-AT ?auto_61020 ?auto_61014 ) ( ON ?auto_61020 ?auto_61025 ) ( CLEAR ?auto_61020 ) ( not ( = ?auto_61011 ?auto_61025 ) ) ( not ( = ?auto_61012 ?auto_61025 ) ) ( not ( = ?auto_61030 ?auto_61025 ) ) ( not ( = ?auto_61033 ?auto_61025 ) ) ( not ( = ?auto_61015 ?auto_61025 ) ) ( not ( = ?auto_61035 ?auto_61025 ) ) ( not ( = ?auto_61013 ?auto_61025 ) ) ( not ( = ?auto_61020 ?auto_61025 ) ) ( not ( = ?auto_61026 ?auto_61025 ) ) ( not ( = ?auto_61027 ?auto_61025 ) ) ( SURFACE-AT ?auto_61017 ?auto_61016 ) ( CLEAR ?auto_61017 ) ( IS-CRATE ?auto_61027 ) ( not ( = ?auto_61011 ?auto_61017 ) ) ( not ( = ?auto_61012 ?auto_61017 ) ) ( not ( = ?auto_61030 ?auto_61017 ) ) ( not ( = ?auto_61033 ?auto_61017 ) ) ( not ( = ?auto_61015 ?auto_61017 ) ) ( not ( = ?auto_61035 ?auto_61017 ) ) ( not ( = ?auto_61013 ?auto_61017 ) ) ( not ( = ?auto_61020 ?auto_61017 ) ) ( not ( = ?auto_61026 ?auto_61017 ) ) ( not ( = ?auto_61027 ?auto_61017 ) ) ( not ( = ?auto_61025 ?auto_61017 ) ) ( AVAILABLE ?auto_61036 ) ( not ( = ?auto_61024 ?auto_61016 ) ) ( not ( = ?auto_61014 ?auto_61024 ) ) ( not ( = ?auto_61021 ?auto_61024 ) ) ( not ( = ?auto_61022 ?auto_61024 ) ) ( not ( = ?auto_61019 ?auto_61024 ) ) ( HOIST-AT ?auto_61018 ?auto_61024 ) ( not ( = ?auto_61036 ?auto_61018 ) ) ( not ( = ?auto_61034 ?auto_61018 ) ) ( not ( = ?auto_61032 ?auto_61018 ) ) ( not ( = ?auto_61028 ?auto_61018 ) ) ( not ( = ?auto_61031 ?auto_61018 ) ) ( AVAILABLE ?auto_61018 ) ( SURFACE-AT ?auto_61027 ?auto_61024 ) ( ON ?auto_61027 ?auto_61029 ) ( CLEAR ?auto_61027 ) ( not ( = ?auto_61011 ?auto_61029 ) ) ( not ( = ?auto_61012 ?auto_61029 ) ) ( not ( = ?auto_61030 ?auto_61029 ) ) ( not ( = ?auto_61033 ?auto_61029 ) ) ( not ( = ?auto_61015 ?auto_61029 ) ) ( not ( = ?auto_61035 ?auto_61029 ) ) ( not ( = ?auto_61013 ?auto_61029 ) ) ( not ( = ?auto_61020 ?auto_61029 ) ) ( not ( = ?auto_61026 ?auto_61029 ) ) ( not ( = ?auto_61027 ?auto_61029 ) ) ( not ( = ?auto_61025 ?auto_61029 ) ) ( not ( = ?auto_61017 ?auto_61029 ) ) ( TRUCK-AT ?auto_61023 ?auto_61016 ) )
    :subtasks
    ( ( !DRIVE ?auto_61023 ?auto_61016 ?auto_61024 )
      ( MAKE-ON ?auto_61011 ?auto_61012 )
      ( MAKE-ON-VERIFY ?auto_61011 ?auto_61012 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61039 - SURFACE
      ?auto_61040 - SURFACE
    )
    :vars
    (
      ?auto_61041 - HOIST
      ?auto_61042 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61041 ?auto_61042 ) ( SURFACE-AT ?auto_61040 ?auto_61042 ) ( CLEAR ?auto_61040 ) ( LIFTING ?auto_61041 ?auto_61039 ) ( IS-CRATE ?auto_61039 ) ( not ( = ?auto_61039 ?auto_61040 ) ) )
    :subtasks
    ( ( !DROP ?auto_61041 ?auto_61039 ?auto_61040 ?auto_61042 )
      ( MAKE-ON-VERIFY ?auto_61039 ?auto_61040 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61043 - SURFACE
      ?auto_61044 - SURFACE
    )
    :vars
    (
      ?auto_61045 - HOIST
      ?auto_61046 - PLACE
      ?auto_61047 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_61045 ?auto_61046 ) ( SURFACE-AT ?auto_61044 ?auto_61046 ) ( CLEAR ?auto_61044 ) ( IS-CRATE ?auto_61043 ) ( not ( = ?auto_61043 ?auto_61044 ) ) ( TRUCK-AT ?auto_61047 ?auto_61046 ) ( AVAILABLE ?auto_61045 ) ( IN ?auto_61043 ?auto_61047 ) )
    :subtasks
    ( ( !UNLOAD ?auto_61045 ?auto_61043 ?auto_61047 ?auto_61046 )
      ( MAKE-ON ?auto_61043 ?auto_61044 )
      ( MAKE-ON-VERIFY ?auto_61043 ?auto_61044 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61048 - SURFACE
      ?auto_61049 - SURFACE
    )
    :vars
    (
      ?auto_61051 - HOIST
      ?auto_61052 - PLACE
      ?auto_61050 - TRUCK
      ?auto_61053 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61051 ?auto_61052 ) ( SURFACE-AT ?auto_61049 ?auto_61052 ) ( CLEAR ?auto_61049 ) ( IS-CRATE ?auto_61048 ) ( not ( = ?auto_61048 ?auto_61049 ) ) ( AVAILABLE ?auto_61051 ) ( IN ?auto_61048 ?auto_61050 ) ( TRUCK-AT ?auto_61050 ?auto_61053 ) ( not ( = ?auto_61053 ?auto_61052 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_61050 ?auto_61053 ?auto_61052 )
      ( MAKE-ON ?auto_61048 ?auto_61049 )
      ( MAKE-ON-VERIFY ?auto_61048 ?auto_61049 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61054 - SURFACE
      ?auto_61055 - SURFACE
    )
    :vars
    (
      ?auto_61056 - HOIST
      ?auto_61057 - PLACE
      ?auto_61058 - TRUCK
      ?auto_61059 - PLACE
      ?auto_61060 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_61056 ?auto_61057 ) ( SURFACE-AT ?auto_61055 ?auto_61057 ) ( CLEAR ?auto_61055 ) ( IS-CRATE ?auto_61054 ) ( not ( = ?auto_61054 ?auto_61055 ) ) ( AVAILABLE ?auto_61056 ) ( TRUCK-AT ?auto_61058 ?auto_61059 ) ( not ( = ?auto_61059 ?auto_61057 ) ) ( HOIST-AT ?auto_61060 ?auto_61059 ) ( LIFTING ?auto_61060 ?auto_61054 ) ( not ( = ?auto_61056 ?auto_61060 ) ) )
    :subtasks
    ( ( !LOAD ?auto_61060 ?auto_61054 ?auto_61058 ?auto_61059 )
      ( MAKE-ON ?auto_61054 ?auto_61055 )
      ( MAKE-ON-VERIFY ?auto_61054 ?auto_61055 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61061 - SURFACE
      ?auto_61062 - SURFACE
    )
    :vars
    (
      ?auto_61067 - HOIST
      ?auto_61066 - PLACE
      ?auto_61065 - TRUCK
      ?auto_61063 - PLACE
      ?auto_61064 - HOIST
      ?auto_61068 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61067 ?auto_61066 ) ( SURFACE-AT ?auto_61062 ?auto_61066 ) ( CLEAR ?auto_61062 ) ( IS-CRATE ?auto_61061 ) ( not ( = ?auto_61061 ?auto_61062 ) ) ( AVAILABLE ?auto_61067 ) ( TRUCK-AT ?auto_61065 ?auto_61063 ) ( not ( = ?auto_61063 ?auto_61066 ) ) ( HOIST-AT ?auto_61064 ?auto_61063 ) ( not ( = ?auto_61067 ?auto_61064 ) ) ( AVAILABLE ?auto_61064 ) ( SURFACE-AT ?auto_61061 ?auto_61063 ) ( ON ?auto_61061 ?auto_61068 ) ( CLEAR ?auto_61061 ) ( not ( = ?auto_61061 ?auto_61068 ) ) ( not ( = ?auto_61062 ?auto_61068 ) ) )
    :subtasks
    ( ( !LIFT ?auto_61064 ?auto_61061 ?auto_61068 ?auto_61063 )
      ( MAKE-ON ?auto_61061 ?auto_61062 )
      ( MAKE-ON-VERIFY ?auto_61061 ?auto_61062 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61069 - SURFACE
      ?auto_61070 - SURFACE
    )
    :vars
    (
      ?auto_61073 - HOIST
      ?auto_61074 - PLACE
      ?auto_61076 - PLACE
      ?auto_61072 - HOIST
      ?auto_61071 - SURFACE
      ?auto_61075 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_61073 ?auto_61074 ) ( SURFACE-AT ?auto_61070 ?auto_61074 ) ( CLEAR ?auto_61070 ) ( IS-CRATE ?auto_61069 ) ( not ( = ?auto_61069 ?auto_61070 ) ) ( AVAILABLE ?auto_61073 ) ( not ( = ?auto_61076 ?auto_61074 ) ) ( HOIST-AT ?auto_61072 ?auto_61076 ) ( not ( = ?auto_61073 ?auto_61072 ) ) ( AVAILABLE ?auto_61072 ) ( SURFACE-AT ?auto_61069 ?auto_61076 ) ( ON ?auto_61069 ?auto_61071 ) ( CLEAR ?auto_61069 ) ( not ( = ?auto_61069 ?auto_61071 ) ) ( not ( = ?auto_61070 ?auto_61071 ) ) ( TRUCK-AT ?auto_61075 ?auto_61074 ) )
    :subtasks
    ( ( !DRIVE ?auto_61075 ?auto_61074 ?auto_61076 )
      ( MAKE-ON ?auto_61069 ?auto_61070 )
      ( MAKE-ON-VERIFY ?auto_61069 ?auto_61070 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61077 - SURFACE
      ?auto_61078 - SURFACE
    )
    :vars
    (
      ?auto_61083 - HOIST
      ?auto_61084 - PLACE
      ?auto_61079 - PLACE
      ?auto_61082 - HOIST
      ?auto_61080 - SURFACE
      ?auto_61081 - TRUCK
      ?auto_61085 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61083 ?auto_61084 ) ( IS-CRATE ?auto_61077 ) ( not ( = ?auto_61077 ?auto_61078 ) ) ( not ( = ?auto_61079 ?auto_61084 ) ) ( HOIST-AT ?auto_61082 ?auto_61079 ) ( not ( = ?auto_61083 ?auto_61082 ) ) ( AVAILABLE ?auto_61082 ) ( SURFACE-AT ?auto_61077 ?auto_61079 ) ( ON ?auto_61077 ?auto_61080 ) ( CLEAR ?auto_61077 ) ( not ( = ?auto_61077 ?auto_61080 ) ) ( not ( = ?auto_61078 ?auto_61080 ) ) ( TRUCK-AT ?auto_61081 ?auto_61084 ) ( SURFACE-AT ?auto_61085 ?auto_61084 ) ( CLEAR ?auto_61085 ) ( LIFTING ?auto_61083 ?auto_61078 ) ( IS-CRATE ?auto_61078 ) ( not ( = ?auto_61077 ?auto_61085 ) ) ( not ( = ?auto_61078 ?auto_61085 ) ) ( not ( = ?auto_61080 ?auto_61085 ) ) )
    :subtasks
    ( ( !DROP ?auto_61083 ?auto_61078 ?auto_61085 ?auto_61084 )
      ( MAKE-ON ?auto_61077 ?auto_61078 )
      ( MAKE-ON-VERIFY ?auto_61077 ?auto_61078 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61086 - SURFACE
      ?auto_61087 - SURFACE
    )
    :vars
    (
      ?auto_61093 - HOIST
      ?auto_61091 - PLACE
      ?auto_61090 - PLACE
      ?auto_61092 - HOIST
      ?auto_61088 - SURFACE
      ?auto_61089 - TRUCK
      ?auto_61094 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61093 ?auto_61091 ) ( IS-CRATE ?auto_61086 ) ( not ( = ?auto_61086 ?auto_61087 ) ) ( not ( = ?auto_61090 ?auto_61091 ) ) ( HOIST-AT ?auto_61092 ?auto_61090 ) ( not ( = ?auto_61093 ?auto_61092 ) ) ( AVAILABLE ?auto_61092 ) ( SURFACE-AT ?auto_61086 ?auto_61090 ) ( ON ?auto_61086 ?auto_61088 ) ( CLEAR ?auto_61086 ) ( not ( = ?auto_61086 ?auto_61088 ) ) ( not ( = ?auto_61087 ?auto_61088 ) ) ( TRUCK-AT ?auto_61089 ?auto_61091 ) ( SURFACE-AT ?auto_61094 ?auto_61091 ) ( CLEAR ?auto_61094 ) ( IS-CRATE ?auto_61087 ) ( not ( = ?auto_61086 ?auto_61094 ) ) ( not ( = ?auto_61087 ?auto_61094 ) ) ( not ( = ?auto_61088 ?auto_61094 ) ) ( AVAILABLE ?auto_61093 ) ( IN ?auto_61087 ?auto_61089 ) )
    :subtasks
    ( ( !UNLOAD ?auto_61093 ?auto_61087 ?auto_61089 ?auto_61091 )
      ( MAKE-ON ?auto_61086 ?auto_61087 )
      ( MAKE-ON-VERIFY ?auto_61086 ?auto_61087 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61095 - SURFACE
      ?auto_61096 - SURFACE
    )
    :vars
    (
      ?auto_61101 - HOIST
      ?auto_61097 - PLACE
      ?auto_61103 - PLACE
      ?auto_61099 - HOIST
      ?auto_61098 - SURFACE
      ?auto_61100 - SURFACE
      ?auto_61102 - TRUCK
      ?auto_61104 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61101 ?auto_61097 ) ( IS-CRATE ?auto_61095 ) ( not ( = ?auto_61095 ?auto_61096 ) ) ( not ( = ?auto_61103 ?auto_61097 ) ) ( HOIST-AT ?auto_61099 ?auto_61103 ) ( not ( = ?auto_61101 ?auto_61099 ) ) ( AVAILABLE ?auto_61099 ) ( SURFACE-AT ?auto_61095 ?auto_61103 ) ( ON ?auto_61095 ?auto_61098 ) ( CLEAR ?auto_61095 ) ( not ( = ?auto_61095 ?auto_61098 ) ) ( not ( = ?auto_61096 ?auto_61098 ) ) ( SURFACE-AT ?auto_61100 ?auto_61097 ) ( CLEAR ?auto_61100 ) ( IS-CRATE ?auto_61096 ) ( not ( = ?auto_61095 ?auto_61100 ) ) ( not ( = ?auto_61096 ?auto_61100 ) ) ( not ( = ?auto_61098 ?auto_61100 ) ) ( AVAILABLE ?auto_61101 ) ( IN ?auto_61096 ?auto_61102 ) ( TRUCK-AT ?auto_61102 ?auto_61104 ) ( not ( = ?auto_61104 ?auto_61097 ) ) ( not ( = ?auto_61103 ?auto_61104 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_61102 ?auto_61104 ?auto_61097 )
      ( MAKE-ON ?auto_61095 ?auto_61096 )
      ( MAKE-ON-VERIFY ?auto_61095 ?auto_61096 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61105 - SURFACE
      ?auto_61106 - SURFACE
    )
    :vars
    (
      ?auto_61112 - HOIST
      ?auto_61110 - PLACE
      ?auto_61107 - PLACE
      ?auto_61109 - HOIST
      ?auto_61111 - SURFACE
      ?auto_61108 - SURFACE
      ?auto_61113 - TRUCK
      ?auto_61114 - PLACE
      ?auto_61115 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_61112 ?auto_61110 ) ( IS-CRATE ?auto_61105 ) ( not ( = ?auto_61105 ?auto_61106 ) ) ( not ( = ?auto_61107 ?auto_61110 ) ) ( HOIST-AT ?auto_61109 ?auto_61107 ) ( not ( = ?auto_61112 ?auto_61109 ) ) ( AVAILABLE ?auto_61109 ) ( SURFACE-AT ?auto_61105 ?auto_61107 ) ( ON ?auto_61105 ?auto_61111 ) ( CLEAR ?auto_61105 ) ( not ( = ?auto_61105 ?auto_61111 ) ) ( not ( = ?auto_61106 ?auto_61111 ) ) ( SURFACE-AT ?auto_61108 ?auto_61110 ) ( CLEAR ?auto_61108 ) ( IS-CRATE ?auto_61106 ) ( not ( = ?auto_61105 ?auto_61108 ) ) ( not ( = ?auto_61106 ?auto_61108 ) ) ( not ( = ?auto_61111 ?auto_61108 ) ) ( AVAILABLE ?auto_61112 ) ( TRUCK-AT ?auto_61113 ?auto_61114 ) ( not ( = ?auto_61114 ?auto_61110 ) ) ( not ( = ?auto_61107 ?auto_61114 ) ) ( HOIST-AT ?auto_61115 ?auto_61114 ) ( LIFTING ?auto_61115 ?auto_61106 ) ( not ( = ?auto_61112 ?auto_61115 ) ) ( not ( = ?auto_61109 ?auto_61115 ) ) )
    :subtasks
    ( ( !LOAD ?auto_61115 ?auto_61106 ?auto_61113 ?auto_61114 )
      ( MAKE-ON ?auto_61105 ?auto_61106 )
      ( MAKE-ON-VERIFY ?auto_61105 ?auto_61106 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61116 - SURFACE
      ?auto_61117 - SURFACE
    )
    :vars
    (
      ?auto_61118 - HOIST
      ?auto_61125 - PLACE
      ?auto_61121 - PLACE
      ?auto_61126 - HOIST
      ?auto_61122 - SURFACE
      ?auto_61123 - SURFACE
      ?auto_61124 - TRUCK
      ?auto_61120 - PLACE
      ?auto_61119 - HOIST
      ?auto_61127 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61118 ?auto_61125 ) ( IS-CRATE ?auto_61116 ) ( not ( = ?auto_61116 ?auto_61117 ) ) ( not ( = ?auto_61121 ?auto_61125 ) ) ( HOIST-AT ?auto_61126 ?auto_61121 ) ( not ( = ?auto_61118 ?auto_61126 ) ) ( AVAILABLE ?auto_61126 ) ( SURFACE-AT ?auto_61116 ?auto_61121 ) ( ON ?auto_61116 ?auto_61122 ) ( CLEAR ?auto_61116 ) ( not ( = ?auto_61116 ?auto_61122 ) ) ( not ( = ?auto_61117 ?auto_61122 ) ) ( SURFACE-AT ?auto_61123 ?auto_61125 ) ( CLEAR ?auto_61123 ) ( IS-CRATE ?auto_61117 ) ( not ( = ?auto_61116 ?auto_61123 ) ) ( not ( = ?auto_61117 ?auto_61123 ) ) ( not ( = ?auto_61122 ?auto_61123 ) ) ( AVAILABLE ?auto_61118 ) ( TRUCK-AT ?auto_61124 ?auto_61120 ) ( not ( = ?auto_61120 ?auto_61125 ) ) ( not ( = ?auto_61121 ?auto_61120 ) ) ( HOIST-AT ?auto_61119 ?auto_61120 ) ( not ( = ?auto_61118 ?auto_61119 ) ) ( not ( = ?auto_61126 ?auto_61119 ) ) ( AVAILABLE ?auto_61119 ) ( SURFACE-AT ?auto_61117 ?auto_61120 ) ( ON ?auto_61117 ?auto_61127 ) ( CLEAR ?auto_61117 ) ( not ( = ?auto_61116 ?auto_61127 ) ) ( not ( = ?auto_61117 ?auto_61127 ) ) ( not ( = ?auto_61122 ?auto_61127 ) ) ( not ( = ?auto_61123 ?auto_61127 ) ) )
    :subtasks
    ( ( !LIFT ?auto_61119 ?auto_61117 ?auto_61127 ?auto_61120 )
      ( MAKE-ON ?auto_61116 ?auto_61117 )
      ( MAKE-ON-VERIFY ?auto_61116 ?auto_61117 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61128 - SURFACE
      ?auto_61129 - SURFACE
    )
    :vars
    (
      ?auto_61134 - HOIST
      ?auto_61137 - PLACE
      ?auto_61131 - PLACE
      ?auto_61139 - HOIST
      ?auto_61138 - SURFACE
      ?auto_61136 - SURFACE
      ?auto_61135 - PLACE
      ?auto_61130 - HOIST
      ?auto_61133 - SURFACE
      ?auto_61132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_61134 ?auto_61137 ) ( IS-CRATE ?auto_61128 ) ( not ( = ?auto_61128 ?auto_61129 ) ) ( not ( = ?auto_61131 ?auto_61137 ) ) ( HOIST-AT ?auto_61139 ?auto_61131 ) ( not ( = ?auto_61134 ?auto_61139 ) ) ( AVAILABLE ?auto_61139 ) ( SURFACE-AT ?auto_61128 ?auto_61131 ) ( ON ?auto_61128 ?auto_61138 ) ( CLEAR ?auto_61128 ) ( not ( = ?auto_61128 ?auto_61138 ) ) ( not ( = ?auto_61129 ?auto_61138 ) ) ( SURFACE-AT ?auto_61136 ?auto_61137 ) ( CLEAR ?auto_61136 ) ( IS-CRATE ?auto_61129 ) ( not ( = ?auto_61128 ?auto_61136 ) ) ( not ( = ?auto_61129 ?auto_61136 ) ) ( not ( = ?auto_61138 ?auto_61136 ) ) ( AVAILABLE ?auto_61134 ) ( not ( = ?auto_61135 ?auto_61137 ) ) ( not ( = ?auto_61131 ?auto_61135 ) ) ( HOIST-AT ?auto_61130 ?auto_61135 ) ( not ( = ?auto_61134 ?auto_61130 ) ) ( not ( = ?auto_61139 ?auto_61130 ) ) ( AVAILABLE ?auto_61130 ) ( SURFACE-AT ?auto_61129 ?auto_61135 ) ( ON ?auto_61129 ?auto_61133 ) ( CLEAR ?auto_61129 ) ( not ( = ?auto_61128 ?auto_61133 ) ) ( not ( = ?auto_61129 ?auto_61133 ) ) ( not ( = ?auto_61138 ?auto_61133 ) ) ( not ( = ?auto_61136 ?auto_61133 ) ) ( TRUCK-AT ?auto_61132 ?auto_61137 ) )
    :subtasks
    ( ( !DRIVE ?auto_61132 ?auto_61137 ?auto_61135 )
      ( MAKE-ON ?auto_61128 ?auto_61129 )
      ( MAKE-ON-VERIFY ?auto_61128 ?auto_61129 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61140 - SURFACE
      ?auto_61141 - SURFACE
    )
    :vars
    (
      ?auto_61149 - HOIST
      ?auto_61142 - PLACE
      ?auto_61146 - PLACE
      ?auto_61143 - HOIST
      ?auto_61147 - SURFACE
      ?auto_61144 - SURFACE
      ?auto_61145 - PLACE
      ?auto_61151 - HOIST
      ?auto_61148 - SURFACE
      ?auto_61150 - TRUCK
      ?auto_61152 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61149 ?auto_61142 ) ( IS-CRATE ?auto_61140 ) ( not ( = ?auto_61140 ?auto_61141 ) ) ( not ( = ?auto_61146 ?auto_61142 ) ) ( HOIST-AT ?auto_61143 ?auto_61146 ) ( not ( = ?auto_61149 ?auto_61143 ) ) ( AVAILABLE ?auto_61143 ) ( SURFACE-AT ?auto_61140 ?auto_61146 ) ( ON ?auto_61140 ?auto_61147 ) ( CLEAR ?auto_61140 ) ( not ( = ?auto_61140 ?auto_61147 ) ) ( not ( = ?auto_61141 ?auto_61147 ) ) ( IS-CRATE ?auto_61141 ) ( not ( = ?auto_61140 ?auto_61144 ) ) ( not ( = ?auto_61141 ?auto_61144 ) ) ( not ( = ?auto_61147 ?auto_61144 ) ) ( not ( = ?auto_61145 ?auto_61142 ) ) ( not ( = ?auto_61146 ?auto_61145 ) ) ( HOIST-AT ?auto_61151 ?auto_61145 ) ( not ( = ?auto_61149 ?auto_61151 ) ) ( not ( = ?auto_61143 ?auto_61151 ) ) ( AVAILABLE ?auto_61151 ) ( SURFACE-AT ?auto_61141 ?auto_61145 ) ( ON ?auto_61141 ?auto_61148 ) ( CLEAR ?auto_61141 ) ( not ( = ?auto_61140 ?auto_61148 ) ) ( not ( = ?auto_61141 ?auto_61148 ) ) ( not ( = ?auto_61147 ?auto_61148 ) ) ( not ( = ?auto_61144 ?auto_61148 ) ) ( TRUCK-AT ?auto_61150 ?auto_61142 ) ( SURFACE-AT ?auto_61152 ?auto_61142 ) ( CLEAR ?auto_61152 ) ( LIFTING ?auto_61149 ?auto_61144 ) ( IS-CRATE ?auto_61144 ) ( not ( = ?auto_61140 ?auto_61152 ) ) ( not ( = ?auto_61141 ?auto_61152 ) ) ( not ( = ?auto_61147 ?auto_61152 ) ) ( not ( = ?auto_61144 ?auto_61152 ) ) ( not ( = ?auto_61148 ?auto_61152 ) ) )
    :subtasks
    ( ( !DROP ?auto_61149 ?auto_61144 ?auto_61152 ?auto_61142 )
      ( MAKE-ON ?auto_61140 ?auto_61141 )
      ( MAKE-ON-VERIFY ?auto_61140 ?auto_61141 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61153 - SURFACE
      ?auto_61154 - SURFACE
    )
    :vars
    (
      ?auto_61161 - HOIST
      ?auto_61164 - PLACE
      ?auto_61158 - PLACE
      ?auto_61156 - HOIST
      ?auto_61165 - SURFACE
      ?auto_61155 - SURFACE
      ?auto_61157 - PLACE
      ?auto_61162 - HOIST
      ?auto_61163 - SURFACE
      ?auto_61159 - TRUCK
      ?auto_61160 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61161 ?auto_61164 ) ( IS-CRATE ?auto_61153 ) ( not ( = ?auto_61153 ?auto_61154 ) ) ( not ( = ?auto_61158 ?auto_61164 ) ) ( HOIST-AT ?auto_61156 ?auto_61158 ) ( not ( = ?auto_61161 ?auto_61156 ) ) ( AVAILABLE ?auto_61156 ) ( SURFACE-AT ?auto_61153 ?auto_61158 ) ( ON ?auto_61153 ?auto_61165 ) ( CLEAR ?auto_61153 ) ( not ( = ?auto_61153 ?auto_61165 ) ) ( not ( = ?auto_61154 ?auto_61165 ) ) ( IS-CRATE ?auto_61154 ) ( not ( = ?auto_61153 ?auto_61155 ) ) ( not ( = ?auto_61154 ?auto_61155 ) ) ( not ( = ?auto_61165 ?auto_61155 ) ) ( not ( = ?auto_61157 ?auto_61164 ) ) ( not ( = ?auto_61158 ?auto_61157 ) ) ( HOIST-AT ?auto_61162 ?auto_61157 ) ( not ( = ?auto_61161 ?auto_61162 ) ) ( not ( = ?auto_61156 ?auto_61162 ) ) ( AVAILABLE ?auto_61162 ) ( SURFACE-AT ?auto_61154 ?auto_61157 ) ( ON ?auto_61154 ?auto_61163 ) ( CLEAR ?auto_61154 ) ( not ( = ?auto_61153 ?auto_61163 ) ) ( not ( = ?auto_61154 ?auto_61163 ) ) ( not ( = ?auto_61165 ?auto_61163 ) ) ( not ( = ?auto_61155 ?auto_61163 ) ) ( TRUCK-AT ?auto_61159 ?auto_61164 ) ( SURFACE-AT ?auto_61160 ?auto_61164 ) ( CLEAR ?auto_61160 ) ( IS-CRATE ?auto_61155 ) ( not ( = ?auto_61153 ?auto_61160 ) ) ( not ( = ?auto_61154 ?auto_61160 ) ) ( not ( = ?auto_61165 ?auto_61160 ) ) ( not ( = ?auto_61155 ?auto_61160 ) ) ( not ( = ?auto_61163 ?auto_61160 ) ) ( AVAILABLE ?auto_61161 ) ( IN ?auto_61155 ?auto_61159 ) )
    :subtasks
    ( ( !UNLOAD ?auto_61161 ?auto_61155 ?auto_61159 ?auto_61164 )
      ( MAKE-ON ?auto_61153 ?auto_61154 )
      ( MAKE-ON-VERIFY ?auto_61153 ?auto_61154 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61166 - SURFACE
      ?auto_61167 - SURFACE
    )
    :vars
    (
      ?auto_61174 - HOIST
      ?auto_61171 - PLACE
      ?auto_61178 - PLACE
      ?auto_61169 - HOIST
      ?auto_61177 - SURFACE
      ?auto_61168 - SURFACE
      ?auto_61173 - PLACE
      ?auto_61170 - HOIST
      ?auto_61172 - SURFACE
      ?auto_61176 - SURFACE
      ?auto_61175 - TRUCK
      ?auto_61179 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61174 ?auto_61171 ) ( IS-CRATE ?auto_61166 ) ( not ( = ?auto_61166 ?auto_61167 ) ) ( not ( = ?auto_61178 ?auto_61171 ) ) ( HOIST-AT ?auto_61169 ?auto_61178 ) ( not ( = ?auto_61174 ?auto_61169 ) ) ( AVAILABLE ?auto_61169 ) ( SURFACE-AT ?auto_61166 ?auto_61178 ) ( ON ?auto_61166 ?auto_61177 ) ( CLEAR ?auto_61166 ) ( not ( = ?auto_61166 ?auto_61177 ) ) ( not ( = ?auto_61167 ?auto_61177 ) ) ( IS-CRATE ?auto_61167 ) ( not ( = ?auto_61166 ?auto_61168 ) ) ( not ( = ?auto_61167 ?auto_61168 ) ) ( not ( = ?auto_61177 ?auto_61168 ) ) ( not ( = ?auto_61173 ?auto_61171 ) ) ( not ( = ?auto_61178 ?auto_61173 ) ) ( HOIST-AT ?auto_61170 ?auto_61173 ) ( not ( = ?auto_61174 ?auto_61170 ) ) ( not ( = ?auto_61169 ?auto_61170 ) ) ( AVAILABLE ?auto_61170 ) ( SURFACE-AT ?auto_61167 ?auto_61173 ) ( ON ?auto_61167 ?auto_61172 ) ( CLEAR ?auto_61167 ) ( not ( = ?auto_61166 ?auto_61172 ) ) ( not ( = ?auto_61167 ?auto_61172 ) ) ( not ( = ?auto_61177 ?auto_61172 ) ) ( not ( = ?auto_61168 ?auto_61172 ) ) ( SURFACE-AT ?auto_61176 ?auto_61171 ) ( CLEAR ?auto_61176 ) ( IS-CRATE ?auto_61168 ) ( not ( = ?auto_61166 ?auto_61176 ) ) ( not ( = ?auto_61167 ?auto_61176 ) ) ( not ( = ?auto_61177 ?auto_61176 ) ) ( not ( = ?auto_61168 ?auto_61176 ) ) ( not ( = ?auto_61172 ?auto_61176 ) ) ( AVAILABLE ?auto_61174 ) ( IN ?auto_61168 ?auto_61175 ) ( TRUCK-AT ?auto_61175 ?auto_61179 ) ( not ( = ?auto_61179 ?auto_61171 ) ) ( not ( = ?auto_61178 ?auto_61179 ) ) ( not ( = ?auto_61173 ?auto_61179 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_61175 ?auto_61179 ?auto_61171 )
      ( MAKE-ON ?auto_61166 ?auto_61167 )
      ( MAKE-ON-VERIFY ?auto_61166 ?auto_61167 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61180 - SURFACE
      ?auto_61181 - SURFACE
    )
    :vars
    (
      ?auto_61188 - HOIST
      ?auto_61191 - PLACE
      ?auto_61193 - PLACE
      ?auto_61192 - HOIST
      ?auto_61184 - SURFACE
      ?auto_61187 - SURFACE
      ?auto_61182 - PLACE
      ?auto_61185 - HOIST
      ?auto_61190 - SURFACE
      ?auto_61189 - SURFACE
      ?auto_61183 - TRUCK
      ?auto_61186 - PLACE
      ?auto_61194 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_61188 ?auto_61191 ) ( IS-CRATE ?auto_61180 ) ( not ( = ?auto_61180 ?auto_61181 ) ) ( not ( = ?auto_61193 ?auto_61191 ) ) ( HOIST-AT ?auto_61192 ?auto_61193 ) ( not ( = ?auto_61188 ?auto_61192 ) ) ( AVAILABLE ?auto_61192 ) ( SURFACE-AT ?auto_61180 ?auto_61193 ) ( ON ?auto_61180 ?auto_61184 ) ( CLEAR ?auto_61180 ) ( not ( = ?auto_61180 ?auto_61184 ) ) ( not ( = ?auto_61181 ?auto_61184 ) ) ( IS-CRATE ?auto_61181 ) ( not ( = ?auto_61180 ?auto_61187 ) ) ( not ( = ?auto_61181 ?auto_61187 ) ) ( not ( = ?auto_61184 ?auto_61187 ) ) ( not ( = ?auto_61182 ?auto_61191 ) ) ( not ( = ?auto_61193 ?auto_61182 ) ) ( HOIST-AT ?auto_61185 ?auto_61182 ) ( not ( = ?auto_61188 ?auto_61185 ) ) ( not ( = ?auto_61192 ?auto_61185 ) ) ( AVAILABLE ?auto_61185 ) ( SURFACE-AT ?auto_61181 ?auto_61182 ) ( ON ?auto_61181 ?auto_61190 ) ( CLEAR ?auto_61181 ) ( not ( = ?auto_61180 ?auto_61190 ) ) ( not ( = ?auto_61181 ?auto_61190 ) ) ( not ( = ?auto_61184 ?auto_61190 ) ) ( not ( = ?auto_61187 ?auto_61190 ) ) ( SURFACE-AT ?auto_61189 ?auto_61191 ) ( CLEAR ?auto_61189 ) ( IS-CRATE ?auto_61187 ) ( not ( = ?auto_61180 ?auto_61189 ) ) ( not ( = ?auto_61181 ?auto_61189 ) ) ( not ( = ?auto_61184 ?auto_61189 ) ) ( not ( = ?auto_61187 ?auto_61189 ) ) ( not ( = ?auto_61190 ?auto_61189 ) ) ( AVAILABLE ?auto_61188 ) ( TRUCK-AT ?auto_61183 ?auto_61186 ) ( not ( = ?auto_61186 ?auto_61191 ) ) ( not ( = ?auto_61193 ?auto_61186 ) ) ( not ( = ?auto_61182 ?auto_61186 ) ) ( HOIST-AT ?auto_61194 ?auto_61186 ) ( LIFTING ?auto_61194 ?auto_61187 ) ( not ( = ?auto_61188 ?auto_61194 ) ) ( not ( = ?auto_61192 ?auto_61194 ) ) ( not ( = ?auto_61185 ?auto_61194 ) ) )
    :subtasks
    ( ( !LOAD ?auto_61194 ?auto_61187 ?auto_61183 ?auto_61186 )
      ( MAKE-ON ?auto_61180 ?auto_61181 )
      ( MAKE-ON-VERIFY ?auto_61180 ?auto_61181 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61195 - SURFACE
      ?auto_61196 - SURFACE
    )
    :vars
    (
      ?auto_61209 - HOIST
      ?auto_61199 - PLACE
      ?auto_61205 - PLACE
      ?auto_61202 - HOIST
      ?auto_61207 - SURFACE
      ?auto_61206 - SURFACE
      ?auto_61198 - PLACE
      ?auto_61203 - HOIST
      ?auto_61201 - SURFACE
      ?auto_61200 - SURFACE
      ?auto_61197 - TRUCK
      ?auto_61204 - PLACE
      ?auto_61208 - HOIST
      ?auto_61210 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61209 ?auto_61199 ) ( IS-CRATE ?auto_61195 ) ( not ( = ?auto_61195 ?auto_61196 ) ) ( not ( = ?auto_61205 ?auto_61199 ) ) ( HOIST-AT ?auto_61202 ?auto_61205 ) ( not ( = ?auto_61209 ?auto_61202 ) ) ( AVAILABLE ?auto_61202 ) ( SURFACE-AT ?auto_61195 ?auto_61205 ) ( ON ?auto_61195 ?auto_61207 ) ( CLEAR ?auto_61195 ) ( not ( = ?auto_61195 ?auto_61207 ) ) ( not ( = ?auto_61196 ?auto_61207 ) ) ( IS-CRATE ?auto_61196 ) ( not ( = ?auto_61195 ?auto_61206 ) ) ( not ( = ?auto_61196 ?auto_61206 ) ) ( not ( = ?auto_61207 ?auto_61206 ) ) ( not ( = ?auto_61198 ?auto_61199 ) ) ( not ( = ?auto_61205 ?auto_61198 ) ) ( HOIST-AT ?auto_61203 ?auto_61198 ) ( not ( = ?auto_61209 ?auto_61203 ) ) ( not ( = ?auto_61202 ?auto_61203 ) ) ( AVAILABLE ?auto_61203 ) ( SURFACE-AT ?auto_61196 ?auto_61198 ) ( ON ?auto_61196 ?auto_61201 ) ( CLEAR ?auto_61196 ) ( not ( = ?auto_61195 ?auto_61201 ) ) ( not ( = ?auto_61196 ?auto_61201 ) ) ( not ( = ?auto_61207 ?auto_61201 ) ) ( not ( = ?auto_61206 ?auto_61201 ) ) ( SURFACE-AT ?auto_61200 ?auto_61199 ) ( CLEAR ?auto_61200 ) ( IS-CRATE ?auto_61206 ) ( not ( = ?auto_61195 ?auto_61200 ) ) ( not ( = ?auto_61196 ?auto_61200 ) ) ( not ( = ?auto_61207 ?auto_61200 ) ) ( not ( = ?auto_61206 ?auto_61200 ) ) ( not ( = ?auto_61201 ?auto_61200 ) ) ( AVAILABLE ?auto_61209 ) ( TRUCK-AT ?auto_61197 ?auto_61204 ) ( not ( = ?auto_61204 ?auto_61199 ) ) ( not ( = ?auto_61205 ?auto_61204 ) ) ( not ( = ?auto_61198 ?auto_61204 ) ) ( HOIST-AT ?auto_61208 ?auto_61204 ) ( not ( = ?auto_61209 ?auto_61208 ) ) ( not ( = ?auto_61202 ?auto_61208 ) ) ( not ( = ?auto_61203 ?auto_61208 ) ) ( AVAILABLE ?auto_61208 ) ( SURFACE-AT ?auto_61206 ?auto_61204 ) ( ON ?auto_61206 ?auto_61210 ) ( CLEAR ?auto_61206 ) ( not ( = ?auto_61195 ?auto_61210 ) ) ( not ( = ?auto_61196 ?auto_61210 ) ) ( not ( = ?auto_61207 ?auto_61210 ) ) ( not ( = ?auto_61206 ?auto_61210 ) ) ( not ( = ?auto_61201 ?auto_61210 ) ) ( not ( = ?auto_61200 ?auto_61210 ) ) )
    :subtasks
    ( ( !LIFT ?auto_61208 ?auto_61206 ?auto_61210 ?auto_61204 )
      ( MAKE-ON ?auto_61195 ?auto_61196 )
      ( MAKE-ON-VERIFY ?auto_61195 ?auto_61196 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61211 - SURFACE
      ?auto_61212 - SURFACE
    )
    :vars
    (
      ?auto_61225 - HOIST
      ?auto_61224 - PLACE
      ?auto_61219 - PLACE
      ?auto_61214 - HOIST
      ?auto_61221 - SURFACE
      ?auto_61223 - SURFACE
      ?auto_61213 - PLACE
      ?auto_61226 - HOIST
      ?auto_61216 - SURFACE
      ?auto_61222 - SURFACE
      ?auto_61220 - PLACE
      ?auto_61215 - HOIST
      ?auto_61217 - SURFACE
      ?auto_61218 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_61225 ?auto_61224 ) ( IS-CRATE ?auto_61211 ) ( not ( = ?auto_61211 ?auto_61212 ) ) ( not ( = ?auto_61219 ?auto_61224 ) ) ( HOIST-AT ?auto_61214 ?auto_61219 ) ( not ( = ?auto_61225 ?auto_61214 ) ) ( AVAILABLE ?auto_61214 ) ( SURFACE-AT ?auto_61211 ?auto_61219 ) ( ON ?auto_61211 ?auto_61221 ) ( CLEAR ?auto_61211 ) ( not ( = ?auto_61211 ?auto_61221 ) ) ( not ( = ?auto_61212 ?auto_61221 ) ) ( IS-CRATE ?auto_61212 ) ( not ( = ?auto_61211 ?auto_61223 ) ) ( not ( = ?auto_61212 ?auto_61223 ) ) ( not ( = ?auto_61221 ?auto_61223 ) ) ( not ( = ?auto_61213 ?auto_61224 ) ) ( not ( = ?auto_61219 ?auto_61213 ) ) ( HOIST-AT ?auto_61226 ?auto_61213 ) ( not ( = ?auto_61225 ?auto_61226 ) ) ( not ( = ?auto_61214 ?auto_61226 ) ) ( AVAILABLE ?auto_61226 ) ( SURFACE-AT ?auto_61212 ?auto_61213 ) ( ON ?auto_61212 ?auto_61216 ) ( CLEAR ?auto_61212 ) ( not ( = ?auto_61211 ?auto_61216 ) ) ( not ( = ?auto_61212 ?auto_61216 ) ) ( not ( = ?auto_61221 ?auto_61216 ) ) ( not ( = ?auto_61223 ?auto_61216 ) ) ( SURFACE-AT ?auto_61222 ?auto_61224 ) ( CLEAR ?auto_61222 ) ( IS-CRATE ?auto_61223 ) ( not ( = ?auto_61211 ?auto_61222 ) ) ( not ( = ?auto_61212 ?auto_61222 ) ) ( not ( = ?auto_61221 ?auto_61222 ) ) ( not ( = ?auto_61223 ?auto_61222 ) ) ( not ( = ?auto_61216 ?auto_61222 ) ) ( AVAILABLE ?auto_61225 ) ( not ( = ?auto_61220 ?auto_61224 ) ) ( not ( = ?auto_61219 ?auto_61220 ) ) ( not ( = ?auto_61213 ?auto_61220 ) ) ( HOIST-AT ?auto_61215 ?auto_61220 ) ( not ( = ?auto_61225 ?auto_61215 ) ) ( not ( = ?auto_61214 ?auto_61215 ) ) ( not ( = ?auto_61226 ?auto_61215 ) ) ( AVAILABLE ?auto_61215 ) ( SURFACE-AT ?auto_61223 ?auto_61220 ) ( ON ?auto_61223 ?auto_61217 ) ( CLEAR ?auto_61223 ) ( not ( = ?auto_61211 ?auto_61217 ) ) ( not ( = ?auto_61212 ?auto_61217 ) ) ( not ( = ?auto_61221 ?auto_61217 ) ) ( not ( = ?auto_61223 ?auto_61217 ) ) ( not ( = ?auto_61216 ?auto_61217 ) ) ( not ( = ?auto_61222 ?auto_61217 ) ) ( TRUCK-AT ?auto_61218 ?auto_61224 ) )
    :subtasks
    ( ( !DRIVE ?auto_61218 ?auto_61224 ?auto_61220 )
      ( MAKE-ON ?auto_61211 ?auto_61212 )
      ( MAKE-ON-VERIFY ?auto_61211 ?auto_61212 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61227 - SURFACE
      ?auto_61228 - SURFACE
    )
    :vars
    (
      ?auto_61235 - HOIST
      ?auto_61230 - PLACE
      ?auto_61240 - PLACE
      ?auto_61229 - HOIST
      ?auto_61233 - SURFACE
      ?auto_61241 - SURFACE
      ?auto_61234 - PLACE
      ?auto_61231 - HOIST
      ?auto_61232 - SURFACE
      ?auto_61242 - SURFACE
      ?auto_61238 - PLACE
      ?auto_61237 - HOIST
      ?auto_61236 - SURFACE
      ?auto_61239 - TRUCK
      ?auto_61243 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61235 ?auto_61230 ) ( IS-CRATE ?auto_61227 ) ( not ( = ?auto_61227 ?auto_61228 ) ) ( not ( = ?auto_61240 ?auto_61230 ) ) ( HOIST-AT ?auto_61229 ?auto_61240 ) ( not ( = ?auto_61235 ?auto_61229 ) ) ( AVAILABLE ?auto_61229 ) ( SURFACE-AT ?auto_61227 ?auto_61240 ) ( ON ?auto_61227 ?auto_61233 ) ( CLEAR ?auto_61227 ) ( not ( = ?auto_61227 ?auto_61233 ) ) ( not ( = ?auto_61228 ?auto_61233 ) ) ( IS-CRATE ?auto_61228 ) ( not ( = ?auto_61227 ?auto_61241 ) ) ( not ( = ?auto_61228 ?auto_61241 ) ) ( not ( = ?auto_61233 ?auto_61241 ) ) ( not ( = ?auto_61234 ?auto_61230 ) ) ( not ( = ?auto_61240 ?auto_61234 ) ) ( HOIST-AT ?auto_61231 ?auto_61234 ) ( not ( = ?auto_61235 ?auto_61231 ) ) ( not ( = ?auto_61229 ?auto_61231 ) ) ( AVAILABLE ?auto_61231 ) ( SURFACE-AT ?auto_61228 ?auto_61234 ) ( ON ?auto_61228 ?auto_61232 ) ( CLEAR ?auto_61228 ) ( not ( = ?auto_61227 ?auto_61232 ) ) ( not ( = ?auto_61228 ?auto_61232 ) ) ( not ( = ?auto_61233 ?auto_61232 ) ) ( not ( = ?auto_61241 ?auto_61232 ) ) ( IS-CRATE ?auto_61241 ) ( not ( = ?auto_61227 ?auto_61242 ) ) ( not ( = ?auto_61228 ?auto_61242 ) ) ( not ( = ?auto_61233 ?auto_61242 ) ) ( not ( = ?auto_61241 ?auto_61242 ) ) ( not ( = ?auto_61232 ?auto_61242 ) ) ( not ( = ?auto_61238 ?auto_61230 ) ) ( not ( = ?auto_61240 ?auto_61238 ) ) ( not ( = ?auto_61234 ?auto_61238 ) ) ( HOIST-AT ?auto_61237 ?auto_61238 ) ( not ( = ?auto_61235 ?auto_61237 ) ) ( not ( = ?auto_61229 ?auto_61237 ) ) ( not ( = ?auto_61231 ?auto_61237 ) ) ( AVAILABLE ?auto_61237 ) ( SURFACE-AT ?auto_61241 ?auto_61238 ) ( ON ?auto_61241 ?auto_61236 ) ( CLEAR ?auto_61241 ) ( not ( = ?auto_61227 ?auto_61236 ) ) ( not ( = ?auto_61228 ?auto_61236 ) ) ( not ( = ?auto_61233 ?auto_61236 ) ) ( not ( = ?auto_61241 ?auto_61236 ) ) ( not ( = ?auto_61232 ?auto_61236 ) ) ( not ( = ?auto_61242 ?auto_61236 ) ) ( TRUCK-AT ?auto_61239 ?auto_61230 ) ( SURFACE-AT ?auto_61243 ?auto_61230 ) ( CLEAR ?auto_61243 ) ( LIFTING ?auto_61235 ?auto_61242 ) ( IS-CRATE ?auto_61242 ) ( not ( = ?auto_61227 ?auto_61243 ) ) ( not ( = ?auto_61228 ?auto_61243 ) ) ( not ( = ?auto_61233 ?auto_61243 ) ) ( not ( = ?auto_61241 ?auto_61243 ) ) ( not ( = ?auto_61232 ?auto_61243 ) ) ( not ( = ?auto_61242 ?auto_61243 ) ) ( not ( = ?auto_61236 ?auto_61243 ) ) )
    :subtasks
    ( ( !DROP ?auto_61235 ?auto_61242 ?auto_61243 ?auto_61230 )
      ( MAKE-ON ?auto_61227 ?auto_61228 )
      ( MAKE-ON-VERIFY ?auto_61227 ?auto_61228 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61244 - SURFACE
      ?auto_61245 - SURFACE
    )
    :vars
    (
      ?auto_61248 - HOIST
      ?auto_61247 - PLACE
      ?auto_61251 - PLACE
      ?auto_61258 - HOIST
      ?auto_61260 - SURFACE
      ?auto_61250 - SURFACE
      ?auto_61256 - PLACE
      ?auto_61257 - HOIST
      ?auto_61253 - SURFACE
      ?auto_61246 - SURFACE
      ?auto_61259 - PLACE
      ?auto_61254 - HOIST
      ?auto_61255 - SURFACE
      ?auto_61252 - TRUCK
      ?auto_61249 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61248 ?auto_61247 ) ( IS-CRATE ?auto_61244 ) ( not ( = ?auto_61244 ?auto_61245 ) ) ( not ( = ?auto_61251 ?auto_61247 ) ) ( HOIST-AT ?auto_61258 ?auto_61251 ) ( not ( = ?auto_61248 ?auto_61258 ) ) ( AVAILABLE ?auto_61258 ) ( SURFACE-AT ?auto_61244 ?auto_61251 ) ( ON ?auto_61244 ?auto_61260 ) ( CLEAR ?auto_61244 ) ( not ( = ?auto_61244 ?auto_61260 ) ) ( not ( = ?auto_61245 ?auto_61260 ) ) ( IS-CRATE ?auto_61245 ) ( not ( = ?auto_61244 ?auto_61250 ) ) ( not ( = ?auto_61245 ?auto_61250 ) ) ( not ( = ?auto_61260 ?auto_61250 ) ) ( not ( = ?auto_61256 ?auto_61247 ) ) ( not ( = ?auto_61251 ?auto_61256 ) ) ( HOIST-AT ?auto_61257 ?auto_61256 ) ( not ( = ?auto_61248 ?auto_61257 ) ) ( not ( = ?auto_61258 ?auto_61257 ) ) ( AVAILABLE ?auto_61257 ) ( SURFACE-AT ?auto_61245 ?auto_61256 ) ( ON ?auto_61245 ?auto_61253 ) ( CLEAR ?auto_61245 ) ( not ( = ?auto_61244 ?auto_61253 ) ) ( not ( = ?auto_61245 ?auto_61253 ) ) ( not ( = ?auto_61260 ?auto_61253 ) ) ( not ( = ?auto_61250 ?auto_61253 ) ) ( IS-CRATE ?auto_61250 ) ( not ( = ?auto_61244 ?auto_61246 ) ) ( not ( = ?auto_61245 ?auto_61246 ) ) ( not ( = ?auto_61260 ?auto_61246 ) ) ( not ( = ?auto_61250 ?auto_61246 ) ) ( not ( = ?auto_61253 ?auto_61246 ) ) ( not ( = ?auto_61259 ?auto_61247 ) ) ( not ( = ?auto_61251 ?auto_61259 ) ) ( not ( = ?auto_61256 ?auto_61259 ) ) ( HOIST-AT ?auto_61254 ?auto_61259 ) ( not ( = ?auto_61248 ?auto_61254 ) ) ( not ( = ?auto_61258 ?auto_61254 ) ) ( not ( = ?auto_61257 ?auto_61254 ) ) ( AVAILABLE ?auto_61254 ) ( SURFACE-AT ?auto_61250 ?auto_61259 ) ( ON ?auto_61250 ?auto_61255 ) ( CLEAR ?auto_61250 ) ( not ( = ?auto_61244 ?auto_61255 ) ) ( not ( = ?auto_61245 ?auto_61255 ) ) ( not ( = ?auto_61260 ?auto_61255 ) ) ( not ( = ?auto_61250 ?auto_61255 ) ) ( not ( = ?auto_61253 ?auto_61255 ) ) ( not ( = ?auto_61246 ?auto_61255 ) ) ( TRUCK-AT ?auto_61252 ?auto_61247 ) ( SURFACE-AT ?auto_61249 ?auto_61247 ) ( CLEAR ?auto_61249 ) ( IS-CRATE ?auto_61246 ) ( not ( = ?auto_61244 ?auto_61249 ) ) ( not ( = ?auto_61245 ?auto_61249 ) ) ( not ( = ?auto_61260 ?auto_61249 ) ) ( not ( = ?auto_61250 ?auto_61249 ) ) ( not ( = ?auto_61253 ?auto_61249 ) ) ( not ( = ?auto_61246 ?auto_61249 ) ) ( not ( = ?auto_61255 ?auto_61249 ) ) ( AVAILABLE ?auto_61248 ) ( IN ?auto_61246 ?auto_61252 ) )
    :subtasks
    ( ( !UNLOAD ?auto_61248 ?auto_61246 ?auto_61252 ?auto_61247 )
      ( MAKE-ON ?auto_61244 ?auto_61245 )
      ( MAKE-ON-VERIFY ?auto_61244 ?auto_61245 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61261 - SURFACE
      ?auto_61262 - SURFACE
    )
    :vars
    (
      ?auto_61265 - HOIST
      ?auto_61270 - PLACE
      ?auto_61266 - PLACE
      ?auto_61269 - HOIST
      ?auto_61272 - SURFACE
      ?auto_61268 - SURFACE
      ?auto_61267 - PLACE
      ?auto_61271 - HOIST
      ?auto_61276 - SURFACE
      ?auto_61263 - SURFACE
      ?auto_61274 - PLACE
      ?auto_61275 - HOIST
      ?auto_61273 - SURFACE
      ?auto_61264 - SURFACE
      ?auto_61277 - TRUCK
      ?auto_61278 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61265 ?auto_61270 ) ( IS-CRATE ?auto_61261 ) ( not ( = ?auto_61261 ?auto_61262 ) ) ( not ( = ?auto_61266 ?auto_61270 ) ) ( HOIST-AT ?auto_61269 ?auto_61266 ) ( not ( = ?auto_61265 ?auto_61269 ) ) ( AVAILABLE ?auto_61269 ) ( SURFACE-AT ?auto_61261 ?auto_61266 ) ( ON ?auto_61261 ?auto_61272 ) ( CLEAR ?auto_61261 ) ( not ( = ?auto_61261 ?auto_61272 ) ) ( not ( = ?auto_61262 ?auto_61272 ) ) ( IS-CRATE ?auto_61262 ) ( not ( = ?auto_61261 ?auto_61268 ) ) ( not ( = ?auto_61262 ?auto_61268 ) ) ( not ( = ?auto_61272 ?auto_61268 ) ) ( not ( = ?auto_61267 ?auto_61270 ) ) ( not ( = ?auto_61266 ?auto_61267 ) ) ( HOIST-AT ?auto_61271 ?auto_61267 ) ( not ( = ?auto_61265 ?auto_61271 ) ) ( not ( = ?auto_61269 ?auto_61271 ) ) ( AVAILABLE ?auto_61271 ) ( SURFACE-AT ?auto_61262 ?auto_61267 ) ( ON ?auto_61262 ?auto_61276 ) ( CLEAR ?auto_61262 ) ( not ( = ?auto_61261 ?auto_61276 ) ) ( not ( = ?auto_61262 ?auto_61276 ) ) ( not ( = ?auto_61272 ?auto_61276 ) ) ( not ( = ?auto_61268 ?auto_61276 ) ) ( IS-CRATE ?auto_61268 ) ( not ( = ?auto_61261 ?auto_61263 ) ) ( not ( = ?auto_61262 ?auto_61263 ) ) ( not ( = ?auto_61272 ?auto_61263 ) ) ( not ( = ?auto_61268 ?auto_61263 ) ) ( not ( = ?auto_61276 ?auto_61263 ) ) ( not ( = ?auto_61274 ?auto_61270 ) ) ( not ( = ?auto_61266 ?auto_61274 ) ) ( not ( = ?auto_61267 ?auto_61274 ) ) ( HOIST-AT ?auto_61275 ?auto_61274 ) ( not ( = ?auto_61265 ?auto_61275 ) ) ( not ( = ?auto_61269 ?auto_61275 ) ) ( not ( = ?auto_61271 ?auto_61275 ) ) ( AVAILABLE ?auto_61275 ) ( SURFACE-AT ?auto_61268 ?auto_61274 ) ( ON ?auto_61268 ?auto_61273 ) ( CLEAR ?auto_61268 ) ( not ( = ?auto_61261 ?auto_61273 ) ) ( not ( = ?auto_61262 ?auto_61273 ) ) ( not ( = ?auto_61272 ?auto_61273 ) ) ( not ( = ?auto_61268 ?auto_61273 ) ) ( not ( = ?auto_61276 ?auto_61273 ) ) ( not ( = ?auto_61263 ?auto_61273 ) ) ( SURFACE-AT ?auto_61264 ?auto_61270 ) ( CLEAR ?auto_61264 ) ( IS-CRATE ?auto_61263 ) ( not ( = ?auto_61261 ?auto_61264 ) ) ( not ( = ?auto_61262 ?auto_61264 ) ) ( not ( = ?auto_61272 ?auto_61264 ) ) ( not ( = ?auto_61268 ?auto_61264 ) ) ( not ( = ?auto_61276 ?auto_61264 ) ) ( not ( = ?auto_61263 ?auto_61264 ) ) ( not ( = ?auto_61273 ?auto_61264 ) ) ( AVAILABLE ?auto_61265 ) ( IN ?auto_61263 ?auto_61277 ) ( TRUCK-AT ?auto_61277 ?auto_61278 ) ( not ( = ?auto_61278 ?auto_61270 ) ) ( not ( = ?auto_61266 ?auto_61278 ) ) ( not ( = ?auto_61267 ?auto_61278 ) ) ( not ( = ?auto_61274 ?auto_61278 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_61277 ?auto_61278 ?auto_61270 )
      ( MAKE-ON ?auto_61261 ?auto_61262 )
      ( MAKE-ON-VERIFY ?auto_61261 ?auto_61262 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61279 - SURFACE
      ?auto_61280 - SURFACE
    )
    :vars
    (
      ?auto_61292 - HOIST
      ?auto_61289 - PLACE
      ?auto_61281 - PLACE
      ?auto_61286 - HOIST
      ?auto_61283 - SURFACE
      ?auto_61290 - SURFACE
      ?auto_61284 - PLACE
      ?auto_61295 - HOIST
      ?auto_61288 - SURFACE
      ?auto_61287 - SURFACE
      ?auto_61285 - PLACE
      ?auto_61296 - HOIST
      ?auto_61293 - SURFACE
      ?auto_61291 - SURFACE
      ?auto_61294 - TRUCK
      ?auto_61282 - PLACE
      ?auto_61297 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_61292 ?auto_61289 ) ( IS-CRATE ?auto_61279 ) ( not ( = ?auto_61279 ?auto_61280 ) ) ( not ( = ?auto_61281 ?auto_61289 ) ) ( HOIST-AT ?auto_61286 ?auto_61281 ) ( not ( = ?auto_61292 ?auto_61286 ) ) ( AVAILABLE ?auto_61286 ) ( SURFACE-AT ?auto_61279 ?auto_61281 ) ( ON ?auto_61279 ?auto_61283 ) ( CLEAR ?auto_61279 ) ( not ( = ?auto_61279 ?auto_61283 ) ) ( not ( = ?auto_61280 ?auto_61283 ) ) ( IS-CRATE ?auto_61280 ) ( not ( = ?auto_61279 ?auto_61290 ) ) ( not ( = ?auto_61280 ?auto_61290 ) ) ( not ( = ?auto_61283 ?auto_61290 ) ) ( not ( = ?auto_61284 ?auto_61289 ) ) ( not ( = ?auto_61281 ?auto_61284 ) ) ( HOIST-AT ?auto_61295 ?auto_61284 ) ( not ( = ?auto_61292 ?auto_61295 ) ) ( not ( = ?auto_61286 ?auto_61295 ) ) ( AVAILABLE ?auto_61295 ) ( SURFACE-AT ?auto_61280 ?auto_61284 ) ( ON ?auto_61280 ?auto_61288 ) ( CLEAR ?auto_61280 ) ( not ( = ?auto_61279 ?auto_61288 ) ) ( not ( = ?auto_61280 ?auto_61288 ) ) ( not ( = ?auto_61283 ?auto_61288 ) ) ( not ( = ?auto_61290 ?auto_61288 ) ) ( IS-CRATE ?auto_61290 ) ( not ( = ?auto_61279 ?auto_61287 ) ) ( not ( = ?auto_61280 ?auto_61287 ) ) ( not ( = ?auto_61283 ?auto_61287 ) ) ( not ( = ?auto_61290 ?auto_61287 ) ) ( not ( = ?auto_61288 ?auto_61287 ) ) ( not ( = ?auto_61285 ?auto_61289 ) ) ( not ( = ?auto_61281 ?auto_61285 ) ) ( not ( = ?auto_61284 ?auto_61285 ) ) ( HOIST-AT ?auto_61296 ?auto_61285 ) ( not ( = ?auto_61292 ?auto_61296 ) ) ( not ( = ?auto_61286 ?auto_61296 ) ) ( not ( = ?auto_61295 ?auto_61296 ) ) ( AVAILABLE ?auto_61296 ) ( SURFACE-AT ?auto_61290 ?auto_61285 ) ( ON ?auto_61290 ?auto_61293 ) ( CLEAR ?auto_61290 ) ( not ( = ?auto_61279 ?auto_61293 ) ) ( not ( = ?auto_61280 ?auto_61293 ) ) ( not ( = ?auto_61283 ?auto_61293 ) ) ( not ( = ?auto_61290 ?auto_61293 ) ) ( not ( = ?auto_61288 ?auto_61293 ) ) ( not ( = ?auto_61287 ?auto_61293 ) ) ( SURFACE-AT ?auto_61291 ?auto_61289 ) ( CLEAR ?auto_61291 ) ( IS-CRATE ?auto_61287 ) ( not ( = ?auto_61279 ?auto_61291 ) ) ( not ( = ?auto_61280 ?auto_61291 ) ) ( not ( = ?auto_61283 ?auto_61291 ) ) ( not ( = ?auto_61290 ?auto_61291 ) ) ( not ( = ?auto_61288 ?auto_61291 ) ) ( not ( = ?auto_61287 ?auto_61291 ) ) ( not ( = ?auto_61293 ?auto_61291 ) ) ( AVAILABLE ?auto_61292 ) ( TRUCK-AT ?auto_61294 ?auto_61282 ) ( not ( = ?auto_61282 ?auto_61289 ) ) ( not ( = ?auto_61281 ?auto_61282 ) ) ( not ( = ?auto_61284 ?auto_61282 ) ) ( not ( = ?auto_61285 ?auto_61282 ) ) ( HOIST-AT ?auto_61297 ?auto_61282 ) ( LIFTING ?auto_61297 ?auto_61287 ) ( not ( = ?auto_61292 ?auto_61297 ) ) ( not ( = ?auto_61286 ?auto_61297 ) ) ( not ( = ?auto_61295 ?auto_61297 ) ) ( not ( = ?auto_61296 ?auto_61297 ) ) )
    :subtasks
    ( ( !LOAD ?auto_61297 ?auto_61287 ?auto_61294 ?auto_61282 )
      ( MAKE-ON ?auto_61279 ?auto_61280 )
      ( MAKE-ON-VERIFY ?auto_61279 ?auto_61280 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61298 - SURFACE
      ?auto_61299 - SURFACE
    )
    :vars
    (
      ?auto_61300 - HOIST
      ?auto_61305 - PLACE
      ?auto_61312 - PLACE
      ?auto_61303 - HOIST
      ?auto_61315 - SURFACE
      ?auto_61301 - SURFACE
      ?auto_61308 - PLACE
      ?auto_61313 - HOIST
      ?auto_61316 - SURFACE
      ?auto_61310 - SURFACE
      ?auto_61311 - PLACE
      ?auto_61304 - HOIST
      ?auto_61302 - SURFACE
      ?auto_61309 - SURFACE
      ?auto_61306 - TRUCK
      ?auto_61307 - PLACE
      ?auto_61314 - HOIST
      ?auto_61317 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61300 ?auto_61305 ) ( IS-CRATE ?auto_61298 ) ( not ( = ?auto_61298 ?auto_61299 ) ) ( not ( = ?auto_61312 ?auto_61305 ) ) ( HOIST-AT ?auto_61303 ?auto_61312 ) ( not ( = ?auto_61300 ?auto_61303 ) ) ( AVAILABLE ?auto_61303 ) ( SURFACE-AT ?auto_61298 ?auto_61312 ) ( ON ?auto_61298 ?auto_61315 ) ( CLEAR ?auto_61298 ) ( not ( = ?auto_61298 ?auto_61315 ) ) ( not ( = ?auto_61299 ?auto_61315 ) ) ( IS-CRATE ?auto_61299 ) ( not ( = ?auto_61298 ?auto_61301 ) ) ( not ( = ?auto_61299 ?auto_61301 ) ) ( not ( = ?auto_61315 ?auto_61301 ) ) ( not ( = ?auto_61308 ?auto_61305 ) ) ( not ( = ?auto_61312 ?auto_61308 ) ) ( HOIST-AT ?auto_61313 ?auto_61308 ) ( not ( = ?auto_61300 ?auto_61313 ) ) ( not ( = ?auto_61303 ?auto_61313 ) ) ( AVAILABLE ?auto_61313 ) ( SURFACE-AT ?auto_61299 ?auto_61308 ) ( ON ?auto_61299 ?auto_61316 ) ( CLEAR ?auto_61299 ) ( not ( = ?auto_61298 ?auto_61316 ) ) ( not ( = ?auto_61299 ?auto_61316 ) ) ( not ( = ?auto_61315 ?auto_61316 ) ) ( not ( = ?auto_61301 ?auto_61316 ) ) ( IS-CRATE ?auto_61301 ) ( not ( = ?auto_61298 ?auto_61310 ) ) ( not ( = ?auto_61299 ?auto_61310 ) ) ( not ( = ?auto_61315 ?auto_61310 ) ) ( not ( = ?auto_61301 ?auto_61310 ) ) ( not ( = ?auto_61316 ?auto_61310 ) ) ( not ( = ?auto_61311 ?auto_61305 ) ) ( not ( = ?auto_61312 ?auto_61311 ) ) ( not ( = ?auto_61308 ?auto_61311 ) ) ( HOIST-AT ?auto_61304 ?auto_61311 ) ( not ( = ?auto_61300 ?auto_61304 ) ) ( not ( = ?auto_61303 ?auto_61304 ) ) ( not ( = ?auto_61313 ?auto_61304 ) ) ( AVAILABLE ?auto_61304 ) ( SURFACE-AT ?auto_61301 ?auto_61311 ) ( ON ?auto_61301 ?auto_61302 ) ( CLEAR ?auto_61301 ) ( not ( = ?auto_61298 ?auto_61302 ) ) ( not ( = ?auto_61299 ?auto_61302 ) ) ( not ( = ?auto_61315 ?auto_61302 ) ) ( not ( = ?auto_61301 ?auto_61302 ) ) ( not ( = ?auto_61316 ?auto_61302 ) ) ( not ( = ?auto_61310 ?auto_61302 ) ) ( SURFACE-AT ?auto_61309 ?auto_61305 ) ( CLEAR ?auto_61309 ) ( IS-CRATE ?auto_61310 ) ( not ( = ?auto_61298 ?auto_61309 ) ) ( not ( = ?auto_61299 ?auto_61309 ) ) ( not ( = ?auto_61315 ?auto_61309 ) ) ( not ( = ?auto_61301 ?auto_61309 ) ) ( not ( = ?auto_61316 ?auto_61309 ) ) ( not ( = ?auto_61310 ?auto_61309 ) ) ( not ( = ?auto_61302 ?auto_61309 ) ) ( AVAILABLE ?auto_61300 ) ( TRUCK-AT ?auto_61306 ?auto_61307 ) ( not ( = ?auto_61307 ?auto_61305 ) ) ( not ( = ?auto_61312 ?auto_61307 ) ) ( not ( = ?auto_61308 ?auto_61307 ) ) ( not ( = ?auto_61311 ?auto_61307 ) ) ( HOIST-AT ?auto_61314 ?auto_61307 ) ( not ( = ?auto_61300 ?auto_61314 ) ) ( not ( = ?auto_61303 ?auto_61314 ) ) ( not ( = ?auto_61313 ?auto_61314 ) ) ( not ( = ?auto_61304 ?auto_61314 ) ) ( AVAILABLE ?auto_61314 ) ( SURFACE-AT ?auto_61310 ?auto_61307 ) ( ON ?auto_61310 ?auto_61317 ) ( CLEAR ?auto_61310 ) ( not ( = ?auto_61298 ?auto_61317 ) ) ( not ( = ?auto_61299 ?auto_61317 ) ) ( not ( = ?auto_61315 ?auto_61317 ) ) ( not ( = ?auto_61301 ?auto_61317 ) ) ( not ( = ?auto_61316 ?auto_61317 ) ) ( not ( = ?auto_61310 ?auto_61317 ) ) ( not ( = ?auto_61302 ?auto_61317 ) ) ( not ( = ?auto_61309 ?auto_61317 ) ) )
    :subtasks
    ( ( !LIFT ?auto_61314 ?auto_61310 ?auto_61317 ?auto_61307 )
      ( MAKE-ON ?auto_61298 ?auto_61299 )
      ( MAKE-ON-VERIFY ?auto_61298 ?auto_61299 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61318 - SURFACE
      ?auto_61319 - SURFACE
    )
    :vars
    (
      ?auto_61321 - HOIST
      ?auto_61331 - PLACE
      ?auto_61336 - PLACE
      ?auto_61335 - HOIST
      ?auto_61322 - SURFACE
      ?auto_61334 - SURFACE
      ?auto_61329 - PLACE
      ?auto_61325 - HOIST
      ?auto_61324 - SURFACE
      ?auto_61337 - SURFACE
      ?auto_61327 - PLACE
      ?auto_61330 - HOIST
      ?auto_61333 - SURFACE
      ?auto_61328 - SURFACE
      ?auto_61332 - PLACE
      ?auto_61326 - HOIST
      ?auto_61323 - SURFACE
      ?auto_61320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_61321 ?auto_61331 ) ( IS-CRATE ?auto_61318 ) ( not ( = ?auto_61318 ?auto_61319 ) ) ( not ( = ?auto_61336 ?auto_61331 ) ) ( HOIST-AT ?auto_61335 ?auto_61336 ) ( not ( = ?auto_61321 ?auto_61335 ) ) ( AVAILABLE ?auto_61335 ) ( SURFACE-AT ?auto_61318 ?auto_61336 ) ( ON ?auto_61318 ?auto_61322 ) ( CLEAR ?auto_61318 ) ( not ( = ?auto_61318 ?auto_61322 ) ) ( not ( = ?auto_61319 ?auto_61322 ) ) ( IS-CRATE ?auto_61319 ) ( not ( = ?auto_61318 ?auto_61334 ) ) ( not ( = ?auto_61319 ?auto_61334 ) ) ( not ( = ?auto_61322 ?auto_61334 ) ) ( not ( = ?auto_61329 ?auto_61331 ) ) ( not ( = ?auto_61336 ?auto_61329 ) ) ( HOIST-AT ?auto_61325 ?auto_61329 ) ( not ( = ?auto_61321 ?auto_61325 ) ) ( not ( = ?auto_61335 ?auto_61325 ) ) ( AVAILABLE ?auto_61325 ) ( SURFACE-AT ?auto_61319 ?auto_61329 ) ( ON ?auto_61319 ?auto_61324 ) ( CLEAR ?auto_61319 ) ( not ( = ?auto_61318 ?auto_61324 ) ) ( not ( = ?auto_61319 ?auto_61324 ) ) ( not ( = ?auto_61322 ?auto_61324 ) ) ( not ( = ?auto_61334 ?auto_61324 ) ) ( IS-CRATE ?auto_61334 ) ( not ( = ?auto_61318 ?auto_61337 ) ) ( not ( = ?auto_61319 ?auto_61337 ) ) ( not ( = ?auto_61322 ?auto_61337 ) ) ( not ( = ?auto_61334 ?auto_61337 ) ) ( not ( = ?auto_61324 ?auto_61337 ) ) ( not ( = ?auto_61327 ?auto_61331 ) ) ( not ( = ?auto_61336 ?auto_61327 ) ) ( not ( = ?auto_61329 ?auto_61327 ) ) ( HOIST-AT ?auto_61330 ?auto_61327 ) ( not ( = ?auto_61321 ?auto_61330 ) ) ( not ( = ?auto_61335 ?auto_61330 ) ) ( not ( = ?auto_61325 ?auto_61330 ) ) ( AVAILABLE ?auto_61330 ) ( SURFACE-AT ?auto_61334 ?auto_61327 ) ( ON ?auto_61334 ?auto_61333 ) ( CLEAR ?auto_61334 ) ( not ( = ?auto_61318 ?auto_61333 ) ) ( not ( = ?auto_61319 ?auto_61333 ) ) ( not ( = ?auto_61322 ?auto_61333 ) ) ( not ( = ?auto_61334 ?auto_61333 ) ) ( not ( = ?auto_61324 ?auto_61333 ) ) ( not ( = ?auto_61337 ?auto_61333 ) ) ( SURFACE-AT ?auto_61328 ?auto_61331 ) ( CLEAR ?auto_61328 ) ( IS-CRATE ?auto_61337 ) ( not ( = ?auto_61318 ?auto_61328 ) ) ( not ( = ?auto_61319 ?auto_61328 ) ) ( not ( = ?auto_61322 ?auto_61328 ) ) ( not ( = ?auto_61334 ?auto_61328 ) ) ( not ( = ?auto_61324 ?auto_61328 ) ) ( not ( = ?auto_61337 ?auto_61328 ) ) ( not ( = ?auto_61333 ?auto_61328 ) ) ( AVAILABLE ?auto_61321 ) ( not ( = ?auto_61332 ?auto_61331 ) ) ( not ( = ?auto_61336 ?auto_61332 ) ) ( not ( = ?auto_61329 ?auto_61332 ) ) ( not ( = ?auto_61327 ?auto_61332 ) ) ( HOIST-AT ?auto_61326 ?auto_61332 ) ( not ( = ?auto_61321 ?auto_61326 ) ) ( not ( = ?auto_61335 ?auto_61326 ) ) ( not ( = ?auto_61325 ?auto_61326 ) ) ( not ( = ?auto_61330 ?auto_61326 ) ) ( AVAILABLE ?auto_61326 ) ( SURFACE-AT ?auto_61337 ?auto_61332 ) ( ON ?auto_61337 ?auto_61323 ) ( CLEAR ?auto_61337 ) ( not ( = ?auto_61318 ?auto_61323 ) ) ( not ( = ?auto_61319 ?auto_61323 ) ) ( not ( = ?auto_61322 ?auto_61323 ) ) ( not ( = ?auto_61334 ?auto_61323 ) ) ( not ( = ?auto_61324 ?auto_61323 ) ) ( not ( = ?auto_61337 ?auto_61323 ) ) ( not ( = ?auto_61333 ?auto_61323 ) ) ( not ( = ?auto_61328 ?auto_61323 ) ) ( TRUCK-AT ?auto_61320 ?auto_61331 ) )
    :subtasks
    ( ( !DRIVE ?auto_61320 ?auto_61331 ?auto_61332 )
      ( MAKE-ON ?auto_61318 ?auto_61319 )
      ( MAKE-ON-VERIFY ?auto_61318 ?auto_61319 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61338 - SURFACE
      ?auto_61339 - SURFACE
    )
    :vars
    (
      ?auto_61351 - HOIST
      ?auto_61344 - PLACE
      ?auto_61341 - PLACE
      ?auto_61353 - HOIST
      ?auto_61357 - SURFACE
      ?auto_61354 - SURFACE
      ?auto_61355 - PLACE
      ?auto_61348 - HOIST
      ?auto_61343 - SURFACE
      ?auto_61342 - SURFACE
      ?auto_61347 - PLACE
      ?auto_61356 - HOIST
      ?auto_61340 - SURFACE
      ?auto_61349 - SURFACE
      ?auto_61346 - PLACE
      ?auto_61345 - HOIST
      ?auto_61352 - SURFACE
      ?auto_61350 - TRUCK
      ?auto_61358 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61351 ?auto_61344 ) ( IS-CRATE ?auto_61338 ) ( not ( = ?auto_61338 ?auto_61339 ) ) ( not ( = ?auto_61341 ?auto_61344 ) ) ( HOIST-AT ?auto_61353 ?auto_61341 ) ( not ( = ?auto_61351 ?auto_61353 ) ) ( AVAILABLE ?auto_61353 ) ( SURFACE-AT ?auto_61338 ?auto_61341 ) ( ON ?auto_61338 ?auto_61357 ) ( CLEAR ?auto_61338 ) ( not ( = ?auto_61338 ?auto_61357 ) ) ( not ( = ?auto_61339 ?auto_61357 ) ) ( IS-CRATE ?auto_61339 ) ( not ( = ?auto_61338 ?auto_61354 ) ) ( not ( = ?auto_61339 ?auto_61354 ) ) ( not ( = ?auto_61357 ?auto_61354 ) ) ( not ( = ?auto_61355 ?auto_61344 ) ) ( not ( = ?auto_61341 ?auto_61355 ) ) ( HOIST-AT ?auto_61348 ?auto_61355 ) ( not ( = ?auto_61351 ?auto_61348 ) ) ( not ( = ?auto_61353 ?auto_61348 ) ) ( AVAILABLE ?auto_61348 ) ( SURFACE-AT ?auto_61339 ?auto_61355 ) ( ON ?auto_61339 ?auto_61343 ) ( CLEAR ?auto_61339 ) ( not ( = ?auto_61338 ?auto_61343 ) ) ( not ( = ?auto_61339 ?auto_61343 ) ) ( not ( = ?auto_61357 ?auto_61343 ) ) ( not ( = ?auto_61354 ?auto_61343 ) ) ( IS-CRATE ?auto_61354 ) ( not ( = ?auto_61338 ?auto_61342 ) ) ( not ( = ?auto_61339 ?auto_61342 ) ) ( not ( = ?auto_61357 ?auto_61342 ) ) ( not ( = ?auto_61354 ?auto_61342 ) ) ( not ( = ?auto_61343 ?auto_61342 ) ) ( not ( = ?auto_61347 ?auto_61344 ) ) ( not ( = ?auto_61341 ?auto_61347 ) ) ( not ( = ?auto_61355 ?auto_61347 ) ) ( HOIST-AT ?auto_61356 ?auto_61347 ) ( not ( = ?auto_61351 ?auto_61356 ) ) ( not ( = ?auto_61353 ?auto_61356 ) ) ( not ( = ?auto_61348 ?auto_61356 ) ) ( AVAILABLE ?auto_61356 ) ( SURFACE-AT ?auto_61354 ?auto_61347 ) ( ON ?auto_61354 ?auto_61340 ) ( CLEAR ?auto_61354 ) ( not ( = ?auto_61338 ?auto_61340 ) ) ( not ( = ?auto_61339 ?auto_61340 ) ) ( not ( = ?auto_61357 ?auto_61340 ) ) ( not ( = ?auto_61354 ?auto_61340 ) ) ( not ( = ?auto_61343 ?auto_61340 ) ) ( not ( = ?auto_61342 ?auto_61340 ) ) ( IS-CRATE ?auto_61342 ) ( not ( = ?auto_61338 ?auto_61349 ) ) ( not ( = ?auto_61339 ?auto_61349 ) ) ( not ( = ?auto_61357 ?auto_61349 ) ) ( not ( = ?auto_61354 ?auto_61349 ) ) ( not ( = ?auto_61343 ?auto_61349 ) ) ( not ( = ?auto_61342 ?auto_61349 ) ) ( not ( = ?auto_61340 ?auto_61349 ) ) ( not ( = ?auto_61346 ?auto_61344 ) ) ( not ( = ?auto_61341 ?auto_61346 ) ) ( not ( = ?auto_61355 ?auto_61346 ) ) ( not ( = ?auto_61347 ?auto_61346 ) ) ( HOIST-AT ?auto_61345 ?auto_61346 ) ( not ( = ?auto_61351 ?auto_61345 ) ) ( not ( = ?auto_61353 ?auto_61345 ) ) ( not ( = ?auto_61348 ?auto_61345 ) ) ( not ( = ?auto_61356 ?auto_61345 ) ) ( AVAILABLE ?auto_61345 ) ( SURFACE-AT ?auto_61342 ?auto_61346 ) ( ON ?auto_61342 ?auto_61352 ) ( CLEAR ?auto_61342 ) ( not ( = ?auto_61338 ?auto_61352 ) ) ( not ( = ?auto_61339 ?auto_61352 ) ) ( not ( = ?auto_61357 ?auto_61352 ) ) ( not ( = ?auto_61354 ?auto_61352 ) ) ( not ( = ?auto_61343 ?auto_61352 ) ) ( not ( = ?auto_61342 ?auto_61352 ) ) ( not ( = ?auto_61340 ?auto_61352 ) ) ( not ( = ?auto_61349 ?auto_61352 ) ) ( TRUCK-AT ?auto_61350 ?auto_61344 ) ( SURFACE-AT ?auto_61358 ?auto_61344 ) ( CLEAR ?auto_61358 ) ( LIFTING ?auto_61351 ?auto_61349 ) ( IS-CRATE ?auto_61349 ) ( not ( = ?auto_61338 ?auto_61358 ) ) ( not ( = ?auto_61339 ?auto_61358 ) ) ( not ( = ?auto_61357 ?auto_61358 ) ) ( not ( = ?auto_61354 ?auto_61358 ) ) ( not ( = ?auto_61343 ?auto_61358 ) ) ( not ( = ?auto_61342 ?auto_61358 ) ) ( not ( = ?auto_61340 ?auto_61358 ) ) ( not ( = ?auto_61349 ?auto_61358 ) ) ( not ( = ?auto_61352 ?auto_61358 ) ) )
    :subtasks
    ( ( !DROP ?auto_61351 ?auto_61349 ?auto_61358 ?auto_61344 )
      ( MAKE-ON ?auto_61338 ?auto_61339 )
      ( MAKE-ON-VERIFY ?auto_61338 ?auto_61339 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61359 - SURFACE
      ?auto_61360 - SURFACE
    )
    :vars
    (
      ?auto_61364 - HOIST
      ?auto_61368 - PLACE
      ?auto_61365 - PLACE
      ?auto_61362 - HOIST
      ?auto_61377 - SURFACE
      ?auto_61374 - SURFACE
      ?auto_61371 - PLACE
      ?auto_61378 - HOIST
      ?auto_61367 - SURFACE
      ?auto_61366 - SURFACE
      ?auto_61363 - PLACE
      ?auto_61376 - HOIST
      ?auto_61379 - SURFACE
      ?auto_61375 - SURFACE
      ?auto_61370 - PLACE
      ?auto_61369 - HOIST
      ?auto_61372 - SURFACE
      ?auto_61361 - TRUCK
      ?auto_61373 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61364 ?auto_61368 ) ( IS-CRATE ?auto_61359 ) ( not ( = ?auto_61359 ?auto_61360 ) ) ( not ( = ?auto_61365 ?auto_61368 ) ) ( HOIST-AT ?auto_61362 ?auto_61365 ) ( not ( = ?auto_61364 ?auto_61362 ) ) ( AVAILABLE ?auto_61362 ) ( SURFACE-AT ?auto_61359 ?auto_61365 ) ( ON ?auto_61359 ?auto_61377 ) ( CLEAR ?auto_61359 ) ( not ( = ?auto_61359 ?auto_61377 ) ) ( not ( = ?auto_61360 ?auto_61377 ) ) ( IS-CRATE ?auto_61360 ) ( not ( = ?auto_61359 ?auto_61374 ) ) ( not ( = ?auto_61360 ?auto_61374 ) ) ( not ( = ?auto_61377 ?auto_61374 ) ) ( not ( = ?auto_61371 ?auto_61368 ) ) ( not ( = ?auto_61365 ?auto_61371 ) ) ( HOIST-AT ?auto_61378 ?auto_61371 ) ( not ( = ?auto_61364 ?auto_61378 ) ) ( not ( = ?auto_61362 ?auto_61378 ) ) ( AVAILABLE ?auto_61378 ) ( SURFACE-AT ?auto_61360 ?auto_61371 ) ( ON ?auto_61360 ?auto_61367 ) ( CLEAR ?auto_61360 ) ( not ( = ?auto_61359 ?auto_61367 ) ) ( not ( = ?auto_61360 ?auto_61367 ) ) ( not ( = ?auto_61377 ?auto_61367 ) ) ( not ( = ?auto_61374 ?auto_61367 ) ) ( IS-CRATE ?auto_61374 ) ( not ( = ?auto_61359 ?auto_61366 ) ) ( not ( = ?auto_61360 ?auto_61366 ) ) ( not ( = ?auto_61377 ?auto_61366 ) ) ( not ( = ?auto_61374 ?auto_61366 ) ) ( not ( = ?auto_61367 ?auto_61366 ) ) ( not ( = ?auto_61363 ?auto_61368 ) ) ( not ( = ?auto_61365 ?auto_61363 ) ) ( not ( = ?auto_61371 ?auto_61363 ) ) ( HOIST-AT ?auto_61376 ?auto_61363 ) ( not ( = ?auto_61364 ?auto_61376 ) ) ( not ( = ?auto_61362 ?auto_61376 ) ) ( not ( = ?auto_61378 ?auto_61376 ) ) ( AVAILABLE ?auto_61376 ) ( SURFACE-AT ?auto_61374 ?auto_61363 ) ( ON ?auto_61374 ?auto_61379 ) ( CLEAR ?auto_61374 ) ( not ( = ?auto_61359 ?auto_61379 ) ) ( not ( = ?auto_61360 ?auto_61379 ) ) ( not ( = ?auto_61377 ?auto_61379 ) ) ( not ( = ?auto_61374 ?auto_61379 ) ) ( not ( = ?auto_61367 ?auto_61379 ) ) ( not ( = ?auto_61366 ?auto_61379 ) ) ( IS-CRATE ?auto_61366 ) ( not ( = ?auto_61359 ?auto_61375 ) ) ( not ( = ?auto_61360 ?auto_61375 ) ) ( not ( = ?auto_61377 ?auto_61375 ) ) ( not ( = ?auto_61374 ?auto_61375 ) ) ( not ( = ?auto_61367 ?auto_61375 ) ) ( not ( = ?auto_61366 ?auto_61375 ) ) ( not ( = ?auto_61379 ?auto_61375 ) ) ( not ( = ?auto_61370 ?auto_61368 ) ) ( not ( = ?auto_61365 ?auto_61370 ) ) ( not ( = ?auto_61371 ?auto_61370 ) ) ( not ( = ?auto_61363 ?auto_61370 ) ) ( HOIST-AT ?auto_61369 ?auto_61370 ) ( not ( = ?auto_61364 ?auto_61369 ) ) ( not ( = ?auto_61362 ?auto_61369 ) ) ( not ( = ?auto_61378 ?auto_61369 ) ) ( not ( = ?auto_61376 ?auto_61369 ) ) ( AVAILABLE ?auto_61369 ) ( SURFACE-AT ?auto_61366 ?auto_61370 ) ( ON ?auto_61366 ?auto_61372 ) ( CLEAR ?auto_61366 ) ( not ( = ?auto_61359 ?auto_61372 ) ) ( not ( = ?auto_61360 ?auto_61372 ) ) ( not ( = ?auto_61377 ?auto_61372 ) ) ( not ( = ?auto_61374 ?auto_61372 ) ) ( not ( = ?auto_61367 ?auto_61372 ) ) ( not ( = ?auto_61366 ?auto_61372 ) ) ( not ( = ?auto_61379 ?auto_61372 ) ) ( not ( = ?auto_61375 ?auto_61372 ) ) ( TRUCK-AT ?auto_61361 ?auto_61368 ) ( SURFACE-AT ?auto_61373 ?auto_61368 ) ( CLEAR ?auto_61373 ) ( IS-CRATE ?auto_61375 ) ( not ( = ?auto_61359 ?auto_61373 ) ) ( not ( = ?auto_61360 ?auto_61373 ) ) ( not ( = ?auto_61377 ?auto_61373 ) ) ( not ( = ?auto_61374 ?auto_61373 ) ) ( not ( = ?auto_61367 ?auto_61373 ) ) ( not ( = ?auto_61366 ?auto_61373 ) ) ( not ( = ?auto_61379 ?auto_61373 ) ) ( not ( = ?auto_61375 ?auto_61373 ) ) ( not ( = ?auto_61372 ?auto_61373 ) ) ( AVAILABLE ?auto_61364 ) ( IN ?auto_61375 ?auto_61361 ) )
    :subtasks
    ( ( !UNLOAD ?auto_61364 ?auto_61375 ?auto_61361 ?auto_61368 )
      ( MAKE-ON ?auto_61359 ?auto_61360 )
      ( MAKE-ON-VERIFY ?auto_61359 ?auto_61360 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61380 - SURFACE
      ?auto_61381 - SURFACE
    )
    :vars
    (
      ?auto_61399 - HOIST
      ?auto_61385 - PLACE
      ?auto_61383 - PLACE
      ?auto_61382 - HOIST
      ?auto_61386 - SURFACE
      ?auto_61396 - SURFACE
      ?auto_61395 - PLACE
      ?auto_61387 - HOIST
      ?auto_61384 - SURFACE
      ?auto_61389 - SURFACE
      ?auto_61394 - PLACE
      ?auto_61390 - HOIST
      ?auto_61388 - SURFACE
      ?auto_61398 - SURFACE
      ?auto_61391 - PLACE
      ?auto_61393 - HOIST
      ?auto_61397 - SURFACE
      ?auto_61392 - SURFACE
      ?auto_61400 - TRUCK
      ?auto_61401 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61399 ?auto_61385 ) ( IS-CRATE ?auto_61380 ) ( not ( = ?auto_61380 ?auto_61381 ) ) ( not ( = ?auto_61383 ?auto_61385 ) ) ( HOIST-AT ?auto_61382 ?auto_61383 ) ( not ( = ?auto_61399 ?auto_61382 ) ) ( AVAILABLE ?auto_61382 ) ( SURFACE-AT ?auto_61380 ?auto_61383 ) ( ON ?auto_61380 ?auto_61386 ) ( CLEAR ?auto_61380 ) ( not ( = ?auto_61380 ?auto_61386 ) ) ( not ( = ?auto_61381 ?auto_61386 ) ) ( IS-CRATE ?auto_61381 ) ( not ( = ?auto_61380 ?auto_61396 ) ) ( not ( = ?auto_61381 ?auto_61396 ) ) ( not ( = ?auto_61386 ?auto_61396 ) ) ( not ( = ?auto_61395 ?auto_61385 ) ) ( not ( = ?auto_61383 ?auto_61395 ) ) ( HOIST-AT ?auto_61387 ?auto_61395 ) ( not ( = ?auto_61399 ?auto_61387 ) ) ( not ( = ?auto_61382 ?auto_61387 ) ) ( AVAILABLE ?auto_61387 ) ( SURFACE-AT ?auto_61381 ?auto_61395 ) ( ON ?auto_61381 ?auto_61384 ) ( CLEAR ?auto_61381 ) ( not ( = ?auto_61380 ?auto_61384 ) ) ( not ( = ?auto_61381 ?auto_61384 ) ) ( not ( = ?auto_61386 ?auto_61384 ) ) ( not ( = ?auto_61396 ?auto_61384 ) ) ( IS-CRATE ?auto_61396 ) ( not ( = ?auto_61380 ?auto_61389 ) ) ( not ( = ?auto_61381 ?auto_61389 ) ) ( not ( = ?auto_61386 ?auto_61389 ) ) ( not ( = ?auto_61396 ?auto_61389 ) ) ( not ( = ?auto_61384 ?auto_61389 ) ) ( not ( = ?auto_61394 ?auto_61385 ) ) ( not ( = ?auto_61383 ?auto_61394 ) ) ( not ( = ?auto_61395 ?auto_61394 ) ) ( HOIST-AT ?auto_61390 ?auto_61394 ) ( not ( = ?auto_61399 ?auto_61390 ) ) ( not ( = ?auto_61382 ?auto_61390 ) ) ( not ( = ?auto_61387 ?auto_61390 ) ) ( AVAILABLE ?auto_61390 ) ( SURFACE-AT ?auto_61396 ?auto_61394 ) ( ON ?auto_61396 ?auto_61388 ) ( CLEAR ?auto_61396 ) ( not ( = ?auto_61380 ?auto_61388 ) ) ( not ( = ?auto_61381 ?auto_61388 ) ) ( not ( = ?auto_61386 ?auto_61388 ) ) ( not ( = ?auto_61396 ?auto_61388 ) ) ( not ( = ?auto_61384 ?auto_61388 ) ) ( not ( = ?auto_61389 ?auto_61388 ) ) ( IS-CRATE ?auto_61389 ) ( not ( = ?auto_61380 ?auto_61398 ) ) ( not ( = ?auto_61381 ?auto_61398 ) ) ( not ( = ?auto_61386 ?auto_61398 ) ) ( not ( = ?auto_61396 ?auto_61398 ) ) ( not ( = ?auto_61384 ?auto_61398 ) ) ( not ( = ?auto_61389 ?auto_61398 ) ) ( not ( = ?auto_61388 ?auto_61398 ) ) ( not ( = ?auto_61391 ?auto_61385 ) ) ( not ( = ?auto_61383 ?auto_61391 ) ) ( not ( = ?auto_61395 ?auto_61391 ) ) ( not ( = ?auto_61394 ?auto_61391 ) ) ( HOIST-AT ?auto_61393 ?auto_61391 ) ( not ( = ?auto_61399 ?auto_61393 ) ) ( not ( = ?auto_61382 ?auto_61393 ) ) ( not ( = ?auto_61387 ?auto_61393 ) ) ( not ( = ?auto_61390 ?auto_61393 ) ) ( AVAILABLE ?auto_61393 ) ( SURFACE-AT ?auto_61389 ?auto_61391 ) ( ON ?auto_61389 ?auto_61397 ) ( CLEAR ?auto_61389 ) ( not ( = ?auto_61380 ?auto_61397 ) ) ( not ( = ?auto_61381 ?auto_61397 ) ) ( not ( = ?auto_61386 ?auto_61397 ) ) ( not ( = ?auto_61396 ?auto_61397 ) ) ( not ( = ?auto_61384 ?auto_61397 ) ) ( not ( = ?auto_61389 ?auto_61397 ) ) ( not ( = ?auto_61388 ?auto_61397 ) ) ( not ( = ?auto_61398 ?auto_61397 ) ) ( SURFACE-AT ?auto_61392 ?auto_61385 ) ( CLEAR ?auto_61392 ) ( IS-CRATE ?auto_61398 ) ( not ( = ?auto_61380 ?auto_61392 ) ) ( not ( = ?auto_61381 ?auto_61392 ) ) ( not ( = ?auto_61386 ?auto_61392 ) ) ( not ( = ?auto_61396 ?auto_61392 ) ) ( not ( = ?auto_61384 ?auto_61392 ) ) ( not ( = ?auto_61389 ?auto_61392 ) ) ( not ( = ?auto_61388 ?auto_61392 ) ) ( not ( = ?auto_61398 ?auto_61392 ) ) ( not ( = ?auto_61397 ?auto_61392 ) ) ( AVAILABLE ?auto_61399 ) ( IN ?auto_61398 ?auto_61400 ) ( TRUCK-AT ?auto_61400 ?auto_61401 ) ( not ( = ?auto_61401 ?auto_61385 ) ) ( not ( = ?auto_61383 ?auto_61401 ) ) ( not ( = ?auto_61395 ?auto_61401 ) ) ( not ( = ?auto_61394 ?auto_61401 ) ) ( not ( = ?auto_61391 ?auto_61401 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_61400 ?auto_61401 ?auto_61385 )
      ( MAKE-ON ?auto_61380 ?auto_61381 )
      ( MAKE-ON-VERIFY ?auto_61380 ?auto_61381 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61402 - SURFACE
      ?auto_61403 - SURFACE
    )
    :vars
    (
      ?auto_61411 - HOIST
      ?auto_61409 - PLACE
      ?auto_61419 - PLACE
      ?auto_61407 - HOIST
      ?auto_61408 - SURFACE
      ?auto_61405 - SURFACE
      ?auto_61416 - PLACE
      ?auto_61417 - HOIST
      ?auto_61414 - SURFACE
      ?auto_61410 - SURFACE
      ?auto_61421 - PLACE
      ?auto_61415 - HOIST
      ?auto_61422 - SURFACE
      ?auto_61413 - SURFACE
      ?auto_61406 - PLACE
      ?auto_61420 - HOIST
      ?auto_61404 - SURFACE
      ?auto_61418 - SURFACE
      ?auto_61412 - TRUCK
      ?auto_61423 - PLACE
      ?auto_61424 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_61411 ?auto_61409 ) ( IS-CRATE ?auto_61402 ) ( not ( = ?auto_61402 ?auto_61403 ) ) ( not ( = ?auto_61419 ?auto_61409 ) ) ( HOIST-AT ?auto_61407 ?auto_61419 ) ( not ( = ?auto_61411 ?auto_61407 ) ) ( AVAILABLE ?auto_61407 ) ( SURFACE-AT ?auto_61402 ?auto_61419 ) ( ON ?auto_61402 ?auto_61408 ) ( CLEAR ?auto_61402 ) ( not ( = ?auto_61402 ?auto_61408 ) ) ( not ( = ?auto_61403 ?auto_61408 ) ) ( IS-CRATE ?auto_61403 ) ( not ( = ?auto_61402 ?auto_61405 ) ) ( not ( = ?auto_61403 ?auto_61405 ) ) ( not ( = ?auto_61408 ?auto_61405 ) ) ( not ( = ?auto_61416 ?auto_61409 ) ) ( not ( = ?auto_61419 ?auto_61416 ) ) ( HOIST-AT ?auto_61417 ?auto_61416 ) ( not ( = ?auto_61411 ?auto_61417 ) ) ( not ( = ?auto_61407 ?auto_61417 ) ) ( AVAILABLE ?auto_61417 ) ( SURFACE-AT ?auto_61403 ?auto_61416 ) ( ON ?auto_61403 ?auto_61414 ) ( CLEAR ?auto_61403 ) ( not ( = ?auto_61402 ?auto_61414 ) ) ( not ( = ?auto_61403 ?auto_61414 ) ) ( not ( = ?auto_61408 ?auto_61414 ) ) ( not ( = ?auto_61405 ?auto_61414 ) ) ( IS-CRATE ?auto_61405 ) ( not ( = ?auto_61402 ?auto_61410 ) ) ( not ( = ?auto_61403 ?auto_61410 ) ) ( not ( = ?auto_61408 ?auto_61410 ) ) ( not ( = ?auto_61405 ?auto_61410 ) ) ( not ( = ?auto_61414 ?auto_61410 ) ) ( not ( = ?auto_61421 ?auto_61409 ) ) ( not ( = ?auto_61419 ?auto_61421 ) ) ( not ( = ?auto_61416 ?auto_61421 ) ) ( HOIST-AT ?auto_61415 ?auto_61421 ) ( not ( = ?auto_61411 ?auto_61415 ) ) ( not ( = ?auto_61407 ?auto_61415 ) ) ( not ( = ?auto_61417 ?auto_61415 ) ) ( AVAILABLE ?auto_61415 ) ( SURFACE-AT ?auto_61405 ?auto_61421 ) ( ON ?auto_61405 ?auto_61422 ) ( CLEAR ?auto_61405 ) ( not ( = ?auto_61402 ?auto_61422 ) ) ( not ( = ?auto_61403 ?auto_61422 ) ) ( not ( = ?auto_61408 ?auto_61422 ) ) ( not ( = ?auto_61405 ?auto_61422 ) ) ( not ( = ?auto_61414 ?auto_61422 ) ) ( not ( = ?auto_61410 ?auto_61422 ) ) ( IS-CRATE ?auto_61410 ) ( not ( = ?auto_61402 ?auto_61413 ) ) ( not ( = ?auto_61403 ?auto_61413 ) ) ( not ( = ?auto_61408 ?auto_61413 ) ) ( not ( = ?auto_61405 ?auto_61413 ) ) ( not ( = ?auto_61414 ?auto_61413 ) ) ( not ( = ?auto_61410 ?auto_61413 ) ) ( not ( = ?auto_61422 ?auto_61413 ) ) ( not ( = ?auto_61406 ?auto_61409 ) ) ( not ( = ?auto_61419 ?auto_61406 ) ) ( not ( = ?auto_61416 ?auto_61406 ) ) ( not ( = ?auto_61421 ?auto_61406 ) ) ( HOIST-AT ?auto_61420 ?auto_61406 ) ( not ( = ?auto_61411 ?auto_61420 ) ) ( not ( = ?auto_61407 ?auto_61420 ) ) ( not ( = ?auto_61417 ?auto_61420 ) ) ( not ( = ?auto_61415 ?auto_61420 ) ) ( AVAILABLE ?auto_61420 ) ( SURFACE-AT ?auto_61410 ?auto_61406 ) ( ON ?auto_61410 ?auto_61404 ) ( CLEAR ?auto_61410 ) ( not ( = ?auto_61402 ?auto_61404 ) ) ( not ( = ?auto_61403 ?auto_61404 ) ) ( not ( = ?auto_61408 ?auto_61404 ) ) ( not ( = ?auto_61405 ?auto_61404 ) ) ( not ( = ?auto_61414 ?auto_61404 ) ) ( not ( = ?auto_61410 ?auto_61404 ) ) ( not ( = ?auto_61422 ?auto_61404 ) ) ( not ( = ?auto_61413 ?auto_61404 ) ) ( SURFACE-AT ?auto_61418 ?auto_61409 ) ( CLEAR ?auto_61418 ) ( IS-CRATE ?auto_61413 ) ( not ( = ?auto_61402 ?auto_61418 ) ) ( not ( = ?auto_61403 ?auto_61418 ) ) ( not ( = ?auto_61408 ?auto_61418 ) ) ( not ( = ?auto_61405 ?auto_61418 ) ) ( not ( = ?auto_61414 ?auto_61418 ) ) ( not ( = ?auto_61410 ?auto_61418 ) ) ( not ( = ?auto_61422 ?auto_61418 ) ) ( not ( = ?auto_61413 ?auto_61418 ) ) ( not ( = ?auto_61404 ?auto_61418 ) ) ( AVAILABLE ?auto_61411 ) ( TRUCK-AT ?auto_61412 ?auto_61423 ) ( not ( = ?auto_61423 ?auto_61409 ) ) ( not ( = ?auto_61419 ?auto_61423 ) ) ( not ( = ?auto_61416 ?auto_61423 ) ) ( not ( = ?auto_61421 ?auto_61423 ) ) ( not ( = ?auto_61406 ?auto_61423 ) ) ( HOIST-AT ?auto_61424 ?auto_61423 ) ( LIFTING ?auto_61424 ?auto_61413 ) ( not ( = ?auto_61411 ?auto_61424 ) ) ( not ( = ?auto_61407 ?auto_61424 ) ) ( not ( = ?auto_61417 ?auto_61424 ) ) ( not ( = ?auto_61415 ?auto_61424 ) ) ( not ( = ?auto_61420 ?auto_61424 ) ) )
    :subtasks
    ( ( !LOAD ?auto_61424 ?auto_61413 ?auto_61412 ?auto_61423 )
      ( MAKE-ON ?auto_61402 ?auto_61403 )
      ( MAKE-ON-VERIFY ?auto_61402 ?auto_61403 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61425 - SURFACE
      ?auto_61426 - SURFACE
    )
    :vars
    (
      ?auto_61429 - HOIST
      ?auto_61445 - PLACE
      ?auto_61437 - PLACE
      ?auto_61434 - HOIST
      ?auto_61447 - SURFACE
      ?auto_61440 - SURFACE
      ?auto_61432 - PLACE
      ?auto_61430 - HOIST
      ?auto_61439 - SURFACE
      ?auto_61442 - SURFACE
      ?auto_61441 - PLACE
      ?auto_61446 - HOIST
      ?auto_61444 - SURFACE
      ?auto_61431 - SURFACE
      ?auto_61433 - PLACE
      ?auto_61435 - HOIST
      ?auto_61438 - SURFACE
      ?auto_61428 - SURFACE
      ?auto_61443 - TRUCK
      ?auto_61436 - PLACE
      ?auto_61427 - HOIST
      ?auto_61448 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61429 ?auto_61445 ) ( IS-CRATE ?auto_61425 ) ( not ( = ?auto_61425 ?auto_61426 ) ) ( not ( = ?auto_61437 ?auto_61445 ) ) ( HOIST-AT ?auto_61434 ?auto_61437 ) ( not ( = ?auto_61429 ?auto_61434 ) ) ( AVAILABLE ?auto_61434 ) ( SURFACE-AT ?auto_61425 ?auto_61437 ) ( ON ?auto_61425 ?auto_61447 ) ( CLEAR ?auto_61425 ) ( not ( = ?auto_61425 ?auto_61447 ) ) ( not ( = ?auto_61426 ?auto_61447 ) ) ( IS-CRATE ?auto_61426 ) ( not ( = ?auto_61425 ?auto_61440 ) ) ( not ( = ?auto_61426 ?auto_61440 ) ) ( not ( = ?auto_61447 ?auto_61440 ) ) ( not ( = ?auto_61432 ?auto_61445 ) ) ( not ( = ?auto_61437 ?auto_61432 ) ) ( HOIST-AT ?auto_61430 ?auto_61432 ) ( not ( = ?auto_61429 ?auto_61430 ) ) ( not ( = ?auto_61434 ?auto_61430 ) ) ( AVAILABLE ?auto_61430 ) ( SURFACE-AT ?auto_61426 ?auto_61432 ) ( ON ?auto_61426 ?auto_61439 ) ( CLEAR ?auto_61426 ) ( not ( = ?auto_61425 ?auto_61439 ) ) ( not ( = ?auto_61426 ?auto_61439 ) ) ( not ( = ?auto_61447 ?auto_61439 ) ) ( not ( = ?auto_61440 ?auto_61439 ) ) ( IS-CRATE ?auto_61440 ) ( not ( = ?auto_61425 ?auto_61442 ) ) ( not ( = ?auto_61426 ?auto_61442 ) ) ( not ( = ?auto_61447 ?auto_61442 ) ) ( not ( = ?auto_61440 ?auto_61442 ) ) ( not ( = ?auto_61439 ?auto_61442 ) ) ( not ( = ?auto_61441 ?auto_61445 ) ) ( not ( = ?auto_61437 ?auto_61441 ) ) ( not ( = ?auto_61432 ?auto_61441 ) ) ( HOIST-AT ?auto_61446 ?auto_61441 ) ( not ( = ?auto_61429 ?auto_61446 ) ) ( not ( = ?auto_61434 ?auto_61446 ) ) ( not ( = ?auto_61430 ?auto_61446 ) ) ( AVAILABLE ?auto_61446 ) ( SURFACE-AT ?auto_61440 ?auto_61441 ) ( ON ?auto_61440 ?auto_61444 ) ( CLEAR ?auto_61440 ) ( not ( = ?auto_61425 ?auto_61444 ) ) ( not ( = ?auto_61426 ?auto_61444 ) ) ( not ( = ?auto_61447 ?auto_61444 ) ) ( not ( = ?auto_61440 ?auto_61444 ) ) ( not ( = ?auto_61439 ?auto_61444 ) ) ( not ( = ?auto_61442 ?auto_61444 ) ) ( IS-CRATE ?auto_61442 ) ( not ( = ?auto_61425 ?auto_61431 ) ) ( not ( = ?auto_61426 ?auto_61431 ) ) ( not ( = ?auto_61447 ?auto_61431 ) ) ( not ( = ?auto_61440 ?auto_61431 ) ) ( not ( = ?auto_61439 ?auto_61431 ) ) ( not ( = ?auto_61442 ?auto_61431 ) ) ( not ( = ?auto_61444 ?auto_61431 ) ) ( not ( = ?auto_61433 ?auto_61445 ) ) ( not ( = ?auto_61437 ?auto_61433 ) ) ( not ( = ?auto_61432 ?auto_61433 ) ) ( not ( = ?auto_61441 ?auto_61433 ) ) ( HOIST-AT ?auto_61435 ?auto_61433 ) ( not ( = ?auto_61429 ?auto_61435 ) ) ( not ( = ?auto_61434 ?auto_61435 ) ) ( not ( = ?auto_61430 ?auto_61435 ) ) ( not ( = ?auto_61446 ?auto_61435 ) ) ( AVAILABLE ?auto_61435 ) ( SURFACE-AT ?auto_61442 ?auto_61433 ) ( ON ?auto_61442 ?auto_61438 ) ( CLEAR ?auto_61442 ) ( not ( = ?auto_61425 ?auto_61438 ) ) ( not ( = ?auto_61426 ?auto_61438 ) ) ( not ( = ?auto_61447 ?auto_61438 ) ) ( not ( = ?auto_61440 ?auto_61438 ) ) ( not ( = ?auto_61439 ?auto_61438 ) ) ( not ( = ?auto_61442 ?auto_61438 ) ) ( not ( = ?auto_61444 ?auto_61438 ) ) ( not ( = ?auto_61431 ?auto_61438 ) ) ( SURFACE-AT ?auto_61428 ?auto_61445 ) ( CLEAR ?auto_61428 ) ( IS-CRATE ?auto_61431 ) ( not ( = ?auto_61425 ?auto_61428 ) ) ( not ( = ?auto_61426 ?auto_61428 ) ) ( not ( = ?auto_61447 ?auto_61428 ) ) ( not ( = ?auto_61440 ?auto_61428 ) ) ( not ( = ?auto_61439 ?auto_61428 ) ) ( not ( = ?auto_61442 ?auto_61428 ) ) ( not ( = ?auto_61444 ?auto_61428 ) ) ( not ( = ?auto_61431 ?auto_61428 ) ) ( not ( = ?auto_61438 ?auto_61428 ) ) ( AVAILABLE ?auto_61429 ) ( TRUCK-AT ?auto_61443 ?auto_61436 ) ( not ( = ?auto_61436 ?auto_61445 ) ) ( not ( = ?auto_61437 ?auto_61436 ) ) ( not ( = ?auto_61432 ?auto_61436 ) ) ( not ( = ?auto_61441 ?auto_61436 ) ) ( not ( = ?auto_61433 ?auto_61436 ) ) ( HOIST-AT ?auto_61427 ?auto_61436 ) ( not ( = ?auto_61429 ?auto_61427 ) ) ( not ( = ?auto_61434 ?auto_61427 ) ) ( not ( = ?auto_61430 ?auto_61427 ) ) ( not ( = ?auto_61446 ?auto_61427 ) ) ( not ( = ?auto_61435 ?auto_61427 ) ) ( AVAILABLE ?auto_61427 ) ( SURFACE-AT ?auto_61431 ?auto_61436 ) ( ON ?auto_61431 ?auto_61448 ) ( CLEAR ?auto_61431 ) ( not ( = ?auto_61425 ?auto_61448 ) ) ( not ( = ?auto_61426 ?auto_61448 ) ) ( not ( = ?auto_61447 ?auto_61448 ) ) ( not ( = ?auto_61440 ?auto_61448 ) ) ( not ( = ?auto_61439 ?auto_61448 ) ) ( not ( = ?auto_61442 ?auto_61448 ) ) ( not ( = ?auto_61444 ?auto_61448 ) ) ( not ( = ?auto_61431 ?auto_61448 ) ) ( not ( = ?auto_61438 ?auto_61448 ) ) ( not ( = ?auto_61428 ?auto_61448 ) ) )
    :subtasks
    ( ( !LIFT ?auto_61427 ?auto_61431 ?auto_61448 ?auto_61436 )
      ( MAKE-ON ?auto_61425 ?auto_61426 )
      ( MAKE-ON-VERIFY ?auto_61425 ?auto_61426 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61449 - SURFACE
      ?auto_61450 - SURFACE
    )
    :vars
    (
      ?auto_61467 - HOIST
      ?auto_61464 - PLACE
      ?auto_61460 - PLACE
      ?auto_61462 - HOIST
      ?auto_61466 - SURFACE
      ?auto_61469 - SURFACE
      ?auto_61459 - PLACE
      ?auto_61453 - HOIST
      ?auto_61471 - SURFACE
      ?auto_61454 - SURFACE
      ?auto_61468 - PLACE
      ?auto_61457 - HOIST
      ?auto_61456 - SURFACE
      ?auto_61463 - SURFACE
      ?auto_61461 - PLACE
      ?auto_61472 - HOIST
      ?auto_61465 - SURFACE
      ?auto_61458 - SURFACE
      ?auto_61470 - PLACE
      ?auto_61451 - HOIST
      ?auto_61452 - SURFACE
      ?auto_61455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_61467 ?auto_61464 ) ( IS-CRATE ?auto_61449 ) ( not ( = ?auto_61449 ?auto_61450 ) ) ( not ( = ?auto_61460 ?auto_61464 ) ) ( HOIST-AT ?auto_61462 ?auto_61460 ) ( not ( = ?auto_61467 ?auto_61462 ) ) ( AVAILABLE ?auto_61462 ) ( SURFACE-AT ?auto_61449 ?auto_61460 ) ( ON ?auto_61449 ?auto_61466 ) ( CLEAR ?auto_61449 ) ( not ( = ?auto_61449 ?auto_61466 ) ) ( not ( = ?auto_61450 ?auto_61466 ) ) ( IS-CRATE ?auto_61450 ) ( not ( = ?auto_61449 ?auto_61469 ) ) ( not ( = ?auto_61450 ?auto_61469 ) ) ( not ( = ?auto_61466 ?auto_61469 ) ) ( not ( = ?auto_61459 ?auto_61464 ) ) ( not ( = ?auto_61460 ?auto_61459 ) ) ( HOIST-AT ?auto_61453 ?auto_61459 ) ( not ( = ?auto_61467 ?auto_61453 ) ) ( not ( = ?auto_61462 ?auto_61453 ) ) ( AVAILABLE ?auto_61453 ) ( SURFACE-AT ?auto_61450 ?auto_61459 ) ( ON ?auto_61450 ?auto_61471 ) ( CLEAR ?auto_61450 ) ( not ( = ?auto_61449 ?auto_61471 ) ) ( not ( = ?auto_61450 ?auto_61471 ) ) ( not ( = ?auto_61466 ?auto_61471 ) ) ( not ( = ?auto_61469 ?auto_61471 ) ) ( IS-CRATE ?auto_61469 ) ( not ( = ?auto_61449 ?auto_61454 ) ) ( not ( = ?auto_61450 ?auto_61454 ) ) ( not ( = ?auto_61466 ?auto_61454 ) ) ( not ( = ?auto_61469 ?auto_61454 ) ) ( not ( = ?auto_61471 ?auto_61454 ) ) ( not ( = ?auto_61468 ?auto_61464 ) ) ( not ( = ?auto_61460 ?auto_61468 ) ) ( not ( = ?auto_61459 ?auto_61468 ) ) ( HOIST-AT ?auto_61457 ?auto_61468 ) ( not ( = ?auto_61467 ?auto_61457 ) ) ( not ( = ?auto_61462 ?auto_61457 ) ) ( not ( = ?auto_61453 ?auto_61457 ) ) ( AVAILABLE ?auto_61457 ) ( SURFACE-AT ?auto_61469 ?auto_61468 ) ( ON ?auto_61469 ?auto_61456 ) ( CLEAR ?auto_61469 ) ( not ( = ?auto_61449 ?auto_61456 ) ) ( not ( = ?auto_61450 ?auto_61456 ) ) ( not ( = ?auto_61466 ?auto_61456 ) ) ( not ( = ?auto_61469 ?auto_61456 ) ) ( not ( = ?auto_61471 ?auto_61456 ) ) ( not ( = ?auto_61454 ?auto_61456 ) ) ( IS-CRATE ?auto_61454 ) ( not ( = ?auto_61449 ?auto_61463 ) ) ( not ( = ?auto_61450 ?auto_61463 ) ) ( not ( = ?auto_61466 ?auto_61463 ) ) ( not ( = ?auto_61469 ?auto_61463 ) ) ( not ( = ?auto_61471 ?auto_61463 ) ) ( not ( = ?auto_61454 ?auto_61463 ) ) ( not ( = ?auto_61456 ?auto_61463 ) ) ( not ( = ?auto_61461 ?auto_61464 ) ) ( not ( = ?auto_61460 ?auto_61461 ) ) ( not ( = ?auto_61459 ?auto_61461 ) ) ( not ( = ?auto_61468 ?auto_61461 ) ) ( HOIST-AT ?auto_61472 ?auto_61461 ) ( not ( = ?auto_61467 ?auto_61472 ) ) ( not ( = ?auto_61462 ?auto_61472 ) ) ( not ( = ?auto_61453 ?auto_61472 ) ) ( not ( = ?auto_61457 ?auto_61472 ) ) ( AVAILABLE ?auto_61472 ) ( SURFACE-AT ?auto_61454 ?auto_61461 ) ( ON ?auto_61454 ?auto_61465 ) ( CLEAR ?auto_61454 ) ( not ( = ?auto_61449 ?auto_61465 ) ) ( not ( = ?auto_61450 ?auto_61465 ) ) ( not ( = ?auto_61466 ?auto_61465 ) ) ( not ( = ?auto_61469 ?auto_61465 ) ) ( not ( = ?auto_61471 ?auto_61465 ) ) ( not ( = ?auto_61454 ?auto_61465 ) ) ( not ( = ?auto_61456 ?auto_61465 ) ) ( not ( = ?auto_61463 ?auto_61465 ) ) ( SURFACE-AT ?auto_61458 ?auto_61464 ) ( CLEAR ?auto_61458 ) ( IS-CRATE ?auto_61463 ) ( not ( = ?auto_61449 ?auto_61458 ) ) ( not ( = ?auto_61450 ?auto_61458 ) ) ( not ( = ?auto_61466 ?auto_61458 ) ) ( not ( = ?auto_61469 ?auto_61458 ) ) ( not ( = ?auto_61471 ?auto_61458 ) ) ( not ( = ?auto_61454 ?auto_61458 ) ) ( not ( = ?auto_61456 ?auto_61458 ) ) ( not ( = ?auto_61463 ?auto_61458 ) ) ( not ( = ?auto_61465 ?auto_61458 ) ) ( AVAILABLE ?auto_61467 ) ( not ( = ?auto_61470 ?auto_61464 ) ) ( not ( = ?auto_61460 ?auto_61470 ) ) ( not ( = ?auto_61459 ?auto_61470 ) ) ( not ( = ?auto_61468 ?auto_61470 ) ) ( not ( = ?auto_61461 ?auto_61470 ) ) ( HOIST-AT ?auto_61451 ?auto_61470 ) ( not ( = ?auto_61467 ?auto_61451 ) ) ( not ( = ?auto_61462 ?auto_61451 ) ) ( not ( = ?auto_61453 ?auto_61451 ) ) ( not ( = ?auto_61457 ?auto_61451 ) ) ( not ( = ?auto_61472 ?auto_61451 ) ) ( AVAILABLE ?auto_61451 ) ( SURFACE-AT ?auto_61463 ?auto_61470 ) ( ON ?auto_61463 ?auto_61452 ) ( CLEAR ?auto_61463 ) ( not ( = ?auto_61449 ?auto_61452 ) ) ( not ( = ?auto_61450 ?auto_61452 ) ) ( not ( = ?auto_61466 ?auto_61452 ) ) ( not ( = ?auto_61469 ?auto_61452 ) ) ( not ( = ?auto_61471 ?auto_61452 ) ) ( not ( = ?auto_61454 ?auto_61452 ) ) ( not ( = ?auto_61456 ?auto_61452 ) ) ( not ( = ?auto_61463 ?auto_61452 ) ) ( not ( = ?auto_61465 ?auto_61452 ) ) ( not ( = ?auto_61458 ?auto_61452 ) ) ( TRUCK-AT ?auto_61455 ?auto_61464 ) )
    :subtasks
    ( ( !DRIVE ?auto_61455 ?auto_61464 ?auto_61470 )
      ( MAKE-ON ?auto_61449 ?auto_61450 )
      ( MAKE-ON-VERIFY ?auto_61449 ?auto_61450 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61473 - SURFACE
      ?auto_61474 - SURFACE
    )
    :vars
    (
      ?auto_61490 - HOIST
      ?auto_61486 - PLACE
      ?auto_61478 - PLACE
      ?auto_61482 - HOIST
      ?auto_61476 - SURFACE
      ?auto_61494 - SURFACE
      ?auto_61493 - PLACE
      ?auto_61477 - HOIST
      ?auto_61488 - SURFACE
      ?auto_61485 - SURFACE
      ?auto_61495 - PLACE
      ?auto_61496 - HOIST
      ?auto_61483 - SURFACE
      ?auto_61484 - SURFACE
      ?auto_61487 - PLACE
      ?auto_61475 - HOIST
      ?auto_61480 - SURFACE
      ?auto_61481 - SURFACE
      ?auto_61489 - PLACE
      ?auto_61479 - HOIST
      ?auto_61491 - SURFACE
      ?auto_61492 - TRUCK
      ?auto_61497 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61490 ?auto_61486 ) ( IS-CRATE ?auto_61473 ) ( not ( = ?auto_61473 ?auto_61474 ) ) ( not ( = ?auto_61478 ?auto_61486 ) ) ( HOIST-AT ?auto_61482 ?auto_61478 ) ( not ( = ?auto_61490 ?auto_61482 ) ) ( AVAILABLE ?auto_61482 ) ( SURFACE-AT ?auto_61473 ?auto_61478 ) ( ON ?auto_61473 ?auto_61476 ) ( CLEAR ?auto_61473 ) ( not ( = ?auto_61473 ?auto_61476 ) ) ( not ( = ?auto_61474 ?auto_61476 ) ) ( IS-CRATE ?auto_61474 ) ( not ( = ?auto_61473 ?auto_61494 ) ) ( not ( = ?auto_61474 ?auto_61494 ) ) ( not ( = ?auto_61476 ?auto_61494 ) ) ( not ( = ?auto_61493 ?auto_61486 ) ) ( not ( = ?auto_61478 ?auto_61493 ) ) ( HOIST-AT ?auto_61477 ?auto_61493 ) ( not ( = ?auto_61490 ?auto_61477 ) ) ( not ( = ?auto_61482 ?auto_61477 ) ) ( AVAILABLE ?auto_61477 ) ( SURFACE-AT ?auto_61474 ?auto_61493 ) ( ON ?auto_61474 ?auto_61488 ) ( CLEAR ?auto_61474 ) ( not ( = ?auto_61473 ?auto_61488 ) ) ( not ( = ?auto_61474 ?auto_61488 ) ) ( not ( = ?auto_61476 ?auto_61488 ) ) ( not ( = ?auto_61494 ?auto_61488 ) ) ( IS-CRATE ?auto_61494 ) ( not ( = ?auto_61473 ?auto_61485 ) ) ( not ( = ?auto_61474 ?auto_61485 ) ) ( not ( = ?auto_61476 ?auto_61485 ) ) ( not ( = ?auto_61494 ?auto_61485 ) ) ( not ( = ?auto_61488 ?auto_61485 ) ) ( not ( = ?auto_61495 ?auto_61486 ) ) ( not ( = ?auto_61478 ?auto_61495 ) ) ( not ( = ?auto_61493 ?auto_61495 ) ) ( HOIST-AT ?auto_61496 ?auto_61495 ) ( not ( = ?auto_61490 ?auto_61496 ) ) ( not ( = ?auto_61482 ?auto_61496 ) ) ( not ( = ?auto_61477 ?auto_61496 ) ) ( AVAILABLE ?auto_61496 ) ( SURFACE-AT ?auto_61494 ?auto_61495 ) ( ON ?auto_61494 ?auto_61483 ) ( CLEAR ?auto_61494 ) ( not ( = ?auto_61473 ?auto_61483 ) ) ( not ( = ?auto_61474 ?auto_61483 ) ) ( not ( = ?auto_61476 ?auto_61483 ) ) ( not ( = ?auto_61494 ?auto_61483 ) ) ( not ( = ?auto_61488 ?auto_61483 ) ) ( not ( = ?auto_61485 ?auto_61483 ) ) ( IS-CRATE ?auto_61485 ) ( not ( = ?auto_61473 ?auto_61484 ) ) ( not ( = ?auto_61474 ?auto_61484 ) ) ( not ( = ?auto_61476 ?auto_61484 ) ) ( not ( = ?auto_61494 ?auto_61484 ) ) ( not ( = ?auto_61488 ?auto_61484 ) ) ( not ( = ?auto_61485 ?auto_61484 ) ) ( not ( = ?auto_61483 ?auto_61484 ) ) ( not ( = ?auto_61487 ?auto_61486 ) ) ( not ( = ?auto_61478 ?auto_61487 ) ) ( not ( = ?auto_61493 ?auto_61487 ) ) ( not ( = ?auto_61495 ?auto_61487 ) ) ( HOIST-AT ?auto_61475 ?auto_61487 ) ( not ( = ?auto_61490 ?auto_61475 ) ) ( not ( = ?auto_61482 ?auto_61475 ) ) ( not ( = ?auto_61477 ?auto_61475 ) ) ( not ( = ?auto_61496 ?auto_61475 ) ) ( AVAILABLE ?auto_61475 ) ( SURFACE-AT ?auto_61485 ?auto_61487 ) ( ON ?auto_61485 ?auto_61480 ) ( CLEAR ?auto_61485 ) ( not ( = ?auto_61473 ?auto_61480 ) ) ( not ( = ?auto_61474 ?auto_61480 ) ) ( not ( = ?auto_61476 ?auto_61480 ) ) ( not ( = ?auto_61494 ?auto_61480 ) ) ( not ( = ?auto_61488 ?auto_61480 ) ) ( not ( = ?auto_61485 ?auto_61480 ) ) ( not ( = ?auto_61483 ?auto_61480 ) ) ( not ( = ?auto_61484 ?auto_61480 ) ) ( IS-CRATE ?auto_61484 ) ( not ( = ?auto_61473 ?auto_61481 ) ) ( not ( = ?auto_61474 ?auto_61481 ) ) ( not ( = ?auto_61476 ?auto_61481 ) ) ( not ( = ?auto_61494 ?auto_61481 ) ) ( not ( = ?auto_61488 ?auto_61481 ) ) ( not ( = ?auto_61485 ?auto_61481 ) ) ( not ( = ?auto_61483 ?auto_61481 ) ) ( not ( = ?auto_61484 ?auto_61481 ) ) ( not ( = ?auto_61480 ?auto_61481 ) ) ( not ( = ?auto_61489 ?auto_61486 ) ) ( not ( = ?auto_61478 ?auto_61489 ) ) ( not ( = ?auto_61493 ?auto_61489 ) ) ( not ( = ?auto_61495 ?auto_61489 ) ) ( not ( = ?auto_61487 ?auto_61489 ) ) ( HOIST-AT ?auto_61479 ?auto_61489 ) ( not ( = ?auto_61490 ?auto_61479 ) ) ( not ( = ?auto_61482 ?auto_61479 ) ) ( not ( = ?auto_61477 ?auto_61479 ) ) ( not ( = ?auto_61496 ?auto_61479 ) ) ( not ( = ?auto_61475 ?auto_61479 ) ) ( AVAILABLE ?auto_61479 ) ( SURFACE-AT ?auto_61484 ?auto_61489 ) ( ON ?auto_61484 ?auto_61491 ) ( CLEAR ?auto_61484 ) ( not ( = ?auto_61473 ?auto_61491 ) ) ( not ( = ?auto_61474 ?auto_61491 ) ) ( not ( = ?auto_61476 ?auto_61491 ) ) ( not ( = ?auto_61494 ?auto_61491 ) ) ( not ( = ?auto_61488 ?auto_61491 ) ) ( not ( = ?auto_61485 ?auto_61491 ) ) ( not ( = ?auto_61483 ?auto_61491 ) ) ( not ( = ?auto_61484 ?auto_61491 ) ) ( not ( = ?auto_61480 ?auto_61491 ) ) ( not ( = ?auto_61481 ?auto_61491 ) ) ( TRUCK-AT ?auto_61492 ?auto_61486 ) ( SURFACE-AT ?auto_61497 ?auto_61486 ) ( CLEAR ?auto_61497 ) ( LIFTING ?auto_61490 ?auto_61481 ) ( IS-CRATE ?auto_61481 ) ( not ( = ?auto_61473 ?auto_61497 ) ) ( not ( = ?auto_61474 ?auto_61497 ) ) ( not ( = ?auto_61476 ?auto_61497 ) ) ( not ( = ?auto_61494 ?auto_61497 ) ) ( not ( = ?auto_61488 ?auto_61497 ) ) ( not ( = ?auto_61485 ?auto_61497 ) ) ( not ( = ?auto_61483 ?auto_61497 ) ) ( not ( = ?auto_61484 ?auto_61497 ) ) ( not ( = ?auto_61480 ?auto_61497 ) ) ( not ( = ?auto_61481 ?auto_61497 ) ) ( not ( = ?auto_61491 ?auto_61497 ) ) )
    :subtasks
    ( ( !DROP ?auto_61490 ?auto_61481 ?auto_61497 ?auto_61486 )
      ( MAKE-ON ?auto_61473 ?auto_61474 )
      ( MAKE-ON-VERIFY ?auto_61473 ?auto_61474 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61498 - SURFACE
      ?auto_61499 - SURFACE
    )
    :vars
    (
      ?auto_61500 - HOIST
      ?auto_61502 - PLACE
      ?auto_61511 - PLACE
      ?auto_61515 - HOIST
      ?auto_61522 - SURFACE
      ?auto_61508 - SURFACE
      ?auto_61507 - PLACE
      ?auto_61513 - HOIST
      ?auto_61520 - SURFACE
      ?auto_61519 - SURFACE
      ?auto_61517 - PLACE
      ?auto_61518 - HOIST
      ?auto_61512 - SURFACE
      ?auto_61514 - SURFACE
      ?auto_61510 - PLACE
      ?auto_61501 - HOIST
      ?auto_61516 - SURFACE
      ?auto_61504 - SURFACE
      ?auto_61503 - PLACE
      ?auto_61521 - HOIST
      ?auto_61505 - SURFACE
      ?auto_61506 - TRUCK
      ?auto_61509 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61500 ?auto_61502 ) ( IS-CRATE ?auto_61498 ) ( not ( = ?auto_61498 ?auto_61499 ) ) ( not ( = ?auto_61511 ?auto_61502 ) ) ( HOIST-AT ?auto_61515 ?auto_61511 ) ( not ( = ?auto_61500 ?auto_61515 ) ) ( AVAILABLE ?auto_61515 ) ( SURFACE-AT ?auto_61498 ?auto_61511 ) ( ON ?auto_61498 ?auto_61522 ) ( CLEAR ?auto_61498 ) ( not ( = ?auto_61498 ?auto_61522 ) ) ( not ( = ?auto_61499 ?auto_61522 ) ) ( IS-CRATE ?auto_61499 ) ( not ( = ?auto_61498 ?auto_61508 ) ) ( not ( = ?auto_61499 ?auto_61508 ) ) ( not ( = ?auto_61522 ?auto_61508 ) ) ( not ( = ?auto_61507 ?auto_61502 ) ) ( not ( = ?auto_61511 ?auto_61507 ) ) ( HOIST-AT ?auto_61513 ?auto_61507 ) ( not ( = ?auto_61500 ?auto_61513 ) ) ( not ( = ?auto_61515 ?auto_61513 ) ) ( AVAILABLE ?auto_61513 ) ( SURFACE-AT ?auto_61499 ?auto_61507 ) ( ON ?auto_61499 ?auto_61520 ) ( CLEAR ?auto_61499 ) ( not ( = ?auto_61498 ?auto_61520 ) ) ( not ( = ?auto_61499 ?auto_61520 ) ) ( not ( = ?auto_61522 ?auto_61520 ) ) ( not ( = ?auto_61508 ?auto_61520 ) ) ( IS-CRATE ?auto_61508 ) ( not ( = ?auto_61498 ?auto_61519 ) ) ( not ( = ?auto_61499 ?auto_61519 ) ) ( not ( = ?auto_61522 ?auto_61519 ) ) ( not ( = ?auto_61508 ?auto_61519 ) ) ( not ( = ?auto_61520 ?auto_61519 ) ) ( not ( = ?auto_61517 ?auto_61502 ) ) ( not ( = ?auto_61511 ?auto_61517 ) ) ( not ( = ?auto_61507 ?auto_61517 ) ) ( HOIST-AT ?auto_61518 ?auto_61517 ) ( not ( = ?auto_61500 ?auto_61518 ) ) ( not ( = ?auto_61515 ?auto_61518 ) ) ( not ( = ?auto_61513 ?auto_61518 ) ) ( AVAILABLE ?auto_61518 ) ( SURFACE-AT ?auto_61508 ?auto_61517 ) ( ON ?auto_61508 ?auto_61512 ) ( CLEAR ?auto_61508 ) ( not ( = ?auto_61498 ?auto_61512 ) ) ( not ( = ?auto_61499 ?auto_61512 ) ) ( not ( = ?auto_61522 ?auto_61512 ) ) ( not ( = ?auto_61508 ?auto_61512 ) ) ( not ( = ?auto_61520 ?auto_61512 ) ) ( not ( = ?auto_61519 ?auto_61512 ) ) ( IS-CRATE ?auto_61519 ) ( not ( = ?auto_61498 ?auto_61514 ) ) ( not ( = ?auto_61499 ?auto_61514 ) ) ( not ( = ?auto_61522 ?auto_61514 ) ) ( not ( = ?auto_61508 ?auto_61514 ) ) ( not ( = ?auto_61520 ?auto_61514 ) ) ( not ( = ?auto_61519 ?auto_61514 ) ) ( not ( = ?auto_61512 ?auto_61514 ) ) ( not ( = ?auto_61510 ?auto_61502 ) ) ( not ( = ?auto_61511 ?auto_61510 ) ) ( not ( = ?auto_61507 ?auto_61510 ) ) ( not ( = ?auto_61517 ?auto_61510 ) ) ( HOIST-AT ?auto_61501 ?auto_61510 ) ( not ( = ?auto_61500 ?auto_61501 ) ) ( not ( = ?auto_61515 ?auto_61501 ) ) ( not ( = ?auto_61513 ?auto_61501 ) ) ( not ( = ?auto_61518 ?auto_61501 ) ) ( AVAILABLE ?auto_61501 ) ( SURFACE-AT ?auto_61519 ?auto_61510 ) ( ON ?auto_61519 ?auto_61516 ) ( CLEAR ?auto_61519 ) ( not ( = ?auto_61498 ?auto_61516 ) ) ( not ( = ?auto_61499 ?auto_61516 ) ) ( not ( = ?auto_61522 ?auto_61516 ) ) ( not ( = ?auto_61508 ?auto_61516 ) ) ( not ( = ?auto_61520 ?auto_61516 ) ) ( not ( = ?auto_61519 ?auto_61516 ) ) ( not ( = ?auto_61512 ?auto_61516 ) ) ( not ( = ?auto_61514 ?auto_61516 ) ) ( IS-CRATE ?auto_61514 ) ( not ( = ?auto_61498 ?auto_61504 ) ) ( not ( = ?auto_61499 ?auto_61504 ) ) ( not ( = ?auto_61522 ?auto_61504 ) ) ( not ( = ?auto_61508 ?auto_61504 ) ) ( not ( = ?auto_61520 ?auto_61504 ) ) ( not ( = ?auto_61519 ?auto_61504 ) ) ( not ( = ?auto_61512 ?auto_61504 ) ) ( not ( = ?auto_61514 ?auto_61504 ) ) ( not ( = ?auto_61516 ?auto_61504 ) ) ( not ( = ?auto_61503 ?auto_61502 ) ) ( not ( = ?auto_61511 ?auto_61503 ) ) ( not ( = ?auto_61507 ?auto_61503 ) ) ( not ( = ?auto_61517 ?auto_61503 ) ) ( not ( = ?auto_61510 ?auto_61503 ) ) ( HOIST-AT ?auto_61521 ?auto_61503 ) ( not ( = ?auto_61500 ?auto_61521 ) ) ( not ( = ?auto_61515 ?auto_61521 ) ) ( not ( = ?auto_61513 ?auto_61521 ) ) ( not ( = ?auto_61518 ?auto_61521 ) ) ( not ( = ?auto_61501 ?auto_61521 ) ) ( AVAILABLE ?auto_61521 ) ( SURFACE-AT ?auto_61514 ?auto_61503 ) ( ON ?auto_61514 ?auto_61505 ) ( CLEAR ?auto_61514 ) ( not ( = ?auto_61498 ?auto_61505 ) ) ( not ( = ?auto_61499 ?auto_61505 ) ) ( not ( = ?auto_61522 ?auto_61505 ) ) ( not ( = ?auto_61508 ?auto_61505 ) ) ( not ( = ?auto_61520 ?auto_61505 ) ) ( not ( = ?auto_61519 ?auto_61505 ) ) ( not ( = ?auto_61512 ?auto_61505 ) ) ( not ( = ?auto_61514 ?auto_61505 ) ) ( not ( = ?auto_61516 ?auto_61505 ) ) ( not ( = ?auto_61504 ?auto_61505 ) ) ( TRUCK-AT ?auto_61506 ?auto_61502 ) ( SURFACE-AT ?auto_61509 ?auto_61502 ) ( CLEAR ?auto_61509 ) ( IS-CRATE ?auto_61504 ) ( not ( = ?auto_61498 ?auto_61509 ) ) ( not ( = ?auto_61499 ?auto_61509 ) ) ( not ( = ?auto_61522 ?auto_61509 ) ) ( not ( = ?auto_61508 ?auto_61509 ) ) ( not ( = ?auto_61520 ?auto_61509 ) ) ( not ( = ?auto_61519 ?auto_61509 ) ) ( not ( = ?auto_61512 ?auto_61509 ) ) ( not ( = ?auto_61514 ?auto_61509 ) ) ( not ( = ?auto_61516 ?auto_61509 ) ) ( not ( = ?auto_61504 ?auto_61509 ) ) ( not ( = ?auto_61505 ?auto_61509 ) ) ( AVAILABLE ?auto_61500 ) ( IN ?auto_61504 ?auto_61506 ) )
    :subtasks
    ( ( !UNLOAD ?auto_61500 ?auto_61504 ?auto_61506 ?auto_61502 )
      ( MAKE-ON ?auto_61498 ?auto_61499 )
      ( MAKE-ON-VERIFY ?auto_61498 ?auto_61499 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61523 - SURFACE
      ?auto_61524 - SURFACE
    )
    :vars
    (
      ?auto_61547 - HOIST
      ?auto_61531 - PLACE
      ?auto_61528 - PLACE
      ?auto_61539 - HOIST
      ?auto_61538 - SURFACE
      ?auto_61534 - SURFACE
      ?auto_61527 - PLACE
      ?auto_61529 - HOIST
      ?auto_61533 - SURFACE
      ?auto_61525 - SURFACE
      ?auto_61530 - PLACE
      ?auto_61541 - HOIST
      ?auto_61536 - SURFACE
      ?auto_61535 - SURFACE
      ?auto_61543 - PLACE
      ?auto_61532 - HOIST
      ?auto_61542 - SURFACE
      ?auto_61546 - SURFACE
      ?auto_61540 - PLACE
      ?auto_61537 - HOIST
      ?auto_61526 - SURFACE
      ?auto_61545 - SURFACE
      ?auto_61544 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_61547 ?auto_61531 ) ( IS-CRATE ?auto_61523 ) ( not ( = ?auto_61523 ?auto_61524 ) ) ( not ( = ?auto_61528 ?auto_61531 ) ) ( HOIST-AT ?auto_61539 ?auto_61528 ) ( not ( = ?auto_61547 ?auto_61539 ) ) ( AVAILABLE ?auto_61539 ) ( SURFACE-AT ?auto_61523 ?auto_61528 ) ( ON ?auto_61523 ?auto_61538 ) ( CLEAR ?auto_61523 ) ( not ( = ?auto_61523 ?auto_61538 ) ) ( not ( = ?auto_61524 ?auto_61538 ) ) ( IS-CRATE ?auto_61524 ) ( not ( = ?auto_61523 ?auto_61534 ) ) ( not ( = ?auto_61524 ?auto_61534 ) ) ( not ( = ?auto_61538 ?auto_61534 ) ) ( not ( = ?auto_61527 ?auto_61531 ) ) ( not ( = ?auto_61528 ?auto_61527 ) ) ( HOIST-AT ?auto_61529 ?auto_61527 ) ( not ( = ?auto_61547 ?auto_61529 ) ) ( not ( = ?auto_61539 ?auto_61529 ) ) ( AVAILABLE ?auto_61529 ) ( SURFACE-AT ?auto_61524 ?auto_61527 ) ( ON ?auto_61524 ?auto_61533 ) ( CLEAR ?auto_61524 ) ( not ( = ?auto_61523 ?auto_61533 ) ) ( not ( = ?auto_61524 ?auto_61533 ) ) ( not ( = ?auto_61538 ?auto_61533 ) ) ( not ( = ?auto_61534 ?auto_61533 ) ) ( IS-CRATE ?auto_61534 ) ( not ( = ?auto_61523 ?auto_61525 ) ) ( not ( = ?auto_61524 ?auto_61525 ) ) ( not ( = ?auto_61538 ?auto_61525 ) ) ( not ( = ?auto_61534 ?auto_61525 ) ) ( not ( = ?auto_61533 ?auto_61525 ) ) ( not ( = ?auto_61530 ?auto_61531 ) ) ( not ( = ?auto_61528 ?auto_61530 ) ) ( not ( = ?auto_61527 ?auto_61530 ) ) ( HOIST-AT ?auto_61541 ?auto_61530 ) ( not ( = ?auto_61547 ?auto_61541 ) ) ( not ( = ?auto_61539 ?auto_61541 ) ) ( not ( = ?auto_61529 ?auto_61541 ) ) ( AVAILABLE ?auto_61541 ) ( SURFACE-AT ?auto_61534 ?auto_61530 ) ( ON ?auto_61534 ?auto_61536 ) ( CLEAR ?auto_61534 ) ( not ( = ?auto_61523 ?auto_61536 ) ) ( not ( = ?auto_61524 ?auto_61536 ) ) ( not ( = ?auto_61538 ?auto_61536 ) ) ( not ( = ?auto_61534 ?auto_61536 ) ) ( not ( = ?auto_61533 ?auto_61536 ) ) ( not ( = ?auto_61525 ?auto_61536 ) ) ( IS-CRATE ?auto_61525 ) ( not ( = ?auto_61523 ?auto_61535 ) ) ( not ( = ?auto_61524 ?auto_61535 ) ) ( not ( = ?auto_61538 ?auto_61535 ) ) ( not ( = ?auto_61534 ?auto_61535 ) ) ( not ( = ?auto_61533 ?auto_61535 ) ) ( not ( = ?auto_61525 ?auto_61535 ) ) ( not ( = ?auto_61536 ?auto_61535 ) ) ( not ( = ?auto_61543 ?auto_61531 ) ) ( not ( = ?auto_61528 ?auto_61543 ) ) ( not ( = ?auto_61527 ?auto_61543 ) ) ( not ( = ?auto_61530 ?auto_61543 ) ) ( HOIST-AT ?auto_61532 ?auto_61543 ) ( not ( = ?auto_61547 ?auto_61532 ) ) ( not ( = ?auto_61539 ?auto_61532 ) ) ( not ( = ?auto_61529 ?auto_61532 ) ) ( not ( = ?auto_61541 ?auto_61532 ) ) ( AVAILABLE ?auto_61532 ) ( SURFACE-AT ?auto_61525 ?auto_61543 ) ( ON ?auto_61525 ?auto_61542 ) ( CLEAR ?auto_61525 ) ( not ( = ?auto_61523 ?auto_61542 ) ) ( not ( = ?auto_61524 ?auto_61542 ) ) ( not ( = ?auto_61538 ?auto_61542 ) ) ( not ( = ?auto_61534 ?auto_61542 ) ) ( not ( = ?auto_61533 ?auto_61542 ) ) ( not ( = ?auto_61525 ?auto_61542 ) ) ( not ( = ?auto_61536 ?auto_61542 ) ) ( not ( = ?auto_61535 ?auto_61542 ) ) ( IS-CRATE ?auto_61535 ) ( not ( = ?auto_61523 ?auto_61546 ) ) ( not ( = ?auto_61524 ?auto_61546 ) ) ( not ( = ?auto_61538 ?auto_61546 ) ) ( not ( = ?auto_61534 ?auto_61546 ) ) ( not ( = ?auto_61533 ?auto_61546 ) ) ( not ( = ?auto_61525 ?auto_61546 ) ) ( not ( = ?auto_61536 ?auto_61546 ) ) ( not ( = ?auto_61535 ?auto_61546 ) ) ( not ( = ?auto_61542 ?auto_61546 ) ) ( not ( = ?auto_61540 ?auto_61531 ) ) ( not ( = ?auto_61528 ?auto_61540 ) ) ( not ( = ?auto_61527 ?auto_61540 ) ) ( not ( = ?auto_61530 ?auto_61540 ) ) ( not ( = ?auto_61543 ?auto_61540 ) ) ( HOIST-AT ?auto_61537 ?auto_61540 ) ( not ( = ?auto_61547 ?auto_61537 ) ) ( not ( = ?auto_61539 ?auto_61537 ) ) ( not ( = ?auto_61529 ?auto_61537 ) ) ( not ( = ?auto_61541 ?auto_61537 ) ) ( not ( = ?auto_61532 ?auto_61537 ) ) ( AVAILABLE ?auto_61537 ) ( SURFACE-AT ?auto_61535 ?auto_61540 ) ( ON ?auto_61535 ?auto_61526 ) ( CLEAR ?auto_61535 ) ( not ( = ?auto_61523 ?auto_61526 ) ) ( not ( = ?auto_61524 ?auto_61526 ) ) ( not ( = ?auto_61538 ?auto_61526 ) ) ( not ( = ?auto_61534 ?auto_61526 ) ) ( not ( = ?auto_61533 ?auto_61526 ) ) ( not ( = ?auto_61525 ?auto_61526 ) ) ( not ( = ?auto_61536 ?auto_61526 ) ) ( not ( = ?auto_61535 ?auto_61526 ) ) ( not ( = ?auto_61542 ?auto_61526 ) ) ( not ( = ?auto_61546 ?auto_61526 ) ) ( SURFACE-AT ?auto_61545 ?auto_61531 ) ( CLEAR ?auto_61545 ) ( IS-CRATE ?auto_61546 ) ( not ( = ?auto_61523 ?auto_61545 ) ) ( not ( = ?auto_61524 ?auto_61545 ) ) ( not ( = ?auto_61538 ?auto_61545 ) ) ( not ( = ?auto_61534 ?auto_61545 ) ) ( not ( = ?auto_61533 ?auto_61545 ) ) ( not ( = ?auto_61525 ?auto_61545 ) ) ( not ( = ?auto_61536 ?auto_61545 ) ) ( not ( = ?auto_61535 ?auto_61545 ) ) ( not ( = ?auto_61542 ?auto_61545 ) ) ( not ( = ?auto_61546 ?auto_61545 ) ) ( not ( = ?auto_61526 ?auto_61545 ) ) ( AVAILABLE ?auto_61547 ) ( IN ?auto_61546 ?auto_61544 ) ( TRUCK-AT ?auto_61544 ?auto_61527 ) )
    :subtasks
    ( ( !DRIVE ?auto_61544 ?auto_61527 ?auto_61531 )
      ( MAKE-ON ?auto_61523 ?auto_61524 )
      ( MAKE-ON-VERIFY ?auto_61523 ?auto_61524 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61548 - SURFACE
      ?auto_61549 - SURFACE
    )
    :vars
    (
      ?auto_61556 - HOIST
      ?auto_61557 - PLACE
      ?auto_61559 - PLACE
      ?auto_61551 - HOIST
      ?auto_61563 - SURFACE
      ?auto_61566 - SURFACE
      ?auto_61569 - PLACE
      ?auto_61564 - HOIST
      ?auto_61558 - SURFACE
      ?auto_61562 - SURFACE
      ?auto_61560 - PLACE
      ?auto_61550 - HOIST
      ?auto_61567 - SURFACE
      ?auto_61565 - SURFACE
      ?auto_61571 - PLACE
      ?auto_61552 - HOIST
      ?auto_61570 - SURFACE
      ?auto_61555 - SURFACE
      ?auto_61561 - PLACE
      ?auto_61568 - HOIST
      ?auto_61553 - SURFACE
      ?auto_61554 - SURFACE
      ?auto_61572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_61556 ?auto_61557 ) ( IS-CRATE ?auto_61548 ) ( not ( = ?auto_61548 ?auto_61549 ) ) ( not ( = ?auto_61559 ?auto_61557 ) ) ( HOIST-AT ?auto_61551 ?auto_61559 ) ( not ( = ?auto_61556 ?auto_61551 ) ) ( AVAILABLE ?auto_61551 ) ( SURFACE-AT ?auto_61548 ?auto_61559 ) ( ON ?auto_61548 ?auto_61563 ) ( CLEAR ?auto_61548 ) ( not ( = ?auto_61548 ?auto_61563 ) ) ( not ( = ?auto_61549 ?auto_61563 ) ) ( IS-CRATE ?auto_61549 ) ( not ( = ?auto_61548 ?auto_61566 ) ) ( not ( = ?auto_61549 ?auto_61566 ) ) ( not ( = ?auto_61563 ?auto_61566 ) ) ( not ( = ?auto_61569 ?auto_61557 ) ) ( not ( = ?auto_61559 ?auto_61569 ) ) ( HOIST-AT ?auto_61564 ?auto_61569 ) ( not ( = ?auto_61556 ?auto_61564 ) ) ( not ( = ?auto_61551 ?auto_61564 ) ) ( SURFACE-AT ?auto_61549 ?auto_61569 ) ( ON ?auto_61549 ?auto_61558 ) ( CLEAR ?auto_61549 ) ( not ( = ?auto_61548 ?auto_61558 ) ) ( not ( = ?auto_61549 ?auto_61558 ) ) ( not ( = ?auto_61563 ?auto_61558 ) ) ( not ( = ?auto_61566 ?auto_61558 ) ) ( IS-CRATE ?auto_61566 ) ( not ( = ?auto_61548 ?auto_61562 ) ) ( not ( = ?auto_61549 ?auto_61562 ) ) ( not ( = ?auto_61563 ?auto_61562 ) ) ( not ( = ?auto_61566 ?auto_61562 ) ) ( not ( = ?auto_61558 ?auto_61562 ) ) ( not ( = ?auto_61560 ?auto_61557 ) ) ( not ( = ?auto_61559 ?auto_61560 ) ) ( not ( = ?auto_61569 ?auto_61560 ) ) ( HOIST-AT ?auto_61550 ?auto_61560 ) ( not ( = ?auto_61556 ?auto_61550 ) ) ( not ( = ?auto_61551 ?auto_61550 ) ) ( not ( = ?auto_61564 ?auto_61550 ) ) ( AVAILABLE ?auto_61550 ) ( SURFACE-AT ?auto_61566 ?auto_61560 ) ( ON ?auto_61566 ?auto_61567 ) ( CLEAR ?auto_61566 ) ( not ( = ?auto_61548 ?auto_61567 ) ) ( not ( = ?auto_61549 ?auto_61567 ) ) ( not ( = ?auto_61563 ?auto_61567 ) ) ( not ( = ?auto_61566 ?auto_61567 ) ) ( not ( = ?auto_61558 ?auto_61567 ) ) ( not ( = ?auto_61562 ?auto_61567 ) ) ( IS-CRATE ?auto_61562 ) ( not ( = ?auto_61548 ?auto_61565 ) ) ( not ( = ?auto_61549 ?auto_61565 ) ) ( not ( = ?auto_61563 ?auto_61565 ) ) ( not ( = ?auto_61566 ?auto_61565 ) ) ( not ( = ?auto_61558 ?auto_61565 ) ) ( not ( = ?auto_61562 ?auto_61565 ) ) ( not ( = ?auto_61567 ?auto_61565 ) ) ( not ( = ?auto_61571 ?auto_61557 ) ) ( not ( = ?auto_61559 ?auto_61571 ) ) ( not ( = ?auto_61569 ?auto_61571 ) ) ( not ( = ?auto_61560 ?auto_61571 ) ) ( HOIST-AT ?auto_61552 ?auto_61571 ) ( not ( = ?auto_61556 ?auto_61552 ) ) ( not ( = ?auto_61551 ?auto_61552 ) ) ( not ( = ?auto_61564 ?auto_61552 ) ) ( not ( = ?auto_61550 ?auto_61552 ) ) ( AVAILABLE ?auto_61552 ) ( SURFACE-AT ?auto_61562 ?auto_61571 ) ( ON ?auto_61562 ?auto_61570 ) ( CLEAR ?auto_61562 ) ( not ( = ?auto_61548 ?auto_61570 ) ) ( not ( = ?auto_61549 ?auto_61570 ) ) ( not ( = ?auto_61563 ?auto_61570 ) ) ( not ( = ?auto_61566 ?auto_61570 ) ) ( not ( = ?auto_61558 ?auto_61570 ) ) ( not ( = ?auto_61562 ?auto_61570 ) ) ( not ( = ?auto_61567 ?auto_61570 ) ) ( not ( = ?auto_61565 ?auto_61570 ) ) ( IS-CRATE ?auto_61565 ) ( not ( = ?auto_61548 ?auto_61555 ) ) ( not ( = ?auto_61549 ?auto_61555 ) ) ( not ( = ?auto_61563 ?auto_61555 ) ) ( not ( = ?auto_61566 ?auto_61555 ) ) ( not ( = ?auto_61558 ?auto_61555 ) ) ( not ( = ?auto_61562 ?auto_61555 ) ) ( not ( = ?auto_61567 ?auto_61555 ) ) ( not ( = ?auto_61565 ?auto_61555 ) ) ( not ( = ?auto_61570 ?auto_61555 ) ) ( not ( = ?auto_61561 ?auto_61557 ) ) ( not ( = ?auto_61559 ?auto_61561 ) ) ( not ( = ?auto_61569 ?auto_61561 ) ) ( not ( = ?auto_61560 ?auto_61561 ) ) ( not ( = ?auto_61571 ?auto_61561 ) ) ( HOIST-AT ?auto_61568 ?auto_61561 ) ( not ( = ?auto_61556 ?auto_61568 ) ) ( not ( = ?auto_61551 ?auto_61568 ) ) ( not ( = ?auto_61564 ?auto_61568 ) ) ( not ( = ?auto_61550 ?auto_61568 ) ) ( not ( = ?auto_61552 ?auto_61568 ) ) ( AVAILABLE ?auto_61568 ) ( SURFACE-AT ?auto_61565 ?auto_61561 ) ( ON ?auto_61565 ?auto_61553 ) ( CLEAR ?auto_61565 ) ( not ( = ?auto_61548 ?auto_61553 ) ) ( not ( = ?auto_61549 ?auto_61553 ) ) ( not ( = ?auto_61563 ?auto_61553 ) ) ( not ( = ?auto_61566 ?auto_61553 ) ) ( not ( = ?auto_61558 ?auto_61553 ) ) ( not ( = ?auto_61562 ?auto_61553 ) ) ( not ( = ?auto_61567 ?auto_61553 ) ) ( not ( = ?auto_61565 ?auto_61553 ) ) ( not ( = ?auto_61570 ?auto_61553 ) ) ( not ( = ?auto_61555 ?auto_61553 ) ) ( SURFACE-AT ?auto_61554 ?auto_61557 ) ( CLEAR ?auto_61554 ) ( IS-CRATE ?auto_61555 ) ( not ( = ?auto_61548 ?auto_61554 ) ) ( not ( = ?auto_61549 ?auto_61554 ) ) ( not ( = ?auto_61563 ?auto_61554 ) ) ( not ( = ?auto_61566 ?auto_61554 ) ) ( not ( = ?auto_61558 ?auto_61554 ) ) ( not ( = ?auto_61562 ?auto_61554 ) ) ( not ( = ?auto_61567 ?auto_61554 ) ) ( not ( = ?auto_61565 ?auto_61554 ) ) ( not ( = ?auto_61570 ?auto_61554 ) ) ( not ( = ?auto_61555 ?auto_61554 ) ) ( not ( = ?auto_61553 ?auto_61554 ) ) ( AVAILABLE ?auto_61556 ) ( TRUCK-AT ?auto_61572 ?auto_61569 ) ( LIFTING ?auto_61564 ?auto_61555 ) )
    :subtasks
    ( ( !LOAD ?auto_61564 ?auto_61555 ?auto_61572 ?auto_61569 )
      ( MAKE-ON ?auto_61548 ?auto_61549 )
      ( MAKE-ON-VERIFY ?auto_61548 ?auto_61549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61573 - SURFACE
      ?auto_61574 - SURFACE
    )
    :vars
    (
      ?auto_61578 - HOIST
      ?auto_61589 - PLACE
      ?auto_61575 - PLACE
      ?auto_61591 - HOIST
      ?auto_61577 - SURFACE
      ?auto_61579 - SURFACE
      ?auto_61597 - PLACE
      ?auto_61583 - HOIST
      ?auto_61587 - SURFACE
      ?auto_61594 - SURFACE
      ?auto_61596 - PLACE
      ?auto_61582 - HOIST
      ?auto_61585 - SURFACE
      ?auto_61586 - SURFACE
      ?auto_61576 - PLACE
      ?auto_61590 - HOIST
      ?auto_61584 - SURFACE
      ?auto_61588 - SURFACE
      ?auto_61595 - PLACE
      ?auto_61581 - HOIST
      ?auto_61592 - SURFACE
      ?auto_61593 - SURFACE
      ?auto_61580 - TRUCK
      ?auto_61598 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61578 ?auto_61589 ) ( IS-CRATE ?auto_61573 ) ( not ( = ?auto_61573 ?auto_61574 ) ) ( not ( = ?auto_61575 ?auto_61589 ) ) ( HOIST-AT ?auto_61591 ?auto_61575 ) ( not ( = ?auto_61578 ?auto_61591 ) ) ( AVAILABLE ?auto_61591 ) ( SURFACE-AT ?auto_61573 ?auto_61575 ) ( ON ?auto_61573 ?auto_61577 ) ( CLEAR ?auto_61573 ) ( not ( = ?auto_61573 ?auto_61577 ) ) ( not ( = ?auto_61574 ?auto_61577 ) ) ( IS-CRATE ?auto_61574 ) ( not ( = ?auto_61573 ?auto_61579 ) ) ( not ( = ?auto_61574 ?auto_61579 ) ) ( not ( = ?auto_61577 ?auto_61579 ) ) ( not ( = ?auto_61597 ?auto_61589 ) ) ( not ( = ?auto_61575 ?auto_61597 ) ) ( HOIST-AT ?auto_61583 ?auto_61597 ) ( not ( = ?auto_61578 ?auto_61583 ) ) ( not ( = ?auto_61591 ?auto_61583 ) ) ( SURFACE-AT ?auto_61574 ?auto_61597 ) ( ON ?auto_61574 ?auto_61587 ) ( CLEAR ?auto_61574 ) ( not ( = ?auto_61573 ?auto_61587 ) ) ( not ( = ?auto_61574 ?auto_61587 ) ) ( not ( = ?auto_61577 ?auto_61587 ) ) ( not ( = ?auto_61579 ?auto_61587 ) ) ( IS-CRATE ?auto_61579 ) ( not ( = ?auto_61573 ?auto_61594 ) ) ( not ( = ?auto_61574 ?auto_61594 ) ) ( not ( = ?auto_61577 ?auto_61594 ) ) ( not ( = ?auto_61579 ?auto_61594 ) ) ( not ( = ?auto_61587 ?auto_61594 ) ) ( not ( = ?auto_61596 ?auto_61589 ) ) ( not ( = ?auto_61575 ?auto_61596 ) ) ( not ( = ?auto_61597 ?auto_61596 ) ) ( HOIST-AT ?auto_61582 ?auto_61596 ) ( not ( = ?auto_61578 ?auto_61582 ) ) ( not ( = ?auto_61591 ?auto_61582 ) ) ( not ( = ?auto_61583 ?auto_61582 ) ) ( AVAILABLE ?auto_61582 ) ( SURFACE-AT ?auto_61579 ?auto_61596 ) ( ON ?auto_61579 ?auto_61585 ) ( CLEAR ?auto_61579 ) ( not ( = ?auto_61573 ?auto_61585 ) ) ( not ( = ?auto_61574 ?auto_61585 ) ) ( not ( = ?auto_61577 ?auto_61585 ) ) ( not ( = ?auto_61579 ?auto_61585 ) ) ( not ( = ?auto_61587 ?auto_61585 ) ) ( not ( = ?auto_61594 ?auto_61585 ) ) ( IS-CRATE ?auto_61594 ) ( not ( = ?auto_61573 ?auto_61586 ) ) ( not ( = ?auto_61574 ?auto_61586 ) ) ( not ( = ?auto_61577 ?auto_61586 ) ) ( not ( = ?auto_61579 ?auto_61586 ) ) ( not ( = ?auto_61587 ?auto_61586 ) ) ( not ( = ?auto_61594 ?auto_61586 ) ) ( not ( = ?auto_61585 ?auto_61586 ) ) ( not ( = ?auto_61576 ?auto_61589 ) ) ( not ( = ?auto_61575 ?auto_61576 ) ) ( not ( = ?auto_61597 ?auto_61576 ) ) ( not ( = ?auto_61596 ?auto_61576 ) ) ( HOIST-AT ?auto_61590 ?auto_61576 ) ( not ( = ?auto_61578 ?auto_61590 ) ) ( not ( = ?auto_61591 ?auto_61590 ) ) ( not ( = ?auto_61583 ?auto_61590 ) ) ( not ( = ?auto_61582 ?auto_61590 ) ) ( AVAILABLE ?auto_61590 ) ( SURFACE-AT ?auto_61594 ?auto_61576 ) ( ON ?auto_61594 ?auto_61584 ) ( CLEAR ?auto_61594 ) ( not ( = ?auto_61573 ?auto_61584 ) ) ( not ( = ?auto_61574 ?auto_61584 ) ) ( not ( = ?auto_61577 ?auto_61584 ) ) ( not ( = ?auto_61579 ?auto_61584 ) ) ( not ( = ?auto_61587 ?auto_61584 ) ) ( not ( = ?auto_61594 ?auto_61584 ) ) ( not ( = ?auto_61585 ?auto_61584 ) ) ( not ( = ?auto_61586 ?auto_61584 ) ) ( IS-CRATE ?auto_61586 ) ( not ( = ?auto_61573 ?auto_61588 ) ) ( not ( = ?auto_61574 ?auto_61588 ) ) ( not ( = ?auto_61577 ?auto_61588 ) ) ( not ( = ?auto_61579 ?auto_61588 ) ) ( not ( = ?auto_61587 ?auto_61588 ) ) ( not ( = ?auto_61594 ?auto_61588 ) ) ( not ( = ?auto_61585 ?auto_61588 ) ) ( not ( = ?auto_61586 ?auto_61588 ) ) ( not ( = ?auto_61584 ?auto_61588 ) ) ( not ( = ?auto_61595 ?auto_61589 ) ) ( not ( = ?auto_61575 ?auto_61595 ) ) ( not ( = ?auto_61597 ?auto_61595 ) ) ( not ( = ?auto_61596 ?auto_61595 ) ) ( not ( = ?auto_61576 ?auto_61595 ) ) ( HOIST-AT ?auto_61581 ?auto_61595 ) ( not ( = ?auto_61578 ?auto_61581 ) ) ( not ( = ?auto_61591 ?auto_61581 ) ) ( not ( = ?auto_61583 ?auto_61581 ) ) ( not ( = ?auto_61582 ?auto_61581 ) ) ( not ( = ?auto_61590 ?auto_61581 ) ) ( AVAILABLE ?auto_61581 ) ( SURFACE-AT ?auto_61586 ?auto_61595 ) ( ON ?auto_61586 ?auto_61592 ) ( CLEAR ?auto_61586 ) ( not ( = ?auto_61573 ?auto_61592 ) ) ( not ( = ?auto_61574 ?auto_61592 ) ) ( not ( = ?auto_61577 ?auto_61592 ) ) ( not ( = ?auto_61579 ?auto_61592 ) ) ( not ( = ?auto_61587 ?auto_61592 ) ) ( not ( = ?auto_61594 ?auto_61592 ) ) ( not ( = ?auto_61585 ?auto_61592 ) ) ( not ( = ?auto_61586 ?auto_61592 ) ) ( not ( = ?auto_61584 ?auto_61592 ) ) ( not ( = ?auto_61588 ?auto_61592 ) ) ( SURFACE-AT ?auto_61593 ?auto_61589 ) ( CLEAR ?auto_61593 ) ( IS-CRATE ?auto_61588 ) ( not ( = ?auto_61573 ?auto_61593 ) ) ( not ( = ?auto_61574 ?auto_61593 ) ) ( not ( = ?auto_61577 ?auto_61593 ) ) ( not ( = ?auto_61579 ?auto_61593 ) ) ( not ( = ?auto_61587 ?auto_61593 ) ) ( not ( = ?auto_61594 ?auto_61593 ) ) ( not ( = ?auto_61585 ?auto_61593 ) ) ( not ( = ?auto_61586 ?auto_61593 ) ) ( not ( = ?auto_61584 ?auto_61593 ) ) ( not ( = ?auto_61588 ?auto_61593 ) ) ( not ( = ?auto_61592 ?auto_61593 ) ) ( AVAILABLE ?auto_61578 ) ( TRUCK-AT ?auto_61580 ?auto_61597 ) ( AVAILABLE ?auto_61583 ) ( SURFACE-AT ?auto_61588 ?auto_61597 ) ( ON ?auto_61588 ?auto_61598 ) ( CLEAR ?auto_61588 ) ( not ( = ?auto_61573 ?auto_61598 ) ) ( not ( = ?auto_61574 ?auto_61598 ) ) ( not ( = ?auto_61577 ?auto_61598 ) ) ( not ( = ?auto_61579 ?auto_61598 ) ) ( not ( = ?auto_61587 ?auto_61598 ) ) ( not ( = ?auto_61594 ?auto_61598 ) ) ( not ( = ?auto_61585 ?auto_61598 ) ) ( not ( = ?auto_61586 ?auto_61598 ) ) ( not ( = ?auto_61584 ?auto_61598 ) ) ( not ( = ?auto_61588 ?auto_61598 ) ) ( not ( = ?auto_61592 ?auto_61598 ) ) ( not ( = ?auto_61593 ?auto_61598 ) ) )
    :subtasks
    ( ( !LIFT ?auto_61583 ?auto_61588 ?auto_61598 ?auto_61597 )
      ( MAKE-ON ?auto_61573 ?auto_61574 )
      ( MAKE-ON-VERIFY ?auto_61573 ?auto_61574 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61599 - SURFACE
      ?auto_61600 - SURFACE
    )
    :vars
    (
      ?auto_61608 - HOIST
      ?auto_61621 - PLACE
      ?auto_61620 - PLACE
      ?auto_61612 - HOIST
      ?auto_61609 - SURFACE
      ?auto_61602 - SURFACE
      ?auto_61603 - PLACE
      ?auto_61613 - HOIST
      ?auto_61605 - SURFACE
      ?auto_61614 - SURFACE
      ?auto_61604 - PLACE
      ?auto_61618 - HOIST
      ?auto_61607 - SURFACE
      ?auto_61606 - SURFACE
      ?auto_61616 - PLACE
      ?auto_61619 - HOIST
      ?auto_61601 - SURFACE
      ?auto_61617 - SURFACE
      ?auto_61615 - PLACE
      ?auto_61622 - HOIST
      ?auto_61610 - SURFACE
      ?auto_61611 - SURFACE
      ?auto_61623 - SURFACE
      ?auto_61624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_61608 ?auto_61621 ) ( IS-CRATE ?auto_61599 ) ( not ( = ?auto_61599 ?auto_61600 ) ) ( not ( = ?auto_61620 ?auto_61621 ) ) ( HOIST-AT ?auto_61612 ?auto_61620 ) ( not ( = ?auto_61608 ?auto_61612 ) ) ( AVAILABLE ?auto_61612 ) ( SURFACE-AT ?auto_61599 ?auto_61620 ) ( ON ?auto_61599 ?auto_61609 ) ( CLEAR ?auto_61599 ) ( not ( = ?auto_61599 ?auto_61609 ) ) ( not ( = ?auto_61600 ?auto_61609 ) ) ( IS-CRATE ?auto_61600 ) ( not ( = ?auto_61599 ?auto_61602 ) ) ( not ( = ?auto_61600 ?auto_61602 ) ) ( not ( = ?auto_61609 ?auto_61602 ) ) ( not ( = ?auto_61603 ?auto_61621 ) ) ( not ( = ?auto_61620 ?auto_61603 ) ) ( HOIST-AT ?auto_61613 ?auto_61603 ) ( not ( = ?auto_61608 ?auto_61613 ) ) ( not ( = ?auto_61612 ?auto_61613 ) ) ( SURFACE-AT ?auto_61600 ?auto_61603 ) ( ON ?auto_61600 ?auto_61605 ) ( CLEAR ?auto_61600 ) ( not ( = ?auto_61599 ?auto_61605 ) ) ( not ( = ?auto_61600 ?auto_61605 ) ) ( not ( = ?auto_61609 ?auto_61605 ) ) ( not ( = ?auto_61602 ?auto_61605 ) ) ( IS-CRATE ?auto_61602 ) ( not ( = ?auto_61599 ?auto_61614 ) ) ( not ( = ?auto_61600 ?auto_61614 ) ) ( not ( = ?auto_61609 ?auto_61614 ) ) ( not ( = ?auto_61602 ?auto_61614 ) ) ( not ( = ?auto_61605 ?auto_61614 ) ) ( not ( = ?auto_61604 ?auto_61621 ) ) ( not ( = ?auto_61620 ?auto_61604 ) ) ( not ( = ?auto_61603 ?auto_61604 ) ) ( HOIST-AT ?auto_61618 ?auto_61604 ) ( not ( = ?auto_61608 ?auto_61618 ) ) ( not ( = ?auto_61612 ?auto_61618 ) ) ( not ( = ?auto_61613 ?auto_61618 ) ) ( AVAILABLE ?auto_61618 ) ( SURFACE-AT ?auto_61602 ?auto_61604 ) ( ON ?auto_61602 ?auto_61607 ) ( CLEAR ?auto_61602 ) ( not ( = ?auto_61599 ?auto_61607 ) ) ( not ( = ?auto_61600 ?auto_61607 ) ) ( not ( = ?auto_61609 ?auto_61607 ) ) ( not ( = ?auto_61602 ?auto_61607 ) ) ( not ( = ?auto_61605 ?auto_61607 ) ) ( not ( = ?auto_61614 ?auto_61607 ) ) ( IS-CRATE ?auto_61614 ) ( not ( = ?auto_61599 ?auto_61606 ) ) ( not ( = ?auto_61600 ?auto_61606 ) ) ( not ( = ?auto_61609 ?auto_61606 ) ) ( not ( = ?auto_61602 ?auto_61606 ) ) ( not ( = ?auto_61605 ?auto_61606 ) ) ( not ( = ?auto_61614 ?auto_61606 ) ) ( not ( = ?auto_61607 ?auto_61606 ) ) ( not ( = ?auto_61616 ?auto_61621 ) ) ( not ( = ?auto_61620 ?auto_61616 ) ) ( not ( = ?auto_61603 ?auto_61616 ) ) ( not ( = ?auto_61604 ?auto_61616 ) ) ( HOIST-AT ?auto_61619 ?auto_61616 ) ( not ( = ?auto_61608 ?auto_61619 ) ) ( not ( = ?auto_61612 ?auto_61619 ) ) ( not ( = ?auto_61613 ?auto_61619 ) ) ( not ( = ?auto_61618 ?auto_61619 ) ) ( AVAILABLE ?auto_61619 ) ( SURFACE-AT ?auto_61614 ?auto_61616 ) ( ON ?auto_61614 ?auto_61601 ) ( CLEAR ?auto_61614 ) ( not ( = ?auto_61599 ?auto_61601 ) ) ( not ( = ?auto_61600 ?auto_61601 ) ) ( not ( = ?auto_61609 ?auto_61601 ) ) ( not ( = ?auto_61602 ?auto_61601 ) ) ( not ( = ?auto_61605 ?auto_61601 ) ) ( not ( = ?auto_61614 ?auto_61601 ) ) ( not ( = ?auto_61607 ?auto_61601 ) ) ( not ( = ?auto_61606 ?auto_61601 ) ) ( IS-CRATE ?auto_61606 ) ( not ( = ?auto_61599 ?auto_61617 ) ) ( not ( = ?auto_61600 ?auto_61617 ) ) ( not ( = ?auto_61609 ?auto_61617 ) ) ( not ( = ?auto_61602 ?auto_61617 ) ) ( not ( = ?auto_61605 ?auto_61617 ) ) ( not ( = ?auto_61614 ?auto_61617 ) ) ( not ( = ?auto_61607 ?auto_61617 ) ) ( not ( = ?auto_61606 ?auto_61617 ) ) ( not ( = ?auto_61601 ?auto_61617 ) ) ( not ( = ?auto_61615 ?auto_61621 ) ) ( not ( = ?auto_61620 ?auto_61615 ) ) ( not ( = ?auto_61603 ?auto_61615 ) ) ( not ( = ?auto_61604 ?auto_61615 ) ) ( not ( = ?auto_61616 ?auto_61615 ) ) ( HOIST-AT ?auto_61622 ?auto_61615 ) ( not ( = ?auto_61608 ?auto_61622 ) ) ( not ( = ?auto_61612 ?auto_61622 ) ) ( not ( = ?auto_61613 ?auto_61622 ) ) ( not ( = ?auto_61618 ?auto_61622 ) ) ( not ( = ?auto_61619 ?auto_61622 ) ) ( AVAILABLE ?auto_61622 ) ( SURFACE-AT ?auto_61606 ?auto_61615 ) ( ON ?auto_61606 ?auto_61610 ) ( CLEAR ?auto_61606 ) ( not ( = ?auto_61599 ?auto_61610 ) ) ( not ( = ?auto_61600 ?auto_61610 ) ) ( not ( = ?auto_61609 ?auto_61610 ) ) ( not ( = ?auto_61602 ?auto_61610 ) ) ( not ( = ?auto_61605 ?auto_61610 ) ) ( not ( = ?auto_61614 ?auto_61610 ) ) ( not ( = ?auto_61607 ?auto_61610 ) ) ( not ( = ?auto_61606 ?auto_61610 ) ) ( not ( = ?auto_61601 ?auto_61610 ) ) ( not ( = ?auto_61617 ?auto_61610 ) ) ( SURFACE-AT ?auto_61611 ?auto_61621 ) ( CLEAR ?auto_61611 ) ( IS-CRATE ?auto_61617 ) ( not ( = ?auto_61599 ?auto_61611 ) ) ( not ( = ?auto_61600 ?auto_61611 ) ) ( not ( = ?auto_61609 ?auto_61611 ) ) ( not ( = ?auto_61602 ?auto_61611 ) ) ( not ( = ?auto_61605 ?auto_61611 ) ) ( not ( = ?auto_61614 ?auto_61611 ) ) ( not ( = ?auto_61607 ?auto_61611 ) ) ( not ( = ?auto_61606 ?auto_61611 ) ) ( not ( = ?auto_61601 ?auto_61611 ) ) ( not ( = ?auto_61617 ?auto_61611 ) ) ( not ( = ?auto_61610 ?auto_61611 ) ) ( AVAILABLE ?auto_61608 ) ( AVAILABLE ?auto_61613 ) ( SURFACE-AT ?auto_61617 ?auto_61603 ) ( ON ?auto_61617 ?auto_61623 ) ( CLEAR ?auto_61617 ) ( not ( = ?auto_61599 ?auto_61623 ) ) ( not ( = ?auto_61600 ?auto_61623 ) ) ( not ( = ?auto_61609 ?auto_61623 ) ) ( not ( = ?auto_61602 ?auto_61623 ) ) ( not ( = ?auto_61605 ?auto_61623 ) ) ( not ( = ?auto_61614 ?auto_61623 ) ) ( not ( = ?auto_61607 ?auto_61623 ) ) ( not ( = ?auto_61606 ?auto_61623 ) ) ( not ( = ?auto_61601 ?auto_61623 ) ) ( not ( = ?auto_61617 ?auto_61623 ) ) ( not ( = ?auto_61610 ?auto_61623 ) ) ( not ( = ?auto_61611 ?auto_61623 ) ) ( TRUCK-AT ?auto_61624 ?auto_61621 ) )
    :subtasks
    ( ( !DRIVE ?auto_61624 ?auto_61621 ?auto_61603 )
      ( MAKE-ON ?auto_61599 ?auto_61600 )
      ( MAKE-ON-VERIFY ?auto_61599 ?auto_61600 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61625 - SURFACE
      ?auto_61626 - SURFACE
    )
    :vars
    (
      ?auto_61632 - HOIST
      ?auto_61638 - PLACE
      ?auto_61628 - PLACE
      ?auto_61648 - HOIST
      ?auto_61643 - SURFACE
      ?auto_61644 - SURFACE
      ?auto_61646 - PLACE
      ?auto_61640 - HOIST
      ?auto_61631 - SURFACE
      ?auto_61647 - SURFACE
      ?auto_61630 - PLACE
      ?auto_61639 - HOIST
      ?auto_61642 - SURFACE
      ?auto_61649 - SURFACE
      ?auto_61636 - PLACE
      ?auto_61634 - HOIST
      ?auto_61641 - SURFACE
      ?auto_61627 - SURFACE
      ?auto_61645 - PLACE
      ?auto_61637 - HOIST
      ?auto_61633 - SURFACE
      ?auto_61629 - SURFACE
      ?auto_61635 - SURFACE
      ?auto_61650 - TRUCK
      ?auto_61651 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61632 ?auto_61638 ) ( IS-CRATE ?auto_61625 ) ( not ( = ?auto_61625 ?auto_61626 ) ) ( not ( = ?auto_61628 ?auto_61638 ) ) ( HOIST-AT ?auto_61648 ?auto_61628 ) ( not ( = ?auto_61632 ?auto_61648 ) ) ( AVAILABLE ?auto_61648 ) ( SURFACE-AT ?auto_61625 ?auto_61628 ) ( ON ?auto_61625 ?auto_61643 ) ( CLEAR ?auto_61625 ) ( not ( = ?auto_61625 ?auto_61643 ) ) ( not ( = ?auto_61626 ?auto_61643 ) ) ( IS-CRATE ?auto_61626 ) ( not ( = ?auto_61625 ?auto_61644 ) ) ( not ( = ?auto_61626 ?auto_61644 ) ) ( not ( = ?auto_61643 ?auto_61644 ) ) ( not ( = ?auto_61646 ?auto_61638 ) ) ( not ( = ?auto_61628 ?auto_61646 ) ) ( HOIST-AT ?auto_61640 ?auto_61646 ) ( not ( = ?auto_61632 ?auto_61640 ) ) ( not ( = ?auto_61648 ?auto_61640 ) ) ( SURFACE-AT ?auto_61626 ?auto_61646 ) ( ON ?auto_61626 ?auto_61631 ) ( CLEAR ?auto_61626 ) ( not ( = ?auto_61625 ?auto_61631 ) ) ( not ( = ?auto_61626 ?auto_61631 ) ) ( not ( = ?auto_61643 ?auto_61631 ) ) ( not ( = ?auto_61644 ?auto_61631 ) ) ( IS-CRATE ?auto_61644 ) ( not ( = ?auto_61625 ?auto_61647 ) ) ( not ( = ?auto_61626 ?auto_61647 ) ) ( not ( = ?auto_61643 ?auto_61647 ) ) ( not ( = ?auto_61644 ?auto_61647 ) ) ( not ( = ?auto_61631 ?auto_61647 ) ) ( not ( = ?auto_61630 ?auto_61638 ) ) ( not ( = ?auto_61628 ?auto_61630 ) ) ( not ( = ?auto_61646 ?auto_61630 ) ) ( HOIST-AT ?auto_61639 ?auto_61630 ) ( not ( = ?auto_61632 ?auto_61639 ) ) ( not ( = ?auto_61648 ?auto_61639 ) ) ( not ( = ?auto_61640 ?auto_61639 ) ) ( AVAILABLE ?auto_61639 ) ( SURFACE-AT ?auto_61644 ?auto_61630 ) ( ON ?auto_61644 ?auto_61642 ) ( CLEAR ?auto_61644 ) ( not ( = ?auto_61625 ?auto_61642 ) ) ( not ( = ?auto_61626 ?auto_61642 ) ) ( not ( = ?auto_61643 ?auto_61642 ) ) ( not ( = ?auto_61644 ?auto_61642 ) ) ( not ( = ?auto_61631 ?auto_61642 ) ) ( not ( = ?auto_61647 ?auto_61642 ) ) ( IS-CRATE ?auto_61647 ) ( not ( = ?auto_61625 ?auto_61649 ) ) ( not ( = ?auto_61626 ?auto_61649 ) ) ( not ( = ?auto_61643 ?auto_61649 ) ) ( not ( = ?auto_61644 ?auto_61649 ) ) ( not ( = ?auto_61631 ?auto_61649 ) ) ( not ( = ?auto_61647 ?auto_61649 ) ) ( not ( = ?auto_61642 ?auto_61649 ) ) ( not ( = ?auto_61636 ?auto_61638 ) ) ( not ( = ?auto_61628 ?auto_61636 ) ) ( not ( = ?auto_61646 ?auto_61636 ) ) ( not ( = ?auto_61630 ?auto_61636 ) ) ( HOIST-AT ?auto_61634 ?auto_61636 ) ( not ( = ?auto_61632 ?auto_61634 ) ) ( not ( = ?auto_61648 ?auto_61634 ) ) ( not ( = ?auto_61640 ?auto_61634 ) ) ( not ( = ?auto_61639 ?auto_61634 ) ) ( AVAILABLE ?auto_61634 ) ( SURFACE-AT ?auto_61647 ?auto_61636 ) ( ON ?auto_61647 ?auto_61641 ) ( CLEAR ?auto_61647 ) ( not ( = ?auto_61625 ?auto_61641 ) ) ( not ( = ?auto_61626 ?auto_61641 ) ) ( not ( = ?auto_61643 ?auto_61641 ) ) ( not ( = ?auto_61644 ?auto_61641 ) ) ( not ( = ?auto_61631 ?auto_61641 ) ) ( not ( = ?auto_61647 ?auto_61641 ) ) ( not ( = ?auto_61642 ?auto_61641 ) ) ( not ( = ?auto_61649 ?auto_61641 ) ) ( IS-CRATE ?auto_61649 ) ( not ( = ?auto_61625 ?auto_61627 ) ) ( not ( = ?auto_61626 ?auto_61627 ) ) ( not ( = ?auto_61643 ?auto_61627 ) ) ( not ( = ?auto_61644 ?auto_61627 ) ) ( not ( = ?auto_61631 ?auto_61627 ) ) ( not ( = ?auto_61647 ?auto_61627 ) ) ( not ( = ?auto_61642 ?auto_61627 ) ) ( not ( = ?auto_61649 ?auto_61627 ) ) ( not ( = ?auto_61641 ?auto_61627 ) ) ( not ( = ?auto_61645 ?auto_61638 ) ) ( not ( = ?auto_61628 ?auto_61645 ) ) ( not ( = ?auto_61646 ?auto_61645 ) ) ( not ( = ?auto_61630 ?auto_61645 ) ) ( not ( = ?auto_61636 ?auto_61645 ) ) ( HOIST-AT ?auto_61637 ?auto_61645 ) ( not ( = ?auto_61632 ?auto_61637 ) ) ( not ( = ?auto_61648 ?auto_61637 ) ) ( not ( = ?auto_61640 ?auto_61637 ) ) ( not ( = ?auto_61639 ?auto_61637 ) ) ( not ( = ?auto_61634 ?auto_61637 ) ) ( AVAILABLE ?auto_61637 ) ( SURFACE-AT ?auto_61649 ?auto_61645 ) ( ON ?auto_61649 ?auto_61633 ) ( CLEAR ?auto_61649 ) ( not ( = ?auto_61625 ?auto_61633 ) ) ( not ( = ?auto_61626 ?auto_61633 ) ) ( not ( = ?auto_61643 ?auto_61633 ) ) ( not ( = ?auto_61644 ?auto_61633 ) ) ( not ( = ?auto_61631 ?auto_61633 ) ) ( not ( = ?auto_61647 ?auto_61633 ) ) ( not ( = ?auto_61642 ?auto_61633 ) ) ( not ( = ?auto_61649 ?auto_61633 ) ) ( not ( = ?auto_61641 ?auto_61633 ) ) ( not ( = ?auto_61627 ?auto_61633 ) ) ( IS-CRATE ?auto_61627 ) ( not ( = ?auto_61625 ?auto_61629 ) ) ( not ( = ?auto_61626 ?auto_61629 ) ) ( not ( = ?auto_61643 ?auto_61629 ) ) ( not ( = ?auto_61644 ?auto_61629 ) ) ( not ( = ?auto_61631 ?auto_61629 ) ) ( not ( = ?auto_61647 ?auto_61629 ) ) ( not ( = ?auto_61642 ?auto_61629 ) ) ( not ( = ?auto_61649 ?auto_61629 ) ) ( not ( = ?auto_61641 ?auto_61629 ) ) ( not ( = ?auto_61627 ?auto_61629 ) ) ( not ( = ?auto_61633 ?auto_61629 ) ) ( AVAILABLE ?auto_61640 ) ( SURFACE-AT ?auto_61627 ?auto_61646 ) ( ON ?auto_61627 ?auto_61635 ) ( CLEAR ?auto_61627 ) ( not ( = ?auto_61625 ?auto_61635 ) ) ( not ( = ?auto_61626 ?auto_61635 ) ) ( not ( = ?auto_61643 ?auto_61635 ) ) ( not ( = ?auto_61644 ?auto_61635 ) ) ( not ( = ?auto_61631 ?auto_61635 ) ) ( not ( = ?auto_61647 ?auto_61635 ) ) ( not ( = ?auto_61642 ?auto_61635 ) ) ( not ( = ?auto_61649 ?auto_61635 ) ) ( not ( = ?auto_61641 ?auto_61635 ) ) ( not ( = ?auto_61627 ?auto_61635 ) ) ( not ( = ?auto_61633 ?auto_61635 ) ) ( not ( = ?auto_61629 ?auto_61635 ) ) ( TRUCK-AT ?auto_61650 ?auto_61638 ) ( SURFACE-AT ?auto_61651 ?auto_61638 ) ( CLEAR ?auto_61651 ) ( LIFTING ?auto_61632 ?auto_61629 ) ( IS-CRATE ?auto_61629 ) ( not ( = ?auto_61625 ?auto_61651 ) ) ( not ( = ?auto_61626 ?auto_61651 ) ) ( not ( = ?auto_61643 ?auto_61651 ) ) ( not ( = ?auto_61644 ?auto_61651 ) ) ( not ( = ?auto_61631 ?auto_61651 ) ) ( not ( = ?auto_61647 ?auto_61651 ) ) ( not ( = ?auto_61642 ?auto_61651 ) ) ( not ( = ?auto_61649 ?auto_61651 ) ) ( not ( = ?auto_61641 ?auto_61651 ) ) ( not ( = ?auto_61627 ?auto_61651 ) ) ( not ( = ?auto_61633 ?auto_61651 ) ) ( not ( = ?auto_61629 ?auto_61651 ) ) ( not ( = ?auto_61635 ?auto_61651 ) ) )
    :subtasks
    ( ( !DROP ?auto_61632 ?auto_61629 ?auto_61651 ?auto_61638 )
      ( MAKE-ON ?auto_61625 ?auto_61626 )
      ( MAKE-ON-VERIFY ?auto_61625 ?auto_61626 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61652 - SURFACE
      ?auto_61653 - SURFACE
    )
    :vars
    (
      ?auto_61654 - HOIST
      ?auto_61666 - PLACE
      ?auto_61658 - PLACE
      ?auto_61667 - HOIST
      ?auto_61675 - SURFACE
      ?auto_61676 - SURFACE
      ?auto_61669 - PLACE
      ?auto_61671 - HOIST
      ?auto_61657 - SURFACE
      ?auto_61668 - SURFACE
      ?auto_61656 - PLACE
      ?auto_61665 - HOIST
      ?auto_61663 - SURFACE
      ?auto_61662 - SURFACE
      ?auto_61673 - PLACE
      ?auto_61672 - HOIST
      ?auto_61659 - SURFACE
      ?auto_61661 - SURFACE
      ?auto_61677 - PLACE
      ?auto_61655 - HOIST
      ?auto_61664 - SURFACE
      ?auto_61674 - SURFACE
      ?auto_61660 - SURFACE
      ?auto_61678 - TRUCK
      ?auto_61670 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61654 ?auto_61666 ) ( IS-CRATE ?auto_61652 ) ( not ( = ?auto_61652 ?auto_61653 ) ) ( not ( = ?auto_61658 ?auto_61666 ) ) ( HOIST-AT ?auto_61667 ?auto_61658 ) ( not ( = ?auto_61654 ?auto_61667 ) ) ( AVAILABLE ?auto_61667 ) ( SURFACE-AT ?auto_61652 ?auto_61658 ) ( ON ?auto_61652 ?auto_61675 ) ( CLEAR ?auto_61652 ) ( not ( = ?auto_61652 ?auto_61675 ) ) ( not ( = ?auto_61653 ?auto_61675 ) ) ( IS-CRATE ?auto_61653 ) ( not ( = ?auto_61652 ?auto_61676 ) ) ( not ( = ?auto_61653 ?auto_61676 ) ) ( not ( = ?auto_61675 ?auto_61676 ) ) ( not ( = ?auto_61669 ?auto_61666 ) ) ( not ( = ?auto_61658 ?auto_61669 ) ) ( HOIST-AT ?auto_61671 ?auto_61669 ) ( not ( = ?auto_61654 ?auto_61671 ) ) ( not ( = ?auto_61667 ?auto_61671 ) ) ( SURFACE-AT ?auto_61653 ?auto_61669 ) ( ON ?auto_61653 ?auto_61657 ) ( CLEAR ?auto_61653 ) ( not ( = ?auto_61652 ?auto_61657 ) ) ( not ( = ?auto_61653 ?auto_61657 ) ) ( not ( = ?auto_61675 ?auto_61657 ) ) ( not ( = ?auto_61676 ?auto_61657 ) ) ( IS-CRATE ?auto_61676 ) ( not ( = ?auto_61652 ?auto_61668 ) ) ( not ( = ?auto_61653 ?auto_61668 ) ) ( not ( = ?auto_61675 ?auto_61668 ) ) ( not ( = ?auto_61676 ?auto_61668 ) ) ( not ( = ?auto_61657 ?auto_61668 ) ) ( not ( = ?auto_61656 ?auto_61666 ) ) ( not ( = ?auto_61658 ?auto_61656 ) ) ( not ( = ?auto_61669 ?auto_61656 ) ) ( HOIST-AT ?auto_61665 ?auto_61656 ) ( not ( = ?auto_61654 ?auto_61665 ) ) ( not ( = ?auto_61667 ?auto_61665 ) ) ( not ( = ?auto_61671 ?auto_61665 ) ) ( AVAILABLE ?auto_61665 ) ( SURFACE-AT ?auto_61676 ?auto_61656 ) ( ON ?auto_61676 ?auto_61663 ) ( CLEAR ?auto_61676 ) ( not ( = ?auto_61652 ?auto_61663 ) ) ( not ( = ?auto_61653 ?auto_61663 ) ) ( not ( = ?auto_61675 ?auto_61663 ) ) ( not ( = ?auto_61676 ?auto_61663 ) ) ( not ( = ?auto_61657 ?auto_61663 ) ) ( not ( = ?auto_61668 ?auto_61663 ) ) ( IS-CRATE ?auto_61668 ) ( not ( = ?auto_61652 ?auto_61662 ) ) ( not ( = ?auto_61653 ?auto_61662 ) ) ( not ( = ?auto_61675 ?auto_61662 ) ) ( not ( = ?auto_61676 ?auto_61662 ) ) ( not ( = ?auto_61657 ?auto_61662 ) ) ( not ( = ?auto_61668 ?auto_61662 ) ) ( not ( = ?auto_61663 ?auto_61662 ) ) ( not ( = ?auto_61673 ?auto_61666 ) ) ( not ( = ?auto_61658 ?auto_61673 ) ) ( not ( = ?auto_61669 ?auto_61673 ) ) ( not ( = ?auto_61656 ?auto_61673 ) ) ( HOIST-AT ?auto_61672 ?auto_61673 ) ( not ( = ?auto_61654 ?auto_61672 ) ) ( not ( = ?auto_61667 ?auto_61672 ) ) ( not ( = ?auto_61671 ?auto_61672 ) ) ( not ( = ?auto_61665 ?auto_61672 ) ) ( AVAILABLE ?auto_61672 ) ( SURFACE-AT ?auto_61668 ?auto_61673 ) ( ON ?auto_61668 ?auto_61659 ) ( CLEAR ?auto_61668 ) ( not ( = ?auto_61652 ?auto_61659 ) ) ( not ( = ?auto_61653 ?auto_61659 ) ) ( not ( = ?auto_61675 ?auto_61659 ) ) ( not ( = ?auto_61676 ?auto_61659 ) ) ( not ( = ?auto_61657 ?auto_61659 ) ) ( not ( = ?auto_61668 ?auto_61659 ) ) ( not ( = ?auto_61663 ?auto_61659 ) ) ( not ( = ?auto_61662 ?auto_61659 ) ) ( IS-CRATE ?auto_61662 ) ( not ( = ?auto_61652 ?auto_61661 ) ) ( not ( = ?auto_61653 ?auto_61661 ) ) ( not ( = ?auto_61675 ?auto_61661 ) ) ( not ( = ?auto_61676 ?auto_61661 ) ) ( not ( = ?auto_61657 ?auto_61661 ) ) ( not ( = ?auto_61668 ?auto_61661 ) ) ( not ( = ?auto_61663 ?auto_61661 ) ) ( not ( = ?auto_61662 ?auto_61661 ) ) ( not ( = ?auto_61659 ?auto_61661 ) ) ( not ( = ?auto_61677 ?auto_61666 ) ) ( not ( = ?auto_61658 ?auto_61677 ) ) ( not ( = ?auto_61669 ?auto_61677 ) ) ( not ( = ?auto_61656 ?auto_61677 ) ) ( not ( = ?auto_61673 ?auto_61677 ) ) ( HOIST-AT ?auto_61655 ?auto_61677 ) ( not ( = ?auto_61654 ?auto_61655 ) ) ( not ( = ?auto_61667 ?auto_61655 ) ) ( not ( = ?auto_61671 ?auto_61655 ) ) ( not ( = ?auto_61665 ?auto_61655 ) ) ( not ( = ?auto_61672 ?auto_61655 ) ) ( AVAILABLE ?auto_61655 ) ( SURFACE-AT ?auto_61662 ?auto_61677 ) ( ON ?auto_61662 ?auto_61664 ) ( CLEAR ?auto_61662 ) ( not ( = ?auto_61652 ?auto_61664 ) ) ( not ( = ?auto_61653 ?auto_61664 ) ) ( not ( = ?auto_61675 ?auto_61664 ) ) ( not ( = ?auto_61676 ?auto_61664 ) ) ( not ( = ?auto_61657 ?auto_61664 ) ) ( not ( = ?auto_61668 ?auto_61664 ) ) ( not ( = ?auto_61663 ?auto_61664 ) ) ( not ( = ?auto_61662 ?auto_61664 ) ) ( not ( = ?auto_61659 ?auto_61664 ) ) ( not ( = ?auto_61661 ?auto_61664 ) ) ( IS-CRATE ?auto_61661 ) ( not ( = ?auto_61652 ?auto_61674 ) ) ( not ( = ?auto_61653 ?auto_61674 ) ) ( not ( = ?auto_61675 ?auto_61674 ) ) ( not ( = ?auto_61676 ?auto_61674 ) ) ( not ( = ?auto_61657 ?auto_61674 ) ) ( not ( = ?auto_61668 ?auto_61674 ) ) ( not ( = ?auto_61663 ?auto_61674 ) ) ( not ( = ?auto_61662 ?auto_61674 ) ) ( not ( = ?auto_61659 ?auto_61674 ) ) ( not ( = ?auto_61661 ?auto_61674 ) ) ( not ( = ?auto_61664 ?auto_61674 ) ) ( AVAILABLE ?auto_61671 ) ( SURFACE-AT ?auto_61661 ?auto_61669 ) ( ON ?auto_61661 ?auto_61660 ) ( CLEAR ?auto_61661 ) ( not ( = ?auto_61652 ?auto_61660 ) ) ( not ( = ?auto_61653 ?auto_61660 ) ) ( not ( = ?auto_61675 ?auto_61660 ) ) ( not ( = ?auto_61676 ?auto_61660 ) ) ( not ( = ?auto_61657 ?auto_61660 ) ) ( not ( = ?auto_61668 ?auto_61660 ) ) ( not ( = ?auto_61663 ?auto_61660 ) ) ( not ( = ?auto_61662 ?auto_61660 ) ) ( not ( = ?auto_61659 ?auto_61660 ) ) ( not ( = ?auto_61661 ?auto_61660 ) ) ( not ( = ?auto_61664 ?auto_61660 ) ) ( not ( = ?auto_61674 ?auto_61660 ) ) ( TRUCK-AT ?auto_61678 ?auto_61666 ) ( SURFACE-AT ?auto_61670 ?auto_61666 ) ( CLEAR ?auto_61670 ) ( IS-CRATE ?auto_61674 ) ( not ( = ?auto_61652 ?auto_61670 ) ) ( not ( = ?auto_61653 ?auto_61670 ) ) ( not ( = ?auto_61675 ?auto_61670 ) ) ( not ( = ?auto_61676 ?auto_61670 ) ) ( not ( = ?auto_61657 ?auto_61670 ) ) ( not ( = ?auto_61668 ?auto_61670 ) ) ( not ( = ?auto_61663 ?auto_61670 ) ) ( not ( = ?auto_61662 ?auto_61670 ) ) ( not ( = ?auto_61659 ?auto_61670 ) ) ( not ( = ?auto_61661 ?auto_61670 ) ) ( not ( = ?auto_61664 ?auto_61670 ) ) ( not ( = ?auto_61674 ?auto_61670 ) ) ( not ( = ?auto_61660 ?auto_61670 ) ) ( AVAILABLE ?auto_61654 ) ( IN ?auto_61674 ?auto_61678 ) )
    :subtasks
    ( ( !UNLOAD ?auto_61654 ?auto_61674 ?auto_61678 ?auto_61666 )
      ( MAKE-ON ?auto_61652 ?auto_61653 )
      ( MAKE-ON-VERIFY ?auto_61652 ?auto_61653 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61679 - SURFACE
      ?auto_61680 - SURFACE
    )
    :vars
    (
      ?auto_61698 - HOIST
      ?auto_61682 - PLACE
      ?auto_61695 - PLACE
      ?auto_61681 - HOIST
      ?auto_61692 - SURFACE
      ?auto_61693 - SURFACE
      ?auto_61694 - PLACE
      ?auto_61688 - HOIST
      ?auto_61697 - SURFACE
      ?auto_61699 - SURFACE
      ?auto_61700 - PLACE
      ?auto_61702 - HOIST
      ?auto_61685 - SURFACE
      ?auto_61696 - SURFACE
      ?auto_61690 - PLACE
      ?auto_61689 - HOIST
      ?auto_61705 - SURFACE
      ?auto_61683 - SURFACE
      ?auto_61686 - PLACE
      ?auto_61703 - HOIST
      ?auto_61704 - SURFACE
      ?auto_61691 - SURFACE
      ?auto_61701 - SURFACE
      ?auto_61687 - SURFACE
      ?auto_61684 - TRUCK
      ?auto_61706 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61698 ?auto_61682 ) ( IS-CRATE ?auto_61679 ) ( not ( = ?auto_61679 ?auto_61680 ) ) ( not ( = ?auto_61695 ?auto_61682 ) ) ( HOIST-AT ?auto_61681 ?auto_61695 ) ( not ( = ?auto_61698 ?auto_61681 ) ) ( AVAILABLE ?auto_61681 ) ( SURFACE-AT ?auto_61679 ?auto_61695 ) ( ON ?auto_61679 ?auto_61692 ) ( CLEAR ?auto_61679 ) ( not ( = ?auto_61679 ?auto_61692 ) ) ( not ( = ?auto_61680 ?auto_61692 ) ) ( IS-CRATE ?auto_61680 ) ( not ( = ?auto_61679 ?auto_61693 ) ) ( not ( = ?auto_61680 ?auto_61693 ) ) ( not ( = ?auto_61692 ?auto_61693 ) ) ( not ( = ?auto_61694 ?auto_61682 ) ) ( not ( = ?auto_61695 ?auto_61694 ) ) ( HOIST-AT ?auto_61688 ?auto_61694 ) ( not ( = ?auto_61698 ?auto_61688 ) ) ( not ( = ?auto_61681 ?auto_61688 ) ) ( SURFACE-AT ?auto_61680 ?auto_61694 ) ( ON ?auto_61680 ?auto_61697 ) ( CLEAR ?auto_61680 ) ( not ( = ?auto_61679 ?auto_61697 ) ) ( not ( = ?auto_61680 ?auto_61697 ) ) ( not ( = ?auto_61692 ?auto_61697 ) ) ( not ( = ?auto_61693 ?auto_61697 ) ) ( IS-CRATE ?auto_61693 ) ( not ( = ?auto_61679 ?auto_61699 ) ) ( not ( = ?auto_61680 ?auto_61699 ) ) ( not ( = ?auto_61692 ?auto_61699 ) ) ( not ( = ?auto_61693 ?auto_61699 ) ) ( not ( = ?auto_61697 ?auto_61699 ) ) ( not ( = ?auto_61700 ?auto_61682 ) ) ( not ( = ?auto_61695 ?auto_61700 ) ) ( not ( = ?auto_61694 ?auto_61700 ) ) ( HOIST-AT ?auto_61702 ?auto_61700 ) ( not ( = ?auto_61698 ?auto_61702 ) ) ( not ( = ?auto_61681 ?auto_61702 ) ) ( not ( = ?auto_61688 ?auto_61702 ) ) ( AVAILABLE ?auto_61702 ) ( SURFACE-AT ?auto_61693 ?auto_61700 ) ( ON ?auto_61693 ?auto_61685 ) ( CLEAR ?auto_61693 ) ( not ( = ?auto_61679 ?auto_61685 ) ) ( not ( = ?auto_61680 ?auto_61685 ) ) ( not ( = ?auto_61692 ?auto_61685 ) ) ( not ( = ?auto_61693 ?auto_61685 ) ) ( not ( = ?auto_61697 ?auto_61685 ) ) ( not ( = ?auto_61699 ?auto_61685 ) ) ( IS-CRATE ?auto_61699 ) ( not ( = ?auto_61679 ?auto_61696 ) ) ( not ( = ?auto_61680 ?auto_61696 ) ) ( not ( = ?auto_61692 ?auto_61696 ) ) ( not ( = ?auto_61693 ?auto_61696 ) ) ( not ( = ?auto_61697 ?auto_61696 ) ) ( not ( = ?auto_61699 ?auto_61696 ) ) ( not ( = ?auto_61685 ?auto_61696 ) ) ( not ( = ?auto_61690 ?auto_61682 ) ) ( not ( = ?auto_61695 ?auto_61690 ) ) ( not ( = ?auto_61694 ?auto_61690 ) ) ( not ( = ?auto_61700 ?auto_61690 ) ) ( HOIST-AT ?auto_61689 ?auto_61690 ) ( not ( = ?auto_61698 ?auto_61689 ) ) ( not ( = ?auto_61681 ?auto_61689 ) ) ( not ( = ?auto_61688 ?auto_61689 ) ) ( not ( = ?auto_61702 ?auto_61689 ) ) ( AVAILABLE ?auto_61689 ) ( SURFACE-AT ?auto_61699 ?auto_61690 ) ( ON ?auto_61699 ?auto_61705 ) ( CLEAR ?auto_61699 ) ( not ( = ?auto_61679 ?auto_61705 ) ) ( not ( = ?auto_61680 ?auto_61705 ) ) ( not ( = ?auto_61692 ?auto_61705 ) ) ( not ( = ?auto_61693 ?auto_61705 ) ) ( not ( = ?auto_61697 ?auto_61705 ) ) ( not ( = ?auto_61699 ?auto_61705 ) ) ( not ( = ?auto_61685 ?auto_61705 ) ) ( not ( = ?auto_61696 ?auto_61705 ) ) ( IS-CRATE ?auto_61696 ) ( not ( = ?auto_61679 ?auto_61683 ) ) ( not ( = ?auto_61680 ?auto_61683 ) ) ( not ( = ?auto_61692 ?auto_61683 ) ) ( not ( = ?auto_61693 ?auto_61683 ) ) ( not ( = ?auto_61697 ?auto_61683 ) ) ( not ( = ?auto_61699 ?auto_61683 ) ) ( not ( = ?auto_61685 ?auto_61683 ) ) ( not ( = ?auto_61696 ?auto_61683 ) ) ( not ( = ?auto_61705 ?auto_61683 ) ) ( not ( = ?auto_61686 ?auto_61682 ) ) ( not ( = ?auto_61695 ?auto_61686 ) ) ( not ( = ?auto_61694 ?auto_61686 ) ) ( not ( = ?auto_61700 ?auto_61686 ) ) ( not ( = ?auto_61690 ?auto_61686 ) ) ( HOIST-AT ?auto_61703 ?auto_61686 ) ( not ( = ?auto_61698 ?auto_61703 ) ) ( not ( = ?auto_61681 ?auto_61703 ) ) ( not ( = ?auto_61688 ?auto_61703 ) ) ( not ( = ?auto_61702 ?auto_61703 ) ) ( not ( = ?auto_61689 ?auto_61703 ) ) ( AVAILABLE ?auto_61703 ) ( SURFACE-AT ?auto_61696 ?auto_61686 ) ( ON ?auto_61696 ?auto_61704 ) ( CLEAR ?auto_61696 ) ( not ( = ?auto_61679 ?auto_61704 ) ) ( not ( = ?auto_61680 ?auto_61704 ) ) ( not ( = ?auto_61692 ?auto_61704 ) ) ( not ( = ?auto_61693 ?auto_61704 ) ) ( not ( = ?auto_61697 ?auto_61704 ) ) ( not ( = ?auto_61699 ?auto_61704 ) ) ( not ( = ?auto_61685 ?auto_61704 ) ) ( not ( = ?auto_61696 ?auto_61704 ) ) ( not ( = ?auto_61705 ?auto_61704 ) ) ( not ( = ?auto_61683 ?auto_61704 ) ) ( IS-CRATE ?auto_61683 ) ( not ( = ?auto_61679 ?auto_61691 ) ) ( not ( = ?auto_61680 ?auto_61691 ) ) ( not ( = ?auto_61692 ?auto_61691 ) ) ( not ( = ?auto_61693 ?auto_61691 ) ) ( not ( = ?auto_61697 ?auto_61691 ) ) ( not ( = ?auto_61699 ?auto_61691 ) ) ( not ( = ?auto_61685 ?auto_61691 ) ) ( not ( = ?auto_61696 ?auto_61691 ) ) ( not ( = ?auto_61705 ?auto_61691 ) ) ( not ( = ?auto_61683 ?auto_61691 ) ) ( not ( = ?auto_61704 ?auto_61691 ) ) ( AVAILABLE ?auto_61688 ) ( SURFACE-AT ?auto_61683 ?auto_61694 ) ( ON ?auto_61683 ?auto_61701 ) ( CLEAR ?auto_61683 ) ( not ( = ?auto_61679 ?auto_61701 ) ) ( not ( = ?auto_61680 ?auto_61701 ) ) ( not ( = ?auto_61692 ?auto_61701 ) ) ( not ( = ?auto_61693 ?auto_61701 ) ) ( not ( = ?auto_61697 ?auto_61701 ) ) ( not ( = ?auto_61699 ?auto_61701 ) ) ( not ( = ?auto_61685 ?auto_61701 ) ) ( not ( = ?auto_61696 ?auto_61701 ) ) ( not ( = ?auto_61705 ?auto_61701 ) ) ( not ( = ?auto_61683 ?auto_61701 ) ) ( not ( = ?auto_61704 ?auto_61701 ) ) ( not ( = ?auto_61691 ?auto_61701 ) ) ( SURFACE-AT ?auto_61687 ?auto_61682 ) ( CLEAR ?auto_61687 ) ( IS-CRATE ?auto_61691 ) ( not ( = ?auto_61679 ?auto_61687 ) ) ( not ( = ?auto_61680 ?auto_61687 ) ) ( not ( = ?auto_61692 ?auto_61687 ) ) ( not ( = ?auto_61693 ?auto_61687 ) ) ( not ( = ?auto_61697 ?auto_61687 ) ) ( not ( = ?auto_61699 ?auto_61687 ) ) ( not ( = ?auto_61685 ?auto_61687 ) ) ( not ( = ?auto_61696 ?auto_61687 ) ) ( not ( = ?auto_61705 ?auto_61687 ) ) ( not ( = ?auto_61683 ?auto_61687 ) ) ( not ( = ?auto_61704 ?auto_61687 ) ) ( not ( = ?auto_61691 ?auto_61687 ) ) ( not ( = ?auto_61701 ?auto_61687 ) ) ( AVAILABLE ?auto_61698 ) ( IN ?auto_61691 ?auto_61684 ) ( TRUCK-AT ?auto_61684 ?auto_61706 ) ( not ( = ?auto_61706 ?auto_61682 ) ) ( not ( = ?auto_61695 ?auto_61706 ) ) ( not ( = ?auto_61694 ?auto_61706 ) ) ( not ( = ?auto_61700 ?auto_61706 ) ) ( not ( = ?auto_61690 ?auto_61706 ) ) ( not ( = ?auto_61686 ?auto_61706 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_61684 ?auto_61706 ?auto_61682 )
      ( MAKE-ON ?auto_61679 ?auto_61680 )
      ( MAKE-ON-VERIFY ?auto_61679 ?auto_61680 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61707 - SURFACE
      ?auto_61708 - SURFACE
    )
    :vars
    (
      ?auto_61711 - HOIST
      ?auto_61732 - PLACE
      ?auto_61716 - PLACE
      ?auto_61728 - HOIST
      ?auto_61709 - SURFACE
      ?auto_61730 - SURFACE
      ?auto_61725 - PLACE
      ?auto_61727 - HOIST
      ?auto_61734 - SURFACE
      ?auto_61712 - SURFACE
      ?auto_61713 - PLACE
      ?auto_61719 - HOIST
      ?auto_61714 - SURFACE
      ?auto_61721 - SURFACE
      ?auto_61726 - PLACE
      ?auto_61724 - HOIST
      ?auto_61722 - SURFACE
      ?auto_61729 - SURFACE
      ?auto_61723 - PLACE
      ?auto_61720 - HOIST
      ?auto_61710 - SURFACE
      ?auto_61733 - SURFACE
      ?auto_61718 - SURFACE
      ?auto_61717 - SURFACE
      ?auto_61731 - TRUCK
      ?auto_61715 - PLACE
      ?auto_61735 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_61711 ?auto_61732 ) ( IS-CRATE ?auto_61707 ) ( not ( = ?auto_61707 ?auto_61708 ) ) ( not ( = ?auto_61716 ?auto_61732 ) ) ( HOIST-AT ?auto_61728 ?auto_61716 ) ( not ( = ?auto_61711 ?auto_61728 ) ) ( AVAILABLE ?auto_61728 ) ( SURFACE-AT ?auto_61707 ?auto_61716 ) ( ON ?auto_61707 ?auto_61709 ) ( CLEAR ?auto_61707 ) ( not ( = ?auto_61707 ?auto_61709 ) ) ( not ( = ?auto_61708 ?auto_61709 ) ) ( IS-CRATE ?auto_61708 ) ( not ( = ?auto_61707 ?auto_61730 ) ) ( not ( = ?auto_61708 ?auto_61730 ) ) ( not ( = ?auto_61709 ?auto_61730 ) ) ( not ( = ?auto_61725 ?auto_61732 ) ) ( not ( = ?auto_61716 ?auto_61725 ) ) ( HOIST-AT ?auto_61727 ?auto_61725 ) ( not ( = ?auto_61711 ?auto_61727 ) ) ( not ( = ?auto_61728 ?auto_61727 ) ) ( SURFACE-AT ?auto_61708 ?auto_61725 ) ( ON ?auto_61708 ?auto_61734 ) ( CLEAR ?auto_61708 ) ( not ( = ?auto_61707 ?auto_61734 ) ) ( not ( = ?auto_61708 ?auto_61734 ) ) ( not ( = ?auto_61709 ?auto_61734 ) ) ( not ( = ?auto_61730 ?auto_61734 ) ) ( IS-CRATE ?auto_61730 ) ( not ( = ?auto_61707 ?auto_61712 ) ) ( not ( = ?auto_61708 ?auto_61712 ) ) ( not ( = ?auto_61709 ?auto_61712 ) ) ( not ( = ?auto_61730 ?auto_61712 ) ) ( not ( = ?auto_61734 ?auto_61712 ) ) ( not ( = ?auto_61713 ?auto_61732 ) ) ( not ( = ?auto_61716 ?auto_61713 ) ) ( not ( = ?auto_61725 ?auto_61713 ) ) ( HOIST-AT ?auto_61719 ?auto_61713 ) ( not ( = ?auto_61711 ?auto_61719 ) ) ( not ( = ?auto_61728 ?auto_61719 ) ) ( not ( = ?auto_61727 ?auto_61719 ) ) ( AVAILABLE ?auto_61719 ) ( SURFACE-AT ?auto_61730 ?auto_61713 ) ( ON ?auto_61730 ?auto_61714 ) ( CLEAR ?auto_61730 ) ( not ( = ?auto_61707 ?auto_61714 ) ) ( not ( = ?auto_61708 ?auto_61714 ) ) ( not ( = ?auto_61709 ?auto_61714 ) ) ( not ( = ?auto_61730 ?auto_61714 ) ) ( not ( = ?auto_61734 ?auto_61714 ) ) ( not ( = ?auto_61712 ?auto_61714 ) ) ( IS-CRATE ?auto_61712 ) ( not ( = ?auto_61707 ?auto_61721 ) ) ( not ( = ?auto_61708 ?auto_61721 ) ) ( not ( = ?auto_61709 ?auto_61721 ) ) ( not ( = ?auto_61730 ?auto_61721 ) ) ( not ( = ?auto_61734 ?auto_61721 ) ) ( not ( = ?auto_61712 ?auto_61721 ) ) ( not ( = ?auto_61714 ?auto_61721 ) ) ( not ( = ?auto_61726 ?auto_61732 ) ) ( not ( = ?auto_61716 ?auto_61726 ) ) ( not ( = ?auto_61725 ?auto_61726 ) ) ( not ( = ?auto_61713 ?auto_61726 ) ) ( HOIST-AT ?auto_61724 ?auto_61726 ) ( not ( = ?auto_61711 ?auto_61724 ) ) ( not ( = ?auto_61728 ?auto_61724 ) ) ( not ( = ?auto_61727 ?auto_61724 ) ) ( not ( = ?auto_61719 ?auto_61724 ) ) ( AVAILABLE ?auto_61724 ) ( SURFACE-AT ?auto_61712 ?auto_61726 ) ( ON ?auto_61712 ?auto_61722 ) ( CLEAR ?auto_61712 ) ( not ( = ?auto_61707 ?auto_61722 ) ) ( not ( = ?auto_61708 ?auto_61722 ) ) ( not ( = ?auto_61709 ?auto_61722 ) ) ( not ( = ?auto_61730 ?auto_61722 ) ) ( not ( = ?auto_61734 ?auto_61722 ) ) ( not ( = ?auto_61712 ?auto_61722 ) ) ( not ( = ?auto_61714 ?auto_61722 ) ) ( not ( = ?auto_61721 ?auto_61722 ) ) ( IS-CRATE ?auto_61721 ) ( not ( = ?auto_61707 ?auto_61729 ) ) ( not ( = ?auto_61708 ?auto_61729 ) ) ( not ( = ?auto_61709 ?auto_61729 ) ) ( not ( = ?auto_61730 ?auto_61729 ) ) ( not ( = ?auto_61734 ?auto_61729 ) ) ( not ( = ?auto_61712 ?auto_61729 ) ) ( not ( = ?auto_61714 ?auto_61729 ) ) ( not ( = ?auto_61721 ?auto_61729 ) ) ( not ( = ?auto_61722 ?auto_61729 ) ) ( not ( = ?auto_61723 ?auto_61732 ) ) ( not ( = ?auto_61716 ?auto_61723 ) ) ( not ( = ?auto_61725 ?auto_61723 ) ) ( not ( = ?auto_61713 ?auto_61723 ) ) ( not ( = ?auto_61726 ?auto_61723 ) ) ( HOIST-AT ?auto_61720 ?auto_61723 ) ( not ( = ?auto_61711 ?auto_61720 ) ) ( not ( = ?auto_61728 ?auto_61720 ) ) ( not ( = ?auto_61727 ?auto_61720 ) ) ( not ( = ?auto_61719 ?auto_61720 ) ) ( not ( = ?auto_61724 ?auto_61720 ) ) ( AVAILABLE ?auto_61720 ) ( SURFACE-AT ?auto_61721 ?auto_61723 ) ( ON ?auto_61721 ?auto_61710 ) ( CLEAR ?auto_61721 ) ( not ( = ?auto_61707 ?auto_61710 ) ) ( not ( = ?auto_61708 ?auto_61710 ) ) ( not ( = ?auto_61709 ?auto_61710 ) ) ( not ( = ?auto_61730 ?auto_61710 ) ) ( not ( = ?auto_61734 ?auto_61710 ) ) ( not ( = ?auto_61712 ?auto_61710 ) ) ( not ( = ?auto_61714 ?auto_61710 ) ) ( not ( = ?auto_61721 ?auto_61710 ) ) ( not ( = ?auto_61722 ?auto_61710 ) ) ( not ( = ?auto_61729 ?auto_61710 ) ) ( IS-CRATE ?auto_61729 ) ( not ( = ?auto_61707 ?auto_61733 ) ) ( not ( = ?auto_61708 ?auto_61733 ) ) ( not ( = ?auto_61709 ?auto_61733 ) ) ( not ( = ?auto_61730 ?auto_61733 ) ) ( not ( = ?auto_61734 ?auto_61733 ) ) ( not ( = ?auto_61712 ?auto_61733 ) ) ( not ( = ?auto_61714 ?auto_61733 ) ) ( not ( = ?auto_61721 ?auto_61733 ) ) ( not ( = ?auto_61722 ?auto_61733 ) ) ( not ( = ?auto_61729 ?auto_61733 ) ) ( not ( = ?auto_61710 ?auto_61733 ) ) ( AVAILABLE ?auto_61727 ) ( SURFACE-AT ?auto_61729 ?auto_61725 ) ( ON ?auto_61729 ?auto_61718 ) ( CLEAR ?auto_61729 ) ( not ( = ?auto_61707 ?auto_61718 ) ) ( not ( = ?auto_61708 ?auto_61718 ) ) ( not ( = ?auto_61709 ?auto_61718 ) ) ( not ( = ?auto_61730 ?auto_61718 ) ) ( not ( = ?auto_61734 ?auto_61718 ) ) ( not ( = ?auto_61712 ?auto_61718 ) ) ( not ( = ?auto_61714 ?auto_61718 ) ) ( not ( = ?auto_61721 ?auto_61718 ) ) ( not ( = ?auto_61722 ?auto_61718 ) ) ( not ( = ?auto_61729 ?auto_61718 ) ) ( not ( = ?auto_61710 ?auto_61718 ) ) ( not ( = ?auto_61733 ?auto_61718 ) ) ( SURFACE-AT ?auto_61717 ?auto_61732 ) ( CLEAR ?auto_61717 ) ( IS-CRATE ?auto_61733 ) ( not ( = ?auto_61707 ?auto_61717 ) ) ( not ( = ?auto_61708 ?auto_61717 ) ) ( not ( = ?auto_61709 ?auto_61717 ) ) ( not ( = ?auto_61730 ?auto_61717 ) ) ( not ( = ?auto_61734 ?auto_61717 ) ) ( not ( = ?auto_61712 ?auto_61717 ) ) ( not ( = ?auto_61714 ?auto_61717 ) ) ( not ( = ?auto_61721 ?auto_61717 ) ) ( not ( = ?auto_61722 ?auto_61717 ) ) ( not ( = ?auto_61729 ?auto_61717 ) ) ( not ( = ?auto_61710 ?auto_61717 ) ) ( not ( = ?auto_61733 ?auto_61717 ) ) ( not ( = ?auto_61718 ?auto_61717 ) ) ( AVAILABLE ?auto_61711 ) ( TRUCK-AT ?auto_61731 ?auto_61715 ) ( not ( = ?auto_61715 ?auto_61732 ) ) ( not ( = ?auto_61716 ?auto_61715 ) ) ( not ( = ?auto_61725 ?auto_61715 ) ) ( not ( = ?auto_61713 ?auto_61715 ) ) ( not ( = ?auto_61726 ?auto_61715 ) ) ( not ( = ?auto_61723 ?auto_61715 ) ) ( HOIST-AT ?auto_61735 ?auto_61715 ) ( LIFTING ?auto_61735 ?auto_61733 ) ( not ( = ?auto_61711 ?auto_61735 ) ) ( not ( = ?auto_61728 ?auto_61735 ) ) ( not ( = ?auto_61727 ?auto_61735 ) ) ( not ( = ?auto_61719 ?auto_61735 ) ) ( not ( = ?auto_61724 ?auto_61735 ) ) ( not ( = ?auto_61720 ?auto_61735 ) ) )
    :subtasks
    ( ( !LOAD ?auto_61735 ?auto_61733 ?auto_61731 ?auto_61715 )
      ( MAKE-ON ?auto_61707 ?auto_61708 )
      ( MAKE-ON-VERIFY ?auto_61707 ?auto_61708 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61736 - SURFACE
      ?auto_61737 - SURFACE
    )
    :vars
    (
      ?auto_61738 - HOIST
      ?auto_61742 - PLACE
      ?auto_61740 - PLACE
      ?auto_61743 - HOIST
      ?auto_61744 - SURFACE
      ?auto_61755 - SURFACE
      ?auto_61749 - PLACE
      ?auto_61739 - HOIST
      ?auto_61748 - SURFACE
      ?auto_61747 - SURFACE
      ?auto_61762 - PLACE
      ?auto_61759 - HOIST
      ?auto_61760 - SURFACE
      ?auto_61746 - SURFACE
      ?auto_61750 - PLACE
      ?auto_61757 - HOIST
      ?auto_61764 - SURFACE
      ?auto_61751 - SURFACE
      ?auto_61758 - PLACE
      ?auto_61763 - HOIST
      ?auto_61761 - SURFACE
      ?auto_61754 - SURFACE
      ?auto_61745 - SURFACE
      ?auto_61753 - SURFACE
      ?auto_61756 - TRUCK
      ?auto_61752 - PLACE
      ?auto_61741 - HOIST
      ?auto_61765 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61738 ?auto_61742 ) ( IS-CRATE ?auto_61736 ) ( not ( = ?auto_61736 ?auto_61737 ) ) ( not ( = ?auto_61740 ?auto_61742 ) ) ( HOIST-AT ?auto_61743 ?auto_61740 ) ( not ( = ?auto_61738 ?auto_61743 ) ) ( AVAILABLE ?auto_61743 ) ( SURFACE-AT ?auto_61736 ?auto_61740 ) ( ON ?auto_61736 ?auto_61744 ) ( CLEAR ?auto_61736 ) ( not ( = ?auto_61736 ?auto_61744 ) ) ( not ( = ?auto_61737 ?auto_61744 ) ) ( IS-CRATE ?auto_61737 ) ( not ( = ?auto_61736 ?auto_61755 ) ) ( not ( = ?auto_61737 ?auto_61755 ) ) ( not ( = ?auto_61744 ?auto_61755 ) ) ( not ( = ?auto_61749 ?auto_61742 ) ) ( not ( = ?auto_61740 ?auto_61749 ) ) ( HOIST-AT ?auto_61739 ?auto_61749 ) ( not ( = ?auto_61738 ?auto_61739 ) ) ( not ( = ?auto_61743 ?auto_61739 ) ) ( SURFACE-AT ?auto_61737 ?auto_61749 ) ( ON ?auto_61737 ?auto_61748 ) ( CLEAR ?auto_61737 ) ( not ( = ?auto_61736 ?auto_61748 ) ) ( not ( = ?auto_61737 ?auto_61748 ) ) ( not ( = ?auto_61744 ?auto_61748 ) ) ( not ( = ?auto_61755 ?auto_61748 ) ) ( IS-CRATE ?auto_61755 ) ( not ( = ?auto_61736 ?auto_61747 ) ) ( not ( = ?auto_61737 ?auto_61747 ) ) ( not ( = ?auto_61744 ?auto_61747 ) ) ( not ( = ?auto_61755 ?auto_61747 ) ) ( not ( = ?auto_61748 ?auto_61747 ) ) ( not ( = ?auto_61762 ?auto_61742 ) ) ( not ( = ?auto_61740 ?auto_61762 ) ) ( not ( = ?auto_61749 ?auto_61762 ) ) ( HOIST-AT ?auto_61759 ?auto_61762 ) ( not ( = ?auto_61738 ?auto_61759 ) ) ( not ( = ?auto_61743 ?auto_61759 ) ) ( not ( = ?auto_61739 ?auto_61759 ) ) ( AVAILABLE ?auto_61759 ) ( SURFACE-AT ?auto_61755 ?auto_61762 ) ( ON ?auto_61755 ?auto_61760 ) ( CLEAR ?auto_61755 ) ( not ( = ?auto_61736 ?auto_61760 ) ) ( not ( = ?auto_61737 ?auto_61760 ) ) ( not ( = ?auto_61744 ?auto_61760 ) ) ( not ( = ?auto_61755 ?auto_61760 ) ) ( not ( = ?auto_61748 ?auto_61760 ) ) ( not ( = ?auto_61747 ?auto_61760 ) ) ( IS-CRATE ?auto_61747 ) ( not ( = ?auto_61736 ?auto_61746 ) ) ( not ( = ?auto_61737 ?auto_61746 ) ) ( not ( = ?auto_61744 ?auto_61746 ) ) ( not ( = ?auto_61755 ?auto_61746 ) ) ( not ( = ?auto_61748 ?auto_61746 ) ) ( not ( = ?auto_61747 ?auto_61746 ) ) ( not ( = ?auto_61760 ?auto_61746 ) ) ( not ( = ?auto_61750 ?auto_61742 ) ) ( not ( = ?auto_61740 ?auto_61750 ) ) ( not ( = ?auto_61749 ?auto_61750 ) ) ( not ( = ?auto_61762 ?auto_61750 ) ) ( HOIST-AT ?auto_61757 ?auto_61750 ) ( not ( = ?auto_61738 ?auto_61757 ) ) ( not ( = ?auto_61743 ?auto_61757 ) ) ( not ( = ?auto_61739 ?auto_61757 ) ) ( not ( = ?auto_61759 ?auto_61757 ) ) ( AVAILABLE ?auto_61757 ) ( SURFACE-AT ?auto_61747 ?auto_61750 ) ( ON ?auto_61747 ?auto_61764 ) ( CLEAR ?auto_61747 ) ( not ( = ?auto_61736 ?auto_61764 ) ) ( not ( = ?auto_61737 ?auto_61764 ) ) ( not ( = ?auto_61744 ?auto_61764 ) ) ( not ( = ?auto_61755 ?auto_61764 ) ) ( not ( = ?auto_61748 ?auto_61764 ) ) ( not ( = ?auto_61747 ?auto_61764 ) ) ( not ( = ?auto_61760 ?auto_61764 ) ) ( not ( = ?auto_61746 ?auto_61764 ) ) ( IS-CRATE ?auto_61746 ) ( not ( = ?auto_61736 ?auto_61751 ) ) ( not ( = ?auto_61737 ?auto_61751 ) ) ( not ( = ?auto_61744 ?auto_61751 ) ) ( not ( = ?auto_61755 ?auto_61751 ) ) ( not ( = ?auto_61748 ?auto_61751 ) ) ( not ( = ?auto_61747 ?auto_61751 ) ) ( not ( = ?auto_61760 ?auto_61751 ) ) ( not ( = ?auto_61746 ?auto_61751 ) ) ( not ( = ?auto_61764 ?auto_61751 ) ) ( not ( = ?auto_61758 ?auto_61742 ) ) ( not ( = ?auto_61740 ?auto_61758 ) ) ( not ( = ?auto_61749 ?auto_61758 ) ) ( not ( = ?auto_61762 ?auto_61758 ) ) ( not ( = ?auto_61750 ?auto_61758 ) ) ( HOIST-AT ?auto_61763 ?auto_61758 ) ( not ( = ?auto_61738 ?auto_61763 ) ) ( not ( = ?auto_61743 ?auto_61763 ) ) ( not ( = ?auto_61739 ?auto_61763 ) ) ( not ( = ?auto_61759 ?auto_61763 ) ) ( not ( = ?auto_61757 ?auto_61763 ) ) ( AVAILABLE ?auto_61763 ) ( SURFACE-AT ?auto_61746 ?auto_61758 ) ( ON ?auto_61746 ?auto_61761 ) ( CLEAR ?auto_61746 ) ( not ( = ?auto_61736 ?auto_61761 ) ) ( not ( = ?auto_61737 ?auto_61761 ) ) ( not ( = ?auto_61744 ?auto_61761 ) ) ( not ( = ?auto_61755 ?auto_61761 ) ) ( not ( = ?auto_61748 ?auto_61761 ) ) ( not ( = ?auto_61747 ?auto_61761 ) ) ( not ( = ?auto_61760 ?auto_61761 ) ) ( not ( = ?auto_61746 ?auto_61761 ) ) ( not ( = ?auto_61764 ?auto_61761 ) ) ( not ( = ?auto_61751 ?auto_61761 ) ) ( IS-CRATE ?auto_61751 ) ( not ( = ?auto_61736 ?auto_61754 ) ) ( not ( = ?auto_61737 ?auto_61754 ) ) ( not ( = ?auto_61744 ?auto_61754 ) ) ( not ( = ?auto_61755 ?auto_61754 ) ) ( not ( = ?auto_61748 ?auto_61754 ) ) ( not ( = ?auto_61747 ?auto_61754 ) ) ( not ( = ?auto_61760 ?auto_61754 ) ) ( not ( = ?auto_61746 ?auto_61754 ) ) ( not ( = ?auto_61764 ?auto_61754 ) ) ( not ( = ?auto_61751 ?auto_61754 ) ) ( not ( = ?auto_61761 ?auto_61754 ) ) ( AVAILABLE ?auto_61739 ) ( SURFACE-AT ?auto_61751 ?auto_61749 ) ( ON ?auto_61751 ?auto_61745 ) ( CLEAR ?auto_61751 ) ( not ( = ?auto_61736 ?auto_61745 ) ) ( not ( = ?auto_61737 ?auto_61745 ) ) ( not ( = ?auto_61744 ?auto_61745 ) ) ( not ( = ?auto_61755 ?auto_61745 ) ) ( not ( = ?auto_61748 ?auto_61745 ) ) ( not ( = ?auto_61747 ?auto_61745 ) ) ( not ( = ?auto_61760 ?auto_61745 ) ) ( not ( = ?auto_61746 ?auto_61745 ) ) ( not ( = ?auto_61764 ?auto_61745 ) ) ( not ( = ?auto_61751 ?auto_61745 ) ) ( not ( = ?auto_61761 ?auto_61745 ) ) ( not ( = ?auto_61754 ?auto_61745 ) ) ( SURFACE-AT ?auto_61753 ?auto_61742 ) ( CLEAR ?auto_61753 ) ( IS-CRATE ?auto_61754 ) ( not ( = ?auto_61736 ?auto_61753 ) ) ( not ( = ?auto_61737 ?auto_61753 ) ) ( not ( = ?auto_61744 ?auto_61753 ) ) ( not ( = ?auto_61755 ?auto_61753 ) ) ( not ( = ?auto_61748 ?auto_61753 ) ) ( not ( = ?auto_61747 ?auto_61753 ) ) ( not ( = ?auto_61760 ?auto_61753 ) ) ( not ( = ?auto_61746 ?auto_61753 ) ) ( not ( = ?auto_61764 ?auto_61753 ) ) ( not ( = ?auto_61751 ?auto_61753 ) ) ( not ( = ?auto_61761 ?auto_61753 ) ) ( not ( = ?auto_61754 ?auto_61753 ) ) ( not ( = ?auto_61745 ?auto_61753 ) ) ( AVAILABLE ?auto_61738 ) ( TRUCK-AT ?auto_61756 ?auto_61752 ) ( not ( = ?auto_61752 ?auto_61742 ) ) ( not ( = ?auto_61740 ?auto_61752 ) ) ( not ( = ?auto_61749 ?auto_61752 ) ) ( not ( = ?auto_61762 ?auto_61752 ) ) ( not ( = ?auto_61750 ?auto_61752 ) ) ( not ( = ?auto_61758 ?auto_61752 ) ) ( HOIST-AT ?auto_61741 ?auto_61752 ) ( not ( = ?auto_61738 ?auto_61741 ) ) ( not ( = ?auto_61743 ?auto_61741 ) ) ( not ( = ?auto_61739 ?auto_61741 ) ) ( not ( = ?auto_61759 ?auto_61741 ) ) ( not ( = ?auto_61757 ?auto_61741 ) ) ( not ( = ?auto_61763 ?auto_61741 ) ) ( AVAILABLE ?auto_61741 ) ( SURFACE-AT ?auto_61754 ?auto_61752 ) ( ON ?auto_61754 ?auto_61765 ) ( CLEAR ?auto_61754 ) ( not ( = ?auto_61736 ?auto_61765 ) ) ( not ( = ?auto_61737 ?auto_61765 ) ) ( not ( = ?auto_61744 ?auto_61765 ) ) ( not ( = ?auto_61755 ?auto_61765 ) ) ( not ( = ?auto_61748 ?auto_61765 ) ) ( not ( = ?auto_61747 ?auto_61765 ) ) ( not ( = ?auto_61760 ?auto_61765 ) ) ( not ( = ?auto_61746 ?auto_61765 ) ) ( not ( = ?auto_61764 ?auto_61765 ) ) ( not ( = ?auto_61751 ?auto_61765 ) ) ( not ( = ?auto_61761 ?auto_61765 ) ) ( not ( = ?auto_61754 ?auto_61765 ) ) ( not ( = ?auto_61745 ?auto_61765 ) ) ( not ( = ?auto_61753 ?auto_61765 ) ) )
    :subtasks
    ( ( !LIFT ?auto_61741 ?auto_61754 ?auto_61765 ?auto_61752 )
      ( MAKE-ON ?auto_61736 ?auto_61737 )
      ( MAKE-ON-VERIFY ?auto_61736 ?auto_61737 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61766 - SURFACE
      ?auto_61767 - SURFACE
    )
    :vars
    (
      ?auto_61769 - HOIST
      ?auto_61785 - PLACE
      ?auto_61784 - PLACE
      ?auto_61790 - HOIST
      ?auto_61788 - SURFACE
      ?auto_61780 - SURFACE
      ?auto_61774 - PLACE
      ?auto_61787 - HOIST
      ?auto_61791 - SURFACE
      ?auto_61768 - SURFACE
      ?auto_61772 - PLACE
      ?auto_61776 - HOIST
      ?auto_61777 - SURFACE
      ?auto_61795 - SURFACE
      ?auto_61792 - PLACE
      ?auto_61778 - HOIST
      ?auto_61770 - SURFACE
      ?auto_61786 - SURFACE
      ?auto_61779 - PLACE
      ?auto_61773 - HOIST
      ?auto_61782 - SURFACE
      ?auto_61783 - SURFACE
      ?auto_61794 - SURFACE
      ?auto_61789 - SURFACE
      ?auto_61775 - PLACE
      ?auto_61793 - HOIST
      ?auto_61771 - SURFACE
      ?auto_61781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_61769 ?auto_61785 ) ( IS-CRATE ?auto_61766 ) ( not ( = ?auto_61766 ?auto_61767 ) ) ( not ( = ?auto_61784 ?auto_61785 ) ) ( HOIST-AT ?auto_61790 ?auto_61784 ) ( not ( = ?auto_61769 ?auto_61790 ) ) ( AVAILABLE ?auto_61790 ) ( SURFACE-AT ?auto_61766 ?auto_61784 ) ( ON ?auto_61766 ?auto_61788 ) ( CLEAR ?auto_61766 ) ( not ( = ?auto_61766 ?auto_61788 ) ) ( not ( = ?auto_61767 ?auto_61788 ) ) ( IS-CRATE ?auto_61767 ) ( not ( = ?auto_61766 ?auto_61780 ) ) ( not ( = ?auto_61767 ?auto_61780 ) ) ( not ( = ?auto_61788 ?auto_61780 ) ) ( not ( = ?auto_61774 ?auto_61785 ) ) ( not ( = ?auto_61784 ?auto_61774 ) ) ( HOIST-AT ?auto_61787 ?auto_61774 ) ( not ( = ?auto_61769 ?auto_61787 ) ) ( not ( = ?auto_61790 ?auto_61787 ) ) ( SURFACE-AT ?auto_61767 ?auto_61774 ) ( ON ?auto_61767 ?auto_61791 ) ( CLEAR ?auto_61767 ) ( not ( = ?auto_61766 ?auto_61791 ) ) ( not ( = ?auto_61767 ?auto_61791 ) ) ( not ( = ?auto_61788 ?auto_61791 ) ) ( not ( = ?auto_61780 ?auto_61791 ) ) ( IS-CRATE ?auto_61780 ) ( not ( = ?auto_61766 ?auto_61768 ) ) ( not ( = ?auto_61767 ?auto_61768 ) ) ( not ( = ?auto_61788 ?auto_61768 ) ) ( not ( = ?auto_61780 ?auto_61768 ) ) ( not ( = ?auto_61791 ?auto_61768 ) ) ( not ( = ?auto_61772 ?auto_61785 ) ) ( not ( = ?auto_61784 ?auto_61772 ) ) ( not ( = ?auto_61774 ?auto_61772 ) ) ( HOIST-AT ?auto_61776 ?auto_61772 ) ( not ( = ?auto_61769 ?auto_61776 ) ) ( not ( = ?auto_61790 ?auto_61776 ) ) ( not ( = ?auto_61787 ?auto_61776 ) ) ( AVAILABLE ?auto_61776 ) ( SURFACE-AT ?auto_61780 ?auto_61772 ) ( ON ?auto_61780 ?auto_61777 ) ( CLEAR ?auto_61780 ) ( not ( = ?auto_61766 ?auto_61777 ) ) ( not ( = ?auto_61767 ?auto_61777 ) ) ( not ( = ?auto_61788 ?auto_61777 ) ) ( not ( = ?auto_61780 ?auto_61777 ) ) ( not ( = ?auto_61791 ?auto_61777 ) ) ( not ( = ?auto_61768 ?auto_61777 ) ) ( IS-CRATE ?auto_61768 ) ( not ( = ?auto_61766 ?auto_61795 ) ) ( not ( = ?auto_61767 ?auto_61795 ) ) ( not ( = ?auto_61788 ?auto_61795 ) ) ( not ( = ?auto_61780 ?auto_61795 ) ) ( not ( = ?auto_61791 ?auto_61795 ) ) ( not ( = ?auto_61768 ?auto_61795 ) ) ( not ( = ?auto_61777 ?auto_61795 ) ) ( not ( = ?auto_61792 ?auto_61785 ) ) ( not ( = ?auto_61784 ?auto_61792 ) ) ( not ( = ?auto_61774 ?auto_61792 ) ) ( not ( = ?auto_61772 ?auto_61792 ) ) ( HOIST-AT ?auto_61778 ?auto_61792 ) ( not ( = ?auto_61769 ?auto_61778 ) ) ( not ( = ?auto_61790 ?auto_61778 ) ) ( not ( = ?auto_61787 ?auto_61778 ) ) ( not ( = ?auto_61776 ?auto_61778 ) ) ( AVAILABLE ?auto_61778 ) ( SURFACE-AT ?auto_61768 ?auto_61792 ) ( ON ?auto_61768 ?auto_61770 ) ( CLEAR ?auto_61768 ) ( not ( = ?auto_61766 ?auto_61770 ) ) ( not ( = ?auto_61767 ?auto_61770 ) ) ( not ( = ?auto_61788 ?auto_61770 ) ) ( not ( = ?auto_61780 ?auto_61770 ) ) ( not ( = ?auto_61791 ?auto_61770 ) ) ( not ( = ?auto_61768 ?auto_61770 ) ) ( not ( = ?auto_61777 ?auto_61770 ) ) ( not ( = ?auto_61795 ?auto_61770 ) ) ( IS-CRATE ?auto_61795 ) ( not ( = ?auto_61766 ?auto_61786 ) ) ( not ( = ?auto_61767 ?auto_61786 ) ) ( not ( = ?auto_61788 ?auto_61786 ) ) ( not ( = ?auto_61780 ?auto_61786 ) ) ( not ( = ?auto_61791 ?auto_61786 ) ) ( not ( = ?auto_61768 ?auto_61786 ) ) ( not ( = ?auto_61777 ?auto_61786 ) ) ( not ( = ?auto_61795 ?auto_61786 ) ) ( not ( = ?auto_61770 ?auto_61786 ) ) ( not ( = ?auto_61779 ?auto_61785 ) ) ( not ( = ?auto_61784 ?auto_61779 ) ) ( not ( = ?auto_61774 ?auto_61779 ) ) ( not ( = ?auto_61772 ?auto_61779 ) ) ( not ( = ?auto_61792 ?auto_61779 ) ) ( HOIST-AT ?auto_61773 ?auto_61779 ) ( not ( = ?auto_61769 ?auto_61773 ) ) ( not ( = ?auto_61790 ?auto_61773 ) ) ( not ( = ?auto_61787 ?auto_61773 ) ) ( not ( = ?auto_61776 ?auto_61773 ) ) ( not ( = ?auto_61778 ?auto_61773 ) ) ( AVAILABLE ?auto_61773 ) ( SURFACE-AT ?auto_61795 ?auto_61779 ) ( ON ?auto_61795 ?auto_61782 ) ( CLEAR ?auto_61795 ) ( not ( = ?auto_61766 ?auto_61782 ) ) ( not ( = ?auto_61767 ?auto_61782 ) ) ( not ( = ?auto_61788 ?auto_61782 ) ) ( not ( = ?auto_61780 ?auto_61782 ) ) ( not ( = ?auto_61791 ?auto_61782 ) ) ( not ( = ?auto_61768 ?auto_61782 ) ) ( not ( = ?auto_61777 ?auto_61782 ) ) ( not ( = ?auto_61795 ?auto_61782 ) ) ( not ( = ?auto_61770 ?auto_61782 ) ) ( not ( = ?auto_61786 ?auto_61782 ) ) ( IS-CRATE ?auto_61786 ) ( not ( = ?auto_61766 ?auto_61783 ) ) ( not ( = ?auto_61767 ?auto_61783 ) ) ( not ( = ?auto_61788 ?auto_61783 ) ) ( not ( = ?auto_61780 ?auto_61783 ) ) ( not ( = ?auto_61791 ?auto_61783 ) ) ( not ( = ?auto_61768 ?auto_61783 ) ) ( not ( = ?auto_61777 ?auto_61783 ) ) ( not ( = ?auto_61795 ?auto_61783 ) ) ( not ( = ?auto_61770 ?auto_61783 ) ) ( not ( = ?auto_61786 ?auto_61783 ) ) ( not ( = ?auto_61782 ?auto_61783 ) ) ( AVAILABLE ?auto_61787 ) ( SURFACE-AT ?auto_61786 ?auto_61774 ) ( ON ?auto_61786 ?auto_61794 ) ( CLEAR ?auto_61786 ) ( not ( = ?auto_61766 ?auto_61794 ) ) ( not ( = ?auto_61767 ?auto_61794 ) ) ( not ( = ?auto_61788 ?auto_61794 ) ) ( not ( = ?auto_61780 ?auto_61794 ) ) ( not ( = ?auto_61791 ?auto_61794 ) ) ( not ( = ?auto_61768 ?auto_61794 ) ) ( not ( = ?auto_61777 ?auto_61794 ) ) ( not ( = ?auto_61795 ?auto_61794 ) ) ( not ( = ?auto_61770 ?auto_61794 ) ) ( not ( = ?auto_61786 ?auto_61794 ) ) ( not ( = ?auto_61782 ?auto_61794 ) ) ( not ( = ?auto_61783 ?auto_61794 ) ) ( SURFACE-AT ?auto_61789 ?auto_61785 ) ( CLEAR ?auto_61789 ) ( IS-CRATE ?auto_61783 ) ( not ( = ?auto_61766 ?auto_61789 ) ) ( not ( = ?auto_61767 ?auto_61789 ) ) ( not ( = ?auto_61788 ?auto_61789 ) ) ( not ( = ?auto_61780 ?auto_61789 ) ) ( not ( = ?auto_61791 ?auto_61789 ) ) ( not ( = ?auto_61768 ?auto_61789 ) ) ( not ( = ?auto_61777 ?auto_61789 ) ) ( not ( = ?auto_61795 ?auto_61789 ) ) ( not ( = ?auto_61770 ?auto_61789 ) ) ( not ( = ?auto_61786 ?auto_61789 ) ) ( not ( = ?auto_61782 ?auto_61789 ) ) ( not ( = ?auto_61783 ?auto_61789 ) ) ( not ( = ?auto_61794 ?auto_61789 ) ) ( AVAILABLE ?auto_61769 ) ( not ( = ?auto_61775 ?auto_61785 ) ) ( not ( = ?auto_61784 ?auto_61775 ) ) ( not ( = ?auto_61774 ?auto_61775 ) ) ( not ( = ?auto_61772 ?auto_61775 ) ) ( not ( = ?auto_61792 ?auto_61775 ) ) ( not ( = ?auto_61779 ?auto_61775 ) ) ( HOIST-AT ?auto_61793 ?auto_61775 ) ( not ( = ?auto_61769 ?auto_61793 ) ) ( not ( = ?auto_61790 ?auto_61793 ) ) ( not ( = ?auto_61787 ?auto_61793 ) ) ( not ( = ?auto_61776 ?auto_61793 ) ) ( not ( = ?auto_61778 ?auto_61793 ) ) ( not ( = ?auto_61773 ?auto_61793 ) ) ( AVAILABLE ?auto_61793 ) ( SURFACE-AT ?auto_61783 ?auto_61775 ) ( ON ?auto_61783 ?auto_61771 ) ( CLEAR ?auto_61783 ) ( not ( = ?auto_61766 ?auto_61771 ) ) ( not ( = ?auto_61767 ?auto_61771 ) ) ( not ( = ?auto_61788 ?auto_61771 ) ) ( not ( = ?auto_61780 ?auto_61771 ) ) ( not ( = ?auto_61791 ?auto_61771 ) ) ( not ( = ?auto_61768 ?auto_61771 ) ) ( not ( = ?auto_61777 ?auto_61771 ) ) ( not ( = ?auto_61795 ?auto_61771 ) ) ( not ( = ?auto_61770 ?auto_61771 ) ) ( not ( = ?auto_61786 ?auto_61771 ) ) ( not ( = ?auto_61782 ?auto_61771 ) ) ( not ( = ?auto_61783 ?auto_61771 ) ) ( not ( = ?auto_61794 ?auto_61771 ) ) ( not ( = ?auto_61789 ?auto_61771 ) ) ( TRUCK-AT ?auto_61781 ?auto_61785 ) )
    :subtasks
    ( ( !DRIVE ?auto_61781 ?auto_61785 ?auto_61775 )
      ( MAKE-ON ?auto_61766 ?auto_61767 )
      ( MAKE-ON-VERIFY ?auto_61766 ?auto_61767 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61798 - SURFACE
      ?auto_61799 - SURFACE
    )
    :vars
    (
      ?auto_61800 - HOIST
      ?auto_61801 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61800 ?auto_61801 ) ( SURFACE-AT ?auto_61799 ?auto_61801 ) ( CLEAR ?auto_61799 ) ( LIFTING ?auto_61800 ?auto_61798 ) ( IS-CRATE ?auto_61798 ) ( not ( = ?auto_61798 ?auto_61799 ) ) )
    :subtasks
    ( ( !DROP ?auto_61800 ?auto_61798 ?auto_61799 ?auto_61801 )
      ( MAKE-ON-VERIFY ?auto_61798 ?auto_61799 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61802 - SURFACE
      ?auto_61803 - SURFACE
    )
    :vars
    (
      ?auto_61804 - HOIST
      ?auto_61805 - PLACE
      ?auto_61806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_61804 ?auto_61805 ) ( SURFACE-AT ?auto_61803 ?auto_61805 ) ( CLEAR ?auto_61803 ) ( IS-CRATE ?auto_61802 ) ( not ( = ?auto_61802 ?auto_61803 ) ) ( TRUCK-AT ?auto_61806 ?auto_61805 ) ( AVAILABLE ?auto_61804 ) ( IN ?auto_61802 ?auto_61806 ) )
    :subtasks
    ( ( !UNLOAD ?auto_61804 ?auto_61802 ?auto_61806 ?auto_61805 )
      ( MAKE-ON ?auto_61802 ?auto_61803 )
      ( MAKE-ON-VERIFY ?auto_61802 ?auto_61803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61807 - SURFACE
      ?auto_61808 - SURFACE
    )
    :vars
    (
      ?auto_61809 - HOIST
      ?auto_61810 - PLACE
      ?auto_61811 - TRUCK
      ?auto_61812 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61809 ?auto_61810 ) ( SURFACE-AT ?auto_61808 ?auto_61810 ) ( CLEAR ?auto_61808 ) ( IS-CRATE ?auto_61807 ) ( not ( = ?auto_61807 ?auto_61808 ) ) ( AVAILABLE ?auto_61809 ) ( IN ?auto_61807 ?auto_61811 ) ( TRUCK-AT ?auto_61811 ?auto_61812 ) ( not ( = ?auto_61812 ?auto_61810 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_61811 ?auto_61812 ?auto_61810 )
      ( MAKE-ON ?auto_61807 ?auto_61808 )
      ( MAKE-ON-VERIFY ?auto_61807 ?auto_61808 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61813 - SURFACE
      ?auto_61814 - SURFACE
    )
    :vars
    (
      ?auto_61815 - HOIST
      ?auto_61818 - PLACE
      ?auto_61817 - TRUCK
      ?auto_61816 - PLACE
      ?auto_61819 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_61815 ?auto_61818 ) ( SURFACE-AT ?auto_61814 ?auto_61818 ) ( CLEAR ?auto_61814 ) ( IS-CRATE ?auto_61813 ) ( not ( = ?auto_61813 ?auto_61814 ) ) ( AVAILABLE ?auto_61815 ) ( TRUCK-AT ?auto_61817 ?auto_61816 ) ( not ( = ?auto_61816 ?auto_61818 ) ) ( HOIST-AT ?auto_61819 ?auto_61816 ) ( LIFTING ?auto_61819 ?auto_61813 ) ( not ( = ?auto_61815 ?auto_61819 ) ) )
    :subtasks
    ( ( !LOAD ?auto_61819 ?auto_61813 ?auto_61817 ?auto_61816 )
      ( MAKE-ON ?auto_61813 ?auto_61814 )
      ( MAKE-ON-VERIFY ?auto_61813 ?auto_61814 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61820 - SURFACE
      ?auto_61821 - SURFACE
    )
    :vars
    (
      ?auto_61825 - HOIST
      ?auto_61822 - PLACE
      ?auto_61823 - TRUCK
      ?auto_61826 - PLACE
      ?auto_61824 - HOIST
      ?auto_61827 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61825 ?auto_61822 ) ( SURFACE-AT ?auto_61821 ?auto_61822 ) ( CLEAR ?auto_61821 ) ( IS-CRATE ?auto_61820 ) ( not ( = ?auto_61820 ?auto_61821 ) ) ( AVAILABLE ?auto_61825 ) ( TRUCK-AT ?auto_61823 ?auto_61826 ) ( not ( = ?auto_61826 ?auto_61822 ) ) ( HOIST-AT ?auto_61824 ?auto_61826 ) ( not ( = ?auto_61825 ?auto_61824 ) ) ( AVAILABLE ?auto_61824 ) ( SURFACE-AT ?auto_61820 ?auto_61826 ) ( ON ?auto_61820 ?auto_61827 ) ( CLEAR ?auto_61820 ) ( not ( = ?auto_61820 ?auto_61827 ) ) ( not ( = ?auto_61821 ?auto_61827 ) ) )
    :subtasks
    ( ( !LIFT ?auto_61824 ?auto_61820 ?auto_61827 ?auto_61826 )
      ( MAKE-ON ?auto_61820 ?auto_61821 )
      ( MAKE-ON-VERIFY ?auto_61820 ?auto_61821 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61828 - SURFACE
      ?auto_61829 - SURFACE
    )
    :vars
    (
      ?auto_61831 - HOIST
      ?auto_61833 - PLACE
      ?auto_61830 - PLACE
      ?auto_61832 - HOIST
      ?auto_61834 - SURFACE
      ?auto_61835 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_61831 ?auto_61833 ) ( SURFACE-AT ?auto_61829 ?auto_61833 ) ( CLEAR ?auto_61829 ) ( IS-CRATE ?auto_61828 ) ( not ( = ?auto_61828 ?auto_61829 ) ) ( AVAILABLE ?auto_61831 ) ( not ( = ?auto_61830 ?auto_61833 ) ) ( HOIST-AT ?auto_61832 ?auto_61830 ) ( not ( = ?auto_61831 ?auto_61832 ) ) ( AVAILABLE ?auto_61832 ) ( SURFACE-AT ?auto_61828 ?auto_61830 ) ( ON ?auto_61828 ?auto_61834 ) ( CLEAR ?auto_61828 ) ( not ( = ?auto_61828 ?auto_61834 ) ) ( not ( = ?auto_61829 ?auto_61834 ) ) ( TRUCK-AT ?auto_61835 ?auto_61833 ) )
    :subtasks
    ( ( !DRIVE ?auto_61835 ?auto_61833 ?auto_61830 )
      ( MAKE-ON ?auto_61828 ?auto_61829 )
      ( MAKE-ON-VERIFY ?auto_61828 ?auto_61829 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61836 - SURFACE
      ?auto_61837 - SURFACE
    )
    :vars
    (
      ?auto_61841 - HOIST
      ?auto_61842 - PLACE
      ?auto_61843 - PLACE
      ?auto_61838 - HOIST
      ?auto_61839 - SURFACE
      ?auto_61840 - TRUCK
      ?auto_61844 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61841 ?auto_61842 ) ( IS-CRATE ?auto_61836 ) ( not ( = ?auto_61836 ?auto_61837 ) ) ( not ( = ?auto_61843 ?auto_61842 ) ) ( HOIST-AT ?auto_61838 ?auto_61843 ) ( not ( = ?auto_61841 ?auto_61838 ) ) ( AVAILABLE ?auto_61838 ) ( SURFACE-AT ?auto_61836 ?auto_61843 ) ( ON ?auto_61836 ?auto_61839 ) ( CLEAR ?auto_61836 ) ( not ( = ?auto_61836 ?auto_61839 ) ) ( not ( = ?auto_61837 ?auto_61839 ) ) ( TRUCK-AT ?auto_61840 ?auto_61842 ) ( SURFACE-AT ?auto_61844 ?auto_61842 ) ( CLEAR ?auto_61844 ) ( LIFTING ?auto_61841 ?auto_61837 ) ( IS-CRATE ?auto_61837 ) ( not ( = ?auto_61836 ?auto_61844 ) ) ( not ( = ?auto_61837 ?auto_61844 ) ) ( not ( = ?auto_61839 ?auto_61844 ) ) )
    :subtasks
    ( ( !DROP ?auto_61841 ?auto_61837 ?auto_61844 ?auto_61842 )
      ( MAKE-ON ?auto_61836 ?auto_61837 )
      ( MAKE-ON-VERIFY ?auto_61836 ?auto_61837 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61845 - SURFACE
      ?auto_61846 - SURFACE
    )
    :vars
    (
      ?auto_61853 - HOIST
      ?auto_61848 - PLACE
      ?auto_61851 - PLACE
      ?auto_61849 - HOIST
      ?auto_61852 - SURFACE
      ?auto_61850 - TRUCK
      ?auto_61847 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61853 ?auto_61848 ) ( IS-CRATE ?auto_61845 ) ( not ( = ?auto_61845 ?auto_61846 ) ) ( not ( = ?auto_61851 ?auto_61848 ) ) ( HOIST-AT ?auto_61849 ?auto_61851 ) ( not ( = ?auto_61853 ?auto_61849 ) ) ( AVAILABLE ?auto_61849 ) ( SURFACE-AT ?auto_61845 ?auto_61851 ) ( ON ?auto_61845 ?auto_61852 ) ( CLEAR ?auto_61845 ) ( not ( = ?auto_61845 ?auto_61852 ) ) ( not ( = ?auto_61846 ?auto_61852 ) ) ( TRUCK-AT ?auto_61850 ?auto_61848 ) ( SURFACE-AT ?auto_61847 ?auto_61848 ) ( CLEAR ?auto_61847 ) ( IS-CRATE ?auto_61846 ) ( not ( = ?auto_61845 ?auto_61847 ) ) ( not ( = ?auto_61846 ?auto_61847 ) ) ( not ( = ?auto_61852 ?auto_61847 ) ) ( AVAILABLE ?auto_61853 ) ( IN ?auto_61846 ?auto_61850 ) )
    :subtasks
    ( ( !UNLOAD ?auto_61853 ?auto_61846 ?auto_61850 ?auto_61848 )
      ( MAKE-ON ?auto_61845 ?auto_61846 )
      ( MAKE-ON-VERIFY ?auto_61845 ?auto_61846 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61854 - SURFACE
      ?auto_61855 - SURFACE
    )
    :vars
    (
      ?auto_61856 - HOIST
      ?auto_61859 - PLACE
      ?auto_61861 - PLACE
      ?auto_61858 - HOIST
      ?auto_61857 - SURFACE
      ?auto_61860 - SURFACE
      ?auto_61862 - TRUCK
      ?auto_61863 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61856 ?auto_61859 ) ( IS-CRATE ?auto_61854 ) ( not ( = ?auto_61854 ?auto_61855 ) ) ( not ( = ?auto_61861 ?auto_61859 ) ) ( HOIST-AT ?auto_61858 ?auto_61861 ) ( not ( = ?auto_61856 ?auto_61858 ) ) ( AVAILABLE ?auto_61858 ) ( SURFACE-AT ?auto_61854 ?auto_61861 ) ( ON ?auto_61854 ?auto_61857 ) ( CLEAR ?auto_61854 ) ( not ( = ?auto_61854 ?auto_61857 ) ) ( not ( = ?auto_61855 ?auto_61857 ) ) ( SURFACE-AT ?auto_61860 ?auto_61859 ) ( CLEAR ?auto_61860 ) ( IS-CRATE ?auto_61855 ) ( not ( = ?auto_61854 ?auto_61860 ) ) ( not ( = ?auto_61855 ?auto_61860 ) ) ( not ( = ?auto_61857 ?auto_61860 ) ) ( AVAILABLE ?auto_61856 ) ( IN ?auto_61855 ?auto_61862 ) ( TRUCK-AT ?auto_61862 ?auto_61863 ) ( not ( = ?auto_61863 ?auto_61859 ) ) ( not ( = ?auto_61861 ?auto_61863 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_61862 ?auto_61863 ?auto_61859 )
      ( MAKE-ON ?auto_61854 ?auto_61855 )
      ( MAKE-ON-VERIFY ?auto_61854 ?auto_61855 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61864 - SURFACE
      ?auto_61865 - SURFACE
    )
    :vars
    (
      ?auto_61870 - HOIST
      ?auto_61868 - PLACE
      ?auto_61867 - PLACE
      ?auto_61869 - HOIST
      ?auto_61873 - SURFACE
      ?auto_61866 - SURFACE
      ?auto_61872 - TRUCK
      ?auto_61871 - PLACE
      ?auto_61874 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_61870 ?auto_61868 ) ( IS-CRATE ?auto_61864 ) ( not ( = ?auto_61864 ?auto_61865 ) ) ( not ( = ?auto_61867 ?auto_61868 ) ) ( HOIST-AT ?auto_61869 ?auto_61867 ) ( not ( = ?auto_61870 ?auto_61869 ) ) ( AVAILABLE ?auto_61869 ) ( SURFACE-AT ?auto_61864 ?auto_61867 ) ( ON ?auto_61864 ?auto_61873 ) ( CLEAR ?auto_61864 ) ( not ( = ?auto_61864 ?auto_61873 ) ) ( not ( = ?auto_61865 ?auto_61873 ) ) ( SURFACE-AT ?auto_61866 ?auto_61868 ) ( CLEAR ?auto_61866 ) ( IS-CRATE ?auto_61865 ) ( not ( = ?auto_61864 ?auto_61866 ) ) ( not ( = ?auto_61865 ?auto_61866 ) ) ( not ( = ?auto_61873 ?auto_61866 ) ) ( AVAILABLE ?auto_61870 ) ( TRUCK-AT ?auto_61872 ?auto_61871 ) ( not ( = ?auto_61871 ?auto_61868 ) ) ( not ( = ?auto_61867 ?auto_61871 ) ) ( HOIST-AT ?auto_61874 ?auto_61871 ) ( LIFTING ?auto_61874 ?auto_61865 ) ( not ( = ?auto_61870 ?auto_61874 ) ) ( not ( = ?auto_61869 ?auto_61874 ) ) )
    :subtasks
    ( ( !LOAD ?auto_61874 ?auto_61865 ?auto_61872 ?auto_61871 )
      ( MAKE-ON ?auto_61864 ?auto_61865 )
      ( MAKE-ON-VERIFY ?auto_61864 ?auto_61865 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61875 - SURFACE
      ?auto_61876 - SURFACE
    )
    :vars
    (
      ?auto_61882 - HOIST
      ?auto_61879 - PLACE
      ?auto_61883 - PLACE
      ?auto_61881 - HOIST
      ?auto_61885 - SURFACE
      ?auto_61877 - SURFACE
      ?auto_61880 - TRUCK
      ?auto_61884 - PLACE
      ?auto_61878 - HOIST
      ?auto_61886 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61882 ?auto_61879 ) ( IS-CRATE ?auto_61875 ) ( not ( = ?auto_61875 ?auto_61876 ) ) ( not ( = ?auto_61883 ?auto_61879 ) ) ( HOIST-AT ?auto_61881 ?auto_61883 ) ( not ( = ?auto_61882 ?auto_61881 ) ) ( AVAILABLE ?auto_61881 ) ( SURFACE-AT ?auto_61875 ?auto_61883 ) ( ON ?auto_61875 ?auto_61885 ) ( CLEAR ?auto_61875 ) ( not ( = ?auto_61875 ?auto_61885 ) ) ( not ( = ?auto_61876 ?auto_61885 ) ) ( SURFACE-AT ?auto_61877 ?auto_61879 ) ( CLEAR ?auto_61877 ) ( IS-CRATE ?auto_61876 ) ( not ( = ?auto_61875 ?auto_61877 ) ) ( not ( = ?auto_61876 ?auto_61877 ) ) ( not ( = ?auto_61885 ?auto_61877 ) ) ( AVAILABLE ?auto_61882 ) ( TRUCK-AT ?auto_61880 ?auto_61884 ) ( not ( = ?auto_61884 ?auto_61879 ) ) ( not ( = ?auto_61883 ?auto_61884 ) ) ( HOIST-AT ?auto_61878 ?auto_61884 ) ( not ( = ?auto_61882 ?auto_61878 ) ) ( not ( = ?auto_61881 ?auto_61878 ) ) ( AVAILABLE ?auto_61878 ) ( SURFACE-AT ?auto_61876 ?auto_61884 ) ( ON ?auto_61876 ?auto_61886 ) ( CLEAR ?auto_61876 ) ( not ( = ?auto_61875 ?auto_61886 ) ) ( not ( = ?auto_61876 ?auto_61886 ) ) ( not ( = ?auto_61885 ?auto_61886 ) ) ( not ( = ?auto_61877 ?auto_61886 ) ) )
    :subtasks
    ( ( !LIFT ?auto_61878 ?auto_61876 ?auto_61886 ?auto_61884 )
      ( MAKE-ON ?auto_61875 ?auto_61876 )
      ( MAKE-ON-VERIFY ?auto_61875 ?auto_61876 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61887 - SURFACE
      ?auto_61888 - SURFACE
    )
    :vars
    (
      ?auto_61897 - HOIST
      ?auto_61893 - PLACE
      ?auto_61894 - PLACE
      ?auto_61895 - HOIST
      ?auto_61890 - SURFACE
      ?auto_61889 - SURFACE
      ?auto_61891 - PLACE
      ?auto_61892 - HOIST
      ?auto_61898 - SURFACE
      ?auto_61896 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_61897 ?auto_61893 ) ( IS-CRATE ?auto_61887 ) ( not ( = ?auto_61887 ?auto_61888 ) ) ( not ( = ?auto_61894 ?auto_61893 ) ) ( HOIST-AT ?auto_61895 ?auto_61894 ) ( not ( = ?auto_61897 ?auto_61895 ) ) ( AVAILABLE ?auto_61895 ) ( SURFACE-AT ?auto_61887 ?auto_61894 ) ( ON ?auto_61887 ?auto_61890 ) ( CLEAR ?auto_61887 ) ( not ( = ?auto_61887 ?auto_61890 ) ) ( not ( = ?auto_61888 ?auto_61890 ) ) ( SURFACE-AT ?auto_61889 ?auto_61893 ) ( CLEAR ?auto_61889 ) ( IS-CRATE ?auto_61888 ) ( not ( = ?auto_61887 ?auto_61889 ) ) ( not ( = ?auto_61888 ?auto_61889 ) ) ( not ( = ?auto_61890 ?auto_61889 ) ) ( AVAILABLE ?auto_61897 ) ( not ( = ?auto_61891 ?auto_61893 ) ) ( not ( = ?auto_61894 ?auto_61891 ) ) ( HOIST-AT ?auto_61892 ?auto_61891 ) ( not ( = ?auto_61897 ?auto_61892 ) ) ( not ( = ?auto_61895 ?auto_61892 ) ) ( AVAILABLE ?auto_61892 ) ( SURFACE-AT ?auto_61888 ?auto_61891 ) ( ON ?auto_61888 ?auto_61898 ) ( CLEAR ?auto_61888 ) ( not ( = ?auto_61887 ?auto_61898 ) ) ( not ( = ?auto_61888 ?auto_61898 ) ) ( not ( = ?auto_61890 ?auto_61898 ) ) ( not ( = ?auto_61889 ?auto_61898 ) ) ( TRUCK-AT ?auto_61896 ?auto_61893 ) )
    :subtasks
    ( ( !DRIVE ?auto_61896 ?auto_61893 ?auto_61891 )
      ( MAKE-ON ?auto_61887 ?auto_61888 )
      ( MAKE-ON-VERIFY ?auto_61887 ?auto_61888 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61899 - SURFACE
      ?auto_61900 - SURFACE
    )
    :vars
    (
      ?auto_61902 - HOIST
      ?auto_61901 - PLACE
      ?auto_61904 - PLACE
      ?auto_61903 - HOIST
      ?auto_61910 - SURFACE
      ?auto_61908 - SURFACE
      ?auto_61907 - PLACE
      ?auto_61905 - HOIST
      ?auto_61909 - SURFACE
      ?auto_61906 - TRUCK
      ?auto_61911 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61902 ?auto_61901 ) ( IS-CRATE ?auto_61899 ) ( not ( = ?auto_61899 ?auto_61900 ) ) ( not ( = ?auto_61904 ?auto_61901 ) ) ( HOIST-AT ?auto_61903 ?auto_61904 ) ( not ( = ?auto_61902 ?auto_61903 ) ) ( AVAILABLE ?auto_61903 ) ( SURFACE-AT ?auto_61899 ?auto_61904 ) ( ON ?auto_61899 ?auto_61910 ) ( CLEAR ?auto_61899 ) ( not ( = ?auto_61899 ?auto_61910 ) ) ( not ( = ?auto_61900 ?auto_61910 ) ) ( IS-CRATE ?auto_61900 ) ( not ( = ?auto_61899 ?auto_61908 ) ) ( not ( = ?auto_61900 ?auto_61908 ) ) ( not ( = ?auto_61910 ?auto_61908 ) ) ( not ( = ?auto_61907 ?auto_61901 ) ) ( not ( = ?auto_61904 ?auto_61907 ) ) ( HOIST-AT ?auto_61905 ?auto_61907 ) ( not ( = ?auto_61902 ?auto_61905 ) ) ( not ( = ?auto_61903 ?auto_61905 ) ) ( AVAILABLE ?auto_61905 ) ( SURFACE-AT ?auto_61900 ?auto_61907 ) ( ON ?auto_61900 ?auto_61909 ) ( CLEAR ?auto_61900 ) ( not ( = ?auto_61899 ?auto_61909 ) ) ( not ( = ?auto_61900 ?auto_61909 ) ) ( not ( = ?auto_61910 ?auto_61909 ) ) ( not ( = ?auto_61908 ?auto_61909 ) ) ( TRUCK-AT ?auto_61906 ?auto_61901 ) ( SURFACE-AT ?auto_61911 ?auto_61901 ) ( CLEAR ?auto_61911 ) ( LIFTING ?auto_61902 ?auto_61908 ) ( IS-CRATE ?auto_61908 ) ( not ( = ?auto_61899 ?auto_61911 ) ) ( not ( = ?auto_61900 ?auto_61911 ) ) ( not ( = ?auto_61910 ?auto_61911 ) ) ( not ( = ?auto_61908 ?auto_61911 ) ) ( not ( = ?auto_61909 ?auto_61911 ) ) )
    :subtasks
    ( ( !DROP ?auto_61902 ?auto_61908 ?auto_61911 ?auto_61901 )
      ( MAKE-ON ?auto_61899 ?auto_61900 )
      ( MAKE-ON-VERIFY ?auto_61899 ?auto_61900 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61912 - SURFACE
      ?auto_61913 - SURFACE
    )
    :vars
    (
      ?auto_61920 - HOIST
      ?auto_61914 - PLACE
      ?auto_61919 - PLACE
      ?auto_61917 - HOIST
      ?auto_61923 - SURFACE
      ?auto_61924 - SURFACE
      ?auto_61922 - PLACE
      ?auto_61921 - HOIST
      ?auto_61915 - SURFACE
      ?auto_61918 - TRUCK
      ?auto_61916 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61920 ?auto_61914 ) ( IS-CRATE ?auto_61912 ) ( not ( = ?auto_61912 ?auto_61913 ) ) ( not ( = ?auto_61919 ?auto_61914 ) ) ( HOIST-AT ?auto_61917 ?auto_61919 ) ( not ( = ?auto_61920 ?auto_61917 ) ) ( AVAILABLE ?auto_61917 ) ( SURFACE-AT ?auto_61912 ?auto_61919 ) ( ON ?auto_61912 ?auto_61923 ) ( CLEAR ?auto_61912 ) ( not ( = ?auto_61912 ?auto_61923 ) ) ( not ( = ?auto_61913 ?auto_61923 ) ) ( IS-CRATE ?auto_61913 ) ( not ( = ?auto_61912 ?auto_61924 ) ) ( not ( = ?auto_61913 ?auto_61924 ) ) ( not ( = ?auto_61923 ?auto_61924 ) ) ( not ( = ?auto_61922 ?auto_61914 ) ) ( not ( = ?auto_61919 ?auto_61922 ) ) ( HOIST-AT ?auto_61921 ?auto_61922 ) ( not ( = ?auto_61920 ?auto_61921 ) ) ( not ( = ?auto_61917 ?auto_61921 ) ) ( AVAILABLE ?auto_61921 ) ( SURFACE-AT ?auto_61913 ?auto_61922 ) ( ON ?auto_61913 ?auto_61915 ) ( CLEAR ?auto_61913 ) ( not ( = ?auto_61912 ?auto_61915 ) ) ( not ( = ?auto_61913 ?auto_61915 ) ) ( not ( = ?auto_61923 ?auto_61915 ) ) ( not ( = ?auto_61924 ?auto_61915 ) ) ( TRUCK-AT ?auto_61918 ?auto_61914 ) ( SURFACE-AT ?auto_61916 ?auto_61914 ) ( CLEAR ?auto_61916 ) ( IS-CRATE ?auto_61924 ) ( not ( = ?auto_61912 ?auto_61916 ) ) ( not ( = ?auto_61913 ?auto_61916 ) ) ( not ( = ?auto_61923 ?auto_61916 ) ) ( not ( = ?auto_61924 ?auto_61916 ) ) ( not ( = ?auto_61915 ?auto_61916 ) ) ( AVAILABLE ?auto_61920 ) ( IN ?auto_61924 ?auto_61918 ) )
    :subtasks
    ( ( !UNLOAD ?auto_61920 ?auto_61924 ?auto_61918 ?auto_61914 )
      ( MAKE-ON ?auto_61912 ?auto_61913 )
      ( MAKE-ON-VERIFY ?auto_61912 ?auto_61913 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61925 - SURFACE
      ?auto_61926 - SURFACE
    )
    :vars
    (
      ?auto_61932 - HOIST
      ?auto_61927 - PLACE
      ?auto_61936 - PLACE
      ?auto_61930 - HOIST
      ?auto_61933 - SURFACE
      ?auto_61929 - SURFACE
      ?auto_61931 - PLACE
      ?auto_61934 - HOIST
      ?auto_61928 - SURFACE
      ?auto_61935 - SURFACE
      ?auto_61937 - TRUCK
      ?auto_61938 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61932 ?auto_61927 ) ( IS-CRATE ?auto_61925 ) ( not ( = ?auto_61925 ?auto_61926 ) ) ( not ( = ?auto_61936 ?auto_61927 ) ) ( HOIST-AT ?auto_61930 ?auto_61936 ) ( not ( = ?auto_61932 ?auto_61930 ) ) ( AVAILABLE ?auto_61930 ) ( SURFACE-AT ?auto_61925 ?auto_61936 ) ( ON ?auto_61925 ?auto_61933 ) ( CLEAR ?auto_61925 ) ( not ( = ?auto_61925 ?auto_61933 ) ) ( not ( = ?auto_61926 ?auto_61933 ) ) ( IS-CRATE ?auto_61926 ) ( not ( = ?auto_61925 ?auto_61929 ) ) ( not ( = ?auto_61926 ?auto_61929 ) ) ( not ( = ?auto_61933 ?auto_61929 ) ) ( not ( = ?auto_61931 ?auto_61927 ) ) ( not ( = ?auto_61936 ?auto_61931 ) ) ( HOIST-AT ?auto_61934 ?auto_61931 ) ( not ( = ?auto_61932 ?auto_61934 ) ) ( not ( = ?auto_61930 ?auto_61934 ) ) ( AVAILABLE ?auto_61934 ) ( SURFACE-AT ?auto_61926 ?auto_61931 ) ( ON ?auto_61926 ?auto_61928 ) ( CLEAR ?auto_61926 ) ( not ( = ?auto_61925 ?auto_61928 ) ) ( not ( = ?auto_61926 ?auto_61928 ) ) ( not ( = ?auto_61933 ?auto_61928 ) ) ( not ( = ?auto_61929 ?auto_61928 ) ) ( SURFACE-AT ?auto_61935 ?auto_61927 ) ( CLEAR ?auto_61935 ) ( IS-CRATE ?auto_61929 ) ( not ( = ?auto_61925 ?auto_61935 ) ) ( not ( = ?auto_61926 ?auto_61935 ) ) ( not ( = ?auto_61933 ?auto_61935 ) ) ( not ( = ?auto_61929 ?auto_61935 ) ) ( not ( = ?auto_61928 ?auto_61935 ) ) ( AVAILABLE ?auto_61932 ) ( IN ?auto_61929 ?auto_61937 ) ( TRUCK-AT ?auto_61937 ?auto_61938 ) ( not ( = ?auto_61938 ?auto_61927 ) ) ( not ( = ?auto_61936 ?auto_61938 ) ) ( not ( = ?auto_61931 ?auto_61938 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_61937 ?auto_61938 ?auto_61927 )
      ( MAKE-ON ?auto_61925 ?auto_61926 )
      ( MAKE-ON-VERIFY ?auto_61925 ?auto_61926 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61939 - SURFACE
      ?auto_61940 - SURFACE
    )
    :vars
    (
      ?auto_61942 - HOIST
      ?auto_61947 - PLACE
      ?auto_61945 - PLACE
      ?auto_61951 - HOIST
      ?auto_61948 - SURFACE
      ?auto_61946 - SURFACE
      ?auto_61941 - PLACE
      ?auto_61944 - HOIST
      ?auto_61952 - SURFACE
      ?auto_61943 - SURFACE
      ?auto_61950 - TRUCK
      ?auto_61949 - PLACE
      ?auto_61953 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_61942 ?auto_61947 ) ( IS-CRATE ?auto_61939 ) ( not ( = ?auto_61939 ?auto_61940 ) ) ( not ( = ?auto_61945 ?auto_61947 ) ) ( HOIST-AT ?auto_61951 ?auto_61945 ) ( not ( = ?auto_61942 ?auto_61951 ) ) ( AVAILABLE ?auto_61951 ) ( SURFACE-AT ?auto_61939 ?auto_61945 ) ( ON ?auto_61939 ?auto_61948 ) ( CLEAR ?auto_61939 ) ( not ( = ?auto_61939 ?auto_61948 ) ) ( not ( = ?auto_61940 ?auto_61948 ) ) ( IS-CRATE ?auto_61940 ) ( not ( = ?auto_61939 ?auto_61946 ) ) ( not ( = ?auto_61940 ?auto_61946 ) ) ( not ( = ?auto_61948 ?auto_61946 ) ) ( not ( = ?auto_61941 ?auto_61947 ) ) ( not ( = ?auto_61945 ?auto_61941 ) ) ( HOIST-AT ?auto_61944 ?auto_61941 ) ( not ( = ?auto_61942 ?auto_61944 ) ) ( not ( = ?auto_61951 ?auto_61944 ) ) ( AVAILABLE ?auto_61944 ) ( SURFACE-AT ?auto_61940 ?auto_61941 ) ( ON ?auto_61940 ?auto_61952 ) ( CLEAR ?auto_61940 ) ( not ( = ?auto_61939 ?auto_61952 ) ) ( not ( = ?auto_61940 ?auto_61952 ) ) ( not ( = ?auto_61948 ?auto_61952 ) ) ( not ( = ?auto_61946 ?auto_61952 ) ) ( SURFACE-AT ?auto_61943 ?auto_61947 ) ( CLEAR ?auto_61943 ) ( IS-CRATE ?auto_61946 ) ( not ( = ?auto_61939 ?auto_61943 ) ) ( not ( = ?auto_61940 ?auto_61943 ) ) ( not ( = ?auto_61948 ?auto_61943 ) ) ( not ( = ?auto_61946 ?auto_61943 ) ) ( not ( = ?auto_61952 ?auto_61943 ) ) ( AVAILABLE ?auto_61942 ) ( TRUCK-AT ?auto_61950 ?auto_61949 ) ( not ( = ?auto_61949 ?auto_61947 ) ) ( not ( = ?auto_61945 ?auto_61949 ) ) ( not ( = ?auto_61941 ?auto_61949 ) ) ( HOIST-AT ?auto_61953 ?auto_61949 ) ( LIFTING ?auto_61953 ?auto_61946 ) ( not ( = ?auto_61942 ?auto_61953 ) ) ( not ( = ?auto_61951 ?auto_61953 ) ) ( not ( = ?auto_61944 ?auto_61953 ) ) )
    :subtasks
    ( ( !LOAD ?auto_61953 ?auto_61946 ?auto_61950 ?auto_61949 )
      ( MAKE-ON ?auto_61939 ?auto_61940 )
      ( MAKE-ON-VERIFY ?auto_61939 ?auto_61940 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61954 - SURFACE
      ?auto_61955 - SURFACE
    )
    :vars
    (
      ?auto_61958 - HOIST
      ?auto_61962 - PLACE
      ?auto_61968 - PLACE
      ?auto_61966 - HOIST
      ?auto_61965 - SURFACE
      ?auto_61964 - SURFACE
      ?auto_61956 - PLACE
      ?auto_61967 - HOIST
      ?auto_61957 - SURFACE
      ?auto_61960 - SURFACE
      ?auto_61959 - TRUCK
      ?auto_61963 - PLACE
      ?auto_61961 - HOIST
      ?auto_61969 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61958 ?auto_61962 ) ( IS-CRATE ?auto_61954 ) ( not ( = ?auto_61954 ?auto_61955 ) ) ( not ( = ?auto_61968 ?auto_61962 ) ) ( HOIST-AT ?auto_61966 ?auto_61968 ) ( not ( = ?auto_61958 ?auto_61966 ) ) ( AVAILABLE ?auto_61966 ) ( SURFACE-AT ?auto_61954 ?auto_61968 ) ( ON ?auto_61954 ?auto_61965 ) ( CLEAR ?auto_61954 ) ( not ( = ?auto_61954 ?auto_61965 ) ) ( not ( = ?auto_61955 ?auto_61965 ) ) ( IS-CRATE ?auto_61955 ) ( not ( = ?auto_61954 ?auto_61964 ) ) ( not ( = ?auto_61955 ?auto_61964 ) ) ( not ( = ?auto_61965 ?auto_61964 ) ) ( not ( = ?auto_61956 ?auto_61962 ) ) ( not ( = ?auto_61968 ?auto_61956 ) ) ( HOIST-AT ?auto_61967 ?auto_61956 ) ( not ( = ?auto_61958 ?auto_61967 ) ) ( not ( = ?auto_61966 ?auto_61967 ) ) ( AVAILABLE ?auto_61967 ) ( SURFACE-AT ?auto_61955 ?auto_61956 ) ( ON ?auto_61955 ?auto_61957 ) ( CLEAR ?auto_61955 ) ( not ( = ?auto_61954 ?auto_61957 ) ) ( not ( = ?auto_61955 ?auto_61957 ) ) ( not ( = ?auto_61965 ?auto_61957 ) ) ( not ( = ?auto_61964 ?auto_61957 ) ) ( SURFACE-AT ?auto_61960 ?auto_61962 ) ( CLEAR ?auto_61960 ) ( IS-CRATE ?auto_61964 ) ( not ( = ?auto_61954 ?auto_61960 ) ) ( not ( = ?auto_61955 ?auto_61960 ) ) ( not ( = ?auto_61965 ?auto_61960 ) ) ( not ( = ?auto_61964 ?auto_61960 ) ) ( not ( = ?auto_61957 ?auto_61960 ) ) ( AVAILABLE ?auto_61958 ) ( TRUCK-AT ?auto_61959 ?auto_61963 ) ( not ( = ?auto_61963 ?auto_61962 ) ) ( not ( = ?auto_61968 ?auto_61963 ) ) ( not ( = ?auto_61956 ?auto_61963 ) ) ( HOIST-AT ?auto_61961 ?auto_61963 ) ( not ( = ?auto_61958 ?auto_61961 ) ) ( not ( = ?auto_61966 ?auto_61961 ) ) ( not ( = ?auto_61967 ?auto_61961 ) ) ( AVAILABLE ?auto_61961 ) ( SURFACE-AT ?auto_61964 ?auto_61963 ) ( ON ?auto_61964 ?auto_61969 ) ( CLEAR ?auto_61964 ) ( not ( = ?auto_61954 ?auto_61969 ) ) ( not ( = ?auto_61955 ?auto_61969 ) ) ( not ( = ?auto_61965 ?auto_61969 ) ) ( not ( = ?auto_61964 ?auto_61969 ) ) ( not ( = ?auto_61957 ?auto_61969 ) ) ( not ( = ?auto_61960 ?auto_61969 ) ) )
    :subtasks
    ( ( !LIFT ?auto_61961 ?auto_61964 ?auto_61969 ?auto_61963 )
      ( MAKE-ON ?auto_61954 ?auto_61955 )
      ( MAKE-ON-VERIFY ?auto_61954 ?auto_61955 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61970 - SURFACE
      ?auto_61971 - SURFACE
    )
    :vars
    (
      ?auto_61974 - HOIST
      ?auto_61976 - PLACE
      ?auto_61977 - PLACE
      ?auto_61981 - HOIST
      ?auto_61973 - SURFACE
      ?auto_61983 - SURFACE
      ?auto_61984 - PLACE
      ?auto_61980 - HOIST
      ?auto_61978 - SURFACE
      ?auto_61972 - SURFACE
      ?auto_61975 - PLACE
      ?auto_61979 - HOIST
      ?auto_61985 - SURFACE
      ?auto_61982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_61974 ?auto_61976 ) ( IS-CRATE ?auto_61970 ) ( not ( = ?auto_61970 ?auto_61971 ) ) ( not ( = ?auto_61977 ?auto_61976 ) ) ( HOIST-AT ?auto_61981 ?auto_61977 ) ( not ( = ?auto_61974 ?auto_61981 ) ) ( AVAILABLE ?auto_61981 ) ( SURFACE-AT ?auto_61970 ?auto_61977 ) ( ON ?auto_61970 ?auto_61973 ) ( CLEAR ?auto_61970 ) ( not ( = ?auto_61970 ?auto_61973 ) ) ( not ( = ?auto_61971 ?auto_61973 ) ) ( IS-CRATE ?auto_61971 ) ( not ( = ?auto_61970 ?auto_61983 ) ) ( not ( = ?auto_61971 ?auto_61983 ) ) ( not ( = ?auto_61973 ?auto_61983 ) ) ( not ( = ?auto_61984 ?auto_61976 ) ) ( not ( = ?auto_61977 ?auto_61984 ) ) ( HOIST-AT ?auto_61980 ?auto_61984 ) ( not ( = ?auto_61974 ?auto_61980 ) ) ( not ( = ?auto_61981 ?auto_61980 ) ) ( AVAILABLE ?auto_61980 ) ( SURFACE-AT ?auto_61971 ?auto_61984 ) ( ON ?auto_61971 ?auto_61978 ) ( CLEAR ?auto_61971 ) ( not ( = ?auto_61970 ?auto_61978 ) ) ( not ( = ?auto_61971 ?auto_61978 ) ) ( not ( = ?auto_61973 ?auto_61978 ) ) ( not ( = ?auto_61983 ?auto_61978 ) ) ( SURFACE-AT ?auto_61972 ?auto_61976 ) ( CLEAR ?auto_61972 ) ( IS-CRATE ?auto_61983 ) ( not ( = ?auto_61970 ?auto_61972 ) ) ( not ( = ?auto_61971 ?auto_61972 ) ) ( not ( = ?auto_61973 ?auto_61972 ) ) ( not ( = ?auto_61983 ?auto_61972 ) ) ( not ( = ?auto_61978 ?auto_61972 ) ) ( AVAILABLE ?auto_61974 ) ( not ( = ?auto_61975 ?auto_61976 ) ) ( not ( = ?auto_61977 ?auto_61975 ) ) ( not ( = ?auto_61984 ?auto_61975 ) ) ( HOIST-AT ?auto_61979 ?auto_61975 ) ( not ( = ?auto_61974 ?auto_61979 ) ) ( not ( = ?auto_61981 ?auto_61979 ) ) ( not ( = ?auto_61980 ?auto_61979 ) ) ( AVAILABLE ?auto_61979 ) ( SURFACE-AT ?auto_61983 ?auto_61975 ) ( ON ?auto_61983 ?auto_61985 ) ( CLEAR ?auto_61983 ) ( not ( = ?auto_61970 ?auto_61985 ) ) ( not ( = ?auto_61971 ?auto_61985 ) ) ( not ( = ?auto_61973 ?auto_61985 ) ) ( not ( = ?auto_61983 ?auto_61985 ) ) ( not ( = ?auto_61978 ?auto_61985 ) ) ( not ( = ?auto_61972 ?auto_61985 ) ) ( TRUCK-AT ?auto_61982 ?auto_61976 ) )
    :subtasks
    ( ( !DRIVE ?auto_61982 ?auto_61976 ?auto_61975 )
      ( MAKE-ON ?auto_61970 ?auto_61971 )
      ( MAKE-ON-VERIFY ?auto_61970 ?auto_61971 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_61986 - SURFACE
      ?auto_61987 - SURFACE
    )
    :vars
    (
      ?auto_61993 - HOIST
      ?auto_61989 - PLACE
      ?auto_61991 - PLACE
      ?auto_61992 - HOIST
      ?auto_61996 - SURFACE
      ?auto_61997 - SURFACE
      ?auto_62001 - PLACE
      ?auto_62000 - HOIST
      ?auto_61994 - SURFACE
      ?auto_61990 - SURFACE
      ?auto_61999 - PLACE
      ?auto_61995 - HOIST
      ?auto_61998 - SURFACE
      ?auto_61988 - TRUCK
      ?auto_62002 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_61993 ?auto_61989 ) ( IS-CRATE ?auto_61986 ) ( not ( = ?auto_61986 ?auto_61987 ) ) ( not ( = ?auto_61991 ?auto_61989 ) ) ( HOIST-AT ?auto_61992 ?auto_61991 ) ( not ( = ?auto_61993 ?auto_61992 ) ) ( AVAILABLE ?auto_61992 ) ( SURFACE-AT ?auto_61986 ?auto_61991 ) ( ON ?auto_61986 ?auto_61996 ) ( CLEAR ?auto_61986 ) ( not ( = ?auto_61986 ?auto_61996 ) ) ( not ( = ?auto_61987 ?auto_61996 ) ) ( IS-CRATE ?auto_61987 ) ( not ( = ?auto_61986 ?auto_61997 ) ) ( not ( = ?auto_61987 ?auto_61997 ) ) ( not ( = ?auto_61996 ?auto_61997 ) ) ( not ( = ?auto_62001 ?auto_61989 ) ) ( not ( = ?auto_61991 ?auto_62001 ) ) ( HOIST-AT ?auto_62000 ?auto_62001 ) ( not ( = ?auto_61993 ?auto_62000 ) ) ( not ( = ?auto_61992 ?auto_62000 ) ) ( AVAILABLE ?auto_62000 ) ( SURFACE-AT ?auto_61987 ?auto_62001 ) ( ON ?auto_61987 ?auto_61994 ) ( CLEAR ?auto_61987 ) ( not ( = ?auto_61986 ?auto_61994 ) ) ( not ( = ?auto_61987 ?auto_61994 ) ) ( not ( = ?auto_61996 ?auto_61994 ) ) ( not ( = ?auto_61997 ?auto_61994 ) ) ( IS-CRATE ?auto_61997 ) ( not ( = ?auto_61986 ?auto_61990 ) ) ( not ( = ?auto_61987 ?auto_61990 ) ) ( not ( = ?auto_61996 ?auto_61990 ) ) ( not ( = ?auto_61997 ?auto_61990 ) ) ( not ( = ?auto_61994 ?auto_61990 ) ) ( not ( = ?auto_61999 ?auto_61989 ) ) ( not ( = ?auto_61991 ?auto_61999 ) ) ( not ( = ?auto_62001 ?auto_61999 ) ) ( HOIST-AT ?auto_61995 ?auto_61999 ) ( not ( = ?auto_61993 ?auto_61995 ) ) ( not ( = ?auto_61992 ?auto_61995 ) ) ( not ( = ?auto_62000 ?auto_61995 ) ) ( AVAILABLE ?auto_61995 ) ( SURFACE-AT ?auto_61997 ?auto_61999 ) ( ON ?auto_61997 ?auto_61998 ) ( CLEAR ?auto_61997 ) ( not ( = ?auto_61986 ?auto_61998 ) ) ( not ( = ?auto_61987 ?auto_61998 ) ) ( not ( = ?auto_61996 ?auto_61998 ) ) ( not ( = ?auto_61997 ?auto_61998 ) ) ( not ( = ?auto_61994 ?auto_61998 ) ) ( not ( = ?auto_61990 ?auto_61998 ) ) ( TRUCK-AT ?auto_61988 ?auto_61989 ) ( SURFACE-AT ?auto_62002 ?auto_61989 ) ( CLEAR ?auto_62002 ) ( LIFTING ?auto_61993 ?auto_61990 ) ( IS-CRATE ?auto_61990 ) ( not ( = ?auto_61986 ?auto_62002 ) ) ( not ( = ?auto_61987 ?auto_62002 ) ) ( not ( = ?auto_61996 ?auto_62002 ) ) ( not ( = ?auto_61997 ?auto_62002 ) ) ( not ( = ?auto_61994 ?auto_62002 ) ) ( not ( = ?auto_61990 ?auto_62002 ) ) ( not ( = ?auto_61998 ?auto_62002 ) ) )
    :subtasks
    ( ( !DROP ?auto_61993 ?auto_61990 ?auto_62002 ?auto_61989 )
      ( MAKE-ON ?auto_61986 ?auto_61987 )
      ( MAKE-ON-VERIFY ?auto_61986 ?auto_61987 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62003 - SURFACE
      ?auto_62004 - SURFACE
    )
    :vars
    (
      ?auto_62008 - HOIST
      ?auto_62010 - PLACE
      ?auto_62011 - PLACE
      ?auto_62005 - HOIST
      ?auto_62017 - SURFACE
      ?auto_62015 - SURFACE
      ?auto_62009 - PLACE
      ?auto_62012 - HOIST
      ?auto_62006 - SURFACE
      ?auto_62013 - SURFACE
      ?auto_62018 - PLACE
      ?auto_62007 - HOIST
      ?auto_62019 - SURFACE
      ?auto_62014 - TRUCK
      ?auto_62016 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62008 ?auto_62010 ) ( IS-CRATE ?auto_62003 ) ( not ( = ?auto_62003 ?auto_62004 ) ) ( not ( = ?auto_62011 ?auto_62010 ) ) ( HOIST-AT ?auto_62005 ?auto_62011 ) ( not ( = ?auto_62008 ?auto_62005 ) ) ( AVAILABLE ?auto_62005 ) ( SURFACE-AT ?auto_62003 ?auto_62011 ) ( ON ?auto_62003 ?auto_62017 ) ( CLEAR ?auto_62003 ) ( not ( = ?auto_62003 ?auto_62017 ) ) ( not ( = ?auto_62004 ?auto_62017 ) ) ( IS-CRATE ?auto_62004 ) ( not ( = ?auto_62003 ?auto_62015 ) ) ( not ( = ?auto_62004 ?auto_62015 ) ) ( not ( = ?auto_62017 ?auto_62015 ) ) ( not ( = ?auto_62009 ?auto_62010 ) ) ( not ( = ?auto_62011 ?auto_62009 ) ) ( HOIST-AT ?auto_62012 ?auto_62009 ) ( not ( = ?auto_62008 ?auto_62012 ) ) ( not ( = ?auto_62005 ?auto_62012 ) ) ( AVAILABLE ?auto_62012 ) ( SURFACE-AT ?auto_62004 ?auto_62009 ) ( ON ?auto_62004 ?auto_62006 ) ( CLEAR ?auto_62004 ) ( not ( = ?auto_62003 ?auto_62006 ) ) ( not ( = ?auto_62004 ?auto_62006 ) ) ( not ( = ?auto_62017 ?auto_62006 ) ) ( not ( = ?auto_62015 ?auto_62006 ) ) ( IS-CRATE ?auto_62015 ) ( not ( = ?auto_62003 ?auto_62013 ) ) ( not ( = ?auto_62004 ?auto_62013 ) ) ( not ( = ?auto_62017 ?auto_62013 ) ) ( not ( = ?auto_62015 ?auto_62013 ) ) ( not ( = ?auto_62006 ?auto_62013 ) ) ( not ( = ?auto_62018 ?auto_62010 ) ) ( not ( = ?auto_62011 ?auto_62018 ) ) ( not ( = ?auto_62009 ?auto_62018 ) ) ( HOIST-AT ?auto_62007 ?auto_62018 ) ( not ( = ?auto_62008 ?auto_62007 ) ) ( not ( = ?auto_62005 ?auto_62007 ) ) ( not ( = ?auto_62012 ?auto_62007 ) ) ( AVAILABLE ?auto_62007 ) ( SURFACE-AT ?auto_62015 ?auto_62018 ) ( ON ?auto_62015 ?auto_62019 ) ( CLEAR ?auto_62015 ) ( not ( = ?auto_62003 ?auto_62019 ) ) ( not ( = ?auto_62004 ?auto_62019 ) ) ( not ( = ?auto_62017 ?auto_62019 ) ) ( not ( = ?auto_62015 ?auto_62019 ) ) ( not ( = ?auto_62006 ?auto_62019 ) ) ( not ( = ?auto_62013 ?auto_62019 ) ) ( TRUCK-AT ?auto_62014 ?auto_62010 ) ( SURFACE-AT ?auto_62016 ?auto_62010 ) ( CLEAR ?auto_62016 ) ( IS-CRATE ?auto_62013 ) ( not ( = ?auto_62003 ?auto_62016 ) ) ( not ( = ?auto_62004 ?auto_62016 ) ) ( not ( = ?auto_62017 ?auto_62016 ) ) ( not ( = ?auto_62015 ?auto_62016 ) ) ( not ( = ?auto_62006 ?auto_62016 ) ) ( not ( = ?auto_62013 ?auto_62016 ) ) ( not ( = ?auto_62019 ?auto_62016 ) ) ( AVAILABLE ?auto_62008 ) ( IN ?auto_62013 ?auto_62014 ) )
    :subtasks
    ( ( !UNLOAD ?auto_62008 ?auto_62013 ?auto_62014 ?auto_62010 )
      ( MAKE-ON ?auto_62003 ?auto_62004 )
      ( MAKE-ON-VERIFY ?auto_62003 ?auto_62004 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62020 - SURFACE
      ?auto_62021 - SURFACE
    )
    :vars
    (
      ?auto_62031 - HOIST
      ?auto_62033 - PLACE
      ?auto_62025 - PLACE
      ?auto_62032 - HOIST
      ?auto_62028 - SURFACE
      ?auto_62034 - SURFACE
      ?auto_62029 - PLACE
      ?auto_62035 - HOIST
      ?auto_62036 - SURFACE
      ?auto_62026 - SURFACE
      ?auto_62027 - PLACE
      ?auto_62030 - HOIST
      ?auto_62024 - SURFACE
      ?auto_62023 - SURFACE
      ?auto_62022 - TRUCK
      ?auto_62037 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62031 ?auto_62033 ) ( IS-CRATE ?auto_62020 ) ( not ( = ?auto_62020 ?auto_62021 ) ) ( not ( = ?auto_62025 ?auto_62033 ) ) ( HOIST-AT ?auto_62032 ?auto_62025 ) ( not ( = ?auto_62031 ?auto_62032 ) ) ( AVAILABLE ?auto_62032 ) ( SURFACE-AT ?auto_62020 ?auto_62025 ) ( ON ?auto_62020 ?auto_62028 ) ( CLEAR ?auto_62020 ) ( not ( = ?auto_62020 ?auto_62028 ) ) ( not ( = ?auto_62021 ?auto_62028 ) ) ( IS-CRATE ?auto_62021 ) ( not ( = ?auto_62020 ?auto_62034 ) ) ( not ( = ?auto_62021 ?auto_62034 ) ) ( not ( = ?auto_62028 ?auto_62034 ) ) ( not ( = ?auto_62029 ?auto_62033 ) ) ( not ( = ?auto_62025 ?auto_62029 ) ) ( HOIST-AT ?auto_62035 ?auto_62029 ) ( not ( = ?auto_62031 ?auto_62035 ) ) ( not ( = ?auto_62032 ?auto_62035 ) ) ( AVAILABLE ?auto_62035 ) ( SURFACE-AT ?auto_62021 ?auto_62029 ) ( ON ?auto_62021 ?auto_62036 ) ( CLEAR ?auto_62021 ) ( not ( = ?auto_62020 ?auto_62036 ) ) ( not ( = ?auto_62021 ?auto_62036 ) ) ( not ( = ?auto_62028 ?auto_62036 ) ) ( not ( = ?auto_62034 ?auto_62036 ) ) ( IS-CRATE ?auto_62034 ) ( not ( = ?auto_62020 ?auto_62026 ) ) ( not ( = ?auto_62021 ?auto_62026 ) ) ( not ( = ?auto_62028 ?auto_62026 ) ) ( not ( = ?auto_62034 ?auto_62026 ) ) ( not ( = ?auto_62036 ?auto_62026 ) ) ( not ( = ?auto_62027 ?auto_62033 ) ) ( not ( = ?auto_62025 ?auto_62027 ) ) ( not ( = ?auto_62029 ?auto_62027 ) ) ( HOIST-AT ?auto_62030 ?auto_62027 ) ( not ( = ?auto_62031 ?auto_62030 ) ) ( not ( = ?auto_62032 ?auto_62030 ) ) ( not ( = ?auto_62035 ?auto_62030 ) ) ( AVAILABLE ?auto_62030 ) ( SURFACE-AT ?auto_62034 ?auto_62027 ) ( ON ?auto_62034 ?auto_62024 ) ( CLEAR ?auto_62034 ) ( not ( = ?auto_62020 ?auto_62024 ) ) ( not ( = ?auto_62021 ?auto_62024 ) ) ( not ( = ?auto_62028 ?auto_62024 ) ) ( not ( = ?auto_62034 ?auto_62024 ) ) ( not ( = ?auto_62036 ?auto_62024 ) ) ( not ( = ?auto_62026 ?auto_62024 ) ) ( SURFACE-AT ?auto_62023 ?auto_62033 ) ( CLEAR ?auto_62023 ) ( IS-CRATE ?auto_62026 ) ( not ( = ?auto_62020 ?auto_62023 ) ) ( not ( = ?auto_62021 ?auto_62023 ) ) ( not ( = ?auto_62028 ?auto_62023 ) ) ( not ( = ?auto_62034 ?auto_62023 ) ) ( not ( = ?auto_62036 ?auto_62023 ) ) ( not ( = ?auto_62026 ?auto_62023 ) ) ( not ( = ?auto_62024 ?auto_62023 ) ) ( AVAILABLE ?auto_62031 ) ( IN ?auto_62026 ?auto_62022 ) ( TRUCK-AT ?auto_62022 ?auto_62037 ) ( not ( = ?auto_62037 ?auto_62033 ) ) ( not ( = ?auto_62025 ?auto_62037 ) ) ( not ( = ?auto_62029 ?auto_62037 ) ) ( not ( = ?auto_62027 ?auto_62037 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_62022 ?auto_62037 ?auto_62033 )
      ( MAKE-ON ?auto_62020 ?auto_62021 )
      ( MAKE-ON-VERIFY ?auto_62020 ?auto_62021 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62038 - SURFACE
      ?auto_62039 - SURFACE
    )
    :vars
    (
      ?auto_62049 - HOIST
      ?auto_62051 - PLACE
      ?auto_62047 - PLACE
      ?auto_62046 - HOIST
      ?auto_62048 - SURFACE
      ?auto_62052 - SURFACE
      ?auto_62040 - PLACE
      ?auto_62042 - HOIST
      ?auto_62043 - SURFACE
      ?auto_62050 - SURFACE
      ?auto_62041 - PLACE
      ?auto_62054 - HOIST
      ?auto_62045 - SURFACE
      ?auto_62044 - SURFACE
      ?auto_62055 - TRUCK
      ?auto_62053 - PLACE
      ?auto_62056 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_62049 ?auto_62051 ) ( IS-CRATE ?auto_62038 ) ( not ( = ?auto_62038 ?auto_62039 ) ) ( not ( = ?auto_62047 ?auto_62051 ) ) ( HOIST-AT ?auto_62046 ?auto_62047 ) ( not ( = ?auto_62049 ?auto_62046 ) ) ( AVAILABLE ?auto_62046 ) ( SURFACE-AT ?auto_62038 ?auto_62047 ) ( ON ?auto_62038 ?auto_62048 ) ( CLEAR ?auto_62038 ) ( not ( = ?auto_62038 ?auto_62048 ) ) ( not ( = ?auto_62039 ?auto_62048 ) ) ( IS-CRATE ?auto_62039 ) ( not ( = ?auto_62038 ?auto_62052 ) ) ( not ( = ?auto_62039 ?auto_62052 ) ) ( not ( = ?auto_62048 ?auto_62052 ) ) ( not ( = ?auto_62040 ?auto_62051 ) ) ( not ( = ?auto_62047 ?auto_62040 ) ) ( HOIST-AT ?auto_62042 ?auto_62040 ) ( not ( = ?auto_62049 ?auto_62042 ) ) ( not ( = ?auto_62046 ?auto_62042 ) ) ( AVAILABLE ?auto_62042 ) ( SURFACE-AT ?auto_62039 ?auto_62040 ) ( ON ?auto_62039 ?auto_62043 ) ( CLEAR ?auto_62039 ) ( not ( = ?auto_62038 ?auto_62043 ) ) ( not ( = ?auto_62039 ?auto_62043 ) ) ( not ( = ?auto_62048 ?auto_62043 ) ) ( not ( = ?auto_62052 ?auto_62043 ) ) ( IS-CRATE ?auto_62052 ) ( not ( = ?auto_62038 ?auto_62050 ) ) ( not ( = ?auto_62039 ?auto_62050 ) ) ( not ( = ?auto_62048 ?auto_62050 ) ) ( not ( = ?auto_62052 ?auto_62050 ) ) ( not ( = ?auto_62043 ?auto_62050 ) ) ( not ( = ?auto_62041 ?auto_62051 ) ) ( not ( = ?auto_62047 ?auto_62041 ) ) ( not ( = ?auto_62040 ?auto_62041 ) ) ( HOIST-AT ?auto_62054 ?auto_62041 ) ( not ( = ?auto_62049 ?auto_62054 ) ) ( not ( = ?auto_62046 ?auto_62054 ) ) ( not ( = ?auto_62042 ?auto_62054 ) ) ( AVAILABLE ?auto_62054 ) ( SURFACE-AT ?auto_62052 ?auto_62041 ) ( ON ?auto_62052 ?auto_62045 ) ( CLEAR ?auto_62052 ) ( not ( = ?auto_62038 ?auto_62045 ) ) ( not ( = ?auto_62039 ?auto_62045 ) ) ( not ( = ?auto_62048 ?auto_62045 ) ) ( not ( = ?auto_62052 ?auto_62045 ) ) ( not ( = ?auto_62043 ?auto_62045 ) ) ( not ( = ?auto_62050 ?auto_62045 ) ) ( SURFACE-AT ?auto_62044 ?auto_62051 ) ( CLEAR ?auto_62044 ) ( IS-CRATE ?auto_62050 ) ( not ( = ?auto_62038 ?auto_62044 ) ) ( not ( = ?auto_62039 ?auto_62044 ) ) ( not ( = ?auto_62048 ?auto_62044 ) ) ( not ( = ?auto_62052 ?auto_62044 ) ) ( not ( = ?auto_62043 ?auto_62044 ) ) ( not ( = ?auto_62050 ?auto_62044 ) ) ( not ( = ?auto_62045 ?auto_62044 ) ) ( AVAILABLE ?auto_62049 ) ( TRUCK-AT ?auto_62055 ?auto_62053 ) ( not ( = ?auto_62053 ?auto_62051 ) ) ( not ( = ?auto_62047 ?auto_62053 ) ) ( not ( = ?auto_62040 ?auto_62053 ) ) ( not ( = ?auto_62041 ?auto_62053 ) ) ( HOIST-AT ?auto_62056 ?auto_62053 ) ( LIFTING ?auto_62056 ?auto_62050 ) ( not ( = ?auto_62049 ?auto_62056 ) ) ( not ( = ?auto_62046 ?auto_62056 ) ) ( not ( = ?auto_62042 ?auto_62056 ) ) ( not ( = ?auto_62054 ?auto_62056 ) ) )
    :subtasks
    ( ( !LOAD ?auto_62056 ?auto_62050 ?auto_62055 ?auto_62053 )
      ( MAKE-ON ?auto_62038 ?auto_62039 )
      ( MAKE-ON-VERIFY ?auto_62038 ?auto_62039 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62057 - SURFACE
      ?auto_62058 - SURFACE
    )
    :vars
    (
      ?auto_62071 - HOIST
      ?auto_62070 - PLACE
      ?auto_62063 - PLACE
      ?auto_62069 - HOIST
      ?auto_62065 - SURFACE
      ?auto_62073 - SURFACE
      ?auto_62067 - PLACE
      ?auto_62062 - HOIST
      ?auto_62075 - SURFACE
      ?auto_62061 - SURFACE
      ?auto_62064 - PLACE
      ?auto_62068 - HOIST
      ?auto_62074 - SURFACE
      ?auto_62060 - SURFACE
      ?auto_62059 - TRUCK
      ?auto_62066 - PLACE
      ?auto_62072 - HOIST
      ?auto_62076 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62071 ?auto_62070 ) ( IS-CRATE ?auto_62057 ) ( not ( = ?auto_62057 ?auto_62058 ) ) ( not ( = ?auto_62063 ?auto_62070 ) ) ( HOIST-AT ?auto_62069 ?auto_62063 ) ( not ( = ?auto_62071 ?auto_62069 ) ) ( AVAILABLE ?auto_62069 ) ( SURFACE-AT ?auto_62057 ?auto_62063 ) ( ON ?auto_62057 ?auto_62065 ) ( CLEAR ?auto_62057 ) ( not ( = ?auto_62057 ?auto_62065 ) ) ( not ( = ?auto_62058 ?auto_62065 ) ) ( IS-CRATE ?auto_62058 ) ( not ( = ?auto_62057 ?auto_62073 ) ) ( not ( = ?auto_62058 ?auto_62073 ) ) ( not ( = ?auto_62065 ?auto_62073 ) ) ( not ( = ?auto_62067 ?auto_62070 ) ) ( not ( = ?auto_62063 ?auto_62067 ) ) ( HOIST-AT ?auto_62062 ?auto_62067 ) ( not ( = ?auto_62071 ?auto_62062 ) ) ( not ( = ?auto_62069 ?auto_62062 ) ) ( AVAILABLE ?auto_62062 ) ( SURFACE-AT ?auto_62058 ?auto_62067 ) ( ON ?auto_62058 ?auto_62075 ) ( CLEAR ?auto_62058 ) ( not ( = ?auto_62057 ?auto_62075 ) ) ( not ( = ?auto_62058 ?auto_62075 ) ) ( not ( = ?auto_62065 ?auto_62075 ) ) ( not ( = ?auto_62073 ?auto_62075 ) ) ( IS-CRATE ?auto_62073 ) ( not ( = ?auto_62057 ?auto_62061 ) ) ( not ( = ?auto_62058 ?auto_62061 ) ) ( not ( = ?auto_62065 ?auto_62061 ) ) ( not ( = ?auto_62073 ?auto_62061 ) ) ( not ( = ?auto_62075 ?auto_62061 ) ) ( not ( = ?auto_62064 ?auto_62070 ) ) ( not ( = ?auto_62063 ?auto_62064 ) ) ( not ( = ?auto_62067 ?auto_62064 ) ) ( HOIST-AT ?auto_62068 ?auto_62064 ) ( not ( = ?auto_62071 ?auto_62068 ) ) ( not ( = ?auto_62069 ?auto_62068 ) ) ( not ( = ?auto_62062 ?auto_62068 ) ) ( AVAILABLE ?auto_62068 ) ( SURFACE-AT ?auto_62073 ?auto_62064 ) ( ON ?auto_62073 ?auto_62074 ) ( CLEAR ?auto_62073 ) ( not ( = ?auto_62057 ?auto_62074 ) ) ( not ( = ?auto_62058 ?auto_62074 ) ) ( not ( = ?auto_62065 ?auto_62074 ) ) ( not ( = ?auto_62073 ?auto_62074 ) ) ( not ( = ?auto_62075 ?auto_62074 ) ) ( not ( = ?auto_62061 ?auto_62074 ) ) ( SURFACE-AT ?auto_62060 ?auto_62070 ) ( CLEAR ?auto_62060 ) ( IS-CRATE ?auto_62061 ) ( not ( = ?auto_62057 ?auto_62060 ) ) ( not ( = ?auto_62058 ?auto_62060 ) ) ( not ( = ?auto_62065 ?auto_62060 ) ) ( not ( = ?auto_62073 ?auto_62060 ) ) ( not ( = ?auto_62075 ?auto_62060 ) ) ( not ( = ?auto_62061 ?auto_62060 ) ) ( not ( = ?auto_62074 ?auto_62060 ) ) ( AVAILABLE ?auto_62071 ) ( TRUCK-AT ?auto_62059 ?auto_62066 ) ( not ( = ?auto_62066 ?auto_62070 ) ) ( not ( = ?auto_62063 ?auto_62066 ) ) ( not ( = ?auto_62067 ?auto_62066 ) ) ( not ( = ?auto_62064 ?auto_62066 ) ) ( HOIST-AT ?auto_62072 ?auto_62066 ) ( not ( = ?auto_62071 ?auto_62072 ) ) ( not ( = ?auto_62069 ?auto_62072 ) ) ( not ( = ?auto_62062 ?auto_62072 ) ) ( not ( = ?auto_62068 ?auto_62072 ) ) ( AVAILABLE ?auto_62072 ) ( SURFACE-AT ?auto_62061 ?auto_62066 ) ( ON ?auto_62061 ?auto_62076 ) ( CLEAR ?auto_62061 ) ( not ( = ?auto_62057 ?auto_62076 ) ) ( not ( = ?auto_62058 ?auto_62076 ) ) ( not ( = ?auto_62065 ?auto_62076 ) ) ( not ( = ?auto_62073 ?auto_62076 ) ) ( not ( = ?auto_62075 ?auto_62076 ) ) ( not ( = ?auto_62061 ?auto_62076 ) ) ( not ( = ?auto_62074 ?auto_62076 ) ) ( not ( = ?auto_62060 ?auto_62076 ) ) )
    :subtasks
    ( ( !LIFT ?auto_62072 ?auto_62061 ?auto_62076 ?auto_62066 )
      ( MAKE-ON ?auto_62057 ?auto_62058 )
      ( MAKE-ON-VERIFY ?auto_62057 ?auto_62058 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62077 - SURFACE
      ?auto_62078 - SURFACE
    )
    :vars
    (
      ?auto_62084 - HOIST
      ?auto_62082 - PLACE
      ?auto_62092 - PLACE
      ?auto_62083 - HOIST
      ?auto_62094 - SURFACE
      ?auto_62093 - SURFACE
      ?auto_62086 - PLACE
      ?auto_62091 - HOIST
      ?auto_62088 - SURFACE
      ?auto_62089 - SURFACE
      ?auto_62087 - PLACE
      ?auto_62096 - HOIST
      ?auto_62081 - SURFACE
      ?auto_62090 - SURFACE
      ?auto_62085 - PLACE
      ?auto_62079 - HOIST
      ?auto_62095 - SURFACE
      ?auto_62080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_62084 ?auto_62082 ) ( IS-CRATE ?auto_62077 ) ( not ( = ?auto_62077 ?auto_62078 ) ) ( not ( = ?auto_62092 ?auto_62082 ) ) ( HOIST-AT ?auto_62083 ?auto_62092 ) ( not ( = ?auto_62084 ?auto_62083 ) ) ( AVAILABLE ?auto_62083 ) ( SURFACE-AT ?auto_62077 ?auto_62092 ) ( ON ?auto_62077 ?auto_62094 ) ( CLEAR ?auto_62077 ) ( not ( = ?auto_62077 ?auto_62094 ) ) ( not ( = ?auto_62078 ?auto_62094 ) ) ( IS-CRATE ?auto_62078 ) ( not ( = ?auto_62077 ?auto_62093 ) ) ( not ( = ?auto_62078 ?auto_62093 ) ) ( not ( = ?auto_62094 ?auto_62093 ) ) ( not ( = ?auto_62086 ?auto_62082 ) ) ( not ( = ?auto_62092 ?auto_62086 ) ) ( HOIST-AT ?auto_62091 ?auto_62086 ) ( not ( = ?auto_62084 ?auto_62091 ) ) ( not ( = ?auto_62083 ?auto_62091 ) ) ( AVAILABLE ?auto_62091 ) ( SURFACE-AT ?auto_62078 ?auto_62086 ) ( ON ?auto_62078 ?auto_62088 ) ( CLEAR ?auto_62078 ) ( not ( = ?auto_62077 ?auto_62088 ) ) ( not ( = ?auto_62078 ?auto_62088 ) ) ( not ( = ?auto_62094 ?auto_62088 ) ) ( not ( = ?auto_62093 ?auto_62088 ) ) ( IS-CRATE ?auto_62093 ) ( not ( = ?auto_62077 ?auto_62089 ) ) ( not ( = ?auto_62078 ?auto_62089 ) ) ( not ( = ?auto_62094 ?auto_62089 ) ) ( not ( = ?auto_62093 ?auto_62089 ) ) ( not ( = ?auto_62088 ?auto_62089 ) ) ( not ( = ?auto_62087 ?auto_62082 ) ) ( not ( = ?auto_62092 ?auto_62087 ) ) ( not ( = ?auto_62086 ?auto_62087 ) ) ( HOIST-AT ?auto_62096 ?auto_62087 ) ( not ( = ?auto_62084 ?auto_62096 ) ) ( not ( = ?auto_62083 ?auto_62096 ) ) ( not ( = ?auto_62091 ?auto_62096 ) ) ( AVAILABLE ?auto_62096 ) ( SURFACE-AT ?auto_62093 ?auto_62087 ) ( ON ?auto_62093 ?auto_62081 ) ( CLEAR ?auto_62093 ) ( not ( = ?auto_62077 ?auto_62081 ) ) ( not ( = ?auto_62078 ?auto_62081 ) ) ( not ( = ?auto_62094 ?auto_62081 ) ) ( not ( = ?auto_62093 ?auto_62081 ) ) ( not ( = ?auto_62088 ?auto_62081 ) ) ( not ( = ?auto_62089 ?auto_62081 ) ) ( SURFACE-AT ?auto_62090 ?auto_62082 ) ( CLEAR ?auto_62090 ) ( IS-CRATE ?auto_62089 ) ( not ( = ?auto_62077 ?auto_62090 ) ) ( not ( = ?auto_62078 ?auto_62090 ) ) ( not ( = ?auto_62094 ?auto_62090 ) ) ( not ( = ?auto_62093 ?auto_62090 ) ) ( not ( = ?auto_62088 ?auto_62090 ) ) ( not ( = ?auto_62089 ?auto_62090 ) ) ( not ( = ?auto_62081 ?auto_62090 ) ) ( AVAILABLE ?auto_62084 ) ( not ( = ?auto_62085 ?auto_62082 ) ) ( not ( = ?auto_62092 ?auto_62085 ) ) ( not ( = ?auto_62086 ?auto_62085 ) ) ( not ( = ?auto_62087 ?auto_62085 ) ) ( HOIST-AT ?auto_62079 ?auto_62085 ) ( not ( = ?auto_62084 ?auto_62079 ) ) ( not ( = ?auto_62083 ?auto_62079 ) ) ( not ( = ?auto_62091 ?auto_62079 ) ) ( not ( = ?auto_62096 ?auto_62079 ) ) ( AVAILABLE ?auto_62079 ) ( SURFACE-AT ?auto_62089 ?auto_62085 ) ( ON ?auto_62089 ?auto_62095 ) ( CLEAR ?auto_62089 ) ( not ( = ?auto_62077 ?auto_62095 ) ) ( not ( = ?auto_62078 ?auto_62095 ) ) ( not ( = ?auto_62094 ?auto_62095 ) ) ( not ( = ?auto_62093 ?auto_62095 ) ) ( not ( = ?auto_62088 ?auto_62095 ) ) ( not ( = ?auto_62089 ?auto_62095 ) ) ( not ( = ?auto_62081 ?auto_62095 ) ) ( not ( = ?auto_62090 ?auto_62095 ) ) ( TRUCK-AT ?auto_62080 ?auto_62082 ) )
    :subtasks
    ( ( !DRIVE ?auto_62080 ?auto_62082 ?auto_62085 )
      ( MAKE-ON ?auto_62077 ?auto_62078 )
      ( MAKE-ON-VERIFY ?auto_62077 ?auto_62078 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62097 - SURFACE
      ?auto_62098 - SURFACE
    )
    :vars
    (
      ?auto_62114 - HOIST
      ?auto_62103 - PLACE
      ?auto_62105 - PLACE
      ?auto_62113 - HOIST
      ?auto_62101 - SURFACE
      ?auto_62108 - SURFACE
      ?auto_62111 - PLACE
      ?auto_62112 - HOIST
      ?auto_62109 - SURFACE
      ?auto_62102 - SURFACE
      ?auto_62104 - PLACE
      ?auto_62107 - HOIST
      ?auto_62099 - SURFACE
      ?auto_62110 - SURFACE
      ?auto_62100 - PLACE
      ?auto_62115 - HOIST
      ?auto_62106 - SURFACE
      ?auto_62116 - TRUCK
      ?auto_62117 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62114 ?auto_62103 ) ( IS-CRATE ?auto_62097 ) ( not ( = ?auto_62097 ?auto_62098 ) ) ( not ( = ?auto_62105 ?auto_62103 ) ) ( HOIST-AT ?auto_62113 ?auto_62105 ) ( not ( = ?auto_62114 ?auto_62113 ) ) ( AVAILABLE ?auto_62113 ) ( SURFACE-AT ?auto_62097 ?auto_62105 ) ( ON ?auto_62097 ?auto_62101 ) ( CLEAR ?auto_62097 ) ( not ( = ?auto_62097 ?auto_62101 ) ) ( not ( = ?auto_62098 ?auto_62101 ) ) ( IS-CRATE ?auto_62098 ) ( not ( = ?auto_62097 ?auto_62108 ) ) ( not ( = ?auto_62098 ?auto_62108 ) ) ( not ( = ?auto_62101 ?auto_62108 ) ) ( not ( = ?auto_62111 ?auto_62103 ) ) ( not ( = ?auto_62105 ?auto_62111 ) ) ( HOIST-AT ?auto_62112 ?auto_62111 ) ( not ( = ?auto_62114 ?auto_62112 ) ) ( not ( = ?auto_62113 ?auto_62112 ) ) ( AVAILABLE ?auto_62112 ) ( SURFACE-AT ?auto_62098 ?auto_62111 ) ( ON ?auto_62098 ?auto_62109 ) ( CLEAR ?auto_62098 ) ( not ( = ?auto_62097 ?auto_62109 ) ) ( not ( = ?auto_62098 ?auto_62109 ) ) ( not ( = ?auto_62101 ?auto_62109 ) ) ( not ( = ?auto_62108 ?auto_62109 ) ) ( IS-CRATE ?auto_62108 ) ( not ( = ?auto_62097 ?auto_62102 ) ) ( not ( = ?auto_62098 ?auto_62102 ) ) ( not ( = ?auto_62101 ?auto_62102 ) ) ( not ( = ?auto_62108 ?auto_62102 ) ) ( not ( = ?auto_62109 ?auto_62102 ) ) ( not ( = ?auto_62104 ?auto_62103 ) ) ( not ( = ?auto_62105 ?auto_62104 ) ) ( not ( = ?auto_62111 ?auto_62104 ) ) ( HOIST-AT ?auto_62107 ?auto_62104 ) ( not ( = ?auto_62114 ?auto_62107 ) ) ( not ( = ?auto_62113 ?auto_62107 ) ) ( not ( = ?auto_62112 ?auto_62107 ) ) ( AVAILABLE ?auto_62107 ) ( SURFACE-AT ?auto_62108 ?auto_62104 ) ( ON ?auto_62108 ?auto_62099 ) ( CLEAR ?auto_62108 ) ( not ( = ?auto_62097 ?auto_62099 ) ) ( not ( = ?auto_62098 ?auto_62099 ) ) ( not ( = ?auto_62101 ?auto_62099 ) ) ( not ( = ?auto_62108 ?auto_62099 ) ) ( not ( = ?auto_62109 ?auto_62099 ) ) ( not ( = ?auto_62102 ?auto_62099 ) ) ( IS-CRATE ?auto_62102 ) ( not ( = ?auto_62097 ?auto_62110 ) ) ( not ( = ?auto_62098 ?auto_62110 ) ) ( not ( = ?auto_62101 ?auto_62110 ) ) ( not ( = ?auto_62108 ?auto_62110 ) ) ( not ( = ?auto_62109 ?auto_62110 ) ) ( not ( = ?auto_62102 ?auto_62110 ) ) ( not ( = ?auto_62099 ?auto_62110 ) ) ( not ( = ?auto_62100 ?auto_62103 ) ) ( not ( = ?auto_62105 ?auto_62100 ) ) ( not ( = ?auto_62111 ?auto_62100 ) ) ( not ( = ?auto_62104 ?auto_62100 ) ) ( HOIST-AT ?auto_62115 ?auto_62100 ) ( not ( = ?auto_62114 ?auto_62115 ) ) ( not ( = ?auto_62113 ?auto_62115 ) ) ( not ( = ?auto_62112 ?auto_62115 ) ) ( not ( = ?auto_62107 ?auto_62115 ) ) ( AVAILABLE ?auto_62115 ) ( SURFACE-AT ?auto_62102 ?auto_62100 ) ( ON ?auto_62102 ?auto_62106 ) ( CLEAR ?auto_62102 ) ( not ( = ?auto_62097 ?auto_62106 ) ) ( not ( = ?auto_62098 ?auto_62106 ) ) ( not ( = ?auto_62101 ?auto_62106 ) ) ( not ( = ?auto_62108 ?auto_62106 ) ) ( not ( = ?auto_62109 ?auto_62106 ) ) ( not ( = ?auto_62102 ?auto_62106 ) ) ( not ( = ?auto_62099 ?auto_62106 ) ) ( not ( = ?auto_62110 ?auto_62106 ) ) ( TRUCK-AT ?auto_62116 ?auto_62103 ) ( SURFACE-AT ?auto_62117 ?auto_62103 ) ( CLEAR ?auto_62117 ) ( LIFTING ?auto_62114 ?auto_62110 ) ( IS-CRATE ?auto_62110 ) ( not ( = ?auto_62097 ?auto_62117 ) ) ( not ( = ?auto_62098 ?auto_62117 ) ) ( not ( = ?auto_62101 ?auto_62117 ) ) ( not ( = ?auto_62108 ?auto_62117 ) ) ( not ( = ?auto_62109 ?auto_62117 ) ) ( not ( = ?auto_62102 ?auto_62117 ) ) ( not ( = ?auto_62099 ?auto_62117 ) ) ( not ( = ?auto_62110 ?auto_62117 ) ) ( not ( = ?auto_62106 ?auto_62117 ) ) )
    :subtasks
    ( ( !DROP ?auto_62114 ?auto_62110 ?auto_62117 ?auto_62103 )
      ( MAKE-ON ?auto_62097 ?auto_62098 )
      ( MAKE-ON-VERIFY ?auto_62097 ?auto_62098 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62118 - SURFACE
      ?auto_62119 - SURFACE
    )
    :vars
    (
      ?auto_62132 - HOIST
      ?auto_62122 - PLACE
      ?auto_62133 - PLACE
      ?auto_62130 - HOIST
      ?auto_62120 - SURFACE
      ?auto_62131 - SURFACE
      ?auto_62129 - PLACE
      ?auto_62136 - HOIST
      ?auto_62135 - SURFACE
      ?auto_62121 - SURFACE
      ?auto_62123 - PLACE
      ?auto_62124 - HOIST
      ?auto_62126 - SURFACE
      ?auto_62138 - SURFACE
      ?auto_62134 - PLACE
      ?auto_62127 - HOIST
      ?auto_62137 - SURFACE
      ?auto_62128 - TRUCK
      ?auto_62125 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62132 ?auto_62122 ) ( IS-CRATE ?auto_62118 ) ( not ( = ?auto_62118 ?auto_62119 ) ) ( not ( = ?auto_62133 ?auto_62122 ) ) ( HOIST-AT ?auto_62130 ?auto_62133 ) ( not ( = ?auto_62132 ?auto_62130 ) ) ( AVAILABLE ?auto_62130 ) ( SURFACE-AT ?auto_62118 ?auto_62133 ) ( ON ?auto_62118 ?auto_62120 ) ( CLEAR ?auto_62118 ) ( not ( = ?auto_62118 ?auto_62120 ) ) ( not ( = ?auto_62119 ?auto_62120 ) ) ( IS-CRATE ?auto_62119 ) ( not ( = ?auto_62118 ?auto_62131 ) ) ( not ( = ?auto_62119 ?auto_62131 ) ) ( not ( = ?auto_62120 ?auto_62131 ) ) ( not ( = ?auto_62129 ?auto_62122 ) ) ( not ( = ?auto_62133 ?auto_62129 ) ) ( HOIST-AT ?auto_62136 ?auto_62129 ) ( not ( = ?auto_62132 ?auto_62136 ) ) ( not ( = ?auto_62130 ?auto_62136 ) ) ( AVAILABLE ?auto_62136 ) ( SURFACE-AT ?auto_62119 ?auto_62129 ) ( ON ?auto_62119 ?auto_62135 ) ( CLEAR ?auto_62119 ) ( not ( = ?auto_62118 ?auto_62135 ) ) ( not ( = ?auto_62119 ?auto_62135 ) ) ( not ( = ?auto_62120 ?auto_62135 ) ) ( not ( = ?auto_62131 ?auto_62135 ) ) ( IS-CRATE ?auto_62131 ) ( not ( = ?auto_62118 ?auto_62121 ) ) ( not ( = ?auto_62119 ?auto_62121 ) ) ( not ( = ?auto_62120 ?auto_62121 ) ) ( not ( = ?auto_62131 ?auto_62121 ) ) ( not ( = ?auto_62135 ?auto_62121 ) ) ( not ( = ?auto_62123 ?auto_62122 ) ) ( not ( = ?auto_62133 ?auto_62123 ) ) ( not ( = ?auto_62129 ?auto_62123 ) ) ( HOIST-AT ?auto_62124 ?auto_62123 ) ( not ( = ?auto_62132 ?auto_62124 ) ) ( not ( = ?auto_62130 ?auto_62124 ) ) ( not ( = ?auto_62136 ?auto_62124 ) ) ( AVAILABLE ?auto_62124 ) ( SURFACE-AT ?auto_62131 ?auto_62123 ) ( ON ?auto_62131 ?auto_62126 ) ( CLEAR ?auto_62131 ) ( not ( = ?auto_62118 ?auto_62126 ) ) ( not ( = ?auto_62119 ?auto_62126 ) ) ( not ( = ?auto_62120 ?auto_62126 ) ) ( not ( = ?auto_62131 ?auto_62126 ) ) ( not ( = ?auto_62135 ?auto_62126 ) ) ( not ( = ?auto_62121 ?auto_62126 ) ) ( IS-CRATE ?auto_62121 ) ( not ( = ?auto_62118 ?auto_62138 ) ) ( not ( = ?auto_62119 ?auto_62138 ) ) ( not ( = ?auto_62120 ?auto_62138 ) ) ( not ( = ?auto_62131 ?auto_62138 ) ) ( not ( = ?auto_62135 ?auto_62138 ) ) ( not ( = ?auto_62121 ?auto_62138 ) ) ( not ( = ?auto_62126 ?auto_62138 ) ) ( not ( = ?auto_62134 ?auto_62122 ) ) ( not ( = ?auto_62133 ?auto_62134 ) ) ( not ( = ?auto_62129 ?auto_62134 ) ) ( not ( = ?auto_62123 ?auto_62134 ) ) ( HOIST-AT ?auto_62127 ?auto_62134 ) ( not ( = ?auto_62132 ?auto_62127 ) ) ( not ( = ?auto_62130 ?auto_62127 ) ) ( not ( = ?auto_62136 ?auto_62127 ) ) ( not ( = ?auto_62124 ?auto_62127 ) ) ( AVAILABLE ?auto_62127 ) ( SURFACE-AT ?auto_62121 ?auto_62134 ) ( ON ?auto_62121 ?auto_62137 ) ( CLEAR ?auto_62121 ) ( not ( = ?auto_62118 ?auto_62137 ) ) ( not ( = ?auto_62119 ?auto_62137 ) ) ( not ( = ?auto_62120 ?auto_62137 ) ) ( not ( = ?auto_62131 ?auto_62137 ) ) ( not ( = ?auto_62135 ?auto_62137 ) ) ( not ( = ?auto_62121 ?auto_62137 ) ) ( not ( = ?auto_62126 ?auto_62137 ) ) ( not ( = ?auto_62138 ?auto_62137 ) ) ( TRUCK-AT ?auto_62128 ?auto_62122 ) ( SURFACE-AT ?auto_62125 ?auto_62122 ) ( CLEAR ?auto_62125 ) ( IS-CRATE ?auto_62138 ) ( not ( = ?auto_62118 ?auto_62125 ) ) ( not ( = ?auto_62119 ?auto_62125 ) ) ( not ( = ?auto_62120 ?auto_62125 ) ) ( not ( = ?auto_62131 ?auto_62125 ) ) ( not ( = ?auto_62135 ?auto_62125 ) ) ( not ( = ?auto_62121 ?auto_62125 ) ) ( not ( = ?auto_62126 ?auto_62125 ) ) ( not ( = ?auto_62138 ?auto_62125 ) ) ( not ( = ?auto_62137 ?auto_62125 ) ) ( AVAILABLE ?auto_62132 ) ( IN ?auto_62138 ?auto_62128 ) )
    :subtasks
    ( ( !UNLOAD ?auto_62132 ?auto_62138 ?auto_62128 ?auto_62122 )
      ( MAKE-ON ?auto_62118 ?auto_62119 )
      ( MAKE-ON-VERIFY ?auto_62118 ?auto_62119 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62139 - SURFACE
      ?auto_62140 - SURFACE
    )
    :vars
    (
      ?auto_62157 - HOIST
      ?auto_62142 - PLACE
      ?auto_62145 - PLACE
      ?auto_62150 - HOIST
      ?auto_62152 - SURFACE
      ?auto_62159 - SURFACE
      ?auto_62151 - PLACE
      ?auto_62154 - HOIST
      ?auto_62144 - SURFACE
      ?auto_62146 - SURFACE
      ?auto_62147 - PLACE
      ?auto_62143 - HOIST
      ?auto_62156 - SURFACE
      ?auto_62141 - SURFACE
      ?auto_62153 - PLACE
      ?auto_62149 - HOIST
      ?auto_62155 - SURFACE
      ?auto_62148 - SURFACE
      ?auto_62158 - TRUCK
      ?auto_62160 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62157 ?auto_62142 ) ( IS-CRATE ?auto_62139 ) ( not ( = ?auto_62139 ?auto_62140 ) ) ( not ( = ?auto_62145 ?auto_62142 ) ) ( HOIST-AT ?auto_62150 ?auto_62145 ) ( not ( = ?auto_62157 ?auto_62150 ) ) ( AVAILABLE ?auto_62150 ) ( SURFACE-AT ?auto_62139 ?auto_62145 ) ( ON ?auto_62139 ?auto_62152 ) ( CLEAR ?auto_62139 ) ( not ( = ?auto_62139 ?auto_62152 ) ) ( not ( = ?auto_62140 ?auto_62152 ) ) ( IS-CRATE ?auto_62140 ) ( not ( = ?auto_62139 ?auto_62159 ) ) ( not ( = ?auto_62140 ?auto_62159 ) ) ( not ( = ?auto_62152 ?auto_62159 ) ) ( not ( = ?auto_62151 ?auto_62142 ) ) ( not ( = ?auto_62145 ?auto_62151 ) ) ( HOIST-AT ?auto_62154 ?auto_62151 ) ( not ( = ?auto_62157 ?auto_62154 ) ) ( not ( = ?auto_62150 ?auto_62154 ) ) ( AVAILABLE ?auto_62154 ) ( SURFACE-AT ?auto_62140 ?auto_62151 ) ( ON ?auto_62140 ?auto_62144 ) ( CLEAR ?auto_62140 ) ( not ( = ?auto_62139 ?auto_62144 ) ) ( not ( = ?auto_62140 ?auto_62144 ) ) ( not ( = ?auto_62152 ?auto_62144 ) ) ( not ( = ?auto_62159 ?auto_62144 ) ) ( IS-CRATE ?auto_62159 ) ( not ( = ?auto_62139 ?auto_62146 ) ) ( not ( = ?auto_62140 ?auto_62146 ) ) ( not ( = ?auto_62152 ?auto_62146 ) ) ( not ( = ?auto_62159 ?auto_62146 ) ) ( not ( = ?auto_62144 ?auto_62146 ) ) ( not ( = ?auto_62147 ?auto_62142 ) ) ( not ( = ?auto_62145 ?auto_62147 ) ) ( not ( = ?auto_62151 ?auto_62147 ) ) ( HOIST-AT ?auto_62143 ?auto_62147 ) ( not ( = ?auto_62157 ?auto_62143 ) ) ( not ( = ?auto_62150 ?auto_62143 ) ) ( not ( = ?auto_62154 ?auto_62143 ) ) ( AVAILABLE ?auto_62143 ) ( SURFACE-AT ?auto_62159 ?auto_62147 ) ( ON ?auto_62159 ?auto_62156 ) ( CLEAR ?auto_62159 ) ( not ( = ?auto_62139 ?auto_62156 ) ) ( not ( = ?auto_62140 ?auto_62156 ) ) ( not ( = ?auto_62152 ?auto_62156 ) ) ( not ( = ?auto_62159 ?auto_62156 ) ) ( not ( = ?auto_62144 ?auto_62156 ) ) ( not ( = ?auto_62146 ?auto_62156 ) ) ( IS-CRATE ?auto_62146 ) ( not ( = ?auto_62139 ?auto_62141 ) ) ( not ( = ?auto_62140 ?auto_62141 ) ) ( not ( = ?auto_62152 ?auto_62141 ) ) ( not ( = ?auto_62159 ?auto_62141 ) ) ( not ( = ?auto_62144 ?auto_62141 ) ) ( not ( = ?auto_62146 ?auto_62141 ) ) ( not ( = ?auto_62156 ?auto_62141 ) ) ( not ( = ?auto_62153 ?auto_62142 ) ) ( not ( = ?auto_62145 ?auto_62153 ) ) ( not ( = ?auto_62151 ?auto_62153 ) ) ( not ( = ?auto_62147 ?auto_62153 ) ) ( HOIST-AT ?auto_62149 ?auto_62153 ) ( not ( = ?auto_62157 ?auto_62149 ) ) ( not ( = ?auto_62150 ?auto_62149 ) ) ( not ( = ?auto_62154 ?auto_62149 ) ) ( not ( = ?auto_62143 ?auto_62149 ) ) ( AVAILABLE ?auto_62149 ) ( SURFACE-AT ?auto_62146 ?auto_62153 ) ( ON ?auto_62146 ?auto_62155 ) ( CLEAR ?auto_62146 ) ( not ( = ?auto_62139 ?auto_62155 ) ) ( not ( = ?auto_62140 ?auto_62155 ) ) ( not ( = ?auto_62152 ?auto_62155 ) ) ( not ( = ?auto_62159 ?auto_62155 ) ) ( not ( = ?auto_62144 ?auto_62155 ) ) ( not ( = ?auto_62146 ?auto_62155 ) ) ( not ( = ?auto_62156 ?auto_62155 ) ) ( not ( = ?auto_62141 ?auto_62155 ) ) ( SURFACE-AT ?auto_62148 ?auto_62142 ) ( CLEAR ?auto_62148 ) ( IS-CRATE ?auto_62141 ) ( not ( = ?auto_62139 ?auto_62148 ) ) ( not ( = ?auto_62140 ?auto_62148 ) ) ( not ( = ?auto_62152 ?auto_62148 ) ) ( not ( = ?auto_62159 ?auto_62148 ) ) ( not ( = ?auto_62144 ?auto_62148 ) ) ( not ( = ?auto_62146 ?auto_62148 ) ) ( not ( = ?auto_62156 ?auto_62148 ) ) ( not ( = ?auto_62141 ?auto_62148 ) ) ( not ( = ?auto_62155 ?auto_62148 ) ) ( AVAILABLE ?auto_62157 ) ( IN ?auto_62141 ?auto_62158 ) ( TRUCK-AT ?auto_62158 ?auto_62160 ) ( not ( = ?auto_62160 ?auto_62142 ) ) ( not ( = ?auto_62145 ?auto_62160 ) ) ( not ( = ?auto_62151 ?auto_62160 ) ) ( not ( = ?auto_62147 ?auto_62160 ) ) ( not ( = ?auto_62153 ?auto_62160 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_62158 ?auto_62160 ?auto_62142 )
      ( MAKE-ON ?auto_62139 ?auto_62140 )
      ( MAKE-ON-VERIFY ?auto_62139 ?auto_62140 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62161 - SURFACE
      ?auto_62162 - SURFACE
    )
    :vars
    (
      ?auto_62168 - HOIST
      ?auto_62177 - PLACE
      ?auto_62163 - PLACE
      ?auto_62171 - HOIST
      ?auto_62178 - SURFACE
      ?auto_62170 - SURFACE
      ?auto_62176 - PLACE
      ?auto_62174 - HOIST
      ?auto_62164 - SURFACE
      ?auto_62175 - SURFACE
      ?auto_62182 - PLACE
      ?auto_62172 - HOIST
      ?auto_62166 - SURFACE
      ?auto_62165 - SURFACE
      ?auto_62179 - PLACE
      ?auto_62173 - HOIST
      ?auto_62181 - SURFACE
      ?auto_62167 - SURFACE
      ?auto_62169 - TRUCK
      ?auto_62180 - PLACE
      ?auto_62183 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_62168 ?auto_62177 ) ( IS-CRATE ?auto_62161 ) ( not ( = ?auto_62161 ?auto_62162 ) ) ( not ( = ?auto_62163 ?auto_62177 ) ) ( HOIST-AT ?auto_62171 ?auto_62163 ) ( not ( = ?auto_62168 ?auto_62171 ) ) ( AVAILABLE ?auto_62171 ) ( SURFACE-AT ?auto_62161 ?auto_62163 ) ( ON ?auto_62161 ?auto_62178 ) ( CLEAR ?auto_62161 ) ( not ( = ?auto_62161 ?auto_62178 ) ) ( not ( = ?auto_62162 ?auto_62178 ) ) ( IS-CRATE ?auto_62162 ) ( not ( = ?auto_62161 ?auto_62170 ) ) ( not ( = ?auto_62162 ?auto_62170 ) ) ( not ( = ?auto_62178 ?auto_62170 ) ) ( not ( = ?auto_62176 ?auto_62177 ) ) ( not ( = ?auto_62163 ?auto_62176 ) ) ( HOIST-AT ?auto_62174 ?auto_62176 ) ( not ( = ?auto_62168 ?auto_62174 ) ) ( not ( = ?auto_62171 ?auto_62174 ) ) ( AVAILABLE ?auto_62174 ) ( SURFACE-AT ?auto_62162 ?auto_62176 ) ( ON ?auto_62162 ?auto_62164 ) ( CLEAR ?auto_62162 ) ( not ( = ?auto_62161 ?auto_62164 ) ) ( not ( = ?auto_62162 ?auto_62164 ) ) ( not ( = ?auto_62178 ?auto_62164 ) ) ( not ( = ?auto_62170 ?auto_62164 ) ) ( IS-CRATE ?auto_62170 ) ( not ( = ?auto_62161 ?auto_62175 ) ) ( not ( = ?auto_62162 ?auto_62175 ) ) ( not ( = ?auto_62178 ?auto_62175 ) ) ( not ( = ?auto_62170 ?auto_62175 ) ) ( not ( = ?auto_62164 ?auto_62175 ) ) ( not ( = ?auto_62182 ?auto_62177 ) ) ( not ( = ?auto_62163 ?auto_62182 ) ) ( not ( = ?auto_62176 ?auto_62182 ) ) ( HOIST-AT ?auto_62172 ?auto_62182 ) ( not ( = ?auto_62168 ?auto_62172 ) ) ( not ( = ?auto_62171 ?auto_62172 ) ) ( not ( = ?auto_62174 ?auto_62172 ) ) ( AVAILABLE ?auto_62172 ) ( SURFACE-AT ?auto_62170 ?auto_62182 ) ( ON ?auto_62170 ?auto_62166 ) ( CLEAR ?auto_62170 ) ( not ( = ?auto_62161 ?auto_62166 ) ) ( not ( = ?auto_62162 ?auto_62166 ) ) ( not ( = ?auto_62178 ?auto_62166 ) ) ( not ( = ?auto_62170 ?auto_62166 ) ) ( not ( = ?auto_62164 ?auto_62166 ) ) ( not ( = ?auto_62175 ?auto_62166 ) ) ( IS-CRATE ?auto_62175 ) ( not ( = ?auto_62161 ?auto_62165 ) ) ( not ( = ?auto_62162 ?auto_62165 ) ) ( not ( = ?auto_62178 ?auto_62165 ) ) ( not ( = ?auto_62170 ?auto_62165 ) ) ( not ( = ?auto_62164 ?auto_62165 ) ) ( not ( = ?auto_62175 ?auto_62165 ) ) ( not ( = ?auto_62166 ?auto_62165 ) ) ( not ( = ?auto_62179 ?auto_62177 ) ) ( not ( = ?auto_62163 ?auto_62179 ) ) ( not ( = ?auto_62176 ?auto_62179 ) ) ( not ( = ?auto_62182 ?auto_62179 ) ) ( HOIST-AT ?auto_62173 ?auto_62179 ) ( not ( = ?auto_62168 ?auto_62173 ) ) ( not ( = ?auto_62171 ?auto_62173 ) ) ( not ( = ?auto_62174 ?auto_62173 ) ) ( not ( = ?auto_62172 ?auto_62173 ) ) ( AVAILABLE ?auto_62173 ) ( SURFACE-AT ?auto_62175 ?auto_62179 ) ( ON ?auto_62175 ?auto_62181 ) ( CLEAR ?auto_62175 ) ( not ( = ?auto_62161 ?auto_62181 ) ) ( not ( = ?auto_62162 ?auto_62181 ) ) ( not ( = ?auto_62178 ?auto_62181 ) ) ( not ( = ?auto_62170 ?auto_62181 ) ) ( not ( = ?auto_62164 ?auto_62181 ) ) ( not ( = ?auto_62175 ?auto_62181 ) ) ( not ( = ?auto_62166 ?auto_62181 ) ) ( not ( = ?auto_62165 ?auto_62181 ) ) ( SURFACE-AT ?auto_62167 ?auto_62177 ) ( CLEAR ?auto_62167 ) ( IS-CRATE ?auto_62165 ) ( not ( = ?auto_62161 ?auto_62167 ) ) ( not ( = ?auto_62162 ?auto_62167 ) ) ( not ( = ?auto_62178 ?auto_62167 ) ) ( not ( = ?auto_62170 ?auto_62167 ) ) ( not ( = ?auto_62164 ?auto_62167 ) ) ( not ( = ?auto_62175 ?auto_62167 ) ) ( not ( = ?auto_62166 ?auto_62167 ) ) ( not ( = ?auto_62165 ?auto_62167 ) ) ( not ( = ?auto_62181 ?auto_62167 ) ) ( AVAILABLE ?auto_62168 ) ( TRUCK-AT ?auto_62169 ?auto_62180 ) ( not ( = ?auto_62180 ?auto_62177 ) ) ( not ( = ?auto_62163 ?auto_62180 ) ) ( not ( = ?auto_62176 ?auto_62180 ) ) ( not ( = ?auto_62182 ?auto_62180 ) ) ( not ( = ?auto_62179 ?auto_62180 ) ) ( HOIST-AT ?auto_62183 ?auto_62180 ) ( LIFTING ?auto_62183 ?auto_62165 ) ( not ( = ?auto_62168 ?auto_62183 ) ) ( not ( = ?auto_62171 ?auto_62183 ) ) ( not ( = ?auto_62174 ?auto_62183 ) ) ( not ( = ?auto_62172 ?auto_62183 ) ) ( not ( = ?auto_62173 ?auto_62183 ) ) )
    :subtasks
    ( ( !LOAD ?auto_62183 ?auto_62165 ?auto_62169 ?auto_62180 )
      ( MAKE-ON ?auto_62161 ?auto_62162 )
      ( MAKE-ON-VERIFY ?auto_62161 ?auto_62162 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62184 - SURFACE
      ?auto_62185 - SURFACE
    )
    :vars
    (
      ?auto_62195 - HOIST
      ?auto_62201 - PLACE
      ?auto_62192 - PLACE
      ?auto_62189 - HOIST
      ?auto_62200 - SURFACE
      ?auto_62202 - SURFACE
      ?auto_62203 - PLACE
      ?auto_62196 - HOIST
      ?auto_62194 - SURFACE
      ?auto_62205 - SURFACE
      ?auto_62198 - PLACE
      ?auto_62204 - HOIST
      ?auto_62186 - SURFACE
      ?auto_62206 - SURFACE
      ?auto_62187 - PLACE
      ?auto_62190 - HOIST
      ?auto_62193 - SURFACE
      ?auto_62191 - SURFACE
      ?auto_62188 - TRUCK
      ?auto_62199 - PLACE
      ?auto_62197 - HOIST
      ?auto_62207 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62195 ?auto_62201 ) ( IS-CRATE ?auto_62184 ) ( not ( = ?auto_62184 ?auto_62185 ) ) ( not ( = ?auto_62192 ?auto_62201 ) ) ( HOIST-AT ?auto_62189 ?auto_62192 ) ( not ( = ?auto_62195 ?auto_62189 ) ) ( AVAILABLE ?auto_62189 ) ( SURFACE-AT ?auto_62184 ?auto_62192 ) ( ON ?auto_62184 ?auto_62200 ) ( CLEAR ?auto_62184 ) ( not ( = ?auto_62184 ?auto_62200 ) ) ( not ( = ?auto_62185 ?auto_62200 ) ) ( IS-CRATE ?auto_62185 ) ( not ( = ?auto_62184 ?auto_62202 ) ) ( not ( = ?auto_62185 ?auto_62202 ) ) ( not ( = ?auto_62200 ?auto_62202 ) ) ( not ( = ?auto_62203 ?auto_62201 ) ) ( not ( = ?auto_62192 ?auto_62203 ) ) ( HOIST-AT ?auto_62196 ?auto_62203 ) ( not ( = ?auto_62195 ?auto_62196 ) ) ( not ( = ?auto_62189 ?auto_62196 ) ) ( AVAILABLE ?auto_62196 ) ( SURFACE-AT ?auto_62185 ?auto_62203 ) ( ON ?auto_62185 ?auto_62194 ) ( CLEAR ?auto_62185 ) ( not ( = ?auto_62184 ?auto_62194 ) ) ( not ( = ?auto_62185 ?auto_62194 ) ) ( not ( = ?auto_62200 ?auto_62194 ) ) ( not ( = ?auto_62202 ?auto_62194 ) ) ( IS-CRATE ?auto_62202 ) ( not ( = ?auto_62184 ?auto_62205 ) ) ( not ( = ?auto_62185 ?auto_62205 ) ) ( not ( = ?auto_62200 ?auto_62205 ) ) ( not ( = ?auto_62202 ?auto_62205 ) ) ( not ( = ?auto_62194 ?auto_62205 ) ) ( not ( = ?auto_62198 ?auto_62201 ) ) ( not ( = ?auto_62192 ?auto_62198 ) ) ( not ( = ?auto_62203 ?auto_62198 ) ) ( HOIST-AT ?auto_62204 ?auto_62198 ) ( not ( = ?auto_62195 ?auto_62204 ) ) ( not ( = ?auto_62189 ?auto_62204 ) ) ( not ( = ?auto_62196 ?auto_62204 ) ) ( AVAILABLE ?auto_62204 ) ( SURFACE-AT ?auto_62202 ?auto_62198 ) ( ON ?auto_62202 ?auto_62186 ) ( CLEAR ?auto_62202 ) ( not ( = ?auto_62184 ?auto_62186 ) ) ( not ( = ?auto_62185 ?auto_62186 ) ) ( not ( = ?auto_62200 ?auto_62186 ) ) ( not ( = ?auto_62202 ?auto_62186 ) ) ( not ( = ?auto_62194 ?auto_62186 ) ) ( not ( = ?auto_62205 ?auto_62186 ) ) ( IS-CRATE ?auto_62205 ) ( not ( = ?auto_62184 ?auto_62206 ) ) ( not ( = ?auto_62185 ?auto_62206 ) ) ( not ( = ?auto_62200 ?auto_62206 ) ) ( not ( = ?auto_62202 ?auto_62206 ) ) ( not ( = ?auto_62194 ?auto_62206 ) ) ( not ( = ?auto_62205 ?auto_62206 ) ) ( not ( = ?auto_62186 ?auto_62206 ) ) ( not ( = ?auto_62187 ?auto_62201 ) ) ( not ( = ?auto_62192 ?auto_62187 ) ) ( not ( = ?auto_62203 ?auto_62187 ) ) ( not ( = ?auto_62198 ?auto_62187 ) ) ( HOIST-AT ?auto_62190 ?auto_62187 ) ( not ( = ?auto_62195 ?auto_62190 ) ) ( not ( = ?auto_62189 ?auto_62190 ) ) ( not ( = ?auto_62196 ?auto_62190 ) ) ( not ( = ?auto_62204 ?auto_62190 ) ) ( AVAILABLE ?auto_62190 ) ( SURFACE-AT ?auto_62205 ?auto_62187 ) ( ON ?auto_62205 ?auto_62193 ) ( CLEAR ?auto_62205 ) ( not ( = ?auto_62184 ?auto_62193 ) ) ( not ( = ?auto_62185 ?auto_62193 ) ) ( not ( = ?auto_62200 ?auto_62193 ) ) ( not ( = ?auto_62202 ?auto_62193 ) ) ( not ( = ?auto_62194 ?auto_62193 ) ) ( not ( = ?auto_62205 ?auto_62193 ) ) ( not ( = ?auto_62186 ?auto_62193 ) ) ( not ( = ?auto_62206 ?auto_62193 ) ) ( SURFACE-AT ?auto_62191 ?auto_62201 ) ( CLEAR ?auto_62191 ) ( IS-CRATE ?auto_62206 ) ( not ( = ?auto_62184 ?auto_62191 ) ) ( not ( = ?auto_62185 ?auto_62191 ) ) ( not ( = ?auto_62200 ?auto_62191 ) ) ( not ( = ?auto_62202 ?auto_62191 ) ) ( not ( = ?auto_62194 ?auto_62191 ) ) ( not ( = ?auto_62205 ?auto_62191 ) ) ( not ( = ?auto_62186 ?auto_62191 ) ) ( not ( = ?auto_62206 ?auto_62191 ) ) ( not ( = ?auto_62193 ?auto_62191 ) ) ( AVAILABLE ?auto_62195 ) ( TRUCK-AT ?auto_62188 ?auto_62199 ) ( not ( = ?auto_62199 ?auto_62201 ) ) ( not ( = ?auto_62192 ?auto_62199 ) ) ( not ( = ?auto_62203 ?auto_62199 ) ) ( not ( = ?auto_62198 ?auto_62199 ) ) ( not ( = ?auto_62187 ?auto_62199 ) ) ( HOIST-AT ?auto_62197 ?auto_62199 ) ( not ( = ?auto_62195 ?auto_62197 ) ) ( not ( = ?auto_62189 ?auto_62197 ) ) ( not ( = ?auto_62196 ?auto_62197 ) ) ( not ( = ?auto_62204 ?auto_62197 ) ) ( not ( = ?auto_62190 ?auto_62197 ) ) ( AVAILABLE ?auto_62197 ) ( SURFACE-AT ?auto_62206 ?auto_62199 ) ( ON ?auto_62206 ?auto_62207 ) ( CLEAR ?auto_62206 ) ( not ( = ?auto_62184 ?auto_62207 ) ) ( not ( = ?auto_62185 ?auto_62207 ) ) ( not ( = ?auto_62200 ?auto_62207 ) ) ( not ( = ?auto_62202 ?auto_62207 ) ) ( not ( = ?auto_62194 ?auto_62207 ) ) ( not ( = ?auto_62205 ?auto_62207 ) ) ( not ( = ?auto_62186 ?auto_62207 ) ) ( not ( = ?auto_62206 ?auto_62207 ) ) ( not ( = ?auto_62193 ?auto_62207 ) ) ( not ( = ?auto_62191 ?auto_62207 ) ) )
    :subtasks
    ( ( !LIFT ?auto_62197 ?auto_62206 ?auto_62207 ?auto_62199 )
      ( MAKE-ON ?auto_62184 ?auto_62185 )
      ( MAKE-ON-VERIFY ?auto_62184 ?auto_62185 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62208 - SURFACE
      ?auto_62209 - SURFACE
    )
    :vars
    (
      ?auto_62211 - HOIST
      ?auto_62221 - PLACE
      ?auto_62215 - PLACE
      ?auto_62212 - HOIST
      ?auto_62219 - SURFACE
      ?auto_62216 - SURFACE
      ?auto_62217 - PLACE
      ?auto_62214 - HOIST
      ?auto_62225 - SURFACE
      ?auto_62223 - SURFACE
      ?auto_62218 - PLACE
      ?auto_62222 - HOIST
      ?auto_62226 - SURFACE
      ?auto_62224 - SURFACE
      ?auto_62229 - PLACE
      ?auto_62231 - HOIST
      ?auto_62228 - SURFACE
      ?auto_62213 - SURFACE
      ?auto_62220 - PLACE
      ?auto_62230 - HOIST
      ?auto_62227 - SURFACE
      ?auto_62210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_62211 ?auto_62221 ) ( IS-CRATE ?auto_62208 ) ( not ( = ?auto_62208 ?auto_62209 ) ) ( not ( = ?auto_62215 ?auto_62221 ) ) ( HOIST-AT ?auto_62212 ?auto_62215 ) ( not ( = ?auto_62211 ?auto_62212 ) ) ( AVAILABLE ?auto_62212 ) ( SURFACE-AT ?auto_62208 ?auto_62215 ) ( ON ?auto_62208 ?auto_62219 ) ( CLEAR ?auto_62208 ) ( not ( = ?auto_62208 ?auto_62219 ) ) ( not ( = ?auto_62209 ?auto_62219 ) ) ( IS-CRATE ?auto_62209 ) ( not ( = ?auto_62208 ?auto_62216 ) ) ( not ( = ?auto_62209 ?auto_62216 ) ) ( not ( = ?auto_62219 ?auto_62216 ) ) ( not ( = ?auto_62217 ?auto_62221 ) ) ( not ( = ?auto_62215 ?auto_62217 ) ) ( HOIST-AT ?auto_62214 ?auto_62217 ) ( not ( = ?auto_62211 ?auto_62214 ) ) ( not ( = ?auto_62212 ?auto_62214 ) ) ( AVAILABLE ?auto_62214 ) ( SURFACE-AT ?auto_62209 ?auto_62217 ) ( ON ?auto_62209 ?auto_62225 ) ( CLEAR ?auto_62209 ) ( not ( = ?auto_62208 ?auto_62225 ) ) ( not ( = ?auto_62209 ?auto_62225 ) ) ( not ( = ?auto_62219 ?auto_62225 ) ) ( not ( = ?auto_62216 ?auto_62225 ) ) ( IS-CRATE ?auto_62216 ) ( not ( = ?auto_62208 ?auto_62223 ) ) ( not ( = ?auto_62209 ?auto_62223 ) ) ( not ( = ?auto_62219 ?auto_62223 ) ) ( not ( = ?auto_62216 ?auto_62223 ) ) ( not ( = ?auto_62225 ?auto_62223 ) ) ( not ( = ?auto_62218 ?auto_62221 ) ) ( not ( = ?auto_62215 ?auto_62218 ) ) ( not ( = ?auto_62217 ?auto_62218 ) ) ( HOIST-AT ?auto_62222 ?auto_62218 ) ( not ( = ?auto_62211 ?auto_62222 ) ) ( not ( = ?auto_62212 ?auto_62222 ) ) ( not ( = ?auto_62214 ?auto_62222 ) ) ( AVAILABLE ?auto_62222 ) ( SURFACE-AT ?auto_62216 ?auto_62218 ) ( ON ?auto_62216 ?auto_62226 ) ( CLEAR ?auto_62216 ) ( not ( = ?auto_62208 ?auto_62226 ) ) ( not ( = ?auto_62209 ?auto_62226 ) ) ( not ( = ?auto_62219 ?auto_62226 ) ) ( not ( = ?auto_62216 ?auto_62226 ) ) ( not ( = ?auto_62225 ?auto_62226 ) ) ( not ( = ?auto_62223 ?auto_62226 ) ) ( IS-CRATE ?auto_62223 ) ( not ( = ?auto_62208 ?auto_62224 ) ) ( not ( = ?auto_62209 ?auto_62224 ) ) ( not ( = ?auto_62219 ?auto_62224 ) ) ( not ( = ?auto_62216 ?auto_62224 ) ) ( not ( = ?auto_62225 ?auto_62224 ) ) ( not ( = ?auto_62223 ?auto_62224 ) ) ( not ( = ?auto_62226 ?auto_62224 ) ) ( not ( = ?auto_62229 ?auto_62221 ) ) ( not ( = ?auto_62215 ?auto_62229 ) ) ( not ( = ?auto_62217 ?auto_62229 ) ) ( not ( = ?auto_62218 ?auto_62229 ) ) ( HOIST-AT ?auto_62231 ?auto_62229 ) ( not ( = ?auto_62211 ?auto_62231 ) ) ( not ( = ?auto_62212 ?auto_62231 ) ) ( not ( = ?auto_62214 ?auto_62231 ) ) ( not ( = ?auto_62222 ?auto_62231 ) ) ( AVAILABLE ?auto_62231 ) ( SURFACE-AT ?auto_62223 ?auto_62229 ) ( ON ?auto_62223 ?auto_62228 ) ( CLEAR ?auto_62223 ) ( not ( = ?auto_62208 ?auto_62228 ) ) ( not ( = ?auto_62209 ?auto_62228 ) ) ( not ( = ?auto_62219 ?auto_62228 ) ) ( not ( = ?auto_62216 ?auto_62228 ) ) ( not ( = ?auto_62225 ?auto_62228 ) ) ( not ( = ?auto_62223 ?auto_62228 ) ) ( not ( = ?auto_62226 ?auto_62228 ) ) ( not ( = ?auto_62224 ?auto_62228 ) ) ( SURFACE-AT ?auto_62213 ?auto_62221 ) ( CLEAR ?auto_62213 ) ( IS-CRATE ?auto_62224 ) ( not ( = ?auto_62208 ?auto_62213 ) ) ( not ( = ?auto_62209 ?auto_62213 ) ) ( not ( = ?auto_62219 ?auto_62213 ) ) ( not ( = ?auto_62216 ?auto_62213 ) ) ( not ( = ?auto_62225 ?auto_62213 ) ) ( not ( = ?auto_62223 ?auto_62213 ) ) ( not ( = ?auto_62226 ?auto_62213 ) ) ( not ( = ?auto_62224 ?auto_62213 ) ) ( not ( = ?auto_62228 ?auto_62213 ) ) ( AVAILABLE ?auto_62211 ) ( not ( = ?auto_62220 ?auto_62221 ) ) ( not ( = ?auto_62215 ?auto_62220 ) ) ( not ( = ?auto_62217 ?auto_62220 ) ) ( not ( = ?auto_62218 ?auto_62220 ) ) ( not ( = ?auto_62229 ?auto_62220 ) ) ( HOIST-AT ?auto_62230 ?auto_62220 ) ( not ( = ?auto_62211 ?auto_62230 ) ) ( not ( = ?auto_62212 ?auto_62230 ) ) ( not ( = ?auto_62214 ?auto_62230 ) ) ( not ( = ?auto_62222 ?auto_62230 ) ) ( not ( = ?auto_62231 ?auto_62230 ) ) ( AVAILABLE ?auto_62230 ) ( SURFACE-AT ?auto_62224 ?auto_62220 ) ( ON ?auto_62224 ?auto_62227 ) ( CLEAR ?auto_62224 ) ( not ( = ?auto_62208 ?auto_62227 ) ) ( not ( = ?auto_62209 ?auto_62227 ) ) ( not ( = ?auto_62219 ?auto_62227 ) ) ( not ( = ?auto_62216 ?auto_62227 ) ) ( not ( = ?auto_62225 ?auto_62227 ) ) ( not ( = ?auto_62223 ?auto_62227 ) ) ( not ( = ?auto_62226 ?auto_62227 ) ) ( not ( = ?auto_62224 ?auto_62227 ) ) ( not ( = ?auto_62228 ?auto_62227 ) ) ( not ( = ?auto_62213 ?auto_62227 ) ) ( TRUCK-AT ?auto_62210 ?auto_62221 ) )
    :subtasks
    ( ( !DRIVE ?auto_62210 ?auto_62221 ?auto_62220 )
      ( MAKE-ON ?auto_62208 ?auto_62209 )
      ( MAKE-ON-VERIFY ?auto_62208 ?auto_62209 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62232 - SURFACE
      ?auto_62233 - SURFACE
    )
    :vars
    (
      ?auto_62254 - HOIST
      ?auto_62252 - PLACE
      ?auto_62246 - PLACE
      ?auto_62240 - HOIST
      ?auto_62241 - SURFACE
      ?auto_62251 - SURFACE
      ?auto_62255 - PLACE
      ?auto_62253 - HOIST
      ?auto_62238 - SURFACE
      ?auto_62249 - SURFACE
      ?auto_62235 - PLACE
      ?auto_62247 - HOIST
      ?auto_62242 - SURFACE
      ?auto_62234 - SURFACE
      ?auto_62245 - PLACE
      ?auto_62239 - HOIST
      ?auto_62244 - SURFACE
      ?auto_62248 - SURFACE
      ?auto_62250 - PLACE
      ?auto_62236 - HOIST
      ?auto_62243 - SURFACE
      ?auto_62237 - TRUCK
      ?auto_62256 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62254 ?auto_62252 ) ( IS-CRATE ?auto_62232 ) ( not ( = ?auto_62232 ?auto_62233 ) ) ( not ( = ?auto_62246 ?auto_62252 ) ) ( HOIST-AT ?auto_62240 ?auto_62246 ) ( not ( = ?auto_62254 ?auto_62240 ) ) ( AVAILABLE ?auto_62240 ) ( SURFACE-AT ?auto_62232 ?auto_62246 ) ( ON ?auto_62232 ?auto_62241 ) ( CLEAR ?auto_62232 ) ( not ( = ?auto_62232 ?auto_62241 ) ) ( not ( = ?auto_62233 ?auto_62241 ) ) ( IS-CRATE ?auto_62233 ) ( not ( = ?auto_62232 ?auto_62251 ) ) ( not ( = ?auto_62233 ?auto_62251 ) ) ( not ( = ?auto_62241 ?auto_62251 ) ) ( not ( = ?auto_62255 ?auto_62252 ) ) ( not ( = ?auto_62246 ?auto_62255 ) ) ( HOIST-AT ?auto_62253 ?auto_62255 ) ( not ( = ?auto_62254 ?auto_62253 ) ) ( not ( = ?auto_62240 ?auto_62253 ) ) ( AVAILABLE ?auto_62253 ) ( SURFACE-AT ?auto_62233 ?auto_62255 ) ( ON ?auto_62233 ?auto_62238 ) ( CLEAR ?auto_62233 ) ( not ( = ?auto_62232 ?auto_62238 ) ) ( not ( = ?auto_62233 ?auto_62238 ) ) ( not ( = ?auto_62241 ?auto_62238 ) ) ( not ( = ?auto_62251 ?auto_62238 ) ) ( IS-CRATE ?auto_62251 ) ( not ( = ?auto_62232 ?auto_62249 ) ) ( not ( = ?auto_62233 ?auto_62249 ) ) ( not ( = ?auto_62241 ?auto_62249 ) ) ( not ( = ?auto_62251 ?auto_62249 ) ) ( not ( = ?auto_62238 ?auto_62249 ) ) ( not ( = ?auto_62235 ?auto_62252 ) ) ( not ( = ?auto_62246 ?auto_62235 ) ) ( not ( = ?auto_62255 ?auto_62235 ) ) ( HOIST-AT ?auto_62247 ?auto_62235 ) ( not ( = ?auto_62254 ?auto_62247 ) ) ( not ( = ?auto_62240 ?auto_62247 ) ) ( not ( = ?auto_62253 ?auto_62247 ) ) ( AVAILABLE ?auto_62247 ) ( SURFACE-AT ?auto_62251 ?auto_62235 ) ( ON ?auto_62251 ?auto_62242 ) ( CLEAR ?auto_62251 ) ( not ( = ?auto_62232 ?auto_62242 ) ) ( not ( = ?auto_62233 ?auto_62242 ) ) ( not ( = ?auto_62241 ?auto_62242 ) ) ( not ( = ?auto_62251 ?auto_62242 ) ) ( not ( = ?auto_62238 ?auto_62242 ) ) ( not ( = ?auto_62249 ?auto_62242 ) ) ( IS-CRATE ?auto_62249 ) ( not ( = ?auto_62232 ?auto_62234 ) ) ( not ( = ?auto_62233 ?auto_62234 ) ) ( not ( = ?auto_62241 ?auto_62234 ) ) ( not ( = ?auto_62251 ?auto_62234 ) ) ( not ( = ?auto_62238 ?auto_62234 ) ) ( not ( = ?auto_62249 ?auto_62234 ) ) ( not ( = ?auto_62242 ?auto_62234 ) ) ( not ( = ?auto_62245 ?auto_62252 ) ) ( not ( = ?auto_62246 ?auto_62245 ) ) ( not ( = ?auto_62255 ?auto_62245 ) ) ( not ( = ?auto_62235 ?auto_62245 ) ) ( HOIST-AT ?auto_62239 ?auto_62245 ) ( not ( = ?auto_62254 ?auto_62239 ) ) ( not ( = ?auto_62240 ?auto_62239 ) ) ( not ( = ?auto_62253 ?auto_62239 ) ) ( not ( = ?auto_62247 ?auto_62239 ) ) ( AVAILABLE ?auto_62239 ) ( SURFACE-AT ?auto_62249 ?auto_62245 ) ( ON ?auto_62249 ?auto_62244 ) ( CLEAR ?auto_62249 ) ( not ( = ?auto_62232 ?auto_62244 ) ) ( not ( = ?auto_62233 ?auto_62244 ) ) ( not ( = ?auto_62241 ?auto_62244 ) ) ( not ( = ?auto_62251 ?auto_62244 ) ) ( not ( = ?auto_62238 ?auto_62244 ) ) ( not ( = ?auto_62249 ?auto_62244 ) ) ( not ( = ?auto_62242 ?auto_62244 ) ) ( not ( = ?auto_62234 ?auto_62244 ) ) ( IS-CRATE ?auto_62234 ) ( not ( = ?auto_62232 ?auto_62248 ) ) ( not ( = ?auto_62233 ?auto_62248 ) ) ( not ( = ?auto_62241 ?auto_62248 ) ) ( not ( = ?auto_62251 ?auto_62248 ) ) ( not ( = ?auto_62238 ?auto_62248 ) ) ( not ( = ?auto_62249 ?auto_62248 ) ) ( not ( = ?auto_62242 ?auto_62248 ) ) ( not ( = ?auto_62234 ?auto_62248 ) ) ( not ( = ?auto_62244 ?auto_62248 ) ) ( not ( = ?auto_62250 ?auto_62252 ) ) ( not ( = ?auto_62246 ?auto_62250 ) ) ( not ( = ?auto_62255 ?auto_62250 ) ) ( not ( = ?auto_62235 ?auto_62250 ) ) ( not ( = ?auto_62245 ?auto_62250 ) ) ( HOIST-AT ?auto_62236 ?auto_62250 ) ( not ( = ?auto_62254 ?auto_62236 ) ) ( not ( = ?auto_62240 ?auto_62236 ) ) ( not ( = ?auto_62253 ?auto_62236 ) ) ( not ( = ?auto_62247 ?auto_62236 ) ) ( not ( = ?auto_62239 ?auto_62236 ) ) ( AVAILABLE ?auto_62236 ) ( SURFACE-AT ?auto_62234 ?auto_62250 ) ( ON ?auto_62234 ?auto_62243 ) ( CLEAR ?auto_62234 ) ( not ( = ?auto_62232 ?auto_62243 ) ) ( not ( = ?auto_62233 ?auto_62243 ) ) ( not ( = ?auto_62241 ?auto_62243 ) ) ( not ( = ?auto_62251 ?auto_62243 ) ) ( not ( = ?auto_62238 ?auto_62243 ) ) ( not ( = ?auto_62249 ?auto_62243 ) ) ( not ( = ?auto_62242 ?auto_62243 ) ) ( not ( = ?auto_62234 ?auto_62243 ) ) ( not ( = ?auto_62244 ?auto_62243 ) ) ( not ( = ?auto_62248 ?auto_62243 ) ) ( TRUCK-AT ?auto_62237 ?auto_62252 ) ( SURFACE-AT ?auto_62256 ?auto_62252 ) ( CLEAR ?auto_62256 ) ( LIFTING ?auto_62254 ?auto_62248 ) ( IS-CRATE ?auto_62248 ) ( not ( = ?auto_62232 ?auto_62256 ) ) ( not ( = ?auto_62233 ?auto_62256 ) ) ( not ( = ?auto_62241 ?auto_62256 ) ) ( not ( = ?auto_62251 ?auto_62256 ) ) ( not ( = ?auto_62238 ?auto_62256 ) ) ( not ( = ?auto_62249 ?auto_62256 ) ) ( not ( = ?auto_62242 ?auto_62256 ) ) ( not ( = ?auto_62234 ?auto_62256 ) ) ( not ( = ?auto_62244 ?auto_62256 ) ) ( not ( = ?auto_62248 ?auto_62256 ) ) ( not ( = ?auto_62243 ?auto_62256 ) ) )
    :subtasks
    ( ( !DROP ?auto_62254 ?auto_62248 ?auto_62256 ?auto_62252 )
      ( MAKE-ON ?auto_62232 ?auto_62233 )
      ( MAKE-ON-VERIFY ?auto_62232 ?auto_62233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62257 - SURFACE
      ?auto_62258 - SURFACE
    )
    :vars
    (
      ?auto_62274 - HOIST
      ?auto_62261 - PLACE
      ?auto_62268 - PLACE
      ?auto_62262 - HOIST
      ?auto_62266 - SURFACE
      ?auto_62273 - SURFACE
      ?auto_62275 - PLACE
      ?auto_62260 - HOIST
      ?auto_62278 - SURFACE
      ?auto_62270 - SURFACE
      ?auto_62277 - PLACE
      ?auto_62279 - HOIST
      ?auto_62281 - SURFACE
      ?auto_62271 - SURFACE
      ?auto_62276 - PLACE
      ?auto_62267 - HOIST
      ?auto_62264 - SURFACE
      ?auto_62259 - SURFACE
      ?auto_62272 - PLACE
      ?auto_62269 - HOIST
      ?auto_62265 - SURFACE
      ?auto_62280 - TRUCK
      ?auto_62263 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62274 ?auto_62261 ) ( IS-CRATE ?auto_62257 ) ( not ( = ?auto_62257 ?auto_62258 ) ) ( not ( = ?auto_62268 ?auto_62261 ) ) ( HOIST-AT ?auto_62262 ?auto_62268 ) ( not ( = ?auto_62274 ?auto_62262 ) ) ( AVAILABLE ?auto_62262 ) ( SURFACE-AT ?auto_62257 ?auto_62268 ) ( ON ?auto_62257 ?auto_62266 ) ( CLEAR ?auto_62257 ) ( not ( = ?auto_62257 ?auto_62266 ) ) ( not ( = ?auto_62258 ?auto_62266 ) ) ( IS-CRATE ?auto_62258 ) ( not ( = ?auto_62257 ?auto_62273 ) ) ( not ( = ?auto_62258 ?auto_62273 ) ) ( not ( = ?auto_62266 ?auto_62273 ) ) ( not ( = ?auto_62275 ?auto_62261 ) ) ( not ( = ?auto_62268 ?auto_62275 ) ) ( HOIST-AT ?auto_62260 ?auto_62275 ) ( not ( = ?auto_62274 ?auto_62260 ) ) ( not ( = ?auto_62262 ?auto_62260 ) ) ( AVAILABLE ?auto_62260 ) ( SURFACE-AT ?auto_62258 ?auto_62275 ) ( ON ?auto_62258 ?auto_62278 ) ( CLEAR ?auto_62258 ) ( not ( = ?auto_62257 ?auto_62278 ) ) ( not ( = ?auto_62258 ?auto_62278 ) ) ( not ( = ?auto_62266 ?auto_62278 ) ) ( not ( = ?auto_62273 ?auto_62278 ) ) ( IS-CRATE ?auto_62273 ) ( not ( = ?auto_62257 ?auto_62270 ) ) ( not ( = ?auto_62258 ?auto_62270 ) ) ( not ( = ?auto_62266 ?auto_62270 ) ) ( not ( = ?auto_62273 ?auto_62270 ) ) ( not ( = ?auto_62278 ?auto_62270 ) ) ( not ( = ?auto_62277 ?auto_62261 ) ) ( not ( = ?auto_62268 ?auto_62277 ) ) ( not ( = ?auto_62275 ?auto_62277 ) ) ( HOIST-AT ?auto_62279 ?auto_62277 ) ( not ( = ?auto_62274 ?auto_62279 ) ) ( not ( = ?auto_62262 ?auto_62279 ) ) ( not ( = ?auto_62260 ?auto_62279 ) ) ( AVAILABLE ?auto_62279 ) ( SURFACE-AT ?auto_62273 ?auto_62277 ) ( ON ?auto_62273 ?auto_62281 ) ( CLEAR ?auto_62273 ) ( not ( = ?auto_62257 ?auto_62281 ) ) ( not ( = ?auto_62258 ?auto_62281 ) ) ( not ( = ?auto_62266 ?auto_62281 ) ) ( not ( = ?auto_62273 ?auto_62281 ) ) ( not ( = ?auto_62278 ?auto_62281 ) ) ( not ( = ?auto_62270 ?auto_62281 ) ) ( IS-CRATE ?auto_62270 ) ( not ( = ?auto_62257 ?auto_62271 ) ) ( not ( = ?auto_62258 ?auto_62271 ) ) ( not ( = ?auto_62266 ?auto_62271 ) ) ( not ( = ?auto_62273 ?auto_62271 ) ) ( not ( = ?auto_62278 ?auto_62271 ) ) ( not ( = ?auto_62270 ?auto_62271 ) ) ( not ( = ?auto_62281 ?auto_62271 ) ) ( not ( = ?auto_62276 ?auto_62261 ) ) ( not ( = ?auto_62268 ?auto_62276 ) ) ( not ( = ?auto_62275 ?auto_62276 ) ) ( not ( = ?auto_62277 ?auto_62276 ) ) ( HOIST-AT ?auto_62267 ?auto_62276 ) ( not ( = ?auto_62274 ?auto_62267 ) ) ( not ( = ?auto_62262 ?auto_62267 ) ) ( not ( = ?auto_62260 ?auto_62267 ) ) ( not ( = ?auto_62279 ?auto_62267 ) ) ( AVAILABLE ?auto_62267 ) ( SURFACE-AT ?auto_62270 ?auto_62276 ) ( ON ?auto_62270 ?auto_62264 ) ( CLEAR ?auto_62270 ) ( not ( = ?auto_62257 ?auto_62264 ) ) ( not ( = ?auto_62258 ?auto_62264 ) ) ( not ( = ?auto_62266 ?auto_62264 ) ) ( not ( = ?auto_62273 ?auto_62264 ) ) ( not ( = ?auto_62278 ?auto_62264 ) ) ( not ( = ?auto_62270 ?auto_62264 ) ) ( not ( = ?auto_62281 ?auto_62264 ) ) ( not ( = ?auto_62271 ?auto_62264 ) ) ( IS-CRATE ?auto_62271 ) ( not ( = ?auto_62257 ?auto_62259 ) ) ( not ( = ?auto_62258 ?auto_62259 ) ) ( not ( = ?auto_62266 ?auto_62259 ) ) ( not ( = ?auto_62273 ?auto_62259 ) ) ( not ( = ?auto_62278 ?auto_62259 ) ) ( not ( = ?auto_62270 ?auto_62259 ) ) ( not ( = ?auto_62281 ?auto_62259 ) ) ( not ( = ?auto_62271 ?auto_62259 ) ) ( not ( = ?auto_62264 ?auto_62259 ) ) ( not ( = ?auto_62272 ?auto_62261 ) ) ( not ( = ?auto_62268 ?auto_62272 ) ) ( not ( = ?auto_62275 ?auto_62272 ) ) ( not ( = ?auto_62277 ?auto_62272 ) ) ( not ( = ?auto_62276 ?auto_62272 ) ) ( HOIST-AT ?auto_62269 ?auto_62272 ) ( not ( = ?auto_62274 ?auto_62269 ) ) ( not ( = ?auto_62262 ?auto_62269 ) ) ( not ( = ?auto_62260 ?auto_62269 ) ) ( not ( = ?auto_62279 ?auto_62269 ) ) ( not ( = ?auto_62267 ?auto_62269 ) ) ( AVAILABLE ?auto_62269 ) ( SURFACE-AT ?auto_62271 ?auto_62272 ) ( ON ?auto_62271 ?auto_62265 ) ( CLEAR ?auto_62271 ) ( not ( = ?auto_62257 ?auto_62265 ) ) ( not ( = ?auto_62258 ?auto_62265 ) ) ( not ( = ?auto_62266 ?auto_62265 ) ) ( not ( = ?auto_62273 ?auto_62265 ) ) ( not ( = ?auto_62278 ?auto_62265 ) ) ( not ( = ?auto_62270 ?auto_62265 ) ) ( not ( = ?auto_62281 ?auto_62265 ) ) ( not ( = ?auto_62271 ?auto_62265 ) ) ( not ( = ?auto_62264 ?auto_62265 ) ) ( not ( = ?auto_62259 ?auto_62265 ) ) ( TRUCK-AT ?auto_62280 ?auto_62261 ) ( SURFACE-AT ?auto_62263 ?auto_62261 ) ( CLEAR ?auto_62263 ) ( IS-CRATE ?auto_62259 ) ( not ( = ?auto_62257 ?auto_62263 ) ) ( not ( = ?auto_62258 ?auto_62263 ) ) ( not ( = ?auto_62266 ?auto_62263 ) ) ( not ( = ?auto_62273 ?auto_62263 ) ) ( not ( = ?auto_62278 ?auto_62263 ) ) ( not ( = ?auto_62270 ?auto_62263 ) ) ( not ( = ?auto_62281 ?auto_62263 ) ) ( not ( = ?auto_62271 ?auto_62263 ) ) ( not ( = ?auto_62264 ?auto_62263 ) ) ( not ( = ?auto_62259 ?auto_62263 ) ) ( not ( = ?auto_62265 ?auto_62263 ) ) ( AVAILABLE ?auto_62274 ) ( IN ?auto_62259 ?auto_62280 ) )
    :subtasks
    ( ( !UNLOAD ?auto_62274 ?auto_62259 ?auto_62280 ?auto_62261 )
      ( MAKE-ON ?auto_62257 ?auto_62258 )
      ( MAKE-ON-VERIFY ?auto_62257 ?auto_62258 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62282 - SURFACE
      ?auto_62283 - SURFACE
    )
    :vars
    (
      ?auto_62293 - HOIST
      ?auto_62302 - PLACE
      ?auto_62299 - PLACE
      ?auto_62294 - HOIST
      ?auto_62287 - SURFACE
      ?auto_62295 - SURFACE
      ?auto_62301 - PLACE
      ?auto_62290 - HOIST
      ?auto_62297 - SURFACE
      ?auto_62288 - SURFACE
      ?auto_62305 - PLACE
      ?auto_62304 - HOIST
      ?auto_62292 - SURFACE
      ?auto_62296 - SURFACE
      ?auto_62298 - PLACE
      ?auto_62289 - HOIST
      ?auto_62306 - SURFACE
      ?auto_62300 - SURFACE
      ?auto_62286 - PLACE
      ?auto_62303 - HOIST
      ?auto_62284 - SURFACE
      ?auto_62285 - SURFACE
      ?auto_62291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_62293 ?auto_62302 ) ( IS-CRATE ?auto_62282 ) ( not ( = ?auto_62282 ?auto_62283 ) ) ( not ( = ?auto_62299 ?auto_62302 ) ) ( HOIST-AT ?auto_62294 ?auto_62299 ) ( not ( = ?auto_62293 ?auto_62294 ) ) ( AVAILABLE ?auto_62294 ) ( SURFACE-AT ?auto_62282 ?auto_62299 ) ( ON ?auto_62282 ?auto_62287 ) ( CLEAR ?auto_62282 ) ( not ( = ?auto_62282 ?auto_62287 ) ) ( not ( = ?auto_62283 ?auto_62287 ) ) ( IS-CRATE ?auto_62283 ) ( not ( = ?auto_62282 ?auto_62295 ) ) ( not ( = ?auto_62283 ?auto_62295 ) ) ( not ( = ?auto_62287 ?auto_62295 ) ) ( not ( = ?auto_62301 ?auto_62302 ) ) ( not ( = ?auto_62299 ?auto_62301 ) ) ( HOIST-AT ?auto_62290 ?auto_62301 ) ( not ( = ?auto_62293 ?auto_62290 ) ) ( not ( = ?auto_62294 ?auto_62290 ) ) ( AVAILABLE ?auto_62290 ) ( SURFACE-AT ?auto_62283 ?auto_62301 ) ( ON ?auto_62283 ?auto_62297 ) ( CLEAR ?auto_62283 ) ( not ( = ?auto_62282 ?auto_62297 ) ) ( not ( = ?auto_62283 ?auto_62297 ) ) ( not ( = ?auto_62287 ?auto_62297 ) ) ( not ( = ?auto_62295 ?auto_62297 ) ) ( IS-CRATE ?auto_62295 ) ( not ( = ?auto_62282 ?auto_62288 ) ) ( not ( = ?auto_62283 ?auto_62288 ) ) ( not ( = ?auto_62287 ?auto_62288 ) ) ( not ( = ?auto_62295 ?auto_62288 ) ) ( not ( = ?auto_62297 ?auto_62288 ) ) ( not ( = ?auto_62305 ?auto_62302 ) ) ( not ( = ?auto_62299 ?auto_62305 ) ) ( not ( = ?auto_62301 ?auto_62305 ) ) ( HOIST-AT ?auto_62304 ?auto_62305 ) ( not ( = ?auto_62293 ?auto_62304 ) ) ( not ( = ?auto_62294 ?auto_62304 ) ) ( not ( = ?auto_62290 ?auto_62304 ) ) ( AVAILABLE ?auto_62304 ) ( SURFACE-AT ?auto_62295 ?auto_62305 ) ( ON ?auto_62295 ?auto_62292 ) ( CLEAR ?auto_62295 ) ( not ( = ?auto_62282 ?auto_62292 ) ) ( not ( = ?auto_62283 ?auto_62292 ) ) ( not ( = ?auto_62287 ?auto_62292 ) ) ( not ( = ?auto_62295 ?auto_62292 ) ) ( not ( = ?auto_62297 ?auto_62292 ) ) ( not ( = ?auto_62288 ?auto_62292 ) ) ( IS-CRATE ?auto_62288 ) ( not ( = ?auto_62282 ?auto_62296 ) ) ( not ( = ?auto_62283 ?auto_62296 ) ) ( not ( = ?auto_62287 ?auto_62296 ) ) ( not ( = ?auto_62295 ?auto_62296 ) ) ( not ( = ?auto_62297 ?auto_62296 ) ) ( not ( = ?auto_62288 ?auto_62296 ) ) ( not ( = ?auto_62292 ?auto_62296 ) ) ( not ( = ?auto_62298 ?auto_62302 ) ) ( not ( = ?auto_62299 ?auto_62298 ) ) ( not ( = ?auto_62301 ?auto_62298 ) ) ( not ( = ?auto_62305 ?auto_62298 ) ) ( HOIST-AT ?auto_62289 ?auto_62298 ) ( not ( = ?auto_62293 ?auto_62289 ) ) ( not ( = ?auto_62294 ?auto_62289 ) ) ( not ( = ?auto_62290 ?auto_62289 ) ) ( not ( = ?auto_62304 ?auto_62289 ) ) ( AVAILABLE ?auto_62289 ) ( SURFACE-AT ?auto_62288 ?auto_62298 ) ( ON ?auto_62288 ?auto_62306 ) ( CLEAR ?auto_62288 ) ( not ( = ?auto_62282 ?auto_62306 ) ) ( not ( = ?auto_62283 ?auto_62306 ) ) ( not ( = ?auto_62287 ?auto_62306 ) ) ( not ( = ?auto_62295 ?auto_62306 ) ) ( not ( = ?auto_62297 ?auto_62306 ) ) ( not ( = ?auto_62288 ?auto_62306 ) ) ( not ( = ?auto_62292 ?auto_62306 ) ) ( not ( = ?auto_62296 ?auto_62306 ) ) ( IS-CRATE ?auto_62296 ) ( not ( = ?auto_62282 ?auto_62300 ) ) ( not ( = ?auto_62283 ?auto_62300 ) ) ( not ( = ?auto_62287 ?auto_62300 ) ) ( not ( = ?auto_62295 ?auto_62300 ) ) ( not ( = ?auto_62297 ?auto_62300 ) ) ( not ( = ?auto_62288 ?auto_62300 ) ) ( not ( = ?auto_62292 ?auto_62300 ) ) ( not ( = ?auto_62296 ?auto_62300 ) ) ( not ( = ?auto_62306 ?auto_62300 ) ) ( not ( = ?auto_62286 ?auto_62302 ) ) ( not ( = ?auto_62299 ?auto_62286 ) ) ( not ( = ?auto_62301 ?auto_62286 ) ) ( not ( = ?auto_62305 ?auto_62286 ) ) ( not ( = ?auto_62298 ?auto_62286 ) ) ( HOIST-AT ?auto_62303 ?auto_62286 ) ( not ( = ?auto_62293 ?auto_62303 ) ) ( not ( = ?auto_62294 ?auto_62303 ) ) ( not ( = ?auto_62290 ?auto_62303 ) ) ( not ( = ?auto_62304 ?auto_62303 ) ) ( not ( = ?auto_62289 ?auto_62303 ) ) ( AVAILABLE ?auto_62303 ) ( SURFACE-AT ?auto_62296 ?auto_62286 ) ( ON ?auto_62296 ?auto_62284 ) ( CLEAR ?auto_62296 ) ( not ( = ?auto_62282 ?auto_62284 ) ) ( not ( = ?auto_62283 ?auto_62284 ) ) ( not ( = ?auto_62287 ?auto_62284 ) ) ( not ( = ?auto_62295 ?auto_62284 ) ) ( not ( = ?auto_62297 ?auto_62284 ) ) ( not ( = ?auto_62288 ?auto_62284 ) ) ( not ( = ?auto_62292 ?auto_62284 ) ) ( not ( = ?auto_62296 ?auto_62284 ) ) ( not ( = ?auto_62306 ?auto_62284 ) ) ( not ( = ?auto_62300 ?auto_62284 ) ) ( SURFACE-AT ?auto_62285 ?auto_62302 ) ( CLEAR ?auto_62285 ) ( IS-CRATE ?auto_62300 ) ( not ( = ?auto_62282 ?auto_62285 ) ) ( not ( = ?auto_62283 ?auto_62285 ) ) ( not ( = ?auto_62287 ?auto_62285 ) ) ( not ( = ?auto_62295 ?auto_62285 ) ) ( not ( = ?auto_62297 ?auto_62285 ) ) ( not ( = ?auto_62288 ?auto_62285 ) ) ( not ( = ?auto_62292 ?auto_62285 ) ) ( not ( = ?auto_62296 ?auto_62285 ) ) ( not ( = ?auto_62306 ?auto_62285 ) ) ( not ( = ?auto_62300 ?auto_62285 ) ) ( not ( = ?auto_62284 ?auto_62285 ) ) ( AVAILABLE ?auto_62293 ) ( IN ?auto_62300 ?auto_62291 ) ( TRUCK-AT ?auto_62291 ?auto_62299 ) )
    :subtasks
    ( ( !DRIVE ?auto_62291 ?auto_62299 ?auto_62302 )
      ( MAKE-ON ?auto_62282 ?auto_62283 )
      ( MAKE-ON-VERIFY ?auto_62282 ?auto_62283 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62307 - SURFACE
      ?auto_62308 - SURFACE
    )
    :vars
    (
      ?auto_62310 - HOIST
      ?auto_62329 - PLACE
      ?auto_62320 - PLACE
      ?auto_62319 - HOIST
      ?auto_62325 - SURFACE
      ?auto_62315 - SURFACE
      ?auto_62328 - PLACE
      ?auto_62321 - HOIST
      ?auto_62312 - SURFACE
      ?auto_62311 - SURFACE
      ?auto_62314 - PLACE
      ?auto_62331 - HOIST
      ?auto_62327 - SURFACE
      ?auto_62322 - SURFACE
      ?auto_62316 - PLACE
      ?auto_62326 - HOIST
      ?auto_62309 - SURFACE
      ?auto_62313 - SURFACE
      ?auto_62323 - PLACE
      ?auto_62330 - HOIST
      ?auto_62324 - SURFACE
      ?auto_62318 - SURFACE
      ?auto_62317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_62310 ?auto_62329 ) ( IS-CRATE ?auto_62307 ) ( not ( = ?auto_62307 ?auto_62308 ) ) ( not ( = ?auto_62320 ?auto_62329 ) ) ( HOIST-AT ?auto_62319 ?auto_62320 ) ( not ( = ?auto_62310 ?auto_62319 ) ) ( SURFACE-AT ?auto_62307 ?auto_62320 ) ( ON ?auto_62307 ?auto_62325 ) ( CLEAR ?auto_62307 ) ( not ( = ?auto_62307 ?auto_62325 ) ) ( not ( = ?auto_62308 ?auto_62325 ) ) ( IS-CRATE ?auto_62308 ) ( not ( = ?auto_62307 ?auto_62315 ) ) ( not ( = ?auto_62308 ?auto_62315 ) ) ( not ( = ?auto_62325 ?auto_62315 ) ) ( not ( = ?auto_62328 ?auto_62329 ) ) ( not ( = ?auto_62320 ?auto_62328 ) ) ( HOIST-AT ?auto_62321 ?auto_62328 ) ( not ( = ?auto_62310 ?auto_62321 ) ) ( not ( = ?auto_62319 ?auto_62321 ) ) ( AVAILABLE ?auto_62321 ) ( SURFACE-AT ?auto_62308 ?auto_62328 ) ( ON ?auto_62308 ?auto_62312 ) ( CLEAR ?auto_62308 ) ( not ( = ?auto_62307 ?auto_62312 ) ) ( not ( = ?auto_62308 ?auto_62312 ) ) ( not ( = ?auto_62325 ?auto_62312 ) ) ( not ( = ?auto_62315 ?auto_62312 ) ) ( IS-CRATE ?auto_62315 ) ( not ( = ?auto_62307 ?auto_62311 ) ) ( not ( = ?auto_62308 ?auto_62311 ) ) ( not ( = ?auto_62325 ?auto_62311 ) ) ( not ( = ?auto_62315 ?auto_62311 ) ) ( not ( = ?auto_62312 ?auto_62311 ) ) ( not ( = ?auto_62314 ?auto_62329 ) ) ( not ( = ?auto_62320 ?auto_62314 ) ) ( not ( = ?auto_62328 ?auto_62314 ) ) ( HOIST-AT ?auto_62331 ?auto_62314 ) ( not ( = ?auto_62310 ?auto_62331 ) ) ( not ( = ?auto_62319 ?auto_62331 ) ) ( not ( = ?auto_62321 ?auto_62331 ) ) ( AVAILABLE ?auto_62331 ) ( SURFACE-AT ?auto_62315 ?auto_62314 ) ( ON ?auto_62315 ?auto_62327 ) ( CLEAR ?auto_62315 ) ( not ( = ?auto_62307 ?auto_62327 ) ) ( not ( = ?auto_62308 ?auto_62327 ) ) ( not ( = ?auto_62325 ?auto_62327 ) ) ( not ( = ?auto_62315 ?auto_62327 ) ) ( not ( = ?auto_62312 ?auto_62327 ) ) ( not ( = ?auto_62311 ?auto_62327 ) ) ( IS-CRATE ?auto_62311 ) ( not ( = ?auto_62307 ?auto_62322 ) ) ( not ( = ?auto_62308 ?auto_62322 ) ) ( not ( = ?auto_62325 ?auto_62322 ) ) ( not ( = ?auto_62315 ?auto_62322 ) ) ( not ( = ?auto_62312 ?auto_62322 ) ) ( not ( = ?auto_62311 ?auto_62322 ) ) ( not ( = ?auto_62327 ?auto_62322 ) ) ( not ( = ?auto_62316 ?auto_62329 ) ) ( not ( = ?auto_62320 ?auto_62316 ) ) ( not ( = ?auto_62328 ?auto_62316 ) ) ( not ( = ?auto_62314 ?auto_62316 ) ) ( HOIST-AT ?auto_62326 ?auto_62316 ) ( not ( = ?auto_62310 ?auto_62326 ) ) ( not ( = ?auto_62319 ?auto_62326 ) ) ( not ( = ?auto_62321 ?auto_62326 ) ) ( not ( = ?auto_62331 ?auto_62326 ) ) ( AVAILABLE ?auto_62326 ) ( SURFACE-AT ?auto_62311 ?auto_62316 ) ( ON ?auto_62311 ?auto_62309 ) ( CLEAR ?auto_62311 ) ( not ( = ?auto_62307 ?auto_62309 ) ) ( not ( = ?auto_62308 ?auto_62309 ) ) ( not ( = ?auto_62325 ?auto_62309 ) ) ( not ( = ?auto_62315 ?auto_62309 ) ) ( not ( = ?auto_62312 ?auto_62309 ) ) ( not ( = ?auto_62311 ?auto_62309 ) ) ( not ( = ?auto_62327 ?auto_62309 ) ) ( not ( = ?auto_62322 ?auto_62309 ) ) ( IS-CRATE ?auto_62322 ) ( not ( = ?auto_62307 ?auto_62313 ) ) ( not ( = ?auto_62308 ?auto_62313 ) ) ( not ( = ?auto_62325 ?auto_62313 ) ) ( not ( = ?auto_62315 ?auto_62313 ) ) ( not ( = ?auto_62312 ?auto_62313 ) ) ( not ( = ?auto_62311 ?auto_62313 ) ) ( not ( = ?auto_62327 ?auto_62313 ) ) ( not ( = ?auto_62322 ?auto_62313 ) ) ( not ( = ?auto_62309 ?auto_62313 ) ) ( not ( = ?auto_62323 ?auto_62329 ) ) ( not ( = ?auto_62320 ?auto_62323 ) ) ( not ( = ?auto_62328 ?auto_62323 ) ) ( not ( = ?auto_62314 ?auto_62323 ) ) ( not ( = ?auto_62316 ?auto_62323 ) ) ( HOIST-AT ?auto_62330 ?auto_62323 ) ( not ( = ?auto_62310 ?auto_62330 ) ) ( not ( = ?auto_62319 ?auto_62330 ) ) ( not ( = ?auto_62321 ?auto_62330 ) ) ( not ( = ?auto_62331 ?auto_62330 ) ) ( not ( = ?auto_62326 ?auto_62330 ) ) ( AVAILABLE ?auto_62330 ) ( SURFACE-AT ?auto_62322 ?auto_62323 ) ( ON ?auto_62322 ?auto_62324 ) ( CLEAR ?auto_62322 ) ( not ( = ?auto_62307 ?auto_62324 ) ) ( not ( = ?auto_62308 ?auto_62324 ) ) ( not ( = ?auto_62325 ?auto_62324 ) ) ( not ( = ?auto_62315 ?auto_62324 ) ) ( not ( = ?auto_62312 ?auto_62324 ) ) ( not ( = ?auto_62311 ?auto_62324 ) ) ( not ( = ?auto_62327 ?auto_62324 ) ) ( not ( = ?auto_62322 ?auto_62324 ) ) ( not ( = ?auto_62309 ?auto_62324 ) ) ( not ( = ?auto_62313 ?auto_62324 ) ) ( SURFACE-AT ?auto_62318 ?auto_62329 ) ( CLEAR ?auto_62318 ) ( IS-CRATE ?auto_62313 ) ( not ( = ?auto_62307 ?auto_62318 ) ) ( not ( = ?auto_62308 ?auto_62318 ) ) ( not ( = ?auto_62325 ?auto_62318 ) ) ( not ( = ?auto_62315 ?auto_62318 ) ) ( not ( = ?auto_62312 ?auto_62318 ) ) ( not ( = ?auto_62311 ?auto_62318 ) ) ( not ( = ?auto_62327 ?auto_62318 ) ) ( not ( = ?auto_62322 ?auto_62318 ) ) ( not ( = ?auto_62309 ?auto_62318 ) ) ( not ( = ?auto_62313 ?auto_62318 ) ) ( not ( = ?auto_62324 ?auto_62318 ) ) ( AVAILABLE ?auto_62310 ) ( TRUCK-AT ?auto_62317 ?auto_62320 ) ( LIFTING ?auto_62319 ?auto_62313 ) )
    :subtasks
    ( ( !LOAD ?auto_62319 ?auto_62313 ?auto_62317 ?auto_62320 )
      ( MAKE-ON ?auto_62307 ?auto_62308 )
      ( MAKE-ON-VERIFY ?auto_62307 ?auto_62308 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62332 - SURFACE
      ?auto_62333 - SURFACE
    )
    :vars
    (
      ?auto_62348 - HOIST
      ?auto_62340 - PLACE
      ?auto_62352 - PLACE
      ?auto_62353 - HOIST
      ?auto_62338 - SURFACE
      ?auto_62335 - SURFACE
      ?auto_62356 - PLACE
      ?auto_62351 - HOIST
      ?auto_62349 - SURFACE
      ?auto_62347 - SURFACE
      ?auto_62345 - PLACE
      ?auto_62342 - HOIST
      ?auto_62336 - SURFACE
      ?auto_62339 - SURFACE
      ?auto_62346 - PLACE
      ?auto_62337 - HOIST
      ?auto_62354 - SURFACE
      ?auto_62350 - SURFACE
      ?auto_62355 - PLACE
      ?auto_62341 - HOIST
      ?auto_62343 - SURFACE
      ?auto_62334 - SURFACE
      ?auto_62344 - TRUCK
      ?auto_62357 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62348 ?auto_62340 ) ( IS-CRATE ?auto_62332 ) ( not ( = ?auto_62332 ?auto_62333 ) ) ( not ( = ?auto_62352 ?auto_62340 ) ) ( HOIST-AT ?auto_62353 ?auto_62352 ) ( not ( = ?auto_62348 ?auto_62353 ) ) ( SURFACE-AT ?auto_62332 ?auto_62352 ) ( ON ?auto_62332 ?auto_62338 ) ( CLEAR ?auto_62332 ) ( not ( = ?auto_62332 ?auto_62338 ) ) ( not ( = ?auto_62333 ?auto_62338 ) ) ( IS-CRATE ?auto_62333 ) ( not ( = ?auto_62332 ?auto_62335 ) ) ( not ( = ?auto_62333 ?auto_62335 ) ) ( not ( = ?auto_62338 ?auto_62335 ) ) ( not ( = ?auto_62356 ?auto_62340 ) ) ( not ( = ?auto_62352 ?auto_62356 ) ) ( HOIST-AT ?auto_62351 ?auto_62356 ) ( not ( = ?auto_62348 ?auto_62351 ) ) ( not ( = ?auto_62353 ?auto_62351 ) ) ( AVAILABLE ?auto_62351 ) ( SURFACE-AT ?auto_62333 ?auto_62356 ) ( ON ?auto_62333 ?auto_62349 ) ( CLEAR ?auto_62333 ) ( not ( = ?auto_62332 ?auto_62349 ) ) ( not ( = ?auto_62333 ?auto_62349 ) ) ( not ( = ?auto_62338 ?auto_62349 ) ) ( not ( = ?auto_62335 ?auto_62349 ) ) ( IS-CRATE ?auto_62335 ) ( not ( = ?auto_62332 ?auto_62347 ) ) ( not ( = ?auto_62333 ?auto_62347 ) ) ( not ( = ?auto_62338 ?auto_62347 ) ) ( not ( = ?auto_62335 ?auto_62347 ) ) ( not ( = ?auto_62349 ?auto_62347 ) ) ( not ( = ?auto_62345 ?auto_62340 ) ) ( not ( = ?auto_62352 ?auto_62345 ) ) ( not ( = ?auto_62356 ?auto_62345 ) ) ( HOIST-AT ?auto_62342 ?auto_62345 ) ( not ( = ?auto_62348 ?auto_62342 ) ) ( not ( = ?auto_62353 ?auto_62342 ) ) ( not ( = ?auto_62351 ?auto_62342 ) ) ( AVAILABLE ?auto_62342 ) ( SURFACE-AT ?auto_62335 ?auto_62345 ) ( ON ?auto_62335 ?auto_62336 ) ( CLEAR ?auto_62335 ) ( not ( = ?auto_62332 ?auto_62336 ) ) ( not ( = ?auto_62333 ?auto_62336 ) ) ( not ( = ?auto_62338 ?auto_62336 ) ) ( not ( = ?auto_62335 ?auto_62336 ) ) ( not ( = ?auto_62349 ?auto_62336 ) ) ( not ( = ?auto_62347 ?auto_62336 ) ) ( IS-CRATE ?auto_62347 ) ( not ( = ?auto_62332 ?auto_62339 ) ) ( not ( = ?auto_62333 ?auto_62339 ) ) ( not ( = ?auto_62338 ?auto_62339 ) ) ( not ( = ?auto_62335 ?auto_62339 ) ) ( not ( = ?auto_62349 ?auto_62339 ) ) ( not ( = ?auto_62347 ?auto_62339 ) ) ( not ( = ?auto_62336 ?auto_62339 ) ) ( not ( = ?auto_62346 ?auto_62340 ) ) ( not ( = ?auto_62352 ?auto_62346 ) ) ( not ( = ?auto_62356 ?auto_62346 ) ) ( not ( = ?auto_62345 ?auto_62346 ) ) ( HOIST-AT ?auto_62337 ?auto_62346 ) ( not ( = ?auto_62348 ?auto_62337 ) ) ( not ( = ?auto_62353 ?auto_62337 ) ) ( not ( = ?auto_62351 ?auto_62337 ) ) ( not ( = ?auto_62342 ?auto_62337 ) ) ( AVAILABLE ?auto_62337 ) ( SURFACE-AT ?auto_62347 ?auto_62346 ) ( ON ?auto_62347 ?auto_62354 ) ( CLEAR ?auto_62347 ) ( not ( = ?auto_62332 ?auto_62354 ) ) ( not ( = ?auto_62333 ?auto_62354 ) ) ( not ( = ?auto_62338 ?auto_62354 ) ) ( not ( = ?auto_62335 ?auto_62354 ) ) ( not ( = ?auto_62349 ?auto_62354 ) ) ( not ( = ?auto_62347 ?auto_62354 ) ) ( not ( = ?auto_62336 ?auto_62354 ) ) ( not ( = ?auto_62339 ?auto_62354 ) ) ( IS-CRATE ?auto_62339 ) ( not ( = ?auto_62332 ?auto_62350 ) ) ( not ( = ?auto_62333 ?auto_62350 ) ) ( not ( = ?auto_62338 ?auto_62350 ) ) ( not ( = ?auto_62335 ?auto_62350 ) ) ( not ( = ?auto_62349 ?auto_62350 ) ) ( not ( = ?auto_62347 ?auto_62350 ) ) ( not ( = ?auto_62336 ?auto_62350 ) ) ( not ( = ?auto_62339 ?auto_62350 ) ) ( not ( = ?auto_62354 ?auto_62350 ) ) ( not ( = ?auto_62355 ?auto_62340 ) ) ( not ( = ?auto_62352 ?auto_62355 ) ) ( not ( = ?auto_62356 ?auto_62355 ) ) ( not ( = ?auto_62345 ?auto_62355 ) ) ( not ( = ?auto_62346 ?auto_62355 ) ) ( HOIST-AT ?auto_62341 ?auto_62355 ) ( not ( = ?auto_62348 ?auto_62341 ) ) ( not ( = ?auto_62353 ?auto_62341 ) ) ( not ( = ?auto_62351 ?auto_62341 ) ) ( not ( = ?auto_62342 ?auto_62341 ) ) ( not ( = ?auto_62337 ?auto_62341 ) ) ( AVAILABLE ?auto_62341 ) ( SURFACE-AT ?auto_62339 ?auto_62355 ) ( ON ?auto_62339 ?auto_62343 ) ( CLEAR ?auto_62339 ) ( not ( = ?auto_62332 ?auto_62343 ) ) ( not ( = ?auto_62333 ?auto_62343 ) ) ( not ( = ?auto_62338 ?auto_62343 ) ) ( not ( = ?auto_62335 ?auto_62343 ) ) ( not ( = ?auto_62349 ?auto_62343 ) ) ( not ( = ?auto_62347 ?auto_62343 ) ) ( not ( = ?auto_62336 ?auto_62343 ) ) ( not ( = ?auto_62339 ?auto_62343 ) ) ( not ( = ?auto_62354 ?auto_62343 ) ) ( not ( = ?auto_62350 ?auto_62343 ) ) ( SURFACE-AT ?auto_62334 ?auto_62340 ) ( CLEAR ?auto_62334 ) ( IS-CRATE ?auto_62350 ) ( not ( = ?auto_62332 ?auto_62334 ) ) ( not ( = ?auto_62333 ?auto_62334 ) ) ( not ( = ?auto_62338 ?auto_62334 ) ) ( not ( = ?auto_62335 ?auto_62334 ) ) ( not ( = ?auto_62349 ?auto_62334 ) ) ( not ( = ?auto_62347 ?auto_62334 ) ) ( not ( = ?auto_62336 ?auto_62334 ) ) ( not ( = ?auto_62339 ?auto_62334 ) ) ( not ( = ?auto_62354 ?auto_62334 ) ) ( not ( = ?auto_62350 ?auto_62334 ) ) ( not ( = ?auto_62343 ?auto_62334 ) ) ( AVAILABLE ?auto_62348 ) ( TRUCK-AT ?auto_62344 ?auto_62352 ) ( AVAILABLE ?auto_62353 ) ( SURFACE-AT ?auto_62350 ?auto_62352 ) ( ON ?auto_62350 ?auto_62357 ) ( CLEAR ?auto_62350 ) ( not ( = ?auto_62332 ?auto_62357 ) ) ( not ( = ?auto_62333 ?auto_62357 ) ) ( not ( = ?auto_62338 ?auto_62357 ) ) ( not ( = ?auto_62335 ?auto_62357 ) ) ( not ( = ?auto_62349 ?auto_62357 ) ) ( not ( = ?auto_62347 ?auto_62357 ) ) ( not ( = ?auto_62336 ?auto_62357 ) ) ( not ( = ?auto_62339 ?auto_62357 ) ) ( not ( = ?auto_62354 ?auto_62357 ) ) ( not ( = ?auto_62350 ?auto_62357 ) ) ( not ( = ?auto_62343 ?auto_62357 ) ) ( not ( = ?auto_62334 ?auto_62357 ) ) )
    :subtasks
    ( ( !LIFT ?auto_62353 ?auto_62350 ?auto_62357 ?auto_62352 )
      ( MAKE-ON ?auto_62332 ?auto_62333 )
      ( MAKE-ON-VERIFY ?auto_62332 ?auto_62333 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62358 - SURFACE
      ?auto_62359 - SURFACE
    )
    :vars
    (
      ?auto_62362 - HOIST
      ?auto_62360 - PLACE
      ?auto_62379 - PLACE
      ?auto_62380 - HOIST
      ?auto_62371 - SURFACE
      ?auto_62383 - SURFACE
      ?auto_62373 - PLACE
      ?auto_62366 - HOIST
      ?auto_62374 - SURFACE
      ?auto_62382 - SURFACE
      ?auto_62365 - PLACE
      ?auto_62363 - HOIST
      ?auto_62372 - SURFACE
      ?auto_62368 - SURFACE
      ?auto_62381 - PLACE
      ?auto_62370 - HOIST
      ?auto_62377 - SURFACE
      ?auto_62367 - SURFACE
      ?auto_62378 - PLACE
      ?auto_62369 - HOIST
      ?auto_62376 - SURFACE
      ?auto_62375 - SURFACE
      ?auto_62361 - SURFACE
      ?auto_62364 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_62362 ?auto_62360 ) ( IS-CRATE ?auto_62358 ) ( not ( = ?auto_62358 ?auto_62359 ) ) ( not ( = ?auto_62379 ?auto_62360 ) ) ( HOIST-AT ?auto_62380 ?auto_62379 ) ( not ( = ?auto_62362 ?auto_62380 ) ) ( SURFACE-AT ?auto_62358 ?auto_62379 ) ( ON ?auto_62358 ?auto_62371 ) ( CLEAR ?auto_62358 ) ( not ( = ?auto_62358 ?auto_62371 ) ) ( not ( = ?auto_62359 ?auto_62371 ) ) ( IS-CRATE ?auto_62359 ) ( not ( = ?auto_62358 ?auto_62383 ) ) ( not ( = ?auto_62359 ?auto_62383 ) ) ( not ( = ?auto_62371 ?auto_62383 ) ) ( not ( = ?auto_62373 ?auto_62360 ) ) ( not ( = ?auto_62379 ?auto_62373 ) ) ( HOIST-AT ?auto_62366 ?auto_62373 ) ( not ( = ?auto_62362 ?auto_62366 ) ) ( not ( = ?auto_62380 ?auto_62366 ) ) ( AVAILABLE ?auto_62366 ) ( SURFACE-AT ?auto_62359 ?auto_62373 ) ( ON ?auto_62359 ?auto_62374 ) ( CLEAR ?auto_62359 ) ( not ( = ?auto_62358 ?auto_62374 ) ) ( not ( = ?auto_62359 ?auto_62374 ) ) ( not ( = ?auto_62371 ?auto_62374 ) ) ( not ( = ?auto_62383 ?auto_62374 ) ) ( IS-CRATE ?auto_62383 ) ( not ( = ?auto_62358 ?auto_62382 ) ) ( not ( = ?auto_62359 ?auto_62382 ) ) ( not ( = ?auto_62371 ?auto_62382 ) ) ( not ( = ?auto_62383 ?auto_62382 ) ) ( not ( = ?auto_62374 ?auto_62382 ) ) ( not ( = ?auto_62365 ?auto_62360 ) ) ( not ( = ?auto_62379 ?auto_62365 ) ) ( not ( = ?auto_62373 ?auto_62365 ) ) ( HOIST-AT ?auto_62363 ?auto_62365 ) ( not ( = ?auto_62362 ?auto_62363 ) ) ( not ( = ?auto_62380 ?auto_62363 ) ) ( not ( = ?auto_62366 ?auto_62363 ) ) ( AVAILABLE ?auto_62363 ) ( SURFACE-AT ?auto_62383 ?auto_62365 ) ( ON ?auto_62383 ?auto_62372 ) ( CLEAR ?auto_62383 ) ( not ( = ?auto_62358 ?auto_62372 ) ) ( not ( = ?auto_62359 ?auto_62372 ) ) ( not ( = ?auto_62371 ?auto_62372 ) ) ( not ( = ?auto_62383 ?auto_62372 ) ) ( not ( = ?auto_62374 ?auto_62372 ) ) ( not ( = ?auto_62382 ?auto_62372 ) ) ( IS-CRATE ?auto_62382 ) ( not ( = ?auto_62358 ?auto_62368 ) ) ( not ( = ?auto_62359 ?auto_62368 ) ) ( not ( = ?auto_62371 ?auto_62368 ) ) ( not ( = ?auto_62383 ?auto_62368 ) ) ( not ( = ?auto_62374 ?auto_62368 ) ) ( not ( = ?auto_62382 ?auto_62368 ) ) ( not ( = ?auto_62372 ?auto_62368 ) ) ( not ( = ?auto_62381 ?auto_62360 ) ) ( not ( = ?auto_62379 ?auto_62381 ) ) ( not ( = ?auto_62373 ?auto_62381 ) ) ( not ( = ?auto_62365 ?auto_62381 ) ) ( HOIST-AT ?auto_62370 ?auto_62381 ) ( not ( = ?auto_62362 ?auto_62370 ) ) ( not ( = ?auto_62380 ?auto_62370 ) ) ( not ( = ?auto_62366 ?auto_62370 ) ) ( not ( = ?auto_62363 ?auto_62370 ) ) ( AVAILABLE ?auto_62370 ) ( SURFACE-AT ?auto_62382 ?auto_62381 ) ( ON ?auto_62382 ?auto_62377 ) ( CLEAR ?auto_62382 ) ( not ( = ?auto_62358 ?auto_62377 ) ) ( not ( = ?auto_62359 ?auto_62377 ) ) ( not ( = ?auto_62371 ?auto_62377 ) ) ( not ( = ?auto_62383 ?auto_62377 ) ) ( not ( = ?auto_62374 ?auto_62377 ) ) ( not ( = ?auto_62382 ?auto_62377 ) ) ( not ( = ?auto_62372 ?auto_62377 ) ) ( not ( = ?auto_62368 ?auto_62377 ) ) ( IS-CRATE ?auto_62368 ) ( not ( = ?auto_62358 ?auto_62367 ) ) ( not ( = ?auto_62359 ?auto_62367 ) ) ( not ( = ?auto_62371 ?auto_62367 ) ) ( not ( = ?auto_62383 ?auto_62367 ) ) ( not ( = ?auto_62374 ?auto_62367 ) ) ( not ( = ?auto_62382 ?auto_62367 ) ) ( not ( = ?auto_62372 ?auto_62367 ) ) ( not ( = ?auto_62368 ?auto_62367 ) ) ( not ( = ?auto_62377 ?auto_62367 ) ) ( not ( = ?auto_62378 ?auto_62360 ) ) ( not ( = ?auto_62379 ?auto_62378 ) ) ( not ( = ?auto_62373 ?auto_62378 ) ) ( not ( = ?auto_62365 ?auto_62378 ) ) ( not ( = ?auto_62381 ?auto_62378 ) ) ( HOIST-AT ?auto_62369 ?auto_62378 ) ( not ( = ?auto_62362 ?auto_62369 ) ) ( not ( = ?auto_62380 ?auto_62369 ) ) ( not ( = ?auto_62366 ?auto_62369 ) ) ( not ( = ?auto_62363 ?auto_62369 ) ) ( not ( = ?auto_62370 ?auto_62369 ) ) ( AVAILABLE ?auto_62369 ) ( SURFACE-AT ?auto_62368 ?auto_62378 ) ( ON ?auto_62368 ?auto_62376 ) ( CLEAR ?auto_62368 ) ( not ( = ?auto_62358 ?auto_62376 ) ) ( not ( = ?auto_62359 ?auto_62376 ) ) ( not ( = ?auto_62371 ?auto_62376 ) ) ( not ( = ?auto_62383 ?auto_62376 ) ) ( not ( = ?auto_62374 ?auto_62376 ) ) ( not ( = ?auto_62382 ?auto_62376 ) ) ( not ( = ?auto_62372 ?auto_62376 ) ) ( not ( = ?auto_62368 ?auto_62376 ) ) ( not ( = ?auto_62377 ?auto_62376 ) ) ( not ( = ?auto_62367 ?auto_62376 ) ) ( SURFACE-AT ?auto_62375 ?auto_62360 ) ( CLEAR ?auto_62375 ) ( IS-CRATE ?auto_62367 ) ( not ( = ?auto_62358 ?auto_62375 ) ) ( not ( = ?auto_62359 ?auto_62375 ) ) ( not ( = ?auto_62371 ?auto_62375 ) ) ( not ( = ?auto_62383 ?auto_62375 ) ) ( not ( = ?auto_62374 ?auto_62375 ) ) ( not ( = ?auto_62382 ?auto_62375 ) ) ( not ( = ?auto_62372 ?auto_62375 ) ) ( not ( = ?auto_62368 ?auto_62375 ) ) ( not ( = ?auto_62377 ?auto_62375 ) ) ( not ( = ?auto_62367 ?auto_62375 ) ) ( not ( = ?auto_62376 ?auto_62375 ) ) ( AVAILABLE ?auto_62362 ) ( AVAILABLE ?auto_62380 ) ( SURFACE-AT ?auto_62367 ?auto_62379 ) ( ON ?auto_62367 ?auto_62361 ) ( CLEAR ?auto_62367 ) ( not ( = ?auto_62358 ?auto_62361 ) ) ( not ( = ?auto_62359 ?auto_62361 ) ) ( not ( = ?auto_62371 ?auto_62361 ) ) ( not ( = ?auto_62383 ?auto_62361 ) ) ( not ( = ?auto_62374 ?auto_62361 ) ) ( not ( = ?auto_62382 ?auto_62361 ) ) ( not ( = ?auto_62372 ?auto_62361 ) ) ( not ( = ?auto_62368 ?auto_62361 ) ) ( not ( = ?auto_62377 ?auto_62361 ) ) ( not ( = ?auto_62367 ?auto_62361 ) ) ( not ( = ?auto_62376 ?auto_62361 ) ) ( not ( = ?auto_62375 ?auto_62361 ) ) ( TRUCK-AT ?auto_62364 ?auto_62360 ) )
    :subtasks
    ( ( !DRIVE ?auto_62364 ?auto_62360 ?auto_62379 )
      ( MAKE-ON ?auto_62358 ?auto_62359 )
      ( MAKE-ON-VERIFY ?auto_62358 ?auto_62359 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62384 - SURFACE
      ?auto_62385 - SURFACE
    )
    :vars
    (
      ?auto_62407 - HOIST
      ?auto_62392 - PLACE
      ?auto_62403 - PLACE
      ?auto_62402 - HOIST
      ?auto_62409 - SURFACE
      ?auto_62399 - SURFACE
      ?auto_62408 - PLACE
      ?auto_62394 - HOIST
      ?auto_62406 - SURFACE
      ?auto_62401 - SURFACE
      ?auto_62386 - PLACE
      ?auto_62388 - HOIST
      ?auto_62393 - SURFACE
      ?auto_62395 - SURFACE
      ?auto_62400 - PLACE
      ?auto_62387 - HOIST
      ?auto_62397 - SURFACE
      ?auto_62390 - SURFACE
      ?auto_62396 - PLACE
      ?auto_62391 - HOIST
      ?auto_62398 - SURFACE
      ?auto_62404 - SURFACE
      ?auto_62405 - SURFACE
      ?auto_62389 - TRUCK
      ?auto_62410 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62407 ?auto_62392 ) ( IS-CRATE ?auto_62384 ) ( not ( = ?auto_62384 ?auto_62385 ) ) ( not ( = ?auto_62403 ?auto_62392 ) ) ( HOIST-AT ?auto_62402 ?auto_62403 ) ( not ( = ?auto_62407 ?auto_62402 ) ) ( SURFACE-AT ?auto_62384 ?auto_62403 ) ( ON ?auto_62384 ?auto_62409 ) ( CLEAR ?auto_62384 ) ( not ( = ?auto_62384 ?auto_62409 ) ) ( not ( = ?auto_62385 ?auto_62409 ) ) ( IS-CRATE ?auto_62385 ) ( not ( = ?auto_62384 ?auto_62399 ) ) ( not ( = ?auto_62385 ?auto_62399 ) ) ( not ( = ?auto_62409 ?auto_62399 ) ) ( not ( = ?auto_62408 ?auto_62392 ) ) ( not ( = ?auto_62403 ?auto_62408 ) ) ( HOIST-AT ?auto_62394 ?auto_62408 ) ( not ( = ?auto_62407 ?auto_62394 ) ) ( not ( = ?auto_62402 ?auto_62394 ) ) ( AVAILABLE ?auto_62394 ) ( SURFACE-AT ?auto_62385 ?auto_62408 ) ( ON ?auto_62385 ?auto_62406 ) ( CLEAR ?auto_62385 ) ( not ( = ?auto_62384 ?auto_62406 ) ) ( not ( = ?auto_62385 ?auto_62406 ) ) ( not ( = ?auto_62409 ?auto_62406 ) ) ( not ( = ?auto_62399 ?auto_62406 ) ) ( IS-CRATE ?auto_62399 ) ( not ( = ?auto_62384 ?auto_62401 ) ) ( not ( = ?auto_62385 ?auto_62401 ) ) ( not ( = ?auto_62409 ?auto_62401 ) ) ( not ( = ?auto_62399 ?auto_62401 ) ) ( not ( = ?auto_62406 ?auto_62401 ) ) ( not ( = ?auto_62386 ?auto_62392 ) ) ( not ( = ?auto_62403 ?auto_62386 ) ) ( not ( = ?auto_62408 ?auto_62386 ) ) ( HOIST-AT ?auto_62388 ?auto_62386 ) ( not ( = ?auto_62407 ?auto_62388 ) ) ( not ( = ?auto_62402 ?auto_62388 ) ) ( not ( = ?auto_62394 ?auto_62388 ) ) ( AVAILABLE ?auto_62388 ) ( SURFACE-AT ?auto_62399 ?auto_62386 ) ( ON ?auto_62399 ?auto_62393 ) ( CLEAR ?auto_62399 ) ( not ( = ?auto_62384 ?auto_62393 ) ) ( not ( = ?auto_62385 ?auto_62393 ) ) ( not ( = ?auto_62409 ?auto_62393 ) ) ( not ( = ?auto_62399 ?auto_62393 ) ) ( not ( = ?auto_62406 ?auto_62393 ) ) ( not ( = ?auto_62401 ?auto_62393 ) ) ( IS-CRATE ?auto_62401 ) ( not ( = ?auto_62384 ?auto_62395 ) ) ( not ( = ?auto_62385 ?auto_62395 ) ) ( not ( = ?auto_62409 ?auto_62395 ) ) ( not ( = ?auto_62399 ?auto_62395 ) ) ( not ( = ?auto_62406 ?auto_62395 ) ) ( not ( = ?auto_62401 ?auto_62395 ) ) ( not ( = ?auto_62393 ?auto_62395 ) ) ( not ( = ?auto_62400 ?auto_62392 ) ) ( not ( = ?auto_62403 ?auto_62400 ) ) ( not ( = ?auto_62408 ?auto_62400 ) ) ( not ( = ?auto_62386 ?auto_62400 ) ) ( HOIST-AT ?auto_62387 ?auto_62400 ) ( not ( = ?auto_62407 ?auto_62387 ) ) ( not ( = ?auto_62402 ?auto_62387 ) ) ( not ( = ?auto_62394 ?auto_62387 ) ) ( not ( = ?auto_62388 ?auto_62387 ) ) ( AVAILABLE ?auto_62387 ) ( SURFACE-AT ?auto_62401 ?auto_62400 ) ( ON ?auto_62401 ?auto_62397 ) ( CLEAR ?auto_62401 ) ( not ( = ?auto_62384 ?auto_62397 ) ) ( not ( = ?auto_62385 ?auto_62397 ) ) ( not ( = ?auto_62409 ?auto_62397 ) ) ( not ( = ?auto_62399 ?auto_62397 ) ) ( not ( = ?auto_62406 ?auto_62397 ) ) ( not ( = ?auto_62401 ?auto_62397 ) ) ( not ( = ?auto_62393 ?auto_62397 ) ) ( not ( = ?auto_62395 ?auto_62397 ) ) ( IS-CRATE ?auto_62395 ) ( not ( = ?auto_62384 ?auto_62390 ) ) ( not ( = ?auto_62385 ?auto_62390 ) ) ( not ( = ?auto_62409 ?auto_62390 ) ) ( not ( = ?auto_62399 ?auto_62390 ) ) ( not ( = ?auto_62406 ?auto_62390 ) ) ( not ( = ?auto_62401 ?auto_62390 ) ) ( not ( = ?auto_62393 ?auto_62390 ) ) ( not ( = ?auto_62395 ?auto_62390 ) ) ( not ( = ?auto_62397 ?auto_62390 ) ) ( not ( = ?auto_62396 ?auto_62392 ) ) ( not ( = ?auto_62403 ?auto_62396 ) ) ( not ( = ?auto_62408 ?auto_62396 ) ) ( not ( = ?auto_62386 ?auto_62396 ) ) ( not ( = ?auto_62400 ?auto_62396 ) ) ( HOIST-AT ?auto_62391 ?auto_62396 ) ( not ( = ?auto_62407 ?auto_62391 ) ) ( not ( = ?auto_62402 ?auto_62391 ) ) ( not ( = ?auto_62394 ?auto_62391 ) ) ( not ( = ?auto_62388 ?auto_62391 ) ) ( not ( = ?auto_62387 ?auto_62391 ) ) ( AVAILABLE ?auto_62391 ) ( SURFACE-AT ?auto_62395 ?auto_62396 ) ( ON ?auto_62395 ?auto_62398 ) ( CLEAR ?auto_62395 ) ( not ( = ?auto_62384 ?auto_62398 ) ) ( not ( = ?auto_62385 ?auto_62398 ) ) ( not ( = ?auto_62409 ?auto_62398 ) ) ( not ( = ?auto_62399 ?auto_62398 ) ) ( not ( = ?auto_62406 ?auto_62398 ) ) ( not ( = ?auto_62401 ?auto_62398 ) ) ( not ( = ?auto_62393 ?auto_62398 ) ) ( not ( = ?auto_62395 ?auto_62398 ) ) ( not ( = ?auto_62397 ?auto_62398 ) ) ( not ( = ?auto_62390 ?auto_62398 ) ) ( IS-CRATE ?auto_62390 ) ( not ( = ?auto_62384 ?auto_62404 ) ) ( not ( = ?auto_62385 ?auto_62404 ) ) ( not ( = ?auto_62409 ?auto_62404 ) ) ( not ( = ?auto_62399 ?auto_62404 ) ) ( not ( = ?auto_62406 ?auto_62404 ) ) ( not ( = ?auto_62401 ?auto_62404 ) ) ( not ( = ?auto_62393 ?auto_62404 ) ) ( not ( = ?auto_62395 ?auto_62404 ) ) ( not ( = ?auto_62397 ?auto_62404 ) ) ( not ( = ?auto_62390 ?auto_62404 ) ) ( not ( = ?auto_62398 ?auto_62404 ) ) ( AVAILABLE ?auto_62402 ) ( SURFACE-AT ?auto_62390 ?auto_62403 ) ( ON ?auto_62390 ?auto_62405 ) ( CLEAR ?auto_62390 ) ( not ( = ?auto_62384 ?auto_62405 ) ) ( not ( = ?auto_62385 ?auto_62405 ) ) ( not ( = ?auto_62409 ?auto_62405 ) ) ( not ( = ?auto_62399 ?auto_62405 ) ) ( not ( = ?auto_62406 ?auto_62405 ) ) ( not ( = ?auto_62401 ?auto_62405 ) ) ( not ( = ?auto_62393 ?auto_62405 ) ) ( not ( = ?auto_62395 ?auto_62405 ) ) ( not ( = ?auto_62397 ?auto_62405 ) ) ( not ( = ?auto_62390 ?auto_62405 ) ) ( not ( = ?auto_62398 ?auto_62405 ) ) ( not ( = ?auto_62404 ?auto_62405 ) ) ( TRUCK-AT ?auto_62389 ?auto_62392 ) ( SURFACE-AT ?auto_62410 ?auto_62392 ) ( CLEAR ?auto_62410 ) ( LIFTING ?auto_62407 ?auto_62404 ) ( IS-CRATE ?auto_62404 ) ( not ( = ?auto_62384 ?auto_62410 ) ) ( not ( = ?auto_62385 ?auto_62410 ) ) ( not ( = ?auto_62409 ?auto_62410 ) ) ( not ( = ?auto_62399 ?auto_62410 ) ) ( not ( = ?auto_62406 ?auto_62410 ) ) ( not ( = ?auto_62401 ?auto_62410 ) ) ( not ( = ?auto_62393 ?auto_62410 ) ) ( not ( = ?auto_62395 ?auto_62410 ) ) ( not ( = ?auto_62397 ?auto_62410 ) ) ( not ( = ?auto_62390 ?auto_62410 ) ) ( not ( = ?auto_62398 ?auto_62410 ) ) ( not ( = ?auto_62404 ?auto_62410 ) ) ( not ( = ?auto_62405 ?auto_62410 ) ) )
    :subtasks
    ( ( !DROP ?auto_62407 ?auto_62404 ?auto_62410 ?auto_62392 )
      ( MAKE-ON ?auto_62384 ?auto_62385 )
      ( MAKE-ON-VERIFY ?auto_62384 ?auto_62385 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62411 - SURFACE
      ?auto_62412 - SURFACE
    )
    :vars
    (
      ?auto_62422 - HOIST
      ?auto_62432 - PLACE
      ?auto_62425 - PLACE
      ?auto_62424 - HOIST
      ?auto_62416 - SURFACE
      ?auto_62435 - SURFACE
      ?auto_62430 - PLACE
      ?auto_62413 - HOIST
      ?auto_62421 - SURFACE
      ?auto_62431 - SURFACE
      ?auto_62417 - PLACE
      ?auto_62427 - HOIST
      ?auto_62436 - SURFACE
      ?auto_62426 - SURFACE
      ?auto_62420 - PLACE
      ?auto_62419 - HOIST
      ?auto_62434 - SURFACE
      ?auto_62418 - SURFACE
      ?auto_62429 - PLACE
      ?auto_62428 - HOIST
      ?auto_62433 - SURFACE
      ?auto_62415 - SURFACE
      ?auto_62414 - SURFACE
      ?auto_62423 - TRUCK
      ?auto_62437 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62422 ?auto_62432 ) ( IS-CRATE ?auto_62411 ) ( not ( = ?auto_62411 ?auto_62412 ) ) ( not ( = ?auto_62425 ?auto_62432 ) ) ( HOIST-AT ?auto_62424 ?auto_62425 ) ( not ( = ?auto_62422 ?auto_62424 ) ) ( SURFACE-AT ?auto_62411 ?auto_62425 ) ( ON ?auto_62411 ?auto_62416 ) ( CLEAR ?auto_62411 ) ( not ( = ?auto_62411 ?auto_62416 ) ) ( not ( = ?auto_62412 ?auto_62416 ) ) ( IS-CRATE ?auto_62412 ) ( not ( = ?auto_62411 ?auto_62435 ) ) ( not ( = ?auto_62412 ?auto_62435 ) ) ( not ( = ?auto_62416 ?auto_62435 ) ) ( not ( = ?auto_62430 ?auto_62432 ) ) ( not ( = ?auto_62425 ?auto_62430 ) ) ( HOIST-AT ?auto_62413 ?auto_62430 ) ( not ( = ?auto_62422 ?auto_62413 ) ) ( not ( = ?auto_62424 ?auto_62413 ) ) ( AVAILABLE ?auto_62413 ) ( SURFACE-AT ?auto_62412 ?auto_62430 ) ( ON ?auto_62412 ?auto_62421 ) ( CLEAR ?auto_62412 ) ( not ( = ?auto_62411 ?auto_62421 ) ) ( not ( = ?auto_62412 ?auto_62421 ) ) ( not ( = ?auto_62416 ?auto_62421 ) ) ( not ( = ?auto_62435 ?auto_62421 ) ) ( IS-CRATE ?auto_62435 ) ( not ( = ?auto_62411 ?auto_62431 ) ) ( not ( = ?auto_62412 ?auto_62431 ) ) ( not ( = ?auto_62416 ?auto_62431 ) ) ( not ( = ?auto_62435 ?auto_62431 ) ) ( not ( = ?auto_62421 ?auto_62431 ) ) ( not ( = ?auto_62417 ?auto_62432 ) ) ( not ( = ?auto_62425 ?auto_62417 ) ) ( not ( = ?auto_62430 ?auto_62417 ) ) ( HOIST-AT ?auto_62427 ?auto_62417 ) ( not ( = ?auto_62422 ?auto_62427 ) ) ( not ( = ?auto_62424 ?auto_62427 ) ) ( not ( = ?auto_62413 ?auto_62427 ) ) ( AVAILABLE ?auto_62427 ) ( SURFACE-AT ?auto_62435 ?auto_62417 ) ( ON ?auto_62435 ?auto_62436 ) ( CLEAR ?auto_62435 ) ( not ( = ?auto_62411 ?auto_62436 ) ) ( not ( = ?auto_62412 ?auto_62436 ) ) ( not ( = ?auto_62416 ?auto_62436 ) ) ( not ( = ?auto_62435 ?auto_62436 ) ) ( not ( = ?auto_62421 ?auto_62436 ) ) ( not ( = ?auto_62431 ?auto_62436 ) ) ( IS-CRATE ?auto_62431 ) ( not ( = ?auto_62411 ?auto_62426 ) ) ( not ( = ?auto_62412 ?auto_62426 ) ) ( not ( = ?auto_62416 ?auto_62426 ) ) ( not ( = ?auto_62435 ?auto_62426 ) ) ( not ( = ?auto_62421 ?auto_62426 ) ) ( not ( = ?auto_62431 ?auto_62426 ) ) ( not ( = ?auto_62436 ?auto_62426 ) ) ( not ( = ?auto_62420 ?auto_62432 ) ) ( not ( = ?auto_62425 ?auto_62420 ) ) ( not ( = ?auto_62430 ?auto_62420 ) ) ( not ( = ?auto_62417 ?auto_62420 ) ) ( HOIST-AT ?auto_62419 ?auto_62420 ) ( not ( = ?auto_62422 ?auto_62419 ) ) ( not ( = ?auto_62424 ?auto_62419 ) ) ( not ( = ?auto_62413 ?auto_62419 ) ) ( not ( = ?auto_62427 ?auto_62419 ) ) ( AVAILABLE ?auto_62419 ) ( SURFACE-AT ?auto_62431 ?auto_62420 ) ( ON ?auto_62431 ?auto_62434 ) ( CLEAR ?auto_62431 ) ( not ( = ?auto_62411 ?auto_62434 ) ) ( not ( = ?auto_62412 ?auto_62434 ) ) ( not ( = ?auto_62416 ?auto_62434 ) ) ( not ( = ?auto_62435 ?auto_62434 ) ) ( not ( = ?auto_62421 ?auto_62434 ) ) ( not ( = ?auto_62431 ?auto_62434 ) ) ( not ( = ?auto_62436 ?auto_62434 ) ) ( not ( = ?auto_62426 ?auto_62434 ) ) ( IS-CRATE ?auto_62426 ) ( not ( = ?auto_62411 ?auto_62418 ) ) ( not ( = ?auto_62412 ?auto_62418 ) ) ( not ( = ?auto_62416 ?auto_62418 ) ) ( not ( = ?auto_62435 ?auto_62418 ) ) ( not ( = ?auto_62421 ?auto_62418 ) ) ( not ( = ?auto_62431 ?auto_62418 ) ) ( not ( = ?auto_62436 ?auto_62418 ) ) ( not ( = ?auto_62426 ?auto_62418 ) ) ( not ( = ?auto_62434 ?auto_62418 ) ) ( not ( = ?auto_62429 ?auto_62432 ) ) ( not ( = ?auto_62425 ?auto_62429 ) ) ( not ( = ?auto_62430 ?auto_62429 ) ) ( not ( = ?auto_62417 ?auto_62429 ) ) ( not ( = ?auto_62420 ?auto_62429 ) ) ( HOIST-AT ?auto_62428 ?auto_62429 ) ( not ( = ?auto_62422 ?auto_62428 ) ) ( not ( = ?auto_62424 ?auto_62428 ) ) ( not ( = ?auto_62413 ?auto_62428 ) ) ( not ( = ?auto_62427 ?auto_62428 ) ) ( not ( = ?auto_62419 ?auto_62428 ) ) ( AVAILABLE ?auto_62428 ) ( SURFACE-AT ?auto_62426 ?auto_62429 ) ( ON ?auto_62426 ?auto_62433 ) ( CLEAR ?auto_62426 ) ( not ( = ?auto_62411 ?auto_62433 ) ) ( not ( = ?auto_62412 ?auto_62433 ) ) ( not ( = ?auto_62416 ?auto_62433 ) ) ( not ( = ?auto_62435 ?auto_62433 ) ) ( not ( = ?auto_62421 ?auto_62433 ) ) ( not ( = ?auto_62431 ?auto_62433 ) ) ( not ( = ?auto_62436 ?auto_62433 ) ) ( not ( = ?auto_62426 ?auto_62433 ) ) ( not ( = ?auto_62434 ?auto_62433 ) ) ( not ( = ?auto_62418 ?auto_62433 ) ) ( IS-CRATE ?auto_62418 ) ( not ( = ?auto_62411 ?auto_62415 ) ) ( not ( = ?auto_62412 ?auto_62415 ) ) ( not ( = ?auto_62416 ?auto_62415 ) ) ( not ( = ?auto_62435 ?auto_62415 ) ) ( not ( = ?auto_62421 ?auto_62415 ) ) ( not ( = ?auto_62431 ?auto_62415 ) ) ( not ( = ?auto_62436 ?auto_62415 ) ) ( not ( = ?auto_62426 ?auto_62415 ) ) ( not ( = ?auto_62434 ?auto_62415 ) ) ( not ( = ?auto_62418 ?auto_62415 ) ) ( not ( = ?auto_62433 ?auto_62415 ) ) ( AVAILABLE ?auto_62424 ) ( SURFACE-AT ?auto_62418 ?auto_62425 ) ( ON ?auto_62418 ?auto_62414 ) ( CLEAR ?auto_62418 ) ( not ( = ?auto_62411 ?auto_62414 ) ) ( not ( = ?auto_62412 ?auto_62414 ) ) ( not ( = ?auto_62416 ?auto_62414 ) ) ( not ( = ?auto_62435 ?auto_62414 ) ) ( not ( = ?auto_62421 ?auto_62414 ) ) ( not ( = ?auto_62431 ?auto_62414 ) ) ( not ( = ?auto_62436 ?auto_62414 ) ) ( not ( = ?auto_62426 ?auto_62414 ) ) ( not ( = ?auto_62434 ?auto_62414 ) ) ( not ( = ?auto_62418 ?auto_62414 ) ) ( not ( = ?auto_62433 ?auto_62414 ) ) ( not ( = ?auto_62415 ?auto_62414 ) ) ( TRUCK-AT ?auto_62423 ?auto_62432 ) ( SURFACE-AT ?auto_62437 ?auto_62432 ) ( CLEAR ?auto_62437 ) ( IS-CRATE ?auto_62415 ) ( not ( = ?auto_62411 ?auto_62437 ) ) ( not ( = ?auto_62412 ?auto_62437 ) ) ( not ( = ?auto_62416 ?auto_62437 ) ) ( not ( = ?auto_62435 ?auto_62437 ) ) ( not ( = ?auto_62421 ?auto_62437 ) ) ( not ( = ?auto_62431 ?auto_62437 ) ) ( not ( = ?auto_62436 ?auto_62437 ) ) ( not ( = ?auto_62426 ?auto_62437 ) ) ( not ( = ?auto_62434 ?auto_62437 ) ) ( not ( = ?auto_62418 ?auto_62437 ) ) ( not ( = ?auto_62433 ?auto_62437 ) ) ( not ( = ?auto_62415 ?auto_62437 ) ) ( not ( = ?auto_62414 ?auto_62437 ) ) ( AVAILABLE ?auto_62422 ) ( IN ?auto_62415 ?auto_62423 ) )
    :subtasks
    ( ( !UNLOAD ?auto_62422 ?auto_62415 ?auto_62423 ?auto_62432 )
      ( MAKE-ON ?auto_62411 ?auto_62412 )
      ( MAKE-ON-VERIFY ?auto_62411 ?auto_62412 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62438 - SURFACE
      ?auto_62439 - SURFACE
    )
    :vars
    (
      ?auto_62447 - HOIST
      ?auto_62453 - PLACE
      ?auto_62462 - PLACE
      ?auto_62441 - HOIST
      ?auto_62443 - SURFACE
      ?auto_62456 - SURFACE
      ?auto_62451 - PLACE
      ?auto_62460 - HOIST
      ?auto_62440 - SURFACE
      ?auto_62452 - SURFACE
      ?auto_62458 - PLACE
      ?auto_62461 - HOIST
      ?auto_62449 - SURFACE
      ?auto_62464 - SURFACE
      ?auto_62463 - PLACE
      ?auto_62459 - HOIST
      ?auto_62455 - SURFACE
      ?auto_62446 - SURFACE
      ?auto_62450 - PLACE
      ?auto_62457 - HOIST
      ?auto_62454 - SURFACE
      ?auto_62444 - SURFACE
      ?auto_62445 - SURFACE
      ?auto_62448 - SURFACE
      ?auto_62442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_62447 ?auto_62453 ) ( IS-CRATE ?auto_62438 ) ( not ( = ?auto_62438 ?auto_62439 ) ) ( not ( = ?auto_62462 ?auto_62453 ) ) ( HOIST-AT ?auto_62441 ?auto_62462 ) ( not ( = ?auto_62447 ?auto_62441 ) ) ( SURFACE-AT ?auto_62438 ?auto_62462 ) ( ON ?auto_62438 ?auto_62443 ) ( CLEAR ?auto_62438 ) ( not ( = ?auto_62438 ?auto_62443 ) ) ( not ( = ?auto_62439 ?auto_62443 ) ) ( IS-CRATE ?auto_62439 ) ( not ( = ?auto_62438 ?auto_62456 ) ) ( not ( = ?auto_62439 ?auto_62456 ) ) ( not ( = ?auto_62443 ?auto_62456 ) ) ( not ( = ?auto_62451 ?auto_62453 ) ) ( not ( = ?auto_62462 ?auto_62451 ) ) ( HOIST-AT ?auto_62460 ?auto_62451 ) ( not ( = ?auto_62447 ?auto_62460 ) ) ( not ( = ?auto_62441 ?auto_62460 ) ) ( AVAILABLE ?auto_62460 ) ( SURFACE-AT ?auto_62439 ?auto_62451 ) ( ON ?auto_62439 ?auto_62440 ) ( CLEAR ?auto_62439 ) ( not ( = ?auto_62438 ?auto_62440 ) ) ( not ( = ?auto_62439 ?auto_62440 ) ) ( not ( = ?auto_62443 ?auto_62440 ) ) ( not ( = ?auto_62456 ?auto_62440 ) ) ( IS-CRATE ?auto_62456 ) ( not ( = ?auto_62438 ?auto_62452 ) ) ( not ( = ?auto_62439 ?auto_62452 ) ) ( not ( = ?auto_62443 ?auto_62452 ) ) ( not ( = ?auto_62456 ?auto_62452 ) ) ( not ( = ?auto_62440 ?auto_62452 ) ) ( not ( = ?auto_62458 ?auto_62453 ) ) ( not ( = ?auto_62462 ?auto_62458 ) ) ( not ( = ?auto_62451 ?auto_62458 ) ) ( HOIST-AT ?auto_62461 ?auto_62458 ) ( not ( = ?auto_62447 ?auto_62461 ) ) ( not ( = ?auto_62441 ?auto_62461 ) ) ( not ( = ?auto_62460 ?auto_62461 ) ) ( AVAILABLE ?auto_62461 ) ( SURFACE-AT ?auto_62456 ?auto_62458 ) ( ON ?auto_62456 ?auto_62449 ) ( CLEAR ?auto_62456 ) ( not ( = ?auto_62438 ?auto_62449 ) ) ( not ( = ?auto_62439 ?auto_62449 ) ) ( not ( = ?auto_62443 ?auto_62449 ) ) ( not ( = ?auto_62456 ?auto_62449 ) ) ( not ( = ?auto_62440 ?auto_62449 ) ) ( not ( = ?auto_62452 ?auto_62449 ) ) ( IS-CRATE ?auto_62452 ) ( not ( = ?auto_62438 ?auto_62464 ) ) ( not ( = ?auto_62439 ?auto_62464 ) ) ( not ( = ?auto_62443 ?auto_62464 ) ) ( not ( = ?auto_62456 ?auto_62464 ) ) ( not ( = ?auto_62440 ?auto_62464 ) ) ( not ( = ?auto_62452 ?auto_62464 ) ) ( not ( = ?auto_62449 ?auto_62464 ) ) ( not ( = ?auto_62463 ?auto_62453 ) ) ( not ( = ?auto_62462 ?auto_62463 ) ) ( not ( = ?auto_62451 ?auto_62463 ) ) ( not ( = ?auto_62458 ?auto_62463 ) ) ( HOIST-AT ?auto_62459 ?auto_62463 ) ( not ( = ?auto_62447 ?auto_62459 ) ) ( not ( = ?auto_62441 ?auto_62459 ) ) ( not ( = ?auto_62460 ?auto_62459 ) ) ( not ( = ?auto_62461 ?auto_62459 ) ) ( AVAILABLE ?auto_62459 ) ( SURFACE-AT ?auto_62452 ?auto_62463 ) ( ON ?auto_62452 ?auto_62455 ) ( CLEAR ?auto_62452 ) ( not ( = ?auto_62438 ?auto_62455 ) ) ( not ( = ?auto_62439 ?auto_62455 ) ) ( not ( = ?auto_62443 ?auto_62455 ) ) ( not ( = ?auto_62456 ?auto_62455 ) ) ( not ( = ?auto_62440 ?auto_62455 ) ) ( not ( = ?auto_62452 ?auto_62455 ) ) ( not ( = ?auto_62449 ?auto_62455 ) ) ( not ( = ?auto_62464 ?auto_62455 ) ) ( IS-CRATE ?auto_62464 ) ( not ( = ?auto_62438 ?auto_62446 ) ) ( not ( = ?auto_62439 ?auto_62446 ) ) ( not ( = ?auto_62443 ?auto_62446 ) ) ( not ( = ?auto_62456 ?auto_62446 ) ) ( not ( = ?auto_62440 ?auto_62446 ) ) ( not ( = ?auto_62452 ?auto_62446 ) ) ( not ( = ?auto_62449 ?auto_62446 ) ) ( not ( = ?auto_62464 ?auto_62446 ) ) ( not ( = ?auto_62455 ?auto_62446 ) ) ( not ( = ?auto_62450 ?auto_62453 ) ) ( not ( = ?auto_62462 ?auto_62450 ) ) ( not ( = ?auto_62451 ?auto_62450 ) ) ( not ( = ?auto_62458 ?auto_62450 ) ) ( not ( = ?auto_62463 ?auto_62450 ) ) ( HOIST-AT ?auto_62457 ?auto_62450 ) ( not ( = ?auto_62447 ?auto_62457 ) ) ( not ( = ?auto_62441 ?auto_62457 ) ) ( not ( = ?auto_62460 ?auto_62457 ) ) ( not ( = ?auto_62461 ?auto_62457 ) ) ( not ( = ?auto_62459 ?auto_62457 ) ) ( AVAILABLE ?auto_62457 ) ( SURFACE-AT ?auto_62464 ?auto_62450 ) ( ON ?auto_62464 ?auto_62454 ) ( CLEAR ?auto_62464 ) ( not ( = ?auto_62438 ?auto_62454 ) ) ( not ( = ?auto_62439 ?auto_62454 ) ) ( not ( = ?auto_62443 ?auto_62454 ) ) ( not ( = ?auto_62456 ?auto_62454 ) ) ( not ( = ?auto_62440 ?auto_62454 ) ) ( not ( = ?auto_62452 ?auto_62454 ) ) ( not ( = ?auto_62449 ?auto_62454 ) ) ( not ( = ?auto_62464 ?auto_62454 ) ) ( not ( = ?auto_62455 ?auto_62454 ) ) ( not ( = ?auto_62446 ?auto_62454 ) ) ( IS-CRATE ?auto_62446 ) ( not ( = ?auto_62438 ?auto_62444 ) ) ( not ( = ?auto_62439 ?auto_62444 ) ) ( not ( = ?auto_62443 ?auto_62444 ) ) ( not ( = ?auto_62456 ?auto_62444 ) ) ( not ( = ?auto_62440 ?auto_62444 ) ) ( not ( = ?auto_62452 ?auto_62444 ) ) ( not ( = ?auto_62449 ?auto_62444 ) ) ( not ( = ?auto_62464 ?auto_62444 ) ) ( not ( = ?auto_62455 ?auto_62444 ) ) ( not ( = ?auto_62446 ?auto_62444 ) ) ( not ( = ?auto_62454 ?auto_62444 ) ) ( AVAILABLE ?auto_62441 ) ( SURFACE-AT ?auto_62446 ?auto_62462 ) ( ON ?auto_62446 ?auto_62445 ) ( CLEAR ?auto_62446 ) ( not ( = ?auto_62438 ?auto_62445 ) ) ( not ( = ?auto_62439 ?auto_62445 ) ) ( not ( = ?auto_62443 ?auto_62445 ) ) ( not ( = ?auto_62456 ?auto_62445 ) ) ( not ( = ?auto_62440 ?auto_62445 ) ) ( not ( = ?auto_62452 ?auto_62445 ) ) ( not ( = ?auto_62449 ?auto_62445 ) ) ( not ( = ?auto_62464 ?auto_62445 ) ) ( not ( = ?auto_62455 ?auto_62445 ) ) ( not ( = ?auto_62446 ?auto_62445 ) ) ( not ( = ?auto_62454 ?auto_62445 ) ) ( not ( = ?auto_62444 ?auto_62445 ) ) ( SURFACE-AT ?auto_62448 ?auto_62453 ) ( CLEAR ?auto_62448 ) ( IS-CRATE ?auto_62444 ) ( not ( = ?auto_62438 ?auto_62448 ) ) ( not ( = ?auto_62439 ?auto_62448 ) ) ( not ( = ?auto_62443 ?auto_62448 ) ) ( not ( = ?auto_62456 ?auto_62448 ) ) ( not ( = ?auto_62440 ?auto_62448 ) ) ( not ( = ?auto_62452 ?auto_62448 ) ) ( not ( = ?auto_62449 ?auto_62448 ) ) ( not ( = ?auto_62464 ?auto_62448 ) ) ( not ( = ?auto_62455 ?auto_62448 ) ) ( not ( = ?auto_62446 ?auto_62448 ) ) ( not ( = ?auto_62454 ?auto_62448 ) ) ( not ( = ?auto_62444 ?auto_62448 ) ) ( not ( = ?auto_62445 ?auto_62448 ) ) ( AVAILABLE ?auto_62447 ) ( IN ?auto_62444 ?auto_62442 ) ( TRUCK-AT ?auto_62442 ?auto_62458 ) )
    :subtasks
    ( ( !DRIVE ?auto_62442 ?auto_62458 ?auto_62453 )
      ( MAKE-ON ?auto_62438 ?auto_62439 )
      ( MAKE-ON-VERIFY ?auto_62438 ?auto_62439 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62465 - SURFACE
      ?auto_62466 - SURFACE
    )
    :vars
    (
      ?auto_62482 - HOIST
      ?auto_62467 - PLACE
      ?auto_62479 - PLACE
      ?auto_62481 - HOIST
      ?auto_62471 - SURFACE
      ?auto_62491 - SURFACE
      ?auto_62484 - PLACE
      ?auto_62477 - HOIST
      ?auto_62472 - SURFACE
      ?auto_62469 - SURFACE
      ?auto_62475 - PLACE
      ?auto_62476 - HOIST
      ?auto_62468 - SURFACE
      ?auto_62489 - SURFACE
      ?auto_62490 - PLACE
      ?auto_62478 - HOIST
      ?auto_62480 - SURFACE
      ?auto_62470 - SURFACE
      ?auto_62487 - PLACE
      ?auto_62474 - HOIST
      ?auto_62485 - SURFACE
      ?auto_62488 - SURFACE
      ?auto_62486 - SURFACE
      ?auto_62483 - SURFACE
      ?auto_62473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_62482 ?auto_62467 ) ( IS-CRATE ?auto_62465 ) ( not ( = ?auto_62465 ?auto_62466 ) ) ( not ( = ?auto_62479 ?auto_62467 ) ) ( HOIST-AT ?auto_62481 ?auto_62479 ) ( not ( = ?auto_62482 ?auto_62481 ) ) ( SURFACE-AT ?auto_62465 ?auto_62479 ) ( ON ?auto_62465 ?auto_62471 ) ( CLEAR ?auto_62465 ) ( not ( = ?auto_62465 ?auto_62471 ) ) ( not ( = ?auto_62466 ?auto_62471 ) ) ( IS-CRATE ?auto_62466 ) ( not ( = ?auto_62465 ?auto_62491 ) ) ( not ( = ?auto_62466 ?auto_62491 ) ) ( not ( = ?auto_62471 ?auto_62491 ) ) ( not ( = ?auto_62484 ?auto_62467 ) ) ( not ( = ?auto_62479 ?auto_62484 ) ) ( HOIST-AT ?auto_62477 ?auto_62484 ) ( not ( = ?auto_62482 ?auto_62477 ) ) ( not ( = ?auto_62481 ?auto_62477 ) ) ( AVAILABLE ?auto_62477 ) ( SURFACE-AT ?auto_62466 ?auto_62484 ) ( ON ?auto_62466 ?auto_62472 ) ( CLEAR ?auto_62466 ) ( not ( = ?auto_62465 ?auto_62472 ) ) ( not ( = ?auto_62466 ?auto_62472 ) ) ( not ( = ?auto_62471 ?auto_62472 ) ) ( not ( = ?auto_62491 ?auto_62472 ) ) ( IS-CRATE ?auto_62491 ) ( not ( = ?auto_62465 ?auto_62469 ) ) ( not ( = ?auto_62466 ?auto_62469 ) ) ( not ( = ?auto_62471 ?auto_62469 ) ) ( not ( = ?auto_62491 ?auto_62469 ) ) ( not ( = ?auto_62472 ?auto_62469 ) ) ( not ( = ?auto_62475 ?auto_62467 ) ) ( not ( = ?auto_62479 ?auto_62475 ) ) ( not ( = ?auto_62484 ?auto_62475 ) ) ( HOIST-AT ?auto_62476 ?auto_62475 ) ( not ( = ?auto_62482 ?auto_62476 ) ) ( not ( = ?auto_62481 ?auto_62476 ) ) ( not ( = ?auto_62477 ?auto_62476 ) ) ( SURFACE-AT ?auto_62491 ?auto_62475 ) ( ON ?auto_62491 ?auto_62468 ) ( CLEAR ?auto_62491 ) ( not ( = ?auto_62465 ?auto_62468 ) ) ( not ( = ?auto_62466 ?auto_62468 ) ) ( not ( = ?auto_62471 ?auto_62468 ) ) ( not ( = ?auto_62491 ?auto_62468 ) ) ( not ( = ?auto_62472 ?auto_62468 ) ) ( not ( = ?auto_62469 ?auto_62468 ) ) ( IS-CRATE ?auto_62469 ) ( not ( = ?auto_62465 ?auto_62489 ) ) ( not ( = ?auto_62466 ?auto_62489 ) ) ( not ( = ?auto_62471 ?auto_62489 ) ) ( not ( = ?auto_62491 ?auto_62489 ) ) ( not ( = ?auto_62472 ?auto_62489 ) ) ( not ( = ?auto_62469 ?auto_62489 ) ) ( not ( = ?auto_62468 ?auto_62489 ) ) ( not ( = ?auto_62490 ?auto_62467 ) ) ( not ( = ?auto_62479 ?auto_62490 ) ) ( not ( = ?auto_62484 ?auto_62490 ) ) ( not ( = ?auto_62475 ?auto_62490 ) ) ( HOIST-AT ?auto_62478 ?auto_62490 ) ( not ( = ?auto_62482 ?auto_62478 ) ) ( not ( = ?auto_62481 ?auto_62478 ) ) ( not ( = ?auto_62477 ?auto_62478 ) ) ( not ( = ?auto_62476 ?auto_62478 ) ) ( AVAILABLE ?auto_62478 ) ( SURFACE-AT ?auto_62469 ?auto_62490 ) ( ON ?auto_62469 ?auto_62480 ) ( CLEAR ?auto_62469 ) ( not ( = ?auto_62465 ?auto_62480 ) ) ( not ( = ?auto_62466 ?auto_62480 ) ) ( not ( = ?auto_62471 ?auto_62480 ) ) ( not ( = ?auto_62491 ?auto_62480 ) ) ( not ( = ?auto_62472 ?auto_62480 ) ) ( not ( = ?auto_62469 ?auto_62480 ) ) ( not ( = ?auto_62468 ?auto_62480 ) ) ( not ( = ?auto_62489 ?auto_62480 ) ) ( IS-CRATE ?auto_62489 ) ( not ( = ?auto_62465 ?auto_62470 ) ) ( not ( = ?auto_62466 ?auto_62470 ) ) ( not ( = ?auto_62471 ?auto_62470 ) ) ( not ( = ?auto_62491 ?auto_62470 ) ) ( not ( = ?auto_62472 ?auto_62470 ) ) ( not ( = ?auto_62469 ?auto_62470 ) ) ( not ( = ?auto_62468 ?auto_62470 ) ) ( not ( = ?auto_62489 ?auto_62470 ) ) ( not ( = ?auto_62480 ?auto_62470 ) ) ( not ( = ?auto_62487 ?auto_62467 ) ) ( not ( = ?auto_62479 ?auto_62487 ) ) ( not ( = ?auto_62484 ?auto_62487 ) ) ( not ( = ?auto_62475 ?auto_62487 ) ) ( not ( = ?auto_62490 ?auto_62487 ) ) ( HOIST-AT ?auto_62474 ?auto_62487 ) ( not ( = ?auto_62482 ?auto_62474 ) ) ( not ( = ?auto_62481 ?auto_62474 ) ) ( not ( = ?auto_62477 ?auto_62474 ) ) ( not ( = ?auto_62476 ?auto_62474 ) ) ( not ( = ?auto_62478 ?auto_62474 ) ) ( AVAILABLE ?auto_62474 ) ( SURFACE-AT ?auto_62489 ?auto_62487 ) ( ON ?auto_62489 ?auto_62485 ) ( CLEAR ?auto_62489 ) ( not ( = ?auto_62465 ?auto_62485 ) ) ( not ( = ?auto_62466 ?auto_62485 ) ) ( not ( = ?auto_62471 ?auto_62485 ) ) ( not ( = ?auto_62491 ?auto_62485 ) ) ( not ( = ?auto_62472 ?auto_62485 ) ) ( not ( = ?auto_62469 ?auto_62485 ) ) ( not ( = ?auto_62468 ?auto_62485 ) ) ( not ( = ?auto_62489 ?auto_62485 ) ) ( not ( = ?auto_62480 ?auto_62485 ) ) ( not ( = ?auto_62470 ?auto_62485 ) ) ( IS-CRATE ?auto_62470 ) ( not ( = ?auto_62465 ?auto_62488 ) ) ( not ( = ?auto_62466 ?auto_62488 ) ) ( not ( = ?auto_62471 ?auto_62488 ) ) ( not ( = ?auto_62491 ?auto_62488 ) ) ( not ( = ?auto_62472 ?auto_62488 ) ) ( not ( = ?auto_62469 ?auto_62488 ) ) ( not ( = ?auto_62468 ?auto_62488 ) ) ( not ( = ?auto_62489 ?auto_62488 ) ) ( not ( = ?auto_62480 ?auto_62488 ) ) ( not ( = ?auto_62470 ?auto_62488 ) ) ( not ( = ?auto_62485 ?auto_62488 ) ) ( AVAILABLE ?auto_62481 ) ( SURFACE-AT ?auto_62470 ?auto_62479 ) ( ON ?auto_62470 ?auto_62486 ) ( CLEAR ?auto_62470 ) ( not ( = ?auto_62465 ?auto_62486 ) ) ( not ( = ?auto_62466 ?auto_62486 ) ) ( not ( = ?auto_62471 ?auto_62486 ) ) ( not ( = ?auto_62491 ?auto_62486 ) ) ( not ( = ?auto_62472 ?auto_62486 ) ) ( not ( = ?auto_62469 ?auto_62486 ) ) ( not ( = ?auto_62468 ?auto_62486 ) ) ( not ( = ?auto_62489 ?auto_62486 ) ) ( not ( = ?auto_62480 ?auto_62486 ) ) ( not ( = ?auto_62470 ?auto_62486 ) ) ( not ( = ?auto_62485 ?auto_62486 ) ) ( not ( = ?auto_62488 ?auto_62486 ) ) ( SURFACE-AT ?auto_62483 ?auto_62467 ) ( CLEAR ?auto_62483 ) ( IS-CRATE ?auto_62488 ) ( not ( = ?auto_62465 ?auto_62483 ) ) ( not ( = ?auto_62466 ?auto_62483 ) ) ( not ( = ?auto_62471 ?auto_62483 ) ) ( not ( = ?auto_62491 ?auto_62483 ) ) ( not ( = ?auto_62472 ?auto_62483 ) ) ( not ( = ?auto_62469 ?auto_62483 ) ) ( not ( = ?auto_62468 ?auto_62483 ) ) ( not ( = ?auto_62489 ?auto_62483 ) ) ( not ( = ?auto_62480 ?auto_62483 ) ) ( not ( = ?auto_62470 ?auto_62483 ) ) ( not ( = ?auto_62485 ?auto_62483 ) ) ( not ( = ?auto_62488 ?auto_62483 ) ) ( not ( = ?auto_62486 ?auto_62483 ) ) ( AVAILABLE ?auto_62482 ) ( TRUCK-AT ?auto_62473 ?auto_62475 ) ( LIFTING ?auto_62476 ?auto_62488 ) )
    :subtasks
    ( ( !LOAD ?auto_62476 ?auto_62488 ?auto_62473 ?auto_62475 )
      ( MAKE-ON ?auto_62465 ?auto_62466 )
      ( MAKE-ON-VERIFY ?auto_62465 ?auto_62466 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62492 - SURFACE
      ?auto_62493 - SURFACE
    )
    :vars
    (
      ?auto_62507 - HOIST
      ?auto_62498 - PLACE
      ?auto_62516 - PLACE
      ?auto_62508 - HOIST
      ?auto_62513 - SURFACE
      ?auto_62496 - SURFACE
      ?auto_62501 - PLACE
      ?auto_62509 - HOIST
      ?auto_62510 - SURFACE
      ?auto_62499 - SURFACE
      ?auto_62494 - PLACE
      ?auto_62517 - HOIST
      ?auto_62511 - SURFACE
      ?auto_62506 - SURFACE
      ?auto_62518 - PLACE
      ?auto_62512 - HOIST
      ?auto_62514 - SURFACE
      ?auto_62515 - SURFACE
      ?auto_62504 - PLACE
      ?auto_62497 - HOIST
      ?auto_62502 - SURFACE
      ?auto_62505 - SURFACE
      ?auto_62503 - SURFACE
      ?auto_62500 - SURFACE
      ?auto_62495 - TRUCK
      ?auto_62519 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62507 ?auto_62498 ) ( IS-CRATE ?auto_62492 ) ( not ( = ?auto_62492 ?auto_62493 ) ) ( not ( = ?auto_62516 ?auto_62498 ) ) ( HOIST-AT ?auto_62508 ?auto_62516 ) ( not ( = ?auto_62507 ?auto_62508 ) ) ( SURFACE-AT ?auto_62492 ?auto_62516 ) ( ON ?auto_62492 ?auto_62513 ) ( CLEAR ?auto_62492 ) ( not ( = ?auto_62492 ?auto_62513 ) ) ( not ( = ?auto_62493 ?auto_62513 ) ) ( IS-CRATE ?auto_62493 ) ( not ( = ?auto_62492 ?auto_62496 ) ) ( not ( = ?auto_62493 ?auto_62496 ) ) ( not ( = ?auto_62513 ?auto_62496 ) ) ( not ( = ?auto_62501 ?auto_62498 ) ) ( not ( = ?auto_62516 ?auto_62501 ) ) ( HOIST-AT ?auto_62509 ?auto_62501 ) ( not ( = ?auto_62507 ?auto_62509 ) ) ( not ( = ?auto_62508 ?auto_62509 ) ) ( AVAILABLE ?auto_62509 ) ( SURFACE-AT ?auto_62493 ?auto_62501 ) ( ON ?auto_62493 ?auto_62510 ) ( CLEAR ?auto_62493 ) ( not ( = ?auto_62492 ?auto_62510 ) ) ( not ( = ?auto_62493 ?auto_62510 ) ) ( not ( = ?auto_62513 ?auto_62510 ) ) ( not ( = ?auto_62496 ?auto_62510 ) ) ( IS-CRATE ?auto_62496 ) ( not ( = ?auto_62492 ?auto_62499 ) ) ( not ( = ?auto_62493 ?auto_62499 ) ) ( not ( = ?auto_62513 ?auto_62499 ) ) ( not ( = ?auto_62496 ?auto_62499 ) ) ( not ( = ?auto_62510 ?auto_62499 ) ) ( not ( = ?auto_62494 ?auto_62498 ) ) ( not ( = ?auto_62516 ?auto_62494 ) ) ( not ( = ?auto_62501 ?auto_62494 ) ) ( HOIST-AT ?auto_62517 ?auto_62494 ) ( not ( = ?auto_62507 ?auto_62517 ) ) ( not ( = ?auto_62508 ?auto_62517 ) ) ( not ( = ?auto_62509 ?auto_62517 ) ) ( SURFACE-AT ?auto_62496 ?auto_62494 ) ( ON ?auto_62496 ?auto_62511 ) ( CLEAR ?auto_62496 ) ( not ( = ?auto_62492 ?auto_62511 ) ) ( not ( = ?auto_62493 ?auto_62511 ) ) ( not ( = ?auto_62513 ?auto_62511 ) ) ( not ( = ?auto_62496 ?auto_62511 ) ) ( not ( = ?auto_62510 ?auto_62511 ) ) ( not ( = ?auto_62499 ?auto_62511 ) ) ( IS-CRATE ?auto_62499 ) ( not ( = ?auto_62492 ?auto_62506 ) ) ( not ( = ?auto_62493 ?auto_62506 ) ) ( not ( = ?auto_62513 ?auto_62506 ) ) ( not ( = ?auto_62496 ?auto_62506 ) ) ( not ( = ?auto_62510 ?auto_62506 ) ) ( not ( = ?auto_62499 ?auto_62506 ) ) ( not ( = ?auto_62511 ?auto_62506 ) ) ( not ( = ?auto_62518 ?auto_62498 ) ) ( not ( = ?auto_62516 ?auto_62518 ) ) ( not ( = ?auto_62501 ?auto_62518 ) ) ( not ( = ?auto_62494 ?auto_62518 ) ) ( HOIST-AT ?auto_62512 ?auto_62518 ) ( not ( = ?auto_62507 ?auto_62512 ) ) ( not ( = ?auto_62508 ?auto_62512 ) ) ( not ( = ?auto_62509 ?auto_62512 ) ) ( not ( = ?auto_62517 ?auto_62512 ) ) ( AVAILABLE ?auto_62512 ) ( SURFACE-AT ?auto_62499 ?auto_62518 ) ( ON ?auto_62499 ?auto_62514 ) ( CLEAR ?auto_62499 ) ( not ( = ?auto_62492 ?auto_62514 ) ) ( not ( = ?auto_62493 ?auto_62514 ) ) ( not ( = ?auto_62513 ?auto_62514 ) ) ( not ( = ?auto_62496 ?auto_62514 ) ) ( not ( = ?auto_62510 ?auto_62514 ) ) ( not ( = ?auto_62499 ?auto_62514 ) ) ( not ( = ?auto_62511 ?auto_62514 ) ) ( not ( = ?auto_62506 ?auto_62514 ) ) ( IS-CRATE ?auto_62506 ) ( not ( = ?auto_62492 ?auto_62515 ) ) ( not ( = ?auto_62493 ?auto_62515 ) ) ( not ( = ?auto_62513 ?auto_62515 ) ) ( not ( = ?auto_62496 ?auto_62515 ) ) ( not ( = ?auto_62510 ?auto_62515 ) ) ( not ( = ?auto_62499 ?auto_62515 ) ) ( not ( = ?auto_62511 ?auto_62515 ) ) ( not ( = ?auto_62506 ?auto_62515 ) ) ( not ( = ?auto_62514 ?auto_62515 ) ) ( not ( = ?auto_62504 ?auto_62498 ) ) ( not ( = ?auto_62516 ?auto_62504 ) ) ( not ( = ?auto_62501 ?auto_62504 ) ) ( not ( = ?auto_62494 ?auto_62504 ) ) ( not ( = ?auto_62518 ?auto_62504 ) ) ( HOIST-AT ?auto_62497 ?auto_62504 ) ( not ( = ?auto_62507 ?auto_62497 ) ) ( not ( = ?auto_62508 ?auto_62497 ) ) ( not ( = ?auto_62509 ?auto_62497 ) ) ( not ( = ?auto_62517 ?auto_62497 ) ) ( not ( = ?auto_62512 ?auto_62497 ) ) ( AVAILABLE ?auto_62497 ) ( SURFACE-AT ?auto_62506 ?auto_62504 ) ( ON ?auto_62506 ?auto_62502 ) ( CLEAR ?auto_62506 ) ( not ( = ?auto_62492 ?auto_62502 ) ) ( not ( = ?auto_62493 ?auto_62502 ) ) ( not ( = ?auto_62513 ?auto_62502 ) ) ( not ( = ?auto_62496 ?auto_62502 ) ) ( not ( = ?auto_62510 ?auto_62502 ) ) ( not ( = ?auto_62499 ?auto_62502 ) ) ( not ( = ?auto_62511 ?auto_62502 ) ) ( not ( = ?auto_62506 ?auto_62502 ) ) ( not ( = ?auto_62514 ?auto_62502 ) ) ( not ( = ?auto_62515 ?auto_62502 ) ) ( IS-CRATE ?auto_62515 ) ( not ( = ?auto_62492 ?auto_62505 ) ) ( not ( = ?auto_62493 ?auto_62505 ) ) ( not ( = ?auto_62513 ?auto_62505 ) ) ( not ( = ?auto_62496 ?auto_62505 ) ) ( not ( = ?auto_62510 ?auto_62505 ) ) ( not ( = ?auto_62499 ?auto_62505 ) ) ( not ( = ?auto_62511 ?auto_62505 ) ) ( not ( = ?auto_62506 ?auto_62505 ) ) ( not ( = ?auto_62514 ?auto_62505 ) ) ( not ( = ?auto_62515 ?auto_62505 ) ) ( not ( = ?auto_62502 ?auto_62505 ) ) ( AVAILABLE ?auto_62508 ) ( SURFACE-AT ?auto_62515 ?auto_62516 ) ( ON ?auto_62515 ?auto_62503 ) ( CLEAR ?auto_62515 ) ( not ( = ?auto_62492 ?auto_62503 ) ) ( not ( = ?auto_62493 ?auto_62503 ) ) ( not ( = ?auto_62513 ?auto_62503 ) ) ( not ( = ?auto_62496 ?auto_62503 ) ) ( not ( = ?auto_62510 ?auto_62503 ) ) ( not ( = ?auto_62499 ?auto_62503 ) ) ( not ( = ?auto_62511 ?auto_62503 ) ) ( not ( = ?auto_62506 ?auto_62503 ) ) ( not ( = ?auto_62514 ?auto_62503 ) ) ( not ( = ?auto_62515 ?auto_62503 ) ) ( not ( = ?auto_62502 ?auto_62503 ) ) ( not ( = ?auto_62505 ?auto_62503 ) ) ( SURFACE-AT ?auto_62500 ?auto_62498 ) ( CLEAR ?auto_62500 ) ( IS-CRATE ?auto_62505 ) ( not ( = ?auto_62492 ?auto_62500 ) ) ( not ( = ?auto_62493 ?auto_62500 ) ) ( not ( = ?auto_62513 ?auto_62500 ) ) ( not ( = ?auto_62496 ?auto_62500 ) ) ( not ( = ?auto_62510 ?auto_62500 ) ) ( not ( = ?auto_62499 ?auto_62500 ) ) ( not ( = ?auto_62511 ?auto_62500 ) ) ( not ( = ?auto_62506 ?auto_62500 ) ) ( not ( = ?auto_62514 ?auto_62500 ) ) ( not ( = ?auto_62515 ?auto_62500 ) ) ( not ( = ?auto_62502 ?auto_62500 ) ) ( not ( = ?auto_62505 ?auto_62500 ) ) ( not ( = ?auto_62503 ?auto_62500 ) ) ( AVAILABLE ?auto_62507 ) ( TRUCK-AT ?auto_62495 ?auto_62494 ) ( AVAILABLE ?auto_62517 ) ( SURFACE-AT ?auto_62505 ?auto_62494 ) ( ON ?auto_62505 ?auto_62519 ) ( CLEAR ?auto_62505 ) ( not ( = ?auto_62492 ?auto_62519 ) ) ( not ( = ?auto_62493 ?auto_62519 ) ) ( not ( = ?auto_62513 ?auto_62519 ) ) ( not ( = ?auto_62496 ?auto_62519 ) ) ( not ( = ?auto_62510 ?auto_62519 ) ) ( not ( = ?auto_62499 ?auto_62519 ) ) ( not ( = ?auto_62511 ?auto_62519 ) ) ( not ( = ?auto_62506 ?auto_62519 ) ) ( not ( = ?auto_62514 ?auto_62519 ) ) ( not ( = ?auto_62515 ?auto_62519 ) ) ( not ( = ?auto_62502 ?auto_62519 ) ) ( not ( = ?auto_62505 ?auto_62519 ) ) ( not ( = ?auto_62503 ?auto_62519 ) ) ( not ( = ?auto_62500 ?auto_62519 ) ) )
    :subtasks
    ( ( !LIFT ?auto_62517 ?auto_62505 ?auto_62519 ?auto_62494 )
      ( MAKE-ON ?auto_62492 ?auto_62493 )
      ( MAKE-ON-VERIFY ?auto_62492 ?auto_62493 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62520 - SURFACE
      ?auto_62521 - SURFACE
    )
    :vars
    (
      ?auto_62529 - HOIST
      ?auto_62525 - PLACE
      ?auto_62533 - PLACE
      ?auto_62540 - HOIST
      ?auto_62530 - SURFACE
      ?auto_62536 - SURFACE
      ?auto_62528 - PLACE
      ?auto_62534 - HOIST
      ?auto_62545 - SURFACE
      ?auto_62527 - SURFACE
      ?auto_62539 - PLACE
      ?auto_62544 - HOIST
      ?auto_62546 - SURFACE
      ?auto_62523 - SURFACE
      ?auto_62541 - PLACE
      ?auto_62547 - HOIST
      ?auto_62531 - SURFACE
      ?auto_62532 - SURFACE
      ?auto_62542 - PLACE
      ?auto_62522 - HOIST
      ?auto_62538 - SURFACE
      ?auto_62526 - SURFACE
      ?auto_62537 - SURFACE
      ?auto_62535 - SURFACE
      ?auto_62543 - SURFACE
      ?auto_62524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_62529 ?auto_62525 ) ( IS-CRATE ?auto_62520 ) ( not ( = ?auto_62520 ?auto_62521 ) ) ( not ( = ?auto_62533 ?auto_62525 ) ) ( HOIST-AT ?auto_62540 ?auto_62533 ) ( not ( = ?auto_62529 ?auto_62540 ) ) ( SURFACE-AT ?auto_62520 ?auto_62533 ) ( ON ?auto_62520 ?auto_62530 ) ( CLEAR ?auto_62520 ) ( not ( = ?auto_62520 ?auto_62530 ) ) ( not ( = ?auto_62521 ?auto_62530 ) ) ( IS-CRATE ?auto_62521 ) ( not ( = ?auto_62520 ?auto_62536 ) ) ( not ( = ?auto_62521 ?auto_62536 ) ) ( not ( = ?auto_62530 ?auto_62536 ) ) ( not ( = ?auto_62528 ?auto_62525 ) ) ( not ( = ?auto_62533 ?auto_62528 ) ) ( HOIST-AT ?auto_62534 ?auto_62528 ) ( not ( = ?auto_62529 ?auto_62534 ) ) ( not ( = ?auto_62540 ?auto_62534 ) ) ( AVAILABLE ?auto_62534 ) ( SURFACE-AT ?auto_62521 ?auto_62528 ) ( ON ?auto_62521 ?auto_62545 ) ( CLEAR ?auto_62521 ) ( not ( = ?auto_62520 ?auto_62545 ) ) ( not ( = ?auto_62521 ?auto_62545 ) ) ( not ( = ?auto_62530 ?auto_62545 ) ) ( not ( = ?auto_62536 ?auto_62545 ) ) ( IS-CRATE ?auto_62536 ) ( not ( = ?auto_62520 ?auto_62527 ) ) ( not ( = ?auto_62521 ?auto_62527 ) ) ( not ( = ?auto_62530 ?auto_62527 ) ) ( not ( = ?auto_62536 ?auto_62527 ) ) ( not ( = ?auto_62545 ?auto_62527 ) ) ( not ( = ?auto_62539 ?auto_62525 ) ) ( not ( = ?auto_62533 ?auto_62539 ) ) ( not ( = ?auto_62528 ?auto_62539 ) ) ( HOIST-AT ?auto_62544 ?auto_62539 ) ( not ( = ?auto_62529 ?auto_62544 ) ) ( not ( = ?auto_62540 ?auto_62544 ) ) ( not ( = ?auto_62534 ?auto_62544 ) ) ( SURFACE-AT ?auto_62536 ?auto_62539 ) ( ON ?auto_62536 ?auto_62546 ) ( CLEAR ?auto_62536 ) ( not ( = ?auto_62520 ?auto_62546 ) ) ( not ( = ?auto_62521 ?auto_62546 ) ) ( not ( = ?auto_62530 ?auto_62546 ) ) ( not ( = ?auto_62536 ?auto_62546 ) ) ( not ( = ?auto_62545 ?auto_62546 ) ) ( not ( = ?auto_62527 ?auto_62546 ) ) ( IS-CRATE ?auto_62527 ) ( not ( = ?auto_62520 ?auto_62523 ) ) ( not ( = ?auto_62521 ?auto_62523 ) ) ( not ( = ?auto_62530 ?auto_62523 ) ) ( not ( = ?auto_62536 ?auto_62523 ) ) ( not ( = ?auto_62545 ?auto_62523 ) ) ( not ( = ?auto_62527 ?auto_62523 ) ) ( not ( = ?auto_62546 ?auto_62523 ) ) ( not ( = ?auto_62541 ?auto_62525 ) ) ( not ( = ?auto_62533 ?auto_62541 ) ) ( not ( = ?auto_62528 ?auto_62541 ) ) ( not ( = ?auto_62539 ?auto_62541 ) ) ( HOIST-AT ?auto_62547 ?auto_62541 ) ( not ( = ?auto_62529 ?auto_62547 ) ) ( not ( = ?auto_62540 ?auto_62547 ) ) ( not ( = ?auto_62534 ?auto_62547 ) ) ( not ( = ?auto_62544 ?auto_62547 ) ) ( AVAILABLE ?auto_62547 ) ( SURFACE-AT ?auto_62527 ?auto_62541 ) ( ON ?auto_62527 ?auto_62531 ) ( CLEAR ?auto_62527 ) ( not ( = ?auto_62520 ?auto_62531 ) ) ( not ( = ?auto_62521 ?auto_62531 ) ) ( not ( = ?auto_62530 ?auto_62531 ) ) ( not ( = ?auto_62536 ?auto_62531 ) ) ( not ( = ?auto_62545 ?auto_62531 ) ) ( not ( = ?auto_62527 ?auto_62531 ) ) ( not ( = ?auto_62546 ?auto_62531 ) ) ( not ( = ?auto_62523 ?auto_62531 ) ) ( IS-CRATE ?auto_62523 ) ( not ( = ?auto_62520 ?auto_62532 ) ) ( not ( = ?auto_62521 ?auto_62532 ) ) ( not ( = ?auto_62530 ?auto_62532 ) ) ( not ( = ?auto_62536 ?auto_62532 ) ) ( not ( = ?auto_62545 ?auto_62532 ) ) ( not ( = ?auto_62527 ?auto_62532 ) ) ( not ( = ?auto_62546 ?auto_62532 ) ) ( not ( = ?auto_62523 ?auto_62532 ) ) ( not ( = ?auto_62531 ?auto_62532 ) ) ( not ( = ?auto_62542 ?auto_62525 ) ) ( not ( = ?auto_62533 ?auto_62542 ) ) ( not ( = ?auto_62528 ?auto_62542 ) ) ( not ( = ?auto_62539 ?auto_62542 ) ) ( not ( = ?auto_62541 ?auto_62542 ) ) ( HOIST-AT ?auto_62522 ?auto_62542 ) ( not ( = ?auto_62529 ?auto_62522 ) ) ( not ( = ?auto_62540 ?auto_62522 ) ) ( not ( = ?auto_62534 ?auto_62522 ) ) ( not ( = ?auto_62544 ?auto_62522 ) ) ( not ( = ?auto_62547 ?auto_62522 ) ) ( AVAILABLE ?auto_62522 ) ( SURFACE-AT ?auto_62523 ?auto_62542 ) ( ON ?auto_62523 ?auto_62538 ) ( CLEAR ?auto_62523 ) ( not ( = ?auto_62520 ?auto_62538 ) ) ( not ( = ?auto_62521 ?auto_62538 ) ) ( not ( = ?auto_62530 ?auto_62538 ) ) ( not ( = ?auto_62536 ?auto_62538 ) ) ( not ( = ?auto_62545 ?auto_62538 ) ) ( not ( = ?auto_62527 ?auto_62538 ) ) ( not ( = ?auto_62546 ?auto_62538 ) ) ( not ( = ?auto_62523 ?auto_62538 ) ) ( not ( = ?auto_62531 ?auto_62538 ) ) ( not ( = ?auto_62532 ?auto_62538 ) ) ( IS-CRATE ?auto_62532 ) ( not ( = ?auto_62520 ?auto_62526 ) ) ( not ( = ?auto_62521 ?auto_62526 ) ) ( not ( = ?auto_62530 ?auto_62526 ) ) ( not ( = ?auto_62536 ?auto_62526 ) ) ( not ( = ?auto_62545 ?auto_62526 ) ) ( not ( = ?auto_62527 ?auto_62526 ) ) ( not ( = ?auto_62546 ?auto_62526 ) ) ( not ( = ?auto_62523 ?auto_62526 ) ) ( not ( = ?auto_62531 ?auto_62526 ) ) ( not ( = ?auto_62532 ?auto_62526 ) ) ( not ( = ?auto_62538 ?auto_62526 ) ) ( AVAILABLE ?auto_62540 ) ( SURFACE-AT ?auto_62532 ?auto_62533 ) ( ON ?auto_62532 ?auto_62537 ) ( CLEAR ?auto_62532 ) ( not ( = ?auto_62520 ?auto_62537 ) ) ( not ( = ?auto_62521 ?auto_62537 ) ) ( not ( = ?auto_62530 ?auto_62537 ) ) ( not ( = ?auto_62536 ?auto_62537 ) ) ( not ( = ?auto_62545 ?auto_62537 ) ) ( not ( = ?auto_62527 ?auto_62537 ) ) ( not ( = ?auto_62546 ?auto_62537 ) ) ( not ( = ?auto_62523 ?auto_62537 ) ) ( not ( = ?auto_62531 ?auto_62537 ) ) ( not ( = ?auto_62532 ?auto_62537 ) ) ( not ( = ?auto_62538 ?auto_62537 ) ) ( not ( = ?auto_62526 ?auto_62537 ) ) ( SURFACE-AT ?auto_62535 ?auto_62525 ) ( CLEAR ?auto_62535 ) ( IS-CRATE ?auto_62526 ) ( not ( = ?auto_62520 ?auto_62535 ) ) ( not ( = ?auto_62521 ?auto_62535 ) ) ( not ( = ?auto_62530 ?auto_62535 ) ) ( not ( = ?auto_62536 ?auto_62535 ) ) ( not ( = ?auto_62545 ?auto_62535 ) ) ( not ( = ?auto_62527 ?auto_62535 ) ) ( not ( = ?auto_62546 ?auto_62535 ) ) ( not ( = ?auto_62523 ?auto_62535 ) ) ( not ( = ?auto_62531 ?auto_62535 ) ) ( not ( = ?auto_62532 ?auto_62535 ) ) ( not ( = ?auto_62538 ?auto_62535 ) ) ( not ( = ?auto_62526 ?auto_62535 ) ) ( not ( = ?auto_62537 ?auto_62535 ) ) ( AVAILABLE ?auto_62529 ) ( AVAILABLE ?auto_62544 ) ( SURFACE-AT ?auto_62526 ?auto_62539 ) ( ON ?auto_62526 ?auto_62543 ) ( CLEAR ?auto_62526 ) ( not ( = ?auto_62520 ?auto_62543 ) ) ( not ( = ?auto_62521 ?auto_62543 ) ) ( not ( = ?auto_62530 ?auto_62543 ) ) ( not ( = ?auto_62536 ?auto_62543 ) ) ( not ( = ?auto_62545 ?auto_62543 ) ) ( not ( = ?auto_62527 ?auto_62543 ) ) ( not ( = ?auto_62546 ?auto_62543 ) ) ( not ( = ?auto_62523 ?auto_62543 ) ) ( not ( = ?auto_62531 ?auto_62543 ) ) ( not ( = ?auto_62532 ?auto_62543 ) ) ( not ( = ?auto_62538 ?auto_62543 ) ) ( not ( = ?auto_62526 ?auto_62543 ) ) ( not ( = ?auto_62537 ?auto_62543 ) ) ( not ( = ?auto_62535 ?auto_62543 ) ) ( TRUCK-AT ?auto_62524 ?auto_62525 ) )
    :subtasks
    ( ( !DRIVE ?auto_62524 ?auto_62525 ?auto_62539 )
      ( MAKE-ON ?auto_62520 ?auto_62521 )
      ( MAKE-ON-VERIFY ?auto_62520 ?auto_62521 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62548 - SURFACE
      ?auto_62549 - SURFACE
    )
    :vars
    (
      ?auto_62571 - HOIST
      ?auto_62564 - PLACE
      ?auto_62568 - PLACE
      ?auto_62553 - HOIST
      ?auto_62569 - SURFACE
      ?auto_62574 - SURFACE
      ?auto_62563 - PLACE
      ?auto_62572 - HOIST
      ?auto_62555 - SURFACE
      ?auto_62561 - SURFACE
      ?auto_62556 - PLACE
      ?auto_62566 - HOIST
      ?auto_62551 - SURFACE
      ?auto_62570 - SURFACE
      ?auto_62554 - PLACE
      ?auto_62552 - HOIST
      ?auto_62559 - SURFACE
      ?auto_62573 - SURFACE
      ?auto_62558 - PLACE
      ?auto_62550 - HOIST
      ?auto_62575 - SURFACE
      ?auto_62557 - SURFACE
      ?auto_62567 - SURFACE
      ?auto_62560 - SURFACE
      ?auto_62565 - SURFACE
      ?auto_62562 - TRUCK
      ?auto_62576 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62571 ?auto_62564 ) ( IS-CRATE ?auto_62548 ) ( not ( = ?auto_62548 ?auto_62549 ) ) ( not ( = ?auto_62568 ?auto_62564 ) ) ( HOIST-AT ?auto_62553 ?auto_62568 ) ( not ( = ?auto_62571 ?auto_62553 ) ) ( SURFACE-AT ?auto_62548 ?auto_62568 ) ( ON ?auto_62548 ?auto_62569 ) ( CLEAR ?auto_62548 ) ( not ( = ?auto_62548 ?auto_62569 ) ) ( not ( = ?auto_62549 ?auto_62569 ) ) ( IS-CRATE ?auto_62549 ) ( not ( = ?auto_62548 ?auto_62574 ) ) ( not ( = ?auto_62549 ?auto_62574 ) ) ( not ( = ?auto_62569 ?auto_62574 ) ) ( not ( = ?auto_62563 ?auto_62564 ) ) ( not ( = ?auto_62568 ?auto_62563 ) ) ( HOIST-AT ?auto_62572 ?auto_62563 ) ( not ( = ?auto_62571 ?auto_62572 ) ) ( not ( = ?auto_62553 ?auto_62572 ) ) ( AVAILABLE ?auto_62572 ) ( SURFACE-AT ?auto_62549 ?auto_62563 ) ( ON ?auto_62549 ?auto_62555 ) ( CLEAR ?auto_62549 ) ( not ( = ?auto_62548 ?auto_62555 ) ) ( not ( = ?auto_62549 ?auto_62555 ) ) ( not ( = ?auto_62569 ?auto_62555 ) ) ( not ( = ?auto_62574 ?auto_62555 ) ) ( IS-CRATE ?auto_62574 ) ( not ( = ?auto_62548 ?auto_62561 ) ) ( not ( = ?auto_62549 ?auto_62561 ) ) ( not ( = ?auto_62569 ?auto_62561 ) ) ( not ( = ?auto_62574 ?auto_62561 ) ) ( not ( = ?auto_62555 ?auto_62561 ) ) ( not ( = ?auto_62556 ?auto_62564 ) ) ( not ( = ?auto_62568 ?auto_62556 ) ) ( not ( = ?auto_62563 ?auto_62556 ) ) ( HOIST-AT ?auto_62566 ?auto_62556 ) ( not ( = ?auto_62571 ?auto_62566 ) ) ( not ( = ?auto_62553 ?auto_62566 ) ) ( not ( = ?auto_62572 ?auto_62566 ) ) ( SURFACE-AT ?auto_62574 ?auto_62556 ) ( ON ?auto_62574 ?auto_62551 ) ( CLEAR ?auto_62574 ) ( not ( = ?auto_62548 ?auto_62551 ) ) ( not ( = ?auto_62549 ?auto_62551 ) ) ( not ( = ?auto_62569 ?auto_62551 ) ) ( not ( = ?auto_62574 ?auto_62551 ) ) ( not ( = ?auto_62555 ?auto_62551 ) ) ( not ( = ?auto_62561 ?auto_62551 ) ) ( IS-CRATE ?auto_62561 ) ( not ( = ?auto_62548 ?auto_62570 ) ) ( not ( = ?auto_62549 ?auto_62570 ) ) ( not ( = ?auto_62569 ?auto_62570 ) ) ( not ( = ?auto_62574 ?auto_62570 ) ) ( not ( = ?auto_62555 ?auto_62570 ) ) ( not ( = ?auto_62561 ?auto_62570 ) ) ( not ( = ?auto_62551 ?auto_62570 ) ) ( not ( = ?auto_62554 ?auto_62564 ) ) ( not ( = ?auto_62568 ?auto_62554 ) ) ( not ( = ?auto_62563 ?auto_62554 ) ) ( not ( = ?auto_62556 ?auto_62554 ) ) ( HOIST-AT ?auto_62552 ?auto_62554 ) ( not ( = ?auto_62571 ?auto_62552 ) ) ( not ( = ?auto_62553 ?auto_62552 ) ) ( not ( = ?auto_62572 ?auto_62552 ) ) ( not ( = ?auto_62566 ?auto_62552 ) ) ( AVAILABLE ?auto_62552 ) ( SURFACE-AT ?auto_62561 ?auto_62554 ) ( ON ?auto_62561 ?auto_62559 ) ( CLEAR ?auto_62561 ) ( not ( = ?auto_62548 ?auto_62559 ) ) ( not ( = ?auto_62549 ?auto_62559 ) ) ( not ( = ?auto_62569 ?auto_62559 ) ) ( not ( = ?auto_62574 ?auto_62559 ) ) ( not ( = ?auto_62555 ?auto_62559 ) ) ( not ( = ?auto_62561 ?auto_62559 ) ) ( not ( = ?auto_62551 ?auto_62559 ) ) ( not ( = ?auto_62570 ?auto_62559 ) ) ( IS-CRATE ?auto_62570 ) ( not ( = ?auto_62548 ?auto_62573 ) ) ( not ( = ?auto_62549 ?auto_62573 ) ) ( not ( = ?auto_62569 ?auto_62573 ) ) ( not ( = ?auto_62574 ?auto_62573 ) ) ( not ( = ?auto_62555 ?auto_62573 ) ) ( not ( = ?auto_62561 ?auto_62573 ) ) ( not ( = ?auto_62551 ?auto_62573 ) ) ( not ( = ?auto_62570 ?auto_62573 ) ) ( not ( = ?auto_62559 ?auto_62573 ) ) ( not ( = ?auto_62558 ?auto_62564 ) ) ( not ( = ?auto_62568 ?auto_62558 ) ) ( not ( = ?auto_62563 ?auto_62558 ) ) ( not ( = ?auto_62556 ?auto_62558 ) ) ( not ( = ?auto_62554 ?auto_62558 ) ) ( HOIST-AT ?auto_62550 ?auto_62558 ) ( not ( = ?auto_62571 ?auto_62550 ) ) ( not ( = ?auto_62553 ?auto_62550 ) ) ( not ( = ?auto_62572 ?auto_62550 ) ) ( not ( = ?auto_62566 ?auto_62550 ) ) ( not ( = ?auto_62552 ?auto_62550 ) ) ( AVAILABLE ?auto_62550 ) ( SURFACE-AT ?auto_62570 ?auto_62558 ) ( ON ?auto_62570 ?auto_62575 ) ( CLEAR ?auto_62570 ) ( not ( = ?auto_62548 ?auto_62575 ) ) ( not ( = ?auto_62549 ?auto_62575 ) ) ( not ( = ?auto_62569 ?auto_62575 ) ) ( not ( = ?auto_62574 ?auto_62575 ) ) ( not ( = ?auto_62555 ?auto_62575 ) ) ( not ( = ?auto_62561 ?auto_62575 ) ) ( not ( = ?auto_62551 ?auto_62575 ) ) ( not ( = ?auto_62570 ?auto_62575 ) ) ( not ( = ?auto_62559 ?auto_62575 ) ) ( not ( = ?auto_62573 ?auto_62575 ) ) ( IS-CRATE ?auto_62573 ) ( not ( = ?auto_62548 ?auto_62557 ) ) ( not ( = ?auto_62549 ?auto_62557 ) ) ( not ( = ?auto_62569 ?auto_62557 ) ) ( not ( = ?auto_62574 ?auto_62557 ) ) ( not ( = ?auto_62555 ?auto_62557 ) ) ( not ( = ?auto_62561 ?auto_62557 ) ) ( not ( = ?auto_62551 ?auto_62557 ) ) ( not ( = ?auto_62570 ?auto_62557 ) ) ( not ( = ?auto_62559 ?auto_62557 ) ) ( not ( = ?auto_62573 ?auto_62557 ) ) ( not ( = ?auto_62575 ?auto_62557 ) ) ( AVAILABLE ?auto_62553 ) ( SURFACE-AT ?auto_62573 ?auto_62568 ) ( ON ?auto_62573 ?auto_62567 ) ( CLEAR ?auto_62573 ) ( not ( = ?auto_62548 ?auto_62567 ) ) ( not ( = ?auto_62549 ?auto_62567 ) ) ( not ( = ?auto_62569 ?auto_62567 ) ) ( not ( = ?auto_62574 ?auto_62567 ) ) ( not ( = ?auto_62555 ?auto_62567 ) ) ( not ( = ?auto_62561 ?auto_62567 ) ) ( not ( = ?auto_62551 ?auto_62567 ) ) ( not ( = ?auto_62570 ?auto_62567 ) ) ( not ( = ?auto_62559 ?auto_62567 ) ) ( not ( = ?auto_62573 ?auto_62567 ) ) ( not ( = ?auto_62575 ?auto_62567 ) ) ( not ( = ?auto_62557 ?auto_62567 ) ) ( IS-CRATE ?auto_62557 ) ( not ( = ?auto_62548 ?auto_62560 ) ) ( not ( = ?auto_62549 ?auto_62560 ) ) ( not ( = ?auto_62569 ?auto_62560 ) ) ( not ( = ?auto_62574 ?auto_62560 ) ) ( not ( = ?auto_62555 ?auto_62560 ) ) ( not ( = ?auto_62561 ?auto_62560 ) ) ( not ( = ?auto_62551 ?auto_62560 ) ) ( not ( = ?auto_62570 ?auto_62560 ) ) ( not ( = ?auto_62559 ?auto_62560 ) ) ( not ( = ?auto_62573 ?auto_62560 ) ) ( not ( = ?auto_62575 ?auto_62560 ) ) ( not ( = ?auto_62557 ?auto_62560 ) ) ( not ( = ?auto_62567 ?auto_62560 ) ) ( AVAILABLE ?auto_62566 ) ( SURFACE-AT ?auto_62557 ?auto_62556 ) ( ON ?auto_62557 ?auto_62565 ) ( CLEAR ?auto_62557 ) ( not ( = ?auto_62548 ?auto_62565 ) ) ( not ( = ?auto_62549 ?auto_62565 ) ) ( not ( = ?auto_62569 ?auto_62565 ) ) ( not ( = ?auto_62574 ?auto_62565 ) ) ( not ( = ?auto_62555 ?auto_62565 ) ) ( not ( = ?auto_62561 ?auto_62565 ) ) ( not ( = ?auto_62551 ?auto_62565 ) ) ( not ( = ?auto_62570 ?auto_62565 ) ) ( not ( = ?auto_62559 ?auto_62565 ) ) ( not ( = ?auto_62573 ?auto_62565 ) ) ( not ( = ?auto_62575 ?auto_62565 ) ) ( not ( = ?auto_62557 ?auto_62565 ) ) ( not ( = ?auto_62567 ?auto_62565 ) ) ( not ( = ?auto_62560 ?auto_62565 ) ) ( TRUCK-AT ?auto_62562 ?auto_62564 ) ( SURFACE-AT ?auto_62576 ?auto_62564 ) ( CLEAR ?auto_62576 ) ( LIFTING ?auto_62571 ?auto_62560 ) ( IS-CRATE ?auto_62560 ) ( not ( = ?auto_62548 ?auto_62576 ) ) ( not ( = ?auto_62549 ?auto_62576 ) ) ( not ( = ?auto_62569 ?auto_62576 ) ) ( not ( = ?auto_62574 ?auto_62576 ) ) ( not ( = ?auto_62555 ?auto_62576 ) ) ( not ( = ?auto_62561 ?auto_62576 ) ) ( not ( = ?auto_62551 ?auto_62576 ) ) ( not ( = ?auto_62570 ?auto_62576 ) ) ( not ( = ?auto_62559 ?auto_62576 ) ) ( not ( = ?auto_62573 ?auto_62576 ) ) ( not ( = ?auto_62575 ?auto_62576 ) ) ( not ( = ?auto_62557 ?auto_62576 ) ) ( not ( = ?auto_62567 ?auto_62576 ) ) ( not ( = ?auto_62560 ?auto_62576 ) ) ( not ( = ?auto_62565 ?auto_62576 ) ) )
    :subtasks
    ( ( !DROP ?auto_62571 ?auto_62560 ?auto_62576 ?auto_62564 )
      ( MAKE-ON ?auto_62548 ?auto_62549 )
      ( MAKE-ON-VERIFY ?auto_62548 ?auto_62549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62577 - SURFACE
      ?auto_62578 - SURFACE
    )
    :vars
    (
      ?auto_62585 - HOIST
      ?auto_62588 - PLACE
      ?auto_62582 - PLACE
      ?auto_62594 - HOIST
      ?auto_62583 - SURFACE
      ?auto_62600 - SURFACE
      ?auto_62599 - PLACE
      ?auto_62591 - HOIST
      ?auto_62605 - SURFACE
      ?auto_62598 - SURFACE
      ?auto_62589 - PLACE
      ?auto_62587 - HOIST
      ?auto_62603 - SURFACE
      ?auto_62584 - SURFACE
      ?auto_62580 - PLACE
      ?auto_62604 - HOIST
      ?auto_62579 - SURFACE
      ?auto_62586 - SURFACE
      ?auto_62597 - PLACE
      ?auto_62593 - HOIST
      ?auto_62601 - SURFACE
      ?auto_62596 - SURFACE
      ?auto_62581 - SURFACE
      ?auto_62602 - SURFACE
      ?auto_62592 - SURFACE
      ?auto_62595 - TRUCK
      ?auto_62590 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62585 ?auto_62588 ) ( IS-CRATE ?auto_62577 ) ( not ( = ?auto_62577 ?auto_62578 ) ) ( not ( = ?auto_62582 ?auto_62588 ) ) ( HOIST-AT ?auto_62594 ?auto_62582 ) ( not ( = ?auto_62585 ?auto_62594 ) ) ( SURFACE-AT ?auto_62577 ?auto_62582 ) ( ON ?auto_62577 ?auto_62583 ) ( CLEAR ?auto_62577 ) ( not ( = ?auto_62577 ?auto_62583 ) ) ( not ( = ?auto_62578 ?auto_62583 ) ) ( IS-CRATE ?auto_62578 ) ( not ( = ?auto_62577 ?auto_62600 ) ) ( not ( = ?auto_62578 ?auto_62600 ) ) ( not ( = ?auto_62583 ?auto_62600 ) ) ( not ( = ?auto_62599 ?auto_62588 ) ) ( not ( = ?auto_62582 ?auto_62599 ) ) ( HOIST-AT ?auto_62591 ?auto_62599 ) ( not ( = ?auto_62585 ?auto_62591 ) ) ( not ( = ?auto_62594 ?auto_62591 ) ) ( AVAILABLE ?auto_62591 ) ( SURFACE-AT ?auto_62578 ?auto_62599 ) ( ON ?auto_62578 ?auto_62605 ) ( CLEAR ?auto_62578 ) ( not ( = ?auto_62577 ?auto_62605 ) ) ( not ( = ?auto_62578 ?auto_62605 ) ) ( not ( = ?auto_62583 ?auto_62605 ) ) ( not ( = ?auto_62600 ?auto_62605 ) ) ( IS-CRATE ?auto_62600 ) ( not ( = ?auto_62577 ?auto_62598 ) ) ( not ( = ?auto_62578 ?auto_62598 ) ) ( not ( = ?auto_62583 ?auto_62598 ) ) ( not ( = ?auto_62600 ?auto_62598 ) ) ( not ( = ?auto_62605 ?auto_62598 ) ) ( not ( = ?auto_62589 ?auto_62588 ) ) ( not ( = ?auto_62582 ?auto_62589 ) ) ( not ( = ?auto_62599 ?auto_62589 ) ) ( HOIST-AT ?auto_62587 ?auto_62589 ) ( not ( = ?auto_62585 ?auto_62587 ) ) ( not ( = ?auto_62594 ?auto_62587 ) ) ( not ( = ?auto_62591 ?auto_62587 ) ) ( SURFACE-AT ?auto_62600 ?auto_62589 ) ( ON ?auto_62600 ?auto_62603 ) ( CLEAR ?auto_62600 ) ( not ( = ?auto_62577 ?auto_62603 ) ) ( not ( = ?auto_62578 ?auto_62603 ) ) ( not ( = ?auto_62583 ?auto_62603 ) ) ( not ( = ?auto_62600 ?auto_62603 ) ) ( not ( = ?auto_62605 ?auto_62603 ) ) ( not ( = ?auto_62598 ?auto_62603 ) ) ( IS-CRATE ?auto_62598 ) ( not ( = ?auto_62577 ?auto_62584 ) ) ( not ( = ?auto_62578 ?auto_62584 ) ) ( not ( = ?auto_62583 ?auto_62584 ) ) ( not ( = ?auto_62600 ?auto_62584 ) ) ( not ( = ?auto_62605 ?auto_62584 ) ) ( not ( = ?auto_62598 ?auto_62584 ) ) ( not ( = ?auto_62603 ?auto_62584 ) ) ( not ( = ?auto_62580 ?auto_62588 ) ) ( not ( = ?auto_62582 ?auto_62580 ) ) ( not ( = ?auto_62599 ?auto_62580 ) ) ( not ( = ?auto_62589 ?auto_62580 ) ) ( HOIST-AT ?auto_62604 ?auto_62580 ) ( not ( = ?auto_62585 ?auto_62604 ) ) ( not ( = ?auto_62594 ?auto_62604 ) ) ( not ( = ?auto_62591 ?auto_62604 ) ) ( not ( = ?auto_62587 ?auto_62604 ) ) ( AVAILABLE ?auto_62604 ) ( SURFACE-AT ?auto_62598 ?auto_62580 ) ( ON ?auto_62598 ?auto_62579 ) ( CLEAR ?auto_62598 ) ( not ( = ?auto_62577 ?auto_62579 ) ) ( not ( = ?auto_62578 ?auto_62579 ) ) ( not ( = ?auto_62583 ?auto_62579 ) ) ( not ( = ?auto_62600 ?auto_62579 ) ) ( not ( = ?auto_62605 ?auto_62579 ) ) ( not ( = ?auto_62598 ?auto_62579 ) ) ( not ( = ?auto_62603 ?auto_62579 ) ) ( not ( = ?auto_62584 ?auto_62579 ) ) ( IS-CRATE ?auto_62584 ) ( not ( = ?auto_62577 ?auto_62586 ) ) ( not ( = ?auto_62578 ?auto_62586 ) ) ( not ( = ?auto_62583 ?auto_62586 ) ) ( not ( = ?auto_62600 ?auto_62586 ) ) ( not ( = ?auto_62605 ?auto_62586 ) ) ( not ( = ?auto_62598 ?auto_62586 ) ) ( not ( = ?auto_62603 ?auto_62586 ) ) ( not ( = ?auto_62584 ?auto_62586 ) ) ( not ( = ?auto_62579 ?auto_62586 ) ) ( not ( = ?auto_62597 ?auto_62588 ) ) ( not ( = ?auto_62582 ?auto_62597 ) ) ( not ( = ?auto_62599 ?auto_62597 ) ) ( not ( = ?auto_62589 ?auto_62597 ) ) ( not ( = ?auto_62580 ?auto_62597 ) ) ( HOIST-AT ?auto_62593 ?auto_62597 ) ( not ( = ?auto_62585 ?auto_62593 ) ) ( not ( = ?auto_62594 ?auto_62593 ) ) ( not ( = ?auto_62591 ?auto_62593 ) ) ( not ( = ?auto_62587 ?auto_62593 ) ) ( not ( = ?auto_62604 ?auto_62593 ) ) ( AVAILABLE ?auto_62593 ) ( SURFACE-AT ?auto_62584 ?auto_62597 ) ( ON ?auto_62584 ?auto_62601 ) ( CLEAR ?auto_62584 ) ( not ( = ?auto_62577 ?auto_62601 ) ) ( not ( = ?auto_62578 ?auto_62601 ) ) ( not ( = ?auto_62583 ?auto_62601 ) ) ( not ( = ?auto_62600 ?auto_62601 ) ) ( not ( = ?auto_62605 ?auto_62601 ) ) ( not ( = ?auto_62598 ?auto_62601 ) ) ( not ( = ?auto_62603 ?auto_62601 ) ) ( not ( = ?auto_62584 ?auto_62601 ) ) ( not ( = ?auto_62579 ?auto_62601 ) ) ( not ( = ?auto_62586 ?auto_62601 ) ) ( IS-CRATE ?auto_62586 ) ( not ( = ?auto_62577 ?auto_62596 ) ) ( not ( = ?auto_62578 ?auto_62596 ) ) ( not ( = ?auto_62583 ?auto_62596 ) ) ( not ( = ?auto_62600 ?auto_62596 ) ) ( not ( = ?auto_62605 ?auto_62596 ) ) ( not ( = ?auto_62598 ?auto_62596 ) ) ( not ( = ?auto_62603 ?auto_62596 ) ) ( not ( = ?auto_62584 ?auto_62596 ) ) ( not ( = ?auto_62579 ?auto_62596 ) ) ( not ( = ?auto_62586 ?auto_62596 ) ) ( not ( = ?auto_62601 ?auto_62596 ) ) ( AVAILABLE ?auto_62594 ) ( SURFACE-AT ?auto_62586 ?auto_62582 ) ( ON ?auto_62586 ?auto_62581 ) ( CLEAR ?auto_62586 ) ( not ( = ?auto_62577 ?auto_62581 ) ) ( not ( = ?auto_62578 ?auto_62581 ) ) ( not ( = ?auto_62583 ?auto_62581 ) ) ( not ( = ?auto_62600 ?auto_62581 ) ) ( not ( = ?auto_62605 ?auto_62581 ) ) ( not ( = ?auto_62598 ?auto_62581 ) ) ( not ( = ?auto_62603 ?auto_62581 ) ) ( not ( = ?auto_62584 ?auto_62581 ) ) ( not ( = ?auto_62579 ?auto_62581 ) ) ( not ( = ?auto_62586 ?auto_62581 ) ) ( not ( = ?auto_62601 ?auto_62581 ) ) ( not ( = ?auto_62596 ?auto_62581 ) ) ( IS-CRATE ?auto_62596 ) ( not ( = ?auto_62577 ?auto_62602 ) ) ( not ( = ?auto_62578 ?auto_62602 ) ) ( not ( = ?auto_62583 ?auto_62602 ) ) ( not ( = ?auto_62600 ?auto_62602 ) ) ( not ( = ?auto_62605 ?auto_62602 ) ) ( not ( = ?auto_62598 ?auto_62602 ) ) ( not ( = ?auto_62603 ?auto_62602 ) ) ( not ( = ?auto_62584 ?auto_62602 ) ) ( not ( = ?auto_62579 ?auto_62602 ) ) ( not ( = ?auto_62586 ?auto_62602 ) ) ( not ( = ?auto_62601 ?auto_62602 ) ) ( not ( = ?auto_62596 ?auto_62602 ) ) ( not ( = ?auto_62581 ?auto_62602 ) ) ( AVAILABLE ?auto_62587 ) ( SURFACE-AT ?auto_62596 ?auto_62589 ) ( ON ?auto_62596 ?auto_62592 ) ( CLEAR ?auto_62596 ) ( not ( = ?auto_62577 ?auto_62592 ) ) ( not ( = ?auto_62578 ?auto_62592 ) ) ( not ( = ?auto_62583 ?auto_62592 ) ) ( not ( = ?auto_62600 ?auto_62592 ) ) ( not ( = ?auto_62605 ?auto_62592 ) ) ( not ( = ?auto_62598 ?auto_62592 ) ) ( not ( = ?auto_62603 ?auto_62592 ) ) ( not ( = ?auto_62584 ?auto_62592 ) ) ( not ( = ?auto_62579 ?auto_62592 ) ) ( not ( = ?auto_62586 ?auto_62592 ) ) ( not ( = ?auto_62601 ?auto_62592 ) ) ( not ( = ?auto_62596 ?auto_62592 ) ) ( not ( = ?auto_62581 ?auto_62592 ) ) ( not ( = ?auto_62602 ?auto_62592 ) ) ( TRUCK-AT ?auto_62595 ?auto_62588 ) ( SURFACE-AT ?auto_62590 ?auto_62588 ) ( CLEAR ?auto_62590 ) ( IS-CRATE ?auto_62602 ) ( not ( = ?auto_62577 ?auto_62590 ) ) ( not ( = ?auto_62578 ?auto_62590 ) ) ( not ( = ?auto_62583 ?auto_62590 ) ) ( not ( = ?auto_62600 ?auto_62590 ) ) ( not ( = ?auto_62605 ?auto_62590 ) ) ( not ( = ?auto_62598 ?auto_62590 ) ) ( not ( = ?auto_62603 ?auto_62590 ) ) ( not ( = ?auto_62584 ?auto_62590 ) ) ( not ( = ?auto_62579 ?auto_62590 ) ) ( not ( = ?auto_62586 ?auto_62590 ) ) ( not ( = ?auto_62601 ?auto_62590 ) ) ( not ( = ?auto_62596 ?auto_62590 ) ) ( not ( = ?auto_62581 ?auto_62590 ) ) ( not ( = ?auto_62602 ?auto_62590 ) ) ( not ( = ?auto_62592 ?auto_62590 ) ) ( AVAILABLE ?auto_62585 ) ( IN ?auto_62602 ?auto_62595 ) )
    :subtasks
    ( ( !UNLOAD ?auto_62585 ?auto_62602 ?auto_62595 ?auto_62588 )
      ( MAKE-ON ?auto_62577 ?auto_62578 )
      ( MAKE-ON-VERIFY ?auto_62577 ?auto_62578 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62606 - SURFACE
      ?auto_62607 - SURFACE
    )
    :vars
    (
      ?auto_62624 - HOIST
      ?auto_62629 - PLACE
      ?auto_62626 - PLACE
      ?auto_62620 - HOIST
      ?auto_62623 - SURFACE
      ?auto_62618 - SURFACE
      ?auto_62617 - PLACE
      ?auto_62630 - HOIST
      ?auto_62633 - SURFACE
      ?auto_62616 - SURFACE
      ?auto_62627 - PLACE
      ?auto_62625 - HOIST
      ?auto_62609 - SURFACE
      ?auto_62628 - SURFACE
      ?auto_62612 - PLACE
      ?auto_62634 - HOIST
      ?auto_62632 - SURFACE
      ?auto_62631 - SURFACE
      ?auto_62615 - PLACE
      ?auto_62622 - HOIST
      ?auto_62619 - SURFACE
      ?auto_62614 - SURFACE
      ?auto_62613 - SURFACE
      ?auto_62608 - SURFACE
      ?auto_62621 - SURFACE
      ?auto_62610 - SURFACE
      ?auto_62611 - TRUCK
      ?auto_62635 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62624 ?auto_62629 ) ( IS-CRATE ?auto_62606 ) ( not ( = ?auto_62606 ?auto_62607 ) ) ( not ( = ?auto_62626 ?auto_62629 ) ) ( HOIST-AT ?auto_62620 ?auto_62626 ) ( not ( = ?auto_62624 ?auto_62620 ) ) ( SURFACE-AT ?auto_62606 ?auto_62626 ) ( ON ?auto_62606 ?auto_62623 ) ( CLEAR ?auto_62606 ) ( not ( = ?auto_62606 ?auto_62623 ) ) ( not ( = ?auto_62607 ?auto_62623 ) ) ( IS-CRATE ?auto_62607 ) ( not ( = ?auto_62606 ?auto_62618 ) ) ( not ( = ?auto_62607 ?auto_62618 ) ) ( not ( = ?auto_62623 ?auto_62618 ) ) ( not ( = ?auto_62617 ?auto_62629 ) ) ( not ( = ?auto_62626 ?auto_62617 ) ) ( HOIST-AT ?auto_62630 ?auto_62617 ) ( not ( = ?auto_62624 ?auto_62630 ) ) ( not ( = ?auto_62620 ?auto_62630 ) ) ( AVAILABLE ?auto_62630 ) ( SURFACE-AT ?auto_62607 ?auto_62617 ) ( ON ?auto_62607 ?auto_62633 ) ( CLEAR ?auto_62607 ) ( not ( = ?auto_62606 ?auto_62633 ) ) ( not ( = ?auto_62607 ?auto_62633 ) ) ( not ( = ?auto_62623 ?auto_62633 ) ) ( not ( = ?auto_62618 ?auto_62633 ) ) ( IS-CRATE ?auto_62618 ) ( not ( = ?auto_62606 ?auto_62616 ) ) ( not ( = ?auto_62607 ?auto_62616 ) ) ( not ( = ?auto_62623 ?auto_62616 ) ) ( not ( = ?auto_62618 ?auto_62616 ) ) ( not ( = ?auto_62633 ?auto_62616 ) ) ( not ( = ?auto_62627 ?auto_62629 ) ) ( not ( = ?auto_62626 ?auto_62627 ) ) ( not ( = ?auto_62617 ?auto_62627 ) ) ( HOIST-AT ?auto_62625 ?auto_62627 ) ( not ( = ?auto_62624 ?auto_62625 ) ) ( not ( = ?auto_62620 ?auto_62625 ) ) ( not ( = ?auto_62630 ?auto_62625 ) ) ( SURFACE-AT ?auto_62618 ?auto_62627 ) ( ON ?auto_62618 ?auto_62609 ) ( CLEAR ?auto_62618 ) ( not ( = ?auto_62606 ?auto_62609 ) ) ( not ( = ?auto_62607 ?auto_62609 ) ) ( not ( = ?auto_62623 ?auto_62609 ) ) ( not ( = ?auto_62618 ?auto_62609 ) ) ( not ( = ?auto_62633 ?auto_62609 ) ) ( not ( = ?auto_62616 ?auto_62609 ) ) ( IS-CRATE ?auto_62616 ) ( not ( = ?auto_62606 ?auto_62628 ) ) ( not ( = ?auto_62607 ?auto_62628 ) ) ( not ( = ?auto_62623 ?auto_62628 ) ) ( not ( = ?auto_62618 ?auto_62628 ) ) ( not ( = ?auto_62633 ?auto_62628 ) ) ( not ( = ?auto_62616 ?auto_62628 ) ) ( not ( = ?auto_62609 ?auto_62628 ) ) ( not ( = ?auto_62612 ?auto_62629 ) ) ( not ( = ?auto_62626 ?auto_62612 ) ) ( not ( = ?auto_62617 ?auto_62612 ) ) ( not ( = ?auto_62627 ?auto_62612 ) ) ( HOIST-AT ?auto_62634 ?auto_62612 ) ( not ( = ?auto_62624 ?auto_62634 ) ) ( not ( = ?auto_62620 ?auto_62634 ) ) ( not ( = ?auto_62630 ?auto_62634 ) ) ( not ( = ?auto_62625 ?auto_62634 ) ) ( AVAILABLE ?auto_62634 ) ( SURFACE-AT ?auto_62616 ?auto_62612 ) ( ON ?auto_62616 ?auto_62632 ) ( CLEAR ?auto_62616 ) ( not ( = ?auto_62606 ?auto_62632 ) ) ( not ( = ?auto_62607 ?auto_62632 ) ) ( not ( = ?auto_62623 ?auto_62632 ) ) ( not ( = ?auto_62618 ?auto_62632 ) ) ( not ( = ?auto_62633 ?auto_62632 ) ) ( not ( = ?auto_62616 ?auto_62632 ) ) ( not ( = ?auto_62609 ?auto_62632 ) ) ( not ( = ?auto_62628 ?auto_62632 ) ) ( IS-CRATE ?auto_62628 ) ( not ( = ?auto_62606 ?auto_62631 ) ) ( not ( = ?auto_62607 ?auto_62631 ) ) ( not ( = ?auto_62623 ?auto_62631 ) ) ( not ( = ?auto_62618 ?auto_62631 ) ) ( not ( = ?auto_62633 ?auto_62631 ) ) ( not ( = ?auto_62616 ?auto_62631 ) ) ( not ( = ?auto_62609 ?auto_62631 ) ) ( not ( = ?auto_62628 ?auto_62631 ) ) ( not ( = ?auto_62632 ?auto_62631 ) ) ( not ( = ?auto_62615 ?auto_62629 ) ) ( not ( = ?auto_62626 ?auto_62615 ) ) ( not ( = ?auto_62617 ?auto_62615 ) ) ( not ( = ?auto_62627 ?auto_62615 ) ) ( not ( = ?auto_62612 ?auto_62615 ) ) ( HOIST-AT ?auto_62622 ?auto_62615 ) ( not ( = ?auto_62624 ?auto_62622 ) ) ( not ( = ?auto_62620 ?auto_62622 ) ) ( not ( = ?auto_62630 ?auto_62622 ) ) ( not ( = ?auto_62625 ?auto_62622 ) ) ( not ( = ?auto_62634 ?auto_62622 ) ) ( AVAILABLE ?auto_62622 ) ( SURFACE-AT ?auto_62628 ?auto_62615 ) ( ON ?auto_62628 ?auto_62619 ) ( CLEAR ?auto_62628 ) ( not ( = ?auto_62606 ?auto_62619 ) ) ( not ( = ?auto_62607 ?auto_62619 ) ) ( not ( = ?auto_62623 ?auto_62619 ) ) ( not ( = ?auto_62618 ?auto_62619 ) ) ( not ( = ?auto_62633 ?auto_62619 ) ) ( not ( = ?auto_62616 ?auto_62619 ) ) ( not ( = ?auto_62609 ?auto_62619 ) ) ( not ( = ?auto_62628 ?auto_62619 ) ) ( not ( = ?auto_62632 ?auto_62619 ) ) ( not ( = ?auto_62631 ?auto_62619 ) ) ( IS-CRATE ?auto_62631 ) ( not ( = ?auto_62606 ?auto_62614 ) ) ( not ( = ?auto_62607 ?auto_62614 ) ) ( not ( = ?auto_62623 ?auto_62614 ) ) ( not ( = ?auto_62618 ?auto_62614 ) ) ( not ( = ?auto_62633 ?auto_62614 ) ) ( not ( = ?auto_62616 ?auto_62614 ) ) ( not ( = ?auto_62609 ?auto_62614 ) ) ( not ( = ?auto_62628 ?auto_62614 ) ) ( not ( = ?auto_62632 ?auto_62614 ) ) ( not ( = ?auto_62631 ?auto_62614 ) ) ( not ( = ?auto_62619 ?auto_62614 ) ) ( AVAILABLE ?auto_62620 ) ( SURFACE-AT ?auto_62631 ?auto_62626 ) ( ON ?auto_62631 ?auto_62613 ) ( CLEAR ?auto_62631 ) ( not ( = ?auto_62606 ?auto_62613 ) ) ( not ( = ?auto_62607 ?auto_62613 ) ) ( not ( = ?auto_62623 ?auto_62613 ) ) ( not ( = ?auto_62618 ?auto_62613 ) ) ( not ( = ?auto_62633 ?auto_62613 ) ) ( not ( = ?auto_62616 ?auto_62613 ) ) ( not ( = ?auto_62609 ?auto_62613 ) ) ( not ( = ?auto_62628 ?auto_62613 ) ) ( not ( = ?auto_62632 ?auto_62613 ) ) ( not ( = ?auto_62631 ?auto_62613 ) ) ( not ( = ?auto_62619 ?auto_62613 ) ) ( not ( = ?auto_62614 ?auto_62613 ) ) ( IS-CRATE ?auto_62614 ) ( not ( = ?auto_62606 ?auto_62608 ) ) ( not ( = ?auto_62607 ?auto_62608 ) ) ( not ( = ?auto_62623 ?auto_62608 ) ) ( not ( = ?auto_62618 ?auto_62608 ) ) ( not ( = ?auto_62633 ?auto_62608 ) ) ( not ( = ?auto_62616 ?auto_62608 ) ) ( not ( = ?auto_62609 ?auto_62608 ) ) ( not ( = ?auto_62628 ?auto_62608 ) ) ( not ( = ?auto_62632 ?auto_62608 ) ) ( not ( = ?auto_62631 ?auto_62608 ) ) ( not ( = ?auto_62619 ?auto_62608 ) ) ( not ( = ?auto_62614 ?auto_62608 ) ) ( not ( = ?auto_62613 ?auto_62608 ) ) ( AVAILABLE ?auto_62625 ) ( SURFACE-AT ?auto_62614 ?auto_62627 ) ( ON ?auto_62614 ?auto_62621 ) ( CLEAR ?auto_62614 ) ( not ( = ?auto_62606 ?auto_62621 ) ) ( not ( = ?auto_62607 ?auto_62621 ) ) ( not ( = ?auto_62623 ?auto_62621 ) ) ( not ( = ?auto_62618 ?auto_62621 ) ) ( not ( = ?auto_62633 ?auto_62621 ) ) ( not ( = ?auto_62616 ?auto_62621 ) ) ( not ( = ?auto_62609 ?auto_62621 ) ) ( not ( = ?auto_62628 ?auto_62621 ) ) ( not ( = ?auto_62632 ?auto_62621 ) ) ( not ( = ?auto_62631 ?auto_62621 ) ) ( not ( = ?auto_62619 ?auto_62621 ) ) ( not ( = ?auto_62614 ?auto_62621 ) ) ( not ( = ?auto_62613 ?auto_62621 ) ) ( not ( = ?auto_62608 ?auto_62621 ) ) ( SURFACE-AT ?auto_62610 ?auto_62629 ) ( CLEAR ?auto_62610 ) ( IS-CRATE ?auto_62608 ) ( not ( = ?auto_62606 ?auto_62610 ) ) ( not ( = ?auto_62607 ?auto_62610 ) ) ( not ( = ?auto_62623 ?auto_62610 ) ) ( not ( = ?auto_62618 ?auto_62610 ) ) ( not ( = ?auto_62633 ?auto_62610 ) ) ( not ( = ?auto_62616 ?auto_62610 ) ) ( not ( = ?auto_62609 ?auto_62610 ) ) ( not ( = ?auto_62628 ?auto_62610 ) ) ( not ( = ?auto_62632 ?auto_62610 ) ) ( not ( = ?auto_62631 ?auto_62610 ) ) ( not ( = ?auto_62619 ?auto_62610 ) ) ( not ( = ?auto_62614 ?auto_62610 ) ) ( not ( = ?auto_62613 ?auto_62610 ) ) ( not ( = ?auto_62608 ?auto_62610 ) ) ( not ( = ?auto_62621 ?auto_62610 ) ) ( AVAILABLE ?auto_62624 ) ( IN ?auto_62608 ?auto_62611 ) ( TRUCK-AT ?auto_62611 ?auto_62635 ) ( not ( = ?auto_62635 ?auto_62629 ) ) ( not ( = ?auto_62626 ?auto_62635 ) ) ( not ( = ?auto_62617 ?auto_62635 ) ) ( not ( = ?auto_62627 ?auto_62635 ) ) ( not ( = ?auto_62612 ?auto_62635 ) ) ( not ( = ?auto_62615 ?auto_62635 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_62611 ?auto_62635 ?auto_62629 )
      ( MAKE-ON ?auto_62606 ?auto_62607 )
      ( MAKE-ON-VERIFY ?auto_62606 ?auto_62607 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62636 - SURFACE
      ?auto_62637 - SURFACE
    )
    :vars
    (
      ?auto_62655 - HOIST
      ?auto_62656 - PLACE
      ?auto_62650 - PLACE
      ?auto_62661 - HOIST
      ?auto_62648 - SURFACE
      ?auto_62641 - SURFACE
      ?auto_62642 - PLACE
      ?auto_62657 - HOIST
      ?auto_62639 - SURFACE
      ?auto_62658 - SURFACE
      ?auto_62643 - PLACE
      ?auto_62651 - HOIST
      ?auto_62646 - SURFACE
      ?auto_62644 - SURFACE
      ?auto_62653 - PLACE
      ?auto_62640 - HOIST
      ?auto_62638 - SURFACE
      ?auto_62654 - SURFACE
      ?auto_62665 - PLACE
      ?auto_62662 - HOIST
      ?auto_62647 - SURFACE
      ?auto_62649 - SURFACE
      ?auto_62664 - SURFACE
      ?auto_62659 - SURFACE
      ?auto_62663 - SURFACE
      ?auto_62645 - SURFACE
      ?auto_62652 - TRUCK
      ?auto_62660 - PLACE
      ?auto_62666 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_62655 ?auto_62656 ) ( IS-CRATE ?auto_62636 ) ( not ( = ?auto_62636 ?auto_62637 ) ) ( not ( = ?auto_62650 ?auto_62656 ) ) ( HOIST-AT ?auto_62661 ?auto_62650 ) ( not ( = ?auto_62655 ?auto_62661 ) ) ( SURFACE-AT ?auto_62636 ?auto_62650 ) ( ON ?auto_62636 ?auto_62648 ) ( CLEAR ?auto_62636 ) ( not ( = ?auto_62636 ?auto_62648 ) ) ( not ( = ?auto_62637 ?auto_62648 ) ) ( IS-CRATE ?auto_62637 ) ( not ( = ?auto_62636 ?auto_62641 ) ) ( not ( = ?auto_62637 ?auto_62641 ) ) ( not ( = ?auto_62648 ?auto_62641 ) ) ( not ( = ?auto_62642 ?auto_62656 ) ) ( not ( = ?auto_62650 ?auto_62642 ) ) ( HOIST-AT ?auto_62657 ?auto_62642 ) ( not ( = ?auto_62655 ?auto_62657 ) ) ( not ( = ?auto_62661 ?auto_62657 ) ) ( AVAILABLE ?auto_62657 ) ( SURFACE-AT ?auto_62637 ?auto_62642 ) ( ON ?auto_62637 ?auto_62639 ) ( CLEAR ?auto_62637 ) ( not ( = ?auto_62636 ?auto_62639 ) ) ( not ( = ?auto_62637 ?auto_62639 ) ) ( not ( = ?auto_62648 ?auto_62639 ) ) ( not ( = ?auto_62641 ?auto_62639 ) ) ( IS-CRATE ?auto_62641 ) ( not ( = ?auto_62636 ?auto_62658 ) ) ( not ( = ?auto_62637 ?auto_62658 ) ) ( not ( = ?auto_62648 ?auto_62658 ) ) ( not ( = ?auto_62641 ?auto_62658 ) ) ( not ( = ?auto_62639 ?auto_62658 ) ) ( not ( = ?auto_62643 ?auto_62656 ) ) ( not ( = ?auto_62650 ?auto_62643 ) ) ( not ( = ?auto_62642 ?auto_62643 ) ) ( HOIST-AT ?auto_62651 ?auto_62643 ) ( not ( = ?auto_62655 ?auto_62651 ) ) ( not ( = ?auto_62661 ?auto_62651 ) ) ( not ( = ?auto_62657 ?auto_62651 ) ) ( SURFACE-AT ?auto_62641 ?auto_62643 ) ( ON ?auto_62641 ?auto_62646 ) ( CLEAR ?auto_62641 ) ( not ( = ?auto_62636 ?auto_62646 ) ) ( not ( = ?auto_62637 ?auto_62646 ) ) ( not ( = ?auto_62648 ?auto_62646 ) ) ( not ( = ?auto_62641 ?auto_62646 ) ) ( not ( = ?auto_62639 ?auto_62646 ) ) ( not ( = ?auto_62658 ?auto_62646 ) ) ( IS-CRATE ?auto_62658 ) ( not ( = ?auto_62636 ?auto_62644 ) ) ( not ( = ?auto_62637 ?auto_62644 ) ) ( not ( = ?auto_62648 ?auto_62644 ) ) ( not ( = ?auto_62641 ?auto_62644 ) ) ( not ( = ?auto_62639 ?auto_62644 ) ) ( not ( = ?auto_62658 ?auto_62644 ) ) ( not ( = ?auto_62646 ?auto_62644 ) ) ( not ( = ?auto_62653 ?auto_62656 ) ) ( not ( = ?auto_62650 ?auto_62653 ) ) ( not ( = ?auto_62642 ?auto_62653 ) ) ( not ( = ?auto_62643 ?auto_62653 ) ) ( HOIST-AT ?auto_62640 ?auto_62653 ) ( not ( = ?auto_62655 ?auto_62640 ) ) ( not ( = ?auto_62661 ?auto_62640 ) ) ( not ( = ?auto_62657 ?auto_62640 ) ) ( not ( = ?auto_62651 ?auto_62640 ) ) ( AVAILABLE ?auto_62640 ) ( SURFACE-AT ?auto_62658 ?auto_62653 ) ( ON ?auto_62658 ?auto_62638 ) ( CLEAR ?auto_62658 ) ( not ( = ?auto_62636 ?auto_62638 ) ) ( not ( = ?auto_62637 ?auto_62638 ) ) ( not ( = ?auto_62648 ?auto_62638 ) ) ( not ( = ?auto_62641 ?auto_62638 ) ) ( not ( = ?auto_62639 ?auto_62638 ) ) ( not ( = ?auto_62658 ?auto_62638 ) ) ( not ( = ?auto_62646 ?auto_62638 ) ) ( not ( = ?auto_62644 ?auto_62638 ) ) ( IS-CRATE ?auto_62644 ) ( not ( = ?auto_62636 ?auto_62654 ) ) ( not ( = ?auto_62637 ?auto_62654 ) ) ( not ( = ?auto_62648 ?auto_62654 ) ) ( not ( = ?auto_62641 ?auto_62654 ) ) ( not ( = ?auto_62639 ?auto_62654 ) ) ( not ( = ?auto_62658 ?auto_62654 ) ) ( not ( = ?auto_62646 ?auto_62654 ) ) ( not ( = ?auto_62644 ?auto_62654 ) ) ( not ( = ?auto_62638 ?auto_62654 ) ) ( not ( = ?auto_62665 ?auto_62656 ) ) ( not ( = ?auto_62650 ?auto_62665 ) ) ( not ( = ?auto_62642 ?auto_62665 ) ) ( not ( = ?auto_62643 ?auto_62665 ) ) ( not ( = ?auto_62653 ?auto_62665 ) ) ( HOIST-AT ?auto_62662 ?auto_62665 ) ( not ( = ?auto_62655 ?auto_62662 ) ) ( not ( = ?auto_62661 ?auto_62662 ) ) ( not ( = ?auto_62657 ?auto_62662 ) ) ( not ( = ?auto_62651 ?auto_62662 ) ) ( not ( = ?auto_62640 ?auto_62662 ) ) ( AVAILABLE ?auto_62662 ) ( SURFACE-AT ?auto_62644 ?auto_62665 ) ( ON ?auto_62644 ?auto_62647 ) ( CLEAR ?auto_62644 ) ( not ( = ?auto_62636 ?auto_62647 ) ) ( not ( = ?auto_62637 ?auto_62647 ) ) ( not ( = ?auto_62648 ?auto_62647 ) ) ( not ( = ?auto_62641 ?auto_62647 ) ) ( not ( = ?auto_62639 ?auto_62647 ) ) ( not ( = ?auto_62658 ?auto_62647 ) ) ( not ( = ?auto_62646 ?auto_62647 ) ) ( not ( = ?auto_62644 ?auto_62647 ) ) ( not ( = ?auto_62638 ?auto_62647 ) ) ( not ( = ?auto_62654 ?auto_62647 ) ) ( IS-CRATE ?auto_62654 ) ( not ( = ?auto_62636 ?auto_62649 ) ) ( not ( = ?auto_62637 ?auto_62649 ) ) ( not ( = ?auto_62648 ?auto_62649 ) ) ( not ( = ?auto_62641 ?auto_62649 ) ) ( not ( = ?auto_62639 ?auto_62649 ) ) ( not ( = ?auto_62658 ?auto_62649 ) ) ( not ( = ?auto_62646 ?auto_62649 ) ) ( not ( = ?auto_62644 ?auto_62649 ) ) ( not ( = ?auto_62638 ?auto_62649 ) ) ( not ( = ?auto_62654 ?auto_62649 ) ) ( not ( = ?auto_62647 ?auto_62649 ) ) ( AVAILABLE ?auto_62661 ) ( SURFACE-AT ?auto_62654 ?auto_62650 ) ( ON ?auto_62654 ?auto_62664 ) ( CLEAR ?auto_62654 ) ( not ( = ?auto_62636 ?auto_62664 ) ) ( not ( = ?auto_62637 ?auto_62664 ) ) ( not ( = ?auto_62648 ?auto_62664 ) ) ( not ( = ?auto_62641 ?auto_62664 ) ) ( not ( = ?auto_62639 ?auto_62664 ) ) ( not ( = ?auto_62658 ?auto_62664 ) ) ( not ( = ?auto_62646 ?auto_62664 ) ) ( not ( = ?auto_62644 ?auto_62664 ) ) ( not ( = ?auto_62638 ?auto_62664 ) ) ( not ( = ?auto_62654 ?auto_62664 ) ) ( not ( = ?auto_62647 ?auto_62664 ) ) ( not ( = ?auto_62649 ?auto_62664 ) ) ( IS-CRATE ?auto_62649 ) ( not ( = ?auto_62636 ?auto_62659 ) ) ( not ( = ?auto_62637 ?auto_62659 ) ) ( not ( = ?auto_62648 ?auto_62659 ) ) ( not ( = ?auto_62641 ?auto_62659 ) ) ( not ( = ?auto_62639 ?auto_62659 ) ) ( not ( = ?auto_62658 ?auto_62659 ) ) ( not ( = ?auto_62646 ?auto_62659 ) ) ( not ( = ?auto_62644 ?auto_62659 ) ) ( not ( = ?auto_62638 ?auto_62659 ) ) ( not ( = ?auto_62654 ?auto_62659 ) ) ( not ( = ?auto_62647 ?auto_62659 ) ) ( not ( = ?auto_62649 ?auto_62659 ) ) ( not ( = ?auto_62664 ?auto_62659 ) ) ( AVAILABLE ?auto_62651 ) ( SURFACE-AT ?auto_62649 ?auto_62643 ) ( ON ?auto_62649 ?auto_62663 ) ( CLEAR ?auto_62649 ) ( not ( = ?auto_62636 ?auto_62663 ) ) ( not ( = ?auto_62637 ?auto_62663 ) ) ( not ( = ?auto_62648 ?auto_62663 ) ) ( not ( = ?auto_62641 ?auto_62663 ) ) ( not ( = ?auto_62639 ?auto_62663 ) ) ( not ( = ?auto_62658 ?auto_62663 ) ) ( not ( = ?auto_62646 ?auto_62663 ) ) ( not ( = ?auto_62644 ?auto_62663 ) ) ( not ( = ?auto_62638 ?auto_62663 ) ) ( not ( = ?auto_62654 ?auto_62663 ) ) ( not ( = ?auto_62647 ?auto_62663 ) ) ( not ( = ?auto_62649 ?auto_62663 ) ) ( not ( = ?auto_62664 ?auto_62663 ) ) ( not ( = ?auto_62659 ?auto_62663 ) ) ( SURFACE-AT ?auto_62645 ?auto_62656 ) ( CLEAR ?auto_62645 ) ( IS-CRATE ?auto_62659 ) ( not ( = ?auto_62636 ?auto_62645 ) ) ( not ( = ?auto_62637 ?auto_62645 ) ) ( not ( = ?auto_62648 ?auto_62645 ) ) ( not ( = ?auto_62641 ?auto_62645 ) ) ( not ( = ?auto_62639 ?auto_62645 ) ) ( not ( = ?auto_62658 ?auto_62645 ) ) ( not ( = ?auto_62646 ?auto_62645 ) ) ( not ( = ?auto_62644 ?auto_62645 ) ) ( not ( = ?auto_62638 ?auto_62645 ) ) ( not ( = ?auto_62654 ?auto_62645 ) ) ( not ( = ?auto_62647 ?auto_62645 ) ) ( not ( = ?auto_62649 ?auto_62645 ) ) ( not ( = ?auto_62664 ?auto_62645 ) ) ( not ( = ?auto_62659 ?auto_62645 ) ) ( not ( = ?auto_62663 ?auto_62645 ) ) ( AVAILABLE ?auto_62655 ) ( TRUCK-AT ?auto_62652 ?auto_62660 ) ( not ( = ?auto_62660 ?auto_62656 ) ) ( not ( = ?auto_62650 ?auto_62660 ) ) ( not ( = ?auto_62642 ?auto_62660 ) ) ( not ( = ?auto_62643 ?auto_62660 ) ) ( not ( = ?auto_62653 ?auto_62660 ) ) ( not ( = ?auto_62665 ?auto_62660 ) ) ( HOIST-AT ?auto_62666 ?auto_62660 ) ( LIFTING ?auto_62666 ?auto_62659 ) ( not ( = ?auto_62655 ?auto_62666 ) ) ( not ( = ?auto_62661 ?auto_62666 ) ) ( not ( = ?auto_62657 ?auto_62666 ) ) ( not ( = ?auto_62651 ?auto_62666 ) ) ( not ( = ?auto_62640 ?auto_62666 ) ) ( not ( = ?auto_62662 ?auto_62666 ) ) )
    :subtasks
    ( ( !LOAD ?auto_62666 ?auto_62659 ?auto_62652 ?auto_62660 )
      ( MAKE-ON ?auto_62636 ?auto_62637 )
      ( MAKE-ON-VERIFY ?auto_62636 ?auto_62637 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62667 - SURFACE
      ?auto_62668 - SURFACE
    )
    :vars
    (
      ?auto_62680 - HOIST
      ?auto_62681 - PLACE
      ?auto_62692 - PLACE
      ?auto_62678 - HOIST
      ?auto_62697 - SURFACE
      ?auto_62671 - SURFACE
      ?auto_62670 - PLACE
      ?auto_62682 - HOIST
      ?auto_62693 - SURFACE
      ?auto_62683 - SURFACE
      ?auto_62695 - PLACE
      ?auto_62690 - HOIST
      ?auto_62673 - SURFACE
      ?auto_62685 - SURFACE
      ?auto_62677 - PLACE
      ?auto_62672 - HOIST
      ?auto_62686 - SURFACE
      ?auto_62679 - SURFACE
      ?auto_62675 - PLACE
      ?auto_62689 - HOIST
      ?auto_62674 - SURFACE
      ?auto_62669 - SURFACE
      ?auto_62694 - SURFACE
      ?auto_62684 - SURFACE
      ?auto_62691 - SURFACE
      ?auto_62696 - SURFACE
      ?auto_62687 - TRUCK
      ?auto_62676 - PLACE
      ?auto_62688 - HOIST
      ?auto_62698 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62680 ?auto_62681 ) ( IS-CRATE ?auto_62667 ) ( not ( = ?auto_62667 ?auto_62668 ) ) ( not ( = ?auto_62692 ?auto_62681 ) ) ( HOIST-AT ?auto_62678 ?auto_62692 ) ( not ( = ?auto_62680 ?auto_62678 ) ) ( SURFACE-AT ?auto_62667 ?auto_62692 ) ( ON ?auto_62667 ?auto_62697 ) ( CLEAR ?auto_62667 ) ( not ( = ?auto_62667 ?auto_62697 ) ) ( not ( = ?auto_62668 ?auto_62697 ) ) ( IS-CRATE ?auto_62668 ) ( not ( = ?auto_62667 ?auto_62671 ) ) ( not ( = ?auto_62668 ?auto_62671 ) ) ( not ( = ?auto_62697 ?auto_62671 ) ) ( not ( = ?auto_62670 ?auto_62681 ) ) ( not ( = ?auto_62692 ?auto_62670 ) ) ( HOIST-AT ?auto_62682 ?auto_62670 ) ( not ( = ?auto_62680 ?auto_62682 ) ) ( not ( = ?auto_62678 ?auto_62682 ) ) ( AVAILABLE ?auto_62682 ) ( SURFACE-AT ?auto_62668 ?auto_62670 ) ( ON ?auto_62668 ?auto_62693 ) ( CLEAR ?auto_62668 ) ( not ( = ?auto_62667 ?auto_62693 ) ) ( not ( = ?auto_62668 ?auto_62693 ) ) ( not ( = ?auto_62697 ?auto_62693 ) ) ( not ( = ?auto_62671 ?auto_62693 ) ) ( IS-CRATE ?auto_62671 ) ( not ( = ?auto_62667 ?auto_62683 ) ) ( not ( = ?auto_62668 ?auto_62683 ) ) ( not ( = ?auto_62697 ?auto_62683 ) ) ( not ( = ?auto_62671 ?auto_62683 ) ) ( not ( = ?auto_62693 ?auto_62683 ) ) ( not ( = ?auto_62695 ?auto_62681 ) ) ( not ( = ?auto_62692 ?auto_62695 ) ) ( not ( = ?auto_62670 ?auto_62695 ) ) ( HOIST-AT ?auto_62690 ?auto_62695 ) ( not ( = ?auto_62680 ?auto_62690 ) ) ( not ( = ?auto_62678 ?auto_62690 ) ) ( not ( = ?auto_62682 ?auto_62690 ) ) ( SURFACE-AT ?auto_62671 ?auto_62695 ) ( ON ?auto_62671 ?auto_62673 ) ( CLEAR ?auto_62671 ) ( not ( = ?auto_62667 ?auto_62673 ) ) ( not ( = ?auto_62668 ?auto_62673 ) ) ( not ( = ?auto_62697 ?auto_62673 ) ) ( not ( = ?auto_62671 ?auto_62673 ) ) ( not ( = ?auto_62693 ?auto_62673 ) ) ( not ( = ?auto_62683 ?auto_62673 ) ) ( IS-CRATE ?auto_62683 ) ( not ( = ?auto_62667 ?auto_62685 ) ) ( not ( = ?auto_62668 ?auto_62685 ) ) ( not ( = ?auto_62697 ?auto_62685 ) ) ( not ( = ?auto_62671 ?auto_62685 ) ) ( not ( = ?auto_62693 ?auto_62685 ) ) ( not ( = ?auto_62683 ?auto_62685 ) ) ( not ( = ?auto_62673 ?auto_62685 ) ) ( not ( = ?auto_62677 ?auto_62681 ) ) ( not ( = ?auto_62692 ?auto_62677 ) ) ( not ( = ?auto_62670 ?auto_62677 ) ) ( not ( = ?auto_62695 ?auto_62677 ) ) ( HOIST-AT ?auto_62672 ?auto_62677 ) ( not ( = ?auto_62680 ?auto_62672 ) ) ( not ( = ?auto_62678 ?auto_62672 ) ) ( not ( = ?auto_62682 ?auto_62672 ) ) ( not ( = ?auto_62690 ?auto_62672 ) ) ( AVAILABLE ?auto_62672 ) ( SURFACE-AT ?auto_62683 ?auto_62677 ) ( ON ?auto_62683 ?auto_62686 ) ( CLEAR ?auto_62683 ) ( not ( = ?auto_62667 ?auto_62686 ) ) ( not ( = ?auto_62668 ?auto_62686 ) ) ( not ( = ?auto_62697 ?auto_62686 ) ) ( not ( = ?auto_62671 ?auto_62686 ) ) ( not ( = ?auto_62693 ?auto_62686 ) ) ( not ( = ?auto_62683 ?auto_62686 ) ) ( not ( = ?auto_62673 ?auto_62686 ) ) ( not ( = ?auto_62685 ?auto_62686 ) ) ( IS-CRATE ?auto_62685 ) ( not ( = ?auto_62667 ?auto_62679 ) ) ( not ( = ?auto_62668 ?auto_62679 ) ) ( not ( = ?auto_62697 ?auto_62679 ) ) ( not ( = ?auto_62671 ?auto_62679 ) ) ( not ( = ?auto_62693 ?auto_62679 ) ) ( not ( = ?auto_62683 ?auto_62679 ) ) ( not ( = ?auto_62673 ?auto_62679 ) ) ( not ( = ?auto_62685 ?auto_62679 ) ) ( not ( = ?auto_62686 ?auto_62679 ) ) ( not ( = ?auto_62675 ?auto_62681 ) ) ( not ( = ?auto_62692 ?auto_62675 ) ) ( not ( = ?auto_62670 ?auto_62675 ) ) ( not ( = ?auto_62695 ?auto_62675 ) ) ( not ( = ?auto_62677 ?auto_62675 ) ) ( HOIST-AT ?auto_62689 ?auto_62675 ) ( not ( = ?auto_62680 ?auto_62689 ) ) ( not ( = ?auto_62678 ?auto_62689 ) ) ( not ( = ?auto_62682 ?auto_62689 ) ) ( not ( = ?auto_62690 ?auto_62689 ) ) ( not ( = ?auto_62672 ?auto_62689 ) ) ( AVAILABLE ?auto_62689 ) ( SURFACE-AT ?auto_62685 ?auto_62675 ) ( ON ?auto_62685 ?auto_62674 ) ( CLEAR ?auto_62685 ) ( not ( = ?auto_62667 ?auto_62674 ) ) ( not ( = ?auto_62668 ?auto_62674 ) ) ( not ( = ?auto_62697 ?auto_62674 ) ) ( not ( = ?auto_62671 ?auto_62674 ) ) ( not ( = ?auto_62693 ?auto_62674 ) ) ( not ( = ?auto_62683 ?auto_62674 ) ) ( not ( = ?auto_62673 ?auto_62674 ) ) ( not ( = ?auto_62685 ?auto_62674 ) ) ( not ( = ?auto_62686 ?auto_62674 ) ) ( not ( = ?auto_62679 ?auto_62674 ) ) ( IS-CRATE ?auto_62679 ) ( not ( = ?auto_62667 ?auto_62669 ) ) ( not ( = ?auto_62668 ?auto_62669 ) ) ( not ( = ?auto_62697 ?auto_62669 ) ) ( not ( = ?auto_62671 ?auto_62669 ) ) ( not ( = ?auto_62693 ?auto_62669 ) ) ( not ( = ?auto_62683 ?auto_62669 ) ) ( not ( = ?auto_62673 ?auto_62669 ) ) ( not ( = ?auto_62685 ?auto_62669 ) ) ( not ( = ?auto_62686 ?auto_62669 ) ) ( not ( = ?auto_62679 ?auto_62669 ) ) ( not ( = ?auto_62674 ?auto_62669 ) ) ( AVAILABLE ?auto_62678 ) ( SURFACE-AT ?auto_62679 ?auto_62692 ) ( ON ?auto_62679 ?auto_62694 ) ( CLEAR ?auto_62679 ) ( not ( = ?auto_62667 ?auto_62694 ) ) ( not ( = ?auto_62668 ?auto_62694 ) ) ( not ( = ?auto_62697 ?auto_62694 ) ) ( not ( = ?auto_62671 ?auto_62694 ) ) ( not ( = ?auto_62693 ?auto_62694 ) ) ( not ( = ?auto_62683 ?auto_62694 ) ) ( not ( = ?auto_62673 ?auto_62694 ) ) ( not ( = ?auto_62685 ?auto_62694 ) ) ( not ( = ?auto_62686 ?auto_62694 ) ) ( not ( = ?auto_62679 ?auto_62694 ) ) ( not ( = ?auto_62674 ?auto_62694 ) ) ( not ( = ?auto_62669 ?auto_62694 ) ) ( IS-CRATE ?auto_62669 ) ( not ( = ?auto_62667 ?auto_62684 ) ) ( not ( = ?auto_62668 ?auto_62684 ) ) ( not ( = ?auto_62697 ?auto_62684 ) ) ( not ( = ?auto_62671 ?auto_62684 ) ) ( not ( = ?auto_62693 ?auto_62684 ) ) ( not ( = ?auto_62683 ?auto_62684 ) ) ( not ( = ?auto_62673 ?auto_62684 ) ) ( not ( = ?auto_62685 ?auto_62684 ) ) ( not ( = ?auto_62686 ?auto_62684 ) ) ( not ( = ?auto_62679 ?auto_62684 ) ) ( not ( = ?auto_62674 ?auto_62684 ) ) ( not ( = ?auto_62669 ?auto_62684 ) ) ( not ( = ?auto_62694 ?auto_62684 ) ) ( AVAILABLE ?auto_62690 ) ( SURFACE-AT ?auto_62669 ?auto_62695 ) ( ON ?auto_62669 ?auto_62691 ) ( CLEAR ?auto_62669 ) ( not ( = ?auto_62667 ?auto_62691 ) ) ( not ( = ?auto_62668 ?auto_62691 ) ) ( not ( = ?auto_62697 ?auto_62691 ) ) ( not ( = ?auto_62671 ?auto_62691 ) ) ( not ( = ?auto_62693 ?auto_62691 ) ) ( not ( = ?auto_62683 ?auto_62691 ) ) ( not ( = ?auto_62673 ?auto_62691 ) ) ( not ( = ?auto_62685 ?auto_62691 ) ) ( not ( = ?auto_62686 ?auto_62691 ) ) ( not ( = ?auto_62679 ?auto_62691 ) ) ( not ( = ?auto_62674 ?auto_62691 ) ) ( not ( = ?auto_62669 ?auto_62691 ) ) ( not ( = ?auto_62694 ?auto_62691 ) ) ( not ( = ?auto_62684 ?auto_62691 ) ) ( SURFACE-AT ?auto_62696 ?auto_62681 ) ( CLEAR ?auto_62696 ) ( IS-CRATE ?auto_62684 ) ( not ( = ?auto_62667 ?auto_62696 ) ) ( not ( = ?auto_62668 ?auto_62696 ) ) ( not ( = ?auto_62697 ?auto_62696 ) ) ( not ( = ?auto_62671 ?auto_62696 ) ) ( not ( = ?auto_62693 ?auto_62696 ) ) ( not ( = ?auto_62683 ?auto_62696 ) ) ( not ( = ?auto_62673 ?auto_62696 ) ) ( not ( = ?auto_62685 ?auto_62696 ) ) ( not ( = ?auto_62686 ?auto_62696 ) ) ( not ( = ?auto_62679 ?auto_62696 ) ) ( not ( = ?auto_62674 ?auto_62696 ) ) ( not ( = ?auto_62669 ?auto_62696 ) ) ( not ( = ?auto_62694 ?auto_62696 ) ) ( not ( = ?auto_62684 ?auto_62696 ) ) ( not ( = ?auto_62691 ?auto_62696 ) ) ( AVAILABLE ?auto_62680 ) ( TRUCK-AT ?auto_62687 ?auto_62676 ) ( not ( = ?auto_62676 ?auto_62681 ) ) ( not ( = ?auto_62692 ?auto_62676 ) ) ( not ( = ?auto_62670 ?auto_62676 ) ) ( not ( = ?auto_62695 ?auto_62676 ) ) ( not ( = ?auto_62677 ?auto_62676 ) ) ( not ( = ?auto_62675 ?auto_62676 ) ) ( HOIST-AT ?auto_62688 ?auto_62676 ) ( not ( = ?auto_62680 ?auto_62688 ) ) ( not ( = ?auto_62678 ?auto_62688 ) ) ( not ( = ?auto_62682 ?auto_62688 ) ) ( not ( = ?auto_62690 ?auto_62688 ) ) ( not ( = ?auto_62672 ?auto_62688 ) ) ( not ( = ?auto_62689 ?auto_62688 ) ) ( AVAILABLE ?auto_62688 ) ( SURFACE-AT ?auto_62684 ?auto_62676 ) ( ON ?auto_62684 ?auto_62698 ) ( CLEAR ?auto_62684 ) ( not ( = ?auto_62667 ?auto_62698 ) ) ( not ( = ?auto_62668 ?auto_62698 ) ) ( not ( = ?auto_62697 ?auto_62698 ) ) ( not ( = ?auto_62671 ?auto_62698 ) ) ( not ( = ?auto_62693 ?auto_62698 ) ) ( not ( = ?auto_62683 ?auto_62698 ) ) ( not ( = ?auto_62673 ?auto_62698 ) ) ( not ( = ?auto_62685 ?auto_62698 ) ) ( not ( = ?auto_62686 ?auto_62698 ) ) ( not ( = ?auto_62679 ?auto_62698 ) ) ( not ( = ?auto_62674 ?auto_62698 ) ) ( not ( = ?auto_62669 ?auto_62698 ) ) ( not ( = ?auto_62694 ?auto_62698 ) ) ( not ( = ?auto_62684 ?auto_62698 ) ) ( not ( = ?auto_62691 ?auto_62698 ) ) ( not ( = ?auto_62696 ?auto_62698 ) ) )
    :subtasks
    ( ( !LIFT ?auto_62688 ?auto_62684 ?auto_62698 ?auto_62676 )
      ( MAKE-ON ?auto_62667 ?auto_62668 )
      ( MAKE-ON-VERIFY ?auto_62667 ?auto_62668 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62699 - SURFACE
      ?auto_62700 - SURFACE
    )
    :vars
    (
      ?auto_62725 - HOIST
      ?auto_62702 - PLACE
      ?auto_62708 - PLACE
      ?auto_62704 - HOIST
      ?auto_62707 - SURFACE
      ?auto_62719 - SURFACE
      ?auto_62718 - PLACE
      ?auto_62726 - HOIST
      ?auto_62701 - SURFACE
      ?auto_62729 - SURFACE
      ?auto_62706 - PLACE
      ?auto_62714 - HOIST
      ?auto_62721 - SURFACE
      ?auto_62709 - SURFACE
      ?auto_62703 - PLACE
      ?auto_62720 - HOIST
      ?auto_62710 - SURFACE
      ?auto_62723 - SURFACE
      ?auto_62728 - PLACE
      ?auto_62713 - HOIST
      ?auto_62722 - SURFACE
      ?auto_62717 - SURFACE
      ?auto_62730 - SURFACE
      ?auto_62716 - SURFACE
      ?auto_62715 - SURFACE
      ?auto_62705 - SURFACE
      ?auto_62724 - PLACE
      ?auto_62712 - HOIST
      ?auto_62727 - SURFACE
      ?auto_62711 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_62725 ?auto_62702 ) ( IS-CRATE ?auto_62699 ) ( not ( = ?auto_62699 ?auto_62700 ) ) ( not ( = ?auto_62708 ?auto_62702 ) ) ( HOIST-AT ?auto_62704 ?auto_62708 ) ( not ( = ?auto_62725 ?auto_62704 ) ) ( SURFACE-AT ?auto_62699 ?auto_62708 ) ( ON ?auto_62699 ?auto_62707 ) ( CLEAR ?auto_62699 ) ( not ( = ?auto_62699 ?auto_62707 ) ) ( not ( = ?auto_62700 ?auto_62707 ) ) ( IS-CRATE ?auto_62700 ) ( not ( = ?auto_62699 ?auto_62719 ) ) ( not ( = ?auto_62700 ?auto_62719 ) ) ( not ( = ?auto_62707 ?auto_62719 ) ) ( not ( = ?auto_62718 ?auto_62702 ) ) ( not ( = ?auto_62708 ?auto_62718 ) ) ( HOIST-AT ?auto_62726 ?auto_62718 ) ( not ( = ?auto_62725 ?auto_62726 ) ) ( not ( = ?auto_62704 ?auto_62726 ) ) ( AVAILABLE ?auto_62726 ) ( SURFACE-AT ?auto_62700 ?auto_62718 ) ( ON ?auto_62700 ?auto_62701 ) ( CLEAR ?auto_62700 ) ( not ( = ?auto_62699 ?auto_62701 ) ) ( not ( = ?auto_62700 ?auto_62701 ) ) ( not ( = ?auto_62707 ?auto_62701 ) ) ( not ( = ?auto_62719 ?auto_62701 ) ) ( IS-CRATE ?auto_62719 ) ( not ( = ?auto_62699 ?auto_62729 ) ) ( not ( = ?auto_62700 ?auto_62729 ) ) ( not ( = ?auto_62707 ?auto_62729 ) ) ( not ( = ?auto_62719 ?auto_62729 ) ) ( not ( = ?auto_62701 ?auto_62729 ) ) ( not ( = ?auto_62706 ?auto_62702 ) ) ( not ( = ?auto_62708 ?auto_62706 ) ) ( not ( = ?auto_62718 ?auto_62706 ) ) ( HOIST-AT ?auto_62714 ?auto_62706 ) ( not ( = ?auto_62725 ?auto_62714 ) ) ( not ( = ?auto_62704 ?auto_62714 ) ) ( not ( = ?auto_62726 ?auto_62714 ) ) ( SURFACE-AT ?auto_62719 ?auto_62706 ) ( ON ?auto_62719 ?auto_62721 ) ( CLEAR ?auto_62719 ) ( not ( = ?auto_62699 ?auto_62721 ) ) ( not ( = ?auto_62700 ?auto_62721 ) ) ( not ( = ?auto_62707 ?auto_62721 ) ) ( not ( = ?auto_62719 ?auto_62721 ) ) ( not ( = ?auto_62701 ?auto_62721 ) ) ( not ( = ?auto_62729 ?auto_62721 ) ) ( IS-CRATE ?auto_62729 ) ( not ( = ?auto_62699 ?auto_62709 ) ) ( not ( = ?auto_62700 ?auto_62709 ) ) ( not ( = ?auto_62707 ?auto_62709 ) ) ( not ( = ?auto_62719 ?auto_62709 ) ) ( not ( = ?auto_62701 ?auto_62709 ) ) ( not ( = ?auto_62729 ?auto_62709 ) ) ( not ( = ?auto_62721 ?auto_62709 ) ) ( not ( = ?auto_62703 ?auto_62702 ) ) ( not ( = ?auto_62708 ?auto_62703 ) ) ( not ( = ?auto_62718 ?auto_62703 ) ) ( not ( = ?auto_62706 ?auto_62703 ) ) ( HOIST-AT ?auto_62720 ?auto_62703 ) ( not ( = ?auto_62725 ?auto_62720 ) ) ( not ( = ?auto_62704 ?auto_62720 ) ) ( not ( = ?auto_62726 ?auto_62720 ) ) ( not ( = ?auto_62714 ?auto_62720 ) ) ( AVAILABLE ?auto_62720 ) ( SURFACE-AT ?auto_62729 ?auto_62703 ) ( ON ?auto_62729 ?auto_62710 ) ( CLEAR ?auto_62729 ) ( not ( = ?auto_62699 ?auto_62710 ) ) ( not ( = ?auto_62700 ?auto_62710 ) ) ( not ( = ?auto_62707 ?auto_62710 ) ) ( not ( = ?auto_62719 ?auto_62710 ) ) ( not ( = ?auto_62701 ?auto_62710 ) ) ( not ( = ?auto_62729 ?auto_62710 ) ) ( not ( = ?auto_62721 ?auto_62710 ) ) ( not ( = ?auto_62709 ?auto_62710 ) ) ( IS-CRATE ?auto_62709 ) ( not ( = ?auto_62699 ?auto_62723 ) ) ( not ( = ?auto_62700 ?auto_62723 ) ) ( not ( = ?auto_62707 ?auto_62723 ) ) ( not ( = ?auto_62719 ?auto_62723 ) ) ( not ( = ?auto_62701 ?auto_62723 ) ) ( not ( = ?auto_62729 ?auto_62723 ) ) ( not ( = ?auto_62721 ?auto_62723 ) ) ( not ( = ?auto_62709 ?auto_62723 ) ) ( not ( = ?auto_62710 ?auto_62723 ) ) ( not ( = ?auto_62728 ?auto_62702 ) ) ( not ( = ?auto_62708 ?auto_62728 ) ) ( not ( = ?auto_62718 ?auto_62728 ) ) ( not ( = ?auto_62706 ?auto_62728 ) ) ( not ( = ?auto_62703 ?auto_62728 ) ) ( HOIST-AT ?auto_62713 ?auto_62728 ) ( not ( = ?auto_62725 ?auto_62713 ) ) ( not ( = ?auto_62704 ?auto_62713 ) ) ( not ( = ?auto_62726 ?auto_62713 ) ) ( not ( = ?auto_62714 ?auto_62713 ) ) ( not ( = ?auto_62720 ?auto_62713 ) ) ( AVAILABLE ?auto_62713 ) ( SURFACE-AT ?auto_62709 ?auto_62728 ) ( ON ?auto_62709 ?auto_62722 ) ( CLEAR ?auto_62709 ) ( not ( = ?auto_62699 ?auto_62722 ) ) ( not ( = ?auto_62700 ?auto_62722 ) ) ( not ( = ?auto_62707 ?auto_62722 ) ) ( not ( = ?auto_62719 ?auto_62722 ) ) ( not ( = ?auto_62701 ?auto_62722 ) ) ( not ( = ?auto_62729 ?auto_62722 ) ) ( not ( = ?auto_62721 ?auto_62722 ) ) ( not ( = ?auto_62709 ?auto_62722 ) ) ( not ( = ?auto_62710 ?auto_62722 ) ) ( not ( = ?auto_62723 ?auto_62722 ) ) ( IS-CRATE ?auto_62723 ) ( not ( = ?auto_62699 ?auto_62717 ) ) ( not ( = ?auto_62700 ?auto_62717 ) ) ( not ( = ?auto_62707 ?auto_62717 ) ) ( not ( = ?auto_62719 ?auto_62717 ) ) ( not ( = ?auto_62701 ?auto_62717 ) ) ( not ( = ?auto_62729 ?auto_62717 ) ) ( not ( = ?auto_62721 ?auto_62717 ) ) ( not ( = ?auto_62709 ?auto_62717 ) ) ( not ( = ?auto_62710 ?auto_62717 ) ) ( not ( = ?auto_62723 ?auto_62717 ) ) ( not ( = ?auto_62722 ?auto_62717 ) ) ( AVAILABLE ?auto_62704 ) ( SURFACE-AT ?auto_62723 ?auto_62708 ) ( ON ?auto_62723 ?auto_62730 ) ( CLEAR ?auto_62723 ) ( not ( = ?auto_62699 ?auto_62730 ) ) ( not ( = ?auto_62700 ?auto_62730 ) ) ( not ( = ?auto_62707 ?auto_62730 ) ) ( not ( = ?auto_62719 ?auto_62730 ) ) ( not ( = ?auto_62701 ?auto_62730 ) ) ( not ( = ?auto_62729 ?auto_62730 ) ) ( not ( = ?auto_62721 ?auto_62730 ) ) ( not ( = ?auto_62709 ?auto_62730 ) ) ( not ( = ?auto_62710 ?auto_62730 ) ) ( not ( = ?auto_62723 ?auto_62730 ) ) ( not ( = ?auto_62722 ?auto_62730 ) ) ( not ( = ?auto_62717 ?auto_62730 ) ) ( IS-CRATE ?auto_62717 ) ( not ( = ?auto_62699 ?auto_62716 ) ) ( not ( = ?auto_62700 ?auto_62716 ) ) ( not ( = ?auto_62707 ?auto_62716 ) ) ( not ( = ?auto_62719 ?auto_62716 ) ) ( not ( = ?auto_62701 ?auto_62716 ) ) ( not ( = ?auto_62729 ?auto_62716 ) ) ( not ( = ?auto_62721 ?auto_62716 ) ) ( not ( = ?auto_62709 ?auto_62716 ) ) ( not ( = ?auto_62710 ?auto_62716 ) ) ( not ( = ?auto_62723 ?auto_62716 ) ) ( not ( = ?auto_62722 ?auto_62716 ) ) ( not ( = ?auto_62717 ?auto_62716 ) ) ( not ( = ?auto_62730 ?auto_62716 ) ) ( AVAILABLE ?auto_62714 ) ( SURFACE-AT ?auto_62717 ?auto_62706 ) ( ON ?auto_62717 ?auto_62715 ) ( CLEAR ?auto_62717 ) ( not ( = ?auto_62699 ?auto_62715 ) ) ( not ( = ?auto_62700 ?auto_62715 ) ) ( not ( = ?auto_62707 ?auto_62715 ) ) ( not ( = ?auto_62719 ?auto_62715 ) ) ( not ( = ?auto_62701 ?auto_62715 ) ) ( not ( = ?auto_62729 ?auto_62715 ) ) ( not ( = ?auto_62721 ?auto_62715 ) ) ( not ( = ?auto_62709 ?auto_62715 ) ) ( not ( = ?auto_62710 ?auto_62715 ) ) ( not ( = ?auto_62723 ?auto_62715 ) ) ( not ( = ?auto_62722 ?auto_62715 ) ) ( not ( = ?auto_62717 ?auto_62715 ) ) ( not ( = ?auto_62730 ?auto_62715 ) ) ( not ( = ?auto_62716 ?auto_62715 ) ) ( SURFACE-AT ?auto_62705 ?auto_62702 ) ( CLEAR ?auto_62705 ) ( IS-CRATE ?auto_62716 ) ( not ( = ?auto_62699 ?auto_62705 ) ) ( not ( = ?auto_62700 ?auto_62705 ) ) ( not ( = ?auto_62707 ?auto_62705 ) ) ( not ( = ?auto_62719 ?auto_62705 ) ) ( not ( = ?auto_62701 ?auto_62705 ) ) ( not ( = ?auto_62729 ?auto_62705 ) ) ( not ( = ?auto_62721 ?auto_62705 ) ) ( not ( = ?auto_62709 ?auto_62705 ) ) ( not ( = ?auto_62710 ?auto_62705 ) ) ( not ( = ?auto_62723 ?auto_62705 ) ) ( not ( = ?auto_62722 ?auto_62705 ) ) ( not ( = ?auto_62717 ?auto_62705 ) ) ( not ( = ?auto_62730 ?auto_62705 ) ) ( not ( = ?auto_62716 ?auto_62705 ) ) ( not ( = ?auto_62715 ?auto_62705 ) ) ( AVAILABLE ?auto_62725 ) ( not ( = ?auto_62724 ?auto_62702 ) ) ( not ( = ?auto_62708 ?auto_62724 ) ) ( not ( = ?auto_62718 ?auto_62724 ) ) ( not ( = ?auto_62706 ?auto_62724 ) ) ( not ( = ?auto_62703 ?auto_62724 ) ) ( not ( = ?auto_62728 ?auto_62724 ) ) ( HOIST-AT ?auto_62712 ?auto_62724 ) ( not ( = ?auto_62725 ?auto_62712 ) ) ( not ( = ?auto_62704 ?auto_62712 ) ) ( not ( = ?auto_62726 ?auto_62712 ) ) ( not ( = ?auto_62714 ?auto_62712 ) ) ( not ( = ?auto_62720 ?auto_62712 ) ) ( not ( = ?auto_62713 ?auto_62712 ) ) ( AVAILABLE ?auto_62712 ) ( SURFACE-AT ?auto_62716 ?auto_62724 ) ( ON ?auto_62716 ?auto_62727 ) ( CLEAR ?auto_62716 ) ( not ( = ?auto_62699 ?auto_62727 ) ) ( not ( = ?auto_62700 ?auto_62727 ) ) ( not ( = ?auto_62707 ?auto_62727 ) ) ( not ( = ?auto_62719 ?auto_62727 ) ) ( not ( = ?auto_62701 ?auto_62727 ) ) ( not ( = ?auto_62729 ?auto_62727 ) ) ( not ( = ?auto_62721 ?auto_62727 ) ) ( not ( = ?auto_62709 ?auto_62727 ) ) ( not ( = ?auto_62710 ?auto_62727 ) ) ( not ( = ?auto_62723 ?auto_62727 ) ) ( not ( = ?auto_62722 ?auto_62727 ) ) ( not ( = ?auto_62717 ?auto_62727 ) ) ( not ( = ?auto_62730 ?auto_62727 ) ) ( not ( = ?auto_62716 ?auto_62727 ) ) ( not ( = ?auto_62715 ?auto_62727 ) ) ( not ( = ?auto_62705 ?auto_62727 ) ) ( TRUCK-AT ?auto_62711 ?auto_62702 ) )
    :subtasks
    ( ( !DRIVE ?auto_62711 ?auto_62702 ?auto_62724 )
      ( MAKE-ON ?auto_62699 ?auto_62700 )
      ( MAKE-ON-VERIFY ?auto_62699 ?auto_62700 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62733 - SURFACE
      ?auto_62734 - SURFACE
    )
    :vars
    (
      ?auto_62735 - HOIST
      ?auto_62736 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62735 ?auto_62736 ) ( SURFACE-AT ?auto_62734 ?auto_62736 ) ( CLEAR ?auto_62734 ) ( LIFTING ?auto_62735 ?auto_62733 ) ( IS-CRATE ?auto_62733 ) ( not ( = ?auto_62733 ?auto_62734 ) ) )
    :subtasks
    ( ( !DROP ?auto_62735 ?auto_62733 ?auto_62734 ?auto_62736 )
      ( MAKE-ON-VERIFY ?auto_62733 ?auto_62734 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62737 - SURFACE
      ?auto_62738 - SURFACE
    )
    :vars
    (
      ?auto_62739 - HOIST
      ?auto_62740 - PLACE
      ?auto_62741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_62739 ?auto_62740 ) ( SURFACE-AT ?auto_62738 ?auto_62740 ) ( CLEAR ?auto_62738 ) ( IS-CRATE ?auto_62737 ) ( not ( = ?auto_62737 ?auto_62738 ) ) ( TRUCK-AT ?auto_62741 ?auto_62740 ) ( AVAILABLE ?auto_62739 ) ( IN ?auto_62737 ?auto_62741 ) )
    :subtasks
    ( ( !UNLOAD ?auto_62739 ?auto_62737 ?auto_62741 ?auto_62740 )
      ( MAKE-ON ?auto_62737 ?auto_62738 )
      ( MAKE-ON-VERIFY ?auto_62737 ?auto_62738 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62742 - SURFACE
      ?auto_62743 - SURFACE
    )
    :vars
    (
      ?auto_62745 - HOIST
      ?auto_62746 - PLACE
      ?auto_62744 - TRUCK
      ?auto_62747 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62745 ?auto_62746 ) ( SURFACE-AT ?auto_62743 ?auto_62746 ) ( CLEAR ?auto_62743 ) ( IS-CRATE ?auto_62742 ) ( not ( = ?auto_62742 ?auto_62743 ) ) ( AVAILABLE ?auto_62745 ) ( IN ?auto_62742 ?auto_62744 ) ( TRUCK-AT ?auto_62744 ?auto_62747 ) ( not ( = ?auto_62747 ?auto_62746 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_62744 ?auto_62747 ?auto_62746 )
      ( MAKE-ON ?auto_62742 ?auto_62743 )
      ( MAKE-ON-VERIFY ?auto_62742 ?auto_62743 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62748 - SURFACE
      ?auto_62749 - SURFACE
    )
    :vars
    (
      ?auto_62752 - HOIST
      ?auto_62751 - PLACE
      ?auto_62753 - TRUCK
      ?auto_62750 - PLACE
      ?auto_62754 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_62752 ?auto_62751 ) ( SURFACE-AT ?auto_62749 ?auto_62751 ) ( CLEAR ?auto_62749 ) ( IS-CRATE ?auto_62748 ) ( not ( = ?auto_62748 ?auto_62749 ) ) ( AVAILABLE ?auto_62752 ) ( TRUCK-AT ?auto_62753 ?auto_62750 ) ( not ( = ?auto_62750 ?auto_62751 ) ) ( HOIST-AT ?auto_62754 ?auto_62750 ) ( LIFTING ?auto_62754 ?auto_62748 ) ( not ( = ?auto_62752 ?auto_62754 ) ) )
    :subtasks
    ( ( !LOAD ?auto_62754 ?auto_62748 ?auto_62753 ?auto_62750 )
      ( MAKE-ON ?auto_62748 ?auto_62749 )
      ( MAKE-ON-VERIFY ?auto_62748 ?auto_62749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62755 - SURFACE
      ?auto_62756 - SURFACE
    )
    :vars
    (
      ?auto_62760 - HOIST
      ?auto_62758 - PLACE
      ?auto_62757 - TRUCK
      ?auto_62759 - PLACE
      ?auto_62761 - HOIST
      ?auto_62762 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62760 ?auto_62758 ) ( SURFACE-AT ?auto_62756 ?auto_62758 ) ( CLEAR ?auto_62756 ) ( IS-CRATE ?auto_62755 ) ( not ( = ?auto_62755 ?auto_62756 ) ) ( AVAILABLE ?auto_62760 ) ( TRUCK-AT ?auto_62757 ?auto_62759 ) ( not ( = ?auto_62759 ?auto_62758 ) ) ( HOIST-AT ?auto_62761 ?auto_62759 ) ( not ( = ?auto_62760 ?auto_62761 ) ) ( AVAILABLE ?auto_62761 ) ( SURFACE-AT ?auto_62755 ?auto_62759 ) ( ON ?auto_62755 ?auto_62762 ) ( CLEAR ?auto_62755 ) ( not ( = ?auto_62755 ?auto_62762 ) ) ( not ( = ?auto_62756 ?auto_62762 ) ) )
    :subtasks
    ( ( !LIFT ?auto_62761 ?auto_62755 ?auto_62762 ?auto_62759 )
      ( MAKE-ON ?auto_62755 ?auto_62756 )
      ( MAKE-ON-VERIFY ?auto_62755 ?auto_62756 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62763 - SURFACE
      ?auto_62764 - SURFACE
    )
    :vars
    (
      ?auto_62765 - HOIST
      ?auto_62766 - PLACE
      ?auto_62770 - PLACE
      ?auto_62768 - HOIST
      ?auto_62767 - SURFACE
      ?auto_62769 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_62765 ?auto_62766 ) ( SURFACE-AT ?auto_62764 ?auto_62766 ) ( CLEAR ?auto_62764 ) ( IS-CRATE ?auto_62763 ) ( not ( = ?auto_62763 ?auto_62764 ) ) ( AVAILABLE ?auto_62765 ) ( not ( = ?auto_62770 ?auto_62766 ) ) ( HOIST-AT ?auto_62768 ?auto_62770 ) ( not ( = ?auto_62765 ?auto_62768 ) ) ( AVAILABLE ?auto_62768 ) ( SURFACE-AT ?auto_62763 ?auto_62770 ) ( ON ?auto_62763 ?auto_62767 ) ( CLEAR ?auto_62763 ) ( not ( = ?auto_62763 ?auto_62767 ) ) ( not ( = ?auto_62764 ?auto_62767 ) ) ( TRUCK-AT ?auto_62769 ?auto_62766 ) )
    :subtasks
    ( ( !DRIVE ?auto_62769 ?auto_62766 ?auto_62770 )
      ( MAKE-ON ?auto_62763 ?auto_62764 )
      ( MAKE-ON-VERIFY ?auto_62763 ?auto_62764 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62771 - SURFACE
      ?auto_62772 - SURFACE
    )
    :vars
    (
      ?auto_62778 - HOIST
      ?auto_62775 - PLACE
      ?auto_62776 - PLACE
      ?auto_62773 - HOIST
      ?auto_62777 - SURFACE
      ?auto_62774 - TRUCK
      ?auto_62779 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62778 ?auto_62775 ) ( IS-CRATE ?auto_62771 ) ( not ( = ?auto_62771 ?auto_62772 ) ) ( not ( = ?auto_62776 ?auto_62775 ) ) ( HOIST-AT ?auto_62773 ?auto_62776 ) ( not ( = ?auto_62778 ?auto_62773 ) ) ( AVAILABLE ?auto_62773 ) ( SURFACE-AT ?auto_62771 ?auto_62776 ) ( ON ?auto_62771 ?auto_62777 ) ( CLEAR ?auto_62771 ) ( not ( = ?auto_62771 ?auto_62777 ) ) ( not ( = ?auto_62772 ?auto_62777 ) ) ( TRUCK-AT ?auto_62774 ?auto_62775 ) ( SURFACE-AT ?auto_62779 ?auto_62775 ) ( CLEAR ?auto_62779 ) ( LIFTING ?auto_62778 ?auto_62772 ) ( IS-CRATE ?auto_62772 ) ( not ( = ?auto_62771 ?auto_62779 ) ) ( not ( = ?auto_62772 ?auto_62779 ) ) ( not ( = ?auto_62777 ?auto_62779 ) ) )
    :subtasks
    ( ( !DROP ?auto_62778 ?auto_62772 ?auto_62779 ?auto_62775 )
      ( MAKE-ON ?auto_62771 ?auto_62772 )
      ( MAKE-ON-VERIFY ?auto_62771 ?auto_62772 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62780 - SURFACE
      ?auto_62781 - SURFACE
    )
    :vars
    (
      ?auto_62786 - HOIST
      ?auto_62784 - PLACE
      ?auto_62782 - PLACE
      ?auto_62787 - HOIST
      ?auto_62785 - SURFACE
      ?auto_62783 - TRUCK
      ?auto_62788 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62786 ?auto_62784 ) ( IS-CRATE ?auto_62780 ) ( not ( = ?auto_62780 ?auto_62781 ) ) ( not ( = ?auto_62782 ?auto_62784 ) ) ( HOIST-AT ?auto_62787 ?auto_62782 ) ( not ( = ?auto_62786 ?auto_62787 ) ) ( AVAILABLE ?auto_62787 ) ( SURFACE-AT ?auto_62780 ?auto_62782 ) ( ON ?auto_62780 ?auto_62785 ) ( CLEAR ?auto_62780 ) ( not ( = ?auto_62780 ?auto_62785 ) ) ( not ( = ?auto_62781 ?auto_62785 ) ) ( TRUCK-AT ?auto_62783 ?auto_62784 ) ( SURFACE-AT ?auto_62788 ?auto_62784 ) ( CLEAR ?auto_62788 ) ( IS-CRATE ?auto_62781 ) ( not ( = ?auto_62780 ?auto_62788 ) ) ( not ( = ?auto_62781 ?auto_62788 ) ) ( not ( = ?auto_62785 ?auto_62788 ) ) ( AVAILABLE ?auto_62786 ) ( IN ?auto_62781 ?auto_62783 ) )
    :subtasks
    ( ( !UNLOAD ?auto_62786 ?auto_62781 ?auto_62783 ?auto_62784 )
      ( MAKE-ON ?auto_62780 ?auto_62781 )
      ( MAKE-ON-VERIFY ?auto_62780 ?auto_62781 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62789 - SURFACE
      ?auto_62790 - SURFACE
    )
    :vars
    (
      ?auto_62796 - HOIST
      ?auto_62791 - PLACE
      ?auto_62794 - PLACE
      ?auto_62793 - HOIST
      ?auto_62792 - SURFACE
      ?auto_62797 - SURFACE
      ?auto_62795 - TRUCK
      ?auto_62798 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62796 ?auto_62791 ) ( IS-CRATE ?auto_62789 ) ( not ( = ?auto_62789 ?auto_62790 ) ) ( not ( = ?auto_62794 ?auto_62791 ) ) ( HOIST-AT ?auto_62793 ?auto_62794 ) ( not ( = ?auto_62796 ?auto_62793 ) ) ( AVAILABLE ?auto_62793 ) ( SURFACE-AT ?auto_62789 ?auto_62794 ) ( ON ?auto_62789 ?auto_62792 ) ( CLEAR ?auto_62789 ) ( not ( = ?auto_62789 ?auto_62792 ) ) ( not ( = ?auto_62790 ?auto_62792 ) ) ( SURFACE-AT ?auto_62797 ?auto_62791 ) ( CLEAR ?auto_62797 ) ( IS-CRATE ?auto_62790 ) ( not ( = ?auto_62789 ?auto_62797 ) ) ( not ( = ?auto_62790 ?auto_62797 ) ) ( not ( = ?auto_62792 ?auto_62797 ) ) ( AVAILABLE ?auto_62796 ) ( IN ?auto_62790 ?auto_62795 ) ( TRUCK-AT ?auto_62795 ?auto_62798 ) ( not ( = ?auto_62798 ?auto_62791 ) ) ( not ( = ?auto_62794 ?auto_62798 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_62795 ?auto_62798 ?auto_62791 )
      ( MAKE-ON ?auto_62789 ?auto_62790 )
      ( MAKE-ON-VERIFY ?auto_62789 ?auto_62790 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62799 - SURFACE
      ?auto_62800 - SURFACE
    )
    :vars
    (
      ?auto_62808 - HOIST
      ?auto_62807 - PLACE
      ?auto_62803 - PLACE
      ?auto_62801 - HOIST
      ?auto_62805 - SURFACE
      ?auto_62802 - SURFACE
      ?auto_62806 - TRUCK
      ?auto_62804 - PLACE
      ?auto_62809 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_62808 ?auto_62807 ) ( IS-CRATE ?auto_62799 ) ( not ( = ?auto_62799 ?auto_62800 ) ) ( not ( = ?auto_62803 ?auto_62807 ) ) ( HOIST-AT ?auto_62801 ?auto_62803 ) ( not ( = ?auto_62808 ?auto_62801 ) ) ( AVAILABLE ?auto_62801 ) ( SURFACE-AT ?auto_62799 ?auto_62803 ) ( ON ?auto_62799 ?auto_62805 ) ( CLEAR ?auto_62799 ) ( not ( = ?auto_62799 ?auto_62805 ) ) ( not ( = ?auto_62800 ?auto_62805 ) ) ( SURFACE-AT ?auto_62802 ?auto_62807 ) ( CLEAR ?auto_62802 ) ( IS-CRATE ?auto_62800 ) ( not ( = ?auto_62799 ?auto_62802 ) ) ( not ( = ?auto_62800 ?auto_62802 ) ) ( not ( = ?auto_62805 ?auto_62802 ) ) ( AVAILABLE ?auto_62808 ) ( TRUCK-AT ?auto_62806 ?auto_62804 ) ( not ( = ?auto_62804 ?auto_62807 ) ) ( not ( = ?auto_62803 ?auto_62804 ) ) ( HOIST-AT ?auto_62809 ?auto_62804 ) ( LIFTING ?auto_62809 ?auto_62800 ) ( not ( = ?auto_62808 ?auto_62809 ) ) ( not ( = ?auto_62801 ?auto_62809 ) ) )
    :subtasks
    ( ( !LOAD ?auto_62809 ?auto_62800 ?auto_62806 ?auto_62804 )
      ( MAKE-ON ?auto_62799 ?auto_62800 )
      ( MAKE-ON-VERIFY ?auto_62799 ?auto_62800 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62810 - SURFACE
      ?auto_62811 - SURFACE
    )
    :vars
    (
      ?auto_62815 - HOIST
      ?auto_62814 - PLACE
      ?auto_62817 - PLACE
      ?auto_62812 - HOIST
      ?auto_62818 - SURFACE
      ?auto_62819 - SURFACE
      ?auto_62820 - TRUCK
      ?auto_62816 - PLACE
      ?auto_62813 - HOIST
      ?auto_62821 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62815 ?auto_62814 ) ( IS-CRATE ?auto_62810 ) ( not ( = ?auto_62810 ?auto_62811 ) ) ( not ( = ?auto_62817 ?auto_62814 ) ) ( HOIST-AT ?auto_62812 ?auto_62817 ) ( not ( = ?auto_62815 ?auto_62812 ) ) ( AVAILABLE ?auto_62812 ) ( SURFACE-AT ?auto_62810 ?auto_62817 ) ( ON ?auto_62810 ?auto_62818 ) ( CLEAR ?auto_62810 ) ( not ( = ?auto_62810 ?auto_62818 ) ) ( not ( = ?auto_62811 ?auto_62818 ) ) ( SURFACE-AT ?auto_62819 ?auto_62814 ) ( CLEAR ?auto_62819 ) ( IS-CRATE ?auto_62811 ) ( not ( = ?auto_62810 ?auto_62819 ) ) ( not ( = ?auto_62811 ?auto_62819 ) ) ( not ( = ?auto_62818 ?auto_62819 ) ) ( AVAILABLE ?auto_62815 ) ( TRUCK-AT ?auto_62820 ?auto_62816 ) ( not ( = ?auto_62816 ?auto_62814 ) ) ( not ( = ?auto_62817 ?auto_62816 ) ) ( HOIST-AT ?auto_62813 ?auto_62816 ) ( not ( = ?auto_62815 ?auto_62813 ) ) ( not ( = ?auto_62812 ?auto_62813 ) ) ( AVAILABLE ?auto_62813 ) ( SURFACE-AT ?auto_62811 ?auto_62816 ) ( ON ?auto_62811 ?auto_62821 ) ( CLEAR ?auto_62811 ) ( not ( = ?auto_62810 ?auto_62821 ) ) ( not ( = ?auto_62811 ?auto_62821 ) ) ( not ( = ?auto_62818 ?auto_62821 ) ) ( not ( = ?auto_62819 ?auto_62821 ) ) )
    :subtasks
    ( ( !LIFT ?auto_62813 ?auto_62811 ?auto_62821 ?auto_62816 )
      ( MAKE-ON ?auto_62810 ?auto_62811 )
      ( MAKE-ON-VERIFY ?auto_62810 ?auto_62811 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62822 - SURFACE
      ?auto_62823 - SURFACE
    )
    :vars
    (
      ?auto_62826 - HOIST
      ?auto_62829 - PLACE
      ?auto_62825 - PLACE
      ?auto_62833 - HOIST
      ?auto_62830 - SURFACE
      ?auto_62827 - SURFACE
      ?auto_62832 - PLACE
      ?auto_62828 - HOIST
      ?auto_62824 - SURFACE
      ?auto_62831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_62826 ?auto_62829 ) ( IS-CRATE ?auto_62822 ) ( not ( = ?auto_62822 ?auto_62823 ) ) ( not ( = ?auto_62825 ?auto_62829 ) ) ( HOIST-AT ?auto_62833 ?auto_62825 ) ( not ( = ?auto_62826 ?auto_62833 ) ) ( AVAILABLE ?auto_62833 ) ( SURFACE-AT ?auto_62822 ?auto_62825 ) ( ON ?auto_62822 ?auto_62830 ) ( CLEAR ?auto_62822 ) ( not ( = ?auto_62822 ?auto_62830 ) ) ( not ( = ?auto_62823 ?auto_62830 ) ) ( SURFACE-AT ?auto_62827 ?auto_62829 ) ( CLEAR ?auto_62827 ) ( IS-CRATE ?auto_62823 ) ( not ( = ?auto_62822 ?auto_62827 ) ) ( not ( = ?auto_62823 ?auto_62827 ) ) ( not ( = ?auto_62830 ?auto_62827 ) ) ( AVAILABLE ?auto_62826 ) ( not ( = ?auto_62832 ?auto_62829 ) ) ( not ( = ?auto_62825 ?auto_62832 ) ) ( HOIST-AT ?auto_62828 ?auto_62832 ) ( not ( = ?auto_62826 ?auto_62828 ) ) ( not ( = ?auto_62833 ?auto_62828 ) ) ( AVAILABLE ?auto_62828 ) ( SURFACE-AT ?auto_62823 ?auto_62832 ) ( ON ?auto_62823 ?auto_62824 ) ( CLEAR ?auto_62823 ) ( not ( = ?auto_62822 ?auto_62824 ) ) ( not ( = ?auto_62823 ?auto_62824 ) ) ( not ( = ?auto_62830 ?auto_62824 ) ) ( not ( = ?auto_62827 ?auto_62824 ) ) ( TRUCK-AT ?auto_62831 ?auto_62829 ) )
    :subtasks
    ( ( !DRIVE ?auto_62831 ?auto_62829 ?auto_62832 )
      ( MAKE-ON ?auto_62822 ?auto_62823 )
      ( MAKE-ON-VERIFY ?auto_62822 ?auto_62823 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62834 - SURFACE
      ?auto_62835 - SURFACE
    )
    :vars
    (
      ?auto_62839 - HOIST
      ?auto_62845 - PLACE
      ?auto_62844 - PLACE
      ?auto_62843 - HOIST
      ?auto_62838 - SURFACE
      ?auto_62840 - SURFACE
      ?auto_62837 - PLACE
      ?auto_62836 - HOIST
      ?auto_62842 - SURFACE
      ?auto_62841 - TRUCK
      ?auto_62846 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62839 ?auto_62845 ) ( IS-CRATE ?auto_62834 ) ( not ( = ?auto_62834 ?auto_62835 ) ) ( not ( = ?auto_62844 ?auto_62845 ) ) ( HOIST-AT ?auto_62843 ?auto_62844 ) ( not ( = ?auto_62839 ?auto_62843 ) ) ( AVAILABLE ?auto_62843 ) ( SURFACE-AT ?auto_62834 ?auto_62844 ) ( ON ?auto_62834 ?auto_62838 ) ( CLEAR ?auto_62834 ) ( not ( = ?auto_62834 ?auto_62838 ) ) ( not ( = ?auto_62835 ?auto_62838 ) ) ( IS-CRATE ?auto_62835 ) ( not ( = ?auto_62834 ?auto_62840 ) ) ( not ( = ?auto_62835 ?auto_62840 ) ) ( not ( = ?auto_62838 ?auto_62840 ) ) ( not ( = ?auto_62837 ?auto_62845 ) ) ( not ( = ?auto_62844 ?auto_62837 ) ) ( HOIST-AT ?auto_62836 ?auto_62837 ) ( not ( = ?auto_62839 ?auto_62836 ) ) ( not ( = ?auto_62843 ?auto_62836 ) ) ( AVAILABLE ?auto_62836 ) ( SURFACE-AT ?auto_62835 ?auto_62837 ) ( ON ?auto_62835 ?auto_62842 ) ( CLEAR ?auto_62835 ) ( not ( = ?auto_62834 ?auto_62842 ) ) ( not ( = ?auto_62835 ?auto_62842 ) ) ( not ( = ?auto_62838 ?auto_62842 ) ) ( not ( = ?auto_62840 ?auto_62842 ) ) ( TRUCK-AT ?auto_62841 ?auto_62845 ) ( SURFACE-AT ?auto_62846 ?auto_62845 ) ( CLEAR ?auto_62846 ) ( LIFTING ?auto_62839 ?auto_62840 ) ( IS-CRATE ?auto_62840 ) ( not ( = ?auto_62834 ?auto_62846 ) ) ( not ( = ?auto_62835 ?auto_62846 ) ) ( not ( = ?auto_62838 ?auto_62846 ) ) ( not ( = ?auto_62840 ?auto_62846 ) ) ( not ( = ?auto_62842 ?auto_62846 ) ) )
    :subtasks
    ( ( !DROP ?auto_62839 ?auto_62840 ?auto_62846 ?auto_62845 )
      ( MAKE-ON ?auto_62834 ?auto_62835 )
      ( MAKE-ON-VERIFY ?auto_62834 ?auto_62835 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62847 - SURFACE
      ?auto_62848 - SURFACE
    )
    :vars
    (
      ?auto_62858 - HOIST
      ?auto_62853 - PLACE
      ?auto_62850 - PLACE
      ?auto_62854 - HOIST
      ?auto_62855 - SURFACE
      ?auto_62859 - SURFACE
      ?auto_62857 - PLACE
      ?auto_62849 - HOIST
      ?auto_62852 - SURFACE
      ?auto_62856 - TRUCK
      ?auto_62851 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62858 ?auto_62853 ) ( IS-CRATE ?auto_62847 ) ( not ( = ?auto_62847 ?auto_62848 ) ) ( not ( = ?auto_62850 ?auto_62853 ) ) ( HOIST-AT ?auto_62854 ?auto_62850 ) ( not ( = ?auto_62858 ?auto_62854 ) ) ( AVAILABLE ?auto_62854 ) ( SURFACE-AT ?auto_62847 ?auto_62850 ) ( ON ?auto_62847 ?auto_62855 ) ( CLEAR ?auto_62847 ) ( not ( = ?auto_62847 ?auto_62855 ) ) ( not ( = ?auto_62848 ?auto_62855 ) ) ( IS-CRATE ?auto_62848 ) ( not ( = ?auto_62847 ?auto_62859 ) ) ( not ( = ?auto_62848 ?auto_62859 ) ) ( not ( = ?auto_62855 ?auto_62859 ) ) ( not ( = ?auto_62857 ?auto_62853 ) ) ( not ( = ?auto_62850 ?auto_62857 ) ) ( HOIST-AT ?auto_62849 ?auto_62857 ) ( not ( = ?auto_62858 ?auto_62849 ) ) ( not ( = ?auto_62854 ?auto_62849 ) ) ( AVAILABLE ?auto_62849 ) ( SURFACE-AT ?auto_62848 ?auto_62857 ) ( ON ?auto_62848 ?auto_62852 ) ( CLEAR ?auto_62848 ) ( not ( = ?auto_62847 ?auto_62852 ) ) ( not ( = ?auto_62848 ?auto_62852 ) ) ( not ( = ?auto_62855 ?auto_62852 ) ) ( not ( = ?auto_62859 ?auto_62852 ) ) ( TRUCK-AT ?auto_62856 ?auto_62853 ) ( SURFACE-AT ?auto_62851 ?auto_62853 ) ( CLEAR ?auto_62851 ) ( IS-CRATE ?auto_62859 ) ( not ( = ?auto_62847 ?auto_62851 ) ) ( not ( = ?auto_62848 ?auto_62851 ) ) ( not ( = ?auto_62855 ?auto_62851 ) ) ( not ( = ?auto_62859 ?auto_62851 ) ) ( not ( = ?auto_62852 ?auto_62851 ) ) ( AVAILABLE ?auto_62858 ) ( IN ?auto_62859 ?auto_62856 ) )
    :subtasks
    ( ( !UNLOAD ?auto_62858 ?auto_62859 ?auto_62856 ?auto_62853 )
      ( MAKE-ON ?auto_62847 ?auto_62848 )
      ( MAKE-ON-VERIFY ?auto_62847 ?auto_62848 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62860 - SURFACE
      ?auto_62861 - SURFACE
    )
    :vars
    (
      ?auto_62863 - HOIST
      ?auto_62869 - PLACE
      ?auto_62866 - PLACE
      ?auto_62872 - HOIST
      ?auto_62864 - SURFACE
      ?auto_62870 - SURFACE
      ?auto_62867 - PLACE
      ?auto_62868 - HOIST
      ?auto_62871 - SURFACE
      ?auto_62865 - SURFACE
      ?auto_62862 - TRUCK
      ?auto_62873 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62863 ?auto_62869 ) ( IS-CRATE ?auto_62860 ) ( not ( = ?auto_62860 ?auto_62861 ) ) ( not ( = ?auto_62866 ?auto_62869 ) ) ( HOIST-AT ?auto_62872 ?auto_62866 ) ( not ( = ?auto_62863 ?auto_62872 ) ) ( AVAILABLE ?auto_62872 ) ( SURFACE-AT ?auto_62860 ?auto_62866 ) ( ON ?auto_62860 ?auto_62864 ) ( CLEAR ?auto_62860 ) ( not ( = ?auto_62860 ?auto_62864 ) ) ( not ( = ?auto_62861 ?auto_62864 ) ) ( IS-CRATE ?auto_62861 ) ( not ( = ?auto_62860 ?auto_62870 ) ) ( not ( = ?auto_62861 ?auto_62870 ) ) ( not ( = ?auto_62864 ?auto_62870 ) ) ( not ( = ?auto_62867 ?auto_62869 ) ) ( not ( = ?auto_62866 ?auto_62867 ) ) ( HOIST-AT ?auto_62868 ?auto_62867 ) ( not ( = ?auto_62863 ?auto_62868 ) ) ( not ( = ?auto_62872 ?auto_62868 ) ) ( AVAILABLE ?auto_62868 ) ( SURFACE-AT ?auto_62861 ?auto_62867 ) ( ON ?auto_62861 ?auto_62871 ) ( CLEAR ?auto_62861 ) ( not ( = ?auto_62860 ?auto_62871 ) ) ( not ( = ?auto_62861 ?auto_62871 ) ) ( not ( = ?auto_62864 ?auto_62871 ) ) ( not ( = ?auto_62870 ?auto_62871 ) ) ( SURFACE-AT ?auto_62865 ?auto_62869 ) ( CLEAR ?auto_62865 ) ( IS-CRATE ?auto_62870 ) ( not ( = ?auto_62860 ?auto_62865 ) ) ( not ( = ?auto_62861 ?auto_62865 ) ) ( not ( = ?auto_62864 ?auto_62865 ) ) ( not ( = ?auto_62870 ?auto_62865 ) ) ( not ( = ?auto_62871 ?auto_62865 ) ) ( AVAILABLE ?auto_62863 ) ( IN ?auto_62870 ?auto_62862 ) ( TRUCK-AT ?auto_62862 ?auto_62873 ) ( not ( = ?auto_62873 ?auto_62869 ) ) ( not ( = ?auto_62866 ?auto_62873 ) ) ( not ( = ?auto_62867 ?auto_62873 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_62862 ?auto_62873 ?auto_62869 )
      ( MAKE-ON ?auto_62860 ?auto_62861 )
      ( MAKE-ON-VERIFY ?auto_62860 ?auto_62861 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62874 - SURFACE
      ?auto_62875 - SURFACE
    )
    :vars
    (
      ?auto_62876 - HOIST
      ?auto_62885 - PLACE
      ?auto_62883 - PLACE
      ?auto_62878 - HOIST
      ?auto_62887 - SURFACE
      ?auto_62882 - SURFACE
      ?auto_62884 - PLACE
      ?auto_62879 - HOIST
      ?auto_62886 - SURFACE
      ?auto_62877 - SURFACE
      ?auto_62881 - TRUCK
      ?auto_62880 - PLACE
      ?auto_62888 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_62876 ?auto_62885 ) ( IS-CRATE ?auto_62874 ) ( not ( = ?auto_62874 ?auto_62875 ) ) ( not ( = ?auto_62883 ?auto_62885 ) ) ( HOIST-AT ?auto_62878 ?auto_62883 ) ( not ( = ?auto_62876 ?auto_62878 ) ) ( AVAILABLE ?auto_62878 ) ( SURFACE-AT ?auto_62874 ?auto_62883 ) ( ON ?auto_62874 ?auto_62887 ) ( CLEAR ?auto_62874 ) ( not ( = ?auto_62874 ?auto_62887 ) ) ( not ( = ?auto_62875 ?auto_62887 ) ) ( IS-CRATE ?auto_62875 ) ( not ( = ?auto_62874 ?auto_62882 ) ) ( not ( = ?auto_62875 ?auto_62882 ) ) ( not ( = ?auto_62887 ?auto_62882 ) ) ( not ( = ?auto_62884 ?auto_62885 ) ) ( not ( = ?auto_62883 ?auto_62884 ) ) ( HOIST-AT ?auto_62879 ?auto_62884 ) ( not ( = ?auto_62876 ?auto_62879 ) ) ( not ( = ?auto_62878 ?auto_62879 ) ) ( AVAILABLE ?auto_62879 ) ( SURFACE-AT ?auto_62875 ?auto_62884 ) ( ON ?auto_62875 ?auto_62886 ) ( CLEAR ?auto_62875 ) ( not ( = ?auto_62874 ?auto_62886 ) ) ( not ( = ?auto_62875 ?auto_62886 ) ) ( not ( = ?auto_62887 ?auto_62886 ) ) ( not ( = ?auto_62882 ?auto_62886 ) ) ( SURFACE-AT ?auto_62877 ?auto_62885 ) ( CLEAR ?auto_62877 ) ( IS-CRATE ?auto_62882 ) ( not ( = ?auto_62874 ?auto_62877 ) ) ( not ( = ?auto_62875 ?auto_62877 ) ) ( not ( = ?auto_62887 ?auto_62877 ) ) ( not ( = ?auto_62882 ?auto_62877 ) ) ( not ( = ?auto_62886 ?auto_62877 ) ) ( AVAILABLE ?auto_62876 ) ( TRUCK-AT ?auto_62881 ?auto_62880 ) ( not ( = ?auto_62880 ?auto_62885 ) ) ( not ( = ?auto_62883 ?auto_62880 ) ) ( not ( = ?auto_62884 ?auto_62880 ) ) ( HOIST-AT ?auto_62888 ?auto_62880 ) ( LIFTING ?auto_62888 ?auto_62882 ) ( not ( = ?auto_62876 ?auto_62888 ) ) ( not ( = ?auto_62878 ?auto_62888 ) ) ( not ( = ?auto_62879 ?auto_62888 ) ) )
    :subtasks
    ( ( !LOAD ?auto_62888 ?auto_62882 ?auto_62881 ?auto_62880 )
      ( MAKE-ON ?auto_62874 ?auto_62875 )
      ( MAKE-ON-VERIFY ?auto_62874 ?auto_62875 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62889 - SURFACE
      ?auto_62890 - SURFACE
    )
    :vars
    (
      ?auto_62893 - HOIST
      ?auto_62892 - PLACE
      ?auto_62891 - PLACE
      ?auto_62894 - HOIST
      ?auto_62903 - SURFACE
      ?auto_62896 - SURFACE
      ?auto_62897 - PLACE
      ?auto_62901 - HOIST
      ?auto_62900 - SURFACE
      ?auto_62902 - SURFACE
      ?auto_62898 - TRUCK
      ?auto_62899 - PLACE
      ?auto_62895 - HOIST
      ?auto_62904 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62893 ?auto_62892 ) ( IS-CRATE ?auto_62889 ) ( not ( = ?auto_62889 ?auto_62890 ) ) ( not ( = ?auto_62891 ?auto_62892 ) ) ( HOIST-AT ?auto_62894 ?auto_62891 ) ( not ( = ?auto_62893 ?auto_62894 ) ) ( AVAILABLE ?auto_62894 ) ( SURFACE-AT ?auto_62889 ?auto_62891 ) ( ON ?auto_62889 ?auto_62903 ) ( CLEAR ?auto_62889 ) ( not ( = ?auto_62889 ?auto_62903 ) ) ( not ( = ?auto_62890 ?auto_62903 ) ) ( IS-CRATE ?auto_62890 ) ( not ( = ?auto_62889 ?auto_62896 ) ) ( not ( = ?auto_62890 ?auto_62896 ) ) ( not ( = ?auto_62903 ?auto_62896 ) ) ( not ( = ?auto_62897 ?auto_62892 ) ) ( not ( = ?auto_62891 ?auto_62897 ) ) ( HOIST-AT ?auto_62901 ?auto_62897 ) ( not ( = ?auto_62893 ?auto_62901 ) ) ( not ( = ?auto_62894 ?auto_62901 ) ) ( AVAILABLE ?auto_62901 ) ( SURFACE-AT ?auto_62890 ?auto_62897 ) ( ON ?auto_62890 ?auto_62900 ) ( CLEAR ?auto_62890 ) ( not ( = ?auto_62889 ?auto_62900 ) ) ( not ( = ?auto_62890 ?auto_62900 ) ) ( not ( = ?auto_62903 ?auto_62900 ) ) ( not ( = ?auto_62896 ?auto_62900 ) ) ( SURFACE-AT ?auto_62902 ?auto_62892 ) ( CLEAR ?auto_62902 ) ( IS-CRATE ?auto_62896 ) ( not ( = ?auto_62889 ?auto_62902 ) ) ( not ( = ?auto_62890 ?auto_62902 ) ) ( not ( = ?auto_62903 ?auto_62902 ) ) ( not ( = ?auto_62896 ?auto_62902 ) ) ( not ( = ?auto_62900 ?auto_62902 ) ) ( AVAILABLE ?auto_62893 ) ( TRUCK-AT ?auto_62898 ?auto_62899 ) ( not ( = ?auto_62899 ?auto_62892 ) ) ( not ( = ?auto_62891 ?auto_62899 ) ) ( not ( = ?auto_62897 ?auto_62899 ) ) ( HOIST-AT ?auto_62895 ?auto_62899 ) ( not ( = ?auto_62893 ?auto_62895 ) ) ( not ( = ?auto_62894 ?auto_62895 ) ) ( not ( = ?auto_62901 ?auto_62895 ) ) ( AVAILABLE ?auto_62895 ) ( SURFACE-AT ?auto_62896 ?auto_62899 ) ( ON ?auto_62896 ?auto_62904 ) ( CLEAR ?auto_62896 ) ( not ( = ?auto_62889 ?auto_62904 ) ) ( not ( = ?auto_62890 ?auto_62904 ) ) ( not ( = ?auto_62903 ?auto_62904 ) ) ( not ( = ?auto_62896 ?auto_62904 ) ) ( not ( = ?auto_62900 ?auto_62904 ) ) ( not ( = ?auto_62902 ?auto_62904 ) ) )
    :subtasks
    ( ( !LIFT ?auto_62895 ?auto_62896 ?auto_62904 ?auto_62899 )
      ( MAKE-ON ?auto_62889 ?auto_62890 )
      ( MAKE-ON-VERIFY ?auto_62889 ?auto_62890 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62905 - SURFACE
      ?auto_62906 - SURFACE
    )
    :vars
    (
      ?auto_62911 - HOIST
      ?auto_62912 - PLACE
      ?auto_62918 - PLACE
      ?auto_62916 - HOIST
      ?auto_62909 - SURFACE
      ?auto_62913 - SURFACE
      ?auto_62908 - PLACE
      ?auto_62915 - HOIST
      ?auto_62910 - SURFACE
      ?auto_62914 - SURFACE
      ?auto_62917 - PLACE
      ?auto_62920 - HOIST
      ?auto_62919 - SURFACE
      ?auto_62907 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_62911 ?auto_62912 ) ( IS-CRATE ?auto_62905 ) ( not ( = ?auto_62905 ?auto_62906 ) ) ( not ( = ?auto_62918 ?auto_62912 ) ) ( HOIST-AT ?auto_62916 ?auto_62918 ) ( not ( = ?auto_62911 ?auto_62916 ) ) ( AVAILABLE ?auto_62916 ) ( SURFACE-AT ?auto_62905 ?auto_62918 ) ( ON ?auto_62905 ?auto_62909 ) ( CLEAR ?auto_62905 ) ( not ( = ?auto_62905 ?auto_62909 ) ) ( not ( = ?auto_62906 ?auto_62909 ) ) ( IS-CRATE ?auto_62906 ) ( not ( = ?auto_62905 ?auto_62913 ) ) ( not ( = ?auto_62906 ?auto_62913 ) ) ( not ( = ?auto_62909 ?auto_62913 ) ) ( not ( = ?auto_62908 ?auto_62912 ) ) ( not ( = ?auto_62918 ?auto_62908 ) ) ( HOIST-AT ?auto_62915 ?auto_62908 ) ( not ( = ?auto_62911 ?auto_62915 ) ) ( not ( = ?auto_62916 ?auto_62915 ) ) ( AVAILABLE ?auto_62915 ) ( SURFACE-AT ?auto_62906 ?auto_62908 ) ( ON ?auto_62906 ?auto_62910 ) ( CLEAR ?auto_62906 ) ( not ( = ?auto_62905 ?auto_62910 ) ) ( not ( = ?auto_62906 ?auto_62910 ) ) ( not ( = ?auto_62909 ?auto_62910 ) ) ( not ( = ?auto_62913 ?auto_62910 ) ) ( SURFACE-AT ?auto_62914 ?auto_62912 ) ( CLEAR ?auto_62914 ) ( IS-CRATE ?auto_62913 ) ( not ( = ?auto_62905 ?auto_62914 ) ) ( not ( = ?auto_62906 ?auto_62914 ) ) ( not ( = ?auto_62909 ?auto_62914 ) ) ( not ( = ?auto_62913 ?auto_62914 ) ) ( not ( = ?auto_62910 ?auto_62914 ) ) ( AVAILABLE ?auto_62911 ) ( not ( = ?auto_62917 ?auto_62912 ) ) ( not ( = ?auto_62918 ?auto_62917 ) ) ( not ( = ?auto_62908 ?auto_62917 ) ) ( HOIST-AT ?auto_62920 ?auto_62917 ) ( not ( = ?auto_62911 ?auto_62920 ) ) ( not ( = ?auto_62916 ?auto_62920 ) ) ( not ( = ?auto_62915 ?auto_62920 ) ) ( AVAILABLE ?auto_62920 ) ( SURFACE-AT ?auto_62913 ?auto_62917 ) ( ON ?auto_62913 ?auto_62919 ) ( CLEAR ?auto_62913 ) ( not ( = ?auto_62905 ?auto_62919 ) ) ( not ( = ?auto_62906 ?auto_62919 ) ) ( not ( = ?auto_62909 ?auto_62919 ) ) ( not ( = ?auto_62913 ?auto_62919 ) ) ( not ( = ?auto_62910 ?auto_62919 ) ) ( not ( = ?auto_62914 ?auto_62919 ) ) ( TRUCK-AT ?auto_62907 ?auto_62912 ) )
    :subtasks
    ( ( !DRIVE ?auto_62907 ?auto_62912 ?auto_62917 )
      ( MAKE-ON ?auto_62905 ?auto_62906 )
      ( MAKE-ON-VERIFY ?auto_62905 ?auto_62906 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62921 - SURFACE
      ?auto_62922 - SURFACE
    )
    :vars
    (
      ?auto_62927 - HOIST
      ?auto_62923 - PLACE
      ?auto_62932 - PLACE
      ?auto_62926 - HOIST
      ?auto_62930 - SURFACE
      ?auto_62929 - SURFACE
      ?auto_62931 - PLACE
      ?auto_62935 - HOIST
      ?auto_62934 - SURFACE
      ?auto_62924 - SURFACE
      ?auto_62925 - PLACE
      ?auto_62933 - HOIST
      ?auto_62928 - SURFACE
      ?auto_62936 - TRUCK
      ?auto_62937 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62927 ?auto_62923 ) ( IS-CRATE ?auto_62921 ) ( not ( = ?auto_62921 ?auto_62922 ) ) ( not ( = ?auto_62932 ?auto_62923 ) ) ( HOIST-AT ?auto_62926 ?auto_62932 ) ( not ( = ?auto_62927 ?auto_62926 ) ) ( AVAILABLE ?auto_62926 ) ( SURFACE-AT ?auto_62921 ?auto_62932 ) ( ON ?auto_62921 ?auto_62930 ) ( CLEAR ?auto_62921 ) ( not ( = ?auto_62921 ?auto_62930 ) ) ( not ( = ?auto_62922 ?auto_62930 ) ) ( IS-CRATE ?auto_62922 ) ( not ( = ?auto_62921 ?auto_62929 ) ) ( not ( = ?auto_62922 ?auto_62929 ) ) ( not ( = ?auto_62930 ?auto_62929 ) ) ( not ( = ?auto_62931 ?auto_62923 ) ) ( not ( = ?auto_62932 ?auto_62931 ) ) ( HOIST-AT ?auto_62935 ?auto_62931 ) ( not ( = ?auto_62927 ?auto_62935 ) ) ( not ( = ?auto_62926 ?auto_62935 ) ) ( AVAILABLE ?auto_62935 ) ( SURFACE-AT ?auto_62922 ?auto_62931 ) ( ON ?auto_62922 ?auto_62934 ) ( CLEAR ?auto_62922 ) ( not ( = ?auto_62921 ?auto_62934 ) ) ( not ( = ?auto_62922 ?auto_62934 ) ) ( not ( = ?auto_62930 ?auto_62934 ) ) ( not ( = ?auto_62929 ?auto_62934 ) ) ( IS-CRATE ?auto_62929 ) ( not ( = ?auto_62921 ?auto_62924 ) ) ( not ( = ?auto_62922 ?auto_62924 ) ) ( not ( = ?auto_62930 ?auto_62924 ) ) ( not ( = ?auto_62929 ?auto_62924 ) ) ( not ( = ?auto_62934 ?auto_62924 ) ) ( not ( = ?auto_62925 ?auto_62923 ) ) ( not ( = ?auto_62932 ?auto_62925 ) ) ( not ( = ?auto_62931 ?auto_62925 ) ) ( HOIST-AT ?auto_62933 ?auto_62925 ) ( not ( = ?auto_62927 ?auto_62933 ) ) ( not ( = ?auto_62926 ?auto_62933 ) ) ( not ( = ?auto_62935 ?auto_62933 ) ) ( AVAILABLE ?auto_62933 ) ( SURFACE-AT ?auto_62929 ?auto_62925 ) ( ON ?auto_62929 ?auto_62928 ) ( CLEAR ?auto_62929 ) ( not ( = ?auto_62921 ?auto_62928 ) ) ( not ( = ?auto_62922 ?auto_62928 ) ) ( not ( = ?auto_62930 ?auto_62928 ) ) ( not ( = ?auto_62929 ?auto_62928 ) ) ( not ( = ?auto_62934 ?auto_62928 ) ) ( not ( = ?auto_62924 ?auto_62928 ) ) ( TRUCK-AT ?auto_62936 ?auto_62923 ) ( SURFACE-AT ?auto_62937 ?auto_62923 ) ( CLEAR ?auto_62937 ) ( LIFTING ?auto_62927 ?auto_62924 ) ( IS-CRATE ?auto_62924 ) ( not ( = ?auto_62921 ?auto_62937 ) ) ( not ( = ?auto_62922 ?auto_62937 ) ) ( not ( = ?auto_62930 ?auto_62937 ) ) ( not ( = ?auto_62929 ?auto_62937 ) ) ( not ( = ?auto_62934 ?auto_62937 ) ) ( not ( = ?auto_62924 ?auto_62937 ) ) ( not ( = ?auto_62928 ?auto_62937 ) ) )
    :subtasks
    ( ( !DROP ?auto_62927 ?auto_62924 ?auto_62937 ?auto_62923 )
      ( MAKE-ON ?auto_62921 ?auto_62922 )
      ( MAKE-ON-VERIFY ?auto_62921 ?auto_62922 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62938 - SURFACE
      ?auto_62939 - SURFACE
    )
    :vars
    (
      ?auto_62952 - HOIST
      ?auto_62950 - PLACE
      ?auto_62951 - PLACE
      ?auto_62946 - HOIST
      ?auto_62953 - SURFACE
      ?auto_62943 - SURFACE
      ?auto_62941 - PLACE
      ?auto_62948 - HOIST
      ?auto_62942 - SURFACE
      ?auto_62945 - SURFACE
      ?auto_62949 - PLACE
      ?auto_62940 - HOIST
      ?auto_62954 - SURFACE
      ?auto_62944 - TRUCK
      ?auto_62947 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62952 ?auto_62950 ) ( IS-CRATE ?auto_62938 ) ( not ( = ?auto_62938 ?auto_62939 ) ) ( not ( = ?auto_62951 ?auto_62950 ) ) ( HOIST-AT ?auto_62946 ?auto_62951 ) ( not ( = ?auto_62952 ?auto_62946 ) ) ( AVAILABLE ?auto_62946 ) ( SURFACE-AT ?auto_62938 ?auto_62951 ) ( ON ?auto_62938 ?auto_62953 ) ( CLEAR ?auto_62938 ) ( not ( = ?auto_62938 ?auto_62953 ) ) ( not ( = ?auto_62939 ?auto_62953 ) ) ( IS-CRATE ?auto_62939 ) ( not ( = ?auto_62938 ?auto_62943 ) ) ( not ( = ?auto_62939 ?auto_62943 ) ) ( not ( = ?auto_62953 ?auto_62943 ) ) ( not ( = ?auto_62941 ?auto_62950 ) ) ( not ( = ?auto_62951 ?auto_62941 ) ) ( HOIST-AT ?auto_62948 ?auto_62941 ) ( not ( = ?auto_62952 ?auto_62948 ) ) ( not ( = ?auto_62946 ?auto_62948 ) ) ( AVAILABLE ?auto_62948 ) ( SURFACE-AT ?auto_62939 ?auto_62941 ) ( ON ?auto_62939 ?auto_62942 ) ( CLEAR ?auto_62939 ) ( not ( = ?auto_62938 ?auto_62942 ) ) ( not ( = ?auto_62939 ?auto_62942 ) ) ( not ( = ?auto_62953 ?auto_62942 ) ) ( not ( = ?auto_62943 ?auto_62942 ) ) ( IS-CRATE ?auto_62943 ) ( not ( = ?auto_62938 ?auto_62945 ) ) ( not ( = ?auto_62939 ?auto_62945 ) ) ( not ( = ?auto_62953 ?auto_62945 ) ) ( not ( = ?auto_62943 ?auto_62945 ) ) ( not ( = ?auto_62942 ?auto_62945 ) ) ( not ( = ?auto_62949 ?auto_62950 ) ) ( not ( = ?auto_62951 ?auto_62949 ) ) ( not ( = ?auto_62941 ?auto_62949 ) ) ( HOIST-AT ?auto_62940 ?auto_62949 ) ( not ( = ?auto_62952 ?auto_62940 ) ) ( not ( = ?auto_62946 ?auto_62940 ) ) ( not ( = ?auto_62948 ?auto_62940 ) ) ( AVAILABLE ?auto_62940 ) ( SURFACE-AT ?auto_62943 ?auto_62949 ) ( ON ?auto_62943 ?auto_62954 ) ( CLEAR ?auto_62943 ) ( not ( = ?auto_62938 ?auto_62954 ) ) ( not ( = ?auto_62939 ?auto_62954 ) ) ( not ( = ?auto_62953 ?auto_62954 ) ) ( not ( = ?auto_62943 ?auto_62954 ) ) ( not ( = ?auto_62942 ?auto_62954 ) ) ( not ( = ?auto_62945 ?auto_62954 ) ) ( TRUCK-AT ?auto_62944 ?auto_62950 ) ( SURFACE-AT ?auto_62947 ?auto_62950 ) ( CLEAR ?auto_62947 ) ( IS-CRATE ?auto_62945 ) ( not ( = ?auto_62938 ?auto_62947 ) ) ( not ( = ?auto_62939 ?auto_62947 ) ) ( not ( = ?auto_62953 ?auto_62947 ) ) ( not ( = ?auto_62943 ?auto_62947 ) ) ( not ( = ?auto_62942 ?auto_62947 ) ) ( not ( = ?auto_62945 ?auto_62947 ) ) ( not ( = ?auto_62954 ?auto_62947 ) ) ( AVAILABLE ?auto_62952 ) ( IN ?auto_62945 ?auto_62944 ) )
    :subtasks
    ( ( !UNLOAD ?auto_62952 ?auto_62945 ?auto_62944 ?auto_62950 )
      ( MAKE-ON ?auto_62938 ?auto_62939 )
      ( MAKE-ON-VERIFY ?auto_62938 ?auto_62939 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62955 - SURFACE
      ?auto_62956 - SURFACE
    )
    :vars
    (
      ?auto_62959 - HOIST
      ?auto_62962 - PLACE
      ?auto_62958 - PLACE
      ?auto_62967 - HOIST
      ?auto_62971 - SURFACE
      ?auto_62966 - SURFACE
      ?auto_62969 - PLACE
      ?auto_62968 - HOIST
      ?auto_62960 - SURFACE
      ?auto_62963 - SURFACE
      ?auto_62964 - PLACE
      ?auto_62965 - HOIST
      ?auto_62957 - SURFACE
      ?auto_62961 - SURFACE
      ?auto_62970 - TRUCK
      ?auto_62972 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_62959 ?auto_62962 ) ( IS-CRATE ?auto_62955 ) ( not ( = ?auto_62955 ?auto_62956 ) ) ( not ( = ?auto_62958 ?auto_62962 ) ) ( HOIST-AT ?auto_62967 ?auto_62958 ) ( not ( = ?auto_62959 ?auto_62967 ) ) ( AVAILABLE ?auto_62967 ) ( SURFACE-AT ?auto_62955 ?auto_62958 ) ( ON ?auto_62955 ?auto_62971 ) ( CLEAR ?auto_62955 ) ( not ( = ?auto_62955 ?auto_62971 ) ) ( not ( = ?auto_62956 ?auto_62971 ) ) ( IS-CRATE ?auto_62956 ) ( not ( = ?auto_62955 ?auto_62966 ) ) ( not ( = ?auto_62956 ?auto_62966 ) ) ( not ( = ?auto_62971 ?auto_62966 ) ) ( not ( = ?auto_62969 ?auto_62962 ) ) ( not ( = ?auto_62958 ?auto_62969 ) ) ( HOIST-AT ?auto_62968 ?auto_62969 ) ( not ( = ?auto_62959 ?auto_62968 ) ) ( not ( = ?auto_62967 ?auto_62968 ) ) ( AVAILABLE ?auto_62968 ) ( SURFACE-AT ?auto_62956 ?auto_62969 ) ( ON ?auto_62956 ?auto_62960 ) ( CLEAR ?auto_62956 ) ( not ( = ?auto_62955 ?auto_62960 ) ) ( not ( = ?auto_62956 ?auto_62960 ) ) ( not ( = ?auto_62971 ?auto_62960 ) ) ( not ( = ?auto_62966 ?auto_62960 ) ) ( IS-CRATE ?auto_62966 ) ( not ( = ?auto_62955 ?auto_62963 ) ) ( not ( = ?auto_62956 ?auto_62963 ) ) ( not ( = ?auto_62971 ?auto_62963 ) ) ( not ( = ?auto_62966 ?auto_62963 ) ) ( not ( = ?auto_62960 ?auto_62963 ) ) ( not ( = ?auto_62964 ?auto_62962 ) ) ( not ( = ?auto_62958 ?auto_62964 ) ) ( not ( = ?auto_62969 ?auto_62964 ) ) ( HOIST-AT ?auto_62965 ?auto_62964 ) ( not ( = ?auto_62959 ?auto_62965 ) ) ( not ( = ?auto_62967 ?auto_62965 ) ) ( not ( = ?auto_62968 ?auto_62965 ) ) ( AVAILABLE ?auto_62965 ) ( SURFACE-AT ?auto_62966 ?auto_62964 ) ( ON ?auto_62966 ?auto_62957 ) ( CLEAR ?auto_62966 ) ( not ( = ?auto_62955 ?auto_62957 ) ) ( not ( = ?auto_62956 ?auto_62957 ) ) ( not ( = ?auto_62971 ?auto_62957 ) ) ( not ( = ?auto_62966 ?auto_62957 ) ) ( not ( = ?auto_62960 ?auto_62957 ) ) ( not ( = ?auto_62963 ?auto_62957 ) ) ( SURFACE-AT ?auto_62961 ?auto_62962 ) ( CLEAR ?auto_62961 ) ( IS-CRATE ?auto_62963 ) ( not ( = ?auto_62955 ?auto_62961 ) ) ( not ( = ?auto_62956 ?auto_62961 ) ) ( not ( = ?auto_62971 ?auto_62961 ) ) ( not ( = ?auto_62966 ?auto_62961 ) ) ( not ( = ?auto_62960 ?auto_62961 ) ) ( not ( = ?auto_62963 ?auto_62961 ) ) ( not ( = ?auto_62957 ?auto_62961 ) ) ( AVAILABLE ?auto_62959 ) ( IN ?auto_62963 ?auto_62970 ) ( TRUCK-AT ?auto_62970 ?auto_62972 ) ( not ( = ?auto_62972 ?auto_62962 ) ) ( not ( = ?auto_62958 ?auto_62972 ) ) ( not ( = ?auto_62969 ?auto_62972 ) ) ( not ( = ?auto_62964 ?auto_62972 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_62970 ?auto_62972 ?auto_62962 )
      ( MAKE-ON ?auto_62955 ?auto_62956 )
      ( MAKE-ON-VERIFY ?auto_62955 ?auto_62956 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62973 - SURFACE
      ?auto_62974 - SURFACE
    )
    :vars
    (
      ?auto_62986 - HOIST
      ?auto_62985 - PLACE
      ?auto_62987 - PLACE
      ?auto_62988 - HOIST
      ?auto_62983 - SURFACE
      ?auto_62978 - SURFACE
      ?auto_62980 - PLACE
      ?auto_62977 - HOIST
      ?auto_62989 - SURFACE
      ?auto_62990 - SURFACE
      ?auto_62984 - PLACE
      ?auto_62976 - HOIST
      ?auto_62975 - SURFACE
      ?auto_62979 - SURFACE
      ?auto_62982 - TRUCK
      ?auto_62981 - PLACE
      ?auto_62991 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_62986 ?auto_62985 ) ( IS-CRATE ?auto_62973 ) ( not ( = ?auto_62973 ?auto_62974 ) ) ( not ( = ?auto_62987 ?auto_62985 ) ) ( HOIST-AT ?auto_62988 ?auto_62987 ) ( not ( = ?auto_62986 ?auto_62988 ) ) ( AVAILABLE ?auto_62988 ) ( SURFACE-AT ?auto_62973 ?auto_62987 ) ( ON ?auto_62973 ?auto_62983 ) ( CLEAR ?auto_62973 ) ( not ( = ?auto_62973 ?auto_62983 ) ) ( not ( = ?auto_62974 ?auto_62983 ) ) ( IS-CRATE ?auto_62974 ) ( not ( = ?auto_62973 ?auto_62978 ) ) ( not ( = ?auto_62974 ?auto_62978 ) ) ( not ( = ?auto_62983 ?auto_62978 ) ) ( not ( = ?auto_62980 ?auto_62985 ) ) ( not ( = ?auto_62987 ?auto_62980 ) ) ( HOIST-AT ?auto_62977 ?auto_62980 ) ( not ( = ?auto_62986 ?auto_62977 ) ) ( not ( = ?auto_62988 ?auto_62977 ) ) ( AVAILABLE ?auto_62977 ) ( SURFACE-AT ?auto_62974 ?auto_62980 ) ( ON ?auto_62974 ?auto_62989 ) ( CLEAR ?auto_62974 ) ( not ( = ?auto_62973 ?auto_62989 ) ) ( not ( = ?auto_62974 ?auto_62989 ) ) ( not ( = ?auto_62983 ?auto_62989 ) ) ( not ( = ?auto_62978 ?auto_62989 ) ) ( IS-CRATE ?auto_62978 ) ( not ( = ?auto_62973 ?auto_62990 ) ) ( not ( = ?auto_62974 ?auto_62990 ) ) ( not ( = ?auto_62983 ?auto_62990 ) ) ( not ( = ?auto_62978 ?auto_62990 ) ) ( not ( = ?auto_62989 ?auto_62990 ) ) ( not ( = ?auto_62984 ?auto_62985 ) ) ( not ( = ?auto_62987 ?auto_62984 ) ) ( not ( = ?auto_62980 ?auto_62984 ) ) ( HOIST-AT ?auto_62976 ?auto_62984 ) ( not ( = ?auto_62986 ?auto_62976 ) ) ( not ( = ?auto_62988 ?auto_62976 ) ) ( not ( = ?auto_62977 ?auto_62976 ) ) ( AVAILABLE ?auto_62976 ) ( SURFACE-AT ?auto_62978 ?auto_62984 ) ( ON ?auto_62978 ?auto_62975 ) ( CLEAR ?auto_62978 ) ( not ( = ?auto_62973 ?auto_62975 ) ) ( not ( = ?auto_62974 ?auto_62975 ) ) ( not ( = ?auto_62983 ?auto_62975 ) ) ( not ( = ?auto_62978 ?auto_62975 ) ) ( not ( = ?auto_62989 ?auto_62975 ) ) ( not ( = ?auto_62990 ?auto_62975 ) ) ( SURFACE-AT ?auto_62979 ?auto_62985 ) ( CLEAR ?auto_62979 ) ( IS-CRATE ?auto_62990 ) ( not ( = ?auto_62973 ?auto_62979 ) ) ( not ( = ?auto_62974 ?auto_62979 ) ) ( not ( = ?auto_62983 ?auto_62979 ) ) ( not ( = ?auto_62978 ?auto_62979 ) ) ( not ( = ?auto_62989 ?auto_62979 ) ) ( not ( = ?auto_62990 ?auto_62979 ) ) ( not ( = ?auto_62975 ?auto_62979 ) ) ( AVAILABLE ?auto_62986 ) ( TRUCK-AT ?auto_62982 ?auto_62981 ) ( not ( = ?auto_62981 ?auto_62985 ) ) ( not ( = ?auto_62987 ?auto_62981 ) ) ( not ( = ?auto_62980 ?auto_62981 ) ) ( not ( = ?auto_62984 ?auto_62981 ) ) ( HOIST-AT ?auto_62991 ?auto_62981 ) ( LIFTING ?auto_62991 ?auto_62990 ) ( not ( = ?auto_62986 ?auto_62991 ) ) ( not ( = ?auto_62988 ?auto_62991 ) ) ( not ( = ?auto_62977 ?auto_62991 ) ) ( not ( = ?auto_62976 ?auto_62991 ) ) )
    :subtasks
    ( ( !LOAD ?auto_62991 ?auto_62990 ?auto_62982 ?auto_62981 )
      ( MAKE-ON ?auto_62973 ?auto_62974 )
      ( MAKE-ON-VERIFY ?auto_62973 ?auto_62974 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_62992 - SURFACE
      ?auto_62993 - SURFACE
    )
    :vars
    (
      ?auto_63002 - HOIST
      ?auto_63001 - PLACE
      ?auto_62994 - PLACE
      ?auto_63009 - HOIST
      ?auto_62998 - SURFACE
      ?auto_63008 - SURFACE
      ?auto_63003 - PLACE
      ?auto_63005 - HOIST
      ?auto_63000 - SURFACE
      ?auto_62997 - SURFACE
      ?auto_62996 - PLACE
      ?auto_63007 - HOIST
      ?auto_62999 - SURFACE
      ?auto_63010 - SURFACE
      ?auto_63006 - TRUCK
      ?auto_62995 - PLACE
      ?auto_63004 - HOIST
      ?auto_63011 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63002 ?auto_63001 ) ( IS-CRATE ?auto_62992 ) ( not ( = ?auto_62992 ?auto_62993 ) ) ( not ( = ?auto_62994 ?auto_63001 ) ) ( HOIST-AT ?auto_63009 ?auto_62994 ) ( not ( = ?auto_63002 ?auto_63009 ) ) ( AVAILABLE ?auto_63009 ) ( SURFACE-AT ?auto_62992 ?auto_62994 ) ( ON ?auto_62992 ?auto_62998 ) ( CLEAR ?auto_62992 ) ( not ( = ?auto_62992 ?auto_62998 ) ) ( not ( = ?auto_62993 ?auto_62998 ) ) ( IS-CRATE ?auto_62993 ) ( not ( = ?auto_62992 ?auto_63008 ) ) ( not ( = ?auto_62993 ?auto_63008 ) ) ( not ( = ?auto_62998 ?auto_63008 ) ) ( not ( = ?auto_63003 ?auto_63001 ) ) ( not ( = ?auto_62994 ?auto_63003 ) ) ( HOIST-AT ?auto_63005 ?auto_63003 ) ( not ( = ?auto_63002 ?auto_63005 ) ) ( not ( = ?auto_63009 ?auto_63005 ) ) ( AVAILABLE ?auto_63005 ) ( SURFACE-AT ?auto_62993 ?auto_63003 ) ( ON ?auto_62993 ?auto_63000 ) ( CLEAR ?auto_62993 ) ( not ( = ?auto_62992 ?auto_63000 ) ) ( not ( = ?auto_62993 ?auto_63000 ) ) ( not ( = ?auto_62998 ?auto_63000 ) ) ( not ( = ?auto_63008 ?auto_63000 ) ) ( IS-CRATE ?auto_63008 ) ( not ( = ?auto_62992 ?auto_62997 ) ) ( not ( = ?auto_62993 ?auto_62997 ) ) ( not ( = ?auto_62998 ?auto_62997 ) ) ( not ( = ?auto_63008 ?auto_62997 ) ) ( not ( = ?auto_63000 ?auto_62997 ) ) ( not ( = ?auto_62996 ?auto_63001 ) ) ( not ( = ?auto_62994 ?auto_62996 ) ) ( not ( = ?auto_63003 ?auto_62996 ) ) ( HOIST-AT ?auto_63007 ?auto_62996 ) ( not ( = ?auto_63002 ?auto_63007 ) ) ( not ( = ?auto_63009 ?auto_63007 ) ) ( not ( = ?auto_63005 ?auto_63007 ) ) ( AVAILABLE ?auto_63007 ) ( SURFACE-AT ?auto_63008 ?auto_62996 ) ( ON ?auto_63008 ?auto_62999 ) ( CLEAR ?auto_63008 ) ( not ( = ?auto_62992 ?auto_62999 ) ) ( not ( = ?auto_62993 ?auto_62999 ) ) ( not ( = ?auto_62998 ?auto_62999 ) ) ( not ( = ?auto_63008 ?auto_62999 ) ) ( not ( = ?auto_63000 ?auto_62999 ) ) ( not ( = ?auto_62997 ?auto_62999 ) ) ( SURFACE-AT ?auto_63010 ?auto_63001 ) ( CLEAR ?auto_63010 ) ( IS-CRATE ?auto_62997 ) ( not ( = ?auto_62992 ?auto_63010 ) ) ( not ( = ?auto_62993 ?auto_63010 ) ) ( not ( = ?auto_62998 ?auto_63010 ) ) ( not ( = ?auto_63008 ?auto_63010 ) ) ( not ( = ?auto_63000 ?auto_63010 ) ) ( not ( = ?auto_62997 ?auto_63010 ) ) ( not ( = ?auto_62999 ?auto_63010 ) ) ( AVAILABLE ?auto_63002 ) ( TRUCK-AT ?auto_63006 ?auto_62995 ) ( not ( = ?auto_62995 ?auto_63001 ) ) ( not ( = ?auto_62994 ?auto_62995 ) ) ( not ( = ?auto_63003 ?auto_62995 ) ) ( not ( = ?auto_62996 ?auto_62995 ) ) ( HOIST-AT ?auto_63004 ?auto_62995 ) ( not ( = ?auto_63002 ?auto_63004 ) ) ( not ( = ?auto_63009 ?auto_63004 ) ) ( not ( = ?auto_63005 ?auto_63004 ) ) ( not ( = ?auto_63007 ?auto_63004 ) ) ( AVAILABLE ?auto_63004 ) ( SURFACE-AT ?auto_62997 ?auto_62995 ) ( ON ?auto_62997 ?auto_63011 ) ( CLEAR ?auto_62997 ) ( not ( = ?auto_62992 ?auto_63011 ) ) ( not ( = ?auto_62993 ?auto_63011 ) ) ( not ( = ?auto_62998 ?auto_63011 ) ) ( not ( = ?auto_63008 ?auto_63011 ) ) ( not ( = ?auto_63000 ?auto_63011 ) ) ( not ( = ?auto_62997 ?auto_63011 ) ) ( not ( = ?auto_62999 ?auto_63011 ) ) ( not ( = ?auto_63010 ?auto_63011 ) ) )
    :subtasks
    ( ( !LIFT ?auto_63004 ?auto_62997 ?auto_63011 ?auto_62995 )
      ( MAKE-ON ?auto_62992 ?auto_62993 )
      ( MAKE-ON-VERIFY ?auto_62992 ?auto_62993 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63012 - SURFACE
      ?auto_63013 - SURFACE
    )
    :vars
    (
      ?auto_63019 - HOIST
      ?auto_63022 - PLACE
      ?auto_63030 - PLACE
      ?auto_63029 - HOIST
      ?auto_63015 - SURFACE
      ?auto_63017 - SURFACE
      ?auto_63018 - PLACE
      ?auto_63028 - HOIST
      ?auto_63016 - SURFACE
      ?auto_63025 - SURFACE
      ?auto_63023 - PLACE
      ?auto_63014 - HOIST
      ?auto_63031 - SURFACE
      ?auto_63020 - SURFACE
      ?auto_63024 - PLACE
      ?auto_63027 - HOIST
      ?auto_63021 - SURFACE
      ?auto_63026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63019 ?auto_63022 ) ( IS-CRATE ?auto_63012 ) ( not ( = ?auto_63012 ?auto_63013 ) ) ( not ( = ?auto_63030 ?auto_63022 ) ) ( HOIST-AT ?auto_63029 ?auto_63030 ) ( not ( = ?auto_63019 ?auto_63029 ) ) ( AVAILABLE ?auto_63029 ) ( SURFACE-AT ?auto_63012 ?auto_63030 ) ( ON ?auto_63012 ?auto_63015 ) ( CLEAR ?auto_63012 ) ( not ( = ?auto_63012 ?auto_63015 ) ) ( not ( = ?auto_63013 ?auto_63015 ) ) ( IS-CRATE ?auto_63013 ) ( not ( = ?auto_63012 ?auto_63017 ) ) ( not ( = ?auto_63013 ?auto_63017 ) ) ( not ( = ?auto_63015 ?auto_63017 ) ) ( not ( = ?auto_63018 ?auto_63022 ) ) ( not ( = ?auto_63030 ?auto_63018 ) ) ( HOIST-AT ?auto_63028 ?auto_63018 ) ( not ( = ?auto_63019 ?auto_63028 ) ) ( not ( = ?auto_63029 ?auto_63028 ) ) ( AVAILABLE ?auto_63028 ) ( SURFACE-AT ?auto_63013 ?auto_63018 ) ( ON ?auto_63013 ?auto_63016 ) ( CLEAR ?auto_63013 ) ( not ( = ?auto_63012 ?auto_63016 ) ) ( not ( = ?auto_63013 ?auto_63016 ) ) ( not ( = ?auto_63015 ?auto_63016 ) ) ( not ( = ?auto_63017 ?auto_63016 ) ) ( IS-CRATE ?auto_63017 ) ( not ( = ?auto_63012 ?auto_63025 ) ) ( not ( = ?auto_63013 ?auto_63025 ) ) ( not ( = ?auto_63015 ?auto_63025 ) ) ( not ( = ?auto_63017 ?auto_63025 ) ) ( not ( = ?auto_63016 ?auto_63025 ) ) ( not ( = ?auto_63023 ?auto_63022 ) ) ( not ( = ?auto_63030 ?auto_63023 ) ) ( not ( = ?auto_63018 ?auto_63023 ) ) ( HOIST-AT ?auto_63014 ?auto_63023 ) ( not ( = ?auto_63019 ?auto_63014 ) ) ( not ( = ?auto_63029 ?auto_63014 ) ) ( not ( = ?auto_63028 ?auto_63014 ) ) ( AVAILABLE ?auto_63014 ) ( SURFACE-AT ?auto_63017 ?auto_63023 ) ( ON ?auto_63017 ?auto_63031 ) ( CLEAR ?auto_63017 ) ( not ( = ?auto_63012 ?auto_63031 ) ) ( not ( = ?auto_63013 ?auto_63031 ) ) ( not ( = ?auto_63015 ?auto_63031 ) ) ( not ( = ?auto_63017 ?auto_63031 ) ) ( not ( = ?auto_63016 ?auto_63031 ) ) ( not ( = ?auto_63025 ?auto_63031 ) ) ( SURFACE-AT ?auto_63020 ?auto_63022 ) ( CLEAR ?auto_63020 ) ( IS-CRATE ?auto_63025 ) ( not ( = ?auto_63012 ?auto_63020 ) ) ( not ( = ?auto_63013 ?auto_63020 ) ) ( not ( = ?auto_63015 ?auto_63020 ) ) ( not ( = ?auto_63017 ?auto_63020 ) ) ( not ( = ?auto_63016 ?auto_63020 ) ) ( not ( = ?auto_63025 ?auto_63020 ) ) ( not ( = ?auto_63031 ?auto_63020 ) ) ( AVAILABLE ?auto_63019 ) ( not ( = ?auto_63024 ?auto_63022 ) ) ( not ( = ?auto_63030 ?auto_63024 ) ) ( not ( = ?auto_63018 ?auto_63024 ) ) ( not ( = ?auto_63023 ?auto_63024 ) ) ( HOIST-AT ?auto_63027 ?auto_63024 ) ( not ( = ?auto_63019 ?auto_63027 ) ) ( not ( = ?auto_63029 ?auto_63027 ) ) ( not ( = ?auto_63028 ?auto_63027 ) ) ( not ( = ?auto_63014 ?auto_63027 ) ) ( AVAILABLE ?auto_63027 ) ( SURFACE-AT ?auto_63025 ?auto_63024 ) ( ON ?auto_63025 ?auto_63021 ) ( CLEAR ?auto_63025 ) ( not ( = ?auto_63012 ?auto_63021 ) ) ( not ( = ?auto_63013 ?auto_63021 ) ) ( not ( = ?auto_63015 ?auto_63021 ) ) ( not ( = ?auto_63017 ?auto_63021 ) ) ( not ( = ?auto_63016 ?auto_63021 ) ) ( not ( = ?auto_63025 ?auto_63021 ) ) ( not ( = ?auto_63031 ?auto_63021 ) ) ( not ( = ?auto_63020 ?auto_63021 ) ) ( TRUCK-AT ?auto_63026 ?auto_63022 ) )
    :subtasks
    ( ( !DRIVE ?auto_63026 ?auto_63022 ?auto_63024 )
      ( MAKE-ON ?auto_63012 ?auto_63013 )
      ( MAKE-ON-VERIFY ?auto_63012 ?auto_63013 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63032 - SURFACE
      ?auto_63033 - SURFACE
    )
    :vars
    (
      ?auto_63047 - HOIST
      ?auto_63040 - PLACE
      ?auto_63043 - PLACE
      ?auto_63045 - HOIST
      ?auto_63039 - SURFACE
      ?auto_63037 - SURFACE
      ?auto_63035 - PLACE
      ?auto_63046 - HOIST
      ?auto_63036 - SURFACE
      ?auto_63051 - SURFACE
      ?auto_63048 - PLACE
      ?auto_63034 - HOIST
      ?auto_63044 - SURFACE
      ?auto_63038 - SURFACE
      ?auto_63049 - PLACE
      ?auto_63050 - HOIST
      ?auto_63041 - SURFACE
      ?auto_63042 - TRUCK
      ?auto_63052 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63047 ?auto_63040 ) ( IS-CRATE ?auto_63032 ) ( not ( = ?auto_63032 ?auto_63033 ) ) ( not ( = ?auto_63043 ?auto_63040 ) ) ( HOIST-AT ?auto_63045 ?auto_63043 ) ( not ( = ?auto_63047 ?auto_63045 ) ) ( AVAILABLE ?auto_63045 ) ( SURFACE-AT ?auto_63032 ?auto_63043 ) ( ON ?auto_63032 ?auto_63039 ) ( CLEAR ?auto_63032 ) ( not ( = ?auto_63032 ?auto_63039 ) ) ( not ( = ?auto_63033 ?auto_63039 ) ) ( IS-CRATE ?auto_63033 ) ( not ( = ?auto_63032 ?auto_63037 ) ) ( not ( = ?auto_63033 ?auto_63037 ) ) ( not ( = ?auto_63039 ?auto_63037 ) ) ( not ( = ?auto_63035 ?auto_63040 ) ) ( not ( = ?auto_63043 ?auto_63035 ) ) ( HOIST-AT ?auto_63046 ?auto_63035 ) ( not ( = ?auto_63047 ?auto_63046 ) ) ( not ( = ?auto_63045 ?auto_63046 ) ) ( AVAILABLE ?auto_63046 ) ( SURFACE-AT ?auto_63033 ?auto_63035 ) ( ON ?auto_63033 ?auto_63036 ) ( CLEAR ?auto_63033 ) ( not ( = ?auto_63032 ?auto_63036 ) ) ( not ( = ?auto_63033 ?auto_63036 ) ) ( not ( = ?auto_63039 ?auto_63036 ) ) ( not ( = ?auto_63037 ?auto_63036 ) ) ( IS-CRATE ?auto_63037 ) ( not ( = ?auto_63032 ?auto_63051 ) ) ( not ( = ?auto_63033 ?auto_63051 ) ) ( not ( = ?auto_63039 ?auto_63051 ) ) ( not ( = ?auto_63037 ?auto_63051 ) ) ( not ( = ?auto_63036 ?auto_63051 ) ) ( not ( = ?auto_63048 ?auto_63040 ) ) ( not ( = ?auto_63043 ?auto_63048 ) ) ( not ( = ?auto_63035 ?auto_63048 ) ) ( HOIST-AT ?auto_63034 ?auto_63048 ) ( not ( = ?auto_63047 ?auto_63034 ) ) ( not ( = ?auto_63045 ?auto_63034 ) ) ( not ( = ?auto_63046 ?auto_63034 ) ) ( AVAILABLE ?auto_63034 ) ( SURFACE-AT ?auto_63037 ?auto_63048 ) ( ON ?auto_63037 ?auto_63044 ) ( CLEAR ?auto_63037 ) ( not ( = ?auto_63032 ?auto_63044 ) ) ( not ( = ?auto_63033 ?auto_63044 ) ) ( not ( = ?auto_63039 ?auto_63044 ) ) ( not ( = ?auto_63037 ?auto_63044 ) ) ( not ( = ?auto_63036 ?auto_63044 ) ) ( not ( = ?auto_63051 ?auto_63044 ) ) ( IS-CRATE ?auto_63051 ) ( not ( = ?auto_63032 ?auto_63038 ) ) ( not ( = ?auto_63033 ?auto_63038 ) ) ( not ( = ?auto_63039 ?auto_63038 ) ) ( not ( = ?auto_63037 ?auto_63038 ) ) ( not ( = ?auto_63036 ?auto_63038 ) ) ( not ( = ?auto_63051 ?auto_63038 ) ) ( not ( = ?auto_63044 ?auto_63038 ) ) ( not ( = ?auto_63049 ?auto_63040 ) ) ( not ( = ?auto_63043 ?auto_63049 ) ) ( not ( = ?auto_63035 ?auto_63049 ) ) ( not ( = ?auto_63048 ?auto_63049 ) ) ( HOIST-AT ?auto_63050 ?auto_63049 ) ( not ( = ?auto_63047 ?auto_63050 ) ) ( not ( = ?auto_63045 ?auto_63050 ) ) ( not ( = ?auto_63046 ?auto_63050 ) ) ( not ( = ?auto_63034 ?auto_63050 ) ) ( AVAILABLE ?auto_63050 ) ( SURFACE-AT ?auto_63051 ?auto_63049 ) ( ON ?auto_63051 ?auto_63041 ) ( CLEAR ?auto_63051 ) ( not ( = ?auto_63032 ?auto_63041 ) ) ( not ( = ?auto_63033 ?auto_63041 ) ) ( not ( = ?auto_63039 ?auto_63041 ) ) ( not ( = ?auto_63037 ?auto_63041 ) ) ( not ( = ?auto_63036 ?auto_63041 ) ) ( not ( = ?auto_63051 ?auto_63041 ) ) ( not ( = ?auto_63044 ?auto_63041 ) ) ( not ( = ?auto_63038 ?auto_63041 ) ) ( TRUCK-AT ?auto_63042 ?auto_63040 ) ( SURFACE-AT ?auto_63052 ?auto_63040 ) ( CLEAR ?auto_63052 ) ( LIFTING ?auto_63047 ?auto_63038 ) ( IS-CRATE ?auto_63038 ) ( not ( = ?auto_63032 ?auto_63052 ) ) ( not ( = ?auto_63033 ?auto_63052 ) ) ( not ( = ?auto_63039 ?auto_63052 ) ) ( not ( = ?auto_63037 ?auto_63052 ) ) ( not ( = ?auto_63036 ?auto_63052 ) ) ( not ( = ?auto_63051 ?auto_63052 ) ) ( not ( = ?auto_63044 ?auto_63052 ) ) ( not ( = ?auto_63038 ?auto_63052 ) ) ( not ( = ?auto_63041 ?auto_63052 ) ) )
    :subtasks
    ( ( !DROP ?auto_63047 ?auto_63038 ?auto_63052 ?auto_63040 )
      ( MAKE-ON ?auto_63032 ?auto_63033 )
      ( MAKE-ON-VERIFY ?auto_63032 ?auto_63033 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63053 - SURFACE
      ?auto_63054 - SURFACE
    )
    :vars
    (
      ?auto_63061 - HOIST
      ?auto_63065 - PLACE
      ?auto_63068 - PLACE
      ?auto_63063 - HOIST
      ?auto_63059 - SURFACE
      ?auto_63056 - SURFACE
      ?auto_63058 - PLACE
      ?auto_63066 - HOIST
      ?auto_63057 - SURFACE
      ?auto_63070 - SURFACE
      ?auto_63067 - PLACE
      ?auto_63072 - HOIST
      ?auto_63060 - SURFACE
      ?auto_63055 - SURFACE
      ?auto_63064 - PLACE
      ?auto_63069 - HOIST
      ?auto_63062 - SURFACE
      ?auto_63071 - TRUCK
      ?auto_63073 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63061 ?auto_63065 ) ( IS-CRATE ?auto_63053 ) ( not ( = ?auto_63053 ?auto_63054 ) ) ( not ( = ?auto_63068 ?auto_63065 ) ) ( HOIST-AT ?auto_63063 ?auto_63068 ) ( not ( = ?auto_63061 ?auto_63063 ) ) ( AVAILABLE ?auto_63063 ) ( SURFACE-AT ?auto_63053 ?auto_63068 ) ( ON ?auto_63053 ?auto_63059 ) ( CLEAR ?auto_63053 ) ( not ( = ?auto_63053 ?auto_63059 ) ) ( not ( = ?auto_63054 ?auto_63059 ) ) ( IS-CRATE ?auto_63054 ) ( not ( = ?auto_63053 ?auto_63056 ) ) ( not ( = ?auto_63054 ?auto_63056 ) ) ( not ( = ?auto_63059 ?auto_63056 ) ) ( not ( = ?auto_63058 ?auto_63065 ) ) ( not ( = ?auto_63068 ?auto_63058 ) ) ( HOIST-AT ?auto_63066 ?auto_63058 ) ( not ( = ?auto_63061 ?auto_63066 ) ) ( not ( = ?auto_63063 ?auto_63066 ) ) ( AVAILABLE ?auto_63066 ) ( SURFACE-AT ?auto_63054 ?auto_63058 ) ( ON ?auto_63054 ?auto_63057 ) ( CLEAR ?auto_63054 ) ( not ( = ?auto_63053 ?auto_63057 ) ) ( not ( = ?auto_63054 ?auto_63057 ) ) ( not ( = ?auto_63059 ?auto_63057 ) ) ( not ( = ?auto_63056 ?auto_63057 ) ) ( IS-CRATE ?auto_63056 ) ( not ( = ?auto_63053 ?auto_63070 ) ) ( not ( = ?auto_63054 ?auto_63070 ) ) ( not ( = ?auto_63059 ?auto_63070 ) ) ( not ( = ?auto_63056 ?auto_63070 ) ) ( not ( = ?auto_63057 ?auto_63070 ) ) ( not ( = ?auto_63067 ?auto_63065 ) ) ( not ( = ?auto_63068 ?auto_63067 ) ) ( not ( = ?auto_63058 ?auto_63067 ) ) ( HOIST-AT ?auto_63072 ?auto_63067 ) ( not ( = ?auto_63061 ?auto_63072 ) ) ( not ( = ?auto_63063 ?auto_63072 ) ) ( not ( = ?auto_63066 ?auto_63072 ) ) ( AVAILABLE ?auto_63072 ) ( SURFACE-AT ?auto_63056 ?auto_63067 ) ( ON ?auto_63056 ?auto_63060 ) ( CLEAR ?auto_63056 ) ( not ( = ?auto_63053 ?auto_63060 ) ) ( not ( = ?auto_63054 ?auto_63060 ) ) ( not ( = ?auto_63059 ?auto_63060 ) ) ( not ( = ?auto_63056 ?auto_63060 ) ) ( not ( = ?auto_63057 ?auto_63060 ) ) ( not ( = ?auto_63070 ?auto_63060 ) ) ( IS-CRATE ?auto_63070 ) ( not ( = ?auto_63053 ?auto_63055 ) ) ( not ( = ?auto_63054 ?auto_63055 ) ) ( not ( = ?auto_63059 ?auto_63055 ) ) ( not ( = ?auto_63056 ?auto_63055 ) ) ( not ( = ?auto_63057 ?auto_63055 ) ) ( not ( = ?auto_63070 ?auto_63055 ) ) ( not ( = ?auto_63060 ?auto_63055 ) ) ( not ( = ?auto_63064 ?auto_63065 ) ) ( not ( = ?auto_63068 ?auto_63064 ) ) ( not ( = ?auto_63058 ?auto_63064 ) ) ( not ( = ?auto_63067 ?auto_63064 ) ) ( HOIST-AT ?auto_63069 ?auto_63064 ) ( not ( = ?auto_63061 ?auto_63069 ) ) ( not ( = ?auto_63063 ?auto_63069 ) ) ( not ( = ?auto_63066 ?auto_63069 ) ) ( not ( = ?auto_63072 ?auto_63069 ) ) ( AVAILABLE ?auto_63069 ) ( SURFACE-AT ?auto_63070 ?auto_63064 ) ( ON ?auto_63070 ?auto_63062 ) ( CLEAR ?auto_63070 ) ( not ( = ?auto_63053 ?auto_63062 ) ) ( not ( = ?auto_63054 ?auto_63062 ) ) ( not ( = ?auto_63059 ?auto_63062 ) ) ( not ( = ?auto_63056 ?auto_63062 ) ) ( not ( = ?auto_63057 ?auto_63062 ) ) ( not ( = ?auto_63070 ?auto_63062 ) ) ( not ( = ?auto_63060 ?auto_63062 ) ) ( not ( = ?auto_63055 ?auto_63062 ) ) ( TRUCK-AT ?auto_63071 ?auto_63065 ) ( SURFACE-AT ?auto_63073 ?auto_63065 ) ( CLEAR ?auto_63073 ) ( IS-CRATE ?auto_63055 ) ( not ( = ?auto_63053 ?auto_63073 ) ) ( not ( = ?auto_63054 ?auto_63073 ) ) ( not ( = ?auto_63059 ?auto_63073 ) ) ( not ( = ?auto_63056 ?auto_63073 ) ) ( not ( = ?auto_63057 ?auto_63073 ) ) ( not ( = ?auto_63070 ?auto_63073 ) ) ( not ( = ?auto_63060 ?auto_63073 ) ) ( not ( = ?auto_63055 ?auto_63073 ) ) ( not ( = ?auto_63062 ?auto_63073 ) ) ( AVAILABLE ?auto_63061 ) ( IN ?auto_63055 ?auto_63071 ) )
    :subtasks
    ( ( !UNLOAD ?auto_63061 ?auto_63055 ?auto_63071 ?auto_63065 )
      ( MAKE-ON ?auto_63053 ?auto_63054 )
      ( MAKE-ON-VERIFY ?auto_63053 ?auto_63054 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63074 - SURFACE
      ?auto_63075 - SURFACE
    )
    :vars
    (
      ?auto_63077 - HOIST
      ?auto_63080 - PLACE
      ?auto_63090 - PLACE
      ?auto_63093 - HOIST
      ?auto_63089 - SURFACE
      ?auto_63088 - SURFACE
      ?auto_63094 - PLACE
      ?auto_63079 - HOIST
      ?auto_63091 - SURFACE
      ?auto_63087 - SURFACE
      ?auto_63092 - PLACE
      ?auto_63085 - HOIST
      ?auto_63081 - SURFACE
      ?auto_63082 - SURFACE
      ?auto_63078 - PLACE
      ?auto_63083 - HOIST
      ?auto_63076 - SURFACE
      ?auto_63086 - SURFACE
      ?auto_63084 - TRUCK
      ?auto_63095 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63077 ?auto_63080 ) ( IS-CRATE ?auto_63074 ) ( not ( = ?auto_63074 ?auto_63075 ) ) ( not ( = ?auto_63090 ?auto_63080 ) ) ( HOIST-AT ?auto_63093 ?auto_63090 ) ( not ( = ?auto_63077 ?auto_63093 ) ) ( AVAILABLE ?auto_63093 ) ( SURFACE-AT ?auto_63074 ?auto_63090 ) ( ON ?auto_63074 ?auto_63089 ) ( CLEAR ?auto_63074 ) ( not ( = ?auto_63074 ?auto_63089 ) ) ( not ( = ?auto_63075 ?auto_63089 ) ) ( IS-CRATE ?auto_63075 ) ( not ( = ?auto_63074 ?auto_63088 ) ) ( not ( = ?auto_63075 ?auto_63088 ) ) ( not ( = ?auto_63089 ?auto_63088 ) ) ( not ( = ?auto_63094 ?auto_63080 ) ) ( not ( = ?auto_63090 ?auto_63094 ) ) ( HOIST-AT ?auto_63079 ?auto_63094 ) ( not ( = ?auto_63077 ?auto_63079 ) ) ( not ( = ?auto_63093 ?auto_63079 ) ) ( AVAILABLE ?auto_63079 ) ( SURFACE-AT ?auto_63075 ?auto_63094 ) ( ON ?auto_63075 ?auto_63091 ) ( CLEAR ?auto_63075 ) ( not ( = ?auto_63074 ?auto_63091 ) ) ( not ( = ?auto_63075 ?auto_63091 ) ) ( not ( = ?auto_63089 ?auto_63091 ) ) ( not ( = ?auto_63088 ?auto_63091 ) ) ( IS-CRATE ?auto_63088 ) ( not ( = ?auto_63074 ?auto_63087 ) ) ( not ( = ?auto_63075 ?auto_63087 ) ) ( not ( = ?auto_63089 ?auto_63087 ) ) ( not ( = ?auto_63088 ?auto_63087 ) ) ( not ( = ?auto_63091 ?auto_63087 ) ) ( not ( = ?auto_63092 ?auto_63080 ) ) ( not ( = ?auto_63090 ?auto_63092 ) ) ( not ( = ?auto_63094 ?auto_63092 ) ) ( HOIST-AT ?auto_63085 ?auto_63092 ) ( not ( = ?auto_63077 ?auto_63085 ) ) ( not ( = ?auto_63093 ?auto_63085 ) ) ( not ( = ?auto_63079 ?auto_63085 ) ) ( AVAILABLE ?auto_63085 ) ( SURFACE-AT ?auto_63088 ?auto_63092 ) ( ON ?auto_63088 ?auto_63081 ) ( CLEAR ?auto_63088 ) ( not ( = ?auto_63074 ?auto_63081 ) ) ( not ( = ?auto_63075 ?auto_63081 ) ) ( not ( = ?auto_63089 ?auto_63081 ) ) ( not ( = ?auto_63088 ?auto_63081 ) ) ( not ( = ?auto_63091 ?auto_63081 ) ) ( not ( = ?auto_63087 ?auto_63081 ) ) ( IS-CRATE ?auto_63087 ) ( not ( = ?auto_63074 ?auto_63082 ) ) ( not ( = ?auto_63075 ?auto_63082 ) ) ( not ( = ?auto_63089 ?auto_63082 ) ) ( not ( = ?auto_63088 ?auto_63082 ) ) ( not ( = ?auto_63091 ?auto_63082 ) ) ( not ( = ?auto_63087 ?auto_63082 ) ) ( not ( = ?auto_63081 ?auto_63082 ) ) ( not ( = ?auto_63078 ?auto_63080 ) ) ( not ( = ?auto_63090 ?auto_63078 ) ) ( not ( = ?auto_63094 ?auto_63078 ) ) ( not ( = ?auto_63092 ?auto_63078 ) ) ( HOIST-AT ?auto_63083 ?auto_63078 ) ( not ( = ?auto_63077 ?auto_63083 ) ) ( not ( = ?auto_63093 ?auto_63083 ) ) ( not ( = ?auto_63079 ?auto_63083 ) ) ( not ( = ?auto_63085 ?auto_63083 ) ) ( AVAILABLE ?auto_63083 ) ( SURFACE-AT ?auto_63087 ?auto_63078 ) ( ON ?auto_63087 ?auto_63076 ) ( CLEAR ?auto_63087 ) ( not ( = ?auto_63074 ?auto_63076 ) ) ( not ( = ?auto_63075 ?auto_63076 ) ) ( not ( = ?auto_63089 ?auto_63076 ) ) ( not ( = ?auto_63088 ?auto_63076 ) ) ( not ( = ?auto_63091 ?auto_63076 ) ) ( not ( = ?auto_63087 ?auto_63076 ) ) ( not ( = ?auto_63081 ?auto_63076 ) ) ( not ( = ?auto_63082 ?auto_63076 ) ) ( SURFACE-AT ?auto_63086 ?auto_63080 ) ( CLEAR ?auto_63086 ) ( IS-CRATE ?auto_63082 ) ( not ( = ?auto_63074 ?auto_63086 ) ) ( not ( = ?auto_63075 ?auto_63086 ) ) ( not ( = ?auto_63089 ?auto_63086 ) ) ( not ( = ?auto_63088 ?auto_63086 ) ) ( not ( = ?auto_63091 ?auto_63086 ) ) ( not ( = ?auto_63087 ?auto_63086 ) ) ( not ( = ?auto_63081 ?auto_63086 ) ) ( not ( = ?auto_63082 ?auto_63086 ) ) ( not ( = ?auto_63076 ?auto_63086 ) ) ( AVAILABLE ?auto_63077 ) ( IN ?auto_63082 ?auto_63084 ) ( TRUCK-AT ?auto_63084 ?auto_63095 ) ( not ( = ?auto_63095 ?auto_63080 ) ) ( not ( = ?auto_63090 ?auto_63095 ) ) ( not ( = ?auto_63094 ?auto_63095 ) ) ( not ( = ?auto_63092 ?auto_63095 ) ) ( not ( = ?auto_63078 ?auto_63095 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_63084 ?auto_63095 ?auto_63080 )
      ( MAKE-ON ?auto_63074 ?auto_63075 )
      ( MAKE-ON-VERIFY ?auto_63074 ?auto_63075 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63096 - SURFACE
      ?auto_63097 - SURFACE
    )
    :vars
    (
      ?auto_63103 - HOIST
      ?auto_63110 - PLACE
      ?auto_63098 - PLACE
      ?auto_63109 - HOIST
      ?auto_63114 - SURFACE
      ?auto_63107 - SURFACE
      ?auto_63105 - PLACE
      ?auto_63111 - HOIST
      ?auto_63108 - SURFACE
      ?auto_63115 - SURFACE
      ?auto_63106 - PLACE
      ?auto_63116 - HOIST
      ?auto_63101 - SURFACE
      ?auto_63099 - SURFACE
      ?auto_63112 - PLACE
      ?auto_63117 - HOIST
      ?auto_63104 - SURFACE
      ?auto_63102 - SURFACE
      ?auto_63113 - TRUCK
      ?auto_63100 - PLACE
      ?auto_63118 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_63103 ?auto_63110 ) ( IS-CRATE ?auto_63096 ) ( not ( = ?auto_63096 ?auto_63097 ) ) ( not ( = ?auto_63098 ?auto_63110 ) ) ( HOIST-AT ?auto_63109 ?auto_63098 ) ( not ( = ?auto_63103 ?auto_63109 ) ) ( AVAILABLE ?auto_63109 ) ( SURFACE-AT ?auto_63096 ?auto_63098 ) ( ON ?auto_63096 ?auto_63114 ) ( CLEAR ?auto_63096 ) ( not ( = ?auto_63096 ?auto_63114 ) ) ( not ( = ?auto_63097 ?auto_63114 ) ) ( IS-CRATE ?auto_63097 ) ( not ( = ?auto_63096 ?auto_63107 ) ) ( not ( = ?auto_63097 ?auto_63107 ) ) ( not ( = ?auto_63114 ?auto_63107 ) ) ( not ( = ?auto_63105 ?auto_63110 ) ) ( not ( = ?auto_63098 ?auto_63105 ) ) ( HOIST-AT ?auto_63111 ?auto_63105 ) ( not ( = ?auto_63103 ?auto_63111 ) ) ( not ( = ?auto_63109 ?auto_63111 ) ) ( AVAILABLE ?auto_63111 ) ( SURFACE-AT ?auto_63097 ?auto_63105 ) ( ON ?auto_63097 ?auto_63108 ) ( CLEAR ?auto_63097 ) ( not ( = ?auto_63096 ?auto_63108 ) ) ( not ( = ?auto_63097 ?auto_63108 ) ) ( not ( = ?auto_63114 ?auto_63108 ) ) ( not ( = ?auto_63107 ?auto_63108 ) ) ( IS-CRATE ?auto_63107 ) ( not ( = ?auto_63096 ?auto_63115 ) ) ( not ( = ?auto_63097 ?auto_63115 ) ) ( not ( = ?auto_63114 ?auto_63115 ) ) ( not ( = ?auto_63107 ?auto_63115 ) ) ( not ( = ?auto_63108 ?auto_63115 ) ) ( not ( = ?auto_63106 ?auto_63110 ) ) ( not ( = ?auto_63098 ?auto_63106 ) ) ( not ( = ?auto_63105 ?auto_63106 ) ) ( HOIST-AT ?auto_63116 ?auto_63106 ) ( not ( = ?auto_63103 ?auto_63116 ) ) ( not ( = ?auto_63109 ?auto_63116 ) ) ( not ( = ?auto_63111 ?auto_63116 ) ) ( AVAILABLE ?auto_63116 ) ( SURFACE-AT ?auto_63107 ?auto_63106 ) ( ON ?auto_63107 ?auto_63101 ) ( CLEAR ?auto_63107 ) ( not ( = ?auto_63096 ?auto_63101 ) ) ( not ( = ?auto_63097 ?auto_63101 ) ) ( not ( = ?auto_63114 ?auto_63101 ) ) ( not ( = ?auto_63107 ?auto_63101 ) ) ( not ( = ?auto_63108 ?auto_63101 ) ) ( not ( = ?auto_63115 ?auto_63101 ) ) ( IS-CRATE ?auto_63115 ) ( not ( = ?auto_63096 ?auto_63099 ) ) ( not ( = ?auto_63097 ?auto_63099 ) ) ( not ( = ?auto_63114 ?auto_63099 ) ) ( not ( = ?auto_63107 ?auto_63099 ) ) ( not ( = ?auto_63108 ?auto_63099 ) ) ( not ( = ?auto_63115 ?auto_63099 ) ) ( not ( = ?auto_63101 ?auto_63099 ) ) ( not ( = ?auto_63112 ?auto_63110 ) ) ( not ( = ?auto_63098 ?auto_63112 ) ) ( not ( = ?auto_63105 ?auto_63112 ) ) ( not ( = ?auto_63106 ?auto_63112 ) ) ( HOIST-AT ?auto_63117 ?auto_63112 ) ( not ( = ?auto_63103 ?auto_63117 ) ) ( not ( = ?auto_63109 ?auto_63117 ) ) ( not ( = ?auto_63111 ?auto_63117 ) ) ( not ( = ?auto_63116 ?auto_63117 ) ) ( AVAILABLE ?auto_63117 ) ( SURFACE-AT ?auto_63115 ?auto_63112 ) ( ON ?auto_63115 ?auto_63104 ) ( CLEAR ?auto_63115 ) ( not ( = ?auto_63096 ?auto_63104 ) ) ( not ( = ?auto_63097 ?auto_63104 ) ) ( not ( = ?auto_63114 ?auto_63104 ) ) ( not ( = ?auto_63107 ?auto_63104 ) ) ( not ( = ?auto_63108 ?auto_63104 ) ) ( not ( = ?auto_63115 ?auto_63104 ) ) ( not ( = ?auto_63101 ?auto_63104 ) ) ( not ( = ?auto_63099 ?auto_63104 ) ) ( SURFACE-AT ?auto_63102 ?auto_63110 ) ( CLEAR ?auto_63102 ) ( IS-CRATE ?auto_63099 ) ( not ( = ?auto_63096 ?auto_63102 ) ) ( not ( = ?auto_63097 ?auto_63102 ) ) ( not ( = ?auto_63114 ?auto_63102 ) ) ( not ( = ?auto_63107 ?auto_63102 ) ) ( not ( = ?auto_63108 ?auto_63102 ) ) ( not ( = ?auto_63115 ?auto_63102 ) ) ( not ( = ?auto_63101 ?auto_63102 ) ) ( not ( = ?auto_63099 ?auto_63102 ) ) ( not ( = ?auto_63104 ?auto_63102 ) ) ( AVAILABLE ?auto_63103 ) ( TRUCK-AT ?auto_63113 ?auto_63100 ) ( not ( = ?auto_63100 ?auto_63110 ) ) ( not ( = ?auto_63098 ?auto_63100 ) ) ( not ( = ?auto_63105 ?auto_63100 ) ) ( not ( = ?auto_63106 ?auto_63100 ) ) ( not ( = ?auto_63112 ?auto_63100 ) ) ( HOIST-AT ?auto_63118 ?auto_63100 ) ( LIFTING ?auto_63118 ?auto_63099 ) ( not ( = ?auto_63103 ?auto_63118 ) ) ( not ( = ?auto_63109 ?auto_63118 ) ) ( not ( = ?auto_63111 ?auto_63118 ) ) ( not ( = ?auto_63116 ?auto_63118 ) ) ( not ( = ?auto_63117 ?auto_63118 ) ) )
    :subtasks
    ( ( !LOAD ?auto_63118 ?auto_63099 ?auto_63113 ?auto_63100 )
      ( MAKE-ON ?auto_63096 ?auto_63097 )
      ( MAKE-ON-VERIFY ?auto_63096 ?auto_63097 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63119 - SURFACE
      ?auto_63120 - SURFACE
    )
    :vars
    (
      ?auto_63132 - HOIST
      ?auto_63139 - PLACE
      ?auto_63128 - PLACE
      ?auto_63130 - HOIST
      ?auto_63123 - SURFACE
      ?auto_63138 - SURFACE
      ?auto_63121 - PLACE
      ?auto_63137 - HOIST
      ?auto_63126 - SURFACE
      ?auto_63129 - SURFACE
      ?auto_63135 - PLACE
      ?auto_63122 - HOIST
      ?auto_63141 - SURFACE
      ?auto_63131 - SURFACE
      ?auto_63127 - PLACE
      ?auto_63124 - HOIST
      ?auto_63134 - SURFACE
      ?auto_63125 - SURFACE
      ?auto_63133 - TRUCK
      ?auto_63140 - PLACE
      ?auto_63136 - HOIST
      ?auto_63142 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63132 ?auto_63139 ) ( IS-CRATE ?auto_63119 ) ( not ( = ?auto_63119 ?auto_63120 ) ) ( not ( = ?auto_63128 ?auto_63139 ) ) ( HOIST-AT ?auto_63130 ?auto_63128 ) ( not ( = ?auto_63132 ?auto_63130 ) ) ( AVAILABLE ?auto_63130 ) ( SURFACE-AT ?auto_63119 ?auto_63128 ) ( ON ?auto_63119 ?auto_63123 ) ( CLEAR ?auto_63119 ) ( not ( = ?auto_63119 ?auto_63123 ) ) ( not ( = ?auto_63120 ?auto_63123 ) ) ( IS-CRATE ?auto_63120 ) ( not ( = ?auto_63119 ?auto_63138 ) ) ( not ( = ?auto_63120 ?auto_63138 ) ) ( not ( = ?auto_63123 ?auto_63138 ) ) ( not ( = ?auto_63121 ?auto_63139 ) ) ( not ( = ?auto_63128 ?auto_63121 ) ) ( HOIST-AT ?auto_63137 ?auto_63121 ) ( not ( = ?auto_63132 ?auto_63137 ) ) ( not ( = ?auto_63130 ?auto_63137 ) ) ( AVAILABLE ?auto_63137 ) ( SURFACE-AT ?auto_63120 ?auto_63121 ) ( ON ?auto_63120 ?auto_63126 ) ( CLEAR ?auto_63120 ) ( not ( = ?auto_63119 ?auto_63126 ) ) ( not ( = ?auto_63120 ?auto_63126 ) ) ( not ( = ?auto_63123 ?auto_63126 ) ) ( not ( = ?auto_63138 ?auto_63126 ) ) ( IS-CRATE ?auto_63138 ) ( not ( = ?auto_63119 ?auto_63129 ) ) ( not ( = ?auto_63120 ?auto_63129 ) ) ( not ( = ?auto_63123 ?auto_63129 ) ) ( not ( = ?auto_63138 ?auto_63129 ) ) ( not ( = ?auto_63126 ?auto_63129 ) ) ( not ( = ?auto_63135 ?auto_63139 ) ) ( not ( = ?auto_63128 ?auto_63135 ) ) ( not ( = ?auto_63121 ?auto_63135 ) ) ( HOIST-AT ?auto_63122 ?auto_63135 ) ( not ( = ?auto_63132 ?auto_63122 ) ) ( not ( = ?auto_63130 ?auto_63122 ) ) ( not ( = ?auto_63137 ?auto_63122 ) ) ( AVAILABLE ?auto_63122 ) ( SURFACE-AT ?auto_63138 ?auto_63135 ) ( ON ?auto_63138 ?auto_63141 ) ( CLEAR ?auto_63138 ) ( not ( = ?auto_63119 ?auto_63141 ) ) ( not ( = ?auto_63120 ?auto_63141 ) ) ( not ( = ?auto_63123 ?auto_63141 ) ) ( not ( = ?auto_63138 ?auto_63141 ) ) ( not ( = ?auto_63126 ?auto_63141 ) ) ( not ( = ?auto_63129 ?auto_63141 ) ) ( IS-CRATE ?auto_63129 ) ( not ( = ?auto_63119 ?auto_63131 ) ) ( not ( = ?auto_63120 ?auto_63131 ) ) ( not ( = ?auto_63123 ?auto_63131 ) ) ( not ( = ?auto_63138 ?auto_63131 ) ) ( not ( = ?auto_63126 ?auto_63131 ) ) ( not ( = ?auto_63129 ?auto_63131 ) ) ( not ( = ?auto_63141 ?auto_63131 ) ) ( not ( = ?auto_63127 ?auto_63139 ) ) ( not ( = ?auto_63128 ?auto_63127 ) ) ( not ( = ?auto_63121 ?auto_63127 ) ) ( not ( = ?auto_63135 ?auto_63127 ) ) ( HOIST-AT ?auto_63124 ?auto_63127 ) ( not ( = ?auto_63132 ?auto_63124 ) ) ( not ( = ?auto_63130 ?auto_63124 ) ) ( not ( = ?auto_63137 ?auto_63124 ) ) ( not ( = ?auto_63122 ?auto_63124 ) ) ( AVAILABLE ?auto_63124 ) ( SURFACE-AT ?auto_63129 ?auto_63127 ) ( ON ?auto_63129 ?auto_63134 ) ( CLEAR ?auto_63129 ) ( not ( = ?auto_63119 ?auto_63134 ) ) ( not ( = ?auto_63120 ?auto_63134 ) ) ( not ( = ?auto_63123 ?auto_63134 ) ) ( not ( = ?auto_63138 ?auto_63134 ) ) ( not ( = ?auto_63126 ?auto_63134 ) ) ( not ( = ?auto_63129 ?auto_63134 ) ) ( not ( = ?auto_63141 ?auto_63134 ) ) ( not ( = ?auto_63131 ?auto_63134 ) ) ( SURFACE-AT ?auto_63125 ?auto_63139 ) ( CLEAR ?auto_63125 ) ( IS-CRATE ?auto_63131 ) ( not ( = ?auto_63119 ?auto_63125 ) ) ( not ( = ?auto_63120 ?auto_63125 ) ) ( not ( = ?auto_63123 ?auto_63125 ) ) ( not ( = ?auto_63138 ?auto_63125 ) ) ( not ( = ?auto_63126 ?auto_63125 ) ) ( not ( = ?auto_63129 ?auto_63125 ) ) ( not ( = ?auto_63141 ?auto_63125 ) ) ( not ( = ?auto_63131 ?auto_63125 ) ) ( not ( = ?auto_63134 ?auto_63125 ) ) ( AVAILABLE ?auto_63132 ) ( TRUCK-AT ?auto_63133 ?auto_63140 ) ( not ( = ?auto_63140 ?auto_63139 ) ) ( not ( = ?auto_63128 ?auto_63140 ) ) ( not ( = ?auto_63121 ?auto_63140 ) ) ( not ( = ?auto_63135 ?auto_63140 ) ) ( not ( = ?auto_63127 ?auto_63140 ) ) ( HOIST-AT ?auto_63136 ?auto_63140 ) ( not ( = ?auto_63132 ?auto_63136 ) ) ( not ( = ?auto_63130 ?auto_63136 ) ) ( not ( = ?auto_63137 ?auto_63136 ) ) ( not ( = ?auto_63122 ?auto_63136 ) ) ( not ( = ?auto_63124 ?auto_63136 ) ) ( AVAILABLE ?auto_63136 ) ( SURFACE-AT ?auto_63131 ?auto_63140 ) ( ON ?auto_63131 ?auto_63142 ) ( CLEAR ?auto_63131 ) ( not ( = ?auto_63119 ?auto_63142 ) ) ( not ( = ?auto_63120 ?auto_63142 ) ) ( not ( = ?auto_63123 ?auto_63142 ) ) ( not ( = ?auto_63138 ?auto_63142 ) ) ( not ( = ?auto_63126 ?auto_63142 ) ) ( not ( = ?auto_63129 ?auto_63142 ) ) ( not ( = ?auto_63141 ?auto_63142 ) ) ( not ( = ?auto_63131 ?auto_63142 ) ) ( not ( = ?auto_63134 ?auto_63142 ) ) ( not ( = ?auto_63125 ?auto_63142 ) ) )
    :subtasks
    ( ( !LIFT ?auto_63136 ?auto_63131 ?auto_63142 ?auto_63140 )
      ( MAKE-ON ?auto_63119 ?auto_63120 )
      ( MAKE-ON-VERIFY ?auto_63119 ?auto_63120 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63143 - SURFACE
      ?auto_63144 - SURFACE
    )
    :vars
    (
      ?auto_63154 - HOIST
      ?auto_63147 - PLACE
      ?auto_63166 - PLACE
      ?auto_63158 - HOIST
      ?auto_63152 - SURFACE
      ?auto_63165 - SURFACE
      ?auto_63162 - PLACE
      ?auto_63164 - HOIST
      ?auto_63153 - SURFACE
      ?auto_63161 - SURFACE
      ?auto_63145 - PLACE
      ?auto_63151 - HOIST
      ?auto_63156 - SURFACE
      ?auto_63149 - SURFACE
      ?auto_63150 - PLACE
      ?auto_63157 - HOIST
      ?auto_63163 - SURFACE
      ?auto_63155 - SURFACE
      ?auto_63146 - PLACE
      ?auto_63148 - HOIST
      ?auto_63160 - SURFACE
      ?auto_63159 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63154 ?auto_63147 ) ( IS-CRATE ?auto_63143 ) ( not ( = ?auto_63143 ?auto_63144 ) ) ( not ( = ?auto_63166 ?auto_63147 ) ) ( HOIST-AT ?auto_63158 ?auto_63166 ) ( not ( = ?auto_63154 ?auto_63158 ) ) ( AVAILABLE ?auto_63158 ) ( SURFACE-AT ?auto_63143 ?auto_63166 ) ( ON ?auto_63143 ?auto_63152 ) ( CLEAR ?auto_63143 ) ( not ( = ?auto_63143 ?auto_63152 ) ) ( not ( = ?auto_63144 ?auto_63152 ) ) ( IS-CRATE ?auto_63144 ) ( not ( = ?auto_63143 ?auto_63165 ) ) ( not ( = ?auto_63144 ?auto_63165 ) ) ( not ( = ?auto_63152 ?auto_63165 ) ) ( not ( = ?auto_63162 ?auto_63147 ) ) ( not ( = ?auto_63166 ?auto_63162 ) ) ( HOIST-AT ?auto_63164 ?auto_63162 ) ( not ( = ?auto_63154 ?auto_63164 ) ) ( not ( = ?auto_63158 ?auto_63164 ) ) ( AVAILABLE ?auto_63164 ) ( SURFACE-AT ?auto_63144 ?auto_63162 ) ( ON ?auto_63144 ?auto_63153 ) ( CLEAR ?auto_63144 ) ( not ( = ?auto_63143 ?auto_63153 ) ) ( not ( = ?auto_63144 ?auto_63153 ) ) ( not ( = ?auto_63152 ?auto_63153 ) ) ( not ( = ?auto_63165 ?auto_63153 ) ) ( IS-CRATE ?auto_63165 ) ( not ( = ?auto_63143 ?auto_63161 ) ) ( not ( = ?auto_63144 ?auto_63161 ) ) ( not ( = ?auto_63152 ?auto_63161 ) ) ( not ( = ?auto_63165 ?auto_63161 ) ) ( not ( = ?auto_63153 ?auto_63161 ) ) ( not ( = ?auto_63145 ?auto_63147 ) ) ( not ( = ?auto_63166 ?auto_63145 ) ) ( not ( = ?auto_63162 ?auto_63145 ) ) ( HOIST-AT ?auto_63151 ?auto_63145 ) ( not ( = ?auto_63154 ?auto_63151 ) ) ( not ( = ?auto_63158 ?auto_63151 ) ) ( not ( = ?auto_63164 ?auto_63151 ) ) ( AVAILABLE ?auto_63151 ) ( SURFACE-AT ?auto_63165 ?auto_63145 ) ( ON ?auto_63165 ?auto_63156 ) ( CLEAR ?auto_63165 ) ( not ( = ?auto_63143 ?auto_63156 ) ) ( not ( = ?auto_63144 ?auto_63156 ) ) ( not ( = ?auto_63152 ?auto_63156 ) ) ( not ( = ?auto_63165 ?auto_63156 ) ) ( not ( = ?auto_63153 ?auto_63156 ) ) ( not ( = ?auto_63161 ?auto_63156 ) ) ( IS-CRATE ?auto_63161 ) ( not ( = ?auto_63143 ?auto_63149 ) ) ( not ( = ?auto_63144 ?auto_63149 ) ) ( not ( = ?auto_63152 ?auto_63149 ) ) ( not ( = ?auto_63165 ?auto_63149 ) ) ( not ( = ?auto_63153 ?auto_63149 ) ) ( not ( = ?auto_63161 ?auto_63149 ) ) ( not ( = ?auto_63156 ?auto_63149 ) ) ( not ( = ?auto_63150 ?auto_63147 ) ) ( not ( = ?auto_63166 ?auto_63150 ) ) ( not ( = ?auto_63162 ?auto_63150 ) ) ( not ( = ?auto_63145 ?auto_63150 ) ) ( HOIST-AT ?auto_63157 ?auto_63150 ) ( not ( = ?auto_63154 ?auto_63157 ) ) ( not ( = ?auto_63158 ?auto_63157 ) ) ( not ( = ?auto_63164 ?auto_63157 ) ) ( not ( = ?auto_63151 ?auto_63157 ) ) ( AVAILABLE ?auto_63157 ) ( SURFACE-AT ?auto_63161 ?auto_63150 ) ( ON ?auto_63161 ?auto_63163 ) ( CLEAR ?auto_63161 ) ( not ( = ?auto_63143 ?auto_63163 ) ) ( not ( = ?auto_63144 ?auto_63163 ) ) ( not ( = ?auto_63152 ?auto_63163 ) ) ( not ( = ?auto_63165 ?auto_63163 ) ) ( not ( = ?auto_63153 ?auto_63163 ) ) ( not ( = ?auto_63161 ?auto_63163 ) ) ( not ( = ?auto_63156 ?auto_63163 ) ) ( not ( = ?auto_63149 ?auto_63163 ) ) ( SURFACE-AT ?auto_63155 ?auto_63147 ) ( CLEAR ?auto_63155 ) ( IS-CRATE ?auto_63149 ) ( not ( = ?auto_63143 ?auto_63155 ) ) ( not ( = ?auto_63144 ?auto_63155 ) ) ( not ( = ?auto_63152 ?auto_63155 ) ) ( not ( = ?auto_63165 ?auto_63155 ) ) ( not ( = ?auto_63153 ?auto_63155 ) ) ( not ( = ?auto_63161 ?auto_63155 ) ) ( not ( = ?auto_63156 ?auto_63155 ) ) ( not ( = ?auto_63149 ?auto_63155 ) ) ( not ( = ?auto_63163 ?auto_63155 ) ) ( AVAILABLE ?auto_63154 ) ( not ( = ?auto_63146 ?auto_63147 ) ) ( not ( = ?auto_63166 ?auto_63146 ) ) ( not ( = ?auto_63162 ?auto_63146 ) ) ( not ( = ?auto_63145 ?auto_63146 ) ) ( not ( = ?auto_63150 ?auto_63146 ) ) ( HOIST-AT ?auto_63148 ?auto_63146 ) ( not ( = ?auto_63154 ?auto_63148 ) ) ( not ( = ?auto_63158 ?auto_63148 ) ) ( not ( = ?auto_63164 ?auto_63148 ) ) ( not ( = ?auto_63151 ?auto_63148 ) ) ( not ( = ?auto_63157 ?auto_63148 ) ) ( AVAILABLE ?auto_63148 ) ( SURFACE-AT ?auto_63149 ?auto_63146 ) ( ON ?auto_63149 ?auto_63160 ) ( CLEAR ?auto_63149 ) ( not ( = ?auto_63143 ?auto_63160 ) ) ( not ( = ?auto_63144 ?auto_63160 ) ) ( not ( = ?auto_63152 ?auto_63160 ) ) ( not ( = ?auto_63165 ?auto_63160 ) ) ( not ( = ?auto_63153 ?auto_63160 ) ) ( not ( = ?auto_63161 ?auto_63160 ) ) ( not ( = ?auto_63156 ?auto_63160 ) ) ( not ( = ?auto_63149 ?auto_63160 ) ) ( not ( = ?auto_63163 ?auto_63160 ) ) ( not ( = ?auto_63155 ?auto_63160 ) ) ( TRUCK-AT ?auto_63159 ?auto_63147 ) )
    :subtasks
    ( ( !DRIVE ?auto_63159 ?auto_63147 ?auto_63146 )
      ( MAKE-ON ?auto_63143 ?auto_63144 )
      ( MAKE-ON-VERIFY ?auto_63143 ?auto_63144 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63167 - SURFACE
      ?auto_63168 - SURFACE
    )
    :vars
    (
      ?auto_63169 - HOIST
      ?auto_63190 - PLACE
      ?auto_63172 - PLACE
      ?auto_63176 - HOIST
      ?auto_63180 - SURFACE
      ?auto_63173 - SURFACE
      ?auto_63182 - PLACE
      ?auto_63184 - HOIST
      ?auto_63189 - SURFACE
      ?auto_63181 - SURFACE
      ?auto_63185 - PLACE
      ?auto_63170 - HOIST
      ?auto_63177 - SURFACE
      ?auto_63178 - SURFACE
      ?auto_63187 - PLACE
      ?auto_63188 - HOIST
      ?auto_63183 - SURFACE
      ?auto_63175 - SURFACE
      ?auto_63179 - PLACE
      ?auto_63171 - HOIST
      ?auto_63174 - SURFACE
      ?auto_63186 - TRUCK
      ?auto_63191 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63169 ?auto_63190 ) ( IS-CRATE ?auto_63167 ) ( not ( = ?auto_63167 ?auto_63168 ) ) ( not ( = ?auto_63172 ?auto_63190 ) ) ( HOIST-AT ?auto_63176 ?auto_63172 ) ( not ( = ?auto_63169 ?auto_63176 ) ) ( AVAILABLE ?auto_63176 ) ( SURFACE-AT ?auto_63167 ?auto_63172 ) ( ON ?auto_63167 ?auto_63180 ) ( CLEAR ?auto_63167 ) ( not ( = ?auto_63167 ?auto_63180 ) ) ( not ( = ?auto_63168 ?auto_63180 ) ) ( IS-CRATE ?auto_63168 ) ( not ( = ?auto_63167 ?auto_63173 ) ) ( not ( = ?auto_63168 ?auto_63173 ) ) ( not ( = ?auto_63180 ?auto_63173 ) ) ( not ( = ?auto_63182 ?auto_63190 ) ) ( not ( = ?auto_63172 ?auto_63182 ) ) ( HOIST-AT ?auto_63184 ?auto_63182 ) ( not ( = ?auto_63169 ?auto_63184 ) ) ( not ( = ?auto_63176 ?auto_63184 ) ) ( AVAILABLE ?auto_63184 ) ( SURFACE-AT ?auto_63168 ?auto_63182 ) ( ON ?auto_63168 ?auto_63189 ) ( CLEAR ?auto_63168 ) ( not ( = ?auto_63167 ?auto_63189 ) ) ( not ( = ?auto_63168 ?auto_63189 ) ) ( not ( = ?auto_63180 ?auto_63189 ) ) ( not ( = ?auto_63173 ?auto_63189 ) ) ( IS-CRATE ?auto_63173 ) ( not ( = ?auto_63167 ?auto_63181 ) ) ( not ( = ?auto_63168 ?auto_63181 ) ) ( not ( = ?auto_63180 ?auto_63181 ) ) ( not ( = ?auto_63173 ?auto_63181 ) ) ( not ( = ?auto_63189 ?auto_63181 ) ) ( not ( = ?auto_63185 ?auto_63190 ) ) ( not ( = ?auto_63172 ?auto_63185 ) ) ( not ( = ?auto_63182 ?auto_63185 ) ) ( HOIST-AT ?auto_63170 ?auto_63185 ) ( not ( = ?auto_63169 ?auto_63170 ) ) ( not ( = ?auto_63176 ?auto_63170 ) ) ( not ( = ?auto_63184 ?auto_63170 ) ) ( AVAILABLE ?auto_63170 ) ( SURFACE-AT ?auto_63173 ?auto_63185 ) ( ON ?auto_63173 ?auto_63177 ) ( CLEAR ?auto_63173 ) ( not ( = ?auto_63167 ?auto_63177 ) ) ( not ( = ?auto_63168 ?auto_63177 ) ) ( not ( = ?auto_63180 ?auto_63177 ) ) ( not ( = ?auto_63173 ?auto_63177 ) ) ( not ( = ?auto_63189 ?auto_63177 ) ) ( not ( = ?auto_63181 ?auto_63177 ) ) ( IS-CRATE ?auto_63181 ) ( not ( = ?auto_63167 ?auto_63178 ) ) ( not ( = ?auto_63168 ?auto_63178 ) ) ( not ( = ?auto_63180 ?auto_63178 ) ) ( not ( = ?auto_63173 ?auto_63178 ) ) ( not ( = ?auto_63189 ?auto_63178 ) ) ( not ( = ?auto_63181 ?auto_63178 ) ) ( not ( = ?auto_63177 ?auto_63178 ) ) ( not ( = ?auto_63187 ?auto_63190 ) ) ( not ( = ?auto_63172 ?auto_63187 ) ) ( not ( = ?auto_63182 ?auto_63187 ) ) ( not ( = ?auto_63185 ?auto_63187 ) ) ( HOIST-AT ?auto_63188 ?auto_63187 ) ( not ( = ?auto_63169 ?auto_63188 ) ) ( not ( = ?auto_63176 ?auto_63188 ) ) ( not ( = ?auto_63184 ?auto_63188 ) ) ( not ( = ?auto_63170 ?auto_63188 ) ) ( AVAILABLE ?auto_63188 ) ( SURFACE-AT ?auto_63181 ?auto_63187 ) ( ON ?auto_63181 ?auto_63183 ) ( CLEAR ?auto_63181 ) ( not ( = ?auto_63167 ?auto_63183 ) ) ( not ( = ?auto_63168 ?auto_63183 ) ) ( not ( = ?auto_63180 ?auto_63183 ) ) ( not ( = ?auto_63173 ?auto_63183 ) ) ( not ( = ?auto_63189 ?auto_63183 ) ) ( not ( = ?auto_63181 ?auto_63183 ) ) ( not ( = ?auto_63177 ?auto_63183 ) ) ( not ( = ?auto_63178 ?auto_63183 ) ) ( IS-CRATE ?auto_63178 ) ( not ( = ?auto_63167 ?auto_63175 ) ) ( not ( = ?auto_63168 ?auto_63175 ) ) ( not ( = ?auto_63180 ?auto_63175 ) ) ( not ( = ?auto_63173 ?auto_63175 ) ) ( not ( = ?auto_63189 ?auto_63175 ) ) ( not ( = ?auto_63181 ?auto_63175 ) ) ( not ( = ?auto_63177 ?auto_63175 ) ) ( not ( = ?auto_63178 ?auto_63175 ) ) ( not ( = ?auto_63183 ?auto_63175 ) ) ( not ( = ?auto_63179 ?auto_63190 ) ) ( not ( = ?auto_63172 ?auto_63179 ) ) ( not ( = ?auto_63182 ?auto_63179 ) ) ( not ( = ?auto_63185 ?auto_63179 ) ) ( not ( = ?auto_63187 ?auto_63179 ) ) ( HOIST-AT ?auto_63171 ?auto_63179 ) ( not ( = ?auto_63169 ?auto_63171 ) ) ( not ( = ?auto_63176 ?auto_63171 ) ) ( not ( = ?auto_63184 ?auto_63171 ) ) ( not ( = ?auto_63170 ?auto_63171 ) ) ( not ( = ?auto_63188 ?auto_63171 ) ) ( AVAILABLE ?auto_63171 ) ( SURFACE-AT ?auto_63178 ?auto_63179 ) ( ON ?auto_63178 ?auto_63174 ) ( CLEAR ?auto_63178 ) ( not ( = ?auto_63167 ?auto_63174 ) ) ( not ( = ?auto_63168 ?auto_63174 ) ) ( not ( = ?auto_63180 ?auto_63174 ) ) ( not ( = ?auto_63173 ?auto_63174 ) ) ( not ( = ?auto_63189 ?auto_63174 ) ) ( not ( = ?auto_63181 ?auto_63174 ) ) ( not ( = ?auto_63177 ?auto_63174 ) ) ( not ( = ?auto_63178 ?auto_63174 ) ) ( not ( = ?auto_63183 ?auto_63174 ) ) ( not ( = ?auto_63175 ?auto_63174 ) ) ( TRUCK-AT ?auto_63186 ?auto_63190 ) ( SURFACE-AT ?auto_63191 ?auto_63190 ) ( CLEAR ?auto_63191 ) ( LIFTING ?auto_63169 ?auto_63175 ) ( IS-CRATE ?auto_63175 ) ( not ( = ?auto_63167 ?auto_63191 ) ) ( not ( = ?auto_63168 ?auto_63191 ) ) ( not ( = ?auto_63180 ?auto_63191 ) ) ( not ( = ?auto_63173 ?auto_63191 ) ) ( not ( = ?auto_63189 ?auto_63191 ) ) ( not ( = ?auto_63181 ?auto_63191 ) ) ( not ( = ?auto_63177 ?auto_63191 ) ) ( not ( = ?auto_63178 ?auto_63191 ) ) ( not ( = ?auto_63183 ?auto_63191 ) ) ( not ( = ?auto_63175 ?auto_63191 ) ) ( not ( = ?auto_63174 ?auto_63191 ) ) )
    :subtasks
    ( ( !DROP ?auto_63169 ?auto_63175 ?auto_63191 ?auto_63190 )
      ( MAKE-ON ?auto_63167 ?auto_63168 )
      ( MAKE-ON-VERIFY ?auto_63167 ?auto_63168 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63192 - SURFACE
      ?auto_63193 - SURFACE
    )
    :vars
    (
      ?auto_63195 - HOIST
      ?auto_63203 - PLACE
      ?auto_63199 - PLACE
      ?auto_63213 - HOIST
      ?auto_63205 - SURFACE
      ?auto_63207 - SURFACE
      ?auto_63210 - PLACE
      ?auto_63197 - HOIST
      ?auto_63202 - SURFACE
      ?auto_63204 - SURFACE
      ?auto_63215 - PLACE
      ?auto_63206 - HOIST
      ?auto_63201 - SURFACE
      ?auto_63212 - SURFACE
      ?auto_63208 - PLACE
      ?auto_63209 - HOIST
      ?auto_63194 - SURFACE
      ?auto_63196 - SURFACE
      ?auto_63211 - PLACE
      ?auto_63200 - HOIST
      ?auto_63214 - SURFACE
      ?auto_63216 - TRUCK
      ?auto_63198 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63195 ?auto_63203 ) ( IS-CRATE ?auto_63192 ) ( not ( = ?auto_63192 ?auto_63193 ) ) ( not ( = ?auto_63199 ?auto_63203 ) ) ( HOIST-AT ?auto_63213 ?auto_63199 ) ( not ( = ?auto_63195 ?auto_63213 ) ) ( AVAILABLE ?auto_63213 ) ( SURFACE-AT ?auto_63192 ?auto_63199 ) ( ON ?auto_63192 ?auto_63205 ) ( CLEAR ?auto_63192 ) ( not ( = ?auto_63192 ?auto_63205 ) ) ( not ( = ?auto_63193 ?auto_63205 ) ) ( IS-CRATE ?auto_63193 ) ( not ( = ?auto_63192 ?auto_63207 ) ) ( not ( = ?auto_63193 ?auto_63207 ) ) ( not ( = ?auto_63205 ?auto_63207 ) ) ( not ( = ?auto_63210 ?auto_63203 ) ) ( not ( = ?auto_63199 ?auto_63210 ) ) ( HOIST-AT ?auto_63197 ?auto_63210 ) ( not ( = ?auto_63195 ?auto_63197 ) ) ( not ( = ?auto_63213 ?auto_63197 ) ) ( AVAILABLE ?auto_63197 ) ( SURFACE-AT ?auto_63193 ?auto_63210 ) ( ON ?auto_63193 ?auto_63202 ) ( CLEAR ?auto_63193 ) ( not ( = ?auto_63192 ?auto_63202 ) ) ( not ( = ?auto_63193 ?auto_63202 ) ) ( not ( = ?auto_63205 ?auto_63202 ) ) ( not ( = ?auto_63207 ?auto_63202 ) ) ( IS-CRATE ?auto_63207 ) ( not ( = ?auto_63192 ?auto_63204 ) ) ( not ( = ?auto_63193 ?auto_63204 ) ) ( not ( = ?auto_63205 ?auto_63204 ) ) ( not ( = ?auto_63207 ?auto_63204 ) ) ( not ( = ?auto_63202 ?auto_63204 ) ) ( not ( = ?auto_63215 ?auto_63203 ) ) ( not ( = ?auto_63199 ?auto_63215 ) ) ( not ( = ?auto_63210 ?auto_63215 ) ) ( HOIST-AT ?auto_63206 ?auto_63215 ) ( not ( = ?auto_63195 ?auto_63206 ) ) ( not ( = ?auto_63213 ?auto_63206 ) ) ( not ( = ?auto_63197 ?auto_63206 ) ) ( AVAILABLE ?auto_63206 ) ( SURFACE-AT ?auto_63207 ?auto_63215 ) ( ON ?auto_63207 ?auto_63201 ) ( CLEAR ?auto_63207 ) ( not ( = ?auto_63192 ?auto_63201 ) ) ( not ( = ?auto_63193 ?auto_63201 ) ) ( not ( = ?auto_63205 ?auto_63201 ) ) ( not ( = ?auto_63207 ?auto_63201 ) ) ( not ( = ?auto_63202 ?auto_63201 ) ) ( not ( = ?auto_63204 ?auto_63201 ) ) ( IS-CRATE ?auto_63204 ) ( not ( = ?auto_63192 ?auto_63212 ) ) ( not ( = ?auto_63193 ?auto_63212 ) ) ( not ( = ?auto_63205 ?auto_63212 ) ) ( not ( = ?auto_63207 ?auto_63212 ) ) ( not ( = ?auto_63202 ?auto_63212 ) ) ( not ( = ?auto_63204 ?auto_63212 ) ) ( not ( = ?auto_63201 ?auto_63212 ) ) ( not ( = ?auto_63208 ?auto_63203 ) ) ( not ( = ?auto_63199 ?auto_63208 ) ) ( not ( = ?auto_63210 ?auto_63208 ) ) ( not ( = ?auto_63215 ?auto_63208 ) ) ( HOIST-AT ?auto_63209 ?auto_63208 ) ( not ( = ?auto_63195 ?auto_63209 ) ) ( not ( = ?auto_63213 ?auto_63209 ) ) ( not ( = ?auto_63197 ?auto_63209 ) ) ( not ( = ?auto_63206 ?auto_63209 ) ) ( AVAILABLE ?auto_63209 ) ( SURFACE-AT ?auto_63204 ?auto_63208 ) ( ON ?auto_63204 ?auto_63194 ) ( CLEAR ?auto_63204 ) ( not ( = ?auto_63192 ?auto_63194 ) ) ( not ( = ?auto_63193 ?auto_63194 ) ) ( not ( = ?auto_63205 ?auto_63194 ) ) ( not ( = ?auto_63207 ?auto_63194 ) ) ( not ( = ?auto_63202 ?auto_63194 ) ) ( not ( = ?auto_63204 ?auto_63194 ) ) ( not ( = ?auto_63201 ?auto_63194 ) ) ( not ( = ?auto_63212 ?auto_63194 ) ) ( IS-CRATE ?auto_63212 ) ( not ( = ?auto_63192 ?auto_63196 ) ) ( not ( = ?auto_63193 ?auto_63196 ) ) ( not ( = ?auto_63205 ?auto_63196 ) ) ( not ( = ?auto_63207 ?auto_63196 ) ) ( not ( = ?auto_63202 ?auto_63196 ) ) ( not ( = ?auto_63204 ?auto_63196 ) ) ( not ( = ?auto_63201 ?auto_63196 ) ) ( not ( = ?auto_63212 ?auto_63196 ) ) ( not ( = ?auto_63194 ?auto_63196 ) ) ( not ( = ?auto_63211 ?auto_63203 ) ) ( not ( = ?auto_63199 ?auto_63211 ) ) ( not ( = ?auto_63210 ?auto_63211 ) ) ( not ( = ?auto_63215 ?auto_63211 ) ) ( not ( = ?auto_63208 ?auto_63211 ) ) ( HOIST-AT ?auto_63200 ?auto_63211 ) ( not ( = ?auto_63195 ?auto_63200 ) ) ( not ( = ?auto_63213 ?auto_63200 ) ) ( not ( = ?auto_63197 ?auto_63200 ) ) ( not ( = ?auto_63206 ?auto_63200 ) ) ( not ( = ?auto_63209 ?auto_63200 ) ) ( AVAILABLE ?auto_63200 ) ( SURFACE-AT ?auto_63212 ?auto_63211 ) ( ON ?auto_63212 ?auto_63214 ) ( CLEAR ?auto_63212 ) ( not ( = ?auto_63192 ?auto_63214 ) ) ( not ( = ?auto_63193 ?auto_63214 ) ) ( not ( = ?auto_63205 ?auto_63214 ) ) ( not ( = ?auto_63207 ?auto_63214 ) ) ( not ( = ?auto_63202 ?auto_63214 ) ) ( not ( = ?auto_63204 ?auto_63214 ) ) ( not ( = ?auto_63201 ?auto_63214 ) ) ( not ( = ?auto_63212 ?auto_63214 ) ) ( not ( = ?auto_63194 ?auto_63214 ) ) ( not ( = ?auto_63196 ?auto_63214 ) ) ( TRUCK-AT ?auto_63216 ?auto_63203 ) ( SURFACE-AT ?auto_63198 ?auto_63203 ) ( CLEAR ?auto_63198 ) ( IS-CRATE ?auto_63196 ) ( not ( = ?auto_63192 ?auto_63198 ) ) ( not ( = ?auto_63193 ?auto_63198 ) ) ( not ( = ?auto_63205 ?auto_63198 ) ) ( not ( = ?auto_63207 ?auto_63198 ) ) ( not ( = ?auto_63202 ?auto_63198 ) ) ( not ( = ?auto_63204 ?auto_63198 ) ) ( not ( = ?auto_63201 ?auto_63198 ) ) ( not ( = ?auto_63212 ?auto_63198 ) ) ( not ( = ?auto_63194 ?auto_63198 ) ) ( not ( = ?auto_63196 ?auto_63198 ) ) ( not ( = ?auto_63214 ?auto_63198 ) ) ( AVAILABLE ?auto_63195 ) ( IN ?auto_63196 ?auto_63216 ) )
    :subtasks
    ( ( !UNLOAD ?auto_63195 ?auto_63196 ?auto_63216 ?auto_63203 )
      ( MAKE-ON ?auto_63192 ?auto_63193 )
      ( MAKE-ON-VERIFY ?auto_63192 ?auto_63193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63217 - SURFACE
      ?auto_63218 - SURFACE
    )
    :vars
    (
      ?auto_63222 - HOIST
      ?auto_63219 - PLACE
      ?auto_63221 - PLACE
      ?auto_63229 - HOIST
      ?auto_63240 - SURFACE
      ?auto_63241 - SURFACE
      ?auto_63225 - PLACE
      ?auto_63237 - HOIST
      ?auto_63232 - SURFACE
      ?auto_63220 - SURFACE
      ?auto_63234 - PLACE
      ?auto_63239 - HOIST
      ?auto_63231 - SURFACE
      ?auto_63230 - SURFACE
      ?auto_63238 - PLACE
      ?auto_63236 - HOIST
      ?auto_63224 - SURFACE
      ?auto_63226 - SURFACE
      ?auto_63228 - PLACE
      ?auto_63227 - HOIST
      ?auto_63233 - SURFACE
      ?auto_63223 - SURFACE
      ?auto_63235 - TRUCK
      ?auto_63242 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63222 ?auto_63219 ) ( IS-CRATE ?auto_63217 ) ( not ( = ?auto_63217 ?auto_63218 ) ) ( not ( = ?auto_63221 ?auto_63219 ) ) ( HOIST-AT ?auto_63229 ?auto_63221 ) ( not ( = ?auto_63222 ?auto_63229 ) ) ( AVAILABLE ?auto_63229 ) ( SURFACE-AT ?auto_63217 ?auto_63221 ) ( ON ?auto_63217 ?auto_63240 ) ( CLEAR ?auto_63217 ) ( not ( = ?auto_63217 ?auto_63240 ) ) ( not ( = ?auto_63218 ?auto_63240 ) ) ( IS-CRATE ?auto_63218 ) ( not ( = ?auto_63217 ?auto_63241 ) ) ( not ( = ?auto_63218 ?auto_63241 ) ) ( not ( = ?auto_63240 ?auto_63241 ) ) ( not ( = ?auto_63225 ?auto_63219 ) ) ( not ( = ?auto_63221 ?auto_63225 ) ) ( HOIST-AT ?auto_63237 ?auto_63225 ) ( not ( = ?auto_63222 ?auto_63237 ) ) ( not ( = ?auto_63229 ?auto_63237 ) ) ( AVAILABLE ?auto_63237 ) ( SURFACE-AT ?auto_63218 ?auto_63225 ) ( ON ?auto_63218 ?auto_63232 ) ( CLEAR ?auto_63218 ) ( not ( = ?auto_63217 ?auto_63232 ) ) ( not ( = ?auto_63218 ?auto_63232 ) ) ( not ( = ?auto_63240 ?auto_63232 ) ) ( not ( = ?auto_63241 ?auto_63232 ) ) ( IS-CRATE ?auto_63241 ) ( not ( = ?auto_63217 ?auto_63220 ) ) ( not ( = ?auto_63218 ?auto_63220 ) ) ( not ( = ?auto_63240 ?auto_63220 ) ) ( not ( = ?auto_63241 ?auto_63220 ) ) ( not ( = ?auto_63232 ?auto_63220 ) ) ( not ( = ?auto_63234 ?auto_63219 ) ) ( not ( = ?auto_63221 ?auto_63234 ) ) ( not ( = ?auto_63225 ?auto_63234 ) ) ( HOIST-AT ?auto_63239 ?auto_63234 ) ( not ( = ?auto_63222 ?auto_63239 ) ) ( not ( = ?auto_63229 ?auto_63239 ) ) ( not ( = ?auto_63237 ?auto_63239 ) ) ( AVAILABLE ?auto_63239 ) ( SURFACE-AT ?auto_63241 ?auto_63234 ) ( ON ?auto_63241 ?auto_63231 ) ( CLEAR ?auto_63241 ) ( not ( = ?auto_63217 ?auto_63231 ) ) ( not ( = ?auto_63218 ?auto_63231 ) ) ( not ( = ?auto_63240 ?auto_63231 ) ) ( not ( = ?auto_63241 ?auto_63231 ) ) ( not ( = ?auto_63232 ?auto_63231 ) ) ( not ( = ?auto_63220 ?auto_63231 ) ) ( IS-CRATE ?auto_63220 ) ( not ( = ?auto_63217 ?auto_63230 ) ) ( not ( = ?auto_63218 ?auto_63230 ) ) ( not ( = ?auto_63240 ?auto_63230 ) ) ( not ( = ?auto_63241 ?auto_63230 ) ) ( not ( = ?auto_63232 ?auto_63230 ) ) ( not ( = ?auto_63220 ?auto_63230 ) ) ( not ( = ?auto_63231 ?auto_63230 ) ) ( not ( = ?auto_63238 ?auto_63219 ) ) ( not ( = ?auto_63221 ?auto_63238 ) ) ( not ( = ?auto_63225 ?auto_63238 ) ) ( not ( = ?auto_63234 ?auto_63238 ) ) ( HOIST-AT ?auto_63236 ?auto_63238 ) ( not ( = ?auto_63222 ?auto_63236 ) ) ( not ( = ?auto_63229 ?auto_63236 ) ) ( not ( = ?auto_63237 ?auto_63236 ) ) ( not ( = ?auto_63239 ?auto_63236 ) ) ( AVAILABLE ?auto_63236 ) ( SURFACE-AT ?auto_63220 ?auto_63238 ) ( ON ?auto_63220 ?auto_63224 ) ( CLEAR ?auto_63220 ) ( not ( = ?auto_63217 ?auto_63224 ) ) ( not ( = ?auto_63218 ?auto_63224 ) ) ( not ( = ?auto_63240 ?auto_63224 ) ) ( not ( = ?auto_63241 ?auto_63224 ) ) ( not ( = ?auto_63232 ?auto_63224 ) ) ( not ( = ?auto_63220 ?auto_63224 ) ) ( not ( = ?auto_63231 ?auto_63224 ) ) ( not ( = ?auto_63230 ?auto_63224 ) ) ( IS-CRATE ?auto_63230 ) ( not ( = ?auto_63217 ?auto_63226 ) ) ( not ( = ?auto_63218 ?auto_63226 ) ) ( not ( = ?auto_63240 ?auto_63226 ) ) ( not ( = ?auto_63241 ?auto_63226 ) ) ( not ( = ?auto_63232 ?auto_63226 ) ) ( not ( = ?auto_63220 ?auto_63226 ) ) ( not ( = ?auto_63231 ?auto_63226 ) ) ( not ( = ?auto_63230 ?auto_63226 ) ) ( not ( = ?auto_63224 ?auto_63226 ) ) ( not ( = ?auto_63228 ?auto_63219 ) ) ( not ( = ?auto_63221 ?auto_63228 ) ) ( not ( = ?auto_63225 ?auto_63228 ) ) ( not ( = ?auto_63234 ?auto_63228 ) ) ( not ( = ?auto_63238 ?auto_63228 ) ) ( HOIST-AT ?auto_63227 ?auto_63228 ) ( not ( = ?auto_63222 ?auto_63227 ) ) ( not ( = ?auto_63229 ?auto_63227 ) ) ( not ( = ?auto_63237 ?auto_63227 ) ) ( not ( = ?auto_63239 ?auto_63227 ) ) ( not ( = ?auto_63236 ?auto_63227 ) ) ( AVAILABLE ?auto_63227 ) ( SURFACE-AT ?auto_63230 ?auto_63228 ) ( ON ?auto_63230 ?auto_63233 ) ( CLEAR ?auto_63230 ) ( not ( = ?auto_63217 ?auto_63233 ) ) ( not ( = ?auto_63218 ?auto_63233 ) ) ( not ( = ?auto_63240 ?auto_63233 ) ) ( not ( = ?auto_63241 ?auto_63233 ) ) ( not ( = ?auto_63232 ?auto_63233 ) ) ( not ( = ?auto_63220 ?auto_63233 ) ) ( not ( = ?auto_63231 ?auto_63233 ) ) ( not ( = ?auto_63230 ?auto_63233 ) ) ( not ( = ?auto_63224 ?auto_63233 ) ) ( not ( = ?auto_63226 ?auto_63233 ) ) ( SURFACE-AT ?auto_63223 ?auto_63219 ) ( CLEAR ?auto_63223 ) ( IS-CRATE ?auto_63226 ) ( not ( = ?auto_63217 ?auto_63223 ) ) ( not ( = ?auto_63218 ?auto_63223 ) ) ( not ( = ?auto_63240 ?auto_63223 ) ) ( not ( = ?auto_63241 ?auto_63223 ) ) ( not ( = ?auto_63232 ?auto_63223 ) ) ( not ( = ?auto_63220 ?auto_63223 ) ) ( not ( = ?auto_63231 ?auto_63223 ) ) ( not ( = ?auto_63230 ?auto_63223 ) ) ( not ( = ?auto_63224 ?auto_63223 ) ) ( not ( = ?auto_63226 ?auto_63223 ) ) ( not ( = ?auto_63233 ?auto_63223 ) ) ( AVAILABLE ?auto_63222 ) ( IN ?auto_63226 ?auto_63235 ) ( TRUCK-AT ?auto_63235 ?auto_63242 ) ( not ( = ?auto_63242 ?auto_63219 ) ) ( not ( = ?auto_63221 ?auto_63242 ) ) ( not ( = ?auto_63225 ?auto_63242 ) ) ( not ( = ?auto_63234 ?auto_63242 ) ) ( not ( = ?auto_63238 ?auto_63242 ) ) ( not ( = ?auto_63228 ?auto_63242 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_63235 ?auto_63242 ?auto_63219 )
      ( MAKE-ON ?auto_63217 ?auto_63218 )
      ( MAKE-ON-VERIFY ?auto_63217 ?auto_63218 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63243 - SURFACE
      ?auto_63244 - SURFACE
    )
    :vars
    (
      ?auto_63248 - HOIST
      ?auto_63265 - PLACE
      ?auto_63246 - PLACE
      ?auto_63258 - HOIST
      ?auto_63252 - SURFACE
      ?auto_63253 - SURFACE
      ?auto_63255 - PLACE
      ?auto_63261 - HOIST
      ?auto_63256 - SURFACE
      ?auto_63264 - SURFACE
      ?auto_63254 - PLACE
      ?auto_63251 - HOIST
      ?auto_63245 - SURFACE
      ?auto_63247 - SURFACE
      ?auto_63250 - PLACE
      ?auto_63260 - HOIST
      ?auto_63268 - SURFACE
      ?auto_63263 - SURFACE
      ?auto_63259 - PLACE
      ?auto_63267 - HOIST
      ?auto_63262 - SURFACE
      ?auto_63257 - SURFACE
      ?auto_63249 - TRUCK
      ?auto_63266 - PLACE
      ?auto_63269 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_63248 ?auto_63265 ) ( IS-CRATE ?auto_63243 ) ( not ( = ?auto_63243 ?auto_63244 ) ) ( not ( = ?auto_63246 ?auto_63265 ) ) ( HOIST-AT ?auto_63258 ?auto_63246 ) ( not ( = ?auto_63248 ?auto_63258 ) ) ( AVAILABLE ?auto_63258 ) ( SURFACE-AT ?auto_63243 ?auto_63246 ) ( ON ?auto_63243 ?auto_63252 ) ( CLEAR ?auto_63243 ) ( not ( = ?auto_63243 ?auto_63252 ) ) ( not ( = ?auto_63244 ?auto_63252 ) ) ( IS-CRATE ?auto_63244 ) ( not ( = ?auto_63243 ?auto_63253 ) ) ( not ( = ?auto_63244 ?auto_63253 ) ) ( not ( = ?auto_63252 ?auto_63253 ) ) ( not ( = ?auto_63255 ?auto_63265 ) ) ( not ( = ?auto_63246 ?auto_63255 ) ) ( HOIST-AT ?auto_63261 ?auto_63255 ) ( not ( = ?auto_63248 ?auto_63261 ) ) ( not ( = ?auto_63258 ?auto_63261 ) ) ( AVAILABLE ?auto_63261 ) ( SURFACE-AT ?auto_63244 ?auto_63255 ) ( ON ?auto_63244 ?auto_63256 ) ( CLEAR ?auto_63244 ) ( not ( = ?auto_63243 ?auto_63256 ) ) ( not ( = ?auto_63244 ?auto_63256 ) ) ( not ( = ?auto_63252 ?auto_63256 ) ) ( not ( = ?auto_63253 ?auto_63256 ) ) ( IS-CRATE ?auto_63253 ) ( not ( = ?auto_63243 ?auto_63264 ) ) ( not ( = ?auto_63244 ?auto_63264 ) ) ( not ( = ?auto_63252 ?auto_63264 ) ) ( not ( = ?auto_63253 ?auto_63264 ) ) ( not ( = ?auto_63256 ?auto_63264 ) ) ( not ( = ?auto_63254 ?auto_63265 ) ) ( not ( = ?auto_63246 ?auto_63254 ) ) ( not ( = ?auto_63255 ?auto_63254 ) ) ( HOIST-AT ?auto_63251 ?auto_63254 ) ( not ( = ?auto_63248 ?auto_63251 ) ) ( not ( = ?auto_63258 ?auto_63251 ) ) ( not ( = ?auto_63261 ?auto_63251 ) ) ( AVAILABLE ?auto_63251 ) ( SURFACE-AT ?auto_63253 ?auto_63254 ) ( ON ?auto_63253 ?auto_63245 ) ( CLEAR ?auto_63253 ) ( not ( = ?auto_63243 ?auto_63245 ) ) ( not ( = ?auto_63244 ?auto_63245 ) ) ( not ( = ?auto_63252 ?auto_63245 ) ) ( not ( = ?auto_63253 ?auto_63245 ) ) ( not ( = ?auto_63256 ?auto_63245 ) ) ( not ( = ?auto_63264 ?auto_63245 ) ) ( IS-CRATE ?auto_63264 ) ( not ( = ?auto_63243 ?auto_63247 ) ) ( not ( = ?auto_63244 ?auto_63247 ) ) ( not ( = ?auto_63252 ?auto_63247 ) ) ( not ( = ?auto_63253 ?auto_63247 ) ) ( not ( = ?auto_63256 ?auto_63247 ) ) ( not ( = ?auto_63264 ?auto_63247 ) ) ( not ( = ?auto_63245 ?auto_63247 ) ) ( not ( = ?auto_63250 ?auto_63265 ) ) ( not ( = ?auto_63246 ?auto_63250 ) ) ( not ( = ?auto_63255 ?auto_63250 ) ) ( not ( = ?auto_63254 ?auto_63250 ) ) ( HOIST-AT ?auto_63260 ?auto_63250 ) ( not ( = ?auto_63248 ?auto_63260 ) ) ( not ( = ?auto_63258 ?auto_63260 ) ) ( not ( = ?auto_63261 ?auto_63260 ) ) ( not ( = ?auto_63251 ?auto_63260 ) ) ( AVAILABLE ?auto_63260 ) ( SURFACE-AT ?auto_63264 ?auto_63250 ) ( ON ?auto_63264 ?auto_63268 ) ( CLEAR ?auto_63264 ) ( not ( = ?auto_63243 ?auto_63268 ) ) ( not ( = ?auto_63244 ?auto_63268 ) ) ( not ( = ?auto_63252 ?auto_63268 ) ) ( not ( = ?auto_63253 ?auto_63268 ) ) ( not ( = ?auto_63256 ?auto_63268 ) ) ( not ( = ?auto_63264 ?auto_63268 ) ) ( not ( = ?auto_63245 ?auto_63268 ) ) ( not ( = ?auto_63247 ?auto_63268 ) ) ( IS-CRATE ?auto_63247 ) ( not ( = ?auto_63243 ?auto_63263 ) ) ( not ( = ?auto_63244 ?auto_63263 ) ) ( not ( = ?auto_63252 ?auto_63263 ) ) ( not ( = ?auto_63253 ?auto_63263 ) ) ( not ( = ?auto_63256 ?auto_63263 ) ) ( not ( = ?auto_63264 ?auto_63263 ) ) ( not ( = ?auto_63245 ?auto_63263 ) ) ( not ( = ?auto_63247 ?auto_63263 ) ) ( not ( = ?auto_63268 ?auto_63263 ) ) ( not ( = ?auto_63259 ?auto_63265 ) ) ( not ( = ?auto_63246 ?auto_63259 ) ) ( not ( = ?auto_63255 ?auto_63259 ) ) ( not ( = ?auto_63254 ?auto_63259 ) ) ( not ( = ?auto_63250 ?auto_63259 ) ) ( HOIST-AT ?auto_63267 ?auto_63259 ) ( not ( = ?auto_63248 ?auto_63267 ) ) ( not ( = ?auto_63258 ?auto_63267 ) ) ( not ( = ?auto_63261 ?auto_63267 ) ) ( not ( = ?auto_63251 ?auto_63267 ) ) ( not ( = ?auto_63260 ?auto_63267 ) ) ( AVAILABLE ?auto_63267 ) ( SURFACE-AT ?auto_63247 ?auto_63259 ) ( ON ?auto_63247 ?auto_63262 ) ( CLEAR ?auto_63247 ) ( not ( = ?auto_63243 ?auto_63262 ) ) ( not ( = ?auto_63244 ?auto_63262 ) ) ( not ( = ?auto_63252 ?auto_63262 ) ) ( not ( = ?auto_63253 ?auto_63262 ) ) ( not ( = ?auto_63256 ?auto_63262 ) ) ( not ( = ?auto_63264 ?auto_63262 ) ) ( not ( = ?auto_63245 ?auto_63262 ) ) ( not ( = ?auto_63247 ?auto_63262 ) ) ( not ( = ?auto_63268 ?auto_63262 ) ) ( not ( = ?auto_63263 ?auto_63262 ) ) ( SURFACE-AT ?auto_63257 ?auto_63265 ) ( CLEAR ?auto_63257 ) ( IS-CRATE ?auto_63263 ) ( not ( = ?auto_63243 ?auto_63257 ) ) ( not ( = ?auto_63244 ?auto_63257 ) ) ( not ( = ?auto_63252 ?auto_63257 ) ) ( not ( = ?auto_63253 ?auto_63257 ) ) ( not ( = ?auto_63256 ?auto_63257 ) ) ( not ( = ?auto_63264 ?auto_63257 ) ) ( not ( = ?auto_63245 ?auto_63257 ) ) ( not ( = ?auto_63247 ?auto_63257 ) ) ( not ( = ?auto_63268 ?auto_63257 ) ) ( not ( = ?auto_63263 ?auto_63257 ) ) ( not ( = ?auto_63262 ?auto_63257 ) ) ( AVAILABLE ?auto_63248 ) ( TRUCK-AT ?auto_63249 ?auto_63266 ) ( not ( = ?auto_63266 ?auto_63265 ) ) ( not ( = ?auto_63246 ?auto_63266 ) ) ( not ( = ?auto_63255 ?auto_63266 ) ) ( not ( = ?auto_63254 ?auto_63266 ) ) ( not ( = ?auto_63250 ?auto_63266 ) ) ( not ( = ?auto_63259 ?auto_63266 ) ) ( HOIST-AT ?auto_63269 ?auto_63266 ) ( LIFTING ?auto_63269 ?auto_63263 ) ( not ( = ?auto_63248 ?auto_63269 ) ) ( not ( = ?auto_63258 ?auto_63269 ) ) ( not ( = ?auto_63261 ?auto_63269 ) ) ( not ( = ?auto_63251 ?auto_63269 ) ) ( not ( = ?auto_63260 ?auto_63269 ) ) ( not ( = ?auto_63267 ?auto_63269 ) ) )
    :subtasks
    ( ( !LOAD ?auto_63269 ?auto_63263 ?auto_63249 ?auto_63266 )
      ( MAKE-ON ?auto_63243 ?auto_63244 )
      ( MAKE-ON-VERIFY ?auto_63243 ?auto_63244 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63270 - SURFACE
      ?auto_63271 - SURFACE
    )
    :vars
    (
      ?auto_63287 - HOIST
      ?auto_63279 - PLACE
      ?auto_63288 - PLACE
      ?auto_63272 - HOIST
      ?auto_63285 - SURFACE
      ?auto_63283 - SURFACE
      ?auto_63290 - PLACE
      ?auto_63273 - HOIST
      ?auto_63291 - SURFACE
      ?auto_63278 - SURFACE
      ?auto_63274 - PLACE
      ?auto_63296 - HOIST
      ?auto_63293 - SURFACE
      ?auto_63286 - SURFACE
      ?auto_63284 - PLACE
      ?auto_63282 - HOIST
      ?auto_63276 - SURFACE
      ?auto_63277 - SURFACE
      ?auto_63294 - PLACE
      ?auto_63281 - HOIST
      ?auto_63275 - SURFACE
      ?auto_63292 - SURFACE
      ?auto_63289 - TRUCK
      ?auto_63280 - PLACE
      ?auto_63295 - HOIST
      ?auto_63297 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63287 ?auto_63279 ) ( IS-CRATE ?auto_63270 ) ( not ( = ?auto_63270 ?auto_63271 ) ) ( not ( = ?auto_63288 ?auto_63279 ) ) ( HOIST-AT ?auto_63272 ?auto_63288 ) ( not ( = ?auto_63287 ?auto_63272 ) ) ( AVAILABLE ?auto_63272 ) ( SURFACE-AT ?auto_63270 ?auto_63288 ) ( ON ?auto_63270 ?auto_63285 ) ( CLEAR ?auto_63270 ) ( not ( = ?auto_63270 ?auto_63285 ) ) ( not ( = ?auto_63271 ?auto_63285 ) ) ( IS-CRATE ?auto_63271 ) ( not ( = ?auto_63270 ?auto_63283 ) ) ( not ( = ?auto_63271 ?auto_63283 ) ) ( not ( = ?auto_63285 ?auto_63283 ) ) ( not ( = ?auto_63290 ?auto_63279 ) ) ( not ( = ?auto_63288 ?auto_63290 ) ) ( HOIST-AT ?auto_63273 ?auto_63290 ) ( not ( = ?auto_63287 ?auto_63273 ) ) ( not ( = ?auto_63272 ?auto_63273 ) ) ( AVAILABLE ?auto_63273 ) ( SURFACE-AT ?auto_63271 ?auto_63290 ) ( ON ?auto_63271 ?auto_63291 ) ( CLEAR ?auto_63271 ) ( not ( = ?auto_63270 ?auto_63291 ) ) ( not ( = ?auto_63271 ?auto_63291 ) ) ( not ( = ?auto_63285 ?auto_63291 ) ) ( not ( = ?auto_63283 ?auto_63291 ) ) ( IS-CRATE ?auto_63283 ) ( not ( = ?auto_63270 ?auto_63278 ) ) ( not ( = ?auto_63271 ?auto_63278 ) ) ( not ( = ?auto_63285 ?auto_63278 ) ) ( not ( = ?auto_63283 ?auto_63278 ) ) ( not ( = ?auto_63291 ?auto_63278 ) ) ( not ( = ?auto_63274 ?auto_63279 ) ) ( not ( = ?auto_63288 ?auto_63274 ) ) ( not ( = ?auto_63290 ?auto_63274 ) ) ( HOIST-AT ?auto_63296 ?auto_63274 ) ( not ( = ?auto_63287 ?auto_63296 ) ) ( not ( = ?auto_63272 ?auto_63296 ) ) ( not ( = ?auto_63273 ?auto_63296 ) ) ( AVAILABLE ?auto_63296 ) ( SURFACE-AT ?auto_63283 ?auto_63274 ) ( ON ?auto_63283 ?auto_63293 ) ( CLEAR ?auto_63283 ) ( not ( = ?auto_63270 ?auto_63293 ) ) ( not ( = ?auto_63271 ?auto_63293 ) ) ( not ( = ?auto_63285 ?auto_63293 ) ) ( not ( = ?auto_63283 ?auto_63293 ) ) ( not ( = ?auto_63291 ?auto_63293 ) ) ( not ( = ?auto_63278 ?auto_63293 ) ) ( IS-CRATE ?auto_63278 ) ( not ( = ?auto_63270 ?auto_63286 ) ) ( not ( = ?auto_63271 ?auto_63286 ) ) ( not ( = ?auto_63285 ?auto_63286 ) ) ( not ( = ?auto_63283 ?auto_63286 ) ) ( not ( = ?auto_63291 ?auto_63286 ) ) ( not ( = ?auto_63278 ?auto_63286 ) ) ( not ( = ?auto_63293 ?auto_63286 ) ) ( not ( = ?auto_63284 ?auto_63279 ) ) ( not ( = ?auto_63288 ?auto_63284 ) ) ( not ( = ?auto_63290 ?auto_63284 ) ) ( not ( = ?auto_63274 ?auto_63284 ) ) ( HOIST-AT ?auto_63282 ?auto_63284 ) ( not ( = ?auto_63287 ?auto_63282 ) ) ( not ( = ?auto_63272 ?auto_63282 ) ) ( not ( = ?auto_63273 ?auto_63282 ) ) ( not ( = ?auto_63296 ?auto_63282 ) ) ( AVAILABLE ?auto_63282 ) ( SURFACE-AT ?auto_63278 ?auto_63284 ) ( ON ?auto_63278 ?auto_63276 ) ( CLEAR ?auto_63278 ) ( not ( = ?auto_63270 ?auto_63276 ) ) ( not ( = ?auto_63271 ?auto_63276 ) ) ( not ( = ?auto_63285 ?auto_63276 ) ) ( not ( = ?auto_63283 ?auto_63276 ) ) ( not ( = ?auto_63291 ?auto_63276 ) ) ( not ( = ?auto_63278 ?auto_63276 ) ) ( not ( = ?auto_63293 ?auto_63276 ) ) ( not ( = ?auto_63286 ?auto_63276 ) ) ( IS-CRATE ?auto_63286 ) ( not ( = ?auto_63270 ?auto_63277 ) ) ( not ( = ?auto_63271 ?auto_63277 ) ) ( not ( = ?auto_63285 ?auto_63277 ) ) ( not ( = ?auto_63283 ?auto_63277 ) ) ( not ( = ?auto_63291 ?auto_63277 ) ) ( not ( = ?auto_63278 ?auto_63277 ) ) ( not ( = ?auto_63293 ?auto_63277 ) ) ( not ( = ?auto_63286 ?auto_63277 ) ) ( not ( = ?auto_63276 ?auto_63277 ) ) ( not ( = ?auto_63294 ?auto_63279 ) ) ( not ( = ?auto_63288 ?auto_63294 ) ) ( not ( = ?auto_63290 ?auto_63294 ) ) ( not ( = ?auto_63274 ?auto_63294 ) ) ( not ( = ?auto_63284 ?auto_63294 ) ) ( HOIST-AT ?auto_63281 ?auto_63294 ) ( not ( = ?auto_63287 ?auto_63281 ) ) ( not ( = ?auto_63272 ?auto_63281 ) ) ( not ( = ?auto_63273 ?auto_63281 ) ) ( not ( = ?auto_63296 ?auto_63281 ) ) ( not ( = ?auto_63282 ?auto_63281 ) ) ( AVAILABLE ?auto_63281 ) ( SURFACE-AT ?auto_63286 ?auto_63294 ) ( ON ?auto_63286 ?auto_63275 ) ( CLEAR ?auto_63286 ) ( not ( = ?auto_63270 ?auto_63275 ) ) ( not ( = ?auto_63271 ?auto_63275 ) ) ( not ( = ?auto_63285 ?auto_63275 ) ) ( not ( = ?auto_63283 ?auto_63275 ) ) ( not ( = ?auto_63291 ?auto_63275 ) ) ( not ( = ?auto_63278 ?auto_63275 ) ) ( not ( = ?auto_63293 ?auto_63275 ) ) ( not ( = ?auto_63286 ?auto_63275 ) ) ( not ( = ?auto_63276 ?auto_63275 ) ) ( not ( = ?auto_63277 ?auto_63275 ) ) ( SURFACE-AT ?auto_63292 ?auto_63279 ) ( CLEAR ?auto_63292 ) ( IS-CRATE ?auto_63277 ) ( not ( = ?auto_63270 ?auto_63292 ) ) ( not ( = ?auto_63271 ?auto_63292 ) ) ( not ( = ?auto_63285 ?auto_63292 ) ) ( not ( = ?auto_63283 ?auto_63292 ) ) ( not ( = ?auto_63291 ?auto_63292 ) ) ( not ( = ?auto_63278 ?auto_63292 ) ) ( not ( = ?auto_63293 ?auto_63292 ) ) ( not ( = ?auto_63286 ?auto_63292 ) ) ( not ( = ?auto_63276 ?auto_63292 ) ) ( not ( = ?auto_63277 ?auto_63292 ) ) ( not ( = ?auto_63275 ?auto_63292 ) ) ( AVAILABLE ?auto_63287 ) ( TRUCK-AT ?auto_63289 ?auto_63280 ) ( not ( = ?auto_63280 ?auto_63279 ) ) ( not ( = ?auto_63288 ?auto_63280 ) ) ( not ( = ?auto_63290 ?auto_63280 ) ) ( not ( = ?auto_63274 ?auto_63280 ) ) ( not ( = ?auto_63284 ?auto_63280 ) ) ( not ( = ?auto_63294 ?auto_63280 ) ) ( HOIST-AT ?auto_63295 ?auto_63280 ) ( not ( = ?auto_63287 ?auto_63295 ) ) ( not ( = ?auto_63272 ?auto_63295 ) ) ( not ( = ?auto_63273 ?auto_63295 ) ) ( not ( = ?auto_63296 ?auto_63295 ) ) ( not ( = ?auto_63282 ?auto_63295 ) ) ( not ( = ?auto_63281 ?auto_63295 ) ) ( AVAILABLE ?auto_63295 ) ( SURFACE-AT ?auto_63277 ?auto_63280 ) ( ON ?auto_63277 ?auto_63297 ) ( CLEAR ?auto_63277 ) ( not ( = ?auto_63270 ?auto_63297 ) ) ( not ( = ?auto_63271 ?auto_63297 ) ) ( not ( = ?auto_63285 ?auto_63297 ) ) ( not ( = ?auto_63283 ?auto_63297 ) ) ( not ( = ?auto_63291 ?auto_63297 ) ) ( not ( = ?auto_63278 ?auto_63297 ) ) ( not ( = ?auto_63293 ?auto_63297 ) ) ( not ( = ?auto_63286 ?auto_63297 ) ) ( not ( = ?auto_63276 ?auto_63297 ) ) ( not ( = ?auto_63277 ?auto_63297 ) ) ( not ( = ?auto_63275 ?auto_63297 ) ) ( not ( = ?auto_63292 ?auto_63297 ) ) )
    :subtasks
    ( ( !LIFT ?auto_63295 ?auto_63277 ?auto_63297 ?auto_63280 )
      ( MAKE-ON ?auto_63270 ?auto_63271 )
      ( MAKE-ON-VERIFY ?auto_63270 ?auto_63271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63298 - SURFACE
      ?auto_63299 - SURFACE
    )
    :vars
    (
      ?auto_63316 - HOIST
      ?auto_63312 - PLACE
      ?auto_63305 - PLACE
      ?auto_63300 - HOIST
      ?auto_63311 - SURFACE
      ?auto_63309 - SURFACE
      ?auto_63313 - PLACE
      ?auto_63325 - HOIST
      ?auto_63314 - SURFACE
      ?auto_63321 - SURFACE
      ?auto_63317 - PLACE
      ?auto_63304 - HOIST
      ?auto_63324 - SURFACE
      ?auto_63320 - SURFACE
      ?auto_63310 - PLACE
      ?auto_63308 - HOIST
      ?auto_63318 - SURFACE
      ?auto_63302 - SURFACE
      ?auto_63315 - PLACE
      ?auto_63306 - HOIST
      ?auto_63319 - SURFACE
      ?auto_63323 - SURFACE
      ?auto_63303 - PLACE
      ?auto_63301 - HOIST
      ?auto_63322 - SURFACE
      ?auto_63307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63316 ?auto_63312 ) ( IS-CRATE ?auto_63298 ) ( not ( = ?auto_63298 ?auto_63299 ) ) ( not ( = ?auto_63305 ?auto_63312 ) ) ( HOIST-AT ?auto_63300 ?auto_63305 ) ( not ( = ?auto_63316 ?auto_63300 ) ) ( AVAILABLE ?auto_63300 ) ( SURFACE-AT ?auto_63298 ?auto_63305 ) ( ON ?auto_63298 ?auto_63311 ) ( CLEAR ?auto_63298 ) ( not ( = ?auto_63298 ?auto_63311 ) ) ( not ( = ?auto_63299 ?auto_63311 ) ) ( IS-CRATE ?auto_63299 ) ( not ( = ?auto_63298 ?auto_63309 ) ) ( not ( = ?auto_63299 ?auto_63309 ) ) ( not ( = ?auto_63311 ?auto_63309 ) ) ( not ( = ?auto_63313 ?auto_63312 ) ) ( not ( = ?auto_63305 ?auto_63313 ) ) ( HOIST-AT ?auto_63325 ?auto_63313 ) ( not ( = ?auto_63316 ?auto_63325 ) ) ( not ( = ?auto_63300 ?auto_63325 ) ) ( AVAILABLE ?auto_63325 ) ( SURFACE-AT ?auto_63299 ?auto_63313 ) ( ON ?auto_63299 ?auto_63314 ) ( CLEAR ?auto_63299 ) ( not ( = ?auto_63298 ?auto_63314 ) ) ( not ( = ?auto_63299 ?auto_63314 ) ) ( not ( = ?auto_63311 ?auto_63314 ) ) ( not ( = ?auto_63309 ?auto_63314 ) ) ( IS-CRATE ?auto_63309 ) ( not ( = ?auto_63298 ?auto_63321 ) ) ( not ( = ?auto_63299 ?auto_63321 ) ) ( not ( = ?auto_63311 ?auto_63321 ) ) ( not ( = ?auto_63309 ?auto_63321 ) ) ( not ( = ?auto_63314 ?auto_63321 ) ) ( not ( = ?auto_63317 ?auto_63312 ) ) ( not ( = ?auto_63305 ?auto_63317 ) ) ( not ( = ?auto_63313 ?auto_63317 ) ) ( HOIST-AT ?auto_63304 ?auto_63317 ) ( not ( = ?auto_63316 ?auto_63304 ) ) ( not ( = ?auto_63300 ?auto_63304 ) ) ( not ( = ?auto_63325 ?auto_63304 ) ) ( AVAILABLE ?auto_63304 ) ( SURFACE-AT ?auto_63309 ?auto_63317 ) ( ON ?auto_63309 ?auto_63324 ) ( CLEAR ?auto_63309 ) ( not ( = ?auto_63298 ?auto_63324 ) ) ( not ( = ?auto_63299 ?auto_63324 ) ) ( not ( = ?auto_63311 ?auto_63324 ) ) ( not ( = ?auto_63309 ?auto_63324 ) ) ( not ( = ?auto_63314 ?auto_63324 ) ) ( not ( = ?auto_63321 ?auto_63324 ) ) ( IS-CRATE ?auto_63321 ) ( not ( = ?auto_63298 ?auto_63320 ) ) ( not ( = ?auto_63299 ?auto_63320 ) ) ( not ( = ?auto_63311 ?auto_63320 ) ) ( not ( = ?auto_63309 ?auto_63320 ) ) ( not ( = ?auto_63314 ?auto_63320 ) ) ( not ( = ?auto_63321 ?auto_63320 ) ) ( not ( = ?auto_63324 ?auto_63320 ) ) ( not ( = ?auto_63310 ?auto_63312 ) ) ( not ( = ?auto_63305 ?auto_63310 ) ) ( not ( = ?auto_63313 ?auto_63310 ) ) ( not ( = ?auto_63317 ?auto_63310 ) ) ( HOIST-AT ?auto_63308 ?auto_63310 ) ( not ( = ?auto_63316 ?auto_63308 ) ) ( not ( = ?auto_63300 ?auto_63308 ) ) ( not ( = ?auto_63325 ?auto_63308 ) ) ( not ( = ?auto_63304 ?auto_63308 ) ) ( AVAILABLE ?auto_63308 ) ( SURFACE-AT ?auto_63321 ?auto_63310 ) ( ON ?auto_63321 ?auto_63318 ) ( CLEAR ?auto_63321 ) ( not ( = ?auto_63298 ?auto_63318 ) ) ( not ( = ?auto_63299 ?auto_63318 ) ) ( not ( = ?auto_63311 ?auto_63318 ) ) ( not ( = ?auto_63309 ?auto_63318 ) ) ( not ( = ?auto_63314 ?auto_63318 ) ) ( not ( = ?auto_63321 ?auto_63318 ) ) ( not ( = ?auto_63324 ?auto_63318 ) ) ( not ( = ?auto_63320 ?auto_63318 ) ) ( IS-CRATE ?auto_63320 ) ( not ( = ?auto_63298 ?auto_63302 ) ) ( not ( = ?auto_63299 ?auto_63302 ) ) ( not ( = ?auto_63311 ?auto_63302 ) ) ( not ( = ?auto_63309 ?auto_63302 ) ) ( not ( = ?auto_63314 ?auto_63302 ) ) ( not ( = ?auto_63321 ?auto_63302 ) ) ( not ( = ?auto_63324 ?auto_63302 ) ) ( not ( = ?auto_63320 ?auto_63302 ) ) ( not ( = ?auto_63318 ?auto_63302 ) ) ( not ( = ?auto_63315 ?auto_63312 ) ) ( not ( = ?auto_63305 ?auto_63315 ) ) ( not ( = ?auto_63313 ?auto_63315 ) ) ( not ( = ?auto_63317 ?auto_63315 ) ) ( not ( = ?auto_63310 ?auto_63315 ) ) ( HOIST-AT ?auto_63306 ?auto_63315 ) ( not ( = ?auto_63316 ?auto_63306 ) ) ( not ( = ?auto_63300 ?auto_63306 ) ) ( not ( = ?auto_63325 ?auto_63306 ) ) ( not ( = ?auto_63304 ?auto_63306 ) ) ( not ( = ?auto_63308 ?auto_63306 ) ) ( AVAILABLE ?auto_63306 ) ( SURFACE-AT ?auto_63320 ?auto_63315 ) ( ON ?auto_63320 ?auto_63319 ) ( CLEAR ?auto_63320 ) ( not ( = ?auto_63298 ?auto_63319 ) ) ( not ( = ?auto_63299 ?auto_63319 ) ) ( not ( = ?auto_63311 ?auto_63319 ) ) ( not ( = ?auto_63309 ?auto_63319 ) ) ( not ( = ?auto_63314 ?auto_63319 ) ) ( not ( = ?auto_63321 ?auto_63319 ) ) ( not ( = ?auto_63324 ?auto_63319 ) ) ( not ( = ?auto_63320 ?auto_63319 ) ) ( not ( = ?auto_63318 ?auto_63319 ) ) ( not ( = ?auto_63302 ?auto_63319 ) ) ( SURFACE-AT ?auto_63323 ?auto_63312 ) ( CLEAR ?auto_63323 ) ( IS-CRATE ?auto_63302 ) ( not ( = ?auto_63298 ?auto_63323 ) ) ( not ( = ?auto_63299 ?auto_63323 ) ) ( not ( = ?auto_63311 ?auto_63323 ) ) ( not ( = ?auto_63309 ?auto_63323 ) ) ( not ( = ?auto_63314 ?auto_63323 ) ) ( not ( = ?auto_63321 ?auto_63323 ) ) ( not ( = ?auto_63324 ?auto_63323 ) ) ( not ( = ?auto_63320 ?auto_63323 ) ) ( not ( = ?auto_63318 ?auto_63323 ) ) ( not ( = ?auto_63302 ?auto_63323 ) ) ( not ( = ?auto_63319 ?auto_63323 ) ) ( AVAILABLE ?auto_63316 ) ( not ( = ?auto_63303 ?auto_63312 ) ) ( not ( = ?auto_63305 ?auto_63303 ) ) ( not ( = ?auto_63313 ?auto_63303 ) ) ( not ( = ?auto_63317 ?auto_63303 ) ) ( not ( = ?auto_63310 ?auto_63303 ) ) ( not ( = ?auto_63315 ?auto_63303 ) ) ( HOIST-AT ?auto_63301 ?auto_63303 ) ( not ( = ?auto_63316 ?auto_63301 ) ) ( not ( = ?auto_63300 ?auto_63301 ) ) ( not ( = ?auto_63325 ?auto_63301 ) ) ( not ( = ?auto_63304 ?auto_63301 ) ) ( not ( = ?auto_63308 ?auto_63301 ) ) ( not ( = ?auto_63306 ?auto_63301 ) ) ( AVAILABLE ?auto_63301 ) ( SURFACE-AT ?auto_63302 ?auto_63303 ) ( ON ?auto_63302 ?auto_63322 ) ( CLEAR ?auto_63302 ) ( not ( = ?auto_63298 ?auto_63322 ) ) ( not ( = ?auto_63299 ?auto_63322 ) ) ( not ( = ?auto_63311 ?auto_63322 ) ) ( not ( = ?auto_63309 ?auto_63322 ) ) ( not ( = ?auto_63314 ?auto_63322 ) ) ( not ( = ?auto_63321 ?auto_63322 ) ) ( not ( = ?auto_63324 ?auto_63322 ) ) ( not ( = ?auto_63320 ?auto_63322 ) ) ( not ( = ?auto_63318 ?auto_63322 ) ) ( not ( = ?auto_63302 ?auto_63322 ) ) ( not ( = ?auto_63319 ?auto_63322 ) ) ( not ( = ?auto_63323 ?auto_63322 ) ) ( TRUCK-AT ?auto_63307 ?auto_63312 ) )
    :subtasks
    ( ( !DRIVE ?auto_63307 ?auto_63312 ?auto_63303 )
      ( MAKE-ON ?auto_63298 ?auto_63299 )
      ( MAKE-ON-VERIFY ?auto_63298 ?auto_63299 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63326 - SURFACE
      ?auto_63327 - SURFACE
    )
    :vars
    (
      ?auto_63351 - HOIST
      ?auto_63340 - PLACE
      ?auto_63348 - PLACE
      ?auto_63339 - HOIST
      ?auto_63347 - SURFACE
      ?auto_63338 - SURFACE
      ?auto_63346 - PLACE
      ?auto_63349 - HOIST
      ?auto_63344 - SURFACE
      ?auto_63331 - SURFACE
      ?auto_63352 - PLACE
      ?auto_63336 - HOIST
      ?auto_63345 - SURFACE
      ?auto_63332 - SURFACE
      ?auto_63334 - PLACE
      ?auto_63342 - HOIST
      ?auto_63353 - SURFACE
      ?auto_63328 - SURFACE
      ?auto_63343 - PLACE
      ?auto_63341 - HOIST
      ?auto_63333 - SURFACE
      ?auto_63350 - SURFACE
      ?auto_63335 - PLACE
      ?auto_63329 - HOIST
      ?auto_63330 - SURFACE
      ?auto_63337 - TRUCK
      ?auto_63354 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63351 ?auto_63340 ) ( IS-CRATE ?auto_63326 ) ( not ( = ?auto_63326 ?auto_63327 ) ) ( not ( = ?auto_63348 ?auto_63340 ) ) ( HOIST-AT ?auto_63339 ?auto_63348 ) ( not ( = ?auto_63351 ?auto_63339 ) ) ( AVAILABLE ?auto_63339 ) ( SURFACE-AT ?auto_63326 ?auto_63348 ) ( ON ?auto_63326 ?auto_63347 ) ( CLEAR ?auto_63326 ) ( not ( = ?auto_63326 ?auto_63347 ) ) ( not ( = ?auto_63327 ?auto_63347 ) ) ( IS-CRATE ?auto_63327 ) ( not ( = ?auto_63326 ?auto_63338 ) ) ( not ( = ?auto_63327 ?auto_63338 ) ) ( not ( = ?auto_63347 ?auto_63338 ) ) ( not ( = ?auto_63346 ?auto_63340 ) ) ( not ( = ?auto_63348 ?auto_63346 ) ) ( HOIST-AT ?auto_63349 ?auto_63346 ) ( not ( = ?auto_63351 ?auto_63349 ) ) ( not ( = ?auto_63339 ?auto_63349 ) ) ( AVAILABLE ?auto_63349 ) ( SURFACE-AT ?auto_63327 ?auto_63346 ) ( ON ?auto_63327 ?auto_63344 ) ( CLEAR ?auto_63327 ) ( not ( = ?auto_63326 ?auto_63344 ) ) ( not ( = ?auto_63327 ?auto_63344 ) ) ( not ( = ?auto_63347 ?auto_63344 ) ) ( not ( = ?auto_63338 ?auto_63344 ) ) ( IS-CRATE ?auto_63338 ) ( not ( = ?auto_63326 ?auto_63331 ) ) ( not ( = ?auto_63327 ?auto_63331 ) ) ( not ( = ?auto_63347 ?auto_63331 ) ) ( not ( = ?auto_63338 ?auto_63331 ) ) ( not ( = ?auto_63344 ?auto_63331 ) ) ( not ( = ?auto_63352 ?auto_63340 ) ) ( not ( = ?auto_63348 ?auto_63352 ) ) ( not ( = ?auto_63346 ?auto_63352 ) ) ( HOIST-AT ?auto_63336 ?auto_63352 ) ( not ( = ?auto_63351 ?auto_63336 ) ) ( not ( = ?auto_63339 ?auto_63336 ) ) ( not ( = ?auto_63349 ?auto_63336 ) ) ( AVAILABLE ?auto_63336 ) ( SURFACE-AT ?auto_63338 ?auto_63352 ) ( ON ?auto_63338 ?auto_63345 ) ( CLEAR ?auto_63338 ) ( not ( = ?auto_63326 ?auto_63345 ) ) ( not ( = ?auto_63327 ?auto_63345 ) ) ( not ( = ?auto_63347 ?auto_63345 ) ) ( not ( = ?auto_63338 ?auto_63345 ) ) ( not ( = ?auto_63344 ?auto_63345 ) ) ( not ( = ?auto_63331 ?auto_63345 ) ) ( IS-CRATE ?auto_63331 ) ( not ( = ?auto_63326 ?auto_63332 ) ) ( not ( = ?auto_63327 ?auto_63332 ) ) ( not ( = ?auto_63347 ?auto_63332 ) ) ( not ( = ?auto_63338 ?auto_63332 ) ) ( not ( = ?auto_63344 ?auto_63332 ) ) ( not ( = ?auto_63331 ?auto_63332 ) ) ( not ( = ?auto_63345 ?auto_63332 ) ) ( not ( = ?auto_63334 ?auto_63340 ) ) ( not ( = ?auto_63348 ?auto_63334 ) ) ( not ( = ?auto_63346 ?auto_63334 ) ) ( not ( = ?auto_63352 ?auto_63334 ) ) ( HOIST-AT ?auto_63342 ?auto_63334 ) ( not ( = ?auto_63351 ?auto_63342 ) ) ( not ( = ?auto_63339 ?auto_63342 ) ) ( not ( = ?auto_63349 ?auto_63342 ) ) ( not ( = ?auto_63336 ?auto_63342 ) ) ( AVAILABLE ?auto_63342 ) ( SURFACE-AT ?auto_63331 ?auto_63334 ) ( ON ?auto_63331 ?auto_63353 ) ( CLEAR ?auto_63331 ) ( not ( = ?auto_63326 ?auto_63353 ) ) ( not ( = ?auto_63327 ?auto_63353 ) ) ( not ( = ?auto_63347 ?auto_63353 ) ) ( not ( = ?auto_63338 ?auto_63353 ) ) ( not ( = ?auto_63344 ?auto_63353 ) ) ( not ( = ?auto_63331 ?auto_63353 ) ) ( not ( = ?auto_63345 ?auto_63353 ) ) ( not ( = ?auto_63332 ?auto_63353 ) ) ( IS-CRATE ?auto_63332 ) ( not ( = ?auto_63326 ?auto_63328 ) ) ( not ( = ?auto_63327 ?auto_63328 ) ) ( not ( = ?auto_63347 ?auto_63328 ) ) ( not ( = ?auto_63338 ?auto_63328 ) ) ( not ( = ?auto_63344 ?auto_63328 ) ) ( not ( = ?auto_63331 ?auto_63328 ) ) ( not ( = ?auto_63345 ?auto_63328 ) ) ( not ( = ?auto_63332 ?auto_63328 ) ) ( not ( = ?auto_63353 ?auto_63328 ) ) ( not ( = ?auto_63343 ?auto_63340 ) ) ( not ( = ?auto_63348 ?auto_63343 ) ) ( not ( = ?auto_63346 ?auto_63343 ) ) ( not ( = ?auto_63352 ?auto_63343 ) ) ( not ( = ?auto_63334 ?auto_63343 ) ) ( HOIST-AT ?auto_63341 ?auto_63343 ) ( not ( = ?auto_63351 ?auto_63341 ) ) ( not ( = ?auto_63339 ?auto_63341 ) ) ( not ( = ?auto_63349 ?auto_63341 ) ) ( not ( = ?auto_63336 ?auto_63341 ) ) ( not ( = ?auto_63342 ?auto_63341 ) ) ( AVAILABLE ?auto_63341 ) ( SURFACE-AT ?auto_63332 ?auto_63343 ) ( ON ?auto_63332 ?auto_63333 ) ( CLEAR ?auto_63332 ) ( not ( = ?auto_63326 ?auto_63333 ) ) ( not ( = ?auto_63327 ?auto_63333 ) ) ( not ( = ?auto_63347 ?auto_63333 ) ) ( not ( = ?auto_63338 ?auto_63333 ) ) ( not ( = ?auto_63344 ?auto_63333 ) ) ( not ( = ?auto_63331 ?auto_63333 ) ) ( not ( = ?auto_63345 ?auto_63333 ) ) ( not ( = ?auto_63332 ?auto_63333 ) ) ( not ( = ?auto_63353 ?auto_63333 ) ) ( not ( = ?auto_63328 ?auto_63333 ) ) ( IS-CRATE ?auto_63328 ) ( not ( = ?auto_63326 ?auto_63350 ) ) ( not ( = ?auto_63327 ?auto_63350 ) ) ( not ( = ?auto_63347 ?auto_63350 ) ) ( not ( = ?auto_63338 ?auto_63350 ) ) ( not ( = ?auto_63344 ?auto_63350 ) ) ( not ( = ?auto_63331 ?auto_63350 ) ) ( not ( = ?auto_63345 ?auto_63350 ) ) ( not ( = ?auto_63332 ?auto_63350 ) ) ( not ( = ?auto_63353 ?auto_63350 ) ) ( not ( = ?auto_63328 ?auto_63350 ) ) ( not ( = ?auto_63333 ?auto_63350 ) ) ( not ( = ?auto_63335 ?auto_63340 ) ) ( not ( = ?auto_63348 ?auto_63335 ) ) ( not ( = ?auto_63346 ?auto_63335 ) ) ( not ( = ?auto_63352 ?auto_63335 ) ) ( not ( = ?auto_63334 ?auto_63335 ) ) ( not ( = ?auto_63343 ?auto_63335 ) ) ( HOIST-AT ?auto_63329 ?auto_63335 ) ( not ( = ?auto_63351 ?auto_63329 ) ) ( not ( = ?auto_63339 ?auto_63329 ) ) ( not ( = ?auto_63349 ?auto_63329 ) ) ( not ( = ?auto_63336 ?auto_63329 ) ) ( not ( = ?auto_63342 ?auto_63329 ) ) ( not ( = ?auto_63341 ?auto_63329 ) ) ( AVAILABLE ?auto_63329 ) ( SURFACE-AT ?auto_63328 ?auto_63335 ) ( ON ?auto_63328 ?auto_63330 ) ( CLEAR ?auto_63328 ) ( not ( = ?auto_63326 ?auto_63330 ) ) ( not ( = ?auto_63327 ?auto_63330 ) ) ( not ( = ?auto_63347 ?auto_63330 ) ) ( not ( = ?auto_63338 ?auto_63330 ) ) ( not ( = ?auto_63344 ?auto_63330 ) ) ( not ( = ?auto_63331 ?auto_63330 ) ) ( not ( = ?auto_63345 ?auto_63330 ) ) ( not ( = ?auto_63332 ?auto_63330 ) ) ( not ( = ?auto_63353 ?auto_63330 ) ) ( not ( = ?auto_63328 ?auto_63330 ) ) ( not ( = ?auto_63333 ?auto_63330 ) ) ( not ( = ?auto_63350 ?auto_63330 ) ) ( TRUCK-AT ?auto_63337 ?auto_63340 ) ( SURFACE-AT ?auto_63354 ?auto_63340 ) ( CLEAR ?auto_63354 ) ( LIFTING ?auto_63351 ?auto_63350 ) ( IS-CRATE ?auto_63350 ) ( not ( = ?auto_63326 ?auto_63354 ) ) ( not ( = ?auto_63327 ?auto_63354 ) ) ( not ( = ?auto_63347 ?auto_63354 ) ) ( not ( = ?auto_63338 ?auto_63354 ) ) ( not ( = ?auto_63344 ?auto_63354 ) ) ( not ( = ?auto_63331 ?auto_63354 ) ) ( not ( = ?auto_63345 ?auto_63354 ) ) ( not ( = ?auto_63332 ?auto_63354 ) ) ( not ( = ?auto_63353 ?auto_63354 ) ) ( not ( = ?auto_63328 ?auto_63354 ) ) ( not ( = ?auto_63333 ?auto_63354 ) ) ( not ( = ?auto_63350 ?auto_63354 ) ) ( not ( = ?auto_63330 ?auto_63354 ) ) )
    :subtasks
    ( ( !DROP ?auto_63351 ?auto_63350 ?auto_63354 ?auto_63340 )
      ( MAKE-ON ?auto_63326 ?auto_63327 )
      ( MAKE-ON-VERIFY ?auto_63326 ?auto_63327 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63355 - SURFACE
      ?auto_63356 - SURFACE
    )
    :vars
    (
      ?auto_63369 - HOIST
      ?auto_63381 - PLACE
      ?auto_63376 - PLACE
      ?auto_63363 - HOIST
      ?auto_63372 - SURFACE
      ?auto_63382 - SURFACE
      ?auto_63373 - PLACE
      ?auto_63377 - HOIST
      ?auto_63375 - SURFACE
      ?auto_63383 - SURFACE
      ?auto_63361 - PLACE
      ?auto_63370 - HOIST
      ?auto_63374 - SURFACE
      ?auto_63359 - SURFACE
      ?auto_63380 - PLACE
      ?auto_63357 - HOIST
      ?auto_63362 - SURFACE
      ?auto_63371 - SURFACE
      ?auto_63379 - PLACE
      ?auto_63364 - HOIST
      ?auto_63368 - SURFACE
      ?auto_63378 - SURFACE
      ?auto_63365 - PLACE
      ?auto_63358 - HOIST
      ?auto_63367 - SURFACE
      ?auto_63366 - TRUCK
      ?auto_63360 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63369 ?auto_63381 ) ( IS-CRATE ?auto_63355 ) ( not ( = ?auto_63355 ?auto_63356 ) ) ( not ( = ?auto_63376 ?auto_63381 ) ) ( HOIST-AT ?auto_63363 ?auto_63376 ) ( not ( = ?auto_63369 ?auto_63363 ) ) ( AVAILABLE ?auto_63363 ) ( SURFACE-AT ?auto_63355 ?auto_63376 ) ( ON ?auto_63355 ?auto_63372 ) ( CLEAR ?auto_63355 ) ( not ( = ?auto_63355 ?auto_63372 ) ) ( not ( = ?auto_63356 ?auto_63372 ) ) ( IS-CRATE ?auto_63356 ) ( not ( = ?auto_63355 ?auto_63382 ) ) ( not ( = ?auto_63356 ?auto_63382 ) ) ( not ( = ?auto_63372 ?auto_63382 ) ) ( not ( = ?auto_63373 ?auto_63381 ) ) ( not ( = ?auto_63376 ?auto_63373 ) ) ( HOIST-AT ?auto_63377 ?auto_63373 ) ( not ( = ?auto_63369 ?auto_63377 ) ) ( not ( = ?auto_63363 ?auto_63377 ) ) ( AVAILABLE ?auto_63377 ) ( SURFACE-AT ?auto_63356 ?auto_63373 ) ( ON ?auto_63356 ?auto_63375 ) ( CLEAR ?auto_63356 ) ( not ( = ?auto_63355 ?auto_63375 ) ) ( not ( = ?auto_63356 ?auto_63375 ) ) ( not ( = ?auto_63372 ?auto_63375 ) ) ( not ( = ?auto_63382 ?auto_63375 ) ) ( IS-CRATE ?auto_63382 ) ( not ( = ?auto_63355 ?auto_63383 ) ) ( not ( = ?auto_63356 ?auto_63383 ) ) ( not ( = ?auto_63372 ?auto_63383 ) ) ( not ( = ?auto_63382 ?auto_63383 ) ) ( not ( = ?auto_63375 ?auto_63383 ) ) ( not ( = ?auto_63361 ?auto_63381 ) ) ( not ( = ?auto_63376 ?auto_63361 ) ) ( not ( = ?auto_63373 ?auto_63361 ) ) ( HOIST-AT ?auto_63370 ?auto_63361 ) ( not ( = ?auto_63369 ?auto_63370 ) ) ( not ( = ?auto_63363 ?auto_63370 ) ) ( not ( = ?auto_63377 ?auto_63370 ) ) ( AVAILABLE ?auto_63370 ) ( SURFACE-AT ?auto_63382 ?auto_63361 ) ( ON ?auto_63382 ?auto_63374 ) ( CLEAR ?auto_63382 ) ( not ( = ?auto_63355 ?auto_63374 ) ) ( not ( = ?auto_63356 ?auto_63374 ) ) ( not ( = ?auto_63372 ?auto_63374 ) ) ( not ( = ?auto_63382 ?auto_63374 ) ) ( not ( = ?auto_63375 ?auto_63374 ) ) ( not ( = ?auto_63383 ?auto_63374 ) ) ( IS-CRATE ?auto_63383 ) ( not ( = ?auto_63355 ?auto_63359 ) ) ( not ( = ?auto_63356 ?auto_63359 ) ) ( not ( = ?auto_63372 ?auto_63359 ) ) ( not ( = ?auto_63382 ?auto_63359 ) ) ( not ( = ?auto_63375 ?auto_63359 ) ) ( not ( = ?auto_63383 ?auto_63359 ) ) ( not ( = ?auto_63374 ?auto_63359 ) ) ( not ( = ?auto_63380 ?auto_63381 ) ) ( not ( = ?auto_63376 ?auto_63380 ) ) ( not ( = ?auto_63373 ?auto_63380 ) ) ( not ( = ?auto_63361 ?auto_63380 ) ) ( HOIST-AT ?auto_63357 ?auto_63380 ) ( not ( = ?auto_63369 ?auto_63357 ) ) ( not ( = ?auto_63363 ?auto_63357 ) ) ( not ( = ?auto_63377 ?auto_63357 ) ) ( not ( = ?auto_63370 ?auto_63357 ) ) ( AVAILABLE ?auto_63357 ) ( SURFACE-AT ?auto_63383 ?auto_63380 ) ( ON ?auto_63383 ?auto_63362 ) ( CLEAR ?auto_63383 ) ( not ( = ?auto_63355 ?auto_63362 ) ) ( not ( = ?auto_63356 ?auto_63362 ) ) ( not ( = ?auto_63372 ?auto_63362 ) ) ( not ( = ?auto_63382 ?auto_63362 ) ) ( not ( = ?auto_63375 ?auto_63362 ) ) ( not ( = ?auto_63383 ?auto_63362 ) ) ( not ( = ?auto_63374 ?auto_63362 ) ) ( not ( = ?auto_63359 ?auto_63362 ) ) ( IS-CRATE ?auto_63359 ) ( not ( = ?auto_63355 ?auto_63371 ) ) ( not ( = ?auto_63356 ?auto_63371 ) ) ( not ( = ?auto_63372 ?auto_63371 ) ) ( not ( = ?auto_63382 ?auto_63371 ) ) ( not ( = ?auto_63375 ?auto_63371 ) ) ( not ( = ?auto_63383 ?auto_63371 ) ) ( not ( = ?auto_63374 ?auto_63371 ) ) ( not ( = ?auto_63359 ?auto_63371 ) ) ( not ( = ?auto_63362 ?auto_63371 ) ) ( not ( = ?auto_63379 ?auto_63381 ) ) ( not ( = ?auto_63376 ?auto_63379 ) ) ( not ( = ?auto_63373 ?auto_63379 ) ) ( not ( = ?auto_63361 ?auto_63379 ) ) ( not ( = ?auto_63380 ?auto_63379 ) ) ( HOIST-AT ?auto_63364 ?auto_63379 ) ( not ( = ?auto_63369 ?auto_63364 ) ) ( not ( = ?auto_63363 ?auto_63364 ) ) ( not ( = ?auto_63377 ?auto_63364 ) ) ( not ( = ?auto_63370 ?auto_63364 ) ) ( not ( = ?auto_63357 ?auto_63364 ) ) ( AVAILABLE ?auto_63364 ) ( SURFACE-AT ?auto_63359 ?auto_63379 ) ( ON ?auto_63359 ?auto_63368 ) ( CLEAR ?auto_63359 ) ( not ( = ?auto_63355 ?auto_63368 ) ) ( not ( = ?auto_63356 ?auto_63368 ) ) ( not ( = ?auto_63372 ?auto_63368 ) ) ( not ( = ?auto_63382 ?auto_63368 ) ) ( not ( = ?auto_63375 ?auto_63368 ) ) ( not ( = ?auto_63383 ?auto_63368 ) ) ( not ( = ?auto_63374 ?auto_63368 ) ) ( not ( = ?auto_63359 ?auto_63368 ) ) ( not ( = ?auto_63362 ?auto_63368 ) ) ( not ( = ?auto_63371 ?auto_63368 ) ) ( IS-CRATE ?auto_63371 ) ( not ( = ?auto_63355 ?auto_63378 ) ) ( not ( = ?auto_63356 ?auto_63378 ) ) ( not ( = ?auto_63372 ?auto_63378 ) ) ( not ( = ?auto_63382 ?auto_63378 ) ) ( not ( = ?auto_63375 ?auto_63378 ) ) ( not ( = ?auto_63383 ?auto_63378 ) ) ( not ( = ?auto_63374 ?auto_63378 ) ) ( not ( = ?auto_63359 ?auto_63378 ) ) ( not ( = ?auto_63362 ?auto_63378 ) ) ( not ( = ?auto_63371 ?auto_63378 ) ) ( not ( = ?auto_63368 ?auto_63378 ) ) ( not ( = ?auto_63365 ?auto_63381 ) ) ( not ( = ?auto_63376 ?auto_63365 ) ) ( not ( = ?auto_63373 ?auto_63365 ) ) ( not ( = ?auto_63361 ?auto_63365 ) ) ( not ( = ?auto_63380 ?auto_63365 ) ) ( not ( = ?auto_63379 ?auto_63365 ) ) ( HOIST-AT ?auto_63358 ?auto_63365 ) ( not ( = ?auto_63369 ?auto_63358 ) ) ( not ( = ?auto_63363 ?auto_63358 ) ) ( not ( = ?auto_63377 ?auto_63358 ) ) ( not ( = ?auto_63370 ?auto_63358 ) ) ( not ( = ?auto_63357 ?auto_63358 ) ) ( not ( = ?auto_63364 ?auto_63358 ) ) ( AVAILABLE ?auto_63358 ) ( SURFACE-AT ?auto_63371 ?auto_63365 ) ( ON ?auto_63371 ?auto_63367 ) ( CLEAR ?auto_63371 ) ( not ( = ?auto_63355 ?auto_63367 ) ) ( not ( = ?auto_63356 ?auto_63367 ) ) ( not ( = ?auto_63372 ?auto_63367 ) ) ( not ( = ?auto_63382 ?auto_63367 ) ) ( not ( = ?auto_63375 ?auto_63367 ) ) ( not ( = ?auto_63383 ?auto_63367 ) ) ( not ( = ?auto_63374 ?auto_63367 ) ) ( not ( = ?auto_63359 ?auto_63367 ) ) ( not ( = ?auto_63362 ?auto_63367 ) ) ( not ( = ?auto_63371 ?auto_63367 ) ) ( not ( = ?auto_63368 ?auto_63367 ) ) ( not ( = ?auto_63378 ?auto_63367 ) ) ( TRUCK-AT ?auto_63366 ?auto_63381 ) ( SURFACE-AT ?auto_63360 ?auto_63381 ) ( CLEAR ?auto_63360 ) ( IS-CRATE ?auto_63378 ) ( not ( = ?auto_63355 ?auto_63360 ) ) ( not ( = ?auto_63356 ?auto_63360 ) ) ( not ( = ?auto_63372 ?auto_63360 ) ) ( not ( = ?auto_63382 ?auto_63360 ) ) ( not ( = ?auto_63375 ?auto_63360 ) ) ( not ( = ?auto_63383 ?auto_63360 ) ) ( not ( = ?auto_63374 ?auto_63360 ) ) ( not ( = ?auto_63359 ?auto_63360 ) ) ( not ( = ?auto_63362 ?auto_63360 ) ) ( not ( = ?auto_63371 ?auto_63360 ) ) ( not ( = ?auto_63368 ?auto_63360 ) ) ( not ( = ?auto_63378 ?auto_63360 ) ) ( not ( = ?auto_63367 ?auto_63360 ) ) ( AVAILABLE ?auto_63369 ) ( IN ?auto_63378 ?auto_63366 ) )
    :subtasks
    ( ( !UNLOAD ?auto_63369 ?auto_63378 ?auto_63366 ?auto_63381 )
      ( MAKE-ON ?auto_63355 ?auto_63356 )
      ( MAKE-ON-VERIFY ?auto_63355 ?auto_63356 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63384 - SURFACE
      ?auto_63385 - SURFACE
    )
    :vars
    (
      ?auto_63410 - HOIST
      ?auto_63395 - PLACE
      ?auto_63402 - PLACE
      ?auto_63387 - HOIST
      ?auto_63406 - SURFACE
      ?auto_63396 - SURFACE
      ?auto_63399 - PLACE
      ?auto_63403 - HOIST
      ?auto_63401 - SURFACE
      ?auto_63397 - SURFACE
      ?auto_63407 - PLACE
      ?auto_63390 - HOIST
      ?auto_63400 - SURFACE
      ?auto_63392 - SURFACE
      ?auto_63398 - PLACE
      ?auto_63386 - HOIST
      ?auto_63411 - SURFACE
      ?auto_63391 - SURFACE
      ?auto_63405 - PLACE
      ?auto_63412 - HOIST
      ?auto_63389 - SURFACE
      ?auto_63404 - SURFACE
      ?auto_63408 - PLACE
      ?auto_63393 - HOIST
      ?auto_63394 - SURFACE
      ?auto_63409 - SURFACE
      ?auto_63388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63410 ?auto_63395 ) ( IS-CRATE ?auto_63384 ) ( not ( = ?auto_63384 ?auto_63385 ) ) ( not ( = ?auto_63402 ?auto_63395 ) ) ( HOIST-AT ?auto_63387 ?auto_63402 ) ( not ( = ?auto_63410 ?auto_63387 ) ) ( AVAILABLE ?auto_63387 ) ( SURFACE-AT ?auto_63384 ?auto_63402 ) ( ON ?auto_63384 ?auto_63406 ) ( CLEAR ?auto_63384 ) ( not ( = ?auto_63384 ?auto_63406 ) ) ( not ( = ?auto_63385 ?auto_63406 ) ) ( IS-CRATE ?auto_63385 ) ( not ( = ?auto_63384 ?auto_63396 ) ) ( not ( = ?auto_63385 ?auto_63396 ) ) ( not ( = ?auto_63406 ?auto_63396 ) ) ( not ( = ?auto_63399 ?auto_63395 ) ) ( not ( = ?auto_63402 ?auto_63399 ) ) ( HOIST-AT ?auto_63403 ?auto_63399 ) ( not ( = ?auto_63410 ?auto_63403 ) ) ( not ( = ?auto_63387 ?auto_63403 ) ) ( AVAILABLE ?auto_63403 ) ( SURFACE-AT ?auto_63385 ?auto_63399 ) ( ON ?auto_63385 ?auto_63401 ) ( CLEAR ?auto_63385 ) ( not ( = ?auto_63384 ?auto_63401 ) ) ( not ( = ?auto_63385 ?auto_63401 ) ) ( not ( = ?auto_63406 ?auto_63401 ) ) ( not ( = ?auto_63396 ?auto_63401 ) ) ( IS-CRATE ?auto_63396 ) ( not ( = ?auto_63384 ?auto_63397 ) ) ( not ( = ?auto_63385 ?auto_63397 ) ) ( not ( = ?auto_63406 ?auto_63397 ) ) ( not ( = ?auto_63396 ?auto_63397 ) ) ( not ( = ?auto_63401 ?auto_63397 ) ) ( not ( = ?auto_63407 ?auto_63395 ) ) ( not ( = ?auto_63402 ?auto_63407 ) ) ( not ( = ?auto_63399 ?auto_63407 ) ) ( HOIST-AT ?auto_63390 ?auto_63407 ) ( not ( = ?auto_63410 ?auto_63390 ) ) ( not ( = ?auto_63387 ?auto_63390 ) ) ( not ( = ?auto_63403 ?auto_63390 ) ) ( AVAILABLE ?auto_63390 ) ( SURFACE-AT ?auto_63396 ?auto_63407 ) ( ON ?auto_63396 ?auto_63400 ) ( CLEAR ?auto_63396 ) ( not ( = ?auto_63384 ?auto_63400 ) ) ( not ( = ?auto_63385 ?auto_63400 ) ) ( not ( = ?auto_63406 ?auto_63400 ) ) ( not ( = ?auto_63396 ?auto_63400 ) ) ( not ( = ?auto_63401 ?auto_63400 ) ) ( not ( = ?auto_63397 ?auto_63400 ) ) ( IS-CRATE ?auto_63397 ) ( not ( = ?auto_63384 ?auto_63392 ) ) ( not ( = ?auto_63385 ?auto_63392 ) ) ( not ( = ?auto_63406 ?auto_63392 ) ) ( not ( = ?auto_63396 ?auto_63392 ) ) ( not ( = ?auto_63401 ?auto_63392 ) ) ( not ( = ?auto_63397 ?auto_63392 ) ) ( not ( = ?auto_63400 ?auto_63392 ) ) ( not ( = ?auto_63398 ?auto_63395 ) ) ( not ( = ?auto_63402 ?auto_63398 ) ) ( not ( = ?auto_63399 ?auto_63398 ) ) ( not ( = ?auto_63407 ?auto_63398 ) ) ( HOIST-AT ?auto_63386 ?auto_63398 ) ( not ( = ?auto_63410 ?auto_63386 ) ) ( not ( = ?auto_63387 ?auto_63386 ) ) ( not ( = ?auto_63403 ?auto_63386 ) ) ( not ( = ?auto_63390 ?auto_63386 ) ) ( AVAILABLE ?auto_63386 ) ( SURFACE-AT ?auto_63397 ?auto_63398 ) ( ON ?auto_63397 ?auto_63411 ) ( CLEAR ?auto_63397 ) ( not ( = ?auto_63384 ?auto_63411 ) ) ( not ( = ?auto_63385 ?auto_63411 ) ) ( not ( = ?auto_63406 ?auto_63411 ) ) ( not ( = ?auto_63396 ?auto_63411 ) ) ( not ( = ?auto_63401 ?auto_63411 ) ) ( not ( = ?auto_63397 ?auto_63411 ) ) ( not ( = ?auto_63400 ?auto_63411 ) ) ( not ( = ?auto_63392 ?auto_63411 ) ) ( IS-CRATE ?auto_63392 ) ( not ( = ?auto_63384 ?auto_63391 ) ) ( not ( = ?auto_63385 ?auto_63391 ) ) ( not ( = ?auto_63406 ?auto_63391 ) ) ( not ( = ?auto_63396 ?auto_63391 ) ) ( not ( = ?auto_63401 ?auto_63391 ) ) ( not ( = ?auto_63397 ?auto_63391 ) ) ( not ( = ?auto_63400 ?auto_63391 ) ) ( not ( = ?auto_63392 ?auto_63391 ) ) ( not ( = ?auto_63411 ?auto_63391 ) ) ( not ( = ?auto_63405 ?auto_63395 ) ) ( not ( = ?auto_63402 ?auto_63405 ) ) ( not ( = ?auto_63399 ?auto_63405 ) ) ( not ( = ?auto_63407 ?auto_63405 ) ) ( not ( = ?auto_63398 ?auto_63405 ) ) ( HOIST-AT ?auto_63412 ?auto_63405 ) ( not ( = ?auto_63410 ?auto_63412 ) ) ( not ( = ?auto_63387 ?auto_63412 ) ) ( not ( = ?auto_63403 ?auto_63412 ) ) ( not ( = ?auto_63390 ?auto_63412 ) ) ( not ( = ?auto_63386 ?auto_63412 ) ) ( AVAILABLE ?auto_63412 ) ( SURFACE-AT ?auto_63392 ?auto_63405 ) ( ON ?auto_63392 ?auto_63389 ) ( CLEAR ?auto_63392 ) ( not ( = ?auto_63384 ?auto_63389 ) ) ( not ( = ?auto_63385 ?auto_63389 ) ) ( not ( = ?auto_63406 ?auto_63389 ) ) ( not ( = ?auto_63396 ?auto_63389 ) ) ( not ( = ?auto_63401 ?auto_63389 ) ) ( not ( = ?auto_63397 ?auto_63389 ) ) ( not ( = ?auto_63400 ?auto_63389 ) ) ( not ( = ?auto_63392 ?auto_63389 ) ) ( not ( = ?auto_63411 ?auto_63389 ) ) ( not ( = ?auto_63391 ?auto_63389 ) ) ( IS-CRATE ?auto_63391 ) ( not ( = ?auto_63384 ?auto_63404 ) ) ( not ( = ?auto_63385 ?auto_63404 ) ) ( not ( = ?auto_63406 ?auto_63404 ) ) ( not ( = ?auto_63396 ?auto_63404 ) ) ( not ( = ?auto_63401 ?auto_63404 ) ) ( not ( = ?auto_63397 ?auto_63404 ) ) ( not ( = ?auto_63400 ?auto_63404 ) ) ( not ( = ?auto_63392 ?auto_63404 ) ) ( not ( = ?auto_63411 ?auto_63404 ) ) ( not ( = ?auto_63391 ?auto_63404 ) ) ( not ( = ?auto_63389 ?auto_63404 ) ) ( not ( = ?auto_63408 ?auto_63395 ) ) ( not ( = ?auto_63402 ?auto_63408 ) ) ( not ( = ?auto_63399 ?auto_63408 ) ) ( not ( = ?auto_63407 ?auto_63408 ) ) ( not ( = ?auto_63398 ?auto_63408 ) ) ( not ( = ?auto_63405 ?auto_63408 ) ) ( HOIST-AT ?auto_63393 ?auto_63408 ) ( not ( = ?auto_63410 ?auto_63393 ) ) ( not ( = ?auto_63387 ?auto_63393 ) ) ( not ( = ?auto_63403 ?auto_63393 ) ) ( not ( = ?auto_63390 ?auto_63393 ) ) ( not ( = ?auto_63386 ?auto_63393 ) ) ( not ( = ?auto_63412 ?auto_63393 ) ) ( AVAILABLE ?auto_63393 ) ( SURFACE-AT ?auto_63391 ?auto_63408 ) ( ON ?auto_63391 ?auto_63394 ) ( CLEAR ?auto_63391 ) ( not ( = ?auto_63384 ?auto_63394 ) ) ( not ( = ?auto_63385 ?auto_63394 ) ) ( not ( = ?auto_63406 ?auto_63394 ) ) ( not ( = ?auto_63396 ?auto_63394 ) ) ( not ( = ?auto_63401 ?auto_63394 ) ) ( not ( = ?auto_63397 ?auto_63394 ) ) ( not ( = ?auto_63400 ?auto_63394 ) ) ( not ( = ?auto_63392 ?auto_63394 ) ) ( not ( = ?auto_63411 ?auto_63394 ) ) ( not ( = ?auto_63391 ?auto_63394 ) ) ( not ( = ?auto_63389 ?auto_63394 ) ) ( not ( = ?auto_63404 ?auto_63394 ) ) ( SURFACE-AT ?auto_63409 ?auto_63395 ) ( CLEAR ?auto_63409 ) ( IS-CRATE ?auto_63404 ) ( not ( = ?auto_63384 ?auto_63409 ) ) ( not ( = ?auto_63385 ?auto_63409 ) ) ( not ( = ?auto_63406 ?auto_63409 ) ) ( not ( = ?auto_63396 ?auto_63409 ) ) ( not ( = ?auto_63401 ?auto_63409 ) ) ( not ( = ?auto_63397 ?auto_63409 ) ) ( not ( = ?auto_63400 ?auto_63409 ) ) ( not ( = ?auto_63392 ?auto_63409 ) ) ( not ( = ?auto_63411 ?auto_63409 ) ) ( not ( = ?auto_63391 ?auto_63409 ) ) ( not ( = ?auto_63389 ?auto_63409 ) ) ( not ( = ?auto_63404 ?auto_63409 ) ) ( not ( = ?auto_63394 ?auto_63409 ) ) ( AVAILABLE ?auto_63410 ) ( IN ?auto_63404 ?auto_63388 ) ( TRUCK-AT ?auto_63388 ?auto_63399 ) )
    :subtasks
    ( ( !DRIVE ?auto_63388 ?auto_63399 ?auto_63395 )
      ( MAKE-ON ?auto_63384 ?auto_63385 )
      ( MAKE-ON-VERIFY ?auto_63384 ?auto_63385 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63413 - SURFACE
      ?auto_63414 - SURFACE
    )
    :vars
    (
      ?auto_63436 - HOIST
      ?auto_63433 - PLACE
      ?auto_63440 - PLACE
      ?auto_63430 - HOIST
      ?auto_63415 - SURFACE
      ?auto_63434 - SURFACE
      ?auto_63423 - PLACE
      ?auto_63419 - HOIST
      ?auto_63426 - SURFACE
      ?auto_63421 - SURFACE
      ?auto_63416 - PLACE
      ?auto_63435 - HOIST
      ?auto_63424 - SURFACE
      ?auto_63425 - SURFACE
      ?auto_63431 - PLACE
      ?auto_63420 - HOIST
      ?auto_63437 - SURFACE
      ?auto_63432 - SURFACE
      ?auto_63418 - PLACE
      ?auto_63438 - HOIST
      ?auto_63428 - SURFACE
      ?auto_63441 - SURFACE
      ?auto_63417 - PLACE
      ?auto_63427 - HOIST
      ?auto_63422 - SURFACE
      ?auto_63439 - SURFACE
      ?auto_63429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63436 ?auto_63433 ) ( IS-CRATE ?auto_63413 ) ( not ( = ?auto_63413 ?auto_63414 ) ) ( not ( = ?auto_63440 ?auto_63433 ) ) ( HOIST-AT ?auto_63430 ?auto_63440 ) ( not ( = ?auto_63436 ?auto_63430 ) ) ( AVAILABLE ?auto_63430 ) ( SURFACE-AT ?auto_63413 ?auto_63440 ) ( ON ?auto_63413 ?auto_63415 ) ( CLEAR ?auto_63413 ) ( not ( = ?auto_63413 ?auto_63415 ) ) ( not ( = ?auto_63414 ?auto_63415 ) ) ( IS-CRATE ?auto_63414 ) ( not ( = ?auto_63413 ?auto_63434 ) ) ( not ( = ?auto_63414 ?auto_63434 ) ) ( not ( = ?auto_63415 ?auto_63434 ) ) ( not ( = ?auto_63423 ?auto_63433 ) ) ( not ( = ?auto_63440 ?auto_63423 ) ) ( HOIST-AT ?auto_63419 ?auto_63423 ) ( not ( = ?auto_63436 ?auto_63419 ) ) ( not ( = ?auto_63430 ?auto_63419 ) ) ( SURFACE-AT ?auto_63414 ?auto_63423 ) ( ON ?auto_63414 ?auto_63426 ) ( CLEAR ?auto_63414 ) ( not ( = ?auto_63413 ?auto_63426 ) ) ( not ( = ?auto_63414 ?auto_63426 ) ) ( not ( = ?auto_63415 ?auto_63426 ) ) ( not ( = ?auto_63434 ?auto_63426 ) ) ( IS-CRATE ?auto_63434 ) ( not ( = ?auto_63413 ?auto_63421 ) ) ( not ( = ?auto_63414 ?auto_63421 ) ) ( not ( = ?auto_63415 ?auto_63421 ) ) ( not ( = ?auto_63434 ?auto_63421 ) ) ( not ( = ?auto_63426 ?auto_63421 ) ) ( not ( = ?auto_63416 ?auto_63433 ) ) ( not ( = ?auto_63440 ?auto_63416 ) ) ( not ( = ?auto_63423 ?auto_63416 ) ) ( HOIST-AT ?auto_63435 ?auto_63416 ) ( not ( = ?auto_63436 ?auto_63435 ) ) ( not ( = ?auto_63430 ?auto_63435 ) ) ( not ( = ?auto_63419 ?auto_63435 ) ) ( AVAILABLE ?auto_63435 ) ( SURFACE-AT ?auto_63434 ?auto_63416 ) ( ON ?auto_63434 ?auto_63424 ) ( CLEAR ?auto_63434 ) ( not ( = ?auto_63413 ?auto_63424 ) ) ( not ( = ?auto_63414 ?auto_63424 ) ) ( not ( = ?auto_63415 ?auto_63424 ) ) ( not ( = ?auto_63434 ?auto_63424 ) ) ( not ( = ?auto_63426 ?auto_63424 ) ) ( not ( = ?auto_63421 ?auto_63424 ) ) ( IS-CRATE ?auto_63421 ) ( not ( = ?auto_63413 ?auto_63425 ) ) ( not ( = ?auto_63414 ?auto_63425 ) ) ( not ( = ?auto_63415 ?auto_63425 ) ) ( not ( = ?auto_63434 ?auto_63425 ) ) ( not ( = ?auto_63426 ?auto_63425 ) ) ( not ( = ?auto_63421 ?auto_63425 ) ) ( not ( = ?auto_63424 ?auto_63425 ) ) ( not ( = ?auto_63431 ?auto_63433 ) ) ( not ( = ?auto_63440 ?auto_63431 ) ) ( not ( = ?auto_63423 ?auto_63431 ) ) ( not ( = ?auto_63416 ?auto_63431 ) ) ( HOIST-AT ?auto_63420 ?auto_63431 ) ( not ( = ?auto_63436 ?auto_63420 ) ) ( not ( = ?auto_63430 ?auto_63420 ) ) ( not ( = ?auto_63419 ?auto_63420 ) ) ( not ( = ?auto_63435 ?auto_63420 ) ) ( AVAILABLE ?auto_63420 ) ( SURFACE-AT ?auto_63421 ?auto_63431 ) ( ON ?auto_63421 ?auto_63437 ) ( CLEAR ?auto_63421 ) ( not ( = ?auto_63413 ?auto_63437 ) ) ( not ( = ?auto_63414 ?auto_63437 ) ) ( not ( = ?auto_63415 ?auto_63437 ) ) ( not ( = ?auto_63434 ?auto_63437 ) ) ( not ( = ?auto_63426 ?auto_63437 ) ) ( not ( = ?auto_63421 ?auto_63437 ) ) ( not ( = ?auto_63424 ?auto_63437 ) ) ( not ( = ?auto_63425 ?auto_63437 ) ) ( IS-CRATE ?auto_63425 ) ( not ( = ?auto_63413 ?auto_63432 ) ) ( not ( = ?auto_63414 ?auto_63432 ) ) ( not ( = ?auto_63415 ?auto_63432 ) ) ( not ( = ?auto_63434 ?auto_63432 ) ) ( not ( = ?auto_63426 ?auto_63432 ) ) ( not ( = ?auto_63421 ?auto_63432 ) ) ( not ( = ?auto_63424 ?auto_63432 ) ) ( not ( = ?auto_63425 ?auto_63432 ) ) ( not ( = ?auto_63437 ?auto_63432 ) ) ( not ( = ?auto_63418 ?auto_63433 ) ) ( not ( = ?auto_63440 ?auto_63418 ) ) ( not ( = ?auto_63423 ?auto_63418 ) ) ( not ( = ?auto_63416 ?auto_63418 ) ) ( not ( = ?auto_63431 ?auto_63418 ) ) ( HOIST-AT ?auto_63438 ?auto_63418 ) ( not ( = ?auto_63436 ?auto_63438 ) ) ( not ( = ?auto_63430 ?auto_63438 ) ) ( not ( = ?auto_63419 ?auto_63438 ) ) ( not ( = ?auto_63435 ?auto_63438 ) ) ( not ( = ?auto_63420 ?auto_63438 ) ) ( AVAILABLE ?auto_63438 ) ( SURFACE-AT ?auto_63425 ?auto_63418 ) ( ON ?auto_63425 ?auto_63428 ) ( CLEAR ?auto_63425 ) ( not ( = ?auto_63413 ?auto_63428 ) ) ( not ( = ?auto_63414 ?auto_63428 ) ) ( not ( = ?auto_63415 ?auto_63428 ) ) ( not ( = ?auto_63434 ?auto_63428 ) ) ( not ( = ?auto_63426 ?auto_63428 ) ) ( not ( = ?auto_63421 ?auto_63428 ) ) ( not ( = ?auto_63424 ?auto_63428 ) ) ( not ( = ?auto_63425 ?auto_63428 ) ) ( not ( = ?auto_63437 ?auto_63428 ) ) ( not ( = ?auto_63432 ?auto_63428 ) ) ( IS-CRATE ?auto_63432 ) ( not ( = ?auto_63413 ?auto_63441 ) ) ( not ( = ?auto_63414 ?auto_63441 ) ) ( not ( = ?auto_63415 ?auto_63441 ) ) ( not ( = ?auto_63434 ?auto_63441 ) ) ( not ( = ?auto_63426 ?auto_63441 ) ) ( not ( = ?auto_63421 ?auto_63441 ) ) ( not ( = ?auto_63424 ?auto_63441 ) ) ( not ( = ?auto_63425 ?auto_63441 ) ) ( not ( = ?auto_63437 ?auto_63441 ) ) ( not ( = ?auto_63432 ?auto_63441 ) ) ( not ( = ?auto_63428 ?auto_63441 ) ) ( not ( = ?auto_63417 ?auto_63433 ) ) ( not ( = ?auto_63440 ?auto_63417 ) ) ( not ( = ?auto_63423 ?auto_63417 ) ) ( not ( = ?auto_63416 ?auto_63417 ) ) ( not ( = ?auto_63431 ?auto_63417 ) ) ( not ( = ?auto_63418 ?auto_63417 ) ) ( HOIST-AT ?auto_63427 ?auto_63417 ) ( not ( = ?auto_63436 ?auto_63427 ) ) ( not ( = ?auto_63430 ?auto_63427 ) ) ( not ( = ?auto_63419 ?auto_63427 ) ) ( not ( = ?auto_63435 ?auto_63427 ) ) ( not ( = ?auto_63420 ?auto_63427 ) ) ( not ( = ?auto_63438 ?auto_63427 ) ) ( AVAILABLE ?auto_63427 ) ( SURFACE-AT ?auto_63432 ?auto_63417 ) ( ON ?auto_63432 ?auto_63422 ) ( CLEAR ?auto_63432 ) ( not ( = ?auto_63413 ?auto_63422 ) ) ( not ( = ?auto_63414 ?auto_63422 ) ) ( not ( = ?auto_63415 ?auto_63422 ) ) ( not ( = ?auto_63434 ?auto_63422 ) ) ( not ( = ?auto_63426 ?auto_63422 ) ) ( not ( = ?auto_63421 ?auto_63422 ) ) ( not ( = ?auto_63424 ?auto_63422 ) ) ( not ( = ?auto_63425 ?auto_63422 ) ) ( not ( = ?auto_63437 ?auto_63422 ) ) ( not ( = ?auto_63432 ?auto_63422 ) ) ( not ( = ?auto_63428 ?auto_63422 ) ) ( not ( = ?auto_63441 ?auto_63422 ) ) ( SURFACE-AT ?auto_63439 ?auto_63433 ) ( CLEAR ?auto_63439 ) ( IS-CRATE ?auto_63441 ) ( not ( = ?auto_63413 ?auto_63439 ) ) ( not ( = ?auto_63414 ?auto_63439 ) ) ( not ( = ?auto_63415 ?auto_63439 ) ) ( not ( = ?auto_63434 ?auto_63439 ) ) ( not ( = ?auto_63426 ?auto_63439 ) ) ( not ( = ?auto_63421 ?auto_63439 ) ) ( not ( = ?auto_63424 ?auto_63439 ) ) ( not ( = ?auto_63425 ?auto_63439 ) ) ( not ( = ?auto_63437 ?auto_63439 ) ) ( not ( = ?auto_63432 ?auto_63439 ) ) ( not ( = ?auto_63428 ?auto_63439 ) ) ( not ( = ?auto_63441 ?auto_63439 ) ) ( not ( = ?auto_63422 ?auto_63439 ) ) ( AVAILABLE ?auto_63436 ) ( TRUCK-AT ?auto_63429 ?auto_63423 ) ( LIFTING ?auto_63419 ?auto_63441 ) )
    :subtasks
    ( ( !LOAD ?auto_63419 ?auto_63441 ?auto_63429 ?auto_63423 )
      ( MAKE-ON ?auto_63413 ?auto_63414 )
      ( MAKE-ON-VERIFY ?auto_63413 ?auto_63414 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63442 - SURFACE
      ?auto_63443 - SURFACE
    )
    :vars
    (
      ?auto_63462 - HOIST
      ?auto_63459 - PLACE
      ?auto_63454 - PLACE
      ?auto_63464 - HOIST
      ?auto_63452 - SURFACE
      ?auto_63460 - SURFACE
      ?auto_63449 - PLACE
      ?auto_63470 - HOIST
      ?auto_63469 - SURFACE
      ?auto_63445 - SURFACE
      ?auto_63468 - PLACE
      ?auto_63461 - HOIST
      ?auto_63447 - SURFACE
      ?auto_63466 - SURFACE
      ?auto_63457 - PLACE
      ?auto_63467 - HOIST
      ?auto_63463 - SURFACE
      ?auto_63458 - SURFACE
      ?auto_63444 - PLACE
      ?auto_63456 - HOIST
      ?auto_63446 - SURFACE
      ?auto_63455 - SURFACE
      ?auto_63451 - PLACE
      ?auto_63448 - HOIST
      ?auto_63453 - SURFACE
      ?auto_63450 - SURFACE
      ?auto_63465 - TRUCK
      ?auto_63471 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63462 ?auto_63459 ) ( IS-CRATE ?auto_63442 ) ( not ( = ?auto_63442 ?auto_63443 ) ) ( not ( = ?auto_63454 ?auto_63459 ) ) ( HOIST-AT ?auto_63464 ?auto_63454 ) ( not ( = ?auto_63462 ?auto_63464 ) ) ( AVAILABLE ?auto_63464 ) ( SURFACE-AT ?auto_63442 ?auto_63454 ) ( ON ?auto_63442 ?auto_63452 ) ( CLEAR ?auto_63442 ) ( not ( = ?auto_63442 ?auto_63452 ) ) ( not ( = ?auto_63443 ?auto_63452 ) ) ( IS-CRATE ?auto_63443 ) ( not ( = ?auto_63442 ?auto_63460 ) ) ( not ( = ?auto_63443 ?auto_63460 ) ) ( not ( = ?auto_63452 ?auto_63460 ) ) ( not ( = ?auto_63449 ?auto_63459 ) ) ( not ( = ?auto_63454 ?auto_63449 ) ) ( HOIST-AT ?auto_63470 ?auto_63449 ) ( not ( = ?auto_63462 ?auto_63470 ) ) ( not ( = ?auto_63464 ?auto_63470 ) ) ( SURFACE-AT ?auto_63443 ?auto_63449 ) ( ON ?auto_63443 ?auto_63469 ) ( CLEAR ?auto_63443 ) ( not ( = ?auto_63442 ?auto_63469 ) ) ( not ( = ?auto_63443 ?auto_63469 ) ) ( not ( = ?auto_63452 ?auto_63469 ) ) ( not ( = ?auto_63460 ?auto_63469 ) ) ( IS-CRATE ?auto_63460 ) ( not ( = ?auto_63442 ?auto_63445 ) ) ( not ( = ?auto_63443 ?auto_63445 ) ) ( not ( = ?auto_63452 ?auto_63445 ) ) ( not ( = ?auto_63460 ?auto_63445 ) ) ( not ( = ?auto_63469 ?auto_63445 ) ) ( not ( = ?auto_63468 ?auto_63459 ) ) ( not ( = ?auto_63454 ?auto_63468 ) ) ( not ( = ?auto_63449 ?auto_63468 ) ) ( HOIST-AT ?auto_63461 ?auto_63468 ) ( not ( = ?auto_63462 ?auto_63461 ) ) ( not ( = ?auto_63464 ?auto_63461 ) ) ( not ( = ?auto_63470 ?auto_63461 ) ) ( AVAILABLE ?auto_63461 ) ( SURFACE-AT ?auto_63460 ?auto_63468 ) ( ON ?auto_63460 ?auto_63447 ) ( CLEAR ?auto_63460 ) ( not ( = ?auto_63442 ?auto_63447 ) ) ( not ( = ?auto_63443 ?auto_63447 ) ) ( not ( = ?auto_63452 ?auto_63447 ) ) ( not ( = ?auto_63460 ?auto_63447 ) ) ( not ( = ?auto_63469 ?auto_63447 ) ) ( not ( = ?auto_63445 ?auto_63447 ) ) ( IS-CRATE ?auto_63445 ) ( not ( = ?auto_63442 ?auto_63466 ) ) ( not ( = ?auto_63443 ?auto_63466 ) ) ( not ( = ?auto_63452 ?auto_63466 ) ) ( not ( = ?auto_63460 ?auto_63466 ) ) ( not ( = ?auto_63469 ?auto_63466 ) ) ( not ( = ?auto_63445 ?auto_63466 ) ) ( not ( = ?auto_63447 ?auto_63466 ) ) ( not ( = ?auto_63457 ?auto_63459 ) ) ( not ( = ?auto_63454 ?auto_63457 ) ) ( not ( = ?auto_63449 ?auto_63457 ) ) ( not ( = ?auto_63468 ?auto_63457 ) ) ( HOIST-AT ?auto_63467 ?auto_63457 ) ( not ( = ?auto_63462 ?auto_63467 ) ) ( not ( = ?auto_63464 ?auto_63467 ) ) ( not ( = ?auto_63470 ?auto_63467 ) ) ( not ( = ?auto_63461 ?auto_63467 ) ) ( AVAILABLE ?auto_63467 ) ( SURFACE-AT ?auto_63445 ?auto_63457 ) ( ON ?auto_63445 ?auto_63463 ) ( CLEAR ?auto_63445 ) ( not ( = ?auto_63442 ?auto_63463 ) ) ( not ( = ?auto_63443 ?auto_63463 ) ) ( not ( = ?auto_63452 ?auto_63463 ) ) ( not ( = ?auto_63460 ?auto_63463 ) ) ( not ( = ?auto_63469 ?auto_63463 ) ) ( not ( = ?auto_63445 ?auto_63463 ) ) ( not ( = ?auto_63447 ?auto_63463 ) ) ( not ( = ?auto_63466 ?auto_63463 ) ) ( IS-CRATE ?auto_63466 ) ( not ( = ?auto_63442 ?auto_63458 ) ) ( not ( = ?auto_63443 ?auto_63458 ) ) ( not ( = ?auto_63452 ?auto_63458 ) ) ( not ( = ?auto_63460 ?auto_63458 ) ) ( not ( = ?auto_63469 ?auto_63458 ) ) ( not ( = ?auto_63445 ?auto_63458 ) ) ( not ( = ?auto_63447 ?auto_63458 ) ) ( not ( = ?auto_63466 ?auto_63458 ) ) ( not ( = ?auto_63463 ?auto_63458 ) ) ( not ( = ?auto_63444 ?auto_63459 ) ) ( not ( = ?auto_63454 ?auto_63444 ) ) ( not ( = ?auto_63449 ?auto_63444 ) ) ( not ( = ?auto_63468 ?auto_63444 ) ) ( not ( = ?auto_63457 ?auto_63444 ) ) ( HOIST-AT ?auto_63456 ?auto_63444 ) ( not ( = ?auto_63462 ?auto_63456 ) ) ( not ( = ?auto_63464 ?auto_63456 ) ) ( not ( = ?auto_63470 ?auto_63456 ) ) ( not ( = ?auto_63461 ?auto_63456 ) ) ( not ( = ?auto_63467 ?auto_63456 ) ) ( AVAILABLE ?auto_63456 ) ( SURFACE-AT ?auto_63466 ?auto_63444 ) ( ON ?auto_63466 ?auto_63446 ) ( CLEAR ?auto_63466 ) ( not ( = ?auto_63442 ?auto_63446 ) ) ( not ( = ?auto_63443 ?auto_63446 ) ) ( not ( = ?auto_63452 ?auto_63446 ) ) ( not ( = ?auto_63460 ?auto_63446 ) ) ( not ( = ?auto_63469 ?auto_63446 ) ) ( not ( = ?auto_63445 ?auto_63446 ) ) ( not ( = ?auto_63447 ?auto_63446 ) ) ( not ( = ?auto_63466 ?auto_63446 ) ) ( not ( = ?auto_63463 ?auto_63446 ) ) ( not ( = ?auto_63458 ?auto_63446 ) ) ( IS-CRATE ?auto_63458 ) ( not ( = ?auto_63442 ?auto_63455 ) ) ( not ( = ?auto_63443 ?auto_63455 ) ) ( not ( = ?auto_63452 ?auto_63455 ) ) ( not ( = ?auto_63460 ?auto_63455 ) ) ( not ( = ?auto_63469 ?auto_63455 ) ) ( not ( = ?auto_63445 ?auto_63455 ) ) ( not ( = ?auto_63447 ?auto_63455 ) ) ( not ( = ?auto_63466 ?auto_63455 ) ) ( not ( = ?auto_63463 ?auto_63455 ) ) ( not ( = ?auto_63458 ?auto_63455 ) ) ( not ( = ?auto_63446 ?auto_63455 ) ) ( not ( = ?auto_63451 ?auto_63459 ) ) ( not ( = ?auto_63454 ?auto_63451 ) ) ( not ( = ?auto_63449 ?auto_63451 ) ) ( not ( = ?auto_63468 ?auto_63451 ) ) ( not ( = ?auto_63457 ?auto_63451 ) ) ( not ( = ?auto_63444 ?auto_63451 ) ) ( HOIST-AT ?auto_63448 ?auto_63451 ) ( not ( = ?auto_63462 ?auto_63448 ) ) ( not ( = ?auto_63464 ?auto_63448 ) ) ( not ( = ?auto_63470 ?auto_63448 ) ) ( not ( = ?auto_63461 ?auto_63448 ) ) ( not ( = ?auto_63467 ?auto_63448 ) ) ( not ( = ?auto_63456 ?auto_63448 ) ) ( AVAILABLE ?auto_63448 ) ( SURFACE-AT ?auto_63458 ?auto_63451 ) ( ON ?auto_63458 ?auto_63453 ) ( CLEAR ?auto_63458 ) ( not ( = ?auto_63442 ?auto_63453 ) ) ( not ( = ?auto_63443 ?auto_63453 ) ) ( not ( = ?auto_63452 ?auto_63453 ) ) ( not ( = ?auto_63460 ?auto_63453 ) ) ( not ( = ?auto_63469 ?auto_63453 ) ) ( not ( = ?auto_63445 ?auto_63453 ) ) ( not ( = ?auto_63447 ?auto_63453 ) ) ( not ( = ?auto_63466 ?auto_63453 ) ) ( not ( = ?auto_63463 ?auto_63453 ) ) ( not ( = ?auto_63458 ?auto_63453 ) ) ( not ( = ?auto_63446 ?auto_63453 ) ) ( not ( = ?auto_63455 ?auto_63453 ) ) ( SURFACE-AT ?auto_63450 ?auto_63459 ) ( CLEAR ?auto_63450 ) ( IS-CRATE ?auto_63455 ) ( not ( = ?auto_63442 ?auto_63450 ) ) ( not ( = ?auto_63443 ?auto_63450 ) ) ( not ( = ?auto_63452 ?auto_63450 ) ) ( not ( = ?auto_63460 ?auto_63450 ) ) ( not ( = ?auto_63469 ?auto_63450 ) ) ( not ( = ?auto_63445 ?auto_63450 ) ) ( not ( = ?auto_63447 ?auto_63450 ) ) ( not ( = ?auto_63466 ?auto_63450 ) ) ( not ( = ?auto_63463 ?auto_63450 ) ) ( not ( = ?auto_63458 ?auto_63450 ) ) ( not ( = ?auto_63446 ?auto_63450 ) ) ( not ( = ?auto_63455 ?auto_63450 ) ) ( not ( = ?auto_63453 ?auto_63450 ) ) ( AVAILABLE ?auto_63462 ) ( TRUCK-AT ?auto_63465 ?auto_63449 ) ( AVAILABLE ?auto_63470 ) ( SURFACE-AT ?auto_63455 ?auto_63449 ) ( ON ?auto_63455 ?auto_63471 ) ( CLEAR ?auto_63455 ) ( not ( = ?auto_63442 ?auto_63471 ) ) ( not ( = ?auto_63443 ?auto_63471 ) ) ( not ( = ?auto_63452 ?auto_63471 ) ) ( not ( = ?auto_63460 ?auto_63471 ) ) ( not ( = ?auto_63469 ?auto_63471 ) ) ( not ( = ?auto_63445 ?auto_63471 ) ) ( not ( = ?auto_63447 ?auto_63471 ) ) ( not ( = ?auto_63466 ?auto_63471 ) ) ( not ( = ?auto_63463 ?auto_63471 ) ) ( not ( = ?auto_63458 ?auto_63471 ) ) ( not ( = ?auto_63446 ?auto_63471 ) ) ( not ( = ?auto_63455 ?auto_63471 ) ) ( not ( = ?auto_63453 ?auto_63471 ) ) ( not ( = ?auto_63450 ?auto_63471 ) ) )
    :subtasks
    ( ( !LIFT ?auto_63470 ?auto_63455 ?auto_63471 ?auto_63449 )
      ( MAKE-ON ?auto_63442 ?auto_63443 )
      ( MAKE-ON-VERIFY ?auto_63442 ?auto_63443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63472 - SURFACE
      ?auto_63473 - SURFACE
    )
    :vars
    (
      ?auto_63483 - HOIST
      ?auto_63488 - PLACE
      ?auto_63478 - PLACE
      ?auto_63485 - HOIST
      ?auto_63495 - SURFACE
      ?auto_63481 - SURFACE
      ?auto_63498 - PLACE
      ?auto_63480 - HOIST
      ?auto_63475 - SURFACE
      ?auto_63501 - SURFACE
      ?auto_63476 - PLACE
      ?auto_63482 - HOIST
      ?auto_63493 - SURFACE
      ?auto_63487 - SURFACE
      ?auto_63499 - PLACE
      ?auto_63479 - HOIST
      ?auto_63484 - SURFACE
      ?auto_63477 - SURFACE
      ?auto_63496 - PLACE
      ?auto_63492 - HOIST
      ?auto_63490 - SURFACE
      ?auto_63474 - SURFACE
      ?auto_63497 - PLACE
      ?auto_63500 - HOIST
      ?auto_63491 - SURFACE
      ?auto_63489 - SURFACE
      ?auto_63494 - SURFACE
      ?auto_63486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63483 ?auto_63488 ) ( IS-CRATE ?auto_63472 ) ( not ( = ?auto_63472 ?auto_63473 ) ) ( not ( = ?auto_63478 ?auto_63488 ) ) ( HOIST-AT ?auto_63485 ?auto_63478 ) ( not ( = ?auto_63483 ?auto_63485 ) ) ( AVAILABLE ?auto_63485 ) ( SURFACE-AT ?auto_63472 ?auto_63478 ) ( ON ?auto_63472 ?auto_63495 ) ( CLEAR ?auto_63472 ) ( not ( = ?auto_63472 ?auto_63495 ) ) ( not ( = ?auto_63473 ?auto_63495 ) ) ( IS-CRATE ?auto_63473 ) ( not ( = ?auto_63472 ?auto_63481 ) ) ( not ( = ?auto_63473 ?auto_63481 ) ) ( not ( = ?auto_63495 ?auto_63481 ) ) ( not ( = ?auto_63498 ?auto_63488 ) ) ( not ( = ?auto_63478 ?auto_63498 ) ) ( HOIST-AT ?auto_63480 ?auto_63498 ) ( not ( = ?auto_63483 ?auto_63480 ) ) ( not ( = ?auto_63485 ?auto_63480 ) ) ( SURFACE-AT ?auto_63473 ?auto_63498 ) ( ON ?auto_63473 ?auto_63475 ) ( CLEAR ?auto_63473 ) ( not ( = ?auto_63472 ?auto_63475 ) ) ( not ( = ?auto_63473 ?auto_63475 ) ) ( not ( = ?auto_63495 ?auto_63475 ) ) ( not ( = ?auto_63481 ?auto_63475 ) ) ( IS-CRATE ?auto_63481 ) ( not ( = ?auto_63472 ?auto_63501 ) ) ( not ( = ?auto_63473 ?auto_63501 ) ) ( not ( = ?auto_63495 ?auto_63501 ) ) ( not ( = ?auto_63481 ?auto_63501 ) ) ( not ( = ?auto_63475 ?auto_63501 ) ) ( not ( = ?auto_63476 ?auto_63488 ) ) ( not ( = ?auto_63478 ?auto_63476 ) ) ( not ( = ?auto_63498 ?auto_63476 ) ) ( HOIST-AT ?auto_63482 ?auto_63476 ) ( not ( = ?auto_63483 ?auto_63482 ) ) ( not ( = ?auto_63485 ?auto_63482 ) ) ( not ( = ?auto_63480 ?auto_63482 ) ) ( AVAILABLE ?auto_63482 ) ( SURFACE-AT ?auto_63481 ?auto_63476 ) ( ON ?auto_63481 ?auto_63493 ) ( CLEAR ?auto_63481 ) ( not ( = ?auto_63472 ?auto_63493 ) ) ( not ( = ?auto_63473 ?auto_63493 ) ) ( not ( = ?auto_63495 ?auto_63493 ) ) ( not ( = ?auto_63481 ?auto_63493 ) ) ( not ( = ?auto_63475 ?auto_63493 ) ) ( not ( = ?auto_63501 ?auto_63493 ) ) ( IS-CRATE ?auto_63501 ) ( not ( = ?auto_63472 ?auto_63487 ) ) ( not ( = ?auto_63473 ?auto_63487 ) ) ( not ( = ?auto_63495 ?auto_63487 ) ) ( not ( = ?auto_63481 ?auto_63487 ) ) ( not ( = ?auto_63475 ?auto_63487 ) ) ( not ( = ?auto_63501 ?auto_63487 ) ) ( not ( = ?auto_63493 ?auto_63487 ) ) ( not ( = ?auto_63499 ?auto_63488 ) ) ( not ( = ?auto_63478 ?auto_63499 ) ) ( not ( = ?auto_63498 ?auto_63499 ) ) ( not ( = ?auto_63476 ?auto_63499 ) ) ( HOIST-AT ?auto_63479 ?auto_63499 ) ( not ( = ?auto_63483 ?auto_63479 ) ) ( not ( = ?auto_63485 ?auto_63479 ) ) ( not ( = ?auto_63480 ?auto_63479 ) ) ( not ( = ?auto_63482 ?auto_63479 ) ) ( AVAILABLE ?auto_63479 ) ( SURFACE-AT ?auto_63501 ?auto_63499 ) ( ON ?auto_63501 ?auto_63484 ) ( CLEAR ?auto_63501 ) ( not ( = ?auto_63472 ?auto_63484 ) ) ( not ( = ?auto_63473 ?auto_63484 ) ) ( not ( = ?auto_63495 ?auto_63484 ) ) ( not ( = ?auto_63481 ?auto_63484 ) ) ( not ( = ?auto_63475 ?auto_63484 ) ) ( not ( = ?auto_63501 ?auto_63484 ) ) ( not ( = ?auto_63493 ?auto_63484 ) ) ( not ( = ?auto_63487 ?auto_63484 ) ) ( IS-CRATE ?auto_63487 ) ( not ( = ?auto_63472 ?auto_63477 ) ) ( not ( = ?auto_63473 ?auto_63477 ) ) ( not ( = ?auto_63495 ?auto_63477 ) ) ( not ( = ?auto_63481 ?auto_63477 ) ) ( not ( = ?auto_63475 ?auto_63477 ) ) ( not ( = ?auto_63501 ?auto_63477 ) ) ( not ( = ?auto_63493 ?auto_63477 ) ) ( not ( = ?auto_63487 ?auto_63477 ) ) ( not ( = ?auto_63484 ?auto_63477 ) ) ( not ( = ?auto_63496 ?auto_63488 ) ) ( not ( = ?auto_63478 ?auto_63496 ) ) ( not ( = ?auto_63498 ?auto_63496 ) ) ( not ( = ?auto_63476 ?auto_63496 ) ) ( not ( = ?auto_63499 ?auto_63496 ) ) ( HOIST-AT ?auto_63492 ?auto_63496 ) ( not ( = ?auto_63483 ?auto_63492 ) ) ( not ( = ?auto_63485 ?auto_63492 ) ) ( not ( = ?auto_63480 ?auto_63492 ) ) ( not ( = ?auto_63482 ?auto_63492 ) ) ( not ( = ?auto_63479 ?auto_63492 ) ) ( AVAILABLE ?auto_63492 ) ( SURFACE-AT ?auto_63487 ?auto_63496 ) ( ON ?auto_63487 ?auto_63490 ) ( CLEAR ?auto_63487 ) ( not ( = ?auto_63472 ?auto_63490 ) ) ( not ( = ?auto_63473 ?auto_63490 ) ) ( not ( = ?auto_63495 ?auto_63490 ) ) ( not ( = ?auto_63481 ?auto_63490 ) ) ( not ( = ?auto_63475 ?auto_63490 ) ) ( not ( = ?auto_63501 ?auto_63490 ) ) ( not ( = ?auto_63493 ?auto_63490 ) ) ( not ( = ?auto_63487 ?auto_63490 ) ) ( not ( = ?auto_63484 ?auto_63490 ) ) ( not ( = ?auto_63477 ?auto_63490 ) ) ( IS-CRATE ?auto_63477 ) ( not ( = ?auto_63472 ?auto_63474 ) ) ( not ( = ?auto_63473 ?auto_63474 ) ) ( not ( = ?auto_63495 ?auto_63474 ) ) ( not ( = ?auto_63481 ?auto_63474 ) ) ( not ( = ?auto_63475 ?auto_63474 ) ) ( not ( = ?auto_63501 ?auto_63474 ) ) ( not ( = ?auto_63493 ?auto_63474 ) ) ( not ( = ?auto_63487 ?auto_63474 ) ) ( not ( = ?auto_63484 ?auto_63474 ) ) ( not ( = ?auto_63477 ?auto_63474 ) ) ( not ( = ?auto_63490 ?auto_63474 ) ) ( not ( = ?auto_63497 ?auto_63488 ) ) ( not ( = ?auto_63478 ?auto_63497 ) ) ( not ( = ?auto_63498 ?auto_63497 ) ) ( not ( = ?auto_63476 ?auto_63497 ) ) ( not ( = ?auto_63499 ?auto_63497 ) ) ( not ( = ?auto_63496 ?auto_63497 ) ) ( HOIST-AT ?auto_63500 ?auto_63497 ) ( not ( = ?auto_63483 ?auto_63500 ) ) ( not ( = ?auto_63485 ?auto_63500 ) ) ( not ( = ?auto_63480 ?auto_63500 ) ) ( not ( = ?auto_63482 ?auto_63500 ) ) ( not ( = ?auto_63479 ?auto_63500 ) ) ( not ( = ?auto_63492 ?auto_63500 ) ) ( AVAILABLE ?auto_63500 ) ( SURFACE-AT ?auto_63477 ?auto_63497 ) ( ON ?auto_63477 ?auto_63491 ) ( CLEAR ?auto_63477 ) ( not ( = ?auto_63472 ?auto_63491 ) ) ( not ( = ?auto_63473 ?auto_63491 ) ) ( not ( = ?auto_63495 ?auto_63491 ) ) ( not ( = ?auto_63481 ?auto_63491 ) ) ( not ( = ?auto_63475 ?auto_63491 ) ) ( not ( = ?auto_63501 ?auto_63491 ) ) ( not ( = ?auto_63493 ?auto_63491 ) ) ( not ( = ?auto_63487 ?auto_63491 ) ) ( not ( = ?auto_63484 ?auto_63491 ) ) ( not ( = ?auto_63477 ?auto_63491 ) ) ( not ( = ?auto_63490 ?auto_63491 ) ) ( not ( = ?auto_63474 ?auto_63491 ) ) ( SURFACE-AT ?auto_63489 ?auto_63488 ) ( CLEAR ?auto_63489 ) ( IS-CRATE ?auto_63474 ) ( not ( = ?auto_63472 ?auto_63489 ) ) ( not ( = ?auto_63473 ?auto_63489 ) ) ( not ( = ?auto_63495 ?auto_63489 ) ) ( not ( = ?auto_63481 ?auto_63489 ) ) ( not ( = ?auto_63475 ?auto_63489 ) ) ( not ( = ?auto_63501 ?auto_63489 ) ) ( not ( = ?auto_63493 ?auto_63489 ) ) ( not ( = ?auto_63487 ?auto_63489 ) ) ( not ( = ?auto_63484 ?auto_63489 ) ) ( not ( = ?auto_63477 ?auto_63489 ) ) ( not ( = ?auto_63490 ?auto_63489 ) ) ( not ( = ?auto_63474 ?auto_63489 ) ) ( not ( = ?auto_63491 ?auto_63489 ) ) ( AVAILABLE ?auto_63483 ) ( AVAILABLE ?auto_63480 ) ( SURFACE-AT ?auto_63474 ?auto_63498 ) ( ON ?auto_63474 ?auto_63494 ) ( CLEAR ?auto_63474 ) ( not ( = ?auto_63472 ?auto_63494 ) ) ( not ( = ?auto_63473 ?auto_63494 ) ) ( not ( = ?auto_63495 ?auto_63494 ) ) ( not ( = ?auto_63481 ?auto_63494 ) ) ( not ( = ?auto_63475 ?auto_63494 ) ) ( not ( = ?auto_63501 ?auto_63494 ) ) ( not ( = ?auto_63493 ?auto_63494 ) ) ( not ( = ?auto_63487 ?auto_63494 ) ) ( not ( = ?auto_63484 ?auto_63494 ) ) ( not ( = ?auto_63477 ?auto_63494 ) ) ( not ( = ?auto_63490 ?auto_63494 ) ) ( not ( = ?auto_63474 ?auto_63494 ) ) ( not ( = ?auto_63491 ?auto_63494 ) ) ( not ( = ?auto_63489 ?auto_63494 ) ) ( TRUCK-AT ?auto_63486 ?auto_63488 ) )
    :subtasks
    ( ( !DRIVE ?auto_63486 ?auto_63488 ?auto_63498 )
      ( MAKE-ON ?auto_63472 ?auto_63473 )
      ( MAKE-ON-VERIFY ?auto_63472 ?auto_63473 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63502 - SURFACE
      ?auto_63503 - SURFACE
    )
    :vars
    (
      ?auto_63508 - HOIST
      ?auto_63531 - PLACE
      ?auto_63510 - PLACE
      ?auto_63523 - HOIST
      ?auto_63520 - SURFACE
      ?auto_63526 - SURFACE
      ?auto_63506 - PLACE
      ?auto_63514 - HOIST
      ?auto_63525 - SURFACE
      ?auto_63529 - SURFACE
      ?auto_63513 - PLACE
      ?auto_63524 - HOIST
      ?auto_63518 - SURFACE
      ?auto_63511 - SURFACE
      ?auto_63507 - PLACE
      ?auto_63512 - HOIST
      ?auto_63528 - SURFACE
      ?auto_63515 - SURFACE
      ?auto_63521 - PLACE
      ?auto_63517 - HOIST
      ?auto_63509 - SURFACE
      ?auto_63530 - SURFACE
      ?auto_63505 - PLACE
      ?auto_63504 - HOIST
      ?auto_63516 - SURFACE
      ?auto_63522 - SURFACE
      ?auto_63519 - SURFACE
      ?auto_63527 - TRUCK
      ?auto_63532 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63508 ?auto_63531 ) ( IS-CRATE ?auto_63502 ) ( not ( = ?auto_63502 ?auto_63503 ) ) ( not ( = ?auto_63510 ?auto_63531 ) ) ( HOIST-AT ?auto_63523 ?auto_63510 ) ( not ( = ?auto_63508 ?auto_63523 ) ) ( AVAILABLE ?auto_63523 ) ( SURFACE-AT ?auto_63502 ?auto_63510 ) ( ON ?auto_63502 ?auto_63520 ) ( CLEAR ?auto_63502 ) ( not ( = ?auto_63502 ?auto_63520 ) ) ( not ( = ?auto_63503 ?auto_63520 ) ) ( IS-CRATE ?auto_63503 ) ( not ( = ?auto_63502 ?auto_63526 ) ) ( not ( = ?auto_63503 ?auto_63526 ) ) ( not ( = ?auto_63520 ?auto_63526 ) ) ( not ( = ?auto_63506 ?auto_63531 ) ) ( not ( = ?auto_63510 ?auto_63506 ) ) ( HOIST-AT ?auto_63514 ?auto_63506 ) ( not ( = ?auto_63508 ?auto_63514 ) ) ( not ( = ?auto_63523 ?auto_63514 ) ) ( SURFACE-AT ?auto_63503 ?auto_63506 ) ( ON ?auto_63503 ?auto_63525 ) ( CLEAR ?auto_63503 ) ( not ( = ?auto_63502 ?auto_63525 ) ) ( not ( = ?auto_63503 ?auto_63525 ) ) ( not ( = ?auto_63520 ?auto_63525 ) ) ( not ( = ?auto_63526 ?auto_63525 ) ) ( IS-CRATE ?auto_63526 ) ( not ( = ?auto_63502 ?auto_63529 ) ) ( not ( = ?auto_63503 ?auto_63529 ) ) ( not ( = ?auto_63520 ?auto_63529 ) ) ( not ( = ?auto_63526 ?auto_63529 ) ) ( not ( = ?auto_63525 ?auto_63529 ) ) ( not ( = ?auto_63513 ?auto_63531 ) ) ( not ( = ?auto_63510 ?auto_63513 ) ) ( not ( = ?auto_63506 ?auto_63513 ) ) ( HOIST-AT ?auto_63524 ?auto_63513 ) ( not ( = ?auto_63508 ?auto_63524 ) ) ( not ( = ?auto_63523 ?auto_63524 ) ) ( not ( = ?auto_63514 ?auto_63524 ) ) ( AVAILABLE ?auto_63524 ) ( SURFACE-AT ?auto_63526 ?auto_63513 ) ( ON ?auto_63526 ?auto_63518 ) ( CLEAR ?auto_63526 ) ( not ( = ?auto_63502 ?auto_63518 ) ) ( not ( = ?auto_63503 ?auto_63518 ) ) ( not ( = ?auto_63520 ?auto_63518 ) ) ( not ( = ?auto_63526 ?auto_63518 ) ) ( not ( = ?auto_63525 ?auto_63518 ) ) ( not ( = ?auto_63529 ?auto_63518 ) ) ( IS-CRATE ?auto_63529 ) ( not ( = ?auto_63502 ?auto_63511 ) ) ( not ( = ?auto_63503 ?auto_63511 ) ) ( not ( = ?auto_63520 ?auto_63511 ) ) ( not ( = ?auto_63526 ?auto_63511 ) ) ( not ( = ?auto_63525 ?auto_63511 ) ) ( not ( = ?auto_63529 ?auto_63511 ) ) ( not ( = ?auto_63518 ?auto_63511 ) ) ( not ( = ?auto_63507 ?auto_63531 ) ) ( not ( = ?auto_63510 ?auto_63507 ) ) ( not ( = ?auto_63506 ?auto_63507 ) ) ( not ( = ?auto_63513 ?auto_63507 ) ) ( HOIST-AT ?auto_63512 ?auto_63507 ) ( not ( = ?auto_63508 ?auto_63512 ) ) ( not ( = ?auto_63523 ?auto_63512 ) ) ( not ( = ?auto_63514 ?auto_63512 ) ) ( not ( = ?auto_63524 ?auto_63512 ) ) ( AVAILABLE ?auto_63512 ) ( SURFACE-AT ?auto_63529 ?auto_63507 ) ( ON ?auto_63529 ?auto_63528 ) ( CLEAR ?auto_63529 ) ( not ( = ?auto_63502 ?auto_63528 ) ) ( not ( = ?auto_63503 ?auto_63528 ) ) ( not ( = ?auto_63520 ?auto_63528 ) ) ( not ( = ?auto_63526 ?auto_63528 ) ) ( not ( = ?auto_63525 ?auto_63528 ) ) ( not ( = ?auto_63529 ?auto_63528 ) ) ( not ( = ?auto_63518 ?auto_63528 ) ) ( not ( = ?auto_63511 ?auto_63528 ) ) ( IS-CRATE ?auto_63511 ) ( not ( = ?auto_63502 ?auto_63515 ) ) ( not ( = ?auto_63503 ?auto_63515 ) ) ( not ( = ?auto_63520 ?auto_63515 ) ) ( not ( = ?auto_63526 ?auto_63515 ) ) ( not ( = ?auto_63525 ?auto_63515 ) ) ( not ( = ?auto_63529 ?auto_63515 ) ) ( not ( = ?auto_63518 ?auto_63515 ) ) ( not ( = ?auto_63511 ?auto_63515 ) ) ( not ( = ?auto_63528 ?auto_63515 ) ) ( not ( = ?auto_63521 ?auto_63531 ) ) ( not ( = ?auto_63510 ?auto_63521 ) ) ( not ( = ?auto_63506 ?auto_63521 ) ) ( not ( = ?auto_63513 ?auto_63521 ) ) ( not ( = ?auto_63507 ?auto_63521 ) ) ( HOIST-AT ?auto_63517 ?auto_63521 ) ( not ( = ?auto_63508 ?auto_63517 ) ) ( not ( = ?auto_63523 ?auto_63517 ) ) ( not ( = ?auto_63514 ?auto_63517 ) ) ( not ( = ?auto_63524 ?auto_63517 ) ) ( not ( = ?auto_63512 ?auto_63517 ) ) ( AVAILABLE ?auto_63517 ) ( SURFACE-AT ?auto_63511 ?auto_63521 ) ( ON ?auto_63511 ?auto_63509 ) ( CLEAR ?auto_63511 ) ( not ( = ?auto_63502 ?auto_63509 ) ) ( not ( = ?auto_63503 ?auto_63509 ) ) ( not ( = ?auto_63520 ?auto_63509 ) ) ( not ( = ?auto_63526 ?auto_63509 ) ) ( not ( = ?auto_63525 ?auto_63509 ) ) ( not ( = ?auto_63529 ?auto_63509 ) ) ( not ( = ?auto_63518 ?auto_63509 ) ) ( not ( = ?auto_63511 ?auto_63509 ) ) ( not ( = ?auto_63528 ?auto_63509 ) ) ( not ( = ?auto_63515 ?auto_63509 ) ) ( IS-CRATE ?auto_63515 ) ( not ( = ?auto_63502 ?auto_63530 ) ) ( not ( = ?auto_63503 ?auto_63530 ) ) ( not ( = ?auto_63520 ?auto_63530 ) ) ( not ( = ?auto_63526 ?auto_63530 ) ) ( not ( = ?auto_63525 ?auto_63530 ) ) ( not ( = ?auto_63529 ?auto_63530 ) ) ( not ( = ?auto_63518 ?auto_63530 ) ) ( not ( = ?auto_63511 ?auto_63530 ) ) ( not ( = ?auto_63528 ?auto_63530 ) ) ( not ( = ?auto_63515 ?auto_63530 ) ) ( not ( = ?auto_63509 ?auto_63530 ) ) ( not ( = ?auto_63505 ?auto_63531 ) ) ( not ( = ?auto_63510 ?auto_63505 ) ) ( not ( = ?auto_63506 ?auto_63505 ) ) ( not ( = ?auto_63513 ?auto_63505 ) ) ( not ( = ?auto_63507 ?auto_63505 ) ) ( not ( = ?auto_63521 ?auto_63505 ) ) ( HOIST-AT ?auto_63504 ?auto_63505 ) ( not ( = ?auto_63508 ?auto_63504 ) ) ( not ( = ?auto_63523 ?auto_63504 ) ) ( not ( = ?auto_63514 ?auto_63504 ) ) ( not ( = ?auto_63524 ?auto_63504 ) ) ( not ( = ?auto_63512 ?auto_63504 ) ) ( not ( = ?auto_63517 ?auto_63504 ) ) ( AVAILABLE ?auto_63504 ) ( SURFACE-AT ?auto_63515 ?auto_63505 ) ( ON ?auto_63515 ?auto_63516 ) ( CLEAR ?auto_63515 ) ( not ( = ?auto_63502 ?auto_63516 ) ) ( not ( = ?auto_63503 ?auto_63516 ) ) ( not ( = ?auto_63520 ?auto_63516 ) ) ( not ( = ?auto_63526 ?auto_63516 ) ) ( not ( = ?auto_63525 ?auto_63516 ) ) ( not ( = ?auto_63529 ?auto_63516 ) ) ( not ( = ?auto_63518 ?auto_63516 ) ) ( not ( = ?auto_63511 ?auto_63516 ) ) ( not ( = ?auto_63528 ?auto_63516 ) ) ( not ( = ?auto_63515 ?auto_63516 ) ) ( not ( = ?auto_63509 ?auto_63516 ) ) ( not ( = ?auto_63530 ?auto_63516 ) ) ( IS-CRATE ?auto_63530 ) ( not ( = ?auto_63502 ?auto_63522 ) ) ( not ( = ?auto_63503 ?auto_63522 ) ) ( not ( = ?auto_63520 ?auto_63522 ) ) ( not ( = ?auto_63526 ?auto_63522 ) ) ( not ( = ?auto_63525 ?auto_63522 ) ) ( not ( = ?auto_63529 ?auto_63522 ) ) ( not ( = ?auto_63518 ?auto_63522 ) ) ( not ( = ?auto_63511 ?auto_63522 ) ) ( not ( = ?auto_63528 ?auto_63522 ) ) ( not ( = ?auto_63515 ?auto_63522 ) ) ( not ( = ?auto_63509 ?auto_63522 ) ) ( not ( = ?auto_63530 ?auto_63522 ) ) ( not ( = ?auto_63516 ?auto_63522 ) ) ( AVAILABLE ?auto_63514 ) ( SURFACE-AT ?auto_63530 ?auto_63506 ) ( ON ?auto_63530 ?auto_63519 ) ( CLEAR ?auto_63530 ) ( not ( = ?auto_63502 ?auto_63519 ) ) ( not ( = ?auto_63503 ?auto_63519 ) ) ( not ( = ?auto_63520 ?auto_63519 ) ) ( not ( = ?auto_63526 ?auto_63519 ) ) ( not ( = ?auto_63525 ?auto_63519 ) ) ( not ( = ?auto_63529 ?auto_63519 ) ) ( not ( = ?auto_63518 ?auto_63519 ) ) ( not ( = ?auto_63511 ?auto_63519 ) ) ( not ( = ?auto_63528 ?auto_63519 ) ) ( not ( = ?auto_63515 ?auto_63519 ) ) ( not ( = ?auto_63509 ?auto_63519 ) ) ( not ( = ?auto_63530 ?auto_63519 ) ) ( not ( = ?auto_63516 ?auto_63519 ) ) ( not ( = ?auto_63522 ?auto_63519 ) ) ( TRUCK-AT ?auto_63527 ?auto_63531 ) ( SURFACE-AT ?auto_63532 ?auto_63531 ) ( CLEAR ?auto_63532 ) ( LIFTING ?auto_63508 ?auto_63522 ) ( IS-CRATE ?auto_63522 ) ( not ( = ?auto_63502 ?auto_63532 ) ) ( not ( = ?auto_63503 ?auto_63532 ) ) ( not ( = ?auto_63520 ?auto_63532 ) ) ( not ( = ?auto_63526 ?auto_63532 ) ) ( not ( = ?auto_63525 ?auto_63532 ) ) ( not ( = ?auto_63529 ?auto_63532 ) ) ( not ( = ?auto_63518 ?auto_63532 ) ) ( not ( = ?auto_63511 ?auto_63532 ) ) ( not ( = ?auto_63528 ?auto_63532 ) ) ( not ( = ?auto_63515 ?auto_63532 ) ) ( not ( = ?auto_63509 ?auto_63532 ) ) ( not ( = ?auto_63530 ?auto_63532 ) ) ( not ( = ?auto_63516 ?auto_63532 ) ) ( not ( = ?auto_63522 ?auto_63532 ) ) ( not ( = ?auto_63519 ?auto_63532 ) ) )
    :subtasks
    ( ( !DROP ?auto_63508 ?auto_63522 ?auto_63532 ?auto_63531 )
      ( MAKE-ON ?auto_63502 ?auto_63503 )
      ( MAKE-ON-VERIFY ?auto_63502 ?auto_63503 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63533 - SURFACE
      ?auto_63534 - SURFACE
    )
    :vars
    (
      ?auto_63546 - HOIST
      ?auto_63538 - PLACE
      ?auto_63559 - PLACE
      ?auto_63547 - HOIST
      ?auto_63536 - SURFACE
      ?auto_63550 - SURFACE
      ?auto_63542 - PLACE
      ?auto_63544 - HOIST
      ?auto_63549 - SURFACE
      ?auto_63562 - SURFACE
      ?auto_63545 - PLACE
      ?auto_63548 - HOIST
      ?auto_63558 - SURFACE
      ?auto_63540 - SURFACE
      ?auto_63553 - PLACE
      ?auto_63557 - HOIST
      ?auto_63561 - SURFACE
      ?auto_63556 - SURFACE
      ?auto_63535 - PLACE
      ?auto_63555 - HOIST
      ?auto_63541 - SURFACE
      ?auto_63563 - SURFACE
      ?auto_63543 - PLACE
      ?auto_63552 - HOIST
      ?auto_63554 - SURFACE
      ?auto_63539 - SURFACE
      ?auto_63551 - SURFACE
      ?auto_63537 - TRUCK
      ?auto_63560 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63546 ?auto_63538 ) ( IS-CRATE ?auto_63533 ) ( not ( = ?auto_63533 ?auto_63534 ) ) ( not ( = ?auto_63559 ?auto_63538 ) ) ( HOIST-AT ?auto_63547 ?auto_63559 ) ( not ( = ?auto_63546 ?auto_63547 ) ) ( AVAILABLE ?auto_63547 ) ( SURFACE-AT ?auto_63533 ?auto_63559 ) ( ON ?auto_63533 ?auto_63536 ) ( CLEAR ?auto_63533 ) ( not ( = ?auto_63533 ?auto_63536 ) ) ( not ( = ?auto_63534 ?auto_63536 ) ) ( IS-CRATE ?auto_63534 ) ( not ( = ?auto_63533 ?auto_63550 ) ) ( not ( = ?auto_63534 ?auto_63550 ) ) ( not ( = ?auto_63536 ?auto_63550 ) ) ( not ( = ?auto_63542 ?auto_63538 ) ) ( not ( = ?auto_63559 ?auto_63542 ) ) ( HOIST-AT ?auto_63544 ?auto_63542 ) ( not ( = ?auto_63546 ?auto_63544 ) ) ( not ( = ?auto_63547 ?auto_63544 ) ) ( SURFACE-AT ?auto_63534 ?auto_63542 ) ( ON ?auto_63534 ?auto_63549 ) ( CLEAR ?auto_63534 ) ( not ( = ?auto_63533 ?auto_63549 ) ) ( not ( = ?auto_63534 ?auto_63549 ) ) ( not ( = ?auto_63536 ?auto_63549 ) ) ( not ( = ?auto_63550 ?auto_63549 ) ) ( IS-CRATE ?auto_63550 ) ( not ( = ?auto_63533 ?auto_63562 ) ) ( not ( = ?auto_63534 ?auto_63562 ) ) ( not ( = ?auto_63536 ?auto_63562 ) ) ( not ( = ?auto_63550 ?auto_63562 ) ) ( not ( = ?auto_63549 ?auto_63562 ) ) ( not ( = ?auto_63545 ?auto_63538 ) ) ( not ( = ?auto_63559 ?auto_63545 ) ) ( not ( = ?auto_63542 ?auto_63545 ) ) ( HOIST-AT ?auto_63548 ?auto_63545 ) ( not ( = ?auto_63546 ?auto_63548 ) ) ( not ( = ?auto_63547 ?auto_63548 ) ) ( not ( = ?auto_63544 ?auto_63548 ) ) ( AVAILABLE ?auto_63548 ) ( SURFACE-AT ?auto_63550 ?auto_63545 ) ( ON ?auto_63550 ?auto_63558 ) ( CLEAR ?auto_63550 ) ( not ( = ?auto_63533 ?auto_63558 ) ) ( not ( = ?auto_63534 ?auto_63558 ) ) ( not ( = ?auto_63536 ?auto_63558 ) ) ( not ( = ?auto_63550 ?auto_63558 ) ) ( not ( = ?auto_63549 ?auto_63558 ) ) ( not ( = ?auto_63562 ?auto_63558 ) ) ( IS-CRATE ?auto_63562 ) ( not ( = ?auto_63533 ?auto_63540 ) ) ( not ( = ?auto_63534 ?auto_63540 ) ) ( not ( = ?auto_63536 ?auto_63540 ) ) ( not ( = ?auto_63550 ?auto_63540 ) ) ( not ( = ?auto_63549 ?auto_63540 ) ) ( not ( = ?auto_63562 ?auto_63540 ) ) ( not ( = ?auto_63558 ?auto_63540 ) ) ( not ( = ?auto_63553 ?auto_63538 ) ) ( not ( = ?auto_63559 ?auto_63553 ) ) ( not ( = ?auto_63542 ?auto_63553 ) ) ( not ( = ?auto_63545 ?auto_63553 ) ) ( HOIST-AT ?auto_63557 ?auto_63553 ) ( not ( = ?auto_63546 ?auto_63557 ) ) ( not ( = ?auto_63547 ?auto_63557 ) ) ( not ( = ?auto_63544 ?auto_63557 ) ) ( not ( = ?auto_63548 ?auto_63557 ) ) ( AVAILABLE ?auto_63557 ) ( SURFACE-AT ?auto_63562 ?auto_63553 ) ( ON ?auto_63562 ?auto_63561 ) ( CLEAR ?auto_63562 ) ( not ( = ?auto_63533 ?auto_63561 ) ) ( not ( = ?auto_63534 ?auto_63561 ) ) ( not ( = ?auto_63536 ?auto_63561 ) ) ( not ( = ?auto_63550 ?auto_63561 ) ) ( not ( = ?auto_63549 ?auto_63561 ) ) ( not ( = ?auto_63562 ?auto_63561 ) ) ( not ( = ?auto_63558 ?auto_63561 ) ) ( not ( = ?auto_63540 ?auto_63561 ) ) ( IS-CRATE ?auto_63540 ) ( not ( = ?auto_63533 ?auto_63556 ) ) ( not ( = ?auto_63534 ?auto_63556 ) ) ( not ( = ?auto_63536 ?auto_63556 ) ) ( not ( = ?auto_63550 ?auto_63556 ) ) ( not ( = ?auto_63549 ?auto_63556 ) ) ( not ( = ?auto_63562 ?auto_63556 ) ) ( not ( = ?auto_63558 ?auto_63556 ) ) ( not ( = ?auto_63540 ?auto_63556 ) ) ( not ( = ?auto_63561 ?auto_63556 ) ) ( not ( = ?auto_63535 ?auto_63538 ) ) ( not ( = ?auto_63559 ?auto_63535 ) ) ( not ( = ?auto_63542 ?auto_63535 ) ) ( not ( = ?auto_63545 ?auto_63535 ) ) ( not ( = ?auto_63553 ?auto_63535 ) ) ( HOIST-AT ?auto_63555 ?auto_63535 ) ( not ( = ?auto_63546 ?auto_63555 ) ) ( not ( = ?auto_63547 ?auto_63555 ) ) ( not ( = ?auto_63544 ?auto_63555 ) ) ( not ( = ?auto_63548 ?auto_63555 ) ) ( not ( = ?auto_63557 ?auto_63555 ) ) ( AVAILABLE ?auto_63555 ) ( SURFACE-AT ?auto_63540 ?auto_63535 ) ( ON ?auto_63540 ?auto_63541 ) ( CLEAR ?auto_63540 ) ( not ( = ?auto_63533 ?auto_63541 ) ) ( not ( = ?auto_63534 ?auto_63541 ) ) ( not ( = ?auto_63536 ?auto_63541 ) ) ( not ( = ?auto_63550 ?auto_63541 ) ) ( not ( = ?auto_63549 ?auto_63541 ) ) ( not ( = ?auto_63562 ?auto_63541 ) ) ( not ( = ?auto_63558 ?auto_63541 ) ) ( not ( = ?auto_63540 ?auto_63541 ) ) ( not ( = ?auto_63561 ?auto_63541 ) ) ( not ( = ?auto_63556 ?auto_63541 ) ) ( IS-CRATE ?auto_63556 ) ( not ( = ?auto_63533 ?auto_63563 ) ) ( not ( = ?auto_63534 ?auto_63563 ) ) ( not ( = ?auto_63536 ?auto_63563 ) ) ( not ( = ?auto_63550 ?auto_63563 ) ) ( not ( = ?auto_63549 ?auto_63563 ) ) ( not ( = ?auto_63562 ?auto_63563 ) ) ( not ( = ?auto_63558 ?auto_63563 ) ) ( not ( = ?auto_63540 ?auto_63563 ) ) ( not ( = ?auto_63561 ?auto_63563 ) ) ( not ( = ?auto_63556 ?auto_63563 ) ) ( not ( = ?auto_63541 ?auto_63563 ) ) ( not ( = ?auto_63543 ?auto_63538 ) ) ( not ( = ?auto_63559 ?auto_63543 ) ) ( not ( = ?auto_63542 ?auto_63543 ) ) ( not ( = ?auto_63545 ?auto_63543 ) ) ( not ( = ?auto_63553 ?auto_63543 ) ) ( not ( = ?auto_63535 ?auto_63543 ) ) ( HOIST-AT ?auto_63552 ?auto_63543 ) ( not ( = ?auto_63546 ?auto_63552 ) ) ( not ( = ?auto_63547 ?auto_63552 ) ) ( not ( = ?auto_63544 ?auto_63552 ) ) ( not ( = ?auto_63548 ?auto_63552 ) ) ( not ( = ?auto_63557 ?auto_63552 ) ) ( not ( = ?auto_63555 ?auto_63552 ) ) ( AVAILABLE ?auto_63552 ) ( SURFACE-AT ?auto_63556 ?auto_63543 ) ( ON ?auto_63556 ?auto_63554 ) ( CLEAR ?auto_63556 ) ( not ( = ?auto_63533 ?auto_63554 ) ) ( not ( = ?auto_63534 ?auto_63554 ) ) ( not ( = ?auto_63536 ?auto_63554 ) ) ( not ( = ?auto_63550 ?auto_63554 ) ) ( not ( = ?auto_63549 ?auto_63554 ) ) ( not ( = ?auto_63562 ?auto_63554 ) ) ( not ( = ?auto_63558 ?auto_63554 ) ) ( not ( = ?auto_63540 ?auto_63554 ) ) ( not ( = ?auto_63561 ?auto_63554 ) ) ( not ( = ?auto_63556 ?auto_63554 ) ) ( not ( = ?auto_63541 ?auto_63554 ) ) ( not ( = ?auto_63563 ?auto_63554 ) ) ( IS-CRATE ?auto_63563 ) ( not ( = ?auto_63533 ?auto_63539 ) ) ( not ( = ?auto_63534 ?auto_63539 ) ) ( not ( = ?auto_63536 ?auto_63539 ) ) ( not ( = ?auto_63550 ?auto_63539 ) ) ( not ( = ?auto_63549 ?auto_63539 ) ) ( not ( = ?auto_63562 ?auto_63539 ) ) ( not ( = ?auto_63558 ?auto_63539 ) ) ( not ( = ?auto_63540 ?auto_63539 ) ) ( not ( = ?auto_63561 ?auto_63539 ) ) ( not ( = ?auto_63556 ?auto_63539 ) ) ( not ( = ?auto_63541 ?auto_63539 ) ) ( not ( = ?auto_63563 ?auto_63539 ) ) ( not ( = ?auto_63554 ?auto_63539 ) ) ( AVAILABLE ?auto_63544 ) ( SURFACE-AT ?auto_63563 ?auto_63542 ) ( ON ?auto_63563 ?auto_63551 ) ( CLEAR ?auto_63563 ) ( not ( = ?auto_63533 ?auto_63551 ) ) ( not ( = ?auto_63534 ?auto_63551 ) ) ( not ( = ?auto_63536 ?auto_63551 ) ) ( not ( = ?auto_63550 ?auto_63551 ) ) ( not ( = ?auto_63549 ?auto_63551 ) ) ( not ( = ?auto_63562 ?auto_63551 ) ) ( not ( = ?auto_63558 ?auto_63551 ) ) ( not ( = ?auto_63540 ?auto_63551 ) ) ( not ( = ?auto_63561 ?auto_63551 ) ) ( not ( = ?auto_63556 ?auto_63551 ) ) ( not ( = ?auto_63541 ?auto_63551 ) ) ( not ( = ?auto_63563 ?auto_63551 ) ) ( not ( = ?auto_63554 ?auto_63551 ) ) ( not ( = ?auto_63539 ?auto_63551 ) ) ( TRUCK-AT ?auto_63537 ?auto_63538 ) ( SURFACE-AT ?auto_63560 ?auto_63538 ) ( CLEAR ?auto_63560 ) ( IS-CRATE ?auto_63539 ) ( not ( = ?auto_63533 ?auto_63560 ) ) ( not ( = ?auto_63534 ?auto_63560 ) ) ( not ( = ?auto_63536 ?auto_63560 ) ) ( not ( = ?auto_63550 ?auto_63560 ) ) ( not ( = ?auto_63549 ?auto_63560 ) ) ( not ( = ?auto_63562 ?auto_63560 ) ) ( not ( = ?auto_63558 ?auto_63560 ) ) ( not ( = ?auto_63540 ?auto_63560 ) ) ( not ( = ?auto_63561 ?auto_63560 ) ) ( not ( = ?auto_63556 ?auto_63560 ) ) ( not ( = ?auto_63541 ?auto_63560 ) ) ( not ( = ?auto_63563 ?auto_63560 ) ) ( not ( = ?auto_63554 ?auto_63560 ) ) ( not ( = ?auto_63539 ?auto_63560 ) ) ( not ( = ?auto_63551 ?auto_63560 ) ) ( AVAILABLE ?auto_63546 ) ( IN ?auto_63539 ?auto_63537 ) )
    :subtasks
    ( ( !UNLOAD ?auto_63546 ?auto_63539 ?auto_63537 ?auto_63538 )
      ( MAKE-ON ?auto_63533 ?auto_63534 )
      ( MAKE-ON-VERIFY ?auto_63533 ?auto_63534 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63564 - SURFACE
      ?auto_63565 - SURFACE
    )
    :vars
    (
      ?auto_63572 - HOIST
      ?auto_63578 - PLACE
      ?auto_63580 - PLACE
      ?auto_63573 - HOIST
      ?auto_63570 - SURFACE
      ?auto_63591 - SURFACE
      ?auto_63569 - PLACE
      ?auto_63567 - HOIST
      ?auto_63593 - SURFACE
      ?auto_63571 - SURFACE
      ?auto_63577 - PLACE
      ?auto_63592 - HOIST
      ?auto_63583 - SURFACE
      ?auto_63579 - SURFACE
      ?auto_63586 - PLACE
      ?auto_63590 - HOIST
      ?auto_63575 - SURFACE
      ?auto_63589 - SURFACE
      ?auto_63568 - PLACE
      ?auto_63588 - HOIST
      ?auto_63581 - SURFACE
      ?auto_63576 - SURFACE
      ?auto_63582 - PLACE
      ?auto_63585 - HOIST
      ?auto_63587 - SURFACE
      ?auto_63594 - SURFACE
      ?auto_63584 - SURFACE
      ?auto_63574 - SURFACE
      ?auto_63566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63572 ?auto_63578 ) ( IS-CRATE ?auto_63564 ) ( not ( = ?auto_63564 ?auto_63565 ) ) ( not ( = ?auto_63580 ?auto_63578 ) ) ( HOIST-AT ?auto_63573 ?auto_63580 ) ( not ( = ?auto_63572 ?auto_63573 ) ) ( AVAILABLE ?auto_63573 ) ( SURFACE-AT ?auto_63564 ?auto_63580 ) ( ON ?auto_63564 ?auto_63570 ) ( CLEAR ?auto_63564 ) ( not ( = ?auto_63564 ?auto_63570 ) ) ( not ( = ?auto_63565 ?auto_63570 ) ) ( IS-CRATE ?auto_63565 ) ( not ( = ?auto_63564 ?auto_63591 ) ) ( not ( = ?auto_63565 ?auto_63591 ) ) ( not ( = ?auto_63570 ?auto_63591 ) ) ( not ( = ?auto_63569 ?auto_63578 ) ) ( not ( = ?auto_63580 ?auto_63569 ) ) ( HOIST-AT ?auto_63567 ?auto_63569 ) ( not ( = ?auto_63572 ?auto_63567 ) ) ( not ( = ?auto_63573 ?auto_63567 ) ) ( SURFACE-AT ?auto_63565 ?auto_63569 ) ( ON ?auto_63565 ?auto_63593 ) ( CLEAR ?auto_63565 ) ( not ( = ?auto_63564 ?auto_63593 ) ) ( not ( = ?auto_63565 ?auto_63593 ) ) ( not ( = ?auto_63570 ?auto_63593 ) ) ( not ( = ?auto_63591 ?auto_63593 ) ) ( IS-CRATE ?auto_63591 ) ( not ( = ?auto_63564 ?auto_63571 ) ) ( not ( = ?auto_63565 ?auto_63571 ) ) ( not ( = ?auto_63570 ?auto_63571 ) ) ( not ( = ?auto_63591 ?auto_63571 ) ) ( not ( = ?auto_63593 ?auto_63571 ) ) ( not ( = ?auto_63577 ?auto_63578 ) ) ( not ( = ?auto_63580 ?auto_63577 ) ) ( not ( = ?auto_63569 ?auto_63577 ) ) ( HOIST-AT ?auto_63592 ?auto_63577 ) ( not ( = ?auto_63572 ?auto_63592 ) ) ( not ( = ?auto_63573 ?auto_63592 ) ) ( not ( = ?auto_63567 ?auto_63592 ) ) ( AVAILABLE ?auto_63592 ) ( SURFACE-AT ?auto_63591 ?auto_63577 ) ( ON ?auto_63591 ?auto_63583 ) ( CLEAR ?auto_63591 ) ( not ( = ?auto_63564 ?auto_63583 ) ) ( not ( = ?auto_63565 ?auto_63583 ) ) ( not ( = ?auto_63570 ?auto_63583 ) ) ( not ( = ?auto_63591 ?auto_63583 ) ) ( not ( = ?auto_63593 ?auto_63583 ) ) ( not ( = ?auto_63571 ?auto_63583 ) ) ( IS-CRATE ?auto_63571 ) ( not ( = ?auto_63564 ?auto_63579 ) ) ( not ( = ?auto_63565 ?auto_63579 ) ) ( not ( = ?auto_63570 ?auto_63579 ) ) ( not ( = ?auto_63591 ?auto_63579 ) ) ( not ( = ?auto_63593 ?auto_63579 ) ) ( not ( = ?auto_63571 ?auto_63579 ) ) ( not ( = ?auto_63583 ?auto_63579 ) ) ( not ( = ?auto_63586 ?auto_63578 ) ) ( not ( = ?auto_63580 ?auto_63586 ) ) ( not ( = ?auto_63569 ?auto_63586 ) ) ( not ( = ?auto_63577 ?auto_63586 ) ) ( HOIST-AT ?auto_63590 ?auto_63586 ) ( not ( = ?auto_63572 ?auto_63590 ) ) ( not ( = ?auto_63573 ?auto_63590 ) ) ( not ( = ?auto_63567 ?auto_63590 ) ) ( not ( = ?auto_63592 ?auto_63590 ) ) ( AVAILABLE ?auto_63590 ) ( SURFACE-AT ?auto_63571 ?auto_63586 ) ( ON ?auto_63571 ?auto_63575 ) ( CLEAR ?auto_63571 ) ( not ( = ?auto_63564 ?auto_63575 ) ) ( not ( = ?auto_63565 ?auto_63575 ) ) ( not ( = ?auto_63570 ?auto_63575 ) ) ( not ( = ?auto_63591 ?auto_63575 ) ) ( not ( = ?auto_63593 ?auto_63575 ) ) ( not ( = ?auto_63571 ?auto_63575 ) ) ( not ( = ?auto_63583 ?auto_63575 ) ) ( not ( = ?auto_63579 ?auto_63575 ) ) ( IS-CRATE ?auto_63579 ) ( not ( = ?auto_63564 ?auto_63589 ) ) ( not ( = ?auto_63565 ?auto_63589 ) ) ( not ( = ?auto_63570 ?auto_63589 ) ) ( not ( = ?auto_63591 ?auto_63589 ) ) ( not ( = ?auto_63593 ?auto_63589 ) ) ( not ( = ?auto_63571 ?auto_63589 ) ) ( not ( = ?auto_63583 ?auto_63589 ) ) ( not ( = ?auto_63579 ?auto_63589 ) ) ( not ( = ?auto_63575 ?auto_63589 ) ) ( not ( = ?auto_63568 ?auto_63578 ) ) ( not ( = ?auto_63580 ?auto_63568 ) ) ( not ( = ?auto_63569 ?auto_63568 ) ) ( not ( = ?auto_63577 ?auto_63568 ) ) ( not ( = ?auto_63586 ?auto_63568 ) ) ( HOIST-AT ?auto_63588 ?auto_63568 ) ( not ( = ?auto_63572 ?auto_63588 ) ) ( not ( = ?auto_63573 ?auto_63588 ) ) ( not ( = ?auto_63567 ?auto_63588 ) ) ( not ( = ?auto_63592 ?auto_63588 ) ) ( not ( = ?auto_63590 ?auto_63588 ) ) ( AVAILABLE ?auto_63588 ) ( SURFACE-AT ?auto_63579 ?auto_63568 ) ( ON ?auto_63579 ?auto_63581 ) ( CLEAR ?auto_63579 ) ( not ( = ?auto_63564 ?auto_63581 ) ) ( not ( = ?auto_63565 ?auto_63581 ) ) ( not ( = ?auto_63570 ?auto_63581 ) ) ( not ( = ?auto_63591 ?auto_63581 ) ) ( not ( = ?auto_63593 ?auto_63581 ) ) ( not ( = ?auto_63571 ?auto_63581 ) ) ( not ( = ?auto_63583 ?auto_63581 ) ) ( not ( = ?auto_63579 ?auto_63581 ) ) ( not ( = ?auto_63575 ?auto_63581 ) ) ( not ( = ?auto_63589 ?auto_63581 ) ) ( IS-CRATE ?auto_63589 ) ( not ( = ?auto_63564 ?auto_63576 ) ) ( not ( = ?auto_63565 ?auto_63576 ) ) ( not ( = ?auto_63570 ?auto_63576 ) ) ( not ( = ?auto_63591 ?auto_63576 ) ) ( not ( = ?auto_63593 ?auto_63576 ) ) ( not ( = ?auto_63571 ?auto_63576 ) ) ( not ( = ?auto_63583 ?auto_63576 ) ) ( not ( = ?auto_63579 ?auto_63576 ) ) ( not ( = ?auto_63575 ?auto_63576 ) ) ( not ( = ?auto_63589 ?auto_63576 ) ) ( not ( = ?auto_63581 ?auto_63576 ) ) ( not ( = ?auto_63582 ?auto_63578 ) ) ( not ( = ?auto_63580 ?auto_63582 ) ) ( not ( = ?auto_63569 ?auto_63582 ) ) ( not ( = ?auto_63577 ?auto_63582 ) ) ( not ( = ?auto_63586 ?auto_63582 ) ) ( not ( = ?auto_63568 ?auto_63582 ) ) ( HOIST-AT ?auto_63585 ?auto_63582 ) ( not ( = ?auto_63572 ?auto_63585 ) ) ( not ( = ?auto_63573 ?auto_63585 ) ) ( not ( = ?auto_63567 ?auto_63585 ) ) ( not ( = ?auto_63592 ?auto_63585 ) ) ( not ( = ?auto_63590 ?auto_63585 ) ) ( not ( = ?auto_63588 ?auto_63585 ) ) ( AVAILABLE ?auto_63585 ) ( SURFACE-AT ?auto_63589 ?auto_63582 ) ( ON ?auto_63589 ?auto_63587 ) ( CLEAR ?auto_63589 ) ( not ( = ?auto_63564 ?auto_63587 ) ) ( not ( = ?auto_63565 ?auto_63587 ) ) ( not ( = ?auto_63570 ?auto_63587 ) ) ( not ( = ?auto_63591 ?auto_63587 ) ) ( not ( = ?auto_63593 ?auto_63587 ) ) ( not ( = ?auto_63571 ?auto_63587 ) ) ( not ( = ?auto_63583 ?auto_63587 ) ) ( not ( = ?auto_63579 ?auto_63587 ) ) ( not ( = ?auto_63575 ?auto_63587 ) ) ( not ( = ?auto_63589 ?auto_63587 ) ) ( not ( = ?auto_63581 ?auto_63587 ) ) ( not ( = ?auto_63576 ?auto_63587 ) ) ( IS-CRATE ?auto_63576 ) ( not ( = ?auto_63564 ?auto_63594 ) ) ( not ( = ?auto_63565 ?auto_63594 ) ) ( not ( = ?auto_63570 ?auto_63594 ) ) ( not ( = ?auto_63591 ?auto_63594 ) ) ( not ( = ?auto_63593 ?auto_63594 ) ) ( not ( = ?auto_63571 ?auto_63594 ) ) ( not ( = ?auto_63583 ?auto_63594 ) ) ( not ( = ?auto_63579 ?auto_63594 ) ) ( not ( = ?auto_63575 ?auto_63594 ) ) ( not ( = ?auto_63589 ?auto_63594 ) ) ( not ( = ?auto_63581 ?auto_63594 ) ) ( not ( = ?auto_63576 ?auto_63594 ) ) ( not ( = ?auto_63587 ?auto_63594 ) ) ( AVAILABLE ?auto_63567 ) ( SURFACE-AT ?auto_63576 ?auto_63569 ) ( ON ?auto_63576 ?auto_63584 ) ( CLEAR ?auto_63576 ) ( not ( = ?auto_63564 ?auto_63584 ) ) ( not ( = ?auto_63565 ?auto_63584 ) ) ( not ( = ?auto_63570 ?auto_63584 ) ) ( not ( = ?auto_63591 ?auto_63584 ) ) ( not ( = ?auto_63593 ?auto_63584 ) ) ( not ( = ?auto_63571 ?auto_63584 ) ) ( not ( = ?auto_63583 ?auto_63584 ) ) ( not ( = ?auto_63579 ?auto_63584 ) ) ( not ( = ?auto_63575 ?auto_63584 ) ) ( not ( = ?auto_63589 ?auto_63584 ) ) ( not ( = ?auto_63581 ?auto_63584 ) ) ( not ( = ?auto_63576 ?auto_63584 ) ) ( not ( = ?auto_63587 ?auto_63584 ) ) ( not ( = ?auto_63594 ?auto_63584 ) ) ( SURFACE-AT ?auto_63574 ?auto_63578 ) ( CLEAR ?auto_63574 ) ( IS-CRATE ?auto_63594 ) ( not ( = ?auto_63564 ?auto_63574 ) ) ( not ( = ?auto_63565 ?auto_63574 ) ) ( not ( = ?auto_63570 ?auto_63574 ) ) ( not ( = ?auto_63591 ?auto_63574 ) ) ( not ( = ?auto_63593 ?auto_63574 ) ) ( not ( = ?auto_63571 ?auto_63574 ) ) ( not ( = ?auto_63583 ?auto_63574 ) ) ( not ( = ?auto_63579 ?auto_63574 ) ) ( not ( = ?auto_63575 ?auto_63574 ) ) ( not ( = ?auto_63589 ?auto_63574 ) ) ( not ( = ?auto_63581 ?auto_63574 ) ) ( not ( = ?auto_63576 ?auto_63574 ) ) ( not ( = ?auto_63587 ?auto_63574 ) ) ( not ( = ?auto_63594 ?auto_63574 ) ) ( not ( = ?auto_63584 ?auto_63574 ) ) ( AVAILABLE ?auto_63572 ) ( IN ?auto_63594 ?auto_63566 ) ( TRUCK-AT ?auto_63566 ?auto_63586 ) )
    :subtasks
    ( ( !DRIVE ?auto_63566 ?auto_63586 ?auto_63578 )
      ( MAKE-ON ?auto_63564 ?auto_63565 )
      ( MAKE-ON-VERIFY ?auto_63564 ?auto_63565 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63595 - SURFACE
      ?auto_63596 - SURFACE
    )
    :vars
    (
      ?auto_63616 - HOIST
      ?auto_63597 - PLACE
      ?auto_63598 - PLACE
      ?auto_63618 - HOIST
      ?auto_63622 - SURFACE
      ?auto_63603 - SURFACE
      ?auto_63621 - PLACE
      ?auto_63620 - HOIST
      ?auto_63605 - SURFACE
      ?auto_63617 - SURFACE
      ?auto_63623 - PLACE
      ?auto_63604 - HOIST
      ?auto_63609 - SURFACE
      ?auto_63601 - SURFACE
      ?auto_63612 - PLACE
      ?auto_63600 - HOIST
      ?auto_63602 - SURFACE
      ?auto_63607 - SURFACE
      ?auto_63619 - PLACE
      ?auto_63614 - HOIST
      ?auto_63615 - SURFACE
      ?auto_63599 - SURFACE
      ?auto_63608 - PLACE
      ?auto_63611 - HOIST
      ?auto_63613 - SURFACE
      ?auto_63606 - SURFACE
      ?auto_63610 - SURFACE
      ?auto_63624 - SURFACE
      ?auto_63625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63616 ?auto_63597 ) ( IS-CRATE ?auto_63595 ) ( not ( = ?auto_63595 ?auto_63596 ) ) ( not ( = ?auto_63598 ?auto_63597 ) ) ( HOIST-AT ?auto_63618 ?auto_63598 ) ( not ( = ?auto_63616 ?auto_63618 ) ) ( AVAILABLE ?auto_63618 ) ( SURFACE-AT ?auto_63595 ?auto_63598 ) ( ON ?auto_63595 ?auto_63622 ) ( CLEAR ?auto_63595 ) ( not ( = ?auto_63595 ?auto_63622 ) ) ( not ( = ?auto_63596 ?auto_63622 ) ) ( IS-CRATE ?auto_63596 ) ( not ( = ?auto_63595 ?auto_63603 ) ) ( not ( = ?auto_63596 ?auto_63603 ) ) ( not ( = ?auto_63622 ?auto_63603 ) ) ( not ( = ?auto_63621 ?auto_63597 ) ) ( not ( = ?auto_63598 ?auto_63621 ) ) ( HOIST-AT ?auto_63620 ?auto_63621 ) ( not ( = ?auto_63616 ?auto_63620 ) ) ( not ( = ?auto_63618 ?auto_63620 ) ) ( SURFACE-AT ?auto_63596 ?auto_63621 ) ( ON ?auto_63596 ?auto_63605 ) ( CLEAR ?auto_63596 ) ( not ( = ?auto_63595 ?auto_63605 ) ) ( not ( = ?auto_63596 ?auto_63605 ) ) ( not ( = ?auto_63622 ?auto_63605 ) ) ( not ( = ?auto_63603 ?auto_63605 ) ) ( IS-CRATE ?auto_63603 ) ( not ( = ?auto_63595 ?auto_63617 ) ) ( not ( = ?auto_63596 ?auto_63617 ) ) ( not ( = ?auto_63622 ?auto_63617 ) ) ( not ( = ?auto_63603 ?auto_63617 ) ) ( not ( = ?auto_63605 ?auto_63617 ) ) ( not ( = ?auto_63623 ?auto_63597 ) ) ( not ( = ?auto_63598 ?auto_63623 ) ) ( not ( = ?auto_63621 ?auto_63623 ) ) ( HOIST-AT ?auto_63604 ?auto_63623 ) ( not ( = ?auto_63616 ?auto_63604 ) ) ( not ( = ?auto_63618 ?auto_63604 ) ) ( not ( = ?auto_63620 ?auto_63604 ) ) ( AVAILABLE ?auto_63604 ) ( SURFACE-AT ?auto_63603 ?auto_63623 ) ( ON ?auto_63603 ?auto_63609 ) ( CLEAR ?auto_63603 ) ( not ( = ?auto_63595 ?auto_63609 ) ) ( not ( = ?auto_63596 ?auto_63609 ) ) ( not ( = ?auto_63622 ?auto_63609 ) ) ( not ( = ?auto_63603 ?auto_63609 ) ) ( not ( = ?auto_63605 ?auto_63609 ) ) ( not ( = ?auto_63617 ?auto_63609 ) ) ( IS-CRATE ?auto_63617 ) ( not ( = ?auto_63595 ?auto_63601 ) ) ( not ( = ?auto_63596 ?auto_63601 ) ) ( not ( = ?auto_63622 ?auto_63601 ) ) ( not ( = ?auto_63603 ?auto_63601 ) ) ( not ( = ?auto_63605 ?auto_63601 ) ) ( not ( = ?auto_63617 ?auto_63601 ) ) ( not ( = ?auto_63609 ?auto_63601 ) ) ( not ( = ?auto_63612 ?auto_63597 ) ) ( not ( = ?auto_63598 ?auto_63612 ) ) ( not ( = ?auto_63621 ?auto_63612 ) ) ( not ( = ?auto_63623 ?auto_63612 ) ) ( HOIST-AT ?auto_63600 ?auto_63612 ) ( not ( = ?auto_63616 ?auto_63600 ) ) ( not ( = ?auto_63618 ?auto_63600 ) ) ( not ( = ?auto_63620 ?auto_63600 ) ) ( not ( = ?auto_63604 ?auto_63600 ) ) ( SURFACE-AT ?auto_63617 ?auto_63612 ) ( ON ?auto_63617 ?auto_63602 ) ( CLEAR ?auto_63617 ) ( not ( = ?auto_63595 ?auto_63602 ) ) ( not ( = ?auto_63596 ?auto_63602 ) ) ( not ( = ?auto_63622 ?auto_63602 ) ) ( not ( = ?auto_63603 ?auto_63602 ) ) ( not ( = ?auto_63605 ?auto_63602 ) ) ( not ( = ?auto_63617 ?auto_63602 ) ) ( not ( = ?auto_63609 ?auto_63602 ) ) ( not ( = ?auto_63601 ?auto_63602 ) ) ( IS-CRATE ?auto_63601 ) ( not ( = ?auto_63595 ?auto_63607 ) ) ( not ( = ?auto_63596 ?auto_63607 ) ) ( not ( = ?auto_63622 ?auto_63607 ) ) ( not ( = ?auto_63603 ?auto_63607 ) ) ( not ( = ?auto_63605 ?auto_63607 ) ) ( not ( = ?auto_63617 ?auto_63607 ) ) ( not ( = ?auto_63609 ?auto_63607 ) ) ( not ( = ?auto_63601 ?auto_63607 ) ) ( not ( = ?auto_63602 ?auto_63607 ) ) ( not ( = ?auto_63619 ?auto_63597 ) ) ( not ( = ?auto_63598 ?auto_63619 ) ) ( not ( = ?auto_63621 ?auto_63619 ) ) ( not ( = ?auto_63623 ?auto_63619 ) ) ( not ( = ?auto_63612 ?auto_63619 ) ) ( HOIST-AT ?auto_63614 ?auto_63619 ) ( not ( = ?auto_63616 ?auto_63614 ) ) ( not ( = ?auto_63618 ?auto_63614 ) ) ( not ( = ?auto_63620 ?auto_63614 ) ) ( not ( = ?auto_63604 ?auto_63614 ) ) ( not ( = ?auto_63600 ?auto_63614 ) ) ( AVAILABLE ?auto_63614 ) ( SURFACE-AT ?auto_63601 ?auto_63619 ) ( ON ?auto_63601 ?auto_63615 ) ( CLEAR ?auto_63601 ) ( not ( = ?auto_63595 ?auto_63615 ) ) ( not ( = ?auto_63596 ?auto_63615 ) ) ( not ( = ?auto_63622 ?auto_63615 ) ) ( not ( = ?auto_63603 ?auto_63615 ) ) ( not ( = ?auto_63605 ?auto_63615 ) ) ( not ( = ?auto_63617 ?auto_63615 ) ) ( not ( = ?auto_63609 ?auto_63615 ) ) ( not ( = ?auto_63601 ?auto_63615 ) ) ( not ( = ?auto_63602 ?auto_63615 ) ) ( not ( = ?auto_63607 ?auto_63615 ) ) ( IS-CRATE ?auto_63607 ) ( not ( = ?auto_63595 ?auto_63599 ) ) ( not ( = ?auto_63596 ?auto_63599 ) ) ( not ( = ?auto_63622 ?auto_63599 ) ) ( not ( = ?auto_63603 ?auto_63599 ) ) ( not ( = ?auto_63605 ?auto_63599 ) ) ( not ( = ?auto_63617 ?auto_63599 ) ) ( not ( = ?auto_63609 ?auto_63599 ) ) ( not ( = ?auto_63601 ?auto_63599 ) ) ( not ( = ?auto_63602 ?auto_63599 ) ) ( not ( = ?auto_63607 ?auto_63599 ) ) ( not ( = ?auto_63615 ?auto_63599 ) ) ( not ( = ?auto_63608 ?auto_63597 ) ) ( not ( = ?auto_63598 ?auto_63608 ) ) ( not ( = ?auto_63621 ?auto_63608 ) ) ( not ( = ?auto_63623 ?auto_63608 ) ) ( not ( = ?auto_63612 ?auto_63608 ) ) ( not ( = ?auto_63619 ?auto_63608 ) ) ( HOIST-AT ?auto_63611 ?auto_63608 ) ( not ( = ?auto_63616 ?auto_63611 ) ) ( not ( = ?auto_63618 ?auto_63611 ) ) ( not ( = ?auto_63620 ?auto_63611 ) ) ( not ( = ?auto_63604 ?auto_63611 ) ) ( not ( = ?auto_63600 ?auto_63611 ) ) ( not ( = ?auto_63614 ?auto_63611 ) ) ( AVAILABLE ?auto_63611 ) ( SURFACE-AT ?auto_63607 ?auto_63608 ) ( ON ?auto_63607 ?auto_63613 ) ( CLEAR ?auto_63607 ) ( not ( = ?auto_63595 ?auto_63613 ) ) ( not ( = ?auto_63596 ?auto_63613 ) ) ( not ( = ?auto_63622 ?auto_63613 ) ) ( not ( = ?auto_63603 ?auto_63613 ) ) ( not ( = ?auto_63605 ?auto_63613 ) ) ( not ( = ?auto_63617 ?auto_63613 ) ) ( not ( = ?auto_63609 ?auto_63613 ) ) ( not ( = ?auto_63601 ?auto_63613 ) ) ( not ( = ?auto_63602 ?auto_63613 ) ) ( not ( = ?auto_63607 ?auto_63613 ) ) ( not ( = ?auto_63615 ?auto_63613 ) ) ( not ( = ?auto_63599 ?auto_63613 ) ) ( IS-CRATE ?auto_63599 ) ( not ( = ?auto_63595 ?auto_63606 ) ) ( not ( = ?auto_63596 ?auto_63606 ) ) ( not ( = ?auto_63622 ?auto_63606 ) ) ( not ( = ?auto_63603 ?auto_63606 ) ) ( not ( = ?auto_63605 ?auto_63606 ) ) ( not ( = ?auto_63617 ?auto_63606 ) ) ( not ( = ?auto_63609 ?auto_63606 ) ) ( not ( = ?auto_63601 ?auto_63606 ) ) ( not ( = ?auto_63602 ?auto_63606 ) ) ( not ( = ?auto_63607 ?auto_63606 ) ) ( not ( = ?auto_63615 ?auto_63606 ) ) ( not ( = ?auto_63599 ?auto_63606 ) ) ( not ( = ?auto_63613 ?auto_63606 ) ) ( AVAILABLE ?auto_63620 ) ( SURFACE-AT ?auto_63599 ?auto_63621 ) ( ON ?auto_63599 ?auto_63610 ) ( CLEAR ?auto_63599 ) ( not ( = ?auto_63595 ?auto_63610 ) ) ( not ( = ?auto_63596 ?auto_63610 ) ) ( not ( = ?auto_63622 ?auto_63610 ) ) ( not ( = ?auto_63603 ?auto_63610 ) ) ( not ( = ?auto_63605 ?auto_63610 ) ) ( not ( = ?auto_63617 ?auto_63610 ) ) ( not ( = ?auto_63609 ?auto_63610 ) ) ( not ( = ?auto_63601 ?auto_63610 ) ) ( not ( = ?auto_63602 ?auto_63610 ) ) ( not ( = ?auto_63607 ?auto_63610 ) ) ( not ( = ?auto_63615 ?auto_63610 ) ) ( not ( = ?auto_63599 ?auto_63610 ) ) ( not ( = ?auto_63613 ?auto_63610 ) ) ( not ( = ?auto_63606 ?auto_63610 ) ) ( SURFACE-AT ?auto_63624 ?auto_63597 ) ( CLEAR ?auto_63624 ) ( IS-CRATE ?auto_63606 ) ( not ( = ?auto_63595 ?auto_63624 ) ) ( not ( = ?auto_63596 ?auto_63624 ) ) ( not ( = ?auto_63622 ?auto_63624 ) ) ( not ( = ?auto_63603 ?auto_63624 ) ) ( not ( = ?auto_63605 ?auto_63624 ) ) ( not ( = ?auto_63617 ?auto_63624 ) ) ( not ( = ?auto_63609 ?auto_63624 ) ) ( not ( = ?auto_63601 ?auto_63624 ) ) ( not ( = ?auto_63602 ?auto_63624 ) ) ( not ( = ?auto_63607 ?auto_63624 ) ) ( not ( = ?auto_63615 ?auto_63624 ) ) ( not ( = ?auto_63599 ?auto_63624 ) ) ( not ( = ?auto_63613 ?auto_63624 ) ) ( not ( = ?auto_63606 ?auto_63624 ) ) ( not ( = ?auto_63610 ?auto_63624 ) ) ( AVAILABLE ?auto_63616 ) ( TRUCK-AT ?auto_63625 ?auto_63612 ) ( LIFTING ?auto_63600 ?auto_63606 ) )
    :subtasks
    ( ( !LOAD ?auto_63600 ?auto_63606 ?auto_63625 ?auto_63612 )
      ( MAKE-ON ?auto_63595 ?auto_63596 )
      ( MAKE-ON-VERIFY ?auto_63595 ?auto_63596 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63626 - SURFACE
      ?auto_63627 - SURFACE
    )
    :vars
    (
      ?auto_63645 - HOIST
      ?auto_63655 - PLACE
      ?auto_63633 - PLACE
      ?auto_63647 - HOIST
      ?auto_63637 - SURFACE
      ?auto_63629 - SURFACE
      ?auto_63630 - PLACE
      ?auto_63641 - HOIST
      ?auto_63650 - SURFACE
      ?auto_63646 - SURFACE
      ?auto_63638 - PLACE
      ?auto_63631 - HOIST
      ?auto_63654 - SURFACE
      ?auto_63635 - SURFACE
      ?auto_63649 - PLACE
      ?auto_63636 - HOIST
      ?auto_63628 - SURFACE
      ?auto_63652 - SURFACE
      ?auto_63648 - PLACE
      ?auto_63643 - HOIST
      ?auto_63644 - SURFACE
      ?auto_63634 - SURFACE
      ?auto_63653 - PLACE
      ?auto_63656 - HOIST
      ?auto_63642 - SURFACE
      ?auto_63651 - SURFACE
      ?auto_63632 - SURFACE
      ?auto_63639 - SURFACE
      ?auto_63640 - TRUCK
      ?auto_63657 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63645 ?auto_63655 ) ( IS-CRATE ?auto_63626 ) ( not ( = ?auto_63626 ?auto_63627 ) ) ( not ( = ?auto_63633 ?auto_63655 ) ) ( HOIST-AT ?auto_63647 ?auto_63633 ) ( not ( = ?auto_63645 ?auto_63647 ) ) ( AVAILABLE ?auto_63647 ) ( SURFACE-AT ?auto_63626 ?auto_63633 ) ( ON ?auto_63626 ?auto_63637 ) ( CLEAR ?auto_63626 ) ( not ( = ?auto_63626 ?auto_63637 ) ) ( not ( = ?auto_63627 ?auto_63637 ) ) ( IS-CRATE ?auto_63627 ) ( not ( = ?auto_63626 ?auto_63629 ) ) ( not ( = ?auto_63627 ?auto_63629 ) ) ( not ( = ?auto_63637 ?auto_63629 ) ) ( not ( = ?auto_63630 ?auto_63655 ) ) ( not ( = ?auto_63633 ?auto_63630 ) ) ( HOIST-AT ?auto_63641 ?auto_63630 ) ( not ( = ?auto_63645 ?auto_63641 ) ) ( not ( = ?auto_63647 ?auto_63641 ) ) ( SURFACE-AT ?auto_63627 ?auto_63630 ) ( ON ?auto_63627 ?auto_63650 ) ( CLEAR ?auto_63627 ) ( not ( = ?auto_63626 ?auto_63650 ) ) ( not ( = ?auto_63627 ?auto_63650 ) ) ( not ( = ?auto_63637 ?auto_63650 ) ) ( not ( = ?auto_63629 ?auto_63650 ) ) ( IS-CRATE ?auto_63629 ) ( not ( = ?auto_63626 ?auto_63646 ) ) ( not ( = ?auto_63627 ?auto_63646 ) ) ( not ( = ?auto_63637 ?auto_63646 ) ) ( not ( = ?auto_63629 ?auto_63646 ) ) ( not ( = ?auto_63650 ?auto_63646 ) ) ( not ( = ?auto_63638 ?auto_63655 ) ) ( not ( = ?auto_63633 ?auto_63638 ) ) ( not ( = ?auto_63630 ?auto_63638 ) ) ( HOIST-AT ?auto_63631 ?auto_63638 ) ( not ( = ?auto_63645 ?auto_63631 ) ) ( not ( = ?auto_63647 ?auto_63631 ) ) ( not ( = ?auto_63641 ?auto_63631 ) ) ( AVAILABLE ?auto_63631 ) ( SURFACE-AT ?auto_63629 ?auto_63638 ) ( ON ?auto_63629 ?auto_63654 ) ( CLEAR ?auto_63629 ) ( not ( = ?auto_63626 ?auto_63654 ) ) ( not ( = ?auto_63627 ?auto_63654 ) ) ( not ( = ?auto_63637 ?auto_63654 ) ) ( not ( = ?auto_63629 ?auto_63654 ) ) ( not ( = ?auto_63650 ?auto_63654 ) ) ( not ( = ?auto_63646 ?auto_63654 ) ) ( IS-CRATE ?auto_63646 ) ( not ( = ?auto_63626 ?auto_63635 ) ) ( not ( = ?auto_63627 ?auto_63635 ) ) ( not ( = ?auto_63637 ?auto_63635 ) ) ( not ( = ?auto_63629 ?auto_63635 ) ) ( not ( = ?auto_63650 ?auto_63635 ) ) ( not ( = ?auto_63646 ?auto_63635 ) ) ( not ( = ?auto_63654 ?auto_63635 ) ) ( not ( = ?auto_63649 ?auto_63655 ) ) ( not ( = ?auto_63633 ?auto_63649 ) ) ( not ( = ?auto_63630 ?auto_63649 ) ) ( not ( = ?auto_63638 ?auto_63649 ) ) ( HOIST-AT ?auto_63636 ?auto_63649 ) ( not ( = ?auto_63645 ?auto_63636 ) ) ( not ( = ?auto_63647 ?auto_63636 ) ) ( not ( = ?auto_63641 ?auto_63636 ) ) ( not ( = ?auto_63631 ?auto_63636 ) ) ( SURFACE-AT ?auto_63646 ?auto_63649 ) ( ON ?auto_63646 ?auto_63628 ) ( CLEAR ?auto_63646 ) ( not ( = ?auto_63626 ?auto_63628 ) ) ( not ( = ?auto_63627 ?auto_63628 ) ) ( not ( = ?auto_63637 ?auto_63628 ) ) ( not ( = ?auto_63629 ?auto_63628 ) ) ( not ( = ?auto_63650 ?auto_63628 ) ) ( not ( = ?auto_63646 ?auto_63628 ) ) ( not ( = ?auto_63654 ?auto_63628 ) ) ( not ( = ?auto_63635 ?auto_63628 ) ) ( IS-CRATE ?auto_63635 ) ( not ( = ?auto_63626 ?auto_63652 ) ) ( not ( = ?auto_63627 ?auto_63652 ) ) ( not ( = ?auto_63637 ?auto_63652 ) ) ( not ( = ?auto_63629 ?auto_63652 ) ) ( not ( = ?auto_63650 ?auto_63652 ) ) ( not ( = ?auto_63646 ?auto_63652 ) ) ( not ( = ?auto_63654 ?auto_63652 ) ) ( not ( = ?auto_63635 ?auto_63652 ) ) ( not ( = ?auto_63628 ?auto_63652 ) ) ( not ( = ?auto_63648 ?auto_63655 ) ) ( not ( = ?auto_63633 ?auto_63648 ) ) ( not ( = ?auto_63630 ?auto_63648 ) ) ( not ( = ?auto_63638 ?auto_63648 ) ) ( not ( = ?auto_63649 ?auto_63648 ) ) ( HOIST-AT ?auto_63643 ?auto_63648 ) ( not ( = ?auto_63645 ?auto_63643 ) ) ( not ( = ?auto_63647 ?auto_63643 ) ) ( not ( = ?auto_63641 ?auto_63643 ) ) ( not ( = ?auto_63631 ?auto_63643 ) ) ( not ( = ?auto_63636 ?auto_63643 ) ) ( AVAILABLE ?auto_63643 ) ( SURFACE-AT ?auto_63635 ?auto_63648 ) ( ON ?auto_63635 ?auto_63644 ) ( CLEAR ?auto_63635 ) ( not ( = ?auto_63626 ?auto_63644 ) ) ( not ( = ?auto_63627 ?auto_63644 ) ) ( not ( = ?auto_63637 ?auto_63644 ) ) ( not ( = ?auto_63629 ?auto_63644 ) ) ( not ( = ?auto_63650 ?auto_63644 ) ) ( not ( = ?auto_63646 ?auto_63644 ) ) ( not ( = ?auto_63654 ?auto_63644 ) ) ( not ( = ?auto_63635 ?auto_63644 ) ) ( not ( = ?auto_63628 ?auto_63644 ) ) ( not ( = ?auto_63652 ?auto_63644 ) ) ( IS-CRATE ?auto_63652 ) ( not ( = ?auto_63626 ?auto_63634 ) ) ( not ( = ?auto_63627 ?auto_63634 ) ) ( not ( = ?auto_63637 ?auto_63634 ) ) ( not ( = ?auto_63629 ?auto_63634 ) ) ( not ( = ?auto_63650 ?auto_63634 ) ) ( not ( = ?auto_63646 ?auto_63634 ) ) ( not ( = ?auto_63654 ?auto_63634 ) ) ( not ( = ?auto_63635 ?auto_63634 ) ) ( not ( = ?auto_63628 ?auto_63634 ) ) ( not ( = ?auto_63652 ?auto_63634 ) ) ( not ( = ?auto_63644 ?auto_63634 ) ) ( not ( = ?auto_63653 ?auto_63655 ) ) ( not ( = ?auto_63633 ?auto_63653 ) ) ( not ( = ?auto_63630 ?auto_63653 ) ) ( not ( = ?auto_63638 ?auto_63653 ) ) ( not ( = ?auto_63649 ?auto_63653 ) ) ( not ( = ?auto_63648 ?auto_63653 ) ) ( HOIST-AT ?auto_63656 ?auto_63653 ) ( not ( = ?auto_63645 ?auto_63656 ) ) ( not ( = ?auto_63647 ?auto_63656 ) ) ( not ( = ?auto_63641 ?auto_63656 ) ) ( not ( = ?auto_63631 ?auto_63656 ) ) ( not ( = ?auto_63636 ?auto_63656 ) ) ( not ( = ?auto_63643 ?auto_63656 ) ) ( AVAILABLE ?auto_63656 ) ( SURFACE-AT ?auto_63652 ?auto_63653 ) ( ON ?auto_63652 ?auto_63642 ) ( CLEAR ?auto_63652 ) ( not ( = ?auto_63626 ?auto_63642 ) ) ( not ( = ?auto_63627 ?auto_63642 ) ) ( not ( = ?auto_63637 ?auto_63642 ) ) ( not ( = ?auto_63629 ?auto_63642 ) ) ( not ( = ?auto_63650 ?auto_63642 ) ) ( not ( = ?auto_63646 ?auto_63642 ) ) ( not ( = ?auto_63654 ?auto_63642 ) ) ( not ( = ?auto_63635 ?auto_63642 ) ) ( not ( = ?auto_63628 ?auto_63642 ) ) ( not ( = ?auto_63652 ?auto_63642 ) ) ( not ( = ?auto_63644 ?auto_63642 ) ) ( not ( = ?auto_63634 ?auto_63642 ) ) ( IS-CRATE ?auto_63634 ) ( not ( = ?auto_63626 ?auto_63651 ) ) ( not ( = ?auto_63627 ?auto_63651 ) ) ( not ( = ?auto_63637 ?auto_63651 ) ) ( not ( = ?auto_63629 ?auto_63651 ) ) ( not ( = ?auto_63650 ?auto_63651 ) ) ( not ( = ?auto_63646 ?auto_63651 ) ) ( not ( = ?auto_63654 ?auto_63651 ) ) ( not ( = ?auto_63635 ?auto_63651 ) ) ( not ( = ?auto_63628 ?auto_63651 ) ) ( not ( = ?auto_63652 ?auto_63651 ) ) ( not ( = ?auto_63644 ?auto_63651 ) ) ( not ( = ?auto_63634 ?auto_63651 ) ) ( not ( = ?auto_63642 ?auto_63651 ) ) ( AVAILABLE ?auto_63641 ) ( SURFACE-AT ?auto_63634 ?auto_63630 ) ( ON ?auto_63634 ?auto_63632 ) ( CLEAR ?auto_63634 ) ( not ( = ?auto_63626 ?auto_63632 ) ) ( not ( = ?auto_63627 ?auto_63632 ) ) ( not ( = ?auto_63637 ?auto_63632 ) ) ( not ( = ?auto_63629 ?auto_63632 ) ) ( not ( = ?auto_63650 ?auto_63632 ) ) ( not ( = ?auto_63646 ?auto_63632 ) ) ( not ( = ?auto_63654 ?auto_63632 ) ) ( not ( = ?auto_63635 ?auto_63632 ) ) ( not ( = ?auto_63628 ?auto_63632 ) ) ( not ( = ?auto_63652 ?auto_63632 ) ) ( not ( = ?auto_63644 ?auto_63632 ) ) ( not ( = ?auto_63634 ?auto_63632 ) ) ( not ( = ?auto_63642 ?auto_63632 ) ) ( not ( = ?auto_63651 ?auto_63632 ) ) ( SURFACE-AT ?auto_63639 ?auto_63655 ) ( CLEAR ?auto_63639 ) ( IS-CRATE ?auto_63651 ) ( not ( = ?auto_63626 ?auto_63639 ) ) ( not ( = ?auto_63627 ?auto_63639 ) ) ( not ( = ?auto_63637 ?auto_63639 ) ) ( not ( = ?auto_63629 ?auto_63639 ) ) ( not ( = ?auto_63650 ?auto_63639 ) ) ( not ( = ?auto_63646 ?auto_63639 ) ) ( not ( = ?auto_63654 ?auto_63639 ) ) ( not ( = ?auto_63635 ?auto_63639 ) ) ( not ( = ?auto_63628 ?auto_63639 ) ) ( not ( = ?auto_63652 ?auto_63639 ) ) ( not ( = ?auto_63644 ?auto_63639 ) ) ( not ( = ?auto_63634 ?auto_63639 ) ) ( not ( = ?auto_63642 ?auto_63639 ) ) ( not ( = ?auto_63651 ?auto_63639 ) ) ( not ( = ?auto_63632 ?auto_63639 ) ) ( AVAILABLE ?auto_63645 ) ( TRUCK-AT ?auto_63640 ?auto_63649 ) ( AVAILABLE ?auto_63636 ) ( SURFACE-AT ?auto_63651 ?auto_63649 ) ( ON ?auto_63651 ?auto_63657 ) ( CLEAR ?auto_63651 ) ( not ( = ?auto_63626 ?auto_63657 ) ) ( not ( = ?auto_63627 ?auto_63657 ) ) ( not ( = ?auto_63637 ?auto_63657 ) ) ( not ( = ?auto_63629 ?auto_63657 ) ) ( not ( = ?auto_63650 ?auto_63657 ) ) ( not ( = ?auto_63646 ?auto_63657 ) ) ( not ( = ?auto_63654 ?auto_63657 ) ) ( not ( = ?auto_63635 ?auto_63657 ) ) ( not ( = ?auto_63628 ?auto_63657 ) ) ( not ( = ?auto_63652 ?auto_63657 ) ) ( not ( = ?auto_63644 ?auto_63657 ) ) ( not ( = ?auto_63634 ?auto_63657 ) ) ( not ( = ?auto_63642 ?auto_63657 ) ) ( not ( = ?auto_63651 ?auto_63657 ) ) ( not ( = ?auto_63632 ?auto_63657 ) ) ( not ( = ?auto_63639 ?auto_63657 ) ) )
    :subtasks
    ( ( !LIFT ?auto_63636 ?auto_63651 ?auto_63657 ?auto_63649 )
      ( MAKE-ON ?auto_63626 ?auto_63627 )
      ( MAKE-ON-VERIFY ?auto_63626 ?auto_63627 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63658 - SURFACE
      ?auto_63659 - SURFACE
    )
    :vars
    (
      ?auto_63666 - HOIST
      ?auto_63678 - PLACE
      ?auto_63682 - PLACE
      ?auto_63667 - HOIST
      ?auto_63664 - SURFACE
      ?auto_63673 - SURFACE
      ?auto_63674 - PLACE
      ?auto_63685 - HOIST
      ?auto_63670 - SURFACE
      ?auto_63665 - SURFACE
      ?auto_63683 - PLACE
      ?auto_63680 - HOIST
      ?auto_63677 - SURFACE
      ?auto_63684 - SURFACE
      ?auto_63669 - PLACE
      ?auto_63663 - HOIST
      ?auto_63672 - SURFACE
      ?auto_63675 - SURFACE
      ?auto_63668 - PLACE
      ?auto_63671 - HOIST
      ?auto_63660 - SURFACE
      ?auto_63688 - SURFACE
      ?auto_63676 - PLACE
      ?auto_63679 - HOIST
      ?auto_63687 - SURFACE
      ?auto_63661 - SURFACE
      ?auto_63681 - SURFACE
      ?auto_63686 - SURFACE
      ?auto_63689 - SURFACE
      ?auto_63662 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63666 ?auto_63678 ) ( IS-CRATE ?auto_63658 ) ( not ( = ?auto_63658 ?auto_63659 ) ) ( not ( = ?auto_63682 ?auto_63678 ) ) ( HOIST-AT ?auto_63667 ?auto_63682 ) ( not ( = ?auto_63666 ?auto_63667 ) ) ( AVAILABLE ?auto_63667 ) ( SURFACE-AT ?auto_63658 ?auto_63682 ) ( ON ?auto_63658 ?auto_63664 ) ( CLEAR ?auto_63658 ) ( not ( = ?auto_63658 ?auto_63664 ) ) ( not ( = ?auto_63659 ?auto_63664 ) ) ( IS-CRATE ?auto_63659 ) ( not ( = ?auto_63658 ?auto_63673 ) ) ( not ( = ?auto_63659 ?auto_63673 ) ) ( not ( = ?auto_63664 ?auto_63673 ) ) ( not ( = ?auto_63674 ?auto_63678 ) ) ( not ( = ?auto_63682 ?auto_63674 ) ) ( HOIST-AT ?auto_63685 ?auto_63674 ) ( not ( = ?auto_63666 ?auto_63685 ) ) ( not ( = ?auto_63667 ?auto_63685 ) ) ( SURFACE-AT ?auto_63659 ?auto_63674 ) ( ON ?auto_63659 ?auto_63670 ) ( CLEAR ?auto_63659 ) ( not ( = ?auto_63658 ?auto_63670 ) ) ( not ( = ?auto_63659 ?auto_63670 ) ) ( not ( = ?auto_63664 ?auto_63670 ) ) ( not ( = ?auto_63673 ?auto_63670 ) ) ( IS-CRATE ?auto_63673 ) ( not ( = ?auto_63658 ?auto_63665 ) ) ( not ( = ?auto_63659 ?auto_63665 ) ) ( not ( = ?auto_63664 ?auto_63665 ) ) ( not ( = ?auto_63673 ?auto_63665 ) ) ( not ( = ?auto_63670 ?auto_63665 ) ) ( not ( = ?auto_63683 ?auto_63678 ) ) ( not ( = ?auto_63682 ?auto_63683 ) ) ( not ( = ?auto_63674 ?auto_63683 ) ) ( HOIST-AT ?auto_63680 ?auto_63683 ) ( not ( = ?auto_63666 ?auto_63680 ) ) ( not ( = ?auto_63667 ?auto_63680 ) ) ( not ( = ?auto_63685 ?auto_63680 ) ) ( AVAILABLE ?auto_63680 ) ( SURFACE-AT ?auto_63673 ?auto_63683 ) ( ON ?auto_63673 ?auto_63677 ) ( CLEAR ?auto_63673 ) ( not ( = ?auto_63658 ?auto_63677 ) ) ( not ( = ?auto_63659 ?auto_63677 ) ) ( not ( = ?auto_63664 ?auto_63677 ) ) ( not ( = ?auto_63673 ?auto_63677 ) ) ( not ( = ?auto_63670 ?auto_63677 ) ) ( not ( = ?auto_63665 ?auto_63677 ) ) ( IS-CRATE ?auto_63665 ) ( not ( = ?auto_63658 ?auto_63684 ) ) ( not ( = ?auto_63659 ?auto_63684 ) ) ( not ( = ?auto_63664 ?auto_63684 ) ) ( not ( = ?auto_63673 ?auto_63684 ) ) ( not ( = ?auto_63670 ?auto_63684 ) ) ( not ( = ?auto_63665 ?auto_63684 ) ) ( not ( = ?auto_63677 ?auto_63684 ) ) ( not ( = ?auto_63669 ?auto_63678 ) ) ( not ( = ?auto_63682 ?auto_63669 ) ) ( not ( = ?auto_63674 ?auto_63669 ) ) ( not ( = ?auto_63683 ?auto_63669 ) ) ( HOIST-AT ?auto_63663 ?auto_63669 ) ( not ( = ?auto_63666 ?auto_63663 ) ) ( not ( = ?auto_63667 ?auto_63663 ) ) ( not ( = ?auto_63685 ?auto_63663 ) ) ( not ( = ?auto_63680 ?auto_63663 ) ) ( SURFACE-AT ?auto_63665 ?auto_63669 ) ( ON ?auto_63665 ?auto_63672 ) ( CLEAR ?auto_63665 ) ( not ( = ?auto_63658 ?auto_63672 ) ) ( not ( = ?auto_63659 ?auto_63672 ) ) ( not ( = ?auto_63664 ?auto_63672 ) ) ( not ( = ?auto_63673 ?auto_63672 ) ) ( not ( = ?auto_63670 ?auto_63672 ) ) ( not ( = ?auto_63665 ?auto_63672 ) ) ( not ( = ?auto_63677 ?auto_63672 ) ) ( not ( = ?auto_63684 ?auto_63672 ) ) ( IS-CRATE ?auto_63684 ) ( not ( = ?auto_63658 ?auto_63675 ) ) ( not ( = ?auto_63659 ?auto_63675 ) ) ( not ( = ?auto_63664 ?auto_63675 ) ) ( not ( = ?auto_63673 ?auto_63675 ) ) ( not ( = ?auto_63670 ?auto_63675 ) ) ( not ( = ?auto_63665 ?auto_63675 ) ) ( not ( = ?auto_63677 ?auto_63675 ) ) ( not ( = ?auto_63684 ?auto_63675 ) ) ( not ( = ?auto_63672 ?auto_63675 ) ) ( not ( = ?auto_63668 ?auto_63678 ) ) ( not ( = ?auto_63682 ?auto_63668 ) ) ( not ( = ?auto_63674 ?auto_63668 ) ) ( not ( = ?auto_63683 ?auto_63668 ) ) ( not ( = ?auto_63669 ?auto_63668 ) ) ( HOIST-AT ?auto_63671 ?auto_63668 ) ( not ( = ?auto_63666 ?auto_63671 ) ) ( not ( = ?auto_63667 ?auto_63671 ) ) ( not ( = ?auto_63685 ?auto_63671 ) ) ( not ( = ?auto_63680 ?auto_63671 ) ) ( not ( = ?auto_63663 ?auto_63671 ) ) ( AVAILABLE ?auto_63671 ) ( SURFACE-AT ?auto_63684 ?auto_63668 ) ( ON ?auto_63684 ?auto_63660 ) ( CLEAR ?auto_63684 ) ( not ( = ?auto_63658 ?auto_63660 ) ) ( not ( = ?auto_63659 ?auto_63660 ) ) ( not ( = ?auto_63664 ?auto_63660 ) ) ( not ( = ?auto_63673 ?auto_63660 ) ) ( not ( = ?auto_63670 ?auto_63660 ) ) ( not ( = ?auto_63665 ?auto_63660 ) ) ( not ( = ?auto_63677 ?auto_63660 ) ) ( not ( = ?auto_63684 ?auto_63660 ) ) ( not ( = ?auto_63672 ?auto_63660 ) ) ( not ( = ?auto_63675 ?auto_63660 ) ) ( IS-CRATE ?auto_63675 ) ( not ( = ?auto_63658 ?auto_63688 ) ) ( not ( = ?auto_63659 ?auto_63688 ) ) ( not ( = ?auto_63664 ?auto_63688 ) ) ( not ( = ?auto_63673 ?auto_63688 ) ) ( not ( = ?auto_63670 ?auto_63688 ) ) ( not ( = ?auto_63665 ?auto_63688 ) ) ( not ( = ?auto_63677 ?auto_63688 ) ) ( not ( = ?auto_63684 ?auto_63688 ) ) ( not ( = ?auto_63672 ?auto_63688 ) ) ( not ( = ?auto_63675 ?auto_63688 ) ) ( not ( = ?auto_63660 ?auto_63688 ) ) ( not ( = ?auto_63676 ?auto_63678 ) ) ( not ( = ?auto_63682 ?auto_63676 ) ) ( not ( = ?auto_63674 ?auto_63676 ) ) ( not ( = ?auto_63683 ?auto_63676 ) ) ( not ( = ?auto_63669 ?auto_63676 ) ) ( not ( = ?auto_63668 ?auto_63676 ) ) ( HOIST-AT ?auto_63679 ?auto_63676 ) ( not ( = ?auto_63666 ?auto_63679 ) ) ( not ( = ?auto_63667 ?auto_63679 ) ) ( not ( = ?auto_63685 ?auto_63679 ) ) ( not ( = ?auto_63680 ?auto_63679 ) ) ( not ( = ?auto_63663 ?auto_63679 ) ) ( not ( = ?auto_63671 ?auto_63679 ) ) ( AVAILABLE ?auto_63679 ) ( SURFACE-AT ?auto_63675 ?auto_63676 ) ( ON ?auto_63675 ?auto_63687 ) ( CLEAR ?auto_63675 ) ( not ( = ?auto_63658 ?auto_63687 ) ) ( not ( = ?auto_63659 ?auto_63687 ) ) ( not ( = ?auto_63664 ?auto_63687 ) ) ( not ( = ?auto_63673 ?auto_63687 ) ) ( not ( = ?auto_63670 ?auto_63687 ) ) ( not ( = ?auto_63665 ?auto_63687 ) ) ( not ( = ?auto_63677 ?auto_63687 ) ) ( not ( = ?auto_63684 ?auto_63687 ) ) ( not ( = ?auto_63672 ?auto_63687 ) ) ( not ( = ?auto_63675 ?auto_63687 ) ) ( not ( = ?auto_63660 ?auto_63687 ) ) ( not ( = ?auto_63688 ?auto_63687 ) ) ( IS-CRATE ?auto_63688 ) ( not ( = ?auto_63658 ?auto_63661 ) ) ( not ( = ?auto_63659 ?auto_63661 ) ) ( not ( = ?auto_63664 ?auto_63661 ) ) ( not ( = ?auto_63673 ?auto_63661 ) ) ( not ( = ?auto_63670 ?auto_63661 ) ) ( not ( = ?auto_63665 ?auto_63661 ) ) ( not ( = ?auto_63677 ?auto_63661 ) ) ( not ( = ?auto_63684 ?auto_63661 ) ) ( not ( = ?auto_63672 ?auto_63661 ) ) ( not ( = ?auto_63675 ?auto_63661 ) ) ( not ( = ?auto_63660 ?auto_63661 ) ) ( not ( = ?auto_63688 ?auto_63661 ) ) ( not ( = ?auto_63687 ?auto_63661 ) ) ( AVAILABLE ?auto_63685 ) ( SURFACE-AT ?auto_63688 ?auto_63674 ) ( ON ?auto_63688 ?auto_63681 ) ( CLEAR ?auto_63688 ) ( not ( = ?auto_63658 ?auto_63681 ) ) ( not ( = ?auto_63659 ?auto_63681 ) ) ( not ( = ?auto_63664 ?auto_63681 ) ) ( not ( = ?auto_63673 ?auto_63681 ) ) ( not ( = ?auto_63670 ?auto_63681 ) ) ( not ( = ?auto_63665 ?auto_63681 ) ) ( not ( = ?auto_63677 ?auto_63681 ) ) ( not ( = ?auto_63684 ?auto_63681 ) ) ( not ( = ?auto_63672 ?auto_63681 ) ) ( not ( = ?auto_63675 ?auto_63681 ) ) ( not ( = ?auto_63660 ?auto_63681 ) ) ( not ( = ?auto_63688 ?auto_63681 ) ) ( not ( = ?auto_63687 ?auto_63681 ) ) ( not ( = ?auto_63661 ?auto_63681 ) ) ( SURFACE-AT ?auto_63686 ?auto_63678 ) ( CLEAR ?auto_63686 ) ( IS-CRATE ?auto_63661 ) ( not ( = ?auto_63658 ?auto_63686 ) ) ( not ( = ?auto_63659 ?auto_63686 ) ) ( not ( = ?auto_63664 ?auto_63686 ) ) ( not ( = ?auto_63673 ?auto_63686 ) ) ( not ( = ?auto_63670 ?auto_63686 ) ) ( not ( = ?auto_63665 ?auto_63686 ) ) ( not ( = ?auto_63677 ?auto_63686 ) ) ( not ( = ?auto_63684 ?auto_63686 ) ) ( not ( = ?auto_63672 ?auto_63686 ) ) ( not ( = ?auto_63675 ?auto_63686 ) ) ( not ( = ?auto_63660 ?auto_63686 ) ) ( not ( = ?auto_63688 ?auto_63686 ) ) ( not ( = ?auto_63687 ?auto_63686 ) ) ( not ( = ?auto_63661 ?auto_63686 ) ) ( not ( = ?auto_63681 ?auto_63686 ) ) ( AVAILABLE ?auto_63666 ) ( AVAILABLE ?auto_63663 ) ( SURFACE-AT ?auto_63661 ?auto_63669 ) ( ON ?auto_63661 ?auto_63689 ) ( CLEAR ?auto_63661 ) ( not ( = ?auto_63658 ?auto_63689 ) ) ( not ( = ?auto_63659 ?auto_63689 ) ) ( not ( = ?auto_63664 ?auto_63689 ) ) ( not ( = ?auto_63673 ?auto_63689 ) ) ( not ( = ?auto_63670 ?auto_63689 ) ) ( not ( = ?auto_63665 ?auto_63689 ) ) ( not ( = ?auto_63677 ?auto_63689 ) ) ( not ( = ?auto_63684 ?auto_63689 ) ) ( not ( = ?auto_63672 ?auto_63689 ) ) ( not ( = ?auto_63675 ?auto_63689 ) ) ( not ( = ?auto_63660 ?auto_63689 ) ) ( not ( = ?auto_63688 ?auto_63689 ) ) ( not ( = ?auto_63687 ?auto_63689 ) ) ( not ( = ?auto_63661 ?auto_63689 ) ) ( not ( = ?auto_63681 ?auto_63689 ) ) ( not ( = ?auto_63686 ?auto_63689 ) ) ( TRUCK-AT ?auto_63662 ?auto_63678 ) )
    :subtasks
    ( ( !DRIVE ?auto_63662 ?auto_63678 ?auto_63669 )
      ( MAKE-ON ?auto_63658 ?auto_63659 )
      ( MAKE-ON-VERIFY ?auto_63658 ?auto_63659 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63690 - SURFACE
      ?auto_63691 - SURFACE
    )
    :vars
    (
      ?auto_63720 - HOIST
      ?auto_63708 - PLACE
      ?auto_63712 - PLACE
      ?auto_63699 - HOIST
      ?auto_63703 - SURFACE
      ?auto_63697 - SURFACE
      ?auto_63715 - PLACE
      ?auto_63694 - HOIST
      ?auto_63700 - SURFACE
      ?auto_63717 - SURFACE
      ?auto_63705 - PLACE
      ?auto_63710 - HOIST
      ?auto_63707 - SURFACE
      ?auto_63693 - SURFACE
      ?auto_63719 - PLACE
      ?auto_63718 - HOIST
      ?auto_63714 - SURFACE
      ?auto_63713 - SURFACE
      ?auto_63721 - PLACE
      ?auto_63716 - HOIST
      ?auto_63702 - SURFACE
      ?auto_63692 - SURFACE
      ?auto_63706 - PLACE
      ?auto_63709 - HOIST
      ?auto_63698 - SURFACE
      ?auto_63701 - SURFACE
      ?auto_63711 - SURFACE
      ?auto_63695 - SURFACE
      ?auto_63704 - SURFACE
      ?auto_63696 - TRUCK
      ?auto_63722 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63720 ?auto_63708 ) ( IS-CRATE ?auto_63690 ) ( not ( = ?auto_63690 ?auto_63691 ) ) ( not ( = ?auto_63712 ?auto_63708 ) ) ( HOIST-AT ?auto_63699 ?auto_63712 ) ( not ( = ?auto_63720 ?auto_63699 ) ) ( AVAILABLE ?auto_63699 ) ( SURFACE-AT ?auto_63690 ?auto_63712 ) ( ON ?auto_63690 ?auto_63703 ) ( CLEAR ?auto_63690 ) ( not ( = ?auto_63690 ?auto_63703 ) ) ( not ( = ?auto_63691 ?auto_63703 ) ) ( IS-CRATE ?auto_63691 ) ( not ( = ?auto_63690 ?auto_63697 ) ) ( not ( = ?auto_63691 ?auto_63697 ) ) ( not ( = ?auto_63703 ?auto_63697 ) ) ( not ( = ?auto_63715 ?auto_63708 ) ) ( not ( = ?auto_63712 ?auto_63715 ) ) ( HOIST-AT ?auto_63694 ?auto_63715 ) ( not ( = ?auto_63720 ?auto_63694 ) ) ( not ( = ?auto_63699 ?auto_63694 ) ) ( SURFACE-AT ?auto_63691 ?auto_63715 ) ( ON ?auto_63691 ?auto_63700 ) ( CLEAR ?auto_63691 ) ( not ( = ?auto_63690 ?auto_63700 ) ) ( not ( = ?auto_63691 ?auto_63700 ) ) ( not ( = ?auto_63703 ?auto_63700 ) ) ( not ( = ?auto_63697 ?auto_63700 ) ) ( IS-CRATE ?auto_63697 ) ( not ( = ?auto_63690 ?auto_63717 ) ) ( not ( = ?auto_63691 ?auto_63717 ) ) ( not ( = ?auto_63703 ?auto_63717 ) ) ( not ( = ?auto_63697 ?auto_63717 ) ) ( not ( = ?auto_63700 ?auto_63717 ) ) ( not ( = ?auto_63705 ?auto_63708 ) ) ( not ( = ?auto_63712 ?auto_63705 ) ) ( not ( = ?auto_63715 ?auto_63705 ) ) ( HOIST-AT ?auto_63710 ?auto_63705 ) ( not ( = ?auto_63720 ?auto_63710 ) ) ( not ( = ?auto_63699 ?auto_63710 ) ) ( not ( = ?auto_63694 ?auto_63710 ) ) ( AVAILABLE ?auto_63710 ) ( SURFACE-AT ?auto_63697 ?auto_63705 ) ( ON ?auto_63697 ?auto_63707 ) ( CLEAR ?auto_63697 ) ( not ( = ?auto_63690 ?auto_63707 ) ) ( not ( = ?auto_63691 ?auto_63707 ) ) ( not ( = ?auto_63703 ?auto_63707 ) ) ( not ( = ?auto_63697 ?auto_63707 ) ) ( not ( = ?auto_63700 ?auto_63707 ) ) ( not ( = ?auto_63717 ?auto_63707 ) ) ( IS-CRATE ?auto_63717 ) ( not ( = ?auto_63690 ?auto_63693 ) ) ( not ( = ?auto_63691 ?auto_63693 ) ) ( not ( = ?auto_63703 ?auto_63693 ) ) ( not ( = ?auto_63697 ?auto_63693 ) ) ( not ( = ?auto_63700 ?auto_63693 ) ) ( not ( = ?auto_63717 ?auto_63693 ) ) ( not ( = ?auto_63707 ?auto_63693 ) ) ( not ( = ?auto_63719 ?auto_63708 ) ) ( not ( = ?auto_63712 ?auto_63719 ) ) ( not ( = ?auto_63715 ?auto_63719 ) ) ( not ( = ?auto_63705 ?auto_63719 ) ) ( HOIST-AT ?auto_63718 ?auto_63719 ) ( not ( = ?auto_63720 ?auto_63718 ) ) ( not ( = ?auto_63699 ?auto_63718 ) ) ( not ( = ?auto_63694 ?auto_63718 ) ) ( not ( = ?auto_63710 ?auto_63718 ) ) ( SURFACE-AT ?auto_63717 ?auto_63719 ) ( ON ?auto_63717 ?auto_63714 ) ( CLEAR ?auto_63717 ) ( not ( = ?auto_63690 ?auto_63714 ) ) ( not ( = ?auto_63691 ?auto_63714 ) ) ( not ( = ?auto_63703 ?auto_63714 ) ) ( not ( = ?auto_63697 ?auto_63714 ) ) ( not ( = ?auto_63700 ?auto_63714 ) ) ( not ( = ?auto_63717 ?auto_63714 ) ) ( not ( = ?auto_63707 ?auto_63714 ) ) ( not ( = ?auto_63693 ?auto_63714 ) ) ( IS-CRATE ?auto_63693 ) ( not ( = ?auto_63690 ?auto_63713 ) ) ( not ( = ?auto_63691 ?auto_63713 ) ) ( not ( = ?auto_63703 ?auto_63713 ) ) ( not ( = ?auto_63697 ?auto_63713 ) ) ( not ( = ?auto_63700 ?auto_63713 ) ) ( not ( = ?auto_63717 ?auto_63713 ) ) ( not ( = ?auto_63707 ?auto_63713 ) ) ( not ( = ?auto_63693 ?auto_63713 ) ) ( not ( = ?auto_63714 ?auto_63713 ) ) ( not ( = ?auto_63721 ?auto_63708 ) ) ( not ( = ?auto_63712 ?auto_63721 ) ) ( not ( = ?auto_63715 ?auto_63721 ) ) ( not ( = ?auto_63705 ?auto_63721 ) ) ( not ( = ?auto_63719 ?auto_63721 ) ) ( HOIST-AT ?auto_63716 ?auto_63721 ) ( not ( = ?auto_63720 ?auto_63716 ) ) ( not ( = ?auto_63699 ?auto_63716 ) ) ( not ( = ?auto_63694 ?auto_63716 ) ) ( not ( = ?auto_63710 ?auto_63716 ) ) ( not ( = ?auto_63718 ?auto_63716 ) ) ( AVAILABLE ?auto_63716 ) ( SURFACE-AT ?auto_63693 ?auto_63721 ) ( ON ?auto_63693 ?auto_63702 ) ( CLEAR ?auto_63693 ) ( not ( = ?auto_63690 ?auto_63702 ) ) ( not ( = ?auto_63691 ?auto_63702 ) ) ( not ( = ?auto_63703 ?auto_63702 ) ) ( not ( = ?auto_63697 ?auto_63702 ) ) ( not ( = ?auto_63700 ?auto_63702 ) ) ( not ( = ?auto_63717 ?auto_63702 ) ) ( not ( = ?auto_63707 ?auto_63702 ) ) ( not ( = ?auto_63693 ?auto_63702 ) ) ( not ( = ?auto_63714 ?auto_63702 ) ) ( not ( = ?auto_63713 ?auto_63702 ) ) ( IS-CRATE ?auto_63713 ) ( not ( = ?auto_63690 ?auto_63692 ) ) ( not ( = ?auto_63691 ?auto_63692 ) ) ( not ( = ?auto_63703 ?auto_63692 ) ) ( not ( = ?auto_63697 ?auto_63692 ) ) ( not ( = ?auto_63700 ?auto_63692 ) ) ( not ( = ?auto_63717 ?auto_63692 ) ) ( not ( = ?auto_63707 ?auto_63692 ) ) ( not ( = ?auto_63693 ?auto_63692 ) ) ( not ( = ?auto_63714 ?auto_63692 ) ) ( not ( = ?auto_63713 ?auto_63692 ) ) ( not ( = ?auto_63702 ?auto_63692 ) ) ( not ( = ?auto_63706 ?auto_63708 ) ) ( not ( = ?auto_63712 ?auto_63706 ) ) ( not ( = ?auto_63715 ?auto_63706 ) ) ( not ( = ?auto_63705 ?auto_63706 ) ) ( not ( = ?auto_63719 ?auto_63706 ) ) ( not ( = ?auto_63721 ?auto_63706 ) ) ( HOIST-AT ?auto_63709 ?auto_63706 ) ( not ( = ?auto_63720 ?auto_63709 ) ) ( not ( = ?auto_63699 ?auto_63709 ) ) ( not ( = ?auto_63694 ?auto_63709 ) ) ( not ( = ?auto_63710 ?auto_63709 ) ) ( not ( = ?auto_63718 ?auto_63709 ) ) ( not ( = ?auto_63716 ?auto_63709 ) ) ( AVAILABLE ?auto_63709 ) ( SURFACE-AT ?auto_63713 ?auto_63706 ) ( ON ?auto_63713 ?auto_63698 ) ( CLEAR ?auto_63713 ) ( not ( = ?auto_63690 ?auto_63698 ) ) ( not ( = ?auto_63691 ?auto_63698 ) ) ( not ( = ?auto_63703 ?auto_63698 ) ) ( not ( = ?auto_63697 ?auto_63698 ) ) ( not ( = ?auto_63700 ?auto_63698 ) ) ( not ( = ?auto_63717 ?auto_63698 ) ) ( not ( = ?auto_63707 ?auto_63698 ) ) ( not ( = ?auto_63693 ?auto_63698 ) ) ( not ( = ?auto_63714 ?auto_63698 ) ) ( not ( = ?auto_63713 ?auto_63698 ) ) ( not ( = ?auto_63702 ?auto_63698 ) ) ( not ( = ?auto_63692 ?auto_63698 ) ) ( IS-CRATE ?auto_63692 ) ( not ( = ?auto_63690 ?auto_63701 ) ) ( not ( = ?auto_63691 ?auto_63701 ) ) ( not ( = ?auto_63703 ?auto_63701 ) ) ( not ( = ?auto_63697 ?auto_63701 ) ) ( not ( = ?auto_63700 ?auto_63701 ) ) ( not ( = ?auto_63717 ?auto_63701 ) ) ( not ( = ?auto_63707 ?auto_63701 ) ) ( not ( = ?auto_63693 ?auto_63701 ) ) ( not ( = ?auto_63714 ?auto_63701 ) ) ( not ( = ?auto_63713 ?auto_63701 ) ) ( not ( = ?auto_63702 ?auto_63701 ) ) ( not ( = ?auto_63692 ?auto_63701 ) ) ( not ( = ?auto_63698 ?auto_63701 ) ) ( AVAILABLE ?auto_63694 ) ( SURFACE-AT ?auto_63692 ?auto_63715 ) ( ON ?auto_63692 ?auto_63711 ) ( CLEAR ?auto_63692 ) ( not ( = ?auto_63690 ?auto_63711 ) ) ( not ( = ?auto_63691 ?auto_63711 ) ) ( not ( = ?auto_63703 ?auto_63711 ) ) ( not ( = ?auto_63697 ?auto_63711 ) ) ( not ( = ?auto_63700 ?auto_63711 ) ) ( not ( = ?auto_63717 ?auto_63711 ) ) ( not ( = ?auto_63707 ?auto_63711 ) ) ( not ( = ?auto_63693 ?auto_63711 ) ) ( not ( = ?auto_63714 ?auto_63711 ) ) ( not ( = ?auto_63713 ?auto_63711 ) ) ( not ( = ?auto_63702 ?auto_63711 ) ) ( not ( = ?auto_63692 ?auto_63711 ) ) ( not ( = ?auto_63698 ?auto_63711 ) ) ( not ( = ?auto_63701 ?auto_63711 ) ) ( IS-CRATE ?auto_63701 ) ( not ( = ?auto_63690 ?auto_63695 ) ) ( not ( = ?auto_63691 ?auto_63695 ) ) ( not ( = ?auto_63703 ?auto_63695 ) ) ( not ( = ?auto_63697 ?auto_63695 ) ) ( not ( = ?auto_63700 ?auto_63695 ) ) ( not ( = ?auto_63717 ?auto_63695 ) ) ( not ( = ?auto_63707 ?auto_63695 ) ) ( not ( = ?auto_63693 ?auto_63695 ) ) ( not ( = ?auto_63714 ?auto_63695 ) ) ( not ( = ?auto_63713 ?auto_63695 ) ) ( not ( = ?auto_63702 ?auto_63695 ) ) ( not ( = ?auto_63692 ?auto_63695 ) ) ( not ( = ?auto_63698 ?auto_63695 ) ) ( not ( = ?auto_63701 ?auto_63695 ) ) ( not ( = ?auto_63711 ?auto_63695 ) ) ( AVAILABLE ?auto_63718 ) ( SURFACE-AT ?auto_63701 ?auto_63719 ) ( ON ?auto_63701 ?auto_63704 ) ( CLEAR ?auto_63701 ) ( not ( = ?auto_63690 ?auto_63704 ) ) ( not ( = ?auto_63691 ?auto_63704 ) ) ( not ( = ?auto_63703 ?auto_63704 ) ) ( not ( = ?auto_63697 ?auto_63704 ) ) ( not ( = ?auto_63700 ?auto_63704 ) ) ( not ( = ?auto_63717 ?auto_63704 ) ) ( not ( = ?auto_63707 ?auto_63704 ) ) ( not ( = ?auto_63693 ?auto_63704 ) ) ( not ( = ?auto_63714 ?auto_63704 ) ) ( not ( = ?auto_63713 ?auto_63704 ) ) ( not ( = ?auto_63702 ?auto_63704 ) ) ( not ( = ?auto_63692 ?auto_63704 ) ) ( not ( = ?auto_63698 ?auto_63704 ) ) ( not ( = ?auto_63701 ?auto_63704 ) ) ( not ( = ?auto_63711 ?auto_63704 ) ) ( not ( = ?auto_63695 ?auto_63704 ) ) ( TRUCK-AT ?auto_63696 ?auto_63708 ) ( SURFACE-AT ?auto_63722 ?auto_63708 ) ( CLEAR ?auto_63722 ) ( LIFTING ?auto_63720 ?auto_63695 ) ( IS-CRATE ?auto_63695 ) ( not ( = ?auto_63690 ?auto_63722 ) ) ( not ( = ?auto_63691 ?auto_63722 ) ) ( not ( = ?auto_63703 ?auto_63722 ) ) ( not ( = ?auto_63697 ?auto_63722 ) ) ( not ( = ?auto_63700 ?auto_63722 ) ) ( not ( = ?auto_63717 ?auto_63722 ) ) ( not ( = ?auto_63707 ?auto_63722 ) ) ( not ( = ?auto_63693 ?auto_63722 ) ) ( not ( = ?auto_63714 ?auto_63722 ) ) ( not ( = ?auto_63713 ?auto_63722 ) ) ( not ( = ?auto_63702 ?auto_63722 ) ) ( not ( = ?auto_63692 ?auto_63722 ) ) ( not ( = ?auto_63698 ?auto_63722 ) ) ( not ( = ?auto_63701 ?auto_63722 ) ) ( not ( = ?auto_63711 ?auto_63722 ) ) ( not ( = ?auto_63695 ?auto_63722 ) ) ( not ( = ?auto_63704 ?auto_63722 ) ) )
    :subtasks
    ( ( !DROP ?auto_63720 ?auto_63695 ?auto_63722 ?auto_63708 )
      ( MAKE-ON ?auto_63690 ?auto_63691 )
      ( MAKE-ON-VERIFY ?auto_63690 ?auto_63691 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63723 - SURFACE
      ?auto_63724 - SURFACE
    )
    :vars
    (
      ?auto_63726 - HOIST
      ?auto_63730 - PLACE
      ?auto_63742 - PLACE
      ?auto_63750 - HOIST
      ?auto_63736 - SURFACE
      ?auto_63733 - SURFACE
      ?auto_63729 - PLACE
      ?auto_63738 - HOIST
      ?auto_63751 - SURFACE
      ?auto_63755 - SURFACE
      ?auto_63739 - PLACE
      ?auto_63740 - HOIST
      ?auto_63745 - SURFACE
      ?auto_63735 - SURFACE
      ?auto_63727 - PLACE
      ?auto_63728 - HOIST
      ?auto_63744 - SURFACE
      ?auto_63743 - SURFACE
      ?auto_63725 - PLACE
      ?auto_63754 - HOIST
      ?auto_63734 - SURFACE
      ?auto_63752 - SURFACE
      ?auto_63748 - PLACE
      ?auto_63731 - HOIST
      ?auto_63746 - SURFACE
      ?auto_63737 - SURFACE
      ?auto_63741 - SURFACE
      ?auto_63732 - SURFACE
      ?auto_63749 - SURFACE
      ?auto_63747 - TRUCK
      ?auto_63753 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63726 ?auto_63730 ) ( IS-CRATE ?auto_63723 ) ( not ( = ?auto_63723 ?auto_63724 ) ) ( not ( = ?auto_63742 ?auto_63730 ) ) ( HOIST-AT ?auto_63750 ?auto_63742 ) ( not ( = ?auto_63726 ?auto_63750 ) ) ( AVAILABLE ?auto_63750 ) ( SURFACE-AT ?auto_63723 ?auto_63742 ) ( ON ?auto_63723 ?auto_63736 ) ( CLEAR ?auto_63723 ) ( not ( = ?auto_63723 ?auto_63736 ) ) ( not ( = ?auto_63724 ?auto_63736 ) ) ( IS-CRATE ?auto_63724 ) ( not ( = ?auto_63723 ?auto_63733 ) ) ( not ( = ?auto_63724 ?auto_63733 ) ) ( not ( = ?auto_63736 ?auto_63733 ) ) ( not ( = ?auto_63729 ?auto_63730 ) ) ( not ( = ?auto_63742 ?auto_63729 ) ) ( HOIST-AT ?auto_63738 ?auto_63729 ) ( not ( = ?auto_63726 ?auto_63738 ) ) ( not ( = ?auto_63750 ?auto_63738 ) ) ( SURFACE-AT ?auto_63724 ?auto_63729 ) ( ON ?auto_63724 ?auto_63751 ) ( CLEAR ?auto_63724 ) ( not ( = ?auto_63723 ?auto_63751 ) ) ( not ( = ?auto_63724 ?auto_63751 ) ) ( not ( = ?auto_63736 ?auto_63751 ) ) ( not ( = ?auto_63733 ?auto_63751 ) ) ( IS-CRATE ?auto_63733 ) ( not ( = ?auto_63723 ?auto_63755 ) ) ( not ( = ?auto_63724 ?auto_63755 ) ) ( not ( = ?auto_63736 ?auto_63755 ) ) ( not ( = ?auto_63733 ?auto_63755 ) ) ( not ( = ?auto_63751 ?auto_63755 ) ) ( not ( = ?auto_63739 ?auto_63730 ) ) ( not ( = ?auto_63742 ?auto_63739 ) ) ( not ( = ?auto_63729 ?auto_63739 ) ) ( HOIST-AT ?auto_63740 ?auto_63739 ) ( not ( = ?auto_63726 ?auto_63740 ) ) ( not ( = ?auto_63750 ?auto_63740 ) ) ( not ( = ?auto_63738 ?auto_63740 ) ) ( AVAILABLE ?auto_63740 ) ( SURFACE-AT ?auto_63733 ?auto_63739 ) ( ON ?auto_63733 ?auto_63745 ) ( CLEAR ?auto_63733 ) ( not ( = ?auto_63723 ?auto_63745 ) ) ( not ( = ?auto_63724 ?auto_63745 ) ) ( not ( = ?auto_63736 ?auto_63745 ) ) ( not ( = ?auto_63733 ?auto_63745 ) ) ( not ( = ?auto_63751 ?auto_63745 ) ) ( not ( = ?auto_63755 ?auto_63745 ) ) ( IS-CRATE ?auto_63755 ) ( not ( = ?auto_63723 ?auto_63735 ) ) ( not ( = ?auto_63724 ?auto_63735 ) ) ( not ( = ?auto_63736 ?auto_63735 ) ) ( not ( = ?auto_63733 ?auto_63735 ) ) ( not ( = ?auto_63751 ?auto_63735 ) ) ( not ( = ?auto_63755 ?auto_63735 ) ) ( not ( = ?auto_63745 ?auto_63735 ) ) ( not ( = ?auto_63727 ?auto_63730 ) ) ( not ( = ?auto_63742 ?auto_63727 ) ) ( not ( = ?auto_63729 ?auto_63727 ) ) ( not ( = ?auto_63739 ?auto_63727 ) ) ( HOIST-AT ?auto_63728 ?auto_63727 ) ( not ( = ?auto_63726 ?auto_63728 ) ) ( not ( = ?auto_63750 ?auto_63728 ) ) ( not ( = ?auto_63738 ?auto_63728 ) ) ( not ( = ?auto_63740 ?auto_63728 ) ) ( SURFACE-AT ?auto_63755 ?auto_63727 ) ( ON ?auto_63755 ?auto_63744 ) ( CLEAR ?auto_63755 ) ( not ( = ?auto_63723 ?auto_63744 ) ) ( not ( = ?auto_63724 ?auto_63744 ) ) ( not ( = ?auto_63736 ?auto_63744 ) ) ( not ( = ?auto_63733 ?auto_63744 ) ) ( not ( = ?auto_63751 ?auto_63744 ) ) ( not ( = ?auto_63755 ?auto_63744 ) ) ( not ( = ?auto_63745 ?auto_63744 ) ) ( not ( = ?auto_63735 ?auto_63744 ) ) ( IS-CRATE ?auto_63735 ) ( not ( = ?auto_63723 ?auto_63743 ) ) ( not ( = ?auto_63724 ?auto_63743 ) ) ( not ( = ?auto_63736 ?auto_63743 ) ) ( not ( = ?auto_63733 ?auto_63743 ) ) ( not ( = ?auto_63751 ?auto_63743 ) ) ( not ( = ?auto_63755 ?auto_63743 ) ) ( not ( = ?auto_63745 ?auto_63743 ) ) ( not ( = ?auto_63735 ?auto_63743 ) ) ( not ( = ?auto_63744 ?auto_63743 ) ) ( not ( = ?auto_63725 ?auto_63730 ) ) ( not ( = ?auto_63742 ?auto_63725 ) ) ( not ( = ?auto_63729 ?auto_63725 ) ) ( not ( = ?auto_63739 ?auto_63725 ) ) ( not ( = ?auto_63727 ?auto_63725 ) ) ( HOIST-AT ?auto_63754 ?auto_63725 ) ( not ( = ?auto_63726 ?auto_63754 ) ) ( not ( = ?auto_63750 ?auto_63754 ) ) ( not ( = ?auto_63738 ?auto_63754 ) ) ( not ( = ?auto_63740 ?auto_63754 ) ) ( not ( = ?auto_63728 ?auto_63754 ) ) ( AVAILABLE ?auto_63754 ) ( SURFACE-AT ?auto_63735 ?auto_63725 ) ( ON ?auto_63735 ?auto_63734 ) ( CLEAR ?auto_63735 ) ( not ( = ?auto_63723 ?auto_63734 ) ) ( not ( = ?auto_63724 ?auto_63734 ) ) ( not ( = ?auto_63736 ?auto_63734 ) ) ( not ( = ?auto_63733 ?auto_63734 ) ) ( not ( = ?auto_63751 ?auto_63734 ) ) ( not ( = ?auto_63755 ?auto_63734 ) ) ( not ( = ?auto_63745 ?auto_63734 ) ) ( not ( = ?auto_63735 ?auto_63734 ) ) ( not ( = ?auto_63744 ?auto_63734 ) ) ( not ( = ?auto_63743 ?auto_63734 ) ) ( IS-CRATE ?auto_63743 ) ( not ( = ?auto_63723 ?auto_63752 ) ) ( not ( = ?auto_63724 ?auto_63752 ) ) ( not ( = ?auto_63736 ?auto_63752 ) ) ( not ( = ?auto_63733 ?auto_63752 ) ) ( not ( = ?auto_63751 ?auto_63752 ) ) ( not ( = ?auto_63755 ?auto_63752 ) ) ( not ( = ?auto_63745 ?auto_63752 ) ) ( not ( = ?auto_63735 ?auto_63752 ) ) ( not ( = ?auto_63744 ?auto_63752 ) ) ( not ( = ?auto_63743 ?auto_63752 ) ) ( not ( = ?auto_63734 ?auto_63752 ) ) ( not ( = ?auto_63748 ?auto_63730 ) ) ( not ( = ?auto_63742 ?auto_63748 ) ) ( not ( = ?auto_63729 ?auto_63748 ) ) ( not ( = ?auto_63739 ?auto_63748 ) ) ( not ( = ?auto_63727 ?auto_63748 ) ) ( not ( = ?auto_63725 ?auto_63748 ) ) ( HOIST-AT ?auto_63731 ?auto_63748 ) ( not ( = ?auto_63726 ?auto_63731 ) ) ( not ( = ?auto_63750 ?auto_63731 ) ) ( not ( = ?auto_63738 ?auto_63731 ) ) ( not ( = ?auto_63740 ?auto_63731 ) ) ( not ( = ?auto_63728 ?auto_63731 ) ) ( not ( = ?auto_63754 ?auto_63731 ) ) ( AVAILABLE ?auto_63731 ) ( SURFACE-AT ?auto_63743 ?auto_63748 ) ( ON ?auto_63743 ?auto_63746 ) ( CLEAR ?auto_63743 ) ( not ( = ?auto_63723 ?auto_63746 ) ) ( not ( = ?auto_63724 ?auto_63746 ) ) ( not ( = ?auto_63736 ?auto_63746 ) ) ( not ( = ?auto_63733 ?auto_63746 ) ) ( not ( = ?auto_63751 ?auto_63746 ) ) ( not ( = ?auto_63755 ?auto_63746 ) ) ( not ( = ?auto_63745 ?auto_63746 ) ) ( not ( = ?auto_63735 ?auto_63746 ) ) ( not ( = ?auto_63744 ?auto_63746 ) ) ( not ( = ?auto_63743 ?auto_63746 ) ) ( not ( = ?auto_63734 ?auto_63746 ) ) ( not ( = ?auto_63752 ?auto_63746 ) ) ( IS-CRATE ?auto_63752 ) ( not ( = ?auto_63723 ?auto_63737 ) ) ( not ( = ?auto_63724 ?auto_63737 ) ) ( not ( = ?auto_63736 ?auto_63737 ) ) ( not ( = ?auto_63733 ?auto_63737 ) ) ( not ( = ?auto_63751 ?auto_63737 ) ) ( not ( = ?auto_63755 ?auto_63737 ) ) ( not ( = ?auto_63745 ?auto_63737 ) ) ( not ( = ?auto_63735 ?auto_63737 ) ) ( not ( = ?auto_63744 ?auto_63737 ) ) ( not ( = ?auto_63743 ?auto_63737 ) ) ( not ( = ?auto_63734 ?auto_63737 ) ) ( not ( = ?auto_63752 ?auto_63737 ) ) ( not ( = ?auto_63746 ?auto_63737 ) ) ( AVAILABLE ?auto_63738 ) ( SURFACE-AT ?auto_63752 ?auto_63729 ) ( ON ?auto_63752 ?auto_63741 ) ( CLEAR ?auto_63752 ) ( not ( = ?auto_63723 ?auto_63741 ) ) ( not ( = ?auto_63724 ?auto_63741 ) ) ( not ( = ?auto_63736 ?auto_63741 ) ) ( not ( = ?auto_63733 ?auto_63741 ) ) ( not ( = ?auto_63751 ?auto_63741 ) ) ( not ( = ?auto_63755 ?auto_63741 ) ) ( not ( = ?auto_63745 ?auto_63741 ) ) ( not ( = ?auto_63735 ?auto_63741 ) ) ( not ( = ?auto_63744 ?auto_63741 ) ) ( not ( = ?auto_63743 ?auto_63741 ) ) ( not ( = ?auto_63734 ?auto_63741 ) ) ( not ( = ?auto_63752 ?auto_63741 ) ) ( not ( = ?auto_63746 ?auto_63741 ) ) ( not ( = ?auto_63737 ?auto_63741 ) ) ( IS-CRATE ?auto_63737 ) ( not ( = ?auto_63723 ?auto_63732 ) ) ( not ( = ?auto_63724 ?auto_63732 ) ) ( not ( = ?auto_63736 ?auto_63732 ) ) ( not ( = ?auto_63733 ?auto_63732 ) ) ( not ( = ?auto_63751 ?auto_63732 ) ) ( not ( = ?auto_63755 ?auto_63732 ) ) ( not ( = ?auto_63745 ?auto_63732 ) ) ( not ( = ?auto_63735 ?auto_63732 ) ) ( not ( = ?auto_63744 ?auto_63732 ) ) ( not ( = ?auto_63743 ?auto_63732 ) ) ( not ( = ?auto_63734 ?auto_63732 ) ) ( not ( = ?auto_63752 ?auto_63732 ) ) ( not ( = ?auto_63746 ?auto_63732 ) ) ( not ( = ?auto_63737 ?auto_63732 ) ) ( not ( = ?auto_63741 ?auto_63732 ) ) ( AVAILABLE ?auto_63728 ) ( SURFACE-AT ?auto_63737 ?auto_63727 ) ( ON ?auto_63737 ?auto_63749 ) ( CLEAR ?auto_63737 ) ( not ( = ?auto_63723 ?auto_63749 ) ) ( not ( = ?auto_63724 ?auto_63749 ) ) ( not ( = ?auto_63736 ?auto_63749 ) ) ( not ( = ?auto_63733 ?auto_63749 ) ) ( not ( = ?auto_63751 ?auto_63749 ) ) ( not ( = ?auto_63755 ?auto_63749 ) ) ( not ( = ?auto_63745 ?auto_63749 ) ) ( not ( = ?auto_63735 ?auto_63749 ) ) ( not ( = ?auto_63744 ?auto_63749 ) ) ( not ( = ?auto_63743 ?auto_63749 ) ) ( not ( = ?auto_63734 ?auto_63749 ) ) ( not ( = ?auto_63752 ?auto_63749 ) ) ( not ( = ?auto_63746 ?auto_63749 ) ) ( not ( = ?auto_63737 ?auto_63749 ) ) ( not ( = ?auto_63741 ?auto_63749 ) ) ( not ( = ?auto_63732 ?auto_63749 ) ) ( TRUCK-AT ?auto_63747 ?auto_63730 ) ( SURFACE-AT ?auto_63753 ?auto_63730 ) ( CLEAR ?auto_63753 ) ( IS-CRATE ?auto_63732 ) ( not ( = ?auto_63723 ?auto_63753 ) ) ( not ( = ?auto_63724 ?auto_63753 ) ) ( not ( = ?auto_63736 ?auto_63753 ) ) ( not ( = ?auto_63733 ?auto_63753 ) ) ( not ( = ?auto_63751 ?auto_63753 ) ) ( not ( = ?auto_63755 ?auto_63753 ) ) ( not ( = ?auto_63745 ?auto_63753 ) ) ( not ( = ?auto_63735 ?auto_63753 ) ) ( not ( = ?auto_63744 ?auto_63753 ) ) ( not ( = ?auto_63743 ?auto_63753 ) ) ( not ( = ?auto_63734 ?auto_63753 ) ) ( not ( = ?auto_63752 ?auto_63753 ) ) ( not ( = ?auto_63746 ?auto_63753 ) ) ( not ( = ?auto_63737 ?auto_63753 ) ) ( not ( = ?auto_63741 ?auto_63753 ) ) ( not ( = ?auto_63732 ?auto_63753 ) ) ( not ( = ?auto_63749 ?auto_63753 ) ) ( AVAILABLE ?auto_63726 ) ( IN ?auto_63732 ?auto_63747 ) )
    :subtasks
    ( ( !UNLOAD ?auto_63726 ?auto_63732 ?auto_63747 ?auto_63730 )
      ( MAKE-ON ?auto_63723 ?auto_63724 )
      ( MAKE-ON-VERIFY ?auto_63723 ?auto_63724 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63756 - SURFACE
      ?auto_63757 - SURFACE
    )
    :vars
    (
      ?auto_63763 - HOIST
      ?auto_63758 - PLACE
      ?auto_63779 - PLACE
      ?auto_63771 - HOIST
      ?auto_63764 - SURFACE
      ?auto_63787 - SURFACE
      ?auto_63765 - PLACE
      ?auto_63788 - HOIST
      ?auto_63772 - SURFACE
      ?auto_63776 - SURFACE
      ?auto_63769 - PLACE
      ?auto_63785 - HOIST
      ?auto_63782 - SURFACE
      ?auto_63767 - SURFACE
      ?auto_63762 - PLACE
      ?auto_63760 - HOIST
      ?auto_63781 - SURFACE
      ?auto_63780 - SURFACE
      ?auto_63768 - PLACE
      ?auto_63775 - HOIST
      ?auto_63766 - SURFACE
      ?auto_63773 - SURFACE
      ?auto_63777 - PLACE
      ?auto_63759 - HOIST
      ?auto_63783 - SURFACE
      ?auto_63761 - SURFACE
      ?auto_63778 - SURFACE
      ?auto_63786 - SURFACE
      ?auto_63770 - SURFACE
      ?auto_63774 - SURFACE
      ?auto_63784 - TRUCK
      ?auto_63789 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63763 ?auto_63758 ) ( IS-CRATE ?auto_63756 ) ( not ( = ?auto_63756 ?auto_63757 ) ) ( not ( = ?auto_63779 ?auto_63758 ) ) ( HOIST-AT ?auto_63771 ?auto_63779 ) ( not ( = ?auto_63763 ?auto_63771 ) ) ( AVAILABLE ?auto_63771 ) ( SURFACE-AT ?auto_63756 ?auto_63779 ) ( ON ?auto_63756 ?auto_63764 ) ( CLEAR ?auto_63756 ) ( not ( = ?auto_63756 ?auto_63764 ) ) ( not ( = ?auto_63757 ?auto_63764 ) ) ( IS-CRATE ?auto_63757 ) ( not ( = ?auto_63756 ?auto_63787 ) ) ( not ( = ?auto_63757 ?auto_63787 ) ) ( not ( = ?auto_63764 ?auto_63787 ) ) ( not ( = ?auto_63765 ?auto_63758 ) ) ( not ( = ?auto_63779 ?auto_63765 ) ) ( HOIST-AT ?auto_63788 ?auto_63765 ) ( not ( = ?auto_63763 ?auto_63788 ) ) ( not ( = ?auto_63771 ?auto_63788 ) ) ( SURFACE-AT ?auto_63757 ?auto_63765 ) ( ON ?auto_63757 ?auto_63772 ) ( CLEAR ?auto_63757 ) ( not ( = ?auto_63756 ?auto_63772 ) ) ( not ( = ?auto_63757 ?auto_63772 ) ) ( not ( = ?auto_63764 ?auto_63772 ) ) ( not ( = ?auto_63787 ?auto_63772 ) ) ( IS-CRATE ?auto_63787 ) ( not ( = ?auto_63756 ?auto_63776 ) ) ( not ( = ?auto_63757 ?auto_63776 ) ) ( not ( = ?auto_63764 ?auto_63776 ) ) ( not ( = ?auto_63787 ?auto_63776 ) ) ( not ( = ?auto_63772 ?auto_63776 ) ) ( not ( = ?auto_63769 ?auto_63758 ) ) ( not ( = ?auto_63779 ?auto_63769 ) ) ( not ( = ?auto_63765 ?auto_63769 ) ) ( HOIST-AT ?auto_63785 ?auto_63769 ) ( not ( = ?auto_63763 ?auto_63785 ) ) ( not ( = ?auto_63771 ?auto_63785 ) ) ( not ( = ?auto_63788 ?auto_63785 ) ) ( AVAILABLE ?auto_63785 ) ( SURFACE-AT ?auto_63787 ?auto_63769 ) ( ON ?auto_63787 ?auto_63782 ) ( CLEAR ?auto_63787 ) ( not ( = ?auto_63756 ?auto_63782 ) ) ( not ( = ?auto_63757 ?auto_63782 ) ) ( not ( = ?auto_63764 ?auto_63782 ) ) ( not ( = ?auto_63787 ?auto_63782 ) ) ( not ( = ?auto_63772 ?auto_63782 ) ) ( not ( = ?auto_63776 ?auto_63782 ) ) ( IS-CRATE ?auto_63776 ) ( not ( = ?auto_63756 ?auto_63767 ) ) ( not ( = ?auto_63757 ?auto_63767 ) ) ( not ( = ?auto_63764 ?auto_63767 ) ) ( not ( = ?auto_63787 ?auto_63767 ) ) ( not ( = ?auto_63772 ?auto_63767 ) ) ( not ( = ?auto_63776 ?auto_63767 ) ) ( not ( = ?auto_63782 ?auto_63767 ) ) ( not ( = ?auto_63762 ?auto_63758 ) ) ( not ( = ?auto_63779 ?auto_63762 ) ) ( not ( = ?auto_63765 ?auto_63762 ) ) ( not ( = ?auto_63769 ?auto_63762 ) ) ( HOIST-AT ?auto_63760 ?auto_63762 ) ( not ( = ?auto_63763 ?auto_63760 ) ) ( not ( = ?auto_63771 ?auto_63760 ) ) ( not ( = ?auto_63788 ?auto_63760 ) ) ( not ( = ?auto_63785 ?auto_63760 ) ) ( SURFACE-AT ?auto_63776 ?auto_63762 ) ( ON ?auto_63776 ?auto_63781 ) ( CLEAR ?auto_63776 ) ( not ( = ?auto_63756 ?auto_63781 ) ) ( not ( = ?auto_63757 ?auto_63781 ) ) ( not ( = ?auto_63764 ?auto_63781 ) ) ( not ( = ?auto_63787 ?auto_63781 ) ) ( not ( = ?auto_63772 ?auto_63781 ) ) ( not ( = ?auto_63776 ?auto_63781 ) ) ( not ( = ?auto_63782 ?auto_63781 ) ) ( not ( = ?auto_63767 ?auto_63781 ) ) ( IS-CRATE ?auto_63767 ) ( not ( = ?auto_63756 ?auto_63780 ) ) ( not ( = ?auto_63757 ?auto_63780 ) ) ( not ( = ?auto_63764 ?auto_63780 ) ) ( not ( = ?auto_63787 ?auto_63780 ) ) ( not ( = ?auto_63772 ?auto_63780 ) ) ( not ( = ?auto_63776 ?auto_63780 ) ) ( not ( = ?auto_63782 ?auto_63780 ) ) ( not ( = ?auto_63767 ?auto_63780 ) ) ( not ( = ?auto_63781 ?auto_63780 ) ) ( not ( = ?auto_63768 ?auto_63758 ) ) ( not ( = ?auto_63779 ?auto_63768 ) ) ( not ( = ?auto_63765 ?auto_63768 ) ) ( not ( = ?auto_63769 ?auto_63768 ) ) ( not ( = ?auto_63762 ?auto_63768 ) ) ( HOIST-AT ?auto_63775 ?auto_63768 ) ( not ( = ?auto_63763 ?auto_63775 ) ) ( not ( = ?auto_63771 ?auto_63775 ) ) ( not ( = ?auto_63788 ?auto_63775 ) ) ( not ( = ?auto_63785 ?auto_63775 ) ) ( not ( = ?auto_63760 ?auto_63775 ) ) ( AVAILABLE ?auto_63775 ) ( SURFACE-AT ?auto_63767 ?auto_63768 ) ( ON ?auto_63767 ?auto_63766 ) ( CLEAR ?auto_63767 ) ( not ( = ?auto_63756 ?auto_63766 ) ) ( not ( = ?auto_63757 ?auto_63766 ) ) ( not ( = ?auto_63764 ?auto_63766 ) ) ( not ( = ?auto_63787 ?auto_63766 ) ) ( not ( = ?auto_63772 ?auto_63766 ) ) ( not ( = ?auto_63776 ?auto_63766 ) ) ( not ( = ?auto_63782 ?auto_63766 ) ) ( not ( = ?auto_63767 ?auto_63766 ) ) ( not ( = ?auto_63781 ?auto_63766 ) ) ( not ( = ?auto_63780 ?auto_63766 ) ) ( IS-CRATE ?auto_63780 ) ( not ( = ?auto_63756 ?auto_63773 ) ) ( not ( = ?auto_63757 ?auto_63773 ) ) ( not ( = ?auto_63764 ?auto_63773 ) ) ( not ( = ?auto_63787 ?auto_63773 ) ) ( not ( = ?auto_63772 ?auto_63773 ) ) ( not ( = ?auto_63776 ?auto_63773 ) ) ( not ( = ?auto_63782 ?auto_63773 ) ) ( not ( = ?auto_63767 ?auto_63773 ) ) ( not ( = ?auto_63781 ?auto_63773 ) ) ( not ( = ?auto_63780 ?auto_63773 ) ) ( not ( = ?auto_63766 ?auto_63773 ) ) ( not ( = ?auto_63777 ?auto_63758 ) ) ( not ( = ?auto_63779 ?auto_63777 ) ) ( not ( = ?auto_63765 ?auto_63777 ) ) ( not ( = ?auto_63769 ?auto_63777 ) ) ( not ( = ?auto_63762 ?auto_63777 ) ) ( not ( = ?auto_63768 ?auto_63777 ) ) ( HOIST-AT ?auto_63759 ?auto_63777 ) ( not ( = ?auto_63763 ?auto_63759 ) ) ( not ( = ?auto_63771 ?auto_63759 ) ) ( not ( = ?auto_63788 ?auto_63759 ) ) ( not ( = ?auto_63785 ?auto_63759 ) ) ( not ( = ?auto_63760 ?auto_63759 ) ) ( not ( = ?auto_63775 ?auto_63759 ) ) ( AVAILABLE ?auto_63759 ) ( SURFACE-AT ?auto_63780 ?auto_63777 ) ( ON ?auto_63780 ?auto_63783 ) ( CLEAR ?auto_63780 ) ( not ( = ?auto_63756 ?auto_63783 ) ) ( not ( = ?auto_63757 ?auto_63783 ) ) ( not ( = ?auto_63764 ?auto_63783 ) ) ( not ( = ?auto_63787 ?auto_63783 ) ) ( not ( = ?auto_63772 ?auto_63783 ) ) ( not ( = ?auto_63776 ?auto_63783 ) ) ( not ( = ?auto_63782 ?auto_63783 ) ) ( not ( = ?auto_63767 ?auto_63783 ) ) ( not ( = ?auto_63781 ?auto_63783 ) ) ( not ( = ?auto_63780 ?auto_63783 ) ) ( not ( = ?auto_63766 ?auto_63783 ) ) ( not ( = ?auto_63773 ?auto_63783 ) ) ( IS-CRATE ?auto_63773 ) ( not ( = ?auto_63756 ?auto_63761 ) ) ( not ( = ?auto_63757 ?auto_63761 ) ) ( not ( = ?auto_63764 ?auto_63761 ) ) ( not ( = ?auto_63787 ?auto_63761 ) ) ( not ( = ?auto_63772 ?auto_63761 ) ) ( not ( = ?auto_63776 ?auto_63761 ) ) ( not ( = ?auto_63782 ?auto_63761 ) ) ( not ( = ?auto_63767 ?auto_63761 ) ) ( not ( = ?auto_63781 ?auto_63761 ) ) ( not ( = ?auto_63780 ?auto_63761 ) ) ( not ( = ?auto_63766 ?auto_63761 ) ) ( not ( = ?auto_63773 ?auto_63761 ) ) ( not ( = ?auto_63783 ?auto_63761 ) ) ( AVAILABLE ?auto_63788 ) ( SURFACE-AT ?auto_63773 ?auto_63765 ) ( ON ?auto_63773 ?auto_63778 ) ( CLEAR ?auto_63773 ) ( not ( = ?auto_63756 ?auto_63778 ) ) ( not ( = ?auto_63757 ?auto_63778 ) ) ( not ( = ?auto_63764 ?auto_63778 ) ) ( not ( = ?auto_63787 ?auto_63778 ) ) ( not ( = ?auto_63772 ?auto_63778 ) ) ( not ( = ?auto_63776 ?auto_63778 ) ) ( not ( = ?auto_63782 ?auto_63778 ) ) ( not ( = ?auto_63767 ?auto_63778 ) ) ( not ( = ?auto_63781 ?auto_63778 ) ) ( not ( = ?auto_63780 ?auto_63778 ) ) ( not ( = ?auto_63766 ?auto_63778 ) ) ( not ( = ?auto_63773 ?auto_63778 ) ) ( not ( = ?auto_63783 ?auto_63778 ) ) ( not ( = ?auto_63761 ?auto_63778 ) ) ( IS-CRATE ?auto_63761 ) ( not ( = ?auto_63756 ?auto_63786 ) ) ( not ( = ?auto_63757 ?auto_63786 ) ) ( not ( = ?auto_63764 ?auto_63786 ) ) ( not ( = ?auto_63787 ?auto_63786 ) ) ( not ( = ?auto_63772 ?auto_63786 ) ) ( not ( = ?auto_63776 ?auto_63786 ) ) ( not ( = ?auto_63782 ?auto_63786 ) ) ( not ( = ?auto_63767 ?auto_63786 ) ) ( not ( = ?auto_63781 ?auto_63786 ) ) ( not ( = ?auto_63780 ?auto_63786 ) ) ( not ( = ?auto_63766 ?auto_63786 ) ) ( not ( = ?auto_63773 ?auto_63786 ) ) ( not ( = ?auto_63783 ?auto_63786 ) ) ( not ( = ?auto_63761 ?auto_63786 ) ) ( not ( = ?auto_63778 ?auto_63786 ) ) ( AVAILABLE ?auto_63760 ) ( SURFACE-AT ?auto_63761 ?auto_63762 ) ( ON ?auto_63761 ?auto_63770 ) ( CLEAR ?auto_63761 ) ( not ( = ?auto_63756 ?auto_63770 ) ) ( not ( = ?auto_63757 ?auto_63770 ) ) ( not ( = ?auto_63764 ?auto_63770 ) ) ( not ( = ?auto_63787 ?auto_63770 ) ) ( not ( = ?auto_63772 ?auto_63770 ) ) ( not ( = ?auto_63776 ?auto_63770 ) ) ( not ( = ?auto_63782 ?auto_63770 ) ) ( not ( = ?auto_63767 ?auto_63770 ) ) ( not ( = ?auto_63781 ?auto_63770 ) ) ( not ( = ?auto_63780 ?auto_63770 ) ) ( not ( = ?auto_63766 ?auto_63770 ) ) ( not ( = ?auto_63773 ?auto_63770 ) ) ( not ( = ?auto_63783 ?auto_63770 ) ) ( not ( = ?auto_63761 ?auto_63770 ) ) ( not ( = ?auto_63778 ?auto_63770 ) ) ( not ( = ?auto_63786 ?auto_63770 ) ) ( SURFACE-AT ?auto_63774 ?auto_63758 ) ( CLEAR ?auto_63774 ) ( IS-CRATE ?auto_63786 ) ( not ( = ?auto_63756 ?auto_63774 ) ) ( not ( = ?auto_63757 ?auto_63774 ) ) ( not ( = ?auto_63764 ?auto_63774 ) ) ( not ( = ?auto_63787 ?auto_63774 ) ) ( not ( = ?auto_63772 ?auto_63774 ) ) ( not ( = ?auto_63776 ?auto_63774 ) ) ( not ( = ?auto_63782 ?auto_63774 ) ) ( not ( = ?auto_63767 ?auto_63774 ) ) ( not ( = ?auto_63781 ?auto_63774 ) ) ( not ( = ?auto_63780 ?auto_63774 ) ) ( not ( = ?auto_63766 ?auto_63774 ) ) ( not ( = ?auto_63773 ?auto_63774 ) ) ( not ( = ?auto_63783 ?auto_63774 ) ) ( not ( = ?auto_63761 ?auto_63774 ) ) ( not ( = ?auto_63778 ?auto_63774 ) ) ( not ( = ?auto_63786 ?auto_63774 ) ) ( not ( = ?auto_63770 ?auto_63774 ) ) ( AVAILABLE ?auto_63763 ) ( IN ?auto_63786 ?auto_63784 ) ( TRUCK-AT ?auto_63784 ?auto_63789 ) ( not ( = ?auto_63789 ?auto_63758 ) ) ( not ( = ?auto_63779 ?auto_63789 ) ) ( not ( = ?auto_63765 ?auto_63789 ) ) ( not ( = ?auto_63769 ?auto_63789 ) ) ( not ( = ?auto_63762 ?auto_63789 ) ) ( not ( = ?auto_63768 ?auto_63789 ) ) ( not ( = ?auto_63777 ?auto_63789 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_63784 ?auto_63789 ?auto_63758 )
      ( MAKE-ON ?auto_63756 ?auto_63757 )
      ( MAKE-ON-VERIFY ?auto_63756 ?auto_63757 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63790 - SURFACE
      ?auto_63791 - SURFACE
    )
    :vars
    (
      ?auto_63811 - HOIST
      ?auto_63796 - PLACE
      ?auto_63814 - PLACE
      ?auto_63809 - HOIST
      ?auto_63821 - SURFACE
      ?auto_63794 - SURFACE
      ?auto_63822 - PLACE
      ?auto_63792 - HOIST
      ?auto_63820 - SURFACE
      ?auto_63804 - SURFACE
      ?auto_63815 - PLACE
      ?auto_63799 - HOIST
      ?auto_63800 - SURFACE
      ?auto_63819 - SURFACE
      ?auto_63816 - PLACE
      ?auto_63806 - HOIST
      ?auto_63793 - SURFACE
      ?auto_63807 - SURFACE
      ?auto_63797 - PLACE
      ?auto_63803 - HOIST
      ?auto_63818 - SURFACE
      ?auto_63808 - SURFACE
      ?auto_63805 - PLACE
      ?auto_63812 - HOIST
      ?auto_63801 - SURFACE
      ?auto_63817 - SURFACE
      ?auto_63813 - SURFACE
      ?auto_63795 - SURFACE
      ?auto_63810 - SURFACE
      ?auto_63802 - SURFACE
      ?auto_63798 - TRUCK
      ?auto_63823 - PLACE
      ?auto_63824 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_63811 ?auto_63796 ) ( IS-CRATE ?auto_63790 ) ( not ( = ?auto_63790 ?auto_63791 ) ) ( not ( = ?auto_63814 ?auto_63796 ) ) ( HOIST-AT ?auto_63809 ?auto_63814 ) ( not ( = ?auto_63811 ?auto_63809 ) ) ( AVAILABLE ?auto_63809 ) ( SURFACE-AT ?auto_63790 ?auto_63814 ) ( ON ?auto_63790 ?auto_63821 ) ( CLEAR ?auto_63790 ) ( not ( = ?auto_63790 ?auto_63821 ) ) ( not ( = ?auto_63791 ?auto_63821 ) ) ( IS-CRATE ?auto_63791 ) ( not ( = ?auto_63790 ?auto_63794 ) ) ( not ( = ?auto_63791 ?auto_63794 ) ) ( not ( = ?auto_63821 ?auto_63794 ) ) ( not ( = ?auto_63822 ?auto_63796 ) ) ( not ( = ?auto_63814 ?auto_63822 ) ) ( HOIST-AT ?auto_63792 ?auto_63822 ) ( not ( = ?auto_63811 ?auto_63792 ) ) ( not ( = ?auto_63809 ?auto_63792 ) ) ( SURFACE-AT ?auto_63791 ?auto_63822 ) ( ON ?auto_63791 ?auto_63820 ) ( CLEAR ?auto_63791 ) ( not ( = ?auto_63790 ?auto_63820 ) ) ( not ( = ?auto_63791 ?auto_63820 ) ) ( not ( = ?auto_63821 ?auto_63820 ) ) ( not ( = ?auto_63794 ?auto_63820 ) ) ( IS-CRATE ?auto_63794 ) ( not ( = ?auto_63790 ?auto_63804 ) ) ( not ( = ?auto_63791 ?auto_63804 ) ) ( not ( = ?auto_63821 ?auto_63804 ) ) ( not ( = ?auto_63794 ?auto_63804 ) ) ( not ( = ?auto_63820 ?auto_63804 ) ) ( not ( = ?auto_63815 ?auto_63796 ) ) ( not ( = ?auto_63814 ?auto_63815 ) ) ( not ( = ?auto_63822 ?auto_63815 ) ) ( HOIST-AT ?auto_63799 ?auto_63815 ) ( not ( = ?auto_63811 ?auto_63799 ) ) ( not ( = ?auto_63809 ?auto_63799 ) ) ( not ( = ?auto_63792 ?auto_63799 ) ) ( AVAILABLE ?auto_63799 ) ( SURFACE-AT ?auto_63794 ?auto_63815 ) ( ON ?auto_63794 ?auto_63800 ) ( CLEAR ?auto_63794 ) ( not ( = ?auto_63790 ?auto_63800 ) ) ( not ( = ?auto_63791 ?auto_63800 ) ) ( not ( = ?auto_63821 ?auto_63800 ) ) ( not ( = ?auto_63794 ?auto_63800 ) ) ( not ( = ?auto_63820 ?auto_63800 ) ) ( not ( = ?auto_63804 ?auto_63800 ) ) ( IS-CRATE ?auto_63804 ) ( not ( = ?auto_63790 ?auto_63819 ) ) ( not ( = ?auto_63791 ?auto_63819 ) ) ( not ( = ?auto_63821 ?auto_63819 ) ) ( not ( = ?auto_63794 ?auto_63819 ) ) ( not ( = ?auto_63820 ?auto_63819 ) ) ( not ( = ?auto_63804 ?auto_63819 ) ) ( not ( = ?auto_63800 ?auto_63819 ) ) ( not ( = ?auto_63816 ?auto_63796 ) ) ( not ( = ?auto_63814 ?auto_63816 ) ) ( not ( = ?auto_63822 ?auto_63816 ) ) ( not ( = ?auto_63815 ?auto_63816 ) ) ( HOIST-AT ?auto_63806 ?auto_63816 ) ( not ( = ?auto_63811 ?auto_63806 ) ) ( not ( = ?auto_63809 ?auto_63806 ) ) ( not ( = ?auto_63792 ?auto_63806 ) ) ( not ( = ?auto_63799 ?auto_63806 ) ) ( SURFACE-AT ?auto_63804 ?auto_63816 ) ( ON ?auto_63804 ?auto_63793 ) ( CLEAR ?auto_63804 ) ( not ( = ?auto_63790 ?auto_63793 ) ) ( not ( = ?auto_63791 ?auto_63793 ) ) ( not ( = ?auto_63821 ?auto_63793 ) ) ( not ( = ?auto_63794 ?auto_63793 ) ) ( not ( = ?auto_63820 ?auto_63793 ) ) ( not ( = ?auto_63804 ?auto_63793 ) ) ( not ( = ?auto_63800 ?auto_63793 ) ) ( not ( = ?auto_63819 ?auto_63793 ) ) ( IS-CRATE ?auto_63819 ) ( not ( = ?auto_63790 ?auto_63807 ) ) ( not ( = ?auto_63791 ?auto_63807 ) ) ( not ( = ?auto_63821 ?auto_63807 ) ) ( not ( = ?auto_63794 ?auto_63807 ) ) ( not ( = ?auto_63820 ?auto_63807 ) ) ( not ( = ?auto_63804 ?auto_63807 ) ) ( not ( = ?auto_63800 ?auto_63807 ) ) ( not ( = ?auto_63819 ?auto_63807 ) ) ( not ( = ?auto_63793 ?auto_63807 ) ) ( not ( = ?auto_63797 ?auto_63796 ) ) ( not ( = ?auto_63814 ?auto_63797 ) ) ( not ( = ?auto_63822 ?auto_63797 ) ) ( not ( = ?auto_63815 ?auto_63797 ) ) ( not ( = ?auto_63816 ?auto_63797 ) ) ( HOIST-AT ?auto_63803 ?auto_63797 ) ( not ( = ?auto_63811 ?auto_63803 ) ) ( not ( = ?auto_63809 ?auto_63803 ) ) ( not ( = ?auto_63792 ?auto_63803 ) ) ( not ( = ?auto_63799 ?auto_63803 ) ) ( not ( = ?auto_63806 ?auto_63803 ) ) ( AVAILABLE ?auto_63803 ) ( SURFACE-AT ?auto_63819 ?auto_63797 ) ( ON ?auto_63819 ?auto_63818 ) ( CLEAR ?auto_63819 ) ( not ( = ?auto_63790 ?auto_63818 ) ) ( not ( = ?auto_63791 ?auto_63818 ) ) ( not ( = ?auto_63821 ?auto_63818 ) ) ( not ( = ?auto_63794 ?auto_63818 ) ) ( not ( = ?auto_63820 ?auto_63818 ) ) ( not ( = ?auto_63804 ?auto_63818 ) ) ( not ( = ?auto_63800 ?auto_63818 ) ) ( not ( = ?auto_63819 ?auto_63818 ) ) ( not ( = ?auto_63793 ?auto_63818 ) ) ( not ( = ?auto_63807 ?auto_63818 ) ) ( IS-CRATE ?auto_63807 ) ( not ( = ?auto_63790 ?auto_63808 ) ) ( not ( = ?auto_63791 ?auto_63808 ) ) ( not ( = ?auto_63821 ?auto_63808 ) ) ( not ( = ?auto_63794 ?auto_63808 ) ) ( not ( = ?auto_63820 ?auto_63808 ) ) ( not ( = ?auto_63804 ?auto_63808 ) ) ( not ( = ?auto_63800 ?auto_63808 ) ) ( not ( = ?auto_63819 ?auto_63808 ) ) ( not ( = ?auto_63793 ?auto_63808 ) ) ( not ( = ?auto_63807 ?auto_63808 ) ) ( not ( = ?auto_63818 ?auto_63808 ) ) ( not ( = ?auto_63805 ?auto_63796 ) ) ( not ( = ?auto_63814 ?auto_63805 ) ) ( not ( = ?auto_63822 ?auto_63805 ) ) ( not ( = ?auto_63815 ?auto_63805 ) ) ( not ( = ?auto_63816 ?auto_63805 ) ) ( not ( = ?auto_63797 ?auto_63805 ) ) ( HOIST-AT ?auto_63812 ?auto_63805 ) ( not ( = ?auto_63811 ?auto_63812 ) ) ( not ( = ?auto_63809 ?auto_63812 ) ) ( not ( = ?auto_63792 ?auto_63812 ) ) ( not ( = ?auto_63799 ?auto_63812 ) ) ( not ( = ?auto_63806 ?auto_63812 ) ) ( not ( = ?auto_63803 ?auto_63812 ) ) ( AVAILABLE ?auto_63812 ) ( SURFACE-AT ?auto_63807 ?auto_63805 ) ( ON ?auto_63807 ?auto_63801 ) ( CLEAR ?auto_63807 ) ( not ( = ?auto_63790 ?auto_63801 ) ) ( not ( = ?auto_63791 ?auto_63801 ) ) ( not ( = ?auto_63821 ?auto_63801 ) ) ( not ( = ?auto_63794 ?auto_63801 ) ) ( not ( = ?auto_63820 ?auto_63801 ) ) ( not ( = ?auto_63804 ?auto_63801 ) ) ( not ( = ?auto_63800 ?auto_63801 ) ) ( not ( = ?auto_63819 ?auto_63801 ) ) ( not ( = ?auto_63793 ?auto_63801 ) ) ( not ( = ?auto_63807 ?auto_63801 ) ) ( not ( = ?auto_63818 ?auto_63801 ) ) ( not ( = ?auto_63808 ?auto_63801 ) ) ( IS-CRATE ?auto_63808 ) ( not ( = ?auto_63790 ?auto_63817 ) ) ( not ( = ?auto_63791 ?auto_63817 ) ) ( not ( = ?auto_63821 ?auto_63817 ) ) ( not ( = ?auto_63794 ?auto_63817 ) ) ( not ( = ?auto_63820 ?auto_63817 ) ) ( not ( = ?auto_63804 ?auto_63817 ) ) ( not ( = ?auto_63800 ?auto_63817 ) ) ( not ( = ?auto_63819 ?auto_63817 ) ) ( not ( = ?auto_63793 ?auto_63817 ) ) ( not ( = ?auto_63807 ?auto_63817 ) ) ( not ( = ?auto_63818 ?auto_63817 ) ) ( not ( = ?auto_63808 ?auto_63817 ) ) ( not ( = ?auto_63801 ?auto_63817 ) ) ( AVAILABLE ?auto_63792 ) ( SURFACE-AT ?auto_63808 ?auto_63822 ) ( ON ?auto_63808 ?auto_63813 ) ( CLEAR ?auto_63808 ) ( not ( = ?auto_63790 ?auto_63813 ) ) ( not ( = ?auto_63791 ?auto_63813 ) ) ( not ( = ?auto_63821 ?auto_63813 ) ) ( not ( = ?auto_63794 ?auto_63813 ) ) ( not ( = ?auto_63820 ?auto_63813 ) ) ( not ( = ?auto_63804 ?auto_63813 ) ) ( not ( = ?auto_63800 ?auto_63813 ) ) ( not ( = ?auto_63819 ?auto_63813 ) ) ( not ( = ?auto_63793 ?auto_63813 ) ) ( not ( = ?auto_63807 ?auto_63813 ) ) ( not ( = ?auto_63818 ?auto_63813 ) ) ( not ( = ?auto_63808 ?auto_63813 ) ) ( not ( = ?auto_63801 ?auto_63813 ) ) ( not ( = ?auto_63817 ?auto_63813 ) ) ( IS-CRATE ?auto_63817 ) ( not ( = ?auto_63790 ?auto_63795 ) ) ( not ( = ?auto_63791 ?auto_63795 ) ) ( not ( = ?auto_63821 ?auto_63795 ) ) ( not ( = ?auto_63794 ?auto_63795 ) ) ( not ( = ?auto_63820 ?auto_63795 ) ) ( not ( = ?auto_63804 ?auto_63795 ) ) ( not ( = ?auto_63800 ?auto_63795 ) ) ( not ( = ?auto_63819 ?auto_63795 ) ) ( not ( = ?auto_63793 ?auto_63795 ) ) ( not ( = ?auto_63807 ?auto_63795 ) ) ( not ( = ?auto_63818 ?auto_63795 ) ) ( not ( = ?auto_63808 ?auto_63795 ) ) ( not ( = ?auto_63801 ?auto_63795 ) ) ( not ( = ?auto_63817 ?auto_63795 ) ) ( not ( = ?auto_63813 ?auto_63795 ) ) ( AVAILABLE ?auto_63806 ) ( SURFACE-AT ?auto_63817 ?auto_63816 ) ( ON ?auto_63817 ?auto_63810 ) ( CLEAR ?auto_63817 ) ( not ( = ?auto_63790 ?auto_63810 ) ) ( not ( = ?auto_63791 ?auto_63810 ) ) ( not ( = ?auto_63821 ?auto_63810 ) ) ( not ( = ?auto_63794 ?auto_63810 ) ) ( not ( = ?auto_63820 ?auto_63810 ) ) ( not ( = ?auto_63804 ?auto_63810 ) ) ( not ( = ?auto_63800 ?auto_63810 ) ) ( not ( = ?auto_63819 ?auto_63810 ) ) ( not ( = ?auto_63793 ?auto_63810 ) ) ( not ( = ?auto_63807 ?auto_63810 ) ) ( not ( = ?auto_63818 ?auto_63810 ) ) ( not ( = ?auto_63808 ?auto_63810 ) ) ( not ( = ?auto_63801 ?auto_63810 ) ) ( not ( = ?auto_63817 ?auto_63810 ) ) ( not ( = ?auto_63813 ?auto_63810 ) ) ( not ( = ?auto_63795 ?auto_63810 ) ) ( SURFACE-AT ?auto_63802 ?auto_63796 ) ( CLEAR ?auto_63802 ) ( IS-CRATE ?auto_63795 ) ( not ( = ?auto_63790 ?auto_63802 ) ) ( not ( = ?auto_63791 ?auto_63802 ) ) ( not ( = ?auto_63821 ?auto_63802 ) ) ( not ( = ?auto_63794 ?auto_63802 ) ) ( not ( = ?auto_63820 ?auto_63802 ) ) ( not ( = ?auto_63804 ?auto_63802 ) ) ( not ( = ?auto_63800 ?auto_63802 ) ) ( not ( = ?auto_63819 ?auto_63802 ) ) ( not ( = ?auto_63793 ?auto_63802 ) ) ( not ( = ?auto_63807 ?auto_63802 ) ) ( not ( = ?auto_63818 ?auto_63802 ) ) ( not ( = ?auto_63808 ?auto_63802 ) ) ( not ( = ?auto_63801 ?auto_63802 ) ) ( not ( = ?auto_63817 ?auto_63802 ) ) ( not ( = ?auto_63813 ?auto_63802 ) ) ( not ( = ?auto_63795 ?auto_63802 ) ) ( not ( = ?auto_63810 ?auto_63802 ) ) ( AVAILABLE ?auto_63811 ) ( TRUCK-AT ?auto_63798 ?auto_63823 ) ( not ( = ?auto_63823 ?auto_63796 ) ) ( not ( = ?auto_63814 ?auto_63823 ) ) ( not ( = ?auto_63822 ?auto_63823 ) ) ( not ( = ?auto_63815 ?auto_63823 ) ) ( not ( = ?auto_63816 ?auto_63823 ) ) ( not ( = ?auto_63797 ?auto_63823 ) ) ( not ( = ?auto_63805 ?auto_63823 ) ) ( HOIST-AT ?auto_63824 ?auto_63823 ) ( LIFTING ?auto_63824 ?auto_63795 ) ( not ( = ?auto_63811 ?auto_63824 ) ) ( not ( = ?auto_63809 ?auto_63824 ) ) ( not ( = ?auto_63792 ?auto_63824 ) ) ( not ( = ?auto_63799 ?auto_63824 ) ) ( not ( = ?auto_63806 ?auto_63824 ) ) ( not ( = ?auto_63803 ?auto_63824 ) ) ( not ( = ?auto_63812 ?auto_63824 ) ) )
    :subtasks
    ( ( !LOAD ?auto_63824 ?auto_63795 ?auto_63798 ?auto_63823 )
      ( MAKE-ON ?auto_63790 ?auto_63791 )
      ( MAKE-ON-VERIFY ?auto_63790 ?auto_63791 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63825 - SURFACE
      ?auto_63826 - SURFACE
    )
    :vars
    (
      ?auto_63848 - HOIST
      ?auto_63834 - PLACE
      ?auto_63851 - PLACE
      ?auto_63846 - HOIST
      ?auto_63842 - SURFACE
      ?auto_63854 - SURFACE
      ?auto_63843 - PLACE
      ?auto_63827 - HOIST
      ?auto_63841 - SURFACE
      ?auto_63856 - SURFACE
      ?auto_63844 - PLACE
      ?auto_63857 - HOIST
      ?auto_63833 - SURFACE
      ?auto_63840 - SURFACE
      ?auto_63837 - PLACE
      ?auto_63853 - HOIST
      ?auto_63835 - SURFACE
      ?auto_63852 - SURFACE
      ?auto_63859 - PLACE
      ?auto_63830 - HOIST
      ?auto_63839 - SURFACE
      ?auto_63845 - SURFACE
      ?auto_63836 - PLACE
      ?auto_63849 - HOIST
      ?auto_63855 - SURFACE
      ?auto_63838 - SURFACE
      ?auto_63850 - SURFACE
      ?auto_63858 - SURFACE
      ?auto_63847 - SURFACE
      ?auto_63829 - SURFACE
      ?auto_63832 - TRUCK
      ?auto_63828 - PLACE
      ?auto_63831 - HOIST
      ?auto_63860 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63848 ?auto_63834 ) ( IS-CRATE ?auto_63825 ) ( not ( = ?auto_63825 ?auto_63826 ) ) ( not ( = ?auto_63851 ?auto_63834 ) ) ( HOIST-AT ?auto_63846 ?auto_63851 ) ( not ( = ?auto_63848 ?auto_63846 ) ) ( AVAILABLE ?auto_63846 ) ( SURFACE-AT ?auto_63825 ?auto_63851 ) ( ON ?auto_63825 ?auto_63842 ) ( CLEAR ?auto_63825 ) ( not ( = ?auto_63825 ?auto_63842 ) ) ( not ( = ?auto_63826 ?auto_63842 ) ) ( IS-CRATE ?auto_63826 ) ( not ( = ?auto_63825 ?auto_63854 ) ) ( not ( = ?auto_63826 ?auto_63854 ) ) ( not ( = ?auto_63842 ?auto_63854 ) ) ( not ( = ?auto_63843 ?auto_63834 ) ) ( not ( = ?auto_63851 ?auto_63843 ) ) ( HOIST-AT ?auto_63827 ?auto_63843 ) ( not ( = ?auto_63848 ?auto_63827 ) ) ( not ( = ?auto_63846 ?auto_63827 ) ) ( SURFACE-AT ?auto_63826 ?auto_63843 ) ( ON ?auto_63826 ?auto_63841 ) ( CLEAR ?auto_63826 ) ( not ( = ?auto_63825 ?auto_63841 ) ) ( not ( = ?auto_63826 ?auto_63841 ) ) ( not ( = ?auto_63842 ?auto_63841 ) ) ( not ( = ?auto_63854 ?auto_63841 ) ) ( IS-CRATE ?auto_63854 ) ( not ( = ?auto_63825 ?auto_63856 ) ) ( not ( = ?auto_63826 ?auto_63856 ) ) ( not ( = ?auto_63842 ?auto_63856 ) ) ( not ( = ?auto_63854 ?auto_63856 ) ) ( not ( = ?auto_63841 ?auto_63856 ) ) ( not ( = ?auto_63844 ?auto_63834 ) ) ( not ( = ?auto_63851 ?auto_63844 ) ) ( not ( = ?auto_63843 ?auto_63844 ) ) ( HOIST-AT ?auto_63857 ?auto_63844 ) ( not ( = ?auto_63848 ?auto_63857 ) ) ( not ( = ?auto_63846 ?auto_63857 ) ) ( not ( = ?auto_63827 ?auto_63857 ) ) ( AVAILABLE ?auto_63857 ) ( SURFACE-AT ?auto_63854 ?auto_63844 ) ( ON ?auto_63854 ?auto_63833 ) ( CLEAR ?auto_63854 ) ( not ( = ?auto_63825 ?auto_63833 ) ) ( not ( = ?auto_63826 ?auto_63833 ) ) ( not ( = ?auto_63842 ?auto_63833 ) ) ( not ( = ?auto_63854 ?auto_63833 ) ) ( not ( = ?auto_63841 ?auto_63833 ) ) ( not ( = ?auto_63856 ?auto_63833 ) ) ( IS-CRATE ?auto_63856 ) ( not ( = ?auto_63825 ?auto_63840 ) ) ( not ( = ?auto_63826 ?auto_63840 ) ) ( not ( = ?auto_63842 ?auto_63840 ) ) ( not ( = ?auto_63854 ?auto_63840 ) ) ( not ( = ?auto_63841 ?auto_63840 ) ) ( not ( = ?auto_63856 ?auto_63840 ) ) ( not ( = ?auto_63833 ?auto_63840 ) ) ( not ( = ?auto_63837 ?auto_63834 ) ) ( not ( = ?auto_63851 ?auto_63837 ) ) ( not ( = ?auto_63843 ?auto_63837 ) ) ( not ( = ?auto_63844 ?auto_63837 ) ) ( HOIST-AT ?auto_63853 ?auto_63837 ) ( not ( = ?auto_63848 ?auto_63853 ) ) ( not ( = ?auto_63846 ?auto_63853 ) ) ( not ( = ?auto_63827 ?auto_63853 ) ) ( not ( = ?auto_63857 ?auto_63853 ) ) ( SURFACE-AT ?auto_63856 ?auto_63837 ) ( ON ?auto_63856 ?auto_63835 ) ( CLEAR ?auto_63856 ) ( not ( = ?auto_63825 ?auto_63835 ) ) ( not ( = ?auto_63826 ?auto_63835 ) ) ( not ( = ?auto_63842 ?auto_63835 ) ) ( not ( = ?auto_63854 ?auto_63835 ) ) ( not ( = ?auto_63841 ?auto_63835 ) ) ( not ( = ?auto_63856 ?auto_63835 ) ) ( not ( = ?auto_63833 ?auto_63835 ) ) ( not ( = ?auto_63840 ?auto_63835 ) ) ( IS-CRATE ?auto_63840 ) ( not ( = ?auto_63825 ?auto_63852 ) ) ( not ( = ?auto_63826 ?auto_63852 ) ) ( not ( = ?auto_63842 ?auto_63852 ) ) ( not ( = ?auto_63854 ?auto_63852 ) ) ( not ( = ?auto_63841 ?auto_63852 ) ) ( not ( = ?auto_63856 ?auto_63852 ) ) ( not ( = ?auto_63833 ?auto_63852 ) ) ( not ( = ?auto_63840 ?auto_63852 ) ) ( not ( = ?auto_63835 ?auto_63852 ) ) ( not ( = ?auto_63859 ?auto_63834 ) ) ( not ( = ?auto_63851 ?auto_63859 ) ) ( not ( = ?auto_63843 ?auto_63859 ) ) ( not ( = ?auto_63844 ?auto_63859 ) ) ( not ( = ?auto_63837 ?auto_63859 ) ) ( HOIST-AT ?auto_63830 ?auto_63859 ) ( not ( = ?auto_63848 ?auto_63830 ) ) ( not ( = ?auto_63846 ?auto_63830 ) ) ( not ( = ?auto_63827 ?auto_63830 ) ) ( not ( = ?auto_63857 ?auto_63830 ) ) ( not ( = ?auto_63853 ?auto_63830 ) ) ( AVAILABLE ?auto_63830 ) ( SURFACE-AT ?auto_63840 ?auto_63859 ) ( ON ?auto_63840 ?auto_63839 ) ( CLEAR ?auto_63840 ) ( not ( = ?auto_63825 ?auto_63839 ) ) ( not ( = ?auto_63826 ?auto_63839 ) ) ( not ( = ?auto_63842 ?auto_63839 ) ) ( not ( = ?auto_63854 ?auto_63839 ) ) ( not ( = ?auto_63841 ?auto_63839 ) ) ( not ( = ?auto_63856 ?auto_63839 ) ) ( not ( = ?auto_63833 ?auto_63839 ) ) ( not ( = ?auto_63840 ?auto_63839 ) ) ( not ( = ?auto_63835 ?auto_63839 ) ) ( not ( = ?auto_63852 ?auto_63839 ) ) ( IS-CRATE ?auto_63852 ) ( not ( = ?auto_63825 ?auto_63845 ) ) ( not ( = ?auto_63826 ?auto_63845 ) ) ( not ( = ?auto_63842 ?auto_63845 ) ) ( not ( = ?auto_63854 ?auto_63845 ) ) ( not ( = ?auto_63841 ?auto_63845 ) ) ( not ( = ?auto_63856 ?auto_63845 ) ) ( not ( = ?auto_63833 ?auto_63845 ) ) ( not ( = ?auto_63840 ?auto_63845 ) ) ( not ( = ?auto_63835 ?auto_63845 ) ) ( not ( = ?auto_63852 ?auto_63845 ) ) ( not ( = ?auto_63839 ?auto_63845 ) ) ( not ( = ?auto_63836 ?auto_63834 ) ) ( not ( = ?auto_63851 ?auto_63836 ) ) ( not ( = ?auto_63843 ?auto_63836 ) ) ( not ( = ?auto_63844 ?auto_63836 ) ) ( not ( = ?auto_63837 ?auto_63836 ) ) ( not ( = ?auto_63859 ?auto_63836 ) ) ( HOIST-AT ?auto_63849 ?auto_63836 ) ( not ( = ?auto_63848 ?auto_63849 ) ) ( not ( = ?auto_63846 ?auto_63849 ) ) ( not ( = ?auto_63827 ?auto_63849 ) ) ( not ( = ?auto_63857 ?auto_63849 ) ) ( not ( = ?auto_63853 ?auto_63849 ) ) ( not ( = ?auto_63830 ?auto_63849 ) ) ( AVAILABLE ?auto_63849 ) ( SURFACE-AT ?auto_63852 ?auto_63836 ) ( ON ?auto_63852 ?auto_63855 ) ( CLEAR ?auto_63852 ) ( not ( = ?auto_63825 ?auto_63855 ) ) ( not ( = ?auto_63826 ?auto_63855 ) ) ( not ( = ?auto_63842 ?auto_63855 ) ) ( not ( = ?auto_63854 ?auto_63855 ) ) ( not ( = ?auto_63841 ?auto_63855 ) ) ( not ( = ?auto_63856 ?auto_63855 ) ) ( not ( = ?auto_63833 ?auto_63855 ) ) ( not ( = ?auto_63840 ?auto_63855 ) ) ( not ( = ?auto_63835 ?auto_63855 ) ) ( not ( = ?auto_63852 ?auto_63855 ) ) ( not ( = ?auto_63839 ?auto_63855 ) ) ( not ( = ?auto_63845 ?auto_63855 ) ) ( IS-CRATE ?auto_63845 ) ( not ( = ?auto_63825 ?auto_63838 ) ) ( not ( = ?auto_63826 ?auto_63838 ) ) ( not ( = ?auto_63842 ?auto_63838 ) ) ( not ( = ?auto_63854 ?auto_63838 ) ) ( not ( = ?auto_63841 ?auto_63838 ) ) ( not ( = ?auto_63856 ?auto_63838 ) ) ( not ( = ?auto_63833 ?auto_63838 ) ) ( not ( = ?auto_63840 ?auto_63838 ) ) ( not ( = ?auto_63835 ?auto_63838 ) ) ( not ( = ?auto_63852 ?auto_63838 ) ) ( not ( = ?auto_63839 ?auto_63838 ) ) ( not ( = ?auto_63845 ?auto_63838 ) ) ( not ( = ?auto_63855 ?auto_63838 ) ) ( AVAILABLE ?auto_63827 ) ( SURFACE-AT ?auto_63845 ?auto_63843 ) ( ON ?auto_63845 ?auto_63850 ) ( CLEAR ?auto_63845 ) ( not ( = ?auto_63825 ?auto_63850 ) ) ( not ( = ?auto_63826 ?auto_63850 ) ) ( not ( = ?auto_63842 ?auto_63850 ) ) ( not ( = ?auto_63854 ?auto_63850 ) ) ( not ( = ?auto_63841 ?auto_63850 ) ) ( not ( = ?auto_63856 ?auto_63850 ) ) ( not ( = ?auto_63833 ?auto_63850 ) ) ( not ( = ?auto_63840 ?auto_63850 ) ) ( not ( = ?auto_63835 ?auto_63850 ) ) ( not ( = ?auto_63852 ?auto_63850 ) ) ( not ( = ?auto_63839 ?auto_63850 ) ) ( not ( = ?auto_63845 ?auto_63850 ) ) ( not ( = ?auto_63855 ?auto_63850 ) ) ( not ( = ?auto_63838 ?auto_63850 ) ) ( IS-CRATE ?auto_63838 ) ( not ( = ?auto_63825 ?auto_63858 ) ) ( not ( = ?auto_63826 ?auto_63858 ) ) ( not ( = ?auto_63842 ?auto_63858 ) ) ( not ( = ?auto_63854 ?auto_63858 ) ) ( not ( = ?auto_63841 ?auto_63858 ) ) ( not ( = ?auto_63856 ?auto_63858 ) ) ( not ( = ?auto_63833 ?auto_63858 ) ) ( not ( = ?auto_63840 ?auto_63858 ) ) ( not ( = ?auto_63835 ?auto_63858 ) ) ( not ( = ?auto_63852 ?auto_63858 ) ) ( not ( = ?auto_63839 ?auto_63858 ) ) ( not ( = ?auto_63845 ?auto_63858 ) ) ( not ( = ?auto_63855 ?auto_63858 ) ) ( not ( = ?auto_63838 ?auto_63858 ) ) ( not ( = ?auto_63850 ?auto_63858 ) ) ( AVAILABLE ?auto_63853 ) ( SURFACE-AT ?auto_63838 ?auto_63837 ) ( ON ?auto_63838 ?auto_63847 ) ( CLEAR ?auto_63838 ) ( not ( = ?auto_63825 ?auto_63847 ) ) ( not ( = ?auto_63826 ?auto_63847 ) ) ( not ( = ?auto_63842 ?auto_63847 ) ) ( not ( = ?auto_63854 ?auto_63847 ) ) ( not ( = ?auto_63841 ?auto_63847 ) ) ( not ( = ?auto_63856 ?auto_63847 ) ) ( not ( = ?auto_63833 ?auto_63847 ) ) ( not ( = ?auto_63840 ?auto_63847 ) ) ( not ( = ?auto_63835 ?auto_63847 ) ) ( not ( = ?auto_63852 ?auto_63847 ) ) ( not ( = ?auto_63839 ?auto_63847 ) ) ( not ( = ?auto_63845 ?auto_63847 ) ) ( not ( = ?auto_63855 ?auto_63847 ) ) ( not ( = ?auto_63838 ?auto_63847 ) ) ( not ( = ?auto_63850 ?auto_63847 ) ) ( not ( = ?auto_63858 ?auto_63847 ) ) ( SURFACE-AT ?auto_63829 ?auto_63834 ) ( CLEAR ?auto_63829 ) ( IS-CRATE ?auto_63858 ) ( not ( = ?auto_63825 ?auto_63829 ) ) ( not ( = ?auto_63826 ?auto_63829 ) ) ( not ( = ?auto_63842 ?auto_63829 ) ) ( not ( = ?auto_63854 ?auto_63829 ) ) ( not ( = ?auto_63841 ?auto_63829 ) ) ( not ( = ?auto_63856 ?auto_63829 ) ) ( not ( = ?auto_63833 ?auto_63829 ) ) ( not ( = ?auto_63840 ?auto_63829 ) ) ( not ( = ?auto_63835 ?auto_63829 ) ) ( not ( = ?auto_63852 ?auto_63829 ) ) ( not ( = ?auto_63839 ?auto_63829 ) ) ( not ( = ?auto_63845 ?auto_63829 ) ) ( not ( = ?auto_63855 ?auto_63829 ) ) ( not ( = ?auto_63838 ?auto_63829 ) ) ( not ( = ?auto_63850 ?auto_63829 ) ) ( not ( = ?auto_63858 ?auto_63829 ) ) ( not ( = ?auto_63847 ?auto_63829 ) ) ( AVAILABLE ?auto_63848 ) ( TRUCK-AT ?auto_63832 ?auto_63828 ) ( not ( = ?auto_63828 ?auto_63834 ) ) ( not ( = ?auto_63851 ?auto_63828 ) ) ( not ( = ?auto_63843 ?auto_63828 ) ) ( not ( = ?auto_63844 ?auto_63828 ) ) ( not ( = ?auto_63837 ?auto_63828 ) ) ( not ( = ?auto_63859 ?auto_63828 ) ) ( not ( = ?auto_63836 ?auto_63828 ) ) ( HOIST-AT ?auto_63831 ?auto_63828 ) ( not ( = ?auto_63848 ?auto_63831 ) ) ( not ( = ?auto_63846 ?auto_63831 ) ) ( not ( = ?auto_63827 ?auto_63831 ) ) ( not ( = ?auto_63857 ?auto_63831 ) ) ( not ( = ?auto_63853 ?auto_63831 ) ) ( not ( = ?auto_63830 ?auto_63831 ) ) ( not ( = ?auto_63849 ?auto_63831 ) ) ( AVAILABLE ?auto_63831 ) ( SURFACE-AT ?auto_63858 ?auto_63828 ) ( ON ?auto_63858 ?auto_63860 ) ( CLEAR ?auto_63858 ) ( not ( = ?auto_63825 ?auto_63860 ) ) ( not ( = ?auto_63826 ?auto_63860 ) ) ( not ( = ?auto_63842 ?auto_63860 ) ) ( not ( = ?auto_63854 ?auto_63860 ) ) ( not ( = ?auto_63841 ?auto_63860 ) ) ( not ( = ?auto_63856 ?auto_63860 ) ) ( not ( = ?auto_63833 ?auto_63860 ) ) ( not ( = ?auto_63840 ?auto_63860 ) ) ( not ( = ?auto_63835 ?auto_63860 ) ) ( not ( = ?auto_63852 ?auto_63860 ) ) ( not ( = ?auto_63839 ?auto_63860 ) ) ( not ( = ?auto_63845 ?auto_63860 ) ) ( not ( = ?auto_63855 ?auto_63860 ) ) ( not ( = ?auto_63838 ?auto_63860 ) ) ( not ( = ?auto_63850 ?auto_63860 ) ) ( not ( = ?auto_63858 ?auto_63860 ) ) ( not ( = ?auto_63847 ?auto_63860 ) ) ( not ( = ?auto_63829 ?auto_63860 ) ) )
    :subtasks
    ( ( !LIFT ?auto_63831 ?auto_63858 ?auto_63860 ?auto_63828 )
      ( MAKE-ON ?auto_63825 ?auto_63826 )
      ( MAKE-ON-VERIFY ?auto_63825 ?auto_63826 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_63861 - SURFACE
      ?auto_63862 - SURFACE
    )
    :vars
    (
      ?auto_63884 - HOIST
      ?auto_63865 - PLACE
      ?auto_63870 - PLACE
      ?auto_63882 - HOIST
      ?auto_63886 - SURFACE
      ?auto_63874 - SURFACE
      ?auto_63879 - PLACE
      ?auto_63896 - HOIST
      ?auto_63869 - SURFACE
      ?auto_63876 - SURFACE
      ?auto_63880 - PLACE
      ?auto_63877 - HOIST
      ?auto_63887 - SURFACE
      ?auto_63891 - SURFACE
      ?auto_63892 - PLACE
      ?auto_63873 - HOIST
      ?auto_63895 - SURFACE
      ?auto_63872 - SURFACE
      ?auto_63864 - PLACE
      ?auto_63863 - HOIST
      ?auto_63866 - SURFACE
      ?auto_63881 - SURFACE
      ?auto_63893 - PLACE
      ?auto_63885 - HOIST
      ?auto_63875 - SURFACE
      ?auto_63888 - SURFACE
      ?auto_63878 - SURFACE
      ?auto_63871 - SURFACE
      ?auto_63883 - SURFACE
      ?auto_63868 - SURFACE
      ?auto_63889 - PLACE
      ?auto_63890 - HOIST
      ?auto_63894 - SURFACE
      ?auto_63867 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63884 ?auto_63865 ) ( IS-CRATE ?auto_63861 ) ( not ( = ?auto_63861 ?auto_63862 ) ) ( not ( = ?auto_63870 ?auto_63865 ) ) ( HOIST-AT ?auto_63882 ?auto_63870 ) ( not ( = ?auto_63884 ?auto_63882 ) ) ( AVAILABLE ?auto_63882 ) ( SURFACE-AT ?auto_63861 ?auto_63870 ) ( ON ?auto_63861 ?auto_63886 ) ( CLEAR ?auto_63861 ) ( not ( = ?auto_63861 ?auto_63886 ) ) ( not ( = ?auto_63862 ?auto_63886 ) ) ( IS-CRATE ?auto_63862 ) ( not ( = ?auto_63861 ?auto_63874 ) ) ( not ( = ?auto_63862 ?auto_63874 ) ) ( not ( = ?auto_63886 ?auto_63874 ) ) ( not ( = ?auto_63879 ?auto_63865 ) ) ( not ( = ?auto_63870 ?auto_63879 ) ) ( HOIST-AT ?auto_63896 ?auto_63879 ) ( not ( = ?auto_63884 ?auto_63896 ) ) ( not ( = ?auto_63882 ?auto_63896 ) ) ( SURFACE-AT ?auto_63862 ?auto_63879 ) ( ON ?auto_63862 ?auto_63869 ) ( CLEAR ?auto_63862 ) ( not ( = ?auto_63861 ?auto_63869 ) ) ( not ( = ?auto_63862 ?auto_63869 ) ) ( not ( = ?auto_63886 ?auto_63869 ) ) ( not ( = ?auto_63874 ?auto_63869 ) ) ( IS-CRATE ?auto_63874 ) ( not ( = ?auto_63861 ?auto_63876 ) ) ( not ( = ?auto_63862 ?auto_63876 ) ) ( not ( = ?auto_63886 ?auto_63876 ) ) ( not ( = ?auto_63874 ?auto_63876 ) ) ( not ( = ?auto_63869 ?auto_63876 ) ) ( not ( = ?auto_63880 ?auto_63865 ) ) ( not ( = ?auto_63870 ?auto_63880 ) ) ( not ( = ?auto_63879 ?auto_63880 ) ) ( HOIST-AT ?auto_63877 ?auto_63880 ) ( not ( = ?auto_63884 ?auto_63877 ) ) ( not ( = ?auto_63882 ?auto_63877 ) ) ( not ( = ?auto_63896 ?auto_63877 ) ) ( AVAILABLE ?auto_63877 ) ( SURFACE-AT ?auto_63874 ?auto_63880 ) ( ON ?auto_63874 ?auto_63887 ) ( CLEAR ?auto_63874 ) ( not ( = ?auto_63861 ?auto_63887 ) ) ( not ( = ?auto_63862 ?auto_63887 ) ) ( not ( = ?auto_63886 ?auto_63887 ) ) ( not ( = ?auto_63874 ?auto_63887 ) ) ( not ( = ?auto_63869 ?auto_63887 ) ) ( not ( = ?auto_63876 ?auto_63887 ) ) ( IS-CRATE ?auto_63876 ) ( not ( = ?auto_63861 ?auto_63891 ) ) ( not ( = ?auto_63862 ?auto_63891 ) ) ( not ( = ?auto_63886 ?auto_63891 ) ) ( not ( = ?auto_63874 ?auto_63891 ) ) ( not ( = ?auto_63869 ?auto_63891 ) ) ( not ( = ?auto_63876 ?auto_63891 ) ) ( not ( = ?auto_63887 ?auto_63891 ) ) ( not ( = ?auto_63892 ?auto_63865 ) ) ( not ( = ?auto_63870 ?auto_63892 ) ) ( not ( = ?auto_63879 ?auto_63892 ) ) ( not ( = ?auto_63880 ?auto_63892 ) ) ( HOIST-AT ?auto_63873 ?auto_63892 ) ( not ( = ?auto_63884 ?auto_63873 ) ) ( not ( = ?auto_63882 ?auto_63873 ) ) ( not ( = ?auto_63896 ?auto_63873 ) ) ( not ( = ?auto_63877 ?auto_63873 ) ) ( SURFACE-AT ?auto_63876 ?auto_63892 ) ( ON ?auto_63876 ?auto_63895 ) ( CLEAR ?auto_63876 ) ( not ( = ?auto_63861 ?auto_63895 ) ) ( not ( = ?auto_63862 ?auto_63895 ) ) ( not ( = ?auto_63886 ?auto_63895 ) ) ( not ( = ?auto_63874 ?auto_63895 ) ) ( not ( = ?auto_63869 ?auto_63895 ) ) ( not ( = ?auto_63876 ?auto_63895 ) ) ( not ( = ?auto_63887 ?auto_63895 ) ) ( not ( = ?auto_63891 ?auto_63895 ) ) ( IS-CRATE ?auto_63891 ) ( not ( = ?auto_63861 ?auto_63872 ) ) ( not ( = ?auto_63862 ?auto_63872 ) ) ( not ( = ?auto_63886 ?auto_63872 ) ) ( not ( = ?auto_63874 ?auto_63872 ) ) ( not ( = ?auto_63869 ?auto_63872 ) ) ( not ( = ?auto_63876 ?auto_63872 ) ) ( not ( = ?auto_63887 ?auto_63872 ) ) ( not ( = ?auto_63891 ?auto_63872 ) ) ( not ( = ?auto_63895 ?auto_63872 ) ) ( not ( = ?auto_63864 ?auto_63865 ) ) ( not ( = ?auto_63870 ?auto_63864 ) ) ( not ( = ?auto_63879 ?auto_63864 ) ) ( not ( = ?auto_63880 ?auto_63864 ) ) ( not ( = ?auto_63892 ?auto_63864 ) ) ( HOIST-AT ?auto_63863 ?auto_63864 ) ( not ( = ?auto_63884 ?auto_63863 ) ) ( not ( = ?auto_63882 ?auto_63863 ) ) ( not ( = ?auto_63896 ?auto_63863 ) ) ( not ( = ?auto_63877 ?auto_63863 ) ) ( not ( = ?auto_63873 ?auto_63863 ) ) ( AVAILABLE ?auto_63863 ) ( SURFACE-AT ?auto_63891 ?auto_63864 ) ( ON ?auto_63891 ?auto_63866 ) ( CLEAR ?auto_63891 ) ( not ( = ?auto_63861 ?auto_63866 ) ) ( not ( = ?auto_63862 ?auto_63866 ) ) ( not ( = ?auto_63886 ?auto_63866 ) ) ( not ( = ?auto_63874 ?auto_63866 ) ) ( not ( = ?auto_63869 ?auto_63866 ) ) ( not ( = ?auto_63876 ?auto_63866 ) ) ( not ( = ?auto_63887 ?auto_63866 ) ) ( not ( = ?auto_63891 ?auto_63866 ) ) ( not ( = ?auto_63895 ?auto_63866 ) ) ( not ( = ?auto_63872 ?auto_63866 ) ) ( IS-CRATE ?auto_63872 ) ( not ( = ?auto_63861 ?auto_63881 ) ) ( not ( = ?auto_63862 ?auto_63881 ) ) ( not ( = ?auto_63886 ?auto_63881 ) ) ( not ( = ?auto_63874 ?auto_63881 ) ) ( not ( = ?auto_63869 ?auto_63881 ) ) ( not ( = ?auto_63876 ?auto_63881 ) ) ( not ( = ?auto_63887 ?auto_63881 ) ) ( not ( = ?auto_63891 ?auto_63881 ) ) ( not ( = ?auto_63895 ?auto_63881 ) ) ( not ( = ?auto_63872 ?auto_63881 ) ) ( not ( = ?auto_63866 ?auto_63881 ) ) ( not ( = ?auto_63893 ?auto_63865 ) ) ( not ( = ?auto_63870 ?auto_63893 ) ) ( not ( = ?auto_63879 ?auto_63893 ) ) ( not ( = ?auto_63880 ?auto_63893 ) ) ( not ( = ?auto_63892 ?auto_63893 ) ) ( not ( = ?auto_63864 ?auto_63893 ) ) ( HOIST-AT ?auto_63885 ?auto_63893 ) ( not ( = ?auto_63884 ?auto_63885 ) ) ( not ( = ?auto_63882 ?auto_63885 ) ) ( not ( = ?auto_63896 ?auto_63885 ) ) ( not ( = ?auto_63877 ?auto_63885 ) ) ( not ( = ?auto_63873 ?auto_63885 ) ) ( not ( = ?auto_63863 ?auto_63885 ) ) ( AVAILABLE ?auto_63885 ) ( SURFACE-AT ?auto_63872 ?auto_63893 ) ( ON ?auto_63872 ?auto_63875 ) ( CLEAR ?auto_63872 ) ( not ( = ?auto_63861 ?auto_63875 ) ) ( not ( = ?auto_63862 ?auto_63875 ) ) ( not ( = ?auto_63886 ?auto_63875 ) ) ( not ( = ?auto_63874 ?auto_63875 ) ) ( not ( = ?auto_63869 ?auto_63875 ) ) ( not ( = ?auto_63876 ?auto_63875 ) ) ( not ( = ?auto_63887 ?auto_63875 ) ) ( not ( = ?auto_63891 ?auto_63875 ) ) ( not ( = ?auto_63895 ?auto_63875 ) ) ( not ( = ?auto_63872 ?auto_63875 ) ) ( not ( = ?auto_63866 ?auto_63875 ) ) ( not ( = ?auto_63881 ?auto_63875 ) ) ( IS-CRATE ?auto_63881 ) ( not ( = ?auto_63861 ?auto_63888 ) ) ( not ( = ?auto_63862 ?auto_63888 ) ) ( not ( = ?auto_63886 ?auto_63888 ) ) ( not ( = ?auto_63874 ?auto_63888 ) ) ( not ( = ?auto_63869 ?auto_63888 ) ) ( not ( = ?auto_63876 ?auto_63888 ) ) ( not ( = ?auto_63887 ?auto_63888 ) ) ( not ( = ?auto_63891 ?auto_63888 ) ) ( not ( = ?auto_63895 ?auto_63888 ) ) ( not ( = ?auto_63872 ?auto_63888 ) ) ( not ( = ?auto_63866 ?auto_63888 ) ) ( not ( = ?auto_63881 ?auto_63888 ) ) ( not ( = ?auto_63875 ?auto_63888 ) ) ( AVAILABLE ?auto_63896 ) ( SURFACE-AT ?auto_63881 ?auto_63879 ) ( ON ?auto_63881 ?auto_63878 ) ( CLEAR ?auto_63881 ) ( not ( = ?auto_63861 ?auto_63878 ) ) ( not ( = ?auto_63862 ?auto_63878 ) ) ( not ( = ?auto_63886 ?auto_63878 ) ) ( not ( = ?auto_63874 ?auto_63878 ) ) ( not ( = ?auto_63869 ?auto_63878 ) ) ( not ( = ?auto_63876 ?auto_63878 ) ) ( not ( = ?auto_63887 ?auto_63878 ) ) ( not ( = ?auto_63891 ?auto_63878 ) ) ( not ( = ?auto_63895 ?auto_63878 ) ) ( not ( = ?auto_63872 ?auto_63878 ) ) ( not ( = ?auto_63866 ?auto_63878 ) ) ( not ( = ?auto_63881 ?auto_63878 ) ) ( not ( = ?auto_63875 ?auto_63878 ) ) ( not ( = ?auto_63888 ?auto_63878 ) ) ( IS-CRATE ?auto_63888 ) ( not ( = ?auto_63861 ?auto_63871 ) ) ( not ( = ?auto_63862 ?auto_63871 ) ) ( not ( = ?auto_63886 ?auto_63871 ) ) ( not ( = ?auto_63874 ?auto_63871 ) ) ( not ( = ?auto_63869 ?auto_63871 ) ) ( not ( = ?auto_63876 ?auto_63871 ) ) ( not ( = ?auto_63887 ?auto_63871 ) ) ( not ( = ?auto_63891 ?auto_63871 ) ) ( not ( = ?auto_63895 ?auto_63871 ) ) ( not ( = ?auto_63872 ?auto_63871 ) ) ( not ( = ?auto_63866 ?auto_63871 ) ) ( not ( = ?auto_63881 ?auto_63871 ) ) ( not ( = ?auto_63875 ?auto_63871 ) ) ( not ( = ?auto_63888 ?auto_63871 ) ) ( not ( = ?auto_63878 ?auto_63871 ) ) ( AVAILABLE ?auto_63873 ) ( SURFACE-AT ?auto_63888 ?auto_63892 ) ( ON ?auto_63888 ?auto_63883 ) ( CLEAR ?auto_63888 ) ( not ( = ?auto_63861 ?auto_63883 ) ) ( not ( = ?auto_63862 ?auto_63883 ) ) ( not ( = ?auto_63886 ?auto_63883 ) ) ( not ( = ?auto_63874 ?auto_63883 ) ) ( not ( = ?auto_63869 ?auto_63883 ) ) ( not ( = ?auto_63876 ?auto_63883 ) ) ( not ( = ?auto_63887 ?auto_63883 ) ) ( not ( = ?auto_63891 ?auto_63883 ) ) ( not ( = ?auto_63895 ?auto_63883 ) ) ( not ( = ?auto_63872 ?auto_63883 ) ) ( not ( = ?auto_63866 ?auto_63883 ) ) ( not ( = ?auto_63881 ?auto_63883 ) ) ( not ( = ?auto_63875 ?auto_63883 ) ) ( not ( = ?auto_63888 ?auto_63883 ) ) ( not ( = ?auto_63878 ?auto_63883 ) ) ( not ( = ?auto_63871 ?auto_63883 ) ) ( SURFACE-AT ?auto_63868 ?auto_63865 ) ( CLEAR ?auto_63868 ) ( IS-CRATE ?auto_63871 ) ( not ( = ?auto_63861 ?auto_63868 ) ) ( not ( = ?auto_63862 ?auto_63868 ) ) ( not ( = ?auto_63886 ?auto_63868 ) ) ( not ( = ?auto_63874 ?auto_63868 ) ) ( not ( = ?auto_63869 ?auto_63868 ) ) ( not ( = ?auto_63876 ?auto_63868 ) ) ( not ( = ?auto_63887 ?auto_63868 ) ) ( not ( = ?auto_63891 ?auto_63868 ) ) ( not ( = ?auto_63895 ?auto_63868 ) ) ( not ( = ?auto_63872 ?auto_63868 ) ) ( not ( = ?auto_63866 ?auto_63868 ) ) ( not ( = ?auto_63881 ?auto_63868 ) ) ( not ( = ?auto_63875 ?auto_63868 ) ) ( not ( = ?auto_63888 ?auto_63868 ) ) ( not ( = ?auto_63878 ?auto_63868 ) ) ( not ( = ?auto_63871 ?auto_63868 ) ) ( not ( = ?auto_63883 ?auto_63868 ) ) ( AVAILABLE ?auto_63884 ) ( not ( = ?auto_63889 ?auto_63865 ) ) ( not ( = ?auto_63870 ?auto_63889 ) ) ( not ( = ?auto_63879 ?auto_63889 ) ) ( not ( = ?auto_63880 ?auto_63889 ) ) ( not ( = ?auto_63892 ?auto_63889 ) ) ( not ( = ?auto_63864 ?auto_63889 ) ) ( not ( = ?auto_63893 ?auto_63889 ) ) ( HOIST-AT ?auto_63890 ?auto_63889 ) ( not ( = ?auto_63884 ?auto_63890 ) ) ( not ( = ?auto_63882 ?auto_63890 ) ) ( not ( = ?auto_63896 ?auto_63890 ) ) ( not ( = ?auto_63877 ?auto_63890 ) ) ( not ( = ?auto_63873 ?auto_63890 ) ) ( not ( = ?auto_63863 ?auto_63890 ) ) ( not ( = ?auto_63885 ?auto_63890 ) ) ( AVAILABLE ?auto_63890 ) ( SURFACE-AT ?auto_63871 ?auto_63889 ) ( ON ?auto_63871 ?auto_63894 ) ( CLEAR ?auto_63871 ) ( not ( = ?auto_63861 ?auto_63894 ) ) ( not ( = ?auto_63862 ?auto_63894 ) ) ( not ( = ?auto_63886 ?auto_63894 ) ) ( not ( = ?auto_63874 ?auto_63894 ) ) ( not ( = ?auto_63869 ?auto_63894 ) ) ( not ( = ?auto_63876 ?auto_63894 ) ) ( not ( = ?auto_63887 ?auto_63894 ) ) ( not ( = ?auto_63891 ?auto_63894 ) ) ( not ( = ?auto_63895 ?auto_63894 ) ) ( not ( = ?auto_63872 ?auto_63894 ) ) ( not ( = ?auto_63866 ?auto_63894 ) ) ( not ( = ?auto_63881 ?auto_63894 ) ) ( not ( = ?auto_63875 ?auto_63894 ) ) ( not ( = ?auto_63888 ?auto_63894 ) ) ( not ( = ?auto_63878 ?auto_63894 ) ) ( not ( = ?auto_63871 ?auto_63894 ) ) ( not ( = ?auto_63883 ?auto_63894 ) ) ( not ( = ?auto_63868 ?auto_63894 ) ) ( TRUCK-AT ?auto_63867 ?auto_63865 ) )
    :subtasks
    ( ( !DRIVE ?auto_63867 ?auto_63865 ?auto_63889 )
      ( MAKE-ON ?auto_63861 ?auto_63862 )
      ( MAKE-ON-VERIFY ?auto_63861 ?auto_63862 ) )
  )

)

