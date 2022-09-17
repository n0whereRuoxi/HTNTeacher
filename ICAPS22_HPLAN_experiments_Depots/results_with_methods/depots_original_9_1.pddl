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
      ?auto_50400 - SURFACE
      ?auto_50401 - SURFACE
    )
    :vars
    (
      ?auto_50402 - HOIST
      ?auto_50403 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50402 ?auto_50403 ) ( SURFACE-AT ?auto_50401 ?auto_50403 ) ( CLEAR ?auto_50401 ) ( LIFTING ?auto_50402 ?auto_50400 ) ( IS-CRATE ?auto_50400 ) ( not ( = ?auto_50400 ?auto_50401 ) ) )
    :subtasks
    ( ( !DROP ?auto_50402 ?auto_50400 ?auto_50401 ?auto_50403 )
      ( MAKE-ON-VERIFY ?auto_50400 ?auto_50401 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50404 - SURFACE
      ?auto_50405 - SURFACE
    )
    :vars
    (
      ?auto_50406 - HOIST
      ?auto_50407 - PLACE
      ?auto_50408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50406 ?auto_50407 ) ( SURFACE-AT ?auto_50405 ?auto_50407 ) ( CLEAR ?auto_50405 ) ( IS-CRATE ?auto_50404 ) ( not ( = ?auto_50404 ?auto_50405 ) ) ( TRUCK-AT ?auto_50408 ?auto_50407 ) ( AVAILABLE ?auto_50406 ) ( IN ?auto_50404 ?auto_50408 ) )
    :subtasks
    ( ( !UNLOAD ?auto_50406 ?auto_50404 ?auto_50408 ?auto_50407 )
      ( MAKE-ON ?auto_50404 ?auto_50405 )
      ( MAKE-ON-VERIFY ?auto_50404 ?auto_50405 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50409 - SURFACE
      ?auto_50410 - SURFACE
    )
    :vars
    (
      ?auto_50413 - HOIST
      ?auto_50412 - PLACE
      ?auto_50411 - TRUCK
      ?auto_50414 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50413 ?auto_50412 ) ( SURFACE-AT ?auto_50410 ?auto_50412 ) ( CLEAR ?auto_50410 ) ( IS-CRATE ?auto_50409 ) ( not ( = ?auto_50409 ?auto_50410 ) ) ( AVAILABLE ?auto_50413 ) ( IN ?auto_50409 ?auto_50411 ) ( TRUCK-AT ?auto_50411 ?auto_50414 ) ( not ( = ?auto_50414 ?auto_50412 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_50411 ?auto_50414 ?auto_50412 )
      ( MAKE-ON ?auto_50409 ?auto_50410 )
      ( MAKE-ON-VERIFY ?auto_50409 ?auto_50410 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50415 - SURFACE
      ?auto_50416 - SURFACE
    )
    :vars
    (
      ?auto_50418 - HOIST
      ?auto_50417 - PLACE
      ?auto_50420 - TRUCK
      ?auto_50419 - PLACE
      ?auto_50421 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_50418 ?auto_50417 ) ( SURFACE-AT ?auto_50416 ?auto_50417 ) ( CLEAR ?auto_50416 ) ( IS-CRATE ?auto_50415 ) ( not ( = ?auto_50415 ?auto_50416 ) ) ( AVAILABLE ?auto_50418 ) ( TRUCK-AT ?auto_50420 ?auto_50419 ) ( not ( = ?auto_50419 ?auto_50417 ) ) ( HOIST-AT ?auto_50421 ?auto_50419 ) ( LIFTING ?auto_50421 ?auto_50415 ) ( not ( = ?auto_50418 ?auto_50421 ) ) )
    :subtasks
    ( ( !LOAD ?auto_50421 ?auto_50415 ?auto_50420 ?auto_50419 )
      ( MAKE-ON ?auto_50415 ?auto_50416 )
      ( MAKE-ON-VERIFY ?auto_50415 ?auto_50416 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50422 - SURFACE
      ?auto_50423 - SURFACE
    )
    :vars
    (
      ?auto_50424 - HOIST
      ?auto_50428 - PLACE
      ?auto_50426 - TRUCK
      ?auto_50425 - PLACE
      ?auto_50427 - HOIST
      ?auto_50429 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50424 ?auto_50428 ) ( SURFACE-AT ?auto_50423 ?auto_50428 ) ( CLEAR ?auto_50423 ) ( IS-CRATE ?auto_50422 ) ( not ( = ?auto_50422 ?auto_50423 ) ) ( AVAILABLE ?auto_50424 ) ( TRUCK-AT ?auto_50426 ?auto_50425 ) ( not ( = ?auto_50425 ?auto_50428 ) ) ( HOIST-AT ?auto_50427 ?auto_50425 ) ( not ( = ?auto_50424 ?auto_50427 ) ) ( AVAILABLE ?auto_50427 ) ( SURFACE-AT ?auto_50422 ?auto_50425 ) ( ON ?auto_50422 ?auto_50429 ) ( CLEAR ?auto_50422 ) ( not ( = ?auto_50422 ?auto_50429 ) ) ( not ( = ?auto_50423 ?auto_50429 ) ) )
    :subtasks
    ( ( !LIFT ?auto_50427 ?auto_50422 ?auto_50429 ?auto_50425 )
      ( MAKE-ON ?auto_50422 ?auto_50423 )
      ( MAKE-ON-VERIFY ?auto_50422 ?auto_50423 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50430 - SURFACE
      ?auto_50431 - SURFACE
    )
    :vars
    (
      ?auto_50437 - HOIST
      ?auto_50433 - PLACE
      ?auto_50434 - PLACE
      ?auto_50436 - HOIST
      ?auto_50435 - SURFACE
      ?auto_50432 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50437 ?auto_50433 ) ( SURFACE-AT ?auto_50431 ?auto_50433 ) ( CLEAR ?auto_50431 ) ( IS-CRATE ?auto_50430 ) ( not ( = ?auto_50430 ?auto_50431 ) ) ( AVAILABLE ?auto_50437 ) ( not ( = ?auto_50434 ?auto_50433 ) ) ( HOIST-AT ?auto_50436 ?auto_50434 ) ( not ( = ?auto_50437 ?auto_50436 ) ) ( AVAILABLE ?auto_50436 ) ( SURFACE-AT ?auto_50430 ?auto_50434 ) ( ON ?auto_50430 ?auto_50435 ) ( CLEAR ?auto_50430 ) ( not ( = ?auto_50430 ?auto_50435 ) ) ( not ( = ?auto_50431 ?auto_50435 ) ) ( TRUCK-AT ?auto_50432 ?auto_50433 ) )
    :subtasks
    ( ( !DRIVE ?auto_50432 ?auto_50433 ?auto_50434 )
      ( MAKE-ON ?auto_50430 ?auto_50431 )
      ( MAKE-ON-VERIFY ?auto_50430 ?auto_50431 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50440 - SURFACE
      ?auto_50441 - SURFACE
    )
    :vars
    (
      ?auto_50442 - HOIST
      ?auto_50443 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50442 ?auto_50443 ) ( SURFACE-AT ?auto_50441 ?auto_50443 ) ( CLEAR ?auto_50441 ) ( LIFTING ?auto_50442 ?auto_50440 ) ( IS-CRATE ?auto_50440 ) ( not ( = ?auto_50440 ?auto_50441 ) ) )
    :subtasks
    ( ( !DROP ?auto_50442 ?auto_50440 ?auto_50441 ?auto_50443 )
      ( MAKE-ON-VERIFY ?auto_50440 ?auto_50441 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50444 - SURFACE
      ?auto_50445 - SURFACE
    )
    :vars
    (
      ?auto_50447 - HOIST
      ?auto_50446 - PLACE
      ?auto_50448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50447 ?auto_50446 ) ( SURFACE-AT ?auto_50445 ?auto_50446 ) ( CLEAR ?auto_50445 ) ( IS-CRATE ?auto_50444 ) ( not ( = ?auto_50444 ?auto_50445 ) ) ( TRUCK-AT ?auto_50448 ?auto_50446 ) ( AVAILABLE ?auto_50447 ) ( IN ?auto_50444 ?auto_50448 ) )
    :subtasks
    ( ( !UNLOAD ?auto_50447 ?auto_50444 ?auto_50448 ?auto_50446 )
      ( MAKE-ON ?auto_50444 ?auto_50445 )
      ( MAKE-ON-VERIFY ?auto_50444 ?auto_50445 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50449 - SURFACE
      ?auto_50450 - SURFACE
    )
    :vars
    (
      ?auto_50451 - HOIST
      ?auto_50452 - PLACE
      ?auto_50453 - TRUCK
      ?auto_50454 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50451 ?auto_50452 ) ( SURFACE-AT ?auto_50450 ?auto_50452 ) ( CLEAR ?auto_50450 ) ( IS-CRATE ?auto_50449 ) ( not ( = ?auto_50449 ?auto_50450 ) ) ( AVAILABLE ?auto_50451 ) ( IN ?auto_50449 ?auto_50453 ) ( TRUCK-AT ?auto_50453 ?auto_50454 ) ( not ( = ?auto_50454 ?auto_50452 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_50453 ?auto_50454 ?auto_50452 )
      ( MAKE-ON ?auto_50449 ?auto_50450 )
      ( MAKE-ON-VERIFY ?auto_50449 ?auto_50450 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50455 - SURFACE
      ?auto_50456 - SURFACE
    )
    :vars
    (
      ?auto_50457 - HOIST
      ?auto_50460 - PLACE
      ?auto_50458 - TRUCK
      ?auto_50459 - PLACE
      ?auto_50461 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_50457 ?auto_50460 ) ( SURFACE-AT ?auto_50456 ?auto_50460 ) ( CLEAR ?auto_50456 ) ( IS-CRATE ?auto_50455 ) ( not ( = ?auto_50455 ?auto_50456 ) ) ( AVAILABLE ?auto_50457 ) ( TRUCK-AT ?auto_50458 ?auto_50459 ) ( not ( = ?auto_50459 ?auto_50460 ) ) ( HOIST-AT ?auto_50461 ?auto_50459 ) ( LIFTING ?auto_50461 ?auto_50455 ) ( not ( = ?auto_50457 ?auto_50461 ) ) )
    :subtasks
    ( ( !LOAD ?auto_50461 ?auto_50455 ?auto_50458 ?auto_50459 )
      ( MAKE-ON ?auto_50455 ?auto_50456 )
      ( MAKE-ON-VERIFY ?auto_50455 ?auto_50456 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50462 - SURFACE
      ?auto_50463 - SURFACE
    )
    :vars
    (
      ?auto_50468 - HOIST
      ?auto_50465 - PLACE
      ?auto_50464 - TRUCK
      ?auto_50466 - PLACE
      ?auto_50467 - HOIST
      ?auto_50469 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50468 ?auto_50465 ) ( SURFACE-AT ?auto_50463 ?auto_50465 ) ( CLEAR ?auto_50463 ) ( IS-CRATE ?auto_50462 ) ( not ( = ?auto_50462 ?auto_50463 ) ) ( AVAILABLE ?auto_50468 ) ( TRUCK-AT ?auto_50464 ?auto_50466 ) ( not ( = ?auto_50466 ?auto_50465 ) ) ( HOIST-AT ?auto_50467 ?auto_50466 ) ( not ( = ?auto_50468 ?auto_50467 ) ) ( AVAILABLE ?auto_50467 ) ( SURFACE-AT ?auto_50462 ?auto_50466 ) ( ON ?auto_50462 ?auto_50469 ) ( CLEAR ?auto_50462 ) ( not ( = ?auto_50462 ?auto_50469 ) ) ( not ( = ?auto_50463 ?auto_50469 ) ) )
    :subtasks
    ( ( !LIFT ?auto_50467 ?auto_50462 ?auto_50469 ?auto_50466 )
      ( MAKE-ON ?auto_50462 ?auto_50463 )
      ( MAKE-ON-VERIFY ?auto_50462 ?auto_50463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50470 - SURFACE
      ?auto_50471 - SURFACE
    )
    :vars
    (
      ?auto_50475 - HOIST
      ?auto_50477 - PLACE
      ?auto_50472 - PLACE
      ?auto_50473 - HOIST
      ?auto_50476 - SURFACE
      ?auto_50474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50475 ?auto_50477 ) ( SURFACE-AT ?auto_50471 ?auto_50477 ) ( CLEAR ?auto_50471 ) ( IS-CRATE ?auto_50470 ) ( not ( = ?auto_50470 ?auto_50471 ) ) ( AVAILABLE ?auto_50475 ) ( not ( = ?auto_50472 ?auto_50477 ) ) ( HOIST-AT ?auto_50473 ?auto_50472 ) ( not ( = ?auto_50475 ?auto_50473 ) ) ( AVAILABLE ?auto_50473 ) ( SURFACE-AT ?auto_50470 ?auto_50472 ) ( ON ?auto_50470 ?auto_50476 ) ( CLEAR ?auto_50470 ) ( not ( = ?auto_50470 ?auto_50476 ) ) ( not ( = ?auto_50471 ?auto_50476 ) ) ( TRUCK-AT ?auto_50474 ?auto_50477 ) )
    :subtasks
    ( ( !DRIVE ?auto_50474 ?auto_50477 ?auto_50472 )
      ( MAKE-ON ?auto_50470 ?auto_50471 )
      ( MAKE-ON-VERIFY ?auto_50470 ?auto_50471 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50478 - SURFACE
      ?auto_50479 - SURFACE
    )
    :vars
    (
      ?auto_50483 - HOIST
      ?auto_50484 - PLACE
      ?auto_50480 - PLACE
      ?auto_50482 - HOIST
      ?auto_50485 - SURFACE
      ?auto_50481 - TRUCK
      ?auto_50486 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50483 ?auto_50484 ) ( IS-CRATE ?auto_50478 ) ( not ( = ?auto_50478 ?auto_50479 ) ) ( not ( = ?auto_50480 ?auto_50484 ) ) ( HOIST-AT ?auto_50482 ?auto_50480 ) ( not ( = ?auto_50483 ?auto_50482 ) ) ( AVAILABLE ?auto_50482 ) ( SURFACE-AT ?auto_50478 ?auto_50480 ) ( ON ?auto_50478 ?auto_50485 ) ( CLEAR ?auto_50478 ) ( not ( = ?auto_50478 ?auto_50485 ) ) ( not ( = ?auto_50479 ?auto_50485 ) ) ( TRUCK-AT ?auto_50481 ?auto_50484 ) ( SURFACE-AT ?auto_50486 ?auto_50484 ) ( CLEAR ?auto_50486 ) ( LIFTING ?auto_50483 ?auto_50479 ) ( IS-CRATE ?auto_50479 ) ( not ( = ?auto_50478 ?auto_50486 ) ) ( not ( = ?auto_50479 ?auto_50486 ) ) ( not ( = ?auto_50485 ?auto_50486 ) ) )
    :subtasks
    ( ( !DROP ?auto_50483 ?auto_50479 ?auto_50486 ?auto_50484 )
      ( MAKE-ON ?auto_50478 ?auto_50479 )
      ( MAKE-ON-VERIFY ?auto_50478 ?auto_50479 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50487 - SURFACE
      ?auto_50488 - SURFACE
    )
    :vars
    (
      ?auto_50495 - HOIST
      ?auto_50491 - PLACE
      ?auto_50490 - PLACE
      ?auto_50493 - HOIST
      ?auto_50492 - SURFACE
      ?auto_50494 - TRUCK
      ?auto_50489 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50495 ?auto_50491 ) ( IS-CRATE ?auto_50487 ) ( not ( = ?auto_50487 ?auto_50488 ) ) ( not ( = ?auto_50490 ?auto_50491 ) ) ( HOIST-AT ?auto_50493 ?auto_50490 ) ( not ( = ?auto_50495 ?auto_50493 ) ) ( AVAILABLE ?auto_50493 ) ( SURFACE-AT ?auto_50487 ?auto_50490 ) ( ON ?auto_50487 ?auto_50492 ) ( CLEAR ?auto_50487 ) ( not ( = ?auto_50487 ?auto_50492 ) ) ( not ( = ?auto_50488 ?auto_50492 ) ) ( TRUCK-AT ?auto_50494 ?auto_50491 ) ( SURFACE-AT ?auto_50489 ?auto_50491 ) ( CLEAR ?auto_50489 ) ( IS-CRATE ?auto_50488 ) ( not ( = ?auto_50487 ?auto_50489 ) ) ( not ( = ?auto_50488 ?auto_50489 ) ) ( not ( = ?auto_50492 ?auto_50489 ) ) ( AVAILABLE ?auto_50495 ) ( IN ?auto_50488 ?auto_50494 ) )
    :subtasks
    ( ( !UNLOAD ?auto_50495 ?auto_50488 ?auto_50494 ?auto_50491 )
      ( MAKE-ON ?auto_50487 ?auto_50488 )
      ( MAKE-ON-VERIFY ?auto_50487 ?auto_50488 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50496 - SURFACE
      ?auto_50497 - SURFACE
    )
    :vars
    (
      ?auto_50499 - HOIST
      ?auto_50500 - PLACE
      ?auto_50501 - PLACE
      ?auto_50502 - HOIST
      ?auto_50503 - SURFACE
      ?auto_50504 - SURFACE
      ?auto_50498 - TRUCK
      ?auto_50505 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50499 ?auto_50500 ) ( IS-CRATE ?auto_50496 ) ( not ( = ?auto_50496 ?auto_50497 ) ) ( not ( = ?auto_50501 ?auto_50500 ) ) ( HOIST-AT ?auto_50502 ?auto_50501 ) ( not ( = ?auto_50499 ?auto_50502 ) ) ( AVAILABLE ?auto_50502 ) ( SURFACE-AT ?auto_50496 ?auto_50501 ) ( ON ?auto_50496 ?auto_50503 ) ( CLEAR ?auto_50496 ) ( not ( = ?auto_50496 ?auto_50503 ) ) ( not ( = ?auto_50497 ?auto_50503 ) ) ( SURFACE-AT ?auto_50504 ?auto_50500 ) ( CLEAR ?auto_50504 ) ( IS-CRATE ?auto_50497 ) ( not ( = ?auto_50496 ?auto_50504 ) ) ( not ( = ?auto_50497 ?auto_50504 ) ) ( not ( = ?auto_50503 ?auto_50504 ) ) ( AVAILABLE ?auto_50499 ) ( IN ?auto_50497 ?auto_50498 ) ( TRUCK-AT ?auto_50498 ?auto_50505 ) ( not ( = ?auto_50505 ?auto_50500 ) ) ( not ( = ?auto_50501 ?auto_50505 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_50498 ?auto_50505 ?auto_50500 )
      ( MAKE-ON ?auto_50496 ?auto_50497 )
      ( MAKE-ON-VERIFY ?auto_50496 ?auto_50497 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50506 - SURFACE
      ?auto_50507 - SURFACE
    )
    :vars
    (
      ?auto_50509 - HOIST
      ?auto_50510 - PLACE
      ?auto_50513 - PLACE
      ?auto_50511 - HOIST
      ?auto_50512 - SURFACE
      ?auto_50515 - SURFACE
      ?auto_50514 - TRUCK
      ?auto_50508 - PLACE
      ?auto_50516 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_50509 ?auto_50510 ) ( IS-CRATE ?auto_50506 ) ( not ( = ?auto_50506 ?auto_50507 ) ) ( not ( = ?auto_50513 ?auto_50510 ) ) ( HOIST-AT ?auto_50511 ?auto_50513 ) ( not ( = ?auto_50509 ?auto_50511 ) ) ( AVAILABLE ?auto_50511 ) ( SURFACE-AT ?auto_50506 ?auto_50513 ) ( ON ?auto_50506 ?auto_50512 ) ( CLEAR ?auto_50506 ) ( not ( = ?auto_50506 ?auto_50512 ) ) ( not ( = ?auto_50507 ?auto_50512 ) ) ( SURFACE-AT ?auto_50515 ?auto_50510 ) ( CLEAR ?auto_50515 ) ( IS-CRATE ?auto_50507 ) ( not ( = ?auto_50506 ?auto_50515 ) ) ( not ( = ?auto_50507 ?auto_50515 ) ) ( not ( = ?auto_50512 ?auto_50515 ) ) ( AVAILABLE ?auto_50509 ) ( TRUCK-AT ?auto_50514 ?auto_50508 ) ( not ( = ?auto_50508 ?auto_50510 ) ) ( not ( = ?auto_50513 ?auto_50508 ) ) ( HOIST-AT ?auto_50516 ?auto_50508 ) ( LIFTING ?auto_50516 ?auto_50507 ) ( not ( = ?auto_50509 ?auto_50516 ) ) ( not ( = ?auto_50511 ?auto_50516 ) ) )
    :subtasks
    ( ( !LOAD ?auto_50516 ?auto_50507 ?auto_50514 ?auto_50508 )
      ( MAKE-ON ?auto_50506 ?auto_50507 )
      ( MAKE-ON-VERIFY ?auto_50506 ?auto_50507 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50517 - SURFACE
      ?auto_50518 - SURFACE
    )
    :vars
    (
      ?auto_50520 - HOIST
      ?auto_50522 - PLACE
      ?auto_50527 - PLACE
      ?auto_50523 - HOIST
      ?auto_50524 - SURFACE
      ?auto_50525 - SURFACE
      ?auto_50526 - TRUCK
      ?auto_50519 - PLACE
      ?auto_50521 - HOIST
      ?auto_50528 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50520 ?auto_50522 ) ( IS-CRATE ?auto_50517 ) ( not ( = ?auto_50517 ?auto_50518 ) ) ( not ( = ?auto_50527 ?auto_50522 ) ) ( HOIST-AT ?auto_50523 ?auto_50527 ) ( not ( = ?auto_50520 ?auto_50523 ) ) ( AVAILABLE ?auto_50523 ) ( SURFACE-AT ?auto_50517 ?auto_50527 ) ( ON ?auto_50517 ?auto_50524 ) ( CLEAR ?auto_50517 ) ( not ( = ?auto_50517 ?auto_50524 ) ) ( not ( = ?auto_50518 ?auto_50524 ) ) ( SURFACE-AT ?auto_50525 ?auto_50522 ) ( CLEAR ?auto_50525 ) ( IS-CRATE ?auto_50518 ) ( not ( = ?auto_50517 ?auto_50525 ) ) ( not ( = ?auto_50518 ?auto_50525 ) ) ( not ( = ?auto_50524 ?auto_50525 ) ) ( AVAILABLE ?auto_50520 ) ( TRUCK-AT ?auto_50526 ?auto_50519 ) ( not ( = ?auto_50519 ?auto_50522 ) ) ( not ( = ?auto_50527 ?auto_50519 ) ) ( HOIST-AT ?auto_50521 ?auto_50519 ) ( not ( = ?auto_50520 ?auto_50521 ) ) ( not ( = ?auto_50523 ?auto_50521 ) ) ( AVAILABLE ?auto_50521 ) ( SURFACE-AT ?auto_50518 ?auto_50519 ) ( ON ?auto_50518 ?auto_50528 ) ( CLEAR ?auto_50518 ) ( not ( = ?auto_50517 ?auto_50528 ) ) ( not ( = ?auto_50518 ?auto_50528 ) ) ( not ( = ?auto_50524 ?auto_50528 ) ) ( not ( = ?auto_50525 ?auto_50528 ) ) )
    :subtasks
    ( ( !LIFT ?auto_50521 ?auto_50518 ?auto_50528 ?auto_50519 )
      ( MAKE-ON ?auto_50517 ?auto_50518 )
      ( MAKE-ON-VERIFY ?auto_50517 ?auto_50518 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50529 - SURFACE
      ?auto_50530 - SURFACE
    )
    :vars
    (
      ?auto_50537 - HOIST
      ?auto_50539 - PLACE
      ?auto_50534 - PLACE
      ?auto_50540 - HOIST
      ?auto_50532 - SURFACE
      ?auto_50535 - SURFACE
      ?auto_50533 - PLACE
      ?auto_50536 - HOIST
      ?auto_50531 - SURFACE
      ?auto_50538 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50537 ?auto_50539 ) ( IS-CRATE ?auto_50529 ) ( not ( = ?auto_50529 ?auto_50530 ) ) ( not ( = ?auto_50534 ?auto_50539 ) ) ( HOIST-AT ?auto_50540 ?auto_50534 ) ( not ( = ?auto_50537 ?auto_50540 ) ) ( AVAILABLE ?auto_50540 ) ( SURFACE-AT ?auto_50529 ?auto_50534 ) ( ON ?auto_50529 ?auto_50532 ) ( CLEAR ?auto_50529 ) ( not ( = ?auto_50529 ?auto_50532 ) ) ( not ( = ?auto_50530 ?auto_50532 ) ) ( SURFACE-AT ?auto_50535 ?auto_50539 ) ( CLEAR ?auto_50535 ) ( IS-CRATE ?auto_50530 ) ( not ( = ?auto_50529 ?auto_50535 ) ) ( not ( = ?auto_50530 ?auto_50535 ) ) ( not ( = ?auto_50532 ?auto_50535 ) ) ( AVAILABLE ?auto_50537 ) ( not ( = ?auto_50533 ?auto_50539 ) ) ( not ( = ?auto_50534 ?auto_50533 ) ) ( HOIST-AT ?auto_50536 ?auto_50533 ) ( not ( = ?auto_50537 ?auto_50536 ) ) ( not ( = ?auto_50540 ?auto_50536 ) ) ( AVAILABLE ?auto_50536 ) ( SURFACE-AT ?auto_50530 ?auto_50533 ) ( ON ?auto_50530 ?auto_50531 ) ( CLEAR ?auto_50530 ) ( not ( = ?auto_50529 ?auto_50531 ) ) ( not ( = ?auto_50530 ?auto_50531 ) ) ( not ( = ?auto_50532 ?auto_50531 ) ) ( not ( = ?auto_50535 ?auto_50531 ) ) ( TRUCK-AT ?auto_50538 ?auto_50539 ) )
    :subtasks
    ( ( !DRIVE ?auto_50538 ?auto_50539 ?auto_50533 )
      ( MAKE-ON ?auto_50529 ?auto_50530 )
      ( MAKE-ON-VERIFY ?auto_50529 ?auto_50530 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50543 - SURFACE
      ?auto_50544 - SURFACE
    )
    :vars
    (
      ?auto_50545 - HOIST
      ?auto_50546 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50545 ?auto_50546 ) ( SURFACE-AT ?auto_50544 ?auto_50546 ) ( CLEAR ?auto_50544 ) ( LIFTING ?auto_50545 ?auto_50543 ) ( IS-CRATE ?auto_50543 ) ( not ( = ?auto_50543 ?auto_50544 ) ) )
    :subtasks
    ( ( !DROP ?auto_50545 ?auto_50543 ?auto_50544 ?auto_50546 )
      ( MAKE-ON-VERIFY ?auto_50543 ?auto_50544 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50547 - SURFACE
      ?auto_50548 - SURFACE
    )
    :vars
    (
      ?auto_50550 - HOIST
      ?auto_50549 - PLACE
      ?auto_50551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50550 ?auto_50549 ) ( SURFACE-AT ?auto_50548 ?auto_50549 ) ( CLEAR ?auto_50548 ) ( IS-CRATE ?auto_50547 ) ( not ( = ?auto_50547 ?auto_50548 ) ) ( TRUCK-AT ?auto_50551 ?auto_50549 ) ( AVAILABLE ?auto_50550 ) ( IN ?auto_50547 ?auto_50551 ) )
    :subtasks
    ( ( !UNLOAD ?auto_50550 ?auto_50547 ?auto_50551 ?auto_50549 )
      ( MAKE-ON ?auto_50547 ?auto_50548 )
      ( MAKE-ON-VERIFY ?auto_50547 ?auto_50548 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50552 - SURFACE
      ?auto_50553 - SURFACE
    )
    :vars
    (
      ?auto_50554 - HOIST
      ?auto_50556 - PLACE
      ?auto_50555 - TRUCK
      ?auto_50557 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50554 ?auto_50556 ) ( SURFACE-AT ?auto_50553 ?auto_50556 ) ( CLEAR ?auto_50553 ) ( IS-CRATE ?auto_50552 ) ( not ( = ?auto_50552 ?auto_50553 ) ) ( AVAILABLE ?auto_50554 ) ( IN ?auto_50552 ?auto_50555 ) ( TRUCK-AT ?auto_50555 ?auto_50557 ) ( not ( = ?auto_50557 ?auto_50556 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_50555 ?auto_50557 ?auto_50556 )
      ( MAKE-ON ?auto_50552 ?auto_50553 )
      ( MAKE-ON-VERIFY ?auto_50552 ?auto_50553 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50558 - SURFACE
      ?auto_50559 - SURFACE
    )
    :vars
    (
      ?auto_50563 - HOIST
      ?auto_50561 - PLACE
      ?auto_50562 - TRUCK
      ?auto_50560 - PLACE
      ?auto_50564 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_50563 ?auto_50561 ) ( SURFACE-AT ?auto_50559 ?auto_50561 ) ( CLEAR ?auto_50559 ) ( IS-CRATE ?auto_50558 ) ( not ( = ?auto_50558 ?auto_50559 ) ) ( AVAILABLE ?auto_50563 ) ( TRUCK-AT ?auto_50562 ?auto_50560 ) ( not ( = ?auto_50560 ?auto_50561 ) ) ( HOIST-AT ?auto_50564 ?auto_50560 ) ( LIFTING ?auto_50564 ?auto_50558 ) ( not ( = ?auto_50563 ?auto_50564 ) ) )
    :subtasks
    ( ( !LOAD ?auto_50564 ?auto_50558 ?auto_50562 ?auto_50560 )
      ( MAKE-ON ?auto_50558 ?auto_50559 )
      ( MAKE-ON-VERIFY ?auto_50558 ?auto_50559 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50565 - SURFACE
      ?auto_50566 - SURFACE
    )
    :vars
    (
      ?auto_50569 - HOIST
      ?auto_50571 - PLACE
      ?auto_50568 - TRUCK
      ?auto_50567 - PLACE
      ?auto_50570 - HOIST
      ?auto_50572 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50569 ?auto_50571 ) ( SURFACE-AT ?auto_50566 ?auto_50571 ) ( CLEAR ?auto_50566 ) ( IS-CRATE ?auto_50565 ) ( not ( = ?auto_50565 ?auto_50566 ) ) ( AVAILABLE ?auto_50569 ) ( TRUCK-AT ?auto_50568 ?auto_50567 ) ( not ( = ?auto_50567 ?auto_50571 ) ) ( HOIST-AT ?auto_50570 ?auto_50567 ) ( not ( = ?auto_50569 ?auto_50570 ) ) ( AVAILABLE ?auto_50570 ) ( SURFACE-AT ?auto_50565 ?auto_50567 ) ( ON ?auto_50565 ?auto_50572 ) ( CLEAR ?auto_50565 ) ( not ( = ?auto_50565 ?auto_50572 ) ) ( not ( = ?auto_50566 ?auto_50572 ) ) )
    :subtasks
    ( ( !LIFT ?auto_50570 ?auto_50565 ?auto_50572 ?auto_50567 )
      ( MAKE-ON ?auto_50565 ?auto_50566 )
      ( MAKE-ON-VERIFY ?auto_50565 ?auto_50566 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50573 - SURFACE
      ?auto_50574 - SURFACE
    )
    :vars
    (
      ?auto_50576 - HOIST
      ?auto_50579 - PLACE
      ?auto_50577 - PLACE
      ?auto_50575 - HOIST
      ?auto_50580 - SURFACE
      ?auto_50578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50576 ?auto_50579 ) ( SURFACE-AT ?auto_50574 ?auto_50579 ) ( CLEAR ?auto_50574 ) ( IS-CRATE ?auto_50573 ) ( not ( = ?auto_50573 ?auto_50574 ) ) ( AVAILABLE ?auto_50576 ) ( not ( = ?auto_50577 ?auto_50579 ) ) ( HOIST-AT ?auto_50575 ?auto_50577 ) ( not ( = ?auto_50576 ?auto_50575 ) ) ( AVAILABLE ?auto_50575 ) ( SURFACE-AT ?auto_50573 ?auto_50577 ) ( ON ?auto_50573 ?auto_50580 ) ( CLEAR ?auto_50573 ) ( not ( = ?auto_50573 ?auto_50580 ) ) ( not ( = ?auto_50574 ?auto_50580 ) ) ( TRUCK-AT ?auto_50578 ?auto_50579 ) )
    :subtasks
    ( ( !DRIVE ?auto_50578 ?auto_50579 ?auto_50577 )
      ( MAKE-ON ?auto_50573 ?auto_50574 )
      ( MAKE-ON-VERIFY ?auto_50573 ?auto_50574 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50581 - SURFACE
      ?auto_50582 - SURFACE
    )
    :vars
    (
      ?auto_50583 - HOIST
      ?auto_50587 - PLACE
      ?auto_50586 - PLACE
      ?auto_50588 - HOIST
      ?auto_50584 - SURFACE
      ?auto_50585 - TRUCK
      ?auto_50589 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50583 ?auto_50587 ) ( IS-CRATE ?auto_50581 ) ( not ( = ?auto_50581 ?auto_50582 ) ) ( not ( = ?auto_50586 ?auto_50587 ) ) ( HOIST-AT ?auto_50588 ?auto_50586 ) ( not ( = ?auto_50583 ?auto_50588 ) ) ( AVAILABLE ?auto_50588 ) ( SURFACE-AT ?auto_50581 ?auto_50586 ) ( ON ?auto_50581 ?auto_50584 ) ( CLEAR ?auto_50581 ) ( not ( = ?auto_50581 ?auto_50584 ) ) ( not ( = ?auto_50582 ?auto_50584 ) ) ( TRUCK-AT ?auto_50585 ?auto_50587 ) ( SURFACE-AT ?auto_50589 ?auto_50587 ) ( CLEAR ?auto_50589 ) ( LIFTING ?auto_50583 ?auto_50582 ) ( IS-CRATE ?auto_50582 ) ( not ( = ?auto_50581 ?auto_50589 ) ) ( not ( = ?auto_50582 ?auto_50589 ) ) ( not ( = ?auto_50584 ?auto_50589 ) ) )
    :subtasks
    ( ( !DROP ?auto_50583 ?auto_50582 ?auto_50589 ?auto_50587 )
      ( MAKE-ON ?auto_50581 ?auto_50582 )
      ( MAKE-ON-VERIFY ?auto_50581 ?auto_50582 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50590 - SURFACE
      ?auto_50591 - SURFACE
    )
    :vars
    (
      ?auto_50597 - HOIST
      ?auto_50593 - PLACE
      ?auto_50595 - PLACE
      ?auto_50598 - HOIST
      ?auto_50596 - SURFACE
      ?auto_50594 - TRUCK
      ?auto_50592 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50597 ?auto_50593 ) ( IS-CRATE ?auto_50590 ) ( not ( = ?auto_50590 ?auto_50591 ) ) ( not ( = ?auto_50595 ?auto_50593 ) ) ( HOIST-AT ?auto_50598 ?auto_50595 ) ( not ( = ?auto_50597 ?auto_50598 ) ) ( AVAILABLE ?auto_50598 ) ( SURFACE-AT ?auto_50590 ?auto_50595 ) ( ON ?auto_50590 ?auto_50596 ) ( CLEAR ?auto_50590 ) ( not ( = ?auto_50590 ?auto_50596 ) ) ( not ( = ?auto_50591 ?auto_50596 ) ) ( TRUCK-AT ?auto_50594 ?auto_50593 ) ( SURFACE-AT ?auto_50592 ?auto_50593 ) ( CLEAR ?auto_50592 ) ( IS-CRATE ?auto_50591 ) ( not ( = ?auto_50590 ?auto_50592 ) ) ( not ( = ?auto_50591 ?auto_50592 ) ) ( not ( = ?auto_50596 ?auto_50592 ) ) ( AVAILABLE ?auto_50597 ) ( IN ?auto_50591 ?auto_50594 ) )
    :subtasks
    ( ( !UNLOAD ?auto_50597 ?auto_50591 ?auto_50594 ?auto_50593 )
      ( MAKE-ON ?auto_50590 ?auto_50591 )
      ( MAKE-ON-VERIFY ?auto_50590 ?auto_50591 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50599 - SURFACE
      ?auto_50600 - SURFACE
    )
    :vars
    (
      ?auto_50603 - HOIST
      ?auto_50604 - PLACE
      ?auto_50606 - PLACE
      ?auto_50601 - HOIST
      ?auto_50607 - SURFACE
      ?auto_50605 - SURFACE
      ?auto_50602 - TRUCK
      ?auto_50608 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50603 ?auto_50604 ) ( IS-CRATE ?auto_50599 ) ( not ( = ?auto_50599 ?auto_50600 ) ) ( not ( = ?auto_50606 ?auto_50604 ) ) ( HOIST-AT ?auto_50601 ?auto_50606 ) ( not ( = ?auto_50603 ?auto_50601 ) ) ( AVAILABLE ?auto_50601 ) ( SURFACE-AT ?auto_50599 ?auto_50606 ) ( ON ?auto_50599 ?auto_50607 ) ( CLEAR ?auto_50599 ) ( not ( = ?auto_50599 ?auto_50607 ) ) ( not ( = ?auto_50600 ?auto_50607 ) ) ( SURFACE-AT ?auto_50605 ?auto_50604 ) ( CLEAR ?auto_50605 ) ( IS-CRATE ?auto_50600 ) ( not ( = ?auto_50599 ?auto_50605 ) ) ( not ( = ?auto_50600 ?auto_50605 ) ) ( not ( = ?auto_50607 ?auto_50605 ) ) ( AVAILABLE ?auto_50603 ) ( IN ?auto_50600 ?auto_50602 ) ( TRUCK-AT ?auto_50602 ?auto_50608 ) ( not ( = ?auto_50608 ?auto_50604 ) ) ( not ( = ?auto_50606 ?auto_50608 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_50602 ?auto_50608 ?auto_50604 )
      ( MAKE-ON ?auto_50599 ?auto_50600 )
      ( MAKE-ON-VERIFY ?auto_50599 ?auto_50600 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50609 - SURFACE
      ?auto_50610 - SURFACE
    )
    :vars
    (
      ?auto_50615 - HOIST
      ?auto_50617 - PLACE
      ?auto_50618 - PLACE
      ?auto_50611 - HOIST
      ?auto_50614 - SURFACE
      ?auto_50612 - SURFACE
      ?auto_50613 - TRUCK
      ?auto_50616 - PLACE
      ?auto_50619 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_50615 ?auto_50617 ) ( IS-CRATE ?auto_50609 ) ( not ( = ?auto_50609 ?auto_50610 ) ) ( not ( = ?auto_50618 ?auto_50617 ) ) ( HOIST-AT ?auto_50611 ?auto_50618 ) ( not ( = ?auto_50615 ?auto_50611 ) ) ( AVAILABLE ?auto_50611 ) ( SURFACE-AT ?auto_50609 ?auto_50618 ) ( ON ?auto_50609 ?auto_50614 ) ( CLEAR ?auto_50609 ) ( not ( = ?auto_50609 ?auto_50614 ) ) ( not ( = ?auto_50610 ?auto_50614 ) ) ( SURFACE-AT ?auto_50612 ?auto_50617 ) ( CLEAR ?auto_50612 ) ( IS-CRATE ?auto_50610 ) ( not ( = ?auto_50609 ?auto_50612 ) ) ( not ( = ?auto_50610 ?auto_50612 ) ) ( not ( = ?auto_50614 ?auto_50612 ) ) ( AVAILABLE ?auto_50615 ) ( TRUCK-AT ?auto_50613 ?auto_50616 ) ( not ( = ?auto_50616 ?auto_50617 ) ) ( not ( = ?auto_50618 ?auto_50616 ) ) ( HOIST-AT ?auto_50619 ?auto_50616 ) ( LIFTING ?auto_50619 ?auto_50610 ) ( not ( = ?auto_50615 ?auto_50619 ) ) ( not ( = ?auto_50611 ?auto_50619 ) ) )
    :subtasks
    ( ( !LOAD ?auto_50619 ?auto_50610 ?auto_50613 ?auto_50616 )
      ( MAKE-ON ?auto_50609 ?auto_50610 )
      ( MAKE-ON-VERIFY ?auto_50609 ?auto_50610 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50620 - SURFACE
      ?auto_50621 - SURFACE
    )
    :vars
    (
      ?auto_50628 - HOIST
      ?auto_50630 - PLACE
      ?auto_50629 - PLACE
      ?auto_50625 - HOIST
      ?auto_50624 - SURFACE
      ?auto_50622 - SURFACE
      ?auto_50627 - TRUCK
      ?auto_50623 - PLACE
      ?auto_50626 - HOIST
      ?auto_50631 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50628 ?auto_50630 ) ( IS-CRATE ?auto_50620 ) ( not ( = ?auto_50620 ?auto_50621 ) ) ( not ( = ?auto_50629 ?auto_50630 ) ) ( HOIST-AT ?auto_50625 ?auto_50629 ) ( not ( = ?auto_50628 ?auto_50625 ) ) ( AVAILABLE ?auto_50625 ) ( SURFACE-AT ?auto_50620 ?auto_50629 ) ( ON ?auto_50620 ?auto_50624 ) ( CLEAR ?auto_50620 ) ( not ( = ?auto_50620 ?auto_50624 ) ) ( not ( = ?auto_50621 ?auto_50624 ) ) ( SURFACE-AT ?auto_50622 ?auto_50630 ) ( CLEAR ?auto_50622 ) ( IS-CRATE ?auto_50621 ) ( not ( = ?auto_50620 ?auto_50622 ) ) ( not ( = ?auto_50621 ?auto_50622 ) ) ( not ( = ?auto_50624 ?auto_50622 ) ) ( AVAILABLE ?auto_50628 ) ( TRUCK-AT ?auto_50627 ?auto_50623 ) ( not ( = ?auto_50623 ?auto_50630 ) ) ( not ( = ?auto_50629 ?auto_50623 ) ) ( HOIST-AT ?auto_50626 ?auto_50623 ) ( not ( = ?auto_50628 ?auto_50626 ) ) ( not ( = ?auto_50625 ?auto_50626 ) ) ( AVAILABLE ?auto_50626 ) ( SURFACE-AT ?auto_50621 ?auto_50623 ) ( ON ?auto_50621 ?auto_50631 ) ( CLEAR ?auto_50621 ) ( not ( = ?auto_50620 ?auto_50631 ) ) ( not ( = ?auto_50621 ?auto_50631 ) ) ( not ( = ?auto_50624 ?auto_50631 ) ) ( not ( = ?auto_50622 ?auto_50631 ) ) )
    :subtasks
    ( ( !LIFT ?auto_50626 ?auto_50621 ?auto_50631 ?auto_50623 )
      ( MAKE-ON ?auto_50620 ?auto_50621 )
      ( MAKE-ON-VERIFY ?auto_50620 ?auto_50621 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50632 - SURFACE
      ?auto_50633 - SURFACE
    )
    :vars
    (
      ?auto_50634 - HOIST
      ?auto_50636 - PLACE
      ?auto_50635 - PLACE
      ?auto_50638 - HOIST
      ?auto_50640 - SURFACE
      ?auto_50643 - SURFACE
      ?auto_50642 - PLACE
      ?auto_50637 - HOIST
      ?auto_50641 - SURFACE
      ?auto_50639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50634 ?auto_50636 ) ( IS-CRATE ?auto_50632 ) ( not ( = ?auto_50632 ?auto_50633 ) ) ( not ( = ?auto_50635 ?auto_50636 ) ) ( HOIST-AT ?auto_50638 ?auto_50635 ) ( not ( = ?auto_50634 ?auto_50638 ) ) ( AVAILABLE ?auto_50638 ) ( SURFACE-AT ?auto_50632 ?auto_50635 ) ( ON ?auto_50632 ?auto_50640 ) ( CLEAR ?auto_50632 ) ( not ( = ?auto_50632 ?auto_50640 ) ) ( not ( = ?auto_50633 ?auto_50640 ) ) ( SURFACE-AT ?auto_50643 ?auto_50636 ) ( CLEAR ?auto_50643 ) ( IS-CRATE ?auto_50633 ) ( not ( = ?auto_50632 ?auto_50643 ) ) ( not ( = ?auto_50633 ?auto_50643 ) ) ( not ( = ?auto_50640 ?auto_50643 ) ) ( AVAILABLE ?auto_50634 ) ( not ( = ?auto_50642 ?auto_50636 ) ) ( not ( = ?auto_50635 ?auto_50642 ) ) ( HOIST-AT ?auto_50637 ?auto_50642 ) ( not ( = ?auto_50634 ?auto_50637 ) ) ( not ( = ?auto_50638 ?auto_50637 ) ) ( AVAILABLE ?auto_50637 ) ( SURFACE-AT ?auto_50633 ?auto_50642 ) ( ON ?auto_50633 ?auto_50641 ) ( CLEAR ?auto_50633 ) ( not ( = ?auto_50632 ?auto_50641 ) ) ( not ( = ?auto_50633 ?auto_50641 ) ) ( not ( = ?auto_50640 ?auto_50641 ) ) ( not ( = ?auto_50643 ?auto_50641 ) ) ( TRUCK-AT ?auto_50639 ?auto_50636 ) )
    :subtasks
    ( ( !DRIVE ?auto_50639 ?auto_50636 ?auto_50642 )
      ( MAKE-ON ?auto_50632 ?auto_50633 )
      ( MAKE-ON-VERIFY ?auto_50632 ?auto_50633 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50644 - SURFACE
      ?auto_50645 - SURFACE
    )
    :vars
    (
      ?auto_50647 - HOIST
      ?auto_50650 - PLACE
      ?auto_50654 - PLACE
      ?auto_50652 - HOIST
      ?auto_50655 - SURFACE
      ?auto_50646 - SURFACE
      ?auto_50653 - PLACE
      ?auto_50649 - HOIST
      ?auto_50648 - SURFACE
      ?auto_50651 - TRUCK
      ?auto_50656 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50647 ?auto_50650 ) ( IS-CRATE ?auto_50644 ) ( not ( = ?auto_50644 ?auto_50645 ) ) ( not ( = ?auto_50654 ?auto_50650 ) ) ( HOIST-AT ?auto_50652 ?auto_50654 ) ( not ( = ?auto_50647 ?auto_50652 ) ) ( AVAILABLE ?auto_50652 ) ( SURFACE-AT ?auto_50644 ?auto_50654 ) ( ON ?auto_50644 ?auto_50655 ) ( CLEAR ?auto_50644 ) ( not ( = ?auto_50644 ?auto_50655 ) ) ( not ( = ?auto_50645 ?auto_50655 ) ) ( IS-CRATE ?auto_50645 ) ( not ( = ?auto_50644 ?auto_50646 ) ) ( not ( = ?auto_50645 ?auto_50646 ) ) ( not ( = ?auto_50655 ?auto_50646 ) ) ( not ( = ?auto_50653 ?auto_50650 ) ) ( not ( = ?auto_50654 ?auto_50653 ) ) ( HOIST-AT ?auto_50649 ?auto_50653 ) ( not ( = ?auto_50647 ?auto_50649 ) ) ( not ( = ?auto_50652 ?auto_50649 ) ) ( AVAILABLE ?auto_50649 ) ( SURFACE-AT ?auto_50645 ?auto_50653 ) ( ON ?auto_50645 ?auto_50648 ) ( CLEAR ?auto_50645 ) ( not ( = ?auto_50644 ?auto_50648 ) ) ( not ( = ?auto_50645 ?auto_50648 ) ) ( not ( = ?auto_50655 ?auto_50648 ) ) ( not ( = ?auto_50646 ?auto_50648 ) ) ( TRUCK-AT ?auto_50651 ?auto_50650 ) ( SURFACE-AT ?auto_50656 ?auto_50650 ) ( CLEAR ?auto_50656 ) ( LIFTING ?auto_50647 ?auto_50646 ) ( IS-CRATE ?auto_50646 ) ( not ( = ?auto_50644 ?auto_50656 ) ) ( not ( = ?auto_50645 ?auto_50656 ) ) ( not ( = ?auto_50655 ?auto_50656 ) ) ( not ( = ?auto_50646 ?auto_50656 ) ) ( not ( = ?auto_50648 ?auto_50656 ) ) )
    :subtasks
    ( ( !DROP ?auto_50647 ?auto_50646 ?auto_50656 ?auto_50650 )
      ( MAKE-ON ?auto_50644 ?auto_50645 )
      ( MAKE-ON-VERIFY ?auto_50644 ?auto_50645 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50657 - SURFACE
      ?auto_50658 - SURFACE
    )
    :vars
    (
      ?auto_50660 - HOIST
      ?auto_50667 - PLACE
      ?auto_50661 - PLACE
      ?auto_50668 - HOIST
      ?auto_50664 - SURFACE
      ?auto_50659 - SURFACE
      ?auto_50669 - PLACE
      ?auto_50665 - HOIST
      ?auto_50662 - SURFACE
      ?auto_50666 - TRUCK
      ?auto_50663 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50660 ?auto_50667 ) ( IS-CRATE ?auto_50657 ) ( not ( = ?auto_50657 ?auto_50658 ) ) ( not ( = ?auto_50661 ?auto_50667 ) ) ( HOIST-AT ?auto_50668 ?auto_50661 ) ( not ( = ?auto_50660 ?auto_50668 ) ) ( AVAILABLE ?auto_50668 ) ( SURFACE-AT ?auto_50657 ?auto_50661 ) ( ON ?auto_50657 ?auto_50664 ) ( CLEAR ?auto_50657 ) ( not ( = ?auto_50657 ?auto_50664 ) ) ( not ( = ?auto_50658 ?auto_50664 ) ) ( IS-CRATE ?auto_50658 ) ( not ( = ?auto_50657 ?auto_50659 ) ) ( not ( = ?auto_50658 ?auto_50659 ) ) ( not ( = ?auto_50664 ?auto_50659 ) ) ( not ( = ?auto_50669 ?auto_50667 ) ) ( not ( = ?auto_50661 ?auto_50669 ) ) ( HOIST-AT ?auto_50665 ?auto_50669 ) ( not ( = ?auto_50660 ?auto_50665 ) ) ( not ( = ?auto_50668 ?auto_50665 ) ) ( AVAILABLE ?auto_50665 ) ( SURFACE-AT ?auto_50658 ?auto_50669 ) ( ON ?auto_50658 ?auto_50662 ) ( CLEAR ?auto_50658 ) ( not ( = ?auto_50657 ?auto_50662 ) ) ( not ( = ?auto_50658 ?auto_50662 ) ) ( not ( = ?auto_50664 ?auto_50662 ) ) ( not ( = ?auto_50659 ?auto_50662 ) ) ( TRUCK-AT ?auto_50666 ?auto_50667 ) ( SURFACE-AT ?auto_50663 ?auto_50667 ) ( CLEAR ?auto_50663 ) ( IS-CRATE ?auto_50659 ) ( not ( = ?auto_50657 ?auto_50663 ) ) ( not ( = ?auto_50658 ?auto_50663 ) ) ( not ( = ?auto_50664 ?auto_50663 ) ) ( not ( = ?auto_50659 ?auto_50663 ) ) ( not ( = ?auto_50662 ?auto_50663 ) ) ( AVAILABLE ?auto_50660 ) ( IN ?auto_50659 ?auto_50666 ) )
    :subtasks
    ( ( !UNLOAD ?auto_50660 ?auto_50659 ?auto_50666 ?auto_50667 )
      ( MAKE-ON ?auto_50657 ?auto_50658 )
      ( MAKE-ON-VERIFY ?auto_50657 ?auto_50658 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50670 - SURFACE
      ?auto_50671 - SURFACE
    )
    :vars
    (
      ?auto_50676 - HOIST
      ?auto_50673 - PLACE
      ?auto_50680 - PLACE
      ?auto_50679 - HOIST
      ?auto_50681 - SURFACE
      ?auto_50677 - SURFACE
      ?auto_50674 - PLACE
      ?auto_50675 - HOIST
      ?auto_50678 - SURFACE
      ?auto_50682 - SURFACE
      ?auto_50672 - TRUCK
      ?auto_50683 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50676 ?auto_50673 ) ( IS-CRATE ?auto_50670 ) ( not ( = ?auto_50670 ?auto_50671 ) ) ( not ( = ?auto_50680 ?auto_50673 ) ) ( HOIST-AT ?auto_50679 ?auto_50680 ) ( not ( = ?auto_50676 ?auto_50679 ) ) ( AVAILABLE ?auto_50679 ) ( SURFACE-AT ?auto_50670 ?auto_50680 ) ( ON ?auto_50670 ?auto_50681 ) ( CLEAR ?auto_50670 ) ( not ( = ?auto_50670 ?auto_50681 ) ) ( not ( = ?auto_50671 ?auto_50681 ) ) ( IS-CRATE ?auto_50671 ) ( not ( = ?auto_50670 ?auto_50677 ) ) ( not ( = ?auto_50671 ?auto_50677 ) ) ( not ( = ?auto_50681 ?auto_50677 ) ) ( not ( = ?auto_50674 ?auto_50673 ) ) ( not ( = ?auto_50680 ?auto_50674 ) ) ( HOIST-AT ?auto_50675 ?auto_50674 ) ( not ( = ?auto_50676 ?auto_50675 ) ) ( not ( = ?auto_50679 ?auto_50675 ) ) ( AVAILABLE ?auto_50675 ) ( SURFACE-AT ?auto_50671 ?auto_50674 ) ( ON ?auto_50671 ?auto_50678 ) ( CLEAR ?auto_50671 ) ( not ( = ?auto_50670 ?auto_50678 ) ) ( not ( = ?auto_50671 ?auto_50678 ) ) ( not ( = ?auto_50681 ?auto_50678 ) ) ( not ( = ?auto_50677 ?auto_50678 ) ) ( SURFACE-AT ?auto_50682 ?auto_50673 ) ( CLEAR ?auto_50682 ) ( IS-CRATE ?auto_50677 ) ( not ( = ?auto_50670 ?auto_50682 ) ) ( not ( = ?auto_50671 ?auto_50682 ) ) ( not ( = ?auto_50681 ?auto_50682 ) ) ( not ( = ?auto_50677 ?auto_50682 ) ) ( not ( = ?auto_50678 ?auto_50682 ) ) ( AVAILABLE ?auto_50676 ) ( IN ?auto_50677 ?auto_50672 ) ( TRUCK-AT ?auto_50672 ?auto_50683 ) ( not ( = ?auto_50683 ?auto_50673 ) ) ( not ( = ?auto_50680 ?auto_50683 ) ) ( not ( = ?auto_50674 ?auto_50683 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_50672 ?auto_50683 ?auto_50673 )
      ( MAKE-ON ?auto_50670 ?auto_50671 )
      ( MAKE-ON-VERIFY ?auto_50670 ?auto_50671 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50684 - SURFACE
      ?auto_50685 - SURFACE
    )
    :vars
    (
      ?auto_50692 - HOIST
      ?auto_50695 - PLACE
      ?auto_50686 - PLACE
      ?auto_50697 - HOIST
      ?auto_50696 - SURFACE
      ?auto_50688 - SURFACE
      ?auto_50690 - PLACE
      ?auto_50689 - HOIST
      ?auto_50693 - SURFACE
      ?auto_50694 - SURFACE
      ?auto_50687 - TRUCK
      ?auto_50691 - PLACE
      ?auto_50698 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_50692 ?auto_50695 ) ( IS-CRATE ?auto_50684 ) ( not ( = ?auto_50684 ?auto_50685 ) ) ( not ( = ?auto_50686 ?auto_50695 ) ) ( HOIST-AT ?auto_50697 ?auto_50686 ) ( not ( = ?auto_50692 ?auto_50697 ) ) ( AVAILABLE ?auto_50697 ) ( SURFACE-AT ?auto_50684 ?auto_50686 ) ( ON ?auto_50684 ?auto_50696 ) ( CLEAR ?auto_50684 ) ( not ( = ?auto_50684 ?auto_50696 ) ) ( not ( = ?auto_50685 ?auto_50696 ) ) ( IS-CRATE ?auto_50685 ) ( not ( = ?auto_50684 ?auto_50688 ) ) ( not ( = ?auto_50685 ?auto_50688 ) ) ( not ( = ?auto_50696 ?auto_50688 ) ) ( not ( = ?auto_50690 ?auto_50695 ) ) ( not ( = ?auto_50686 ?auto_50690 ) ) ( HOIST-AT ?auto_50689 ?auto_50690 ) ( not ( = ?auto_50692 ?auto_50689 ) ) ( not ( = ?auto_50697 ?auto_50689 ) ) ( AVAILABLE ?auto_50689 ) ( SURFACE-AT ?auto_50685 ?auto_50690 ) ( ON ?auto_50685 ?auto_50693 ) ( CLEAR ?auto_50685 ) ( not ( = ?auto_50684 ?auto_50693 ) ) ( not ( = ?auto_50685 ?auto_50693 ) ) ( not ( = ?auto_50696 ?auto_50693 ) ) ( not ( = ?auto_50688 ?auto_50693 ) ) ( SURFACE-AT ?auto_50694 ?auto_50695 ) ( CLEAR ?auto_50694 ) ( IS-CRATE ?auto_50688 ) ( not ( = ?auto_50684 ?auto_50694 ) ) ( not ( = ?auto_50685 ?auto_50694 ) ) ( not ( = ?auto_50696 ?auto_50694 ) ) ( not ( = ?auto_50688 ?auto_50694 ) ) ( not ( = ?auto_50693 ?auto_50694 ) ) ( AVAILABLE ?auto_50692 ) ( TRUCK-AT ?auto_50687 ?auto_50691 ) ( not ( = ?auto_50691 ?auto_50695 ) ) ( not ( = ?auto_50686 ?auto_50691 ) ) ( not ( = ?auto_50690 ?auto_50691 ) ) ( HOIST-AT ?auto_50698 ?auto_50691 ) ( LIFTING ?auto_50698 ?auto_50688 ) ( not ( = ?auto_50692 ?auto_50698 ) ) ( not ( = ?auto_50697 ?auto_50698 ) ) ( not ( = ?auto_50689 ?auto_50698 ) ) )
    :subtasks
    ( ( !LOAD ?auto_50698 ?auto_50688 ?auto_50687 ?auto_50691 )
      ( MAKE-ON ?auto_50684 ?auto_50685 )
      ( MAKE-ON-VERIFY ?auto_50684 ?auto_50685 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50699 - SURFACE
      ?auto_50700 - SURFACE
    )
    :vars
    (
      ?auto_50710 - HOIST
      ?auto_50708 - PLACE
      ?auto_50712 - PLACE
      ?auto_50711 - HOIST
      ?auto_50706 - SURFACE
      ?auto_50705 - SURFACE
      ?auto_50704 - PLACE
      ?auto_50701 - HOIST
      ?auto_50709 - SURFACE
      ?auto_50703 - SURFACE
      ?auto_50713 - TRUCK
      ?auto_50707 - PLACE
      ?auto_50702 - HOIST
      ?auto_50714 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50710 ?auto_50708 ) ( IS-CRATE ?auto_50699 ) ( not ( = ?auto_50699 ?auto_50700 ) ) ( not ( = ?auto_50712 ?auto_50708 ) ) ( HOIST-AT ?auto_50711 ?auto_50712 ) ( not ( = ?auto_50710 ?auto_50711 ) ) ( AVAILABLE ?auto_50711 ) ( SURFACE-AT ?auto_50699 ?auto_50712 ) ( ON ?auto_50699 ?auto_50706 ) ( CLEAR ?auto_50699 ) ( not ( = ?auto_50699 ?auto_50706 ) ) ( not ( = ?auto_50700 ?auto_50706 ) ) ( IS-CRATE ?auto_50700 ) ( not ( = ?auto_50699 ?auto_50705 ) ) ( not ( = ?auto_50700 ?auto_50705 ) ) ( not ( = ?auto_50706 ?auto_50705 ) ) ( not ( = ?auto_50704 ?auto_50708 ) ) ( not ( = ?auto_50712 ?auto_50704 ) ) ( HOIST-AT ?auto_50701 ?auto_50704 ) ( not ( = ?auto_50710 ?auto_50701 ) ) ( not ( = ?auto_50711 ?auto_50701 ) ) ( AVAILABLE ?auto_50701 ) ( SURFACE-AT ?auto_50700 ?auto_50704 ) ( ON ?auto_50700 ?auto_50709 ) ( CLEAR ?auto_50700 ) ( not ( = ?auto_50699 ?auto_50709 ) ) ( not ( = ?auto_50700 ?auto_50709 ) ) ( not ( = ?auto_50706 ?auto_50709 ) ) ( not ( = ?auto_50705 ?auto_50709 ) ) ( SURFACE-AT ?auto_50703 ?auto_50708 ) ( CLEAR ?auto_50703 ) ( IS-CRATE ?auto_50705 ) ( not ( = ?auto_50699 ?auto_50703 ) ) ( not ( = ?auto_50700 ?auto_50703 ) ) ( not ( = ?auto_50706 ?auto_50703 ) ) ( not ( = ?auto_50705 ?auto_50703 ) ) ( not ( = ?auto_50709 ?auto_50703 ) ) ( AVAILABLE ?auto_50710 ) ( TRUCK-AT ?auto_50713 ?auto_50707 ) ( not ( = ?auto_50707 ?auto_50708 ) ) ( not ( = ?auto_50712 ?auto_50707 ) ) ( not ( = ?auto_50704 ?auto_50707 ) ) ( HOIST-AT ?auto_50702 ?auto_50707 ) ( not ( = ?auto_50710 ?auto_50702 ) ) ( not ( = ?auto_50711 ?auto_50702 ) ) ( not ( = ?auto_50701 ?auto_50702 ) ) ( AVAILABLE ?auto_50702 ) ( SURFACE-AT ?auto_50705 ?auto_50707 ) ( ON ?auto_50705 ?auto_50714 ) ( CLEAR ?auto_50705 ) ( not ( = ?auto_50699 ?auto_50714 ) ) ( not ( = ?auto_50700 ?auto_50714 ) ) ( not ( = ?auto_50706 ?auto_50714 ) ) ( not ( = ?auto_50705 ?auto_50714 ) ) ( not ( = ?auto_50709 ?auto_50714 ) ) ( not ( = ?auto_50703 ?auto_50714 ) ) )
    :subtasks
    ( ( !LIFT ?auto_50702 ?auto_50705 ?auto_50714 ?auto_50707 )
      ( MAKE-ON ?auto_50699 ?auto_50700 )
      ( MAKE-ON-VERIFY ?auto_50699 ?auto_50700 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50715 - SURFACE
      ?auto_50716 - SURFACE
    )
    :vars
    (
      ?auto_50721 - HOIST
      ?auto_50727 - PLACE
      ?auto_50730 - PLACE
      ?auto_50725 - HOIST
      ?auto_50729 - SURFACE
      ?auto_50723 - SURFACE
      ?auto_50728 - PLACE
      ?auto_50722 - HOIST
      ?auto_50719 - SURFACE
      ?auto_50726 - SURFACE
      ?auto_50720 - PLACE
      ?auto_50718 - HOIST
      ?auto_50724 - SURFACE
      ?auto_50717 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50721 ?auto_50727 ) ( IS-CRATE ?auto_50715 ) ( not ( = ?auto_50715 ?auto_50716 ) ) ( not ( = ?auto_50730 ?auto_50727 ) ) ( HOIST-AT ?auto_50725 ?auto_50730 ) ( not ( = ?auto_50721 ?auto_50725 ) ) ( AVAILABLE ?auto_50725 ) ( SURFACE-AT ?auto_50715 ?auto_50730 ) ( ON ?auto_50715 ?auto_50729 ) ( CLEAR ?auto_50715 ) ( not ( = ?auto_50715 ?auto_50729 ) ) ( not ( = ?auto_50716 ?auto_50729 ) ) ( IS-CRATE ?auto_50716 ) ( not ( = ?auto_50715 ?auto_50723 ) ) ( not ( = ?auto_50716 ?auto_50723 ) ) ( not ( = ?auto_50729 ?auto_50723 ) ) ( not ( = ?auto_50728 ?auto_50727 ) ) ( not ( = ?auto_50730 ?auto_50728 ) ) ( HOIST-AT ?auto_50722 ?auto_50728 ) ( not ( = ?auto_50721 ?auto_50722 ) ) ( not ( = ?auto_50725 ?auto_50722 ) ) ( AVAILABLE ?auto_50722 ) ( SURFACE-AT ?auto_50716 ?auto_50728 ) ( ON ?auto_50716 ?auto_50719 ) ( CLEAR ?auto_50716 ) ( not ( = ?auto_50715 ?auto_50719 ) ) ( not ( = ?auto_50716 ?auto_50719 ) ) ( not ( = ?auto_50729 ?auto_50719 ) ) ( not ( = ?auto_50723 ?auto_50719 ) ) ( SURFACE-AT ?auto_50726 ?auto_50727 ) ( CLEAR ?auto_50726 ) ( IS-CRATE ?auto_50723 ) ( not ( = ?auto_50715 ?auto_50726 ) ) ( not ( = ?auto_50716 ?auto_50726 ) ) ( not ( = ?auto_50729 ?auto_50726 ) ) ( not ( = ?auto_50723 ?auto_50726 ) ) ( not ( = ?auto_50719 ?auto_50726 ) ) ( AVAILABLE ?auto_50721 ) ( not ( = ?auto_50720 ?auto_50727 ) ) ( not ( = ?auto_50730 ?auto_50720 ) ) ( not ( = ?auto_50728 ?auto_50720 ) ) ( HOIST-AT ?auto_50718 ?auto_50720 ) ( not ( = ?auto_50721 ?auto_50718 ) ) ( not ( = ?auto_50725 ?auto_50718 ) ) ( not ( = ?auto_50722 ?auto_50718 ) ) ( AVAILABLE ?auto_50718 ) ( SURFACE-AT ?auto_50723 ?auto_50720 ) ( ON ?auto_50723 ?auto_50724 ) ( CLEAR ?auto_50723 ) ( not ( = ?auto_50715 ?auto_50724 ) ) ( not ( = ?auto_50716 ?auto_50724 ) ) ( not ( = ?auto_50729 ?auto_50724 ) ) ( not ( = ?auto_50723 ?auto_50724 ) ) ( not ( = ?auto_50719 ?auto_50724 ) ) ( not ( = ?auto_50726 ?auto_50724 ) ) ( TRUCK-AT ?auto_50717 ?auto_50727 ) )
    :subtasks
    ( ( !DRIVE ?auto_50717 ?auto_50727 ?auto_50720 )
      ( MAKE-ON ?auto_50715 ?auto_50716 )
      ( MAKE-ON-VERIFY ?auto_50715 ?auto_50716 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50733 - SURFACE
      ?auto_50734 - SURFACE
    )
    :vars
    (
      ?auto_50735 - HOIST
      ?auto_50736 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50735 ?auto_50736 ) ( SURFACE-AT ?auto_50734 ?auto_50736 ) ( CLEAR ?auto_50734 ) ( LIFTING ?auto_50735 ?auto_50733 ) ( IS-CRATE ?auto_50733 ) ( not ( = ?auto_50733 ?auto_50734 ) ) )
    :subtasks
    ( ( !DROP ?auto_50735 ?auto_50733 ?auto_50734 ?auto_50736 )
      ( MAKE-ON-VERIFY ?auto_50733 ?auto_50734 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50737 - SURFACE
      ?auto_50738 - SURFACE
    )
    :vars
    (
      ?auto_50740 - HOIST
      ?auto_50739 - PLACE
      ?auto_50741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50740 ?auto_50739 ) ( SURFACE-AT ?auto_50738 ?auto_50739 ) ( CLEAR ?auto_50738 ) ( IS-CRATE ?auto_50737 ) ( not ( = ?auto_50737 ?auto_50738 ) ) ( TRUCK-AT ?auto_50741 ?auto_50739 ) ( AVAILABLE ?auto_50740 ) ( IN ?auto_50737 ?auto_50741 ) )
    :subtasks
    ( ( !UNLOAD ?auto_50740 ?auto_50737 ?auto_50741 ?auto_50739 )
      ( MAKE-ON ?auto_50737 ?auto_50738 )
      ( MAKE-ON-VERIFY ?auto_50737 ?auto_50738 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50742 - SURFACE
      ?auto_50743 - SURFACE
    )
    :vars
    (
      ?auto_50744 - HOIST
      ?auto_50746 - PLACE
      ?auto_50745 - TRUCK
      ?auto_50747 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50744 ?auto_50746 ) ( SURFACE-AT ?auto_50743 ?auto_50746 ) ( CLEAR ?auto_50743 ) ( IS-CRATE ?auto_50742 ) ( not ( = ?auto_50742 ?auto_50743 ) ) ( AVAILABLE ?auto_50744 ) ( IN ?auto_50742 ?auto_50745 ) ( TRUCK-AT ?auto_50745 ?auto_50747 ) ( not ( = ?auto_50747 ?auto_50746 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_50745 ?auto_50747 ?auto_50746 )
      ( MAKE-ON ?auto_50742 ?auto_50743 )
      ( MAKE-ON-VERIFY ?auto_50742 ?auto_50743 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50748 - SURFACE
      ?auto_50749 - SURFACE
    )
    :vars
    (
      ?auto_50750 - HOIST
      ?auto_50753 - PLACE
      ?auto_50752 - TRUCK
      ?auto_50751 - PLACE
      ?auto_50754 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_50750 ?auto_50753 ) ( SURFACE-AT ?auto_50749 ?auto_50753 ) ( CLEAR ?auto_50749 ) ( IS-CRATE ?auto_50748 ) ( not ( = ?auto_50748 ?auto_50749 ) ) ( AVAILABLE ?auto_50750 ) ( TRUCK-AT ?auto_50752 ?auto_50751 ) ( not ( = ?auto_50751 ?auto_50753 ) ) ( HOIST-AT ?auto_50754 ?auto_50751 ) ( LIFTING ?auto_50754 ?auto_50748 ) ( not ( = ?auto_50750 ?auto_50754 ) ) )
    :subtasks
    ( ( !LOAD ?auto_50754 ?auto_50748 ?auto_50752 ?auto_50751 )
      ( MAKE-ON ?auto_50748 ?auto_50749 )
      ( MAKE-ON-VERIFY ?auto_50748 ?auto_50749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50755 - SURFACE
      ?auto_50756 - SURFACE
    )
    :vars
    (
      ?auto_50758 - HOIST
      ?auto_50757 - PLACE
      ?auto_50760 - TRUCK
      ?auto_50761 - PLACE
      ?auto_50759 - HOIST
      ?auto_50762 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50758 ?auto_50757 ) ( SURFACE-AT ?auto_50756 ?auto_50757 ) ( CLEAR ?auto_50756 ) ( IS-CRATE ?auto_50755 ) ( not ( = ?auto_50755 ?auto_50756 ) ) ( AVAILABLE ?auto_50758 ) ( TRUCK-AT ?auto_50760 ?auto_50761 ) ( not ( = ?auto_50761 ?auto_50757 ) ) ( HOIST-AT ?auto_50759 ?auto_50761 ) ( not ( = ?auto_50758 ?auto_50759 ) ) ( AVAILABLE ?auto_50759 ) ( SURFACE-AT ?auto_50755 ?auto_50761 ) ( ON ?auto_50755 ?auto_50762 ) ( CLEAR ?auto_50755 ) ( not ( = ?auto_50755 ?auto_50762 ) ) ( not ( = ?auto_50756 ?auto_50762 ) ) )
    :subtasks
    ( ( !LIFT ?auto_50759 ?auto_50755 ?auto_50762 ?auto_50761 )
      ( MAKE-ON ?auto_50755 ?auto_50756 )
      ( MAKE-ON-VERIFY ?auto_50755 ?auto_50756 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50763 - SURFACE
      ?auto_50764 - SURFACE
    )
    :vars
    (
      ?auto_50770 - HOIST
      ?auto_50765 - PLACE
      ?auto_50767 - PLACE
      ?auto_50769 - HOIST
      ?auto_50766 - SURFACE
      ?auto_50768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50770 ?auto_50765 ) ( SURFACE-AT ?auto_50764 ?auto_50765 ) ( CLEAR ?auto_50764 ) ( IS-CRATE ?auto_50763 ) ( not ( = ?auto_50763 ?auto_50764 ) ) ( AVAILABLE ?auto_50770 ) ( not ( = ?auto_50767 ?auto_50765 ) ) ( HOIST-AT ?auto_50769 ?auto_50767 ) ( not ( = ?auto_50770 ?auto_50769 ) ) ( AVAILABLE ?auto_50769 ) ( SURFACE-AT ?auto_50763 ?auto_50767 ) ( ON ?auto_50763 ?auto_50766 ) ( CLEAR ?auto_50763 ) ( not ( = ?auto_50763 ?auto_50766 ) ) ( not ( = ?auto_50764 ?auto_50766 ) ) ( TRUCK-AT ?auto_50768 ?auto_50765 ) )
    :subtasks
    ( ( !DRIVE ?auto_50768 ?auto_50765 ?auto_50767 )
      ( MAKE-ON ?auto_50763 ?auto_50764 )
      ( MAKE-ON-VERIFY ?auto_50763 ?auto_50764 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50771 - SURFACE
      ?auto_50772 - SURFACE
    )
    :vars
    (
      ?auto_50775 - HOIST
      ?auto_50776 - PLACE
      ?auto_50773 - PLACE
      ?auto_50778 - HOIST
      ?auto_50777 - SURFACE
      ?auto_50774 - TRUCK
      ?auto_50779 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50775 ?auto_50776 ) ( IS-CRATE ?auto_50771 ) ( not ( = ?auto_50771 ?auto_50772 ) ) ( not ( = ?auto_50773 ?auto_50776 ) ) ( HOIST-AT ?auto_50778 ?auto_50773 ) ( not ( = ?auto_50775 ?auto_50778 ) ) ( AVAILABLE ?auto_50778 ) ( SURFACE-AT ?auto_50771 ?auto_50773 ) ( ON ?auto_50771 ?auto_50777 ) ( CLEAR ?auto_50771 ) ( not ( = ?auto_50771 ?auto_50777 ) ) ( not ( = ?auto_50772 ?auto_50777 ) ) ( TRUCK-AT ?auto_50774 ?auto_50776 ) ( SURFACE-AT ?auto_50779 ?auto_50776 ) ( CLEAR ?auto_50779 ) ( LIFTING ?auto_50775 ?auto_50772 ) ( IS-CRATE ?auto_50772 ) ( not ( = ?auto_50771 ?auto_50779 ) ) ( not ( = ?auto_50772 ?auto_50779 ) ) ( not ( = ?auto_50777 ?auto_50779 ) ) )
    :subtasks
    ( ( !DROP ?auto_50775 ?auto_50772 ?auto_50779 ?auto_50776 )
      ( MAKE-ON ?auto_50771 ?auto_50772 )
      ( MAKE-ON-VERIFY ?auto_50771 ?auto_50772 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50780 - SURFACE
      ?auto_50781 - SURFACE
    )
    :vars
    (
      ?auto_50782 - HOIST
      ?auto_50786 - PLACE
      ?auto_50785 - PLACE
      ?auto_50788 - HOIST
      ?auto_50787 - SURFACE
      ?auto_50784 - TRUCK
      ?auto_50783 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50782 ?auto_50786 ) ( IS-CRATE ?auto_50780 ) ( not ( = ?auto_50780 ?auto_50781 ) ) ( not ( = ?auto_50785 ?auto_50786 ) ) ( HOIST-AT ?auto_50788 ?auto_50785 ) ( not ( = ?auto_50782 ?auto_50788 ) ) ( AVAILABLE ?auto_50788 ) ( SURFACE-AT ?auto_50780 ?auto_50785 ) ( ON ?auto_50780 ?auto_50787 ) ( CLEAR ?auto_50780 ) ( not ( = ?auto_50780 ?auto_50787 ) ) ( not ( = ?auto_50781 ?auto_50787 ) ) ( TRUCK-AT ?auto_50784 ?auto_50786 ) ( SURFACE-AT ?auto_50783 ?auto_50786 ) ( CLEAR ?auto_50783 ) ( IS-CRATE ?auto_50781 ) ( not ( = ?auto_50780 ?auto_50783 ) ) ( not ( = ?auto_50781 ?auto_50783 ) ) ( not ( = ?auto_50787 ?auto_50783 ) ) ( AVAILABLE ?auto_50782 ) ( IN ?auto_50781 ?auto_50784 ) )
    :subtasks
    ( ( !UNLOAD ?auto_50782 ?auto_50781 ?auto_50784 ?auto_50786 )
      ( MAKE-ON ?auto_50780 ?auto_50781 )
      ( MAKE-ON-VERIFY ?auto_50780 ?auto_50781 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50789 - SURFACE
      ?auto_50790 - SURFACE
    )
    :vars
    (
      ?auto_50797 - HOIST
      ?auto_50793 - PLACE
      ?auto_50796 - PLACE
      ?auto_50794 - HOIST
      ?auto_50791 - SURFACE
      ?auto_50792 - SURFACE
      ?auto_50795 - TRUCK
      ?auto_50798 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50797 ?auto_50793 ) ( IS-CRATE ?auto_50789 ) ( not ( = ?auto_50789 ?auto_50790 ) ) ( not ( = ?auto_50796 ?auto_50793 ) ) ( HOIST-AT ?auto_50794 ?auto_50796 ) ( not ( = ?auto_50797 ?auto_50794 ) ) ( AVAILABLE ?auto_50794 ) ( SURFACE-AT ?auto_50789 ?auto_50796 ) ( ON ?auto_50789 ?auto_50791 ) ( CLEAR ?auto_50789 ) ( not ( = ?auto_50789 ?auto_50791 ) ) ( not ( = ?auto_50790 ?auto_50791 ) ) ( SURFACE-AT ?auto_50792 ?auto_50793 ) ( CLEAR ?auto_50792 ) ( IS-CRATE ?auto_50790 ) ( not ( = ?auto_50789 ?auto_50792 ) ) ( not ( = ?auto_50790 ?auto_50792 ) ) ( not ( = ?auto_50791 ?auto_50792 ) ) ( AVAILABLE ?auto_50797 ) ( IN ?auto_50790 ?auto_50795 ) ( TRUCK-AT ?auto_50795 ?auto_50798 ) ( not ( = ?auto_50798 ?auto_50793 ) ) ( not ( = ?auto_50796 ?auto_50798 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_50795 ?auto_50798 ?auto_50793 )
      ( MAKE-ON ?auto_50789 ?auto_50790 )
      ( MAKE-ON-VERIFY ?auto_50789 ?auto_50790 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50799 - SURFACE
      ?auto_50800 - SURFACE
    )
    :vars
    (
      ?auto_50805 - HOIST
      ?auto_50804 - PLACE
      ?auto_50808 - PLACE
      ?auto_50802 - HOIST
      ?auto_50801 - SURFACE
      ?auto_50806 - SURFACE
      ?auto_50807 - TRUCK
      ?auto_50803 - PLACE
      ?auto_50809 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_50805 ?auto_50804 ) ( IS-CRATE ?auto_50799 ) ( not ( = ?auto_50799 ?auto_50800 ) ) ( not ( = ?auto_50808 ?auto_50804 ) ) ( HOIST-AT ?auto_50802 ?auto_50808 ) ( not ( = ?auto_50805 ?auto_50802 ) ) ( AVAILABLE ?auto_50802 ) ( SURFACE-AT ?auto_50799 ?auto_50808 ) ( ON ?auto_50799 ?auto_50801 ) ( CLEAR ?auto_50799 ) ( not ( = ?auto_50799 ?auto_50801 ) ) ( not ( = ?auto_50800 ?auto_50801 ) ) ( SURFACE-AT ?auto_50806 ?auto_50804 ) ( CLEAR ?auto_50806 ) ( IS-CRATE ?auto_50800 ) ( not ( = ?auto_50799 ?auto_50806 ) ) ( not ( = ?auto_50800 ?auto_50806 ) ) ( not ( = ?auto_50801 ?auto_50806 ) ) ( AVAILABLE ?auto_50805 ) ( TRUCK-AT ?auto_50807 ?auto_50803 ) ( not ( = ?auto_50803 ?auto_50804 ) ) ( not ( = ?auto_50808 ?auto_50803 ) ) ( HOIST-AT ?auto_50809 ?auto_50803 ) ( LIFTING ?auto_50809 ?auto_50800 ) ( not ( = ?auto_50805 ?auto_50809 ) ) ( not ( = ?auto_50802 ?auto_50809 ) ) )
    :subtasks
    ( ( !LOAD ?auto_50809 ?auto_50800 ?auto_50807 ?auto_50803 )
      ( MAKE-ON ?auto_50799 ?auto_50800 )
      ( MAKE-ON-VERIFY ?auto_50799 ?auto_50800 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50810 - SURFACE
      ?auto_50811 - SURFACE
    )
    :vars
    (
      ?auto_50817 - HOIST
      ?auto_50813 - PLACE
      ?auto_50819 - PLACE
      ?auto_50816 - HOIST
      ?auto_50820 - SURFACE
      ?auto_50812 - SURFACE
      ?auto_50814 - TRUCK
      ?auto_50818 - PLACE
      ?auto_50815 - HOIST
      ?auto_50821 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50817 ?auto_50813 ) ( IS-CRATE ?auto_50810 ) ( not ( = ?auto_50810 ?auto_50811 ) ) ( not ( = ?auto_50819 ?auto_50813 ) ) ( HOIST-AT ?auto_50816 ?auto_50819 ) ( not ( = ?auto_50817 ?auto_50816 ) ) ( AVAILABLE ?auto_50816 ) ( SURFACE-AT ?auto_50810 ?auto_50819 ) ( ON ?auto_50810 ?auto_50820 ) ( CLEAR ?auto_50810 ) ( not ( = ?auto_50810 ?auto_50820 ) ) ( not ( = ?auto_50811 ?auto_50820 ) ) ( SURFACE-AT ?auto_50812 ?auto_50813 ) ( CLEAR ?auto_50812 ) ( IS-CRATE ?auto_50811 ) ( not ( = ?auto_50810 ?auto_50812 ) ) ( not ( = ?auto_50811 ?auto_50812 ) ) ( not ( = ?auto_50820 ?auto_50812 ) ) ( AVAILABLE ?auto_50817 ) ( TRUCK-AT ?auto_50814 ?auto_50818 ) ( not ( = ?auto_50818 ?auto_50813 ) ) ( not ( = ?auto_50819 ?auto_50818 ) ) ( HOIST-AT ?auto_50815 ?auto_50818 ) ( not ( = ?auto_50817 ?auto_50815 ) ) ( not ( = ?auto_50816 ?auto_50815 ) ) ( AVAILABLE ?auto_50815 ) ( SURFACE-AT ?auto_50811 ?auto_50818 ) ( ON ?auto_50811 ?auto_50821 ) ( CLEAR ?auto_50811 ) ( not ( = ?auto_50810 ?auto_50821 ) ) ( not ( = ?auto_50811 ?auto_50821 ) ) ( not ( = ?auto_50820 ?auto_50821 ) ) ( not ( = ?auto_50812 ?auto_50821 ) ) )
    :subtasks
    ( ( !LIFT ?auto_50815 ?auto_50811 ?auto_50821 ?auto_50818 )
      ( MAKE-ON ?auto_50810 ?auto_50811 )
      ( MAKE-ON-VERIFY ?auto_50810 ?auto_50811 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50822 - SURFACE
      ?auto_50823 - SURFACE
    )
    :vars
    (
      ?auto_50829 - HOIST
      ?auto_50826 - PLACE
      ?auto_50830 - PLACE
      ?auto_50828 - HOIST
      ?auto_50827 - SURFACE
      ?auto_50833 - SURFACE
      ?auto_50831 - PLACE
      ?auto_50824 - HOIST
      ?auto_50832 - SURFACE
      ?auto_50825 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50829 ?auto_50826 ) ( IS-CRATE ?auto_50822 ) ( not ( = ?auto_50822 ?auto_50823 ) ) ( not ( = ?auto_50830 ?auto_50826 ) ) ( HOIST-AT ?auto_50828 ?auto_50830 ) ( not ( = ?auto_50829 ?auto_50828 ) ) ( AVAILABLE ?auto_50828 ) ( SURFACE-AT ?auto_50822 ?auto_50830 ) ( ON ?auto_50822 ?auto_50827 ) ( CLEAR ?auto_50822 ) ( not ( = ?auto_50822 ?auto_50827 ) ) ( not ( = ?auto_50823 ?auto_50827 ) ) ( SURFACE-AT ?auto_50833 ?auto_50826 ) ( CLEAR ?auto_50833 ) ( IS-CRATE ?auto_50823 ) ( not ( = ?auto_50822 ?auto_50833 ) ) ( not ( = ?auto_50823 ?auto_50833 ) ) ( not ( = ?auto_50827 ?auto_50833 ) ) ( AVAILABLE ?auto_50829 ) ( not ( = ?auto_50831 ?auto_50826 ) ) ( not ( = ?auto_50830 ?auto_50831 ) ) ( HOIST-AT ?auto_50824 ?auto_50831 ) ( not ( = ?auto_50829 ?auto_50824 ) ) ( not ( = ?auto_50828 ?auto_50824 ) ) ( AVAILABLE ?auto_50824 ) ( SURFACE-AT ?auto_50823 ?auto_50831 ) ( ON ?auto_50823 ?auto_50832 ) ( CLEAR ?auto_50823 ) ( not ( = ?auto_50822 ?auto_50832 ) ) ( not ( = ?auto_50823 ?auto_50832 ) ) ( not ( = ?auto_50827 ?auto_50832 ) ) ( not ( = ?auto_50833 ?auto_50832 ) ) ( TRUCK-AT ?auto_50825 ?auto_50826 ) )
    :subtasks
    ( ( !DRIVE ?auto_50825 ?auto_50826 ?auto_50831 )
      ( MAKE-ON ?auto_50822 ?auto_50823 )
      ( MAKE-ON-VERIFY ?auto_50822 ?auto_50823 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50834 - SURFACE
      ?auto_50835 - SURFACE
    )
    :vars
    (
      ?auto_50845 - HOIST
      ?auto_50839 - PLACE
      ?auto_50841 - PLACE
      ?auto_50842 - HOIST
      ?auto_50843 - SURFACE
      ?auto_50838 - SURFACE
      ?auto_50844 - PLACE
      ?auto_50836 - HOIST
      ?auto_50840 - SURFACE
      ?auto_50837 - TRUCK
      ?auto_50846 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50845 ?auto_50839 ) ( IS-CRATE ?auto_50834 ) ( not ( = ?auto_50834 ?auto_50835 ) ) ( not ( = ?auto_50841 ?auto_50839 ) ) ( HOIST-AT ?auto_50842 ?auto_50841 ) ( not ( = ?auto_50845 ?auto_50842 ) ) ( AVAILABLE ?auto_50842 ) ( SURFACE-AT ?auto_50834 ?auto_50841 ) ( ON ?auto_50834 ?auto_50843 ) ( CLEAR ?auto_50834 ) ( not ( = ?auto_50834 ?auto_50843 ) ) ( not ( = ?auto_50835 ?auto_50843 ) ) ( IS-CRATE ?auto_50835 ) ( not ( = ?auto_50834 ?auto_50838 ) ) ( not ( = ?auto_50835 ?auto_50838 ) ) ( not ( = ?auto_50843 ?auto_50838 ) ) ( not ( = ?auto_50844 ?auto_50839 ) ) ( not ( = ?auto_50841 ?auto_50844 ) ) ( HOIST-AT ?auto_50836 ?auto_50844 ) ( not ( = ?auto_50845 ?auto_50836 ) ) ( not ( = ?auto_50842 ?auto_50836 ) ) ( AVAILABLE ?auto_50836 ) ( SURFACE-AT ?auto_50835 ?auto_50844 ) ( ON ?auto_50835 ?auto_50840 ) ( CLEAR ?auto_50835 ) ( not ( = ?auto_50834 ?auto_50840 ) ) ( not ( = ?auto_50835 ?auto_50840 ) ) ( not ( = ?auto_50843 ?auto_50840 ) ) ( not ( = ?auto_50838 ?auto_50840 ) ) ( TRUCK-AT ?auto_50837 ?auto_50839 ) ( SURFACE-AT ?auto_50846 ?auto_50839 ) ( CLEAR ?auto_50846 ) ( LIFTING ?auto_50845 ?auto_50838 ) ( IS-CRATE ?auto_50838 ) ( not ( = ?auto_50834 ?auto_50846 ) ) ( not ( = ?auto_50835 ?auto_50846 ) ) ( not ( = ?auto_50843 ?auto_50846 ) ) ( not ( = ?auto_50838 ?auto_50846 ) ) ( not ( = ?auto_50840 ?auto_50846 ) ) )
    :subtasks
    ( ( !DROP ?auto_50845 ?auto_50838 ?auto_50846 ?auto_50839 )
      ( MAKE-ON ?auto_50834 ?auto_50835 )
      ( MAKE-ON-VERIFY ?auto_50834 ?auto_50835 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50847 - SURFACE
      ?auto_50848 - SURFACE
    )
    :vars
    (
      ?auto_50849 - HOIST
      ?auto_50853 - PLACE
      ?auto_50857 - PLACE
      ?auto_50854 - HOIST
      ?auto_50855 - SURFACE
      ?auto_50856 - SURFACE
      ?auto_50851 - PLACE
      ?auto_50858 - HOIST
      ?auto_50850 - SURFACE
      ?auto_50859 - TRUCK
      ?auto_50852 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50849 ?auto_50853 ) ( IS-CRATE ?auto_50847 ) ( not ( = ?auto_50847 ?auto_50848 ) ) ( not ( = ?auto_50857 ?auto_50853 ) ) ( HOIST-AT ?auto_50854 ?auto_50857 ) ( not ( = ?auto_50849 ?auto_50854 ) ) ( AVAILABLE ?auto_50854 ) ( SURFACE-AT ?auto_50847 ?auto_50857 ) ( ON ?auto_50847 ?auto_50855 ) ( CLEAR ?auto_50847 ) ( not ( = ?auto_50847 ?auto_50855 ) ) ( not ( = ?auto_50848 ?auto_50855 ) ) ( IS-CRATE ?auto_50848 ) ( not ( = ?auto_50847 ?auto_50856 ) ) ( not ( = ?auto_50848 ?auto_50856 ) ) ( not ( = ?auto_50855 ?auto_50856 ) ) ( not ( = ?auto_50851 ?auto_50853 ) ) ( not ( = ?auto_50857 ?auto_50851 ) ) ( HOIST-AT ?auto_50858 ?auto_50851 ) ( not ( = ?auto_50849 ?auto_50858 ) ) ( not ( = ?auto_50854 ?auto_50858 ) ) ( AVAILABLE ?auto_50858 ) ( SURFACE-AT ?auto_50848 ?auto_50851 ) ( ON ?auto_50848 ?auto_50850 ) ( CLEAR ?auto_50848 ) ( not ( = ?auto_50847 ?auto_50850 ) ) ( not ( = ?auto_50848 ?auto_50850 ) ) ( not ( = ?auto_50855 ?auto_50850 ) ) ( not ( = ?auto_50856 ?auto_50850 ) ) ( TRUCK-AT ?auto_50859 ?auto_50853 ) ( SURFACE-AT ?auto_50852 ?auto_50853 ) ( CLEAR ?auto_50852 ) ( IS-CRATE ?auto_50856 ) ( not ( = ?auto_50847 ?auto_50852 ) ) ( not ( = ?auto_50848 ?auto_50852 ) ) ( not ( = ?auto_50855 ?auto_50852 ) ) ( not ( = ?auto_50856 ?auto_50852 ) ) ( not ( = ?auto_50850 ?auto_50852 ) ) ( AVAILABLE ?auto_50849 ) ( IN ?auto_50856 ?auto_50859 ) )
    :subtasks
    ( ( !UNLOAD ?auto_50849 ?auto_50856 ?auto_50859 ?auto_50853 )
      ( MAKE-ON ?auto_50847 ?auto_50848 )
      ( MAKE-ON-VERIFY ?auto_50847 ?auto_50848 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50860 - SURFACE
      ?auto_50861 - SURFACE
    )
    :vars
    (
      ?auto_50863 - HOIST
      ?auto_50871 - PLACE
      ?auto_50866 - PLACE
      ?auto_50868 - HOIST
      ?auto_50862 - SURFACE
      ?auto_50865 - SURFACE
      ?auto_50872 - PLACE
      ?auto_50867 - HOIST
      ?auto_50870 - SURFACE
      ?auto_50864 - SURFACE
      ?auto_50869 - TRUCK
      ?auto_50873 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50863 ?auto_50871 ) ( IS-CRATE ?auto_50860 ) ( not ( = ?auto_50860 ?auto_50861 ) ) ( not ( = ?auto_50866 ?auto_50871 ) ) ( HOIST-AT ?auto_50868 ?auto_50866 ) ( not ( = ?auto_50863 ?auto_50868 ) ) ( AVAILABLE ?auto_50868 ) ( SURFACE-AT ?auto_50860 ?auto_50866 ) ( ON ?auto_50860 ?auto_50862 ) ( CLEAR ?auto_50860 ) ( not ( = ?auto_50860 ?auto_50862 ) ) ( not ( = ?auto_50861 ?auto_50862 ) ) ( IS-CRATE ?auto_50861 ) ( not ( = ?auto_50860 ?auto_50865 ) ) ( not ( = ?auto_50861 ?auto_50865 ) ) ( not ( = ?auto_50862 ?auto_50865 ) ) ( not ( = ?auto_50872 ?auto_50871 ) ) ( not ( = ?auto_50866 ?auto_50872 ) ) ( HOIST-AT ?auto_50867 ?auto_50872 ) ( not ( = ?auto_50863 ?auto_50867 ) ) ( not ( = ?auto_50868 ?auto_50867 ) ) ( AVAILABLE ?auto_50867 ) ( SURFACE-AT ?auto_50861 ?auto_50872 ) ( ON ?auto_50861 ?auto_50870 ) ( CLEAR ?auto_50861 ) ( not ( = ?auto_50860 ?auto_50870 ) ) ( not ( = ?auto_50861 ?auto_50870 ) ) ( not ( = ?auto_50862 ?auto_50870 ) ) ( not ( = ?auto_50865 ?auto_50870 ) ) ( SURFACE-AT ?auto_50864 ?auto_50871 ) ( CLEAR ?auto_50864 ) ( IS-CRATE ?auto_50865 ) ( not ( = ?auto_50860 ?auto_50864 ) ) ( not ( = ?auto_50861 ?auto_50864 ) ) ( not ( = ?auto_50862 ?auto_50864 ) ) ( not ( = ?auto_50865 ?auto_50864 ) ) ( not ( = ?auto_50870 ?auto_50864 ) ) ( AVAILABLE ?auto_50863 ) ( IN ?auto_50865 ?auto_50869 ) ( TRUCK-AT ?auto_50869 ?auto_50873 ) ( not ( = ?auto_50873 ?auto_50871 ) ) ( not ( = ?auto_50866 ?auto_50873 ) ) ( not ( = ?auto_50872 ?auto_50873 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_50869 ?auto_50873 ?auto_50871 )
      ( MAKE-ON ?auto_50860 ?auto_50861 )
      ( MAKE-ON-VERIFY ?auto_50860 ?auto_50861 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50874 - SURFACE
      ?auto_50875 - SURFACE
    )
    :vars
    (
      ?auto_50886 - HOIST
      ?auto_50877 - PLACE
      ?auto_50878 - PLACE
      ?auto_50876 - HOIST
      ?auto_50887 - SURFACE
      ?auto_50879 - SURFACE
      ?auto_50883 - PLACE
      ?auto_50884 - HOIST
      ?auto_50885 - SURFACE
      ?auto_50880 - SURFACE
      ?auto_50882 - TRUCK
      ?auto_50881 - PLACE
      ?auto_50888 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_50886 ?auto_50877 ) ( IS-CRATE ?auto_50874 ) ( not ( = ?auto_50874 ?auto_50875 ) ) ( not ( = ?auto_50878 ?auto_50877 ) ) ( HOIST-AT ?auto_50876 ?auto_50878 ) ( not ( = ?auto_50886 ?auto_50876 ) ) ( AVAILABLE ?auto_50876 ) ( SURFACE-AT ?auto_50874 ?auto_50878 ) ( ON ?auto_50874 ?auto_50887 ) ( CLEAR ?auto_50874 ) ( not ( = ?auto_50874 ?auto_50887 ) ) ( not ( = ?auto_50875 ?auto_50887 ) ) ( IS-CRATE ?auto_50875 ) ( not ( = ?auto_50874 ?auto_50879 ) ) ( not ( = ?auto_50875 ?auto_50879 ) ) ( not ( = ?auto_50887 ?auto_50879 ) ) ( not ( = ?auto_50883 ?auto_50877 ) ) ( not ( = ?auto_50878 ?auto_50883 ) ) ( HOIST-AT ?auto_50884 ?auto_50883 ) ( not ( = ?auto_50886 ?auto_50884 ) ) ( not ( = ?auto_50876 ?auto_50884 ) ) ( AVAILABLE ?auto_50884 ) ( SURFACE-AT ?auto_50875 ?auto_50883 ) ( ON ?auto_50875 ?auto_50885 ) ( CLEAR ?auto_50875 ) ( not ( = ?auto_50874 ?auto_50885 ) ) ( not ( = ?auto_50875 ?auto_50885 ) ) ( not ( = ?auto_50887 ?auto_50885 ) ) ( not ( = ?auto_50879 ?auto_50885 ) ) ( SURFACE-AT ?auto_50880 ?auto_50877 ) ( CLEAR ?auto_50880 ) ( IS-CRATE ?auto_50879 ) ( not ( = ?auto_50874 ?auto_50880 ) ) ( not ( = ?auto_50875 ?auto_50880 ) ) ( not ( = ?auto_50887 ?auto_50880 ) ) ( not ( = ?auto_50879 ?auto_50880 ) ) ( not ( = ?auto_50885 ?auto_50880 ) ) ( AVAILABLE ?auto_50886 ) ( TRUCK-AT ?auto_50882 ?auto_50881 ) ( not ( = ?auto_50881 ?auto_50877 ) ) ( not ( = ?auto_50878 ?auto_50881 ) ) ( not ( = ?auto_50883 ?auto_50881 ) ) ( HOIST-AT ?auto_50888 ?auto_50881 ) ( LIFTING ?auto_50888 ?auto_50879 ) ( not ( = ?auto_50886 ?auto_50888 ) ) ( not ( = ?auto_50876 ?auto_50888 ) ) ( not ( = ?auto_50884 ?auto_50888 ) ) )
    :subtasks
    ( ( !LOAD ?auto_50888 ?auto_50879 ?auto_50882 ?auto_50881 )
      ( MAKE-ON ?auto_50874 ?auto_50875 )
      ( MAKE-ON-VERIFY ?auto_50874 ?auto_50875 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50889 - SURFACE
      ?auto_50890 - SURFACE
    )
    :vars
    (
      ?auto_50898 - HOIST
      ?auto_50896 - PLACE
      ?auto_50893 - PLACE
      ?auto_50892 - HOIST
      ?auto_50897 - SURFACE
      ?auto_50899 - SURFACE
      ?auto_50891 - PLACE
      ?auto_50894 - HOIST
      ?auto_50902 - SURFACE
      ?auto_50903 - SURFACE
      ?auto_50900 - TRUCK
      ?auto_50895 - PLACE
      ?auto_50901 - HOIST
      ?auto_50904 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50898 ?auto_50896 ) ( IS-CRATE ?auto_50889 ) ( not ( = ?auto_50889 ?auto_50890 ) ) ( not ( = ?auto_50893 ?auto_50896 ) ) ( HOIST-AT ?auto_50892 ?auto_50893 ) ( not ( = ?auto_50898 ?auto_50892 ) ) ( AVAILABLE ?auto_50892 ) ( SURFACE-AT ?auto_50889 ?auto_50893 ) ( ON ?auto_50889 ?auto_50897 ) ( CLEAR ?auto_50889 ) ( not ( = ?auto_50889 ?auto_50897 ) ) ( not ( = ?auto_50890 ?auto_50897 ) ) ( IS-CRATE ?auto_50890 ) ( not ( = ?auto_50889 ?auto_50899 ) ) ( not ( = ?auto_50890 ?auto_50899 ) ) ( not ( = ?auto_50897 ?auto_50899 ) ) ( not ( = ?auto_50891 ?auto_50896 ) ) ( not ( = ?auto_50893 ?auto_50891 ) ) ( HOIST-AT ?auto_50894 ?auto_50891 ) ( not ( = ?auto_50898 ?auto_50894 ) ) ( not ( = ?auto_50892 ?auto_50894 ) ) ( AVAILABLE ?auto_50894 ) ( SURFACE-AT ?auto_50890 ?auto_50891 ) ( ON ?auto_50890 ?auto_50902 ) ( CLEAR ?auto_50890 ) ( not ( = ?auto_50889 ?auto_50902 ) ) ( not ( = ?auto_50890 ?auto_50902 ) ) ( not ( = ?auto_50897 ?auto_50902 ) ) ( not ( = ?auto_50899 ?auto_50902 ) ) ( SURFACE-AT ?auto_50903 ?auto_50896 ) ( CLEAR ?auto_50903 ) ( IS-CRATE ?auto_50899 ) ( not ( = ?auto_50889 ?auto_50903 ) ) ( not ( = ?auto_50890 ?auto_50903 ) ) ( not ( = ?auto_50897 ?auto_50903 ) ) ( not ( = ?auto_50899 ?auto_50903 ) ) ( not ( = ?auto_50902 ?auto_50903 ) ) ( AVAILABLE ?auto_50898 ) ( TRUCK-AT ?auto_50900 ?auto_50895 ) ( not ( = ?auto_50895 ?auto_50896 ) ) ( not ( = ?auto_50893 ?auto_50895 ) ) ( not ( = ?auto_50891 ?auto_50895 ) ) ( HOIST-AT ?auto_50901 ?auto_50895 ) ( not ( = ?auto_50898 ?auto_50901 ) ) ( not ( = ?auto_50892 ?auto_50901 ) ) ( not ( = ?auto_50894 ?auto_50901 ) ) ( AVAILABLE ?auto_50901 ) ( SURFACE-AT ?auto_50899 ?auto_50895 ) ( ON ?auto_50899 ?auto_50904 ) ( CLEAR ?auto_50899 ) ( not ( = ?auto_50889 ?auto_50904 ) ) ( not ( = ?auto_50890 ?auto_50904 ) ) ( not ( = ?auto_50897 ?auto_50904 ) ) ( not ( = ?auto_50899 ?auto_50904 ) ) ( not ( = ?auto_50902 ?auto_50904 ) ) ( not ( = ?auto_50903 ?auto_50904 ) ) )
    :subtasks
    ( ( !LIFT ?auto_50901 ?auto_50899 ?auto_50904 ?auto_50895 )
      ( MAKE-ON ?auto_50889 ?auto_50890 )
      ( MAKE-ON-VERIFY ?auto_50889 ?auto_50890 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50905 - SURFACE
      ?auto_50906 - SURFACE
    )
    :vars
    (
      ?auto_50918 - HOIST
      ?auto_50919 - PLACE
      ?auto_50907 - PLACE
      ?auto_50909 - HOIST
      ?auto_50913 - SURFACE
      ?auto_50910 - SURFACE
      ?auto_50911 - PLACE
      ?auto_50914 - HOIST
      ?auto_50912 - SURFACE
      ?auto_50920 - SURFACE
      ?auto_50908 - PLACE
      ?auto_50916 - HOIST
      ?auto_50917 - SURFACE
      ?auto_50915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50918 ?auto_50919 ) ( IS-CRATE ?auto_50905 ) ( not ( = ?auto_50905 ?auto_50906 ) ) ( not ( = ?auto_50907 ?auto_50919 ) ) ( HOIST-AT ?auto_50909 ?auto_50907 ) ( not ( = ?auto_50918 ?auto_50909 ) ) ( AVAILABLE ?auto_50909 ) ( SURFACE-AT ?auto_50905 ?auto_50907 ) ( ON ?auto_50905 ?auto_50913 ) ( CLEAR ?auto_50905 ) ( not ( = ?auto_50905 ?auto_50913 ) ) ( not ( = ?auto_50906 ?auto_50913 ) ) ( IS-CRATE ?auto_50906 ) ( not ( = ?auto_50905 ?auto_50910 ) ) ( not ( = ?auto_50906 ?auto_50910 ) ) ( not ( = ?auto_50913 ?auto_50910 ) ) ( not ( = ?auto_50911 ?auto_50919 ) ) ( not ( = ?auto_50907 ?auto_50911 ) ) ( HOIST-AT ?auto_50914 ?auto_50911 ) ( not ( = ?auto_50918 ?auto_50914 ) ) ( not ( = ?auto_50909 ?auto_50914 ) ) ( AVAILABLE ?auto_50914 ) ( SURFACE-AT ?auto_50906 ?auto_50911 ) ( ON ?auto_50906 ?auto_50912 ) ( CLEAR ?auto_50906 ) ( not ( = ?auto_50905 ?auto_50912 ) ) ( not ( = ?auto_50906 ?auto_50912 ) ) ( not ( = ?auto_50913 ?auto_50912 ) ) ( not ( = ?auto_50910 ?auto_50912 ) ) ( SURFACE-AT ?auto_50920 ?auto_50919 ) ( CLEAR ?auto_50920 ) ( IS-CRATE ?auto_50910 ) ( not ( = ?auto_50905 ?auto_50920 ) ) ( not ( = ?auto_50906 ?auto_50920 ) ) ( not ( = ?auto_50913 ?auto_50920 ) ) ( not ( = ?auto_50910 ?auto_50920 ) ) ( not ( = ?auto_50912 ?auto_50920 ) ) ( AVAILABLE ?auto_50918 ) ( not ( = ?auto_50908 ?auto_50919 ) ) ( not ( = ?auto_50907 ?auto_50908 ) ) ( not ( = ?auto_50911 ?auto_50908 ) ) ( HOIST-AT ?auto_50916 ?auto_50908 ) ( not ( = ?auto_50918 ?auto_50916 ) ) ( not ( = ?auto_50909 ?auto_50916 ) ) ( not ( = ?auto_50914 ?auto_50916 ) ) ( AVAILABLE ?auto_50916 ) ( SURFACE-AT ?auto_50910 ?auto_50908 ) ( ON ?auto_50910 ?auto_50917 ) ( CLEAR ?auto_50910 ) ( not ( = ?auto_50905 ?auto_50917 ) ) ( not ( = ?auto_50906 ?auto_50917 ) ) ( not ( = ?auto_50913 ?auto_50917 ) ) ( not ( = ?auto_50910 ?auto_50917 ) ) ( not ( = ?auto_50912 ?auto_50917 ) ) ( not ( = ?auto_50920 ?auto_50917 ) ) ( TRUCK-AT ?auto_50915 ?auto_50919 ) )
    :subtasks
    ( ( !DRIVE ?auto_50915 ?auto_50919 ?auto_50908 )
      ( MAKE-ON ?auto_50905 ?auto_50906 )
      ( MAKE-ON-VERIFY ?auto_50905 ?auto_50906 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50921 - SURFACE
      ?auto_50922 - SURFACE
    )
    :vars
    (
      ?auto_50929 - HOIST
      ?auto_50927 - PLACE
      ?auto_50925 - PLACE
      ?auto_50934 - HOIST
      ?auto_50933 - SURFACE
      ?auto_50935 - SURFACE
      ?auto_50926 - PLACE
      ?auto_50930 - HOIST
      ?auto_50932 - SURFACE
      ?auto_50936 - SURFACE
      ?auto_50924 - PLACE
      ?auto_50928 - HOIST
      ?auto_50923 - SURFACE
      ?auto_50931 - TRUCK
      ?auto_50937 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50929 ?auto_50927 ) ( IS-CRATE ?auto_50921 ) ( not ( = ?auto_50921 ?auto_50922 ) ) ( not ( = ?auto_50925 ?auto_50927 ) ) ( HOIST-AT ?auto_50934 ?auto_50925 ) ( not ( = ?auto_50929 ?auto_50934 ) ) ( AVAILABLE ?auto_50934 ) ( SURFACE-AT ?auto_50921 ?auto_50925 ) ( ON ?auto_50921 ?auto_50933 ) ( CLEAR ?auto_50921 ) ( not ( = ?auto_50921 ?auto_50933 ) ) ( not ( = ?auto_50922 ?auto_50933 ) ) ( IS-CRATE ?auto_50922 ) ( not ( = ?auto_50921 ?auto_50935 ) ) ( not ( = ?auto_50922 ?auto_50935 ) ) ( not ( = ?auto_50933 ?auto_50935 ) ) ( not ( = ?auto_50926 ?auto_50927 ) ) ( not ( = ?auto_50925 ?auto_50926 ) ) ( HOIST-AT ?auto_50930 ?auto_50926 ) ( not ( = ?auto_50929 ?auto_50930 ) ) ( not ( = ?auto_50934 ?auto_50930 ) ) ( AVAILABLE ?auto_50930 ) ( SURFACE-AT ?auto_50922 ?auto_50926 ) ( ON ?auto_50922 ?auto_50932 ) ( CLEAR ?auto_50922 ) ( not ( = ?auto_50921 ?auto_50932 ) ) ( not ( = ?auto_50922 ?auto_50932 ) ) ( not ( = ?auto_50933 ?auto_50932 ) ) ( not ( = ?auto_50935 ?auto_50932 ) ) ( IS-CRATE ?auto_50935 ) ( not ( = ?auto_50921 ?auto_50936 ) ) ( not ( = ?auto_50922 ?auto_50936 ) ) ( not ( = ?auto_50933 ?auto_50936 ) ) ( not ( = ?auto_50935 ?auto_50936 ) ) ( not ( = ?auto_50932 ?auto_50936 ) ) ( not ( = ?auto_50924 ?auto_50927 ) ) ( not ( = ?auto_50925 ?auto_50924 ) ) ( not ( = ?auto_50926 ?auto_50924 ) ) ( HOIST-AT ?auto_50928 ?auto_50924 ) ( not ( = ?auto_50929 ?auto_50928 ) ) ( not ( = ?auto_50934 ?auto_50928 ) ) ( not ( = ?auto_50930 ?auto_50928 ) ) ( AVAILABLE ?auto_50928 ) ( SURFACE-AT ?auto_50935 ?auto_50924 ) ( ON ?auto_50935 ?auto_50923 ) ( CLEAR ?auto_50935 ) ( not ( = ?auto_50921 ?auto_50923 ) ) ( not ( = ?auto_50922 ?auto_50923 ) ) ( not ( = ?auto_50933 ?auto_50923 ) ) ( not ( = ?auto_50935 ?auto_50923 ) ) ( not ( = ?auto_50932 ?auto_50923 ) ) ( not ( = ?auto_50936 ?auto_50923 ) ) ( TRUCK-AT ?auto_50931 ?auto_50927 ) ( SURFACE-AT ?auto_50937 ?auto_50927 ) ( CLEAR ?auto_50937 ) ( LIFTING ?auto_50929 ?auto_50936 ) ( IS-CRATE ?auto_50936 ) ( not ( = ?auto_50921 ?auto_50937 ) ) ( not ( = ?auto_50922 ?auto_50937 ) ) ( not ( = ?auto_50933 ?auto_50937 ) ) ( not ( = ?auto_50935 ?auto_50937 ) ) ( not ( = ?auto_50932 ?auto_50937 ) ) ( not ( = ?auto_50936 ?auto_50937 ) ) ( not ( = ?auto_50923 ?auto_50937 ) ) )
    :subtasks
    ( ( !DROP ?auto_50929 ?auto_50936 ?auto_50937 ?auto_50927 )
      ( MAKE-ON ?auto_50921 ?auto_50922 )
      ( MAKE-ON-VERIFY ?auto_50921 ?auto_50922 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50938 - SURFACE
      ?auto_50939 - SURFACE
    )
    :vars
    (
      ?auto_50954 - HOIST
      ?auto_50941 - PLACE
      ?auto_50950 - PLACE
      ?auto_50952 - HOIST
      ?auto_50947 - SURFACE
      ?auto_50949 - SURFACE
      ?auto_50942 - PLACE
      ?auto_50944 - HOIST
      ?auto_50948 - SURFACE
      ?auto_50945 - SURFACE
      ?auto_50943 - PLACE
      ?auto_50940 - HOIST
      ?auto_50953 - SURFACE
      ?auto_50951 - TRUCK
      ?auto_50946 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50954 ?auto_50941 ) ( IS-CRATE ?auto_50938 ) ( not ( = ?auto_50938 ?auto_50939 ) ) ( not ( = ?auto_50950 ?auto_50941 ) ) ( HOIST-AT ?auto_50952 ?auto_50950 ) ( not ( = ?auto_50954 ?auto_50952 ) ) ( AVAILABLE ?auto_50952 ) ( SURFACE-AT ?auto_50938 ?auto_50950 ) ( ON ?auto_50938 ?auto_50947 ) ( CLEAR ?auto_50938 ) ( not ( = ?auto_50938 ?auto_50947 ) ) ( not ( = ?auto_50939 ?auto_50947 ) ) ( IS-CRATE ?auto_50939 ) ( not ( = ?auto_50938 ?auto_50949 ) ) ( not ( = ?auto_50939 ?auto_50949 ) ) ( not ( = ?auto_50947 ?auto_50949 ) ) ( not ( = ?auto_50942 ?auto_50941 ) ) ( not ( = ?auto_50950 ?auto_50942 ) ) ( HOIST-AT ?auto_50944 ?auto_50942 ) ( not ( = ?auto_50954 ?auto_50944 ) ) ( not ( = ?auto_50952 ?auto_50944 ) ) ( AVAILABLE ?auto_50944 ) ( SURFACE-AT ?auto_50939 ?auto_50942 ) ( ON ?auto_50939 ?auto_50948 ) ( CLEAR ?auto_50939 ) ( not ( = ?auto_50938 ?auto_50948 ) ) ( not ( = ?auto_50939 ?auto_50948 ) ) ( not ( = ?auto_50947 ?auto_50948 ) ) ( not ( = ?auto_50949 ?auto_50948 ) ) ( IS-CRATE ?auto_50949 ) ( not ( = ?auto_50938 ?auto_50945 ) ) ( not ( = ?auto_50939 ?auto_50945 ) ) ( not ( = ?auto_50947 ?auto_50945 ) ) ( not ( = ?auto_50949 ?auto_50945 ) ) ( not ( = ?auto_50948 ?auto_50945 ) ) ( not ( = ?auto_50943 ?auto_50941 ) ) ( not ( = ?auto_50950 ?auto_50943 ) ) ( not ( = ?auto_50942 ?auto_50943 ) ) ( HOIST-AT ?auto_50940 ?auto_50943 ) ( not ( = ?auto_50954 ?auto_50940 ) ) ( not ( = ?auto_50952 ?auto_50940 ) ) ( not ( = ?auto_50944 ?auto_50940 ) ) ( AVAILABLE ?auto_50940 ) ( SURFACE-AT ?auto_50949 ?auto_50943 ) ( ON ?auto_50949 ?auto_50953 ) ( CLEAR ?auto_50949 ) ( not ( = ?auto_50938 ?auto_50953 ) ) ( not ( = ?auto_50939 ?auto_50953 ) ) ( not ( = ?auto_50947 ?auto_50953 ) ) ( not ( = ?auto_50949 ?auto_50953 ) ) ( not ( = ?auto_50948 ?auto_50953 ) ) ( not ( = ?auto_50945 ?auto_50953 ) ) ( TRUCK-AT ?auto_50951 ?auto_50941 ) ( SURFACE-AT ?auto_50946 ?auto_50941 ) ( CLEAR ?auto_50946 ) ( IS-CRATE ?auto_50945 ) ( not ( = ?auto_50938 ?auto_50946 ) ) ( not ( = ?auto_50939 ?auto_50946 ) ) ( not ( = ?auto_50947 ?auto_50946 ) ) ( not ( = ?auto_50949 ?auto_50946 ) ) ( not ( = ?auto_50948 ?auto_50946 ) ) ( not ( = ?auto_50945 ?auto_50946 ) ) ( not ( = ?auto_50953 ?auto_50946 ) ) ( AVAILABLE ?auto_50954 ) ( IN ?auto_50945 ?auto_50951 ) )
    :subtasks
    ( ( !UNLOAD ?auto_50954 ?auto_50945 ?auto_50951 ?auto_50941 )
      ( MAKE-ON ?auto_50938 ?auto_50939 )
      ( MAKE-ON-VERIFY ?auto_50938 ?auto_50939 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50955 - SURFACE
      ?auto_50956 - SURFACE
    )
    :vars
    (
      ?auto_50966 - HOIST
      ?auto_50960 - PLACE
      ?auto_50959 - PLACE
      ?auto_50961 - HOIST
      ?auto_50970 - SURFACE
      ?auto_50964 - SURFACE
      ?auto_50965 - PLACE
      ?auto_50963 - HOIST
      ?auto_50967 - SURFACE
      ?auto_50958 - SURFACE
      ?auto_50962 - PLACE
      ?auto_50957 - HOIST
      ?auto_50971 - SURFACE
      ?auto_50969 - SURFACE
      ?auto_50968 - TRUCK
      ?auto_50972 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50966 ?auto_50960 ) ( IS-CRATE ?auto_50955 ) ( not ( = ?auto_50955 ?auto_50956 ) ) ( not ( = ?auto_50959 ?auto_50960 ) ) ( HOIST-AT ?auto_50961 ?auto_50959 ) ( not ( = ?auto_50966 ?auto_50961 ) ) ( AVAILABLE ?auto_50961 ) ( SURFACE-AT ?auto_50955 ?auto_50959 ) ( ON ?auto_50955 ?auto_50970 ) ( CLEAR ?auto_50955 ) ( not ( = ?auto_50955 ?auto_50970 ) ) ( not ( = ?auto_50956 ?auto_50970 ) ) ( IS-CRATE ?auto_50956 ) ( not ( = ?auto_50955 ?auto_50964 ) ) ( not ( = ?auto_50956 ?auto_50964 ) ) ( not ( = ?auto_50970 ?auto_50964 ) ) ( not ( = ?auto_50965 ?auto_50960 ) ) ( not ( = ?auto_50959 ?auto_50965 ) ) ( HOIST-AT ?auto_50963 ?auto_50965 ) ( not ( = ?auto_50966 ?auto_50963 ) ) ( not ( = ?auto_50961 ?auto_50963 ) ) ( AVAILABLE ?auto_50963 ) ( SURFACE-AT ?auto_50956 ?auto_50965 ) ( ON ?auto_50956 ?auto_50967 ) ( CLEAR ?auto_50956 ) ( not ( = ?auto_50955 ?auto_50967 ) ) ( not ( = ?auto_50956 ?auto_50967 ) ) ( not ( = ?auto_50970 ?auto_50967 ) ) ( not ( = ?auto_50964 ?auto_50967 ) ) ( IS-CRATE ?auto_50964 ) ( not ( = ?auto_50955 ?auto_50958 ) ) ( not ( = ?auto_50956 ?auto_50958 ) ) ( not ( = ?auto_50970 ?auto_50958 ) ) ( not ( = ?auto_50964 ?auto_50958 ) ) ( not ( = ?auto_50967 ?auto_50958 ) ) ( not ( = ?auto_50962 ?auto_50960 ) ) ( not ( = ?auto_50959 ?auto_50962 ) ) ( not ( = ?auto_50965 ?auto_50962 ) ) ( HOIST-AT ?auto_50957 ?auto_50962 ) ( not ( = ?auto_50966 ?auto_50957 ) ) ( not ( = ?auto_50961 ?auto_50957 ) ) ( not ( = ?auto_50963 ?auto_50957 ) ) ( AVAILABLE ?auto_50957 ) ( SURFACE-AT ?auto_50964 ?auto_50962 ) ( ON ?auto_50964 ?auto_50971 ) ( CLEAR ?auto_50964 ) ( not ( = ?auto_50955 ?auto_50971 ) ) ( not ( = ?auto_50956 ?auto_50971 ) ) ( not ( = ?auto_50970 ?auto_50971 ) ) ( not ( = ?auto_50964 ?auto_50971 ) ) ( not ( = ?auto_50967 ?auto_50971 ) ) ( not ( = ?auto_50958 ?auto_50971 ) ) ( SURFACE-AT ?auto_50969 ?auto_50960 ) ( CLEAR ?auto_50969 ) ( IS-CRATE ?auto_50958 ) ( not ( = ?auto_50955 ?auto_50969 ) ) ( not ( = ?auto_50956 ?auto_50969 ) ) ( not ( = ?auto_50970 ?auto_50969 ) ) ( not ( = ?auto_50964 ?auto_50969 ) ) ( not ( = ?auto_50967 ?auto_50969 ) ) ( not ( = ?auto_50958 ?auto_50969 ) ) ( not ( = ?auto_50971 ?auto_50969 ) ) ( AVAILABLE ?auto_50966 ) ( IN ?auto_50958 ?auto_50968 ) ( TRUCK-AT ?auto_50968 ?auto_50972 ) ( not ( = ?auto_50972 ?auto_50960 ) ) ( not ( = ?auto_50959 ?auto_50972 ) ) ( not ( = ?auto_50965 ?auto_50972 ) ) ( not ( = ?auto_50962 ?auto_50972 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_50968 ?auto_50972 ?auto_50960 )
      ( MAKE-ON ?auto_50955 ?auto_50956 )
      ( MAKE-ON-VERIFY ?auto_50955 ?auto_50956 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50973 - SURFACE
      ?auto_50974 - SURFACE
    )
    :vars
    (
      ?auto_50978 - HOIST
      ?auto_50989 - PLACE
      ?auto_50984 - PLACE
      ?auto_50988 - HOIST
      ?auto_50985 - SURFACE
      ?auto_50981 - SURFACE
      ?auto_50980 - PLACE
      ?auto_50976 - HOIST
      ?auto_50982 - SURFACE
      ?auto_50987 - SURFACE
      ?auto_50986 - PLACE
      ?auto_50983 - HOIST
      ?auto_50975 - SURFACE
      ?auto_50977 - SURFACE
      ?auto_50990 - TRUCK
      ?auto_50979 - PLACE
      ?auto_50991 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_50978 ?auto_50989 ) ( IS-CRATE ?auto_50973 ) ( not ( = ?auto_50973 ?auto_50974 ) ) ( not ( = ?auto_50984 ?auto_50989 ) ) ( HOIST-AT ?auto_50988 ?auto_50984 ) ( not ( = ?auto_50978 ?auto_50988 ) ) ( AVAILABLE ?auto_50988 ) ( SURFACE-AT ?auto_50973 ?auto_50984 ) ( ON ?auto_50973 ?auto_50985 ) ( CLEAR ?auto_50973 ) ( not ( = ?auto_50973 ?auto_50985 ) ) ( not ( = ?auto_50974 ?auto_50985 ) ) ( IS-CRATE ?auto_50974 ) ( not ( = ?auto_50973 ?auto_50981 ) ) ( not ( = ?auto_50974 ?auto_50981 ) ) ( not ( = ?auto_50985 ?auto_50981 ) ) ( not ( = ?auto_50980 ?auto_50989 ) ) ( not ( = ?auto_50984 ?auto_50980 ) ) ( HOIST-AT ?auto_50976 ?auto_50980 ) ( not ( = ?auto_50978 ?auto_50976 ) ) ( not ( = ?auto_50988 ?auto_50976 ) ) ( AVAILABLE ?auto_50976 ) ( SURFACE-AT ?auto_50974 ?auto_50980 ) ( ON ?auto_50974 ?auto_50982 ) ( CLEAR ?auto_50974 ) ( not ( = ?auto_50973 ?auto_50982 ) ) ( not ( = ?auto_50974 ?auto_50982 ) ) ( not ( = ?auto_50985 ?auto_50982 ) ) ( not ( = ?auto_50981 ?auto_50982 ) ) ( IS-CRATE ?auto_50981 ) ( not ( = ?auto_50973 ?auto_50987 ) ) ( not ( = ?auto_50974 ?auto_50987 ) ) ( not ( = ?auto_50985 ?auto_50987 ) ) ( not ( = ?auto_50981 ?auto_50987 ) ) ( not ( = ?auto_50982 ?auto_50987 ) ) ( not ( = ?auto_50986 ?auto_50989 ) ) ( not ( = ?auto_50984 ?auto_50986 ) ) ( not ( = ?auto_50980 ?auto_50986 ) ) ( HOIST-AT ?auto_50983 ?auto_50986 ) ( not ( = ?auto_50978 ?auto_50983 ) ) ( not ( = ?auto_50988 ?auto_50983 ) ) ( not ( = ?auto_50976 ?auto_50983 ) ) ( AVAILABLE ?auto_50983 ) ( SURFACE-AT ?auto_50981 ?auto_50986 ) ( ON ?auto_50981 ?auto_50975 ) ( CLEAR ?auto_50981 ) ( not ( = ?auto_50973 ?auto_50975 ) ) ( not ( = ?auto_50974 ?auto_50975 ) ) ( not ( = ?auto_50985 ?auto_50975 ) ) ( not ( = ?auto_50981 ?auto_50975 ) ) ( not ( = ?auto_50982 ?auto_50975 ) ) ( not ( = ?auto_50987 ?auto_50975 ) ) ( SURFACE-AT ?auto_50977 ?auto_50989 ) ( CLEAR ?auto_50977 ) ( IS-CRATE ?auto_50987 ) ( not ( = ?auto_50973 ?auto_50977 ) ) ( not ( = ?auto_50974 ?auto_50977 ) ) ( not ( = ?auto_50985 ?auto_50977 ) ) ( not ( = ?auto_50981 ?auto_50977 ) ) ( not ( = ?auto_50982 ?auto_50977 ) ) ( not ( = ?auto_50987 ?auto_50977 ) ) ( not ( = ?auto_50975 ?auto_50977 ) ) ( AVAILABLE ?auto_50978 ) ( TRUCK-AT ?auto_50990 ?auto_50979 ) ( not ( = ?auto_50979 ?auto_50989 ) ) ( not ( = ?auto_50984 ?auto_50979 ) ) ( not ( = ?auto_50980 ?auto_50979 ) ) ( not ( = ?auto_50986 ?auto_50979 ) ) ( HOIST-AT ?auto_50991 ?auto_50979 ) ( LIFTING ?auto_50991 ?auto_50987 ) ( not ( = ?auto_50978 ?auto_50991 ) ) ( not ( = ?auto_50988 ?auto_50991 ) ) ( not ( = ?auto_50976 ?auto_50991 ) ) ( not ( = ?auto_50983 ?auto_50991 ) ) )
    :subtasks
    ( ( !LOAD ?auto_50991 ?auto_50987 ?auto_50990 ?auto_50979 )
      ( MAKE-ON ?auto_50973 ?auto_50974 )
      ( MAKE-ON-VERIFY ?auto_50973 ?auto_50974 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_50992 - SURFACE
      ?auto_50993 - SURFACE
    )
    :vars
    (
      ?auto_51002 - HOIST
      ?auto_50998 - PLACE
      ?auto_51008 - PLACE
      ?auto_51005 - HOIST
      ?auto_50997 - SURFACE
      ?auto_50994 - SURFACE
      ?auto_50995 - PLACE
      ?auto_51004 - HOIST
      ?auto_51003 - SURFACE
      ?auto_51009 - SURFACE
      ?auto_50999 - PLACE
      ?auto_51007 - HOIST
      ?auto_51010 - SURFACE
      ?auto_50996 - SURFACE
      ?auto_51000 - TRUCK
      ?auto_51006 - PLACE
      ?auto_51001 - HOIST
      ?auto_51011 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51002 ?auto_50998 ) ( IS-CRATE ?auto_50992 ) ( not ( = ?auto_50992 ?auto_50993 ) ) ( not ( = ?auto_51008 ?auto_50998 ) ) ( HOIST-AT ?auto_51005 ?auto_51008 ) ( not ( = ?auto_51002 ?auto_51005 ) ) ( AVAILABLE ?auto_51005 ) ( SURFACE-AT ?auto_50992 ?auto_51008 ) ( ON ?auto_50992 ?auto_50997 ) ( CLEAR ?auto_50992 ) ( not ( = ?auto_50992 ?auto_50997 ) ) ( not ( = ?auto_50993 ?auto_50997 ) ) ( IS-CRATE ?auto_50993 ) ( not ( = ?auto_50992 ?auto_50994 ) ) ( not ( = ?auto_50993 ?auto_50994 ) ) ( not ( = ?auto_50997 ?auto_50994 ) ) ( not ( = ?auto_50995 ?auto_50998 ) ) ( not ( = ?auto_51008 ?auto_50995 ) ) ( HOIST-AT ?auto_51004 ?auto_50995 ) ( not ( = ?auto_51002 ?auto_51004 ) ) ( not ( = ?auto_51005 ?auto_51004 ) ) ( AVAILABLE ?auto_51004 ) ( SURFACE-AT ?auto_50993 ?auto_50995 ) ( ON ?auto_50993 ?auto_51003 ) ( CLEAR ?auto_50993 ) ( not ( = ?auto_50992 ?auto_51003 ) ) ( not ( = ?auto_50993 ?auto_51003 ) ) ( not ( = ?auto_50997 ?auto_51003 ) ) ( not ( = ?auto_50994 ?auto_51003 ) ) ( IS-CRATE ?auto_50994 ) ( not ( = ?auto_50992 ?auto_51009 ) ) ( not ( = ?auto_50993 ?auto_51009 ) ) ( not ( = ?auto_50997 ?auto_51009 ) ) ( not ( = ?auto_50994 ?auto_51009 ) ) ( not ( = ?auto_51003 ?auto_51009 ) ) ( not ( = ?auto_50999 ?auto_50998 ) ) ( not ( = ?auto_51008 ?auto_50999 ) ) ( not ( = ?auto_50995 ?auto_50999 ) ) ( HOIST-AT ?auto_51007 ?auto_50999 ) ( not ( = ?auto_51002 ?auto_51007 ) ) ( not ( = ?auto_51005 ?auto_51007 ) ) ( not ( = ?auto_51004 ?auto_51007 ) ) ( AVAILABLE ?auto_51007 ) ( SURFACE-AT ?auto_50994 ?auto_50999 ) ( ON ?auto_50994 ?auto_51010 ) ( CLEAR ?auto_50994 ) ( not ( = ?auto_50992 ?auto_51010 ) ) ( not ( = ?auto_50993 ?auto_51010 ) ) ( not ( = ?auto_50997 ?auto_51010 ) ) ( not ( = ?auto_50994 ?auto_51010 ) ) ( not ( = ?auto_51003 ?auto_51010 ) ) ( not ( = ?auto_51009 ?auto_51010 ) ) ( SURFACE-AT ?auto_50996 ?auto_50998 ) ( CLEAR ?auto_50996 ) ( IS-CRATE ?auto_51009 ) ( not ( = ?auto_50992 ?auto_50996 ) ) ( not ( = ?auto_50993 ?auto_50996 ) ) ( not ( = ?auto_50997 ?auto_50996 ) ) ( not ( = ?auto_50994 ?auto_50996 ) ) ( not ( = ?auto_51003 ?auto_50996 ) ) ( not ( = ?auto_51009 ?auto_50996 ) ) ( not ( = ?auto_51010 ?auto_50996 ) ) ( AVAILABLE ?auto_51002 ) ( TRUCK-AT ?auto_51000 ?auto_51006 ) ( not ( = ?auto_51006 ?auto_50998 ) ) ( not ( = ?auto_51008 ?auto_51006 ) ) ( not ( = ?auto_50995 ?auto_51006 ) ) ( not ( = ?auto_50999 ?auto_51006 ) ) ( HOIST-AT ?auto_51001 ?auto_51006 ) ( not ( = ?auto_51002 ?auto_51001 ) ) ( not ( = ?auto_51005 ?auto_51001 ) ) ( not ( = ?auto_51004 ?auto_51001 ) ) ( not ( = ?auto_51007 ?auto_51001 ) ) ( AVAILABLE ?auto_51001 ) ( SURFACE-AT ?auto_51009 ?auto_51006 ) ( ON ?auto_51009 ?auto_51011 ) ( CLEAR ?auto_51009 ) ( not ( = ?auto_50992 ?auto_51011 ) ) ( not ( = ?auto_50993 ?auto_51011 ) ) ( not ( = ?auto_50997 ?auto_51011 ) ) ( not ( = ?auto_50994 ?auto_51011 ) ) ( not ( = ?auto_51003 ?auto_51011 ) ) ( not ( = ?auto_51009 ?auto_51011 ) ) ( not ( = ?auto_51010 ?auto_51011 ) ) ( not ( = ?auto_50996 ?auto_51011 ) ) )
    :subtasks
    ( ( !LIFT ?auto_51001 ?auto_51009 ?auto_51011 ?auto_51006 )
      ( MAKE-ON ?auto_50992 ?auto_50993 )
      ( MAKE-ON-VERIFY ?auto_50992 ?auto_50993 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51012 - SURFACE
      ?auto_51013 - SURFACE
    )
    :vars
    (
      ?auto_51023 - HOIST
      ?auto_51024 - PLACE
      ?auto_51029 - PLACE
      ?auto_51027 - HOIST
      ?auto_51031 - SURFACE
      ?auto_51025 - SURFACE
      ?auto_51030 - PLACE
      ?auto_51020 - HOIST
      ?auto_51015 - SURFACE
      ?auto_51022 - SURFACE
      ?auto_51028 - PLACE
      ?auto_51021 - HOIST
      ?auto_51017 - SURFACE
      ?auto_51018 - SURFACE
      ?auto_51019 - PLACE
      ?auto_51016 - HOIST
      ?auto_51014 - SURFACE
      ?auto_51026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51023 ?auto_51024 ) ( IS-CRATE ?auto_51012 ) ( not ( = ?auto_51012 ?auto_51013 ) ) ( not ( = ?auto_51029 ?auto_51024 ) ) ( HOIST-AT ?auto_51027 ?auto_51029 ) ( not ( = ?auto_51023 ?auto_51027 ) ) ( AVAILABLE ?auto_51027 ) ( SURFACE-AT ?auto_51012 ?auto_51029 ) ( ON ?auto_51012 ?auto_51031 ) ( CLEAR ?auto_51012 ) ( not ( = ?auto_51012 ?auto_51031 ) ) ( not ( = ?auto_51013 ?auto_51031 ) ) ( IS-CRATE ?auto_51013 ) ( not ( = ?auto_51012 ?auto_51025 ) ) ( not ( = ?auto_51013 ?auto_51025 ) ) ( not ( = ?auto_51031 ?auto_51025 ) ) ( not ( = ?auto_51030 ?auto_51024 ) ) ( not ( = ?auto_51029 ?auto_51030 ) ) ( HOIST-AT ?auto_51020 ?auto_51030 ) ( not ( = ?auto_51023 ?auto_51020 ) ) ( not ( = ?auto_51027 ?auto_51020 ) ) ( AVAILABLE ?auto_51020 ) ( SURFACE-AT ?auto_51013 ?auto_51030 ) ( ON ?auto_51013 ?auto_51015 ) ( CLEAR ?auto_51013 ) ( not ( = ?auto_51012 ?auto_51015 ) ) ( not ( = ?auto_51013 ?auto_51015 ) ) ( not ( = ?auto_51031 ?auto_51015 ) ) ( not ( = ?auto_51025 ?auto_51015 ) ) ( IS-CRATE ?auto_51025 ) ( not ( = ?auto_51012 ?auto_51022 ) ) ( not ( = ?auto_51013 ?auto_51022 ) ) ( not ( = ?auto_51031 ?auto_51022 ) ) ( not ( = ?auto_51025 ?auto_51022 ) ) ( not ( = ?auto_51015 ?auto_51022 ) ) ( not ( = ?auto_51028 ?auto_51024 ) ) ( not ( = ?auto_51029 ?auto_51028 ) ) ( not ( = ?auto_51030 ?auto_51028 ) ) ( HOIST-AT ?auto_51021 ?auto_51028 ) ( not ( = ?auto_51023 ?auto_51021 ) ) ( not ( = ?auto_51027 ?auto_51021 ) ) ( not ( = ?auto_51020 ?auto_51021 ) ) ( AVAILABLE ?auto_51021 ) ( SURFACE-AT ?auto_51025 ?auto_51028 ) ( ON ?auto_51025 ?auto_51017 ) ( CLEAR ?auto_51025 ) ( not ( = ?auto_51012 ?auto_51017 ) ) ( not ( = ?auto_51013 ?auto_51017 ) ) ( not ( = ?auto_51031 ?auto_51017 ) ) ( not ( = ?auto_51025 ?auto_51017 ) ) ( not ( = ?auto_51015 ?auto_51017 ) ) ( not ( = ?auto_51022 ?auto_51017 ) ) ( SURFACE-AT ?auto_51018 ?auto_51024 ) ( CLEAR ?auto_51018 ) ( IS-CRATE ?auto_51022 ) ( not ( = ?auto_51012 ?auto_51018 ) ) ( not ( = ?auto_51013 ?auto_51018 ) ) ( not ( = ?auto_51031 ?auto_51018 ) ) ( not ( = ?auto_51025 ?auto_51018 ) ) ( not ( = ?auto_51015 ?auto_51018 ) ) ( not ( = ?auto_51022 ?auto_51018 ) ) ( not ( = ?auto_51017 ?auto_51018 ) ) ( AVAILABLE ?auto_51023 ) ( not ( = ?auto_51019 ?auto_51024 ) ) ( not ( = ?auto_51029 ?auto_51019 ) ) ( not ( = ?auto_51030 ?auto_51019 ) ) ( not ( = ?auto_51028 ?auto_51019 ) ) ( HOIST-AT ?auto_51016 ?auto_51019 ) ( not ( = ?auto_51023 ?auto_51016 ) ) ( not ( = ?auto_51027 ?auto_51016 ) ) ( not ( = ?auto_51020 ?auto_51016 ) ) ( not ( = ?auto_51021 ?auto_51016 ) ) ( AVAILABLE ?auto_51016 ) ( SURFACE-AT ?auto_51022 ?auto_51019 ) ( ON ?auto_51022 ?auto_51014 ) ( CLEAR ?auto_51022 ) ( not ( = ?auto_51012 ?auto_51014 ) ) ( not ( = ?auto_51013 ?auto_51014 ) ) ( not ( = ?auto_51031 ?auto_51014 ) ) ( not ( = ?auto_51025 ?auto_51014 ) ) ( not ( = ?auto_51015 ?auto_51014 ) ) ( not ( = ?auto_51022 ?auto_51014 ) ) ( not ( = ?auto_51017 ?auto_51014 ) ) ( not ( = ?auto_51018 ?auto_51014 ) ) ( TRUCK-AT ?auto_51026 ?auto_51024 ) )
    :subtasks
    ( ( !DRIVE ?auto_51026 ?auto_51024 ?auto_51019 )
      ( MAKE-ON ?auto_51012 ?auto_51013 )
      ( MAKE-ON-VERIFY ?auto_51012 ?auto_51013 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51034 - SURFACE
      ?auto_51035 - SURFACE
    )
    :vars
    (
      ?auto_51036 - HOIST
      ?auto_51037 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51036 ?auto_51037 ) ( SURFACE-AT ?auto_51035 ?auto_51037 ) ( CLEAR ?auto_51035 ) ( LIFTING ?auto_51036 ?auto_51034 ) ( IS-CRATE ?auto_51034 ) ( not ( = ?auto_51034 ?auto_51035 ) ) )
    :subtasks
    ( ( !DROP ?auto_51036 ?auto_51034 ?auto_51035 ?auto_51037 )
      ( MAKE-ON-VERIFY ?auto_51034 ?auto_51035 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51038 - SURFACE
      ?auto_51039 - SURFACE
    )
    :vars
    (
      ?auto_51041 - HOIST
      ?auto_51040 - PLACE
      ?auto_51042 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51041 ?auto_51040 ) ( SURFACE-AT ?auto_51039 ?auto_51040 ) ( CLEAR ?auto_51039 ) ( IS-CRATE ?auto_51038 ) ( not ( = ?auto_51038 ?auto_51039 ) ) ( TRUCK-AT ?auto_51042 ?auto_51040 ) ( AVAILABLE ?auto_51041 ) ( IN ?auto_51038 ?auto_51042 ) )
    :subtasks
    ( ( !UNLOAD ?auto_51041 ?auto_51038 ?auto_51042 ?auto_51040 )
      ( MAKE-ON ?auto_51038 ?auto_51039 )
      ( MAKE-ON-VERIFY ?auto_51038 ?auto_51039 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51043 - SURFACE
      ?auto_51044 - SURFACE
    )
    :vars
    (
      ?auto_51045 - HOIST
      ?auto_51046 - PLACE
      ?auto_51047 - TRUCK
      ?auto_51048 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51045 ?auto_51046 ) ( SURFACE-AT ?auto_51044 ?auto_51046 ) ( CLEAR ?auto_51044 ) ( IS-CRATE ?auto_51043 ) ( not ( = ?auto_51043 ?auto_51044 ) ) ( AVAILABLE ?auto_51045 ) ( IN ?auto_51043 ?auto_51047 ) ( TRUCK-AT ?auto_51047 ?auto_51048 ) ( not ( = ?auto_51048 ?auto_51046 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_51047 ?auto_51048 ?auto_51046 )
      ( MAKE-ON ?auto_51043 ?auto_51044 )
      ( MAKE-ON-VERIFY ?auto_51043 ?auto_51044 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51049 - SURFACE
      ?auto_51050 - SURFACE
    )
    :vars
    (
      ?auto_51053 - HOIST
      ?auto_51051 - PLACE
      ?auto_51052 - TRUCK
      ?auto_51054 - PLACE
      ?auto_51055 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_51053 ?auto_51051 ) ( SURFACE-AT ?auto_51050 ?auto_51051 ) ( CLEAR ?auto_51050 ) ( IS-CRATE ?auto_51049 ) ( not ( = ?auto_51049 ?auto_51050 ) ) ( AVAILABLE ?auto_51053 ) ( TRUCK-AT ?auto_51052 ?auto_51054 ) ( not ( = ?auto_51054 ?auto_51051 ) ) ( HOIST-AT ?auto_51055 ?auto_51054 ) ( LIFTING ?auto_51055 ?auto_51049 ) ( not ( = ?auto_51053 ?auto_51055 ) ) )
    :subtasks
    ( ( !LOAD ?auto_51055 ?auto_51049 ?auto_51052 ?auto_51054 )
      ( MAKE-ON ?auto_51049 ?auto_51050 )
      ( MAKE-ON-VERIFY ?auto_51049 ?auto_51050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51056 - SURFACE
      ?auto_51057 - SURFACE
    )
    :vars
    (
      ?auto_51058 - HOIST
      ?auto_51059 - PLACE
      ?auto_51060 - TRUCK
      ?auto_51061 - PLACE
      ?auto_51062 - HOIST
      ?auto_51063 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51058 ?auto_51059 ) ( SURFACE-AT ?auto_51057 ?auto_51059 ) ( CLEAR ?auto_51057 ) ( IS-CRATE ?auto_51056 ) ( not ( = ?auto_51056 ?auto_51057 ) ) ( AVAILABLE ?auto_51058 ) ( TRUCK-AT ?auto_51060 ?auto_51061 ) ( not ( = ?auto_51061 ?auto_51059 ) ) ( HOIST-AT ?auto_51062 ?auto_51061 ) ( not ( = ?auto_51058 ?auto_51062 ) ) ( AVAILABLE ?auto_51062 ) ( SURFACE-AT ?auto_51056 ?auto_51061 ) ( ON ?auto_51056 ?auto_51063 ) ( CLEAR ?auto_51056 ) ( not ( = ?auto_51056 ?auto_51063 ) ) ( not ( = ?auto_51057 ?auto_51063 ) ) )
    :subtasks
    ( ( !LIFT ?auto_51062 ?auto_51056 ?auto_51063 ?auto_51061 )
      ( MAKE-ON ?auto_51056 ?auto_51057 )
      ( MAKE-ON-VERIFY ?auto_51056 ?auto_51057 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51064 - SURFACE
      ?auto_51065 - SURFACE
    )
    :vars
    (
      ?auto_51066 - HOIST
      ?auto_51070 - PLACE
      ?auto_51067 - PLACE
      ?auto_51071 - HOIST
      ?auto_51068 - SURFACE
      ?auto_51069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51066 ?auto_51070 ) ( SURFACE-AT ?auto_51065 ?auto_51070 ) ( CLEAR ?auto_51065 ) ( IS-CRATE ?auto_51064 ) ( not ( = ?auto_51064 ?auto_51065 ) ) ( AVAILABLE ?auto_51066 ) ( not ( = ?auto_51067 ?auto_51070 ) ) ( HOIST-AT ?auto_51071 ?auto_51067 ) ( not ( = ?auto_51066 ?auto_51071 ) ) ( AVAILABLE ?auto_51071 ) ( SURFACE-AT ?auto_51064 ?auto_51067 ) ( ON ?auto_51064 ?auto_51068 ) ( CLEAR ?auto_51064 ) ( not ( = ?auto_51064 ?auto_51068 ) ) ( not ( = ?auto_51065 ?auto_51068 ) ) ( TRUCK-AT ?auto_51069 ?auto_51070 ) )
    :subtasks
    ( ( !DRIVE ?auto_51069 ?auto_51070 ?auto_51067 )
      ( MAKE-ON ?auto_51064 ?auto_51065 )
      ( MAKE-ON-VERIFY ?auto_51064 ?auto_51065 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51072 - SURFACE
      ?auto_51073 - SURFACE
    )
    :vars
    (
      ?auto_51079 - HOIST
      ?auto_51075 - PLACE
      ?auto_51078 - PLACE
      ?auto_51077 - HOIST
      ?auto_51074 - SURFACE
      ?auto_51076 - TRUCK
      ?auto_51080 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51079 ?auto_51075 ) ( IS-CRATE ?auto_51072 ) ( not ( = ?auto_51072 ?auto_51073 ) ) ( not ( = ?auto_51078 ?auto_51075 ) ) ( HOIST-AT ?auto_51077 ?auto_51078 ) ( not ( = ?auto_51079 ?auto_51077 ) ) ( AVAILABLE ?auto_51077 ) ( SURFACE-AT ?auto_51072 ?auto_51078 ) ( ON ?auto_51072 ?auto_51074 ) ( CLEAR ?auto_51072 ) ( not ( = ?auto_51072 ?auto_51074 ) ) ( not ( = ?auto_51073 ?auto_51074 ) ) ( TRUCK-AT ?auto_51076 ?auto_51075 ) ( SURFACE-AT ?auto_51080 ?auto_51075 ) ( CLEAR ?auto_51080 ) ( LIFTING ?auto_51079 ?auto_51073 ) ( IS-CRATE ?auto_51073 ) ( not ( = ?auto_51072 ?auto_51080 ) ) ( not ( = ?auto_51073 ?auto_51080 ) ) ( not ( = ?auto_51074 ?auto_51080 ) ) )
    :subtasks
    ( ( !DROP ?auto_51079 ?auto_51073 ?auto_51080 ?auto_51075 )
      ( MAKE-ON ?auto_51072 ?auto_51073 )
      ( MAKE-ON-VERIFY ?auto_51072 ?auto_51073 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51081 - SURFACE
      ?auto_51082 - SURFACE
    )
    :vars
    (
      ?auto_51083 - HOIST
      ?auto_51085 - PLACE
      ?auto_51089 - PLACE
      ?auto_51084 - HOIST
      ?auto_51087 - SURFACE
      ?auto_51088 - TRUCK
      ?auto_51086 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51083 ?auto_51085 ) ( IS-CRATE ?auto_51081 ) ( not ( = ?auto_51081 ?auto_51082 ) ) ( not ( = ?auto_51089 ?auto_51085 ) ) ( HOIST-AT ?auto_51084 ?auto_51089 ) ( not ( = ?auto_51083 ?auto_51084 ) ) ( AVAILABLE ?auto_51084 ) ( SURFACE-AT ?auto_51081 ?auto_51089 ) ( ON ?auto_51081 ?auto_51087 ) ( CLEAR ?auto_51081 ) ( not ( = ?auto_51081 ?auto_51087 ) ) ( not ( = ?auto_51082 ?auto_51087 ) ) ( TRUCK-AT ?auto_51088 ?auto_51085 ) ( SURFACE-AT ?auto_51086 ?auto_51085 ) ( CLEAR ?auto_51086 ) ( IS-CRATE ?auto_51082 ) ( not ( = ?auto_51081 ?auto_51086 ) ) ( not ( = ?auto_51082 ?auto_51086 ) ) ( not ( = ?auto_51087 ?auto_51086 ) ) ( AVAILABLE ?auto_51083 ) ( IN ?auto_51082 ?auto_51088 ) )
    :subtasks
    ( ( !UNLOAD ?auto_51083 ?auto_51082 ?auto_51088 ?auto_51085 )
      ( MAKE-ON ?auto_51081 ?auto_51082 )
      ( MAKE-ON-VERIFY ?auto_51081 ?auto_51082 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51090 - SURFACE
      ?auto_51091 - SURFACE
    )
    :vars
    (
      ?auto_51093 - HOIST
      ?auto_51094 - PLACE
      ?auto_51098 - PLACE
      ?auto_51097 - HOIST
      ?auto_51095 - SURFACE
      ?auto_51092 - SURFACE
      ?auto_51096 - TRUCK
      ?auto_51099 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51093 ?auto_51094 ) ( IS-CRATE ?auto_51090 ) ( not ( = ?auto_51090 ?auto_51091 ) ) ( not ( = ?auto_51098 ?auto_51094 ) ) ( HOIST-AT ?auto_51097 ?auto_51098 ) ( not ( = ?auto_51093 ?auto_51097 ) ) ( AVAILABLE ?auto_51097 ) ( SURFACE-AT ?auto_51090 ?auto_51098 ) ( ON ?auto_51090 ?auto_51095 ) ( CLEAR ?auto_51090 ) ( not ( = ?auto_51090 ?auto_51095 ) ) ( not ( = ?auto_51091 ?auto_51095 ) ) ( SURFACE-AT ?auto_51092 ?auto_51094 ) ( CLEAR ?auto_51092 ) ( IS-CRATE ?auto_51091 ) ( not ( = ?auto_51090 ?auto_51092 ) ) ( not ( = ?auto_51091 ?auto_51092 ) ) ( not ( = ?auto_51095 ?auto_51092 ) ) ( AVAILABLE ?auto_51093 ) ( IN ?auto_51091 ?auto_51096 ) ( TRUCK-AT ?auto_51096 ?auto_51099 ) ( not ( = ?auto_51099 ?auto_51094 ) ) ( not ( = ?auto_51098 ?auto_51099 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_51096 ?auto_51099 ?auto_51094 )
      ( MAKE-ON ?auto_51090 ?auto_51091 )
      ( MAKE-ON-VERIFY ?auto_51090 ?auto_51091 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51100 - SURFACE
      ?auto_51101 - SURFACE
    )
    :vars
    (
      ?auto_51106 - HOIST
      ?auto_51105 - PLACE
      ?auto_51104 - PLACE
      ?auto_51102 - HOIST
      ?auto_51103 - SURFACE
      ?auto_51109 - SURFACE
      ?auto_51107 - TRUCK
      ?auto_51108 - PLACE
      ?auto_51110 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_51106 ?auto_51105 ) ( IS-CRATE ?auto_51100 ) ( not ( = ?auto_51100 ?auto_51101 ) ) ( not ( = ?auto_51104 ?auto_51105 ) ) ( HOIST-AT ?auto_51102 ?auto_51104 ) ( not ( = ?auto_51106 ?auto_51102 ) ) ( AVAILABLE ?auto_51102 ) ( SURFACE-AT ?auto_51100 ?auto_51104 ) ( ON ?auto_51100 ?auto_51103 ) ( CLEAR ?auto_51100 ) ( not ( = ?auto_51100 ?auto_51103 ) ) ( not ( = ?auto_51101 ?auto_51103 ) ) ( SURFACE-AT ?auto_51109 ?auto_51105 ) ( CLEAR ?auto_51109 ) ( IS-CRATE ?auto_51101 ) ( not ( = ?auto_51100 ?auto_51109 ) ) ( not ( = ?auto_51101 ?auto_51109 ) ) ( not ( = ?auto_51103 ?auto_51109 ) ) ( AVAILABLE ?auto_51106 ) ( TRUCK-AT ?auto_51107 ?auto_51108 ) ( not ( = ?auto_51108 ?auto_51105 ) ) ( not ( = ?auto_51104 ?auto_51108 ) ) ( HOIST-AT ?auto_51110 ?auto_51108 ) ( LIFTING ?auto_51110 ?auto_51101 ) ( not ( = ?auto_51106 ?auto_51110 ) ) ( not ( = ?auto_51102 ?auto_51110 ) ) )
    :subtasks
    ( ( !LOAD ?auto_51110 ?auto_51101 ?auto_51107 ?auto_51108 )
      ( MAKE-ON ?auto_51100 ?auto_51101 )
      ( MAKE-ON-VERIFY ?auto_51100 ?auto_51101 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51111 - SURFACE
      ?auto_51112 - SURFACE
    )
    :vars
    (
      ?auto_51114 - HOIST
      ?auto_51116 - PLACE
      ?auto_51117 - PLACE
      ?auto_51118 - HOIST
      ?auto_51119 - SURFACE
      ?auto_51120 - SURFACE
      ?auto_51115 - TRUCK
      ?auto_51113 - PLACE
      ?auto_51121 - HOIST
      ?auto_51122 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51114 ?auto_51116 ) ( IS-CRATE ?auto_51111 ) ( not ( = ?auto_51111 ?auto_51112 ) ) ( not ( = ?auto_51117 ?auto_51116 ) ) ( HOIST-AT ?auto_51118 ?auto_51117 ) ( not ( = ?auto_51114 ?auto_51118 ) ) ( AVAILABLE ?auto_51118 ) ( SURFACE-AT ?auto_51111 ?auto_51117 ) ( ON ?auto_51111 ?auto_51119 ) ( CLEAR ?auto_51111 ) ( not ( = ?auto_51111 ?auto_51119 ) ) ( not ( = ?auto_51112 ?auto_51119 ) ) ( SURFACE-AT ?auto_51120 ?auto_51116 ) ( CLEAR ?auto_51120 ) ( IS-CRATE ?auto_51112 ) ( not ( = ?auto_51111 ?auto_51120 ) ) ( not ( = ?auto_51112 ?auto_51120 ) ) ( not ( = ?auto_51119 ?auto_51120 ) ) ( AVAILABLE ?auto_51114 ) ( TRUCK-AT ?auto_51115 ?auto_51113 ) ( not ( = ?auto_51113 ?auto_51116 ) ) ( not ( = ?auto_51117 ?auto_51113 ) ) ( HOIST-AT ?auto_51121 ?auto_51113 ) ( not ( = ?auto_51114 ?auto_51121 ) ) ( not ( = ?auto_51118 ?auto_51121 ) ) ( AVAILABLE ?auto_51121 ) ( SURFACE-AT ?auto_51112 ?auto_51113 ) ( ON ?auto_51112 ?auto_51122 ) ( CLEAR ?auto_51112 ) ( not ( = ?auto_51111 ?auto_51122 ) ) ( not ( = ?auto_51112 ?auto_51122 ) ) ( not ( = ?auto_51119 ?auto_51122 ) ) ( not ( = ?auto_51120 ?auto_51122 ) ) )
    :subtasks
    ( ( !LIFT ?auto_51121 ?auto_51112 ?auto_51122 ?auto_51113 )
      ( MAKE-ON ?auto_51111 ?auto_51112 )
      ( MAKE-ON-VERIFY ?auto_51111 ?auto_51112 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51123 - SURFACE
      ?auto_51124 - SURFACE
    )
    :vars
    (
      ?auto_51127 - HOIST
      ?auto_51133 - PLACE
      ?auto_51128 - PLACE
      ?auto_51134 - HOIST
      ?auto_51131 - SURFACE
      ?auto_51130 - SURFACE
      ?auto_51129 - PLACE
      ?auto_51125 - HOIST
      ?auto_51132 - SURFACE
      ?auto_51126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51127 ?auto_51133 ) ( IS-CRATE ?auto_51123 ) ( not ( = ?auto_51123 ?auto_51124 ) ) ( not ( = ?auto_51128 ?auto_51133 ) ) ( HOIST-AT ?auto_51134 ?auto_51128 ) ( not ( = ?auto_51127 ?auto_51134 ) ) ( AVAILABLE ?auto_51134 ) ( SURFACE-AT ?auto_51123 ?auto_51128 ) ( ON ?auto_51123 ?auto_51131 ) ( CLEAR ?auto_51123 ) ( not ( = ?auto_51123 ?auto_51131 ) ) ( not ( = ?auto_51124 ?auto_51131 ) ) ( SURFACE-AT ?auto_51130 ?auto_51133 ) ( CLEAR ?auto_51130 ) ( IS-CRATE ?auto_51124 ) ( not ( = ?auto_51123 ?auto_51130 ) ) ( not ( = ?auto_51124 ?auto_51130 ) ) ( not ( = ?auto_51131 ?auto_51130 ) ) ( AVAILABLE ?auto_51127 ) ( not ( = ?auto_51129 ?auto_51133 ) ) ( not ( = ?auto_51128 ?auto_51129 ) ) ( HOIST-AT ?auto_51125 ?auto_51129 ) ( not ( = ?auto_51127 ?auto_51125 ) ) ( not ( = ?auto_51134 ?auto_51125 ) ) ( AVAILABLE ?auto_51125 ) ( SURFACE-AT ?auto_51124 ?auto_51129 ) ( ON ?auto_51124 ?auto_51132 ) ( CLEAR ?auto_51124 ) ( not ( = ?auto_51123 ?auto_51132 ) ) ( not ( = ?auto_51124 ?auto_51132 ) ) ( not ( = ?auto_51131 ?auto_51132 ) ) ( not ( = ?auto_51130 ?auto_51132 ) ) ( TRUCK-AT ?auto_51126 ?auto_51133 ) )
    :subtasks
    ( ( !DRIVE ?auto_51126 ?auto_51133 ?auto_51129 )
      ( MAKE-ON ?auto_51123 ?auto_51124 )
      ( MAKE-ON-VERIFY ?auto_51123 ?auto_51124 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51135 - SURFACE
      ?auto_51136 - SURFACE
    )
    :vars
    (
      ?auto_51146 - HOIST
      ?auto_51145 - PLACE
      ?auto_51137 - PLACE
      ?auto_51139 - HOIST
      ?auto_51144 - SURFACE
      ?auto_51142 - SURFACE
      ?auto_51138 - PLACE
      ?auto_51140 - HOIST
      ?auto_51143 - SURFACE
      ?auto_51141 - TRUCK
      ?auto_51147 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51146 ?auto_51145 ) ( IS-CRATE ?auto_51135 ) ( not ( = ?auto_51135 ?auto_51136 ) ) ( not ( = ?auto_51137 ?auto_51145 ) ) ( HOIST-AT ?auto_51139 ?auto_51137 ) ( not ( = ?auto_51146 ?auto_51139 ) ) ( AVAILABLE ?auto_51139 ) ( SURFACE-AT ?auto_51135 ?auto_51137 ) ( ON ?auto_51135 ?auto_51144 ) ( CLEAR ?auto_51135 ) ( not ( = ?auto_51135 ?auto_51144 ) ) ( not ( = ?auto_51136 ?auto_51144 ) ) ( IS-CRATE ?auto_51136 ) ( not ( = ?auto_51135 ?auto_51142 ) ) ( not ( = ?auto_51136 ?auto_51142 ) ) ( not ( = ?auto_51144 ?auto_51142 ) ) ( not ( = ?auto_51138 ?auto_51145 ) ) ( not ( = ?auto_51137 ?auto_51138 ) ) ( HOIST-AT ?auto_51140 ?auto_51138 ) ( not ( = ?auto_51146 ?auto_51140 ) ) ( not ( = ?auto_51139 ?auto_51140 ) ) ( AVAILABLE ?auto_51140 ) ( SURFACE-AT ?auto_51136 ?auto_51138 ) ( ON ?auto_51136 ?auto_51143 ) ( CLEAR ?auto_51136 ) ( not ( = ?auto_51135 ?auto_51143 ) ) ( not ( = ?auto_51136 ?auto_51143 ) ) ( not ( = ?auto_51144 ?auto_51143 ) ) ( not ( = ?auto_51142 ?auto_51143 ) ) ( TRUCK-AT ?auto_51141 ?auto_51145 ) ( SURFACE-AT ?auto_51147 ?auto_51145 ) ( CLEAR ?auto_51147 ) ( LIFTING ?auto_51146 ?auto_51142 ) ( IS-CRATE ?auto_51142 ) ( not ( = ?auto_51135 ?auto_51147 ) ) ( not ( = ?auto_51136 ?auto_51147 ) ) ( not ( = ?auto_51144 ?auto_51147 ) ) ( not ( = ?auto_51142 ?auto_51147 ) ) ( not ( = ?auto_51143 ?auto_51147 ) ) )
    :subtasks
    ( ( !DROP ?auto_51146 ?auto_51142 ?auto_51147 ?auto_51145 )
      ( MAKE-ON ?auto_51135 ?auto_51136 )
      ( MAKE-ON-VERIFY ?auto_51135 ?auto_51136 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51148 - SURFACE
      ?auto_51149 - SURFACE
    )
    :vars
    (
      ?auto_51160 - HOIST
      ?auto_51156 - PLACE
      ?auto_51152 - PLACE
      ?auto_51151 - HOIST
      ?auto_51158 - SURFACE
      ?auto_51153 - SURFACE
      ?auto_51155 - PLACE
      ?auto_51154 - HOIST
      ?auto_51159 - SURFACE
      ?auto_51157 - TRUCK
      ?auto_51150 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51160 ?auto_51156 ) ( IS-CRATE ?auto_51148 ) ( not ( = ?auto_51148 ?auto_51149 ) ) ( not ( = ?auto_51152 ?auto_51156 ) ) ( HOIST-AT ?auto_51151 ?auto_51152 ) ( not ( = ?auto_51160 ?auto_51151 ) ) ( AVAILABLE ?auto_51151 ) ( SURFACE-AT ?auto_51148 ?auto_51152 ) ( ON ?auto_51148 ?auto_51158 ) ( CLEAR ?auto_51148 ) ( not ( = ?auto_51148 ?auto_51158 ) ) ( not ( = ?auto_51149 ?auto_51158 ) ) ( IS-CRATE ?auto_51149 ) ( not ( = ?auto_51148 ?auto_51153 ) ) ( not ( = ?auto_51149 ?auto_51153 ) ) ( not ( = ?auto_51158 ?auto_51153 ) ) ( not ( = ?auto_51155 ?auto_51156 ) ) ( not ( = ?auto_51152 ?auto_51155 ) ) ( HOIST-AT ?auto_51154 ?auto_51155 ) ( not ( = ?auto_51160 ?auto_51154 ) ) ( not ( = ?auto_51151 ?auto_51154 ) ) ( AVAILABLE ?auto_51154 ) ( SURFACE-AT ?auto_51149 ?auto_51155 ) ( ON ?auto_51149 ?auto_51159 ) ( CLEAR ?auto_51149 ) ( not ( = ?auto_51148 ?auto_51159 ) ) ( not ( = ?auto_51149 ?auto_51159 ) ) ( not ( = ?auto_51158 ?auto_51159 ) ) ( not ( = ?auto_51153 ?auto_51159 ) ) ( TRUCK-AT ?auto_51157 ?auto_51156 ) ( SURFACE-AT ?auto_51150 ?auto_51156 ) ( CLEAR ?auto_51150 ) ( IS-CRATE ?auto_51153 ) ( not ( = ?auto_51148 ?auto_51150 ) ) ( not ( = ?auto_51149 ?auto_51150 ) ) ( not ( = ?auto_51158 ?auto_51150 ) ) ( not ( = ?auto_51153 ?auto_51150 ) ) ( not ( = ?auto_51159 ?auto_51150 ) ) ( AVAILABLE ?auto_51160 ) ( IN ?auto_51153 ?auto_51157 ) )
    :subtasks
    ( ( !UNLOAD ?auto_51160 ?auto_51153 ?auto_51157 ?auto_51156 )
      ( MAKE-ON ?auto_51148 ?auto_51149 )
      ( MAKE-ON-VERIFY ?auto_51148 ?auto_51149 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51161 - SURFACE
      ?auto_51162 - SURFACE
    )
    :vars
    (
      ?auto_51167 - HOIST
      ?auto_51170 - PLACE
      ?auto_51171 - PLACE
      ?auto_51169 - HOIST
      ?auto_51173 - SURFACE
      ?auto_51168 - SURFACE
      ?auto_51163 - PLACE
      ?auto_51164 - HOIST
      ?auto_51166 - SURFACE
      ?auto_51172 - SURFACE
      ?auto_51165 - TRUCK
      ?auto_51174 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51167 ?auto_51170 ) ( IS-CRATE ?auto_51161 ) ( not ( = ?auto_51161 ?auto_51162 ) ) ( not ( = ?auto_51171 ?auto_51170 ) ) ( HOIST-AT ?auto_51169 ?auto_51171 ) ( not ( = ?auto_51167 ?auto_51169 ) ) ( AVAILABLE ?auto_51169 ) ( SURFACE-AT ?auto_51161 ?auto_51171 ) ( ON ?auto_51161 ?auto_51173 ) ( CLEAR ?auto_51161 ) ( not ( = ?auto_51161 ?auto_51173 ) ) ( not ( = ?auto_51162 ?auto_51173 ) ) ( IS-CRATE ?auto_51162 ) ( not ( = ?auto_51161 ?auto_51168 ) ) ( not ( = ?auto_51162 ?auto_51168 ) ) ( not ( = ?auto_51173 ?auto_51168 ) ) ( not ( = ?auto_51163 ?auto_51170 ) ) ( not ( = ?auto_51171 ?auto_51163 ) ) ( HOIST-AT ?auto_51164 ?auto_51163 ) ( not ( = ?auto_51167 ?auto_51164 ) ) ( not ( = ?auto_51169 ?auto_51164 ) ) ( AVAILABLE ?auto_51164 ) ( SURFACE-AT ?auto_51162 ?auto_51163 ) ( ON ?auto_51162 ?auto_51166 ) ( CLEAR ?auto_51162 ) ( not ( = ?auto_51161 ?auto_51166 ) ) ( not ( = ?auto_51162 ?auto_51166 ) ) ( not ( = ?auto_51173 ?auto_51166 ) ) ( not ( = ?auto_51168 ?auto_51166 ) ) ( SURFACE-AT ?auto_51172 ?auto_51170 ) ( CLEAR ?auto_51172 ) ( IS-CRATE ?auto_51168 ) ( not ( = ?auto_51161 ?auto_51172 ) ) ( not ( = ?auto_51162 ?auto_51172 ) ) ( not ( = ?auto_51173 ?auto_51172 ) ) ( not ( = ?auto_51168 ?auto_51172 ) ) ( not ( = ?auto_51166 ?auto_51172 ) ) ( AVAILABLE ?auto_51167 ) ( IN ?auto_51168 ?auto_51165 ) ( TRUCK-AT ?auto_51165 ?auto_51174 ) ( not ( = ?auto_51174 ?auto_51170 ) ) ( not ( = ?auto_51171 ?auto_51174 ) ) ( not ( = ?auto_51163 ?auto_51174 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_51165 ?auto_51174 ?auto_51170 )
      ( MAKE-ON ?auto_51161 ?auto_51162 )
      ( MAKE-ON-VERIFY ?auto_51161 ?auto_51162 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51175 - SURFACE
      ?auto_51176 - SURFACE
    )
    :vars
    (
      ?auto_51178 - HOIST
      ?auto_51184 - PLACE
      ?auto_51177 - PLACE
      ?auto_51180 - HOIST
      ?auto_51187 - SURFACE
      ?auto_51182 - SURFACE
      ?auto_51185 - PLACE
      ?auto_51181 - HOIST
      ?auto_51188 - SURFACE
      ?auto_51183 - SURFACE
      ?auto_51186 - TRUCK
      ?auto_51179 - PLACE
      ?auto_51189 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_51178 ?auto_51184 ) ( IS-CRATE ?auto_51175 ) ( not ( = ?auto_51175 ?auto_51176 ) ) ( not ( = ?auto_51177 ?auto_51184 ) ) ( HOIST-AT ?auto_51180 ?auto_51177 ) ( not ( = ?auto_51178 ?auto_51180 ) ) ( AVAILABLE ?auto_51180 ) ( SURFACE-AT ?auto_51175 ?auto_51177 ) ( ON ?auto_51175 ?auto_51187 ) ( CLEAR ?auto_51175 ) ( not ( = ?auto_51175 ?auto_51187 ) ) ( not ( = ?auto_51176 ?auto_51187 ) ) ( IS-CRATE ?auto_51176 ) ( not ( = ?auto_51175 ?auto_51182 ) ) ( not ( = ?auto_51176 ?auto_51182 ) ) ( not ( = ?auto_51187 ?auto_51182 ) ) ( not ( = ?auto_51185 ?auto_51184 ) ) ( not ( = ?auto_51177 ?auto_51185 ) ) ( HOIST-AT ?auto_51181 ?auto_51185 ) ( not ( = ?auto_51178 ?auto_51181 ) ) ( not ( = ?auto_51180 ?auto_51181 ) ) ( AVAILABLE ?auto_51181 ) ( SURFACE-AT ?auto_51176 ?auto_51185 ) ( ON ?auto_51176 ?auto_51188 ) ( CLEAR ?auto_51176 ) ( not ( = ?auto_51175 ?auto_51188 ) ) ( not ( = ?auto_51176 ?auto_51188 ) ) ( not ( = ?auto_51187 ?auto_51188 ) ) ( not ( = ?auto_51182 ?auto_51188 ) ) ( SURFACE-AT ?auto_51183 ?auto_51184 ) ( CLEAR ?auto_51183 ) ( IS-CRATE ?auto_51182 ) ( not ( = ?auto_51175 ?auto_51183 ) ) ( not ( = ?auto_51176 ?auto_51183 ) ) ( not ( = ?auto_51187 ?auto_51183 ) ) ( not ( = ?auto_51182 ?auto_51183 ) ) ( not ( = ?auto_51188 ?auto_51183 ) ) ( AVAILABLE ?auto_51178 ) ( TRUCK-AT ?auto_51186 ?auto_51179 ) ( not ( = ?auto_51179 ?auto_51184 ) ) ( not ( = ?auto_51177 ?auto_51179 ) ) ( not ( = ?auto_51185 ?auto_51179 ) ) ( HOIST-AT ?auto_51189 ?auto_51179 ) ( LIFTING ?auto_51189 ?auto_51182 ) ( not ( = ?auto_51178 ?auto_51189 ) ) ( not ( = ?auto_51180 ?auto_51189 ) ) ( not ( = ?auto_51181 ?auto_51189 ) ) )
    :subtasks
    ( ( !LOAD ?auto_51189 ?auto_51182 ?auto_51186 ?auto_51179 )
      ( MAKE-ON ?auto_51175 ?auto_51176 )
      ( MAKE-ON-VERIFY ?auto_51175 ?auto_51176 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51190 - SURFACE
      ?auto_51191 - SURFACE
    )
    :vars
    (
      ?auto_51201 - HOIST
      ?auto_51204 - PLACE
      ?auto_51202 - PLACE
      ?auto_51197 - HOIST
      ?auto_51196 - SURFACE
      ?auto_51203 - SURFACE
      ?auto_51193 - PLACE
      ?auto_51195 - HOIST
      ?auto_51198 - SURFACE
      ?auto_51199 - SURFACE
      ?auto_51194 - TRUCK
      ?auto_51200 - PLACE
      ?auto_51192 - HOIST
      ?auto_51205 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51201 ?auto_51204 ) ( IS-CRATE ?auto_51190 ) ( not ( = ?auto_51190 ?auto_51191 ) ) ( not ( = ?auto_51202 ?auto_51204 ) ) ( HOIST-AT ?auto_51197 ?auto_51202 ) ( not ( = ?auto_51201 ?auto_51197 ) ) ( AVAILABLE ?auto_51197 ) ( SURFACE-AT ?auto_51190 ?auto_51202 ) ( ON ?auto_51190 ?auto_51196 ) ( CLEAR ?auto_51190 ) ( not ( = ?auto_51190 ?auto_51196 ) ) ( not ( = ?auto_51191 ?auto_51196 ) ) ( IS-CRATE ?auto_51191 ) ( not ( = ?auto_51190 ?auto_51203 ) ) ( not ( = ?auto_51191 ?auto_51203 ) ) ( not ( = ?auto_51196 ?auto_51203 ) ) ( not ( = ?auto_51193 ?auto_51204 ) ) ( not ( = ?auto_51202 ?auto_51193 ) ) ( HOIST-AT ?auto_51195 ?auto_51193 ) ( not ( = ?auto_51201 ?auto_51195 ) ) ( not ( = ?auto_51197 ?auto_51195 ) ) ( AVAILABLE ?auto_51195 ) ( SURFACE-AT ?auto_51191 ?auto_51193 ) ( ON ?auto_51191 ?auto_51198 ) ( CLEAR ?auto_51191 ) ( not ( = ?auto_51190 ?auto_51198 ) ) ( not ( = ?auto_51191 ?auto_51198 ) ) ( not ( = ?auto_51196 ?auto_51198 ) ) ( not ( = ?auto_51203 ?auto_51198 ) ) ( SURFACE-AT ?auto_51199 ?auto_51204 ) ( CLEAR ?auto_51199 ) ( IS-CRATE ?auto_51203 ) ( not ( = ?auto_51190 ?auto_51199 ) ) ( not ( = ?auto_51191 ?auto_51199 ) ) ( not ( = ?auto_51196 ?auto_51199 ) ) ( not ( = ?auto_51203 ?auto_51199 ) ) ( not ( = ?auto_51198 ?auto_51199 ) ) ( AVAILABLE ?auto_51201 ) ( TRUCK-AT ?auto_51194 ?auto_51200 ) ( not ( = ?auto_51200 ?auto_51204 ) ) ( not ( = ?auto_51202 ?auto_51200 ) ) ( not ( = ?auto_51193 ?auto_51200 ) ) ( HOIST-AT ?auto_51192 ?auto_51200 ) ( not ( = ?auto_51201 ?auto_51192 ) ) ( not ( = ?auto_51197 ?auto_51192 ) ) ( not ( = ?auto_51195 ?auto_51192 ) ) ( AVAILABLE ?auto_51192 ) ( SURFACE-AT ?auto_51203 ?auto_51200 ) ( ON ?auto_51203 ?auto_51205 ) ( CLEAR ?auto_51203 ) ( not ( = ?auto_51190 ?auto_51205 ) ) ( not ( = ?auto_51191 ?auto_51205 ) ) ( not ( = ?auto_51196 ?auto_51205 ) ) ( not ( = ?auto_51203 ?auto_51205 ) ) ( not ( = ?auto_51198 ?auto_51205 ) ) ( not ( = ?auto_51199 ?auto_51205 ) ) )
    :subtasks
    ( ( !LIFT ?auto_51192 ?auto_51203 ?auto_51205 ?auto_51200 )
      ( MAKE-ON ?auto_51190 ?auto_51191 )
      ( MAKE-ON-VERIFY ?auto_51190 ?auto_51191 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51206 - SURFACE
      ?auto_51207 - SURFACE
    )
    :vars
    (
      ?auto_51208 - HOIST
      ?auto_51210 - PLACE
      ?auto_51218 - PLACE
      ?auto_51217 - HOIST
      ?auto_51220 - SURFACE
      ?auto_51219 - SURFACE
      ?auto_51221 - PLACE
      ?auto_51212 - HOIST
      ?auto_51211 - SURFACE
      ?auto_51213 - SURFACE
      ?auto_51214 - PLACE
      ?auto_51215 - HOIST
      ?auto_51216 - SURFACE
      ?auto_51209 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51208 ?auto_51210 ) ( IS-CRATE ?auto_51206 ) ( not ( = ?auto_51206 ?auto_51207 ) ) ( not ( = ?auto_51218 ?auto_51210 ) ) ( HOIST-AT ?auto_51217 ?auto_51218 ) ( not ( = ?auto_51208 ?auto_51217 ) ) ( AVAILABLE ?auto_51217 ) ( SURFACE-AT ?auto_51206 ?auto_51218 ) ( ON ?auto_51206 ?auto_51220 ) ( CLEAR ?auto_51206 ) ( not ( = ?auto_51206 ?auto_51220 ) ) ( not ( = ?auto_51207 ?auto_51220 ) ) ( IS-CRATE ?auto_51207 ) ( not ( = ?auto_51206 ?auto_51219 ) ) ( not ( = ?auto_51207 ?auto_51219 ) ) ( not ( = ?auto_51220 ?auto_51219 ) ) ( not ( = ?auto_51221 ?auto_51210 ) ) ( not ( = ?auto_51218 ?auto_51221 ) ) ( HOIST-AT ?auto_51212 ?auto_51221 ) ( not ( = ?auto_51208 ?auto_51212 ) ) ( not ( = ?auto_51217 ?auto_51212 ) ) ( AVAILABLE ?auto_51212 ) ( SURFACE-AT ?auto_51207 ?auto_51221 ) ( ON ?auto_51207 ?auto_51211 ) ( CLEAR ?auto_51207 ) ( not ( = ?auto_51206 ?auto_51211 ) ) ( not ( = ?auto_51207 ?auto_51211 ) ) ( not ( = ?auto_51220 ?auto_51211 ) ) ( not ( = ?auto_51219 ?auto_51211 ) ) ( SURFACE-AT ?auto_51213 ?auto_51210 ) ( CLEAR ?auto_51213 ) ( IS-CRATE ?auto_51219 ) ( not ( = ?auto_51206 ?auto_51213 ) ) ( not ( = ?auto_51207 ?auto_51213 ) ) ( not ( = ?auto_51220 ?auto_51213 ) ) ( not ( = ?auto_51219 ?auto_51213 ) ) ( not ( = ?auto_51211 ?auto_51213 ) ) ( AVAILABLE ?auto_51208 ) ( not ( = ?auto_51214 ?auto_51210 ) ) ( not ( = ?auto_51218 ?auto_51214 ) ) ( not ( = ?auto_51221 ?auto_51214 ) ) ( HOIST-AT ?auto_51215 ?auto_51214 ) ( not ( = ?auto_51208 ?auto_51215 ) ) ( not ( = ?auto_51217 ?auto_51215 ) ) ( not ( = ?auto_51212 ?auto_51215 ) ) ( AVAILABLE ?auto_51215 ) ( SURFACE-AT ?auto_51219 ?auto_51214 ) ( ON ?auto_51219 ?auto_51216 ) ( CLEAR ?auto_51219 ) ( not ( = ?auto_51206 ?auto_51216 ) ) ( not ( = ?auto_51207 ?auto_51216 ) ) ( not ( = ?auto_51220 ?auto_51216 ) ) ( not ( = ?auto_51219 ?auto_51216 ) ) ( not ( = ?auto_51211 ?auto_51216 ) ) ( not ( = ?auto_51213 ?auto_51216 ) ) ( TRUCK-AT ?auto_51209 ?auto_51210 ) )
    :subtasks
    ( ( !DRIVE ?auto_51209 ?auto_51210 ?auto_51214 )
      ( MAKE-ON ?auto_51206 ?auto_51207 )
      ( MAKE-ON-VERIFY ?auto_51206 ?auto_51207 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51222 - SURFACE
      ?auto_51223 - SURFACE
    )
    :vars
    (
      ?auto_51234 - HOIST
      ?auto_51236 - PLACE
      ?auto_51226 - PLACE
      ?auto_51225 - HOIST
      ?auto_51228 - SURFACE
      ?auto_51233 - SURFACE
      ?auto_51235 - PLACE
      ?auto_51227 - HOIST
      ?auto_51230 - SURFACE
      ?auto_51229 - SURFACE
      ?auto_51232 - PLACE
      ?auto_51231 - HOIST
      ?auto_51224 - SURFACE
      ?auto_51237 - TRUCK
      ?auto_51238 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51234 ?auto_51236 ) ( IS-CRATE ?auto_51222 ) ( not ( = ?auto_51222 ?auto_51223 ) ) ( not ( = ?auto_51226 ?auto_51236 ) ) ( HOIST-AT ?auto_51225 ?auto_51226 ) ( not ( = ?auto_51234 ?auto_51225 ) ) ( AVAILABLE ?auto_51225 ) ( SURFACE-AT ?auto_51222 ?auto_51226 ) ( ON ?auto_51222 ?auto_51228 ) ( CLEAR ?auto_51222 ) ( not ( = ?auto_51222 ?auto_51228 ) ) ( not ( = ?auto_51223 ?auto_51228 ) ) ( IS-CRATE ?auto_51223 ) ( not ( = ?auto_51222 ?auto_51233 ) ) ( not ( = ?auto_51223 ?auto_51233 ) ) ( not ( = ?auto_51228 ?auto_51233 ) ) ( not ( = ?auto_51235 ?auto_51236 ) ) ( not ( = ?auto_51226 ?auto_51235 ) ) ( HOIST-AT ?auto_51227 ?auto_51235 ) ( not ( = ?auto_51234 ?auto_51227 ) ) ( not ( = ?auto_51225 ?auto_51227 ) ) ( AVAILABLE ?auto_51227 ) ( SURFACE-AT ?auto_51223 ?auto_51235 ) ( ON ?auto_51223 ?auto_51230 ) ( CLEAR ?auto_51223 ) ( not ( = ?auto_51222 ?auto_51230 ) ) ( not ( = ?auto_51223 ?auto_51230 ) ) ( not ( = ?auto_51228 ?auto_51230 ) ) ( not ( = ?auto_51233 ?auto_51230 ) ) ( IS-CRATE ?auto_51233 ) ( not ( = ?auto_51222 ?auto_51229 ) ) ( not ( = ?auto_51223 ?auto_51229 ) ) ( not ( = ?auto_51228 ?auto_51229 ) ) ( not ( = ?auto_51233 ?auto_51229 ) ) ( not ( = ?auto_51230 ?auto_51229 ) ) ( not ( = ?auto_51232 ?auto_51236 ) ) ( not ( = ?auto_51226 ?auto_51232 ) ) ( not ( = ?auto_51235 ?auto_51232 ) ) ( HOIST-AT ?auto_51231 ?auto_51232 ) ( not ( = ?auto_51234 ?auto_51231 ) ) ( not ( = ?auto_51225 ?auto_51231 ) ) ( not ( = ?auto_51227 ?auto_51231 ) ) ( AVAILABLE ?auto_51231 ) ( SURFACE-AT ?auto_51233 ?auto_51232 ) ( ON ?auto_51233 ?auto_51224 ) ( CLEAR ?auto_51233 ) ( not ( = ?auto_51222 ?auto_51224 ) ) ( not ( = ?auto_51223 ?auto_51224 ) ) ( not ( = ?auto_51228 ?auto_51224 ) ) ( not ( = ?auto_51233 ?auto_51224 ) ) ( not ( = ?auto_51230 ?auto_51224 ) ) ( not ( = ?auto_51229 ?auto_51224 ) ) ( TRUCK-AT ?auto_51237 ?auto_51236 ) ( SURFACE-AT ?auto_51238 ?auto_51236 ) ( CLEAR ?auto_51238 ) ( LIFTING ?auto_51234 ?auto_51229 ) ( IS-CRATE ?auto_51229 ) ( not ( = ?auto_51222 ?auto_51238 ) ) ( not ( = ?auto_51223 ?auto_51238 ) ) ( not ( = ?auto_51228 ?auto_51238 ) ) ( not ( = ?auto_51233 ?auto_51238 ) ) ( not ( = ?auto_51230 ?auto_51238 ) ) ( not ( = ?auto_51229 ?auto_51238 ) ) ( not ( = ?auto_51224 ?auto_51238 ) ) )
    :subtasks
    ( ( !DROP ?auto_51234 ?auto_51229 ?auto_51238 ?auto_51236 )
      ( MAKE-ON ?auto_51222 ?auto_51223 )
      ( MAKE-ON-VERIFY ?auto_51222 ?auto_51223 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51239 - SURFACE
      ?auto_51240 - SURFACE
    )
    :vars
    (
      ?auto_51251 - HOIST
      ?auto_51252 - PLACE
      ?auto_51247 - PLACE
      ?auto_51255 - HOIST
      ?auto_51250 - SURFACE
      ?auto_51249 - SURFACE
      ?auto_51244 - PLACE
      ?auto_51254 - HOIST
      ?auto_51242 - SURFACE
      ?auto_51241 - SURFACE
      ?auto_51243 - PLACE
      ?auto_51253 - HOIST
      ?auto_51248 - SURFACE
      ?auto_51245 - TRUCK
      ?auto_51246 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51251 ?auto_51252 ) ( IS-CRATE ?auto_51239 ) ( not ( = ?auto_51239 ?auto_51240 ) ) ( not ( = ?auto_51247 ?auto_51252 ) ) ( HOIST-AT ?auto_51255 ?auto_51247 ) ( not ( = ?auto_51251 ?auto_51255 ) ) ( AVAILABLE ?auto_51255 ) ( SURFACE-AT ?auto_51239 ?auto_51247 ) ( ON ?auto_51239 ?auto_51250 ) ( CLEAR ?auto_51239 ) ( not ( = ?auto_51239 ?auto_51250 ) ) ( not ( = ?auto_51240 ?auto_51250 ) ) ( IS-CRATE ?auto_51240 ) ( not ( = ?auto_51239 ?auto_51249 ) ) ( not ( = ?auto_51240 ?auto_51249 ) ) ( not ( = ?auto_51250 ?auto_51249 ) ) ( not ( = ?auto_51244 ?auto_51252 ) ) ( not ( = ?auto_51247 ?auto_51244 ) ) ( HOIST-AT ?auto_51254 ?auto_51244 ) ( not ( = ?auto_51251 ?auto_51254 ) ) ( not ( = ?auto_51255 ?auto_51254 ) ) ( AVAILABLE ?auto_51254 ) ( SURFACE-AT ?auto_51240 ?auto_51244 ) ( ON ?auto_51240 ?auto_51242 ) ( CLEAR ?auto_51240 ) ( not ( = ?auto_51239 ?auto_51242 ) ) ( not ( = ?auto_51240 ?auto_51242 ) ) ( not ( = ?auto_51250 ?auto_51242 ) ) ( not ( = ?auto_51249 ?auto_51242 ) ) ( IS-CRATE ?auto_51249 ) ( not ( = ?auto_51239 ?auto_51241 ) ) ( not ( = ?auto_51240 ?auto_51241 ) ) ( not ( = ?auto_51250 ?auto_51241 ) ) ( not ( = ?auto_51249 ?auto_51241 ) ) ( not ( = ?auto_51242 ?auto_51241 ) ) ( not ( = ?auto_51243 ?auto_51252 ) ) ( not ( = ?auto_51247 ?auto_51243 ) ) ( not ( = ?auto_51244 ?auto_51243 ) ) ( HOIST-AT ?auto_51253 ?auto_51243 ) ( not ( = ?auto_51251 ?auto_51253 ) ) ( not ( = ?auto_51255 ?auto_51253 ) ) ( not ( = ?auto_51254 ?auto_51253 ) ) ( AVAILABLE ?auto_51253 ) ( SURFACE-AT ?auto_51249 ?auto_51243 ) ( ON ?auto_51249 ?auto_51248 ) ( CLEAR ?auto_51249 ) ( not ( = ?auto_51239 ?auto_51248 ) ) ( not ( = ?auto_51240 ?auto_51248 ) ) ( not ( = ?auto_51250 ?auto_51248 ) ) ( not ( = ?auto_51249 ?auto_51248 ) ) ( not ( = ?auto_51242 ?auto_51248 ) ) ( not ( = ?auto_51241 ?auto_51248 ) ) ( TRUCK-AT ?auto_51245 ?auto_51252 ) ( SURFACE-AT ?auto_51246 ?auto_51252 ) ( CLEAR ?auto_51246 ) ( IS-CRATE ?auto_51241 ) ( not ( = ?auto_51239 ?auto_51246 ) ) ( not ( = ?auto_51240 ?auto_51246 ) ) ( not ( = ?auto_51250 ?auto_51246 ) ) ( not ( = ?auto_51249 ?auto_51246 ) ) ( not ( = ?auto_51242 ?auto_51246 ) ) ( not ( = ?auto_51241 ?auto_51246 ) ) ( not ( = ?auto_51248 ?auto_51246 ) ) ( AVAILABLE ?auto_51251 ) ( IN ?auto_51241 ?auto_51245 ) )
    :subtasks
    ( ( !UNLOAD ?auto_51251 ?auto_51241 ?auto_51245 ?auto_51252 )
      ( MAKE-ON ?auto_51239 ?auto_51240 )
      ( MAKE-ON-VERIFY ?auto_51239 ?auto_51240 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51256 - SURFACE
      ?auto_51257 - SURFACE
    )
    :vars
    (
      ?auto_51260 - HOIST
      ?auto_51263 - PLACE
      ?auto_51264 - PLACE
      ?auto_51258 - HOIST
      ?auto_51272 - SURFACE
      ?auto_51261 - SURFACE
      ?auto_51268 - PLACE
      ?auto_51265 - HOIST
      ?auto_51269 - SURFACE
      ?auto_51266 - SURFACE
      ?auto_51270 - PLACE
      ?auto_51259 - HOIST
      ?auto_51267 - SURFACE
      ?auto_51271 - SURFACE
      ?auto_51262 - TRUCK
      ?auto_51273 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51260 ?auto_51263 ) ( IS-CRATE ?auto_51256 ) ( not ( = ?auto_51256 ?auto_51257 ) ) ( not ( = ?auto_51264 ?auto_51263 ) ) ( HOIST-AT ?auto_51258 ?auto_51264 ) ( not ( = ?auto_51260 ?auto_51258 ) ) ( AVAILABLE ?auto_51258 ) ( SURFACE-AT ?auto_51256 ?auto_51264 ) ( ON ?auto_51256 ?auto_51272 ) ( CLEAR ?auto_51256 ) ( not ( = ?auto_51256 ?auto_51272 ) ) ( not ( = ?auto_51257 ?auto_51272 ) ) ( IS-CRATE ?auto_51257 ) ( not ( = ?auto_51256 ?auto_51261 ) ) ( not ( = ?auto_51257 ?auto_51261 ) ) ( not ( = ?auto_51272 ?auto_51261 ) ) ( not ( = ?auto_51268 ?auto_51263 ) ) ( not ( = ?auto_51264 ?auto_51268 ) ) ( HOIST-AT ?auto_51265 ?auto_51268 ) ( not ( = ?auto_51260 ?auto_51265 ) ) ( not ( = ?auto_51258 ?auto_51265 ) ) ( AVAILABLE ?auto_51265 ) ( SURFACE-AT ?auto_51257 ?auto_51268 ) ( ON ?auto_51257 ?auto_51269 ) ( CLEAR ?auto_51257 ) ( not ( = ?auto_51256 ?auto_51269 ) ) ( not ( = ?auto_51257 ?auto_51269 ) ) ( not ( = ?auto_51272 ?auto_51269 ) ) ( not ( = ?auto_51261 ?auto_51269 ) ) ( IS-CRATE ?auto_51261 ) ( not ( = ?auto_51256 ?auto_51266 ) ) ( not ( = ?auto_51257 ?auto_51266 ) ) ( not ( = ?auto_51272 ?auto_51266 ) ) ( not ( = ?auto_51261 ?auto_51266 ) ) ( not ( = ?auto_51269 ?auto_51266 ) ) ( not ( = ?auto_51270 ?auto_51263 ) ) ( not ( = ?auto_51264 ?auto_51270 ) ) ( not ( = ?auto_51268 ?auto_51270 ) ) ( HOIST-AT ?auto_51259 ?auto_51270 ) ( not ( = ?auto_51260 ?auto_51259 ) ) ( not ( = ?auto_51258 ?auto_51259 ) ) ( not ( = ?auto_51265 ?auto_51259 ) ) ( AVAILABLE ?auto_51259 ) ( SURFACE-AT ?auto_51261 ?auto_51270 ) ( ON ?auto_51261 ?auto_51267 ) ( CLEAR ?auto_51261 ) ( not ( = ?auto_51256 ?auto_51267 ) ) ( not ( = ?auto_51257 ?auto_51267 ) ) ( not ( = ?auto_51272 ?auto_51267 ) ) ( not ( = ?auto_51261 ?auto_51267 ) ) ( not ( = ?auto_51269 ?auto_51267 ) ) ( not ( = ?auto_51266 ?auto_51267 ) ) ( SURFACE-AT ?auto_51271 ?auto_51263 ) ( CLEAR ?auto_51271 ) ( IS-CRATE ?auto_51266 ) ( not ( = ?auto_51256 ?auto_51271 ) ) ( not ( = ?auto_51257 ?auto_51271 ) ) ( not ( = ?auto_51272 ?auto_51271 ) ) ( not ( = ?auto_51261 ?auto_51271 ) ) ( not ( = ?auto_51269 ?auto_51271 ) ) ( not ( = ?auto_51266 ?auto_51271 ) ) ( not ( = ?auto_51267 ?auto_51271 ) ) ( AVAILABLE ?auto_51260 ) ( IN ?auto_51266 ?auto_51262 ) ( TRUCK-AT ?auto_51262 ?auto_51273 ) ( not ( = ?auto_51273 ?auto_51263 ) ) ( not ( = ?auto_51264 ?auto_51273 ) ) ( not ( = ?auto_51268 ?auto_51273 ) ) ( not ( = ?auto_51270 ?auto_51273 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_51262 ?auto_51273 ?auto_51263 )
      ( MAKE-ON ?auto_51256 ?auto_51257 )
      ( MAKE-ON-VERIFY ?auto_51256 ?auto_51257 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51274 - SURFACE
      ?auto_51275 - SURFACE
    )
    :vars
    (
      ?auto_51281 - HOIST
      ?auto_51277 - PLACE
      ?auto_51288 - PLACE
      ?auto_51284 - HOIST
      ?auto_51290 - SURFACE
      ?auto_51283 - SURFACE
      ?auto_51282 - PLACE
      ?auto_51289 - HOIST
      ?auto_51286 - SURFACE
      ?auto_51279 - SURFACE
      ?auto_51276 - PLACE
      ?auto_51278 - HOIST
      ?auto_51285 - SURFACE
      ?auto_51291 - SURFACE
      ?auto_51287 - TRUCK
      ?auto_51280 - PLACE
      ?auto_51292 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_51281 ?auto_51277 ) ( IS-CRATE ?auto_51274 ) ( not ( = ?auto_51274 ?auto_51275 ) ) ( not ( = ?auto_51288 ?auto_51277 ) ) ( HOIST-AT ?auto_51284 ?auto_51288 ) ( not ( = ?auto_51281 ?auto_51284 ) ) ( AVAILABLE ?auto_51284 ) ( SURFACE-AT ?auto_51274 ?auto_51288 ) ( ON ?auto_51274 ?auto_51290 ) ( CLEAR ?auto_51274 ) ( not ( = ?auto_51274 ?auto_51290 ) ) ( not ( = ?auto_51275 ?auto_51290 ) ) ( IS-CRATE ?auto_51275 ) ( not ( = ?auto_51274 ?auto_51283 ) ) ( not ( = ?auto_51275 ?auto_51283 ) ) ( not ( = ?auto_51290 ?auto_51283 ) ) ( not ( = ?auto_51282 ?auto_51277 ) ) ( not ( = ?auto_51288 ?auto_51282 ) ) ( HOIST-AT ?auto_51289 ?auto_51282 ) ( not ( = ?auto_51281 ?auto_51289 ) ) ( not ( = ?auto_51284 ?auto_51289 ) ) ( AVAILABLE ?auto_51289 ) ( SURFACE-AT ?auto_51275 ?auto_51282 ) ( ON ?auto_51275 ?auto_51286 ) ( CLEAR ?auto_51275 ) ( not ( = ?auto_51274 ?auto_51286 ) ) ( not ( = ?auto_51275 ?auto_51286 ) ) ( not ( = ?auto_51290 ?auto_51286 ) ) ( not ( = ?auto_51283 ?auto_51286 ) ) ( IS-CRATE ?auto_51283 ) ( not ( = ?auto_51274 ?auto_51279 ) ) ( not ( = ?auto_51275 ?auto_51279 ) ) ( not ( = ?auto_51290 ?auto_51279 ) ) ( not ( = ?auto_51283 ?auto_51279 ) ) ( not ( = ?auto_51286 ?auto_51279 ) ) ( not ( = ?auto_51276 ?auto_51277 ) ) ( not ( = ?auto_51288 ?auto_51276 ) ) ( not ( = ?auto_51282 ?auto_51276 ) ) ( HOIST-AT ?auto_51278 ?auto_51276 ) ( not ( = ?auto_51281 ?auto_51278 ) ) ( not ( = ?auto_51284 ?auto_51278 ) ) ( not ( = ?auto_51289 ?auto_51278 ) ) ( AVAILABLE ?auto_51278 ) ( SURFACE-AT ?auto_51283 ?auto_51276 ) ( ON ?auto_51283 ?auto_51285 ) ( CLEAR ?auto_51283 ) ( not ( = ?auto_51274 ?auto_51285 ) ) ( not ( = ?auto_51275 ?auto_51285 ) ) ( not ( = ?auto_51290 ?auto_51285 ) ) ( not ( = ?auto_51283 ?auto_51285 ) ) ( not ( = ?auto_51286 ?auto_51285 ) ) ( not ( = ?auto_51279 ?auto_51285 ) ) ( SURFACE-AT ?auto_51291 ?auto_51277 ) ( CLEAR ?auto_51291 ) ( IS-CRATE ?auto_51279 ) ( not ( = ?auto_51274 ?auto_51291 ) ) ( not ( = ?auto_51275 ?auto_51291 ) ) ( not ( = ?auto_51290 ?auto_51291 ) ) ( not ( = ?auto_51283 ?auto_51291 ) ) ( not ( = ?auto_51286 ?auto_51291 ) ) ( not ( = ?auto_51279 ?auto_51291 ) ) ( not ( = ?auto_51285 ?auto_51291 ) ) ( AVAILABLE ?auto_51281 ) ( TRUCK-AT ?auto_51287 ?auto_51280 ) ( not ( = ?auto_51280 ?auto_51277 ) ) ( not ( = ?auto_51288 ?auto_51280 ) ) ( not ( = ?auto_51282 ?auto_51280 ) ) ( not ( = ?auto_51276 ?auto_51280 ) ) ( HOIST-AT ?auto_51292 ?auto_51280 ) ( LIFTING ?auto_51292 ?auto_51279 ) ( not ( = ?auto_51281 ?auto_51292 ) ) ( not ( = ?auto_51284 ?auto_51292 ) ) ( not ( = ?auto_51289 ?auto_51292 ) ) ( not ( = ?auto_51278 ?auto_51292 ) ) )
    :subtasks
    ( ( !LOAD ?auto_51292 ?auto_51279 ?auto_51287 ?auto_51280 )
      ( MAKE-ON ?auto_51274 ?auto_51275 )
      ( MAKE-ON-VERIFY ?auto_51274 ?auto_51275 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51293 - SURFACE
      ?auto_51294 - SURFACE
    )
    :vars
    (
      ?auto_51295 - HOIST
      ?auto_51309 - PLACE
      ?auto_51301 - PLACE
      ?auto_51302 - HOIST
      ?auto_51311 - SURFACE
      ?auto_51310 - SURFACE
      ?auto_51296 - PLACE
      ?auto_51297 - HOIST
      ?auto_51303 - SURFACE
      ?auto_51307 - SURFACE
      ?auto_51304 - PLACE
      ?auto_51299 - HOIST
      ?auto_51308 - SURFACE
      ?auto_51305 - SURFACE
      ?auto_51300 - TRUCK
      ?auto_51298 - PLACE
      ?auto_51306 - HOIST
      ?auto_51312 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51295 ?auto_51309 ) ( IS-CRATE ?auto_51293 ) ( not ( = ?auto_51293 ?auto_51294 ) ) ( not ( = ?auto_51301 ?auto_51309 ) ) ( HOIST-AT ?auto_51302 ?auto_51301 ) ( not ( = ?auto_51295 ?auto_51302 ) ) ( AVAILABLE ?auto_51302 ) ( SURFACE-AT ?auto_51293 ?auto_51301 ) ( ON ?auto_51293 ?auto_51311 ) ( CLEAR ?auto_51293 ) ( not ( = ?auto_51293 ?auto_51311 ) ) ( not ( = ?auto_51294 ?auto_51311 ) ) ( IS-CRATE ?auto_51294 ) ( not ( = ?auto_51293 ?auto_51310 ) ) ( not ( = ?auto_51294 ?auto_51310 ) ) ( not ( = ?auto_51311 ?auto_51310 ) ) ( not ( = ?auto_51296 ?auto_51309 ) ) ( not ( = ?auto_51301 ?auto_51296 ) ) ( HOIST-AT ?auto_51297 ?auto_51296 ) ( not ( = ?auto_51295 ?auto_51297 ) ) ( not ( = ?auto_51302 ?auto_51297 ) ) ( AVAILABLE ?auto_51297 ) ( SURFACE-AT ?auto_51294 ?auto_51296 ) ( ON ?auto_51294 ?auto_51303 ) ( CLEAR ?auto_51294 ) ( not ( = ?auto_51293 ?auto_51303 ) ) ( not ( = ?auto_51294 ?auto_51303 ) ) ( not ( = ?auto_51311 ?auto_51303 ) ) ( not ( = ?auto_51310 ?auto_51303 ) ) ( IS-CRATE ?auto_51310 ) ( not ( = ?auto_51293 ?auto_51307 ) ) ( not ( = ?auto_51294 ?auto_51307 ) ) ( not ( = ?auto_51311 ?auto_51307 ) ) ( not ( = ?auto_51310 ?auto_51307 ) ) ( not ( = ?auto_51303 ?auto_51307 ) ) ( not ( = ?auto_51304 ?auto_51309 ) ) ( not ( = ?auto_51301 ?auto_51304 ) ) ( not ( = ?auto_51296 ?auto_51304 ) ) ( HOIST-AT ?auto_51299 ?auto_51304 ) ( not ( = ?auto_51295 ?auto_51299 ) ) ( not ( = ?auto_51302 ?auto_51299 ) ) ( not ( = ?auto_51297 ?auto_51299 ) ) ( AVAILABLE ?auto_51299 ) ( SURFACE-AT ?auto_51310 ?auto_51304 ) ( ON ?auto_51310 ?auto_51308 ) ( CLEAR ?auto_51310 ) ( not ( = ?auto_51293 ?auto_51308 ) ) ( not ( = ?auto_51294 ?auto_51308 ) ) ( not ( = ?auto_51311 ?auto_51308 ) ) ( not ( = ?auto_51310 ?auto_51308 ) ) ( not ( = ?auto_51303 ?auto_51308 ) ) ( not ( = ?auto_51307 ?auto_51308 ) ) ( SURFACE-AT ?auto_51305 ?auto_51309 ) ( CLEAR ?auto_51305 ) ( IS-CRATE ?auto_51307 ) ( not ( = ?auto_51293 ?auto_51305 ) ) ( not ( = ?auto_51294 ?auto_51305 ) ) ( not ( = ?auto_51311 ?auto_51305 ) ) ( not ( = ?auto_51310 ?auto_51305 ) ) ( not ( = ?auto_51303 ?auto_51305 ) ) ( not ( = ?auto_51307 ?auto_51305 ) ) ( not ( = ?auto_51308 ?auto_51305 ) ) ( AVAILABLE ?auto_51295 ) ( TRUCK-AT ?auto_51300 ?auto_51298 ) ( not ( = ?auto_51298 ?auto_51309 ) ) ( not ( = ?auto_51301 ?auto_51298 ) ) ( not ( = ?auto_51296 ?auto_51298 ) ) ( not ( = ?auto_51304 ?auto_51298 ) ) ( HOIST-AT ?auto_51306 ?auto_51298 ) ( not ( = ?auto_51295 ?auto_51306 ) ) ( not ( = ?auto_51302 ?auto_51306 ) ) ( not ( = ?auto_51297 ?auto_51306 ) ) ( not ( = ?auto_51299 ?auto_51306 ) ) ( AVAILABLE ?auto_51306 ) ( SURFACE-AT ?auto_51307 ?auto_51298 ) ( ON ?auto_51307 ?auto_51312 ) ( CLEAR ?auto_51307 ) ( not ( = ?auto_51293 ?auto_51312 ) ) ( not ( = ?auto_51294 ?auto_51312 ) ) ( not ( = ?auto_51311 ?auto_51312 ) ) ( not ( = ?auto_51310 ?auto_51312 ) ) ( not ( = ?auto_51303 ?auto_51312 ) ) ( not ( = ?auto_51307 ?auto_51312 ) ) ( not ( = ?auto_51308 ?auto_51312 ) ) ( not ( = ?auto_51305 ?auto_51312 ) ) )
    :subtasks
    ( ( !LIFT ?auto_51306 ?auto_51307 ?auto_51312 ?auto_51298 )
      ( MAKE-ON ?auto_51293 ?auto_51294 )
      ( MAKE-ON-VERIFY ?auto_51293 ?auto_51294 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51313 - SURFACE
      ?auto_51314 - SURFACE
    )
    :vars
    (
      ?auto_51318 - HOIST
      ?auto_51323 - PLACE
      ?auto_51332 - PLACE
      ?auto_51327 - HOIST
      ?auto_51321 - SURFACE
      ?auto_51322 - SURFACE
      ?auto_51319 - PLACE
      ?auto_51324 - HOIST
      ?auto_51325 - SURFACE
      ?auto_51317 - SURFACE
      ?auto_51315 - PLACE
      ?auto_51330 - HOIST
      ?auto_51320 - SURFACE
      ?auto_51316 - SURFACE
      ?auto_51329 - PLACE
      ?auto_51331 - HOIST
      ?auto_51328 - SURFACE
      ?auto_51326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51318 ?auto_51323 ) ( IS-CRATE ?auto_51313 ) ( not ( = ?auto_51313 ?auto_51314 ) ) ( not ( = ?auto_51332 ?auto_51323 ) ) ( HOIST-AT ?auto_51327 ?auto_51332 ) ( not ( = ?auto_51318 ?auto_51327 ) ) ( AVAILABLE ?auto_51327 ) ( SURFACE-AT ?auto_51313 ?auto_51332 ) ( ON ?auto_51313 ?auto_51321 ) ( CLEAR ?auto_51313 ) ( not ( = ?auto_51313 ?auto_51321 ) ) ( not ( = ?auto_51314 ?auto_51321 ) ) ( IS-CRATE ?auto_51314 ) ( not ( = ?auto_51313 ?auto_51322 ) ) ( not ( = ?auto_51314 ?auto_51322 ) ) ( not ( = ?auto_51321 ?auto_51322 ) ) ( not ( = ?auto_51319 ?auto_51323 ) ) ( not ( = ?auto_51332 ?auto_51319 ) ) ( HOIST-AT ?auto_51324 ?auto_51319 ) ( not ( = ?auto_51318 ?auto_51324 ) ) ( not ( = ?auto_51327 ?auto_51324 ) ) ( AVAILABLE ?auto_51324 ) ( SURFACE-AT ?auto_51314 ?auto_51319 ) ( ON ?auto_51314 ?auto_51325 ) ( CLEAR ?auto_51314 ) ( not ( = ?auto_51313 ?auto_51325 ) ) ( not ( = ?auto_51314 ?auto_51325 ) ) ( not ( = ?auto_51321 ?auto_51325 ) ) ( not ( = ?auto_51322 ?auto_51325 ) ) ( IS-CRATE ?auto_51322 ) ( not ( = ?auto_51313 ?auto_51317 ) ) ( not ( = ?auto_51314 ?auto_51317 ) ) ( not ( = ?auto_51321 ?auto_51317 ) ) ( not ( = ?auto_51322 ?auto_51317 ) ) ( not ( = ?auto_51325 ?auto_51317 ) ) ( not ( = ?auto_51315 ?auto_51323 ) ) ( not ( = ?auto_51332 ?auto_51315 ) ) ( not ( = ?auto_51319 ?auto_51315 ) ) ( HOIST-AT ?auto_51330 ?auto_51315 ) ( not ( = ?auto_51318 ?auto_51330 ) ) ( not ( = ?auto_51327 ?auto_51330 ) ) ( not ( = ?auto_51324 ?auto_51330 ) ) ( AVAILABLE ?auto_51330 ) ( SURFACE-AT ?auto_51322 ?auto_51315 ) ( ON ?auto_51322 ?auto_51320 ) ( CLEAR ?auto_51322 ) ( not ( = ?auto_51313 ?auto_51320 ) ) ( not ( = ?auto_51314 ?auto_51320 ) ) ( not ( = ?auto_51321 ?auto_51320 ) ) ( not ( = ?auto_51322 ?auto_51320 ) ) ( not ( = ?auto_51325 ?auto_51320 ) ) ( not ( = ?auto_51317 ?auto_51320 ) ) ( SURFACE-AT ?auto_51316 ?auto_51323 ) ( CLEAR ?auto_51316 ) ( IS-CRATE ?auto_51317 ) ( not ( = ?auto_51313 ?auto_51316 ) ) ( not ( = ?auto_51314 ?auto_51316 ) ) ( not ( = ?auto_51321 ?auto_51316 ) ) ( not ( = ?auto_51322 ?auto_51316 ) ) ( not ( = ?auto_51325 ?auto_51316 ) ) ( not ( = ?auto_51317 ?auto_51316 ) ) ( not ( = ?auto_51320 ?auto_51316 ) ) ( AVAILABLE ?auto_51318 ) ( not ( = ?auto_51329 ?auto_51323 ) ) ( not ( = ?auto_51332 ?auto_51329 ) ) ( not ( = ?auto_51319 ?auto_51329 ) ) ( not ( = ?auto_51315 ?auto_51329 ) ) ( HOIST-AT ?auto_51331 ?auto_51329 ) ( not ( = ?auto_51318 ?auto_51331 ) ) ( not ( = ?auto_51327 ?auto_51331 ) ) ( not ( = ?auto_51324 ?auto_51331 ) ) ( not ( = ?auto_51330 ?auto_51331 ) ) ( AVAILABLE ?auto_51331 ) ( SURFACE-AT ?auto_51317 ?auto_51329 ) ( ON ?auto_51317 ?auto_51328 ) ( CLEAR ?auto_51317 ) ( not ( = ?auto_51313 ?auto_51328 ) ) ( not ( = ?auto_51314 ?auto_51328 ) ) ( not ( = ?auto_51321 ?auto_51328 ) ) ( not ( = ?auto_51322 ?auto_51328 ) ) ( not ( = ?auto_51325 ?auto_51328 ) ) ( not ( = ?auto_51317 ?auto_51328 ) ) ( not ( = ?auto_51320 ?auto_51328 ) ) ( not ( = ?auto_51316 ?auto_51328 ) ) ( TRUCK-AT ?auto_51326 ?auto_51323 ) )
    :subtasks
    ( ( !DRIVE ?auto_51326 ?auto_51323 ?auto_51329 )
      ( MAKE-ON ?auto_51313 ?auto_51314 )
      ( MAKE-ON-VERIFY ?auto_51313 ?auto_51314 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51333 - SURFACE
      ?auto_51334 - SURFACE
    )
    :vars
    (
      ?auto_51336 - HOIST
      ?auto_51338 - PLACE
      ?auto_51335 - PLACE
      ?auto_51337 - HOIST
      ?auto_51344 - SURFACE
      ?auto_51348 - SURFACE
      ?auto_51343 - PLACE
      ?auto_51349 - HOIST
      ?auto_51350 - SURFACE
      ?auto_51339 - SURFACE
      ?auto_51352 - PLACE
      ?auto_51351 - HOIST
      ?auto_51341 - SURFACE
      ?auto_51342 - SURFACE
      ?auto_51347 - PLACE
      ?auto_51340 - HOIST
      ?auto_51345 - SURFACE
      ?auto_51346 - TRUCK
      ?auto_51353 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51336 ?auto_51338 ) ( IS-CRATE ?auto_51333 ) ( not ( = ?auto_51333 ?auto_51334 ) ) ( not ( = ?auto_51335 ?auto_51338 ) ) ( HOIST-AT ?auto_51337 ?auto_51335 ) ( not ( = ?auto_51336 ?auto_51337 ) ) ( AVAILABLE ?auto_51337 ) ( SURFACE-AT ?auto_51333 ?auto_51335 ) ( ON ?auto_51333 ?auto_51344 ) ( CLEAR ?auto_51333 ) ( not ( = ?auto_51333 ?auto_51344 ) ) ( not ( = ?auto_51334 ?auto_51344 ) ) ( IS-CRATE ?auto_51334 ) ( not ( = ?auto_51333 ?auto_51348 ) ) ( not ( = ?auto_51334 ?auto_51348 ) ) ( not ( = ?auto_51344 ?auto_51348 ) ) ( not ( = ?auto_51343 ?auto_51338 ) ) ( not ( = ?auto_51335 ?auto_51343 ) ) ( HOIST-AT ?auto_51349 ?auto_51343 ) ( not ( = ?auto_51336 ?auto_51349 ) ) ( not ( = ?auto_51337 ?auto_51349 ) ) ( AVAILABLE ?auto_51349 ) ( SURFACE-AT ?auto_51334 ?auto_51343 ) ( ON ?auto_51334 ?auto_51350 ) ( CLEAR ?auto_51334 ) ( not ( = ?auto_51333 ?auto_51350 ) ) ( not ( = ?auto_51334 ?auto_51350 ) ) ( not ( = ?auto_51344 ?auto_51350 ) ) ( not ( = ?auto_51348 ?auto_51350 ) ) ( IS-CRATE ?auto_51348 ) ( not ( = ?auto_51333 ?auto_51339 ) ) ( not ( = ?auto_51334 ?auto_51339 ) ) ( not ( = ?auto_51344 ?auto_51339 ) ) ( not ( = ?auto_51348 ?auto_51339 ) ) ( not ( = ?auto_51350 ?auto_51339 ) ) ( not ( = ?auto_51352 ?auto_51338 ) ) ( not ( = ?auto_51335 ?auto_51352 ) ) ( not ( = ?auto_51343 ?auto_51352 ) ) ( HOIST-AT ?auto_51351 ?auto_51352 ) ( not ( = ?auto_51336 ?auto_51351 ) ) ( not ( = ?auto_51337 ?auto_51351 ) ) ( not ( = ?auto_51349 ?auto_51351 ) ) ( AVAILABLE ?auto_51351 ) ( SURFACE-AT ?auto_51348 ?auto_51352 ) ( ON ?auto_51348 ?auto_51341 ) ( CLEAR ?auto_51348 ) ( not ( = ?auto_51333 ?auto_51341 ) ) ( not ( = ?auto_51334 ?auto_51341 ) ) ( not ( = ?auto_51344 ?auto_51341 ) ) ( not ( = ?auto_51348 ?auto_51341 ) ) ( not ( = ?auto_51350 ?auto_51341 ) ) ( not ( = ?auto_51339 ?auto_51341 ) ) ( IS-CRATE ?auto_51339 ) ( not ( = ?auto_51333 ?auto_51342 ) ) ( not ( = ?auto_51334 ?auto_51342 ) ) ( not ( = ?auto_51344 ?auto_51342 ) ) ( not ( = ?auto_51348 ?auto_51342 ) ) ( not ( = ?auto_51350 ?auto_51342 ) ) ( not ( = ?auto_51339 ?auto_51342 ) ) ( not ( = ?auto_51341 ?auto_51342 ) ) ( not ( = ?auto_51347 ?auto_51338 ) ) ( not ( = ?auto_51335 ?auto_51347 ) ) ( not ( = ?auto_51343 ?auto_51347 ) ) ( not ( = ?auto_51352 ?auto_51347 ) ) ( HOIST-AT ?auto_51340 ?auto_51347 ) ( not ( = ?auto_51336 ?auto_51340 ) ) ( not ( = ?auto_51337 ?auto_51340 ) ) ( not ( = ?auto_51349 ?auto_51340 ) ) ( not ( = ?auto_51351 ?auto_51340 ) ) ( AVAILABLE ?auto_51340 ) ( SURFACE-AT ?auto_51339 ?auto_51347 ) ( ON ?auto_51339 ?auto_51345 ) ( CLEAR ?auto_51339 ) ( not ( = ?auto_51333 ?auto_51345 ) ) ( not ( = ?auto_51334 ?auto_51345 ) ) ( not ( = ?auto_51344 ?auto_51345 ) ) ( not ( = ?auto_51348 ?auto_51345 ) ) ( not ( = ?auto_51350 ?auto_51345 ) ) ( not ( = ?auto_51339 ?auto_51345 ) ) ( not ( = ?auto_51341 ?auto_51345 ) ) ( not ( = ?auto_51342 ?auto_51345 ) ) ( TRUCK-AT ?auto_51346 ?auto_51338 ) ( SURFACE-AT ?auto_51353 ?auto_51338 ) ( CLEAR ?auto_51353 ) ( LIFTING ?auto_51336 ?auto_51342 ) ( IS-CRATE ?auto_51342 ) ( not ( = ?auto_51333 ?auto_51353 ) ) ( not ( = ?auto_51334 ?auto_51353 ) ) ( not ( = ?auto_51344 ?auto_51353 ) ) ( not ( = ?auto_51348 ?auto_51353 ) ) ( not ( = ?auto_51350 ?auto_51353 ) ) ( not ( = ?auto_51339 ?auto_51353 ) ) ( not ( = ?auto_51341 ?auto_51353 ) ) ( not ( = ?auto_51342 ?auto_51353 ) ) ( not ( = ?auto_51345 ?auto_51353 ) ) )
    :subtasks
    ( ( !DROP ?auto_51336 ?auto_51342 ?auto_51353 ?auto_51338 )
      ( MAKE-ON ?auto_51333 ?auto_51334 )
      ( MAKE-ON-VERIFY ?auto_51333 ?auto_51334 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51354 - SURFACE
      ?auto_51355 - SURFACE
    )
    :vars
    (
      ?auto_51372 - HOIST
      ?auto_51361 - PLACE
      ?auto_51363 - PLACE
      ?auto_51368 - HOIST
      ?auto_51366 - SURFACE
      ?auto_51374 - SURFACE
      ?auto_51370 - PLACE
      ?auto_51365 - HOIST
      ?auto_51371 - SURFACE
      ?auto_51364 - SURFACE
      ?auto_51357 - PLACE
      ?auto_51358 - HOIST
      ?auto_51356 - SURFACE
      ?auto_51360 - SURFACE
      ?auto_51367 - PLACE
      ?auto_51369 - HOIST
      ?auto_51373 - SURFACE
      ?auto_51359 - TRUCK
      ?auto_51362 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51372 ?auto_51361 ) ( IS-CRATE ?auto_51354 ) ( not ( = ?auto_51354 ?auto_51355 ) ) ( not ( = ?auto_51363 ?auto_51361 ) ) ( HOIST-AT ?auto_51368 ?auto_51363 ) ( not ( = ?auto_51372 ?auto_51368 ) ) ( AVAILABLE ?auto_51368 ) ( SURFACE-AT ?auto_51354 ?auto_51363 ) ( ON ?auto_51354 ?auto_51366 ) ( CLEAR ?auto_51354 ) ( not ( = ?auto_51354 ?auto_51366 ) ) ( not ( = ?auto_51355 ?auto_51366 ) ) ( IS-CRATE ?auto_51355 ) ( not ( = ?auto_51354 ?auto_51374 ) ) ( not ( = ?auto_51355 ?auto_51374 ) ) ( not ( = ?auto_51366 ?auto_51374 ) ) ( not ( = ?auto_51370 ?auto_51361 ) ) ( not ( = ?auto_51363 ?auto_51370 ) ) ( HOIST-AT ?auto_51365 ?auto_51370 ) ( not ( = ?auto_51372 ?auto_51365 ) ) ( not ( = ?auto_51368 ?auto_51365 ) ) ( AVAILABLE ?auto_51365 ) ( SURFACE-AT ?auto_51355 ?auto_51370 ) ( ON ?auto_51355 ?auto_51371 ) ( CLEAR ?auto_51355 ) ( not ( = ?auto_51354 ?auto_51371 ) ) ( not ( = ?auto_51355 ?auto_51371 ) ) ( not ( = ?auto_51366 ?auto_51371 ) ) ( not ( = ?auto_51374 ?auto_51371 ) ) ( IS-CRATE ?auto_51374 ) ( not ( = ?auto_51354 ?auto_51364 ) ) ( not ( = ?auto_51355 ?auto_51364 ) ) ( not ( = ?auto_51366 ?auto_51364 ) ) ( not ( = ?auto_51374 ?auto_51364 ) ) ( not ( = ?auto_51371 ?auto_51364 ) ) ( not ( = ?auto_51357 ?auto_51361 ) ) ( not ( = ?auto_51363 ?auto_51357 ) ) ( not ( = ?auto_51370 ?auto_51357 ) ) ( HOIST-AT ?auto_51358 ?auto_51357 ) ( not ( = ?auto_51372 ?auto_51358 ) ) ( not ( = ?auto_51368 ?auto_51358 ) ) ( not ( = ?auto_51365 ?auto_51358 ) ) ( AVAILABLE ?auto_51358 ) ( SURFACE-AT ?auto_51374 ?auto_51357 ) ( ON ?auto_51374 ?auto_51356 ) ( CLEAR ?auto_51374 ) ( not ( = ?auto_51354 ?auto_51356 ) ) ( not ( = ?auto_51355 ?auto_51356 ) ) ( not ( = ?auto_51366 ?auto_51356 ) ) ( not ( = ?auto_51374 ?auto_51356 ) ) ( not ( = ?auto_51371 ?auto_51356 ) ) ( not ( = ?auto_51364 ?auto_51356 ) ) ( IS-CRATE ?auto_51364 ) ( not ( = ?auto_51354 ?auto_51360 ) ) ( not ( = ?auto_51355 ?auto_51360 ) ) ( not ( = ?auto_51366 ?auto_51360 ) ) ( not ( = ?auto_51374 ?auto_51360 ) ) ( not ( = ?auto_51371 ?auto_51360 ) ) ( not ( = ?auto_51364 ?auto_51360 ) ) ( not ( = ?auto_51356 ?auto_51360 ) ) ( not ( = ?auto_51367 ?auto_51361 ) ) ( not ( = ?auto_51363 ?auto_51367 ) ) ( not ( = ?auto_51370 ?auto_51367 ) ) ( not ( = ?auto_51357 ?auto_51367 ) ) ( HOIST-AT ?auto_51369 ?auto_51367 ) ( not ( = ?auto_51372 ?auto_51369 ) ) ( not ( = ?auto_51368 ?auto_51369 ) ) ( not ( = ?auto_51365 ?auto_51369 ) ) ( not ( = ?auto_51358 ?auto_51369 ) ) ( AVAILABLE ?auto_51369 ) ( SURFACE-AT ?auto_51364 ?auto_51367 ) ( ON ?auto_51364 ?auto_51373 ) ( CLEAR ?auto_51364 ) ( not ( = ?auto_51354 ?auto_51373 ) ) ( not ( = ?auto_51355 ?auto_51373 ) ) ( not ( = ?auto_51366 ?auto_51373 ) ) ( not ( = ?auto_51374 ?auto_51373 ) ) ( not ( = ?auto_51371 ?auto_51373 ) ) ( not ( = ?auto_51364 ?auto_51373 ) ) ( not ( = ?auto_51356 ?auto_51373 ) ) ( not ( = ?auto_51360 ?auto_51373 ) ) ( TRUCK-AT ?auto_51359 ?auto_51361 ) ( SURFACE-AT ?auto_51362 ?auto_51361 ) ( CLEAR ?auto_51362 ) ( IS-CRATE ?auto_51360 ) ( not ( = ?auto_51354 ?auto_51362 ) ) ( not ( = ?auto_51355 ?auto_51362 ) ) ( not ( = ?auto_51366 ?auto_51362 ) ) ( not ( = ?auto_51374 ?auto_51362 ) ) ( not ( = ?auto_51371 ?auto_51362 ) ) ( not ( = ?auto_51364 ?auto_51362 ) ) ( not ( = ?auto_51356 ?auto_51362 ) ) ( not ( = ?auto_51360 ?auto_51362 ) ) ( not ( = ?auto_51373 ?auto_51362 ) ) ( AVAILABLE ?auto_51372 ) ( IN ?auto_51360 ?auto_51359 ) )
    :subtasks
    ( ( !UNLOAD ?auto_51372 ?auto_51360 ?auto_51359 ?auto_51361 )
      ( MAKE-ON ?auto_51354 ?auto_51355 )
      ( MAKE-ON-VERIFY ?auto_51354 ?auto_51355 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51375 - SURFACE
      ?auto_51376 - SURFACE
    )
    :vars
    (
      ?auto_51394 - HOIST
      ?auto_51381 - PLACE
      ?auto_51377 - PLACE
      ?auto_51379 - HOIST
      ?auto_51382 - SURFACE
      ?auto_51380 - SURFACE
      ?auto_51393 - PLACE
      ?auto_51384 - HOIST
      ?auto_51390 - SURFACE
      ?auto_51389 - SURFACE
      ?auto_51387 - PLACE
      ?auto_51378 - HOIST
      ?auto_51385 - SURFACE
      ?auto_51392 - SURFACE
      ?auto_51395 - PLACE
      ?auto_51388 - HOIST
      ?auto_51386 - SURFACE
      ?auto_51383 - SURFACE
      ?auto_51391 - TRUCK
      ?auto_51396 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51394 ?auto_51381 ) ( IS-CRATE ?auto_51375 ) ( not ( = ?auto_51375 ?auto_51376 ) ) ( not ( = ?auto_51377 ?auto_51381 ) ) ( HOIST-AT ?auto_51379 ?auto_51377 ) ( not ( = ?auto_51394 ?auto_51379 ) ) ( AVAILABLE ?auto_51379 ) ( SURFACE-AT ?auto_51375 ?auto_51377 ) ( ON ?auto_51375 ?auto_51382 ) ( CLEAR ?auto_51375 ) ( not ( = ?auto_51375 ?auto_51382 ) ) ( not ( = ?auto_51376 ?auto_51382 ) ) ( IS-CRATE ?auto_51376 ) ( not ( = ?auto_51375 ?auto_51380 ) ) ( not ( = ?auto_51376 ?auto_51380 ) ) ( not ( = ?auto_51382 ?auto_51380 ) ) ( not ( = ?auto_51393 ?auto_51381 ) ) ( not ( = ?auto_51377 ?auto_51393 ) ) ( HOIST-AT ?auto_51384 ?auto_51393 ) ( not ( = ?auto_51394 ?auto_51384 ) ) ( not ( = ?auto_51379 ?auto_51384 ) ) ( AVAILABLE ?auto_51384 ) ( SURFACE-AT ?auto_51376 ?auto_51393 ) ( ON ?auto_51376 ?auto_51390 ) ( CLEAR ?auto_51376 ) ( not ( = ?auto_51375 ?auto_51390 ) ) ( not ( = ?auto_51376 ?auto_51390 ) ) ( not ( = ?auto_51382 ?auto_51390 ) ) ( not ( = ?auto_51380 ?auto_51390 ) ) ( IS-CRATE ?auto_51380 ) ( not ( = ?auto_51375 ?auto_51389 ) ) ( not ( = ?auto_51376 ?auto_51389 ) ) ( not ( = ?auto_51382 ?auto_51389 ) ) ( not ( = ?auto_51380 ?auto_51389 ) ) ( not ( = ?auto_51390 ?auto_51389 ) ) ( not ( = ?auto_51387 ?auto_51381 ) ) ( not ( = ?auto_51377 ?auto_51387 ) ) ( not ( = ?auto_51393 ?auto_51387 ) ) ( HOIST-AT ?auto_51378 ?auto_51387 ) ( not ( = ?auto_51394 ?auto_51378 ) ) ( not ( = ?auto_51379 ?auto_51378 ) ) ( not ( = ?auto_51384 ?auto_51378 ) ) ( AVAILABLE ?auto_51378 ) ( SURFACE-AT ?auto_51380 ?auto_51387 ) ( ON ?auto_51380 ?auto_51385 ) ( CLEAR ?auto_51380 ) ( not ( = ?auto_51375 ?auto_51385 ) ) ( not ( = ?auto_51376 ?auto_51385 ) ) ( not ( = ?auto_51382 ?auto_51385 ) ) ( not ( = ?auto_51380 ?auto_51385 ) ) ( not ( = ?auto_51390 ?auto_51385 ) ) ( not ( = ?auto_51389 ?auto_51385 ) ) ( IS-CRATE ?auto_51389 ) ( not ( = ?auto_51375 ?auto_51392 ) ) ( not ( = ?auto_51376 ?auto_51392 ) ) ( not ( = ?auto_51382 ?auto_51392 ) ) ( not ( = ?auto_51380 ?auto_51392 ) ) ( not ( = ?auto_51390 ?auto_51392 ) ) ( not ( = ?auto_51389 ?auto_51392 ) ) ( not ( = ?auto_51385 ?auto_51392 ) ) ( not ( = ?auto_51395 ?auto_51381 ) ) ( not ( = ?auto_51377 ?auto_51395 ) ) ( not ( = ?auto_51393 ?auto_51395 ) ) ( not ( = ?auto_51387 ?auto_51395 ) ) ( HOIST-AT ?auto_51388 ?auto_51395 ) ( not ( = ?auto_51394 ?auto_51388 ) ) ( not ( = ?auto_51379 ?auto_51388 ) ) ( not ( = ?auto_51384 ?auto_51388 ) ) ( not ( = ?auto_51378 ?auto_51388 ) ) ( AVAILABLE ?auto_51388 ) ( SURFACE-AT ?auto_51389 ?auto_51395 ) ( ON ?auto_51389 ?auto_51386 ) ( CLEAR ?auto_51389 ) ( not ( = ?auto_51375 ?auto_51386 ) ) ( not ( = ?auto_51376 ?auto_51386 ) ) ( not ( = ?auto_51382 ?auto_51386 ) ) ( not ( = ?auto_51380 ?auto_51386 ) ) ( not ( = ?auto_51390 ?auto_51386 ) ) ( not ( = ?auto_51389 ?auto_51386 ) ) ( not ( = ?auto_51385 ?auto_51386 ) ) ( not ( = ?auto_51392 ?auto_51386 ) ) ( SURFACE-AT ?auto_51383 ?auto_51381 ) ( CLEAR ?auto_51383 ) ( IS-CRATE ?auto_51392 ) ( not ( = ?auto_51375 ?auto_51383 ) ) ( not ( = ?auto_51376 ?auto_51383 ) ) ( not ( = ?auto_51382 ?auto_51383 ) ) ( not ( = ?auto_51380 ?auto_51383 ) ) ( not ( = ?auto_51390 ?auto_51383 ) ) ( not ( = ?auto_51389 ?auto_51383 ) ) ( not ( = ?auto_51385 ?auto_51383 ) ) ( not ( = ?auto_51392 ?auto_51383 ) ) ( not ( = ?auto_51386 ?auto_51383 ) ) ( AVAILABLE ?auto_51394 ) ( IN ?auto_51392 ?auto_51391 ) ( TRUCK-AT ?auto_51391 ?auto_51396 ) ( not ( = ?auto_51396 ?auto_51381 ) ) ( not ( = ?auto_51377 ?auto_51396 ) ) ( not ( = ?auto_51393 ?auto_51396 ) ) ( not ( = ?auto_51387 ?auto_51396 ) ) ( not ( = ?auto_51395 ?auto_51396 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_51391 ?auto_51396 ?auto_51381 )
      ( MAKE-ON ?auto_51375 ?auto_51376 )
      ( MAKE-ON-VERIFY ?auto_51375 ?auto_51376 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51397 - SURFACE
      ?auto_51398 - SURFACE
    )
    :vars
    (
      ?auto_51412 - HOIST
      ?auto_51416 - PLACE
      ?auto_51410 - PLACE
      ?auto_51415 - HOIST
      ?auto_51399 - SURFACE
      ?auto_51418 - SURFACE
      ?auto_51402 - PLACE
      ?auto_51411 - HOIST
      ?auto_51417 - SURFACE
      ?auto_51408 - SURFACE
      ?auto_51406 - PLACE
      ?auto_51403 - HOIST
      ?auto_51405 - SURFACE
      ?auto_51409 - SURFACE
      ?auto_51413 - PLACE
      ?auto_51404 - HOIST
      ?auto_51407 - SURFACE
      ?auto_51400 - SURFACE
      ?auto_51401 - TRUCK
      ?auto_51414 - PLACE
      ?auto_51419 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_51412 ?auto_51416 ) ( IS-CRATE ?auto_51397 ) ( not ( = ?auto_51397 ?auto_51398 ) ) ( not ( = ?auto_51410 ?auto_51416 ) ) ( HOIST-AT ?auto_51415 ?auto_51410 ) ( not ( = ?auto_51412 ?auto_51415 ) ) ( AVAILABLE ?auto_51415 ) ( SURFACE-AT ?auto_51397 ?auto_51410 ) ( ON ?auto_51397 ?auto_51399 ) ( CLEAR ?auto_51397 ) ( not ( = ?auto_51397 ?auto_51399 ) ) ( not ( = ?auto_51398 ?auto_51399 ) ) ( IS-CRATE ?auto_51398 ) ( not ( = ?auto_51397 ?auto_51418 ) ) ( not ( = ?auto_51398 ?auto_51418 ) ) ( not ( = ?auto_51399 ?auto_51418 ) ) ( not ( = ?auto_51402 ?auto_51416 ) ) ( not ( = ?auto_51410 ?auto_51402 ) ) ( HOIST-AT ?auto_51411 ?auto_51402 ) ( not ( = ?auto_51412 ?auto_51411 ) ) ( not ( = ?auto_51415 ?auto_51411 ) ) ( AVAILABLE ?auto_51411 ) ( SURFACE-AT ?auto_51398 ?auto_51402 ) ( ON ?auto_51398 ?auto_51417 ) ( CLEAR ?auto_51398 ) ( not ( = ?auto_51397 ?auto_51417 ) ) ( not ( = ?auto_51398 ?auto_51417 ) ) ( not ( = ?auto_51399 ?auto_51417 ) ) ( not ( = ?auto_51418 ?auto_51417 ) ) ( IS-CRATE ?auto_51418 ) ( not ( = ?auto_51397 ?auto_51408 ) ) ( not ( = ?auto_51398 ?auto_51408 ) ) ( not ( = ?auto_51399 ?auto_51408 ) ) ( not ( = ?auto_51418 ?auto_51408 ) ) ( not ( = ?auto_51417 ?auto_51408 ) ) ( not ( = ?auto_51406 ?auto_51416 ) ) ( not ( = ?auto_51410 ?auto_51406 ) ) ( not ( = ?auto_51402 ?auto_51406 ) ) ( HOIST-AT ?auto_51403 ?auto_51406 ) ( not ( = ?auto_51412 ?auto_51403 ) ) ( not ( = ?auto_51415 ?auto_51403 ) ) ( not ( = ?auto_51411 ?auto_51403 ) ) ( AVAILABLE ?auto_51403 ) ( SURFACE-AT ?auto_51418 ?auto_51406 ) ( ON ?auto_51418 ?auto_51405 ) ( CLEAR ?auto_51418 ) ( not ( = ?auto_51397 ?auto_51405 ) ) ( not ( = ?auto_51398 ?auto_51405 ) ) ( not ( = ?auto_51399 ?auto_51405 ) ) ( not ( = ?auto_51418 ?auto_51405 ) ) ( not ( = ?auto_51417 ?auto_51405 ) ) ( not ( = ?auto_51408 ?auto_51405 ) ) ( IS-CRATE ?auto_51408 ) ( not ( = ?auto_51397 ?auto_51409 ) ) ( not ( = ?auto_51398 ?auto_51409 ) ) ( not ( = ?auto_51399 ?auto_51409 ) ) ( not ( = ?auto_51418 ?auto_51409 ) ) ( not ( = ?auto_51417 ?auto_51409 ) ) ( not ( = ?auto_51408 ?auto_51409 ) ) ( not ( = ?auto_51405 ?auto_51409 ) ) ( not ( = ?auto_51413 ?auto_51416 ) ) ( not ( = ?auto_51410 ?auto_51413 ) ) ( not ( = ?auto_51402 ?auto_51413 ) ) ( not ( = ?auto_51406 ?auto_51413 ) ) ( HOIST-AT ?auto_51404 ?auto_51413 ) ( not ( = ?auto_51412 ?auto_51404 ) ) ( not ( = ?auto_51415 ?auto_51404 ) ) ( not ( = ?auto_51411 ?auto_51404 ) ) ( not ( = ?auto_51403 ?auto_51404 ) ) ( AVAILABLE ?auto_51404 ) ( SURFACE-AT ?auto_51408 ?auto_51413 ) ( ON ?auto_51408 ?auto_51407 ) ( CLEAR ?auto_51408 ) ( not ( = ?auto_51397 ?auto_51407 ) ) ( not ( = ?auto_51398 ?auto_51407 ) ) ( not ( = ?auto_51399 ?auto_51407 ) ) ( not ( = ?auto_51418 ?auto_51407 ) ) ( not ( = ?auto_51417 ?auto_51407 ) ) ( not ( = ?auto_51408 ?auto_51407 ) ) ( not ( = ?auto_51405 ?auto_51407 ) ) ( not ( = ?auto_51409 ?auto_51407 ) ) ( SURFACE-AT ?auto_51400 ?auto_51416 ) ( CLEAR ?auto_51400 ) ( IS-CRATE ?auto_51409 ) ( not ( = ?auto_51397 ?auto_51400 ) ) ( not ( = ?auto_51398 ?auto_51400 ) ) ( not ( = ?auto_51399 ?auto_51400 ) ) ( not ( = ?auto_51418 ?auto_51400 ) ) ( not ( = ?auto_51417 ?auto_51400 ) ) ( not ( = ?auto_51408 ?auto_51400 ) ) ( not ( = ?auto_51405 ?auto_51400 ) ) ( not ( = ?auto_51409 ?auto_51400 ) ) ( not ( = ?auto_51407 ?auto_51400 ) ) ( AVAILABLE ?auto_51412 ) ( TRUCK-AT ?auto_51401 ?auto_51414 ) ( not ( = ?auto_51414 ?auto_51416 ) ) ( not ( = ?auto_51410 ?auto_51414 ) ) ( not ( = ?auto_51402 ?auto_51414 ) ) ( not ( = ?auto_51406 ?auto_51414 ) ) ( not ( = ?auto_51413 ?auto_51414 ) ) ( HOIST-AT ?auto_51419 ?auto_51414 ) ( LIFTING ?auto_51419 ?auto_51409 ) ( not ( = ?auto_51412 ?auto_51419 ) ) ( not ( = ?auto_51415 ?auto_51419 ) ) ( not ( = ?auto_51411 ?auto_51419 ) ) ( not ( = ?auto_51403 ?auto_51419 ) ) ( not ( = ?auto_51404 ?auto_51419 ) ) )
    :subtasks
    ( ( !LOAD ?auto_51419 ?auto_51409 ?auto_51401 ?auto_51414 )
      ( MAKE-ON ?auto_51397 ?auto_51398 )
      ( MAKE-ON-VERIFY ?auto_51397 ?auto_51398 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51420 - SURFACE
      ?auto_51421 - SURFACE
    )
    :vars
    (
      ?auto_51437 - HOIST
      ?auto_51442 - PLACE
      ?auto_51435 - PLACE
      ?auto_51430 - HOIST
      ?auto_51426 - SURFACE
      ?auto_51424 - SURFACE
      ?auto_51429 - PLACE
      ?auto_51423 - HOIST
      ?auto_51432 - SURFACE
      ?auto_51422 - SURFACE
      ?auto_51436 - PLACE
      ?auto_51425 - HOIST
      ?auto_51428 - SURFACE
      ?auto_51433 - SURFACE
      ?auto_51427 - PLACE
      ?auto_51440 - HOIST
      ?auto_51441 - SURFACE
      ?auto_51439 - SURFACE
      ?auto_51434 - TRUCK
      ?auto_51438 - PLACE
      ?auto_51431 - HOIST
      ?auto_51443 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51437 ?auto_51442 ) ( IS-CRATE ?auto_51420 ) ( not ( = ?auto_51420 ?auto_51421 ) ) ( not ( = ?auto_51435 ?auto_51442 ) ) ( HOIST-AT ?auto_51430 ?auto_51435 ) ( not ( = ?auto_51437 ?auto_51430 ) ) ( AVAILABLE ?auto_51430 ) ( SURFACE-AT ?auto_51420 ?auto_51435 ) ( ON ?auto_51420 ?auto_51426 ) ( CLEAR ?auto_51420 ) ( not ( = ?auto_51420 ?auto_51426 ) ) ( not ( = ?auto_51421 ?auto_51426 ) ) ( IS-CRATE ?auto_51421 ) ( not ( = ?auto_51420 ?auto_51424 ) ) ( not ( = ?auto_51421 ?auto_51424 ) ) ( not ( = ?auto_51426 ?auto_51424 ) ) ( not ( = ?auto_51429 ?auto_51442 ) ) ( not ( = ?auto_51435 ?auto_51429 ) ) ( HOIST-AT ?auto_51423 ?auto_51429 ) ( not ( = ?auto_51437 ?auto_51423 ) ) ( not ( = ?auto_51430 ?auto_51423 ) ) ( AVAILABLE ?auto_51423 ) ( SURFACE-AT ?auto_51421 ?auto_51429 ) ( ON ?auto_51421 ?auto_51432 ) ( CLEAR ?auto_51421 ) ( not ( = ?auto_51420 ?auto_51432 ) ) ( not ( = ?auto_51421 ?auto_51432 ) ) ( not ( = ?auto_51426 ?auto_51432 ) ) ( not ( = ?auto_51424 ?auto_51432 ) ) ( IS-CRATE ?auto_51424 ) ( not ( = ?auto_51420 ?auto_51422 ) ) ( not ( = ?auto_51421 ?auto_51422 ) ) ( not ( = ?auto_51426 ?auto_51422 ) ) ( not ( = ?auto_51424 ?auto_51422 ) ) ( not ( = ?auto_51432 ?auto_51422 ) ) ( not ( = ?auto_51436 ?auto_51442 ) ) ( not ( = ?auto_51435 ?auto_51436 ) ) ( not ( = ?auto_51429 ?auto_51436 ) ) ( HOIST-AT ?auto_51425 ?auto_51436 ) ( not ( = ?auto_51437 ?auto_51425 ) ) ( not ( = ?auto_51430 ?auto_51425 ) ) ( not ( = ?auto_51423 ?auto_51425 ) ) ( AVAILABLE ?auto_51425 ) ( SURFACE-AT ?auto_51424 ?auto_51436 ) ( ON ?auto_51424 ?auto_51428 ) ( CLEAR ?auto_51424 ) ( not ( = ?auto_51420 ?auto_51428 ) ) ( not ( = ?auto_51421 ?auto_51428 ) ) ( not ( = ?auto_51426 ?auto_51428 ) ) ( not ( = ?auto_51424 ?auto_51428 ) ) ( not ( = ?auto_51432 ?auto_51428 ) ) ( not ( = ?auto_51422 ?auto_51428 ) ) ( IS-CRATE ?auto_51422 ) ( not ( = ?auto_51420 ?auto_51433 ) ) ( not ( = ?auto_51421 ?auto_51433 ) ) ( not ( = ?auto_51426 ?auto_51433 ) ) ( not ( = ?auto_51424 ?auto_51433 ) ) ( not ( = ?auto_51432 ?auto_51433 ) ) ( not ( = ?auto_51422 ?auto_51433 ) ) ( not ( = ?auto_51428 ?auto_51433 ) ) ( not ( = ?auto_51427 ?auto_51442 ) ) ( not ( = ?auto_51435 ?auto_51427 ) ) ( not ( = ?auto_51429 ?auto_51427 ) ) ( not ( = ?auto_51436 ?auto_51427 ) ) ( HOIST-AT ?auto_51440 ?auto_51427 ) ( not ( = ?auto_51437 ?auto_51440 ) ) ( not ( = ?auto_51430 ?auto_51440 ) ) ( not ( = ?auto_51423 ?auto_51440 ) ) ( not ( = ?auto_51425 ?auto_51440 ) ) ( AVAILABLE ?auto_51440 ) ( SURFACE-AT ?auto_51422 ?auto_51427 ) ( ON ?auto_51422 ?auto_51441 ) ( CLEAR ?auto_51422 ) ( not ( = ?auto_51420 ?auto_51441 ) ) ( not ( = ?auto_51421 ?auto_51441 ) ) ( not ( = ?auto_51426 ?auto_51441 ) ) ( not ( = ?auto_51424 ?auto_51441 ) ) ( not ( = ?auto_51432 ?auto_51441 ) ) ( not ( = ?auto_51422 ?auto_51441 ) ) ( not ( = ?auto_51428 ?auto_51441 ) ) ( not ( = ?auto_51433 ?auto_51441 ) ) ( SURFACE-AT ?auto_51439 ?auto_51442 ) ( CLEAR ?auto_51439 ) ( IS-CRATE ?auto_51433 ) ( not ( = ?auto_51420 ?auto_51439 ) ) ( not ( = ?auto_51421 ?auto_51439 ) ) ( not ( = ?auto_51426 ?auto_51439 ) ) ( not ( = ?auto_51424 ?auto_51439 ) ) ( not ( = ?auto_51432 ?auto_51439 ) ) ( not ( = ?auto_51422 ?auto_51439 ) ) ( not ( = ?auto_51428 ?auto_51439 ) ) ( not ( = ?auto_51433 ?auto_51439 ) ) ( not ( = ?auto_51441 ?auto_51439 ) ) ( AVAILABLE ?auto_51437 ) ( TRUCK-AT ?auto_51434 ?auto_51438 ) ( not ( = ?auto_51438 ?auto_51442 ) ) ( not ( = ?auto_51435 ?auto_51438 ) ) ( not ( = ?auto_51429 ?auto_51438 ) ) ( not ( = ?auto_51436 ?auto_51438 ) ) ( not ( = ?auto_51427 ?auto_51438 ) ) ( HOIST-AT ?auto_51431 ?auto_51438 ) ( not ( = ?auto_51437 ?auto_51431 ) ) ( not ( = ?auto_51430 ?auto_51431 ) ) ( not ( = ?auto_51423 ?auto_51431 ) ) ( not ( = ?auto_51425 ?auto_51431 ) ) ( not ( = ?auto_51440 ?auto_51431 ) ) ( AVAILABLE ?auto_51431 ) ( SURFACE-AT ?auto_51433 ?auto_51438 ) ( ON ?auto_51433 ?auto_51443 ) ( CLEAR ?auto_51433 ) ( not ( = ?auto_51420 ?auto_51443 ) ) ( not ( = ?auto_51421 ?auto_51443 ) ) ( not ( = ?auto_51426 ?auto_51443 ) ) ( not ( = ?auto_51424 ?auto_51443 ) ) ( not ( = ?auto_51432 ?auto_51443 ) ) ( not ( = ?auto_51422 ?auto_51443 ) ) ( not ( = ?auto_51428 ?auto_51443 ) ) ( not ( = ?auto_51433 ?auto_51443 ) ) ( not ( = ?auto_51441 ?auto_51443 ) ) ( not ( = ?auto_51439 ?auto_51443 ) ) )
    :subtasks
    ( ( !LIFT ?auto_51431 ?auto_51433 ?auto_51443 ?auto_51438 )
      ( MAKE-ON ?auto_51420 ?auto_51421 )
      ( MAKE-ON-VERIFY ?auto_51420 ?auto_51421 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51444 - SURFACE
      ?auto_51445 - SURFACE
    )
    :vars
    (
      ?auto_51454 - HOIST
      ?auto_51452 - PLACE
      ?auto_51464 - PLACE
      ?auto_51449 - HOIST
      ?auto_51465 - SURFACE
      ?auto_51446 - SURFACE
      ?auto_51456 - PLACE
      ?auto_51453 - HOIST
      ?auto_51458 - SURFACE
      ?auto_51463 - SURFACE
      ?auto_51462 - PLACE
      ?auto_51450 - HOIST
      ?auto_51455 - SURFACE
      ?auto_51461 - SURFACE
      ?auto_51459 - PLACE
      ?auto_51467 - HOIST
      ?auto_51460 - SURFACE
      ?auto_51466 - SURFACE
      ?auto_51448 - PLACE
      ?auto_51451 - HOIST
      ?auto_51447 - SURFACE
      ?auto_51457 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51454 ?auto_51452 ) ( IS-CRATE ?auto_51444 ) ( not ( = ?auto_51444 ?auto_51445 ) ) ( not ( = ?auto_51464 ?auto_51452 ) ) ( HOIST-AT ?auto_51449 ?auto_51464 ) ( not ( = ?auto_51454 ?auto_51449 ) ) ( AVAILABLE ?auto_51449 ) ( SURFACE-AT ?auto_51444 ?auto_51464 ) ( ON ?auto_51444 ?auto_51465 ) ( CLEAR ?auto_51444 ) ( not ( = ?auto_51444 ?auto_51465 ) ) ( not ( = ?auto_51445 ?auto_51465 ) ) ( IS-CRATE ?auto_51445 ) ( not ( = ?auto_51444 ?auto_51446 ) ) ( not ( = ?auto_51445 ?auto_51446 ) ) ( not ( = ?auto_51465 ?auto_51446 ) ) ( not ( = ?auto_51456 ?auto_51452 ) ) ( not ( = ?auto_51464 ?auto_51456 ) ) ( HOIST-AT ?auto_51453 ?auto_51456 ) ( not ( = ?auto_51454 ?auto_51453 ) ) ( not ( = ?auto_51449 ?auto_51453 ) ) ( AVAILABLE ?auto_51453 ) ( SURFACE-AT ?auto_51445 ?auto_51456 ) ( ON ?auto_51445 ?auto_51458 ) ( CLEAR ?auto_51445 ) ( not ( = ?auto_51444 ?auto_51458 ) ) ( not ( = ?auto_51445 ?auto_51458 ) ) ( not ( = ?auto_51465 ?auto_51458 ) ) ( not ( = ?auto_51446 ?auto_51458 ) ) ( IS-CRATE ?auto_51446 ) ( not ( = ?auto_51444 ?auto_51463 ) ) ( not ( = ?auto_51445 ?auto_51463 ) ) ( not ( = ?auto_51465 ?auto_51463 ) ) ( not ( = ?auto_51446 ?auto_51463 ) ) ( not ( = ?auto_51458 ?auto_51463 ) ) ( not ( = ?auto_51462 ?auto_51452 ) ) ( not ( = ?auto_51464 ?auto_51462 ) ) ( not ( = ?auto_51456 ?auto_51462 ) ) ( HOIST-AT ?auto_51450 ?auto_51462 ) ( not ( = ?auto_51454 ?auto_51450 ) ) ( not ( = ?auto_51449 ?auto_51450 ) ) ( not ( = ?auto_51453 ?auto_51450 ) ) ( AVAILABLE ?auto_51450 ) ( SURFACE-AT ?auto_51446 ?auto_51462 ) ( ON ?auto_51446 ?auto_51455 ) ( CLEAR ?auto_51446 ) ( not ( = ?auto_51444 ?auto_51455 ) ) ( not ( = ?auto_51445 ?auto_51455 ) ) ( not ( = ?auto_51465 ?auto_51455 ) ) ( not ( = ?auto_51446 ?auto_51455 ) ) ( not ( = ?auto_51458 ?auto_51455 ) ) ( not ( = ?auto_51463 ?auto_51455 ) ) ( IS-CRATE ?auto_51463 ) ( not ( = ?auto_51444 ?auto_51461 ) ) ( not ( = ?auto_51445 ?auto_51461 ) ) ( not ( = ?auto_51465 ?auto_51461 ) ) ( not ( = ?auto_51446 ?auto_51461 ) ) ( not ( = ?auto_51458 ?auto_51461 ) ) ( not ( = ?auto_51463 ?auto_51461 ) ) ( not ( = ?auto_51455 ?auto_51461 ) ) ( not ( = ?auto_51459 ?auto_51452 ) ) ( not ( = ?auto_51464 ?auto_51459 ) ) ( not ( = ?auto_51456 ?auto_51459 ) ) ( not ( = ?auto_51462 ?auto_51459 ) ) ( HOIST-AT ?auto_51467 ?auto_51459 ) ( not ( = ?auto_51454 ?auto_51467 ) ) ( not ( = ?auto_51449 ?auto_51467 ) ) ( not ( = ?auto_51453 ?auto_51467 ) ) ( not ( = ?auto_51450 ?auto_51467 ) ) ( AVAILABLE ?auto_51467 ) ( SURFACE-AT ?auto_51463 ?auto_51459 ) ( ON ?auto_51463 ?auto_51460 ) ( CLEAR ?auto_51463 ) ( not ( = ?auto_51444 ?auto_51460 ) ) ( not ( = ?auto_51445 ?auto_51460 ) ) ( not ( = ?auto_51465 ?auto_51460 ) ) ( not ( = ?auto_51446 ?auto_51460 ) ) ( not ( = ?auto_51458 ?auto_51460 ) ) ( not ( = ?auto_51463 ?auto_51460 ) ) ( not ( = ?auto_51455 ?auto_51460 ) ) ( not ( = ?auto_51461 ?auto_51460 ) ) ( SURFACE-AT ?auto_51466 ?auto_51452 ) ( CLEAR ?auto_51466 ) ( IS-CRATE ?auto_51461 ) ( not ( = ?auto_51444 ?auto_51466 ) ) ( not ( = ?auto_51445 ?auto_51466 ) ) ( not ( = ?auto_51465 ?auto_51466 ) ) ( not ( = ?auto_51446 ?auto_51466 ) ) ( not ( = ?auto_51458 ?auto_51466 ) ) ( not ( = ?auto_51463 ?auto_51466 ) ) ( not ( = ?auto_51455 ?auto_51466 ) ) ( not ( = ?auto_51461 ?auto_51466 ) ) ( not ( = ?auto_51460 ?auto_51466 ) ) ( AVAILABLE ?auto_51454 ) ( not ( = ?auto_51448 ?auto_51452 ) ) ( not ( = ?auto_51464 ?auto_51448 ) ) ( not ( = ?auto_51456 ?auto_51448 ) ) ( not ( = ?auto_51462 ?auto_51448 ) ) ( not ( = ?auto_51459 ?auto_51448 ) ) ( HOIST-AT ?auto_51451 ?auto_51448 ) ( not ( = ?auto_51454 ?auto_51451 ) ) ( not ( = ?auto_51449 ?auto_51451 ) ) ( not ( = ?auto_51453 ?auto_51451 ) ) ( not ( = ?auto_51450 ?auto_51451 ) ) ( not ( = ?auto_51467 ?auto_51451 ) ) ( AVAILABLE ?auto_51451 ) ( SURFACE-AT ?auto_51461 ?auto_51448 ) ( ON ?auto_51461 ?auto_51447 ) ( CLEAR ?auto_51461 ) ( not ( = ?auto_51444 ?auto_51447 ) ) ( not ( = ?auto_51445 ?auto_51447 ) ) ( not ( = ?auto_51465 ?auto_51447 ) ) ( not ( = ?auto_51446 ?auto_51447 ) ) ( not ( = ?auto_51458 ?auto_51447 ) ) ( not ( = ?auto_51463 ?auto_51447 ) ) ( not ( = ?auto_51455 ?auto_51447 ) ) ( not ( = ?auto_51461 ?auto_51447 ) ) ( not ( = ?auto_51460 ?auto_51447 ) ) ( not ( = ?auto_51466 ?auto_51447 ) ) ( TRUCK-AT ?auto_51457 ?auto_51452 ) )
    :subtasks
    ( ( !DRIVE ?auto_51457 ?auto_51452 ?auto_51448 )
      ( MAKE-ON ?auto_51444 ?auto_51445 )
      ( MAKE-ON-VERIFY ?auto_51444 ?auto_51445 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51470 - SURFACE
      ?auto_51471 - SURFACE
    )
    :vars
    (
      ?auto_51472 - HOIST
      ?auto_51473 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51472 ?auto_51473 ) ( SURFACE-AT ?auto_51471 ?auto_51473 ) ( CLEAR ?auto_51471 ) ( LIFTING ?auto_51472 ?auto_51470 ) ( IS-CRATE ?auto_51470 ) ( not ( = ?auto_51470 ?auto_51471 ) ) )
    :subtasks
    ( ( !DROP ?auto_51472 ?auto_51470 ?auto_51471 ?auto_51473 )
      ( MAKE-ON-VERIFY ?auto_51470 ?auto_51471 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51474 - SURFACE
      ?auto_51475 - SURFACE
    )
    :vars
    (
      ?auto_51476 - HOIST
      ?auto_51477 - PLACE
      ?auto_51478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51476 ?auto_51477 ) ( SURFACE-AT ?auto_51475 ?auto_51477 ) ( CLEAR ?auto_51475 ) ( IS-CRATE ?auto_51474 ) ( not ( = ?auto_51474 ?auto_51475 ) ) ( TRUCK-AT ?auto_51478 ?auto_51477 ) ( AVAILABLE ?auto_51476 ) ( IN ?auto_51474 ?auto_51478 ) )
    :subtasks
    ( ( !UNLOAD ?auto_51476 ?auto_51474 ?auto_51478 ?auto_51477 )
      ( MAKE-ON ?auto_51474 ?auto_51475 )
      ( MAKE-ON-VERIFY ?auto_51474 ?auto_51475 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51479 - SURFACE
      ?auto_51480 - SURFACE
    )
    :vars
    (
      ?auto_51481 - HOIST
      ?auto_51483 - PLACE
      ?auto_51482 - TRUCK
      ?auto_51484 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51481 ?auto_51483 ) ( SURFACE-AT ?auto_51480 ?auto_51483 ) ( CLEAR ?auto_51480 ) ( IS-CRATE ?auto_51479 ) ( not ( = ?auto_51479 ?auto_51480 ) ) ( AVAILABLE ?auto_51481 ) ( IN ?auto_51479 ?auto_51482 ) ( TRUCK-AT ?auto_51482 ?auto_51484 ) ( not ( = ?auto_51484 ?auto_51483 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_51482 ?auto_51484 ?auto_51483 )
      ( MAKE-ON ?auto_51479 ?auto_51480 )
      ( MAKE-ON-VERIFY ?auto_51479 ?auto_51480 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51485 - SURFACE
      ?auto_51486 - SURFACE
    )
    :vars
    (
      ?auto_51490 - HOIST
      ?auto_51487 - PLACE
      ?auto_51489 - TRUCK
      ?auto_51488 - PLACE
      ?auto_51491 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_51490 ?auto_51487 ) ( SURFACE-AT ?auto_51486 ?auto_51487 ) ( CLEAR ?auto_51486 ) ( IS-CRATE ?auto_51485 ) ( not ( = ?auto_51485 ?auto_51486 ) ) ( AVAILABLE ?auto_51490 ) ( TRUCK-AT ?auto_51489 ?auto_51488 ) ( not ( = ?auto_51488 ?auto_51487 ) ) ( HOIST-AT ?auto_51491 ?auto_51488 ) ( LIFTING ?auto_51491 ?auto_51485 ) ( not ( = ?auto_51490 ?auto_51491 ) ) )
    :subtasks
    ( ( !LOAD ?auto_51491 ?auto_51485 ?auto_51489 ?auto_51488 )
      ( MAKE-ON ?auto_51485 ?auto_51486 )
      ( MAKE-ON-VERIFY ?auto_51485 ?auto_51486 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51492 - SURFACE
      ?auto_51493 - SURFACE
    )
    :vars
    (
      ?auto_51498 - HOIST
      ?auto_51496 - PLACE
      ?auto_51495 - TRUCK
      ?auto_51497 - PLACE
      ?auto_51494 - HOIST
      ?auto_51499 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51498 ?auto_51496 ) ( SURFACE-AT ?auto_51493 ?auto_51496 ) ( CLEAR ?auto_51493 ) ( IS-CRATE ?auto_51492 ) ( not ( = ?auto_51492 ?auto_51493 ) ) ( AVAILABLE ?auto_51498 ) ( TRUCK-AT ?auto_51495 ?auto_51497 ) ( not ( = ?auto_51497 ?auto_51496 ) ) ( HOIST-AT ?auto_51494 ?auto_51497 ) ( not ( = ?auto_51498 ?auto_51494 ) ) ( AVAILABLE ?auto_51494 ) ( SURFACE-AT ?auto_51492 ?auto_51497 ) ( ON ?auto_51492 ?auto_51499 ) ( CLEAR ?auto_51492 ) ( not ( = ?auto_51492 ?auto_51499 ) ) ( not ( = ?auto_51493 ?auto_51499 ) ) )
    :subtasks
    ( ( !LIFT ?auto_51494 ?auto_51492 ?auto_51499 ?auto_51497 )
      ( MAKE-ON ?auto_51492 ?auto_51493 )
      ( MAKE-ON-VERIFY ?auto_51492 ?auto_51493 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51500 - SURFACE
      ?auto_51501 - SURFACE
    )
    :vars
    (
      ?auto_51502 - HOIST
      ?auto_51504 - PLACE
      ?auto_51503 - PLACE
      ?auto_51505 - HOIST
      ?auto_51507 - SURFACE
      ?auto_51506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51502 ?auto_51504 ) ( SURFACE-AT ?auto_51501 ?auto_51504 ) ( CLEAR ?auto_51501 ) ( IS-CRATE ?auto_51500 ) ( not ( = ?auto_51500 ?auto_51501 ) ) ( AVAILABLE ?auto_51502 ) ( not ( = ?auto_51503 ?auto_51504 ) ) ( HOIST-AT ?auto_51505 ?auto_51503 ) ( not ( = ?auto_51502 ?auto_51505 ) ) ( AVAILABLE ?auto_51505 ) ( SURFACE-AT ?auto_51500 ?auto_51503 ) ( ON ?auto_51500 ?auto_51507 ) ( CLEAR ?auto_51500 ) ( not ( = ?auto_51500 ?auto_51507 ) ) ( not ( = ?auto_51501 ?auto_51507 ) ) ( TRUCK-AT ?auto_51506 ?auto_51504 ) )
    :subtasks
    ( ( !DRIVE ?auto_51506 ?auto_51504 ?auto_51503 )
      ( MAKE-ON ?auto_51500 ?auto_51501 )
      ( MAKE-ON-VERIFY ?auto_51500 ?auto_51501 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51508 - SURFACE
      ?auto_51509 - SURFACE
    )
    :vars
    (
      ?auto_51514 - HOIST
      ?auto_51510 - PLACE
      ?auto_51513 - PLACE
      ?auto_51515 - HOIST
      ?auto_51512 - SURFACE
      ?auto_51511 - TRUCK
      ?auto_51516 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51514 ?auto_51510 ) ( IS-CRATE ?auto_51508 ) ( not ( = ?auto_51508 ?auto_51509 ) ) ( not ( = ?auto_51513 ?auto_51510 ) ) ( HOIST-AT ?auto_51515 ?auto_51513 ) ( not ( = ?auto_51514 ?auto_51515 ) ) ( AVAILABLE ?auto_51515 ) ( SURFACE-AT ?auto_51508 ?auto_51513 ) ( ON ?auto_51508 ?auto_51512 ) ( CLEAR ?auto_51508 ) ( not ( = ?auto_51508 ?auto_51512 ) ) ( not ( = ?auto_51509 ?auto_51512 ) ) ( TRUCK-AT ?auto_51511 ?auto_51510 ) ( SURFACE-AT ?auto_51516 ?auto_51510 ) ( CLEAR ?auto_51516 ) ( LIFTING ?auto_51514 ?auto_51509 ) ( IS-CRATE ?auto_51509 ) ( not ( = ?auto_51508 ?auto_51516 ) ) ( not ( = ?auto_51509 ?auto_51516 ) ) ( not ( = ?auto_51512 ?auto_51516 ) ) )
    :subtasks
    ( ( !DROP ?auto_51514 ?auto_51509 ?auto_51516 ?auto_51510 )
      ( MAKE-ON ?auto_51508 ?auto_51509 )
      ( MAKE-ON-VERIFY ?auto_51508 ?auto_51509 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51517 - SURFACE
      ?auto_51518 - SURFACE
    )
    :vars
    (
      ?auto_51520 - HOIST
      ?auto_51519 - PLACE
      ?auto_51523 - PLACE
      ?auto_51525 - HOIST
      ?auto_51522 - SURFACE
      ?auto_51521 - TRUCK
      ?auto_51524 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51520 ?auto_51519 ) ( IS-CRATE ?auto_51517 ) ( not ( = ?auto_51517 ?auto_51518 ) ) ( not ( = ?auto_51523 ?auto_51519 ) ) ( HOIST-AT ?auto_51525 ?auto_51523 ) ( not ( = ?auto_51520 ?auto_51525 ) ) ( AVAILABLE ?auto_51525 ) ( SURFACE-AT ?auto_51517 ?auto_51523 ) ( ON ?auto_51517 ?auto_51522 ) ( CLEAR ?auto_51517 ) ( not ( = ?auto_51517 ?auto_51522 ) ) ( not ( = ?auto_51518 ?auto_51522 ) ) ( TRUCK-AT ?auto_51521 ?auto_51519 ) ( SURFACE-AT ?auto_51524 ?auto_51519 ) ( CLEAR ?auto_51524 ) ( IS-CRATE ?auto_51518 ) ( not ( = ?auto_51517 ?auto_51524 ) ) ( not ( = ?auto_51518 ?auto_51524 ) ) ( not ( = ?auto_51522 ?auto_51524 ) ) ( AVAILABLE ?auto_51520 ) ( IN ?auto_51518 ?auto_51521 ) )
    :subtasks
    ( ( !UNLOAD ?auto_51520 ?auto_51518 ?auto_51521 ?auto_51519 )
      ( MAKE-ON ?auto_51517 ?auto_51518 )
      ( MAKE-ON-VERIFY ?auto_51517 ?auto_51518 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51526 - SURFACE
      ?auto_51527 - SURFACE
    )
    :vars
    (
      ?auto_51532 - HOIST
      ?auto_51533 - PLACE
      ?auto_51531 - PLACE
      ?auto_51528 - HOIST
      ?auto_51530 - SURFACE
      ?auto_51529 - SURFACE
      ?auto_51534 - TRUCK
      ?auto_51535 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51532 ?auto_51533 ) ( IS-CRATE ?auto_51526 ) ( not ( = ?auto_51526 ?auto_51527 ) ) ( not ( = ?auto_51531 ?auto_51533 ) ) ( HOIST-AT ?auto_51528 ?auto_51531 ) ( not ( = ?auto_51532 ?auto_51528 ) ) ( AVAILABLE ?auto_51528 ) ( SURFACE-AT ?auto_51526 ?auto_51531 ) ( ON ?auto_51526 ?auto_51530 ) ( CLEAR ?auto_51526 ) ( not ( = ?auto_51526 ?auto_51530 ) ) ( not ( = ?auto_51527 ?auto_51530 ) ) ( SURFACE-AT ?auto_51529 ?auto_51533 ) ( CLEAR ?auto_51529 ) ( IS-CRATE ?auto_51527 ) ( not ( = ?auto_51526 ?auto_51529 ) ) ( not ( = ?auto_51527 ?auto_51529 ) ) ( not ( = ?auto_51530 ?auto_51529 ) ) ( AVAILABLE ?auto_51532 ) ( IN ?auto_51527 ?auto_51534 ) ( TRUCK-AT ?auto_51534 ?auto_51535 ) ( not ( = ?auto_51535 ?auto_51533 ) ) ( not ( = ?auto_51531 ?auto_51535 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_51534 ?auto_51535 ?auto_51533 )
      ( MAKE-ON ?auto_51526 ?auto_51527 )
      ( MAKE-ON-VERIFY ?auto_51526 ?auto_51527 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51536 - SURFACE
      ?auto_51537 - SURFACE
    )
    :vars
    (
      ?auto_51545 - HOIST
      ?auto_51539 - PLACE
      ?auto_51541 - PLACE
      ?auto_51543 - HOIST
      ?auto_51542 - SURFACE
      ?auto_51544 - SURFACE
      ?auto_51538 - TRUCK
      ?auto_51540 - PLACE
      ?auto_51546 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_51545 ?auto_51539 ) ( IS-CRATE ?auto_51536 ) ( not ( = ?auto_51536 ?auto_51537 ) ) ( not ( = ?auto_51541 ?auto_51539 ) ) ( HOIST-AT ?auto_51543 ?auto_51541 ) ( not ( = ?auto_51545 ?auto_51543 ) ) ( AVAILABLE ?auto_51543 ) ( SURFACE-AT ?auto_51536 ?auto_51541 ) ( ON ?auto_51536 ?auto_51542 ) ( CLEAR ?auto_51536 ) ( not ( = ?auto_51536 ?auto_51542 ) ) ( not ( = ?auto_51537 ?auto_51542 ) ) ( SURFACE-AT ?auto_51544 ?auto_51539 ) ( CLEAR ?auto_51544 ) ( IS-CRATE ?auto_51537 ) ( not ( = ?auto_51536 ?auto_51544 ) ) ( not ( = ?auto_51537 ?auto_51544 ) ) ( not ( = ?auto_51542 ?auto_51544 ) ) ( AVAILABLE ?auto_51545 ) ( TRUCK-AT ?auto_51538 ?auto_51540 ) ( not ( = ?auto_51540 ?auto_51539 ) ) ( not ( = ?auto_51541 ?auto_51540 ) ) ( HOIST-AT ?auto_51546 ?auto_51540 ) ( LIFTING ?auto_51546 ?auto_51537 ) ( not ( = ?auto_51545 ?auto_51546 ) ) ( not ( = ?auto_51543 ?auto_51546 ) ) )
    :subtasks
    ( ( !LOAD ?auto_51546 ?auto_51537 ?auto_51538 ?auto_51540 )
      ( MAKE-ON ?auto_51536 ?auto_51537 )
      ( MAKE-ON-VERIFY ?auto_51536 ?auto_51537 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51547 - SURFACE
      ?auto_51548 - SURFACE
    )
    :vars
    (
      ?auto_51553 - HOIST
      ?auto_51557 - PLACE
      ?auto_51556 - PLACE
      ?auto_51550 - HOIST
      ?auto_51551 - SURFACE
      ?auto_51554 - SURFACE
      ?auto_51555 - TRUCK
      ?auto_51549 - PLACE
      ?auto_51552 - HOIST
      ?auto_51558 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51553 ?auto_51557 ) ( IS-CRATE ?auto_51547 ) ( not ( = ?auto_51547 ?auto_51548 ) ) ( not ( = ?auto_51556 ?auto_51557 ) ) ( HOIST-AT ?auto_51550 ?auto_51556 ) ( not ( = ?auto_51553 ?auto_51550 ) ) ( AVAILABLE ?auto_51550 ) ( SURFACE-AT ?auto_51547 ?auto_51556 ) ( ON ?auto_51547 ?auto_51551 ) ( CLEAR ?auto_51547 ) ( not ( = ?auto_51547 ?auto_51551 ) ) ( not ( = ?auto_51548 ?auto_51551 ) ) ( SURFACE-AT ?auto_51554 ?auto_51557 ) ( CLEAR ?auto_51554 ) ( IS-CRATE ?auto_51548 ) ( not ( = ?auto_51547 ?auto_51554 ) ) ( not ( = ?auto_51548 ?auto_51554 ) ) ( not ( = ?auto_51551 ?auto_51554 ) ) ( AVAILABLE ?auto_51553 ) ( TRUCK-AT ?auto_51555 ?auto_51549 ) ( not ( = ?auto_51549 ?auto_51557 ) ) ( not ( = ?auto_51556 ?auto_51549 ) ) ( HOIST-AT ?auto_51552 ?auto_51549 ) ( not ( = ?auto_51553 ?auto_51552 ) ) ( not ( = ?auto_51550 ?auto_51552 ) ) ( AVAILABLE ?auto_51552 ) ( SURFACE-AT ?auto_51548 ?auto_51549 ) ( ON ?auto_51548 ?auto_51558 ) ( CLEAR ?auto_51548 ) ( not ( = ?auto_51547 ?auto_51558 ) ) ( not ( = ?auto_51548 ?auto_51558 ) ) ( not ( = ?auto_51551 ?auto_51558 ) ) ( not ( = ?auto_51554 ?auto_51558 ) ) )
    :subtasks
    ( ( !LIFT ?auto_51552 ?auto_51548 ?auto_51558 ?auto_51549 )
      ( MAKE-ON ?auto_51547 ?auto_51548 )
      ( MAKE-ON-VERIFY ?auto_51547 ?auto_51548 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51559 - SURFACE
      ?auto_51560 - SURFACE
    )
    :vars
    (
      ?auto_51561 - HOIST
      ?auto_51567 - PLACE
      ?auto_51563 - PLACE
      ?auto_51570 - HOIST
      ?auto_51569 - SURFACE
      ?auto_51568 - SURFACE
      ?auto_51562 - PLACE
      ?auto_51565 - HOIST
      ?auto_51566 - SURFACE
      ?auto_51564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51561 ?auto_51567 ) ( IS-CRATE ?auto_51559 ) ( not ( = ?auto_51559 ?auto_51560 ) ) ( not ( = ?auto_51563 ?auto_51567 ) ) ( HOIST-AT ?auto_51570 ?auto_51563 ) ( not ( = ?auto_51561 ?auto_51570 ) ) ( AVAILABLE ?auto_51570 ) ( SURFACE-AT ?auto_51559 ?auto_51563 ) ( ON ?auto_51559 ?auto_51569 ) ( CLEAR ?auto_51559 ) ( not ( = ?auto_51559 ?auto_51569 ) ) ( not ( = ?auto_51560 ?auto_51569 ) ) ( SURFACE-AT ?auto_51568 ?auto_51567 ) ( CLEAR ?auto_51568 ) ( IS-CRATE ?auto_51560 ) ( not ( = ?auto_51559 ?auto_51568 ) ) ( not ( = ?auto_51560 ?auto_51568 ) ) ( not ( = ?auto_51569 ?auto_51568 ) ) ( AVAILABLE ?auto_51561 ) ( not ( = ?auto_51562 ?auto_51567 ) ) ( not ( = ?auto_51563 ?auto_51562 ) ) ( HOIST-AT ?auto_51565 ?auto_51562 ) ( not ( = ?auto_51561 ?auto_51565 ) ) ( not ( = ?auto_51570 ?auto_51565 ) ) ( AVAILABLE ?auto_51565 ) ( SURFACE-AT ?auto_51560 ?auto_51562 ) ( ON ?auto_51560 ?auto_51566 ) ( CLEAR ?auto_51560 ) ( not ( = ?auto_51559 ?auto_51566 ) ) ( not ( = ?auto_51560 ?auto_51566 ) ) ( not ( = ?auto_51569 ?auto_51566 ) ) ( not ( = ?auto_51568 ?auto_51566 ) ) ( TRUCK-AT ?auto_51564 ?auto_51567 ) )
    :subtasks
    ( ( !DRIVE ?auto_51564 ?auto_51567 ?auto_51562 )
      ( MAKE-ON ?auto_51559 ?auto_51560 )
      ( MAKE-ON-VERIFY ?auto_51559 ?auto_51560 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51571 - SURFACE
      ?auto_51572 - SURFACE
    )
    :vars
    (
      ?auto_51582 - HOIST
      ?auto_51577 - PLACE
      ?auto_51579 - PLACE
      ?auto_51580 - HOIST
      ?auto_51575 - SURFACE
      ?auto_51578 - SURFACE
      ?auto_51581 - PLACE
      ?auto_51576 - HOIST
      ?auto_51574 - SURFACE
      ?auto_51573 - TRUCK
      ?auto_51583 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51582 ?auto_51577 ) ( IS-CRATE ?auto_51571 ) ( not ( = ?auto_51571 ?auto_51572 ) ) ( not ( = ?auto_51579 ?auto_51577 ) ) ( HOIST-AT ?auto_51580 ?auto_51579 ) ( not ( = ?auto_51582 ?auto_51580 ) ) ( AVAILABLE ?auto_51580 ) ( SURFACE-AT ?auto_51571 ?auto_51579 ) ( ON ?auto_51571 ?auto_51575 ) ( CLEAR ?auto_51571 ) ( not ( = ?auto_51571 ?auto_51575 ) ) ( not ( = ?auto_51572 ?auto_51575 ) ) ( IS-CRATE ?auto_51572 ) ( not ( = ?auto_51571 ?auto_51578 ) ) ( not ( = ?auto_51572 ?auto_51578 ) ) ( not ( = ?auto_51575 ?auto_51578 ) ) ( not ( = ?auto_51581 ?auto_51577 ) ) ( not ( = ?auto_51579 ?auto_51581 ) ) ( HOIST-AT ?auto_51576 ?auto_51581 ) ( not ( = ?auto_51582 ?auto_51576 ) ) ( not ( = ?auto_51580 ?auto_51576 ) ) ( AVAILABLE ?auto_51576 ) ( SURFACE-AT ?auto_51572 ?auto_51581 ) ( ON ?auto_51572 ?auto_51574 ) ( CLEAR ?auto_51572 ) ( not ( = ?auto_51571 ?auto_51574 ) ) ( not ( = ?auto_51572 ?auto_51574 ) ) ( not ( = ?auto_51575 ?auto_51574 ) ) ( not ( = ?auto_51578 ?auto_51574 ) ) ( TRUCK-AT ?auto_51573 ?auto_51577 ) ( SURFACE-AT ?auto_51583 ?auto_51577 ) ( CLEAR ?auto_51583 ) ( LIFTING ?auto_51582 ?auto_51578 ) ( IS-CRATE ?auto_51578 ) ( not ( = ?auto_51571 ?auto_51583 ) ) ( not ( = ?auto_51572 ?auto_51583 ) ) ( not ( = ?auto_51575 ?auto_51583 ) ) ( not ( = ?auto_51578 ?auto_51583 ) ) ( not ( = ?auto_51574 ?auto_51583 ) ) )
    :subtasks
    ( ( !DROP ?auto_51582 ?auto_51578 ?auto_51583 ?auto_51577 )
      ( MAKE-ON ?auto_51571 ?auto_51572 )
      ( MAKE-ON-VERIFY ?auto_51571 ?auto_51572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51584 - SURFACE
      ?auto_51585 - SURFACE
    )
    :vars
    (
      ?auto_51591 - HOIST
      ?auto_51596 - PLACE
      ?auto_51592 - PLACE
      ?auto_51590 - HOIST
      ?auto_51587 - SURFACE
      ?auto_51588 - SURFACE
      ?auto_51586 - PLACE
      ?auto_51594 - HOIST
      ?auto_51595 - SURFACE
      ?auto_51593 - TRUCK
      ?auto_51589 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51591 ?auto_51596 ) ( IS-CRATE ?auto_51584 ) ( not ( = ?auto_51584 ?auto_51585 ) ) ( not ( = ?auto_51592 ?auto_51596 ) ) ( HOIST-AT ?auto_51590 ?auto_51592 ) ( not ( = ?auto_51591 ?auto_51590 ) ) ( AVAILABLE ?auto_51590 ) ( SURFACE-AT ?auto_51584 ?auto_51592 ) ( ON ?auto_51584 ?auto_51587 ) ( CLEAR ?auto_51584 ) ( not ( = ?auto_51584 ?auto_51587 ) ) ( not ( = ?auto_51585 ?auto_51587 ) ) ( IS-CRATE ?auto_51585 ) ( not ( = ?auto_51584 ?auto_51588 ) ) ( not ( = ?auto_51585 ?auto_51588 ) ) ( not ( = ?auto_51587 ?auto_51588 ) ) ( not ( = ?auto_51586 ?auto_51596 ) ) ( not ( = ?auto_51592 ?auto_51586 ) ) ( HOIST-AT ?auto_51594 ?auto_51586 ) ( not ( = ?auto_51591 ?auto_51594 ) ) ( not ( = ?auto_51590 ?auto_51594 ) ) ( AVAILABLE ?auto_51594 ) ( SURFACE-AT ?auto_51585 ?auto_51586 ) ( ON ?auto_51585 ?auto_51595 ) ( CLEAR ?auto_51585 ) ( not ( = ?auto_51584 ?auto_51595 ) ) ( not ( = ?auto_51585 ?auto_51595 ) ) ( not ( = ?auto_51587 ?auto_51595 ) ) ( not ( = ?auto_51588 ?auto_51595 ) ) ( TRUCK-AT ?auto_51593 ?auto_51596 ) ( SURFACE-AT ?auto_51589 ?auto_51596 ) ( CLEAR ?auto_51589 ) ( IS-CRATE ?auto_51588 ) ( not ( = ?auto_51584 ?auto_51589 ) ) ( not ( = ?auto_51585 ?auto_51589 ) ) ( not ( = ?auto_51587 ?auto_51589 ) ) ( not ( = ?auto_51588 ?auto_51589 ) ) ( not ( = ?auto_51595 ?auto_51589 ) ) ( AVAILABLE ?auto_51591 ) ( IN ?auto_51588 ?auto_51593 ) )
    :subtasks
    ( ( !UNLOAD ?auto_51591 ?auto_51588 ?auto_51593 ?auto_51596 )
      ( MAKE-ON ?auto_51584 ?auto_51585 )
      ( MAKE-ON-VERIFY ?auto_51584 ?auto_51585 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51597 - SURFACE
      ?auto_51598 - SURFACE
    )
    :vars
    (
      ?auto_51599 - HOIST
      ?auto_51608 - PLACE
      ?auto_51605 - PLACE
      ?auto_51602 - HOIST
      ?auto_51606 - SURFACE
      ?auto_51607 - SURFACE
      ?auto_51601 - PLACE
      ?auto_51609 - HOIST
      ?auto_51604 - SURFACE
      ?auto_51600 - SURFACE
      ?auto_51603 - TRUCK
      ?auto_51610 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51599 ?auto_51608 ) ( IS-CRATE ?auto_51597 ) ( not ( = ?auto_51597 ?auto_51598 ) ) ( not ( = ?auto_51605 ?auto_51608 ) ) ( HOIST-AT ?auto_51602 ?auto_51605 ) ( not ( = ?auto_51599 ?auto_51602 ) ) ( AVAILABLE ?auto_51602 ) ( SURFACE-AT ?auto_51597 ?auto_51605 ) ( ON ?auto_51597 ?auto_51606 ) ( CLEAR ?auto_51597 ) ( not ( = ?auto_51597 ?auto_51606 ) ) ( not ( = ?auto_51598 ?auto_51606 ) ) ( IS-CRATE ?auto_51598 ) ( not ( = ?auto_51597 ?auto_51607 ) ) ( not ( = ?auto_51598 ?auto_51607 ) ) ( not ( = ?auto_51606 ?auto_51607 ) ) ( not ( = ?auto_51601 ?auto_51608 ) ) ( not ( = ?auto_51605 ?auto_51601 ) ) ( HOIST-AT ?auto_51609 ?auto_51601 ) ( not ( = ?auto_51599 ?auto_51609 ) ) ( not ( = ?auto_51602 ?auto_51609 ) ) ( AVAILABLE ?auto_51609 ) ( SURFACE-AT ?auto_51598 ?auto_51601 ) ( ON ?auto_51598 ?auto_51604 ) ( CLEAR ?auto_51598 ) ( not ( = ?auto_51597 ?auto_51604 ) ) ( not ( = ?auto_51598 ?auto_51604 ) ) ( not ( = ?auto_51606 ?auto_51604 ) ) ( not ( = ?auto_51607 ?auto_51604 ) ) ( SURFACE-AT ?auto_51600 ?auto_51608 ) ( CLEAR ?auto_51600 ) ( IS-CRATE ?auto_51607 ) ( not ( = ?auto_51597 ?auto_51600 ) ) ( not ( = ?auto_51598 ?auto_51600 ) ) ( not ( = ?auto_51606 ?auto_51600 ) ) ( not ( = ?auto_51607 ?auto_51600 ) ) ( not ( = ?auto_51604 ?auto_51600 ) ) ( AVAILABLE ?auto_51599 ) ( IN ?auto_51607 ?auto_51603 ) ( TRUCK-AT ?auto_51603 ?auto_51610 ) ( not ( = ?auto_51610 ?auto_51608 ) ) ( not ( = ?auto_51605 ?auto_51610 ) ) ( not ( = ?auto_51601 ?auto_51610 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_51603 ?auto_51610 ?auto_51608 )
      ( MAKE-ON ?auto_51597 ?auto_51598 )
      ( MAKE-ON-VERIFY ?auto_51597 ?auto_51598 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51611 - SURFACE
      ?auto_51612 - SURFACE
    )
    :vars
    (
      ?auto_51617 - HOIST
      ?auto_51623 - PLACE
      ?auto_51614 - PLACE
      ?auto_51615 - HOIST
      ?auto_51622 - SURFACE
      ?auto_51619 - SURFACE
      ?auto_51624 - PLACE
      ?auto_51616 - HOIST
      ?auto_51621 - SURFACE
      ?auto_51618 - SURFACE
      ?auto_51620 - TRUCK
      ?auto_51613 - PLACE
      ?auto_51625 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_51617 ?auto_51623 ) ( IS-CRATE ?auto_51611 ) ( not ( = ?auto_51611 ?auto_51612 ) ) ( not ( = ?auto_51614 ?auto_51623 ) ) ( HOIST-AT ?auto_51615 ?auto_51614 ) ( not ( = ?auto_51617 ?auto_51615 ) ) ( AVAILABLE ?auto_51615 ) ( SURFACE-AT ?auto_51611 ?auto_51614 ) ( ON ?auto_51611 ?auto_51622 ) ( CLEAR ?auto_51611 ) ( not ( = ?auto_51611 ?auto_51622 ) ) ( not ( = ?auto_51612 ?auto_51622 ) ) ( IS-CRATE ?auto_51612 ) ( not ( = ?auto_51611 ?auto_51619 ) ) ( not ( = ?auto_51612 ?auto_51619 ) ) ( not ( = ?auto_51622 ?auto_51619 ) ) ( not ( = ?auto_51624 ?auto_51623 ) ) ( not ( = ?auto_51614 ?auto_51624 ) ) ( HOIST-AT ?auto_51616 ?auto_51624 ) ( not ( = ?auto_51617 ?auto_51616 ) ) ( not ( = ?auto_51615 ?auto_51616 ) ) ( AVAILABLE ?auto_51616 ) ( SURFACE-AT ?auto_51612 ?auto_51624 ) ( ON ?auto_51612 ?auto_51621 ) ( CLEAR ?auto_51612 ) ( not ( = ?auto_51611 ?auto_51621 ) ) ( not ( = ?auto_51612 ?auto_51621 ) ) ( not ( = ?auto_51622 ?auto_51621 ) ) ( not ( = ?auto_51619 ?auto_51621 ) ) ( SURFACE-AT ?auto_51618 ?auto_51623 ) ( CLEAR ?auto_51618 ) ( IS-CRATE ?auto_51619 ) ( not ( = ?auto_51611 ?auto_51618 ) ) ( not ( = ?auto_51612 ?auto_51618 ) ) ( not ( = ?auto_51622 ?auto_51618 ) ) ( not ( = ?auto_51619 ?auto_51618 ) ) ( not ( = ?auto_51621 ?auto_51618 ) ) ( AVAILABLE ?auto_51617 ) ( TRUCK-AT ?auto_51620 ?auto_51613 ) ( not ( = ?auto_51613 ?auto_51623 ) ) ( not ( = ?auto_51614 ?auto_51613 ) ) ( not ( = ?auto_51624 ?auto_51613 ) ) ( HOIST-AT ?auto_51625 ?auto_51613 ) ( LIFTING ?auto_51625 ?auto_51619 ) ( not ( = ?auto_51617 ?auto_51625 ) ) ( not ( = ?auto_51615 ?auto_51625 ) ) ( not ( = ?auto_51616 ?auto_51625 ) ) )
    :subtasks
    ( ( !LOAD ?auto_51625 ?auto_51619 ?auto_51620 ?auto_51613 )
      ( MAKE-ON ?auto_51611 ?auto_51612 )
      ( MAKE-ON-VERIFY ?auto_51611 ?auto_51612 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51626 - SURFACE
      ?auto_51627 - SURFACE
    )
    :vars
    (
      ?auto_51635 - HOIST
      ?auto_51629 - PLACE
      ?auto_51637 - PLACE
      ?auto_51628 - HOIST
      ?auto_51634 - SURFACE
      ?auto_51632 - SURFACE
      ?auto_51630 - PLACE
      ?auto_51636 - HOIST
      ?auto_51633 - SURFACE
      ?auto_51639 - SURFACE
      ?auto_51640 - TRUCK
      ?auto_51638 - PLACE
      ?auto_51631 - HOIST
      ?auto_51641 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51635 ?auto_51629 ) ( IS-CRATE ?auto_51626 ) ( not ( = ?auto_51626 ?auto_51627 ) ) ( not ( = ?auto_51637 ?auto_51629 ) ) ( HOIST-AT ?auto_51628 ?auto_51637 ) ( not ( = ?auto_51635 ?auto_51628 ) ) ( AVAILABLE ?auto_51628 ) ( SURFACE-AT ?auto_51626 ?auto_51637 ) ( ON ?auto_51626 ?auto_51634 ) ( CLEAR ?auto_51626 ) ( not ( = ?auto_51626 ?auto_51634 ) ) ( not ( = ?auto_51627 ?auto_51634 ) ) ( IS-CRATE ?auto_51627 ) ( not ( = ?auto_51626 ?auto_51632 ) ) ( not ( = ?auto_51627 ?auto_51632 ) ) ( not ( = ?auto_51634 ?auto_51632 ) ) ( not ( = ?auto_51630 ?auto_51629 ) ) ( not ( = ?auto_51637 ?auto_51630 ) ) ( HOIST-AT ?auto_51636 ?auto_51630 ) ( not ( = ?auto_51635 ?auto_51636 ) ) ( not ( = ?auto_51628 ?auto_51636 ) ) ( AVAILABLE ?auto_51636 ) ( SURFACE-AT ?auto_51627 ?auto_51630 ) ( ON ?auto_51627 ?auto_51633 ) ( CLEAR ?auto_51627 ) ( not ( = ?auto_51626 ?auto_51633 ) ) ( not ( = ?auto_51627 ?auto_51633 ) ) ( not ( = ?auto_51634 ?auto_51633 ) ) ( not ( = ?auto_51632 ?auto_51633 ) ) ( SURFACE-AT ?auto_51639 ?auto_51629 ) ( CLEAR ?auto_51639 ) ( IS-CRATE ?auto_51632 ) ( not ( = ?auto_51626 ?auto_51639 ) ) ( not ( = ?auto_51627 ?auto_51639 ) ) ( not ( = ?auto_51634 ?auto_51639 ) ) ( not ( = ?auto_51632 ?auto_51639 ) ) ( not ( = ?auto_51633 ?auto_51639 ) ) ( AVAILABLE ?auto_51635 ) ( TRUCK-AT ?auto_51640 ?auto_51638 ) ( not ( = ?auto_51638 ?auto_51629 ) ) ( not ( = ?auto_51637 ?auto_51638 ) ) ( not ( = ?auto_51630 ?auto_51638 ) ) ( HOIST-AT ?auto_51631 ?auto_51638 ) ( not ( = ?auto_51635 ?auto_51631 ) ) ( not ( = ?auto_51628 ?auto_51631 ) ) ( not ( = ?auto_51636 ?auto_51631 ) ) ( AVAILABLE ?auto_51631 ) ( SURFACE-AT ?auto_51632 ?auto_51638 ) ( ON ?auto_51632 ?auto_51641 ) ( CLEAR ?auto_51632 ) ( not ( = ?auto_51626 ?auto_51641 ) ) ( not ( = ?auto_51627 ?auto_51641 ) ) ( not ( = ?auto_51634 ?auto_51641 ) ) ( not ( = ?auto_51632 ?auto_51641 ) ) ( not ( = ?auto_51633 ?auto_51641 ) ) ( not ( = ?auto_51639 ?auto_51641 ) ) )
    :subtasks
    ( ( !LIFT ?auto_51631 ?auto_51632 ?auto_51641 ?auto_51638 )
      ( MAKE-ON ?auto_51626 ?auto_51627 )
      ( MAKE-ON-VERIFY ?auto_51626 ?auto_51627 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51642 - SURFACE
      ?auto_51643 - SURFACE
    )
    :vars
    (
      ?auto_51646 - HOIST
      ?auto_51651 - PLACE
      ?auto_51655 - PLACE
      ?auto_51653 - HOIST
      ?auto_51648 - SURFACE
      ?auto_51644 - SURFACE
      ?auto_51650 - PLACE
      ?auto_51654 - HOIST
      ?auto_51656 - SURFACE
      ?auto_51657 - SURFACE
      ?auto_51645 - PLACE
      ?auto_51649 - HOIST
      ?auto_51652 - SURFACE
      ?auto_51647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51646 ?auto_51651 ) ( IS-CRATE ?auto_51642 ) ( not ( = ?auto_51642 ?auto_51643 ) ) ( not ( = ?auto_51655 ?auto_51651 ) ) ( HOIST-AT ?auto_51653 ?auto_51655 ) ( not ( = ?auto_51646 ?auto_51653 ) ) ( AVAILABLE ?auto_51653 ) ( SURFACE-AT ?auto_51642 ?auto_51655 ) ( ON ?auto_51642 ?auto_51648 ) ( CLEAR ?auto_51642 ) ( not ( = ?auto_51642 ?auto_51648 ) ) ( not ( = ?auto_51643 ?auto_51648 ) ) ( IS-CRATE ?auto_51643 ) ( not ( = ?auto_51642 ?auto_51644 ) ) ( not ( = ?auto_51643 ?auto_51644 ) ) ( not ( = ?auto_51648 ?auto_51644 ) ) ( not ( = ?auto_51650 ?auto_51651 ) ) ( not ( = ?auto_51655 ?auto_51650 ) ) ( HOIST-AT ?auto_51654 ?auto_51650 ) ( not ( = ?auto_51646 ?auto_51654 ) ) ( not ( = ?auto_51653 ?auto_51654 ) ) ( AVAILABLE ?auto_51654 ) ( SURFACE-AT ?auto_51643 ?auto_51650 ) ( ON ?auto_51643 ?auto_51656 ) ( CLEAR ?auto_51643 ) ( not ( = ?auto_51642 ?auto_51656 ) ) ( not ( = ?auto_51643 ?auto_51656 ) ) ( not ( = ?auto_51648 ?auto_51656 ) ) ( not ( = ?auto_51644 ?auto_51656 ) ) ( SURFACE-AT ?auto_51657 ?auto_51651 ) ( CLEAR ?auto_51657 ) ( IS-CRATE ?auto_51644 ) ( not ( = ?auto_51642 ?auto_51657 ) ) ( not ( = ?auto_51643 ?auto_51657 ) ) ( not ( = ?auto_51648 ?auto_51657 ) ) ( not ( = ?auto_51644 ?auto_51657 ) ) ( not ( = ?auto_51656 ?auto_51657 ) ) ( AVAILABLE ?auto_51646 ) ( not ( = ?auto_51645 ?auto_51651 ) ) ( not ( = ?auto_51655 ?auto_51645 ) ) ( not ( = ?auto_51650 ?auto_51645 ) ) ( HOIST-AT ?auto_51649 ?auto_51645 ) ( not ( = ?auto_51646 ?auto_51649 ) ) ( not ( = ?auto_51653 ?auto_51649 ) ) ( not ( = ?auto_51654 ?auto_51649 ) ) ( AVAILABLE ?auto_51649 ) ( SURFACE-AT ?auto_51644 ?auto_51645 ) ( ON ?auto_51644 ?auto_51652 ) ( CLEAR ?auto_51644 ) ( not ( = ?auto_51642 ?auto_51652 ) ) ( not ( = ?auto_51643 ?auto_51652 ) ) ( not ( = ?auto_51648 ?auto_51652 ) ) ( not ( = ?auto_51644 ?auto_51652 ) ) ( not ( = ?auto_51656 ?auto_51652 ) ) ( not ( = ?auto_51657 ?auto_51652 ) ) ( TRUCK-AT ?auto_51647 ?auto_51651 ) )
    :subtasks
    ( ( !DRIVE ?auto_51647 ?auto_51651 ?auto_51645 )
      ( MAKE-ON ?auto_51642 ?auto_51643 )
      ( MAKE-ON-VERIFY ?auto_51642 ?auto_51643 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51658 - SURFACE
      ?auto_51659 - SURFACE
    )
    :vars
    (
      ?auto_51669 - HOIST
      ?auto_51662 - PLACE
      ?auto_51667 - PLACE
      ?auto_51664 - HOIST
      ?auto_51665 - SURFACE
      ?auto_51673 - SURFACE
      ?auto_51670 - PLACE
      ?auto_51663 - HOIST
      ?auto_51668 - SURFACE
      ?auto_51661 - SURFACE
      ?auto_51660 - PLACE
      ?auto_51671 - HOIST
      ?auto_51672 - SURFACE
      ?auto_51666 - TRUCK
      ?auto_51674 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51669 ?auto_51662 ) ( IS-CRATE ?auto_51658 ) ( not ( = ?auto_51658 ?auto_51659 ) ) ( not ( = ?auto_51667 ?auto_51662 ) ) ( HOIST-AT ?auto_51664 ?auto_51667 ) ( not ( = ?auto_51669 ?auto_51664 ) ) ( AVAILABLE ?auto_51664 ) ( SURFACE-AT ?auto_51658 ?auto_51667 ) ( ON ?auto_51658 ?auto_51665 ) ( CLEAR ?auto_51658 ) ( not ( = ?auto_51658 ?auto_51665 ) ) ( not ( = ?auto_51659 ?auto_51665 ) ) ( IS-CRATE ?auto_51659 ) ( not ( = ?auto_51658 ?auto_51673 ) ) ( not ( = ?auto_51659 ?auto_51673 ) ) ( not ( = ?auto_51665 ?auto_51673 ) ) ( not ( = ?auto_51670 ?auto_51662 ) ) ( not ( = ?auto_51667 ?auto_51670 ) ) ( HOIST-AT ?auto_51663 ?auto_51670 ) ( not ( = ?auto_51669 ?auto_51663 ) ) ( not ( = ?auto_51664 ?auto_51663 ) ) ( AVAILABLE ?auto_51663 ) ( SURFACE-AT ?auto_51659 ?auto_51670 ) ( ON ?auto_51659 ?auto_51668 ) ( CLEAR ?auto_51659 ) ( not ( = ?auto_51658 ?auto_51668 ) ) ( not ( = ?auto_51659 ?auto_51668 ) ) ( not ( = ?auto_51665 ?auto_51668 ) ) ( not ( = ?auto_51673 ?auto_51668 ) ) ( IS-CRATE ?auto_51673 ) ( not ( = ?auto_51658 ?auto_51661 ) ) ( not ( = ?auto_51659 ?auto_51661 ) ) ( not ( = ?auto_51665 ?auto_51661 ) ) ( not ( = ?auto_51673 ?auto_51661 ) ) ( not ( = ?auto_51668 ?auto_51661 ) ) ( not ( = ?auto_51660 ?auto_51662 ) ) ( not ( = ?auto_51667 ?auto_51660 ) ) ( not ( = ?auto_51670 ?auto_51660 ) ) ( HOIST-AT ?auto_51671 ?auto_51660 ) ( not ( = ?auto_51669 ?auto_51671 ) ) ( not ( = ?auto_51664 ?auto_51671 ) ) ( not ( = ?auto_51663 ?auto_51671 ) ) ( AVAILABLE ?auto_51671 ) ( SURFACE-AT ?auto_51673 ?auto_51660 ) ( ON ?auto_51673 ?auto_51672 ) ( CLEAR ?auto_51673 ) ( not ( = ?auto_51658 ?auto_51672 ) ) ( not ( = ?auto_51659 ?auto_51672 ) ) ( not ( = ?auto_51665 ?auto_51672 ) ) ( not ( = ?auto_51673 ?auto_51672 ) ) ( not ( = ?auto_51668 ?auto_51672 ) ) ( not ( = ?auto_51661 ?auto_51672 ) ) ( TRUCK-AT ?auto_51666 ?auto_51662 ) ( SURFACE-AT ?auto_51674 ?auto_51662 ) ( CLEAR ?auto_51674 ) ( LIFTING ?auto_51669 ?auto_51661 ) ( IS-CRATE ?auto_51661 ) ( not ( = ?auto_51658 ?auto_51674 ) ) ( not ( = ?auto_51659 ?auto_51674 ) ) ( not ( = ?auto_51665 ?auto_51674 ) ) ( not ( = ?auto_51673 ?auto_51674 ) ) ( not ( = ?auto_51668 ?auto_51674 ) ) ( not ( = ?auto_51661 ?auto_51674 ) ) ( not ( = ?auto_51672 ?auto_51674 ) ) )
    :subtasks
    ( ( !DROP ?auto_51669 ?auto_51661 ?auto_51674 ?auto_51662 )
      ( MAKE-ON ?auto_51658 ?auto_51659 )
      ( MAKE-ON-VERIFY ?auto_51658 ?auto_51659 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51675 - SURFACE
      ?auto_51676 - SURFACE
    )
    :vars
    (
      ?auto_51679 - HOIST
      ?auto_51677 - PLACE
      ?auto_51683 - PLACE
      ?auto_51680 - HOIST
      ?auto_51687 - SURFACE
      ?auto_51688 - SURFACE
      ?auto_51682 - PLACE
      ?auto_51690 - HOIST
      ?auto_51685 - SURFACE
      ?auto_51689 - SURFACE
      ?auto_51678 - PLACE
      ?auto_51686 - HOIST
      ?auto_51691 - SURFACE
      ?auto_51681 - TRUCK
      ?auto_51684 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51679 ?auto_51677 ) ( IS-CRATE ?auto_51675 ) ( not ( = ?auto_51675 ?auto_51676 ) ) ( not ( = ?auto_51683 ?auto_51677 ) ) ( HOIST-AT ?auto_51680 ?auto_51683 ) ( not ( = ?auto_51679 ?auto_51680 ) ) ( AVAILABLE ?auto_51680 ) ( SURFACE-AT ?auto_51675 ?auto_51683 ) ( ON ?auto_51675 ?auto_51687 ) ( CLEAR ?auto_51675 ) ( not ( = ?auto_51675 ?auto_51687 ) ) ( not ( = ?auto_51676 ?auto_51687 ) ) ( IS-CRATE ?auto_51676 ) ( not ( = ?auto_51675 ?auto_51688 ) ) ( not ( = ?auto_51676 ?auto_51688 ) ) ( not ( = ?auto_51687 ?auto_51688 ) ) ( not ( = ?auto_51682 ?auto_51677 ) ) ( not ( = ?auto_51683 ?auto_51682 ) ) ( HOIST-AT ?auto_51690 ?auto_51682 ) ( not ( = ?auto_51679 ?auto_51690 ) ) ( not ( = ?auto_51680 ?auto_51690 ) ) ( AVAILABLE ?auto_51690 ) ( SURFACE-AT ?auto_51676 ?auto_51682 ) ( ON ?auto_51676 ?auto_51685 ) ( CLEAR ?auto_51676 ) ( not ( = ?auto_51675 ?auto_51685 ) ) ( not ( = ?auto_51676 ?auto_51685 ) ) ( not ( = ?auto_51687 ?auto_51685 ) ) ( not ( = ?auto_51688 ?auto_51685 ) ) ( IS-CRATE ?auto_51688 ) ( not ( = ?auto_51675 ?auto_51689 ) ) ( not ( = ?auto_51676 ?auto_51689 ) ) ( not ( = ?auto_51687 ?auto_51689 ) ) ( not ( = ?auto_51688 ?auto_51689 ) ) ( not ( = ?auto_51685 ?auto_51689 ) ) ( not ( = ?auto_51678 ?auto_51677 ) ) ( not ( = ?auto_51683 ?auto_51678 ) ) ( not ( = ?auto_51682 ?auto_51678 ) ) ( HOIST-AT ?auto_51686 ?auto_51678 ) ( not ( = ?auto_51679 ?auto_51686 ) ) ( not ( = ?auto_51680 ?auto_51686 ) ) ( not ( = ?auto_51690 ?auto_51686 ) ) ( AVAILABLE ?auto_51686 ) ( SURFACE-AT ?auto_51688 ?auto_51678 ) ( ON ?auto_51688 ?auto_51691 ) ( CLEAR ?auto_51688 ) ( not ( = ?auto_51675 ?auto_51691 ) ) ( not ( = ?auto_51676 ?auto_51691 ) ) ( not ( = ?auto_51687 ?auto_51691 ) ) ( not ( = ?auto_51688 ?auto_51691 ) ) ( not ( = ?auto_51685 ?auto_51691 ) ) ( not ( = ?auto_51689 ?auto_51691 ) ) ( TRUCK-AT ?auto_51681 ?auto_51677 ) ( SURFACE-AT ?auto_51684 ?auto_51677 ) ( CLEAR ?auto_51684 ) ( IS-CRATE ?auto_51689 ) ( not ( = ?auto_51675 ?auto_51684 ) ) ( not ( = ?auto_51676 ?auto_51684 ) ) ( not ( = ?auto_51687 ?auto_51684 ) ) ( not ( = ?auto_51688 ?auto_51684 ) ) ( not ( = ?auto_51685 ?auto_51684 ) ) ( not ( = ?auto_51689 ?auto_51684 ) ) ( not ( = ?auto_51691 ?auto_51684 ) ) ( AVAILABLE ?auto_51679 ) ( IN ?auto_51689 ?auto_51681 ) )
    :subtasks
    ( ( !UNLOAD ?auto_51679 ?auto_51689 ?auto_51681 ?auto_51677 )
      ( MAKE-ON ?auto_51675 ?auto_51676 )
      ( MAKE-ON-VERIFY ?auto_51675 ?auto_51676 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51692 - SURFACE
      ?auto_51693 - SURFACE
    )
    :vars
    (
      ?auto_51698 - HOIST
      ?auto_51706 - PLACE
      ?auto_51697 - PLACE
      ?auto_51707 - HOIST
      ?auto_51708 - SURFACE
      ?auto_51703 - SURFACE
      ?auto_51699 - PLACE
      ?auto_51705 - HOIST
      ?auto_51695 - SURFACE
      ?auto_51696 - SURFACE
      ?auto_51694 - PLACE
      ?auto_51700 - HOIST
      ?auto_51702 - SURFACE
      ?auto_51704 - SURFACE
      ?auto_51701 - TRUCK
      ?auto_51709 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51698 ?auto_51706 ) ( IS-CRATE ?auto_51692 ) ( not ( = ?auto_51692 ?auto_51693 ) ) ( not ( = ?auto_51697 ?auto_51706 ) ) ( HOIST-AT ?auto_51707 ?auto_51697 ) ( not ( = ?auto_51698 ?auto_51707 ) ) ( AVAILABLE ?auto_51707 ) ( SURFACE-AT ?auto_51692 ?auto_51697 ) ( ON ?auto_51692 ?auto_51708 ) ( CLEAR ?auto_51692 ) ( not ( = ?auto_51692 ?auto_51708 ) ) ( not ( = ?auto_51693 ?auto_51708 ) ) ( IS-CRATE ?auto_51693 ) ( not ( = ?auto_51692 ?auto_51703 ) ) ( not ( = ?auto_51693 ?auto_51703 ) ) ( not ( = ?auto_51708 ?auto_51703 ) ) ( not ( = ?auto_51699 ?auto_51706 ) ) ( not ( = ?auto_51697 ?auto_51699 ) ) ( HOIST-AT ?auto_51705 ?auto_51699 ) ( not ( = ?auto_51698 ?auto_51705 ) ) ( not ( = ?auto_51707 ?auto_51705 ) ) ( AVAILABLE ?auto_51705 ) ( SURFACE-AT ?auto_51693 ?auto_51699 ) ( ON ?auto_51693 ?auto_51695 ) ( CLEAR ?auto_51693 ) ( not ( = ?auto_51692 ?auto_51695 ) ) ( not ( = ?auto_51693 ?auto_51695 ) ) ( not ( = ?auto_51708 ?auto_51695 ) ) ( not ( = ?auto_51703 ?auto_51695 ) ) ( IS-CRATE ?auto_51703 ) ( not ( = ?auto_51692 ?auto_51696 ) ) ( not ( = ?auto_51693 ?auto_51696 ) ) ( not ( = ?auto_51708 ?auto_51696 ) ) ( not ( = ?auto_51703 ?auto_51696 ) ) ( not ( = ?auto_51695 ?auto_51696 ) ) ( not ( = ?auto_51694 ?auto_51706 ) ) ( not ( = ?auto_51697 ?auto_51694 ) ) ( not ( = ?auto_51699 ?auto_51694 ) ) ( HOIST-AT ?auto_51700 ?auto_51694 ) ( not ( = ?auto_51698 ?auto_51700 ) ) ( not ( = ?auto_51707 ?auto_51700 ) ) ( not ( = ?auto_51705 ?auto_51700 ) ) ( AVAILABLE ?auto_51700 ) ( SURFACE-AT ?auto_51703 ?auto_51694 ) ( ON ?auto_51703 ?auto_51702 ) ( CLEAR ?auto_51703 ) ( not ( = ?auto_51692 ?auto_51702 ) ) ( not ( = ?auto_51693 ?auto_51702 ) ) ( not ( = ?auto_51708 ?auto_51702 ) ) ( not ( = ?auto_51703 ?auto_51702 ) ) ( not ( = ?auto_51695 ?auto_51702 ) ) ( not ( = ?auto_51696 ?auto_51702 ) ) ( SURFACE-AT ?auto_51704 ?auto_51706 ) ( CLEAR ?auto_51704 ) ( IS-CRATE ?auto_51696 ) ( not ( = ?auto_51692 ?auto_51704 ) ) ( not ( = ?auto_51693 ?auto_51704 ) ) ( not ( = ?auto_51708 ?auto_51704 ) ) ( not ( = ?auto_51703 ?auto_51704 ) ) ( not ( = ?auto_51695 ?auto_51704 ) ) ( not ( = ?auto_51696 ?auto_51704 ) ) ( not ( = ?auto_51702 ?auto_51704 ) ) ( AVAILABLE ?auto_51698 ) ( IN ?auto_51696 ?auto_51701 ) ( TRUCK-AT ?auto_51701 ?auto_51709 ) ( not ( = ?auto_51709 ?auto_51706 ) ) ( not ( = ?auto_51697 ?auto_51709 ) ) ( not ( = ?auto_51699 ?auto_51709 ) ) ( not ( = ?auto_51694 ?auto_51709 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_51701 ?auto_51709 ?auto_51706 )
      ( MAKE-ON ?auto_51692 ?auto_51693 )
      ( MAKE-ON-VERIFY ?auto_51692 ?auto_51693 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51710 - SURFACE
      ?auto_51711 - SURFACE
    )
    :vars
    (
      ?auto_51726 - HOIST
      ?auto_51720 - PLACE
      ?auto_51717 - PLACE
      ?auto_51719 - HOIST
      ?auto_51718 - SURFACE
      ?auto_51725 - SURFACE
      ?auto_51723 - PLACE
      ?auto_51727 - HOIST
      ?auto_51724 - SURFACE
      ?auto_51715 - SURFACE
      ?auto_51712 - PLACE
      ?auto_51721 - HOIST
      ?auto_51714 - SURFACE
      ?auto_51716 - SURFACE
      ?auto_51722 - TRUCK
      ?auto_51713 - PLACE
      ?auto_51728 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_51726 ?auto_51720 ) ( IS-CRATE ?auto_51710 ) ( not ( = ?auto_51710 ?auto_51711 ) ) ( not ( = ?auto_51717 ?auto_51720 ) ) ( HOIST-AT ?auto_51719 ?auto_51717 ) ( not ( = ?auto_51726 ?auto_51719 ) ) ( AVAILABLE ?auto_51719 ) ( SURFACE-AT ?auto_51710 ?auto_51717 ) ( ON ?auto_51710 ?auto_51718 ) ( CLEAR ?auto_51710 ) ( not ( = ?auto_51710 ?auto_51718 ) ) ( not ( = ?auto_51711 ?auto_51718 ) ) ( IS-CRATE ?auto_51711 ) ( not ( = ?auto_51710 ?auto_51725 ) ) ( not ( = ?auto_51711 ?auto_51725 ) ) ( not ( = ?auto_51718 ?auto_51725 ) ) ( not ( = ?auto_51723 ?auto_51720 ) ) ( not ( = ?auto_51717 ?auto_51723 ) ) ( HOIST-AT ?auto_51727 ?auto_51723 ) ( not ( = ?auto_51726 ?auto_51727 ) ) ( not ( = ?auto_51719 ?auto_51727 ) ) ( AVAILABLE ?auto_51727 ) ( SURFACE-AT ?auto_51711 ?auto_51723 ) ( ON ?auto_51711 ?auto_51724 ) ( CLEAR ?auto_51711 ) ( not ( = ?auto_51710 ?auto_51724 ) ) ( not ( = ?auto_51711 ?auto_51724 ) ) ( not ( = ?auto_51718 ?auto_51724 ) ) ( not ( = ?auto_51725 ?auto_51724 ) ) ( IS-CRATE ?auto_51725 ) ( not ( = ?auto_51710 ?auto_51715 ) ) ( not ( = ?auto_51711 ?auto_51715 ) ) ( not ( = ?auto_51718 ?auto_51715 ) ) ( not ( = ?auto_51725 ?auto_51715 ) ) ( not ( = ?auto_51724 ?auto_51715 ) ) ( not ( = ?auto_51712 ?auto_51720 ) ) ( not ( = ?auto_51717 ?auto_51712 ) ) ( not ( = ?auto_51723 ?auto_51712 ) ) ( HOIST-AT ?auto_51721 ?auto_51712 ) ( not ( = ?auto_51726 ?auto_51721 ) ) ( not ( = ?auto_51719 ?auto_51721 ) ) ( not ( = ?auto_51727 ?auto_51721 ) ) ( AVAILABLE ?auto_51721 ) ( SURFACE-AT ?auto_51725 ?auto_51712 ) ( ON ?auto_51725 ?auto_51714 ) ( CLEAR ?auto_51725 ) ( not ( = ?auto_51710 ?auto_51714 ) ) ( not ( = ?auto_51711 ?auto_51714 ) ) ( not ( = ?auto_51718 ?auto_51714 ) ) ( not ( = ?auto_51725 ?auto_51714 ) ) ( not ( = ?auto_51724 ?auto_51714 ) ) ( not ( = ?auto_51715 ?auto_51714 ) ) ( SURFACE-AT ?auto_51716 ?auto_51720 ) ( CLEAR ?auto_51716 ) ( IS-CRATE ?auto_51715 ) ( not ( = ?auto_51710 ?auto_51716 ) ) ( not ( = ?auto_51711 ?auto_51716 ) ) ( not ( = ?auto_51718 ?auto_51716 ) ) ( not ( = ?auto_51725 ?auto_51716 ) ) ( not ( = ?auto_51724 ?auto_51716 ) ) ( not ( = ?auto_51715 ?auto_51716 ) ) ( not ( = ?auto_51714 ?auto_51716 ) ) ( AVAILABLE ?auto_51726 ) ( TRUCK-AT ?auto_51722 ?auto_51713 ) ( not ( = ?auto_51713 ?auto_51720 ) ) ( not ( = ?auto_51717 ?auto_51713 ) ) ( not ( = ?auto_51723 ?auto_51713 ) ) ( not ( = ?auto_51712 ?auto_51713 ) ) ( HOIST-AT ?auto_51728 ?auto_51713 ) ( LIFTING ?auto_51728 ?auto_51715 ) ( not ( = ?auto_51726 ?auto_51728 ) ) ( not ( = ?auto_51719 ?auto_51728 ) ) ( not ( = ?auto_51727 ?auto_51728 ) ) ( not ( = ?auto_51721 ?auto_51728 ) ) )
    :subtasks
    ( ( !LOAD ?auto_51728 ?auto_51715 ?auto_51722 ?auto_51713 )
      ( MAKE-ON ?auto_51710 ?auto_51711 )
      ( MAKE-ON-VERIFY ?auto_51710 ?auto_51711 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51729 - SURFACE
      ?auto_51730 - SURFACE
    )
    :vars
    (
      ?auto_51736 - HOIST
      ?auto_51740 - PLACE
      ?auto_51732 - PLACE
      ?auto_51743 - HOIST
      ?auto_51737 - SURFACE
      ?auto_51738 - SURFACE
      ?auto_51735 - PLACE
      ?auto_51746 - HOIST
      ?auto_51741 - SURFACE
      ?auto_51745 - SURFACE
      ?auto_51747 - PLACE
      ?auto_51739 - HOIST
      ?auto_51742 - SURFACE
      ?auto_51731 - SURFACE
      ?auto_51734 - TRUCK
      ?auto_51744 - PLACE
      ?auto_51733 - HOIST
      ?auto_51748 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51736 ?auto_51740 ) ( IS-CRATE ?auto_51729 ) ( not ( = ?auto_51729 ?auto_51730 ) ) ( not ( = ?auto_51732 ?auto_51740 ) ) ( HOIST-AT ?auto_51743 ?auto_51732 ) ( not ( = ?auto_51736 ?auto_51743 ) ) ( AVAILABLE ?auto_51743 ) ( SURFACE-AT ?auto_51729 ?auto_51732 ) ( ON ?auto_51729 ?auto_51737 ) ( CLEAR ?auto_51729 ) ( not ( = ?auto_51729 ?auto_51737 ) ) ( not ( = ?auto_51730 ?auto_51737 ) ) ( IS-CRATE ?auto_51730 ) ( not ( = ?auto_51729 ?auto_51738 ) ) ( not ( = ?auto_51730 ?auto_51738 ) ) ( not ( = ?auto_51737 ?auto_51738 ) ) ( not ( = ?auto_51735 ?auto_51740 ) ) ( not ( = ?auto_51732 ?auto_51735 ) ) ( HOIST-AT ?auto_51746 ?auto_51735 ) ( not ( = ?auto_51736 ?auto_51746 ) ) ( not ( = ?auto_51743 ?auto_51746 ) ) ( AVAILABLE ?auto_51746 ) ( SURFACE-AT ?auto_51730 ?auto_51735 ) ( ON ?auto_51730 ?auto_51741 ) ( CLEAR ?auto_51730 ) ( not ( = ?auto_51729 ?auto_51741 ) ) ( not ( = ?auto_51730 ?auto_51741 ) ) ( not ( = ?auto_51737 ?auto_51741 ) ) ( not ( = ?auto_51738 ?auto_51741 ) ) ( IS-CRATE ?auto_51738 ) ( not ( = ?auto_51729 ?auto_51745 ) ) ( not ( = ?auto_51730 ?auto_51745 ) ) ( not ( = ?auto_51737 ?auto_51745 ) ) ( not ( = ?auto_51738 ?auto_51745 ) ) ( not ( = ?auto_51741 ?auto_51745 ) ) ( not ( = ?auto_51747 ?auto_51740 ) ) ( not ( = ?auto_51732 ?auto_51747 ) ) ( not ( = ?auto_51735 ?auto_51747 ) ) ( HOIST-AT ?auto_51739 ?auto_51747 ) ( not ( = ?auto_51736 ?auto_51739 ) ) ( not ( = ?auto_51743 ?auto_51739 ) ) ( not ( = ?auto_51746 ?auto_51739 ) ) ( AVAILABLE ?auto_51739 ) ( SURFACE-AT ?auto_51738 ?auto_51747 ) ( ON ?auto_51738 ?auto_51742 ) ( CLEAR ?auto_51738 ) ( not ( = ?auto_51729 ?auto_51742 ) ) ( not ( = ?auto_51730 ?auto_51742 ) ) ( not ( = ?auto_51737 ?auto_51742 ) ) ( not ( = ?auto_51738 ?auto_51742 ) ) ( not ( = ?auto_51741 ?auto_51742 ) ) ( not ( = ?auto_51745 ?auto_51742 ) ) ( SURFACE-AT ?auto_51731 ?auto_51740 ) ( CLEAR ?auto_51731 ) ( IS-CRATE ?auto_51745 ) ( not ( = ?auto_51729 ?auto_51731 ) ) ( not ( = ?auto_51730 ?auto_51731 ) ) ( not ( = ?auto_51737 ?auto_51731 ) ) ( not ( = ?auto_51738 ?auto_51731 ) ) ( not ( = ?auto_51741 ?auto_51731 ) ) ( not ( = ?auto_51745 ?auto_51731 ) ) ( not ( = ?auto_51742 ?auto_51731 ) ) ( AVAILABLE ?auto_51736 ) ( TRUCK-AT ?auto_51734 ?auto_51744 ) ( not ( = ?auto_51744 ?auto_51740 ) ) ( not ( = ?auto_51732 ?auto_51744 ) ) ( not ( = ?auto_51735 ?auto_51744 ) ) ( not ( = ?auto_51747 ?auto_51744 ) ) ( HOIST-AT ?auto_51733 ?auto_51744 ) ( not ( = ?auto_51736 ?auto_51733 ) ) ( not ( = ?auto_51743 ?auto_51733 ) ) ( not ( = ?auto_51746 ?auto_51733 ) ) ( not ( = ?auto_51739 ?auto_51733 ) ) ( AVAILABLE ?auto_51733 ) ( SURFACE-AT ?auto_51745 ?auto_51744 ) ( ON ?auto_51745 ?auto_51748 ) ( CLEAR ?auto_51745 ) ( not ( = ?auto_51729 ?auto_51748 ) ) ( not ( = ?auto_51730 ?auto_51748 ) ) ( not ( = ?auto_51737 ?auto_51748 ) ) ( not ( = ?auto_51738 ?auto_51748 ) ) ( not ( = ?auto_51741 ?auto_51748 ) ) ( not ( = ?auto_51745 ?auto_51748 ) ) ( not ( = ?auto_51742 ?auto_51748 ) ) ( not ( = ?auto_51731 ?auto_51748 ) ) )
    :subtasks
    ( ( !LIFT ?auto_51733 ?auto_51745 ?auto_51748 ?auto_51744 )
      ( MAKE-ON ?auto_51729 ?auto_51730 )
      ( MAKE-ON-VERIFY ?auto_51729 ?auto_51730 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51749 - SURFACE
      ?auto_51750 - SURFACE
    )
    :vars
    (
      ?auto_51752 - HOIST
      ?auto_51760 - PLACE
      ?auto_51766 - PLACE
      ?auto_51751 - HOIST
      ?auto_51763 - SURFACE
      ?auto_51764 - SURFACE
      ?auto_51756 - PLACE
      ?auto_51754 - HOIST
      ?auto_51767 - SURFACE
      ?auto_51761 - SURFACE
      ?auto_51757 - PLACE
      ?auto_51759 - HOIST
      ?auto_51768 - SURFACE
      ?auto_51755 - SURFACE
      ?auto_51758 - PLACE
      ?auto_51765 - HOIST
      ?auto_51762 - SURFACE
      ?auto_51753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51752 ?auto_51760 ) ( IS-CRATE ?auto_51749 ) ( not ( = ?auto_51749 ?auto_51750 ) ) ( not ( = ?auto_51766 ?auto_51760 ) ) ( HOIST-AT ?auto_51751 ?auto_51766 ) ( not ( = ?auto_51752 ?auto_51751 ) ) ( AVAILABLE ?auto_51751 ) ( SURFACE-AT ?auto_51749 ?auto_51766 ) ( ON ?auto_51749 ?auto_51763 ) ( CLEAR ?auto_51749 ) ( not ( = ?auto_51749 ?auto_51763 ) ) ( not ( = ?auto_51750 ?auto_51763 ) ) ( IS-CRATE ?auto_51750 ) ( not ( = ?auto_51749 ?auto_51764 ) ) ( not ( = ?auto_51750 ?auto_51764 ) ) ( not ( = ?auto_51763 ?auto_51764 ) ) ( not ( = ?auto_51756 ?auto_51760 ) ) ( not ( = ?auto_51766 ?auto_51756 ) ) ( HOIST-AT ?auto_51754 ?auto_51756 ) ( not ( = ?auto_51752 ?auto_51754 ) ) ( not ( = ?auto_51751 ?auto_51754 ) ) ( AVAILABLE ?auto_51754 ) ( SURFACE-AT ?auto_51750 ?auto_51756 ) ( ON ?auto_51750 ?auto_51767 ) ( CLEAR ?auto_51750 ) ( not ( = ?auto_51749 ?auto_51767 ) ) ( not ( = ?auto_51750 ?auto_51767 ) ) ( not ( = ?auto_51763 ?auto_51767 ) ) ( not ( = ?auto_51764 ?auto_51767 ) ) ( IS-CRATE ?auto_51764 ) ( not ( = ?auto_51749 ?auto_51761 ) ) ( not ( = ?auto_51750 ?auto_51761 ) ) ( not ( = ?auto_51763 ?auto_51761 ) ) ( not ( = ?auto_51764 ?auto_51761 ) ) ( not ( = ?auto_51767 ?auto_51761 ) ) ( not ( = ?auto_51757 ?auto_51760 ) ) ( not ( = ?auto_51766 ?auto_51757 ) ) ( not ( = ?auto_51756 ?auto_51757 ) ) ( HOIST-AT ?auto_51759 ?auto_51757 ) ( not ( = ?auto_51752 ?auto_51759 ) ) ( not ( = ?auto_51751 ?auto_51759 ) ) ( not ( = ?auto_51754 ?auto_51759 ) ) ( AVAILABLE ?auto_51759 ) ( SURFACE-AT ?auto_51764 ?auto_51757 ) ( ON ?auto_51764 ?auto_51768 ) ( CLEAR ?auto_51764 ) ( not ( = ?auto_51749 ?auto_51768 ) ) ( not ( = ?auto_51750 ?auto_51768 ) ) ( not ( = ?auto_51763 ?auto_51768 ) ) ( not ( = ?auto_51764 ?auto_51768 ) ) ( not ( = ?auto_51767 ?auto_51768 ) ) ( not ( = ?auto_51761 ?auto_51768 ) ) ( SURFACE-AT ?auto_51755 ?auto_51760 ) ( CLEAR ?auto_51755 ) ( IS-CRATE ?auto_51761 ) ( not ( = ?auto_51749 ?auto_51755 ) ) ( not ( = ?auto_51750 ?auto_51755 ) ) ( not ( = ?auto_51763 ?auto_51755 ) ) ( not ( = ?auto_51764 ?auto_51755 ) ) ( not ( = ?auto_51767 ?auto_51755 ) ) ( not ( = ?auto_51761 ?auto_51755 ) ) ( not ( = ?auto_51768 ?auto_51755 ) ) ( AVAILABLE ?auto_51752 ) ( not ( = ?auto_51758 ?auto_51760 ) ) ( not ( = ?auto_51766 ?auto_51758 ) ) ( not ( = ?auto_51756 ?auto_51758 ) ) ( not ( = ?auto_51757 ?auto_51758 ) ) ( HOIST-AT ?auto_51765 ?auto_51758 ) ( not ( = ?auto_51752 ?auto_51765 ) ) ( not ( = ?auto_51751 ?auto_51765 ) ) ( not ( = ?auto_51754 ?auto_51765 ) ) ( not ( = ?auto_51759 ?auto_51765 ) ) ( AVAILABLE ?auto_51765 ) ( SURFACE-AT ?auto_51761 ?auto_51758 ) ( ON ?auto_51761 ?auto_51762 ) ( CLEAR ?auto_51761 ) ( not ( = ?auto_51749 ?auto_51762 ) ) ( not ( = ?auto_51750 ?auto_51762 ) ) ( not ( = ?auto_51763 ?auto_51762 ) ) ( not ( = ?auto_51764 ?auto_51762 ) ) ( not ( = ?auto_51767 ?auto_51762 ) ) ( not ( = ?auto_51761 ?auto_51762 ) ) ( not ( = ?auto_51768 ?auto_51762 ) ) ( not ( = ?auto_51755 ?auto_51762 ) ) ( TRUCK-AT ?auto_51753 ?auto_51760 ) )
    :subtasks
    ( ( !DRIVE ?auto_51753 ?auto_51760 ?auto_51758 )
      ( MAKE-ON ?auto_51749 ?auto_51750 )
      ( MAKE-ON-VERIFY ?auto_51749 ?auto_51750 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51769 - SURFACE
      ?auto_51770 - SURFACE
    )
    :vars
    (
      ?auto_51777 - HOIST
      ?auto_51787 - PLACE
      ?auto_51784 - PLACE
      ?auto_51776 - HOIST
      ?auto_51781 - SURFACE
      ?auto_51778 - SURFACE
      ?auto_51775 - PLACE
      ?auto_51771 - HOIST
      ?auto_51783 - SURFACE
      ?auto_51785 - SURFACE
      ?auto_51773 - PLACE
      ?auto_51779 - HOIST
      ?auto_51786 - SURFACE
      ?auto_51774 - SURFACE
      ?auto_51780 - PLACE
      ?auto_51788 - HOIST
      ?auto_51782 - SURFACE
      ?auto_51772 - TRUCK
      ?auto_51789 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51777 ?auto_51787 ) ( IS-CRATE ?auto_51769 ) ( not ( = ?auto_51769 ?auto_51770 ) ) ( not ( = ?auto_51784 ?auto_51787 ) ) ( HOIST-AT ?auto_51776 ?auto_51784 ) ( not ( = ?auto_51777 ?auto_51776 ) ) ( AVAILABLE ?auto_51776 ) ( SURFACE-AT ?auto_51769 ?auto_51784 ) ( ON ?auto_51769 ?auto_51781 ) ( CLEAR ?auto_51769 ) ( not ( = ?auto_51769 ?auto_51781 ) ) ( not ( = ?auto_51770 ?auto_51781 ) ) ( IS-CRATE ?auto_51770 ) ( not ( = ?auto_51769 ?auto_51778 ) ) ( not ( = ?auto_51770 ?auto_51778 ) ) ( not ( = ?auto_51781 ?auto_51778 ) ) ( not ( = ?auto_51775 ?auto_51787 ) ) ( not ( = ?auto_51784 ?auto_51775 ) ) ( HOIST-AT ?auto_51771 ?auto_51775 ) ( not ( = ?auto_51777 ?auto_51771 ) ) ( not ( = ?auto_51776 ?auto_51771 ) ) ( AVAILABLE ?auto_51771 ) ( SURFACE-AT ?auto_51770 ?auto_51775 ) ( ON ?auto_51770 ?auto_51783 ) ( CLEAR ?auto_51770 ) ( not ( = ?auto_51769 ?auto_51783 ) ) ( not ( = ?auto_51770 ?auto_51783 ) ) ( not ( = ?auto_51781 ?auto_51783 ) ) ( not ( = ?auto_51778 ?auto_51783 ) ) ( IS-CRATE ?auto_51778 ) ( not ( = ?auto_51769 ?auto_51785 ) ) ( not ( = ?auto_51770 ?auto_51785 ) ) ( not ( = ?auto_51781 ?auto_51785 ) ) ( not ( = ?auto_51778 ?auto_51785 ) ) ( not ( = ?auto_51783 ?auto_51785 ) ) ( not ( = ?auto_51773 ?auto_51787 ) ) ( not ( = ?auto_51784 ?auto_51773 ) ) ( not ( = ?auto_51775 ?auto_51773 ) ) ( HOIST-AT ?auto_51779 ?auto_51773 ) ( not ( = ?auto_51777 ?auto_51779 ) ) ( not ( = ?auto_51776 ?auto_51779 ) ) ( not ( = ?auto_51771 ?auto_51779 ) ) ( AVAILABLE ?auto_51779 ) ( SURFACE-AT ?auto_51778 ?auto_51773 ) ( ON ?auto_51778 ?auto_51786 ) ( CLEAR ?auto_51778 ) ( not ( = ?auto_51769 ?auto_51786 ) ) ( not ( = ?auto_51770 ?auto_51786 ) ) ( not ( = ?auto_51781 ?auto_51786 ) ) ( not ( = ?auto_51778 ?auto_51786 ) ) ( not ( = ?auto_51783 ?auto_51786 ) ) ( not ( = ?auto_51785 ?auto_51786 ) ) ( IS-CRATE ?auto_51785 ) ( not ( = ?auto_51769 ?auto_51774 ) ) ( not ( = ?auto_51770 ?auto_51774 ) ) ( not ( = ?auto_51781 ?auto_51774 ) ) ( not ( = ?auto_51778 ?auto_51774 ) ) ( not ( = ?auto_51783 ?auto_51774 ) ) ( not ( = ?auto_51785 ?auto_51774 ) ) ( not ( = ?auto_51786 ?auto_51774 ) ) ( not ( = ?auto_51780 ?auto_51787 ) ) ( not ( = ?auto_51784 ?auto_51780 ) ) ( not ( = ?auto_51775 ?auto_51780 ) ) ( not ( = ?auto_51773 ?auto_51780 ) ) ( HOIST-AT ?auto_51788 ?auto_51780 ) ( not ( = ?auto_51777 ?auto_51788 ) ) ( not ( = ?auto_51776 ?auto_51788 ) ) ( not ( = ?auto_51771 ?auto_51788 ) ) ( not ( = ?auto_51779 ?auto_51788 ) ) ( AVAILABLE ?auto_51788 ) ( SURFACE-AT ?auto_51785 ?auto_51780 ) ( ON ?auto_51785 ?auto_51782 ) ( CLEAR ?auto_51785 ) ( not ( = ?auto_51769 ?auto_51782 ) ) ( not ( = ?auto_51770 ?auto_51782 ) ) ( not ( = ?auto_51781 ?auto_51782 ) ) ( not ( = ?auto_51778 ?auto_51782 ) ) ( not ( = ?auto_51783 ?auto_51782 ) ) ( not ( = ?auto_51785 ?auto_51782 ) ) ( not ( = ?auto_51786 ?auto_51782 ) ) ( not ( = ?auto_51774 ?auto_51782 ) ) ( TRUCK-AT ?auto_51772 ?auto_51787 ) ( SURFACE-AT ?auto_51789 ?auto_51787 ) ( CLEAR ?auto_51789 ) ( LIFTING ?auto_51777 ?auto_51774 ) ( IS-CRATE ?auto_51774 ) ( not ( = ?auto_51769 ?auto_51789 ) ) ( not ( = ?auto_51770 ?auto_51789 ) ) ( not ( = ?auto_51781 ?auto_51789 ) ) ( not ( = ?auto_51778 ?auto_51789 ) ) ( not ( = ?auto_51783 ?auto_51789 ) ) ( not ( = ?auto_51785 ?auto_51789 ) ) ( not ( = ?auto_51786 ?auto_51789 ) ) ( not ( = ?auto_51774 ?auto_51789 ) ) ( not ( = ?auto_51782 ?auto_51789 ) ) )
    :subtasks
    ( ( !DROP ?auto_51777 ?auto_51774 ?auto_51789 ?auto_51787 )
      ( MAKE-ON ?auto_51769 ?auto_51770 )
      ( MAKE-ON-VERIFY ?auto_51769 ?auto_51770 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51790 - SURFACE
      ?auto_51791 - SURFACE
    )
    :vars
    (
      ?auto_51807 - HOIST
      ?auto_51802 - PLACE
      ?auto_51798 - PLACE
      ?auto_51795 - HOIST
      ?auto_51796 - SURFACE
      ?auto_51799 - SURFACE
      ?auto_51794 - PLACE
      ?auto_51792 - HOIST
      ?auto_51805 - SURFACE
      ?auto_51804 - SURFACE
      ?auto_51809 - PLACE
      ?auto_51801 - HOIST
      ?auto_51797 - SURFACE
      ?auto_51793 - SURFACE
      ?auto_51803 - PLACE
      ?auto_51806 - HOIST
      ?auto_51800 - SURFACE
      ?auto_51808 - TRUCK
      ?auto_51810 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51807 ?auto_51802 ) ( IS-CRATE ?auto_51790 ) ( not ( = ?auto_51790 ?auto_51791 ) ) ( not ( = ?auto_51798 ?auto_51802 ) ) ( HOIST-AT ?auto_51795 ?auto_51798 ) ( not ( = ?auto_51807 ?auto_51795 ) ) ( AVAILABLE ?auto_51795 ) ( SURFACE-AT ?auto_51790 ?auto_51798 ) ( ON ?auto_51790 ?auto_51796 ) ( CLEAR ?auto_51790 ) ( not ( = ?auto_51790 ?auto_51796 ) ) ( not ( = ?auto_51791 ?auto_51796 ) ) ( IS-CRATE ?auto_51791 ) ( not ( = ?auto_51790 ?auto_51799 ) ) ( not ( = ?auto_51791 ?auto_51799 ) ) ( not ( = ?auto_51796 ?auto_51799 ) ) ( not ( = ?auto_51794 ?auto_51802 ) ) ( not ( = ?auto_51798 ?auto_51794 ) ) ( HOIST-AT ?auto_51792 ?auto_51794 ) ( not ( = ?auto_51807 ?auto_51792 ) ) ( not ( = ?auto_51795 ?auto_51792 ) ) ( AVAILABLE ?auto_51792 ) ( SURFACE-AT ?auto_51791 ?auto_51794 ) ( ON ?auto_51791 ?auto_51805 ) ( CLEAR ?auto_51791 ) ( not ( = ?auto_51790 ?auto_51805 ) ) ( not ( = ?auto_51791 ?auto_51805 ) ) ( not ( = ?auto_51796 ?auto_51805 ) ) ( not ( = ?auto_51799 ?auto_51805 ) ) ( IS-CRATE ?auto_51799 ) ( not ( = ?auto_51790 ?auto_51804 ) ) ( not ( = ?auto_51791 ?auto_51804 ) ) ( not ( = ?auto_51796 ?auto_51804 ) ) ( not ( = ?auto_51799 ?auto_51804 ) ) ( not ( = ?auto_51805 ?auto_51804 ) ) ( not ( = ?auto_51809 ?auto_51802 ) ) ( not ( = ?auto_51798 ?auto_51809 ) ) ( not ( = ?auto_51794 ?auto_51809 ) ) ( HOIST-AT ?auto_51801 ?auto_51809 ) ( not ( = ?auto_51807 ?auto_51801 ) ) ( not ( = ?auto_51795 ?auto_51801 ) ) ( not ( = ?auto_51792 ?auto_51801 ) ) ( AVAILABLE ?auto_51801 ) ( SURFACE-AT ?auto_51799 ?auto_51809 ) ( ON ?auto_51799 ?auto_51797 ) ( CLEAR ?auto_51799 ) ( not ( = ?auto_51790 ?auto_51797 ) ) ( not ( = ?auto_51791 ?auto_51797 ) ) ( not ( = ?auto_51796 ?auto_51797 ) ) ( not ( = ?auto_51799 ?auto_51797 ) ) ( not ( = ?auto_51805 ?auto_51797 ) ) ( not ( = ?auto_51804 ?auto_51797 ) ) ( IS-CRATE ?auto_51804 ) ( not ( = ?auto_51790 ?auto_51793 ) ) ( not ( = ?auto_51791 ?auto_51793 ) ) ( not ( = ?auto_51796 ?auto_51793 ) ) ( not ( = ?auto_51799 ?auto_51793 ) ) ( not ( = ?auto_51805 ?auto_51793 ) ) ( not ( = ?auto_51804 ?auto_51793 ) ) ( not ( = ?auto_51797 ?auto_51793 ) ) ( not ( = ?auto_51803 ?auto_51802 ) ) ( not ( = ?auto_51798 ?auto_51803 ) ) ( not ( = ?auto_51794 ?auto_51803 ) ) ( not ( = ?auto_51809 ?auto_51803 ) ) ( HOIST-AT ?auto_51806 ?auto_51803 ) ( not ( = ?auto_51807 ?auto_51806 ) ) ( not ( = ?auto_51795 ?auto_51806 ) ) ( not ( = ?auto_51792 ?auto_51806 ) ) ( not ( = ?auto_51801 ?auto_51806 ) ) ( AVAILABLE ?auto_51806 ) ( SURFACE-AT ?auto_51804 ?auto_51803 ) ( ON ?auto_51804 ?auto_51800 ) ( CLEAR ?auto_51804 ) ( not ( = ?auto_51790 ?auto_51800 ) ) ( not ( = ?auto_51791 ?auto_51800 ) ) ( not ( = ?auto_51796 ?auto_51800 ) ) ( not ( = ?auto_51799 ?auto_51800 ) ) ( not ( = ?auto_51805 ?auto_51800 ) ) ( not ( = ?auto_51804 ?auto_51800 ) ) ( not ( = ?auto_51797 ?auto_51800 ) ) ( not ( = ?auto_51793 ?auto_51800 ) ) ( TRUCK-AT ?auto_51808 ?auto_51802 ) ( SURFACE-AT ?auto_51810 ?auto_51802 ) ( CLEAR ?auto_51810 ) ( IS-CRATE ?auto_51793 ) ( not ( = ?auto_51790 ?auto_51810 ) ) ( not ( = ?auto_51791 ?auto_51810 ) ) ( not ( = ?auto_51796 ?auto_51810 ) ) ( not ( = ?auto_51799 ?auto_51810 ) ) ( not ( = ?auto_51805 ?auto_51810 ) ) ( not ( = ?auto_51804 ?auto_51810 ) ) ( not ( = ?auto_51797 ?auto_51810 ) ) ( not ( = ?auto_51793 ?auto_51810 ) ) ( not ( = ?auto_51800 ?auto_51810 ) ) ( AVAILABLE ?auto_51807 ) ( IN ?auto_51793 ?auto_51808 ) )
    :subtasks
    ( ( !UNLOAD ?auto_51807 ?auto_51793 ?auto_51808 ?auto_51802 )
      ( MAKE-ON ?auto_51790 ?auto_51791 )
      ( MAKE-ON-VERIFY ?auto_51790 ?auto_51791 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51811 - SURFACE
      ?auto_51812 - SURFACE
    )
    :vars
    (
      ?auto_51814 - HOIST
      ?auto_51830 - PLACE
      ?auto_51824 - PLACE
      ?auto_51829 - HOIST
      ?auto_51816 - SURFACE
      ?auto_51819 - SURFACE
      ?auto_51831 - PLACE
      ?auto_51827 - HOIST
      ?auto_51825 - SURFACE
      ?auto_51815 - SURFACE
      ?auto_51818 - PLACE
      ?auto_51823 - HOIST
      ?auto_51821 - SURFACE
      ?auto_51826 - SURFACE
      ?auto_51820 - PLACE
      ?auto_51813 - HOIST
      ?auto_51822 - SURFACE
      ?auto_51828 - SURFACE
      ?auto_51817 - TRUCK
      ?auto_51832 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51814 ?auto_51830 ) ( IS-CRATE ?auto_51811 ) ( not ( = ?auto_51811 ?auto_51812 ) ) ( not ( = ?auto_51824 ?auto_51830 ) ) ( HOIST-AT ?auto_51829 ?auto_51824 ) ( not ( = ?auto_51814 ?auto_51829 ) ) ( AVAILABLE ?auto_51829 ) ( SURFACE-AT ?auto_51811 ?auto_51824 ) ( ON ?auto_51811 ?auto_51816 ) ( CLEAR ?auto_51811 ) ( not ( = ?auto_51811 ?auto_51816 ) ) ( not ( = ?auto_51812 ?auto_51816 ) ) ( IS-CRATE ?auto_51812 ) ( not ( = ?auto_51811 ?auto_51819 ) ) ( not ( = ?auto_51812 ?auto_51819 ) ) ( not ( = ?auto_51816 ?auto_51819 ) ) ( not ( = ?auto_51831 ?auto_51830 ) ) ( not ( = ?auto_51824 ?auto_51831 ) ) ( HOIST-AT ?auto_51827 ?auto_51831 ) ( not ( = ?auto_51814 ?auto_51827 ) ) ( not ( = ?auto_51829 ?auto_51827 ) ) ( AVAILABLE ?auto_51827 ) ( SURFACE-AT ?auto_51812 ?auto_51831 ) ( ON ?auto_51812 ?auto_51825 ) ( CLEAR ?auto_51812 ) ( not ( = ?auto_51811 ?auto_51825 ) ) ( not ( = ?auto_51812 ?auto_51825 ) ) ( not ( = ?auto_51816 ?auto_51825 ) ) ( not ( = ?auto_51819 ?auto_51825 ) ) ( IS-CRATE ?auto_51819 ) ( not ( = ?auto_51811 ?auto_51815 ) ) ( not ( = ?auto_51812 ?auto_51815 ) ) ( not ( = ?auto_51816 ?auto_51815 ) ) ( not ( = ?auto_51819 ?auto_51815 ) ) ( not ( = ?auto_51825 ?auto_51815 ) ) ( not ( = ?auto_51818 ?auto_51830 ) ) ( not ( = ?auto_51824 ?auto_51818 ) ) ( not ( = ?auto_51831 ?auto_51818 ) ) ( HOIST-AT ?auto_51823 ?auto_51818 ) ( not ( = ?auto_51814 ?auto_51823 ) ) ( not ( = ?auto_51829 ?auto_51823 ) ) ( not ( = ?auto_51827 ?auto_51823 ) ) ( AVAILABLE ?auto_51823 ) ( SURFACE-AT ?auto_51819 ?auto_51818 ) ( ON ?auto_51819 ?auto_51821 ) ( CLEAR ?auto_51819 ) ( not ( = ?auto_51811 ?auto_51821 ) ) ( not ( = ?auto_51812 ?auto_51821 ) ) ( not ( = ?auto_51816 ?auto_51821 ) ) ( not ( = ?auto_51819 ?auto_51821 ) ) ( not ( = ?auto_51825 ?auto_51821 ) ) ( not ( = ?auto_51815 ?auto_51821 ) ) ( IS-CRATE ?auto_51815 ) ( not ( = ?auto_51811 ?auto_51826 ) ) ( not ( = ?auto_51812 ?auto_51826 ) ) ( not ( = ?auto_51816 ?auto_51826 ) ) ( not ( = ?auto_51819 ?auto_51826 ) ) ( not ( = ?auto_51825 ?auto_51826 ) ) ( not ( = ?auto_51815 ?auto_51826 ) ) ( not ( = ?auto_51821 ?auto_51826 ) ) ( not ( = ?auto_51820 ?auto_51830 ) ) ( not ( = ?auto_51824 ?auto_51820 ) ) ( not ( = ?auto_51831 ?auto_51820 ) ) ( not ( = ?auto_51818 ?auto_51820 ) ) ( HOIST-AT ?auto_51813 ?auto_51820 ) ( not ( = ?auto_51814 ?auto_51813 ) ) ( not ( = ?auto_51829 ?auto_51813 ) ) ( not ( = ?auto_51827 ?auto_51813 ) ) ( not ( = ?auto_51823 ?auto_51813 ) ) ( AVAILABLE ?auto_51813 ) ( SURFACE-AT ?auto_51815 ?auto_51820 ) ( ON ?auto_51815 ?auto_51822 ) ( CLEAR ?auto_51815 ) ( not ( = ?auto_51811 ?auto_51822 ) ) ( not ( = ?auto_51812 ?auto_51822 ) ) ( not ( = ?auto_51816 ?auto_51822 ) ) ( not ( = ?auto_51819 ?auto_51822 ) ) ( not ( = ?auto_51825 ?auto_51822 ) ) ( not ( = ?auto_51815 ?auto_51822 ) ) ( not ( = ?auto_51821 ?auto_51822 ) ) ( not ( = ?auto_51826 ?auto_51822 ) ) ( SURFACE-AT ?auto_51828 ?auto_51830 ) ( CLEAR ?auto_51828 ) ( IS-CRATE ?auto_51826 ) ( not ( = ?auto_51811 ?auto_51828 ) ) ( not ( = ?auto_51812 ?auto_51828 ) ) ( not ( = ?auto_51816 ?auto_51828 ) ) ( not ( = ?auto_51819 ?auto_51828 ) ) ( not ( = ?auto_51825 ?auto_51828 ) ) ( not ( = ?auto_51815 ?auto_51828 ) ) ( not ( = ?auto_51821 ?auto_51828 ) ) ( not ( = ?auto_51826 ?auto_51828 ) ) ( not ( = ?auto_51822 ?auto_51828 ) ) ( AVAILABLE ?auto_51814 ) ( IN ?auto_51826 ?auto_51817 ) ( TRUCK-AT ?auto_51817 ?auto_51832 ) ( not ( = ?auto_51832 ?auto_51830 ) ) ( not ( = ?auto_51824 ?auto_51832 ) ) ( not ( = ?auto_51831 ?auto_51832 ) ) ( not ( = ?auto_51818 ?auto_51832 ) ) ( not ( = ?auto_51820 ?auto_51832 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_51817 ?auto_51832 ?auto_51830 )
      ( MAKE-ON ?auto_51811 ?auto_51812 )
      ( MAKE-ON-VERIFY ?auto_51811 ?auto_51812 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51833 - SURFACE
      ?auto_51834 - SURFACE
    )
    :vars
    (
      ?auto_51839 - HOIST
      ?auto_51851 - PLACE
      ?auto_51840 - PLACE
      ?auto_51852 - HOIST
      ?auto_51847 - SURFACE
      ?auto_51835 - SURFACE
      ?auto_51844 - PLACE
      ?auto_51842 - HOIST
      ?auto_51845 - SURFACE
      ?auto_51853 - SURFACE
      ?auto_51848 - PLACE
      ?auto_51843 - HOIST
      ?auto_51854 - SURFACE
      ?auto_51838 - SURFACE
      ?auto_51837 - PLACE
      ?auto_51850 - HOIST
      ?auto_51841 - SURFACE
      ?auto_51849 - SURFACE
      ?auto_51846 - TRUCK
      ?auto_51836 - PLACE
      ?auto_51855 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_51839 ?auto_51851 ) ( IS-CRATE ?auto_51833 ) ( not ( = ?auto_51833 ?auto_51834 ) ) ( not ( = ?auto_51840 ?auto_51851 ) ) ( HOIST-AT ?auto_51852 ?auto_51840 ) ( not ( = ?auto_51839 ?auto_51852 ) ) ( AVAILABLE ?auto_51852 ) ( SURFACE-AT ?auto_51833 ?auto_51840 ) ( ON ?auto_51833 ?auto_51847 ) ( CLEAR ?auto_51833 ) ( not ( = ?auto_51833 ?auto_51847 ) ) ( not ( = ?auto_51834 ?auto_51847 ) ) ( IS-CRATE ?auto_51834 ) ( not ( = ?auto_51833 ?auto_51835 ) ) ( not ( = ?auto_51834 ?auto_51835 ) ) ( not ( = ?auto_51847 ?auto_51835 ) ) ( not ( = ?auto_51844 ?auto_51851 ) ) ( not ( = ?auto_51840 ?auto_51844 ) ) ( HOIST-AT ?auto_51842 ?auto_51844 ) ( not ( = ?auto_51839 ?auto_51842 ) ) ( not ( = ?auto_51852 ?auto_51842 ) ) ( AVAILABLE ?auto_51842 ) ( SURFACE-AT ?auto_51834 ?auto_51844 ) ( ON ?auto_51834 ?auto_51845 ) ( CLEAR ?auto_51834 ) ( not ( = ?auto_51833 ?auto_51845 ) ) ( not ( = ?auto_51834 ?auto_51845 ) ) ( not ( = ?auto_51847 ?auto_51845 ) ) ( not ( = ?auto_51835 ?auto_51845 ) ) ( IS-CRATE ?auto_51835 ) ( not ( = ?auto_51833 ?auto_51853 ) ) ( not ( = ?auto_51834 ?auto_51853 ) ) ( not ( = ?auto_51847 ?auto_51853 ) ) ( not ( = ?auto_51835 ?auto_51853 ) ) ( not ( = ?auto_51845 ?auto_51853 ) ) ( not ( = ?auto_51848 ?auto_51851 ) ) ( not ( = ?auto_51840 ?auto_51848 ) ) ( not ( = ?auto_51844 ?auto_51848 ) ) ( HOIST-AT ?auto_51843 ?auto_51848 ) ( not ( = ?auto_51839 ?auto_51843 ) ) ( not ( = ?auto_51852 ?auto_51843 ) ) ( not ( = ?auto_51842 ?auto_51843 ) ) ( AVAILABLE ?auto_51843 ) ( SURFACE-AT ?auto_51835 ?auto_51848 ) ( ON ?auto_51835 ?auto_51854 ) ( CLEAR ?auto_51835 ) ( not ( = ?auto_51833 ?auto_51854 ) ) ( not ( = ?auto_51834 ?auto_51854 ) ) ( not ( = ?auto_51847 ?auto_51854 ) ) ( not ( = ?auto_51835 ?auto_51854 ) ) ( not ( = ?auto_51845 ?auto_51854 ) ) ( not ( = ?auto_51853 ?auto_51854 ) ) ( IS-CRATE ?auto_51853 ) ( not ( = ?auto_51833 ?auto_51838 ) ) ( not ( = ?auto_51834 ?auto_51838 ) ) ( not ( = ?auto_51847 ?auto_51838 ) ) ( not ( = ?auto_51835 ?auto_51838 ) ) ( not ( = ?auto_51845 ?auto_51838 ) ) ( not ( = ?auto_51853 ?auto_51838 ) ) ( not ( = ?auto_51854 ?auto_51838 ) ) ( not ( = ?auto_51837 ?auto_51851 ) ) ( not ( = ?auto_51840 ?auto_51837 ) ) ( not ( = ?auto_51844 ?auto_51837 ) ) ( not ( = ?auto_51848 ?auto_51837 ) ) ( HOIST-AT ?auto_51850 ?auto_51837 ) ( not ( = ?auto_51839 ?auto_51850 ) ) ( not ( = ?auto_51852 ?auto_51850 ) ) ( not ( = ?auto_51842 ?auto_51850 ) ) ( not ( = ?auto_51843 ?auto_51850 ) ) ( AVAILABLE ?auto_51850 ) ( SURFACE-AT ?auto_51853 ?auto_51837 ) ( ON ?auto_51853 ?auto_51841 ) ( CLEAR ?auto_51853 ) ( not ( = ?auto_51833 ?auto_51841 ) ) ( not ( = ?auto_51834 ?auto_51841 ) ) ( not ( = ?auto_51847 ?auto_51841 ) ) ( not ( = ?auto_51835 ?auto_51841 ) ) ( not ( = ?auto_51845 ?auto_51841 ) ) ( not ( = ?auto_51853 ?auto_51841 ) ) ( not ( = ?auto_51854 ?auto_51841 ) ) ( not ( = ?auto_51838 ?auto_51841 ) ) ( SURFACE-AT ?auto_51849 ?auto_51851 ) ( CLEAR ?auto_51849 ) ( IS-CRATE ?auto_51838 ) ( not ( = ?auto_51833 ?auto_51849 ) ) ( not ( = ?auto_51834 ?auto_51849 ) ) ( not ( = ?auto_51847 ?auto_51849 ) ) ( not ( = ?auto_51835 ?auto_51849 ) ) ( not ( = ?auto_51845 ?auto_51849 ) ) ( not ( = ?auto_51853 ?auto_51849 ) ) ( not ( = ?auto_51854 ?auto_51849 ) ) ( not ( = ?auto_51838 ?auto_51849 ) ) ( not ( = ?auto_51841 ?auto_51849 ) ) ( AVAILABLE ?auto_51839 ) ( TRUCK-AT ?auto_51846 ?auto_51836 ) ( not ( = ?auto_51836 ?auto_51851 ) ) ( not ( = ?auto_51840 ?auto_51836 ) ) ( not ( = ?auto_51844 ?auto_51836 ) ) ( not ( = ?auto_51848 ?auto_51836 ) ) ( not ( = ?auto_51837 ?auto_51836 ) ) ( HOIST-AT ?auto_51855 ?auto_51836 ) ( LIFTING ?auto_51855 ?auto_51838 ) ( not ( = ?auto_51839 ?auto_51855 ) ) ( not ( = ?auto_51852 ?auto_51855 ) ) ( not ( = ?auto_51842 ?auto_51855 ) ) ( not ( = ?auto_51843 ?auto_51855 ) ) ( not ( = ?auto_51850 ?auto_51855 ) ) )
    :subtasks
    ( ( !LOAD ?auto_51855 ?auto_51838 ?auto_51846 ?auto_51836 )
      ( MAKE-ON ?auto_51833 ?auto_51834 )
      ( MAKE-ON-VERIFY ?auto_51833 ?auto_51834 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51856 - SURFACE
      ?auto_51857 - SURFACE
    )
    :vars
    (
      ?auto_51873 - HOIST
      ?auto_51859 - PLACE
      ?auto_51877 - PLACE
      ?auto_51858 - HOIST
      ?auto_51863 - SURFACE
      ?auto_51874 - SURFACE
      ?auto_51862 - PLACE
      ?auto_51865 - HOIST
      ?auto_51864 - SURFACE
      ?auto_51867 - SURFACE
      ?auto_51861 - PLACE
      ?auto_51871 - HOIST
      ?auto_51860 - SURFACE
      ?auto_51869 - SURFACE
      ?auto_51868 - PLACE
      ?auto_51866 - HOIST
      ?auto_51870 - SURFACE
      ?auto_51875 - SURFACE
      ?auto_51878 - TRUCK
      ?auto_51876 - PLACE
      ?auto_51872 - HOIST
      ?auto_51879 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51873 ?auto_51859 ) ( IS-CRATE ?auto_51856 ) ( not ( = ?auto_51856 ?auto_51857 ) ) ( not ( = ?auto_51877 ?auto_51859 ) ) ( HOIST-AT ?auto_51858 ?auto_51877 ) ( not ( = ?auto_51873 ?auto_51858 ) ) ( AVAILABLE ?auto_51858 ) ( SURFACE-AT ?auto_51856 ?auto_51877 ) ( ON ?auto_51856 ?auto_51863 ) ( CLEAR ?auto_51856 ) ( not ( = ?auto_51856 ?auto_51863 ) ) ( not ( = ?auto_51857 ?auto_51863 ) ) ( IS-CRATE ?auto_51857 ) ( not ( = ?auto_51856 ?auto_51874 ) ) ( not ( = ?auto_51857 ?auto_51874 ) ) ( not ( = ?auto_51863 ?auto_51874 ) ) ( not ( = ?auto_51862 ?auto_51859 ) ) ( not ( = ?auto_51877 ?auto_51862 ) ) ( HOIST-AT ?auto_51865 ?auto_51862 ) ( not ( = ?auto_51873 ?auto_51865 ) ) ( not ( = ?auto_51858 ?auto_51865 ) ) ( AVAILABLE ?auto_51865 ) ( SURFACE-AT ?auto_51857 ?auto_51862 ) ( ON ?auto_51857 ?auto_51864 ) ( CLEAR ?auto_51857 ) ( not ( = ?auto_51856 ?auto_51864 ) ) ( not ( = ?auto_51857 ?auto_51864 ) ) ( not ( = ?auto_51863 ?auto_51864 ) ) ( not ( = ?auto_51874 ?auto_51864 ) ) ( IS-CRATE ?auto_51874 ) ( not ( = ?auto_51856 ?auto_51867 ) ) ( not ( = ?auto_51857 ?auto_51867 ) ) ( not ( = ?auto_51863 ?auto_51867 ) ) ( not ( = ?auto_51874 ?auto_51867 ) ) ( not ( = ?auto_51864 ?auto_51867 ) ) ( not ( = ?auto_51861 ?auto_51859 ) ) ( not ( = ?auto_51877 ?auto_51861 ) ) ( not ( = ?auto_51862 ?auto_51861 ) ) ( HOIST-AT ?auto_51871 ?auto_51861 ) ( not ( = ?auto_51873 ?auto_51871 ) ) ( not ( = ?auto_51858 ?auto_51871 ) ) ( not ( = ?auto_51865 ?auto_51871 ) ) ( AVAILABLE ?auto_51871 ) ( SURFACE-AT ?auto_51874 ?auto_51861 ) ( ON ?auto_51874 ?auto_51860 ) ( CLEAR ?auto_51874 ) ( not ( = ?auto_51856 ?auto_51860 ) ) ( not ( = ?auto_51857 ?auto_51860 ) ) ( not ( = ?auto_51863 ?auto_51860 ) ) ( not ( = ?auto_51874 ?auto_51860 ) ) ( not ( = ?auto_51864 ?auto_51860 ) ) ( not ( = ?auto_51867 ?auto_51860 ) ) ( IS-CRATE ?auto_51867 ) ( not ( = ?auto_51856 ?auto_51869 ) ) ( not ( = ?auto_51857 ?auto_51869 ) ) ( not ( = ?auto_51863 ?auto_51869 ) ) ( not ( = ?auto_51874 ?auto_51869 ) ) ( not ( = ?auto_51864 ?auto_51869 ) ) ( not ( = ?auto_51867 ?auto_51869 ) ) ( not ( = ?auto_51860 ?auto_51869 ) ) ( not ( = ?auto_51868 ?auto_51859 ) ) ( not ( = ?auto_51877 ?auto_51868 ) ) ( not ( = ?auto_51862 ?auto_51868 ) ) ( not ( = ?auto_51861 ?auto_51868 ) ) ( HOIST-AT ?auto_51866 ?auto_51868 ) ( not ( = ?auto_51873 ?auto_51866 ) ) ( not ( = ?auto_51858 ?auto_51866 ) ) ( not ( = ?auto_51865 ?auto_51866 ) ) ( not ( = ?auto_51871 ?auto_51866 ) ) ( AVAILABLE ?auto_51866 ) ( SURFACE-AT ?auto_51867 ?auto_51868 ) ( ON ?auto_51867 ?auto_51870 ) ( CLEAR ?auto_51867 ) ( not ( = ?auto_51856 ?auto_51870 ) ) ( not ( = ?auto_51857 ?auto_51870 ) ) ( not ( = ?auto_51863 ?auto_51870 ) ) ( not ( = ?auto_51874 ?auto_51870 ) ) ( not ( = ?auto_51864 ?auto_51870 ) ) ( not ( = ?auto_51867 ?auto_51870 ) ) ( not ( = ?auto_51860 ?auto_51870 ) ) ( not ( = ?auto_51869 ?auto_51870 ) ) ( SURFACE-AT ?auto_51875 ?auto_51859 ) ( CLEAR ?auto_51875 ) ( IS-CRATE ?auto_51869 ) ( not ( = ?auto_51856 ?auto_51875 ) ) ( not ( = ?auto_51857 ?auto_51875 ) ) ( not ( = ?auto_51863 ?auto_51875 ) ) ( not ( = ?auto_51874 ?auto_51875 ) ) ( not ( = ?auto_51864 ?auto_51875 ) ) ( not ( = ?auto_51867 ?auto_51875 ) ) ( not ( = ?auto_51860 ?auto_51875 ) ) ( not ( = ?auto_51869 ?auto_51875 ) ) ( not ( = ?auto_51870 ?auto_51875 ) ) ( AVAILABLE ?auto_51873 ) ( TRUCK-AT ?auto_51878 ?auto_51876 ) ( not ( = ?auto_51876 ?auto_51859 ) ) ( not ( = ?auto_51877 ?auto_51876 ) ) ( not ( = ?auto_51862 ?auto_51876 ) ) ( not ( = ?auto_51861 ?auto_51876 ) ) ( not ( = ?auto_51868 ?auto_51876 ) ) ( HOIST-AT ?auto_51872 ?auto_51876 ) ( not ( = ?auto_51873 ?auto_51872 ) ) ( not ( = ?auto_51858 ?auto_51872 ) ) ( not ( = ?auto_51865 ?auto_51872 ) ) ( not ( = ?auto_51871 ?auto_51872 ) ) ( not ( = ?auto_51866 ?auto_51872 ) ) ( AVAILABLE ?auto_51872 ) ( SURFACE-AT ?auto_51869 ?auto_51876 ) ( ON ?auto_51869 ?auto_51879 ) ( CLEAR ?auto_51869 ) ( not ( = ?auto_51856 ?auto_51879 ) ) ( not ( = ?auto_51857 ?auto_51879 ) ) ( not ( = ?auto_51863 ?auto_51879 ) ) ( not ( = ?auto_51874 ?auto_51879 ) ) ( not ( = ?auto_51864 ?auto_51879 ) ) ( not ( = ?auto_51867 ?auto_51879 ) ) ( not ( = ?auto_51860 ?auto_51879 ) ) ( not ( = ?auto_51869 ?auto_51879 ) ) ( not ( = ?auto_51870 ?auto_51879 ) ) ( not ( = ?auto_51875 ?auto_51879 ) ) )
    :subtasks
    ( ( !LIFT ?auto_51872 ?auto_51869 ?auto_51879 ?auto_51876 )
      ( MAKE-ON ?auto_51856 ?auto_51857 )
      ( MAKE-ON-VERIFY ?auto_51856 ?auto_51857 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51880 - SURFACE
      ?auto_51881 - SURFACE
    )
    :vars
    (
      ?auto_51890 - HOIST
      ?auto_51882 - PLACE
      ?auto_51900 - PLACE
      ?auto_51894 - HOIST
      ?auto_51884 - SURFACE
      ?auto_51895 - SURFACE
      ?auto_51891 - PLACE
      ?auto_51886 - HOIST
      ?auto_51889 - SURFACE
      ?auto_51903 - SURFACE
      ?auto_51902 - PLACE
      ?auto_51892 - HOIST
      ?auto_51897 - SURFACE
      ?auto_51883 - SURFACE
      ?auto_51888 - PLACE
      ?auto_51893 - HOIST
      ?auto_51899 - SURFACE
      ?auto_51896 - SURFACE
      ?auto_51885 - PLACE
      ?auto_51887 - HOIST
      ?auto_51898 - SURFACE
      ?auto_51901 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51890 ?auto_51882 ) ( IS-CRATE ?auto_51880 ) ( not ( = ?auto_51880 ?auto_51881 ) ) ( not ( = ?auto_51900 ?auto_51882 ) ) ( HOIST-AT ?auto_51894 ?auto_51900 ) ( not ( = ?auto_51890 ?auto_51894 ) ) ( AVAILABLE ?auto_51894 ) ( SURFACE-AT ?auto_51880 ?auto_51900 ) ( ON ?auto_51880 ?auto_51884 ) ( CLEAR ?auto_51880 ) ( not ( = ?auto_51880 ?auto_51884 ) ) ( not ( = ?auto_51881 ?auto_51884 ) ) ( IS-CRATE ?auto_51881 ) ( not ( = ?auto_51880 ?auto_51895 ) ) ( not ( = ?auto_51881 ?auto_51895 ) ) ( not ( = ?auto_51884 ?auto_51895 ) ) ( not ( = ?auto_51891 ?auto_51882 ) ) ( not ( = ?auto_51900 ?auto_51891 ) ) ( HOIST-AT ?auto_51886 ?auto_51891 ) ( not ( = ?auto_51890 ?auto_51886 ) ) ( not ( = ?auto_51894 ?auto_51886 ) ) ( AVAILABLE ?auto_51886 ) ( SURFACE-AT ?auto_51881 ?auto_51891 ) ( ON ?auto_51881 ?auto_51889 ) ( CLEAR ?auto_51881 ) ( not ( = ?auto_51880 ?auto_51889 ) ) ( not ( = ?auto_51881 ?auto_51889 ) ) ( not ( = ?auto_51884 ?auto_51889 ) ) ( not ( = ?auto_51895 ?auto_51889 ) ) ( IS-CRATE ?auto_51895 ) ( not ( = ?auto_51880 ?auto_51903 ) ) ( not ( = ?auto_51881 ?auto_51903 ) ) ( not ( = ?auto_51884 ?auto_51903 ) ) ( not ( = ?auto_51895 ?auto_51903 ) ) ( not ( = ?auto_51889 ?auto_51903 ) ) ( not ( = ?auto_51902 ?auto_51882 ) ) ( not ( = ?auto_51900 ?auto_51902 ) ) ( not ( = ?auto_51891 ?auto_51902 ) ) ( HOIST-AT ?auto_51892 ?auto_51902 ) ( not ( = ?auto_51890 ?auto_51892 ) ) ( not ( = ?auto_51894 ?auto_51892 ) ) ( not ( = ?auto_51886 ?auto_51892 ) ) ( AVAILABLE ?auto_51892 ) ( SURFACE-AT ?auto_51895 ?auto_51902 ) ( ON ?auto_51895 ?auto_51897 ) ( CLEAR ?auto_51895 ) ( not ( = ?auto_51880 ?auto_51897 ) ) ( not ( = ?auto_51881 ?auto_51897 ) ) ( not ( = ?auto_51884 ?auto_51897 ) ) ( not ( = ?auto_51895 ?auto_51897 ) ) ( not ( = ?auto_51889 ?auto_51897 ) ) ( not ( = ?auto_51903 ?auto_51897 ) ) ( IS-CRATE ?auto_51903 ) ( not ( = ?auto_51880 ?auto_51883 ) ) ( not ( = ?auto_51881 ?auto_51883 ) ) ( not ( = ?auto_51884 ?auto_51883 ) ) ( not ( = ?auto_51895 ?auto_51883 ) ) ( not ( = ?auto_51889 ?auto_51883 ) ) ( not ( = ?auto_51903 ?auto_51883 ) ) ( not ( = ?auto_51897 ?auto_51883 ) ) ( not ( = ?auto_51888 ?auto_51882 ) ) ( not ( = ?auto_51900 ?auto_51888 ) ) ( not ( = ?auto_51891 ?auto_51888 ) ) ( not ( = ?auto_51902 ?auto_51888 ) ) ( HOIST-AT ?auto_51893 ?auto_51888 ) ( not ( = ?auto_51890 ?auto_51893 ) ) ( not ( = ?auto_51894 ?auto_51893 ) ) ( not ( = ?auto_51886 ?auto_51893 ) ) ( not ( = ?auto_51892 ?auto_51893 ) ) ( AVAILABLE ?auto_51893 ) ( SURFACE-AT ?auto_51903 ?auto_51888 ) ( ON ?auto_51903 ?auto_51899 ) ( CLEAR ?auto_51903 ) ( not ( = ?auto_51880 ?auto_51899 ) ) ( not ( = ?auto_51881 ?auto_51899 ) ) ( not ( = ?auto_51884 ?auto_51899 ) ) ( not ( = ?auto_51895 ?auto_51899 ) ) ( not ( = ?auto_51889 ?auto_51899 ) ) ( not ( = ?auto_51903 ?auto_51899 ) ) ( not ( = ?auto_51897 ?auto_51899 ) ) ( not ( = ?auto_51883 ?auto_51899 ) ) ( SURFACE-AT ?auto_51896 ?auto_51882 ) ( CLEAR ?auto_51896 ) ( IS-CRATE ?auto_51883 ) ( not ( = ?auto_51880 ?auto_51896 ) ) ( not ( = ?auto_51881 ?auto_51896 ) ) ( not ( = ?auto_51884 ?auto_51896 ) ) ( not ( = ?auto_51895 ?auto_51896 ) ) ( not ( = ?auto_51889 ?auto_51896 ) ) ( not ( = ?auto_51903 ?auto_51896 ) ) ( not ( = ?auto_51897 ?auto_51896 ) ) ( not ( = ?auto_51883 ?auto_51896 ) ) ( not ( = ?auto_51899 ?auto_51896 ) ) ( AVAILABLE ?auto_51890 ) ( not ( = ?auto_51885 ?auto_51882 ) ) ( not ( = ?auto_51900 ?auto_51885 ) ) ( not ( = ?auto_51891 ?auto_51885 ) ) ( not ( = ?auto_51902 ?auto_51885 ) ) ( not ( = ?auto_51888 ?auto_51885 ) ) ( HOIST-AT ?auto_51887 ?auto_51885 ) ( not ( = ?auto_51890 ?auto_51887 ) ) ( not ( = ?auto_51894 ?auto_51887 ) ) ( not ( = ?auto_51886 ?auto_51887 ) ) ( not ( = ?auto_51892 ?auto_51887 ) ) ( not ( = ?auto_51893 ?auto_51887 ) ) ( AVAILABLE ?auto_51887 ) ( SURFACE-AT ?auto_51883 ?auto_51885 ) ( ON ?auto_51883 ?auto_51898 ) ( CLEAR ?auto_51883 ) ( not ( = ?auto_51880 ?auto_51898 ) ) ( not ( = ?auto_51881 ?auto_51898 ) ) ( not ( = ?auto_51884 ?auto_51898 ) ) ( not ( = ?auto_51895 ?auto_51898 ) ) ( not ( = ?auto_51889 ?auto_51898 ) ) ( not ( = ?auto_51903 ?auto_51898 ) ) ( not ( = ?auto_51897 ?auto_51898 ) ) ( not ( = ?auto_51883 ?auto_51898 ) ) ( not ( = ?auto_51899 ?auto_51898 ) ) ( not ( = ?auto_51896 ?auto_51898 ) ) ( TRUCK-AT ?auto_51901 ?auto_51882 ) )
    :subtasks
    ( ( !DRIVE ?auto_51901 ?auto_51882 ?auto_51885 )
      ( MAKE-ON ?auto_51880 ?auto_51881 )
      ( MAKE-ON-VERIFY ?auto_51880 ?auto_51881 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51904 - SURFACE
      ?auto_51905 - SURFACE
    )
    :vars
    (
      ?auto_51915 - HOIST
      ?auto_51912 - PLACE
      ?auto_51920 - PLACE
      ?auto_51923 - HOIST
      ?auto_51921 - SURFACE
      ?auto_51925 - SURFACE
      ?auto_51922 - PLACE
      ?auto_51909 - HOIST
      ?auto_51914 - SURFACE
      ?auto_51910 - SURFACE
      ?auto_51908 - PLACE
      ?auto_51926 - HOIST
      ?auto_51913 - SURFACE
      ?auto_51916 - SURFACE
      ?auto_51927 - PLACE
      ?auto_51917 - HOIST
      ?auto_51919 - SURFACE
      ?auto_51906 - SURFACE
      ?auto_51924 - PLACE
      ?auto_51911 - HOIST
      ?auto_51918 - SURFACE
      ?auto_51907 - TRUCK
      ?auto_51928 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51915 ?auto_51912 ) ( IS-CRATE ?auto_51904 ) ( not ( = ?auto_51904 ?auto_51905 ) ) ( not ( = ?auto_51920 ?auto_51912 ) ) ( HOIST-AT ?auto_51923 ?auto_51920 ) ( not ( = ?auto_51915 ?auto_51923 ) ) ( AVAILABLE ?auto_51923 ) ( SURFACE-AT ?auto_51904 ?auto_51920 ) ( ON ?auto_51904 ?auto_51921 ) ( CLEAR ?auto_51904 ) ( not ( = ?auto_51904 ?auto_51921 ) ) ( not ( = ?auto_51905 ?auto_51921 ) ) ( IS-CRATE ?auto_51905 ) ( not ( = ?auto_51904 ?auto_51925 ) ) ( not ( = ?auto_51905 ?auto_51925 ) ) ( not ( = ?auto_51921 ?auto_51925 ) ) ( not ( = ?auto_51922 ?auto_51912 ) ) ( not ( = ?auto_51920 ?auto_51922 ) ) ( HOIST-AT ?auto_51909 ?auto_51922 ) ( not ( = ?auto_51915 ?auto_51909 ) ) ( not ( = ?auto_51923 ?auto_51909 ) ) ( AVAILABLE ?auto_51909 ) ( SURFACE-AT ?auto_51905 ?auto_51922 ) ( ON ?auto_51905 ?auto_51914 ) ( CLEAR ?auto_51905 ) ( not ( = ?auto_51904 ?auto_51914 ) ) ( not ( = ?auto_51905 ?auto_51914 ) ) ( not ( = ?auto_51921 ?auto_51914 ) ) ( not ( = ?auto_51925 ?auto_51914 ) ) ( IS-CRATE ?auto_51925 ) ( not ( = ?auto_51904 ?auto_51910 ) ) ( not ( = ?auto_51905 ?auto_51910 ) ) ( not ( = ?auto_51921 ?auto_51910 ) ) ( not ( = ?auto_51925 ?auto_51910 ) ) ( not ( = ?auto_51914 ?auto_51910 ) ) ( not ( = ?auto_51908 ?auto_51912 ) ) ( not ( = ?auto_51920 ?auto_51908 ) ) ( not ( = ?auto_51922 ?auto_51908 ) ) ( HOIST-AT ?auto_51926 ?auto_51908 ) ( not ( = ?auto_51915 ?auto_51926 ) ) ( not ( = ?auto_51923 ?auto_51926 ) ) ( not ( = ?auto_51909 ?auto_51926 ) ) ( AVAILABLE ?auto_51926 ) ( SURFACE-AT ?auto_51925 ?auto_51908 ) ( ON ?auto_51925 ?auto_51913 ) ( CLEAR ?auto_51925 ) ( not ( = ?auto_51904 ?auto_51913 ) ) ( not ( = ?auto_51905 ?auto_51913 ) ) ( not ( = ?auto_51921 ?auto_51913 ) ) ( not ( = ?auto_51925 ?auto_51913 ) ) ( not ( = ?auto_51914 ?auto_51913 ) ) ( not ( = ?auto_51910 ?auto_51913 ) ) ( IS-CRATE ?auto_51910 ) ( not ( = ?auto_51904 ?auto_51916 ) ) ( not ( = ?auto_51905 ?auto_51916 ) ) ( not ( = ?auto_51921 ?auto_51916 ) ) ( not ( = ?auto_51925 ?auto_51916 ) ) ( not ( = ?auto_51914 ?auto_51916 ) ) ( not ( = ?auto_51910 ?auto_51916 ) ) ( not ( = ?auto_51913 ?auto_51916 ) ) ( not ( = ?auto_51927 ?auto_51912 ) ) ( not ( = ?auto_51920 ?auto_51927 ) ) ( not ( = ?auto_51922 ?auto_51927 ) ) ( not ( = ?auto_51908 ?auto_51927 ) ) ( HOIST-AT ?auto_51917 ?auto_51927 ) ( not ( = ?auto_51915 ?auto_51917 ) ) ( not ( = ?auto_51923 ?auto_51917 ) ) ( not ( = ?auto_51909 ?auto_51917 ) ) ( not ( = ?auto_51926 ?auto_51917 ) ) ( AVAILABLE ?auto_51917 ) ( SURFACE-AT ?auto_51910 ?auto_51927 ) ( ON ?auto_51910 ?auto_51919 ) ( CLEAR ?auto_51910 ) ( not ( = ?auto_51904 ?auto_51919 ) ) ( not ( = ?auto_51905 ?auto_51919 ) ) ( not ( = ?auto_51921 ?auto_51919 ) ) ( not ( = ?auto_51925 ?auto_51919 ) ) ( not ( = ?auto_51914 ?auto_51919 ) ) ( not ( = ?auto_51910 ?auto_51919 ) ) ( not ( = ?auto_51913 ?auto_51919 ) ) ( not ( = ?auto_51916 ?auto_51919 ) ) ( IS-CRATE ?auto_51916 ) ( not ( = ?auto_51904 ?auto_51906 ) ) ( not ( = ?auto_51905 ?auto_51906 ) ) ( not ( = ?auto_51921 ?auto_51906 ) ) ( not ( = ?auto_51925 ?auto_51906 ) ) ( not ( = ?auto_51914 ?auto_51906 ) ) ( not ( = ?auto_51910 ?auto_51906 ) ) ( not ( = ?auto_51913 ?auto_51906 ) ) ( not ( = ?auto_51916 ?auto_51906 ) ) ( not ( = ?auto_51919 ?auto_51906 ) ) ( not ( = ?auto_51924 ?auto_51912 ) ) ( not ( = ?auto_51920 ?auto_51924 ) ) ( not ( = ?auto_51922 ?auto_51924 ) ) ( not ( = ?auto_51908 ?auto_51924 ) ) ( not ( = ?auto_51927 ?auto_51924 ) ) ( HOIST-AT ?auto_51911 ?auto_51924 ) ( not ( = ?auto_51915 ?auto_51911 ) ) ( not ( = ?auto_51923 ?auto_51911 ) ) ( not ( = ?auto_51909 ?auto_51911 ) ) ( not ( = ?auto_51926 ?auto_51911 ) ) ( not ( = ?auto_51917 ?auto_51911 ) ) ( AVAILABLE ?auto_51911 ) ( SURFACE-AT ?auto_51916 ?auto_51924 ) ( ON ?auto_51916 ?auto_51918 ) ( CLEAR ?auto_51916 ) ( not ( = ?auto_51904 ?auto_51918 ) ) ( not ( = ?auto_51905 ?auto_51918 ) ) ( not ( = ?auto_51921 ?auto_51918 ) ) ( not ( = ?auto_51925 ?auto_51918 ) ) ( not ( = ?auto_51914 ?auto_51918 ) ) ( not ( = ?auto_51910 ?auto_51918 ) ) ( not ( = ?auto_51913 ?auto_51918 ) ) ( not ( = ?auto_51916 ?auto_51918 ) ) ( not ( = ?auto_51919 ?auto_51918 ) ) ( not ( = ?auto_51906 ?auto_51918 ) ) ( TRUCK-AT ?auto_51907 ?auto_51912 ) ( SURFACE-AT ?auto_51928 ?auto_51912 ) ( CLEAR ?auto_51928 ) ( LIFTING ?auto_51915 ?auto_51906 ) ( IS-CRATE ?auto_51906 ) ( not ( = ?auto_51904 ?auto_51928 ) ) ( not ( = ?auto_51905 ?auto_51928 ) ) ( not ( = ?auto_51921 ?auto_51928 ) ) ( not ( = ?auto_51925 ?auto_51928 ) ) ( not ( = ?auto_51914 ?auto_51928 ) ) ( not ( = ?auto_51910 ?auto_51928 ) ) ( not ( = ?auto_51913 ?auto_51928 ) ) ( not ( = ?auto_51916 ?auto_51928 ) ) ( not ( = ?auto_51919 ?auto_51928 ) ) ( not ( = ?auto_51906 ?auto_51928 ) ) ( not ( = ?auto_51918 ?auto_51928 ) ) )
    :subtasks
    ( ( !DROP ?auto_51915 ?auto_51906 ?auto_51928 ?auto_51912 )
      ( MAKE-ON ?auto_51904 ?auto_51905 )
      ( MAKE-ON-VERIFY ?auto_51904 ?auto_51905 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51929 - SURFACE
      ?auto_51930 - SURFACE
    )
    :vars
    (
      ?auto_51939 - HOIST
      ?auto_51947 - PLACE
      ?auto_51946 - PLACE
      ?auto_51943 - HOIST
      ?auto_51933 - SURFACE
      ?auto_51950 - SURFACE
      ?auto_51938 - PLACE
      ?auto_51932 - HOIST
      ?auto_51948 - SURFACE
      ?auto_51944 - SURFACE
      ?auto_51951 - PLACE
      ?auto_51936 - HOIST
      ?auto_51940 - SURFACE
      ?auto_51952 - SURFACE
      ?auto_51937 - PLACE
      ?auto_51935 - HOIST
      ?auto_51953 - SURFACE
      ?auto_51934 - SURFACE
      ?auto_51949 - PLACE
      ?auto_51941 - HOIST
      ?auto_51942 - SURFACE
      ?auto_51945 - TRUCK
      ?auto_51931 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51939 ?auto_51947 ) ( IS-CRATE ?auto_51929 ) ( not ( = ?auto_51929 ?auto_51930 ) ) ( not ( = ?auto_51946 ?auto_51947 ) ) ( HOIST-AT ?auto_51943 ?auto_51946 ) ( not ( = ?auto_51939 ?auto_51943 ) ) ( AVAILABLE ?auto_51943 ) ( SURFACE-AT ?auto_51929 ?auto_51946 ) ( ON ?auto_51929 ?auto_51933 ) ( CLEAR ?auto_51929 ) ( not ( = ?auto_51929 ?auto_51933 ) ) ( not ( = ?auto_51930 ?auto_51933 ) ) ( IS-CRATE ?auto_51930 ) ( not ( = ?auto_51929 ?auto_51950 ) ) ( not ( = ?auto_51930 ?auto_51950 ) ) ( not ( = ?auto_51933 ?auto_51950 ) ) ( not ( = ?auto_51938 ?auto_51947 ) ) ( not ( = ?auto_51946 ?auto_51938 ) ) ( HOIST-AT ?auto_51932 ?auto_51938 ) ( not ( = ?auto_51939 ?auto_51932 ) ) ( not ( = ?auto_51943 ?auto_51932 ) ) ( AVAILABLE ?auto_51932 ) ( SURFACE-AT ?auto_51930 ?auto_51938 ) ( ON ?auto_51930 ?auto_51948 ) ( CLEAR ?auto_51930 ) ( not ( = ?auto_51929 ?auto_51948 ) ) ( not ( = ?auto_51930 ?auto_51948 ) ) ( not ( = ?auto_51933 ?auto_51948 ) ) ( not ( = ?auto_51950 ?auto_51948 ) ) ( IS-CRATE ?auto_51950 ) ( not ( = ?auto_51929 ?auto_51944 ) ) ( not ( = ?auto_51930 ?auto_51944 ) ) ( not ( = ?auto_51933 ?auto_51944 ) ) ( not ( = ?auto_51950 ?auto_51944 ) ) ( not ( = ?auto_51948 ?auto_51944 ) ) ( not ( = ?auto_51951 ?auto_51947 ) ) ( not ( = ?auto_51946 ?auto_51951 ) ) ( not ( = ?auto_51938 ?auto_51951 ) ) ( HOIST-AT ?auto_51936 ?auto_51951 ) ( not ( = ?auto_51939 ?auto_51936 ) ) ( not ( = ?auto_51943 ?auto_51936 ) ) ( not ( = ?auto_51932 ?auto_51936 ) ) ( AVAILABLE ?auto_51936 ) ( SURFACE-AT ?auto_51950 ?auto_51951 ) ( ON ?auto_51950 ?auto_51940 ) ( CLEAR ?auto_51950 ) ( not ( = ?auto_51929 ?auto_51940 ) ) ( not ( = ?auto_51930 ?auto_51940 ) ) ( not ( = ?auto_51933 ?auto_51940 ) ) ( not ( = ?auto_51950 ?auto_51940 ) ) ( not ( = ?auto_51948 ?auto_51940 ) ) ( not ( = ?auto_51944 ?auto_51940 ) ) ( IS-CRATE ?auto_51944 ) ( not ( = ?auto_51929 ?auto_51952 ) ) ( not ( = ?auto_51930 ?auto_51952 ) ) ( not ( = ?auto_51933 ?auto_51952 ) ) ( not ( = ?auto_51950 ?auto_51952 ) ) ( not ( = ?auto_51948 ?auto_51952 ) ) ( not ( = ?auto_51944 ?auto_51952 ) ) ( not ( = ?auto_51940 ?auto_51952 ) ) ( not ( = ?auto_51937 ?auto_51947 ) ) ( not ( = ?auto_51946 ?auto_51937 ) ) ( not ( = ?auto_51938 ?auto_51937 ) ) ( not ( = ?auto_51951 ?auto_51937 ) ) ( HOIST-AT ?auto_51935 ?auto_51937 ) ( not ( = ?auto_51939 ?auto_51935 ) ) ( not ( = ?auto_51943 ?auto_51935 ) ) ( not ( = ?auto_51932 ?auto_51935 ) ) ( not ( = ?auto_51936 ?auto_51935 ) ) ( AVAILABLE ?auto_51935 ) ( SURFACE-AT ?auto_51944 ?auto_51937 ) ( ON ?auto_51944 ?auto_51953 ) ( CLEAR ?auto_51944 ) ( not ( = ?auto_51929 ?auto_51953 ) ) ( not ( = ?auto_51930 ?auto_51953 ) ) ( not ( = ?auto_51933 ?auto_51953 ) ) ( not ( = ?auto_51950 ?auto_51953 ) ) ( not ( = ?auto_51948 ?auto_51953 ) ) ( not ( = ?auto_51944 ?auto_51953 ) ) ( not ( = ?auto_51940 ?auto_51953 ) ) ( not ( = ?auto_51952 ?auto_51953 ) ) ( IS-CRATE ?auto_51952 ) ( not ( = ?auto_51929 ?auto_51934 ) ) ( not ( = ?auto_51930 ?auto_51934 ) ) ( not ( = ?auto_51933 ?auto_51934 ) ) ( not ( = ?auto_51950 ?auto_51934 ) ) ( not ( = ?auto_51948 ?auto_51934 ) ) ( not ( = ?auto_51944 ?auto_51934 ) ) ( not ( = ?auto_51940 ?auto_51934 ) ) ( not ( = ?auto_51952 ?auto_51934 ) ) ( not ( = ?auto_51953 ?auto_51934 ) ) ( not ( = ?auto_51949 ?auto_51947 ) ) ( not ( = ?auto_51946 ?auto_51949 ) ) ( not ( = ?auto_51938 ?auto_51949 ) ) ( not ( = ?auto_51951 ?auto_51949 ) ) ( not ( = ?auto_51937 ?auto_51949 ) ) ( HOIST-AT ?auto_51941 ?auto_51949 ) ( not ( = ?auto_51939 ?auto_51941 ) ) ( not ( = ?auto_51943 ?auto_51941 ) ) ( not ( = ?auto_51932 ?auto_51941 ) ) ( not ( = ?auto_51936 ?auto_51941 ) ) ( not ( = ?auto_51935 ?auto_51941 ) ) ( AVAILABLE ?auto_51941 ) ( SURFACE-AT ?auto_51952 ?auto_51949 ) ( ON ?auto_51952 ?auto_51942 ) ( CLEAR ?auto_51952 ) ( not ( = ?auto_51929 ?auto_51942 ) ) ( not ( = ?auto_51930 ?auto_51942 ) ) ( not ( = ?auto_51933 ?auto_51942 ) ) ( not ( = ?auto_51950 ?auto_51942 ) ) ( not ( = ?auto_51948 ?auto_51942 ) ) ( not ( = ?auto_51944 ?auto_51942 ) ) ( not ( = ?auto_51940 ?auto_51942 ) ) ( not ( = ?auto_51952 ?auto_51942 ) ) ( not ( = ?auto_51953 ?auto_51942 ) ) ( not ( = ?auto_51934 ?auto_51942 ) ) ( TRUCK-AT ?auto_51945 ?auto_51947 ) ( SURFACE-AT ?auto_51931 ?auto_51947 ) ( CLEAR ?auto_51931 ) ( IS-CRATE ?auto_51934 ) ( not ( = ?auto_51929 ?auto_51931 ) ) ( not ( = ?auto_51930 ?auto_51931 ) ) ( not ( = ?auto_51933 ?auto_51931 ) ) ( not ( = ?auto_51950 ?auto_51931 ) ) ( not ( = ?auto_51948 ?auto_51931 ) ) ( not ( = ?auto_51944 ?auto_51931 ) ) ( not ( = ?auto_51940 ?auto_51931 ) ) ( not ( = ?auto_51952 ?auto_51931 ) ) ( not ( = ?auto_51953 ?auto_51931 ) ) ( not ( = ?auto_51934 ?auto_51931 ) ) ( not ( = ?auto_51942 ?auto_51931 ) ) ( AVAILABLE ?auto_51939 ) ( IN ?auto_51934 ?auto_51945 ) )
    :subtasks
    ( ( !UNLOAD ?auto_51939 ?auto_51934 ?auto_51945 ?auto_51947 )
      ( MAKE-ON ?auto_51929 ?auto_51930 )
      ( MAKE-ON-VERIFY ?auto_51929 ?auto_51930 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51954 - SURFACE
      ?auto_51955 - SURFACE
    )
    :vars
    (
      ?auto_51969 - HOIST
      ?auto_51961 - PLACE
      ?auto_51956 - PLACE
      ?auto_51978 - HOIST
      ?auto_51967 - SURFACE
      ?auto_51960 - SURFACE
      ?auto_51962 - PLACE
      ?auto_51965 - HOIST
      ?auto_51970 - SURFACE
      ?auto_51964 - SURFACE
      ?auto_51971 - PLACE
      ?auto_51975 - HOIST
      ?auto_51977 - SURFACE
      ?auto_51972 - SURFACE
      ?auto_51974 - PLACE
      ?auto_51968 - HOIST
      ?auto_51973 - SURFACE
      ?auto_51957 - SURFACE
      ?auto_51959 - PLACE
      ?auto_51966 - HOIST
      ?auto_51963 - SURFACE
      ?auto_51976 - SURFACE
      ?auto_51958 - TRUCK
      ?auto_51979 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51969 ?auto_51961 ) ( IS-CRATE ?auto_51954 ) ( not ( = ?auto_51954 ?auto_51955 ) ) ( not ( = ?auto_51956 ?auto_51961 ) ) ( HOIST-AT ?auto_51978 ?auto_51956 ) ( not ( = ?auto_51969 ?auto_51978 ) ) ( AVAILABLE ?auto_51978 ) ( SURFACE-AT ?auto_51954 ?auto_51956 ) ( ON ?auto_51954 ?auto_51967 ) ( CLEAR ?auto_51954 ) ( not ( = ?auto_51954 ?auto_51967 ) ) ( not ( = ?auto_51955 ?auto_51967 ) ) ( IS-CRATE ?auto_51955 ) ( not ( = ?auto_51954 ?auto_51960 ) ) ( not ( = ?auto_51955 ?auto_51960 ) ) ( not ( = ?auto_51967 ?auto_51960 ) ) ( not ( = ?auto_51962 ?auto_51961 ) ) ( not ( = ?auto_51956 ?auto_51962 ) ) ( HOIST-AT ?auto_51965 ?auto_51962 ) ( not ( = ?auto_51969 ?auto_51965 ) ) ( not ( = ?auto_51978 ?auto_51965 ) ) ( AVAILABLE ?auto_51965 ) ( SURFACE-AT ?auto_51955 ?auto_51962 ) ( ON ?auto_51955 ?auto_51970 ) ( CLEAR ?auto_51955 ) ( not ( = ?auto_51954 ?auto_51970 ) ) ( not ( = ?auto_51955 ?auto_51970 ) ) ( not ( = ?auto_51967 ?auto_51970 ) ) ( not ( = ?auto_51960 ?auto_51970 ) ) ( IS-CRATE ?auto_51960 ) ( not ( = ?auto_51954 ?auto_51964 ) ) ( not ( = ?auto_51955 ?auto_51964 ) ) ( not ( = ?auto_51967 ?auto_51964 ) ) ( not ( = ?auto_51960 ?auto_51964 ) ) ( not ( = ?auto_51970 ?auto_51964 ) ) ( not ( = ?auto_51971 ?auto_51961 ) ) ( not ( = ?auto_51956 ?auto_51971 ) ) ( not ( = ?auto_51962 ?auto_51971 ) ) ( HOIST-AT ?auto_51975 ?auto_51971 ) ( not ( = ?auto_51969 ?auto_51975 ) ) ( not ( = ?auto_51978 ?auto_51975 ) ) ( not ( = ?auto_51965 ?auto_51975 ) ) ( AVAILABLE ?auto_51975 ) ( SURFACE-AT ?auto_51960 ?auto_51971 ) ( ON ?auto_51960 ?auto_51977 ) ( CLEAR ?auto_51960 ) ( not ( = ?auto_51954 ?auto_51977 ) ) ( not ( = ?auto_51955 ?auto_51977 ) ) ( not ( = ?auto_51967 ?auto_51977 ) ) ( not ( = ?auto_51960 ?auto_51977 ) ) ( not ( = ?auto_51970 ?auto_51977 ) ) ( not ( = ?auto_51964 ?auto_51977 ) ) ( IS-CRATE ?auto_51964 ) ( not ( = ?auto_51954 ?auto_51972 ) ) ( not ( = ?auto_51955 ?auto_51972 ) ) ( not ( = ?auto_51967 ?auto_51972 ) ) ( not ( = ?auto_51960 ?auto_51972 ) ) ( not ( = ?auto_51970 ?auto_51972 ) ) ( not ( = ?auto_51964 ?auto_51972 ) ) ( not ( = ?auto_51977 ?auto_51972 ) ) ( not ( = ?auto_51974 ?auto_51961 ) ) ( not ( = ?auto_51956 ?auto_51974 ) ) ( not ( = ?auto_51962 ?auto_51974 ) ) ( not ( = ?auto_51971 ?auto_51974 ) ) ( HOIST-AT ?auto_51968 ?auto_51974 ) ( not ( = ?auto_51969 ?auto_51968 ) ) ( not ( = ?auto_51978 ?auto_51968 ) ) ( not ( = ?auto_51965 ?auto_51968 ) ) ( not ( = ?auto_51975 ?auto_51968 ) ) ( AVAILABLE ?auto_51968 ) ( SURFACE-AT ?auto_51964 ?auto_51974 ) ( ON ?auto_51964 ?auto_51973 ) ( CLEAR ?auto_51964 ) ( not ( = ?auto_51954 ?auto_51973 ) ) ( not ( = ?auto_51955 ?auto_51973 ) ) ( not ( = ?auto_51967 ?auto_51973 ) ) ( not ( = ?auto_51960 ?auto_51973 ) ) ( not ( = ?auto_51970 ?auto_51973 ) ) ( not ( = ?auto_51964 ?auto_51973 ) ) ( not ( = ?auto_51977 ?auto_51973 ) ) ( not ( = ?auto_51972 ?auto_51973 ) ) ( IS-CRATE ?auto_51972 ) ( not ( = ?auto_51954 ?auto_51957 ) ) ( not ( = ?auto_51955 ?auto_51957 ) ) ( not ( = ?auto_51967 ?auto_51957 ) ) ( not ( = ?auto_51960 ?auto_51957 ) ) ( not ( = ?auto_51970 ?auto_51957 ) ) ( not ( = ?auto_51964 ?auto_51957 ) ) ( not ( = ?auto_51977 ?auto_51957 ) ) ( not ( = ?auto_51972 ?auto_51957 ) ) ( not ( = ?auto_51973 ?auto_51957 ) ) ( not ( = ?auto_51959 ?auto_51961 ) ) ( not ( = ?auto_51956 ?auto_51959 ) ) ( not ( = ?auto_51962 ?auto_51959 ) ) ( not ( = ?auto_51971 ?auto_51959 ) ) ( not ( = ?auto_51974 ?auto_51959 ) ) ( HOIST-AT ?auto_51966 ?auto_51959 ) ( not ( = ?auto_51969 ?auto_51966 ) ) ( not ( = ?auto_51978 ?auto_51966 ) ) ( not ( = ?auto_51965 ?auto_51966 ) ) ( not ( = ?auto_51975 ?auto_51966 ) ) ( not ( = ?auto_51968 ?auto_51966 ) ) ( AVAILABLE ?auto_51966 ) ( SURFACE-AT ?auto_51972 ?auto_51959 ) ( ON ?auto_51972 ?auto_51963 ) ( CLEAR ?auto_51972 ) ( not ( = ?auto_51954 ?auto_51963 ) ) ( not ( = ?auto_51955 ?auto_51963 ) ) ( not ( = ?auto_51967 ?auto_51963 ) ) ( not ( = ?auto_51960 ?auto_51963 ) ) ( not ( = ?auto_51970 ?auto_51963 ) ) ( not ( = ?auto_51964 ?auto_51963 ) ) ( not ( = ?auto_51977 ?auto_51963 ) ) ( not ( = ?auto_51972 ?auto_51963 ) ) ( not ( = ?auto_51973 ?auto_51963 ) ) ( not ( = ?auto_51957 ?auto_51963 ) ) ( SURFACE-AT ?auto_51976 ?auto_51961 ) ( CLEAR ?auto_51976 ) ( IS-CRATE ?auto_51957 ) ( not ( = ?auto_51954 ?auto_51976 ) ) ( not ( = ?auto_51955 ?auto_51976 ) ) ( not ( = ?auto_51967 ?auto_51976 ) ) ( not ( = ?auto_51960 ?auto_51976 ) ) ( not ( = ?auto_51970 ?auto_51976 ) ) ( not ( = ?auto_51964 ?auto_51976 ) ) ( not ( = ?auto_51977 ?auto_51976 ) ) ( not ( = ?auto_51972 ?auto_51976 ) ) ( not ( = ?auto_51973 ?auto_51976 ) ) ( not ( = ?auto_51957 ?auto_51976 ) ) ( not ( = ?auto_51963 ?auto_51976 ) ) ( AVAILABLE ?auto_51969 ) ( IN ?auto_51957 ?auto_51958 ) ( TRUCK-AT ?auto_51958 ?auto_51979 ) ( not ( = ?auto_51979 ?auto_51961 ) ) ( not ( = ?auto_51956 ?auto_51979 ) ) ( not ( = ?auto_51962 ?auto_51979 ) ) ( not ( = ?auto_51971 ?auto_51979 ) ) ( not ( = ?auto_51974 ?auto_51979 ) ) ( not ( = ?auto_51959 ?auto_51979 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_51958 ?auto_51979 ?auto_51961 )
      ( MAKE-ON ?auto_51954 ?auto_51955 )
      ( MAKE-ON-VERIFY ?auto_51954 ?auto_51955 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51980 - SURFACE
      ?auto_51981 - SURFACE
    )
    :vars
    (
      ?auto_51993 - HOIST
      ?auto_52002 - PLACE
      ?auto_51995 - PLACE
      ?auto_51983 - HOIST
      ?auto_51990 - SURFACE
      ?auto_51987 - SURFACE
      ?auto_51992 - PLACE
      ?auto_51989 - HOIST
      ?auto_52004 - SURFACE
      ?auto_51994 - SURFACE
      ?auto_52005 - PLACE
      ?auto_51998 - HOIST
      ?auto_52000 - SURFACE
      ?auto_51984 - SURFACE
      ?auto_51997 - PLACE
      ?auto_51991 - HOIST
      ?auto_51985 - SURFACE
      ?auto_52001 - SURFACE
      ?auto_51986 - PLACE
      ?auto_51988 - HOIST
      ?auto_52003 - SURFACE
      ?auto_51999 - SURFACE
      ?auto_51982 - TRUCK
      ?auto_51996 - PLACE
      ?auto_52006 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_51993 ?auto_52002 ) ( IS-CRATE ?auto_51980 ) ( not ( = ?auto_51980 ?auto_51981 ) ) ( not ( = ?auto_51995 ?auto_52002 ) ) ( HOIST-AT ?auto_51983 ?auto_51995 ) ( not ( = ?auto_51993 ?auto_51983 ) ) ( AVAILABLE ?auto_51983 ) ( SURFACE-AT ?auto_51980 ?auto_51995 ) ( ON ?auto_51980 ?auto_51990 ) ( CLEAR ?auto_51980 ) ( not ( = ?auto_51980 ?auto_51990 ) ) ( not ( = ?auto_51981 ?auto_51990 ) ) ( IS-CRATE ?auto_51981 ) ( not ( = ?auto_51980 ?auto_51987 ) ) ( not ( = ?auto_51981 ?auto_51987 ) ) ( not ( = ?auto_51990 ?auto_51987 ) ) ( not ( = ?auto_51992 ?auto_52002 ) ) ( not ( = ?auto_51995 ?auto_51992 ) ) ( HOIST-AT ?auto_51989 ?auto_51992 ) ( not ( = ?auto_51993 ?auto_51989 ) ) ( not ( = ?auto_51983 ?auto_51989 ) ) ( AVAILABLE ?auto_51989 ) ( SURFACE-AT ?auto_51981 ?auto_51992 ) ( ON ?auto_51981 ?auto_52004 ) ( CLEAR ?auto_51981 ) ( not ( = ?auto_51980 ?auto_52004 ) ) ( not ( = ?auto_51981 ?auto_52004 ) ) ( not ( = ?auto_51990 ?auto_52004 ) ) ( not ( = ?auto_51987 ?auto_52004 ) ) ( IS-CRATE ?auto_51987 ) ( not ( = ?auto_51980 ?auto_51994 ) ) ( not ( = ?auto_51981 ?auto_51994 ) ) ( not ( = ?auto_51990 ?auto_51994 ) ) ( not ( = ?auto_51987 ?auto_51994 ) ) ( not ( = ?auto_52004 ?auto_51994 ) ) ( not ( = ?auto_52005 ?auto_52002 ) ) ( not ( = ?auto_51995 ?auto_52005 ) ) ( not ( = ?auto_51992 ?auto_52005 ) ) ( HOIST-AT ?auto_51998 ?auto_52005 ) ( not ( = ?auto_51993 ?auto_51998 ) ) ( not ( = ?auto_51983 ?auto_51998 ) ) ( not ( = ?auto_51989 ?auto_51998 ) ) ( AVAILABLE ?auto_51998 ) ( SURFACE-AT ?auto_51987 ?auto_52005 ) ( ON ?auto_51987 ?auto_52000 ) ( CLEAR ?auto_51987 ) ( not ( = ?auto_51980 ?auto_52000 ) ) ( not ( = ?auto_51981 ?auto_52000 ) ) ( not ( = ?auto_51990 ?auto_52000 ) ) ( not ( = ?auto_51987 ?auto_52000 ) ) ( not ( = ?auto_52004 ?auto_52000 ) ) ( not ( = ?auto_51994 ?auto_52000 ) ) ( IS-CRATE ?auto_51994 ) ( not ( = ?auto_51980 ?auto_51984 ) ) ( not ( = ?auto_51981 ?auto_51984 ) ) ( not ( = ?auto_51990 ?auto_51984 ) ) ( not ( = ?auto_51987 ?auto_51984 ) ) ( not ( = ?auto_52004 ?auto_51984 ) ) ( not ( = ?auto_51994 ?auto_51984 ) ) ( not ( = ?auto_52000 ?auto_51984 ) ) ( not ( = ?auto_51997 ?auto_52002 ) ) ( not ( = ?auto_51995 ?auto_51997 ) ) ( not ( = ?auto_51992 ?auto_51997 ) ) ( not ( = ?auto_52005 ?auto_51997 ) ) ( HOIST-AT ?auto_51991 ?auto_51997 ) ( not ( = ?auto_51993 ?auto_51991 ) ) ( not ( = ?auto_51983 ?auto_51991 ) ) ( not ( = ?auto_51989 ?auto_51991 ) ) ( not ( = ?auto_51998 ?auto_51991 ) ) ( AVAILABLE ?auto_51991 ) ( SURFACE-AT ?auto_51994 ?auto_51997 ) ( ON ?auto_51994 ?auto_51985 ) ( CLEAR ?auto_51994 ) ( not ( = ?auto_51980 ?auto_51985 ) ) ( not ( = ?auto_51981 ?auto_51985 ) ) ( not ( = ?auto_51990 ?auto_51985 ) ) ( not ( = ?auto_51987 ?auto_51985 ) ) ( not ( = ?auto_52004 ?auto_51985 ) ) ( not ( = ?auto_51994 ?auto_51985 ) ) ( not ( = ?auto_52000 ?auto_51985 ) ) ( not ( = ?auto_51984 ?auto_51985 ) ) ( IS-CRATE ?auto_51984 ) ( not ( = ?auto_51980 ?auto_52001 ) ) ( not ( = ?auto_51981 ?auto_52001 ) ) ( not ( = ?auto_51990 ?auto_52001 ) ) ( not ( = ?auto_51987 ?auto_52001 ) ) ( not ( = ?auto_52004 ?auto_52001 ) ) ( not ( = ?auto_51994 ?auto_52001 ) ) ( not ( = ?auto_52000 ?auto_52001 ) ) ( not ( = ?auto_51984 ?auto_52001 ) ) ( not ( = ?auto_51985 ?auto_52001 ) ) ( not ( = ?auto_51986 ?auto_52002 ) ) ( not ( = ?auto_51995 ?auto_51986 ) ) ( not ( = ?auto_51992 ?auto_51986 ) ) ( not ( = ?auto_52005 ?auto_51986 ) ) ( not ( = ?auto_51997 ?auto_51986 ) ) ( HOIST-AT ?auto_51988 ?auto_51986 ) ( not ( = ?auto_51993 ?auto_51988 ) ) ( not ( = ?auto_51983 ?auto_51988 ) ) ( not ( = ?auto_51989 ?auto_51988 ) ) ( not ( = ?auto_51998 ?auto_51988 ) ) ( not ( = ?auto_51991 ?auto_51988 ) ) ( AVAILABLE ?auto_51988 ) ( SURFACE-AT ?auto_51984 ?auto_51986 ) ( ON ?auto_51984 ?auto_52003 ) ( CLEAR ?auto_51984 ) ( not ( = ?auto_51980 ?auto_52003 ) ) ( not ( = ?auto_51981 ?auto_52003 ) ) ( not ( = ?auto_51990 ?auto_52003 ) ) ( not ( = ?auto_51987 ?auto_52003 ) ) ( not ( = ?auto_52004 ?auto_52003 ) ) ( not ( = ?auto_51994 ?auto_52003 ) ) ( not ( = ?auto_52000 ?auto_52003 ) ) ( not ( = ?auto_51984 ?auto_52003 ) ) ( not ( = ?auto_51985 ?auto_52003 ) ) ( not ( = ?auto_52001 ?auto_52003 ) ) ( SURFACE-AT ?auto_51999 ?auto_52002 ) ( CLEAR ?auto_51999 ) ( IS-CRATE ?auto_52001 ) ( not ( = ?auto_51980 ?auto_51999 ) ) ( not ( = ?auto_51981 ?auto_51999 ) ) ( not ( = ?auto_51990 ?auto_51999 ) ) ( not ( = ?auto_51987 ?auto_51999 ) ) ( not ( = ?auto_52004 ?auto_51999 ) ) ( not ( = ?auto_51994 ?auto_51999 ) ) ( not ( = ?auto_52000 ?auto_51999 ) ) ( not ( = ?auto_51984 ?auto_51999 ) ) ( not ( = ?auto_51985 ?auto_51999 ) ) ( not ( = ?auto_52001 ?auto_51999 ) ) ( not ( = ?auto_52003 ?auto_51999 ) ) ( AVAILABLE ?auto_51993 ) ( TRUCK-AT ?auto_51982 ?auto_51996 ) ( not ( = ?auto_51996 ?auto_52002 ) ) ( not ( = ?auto_51995 ?auto_51996 ) ) ( not ( = ?auto_51992 ?auto_51996 ) ) ( not ( = ?auto_52005 ?auto_51996 ) ) ( not ( = ?auto_51997 ?auto_51996 ) ) ( not ( = ?auto_51986 ?auto_51996 ) ) ( HOIST-AT ?auto_52006 ?auto_51996 ) ( LIFTING ?auto_52006 ?auto_52001 ) ( not ( = ?auto_51993 ?auto_52006 ) ) ( not ( = ?auto_51983 ?auto_52006 ) ) ( not ( = ?auto_51989 ?auto_52006 ) ) ( not ( = ?auto_51998 ?auto_52006 ) ) ( not ( = ?auto_51991 ?auto_52006 ) ) ( not ( = ?auto_51988 ?auto_52006 ) ) )
    :subtasks
    ( ( !LOAD ?auto_52006 ?auto_52001 ?auto_51982 ?auto_51996 )
      ( MAKE-ON ?auto_51980 ?auto_51981 )
      ( MAKE-ON-VERIFY ?auto_51980 ?auto_51981 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52007 - SURFACE
      ?auto_52008 - SURFACE
    )
    :vars
    (
      ?auto_52013 - HOIST
      ?auto_52022 - PLACE
      ?auto_52031 - PLACE
      ?auto_52017 - HOIST
      ?auto_52029 - SURFACE
      ?auto_52030 - SURFACE
      ?auto_52012 - PLACE
      ?auto_52018 - HOIST
      ?auto_52027 - SURFACE
      ?auto_52025 - SURFACE
      ?auto_52019 - PLACE
      ?auto_52010 - HOIST
      ?auto_52020 - SURFACE
      ?auto_52015 - SURFACE
      ?auto_52028 - PLACE
      ?auto_52024 - HOIST
      ?auto_52016 - SURFACE
      ?auto_52021 - SURFACE
      ?auto_52009 - PLACE
      ?auto_52011 - HOIST
      ?auto_52026 - SURFACE
      ?auto_52033 - SURFACE
      ?auto_52032 - TRUCK
      ?auto_52014 - PLACE
      ?auto_52023 - HOIST
      ?auto_52034 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52013 ?auto_52022 ) ( IS-CRATE ?auto_52007 ) ( not ( = ?auto_52007 ?auto_52008 ) ) ( not ( = ?auto_52031 ?auto_52022 ) ) ( HOIST-AT ?auto_52017 ?auto_52031 ) ( not ( = ?auto_52013 ?auto_52017 ) ) ( AVAILABLE ?auto_52017 ) ( SURFACE-AT ?auto_52007 ?auto_52031 ) ( ON ?auto_52007 ?auto_52029 ) ( CLEAR ?auto_52007 ) ( not ( = ?auto_52007 ?auto_52029 ) ) ( not ( = ?auto_52008 ?auto_52029 ) ) ( IS-CRATE ?auto_52008 ) ( not ( = ?auto_52007 ?auto_52030 ) ) ( not ( = ?auto_52008 ?auto_52030 ) ) ( not ( = ?auto_52029 ?auto_52030 ) ) ( not ( = ?auto_52012 ?auto_52022 ) ) ( not ( = ?auto_52031 ?auto_52012 ) ) ( HOIST-AT ?auto_52018 ?auto_52012 ) ( not ( = ?auto_52013 ?auto_52018 ) ) ( not ( = ?auto_52017 ?auto_52018 ) ) ( AVAILABLE ?auto_52018 ) ( SURFACE-AT ?auto_52008 ?auto_52012 ) ( ON ?auto_52008 ?auto_52027 ) ( CLEAR ?auto_52008 ) ( not ( = ?auto_52007 ?auto_52027 ) ) ( not ( = ?auto_52008 ?auto_52027 ) ) ( not ( = ?auto_52029 ?auto_52027 ) ) ( not ( = ?auto_52030 ?auto_52027 ) ) ( IS-CRATE ?auto_52030 ) ( not ( = ?auto_52007 ?auto_52025 ) ) ( not ( = ?auto_52008 ?auto_52025 ) ) ( not ( = ?auto_52029 ?auto_52025 ) ) ( not ( = ?auto_52030 ?auto_52025 ) ) ( not ( = ?auto_52027 ?auto_52025 ) ) ( not ( = ?auto_52019 ?auto_52022 ) ) ( not ( = ?auto_52031 ?auto_52019 ) ) ( not ( = ?auto_52012 ?auto_52019 ) ) ( HOIST-AT ?auto_52010 ?auto_52019 ) ( not ( = ?auto_52013 ?auto_52010 ) ) ( not ( = ?auto_52017 ?auto_52010 ) ) ( not ( = ?auto_52018 ?auto_52010 ) ) ( AVAILABLE ?auto_52010 ) ( SURFACE-AT ?auto_52030 ?auto_52019 ) ( ON ?auto_52030 ?auto_52020 ) ( CLEAR ?auto_52030 ) ( not ( = ?auto_52007 ?auto_52020 ) ) ( not ( = ?auto_52008 ?auto_52020 ) ) ( not ( = ?auto_52029 ?auto_52020 ) ) ( not ( = ?auto_52030 ?auto_52020 ) ) ( not ( = ?auto_52027 ?auto_52020 ) ) ( not ( = ?auto_52025 ?auto_52020 ) ) ( IS-CRATE ?auto_52025 ) ( not ( = ?auto_52007 ?auto_52015 ) ) ( not ( = ?auto_52008 ?auto_52015 ) ) ( not ( = ?auto_52029 ?auto_52015 ) ) ( not ( = ?auto_52030 ?auto_52015 ) ) ( not ( = ?auto_52027 ?auto_52015 ) ) ( not ( = ?auto_52025 ?auto_52015 ) ) ( not ( = ?auto_52020 ?auto_52015 ) ) ( not ( = ?auto_52028 ?auto_52022 ) ) ( not ( = ?auto_52031 ?auto_52028 ) ) ( not ( = ?auto_52012 ?auto_52028 ) ) ( not ( = ?auto_52019 ?auto_52028 ) ) ( HOIST-AT ?auto_52024 ?auto_52028 ) ( not ( = ?auto_52013 ?auto_52024 ) ) ( not ( = ?auto_52017 ?auto_52024 ) ) ( not ( = ?auto_52018 ?auto_52024 ) ) ( not ( = ?auto_52010 ?auto_52024 ) ) ( AVAILABLE ?auto_52024 ) ( SURFACE-AT ?auto_52025 ?auto_52028 ) ( ON ?auto_52025 ?auto_52016 ) ( CLEAR ?auto_52025 ) ( not ( = ?auto_52007 ?auto_52016 ) ) ( not ( = ?auto_52008 ?auto_52016 ) ) ( not ( = ?auto_52029 ?auto_52016 ) ) ( not ( = ?auto_52030 ?auto_52016 ) ) ( not ( = ?auto_52027 ?auto_52016 ) ) ( not ( = ?auto_52025 ?auto_52016 ) ) ( not ( = ?auto_52020 ?auto_52016 ) ) ( not ( = ?auto_52015 ?auto_52016 ) ) ( IS-CRATE ?auto_52015 ) ( not ( = ?auto_52007 ?auto_52021 ) ) ( not ( = ?auto_52008 ?auto_52021 ) ) ( not ( = ?auto_52029 ?auto_52021 ) ) ( not ( = ?auto_52030 ?auto_52021 ) ) ( not ( = ?auto_52027 ?auto_52021 ) ) ( not ( = ?auto_52025 ?auto_52021 ) ) ( not ( = ?auto_52020 ?auto_52021 ) ) ( not ( = ?auto_52015 ?auto_52021 ) ) ( not ( = ?auto_52016 ?auto_52021 ) ) ( not ( = ?auto_52009 ?auto_52022 ) ) ( not ( = ?auto_52031 ?auto_52009 ) ) ( not ( = ?auto_52012 ?auto_52009 ) ) ( not ( = ?auto_52019 ?auto_52009 ) ) ( not ( = ?auto_52028 ?auto_52009 ) ) ( HOIST-AT ?auto_52011 ?auto_52009 ) ( not ( = ?auto_52013 ?auto_52011 ) ) ( not ( = ?auto_52017 ?auto_52011 ) ) ( not ( = ?auto_52018 ?auto_52011 ) ) ( not ( = ?auto_52010 ?auto_52011 ) ) ( not ( = ?auto_52024 ?auto_52011 ) ) ( AVAILABLE ?auto_52011 ) ( SURFACE-AT ?auto_52015 ?auto_52009 ) ( ON ?auto_52015 ?auto_52026 ) ( CLEAR ?auto_52015 ) ( not ( = ?auto_52007 ?auto_52026 ) ) ( not ( = ?auto_52008 ?auto_52026 ) ) ( not ( = ?auto_52029 ?auto_52026 ) ) ( not ( = ?auto_52030 ?auto_52026 ) ) ( not ( = ?auto_52027 ?auto_52026 ) ) ( not ( = ?auto_52025 ?auto_52026 ) ) ( not ( = ?auto_52020 ?auto_52026 ) ) ( not ( = ?auto_52015 ?auto_52026 ) ) ( not ( = ?auto_52016 ?auto_52026 ) ) ( not ( = ?auto_52021 ?auto_52026 ) ) ( SURFACE-AT ?auto_52033 ?auto_52022 ) ( CLEAR ?auto_52033 ) ( IS-CRATE ?auto_52021 ) ( not ( = ?auto_52007 ?auto_52033 ) ) ( not ( = ?auto_52008 ?auto_52033 ) ) ( not ( = ?auto_52029 ?auto_52033 ) ) ( not ( = ?auto_52030 ?auto_52033 ) ) ( not ( = ?auto_52027 ?auto_52033 ) ) ( not ( = ?auto_52025 ?auto_52033 ) ) ( not ( = ?auto_52020 ?auto_52033 ) ) ( not ( = ?auto_52015 ?auto_52033 ) ) ( not ( = ?auto_52016 ?auto_52033 ) ) ( not ( = ?auto_52021 ?auto_52033 ) ) ( not ( = ?auto_52026 ?auto_52033 ) ) ( AVAILABLE ?auto_52013 ) ( TRUCK-AT ?auto_52032 ?auto_52014 ) ( not ( = ?auto_52014 ?auto_52022 ) ) ( not ( = ?auto_52031 ?auto_52014 ) ) ( not ( = ?auto_52012 ?auto_52014 ) ) ( not ( = ?auto_52019 ?auto_52014 ) ) ( not ( = ?auto_52028 ?auto_52014 ) ) ( not ( = ?auto_52009 ?auto_52014 ) ) ( HOIST-AT ?auto_52023 ?auto_52014 ) ( not ( = ?auto_52013 ?auto_52023 ) ) ( not ( = ?auto_52017 ?auto_52023 ) ) ( not ( = ?auto_52018 ?auto_52023 ) ) ( not ( = ?auto_52010 ?auto_52023 ) ) ( not ( = ?auto_52024 ?auto_52023 ) ) ( not ( = ?auto_52011 ?auto_52023 ) ) ( AVAILABLE ?auto_52023 ) ( SURFACE-AT ?auto_52021 ?auto_52014 ) ( ON ?auto_52021 ?auto_52034 ) ( CLEAR ?auto_52021 ) ( not ( = ?auto_52007 ?auto_52034 ) ) ( not ( = ?auto_52008 ?auto_52034 ) ) ( not ( = ?auto_52029 ?auto_52034 ) ) ( not ( = ?auto_52030 ?auto_52034 ) ) ( not ( = ?auto_52027 ?auto_52034 ) ) ( not ( = ?auto_52025 ?auto_52034 ) ) ( not ( = ?auto_52020 ?auto_52034 ) ) ( not ( = ?auto_52015 ?auto_52034 ) ) ( not ( = ?auto_52016 ?auto_52034 ) ) ( not ( = ?auto_52021 ?auto_52034 ) ) ( not ( = ?auto_52026 ?auto_52034 ) ) ( not ( = ?auto_52033 ?auto_52034 ) ) )
    :subtasks
    ( ( !LIFT ?auto_52023 ?auto_52021 ?auto_52034 ?auto_52014 )
      ( MAKE-ON ?auto_52007 ?auto_52008 )
      ( MAKE-ON-VERIFY ?auto_52007 ?auto_52008 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52035 - SURFACE
      ?auto_52036 - SURFACE
    )
    :vars
    (
      ?auto_52061 - HOIST
      ?auto_52044 - PLACE
      ?auto_52051 - PLACE
      ?auto_52055 - HOIST
      ?auto_52042 - SURFACE
      ?auto_52050 - SURFACE
      ?auto_52062 - PLACE
      ?auto_52046 - HOIST
      ?auto_52039 - SURFACE
      ?auto_52059 - SURFACE
      ?auto_52054 - PLACE
      ?auto_52056 - HOIST
      ?auto_52037 - SURFACE
      ?auto_52057 - SURFACE
      ?auto_52041 - PLACE
      ?auto_52052 - HOIST
      ?auto_52047 - SURFACE
      ?auto_52043 - SURFACE
      ?auto_52053 - PLACE
      ?auto_52040 - HOIST
      ?auto_52038 - SURFACE
      ?auto_52049 - SURFACE
      ?auto_52048 - PLACE
      ?auto_52045 - HOIST
      ?auto_52060 - SURFACE
      ?auto_52058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52061 ?auto_52044 ) ( IS-CRATE ?auto_52035 ) ( not ( = ?auto_52035 ?auto_52036 ) ) ( not ( = ?auto_52051 ?auto_52044 ) ) ( HOIST-AT ?auto_52055 ?auto_52051 ) ( not ( = ?auto_52061 ?auto_52055 ) ) ( AVAILABLE ?auto_52055 ) ( SURFACE-AT ?auto_52035 ?auto_52051 ) ( ON ?auto_52035 ?auto_52042 ) ( CLEAR ?auto_52035 ) ( not ( = ?auto_52035 ?auto_52042 ) ) ( not ( = ?auto_52036 ?auto_52042 ) ) ( IS-CRATE ?auto_52036 ) ( not ( = ?auto_52035 ?auto_52050 ) ) ( not ( = ?auto_52036 ?auto_52050 ) ) ( not ( = ?auto_52042 ?auto_52050 ) ) ( not ( = ?auto_52062 ?auto_52044 ) ) ( not ( = ?auto_52051 ?auto_52062 ) ) ( HOIST-AT ?auto_52046 ?auto_52062 ) ( not ( = ?auto_52061 ?auto_52046 ) ) ( not ( = ?auto_52055 ?auto_52046 ) ) ( AVAILABLE ?auto_52046 ) ( SURFACE-AT ?auto_52036 ?auto_52062 ) ( ON ?auto_52036 ?auto_52039 ) ( CLEAR ?auto_52036 ) ( not ( = ?auto_52035 ?auto_52039 ) ) ( not ( = ?auto_52036 ?auto_52039 ) ) ( not ( = ?auto_52042 ?auto_52039 ) ) ( not ( = ?auto_52050 ?auto_52039 ) ) ( IS-CRATE ?auto_52050 ) ( not ( = ?auto_52035 ?auto_52059 ) ) ( not ( = ?auto_52036 ?auto_52059 ) ) ( not ( = ?auto_52042 ?auto_52059 ) ) ( not ( = ?auto_52050 ?auto_52059 ) ) ( not ( = ?auto_52039 ?auto_52059 ) ) ( not ( = ?auto_52054 ?auto_52044 ) ) ( not ( = ?auto_52051 ?auto_52054 ) ) ( not ( = ?auto_52062 ?auto_52054 ) ) ( HOIST-AT ?auto_52056 ?auto_52054 ) ( not ( = ?auto_52061 ?auto_52056 ) ) ( not ( = ?auto_52055 ?auto_52056 ) ) ( not ( = ?auto_52046 ?auto_52056 ) ) ( AVAILABLE ?auto_52056 ) ( SURFACE-AT ?auto_52050 ?auto_52054 ) ( ON ?auto_52050 ?auto_52037 ) ( CLEAR ?auto_52050 ) ( not ( = ?auto_52035 ?auto_52037 ) ) ( not ( = ?auto_52036 ?auto_52037 ) ) ( not ( = ?auto_52042 ?auto_52037 ) ) ( not ( = ?auto_52050 ?auto_52037 ) ) ( not ( = ?auto_52039 ?auto_52037 ) ) ( not ( = ?auto_52059 ?auto_52037 ) ) ( IS-CRATE ?auto_52059 ) ( not ( = ?auto_52035 ?auto_52057 ) ) ( not ( = ?auto_52036 ?auto_52057 ) ) ( not ( = ?auto_52042 ?auto_52057 ) ) ( not ( = ?auto_52050 ?auto_52057 ) ) ( not ( = ?auto_52039 ?auto_52057 ) ) ( not ( = ?auto_52059 ?auto_52057 ) ) ( not ( = ?auto_52037 ?auto_52057 ) ) ( not ( = ?auto_52041 ?auto_52044 ) ) ( not ( = ?auto_52051 ?auto_52041 ) ) ( not ( = ?auto_52062 ?auto_52041 ) ) ( not ( = ?auto_52054 ?auto_52041 ) ) ( HOIST-AT ?auto_52052 ?auto_52041 ) ( not ( = ?auto_52061 ?auto_52052 ) ) ( not ( = ?auto_52055 ?auto_52052 ) ) ( not ( = ?auto_52046 ?auto_52052 ) ) ( not ( = ?auto_52056 ?auto_52052 ) ) ( AVAILABLE ?auto_52052 ) ( SURFACE-AT ?auto_52059 ?auto_52041 ) ( ON ?auto_52059 ?auto_52047 ) ( CLEAR ?auto_52059 ) ( not ( = ?auto_52035 ?auto_52047 ) ) ( not ( = ?auto_52036 ?auto_52047 ) ) ( not ( = ?auto_52042 ?auto_52047 ) ) ( not ( = ?auto_52050 ?auto_52047 ) ) ( not ( = ?auto_52039 ?auto_52047 ) ) ( not ( = ?auto_52059 ?auto_52047 ) ) ( not ( = ?auto_52037 ?auto_52047 ) ) ( not ( = ?auto_52057 ?auto_52047 ) ) ( IS-CRATE ?auto_52057 ) ( not ( = ?auto_52035 ?auto_52043 ) ) ( not ( = ?auto_52036 ?auto_52043 ) ) ( not ( = ?auto_52042 ?auto_52043 ) ) ( not ( = ?auto_52050 ?auto_52043 ) ) ( not ( = ?auto_52039 ?auto_52043 ) ) ( not ( = ?auto_52059 ?auto_52043 ) ) ( not ( = ?auto_52037 ?auto_52043 ) ) ( not ( = ?auto_52057 ?auto_52043 ) ) ( not ( = ?auto_52047 ?auto_52043 ) ) ( not ( = ?auto_52053 ?auto_52044 ) ) ( not ( = ?auto_52051 ?auto_52053 ) ) ( not ( = ?auto_52062 ?auto_52053 ) ) ( not ( = ?auto_52054 ?auto_52053 ) ) ( not ( = ?auto_52041 ?auto_52053 ) ) ( HOIST-AT ?auto_52040 ?auto_52053 ) ( not ( = ?auto_52061 ?auto_52040 ) ) ( not ( = ?auto_52055 ?auto_52040 ) ) ( not ( = ?auto_52046 ?auto_52040 ) ) ( not ( = ?auto_52056 ?auto_52040 ) ) ( not ( = ?auto_52052 ?auto_52040 ) ) ( AVAILABLE ?auto_52040 ) ( SURFACE-AT ?auto_52057 ?auto_52053 ) ( ON ?auto_52057 ?auto_52038 ) ( CLEAR ?auto_52057 ) ( not ( = ?auto_52035 ?auto_52038 ) ) ( not ( = ?auto_52036 ?auto_52038 ) ) ( not ( = ?auto_52042 ?auto_52038 ) ) ( not ( = ?auto_52050 ?auto_52038 ) ) ( not ( = ?auto_52039 ?auto_52038 ) ) ( not ( = ?auto_52059 ?auto_52038 ) ) ( not ( = ?auto_52037 ?auto_52038 ) ) ( not ( = ?auto_52057 ?auto_52038 ) ) ( not ( = ?auto_52047 ?auto_52038 ) ) ( not ( = ?auto_52043 ?auto_52038 ) ) ( SURFACE-AT ?auto_52049 ?auto_52044 ) ( CLEAR ?auto_52049 ) ( IS-CRATE ?auto_52043 ) ( not ( = ?auto_52035 ?auto_52049 ) ) ( not ( = ?auto_52036 ?auto_52049 ) ) ( not ( = ?auto_52042 ?auto_52049 ) ) ( not ( = ?auto_52050 ?auto_52049 ) ) ( not ( = ?auto_52039 ?auto_52049 ) ) ( not ( = ?auto_52059 ?auto_52049 ) ) ( not ( = ?auto_52037 ?auto_52049 ) ) ( not ( = ?auto_52057 ?auto_52049 ) ) ( not ( = ?auto_52047 ?auto_52049 ) ) ( not ( = ?auto_52043 ?auto_52049 ) ) ( not ( = ?auto_52038 ?auto_52049 ) ) ( AVAILABLE ?auto_52061 ) ( not ( = ?auto_52048 ?auto_52044 ) ) ( not ( = ?auto_52051 ?auto_52048 ) ) ( not ( = ?auto_52062 ?auto_52048 ) ) ( not ( = ?auto_52054 ?auto_52048 ) ) ( not ( = ?auto_52041 ?auto_52048 ) ) ( not ( = ?auto_52053 ?auto_52048 ) ) ( HOIST-AT ?auto_52045 ?auto_52048 ) ( not ( = ?auto_52061 ?auto_52045 ) ) ( not ( = ?auto_52055 ?auto_52045 ) ) ( not ( = ?auto_52046 ?auto_52045 ) ) ( not ( = ?auto_52056 ?auto_52045 ) ) ( not ( = ?auto_52052 ?auto_52045 ) ) ( not ( = ?auto_52040 ?auto_52045 ) ) ( AVAILABLE ?auto_52045 ) ( SURFACE-AT ?auto_52043 ?auto_52048 ) ( ON ?auto_52043 ?auto_52060 ) ( CLEAR ?auto_52043 ) ( not ( = ?auto_52035 ?auto_52060 ) ) ( not ( = ?auto_52036 ?auto_52060 ) ) ( not ( = ?auto_52042 ?auto_52060 ) ) ( not ( = ?auto_52050 ?auto_52060 ) ) ( not ( = ?auto_52039 ?auto_52060 ) ) ( not ( = ?auto_52059 ?auto_52060 ) ) ( not ( = ?auto_52037 ?auto_52060 ) ) ( not ( = ?auto_52057 ?auto_52060 ) ) ( not ( = ?auto_52047 ?auto_52060 ) ) ( not ( = ?auto_52043 ?auto_52060 ) ) ( not ( = ?auto_52038 ?auto_52060 ) ) ( not ( = ?auto_52049 ?auto_52060 ) ) ( TRUCK-AT ?auto_52058 ?auto_52044 ) )
    :subtasks
    ( ( !DRIVE ?auto_52058 ?auto_52044 ?auto_52048 )
      ( MAKE-ON ?auto_52035 ?auto_52036 )
      ( MAKE-ON-VERIFY ?auto_52035 ?auto_52036 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52065 - SURFACE
      ?auto_52066 - SURFACE
    )
    :vars
    (
      ?auto_52067 - HOIST
      ?auto_52068 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52067 ?auto_52068 ) ( SURFACE-AT ?auto_52066 ?auto_52068 ) ( CLEAR ?auto_52066 ) ( LIFTING ?auto_52067 ?auto_52065 ) ( IS-CRATE ?auto_52065 ) ( not ( = ?auto_52065 ?auto_52066 ) ) )
    :subtasks
    ( ( !DROP ?auto_52067 ?auto_52065 ?auto_52066 ?auto_52068 )
      ( MAKE-ON-VERIFY ?auto_52065 ?auto_52066 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52069 - SURFACE
      ?auto_52070 - SURFACE
    )
    :vars
    (
      ?auto_52072 - HOIST
      ?auto_52071 - PLACE
      ?auto_52073 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52072 ?auto_52071 ) ( SURFACE-AT ?auto_52070 ?auto_52071 ) ( CLEAR ?auto_52070 ) ( IS-CRATE ?auto_52069 ) ( not ( = ?auto_52069 ?auto_52070 ) ) ( TRUCK-AT ?auto_52073 ?auto_52071 ) ( AVAILABLE ?auto_52072 ) ( IN ?auto_52069 ?auto_52073 ) )
    :subtasks
    ( ( !UNLOAD ?auto_52072 ?auto_52069 ?auto_52073 ?auto_52071 )
      ( MAKE-ON ?auto_52069 ?auto_52070 )
      ( MAKE-ON-VERIFY ?auto_52069 ?auto_52070 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52074 - SURFACE
      ?auto_52075 - SURFACE
    )
    :vars
    (
      ?auto_52076 - HOIST
      ?auto_52078 - PLACE
      ?auto_52077 - TRUCK
      ?auto_52079 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52076 ?auto_52078 ) ( SURFACE-AT ?auto_52075 ?auto_52078 ) ( CLEAR ?auto_52075 ) ( IS-CRATE ?auto_52074 ) ( not ( = ?auto_52074 ?auto_52075 ) ) ( AVAILABLE ?auto_52076 ) ( IN ?auto_52074 ?auto_52077 ) ( TRUCK-AT ?auto_52077 ?auto_52079 ) ( not ( = ?auto_52079 ?auto_52078 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_52077 ?auto_52079 ?auto_52078 )
      ( MAKE-ON ?auto_52074 ?auto_52075 )
      ( MAKE-ON-VERIFY ?auto_52074 ?auto_52075 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52080 - SURFACE
      ?auto_52081 - SURFACE
    )
    :vars
    (
      ?auto_52083 - HOIST
      ?auto_52082 - PLACE
      ?auto_52085 - TRUCK
      ?auto_52084 - PLACE
      ?auto_52086 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_52083 ?auto_52082 ) ( SURFACE-AT ?auto_52081 ?auto_52082 ) ( CLEAR ?auto_52081 ) ( IS-CRATE ?auto_52080 ) ( not ( = ?auto_52080 ?auto_52081 ) ) ( AVAILABLE ?auto_52083 ) ( TRUCK-AT ?auto_52085 ?auto_52084 ) ( not ( = ?auto_52084 ?auto_52082 ) ) ( HOIST-AT ?auto_52086 ?auto_52084 ) ( LIFTING ?auto_52086 ?auto_52080 ) ( not ( = ?auto_52083 ?auto_52086 ) ) )
    :subtasks
    ( ( !LOAD ?auto_52086 ?auto_52080 ?auto_52085 ?auto_52084 )
      ( MAKE-ON ?auto_52080 ?auto_52081 )
      ( MAKE-ON-VERIFY ?auto_52080 ?auto_52081 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52087 - SURFACE
      ?auto_52088 - SURFACE
    )
    :vars
    (
      ?auto_52089 - HOIST
      ?auto_52090 - PLACE
      ?auto_52093 - TRUCK
      ?auto_52092 - PLACE
      ?auto_52091 - HOIST
      ?auto_52094 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52089 ?auto_52090 ) ( SURFACE-AT ?auto_52088 ?auto_52090 ) ( CLEAR ?auto_52088 ) ( IS-CRATE ?auto_52087 ) ( not ( = ?auto_52087 ?auto_52088 ) ) ( AVAILABLE ?auto_52089 ) ( TRUCK-AT ?auto_52093 ?auto_52092 ) ( not ( = ?auto_52092 ?auto_52090 ) ) ( HOIST-AT ?auto_52091 ?auto_52092 ) ( not ( = ?auto_52089 ?auto_52091 ) ) ( AVAILABLE ?auto_52091 ) ( SURFACE-AT ?auto_52087 ?auto_52092 ) ( ON ?auto_52087 ?auto_52094 ) ( CLEAR ?auto_52087 ) ( not ( = ?auto_52087 ?auto_52094 ) ) ( not ( = ?auto_52088 ?auto_52094 ) ) )
    :subtasks
    ( ( !LIFT ?auto_52091 ?auto_52087 ?auto_52094 ?auto_52092 )
      ( MAKE-ON ?auto_52087 ?auto_52088 )
      ( MAKE-ON-VERIFY ?auto_52087 ?auto_52088 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52095 - SURFACE
      ?auto_52096 - SURFACE
    )
    :vars
    (
      ?auto_52101 - HOIST
      ?auto_52098 - PLACE
      ?auto_52102 - PLACE
      ?auto_52099 - HOIST
      ?auto_52097 - SURFACE
      ?auto_52100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52101 ?auto_52098 ) ( SURFACE-AT ?auto_52096 ?auto_52098 ) ( CLEAR ?auto_52096 ) ( IS-CRATE ?auto_52095 ) ( not ( = ?auto_52095 ?auto_52096 ) ) ( AVAILABLE ?auto_52101 ) ( not ( = ?auto_52102 ?auto_52098 ) ) ( HOIST-AT ?auto_52099 ?auto_52102 ) ( not ( = ?auto_52101 ?auto_52099 ) ) ( AVAILABLE ?auto_52099 ) ( SURFACE-AT ?auto_52095 ?auto_52102 ) ( ON ?auto_52095 ?auto_52097 ) ( CLEAR ?auto_52095 ) ( not ( = ?auto_52095 ?auto_52097 ) ) ( not ( = ?auto_52096 ?auto_52097 ) ) ( TRUCK-AT ?auto_52100 ?auto_52098 ) )
    :subtasks
    ( ( !DRIVE ?auto_52100 ?auto_52098 ?auto_52102 )
      ( MAKE-ON ?auto_52095 ?auto_52096 )
      ( MAKE-ON-VERIFY ?auto_52095 ?auto_52096 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52103 - SURFACE
      ?auto_52104 - SURFACE
    )
    :vars
    (
      ?auto_52110 - HOIST
      ?auto_52106 - PLACE
      ?auto_52107 - PLACE
      ?auto_52105 - HOIST
      ?auto_52109 - SURFACE
      ?auto_52108 - TRUCK
      ?auto_52111 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52110 ?auto_52106 ) ( IS-CRATE ?auto_52103 ) ( not ( = ?auto_52103 ?auto_52104 ) ) ( not ( = ?auto_52107 ?auto_52106 ) ) ( HOIST-AT ?auto_52105 ?auto_52107 ) ( not ( = ?auto_52110 ?auto_52105 ) ) ( AVAILABLE ?auto_52105 ) ( SURFACE-AT ?auto_52103 ?auto_52107 ) ( ON ?auto_52103 ?auto_52109 ) ( CLEAR ?auto_52103 ) ( not ( = ?auto_52103 ?auto_52109 ) ) ( not ( = ?auto_52104 ?auto_52109 ) ) ( TRUCK-AT ?auto_52108 ?auto_52106 ) ( SURFACE-AT ?auto_52111 ?auto_52106 ) ( CLEAR ?auto_52111 ) ( LIFTING ?auto_52110 ?auto_52104 ) ( IS-CRATE ?auto_52104 ) ( not ( = ?auto_52103 ?auto_52111 ) ) ( not ( = ?auto_52104 ?auto_52111 ) ) ( not ( = ?auto_52109 ?auto_52111 ) ) )
    :subtasks
    ( ( !DROP ?auto_52110 ?auto_52104 ?auto_52111 ?auto_52106 )
      ( MAKE-ON ?auto_52103 ?auto_52104 )
      ( MAKE-ON-VERIFY ?auto_52103 ?auto_52104 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52112 - SURFACE
      ?auto_52113 - SURFACE
    )
    :vars
    (
      ?auto_52115 - HOIST
      ?auto_52116 - PLACE
      ?auto_52120 - PLACE
      ?auto_52114 - HOIST
      ?auto_52119 - SURFACE
      ?auto_52118 - TRUCK
      ?auto_52117 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52115 ?auto_52116 ) ( IS-CRATE ?auto_52112 ) ( not ( = ?auto_52112 ?auto_52113 ) ) ( not ( = ?auto_52120 ?auto_52116 ) ) ( HOIST-AT ?auto_52114 ?auto_52120 ) ( not ( = ?auto_52115 ?auto_52114 ) ) ( AVAILABLE ?auto_52114 ) ( SURFACE-AT ?auto_52112 ?auto_52120 ) ( ON ?auto_52112 ?auto_52119 ) ( CLEAR ?auto_52112 ) ( not ( = ?auto_52112 ?auto_52119 ) ) ( not ( = ?auto_52113 ?auto_52119 ) ) ( TRUCK-AT ?auto_52118 ?auto_52116 ) ( SURFACE-AT ?auto_52117 ?auto_52116 ) ( CLEAR ?auto_52117 ) ( IS-CRATE ?auto_52113 ) ( not ( = ?auto_52112 ?auto_52117 ) ) ( not ( = ?auto_52113 ?auto_52117 ) ) ( not ( = ?auto_52119 ?auto_52117 ) ) ( AVAILABLE ?auto_52115 ) ( IN ?auto_52113 ?auto_52118 ) )
    :subtasks
    ( ( !UNLOAD ?auto_52115 ?auto_52113 ?auto_52118 ?auto_52116 )
      ( MAKE-ON ?auto_52112 ?auto_52113 )
      ( MAKE-ON-VERIFY ?auto_52112 ?auto_52113 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52121 - SURFACE
      ?auto_52122 - SURFACE
    )
    :vars
    (
      ?auto_52126 - HOIST
      ?auto_52127 - PLACE
      ?auto_52125 - PLACE
      ?auto_52128 - HOIST
      ?auto_52129 - SURFACE
      ?auto_52124 - SURFACE
      ?auto_52123 - TRUCK
      ?auto_52130 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52126 ?auto_52127 ) ( IS-CRATE ?auto_52121 ) ( not ( = ?auto_52121 ?auto_52122 ) ) ( not ( = ?auto_52125 ?auto_52127 ) ) ( HOIST-AT ?auto_52128 ?auto_52125 ) ( not ( = ?auto_52126 ?auto_52128 ) ) ( AVAILABLE ?auto_52128 ) ( SURFACE-AT ?auto_52121 ?auto_52125 ) ( ON ?auto_52121 ?auto_52129 ) ( CLEAR ?auto_52121 ) ( not ( = ?auto_52121 ?auto_52129 ) ) ( not ( = ?auto_52122 ?auto_52129 ) ) ( SURFACE-AT ?auto_52124 ?auto_52127 ) ( CLEAR ?auto_52124 ) ( IS-CRATE ?auto_52122 ) ( not ( = ?auto_52121 ?auto_52124 ) ) ( not ( = ?auto_52122 ?auto_52124 ) ) ( not ( = ?auto_52129 ?auto_52124 ) ) ( AVAILABLE ?auto_52126 ) ( IN ?auto_52122 ?auto_52123 ) ( TRUCK-AT ?auto_52123 ?auto_52130 ) ( not ( = ?auto_52130 ?auto_52127 ) ) ( not ( = ?auto_52125 ?auto_52130 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_52123 ?auto_52130 ?auto_52127 )
      ( MAKE-ON ?auto_52121 ?auto_52122 )
      ( MAKE-ON-VERIFY ?auto_52121 ?auto_52122 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52131 - SURFACE
      ?auto_52132 - SURFACE
    )
    :vars
    (
      ?auto_52137 - HOIST
      ?auto_52135 - PLACE
      ?auto_52138 - PLACE
      ?auto_52136 - HOIST
      ?auto_52140 - SURFACE
      ?auto_52134 - SURFACE
      ?auto_52133 - TRUCK
      ?auto_52139 - PLACE
      ?auto_52141 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_52137 ?auto_52135 ) ( IS-CRATE ?auto_52131 ) ( not ( = ?auto_52131 ?auto_52132 ) ) ( not ( = ?auto_52138 ?auto_52135 ) ) ( HOIST-AT ?auto_52136 ?auto_52138 ) ( not ( = ?auto_52137 ?auto_52136 ) ) ( AVAILABLE ?auto_52136 ) ( SURFACE-AT ?auto_52131 ?auto_52138 ) ( ON ?auto_52131 ?auto_52140 ) ( CLEAR ?auto_52131 ) ( not ( = ?auto_52131 ?auto_52140 ) ) ( not ( = ?auto_52132 ?auto_52140 ) ) ( SURFACE-AT ?auto_52134 ?auto_52135 ) ( CLEAR ?auto_52134 ) ( IS-CRATE ?auto_52132 ) ( not ( = ?auto_52131 ?auto_52134 ) ) ( not ( = ?auto_52132 ?auto_52134 ) ) ( not ( = ?auto_52140 ?auto_52134 ) ) ( AVAILABLE ?auto_52137 ) ( TRUCK-AT ?auto_52133 ?auto_52139 ) ( not ( = ?auto_52139 ?auto_52135 ) ) ( not ( = ?auto_52138 ?auto_52139 ) ) ( HOIST-AT ?auto_52141 ?auto_52139 ) ( LIFTING ?auto_52141 ?auto_52132 ) ( not ( = ?auto_52137 ?auto_52141 ) ) ( not ( = ?auto_52136 ?auto_52141 ) ) )
    :subtasks
    ( ( !LOAD ?auto_52141 ?auto_52132 ?auto_52133 ?auto_52139 )
      ( MAKE-ON ?auto_52131 ?auto_52132 )
      ( MAKE-ON-VERIFY ?auto_52131 ?auto_52132 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52142 - SURFACE
      ?auto_52143 - SURFACE
    )
    :vars
    (
      ?auto_52144 - HOIST
      ?auto_52152 - PLACE
      ?auto_52150 - PLACE
      ?auto_52146 - HOIST
      ?auto_52147 - SURFACE
      ?auto_52145 - SURFACE
      ?auto_52149 - TRUCK
      ?auto_52151 - PLACE
      ?auto_52148 - HOIST
      ?auto_52153 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52144 ?auto_52152 ) ( IS-CRATE ?auto_52142 ) ( not ( = ?auto_52142 ?auto_52143 ) ) ( not ( = ?auto_52150 ?auto_52152 ) ) ( HOIST-AT ?auto_52146 ?auto_52150 ) ( not ( = ?auto_52144 ?auto_52146 ) ) ( AVAILABLE ?auto_52146 ) ( SURFACE-AT ?auto_52142 ?auto_52150 ) ( ON ?auto_52142 ?auto_52147 ) ( CLEAR ?auto_52142 ) ( not ( = ?auto_52142 ?auto_52147 ) ) ( not ( = ?auto_52143 ?auto_52147 ) ) ( SURFACE-AT ?auto_52145 ?auto_52152 ) ( CLEAR ?auto_52145 ) ( IS-CRATE ?auto_52143 ) ( not ( = ?auto_52142 ?auto_52145 ) ) ( not ( = ?auto_52143 ?auto_52145 ) ) ( not ( = ?auto_52147 ?auto_52145 ) ) ( AVAILABLE ?auto_52144 ) ( TRUCK-AT ?auto_52149 ?auto_52151 ) ( not ( = ?auto_52151 ?auto_52152 ) ) ( not ( = ?auto_52150 ?auto_52151 ) ) ( HOIST-AT ?auto_52148 ?auto_52151 ) ( not ( = ?auto_52144 ?auto_52148 ) ) ( not ( = ?auto_52146 ?auto_52148 ) ) ( AVAILABLE ?auto_52148 ) ( SURFACE-AT ?auto_52143 ?auto_52151 ) ( ON ?auto_52143 ?auto_52153 ) ( CLEAR ?auto_52143 ) ( not ( = ?auto_52142 ?auto_52153 ) ) ( not ( = ?auto_52143 ?auto_52153 ) ) ( not ( = ?auto_52147 ?auto_52153 ) ) ( not ( = ?auto_52145 ?auto_52153 ) ) )
    :subtasks
    ( ( !LIFT ?auto_52148 ?auto_52143 ?auto_52153 ?auto_52151 )
      ( MAKE-ON ?auto_52142 ?auto_52143 )
      ( MAKE-ON-VERIFY ?auto_52142 ?auto_52143 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52154 - SURFACE
      ?auto_52155 - SURFACE
    )
    :vars
    (
      ?auto_52161 - HOIST
      ?auto_52165 - PLACE
      ?auto_52160 - PLACE
      ?auto_52158 - HOIST
      ?auto_52163 - SURFACE
      ?auto_52159 - SURFACE
      ?auto_52162 - PLACE
      ?auto_52164 - HOIST
      ?auto_52157 - SURFACE
      ?auto_52156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52161 ?auto_52165 ) ( IS-CRATE ?auto_52154 ) ( not ( = ?auto_52154 ?auto_52155 ) ) ( not ( = ?auto_52160 ?auto_52165 ) ) ( HOIST-AT ?auto_52158 ?auto_52160 ) ( not ( = ?auto_52161 ?auto_52158 ) ) ( AVAILABLE ?auto_52158 ) ( SURFACE-AT ?auto_52154 ?auto_52160 ) ( ON ?auto_52154 ?auto_52163 ) ( CLEAR ?auto_52154 ) ( not ( = ?auto_52154 ?auto_52163 ) ) ( not ( = ?auto_52155 ?auto_52163 ) ) ( SURFACE-AT ?auto_52159 ?auto_52165 ) ( CLEAR ?auto_52159 ) ( IS-CRATE ?auto_52155 ) ( not ( = ?auto_52154 ?auto_52159 ) ) ( not ( = ?auto_52155 ?auto_52159 ) ) ( not ( = ?auto_52163 ?auto_52159 ) ) ( AVAILABLE ?auto_52161 ) ( not ( = ?auto_52162 ?auto_52165 ) ) ( not ( = ?auto_52160 ?auto_52162 ) ) ( HOIST-AT ?auto_52164 ?auto_52162 ) ( not ( = ?auto_52161 ?auto_52164 ) ) ( not ( = ?auto_52158 ?auto_52164 ) ) ( AVAILABLE ?auto_52164 ) ( SURFACE-AT ?auto_52155 ?auto_52162 ) ( ON ?auto_52155 ?auto_52157 ) ( CLEAR ?auto_52155 ) ( not ( = ?auto_52154 ?auto_52157 ) ) ( not ( = ?auto_52155 ?auto_52157 ) ) ( not ( = ?auto_52163 ?auto_52157 ) ) ( not ( = ?auto_52159 ?auto_52157 ) ) ( TRUCK-AT ?auto_52156 ?auto_52165 ) )
    :subtasks
    ( ( !DRIVE ?auto_52156 ?auto_52165 ?auto_52162 )
      ( MAKE-ON ?auto_52154 ?auto_52155 )
      ( MAKE-ON-VERIFY ?auto_52154 ?auto_52155 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52166 - SURFACE
      ?auto_52167 - SURFACE
    )
    :vars
    (
      ?auto_52177 - HOIST
      ?auto_52175 - PLACE
      ?auto_52168 - PLACE
      ?auto_52171 - HOIST
      ?auto_52173 - SURFACE
      ?auto_52172 - SURFACE
      ?auto_52170 - PLACE
      ?auto_52169 - HOIST
      ?auto_52176 - SURFACE
      ?auto_52174 - TRUCK
      ?auto_52178 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52177 ?auto_52175 ) ( IS-CRATE ?auto_52166 ) ( not ( = ?auto_52166 ?auto_52167 ) ) ( not ( = ?auto_52168 ?auto_52175 ) ) ( HOIST-AT ?auto_52171 ?auto_52168 ) ( not ( = ?auto_52177 ?auto_52171 ) ) ( AVAILABLE ?auto_52171 ) ( SURFACE-AT ?auto_52166 ?auto_52168 ) ( ON ?auto_52166 ?auto_52173 ) ( CLEAR ?auto_52166 ) ( not ( = ?auto_52166 ?auto_52173 ) ) ( not ( = ?auto_52167 ?auto_52173 ) ) ( IS-CRATE ?auto_52167 ) ( not ( = ?auto_52166 ?auto_52172 ) ) ( not ( = ?auto_52167 ?auto_52172 ) ) ( not ( = ?auto_52173 ?auto_52172 ) ) ( not ( = ?auto_52170 ?auto_52175 ) ) ( not ( = ?auto_52168 ?auto_52170 ) ) ( HOIST-AT ?auto_52169 ?auto_52170 ) ( not ( = ?auto_52177 ?auto_52169 ) ) ( not ( = ?auto_52171 ?auto_52169 ) ) ( AVAILABLE ?auto_52169 ) ( SURFACE-AT ?auto_52167 ?auto_52170 ) ( ON ?auto_52167 ?auto_52176 ) ( CLEAR ?auto_52167 ) ( not ( = ?auto_52166 ?auto_52176 ) ) ( not ( = ?auto_52167 ?auto_52176 ) ) ( not ( = ?auto_52173 ?auto_52176 ) ) ( not ( = ?auto_52172 ?auto_52176 ) ) ( TRUCK-AT ?auto_52174 ?auto_52175 ) ( SURFACE-AT ?auto_52178 ?auto_52175 ) ( CLEAR ?auto_52178 ) ( LIFTING ?auto_52177 ?auto_52172 ) ( IS-CRATE ?auto_52172 ) ( not ( = ?auto_52166 ?auto_52178 ) ) ( not ( = ?auto_52167 ?auto_52178 ) ) ( not ( = ?auto_52173 ?auto_52178 ) ) ( not ( = ?auto_52172 ?auto_52178 ) ) ( not ( = ?auto_52176 ?auto_52178 ) ) )
    :subtasks
    ( ( !DROP ?auto_52177 ?auto_52172 ?auto_52178 ?auto_52175 )
      ( MAKE-ON ?auto_52166 ?auto_52167 )
      ( MAKE-ON-VERIFY ?auto_52166 ?auto_52167 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52179 - SURFACE
      ?auto_52180 - SURFACE
    )
    :vars
    (
      ?auto_52183 - HOIST
      ?auto_52182 - PLACE
      ?auto_52181 - PLACE
      ?auto_52190 - HOIST
      ?auto_52188 - SURFACE
      ?auto_52186 - SURFACE
      ?auto_52187 - PLACE
      ?auto_52189 - HOIST
      ?auto_52191 - SURFACE
      ?auto_52184 - TRUCK
      ?auto_52185 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52183 ?auto_52182 ) ( IS-CRATE ?auto_52179 ) ( not ( = ?auto_52179 ?auto_52180 ) ) ( not ( = ?auto_52181 ?auto_52182 ) ) ( HOIST-AT ?auto_52190 ?auto_52181 ) ( not ( = ?auto_52183 ?auto_52190 ) ) ( AVAILABLE ?auto_52190 ) ( SURFACE-AT ?auto_52179 ?auto_52181 ) ( ON ?auto_52179 ?auto_52188 ) ( CLEAR ?auto_52179 ) ( not ( = ?auto_52179 ?auto_52188 ) ) ( not ( = ?auto_52180 ?auto_52188 ) ) ( IS-CRATE ?auto_52180 ) ( not ( = ?auto_52179 ?auto_52186 ) ) ( not ( = ?auto_52180 ?auto_52186 ) ) ( not ( = ?auto_52188 ?auto_52186 ) ) ( not ( = ?auto_52187 ?auto_52182 ) ) ( not ( = ?auto_52181 ?auto_52187 ) ) ( HOIST-AT ?auto_52189 ?auto_52187 ) ( not ( = ?auto_52183 ?auto_52189 ) ) ( not ( = ?auto_52190 ?auto_52189 ) ) ( AVAILABLE ?auto_52189 ) ( SURFACE-AT ?auto_52180 ?auto_52187 ) ( ON ?auto_52180 ?auto_52191 ) ( CLEAR ?auto_52180 ) ( not ( = ?auto_52179 ?auto_52191 ) ) ( not ( = ?auto_52180 ?auto_52191 ) ) ( not ( = ?auto_52188 ?auto_52191 ) ) ( not ( = ?auto_52186 ?auto_52191 ) ) ( TRUCK-AT ?auto_52184 ?auto_52182 ) ( SURFACE-AT ?auto_52185 ?auto_52182 ) ( CLEAR ?auto_52185 ) ( IS-CRATE ?auto_52186 ) ( not ( = ?auto_52179 ?auto_52185 ) ) ( not ( = ?auto_52180 ?auto_52185 ) ) ( not ( = ?auto_52188 ?auto_52185 ) ) ( not ( = ?auto_52186 ?auto_52185 ) ) ( not ( = ?auto_52191 ?auto_52185 ) ) ( AVAILABLE ?auto_52183 ) ( IN ?auto_52186 ?auto_52184 ) )
    :subtasks
    ( ( !UNLOAD ?auto_52183 ?auto_52186 ?auto_52184 ?auto_52182 )
      ( MAKE-ON ?auto_52179 ?auto_52180 )
      ( MAKE-ON-VERIFY ?auto_52179 ?auto_52180 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52192 - SURFACE
      ?auto_52193 - SURFACE
    )
    :vars
    (
      ?auto_52199 - HOIST
      ?auto_52195 - PLACE
      ?auto_52194 - PLACE
      ?auto_52203 - HOIST
      ?auto_52200 - SURFACE
      ?auto_52204 - SURFACE
      ?auto_52202 - PLACE
      ?auto_52196 - HOIST
      ?auto_52198 - SURFACE
      ?auto_52197 - SURFACE
      ?auto_52201 - TRUCK
      ?auto_52205 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52199 ?auto_52195 ) ( IS-CRATE ?auto_52192 ) ( not ( = ?auto_52192 ?auto_52193 ) ) ( not ( = ?auto_52194 ?auto_52195 ) ) ( HOIST-AT ?auto_52203 ?auto_52194 ) ( not ( = ?auto_52199 ?auto_52203 ) ) ( AVAILABLE ?auto_52203 ) ( SURFACE-AT ?auto_52192 ?auto_52194 ) ( ON ?auto_52192 ?auto_52200 ) ( CLEAR ?auto_52192 ) ( not ( = ?auto_52192 ?auto_52200 ) ) ( not ( = ?auto_52193 ?auto_52200 ) ) ( IS-CRATE ?auto_52193 ) ( not ( = ?auto_52192 ?auto_52204 ) ) ( not ( = ?auto_52193 ?auto_52204 ) ) ( not ( = ?auto_52200 ?auto_52204 ) ) ( not ( = ?auto_52202 ?auto_52195 ) ) ( not ( = ?auto_52194 ?auto_52202 ) ) ( HOIST-AT ?auto_52196 ?auto_52202 ) ( not ( = ?auto_52199 ?auto_52196 ) ) ( not ( = ?auto_52203 ?auto_52196 ) ) ( AVAILABLE ?auto_52196 ) ( SURFACE-AT ?auto_52193 ?auto_52202 ) ( ON ?auto_52193 ?auto_52198 ) ( CLEAR ?auto_52193 ) ( not ( = ?auto_52192 ?auto_52198 ) ) ( not ( = ?auto_52193 ?auto_52198 ) ) ( not ( = ?auto_52200 ?auto_52198 ) ) ( not ( = ?auto_52204 ?auto_52198 ) ) ( SURFACE-AT ?auto_52197 ?auto_52195 ) ( CLEAR ?auto_52197 ) ( IS-CRATE ?auto_52204 ) ( not ( = ?auto_52192 ?auto_52197 ) ) ( not ( = ?auto_52193 ?auto_52197 ) ) ( not ( = ?auto_52200 ?auto_52197 ) ) ( not ( = ?auto_52204 ?auto_52197 ) ) ( not ( = ?auto_52198 ?auto_52197 ) ) ( AVAILABLE ?auto_52199 ) ( IN ?auto_52204 ?auto_52201 ) ( TRUCK-AT ?auto_52201 ?auto_52205 ) ( not ( = ?auto_52205 ?auto_52195 ) ) ( not ( = ?auto_52194 ?auto_52205 ) ) ( not ( = ?auto_52202 ?auto_52205 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_52201 ?auto_52205 ?auto_52195 )
      ( MAKE-ON ?auto_52192 ?auto_52193 )
      ( MAKE-ON-VERIFY ?auto_52192 ?auto_52193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52206 - SURFACE
      ?auto_52207 - SURFACE
    )
    :vars
    (
      ?auto_52211 - HOIST
      ?auto_52216 - PLACE
      ?auto_52217 - PLACE
      ?auto_52213 - HOIST
      ?auto_52208 - SURFACE
      ?auto_52219 - SURFACE
      ?auto_52209 - PLACE
      ?auto_52215 - HOIST
      ?auto_52210 - SURFACE
      ?auto_52218 - SURFACE
      ?auto_52212 - TRUCK
      ?auto_52214 - PLACE
      ?auto_52220 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_52211 ?auto_52216 ) ( IS-CRATE ?auto_52206 ) ( not ( = ?auto_52206 ?auto_52207 ) ) ( not ( = ?auto_52217 ?auto_52216 ) ) ( HOIST-AT ?auto_52213 ?auto_52217 ) ( not ( = ?auto_52211 ?auto_52213 ) ) ( AVAILABLE ?auto_52213 ) ( SURFACE-AT ?auto_52206 ?auto_52217 ) ( ON ?auto_52206 ?auto_52208 ) ( CLEAR ?auto_52206 ) ( not ( = ?auto_52206 ?auto_52208 ) ) ( not ( = ?auto_52207 ?auto_52208 ) ) ( IS-CRATE ?auto_52207 ) ( not ( = ?auto_52206 ?auto_52219 ) ) ( not ( = ?auto_52207 ?auto_52219 ) ) ( not ( = ?auto_52208 ?auto_52219 ) ) ( not ( = ?auto_52209 ?auto_52216 ) ) ( not ( = ?auto_52217 ?auto_52209 ) ) ( HOIST-AT ?auto_52215 ?auto_52209 ) ( not ( = ?auto_52211 ?auto_52215 ) ) ( not ( = ?auto_52213 ?auto_52215 ) ) ( AVAILABLE ?auto_52215 ) ( SURFACE-AT ?auto_52207 ?auto_52209 ) ( ON ?auto_52207 ?auto_52210 ) ( CLEAR ?auto_52207 ) ( not ( = ?auto_52206 ?auto_52210 ) ) ( not ( = ?auto_52207 ?auto_52210 ) ) ( not ( = ?auto_52208 ?auto_52210 ) ) ( not ( = ?auto_52219 ?auto_52210 ) ) ( SURFACE-AT ?auto_52218 ?auto_52216 ) ( CLEAR ?auto_52218 ) ( IS-CRATE ?auto_52219 ) ( not ( = ?auto_52206 ?auto_52218 ) ) ( not ( = ?auto_52207 ?auto_52218 ) ) ( not ( = ?auto_52208 ?auto_52218 ) ) ( not ( = ?auto_52219 ?auto_52218 ) ) ( not ( = ?auto_52210 ?auto_52218 ) ) ( AVAILABLE ?auto_52211 ) ( TRUCK-AT ?auto_52212 ?auto_52214 ) ( not ( = ?auto_52214 ?auto_52216 ) ) ( not ( = ?auto_52217 ?auto_52214 ) ) ( not ( = ?auto_52209 ?auto_52214 ) ) ( HOIST-AT ?auto_52220 ?auto_52214 ) ( LIFTING ?auto_52220 ?auto_52219 ) ( not ( = ?auto_52211 ?auto_52220 ) ) ( not ( = ?auto_52213 ?auto_52220 ) ) ( not ( = ?auto_52215 ?auto_52220 ) ) )
    :subtasks
    ( ( !LOAD ?auto_52220 ?auto_52219 ?auto_52212 ?auto_52214 )
      ( MAKE-ON ?auto_52206 ?auto_52207 )
      ( MAKE-ON-VERIFY ?auto_52206 ?auto_52207 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52221 - SURFACE
      ?auto_52222 - SURFACE
    )
    :vars
    (
      ?auto_52230 - HOIST
      ?auto_52226 - PLACE
      ?auto_52224 - PLACE
      ?auto_52223 - HOIST
      ?auto_52233 - SURFACE
      ?auto_52227 - SURFACE
      ?auto_52231 - PLACE
      ?auto_52232 - HOIST
      ?auto_52225 - SURFACE
      ?auto_52229 - SURFACE
      ?auto_52228 - TRUCK
      ?auto_52235 - PLACE
      ?auto_52234 - HOIST
      ?auto_52236 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52230 ?auto_52226 ) ( IS-CRATE ?auto_52221 ) ( not ( = ?auto_52221 ?auto_52222 ) ) ( not ( = ?auto_52224 ?auto_52226 ) ) ( HOIST-AT ?auto_52223 ?auto_52224 ) ( not ( = ?auto_52230 ?auto_52223 ) ) ( AVAILABLE ?auto_52223 ) ( SURFACE-AT ?auto_52221 ?auto_52224 ) ( ON ?auto_52221 ?auto_52233 ) ( CLEAR ?auto_52221 ) ( not ( = ?auto_52221 ?auto_52233 ) ) ( not ( = ?auto_52222 ?auto_52233 ) ) ( IS-CRATE ?auto_52222 ) ( not ( = ?auto_52221 ?auto_52227 ) ) ( not ( = ?auto_52222 ?auto_52227 ) ) ( not ( = ?auto_52233 ?auto_52227 ) ) ( not ( = ?auto_52231 ?auto_52226 ) ) ( not ( = ?auto_52224 ?auto_52231 ) ) ( HOIST-AT ?auto_52232 ?auto_52231 ) ( not ( = ?auto_52230 ?auto_52232 ) ) ( not ( = ?auto_52223 ?auto_52232 ) ) ( AVAILABLE ?auto_52232 ) ( SURFACE-AT ?auto_52222 ?auto_52231 ) ( ON ?auto_52222 ?auto_52225 ) ( CLEAR ?auto_52222 ) ( not ( = ?auto_52221 ?auto_52225 ) ) ( not ( = ?auto_52222 ?auto_52225 ) ) ( not ( = ?auto_52233 ?auto_52225 ) ) ( not ( = ?auto_52227 ?auto_52225 ) ) ( SURFACE-AT ?auto_52229 ?auto_52226 ) ( CLEAR ?auto_52229 ) ( IS-CRATE ?auto_52227 ) ( not ( = ?auto_52221 ?auto_52229 ) ) ( not ( = ?auto_52222 ?auto_52229 ) ) ( not ( = ?auto_52233 ?auto_52229 ) ) ( not ( = ?auto_52227 ?auto_52229 ) ) ( not ( = ?auto_52225 ?auto_52229 ) ) ( AVAILABLE ?auto_52230 ) ( TRUCK-AT ?auto_52228 ?auto_52235 ) ( not ( = ?auto_52235 ?auto_52226 ) ) ( not ( = ?auto_52224 ?auto_52235 ) ) ( not ( = ?auto_52231 ?auto_52235 ) ) ( HOIST-AT ?auto_52234 ?auto_52235 ) ( not ( = ?auto_52230 ?auto_52234 ) ) ( not ( = ?auto_52223 ?auto_52234 ) ) ( not ( = ?auto_52232 ?auto_52234 ) ) ( AVAILABLE ?auto_52234 ) ( SURFACE-AT ?auto_52227 ?auto_52235 ) ( ON ?auto_52227 ?auto_52236 ) ( CLEAR ?auto_52227 ) ( not ( = ?auto_52221 ?auto_52236 ) ) ( not ( = ?auto_52222 ?auto_52236 ) ) ( not ( = ?auto_52233 ?auto_52236 ) ) ( not ( = ?auto_52227 ?auto_52236 ) ) ( not ( = ?auto_52225 ?auto_52236 ) ) ( not ( = ?auto_52229 ?auto_52236 ) ) )
    :subtasks
    ( ( !LIFT ?auto_52234 ?auto_52227 ?auto_52236 ?auto_52235 )
      ( MAKE-ON ?auto_52221 ?auto_52222 )
      ( MAKE-ON-VERIFY ?auto_52221 ?auto_52222 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52237 - SURFACE
      ?auto_52238 - SURFACE
    )
    :vars
    (
      ?auto_52242 - HOIST
      ?auto_52252 - PLACE
      ?auto_52240 - PLACE
      ?auto_52249 - HOIST
      ?auto_52251 - SURFACE
      ?auto_52250 - SURFACE
      ?auto_52245 - PLACE
      ?auto_52243 - HOIST
      ?auto_52244 - SURFACE
      ?auto_52247 - SURFACE
      ?auto_52246 - PLACE
      ?auto_52239 - HOIST
      ?auto_52248 - SURFACE
      ?auto_52241 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52242 ?auto_52252 ) ( IS-CRATE ?auto_52237 ) ( not ( = ?auto_52237 ?auto_52238 ) ) ( not ( = ?auto_52240 ?auto_52252 ) ) ( HOIST-AT ?auto_52249 ?auto_52240 ) ( not ( = ?auto_52242 ?auto_52249 ) ) ( AVAILABLE ?auto_52249 ) ( SURFACE-AT ?auto_52237 ?auto_52240 ) ( ON ?auto_52237 ?auto_52251 ) ( CLEAR ?auto_52237 ) ( not ( = ?auto_52237 ?auto_52251 ) ) ( not ( = ?auto_52238 ?auto_52251 ) ) ( IS-CRATE ?auto_52238 ) ( not ( = ?auto_52237 ?auto_52250 ) ) ( not ( = ?auto_52238 ?auto_52250 ) ) ( not ( = ?auto_52251 ?auto_52250 ) ) ( not ( = ?auto_52245 ?auto_52252 ) ) ( not ( = ?auto_52240 ?auto_52245 ) ) ( HOIST-AT ?auto_52243 ?auto_52245 ) ( not ( = ?auto_52242 ?auto_52243 ) ) ( not ( = ?auto_52249 ?auto_52243 ) ) ( AVAILABLE ?auto_52243 ) ( SURFACE-AT ?auto_52238 ?auto_52245 ) ( ON ?auto_52238 ?auto_52244 ) ( CLEAR ?auto_52238 ) ( not ( = ?auto_52237 ?auto_52244 ) ) ( not ( = ?auto_52238 ?auto_52244 ) ) ( not ( = ?auto_52251 ?auto_52244 ) ) ( not ( = ?auto_52250 ?auto_52244 ) ) ( SURFACE-AT ?auto_52247 ?auto_52252 ) ( CLEAR ?auto_52247 ) ( IS-CRATE ?auto_52250 ) ( not ( = ?auto_52237 ?auto_52247 ) ) ( not ( = ?auto_52238 ?auto_52247 ) ) ( not ( = ?auto_52251 ?auto_52247 ) ) ( not ( = ?auto_52250 ?auto_52247 ) ) ( not ( = ?auto_52244 ?auto_52247 ) ) ( AVAILABLE ?auto_52242 ) ( not ( = ?auto_52246 ?auto_52252 ) ) ( not ( = ?auto_52240 ?auto_52246 ) ) ( not ( = ?auto_52245 ?auto_52246 ) ) ( HOIST-AT ?auto_52239 ?auto_52246 ) ( not ( = ?auto_52242 ?auto_52239 ) ) ( not ( = ?auto_52249 ?auto_52239 ) ) ( not ( = ?auto_52243 ?auto_52239 ) ) ( AVAILABLE ?auto_52239 ) ( SURFACE-AT ?auto_52250 ?auto_52246 ) ( ON ?auto_52250 ?auto_52248 ) ( CLEAR ?auto_52250 ) ( not ( = ?auto_52237 ?auto_52248 ) ) ( not ( = ?auto_52238 ?auto_52248 ) ) ( not ( = ?auto_52251 ?auto_52248 ) ) ( not ( = ?auto_52250 ?auto_52248 ) ) ( not ( = ?auto_52244 ?auto_52248 ) ) ( not ( = ?auto_52247 ?auto_52248 ) ) ( TRUCK-AT ?auto_52241 ?auto_52252 ) )
    :subtasks
    ( ( !DRIVE ?auto_52241 ?auto_52252 ?auto_52246 )
      ( MAKE-ON ?auto_52237 ?auto_52238 )
      ( MAKE-ON-VERIFY ?auto_52237 ?auto_52238 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52253 - SURFACE
      ?auto_52254 - SURFACE
    )
    :vars
    (
      ?auto_52258 - HOIST
      ?auto_52257 - PLACE
      ?auto_52268 - PLACE
      ?auto_52262 - HOIST
      ?auto_52265 - SURFACE
      ?auto_52256 - SURFACE
      ?auto_52266 - PLACE
      ?auto_52264 - HOIST
      ?auto_52255 - SURFACE
      ?auto_52259 - SURFACE
      ?auto_52261 - PLACE
      ?auto_52260 - HOIST
      ?auto_52263 - SURFACE
      ?auto_52267 - TRUCK
      ?auto_52269 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52258 ?auto_52257 ) ( IS-CRATE ?auto_52253 ) ( not ( = ?auto_52253 ?auto_52254 ) ) ( not ( = ?auto_52268 ?auto_52257 ) ) ( HOIST-AT ?auto_52262 ?auto_52268 ) ( not ( = ?auto_52258 ?auto_52262 ) ) ( AVAILABLE ?auto_52262 ) ( SURFACE-AT ?auto_52253 ?auto_52268 ) ( ON ?auto_52253 ?auto_52265 ) ( CLEAR ?auto_52253 ) ( not ( = ?auto_52253 ?auto_52265 ) ) ( not ( = ?auto_52254 ?auto_52265 ) ) ( IS-CRATE ?auto_52254 ) ( not ( = ?auto_52253 ?auto_52256 ) ) ( not ( = ?auto_52254 ?auto_52256 ) ) ( not ( = ?auto_52265 ?auto_52256 ) ) ( not ( = ?auto_52266 ?auto_52257 ) ) ( not ( = ?auto_52268 ?auto_52266 ) ) ( HOIST-AT ?auto_52264 ?auto_52266 ) ( not ( = ?auto_52258 ?auto_52264 ) ) ( not ( = ?auto_52262 ?auto_52264 ) ) ( AVAILABLE ?auto_52264 ) ( SURFACE-AT ?auto_52254 ?auto_52266 ) ( ON ?auto_52254 ?auto_52255 ) ( CLEAR ?auto_52254 ) ( not ( = ?auto_52253 ?auto_52255 ) ) ( not ( = ?auto_52254 ?auto_52255 ) ) ( not ( = ?auto_52265 ?auto_52255 ) ) ( not ( = ?auto_52256 ?auto_52255 ) ) ( IS-CRATE ?auto_52256 ) ( not ( = ?auto_52253 ?auto_52259 ) ) ( not ( = ?auto_52254 ?auto_52259 ) ) ( not ( = ?auto_52265 ?auto_52259 ) ) ( not ( = ?auto_52256 ?auto_52259 ) ) ( not ( = ?auto_52255 ?auto_52259 ) ) ( not ( = ?auto_52261 ?auto_52257 ) ) ( not ( = ?auto_52268 ?auto_52261 ) ) ( not ( = ?auto_52266 ?auto_52261 ) ) ( HOIST-AT ?auto_52260 ?auto_52261 ) ( not ( = ?auto_52258 ?auto_52260 ) ) ( not ( = ?auto_52262 ?auto_52260 ) ) ( not ( = ?auto_52264 ?auto_52260 ) ) ( AVAILABLE ?auto_52260 ) ( SURFACE-AT ?auto_52256 ?auto_52261 ) ( ON ?auto_52256 ?auto_52263 ) ( CLEAR ?auto_52256 ) ( not ( = ?auto_52253 ?auto_52263 ) ) ( not ( = ?auto_52254 ?auto_52263 ) ) ( not ( = ?auto_52265 ?auto_52263 ) ) ( not ( = ?auto_52256 ?auto_52263 ) ) ( not ( = ?auto_52255 ?auto_52263 ) ) ( not ( = ?auto_52259 ?auto_52263 ) ) ( TRUCK-AT ?auto_52267 ?auto_52257 ) ( SURFACE-AT ?auto_52269 ?auto_52257 ) ( CLEAR ?auto_52269 ) ( LIFTING ?auto_52258 ?auto_52259 ) ( IS-CRATE ?auto_52259 ) ( not ( = ?auto_52253 ?auto_52269 ) ) ( not ( = ?auto_52254 ?auto_52269 ) ) ( not ( = ?auto_52265 ?auto_52269 ) ) ( not ( = ?auto_52256 ?auto_52269 ) ) ( not ( = ?auto_52255 ?auto_52269 ) ) ( not ( = ?auto_52259 ?auto_52269 ) ) ( not ( = ?auto_52263 ?auto_52269 ) ) )
    :subtasks
    ( ( !DROP ?auto_52258 ?auto_52259 ?auto_52269 ?auto_52257 )
      ( MAKE-ON ?auto_52253 ?auto_52254 )
      ( MAKE-ON-VERIFY ?auto_52253 ?auto_52254 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52270 - SURFACE
      ?auto_52271 - SURFACE
    )
    :vars
    (
      ?auto_52279 - HOIST
      ?auto_52284 - PLACE
      ?auto_52277 - PLACE
      ?auto_52275 - HOIST
      ?auto_52273 - SURFACE
      ?auto_52278 - SURFACE
      ?auto_52281 - PLACE
      ?auto_52280 - HOIST
      ?auto_52285 - SURFACE
      ?auto_52274 - SURFACE
      ?auto_52272 - PLACE
      ?auto_52276 - HOIST
      ?auto_52282 - SURFACE
      ?auto_52283 - TRUCK
      ?auto_52286 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52279 ?auto_52284 ) ( IS-CRATE ?auto_52270 ) ( not ( = ?auto_52270 ?auto_52271 ) ) ( not ( = ?auto_52277 ?auto_52284 ) ) ( HOIST-AT ?auto_52275 ?auto_52277 ) ( not ( = ?auto_52279 ?auto_52275 ) ) ( AVAILABLE ?auto_52275 ) ( SURFACE-AT ?auto_52270 ?auto_52277 ) ( ON ?auto_52270 ?auto_52273 ) ( CLEAR ?auto_52270 ) ( not ( = ?auto_52270 ?auto_52273 ) ) ( not ( = ?auto_52271 ?auto_52273 ) ) ( IS-CRATE ?auto_52271 ) ( not ( = ?auto_52270 ?auto_52278 ) ) ( not ( = ?auto_52271 ?auto_52278 ) ) ( not ( = ?auto_52273 ?auto_52278 ) ) ( not ( = ?auto_52281 ?auto_52284 ) ) ( not ( = ?auto_52277 ?auto_52281 ) ) ( HOIST-AT ?auto_52280 ?auto_52281 ) ( not ( = ?auto_52279 ?auto_52280 ) ) ( not ( = ?auto_52275 ?auto_52280 ) ) ( AVAILABLE ?auto_52280 ) ( SURFACE-AT ?auto_52271 ?auto_52281 ) ( ON ?auto_52271 ?auto_52285 ) ( CLEAR ?auto_52271 ) ( not ( = ?auto_52270 ?auto_52285 ) ) ( not ( = ?auto_52271 ?auto_52285 ) ) ( not ( = ?auto_52273 ?auto_52285 ) ) ( not ( = ?auto_52278 ?auto_52285 ) ) ( IS-CRATE ?auto_52278 ) ( not ( = ?auto_52270 ?auto_52274 ) ) ( not ( = ?auto_52271 ?auto_52274 ) ) ( not ( = ?auto_52273 ?auto_52274 ) ) ( not ( = ?auto_52278 ?auto_52274 ) ) ( not ( = ?auto_52285 ?auto_52274 ) ) ( not ( = ?auto_52272 ?auto_52284 ) ) ( not ( = ?auto_52277 ?auto_52272 ) ) ( not ( = ?auto_52281 ?auto_52272 ) ) ( HOIST-AT ?auto_52276 ?auto_52272 ) ( not ( = ?auto_52279 ?auto_52276 ) ) ( not ( = ?auto_52275 ?auto_52276 ) ) ( not ( = ?auto_52280 ?auto_52276 ) ) ( AVAILABLE ?auto_52276 ) ( SURFACE-AT ?auto_52278 ?auto_52272 ) ( ON ?auto_52278 ?auto_52282 ) ( CLEAR ?auto_52278 ) ( not ( = ?auto_52270 ?auto_52282 ) ) ( not ( = ?auto_52271 ?auto_52282 ) ) ( not ( = ?auto_52273 ?auto_52282 ) ) ( not ( = ?auto_52278 ?auto_52282 ) ) ( not ( = ?auto_52285 ?auto_52282 ) ) ( not ( = ?auto_52274 ?auto_52282 ) ) ( TRUCK-AT ?auto_52283 ?auto_52284 ) ( SURFACE-AT ?auto_52286 ?auto_52284 ) ( CLEAR ?auto_52286 ) ( IS-CRATE ?auto_52274 ) ( not ( = ?auto_52270 ?auto_52286 ) ) ( not ( = ?auto_52271 ?auto_52286 ) ) ( not ( = ?auto_52273 ?auto_52286 ) ) ( not ( = ?auto_52278 ?auto_52286 ) ) ( not ( = ?auto_52285 ?auto_52286 ) ) ( not ( = ?auto_52274 ?auto_52286 ) ) ( not ( = ?auto_52282 ?auto_52286 ) ) ( AVAILABLE ?auto_52279 ) ( IN ?auto_52274 ?auto_52283 ) )
    :subtasks
    ( ( !UNLOAD ?auto_52279 ?auto_52274 ?auto_52283 ?auto_52284 )
      ( MAKE-ON ?auto_52270 ?auto_52271 )
      ( MAKE-ON-VERIFY ?auto_52270 ?auto_52271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52287 - SURFACE
      ?auto_52288 - SURFACE
    )
    :vars
    (
      ?auto_52292 - HOIST
      ?auto_52296 - PLACE
      ?auto_52300 - PLACE
      ?auto_52298 - HOIST
      ?auto_52289 - SURFACE
      ?auto_52301 - SURFACE
      ?auto_52293 - PLACE
      ?auto_52302 - HOIST
      ?auto_52291 - SURFACE
      ?auto_52299 - SURFACE
      ?auto_52297 - PLACE
      ?auto_52303 - HOIST
      ?auto_52295 - SURFACE
      ?auto_52294 - SURFACE
      ?auto_52290 - TRUCK
      ?auto_52304 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52292 ?auto_52296 ) ( IS-CRATE ?auto_52287 ) ( not ( = ?auto_52287 ?auto_52288 ) ) ( not ( = ?auto_52300 ?auto_52296 ) ) ( HOIST-AT ?auto_52298 ?auto_52300 ) ( not ( = ?auto_52292 ?auto_52298 ) ) ( AVAILABLE ?auto_52298 ) ( SURFACE-AT ?auto_52287 ?auto_52300 ) ( ON ?auto_52287 ?auto_52289 ) ( CLEAR ?auto_52287 ) ( not ( = ?auto_52287 ?auto_52289 ) ) ( not ( = ?auto_52288 ?auto_52289 ) ) ( IS-CRATE ?auto_52288 ) ( not ( = ?auto_52287 ?auto_52301 ) ) ( not ( = ?auto_52288 ?auto_52301 ) ) ( not ( = ?auto_52289 ?auto_52301 ) ) ( not ( = ?auto_52293 ?auto_52296 ) ) ( not ( = ?auto_52300 ?auto_52293 ) ) ( HOIST-AT ?auto_52302 ?auto_52293 ) ( not ( = ?auto_52292 ?auto_52302 ) ) ( not ( = ?auto_52298 ?auto_52302 ) ) ( AVAILABLE ?auto_52302 ) ( SURFACE-AT ?auto_52288 ?auto_52293 ) ( ON ?auto_52288 ?auto_52291 ) ( CLEAR ?auto_52288 ) ( not ( = ?auto_52287 ?auto_52291 ) ) ( not ( = ?auto_52288 ?auto_52291 ) ) ( not ( = ?auto_52289 ?auto_52291 ) ) ( not ( = ?auto_52301 ?auto_52291 ) ) ( IS-CRATE ?auto_52301 ) ( not ( = ?auto_52287 ?auto_52299 ) ) ( not ( = ?auto_52288 ?auto_52299 ) ) ( not ( = ?auto_52289 ?auto_52299 ) ) ( not ( = ?auto_52301 ?auto_52299 ) ) ( not ( = ?auto_52291 ?auto_52299 ) ) ( not ( = ?auto_52297 ?auto_52296 ) ) ( not ( = ?auto_52300 ?auto_52297 ) ) ( not ( = ?auto_52293 ?auto_52297 ) ) ( HOIST-AT ?auto_52303 ?auto_52297 ) ( not ( = ?auto_52292 ?auto_52303 ) ) ( not ( = ?auto_52298 ?auto_52303 ) ) ( not ( = ?auto_52302 ?auto_52303 ) ) ( AVAILABLE ?auto_52303 ) ( SURFACE-AT ?auto_52301 ?auto_52297 ) ( ON ?auto_52301 ?auto_52295 ) ( CLEAR ?auto_52301 ) ( not ( = ?auto_52287 ?auto_52295 ) ) ( not ( = ?auto_52288 ?auto_52295 ) ) ( not ( = ?auto_52289 ?auto_52295 ) ) ( not ( = ?auto_52301 ?auto_52295 ) ) ( not ( = ?auto_52291 ?auto_52295 ) ) ( not ( = ?auto_52299 ?auto_52295 ) ) ( SURFACE-AT ?auto_52294 ?auto_52296 ) ( CLEAR ?auto_52294 ) ( IS-CRATE ?auto_52299 ) ( not ( = ?auto_52287 ?auto_52294 ) ) ( not ( = ?auto_52288 ?auto_52294 ) ) ( not ( = ?auto_52289 ?auto_52294 ) ) ( not ( = ?auto_52301 ?auto_52294 ) ) ( not ( = ?auto_52291 ?auto_52294 ) ) ( not ( = ?auto_52299 ?auto_52294 ) ) ( not ( = ?auto_52295 ?auto_52294 ) ) ( AVAILABLE ?auto_52292 ) ( IN ?auto_52299 ?auto_52290 ) ( TRUCK-AT ?auto_52290 ?auto_52304 ) ( not ( = ?auto_52304 ?auto_52296 ) ) ( not ( = ?auto_52300 ?auto_52304 ) ) ( not ( = ?auto_52293 ?auto_52304 ) ) ( not ( = ?auto_52297 ?auto_52304 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_52290 ?auto_52304 ?auto_52296 )
      ( MAKE-ON ?auto_52287 ?auto_52288 )
      ( MAKE-ON-VERIFY ?auto_52287 ?auto_52288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52305 - SURFACE
      ?auto_52306 - SURFACE
    )
    :vars
    (
      ?auto_52316 - HOIST
      ?auto_52311 - PLACE
      ?auto_52320 - PLACE
      ?auto_52318 - HOIST
      ?auto_52322 - SURFACE
      ?auto_52321 - SURFACE
      ?auto_52319 - PLACE
      ?auto_52310 - HOIST
      ?auto_52314 - SURFACE
      ?auto_52315 - SURFACE
      ?auto_52308 - PLACE
      ?auto_52307 - HOIST
      ?auto_52317 - SURFACE
      ?auto_52312 - SURFACE
      ?auto_52313 - TRUCK
      ?auto_52309 - PLACE
      ?auto_52323 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_52316 ?auto_52311 ) ( IS-CRATE ?auto_52305 ) ( not ( = ?auto_52305 ?auto_52306 ) ) ( not ( = ?auto_52320 ?auto_52311 ) ) ( HOIST-AT ?auto_52318 ?auto_52320 ) ( not ( = ?auto_52316 ?auto_52318 ) ) ( AVAILABLE ?auto_52318 ) ( SURFACE-AT ?auto_52305 ?auto_52320 ) ( ON ?auto_52305 ?auto_52322 ) ( CLEAR ?auto_52305 ) ( not ( = ?auto_52305 ?auto_52322 ) ) ( not ( = ?auto_52306 ?auto_52322 ) ) ( IS-CRATE ?auto_52306 ) ( not ( = ?auto_52305 ?auto_52321 ) ) ( not ( = ?auto_52306 ?auto_52321 ) ) ( not ( = ?auto_52322 ?auto_52321 ) ) ( not ( = ?auto_52319 ?auto_52311 ) ) ( not ( = ?auto_52320 ?auto_52319 ) ) ( HOIST-AT ?auto_52310 ?auto_52319 ) ( not ( = ?auto_52316 ?auto_52310 ) ) ( not ( = ?auto_52318 ?auto_52310 ) ) ( AVAILABLE ?auto_52310 ) ( SURFACE-AT ?auto_52306 ?auto_52319 ) ( ON ?auto_52306 ?auto_52314 ) ( CLEAR ?auto_52306 ) ( not ( = ?auto_52305 ?auto_52314 ) ) ( not ( = ?auto_52306 ?auto_52314 ) ) ( not ( = ?auto_52322 ?auto_52314 ) ) ( not ( = ?auto_52321 ?auto_52314 ) ) ( IS-CRATE ?auto_52321 ) ( not ( = ?auto_52305 ?auto_52315 ) ) ( not ( = ?auto_52306 ?auto_52315 ) ) ( not ( = ?auto_52322 ?auto_52315 ) ) ( not ( = ?auto_52321 ?auto_52315 ) ) ( not ( = ?auto_52314 ?auto_52315 ) ) ( not ( = ?auto_52308 ?auto_52311 ) ) ( not ( = ?auto_52320 ?auto_52308 ) ) ( not ( = ?auto_52319 ?auto_52308 ) ) ( HOIST-AT ?auto_52307 ?auto_52308 ) ( not ( = ?auto_52316 ?auto_52307 ) ) ( not ( = ?auto_52318 ?auto_52307 ) ) ( not ( = ?auto_52310 ?auto_52307 ) ) ( AVAILABLE ?auto_52307 ) ( SURFACE-AT ?auto_52321 ?auto_52308 ) ( ON ?auto_52321 ?auto_52317 ) ( CLEAR ?auto_52321 ) ( not ( = ?auto_52305 ?auto_52317 ) ) ( not ( = ?auto_52306 ?auto_52317 ) ) ( not ( = ?auto_52322 ?auto_52317 ) ) ( not ( = ?auto_52321 ?auto_52317 ) ) ( not ( = ?auto_52314 ?auto_52317 ) ) ( not ( = ?auto_52315 ?auto_52317 ) ) ( SURFACE-AT ?auto_52312 ?auto_52311 ) ( CLEAR ?auto_52312 ) ( IS-CRATE ?auto_52315 ) ( not ( = ?auto_52305 ?auto_52312 ) ) ( not ( = ?auto_52306 ?auto_52312 ) ) ( not ( = ?auto_52322 ?auto_52312 ) ) ( not ( = ?auto_52321 ?auto_52312 ) ) ( not ( = ?auto_52314 ?auto_52312 ) ) ( not ( = ?auto_52315 ?auto_52312 ) ) ( not ( = ?auto_52317 ?auto_52312 ) ) ( AVAILABLE ?auto_52316 ) ( TRUCK-AT ?auto_52313 ?auto_52309 ) ( not ( = ?auto_52309 ?auto_52311 ) ) ( not ( = ?auto_52320 ?auto_52309 ) ) ( not ( = ?auto_52319 ?auto_52309 ) ) ( not ( = ?auto_52308 ?auto_52309 ) ) ( HOIST-AT ?auto_52323 ?auto_52309 ) ( LIFTING ?auto_52323 ?auto_52315 ) ( not ( = ?auto_52316 ?auto_52323 ) ) ( not ( = ?auto_52318 ?auto_52323 ) ) ( not ( = ?auto_52310 ?auto_52323 ) ) ( not ( = ?auto_52307 ?auto_52323 ) ) )
    :subtasks
    ( ( !LOAD ?auto_52323 ?auto_52315 ?auto_52313 ?auto_52309 )
      ( MAKE-ON ?auto_52305 ?auto_52306 )
      ( MAKE-ON-VERIFY ?auto_52305 ?auto_52306 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52324 - SURFACE
      ?auto_52325 - SURFACE
    )
    :vars
    (
      ?auto_52329 - HOIST
      ?auto_52332 - PLACE
      ?auto_52331 - PLACE
      ?auto_52336 - HOIST
      ?auto_52341 - SURFACE
      ?auto_52327 - SURFACE
      ?auto_52330 - PLACE
      ?auto_52339 - HOIST
      ?auto_52334 - SURFACE
      ?auto_52340 - SURFACE
      ?auto_52335 - PLACE
      ?auto_52326 - HOIST
      ?auto_52338 - SURFACE
      ?auto_52337 - SURFACE
      ?auto_52342 - TRUCK
      ?auto_52333 - PLACE
      ?auto_52328 - HOIST
      ?auto_52343 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52329 ?auto_52332 ) ( IS-CRATE ?auto_52324 ) ( not ( = ?auto_52324 ?auto_52325 ) ) ( not ( = ?auto_52331 ?auto_52332 ) ) ( HOIST-AT ?auto_52336 ?auto_52331 ) ( not ( = ?auto_52329 ?auto_52336 ) ) ( AVAILABLE ?auto_52336 ) ( SURFACE-AT ?auto_52324 ?auto_52331 ) ( ON ?auto_52324 ?auto_52341 ) ( CLEAR ?auto_52324 ) ( not ( = ?auto_52324 ?auto_52341 ) ) ( not ( = ?auto_52325 ?auto_52341 ) ) ( IS-CRATE ?auto_52325 ) ( not ( = ?auto_52324 ?auto_52327 ) ) ( not ( = ?auto_52325 ?auto_52327 ) ) ( not ( = ?auto_52341 ?auto_52327 ) ) ( not ( = ?auto_52330 ?auto_52332 ) ) ( not ( = ?auto_52331 ?auto_52330 ) ) ( HOIST-AT ?auto_52339 ?auto_52330 ) ( not ( = ?auto_52329 ?auto_52339 ) ) ( not ( = ?auto_52336 ?auto_52339 ) ) ( AVAILABLE ?auto_52339 ) ( SURFACE-AT ?auto_52325 ?auto_52330 ) ( ON ?auto_52325 ?auto_52334 ) ( CLEAR ?auto_52325 ) ( not ( = ?auto_52324 ?auto_52334 ) ) ( not ( = ?auto_52325 ?auto_52334 ) ) ( not ( = ?auto_52341 ?auto_52334 ) ) ( not ( = ?auto_52327 ?auto_52334 ) ) ( IS-CRATE ?auto_52327 ) ( not ( = ?auto_52324 ?auto_52340 ) ) ( not ( = ?auto_52325 ?auto_52340 ) ) ( not ( = ?auto_52341 ?auto_52340 ) ) ( not ( = ?auto_52327 ?auto_52340 ) ) ( not ( = ?auto_52334 ?auto_52340 ) ) ( not ( = ?auto_52335 ?auto_52332 ) ) ( not ( = ?auto_52331 ?auto_52335 ) ) ( not ( = ?auto_52330 ?auto_52335 ) ) ( HOIST-AT ?auto_52326 ?auto_52335 ) ( not ( = ?auto_52329 ?auto_52326 ) ) ( not ( = ?auto_52336 ?auto_52326 ) ) ( not ( = ?auto_52339 ?auto_52326 ) ) ( AVAILABLE ?auto_52326 ) ( SURFACE-AT ?auto_52327 ?auto_52335 ) ( ON ?auto_52327 ?auto_52338 ) ( CLEAR ?auto_52327 ) ( not ( = ?auto_52324 ?auto_52338 ) ) ( not ( = ?auto_52325 ?auto_52338 ) ) ( not ( = ?auto_52341 ?auto_52338 ) ) ( not ( = ?auto_52327 ?auto_52338 ) ) ( not ( = ?auto_52334 ?auto_52338 ) ) ( not ( = ?auto_52340 ?auto_52338 ) ) ( SURFACE-AT ?auto_52337 ?auto_52332 ) ( CLEAR ?auto_52337 ) ( IS-CRATE ?auto_52340 ) ( not ( = ?auto_52324 ?auto_52337 ) ) ( not ( = ?auto_52325 ?auto_52337 ) ) ( not ( = ?auto_52341 ?auto_52337 ) ) ( not ( = ?auto_52327 ?auto_52337 ) ) ( not ( = ?auto_52334 ?auto_52337 ) ) ( not ( = ?auto_52340 ?auto_52337 ) ) ( not ( = ?auto_52338 ?auto_52337 ) ) ( AVAILABLE ?auto_52329 ) ( TRUCK-AT ?auto_52342 ?auto_52333 ) ( not ( = ?auto_52333 ?auto_52332 ) ) ( not ( = ?auto_52331 ?auto_52333 ) ) ( not ( = ?auto_52330 ?auto_52333 ) ) ( not ( = ?auto_52335 ?auto_52333 ) ) ( HOIST-AT ?auto_52328 ?auto_52333 ) ( not ( = ?auto_52329 ?auto_52328 ) ) ( not ( = ?auto_52336 ?auto_52328 ) ) ( not ( = ?auto_52339 ?auto_52328 ) ) ( not ( = ?auto_52326 ?auto_52328 ) ) ( AVAILABLE ?auto_52328 ) ( SURFACE-AT ?auto_52340 ?auto_52333 ) ( ON ?auto_52340 ?auto_52343 ) ( CLEAR ?auto_52340 ) ( not ( = ?auto_52324 ?auto_52343 ) ) ( not ( = ?auto_52325 ?auto_52343 ) ) ( not ( = ?auto_52341 ?auto_52343 ) ) ( not ( = ?auto_52327 ?auto_52343 ) ) ( not ( = ?auto_52334 ?auto_52343 ) ) ( not ( = ?auto_52340 ?auto_52343 ) ) ( not ( = ?auto_52338 ?auto_52343 ) ) ( not ( = ?auto_52337 ?auto_52343 ) ) )
    :subtasks
    ( ( !LIFT ?auto_52328 ?auto_52340 ?auto_52343 ?auto_52333 )
      ( MAKE-ON ?auto_52324 ?auto_52325 )
      ( MAKE-ON-VERIFY ?auto_52324 ?auto_52325 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52344 - SURFACE
      ?auto_52345 - SURFACE
    )
    :vars
    (
      ?auto_52352 - HOIST
      ?auto_52348 - PLACE
      ?auto_52360 - PLACE
      ?auto_52353 - HOIST
      ?auto_52358 - SURFACE
      ?auto_52363 - SURFACE
      ?auto_52350 - PLACE
      ?auto_52357 - HOIST
      ?auto_52356 - SURFACE
      ?auto_52349 - SURFACE
      ?auto_52355 - PLACE
      ?auto_52359 - HOIST
      ?auto_52346 - SURFACE
      ?auto_52354 - SURFACE
      ?auto_52361 - PLACE
      ?auto_52362 - HOIST
      ?auto_52351 - SURFACE
      ?auto_52347 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52352 ?auto_52348 ) ( IS-CRATE ?auto_52344 ) ( not ( = ?auto_52344 ?auto_52345 ) ) ( not ( = ?auto_52360 ?auto_52348 ) ) ( HOIST-AT ?auto_52353 ?auto_52360 ) ( not ( = ?auto_52352 ?auto_52353 ) ) ( AVAILABLE ?auto_52353 ) ( SURFACE-AT ?auto_52344 ?auto_52360 ) ( ON ?auto_52344 ?auto_52358 ) ( CLEAR ?auto_52344 ) ( not ( = ?auto_52344 ?auto_52358 ) ) ( not ( = ?auto_52345 ?auto_52358 ) ) ( IS-CRATE ?auto_52345 ) ( not ( = ?auto_52344 ?auto_52363 ) ) ( not ( = ?auto_52345 ?auto_52363 ) ) ( not ( = ?auto_52358 ?auto_52363 ) ) ( not ( = ?auto_52350 ?auto_52348 ) ) ( not ( = ?auto_52360 ?auto_52350 ) ) ( HOIST-AT ?auto_52357 ?auto_52350 ) ( not ( = ?auto_52352 ?auto_52357 ) ) ( not ( = ?auto_52353 ?auto_52357 ) ) ( AVAILABLE ?auto_52357 ) ( SURFACE-AT ?auto_52345 ?auto_52350 ) ( ON ?auto_52345 ?auto_52356 ) ( CLEAR ?auto_52345 ) ( not ( = ?auto_52344 ?auto_52356 ) ) ( not ( = ?auto_52345 ?auto_52356 ) ) ( not ( = ?auto_52358 ?auto_52356 ) ) ( not ( = ?auto_52363 ?auto_52356 ) ) ( IS-CRATE ?auto_52363 ) ( not ( = ?auto_52344 ?auto_52349 ) ) ( not ( = ?auto_52345 ?auto_52349 ) ) ( not ( = ?auto_52358 ?auto_52349 ) ) ( not ( = ?auto_52363 ?auto_52349 ) ) ( not ( = ?auto_52356 ?auto_52349 ) ) ( not ( = ?auto_52355 ?auto_52348 ) ) ( not ( = ?auto_52360 ?auto_52355 ) ) ( not ( = ?auto_52350 ?auto_52355 ) ) ( HOIST-AT ?auto_52359 ?auto_52355 ) ( not ( = ?auto_52352 ?auto_52359 ) ) ( not ( = ?auto_52353 ?auto_52359 ) ) ( not ( = ?auto_52357 ?auto_52359 ) ) ( AVAILABLE ?auto_52359 ) ( SURFACE-AT ?auto_52363 ?auto_52355 ) ( ON ?auto_52363 ?auto_52346 ) ( CLEAR ?auto_52363 ) ( not ( = ?auto_52344 ?auto_52346 ) ) ( not ( = ?auto_52345 ?auto_52346 ) ) ( not ( = ?auto_52358 ?auto_52346 ) ) ( not ( = ?auto_52363 ?auto_52346 ) ) ( not ( = ?auto_52356 ?auto_52346 ) ) ( not ( = ?auto_52349 ?auto_52346 ) ) ( SURFACE-AT ?auto_52354 ?auto_52348 ) ( CLEAR ?auto_52354 ) ( IS-CRATE ?auto_52349 ) ( not ( = ?auto_52344 ?auto_52354 ) ) ( not ( = ?auto_52345 ?auto_52354 ) ) ( not ( = ?auto_52358 ?auto_52354 ) ) ( not ( = ?auto_52363 ?auto_52354 ) ) ( not ( = ?auto_52356 ?auto_52354 ) ) ( not ( = ?auto_52349 ?auto_52354 ) ) ( not ( = ?auto_52346 ?auto_52354 ) ) ( AVAILABLE ?auto_52352 ) ( not ( = ?auto_52361 ?auto_52348 ) ) ( not ( = ?auto_52360 ?auto_52361 ) ) ( not ( = ?auto_52350 ?auto_52361 ) ) ( not ( = ?auto_52355 ?auto_52361 ) ) ( HOIST-AT ?auto_52362 ?auto_52361 ) ( not ( = ?auto_52352 ?auto_52362 ) ) ( not ( = ?auto_52353 ?auto_52362 ) ) ( not ( = ?auto_52357 ?auto_52362 ) ) ( not ( = ?auto_52359 ?auto_52362 ) ) ( AVAILABLE ?auto_52362 ) ( SURFACE-AT ?auto_52349 ?auto_52361 ) ( ON ?auto_52349 ?auto_52351 ) ( CLEAR ?auto_52349 ) ( not ( = ?auto_52344 ?auto_52351 ) ) ( not ( = ?auto_52345 ?auto_52351 ) ) ( not ( = ?auto_52358 ?auto_52351 ) ) ( not ( = ?auto_52363 ?auto_52351 ) ) ( not ( = ?auto_52356 ?auto_52351 ) ) ( not ( = ?auto_52349 ?auto_52351 ) ) ( not ( = ?auto_52346 ?auto_52351 ) ) ( not ( = ?auto_52354 ?auto_52351 ) ) ( TRUCK-AT ?auto_52347 ?auto_52348 ) )
    :subtasks
    ( ( !DRIVE ?auto_52347 ?auto_52348 ?auto_52361 )
      ( MAKE-ON ?auto_52344 ?auto_52345 )
      ( MAKE-ON-VERIFY ?auto_52344 ?auto_52345 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52364 - SURFACE
      ?auto_52365 - SURFACE
    )
    :vars
    (
      ?auto_52376 - HOIST
      ?auto_52378 - PLACE
      ?auto_52372 - PLACE
      ?auto_52381 - HOIST
      ?auto_52382 - SURFACE
      ?auto_52371 - SURFACE
      ?auto_52366 - PLACE
      ?auto_52380 - HOIST
      ?auto_52374 - SURFACE
      ?auto_52379 - SURFACE
      ?auto_52373 - PLACE
      ?auto_52377 - HOIST
      ?auto_52368 - SURFACE
      ?auto_52375 - SURFACE
      ?auto_52383 - PLACE
      ?auto_52370 - HOIST
      ?auto_52367 - SURFACE
      ?auto_52369 - TRUCK
      ?auto_52384 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52376 ?auto_52378 ) ( IS-CRATE ?auto_52364 ) ( not ( = ?auto_52364 ?auto_52365 ) ) ( not ( = ?auto_52372 ?auto_52378 ) ) ( HOIST-AT ?auto_52381 ?auto_52372 ) ( not ( = ?auto_52376 ?auto_52381 ) ) ( AVAILABLE ?auto_52381 ) ( SURFACE-AT ?auto_52364 ?auto_52372 ) ( ON ?auto_52364 ?auto_52382 ) ( CLEAR ?auto_52364 ) ( not ( = ?auto_52364 ?auto_52382 ) ) ( not ( = ?auto_52365 ?auto_52382 ) ) ( IS-CRATE ?auto_52365 ) ( not ( = ?auto_52364 ?auto_52371 ) ) ( not ( = ?auto_52365 ?auto_52371 ) ) ( not ( = ?auto_52382 ?auto_52371 ) ) ( not ( = ?auto_52366 ?auto_52378 ) ) ( not ( = ?auto_52372 ?auto_52366 ) ) ( HOIST-AT ?auto_52380 ?auto_52366 ) ( not ( = ?auto_52376 ?auto_52380 ) ) ( not ( = ?auto_52381 ?auto_52380 ) ) ( AVAILABLE ?auto_52380 ) ( SURFACE-AT ?auto_52365 ?auto_52366 ) ( ON ?auto_52365 ?auto_52374 ) ( CLEAR ?auto_52365 ) ( not ( = ?auto_52364 ?auto_52374 ) ) ( not ( = ?auto_52365 ?auto_52374 ) ) ( not ( = ?auto_52382 ?auto_52374 ) ) ( not ( = ?auto_52371 ?auto_52374 ) ) ( IS-CRATE ?auto_52371 ) ( not ( = ?auto_52364 ?auto_52379 ) ) ( not ( = ?auto_52365 ?auto_52379 ) ) ( not ( = ?auto_52382 ?auto_52379 ) ) ( not ( = ?auto_52371 ?auto_52379 ) ) ( not ( = ?auto_52374 ?auto_52379 ) ) ( not ( = ?auto_52373 ?auto_52378 ) ) ( not ( = ?auto_52372 ?auto_52373 ) ) ( not ( = ?auto_52366 ?auto_52373 ) ) ( HOIST-AT ?auto_52377 ?auto_52373 ) ( not ( = ?auto_52376 ?auto_52377 ) ) ( not ( = ?auto_52381 ?auto_52377 ) ) ( not ( = ?auto_52380 ?auto_52377 ) ) ( AVAILABLE ?auto_52377 ) ( SURFACE-AT ?auto_52371 ?auto_52373 ) ( ON ?auto_52371 ?auto_52368 ) ( CLEAR ?auto_52371 ) ( not ( = ?auto_52364 ?auto_52368 ) ) ( not ( = ?auto_52365 ?auto_52368 ) ) ( not ( = ?auto_52382 ?auto_52368 ) ) ( not ( = ?auto_52371 ?auto_52368 ) ) ( not ( = ?auto_52374 ?auto_52368 ) ) ( not ( = ?auto_52379 ?auto_52368 ) ) ( IS-CRATE ?auto_52379 ) ( not ( = ?auto_52364 ?auto_52375 ) ) ( not ( = ?auto_52365 ?auto_52375 ) ) ( not ( = ?auto_52382 ?auto_52375 ) ) ( not ( = ?auto_52371 ?auto_52375 ) ) ( not ( = ?auto_52374 ?auto_52375 ) ) ( not ( = ?auto_52379 ?auto_52375 ) ) ( not ( = ?auto_52368 ?auto_52375 ) ) ( not ( = ?auto_52383 ?auto_52378 ) ) ( not ( = ?auto_52372 ?auto_52383 ) ) ( not ( = ?auto_52366 ?auto_52383 ) ) ( not ( = ?auto_52373 ?auto_52383 ) ) ( HOIST-AT ?auto_52370 ?auto_52383 ) ( not ( = ?auto_52376 ?auto_52370 ) ) ( not ( = ?auto_52381 ?auto_52370 ) ) ( not ( = ?auto_52380 ?auto_52370 ) ) ( not ( = ?auto_52377 ?auto_52370 ) ) ( AVAILABLE ?auto_52370 ) ( SURFACE-AT ?auto_52379 ?auto_52383 ) ( ON ?auto_52379 ?auto_52367 ) ( CLEAR ?auto_52379 ) ( not ( = ?auto_52364 ?auto_52367 ) ) ( not ( = ?auto_52365 ?auto_52367 ) ) ( not ( = ?auto_52382 ?auto_52367 ) ) ( not ( = ?auto_52371 ?auto_52367 ) ) ( not ( = ?auto_52374 ?auto_52367 ) ) ( not ( = ?auto_52379 ?auto_52367 ) ) ( not ( = ?auto_52368 ?auto_52367 ) ) ( not ( = ?auto_52375 ?auto_52367 ) ) ( TRUCK-AT ?auto_52369 ?auto_52378 ) ( SURFACE-AT ?auto_52384 ?auto_52378 ) ( CLEAR ?auto_52384 ) ( LIFTING ?auto_52376 ?auto_52375 ) ( IS-CRATE ?auto_52375 ) ( not ( = ?auto_52364 ?auto_52384 ) ) ( not ( = ?auto_52365 ?auto_52384 ) ) ( not ( = ?auto_52382 ?auto_52384 ) ) ( not ( = ?auto_52371 ?auto_52384 ) ) ( not ( = ?auto_52374 ?auto_52384 ) ) ( not ( = ?auto_52379 ?auto_52384 ) ) ( not ( = ?auto_52368 ?auto_52384 ) ) ( not ( = ?auto_52375 ?auto_52384 ) ) ( not ( = ?auto_52367 ?auto_52384 ) ) )
    :subtasks
    ( ( !DROP ?auto_52376 ?auto_52375 ?auto_52384 ?auto_52378 )
      ( MAKE-ON ?auto_52364 ?auto_52365 )
      ( MAKE-ON-VERIFY ?auto_52364 ?auto_52365 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52385 - SURFACE
      ?auto_52386 - SURFACE
    )
    :vars
    (
      ?auto_52390 - HOIST
      ?auto_52402 - PLACE
      ?auto_52392 - PLACE
      ?auto_52399 - HOIST
      ?auto_52401 - SURFACE
      ?auto_52389 - SURFACE
      ?auto_52397 - PLACE
      ?auto_52403 - HOIST
      ?auto_52405 - SURFACE
      ?auto_52391 - SURFACE
      ?auto_52395 - PLACE
      ?auto_52396 - HOIST
      ?auto_52394 - SURFACE
      ?auto_52404 - SURFACE
      ?auto_52400 - PLACE
      ?auto_52388 - HOIST
      ?auto_52393 - SURFACE
      ?auto_52387 - TRUCK
      ?auto_52398 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52390 ?auto_52402 ) ( IS-CRATE ?auto_52385 ) ( not ( = ?auto_52385 ?auto_52386 ) ) ( not ( = ?auto_52392 ?auto_52402 ) ) ( HOIST-AT ?auto_52399 ?auto_52392 ) ( not ( = ?auto_52390 ?auto_52399 ) ) ( AVAILABLE ?auto_52399 ) ( SURFACE-AT ?auto_52385 ?auto_52392 ) ( ON ?auto_52385 ?auto_52401 ) ( CLEAR ?auto_52385 ) ( not ( = ?auto_52385 ?auto_52401 ) ) ( not ( = ?auto_52386 ?auto_52401 ) ) ( IS-CRATE ?auto_52386 ) ( not ( = ?auto_52385 ?auto_52389 ) ) ( not ( = ?auto_52386 ?auto_52389 ) ) ( not ( = ?auto_52401 ?auto_52389 ) ) ( not ( = ?auto_52397 ?auto_52402 ) ) ( not ( = ?auto_52392 ?auto_52397 ) ) ( HOIST-AT ?auto_52403 ?auto_52397 ) ( not ( = ?auto_52390 ?auto_52403 ) ) ( not ( = ?auto_52399 ?auto_52403 ) ) ( AVAILABLE ?auto_52403 ) ( SURFACE-AT ?auto_52386 ?auto_52397 ) ( ON ?auto_52386 ?auto_52405 ) ( CLEAR ?auto_52386 ) ( not ( = ?auto_52385 ?auto_52405 ) ) ( not ( = ?auto_52386 ?auto_52405 ) ) ( not ( = ?auto_52401 ?auto_52405 ) ) ( not ( = ?auto_52389 ?auto_52405 ) ) ( IS-CRATE ?auto_52389 ) ( not ( = ?auto_52385 ?auto_52391 ) ) ( not ( = ?auto_52386 ?auto_52391 ) ) ( not ( = ?auto_52401 ?auto_52391 ) ) ( not ( = ?auto_52389 ?auto_52391 ) ) ( not ( = ?auto_52405 ?auto_52391 ) ) ( not ( = ?auto_52395 ?auto_52402 ) ) ( not ( = ?auto_52392 ?auto_52395 ) ) ( not ( = ?auto_52397 ?auto_52395 ) ) ( HOIST-AT ?auto_52396 ?auto_52395 ) ( not ( = ?auto_52390 ?auto_52396 ) ) ( not ( = ?auto_52399 ?auto_52396 ) ) ( not ( = ?auto_52403 ?auto_52396 ) ) ( AVAILABLE ?auto_52396 ) ( SURFACE-AT ?auto_52389 ?auto_52395 ) ( ON ?auto_52389 ?auto_52394 ) ( CLEAR ?auto_52389 ) ( not ( = ?auto_52385 ?auto_52394 ) ) ( not ( = ?auto_52386 ?auto_52394 ) ) ( not ( = ?auto_52401 ?auto_52394 ) ) ( not ( = ?auto_52389 ?auto_52394 ) ) ( not ( = ?auto_52405 ?auto_52394 ) ) ( not ( = ?auto_52391 ?auto_52394 ) ) ( IS-CRATE ?auto_52391 ) ( not ( = ?auto_52385 ?auto_52404 ) ) ( not ( = ?auto_52386 ?auto_52404 ) ) ( not ( = ?auto_52401 ?auto_52404 ) ) ( not ( = ?auto_52389 ?auto_52404 ) ) ( not ( = ?auto_52405 ?auto_52404 ) ) ( not ( = ?auto_52391 ?auto_52404 ) ) ( not ( = ?auto_52394 ?auto_52404 ) ) ( not ( = ?auto_52400 ?auto_52402 ) ) ( not ( = ?auto_52392 ?auto_52400 ) ) ( not ( = ?auto_52397 ?auto_52400 ) ) ( not ( = ?auto_52395 ?auto_52400 ) ) ( HOIST-AT ?auto_52388 ?auto_52400 ) ( not ( = ?auto_52390 ?auto_52388 ) ) ( not ( = ?auto_52399 ?auto_52388 ) ) ( not ( = ?auto_52403 ?auto_52388 ) ) ( not ( = ?auto_52396 ?auto_52388 ) ) ( AVAILABLE ?auto_52388 ) ( SURFACE-AT ?auto_52391 ?auto_52400 ) ( ON ?auto_52391 ?auto_52393 ) ( CLEAR ?auto_52391 ) ( not ( = ?auto_52385 ?auto_52393 ) ) ( not ( = ?auto_52386 ?auto_52393 ) ) ( not ( = ?auto_52401 ?auto_52393 ) ) ( not ( = ?auto_52389 ?auto_52393 ) ) ( not ( = ?auto_52405 ?auto_52393 ) ) ( not ( = ?auto_52391 ?auto_52393 ) ) ( not ( = ?auto_52394 ?auto_52393 ) ) ( not ( = ?auto_52404 ?auto_52393 ) ) ( TRUCK-AT ?auto_52387 ?auto_52402 ) ( SURFACE-AT ?auto_52398 ?auto_52402 ) ( CLEAR ?auto_52398 ) ( IS-CRATE ?auto_52404 ) ( not ( = ?auto_52385 ?auto_52398 ) ) ( not ( = ?auto_52386 ?auto_52398 ) ) ( not ( = ?auto_52401 ?auto_52398 ) ) ( not ( = ?auto_52389 ?auto_52398 ) ) ( not ( = ?auto_52405 ?auto_52398 ) ) ( not ( = ?auto_52391 ?auto_52398 ) ) ( not ( = ?auto_52394 ?auto_52398 ) ) ( not ( = ?auto_52404 ?auto_52398 ) ) ( not ( = ?auto_52393 ?auto_52398 ) ) ( AVAILABLE ?auto_52390 ) ( IN ?auto_52404 ?auto_52387 ) )
    :subtasks
    ( ( !UNLOAD ?auto_52390 ?auto_52404 ?auto_52387 ?auto_52402 )
      ( MAKE-ON ?auto_52385 ?auto_52386 )
      ( MAKE-ON-VERIFY ?auto_52385 ?auto_52386 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52406 - SURFACE
      ?auto_52407 - SURFACE
    )
    :vars
    (
      ?auto_52408 - HOIST
      ?auto_52412 - PLACE
      ?auto_52413 - PLACE
      ?auto_52410 - HOIST
      ?auto_52415 - SURFACE
      ?auto_52419 - SURFACE
      ?auto_52421 - PLACE
      ?auto_52416 - HOIST
      ?auto_52418 - SURFACE
      ?auto_52424 - SURFACE
      ?auto_52409 - PLACE
      ?auto_52411 - HOIST
      ?auto_52420 - SURFACE
      ?auto_52417 - SURFACE
      ?auto_52422 - PLACE
      ?auto_52423 - HOIST
      ?auto_52425 - SURFACE
      ?auto_52426 - SURFACE
      ?auto_52414 - TRUCK
      ?auto_52427 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52408 ?auto_52412 ) ( IS-CRATE ?auto_52406 ) ( not ( = ?auto_52406 ?auto_52407 ) ) ( not ( = ?auto_52413 ?auto_52412 ) ) ( HOIST-AT ?auto_52410 ?auto_52413 ) ( not ( = ?auto_52408 ?auto_52410 ) ) ( AVAILABLE ?auto_52410 ) ( SURFACE-AT ?auto_52406 ?auto_52413 ) ( ON ?auto_52406 ?auto_52415 ) ( CLEAR ?auto_52406 ) ( not ( = ?auto_52406 ?auto_52415 ) ) ( not ( = ?auto_52407 ?auto_52415 ) ) ( IS-CRATE ?auto_52407 ) ( not ( = ?auto_52406 ?auto_52419 ) ) ( not ( = ?auto_52407 ?auto_52419 ) ) ( not ( = ?auto_52415 ?auto_52419 ) ) ( not ( = ?auto_52421 ?auto_52412 ) ) ( not ( = ?auto_52413 ?auto_52421 ) ) ( HOIST-AT ?auto_52416 ?auto_52421 ) ( not ( = ?auto_52408 ?auto_52416 ) ) ( not ( = ?auto_52410 ?auto_52416 ) ) ( AVAILABLE ?auto_52416 ) ( SURFACE-AT ?auto_52407 ?auto_52421 ) ( ON ?auto_52407 ?auto_52418 ) ( CLEAR ?auto_52407 ) ( not ( = ?auto_52406 ?auto_52418 ) ) ( not ( = ?auto_52407 ?auto_52418 ) ) ( not ( = ?auto_52415 ?auto_52418 ) ) ( not ( = ?auto_52419 ?auto_52418 ) ) ( IS-CRATE ?auto_52419 ) ( not ( = ?auto_52406 ?auto_52424 ) ) ( not ( = ?auto_52407 ?auto_52424 ) ) ( not ( = ?auto_52415 ?auto_52424 ) ) ( not ( = ?auto_52419 ?auto_52424 ) ) ( not ( = ?auto_52418 ?auto_52424 ) ) ( not ( = ?auto_52409 ?auto_52412 ) ) ( not ( = ?auto_52413 ?auto_52409 ) ) ( not ( = ?auto_52421 ?auto_52409 ) ) ( HOIST-AT ?auto_52411 ?auto_52409 ) ( not ( = ?auto_52408 ?auto_52411 ) ) ( not ( = ?auto_52410 ?auto_52411 ) ) ( not ( = ?auto_52416 ?auto_52411 ) ) ( AVAILABLE ?auto_52411 ) ( SURFACE-AT ?auto_52419 ?auto_52409 ) ( ON ?auto_52419 ?auto_52420 ) ( CLEAR ?auto_52419 ) ( not ( = ?auto_52406 ?auto_52420 ) ) ( not ( = ?auto_52407 ?auto_52420 ) ) ( not ( = ?auto_52415 ?auto_52420 ) ) ( not ( = ?auto_52419 ?auto_52420 ) ) ( not ( = ?auto_52418 ?auto_52420 ) ) ( not ( = ?auto_52424 ?auto_52420 ) ) ( IS-CRATE ?auto_52424 ) ( not ( = ?auto_52406 ?auto_52417 ) ) ( not ( = ?auto_52407 ?auto_52417 ) ) ( not ( = ?auto_52415 ?auto_52417 ) ) ( not ( = ?auto_52419 ?auto_52417 ) ) ( not ( = ?auto_52418 ?auto_52417 ) ) ( not ( = ?auto_52424 ?auto_52417 ) ) ( not ( = ?auto_52420 ?auto_52417 ) ) ( not ( = ?auto_52422 ?auto_52412 ) ) ( not ( = ?auto_52413 ?auto_52422 ) ) ( not ( = ?auto_52421 ?auto_52422 ) ) ( not ( = ?auto_52409 ?auto_52422 ) ) ( HOIST-AT ?auto_52423 ?auto_52422 ) ( not ( = ?auto_52408 ?auto_52423 ) ) ( not ( = ?auto_52410 ?auto_52423 ) ) ( not ( = ?auto_52416 ?auto_52423 ) ) ( not ( = ?auto_52411 ?auto_52423 ) ) ( AVAILABLE ?auto_52423 ) ( SURFACE-AT ?auto_52424 ?auto_52422 ) ( ON ?auto_52424 ?auto_52425 ) ( CLEAR ?auto_52424 ) ( not ( = ?auto_52406 ?auto_52425 ) ) ( not ( = ?auto_52407 ?auto_52425 ) ) ( not ( = ?auto_52415 ?auto_52425 ) ) ( not ( = ?auto_52419 ?auto_52425 ) ) ( not ( = ?auto_52418 ?auto_52425 ) ) ( not ( = ?auto_52424 ?auto_52425 ) ) ( not ( = ?auto_52420 ?auto_52425 ) ) ( not ( = ?auto_52417 ?auto_52425 ) ) ( SURFACE-AT ?auto_52426 ?auto_52412 ) ( CLEAR ?auto_52426 ) ( IS-CRATE ?auto_52417 ) ( not ( = ?auto_52406 ?auto_52426 ) ) ( not ( = ?auto_52407 ?auto_52426 ) ) ( not ( = ?auto_52415 ?auto_52426 ) ) ( not ( = ?auto_52419 ?auto_52426 ) ) ( not ( = ?auto_52418 ?auto_52426 ) ) ( not ( = ?auto_52424 ?auto_52426 ) ) ( not ( = ?auto_52420 ?auto_52426 ) ) ( not ( = ?auto_52417 ?auto_52426 ) ) ( not ( = ?auto_52425 ?auto_52426 ) ) ( AVAILABLE ?auto_52408 ) ( IN ?auto_52417 ?auto_52414 ) ( TRUCK-AT ?auto_52414 ?auto_52427 ) ( not ( = ?auto_52427 ?auto_52412 ) ) ( not ( = ?auto_52413 ?auto_52427 ) ) ( not ( = ?auto_52421 ?auto_52427 ) ) ( not ( = ?auto_52409 ?auto_52427 ) ) ( not ( = ?auto_52422 ?auto_52427 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_52414 ?auto_52427 ?auto_52412 )
      ( MAKE-ON ?auto_52406 ?auto_52407 )
      ( MAKE-ON-VERIFY ?auto_52406 ?auto_52407 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52428 - SURFACE
      ?auto_52429 - SURFACE
    )
    :vars
    (
      ?auto_52432 - HOIST
      ?auto_52433 - PLACE
      ?auto_52441 - PLACE
      ?auto_52446 - HOIST
      ?auto_52430 - SURFACE
      ?auto_52435 - SURFACE
      ?auto_52434 - PLACE
      ?auto_52447 - HOIST
      ?auto_52442 - SURFACE
      ?auto_52448 - SURFACE
      ?auto_52443 - PLACE
      ?auto_52440 - HOIST
      ?auto_52449 - SURFACE
      ?auto_52436 - SURFACE
      ?auto_52437 - PLACE
      ?auto_52431 - HOIST
      ?auto_52444 - SURFACE
      ?auto_52445 - SURFACE
      ?auto_52438 - TRUCK
      ?auto_52439 - PLACE
      ?auto_52450 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_52432 ?auto_52433 ) ( IS-CRATE ?auto_52428 ) ( not ( = ?auto_52428 ?auto_52429 ) ) ( not ( = ?auto_52441 ?auto_52433 ) ) ( HOIST-AT ?auto_52446 ?auto_52441 ) ( not ( = ?auto_52432 ?auto_52446 ) ) ( AVAILABLE ?auto_52446 ) ( SURFACE-AT ?auto_52428 ?auto_52441 ) ( ON ?auto_52428 ?auto_52430 ) ( CLEAR ?auto_52428 ) ( not ( = ?auto_52428 ?auto_52430 ) ) ( not ( = ?auto_52429 ?auto_52430 ) ) ( IS-CRATE ?auto_52429 ) ( not ( = ?auto_52428 ?auto_52435 ) ) ( not ( = ?auto_52429 ?auto_52435 ) ) ( not ( = ?auto_52430 ?auto_52435 ) ) ( not ( = ?auto_52434 ?auto_52433 ) ) ( not ( = ?auto_52441 ?auto_52434 ) ) ( HOIST-AT ?auto_52447 ?auto_52434 ) ( not ( = ?auto_52432 ?auto_52447 ) ) ( not ( = ?auto_52446 ?auto_52447 ) ) ( AVAILABLE ?auto_52447 ) ( SURFACE-AT ?auto_52429 ?auto_52434 ) ( ON ?auto_52429 ?auto_52442 ) ( CLEAR ?auto_52429 ) ( not ( = ?auto_52428 ?auto_52442 ) ) ( not ( = ?auto_52429 ?auto_52442 ) ) ( not ( = ?auto_52430 ?auto_52442 ) ) ( not ( = ?auto_52435 ?auto_52442 ) ) ( IS-CRATE ?auto_52435 ) ( not ( = ?auto_52428 ?auto_52448 ) ) ( not ( = ?auto_52429 ?auto_52448 ) ) ( not ( = ?auto_52430 ?auto_52448 ) ) ( not ( = ?auto_52435 ?auto_52448 ) ) ( not ( = ?auto_52442 ?auto_52448 ) ) ( not ( = ?auto_52443 ?auto_52433 ) ) ( not ( = ?auto_52441 ?auto_52443 ) ) ( not ( = ?auto_52434 ?auto_52443 ) ) ( HOIST-AT ?auto_52440 ?auto_52443 ) ( not ( = ?auto_52432 ?auto_52440 ) ) ( not ( = ?auto_52446 ?auto_52440 ) ) ( not ( = ?auto_52447 ?auto_52440 ) ) ( AVAILABLE ?auto_52440 ) ( SURFACE-AT ?auto_52435 ?auto_52443 ) ( ON ?auto_52435 ?auto_52449 ) ( CLEAR ?auto_52435 ) ( not ( = ?auto_52428 ?auto_52449 ) ) ( not ( = ?auto_52429 ?auto_52449 ) ) ( not ( = ?auto_52430 ?auto_52449 ) ) ( not ( = ?auto_52435 ?auto_52449 ) ) ( not ( = ?auto_52442 ?auto_52449 ) ) ( not ( = ?auto_52448 ?auto_52449 ) ) ( IS-CRATE ?auto_52448 ) ( not ( = ?auto_52428 ?auto_52436 ) ) ( not ( = ?auto_52429 ?auto_52436 ) ) ( not ( = ?auto_52430 ?auto_52436 ) ) ( not ( = ?auto_52435 ?auto_52436 ) ) ( not ( = ?auto_52442 ?auto_52436 ) ) ( not ( = ?auto_52448 ?auto_52436 ) ) ( not ( = ?auto_52449 ?auto_52436 ) ) ( not ( = ?auto_52437 ?auto_52433 ) ) ( not ( = ?auto_52441 ?auto_52437 ) ) ( not ( = ?auto_52434 ?auto_52437 ) ) ( not ( = ?auto_52443 ?auto_52437 ) ) ( HOIST-AT ?auto_52431 ?auto_52437 ) ( not ( = ?auto_52432 ?auto_52431 ) ) ( not ( = ?auto_52446 ?auto_52431 ) ) ( not ( = ?auto_52447 ?auto_52431 ) ) ( not ( = ?auto_52440 ?auto_52431 ) ) ( AVAILABLE ?auto_52431 ) ( SURFACE-AT ?auto_52448 ?auto_52437 ) ( ON ?auto_52448 ?auto_52444 ) ( CLEAR ?auto_52448 ) ( not ( = ?auto_52428 ?auto_52444 ) ) ( not ( = ?auto_52429 ?auto_52444 ) ) ( not ( = ?auto_52430 ?auto_52444 ) ) ( not ( = ?auto_52435 ?auto_52444 ) ) ( not ( = ?auto_52442 ?auto_52444 ) ) ( not ( = ?auto_52448 ?auto_52444 ) ) ( not ( = ?auto_52449 ?auto_52444 ) ) ( not ( = ?auto_52436 ?auto_52444 ) ) ( SURFACE-AT ?auto_52445 ?auto_52433 ) ( CLEAR ?auto_52445 ) ( IS-CRATE ?auto_52436 ) ( not ( = ?auto_52428 ?auto_52445 ) ) ( not ( = ?auto_52429 ?auto_52445 ) ) ( not ( = ?auto_52430 ?auto_52445 ) ) ( not ( = ?auto_52435 ?auto_52445 ) ) ( not ( = ?auto_52442 ?auto_52445 ) ) ( not ( = ?auto_52448 ?auto_52445 ) ) ( not ( = ?auto_52449 ?auto_52445 ) ) ( not ( = ?auto_52436 ?auto_52445 ) ) ( not ( = ?auto_52444 ?auto_52445 ) ) ( AVAILABLE ?auto_52432 ) ( TRUCK-AT ?auto_52438 ?auto_52439 ) ( not ( = ?auto_52439 ?auto_52433 ) ) ( not ( = ?auto_52441 ?auto_52439 ) ) ( not ( = ?auto_52434 ?auto_52439 ) ) ( not ( = ?auto_52443 ?auto_52439 ) ) ( not ( = ?auto_52437 ?auto_52439 ) ) ( HOIST-AT ?auto_52450 ?auto_52439 ) ( LIFTING ?auto_52450 ?auto_52436 ) ( not ( = ?auto_52432 ?auto_52450 ) ) ( not ( = ?auto_52446 ?auto_52450 ) ) ( not ( = ?auto_52447 ?auto_52450 ) ) ( not ( = ?auto_52440 ?auto_52450 ) ) ( not ( = ?auto_52431 ?auto_52450 ) ) )
    :subtasks
    ( ( !LOAD ?auto_52450 ?auto_52436 ?auto_52438 ?auto_52439 )
      ( MAKE-ON ?auto_52428 ?auto_52429 )
      ( MAKE-ON-VERIFY ?auto_52428 ?auto_52429 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52451 - SURFACE
      ?auto_52452 - SURFACE
    )
    :vars
    (
      ?auto_52463 - HOIST
      ?auto_52464 - PLACE
      ?auto_52473 - PLACE
      ?auto_52459 - HOIST
      ?auto_52466 - SURFACE
      ?auto_52472 - SURFACE
      ?auto_52469 - PLACE
      ?auto_52470 - HOIST
      ?auto_52462 - SURFACE
      ?auto_52455 - SURFACE
      ?auto_52460 - PLACE
      ?auto_52458 - HOIST
      ?auto_52465 - SURFACE
      ?auto_52467 - SURFACE
      ?auto_52457 - PLACE
      ?auto_52471 - HOIST
      ?auto_52456 - SURFACE
      ?auto_52454 - SURFACE
      ?auto_52468 - TRUCK
      ?auto_52461 - PLACE
      ?auto_52453 - HOIST
      ?auto_52474 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52463 ?auto_52464 ) ( IS-CRATE ?auto_52451 ) ( not ( = ?auto_52451 ?auto_52452 ) ) ( not ( = ?auto_52473 ?auto_52464 ) ) ( HOIST-AT ?auto_52459 ?auto_52473 ) ( not ( = ?auto_52463 ?auto_52459 ) ) ( AVAILABLE ?auto_52459 ) ( SURFACE-AT ?auto_52451 ?auto_52473 ) ( ON ?auto_52451 ?auto_52466 ) ( CLEAR ?auto_52451 ) ( not ( = ?auto_52451 ?auto_52466 ) ) ( not ( = ?auto_52452 ?auto_52466 ) ) ( IS-CRATE ?auto_52452 ) ( not ( = ?auto_52451 ?auto_52472 ) ) ( not ( = ?auto_52452 ?auto_52472 ) ) ( not ( = ?auto_52466 ?auto_52472 ) ) ( not ( = ?auto_52469 ?auto_52464 ) ) ( not ( = ?auto_52473 ?auto_52469 ) ) ( HOIST-AT ?auto_52470 ?auto_52469 ) ( not ( = ?auto_52463 ?auto_52470 ) ) ( not ( = ?auto_52459 ?auto_52470 ) ) ( AVAILABLE ?auto_52470 ) ( SURFACE-AT ?auto_52452 ?auto_52469 ) ( ON ?auto_52452 ?auto_52462 ) ( CLEAR ?auto_52452 ) ( not ( = ?auto_52451 ?auto_52462 ) ) ( not ( = ?auto_52452 ?auto_52462 ) ) ( not ( = ?auto_52466 ?auto_52462 ) ) ( not ( = ?auto_52472 ?auto_52462 ) ) ( IS-CRATE ?auto_52472 ) ( not ( = ?auto_52451 ?auto_52455 ) ) ( not ( = ?auto_52452 ?auto_52455 ) ) ( not ( = ?auto_52466 ?auto_52455 ) ) ( not ( = ?auto_52472 ?auto_52455 ) ) ( not ( = ?auto_52462 ?auto_52455 ) ) ( not ( = ?auto_52460 ?auto_52464 ) ) ( not ( = ?auto_52473 ?auto_52460 ) ) ( not ( = ?auto_52469 ?auto_52460 ) ) ( HOIST-AT ?auto_52458 ?auto_52460 ) ( not ( = ?auto_52463 ?auto_52458 ) ) ( not ( = ?auto_52459 ?auto_52458 ) ) ( not ( = ?auto_52470 ?auto_52458 ) ) ( AVAILABLE ?auto_52458 ) ( SURFACE-AT ?auto_52472 ?auto_52460 ) ( ON ?auto_52472 ?auto_52465 ) ( CLEAR ?auto_52472 ) ( not ( = ?auto_52451 ?auto_52465 ) ) ( not ( = ?auto_52452 ?auto_52465 ) ) ( not ( = ?auto_52466 ?auto_52465 ) ) ( not ( = ?auto_52472 ?auto_52465 ) ) ( not ( = ?auto_52462 ?auto_52465 ) ) ( not ( = ?auto_52455 ?auto_52465 ) ) ( IS-CRATE ?auto_52455 ) ( not ( = ?auto_52451 ?auto_52467 ) ) ( not ( = ?auto_52452 ?auto_52467 ) ) ( not ( = ?auto_52466 ?auto_52467 ) ) ( not ( = ?auto_52472 ?auto_52467 ) ) ( not ( = ?auto_52462 ?auto_52467 ) ) ( not ( = ?auto_52455 ?auto_52467 ) ) ( not ( = ?auto_52465 ?auto_52467 ) ) ( not ( = ?auto_52457 ?auto_52464 ) ) ( not ( = ?auto_52473 ?auto_52457 ) ) ( not ( = ?auto_52469 ?auto_52457 ) ) ( not ( = ?auto_52460 ?auto_52457 ) ) ( HOIST-AT ?auto_52471 ?auto_52457 ) ( not ( = ?auto_52463 ?auto_52471 ) ) ( not ( = ?auto_52459 ?auto_52471 ) ) ( not ( = ?auto_52470 ?auto_52471 ) ) ( not ( = ?auto_52458 ?auto_52471 ) ) ( AVAILABLE ?auto_52471 ) ( SURFACE-AT ?auto_52455 ?auto_52457 ) ( ON ?auto_52455 ?auto_52456 ) ( CLEAR ?auto_52455 ) ( not ( = ?auto_52451 ?auto_52456 ) ) ( not ( = ?auto_52452 ?auto_52456 ) ) ( not ( = ?auto_52466 ?auto_52456 ) ) ( not ( = ?auto_52472 ?auto_52456 ) ) ( not ( = ?auto_52462 ?auto_52456 ) ) ( not ( = ?auto_52455 ?auto_52456 ) ) ( not ( = ?auto_52465 ?auto_52456 ) ) ( not ( = ?auto_52467 ?auto_52456 ) ) ( SURFACE-AT ?auto_52454 ?auto_52464 ) ( CLEAR ?auto_52454 ) ( IS-CRATE ?auto_52467 ) ( not ( = ?auto_52451 ?auto_52454 ) ) ( not ( = ?auto_52452 ?auto_52454 ) ) ( not ( = ?auto_52466 ?auto_52454 ) ) ( not ( = ?auto_52472 ?auto_52454 ) ) ( not ( = ?auto_52462 ?auto_52454 ) ) ( not ( = ?auto_52455 ?auto_52454 ) ) ( not ( = ?auto_52465 ?auto_52454 ) ) ( not ( = ?auto_52467 ?auto_52454 ) ) ( not ( = ?auto_52456 ?auto_52454 ) ) ( AVAILABLE ?auto_52463 ) ( TRUCK-AT ?auto_52468 ?auto_52461 ) ( not ( = ?auto_52461 ?auto_52464 ) ) ( not ( = ?auto_52473 ?auto_52461 ) ) ( not ( = ?auto_52469 ?auto_52461 ) ) ( not ( = ?auto_52460 ?auto_52461 ) ) ( not ( = ?auto_52457 ?auto_52461 ) ) ( HOIST-AT ?auto_52453 ?auto_52461 ) ( not ( = ?auto_52463 ?auto_52453 ) ) ( not ( = ?auto_52459 ?auto_52453 ) ) ( not ( = ?auto_52470 ?auto_52453 ) ) ( not ( = ?auto_52458 ?auto_52453 ) ) ( not ( = ?auto_52471 ?auto_52453 ) ) ( AVAILABLE ?auto_52453 ) ( SURFACE-AT ?auto_52467 ?auto_52461 ) ( ON ?auto_52467 ?auto_52474 ) ( CLEAR ?auto_52467 ) ( not ( = ?auto_52451 ?auto_52474 ) ) ( not ( = ?auto_52452 ?auto_52474 ) ) ( not ( = ?auto_52466 ?auto_52474 ) ) ( not ( = ?auto_52472 ?auto_52474 ) ) ( not ( = ?auto_52462 ?auto_52474 ) ) ( not ( = ?auto_52455 ?auto_52474 ) ) ( not ( = ?auto_52465 ?auto_52474 ) ) ( not ( = ?auto_52467 ?auto_52474 ) ) ( not ( = ?auto_52456 ?auto_52474 ) ) ( not ( = ?auto_52454 ?auto_52474 ) ) )
    :subtasks
    ( ( !LIFT ?auto_52453 ?auto_52467 ?auto_52474 ?auto_52461 )
      ( MAKE-ON ?auto_52451 ?auto_52452 )
      ( MAKE-ON-VERIFY ?auto_52451 ?auto_52452 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52475 - SURFACE
      ?auto_52476 - SURFACE
    )
    :vars
    (
      ?auto_52496 - HOIST
      ?auto_52478 - PLACE
      ?auto_52488 - PLACE
      ?auto_52492 - HOIST
      ?auto_52490 - SURFACE
      ?auto_52487 - SURFACE
      ?auto_52482 - PLACE
      ?auto_52489 - HOIST
      ?auto_52477 - SURFACE
      ?auto_52483 - SURFACE
      ?auto_52480 - PLACE
      ?auto_52497 - HOIST
      ?auto_52486 - SURFACE
      ?auto_52481 - SURFACE
      ?auto_52485 - PLACE
      ?auto_52498 - HOIST
      ?auto_52484 - SURFACE
      ?auto_52479 - SURFACE
      ?auto_52493 - PLACE
      ?auto_52494 - HOIST
      ?auto_52495 - SURFACE
      ?auto_52491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52496 ?auto_52478 ) ( IS-CRATE ?auto_52475 ) ( not ( = ?auto_52475 ?auto_52476 ) ) ( not ( = ?auto_52488 ?auto_52478 ) ) ( HOIST-AT ?auto_52492 ?auto_52488 ) ( not ( = ?auto_52496 ?auto_52492 ) ) ( AVAILABLE ?auto_52492 ) ( SURFACE-AT ?auto_52475 ?auto_52488 ) ( ON ?auto_52475 ?auto_52490 ) ( CLEAR ?auto_52475 ) ( not ( = ?auto_52475 ?auto_52490 ) ) ( not ( = ?auto_52476 ?auto_52490 ) ) ( IS-CRATE ?auto_52476 ) ( not ( = ?auto_52475 ?auto_52487 ) ) ( not ( = ?auto_52476 ?auto_52487 ) ) ( not ( = ?auto_52490 ?auto_52487 ) ) ( not ( = ?auto_52482 ?auto_52478 ) ) ( not ( = ?auto_52488 ?auto_52482 ) ) ( HOIST-AT ?auto_52489 ?auto_52482 ) ( not ( = ?auto_52496 ?auto_52489 ) ) ( not ( = ?auto_52492 ?auto_52489 ) ) ( AVAILABLE ?auto_52489 ) ( SURFACE-AT ?auto_52476 ?auto_52482 ) ( ON ?auto_52476 ?auto_52477 ) ( CLEAR ?auto_52476 ) ( not ( = ?auto_52475 ?auto_52477 ) ) ( not ( = ?auto_52476 ?auto_52477 ) ) ( not ( = ?auto_52490 ?auto_52477 ) ) ( not ( = ?auto_52487 ?auto_52477 ) ) ( IS-CRATE ?auto_52487 ) ( not ( = ?auto_52475 ?auto_52483 ) ) ( not ( = ?auto_52476 ?auto_52483 ) ) ( not ( = ?auto_52490 ?auto_52483 ) ) ( not ( = ?auto_52487 ?auto_52483 ) ) ( not ( = ?auto_52477 ?auto_52483 ) ) ( not ( = ?auto_52480 ?auto_52478 ) ) ( not ( = ?auto_52488 ?auto_52480 ) ) ( not ( = ?auto_52482 ?auto_52480 ) ) ( HOIST-AT ?auto_52497 ?auto_52480 ) ( not ( = ?auto_52496 ?auto_52497 ) ) ( not ( = ?auto_52492 ?auto_52497 ) ) ( not ( = ?auto_52489 ?auto_52497 ) ) ( AVAILABLE ?auto_52497 ) ( SURFACE-AT ?auto_52487 ?auto_52480 ) ( ON ?auto_52487 ?auto_52486 ) ( CLEAR ?auto_52487 ) ( not ( = ?auto_52475 ?auto_52486 ) ) ( not ( = ?auto_52476 ?auto_52486 ) ) ( not ( = ?auto_52490 ?auto_52486 ) ) ( not ( = ?auto_52487 ?auto_52486 ) ) ( not ( = ?auto_52477 ?auto_52486 ) ) ( not ( = ?auto_52483 ?auto_52486 ) ) ( IS-CRATE ?auto_52483 ) ( not ( = ?auto_52475 ?auto_52481 ) ) ( not ( = ?auto_52476 ?auto_52481 ) ) ( not ( = ?auto_52490 ?auto_52481 ) ) ( not ( = ?auto_52487 ?auto_52481 ) ) ( not ( = ?auto_52477 ?auto_52481 ) ) ( not ( = ?auto_52483 ?auto_52481 ) ) ( not ( = ?auto_52486 ?auto_52481 ) ) ( not ( = ?auto_52485 ?auto_52478 ) ) ( not ( = ?auto_52488 ?auto_52485 ) ) ( not ( = ?auto_52482 ?auto_52485 ) ) ( not ( = ?auto_52480 ?auto_52485 ) ) ( HOIST-AT ?auto_52498 ?auto_52485 ) ( not ( = ?auto_52496 ?auto_52498 ) ) ( not ( = ?auto_52492 ?auto_52498 ) ) ( not ( = ?auto_52489 ?auto_52498 ) ) ( not ( = ?auto_52497 ?auto_52498 ) ) ( AVAILABLE ?auto_52498 ) ( SURFACE-AT ?auto_52483 ?auto_52485 ) ( ON ?auto_52483 ?auto_52484 ) ( CLEAR ?auto_52483 ) ( not ( = ?auto_52475 ?auto_52484 ) ) ( not ( = ?auto_52476 ?auto_52484 ) ) ( not ( = ?auto_52490 ?auto_52484 ) ) ( not ( = ?auto_52487 ?auto_52484 ) ) ( not ( = ?auto_52477 ?auto_52484 ) ) ( not ( = ?auto_52483 ?auto_52484 ) ) ( not ( = ?auto_52486 ?auto_52484 ) ) ( not ( = ?auto_52481 ?auto_52484 ) ) ( SURFACE-AT ?auto_52479 ?auto_52478 ) ( CLEAR ?auto_52479 ) ( IS-CRATE ?auto_52481 ) ( not ( = ?auto_52475 ?auto_52479 ) ) ( not ( = ?auto_52476 ?auto_52479 ) ) ( not ( = ?auto_52490 ?auto_52479 ) ) ( not ( = ?auto_52487 ?auto_52479 ) ) ( not ( = ?auto_52477 ?auto_52479 ) ) ( not ( = ?auto_52483 ?auto_52479 ) ) ( not ( = ?auto_52486 ?auto_52479 ) ) ( not ( = ?auto_52481 ?auto_52479 ) ) ( not ( = ?auto_52484 ?auto_52479 ) ) ( AVAILABLE ?auto_52496 ) ( not ( = ?auto_52493 ?auto_52478 ) ) ( not ( = ?auto_52488 ?auto_52493 ) ) ( not ( = ?auto_52482 ?auto_52493 ) ) ( not ( = ?auto_52480 ?auto_52493 ) ) ( not ( = ?auto_52485 ?auto_52493 ) ) ( HOIST-AT ?auto_52494 ?auto_52493 ) ( not ( = ?auto_52496 ?auto_52494 ) ) ( not ( = ?auto_52492 ?auto_52494 ) ) ( not ( = ?auto_52489 ?auto_52494 ) ) ( not ( = ?auto_52497 ?auto_52494 ) ) ( not ( = ?auto_52498 ?auto_52494 ) ) ( AVAILABLE ?auto_52494 ) ( SURFACE-AT ?auto_52481 ?auto_52493 ) ( ON ?auto_52481 ?auto_52495 ) ( CLEAR ?auto_52481 ) ( not ( = ?auto_52475 ?auto_52495 ) ) ( not ( = ?auto_52476 ?auto_52495 ) ) ( not ( = ?auto_52490 ?auto_52495 ) ) ( not ( = ?auto_52487 ?auto_52495 ) ) ( not ( = ?auto_52477 ?auto_52495 ) ) ( not ( = ?auto_52483 ?auto_52495 ) ) ( not ( = ?auto_52486 ?auto_52495 ) ) ( not ( = ?auto_52481 ?auto_52495 ) ) ( not ( = ?auto_52484 ?auto_52495 ) ) ( not ( = ?auto_52479 ?auto_52495 ) ) ( TRUCK-AT ?auto_52491 ?auto_52478 ) )
    :subtasks
    ( ( !DRIVE ?auto_52491 ?auto_52478 ?auto_52493 )
      ( MAKE-ON ?auto_52475 ?auto_52476 )
      ( MAKE-ON-VERIFY ?auto_52475 ?auto_52476 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52499 - SURFACE
      ?auto_52500 - SURFACE
    )
    :vars
    (
      ?auto_52519 - HOIST
      ?auto_52512 - PLACE
      ?auto_52514 - PLACE
      ?auto_52520 - HOIST
      ?auto_52509 - SURFACE
      ?auto_52510 - SURFACE
      ?auto_52506 - PLACE
      ?auto_52507 - HOIST
      ?auto_52503 - SURFACE
      ?auto_52515 - SURFACE
      ?auto_52508 - PLACE
      ?auto_52504 - HOIST
      ?auto_52522 - SURFACE
      ?auto_52501 - SURFACE
      ?auto_52513 - PLACE
      ?auto_52505 - HOIST
      ?auto_52517 - SURFACE
      ?auto_52521 - SURFACE
      ?auto_52516 - PLACE
      ?auto_52511 - HOIST
      ?auto_52518 - SURFACE
      ?auto_52502 - TRUCK
      ?auto_52523 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52519 ?auto_52512 ) ( IS-CRATE ?auto_52499 ) ( not ( = ?auto_52499 ?auto_52500 ) ) ( not ( = ?auto_52514 ?auto_52512 ) ) ( HOIST-AT ?auto_52520 ?auto_52514 ) ( not ( = ?auto_52519 ?auto_52520 ) ) ( AVAILABLE ?auto_52520 ) ( SURFACE-AT ?auto_52499 ?auto_52514 ) ( ON ?auto_52499 ?auto_52509 ) ( CLEAR ?auto_52499 ) ( not ( = ?auto_52499 ?auto_52509 ) ) ( not ( = ?auto_52500 ?auto_52509 ) ) ( IS-CRATE ?auto_52500 ) ( not ( = ?auto_52499 ?auto_52510 ) ) ( not ( = ?auto_52500 ?auto_52510 ) ) ( not ( = ?auto_52509 ?auto_52510 ) ) ( not ( = ?auto_52506 ?auto_52512 ) ) ( not ( = ?auto_52514 ?auto_52506 ) ) ( HOIST-AT ?auto_52507 ?auto_52506 ) ( not ( = ?auto_52519 ?auto_52507 ) ) ( not ( = ?auto_52520 ?auto_52507 ) ) ( AVAILABLE ?auto_52507 ) ( SURFACE-AT ?auto_52500 ?auto_52506 ) ( ON ?auto_52500 ?auto_52503 ) ( CLEAR ?auto_52500 ) ( not ( = ?auto_52499 ?auto_52503 ) ) ( not ( = ?auto_52500 ?auto_52503 ) ) ( not ( = ?auto_52509 ?auto_52503 ) ) ( not ( = ?auto_52510 ?auto_52503 ) ) ( IS-CRATE ?auto_52510 ) ( not ( = ?auto_52499 ?auto_52515 ) ) ( not ( = ?auto_52500 ?auto_52515 ) ) ( not ( = ?auto_52509 ?auto_52515 ) ) ( not ( = ?auto_52510 ?auto_52515 ) ) ( not ( = ?auto_52503 ?auto_52515 ) ) ( not ( = ?auto_52508 ?auto_52512 ) ) ( not ( = ?auto_52514 ?auto_52508 ) ) ( not ( = ?auto_52506 ?auto_52508 ) ) ( HOIST-AT ?auto_52504 ?auto_52508 ) ( not ( = ?auto_52519 ?auto_52504 ) ) ( not ( = ?auto_52520 ?auto_52504 ) ) ( not ( = ?auto_52507 ?auto_52504 ) ) ( AVAILABLE ?auto_52504 ) ( SURFACE-AT ?auto_52510 ?auto_52508 ) ( ON ?auto_52510 ?auto_52522 ) ( CLEAR ?auto_52510 ) ( not ( = ?auto_52499 ?auto_52522 ) ) ( not ( = ?auto_52500 ?auto_52522 ) ) ( not ( = ?auto_52509 ?auto_52522 ) ) ( not ( = ?auto_52510 ?auto_52522 ) ) ( not ( = ?auto_52503 ?auto_52522 ) ) ( not ( = ?auto_52515 ?auto_52522 ) ) ( IS-CRATE ?auto_52515 ) ( not ( = ?auto_52499 ?auto_52501 ) ) ( not ( = ?auto_52500 ?auto_52501 ) ) ( not ( = ?auto_52509 ?auto_52501 ) ) ( not ( = ?auto_52510 ?auto_52501 ) ) ( not ( = ?auto_52503 ?auto_52501 ) ) ( not ( = ?auto_52515 ?auto_52501 ) ) ( not ( = ?auto_52522 ?auto_52501 ) ) ( not ( = ?auto_52513 ?auto_52512 ) ) ( not ( = ?auto_52514 ?auto_52513 ) ) ( not ( = ?auto_52506 ?auto_52513 ) ) ( not ( = ?auto_52508 ?auto_52513 ) ) ( HOIST-AT ?auto_52505 ?auto_52513 ) ( not ( = ?auto_52519 ?auto_52505 ) ) ( not ( = ?auto_52520 ?auto_52505 ) ) ( not ( = ?auto_52507 ?auto_52505 ) ) ( not ( = ?auto_52504 ?auto_52505 ) ) ( AVAILABLE ?auto_52505 ) ( SURFACE-AT ?auto_52515 ?auto_52513 ) ( ON ?auto_52515 ?auto_52517 ) ( CLEAR ?auto_52515 ) ( not ( = ?auto_52499 ?auto_52517 ) ) ( not ( = ?auto_52500 ?auto_52517 ) ) ( not ( = ?auto_52509 ?auto_52517 ) ) ( not ( = ?auto_52510 ?auto_52517 ) ) ( not ( = ?auto_52503 ?auto_52517 ) ) ( not ( = ?auto_52515 ?auto_52517 ) ) ( not ( = ?auto_52522 ?auto_52517 ) ) ( not ( = ?auto_52501 ?auto_52517 ) ) ( IS-CRATE ?auto_52501 ) ( not ( = ?auto_52499 ?auto_52521 ) ) ( not ( = ?auto_52500 ?auto_52521 ) ) ( not ( = ?auto_52509 ?auto_52521 ) ) ( not ( = ?auto_52510 ?auto_52521 ) ) ( not ( = ?auto_52503 ?auto_52521 ) ) ( not ( = ?auto_52515 ?auto_52521 ) ) ( not ( = ?auto_52522 ?auto_52521 ) ) ( not ( = ?auto_52501 ?auto_52521 ) ) ( not ( = ?auto_52517 ?auto_52521 ) ) ( not ( = ?auto_52516 ?auto_52512 ) ) ( not ( = ?auto_52514 ?auto_52516 ) ) ( not ( = ?auto_52506 ?auto_52516 ) ) ( not ( = ?auto_52508 ?auto_52516 ) ) ( not ( = ?auto_52513 ?auto_52516 ) ) ( HOIST-AT ?auto_52511 ?auto_52516 ) ( not ( = ?auto_52519 ?auto_52511 ) ) ( not ( = ?auto_52520 ?auto_52511 ) ) ( not ( = ?auto_52507 ?auto_52511 ) ) ( not ( = ?auto_52504 ?auto_52511 ) ) ( not ( = ?auto_52505 ?auto_52511 ) ) ( AVAILABLE ?auto_52511 ) ( SURFACE-AT ?auto_52501 ?auto_52516 ) ( ON ?auto_52501 ?auto_52518 ) ( CLEAR ?auto_52501 ) ( not ( = ?auto_52499 ?auto_52518 ) ) ( not ( = ?auto_52500 ?auto_52518 ) ) ( not ( = ?auto_52509 ?auto_52518 ) ) ( not ( = ?auto_52510 ?auto_52518 ) ) ( not ( = ?auto_52503 ?auto_52518 ) ) ( not ( = ?auto_52515 ?auto_52518 ) ) ( not ( = ?auto_52522 ?auto_52518 ) ) ( not ( = ?auto_52501 ?auto_52518 ) ) ( not ( = ?auto_52517 ?auto_52518 ) ) ( not ( = ?auto_52521 ?auto_52518 ) ) ( TRUCK-AT ?auto_52502 ?auto_52512 ) ( SURFACE-AT ?auto_52523 ?auto_52512 ) ( CLEAR ?auto_52523 ) ( LIFTING ?auto_52519 ?auto_52521 ) ( IS-CRATE ?auto_52521 ) ( not ( = ?auto_52499 ?auto_52523 ) ) ( not ( = ?auto_52500 ?auto_52523 ) ) ( not ( = ?auto_52509 ?auto_52523 ) ) ( not ( = ?auto_52510 ?auto_52523 ) ) ( not ( = ?auto_52503 ?auto_52523 ) ) ( not ( = ?auto_52515 ?auto_52523 ) ) ( not ( = ?auto_52522 ?auto_52523 ) ) ( not ( = ?auto_52501 ?auto_52523 ) ) ( not ( = ?auto_52517 ?auto_52523 ) ) ( not ( = ?auto_52521 ?auto_52523 ) ) ( not ( = ?auto_52518 ?auto_52523 ) ) )
    :subtasks
    ( ( !DROP ?auto_52519 ?auto_52521 ?auto_52523 ?auto_52512 )
      ( MAKE-ON ?auto_52499 ?auto_52500 )
      ( MAKE-ON-VERIFY ?auto_52499 ?auto_52500 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52524 - SURFACE
      ?auto_52525 - SURFACE
    )
    :vars
    (
      ?auto_52535 - HOIST
      ?auto_52529 - PLACE
      ?auto_52544 - PLACE
      ?auto_52538 - HOIST
      ?auto_52546 - SURFACE
      ?auto_52526 - SURFACE
      ?auto_52528 - PLACE
      ?auto_52532 - HOIST
      ?auto_52536 - SURFACE
      ?auto_52531 - SURFACE
      ?auto_52527 - PLACE
      ?auto_52547 - HOIST
      ?auto_52540 - SURFACE
      ?auto_52542 - SURFACE
      ?auto_52537 - PLACE
      ?auto_52545 - HOIST
      ?auto_52543 - SURFACE
      ?auto_52539 - SURFACE
      ?auto_52541 - PLACE
      ?auto_52548 - HOIST
      ?auto_52534 - SURFACE
      ?auto_52530 - TRUCK
      ?auto_52533 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52535 ?auto_52529 ) ( IS-CRATE ?auto_52524 ) ( not ( = ?auto_52524 ?auto_52525 ) ) ( not ( = ?auto_52544 ?auto_52529 ) ) ( HOIST-AT ?auto_52538 ?auto_52544 ) ( not ( = ?auto_52535 ?auto_52538 ) ) ( AVAILABLE ?auto_52538 ) ( SURFACE-AT ?auto_52524 ?auto_52544 ) ( ON ?auto_52524 ?auto_52546 ) ( CLEAR ?auto_52524 ) ( not ( = ?auto_52524 ?auto_52546 ) ) ( not ( = ?auto_52525 ?auto_52546 ) ) ( IS-CRATE ?auto_52525 ) ( not ( = ?auto_52524 ?auto_52526 ) ) ( not ( = ?auto_52525 ?auto_52526 ) ) ( not ( = ?auto_52546 ?auto_52526 ) ) ( not ( = ?auto_52528 ?auto_52529 ) ) ( not ( = ?auto_52544 ?auto_52528 ) ) ( HOIST-AT ?auto_52532 ?auto_52528 ) ( not ( = ?auto_52535 ?auto_52532 ) ) ( not ( = ?auto_52538 ?auto_52532 ) ) ( AVAILABLE ?auto_52532 ) ( SURFACE-AT ?auto_52525 ?auto_52528 ) ( ON ?auto_52525 ?auto_52536 ) ( CLEAR ?auto_52525 ) ( not ( = ?auto_52524 ?auto_52536 ) ) ( not ( = ?auto_52525 ?auto_52536 ) ) ( not ( = ?auto_52546 ?auto_52536 ) ) ( not ( = ?auto_52526 ?auto_52536 ) ) ( IS-CRATE ?auto_52526 ) ( not ( = ?auto_52524 ?auto_52531 ) ) ( not ( = ?auto_52525 ?auto_52531 ) ) ( not ( = ?auto_52546 ?auto_52531 ) ) ( not ( = ?auto_52526 ?auto_52531 ) ) ( not ( = ?auto_52536 ?auto_52531 ) ) ( not ( = ?auto_52527 ?auto_52529 ) ) ( not ( = ?auto_52544 ?auto_52527 ) ) ( not ( = ?auto_52528 ?auto_52527 ) ) ( HOIST-AT ?auto_52547 ?auto_52527 ) ( not ( = ?auto_52535 ?auto_52547 ) ) ( not ( = ?auto_52538 ?auto_52547 ) ) ( not ( = ?auto_52532 ?auto_52547 ) ) ( AVAILABLE ?auto_52547 ) ( SURFACE-AT ?auto_52526 ?auto_52527 ) ( ON ?auto_52526 ?auto_52540 ) ( CLEAR ?auto_52526 ) ( not ( = ?auto_52524 ?auto_52540 ) ) ( not ( = ?auto_52525 ?auto_52540 ) ) ( not ( = ?auto_52546 ?auto_52540 ) ) ( not ( = ?auto_52526 ?auto_52540 ) ) ( not ( = ?auto_52536 ?auto_52540 ) ) ( not ( = ?auto_52531 ?auto_52540 ) ) ( IS-CRATE ?auto_52531 ) ( not ( = ?auto_52524 ?auto_52542 ) ) ( not ( = ?auto_52525 ?auto_52542 ) ) ( not ( = ?auto_52546 ?auto_52542 ) ) ( not ( = ?auto_52526 ?auto_52542 ) ) ( not ( = ?auto_52536 ?auto_52542 ) ) ( not ( = ?auto_52531 ?auto_52542 ) ) ( not ( = ?auto_52540 ?auto_52542 ) ) ( not ( = ?auto_52537 ?auto_52529 ) ) ( not ( = ?auto_52544 ?auto_52537 ) ) ( not ( = ?auto_52528 ?auto_52537 ) ) ( not ( = ?auto_52527 ?auto_52537 ) ) ( HOIST-AT ?auto_52545 ?auto_52537 ) ( not ( = ?auto_52535 ?auto_52545 ) ) ( not ( = ?auto_52538 ?auto_52545 ) ) ( not ( = ?auto_52532 ?auto_52545 ) ) ( not ( = ?auto_52547 ?auto_52545 ) ) ( AVAILABLE ?auto_52545 ) ( SURFACE-AT ?auto_52531 ?auto_52537 ) ( ON ?auto_52531 ?auto_52543 ) ( CLEAR ?auto_52531 ) ( not ( = ?auto_52524 ?auto_52543 ) ) ( not ( = ?auto_52525 ?auto_52543 ) ) ( not ( = ?auto_52546 ?auto_52543 ) ) ( not ( = ?auto_52526 ?auto_52543 ) ) ( not ( = ?auto_52536 ?auto_52543 ) ) ( not ( = ?auto_52531 ?auto_52543 ) ) ( not ( = ?auto_52540 ?auto_52543 ) ) ( not ( = ?auto_52542 ?auto_52543 ) ) ( IS-CRATE ?auto_52542 ) ( not ( = ?auto_52524 ?auto_52539 ) ) ( not ( = ?auto_52525 ?auto_52539 ) ) ( not ( = ?auto_52546 ?auto_52539 ) ) ( not ( = ?auto_52526 ?auto_52539 ) ) ( not ( = ?auto_52536 ?auto_52539 ) ) ( not ( = ?auto_52531 ?auto_52539 ) ) ( not ( = ?auto_52540 ?auto_52539 ) ) ( not ( = ?auto_52542 ?auto_52539 ) ) ( not ( = ?auto_52543 ?auto_52539 ) ) ( not ( = ?auto_52541 ?auto_52529 ) ) ( not ( = ?auto_52544 ?auto_52541 ) ) ( not ( = ?auto_52528 ?auto_52541 ) ) ( not ( = ?auto_52527 ?auto_52541 ) ) ( not ( = ?auto_52537 ?auto_52541 ) ) ( HOIST-AT ?auto_52548 ?auto_52541 ) ( not ( = ?auto_52535 ?auto_52548 ) ) ( not ( = ?auto_52538 ?auto_52548 ) ) ( not ( = ?auto_52532 ?auto_52548 ) ) ( not ( = ?auto_52547 ?auto_52548 ) ) ( not ( = ?auto_52545 ?auto_52548 ) ) ( AVAILABLE ?auto_52548 ) ( SURFACE-AT ?auto_52542 ?auto_52541 ) ( ON ?auto_52542 ?auto_52534 ) ( CLEAR ?auto_52542 ) ( not ( = ?auto_52524 ?auto_52534 ) ) ( not ( = ?auto_52525 ?auto_52534 ) ) ( not ( = ?auto_52546 ?auto_52534 ) ) ( not ( = ?auto_52526 ?auto_52534 ) ) ( not ( = ?auto_52536 ?auto_52534 ) ) ( not ( = ?auto_52531 ?auto_52534 ) ) ( not ( = ?auto_52540 ?auto_52534 ) ) ( not ( = ?auto_52542 ?auto_52534 ) ) ( not ( = ?auto_52543 ?auto_52534 ) ) ( not ( = ?auto_52539 ?auto_52534 ) ) ( TRUCK-AT ?auto_52530 ?auto_52529 ) ( SURFACE-AT ?auto_52533 ?auto_52529 ) ( CLEAR ?auto_52533 ) ( IS-CRATE ?auto_52539 ) ( not ( = ?auto_52524 ?auto_52533 ) ) ( not ( = ?auto_52525 ?auto_52533 ) ) ( not ( = ?auto_52546 ?auto_52533 ) ) ( not ( = ?auto_52526 ?auto_52533 ) ) ( not ( = ?auto_52536 ?auto_52533 ) ) ( not ( = ?auto_52531 ?auto_52533 ) ) ( not ( = ?auto_52540 ?auto_52533 ) ) ( not ( = ?auto_52542 ?auto_52533 ) ) ( not ( = ?auto_52543 ?auto_52533 ) ) ( not ( = ?auto_52539 ?auto_52533 ) ) ( not ( = ?auto_52534 ?auto_52533 ) ) ( AVAILABLE ?auto_52535 ) ( IN ?auto_52539 ?auto_52530 ) )
    :subtasks
    ( ( !UNLOAD ?auto_52535 ?auto_52539 ?auto_52530 ?auto_52529 )
      ( MAKE-ON ?auto_52524 ?auto_52525 )
      ( MAKE-ON-VERIFY ?auto_52524 ?auto_52525 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52549 - SURFACE
      ?auto_52550 - SURFACE
    )
    :vars
    (
      ?auto_52572 - HOIST
      ?auto_52565 - PLACE
      ?auto_52559 - PLACE
      ?auto_52567 - HOIST
      ?auto_52561 - SURFACE
      ?auto_52552 - SURFACE
      ?auto_52553 - PLACE
      ?auto_52554 - HOIST
      ?auto_52556 - SURFACE
      ?auto_52551 - SURFACE
      ?auto_52573 - PLACE
      ?auto_52562 - HOIST
      ?auto_52566 - SURFACE
      ?auto_52571 - SURFACE
      ?auto_52569 - PLACE
      ?auto_52560 - HOIST
      ?auto_52558 - SURFACE
      ?auto_52568 - SURFACE
      ?auto_52564 - PLACE
      ?auto_52563 - HOIST
      ?auto_52555 - SURFACE
      ?auto_52570 - SURFACE
      ?auto_52557 - TRUCK
      ?auto_52574 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52572 ?auto_52565 ) ( IS-CRATE ?auto_52549 ) ( not ( = ?auto_52549 ?auto_52550 ) ) ( not ( = ?auto_52559 ?auto_52565 ) ) ( HOIST-AT ?auto_52567 ?auto_52559 ) ( not ( = ?auto_52572 ?auto_52567 ) ) ( AVAILABLE ?auto_52567 ) ( SURFACE-AT ?auto_52549 ?auto_52559 ) ( ON ?auto_52549 ?auto_52561 ) ( CLEAR ?auto_52549 ) ( not ( = ?auto_52549 ?auto_52561 ) ) ( not ( = ?auto_52550 ?auto_52561 ) ) ( IS-CRATE ?auto_52550 ) ( not ( = ?auto_52549 ?auto_52552 ) ) ( not ( = ?auto_52550 ?auto_52552 ) ) ( not ( = ?auto_52561 ?auto_52552 ) ) ( not ( = ?auto_52553 ?auto_52565 ) ) ( not ( = ?auto_52559 ?auto_52553 ) ) ( HOIST-AT ?auto_52554 ?auto_52553 ) ( not ( = ?auto_52572 ?auto_52554 ) ) ( not ( = ?auto_52567 ?auto_52554 ) ) ( AVAILABLE ?auto_52554 ) ( SURFACE-AT ?auto_52550 ?auto_52553 ) ( ON ?auto_52550 ?auto_52556 ) ( CLEAR ?auto_52550 ) ( not ( = ?auto_52549 ?auto_52556 ) ) ( not ( = ?auto_52550 ?auto_52556 ) ) ( not ( = ?auto_52561 ?auto_52556 ) ) ( not ( = ?auto_52552 ?auto_52556 ) ) ( IS-CRATE ?auto_52552 ) ( not ( = ?auto_52549 ?auto_52551 ) ) ( not ( = ?auto_52550 ?auto_52551 ) ) ( not ( = ?auto_52561 ?auto_52551 ) ) ( not ( = ?auto_52552 ?auto_52551 ) ) ( not ( = ?auto_52556 ?auto_52551 ) ) ( not ( = ?auto_52573 ?auto_52565 ) ) ( not ( = ?auto_52559 ?auto_52573 ) ) ( not ( = ?auto_52553 ?auto_52573 ) ) ( HOIST-AT ?auto_52562 ?auto_52573 ) ( not ( = ?auto_52572 ?auto_52562 ) ) ( not ( = ?auto_52567 ?auto_52562 ) ) ( not ( = ?auto_52554 ?auto_52562 ) ) ( AVAILABLE ?auto_52562 ) ( SURFACE-AT ?auto_52552 ?auto_52573 ) ( ON ?auto_52552 ?auto_52566 ) ( CLEAR ?auto_52552 ) ( not ( = ?auto_52549 ?auto_52566 ) ) ( not ( = ?auto_52550 ?auto_52566 ) ) ( not ( = ?auto_52561 ?auto_52566 ) ) ( not ( = ?auto_52552 ?auto_52566 ) ) ( not ( = ?auto_52556 ?auto_52566 ) ) ( not ( = ?auto_52551 ?auto_52566 ) ) ( IS-CRATE ?auto_52551 ) ( not ( = ?auto_52549 ?auto_52571 ) ) ( not ( = ?auto_52550 ?auto_52571 ) ) ( not ( = ?auto_52561 ?auto_52571 ) ) ( not ( = ?auto_52552 ?auto_52571 ) ) ( not ( = ?auto_52556 ?auto_52571 ) ) ( not ( = ?auto_52551 ?auto_52571 ) ) ( not ( = ?auto_52566 ?auto_52571 ) ) ( not ( = ?auto_52569 ?auto_52565 ) ) ( not ( = ?auto_52559 ?auto_52569 ) ) ( not ( = ?auto_52553 ?auto_52569 ) ) ( not ( = ?auto_52573 ?auto_52569 ) ) ( HOIST-AT ?auto_52560 ?auto_52569 ) ( not ( = ?auto_52572 ?auto_52560 ) ) ( not ( = ?auto_52567 ?auto_52560 ) ) ( not ( = ?auto_52554 ?auto_52560 ) ) ( not ( = ?auto_52562 ?auto_52560 ) ) ( AVAILABLE ?auto_52560 ) ( SURFACE-AT ?auto_52551 ?auto_52569 ) ( ON ?auto_52551 ?auto_52558 ) ( CLEAR ?auto_52551 ) ( not ( = ?auto_52549 ?auto_52558 ) ) ( not ( = ?auto_52550 ?auto_52558 ) ) ( not ( = ?auto_52561 ?auto_52558 ) ) ( not ( = ?auto_52552 ?auto_52558 ) ) ( not ( = ?auto_52556 ?auto_52558 ) ) ( not ( = ?auto_52551 ?auto_52558 ) ) ( not ( = ?auto_52566 ?auto_52558 ) ) ( not ( = ?auto_52571 ?auto_52558 ) ) ( IS-CRATE ?auto_52571 ) ( not ( = ?auto_52549 ?auto_52568 ) ) ( not ( = ?auto_52550 ?auto_52568 ) ) ( not ( = ?auto_52561 ?auto_52568 ) ) ( not ( = ?auto_52552 ?auto_52568 ) ) ( not ( = ?auto_52556 ?auto_52568 ) ) ( not ( = ?auto_52551 ?auto_52568 ) ) ( not ( = ?auto_52566 ?auto_52568 ) ) ( not ( = ?auto_52571 ?auto_52568 ) ) ( not ( = ?auto_52558 ?auto_52568 ) ) ( not ( = ?auto_52564 ?auto_52565 ) ) ( not ( = ?auto_52559 ?auto_52564 ) ) ( not ( = ?auto_52553 ?auto_52564 ) ) ( not ( = ?auto_52573 ?auto_52564 ) ) ( not ( = ?auto_52569 ?auto_52564 ) ) ( HOIST-AT ?auto_52563 ?auto_52564 ) ( not ( = ?auto_52572 ?auto_52563 ) ) ( not ( = ?auto_52567 ?auto_52563 ) ) ( not ( = ?auto_52554 ?auto_52563 ) ) ( not ( = ?auto_52562 ?auto_52563 ) ) ( not ( = ?auto_52560 ?auto_52563 ) ) ( AVAILABLE ?auto_52563 ) ( SURFACE-AT ?auto_52571 ?auto_52564 ) ( ON ?auto_52571 ?auto_52555 ) ( CLEAR ?auto_52571 ) ( not ( = ?auto_52549 ?auto_52555 ) ) ( not ( = ?auto_52550 ?auto_52555 ) ) ( not ( = ?auto_52561 ?auto_52555 ) ) ( not ( = ?auto_52552 ?auto_52555 ) ) ( not ( = ?auto_52556 ?auto_52555 ) ) ( not ( = ?auto_52551 ?auto_52555 ) ) ( not ( = ?auto_52566 ?auto_52555 ) ) ( not ( = ?auto_52571 ?auto_52555 ) ) ( not ( = ?auto_52558 ?auto_52555 ) ) ( not ( = ?auto_52568 ?auto_52555 ) ) ( SURFACE-AT ?auto_52570 ?auto_52565 ) ( CLEAR ?auto_52570 ) ( IS-CRATE ?auto_52568 ) ( not ( = ?auto_52549 ?auto_52570 ) ) ( not ( = ?auto_52550 ?auto_52570 ) ) ( not ( = ?auto_52561 ?auto_52570 ) ) ( not ( = ?auto_52552 ?auto_52570 ) ) ( not ( = ?auto_52556 ?auto_52570 ) ) ( not ( = ?auto_52551 ?auto_52570 ) ) ( not ( = ?auto_52566 ?auto_52570 ) ) ( not ( = ?auto_52571 ?auto_52570 ) ) ( not ( = ?auto_52558 ?auto_52570 ) ) ( not ( = ?auto_52568 ?auto_52570 ) ) ( not ( = ?auto_52555 ?auto_52570 ) ) ( AVAILABLE ?auto_52572 ) ( IN ?auto_52568 ?auto_52557 ) ( TRUCK-AT ?auto_52557 ?auto_52574 ) ( not ( = ?auto_52574 ?auto_52565 ) ) ( not ( = ?auto_52559 ?auto_52574 ) ) ( not ( = ?auto_52553 ?auto_52574 ) ) ( not ( = ?auto_52573 ?auto_52574 ) ) ( not ( = ?auto_52569 ?auto_52574 ) ) ( not ( = ?auto_52564 ?auto_52574 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_52557 ?auto_52574 ?auto_52565 )
      ( MAKE-ON ?auto_52549 ?auto_52550 )
      ( MAKE-ON-VERIFY ?auto_52549 ?auto_52550 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52575 - SURFACE
      ?auto_52576 - SURFACE
    )
    :vars
    (
      ?auto_52596 - HOIST
      ?auto_52597 - PLACE
      ?auto_52600 - PLACE
      ?auto_52579 - HOIST
      ?auto_52583 - SURFACE
      ?auto_52599 - SURFACE
      ?auto_52587 - PLACE
      ?auto_52580 - HOIST
      ?auto_52578 - SURFACE
      ?auto_52581 - SURFACE
      ?auto_52588 - PLACE
      ?auto_52585 - HOIST
      ?auto_52589 - SURFACE
      ?auto_52595 - SURFACE
      ?auto_52593 - PLACE
      ?auto_52584 - HOIST
      ?auto_52598 - SURFACE
      ?auto_52577 - SURFACE
      ?auto_52591 - PLACE
      ?auto_52586 - HOIST
      ?auto_52582 - SURFACE
      ?auto_52594 - SURFACE
      ?auto_52590 - TRUCK
      ?auto_52592 - PLACE
      ?auto_52601 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_52596 ?auto_52597 ) ( IS-CRATE ?auto_52575 ) ( not ( = ?auto_52575 ?auto_52576 ) ) ( not ( = ?auto_52600 ?auto_52597 ) ) ( HOIST-AT ?auto_52579 ?auto_52600 ) ( not ( = ?auto_52596 ?auto_52579 ) ) ( AVAILABLE ?auto_52579 ) ( SURFACE-AT ?auto_52575 ?auto_52600 ) ( ON ?auto_52575 ?auto_52583 ) ( CLEAR ?auto_52575 ) ( not ( = ?auto_52575 ?auto_52583 ) ) ( not ( = ?auto_52576 ?auto_52583 ) ) ( IS-CRATE ?auto_52576 ) ( not ( = ?auto_52575 ?auto_52599 ) ) ( not ( = ?auto_52576 ?auto_52599 ) ) ( not ( = ?auto_52583 ?auto_52599 ) ) ( not ( = ?auto_52587 ?auto_52597 ) ) ( not ( = ?auto_52600 ?auto_52587 ) ) ( HOIST-AT ?auto_52580 ?auto_52587 ) ( not ( = ?auto_52596 ?auto_52580 ) ) ( not ( = ?auto_52579 ?auto_52580 ) ) ( AVAILABLE ?auto_52580 ) ( SURFACE-AT ?auto_52576 ?auto_52587 ) ( ON ?auto_52576 ?auto_52578 ) ( CLEAR ?auto_52576 ) ( not ( = ?auto_52575 ?auto_52578 ) ) ( not ( = ?auto_52576 ?auto_52578 ) ) ( not ( = ?auto_52583 ?auto_52578 ) ) ( not ( = ?auto_52599 ?auto_52578 ) ) ( IS-CRATE ?auto_52599 ) ( not ( = ?auto_52575 ?auto_52581 ) ) ( not ( = ?auto_52576 ?auto_52581 ) ) ( not ( = ?auto_52583 ?auto_52581 ) ) ( not ( = ?auto_52599 ?auto_52581 ) ) ( not ( = ?auto_52578 ?auto_52581 ) ) ( not ( = ?auto_52588 ?auto_52597 ) ) ( not ( = ?auto_52600 ?auto_52588 ) ) ( not ( = ?auto_52587 ?auto_52588 ) ) ( HOIST-AT ?auto_52585 ?auto_52588 ) ( not ( = ?auto_52596 ?auto_52585 ) ) ( not ( = ?auto_52579 ?auto_52585 ) ) ( not ( = ?auto_52580 ?auto_52585 ) ) ( AVAILABLE ?auto_52585 ) ( SURFACE-AT ?auto_52599 ?auto_52588 ) ( ON ?auto_52599 ?auto_52589 ) ( CLEAR ?auto_52599 ) ( not ( = ?auto_52575 ?auto_52589 ) ) ( not ( = ?auto_52576 ?auto_52589 ) ) ( not ( = ?auto_52583 ?auto_52589 ) ) ( not ( = ?auto_52599 ?auto_52589 ) ) ( not ( = ?auto_52578 ?auto_52589 ) ) ( not ( = ?auto_52581 ?auto_52589 ) ) ( IS-CRATE ?auto_52581 ) ( not ( = ?auto_52575 ?auto_52595 ) ) ( not ( = ?auto_52576 ?auto_52595 ) ) ( not ( = ?auto_52583 ?auto_52595 ) ) ( not ( = ?auto_52599 ?auto_52595 ) ) ( not ( = ?auto_52578 ?auto_52595 ) ) ( not ( = ?auto_52581 ?auto_52595 ) ) ( not ( = ?auto_52589 ?auto_52595 ) ) ( not ( = ?auto_52593 ?auto_52597 ) ) ( not ( = ?auto_52600 ?auto_52593 ) ) ( not ( = ?auto_52587 ?auto_52593 ) ) ( not ( = ?auto_52588 ?auto_52593 ) ) ( HOIST-AT ?auto_52584 ?auto_52593 ) ( not ( = ?auto_52596 ?auto_52584 ) ) ( not ( = ?auto_52579 ?auto_52584 ) ) ( not ( = ?auto_52580 ?auto_52584 ) ) ( not ( = ?auto_52585 ?auto_52584 ) ) ( AVAILABLE ?auto_52584 ) ( SURFACE-AT ?auto_52581 ?auto_52593 ) ( ON ?auto_52581 ?auto_52598 ) ( CLEAR ?auto_52581 ) ( not ( = ?auto_52575 ?auto_52598 ) ) ( not ( = ?auto_52576 ?auto_52598 ) ) ( not ( = ?auto_52583 ?auto_52598 ) ) ( not ( = ?auto_52599 ?auto_52598 ) ) ( not ( = ?auto_52578 ?auto_52598 ) ) ( not ( = ?auto_52581 ?auto_52598 ) ) ( not ( = ?auto_52589 ?auto_52598 ) ) ( not ( = ?auto_52595 ?auto_52598 ) ) ( IS-CRATE ?auto_52595 ) ( not ( = ?auto_52575 ?auto_52577 ) ) ( not ( = ?auto_52576 ?auto_52577 ) ) ( not ( = ?auto_52583 ?auto_52577 ) ) ( not ( = ?auto_52599 ?auto_52577 ) ) ( not ( = ?auto_52578 ?auto_52577 ) ) ( not ( = ?auto_52581 ?auto_52577 ) ) ( not ( = ?auto_52589 ?auto_52577 ) ) ( not ( = ?auto_52595 ?auto_52577 ) ) ( not ( = ?auto_52598 ?auto_52577 ) ) ( not ( = ?auto_52591 ?auto_52597 ) ) ( not ( = ?auto_52600 ?auto_52591 ) ) ( not ( = ?auto_52587 ?auto_52591 ) ) ( not ( = ?auto_52588 ?auto_52591 ) ) ( not ( = ?auto_52593 ?auto_52591 ) ) ( HOIST-AT ?auto_52586 ?auto_52591 ) ( not ( = ?auto_52596 ?auto_52586 ) ) ( not ( = ?auto_52579 ?auto_52586 ) ) ( not ( = ?auto_52580 ?auto_52586 ) ) ( not ( = ?auto_52585 ?auto_52586 ) ) ( not ( = ?auto_52584 ?auto_52586 ) ) ( AVAILABLE ?auto_52586 ) ( SURFACE-AT ?auto_52595 ?auto_52591 ) ( ON ?auto_52595 ?auto_52582 ) ( CLEAR ?auto_52595 ) ( not ( = ?auto_52575 ?auto_52582 ) ) ( not ( = ?auto_52576 ?auto_52582 ) ) ( not ( = ?auto_52583 ?auto_52582 ) ) ( not ( = ?auto_52599 ?auto_52582 ) ) ( not ( = ?auto_52578 ?auto_52582 ) ) ( not ( = ?auto_52581 ?auto_52582 ) ) ( not ( = ?auto_52589 ?auto_52582 ) ) ( not ( = ?auto_52595 ?auto_52582 ) ) ( not ( = ?auto_52598 ?auto_52582 ) ) ( not ( = ?auto_52577 ?auto_52582 ) ) ( SURFACE-AT ?auto_52594 ?auto_52597 ) ( CLEAR ?auto_52594 ) ( IS-CRATE ?auto_52577 ) ( not ( = ?auto_52575 ?auto_52594 ) ) ( not ( = ?auto_52576 ?auto_52594 ) ) ( not ( = ?auto_52583 ?auto_52594 ) ) ( not ( = ?auto_52599 ?auto_52594 ) ) ( not ( = ?auto_52578 ?auto_52594 ) ) ( not ( = ?auto_52581 ?auto_52594 ) ) ( not ( = ?auto_52589 ?auto_52594 ) ) ( not ( = ?auto_52595 ?auto_52594 ) ) ( not ( = ?auto_52598 ?auto_52594 ) ) ( not ( = ?auto_52577 ?auto_52594 ) ) ( not ( = ?auto_52582 ?auto_52594 ) ) ( AVAILABLE ?auto_52596 ) ( TRUCK-AT ?auto_52590 ?auto_52592 ) ( not ( = ?auto_52592 ?auto_52597 ) ) ( not ( = ?auto_52600 ?auto_52592 ) ) ( not ( = ?auto_52587 ?auto_52592 ) ) ( not ( = ?auto_52588 ?auto_52592 ) ) ( not ( = ?auto_52593 ?auto_52592 ) ) ( not ( = ?auto_52591 ?auto_52592 ) ) ( HOIST-AT ?auto_52601 ?auto_52592 ) ( LIFTING ?auto_52601 ?auto_52577 ) ( not ( = ?auto_52596 ?auto_52601 ) ) ( not ( = ?auto_52579 ?auto_52601 ) ) ( not ( = ?auto_52580 ?auto_52601 ) ) ( not ( = ?auto_52585 ?auto_52601 ) ) ( not ( = ?auto_52584 ?auto_52601 ) ) ( not ( = ?auto_52586 ?auto_52601 ) ) )
    :subtasks
    ( ( !LOAD ?auto_52601 ?auto_52577 ?auto_52590 ?auto_52592 )
      ( MAKE-ON ?auto_52575 ?auto_52576 )
      ( MAKE-ON-VERIFY ?auto_52575 ?auto_52576 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52602 - SURFACE
      ?auto_52603 - SURFACE
    )
    :vars
    (
      ?auto_52615 - HOIST
      ?auto_52625 - PLACE
      ?auto_52624 - PLACE
      ?auto_52607 - HOIST
      ?auto_52622 - SURFACE
      ?auto_52627 - SURFACE
      ?auto_52611 - PLACE
      ?auto_52608 - HOIST
      ?auto_52609 - SURFACE
      ?auto_52610 - SURFACE
      ?auto_52612 - PLACE
      ?auto_52604 - HOIST
      ?auto_52613 - SURFACE
      ?auto_52619 - SURFACE
      ?auto_52621 - PLACE
      ?auto_52606 - HOIST
      ?auto_52626 - SURFACE
      ?auto_52616 - SURFACE
      ?auto_52617 - PLACE
      ?auto_52623 - HOIST
      ?auto_52605 - SURFACE
      ?auto_52614 - SURFACE
      ?auto_52620 - TRUCK
      ?auto_52628 - PLACE
      ?auto_52618 - HOIST
      ?auto_52629 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52615 ?auto_52625 ) ( IS-CRATE ?auto_52602 ) ( not ( = ?auto_52602 ?auto_52603 ) ) ( not ( = ?auto_52624 ?auto_52625 ) ) ( HOIST-AT ?auto_52607 ?auto_52624 ) ( not ( = ?auto_52615 ?auto_52607 ) ) ( AVAILABLE ?auto_52607 ) ( SURFACE-AT ?auto_52602 ?auto_52624 ) ( ON ?auto_52602 ?auto_52622 ) ( CLEAR ?auto_52602 ) ( not ( = ?auto_52602 ?auto_52622 ) ) ( not ( = ?auto_52603 ?auto_52622 ) ) ( IS-CRATE ?auto_52603 ) ( not ( = ?auto_52602 ?auto_52627 ) ) ( not ( = ?auto_52603 ?auto_52627 ) ) ( not ( = ?auto_52622 ?auto_52627 ) ) ( not ( = ?auto_52611 ?auto_52625 ) ) ( not ( = ?auto_52624 ?auto_52611 ) ) ( HOIST-AT ?auto_52608 ?auto_52611 ) ( not ( = ?auto_52615 ?auto_52608 ) ) ( not ( = ?auto_52607 ?auto_52608 ) ) ( AVAILABLE ?auto_52608 ) ( SURFACE-AT ?auto_52603 ?auto_52611 ) ( ON ?auto_52603 ?auto_52609 ) ( CLEAR ?auto_52603 ) ( not ( = ?auto_52602 ?auto_52609 ) ) ( not ( = ?auto_52603 ?auto_52609 ) ) ( not ( = ?auto_52622 ?auto_52609 ) ) ( not ( = ?auto_52627 ?auto_52609 ) ) ( IS-CRATE ?auto_52627 ) ( not ( = ?auto_52602 ?auto_52610 ) ) ( not ( = ?auto_52603 ?auto_52610 ) ) ( not ( = ?auto_52622 ?auto_52610 ) ) ( not ( = ?auto_52627 ?auto_52610 ) ) ( not ( = ?auto_52609 ?auto_52610 ) ) ( not ( = ?auto_52612 ?auto_52625 ) ) ( not ( = ?auto_52624 ?auto_52612 ) ) ( not ( = ?auto_52611 ?auto_52612 ) ) ( HOIST-AT ?auto_52604 ?auto_52612 ) ( not ( = ?auto_52615 ?auto_52604 ) ) ( not ( = ?auto_52607 ?auto_52604 ) ) ( not ( = ?auto_52608 ?auto_52604 ) ) ( AVAILABLE ?auto_52604 ) ( SURFACE-AT ?auto_52627 ?auto_52612 ) ( ON ?auto_52627 ?auto_52613 ) ( CLEAR ?auto_52627 ) ( not ( = ?auto_52602 ?auto_52613 ) ) ( not ( = ?auto_52603 ?auto_52613 ) ) ( not ( = ?auto_52622 ?auto_52613 ) ) ( not ( = ?auto_52627 ?auto_52613 ) ) ( not ( = ?auto_52609 ?auto_52613 ) ) ( not ( = ?auto_52610 ?auto_52613 ) ) ( IS-CRATE ?auto_52610 ) ( not ( = ?auto_52602 ?auto_52619 ) ) ( not ( = ?auto_52603 ?auto_52619 ) ) ( not ( = ?auto_52622 ?auto_52619 ) ) ( not ( = ?auto_52627 ?auto_52619 ) ) ( not ( = ?auto_52609 ?auto_52619 ) ) ( not ( = ?auto_52610 ?auto_52619 ) ) ( not ( = ?auto_52613 ?auto_52619 ) ) ( not ( = ?auto_52621 ?auto_52625 ) ) ( not ( = ?auto_52624 ?auto_52621 ) ) ( not ( = ?auto_52611 ?auto_52621 ) ) ( not ( = ?auto_52612 ?auto_52621 ) ) ( HOIST-AT ?auto_52606 ?auto_52621 ) ( not ( = ?auto_52615 ?auto_52606 ) ) ( not ( = ?auto_52607 ?auto_52606 ) ) ( not ( = ?auto_52608 ?auto_52606 ) ) ( not ( = ?auto_52604 ?auto_52606 ) ) ( AVAILABLE ?auto_52606 ) ( SURFACE-AT ?auto_52610 ?auto_52621 ) ( ON ?auto_52610 ?auto_52626 ) ( CLEAR ?auto_52610 ) ( not ( = ?auto_52602 ?auto_52626 ) ) ( not ( = ?auto_52603 ?auto_52626 ) ) ( not ( = ?auto_52622 ?auto_52626 ) ) ( not ( = ?auto_52627 ?auto_52626 ) ) ( not ( = ?auto_52609 ?auto_52626 ) ) ( not ( = ?auto_52610 ?auto_52626 ) ) ( not ( = ?auto_52613 ?auto_52626 ) ) ( not ( = ?auto_52619 ?auto_52626 ) ) ( IS-CRATE ?auto_52619 ) ( not ( = ?auto_52602 ?auto_52616 ) ) ( not ( = ?auto_52603 ?auto_52616 ) ) ( not ( = ?auto_52622 ?auto_52616 ) ) ( not ( = ?auto_52627 ?auto_52616 ) ) ( not ( = ?auto_52609 ?auto_52616 ) ) ( not ( = ?auto_52610 ?auto_52616 ) ) ( not ( = ?auto_52613 ?auto_52616 ) ) ( not ( = ?auto_52619 ?auto_52616 ) ) ( not ( = ?auto_52626 ?auto_52616 ) ) ( not ( = ?auto_52617 ?auto_52625 ) ) ( not ( = ?auto_52624 ?auto_52617 ) ) ( not ( = ?auto_52611 ?auto_52617 ) ) ( not ( = ?auto_52612 ?auto_52617 ) ) ( not ( = ?auto_52621 ?auto_52617 ) ) ( HOIST-AT ?auto_52623 ?auto_52617 ) ( not ( = ?auto_52615 ?auto_52623 ) ) ( not ( = ?auto_52607 ?auto_52623 ) ) ( not ( = ?auto_52608 ?auto_52623 ) ) ( not ( = ?auto_52604 ?auto_52623 ) ) ( not ( = ?auto_52606 ?auto_52623 ) ) ( AVAILABLE ?auto_52623 ) ( SURFACE-AT ?auto_52619 ?auto_52617 ) ( ON ?auto_52619 ?auto_52605 ) ( CLEAR ?auto_52619 ) ( not ( = ?auto_52602 ?auto_52605 ) ) ( not ( = ?auto_52603 ?auto_52605 ) ) ( not ( = ?auto_52622 ?auto_52605 ) ) ( not ( = ?auto_52627 ?auto_52605 ) ) ( not ( = ?auto_52609 ?auto_52605 ) ) ( not ( = ?auto_52610 ?auto_52605 ) ) ( not ( = ?auto_52613 ?auto_52605 ) ) ( not ( = ?auto_52619 ?auto_52605 ) ) ( not ( = ?auto_52626 ?auto_52605 ) ) ( not ( = ?auto_52616 ?auto_52605 ) ) ( SURFACE-AT ?auto_52614 ?auto_52625 ) ( CLEAR ?auto_52614 ) ( IS-CRATE ?auto_52616 ) ( not ( = ?auto_52602 ?auto_52614 ) ) ( not ( = ?auto_52603 ?auto_52614 ) ) ( not ( = ?auto_52622 ?auto_52614 ) ) ( not ( = ?auto_52627 ?auto_52614 ) ) ( not ( = ?auto_52609 ?auto_52614 ) ) ( not ( = ?auto_52610 ?auto_52614 ) ) ( not ( = ?auto_52613 ?auto_52614 ) ) ( not ( = ?auto_52619 ?auto_52614 ) ) ( not ( = ?auto_52626 ?auto_52614 ) ) ( not ( = ?auto_52616 ?auto_52614 ) ) ( not ( = ?auto_52605 ?auto_52614 ) ) ( AVAILABLE ?auto_52615 ) ( TRUCK-AT ?auto_52620 ?auto_52628 ) ( not ( = ?auto_52628 ?auto_52625 ) ) ( not ( = ?auto_52624 ?auto_52628 ) ) ( not ( = ?auto_52611 ?auto_52628 ) ) ( not ( = ?auto_52612 ?auto_52628 ) ) ( not ( = ?auto_52621 ?auto_52628 ) ) ( not ( = ?auto_52617 ?auto_52628 ) ) ( HOIST-AT ?auto_52618 ?auto_52628 ) ( not ( = ?auto_52615 ?auto_52618 ) ) ( not ( = ?auto_52607 ?auto_52618 ) ) ( not ( = ?auto_52608 ?auto_52618 ) ) ( not ( = ?auto_52604 ?auto_52618 ) ) ( not ( = ?auto_52606 ?auto_52618 ) ) ( not ( = ?auto_52623 ?auto_52618 ) ) ( AVAILABLE ?auto_52618 ) ( SURFACE-AT ?auto_52616 ?auto_52628 ) ( ON ?auto_52616 ?auto_52629 ) ( CLEAR ?auto_52616 ) ( not ( = ?auto_52602 ?auto_52629 ) ) ( not ( = ?auto_52603 ?auto_52629 ) ) ( not ( = ?auto_52622 ?auto_52629 ) ) ( not ( = ?auto_52627 ?auto_52629 ) ) ( not ( = ?auto_52609 ?auto_52629 ) ) ( not ( = ?auto_52610 ?auto_52629 ) ) ( not ( = ?auto_52613 ?auto_52629 ) ) ( not ( = ?auto_52619 ?auto_52629 ) ) ( not ( = ?auto_52626 ?auto_52629 ) ) ( not ( = ?auto_52616 ?auto_52629 ) ) ( not ( = ?auto_52605 ?auto_52629 ) ) ( not ( = ?auto_52614 ?auto_52629 ) ) )
    :subtasks
    ( ( !LIFT ?auto_52618 ?auto_52616 ?auto_52629 ?auto_52628 )
      ( MAKE-ON ?auto_52602 ?auto_52603 )
      ( MAKE-ON-VERIFY ?auto_52602 ?auto_52603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52630 - SURFACE
      ?auto_52631 - SURFACE
    )
    :vars
    (
      ?auto_52657 - HOIST
      ?auto_52655 - PLACE
      ?auto_52656 - PLACE
      ?auto_52638 - HOIST
      ?auto_52648 - SURFACE
      ?auto_52641 - SURFACE
      ?auto_52647 - PLACE
      ?auto_52637 - HOIST
      ?auto_52650 - SURFACE
      ?auto_52643 - SURFACE
      ?auto_52635 - PLACE
      ?auto_52653 - HOIST
      ?auto_52652 - SURFACE
      ?auto_52640 - SURFACE
      ?auto_52633 - PLACE
      ?auto_52636 - HOIST
      ?auto_52639 - SURFACE
      ?auto_52645 - SURFACE
      ?auto_52646 - PLACE
      ?auto_52649 - HOIST
      ?auto_52634 - SURFACE
      ?auto_52651 - SURFACE
      ?auto_52654 - PLACE
      ?auto_52642 - HOIST
      ?auto_52644 - SURFACE
      ?auto_52632 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52657 ?auto_52655 ) ( IS-CRATE ?auto_52630 ) ( not ( = ?auto_52630 ?auto_52631 ) ) ( not ( = ?auto_52656 ?auto_52655 ) ) ( HOIST-AT ?auto_52638 ?auto_52656 ) ( not ( = ?auto_52657 ?auto_52638 ) ) ( AVAILABLE ?auto_52638 ) ( SURFACE-AT ?auto_52630 ?auto_52656 ) ( ON ?auto_52630 ?auto_52648 ) ( CLEAR ?auto_52630 ) ( not ( = ?auto_52630 ?auto_52648 ) ) ( not ( = ?auto_52631 ?auto_52648 ) ) ( IS-CRATE ?auto_52631 ) ( not ( = ?auto_52630 ?auto_52641 ) ) ( not ( = ?auto_52631 ?auto_52641 ) ) ( not ( = ?auto_52648 ?auto_52641 ) ) ( not ( = ?auto_52647 ?auto_52655 ) ) ( not ( = ?auto_52656 ?auto_52647 ) ) ( HOIST-AT ?auto_52637 ?auto_52647 ) ( not ( = ?auto_52657 ?auto_52637 ) ) ( not ( = ?auto_52638 ?auto_52637 ) ) ( AVAILABLE ?auto_52637 ) ( SURFACE-AT ?auto_52631 ?auto_52647 ) ( ON ?auto_52631 ?auto_52650 ) ( CLEAR ?auto_52631 ) ( not ( = ?auto_52630 ?auto_52650 ) ) ( not ( = ?auto_52631 ?auto_52650 ) ) ( not ( = ?auto_52648 ?auto_52650 ) ) ( not ( = ?auto_52641 ?auto_52650 ) ) ( IS-CRATE ?auto_52641 ) ( not ( = ?auto_52630 ?auto_52643 ) ) ( not ( = ?auto_52631 ?auto_52643 ) ) ( not ( = ?auto_52648 ?auto_52643 ) ) ( not ( = ?auto_52641 ?auto_52643 ) ) ( not ( = ?auto_52650 ?auto_52643 ) ) ( not ( = ?auto_52635 ?auto_52655 ) ) ( not ( = ?auto_52656 ?auto_52635 ) ) ( not ( = ?auto_52647 ?auto_52635 ) ) ( HOIST-AT ?auto_52653 ?auto_52635 ) ( not ( = ?auto_52657 ?auto_52653 ) ) ( not ( = ?auto_52638 ?auto_52653 ) ) ( not ( = ?auto_52637 ?auto_52653 ) ) ( AVAILABLE ?auto_52653 ) ( SURFACE-AT ?auto_52641 ?auto_52635 ) ( ON ?auto_52641 ?auto_52652 ) ( CLEAR ?auto_52641 ) ( not ( = ?auto_52630 ?auto_52652 ) ) ( not ( = ?auto_52631 ?auto_52652 ) ) ( not ( = ?auto_52648 ?auto_52652 ) ) ( not ( = ?auto_52641 ?auto_52652 ) ) ( not ( = ?auto_52650 ?auto_52652 ) ) ( not ( = ?auto_52643 ?auto_52652 ) ) ( IS-CRATE ?auto_52643 ) ( not ( = ?auto_52630 ?auto_52640 ) ) ( not ( = ?auto_52631 ?auto_52640 ) ) ( not ( = ?auto_52648 ?auto_52640 ) ) ( not ( = ?auto_52641 ?auto_52640 ) ) ( not ( = ?auto_52650 ?auto_52640 ) ) ( not ( = ?auto_52643 ?auto_52640 ) ) ( not ( = ?auto_52652 ?auto_52640 ) ) ( not ( = ?auto_52633 ?auto_52655 ) ) ( not ( = ?auto_52656 ?auto_52633 ) ) ( not ( = ?auto_52647 ?auto_52633 ) ) ( not ( = ?auto_52635 ?auto_52633 ) ) ( HOIST-AT ?auto_52636 ?auto_52633 ) ( not ( = ?auto_52657 ?auto_52636 ) ) ( not ( = ?auto_52638 ?auto_52636 ) ) ( not ( = ?auto_52637 ?auto_52636 ) ) ( not ( = ?auto_52653 ?auto_52636 ) ) ( AVAILABLE ?auto_52636 ) ( SURFACE-AT ?auto_52643 ?auto_52633 ) ( ON ?auto_52643 ?auto_52639 ) ( CLEAR ?auto_52643 ) ( not ( = ?auto_52630 ?auto_52639 ) ) ( not ( = ?auto_52631 ?auto_52639 ) ) ( not ( = ?auto_52648 ?auto_52639 ) ) ( not ( = ?auto_52641 ?auto_52639 ) ) ( not ( = ?auto_52650 ?auto_52639 ) ) ( not ( = ?auto_52643 ?auto_52639 ) ) ( not ( = ?auto_52652 ?auto_52639 ) ) ( not ( = ?auto_52640 ?auto_52639 ) ) ( IS-CRATE ?auto_52640 ) ( not ( = ?auto_52630 ?auto_52645 ) ) ( not ( = ?auto_52631 ?auto_52645 ) ) ( not ( = ?auto_52648 ?auto_52645 ) ) ( not ( = ?auto_52641 ?auto_52645 ) ) ( not ( = ?auto_52650 ?auto_52645 ) ) ( not ( = ?auto_52643 ?auto_52645 ) ) ( not ( = ?auto_52652 ?auto_52645 ) ) ( not ( = ?auto_52640 ?auto_52645 ) ) ( not ( = ?auto_52639 ?auto_52645 ) ) ( not ( = ?auto_52646 ?auto_52655 ) ) ( not ( = ?auto_52656 ?auto_52646 ) ) ( not ( = ?auto_52647 ?auto_52646 ) ) ( not ( = ?auto_52635 ?auto_52646 ) ) ( not ( = ?auto_52633 ?auto_52646 ) ) ( HOIST-AT ?auto_52649 ?auto_52646 ) ( not ( = ?auto_52657 ?auto_52649 ) ) ( not ( = ?auto_52638 ?auto_52649 ) ) ( not ( = ?auto_52637 ?auto_52649 ) ) ( not ( = ?auto_52653 ?auto_52649 ) ) ( not ( = ?auto_52636 ?auto_52649 ) ) ( AVAILABLE ?auto_52649 ) ( SURFACE-AT ?auto_52640 ?auto_52646 ) ( ON ?auto_52640 ?auto_52634 ) ( CLEAR ?auto_52640 ) ( not ( = ?auto_52630 ?auto_52634 ) ) ( not ( = ?auto_52631 ?auto_52634 ) ) ( not ( = ?auto_52648 ?auto_52634 ) ) ( not ( = ?auto_52641 ?auto_52634 ) ) ( not ( = ?auto_52650 ?auto_52634 ) ) ( not ( = ?auto_52643 ?auto_52634 ) ) ( not ( = ?auto_52652 ?auto_52634 ) ) ( not ( = ?auto_52640 ?auto_52634 ) ) ( not ( = ?auto_52639 ?auto_52634 ) ) ( not ( = ?auto_52645 ?auto_52634 ) ) ( SURFACE-AT ?auto_52651 ?auto_52655 ) ( CLEAR ?auto_52651 ) ( IS-CRATE ?auto_52645 ) ( not ( = ?auto_52630 ?auto_52651 ) ) ( not ( = ?auto_52631 ?auto_52651 ) ) ( not ( = ?auto_52648 ?auto_52651 ) ) ( not ( = ?auto_52641 ?auto_52651 ) ) ( not ( = ?auto_52650 ?auto_52651 ) ) ( not ( = ?auto_52643 ?auto_52651 ) ) ( not ( = ?auto_52652 ?auto_52651 ) ) ( not ( = ?auto_52640 ?auto_52651 ) ) ( not ( = ?auto_52639 ?auto_52651 ) ) ( not ( = ?auto_52645 ?auto_52651 ) ) ( not ( = ?auto_52634 ?auto_52651 ) ) ( AVAILABLE ?auto_52657 ) ( not ( = ?auto_52654 ?auto_52655 ) ) ( not ( = ?auto_52656 ?auto_52654 ) ) ( not ( = ?auto_52647 ?auto_52654 ) ) ( not ( = ?auto_52635 ?auto_52654 ) ) ( not ( = ?auto_52633 ?auto_52654 ) ) ( not ( = ?auto_52646 ?auto_52654 ) ) ( HOIST-AT ?auto_52642 ?auto_52654 ) ( not ( = ?auto_52657 ?auto_52642 ) ) ( not ( = ?auto_52638 ?auto_52642 ) ) ( not ( = ?auto_52637 ?auto_52642 ) ) ( not ( = ?auto_52653 ?auto_52642 ) ) ( not ( = ?auto_52636 ?auto_52642 ) ) ( not ( = ?auto_52649 ?auto_52642 ) ) ( AVAILABLE ?auto_52642 ) ( SURFACE-AT ?auto_52645 ?auto_52654 ) ( ON ?auto_52645 ?auto_52644 ) ( CLEAR ?auto_52645 ) ( not ( = ?auto_52630 ?auto_52644 ) ) ( not ( = ?auto_52631 ?auto_52644 ) ) ( not ( = ?auto_52648 ?auto_52644 ) ) ( not ( = ?auto_52641 ?auto_52644 ) ) ( not ( = ?auto_52650 ?auto_52644 ) ) ( not ( = ?auto_52643 ?auto_52644 ) ) ( not ( = ?auto_52652 ?auto_52644 ) ) ( not ( = ?auto_52640 ?auto_52644 ) ) ( not ( = ?auto_52639 ?auto_52644 ) ) ( not ( = ?auto_52645 ?auto_52644 ) ) ( not ( = ?auto_52634 ?auto_52644 ) ) ( not ( = ?auto_52651 ?auto_52644 ) ) ( TRUCK-AT ?auto_52632 ?auto_52655 ) )
    :subtasks
    ( ( !DRIVE ?auto_52632 ?auto_52655 ?auto_52654 )
      ( MAKE-ON ?auto_52630 ?auto_52631 )
      ( MAKE-ON-VERIFY ?auto_52630 ?auto_52631 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52658 - SURFACE
      ?auto_52659 - SURFACE
    )
    :vars
    (
      ?auto_52675 - HOIST
      ?auto_52680 - PLACE
      ?auto_52671 - PLACE
      ?auto_52660 - HOIST
      ?auto_52681 - SURFACE
      ?auto_52665 - SURFACE
      ?auto_52677 - PLACE
      ?auto_52674 - HOIST
      ?auto_52683 - SURFACE
      ?auto_52673 - SURFACE
      ?auto_52661 - PLACE
      ?auto_52679 - HOIST
      ?auto_52685 - SURFACE
      ?auto_52676 - SURFACE
      ?auto_52669 - PLACE
      ?auto_52663 - HOIST
      ?auto_52664 - SURFACE
      ?auto_52672 - SURFACE
      ?auto_52668 - PLACE
      ?auto_52682 - HOIST
      ?auto_52670 - SURFACE
      ?auto_52684 - SURFACE
      ?auto_52678 - PLACE
      ?auto_52662 - HOIST
      ?auto_52667 - SURFACE
      ?auto_52666 - TRUCK
      ?auto_52686 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52675 ?auto_52680 ) ( IS-CRATE ?auto_52658 ) ( not ( = ?auto_52658 ?auto_52659 ) ) ( not ( = ?auto_52671 ?auto_52680 ) ) ( HOIST-AT ?auto_52660 ?auto_52671 ) ( not ( = ?auto_52675 ?auto_52660 ) ) ( AVAILABLE ?auto_52660 ) ( SURFACE-AT ?auto_52658 ?auto_52671 ) ( ON ?auto_52658 ?auto_52681 ) ( CLEAR ?auto_52658 ) ( not ( = ?auto_52658 ?auto_52681 ) ) ( not ( = ?auto_52659 ?auto_52681 ) ) ( IS-CRATE ?auto_52659 ) ( not ( = ?auto_52658 ?auto_52665 ) ) ( not ( = ?auto_52659 ?auto_52665 ) ) ( not ( = ?auto_52681 ?auto_52665 ) ) ( not ( = ?auto_52677 ?auto_52680 ) ) ( not ( = ?auto_52671 ?auto_52677 ) ) ( HOIST-AT ?auto_52674 ?auto_52677 ) ( not ( = ?auto_52675 ?auto_52674 ) ) ( not ( = ?auto_52660 ?auto_52674 ) ) ( AVAILABLE ?auto_52674 ) ( SURFACE-AT ?auto_52659 ?auto_52677 ) ( ON ?auto_52659 ?auto_52683 ) ( CLEAR ?auto_52659 ) ( not ( = ?auto_52658 ?auto_52683 ) ) ( not ( = ?auto_52659 ?auto_52683 ) ) ( not ( = ?auto_52681 ?auto_52683 ) ) ( not ( = ?auto_52665 ?auto_52683 ) ) ( IS-CRATE ?auto_52665 ) ( not ( = ?auto_52658 ?auto_52673 ) ) ( not ( = ?auto_52659 ?auto_52673 ) ) ( not ( = ?auto_52681 ?auto_52673 ) ) ( not ( = ?auto_52665 ?auto_52673 ) ) ( not ( = ?auto_52683 ?auto_52673 ) ) ( not ( = ?auto_52661 ?auto_52680 ) ) ( not ( = ?auto_52671 ?auto_52661 ) ) ( not ( = ?auto_52677 ?auto_52661 ) ) ( HOIST-AT ?auto_52679 ?auto_52661 ) ( not ( = ?auto_52675 ?auto_52679 ) ) ( not ( = ?auto_52660 ?auto_52679 ) ) ( not ( = ?auto_52674 ?auto_52679 ) ) ( AVAILABLE ?auto_52679 ) ( SURFACE-AT ?auto_52665 ?auto_52661 ) ( ON ?auto_52665 ?auto_52685 ) ( CLEAR ?auto_52665 ) ( not ( = ?auto_52658 ?auto_52685 ) ) ( not ( = ?auto_52659 ?auto_52685 ) ) ( not ( = ?auto_52681 ?auto_52685 ) ) ( not ( = ?auto_52665 ?auto_52685 ) ) ( not ( = ?auto_52683 ?auto_52685 ) ) ( not ( = ?auto_52673 ?auto_52685 ) ) ( IS-CRATE ?auto_52673 ) ( not ( = ?auto_52658 ?auto_52676 ) ) ( not ( = ?auto_52659 ?auto_52676 ) ) ( not ( = ?auto_52681 ?auto_52676 ) ) ( not ( = ?auto_52665 ?auto_52676 ) ) ( not ( = ?auto_52683 ?auto_52676 ) ) ( not ( = ?auto_52673 ?auto_52676 ) ) ( not ( = ?auto_52685 ?auto_52676 ) ) ( not ( = ?auto_52669 ?auto_52680 ) ) ( not ( = ?auto_52671 ?auto_52669 ) ) ( not ( = ?auto_52677 ?auto_52669 ) ) ( not ( = ?auto_52661 ?auto_52669 ) ) ( HOIST-AT ?auto_52663 ?auto_52669 ) ( not ( = ?auto_52675 ?auto_52663 ) ) ( not ( = ?auto_52660 ?auto_52663 ) ) ( not ( = ?auto_52674 ?auto_52663 ) ) ( not ( = ?auto_52679 ?auto_52663 ) ) ( AVAILABLE ?auto_52663 ) ( SURFACE-AT ?auto_52673 ?auto_52669 ) ( ON ?auto_52673 ?auto_52664 ) ( CLEAR ?auto_52673 ) ( not ( = ?auto_52658 ?auto_52664 ) ) ( not ( = ?auto_52659 ?auto_52664 ) ) ( not ( = ?auto_52681 ?auto_52664 ) ) ( not ( = ?auto_52665 ?auto_52664 ) ) ( not ( = ?auto_52683 ?auto_52664 ) ) ( not ( = ?auto_52673 ?auto_52664 ) ) ( not ( = ?auto_52685 ?auto_52664 ) ) ( not ( = ?auto_52676 ?auto_52664 ) ) ( IS-CRATE ?auto_52676 ) ( not ( = ?auto_52658 ?auto_52672 ) ) ( not ( = ?auto_52659 ?auto_52672 ) ) ( not ( = ?auto_52681 ?auto_52672 ) ) ( not ( = ?auto_52665 ?auto_52672 ) ) ( not ( = ?auto_52683 ?auto_52672 ) ) ( not ( = ?auto_52673 ?auto_52672 ) ) ( not ( = ?auto_52685 ?auto_52672 ) ) ( not ( = ?auto_52676 ?auto_52672 ) ) ( not ( = ?auto_52664 ?auto_52672 ) ) ( not ( = ?auto_52668 ?auto_52680 ) ) ( not ( = ?auto_52671 ?auto_52668 ) ) ( not ( = ?auto_52677 ?auto_52668 ) ) ( not ( = ?auto_52661 ?auto_52668 ) ) ( not ( = ?auto_52669 ?auto_52668 ) ) ( HOIST-AT ?auto_52682 ?auto_52668 ) ( not ( = ?auto_52675 ?auto_52682 ) ) ( not ( = ?auto_52660 ?auto_52682 ) ) ( not ( = ?auto_52674 ?auto_52682 ) ) ( not ( = ?auto_52679 ?auto_52682 ) ) ( not ( = ?auto_52663 ?auto_52682 ) ) ( AVAILABLE ?auto_52682 ) ( SURFACE-AT ?auto_52676 ?auto_52668 ) ( ON ?auto_52676 ?auto_52670 ) ( CLEAR ?auto_52676 ) ( not ( = ?auto_52658 ?auto_52670 ) ) ( not ( = ?auto_52659 ?auto_52670 ) ) ( not ( = ?auto_52681 ?auto_52670 ) ) ( not ( = ?auto_52665 ?auto_52670 ) ) ( not ( = ?auto_52683 ?auto_52670 ) ) ( not ( = ?auto_52673 ?auto_52670 ) ) ( not ( = ?auto_52685 ?auto_52670 ) ) ( not ( = ?auto_52676 ?auto_52670 ) ) ( not ( = ?auto_52664 ?auto_52670 ) ) ( not ( = ?auto_52672 ?auto_52670 ) ) ( IS-CRATE ?auto_52672 ) ( not ( = ?auto_52658 ?auto_52684 ) ) ( not ( = ?auto_52659 ?auto_52684 ) ) ( not ( = ?auto_52681 ?auto_52684 ) ) ( not ( = ?auto_52665 ?auto_52684 ) ) ( not ( = ?auto_52683 ?auto_52684 ) ) ( not ( = ?auto_52673 ?auto_52684 ) ) ( not ( = ?auto_52685 ?auto_52684 ) ) ( not ( = ?auto_52676 ?auto_52684 ) ) ( not ( = ?auto_52664 ?auto_52684 ) ) ( not ( = ?auto_52672 ?auto_52684 ) ) ( not ( = ?auto_52670 ?auto_52684 ) ) ( not ( = ?auto_52678 ?auto_52680 ) ) ( not ( = ?auto_52671 ?auto_52678 ) ) ( not ( = ?auto_52677 ?auto_52678 ) ) ( not ( = ?auto_52661 ?auto_52678 ) ) ( not ( = ?auto_52669 ?auto_52678 ) ) ( not ( = ?auto_52668 ?auto_52678 ) ) ( HOIST-AT ?auto_52662 ?auto_52678 ) ( not ( = ?auto_52675 ?auto_52662 ) ) ( not ( = ?auto_52660 ?auto_52662 ) ) ( not ( = ?auto_52674 ?auto_52662 ) ) ( not ( = ?auto_52679 ?auto_52662 ) ) ( not ( = ?auto_52663 ?auto_52662 ) ) ( not ( = ?auto_52682 ?auto_52662 ) ) ( AVAILABLE ?auto_52662 ) ( SURFACE-AT ?auto_52672 ?auto_52678 ) ( ON ?auto_52672 ?auto_52667 ) ( CLEAR ?auto_52672 ) ( not ( = ?auto_52658 ?auto_52667 ) ) ( not ( = ?auto_52659 ?auto_52667 ) ) ( not ( = ?auto_52681 ?auto_52667 ) ) ( not ( = ?auto_52665 ?auto_52667 ) ) ( not ( = ?auto_52683 ?auto_52667 ) ) ( not ( = ?auto_52673 ?auto_52667 ) ) ( not ( = ?auto_52685 ?auto_52667 ) ) ( not ( = ?auto_52676 ?auto_52667 ) ) ( not ( = ?auto_52664 ?auto_52667 ) ) ( not ( = ?auto_52672 ?auto_52667 ) ) ( not ( = ?auto_52670 ?auto_52667 ) ) ( not ( = ?auto_52684 ?auto_52667 ) ) ( TRUCK-AT ?auto_52666 ?auto_52680 ) ( SURFACE-AT ?auto_52686 ?auto_52680 ) ( CLEAR ?auto_52686 ) ( LIFTING ?auto_52675 ?auto_52684 ) ( IS-CRATE ?auto_52684 ) ( not ( = ?auto_52658 ?auto_52686 ) ) ( not ( = ?auto_52659 ?auto_52686 ) ) ( not ( = ?auto_52681 ?auto_52686 ) ) ( not ( = ?auto_52665 ?auto_52686 ) ) ( not ( = ?auto_52683 ?auto_52686 ) ) ( not ( = ?auto_52673 ?auto_52686 ) ) ( not ( = ?auto_52685 ?auto_52686 ) ) ( not ( = ?auto_52676 ?auto_52686 ) ) ( not ( = ?auto_52664 ?auto_52686 ) ) ( not ( = ?auto_52672 ?auto_52686 ) ) ( not ( = ?auto_52670 ?auto_52686 ) ) ( not ( = ?auto_52684 ?auto_52686 ) ) ( not ( = ?auto_52667 ?auto_52686 ) ) )
    :subtasks
    ( ( !DROP ?auto_52675 ?auto_52684 ?auto_52686 ?auto_52680 )
      ( MAKE-ON ?auto_52658 ?auto_52659 )
      ( MAKE-ON-VERIFY ?auto_52658 ?auto_52659 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52687 - SURFACE
      ?auto_52688 - SURFACE
    )
    :vars
    (
      ?auto_52699 - HOIST
      ?auto_52696 - PLACE
      ?auto_52712 - PLACE
      ?auto_52694 - HOIST
      ?auto_52697 - SURFACE
      ?auto_52690 - SURFACE
      ?auto_52704 - PLACE
      ?auto_52711 - HOIST
      ?auto_52702 - SURFACE
      ?auto_52713 - SURFACE
      ?auto_52710 - PLACE
      ?auto_52695 - HOIST
      ?auto_52701 - SURFACE
      ?auto_52703 - SURFACE
      ?auto_52715 - PLACE
      ?auto_52692 - HOIST
      ?auto_52709 - SURFACE
      ?auto_52708 - SURFACE
      ?auto_52693 - PLACE
      ?auto_52698 - HOIST
      ?auto_52691 - SURFACE
      ?auto_52706 - SURFACE
      ?auto_52705 - PLACE
      ?auto_52689 - HOIST
      ?auto_52714 - SURFACE
      ?auto_52700 - TRUCK
      ?auto_52707 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52699 ?auto_52696 ) ( IS-CRATE ?auto_52687 ) ( not ( = ?auto_52687 ?auto_52688 ) ) ( not ( = ?auto_52712 ?auto_52696 ) ) ( HOIST-AT ?auto_52694 ?auto_52712 ) ( not ( = ?auto_52699 ?auto_52694 ) ) ( AVAILABLE ?auto_52694 ) ( SURFACE-AT ?auto_52687 ?auto_52712 ) ( ON ?auto_52687 ?auto_52697 ) ( CLEAR ?auto_52687 ) ( not ( = ?auto_52687 ?auto_52697 ) ) ( not ( = ?auto_52688 ?auto_52697 ) ) ( IS-CRATE ?auto_52688 ) ( not ( = ?auto_52687 ?auto_52690 ) ) ( not ( = ?auto_52688 ?auto_52690 ) ) ( not ( = ?auto_52697 ?auto_52690 ) ) ( not ( = ?auto_52704 ?auto_52696 ) ) ( not ( = ?auto_52712 ?auto_52704 ) ) ( HOIST-AT ?auto_52711 ?auto_52704 ) ( not ( = ?auto_52699 ?auto_52711 ) ) ( not ( = ?auto_52694 ?auto_52711 ) ) ( AVAILABLE ?auto_52711 ) ( SURFACE-AT ?auto_52688 ?auto_52704 ) ( ON ?auto_52688 ?auto_52702 ) ( CLEAR ?auto_52688 ) ( not ( = ?auto_52687 ?auto_52702 ) ) ( not ( = ?auto_52688 ?auto_52702 ) ) ( not ( = ?auto_52697 ?auto_52702 ) ) ( not ( = ?auto_52690 ?auto_52702 ) ) ( IS-CRATE ?auto_52690 ) ( not ( = ?auto_52687 ?auto_52713 ) ) ( not ( = ?auto_52688 ?auto_52713 ) ) ( not ( = ?auto_52697 ?auto_52713 ) ) ( not ( = ?auto_52690 ?auto_52713 ) ) ( not ( = ?auto_52702 ?auto_52713 ) ) ( not ( = ?auto_52710 ?auto_52696 ) ) ( not ( = ?auto_52712 ?auto_52710 ) ) ( not ( = ?auto_52704 ?auto_52710 ) ) ( HOIST-AT ?auto_52695 ?auto_52710 ) ( not ( = ?auto_52699 ?auto_52695 ) ) ( not ( = ?auto_52694 ?auto_52695 ) ) ( not ( = ?auto_52711 ?auto_52695 ) ) ( AVAILABLE ?auto_52695 ) ( SURFACE-AT ?auto_52690 ?auto_52710 ) ( ON ?auto_52690 ?auto_52701 ) ( CLEAR ?auto_52690 ) ( not ( = ?auto_52687 ?auto_52701 ) ) ( not ( = ?auto_52688 ?auto_52701 ) ) ( not ( = ?auto_52697 ?auto_52701 ) ) ( not ( = ?auto_52690 ?auto_52701 ) ) ( not ( = ?auto_52702 ?auto_52701 ) ) ( not ( = ?auto_52713 ?auto_52701 ) ) ( IS-CRATE ?auto_52713 ) ( not ( = ?auto_52687 ?auto_52703 ) ) ( not ( = ?auto_52688 ?auto_52703 ) ) ( not ( = ?auto_52697 ?auto_52703 ) ) ( not ( = ?auto_52690 ?auto_52703 ) ) ( not ( = ?auto_52702 ?auto_52703 ) ) ( not ( = ?auto_52713 ?auto_52703 ) ) ( not ( = ?auto_52701 ?auto_52703 ) ) ( not ( = ?auto_52715 ?auto_52696 ) ) ( not ( = ?auto_52712 ?auto_52715 ) ) ( not ( = ?auto_52704 ?auto_52715 ) ) ( not ( = ?auto_52710 ?auto_52715 ) ) ( HOIST-AT ?auto_52692 ?auto_52715 ) ( not ( = ?auto_52699 ?auto_52692 ) ) ( not ( = ?auto_52694 ?auto_52692 ) ) ( not ( = ?auto_52711 ?auto_52692 ) ) ( not ( = ?auto_52695 ?auto_52692 ) ) ( AVAILABLE ?auto_52692 ) ( SURFACE-AT ?auto_52713 ?auto_52715 ) ( ON ?auto_52713 ?auto_52709 ) ( CLEAR ?auto_52713 ) ( not ( = ?auto_52687 ?auto_52709 ) ) ( not ( = ?auto_52688 ?auto_52709 ) ) ( not ( = ?auto_52697 ?auto_52709 ) ) ( not ( = ?auto_52690 ?auto_52709 ) ) ( not ( = ?auto_52702 ?auto_52709 ) ) ( not ( = ?auto_52713 ?auto_52709 ) ) ( not ( = ?auto_52701 ?auto_52709 ) ) ( not ( = ?auto_52703 ?auto_52709 ) ) ( IS-CRATE ?auto_52703 ) ( not ( = ?auto_52687 ?auto_52708 ) ) ( not ( = ?auto_52688 ?auto_52708 ) ) ( not ( = ?auto_52697 ?auto_52708 ) ) ( not ( = ?auto_52690 ?auto_52708 ) ) ( not ( = ?auto_52702 ?auto_52708 ) ) ( not ( = ?auto_52713 ?auto_52708 ) ) ( not ( = ?auto_52701 ?auto_52708 ) ) ( not ( = ?auto_52703 ?auto_52708 ) ) ( not ( = ?auto_52709 ?auto_52708 ) ) ( not ( = ?auto_52693 ?auto_52696 ) ) ( not ( = ?auto_52712 ?auto_52693 ) ) ( not ( = ?auto_52704 ?auto_52693 ) ) ( not ( = ?auto_52710 ?auto_52693 ) ) ( not ( = ?auto_52715 ?auto_52693 ) ) ( HOIST-AT ?auto_52698 ?auto_52693 ) ( not ( = ?auto_52699 ?auto_52698 ) ) ( not ( = ?auto_52694 ?auto_52698 ) ) ( not ( = ?auto_52711 ?auto_52698 ) ) ( not ( = ?auto_52695 ?auto_52698 ) ) ( not ( = ?auto_52692 ?auto_52698 ) ) ( AVAILABLE ?auto_52698 ) ( SURFACE-AT ?auto_52703 ?auto_52693 ) ( ON ?auto_52703 ?auto_52691 ) ( CLEAR ?auto_52703 ) ( not ( = ?auto_52687 ?auto_52691 ) ) ( not ( = ?auto_52688 ?auto_52691 ) ) ( not ( = ?auto_52697 ?auto_52691 ) ) ( not ( = ?auto_52690 ?auto_52691 ) ) ( not ( = ?auto_52702 ?auto_52691 ) ) ( not ( = ?auto_52713 ?auto_52691 ) ) ( not ( = ?auto_52701 ?auto_52691 ) ) ( not ( = ?auto_52703 ?auto_52691 ) ) ( not ( = ?auto_52709 ?auto_52691 ) ) ( not ( = ?auto_52708 ?auto_52691 ) ) ( IS-CRATE ?auto_52708 ) ( not ( = ?auto_52687 ?auto_52706 ) ) ( not ( = ?auto_52688 ?auto_52706 ) ) ( not ( = ?auto_52697 ?auto_52706 ) ) ( not ( = ?auto_52690 ?auto_52706 ) ) ( not ( = ?auto_52702 ?auto_52706 ) ) ( not ( = ?auto_52713 ?auto_52706 ) ) ( not ( = ?auto_52701 ?auto_52706 ) ) ( not ( = ?auto_52703 ?auto_52706 ) ) ( not ( = ?auto_52709 ?auto_52706 ) ) ( not ( = ?auto_52708 ?auto_52706 ) ) ( not ( = ?auto_52691 ?auto_52706 ) ) ( not ( = ?auto_52705 ?auto_52696 ) ) ( not ( = ?auto_52712 ?auto_52705 ) ) ( not ( = ?auto_52704 ?auto_52705 ) ) ( not ( = ?auto_52710 ?auto_52705 ) ) ( not ( = ?auto_52715 ?auto_52705 ) ) ( not ( = ?auto_52693 ?auto_52705 ) ) ( HOIST-AT ?auto_52689 ?auto_52705 ) ( not ( = ?auto_52699 ?auto_52689 ) ) ( not ( = ?auto_52694 ?auto_52689 ) ) ( not ( = ?auto_52711 ?auto_52689 ) ) ( not ( = ?auto_52695 ?auto_52689 ) ) ( not ( = ?auto_52692 ?auto_52689 ) ) ( not ( = ?auto_52698 ?auto_52689 ) ) ( AVAILABLE ?auto_52689 ) ( SURFACE-AT ?auto_52708 ?auto_52705 ) ( ON ?auto_52708 ?auto_52714 ) ( CLEAR ?auto_52708 ) ( not ( = ?auto_52687 ?auto_52714 ) ) ( not ( = ?auto_52688 ?auto_52714 ) ) ( not ( = ?auto_52697 ?auto_52714 ) ) ( not ( = ?auto_52690 ?auto_52714 ) ) ( not ( = ?auto_52702 ?auto_52714 ) ) ( not ( = ?auto_52713 ?auto_52714 ) ) ( not ( = ?auto_52701 ?auto_52714 ) ) ( not ( = ?auto_52703 ?auto_52714 ) ) ( not ( = ?auto_52709 ?auto_52714 ) ) ( not ( = ?auto_52708 ?auto_52714 ) ) ( not ( = ?auto_52691 ?auto_52714 ) ) ( not ( = ?auto_52706 ?auto_52714 ) ) ( TRUCK-AT ?auto_52700 ?auto_52696 ) ( SURFACE-AT ?auto_52707 ?auto_52696 ) ( CLEAR ?auto_52707 ) ( IS-CRATE ?auto_52706 ) ( not ( = ?auto_52687 ?auto_52707 ) ) ( not ( = ?auto_52688 ?auto_52707 ) ) ( not ( = ?auto_52697 ?auto_52707 ) ) ( not ( = ?auto_52690 ?auto_52707 ) ) ( not ( = ?auto_52702 ?auto_52707 ) ) ( not ( = ?auto_52713 ?auto_52707 ) ) ( not ( = ?auto_52701 ?auto_52707 ) ) ( not ( = ?auto_52703 ?auto_52707 ) ) ( not ( = ?auto_52709 ?auto_52707 ) ) ( not ( = ?auto_52708 ?auto_52707 ) ) ( not ( = ?auto_52691 ?auto_52707 ) ) ( not ( = ?auto_52706 ?auto_52707 ) ) ( not ( = ?auto_52714 ?auto_52707 ) ) ( AVAILABLE ?auto_52699 ) ( IN ?auto_52706 ?auto_52700 ) )
    :subtasks
    ( ( !UNLOAD ?auto_52699 ?auto_52706 ?auto_52700 ?auto_52696 )
      ( MAKE-ON ?auto_52687 ?auto_52688 )
      ( MAKE-ON-VERIFY ?auto_52687 ?auto_52688 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52716 - SURFACE
      ?auto_52717 - SURFACE
    )
    :vars
    (
      ?auto_52723 - HOIST
      ?auto_52730 - PLACE
      ?auto_52732 - PLACE
      ?auto_52729 - HOIST
      ?auto_52726 - SURFACE
      ?auto_52731 - SURFACE
      ?auto_52724 - PLACE
      ?auto_52744 - HOIST
      ?auto_52739 - SURFACE
      ?auto_52719 - SURFACE
      ?auto_52743 - PLACE
      ?auto_52722 - HOIST
      ?auto_52728 - SURFACE
      ?auto_52718 - SURFACE
      ?auto_52737 - PLACE
      ?auto_52727 - HOIST
      ?auto_52742 - SURFACE
      ?auto_52741 - SURFACE
      ?auto_52725 - PLACE
      ?auto_52736 - HOIST
      ?auto_52720 - SURFACE
      ?auto_52734 - SURFACE
      ?auto_52733 - PLACE
      ?auto_52735 - HOIST
      ?auto_52738 - SURFACE
      ?auto_52740 - SURFACE
      ?auto_52721 - TRUCK
      ?auto_52745 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52723 ?auto_52730 ) ( IS-CRATE ?auto_52716 ) ( not ( = ?auto_52716 ?auto_52717 ) ) ( not ( = ?auto_52732 ?auto_52730 ) ) ( HOIST-AT ?auto_52729 ?auto_52732 ) ( not ( = ?auto_52723 ?auto_52729 ) ) ( AVAILABLE ?auto_52729 ) ( SURFACE-AT ?auto_52716 ?auto_52732 ) ( ON ?auto_52716 ?auto_52726 ) ( CLEAR ?auto_52716 ) ( not ( = ?auto_52716 ?auto_52726 ) ) ( not ( = ?auto_52717 ?auto_52726 ) ) ( IS-CRATE ?auto_52717 ) ( not ( = ?auto_52716 ?auto_52731 ) ) ( not ( = ?auto_52717 ?auto_52731 ) ) ( not ( = ?auto_52726 ?auto_52731 ) ) ( not ( = ?auto_52724 ?auto_52730 ) ) ( not ( = ?auto_52732 ?auto_52724 ) ) ( HOIST-AT ?auto_52744 ?auto_52724 ) ( not ( = ?auto_52723 ?auto_52744 ) ) ( not ( = ?auto_52729 ?auto_52744 ) ) ( AVAILABLE ?auto_52744 ) ( SURFACE-AT ?auto_52717 ?auto_52724 ) ( ON ?auto_52717 ?auto_52739 ) ( CLEAR ?auto_52717 ) ( not ( = ?auto_52716 ?auto_52739 ) ) ( not ( = ?auto_52717 ?auto_52739 ) ) ( not ( = ?auto_52726 ?auto_52739 ) ) ( not ( = ?auto_52731 ?auto_52739 ) ) ( IS-CRATE ?auto_52731 ) ( not ( = ?auto_52716 ?auto_52719 ) ) ( not ( = ?auto_52717 ?auto_52719 ) ) ( not ( = ?auto_52726 ?auto_52719 ) ) ( not ( = ?auto_52731 ?auto_52719 ) ) ( not ( = ?auto_52739 ?auto_52719 ) ) ( not ( = ?auto_52743 ?auto_52730 ) ) ( not ( = ?auto_52732 ?auto_52743 ) ) ( not ( = ?auto_52724 ?auto_52743 ) ) ( HOIST-AT ?auto_52722 ?auto_52743 ) ( not ( = ?auto_52723 ?auto_52722 ) ) ( not ( = ?auto_52729 ?auto_52722 ) ) ( not ( = ?auto_52744 ?auto_52722 ) ) ( AVAILABLE ?auto_52722 ) ( SURFACE-AT ?auto_52731 ?auto_52743 ) ( ON ?auto_52731 ?auto_52728 ) ( CLEAR ?auto_52731 ) ( not ( = ?auto_52716 ?auto_52728 ) ) ( not ( = ?auto_52717 ?auto_52728 ) ) ( not ( = ?auto_52726 ?auto_52728 ) ) ( not ( = ?auto_52731 ?auto_52728 ) ) ( not ( = ?auto_52739 ?auto_52728 ) ) ( not ( = ?auto_52719 ?auto_52728 ) ) ( IS-CRATE ?auto_52719 ) ( not ( = ?auto_52716 ?auto_52718 ) ) ( not ( = ?auto_52717 ?auto_52718 ) ) ( not ( = ?auto_52726 ?auto_52718 ) ) ( not ( = ?auto_52731 ?auto_52718 ) ) ( not ( = ?auto_52739 ?auto_52718 ) ) ( not ( = ?auto_52719 ?auto_52718 ) ) ( not ( = ?auto_52728 ?auto_52718 ) ) ( not ( = ?auto_52737 ?auto_52730 ) ) ( not ( = ?auto_52732 ?auto_52737 ) ) ( not ( = ?auto_52724 ?auto_52737 ) ) ( not ( = ?auto_52743 ?auto_52737 ) ) ( HOIST-AT ?auto_52727 ?auto_52737 ) ( not ( = ?auto_52723 ?auto_52727 ) ) ( not ( = ?auto_52729 ?auto_52727 ) ) ( not ( = ?auto_52744 ?auto_52727 ) ) ( not ( = ?auto_52722 ?auto_52727 ) ) ( AVAILABLE ?auto_52727 ) ( SURFACE-AT ?auto_52719 ?auto_52737 ) ( ON ?auto_52719 ?auto_52742 ) ( CLEAR ?auto_52719 ) ( not ( = ?auto_52716 ?auto_52742 ) ) ( not ( = ?auto_52717 ?auto_52742 ) ) ( not ( = ?auto_52726 ?auto_52742 ) ) ( not ( = ?auto_52731 ?auto_52742 ) ) ( not ( = ?auto_52739 ?auto_52742 ) ) ( not ( = ?auto_52719 ?auto_52742 ) ) ( not ( = ?auto_52728 ?auto_52742 ) ) ( not ( = ?auto_52718 ?auto_52742 ) ) ( IS-CRATE ?auto_52718 ) ( not ( = ?auto_52716 ?auto_52741 ) ) ( not ( = ?auto_52717 ?auto_52741 ) ) ( not ( = ?auto_52726 ?auto_52741 ) ) ( not ( = ?auto_52731 ?auto_52741 ) ) ( not ( = ?auto_52739 ?auto_52741 ) ) ( not ( = ?auto_52719 ?auto_52741 ) ) ( not ( = ?auto_52728 ?auto_52741 ) ) ( not ( = ?auto_52718 ?auto_52741 ) ) ( not ( = ?auto_52742 ?auto_52741 ) ) ( not ( = ?auto_52725 ?auto_52730 ) ) ( not ( = ?auto_52732 ?auto_52725 ) ) ( not ( = ?auto_52724 ?auto_52725 ) ) ( not ( = ?auto_52743 ?auto_52725 ) ) ( not ( = ?auto_52737 ?auto_52725 ) ) ( HOIST-AT ?auto_52736 ?auto_52725 ) ( not ( = ?auto_52723 ?auto_52736 ) ) ( not ( = ?auto_52729 ?auto_52736 ) ) ( not ( = ?auto_52744 ?auto_52736 ) ) ( not ( = ?auto_52722 ?auto_52736 ) ) ( not ( = ?auto_52727 ?auto_52736 ) ) ( AVAILABLE ?auto_52736 ) ( SURFACE-AT ?auto_52718 ?auto_52725 ) ( ON ?auto_52718 ?auto_52720 ) ( CLEAR ?auto_52718 ) ( not ( = ?auto_52716 ?auto_52720 ) ) ( not ( = ?auto_52717 ?auto_52720 ) ) ( not ( = ?auto_52726 ?auto_52720 ) ) ( not ( = ?auto_52731 ?auto_52720 ) ) ( not ( = ?auto_52739 ?auto_52720 ) ) ( not ( = ?auto_52719 ?auto_52720 ) ) ( not ( = ?auto_52728 ?auto_52720 ) ) ( not ( = ?auto_52718 ?auto_52720 ) ) ( not ( = ?auto_52742 ?auto_52720 ) ) ( not ( = ?auto_52741 ?auto_52720 ) ) ( IS-CRATE ?auto_52741 ) ( not ( = ?auto_52716 ?auto_52734 ) ) ( not ( = ?auto_52717 ?auto_52734 ) ) ( not ( = ?auto_52726 ?auto_52734 ) ) ( not ( = ?auto_52731 ?auto_52734 ) ) ( not ( = ?auto_52739 ?auto_52734 ) ) ( not ( = ?auto_52719 ?auto_52734 ) ) ( not ( = ?auto_52728 ?auto_52734 ) ) ( not ( = ?auto_52718 ?auto_52734 ) ) ( not ( = ?auto_52742 ?auto_52734 ) ) ( not ( = ?auto_52741 ?auto_52734 ) ) ( not ( = ?auto_52720 ?auto_52734 ) ) ( not ( = ?auto_52733 ?auto_52730 ) ) ( not ( = ?auto_52732 ?auto_52733 ) ) ( not ( = ?auto_52724 ?auto_52733 ) ) ( not ( = ?auto_52743 ?auto_52733 ) ) ( not ( = ?auto_52737 ?auto_52733 ) ) ( not ( = ?auto_52725 ?auto_52733 ) ) ( HOIST-AT ?auto_52735 ?auto_52733 ) ( not ( = ?auto_52723 ?auto_52735 ) ) ( not ( = ?auto_52729 ?auto_52735 ) ) ( not ( = ?auto_52744 ?auto_52735 ) ) ( not ( = ?auto_52722 ?auto_52735 ) ) ( not ( = ?auto_52727 ?auto_52735 ) ) ( not ( = ?auto_52736 ?auto_52735 ) ) ( AVAILABLE ?auto_52735 ) ( SURFACE-AT ?auto_52741 ?auto_52733 ) ( ON ?auto_52741 ?auto_52738 ) ( CLEAR ?auto_52741 ) ( not ( = ?auto_52716 ?auto_52738 ) ) ( not ( = ?auto_52717 ?auto_52738 ) ) ( not ( = ?auto_52726 ?auto_52738 ) ) ( not ( = ?auto_52731 ?auto_52738 ) ) ( not ( = ?auto_52739 ?auto_52738 ) ) ( not ( = ?auto_52719 ?auto_52738 ) ) ( not ( = ?auto_52728 ?auto_52738 ) ) ( not ( = ?auto_52718 ?auto_52738 ) ) ( not ( = ?auto_52742 ?auto_52738 ) ) ( not ( = ?auto_52741 ?auto_52738 ) ) ( not ( = ?auto_52720 ?auto_52738 ) ) ( not ( = ?auto_52734 ?auto_52738 ) ) ( SURFACE-AT ?auto_52740 ?auto_52730 ) ( CLEAR ?auto_52740 ) ( IS-CRATE ?auto_52734 ) ( not ( = ?auto_52716 ?auto_52740 ) ) ( not ( = ?auto_52717 ?auto_52740 ) ) ( not ( = ?auto_52726 ?auto_52740 ) ) ( not ( = ?auto_52731 ?auto_52740 ) ) ( not ( = ?auto_52739 ?auto_52740 ) ) ( not ( = ?auto_52719 ?auto_52740 ) ) ( not ( = ?auto_52728 ?auto_52740 ) ) ( not ( = ?auto_52718 ?auto_52740 ) ) ( not ( = ?auto_52742 ?auto_52740 ) ) ( not ( = ?auto_52741 ?auto_52740 ) ) ( not ( = ?auto_52720 ?auto_52740 ) ) ( not ( = ?auto_52734 ?auto_52740 ) ) ( not ( = ?auto_52738 ?auto_52740 ) ) ( AVAILABLE ?auto_52723 ) ( IN ?auto_52734 ?auto_52721 ) ( TRUCK-AT ?auto_52721 ?auto_52745 ) ( not ( = ?auto_52745 ?auto_52730 ) ) ( not ( = ?auto_52732 ?auto_52745 ) ) ( not ( = ?auto_52724 ?auto_52745 ) ) ( not ( = ?auto_52743 ?auto_52745 ) ) ( not ( = ?auto_52737 ?auto_52745 ) ) ( not ( = ?auto_52725 ?auto_52745 ) ) ( not ( = ?auto_52733 ?auto_52745 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_52721 ?auto_52745 ?auto_52730 )
      ( MAKE-ON ?auto_52716 ?auto_52717 )
      ( MAKE-ON-VERIFY ?auto_52716 ?auto_52717 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52746 - SURFACE
      ?auto_52747 - SURFACE
    )
    :vars
    (
      ?auto_52766 - HOIST
      ?auto_52764 - PLACE
      ?auto_52749 - PLACE
      ?auto_52767 - HOIST
      ?auto_52765 - SURFACE
      ?auto_52761 - SURFACE
      ?auto_52751 - PLACE
      ?auto_52775 - HOIST
      ?auto_52756 - SURFACE
      ?auto_52772 - SURFACE
      ?auto_52774 - PLACE
      ?auto_52750 - HOIST
      ?auto_52748 - SURFACE
      ?auto_52759 - SURFACE
      ?auto_52754 - PLACE
      ?auto_52762 - HOIST
      ?auto_52773 - SURFACE
      ?auto_52768 - SURFACE
      ?auto_52760 - PLACE
      ?auto_52753 - HOIST
      ?auto_52763 - SURFACE
      ?auto_52769 - SURFACE
      ?auto_52758 - PLACE
      ?auto_52770 - HOIST
      ?auto_52755 - SURFACE
      ?auto_52757 - SURFACE
      ?auto_52771 - TRUCK
      ?auto_52752 - PLACE
      ?auto_52776 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_52766 ?auto_52764 ) ( IS-CRATE ?auto_52746 ) ( not ( = ?auto_52746 ?auto_52747 ) ) ( not ( = ?auto_52749 ?auto_52764 ) ) ( HOIST-AT ?auto_52767 ?auto_52749 ) ( not ( = ?auto_52766 ?auto_52767 ) ) ( AVAILABLE ?auto_52767 ) ( SURFACE-AT ?auto_52746 ?auto_52749 ) ( ON ?auto_52746 ?auto_52765 ) ( CLEAR ?auto_52746 ) ( not ( = ?auto_52746 ?auto_52765 ) ) ( not ( = ?auto_52747 ?auto_52765 ) ) ( IS-CRATE ?auto_52747 ) ( not ( = ?auto_52746 ?auto_52761 ) ) ( not ( = ?auto_52747 ?auto_52761 ) ) ( not ( = ?auto_52765 ?auto_52761 ) ) ( not ( = ?auto_52751 ?auto_52764 ) ) ( not ( = ?auto_52749 ?auto_52751 ) ) ( HOIST-AT ?auto_52775 ?auto_52751 ) ( not ( = ?auto_52766 ?auto_52775 ) ) ( not ( = ?auto_52767 ?auto_52775 ) ) ( AVAILABLE ?auto_52775 ) ( SURFACE-AT ?auto_52747 ?auto_52751 ) ( ON ?auto_52747 ?auto_52756 ) ( CLEAR ?auto_52747 ) ( not ( = ?auto_52746 ?auto_52756 ) ) ( not ( = ?auto_52747 ?auto_52756 ) ) ( not ( = ?auto_52765 ?auto_52756 ) ) ( not ( = ?auto_52761 ?auto_52756 ) ) ( IS-CRATE ?auto_52761 ) ( not ( = ?auto_52746 ?auto_52772 ) ) ( not ( = ?auto_52747 ?auto_52772 ) ) ( not ( = ?auto_52765 ?auto_52772 ) ) ( not ( = ?auto_52761 ?auto_52772 ) ) ( not ( = ?auto_52756 ?auto_52772 ) ) ( not ( = ?auto_52774 ?auto_52764 ) ) ( not ( = ?auto_52749 ?auto_52774 ) ) ( not ( = ?auto_52751 ?auto_52774 ) ) ( HOIST-AT ?auto_52750 ?auto_52774 ) ( not ( = ?auto_52766 ?auto_52750 ) ) ( not ( = ?auto_52767 ?auto_52750 ) ) ( not ( = ?auto_52775 ?auto_52750 ) ) ( AVAILABLE ?auto_52750 ) ( SURFACE-AT ?auto_52761 ?auto_52774 ) ( ON ?auto_52761 ?auto_52748 ) ( CLEAR ?auto_52761 ) ( not ( = ?auto_52746 ?auto_52748 ) ) ( not ( = ?auto_52747 ?auto_52748 ) ) ( not ( = ?auto_52765 ?auto_52748 ) ) ( not ( = ?auto_52761 ?auto_52748 ) ) ( not ( = ?auto_52756 ?auto_52748 ) ) ( not ( = ?auto_52772 ?auto_52748 ) ) ( IS-CRATE ?auto_52772 ) ( not ( = ?auto_52746 ?auto_52759 ) ) ( not ( = ?auto_52747 ?auto_52759 ) ) ( not ( = ?auto_52765 ?auto_52759 ) ) ( not ( = ?auto_52761 ?auto_52759 ) ) ( not ( = ?auto_52756 ?auto_52759 ) ) ( not ( = ?auto_52772 ?auto_52759 ) ) ( not ( = ?auto_52748 ?auto_52759 ) ) ( not ( = ?auto_52754 ?auto_52764 ) ) ( not ( = ?auto_52749 ?auto_52754 ) ) ( not ( = ?auto_52751 ?auto_52754 ) ) ( not ( = ?auto_52774 ?auto_52754 ) ) ( HOIST-AT ?auto_52762 ?auto_52754 ) ( not ( = ?auto_52766 ?auto_52762 ) ) ( not ( = ?auto_52767 ?auto_52762 ) ) ( not ( = ?auto_52775 ?auto_52762 ) ) ( not ( = ?auto_52750 ?auto_52762 ) ) ( AVAILABLE ?auto_52762 ) ( SURFACE-AT ?auto_52772 ?auto_52754 ) ( ON ?auto_52772 ?auto_52773 ) ( CLEAR ?auto_52772 ) ( not ( = ?auto_52746 ?auto_52773 ) ) ( not ( = ?auto_52747 ?auto_52773 ) ) ( not ( = ?auto_52765 ?auto_52773 ) ) ( not ( = ?auto_52761 ?auto_52773 ) ) ( not ( = ?auto_52756 ?auto_52773 ) ) ( not ( = ?auto_52772 ?auto_52773 ) ) ( not ( = ?auto_52748 ?auto_52773 ) ) ( not ( = ?auto_52759 ?auto_52773 ) ) ( IS-CRATE ?auto_52759 ) ( not ( = ?auto_52746 ?auto_52768 ) ) ( not ( = ?auto_52747 ?auto_52768 ) ) ( not ( = ?auto_52765 ?auto_52768 ) ) ( not ( = ?auto_52761 ?auto_52768 ) ) ( not ( = ?auto_52756 ?auto_52768 ) ) ( not ( = ?auto_52772 ?auto_52768 ) ) ( not ( = ?auto_52748 ?auto_52768 ) ) ( not ( = ?auto_52759 ?auto_52768 ) ) ( not ( = ?auto_52773 ?auto_52768 ) ) ( not ( = ?auto_52760 ?auto_52764 ) ) ( not ( = ?auto_52749 ?auto_52760 ) ) ( not ( = ?auto_52751 ?auto_52760 ) ) ( not ( = ?auto_52774 ?auto_52760 ) ) ( not ( = ?auto_52754 ?auto_52760 ) ) ( HOIST-AT ?auto_52753 ?auto_52760 ) ( not ( = ?auto_52766 ?auto_52753 ) ) ( not ( = ?auto_52767 ?auto_52753 ) ) ( not ( = ?auto_52775 ?auto_52753 ) ) ( not ( = ?auto_52750 ?auto_52753 ) ) ( not ( = ?auto_52762 ?auto_52753 ) ) ( AVAILABLE ?auto_52753 ) ( SURFACE-AT ?auto_52759 ?auto_52760 ) ( ON ?auto_52759 ?auto_52763 ) ( CLEAR ?auto_52759 ) ( not ( = ?auto_52746 ?auto_52763 ) ) ( not ( = ?auto_52747 ?auto_52763 ) ) ( not ( = ?auto_52765 ?auto_52763 ) ) ( not ( = ?auto_52761 ?auto_52763 ) ) ( not ( = ?auto_52756 ?auto_52763 ) ) ( not ( = ?auto_52772 ?auto_52763 ) ) ( not ( = ?auto_52748 ?auto_52763 ) ) ( not ( = ?auto_52759 ?auto_52763 ) ) ( not ( = ?auto_52773 ?auto_52763 ) ) ( not ( = ?auto_52768 ?auto_52763 ) ) ( IS-CRATE ?auto_52768 ) ( not ( = ?auto_52746 ?auto_52769 ) ) ( not ( = ?auto_52747 ?auto_52769 ) ) ( not ( = ?auto_52765 ?auto_52769 ) ) ( not ( = ?auto_52761 ?auto_52769 ) ) ( not ( = ?auto_52756 ?auto_52769 ) ) ( not ( = ?auto_52772 ?auto_52769 ) ) ( not ( = ?auto_52748 ?auto_52769 ) ) ( not ( = ?auto_52759 ?auto_52769 ) ) ( not ( = ?auto_52773 ?auto_52769 ) ) ( not ( = ?auto_52768 ?auto_52769 ) ) ( not ( = ?auto_52763 ?auto_52769 ) ) ( not ( = ?auto_52758 ?auto_52764 ) ) ( not ( = ?auto_52749 ?auto_52758 ) ) ( not ( = ?auto_52751 ?auto_52758 ) ) ( not ( = ?auto_52774 ?auto_52758 ) ) ( not ( = ?auto_52754 ?auto_52758 ) ) ( not ( = ?auto_52760 ?auto_52758 ) ) ( HOIST-AT ?auto_52770 ?auto_52758 ) ( not ( = ?auto_52766 ?auto_52770 ) ) ( not ( = ?auto_52767 ?auto_52770 ) ) ( not ( = ?auto_52775 ?auto_52770 ) ) ( not ( = ?auto_52750 ?auto_52770 ) ) ( not ( = ?auto_52762 ?auto_52770 ) ) ( not ( = ?auto_52753 ?auto_52770 ) ) ( AVAILABLE ?auto_52770 ) ( SURFACE-AT ?auto_52768 ?auto_52758 ) ( ON ?auto_52768 ?auto_52755 ) ( CLEAR ?auto_52768 ) ( not ( = ?auto_52746 ?auto_52755 ) ) ( not ( = ?auto_52747 ?auto_52755 ) ) ( not ( = ?auto_52765 ?auto_52755 ) ) ( not ( = ?auto_52761 ?auto_52755 ) ) ( not ( = ?auto_52756 ?auto_52755 ) ) ( not ( = ?auto_52772 ?auto_52755 ) ) ( not ( = ?auto_52748 ?auto_52755 ) ) ( not ( = ?auto_52759 ?auto_52755 ) ) ( not ( = ?auto_52773 ?auto_52755 ) ) ( not ( = ?auto_52768 ?auto_52755 ) ) ( not ( = ?auto_52763 ?auto_52755 ) ) ( not ( = ?auto_52769 ?auto_52755 ) ) ( SURFACE-AT ?auto_52757 ?auto_52764 ) ( CLEAR ?auto_52757 ) ( IS-CRATE ?auto_52769 ) ( not ( = ?auto_52746 ?auto_52757 ) ) ( not ( = ?auto_52747 ?auto_52757 ) ) ( not ( = ?auto_52765 ?auto_52757 ) ) ( not ( = ?auto_52761 ?auto_52757 ) ) ( not ( = ?auto_52756 ?auto_52757 ) ) ( not ( = ?auto_52772 ?auto_52757 ) ) ( not ( = ?auto_52748 ?auto_52757 ) ) ( not ( = ?auto_52759 ?auto_52757 ) ) ( not ( = ?auto_52773 ?auto_52757 ) ) ( not ( = ?auto_52768 ?auto_52757 ) ) ( not ( = ?auto_52763 ?auto_52757 ) ) ( not ( = ?auto_52769 ?auto_52757 ) ) ( not ( = ?auto_52755 ?auto_52757 ) ) ( AVAILABLE ?auto_52766 ) ( TRUCK-AT ?auto_52771 ?auto_52752 ) ( not ( = ?auto_52752 ?auto_52764 ) ) ( not ( = ?auto_52749 ?auto_52752 ) ) ( not ( = ?auto_52751 ?auto_52752 ) ) ( not ( = ?auto_52774 ?auto_52752 ) ) ( not ( = ?auto_52754 ?auto_52752 ) ) ( not ( = ?auto_52760 ?auto_52752 ) ) ( not ( = ?auto_52758 ?auto_52752 ) ) ( HOIST-AT ?auto_52776 ?auto_52752 ) ( LIFTING ?auto_52776 ?auto_52769 ) ( not ( = ?auto_52766 ?auto_52776 ) ) ( not ( = ?auto_52767 ?auto_52776 ) ) ( not ( = ?auto_52775 ?auto_52776 ) ) ( not ( = ?auto_52750 ?auto_52776 ) ) ( not ( = ?auto_52762 ?auto_52776 ) ) ( not ( = ?auto_52753 ?auto_52776 ) ) ( not ( = ?auto_52770 ?auto_52776 ) ) )
    :subtasks
    ( ( !LOAD ?auto_52776 ?auto_52769 ?auto_52771 ?auto_52752 )
      ( MAKE-ON ?auto_52746 ?auto_52747 )
      ( MAKE-ON-VERIFY ?auto_52746 ?auto_52747 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52777 - SURFACE
      ?auto_52778 - SURFACE
    )
    :vars
    (
      ?auto_52804 - HOIST
      ?auto_52807 - PLACE
      ?auto_52799 - PLACE
      ?auto_52791 - HOIST
      ?auto_52780 - SURFACE
      ?auto_52802 - SURFACE
      ?auto_52790 - PLACE
      ?auto_52806 - HOIST
      ?auto_52783 - SURFACE
      ?auto_52785 - SURFACE
      ?auto_52779 - PLACE
      ?auto_52786 - HOIST
      ?auto_52788 - SURFACE
      ?auto_52801 - SURFACE
      ?auto_52782 - PLACE
      ?auto_52796 - HOIST
      ?auto_52805 - SURFACE
      ?auto_52792 - SURFACE
      ?auto_52789 - PLACE
      ?auto_52798 - HOIST
      ?auto_52795 - SURFACE
      ?auto_52793 - SURFACE
      ?auto_52797 - PLACE
      ?auto_52794 - HOIST
      ?auto_52781 - SURFACE
      ?auto_52787 - SURFACE
      ?auto_52784 - TRUCK
      ?auto_52800 - PLACE
      ?auto_52803 - HOIST
      ?auto_52808 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52804 ?auto_52807 ) ( IS-CRATE ?auto_52777 ) ( not ( = ?auto_52777 ?auto_52778 ) ) ( not ( = ?auto_52799 ?auto_52807 ) ) ( HOIST-AT ?auto_52791 ?auto_52799 ) ( not ( = ?auto_52804 ?auto_52791 ) ) ( AVAILABLE ?auto_52791 ) ( SURFACE-AT ?auto_52777 ?auto_52799 ) ( ON ?auto_52777 ?auto_52780 ) ( CLEAR ?auto_52777 ) ( not ( = ?auto_52777 ?auto_52780 ) ) ( not ( = ?auto_52778 ?auto_52780 ) ) ( IS-CRATE ?auto_52778 ) ( not ( = ?auto_52777 ?auto_52802 ) ) ( not ( = ?auto_52778 ?auto_52802 ) ) ( not ( = ?auto_52780 ?auto_52802 ) ) ( not ( = ?auto_52790 ?auto_52807 ) ) ( not ( = ?auto_52799 ?auto_52790 ) ) ( HOIST-AT ?auto_52806 ?auto_52790 ) ( not ( = ?auto_52804 ?auto_52806 ) ) ( not ( = ?auto_52791 ?auto_52806 ) ) ( AVAILABLE ?auto_52806 ) ( SURFACE-AT ?auto_52778 ?auto_52790 ) ( ON ?auto_52778 ?auto_52783 ) ( CLEAR ?auto_52778 ) ( not ( = ?auto_52777 ?auto_52783 ) ) ( not ( = ?auto_52778 ?auto_52783 ) ) ( not ( = ?auto_52780 ?auto_52783 ) ) ( not ( = ?auto_52802 ?auto_52783 ) ) ( IS-CRATE ?auto_52802 ) ( not ( = ?auto_52777 ?auto_52785 ) ) ( not ( = ?auto_52778 ?auto_52785 ) ) ( not ( = ?auto_52780 ?auto_52785 ) ) ( not ( = ?auto_52802 ?auto_52785 ) ) ( not ( = ?auto_52783 ?auto_52785 ) ) ( not ( = ?auto_52779 ?auto_52807 ) ) ( not ( = ?auto_52799 ?auto_52779 ) ) ( not ( = ?auto_52790 ?auto_52779 ) ) ( HOIST-AT ?auto_52786 ?auto_52779 ) ( not ( = ?auto_52804 ?auto_52786 ) ) ( not ( = ?auto_52791 ?auto_52786 ) ) ( not ( = ?auto_52806 ?auto_52786 ) ) ( AVAILABLE ?auto_52786 ) ( SURFACE-AT ?auto_52802 ?auto_52779 ) ( ON ?auto_52802 ?auto_52788 ) ( CLEAR ?auto_52802 ) ( not ( = ?auto_52777 ?auto_52788 ) ) ( not ( = ?auto_52778 ?auto_52788 ) ) ( not ( = ?auto_52780 ?auto_52788 ) ) ( not ( = ?auto_52802 ?auto_52788 ) ) ( not ( = ?auto_52783 ?auto_52788 ) ) ( not ( = ?auto_52785 ?auto_52788 ) ) ( IS-CRATE ?auto_52785 ) ( not ( = ?auto_52777 ?auto_52801 ) ) ( not ( = ?auto_52778 ?auto_52801 ) ) ( not ( = ?auto_52780 ?auto_52801 ) ) ( not ( = ?auto_52802 ?auto_52801 ) ) ( not ( = ?auto_52783 ?auto_52801 ) ) ( not ( = ?auto_52785 ?auto_52801 ) ) ( not ( = ?auto_52788 ?auto_52801 ) ) ( not ( = ?auto_52782 ?auto_52807 ) ) ( not ( = ?auto_52799 ?auto_52782 ) ) ( not ( = ?auto_52790 ?auto_52782 ) ) ( not ( = ?auto_52779 ?auto_52782 ) ) ( HOIST-AT ?auto_52796 ?auto_52782 ) ( not ( = ?auto_52804 ?auto_52796 ) ) ( not ( = ?auto_52791 ?auto_52796 ) ) ( not ( = ?auto_52806 ?auto_52796 ) ) ( not ( = ?auto_52786 ?auto_52796 ) ) ( AVAILABLE ?auto_52796 ) ( SURFACE-AT ?auto_52785 ?auto_52782 ) ( ON ?auto_52785 ?auto_52805 ) ( CLEAR ?auto_52785 ) ( not ( = ?auto_52777 ?auto_52805 ) ) ( not ( = ?auto_52778 ?auto_52805 ) ) ( not ( = ?auto_52780 ?auto_52805 ) ) ( not ( = ?auto_52802 ?auto_52805 ) ) ( not ( = ?auto_52783 ?auto_52805 ) ) ( not ( = ?auto_52785 ?auto_52805 ) ) ( not ( = ?auto_52788 ?auto_52805 ) ) ( not ( = ?auto_52801 ?auto_52805 ) ) ( IS-CRATE ?auto_52801 ) ( not ( = ?auto_52777 ?auto_52792 ) ) ( not ( = ?auto_52778 ?auto_52792 ) ) ( not ( = ?auto_52780 ?auto_52792 ) ) ( not ( = ?auto_52802 ?auto_52792 ) ) ( not ( = ?auto_52783 ?auto_52792 ) ) ( not ( = ?auto_52785 ?auto_52792 ) ) ( not ( = ?auto_52788 ?auto_52792 ) ) ( not ( = ?auto_52801 ?auto_52792 ) ) ( not ( = ?auto_52805 ?auto_52792 ) ) ( not ( = ?auto_52789 ?auto_52807 ) ) ( not ( = ?auto_52799 ?auto_52789 ) ) ( not ( = ?auto_52790 ?auto_52789 ) ) ( not ( = ?auto_52779 ?auto_52789 ) ) ( not ( = ?auto_52782 ?auto_52789 ) ) ( HOIST-AT ?auto_52798 ?auto_52789 ) ( not ( = ?auto_52804 ?auto_52798 ) ) ( not ( = ?auto_52791 ?auto_52798 ) ) ( not ( = ?auto_52806 ?auto_52798 ) ) ( not ( = ?auto_52786 ?auto_52798 ) ) ( not ( = ?auto_52796 ?auto_52798 ) ) ( AVAILABLE ?auto_52798 ) ( SURFACE-AT ?auto_52801 ?auto_52789 ) ( ON ?auto_52801 ?auto_52795 ) ( CLEAR ?auto_52801 ) ( not ( = ?auto_52777 ?auto_52795 ) ) ( not ( = ?auto_52778 ?auto_52795 ) ) ( not ( = ?auto_52780 ?auto_52795 ) ) ( not ( = ?auto_52802 ?auto_52795 ) ) ( not ( = ?auto_52783 ?auto_52795 ) ) ( not ( = ?auto_52785 ?auto_52795 ) ) ( not ( = ?auto_52788 ?auto_52795 ) ) ( not ( = ?auto_52801 ?auto_52795 ) ) ( not ( = ?auto_52805 ?auto_52795 ) ) ( not ( = ?auto_52792 ?auto_52795 ) ) ( IS-CRATE ?auto_52792 ) ( not ( = ?auto_52777 ?auto_52793 ) ) ( not ( = ?auto_52778 ?auto_52793 ) ) ( not ( = ?auto_52780 ?auto_52793 ) ) ( not ( = ?auto_52802 ?auto_52793 ) ) ( not ( = ?auto_52783 ?auto_52793 ) ) ( not ( = ?auto_52785 ?auto_52793 ) ) ( not ( = ?auto_52788 ?auto_52793 ) ) ( not ( = ?auto_52801 ?auto_52793 ) ) ( not ( = ?auto_52805 ?auto_52793 ) ) ( not ( = ?auto_52792 ?auto_52793 ) ) ( not ( = ?auto_52795 ?auto_52793 ) ) ( not ( = ?auto_52797 ?auto_52807 ) ) ( not ( = ?auto_52799 ?auto_52797 ) ) ( not ( = ?auto_52790 ?auto_52797 ) ) ( not ( = ?auto_52779 ?auto_52797 ) ) ( not ( = ?auto_52782 ?auto_52797 ) ) ( not ( = ?auto_52789 ?auto_52797 ) ) ( HOIST-AT ?auto_52794 ?auto_52797 ) ( not ( = ?auto_52804 ?auto_52794 ) ) ( not ( = ?auto_52791 ?auto_52794 ) ) ( not ( = ?auto_52806 ?auto_52794 ) ) ( not ( = ?auto_52786 ?auto_52794 ) ) ( not ( = ?auto_52796 ?auto_52794 ) ) ( not ( = ?auto_52798 ?auto_52794 ) ) ( AVAILABLE ?auto_52794 ) ( SURFACE-AT ?auto_52792 ?auto_52797 ) ( ON ?auto_52792 ?auto_52781 ) ( CLEAR ?auto_52792 ) ( not ( = ?auto_52777 ?auto_52781 ) ) ( not ( = ?auto_52778 ?auto_52781 ) ) ( not ( = ?auto_52780 ?auto_52781 ) ) ( not ( = ?auto_52802 ?auto_52781 ) ) ( not ( = ?auto_52783 ?auto_52781 ) ) ( not ( = ?auto_52785 ?auto_52781 ) ) ( not ( = ?auto_52788 ?auto_52781 ) ) ( not ( = ?auto_52801 ?auto_52781 ) ) ( not ( = ?auto_52805 ?auto_52781 ) ) ( not ( = ?auto_52792 ?auto_52781 ) ) ( not ( = ?auto_52795 ?auto_52781 ) ) ( not ( = ?auto_52793 ?auto_52781 ) ) ( SURFACE-AT ?auto_52787 ?auto_52807 ) ( CLEAR ?auto_52787 ) ( IS-CRATE ?auto_52793 ) ( not ( = ?auto_52777 ?auto_52787 ) ) ( not ( = ?auto_52778 ?auto_52787 ) ) ( not ( = ?auto_52780 ?auto_52787 ) ) ( not ( = ?auto_52802 ?auto_52787 ) ) ( not ( = ?auto_52783 ?auto_52787 ) ) ( not ( = ?auto_52785 ?auto_52787 ) ) ( not ( = ?auto_52788 ?auto_52787 ) ) ( not ( = ?auto_52801 ?auto_52787 ) ) ( not ( = ?auto_52805 ?auto_52787 ) ) ( not ( = ?auto_52792 ?auto_52787 ) ) ( not ( = ?auto_52795 ?auto_52787 ) ) ( not ( = ?auto_52793 ?auto_52787 ) ) ( not ( = ?auto_52781 ?auto_52787 ) ) ( AVAILABLE ?auto_52804 ) ( TRUCK-AT ?auto_52784 ?auto_52800 ) ( not ( = ?auto_52800 ?auto_52807 ) ) ( not ( = ?auto_52799 ?auto_52800 ) ) ( not ( = ?auto_52790 ?auto_52800 ) ) ( not ( = ?auto_52779 ?auto_52800 ) ) ( not ( = ?auto_52782 ?auto_52800 ) ) ( not ( = ?auto_52789 ?auto_52800 ) ) ( not ( = ?auto_52797 ?auto_52800 ) ) ( HOIST-AT ?auto_52803 ?auto_52800 ) ( not ( = ?auto_52804 ?auto_52803 ) ) ( not ( = ?auto_52791 ?auto_52803 ) ) ( not ( = ?auto_52806 ?auto_52803 ) ) ( not ( = ?auto_52786 ?auto_52803 ) ) ( not ( = ?auto_52796 ?auto_52803 ) ) ( not ( = ?auto_52798 ?auto_52803 ) ) ( not ( = ?auto_52794 ?auto_52803 ) ) ( AVAILABLE ?auto_52803 ) ( SURFACE-AT ?auto_52793 ?auto_52800 ) ( ON ?auto_52793 ?auto_52808 ) ( CLEAR ?auto_52793 ) ( not ( = ?auto_52777 ?auto_52808 ) ) ( not ( = ?auto_52778 ?auto_52808 ) ) ( not ( = ?auto_52780 ?auto_52808 ) ) ( not ( = ?auto_52802 ?auto_52808 ) ) ( not ( = ?auto_52783 ?auto_52808 ) ) ( not ( = ?auto_52785 ?auto_52808 ) ) ( not ( = ?auto_52788 ?auto_52808 ) ) ( not ( = ?auto_52801 ?auto_52808 ) ) ( not ( = ?auto_52805 ?auto_52808 ) ) ( not ( = ?auto_52792 ?auto_52808 ) ) ( not ( = ?auto_52795 ?auto_52808 ) ) ( not ( = ?auto_52793 ?auto_52808 ) ) ( not ( = ?auto_52781 ?auto_52808 ) ) ( not ( = ?auto_52787 ?auto_52808 ) ) )
    :subtasks
    ( ( !LIFT ?auto_52803 ?auto_52793 ?auto_52808 ?auto_52800 )
      ( MAKE-ON ?auto_52777 ?auto_52778 )
      ( MAKE-ON-VERIFY ?auto_52777 ?auto_52778 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52809 - SURFACE
      ?auto_52810 - SURFACE
    )
    :vars
    (
      ?auto_52833 - HOIST
      ?auto_52823 - PLACE
      ?auto_52816 - PLACE
      ?auto_52835 - HOIST
      ?auto_52829 - SURFACE
      ?auto_52813 - SURFACE
      ?auto_52834 - PLACE
      ?auto_52822 - HOIST
      ?auto_52831 - SURFACE
      ?auto_52819 - SURFACE
      ?auto_52812 - PLACE
      ?auto_52827 - HOIST
      ?auto_52836 - SURFACE
      ?auto_52817 - SURFACE
      ?auto_52826 - PLACE
      ?auto_52839 - HOIST
      ?auto_52821 - SURFACE
      ?auto_52830 - SURFACE
      ?auto_52832 - PLACE
      ?auto_52815 - HOIST
      ?auto_52814 - SURFACE
      ?auto_52840 - SURFACE
      ?auto_52838 - PLACE
      ?auto_52818 - HOIST
      ?auto_52837 - SURFACE
      ?auto_52811 - SURFACE
      ?auto_52824 - PLACE
      ?auto_52820 - HOIST
      ?auto_52825 - SURFACE
      ?auto_52828 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52833 ?auto_52823 ) ( IS-CRATE ?auto_52809 ) ( not ( = ?auto_52809 ?auto_52810 ) ) ( not ( = ?auto_52816 ?auto_52823 ) ) ( HOIST-AT ?auto_52835 ?auto_52816 ) ( not ( = ?auto_52833 ?auto_52835 ) ) ( AVAILABLE ?auto_52835 ) ( SURFACE-AT ?auto_52809 ?auto_52816 ) ( ON ?auto_52809 ?auto_52829 ) ( CLEAR ?auto_52809 ) ( not ( = ?auto_52809 ?auto_52829 ) ) ( not ( = ?auto_52810 ?auto_52829 ) ) ( IS-CRATE ?auto_52810 ) ( not ( = ?auto_52809 ?auto_52813 ) ) ( not ( = ?auto_52810 ?auto_52813 ) ) ( not ( = ?auto_52829 ?auto_52813 ) ) ( not ( = ?auto_52834 ?auto_52823 ) ) ( not ( = ?auto_52816 ?auto_52834 ) ) ( HOIST-AT ?auto_52822 ?auto_52834 ) ( not ( = ?auto_52833 ?auto_52822 ) ) ( not ( = ?auto_52835 ?auto_52822 ) ) ( AVAILABLE ?auto_52822 ) ( SURFACE-AT ?auto_52810 ?auto_52834 ) ( ON ?auto_52810 ?auto_52831 ) ( CLEAR ?auto_52810 ) ( not ( = ?auto_52809 ?auto_52831 ) ) ( not ( = ?auto_52810 ?auto_52831 ) ) ( not ( = ?auto_52829 ?auto_52831 ) ) ( not ( = ?auto_52813 ?auto_52831 ) ) ( IS-CRATE ?auto_52813 ) ( not ( = ?auto_52809 ?auto_52819 ) ) ( not ( = ?auto_52810 ?auto_52819 ) ) ( not ( = ?auto_52829 ?auto_52819 ) ) ( not ( = ?auto_52813 ?auto_52819 ) ) ( not ( = ?auto_52831 ?auto_52819 ) ) ( not ( = ?auto_52812 ?auto_52823 ) ) ( not ( = ?auto_52816 ?auto_52812 ) ) ( not ( = ?auto_52834 ?auto_52812 ) ) ( HOIST-AT ?auto_52827 ?auto_52812 ) ( not ( = ?auto_52833 ?auto_52827 ) ) ( not ( = ?auto_52835 ?auto_52827 ) ) ( not ( = ?auto_52822 ?auto_52827 ) ) ( AVAILABLE ?auto_52827 ) ( SURFACE-AT ?auto_52813 ?auto_52812 ) ( ON ?auto_52813 ?auto_52836 ) ( CLEAR ?auto_52813 ) ( not ( = ?auto_52809 ?auto_52836 ) ) ( not ( = ?auto_52810 ?auto_52836 ) ) ( not ( = ?auto_52829 ?auto_52836 ) ) ( not ( = ?auto_52813 ?auto_52836 ) ) ( not ( = ?auto_52831 ?auto_52836 ) ) ( not ( = ?auto_52819 ?auto_52836 ) ) ( IS-CRATE ?auto_52819 ) ( not ( = ?auto_52809 ?auto_52817 ) ) ( not ( = ?auto_52810 ?auto_52817 ) ) ( not ( = ?auto_52829 ?auto_52817 ) ) ( not ( = ?auto_52813 ?auto_52817 ) ) ( not ( = ?auto_52831 ?auto_52817 ) ) ( not ( = ?auto_52819 ?auto_52817 ) ) ( not ( = ?auto_52836 ?auto_52817 ) ) ( not ( = ?auto_52826 ?auto_52823 ) ) ( not ( = ?auto_52816 ?auto_52826 ) ) ( not ( = ?auto_52834 ?auto_52826 ) ) ( not ( = ?auto_52812 ?auto_52826 ) ) ( HOIST-AT ?auto_52839 ?auto_52826 ) ( not ( = ?auto_52833 ?auto_52839 ) ) ( not ( = ?auto_52835 ?auto_52839 ) ) ( not ( = ?auto_52822 ?auto_52839 ) ) ( not ( = ?auto_52827 ?auto_52839 ) ) ( AVAILABLE ?auto_52839 ) ( SURFACE-AT ?auto_52819 ?auto_52826 ) ( ON ?auto_52819 ?auto_52821 ) ( CLEAR ?auto_52819 ) ( not ( = ?auto_52809 ?auto_52821 ) ) ( not ( = ?auto_52810 ?auto_52821 ) ) ( not ( = ?auto_52829 ?auto_52821 ) ) ( not ( = ?auto_52813 ?auto_52821 ) ) ( not ( = ?auto_52831 ?auto_52821 ) ) ( not ( = ?auto_52819 ?auto_52821 ) ) ( not ( = ?auto_52836 ?auto_52821 ) ) ( not ( = ?auto_52817 ?auto_52821 ) ) ( IS-CRATE ?auto_52817 ) ( not ( = ?auto_52809 ?auto_52830 ) ) ( not ( = ?auto_52810 ?auto_52830 ) ) ( not ( = ?auto_52829 ?auto_52830 ) ) ( not ( = ?auto_52813 ?auto_52830 ) ) ( not ( = ?auto_52831 ?auto_52830 ) ) ( not ( = ?auto_52819 ?auto_52830 ) ) ( not ( = ?auto_52836 ?auto_52830 ) ) ( not ( = ?auto_52817 ?auto_52830 ) ) ( not ( = ?auto_52821 ?auto_52830 ) ) ( not ( = ?auto_52832 ?auto_52823 ) ) ( not ( = ?auto_52816 ?auto_52832 ) ) ( not ( = ?auto_52834 ?auto_52832 ) ) ( not ( = ?auto_52812 ?auto_52832 ) ) ( not ( = ?auto_52826 ?auto_52832 ) ) ( HOIST-AT ?auto_52815 ?auto_52832 ) ( not ( = ?auto_52833 ?auto_52815 ) ) ( not ( = ?auto_52835 ?auto_52815 ) ) ( not ( = ?auto_52822 ?auto_52815 ) ) ( not ( = ?auto_52827 ?auto_52815 ) ) ( not ( = ?auto_52839 ?auto_52815 ) ) ( AVAILABLE ?auto_52815 ) ( SURFACE-AT ?auto_52817 ?auto_52832 ) ( ON ?auto_52817 ?auto_52814 ) ( CLEAR ?auto_52817 ) ( not ( = ?auto_52809 ?auto_52814 ) ) ( not ( = ?auto_52810 ?auto_52814 ) ) ( not ( = ?auto_52829 ?auto_52814 ) ) ( not ( = ?auto_52813 ?auto_52814 ) ) ( not ( = ?auto_52831 ?auto_52814 ) ) ( not ( = ?auto_52819 ?auto_52814 ) ) ( not ( = ?auto_52836 ?auto_52814 ) ) ( not ( = ?auto_52817 ?auto_52814 ) ) ( not ( = ?auto_52821 ?auto_52814 ) ) ( not ( = ?auto_52830 ?auto_52814 ) ) ( IS-CRATE ?auto_52830 ) ( not ( = ?auto_52809 ?auto_52840 ) ) ( not ( = ?auto_52810 ?auto_52840 ) ) ( not ( = ?auto_52829 ?auto_52840 ) ) ( not ( = ?auto_52813 ?auto_52840 ) ) ( not ( = ?auto_52831 ?auto_52840 ) ) ( not ( = ?auto_52819 ?auto_52840 ) ) ( not ( = ?auto_52836 ?auto_52840 ) ) ( not ( = ?auto_52817 ?auto_52840 ) ) ( not ( = ?auto_52821 ?auto_52840 ) ) ( not ( = ?auto_52830 ?auto_52840 ) ) ( not ( = ?auto_52814 ?auto_52840 ) ) ( not ( = ?auto_52838 ?auto_52823 ) ) ( not ( = ?auto_52816 ?auto_52838 ) ) ( not ( = ?auto_52834 ?auto_52838 ) ) ( not ( = ?auto_52812 ?auto_52838 ) ) ( not ( = ?auto_52826 ?auto_52838 ) ) ( not ( = ?auto_52832 ?auto_52838 ) ) ( HOIST-AT ?auto_52818 ?auto_52838 ) ( not ( = ?auto_52833 ?auto_52818 ) ) ( not ( = ?auto_52835 ?auto_52818 ) ) ( not ( = ?auto_52822 ?auto_52818 ) ) ( not ( = ?auto_52827 ?auto_52818 ) ) ( not ( = ?auto_52839 ?auto_52818 ) ) ( not ( = ?auto_52815 ?auto_52818 ) ) ( AVAILABLE ?auto_52818 ) ( SURFACE-AT ?auto_52830 ?auto_52838 ) ( ON ?auto_52830 ?auto_52837 ) ( CLEAR ?auto_52830 ) ( not ( = ?auto_52809 ?auto_52837 ) ) ( not ( = ?auto_52810 ?auto_52837 ) ) ( not ( = ?auto_52829 ?auto_52837 ) ) ( not ( = ?auto_52813 ?auto_52837 ) ) ( not ( = ?auto_52831 ?auto_52837 ) ) ( not ( = ?auto_52819 ?auto_52837 ) ) ( not ( = ?auto_52836 ?auto_52837 ) ) ( not ( = ?auto_52817 ?auto_52837 ) ) ( not ( = ?auto_52821 ?auto_52837 ) ) ( not ( = ?auto_52830 ?auto_52837 ) ) ( not ( = ?auto_52814 ?auto_52837 ) ) ( not ( = ?auto_52840 ?auto_52837 ) ) ( SURFACE-AT ?auto_52811 ?auto_52823 ) ( CLEAR ?auto_52811 ) ( IS-CRATE ?auto_52840 ) ( not ( = ?auto_52809 ?auto_52811 ) ) ( not ( = ?auto_52810 ?auto_52811 ) ) ( not ( = ?auto_52829 ?auto_52811 ) ) ( not ( = ?auto_52813 ?auto_52811 ) ) ( not ( = ?auto_52831 ?auto_52811 ) ) ( not ( = ?auto_52819 ?auto_52811 ) ) ( not ( = ?auto_52836 ?auto_52811 ) ) ( not ( = ?auto_52817 ?auto_52811 ) ) ( not ( = ?auto_52821 ?auto_52811 ) ) ( not ( = ?auto_52830 ?auto_52811 ) ) ( not ( = ?auto_52814 ?auto_52811 ) ) ( not ( = ?auto_52840 ?auto_52811 ) ) ( not ( = ?auto_52837 ?auto_52811 ) ) ( AVAILABLE ?auto_52833 ) ( not ( = ?auto_52824 ?auto_52823 ) ) ( not ( = ?auto_52816 ?auto_52824 ) ) ( not ( = ?auto_52834 ?auto_52824 ) ) ( not ( = ?auto_52812 ?auto_52824 ) ) ( not ( = ?auto_52826 ?auto_52824 ) ) ( not ( = ?auto_52832 ?auto_52824 ) ) ( not ( = ?auto_52838 ?auto_52824 ) ) ( HOIST-AT ?auto_52820 ?auto_52824 ) ( not ( = ?auto_52833 ?auto_52820 ) ) ( not ( = ?auto_52835 ?auto_52820 ) ) ( not ( = ?auto_52822 ?auto_52820 ) ) ( not ( = ?auto_52827 ?auto_52820 ) ) ( not ( = ?auto_52839 ?auto_52820 ) ) ( not ( = ?auto_52815 ?auto_52820 ) ) ( not ( = ?auto_52818 ?auto_52820 ) ) ( AVAILABLE ?auto_52820 ) ( SURFACE-AT ?auto_52840 ?auto_52824 ) ( ON ?auto_52840 ?auto_52825 ) ( CLEAR ?auto_52840 ) ( not ( = ?auto_52809 ?auto_52825 ) ) ( not ( = ?auto_52810 ?auto_52825 ) ) ( not ( = ?auto_52829 ?auto_52825 ) ) ( not ( = ?auto_52813 ?auto_52825 ) ) ( not ( = ?auto_52831 ?auto_52825 ) ) ( not ( = ?auto_52819 ?auto_52825 ) ) ( not ( = ?auto_52836 ?auto_52825 ) ) ( not ( = ?auto_52817 ?auto_52825 ) ) ( not ( = ?auto_52821 ?auto_52825 ) ) ( not ( = ?auto_52830 ?auto_52825 ) ) ( not ( = ?auto_52814 ?auto_52825 ) ) ( not ( = ?auto_52840 ?auto_52825 ) ) ( not ( = ?auto_52837 ?auto_52825 ) ) ( not ( = ?auto_52811 ?auto_52825 ) ) ( TRUCK-AT ?auto_52828 ?auto_52823 ) )
    :subtasks
    ( ( !DRIVE ?auto_52828 ?auto_52823 ?auto_52824 )
      ( MAKE-ON ?auto_52809 ?auto_52810 )
      ( MAKE-ON-VERIFY ?auto_52809 ?auto_52810 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52843 - SURFACE
      ?auto_52844 - SURFACE
    )
    :vars
    (
      ?auto_52845 - HOIST
      ?auto_52846 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52845 ?auto_52846 ) ( SURFACE-AT ?auto_52844 ?auto_52846 ) ( CLEAR ?auto_52844 ) ( LIFTING ?auto_52845 ?auto_52843 ) ( IS-CRATE ?auto_52843 ) ( not ( = ?auto_52843 ?auto_52844 ) ) )
    :subtasks
    ( ( !DROP ?auto_52845 ?auto_52843 ?auto_52844 ?auto_52846 )
      ( MAKE-ON-VERIFY ?auto_52843 ?auto_52844 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52847 - SURFACE
      ?auto_52848 - SURFACE
    )
    :vars
    (
      ?auto_52850 - HOIST
      ?auto_52849 - PLACE
      ?auto_52851 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52850 ?auto_52849 ) ( SURFACE-AT ?auto_52848 ?auto_52849 ) ( CLEAR ?auto_52848 ) ( IS-CRATE ?auto_52847 ) ( not ( = ?auto_52847 ?auto_52848 ) ) ( TRUCK-AT ?auto_52851 ?auto_52849 ) ( AVAILABLE ?auto_52850 ) ( IN ?auto_52847 ?auto_52851 ) )
    :subtasks
    ( ( !UNLOAD ?auto_52850 ?auto_52847 ?auto_52851 ?auto_52849 )
      ( MAKE-ON ?auto_52847 ?auto_52848 )
      ( MAKE-ON-VERIFY ?auto_52847 ?auto_52848 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52852 - SURFACE
      ?auto_52853 - SURFACE
    )
    :vars
    (
      ?auto_52856 - HOIST
      ?auto_52855 - PLACE
      ?auto_52854 - TRUCK
      ?auto_52857 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52856 ?auto_52855 ) ( SURFACE-AT ?auto_52853 ?auto_52855 ) ( CLEAR ?auto_52853 ) ( IS-CRATE ?auto_52852 ) ( not ( = ?auto_52852 ?auto_52853 ) ) ( AVAILABLE ?auto_52856 ) ( IN ?auto_52852 ?auto_52854 ) ( TRUCK-AT ?auto_52854 ?auto_52857 ) ( not ( = ?auto_52857 ?auto_52855 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_52854 ?auto_52857 ?auto_52855 )
      ( MAKE-ON ?auto_52852 ?auto_52853 )
      ( MAKE-ON-VERIFY ?auto_52852 ?auto_52853 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52858 - SURFACE
      ?auto_52859 - SURFACE
    )
    :vars
    (
      ?auto_52861 - HOIST
      ?auto_52862 - PLACE
      ?auto_52860 - TRUCK
      ?auto_52863 - PLACE
      ?auto_52864 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_52861 ?auto_52862 ) ( SURFACE-AT ?auto_52859 ?auto_52862 ) ( CLEAR ?auto_52859 ) ( IS-CRATE ?auto_52858 ) ( not ( = ?auto_52858 ?auto_52859 ) ) ( AVAILABLE ?auto_52861 ) ( TRUCK-AT ?auto_52860 ?auto_52863 ) ( not ( = ?auto_52863 ?auto_52862 ) ) ( HOIST-AT ?auto_52864 ?auto_52863 ) ( LIFTING ?auto_52864 ?auto_52858 ) ( not ( = ?auto_52861 ?auto_52864 ) ) )
    :subtasks
    ( ( !LOAD ?auto_52864 ?auto_52858 ?auto_52860 ?auto_52863 )
      ( MAKE-ON ?auto_52858 ?auto_52859 )
      ( MAKE-ON-VERIFY ?auto_52858 ?auto_52859 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52865 - SURFACE
      ?auto_52866 - SURFACE
    )
    :vars
    (
      ?auto_52870 - HOIST
      ?auto_52867 - PLACE
      ?auto_52869 - TRUCK
      ?auto_52868 - PLACE
      ?auto_52871 - HOIST
      ?auto_52872 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52870 ?auto_52867 ) ( SURFACE-AT ?auto_52866 ?auto_52867 ) ( CLEAR ?auto_52866 ) ( IS-CRATE ?auto_52865 ) ( not ( = ?auto_52865 ?auto_52866 ) ) ( AVAILABLE ?auto_52870 ) ( TRUCK-AT ?auto_52869 ?auto_52868 ) ( not ( = ?auto_52868 ?auto_52867 ) ) ( HOIST-AT ?auto_52871 ?auto_52868 ) ( not ( = ?auto_52870 ?auto_52871 ) ) ( AVAILABLE ?auto_52871 ) ( SURFACE-AT ?auto_52865 ?auto_52868 ) ( ON ?auto_52865 ?auto_52872 ) ( CLEAR ?auto_52865 ) ( not ( = ?auto_52865 ?auto_52872 ) ) ( not ( = ?auto_52866 ?auto_52872 ) ) )
    :subtasks
    ( ( !LIFT ?auto_52871 ?auto_52865 ?auto_52872 ?auto_52868 )
      ( MAKE-ON ?auto_52865 ?auto_52866 )
      ( MAKE-ON-VERIFY ?auto_52865 ?auto_52866 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52873 - SURFACE
      ?auto_52874 - SURFACE
    )
    :vars
    (
      ?auto_52875 - HOIST
      ?auto_52876 - PLACE
      ?auto_52879 - PLACE
      ?auto_52877 - HOIST
      ?auto_52880 - SURFACE
      ?auto_52878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52875 ?auto_52876 ) ( SURFACE-AT ?auto_52874 ?auto_52876 ) ( CLEAR ?auto_52874 ) ( IS-CRATE ?auto_52873 ) ( not ( = ?auto_52873 ?auto_52874 ) ) ( AVAILABLE ?auto_52875 ) ( not ( = ?auto_52879 ?auto_52876 ) ) ( HOIST-AT ?auto_52877 ?auto_52879 ) ( not ( = ?auto_52875 ?auto_52877 ) ) ( AVAILABLE ?auto_52877 ) ( SURFACE-AT ?auto_52873 ?auto_52879 ) ( ON ?auto_52873 ?auto_52880 ) ( CLEAR ?auto_52873 ) ( not ( = ?auto_52873 ?auto_52880 ) ) ( not ( = ?auto_52874 ?auto_52880 ) ) ( TRUCK-AT ?auto_52878 ?auto_52876 ) )
    :subtasks
    ( ( !DRIVE ?auto_52878 ?auto_52876 ?auto_52879 )
      ( MAKE-ON ?auto_52873 ?auto_52874 )
      ( MAKE-ON-VERIFY ?auto_52873 ?auto_52874 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52881 - SURFACE
      ?auto_52882 - SURFACE
    )
    :vars
    (
      ?auto_52887 - HOIST
      ?auto_52883 - PLACE
      ?auto_52885 - PLACE
      ?auto_52884 - HOIST
      ?auto_52886 - SURFACE
      ?auto_52888 - TRUCK
      ?auto_52889 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52887 ?auto_52883 ) ( IS-CRATE ?auto_52881 ) ( not ( = ?auto_52881 ?auto_52882 ) ) ( not ( = ?auto_52885 ?auto_52883 ) ) ( HOIST-AT ?auto_52884 ?auto_52885 ) ( not ( = ?auto_52887 ?auto_52884 ) ) ( AVAILABLE ?auto_52884 ) ( SURFACE-AT ?auto_52881 ?auto_52885 ) ( ON ?auto_52881 ?auto_52886 ) ( CLEAR ?auto_52881 ) ( not ( = ?auto_52881 ?auto_52886 ) ) ( not ( = ?auto_52882 ?auto_52886 ) ) ( TRUCK-AT ?auto_52888 ?auto_52883 ) ( SURFACE-AT ?auto_52889 ?auto_52883 ) ( CLEAR ?auto_52889 ) ( LIFTING ?auto_52887 ?auto_52882 ) ( IS-CRATE ?auto_52882 ) ( not ( = ?auto_52881 ?auto_52889 ) ) ( not ( = ?auto_52882 ?auto_52889 ) ) ( not ( = ?auto_52886 ?auto_52889 ) ) )
    :subtasks
    ( ( !DROP ?auto_52887 ?auto_52882 ?auto_52889 ?auto_52883 )
      ( MAKE-ON ?auto_52881 ?auto_52882 )
      ( MAKE-ON-VERIFY ?auto_52881 ?auto_52882 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52890 - SURFACE
      ?auto_52891 - SURFACE
    )
    :vars
    (
      ?auto_52898 - HOIST
      ?auto_52892 - PLACE
      ?auto_52895 - PLACE
      ?auto_52897 - HOIST
      ?auto_52896 - SURFACE
      ?auto_52893 - TRUCK
      ?auto_52894 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52898 ?auto_52892 ) ( IS-CRATE ?auto_52890 ) ( not ( = ?auto_52890 ?auto_52891 ) ) ( not ( = ?auto_52895 ?auto_52892 ) ) ( HOIST-AT ?auto_52897 ?auto_52895 ) ( not ( = ?auto_52898 ?auto_52897 ) ) ( AVAILABLE ?auto_52897 ) ( SURFACE-AT ?auto_52890 ?auto_52895 ) ( ON ?auto_52890 ?auto_52896 ) ( CLEAR ?auto_52890 ) ( not ( = ?auto_52890 ?auto_52896 ) ) ( not ( = ?auto_52891 ?auto_52896 ) ) ( TRUCK-AT ?auto_52893 ?auto_52892 ) ( SURFACE-AT ?auto_52894 ?auto_52892 ) ( CLEAR ?auto_52894 ) ( IS-CRATE ?auto_52891 ) ( not ( = ?auto_52890 ?auto_52894 ) ) ( not ( = ?auto_52891 ?auto_52894 ) ) ( not ( = ?auto_52896 ?auto_52894 ) ) ( AVAILABLE ?auto_52898 ) ( IN ?auto_52891 ?auto_52893 ) )
    :subtasks
    ( ( !UNLOAD ?auto_52898 ?auto_52891 ?auto_52893 ?auto_52892 )
      ( MAKE-ON ?auto_52890 ?auto_52891 )
      ( MAKE-ON-VERIFY ?auto_52890 ?auto_52891 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52899 - SURFACE
      ?auto_52900 - SURFACE
    )
    :vars
    (
      ?auto_52907 - HOIST
      ?auto_52906 - PLACE
      ?auto_52901 - PLACE
      ?auto_52905 - HOIST
      ?auto_52902 - SURFACE
      ?auto_52903 - SURFACE
      ?auto_52904 - TRUCK
      ?auto_52908 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52907 ?auto_52906 ) ( IS-CRATE ?auto_52899 ) ( not ( = ?auto_52899 ?auto_52900 ) ) ( not ( = ?auto_52901 ?auto_52906 ) ) ( HOIST-AT ?auto_52905 ?auto_52901 ) ( not ( = ?auto_52907 ?auto_52905 ) ) ( AVAILABLE ?auto_52905 ) ( SURFACE-AT ?auto_52899 ?auto_52901 ) ( ON ?auto_52899 ?auto_52902 ) ( CLEAR ?auto_52899 ) ( not ( = ?auto_52899 ?auto_52902 ) ) ( not ( = ?auto_52900 ?auto_52902 ) ) ( SURFACE-AT ?auto_52903 ?auto_52906 ) ( CLEAR ?auto_52903 ) ( IS-CRATE ?auto_52900 ) ( not ( = ?auto_52899 ?auto_52903 ) ) ( not ( = ?auto_52900 ?auto_52903 ) ) ( not ( = ?auto_52902 ?auto_52903 ) ) ( AVAILABLE ?auto_52907 ) ( IN ?auto_52900 ?auto_52904 ) ( TRUCK-AT ?auto_52904 ?auto_52908 ) ( not ( = ?auto_52908 ?auto_52906 ) ) ( not ( = ?auto_52901 ?auto_52908 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_52904 ?auto_52908 ?auto_52906 )
      ( MAKE-ON ?auto_52899 ?auto_52900 )
      ( MAKE-ON-VERIFY ?auto_52899 ?auto_52900 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52909 - SURFACE
      ?auto_52910 - SURFACE
    )
    :vars
    (
      ?auto_52913 - HOIST
      ?auto_52911 - PLACE
      ?auto_52914 - PLACE
      ?auto_52918 - HOIST
      ?auto_52917 - SURFACE
      ?auto_52916 - SURFACE
      ?auto_52915 - TRUCK
      ?auto_52912 - PLACE
      ?auto_52919 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_52913 ?auto_52911 ) ( IS-CRATE ?auto_52909 ) ( not ( = ?auto_52909 ?auto_52910 ) ) ( not ( = ?auto_52914 ?auto_52911 ) ) ( HOIST-AT ?auto_52918 ?auto_52914 ) ( not ( = ?auto_52913 ?auto_52918 ) ) ( AVAILABLE ?auto_52918 ) ( SURFACE-AT ?auto_52909 ?auto_52914 ) ( ON ?auto_52909 ?auto_52917 ) ( CLEAR ?auto_52909 ) ( not ( = ?auto_52909 ?auto_52917 ) ) ( not ( = ?auto_52910 ?auto_52917 ) ) ( SURFACE-AT ?auto_52916 ?auto_52911 ) ( CLEAR ?auto_52916 ) ( IS-CRATE ?auto_52910 ) ( not ( = ?auto_52909 ?auto_52916 ) ) ( not ( = ?auto_52910 ?auto_52916 ) ) ( not ( = ?auto_52917 ?auto_52916 ) ) ( AVAILABLE ?auto_52913 ) ( TRUCK-AT ?auto_52915 ?auto_52912 ) ( not ( = ?auto_52912 ?auto_52911 ) ) ( not ( = ?auto_52914 ?auto_52912 ) ) ( HOIST-AT ?auto_52919 ?auto_52912 ) ( LIFTING ?auto_52919 ?auto_52910 ) ( not ( = ?auto_52913 ?auto_52919 ) ) ( not ( = ?auto_52918 ?auto_52919 ) ) )
    :subtasks
    ( ( !LOAD ?auto_52919 ?auto_52910 ?auto_52915 ?auto_52912 )
      ( MAKE-ON ?auto_52909 ?auto_52910 )
      ( MAKE-ON-VERIFY ?auto_52909 ?auto_52910 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52920 - SURFACE
      ?auto_52921 - SURFACE
    )
    :vars
    (
      ?auto_52926 - HOIST
      ?auto_52928 - PLACE
      ?auto_52924 - PLACE
      ?auto_52922 - HOIST
      ?auto_52929 - SURFACE
      ?auto_52930 - SURFACE
      ?auto_52923 - TRUCK
      ?auto_52925 - PLACE
      ?auto_52927 - HOIST
      ?auto_52931 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52926 ?auto_52928 ) ( IS-CRATE ?auto_52920 ) ( not ( = ?auto_52920 ?auto_52921 ) ) ( not ( = ?auto_52924 ?auto_52928 ) ) ( HOIST-AT ?auto_52922 ?auto_52924 ) ( not ( = ?auto_52926 ?auto_52922 ) ) ( AVAILABLE ?auto_52922 ) ( SURFACE-AT ?auto_52920 ?auto_52924 ) ( ON ?auto_52920 ?auto_52929 ) ( CLEAR ?auto_52920 ) ( not ( = ?auto_52920 ?auto_52929 ) ) ( not ( = ?auto_52921 ?auto_52929 ) ) ( SURFACE-AT ?auto_52930 ?auto_52928 ) ( CLEAR ?auto_52930 ) ( IS-CRATE ?auto_52921 ) ( not ( = ?auto_52920 ?auto_52930 ) ) ( not ( = ?auto_52921 ?auto_52930 ) ) ( not ( = ?auto_52929 ?auto_52930 ) ) ( AVAILABLE ?auto_52926 ) ( TRUCK-AT ?auto_52923 ?auto_52925 ) ( not ( = ?auto_52925 ?auto_52928 ) ) ( not ( = ?auto_52924 ?auto_52925 ) ) ( HOIST-AT ?auto_52927 ?auto_52925 ) ( not ( = ?auto_52926 ?auto_52927 ) ) ( not ( = ?auto_52922 ?auto_52927 ) ) ( AVAILABLE ?auto_52927 ) ( SURFACE-AT ?auto_52921 ?auto_52925 ) ( ON ?auto_52921 ?auto_52931 ) ( CLEAR ?auto_52921 ) ( not ( = ?auto_52920 ?auto_52931 ) ) ( not ( = ?auto_52921 ?auto_52931 ) ) ( not ( = ?auto_52929 ?auto_52931 ) ) ( not ( = ?auto_52930 ?auto_52931 ) ) )
    :subtasks
    ( ( !LIFT ?auto_52927 ?auto_52921 ?auto_52931 ?auto_52925 )
      ( MAKE-ON ?auto_52920 ?auto_52921 )
      ( MAKE-ON-VERIFY ?auto_52920 ?auto_52921 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52932 - SURFACE
      ?auto_52933 - SURFACE
    )
    :vars
    (
      ?auto_52938 - HOIST
      ?auto_52937 - PLACE
      ?auto_52940 - PLACE
      ?auto_52943 - HOIST
      ?auto_52936 - SURFACE
      ?auto_52939 - SURFACE
      ?auto_52934 - PLACE
      ?auto_52935 - HOIST
      ?auto_52942 - SURFACE
      ?auto_52941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52938 ?auto_52937 ) ( IS-CRATE ?auto_52932 ) ( not ( = ?auto_52932 ?auto_52933 ) ) ( not ( = ?auto_52940 ?auto_52937 ) ) ( HOIST-AT ?auto_52943 ?auto_52940 ) ( not ( = ?auto_52938 ?auto_52943 ) ) ( AVAILABLE ?auto_52943 ) ( SURFACE-AT ?auto_52932 ?auto_52940 ) ( ON ?auto_52932 ?auto_52936 ) ( CLEAR ?auto_52932 ) ( not ( = ?auto_52932 ?auto_52936 ) ) ( not ( = ?auto_52933 ?auto_52936 ) ) ( SURFACE-AT ?auto_52939 ?auto_52937 ) ( CLEAR ?auto_52939 ) ( IS-CRATE ?auto_52933 ) ( not ( = ?auto_52932 ?auto_52939 ) ) ( not ( = ?auto_52933 ?auto_52939 ) ) ( not ( = ?auto_52936 ?auto_52939 ) ) ( AVAILABLE ?auto_52938 ) ( not ( = ?auto_52934 ?auto_52937 ) ) ( not ( = ?auto_52940 ?auto_52934 ) ) ( HOIST-AT ?auto_52935 ?auto_52934 ) ( not ( = ?auto_52938 ?auto_52935 ) ) ( not ( = ?auto_52943 ?auto_52935 ) ) ( AVAILABLE ?auto_52935 ) ( SURFACE-AT ?auto_52933 ?auto_52934 ) ( ON ?auto_52933 ?auto_52942 ) ( CLEAR ?auto_52933 ) ( not ( = ?auto_52932 ?auto_52942 ) ) ( not ( = ?auto_52933 ?auto_52942 ) ) ( not ( = ?auto_52936 ?auto_52942 ) ) ( not ( = ?auto_52939 ?auto_52942 ) ) ( TRUCK-AT ?auto_52941 ?auto_52937 ) )
    :subtasks
    ( ( !DRIVE ?auto_52941 ?auto_52937 ?auto_52934 )
      ( MAKE-ON ?auto_52932 ?auto_52933 )
      ( MAKE-ON-VERIFY ?auto_52932 ?auto_52933 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52944 - SURFACE
      ?auto_52945 - SURFACE
    )
    :vars
    (
      ?auto_52951 - HOIST
      ?auto_52952 - PLACE
      ?auto_52946 - PLACE
      ?auto_52950 - HOIST
      ?auto_52949 - SURFACE
      ?auto_52954 - SURFACE
      ?auto_52948 - PLACE
      ?auto_52955 - HOIST
      ?auto_52947 - SURFACE
      ?auto_52953 - TRUCK
      ?auto_52956 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52951 ?auto_52952 ) ( IS-CRATE ?auto_52944 ) ( not ( = ?auto_52944 ?auto_52945 ) ) ( not ( = ?auto_52946 ?auto_52952 ) ) ( HOIST-AT ?auto_52950 ?auto_52946 ) ( not ( = ?auto_52951 ?auto_52950 ) ) ( AVAILABLE ?auto_52950 ) ( SURFACE-AT ?auto_52944 ?auto_52946 ) ( ON ?auto_52944 ?auto_52949 ) ( CLEAR ?auto_52944 ) ( not ( = ?auto_52944 ?auto_52949 ) ) ( not ( = ?auto_52945 ?auto_52949 ) ) ( IS-CRATE ?auto_52945 ) ( not ( = ?auto_52944 ?auto_52954 ) ) ( not ( = ?auto_52945 ?auto_52954 ) ) ( not ( = ?auto_52949 ?auto_52954 ) ) ( not ( = ?auto_52948 ?auto_52952 ) ) ( not ( = ?auto_52946 ?auto_52948 ) ) ( HOIST-AT ?auto_52955 ?auto_52948 ) ( not ( = ?auto_52951 ?auto_52955 ) ) ( not ( = ?auto_52950 ?auto_52955 ) ) ( AVAILABLE ?auto_52955 ) ( SURFACE-AT ?auto_52945 ?auto_52948 ) ( ON ?auto_52945 ?auto_52947 ) ( CLEAR ?auto_52945 ) ( not ( = ?auto_52944 ?auto_52947 ) ) ( not ( = ?auto_52945 ?auto_52947 ) ) ( not ( = ?auto_52949 ?auto_52947 ) ) ( not ( = ?auto_52954 ?auto_52947 ) ) ( TRUCK-AT ?auto_52953 ?auto_52952 ) ( SURFACE-AT ?auto_52956 ?auto_52952 ) ( CLEAR ?auto_52956 ) ( LIFTING ?auto_52951 ?auto_52954 ) ( IS-CRATE ?auto_52954 ) ( not ( = ?auto_52944 ?auto_52956 ) ) ( not ( = ?auto_52945 ?auto_52956 ) ) ( not ( = ?auto_52949 ?auto_52956 ) ) ( not ( = ?auto_52954 ?auto_52956 ) ) ( not ( = ?auto_52947 ?auto_52956 ) ) )
    :subtasks
    ( ( !DROP ?auto_52951 ?auto_52954 ?auto_52956 ?auto_52952 )
      ( MAKE-ON ?auto_52944 ?auto_52945 )
      ( MAKE-ON-VERIFY ?auto_52944 ?auto_52945 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52957 - SURFACE
      ?auto_52958 - SURFACE
    )
    :vars
    (
      ?auto_52963 - HOIST
      ?auto_52969 - PLACE
      ?auto_52959 - PLACE
      ?auto_52966 - HOIST
      ?auto_52965 - SURFACE
      ?auto_52967 - SURFACE
      ?auto_52962 - PLACE
      ?auto_52968 - HOIST
      ?auto_52964 - SURFACE
      ?auto_52961 - TRUCK
      ?auto_52960 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52963 ?auto_52969 ) ( IS-CRATE ?auto_52957 ) ( not ( = ?auto_52957 ?auto_52958 ) ) ( not ( = ?auto_52959 ?auto_52969 ) ) ( HOIST-AT ?auto_52966 ?auto_52959 ) ( not ( = ?auto_52963 ?auto_52966 ) ) ( AVAILABLE ?auto_52966 ) ( SURFACE-AT ?auto_52957 ?auto_52959 ) ( ON ?auto_52957 ?auto_52965 ) ( CLEAR ?auto_52957 ) ( not ( = ?auto_52957 ?auto_52965 ) ) ( not ( = ?auto_52958 ?auto_52965 ) ) ( IS-CRATE ?auto_52958 ) ( not ( = ?auto_52957 ?auto_52967 ) ) ( not ( = ?auto_52958 ?auto_52967 ) ) ( not ( = ?auto_52965 ?auto_52967 ) ) ( not ( = ?auto_52962 ?auto_52969 ) ) ( not ( = ?auto_52959 ?auto_52962 ) ) ( HOIST-AT ?auto_52968 ?auto_52962 ) ( not ( = ?auto_52963 ?auto_52968 ) ) ( not ( = ?auto_52966 ?auto_52968 ) ) ( AVAILABLE ?auto_52968 ) ( SURFACE-AT ?auto_52958 ?auto_52962 ) ( ON ?auto_52958 ?auto_52964 ) ( CLEAR ?auto_52958 ) ( not ( = ?auto_52957 ?auto_52964 ) ) ( not ( = ?auto_52958 ?auto_52964 ) ) ( not ( = ?auto_52965 ?auto_52964 ) ) ( not ( = ?auto_52967 ?auto_52964 ) ) ( TRUCK-AT ?auto_52961 ?auto_52969 ) ( SURFACE-AT ?auto_52960 ?auto_52969 ) ( CLEAR ?auto_52960 ) ( IS-CRATE ?auto_52967 ) ( not ( = ?auto_52957 ?auto_52960 ) ) ( not ( = ?auto_52958 ?auto_52960 ) ) ( not ( = ?auto_52965 ?auto_52960 ) ) ( not ( = ?auto_52967 ?auto_52960 ) ) ( not ( = ?auto_52964 ?auto_52960 ) ) ( AVAILABLE ?auto_52963 ) ( IN ?auto_52967 ?auto_52961 ) )
    :subtasks
    ( ( !UNLOAD ?auto_52963 ?auto_52967 ?auto_52961 ?auto_52969 )
      ( MAKE-ON ?auto_52957 ?auto_52958 )
      ( MAKE-ON-VERIFY ?auto_52957 ?auto_52958 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52970 - SURFACE
      ?auto_52971 - SURFACE
    )
    :vars
    (
      ?auto_52981 - HOIST
      ?auto_52974 - PLACE
      ?auto_52972 - PLACE
      ?auto_52980 - HOIST
      ?auto_52978 - SURFACE
      ?auto_52977 - SURFACE
      ?auto_52975 - PLACE
      ?auto_52979 - HOIST
      ?auto_52973 - SURFACE
      ?auto_52976 - SURFACE
      ?auto_52982 - TRUCK
      ?auto_52983 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52981 ?auto_52974 ) ( IS-CRATE ?auto_52970 ) ( not ( = ?auto_52970 ?auto_52971 ) ) ( not ( = ?auto_52972 ?auto_52974 ) ) ( HOIST-AT ?auto_52980 ?auto_52972 ) ( not ( = ?auto_52981 ?auto_52980 ) ) ( AVAILABLE ?auto_52980 ) ( SURFACE-AT ?auto_52970 ?auto_52972 ) ( ON ?auto_52970 ?auto_52978 ) ( CLEAR ?auto_52970 ) ( not ( = ?auto_52970 ?auto_52978 ) ) ( not ( = ?auto_52971 ?auto_52978 ) ) ( IS-CRATE ?auto_52971 ) ( not ( = ?auto_52970 ?auto_52977 ) ) ( not ( = ?auto_52971 ?auto_52977 ) ) ( not ( = ?auto_52978 ?auto_52977 ) ) ( not ( = ?auto_52975 ?auto_52974 ) ) ( not ( = ?auto_52972 ?auto_52975 ) ) ( HOIST-AT ?auto_52979 ?auto_52975 ) ( not ( = ?auto_52981 ?auto_52979 ) ) ( not ( = ?auto_52980 ?auto_52979 ) ) ( AVAILABLE ?auto_52979 ) ( SURFACE-AT ?auto_52971 ?auto_52975 ) ( ON ?auto_52971 ?auto_52973 ) ( CLEAR ?auto_52971 ) ( not ( = ?auto_52970 ?auto_52973 ) ) ( not ( = ?auto_52971 ?auto_52973 ) ) ( not ( = ?auto_52978 ?auto_52973 ) ) ( not ( = ?auto_52977 ?auto_52973 ) ) ( SURFACE-AT ?auto_52976 ?auto_52974 ) ( CLEAR ?auto_52976 ) ( IS-CRATE ?auto_52977 ) ( not ( = ?auto_52970 ?auto_52976 ) ) ( not ( = ?auto_52971 ?auto_52976 ) ) ( not ( = ?auto_52978 ?auto_52976 ) ) ( not ( = ?auto_52977 ?auto_52976 ) ) ( not ( = ?auto_52973 ?auto_52976 ) ) ( AVAILABLE ?auto_52981 ) ( IN ?auto_52977 ?auto_52982 ) ( TRUCK-AT ?auto_52982 ?auto_52983 ) ( not ( = ?auto_52983 ?auto_52974 ) ) ( not ( = ?auto_52972 ?auto_52983 ) ) ( not ( = ?auto_52975 ?auto_52983 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_52982 ?auto_52983 ?auto_52974 )
      ( MAKE-ON ?auto_52970 ?auto_52971 )
      ( MAKE-ON-VERIFY ?auto_52970 ?auto_52971 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52984 - SURFACE
      ?auto_52985 - SURFACE
    )
    :vars
    (
      ?auto_52997 - HOIST
      ?auto_52989 - PLACE
      ?auto_52988 - PLACE
      ?auto_52993 - HOIST
      ?auto_52986 - SURFACE
      ?auto_52995 - SURFACE
      ?auto_52991 - PLACE
      ?auto_52996 - HOIST
      ?auto_52992 - SURFACE
      ?auto_52994 - SURFACE
      ?auto_52990 - TRUCK
      ?auto_52987 - PLACE
      ?auto_52998 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_52997 ?auto_52989 ) ( IS-CRATE ?auto_52984 ) ( not ( = ?auto_52984 ?auto_52985 ) ) ( not ( = ?auto_52988 ?auto_52989 ) ) ( HOIST-AT ?auto_52993 ?auto_52988 ) ( not ( = ?auto_52997 ?auto_52993 ) ) ( AVAILABLE ?auto_52993 ) ( SURFACE-AT ?auto_52984 ?auto_52988 ) ( ON ?auto_52984 ?auto_52986 ) ( CLEAR ?auto_52984 ) ( not ( = ?auto_52984 ?auto_52986 ) ) ( not ( = ?auto_52985 ?auto_52986 ) ) ( IS-CRATE ?auto_52985 ) ( not ( = ?auto_52984 ?auto_52995 ) ) ( not ( = ?auto_52985 ?auto_52995 ) ) ( not ( = ?auto_52986 ?auto_52995 ) ) ( not ( = ?auto_52991 ?auto_52989 ) ) ( not ( = ?auto_52988 ?auto_52991 ) ) ( HOIST-AT ?auto_52996 ?auto_52991 ) ( not ( = ?auto_52997 ?auto_52996 ) ) ( not ( = ?auto_52993 ?auto_52996 ) ) ( AVAILABLE ?auto_52996 ) ( SURFACE-AT ?auto_52985 ?auto_52991 ) ( ON ?auto_52985 ?auto_52992 ) ( CLEAR ?auto_52985 ) ( not ( = ?auto_52984 ?auto_52992 ) ) ( not ( = ?auto_52985 ?auto_52992 ) ) ( not ( = ?auto_52986 ?auto_52992 ) ) ( not ( = ?auto_52995 ?auto_52992 ) ) ( SURFACE-AT ?auto_52994 ?auto_52989 ) ( CLEAR ?auto_52994 ) ( IS-CRATE ?auto_52995 ) ( not ( = ?auto_52984 ?auto_52994 ) ) ( not ( = ?auto_52985 ?auto_52994 ) ) ( not ( = ?auto_52986 ?auto_52994 ) ) ( not ( = ?auto_52995 ?auto_52994 ) ) ( not ( = ?auto_52992 ?auto_52994 ) ) ( AVAILABLE ?auto_52997 ) ( TRUCK-AT ?auto_52990 ?auto_52987 ) ( not ( = ?auto_52987 ?auto_52989 ) ) ( not ( = ?auto_52988 ?auto_52987 ) ) ( not ( = ?auto_52991 ?auto_52987 ) ) ( HOIST-AT ?auto_52998 ?auto_52987 ) ( LIFTING ?auto_52998 ?auto_52995 ) ( not ( = ?auto_52997 ?auto_52998 ) ) ( not ( = ?auto_52993 ?auto_52998 ) ) ( not ( = ?auto_52996 ?auto_52998 ) ) )
    :subtasks
    ( ( !LOAD ?auto_52998 ?auto_52995 ?auto_52990 ?auto_52987 )
      ( MAKE-ON ?auto_52984 ?auto_52985 )
      ( MAKE-ON-VERIFY ?auto_52984 ?auto_52985 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_52999 - SURFACE
      ?auto_53000 - SURFACE
    )
    :vars
    (
      ?auto_53009 - HOIST
      ?auto_53012 - PLACE
      ?auto_53004 - PLACE
      ?auto_53003 - HOIST
      ?auto_53008 - SURFACE
      ?auto_53002 - SURFACE
      ?auto_53001 - PLACE
      ?auto_53011 - HOIST
      ?auto_53006 - SURFACE
      ?auto_53007 - SURFACE
      ?auto_53010 - TRUCK
      ?auto_53013 - PLACE
      ?auto_53005 - HOIST
      ?auto_53014 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53009 ?auto_53012 ) ( IS-CRATE ?auto_52999 ) ( not ( = ?auto_52999 ?auto_53000 ) ) ( not ( = ?auto_53004 ?auto_53012 ) ) ( HOIST-AT ?auto_53003 ?auto_53004 ) ( not ( = ?auto_53009 ?auto_53003 ) ) ( AVAILABLE ?auto_53003 ) ( SURFACE-AT ?auto_52999 ?auto_53004 ) ( ON ?auto_52999 ?auto_53008 ) ( CLEAR ?auto_52999 ) ( not ( = ?auto_52999 ?auto_53008 ) ) ( not ( = ?auto_53000 ?auto_53008 ) ) ( IS-CRATE ?auto_53000 ) ( not ( = ?auto_52999 ?auto_53002 ) ) ( not ( = ?auto_53000 ?auto_53002 ) ) ( not ( = ?auto_53008 ?auto_53002 ) ) ( not ( = ?auto_53001 ?auto_53012 ) ) ( not ( = ?auto_53004 ?auto_53001 ) ) ( HOIST-AT ?auto_53011 ?auto_53001 ) ( not ( = ?auto_53009 ?auto_53011 ) ) ( not ( = ?auto_53003 ?auto_53011 ) ) ( AVAILABLE ?auto_53011 ) ( SURFACE-AT ?auto_53000 ?auto_53001 ) ( ON ?auto_53000 ?auto_53006 ) ( CLEAR ?auto_53000 ) ( not ( = ?auto_52999 ?auto_53006 ) ) ( not ( = ?auto_53000 ?auto_53006 ) ) ( not ( = ?auto_53008 ?auto_53006 ) ) ( not ( = ?auto_53002 ?auto_53006 ) ) ( SURFACE-AT ?auto_53007 ?auto_53012 ) ( CLEAR ?auto_53007 ) ( IS-CRATE ?auto_53002 ) ( not ( = ?auto_52999 ?auto_53007 ) ) ( not ( = ?auto_53000 ?auto_53007 ) ) ( not ( = ?auto_53008 ?auto_53007 ) ) ( not ( = ?auto_53002 ?auto_53007 ) ) ( not ( = ?auto_53006 ?auto_53007 ) ) ( AVAILABLE ?auto_53009 ) ( TRUCK-AT ?auto_53010 ?auto_53013 ) ( not ( = ?auto_53013 ?auto_53012 ) ) ( not ( = ?auto_53004 ?auto_53013 ) ) ( not ( = ?auto_53001 ?auto_53013 ) ) ( HOIST-AT ?auto_53005 ?auto_53013 ) ( not ( = ?auto_53009 ?auto_53005 ) ) ( not ( = ?auto_53003 ?auto_53005 ) ) ( not ( = ?auto_53011 ?auto_53005 ) ) ( AVAILABLE ?auto_53005 ) ( SURFACE-AT ?auto_53002 ?auto_53013 ) ( ON ?auto_53002 ?auto_53014 ) ( CLEAR ?auto_53002 ) ( not ( = ?auto_52999 ?auto_53014 ) ) ( not ( = ?auto_53000 ?auto_53014 ) ) ( not ( = ?auto_53008 ?auto_53014 ) ) ( not ( = ?auto_53002 ?auto_53014 ) ) ( not ( = ?auto_53006 ?auto_53014 ) ) ( not ( = ?auto_53007 ?auto_53014 ) ) )
    :subtasks
    ( ( !LIFT ?auto_53005 ?auto_53002 ?auto_53014 ?auto_53013 )
      ( MAKE-ON ?auto_52999 ?auto_53000 )
      ( MAKE-ON-VERIFY ?auto_52999 ?auto_53000 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53015 - SURFACE
      ?auto_53016 - SURFACE
    )
    :vars
    (
      ?auto_53018 - HOIST
      ?auto_53025 - PLACE
      ?auto_53030 - PLACE
      ?auto_53021 - HOIST
      ?auto_53024 - SURFACE
      ?auto_53026 - SURFACE
      ?auto_53022 - PLACE
      ?auto_53029 - HOIST
      ?auto_53027 - SURFACE
      ?auto_53017 - SURFACE
      ?auto_53023 - PLACE
      ?auto_53028 - HOIST
      ?auto_53019 - SURFACE
      ?auto_53020 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53018 ?auto_53025 ) ( IS-CRATE ?auto_53015 ) ( not ( = ?auto_53015 ?auto_53016 ) ) ( not ( = ?auto_53030 ?auto_53025 ) ) ( HOIST-AT ?auto_53021 ?auto_53030 ) ( not ( = ?auto_53018 ?auto_53021 ) ) ( AVAILABLE ?auto_53021 ) ( SURFACE-AT ?auto_53015 ?auto_53030 ) ( ON ?auto_53015 ?auto_53024 ) ( CLEAR ?auto_53015 ) ( not ( = ?auto_53015 ?auto_53024 ) ) ( not ( = ?auto_53016 ?auto_53024 ) ) ( IS-CRATE ?auto_53016 ) ( not ( = ?auto_53015 ?auto_53026 ) ) ( not ( = ?auto_53016 ?auto_53026 ) ) ( not ( = ?auto_53024 ?auto_53026 ) ) ( not ( = ?auto_53022 ?auto_53025 ) ) ( not ( = ?auto_53030 ?auto_53022 ) ) ( HOIST-AT ?auto_53029 ?auto_53022 ) ( not ( = ?auto_53018 ?auto_53029 ) ) ( not ( = ?auto_53021 ?auto_53029 ) ) ( AVAILABLE ?auto_53029 ) ( SURFACE-AT ?auto_53016 ?auto_53022 ) ( ON ?auto_53016 ?auto_53027 ) ( CLEAR ?auto_53016 ) ( not ( = ?auto_53015 ?auto_53027 ) ) ( not ( = ?auto_53016 ?auto_53027 ) ) ( not ( = ?auto_53024 ?auto_53027 ) ) ( not ( = ?auto_53026 ?auto_53027 ) ) ( SURFACE-AT ?auto_53017 ?auto_53025 ) ( CLEAR ?auto_53017 ) ( IS-CRATE ?auto_53026 ) ( not ( = ?auto_53015 ?auto_53017 ) ) ( not ( = ?auto_53016 ?auto_53017 ) ) ( not ( = ?auto_53024 ?auto_53017 ) ) ( not ( = ?auto_53026 ?auto_53017 ) ) ( not ( = ?auto_53027 ?auto_53017 ) ) ( AVAILABLE ?auto_53018 ) ( not ( = ?auto_53023 ?auto_53025 ) ) ( not ( = ?auto_53030 ?auto_53023 ) ) ( not ( = ?auto_53022 ?auto_53023 ) ) ( HOIST-AT ?auto_53028 ?auto_53023 ) ( not ( = ?auto_53018 ?auto_53028 ) ) ( not ( = ?auto_53021 ?auto_53028 ) ) ( not ( = ?auto_53029 ?auto_53028 ) ) ( AVAILABLE ?auto_53028 ) ( SURFACE-AT ?auto_53026 ?auto_53023 ) ( ON ?auto_53026 ?auto_53019 ) ( CLEAR ?auto_53026 ) ( not ( = ?auto_53015 ?auto_53019 ) ) ( not ( = ?auto_53016 ?auto_53019 ) ) ( not ( = ?auto_53024 ?auto_53019 ) ) ( not ( = ?auto_53026 ?auto_53019 ) ) ( not ( = ?auto_53027 ?auto_53019 ) ) ( not ( = ?auto_53017 ?auto_53019 ) ) ( TRUCK-AT ?auto_53020 ?auto_53025 ) )
    :subtasks
    ( ( !DRIVE ?auto_53020 ?auto_53025 ?auto_53023 )
      ( MAKE-ON ?auto_53015 ?auto_53016 )
      ( MAKE-ON-VERIFY ?auto_53015 ?auto_53016 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53031 - SURFACE
      ?auto_53032 - SURFACE
    )
    :vars
    (
      ?auto_53033 - HOIST
      ?auto_53034 - PLACE
      ?auto_53040 - PLACE
      ?auto_53042 - HOIST
      ?auto_53036 - SURFACE
      ?auto_53043 - SURFACE
      ?auto_53044 - PLACE
      ?auto_53041 - HOIST
      ?auto_53045 - SURFACE
      ?auto_53046 - SURFACE
      ?auto_53037 - PLACE
      ?auto_53035 - HOIST
      ?auto_53038 - SURFACE
      ?auto_53039 - TRUCK
      ?auto_53047 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53033 ?auto_53034 ) ( IS-CRATE ?auto_53031 ) ( not ( = ?auto_53031 ?auto_53032 ) ) ( not ( = ?auto_53040 ?auto_53034 ) ) ( HOIST-AT ?auto_53042 ?auto_53040 ) ( not ( = ?auto_53033 ?auto_53042 ) ) ( AVAILABLE ?auto_53042 ) ( SURFACE-AT ?auto_53031 ?auto_53040 ) ( ON ?auto_53031 ?auto_53036 ) ( CLEAR ?auto_53031 ) ( not ( = ?auto_53031 ?auto_53036 ) ) ( not ( = ?auto_53032 ?auto_53036 ) ) ( IS-CRATE ?auto_53032 ) ( not ( = ?auto_53031 ?auto_53043 ) ) ( not ( = ?auto_53032 ?auto_53043 ) ) ( not ( = ?auto_53036 ?auto_53043 ) ) ( not ( = ?auto_53044 ?auto_53034 ) ) ( not ( = ?auto_53040 ?auto_53044 ) ) ( HOIST-AT ?auto_53041 ?auto_53044 ) ( not ( = ?auto_53033 ?auto_53041 ) ) ( not ( = ?auto_53042 ?auto_53041 ) ) ( AVAILABLE ?auto_53041 ) ( SURFACE-AT ?auto_53032 ?auto_53044 ) ( ON ?auto_53032 ?auto_53045 ) ( CLEAR ?auto_53032 ) ( not ( = ?auto_53031 ?auto_53045 ) ) ( not ( = ?auto_53032 ?auto_53045 ) ) ( not ( = ?auto_53036 ?auto_53045 ) ) ( not ( = ?auto_53043 ?auto_53045 ) ) ( IS-CRATE ?auto_53043 ) ( not ( = ?auto_53031 ?auto_53046 ) ) ( not ( = ?auto_53032 ?auto_53046 ) ) ( not ( = ?auto_53036 ?auto_53046 ) ) ( not ( = ?auto_53043 ?auto_53046 ) ) ( not ( = ?auto_53045 ?auto_53046 ) ) ( not ( = ?auto_53037 ?auto_53034 ) ) ( not ( = ?auto_53040 ?auto_53037 ) ) ( not ( = ?auto_53044 ?auto_53037 ) ) ( HOIST-AT ?auto_53035 ?auto_53037 ) ( not ( = ?auto_53033 ?auto_53035 ) ) ( not ( = ?auto_53042 ?auto_53035 ) ) ( not ( = ?auto_53041 ?auto_53035 ) ) ( AVAILABLE ?auto_53035 ) ( SURFACE-AT ?auto_53043 ?auto_53037 ) ( ON ?auto_53043 ?auto_53038 ) ( CLEAR ?auto_53043 ) ( not ( = ?auto_53031 ?auto_53038 ) ) ( not ( = ?auto_53032 ?auto_53038 ) ) ( not ( = ?auto_53036 ?auto_53038 ) ) ( not ( = ?auto_53043 ?auto_53038 ) ) ( not ( = ?auto_53045 ?auto_53038 ) ) ( not ( = ?auto_53046 ?auto_53038 ) ) ( TRUCK-AT ?auto_53039 ?auto_53034 ) ( SURFACE-AT ?auto_53047 ?auto_53034 ) ( CLEAR ?auto_53047 ) ( LIFTING ?auto_53033 ?auto_53046 ) ( IS-CRATE ?auto_53046 ) ( not ( = ?auto_53031 ?auto_53047 ) ) ( not ( = ?auto_53032 ?auto_53047 ) ) ( not ( = ?auto_53036 ?auto_53047 ) ) ( not ( = ?auto_53043 ?auto_53047 ) ) ( not ( = ?auto_53045 ?auto_53047 ) ) ( not ( = ?auto_53046 ?auto_53047 ) ) ( not ( = ?auto_53038 ?auto_53047 ) ) )
    :subtasks
    ( ( !DROP ?auto_53033 ?auto_53046 ?auto_53047 ?auto_53034 )
      ( MAKE-ON ?auto_53031 ?auto_53032 )
      ( MAKE-ON-VERIFY ?auto_53031 ?auto_53032 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53048 - SURFACE
      ?auto_53049 - SURFACE
    )
    :vars
    (
      ?auto_53060 - HOIST
      ?auto_53056 - PLACE
      ?auto_53053 - PLACE
      ?auto_53061 - HOIST
      ?auto_53057 - SURFACE
      ?auto_53050 - SURFACE
      ?auto_53063 - PLACE
      ?auto_53064 - HOIST
      ?auto_53058 - SURFACE
      ?auto_53055 - SURFACE
      ?auto_53062 - PLACE
      ?auto_53059 - HOIST
      ?auto_53054 - SURFACE
      ?auto_53051 - TRUCK
      ?auto_53052 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53060 ?auto_53056 ) ( IS-CRATE ?auto_53048 ) ( not ( = ?auto_53048 ?auto_53049 ) ) ( not ( = ?auto_53053 ?auto_53056 ) ) ( HOIST-AT ?auto_53061 ?auto_53053 ) ( not ( = ?auto_53060 ?auto_53061 ) ) ( AVAILABLE ?auto_53061 ) ( SURFACE-AT ?auto_53048 ?auto_53053 ) ( ON ?auto_53048 ?auto_53057 ) ( CLEAR ?auto_53048 ) ( not ( = ?auto_53048 ?auto_53057 ) ) ( not ( = ?auto_53049 ?auto_53057 ) ) ( IS-CRATE ?auto_53049 ) ( not ( = ?auto_53048 ?auto_53050 ) ) ( not ( = ?auto_53049 ?auto_53050 ) ) ( not ( = ?auto_53057 ?auto_53050 ) ) ( not ( = ?auto_53063 ?auto_53056 ) ) ( not ( = ?auto_53053 ?auto_53063 ) ) ( HOIST-AT ?auto_53064 ?auto_53063 ) ( not ( = ?auto_53060 ?auto_53064 ) ) ( not ( = ?auto_53061 ?auto_53064 ) ) ( AVAILABLE ?auto_53064 ) ( SURFACE-AT ?auto_53049 ?auto_53063 ) ( ON ?auto_53049 ?auto_53058 ) ( CLEAR ?auto_53049 ) ( not ( = ?auto_53048 ?auto_53058 ) ) ( not ( = ?auto_53049 ?auto_53058 ) ) ( not ( = ?auto_53057 ?auto_53058 ) ) ( not ( = ?auto_53050 ?auto_53058 ) ) ( IS-CRATE ?auto_53050 ) ( not ( = ?auto_53048 ?auto_53055 ) ) ( not ( = ?auto_53049 ?auto_53055 ) ) ( not ( = ?auto_53057 ?auto_53055 ) ) ( not ( = ?auto_53050 ?auto_53055 ) ) ( not ( = ?auto_53058 ?auto_53055 ) ) ( not ( = ?auto_53062 ?auto_53056 ) ) ( not ( = ?auto_53053 ?auto_53062 ) ) ( not ( = ?auto_53063 ?auto_53062 ) ) ( HOIST-AT ?auto_53059 ?auto_53062 ) ( not ( = ?auto_53060 ?auto_53059 ) ) ( not ( = ?auto_53061 ?auto_53059 ) ) ( not ( = ?auto_53064 ?auto_53059 ) ) ( AVAILABLE ?auto_53059 ) ( SURFACE-AT ?auto_53050 ?auto_53062 ) ( ON ?auto_53050 ?auto_53054 ) ( CLEAR ?auto_53050 ) ( not ( = ?auto_53048 ?auto_53054 ) ) ( not ( = ?auto_53049 ?auto_53054 ) ) ( not ( = ?auto_53057 ?auto_53054 ) ) ( not ( = ?auto_53050 ?auto_53054 ) ) ( not ( = ?auto_53058 ?auto_53054 ) ) ( not ( = ?auto_53055 ?auto_53054 ) ) ( TRUCK-AT ?auto_53051 ?auto_53056 ) ( SURFACE-AT ?auto_53052 ?auto_53056 ) ( CLEAR ?auto_53052 ) ( IS-CRATE ?auto_53055 ) ( not ( = ?auto_53048 ?auto_53052 ) ) ( not ( = ?auto_53049 ?auto_53052 ) ) ( not ( = ?auto_53057 ?auto_53052 ) ) ( not ( = ?auto_53050 ?auto_53052 ) ) ( not ( = ?auto_53058 ?auto_53052 ) ) ( not ( = ?auto_53055 ?auto_53052 ) ) ( not ( = ?auto_53054 ?auto_53052 ) ) ( AVAILABLE ?auto_53060 ) ( IN ?auto_53055 ?auto_53051 ) )
    :subtasks
    ( ( !UNLOAD ?auto_53060 ?auto_53055 ?auto_53051 ?auto_53056 )
      ( MAKE-ON ?auto_53048 ?auto_53049 )
      ( MAKE-ON-VERIFY ?auto_53048 ?auto_53049 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53065 - SURFACE
      ?auto_53066 - SURFACE
    )
    :vars
    (
      ?auto_53079 - HOIST
      ?auto_53077 - PLACE
      ?auto_53069 - PLACE
      ?auto_53080 - HOIST
      ?auto_53074 - SURFACE
      ?auto_53068 - SURFACE
      ?auto_53076 - PLACE
      ?auto_53078 - HOIST
      ?auto_53081 - SURFACE
      ?auto_53071 - SURFACE
      ?auto_53073 - PLACE
      ?auto_53067 - HOIST
      ?auto_53075 - SURFACE
      ?auto_53070 - SURFACE
      ?auto_53072 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53079 ?auto_53077 ) ( IS-CRATE ?auto_53065 ) ( not ( = ?auto_53065 ?auto_53066 ) ) ( not ( = ?auto_53069 ?auto_53077 ) ) ( HOIST-AT ?auto_53080 ?auto_53069 ) ( not ( = ?auto_53079 ?auto_53080 ) ) ( AVAILABLE ?auto_53080 ) ( SURFACE-AT ?auto_53065 ?auto_53069 ) ( ON ?auto_53065 ?auto_53074 ) ( CLEAR ?auto_53065 ) ( not ( = ?auto_53065 ?auto_53074 ) ) ( not ( = ?auto_53066 ?auto_53074 ) ) ( IS-CRATE ?auto_53066 ) ( not ( = ?auto_53065 ?auto_53068 ) ) ( not ( = ?auto_53066 ?auto_53068 ) ) ( not ( = ?auto_53074 ?auto_53068 ) ) ( not ( = ?auto_53076 ?auto_53077 ) ) ( not ( = ?auto_53069 ?auto_53076 ) ) ( HOIST-AT ?auto_53078 ?auto_53076 ) ( not ( = ?auto_53079 ?auto_53078 ) ) ( not ( = ?auto_53080 ?auto_53078 ) ) ( AVAILABLE ?auto_53078 ) ( SURFACE-AT ?auto_53066 ?auto_53076 ) ( ON ?auto_53066 ?auto_53081 ) ( CLEAR ?auto_53066 ) ( not ( = ?auto_53065 ?auto_53081 ) ) ( not ( = ?auto_53066 ?auto_53081 ) ) ( not ( = ?auto_53074 ?auto_53081 ) ) ( not ( = ?auto_53068 ?auto_53081 ) ) ( IS-CRATE ?auto_53068 ) ( not ( = ?auto_53065 ?auto_53071 ) ) ( not ( = ?auto_53066 ?auto_53071 ) ) ( not ( = ?auto_53074 ?auto_53071 ) ) ( not ( = ?auto_53068 ?auto_53071 ) ) ( not ( = ?auto_53081 ?auto_53071 ) ) ( not ( = ?auto_53073 ?auto_53077 ) ) ( not ( = ?auto_53069 ?auto_53073 ) ) ( not ( = ?auto_53076 ?auto_53073 ) ) ( HOIST-AT ?auto_53067 ?auto_53073 ) ( not ( = ?auto_53079 ?auto_53067 ) ) ( not ( = ?auto_53080 ?auto_53067 ) ) ( not ( = ?auto_53078 ?auto_53067 ) ) ( AVAILABLE ?auto_53067 ) ( SURFACE-AT ?auto_53068 ?auto_53073 ) ( ON ?auto_53068 ?auto_53075 ) ( CLEAR ?auto_53068 ) ( not ( = ?auto_53065 ?auto_53075 ) ) ( not ( = ?auto_53066 ?auto_53075 ) ) ( not ( = ?auto_53074 ?auto_53075 ) ) ( not ( = ?auto_53068 ?auto_53075 ) ) ( not ( = ?auto_53081 ?auto_53075 ) ) ( not ( = ?auto_53071 ?auto_53075 ) ) ( SURFACE-AT ?auto_53070 ?auto_53077 ) ( CLEAR ?auto_53070 ) ( IS-CRATE ?auto_53071 ) ( not ( = ?auto_53065 ?auto_53070 ) ) ( not ( = ?auto_53066 ?auto_53070 ) ) ( not ( = ?auto_53074 ?auto_53070 ) ) ( not ( = ?auto_53068 ?auto_53070 ) ) ( not ( = ?auto_53081 ?auto_53070 ) ) ( not ( = ?auto_53071 ?auto_53070 ) ) ( not ( = ?auto_53075 ?auto_53070 ) ) ( AVAILABLE ?auto_53079 ) ( IN ?auto_53071 ?auto_53072 ) ( TRUCK-AT ?auto_53072 ?auto_53069 ) )
    :subtasks
    ( ( !DRIVE ?auto_53072 ?auto_53069 ?auto_53077 )
      ( MAKE-ON ?auto_53065 ?auto_53066 )
      ( MAKE-ON-VERIFY ?auto_53065 ?auto_53066 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53082 - SURFACE
      ?auto_53083 - SURFACE
    )
    :vars
    (
      ?auto_53097 - HOIST
      ?auto_53092 - PLACE
      ?auto_53098 - PLACE
      ?auto_53095 - HOIST
      ?auto_53094 - SURFACE
      ?auto_53093 - SURFACE
      ?auto_53086 - PLACE
      ?auto_53088 - HOIST
      ?auto_53096 - SURFACE
      ?auto_53087 - SURFACE
      ?auto_53085 - PLACE
      ?auto_53090 - HOIST
      ?auto_53089 - SURFACE
      ?auto_53084 - SURFACE
      ?auto_53091 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53097 ?auto_53092 ) ( IS-CRATE ?auto_53082 ) ( not ( = ?auto_53082 ?auto_53083 ) ) ( not ( = ?auto_53098 ?auto_53092 ) ) ( HOIST-AT ?auto_53095 ?auto_53098 ) ( not ( = ?auto_53097 ?auto_53095 ) ) ( SURFACE-AT ?auto_53082 ?auto_53098 ) ( ON ?auto_53082 ?auto_53094 ) ( CLEAR ?auto_53082 ) ( not ( = ?auto_53082 ?auto_53094 ) ) ( not ( = ?auto_53083 ?auto_53094 ) ) ( IS-CRATE ?auto_53083 ) ( not ( = ?auto_53082 ?auto_53093 ) ) ( not ( = ?auto_53083 ?auto_53093 ) ) ( not ( = ?auto_53094 ?auto_53093 ) ) ( not ( = ?auto_53086 ?auto_53092 ) ) ( not ( = ?auto_53098 ?auto_53086 ) ) ( HOIST-AT ?auto_53088 ?auto_53086 ) ( not ( = ?auto_53097 ?auto_53088 ) ) ( not ( = ?auto_53095 ?auto_53088 ) ) ( AVAILABLE ?auto_53088 ) ( SURFACE-AT ?auto_53083 ?auto_53086 ) ( ON ?auto_53083 ?auto_53096 ) ( CLEAR ?auto_53083 ) ( not ( = ?auto_53082 ?auto_53096 ) ) ( not ( = ?auto_53083 ?auto_53096 ) ) ( not ( = ?auto_53094 ?auto_53096 ) ) ( not ( = ?auto_53093 ?auto_53096 ) ) ( IS-CRATE ?auto_53093 ) ( not ( = ?auto_53082 ?auto_53087 ) ) ( not ( = ?auto_53083 ?auto_53087 ) ) ( not ( = ?auto_53094 ?auto_53087 ) ) ( not ( = ?auto_53093 ?auto_53087 ) ) ( not ( = ?auto_53096 ?auto_53087 ) ) ( not ( = ?auto_53085 ?auto_53092 ) ) ( not ( = ?auto_53098 ?auto_53085 ) ) ( not ( = ?auto_53086 ?auto_53085 ) ) ( HOIST-AT ?auto_53090 ?auto_53085 ) ( not ( = ?auto_53097 ?auto_53090 ) ) ( not ( = ?auto_53095 ?auto_53090 ) ) ( not ( = ?auto_53088 ?auto_53090 ) ) ( AVAILABLE ?auto_53090 ) ( SURFACE-AT ?auto_53093 ?auto_53085 ) ( ON ?auto_53093 ?auto_53089 ) ( CLEAR ?auto_53093 ) ( not ( = ?auto_53082 ?auto_53089 ) ) ( not ( = ?auto_53083 ?auto_53089 ) ) ( not ( = ?auto_53094 ?auto_53089 ) ) ( not ( = ?auto_53093 ?auto_53089 ) ) ( not ( = ?auto_53096 ?auto_53089 ) ) ( not ( = ?auto_53087 ?auto_53089 ) ) ( SURFACE-AT ?auto_53084 ?auto_53092 ) ( CLEAR ?auto_53084 ) ( IS-CRATE ?auto_53087 ) ( not ( = ?auto_53082 ?auto_53084 ) ) ( not ( = ?auto_53083 ?auto_53084 ) ) ( not ( = ?auto_53094 ?auto_53084 ) ) ( not ( = ?auto_53093 ?auto_53084 ) ) ( not ( = ?auto_53096 ?auto_53084 ) ) ( not ( = ?auto_53087 ?auto_53084 ) ) ( not ( = ?auto_53089 ?auto_53084 ) ) ( AVAILABLE ?auto_53097 ) ( TRUCK-AT ?auto_53091 ?auto_53098 ) ( LIFTING ?auto_53095 ?auto_53087 ) )
    :subtasks
    ( ( !LOAD ?auto_53095 ?auto_53087 ?auto_53091 ?auto_53098 )
      ( MAKE-ON ?auto_53082 ?auto_53083 )
      ( MAKE-ON-VERIFY ?auto_53082 ?auto_53083 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53099 - SURFACE
      ?auto_53100 - SURFACE
    )
    :vars
    (
      ?auto_53102 - HOIST
      ?auto_53101 - PLACE
      ?auto_53112 - PLACE
      ?auto_53109 - HOIST
      ?auto_53107 - SURFACE
      ?auto_53108 - SURFACE
      ?auto_53104 - PLACE
      ?auto_53106 - HOIST
      ?auto_53110 - SURFACE
      ?auto_53115 - SURFACE
      ?auto_53105 - PLACE
      ?auto_53114 - HOIST
      ?auto_53113 - SURFACE
      ?auto_53111 - SURFACE
      ?auto_53103 - TRUCK
      ?auto_53116 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53102 ?auto_53101 ) ( IS-CRATE ?auto_53099 ) ( not ( = ?auto_53099 ?auto_53100 ) ) ( not ( = ?auto_53112 ?auto_53101 ) ) ( HOIST-AT ?auto_53109 ?auto_53112 ) ( not ( = ?auto_53102 ?auto_53109 ) ) ( SURFACE-AT ?auto_53099 ?auto_53112 ) ( ON ?auto_53099 ?auto_53107 ) ( CLEAR ?auto_53099 ) ( not ( = ?auto_53099 ?auto_53107 ) ) ( not ( = ?auto_53100 ?auto_53107 ) ) ( IS-CRATE ?auto_53100 ) ( not ( = ?auto_53099 ?auto_53108 ) ) ( not ( = ?auto_53100 ?auto_53108 ) ) ( not ( = ?auto_53107 ?auto_53108 ) ) ( not ( = ?auto_53104 ?auto_53101 ) ) ( not ( = ?auto_53112 ?auto_53104 ) ) ( HOIST-AT ?auto_53106 ?auto_53104 ) ( not ( = ?auto_53102 ?auto_53106 ) ) ( not ( = ?auto_53109 ?auto_53106 ) ) ( AVAILABLE ?auto_53106 ) ( SURFACE-AT ?auto_53100 ?auto_53104 ) ( ON ?auto_53100 ?auto_53110 ) ( CLEAR ?auto_53100 ) ( not ( = ?auto_53099 ?auto_53110 ) ) ( not ( = ?auto_53100 ?auto_53110 ) ) ( not ( = ?auto_53107 ?auto_53110 ) ) ( not ( = ?auto_53108 ?auto_53110 ) ) ( IS-CRATE ?auto_53108 ) ( not ( = ?auto_53099 ?auto_53115 ) ) ( not ( = ?auto_53100 ?auto_53115 ) ) ( not ( = ?auto_53107 ?auto_53115 ) ) ( not ( = ?auto_53108 ?auto_53115 ) ) ( not ( = ?auto_53110 ?auto_53115 ) ) ( not ( = ?auto_53105 ?auto_53101 ) ) ( not ( = ?auto_53112 ?auto_53105 ) ) ( not ( = ?auto_53104 ?auto_53105 ) ) ( HOIST-AT ?auto_53114 ?auto_53105 ) ( not ( = ?auto_53102 ?auto_53114 ) ) ( not ( = ?auto_53109 ?auto_53114 ) ) ( not ( = ?auto_53106 ?auto_53114 ) ) ( AVAILABLE ?auto_53114 ) ( SURFACE-AT ?auto_53108 ?auto_53105 ) ( ON ?auto_53108 ?auto_53113 ) ( CLEAR ?auto_53108 ) ( not ( = ?auto_53099 ?auto_53113 ) ) ( not ( = ?auto_53100 ?auto_53113 ) ) ( not ( = ?auto_53107 ?auto_53113 ) ) ( not ( = ?auto_53108 ?auto_53113 ) ) ( not ( = ?auto_53110 ?auto_53113 ) ) ( not ( = ?auto_53115 ?auto_53113 ) ) ( SURFACE-AT ?auto_53111 ?auto_53101 ) ( CLEAR ?auto_53111 ) ( IS-CRATE ?auto_53115 ) ( not ( = ?auto_53099 ?auto_53111 ) ) ( not ( = ?auto_53100 ?auto_53111 ) ) ( not ( = ?auto_53107 ?auto_53111 ) ) ( not ( = ?auto_53108 ?auto_53111 ) ) ( not ( = ?auto_53110 ?auto_53111 ) ) ( not ( = ?auto_53115 ?auto_53111 ) ) ( not ( = ?auto_53113 ?auto_53111 ) ) ( AVAILABLE ?auto_53102 ) ( TRUCK-AT ?auto_53103 ?auto_53112 ) ( AVAILABLE ?auto_53109 ) ( SURFACE-AT ?auto_53115 ?auto_53112 ) ( ON ?auto_53115 ?auto_53116 ) ( CLEAR ?auto_53115 ) ( not ( = ?auto_53099 ?auto_53116 ) ) ( not ( = ?auto_53100 ?auto_53116 ) ) ( not ( = ?auto_53107 ?auto_53116 ) ) ( not ( = ?auto_53108 ?auto_53116 ) ) ( not ( = ?auto_53110 ?auto_53116 ) ) ( not ( = ?auto_53115 ?auto_53116 ) ) ( not ( = ?auto_53113 ?auto_53116 ) ) ( not ( = ?auto_53111 ?auto_53116 ) ) )
    :subtasks
    ( ( !LIFT ?auto_53109 ?auto_53115 ?auto_53116 ?auto_53112 )
      ( MAKE-ON ?auto_53099 ?auto_53100 )
      ( MAKE-ON-VERIFY ?auto_53099 ?auto_53100 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53117 - SURFACE
      ?auto_53118 - SURFACE
    )
    :vars
    (
      ?auto_53128 - HOIST
      ?auto_53127 - PLACE
      ?auto_53122 - PLACE
      ?auto_53121 - HOIST
      ?auto_53133 - SURFACE
      ?auto_53126 - SURFACE
      ?auto_53124 - PLACE
      ?auto_53125 - HOIST
      ?auto_53129 - SURFACE
      ?auto_53132 - SURFACE
      ?auto_53123 - PLACE
      ?auto_53120 - HOIST
      ?auto_53131 - SURFACE
      ?auto_53130 - SURFACE
      ?auto_53134 - SURFACE
      ?auto_53119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53128 ?auto_53127 ) ( IS-CRATE ?auto_53117 ) ( not ( = ?auto_53117 ?auto_53118 ) ) ( not ( = ?auto_53122 ?auto_53127 ) ) ( HOIST-AT ?auto_53121 ?auto_53122 ) ( not ( = ?auto_53128 ?auto_53121 ) ) ( SURFACE-AT ?auto_53117 ?auto_53122 ) ( ON ?auto_53117 ?auto_53133 ) ( CLEAR ?auto_53117 ) ( not ( = ?auto_53117 ?auto_53133 ) ) ( not ( = ?auto_53118 ?auto_53133 ) ) ( IS-CRATE ?auto_53118 ) ( not ( = ?auto_53117 ?auto_53126 ) ) ( not ( = ?auto_53118 ?auto_53126 ) ) ( not ( = ?auto_53133 ?auto_53126 ) ) ( not ( = ?auto_53124 ?auto_53127 ) ) ( not ( = ?auto_53122 ?auto_53124 ) ) ( HOIST-AT ?auto_53125 ?auto_53124 ) ( not ( = ?auto_53128 ?auto_53125 ) ) ( not ( = ?auto_53121 ?auto_53125 ) ) ( AVAILABLE ?auto_53125 ) ( SURFACE-AT ?auto_53118 ?auto_53124 ) ( ON ?auto_53118 ?auto_53129 ) ( CLEAR ?auto_53118 ) ( not ( = ?auto_53117 ?auto_53129 ) ) ( not ( = ?auto_53118 ?auto_53129 ) ) ( not ( = ?auto_53133 ?auto_53129 ) ) ( not ( = ?auto_53126 ?auto_53129 ) ) ( IS-CRATE ?auto_53126 ) ( not ( = ?auto_53117 ?auto_53132 ) ) ( not ( = ?auto_53118 ?auto_53132 ) ) ( not ( = ?auto_53133 ?auto_53132 ) ) ( not ( = ?auto_53126 ?auto_53132 ) ) ( not ( = ?auto_53129 ?auto_53132 ) ) ( not ( = ?auto_53123 ?auto_53127 ) ) ( not ( = ?auto_53122 ?auto_53123 ) ) ( not ( = ?auto_53124 ?auto_53123 ) ) ( HOIST-AT ?auto_53120 ?auto_53123 ) ( not ( = ?auto_53128 ?auto_53120 ) ) ( not ( = ?auto_53121 ?auto_53120 ) ) ( not ( = ?auto_53125 ?auto_53120 ) ) ( AVAILABLE ?auto_53120 ) ( SURFACE-AT ?auto_53126 ?auto_53123 ) ( ON ?auto_53126 ?auto_53131 ) ( CLEAR ?auto_53126 ) ( not ( = ?auto_53117 ?auto_53131 ) ) ( not ( = ?auto_53118 ?auto_53131 ) ) ( not ( = ?auto_53133 ?auto_53131 ) ) ( not ( = ?auto_53126 ?auto_53131 ) ) ( not ( = ?auto_53129 ?auto_53131 ) ) ( not ( = ?auto_53132 ?auto_53131 ) ) ( SURFACE-AT ?auto_53130 ?auto_53127 ) ( CLEAR ?auto_53130 ) ( IS-CRATE ?auto_53132 ) ( not ( = ?auto_53117 ?auto_53130 ) ) ( not ( = ?auto_53118 ?auto_53130 ) ) ( not ( = ?auto_53133 ?auto_53130 ) ) ( not ( = ?auto_53126 ?auto_53130 ) ) ( not ( = ?auto_53129 ?auto_53130 ) ) ( not ( = ?auto_53132 ?auto_53130 ) ) ( not ( = ?auto_53131 ?auto_53130 ) ) ( AVAILABLE ?auto_53128 ) ( AVAILABLE ?auto_53121 ) ( SURFACE-AT ?auto_53132 ?auto_53122 ) ( ON ?auto_53132 ?auto_53134 ) ( CLEAR ?auto_53132 ) ( not ( = ?auto_53117 ?auto_53134 ) ) ( not ( = ?auto_53118 ?auto_53134 ) ) ( not ( = ?auto_53133 ?auto_53134 ) ) ( not ( = ?auto_53126 ?auto_53134 ) ) ( not ( = ?auto_53129 ?auto_53134 ) ) ( not ( = ?auto_53132 ?auto_53134 ) ) ( not ( = ?auto_53131 ?auto_53134 ) ) ( not ( = ?auto_53130 ?auto_53134 ) ) ( TRUCK-AT ?auto_53119 ?auto_53127 ) )
    :subtasks
    ( ( !DRIVE ?auto_53119 ?auto_53127 ?auto_53122 )
      ( MAKE-ON ?auto_53117 ?auto_53118 )
      ( MAKE-ON-VERIFY ?auto_53117 ?auto_53118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53135 - SURFACE
      ?auto_53136 - SURFACE
    )
    :vars
    (
      ?auto_53138 - HOIST
      ?auto_53148 - PLACE
      ?auto_53137 - PLACE
      ?auto_53144 - HOIST
      ?auto_53142 - SURFACE
      ?auto_53150 - SURFACE
      ?auto_53143 - PLACE
      ?auto_53147 - HOIST
      ?auto_53141 - SURFACE
      ?auto_53145 - SURFACE
      ?auto_53140 - PLACE
      ?auto_53152 - HOIST
      ?auto_53151 - SURFACE
      ?auto_53149 - SURFACE
      ?auto_53146 - SURFACE
      ?auto_53139 - TRUCK
      ?auto_53153 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53138 ?auto_53148 ) ( IS-CRATE ?auto_53135 ) ( not ( = ?auto_53135 ?auto_53136 ) ) ( not ( = ?auto_53137 ?auto_53148 ) ) ( HOIST-AT ?auto_53144 ?auto_53137 ) ( not ( = ?auto_53138 ?auto_53144 ) ) ( SURFACE-AT ?auto_53135 ?auto_53137 ) ( ON ?auto_53135 ?auto_53142 ) ( CLEAR ?auto_53135 ) ( not ( = ?auto_53135 ?auto_53142 ) ) ( not ( = ?auto_53136 ?auto_53142 ) ) ( IS-CRATE ?auto_53136 ) ( not ( = ?auto_53135 ?auto_53150 ) ) ( not ( = ?auto_53136 ?auto_53150 ) ) ( not ( = ?auto_53142 ?auto_53150 ) ) ( not ( = ?auto_53143 ?auto_53148 ) ) ( not ( = ?auto_53137 ?auto_53143 ) ) ( HOIST-AT ?auto_53147 ?auto_53143 ) ( not ( = ?auto_53138 ?auto_53147 ) ) ( not ( = ?auto_53144 ?auto_53147 ) ) ( AVAILABLE ?auto_53147 ) ( SURFACE-AT ?auto_53136 ?auto_53143 ) ( ON ?auto_53136 ?auto_53141 ) ( CLEAR ?auto_53136 ) ( not ( = ?auto_53135 ?auto_53141 ) ) ( not ( = ?auto_53136 ?auto_53141 ) ) ( not ( = ?auto_53142 ?auto_53141 ) ) ( not ( = ?auto_53150 ?auto_53141 ) ) ( IS-CRATE ?auto_53150 ) ( not ( = ?auto_53135 ?auto_53145 ) ) ( not ( = ?auto_53136 ?auto_53145 ) ) ( not ( = ?auto_53142 ?auto_53145 ) ) ( not ( = ?auto_53150 ?auto_53145 ) ) ( not ( = ?auto_53141 ?auto_53145 ) ) ( not ( = ?auto_53140 ?auto_53148 ) ) ( not ( = ?auto_53137 ?auto_53140 ) ) ( not ( = ?auto_53143 ?auto_53140 ) ) ( HOIST-AT ?auto_53152 ?auto_53140 ) ( not ( = ?auto_53138 ?auto_53152 ) ) ( not ( = ?auto_53144 ?auto_53152 ) ) ( not ( = ?auto_53147 ?auto_53152 ) ) ( AVAILABLE ?auto_53152 ) ( SURFACE-AT ?auto_53150 ?auto_53140 ) ( ON ?auto_53150 ?auto_53151 ) ( CLEAR ?auto_53150 ) ( not ( = ?auto_53135 ?auto_53151 ) ) ( not ( = ?auto_53136 ?auto_53151 ) ) ( not ( = ?auto_53142 ?auto_53151 ) ) ( not ( = ?auto_53150 ?auto_53151 ) ) ( not ( = ?auto_53141 ?auto_53151 ) ) ( not ( = ?auto_53145 ?auto_53151 ) ) ( IS-CRATE ?auto_53145 ) ( not ( = ?auto_53135 ?auto_53149 ) ) ( not ( = ?auto_53136 ?auto_53149 ) ) ( not ( = ?auto_53142 ?auto_53149 ) ) ( not ( = ?auto_53150 ?auto_53149 ) ) ( not ( = ?auto_53141 ?auto_53149 ) ) ( not ( = ?auto_53145 ?auto_53149 ) ) ( not ( = ?auto_53151 ?auto_53149 ) ) ( AVAILABLE ?auto_53144 ) ( SURFACE-AT ?auto_53145 ?auto_53137 ) ( ON ?auto_53145 ?auto_53146 ) ( CLEAR ?auto_53145 ) ( not ( = ?auto_53135 ?auto_53146 ) ) ( not ( = ?auto_53136 ?auto_53146 ) ) ( not ( = ?auto_53142 ?auto_53146 ) ) ( not ( = ?auto_53150 ?auto_53146 ) ) ( not ( = ?auto_53141 ?auto_53146 ) ) ( not ( = ?auto_53145 ?auto_53146 ) ) ( not ( = ?auto_53151 ?auto_53146 ) ) ( not ( = ?auto_53149 ?auto_53146 ) ) ( TRUCK-AT ?auto_53139 ?auto_53148 ) ( SURFACE-AT ?auto_53153 ?auto_53148 ) ( CLEAR ?auto_53153 ) ( LIFTING ?auto_53138 ?auto_53149 ) ( IS-CRATE ?auto_53149 ) ( not ( = ?auto_53135 ?auto_53153 ) ) ( not ( = ?auto_53136 ?auto_53153 ) ) ( not ( = ?auto_53142 ?auto_53153 ) ) ( not ( = ?auto_53150 ?auto_53153 ) ) ( not ( = ?auto_53141 ?auto_53153 ) ) ( not ( = ?auto_53145 ?auto_53153 ) ) ( not ( = ?auto_53151 ?auto_53153 ) ) ( not ( = ?auto_53149 ?auto_53153 ) ) ( not ( = ?auto_53146 ?auto_53153 ) ) )
    :subtasks
    ( ( !DROP ?auto_53138 ?auto_53149 ?auto_53153 ?auto_53148 )
      ( MAKE-ON ?auto_53135 ?auto_53136 )
      ( MAKE-ON-VERIFY ?auto_53135 ?auto_53136 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53154 - SURFACE
      ?auto_53155 - SURFACE
    )
    :vars
    (
      ?auto_53159 - HOIST
      ?auto_53170 - PLACE
      ?auto_53164 - PLACE
      ?auto_53156 - HOIST
      ?auto_53168 - SURFACE
      ?auto_53157 - SURFACE
      ?auto_53161 - PLACE
      ?auto_53169 - HOIST
      ?auto_53172 - SURFACE
      ?auto_53163 - SURFACE
      ?auto_53171 - PLACE
      ?auto_53160 - HOIST
      ?auto_53166 - SURFACE
      ?auto_53167 - SURFACE
      ?auto_53165 - SURFACE
      ?auto_53158 - TRUCK
      ?auto_53162 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53159 ?auto_53170 ) ( IS-CRATE ?auto_53154 ) ( not ( = ?auto_53154 ?auto_53155 ) ) ( not ( = ?auto_53164 ?auto_53170 ) ) ( HOIST-AT ?auto_53156 ?auto_53164 ) ( not ( = ?auto_53159 ?auto_53156 ) ) ( SURFACE-AT ?auto_53154 ?auto_53164 ) ( ON ?auto_53154 ?auto_53168 ) ( CLEAR ?auto_53154 ) ( not ( = ?auto_53154 ?auto_53168 ) ) ( not ( = ?auto_53155 ?auto_53168 ) ) ( IS-CRATE ?auto_53155 ) ( not ( = ?auto_53154 ?auto_53157 ) ) ( not ( = ?auto_53155 ?auto_53157 ) ) ( not ( = ?auto_53168 ?auto_53157 ) ) ( not ( = ?auto_53161 ?auto_53170 ) ) ( not ( = ?auto_53164 ?auto_53161 ) ) ( HOIST-AT ?auto_53169 ?auto_53161 ) ( not ( = ?auto_53159 ?auto_53169 ) ) ( not ( = ?auto_53156 ?auto_53169 ) ) ( AVAILABLE ?auto_53169 ) ( SURFACE-AT ?auto_53155 ?auto_53161 ) ( ON ?auto_53155 ?auto_53172 ) ( CLEAR ?auto_53155 ) ( not ( = ?auto_53154 ?auto_53172 ) ) ( not ( = ?auto_53155 ?auto_53172 ) ) ( not ( = ?auto_53168 ?auto_53172 ) ) ( not ( = ?auto_53157 ?auto_53172 ) ) ( IS-CRATE ?auto_53157 ) ( not ( = ?auto_53154 ?auto_53163 ) ) ( not ( = ?auto_53155 ?auto_53163 ) ) ( not ( = ?auto_53168 ?auto_53163 ) ) ( not ( = ?auto_53157 ?auto_53163 ) ) ( not ( = ?auto_53172 ?auto_53163 ) ) ( not ( = ?auto_53171 ?auto_53170 ) ) ( not ( = ?auto_53164 ?auto_53171 ) ) ( not ( = ?auto_53161 ?auto_53171 ) ) ( HOIST-AT ?auto_53160 ?auto_53171 ) ( not ( = ?auto_53159 ?auto_53160 ) ) ( not ( = ?auto_53156 ?auto_53160 ) ) ( not ( = ?auto_53169 ?auto_53160 ) ) ( AVAILABLE ?auto_53160 ) ( SURFACE-AT ?auto_53157 ?auto_53171 ) ( ON ?auto_53157 ?auto_53166 ) ( CLEAR ?auto_53157 ) ( not ( = ?auto_53154 ?auto_53166 ) ) ( not ( = ?auto_53155 ?auto_53166 ) ) ( not ( = ?auto_53168 ?auto_53166 ) ) ( not ( = ?auto_53157 ?auto_53166 ) ) ( not ( = ?auto_53172 ?auto_53166 ) ) ( not ( = ?auto_53163 ?auto_53166 ) ) ( IS-CRATE ?auto_53163 ) ( not ( = ?auto_53154 ?auto_53167 ) ) ( not ( = ?auto_53155 ?auto_53167 ) ) ( not ( = ?auto_53168 ?auto_53167 ) ) ( not ( = ?auto_53157 ?auto_53167 ) ) ( not ( = ?auto_53172 ?auto_53167 ) ) ( not ( = ?auto_53163 ?auto_53167 ) ) ( not ( = ?auto_53166 ?auto_53167 ) ) ( AVAILABLE ?auto_53156 ) ( SURFACE-AT ?auto_53163 ?auto_53164 ) ( ON ?auto_53163 ?auto_53165 ) ( CLEAR ?auto_53163 ) ( not ( = ?auto_53154 ?auto_53165 ) ) ( not ( = ?auto_53155 ?auto_53165 ) ) ( not ( = ?auto_53168 ?auto_53165 ) ) ( not ( = ?auto_53157 ?auto_53165 ) ) ( not ( = ?auto_53172 ?auto_53165 ) ) ( not ( = ?auto_53163 ?auto_53165 ) ) ( not ( = ?auto_53166 ?auto_53165 ) ) ( not ( = ?auto_53167 ?auto_53165 ) ) ( TRUCK-AT ?auto_53158 ?auto_53170 ) ( SURFACE-AT ?auto_53162 ?auto_53170 ) ( CLEAR ?auto_53162 ) ( IS-CRATE ?auto_53167 ) ( not ( = ?auto_53154 ?auto_53162 ) ) ( not ( = ?auto_53155 ?auto_53162 ) ) ( not ( = ?auto_53168 ?auto_53162 ) ) ( not ( = ?auto_53157 ?auto_53162 ) ) ( not ( = ?auto_53172 ?auto_53162 ) ) ( not ( = ?auto_53163 ?auto_53162 ) ) ( not ( = ?auto_53166 ?auto_53162 ) ) ( not ( = ?auto_53167 ?auto_53162 ) ) ( not ( = ?auto_53165 ?auto_53162 ) ) ( AVAILABLE ?auto_53159 ) ( IN ?auto_53167 ?auto_53158 ) )
    :subtasks
    ( ( !UNLOAD ?auto_53159 ?auto_53167 ?auto_53158 ?auto_53170 )
      ( MAKE-ON ?auto_53154 ?auto_53155 )
      ( MAKE-ON-VERIFY ?auto_53154 ?auto_53155 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53173 - SURFACE
      ?auto_53174 - SURFACE
    )
    :vars
    (
      ?auto_53190 - HOIST
      ?auto_53181 - PLACE
      ?auto_53175 - PLACE
      ?auto_53180 - HOIST
      ?auto_53191 - SURFACE
      ?auto_53182 - SURFACE
      ?auto_53186 - PLACE
      ?auto_53183 - HOIST
      ?auto_53177 - SURFACE
      ?auto_53178 - SURFACE
      ?auto_53188 - PLACE
      ?auto_53184 - HOIST
      ?auto_53185 - SURFACE
      ?auto_53176 - SURFACE
      ?auto_53179 - SURFACE
      ?auto_53189 - SURFACE
      ?auto_53187 - TRUCK
      ?auto_53192 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53190 ?auto_53181 ) ( IS-CRATE ?auto_53173 ) ( not ( = ?auto_53173 ?auto_53174 ) ) ( not ( = ?auto_53175 ?auto_53181 ) ) ( HOIST-AT ?auto_53180 ?auto_53175 ) ( not ( = ?auto_53190 ?auto_53180 ) ) ( SURFACE-AT ?auto_53173 ?auto_53175 ) ( ON ?auto_53173 ?auto_53191 ) ( CLEAR ?auto_53173 ) ( not ( = ?auto_53173 ?auto_53191 ) ) ( not ( = ?auto_53174 ?auto_53191 ) ) ( IS-CRATE ?auto_53174 ) ( not ( = ?auto_53173 ?auto_53182 ) ) ( not ( = ?auto_53174 ?auto_53182 ) ) ( not ( = ?auto_53191 ?auto_53182 ) ) ( not ( = ?auto_53186 ?auto_53181 ) ) ( not ( = ?auto_53175 ?auto_53186 ) ) ( HOIST-AT ?auto_53183 ?auto_53186 ) ( not ( = ?auto_53190 ?auto_53183 ) ) ( not ( = ?auto_53180 ?auto_53183 ) ) ( AVAILABLE ?auto_53183 ) ( SURFACE-AT ?auto_53174 ?auto_53186 ) ( ON ?auto_53174 ?auto_53177 ) ( CLEAR ?auto_53174 ) ( not ( = ?auto_53173 ?auto_53177 ) ) ( not ( = ?auto_53174 ?auto_53177 ) ) ( not ( = ?auto_53191 ?auto_53177 ) ) ( not ( = ?auto_53182 ?auto_53177 ) ) ( IS-CRATE ?auto_53182 ) ( not ( = ?auto_53173 ?auto_53178 ) ) ( not ( = ?auto_53174 ?auto_53178 ) ) ( not ( = ?auto_53191 ?auto_53178 ) ) ( not ( = ?auto_53182 ?auto_53178 ) ) ( not ( = ?auto_53177 ?auto_53178 ) ) ( not ( = ?auto_53188 ?auto_53181 ) ) ( not ( = ?auto_53175 ?auto_53188 ) ) ( not ( = ?auto_53186 ?auto_53188 ) ) ( HOIST-AT ?auto_53184 ?auto_53188 ) ( not ( = ?auto_53190 ?auto_53184 ) ) ( not ( = ?auto_53180 ?auto_53184 ) ) ( not ( = ?auto_53183 ?auto_53184 ) ) ( AVAILABLE ?auto_53184 ) ( SURFACE-AT ?auto_53182 ?auto_53188 ) ( ON ?auto_53182 ?auto_53185 ) ( CLEAR ?auto_53182 ) ( not ( = ?auto_53173 ?auto_53185 ) ) ( not ( = ?auto_53174 ?auto_53185 ) ) ( not ( = ?auto_53191 ?auto_53185 ) ) ( not ( = ?auto_53182 ?auto_53185 ) ) ( not ( = ?auto_53177 ?auto_53185 ) ) ( not ( = ?auto_53178 ?auto_53185 ) ) ( IS-CRATE ?auto_53178 ) ( not ( = ?auto_53173 ?auto_53176 ) ) ( not ( = ?auto_53174 ?auto_53176 ) ) ( not ( = ?auto_53191 ?auto_53176 ) ) ( not ( = ?auto_53182 ?auto_53176 ) ) ( not ( = ?auto_53177 ?auto_53176 ) ) ( not ( = ?auto_53178 ?auto_53176 ) ) ( not ( = ?auto_53185 ?auto_53176 ) ) ( AVAILABLE ?auto_53180 ) ( SURFACE-AT ?auto_53178 ?auto_53175 ) ( ON ?auto_53178 ?auto_53179 ) ( CLEAR ?auto_53178 ) ( not ( = ?auto_53173 ?auto_53179 ) ) ( not ( = ?auto_53174 ?auto_53179 ) ) ( not ( = ?auto_53191 ?auto_53179 ) ) ( not ( = ?auto_53182 ?auto_53179 ) ) ( not ( = ?auto_53177 ?auto_53179 ) ) ( not ( = ?auto_53178 ?auto_53179 ) ) ( not ( = ?auto_53185 ?auto_53179 ) ) ( not ( = ?auto_53176 ?auto_53179 ) ) ( SURFACE-AT ?auto_53189 ?auto_53181 ) ( CLEAR ?auto_53189 ) ( IS-CRATE ?auto_53176 ) ( not ( = ?auto_53173 ?auto_53189 ) ) ( not ( = ?auto_53174 ?auto_53189 ) ) ( not ( = ?auto_53191 ?auto_53189 ) ) ( not ( = ?auto_53182 ?auto_53189 ) ) ( not ( = ?auto_53177 ?auto_53189 ) ) ( not ( = ?auto_53178 ?auto_53189 ) ) ( not ( = ?auto_53185 ?auto_53189 ) ) ( not ( = ?auto_53176 ?auto_53189 ) ) ( not ( = ?auto_53179 ?auto_53189 ) ) ( AVAILABLE ?auto_53190 ) ( IN ?auto_53176 ?auto_53187 ) ( TRUCK-AT ?auto_53187 ?auto_53192 ) ( not ( = ?auto_53192 ?auto_53181 ) ) ( not ( = ?auto_53175 ?auto_53192 ) ) ( not ( = ?auto_53186 ?auto_53192 ) ) ( not ( = ?auto_53188 ?auto_53192 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_53187 ?auto_53192 ?auto_53181 )
      ( MAKE-ON ?auto_53173 ?auto_53174 )
      ( MAKE-ON-VERIFY ?auto_53173 ?auto_53174 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53193 - SURFACE
      ?auto_53194 - SURFACE
    )
    :vars
    (
      ?auto_53197 - HOIST
      ?auto_53199 - PLACE
      ?auto_53211 - PLACE
      ?auto_53209 - HOIST
      ?auto_53207 - SURFACE
      ?auto_53198 - SURFACE
      ?auto_53202 - PLACE
      ?auto_53204 - HOIST
      ?auto_53205 - SURFACE
      ?auto_53208 - SURFACE
      ?auto_53206 - PLACE
      ?auto_53203 - HOIST
      ?auto_53210 - SURFACE
      ?auto_53201 - SURFACE
      ?auto_53212 - SURFACE
      ?auto_53196 - SURFACE
      ?auto_53195 - TRUCK
      ?auto_53200 - PLACE
      ?auto_53213 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_53197 ?auto_53199 ) ( IS-CRATE ?auto_53193 ) ( not ( = ?auto_53193 ?auto_53194 ) ) ( not ( = ?auto_53211 ?auto_53199 ) ) ( HOIST-AT ?auto_53209 ?auto_53211 ) ( not ( = ?auto_53197 ?auto_53209 ) ) ( SURFACE-AT ?auto_53193 ?auto_53211 ) ( ON ?auto_53193 ?auto_53207 ) ( CLEAR ?auto_53193 ) ( not ( = ?auto_53193 ?auto_53207 ) ) ( not ( = ?auto_53194 ?auto_53207 ) ) ( IS-CRATE ?auto_53194 ) ( not ( = ?auto_53193 ?auto_53198 ) ) ( not ( = ?auto_53194 ?auto_53198 ) ) ( not ( = ?auto_53207 ?auto_53198 ) ) ( not ( = ?auto_53202 ?auto_53199 ) ) ( not ( = ?auto_53211 ?auto_53202 ) ) ( HOIST-AT ?auto_53204 ?auto_53202 ) ( not ( = ?auto_53197 ?auto_53204 ) ) ( not ( = ?auto_53209 ?auto_53204 ) ) ( AVAILABLE ?auto_53204 ) ( SURFACE-AT ?auto_53194 ?auto_53202 ) ( ON ?auto_53194 ?auto_53205 ) ( CLEAR ?auto_53194 ) ( not ( = ?auto_53193 ?auto_53205 ) ) ( not ( = ?auto_53194 ?auto_53205 ) ) ( not ( = ?auto_53207 ?auto_53205 ) ) ( not ( = ?auto_53198 ?auto_53205 ) ) ( IS-CRATE ?auto_53198 ) ( not ( = ?auto_53193 ?auto_53208 ) ) ( not ( = ?auto_53194 ?auto_53208 ) ) ( not ( = ?auto_53207 ?auto_53208 ) ) ( not ( = ?auto_53198 ?auto_53208 ) ) ( not ( = ?auto_53205 ?auto_53208 ) ) ( not ( = ?auto_53206 ?auto_53199 ) ) ( not ( = ?auto_53211 ?auto_53206 ) ) ( not ( = ?auto_53202 ?auto_53206 ) ) ( HOIST-AT ?auto_53203 ?auto_53206 ) ( not ( = ?auto_53197 ?auto_53203 ) ) ( not ( = ?auto_53209 ?auto_53203 ) ) ( not ( = ?auto_53204 ?auto_53203 ) ) ( AVAILABLE ?auto_53203 ) ( SURFACE-AT ?auto_53198 ?auto_53206 ) ( ON ?auto_53198 ?auto_53210 ) ( CLEAR ?auto_53198 ) ( not ( = ?auto_53193 ?auto_53210 ) ) ( not ( = ?auto_53194 ?auto_53210 ) ) ( not ( = ?auto_53207 ?auto_53210 ) ) ( not ( = ?auto_53198 ?auto_53210 ) ) ( not ( = ?auto_53205 ?auto_53210 ) ) ( not ( = ?auto_53208 ?auto_53210 ) ) ( IS-CRATE ?auto_53208 ) ( not ( = ?auto_53193 ?auto_53201 ) ) ( not ( = ?auto_53194 ?auto_53201 ) ) ( not ( = ?auto_53207 ?auto_53201 ) ) ( not ( = ?auto_53198 ?auto_53201 ) ) ( not ( = ?auto_53205 ?auto_53201 ) ) ( not ( = ?auto_53208 ?auto_53201 ) ) ( not ( = ?auto_53210 ?auto_53201 ) ) ( AVAILABLE ?auto_53209 ) ( SURFACE-AT ?auto_53208 ?auto_53211 ) ( ON ?auto_53208 ?auto_53212 ) ( CLEAR ?auto_53208 ) ( not ( = ?auto_53193 ?auto_53212 ) ) ( not ( = ?auto_53194 ?auto_53212 ) ) ( not ( = ?auto_53207 ?auto_53212 ) ) ( not ( = ?auto_53198 ?auto_53212 ) ) ( not ( = ?auto_53205 ?auto_53212 ) ) ( not ( = ?auto_53208 ?auto_53212 ) ) ( not ( = ?auto_53210 ?auto_53212 ) ) ( not ( = ?auto_53201 ?auto_53212 ) ) ( SURFACE-AT ?auto_53196 ?auto_53199 ) ( CLEAR ?auto_53196 ) ( IS-CRATE ?auto_53201 ) ( not ( = ?auto_53193 ?auto_53196 ) ) ( not ( = ?auto_53194 ?auto_53196 ) ) ( not ( = ?auto_53207 ?auto_53196 ) ) ( not ( = ?auto_53198 ?auto_53196 ) ) ( not ( = ?auto_53205 ?auto_53196 ) ) ( not ( = ?auto_53208 ?auto_53196 ) ) ( not ( = ?auto_53210 ?auto_53196 ) ) ( not ( = ?auto_53201 ?auto_53196 ) ) ( not ( = ?auto_53212 ?auto_53196 ) ) ( AVAILABLE ?auto_53197 ) ( TRUCK-AT ?auto_53195 ?auto_53200 ) ( not ( = ?auto_53200 ?auto_53199 ) ) ( not ( = ?auto_53211 ?auto_53200 ) ) ( not ( = ?auto_53202 ?auto_53200 ) ) ( not ( = ?auto_53206 ?auto_53200 ) ) ( HOIST-AT ?auto_53213 ?auto_53200 ) ( LIFTING ?auto_53213 ?auto_53201 ) ( not ( = ?auto_53197 ?auto_53213 ) ) ( not ( = ?auto_53209 ?auto_53213 ) ) ( not ( = ?auto_53204 ?auto_53213 ) ) ( not ( = ?auto_53203 ?auto_53213 ) ) )
    :subtasks
    ( ( !LOAD ?auto_53213 ?auto_53201 ?auto_53195 ?auto_53200 )
      ( MAKE-ON ?auto_53193 ?auto_53194 )
      ( MAKE-ON-VERIFY ?auto_53193 ?auto_53194 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53214 - SURFACE
      ?auto_53215 - SURFACE
    )
    :vars
    (
      ?auto_53223 - HOIST
      ?auto_53229 - PLACE
      ?auto_53231 - PLACE
      ?auto_53233 - HOIST
      ?auto_53222 - SURFACE
      ?auto_53224 - SURFACE
      ?auto_53234 - PLACE
      ?auto_53221 - HOIST
      ?auto_53217 - SURFACE
      ?auto_53220 - SURFACE
      ?auto_53225 - PLACE
      ?auto_53218 - HOIST
      ?auto_53232 - SURFACE
      ?auto_53216 - SURFACE
      ?auto_53228 - SURFACE
      ?auto_53227 - SURFACE
      ?auto_53230 - TRUCK
      ?auto_53226 - PLACE
      ?auto_53219 - HOIST
      ?auto_53235 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53223 ?auto_53229 ) ( IS-CRATE ?auto_53214 ) ( not ( = ?auto_53214 ?auto_53215 ) ) ( not ( = ?auto_53231 ?auto_53229 ) ) ( HOIST-AT ?auto_53233 ?auto_53231 ) ( not ( = ?auto_53223 ?auto_53233 ) ) ( SURFACE-AT ?auto_53214 ?auto_53231 ) ( ON ?auto_53214 ?auto_53222 ) ( CLEAR ?auto_53214 ) ( not ( = ?auto_53214 ?auto_53222 ) ) ( not ( = ?auto_53215 ?auto_53222 ) ) ( IS-CRATE ?auto_53215 ) ( not ( = ?auto_53214 ?auto_53224 ) ) ( not ( = ?auto_53215 ?auto_53224 ) ) ( not ( = ?auto_53222 ?auto_53224 ) ) ( not ( = ?auto_53234 ?auto_53229 ) ) ( not ( = ?auto_53231 ?auto_53234 ) ) ( HOIST-AT ?auto_53221 ?auto_53234 ) ( not ( = ?auto_53223 ?auto_53221 ) ) ( not ( = ?auto_53233 ?auto_53221 ) ) ( AVAILABLE ?auto_53221 ) ( SURFACE-AT ?auto_53215 ?auto_53234 ) ( ON ?auto_53215 ?auto_53217 ) ( CLEAR ?auto_53215 ) ( not ( = ?auto_53214 ?auto_53217 ) ) ( not ( = ?auto_53215 ?auto_53217 ) ) ( not ( = ?auto_53222 ?auto_53217 ) ) ( not ( = ?auto_53224 ?auto_53217 ) ) ( IS-CRATE ?auto_53224 ) ( not ( = ?auto_53214 ?auto_53220 ) ) ( not ( = ?auto_53215 ?auto_53220 ) ) ( not ( = ?auto_53222 ?auto_53220 ) ) ( not ( = ?auto_53224 ?auto_53220 ) ) ( not ( = ?auto_53217 ?auto_53220 ) ) ( not ( = ?auto_53225 ?auto_53229 ) ) ( not ( = ?auto_53231 ?auto_53225 ) ) ( not ( = ?auto_53234 ?auto_53225 ) ) ( HOIST-AT ?auto_53218 ?auto_53225 ) ( not ( = ?auto_53223 ?auto_53218 ) ) ( not ( = ?auto_53233 ?auto_53218 ) ) ( not ( = ?auto_53221 ?auto_53218 ) ) ( AVAILABLE ?auto_53218 ) ( SURFACE-AT ?auto_53224 ?auto_53225 ) ( ON ?auto_53224 ?auto_53232 ) ( CLEAR ?auto_53224 ) ( not ( = ?auto_53214 ?auto_53232 ) ) ( not ( = ?auto_53215 ?auto_53232 ) ) ( not ( = ?auto_53222 ?auto_53232 ) ) ( not ( = ?auto_53224 ?auto_53232 ) ) ( not ( = ?auto_53217 ?auto_53232 ) ) ( not ( = ?auto_53220 ?auto_53232 ) ) ( IS-CRATE ?auto_53220 ) ( not ( = ?auto_53214 ?auto_53216 ) ) ( not ( = ?auto_53215 ?auto_53216 ) ) ( not ( = ?auto_53222 ?auto_53216 ) ) ( not ( = ?auto_53224 ?auto_53216 ) ) ( not ( = ?auto_53217 ?auto_53216 ) ) ( not ( = ?auto_53220 ?auto_53216 ) ) ( not ( = ?auto_53232 ?auto_53216 ) ) ( AVAILABLE ?auto_53233 ) ( SURFACE-AT ?auto_53220 ?auto_53231 ) ( ON ?auto_53220 ?auto_53228 ) ( CLEAR ?auto_53220 ) ( not ( = ?auto_53214 ?auto_53228 ) ) ( not ( = ?auto_53215 ?auto_53228 ) ) ( not ( = ?auto_53222 ?auto_53228 ) ) ( not ( = ?auto_53224 ?auto_53228 ) ) ( not ( = ?auto_53217 ?auto_53228 ) ) ( not ( = ?auto_53220 ?auto_53228 ) ) ( not ( = ?auto_53232 ?auto_53228 ) ) ( not ( = ?auto_53216 ?auto_53228 ) ) ( SURFACE-AT ?auto_53227 ?auto_53229 ) ( CLEAR ?auto_53227 ) ( IS-CRATE ?auto_53216 ) ( not ( = ?auto_53214 ?auto_53227 ) ) ( not ( = ?auto_53215 ?auto_53227 ) ) ( not ( = ?auto_53222 ?auto_53227 ) ) ( not ( = ?auto_53224 ?auto_53227 ) ) ( not ( = ?auto_53217 ?auto_53227 ) ) ( not ( = ?auto_53220 ?auto_53227 ) ) ( not ( = ?auto_53232 ?auto_53227 ) ) ( not ( = ?auto_53216 ?auto_53227 ) ) ( not ( = ?auto_53228 ?auto_53227 ) ) ( AVAILABLE ?auto_53223 ) ( TRUCK-AT ?auto_53230 ?auto_53226 ) ( not ( = ?auto_53226 ?auto_53229 ) ) ( not ( = ?auto_53231 ?auto_53226 ) ) ( not ( = ?auto_53234 ?auto_53226 ) ) ( not ( = ?auto_53225 ?auto_53226 ) ) ( HOIST-AT ?auto_53219 ?auto_53226 ) ( not ( = ?auto_53223 ?auto_53219 ) ) ( not ( = ?auto_53233 ?auto_53219 ) ) ( not ( = ?auto_53221 ?auto_53219 ) ) ( not ( = ?auto_53218 ?auto_53219 ) ) ( AVAILABLE ?auto_53219 ) ( SURFACE-AT ?auto_53216 ?auto_53226 ) ( ON ?auto_53216 ?auto_53235 ) ( CLEAR ?auto_53216 ) ( not ( = ?auto_53214 ?auto_53235 ) ) ( not ( = ?auto_53215 ?auto_53235 ) ) ( not ( = ?auto_53222 ?auto_53235 ) ) ( not ( = ?auto_53224 ?auto_53235 ) ) ( not ( = ?auto_53217 ?auto_53235 ) ) ( not ( = ?auto_53220 ?auto_53235 ) ) ( not ( = ?auto_53232 ?auto_53235 ) ) ( not ( = ?auto_53216 ?auto_53235 ) ) ( not ( = ?auto_53228 ?auto_53235 ) ) ( not ( = ?auto_53227 ?auto_53235 ) ) )
    :subtasks
    ( ( !LIFT ?auto_53219 ?auto_53216 ?auto_53235 ?auto_53226 )
      ( MAKE-ON ?auto_53214 ?auto_53215 )
      ( MAKE-ON-VERIFY ?auto_53214 ?auto_53215 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53236 - SURFACE
      ?auto_53237 - SURFACE
    )
    :vars
    (
      ?auto_53256 - HOIST
      ?auto_53240 - PLACE
      ?auto_53239 - PLACE
      ?auto_53257 - HOIST
      ?auto_53238 - SURFACE
      ?auto_53249 - SURFACE
      ?auto_53254 - PLACE
      ?auto_53252 - HOIST
      ?auto_53247 - SURFACE
      ?auto_53241 - SURFACE
      ?auto_53244 - PLACE
      ?auto_53243 - HOIST
      ?auto_53253 - SURFACE
      ?auto_53250 - SURFACE
      ?auto_53246 - SURFACE
      ?auto_53248 - SURFACE
      ?auto_53251 - PLACE
      ?auto_53245 - HOIST
      ?auto_53255 - SURFACE
      ?auto_53242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53256 ?auto_53240 ) ( IS-CRATE ?auto_53236 ) ( not ( = ?auto_53236 ?auto_53237 ) ) ( not ( = ?auto_53239 ?auto_53240 ) ) ( HOIST-AT ?auto_53257 ?auto_53239 ) ( not ( = ?auto_53256 ?auto_53257 ) ) ( SURFACE-AT ?auto_53236 ?auto_53239 ) ( ON ?auto_53236 ?auto_53238 ) ( CLEAR ?auto_53236 ) ( not ( = ?auto_53236 ?auto_53238 ) ) ( not ( = ?auto_53237 ?auto_53238 ) ) ( IS-CRATE ?auto_53237 ) ( not ( = ?auto_53236 ?auto_53249 ) ) ( not ( = ?auto_53237 ?auto_53249 ) ) ( not ( = ?auto_53238 ?auto_53249 ) ) ( not ( = ?auto_53254 ?auto_53240 ) ) ( not ( = ?auto_53239 ?auto_53254 ) ) ( HOIST-AT ?auto_53252 ?auto_53254 ) ( not ( = ?auto_53256 ?auto_53252 ) ) ( not ( = ?auto_53257 ?auto_53252 ) ) ( AVAILABLE ?auto_53252 ) ( SURFACE-AT ?auto_53237 ?auto_53254 ) ( ON ?auto_53237 ?auto_53247 ) ( CLEAR ?auto_53237 ) ( not ( = ?auto_53236 ?auto_53247 ) ) ( not ( = ?auto_53237 ?auto_53247 ) ) ( not ( = ?auto_53238 ?auto_53247 ) ) ( not ( = ?auto_53249 ?auto_53247 ) ) ( IS-CRATE ?auto_53249 ) ( not ( = ?auto_53236 ?auto_53241 ) ) ( not ( = ?auto_53237 ?auto_53241 ) ) ( not ( = ?auto_53238 ?auto_53241 ) ) ( not ( = ?auto_53249 ?auto_53241 ) ) ( not ( = ?auto_53247 ?auto_53241 ) ) ( not ( = ?auto_53244 ?auto_53240 ) ) ( not ( = ?auto_53239 ?auto_53244 ) ) ( not ( = ?auto_53254 ?auto_53244 ) ) ( HOIST-AT ?auto_53243 ?auto_53244 ) ( not ( = ?auto_53256 ?auto_53243 ) ) ( not ( = ?auto_53257 ?auto_53243 ) ) ( not ( = ?auto_53252 ?auto_53243 ) ) ( AVAILABLE ?auto_53243 ) ( SURFACE-AT ?auto_53249 ?auto_53244 ) ( ON ?auto_53249 ?auto_53253 ) ( CLEAR ?auto_53249 ) ( not ( = ?auto_53236 ?auto_53253 ) ) ( not ( = ?auto_53237 ?auto_53253 ) ) ( not ( = ?auto_53238 ?auto_53253 ) ) ( not ( = ?auto_53249 ?auto_53253 ) ) ( not ( = ?auto_53247 ?auto_53253 ) ) ( not ( = ?auto_53241 ?auto_53253 ) ) ( IS-CRATE ?auto_53241 ) ( not ( = ?auto_53236 ?auto_53250 ) ) ( not ( = ?auto_53237 ?auto_53250 ) ) ( not ( = ?auto_53238 ?auto_53250 ) ) ( not ( = ?auto_53249 ?auto_53250 ) ) ( not ( = ?auto_53247 ?auto_53250 ) ) ( not ( = ?auto_53241 ?auto_53250 ) ) ( not ( = ?auto_53253 ?auto_53250 ) ) ( AVAILABLE ?auto_53257 ) ( SURFACE-AT ?auto_53241 ?auto_53239 ) ( ON ?auto_53241 ?auto_53246 ) ( CLEAR ?auto_53241 ) ( not ( = ?auto_53236 ?auto_53246 ) ) ( not ( = ?auto_53237 ?auto_53246 ) ) ( not ( = ?auto_53238 ?auto_53246 ) ) ( not ( = ?auto_53249 ?auto_53246 ) ) ( not ( = ?auto_53247 ?auto_53246 ) ) ( not ( = ?auto_53241 ?auto_53246 ) ) ( not ( = ?auto_53253 ?auto_53246 ) ) ( not ( = ?auto_53250 ?auto_53246 ) ) ( SURFACE-AT ?auto_53248 ?auto_53240 ) ( CLEAR ?auto_53248 ) ( IS-CRATE ?auto_53250 ) ( not ( = ?auto_53236 ?auto_53248 ) ) ( not ( = ?auto_53237 ?auto_53248 ) ) ( not ( = ?auto_53238 ?auto_53248 ) ) ( not ( = ?auto_53249 ?auto_53248 ) ) ( not ( = ?auto_53247 ?auto_53248 ) ) ( not ( = ?auto_53241 ?auto_53248 ) ) ( not ( = ?auto_53253 ?auto_53248 ) ) ( not ( = ?auto_53250 ?auto_53248 ) ) ( not ( = ?auto_53246 ?auto_53248 ) ) ( AVAILABLE ?auto_53256 ) ( not ( = ?auto_53251 ?auto_53240 ) ) ( not ( = ?auto_53239 ?auto_53251 ) ) ( not ( = ?auto_53254 ?auto_53251 ) ) ( not ( = ?auto_53244 ?auto_53251 ) ) ( HOIST-AT ?auto_53245 ?auto_53251 ) ( not ( = ?auto_53256 ?auto_53245 ) ) ( not ( = ?auto_53257 ?auto_53245 ) ) ( not ( = ?auto_53252 ?auto_53245 ) ) ( not ( = ?auto_53243 ?auto_53245 ) ) ( AVAILABLE ?auto_53245 ) ( SURFACE-AT ?auto_53250 ?auto_53251 ) ( ON ?auto_53250 ?auto_53255 ) ( CLEAR ?auto_53250 ) ( not ( = ?auto_53236 ?auto_53255 ) ) ( not ( = ?auto_53237 ?auto_53255 ) ) ( not ( = ?auto_53238 ?auto_53255 ) ) ( not ( = ?auto_53249 ?auto_53255 ) ) ( not ( = ?auto_53247 ?auto_53255 ) ) ( not ( = ?auto_53241 ?auto_53255 ) ) ( not ( = ?auto_53253 ?auto_53255 ) ) ( not ( = ?auto_53250 ?auto_53255 ) ) ( not ( = ?auto_53246 ?auto_53255 ) ) ( not ( = ?auto_53248 ?auto_53255 ) ) ( TRUCK-AT ?auto_53242 ?auto_53240 ) )
    :subtasks
    ( ( !DRIVE ?auto_53242 ?auto_53240 ?auto_53251 )
      ( MAKE-ON ?auto_53236 ?auto_53237 )
      ( MAKE-ON-VERIFY ?auto_53236 ?auto_53237 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53258 - SURFACE
      ?auto_53259 - SURFACE
    )
    :vars
    (
      ?auto_53274 - HOIST
      ?auto_53278 - PLACE
      ?auto_53270 - PLACE
      ?auto_53275 - HOIST
      ?auto_53261 - SURFACE
      ?auto_53268 - SURFACE
      ?auto_53272 - PLACE
      ?auto_53260 - HOIST
      ?auto_53262 - SURFACE
      ?auto_53279 - SURFACE
      ?auto_53267 - PLACE
      ?auto_53263 - HOIST
      ?auto_53276 - SURFACE
      ?auto_53264 - SURFACE
      ?auto_53277 - SURFACE
      ?auto_53266 - SURFACE
      ?auto_53265 - PLACE
      ?auto_53271 - HOIST
      ?auto_53273 - SURFACE
      ?auto_53269 - TRUCK
      ?auto_53280 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53274 ?auto_53278 ) ( IS-CRATE ?auto_53258 ) ( not ( = ?auto_53258 ?auto_53259 ) ) ( not ( = ?auto_53270 ?auto_53278 ) ) ( HOIST-AT ?auto_53275 ?auto_53270 ) ( not ( = ?auto_53274 ?auto_53275 ) ) ( SURFACE-AT ?auto_53258 ?auto_53270 ) ( ON ?auto_53258 ?auto_53261 ) ( CLEAR ?auto_53258 ) ( not ( = ?auto_53258 ?auto_53261 ) ) ( not ( = ?auto_53259 ?auto_53261 ) ) ( IS-CRATE ?auto_53259 ) ( not ( = ?auto_53258 ?auto_53268 ) ) ( not ( = ?auto_53259 ?auto_53268 ) ) ( not ( = ?auto_53261 ?auto_53268 ) ) ( not ( = ?auto_53272 ?auto_53278 ) ) ( not ( = ?auto_53270 ?auto_53272 ) ) ( HOIST-AT ?auto_53260 ?auto_53272 ) ( not ( = ?auto_53274 ?auto_53260 ) ) ( not ( = ?auto_53275 ?auto_53260 ) ) ( AVAILABLE ?auto_53260 ) ( SURFACE-AT ?auto_53259 ?auto_53272 ) ( ON ?auto_53259 ?auto_53262 ) ( CLEAR ?auto_53259 ) ( not ( = ?auto_53258 ?auto_53262 ) ) ( not ( = ?auto_53259 ?auto_53262 ) ) ( not ( = ?auto_53261 ?auto_53262 ) ) ( not ( = ?auto_53268 ?auto_53262 ) ) ( IS-CRATE ?auto_53268 ) ( not ( = ?auto_53258 ?auto_53279 ) ) ( not ( = ?auto_53259 ?auto_53279 ) ) ( not ( = ?auto_53261 ?auto_53279 ) ) ( not ( = ?auto_53268 ?auto_53279 ) ) ( not ( = ?auto_53262 ?auto_53279 ) ) ( not ( = ?auto_53267 ?auto_53278 ) ) ( not ( = ?auto_53270 ?auto_53267 ) ) ( not ( = ?auto_53272 ?auto_53267 ) ) ( HOIST-AT ?auto_53263 ?auto_53267 ) ( not ( = ?auto_53274 ?auto_53263 ) ) ( not ( = ?auto_53275 ?auto_53263 ) ) ( not ( = ?auto_53260 ?auto_53263 ) ) ( AVAILABLE ?auto_53263 ) ( SURFACE-AT ?auto_53268 ?auto_53267 ) ( ON ?auto_53268 ?auto_53276 ) ( CLEAR ?auto_53268 ) ( not ( = ?auto_53258 ?auto_53276 ) ) ( not ( = ?auto_53259 ?auto_53276 ) ) ( not ( = ?auto_53261 ?auto_53276 ) ) ( not ( = ?auto_53268 ?auto_53276 ) ) ( not ( = ?auto_53262 ?auto_53276 ) ) ( not ( = ?auto_53279 ?auto_53276 ) ) ( IS-CRATE ?auto_53279 ) ( not ( = ?auto_53258 ?auto_53264 ) ) ( not ( = ?auto_53259 ?auto_53264 ) ) ( not ( = ?auto_53261 ?auto_53264 ) ) ( not ( = ?auto_53268 ?auto_53264 ) ) ( not ( = ?auto_53262 ?auto_53264 ) ) ( not ( = ?auto_53279 ?auto_53264 ) ) ( not ( = ?auto_53276 ?auto_53264 ) ) ( AVAILABLE ?auto_53275 ) ( SURFACE-AT ?auto_53279 ?auto_53270 ) ( ON ?auto_53279 ?auto_53277 ) ( CLEAR ?auto_53279 ) ( not ( = ?auto_53258 ?auto_53277 ) ) ( not ( = ?auto_53259 ?auto_53277 ) ) ( not ( = ?auto_53261 ?auto_53277 ) ) ( not ( = ?auto_53268 ?auto_53277 ) ) ( not ( = ?auto_53262 ?auto_53277 ) ) ( not ( = ?auto_53279 ?auto_53277 ) ) ( not ( = ?auto_53276 ?auto_53277 ) ) ( not ( = ?auto_53264 ?auto_53277 ) ) ( IS-CRATE ?auto_53264 ) ( not ( = ?auto_53258 ?auto_53266 ) ) ( not ( = ?auto_53259 ?auto_53266 ) ) ( not ( = ?auto_53261 ?auto_53266 ) ) ( not ( = ?auto_53268 ?auto_53266 ) ) ( not ( = ?auto_53262 ?auto_53266 ) ) ( not ( = ?auto_53279 ?auto_53266 ) ) ( not ( = ?auto_53276 ?auto_53266 ) ) ( not ( = ?auto_53264 ?auto_53266 ) ) ( not ( = ?auto_53277 ?auto_53266 ) ) ( not ( = ?auto_53265 ?auto_53278 ) ) ( not ( = ?auto_53270 ?auto_53265 ) ) ( not ( = ?auto_53272 ?auto_53265 ) ) ( not ( = ?auto_53267 ?auto_53265 ) ) ( HOIST-AT ?auto_53271 ?auto_53265 ) ( not ( = ?auto_53274 ?auto_53271 ) ) ( not ( = ?auto_53275 ?auto_53271 ) ) ( not ( = ?auto_53260 ?auto_53271 ) ) ( not ( = ?auto_53263 ?auto_53271 ) ) ( AVAILABLE ?auto_53271 ) ( SURFACE-AT ?auto_53264 ?auto_53265 ) ( ON ?auto_53264 ?auto_53273 ) ( CLEAR ?auto_53264 ) ( not ( = ?auto_53258 ?auto_53273 ) ) ( not ( = ?auto_53259 ?auto_53273 ) ) ( not ( = ?auto_53261 ?auto_53273 ) ) ( not ( = ?auto_53268 ?auto_53273 ) ) ( not ( = ?auto_53262 ?auto_53273 ) ) ( not ( = ?auto_53279 ?auto_53273 ) ) ( not ( = ?auto_53276 ?auto_53273 ) ) ( not ( = ?auto_53264 ?auto_53273 ) ) ( not ( = ?auto_53277 ?auto_53273 ) ) ( not ( = ?auto_53266 ?auto_53273 ) ) ( TRUCK-AT ?auto_53269 ?auto_53278 ) ( SURFACE-AT ?auto_53280 ?auto_53278 ) ( CLEAR ?auto_53280 ) ( LIFTING ?auto_53274 ?auto_53266 ) ( IS-CRATE ?auto_53266 ) ( not ( = ?auto_53258 ?auto_53280 ) ) ( not ( = ?auto_53259 ?auto_53280 ) ) ( not ( = ?auto_53261 ?auto_53280 ) ) ( not ( = ?auto_53268 ?auto_53280 ) ) ( not ( = ?auto_53262 ?auto_53280 ) ) ( not ( = ?auto_53279 ?auto_53280 ) ) ( not ( = ?auto_53276 ?auto_53280 ) ) ( not ( = ?auto_53264 ?auto_53280 ) ) ( not ( = ?auto_53277 ?auto_53280 ) ) ( not ( = ?auto_53266 ?auto_53280 ) ) ( not ( = ?auto_53273 ?auto_53280 ) ) )
    :subtasks
    ( ( !DROP ?auto_53274 ?auto_53266 ?auto_53280 ?auto_53278 )
      ( MAKE-ON ?auto_53258 ?auto_53259 )
      ( MAKE-ON-VERIFY ?auto_53258 ?auto_53259 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53281 - SURFACE
      ?auto_53282 - SURFACE
    )
    :vars
    (
      ?auto_53287 - HOIST
      ?auto_53302 - PLACE
      ?auto_53294 - PLACE
      ?auto_53299 - HOIST
      ?auto_53291 - SURFACE
      ?auto_53301 - SURFACE
      ?auto_53298 - PLACE
      ?auto_53289 - HOIST
      ?auto_53300 - SURFACE
      ?auto_53303 - SURFACE
      ?auto_53296 - PLACE
      ?auto_53284 - HOIST
      ?auto_53286 - SURFACE
      ?auto_53292 - SURFACE
      ?auto_53285 - SURFACE
      ?auto_53288 - SURFACE
      ?auto_53297 - PLACE
      ?auto_53290 - HOIST
      ?auto_53293 - SURFACE
      ?auto_53295 - TRUCK
      ?auto_53283 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53287 ?auto_53302 ) ( IS-CRATE ?auto_53281 ) ( not ( = ?auto_53281 ?auto_53282 ) ) ( not ( = ?auto_53294 ?auto_53302 ) ) ( HOIST-AT ?auto_53299 ?auto_53294 ) ( not ( = ?auto_53287 ?auto_53299 ) ) ( SURFACE-AT ?auto_53281 ?auto_53294 ) ( ON ?auto_53281 ?auto_53291 ) ( CLEAR ?auto_53281 ) ( not ( = ?auto_53281 ?auto_53291 ) ) ( not ( = ?auto_53282 ?auto_53291 ) ) ( IS-CRATE ?auto_53282 ) ( not ( = ?auto_53281 ?auto_53301 ) ) ( not ( = ?auto_53282 ?auto_53301 ) ) ( not ( = ?auto_53291 ?auto_53301 ) ) ( not ( = ?auto_53298 ?auto_53302 ) ) ( not ( = ?auto_53294 ?auto_53298 ) ) ( HOIST-AT ?auto_53289 ?auto_53298 ) ( not ( = ?auto_53287 ?auto_53289 ) ) ( not ( = ?auto_53299 ?auto_53289 ) ) ( AVAILABLE ?auto_53289 ) ( SURFACE-AT ?auto_53282 ?auto_53298 ) ( ON ?auto_53282 ?auto_53300 ) ( CLEAR ?auto_53282 ) ( not ( = ?auto_53281 ?auto_53300 ) ) ( not ( = ?auto_53282 ?auto_53300 ) ) ( not ( = ?auto_53291 ?auto_53300 ) ) ( not ( = ?auto_53301 ?auto_53300 ) ) ( IS-CRATE ?auto_53301 ) ( not ( = ?auto_53281 ?auto_53303 ) ) ( not ( = ?auto_53282 ?auto_53303 ) ) ( not ( = ?auto_53291 ?auto_53303 ) ) ( not ( = ?auto_53301 ?auto_53303 ) ) ( not ( = ?auto_53300 ?auto_53303 ) ) ( not ( = ?auto_53296 ?auto_53302 ) ) ( not ( = ?auto_53294 ?auto_53296 ) ) ( not ( = ?auto_53298 ?auto_53296 ) ) ( HOIST-AT ?auto_53284 ?auto_53296 ) ( not ( = ?auto_53287 ?auto_53284 ) ) ( not ( = ?auto_53299 ?auto_53284 ) ) ( not ( = ?auto_53289 ?auto_53284 ) ) ( AVAILABLE ?auto_53284 ) ( SURFACE-AT ?auto_53301 ?auto_53296 ) ( ON ?auto_53301 ?auto_53286 ) ( CLEAR ?auto_53301 ) ( not ( = ?auto_53281 ?auto_53286 ) ) ( not ( = ?auto_53282 ?auto_53286 ) ) ( not ( = ?auto_53291 ?auto_53286 ) ) ( not ( = ?auto_53301 ?auto_53286 ) ) ( not ( = ?auto_53300 ?auto_53286 ) ) ( not ( = ?auto_53303 ?auto_53286 ) ) ( IS-CRATE ?auto_53303 ) ( not ( = ?auto_53281 ?auto_53292 ) ) ( not ( = ?auto_53282 ?auto_53292 ) ) ( not ( = ?auto_53291 ?auto_53292 ) ) ( not ( = ?auto_53301 ?auto_53292 ) ) ( not ( = ?auto_53300 ?auto_53292 ) ) ( not ( = ?auto_53303 ?auto_53292 ) ) ( not ( = ?auto_53286 ?auto_53292 ) ) ( AVAILABLE ?auto_53299 ) ( SURFACE-AT ?auto_53303 ?auto_53294 ) ( ON ?auto_53303 ?auto_53285 ) ( CLEAR ?auto_53303 ) ( not ( = ?auto_53281 ?auto_53285 ) ) ( not ( = ?auto_53282 ?auto_53285 ) ) ( not ( = ?auto_53291 ?auto_53285 ) ) ( not ( = ?auto_53301 ?auto_53285 ) ) ( not ( = ?auto_53300 ?auto_53285 ) ) ( not ( = ?auto_53303 ?auto_53285 ) ) ( not ( = ?auto_53286 ?auto_53285 ) ) ( not ( = ?auto_53292 ?auto_53285 ) ) ( IS-CRATE ?auto_53292 ) ( not ( = ?auto_53281 ?auto_53288 ) ) ( not ( = ?auto_53282 ?auto_53288 ) ) ( not ( = ?auto_53291 ?auto_53288 ) ) ( not ( = ?auto_53301 ?auto_53288 ) ) ( not ( = ?auto_53300 ?auto_53288 ) ) ( not ( = ?auto_53303 ?auto_53288 ) ) ( not ( = ?auto_53286 ?auto_53288 ) ) ( not ( = ?auto_53292 ?auto_53288 ) ) ( not ( = ?auto_53285 ?auto_53288 ) ) ( not ( = ?auto_53297 ?auto_53302 ) ) ( not ( = ?auto_53294 ?auto_53297 ) ) ( not ( = ?auto_53298 ?auto_53297 ) ) ( not ( = ?auto_53296 ?auto_53297 ) ) ( HOIST-AT ?auto_53290 ?auto_53297 ) ( not ( = ?auto_53287 ?auto_53290 ) ) ( not ( = ?auto_53299 ?auto_53290 ) ) ( not ( = ?auto_53289 ?auto_53290 ) ) ( not ( = ?auto_53284 ?auto_53290 ) ) ( AVAILABLE ?auto_53290 ) ( SURFACE-AT ?auto_53292 ?auto_53297 ) ( ON ?auto_53292 ?auto_53293 ) ( CLEAR ?auto_53292 ) ( not ( = ?auto_53281 ?auto_53293 ) ) ( not ( = ?auto_53282 ?auto_53293 ) ) ( not ( = ?auto_53291 ?auto_53293 ) ) ( not ( = ?auto_53301 ?auto_53293 ) ) ( not ( = ?auto_53300 ?auto_53293 ) ) ( not ( = ?auto_53303 ?auto_53293 ) ) ( not ( = ?auto_53286 ?auto_53293 ) ) ( not ( = ?auto_53292 ?auto_53293 ) ) ( not ( = ?auto_53285 ?auto_53293 ) ) ( not ( = ?auto_53288 ?auto_53293 ) ) ( TRUCK-AT ?auto_53295 ?auto_53302 ) ( SURFACE-AT ?auto_53283 ?auto_53302 ) ( CLEAR ?auto_53283 ) ( IS-CRATE ?auto_53288 ) ( not ( = ?auto_53281 ?auto_53283 ) ) ( not ( = ?auto_53282 ?auto_53283 ) ) ( not ( = ?auto_53291 ?auto_53283 ) ) ( not ( = ?auto_53301 ?auto_53283 ) ) ( not ( = ?auto_53300 ?auto_53283 ) ) ( not ( = ?auto_53303 ?auto_53283 ) ) ( not ( = ?auto_53286 ?auto_53283 ) ) ( not ( = ?auto_53292 ?auto_53283 ) ) ( not ( = ?auto_53285 ?auto_53283 ) ) ( not ( = ?auto_53288 ?auto_53283 ) ) ( not ( = ?auto_53293 ?auto_53283 ) ) ( AVAILABLE ?auto_53287 ) ( IN ?auto_53288 ?auto_53295 ) )
    :subtasks
    ( ( !UNLOAD ?auto_53287 ?auto_53288 ?auto_53295 ?auto_53302 )
      ( MAKE-ON ?auto_53281 ?auto_53282 )
      ( MAKE-ON-VERIFY ?auto_53281 ?auto_53282 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53304 - SURFACE
      ?auto_53305 - SURFACE
    )
    :vars
    (
      ?auto_53324 - HOIST
      ?auto_53316 - PLACE
      ?auto_53306 - PLACE
      ?auto_53326 - HOIST
      ?auto_53310 - SURFACE
      ?auto_53314 - SURFACE
      ?auto_53318 - PLACE
      ?auto_53309 - HOIST
      ?auto_53317 - SURFACE
      ?auto_53315 - SURFACE
      ?auto_53308 - PLACE
      ?auto_53311 - HOIST
      ?auto_53320 - SURFACE
      ?auto_53321 - SURFACE
      ?auto_53325 - SURFACE
      ?auto_53313 - SURFACE
      ?auto_53319 - PLACE
      ?auto_53307 - HOIST
      ?auto_53323 - SURFACE
      ?auto_53312 - SURFACE
      ?auto_53322 - TRUCK
      ?auto_53327 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53324 ?auto_53316 ) ( IS-CRATE ?auto_53304 ) ( not ( = ?auto_53304 ?auto_53305 ) ) ( not ( = ?auto_53306 ?auto_53316 ) ) ( HOIST-AT ?auto_53326 ?auto_53306 ) ( not ( = ?auto_53324 ?auto_53326 ) ) ( SURFACE-AT ?auto_53304 ?auto_53306 ) ( ON ?auto_53304 ?auto_53310 ) ( CLEAR ?auto_53304 ) ( not ( = ?auto_53304 ?auto_53310 ) ) ( not ( = ?auto_53305 ?auto_53310 ) ) ( IS-CRATE ?auto_53305 ) ( not ( = ?auto_53304 ?auto_53314 ) ) ( not ( = ?auto_53305 ?auto_53314 ) ) ( not ( = ?auto_53310 ?auto_53314 ) ) ( not ( = ?auto_53318 ?auto_53316 ) ) ( not ( = ?auto_53306 ?auto_53318 ) ) ( HOIST-AT ?auto_53309 ?auto_53318 ) ( not ( = ?auto_53324 ?auto_53309 ) ) ( not ( = ?auto_53326 ?auto_53309 ) ) ( AVAILABLE ?auto_53309 ) ( SURFACE-AT ?auto_53305 ?auto_53318 ) ( ON ?auto_53305 ?auto_53317 ) ( CLEAR ?auto_53305 ) ( not ( = ?auto_53304 ?auto_53317 ) ) ( not ( = ?auto_53305 ?auto_53317 ) ) ( not ( = ?auto_53310 ?auto_53317 ) ) ( not ( = ?auto_53314 ?auto_53317 ) ) ( IS-CRATE ?auto_53314 ) ( not ( = ?auto_53304 ?auto_53315 ) ) ( not ( = ?auto_53305 ?auto_53315 ) ) ( not ( = ?auto_53310 ?auto_53315 ) ) ( not ( = ?auto_53314 ?auto_53315 ) ) ( not ( = ?auto_53317 ?auto_53315 ) ) ( not ( = ?auto_53308 ?auto_53316 ) ) ( not ( = ?auto_53306 ?auto_53308 ) ) ( not ( = ?auto_53318 ?auto_53308 ) ) ( HOIST-AT ?auto_53311 ?auto_53308 ) ( not ( = ?auto_53324 ?auto_53311 ) ) ( not ( = ?auto_53326 ?auto_53311 ) ) ( not ( = ?auto_53309 ?auto_53311 ) ) ( AVAILABLE ?auto_53311 ) ( SURFACE-AT ?auto_53314 ?auto_53308 ) ( ON ?auto_53314 ?auto_53320 ) ( CLEAR ?auto_53314 ) ( not ( = ?auto_53304 ?auto_53320 ) ) ( not ( = ?auto_53305 ?auto_53320 ) ) ( not ( = ?auto_53310 ?auto_53320 ) ) ( not ( = ?auto_53314 ?auto_53320 ) ) ( not ( = ?auto_53317 ?auto_53320 ) ) ( not ( = ?auto_53315 ?auto_53320 ) ) ( IS-CRATE ?auto_53315 ) ( not ( = ?auto_53304 ?auto_53321 ) ) ( not ( = ?auto_53305 ?auto_53321 ) ) ( not ( = ?auto_53310 ?auto_53321 ) ) ( not ( = ?auto_53314 ?auto_53321 ) ) ( not ( = ?auto_53317 ?auto_53321 ) ) ( not ( = ?auto_53315 ?auto_53321 ) ) ( not ( = ?auto_53320 ?auto_53321 ) ) ( AVAILABLE ?auto_53326 ) ( SURFACE-AT ?auto_53315 ?auto_53306 ) ( ON ?auto_53315 ?auto_53325 ) ( CLEAR ?auto_53315 ) ( not ( = ?auto_53304 ?auto_53325 ) ) ( not ( = ?auto_53305 ?auto_53325 ) ) ( not ( = ?auto_53310 ?auto_53325 ) ) ( not ( = ?auto_53314 ?auto_53325 ) ) ( not ( = ?auto_53317 ?auto_53325 ) ) ( not ( = ?auto_53315 ?auto_53325 ) ) ( not ( = ?auto_53320 ?auto_53325 ) ) ( not ( = ?auto_53321 ?auto_53325 ) ) ( IS-CRATE ?auto_53321 ) ( not ( = ?auto_53304 ?auto_53313 ) ) ( not ( = ?auto_53305 ?auto_53313 ) ) ( not ( = ?auto_53310 ?auto_53313 ) ) ( not ( = ?auto_53314 ?auto_53313 ) ) ( not ( = ?auto_53317 ?auto_53313 ) ) ( not ( = ?auto_53315 ?auto_53313 ) ) ( not ( = ?auto_53320 ?auto_53313 ) ) ( not ( = ?auto_53321 ?auto_53313 ) ) ( not ( = ?auto_53325 ?auto_53313 ) ) ( not ( = ?auto_53319 ?auto_53316 ) ) ( not ( = ?auto_53306 ?auto_53319 ) ) ( not ( = ?auto_53318 ?auto_53319 ) ) ( not ( = ?auto_53308 ?auto_53319 ) ) ( HOIST-AT ?auto_53307 ?auto_53319 ) ( not ( = ?auto_53324 ?auto_53307 ) ) ( not ( = ?auto_53326 ?auto_53307 ) ) ( not ( = ?auto_53309 ?auto_53307 ) ) ( not ( = ?auto_53311 ?auto_53307 ) ) ( AVAILABLE ?auto_53307 ) ( SURFACE-AT ?auto_53321 ?auto_53319 ) ( ON ?auto_53321 ?auto_53323 ) ( CLEAR ?auto_53321 ) ( not ( = ?auto_53304 ?auto_53323 ) ) ( not ( = ?auto_53305 ?auto_53323 ) ) ( not ( = ?auto_53310 ?auto_53323 ) ) ( not ( = ?auto_53314 ?auto_53323 ) ) ( not ( = ?auto_53317 ?auto_53323 ) ) ( not ( = ?auto_53315 ?auto_53323 ) ) ( not ( = ?auto_53320 ?auto_53323 ) ) ( not ( = ?auto_53321 ?auto_53323 ) ) ( not ( = ?auto_53325 ?auto_53323 ) ) ( not ( = ?auto_53313 ?auto_53323 ) ) ( SURFACE-AT ?auto_53312 ?auto_53316 ) ( CLEAR ?auto_53312 ) ( IS-CRATE ?auto_53313 ) ( not ( = ?auto_53304 ?auto_53312 ) ) ( not ( = ?auto_53305 ?auto_53312 ) ) ( not ( = ?auto_53310 ?auto_53312 ) ) ( not ( = ?auto_53314 ?auto_53312 ) ) ( not ( = ?auto_53317 ?auto_53312 ) ) ( not ( = ?auto_53315 ?auto_53312 ) ) ( not ( = ?auto_53320 ?auto_53312 ) ) ( not ( = ?auto_53321 ?auto_53312 ) ) ( not ( = ?auto_53325 ?auto_53312 ) ) ( not ( = ?auto_53313 ?auto_53312 ) ) ( not ( = ?auto_53323 ?auto_53312 ) ) ( AVAILABLE ?auto_53324 ) ( IN ?auto_53313 ?auto_53322 ) ( TRUCK-AT ?auto_53322 ?auto_53327 ) ( not ( = ?auto_53327 ?auto_53316 ) ) ( not ( = ?auto_53306 ?auto_53327 ) ) ( not ( = ?auto_53318 ?auto_53327 ) ) ( not ( = ?auto_53308 ?auto_53327 ) ) ( not ( = ?auto_53319 ?auto_53327 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_53322 ?auto_53327 ?auto_53316 )
      ( MAKE-ON ?auto_53304 ?auto_53305 )
      ( MAKE-ON-VERIFY ?auto_53304 ?auto_53305 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53328 - SURFACE
      ?auto_53329 - SURFACE
    )
    :vars
    (
      ?auto_53332 - HOIST
      ?auto_53344 - PLACE
      ?auto_53342 - PLACE
      ?auto_53339 - HOIST
      ?auto_53346 - SURFACE
      ?auto_53341 - SURFACE
      ?auto_53337 - PLACE
      ?auto_53336 - HOIST
      ?auto_53348 - SURFACE
      ?auto_53345 - SURFACE
      ?auto_53338 - PLACE
      ?auto_53343 - HOIST
      ?auto_53330 - SURFACE
      ?auto_53349 - SURFACE
      ?auto_53333 - SURFACE
      ?auto_53351 - SURFACE
      ?auto_53347 - PLACE
      ?auto_53331 - HOIST
      ?auto_53335 - SURFACE
      ?auto_53350 - SURFACE
      ?auto_53334 - TRUCK
      ?auto_53340 - PLACE
      ?auto_53352 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_53332 ?auto_53344 ) ( IS-CRATE ?auto_53328 ) ( not ( = ?auto_53328 ?auto_53329 ) ) ( not ( = ?auto_53342 ?auto_53344 ) ) ( HOIST-AT ?auto_53339 ?auto_53342 ) ( not ( = ?auto_53332 ?auto_53339 ) ) ( SURFACE-AT ?auto_53328 ?auto_53342 ) ( ON ?auto_53328 ?auto_53346 ) ( CLEAR ?auto_53328 ) ( not ( = ?auto_53328 ?auto_53346 ) ) ( not ( = ?auto_53329 ?auto_53346 ) ) ( IS-CRATE ?auto_53329 ) ( not ( = ?auto_53328 ?auto_53341 ) ) ( not ( = ?auto_53329 ?auto_53341 ) ) ( not ( = ?auto_53346 ?auto_53341 ) ) ( not ( = ?auto_53337 ?auto_53344 ) ) ( not ( = ?auto_53342 ?auto_53337 ) ) ( HOIST-AT ?auto_53336 ?auto_53337 ) ( not ( = ?auto_53332 ?auto_53336 ) ) ( not ( = ?auto_53339 ?auto_53336 ) ) ( AVAILABLE ?auto_53336 ) ( SURFACE-AT ?auto_53329 ?auto_53337 ) ( ON ?auto_53329 ?auto_53348 ) ( CLEAR ?auto_53329 ) ( not ( = ?auto_53328 ?auto_53348 ) ) ( not ( = ?auto_53329 ?auto_53348 ) ) ( not ( = ?auto_53346 ?auto_53348 ) ) ( not ( = ?auto_53341 ?auto_53348 ) ) ( IS-CRATE ?auto_53341 ) ( not ( = ?auto_53328 ?auto_53345 ) ) ( not ( = ?auto_53329 ?auto_53345 ) ) ( not ( = ?auto_53346 ?auto_53345 ) ) ( not ( = ?auto_53341 ?auto_53345 ) ) ( not ( = ?auto_53348 ?auto_53345 ) ) ( not ( = ?auto_53338 ?auto_53344 ) ) ( not ( = ?auto_53342 ?auto_53338 ) ) ( not ( = ?auto_53337 ?auto_53338 ) ) ( HOIST-AT ?auto_53343 ?auto_53338 ) ( not ( = ?auto_53332 ?auto_53343 ) ) ( not ( = ?auto_53339 ?auto_53343 ) ) ( not ( = ?auto_53336 ?auto_53343 ) ) ( AVAILABLE ?auto_53343 ) ( SURFACE-AT ?auto_53341 ?auto_53338 ) ( ON ?auto_53341 ?auto_53330 ) ( CLEAR ?auto_53341 ) ( not ( = ?auto_53328 ?auto_53330 ) ) ( not ( = ?auto_53329 ?auto_53330 ) ) ( not ( = ?auto_53346 ?auto_53330 ) ) ( not ( = ?auto_53341 ?auto_53330 ) ) ( not ( = ?auto_53348 ?auto_53330 ) ) ( not ( = ?auto_53345 ?auto_53330 ) ) ( IS-CRATE ?auto_53345 ) ( not ( = ?auto_53328 ?auto_53349 ) ) ( not ( = ?auto_53329 ?auto_53349 ) ) ( not ( = ?auto_53346 ?auto_53349 ) ) ( not ( = ?auto_53341 ?auto_53349 ) ) ( not ( = ?auto_53348 ?auto_53349 ) ) ( not ( = ?auto_53345 ?auto_53349 ) ) ( not ( = ?auto_53330 ?auto_53349 ) ) ( AVAILABLE ?auto_53339 ) ( SURFACE-AT ?auto_53345 ?auto_53342 ) ( ON ?auto_53345 ?auto_53333 ) ( CLEAR ?auto_53345 ) ( not ( = ?auto_53328 ?auto_53333 ) ) ( not ( = ?auto_53329 ?auto_53333 ) ) ( not ( = ?auto_53346 ?auto_53333 ) ) ( not ( = ?auto_53341 ?auto_53333 ) ) ( not ( = ?auto_53348 ?auto_53333 ) ) ( not ( = ?auto_53345 ?auto_53333 ) ) ( not ( = ?auto_53330 ?auto_53333 ) ) ( not ( = ?auto_53349 ?auto_53333 ) ) ( IS-CRATE ?auto_53349 ) ( not ( = ?auto_53328 ?auto_53351 ) ) ( not ( = ?auto_53329 ?auto_53351 ) ) ( not ( = ?auto_53346 ?auto_53351 ) ) ( not ( = ?auto_53341 ?auto_53351 ) ) ( not ( = ?auto_53348 ?auto_53351 ) ) ( not ( = ?auto_53345 ?auto_53351 ) ) ( not ( = ?auto_53330 ?auto_53351 ) ) ( not ( = ?auto_53349 ?auto_53351 ) ) ( not ( = ?auto_53333 ?auto_53351 ) ) ( not ( = ?auto_53347 ?auto_53344 ) ) ( not ( = ?auto_53342 ?auto_53347 ) ) ( not ( = ?auto_53337 ?auto_53347 ) ) ( not ( = ?auto_53338 ?auto_53347 ) ) ( HOIST-AT ?auto_53331 ?auto_53347 ) ( not ( = ?auto_53332 ?auto_53331 ) ) ( not ( = ?auto_53339 ?auto_53331 ) ) ( not ( = ?auto_53336 ?auto_53331 ) ) ( not ( = ?auto_53343 ?auto_53331 ) ) ( AVAILABLE ?auto_53331 ) ( SURFACE-AT ?auto_53349 ?auto_53347 ) ( ON ?auto_53349 ?auto_53335 ) ( CLEAR ?auto_53349 ) ( not ( = ?auto_53328 ?auto_53335 ) ) ( not ( = ?auto_53329 ?auto_53335 ) ) ( not ( = ?auto_53346 ?auto_53335 ) ) ( not ( = ?auto_53341 ?auto_53335 ) ) ( not ( = ?auto_53348 ?auto_53335 ) ) ( not ( = ?auto_53345 ?auto_53335 ) ) ( not ( = ?auto_53330 ?auto_53335 ) ) ( not ( = ?auto_53349 ?auto_53335 ) ) ( not ( = ?auto_53333 ?auto_53335 ) ) ( not ( = ?auto_53351 ?auto_53335 ) ) ( SURFACE-AT ?auto_53350 ?auto_53344 ) ( CLEAR ?auto_53350 ) ( IS-CRATE ?auto_53351 ) ( not ( = ?auto_53328 ?auto_53350 ) ) ( not ( = ?auto_53329 ?auto_53350 ) ) ( not ( = ?auto_53346 ?auto_53350 ) ) ( not ( = ?auto_53341 ?auto_53350 ) ) ( not ( = ?auto_53348 ?auto_53350 ) ) ( not ( = ?auto_53345 ?auto_53350 ) ) ( not ( = ?auto_53330 ?auto_53350 ) ) ( not ( = ?auto_53349 ?auto_53350 ) ) ( not ( = ?auto_53333 ?auto_53350 ) ) ( not ( = ?auto_53351 ?auto_53350 ) ) ( not ( = ?auto_53335 ?auto_53350 ) ) ( AVAILABLE ?auto_53332 ) ( TRUCK-AT ?auto_53334 ?auto_53340 ) ( not ( = ?auto_53340 ?auto_53344 ) ) ( not ( = ?auto_53342 ?auto_53340 ) ) ( not ( = ?auto_53337 ?auto_53340 ) ) ( not ( = ?auto_53338 ?auto_53340 ) ) ( not ( = ?auto_53347 ?auto_53340 ) ) ( HOIST-AT ?auto_53352 ?auto_53340 ) ( LIFTING ?auto_53352 ?auto_53351 ) ( not ( = ?auto_53332 ?auto_53352 ) ) ( not ( = ?auto_53339 ?auto_53352 ) ) ( not ( = ?auto_53336 ?auto_53352 ) ) ( not ( = ?auto_53343 ?auto_53352 ) ) ( not ( = ?auto_53331 ?auto_53352 ) ) )
    :subtasks
    ( ( !LOAD ?auto_53352 ?auto_53351 ?auto_53334 ?auto_53340 )
      ( MAKE-ON ?auto_53328 ?auto_53329 )
      ( MAKE-ON-VERIFY ?auto_53328 ?auto_53329 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53353 - SURFACE
      ?auto_53354 - SURFACE
    )
    :vars
    (
      ?auto_53363 - HOIST
      ?auto_53373 - PLACE
      ?auto_53368 - PLACE
      ?auto_53374 - HOIST
      ?auto_53357 - SURFACE
      ?auto_53370 - SURFACE
      ?auto_53362 - PLACE
      ?auto_53355 - HOIST
      ?auto_53356 - SURFACE
      ?auto_53358 - SURFACE
      ?auto_53360 - PLACE
      ?auto_53371 - HOIST
      ?auto_53372 - SURFACE
      ?auto_53375 - SURFACE
      ?auto_53364 - SURFACE
      ?auto_53367 - SURFACE
      ?auto_53377 - PLACE
      ?auto_53365 - HOIST
      ?auto_53361 - SURFACE
      ?auto_53366 - SURFACE
      ?auto_53376 - TRUCK
      ?auto_53369 - PLACE
      ?auto_53359 - HOIST
      ?auto_53378 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53363 ?auto_53373 ) ( IS-CRATE ?auto_53353 ) ( not ( = ?auto_53353 ?auto_53354 ) ) ( not ( = ?auto_53368 ?auto_53373 ) ) ( HOIST-AT ?auto_53374 ?auto_53368 ) ( not ( = ?auto_53363 ?auto_53374 ) ) ( SURFACE-AT ?auto_53353 ?auto_53368 ) ( ON ?auto_53353 ?auto_53357 ) ( CLEAR ?auto_53353 ) ( not ( = ?auto_53353 ?auto_53357 ) ) ( not ( = ?auto_53354 ?auto_53357 ) ) ( IS-CRATE ?auto_53354 ) ( not ( = ?auto_53353 ?auto_53370 ) ) ( not ( = ?auto_53354 ?auto_53370 ) ) ( not ( = ?auto_53357 ?auto_53370 ) ) ( not ( = ?auto_53362 ?auto_53373 ) ) ( not ( = ?auto_53368 ?auto_53362 ) ) ( HOIST-AT ?auto_53355 ?auto_53362 ) ( not ( = ?auto_53363 ?auto_53355 ) ) ( not ( = ?auto_53374 ?auto_53355 ) ) ( AVAILABLE ?auto_53355 ) ( SURFACE-AT ?auto_53354 ?auto_53362 ) ( ON ?auto_53354 ?auto_53356 ) ( CLEAR ?auto_53354 ) ( not ( = ?auto_53353 ?auto_53356 ) ) ( not ( = ?auto_53354 ?auto_53356 ) ) ( not ( = ?auto_53357 ?auto_53356 ) ) ( not ( = ?auto_53370 ?auto_53356 ) ) ( IS-CRATE ?auto_53370 ) ( not ( = ?auto_53353 ?auto_53358 ) ) ( not ( = ?auto_53354 ?auto_53358 ) ) ( not ( = ?auto_53357 ?auto_53358 ) ) ( not ( = ?auto_53370 ?auto_53358 ) ) ( not ( = ?auto_53356 ?auto_53358 ) ) ( not ( = ?auto_53360 ?auto_53373 ) ) ( not ( = ?auto_53368 ?auto_53360 ) ) ( not ( = ?auto_53362 ?auto_53360 ) ) ( HOIST-AT ?auto_53371 ?auto_53360 ) ( not ( = ?auto_53363 ?auto_53371 ) ) ( not ( = ?auto_53374 ?auto_53371 ) ) ( not ( = ?auto_53355 ?auto_53371 ) ) ( AVAILABLE ?auto_53371 ) ( SURFACE-AT ?auto_53370 ?auto_53360 ) ( ON ?auto_53370 ?auto_53372 ) ( CLEAR ?auto_53370 ) ( not ( = ?auto_53353 ?auto_53372 ) ) ( not ( = ?auto_53354 ?auto_53372 ) ) ( not ( = ?auto_53357 ?auto_53372 ) ) ( not ( = ?auto_53370 ?auto_53372 ) ) ( not ( = ?auto_53356 ?auto_53372 ) ) ( not ( = ?auto_53358 ?auto_53372 ) ) ( IS-CRATE ?auto_53358 ) ( not ( = ?auto_53353 ?auto_53375 ) ) ( not ( = ?auto_53354 ?auto_53375 ) ) ( not ( = ?auto_53357 ?auto_53375 ) ) ( not ( = ?auto_53370 ?auto_53375 ) ) ( not ( = ?auto_53356 ?auto_53375 ) ) ( not ( = ?auto_53358 ?auto_53375 ) ) ( not ( = ?auto_53372 ?auto_53375 ) ) ( AVAILABLE ?auto_53374 ) ( SURFACE-AT ?auto_53358 ?auto_53368 ) ( ON ?auto_53358 ?auto_53364 ) ( CLEAR ?auto_53358 ) ( not ( = ?auto_53353 ?auto_53364 ) ) ( not ( = ?auto_53354 ?auto_53364 ) ) ( not ( = ?auto_53357 ?auto_53364 ) ) ( not ( = ?auto_53370 ?auto_53364 ) ) ( not ( = ?auto_53356 ?auto_53364 ) ) ( not ( = ?auto_53358 ?auto_53364 ) ) ( not ( = ?auto_53372 ?auto_53364 ) ) ( not ( = ?auto_53375 ?auto_53364 ) ) ( IS-CRATE ?auto_53375 ) ( not ( = ?auto_53353 ?auto_53367 ) ) ( not ( = ?auto_53354 ?auto_53367 ) ) ( not ( = ?auto_53357 ?auto_53367 ) ) ( not ( = ?auto_53370 ?auto_53367 ) ) ( not ( = ?auto_53356 ?auto_53367 ) ) ( not ( = ?auto_53358 ?auto_53367 ) ) ( not ( = ?auto_53372 ?auto_53367 ) ) ( not ( = ?auto_53375 ?auto_53367 ) ) ( not ( = ?auto_53364 ?auto_53367 ) ) ( not ( = ?auto_53377 ?auto_53373 ) ) ( not ( = ?auto_53368 ?auto_53377 ) ) ( not ( = ?auto_53362 ?auto_53377 ) ) ( not ( = ?auto_53360 ?auto_53377 ) ) ( HOIST-AT ?auto_53365 ?auto_53377 ) ( not ( = ?auto_53363 ?auto_53365 ) ) ( not ( = ?auto_53374 ?auto_53365 ) ) ( not ( = ?auto_53355 ?auto_53365 ) ) ( not ( = ?auto_53371 ?auto_53365 ) ) ( AVAILABLE ?auto_53365 ) ( SURFACE-AT ?auto_53375 ?auto_53377 ) ( ON ?auto_53375 ?auto_53361 ) ( CLEAR ?auto_53375 ) ( not ( = ?auto_53353 ?auto_53361 ) ) ( not ( = ?auto_53354 ?auto_53361 ) ) ( not ( = ?auto_53357 ?auto_53361 ) ) ( not ( = ?auto_53370 ?auto_53361 ) ) ( not ( = ?auto_53356 ?auto_53361 ) ) ( not ( = ?auto_53358 ?auto_53361 ) ) ( not ( = ?auto_53372 ?auto_53361 ) ) ( not ( = ?auto_53375 ?auto_53361 ) ) ( not ( = ?auto_53364 ?auto_53361 ) ) ( not ( = ?auto_53367 ?auto_53361 ) ) ( SURFACE-AT ?auto_53366 ?auto_53373 ) ( CLEAR ?auto_53366 ) ( IS-CRATE ?auto_53367 ) ( not ( = ?auto_53353 ?auto_53366 ) ) ( not ( = ?auto_53354 ?auto_53366 ) ) ( not ( = ?auto_53357 ?auto_53366 ) ) ( not ( = ?auto_53370 ?auto_53366 ) ) ( not ( = ?auto_53356 ?auto_53366 ) ) ( not ( = ?auto_53358 ?auto_53366 ) ) ( not ( = ?auto_53372 ?auto_53366 ) ) ( not ( = ?auto_53375 ?auto_53366 ) ) ( not ( = ?auto_53364 ?auto_53366 ) ) ( not ( = ?auto_53367 ?auto_53366 ) ) ( not ( = ?auto_53361 ?auto_53366 ) ) ( AVAILABLE ?auto_53363 ) ( TRUCK-AT ?auto_53376 ?auto_53369 ) ( not ( = ?auto_53369 ?auto_53373 ) ) ( not ( = ?auto_53368 ?auto_53369 ) ) ( not ( = ?auto_53362 ?auto_53369 ) ) ( not ( = ?auto_53360 ?auto_53369 ) ) ( not ( = ?auto_53377 ?auto_53369 ) ) ( HOIST-AT ?auto_53359 ?auto_53369 ) ( not ( = ?auto_53363 ?auto_53359 ) ) ( not ( = ?auto_53374 ?auto_53359 ) ) ( not ( = ?auto_53355 ?auto_53359 ) ) ( not ( = ?auto_53371 ?auto_53359 ) ) ( not ( = ?auto_53365 ?auto_53359 ) ) ( AVAILABLE ?auto_53359 ) ( SURFACE-AT ?auto_53367 ?auto_53369 ) ( ON ?auto_53367 ?auto_53378 ) ( CLEAR ?auto_53367 ) ( not ( = ?auto_53353 ?auto_53378 ) ) ( not ( = ?auto_53354 ?auto_53378 ) ) ( not ( = ?auto_53357 ?auto_53378 ) ) ( not ( = ?auto_53370 ?auto_53378 ) ) ( not ( = ?auto_53356 ?auto_53378 ) ) ( not ( = ?auto_53358 ?auto_53378 ) ) ( not ( = ?auto_53372 ?auto_53378 ) ) ( not ( = ?auto_53375 ?auto_53378 ) ) ( not ( = ?auto_53364 ?auto_53378 ) ) ( not ( = ?auto_53367 ?auto_53378 ) ) ( not ( = ?auto_53361 ?auto_53378 ) ) ( not ( = ?auto_53366 ?auto_53378 ) ) )
    :subtasks
    ( ( !LIFT ?auto_53359 ?auto_53367 ?auto_53378 ?auto_53369 )
      ( MAKE-ON ?auto_53353 ?auto_53354 )
      ( MAKE-ON-VERIFY ?auto_53353 ?auto_53354 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53379 - SURFACE
      ?auto_53380 - SURFACE
    )
    :vars
    (
      ?auto_53397 - HOIST
      ?auto_53383 - PLACE
      ?auto_53386 - PLACE
      ?auto_53399 - HOIST
      ?auto_53401 - SURFACE
      ?auto_53393 - SURFACE
      ?auto_53387 - PLACE
      ?auto_53392 - HOIST
      ?auto_53395 - SURFACE
      ?auto_53403 - SURFACE
      ?auto_53396 - PLACE
      ?auto_53398 - HOIST
      ?auto_53382 - SURFACE
      ?auto_53400 - SURFACE
      ?auto_53384 - SURFACE
      ?auto_53391 - SURFACE
      ?auto_53381 - PLACE
      ?auto_53385 - HOIST
      ?auto_53388 - SURFACE
      ?auto_53390 - SURFACE
      ?auto_53394 - PLACE
      ?auto_53402 - HOIST
      ?auto_53389 - SURFACE
      ?auto_53404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53397 ?auto_53383 ) ( IS-CRATE ?auto_53379 ) ( not ( = ?auto_53379 ?auto_53380 ) ) ( not ( = ?auto_53386 ?auto_53383 ) ) ( HOIST-AT ?auto_53399 ?auto_53386 ) ( not ( = ?auto_53397 ?auto_53399 ) ) ( SURFACE-AT ?auto_53379 ?auto_53386 ) ( ON ?auto_53379 ?auto_53401 ) ( CLEAR ?auto_53379 ) ( not ( = ?auto_53379 ?auto_53401 ) ) ( not ( = ?auto_53380 ?auto_53401 ) ) ( IS-CRATE ?auto_53380 ) ( not ( = ?auto_53379 ?auto_53393 ) ) ( not ( = ?auto_53380 ?auto_53393 ) ) ( not ( = ?auto_53401 ?auto_53393 ) ) ( not ( = ?auto_53387 ?auto_53383 ) ) ( not ( = ?auto_53386 ?auto_53387 ) ) ( HOIST-AT ?auto_53392 ?auto_53387 ) ( not ( = ?auto_53397 ?auto_53392 ) ) ( not ( = ?auto_53399 ?auto_53392 ) ) ( AVAILABLE ?auto_53392 ) ( SURFACE-AT ?auto_53380 ?auto_53387 ) ( ON ?auto_53380 ?auto_53395 ) ( CLEAR ?auto_53380 ) ( not ( = ?auto_53379 ?auto_53395 ) ) ( not ( = ?auto_53380 ?auto_53395 ) ) ( not ( = ?auto_53401 ?auto_53395 ) ) ( not ( = ?auto_53393 ?auto_53395 ) ) ( IS-CRATE ?auto_53393 ) ( not ( = ?auto_53379 ?auto_53403 ) ) ( not ( = ?auto_53380 ?auto_53403 ) ) ( not ( = ?auto_53401 ?auto_53403 ) ) ( not ( = ?auto_53393 ?auto_53403 ) ) ( not ( = ?auto_53395 ?auto_53403 ) ) ( not ( = ?auto_53396 ?auto_53383 ) ) ( not ( = ?auto_53386 ?auto_53396 ) ) ( not ( = ?auto_53387 ?auto_53396 ) ) ( HOIST-AT ?auto_53398 ?auto_53396 ) ( not ( = ?auto_53397 ?auto_53398 ) ) ( not ( = ?auto_53399 ?auto_53398 ) ) ( not ( = ?auto_53392 ?auto_53398 ) ) ( AVAILABLE ?auto_53398 ) ( SURFACE-AT ?auto_53393 ?auto_53396 ) ( ON ?auto_53393 ?auto_53382 ) ( CLEAR ?auto_53393 ) ( not ( = ?auto_53379 ?auto_53382 ) ) ( not ( = ?auto_53380 ?auto_53382 ) ) ( not ( = ?auto_53401 ?auto_53382 ) ) ( not ( = ?auto_53393 ?auto_53382 ) ) ( not ( = ?auto_53395 ?auto_53382 ) ) ( not ( = ?auto_53403 ?auto_53382 ) ) ( IS-CRATE ?auto_53403 ) ( not ( = ?auto_53379 ?auto_53400 ) ) ( not ( = ?auto_53380 ?auto_53400 ) ) ( not ( = ?auto_53401 ?auto_53400 ) ) ( not ( = ?auto_53393 ?auto_53400 ) ) ( not ( = ?auto_53395 ?auto_53400 ) ) ( not ( = ?auto_53403 ?auto_53400 ) ) ( not ( = ?auto_53382 ?auto_53400 ) ) ( AVAILABLE ?auto_53399 ) ( SURFACE-AT ?auto_53403 ?auto_53386 ) ( ON ?auto_53403 ?auto_53384 ) ( CLEAR ?auto_53403 ) ( not ( = ?auto_53379 ?auto_53384 ) ) ( not ( = ?auto_53380 ?auto_53384 ) ) ( not ( = ?auto_53401 ?auto_53384 ) ) ( not ( = ?auto_53393 ?auto_53384 ) ) ( not ( = ?auto_53395 ?auto_53384 ) ) ( not ( = ?auto_53403 ?auto_53384 ) ) ( not ( = ?auto_53382 ?auto_53384 ) ) ( not ( = ?auto_53400 ?auto_53384 ) ) ( IS-CRATE ?auto_53400 ) ( not ( = ?auto_53379 ?auto_53391 ) ) ( not ( = ?auto_53380 ?auto_53391 ) ) ( not ( = ?auto_53401 ?auto_53391 ) ) ( not ( = ?auto_53393 ?auto_53391 ) ) ( not ( = ?auto_53395 ?auto_53391 ) ) ( not ( = ?auto_53403 ?auto_53391 ) ) ( not ( = ?auto_53382 ?auto_53391 ) ) ( not ( = ?auto_53400 ?auto_53391 ) ) ( not ( = ?auto_53384 ?auto_53391 ) ) ( not ( = ?auto_53381 ?auto_53383 ) ) ( not ( = ?auto_53386 ?auto_53381 ) ) ( not ( = ?auto_53387 ?auto_53381 ) ) ( not ( = ?auto_53396 ?auto_53381 ) ) ( HOIST-AT ?auto_53385 ?auto_53381 ) ( not ( = ?auto_53397 ?auto_53385 ) ) ( not ( = ?auto_53399 ?auto_53385 ) ) ( not ( = ?auto_53392 ?auto_53385 ) ) ( not ( = ?auto_53398 ?auto_53385 ) ) ( AVAILABLE ?auto_53385 ) ( SURFACE-AT ?auto_53400 ?auto_53381 ) ( ON ?auto_53400 ?auto_53388 ) ( CLEAR ?auto_53400 ) ( not ( = ?auto_53379 ?auto_53388 ) ) ( not ( = ?auto_53380 ?auto_53388 ) ) ( not ( = ?auto_53401 ?auto_53388 ) ) ( not ( = ?auto_53393 ?auto_53388 ) ) ( not ( = ?auto_53395 ?auto_53388 ) ) ( not ( = ?auto_53403 ?auto_53388 ) ) ( not ( = ?auto_53382 ?auto_53388 ) ) ( not ( = ?auto_53400 ?auto_53388 ) ) ( not ( = ?auto_53384 ?auto_53388 ) ) ( not ( = ?auto_53391 ?auto_53388 ) ) ( SURFACE-AT ?auto_53390 ?auto_53383 ) ( CLEAR ?auto_53390 ) ( IS-CRATE ?auto_53391 ) ( not ( = ?auto_53379 ?auto_53390 ) ) ( not ( = ?auto_53380 ?auto_53390 ) ) ( not ( = ?auto_53401 ?auto_53390 ) ) ( not ( = ?auto_53393 ?auto_53390 ) ) ( not ( = ?auto_53395 ?auto_53390 ) ) ( not ( = ?auto_53403 ?auto_53390 ) ) ( not ( = ?auto_53382 ?auto_53390 ) ) ( not ( = ?auto_53400 ?auto_53390 ) ) ( not ( = ?auto_53384 ?auto_53390 ) ) ( not ( = ?auto_53391 ?auto_53390 ) ) ( not ( = ?auto_53388 ?auto_53390 ) ) ( AVAILABLE ?auto_53397 ) ( not ( = ?auto_53394 ?auto_53383 ) ) ( not ( = ?auto_53386 ?auto_53394 ) ) ( not ( = ?auto_53387 ?auto_53394 ) ) ( not ( = ?auto_53396 ?auto_53394 ) ) ( not ( = ?auto_53381 ?auto_53394 ) ) ( HOIST-AT ?auto_53402 ?auto_53394 ) ( not ( = ?auto_53397 ?auto_53402 ) ) ( not ( = ?auto_53399 ?auto_53402 ) ) ( not ( = ?auto_53392 ?auto_53402 ) ) ( not ( = ?auto_53398 ?auto_53402 ) ) ( not ( = ?auto_53385 ?auto_53402 ) ) ( AVAILABLE ?auto_53402 ) ( SURFACE-AT ?auto_53391 ?auto_53394 ) ( ON ?auto_53391 ?auto_53389 ) ( CLEAR ?auto_53391 ) ( not ( = ?auto_53379 ?auto_53389 ) ) ( not ( = ?auto_53380 ?auto_53389 ) ) ( not ( = ?auto_53401 ?auto_53389 ) ) ( not ( = ?auto_53393 ?auto_53389 ) ) ( not ( = ?auto_53395 ?auto_53389 ) ) ( not ( = ?auto_53403 ?auto_53389 ) ) ( not ( = ?auto_53382 ?auto_53389 ) ) ( not ( = ?auto_53400 ?auto_53389 ) ) ( not ( = ?auto_53384 ?auto_53389 ) ) ( not ( = ?auto_53391 ?auto_53389 ) ) ( not ( = ?auto_53388 ?auto_53389 ) ) ( not ( = ?auto_53390 ?auto_53389 ) ) ( TRUCK-AT ?auto_53404 ?auto_53383 ) )
    :subtasks
    ( ( !DRIVE ?auto_53404 ?auto_53383 ?auto_53394 )
      ( MAKE-ON ?auto_53379 ?auto_53380 )
      ( MAKE-ON-VERIFY ?auto_53379 ?auto_53380 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53405 - SURFACE
      ?auto_53406 - SURFACE
    )
    :vars
    (
      ?auto_53412 - HOIST
      ?auto_53419 - PLACE
      ?auto_53408 - PLACE
      ?auto_53417 - HOIST
      ?auto_53420 - SURFACE
      ?auto_53430 - SURFACE
      ?auto_53415 - PLACE
      ?auto_53409 - HOIST
      ?auto_53413 - SURFACE
      ?auto_53422 - SURFACE
      ?auto_53423 - PLACE
      ?auto_53411 - HOIST
      ?auto_53414 - SURFACE
      ?auto_53418 - SURFACE
      ?auto_53425 - SURFACE
      ?auto_53424 - SURFACE
      ?auto_53429 - PLACE
      ?auto_53426 - HOIST
      ?auto_53427 - SURFACE
      ?auto_53428 - SURFACE
      ?auto_53410 - PLACE
      ?auto_53421 - HOIST
      ?auto_53416 - SURFACE
      ?auto_53407 - TRUCK
      ?auto_53431 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53412 ?auto_53419 ) ( IS-CRATE ?auto_53405 ) ( not ( = ?auto_53405 ?auto_53406 ) ) ( not ( = ?auto_53408 ?auto_53419 ) ) ( HOIST-AT ?auto_53417 ?auto_53408 ) ( not ( = ?auto_53412 ?auto_53417 ) ) ( SURFACE-AT ?auto_53405 ?auto_53408 ) ( ON ?auto_53405 ?auto_53420 ) ( CLEAR ?auto_53405 ) ( not ( = ?auto_53405 ?auto_53420 ) ) ( not ( = ?auto_53406 ?auto_53420 ) ) ( IS-CRATE ?auto_53406 ) ( not ( = ?auto_53405 ?auto_53430 ) ) ( not ( = ?auto_53406 ?auto_53430 ) ) ( not ( = ?auto_53420 ?auto_53430 ) ) ( not ( = ?auto_53415 ?auto_53419 ) ) ( not ( = ?auto_53408 ?auto_53415 ) ) ( HOIST-AT ?auto_53409 ?auto_53415 ) ( not ( = ?auto_53412 ?auto_53409 ) ) ( not ( = ?auto_53417 ?auto_53409 ) ) ( AVAILABLE ?auto_53409 ) ( SURFACE-AT ?auto_53406 ?auto_53415 ) ( ON ?auto_53406 ?auto_53413 ) ( CLEAR ?auto_53406 ) ( not ( = ?auto_53405 ?auto_53413 ) ) ( not ( = ?auto_53406 ?auto_53413 ) ) ( not ( = ?auto_53420 ?auto_53413 ) ) ( not ( = ?auto_53430 ?auto_53413 ) ) ( IS-CRATE ?auto_53430 ) ( not ( = ?auto_53405 ?auto_53422 ) ) ( not ( = ?auto_53406 ?auto_53422 ) ) ( not ( = ?auto_53420 ?auto_53422 ) ) ( not ( = ?auto_53430 ?auto_53422 ) ) ( not ( = ?auto_53413 ?auto_53422 ) ) ( not ( = ?auto_53423 ?auto_53419 ) ) ( not ( = ?auto_53408 ?auto_53423 ) ) ( not ( = ?auto_53415 ?auto_53423 ) ) ( HOIST-AT ?auto_53411 ?auto_53423 ) ( not ( = ?auto_53412 ?auto_53411 ) ) ( not ( = ?auto_53417 ?auto_53411 ) ) ( not ( = ?auto_53409 ?auto_53411 ) ) ( AVAILABLE ?auto_53411 ) ( SURFACE-AT ?auto_53430 ?auto_53423 ) ( ON ?auto_53430 ?auto_53414 ) ( CLEAR ?auto_53430 ) ( not ( = ?auto_53405 ?auto_53414 ) ) ( not ( = ?auto_53406 ?auto_53414 ) ) ( not ( = ?auto_53420 ?auto_53414 ) ) ( not ( = ?auto_53430 ?auto_53414 ) ) ( not ( = ?auto_53413 ?auto_53414 ) ) ( not ( = ?auto_53422 ?auto_53414 ) ) ( IS-CRATE ?auto_53422 ) ( not ( = ?auto_53405 ?auto_53418 ) ) ( not ( = ?auto_53406 ?auto_53418 ) ) ( not ( = ?auto_53420 ?auto_53418 ) ) ( not ( = ?auto_53430 ?auto_53418 ) ) ( not ( = ?auto_53413 ?auto_53418 ) ) ( not ( = ?auto_53422 ?auto_53418 ) ) ( not ( = ?auto_53414 ?auto_53418 ) ) ( AVAILABLE ?auto_53417 ) ( SURFACE-AT ?auto_53422 ?auto_53408 ) ( ON ?auto_53422 ?auto_53425 ) ( CLEAR ?auto_53422 ) ( not ( = ?auto_53405 ?auto_53425 ) ) ( not ( = ?auto_53406 ?auto_53425 ) ) ( not ( = ?auto_53420 ?auto_53425 ) ) ( not ( = ?auto_53430 ?auto_53425 ) ) ( not ( = ?auto_53413 ?auto_53425 ) ) ( not ( = ?auto_53422 ?auto_53425 ) ) ( not ( = ?auto_53414 ?auto_53425 ) ) ( not ( = ?auto_53418 ?auto_53425 ) ) ( IS-CRATE ?auto_53418 ) ( not ( = ?auto_53405 ?auto_53424 ) ) ( not ( = ?auto_53406 ?auto_53424 ) ) ( not ( = ?auto_53420 ?auto_53424 ) ) ( not ( = ?auto_53430 ?auto_53424 ) ) ( not ( = ?auto_53413 ?auto_53424 ) ) ( not ( = ?auto_53422 ?auto_53424 ) ) ( not ( = ?auto_53414 ?auto_53424 ) ) ( not ( = ?auto_53418 ?auto_53424 ) ) ( not ( = ?auto_53425 ?auto_53424 ) ) ( not ( = ?auto_53429 ?auto_53419 ) ) ( not ( = ?auto_53408 ?auto_53429 ) ) ( not ( = ?auto_53415 ?auto_53429 ) ) ( not ( = ?auto_53423 ?auto_53429 ) ) ( HOIST-AT ?auto_53426 ?auto_53429 ) ( not ( = ?auto_53412 ?auto_53426 ) ) ( not ( = ?auto_53417 ?auto_53426 ) ) ( not ( = ?auto_53409 ?auto_53426 ) ) ( not ( = ?auto_53411 ?auto_53426 ) ) ( AVAILABLE ?auto_53426 ) ( SURFACE-AT ?auto_53418 ?auto_53429 ) ( ON ?auto_53418 ?auto_53427 ) ( CLEAR ?auto_53418 ) ( not ( = ?auto_53405 ?auto_53427 ) ) ( not ( = ?auto_53406 ?auto_53427 ) ) ( not ( = ?auto_53420 ?auto_53427 ) ) ( not ( = ?auto_53430 ?auto_53427 ) ) ( not ( = ?auto_53413 ?auto_53427 ) ) ( not ( = ?auto_53422 ?auto_53427 ) ) ( not ( = ?auto_53414 ?auto_53427 ) ) ( not ( = ?auto_53418 ?auto_53427 ) ) ( not ( = ?auto_53425 ?auto_53427 ) ) ( not ( = ?auto_53424 ?auto_53427 ) ) ( IS-CRATE ?auto_53424 ) ( not ( = ?auto_53405 ?auto_53428 ) ) ( not ( = ?auto_53406 ?auto_53428 ) ) ( not ( = ?auto_53420 ?auto_53428 ) ) ( not ( = ?auto_53430 ?auto_53428 ) ) ( not ( = ?auto_53413 ?auto_53428 ) ) ( not ( = ?auto_53422 ?auto_53428 ) ) ( not ( = ?auto_53414 ?auto_53428 ) ) ( not ( = ?auto_53418 ?auto_53428 ) ) ( not ( = ?auto_53425 ?auto_53428 ) ) ( not ( = ?auto_53424 ?auto_53428 ) ) ( not ( = ?auto_53427 ?auto_53428 ) ) ( not ( = ?auto_53410 ?auto_53419 ) ) ( not ( = ?auto_53408 ?auto_53410 ) ) ( not ( = ?auto_53415 ?auto_53410 ) ) ( not ( = ?auto_53423 ?auto_53410 ) ) ( not ( = ?auto_53429 ?auto_53410 ) ) ( HOIST-AT ?auto_53421 ?auto_53410 ) ( not ( = ?auto_53412 ?auto_53421 ) ) ( not ( = ?auto_53417 ?auto_53421 ) ) ( not ( = ?auto_53409 ?auto_53421 ) ) ( not ( = ?auto_53411 ?auto_53421 ) ) ( not ( = ?auto_53426 ?auto_53421 ) ) ( AVAILABLE ?auto_53421 ) ( SURFACE-AT ?auto_53424 ?auto_53410 ) ( ON ?auto_53424 ?auto_53416 ) ( CLEAR ?auto_53424 ) ( not ( = ?auto_53405 ?auto_53416 ) ) ( not ( = ?auto_53406 ?auto_53416 ) ) ( not ( = ?auto_53420 ?auto_53416 ) ) ( not ( = ?auto_53430 ?auto_53416 ) ) ( not ( = ?auto_53413 ?auto_53416 ) ) ( not ( = ?auto_53422 ?auto_53416 ) ) ( not ( = ?auto_53414 ?auto_53416 ) ) ( not ( = ?auto_53418 ?auto_53416 ) ) ( not ( = ?auto_53425 ?auto_53416 ) ) ( not ( = ?auto_53424 ?auto_53416 ) ) ( not ( = ?auto_53427 ?auto_53416 ) ) ( not ( = ?auto_53428 ?auto_53416 ) ) ( TRUCK-AT ?auto_53407 ?auto_53419 ) ( SURFACE-AT ?auto_53431 ?auto_53419 ) ( CLEAR ?auto_53431 ) ( LIFTING ?auto_53412 ?auto_53428 ) ( IS-CRATE ?auto_53428 ) ( not ( = ?auto_53405 ?auto_53431 ) ) ( not ( = ?auto_53406 ?auto_53431 ) ) ( not ( = ?auto_53420 ?auto_53431 ) ) ( not ( = ?auto_53430 ?auto_53431 ) ) ( not ( = ?auto_53413 ?auto_53431 ) ) ( not ( = ?auto_53422 ?auto_53431 ) ) ( not ( = ?auto_53414 ?auto_53431 ) ) ( not ( = ?auto_53418 ?auto_53431 ) ) ( not ( = ?auto_53425 ?auto_53431 ) ) ( not ( = ?auto_53424 ?auto_53431 ) ) ( not ( = ?auto_53427 ?auto_53431 ) ) ( not ( = ?auto_53428 ?auto_53431 ) ) ( not ( = ?auto_53416 ?auto_53431 ) ) )
    :subtasks
    ( ( !DROP ?auto_53412 ?auto_53428 ?auto_53431 ?auto_53419 )
      ( MAKE-ON ?auto_53405 ?auto_53406 )
      ( MAKE-ON-VERIFY ?auto_53405 ?auto_53406 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53432 - SURFACE
      ?auto_53433 - SURFACE
    )
    :vars
    (
      ?auto_53439 - HOIST
      ?auto_53448 - PLACE
      ?auto_53447 - PLACE
      ?auto_53440 - HOIST
      ?auto_53450 - SURFACE
      ?auto_53437 - SURFACE
      ?auto_53442 - PLACE
      ?auto_53453 - HOIST
      ?auto_53458 - SURFACE
      ?auto_53457 - SURFACE
      ?auto_53436 - PLACE
      ?auto_53446 - HOIST
      ?auto_53451 - SURFACE
      ?auto_53449 - SURFACE
      ?auto_53434 - SURFACE
      ?auto_53435 - SURFACE
      ?auto_53456 - PLACE
      ?auto_53438 - HOIST
      ?auto_53454 - SURFACE
      ?auto_53455 - SURFACE
      ?auto_53441 - PLACE
      ?auto_53445 - HOIST
      ?auto_53452 - SURFACE
      ?auto_53443 - TRUCK
      ?auto_53444 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53439 ?auto_53448 ) ( IS-CRATE ?auto_53432 ) ( not ( = ?auto_53432 ?auto_53433 ) ) ( not ( = ?auto_53447 ?auto_53448 ) ) ( HOIST-AT ?auto_53440 ?auto_53447 ) ( not ( = ?auto_53439 ?auto_53440 ) ) ( SURFACE-AT ?auto_53432 ?auto_53447 ) ( ON ?auto_53432 ?auto_53450 ) ( CLEAR ?auto_53432 ) ( not ( = ?auto_53432 ?auto_53450 ) ) ( not ( = ?auto_53433 ?auto_53450 ) ) ( IS-CRATE ?auto_53433 ) ( not ( = ?auto_53432 ?auto_53437 ) ) ( not ( = ?auto_53433 ?auto_53437 ) ) ( not ( = ?auto_53450 ?auto_53437 ) ) ( not ( = ?auto_53442 ?auto_53448 ) ) ( not ( = ?auto_53447 ?auto_53442 ) ) ( HOIST-AT ?auto_53453 ?auto_53442 ) ( not ( = ?auto_53439 ?auto_53453 ) ) ( not ( = ?auto_53440 ?auto_53453 ) ) ( AVAILABLE ?auto_53453 ) ( SURFACE-AT ?auto_53433 ?auto_53442 ) ( ON ?auto_53433 ?auto_53458 ) ( CLEAR ?auto_53433 ) ( not ( = ?auto_53432 ?auto_53458 ) ) ( not ( = ?auto_53433 ?auto_53458 ) ) ( not ( = ?auto_53450 ?auto_53458 ) ) ( not ( = ?auto_53437 ?auto_53458 ) ) ( IS-CRATE ?auto_53437 ) ( not ( = ?auto_53432 ?auto_53457 ) ) ( not ( = ?auto_53433 ?auto_53457 ) ) ( not ( = ?auto_53450 ?auto_53457 ) ) ( not ( = ?auto_53437 ?auto_53457 ) ) ( not ( = ?auto_53458 ?auto_53457 ) ) ( not ( = ?auto_53436 ?auto_53448 ) ) ( not ( = ?auto_53447 ?auto_53436 ) ) ( not ( = ?auto_53442 ?auto_53436 ) ) ( HOIST-AT ?auto_53446 ?auto_53436 ) ( not ( = ?auto_53439 ?auto_53446 ) ) ( not ( = ?auto_53440 ?auto_53446 ) ) ( not ( = ?auto_53453 ?auto_53446 ) ) ( AVAILABLE ?auto_53446 ) ( SURFACE-AT ?auto_53437 ?auto_53436 ) ( ON ?auto_53437 ?auto_53451 ) ( CLEAR ?auto_53437 ) ( not ( = ?auto_53432 ?auto_53451 ) ) ( not ( = ?auto_53433 ?auto_53451 ) ) ( not ( = ?auto_53450 ?auto_53451 ) ) ( not ( = ?auto_53437 ?auto_53451 ) ) ( not ( = ?auto_53458 ?auto_53451 ) ) ( not ( = ?auto_53457 ?auto_53451 ) ) ( IS-CRATE ?auto_53457 ) ( not ( = ?auto_53432 ?auto_53449 ) ) ( not ( = ?auto_53433 ?auto_53449 ) ) ( not ( = ?auto_53450 ?auto_53449 ) ) ( not ( = ?auto_53437 ?auto_53449 ) ) ( not ( = ?auto_53458 ?auto_53449 ) ) ( not ( = ?auto_53457 ?auto_53449 ) ) ( not ( = ?auto_53451 ?auto_53449 ) ) ( AVAILABLE ?auto_53440 ) ( SURFACE-AT ?auto_53457 ?auto_53447 ) ( ON ?auto_53457 ?auto_53434 ) ( CLEAR ?auto_53457 ) ( not ( = ?auto_53432 ?auto_53434 ) ) ( not ( = ?auto_53433 ?auto_53434 ) ) ( not ( = ?auto_53450 ?auto_53434 ) ) ( not ( = ?auto_53437 ?auto_53434 ) ) ( not ( = ?auto_53458 ?auto_53434 ) ) ( not ( = ?auto_53457 ?auto_53434 ) ) ( not ( = ?auto_53451 ?auto_53434 ) ) ( not ( = ?auto_53449 ?auto_53434 ) ) ( IS-CRATE ?auto_53449 ) ( not ( = ?auto_53432 ?auto_53435 ) ) ( not ( = ?auto_53433 ?auto_53435 ) ) ( not ( = ?auto_53450 ?auto_53435 ) ) ( not ( = ?auto_53437 ?auto_53435 ) ) ( not ( = ?auto_53458 ?auto_53435 ) ) ( not ( = ?auto_53457 ?auto_53435 ) ) ( not ( = ?auto_53451 ?auto_53435 ) ) ( not ( = ?auto_53449 ?auto_53435 ) ) ( not ( = ?auto_53434 ?auto_53435 ) ) ( not ( = ?auto_53456 ?auto_53448 ) ) ( not ( = ?auto_53447 ?auto_53456 ) ) ( not ( = ?auto_53442 ?auto_53456 ) ) ( not ( = ?auto_53436 ?auto_53456 ) ) ( HOIST-AT ?auto_53438 ?auto_53456 ) ( not ( = ?auto_53439 ?auto_53438 ) ) ( not ( = ?auto_53440 ?auto_53438 ) ) ( not ( = ?auto_53453 ?auto_53438 ) ) ( not ( = ?auto_53446 ?auto_53438 ) ) ( AVAILABLE ?auto_53438 ) ( SURFACE-AT ?auto_53449 ?auto_53456 ) ( ON ?auto_53449 ?auto_53454 ) ( CLEAR ?auto_53449 ) ( not ( = ?auto_53432 ?auto_53454 ) ) ( not ( = ?auto_53433 ?auto_53454 ) ) ( not ( = ?auto_53450 ?auto_53454 ) ) ( not ( = ?auto_53437 ?auto_53454 ) ) ( not ( = ?auto_53458 ?auto_53454 ) ) ( not ( = ?auto_53457 ?auto_53454 ) ) ( not ( = ?auto_53451 ?auto_53454 ) ) ( not ( = ?auto_53449 ?auto_53454 ) ) ( not ( = ?auto_53434 ?auto_53454 ) ) ( not ( = ?auto_53435 ?auto_53454 ) ) ( IS-CRATE ?auto_53435 ) ( not ( = ?auto_53432 ?auto_53455 ) ) ( not ( = ?auto_53433 ?auto_53455 ) ) ( not ( = ?auto_53450 ?auto_53455 ) ) ( not ( = ?auto_53437 ?auto_53455 ) ) ( not ( = ?auto_53458 ?auto_53455 ) ) ( not ( = ?auto_53457 ?auto_53455 ) ) ( not ( = ?auto_53451 ?auto_53455 ) ) ( not ( = ?auto_53449 ?auto_53455 ) ) ( not ( = ?auto_53434 ?auto_53455 ) ) ( not ( = ?auto_53435 ?auto_53455 ) ) ( not ( = ?auto_53454 ?auto_53455 ) ) ( not ( = ?auto_53441 ?auto_53448 ) ) ( not ( = ?auto_53447 ?auto_53441 ) ) ( not ( = ?auto_53442 ?auto_53441 ) ) ( not ( = ?auto_53436 ?auto_53441 ) ) ( not ( = ?auto_53456 ?auto_53441 ) ) ( HOIST-AT ?auto_53445 ?auto_53441 ) ( not ( = ?auto_53439 ?auto_53445 ) ) ( not ( = ?auto_53440 ?auto_53445 ) ) ( not ( = ?auto_53453 ?auto_53445 ) ) ( not ( = ?auto_53446 ?auto_53445 ) ) ( not ( = ?auto_53438 ?auto_53445 ) ) ( AVAILABLE ?auto_53445 ) ( SURFACE-AT ?auto_53435 ?auto_53441 ) ( ON ?auto_53435 ?auto_53452 ) ( CLEAR ?auto_53435 ) ( not ( = ?auto_53432 ?auto_53452 ) ) ( not ( = ?auto_53433 ?auto_53452 ) ) ( not ( = ?auto_53450 ?auto_53452 ) ) ( not ( = ?auto_53437 ?auto_53452 ) ) ( not ( = ?auto_53458 ?auto_53452 ) ) ( not ( = ?auto_53457 ?auto_53452 ) ) ( not ( = ?auto_53451 ?auto_53452 ) ) ( not ( = ?auto_53449 ?auto_53452 ) ) ( not ( = ?auto_53434 ?auto_53452 ) ) ( not ( = ?auto_53435 ?auto_53452 ) ) ( not ( = ?auto_53454 ?auto_53452 ) ) ( not ( = ?auto_53455 ?auto_53452 ) ) ( TRUCK-AT ?auto_53443 ?auto_53448 ) ( SURFACE-AT ?auto_53444 ?auto_53448 ) ( CLEAR ?auto_53444 ) ( IS-CRATE ?auto_53455 ) ( not ( = ?auto_53432 ?auto_53444 ) ) ( not ( = ?auto_53433 ?auto_53444 ) ) ( not ( = ?auto_53450 ?auto_53444 ) ) ( not ( = ?auto_53437 ?auto_53444 ) ) ( not ( = ?auto_53458 ?auto_53444 ) ) ( not ( = ?auto_53457 ?auto_53444 ) ) ( not ( = ?auto_53451 ?auto_53444 ) ) ( not ( = ?auto_53449 ?auto_53444 ) ) ( not ( = ?auto_53434 ?auto_53444 ) ) ( not ( = ?auto_53435 ?auto_53444 ) ) ( not ( = ?auto_53454 ?auto_53444 ) ) ( not ( = ?auto_53455 ?auto_53444 ) ) ( not ( = ?auto_53452 ?auto_53444 ) ) ( AVAILABLE ?auto_53439 ) ( IN ?auto_53455 ?auto_53443 ) )
    :subtasks
    ( ( !UNLOAD ?auto_53439 ?auto_53455 ?auto_53443 ?auto_53448 )
      ( MAKE-ON ?auto_53432 ?auto_53433 )
      ( MAKE-ON-VERIFY ?auto_53432 ?auto_53433 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53459 - SURFACE
      ?auto_53460 - SURFACE
    )
    :vars
    (
      ?auto_53471 - HOIST
      ?auto_53468 - PLACE
      ?auto_53464 - PLACE
      ?auto_53469 - HOIST
      ?auto_53475 - SURFACE
      ?auto_53461 - SURFACE
      ?auto_53485 - PLACE
      ?auto_53479 - HOIST
      ?auto_53462 - SURFACE
      ?auto_53474 - SURFACE
      ?auto_53476 - PLACE
      ?auto_53470 - HOIST
      ?auto_53477 - SURFACE
      ?auto_53483 - SURFACE
      ?auto_53465 - SURFACE
      ?auto_53466 - SURFACE
      ?auto_53482 - PLACE
      ?auto_53484 - HOIST
      ?auto_53480 - SURFACE
      ?auto_53481 - SURFACE
      ?auto_53472 - PLACE
      ?auto_53463 - HOIST
      ?auto_53478 - SURFACE
      ?auto_53473 - SURFACE
      ?auto_53467 - TRUCK
      ?auto_53486 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53471 ?auto_53468 ) ( IS-CRATE ?auto_53459 ) ( not ( = ?auto_53459 ?auto_53460 ) ) ( not ( = ?auto_53464 ?auto_53468 ) ) ( HOIST-AT ?auto_53469 ?auto_53464 ) ( not ( = ?auto_53471 ?auto_53469 ) ) ( SURFACE-AT ?auto_53459 ?auto_53464 ) ( ON ?auto_53459 ?auto_53475 ) ( CLEAR ?auto_53459 ) ( not ( = ?auto_53459 ?auto_53475 ) ) ( not ( = ?auto_53460 ?auto_53475 ) ) ( IS-CRATE ?auto_53460 ) ( not ( = ?auto_53459 ?auto_53461 ) ) ( not ( = ?auto_53460 ?auto_53461 ) ) ( not ( = ?auto_53475 ?auto_53461 ) ) ( not ( = ?auto_53485 ?auto_53468 ) ) ( not ( = ?auto_53464 ?auto_53485 ) ) ( HOIST-AT ?auto_53479 ?auto_53485 ) ( not ( = ?auto_53471 ?auto_53479 ) ) ( not ( = ?auto_53469 ?auto_53479 ) ) ( AVAILABLE ?auto_53479 ) ( SURFACE-AT ?auto_53460 ?auto_53485 ) ( ON ?auto_53460 ?auto_53462 ) ( CLEAR ?auto_53460 ) ( not ( = ?auto_53459 ?auto_53462 ) ) ( not ( = ?auto_53460 ?auto_53462 ) ) ( not ( = ?auto_53475 ?auto_53462 ) ) ( not ( = ?auto_53461 ?auto_53462 ) ) ( IS-CRATE ?auto_53461 ) ( not ( = ?auto_53459 ?auto_53474 ) ) ( not ( = ?auto_53460 ?auto_53474 ) ) ( not ( = ?auto_53475 ?auto_53474 ) ) ( not ( = ?auto_53461 ?auto_53474 ) ) ( not ( = ?auto_53462 ?auto_53474 ) ) ( not ( = ?auto_53476 ?auto_53468 ) ) ( not ( = ?auto_53464 ?auto_53476 ) ) ( not ( = ?auto_53485 ?auto_53476 ) ) ( HOIST-AT ?auto_53470 ?auto_53476 ) ( not ( = ?auto_53471 ?auto_53470 ) ) ( not ( = ?auto_53469 ?auto_53470 ) ) ( not ( = ?auto_53479 ?auto_53470 ) ) ( AVAILABLE ?auto_53470 ) ( SURFACE-AT ?auto_53461 ?auto_53476 ) ( ON ?auto_53461 ?auto_53477 ) ( CLEAR ?auto_53461 ) ( not ( = ?auto_53459 ?auto_53477 ) ) ( not ( = ?auto_53460 ?auto_53477 ) ) ( not ( = ?auto_53475 ?auto_53477 ) ) ( not ( = ?auto_53461 ?auto_53477 ) ) ( not ( = ?auto_53462 ?auto_53477 ) ) ( not ( = ?auto_53474 ?auto_53477 ) ) ( IS-CRATE ?auto_53474 ) ( not ( = ?auto_53459 ?auto_53483 ) ) ( not ( = ?auto_53460 ?auto_53483 ) ) ( not ( = ?auto_53475 ?auto_53483 ) ) ( not ( = ?auto_53461 ?auto_53483 ) ) ( not ( = ?auto_53462 ?auto_53483 ) ) ( not ( = ?auto_53474 ?auto_53483 ) ) ( not ( = ?auto_53477 ?auto_53483 ) ) ( AVAILABLE ?auto_53469 ) ( SURFACE-AT ?auto_53474 ?auto_53464 ) ( ON ?auto_53474 ?auto_53465 ) ( CLEAR ?auto_53474 ) ( not ( = ?auto_53459 ?auto_53465 ) ) ( not ( = ?auto_53460 ?auto_53465 ) ) ( not ( = ?auto_53475 ?auto_53465 ) ) ( not ( = ?auto_53461 ?auto_53465 ) ) ( not ( = ?auto_53462 ?auto_53465 ) ) ( not ( = ?auto_53474 ?auto_53465 ) ) ( not ( = ?auto_53477 ?auto_53465 ) ) ( not ( = ?auto_53483 ?auto_53465 ) ) ( IS-CRATE ?auto_53483 ) ( not ( = ?auto_53459 ?auto_53466 ) ) ( not ( = ?auto_53460 ?auto_53466 ) ) ( not ( = ?auto_53475 ?auto_53466 ) ) ( not ( = ?auto_53461 ?auto_53466 ) ) ( not ( = ?auto_53462 ?auto_53466 ) ) ( not ( = ?auto_53474 ?auto_53466 ) ) ( not ( = ?auto_53477 ?auto_53466 ) ) ( not ( = ?auto_53483 ?auto_53466 ) ) ( not ( = ?auto_53465 ?auto_53466 ) ) ( not ( = ?auto_53482 ?auto_53468 ) ) ( not ( = ?auto_53464 ?auto_53482 ) ) ( not ( = ?auto_53485 ?auto_53482 ) ) ( not ( = ?auto_53476 ?auto_53482 ) ) ( HOIST-AT ?auto_53484 ?auto_53482 ) ( not ( = ?auto_53471 ?auto_53484 ) ) ( not ( = ?auto_53469 ?auto_53484 ) ) ( not ( = ?auto_53479 ?auto_53484 ) ) ( not ( = ?auto_53470 ?auto_53484 ) ) ( AVAILABLE ?auto_53484 ) ( SURFACE-AT ?auto_53483 ?auto_53482 ) ( ON ?auto_53483 ?auto_53480 ) ( CLEAR ?auto_53483 ) ( not ( = ?auto_53459 ?auto_53480 ) ) ( not ( = ?auto_53460 ?auto_53480 ) ) ( not ( = ?auto_53475 ?auto_53480 ) ) ( not ( = ?auto_53461 ?auto_53480 ) ) ( not ( = ?auto_53462 ?auto_53480 ) ) ( not ( = ?auto_53474 ?auto_53480 ) ) ( not ( = ?auto_53477 ?auto_53480 ) ) ( not ( = ?auto_53483 ?auto_53480 ) ) ( not ( = ?auto_53465 ?auto_53480 ) ) ( not ( = ?auto_53466 ?auto_53480 ) ) ( IS-CRATE ?auto_53466 ) ( not ( = ?auto_53459 ?auto_53481 ) ) ( not ( = ?auto_53460 ?auto_53481 ) ) ( not ( = ?auto_53475 ?auto_53481 ) ) ( not ( = ?auto_53461 ?auto_53481 ) ) ( not ( = ?auto_53462 ?auto_53481 ) ) ( not ( = ?auto_53474 ?auto_53481 ) ) ( not ( = ?auto_53477 ?auto_53481 ) ) ( not ( = ?auto_53483 ?auto_53481 ) ) ( not ( = ?auto_53465 ?auto_53481 ) ) ( not ( = ?auto_53466 ?auto_53481 ) ) ( not ( = ?auto_53480 ?auto_53481 ) ) ( not ( = ?auto_53472 ?auto_53468 ) ) ( not ( = ?auto_53464 ?auto_53472 ) ) ( not ( = ?auto_53485 ?auto_53472 ) ) ( not ( = ?auto_53476 ?auto_53472 ) ) ( not ( = ?auto_53482 ?auto_53472 ) ) ( HOIST-AT ?auto_53463 ?auto_53472 ) ( not ( = ?auto_53471 ?auto_53463 ) ) ( not ( = ?auto_53469 ?auto_53463 ) ) ( not ( = ?auto_53479 ?auto_53463 ) ) ( not ( = ?auto_53470 ?auto_53463 ) ) ( not ( = ?auto_53484 ?auto_53463 ) ) ( AVAILABLE ?auto_53463 ) ( SURFACE-AT ?auto_53466 ?auto_53472 ) ( ON ?auto_53466 ?auto_53478 ) ( CLEAR ?auto_53466 ) ( not ( = ?auto_53459 ?auto_53478 ) ) ( not ( = ?auto_53460 ?auto_53478 ) ) ( not ( = ?auto_53475 ?auto_53478 ) ) ( not ( = ?auto_53461 ?auto_53478 ) ) ( not ( = ?auto_53462 ?auto_53478 ) ) ( not ( = ?auto_53474 ?auto_53478 ) ) ( not ( = ?auto_53477 ?auto_53478 ) ) ( not ( = ?auto_53483 ?auto_53478 ) ) ( not ( = ?auto_53465 ?auto_53478 ) ) ( not ( = ?auto_53466 ?auto_53478 ) ) ( not ( = ?auto_53480 ?auto_53478 ) ) ( not ( = ?auto_53481 ?auto_53478 ) ) ( SURFACE-AT ?auto_53473 ?auto_53468 ) ( CLEAR ?auto_53473 ) ( IS-CRATE ?auto_53481 ) ( not ( = ?auto_53459 ?auto_53473 ) ) ( not ( = ?auto_53460 ?auto_53473 ) ) ( not ( = ?auto_53475 ?auto_53473 ) ) ( not ( = ?auto_53461 ?auto_53473 ) ) ( not ( = ?auto_53462 ?auto_53473 ) ) ( not ( = ?auto_53474 ?auto_53473 ) ) ( not ( = ?auto_53477 ?auto_53473 ) ) ( not ( = ?auto_53483 ?auto_53473 ) ) ( not ( = ?auto_53465 ?auto_53473 ) ) ( not ( = ?auto_53466 ?auto_53473 ) ) ( not ( = ?auto_53480 ?auto_53473 ) ) ( not ( = ?auto_53481 ?auto_53473 ) ) ( not ( = ?auto_53478 ?auto_53473 ) ) ( AVAILABLE ?auto_53471 ) ( IN ?auto_53481 ?auto_53467 ) ( TRUCK-AT ?auto_53467 ?auto_53486 ) ( not ( = ?auto_53486 ?auto_53468 ) ) ( not ( = ?auto_53464 ?auto_53486 ) ) ( not ( = ?auto_53485 ?auto_53486 ) ) ( not ( = ?auto_53476 ?auto_53486 ) ) ( not ( = ?auto_53482 ?auto_53486 ) ) ( not ( = ?auto_53472 ?auto_53486 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_53467 ?auto_53486 ?auto_53468 )
      ( MAKE-ON ?auto_53459 ?auto_53460 )
      ( MAKE-ON-VERIFY ?auto_53459 ?auto_53460 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53487 - SURFACE
      ?auto_53488 - SURFACE
    )
    :vars
    (
      ?auto_53513 - HOIST
      ?auto_53502 - PLACE
      ?auto_53511 - PLACE
      ?auto_53493 - HOIST
      ?auto_53489 - SURFACE
      ?auto_53501 - SURFACE
      ?auto_53492 - PLACE
      ?auto_53495 - HOIST
      ?auto_53512 - SURFACE
      ?auto_53503 - SURFACE
      ?auto_53500 - PLACE
      ?auto_53504 - HOIST
      ?auto_53506 - SURFACE
      ?auto_53499 - SURFACE
      ?auto_53514 - SURFACE
      ?auto_53509 - SURFACE
      ?auto_53498 - PLACE
      ?auto_53494 - HOIST
      ?auto_53496 - SURFACE
      ?auto_53497 - SURFACE
      ?auto_53508 - PLACE
      ?auto_53505 - HOIST
      ?auto_53507 - SURFACE
      ?auto_53510 - SURFACE
      ?auto_53491 - TRUCK
      ?auto_53490 - PLACE
      ?auto_53515 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_53513 ?auto_53502 ) ( IS-CRATE ?auto_53487 ) ( not ( = ?auto_53487 ?auto_53488 ) ) ( not ( = ?auto_53511 ?auto_53502 ) ) ( HOIST-AT ?auto_53493 ?auto_53511 ) ( not ( = ?auto_53513 ?auto_53493 ) ) ( SURFACE-AT ?auto_53487 ?auto_53511 ) ( ON ?auto_53487 ?auto_53489 ) ( CLEAR ?auto_53487 ) ( not ( = ?auto_53487 ?auto_53489 ) ) ( not ( = ?auto_53488 ?auto_53489 ) ) ( IS-CRATE ?auto_53488 ) ( not ( = ?auto_53487 ?auto_53501 ) ) ( not ( = ?auto_53488 ?auto_53501 ) ) ( not ( = ?auto_53489 ?auto_53501 ) ) ( not ( = ?auto_53492 ?auto_53502 ) ) ( not ( = ?auto_53511 ?auto_53492 ) ) ( HOIST-AT ?auto_53495 ?auto_53492 ) ( not ( = ?auto_53513 ?auto_53495 ) ) ( not ( = ?auto_53493 ?auto_53495 ) ) ( AVAILABLE ?auto_53495 ) ( SURFACE-AT ?auto_53488 ?auto_53492 ) ( ON ?auto_53488 ?auto_53512 ) ( CLEAR ?auto_53488 ) ( not ( = ?auto_53487 ?auto_53512 ) ) ( not ( = ?auto_53488 ?auto_53512 ) ) ( not ( = ?auto_53489 ?auto_53512 ) ) ( not ( = ?auto_53501 ?auto_53512 ) ) ( IS-CRATE ?auto_53501 ) ( not ( = ?auto_53487 ?auto_53503 ) ) ( not ( = ?auto_53488 ?auto_53503 ) ) ( not ( = ?auto_53489 ?auto_53503 ) ) ( not ( = ?auto_53501 ?auto_53503 ) ) ( not ( = ?auto_53512 ?auto_53503 ) ) ( not ( = ?auto_53500 ?auto_53502 ) ) ( not ( = ?auto_53511 ?auto_53500 ) ) ( not ( = ?auto_53492 ?auto_53500 ) ) ( HOIST-AT ?auto_53504 ?auto_53500 ) ( not ( = ?auto_53513 ?auto_53504 ) ) ( not ( = ?auto_53493 ?auto_53504 ) ) ( not ( = ?auto_53495 ?auto_53504 ) ) ( AVAILABLE ?auto_53504 ) ( SURFACE-AT ?auto_53501 ?auto_53500 ) ( ON ?auto_53501 ?auto_53506 ) ( CLEAR ?auto_53501 ) ( not ( = ?auto_53487 ?auto_53506 ) ) ( not ( = ?auto_53488 ?auto_53506 ) ) ( not ( = ?auto_53489 ?auto_53506 ) ) ( not ( = ?auto_53501 ?auto_53506 ) ) ( not ( = ?auto_53512 ?auto_53506 ) ) ( not ( = ?auto_53503 ?auto_53506 ) ) ( IS-CRATE ?auto_53503 ) ( not ( = ?auto_53487 ?auto_53499 ) ) ( not ( = ?auto_53488 ?auto_53499 ) ) ( not ( = ?auto_53489 ?auto_53499 ) ) ( not ( = ?auto_53501 ?auto_53499 ) ) ( not ( = ?auto_53512 ?auto_53499 ) ) ( not ( = ?auto_53503 ?auto_53499 ) ) ( not ( = ?auto_53506 ?auto_53499 ) ) ( AVAILABLE ?auto_53493 ) ( SURFACE-AT ?auto_53503 ?auto_53511 ) ( ON ?auto_53503 ?auto_53514 ) ( CLEAR ?auto_53503 ) ( not ( = ?auto_53487 ?auto_53514 ) ) ( not ( = ?auto_53488 ?auto_53514 ) ) ( not ( = ?auto_53489 ?auto_53514 ) ) ( not ( = ?auto_53501 ?auto_53514 ) ) ( not ( = ?auto_53512 ?auto_53514 ) ) ( not ( = ?auto_53503 ?auto_53514 ) ) ( not ( = ?auto_53506 ?auto_53514 ) ) ( not ( = ?auto_53499 ?auto_53514 ) ) ( IS-CRATE ?auto_53499 ) ( not ( = ?auto_53487 ?auto_53509 ) ) ( not ( = ?auto_53488 ?auto_53509 ) ) ( not ( = ?auto_53489 ?auto_53509 ) ) ( not ( = ?auto_53501 ?auto_53509 ) ) ( not ( = ?auto_53512 ?auto_53509 ) ) ( not ( = ?auto_53503 ?auto_53509 ) ) ( not ( = ?auto_53506 ?auto_53509 ) ) ( not ( = ?auto_53499 ?auto_53509 ) ) ( not ( = ?auto_53514 ?auto_53509 ) ) ( not ( = ?auto_53498 ?auto_53502 ) ) ( not ( = ?auto_53511 ?auto_53498 ) ) ( not ( = ?auto_53492 ?auto_53498 ) ) ( not ( = ?auto_53500 ?auto_53498 ) ) ( HOIST-AT ?auto_53494 ?auto_53498 ) ( not ( = ?auto_53513 ?auto_53494 ) ) ( not ( = ?auto_53493 ?auto_53494 ) ) ( not ( = ?auto_53495 ?auto_53494 ) ) ( not ( = ?auto_53504 ?auto_53494 ) ) ( AVAILABLE ?auto_53494 ) ( SURFACE-AT ?auto_53499 ?auto_53498 ) ( ON ?auto_53499 ?auto_53496 ) ( CLEAR ?auto_53499 ) ( not ( = ?auto_53487 ?auto_53496 ) ) ( not ( = ?auto_53488 ?auto_53496 ) ) ( not ( = ?auto_53489 ?auto_53496 ) ) ( not ( = ?auto_53501 ?auto_53496 ) ) ( not ( = ?auto_53512 ?auto_53496 ) ) ( not ( = ?auto_53503 ?auto_53496 ) ) ( not ( = ?auto_53506 ?auto_53496 ) ) ( not ( = ?auto_53499 ?auto_53496 ) ) ( not ( = ?auto_53514 ?auto_53496 ) ) ( not ( = ?auto_53509 ?auto_53496 ) ) ( IS-CRATE ?auto_53509 ) ( not ( = ?auto_53487 ?auto_53497 ) ) ( not ( = ?auto_53488 ?auto_53497 ) ) ( not ( = ?auto_53489 ?auto_53497 ) ) ( not ( = ?auto_53501 ?auto_53497 ) ) ( not ( = ?auto_53512 ?auto_53497 ) ) ( not ( = ?auto_53503 ?auto_53497 ) ) ( not ( = ?auto_53506 ?auto_53497 ) ) ( not ( = ?auto_53499 ?auto_53497 ) ) ( not ( = ?auto_53514 ?auto_53497 ) ) ( not ( = ?auto_53509 ?auto_53497 ) ) ( not ( = ?auto_53496 ?auto_53497 ) ) ( not ( = ?auto_53508 ?auto_53502 ) ) ( not ( = ?auto_53511 ?auto_53508 ) ) ( not ( = ?auto_53492 ?auto_53508 ) ) ( not ( = ?auto_53500 ?auto_53508 ) ) ( not ( = ?auto_53498 ?auto_53508 ) ) ( HOIST-AT ?auto_53505 ?auto_53508 ) ( not ( = ?auto_53513 ?auto_53505 ) ) ( not ( = ?auto_53493 ?auto_53505 ) ) ( not ( = ?auto_53495 ?auto_53505 ) ) ( not ( = ?auto_53504 ?auto_53505 ) ) ( not ( = ?auto_53494 ?auto_53505 ) ) ( AVAILABLE ?auto_53505 ) ( SURFACE-AT ?auto_53509 ?auto_53508 ) ( ON ?auto_53509 ?auto_53507 ) ( CLEAR ?auto_53509 ) ( not ( = ?auto_53487 ?auto_53507 ) ) ( not ( = ?auto_53488 ?auto_53507 ) ) ( not ( = ?auto_53489 ?auto_53507 ) ) ( not ( = ?auto_53501 ?auto_53507 ) ) ( not ( = ?auto_53512 ?auto_53507 ) ) ( not ( = ?auto_53503 ?auto_53507 ) ) ( not ( = ?auto_53506 ?auto_53507 ) ) ( not ( = ?auto_53499 ?auto_53507 ) ) ( not ( = ?auto_53514 ?auto_53507 ) ) ( not ( = ?auto_53509 ?auto_53507 ) ) ( not ( = ?auto_53496 ?auto_53507 ) ) ( not ( = ?auto_53497 ?auto_53507 ) ) ( SURFACE-AT ?auto_53510 ?auto_53502 ) ( CLEAR ?auto_53510 ) ( IS-CRATE ?auto_53497 ) ( not ( = ?auto_53487 ?auto_53510 ) ) ( not ( = ?auto_53488 ?auto_53510 ) ) ( not ( = ?auto_53489 ?auto_53510 ) ) ( not ( = ?auto_53501 ?auto_53510 ) ) ( not ( = ?auto_53512 ?auto_53510 ) ) ( not ( = ?auto_53503 ?auto_53510 ) ) ( not ( = ?auto_53506 ?auto_53510 ) ) ( not ( = ?auto_53499 ?auto_53510 ) ) ( not ( = ?auto_53514 ?auto_53510 ) ) ( not ( = ?auto_53509 ?auto_53510 ) ) ( not ( = ?auto_53496 ?auto_53510 ) ) ( not ( = ?auto_53497 ?auto_53510 ) ) ( not ( = ?auto_53507 ?auto_53510 ) ) ( AVAILABLE ?auto_53513 ) ( TRUCK-AT ?auto_53491 ?auto_53490 ) ( not ( = ?auto_53490 ?auto_53502 ) ) ( not ( = ?auto_53511 ?auto_53490 ) ) ( not ( = ?auto_53492 ?auto_53490 ) ) ( not ( = ?auto_53500 ?auto_53490 ) ) ( not ( = ?auto_53498 ?auto_53490 ) ) ( not ( = ?auto_53508 ?auto_53490 ) ) ( HOIST-AT ?auto_53515 ?auto_53490 ) ( LIFTING ?auto_53515 ?auto_53497 ) ( not ( = ?auto_53513 ?auto_53515 ) ) ( not ( = ?auto_53493 ?auto_53515 ) ) ( not ( = ?auto_53495 ?auto_53515 ) ) ( not ( = ?auto_53504 ?auto_53515 ) ) ( not ( = ?auto_53494 ?auto_53515 ) ) ( not ( = ?auto_53505 ?auto_53515 ) ) )
    :subtasks
    ( ( !LOAD ?auto_53515 ?auto_53497 ?auto_53491 ?auto_53490 )
      ( MAKE-ON ?auto_53487 ?auto_53488 )
      ( MAKE-ON-VERIFY ?auto_53487 ?auto_53488 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53516 - SURFACE
      ?auto_53517 - SURFACE
    )
    :vars
    (
      ?auto_53530 - HOIST
      ?auto_53544 - PLACE
      ?auto_53536 - PLACE
      ?auto_53542 - HOIST
      ?auto_53518 - SURFACE
      ?auto_53532 - SURFACE
      ?auto_53533 - PLACE
      ?auto_53523 - HOIST
      ?auto_53521 - SURFACE
      ?auto_53538 - SURFACE
      ?auto_53543 - PLACE
      ?auto_53537 - HOIST
      ?auto_53520 - SURFACE
      ?auto_53539 - SURFACE
      ?auto_53525 - SURFACE
      ?auto_53534 - SURFACE
      ?auto_53531 - PLACE
      ?auto_53540 - HOIST
      ?auto_53522 - SURFACE
      ?auto_53524 - SURFACE
      ?auto_53528 - PLACE
      ?auto_53527 - HOIST
      ?auto_53526 - SURFACE
      ?auto_53535 - SURFACE
      ?auto_53519 - TRUCK
      ?auto_53541 - PLACE
      ?auto_53529 - HOIST
      ?auto_53545 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53530 ?auto_53544 ) ( IS-CRATE ?auto_53516 ) ( not ( = ?auto_53516 ?auto_53517 ) ) ( not ( = ?auto_53536 ?auto_53544 ) ) ( HOIST-AT ?auto_53542 ?auto_53536 ) ( not ( = ?auto_53530 ?auto_53542 ) ) ( SURFACE-AT ?auto_53516 ?auto_53536 ) ( ON ?auto_53516 ?auto_53518 ) ( CLEAR ?auto_53516 ) ( not ( = ?auto_53516 ?auto_53518 ) ) ( not ( = ?auto_53517 ?auto_53518 ) ) ( IS-CRATE ?auto_53517 ) ( not ( = ?auto_53516 ?auto_53532 ) ) ( not ( = ?auto_53517 ?auto_53532 ) ) ( not ( = ?auto_53518 ?auto_53532 ) ) ( not ( = ?auto_53533 ?auto_53544 ) ) ( not ( = ?auto_53536 ?auto_53533 ) ) ( HOIST-AT ?auto_53523 ?auto_53533 ) ( not ( = ?auto_53530 ?auto_53523 ) ) ( not ( = ?auto_53542 ?auto_53523 ) ) ( AVAILABLE ?auto_53523 ) ( SURFACE-AT ?auto_53517 ?auto_53533 ) ( ON ?auto_53517 ?auto_53521 ) ( CLEAR ?auto_53517 ) ( not ( = ?auto_53516 ?auto_53521 ) ) ( not ( = ?auto_53517 ?auto_53521 ) ) ( not ( = ?auto_53518 ?auto_53521 ) ) ( not ( = ?auto_53532 ?auto_53521 ) ) ( IS-CRATE ?auto_53532 ) ( not ( = ?auto_53516 ?auto_53538 ) ) ( not ( = ?auto_53517 ?auto_53538 ) ) ( not ( = ?auto_53518 ?auto_53538 ) ) ( not ( = ?auto_53532 ?auto_53538 ) ) ( not ( = ?auto_53521 ?auto_53538 ) ) ( not ( = ?auto_53543 ?auto_53544 ) ) ( not ( = ?auto_53536 ?auto_53543 ) ) ( not ( = ?auto_53533 ?auto_53543 ) ) ( HOIST-AT ?auto_53537 ?auto_53543 ) ( not ( = ?auto_53530 ?auto_53537 ) ) ( not ( = ?auto_53542 ?auto_53537 ) ) ( not ( = ?auto_53523 ?auto_53537 ) ) ( AVAILABLE ?auto_53537 ) ( SURFACE-AT ?auto_53532 ?auto_53543 ) ( ON ?auto_53532 ?auto_53520 ) ( CLEAR ?auto_53532 ) ( not ( = ?auto_53516 ?auto_53520 ) ) ( not ( = ?auto_53517 ?auto_53520 ) ) ( not ( = ?auto_53518 ?auto_53520 ) ) ( not ( = ?auto_53532 ?auto_53520 ) ) ( not ( = ?auto_53521 ?auto_53520 ) ) ( not ( = ?auto_53538 ?auto_53520 ) ) ( IS-CRATE ?auto_53538 ) ( not ( = ?auto_53516 ?auto_53539 ) ) ( not ( = ?auto_53517 ?auto_53539 ) ) ( not ( = ?auto_53518 ?auto_53539 ) ) ( not ( = ?auto_53532 ?auto_53539 ) ) ( not ( = ?auto_53521 ?auto_53539 ) ) ( not ( = ?auto_53538 ?auto_53539 ) ) ( not ( = ?auto_53520 ?auto_53539 ) ) ( AVAILABLE ?auto_53542 ) ( SURFACE-AT ?auto_53538 ?auto_53536 ) ( ON ?auto_53538 ?auto_53525 ) ( CLEAR ?auto_53538 ) ( not ( = ?auto_53516 ?auto_53525 ) ) ( not ( = ?auto_53517 ?auto_53525 ) ) ( not ( = ?auto_53518 ?auto_53525 ) ) ( not ( = ?auto_53532 ?auto_53525 ) ) ( not ( = ?auto_53521 ?auto_53525 ) ) ( not ( = ?auto_53538 ?auto_53525 ) ) ( not ( = ?auto_53520 ?auto_53525 ) ) ( not ( = ?auto_53539 ?auto_53525 ) ) ( IS-CRATE ?auto_53539 ) ( not ( = ?auto_53516 ?auto_53534 ) ) ( not ( = ?auto_53517 ?auto_53534 ) ) ( not ( = ?auto_53518 ?auto_53534 ) ) ( not ( = ?auto_53532 ?auto_53534 ) ) ( not ( = ?auto_53521 ?auto_53534 ) ) ( not ( = ?auto_53538 ?auto_53534 ) ) ( not ( = ?auto_53520 ?auto_53534 ) ) ( not ( = ?auto_53539 ?auto_53534 ) ) ( not ( = ?auto_53525 ?auto_53534 ) ) ( not ( = ?auto_53531 ?auto_53544 ) ) ( not ( = ?auto_53536 ?auto_53531 ) ) ( not ( = ?auto_53533 ?auto_53531 ) ) ( not ( = ?auto_53543 ?auto_53531 ) ) ( HOIST-AT ?auto_53540 ?auto_53531 ) ( not ( = ?auto_53530 ?auto_53540 ) ) ( not ( = ?auto_53542 ?auto_53540 ) ) ( not ( = ?auto_53523 ?auto_53540 ) ) ( not ( = ?auto_53537 ?auto_53540 ) ) ( AVAILABLE ?auto_53540 ) ( SURFACE-AT ?auto_53539 ?auto_53531 ) ( ON ?auto_53539 ?auto_53522 ) ( CLEAR ?auto_53539 ) ( not ( = ?auto_53516 ?auto_53522 ) ) ( not ( = ?auto_53517 ?auto_53522 ) ) ( not ( = ?auto_53518 ?auto_53522 ) ) ( not ( = ?auto_53532 ?auto_53522 ) ) ( not ( = ?auto_53521 ?auto_53522 ) ) ( not ( = ?auto_53538 ?auto_53522 ) ) ( not ( = ?auto_53520 ?auto_53522 ) ) ( not ( = ?auto_53539 ?auto_53522 ) ) ( not ( = ?auto_53525 ?auto_53522 ) ) ( not ( = ?auto_53534 ?auto_53522 ) ) ( IS-CRATE ?auto_53534 ) ( not ( = ?auto_53516 ?auto_53524 ) ) ( not ( = ?auto_53517 ?auto_53524 ) ) ( not ( = ?auto_53518 ?auto_53524 ) ) ( not ( = ?auto_53532 ?auto_53524 ) ) ( not ( = ?auto_53521 ?auto_53524 ) ) ( not ( = ?auto_53538 ?auto_53524 ) ) ( not ( = ?auto_53520 ?auto_53524 ) ) ( not ( = ?auto_53539 ?auto_53524 ) ) ( not ( = ?auto_53525 ?auto_53524 ) ) ( not ( = ?auto_53534 ?auto_53524 ) ) ( not ( = ?auto_53522 ?auto_53524 ) ) ( not ( = ?auto_53528 ?auto_53544 ) ) ( not ( = ?auto_53536 ?auto_53528 ) ) ( not ( = ?auto_53533 ?auto_53528 ) ) ( not ( = ?auto_53543 ?auto_53528 ) ) ( not ( = ?auto_53531 ?auto_53528 ) ) ( HOIST-AT ?auto_53527 ?auto_53528 ) ( not ( = ?auto_53530 ?auto_53527 ) ) ( not ( = ?auto_53542 ?auto_53527 ) ) ( not ( = ?auto_53523 ?auto_53527 ) ) ( not ( = ?auto_53537 ?auto_53527 ) ) ( not ( = ?auto_53540 ?auto_53527 ) ) ( AVAILABLE ?auto_53527 ) ( SURFACE-AT ?auto_53534 ?auto_53528 ) ( ON ?auto_53534 ?auto_53526 ) ( CLEAR ?auto_53534 ) ( not ( = ?auto_53516 ?auto_53526 ) ) ( not ( = ?auto_53517 ?auto_53526 ) ) ( not ( = ?auto_53518 ?auto_53526 ) ) ( not ( = ?auto_53532 ?auto_53526 ) ) ( not ( = ?auto_53521 ?auto_53526 ) ) ( not ( = ?auto_53538 ?auto_53526 ) ) ( not ( = ?auto_53520 ?auto_53526 ) ) ( not ( = ?auto_53539 ?auto_53526 ) ) ( not ( = ?auto_53525 ?auto_53526 ) ) ( not ( = ?auto_53534 ?auto_53526 ) ) ( not ( = ?auto_53522 ?auto_53526 ) ) ( not ( = ?auto_53524 ?auto_53526 ) ) ( SURFACE-AT ?auto_53535 ?auto_53544 ) ( CLEAR ?auto_53535 ) ( IS-CRATE ?auto_53524 ) ( not ( = ?auto_53516 ?auto_53535 ) ) ( not ( = ?auto_53517 ?auto_53535 ) ) ( not ( = ?auto_53518 ?auto_53535 ) ) ( not ( = ?auto_53532 ?auto_53535 ) ) ( not ( = ?auto_53521 ?auto_53535 ) ) ( not ( = ?auto_53538 ?auto_53535 ) ) ( not ( = ?auto_53520 ?auto_53535 ) ) ( not ( = ?auto_53539 ?auto_53535 ) ) ( not ( = ?auto_53525 ?auto_53535 ) ) ( not ( = ?auto_53534 ?auto_53535 ) ) ( not ( = ?auto_53522 ?auto_53535 ) ) ( not ( = ?auto_53524 ?auto_53535 ) ) ( not ( = ?auto_53526 ?auto_53535 ) ) ( AVAILABLE ?auto_53530 ) ( TRUCK-AT ?auto_53519 ?auto_53541 ) ( not ( = ?auto_53541 ?auto_53544 ) ) ( not ( = ?auto_53536 ?auto_53541 ) ) ( not ( = ?auto_53533 ?auto_53541 ) ) ( not ( = ?auto_53543 ?auto_53541 ) ) ( not ( = ?auto_53531 ?auto_53541 ) ) ( not ( = ?auto_53528 ?auto_53541 ) ) ( HOIST-AT ?auto_53529 ?auto_53541 ) ( not ( = ?auto_53530 ?auto_53529 ) ) ( not ( = ?auto_53542 ?auto_53529 ) ) ( not ( = ?auto_53523 ?auto_53529 ) ) ( not ( = ?auto_53537 ?auto_53529 ) ) ( not ( = ?auto_53540 ?auto_53529 ) ) ( not ( = ?auto_53527 ?auto_53529 ) ) ( AVAILABLE ?auto_53529 ) ( SURFACE-AT ?auto_53524 ?auto_53541 ) ( ON ?auto_53524 ?auto_53545 ) ( CLEAR ?auto_53524 ) ( not ( = ?auto_53516 ?auto_53545 ) ) ( not ( = ?auto_53517 ?auto_53545 ) ) ( not ( = ?auto_53518 ?auto_53545 ) ) ( not ( = ?auto_53532 ?auto_53545 ) ) ( not ( = ?auto_53521 ?auto_53545 ) ) ( not ( = ?auto_53538 ?auto_53545 ) ) ( not ( = ?auto_53520 ?auto_53545 ) ) ( not ( = ?auto_53539 ?auto_53545 ) ) ( not ( = ?auto_53525 ?auto_53545 ) ) ( not ( = ?auto_53534 ?auto_53545 ) ) ( not ( = ?auto_53522 ?auto_53545 ) ) ( not ( = ?auto_53524 ?auto_53545 ) ) ( not ( = ?auto_53526 ?auto_53545 ) ) ( not ( = ?auto_53535 ?auto_53545 ) ) )
    :subtasks
    ( ( !LIFT ?auto_53529 ?auto_53524 ?auto_53545 ?auto_53541 )
      ( MAKE-ON ?auto_53516 ?auto_53517 )
      ( MAKE-ON-VERIFY ?auto_53516 ?auto_53517 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53546 - SURFACE
      ?auto_53547 - SURFACE
    )
    :vars
    (
      ?auto_53562 - HOIST
      ?auto_53559 - PLACE
      ?auto_53558 - PLACE
      ?auto_53574 - HOIST
      ?auto_53573 - SURFACE
      ?auto_53568 - SURFACE
      ?auto_53564 - PLACE
      ?auto_53551 - HOIST
      ?auto_53563 - SURFACE
      ?auto_53549 - SURFACE
      ?auto_53575 - PLACE
      ?auto_53550 - HOIST
      ?auto_53554 - SURFACE
      ?auto_53570 - SURFACE
      ?auto_53552 - SURFACE
      ?auto_53555 - SURFACE
      ?auto_53566 - PLACE
      ?auto_53571 - HOIST
      ?auto_53567 - SURFACE
      ?auto_53548 - SURFACE
      ?auto_53569 - PLACE
      ?auto_53561 - HOIST
      ?auto_53572 - SURFACE
      ?auto_53557 - SURFACE
      ?auto_53553 - PLACE
      ?auto_53560 - HOIST
      ?auto_53556 - SURFACE
      ?auto_53565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53562 ?auto_53559 ) ( IS-CRATE ?auto_53546 ) ( not ( = ?auto_53546 ?auto_53547 ) ) ( not ( = ?auto_53558 ?auto_53559 ) ) ( HOIST-AT ?auto_53574 ?auto_53558 ) ( not ( = ?auto_53562 ?auto_53574 ) ) ( SURFACE-AT ?auto_53546 ?auto_53558 ) ( ON ?auto_53546 ?auto_53573 ) ( CLEAR ?auto_53546 ) ( not ( = ?auto_53546 ?auto_53573 ) ) ( not ( = ?auto_53547 ?auto_53573 ) ) ( IS-CRATE ?auto_53547 ) ( not ( = ?auto_53546 ?auto_53568 ) ) ( not ( = ?auto_53547 ?auto_53568 ) ) ( not ( = ?auto_53573 ?auto_53568 ) ) ( not ( = ?auto_53564 ?auto_53559 ) ) ( not ( = ?auto_53558 ?auto_53564 ) ) ( HOIST-AT ?auto_53551 ?auto_53564 ) ( not ( = ?auto_53562 ?auto_53551 ) ) ( not ( = ?auto_53574 ?auto_53551 ) ) ( AVAILABLE ?auto_53551 ) ( SURFACE-AT ?auto_53547 ?auto_53564 ) ( ON ?auto_53547 ?auto_53563 ) ( CLEAR ?auto_53547 ) ( not ( = ?auto_53546 ?auto_53563 ) ) ( not ( = ?auto_53547 ?auto_53563 ) ) ( not ( = ?auto_53573 ?auto_53563 ) ) ( not ( = ?auto_53568 ?auto_53563 ) ) ( IS-CRATE ?auto_53568 ) ( not ( = ?auto_53546 ?auto_53549 ) ) ( not ( = ?auto_53547 ?auto_53549 ) ) ( not ( = ?auto_53573 ?auto_53549 ) ) ( not ( = ?auto_53568 ?auto_53549 ) ) ( not ( = ?auto_53563 ?auto_53549 ) ) ( not ( = ?auto_53575 ?auto_53559 ) ) ( not ( = ?auto_53558 ?auto_53575 ) ) ( not ( = ?auto_53564 ?auto_53575 ) ) ( HOIST-AT ?auto_53550 ?auto_53575 ) ( not ( = ?auto_53562 ?auto_53550 ) ) ( not ( = ?auto_53574 ?auto_53550 ) ) ( not ( = ?auto_53551 ?auto_53550 ) ) ( AVAILABLE ?auto_53550 ) ( SURFACE-AT ?auto_53568 ?auto_53575 ) ( ON ?auto_53568 ?auto_53554 ) ( CLEAR ?auto_53568 ) ( not ( = ?auto_53546 ?auto_53554 ) ) ( not ( = ?auto_53547 ?auto_53554 ) ) ( not ( = ?auto_53573 ?auto_53554 ) ) ( not ( = ?auto_53568 ?auto_53554 ) ) ( not ( = ?auto_53563 ?auto_53554 ) ) ( not ( = ?auto_53549 ?auto_53554 ) ) ( IS-CRATE ?auto_53549 ) ( not ( = ?auto_53546 ?auto_53570 ) ) ( not ( = ?auto_53547 ?auto_53570 ) ) ( not ( = ?auto_53573 ?auto_53570 ) ) ( not ( = ?auto_53568 ?auto_53570 ) ) ( not ( = ?auto_53563 ?auto_53570 ) ) ( not ( = ?auto_53549 ?auto_53570 ) ) ( not ( = ?auto_53554 ?auto_53570 ) ) ( AVAILABLE ?auto_53574 ) ( SURFACE-AT ?auto_53549 ?auto_53558 ) ( ON ?auto_53549 ?auto_53552 ) ( CLEAR ?auto_53549 ) ( not ( = ?auto_53546 ?auto_53552 ) ) ( not ( = ?auto_53547 ?auto_53552 ) ) ( not ( = ?auto_53573 ?auto_53552 ) ) ( not ( = ?auto_53568 ?auto_53552 ) ) ( not ( = ?auto_53563 ?auto_53552 ) ) ( not ( = ?auto_53549 ?auto_53552 ) ) ( not ( = ?auto_53554 ?auto_53552 ) ) ( not ( = ?auto_53570 ?auto_53552 ) ) ( IS-CRATE ?auto_53570 ) ( not ( = ?auto_53546 ?auto_53555 ) ) ( not ( = ?auto_53547 ?auto_53555 ) ) ( not ( = ?auto_53573 ?auto_53555 ) ) ( not ( = ?auto_53568 ?auto_53555 ) ) ( not ( = ?auto_53563 ?auto_53555 ) ) ( not ( = ?auto_53549 ?auto_53555 ) ) ( not ( = ?auto_53554 ?auto_53555 ) ) ( not ( = ?auto_53570 ?auto_53555 ) ) ( not ( = ?auto_53552 ?auto_53555 ) ) ( not ( = ?auto_53566 ?auto_53559 ) ) ( not ( = ?auto_53558 ?auto_53566 ) ) ( not ( = ?auto_53564 ?auto_53566 ) ) ( not ( = ?auto_53575 ?auto_53566 ) ) ( HOIST-AT ?auto_53571 ?auto_53566 ) ( not ( = ?auto_53562 ?auto_53571 ) ) ( not ( = ?auto_53574 ?auto_53571 ) ) ( not ( = ?auto_53551 ?auto_53571 ) ) ( not ( = ?auto_53550 ?auto_53571 ) ) ( AVAILABLE ?auto_53571 ) ( SURFACE-AT ?auto_53570 ?auto_53566 ) ( ON ?auto_53570 ?auto_53567 ) ( CLEAR ?auto_53570 ) ( not ( = ?auto_53546 ?auto_53567 ) ) ( not ( = ?auto_53547 ?auto_53567 ) ) ( not ( = ?auto_53573 ?auto_53567 ) ) ( not ( = ?auto_53568 ?auto_53567 ) ) ( not ( = ?auto_53563 ?auto_53567 ) ) ( not ( = ?auto_53549 ?auto_53567 ) ) ( not ( = ?auto_53554 ?auto_53567 ) ) ( not ( = ?auto_53570 ?auto_53567 ) ) ( not ( = ?auto_53552 ?auto_53567 ) ) ( not ( = ?auto_53555 ?auto_53567 ) ) ( IS-CRATE ?auto_53555 ) ( not ( = ?auto_53546 ?auto_53548 ) ) ( not ( = ?auto_53547 ?auto_53548 ) ) ( not ( = ?auto_53573 ?auto_53548 ) ) ( not ( = ?auto_53568 ?auto_53548 ) ) ( not ( = ?auto_53563 ?auto_53548 ) ) ( not ( = ?auto_53549 ?auto_53548 ) ) ( not ( = ?auto_53554 ?auto_53548 ) ) ( not ( = ?auto_53570 ?auto_53548 ) ) ( not ( = ?auto_53552 ?auto_53548 ) ) ( not ( = ?auto_53555 ?auto_53548 ) ) ( not ( = ?auto_53567 ?auto_53548 ) ) ( not ( = ?auto_53569 ?auto_53559 ) ) ( not ( = ?auto_53558 ?auto_53569 ) ) ( not ( = ?auto_53564 ?auto_53569 ) ) ( not ( = ?auto_53575 ?auto_53569 ) ) ( not ( = ?auto_53566 ?auto_53569 ) ) ( HOIST-AT ?auto_53561 ?auto_53569 ) ( not ( = ?auto_53562 ?auto_53561 ) ) ( not ( = ?auto_53574 ?auto_53561 ) ) ( not ( = ?auto_53551 ?auto_53561 ) ) ( not ( = ?auto_53550 ?auto_53561 ) ) ( not ( = ?auto_53571 ?auto_53561 ) ) ( AVAILABLE ?auto_53561 ) ( SURFACE-AT ?auto_53555 ?auto_53569 ) ( ON ?auto_53555 ?auto_53572 ) ( CLEAR ?auto_53555 ) ( not ( = ?auto_53546 ?auto_53572 ) ) ( not ( = ?auto_53547 ?auto_53572 ) ) ( not ( = ?auto_53573 ?auto_53572 ) ) ( not ( = ?auto_53568 ?auto_53572 ) ) ( not ( = ?auto_53563 ?auto_53572 ) ) ( not ( = ?auto_53549 ?auto_53572 ) ) ( not ( = ?auto_53554 ?auto_53572 ) ) ( not ( = ?auto_53570 ?auto_53572 ) ) ( not ( = ?auto_53552 ?auto_53572 ) ) ( not ( = ?auto_53555 ?auto_53572 ) ) ( not ( = ?auto_53567 ?auto_53572 ) ) ( not ( = ?auto_53548 ?auto_53572 ) ) ( SURFACE-AT ?auto_53557 ?auto_53559 ) ( CLEAR ?auto_53557 ) ( IS-CRATE ?auto_53548 ) ( not ( = ?auto_53546 ?auto_53557 ) ) ( not ( = ?auto_53547 ?auto_53557 ) ) ( not ( = ?auto_53573 ?auto_53557 ) ) ( not ( = ?auto_53568 ?auto_53557 ) ) ( not ( = ?auto_53563 ?auto_53557 ) ) ( not ( = ?auto_53549 ?auto_53557 ) ) ( not ( = ?auto_53554 ?auto_53557 ) ) ( not ( = ?auto_53570 ?auto_53557 ) ) ( not ( = ?auto_53552 ?auto_53557 ) ) ( not ( = ?auto_53555 ?auto_53557 ) ) ( not ( = ?auto_53567 ?auto_53557 ) ) ( not ( = ?auto_53548 ?auto_53557 ) ) ( not ( = ?auto_53572 ?auto_53557 ) ) ( AVAILABLE ?auto_53562 ) ( not ( = ?auto_53553 ?auto_53559 ) ) ( not ( = ?auto_53558 ?auto_53553 ) ) ( not ( = ?auto_53564 ?auto_53553 ) ) ( not ( = ?auto_53575 ?auto_53553 ) ) ( not ( = ?auto_53566 ?auto_53553 ) ) ( not ( = ?auto_53569 ?auto_53553 ) ) ( HOIST-AT ?auto_53560 ?auto_53553 ) ( not ( = ?auto_53562 ?auto_53560 ) ) ( not ( = ?auto_53574 ?auto_53560 ) ) ( not ( = ?auto_53551 ?auto_53560 ) ) ( not ( = ?auto_53550 ?auto_53560 ) ) ( not ( = ?auto_53571 ?auto_53560 ) ) ( not ( = ?auto_53561 ?auto_53560 ) ) ( AVAILABLE ?auto_53560 ) ( SURFACE-AT ?auto_53548 ?auto_53553 ) ( ON ?auto_53548 ?auto_53556 ) ( CLEAR ?auto_53548 ) ( not ( = ?auto_53546 ?auto_53556 ) ) ( not ( = ?auto_53547 ?auto_53556 ) ) ( not ( = ?auto_53573 ?auto_53556 ) ) ( not ( = ?auto_53568 ?auto_53556 ) ) ( not ( = ?auto_53563 ?auto_53556 ) ) ( not ( = ?auto_53549 ?auto_53556 ) ) ( not ( = ?auto_53554 ?auto_53556 ) ) ( not ( = ?auto_53570 ?auto_53556 ) ) ( not ( = ?auto_53552 ?auto_53556 ) ) ( not ( = ?auto_53555 ?auto_53556 ) ) ( not ( = ?auto_53567 ?auto_53556 ) ) ( not ( = ?auto_53548 ?auto_53556 ) ) ( not ( = ?auto_53572 ?auto_53556 ) ) ( not ( = ?auto_53557 ?auto_53556 ) ) ( TRUCK-AT ?auto_53565 ?auto_53559 ) )
    :subtasks
    ( ( !DRIVE ?auto_53565 ?auto_53559 ?auto_53553 )
      ( MAKE-ON ?auto_53546 ?auto_53547 )
      ( MAKE-ON-VERIFY ?auto_53546 ?auto_53547 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53576 - SURFACE
      ?auto_53577 - SURFACE
    )
    :vars
    (
      ?auto_53590 - HOIST
      ?auto_53588 - PLACE
      ?auto_53604 - PLACE
      ?auto_53578 - HOIST
      ?auto_53605 - SURFACE
      ?auto_53585 - SURFACE
      ?auto_53581 - PLACE
      ?auto_53600 - HOIST
      ?auto_53593 - SURFACE
      ?auto_53587 - SURFACE
      ?auto_53579 - PLACE
      ?auto_53598 - HOIST
      ?auto_53599 - SURFACE
      ?auto_53592 - SURFACE
      ?auto_53595 - SURFACE
      ?auto_53602 - SURFACE
      ?auto_53583 - PLACE
      ?auto_53580 - HOIST
      ?auto_53584 - SURFACE
      ?auto_53586 - SURFACE
      ?auto_53591 - PLACE
      ?auto_53596 - HOIST
      ?auto_53601 - SURFACE
      ?auto_53594 - SURFACE
      ?auto_53597 - PLACE
      ?auto_53603 - HOIST
      ?auto_53589 - SURFACE
      ?auto_53582 - TRUCK
      ?auto_53606 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53590 ?auto_53588 ) ( IS-CRATE ?auto_53576 ) ( not ( = ?auto_53576 ?auto_53577 ) ) ( not ( = ?auto_53604 ?auto_53588 ) ) ( HOIST-AT ?auto_53578 ?auto_53604 ) ( not ( = ?auto_53590 ?auto_53578 ) ) ( SURFACE-AT ?auto_53576 ?auto_53604 ) ( ON ?auto_53576 ?auto_53605 ) ( CLEAR ?auto_53576 ) ( not ( = ?auto_53576 ?auto_53605 ) ) ( not ( = ?auto_53577 ?auto_53605 ) ) ( IS-CRATE ?auto_53577 ) ( not ( = ?auto_53576 ?auto_53585 ) ) ( not ( = ?auto_53577 ?auto_53585 ) ) ( not ( = ?auto_53605 ?auto_53585 ) ) ( not ( = ?auto_53581 ?auto_53588 ) ) ( not ( = ?auto_53604 ?auto_53581 ) ) ( HOIST-AT ?auto_53600 ?auto_53581 ) ( not ( = ?auto_53590 ?auto_53600 ) ) ( not ( = ?auto_53578 ?auto_53600 ) ) ( AVAILABLE ?auto_53600 ) ( SURFACE-AT ?auto_53577 ?auto_53581 ) ( ON ?auto_53577 ?auto_53593 ) ( CLEAR ?auto_53577 ) ( not ( = ?auto_53576 ?auto_53593 ) ) ( not ( = ?auto_53577 ?auto_53593 ) ) ( not ( = ?auto_53605 ?auto_53593 ) ) ( not ( = ?auto_53585 ?auto_53593 ) ) ( IS-CRATE ?auto_53585 ) ( not ( = ?auto_53576 ?auto_53587 ) ) ( not ( = ?auto_53577 ?auto_53587 ) ) ( not ( = ?auto_53605 ?auto_53587 ) ) ( not ( = ?auto_53585 ?auto_53587 ) ) ( not ( = ?auto_53593 ?auto_53587 ) ) ( not ( = ?auto_53579 ?auto_53588 ) ) ( not ( = ?auto_53604 ?auto_53579 ) ) ( not ( = ?auto_53581 ?auto_53579 ) ) ( HOIST-AT ?auto_53598 ?auto_53579 ) ( not ( = ?auto_53590 ?auto_53598 ) ) ( not ( = ?auto_53578 ?auto_53598 ) ) ( not ( = ?auto_53600 ?auto_53598 ) ) ( AVAILABLE ?auto_53598 ) ( SURFACE-AT ?auto_53585 ?auto_53579 ) ( ON ?auto_53585 ?auto_53599 ) ( CLEAR ?auto_53585 ) ( not ( = ?auto_53576 ?auto_53599 ) ) ( not ( = ?auto_53577 ?auto_53599 ) ) ( not ( = ?auto_53605 ?auto_53599 ) ) ( not ( = ?auto_53585 ?auto_53599 ) ) ( not ( = ?auto_53593 ?auto_53599 ) ) ( not ( = ?auto_53587 ?auto_53599 ) ) ( IS-CRATE ?auto_53587 ) ( not ( = ?auto_53576 ?auto_53592 ) ) ( not ( = ?auto_53577 ?auto_53592 ) ) ( not ( = ?auto_53605 ?auto_53592 ) ) ( not ( = ?auto_53585 ?auto_53592 ) ) ( not ( = ?auto_53593 ?auto_53592 ) ) ( not ( = ?auto_53587 ?auto_53592 ) ) ( not ( = ?auto_53599 ?auto_53592 ) ) ( AVAILABLE ?auto_53578 ) ( SURFACE-AT ?auto_53587 ?auto_53604 ) ( ON ?auto_53587 ?auto_53595 ) ( CLEAR ?auto_53587 ) ( not ( = ?auto_53576 ?auto_53595 ) ) ( not ( = ?auto_53577 ?auto_53595 ) ) ( not ( = ?auto_53605 ?auto_53595 ) ) ( not ( = ?auto_53585 ?auto_53595 ) ) ( not ( = ?auto_53593 ?auto_53595 ) ) ( not ( = ?auto_53587 ?auto_53595 ) ) ( not ( = ?auto_53599 ?auto_53595 ) ) ( not ( = ?auto_53592 ?auto_53595 ) ) ( IS-CRATE ?auto_53592 ) ( not ( = ?auto_53576 ?auto_53602 ) ) ( not ( = ?auto_53577 ?auto_53602 ) ) ( not ( = ?auto_53605 ?auto_53602 ) ) ( not ( = ?auto_53585 ?auto_53602 ) ) ( not ( = ?auto_53593 ?auto_53602 ) ) ( not ( = ?auto_53587 ?auto_53602 ) ) ( not ( = ?auto_53599 ?auto_53602 ) ) ( not ( = ?auto_53592 ?auto_53602 ) ) ( not ( = ?auto_53595 ?auto_53602 ) ) ( not ( = ?auto_53583 ?auto_53588 ) ) ( not ( = ?auto_53604 ?auto_53583 ) ) ( not ( = ?auto_53581 ?auto_53583 ) ) ( not ( = ?auto_53579 ?auto_53583 ) ) ( HOIST-AT ?auto_53580 ?auto_53583 ) ( not ( = ?auto_53590 ?auto_53580 ) ) ( not ( = ?auto_53578 ?auto_53580 ) ) ( not ( = ?auto_53600 ?auto_53580 ) ) ( not ( = ?auto_53598 ?auto_53580 ) ) ( AVAILABLE ?auto_53580 ) ( SURFACE-AT ?auto_53592 ?auto_53583 ) ( ON ?auto_53592 ?auto_53584 ) ( CLEAR ?auto_53592 ) ( not ( = ?auto_53576 ?auto_53584 ) ) ( not ( = ?auto_53577 ?auto_53584 ) ) ( not ( = ?auto_53605 ?auto_53584 ) ) ( not ( = ?auto_53585 ?auto_53584 ) ) ( not ( = ?auto_53593 ?auto_53584 ) ) ( not ( = ?auto_53587 ?auto_53584 ) ) ( not ( = ?auto_53599 ?auto_53584 ) ) ( not ( = ?auto_53592 ?auto_53584 ) ) ( not ( = ?auto_53595 ?auto_53584 ) ) ( not ( = ?auto_53602 ?auto_53584 ) ) ( IS-CRATE ?auto_53602 ) ( not ( = ?auto_53576 ?auto_53586 ) ) ( not ( = ?auto_53577 ?auto_53586 ) ) ( not ( = ?auto_53605 ?auto_53586 ) ) ( not ( = ?auto_53585 ?auto_53586 ) ) ( not ( = ?auto_53593 ?auto_53586 ) ) ( not ( = ?auto_53587 ?auto_53586 ) ) ( not ( = ?auto_53599 ?auto_53586 ) ) ( not ( = ?auto_53592 ?auto_53586 ) ) ( not ( = ?auto_53595 ?auto_53586 ) ) ( not ( = ?auto_53602 ?auto_53586 ) ) ( not ( = ?auto_53584 ?auto_53586 ) ) ( not ( = ?auto_53591 ?auto_53588 ) ) ( not ( = ?auto_53604 ?auto_53591 ) ) ( not ( = ?auto_53581 ?auto_53591 ) ) ( not ( = ?auto_53579 ?auto_53591 ) ) ( not ( = ?auto_53583 ?auto_53591 ) ) ( HOIST-AT ?auto_53596 ?auto_53591 ) ( not ( = ?auto_53590 ?auto_53596 ) ) ( not ( = ?auto_53578 ?auto_53596 ) ) ( not ( = ?auto_53600 ?auto_53596 ) ) ( not ( = ?auto_53598 ?auto_53596 ) ) ( not ( = ?auto_53580 ?auto_53596 ) ) ( AVAILABLE ?auto_53596 ) ( SURFACE-AT ?auto_53602 ?auto_53591 ) ( ON ?auto_53602 ?auto_53601 ) ( CLEAR ?auto_53602 ) ( not ( = ?auto_53576 ?auto_53601 ) ) ( not ( = ?auto_53577 ?auto_53601 ) ) ( not ( = ?auto_53605 ?auto_53601 ) ) ( not ( = ?auto_53585 ?auto_53601 ) ) ( not ( = ?auto_53593 ?auto_53601 ) ) ( not ( = ?auto_53587 ?auto_53601 ) ) ( not ( = ?auto_53599 ?auto_53601 ) ) ( not ( = ?auto_53592 ?auto_53601 ) ) ( not ( = ?auto_53595 ?auto_53601 ) ) ( not ( = ?auto_53602 ?auto_53601 ) ) ( not ( = ?auto_53584 ?auto_53601 ) ) ( not ( = ?auto_53586 ?auto_53601 ) ) ( IS-CRATE ?auto_53586 ) ( not ( = ?auto_53576 ?auto_53594 ) ) ( not ( = ?auto_53577 ?auto_53594 ) ) ( not ( = ?auto_53605 ?auto_53594 ) ) ( not ( = ?auto_53585 ?auto_53594 ) ) ( not ( = ?auto_53593 ?auto_53594 ) ) ( not ( = ?auto_53587 ?auto_53594 ) ) ( not ( = ?auto_53599 ?auto_53594 ) ) ( not ( = ?auto_53592 ?auto_53594 ) ) ( not ( = ?auto_53595 ?auto_53594 ) ) ( not ( = ?auto_53602 ?auto_53594 ) ) ( not ( = ?auto_53584 ?auto_53594 ) ) ( not ( = ?auto_53586 ?auto_53594 ) ) ( not ( = ?auto_53601 ?auto_53594 ) ) ( not ( = ?auto_53597 ?auto_53588 ) ) ( not ( = ?auto_53604 ?auto_53597 ) ) ( not ( = ?auto_53581 ?auto_53597 ) ) ( not ( = ?auto_53579 ?auto_53597 ) ) ( not ( = ?auto_53583 ?auto_53597 ) ) ( not ( = ?auto_53591 ?auto_53597 ) ) ( HOIST-AT ?auto_53603 ?auto_53597 ) ( not ( = ?auto_53590 ?auto_53603 ) ) ( not ( = ?auto_53578 ?auto_53603 ) ) ( not ( = ?auto_53600 ?auto_53603 ) ) ( not ( = ?auto_53598 ?auto_53603 ) ) ( not ( = ?auto_53580 ?auto_53603 ) ) ( not ( = ?auto_53596 ?auto_53603 ) ) ( AVAILABLE ?auto_53603 ) ( SURFACE-AT ?auto_53586 ?auto_53597 ) ( ON ?auto_53586 ?auto_53589 ) ( CLEAR ?auto_53586 ) ( not ( = ?auto_53576 ?auto_53589 ) ) ( not ( = ?auto_53577 ?auto_53589 ) ) ( not ( = ?auto_53605 ?auto_53589 ) ) ( not ( = ?auto_53585 ?auto_53589 ) ) ( not ( = ?auto_53593 ?auto_53589 ) ) ( not ( = ?auto_53587 ?auto_53589 ) ) ( not ( = ?auto_53599 ?auto_53589 ) ) ( not ( = ?auto_53592 ?auto_53589 ) ) ( not ( = ?auto_53595 ?auto_53589 ) ) ( not ( = ?auto_53602 ?auto_53589 ) ) ( not ( = ?auto_53584 ?auto_53589 ) ) ( not ( = ?auto_53586 ?auto_53589 ) ) ( not ( = ?auto_53601 ?auto_53589 ) ) ( not ( = ?auto_53594 ?auto_53589 ) ) ( TRUCK-AT ?auto_53582 ?auto_53588 ) ( SURFACE-AT ?auto_53606 ?auto_53588 ) ( CLEAR ?auto_53606 ) ( LIFTING ?auto_53590 ?auto_53594 ) ( IS-CRATE ?auto_53594 ) ( not ( = ?auto_53576 ?auto_53606 ) ) ( not ( = ?auto_53577 ?auto_53606 ) ) ( not ( = ?auto_53605 ?auto_53606 ) ) ( not ( = ?auto_53585 ?auto_53606 ) ) ( not ( = ?auto_53593 ?auto_53606 ) ) ( not ( = ?auto_53587 ?auto_53606 ) ) ( not ( = ?auto_53599 ?auto_53606 ) ) ( not ( = ?auto_53592 ?auto_53606 ) ) ( not ( = ?auto_53595 ?auto_53606 ) ) ( not ( = ?auto_53602 ?auto_53606 ) ) ( not ( = ?auto_53584 ?auto_53606 ) ) ( not ( = ?auto_53586 ?auto_53606 ) ) ( not ( = ?auto_53601 ?auto_53606 ) ) ( not ( = ?auto_53594 ?auto_53606 ) ) ( not ( = ?auto_53589 ?auto_53606 ) ) )
    :subtasks
    ( ( !DROP ?auto_53590 ?auto_53594 ?auto_53606 ?auto_53588 )
      ( MAKE-ON ?auto_53576 ?auto_53577 )
      ( MAKE-ON-VERIFY ?auto_53576 ?auto_53577 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53607 - SURFACE
      ?auto_53608 - SURFACE
    )
    :vars
    (
      ?auto_53630 - HOIST
      ?auto_53611 - PLACE
      ?auto_53634 - PLACE
      ?auto_53628 - HOIST
      ?auto_53635 - SURFACE
      ?auto_53631 - SURFACE
      ?auto_53629 - PLACE
      ?auto_53623 - HOIST
      ?auto_53624 - SURFACE
      ?auto_53615 - SURFACE
      ?auto_53612 - PLACE
      ?auto_53621 - HOIST
      ?auto_53622 - SURFACE
      ?auto_53626 - SURFACE
      ?auto_53609 - SURFACE
      ?auto_53614 - SURFACE
      ?auto_53632 - PLACE
      ?auto_53633 - HOIST
      ?auto_53627 - SURFACE
      ?auto_53618 - SURFACE
      ?auto_53619 - PLACE
      ?auto_53610 - HOIST
      ?auto_53636 - SURFACE
      ?auto_53637 - SURFACE
      ?auto_53620 - PLACE
      ?auto_53613 - HOIST
      ?auto_53617 - SURFACE
      ?auto_53616 - TRUCK
      ?auto_53625 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53630 ?auto_53611 ) ( IS-CRATE ?auto_53607 ) ( not ( = ?auto_53607 ?auto_53608 ) ) ( not ( = ?auto_53634 ?auto_53611 ) ) ( HOIST-AT ?auto_53628 ?auto_53634 ) ( not ( = ?auto_53630 ?auto_53628 ) ) ( SURFACE-AT ?auto_53607 ?auto_53634 ) ( ON ?auto_53607 ?auto_53635 ) ( CLEAR ?auto_53607 ) ( not ( = ?auto_53607 ?auto_53635 ) ) ( not ( = ?auto_53608 ?auto_53635 ) ) ( IS-CRATE ?auto_53608 ) ( not ( = ?auto_53607 ?auto_53631 ) ) ( not ( = ?auto_53608 ?auto_53631 ) ) ( not ( = ?auto_53635 ?auto_53631 ) ) ( not ( = ?auto_53629 ?auto_53611 ) ) ( not ( = ?auto_53634 ?auto_53629 ) ) ( HOIST-AT ?auto_53623 ?auto_53629 ) ( not ( = ?auto_53630 ?auto_53623 ) ) ( not ( = ?auto_53628 ?auto_53623 ) ) ( AVAILABLE ?auto_53623 ) ( SURFACE-AT ?auto_53608 ?auto_53629 ) ( ON ?auto_53608 ?auto_53624 ) ( CLEAR ?auto_53608 ) ( not ( = ?auto_53607 ?auto_53624 ) ) ( not ( = ?auto_53608 ?auto_53624 ) ) ( not ( = ?auto_53635 ?auto_53624 ) ) ( not ( = ?auto_53631 ?auto_53624 ) ) ( IS-CRATE ?auto_53631 ) ( not ( = ?auto_53607 ?auto_53615 ) ) ( not ( = ?auto_53608 ?auto_53615 ) ) ( not ( = ?auto_53635 ?auto_53615 ) ) ( not ( = ?auto_53631 ?auto_53615 ) ) ( not ( = ?auto_53624 ?auto_53615 ) ) ( not ( = ?auto_53612 ?auto_53611 ) ) ( not ( = ?auto_53634 ?auto_53612 ) ) ( not ( = ?auto_53629 ?auto_53612 ) ) ( HOIST-AT ?auto_53621 ?auto_53612 ) ( not ( = ?auto_53630 ?auto_53621 ) ) ( not ( = ?auto_53628 ?auto_53621 ) ) ( not ( = ?auto_53623 ?auto_53621 ) ) ( AVAILABLE ?auto_53621 ) ( SURFACE-AT ?auto_53631 ?auto_53612 ) ( ON ?auto_53631 ?auto_53622 ) ( CLEAR ?auto_53631 ) ( not ( = ?auto_53607 ?auto_53622 ) ) ( not ( = ?auto_53608 ?auto_53622 ) ) ( not ( = ?auto_53635 ?auto_53622 ) ) ( not ( = ?auto_53631 ?auto_53622 ) ) ( not ( = ?auto_53624 ?auto_53622 ) ) ( not ( = ?auto_53615 ?auto_53622 ) ) ( IS-CRATE ?auto_53615 ) ( not ( = ?auto_53607 ?auto_53626 ) ) ( not ( = ?auto_53608 ?auto_53626 ) ) ( not ( = ?auto_53635 ?auto_53626 ) ) ( not ( = ?auto_53631 ?auto_53626 ) ) ( not ( = ?auto_53624 ?auto_53626 ) ) ( not ( = ?auto_53615 ?auto_53626 ) ) ( not ( = ?auto_53622 ?auto_53626 ) ) ( AVAILABLE ?auto_53628 ) ( SURFACE-AT ?auto_53615 ?auto_53634 ) ( ON ?auto_53615 ?auto_53609 ) ( CLEAR ?auto_53615 ) ( not ( = ?auto_53607 ?auto_53609 ) ) ( not ( = ?auto_53608 ?auto_53609 ) ) ( not ( = ?auto_53635 ?auto_53609 ) ) ( not ( = ?auto_53631 ?auto_53609 ) ) ( not ( = ?auto_53624 ?auto_53609 ) ) ( not ( = ?auto_53615 ?auto_53609 ) ) ( not ( = ?auto_53622 ?auto_53609 ) ) ( not ( = ?auto_53626 ?auto_53609 ) ) ( IS-CRATE ?auto_53626 ) ( not ( = ?auto_53607 ?auto_53614 ) ) ( not ( = ?auto_53608 ?auto_53614 ) ) ( not ( = ?auto_53635 ?auto_53614 ) ) ( not ( = ?auto_53631 ?auto_53614 ) ) ( not ( = ?auto_53624 ?auto_53614 ) ) ( not ( = ?auto_53615 ?auto_53614 ) ) ( not ( = ?auto_53622 ?auto_53614 ) ) ( not ( = ?auto_53626 ?auto_53614 ) ) ( not ( = ?auto_53609 ?auto_53614 ) ) ( not ( = ?auto_53632 ?auto_53611 ) ) ( not ( = ?auto_53634 ?auto_53632 ) ) ( not ( = ?auto_53629 ?auto_53632 ) ) ( not ( = ?auto_53612 ?auto_53632 ) ) ( HOIST-AT ?auto_53633 ?auto_53632 ) ( not ( = ?auto_53630 ?auto_53633 ) ) ( not ( = ?auto_53628 ?auto_53633 ) ) ( not ( = ?auto_53623 ?auto_53633 ) ) ( not ( = ?auto_53621 ?auto_53633 ) ) ( AVAILABLE ?auto_53633 ) ( SURFACE-AT ?auto_53626 ?auto_53632 ) ( ON ?auto_53626 ?auto_53627 ) ( CLEAR ?auto_53626 ) ( not ( = ?auto_53607 ?auto_53627 ) ) ( not ( = ?auto_53608 ?auto_53627 ) ) ( not ( = ?auto_53635 ?auto_53627 ) ) ( not ( = ?auto_53631 ?auto_53627 ) ) ( not ( = ?auto_53624 ?auto_53627 ) ) ( not ( = ?auto_53615 ?auto_53627 ) ) ( not ( = ?auto_53622 ?auto_53627 ) ) ( not ( = ?auto_53626 ?auto_53627 ) ) ( not ( = ?auto_53609 ?auto_53627 ) ) ( not ( = ?auto_53614 ?auto_53627 ) ) ( IS-CRATE ?auto_53614 ) ( not ( = ?auto_53607 ?auto_53618 ) ) ( not ( = ?auto_53608 ?auto_53618 ) ) ( not ( = ?auto_53635 ?auto_53618 ) ) ( not ( = ?auto_53631 ?auto_53618 ) ) ( not ( = ?auto_53624 ?auto_53618 ) ) ( not ( = ?auto_53615 ?auto_53618 ) ) ( not ( = ?auto_53622 ?auto_53618 ) ) ( not ( = ?auto_53626 ?auto_53618 ) ) ( not ( = ?auto_53609 ?auto_53618 ) ) ( not ( = ?auto_53614 ?auto_53618 ) ) ( not ( = ?auto_53627 ?auto_53618 ) ) ( not ( = ?auto_53619 ?auto_53611 ) ) ( not ( = ?auto_53634 ?auto_53619 ) ) ( not ( = ?auto_53629 ?auto_53619 ) ) ( not ( = ?auto_53612 ?auto_53619 ) ) ( not ( = ?auto_53632 ?auto_53619 ) ) ( HOIST-AT ?auto_53610 ?auto_53619 ) ( not ( = ?auto_53630 ?auto_53610 ) ) ( not ( = ?auto_53628 ?auto_53610 ) ) ( not ( = ?auto_53623 ?auto_53610 ) ) ( not ( = ?auto_53621 ?auto_53610 ) ) ( not ( = ?auto_53633 ?auto_53610 ) ) ( AVAILABLE ?auto_53610 ) ( SURFACE-AT ?auto_53614 ?auto_53619 ) ( ON ?auto_53614 ?auto_53636 ) ( CLEAR ?auto_53614 ) ( not ( = ?auto_53607 ?auto_53636 ) ) ( not ( = ?auto_53608 ?auto_53636 ) ) ( not ( = ?auto_53635 ?auto_53636 ) ) ( not ( = ?auto_53631 ?auto_53636 ) ) ( not ( = ?auto_53624 ?auto_53636 ) ) ( not ( = ?auto_53615 ?auto_53636 ) ) ( not ( = ?auto_53622 ?auto_53636 ) ) ( not ( = ?auto_53626 ?auto_53636 ) ) ( not ( = ?auto_53609 ?auto_53636 ) ) ( not ( = ?auto_53614 ?auto_53636 ) ) ( not ( = ?auto_53627 ?auto_53636 ) ) ( not ( = ?auto_53618 ?auto_53636 ) ) ( IS-CRATE ?auto_53618 ) ( not ( = ?auto_53607 ?auto_53637 ) ) ( not ( = ?auto_53608 ?auto_53637 ) ) ( not ( = ?auto_53635 ?auto_53637 ) ) ( not ( = ?auto_53631 ?auto_53637 ) ) ( not ( = ?auto_53624 ?auto_53637 ) ) ( not ( = ?auto_53615 ?auto_53637 ) ) ( not ( = ?auto_53622 ?auto_53637 ) ) ( not ( = ?auto_53626 ?auto_53637 ) ) ( not ( = ?auto_53609 ?auto_53637 ) ) ( not ( = ?auto_53614 ?auto_53637 ) ) ( not ( = ?auto_53627 ?auto_53637 ) ) ( not ( = ?auto_53618 ?auto_53637 ) ) ( not ( = ?auto_53636 ?auto_53637 ) ) ( not ( = ?auto_53620 ?auto_53611 ) ) ( not ( = ?auto_53634 ?auto_53620 ) ) ( not ( = ?auto_53629 ?auto_53620 ) ) ( not ( = ?auto_53612 ?auto_53620 ) ) ( not ( = ?auto_53632 ?auto_53620 ) ) ( not ( = ?auto_53619 ?auto_53620 ) ) ( HOIST-AT ?auto_53613 ?auto_53620 ) ( not ( = ?auto_53630 ?auto_53613 ) ) ( not ( = ?auto_53628 ?auto_53613 ) ) ( not ( = ?auto_53623 ?auto_53613 ) ) ( not ( = ?auto_53621 ?auto_53613 ) ) ( not ( = ?auto_53633 ?auto_53613 ) ) ( not ( = ?auto_53610 ?auto_53613 ) ) ( AVAILABLE ?auto_53613 ) ( SURFACE-AT ?auto_53618 ?auto_53620 ) ( ON ?auto_53618 ?auto_53617 ) ( CLEAR ?auto_53618 ) ( not ( = ?auto_53607 ?auto_53617 ) ) ( not ( = ?auto_53608 ?auto_53617 ) ) ( not ( = ?auto_53635 ?auto_53617 ) ) ( not ( = ?auto_53631 ?auto_53617 ) ) ( not ( = ?auto_53624 ?auto_53617 ) ) ( not ( = ?auto_53615 ?auto_53617 ) ) ( not ( = ?auto_53622 ?auto_53617 ) ) ( not ( = ?auto_53626 ?auto_53617 ) ) ( not ( = ?auto_53609 ?auto_53617 ) ) ( not ( = ?auto_53614 ?auto_53617 ) ) ( not ( = ?auto_53627 ?auto_53617 ) ) ( not ( = ?auto_53618 ?auto_53617 ) ) ( not ( = ?auto_53636 ?auto_53617 ) ) ( not ( = ?auto_53637 ?auto_53617 ) ) ( TRUCK-AT ?auto_53616 ?auto_53611 ) ( SURFACE-AT ?auto_53625 ?auto_53611 ) ( CLEAR ?auto_53625 ) ( IS-CRATE ?auto_53637 ) ( not ( = ?auto_53607 ?auto_53625 ) ) ( not ( = ?auto_53608 ?auto_53625 ) ) ( not ( = ?auto_53635 ?auto_53625 ) ) ( not ( = ?auto_53631 ?auto_53625 ) ) ( not ( = ?auto_53624 ?auto_53625 ) ) ( not ( = ?auto_53615 ?auto_53625 ) ) ( not ( = ?auto_53622 ?auto_53625 ) ) ( not ( = ?auto_53626 ?auto_53625 ) ) ( not ( = ?auto_53609 ?auto_53625 ) ) ( not ( = ?auto_53614 ?auto_53625 ) ) ( not ( = ?auto_53627 ?auto_53625 ) ) ( not ( = ?auto_53618 ?auto_53625 ) ) ( not ( = ?auto_53636 ?auto_53625 ) ) ( not ( = ?auto_53637 ?auto_53625 ) ) ( not ( = ?auto_53617 ?auto_53625 ) ) ( AVAILABLE ?auto_53630 ) ( IN ?auto_53637 ?auto_53616 ) )
    :subtasks
    ( ( !UNLOAD ?auto_53630 ?auto_53637 ?auto_53616 ?auto_53611 )
      ( MAKE-ON ?auto_53607 ?auto_53608 )
      ( MAKE-ON-VERIFY ?auto_53607 ?auto_53608 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53638 - SURFACE
      ?auto_53639 - SURFACE
    )
    :vars
    (
      ?auto_53661 - HOIST
      ?auto_53644 - PLACE
      ?auto_53647 - PLACE
      ?auto_53659 - HOIST
      ?auto_53640 - SURFACE
      ?auto_53662 - SURFACE
      ?auto_53660 - PLACE
      ?auto_53665 - HOIST
      ?auto_53663 - SURFACE
      ?auto_53654 - SURFACE
      ?auto_53650 - PLACE
      ?auto_53646 - HOIST
      ?auto_53664 - SURFACE
      ?auto_53657 - SURFACE
      ?auto_53641 - SURFACE
      ?auto_53652 - SURFACE
      ?auto_53645 - PLACE
      ?auto_53648 - HOIST
      ?auto_53658 - SURFACE
      ?auto_53653 - SURFACE
      ?auto_53651 - PLACE
      ?auto_53642 - HOIST
      ?auto_53668 - SURFACE
      ?auto_53649 - SURFACE
      ?auto_53667 - PLACE
      ?auto_53666 - HOIST
      ?auto_53655 - SURFACE
      ?auto_53656 - SURFACE
      ?auto_53643 - TRUCK
      ?auto_53669 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53661 ?auto_53644 ) ( IS-CRATE ?auto_53638 ) ( not ( = ?auto_53638 ?auto_53639 ) ) ( not ( = ?auto_53647 ?auto_53644 ) ) ( HOIST-AT ?auto_53659 ?auto_53647 ) ( not ( = ?auto_53661 ?auto_53659 ) ) ( SURFACE-AT ?auto_53638 ?auto_53647 ) ( ON ?auto_53638 ?auto_53640 ) ( CLEAR ?auto_53638 ) ( not ( = ?auto_53638 ?auto_53640 ) ) ( not ( = ?auto_53639 ?auto_53640 ) ) ( IS-CRATE ?auto_53639 ) ( not ( = ?auto_53638 ?auto_53662 ) ) ( not ( = ?auto_53639 ?auto_53662 ) ) ( not ( = ?auto_53640 ?auto_53662 ) ) ( not ( = ?auto_53660 ?auto_53644 ) ) ( not ( = ?auto_53647 ?auto_53660 ) ) ( HOIST-AT ?auto_53665 ?auto_53660 ) ( not ( = ?auto_53661 ?auto_53665 ) ) ( not ( = ?auto_53659 ?auto_53665 ) ) ( AVAILABLE ?auto_53665 ) ( SURFACE-AT ?auto_53639 ?auto_53660 ) ( ON ?auto_53639 ?auto_53663 ) ( CLEAR ?auto_53639 ) ( not ( = ?auto_53638 ?auto_53663 ) ) ( not ( = ?auto_53639 ?auto_53663 ) ) ( not ( = ?auto_53640 ?auto_53663 ) ) ( not ( = ?auto_53662 ?auto_53663 ) ) ( IS-CRATE ?auto_53662 ) ( not ( = ?auto_53638 ?auto_53654 ) ) ( not ( = ?auto_53639 ?auto_53654 ) ) ( not ( = ?auto_53640 ?auto_53654 ) ) ( not ( = ?auto_53662 ?auto_53654 ) ) ( not ( = ?auto_53663 ?auto_53654 ) ) ( not ( = ?auto_53650 ?auto_53644 ) ) ( not ( = ?auto_53647 ?auto_53650 ) ) ( not ( = ?auto_53660 ?auto_53650 ) ) ( HOIST-AT ?auto_53646 ?auto_53650 ) ( not ( = ?auto_53661 ?auto_53646 ) ) ( not ( = ?auto_53659 ?auto_53646 ) ) ( not ( = ?auto_53665 ?auto_53646 ) ) ( AVAILABLE ?auto_53646 ) ( SURFACE-AT ?auto_53662 ?auto_53650 ) ( ON ?auto_53662 ?auto_53664 ) ( CLEAR ?auto_53662 ) ( not ( = ?auto_53638 ?auto_53664 ) ) ( not ( = ?auto_53639 ?auto_53664 ) ) ( not ( = ?auto_53640 ?auto_53664 ) ) ( not ( = ?auto_53662 ?auto_53664 ) ) ( not ( = ?auto_53663 ?auto_53664 ) ) ( not ( = ?auto_53654 ?auto_53664 ) ) ( IS-CRATE ?auto_53654 ) ( not ( = ?auto_53638 ?auto_53657 ) ) ( not ( = ?auto_53639 ?auto_53657 ) ) ( not ( = ?auto_53640 ?auto_53657 ) ) ( not ( = ?auto_53662 ?auto_53657 ) ) ( not ( = ?auto_53663 ?auto_53657 ) ) ( not ( = ?auto_53654 ?auto_53657 ) ) ( not ( = ?auto_53664 ?auto_53657 ) ) ( AVAILABLE ?auto_53659 ) ( SURFACE-AT ?auto_53654 ?auto_53647 ) ( ON ?auto_53654 ?auto_53641 ) ( CLEAR ?auto_53654 ) ( not ( = ?auto_53638 ?auto_53641 ) ) ( not ( = ?auto_53639 ?auto_53641 ) ) ( not ( = ?auto_53640 ?auto_53641 ) ) ( not ( = ?auto_53662 ?auto_53641 ) ) ( not ( = ?auto_53663 ?auto_53641 ) ) ( not ( = ?auto_53654 ?auto_53641 ) ) ( not ( = ?auto_53664 ?auto_53641 ) ) ( not ( = ?auto_53657 ?auto_53641 ) ) ( IS-CRATE ?auto_53657 ) ( not ( = ?auto_53638 ?auto_53652 ) ) ( not ( = ?auto_53639 ?auto_53652 ) ) ( not ( = ?auto_53640 ?auto_53652 ) ) ( not ( = ?auto_53662 ?auto_53652 ) ) ( not ( = ?auto_53663 ?auto_53652 ) ) ( not ( = ?auto_53654 ?auto_53652 ) ) ( not ( = ?auto_53664 ?auto_53652 ) ) ( not ( = ?auto_53657 ?auto_53652 ) ) ( not ( = ?auto_53641 ?auto_53652 ) ) ( not ( = ?auto_53645 ?auto_53644 ) ) ( not ( = ?auto_53647 ?auto_53645 ) ) ( not ( = ?auto_53660 ?auto_53645 ) ) ( not ( = ?auto_53650 ?auto_53645 ) ) ( HOIST-AT ?auto_53648 ?auto_53645 ) ( not ( = ?auto_53661 ?auto_53648 ) ) ( not ( = ?auto_53659 ?auto_53648 ) ) ( not ( = ?auto_53665 ?auto_53648 ) ) ( not ( = ?auto_53646 ?auto_53648 ) ) ( AVAILABLE ?auto_53648 ) ( SURFACE-AT ?auto_53657 ?auto_53645 ) ( ON ?auto_53657 ?auto_53658 ) ( CLEAR ?auto_53657 ) ( not ( = ?auto_53638 ?auto_53658 ) ) ( not ( = ?auto_53639 ?auto_53658 ) ) ( not ( = ?auto_53640 ?auto_53658 ) ) ( not ( = ?auto_53662 ?auto_53658 ) ) ( not ( = ?auto_53663 ?auto_53658 ) ) ( not ( = ?auto_53654 ?auto_53658 ) ) ( not ( = ?auto_53664 ?auto_53658 ) ) ( not ( = ?auto_53657 ?auto_53658 ) ) ( not ( = ?auto_53641 ?auto_53658 ) ) ( not ( = ?auto_53652 ?auto_53658 ) ) ( IS-CRATE ?auto_53652 ) ( not ( = ?auto_53638 ?auto_53653 ) ) ( not ( = ?auto_53639 ?auto_53653 ) ) ( not ( = ?auto_53640 ?auto_53653 ) ) ( not ( = ?auto_53662 ?auto_53653 ) ) ( not ( = ?auto_53663 ?auto_53653 ) ) ( not ( = ?auto_53654 ?auto_53653 ) ) ( not ( = ?auto_53664 ?auto_53653 ) ) ( not ( = ?auto_53657 ?auto_53653 ) ) ( not ( = ?auto_53641 ?auto_53653 ) ) ( not ( = ?auto_53652 ?auto_53653 ) ) ( not ( = ?auto_53658 ?auto_53653 ) ) ( not ( = ?auto_53651 ?auto_53644 ) ) ( not ( = ?auto_53647 ?auto_53651 ) ) ( not ( = ?auto_53660 ?auto_53651 ) ) ( not ( = ?auto_53650 ?auto_53651 ) ) ( not ( = ?auto_53645 ?auto_53651 ) ) ( HOIST-AT ?auto_53642 ?auto_53651 ) ( not ( = ?auto_53661 ?auto_53642 ) ) ( not ( = ?auto_53659 ?auto_53642 ) ) ( not ( = ?auto_53665 ?auto_53642 ) ) ( not ( = ?auto_53646 ?auto_53642 ) ) ( not ( = ?auto_53648 ?auto_53642 ) ) ( AVAILABLE ?auto_53642 ) ( SURFACE-AT ?auto_53652 ?auto_53651 ) ( ON ?auto_53652 ?auto_53668 ) ( CLEAR ?auto_53652 ) ( not ( = ?auto_53638 ?auto_53668 ) ) ( not ( = ?auto_53639 ?auto_53668 ) ) ( not ( = ?auto_53640 ?auto_53668 ) ) ( not ( = ?auto_53662 ?auto_53668 ) ) ( not ( = ?auto_53663 ?auto_53668 ) ) ( not ( = ?auto_53654 ?auto_53668 ) ) ( not ( = ?auto_53664 ?auto_53668 ) ) ( not ( = ?auto_53657 ?auto_53668 ) ) ( not ( = ?auto_53641 ?auto_53668 ) ) ( not ( = ?auto_53652 ?auto_53668 ) ) ( not ( = ?auto_53658 ?auto_53668 ) ) ( not ( = ?auto_53653 ?auto_53668 ) ) ( IS-CRATE ?auto_53653 ) ( not ( = ?auto_53638 ?auto_53649 ) ) ( not ( = ?auto_53639 ?auto_53649 ) ) ( not ( = ?auto_53640 ?auto_53649 ) ) ( not ( = ?auto_53662 ?auto_53649 ) ) ( not ( = ?auto_53663 ?auto_53649 ) ) ( not ( = ?auto_53654 ?auto_53649 ) ) ( not ( = ?auto_53664 ?auto_53649 ) ) ( not ( = ?auto_53657 ?auto_53649 ) ) ( not ( = ?auto_53641 ?auto_53649 ) ) ( not ( = ?auto_53652 ?auto_53649 ) ) ( not ( = ?auto_53658 ?auto_53649 ) ) ( not ( = ?auto_53653 ?auto_53649 ) ) ( not ( = ?auto_53668 ?auto_53649 ) ) ( not ( = ?auto_53667 ?auto_53644 ) ) ( not ( = ?auto_53647 ?auto_53667 ) ) ( not ( = ?auto_53660 ?auto_53667 ) ) ( not ( = ?auto_53650 ?auto_53667 ) ) ( not ( = ?auto_53645 ?auto_53667 ) ) ( not ( = ?auto_53651 ?auto_53667 ) ) ( HOIST-AT ?auto_53666 ?auto_53667 ) ( not ( = ?auto_53661 ?auto_53666 ) ) ( not ( = ?auto_53659 ?auto_53666 ) ) ( not ( = ?auto_53665 ?auto_53666 ) ) ( not ( = ?auto_53646 ?auto_53666 ) ) ( not ( = ?auto_53648 ?auto_53666 ) ) ( not ( = ?auto_53642 ?auto_53666 ) ) ( AVAILABLE ?auto_53666 ) ( SURFACE-AT ?auto_53653 ?auto_53667 ) ( ON ?auto_53653 ?auto_53655 ) ( CLEAR ?auto_53653 ) ( not ( = ?auto_53638 ?auto_53655 ) ) ( not ( = ?auto_53639 ?auto_53655 ) ) ( not ( = ?auto_53640 ?auto_53655 ) ) ( not ( = ?auto_53662 ?auto_53655 ) ) ( not ( = ?auto_53663 ?auto_53655 ) ) ( not ( = ?auto_53654 ?auto_53655 ) ) ( not ( = ?auto_53664 ?auto_53655 ) ) ( not ( = ?auto_53657 ?auto_53655 ) ) ( not ( = ?auto_53641 ?auto_53655 ) ) ( not ( = ?auto_53652 ?auto_53655 ) ) ( not ( = ?auto_53658 ?auto_53655 ) ) ( not ( = ?auto_53653 ?auto_53655 ) ) ( not ( = ?auto_53668 ?auto_53655 ) ) ( not ( = ?auto_53649 ?auto_53655 ) ) ( SURFACE-AT ?auto_53656 ?auto_53644 ) ( CLEAR ?auto_53656 ) ( IS-CRATE ?auto_53649 ) ( not ( = ?auto_53638 ?auto_53656 ) ) ( not ( = ?auto_53639 ?auto_53656 ) ) ( not ( = ?auto_53640 ?auto_53656 ) ) ( not ( = ?auto_53662 ?auto_53656 ) ) ( not ( = ?auto_53663 ?auto_53656 ) ) ( not ( = ?auto_53654 ?auto_53656 ) ) ( not ( = ?auto_53664 ?auto_53656 ) ) ( not ( = ?auto_53657 ?auto_53656 ) ) ( not ( = ?auto_53641 ?auto_53656 ) ) ( not ( = ?auto_53652 ?auto_53656 ) ) ( not ( = ?auto_53658 ?auto_53656 ) ) ( not ( = ?auto_53653 ?auto_53656 ) ) ( not ( = ?auto_53668 ?auto_53656 ) ) ( not ( = ?auto_53649 ?auto_53656 ) ) ( not ( = ?auto_53655 ?auto_53656 ) ) ( AVAILABLE ?auto_53661 ) ( IN ?auto_53649 ?auto_53643 ) ( TRUCK-AT ?auto_53643 ?auto_53669 ) ( not ( = ?auto_53669 ?auto_53644 ) ) ( not ( = ?auto_53647 ?auto_53669 ) ) ( not ( = ?auto_53660 ?auto_53669 ) ) ( not ( = ?auto_53650 ?auto_53669 ) ) ( not ( = ?auto_53645 ?auto_53669 ) ) ( not ( = ?auto_53651 ?auto_53669 ) ) ( not ( = ?auto_53667 ?auto_53669 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_53643 ?auto_53669 ?auto_53644 )
      ( MAKE-ON ?auto_53638 ?auto_53639 )
      ( MAKE-ON-VERIFY ?auto_53638 ?auto_53639 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53670 - SURFACE
      ?auto_53671 - SURFACE
    )
    :vars
    (
      ?auto_53691 - HOIST
      ?auto_53682 - PLACE
      ?auto_53678 - PLACE
      ?auto_53675 - HOIST
      ?auto_53689 - SURFACE
      ?auto_53692 - SURFACE
      ?auto_53690 - PLACE
      ?auto_53676 - HOIST
      ?auto_53699 - SURFACE
      ?auto_53685 - SURFACE
      ?auto_53684 - PLACE
      ?auto_53694 - HOIST
      ?auto_53696 - SURFACE
      ?auto_53673 - SURFACE
      ?auto_53680 - SURFACE
      ?auto_53686 - SURFACE
      ?auto_53695 - PLACE
      ?auto_53688 - HOIST
      ?auto_53674 - SURFACE
      ?auto_53701 - SURFACE
      ?auto_53683 - PLACE
      ?auto_53679 - HOIST
      ?auto_53698 - SURFACE
      ?auto_53697 - SURFACE
      ?auto_53700 - PLACE
      ?auto_53677 - HOIST
      ?auto_53693 - SURFACE
      ?auto_53672 - SURFACE
      ?auto_53681 - TRUCK
      ?auto_53687 - PLACE
      ?auto_53702 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_53691 ?auto_53682 ) ( IS-CRATE ?auto_53670 ) ( not ( = ?auto_53670 ?auto_53671 ) ) ( not ( = ?auto_53678 ?auto_53682 ) ) ( HOIST-AT ?auto_53675 ?auto_53678 ) ( not ( = ?auto_53691 ?auto_53675 ) ) ( SURFACE-AT ?auto_53670 ?auto_53678 ) ( ON ?auto_53670 ?auto_53689 ) ( CLEAR ?auto_53670 ) ( not ( = ?auto_53670 ?auto_53689 ) ) ( not ( = ?auto_53671 ?auto_53689 ) ) ( IS-CRATE ?auto_53671 ) ( not ( = ?auto_53670 ?auto_53692 ) ) ( not ( = ?auto_53671 ?auto_53692 ) ) ( not ( = ?auto_53689 ?auto_53692 ) ) ( not ( = ?auto_53690 ?auto_53682 ) ) ( not ( = ?auto_53678 ?auto_53690 ) ) ( HOIST-AT ?auto_53676 ?auto_53690 ) ( not ( = ?auto_53691 ?auto_53676 ) ) ( not ( = ?auto_53675 ?auto_53676 ) ) ( AVAILABLE ?auto_53676 ) ( SURFACE-AT ?auto_53671 ?auto_53690 ) ( ON ?auto_53671 ?auto_53699 ) ( CLEAR ?auto_53671 ) ( not ( = ?auto_53670 ?auto_53699 ) ) ( not ( = ?auto_53671 ?auto_53699 ) ) ( not ( = ?auto_53689 ?auto_53699 ) ) ( not ( = ?auto_53692 ?auto_53699 ) ) ( IS-CRATE ?auto_53692 ) ( not ( = ?auto_53670 ?auto_53685 ) ) ( not ( = ?auto_53671 ?auto_53685 ) ) ( not ( = ?auto_53689 ?auto_53685 ) ) ( not ( = ?auto_53692 ?auto_53685 ) ) ( not ( = ?auto_53699 ?auto_53685 ) ) ( not ( = ?auto_53684 ?auto_53682 ) ) ( not ( = ?auto_53678 ?auto_53684 ) ) ( not ( = ?auto_53690 ?auto_53684 ) ) ( HOIST-AT ?auto_53694 ?auto_53684 ) ( not ( = ?auto_53691 ?auto_53694 ) ) ( not ( = ?auto_53675 ?auto_53694 ) ) ( not ( = ?auto_53676 ?auto_53694 ) ) ( AVAILABLE ?auto_53694 ) ( SURFACE-AT ?auto_53692 ?auto_53684 ) ( ON ?auto_53692 ?auto_53696 ) ( CLEAR ?auto_53692 ) ( not ( = ?auto_53670 ?auto_53696 ) ) ( not ( = ?auto_53671 ?auto_53696 ) ) ( not ( = ?auto_53689 ?auto_53696 ) ) ( not ( = ?auto_53692 ?auto_53696 ) ) ( not ( = ?auto_53699 ?auto_53696 ) ) ( not ( = ?auto_53685 ?auto_53696 ) ) ( IS-CRATE ?auto_53685 ) ( not ( = ?auto_53670 ?auto_53673 ) ) ( not ( = ?auto_53671 ?auto_53673 ) ) ( not ( = ?auto_53689 ?auto_53673 ) ) ( not ( = ?auto_53692 ?auto_53673 ) ) ( not ( = ?auto_53699 ?auto_53673 ) ) ( not ( = ?auto_53685 ?auto_53673 ) ) ( not ( = ?auto_53696 ?auto_53673 ) ) ( AVAILABLE ?auto_53675 ) ( SURFACE-AT ?auto_53685 ?auto_53678 ) ( ON ?auto_53685 ?auto_53680 ) ( CLEAR ?auto_53685 ) ( not ( = ?auto_53670 ?auto_53680 ) ) ( not ( = ?auto_53671 ?auto_53680 ) ) ( not ( = ?auto_53689 ?auto_53680 ) ) ( not ( = ?auto_53692 ?auto_53680 ) ) ( not ( = ?auto_53699 ?auto_53680 ) ) ( not ( = ?auto_53685 ?auto_53680 ) ) ( not ( = ?auto_53696 ?auto_53680 ) ) ( not ( = ?auto_53673 ?auto_53680 ) ) ( IS-CRATE ?auto_53673 ) ( not ( = ?auto_53670 ?auto_53686 ) ) ( not ( = ?auto_53671 ?auto_53686 ) ) ( not ( = ?auto_53689 ?auto_53686 ) ) ( not ( = ?auto_53692 ?auto_53686 ) ) ( not ( = ?auto_53699 ?auto_53686 ) ) ( not ( = ?auto_53685 ?auto_53686 ) ) ( not ( = ?auto_53696 ?auto_53686 ) ) ( not ( = ?auto_53673 ?auto_53686 ) ) ( not ( = ?auto_53680 ?auto_53686 ) ) ( not ( = ?auto_53695 ?auto_53682 ) ) ( not ( = ?auto_53678 ?auto_53695 ) ) ( not ( = ?auto_53690 ?auto_53695 ) ) ( not ( = ?auto_53684 ?auto_53695 ) ) ( HOIST-AT ?auto_53688 ?auto_53695 ) ( not ( = ?auto_53691 ?auto_53688 ) ) ( not ( = ?auto_53675 ?auto_53688 ) ) ( not ( = ?auto_53676 ?auto_53688 ) ) ( not ( = ?auto_53694 ?auto_53688 ) ) ( AVAILABLE ?auto_53688 ) ( SURFACE-AT ?auto_53673 ?auto_53695 ) ( ON ?auto_53673 ?auto_53674 ) ( CLEAR ?auto_53673 ) ( not ( = ?auto_53670 ?auto_53674 ) ) ( not ( = ?auto_53671 ?auto_53674 ) ) ( not ( = ?auto_53689 ?auto_53674 ) ) ( not ( = ?auto_53692 ?auto_53674 ) ) ( not ( = ?auto_53699 ?auto_53674 ) ) ( not ( = ?auto_53685 ?auto_53674 ) ) ( not ( = ?auto_53696 ?auto_53674 ) ) ( not ( = ?auto_53673 ?auto_53674 ) ) ( not ( = ?auto_53680 ?auto_53674 ) ) ( not ( = ?auto_53686 ?auto_53674 ) ) ( IS-CRATE ?auto_53686 ) ( not ( = ?auto_53670 ?auto_53701 ) ) ( not ( = ?auto_53671 ?auto_53701 ) ) ( not ( = ?auto_53689 ?auto_53701 ) ) ( not ( = ?auto_53692 ?auto_53701 ) ) ( not ( = ?auto_53699 ?auto_53701 ) ) ( not ( = ?auto_53685 ?auto_53701 ) ) ( not ( = ?auto_53696 ?auto_53701 ) ) ( not ( = ?auto_53673 ?auto_53701 ) ) ( not ( = ?auto_53680 ?auto_53701 ) ) ( not ( = ?auto_53686 ?auto_53701 ) ) ( not ( = ?auto_53674 ?auto_53701 ) ) ( not ( = ?auto_53683 ?auto_53682 ) ) ( not ( = ?auto_53678 ?auto_53683 ) ) ( not ( = ?auto_53690 ?auto_53683 ) ) ( not ( = ?auto_53684 ?auto_53683 ) ) ( not ( = ?auto_53695 ?auto_53683 ) ) ( HOIST-AT ?auto_53679 ?auto_53683 ) ( not ( = ?auto_53691 ?auto_53679 ) ) ( not ( = ?auto_53675 ?auto_53679 ) ) ( not ( = ?auto_53676 ?auto_53679 ) ) ( not ( = ?auto_53694 ?auto_53679 ) ) ( not ( = ?auto_53688 ?auto_53679 ) ) ( AVAILABLE ?auto_53679 ) ( SURFACE-AT ?auto_53686 ?auto_53683 ) ( ON ?auto_53686 ?auto_53698 ) ( CLEAR ?auto_53686 ) ( not ( = ?auto_53670 ?auto_53698 ) ) ( not ( = ?auto_53671 ?auto_53698 ) ) ( not ( = ?auto_53689 ?auto_53698 ) ) ( not ( = ?auto_53692 ?auto_53698 ) ) ( not ( = ?auto_53699 ?auto_53698 ) ) ( not ( = ?auto_53685 ?auto_53698 ) ) ( not ( = ?auto_53696 ?auto_53698 ) ) ( not ( = ?auto_53673 ?auto_53698 ) ) ( not ( = ?auto_53680 ?auto_53698 ) ) ( not ( = ?auto_53686 ?auto_53698 ) ) ( not ( = ?auto_53674 ?auto_53698 ) ) ( not ( = ?auto_53701 ?auto_53698 ) ) ( IS-CRATE ?auto_53701 ) ( not ( = ?auto_53670 ?auto_53697 ) ) ( not ( = ?auto_53671 ?auto_53697 ) ) ( not ( = ?auto_53689 ?auto_53697 ) ) ( not ( = ?auto_53692 ?auto_53697 ) ) ( not ( = ?auto_53699 ?auto_53697 ) ) ( not ( = ?auto_53685 ?auto_53697 ) ) ( not ( = ?auto_53696 ?auto_53697 ) ) ( not ( = ?auto_53673 ?auto_53697 ) ) ( not ( = ?auto_53680 ?auto_53697 ) ) ( not ( = ?auto_53686 ?auto_53697 ) ) ( not ( = ?auto_53674 ?auto_53697 ) ) ( not ( = ?auto_53701 ?auto_53697 ) ) ( not ( = ?auto_53698 ?auto_53697 ) ) ( not ( = ?auto_53700 ?auto_53682 ) ) ( not ( = ?auto_53678 ?auto_53700 ) ) ( not ( = ?auto_53690 ?auto_53700 ) ) ( not ( = ?auto_53684 ?auto_53700 ) ) ( not ( = ?auto_53695 ?auto_53700 ) ) ( not ( = ?auto_53683 ?auto_53700 ) ) ( HOIST-AT ?auto_53677 ?auto_53700 ) ( not ( = ?auto_53691 ?auto_53677 ) ) ( not ( = ?auto_53675 ?auto_53677 ) ) ( not ( = ?auto_53676 ?auto_53677 ) ) ( not ( = ?auto_53694 ?auto_53677 ) ) ( not ( = ?auto_53688 ?auto_53677 ) ) ( not ( = ?auto_53679 ?auto_53677 ) ) ( AVAILABLE ?auto_53677 ) ( SURFACE-AT ?auto_53701 ?auto_53700 ) ( ON ?auto_53701 ?auto_53693 ) ( CLEAR ?auto_53701 ) ( not ( = ?auto_53670 ?auto_53693 ) ) ( not ( = ?auto_53671 ?auto_53693 ) ) ( not ( = ?auto_53689 ?auto_53693 ) ) ( not ( = ?auto_53692 ?auto_53693 ) ) ( not ( = ?auto_53699 ?auto_53693 ) ) ( not ( = ?auto_53685 ?auto_53693 ) ) ( not ( = ?auto_53696 ?auto_53693 ) ) ( not ( = ?auto_53673 ?auto_53693 ) ) ( not ( = ?auto_53680 ?auto_53693 ) ) ( not ( = ?auto_53686 ?auto_53693 ) ) ( not ( = ?auto_53674 ?auto_53693 ) ) ( not ( = ?auto_53701 ?auto_53693 ) ) ( not ( = ?auto_53698 ?auto_53693 ) ) ( not ( = ?auto_53697 ?auto_53693 ) ) ( SURFACE-AT ?auto_53672 ?auto_53682 ) ( CLEAR ?auto_53672 ) ( IS-CRATE ?auto_53697 ) ( not ( = ?auto_53670 ?auto_53672 ) ) ( not ( = ?auto_53671 ?auto_53672 ) ) ( not ( = ?auto_53689 ?auto_53672 ) ) ( not ( = ?auto_53692 ?auto_53672 ) ) ( not ( = ?auto_53699 ?auto_53672 ) ) ( not ( = ?auto_53685 ?auto_53672 ) ) ( not ( = ?auto_53696 ?auto_53672 ) ) ( not ( = ?auto_53673 ?auto_53672 ) ) ( not ( = ?auto_53680 ?auto_53672 ) ) ( not ( = ?auto_53686 ?auto_53672 ) ) ( not ( = ?auto_53674 ?auto_53672 ) ) ( not ( = ?auto_53701 ?auto_53672 ) ) ( not ( = ?auto_53698 ?auto_53672 ) ) ( not ( = ?auto_53697 ?auto_53672 ) ) ( not ( = ?auto_53693 ?auto_53672 ) ) ( AVAILABLE ?auto_53691 ) ( TRUCK-AT ?auto_53681 ?auto_53687 ) ( not ( = ?auto_53687 ?auto_53682 ) ) ( not ( = ?auto_53678 ?auto_53687 ) ) ( not ( = ?auto_53690 ?auto_53687 ) ) ( not ( = ?auto_53684 ?auto_53687 ) ) ( not ( = ?auto_53695 ?auto_53687 ) ) ( not ( = ?auto_53683 ?auto_53687 ) ) ( not ( = ?auto_53700 ?auto_53687 ) ) ( HOIST-AT ?auto_53702 ?auto_53687 ) ( LIFTING ?auto_53702 ?auto_53697 ) ( not ( = ?auto_53691 ?auto_53702 ) ) ( not ( = ?auto_53675 ?auto_53702 ) ) ( not ( = ?auto_53676 ?auto_53702 ) ) ( not ( = ?auto_53694 ?auto_53702 ) ) ( not ( = ?auto_53688 ?auto_53702 ) ) ( not ( = ?auto_53679 ?auto_53702 ) ) ( not ( = ?auto_53677 ?auto_53702 ) ) )
    :subtasks
    ( ( !LOAD ?auto_53702 ?auto_53697 ?auto_53681 ?auto_53687 )
      ( MAKE-ON ?auto_53670 ?auto_53671 )
      ( MAKE-ON-VERIFY ?auto_53670 ?auto_53671 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53703 - SURFACE
      ?auto_53704 - SURFACE
    )
    :vars
    (
      ?auto_53727 - HOIST
      ?auto_53734 - PLACE
      ?auto_53708 - PLACE
      ?auto_53721 - HOIST
      ?auto_53725 - SURFACE
      ?auto_53728 - SURFACE
      ?auto_53726 - PLACE
      ?auto_53722 - HOIST
      ?auto_53706 - SURFACE
      ?auto_53709 - SURFACE
      ?auto_53710 - PLACE
      ?auto_53730 - HOIST
      ?auto_53707 - SURFACE
      ?auto_53719 - SURFACE
      ?auto_53732 - SURFACE
      ?auto_53715 - SURFACE
      ?auto_53723 - PLACE
      ?auto_53724 - HOIST
      ?auto_53720 - SURFACE
      ?auto_53712 - SURFACE
      ?auto_53735 - PLACE
      ?auto_53711 - HOIST
      ?auto_53717 - SURFACE
      ?auto_53713 - SURFACE
      ?auto_53705 - PLACE
      ?auto_53718 - HOIST
      ?auto_53729 - SURFACE
      ?auto_53714 - SURFACE
      ?auto_53733 - TRUCK
      ?auto_53731 - PLACE
      ?auto_53716 - HOIST
      ?auto_53736 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53727 ?auto_53734 ) ( IS-CRATE ?auto_53703 ) ( not ( = ?auto_53703 ?auto_53704 ) ) ( not ( = ?auto_53708 ?auto_53734 ) ) ( HOIST-AT ?auto_53721 ?auto_53708 ) ( not ( = ?auto_53727 ?auto_53721 ) ) ( SURFACE-AT ?auto_53703 ?auto_53708 ) ( ON ?auto_53703 ?auto_53725 ) ( CLEAR ?auto_53703 ) ( not ( = ?auto_53703 ?auto_53725 ) ) ( not ( = ?auto_53704 ?auto_53725 ) ) ( IS-CRATE ?auto_53704 ) ( not ( = ?auto_53703 ?auto_53728 ) ) ( not ( = ?auto_53704 ?auto_53728 ) ) ( not ( = ?auto_53725 ?auto_53728 ) ) ( not ( = ?auto_53726 ?auto_53734 ) ) ( not ( = ?auto_53708 ?auto_53726 ) ) ( HOIST-AT ?auto_53722 ?auto_53726 ) ( not ( = ?auto_53727 ?auto_53722 ) ) ( not ( = ?auto_53721 ?auto_53722 ) ) ( AVAILABLE ?auto_53722 ) ( SURFACE-AT ?auto_53704 ?auto_53726 ) ( ON ?auto_53704 ?auto_53706 ) ( CLEAR ?auto_53704 ) ( not ( = ?auto_53703 ?auto_53706 ) ) ( not ( = ?auto_53704 ?auto_53706 ) ) ( not ( = ?auto_53725 ?auto_53706 ) ) ( not ( = ?auto_53728 ?auto_53706 ) ) ( IS-CRATE ?auto_53728 ) ( not ( = ?auto_53703 ?auto_53709 ) ) ( not ( = ?auto_53704 ?auto_53709 ) ) ( not ( = ?auto_53725 ?auto_53709 ) ) ( not ( = ?auto_53728 ?auto_53709 ) ) ( not ( = ?auto_53706 ?auto_53709 ) ) ( not ( = ?auto_53710 ?auto_53734 ) ) ( not ( = ?auto_53708 ?auto_53710 ) ) ( not ( = ?auto_53726 ?auto_53710 ) ) ( HOIST-AT ?auto_53730 ?auto_53710 ) ( not ( = ?auto_53727 ?auto_53730 ) ) ( not ( = ?auto_53721 ?auto_53730 ) ) ( not ( = ?auto_53722 ?auto_53730 ) ) ( AVAILABLE ?auto_53730 ) ( SURFACE-AT ?auto_53728 ?auto_53710 ) ( ON ?auto_53728 ?auto_53707 ) ( CLEAR ?auto_53728 ) ( not ( = ?auto_53703 ?auto_53707 ) ) ( not ( = ?auto_53704 ?auto_53707 ) ) ( not ( = ?auto_53725 ?auto_53707 ) ) ( not ( = ?auto_53728 ?auto_53707 ) ) ( not ( = ?auto_53706 ?auto_53707 ) ) ( not ( = ?auto_53709 ?auto_53707 ) ) ( IS-CRATE ?auto_53709 ) ( not ( = ?auto_53703 ?auto_53719 ) ) ( not ( = ?auto_53704 ?auto_53719 ) ) ( not ( = ?auto_53725 ?auto_53719 ) ) ( not ( = ?auto_53728 ?auto_53719 ) ) ( not ( = ?auto_53706 ?auto_53719 ) ) ( not ( = ?auto_53709 ?auto_53719 ) ) ( not ( = ?auto_53707 ?auto_53719 ) ) ( AVAILABLE ?auto_53721 ) ( SURFACE-AT ?auto_53709 ?auto_53708 ) ( ON ?auto_53709 ?auto_53732 ) ( CLEAR ?auto_53709 ) ( not ( = ?auto_53703 ?auto_53732 ) ) ( not ( = ?auto_53704 ?auto_53732 ) ) ( not ( = ?auto_53725 ?auto_53732 ) ) ( not ( = ?auto_53728 ?auto_53732 ) ) ( not ( = ?auto_53706 ?auto_53732 ) ) ( not ( = ?auto_53709 ?auto_53732 ) ) ( not ( = ?auto_53707 ?auto_53732 ) ) ( not ( = ?auto_53719 ?auto_53732 ) ) ( IS-CRATE ?auto_53719 ) ( not ( = ?auto_53703 ?auto_53715 ) ) ( not ( = ?auto_53704 ?auto_53715 ) ) ( not ( = ?auto_53725 ?auto_53715 ) ) ( not ( = ?auto_53728 ?auto_53715 ) ) ( not ( = ?auto_53706 ?auto_53715 ) ) ( not ( = ?auto_53709 ?auto_53715 ) ) ( not ( = ?auto_53707 ?auto_53715 ) ) ( not ( = ?auto_53719 ?auto_53715 ) ) ( not ( = ?auto_53732 ?auto_53715 ) ) ( not ( = ?auto_53723 ?auto_53734 ) ) ( not ( = ?auto_53708 ?auto_53723 ) ) ( not ( = ?auto_53726 ?auto_53723 ) ) ( not ( = ?auto_53710 ?auto_53723 ) ) ( HOIST-AT ?auto_53724 ?auto_53723 ) ( not ( = ?auto_53727 ?auto_53724 ) ) ( not ( = ?auto_53721 ?auto_53724 ) ) ( not ( = ?auto_53722 ?auto_53724 ) ) ( not ( = ?auto_53730 ?auto_53724 ) ) ( AVAILABLE ?auto_53724 ) ( SURFACE-AT ?auto_53719 ?auto_53723 ) ( ON ?auto_53719 ?auto_53720 ) ( CLEAR ?auto_53719 ) ( not ( = ?auto_53703 ?auto_53720 ) ) ( not ( = ?auto_53704 ?auto_53720 ) ) ( not ( = ?auto_53725 ?auto_53720 ) ) ( not ( = ?auto_53728 ?auto_53720 ) ) ( not ( = ?auto_53706 ?auto_53720 ) ) ( not ( = ?auto_53709 ?auto_53720 ) ) ( not ( = ?auto_53707 ?auto_53720 ) ) ( not ( = ?auto_53719 ?auto_53720 ) ) ( not ( = ?auto_53732 ?auto_53720 ) ) ( not ( = ?auto_53715 ?auto_53720 ) ) ( IS-CRATE ?auto_53715 ) ( not ( = ?auto_53703 ?auto_53712 ) ) ( not ( = ?auto_53704 ?auto_53712 ) ) ( not ( = ?auto_53725 ?auto_53712 ) ) ( not ( = ?auto_53728 ?auto_53712 ) ) ( not ( = ?auto_53706 ?auto_53712 ) ) ( not ( = ?auto_53709 ?auto_53712 ) ) ( not ( = ?auto_53707 ?auto_53712 ) ) ( not ( = ?auto_53719 ?auto_53712 ) ) ( not ( = ?auto_53732 ?auto_53712 ) ) ( not ( = ?auto_53715 ?auto_53712 ) ) ( not ( = ?auto_53720 ?auto_53712 ) ) ( not ( = ?auto_53735 ?auto_53734 ) ) ( not ( = ?auto_53708 ?auto_53735 ) ) ( not ( = ?auto_53726 ?auto_53735 ) ) ( not ( = ?auto_53710 ?auto_53735 ) ) ( not ( = ?auto_53723 ?auto_53735 ) ) ( HOIST-AT ?auto_53711 ?auto_53735 ) ( not ( = ?auto_53727 ?auto_53711 ) ) ( not ( = ?auto_53721 ?auto_53711 ) ) ( not ( = ?auto_53722 ?auto_53711 ) ) ( not ( = ?auto_53730 ?auto_53711 ) ) ( not ( = ?auto_53724 ?auto_53711 ) ) ( AVAILABLE ?auto_53711 ) ( SURFACE-AT ?auto_53715 ?auto_53735 ) ( ON ?auto_53715 ?auto_53717 ) ( CLEAR ?auto_53715 ) ( not ( = ?auto_53703 ?auto_53717 ) ) ( not ( = ?auto_53704 ?auto_53717 ) ) ( not ( = ?auto_53725 ?auto_53717 ) ) ( not ( = ?auto_53728 ?auto_53717 ) ) ( not ( = ?auto_53706 ?auto_53717 ) ) ( not ( = ?auto_53709 ?auto_53717 ) ) ( not ( = ?auto_53707 ?auto_53717 ) ) ( not ( = ?auto_53719 ?auto_53717 ) ) ( not ( = ?auto_53732 ?auto_53717 ) ) ( not ( = ?auto_53715 ?auto_53717 ) ) ( not ( = ?auto_53720 ?auto_53717 ) ) ( not ( = ?auto_53712 ?auto_53717 ) ) ( IS-CRATE ?auto_53712 ) ( not ( = ?auto_53703 ?auto_53713 ) ) ( not ( = ?auto_53704 ?auto_53713 ) ) ( not ( = ?auto_53725 ?auto_53713 ) ) ( not ( = ?auto_53728 ?auto_53713 ) ) ( not ( = ?auto_53706 ?auto_53713 ) ) ( not ( = ?auto_53709 ?auto_53713 ) ) ( not ( = ?auto_53707 ?auto_53713 ) ) ( not ( = ?auto_53719 ?auto_53713 ) ) ( not ( = ?auto_53732 ?auto_53713 ) ) ( not ( = ?auto_53715 ?auto_53713 ) ) ( not ( = ?auto_53720 ?auto_53713 ) ) ( not ( = ?auto_53712 ?auto_53713 ) ) ( not ( = ?auto_53717 ?auto_53713 ) ) ( not ( = ?auto_53705 ?auto_53734 ) ) ( not ( = ?auto_53708 ?auto_53705 ) ) ( not ( = ?auto_53726 ?auto_53705 ) ) ( not ( = ?auto_53710 ?auto_53705 ) ) ( not ( = ?auto_53723 ?auto_53705 ) ) ( not ( = ?auto_53735 ?auto_53705 ) ) ( HOIST-AT ?auto_53718 ?auto_53705 ) ( not ( = ?auto_53727 ?auto_53718 ) ) ( not ( = ?auto_53721 ?auto_53718 ) ) ( not ( = ?auto_53722 ?auto_53718 ) ) ( not ( = ?auto_53730 ?auto_53718 ) ) ( not ( = ?auto_53724 ?auto_53718 ) ) ( not ( = ?auto_53711 ?auto_53718 ) ) ( AVAILABLE ?auto_53718 ) ( SURFACE-AT ?auto_53712 ?auto_53705 ) ( ON ?auto_53712 ?auto_53729 ) ( CLEAR ?auto_53712 ) ( not ( = ?auto_53703 ?auto_53729 ) ) ( not ( = ?auto_53704 ?auto_53729 ) ) ( not ( = ?auto_53725 ?auto_53729 ) ) ( not ( = ?auto_53728 ?auto_53729 ) ) ( not ( = ?auto_53706 ?auto_53729 ) ) ( not ( = ?auto_53709 ?auto_53729 ) ) ( not ( = ?auto_53707 ?auto_53729 ) ) ( not ( = ?auto_53719 ?auto_53729 ) ) ( not ( = ?auto_53732 ?auto_53729 ) ) ( not ( = ?auto_53715 ?auto_53729 ) ) ( not ( = ?auto_53720 ?auto_53729 ) ) ( not ( = ?auto_53712 ?auto_53729 ) ) ( not ( = ?auto_53717 ?auto_53729 ) ) ( not ( = ?auto_53713 ?auto_53729 ) ) ( SURFACE-AT ?auto_53714 ?auto_53734 ) ( CLEAR ?auto_53714 ) ( IS-CRATE ?auto_53713 ) ( not ( = ?auto_53703 ?auto_53714 ) ) ( not ( = ?auto_53704 ?auto_53714 ) ) ( not ( = ?auto_53725 ?auto_53714 ) ) ( not ( = ?auto_53728 ?auto_53714 ) ) ( not ( = ?auto_53706 ?auto_53714 ) ) ( not ( = ?auto_53709 ?auto_53714 ) ) ( not ( = ?auto_53707 ?auto_53714 ) ) ( not ( = ?auto_53719 ?auto_53714 ) ) ( not ( = ?auto_53732 ?auto_53714 ) ) ( not ( = ?auto_53715 ?auto_53714 ) ) ( not ( = ?auto_53720 ?auto_53714 ) ) ( not ( = ?auto_53712 ?auto_53714 ) ) ( not ( = ?auto_53717 ?auto_53714 ) ) ( not ( = ?auto_53713 ?auto_53714 ) ) ( not ( = ?auto_53729 ?auto_53714 ) ) ( AVAILABLE ?auto_53727 ) ( TRUCK-AT ?auto_53733 ?auto_53731 ) ( not ( = ?auto_53731 ?auto_53734 ) ) ( not ( = ?auto_53708 ?auto_53731 ) ) ( not ( = ?auto_53726 ?auto_53731 ) ) ( not ( = ?auto_53710 ?auto_53731 ) ) ( not ( = ?auto_53723 ?auto_53731 ) ) ( not ( = ?auto_53735 ?auto_53731 ) ) ( not ( = ?auto_53705 ?auto_53731 ) ) ( HOIST-AT ?auto_53716 ?auto_53731 ) ( not ( = ?auto_53727 ?auto_53716 ) ) ( not ( = ?auto_53721 ?auto_53716 ) ) ( not ( = ?auto_53722 ?auto_53716 ) ) ( not ( = ?auto_53730 ?auto_53716 ) ) ( not ( = ?auto_53724 ?auto_53716 ) ) ( not ( = ?auto_53711 ?auto_53716 ) ) ( not ( = ?auto_53718 ?auto_53716 ) ) ( AVAILABLE ?auto_53716 ) ( SURFACE-AT ?auto_53713 ?auto_53731 ) ( ON ?auto_53713 ?auto_53736 ) ( CLEAR ?auto_53713 ) ( not ( = ?auto_53703 ?auto_53736 ) ) ( not ( = ?auto_53704 ?auto_53736 ) ) ( not ( = ?auto_53725 ?auto_53736 ) ) ( not ( = ?auto_53728 ?auto_53736 ) ) ( not ( = ?auto_53706 ?auto_53736 ) ) ( not ( = ?auto_53709 ?auto_53736 ) ) ( not ( = ?auto_53707 ?auto_53736 ) ) ( not ( = ?auto_53719 ?auto_53736 ) ) ( not ( = ?auto_53732 ?auto_53736 ) ) ( not ( = ?auto_53715 ?auto_53736 ) ) ( not ( = ?auto_53720 ?auto_53736 ) ) ( not ( = ?auto_53712 ?auto_53736 ) ) ( not ( = ?auto_53717 ?auto_53736 ) ) ( not ( = ?auto_53713 ?auto_53736 ) ) ( not ( = ?auto_53729 ?auto_53736 ) ) ( not ( = ?auto_53714 ?auto_53736 ) ) )
    :subtasks
    ( ( !LIFT ?auto_53716 ?auto_53713 ?auto_53736 ?auto_53731 )
      ( MAKE-ON ?auto_53703 ?auto_53704 )
      ( MAKE-ON-VERIFY ?auto_53703 ?auto_53704 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53737 - SURFACE
      ?auto_53738 - SURFACE
    )
    :vars
    (
      ?auto_53760 - HOIST
      ?auto_53757 - PLACE
      ?auto_53744 - PLACE
      ?auto_53762 - HOIST
      ?auto_53750 - SURFACE
      ?auto_53763 - SURFACE
      ?auto_53761 - PLACE
      ?auto_53742 - HOIST
      ?auto_53751 - SURFACE
      ?auto_53745 - SURFACE
      ?auto_53753 - PLACE
      ?auto_53739 - HOIST
      ?auto_53752 - SURFACE
      ?auto_53746 - SURFACE
      ?auto_53755 - SURFACE
      ?auto_53754 - SURFACE
      ?auto_53743 - PLACE
      ?auto_53749 - HOIST
      ?auto_53740 - SURFACE
      ?auto_53765 - SURFACE
      ?auto_53758 - PLACE
      ?auto_53747 - HOIST
      ?auto_53766 - SURFACE
      ?auto_53767 - SURFACE
      ?auto_53741 - PLACE
      ?auto_53764 - HOIST
      ?auto_53768 - SURFACE
      ?auto_53770 - SURFACE
      ?auto_53769 - PLACE
      ?auto_53759 - HOIST
      ?auto_53748 - SURFACE
      ?auto_53756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53760 ?auto_53757 ) ( IS-CRATE ?auto_53737 ) ( not ( = ?auto_53737 ?auto_53738 ) ) ( not ( = ?auto_53744 ?auto_53757 ) ) ( HOIST-AT ?auto_53762 ?auto_53744 ) ( not ( = ?auto_53760 ?auto_53762 ) ) ( SURFACE-AT ?auto_53737 ?auto_53744 ) ( ON ?auto_53737 ?auto_53750 ) ( CLEAR ?auto_53737 ) ( not ( = ?auto_53737 ?auto_53750 ) ) ( not ( = ?auto_53738 ?auto_53750 ) ) ( IS-CRATE ?auto_53738 ) ( not ( = ?auto_53737 ?auto_53763 ) ) ( not ( = ?auto_53738 ?auto_53763 ) ) ( not ( = ?auto_53750 ?auto_53763 ) ) ( not ( = ?auto_53761 ?auto_53757 ) ) ( not ( = ?auto_53744 ?auto_53761 ) ) ( HOIST-AT ?auto_53742 ?auto_53761 ) ( not ( = ?auto_53760 ?auto_53742 ) ) ( not ( = ?auto_53762 ?auto_53742 ) ) ( AVAILABLE ?auto_53742 ) ( SURFACE-AT ?auto_53738 ?auto_53761 ) ( ON ?auto_53738 ?auto_53751 ) ( CLEAR ?auto_53738 ) ( not ( = ?auto_53737 ?auto_53751 ) ) ( not ( = ?auto_53738 ?auto_53751 ) ) ( not ( = ?auto_53750 ?auto_53751 ) ) ( not ( = ?auto_53763 ?auto_53751 ) ) ( IS-CRATE ?auto_53763 ) ( not ( = ?auto_53737 ?auto_53745 ) ) ( not ( = ?auto_53738 ?auto_53745 ) ) ( not ( = ?auto_53750 ?auto_53745 ) ) ( not ( = ?auto_53763 ?auto_53745 ) ) ( not ( = ?auto_53751 ?auto_53745 ) ) ( not ( = ?auto_53753 ?auto_53757 ) ) ( not ( = ?auto_53744 ?auto_53753 ) ) ( not ( = ?auto_53761 ?auto_53753 ) ) ( HOIST-AT ?auto_53739 ?auto_53753 ) ( not ( = ?auto_53760 ?auto_53739 ) ) ( not ( = ?auto_53762 ?auto_53739 ) ) ( not ( = ?auto_53742 ?auto_53739 ) ) ( AVAILABLE ?auto_53739 ) ( SURFACE-AT ?auto_53763 ?auto_53753 ) ( ON ?auto_53763 ?auto_53752 ) ( CLEAR ?auto_53763 ) ( not ( = ?auto_53737 ?auto_53752 ) ) ( not ( = ?auto_53738 ?auto_53752 ) ) ( not ( = ?auto_53750 ?auto_53752 ) ) ( not ( = ?auto_53763 ?auto_53752 ) ) ( not ( = ?auto_53751 ?auto_53752 ) ) ( not ( = ?auto_53745 ?auto_53752 ) ) ( IS-CRATE ?auto_53745 ) ( not ( = ?auto_53737 ?auto_53746 ) ) ( not ( = ?auto_53738 ?auto_53746 ) ) ( not ( = ?auto_53750 ?auto_53746 ) ) ( not ( = ?auto_53763 ?auto_53746 ) ) ( not ( = ?auto_53751 ?auto_53746 ) ) ( not ( = ?auto_53745 ?auto_53746 ) ) ( not ( = ?auto_53752 ?auto_53746 ) ) ( AVAILABLE ?auto_53762 ) ( SURFACE-AT ?auto_53745 ?auto_53744 ) ( ON ?auto_53745 ?auto_53755 ) ( CLEAR ?auto_53745 ) ( not ( = ?auto_53737 ?auto_53755 ) ) ( not ( = ?auto_53738 ?auto_53755 ) ) ( not ( = ?auto_53750 ?auto_53755 ) ) ( not ( = ?auto_53763 ?auto_53755 ) ) ( not ( = ?auto_53751 ?auto_53755 ) ) ( not ( = ?auto_53745 ?auto_53755 ) ) ( not ( = ?auto_53752 ?auto_53755 ) ) ( not ( = ?auto_53746 ?auto_53755 ) ) ( IS-CRATE ?auto_53746 ) ( not ( = ?auto_53737 ?auto_53754 ) ) ( not ( = ?auto_53738 ?auto_53754 ) ) ( not ( = ?auto_53750 ?auto_53754 ) ) ( not ( = ?auto_53763 ?auto_53754 ) ) ( not ( = ?auto_53751 ?auto_53754 ) ) ( not ( = ?auto_53745 ?auto_53754 ) ) ( not ( = ?auto_53752 ?auto_53754 ) ) ( not ( = ?auto_53746 ?auto_53754 ) ) ( not ( = ?auto_53755 ?auto_53754 ) ) ( not ( = ?auto_53743 ?auto_53757 ) ) ( not ( = ?auto_53744 ?auto_53743 ) ) ( not ( = ?auto_53761 ?auto_53743 ) ) ( not ( = ?auto_53753 ?auto_53743 ) ) ( HOIST-AT ?auto_53749 ?auto_53743 ) ( not ( = ?auto_53760 ?auto_53749 ) ) ( not ( = ?auto_53762 ?auto_53749 ) ) ( not ( = ?auto_53742 ?auto_53749 ) ) ( not ( = ?auto_53739 ?auto_53749 ) ) ( AVAILABLE ?auto_53749 ) ( SURFACE-AT ?auto_53746 ?auto_53743 ) ( ON ?auto_53746 ?auto_53740 ) ( CLEAR ?auto_53746 ) ( not ( = ?auto_53737 ?auto_53740 ) ) ( not ( = ?auto_53738 ?auto_53740 ) ) ( not ( = ?auto_53750 ?auto_53740 ) ) ( not ( = ?auto_53763 ?auto_53740 ) ) ( not ( = ?auto_53751 ?auto_53740 ) ) ( not ( = ?auto_53745 ?auto_53740 ) ) ( not ( = ?auto_53752 ?auto_53740 ) ) ( not ( = ?auto_53746 ?auto_53740 ) ) ( not ( = ?auto_53755 ?auto_53740 ) ) ( not ( = ?auto_53754 ?auto_53740 ) ) ( IS-CRATE ?auto_53754 ) ( not ( = ?auto_53737 ?auto_53765 ) ) ( not ( = ?auto_53738 ?auto_53765 ) ) ( not ( = ?auto_53750 ?auto_53765 ) ) ( not ( = ?auto_53763 ?auto_53765 ) ) ( not ( = ?auto_53751 ?auto_53765 ) ) ( not ( = ?auto_53745 ?auto_53765 ) ) ( not ( = ?auto_53752 ?auto_53765 ) ) ( not ( = ?auto_53746 ?auto_53765 ) ) ( not ( = ?auto_53755 ?auto_53765 ) ) ( not ( = ?auto_53754 ?auto_53765 ) ) ( not ( = ?auto_53740 ?auto_53765 ) ) ( not ( = ?auto_53758 ?auto_53757 ) ) ( not ( = ?auto_53744 ?auto_53758 ) ) ( not ( = ?auto_53761 ?auto_53758 ) ) ( not ( = ?auto_53753 ?auto_53758 ) ) ( not ( = ?auto_53743 ?auto_53758 ) ) ( HOIST-AT ?auto_53747 ?auto_53758 ) ( not ( = ?auto_53760 ?auto_53747 ) ) ( not ( = ?auto_53762 ?auto_53747 ) ) ( not ( = ?auto_53742 ?auto_53747 ) ) ( not ( = ?auto_53739 ?auto_53747 ) ) ( not ( = ?auto_53749 ?auto_53747 ) ) ( AVAILABLE ?auto_53747 ) ( SURFACE-AT ?auto_53754 ?auto_53758 ) ( ON ?auto_53754 ?auto_53766 ) ( CLEAR ?auto_53754 ) ( not ( = ?auto_53737 ?auto_53766 ) ) ( not ( = ?auto_53738 ?auto_53766 ) ) ( not ( = ?auto_53750 ?auto_53766 ) ) ( not ( = ?auto_53763 ?auto_53766 ) ) ( not ( = ?auto_53751 ?auto_53766 ) ) ( not ( = ?auto_53745 ?auto_53766 ) ) ( not ( = ?auto_53752 ?auto_53766 ) ) ( not ( = ?auto_53746 ?auto_53766 ) ) ( not ( = ?auto_53755 ?auto_53766 ) ) ( not ( = ?auto_53754 ?auto_53766 ) ) ( not ( = ?auto_53740 ?auto_53766 ) ) ( not ( = ?auto_53765 ?auto_53766 ) ) ( IS-CRATE ?auto_53765 ) ( not ( = ?auto_53737 ?auto_53767 ) ) ( not ( = ?auto_53738 ?auto_53767 ) ) ( not ( = ?auto_53750 ?auto_53767 ) ) ( not ( = ?auto_53763 ?auto_53767 ) ) ( not ( = ?auto_53751 ?auto_53767 ) ) ( not ( = ?auto_53745 ?auto_53767 ) ) ( not ( = ?auto_53752 ?auto_53767 ) ) ( not ( = ?auto_53746 ?auto_53767 ) ) ( not ( = ?auto_53755 ?auto_53767 ) ) ( not ( = ?auto_53754 ?auto_53767 ) ) ( not ( = ?auto_53740 ?auto_53767 ) ) ( not ( = ?auto_53765 ?auto_53767 ) ) ( not ( = ?auto_53766 ?auto_53767 ) ) ( not ( = ?auto_53741 ?auto_53757 ) ) ( not ( = ?auto_53744 ?auto_53741 ) ) ( not ( = ?auto_53761 ?auto_53741 ) ) ( not ( = ?auto_53753 ?auto_53741 ) ) ( not ( = ?auto_53743 ?auto_53741 ) ) ( not ( = ?auto_53758 ?auto_53741 ) ) ( HOIST-AT ?auto_53764 ?auto_53741 ) ( not ( = ?auto_53760 ?auto_53764 ) ) ( not ( = ?auto_53762 ?auto_53764 ) ) ( not ( = ?auto_53742 ?auto_53764 ) ) ( not ( = ?auto_53739 ?auto_53764 ) ) ( not ( = ?auto_53749 ?auto_53764 ) ) ( not ( = ?auto_53747 ?auto_53764 ) ) ( AVAILABLE ?auto_53764 ) ( SURFACE-AT ?auto_53765 ?auto_53741 ) ( ON ?auto_53765 ?auto_53768 ) ( CLEAR ?auto_53765 ) ( not ( = ?auto_53737 ?auto_53768 ) ) ( not ( = ?auto_53738 ?auto_53768 ) ) ( not ( = ?auto_53750 ?auto_53768 ) ) ( not ( = ?auto_53763 ?auto_53768 ) ) ( not ( = ?auto_53751 ?auto_53768 ) ) ( not ( = ?auto_53745 ?auto_53768 ) ) ( not ( = ?auto_53752 ?auto_53768 ) ) ( not ( = ?auto_53746 ?auto_53768 ) ) ( not ( = ?auto_53755 ?auto_53768 ) ) ( not ( = ?auto_53754 ?auto_53768 ) ) ( not ( = ?auto_53740 ?auto_53768 ) ) ( not ( = ?auto_53765 ?auto_53768 ) ) ( not ( = ?auto_53766 ?auto_53768 ) ) ( not ( = ?auto_53767 ?auto_53768 ) ) ( SURFACE-AT ?auto_53770 ?auto_53757 ) ( CLEAR ?auto_53770 ) ( IS-CRATE ?auto_53767 ) ( not ( = ?auto_53737 ?auto_53770 ) ) ( not ( = ?auto_53738 ?auto_53770 ) ) ( not ( = ?auto_53750 ?auto_53770 ) ) ( not ( = ?auto_53763 ?auto_53770 ) ) ( not ( = ?auto_53751 ?auto_53770 ) ) ( not ( = ?auto_53745 ?auto_53770 ) ) ( not ( = ?auto_53752 ?auto_53770 ) ) ( not ( = ?auto_53746 ?auto_53770 ) ) ( not ( = ?auto_53755 ?auto_53770 ) ) ( not ( = ?auto_53754 ?auto_53770 ) ) ( not ( = ?auto_53740 ?auto_53770 ) ) ( not ( = ?auto_53765 ?auto_53770 ) ) ( not ( = ?auto_53766 ?auto_53770 ) ) ( not ( = ?auto_53767 ?auto_53770 ) ) ( not ( = ?auto_53768 ?auto_53770 ) ) ( AVAILABLE ?auto_53760 ) ( not ( = ?auto_53769 ?auto_53757 ) ) ( not ( = ?auto_53744 ?auto_53769 ) ) ( not ( = ?auto_53761 ?auto_53769 ) ) ( not ( = ?auto_53753 ?auto_53769 ) ) ( not ( = ?auto_53743 ?auto_53769 ) ) ( not ( = ?auto_53758 ?auto_53769 ) ) ( not ( = ?auto_53741 ?auto_53769 ) ) ( HOIST-AT ?auto_53759 ?auto_53769 ) ( not ( = ?auto_53760 ?auto_53759 ) ) ( not ( = ?auto_53762 ?auto_53759 ) ) ( not ( = ?auto_53742 ?auto_53759 ) ) ( not ( = ?auto_53739 ?auto_53759 ) ) ( not ( = ?auto_53749 ?auto_53759 ) ) ( not ( = ?auto_53747 ?auto_53759 ) ) ( not ( = ?auto_53764 ?auto_53759 ) ) ( AVAILABLE ?auto_53759 ) ( SURFACE-AT ?auto_53767 ?auto_53769 ) ( ON ?auto_53767 ?auto_53748 ) ( CLEAR ?auto_53767 ) ( not ( = ?auto_53737 ?auto_53748 ) ) ( not ( = ?auto_53738 ?auto_53748 ) ) ( not ( = ?auto_53750 ?auto_53748 ) ) ( not ( = ?auto_53763 ?auto_53748 ) ) ( not ( = ?auto_53751 ?auto_53748 ) ) ( not ( = ?auto_53745 ?auto_53748 ) ) ( not ( = ?auto_53752 ?auto_53748 ) ) ( not ( = ?auto_53746 ?auto_53748 ) ) ( not ( = ?auto_53755 ?auto_53748 ) ) ( not ( = ?auto_53754 ?auto_53748 ) ) ( not ( = ?auto_53740 ?auto_53748 ) ) ( not ( = ?auto_53765 ?auto_53748 ) ) ( not ( = ?auto_53766 ?auto_53748 ) ) ( not ( = ?auto_53767 ?auto_53748 ) ) ( not ( = ?auto_53768 ?auto_53748 ) ) ( not ( = ?auto_53770 ?auto_53748 ) ) ( TRUCK-AT ?auto_53756 ?auto_53757 ) )
    :subtasks
    ( ( !DRIVE ?auto_53756 ?auto_53757 ?auto_53769 )
      ( MAKE-ON ?auto_53737 ?auto_53738 )
      ( MAKE-ON-VERIFY ?auto_53737 ?auto_53738 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53773 - SURFACE
      ?auto_53774 - SURFACE
    )
    :vars
    (
      ?auto_53775 - HOIST
      ?auto_53776 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53775 ?auto_53776 ) ( SURFACE-AT ?auto_53774 ?auto_53776 ) ( CLEAR ?auto_53774 ) ( LIFTING ?auto_53775 ?auto_53773 ) ( IS-CRATE ?auto_53773 ) ( not ( = ?auto_53773 ?auto_53774 ) ) )
    :subtasks
    ( ( !DROP ?auto_53775 ?auto_53773 ?auto_53774 ?auto_53776 )
      ( MAKE-ON-VERIFY ?auto_53773 ?auto_53774 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53777 - SURFACE
      ?auto_53778 - SURFACE
    )
    :vars
    (
      ?auto_53780 - HOIST
      ?auto_53779 - PLACE
      ?auto_53781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53780 ?auto_53779 ) ( SURFACE-AT ?auto_53778 ?auto_53779 ) ( CLEAR ?auto_53778 ) ( IS-CRATE ?auto_53777 ) ( not ( = ?auto_53777 ?auto_53778 ) ) ( TRUCK-AT ?auto_53781 ?auto_53779 ) ( AVAILABLE ?auto_53780 ) ( IN ?auto_53777 ?auto_53781 ) )
    :subtasks
    ( ( !UNLOAD ?auto_53780 ?auto_53777 ?auto_53781 ?auto_53779 )
      ( MAKE-ON ?auto_53777 ?auto_53778 )
      ( MAKE-ON-VERIFY ?auto_53777 ?auto_53778 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53782 - SURFACE
      ?auto_53783 - SURFACE
    )
    :vars
    (
      ?auto_53786 - HOIST
      ?auto_53784 - PLACE
      ?auto_53785 - TRUCK
      ?auto_53787 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53786 ?auto_53784 ) ( SURFACE-AT ?auto_53783 ?auto_53784 ) ( CLEAR ?auto_53783 ) ( IS-CRATE ?auto_53782 ) ( not ( = ?auto_53782 ?auto_53783 ) ) ( AVAILABLE ?auto_53786 ) ( IN ?auto_53782 ?auto_53785 ) ( TRUCK-AT ?auto_53785 ?auto_53787 ) ( not ( = ?auto_53787 ?auto_53784 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_53785 ?auto_53787 ?auto_53784 )
      ( MAKE-ON ?auto_53782 ?auto_53783 )
      ( MAKE-ON-VERIFY ?auto_53782 ?auto_53783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53788 - SURFACE
      ?auto_53789 - SURFACE
    )
    :vars
    (
      ?auto_53792 - HOIST
      ?auto_53790 - PLACE
      ?auto_53793 - TRUCK
      ?auto_53791 - PLACE
      ?auto_53794 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_53792 ?auto_53790 ) ( SURFACE-AT ?auto_53789 ?auto_53790 ) ( CLEAR ?auto_53789 ) ( IS-CRATE ?auto_53788 ) ( not ( = ?auto_53788 ?auto_53789 ) ) ( AVAILABLE ?auto_53792 ) ( TRUCK-AT ?auto_53793 ?auto_53791 ) ( not ( = ?auto_53791 ?auto_53790 ) ) ( HOIST-AT ?auto_53794 ?auto_53791 ) ( LIFTING ?auto_53794 ?auto_53788 ) ( not ( = ?auto_53792 ?auto_53794 ) ) )
    :subtasks
    ( ( !LOAD ?auto_53794 ?auto_53788 ?auto_53793 ?auto_53791 )
      ( MAKE-ON ?auto_53788 ?auto_53789 )
      ( MAKE-ON-VERIFY ?auto_53788 ?auto_53789 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53795 - SURFACE
      ?auto_53796 - SURFACE
    )
    :vars
    (
      ?auto_53799 - HOIST
      ?auto_53800 - PLACE
      ?auto_53798 - TRUCK
      ?auto_53801 - PLACE
      ?auto_53797 - HOIST
      ?auto_53802 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53799 ?auto_53800 ) ( SURFACE-AT ?auto_53796 ?auto_53800 ) ( CLEAR ?auto_53796 ) ( IS-CRATE ?auto_53795 ) ( not ( = ?auto_53795 ?auto_53796 ) ) ( AVAILABLE ?auto_53799 ) ( TRUCK-AT ?auto_53798 ?auto_53801 ) ( not ( = ?auto_53801 ?auto_53800 ) ) ( HOIST-AT ?auto_53797 ?auto_53801 ) ( not ( = ?auto_53799 ?auto_53797 ) ) ( AVAILABLE ?auto_53797 ) ( SURFACE-AT ?auto_53795 ?auto_53801 ) ( ON ?auto_53795 ?auto_53802 ) ( CLEAR ?auto_53795 ) ( not ( = ?auto_53795 ?auto_53802 ) ) ( not ( = ?auto_53796 ?auto_53802 ) ) )
    :subtasks
    ( ( !LIFT ?auto_53797 ?auto_53795 ?auto_53802 ?auto_53801 )
      ( MAKE-ON ?auto_53795 ?auto_53796 )
      ( MAKE-ON-VERIFY ?auto_53795 ?auto_53796 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53803 - SURFACE
      ?auto_53804 - SURFACE
    )
    :vars
    (
      ?auto_53809 - HOIST
      ?auto_53805 - PLACE
      ?auto_53808 - PLACE
      ?auto_53806 - HOIST
      ?auto_53807 - SURFACE
      ?auto_53810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53809 ?auto_53805 ) ( SURFACE-AT ?auto_53804 ?auto_53805 ) ( CLEAR ?auto_53804 ) ( IS-CRATE ?auto_53803 ) ( not ( = ?auto_53803 ?auto_53804 ) ) ( AVAILABLE ?auto_53809 ) ( not ( = ?auto_53808 ?auto_53805 ) ) ( HOIST-AT ?auto_53806 ?auto_53808 ) ( not ( = ?auto_53809 ?auto_53806 ) ) ( AVAILABLE ?auto_53806 ) ( SURFACE-AT ?auto_53803 ?auto_53808 ) ( ON ?auto_53803 ?auto_53807 ) ( CLEAR ?auto_53803 ) ( not ( = ?auto_53803 ?auto_53807 ) ) ( not ( = ?auto_53804 ?auto_53807 ) ) ( TRUCK-AT ?auto_53810 ?auto_53805 ) )
    :subtasks
    ( ( !DRIVE ?auto_53810 ?auto_53805 ?auto_53808 )
      ( MAKE-ON ?auto_53803 ?auto_53804 )
      ( MAKE-ON-VERIFY ?auto_53803 ?auto_53804 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53811 - SURFACE
      ?auto_53812 - SURFACE
    )
    :vars
    (
      ?auto_53817 - HOIST
      ?auto_53813 - PLACE
      ?auto_53814 - PLACE
      ?auto_53816 - HOIST
      ?auto_53815 - SURFACE
      ?auto_53818 - TRUCK
      ?auto_53819 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53817 ?auto_53813 ) ( IS-CRATE ?auto_53811 ) ( not ( = ?auto_53811 ?auto_53812 ) ) ( not ( = ?auto_53814 ?auto_53813 ) ) ( HOIST-AT ?auto_53816 ?auto_53814 ) ( not ( = ?auto_53817 ?auto_53816 ) ) ( AVAILABLE ?auto_53816 ) ( SURFACE-AT ?auto_53811 ?auto_53814 ) ( ON ?auto_53811 ?auto_53815 ) ( CLEAR ?auto_53811 ) ( not ( = ?auto_53811 ?auto_53815 ) ) ( not ( = ?auto_53812 ?auto_53815 ) ) ( TRUCK-AT ?auto_53818 ?auto_53813 ) ( SURFACE-AT ?auto_53819 ?auto_53813 ) ( CLEAR ?auto_53819 ) ( LIFTING ?auto_53817 ?auto_53812 ) ( IS-CRATE ?auto_53812 ) ( not ( = ?auto_53811 ?auto_53819 ) ) ( not ( = ?auto_53812 ?auto_53819 ) ) ( not ( = ?auto_53815 ?auto_53819 ) ) )
    :subtasks
    ( ( !DROP ?auto_53817 ?auto_53812 ?auto_53819 ?auto_53813 )
      ( MAKE-ON ?auto_53811 ?auto_53812 )
      ( MAKE-ON-VERIFY ?auto_53811 ?auto_53812 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53820 - SURFACE
      ?auto_53821 - SURFACE
    )
    :vars
    (
      ?auto_53824 - HOIST
      ?auto_53823 - PLACE
      ?auto_53826 - PLACE
      ?auto_53825 - HOIST
      ?auto_53828 - SURFACE
      ?auto_53827 - TRUCK
      ?auto_53822 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53824 ?auto_53823 ) ( IS-CRATE ?auto_53820 ) ( not ( = ?auto_53820 ?auto_53821 ) ) ( not ( = ?auto_53826 ?auto_53823 ) ) ( HOIST-AT ?auto_53825 ?auto_53826 ) ( not ( = ?auto_53824 ?auto_53825 ) ) ( AVAILABLE ?auto_53825 ) ( SURFACE-AT ?auto_53820 ?auto_53826 ) ( ON ?auto_53820 ?auto_53828 ) ( CLEAR ?auto_53820 ) ( not ( = ?auto_53820 ?auto_53828 ) ) ( not ( = ?auto_53821 ?auto_53828 ) ) ( TRUCK-AT ?auto_53827 ?auto_53823 ) ( SURFACE-AT ?auto_53822 ?auto_53823 ) ( CLEAR ?auto_53822 ) ( IS-CRATE ?auto_53821 ) ( not ( = ?auto_53820 ?auto_53822 ) ) ( not ( = ?auto_53821 ?auto_53822 ) ) ( not ( = ?auto_53828 ?auto_53822 ) ) ( AVAILABLE ?auto_53824 ) ( IN ?auto_53821 ?auto_53827 ) )
    :subtasks
    ( ( !UNLOAD ?auto_53824 ?auto_53821 ?auto_53827 ?auto_53823 )
      ( MAKE-ON ?auto_53820 ?auto_53821 )
      ( MAKE-ON-VERIFY ?auto_53820 ?auto_53821 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53829 - SURFACE
      ?auto_53830 - SURFACE
    )
    :vars
    (
      ?auto_53837 - HOIST
      ?auto_53835 - PLACE
      ?auto_53836 - PLACE
      ?auto_53834 - HOIST
      ?auto_53831 - SURFACE
      ?auto_53832 - SURFACE
      ?auto_53833 - TRUCK
      ?auto_53838 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53837 ?auto_53835 ) ( IS-CRATE ?auto_53829 ) ( not ( = ?auto_53829 ?auto_53830 ) ) ( not ( = ?auto_53836 ?auto_53835 ) ) ( HOIST-AT ?auto_53834 ?auto_53836 ) ( not ( = ?auto_53837 ?auto_53834 ) ) ( AVAILABLE ?auto_53834 ) ( SURFACE-AT ?auto_53829 ?auto_53836 ) ( ON ?auto_53829 ?auto_53831 ) ( CLEAR ?auto_53829 ) ( not ( = ?auto_53829 ?auto_53831 ) ) ( not ( = ?auto_53830 ?auto_53831 ) ) ( SURFACE-AT ?auto_53832 ?auto_53835 ) ( CLEAR ?auto_53832 ) ( IS-CRATE ?auto_53830 ) ( not ( = ?auto_53829 ?auto_53832 ) ) ( not ( = ?auto_53830 ?auto_53832 ) ) ( not ( = ?auto_53831 ?auto_53832 ) ) ( AVAILABLE ?auto_53837 ) ( IN ?auto_53830 ?auto_53833 ) ( TRUCK-AT ?auto_53833 ?auto_53838 ) ( not ( = ?auto_53838 ?auto_53835 ) ) ( not ( = ?auto_53836 ?auto_53838 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_53833 ?auto_53838 ?auto_53835 )
      ( MAKE-ON ?auto_53829 ?auto_53830 )
      ( MAKE-ON-VERIFY ?auto_53829 ?auto_53830 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53839 - SURFACE
      ?auto_53840 - SURFACE
    )
    :vars
    (
      ?auto_53841 - HOIST
      ?auto_53845 - PLACE
      ?auto_53846 - PLACE
      ?auto_53844 - HOIST
      ?auto_53848 - SURFACE
      ?auto_53842 - SURFACE
      ?auto_53843 - TRUCK
      ?auto_53847 - PLACE
      ?auto_53849 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_53841 ?auto_53845 ) ( IS-CRATE ?auto_53839 ) ( not ( = ?auto_53839 ?auto_53840 ) ) ( not ( = ?auto_53846 ?auto_53845 ) ) ( HOIST-AT ?auto_53844 ?auto_53846 ) ( not ( = ?auto_53841 ?auto_53844 ) ) ( AVAILABLE ?auto_53844 ) ( SURFACE-AT ?auto_53839 ?auto_53846 ) ( ON ?auto_53839 ?auto_53848 ) ( CLEAR ?auto_53839 ) ( not ( = ?auto_53839 ?auto_53848 ) ) ( not ( = ?auto_53840 ?auto_53848 ) ) ( SURFACE-AT ?auto_53842 ?auto_53845 ) ( CLEAR ?auto_53842 ) ( IS-CRATE ?auto_53840 ) ( not ( = ?auto_53839 ?auto_53842 ) ) ( not ( = ?auto_53840 ?auto_53842 ) ) ( not ( = ?auto_53848 ?auto_53842 ) ) ( AVAILABLE ?auto_53841 ) ( TRUCK-AT ?auto_53843 ?auto_53847 ) ( not ( = ?auto_53847 ?auto_53845 ) ) ( not ( = ?auto_53846 ?auto_53847 ) ) ( HOIST-AT ?auto_53849 ?auto_53847 ) ( LIFTING ?auto_53849 ?auto_53840 ) ( not ( = ?auto_53841 ?auto_53849 ) ) ( not ( = ?auto_53844 ?auto_53849 ) ) )
    :subtasks
    ( ( !LOAD ?auto_53849 ?auto_53840 ?auto_53843 ?auto_53847 )
      ( MAKE-ON ?auto_53839 ?auto_53840 )
      ( MAKE-ON-VERIFY ?auto_53839 ?auto_53840 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53850 - SURFACE
      ?auto_53851 - SURFACE
    )
    :vars
    (
      ?auto_53859 - HOIST
      ?auto_53856 - PLACE
      ?auto_53855 - PLACE
      ?auto_53852 - HOIST
      ?auto_53860 - SURFACE
      ?auto_53857 - SURFACE
      ?auto_53853 - TRUCK
      ?auto_53854 - PLACE
      ?auto_53858 - HOIST
      ?auto_53861 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53859 ?auto_53856 ) ( IS-CRATE ?auto_53850 ) ( not ( = ?auto_53850 ?auto_53851 ) ) ( not ( = ?auto_53855 ?auto_53856 ) ) ( HOIST-AT ?auto_53852 ?auto_53855 ) ( not ( = ?auto_53859 ?auto_53852 ) ) ( AVAILABLE ?auto_53852 ) ( SURFACE-AT ?auto_53850 ?auto_53855 ) ( ON ?auto_53850 ?auto_53860 ) ( CLEAR ?auto_53850 ) ( not ( = ?auto_53850 ?auto_53860 ) ) ( not ( = ?auto_53851 ?auto_53860 ) ) ( SURFACE-AT ?auto_53857 ?auto_53856 ) ( CLEAR ?auto_53857 ) ( IS-CRATE ?auto_53851 ) ( not ( = ?auto_53850 ?auto_53857 ) ) ( not ( = ?auto_53851 ?auto_53857 ) ) ( not ( = ?auto_53860 ?auto_53857 ) ) ( AVAILABLE ?auto_53859 ) ( TRUCK-AT ?auto_53853 ?auto_53854 ) ( not ( = ?auto_53854 ?auto_53856 ) ) ( not ( = ?auto_53855 ?auto_53854 ) ) ( HOIST-AT ?auto_53858 ?auto_53854 ) ( not ( = ?auto_53859 ?auto_53858 ) ) ( not ( = ?auto_53852 ?auto_53858 ) ) ( AVAILABLE ?auto_53858 ) ( SURFACE-AT ?auto_53851 ?auto_53854 ) ( ON ?auto_53851 ?auto_53861 ) ( CLEAR ?auto_53851 ) ( not ( = ?auto_53850 ?auto_53861 ) ) ( not ( = ?auto_53851 ?auto_53861 ) ) ( not ( = ?auto_53860 ?auto_53861 ) ) ( not ( = ?auto_53857 ?auto_53861 ) ) )
    :subtasks
    ( ( !LIFT ?auto_53858 ?auto_53851 ?auto_53861 ?auto_53854 )
      ( MAKE-ON ?auto_53850 ?auto_53851 )
      ( MAKE-ON-VERIFY ?auto_53850 ?auto_53851 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53862 - SURFACE
      ?auto_53863 - SURFACE
    )
    :vars
    (
      ?auto_53870 - HOIST
      ?auto_53864 - PLACE
      ?auto_53866 - PLACE
      ?auto_53867 - HOIST
      ?auto_53868 - SURFACE
      ?auto_53865 - SURFACE
      ?auto_53871 - PLACE
      ?auto_53872 - HOIST
      ?auto_53873 - SURFACE
      ?auto_53869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53870 ?auto_53864 ) ( IS-CRATE ?auto_53862 ) ( not ( = ?auto_53862 ?auto_53863 ) ) ( not ( = ?auto_53866 ?auto_53864 ) ) ( HOIST-AT ?auto_53867 ?auto_53866 ) ( not ( = ?auto_53870 ?auto_53867 ) ) ( AVAILABLE ?auto_53867 ) ( SURFACE-AT ?auto_53862 ?auto_53866 ) ( ON ?auto_53862 ?auto_53868 ) ( CLEAR ?auto_53862 ) ( not ( = ?auto_53862 ?auto_53868 ) ) ( not ( = ?auto_53863 ?auto_53868 ) ) ( SURFACE-AT ?auto_53865 ?auto_53864 ) ( CLEAR ?auto_53865 ) ( IS-CRATE ?auto_53863 ) ( not ( = ?auto_53862 ?auto_53865 ) ) ( not ( = ?auto_53863 ?auto_53865 ) ) ( not ( = ?auto_53868 ?auto_53865 ) ) ( AVAILABLE ?auto_53870 ) ( not ( = ?auto_53871 ?auto_53864 ) ) ( not ( = ?auto_53866 ?auto_53871 ) ) ( HOIST-AT ?auto_53872 ?auto_53871 ) ( not ( = ?auto_53870 ?auto_53872 ) ) ( not ( = ?auto_53867 ?auto_53872 ) ) ( AVAILABLE ?auto_53872 ) ( SURFACE-AT ?auto_53863 ?auto_53871 ) ( ON ?auto_53863 ?auto_53873 ) ( CLEAR ?auto_53863 ) ( not ( = ?auto_53862 ?auto_53873 ) ) ( not ( = ?auto_53863 ?auto_53873 ) ) ( not ( = ?auto_53868 ?auto_53873 ) ) ( not ( = ?auto_53865 ?auto_53873 ) ) ( TRUCK-AT ?auto_53869 ?auto_53864 ) )
    :subtasks
    ( ( !DRIVE ?auto_53869 ?auto_53864 ?auto_53871 )
      ( MAKE-ON ?auto_53862 ?auto_53863 )
      ( MAKE-ON-VERIFY ?auto_53862 ?auto_53863 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53874 - SURFACE
      ?auto_53875 - SURFACE
    )
    :vars
    (
      ?auto_53883 - HOIST
      ?auto_53877 - PLACE
      ?auto_53880 - PLACE
      ?auto_53878 - HOIST
      ?auto_53885 - SURFACE
      ?auto_53881 - SURFACE
      ?auto_53879 - PLACE
      ?auto_53884 - HOIST
      ?auto_53882 - SURFACE
      ?auto_53876 - TRUCK
      ?auto_53886 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53883 ?auto_53877 ) ( IS-CRATE ?auto_53874 ) ( not ( = ?auto_53874 ?auto_53875 ) ) ( not ( = ?auto_53880 ?auto_53877 ) ) ( HOIST-AT ?auto_53878 ?auto_53880 ) ( not ( = ?auto_53883 ?auto_53878 ) ) ( AVAILABLE ?auto_53878 ) ( SURFACE-AT ?auto_53874 ?auto_53880 ) ( ON ?auto_53874 ?auto_53885 ) ( CLEAR ?auto_53874 ) ( not ( = ?auto_53874 ?auto_53885 ) ) ( not ( = ?auto_53875 ?auto_53885 ) ) ( IS-CRATE ?auto_53875 ) ( not ( = ?auto_53874 ?auto_53881 ) ) ( not ( = ?auto_53875 ?auto_53881 ) ) ( not ( = ?auto_53885 ?auto_53881 ) ) ( not ( = ?auto_53879 ?auto_53877 ) ) ( not ( = ?auto_53880 ?auto_53879 ) ) ( HOIST-AT ?auto_53884 ?auto_53879 ) ( not ( = ?auto_53883 ?auto_53884 ) ) ( not ( = ?auto_53878 ?auto_53884 ) ) ( AVAILABLE ?auto_53884 ) ( SURFACE-AT ?auto_53875 ?auto_53879 ) ( ON ?auto_53875 ?auto_53882 ) ( CLEAR ?auto_53875 ) ( not ( = ?auto_53874 ?auto_53882 ) ) ( not ( = ?auto_53875 ?auto_53882 ) ) ( not ( = ?auto_53885 ?auto_53882 ) ) ( not ( = ?auto_53881 ?auto_53882 ) ) ( TRUCK-AT ?auto_53876 ?auto_53877 ) ( SURFACE-AT ?auto_53886 ?auto_53877 ) ( CLEAR ?auto_53886 ) ( LIFTING ?auto_53883 ?auto_53881 ) ( IS-CRATE ?auto_53881 ) ( not ( = ?auto_53874 ?auto_53886 ) ) ( not ( = ?auto_53875 ?auto_53886 ) ) ( not ( = ?auto_53885 ?auto_53886 ) ) ( not ( = ?auto_53881 ?auto_53886 ) ) ( not ( = ?auto_53882 ?auto_53886 ) ) )
    :subtasks
    ( ( !DROP ?auto_53883 ?auto_53881 ?auto_53886 ?auto_53877 )
      ( MAKE-ON ?auto_53874 ?auto_53875 )
      ( MAKE-ON-VERIFY ?auto_53874 ?auto_53875 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53887 - SURFACE
      ?auto_53888 - SURFACE
    )
    :vars
    (
      ?auto_53889 - HOIST
      ?auto_53895 - PLACE
      ?auto_53897 - PLACE
      ?auto_53893 - HOIST
      ?auto_53890 - SURFACE
      ?auto_53894 - SURFACE
      ?auto_53896 - PLACE
      ?auto_53898 - HOIST
      ?auto_53891 - SURFACE
      ?auto_53899 - TRUCK
      ?auto_53892 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53889 ?auto_53895 ) ( IS-CRATE ?auto_53887 ) ( not ( = ?auto_53887 ?auto_53888 ) ) ( not ( = ?auto_53897 ?auto_53895 ) ) ( HOIST-AT ?auto_53893 ?auto_53897 ) ( not ( = ?auto_53889 ?auto_53893 ) ) ( AVAILABLE ?auto_53893 ) ( SURFACE-AT ?auto_53887 ?auto_53897 ) ( ON ?auto_53887 ?auto_53890 ) ( CLEAR ?auto_53887 ) ( not ( = ?auto_53887 ?auto_53890 ) ) ( not ( = ?auto_53888 ?auto_53890 ) ) ( IS-CRATE ?auto_53888 ) ( not ( = ?auto_53887 ?auto_53894 ) ) ( not ( = ?auto_53888 ?auto_53894 ) ) ( not ( = ?auto_53890 ?auto_53894 ) ) ( not ( = ?auto_53896 ?auto_53895 ) ) ( not ( = ?auto_53897 ?auto_53896 ) ) ( HOIST-AT ?auto_53898 ?auto_53896 ) ( not ( = ?auto_53889 ?auto_53898 ) ) ( not ( = ?auto_53893 ?auto_53898 ) ) ( AVAILABLE ?auto_53898 ) ( SURFACE-AT ?auto_53888 ?auto_53896 ) ( ON ?auto_53888 ?auto_53891 ) ( CLEAR ?auto_53888 ) ( not ( = ?auto_53887 ?auto_53891 ) ) ( not ( = ?auto_53888 ?auto_53891 ) ) ( not ( = ?auto_53890 ?auto_53891 ) ) ( not ( = ?auto_53894 ?auto_53891 ) ) ( TRUCK-AT ?auto_53899 ?auto_53895 ) ( SURFACE-AT ?auto_53892 ?auto_53895 ) ( CLEAR ?auto_53892 ) ( IS-CRATE ?auto_53894 ) ( not ( = ?auto_53887 ?auto_53892 ) ) ( not ( = ?auto_53888 ?auto_53892 ) ) ( not ( = ?auto_53890 ?auto_53892 ) ) ( not ( = ?auto_53894 ?auto_53892 ) ) ( not ( = ?auto_53891 ?auto_53892 ) ) ( AVAILABLE ?auto_53889 ) ( IN ?auto_53894 ?auto_53899 ) )
    :subtasks
    ( ( !UNLOAD ?auto_53889 ?auto_53894 ?auto_53899 ?auto_53895 )
      ( MAKE-ON ?auto_53887 ?auto_53888 )
      ( MAKE-ON-VERIFY ?auto_53887 ?auto_53888 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53900 - SURFACE
      ?auto_53901 - SURFACE
    )
    :vars
    (
      ?auto_53902 - HOIST
      ?auto_53904 - PLACE
      ?auto_53912 - PLACE
      ?auto_53906 - HOIST
      ?auto_53911 - SURFACE
      ?auto_53909 - SURFACE
      ?auto_53903 - PLACE
      ?auto_53905 - HOIST
      ?auto_53910 - SURFACE
      ?auto_53908 - SURFACE
      ?auto_53907 - TRUCK
      ?auto_53913 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53902 ?auto_53904 ) ( IS-CRATE ?auto_53900 ) ( not ( = ?auto_53900 ?auto_53901 ) ) ( not ( = ?auto_53912 ?auto_53904 ) ) ( HOIST-AT ?auto_53906 ?auto_53912 ) ( not ( = ?auto_53902 ?auto_53906 ) ) ( AVAILABLE ?auto_53906 ) ( SURFACE-AT ?auto_53900 ?auto_53912 ) ( ON ?auto_53900 ?auto_53911 ) ( CLEAR ?auto_53900 ) ( not ( = ?auto_53900 ?auto_53911 ) ) ( not ( = ?auto_53901 ?auto_53911 ) ) ( IS-CRATE ?auto_53901 ) ( not ( = ?auto_53900 ?auto_53909 ) ) ( not ( = ?auto_53901 ?auto_53909 ) ) ( not ( = ?auto_53911 ?auto_53909 ) ) ( not ( = ?auto_53903 ?auto_53904 ) ) ( not ( = ?auto_53912 ?auto_53903 ) ) ( HOIST-AT ?auto_53905 ?auto_53903 ) ( not ( = ?auto_53902 ?auto_53905 ) ) ( not ( = ?auto_53906 ?auto_53905 ) ) ( AVAILABLE ?auto_53905 ) ( SURFACE-AT ?auto_53901 ?auto_53903 ) ( ON ?auto_53901 ?auto_53910 ) ( CLEAR ?auto_53901 ) ( not ( = ?auto_53900 ?auto_53910 ) ) ( not ( = ?auto_53901 ?auto_53910 ) ) ( not ( = ?auto_53911 ?auto_53910 ) ) ( not ( = ?auto_53909 ?auto_53910 ) ) ( SURFACE-AT ?auto_53908 ?auto_53904 ) ( CLEAR ?auto_53908 ) ( IS-CRATE ?auto_53909 ) ( not ( = ?auto_53900 ?auto_53908 ) ) ( not ( = ?auto_53901 ?auto_53908 ) ) ( not ( = ?auto_53911 ?auto_53908 ) ) ( not ( = ?auto_53909 ?auto_53908 ) ) ( not ( = ?auto_53910 ?auto_53908 ) ) ( AVAILABLE ?auto_53902 ) ( IN ?auto_53909 ?auto_53907 ) ( TRUCK-AT ?auto_53907 ?auto_53913 ) ( not ( = ?auto_53913 ?auto_53904 ) ) ( not ( = ?auto_53912 ?auto_53913 ) ) ( not ( = ?auto_53903 ?auto_53913 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_53907 ?auto_53913 ?auto_53904 )
      ( MAKE-ON ?auto_53900 ?auto_53901 )
      ( MAKE-ON-VERIFY ?auto_53900 ?auto_53901 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53914 - SURFACE
      ?auto_53915 - SURFACE
    )
    :vars
    (
      ?auto_53917 - HOIST
      ?auto_53925 - PLACE
      ?auto_53919 - PLACE
      ?auto_53921 - HOIST
      ?auto_53924 - SURFACE
      ?auto_53923 - SURFACE
      ?auto_53916 - PLACE
      ?auto_53918 - HOIST
      ?auto_53920 - SURFACE
      ?auto_53926 - SURFACE
      ?auto_53922 - TRUCK
      ?auto_53927 - PLACE
      ?auto_53928 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_53917 ?auto_53925 ) ( IS-CRATE ?auto_53914 ) ( not ( = ?auto_53914 ?auto_53915 ) ) ( not ( = ?auto_53919 ?auto_53925 ) ) ( HOIST-AT ?auto_53921 ?auto_53919 ) ( not ( = ?auto_53917 ?auto_53921 ) ) ( AVAILABLE ?auto_53921 ) ( SURFACE-AT ?auto_53914 ?auto_53919 ) ( ON ?auto_53914 ?auto_53924 ) ( CLEAR ?auto_53914 ) ( not ( = ?auto_53914 ?auto_53924 ) ) ( not ( = ?auto_53915 ?auto_53924 ) ) ( IS-CRATE ?auto_53915 ) ( not ( = ?auto_53914 ?auto_53923 ) ) ( not ( = ?auto_53915 ?auto_53923 ) ) ( not ( = ?auto_53924 ?auto_53923 ) ) ( not ( = ?auto_53916 ?auto_53925 ) ) ( not ( = ?auto_53919 ?auto_53916 ) ) ( HOIST-AT ?auto_53918 ?auto_53916 ) ( not ( = ?auto_53917 ?auto_53918 ) ) ( not ( = ?auto_53921 ?auto_53918 ) ) ( AVAILABLE ?auto_53918 ) ( SURFACE-AT ?auto_53915 ?auto_53916 ) ( ON ?auto_53915 ?auto_53920 ) ( CLEAR ?auto_53915 ) ( not ( = ?auto_53914 ?auto_53920 ) ) ( not ( = ?auto_53915 ?auto_53920 ) ) ( not ( = ?auto_53924 ?auto_53920 ) ) ( not ( = ?auto_53923 ?auto_53920 ) ) ( SURFACE-AT ?auto_53926 ?auto_53925 ) ( CLEAR ?auto_53926 ) ( IS-CRATE ?auto_53923 ) ( not ( = ?auto_53914 ?auto_53926 ) ) ( not ( = ?auto_53915 ?auto_53926 ) ) ( not ( = ?auto_53924 ?auto_53926 ) ) ( not ( = ?auto_53923 ?auto_53926 ) ) ( not ( = ?auto_53920 ?auto_53926 ) ) ( AVAILABLE ?auto_53917 ) ( TRUCK-AT ?auto_53922 ?auto_53927 ) ( not ( = ?auto_53927 ?auto_53925 ) ) ( not ( = ?auto_53919 ?auto_53927 ) ) ( not ( = ?auto_53916 ?auto_53927 ) ) ( HOIST-AT ?auto_53928 ?auto_53927 ) ( LIFTING ?auto_53928 ?auto_53923 ) ( not ( = ?auto_53917 ?auto_53928 ) ) ( not ( = ?auto_53921 ?auto_53928 ) ) ( not ( = ?auto_53918 ?auto_53928 ) ) )
    :subtasks
    ( ( !LOAD ?auto_53928 ?auto_53923 ?auto_53922 ?auto_53927 )
      ( MAKE-ON ?auto_53914 ?auto_53915 )
      ( MAKE-ON-VERIFY ?auto_53914 ?auto_53915 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53929 - SURFACE
      ?auto_53930 - SURFACE
    )
    :vars
    (
      ?auto_53943 - HOIST
      ?auto_53939 - PLACE
      ?auto_53941 - PLACE
      ?auto_53935 - HOIST
      ?auto_53934 - SURFACE
      ?auto_53938 - SURFACE
      ?auto_53937 - PLACE
      ?auto_53931 - HOIST
      ?auto_53942 - SURFACE
      ?auto_53940 - SURFACE
      ?auto_53933 - TRUCK
      ?auto_53936 - PLACE
      ?auto_53932 - HOIST
      ?auto_53944 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53943 ?auto_53939 ) ( IS-CRATE ?auto_53929 ) ( not ( = ?auto_53929 ?auto_53930 ) ) ( not ( = ?auto_53941 ?auto_53939 ) ) ( HOIST-AT ?auto_53935 ?auto_53941 ) ( not ( = ?auto_53943 ?auto_53935 ) ) ( AVAILABLE ?auto_53935 ) ( SURFACE-AT ?auto_53929 ?auto_53941 ) ( ON ?auto_53929 ?auto_53934 ) ( CLEAR ?auto_53929 ) ( not ( = ?auto_53929 ?auto_53934 ) ) ( not ( = ?auto_53930 ?auto_53934 ) ) ( IS-CRATE ?auto_53930 ) ( not ( = ?auto_53929 ?auto_53938 ) ) ( not ( = ?auto_53930 ?auto_53938 ) ) ( not ( = ?auto_53934 ?auto_53938 ) ) ( not ( = ?auto_53937 ?auto_53939 ) ) ( not ( = ?auto_53941 ?auto_53937 ) ) ( HOIST-AT ?auto_53931 ?auto_53937 ) ( not ( = ?auto_53943 ?auto_53931 ) ) ( not ( = ?auto_53935 ?auto_53931 ) ) ( AVAILABLE ?auto_53931 ) ( SURFACE-AT ?auto_53930 ?auto_53937 ) ( ON ?auto_53930 ?auto_53942 ) ( CLEAR ?auto_53930 ) ( not ( = ?auto_53929 ?auto_53942 ) ) ( not ( = ?auto_53930 ?auto_53942 ) ) ( not ( = ?auto_53934 ?auto_53942 ) ) ( not ( = ?auto_53938 ?auto_53942 ) ) ( SURFACE-AT ?auto_53940 ?auto_53939 ) ( CLEAR ?auto_53940 ) ( IS-CRATE ?auto_53938 ) ( not ( = ?auto_53929 ?auto_53940 ) ) ( not ( = ?auto_53930 ?auto_53940 ) ) ( not ( = ?auto_53934 ?auto_53940 ) ) ( not ( = ?auto_53938 ?auto_53940 ) ) ( not ( = ?auto_53942 ?auto_53940 ) ) ( AVAILABLE ?auto_53943 ) ( TRUCK-AT ?auto_53933 ?auto_53936 ) ( not ( = ?auto_53936 ?auto_53939 ) ) ( not ( = ?auto_53941 ?auto_53936 ) ) ( not ( = ?auto_53937 ?auto_53936 ) ) ( HOIST-AT ?auto_53932 ?auto_53936 ) ( not ( = ?auto_53943 ?auto_53932 ) ) ( not ( = ?auto_53935 ?auto_53932 ) ) ( not ( = ?auto_53931 ?auto_53932 ) ) ( AVAILABLE ?auto_53932 ) ( SURFACE-AT ?auto_53938 ?auto_53936 ) ( ON ?auto_53938 ?auto_53944 ) ( CLEAR ?auto_53938 ) ( not ( = ?auto_53929 ?auto_53944 ) ) ( not ( = ?auto_53930 ?auto_53944 ) ) ( not ( = ?auto_53934 ?auto_53944 ) ) ( not ( = ?auto_53938 ?auto_53944 ) ) ( not ( = ?auto_53942 ?auto_53944 ) ) ( not ( = ?auto_53940 ?auto_53944 ) ) )
    :subtasks
    ( ( !LIFT ?auto_53932 ?auto_53938 ?auto_53944 ?auto_53936 )
      ( MAKE-ON ?auto_53929 ?auto_53930 )
      ( MAKE-ON-VERIFY ?auto_53929 ?auto_53930 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53945 - SURFACE
      ?auto_53946 - SURFACE
    )
    :vars
    (
      ?auto_53950 - HOIST
      ?auto_53959 - PLACE
      ?auto_53956 - PLACE
      ?auto_53947 - HOIST
      ?auto_53957 - SURFACE
      ?auto_53948 - SURFACE
      ?auto_53949 - PLACE
      ?auto_53960 - HOIST
      ?auto_53955 - SURFACE
      ?auto_53951 - SURFACE
      ?auto_53954 - PLACE
      ?auto_53953 - HOIST
      ?auto_53958 - SURFACE
      ?auto_53952 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53950 ?auto_53959 ) ( IS-CRATE ?auto_53945 ) ( not ( = ?auto_53945 ?auto_53946 ) ) ( not ( = ?auto_53956 ?auto_53959 ) ) ( HOIST-AT ?auto_53947 ?auto_53956 ) ( not ( = ?auto_53950 ?auto_53947 ) ) ( AVAILABLE ?auto_53947 ) ( SURFACE-AT ?auto_53945 ?auto_53956 ) ( ON ?auto_53945 ?auto_53957 ) ( CLEAR ?auto_53945 ) ( not ( = ?auto_53945 ?auto_53957 ) ) ( not ( = ?auto_53946 ?auto_53957 ) ) ( IS-CRATE ?auto_53946 ) ( not ( = ?auto_53945 ?auto_53948 ) ) ( not ( = ?auto_53946 ?auto_53948 ) ) ( not ( = ?auto_53957 ?auto_53948 ) ) ( not ( = ?auto_53949 ?auto_53959 ) ) ( not ( = ?auto_53956 ?auto_53949 ) ) ( HOIST-AT ?auto_53960 ?auto_53949 ) ( not ( = ?auto_53950 ?auto_53960 ) ) ( not ( = ?auto_53947 ?auto_53960 ) ) ( AVAILABLE ?auto_53960 ) ( SURFACE-AT ?auto_53946 ?auto_53949 ) ( ON ?auto_53946 ?auto_53955 ) ( CLEAR ?auto_53946 ) ( not ( = ?auto_53945 ?auto_53955 ) ) ( not ( = ?auto_53946 ?auto_53955 ) ) ( not ( = ?auto_53957 ?auto_53955 ) ) ( not ( = ?auto_53948 ?auto_53955 ) ) ( SURFACE-AT ?auto_53951 ?auto_53959 ) ( CLEAR ?auto_53951 ) ( IS-CRATE ?auto_53948 ) ( not ( = ?auto_53945 ?auto_53951 ) ) ( not ( = ?auto_53946 ?auto_53951 ) ) ( not ( = ?auto_53957 ?auto_53951 ) ) ( not ( = ?auto_53948 ?auto_53951 ) ) ( not ( = ?auto_53955 ?auto_53951 ) ) ( AVAILABLE ?auto_53950 ) ( not ( = ?auto_53954 ?auto_53959 ) ) ( not ( = ?auto_53956 ?auto_53954 ) ) ( not ( = ?auto_53949 ?auto_53954 ) ) ( HOIST-AT ?auto_53953 ?auto_53954 ) ( not ( = ?auto_53950 ?auto_53953 ) ) ( not ( = ?auto_53947 ?auto_53953 ) ) ( not ( = ?auto_53960 ?auto_53953 ) ) ( AVAILABLE ?auto_53953 ) ( SURFACE-AT ?auto_53948 ?auto_53954 ) ( ON ?auto_53948 ?auto_53958 ) ( CLEAR ?auto_53948 ) ( not ( = ?auto_53945 ?auto_53958 ) ) ( not ( = ?auto_53946 ?auto_53958 ) ) ( not ( = ?auto_53957 ?auto_53958 ) ) ( not ( = ?auto_53948 ?auto_53958 ) ) ( not ( = ?auto_53955 ?auto_53958 ) ) ( not ( = ?auto_53951 ?auto_53958 ) ) ( TRUCK-AT ?auto_53952 ?auto_53959 ) )
    :subtasks
    ( ( !DRIVE ?auto_53952 ?auto_53959 ?auto_53954 )
      ( MAKE-ON ?auto_53945 ?auto_53946 )
      ( MAKE-ON-VERIFY ?auto_53945 ?auto_53946 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53961 - SURFACE
      ?auto_53962 - SURFACE
    )
    :vars
    (
      ?auto_53969 - HOIST
      ?auto_53971 - PLACE
      ?auto_53973 - PLACE
      ?auto_53965 - HOIST
      ?auto_53975 - SURFACE
      ?auto_53966 - SURFACE
      ?auto_53976 - PLACE
      ?auto_53968 - HOIST
      ?auto_53970 - SURFACE
      ?auto_53972 - SURFACE
      ?auto_53967 - PLACE
      ?auto_53964 - HOIST
      ?auto_53963 - SURFACE
      ?auto_53974 - TRUCK
      ?auto_53977 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53969 ?auto_53971 ) ( IS-CRATE ?auto_53961 ) ( not ( = ?auto_53961 ?auto_53962 ) ) ( not ( = ?auto_53973 ?auto_53971 ) ) ( HOIST-AT ?auto_53965 ?auto_53973 ) ( not ( = ?auto_53969 ?auto_53965 ) ) ( AVAILABLE ?auto_53965 ) ( SURFACE-AT ?auto_53961 ?auto_53973 ) ( ON ?auto_53961 ?auto_53975 ) ( CLEAR ?auto_53961 ) ( not ( = ?auto_53961 ?auto_53975 ) ) ( not ( = ?auto_53962 ?auto_53975 ) ) ( IS-CRATE ?auto_53962 ) ( not ( = ?auto_53961 ?auto_53966 ) ) ( not ( = ?auto_53962 ?auto_53966 ) ) ( not ( = ?auto_53975 ?auto_53966 ) ) ( not ( = ?auto_53976 ?auto_53971 ) ) ( not ( = ?auto_53973 ?auto_53976 ) ) ( HOIST-AT ?auto_53968 ?auto_53976 ) ( not ( = ?auto_53969 ?auto_53968 ) ) ( not ( = ?auto_53965 ?auto_53968 ) ) ( AVAILABLE ?auto_53968 ) ( SURFACE-AT ?auto_53962 ?auto_53976 ) ( ON ?auto_53962 ?auto_53970 ) ( CLEAR ?auto_53962 ) ( not ( = ?auto_53961 ?auto_53970 ) ) ( not ( = ?auto_53962 ?auto_53970 ) ) ( not ( = ?auto_53975 ?auto_53970 ) ) ( not ( = ?auto_53966 ?auto_53970 ) ) ( IS-CRATE ?auto_53966 ) ( not ( = ?auto_53961 ?auto_53972 ) ) ( not ( = ?auto_53962 ?auto_53972 ) ) ( not ( = ?auto_53975 ?auto_53972 ) ) ( not ( = ?auto_53966 ?auto_53972 ) ) ( not ( = ?auto_53970 ?auto_53972 ) ) ( not ( = ?auto_53967 ?auto_53971 ) ) ( not ( = ?auto_53973 ?auto_53967 ) ) ( not ( = ?auto_53976 ?auto_53967 ) ) ( HOIST-AT ?auto_53964 ?auto_53967 ) ( not ( = ?auto_53969 ?auto_53964 ) ) ( not ( = ?auto_53965 ?auto_53964 ) ) ( not ( = ?auto_53968 ?auto_53964 ) ) ( AVAILABLE ?auto_53964 ) ( SURFACE-AT ?auto_53966 ?auto_53967 ) ( ON ?auto_53966 ?auto_53963 ) ( CLEAR ?auto_53966 ) ( not ( = ?auto_53961 ?auto_53963 ) ) ( not ( = ?auto_53962 ?auto_53963 ) ) ( not ( = ?auto_53975 ?auto_53963 ) ) ( not ( = ?auto_53966 ?auto_53963 ) ) ( not ( = ?auto_53970 ?auto_53963 ) ) ( not ( = ?auto_53972 ?auto_53963 ) ) ( TRUCK-AT ?auto_53974 ?auto_53971 ) ( SURFACE-AT ?auto_53977 ?auto_53971 ) ( CLEAR ?auto_53977 ) ( LIFTING ?auto_53969 ?auto_53972 ) ( IS-CRATE ?auto_53972 ) ( not ( = ?auto_53961 ?auto_53977 ) ) ( not ( = ?auto_53962 ?auto_53977 ) ) ( not ( = ?auto_53975 ?auto_53977 ) ) ( not ( = ?auto_53966 ?auto_53977 ) ) ( not ( = ?auto_53970 ?auto_53977 ) ) ( not ( = ?auto_53972 ?auto_53977 ) ) ( not ( = ?auto_53963 ?auto_53977 ) ) )
    :subtasks
    ( ( !DROP ?auto_53969 ?auto_53972 ?auto_53977 ?auto_53971 )
      ( MAKE-ON ?auto_53961 ?auto_53962 )
      ( MAKE-ON-VERIFY ?auto_53961 ?auto_53962 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53978 - SURFACE
      ?auto_53979 - SURFACE
    )
    :vars
    (
      ?auto_53991 - HOIST
      ?auto_53994 - PLACE
      ?auto_53983 - PLACE
      ?auto_53981 - HOIST
      ?auto_53982 - SURFACE
      ?auto_53990 - SURFACE
      ?auto_53988 - PLACE
      ?auto_53987 - HOIST
      ?auto_53986 - SURFACE
      ?auto_53984 - SURFACE
      ?auto_53985 - PLACE
      ?auto_53989 - HOIST
      ?auto_53980 - SURFACE
      ?auto_53993 - TRUCK
      ?auto_53992 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_53991 ?auto_53994 ) ( IS-CRATE ?auto_53978 ) ( not ( = ?auto_53978 ?auto_53979 ) ) ( not ( = ?auto_53983 ?auto_53994 ) ) ( HOIST-AT ?auto_53981 ?auto_53983 ) ( not ( = ?auto_53991 ?auto_53981 ) ) ( AVAILABLE ?auto_53981 ) ( SURFACE-AT ?auto_53978 ?auto_53983 ) ( ON ?auto_53978 ?auto_53982 ) ( CLEAR ?auto_53978 ) ( not ( = ?auto_53978 ?auto_53982 ) ) ( not ( = ?auto_53979 ?auto_53982 ) ) ( IS-CRATE ?auto_53979 ) ( not ( = ?auto_53978 ?auto_53990 ) ) ( not ( = ?auto_53979 ?auto_53990 ) ) ( not ( = ?auto_53982 ?auto_53990 ) ) ( not ( = ?auto_53988 ?auto_53994 ) ) ( not ( = ?auto_53983 ?auto_53988 ) ) ( HOIST-AT ?auto_53987 ?auto_53988 ) ( not ( = ?auto_53991 ?auto_53987 ) ) ( not ( = ?auto_53981 ?auto_53987 ) ) ( AVAILABLE ?auto_53987 ) ( SURFACE-AT ?auto_53979 ?auto_53988 ) ( ON ?auto_53979 ?auto_53986 ) ( CLEAR ?auto_53979 ) ( not ( = ?auto_53978 ?auto_53986 ) ) ( not ( = ?auto_53979 ?auto_53986 ) ) ( not ( = ?auto_53982 ?auto_53986 ) ) ( not ( = ?auto_53990 ?auto_53986 ) ) ( IS-CRATE ?auto_53990 ) ( not ( = ?auto_53978 ?auto_53984 ) ) ( not ( = ?auto_53979 ?auto_53984 ) ) ( not ( = ?auto_53982 ?auto_53984 ) ) ( not ( = ?auto_53990 ?auto_53984 ) ) ( not ( = ?auto_53986 ?auto_53984 ) ) ( not ( = ?auto_53985 ?auto_53994 ) ) ( not ( = ?auto_53983 ?auto_53985 ) ) ( not ( = ?auto_53988 ?auto_53985 ) ) ( HOIST-AT ?auto_53989 ?auto_53985 ) ( not ( = ?auto_53991 ?auto_53989 ) ) ( not ( = ?auto_53981 ?auto_53989 ) ) ( not ( = ?auto_53987 ?auto_53989 ) ) ( AVAILABLE ?auto_53989 ) ( SURFACE-AT ?auto_53990 ?auto_53985 ) ( ON ?auto_53990 ?auto_53980 ) ( CLEAR ?auto_53990 ) ( not ( = ?auto_53978 ?auto_53980 ) ) ( not ( = ?auto_53979 ?auto_53980 ) ) ( not ( = ?auto_53982 ?auto_53980 ) ) ( not ( = ?auto_53990 ?auto_53980 ) ) ( not ( = ?auto_53986 ?auto_53980 ) ) ( not ( = ?auto_53984 ?auto_53980 ) ) ( TRUCK-AT ?auto_53993 ?auto_53994 ) ( SURFACE-AT ?auto_53992 ?auto_53994 ) ( CLEAR ?auto_53992 ) ( IS-CRATE ?auto_53984 ) ( not ( = ?auto_53978 ?auto_53992 ) ) ( not ( = ?auto_53979 ?auto_53992 ) ) ( not ( = ?auto_53982 ?auto_53992 ) ) ( not ( = ?auto_53990 ?auto_53992 ) ) ( not ( = ?auto_53986 ?auto_53992 ) ) ( not ( = ?auto_53984 ?auto_53992 ) ) ( not ( = ?auto_53980 ?auto_53992 ) ) ( AVAILABLE ?auto_53991 ) ( IN ?auto_53984 ?auto_53993 ) )
    :subtasks
    ( ( !UNLOAD ?auto_53991 ?auto_53984 ?auto_53993 ?auto_53994 )
      ( MAKE-ON ?auto_53978 ?auto_53979 )
      ( MAKE-ON-VERIFY ?auto_53978 ?auto_53979 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_53995 - SURFACE
      ?auto_53996 - SURFACE
    )
    :vars
    (
      ?auto_54007 - HOIST
      ?auto_54008 - PLACE
      ?auto_54010 - PLACE
      ?auto_54006 - HOIST
      ?auto_54000 - SURFACE
      ?auto_54001 - SURFACE
      ?auto_54005 - PLACE
      ?auto_54011 - HOIST
      ?auto_54004 - SURFACE
      ?auto_54002 - SURFACE
      ?auto_54003 - PLACE
      ?auto_53998 - HOIST
      ?auto_54009 - SURFACE
      ?auto_53997 - SURFACE
      ?auto_53999 - TRUCK
      ?auto_54012 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54007 ?auto_54008 ) ( IS-CRATE ?auto_53995 ) ( not ( = ?auto_53995 ?auto_53996 ) ) ( not ( = ?auto_54010 ?auto_54008 ) ) ( HOIST-AT ?auto_54006 ?auto_54010 ) ( not ( = ?auto_54007 ?auto_54006 ) ) ( AVAILABLE ?auto_54006 ) ( SURFACE-AT ?auto_53995 ?auto_54010 ) ( ON ?auto_53995 ?auto_54000 ) ( CLEAR ?auto_53995 ) ( not ( = ?auto_53995 ?auto_54000 ) ) ( not ( = ?auto_53996 ?auto_54000 ) ) ( IS-CRATE ?auto_53996 ) ( not ( = ?auto_53995 ?auto_54001 ) ) ( not ( = ?auto_53996 ?auto_54001 ) ) ( not ( = ?auto_54000 ?auto_54001 ) ) ( not ( = ?auto_54005 ?auto_54008 ) ) ( not ( = ?auto_54010 ?auto_54005 ) ) ( HOIST-AT ?auto_54011 ?auto_54005 ) ( not ( = ?auto_54007 ?auto_54011 ) ) ( not ( = ?auto_54006 ?auto_54011 ) ) ( AVAILABLE ?auto_54011 ) ( SURFACE-AT ?auto_53996 ?auto_54005 ) ( ON ?auto_53996 ?auto_54004 ) ( CLEAR ?auto_53996 ) ( not ( = ?auto_53995 ?auto_54004 ) ) ( not ( = ?auto_53996 ?auto_54004 ) ) ( not ( = ?auto_54000 ?auto_54004 ) ) ( not ( = ?auto_54001 ?auto_54004 ) ) ( IS-CRATE ?auto_54001 ) ( not ( = ?auto_53995 ?auto_54002 ) ) ( not ( = ?auto_53996 ?auto_54002 ) ) ( not ( = ?auto_54000 ?auto_54002 ) ) ( not ( = ?auto_54001 ?auto_54002 ) ) ( not ( = ?auto_54004 ?auto_54002 ) ) ( not ( = ?auto_54003 ?auto_54008 ) ) ( not ( = ?auto_54010 ?auto_54003 ) ) ( not ( = ?auto_54005 ?auto_54003 ) ) ( HOIST-AT ?auto_53998 ?auto_54003 ) ( not ( = ?auto_54007 ?auto_53998 ) ) ( not ( = ?auto_54006 ?auto_53998 ) ) ( not ( = ?auto_54011 ?auto_53998 ) ) ( AVAILABLE ?auto_53998 ) ( SURFACE-AT ?auto_54001 ?auto_54003 ) ( ON ?auto_54001 ?auto_54009 ) ( CLEAR ?auto_54001 ) ( not ( = ?auto_53995 ?auto_54009 ) ) ( not ( = ?auto_53996 ?auto_54009 ) ) ( not ( = ?auto_54000 ?auto_54009 ) ) ( not ( = ?auto_54001 ?auto_54009 ) ) ( not ( = ?auto_54004 ?auto_54009 ) ) ( not ( = ?auto_54002 ?auto_54009 ) ) ( SURFACE-AT ?auto_53997 ?auto_54008 ) ( CLEAR ?auto_53997 ) ( IS-CRATE ?auto_54002 ) ( not ( = ?auto_53995 ?auto_53997 ) ) ( not ( = ?auto_53996 ?auto_53997 ) ) ( not ( = ?auto_54000 ?auto_53997 ) ) ( not ( = ?auto_54001 ?auto_53997 ) ) ( not ( = ?auto_54004 ?auto_53997 ) ) ( not ( = ?auto_54002 ?auto_53997 ) ) ( not ( = ?auto_54009 ?auto_53997 ) ) ( AVAILABLE ?auto_54007 ) ( IN ?auto_54002 ?auto_53999 ) ( TRUCK-AT ?auto_53999 ?auto_54012 ) ( not ( = ?auto_54012 ?auto_54008 ) ) ( not ( = ?auto_54010 ?auto_54012 ) ) ( not ( = ?auto_54005 ?auto_54012 ) ) ( not ( = ?auto_54003 ?auto_54012 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_53999 ?auto_54012 ?auto_54008 )
      ( MAKE-ON ?auto_53995 ?auto_53996 )
      ( MAKE-ON-VERIFY ?auto_53995 ?auto_53996 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54013 - SURFACE
      ?auto_54014 - SURFACE
    )
    :vars
    (
      ?auto_54019 - HOIST
      ?auto_54030 - PLACE
      ?auto_54027 - PLACE
      ?auto_54022 - HOIST
      ?auto_54020 - SURFACE
      ?auto_54023 - SURFACE
      ?auto_54024 - PLACE
      ?auto_54028 - HOIST
      ?auto_54015 - SURFACE
      ?auto_54016 - SURFACE
      ?auto_54021 - PLACE
      ?auto_54018 - HOIST
      ?auto_54029 - SURFACE
      ?auto_54025 - SURFACE
      ?auto_54017 - TRUCK
      ?auto_54026 - PLACE
      ?auto_54031 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_54019 ?auto_54030 ) ( IS-CRATE ?auto_54013 ) ( not ( = ?auto_54013 ?auto_54014 ) ) ( not ( = ?auto_54027 ?auto_54030 ) ) ( HOIST-AT ?auto_54022 ?auto_54027 ) ( not ( = ?auto_54019 ?auto_54022 ) ) ( AVAILABLE ?auto_54022 ) ( SURFACE-AT ?auto_54013 ?auto_54027 ) ( ON ?auto_54013 ?auto_54020 ) ( CLEAR ?auto_54013 ) ( not ( = ?auto_54013 ?auto_54020 ) ) ( not ( = ?auto_54014 ?auto_54020 ) ) ( IS-CRATE ?auto_54014 ) ( not ( = ?auto_54013 ?auto_54023 ) ) ( not ( = ?auto_54014 ?auto_54023 ) ) ( not ( = ?auto_54020 ?auto_54023 ) ) ( not ( = ?auto_54024 ?auto_54030 ) ) ( not ( = ?auto_54027 ?auto_54024 ) ) ( HOIST-AT ?auto_54028 ?auto_54024 ) ( not ( = ?auto_54019 ?auto_54028 ) ) ( not ( = ?auto_54022 ?auto_54028 ) ) ( AVAILABLE ?auto_54028 ) ( SURFACE-AT ?auto_54014 ?auto_54024 ) ( ON ?auto_54014 ?auto_54015 ) ( CLEAR ?auto_54014 ) ( not ( = ?auto_54013 ?auto_54015 ) ) ( not ( = ?auto_54014 ?auto_54015 ) ) ( not ( = ?auto_54020 ?auto_54015 ) ) ( not ( = ?auto_54023 ?auto_54015 ) ) ( IS-CRATE ?auto_54023 ) ( not ( = ?auto_54013 ?auto_54016 ) ) ( not ( = ?auto_54014 ?auto_54016 ) ) ( not ( = ?auto_54020 ?auto_54016 ) ) ( not ( = ?auto_54023 ?auto_54016 ) ) ( not ( = ?auto_54015 ?auto_54016 ) ) ( not ( = ?auto_54021 ?auto_54030 ) ) ( not ( = ?auto_54027 ?auto_54021 ) ) ( not ( = ?auto_54024 ?auto_54021 ) ) ( HOIST-AT ?auto_54018 ?auto_54021 ) ( not ( = ?auto_54019 ?auto_54018 ) ) ( not ( = ?auto_54022 ?auto_54018 ) ) ( not ( = ?auto_54028 ?auto_54018 ) ) ( AVAILABLE ?auto_54018 ) ( SURFACE-AT ?auto_54023 ?auto_54021 ) ( ON ?auto_54023 ?auto_54029 ) ( CLEAR ?auto_54023 ) ( not ( = ?auto_54013 ?auto_54029 ) ) ( not ( = ?auto_54014 ?auto_54029 ) ) ( not ( = ?auto_54020 ?auto_54029 ) ) ( not ( = ?auto_54023 ?auto_54029 ) ) ( not ( = ?auto_54015 ?auto_54029 ) ) ( not ( = ?auto_54016 ?auto_54029 ) ) ( SURFACE-AT ?auto_54025 ?auto_54030 ) ( CLEAR ?auto_54025 ) ( IS-CRATE ?auto_54016 ) ( not ( = ?auto_54013 ?auto_54025 ) ) ( not ( = ?auto_54014 ?auto_54025 ) ) ( not ( = ?auto_54020 ?auto_54025 ) ) ( not ( = ?auto_54023 ?auto_54025 ) ) ( not ( = ?auto_54015 ?auto_54025 ) ) ( not ( = ?auto_54016 ?auto_54025 ) ) ( not ( = ?auto_54029 ?auto_54025 ) ) ( AVAILABLE ?auto_54019 ) ( TRUCK-AT ?auto_54017 ?auto_54026 ) ( not ( = ?auto_54026 ?auto_54030 ) ) ( not ( = ?auto_54027 ?auto_54026 ) ) ( not ( = ?auto_54024 ?auto_54026 ) ) ( not ( = ?auto_54021 ?auto_54026 ) ) ( HOIST-AT ?auto_54031 ?auto_54026 ) ( LIFTING ?auto_54031 ?auto_54016 ) ( not ( = ?auto_54019 ?auto_54031 ) ) ( not ( = ?auto_54022 ?auto_54031 ) ) ( not ( = ?auto_54028 ?auto_54031 ) ) ( not ( = ?auto_54018 ?auto_54031 ) ) )
    :subtasks
    ( ( !LOAD ?auto_54031 ?auto_54016 ?auto_54017 ?auto_54026 )
      ( MAKE-ON ?auto_54013 ?auto_54014 )
      ( MAKE-ON-VERIFY ?auto_54013 ?auto_54014 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54032 - SURFACE
      ?auto_54033 - SURFACE
    )
    :vars
    (
      ?auto_54047 - HOIST
      ?auto_54044 - PLACE
      ?auto_54036 - PLACE
      ?auto_54040 - HOIST
      ?auto_54037 - SURFACE
      ?auto_54045 - SURFACE
      ?auto_54050 - PLACE
      ?auto_54046 - HOIST
      ?auto_54042 - SURFACE
      ?auto_54041 - SURFACE
      ?auto_54038 - PLACE
      ?auto_54034 - HOIST
      ?auto_54043 - SURFACE
      ?auto_54048 - SURFACE
      ?auto_54039 - TRUCK
      ?auto_54049 - PLACE
      ?auto_54035 - HOIST
      ?auto_54051 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54047 ?auto_54044 ) ( IS-CRATE ?auto_54032 ) ( not ( = ?auto_54032 ?auto_54033 ) ) ( not ( = ?auto_54036 ?auto_54044 ) ) ( HOIST-AT ?auto_54040 ?auto_54036 ) ( not ( = ?auto_54047 ?auto_54040 ) ) ( AVAILABLE ?auto_54040 ) ( SURFACE-AT ?auto_54032 ?auto_54036 ) ( ON ?auto_54032 ?auto_54037 ) ( CLEAR ?auto_54032 ) ( not ( = ?auto_54032 ?auto_54037 ) ) ( not ( = ?auto_54033 ?auto_54037 ) ) ( IS-CRATE ?auto_54033 ) ( not ( = ?auto_54032 ?auto_54045 ) ) ( not ( = ?auto_54033 ?auto_54045 ) ) ( not ( = ?auto_54037 ?auto_54045 ) ) ( not ( = ?auto_54050 ?auto_54044 ) ) ( not ( = ?auto_54036 ?auto_54050 ) ) ( HOIST-AT ?auto_54046 ?auto_54050 ) ( not ( = ?auto_54047 ?auto_54046 ) ) ( not ( = ?auto_54040 ?auto_54046 ) ) ( AVAILABLE ?auto_54046 ) ( SURFACE-AT ?auto_54033 ?auto_54050 ) ( ON ?auto_54033 ?auto_54042 ) ( CLEAR ?auto_54033 ) ( not ( = ?auto_54032 ?auto_54042 ) ) ( not ( = ?auto_54033 ?auto_54042 ) ) ( not ( = ?auto_54037 ?auto_54042 ) ) ( not ( = ?auto_54045 ?auto_54042 ) ) ( IS-CRATE ?auto_54045 ) ( not ( = ?auto_54032 ?auto_54041 ) ) ( not ( = ?auto_54033 ?auto_54041 ) ) ( not ( = ?auto_54037 ?auto_54041 ) ) ( not ( = ?auto_54045 ?auto_54041 ) ) ( not ( = ?auto_54042 ?auto_54041 ) ) ( not ( = ?auto_54038 ?auto_54044 ) ) ( not ( = ?auto_54036 ?auto_54038 ) ) ( not ( = ?auto_54050 ?auto_54038 ) ) ( HOIST-AT ?auto_54034 ?auto_54038 ) ( not ( = ?auto_54047 ?auto_54034 ) ) ( not ( = ?auto_54040 ?auto_54034 ) ) ( not ( = ?auto_54046 ?auto_54034 ) ) ( AVAILABLE ?auto_54034 ) ( SURFACE-AT ?auto_54045 ?auto_54038 ) ( ON ?auto_54045 ?auto_54043 ) ( CLEAR ?auto_54045 ) ( not ( = ?auto_54032 ?auto_54043 ) ) ( not ( = ?auto_54033 ?auto_54043 ) ) ( not ( = ?auto_54037 ?auto_54043 ) ) ( not ( = ?auto_54045 ?auto_54043 ) ) ( not ( = ?auto_54042 ?auto_54043 ) ) ( not ( = ?auto_54041 ?auto_54043 ) ) ( SURFACE-AT ?auto_54048 ?auto_54044 ) ( CLEAR ?auto_54048 ) ( IS-CRATE ?auto_54041 ) ( not ( = ?auto_54032 ?auto_54048 ) ) ( not ( = ?auto_54033 ?auto_54048 ) ) ( not ( = ?auto_54037 ?auto_54048 ) ) ( not ( = ?auto_54045 ?auto_54048 ) ) ( not ( = ?auto_54042 ?auto_54048 ) ) ( not ( = ?auto_54041 ?auto_54048 ) ) ( not ( = ?auto_54043 ?auto_54048 ) ) ( AVAILABLE ?auto_54047 ) ( TRUCK-AT ?auto_54039 ?auto_54049 ) ( not ( = ?auto_54049 ?auto_54044 ) ) ( not ( = ?auto_54036 ?auto_54049 ) ) ( not ( = ?auto_54050 ?auto_54049 ) ) ( not ( = ?auto_54038 ?auto_54049 ) ) ( HOIST-AT ?auto_54035 ?auto_54049 ) ( not ( = ?auto_54047 ?auto_54035 ) ) ( not ( = ?auto_54040 ?auto_54035 ) ) ( not ( = ?auto_54046 ?auto_54035 ) ) ( not ( = ?auto_54034 ?auto_54035 ) ) ( AVAILABLE ?auto_54035 ) ( SURFACE-AT ?auto_54041 ?auto_54049 ) ( ON ?auto_54041 ?auto_54051 ) ( CLEAR ?auto_54041 ) ( not ( = ?auto_54032 ?auto_54051 ) ) ( not ( = ?auto_54033 ?auto_54051 ) ) ( not ( = ?auto_54037 ?auto_54051 ) ) ( not ( = ?auto_54045 ?auto_54051 ) ) ( not ( = ?auto_54042 ?auto_54051 ) ) ( not ( = ?auto_54041 ?auto_54051 ) ) ( not ( = ?auto_54043 ?auto_54051 ) ) ( not ( = ?auto_54048 ?auto_54051 ) ) )
    :subtasks
    ( ( !LIFT ?auto_54035 ?auto_54041 ?auto_54051 ?auto_54049 )
      ( MAKE-ON ?auto_54032 ?auto_54033 )
      ( MAKE-ON-VERIFY ?auto_54032 ?auto_54033 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54052 - SURFACE
      ?auto_54053 - SURFACE
    )
    :vars
    (
      ?auto_54060 - HOIST
      ?auto_54057 - PLACE
      ?auto_54066 - PLACE
      ?auto_54071 - HOIST
      ?auto_54068 - SURFACE
      ?auto_54056 - SURFACE
      ?auto_54059 - PLACE
      ?auto_54058 - HOIST
      ?auto_54062 - SURFACE
      ?auto_54065 - SURFACE
      ?auto_54069 - PLACE
      ?auto_54063 - HOIST
      ?auto_54055 - SURFACE
      ?auto_54070 - SURFACE
      ?auto_54054 - PLACE
      ?auto_54067 - HOIST
      ?auto_54061 - SURFACE
      ?auto_54064 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54060 ?auto_54057 ) ( IS-CRATE ?auto_54052 ) ( not ( = ?auto_54052 ?auto_54053 ) ) ( not ( = ?auto_54066 ?auto_54057 ) ) ( HOIST-AT ?auto_54071 ?auto_54066 ) ( not ( = ?auto_54060 ?auto_54071 ) ) ( AVAILABLE ?auto_54071 ) ( SURFACE-AT ?auto_54052 ?auto_54066 ) ( ON ?auto_54052 ?auto_54068 ) ( CLEAR ?auto_54052 ) ( not ( = ?auto_54052 ?auto_54068 ) ) ( not ( = ?auto_54053 ?auto_54068 ) ) ( IS-CRATE ?auto_54053 ) ( not ( = ?auto_54052 ?auto_54056 ) ) ( not ( = ?auto_54053 ?auto_54056 ) ) ( not ( = ?auto_54068 ?auto_54056 ) ) ( not ( = ?auto_54059 ?auto_54057 ) ) ( not ( = ?auto_54066 ?auto_54059 ) ) ( HOIST-AT ?auto_54058 ?auto_54059 ) ( not ( = ?auto_54060 ?auto_54058 ) ) ( not ( = ?auto_54071 ?auto_54058 ) ) ( AVAILABLE ?auto_54058 ) ( SURFACE-AT ?auto_54053 ?auto_54059 ) ( ON ?auto_54053 ?auto_54062 ) ( CLEAR ?auto_54053 ) ( not ( = ?auto_54052 ?auto_54062 ) ) ( not ( = ?auto_54053 ?auto_54062 ) ) ( not ( = ?auto_54068 ?auto_54062 ) ) ( not ( = ?auto_54056 ?auto_54062 ) ) ( IS-CRATE ?auto_54056 ) ( not ( = ?auto_54052 ?auto_54065 ) ) ( not ( = ?auto_54053 ?auto_54065 ) ) ( not ( = ?auto_54068 ?auto_54065 ) ) ( not ( = ?auto_54056 ?auto_54065 ) ) ( not ( = ?auto_54062 ?auto_54065 ) ) ( not ( = ?auto_54069 ?auto_54057 ) ) ( not ( = ?auto_54066 ?auto_54069 ) ) ( not ( = ?auto_54059 ?auto_54069 ) ) ( HOIST-AT ?auto_54063 ?auto_54069 ) ( not ( = ?auto_54060 ?auto_54063 ) ) ( not ( = ?auto_54071 ?auto_54063 ) ) ( not ( = ?auto_54058 ?auto_54063 ) ) ( AVAILABLE ?auto_54063 ) ( SURFACE-AT ?auto_54056 ?auto_54069 ) ( ON ?auto_54056 ?auto_54055 ) ( CLEAR ?auto_54056 ) ( not ( = ?auto_54052 ?auto_54055 ) ) ( not ( = ?auto_54053 ?auto_54055 ) ) ( not ( = ?auto_54068 ?auto_54055 ) ) ( not ( = ?auto_54056 ?auto_54055 ) ) ( not ( = ?auto_54062 ?auto_54055 ) ) ( not ( = ?auto_54065 ?auto_54055 ) ) ( SURFACE-AT ?auto_54070 ?auto_54057 ) ( CLEAR ?auto_54070 ) ( IS-CRATE ?auto_54065 ) ( not ( = ?auto_54052 ?auto_54070 ) ) ( not ( = ?auto_54053 ?auto_54070 ) ) ( not ( = ?auto_54068 ?auto_54070 ) ) ( not ( = ?auto_54056 ?auto_54070 ) ) ( not ( = ?auto_54062 ?auto_54070 ) ) ( not ( = ?auto_54065 ?auto_54070 ) ) ( not ( = ?auto_54055 ?auto_54070 ) ) ( AVAILABLE ?auto_54060 ) ( not ( = ?auto_54054 ?auto_54057 ) ) ( not ( = ?auto_54066 ?auto_54054 ) ) ( not ( = ?auto_54059 ?auto_54054 ) ) ( not ( = ?auto_54069 ?auto_54054 ) ) ( HOIST-AT ?auto_54067 ?auto_54054 ) ( not ( = ?auto_54060 ?auto_54067 ) ) ( not ( = ?auto_54071 ?auto_54067 ) ) ( not ( = ?auto_54058 ?auto_54067 ) ) ( not ( = ?auto_54063 ?auto_54067 ) ) ( AVAILABLE ?auto_54067 ) ( SURFACE-AT ?auto_54065 ?auto_54054 ) ( ON ?auto_54065 ?auto_54061 ) ( CLEAR ?auto_54065 ) ( not ( = ?auto_54052 ?auto_54061 ) ) ( not ( = ?auto_54053 ?auto_54061 ) ) ( not ( = ?auto_54068 ?auto_54061 ) ) ( not ( = ?auto_54056 ?auto_54061 ) ) ( not ( = ?auto_54062 ?auto_54061 ) ) ( not ( = ?auto_54065 ?auto_54061 ) ) ( not ( = ?auto_54055 ?auto_54061 ) ) ( not ( = ?auto_54070 ?auto_54061 ) ) ( TRUCK-AT ?auto_54064 ?auto_54057 ) )
    :subtasks
    ( ( !DRIVE ?auto_54064 ?auto_54057 ?auto_54054 )
      ( MAKE-ON ?auto_54052 ?auto_54053 )
      ( MAKE-ON-VERIFY ?auto_54052 ?auto_54053 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54072 - SURFACE
      ?auto_54073 - SURFACE
    )
    :vars
    (
      ?auto_54074 - HOIST
      ?auto_54080 - PLACE
      ?auto_54075 - PLACE
      ?auto_54085 - HOIST
      ?auto_54087 - SURFACE
      ?auto_54082 - SURFACE
      ?auto_54078 - PLACE
      ?auto_54091 - HOIST
      ?auto_54079 - SURFACE
      ?auto_54090 - SURFACE
      ?auto_54086 - PLACE
      ?auto_54088 - HOIST
      ?auto_54076 - SURFACE
      ?auto_54084 - SURFACE
      ?auto_54077 - PLACE
      ?auto_54081 - HOIST
      ?auto_54083 - SURFACE
      ?auto_54089 - TRUCK
      ?auto_54092 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54074 ?auto_54080 ) ( IS-CRATE ?auto_54072 ) ( not ( = ?auto_54072 ?auto_54073 ) ) ( not ( = ?auto_54075 ?auto_54080 ) ) ( HOIST-AT ?auto_54085 ?auto_54075 ) ( not ( = ?auto_54074 ?auto_54085 ) ) ( AVAILABLE ?auto_54085 ) ( SURFACE-AT ?auto_54072 ?auto_54075 ) ( ON ?auto_54072 ?auto_54087 ) ( CLEAR ?auto_54072 ) ( not ( = ?auto_54072 ?auto_54087 ) ) ( not ( = ?auto_54073 ?auto_54087 ) ) ( IS-CRATE ?auto_54073 ) ( not ( = ?auto_54072 ?auto_54082 ) ) ( not ( = ?auto_54073 ?auto_54082 ) ) ( not ( = ?auto_54087 ?auto_54082 ) ) ( not ( = ?auto_54078 ?auto_54080 ) ) ( not ( = ?auto_54075 ?auto_54078 ) ) ( HOIST-AT ?auto_54091 ?auto_54078 ) ( not ( = ?auto_54074 ?auto_54091 ) ) ( not ( = ?auto_54085 ?auto_54091 ) ) ( AVAILABLE ?auto_54091 ) ( SURFACE-AT ?auto_54073 ?auto_54078 ) ( ON ?auto_54073 ?auto_54079 ) ( CLEAR ?auto_54073 ) ( not ( = ?auto_54072 ?auto_54079 ) ) ( not ( = ?auto_54073 ?auto_54079 ) ) ( not ( = ?auto_54087 ?auto_54079 ) ) ( not ( = ?auto_54082 ?auto_54079 ) ) ( IS-CRATE ?auto_54082 ) ( not ( = ?auto_54072 ?auto_54090 ) ) ( not ( = ?auto_54073 ?auto_54090 ) ) ( not ( = ?auto_54087 ?auto_54090 ) ) ( not ( = ?auto_54082 ?auto_54090 ) ) ( not ( = ?auto_54079 ?auto_54090 ) ) ( not ( = ?auto_54086 ?auto_54080 ) ) ( not ( = ?auto_54075 ?auto_54086 ) ) ( not ( = ?auto_54078 ?auto_54086 ) ) ( HOIST-AT ?auto_54088 ?auto_54086 ) ( not ( = ?auto_54074 ?auto_54088 ) ) ( not ( = ?auto_54085 ?auto_54088 ) ) ( not ( = ?auto_54091 ?auto_54088 ) ) ( AVAILABLE ?auto_54088 ) ( SURFACE-AT ?auto_54082 ?auto_54086 ) ( ON ?auto_54082 ?auto_54076 ) ( CLEAR ?auto_54082 ) ( not ( = ?auto_54072 ?auto_54076 ) ) ( not ( = ?auto_54073 ?auto_54076 ) ) ( not ( = ?auto_54087 ?auto_54076 ) ) ( not ( = ?auto_54082 ?auto_54076 ) ) ( not ( = ?auto_54079 ?auto_54076 ) ) ( not ( = ?auto_54090 ?auto_54076 ) ) ( IS-CRATE ?auto_54090 ) ( not ( = ?auto_54072 ?auto_54084 ) ) ( not ( = ?auto_54073 ?auto_54084 ) ) ( not ( = ?auto_54087 ?auto_54084 ) ) ( not ( = ?auto_54082 ?auto_54084 ) ) ( not ( = ?auto_54079 ?auto_54084 ) ) ( not ( = ?auto_54090 ?auto_54084 ) ) ( not ( = ?auto_54076 ?auto_54084 ) ) ( not ( = ?auto_54077 ?auto_54080 ) ) ( not ( = ?auto_54075 ?auto_54077 ) ) ( not ( = ?auto_54078 ?auto_54077 ) ) ( not ( = ?auto_54086 ?auto_54077 ) ) ( HOIST-AT ?auto_54081 ?auto_54077 ) ( not ( = ?auto_54074 ?auto_54081 ) ) ( not ( = ?auto_54085 ?auto_54081 ) ) ( not ( = ?auto_54091 ?auto_54081 ) ) ( not ( = ?auto_54088 ?auto_54081 ) ) ( AVAILABLE ?auto_54081 ) ( SURFACE-AT ?auto_54090 ?auto_54077 ) ( ON ?auto_54090 ?auto_54083 ) ( CLEAR ?auto_54090 ) ( not ( = ?auto_54072 ?auto_54083 ) ) ( not ( = ?auto_54073 ?auto_54083 ) ) ( not ( = ?auto_54087 ?auto_54083 ) ) ( not ( = ?auto_54082 ?auto_54083 ) ) ( not ( = ?auto_54079 ?auto_54083 ) ) ( not ( = ?auto_54090 ?auto_54083 ) ) ( not ( = ?auto_54076 ?auto_54083 ) ) ( not ( = ?auto_54084 ?auto_54083 ) ) ( TRUCK-AT ?auto_54089 ?auto_54080 ) ( SURFACE-AT ?auto_54092 ?auto_54080 ) ( CLEAR ?auto_54092 ) ( LIFTING ?auto_54074 ?auto_54084 ) ( IS-CRATE ?auto_54084 ) ( not ( = ?auto_54072 ?auto_54092 ) ) ( not ( = ?auto_54073 ?auto_54092 ) ) ( not ( = ?auto_54087 ?auto_54092 ) ) ( not ( = ?auto_54082 ?auto_54092 ) ) ( not ( = ?auto_54079 ?auto_54092 ) ) ( not ( = ?auto_54090 ?auto_54092 ) ) ( not ( = ?auto_54076 ?auto_54092 ) ) ( not ( = ?auto_54084 ?auto_54092 ) ) ( not ( = ?auto_54083 ?auto_54092 ) ) )
    :subtasks
    ( ( !DROP ?auto_54074 ?auto_54084 ?auto_54092 ?auto_54080 )
      ( MAKE-ON ?auto_54072 ?auto_54073 )
      ( MAKE-ON-VERIFY ?auto_54072 ?auto_54073 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54093 - SURFACE
      ?auto_54094 - SURFACE
    )
    :vars
    (
      ?auto_54097 - HOIST
      ?auto_54108 - PLACE
      ?auto_54109 - PLACE
      ?auto_54113 - HOIST
      ?auto_54111 - SURFACE
      ?auto_54095 - SURFACE
      ?auto_54105 - PLACE
      ?auto_54099 - HOIST
      ?auto_54106 - SURFACE
      ?auto_54098 - SURFACE
      ?auto_54100 - PLACE
      ?auto_54101 - HOIST
      ?auto_54103 - SURFACE
      ?auto_54110 - SURFACE
      ?auto_54104 - PLACE
      ?auto_54112 - HOIST
      ?auto_54102 - SURFACE
      ?auto_54107 - TRUCK
      ?auto_54096 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54097 ?auto_54108 ) ( IS-CRATE ?auto_54093 ) ( not ( = ?auto_54093 ?auto_54094 ) ) ( not ( = ?auto_54109 ?auto_54108 ) ) ( HOIST-AT ?auto_54113 ?auto_54109 ) ( not ( = ?auto_54097 ?auto_54113 ) ) ( AVAILABLE ?auto_54113 ) ( SURFACE-AT ?auto_54093 ?auto_54109 ) ( ON ?auto_54093 ?auto_54111 ) ( CLEAR ?auto_54093 ) ( not ( = ?auto_54093 ?auto_54111 ) ) ( not ( = ?auto_54094 ?auto_54111 ) ) ( IS-CRATE ?auto_54094 ) ( not ( = ?auto_54093 ?auto_54095 ) ) ( not ( = ?auto_54094 ?auto_54095 ) ) ( not ( = ?auto_54111 ?auto_54095 ) ) ( not ( = ?auto_54105 ?auto_54108 ) ) ( not ( = ?auto_54109 ?auto_54105 ) ) ( HOIST-AT ?auto_54099 ?auto_54105 ) ( not ( = ?auto_54097 ?auto_54099 ) ) ( not ( = ?auto_54113 ?auto_54099 ) ) ( AVAILABLE ?auto_54099 ) ( SURFACE-AT ?auto_54094 ?auto_54105 ) ( ON ?auto_54094 ?auto_54106 ) ( CLEAR ?auto_54094 ) ( not ( = ?auto_54093 ?auto_54106 ) ) ( not ( = ?auto_54094 ?auto_54106 ) ) ( not ( = ?auto_54111 ?auto_54106 ) ) ( not ( = ?auto_54095 ?auto_54106 ) ) ( IS-CRATE ?auto_54095 ) ( not ( = ?auto_54093 ?auto_54098 ) ) ( not ( = ?auto_54094 ?auto_54098 ) ) ( not ( = ?auto_54111 ?auto_54098 ) ) ( not ( = ?auto_54095 ?auto_54098 ) ) ( not ( = ?auto_54106 ?auto_54098 ) ) ( not ( = ?auto_54100 ?auto_54108 ) ) ( not ( = ?auto_54109 ?auto_54100 ) ) ( not ( = ?auto_54105 ?auto_54100 ) ) ( HOIST-AT ?auto_54101 ?auto_54100 ) ( not ( = ?auto_54097 ?auto_54101 ) ) ( not ( = ?auto_54113 ?auto_54101 ) ) ( not ( = ?auto_54099 ?auto_54101 ) ) ( AVAILABLE ?auto_54101 ) ( SURFACE-AT ?auto_54095 ?auto_54100 ) ( ON ?auto_54095 ?auto_54103 ) ( CLEAR ?auto_54095 ) ( not ( = ?auto_54093 ?auto_54103 ) ) ( not ( = ?auto_54094 ?auto_54103 ) ) ( not ( = ?auto_54111 ?auto_54103 ) ) ( not ( = ?auto_54095 ?auto_54103 ) ) ( not ( = ?auto_54106 ?auto_54103 ) ) ( not ( = ?auto_54098 ?auto_54103 ) ) ( IS-CRATE ?auto_54098 ) ( not ( = ?auto_54093 ?auto_54110 ) ) ( not ( = ?auto_54094 ?auto_54110 ) ) ( not ( = ?auto_54111 ?auto_54110 ) ) ( not ( = ?auto_54095 ?auto_54110 ) ) ( not ( = ?auto_54106 ?auto_54110 ) ) ( not ( = ?auto_54098 ?auto_54110 ) ) ( not ( = ?auto_54103 ?auto_54110 ) ) ( not ( = ?auto_54104 ?auto_54108 ) ) ( not ( = ?auto_54109 ?auto_54104 ) ) ( not ( = ?auto_54105 ?auto_54104 ) ) ( not ( = ?auto_54100 ?auto_54104 ) ) ( HOIST-AT ?auto_54112 ?auto_54104 ) ( not ( = ?auto_54097 ?auto_54112 ) ) ( not ( = ?auto_54113 ?auto_54112 ) ) ( not ( = ?auto_54099 ?auto_54112 ) ) ( not ( = ?auto_54101 ?auto_54112 ) ) ( AVAILABLE ?auto_54112 ) ( SURFACE-AT ?auto_54098 ?auto_54104 ) ( ON ?auto_54098 ?auto_54102 ) ( CLEAR ?auto_54098 ) ( not ( = ?auto_54093 ?auto_54102 ) ) ( not ( = ?auto_54094 ?auto_54102 ) ) ( not ( = ?auto_54111 ?auto_54102 ) ) ( not ( = ?auto_54095 ?auto_54102 ) ) ( not ( = ?auto_54106 ?auto_54102 ) ) ( not ( = ?auto_54098 ?auto_54102 ) ) ( not ( = ?auto_54103 ?auto_54102 ) ) ( not ( = ?auto_54110 ?auto_54102 ) ) ( TRUCK-AT ?auto_54107 ?auto_54108 ) ( SURFACE-AT ?auto_54096 ?auto_54108 ) ( CLEAR ?auto_54096 ) ( IS-CRATE ?auto_54110 ) ( not ( = ?auto_54093 ?auto_54096 ) ) ( not ( = ?auto_54094 ?auto_54096 ) ) ( not ( = ?auto_54111 ?auto_54096 ) ) ( not ( = ?auto_54095 ?auto_54096 ) ) ( not ( = ?auto_54106 ?auto_54096 ) ) ( not ( = ?auto_54098 ?auto_54096 ) ) ( not ( = ?auto_54103 ?auto_54096 ) ) ( not ( = ?auto_54110 ?auto_54096 ) ) ( not ( = ?auto_54102 ?auto_54096 ) ) ( AVAILABLE ?auto_54097 ) ( IN ?auto_54110 ?auto_54107 ) )
    :subtasks
    ( ( !UNLOAD ?auto_54097 ?auto_54110 ?auto_54107 ?auto_54108 )
      ( MAKE-ON ?auto_54093 ?auto_54094 )
      ( MAKE-ON-VERIFY ?auto_54093 ?auto_54094 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54114 - SURFACE
      ?auto_54115 - SURFACE
    )
    :vars
    (
      ?auto_54128 - HOIST
      ?auto_54130 - PLACE
      ?auto_54134 - PLACE
      ?auto_54118 - HOIST
      ?auto_54116 - SURFACE
      ?auto_54133 - SURFACE
      ?auto_54124 - PLACE
      ?auto_54126 - HOIST
      ?auto_54122 - SURFACE
      ?auto_54129 - SURFACE
      ?auto_54131 - PLACE
      ?auto_54132 - HOIST
      ?auto_54121 - SURFACE
      ?auto_54119 - SURFACE
      ?auto_54125 - PLACE
      ?auto_54117 - HOIST
      ?auto_54123 - SURFACE
      ?auto_54127 - SURFACE
      ?auto_54120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54128 ?auto_54130 ) ( IS-CRATE ?auto_54114 ) ( not ( = ?auto_54114 ?auto_54115 ) ) ( not ( = ?auto_54134 ?auto_54130 ) ) ( HOIST-AT ?auto_54118 ?auto_54134 ) ( not ( = ?auto_54128 ?auto_54118 ) ) ( AVAILABLE ?auto_54118 ) ( SURFACE-AT ?auto_54114 ?auto_54134 ) ( ON ?auto_54114 ?auto_54116 ) ( CLEAR ?auto_54114 ) ( not ( = ?auto_54114 ?auto_54116 ) ) ( not ( = ?auto_54115 ?auto_54116 ) ) ( IS-CRATE ?auto_54115 ) ( not ( = ?auto_54114 ?auto_54133 ) ) ( not ( = ?auto_54115 ?auto_54133 ) ) ( not ( = ?auto_54116 ?auto_54133 ) ) ( not ( = ?auto_54124 ?auto_54130 ) ) ( not ( = ?auto_54134 ?auto_54124 ) ) ( HOIST-AT ?auto_54126 ?auto_54124 ) ( not ( = ?auto_54128 ?auto_54126 ) ) ( not ( = ?auto_54118 ?auto_54126 ) ) ( AVAILABLE ?auto_54126 ) ( SURFACE-AT ?auto_54115 ?auto_54124 ) ( ON ?auto_54115 ?auto_54122 ) ( CLEAR ?auto_54115 ) ( not ( = ?auto_54114 ?auto_54122 ) ) ( not ( = ?auto_54115 ?auto_54122 ) ) ( not ( = ?auto_54116 ?auto_54122 ) ) ( not ( = ?auto_54133 ?auto_54122 ) ) ( IS-CRATE ?auto_54133 ) ( not ( = ?auto_54114 ?auto_54129 ) ) ( not ( = ?auto_54115 ?auto_54129 ) ) ( not ( = ?auto_54116 ?auto_54129 ) ) ( not ( = ?auto_54133 ?auto_54129 ) ) ( not ( = ?auto_54122 ?auto_54129 ) ) ( not ( = ?auto_54131 ?auto_54130 ) ) ( not ( = ?auto_54134 ?auto_54131 ) ) ( not ( = ?auto_54124 ?auto_54131 ) ) ( HOIST-AT ?auto_54132 ?auto_54131 ) ( not ( = ?auto_54128 ?auto_54132 ) ) ( not ( = ?auto_54118 ?auto_54132 ) ) ( not ( = ?auto_54126 ?auto_54132 ) ) ( AVAILABLE ?auto_54132 ) ( SURFACE-AT ?auto_54133 ?auto_54131 ) ( ON ?auto_54133 ?auto_54121 ) ( CLEAR ?auto_54133 ) ( not ( = ?auto_54114 ?auto_54121 ) ) ( not ( = ?auto_54115 ?auto_54121 ) ) ( not ( = ?auto_54116 ?auto_54121 ) ) ( not ( = ?auto_54133 ?auto_54121 ) ) ( not ( = ?auto_54122 ?auto_54121 ) ) ( not ( = ?auto_54129 ?auto_54121 ) ) ( IS-CRATE ?auto_54129 ) ( not ( = ?auto_54114 ?auto_54119 ) ) ( not ( = ?auto_54115 ?auto_54119 ) ) ( not ( = ?auto_54116 ?auto_54119 ) ) ( not ( = ?auto_54133 ?auto_54119 ) ) ( not ( = ?auto_54122 ?auto_54119 ) ) ( not ( = ?auto_54129 ?auto_54119 ) ) ( not ( = ?auto_54121 ?auto_54119 ) ) ( not ( = ?auto_54125 ?auto_54130 ) ) ( not ( = ?auto_54134 ?auto_54125 ) ) ( not ( = ?auto_54124 ?auto_54125 ) ) ( not ( = ?auto_54131 ?auto_54125 ) ) ( HOIST-AT ?auto_54117 ?auto_54125 ) ( not ( = ?auto_54128 ?auto_54117 ) ) ( not ( = ?auto_54118 ?auto_54117 ) ) ( not ( = ?auto_54126 ?auto_54117 ) ) ( not ( = ?auto_54132 ?auto_54117 ) ) ( AVAILABLE ?auto_54117 ) ( SURFACE-AT ?auto_54129 ?auto_54125 ) ( ON ?auto_54129 ?auto_54123 ) ( CLEAR ?auto_54129 ) ( not ( = ?auto_54114 ?auto_54123 ) ) ( not ( = ?auto_54115 ?auto_54123 ) ) ( not ( = ?auto_54116 ?auto_54123 ) ) ( not ( = ?auto_54133 ?auto_54123 ) ) ( not ( = ?auto_54122 ?auto_54123 ) ) ( not ( = ?auto_54129 ?auto_54123 ) ) ( not ( = ?auto_54121 ?auto_54123 ) ) ( not ( = ?auto_54119 ?auto_54123 ) ) ( SURFACE-AT ?auto_54127 ?auto_54130 ) ( CLEAR ?auto_54127 ) ( IS-CRATE ?auto_54119 ) ( not ( = ?auto_54114 ?auto_54127 ) ) ( not ( = ?auto_54115 ?auto_54127 ) ) ( not ( = ?auto_54116 ?auto_54127 ) ) ( not ( = ?auto_54133 ?auto_54127 ) ) ( not ( = ?auto_54122 ?auto_54127 ) ) ( not ( = ?auto_54129 ?auto_54127 ) ) ( not ( = ?auto_54121 ?auto_54127 ) ) ( not ( = ?auto_54119 ?auto_54127 ) ) ( not ( = ?auto_54123 ?auto_54127 ) ) ( AVAILABLE ?auto_54128 ) ( IN ?auto_54119 ?auto_54120 ) ( TRUCK-AT ?auto_54120 ?auto_54124 ) )
    :subtasks
    ( ( !DRIVE ?auto_54120 ?auto_54124 ?auto_54130 )
      ( MAKE-ON ?auto_54114 ?auto_54115 )
      ( MAKE-ON-VERIFY ?auto_54114 ?auto_54115 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54135 - SURFACE
      ?auto_54136 - SURFACE
    )
    :vars
    (
      ?auto_54146 - HOIST
      ?auto_54144 - PLACE
      ?auto_54147 - PLACE
      ?auto_54149 - HOIST
      ?auto_54137 - SURFACE
      ?auto_54143 - SURFACE
      ?auto_54150 - PLACE
      ?auto_54152 - HOIST
      ?auto_54145 - SURFACE
      ?auto_54151 - SURFACE
      ?auto_54142 - PLACE
      ?auto_54138 - HOIST
      ?auto_54139 - SURFACE
      ?auto_54140 - SURFACE
      ?auto_54155 - PLACE
      ?auto_54153 - HOIST
      ?auto_54148 - SURFACE
      ?auto_54154 - SURFACE
      ?auto_54141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54146 ?auto_54144 ) ( IS-CRATE ?auto_54135 ) ( not ( = ?auto_54135 ?auto_54136 ) ) ( not ( = ?auto_54147 ?auto_54144 ) ) ( HOIST-AT ?auto_54149 ?auto_54147 ) ( not ( = ?auto_54146 ?auto_54149 ) ) ( AVAILABLE ?auto_54149 ) ( SURFACE-AT ?auto_54135 ?auto_54147 ) ( ON ?auto_54135 ?auto_54137 ) ( CLEAR ?auto_54135 ) ( not ( = ?auto_54135 ?auto_54137 ) ) ( not ( = ?auto_54136 ?auto_54137 ) ) ( IS-CRATE ?auto_54136 ) ( not ( = ?auto_54135 ?auto_54143 ) ) ( not ( = ?auto_54136 ?auto_54143 ) ) ( not ( = ?auto_54137 ?auto_54143 ) ) ( not ( = ?auto_54150 ?auto_54144 ) ) ( not ( = ?auto_54147 ?auto_54150 ) ) ( HOIST-AT ?auto_54152 ?auto_54150 ) ( not ( = ?auto_54146 ?auto_54152 ) ) ( not ( = ?auto_54149 ?auto_54152 ) ) ( SURFACE-AT ?auto_54136 ?auto_54150 ) ( ON ?auto_54136 ?auto_54145 ) ( CLEAR ?auto_54136 ) ( not ( = ?auto_54135 ?auto_54145 ) ) ( not ( = ?auto_54136 ?auto_54145 ) ) ( not ( = ?auto_54137 ?auto_54145 ) ) ( not ( = ?auto_54143 ?auto_54145 ) ) ( IS-CRATE ?auto_54143 ) ( not ( = ?auto_54135 ?auto_54151 ) ) ( not ( = ?auto_54136 ?auto_54151 ) ) ( not ( = ?auto_54137 ?auto_54151 ) ) ( not ( = ?auto_54143 ?auto_54151 ) ) ( not ( = ?auto_54145 ?auto_54151 ) ) ( not ( = ?auto_54142 ?auto_54144 ) ) ( not ( = ?auto_54147 ?auto_54142 ) ) ( not ( = ?auto_54150 ?auto_54142 ) ) ( HOIST-AT ?auto_54138 ?auto_54142 ) ( not ( = ?auto_54146 ?auto_54138 ) ) ( not ( = ?auto_54149 ?auto_54138 ) ) ( not ( = ?auto_54152 ?auto_54138 ) ) ( AVAILABLE ?auto_54138 ) ( SURFACE-AT ?auto_54143 ?auto_54142 ) ( ON ?auto_54143 ?auto_54139 ) ( CLEAR ?auto_54143 ) ( not ( = ?auto_54135 ?auto_54139 ) ) ( not ( = ?auto_54136 ?auto_54139 ) ) ( not ( = ?auto_54137 ?auto_54139 ) ) ( not ( = ?auto_54143 ?auto_54139 ) ) ( not ( = ?auto_54145 ?auto_54139 ) ) ( not ( = ?auto_54151 ?auto_54139 ) ) ( IS-CRATE ?auto_54151 ) ( not ( = ?auto_54135 ?auto_54140 ) ) ( not ( = ?auto_54136 ?auto_54140 ) ) ( not ( = ?auto_54137 ?auto_54140 ) ) ( not ( = ?auto_54143 ?auto_54140 ) ) ( not ( = ?auto_54145 ?auto_54140 ) ) ( not ( = ?auto_54151 ?auto_54140 ) ) ( not ( = ?auto_54139 ?auto_54140 ) ) ( not ( = ?auto_54155 ?auto_54144 ) ) ( not ( = ?auto_54147 ?auto_54155 ) ) ( not ( = ?auto_54150 ?auto_54155 ) ) ( not ( = ?auto_54142 ?auto_54155 ) ) ( HOIST-AT ?auto_54153 ?auto_54155 ) ( not ( = ?auto_54146 ?auto_54153 ) ) ( not ( = ?auto_54149 ?auto_54153 ) ) ( not ( = ?auto_54152 ?auto_54153 ) ) ( not ( = ?auto_54138 ?auto_54153 ) ) ( AVAILABLE ?auto_54153 ) ( SURFACE-AT ?auto_54151 ?auto_54155 ) ( ON ?auto_54151 ?auto_54148 ) ( CLEAR ?auto_54151 ) ( not ( = ?auto_54135 ?auto_54148 ) ) ( not ( = ?auto_54136 ?auto_54148 ) ) ( not ( = ?auto_54137 ?auto_54148 ) ) ( not ( = ?auto_54143 ?auto_54148 ) ) ( not ( = ?auto_54145 ?auto_54148 ) ) ( not ( = ?auto_54151 ?auto_54148 ) ) ( not ( = ?auto_54139 ?auto_54148 ) ) ( not ( = ?auto_54140 ?auto_54148 ) ) ( SURFACE-AT ?auto_54154 ?auto_54144 ) ( CLEAR ?auto_54154 ) ( IS-CRATE ?auto_54140 ) ( not ( = ?auto_54135 ?auto_54154 ) ) ( not ( = ?auto_54136 ?auto_54154 ) ) ( not ( = ?auto_54137 ?auto_54154 ) ) ( not ( = ?auto_54143 ?auto_54154 ) ) ( not ( = ?auto_54145 ?auto_54154 ) ) ( not ( = ?auto_54151 ?auto_54154 ) ) ( not ( = ?auto_54139 ?auto_54154 ) ) ( not ( = ?auto_54140 ?auto_54154 ) ) ( not ( = ?auto_54148 ?auto_54154 ) ) ( AVAILABLE ?auto_54146 ) ( TRUCK-AT ?auto_54141 ?auto_54150 ) ( LIFTING ?auto_54152 ?auto_54140 ) )
    :subtasks
    ( ( !LOAD ?auto_54152 ?auto_54140 ?auto_54141 ?auto_54150 )
      ( MAKE-ON ?auto_54135 ?auto_54136 )
      ( MAKE-ON-VERIFY ?auto_54135 ?auto_54136 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54156 - SURFACE
      ?auto_54157 - SURFACE
    )
    :vars
    (
      ?auto_54170 - HOIST
      ?auto_54161 - PLACE
      ?auto_54158 - PLACE
      ?auto_54172 - HOIST
      ?auto_54159 - SURFACE
      ?auto_54167 - SURFACE
      ?auto_54169 - PLACE
      ?auto_54160 - HOIST
      ?auto_54168 - SURFACE
      ?auto_54165 - SURFACE
      ?auto_54176 - PLACE
      ?auto_54175 - HOIST
      ?auto_54171 - SURFACE
      ?auto_54173 - SURFACE
      ?auto_54166 - PLACE
      ?auto_54162 - HOIST
      ?auto_54174 - SURFACE
      ?auto_54164 - SURFACE
      ?auto_54163 - TRUCK
      ?auto_54177 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54170 ?auto_54161 ) ( IS-CRATE ?auto_54156 ) ( not ( = ?auto_54156 ?auto_54157 ) ) ( not ( = ?auto_54158 ?auto_54161 ) ) ( HOIST-AT ?auto_54172 ?auto_54158 ) ( not ( = ?auto_54170 ?auto_54172 ) ) ( AVAILABLE ?auto_54172 ) ( SURFACE-AT ?auto_54156 ?auto_54158 ) ( ON ?auto_54156 ?auto_54159 ) ( CLEAR ?auto_54156 ) ( not ( = ?auto_54156 ?auto_54159 ) ) ( not ( = ?auto_54157 ?auto_54159 ) ) ( IS-CRATE ?auto_54157 ) ( not ( = ?auto_54156 ?auto_54167 ) ) ( not ( = ?auto_54157 ?auto_54167 ) ) ( not ( = ?auto_54159 ?auto_54167 ) ) ( not ( = ?auto_54169 ?auto_54161 ) ) ( not ( = ?auto_54158 ?auto_54169 ) ) ( HOIST-AT ?auto_54160 ?auto_54169 ) ( not ( = ?auto_54170 ?auto_54160 ) ) ( not ( = ?auto_54172 ?auto_54160 ) ) ( SURFACE-AT ?auto_54157 ?auto_54169 ) ( ON ?auto_54157 ?auto_54168 ) ( CLEAR ?auto_54157 ) ( not ( = ?auto_54156 ?auto_54168 ) ) ( not ( = ?auto_54157 ?auto_54168 ) ) ( not ( = ?auto_54159 ?auto_54168 ) ) ( not ( = ?auto_54167 ?auto_54168 ) ) ( IS-CRATE ?auto_54167 ) ( not ( = ?auto_54156 ?auto_54165 ) ) ( not ( = ?auto_54157 ?auto_54165 ) ) ( not ( = ?auto_54159 ?auto_54165 ) ) ( not ( = ?auto_54167 ?auto_54165 ) ) ( not ( = ?auto_54168 ?auto_54165 ) ) ( not ( = ?auto_54176 ?auto_54161 ) ) ( not ( = ?auto_54158 ?auto_54176 ) ) ( not ( = ?auto_54169 ?auto_54176 ) ) ( HOIST-AT ?auto_54175 ?auto_54176 ) ( not ( = ?auto_54170 ?auto_54175 ) ) ( not ( = ?auto_54172 ?auto_54175 ) ) ( not ( = ?auto_54160 ?auto_54175 ) ) ( AVAILABLE ?auto_54175 ) ( SURFACE-AT ?auto_54167 ?auto_54176 ) ( ON ?auto_54167 ?auto_54171 ) ( CLEAR ?auto_54167 ) ( not ( = ?auto_54156 ?auto_54171 ) ) ( not ( = ?auto_54157 ?auto_54171 ) ) ( not ( = ?auto_54159 ?auto_54171 ) ) ( not ( = ?auto_54167 ?auto_54171 ) ) ( not ( = ?auto_54168 ?auto_54171 ) ) ( not ( = ?auto_54165 ?auto_54171 ) ) ( IS-CRATE ?auto_54165 ) ( not ( = ?auto_54156 ?auto_54173 ) ) ( not ( = ?auto_54157 ?auto_54173 ) ) ( not ( = ?auto_54159 ?auto_54173 ) ) ( not ( = ?auto_54167 ?auto_54173 ) ) ( not ( = ?auto_54168 ?auto_54173 ) ) ( not ( = ?auto_54165 ?auto_54173 ) ) ( not ( = ?auto_54171 ?auto_54173 ) ) ( not ( = ?auto_54166 ?auto_54161 ) ) ( not ( = ?auto_54158 ?auto_54166 ) ) ( not ( = ?auto_54169 ?auto_54166 ) ) ( not ( = ?auto_54176 ?auto_54166 ) ) ( HOIST-AT ?auto_54162 ?auto_54166 ) ( not ( = ?auto_54170 ?auto_54162 ) ) ( not ( = ?auto_54172 ?auto_54162 ) ) ( not ( = ?auto_54160 ?auto_54162 ) ) ( not ( = ?auto_54175 ?auto_54162 ) ) ( AVAILABLE ?auto_54162 ) ( SURFACE-AT ?auto_54165 ?auto_54166 ) ( ON ?auto_54165 ?auto_54174 ) ( CLEAR ?auto_54165 ) ( not ( = ?auto_54156 ?auto_54174 ) ) ( not ( = ?auto_54157 ?auto_54174 ) ) ( not ( = ?auto_54159 ?auto_54174 ) ) ( not ( = ?auto_54167 ?auto_54174 ) ) ( not ( = ?auto_54168 ?auto_54174 ) ) ( not ( = ?auto_54165 ?auto_54174 ) ) ( not ( = ?auto_54171 ?auto_54174 ) ) ( not ( = ?auto_54173 ?auto_54174 ) ) ( SURFACE-AT ?auto_54164 ?auto_54161 ) ( CLEAR ?auto_54164 ) ( IS-CRATE ?auto_54173 ) ( not ( = ?auto_54156 ?auto_54164 ) ) ( not ( = ?auto_54157 ?auto_54164 ) ) ( not ( = ?auto_54159 ?auto_54164 ) ) ( not ( = ?auto_54167 ?auto_54164 ) ) ( not ( = ?auto_54168 ?auto_54164 ) ) ( not ( = ?auto_54165 ?auto_54164 ) ) ( not ( = ?auto_54171 ?auto_54164 ) ) ( not ( = ?auto_54173 ?auto_54164 ) ) ( not ( = ?auto_54174 ?auto_54164 ) ) ( AVAILABLE ?auto_54170 ) ( TRUCK-AT ?auto_54163 ?auto_54169 ) ( AVAILABLE ?auto_54160 ) ( SURFACE-AT ?auto_54173 ?auto_54169 ) ( ON ?auto_54173 ?auto_54177 ) ( CLEAR ?auto_54173 ) ( not ( = ?auto_54156 ?auto_54177 ) ) ( not ( = ?auto_54157 ?auto_54177 ) ) ( not ( = ?auto_54159 ?auto_54177 ) ) ( not ( = ?auto_54167 ?auto_54177 ) ) ( not ( = ?auto_54168 ?auto_54177 ) ) ( not ( = ?auto_54165 ?auto_54177 ) ) ( not ( = ?auto_54171 ?auto_54177 ) ) ( not ( = ?auto_54173 ?auto_54177 ) ) ( not ( = ?auto_54174 ?auto_54177 ) ) ( not ( = ?auto_54164 ?auto_54177 ) ) )
    :subtasks
    ( ( !LIFT ?auto_54160 ?auto_54173 ?auto_54177 ?auto_54169 )
      ( MAKE-ON ?auto_54156 ?auto_54157 )
      ( MAKE-ON-VERIFY ?auto_54156 ?auto_54157 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54178 - SURFACE
      ?auto_54179 - SURFACE
    )
    :vars
    (
      ?auto_54182 - HOIST
      ?auto_54183 - PLACE
      ?auto_54198 - PLACE
      ?auto_54190 - HOIST
      ?auto_54184 - SURFACE
      ?auto_54191 - SURFACE
      ?auto_54194 - PLACE
      ?auto_54199 - HOIST
      ?auto_54193 - SURFACE
      ?auto_54180 - SURFACE
      ?auto_54181 - PLACE
      ?auto_54189 - HOIST
      ?auto_54187 - SURFACE
      ?auto_54186 - SURFACE
      ?auto_54197 - PLACE
      ?auto_54195 - HOIST
      ?auto_54188 - SURFACE
      ?auto_54192 - SURFACE
      ?auto_54196 - SURFACE
      ?auto_54185 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54182 ?auto_54183 ) ( IS-CRATE ?auto_54178 ) ( not ( = ?auto_54178 ?auto_54179 ) ) ( not ( = ?auto_54198 ?auto_54183 ) ) ( HOIST-AT ?auto_54190 ?auto_54198 ) ( not ( = ?auto_54182 ?auto_54190 ) ) ( AVAILABLE ?auto_54190 ) ( SURFACE-AT ?auto_54178 ?auto_54198 ) ( ON ?auto_54178 ?auto_54184 ) ( CLEAR ?auto_54178 ) ( not ( = ?auto_54178 ?auto_54184 ) ) ( not ( = ?auto_54179 ?auto_54184 ) ) ( IS-CRATE ?auto_54179 ) ( not ( = ?auto_54178 ?auto_54191 ) ) ( not ( = ?auto_54179 ?auto_54191 ) ) ( not ( = ?auto_54184 ?auto_54191 ) ) ( not ( = ?auto_54194 ?auto_54183 ) ) ( not ( = ?auto_54198 ?auto_54194 ) ) ( HOIST-AT ?auto_54199 ?auto_54194 ) ( not ( = ?auto_54182 ?auto_54199 ) ) ( not ( = ?auto_54190 ?auto_54199 ) ) ( SURFACE-AT ?auto_54179 ?auto_54194 ) ( ON ?auto_54179 ?auto_54193 ) ( CLEAR ?auto_54179 ) ( not ( = ?auto_54178 ?auto_54193 ) ) ( not ( = ?auto_54179 ?auto_54193 ) ) ( not ( = ?auto_54184 ?auto_54193 ) ) ( not ( = ?auto_54191 ?auto_54193 ) ) ( IS-CRATE ?auto_54191 ) ( not ( = ?auto_54178 ?auto_54180 ) ) ( not ( = ?auto_54179 ?auto_54180 ) ) ( not ( = ?auto_54184 ?auto_54180 ) ) ( not ( = ?auto_54191 ?auto_54180 ) ) ( not ( = ?auto_54193 ?auto_54180 ) ) ( not ( = ?auto_54181 ?auto_54183 ) ) ( not ( = ?auto_54198 ?auto_54181 ) ) ( not ( = ?auto_54194 ?auto_54181 ) ) ( HOIST-AT ?auto_54189 ?auto_54181 ) ( not ( = ?auto_54182 ?auto_54189 ) ) ( not ( = ?auto_54190 ?auto_54189 ) ) ( not ( = ?auto_54199 ?auto_54189 ) ) ( AVAILABLE ?auto_54189 ) ( SURFACE-AT ?auto_54191 ?auto_54181 ) ( ON ?auto_54191 ?auto_54187 ) ( CLEAR ?auto_54191 ) ( not ( = ?auto_54178 ?auto_54187 ) ) ( not ( = ?auto_54179 ?auto_54187 ) ) ( not ( = ?auto_54184 ?auto_54187 ) ) ( not ( = ?auto_54191 ?auto_54187 ) ) ( not ( = ?auto_54193 ?auto_54187 ) ) ( not ( = ?auto_54180 ?auto_54187 ) ) ( IS-CRATE ?auto_54180 ) ( not ( = ?auto_54178 ?auto_54186 ) ) ( not ( = ?auto_54179 ?auto_54186 ) ) ( not ( = ?auto_54184 ?auto_54186 ) ) ( not ( = ?auto_54191 ?auto_54186 ) ) ( not ( = ?auto_54193 ?auto_54186 ) ) ( not ( = ?auto_54180 ?auto_54186 ) ) ( not ( = ?auto_54187 ?auto_54186 ) ) ( not ( = ?auto_54197 ?auto_54183 ) ) ( not ( = ?auto_54198 ?auto_54197 ) ) ( not ( = ?auto_54194 ?auto_54197 ) ) ( not ( = ?auto_54181 ?auto_54197 ) ) ( HOIST-AT ?auto_54195 ?auto_54197 ) ( not ( = ?auto_54182 ?auto_54195 ) ) ( not ( = ?auto_54190 ?auto_54195 ) ) ( not ( = ?auto_54199 ?auto_54195 ) ) ( not ( = ?auto_54189 ?auto_54195 ) ) ( AVAILABLE ?auto_54195 ) ( SURFACE-AT ?auto_54180 ?auto_54197 ) ( ON ?auto_54180 ?auto_54188 ) ( CLEAR ?auto_54180 ) ( not ( = ?auto_54178 ?auto_54188 ) ) ( not ( = ?auto_54179 ?auto_54188 ) ) ( not ( = ?auto_54184 ?auto_54188 ) ) ( not ( = ?auto_54191 ?auto_54188 ) ) ( not ( = ?auto_54193 ?auto_54188 ) ) ( not ( = ?auto_54180 ?auto_54188 ) ) ( not ( = ?auto_54187 ?auto_54188 ) ) ( not ( = ?auto_54186 ?auto_54188 ) ) ( SURFACE-AT ?auto_54192 ?auto_54183 ) ( CLEAR ?auto_54192 ) ( IS-CRATE ?auto_54186 ) ( not ( = ?auto_54178 ?auto_54192 ) ) ( not ( = ?auto_54179 ?auto_54192 ) ) ( not ( = ?auto_54184 ?auto_54192 ) ) ( not ( = ?auto_54191 ?auto_54192 ) ) ( not ( = ?auto_54193 ?auto_54192 ) ) ( not ( = ?auto_54180 ?auto_54192 ) ) ( not ( = ?auto_54187 ?auto_54192 ) ) ( not ( = ?auto_54186 ?auto_54192 ) ) ( not ( = ?auto_54188 ?auto_54192 ) ) ( AVAILABLE ?auto_54182 ) ( AVAILABLE ?auto_54199 ) ( SURFACE-AT ?auto_54186 ?auto_54194 ) ( ON ?auto_54186 ?auto_54196 ) ( CLEAR ?auto_54186 ) ( not ( = ?auto_54178 ?auto_54196 ) ) ( not ( = ?auto_54179 ?auto_54196 ) ) ( not ( = ?auto_54184 ?auto_54196 ) ) ( not ( = ?auto_54191 ?auto_54196 ) ) ( not ( = ?auto_54193 ?auto_54196 ) ) ( not ( = ?auto_54180 ?auto_54196 ) ) ( not ( = ?auto_54187 ?auto_54196 ) ) ( not ( = ?auto_54186 ?auto_54196 ) ) ( not ( = ?auto_54188 ?auto_54196 ) ) ( not ( = ?auto_54192 ?auto_54196 ) ) ( TRUCK-AT ?auto_54185 ?auto_54183 ) )
    :subtasks
    ( ( !DRIVE ?auto_54185 ?auto_54183 ?auto_54194 )
      ( MAKE-ON ?auto_54178 ?auto_54179 )
      ( MAKE-ON-VERIFY ?auto_54178 ?auto_54179 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54200 - SURFACE
      ?auto_54201 - SURFACE
    )
    :vars
    (
      ?auto_54207 - HOIST
      ?auto_54214 - PLACE
      ?auto_54217 - PLACE
      ?auto_54202 - HOIST
      ?auto_54210 - SURFACE
      ?auto_54215 - SURFACE
      ?auto_54205 - PLACE
      ?auto_54218 - HOIST
      ?auto_54221 - SURFACE
      ?auto_54204 - SURFACE
      ?auto_54211 - PLACE
      ?auto_54209 - HOIST
      ?auto_54212 - SURFACE
      ?auto_54203 - SURFACE
      ?auto_54216 - PLACE
      ?auto_54206 - HOIST
      ?auto_54208 - SURFACE
      ?auto_54220 - SURFACE
      ?auto_54213 - SURFACE
      ?auto_54219 - TRUCK
      ?auto_54222 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54207 ?auto_54214 ) ( IS-CRATE ?auto_54200 ) ( not ( = ?auto_54200 ?auto_54201 ) ) ( not ( = ?auto_54217 ?auto_54214 ) ) ( HOIST-AT ?auto_54202 ?auto_54217 ) ( not ( = ?auto_54207 ?auto_54202 ) ) ( AVAILABLE ?auto_54202 ) ( SURFACE-AT ?auto_54200 ?auto_54217 ) ( ON ?auto_54200 ?auto_54210 ) ( CLEAR ?auto_54200 ) ( not ( = ?auto_54200 ?auto_54210 ) ) ( not ( = ?auto_54201 ?auto_54210 ) ) ( IS-CRATE ?auto_54201 ) ( not ( = ?auto_54200 ?auto_54215 ) ) ( not ( = ?auto_54201 ?auto_54215 ) ) ( not ( = ?auto_54210 ?auto_54215 ) ) ( not ( = ?auto_54205 ?auto_54214 ) ) ( not ( = ?auto_54217 ?auto_54205 ) ) ( HOIST-AT ?auto_54218 ?auto_54205 ) ( not ( = ?auto_54207 ?auto_54218 ) ) ( not ( = ?auto_54202 ?auto_54218 ) ) ( SURFACE-AT ?auto_54201 ?auto_54205 ) ( ON ?auto_54201 ?auto_54221 ) ( CLEAR ?auto_54201 ) ( not ( = ?auto_54200 ?auto_54221 ) ) ( not ( = ?auto_54201 ?auto_54221 ) ) ( not ( = ?auto_54210 ?auto_54221 ) ) ( not ( = ?auto_54215 ?auto_54221 ) ) ( IS-CRATE ?auto_54215 ) ( not ( = ?auto_54200 ?auto_54204 ) ) ( not ( = ?auto_54201 ?auto_54204 ) ) ( not ( = ?auto_54210 ?auto_54204 ) ) ( not ( = ?auto_54215 ?auto_54204 ) ) ( not ( = ?auto_54221 ?auto_54204 ) ) ( not ( = ?auto_54211 ?auto_54214 ) ) ( not ( = ?auto_54217 ?auto_54211 ) ) ( not ( = ?auto_54205 ?auto_54211 ) ) ( HOIST-AT ?auto_54209 ?auto_54211 ) ( not ( = ?auto_54207 ?auto_54209 ) ) ( not ( = ?auto_54202 ?auto_54209 ) ) ( not ( = ?auto_54218 ?auto_54209 ) ) ( AVAILABLE ?auto_54209 ) ( SURFACE-AT ?auto_54215 ?auto_54211 ) ( ON ?auto_54215 ?auto_54212 ) ( CLEAR ?auto_54215 ) ( not ( = ?auto_54200 ?auto_54212 ) ) ( not ( = ?auto_54201 ?auto_54212 ) ) ( not ( = ?auto_54210 ?auto_54212 ) ) ( not ( = ?auto_54215 ?auto_54212 ) ) ( not ( = ?auto_54221 ?auto_54212 ) ) ( not ( = ?auto_54204 ?auto_54212 ) ) ( IS-CRATE ?auto_54204 ) ( not ( = ?auto_54200 ?auto_54203 ) ) ( not ( = ?auto_54201 ?auto_54203 ) ) ( not ( = ?auto_54210 ?auto_54203 ) ) ( not ( = ?auto_54215 ?auto_54203 ) ) ( not ( = ?auto_54221 ?auto_54203 ) ) ( not ( = ?auto_54204 ?auto_54203 ) ) ( not ( = ?auto_54212 ?auto_54203 ) ) ( not ( = ?auto_54216 ?auto_54214 ) ) ( not ( = ?auto_54217 ?auto_54216 ) ) ( not ( = ?auto_54205 ?auto_54216 ) ) ( not ( = ?auto_54211 ?auto_54216 ) ) ( HOIST-AT ?auto_54206 ?auto_54216 ) ( not ( = ?auto_54207 ?auto_54206 ) ) ( not ( = ?auto_54202 ?auto_54206 ) ) ( not ( = ?auto_54218 ?auto_54206 ) ) ( not ( = ?auto_54209 ?auto_54206 ) ) ( AVAILABLE ?auto_54206 ) ( SURFACE-AT ?auto_54204 ?auto_54216 ) ( ON ?auto_54204 ?auto_54208 ) ( CLEAR ?auto_54204 ) ( not ( = ?auto_54200 ?auto_54208 ) ) ( not ( = ?auto_54201 ?auto_54208 ) ) ( not ( = ?auto_54210 ?auto_54208 ) ) ( not ( = ?auto_54215 ?auto_54208 ) ) ( not ( = ?auto_54221 ?auto_54208 ) ) ( not ( = ?auto_54204 ?auto_54208 ) ) ( not ( = ?auto_54212 ?auto_54208 ) ) ( not ( = ?auto_54203 ?auto_54208 ) ) ( IS-CRATE ?auto_54203 ) ( not ( = ?auto_54200 ?auto_54220 ) ) ( not ( = ?auto_54201 ?auto_54220 ) ) ( not ( = ?auto_54210 ?auto_54220 ) ) ( not ( = ?auto_54215 ?auto_54220 ) ) ( not ( = ?auto_54221 ?auto_54220 ) ) ( not ( = ?auto_54204 ?auto_54220 ) ) ( not ( = ?auto_54212 ?auto_54220 ) ) ( not ( = ?auto_54203 ?auto_54220 ) ) ( not ( = ?auto_54208 ?auto_54220 ) ) ( AVAILABLE ?auto_54218 ) ( SURFACE-AT ?auto_54203 ?auto_54205 ) ( ON ?auto_54203 ?auto_54213 ) ( CLEAR ?auto_54203 ) ( not ( = ?auto_54200 ?auto_54213 ) ) ( not ( = ?auto_54201 ?auto_54213 ) ) ( not ( = ?auto_54210 ?auto_54213 ) ) ( not ( = ?auto_54215 ?auto_54213 ) ) ( not ( = ?auto_54221 ?auto_54213 ) ) ( not ( = ?auto_54204 ?auto_54213 ) ) ( not ( = ?auto_54212 ?auto_54213 ) ) ( not ( = ?auto_54203 ?auto_54213 ) ) ( not ( = ?auto_54208 ?auto_54213 ) ) ( not ( = ?auto_54220 ?auto_54213 ) ) ( TRUCK-AT ?auto_54219 ?auto_54214 ) ( SURFACE-AT ?auto_54222 ?auto_54214 ) ( CLEAR ?auto_54222 ) ( LIFTING ?auto_54207 ?auto_54220 ) ( IS-CRATE ?auto_54220 ) ( not ( = ?auto_54200 ?auto_54222 ) ) ( not ( = ?auto_54201 ?auto_54222 ) ) ( not ( = ?auto_54210 ?auto_54222 ) ) ( not ( = ?auto_54215 ?auto_54222 ) ) ( not ( = ?auto_54221 ?auto_54222 ) ) ( not ( = ?auto_54204 ?auto_54222 ) ) ( not ( = ?auto_54212 ?auto_54222 ) ) ( not ( = ?auto_54203 ?auto_54222 ) ) ( not ( = ?auto_54208 ?auto_54222 ) ) ( not ( = ?auto_54220 ?auto_54222 ) ) ( not ( = ?auto_54213 ?auto_54222 ) ) )
    :subtasks
    ( ( !DROP ?auto_54207 ?auto_54220 ?auto_54222 ?auto_54214 )
      ( MAKE-ON ?auto_54200 ?auto_54201 )
      ( MAKE-ON-VERIFY ?auto_54200 ?auto_54201 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54223 - SURFACE
      ?auto_54224 - SURFACE
    )
    :vars
    (
      ?auto_54236 - HOIST
      ?auto_54238 - PLACE
      ?auto_54229 - PLACE
      ?auto_54230 - HOIST
      ?auto_54242 - SURFACE
      ?auto_54227 - SURFACE
      ?auto_54243 - PLACE
      ?auto_54234 - HOIST
      ?auto_54237 - SURFACE
      ?auto_54241 - SURFACE
      ?auto_54245 - PLACE
      ?auto_54235 - HOIST
      ?auto_54244 - SURFACE
      ?auto_54240 - SURFACE
      ?auto_54231 - PLACE
      ?auto_54228 - HOIST
      ?auto_54232 - SURFACE
      ?auto_54225 - SURFACE
      ?auto_54239 - SURFACE
      ?auto_54226 - TRUCK
      ?auto_54233 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54236 ?auto_54238 ) ( IS-CRATE ?auto_54223 ) ( not ( = ?auto_54223 ?auto_54224 ) ) ( not ( = ?auto_54229 ?auto_54238 ) ) ( HOIST-AT ?auto_54230 ?auto_54229 ) ( not ( = ?auto_54236 ?auto_54230 ) ) ( AVAILABLE ?auto_54230 ) ( SURFACE-AT ?auto_54223 ?auto_54229 ) ( ON ?auto_54223 ?auto_54242 ) ( CLEAR ?auto_54223 ) ( not ( = ?auto_54223 ?auto_54242 ) ) ( not ( = ?auto_54224 ?auto_54242 ) ) ( IS-CRATE ?auto_54224 ) ( not ( = ?auto_54223 ?auto_54227 ) ) ( not ( = ?auto_54224 ?auto_54227 ) ) ( not ( = ?auto_54242 ?auto_54227 ) ) ( not ( = ?auto_54243 ?auto_54238 ) ) ( not ( = ?auto_54229 ?auto_54243 ) ) ( HOIST-AT ?auto_54234 ?auto_54243 ) ( not ( = ?auto_54236 ?auto_54234 ) ) ( not ( = ?auto_54230 ?auto_54234 ) ) ( SURFACE-AT ?auto_54224 ?auto_54243 ) ( ON ?auto_54224 ?auto_54237 ) ( CLEAR ?auto_54224 ) ( not ( = ?auto_54223 ?auto_54237 ) ) ( not ( = ?auto_54224 ?auto_54237 ) ) ( not ( = ?auto_54242 ?auto_54237 ) ) ( not ( = ?auto_54227 ?auto_54237 ) ) ( IS-CRATE ?auto_54227 ) ( not ( = ?auto_54223 ?auto_54241 ) ) ( not ( = ?auto_54224 ?auto_54241 ) ) ( not ( = ?auto_54242 ?auto_54241 ) ) ( not ( = ?auto_54227 ?auto_54241 ) ) ( not ( = ?auto_54237 ?auto_54241 ) ) ( not ( = ?auto_54245 ?auto_54238 ) ) ( not ( = ?auto_54229 ?auto_54245 ) ) ( not ( = ?auto_54243 ?auto_54245 ) ) ( HOIST-AT ?auto_54235 ?auto_54245 ) ( not ( = ?auto_54236 ?auto_54235 ) ) ( not ( = ?auto_54230 ?auto_54235 ) ) ( not ( = ?auto_54234 ?auto_54235 ) ) ( AVAILABLE ?auto_54235 ) ( SURFACE-AT ?auto_54227 ?auto_54245 ) ( ON ?auto_54227 ?auto_54244 ) ( CLEAR ?auto_54227 ) ( not ( = ?auto_54223 ?auto_54244 ) ) ( not ( = ?auto_54224 ?auto_54244 ) ) ( not ( = ?auto_54242 ?auto_54244 ) ) ( not ( = ?auto_54227 ?auto_54244 ) ) ( not ( = ?auto_54237 ?auto_54244 ) ) ( not ( = ?auto_54241 ?auto_54244 ) ) ( IS-CRATE ?auto_54241 ) ( not ( = ?auto_54223 ?auto_54240 ) ) ( not ( = ?auto_54224 ?auto_54240 ) ) ( not ( = ?auto_54242 ?auto_54240 ) ) ( not ( = ?auto_54227 ?auto_54240 ) ) ( not ( = ?auto_54237 ?auto_54240 ) ) ( not ( = ?auto_54241 ?auto_54240 ) ) ( not ( = ?auto_54244 ?auto_54240 ) ) ( not ( = ?auto_54231 ?auto_54238 ) ) ( not ( = ?auto_54229 ?auto_54231 ) ) ( not ( = ?auto_54243 ?auto_54231 ) ) ( not ( = ?auto_54245 ?auto_54231 ) ) ( HOIST-AT ?auto_54228 ?auto_54231 ) ( not ( = ?auto_54236 ?auto_54228 ) ) ( not ( = ?auto_54230 ?auto_54228 ) ) ( not ( = ?auto_54234 ?auto_54228 ) ) ( not ( = ?auto_54235 ?auto_54228 ) ) ( AVAILABLE ?auto_54228 ) ( SURFACE-AT ?auto_54241 ?auto_54231 ) ( ON ?auto_54241 ?auto_54232 ) ( CLEAR ?auto_54241 ) ( not ( = ?auto_54223 ?auto_54232 ) ) ( not ( = ?auto_54224 ?auto_54232 ) ) ( not ( = ?auto_54242 ?auto_54232 ) ) ( not ( = ?auto_54227 ?auto_54232 ) ) ( not ( = ?auto_54237 ?auto_54232 ) ) ( not ( = ?auto_54241 ?auto_54232 ) ) ( not ( = ?auto_54244 ?auto_54232 ) ) ( not ( = ?auto_54240 ?auto_54232 ) ) ( IS-CRATE ?auto_54240 ) ( not ( = ?auto_54223 ?auto_54225 ) ) ( not ( = ?auto_54224 ?auto_54225 ) ) ( not ( = ?auto_54242 ?auto_54225 ) ) ( not ( = ?auto_54227 ?auto_54225 ) ) ( not ( = ?auto_54237 ?auto_54225 ) ) ( not ( = ?auto_54241 ?auto_54225 ) ) ( not ( = ?auto_54244 ?auto_54225 ) ) ( not ( = ?auto_54240 ?auto_54225 ) ) ( not ( = ?auto_54232 ?auto_54225 ) ) ( AVAILABLE ?auto_54234 ) ( SURFACE-AT ?auto_54240 ?auto_54243 ) ( ON ?auto_54240 ?auto_54239 ) ( CLEAR ?auto_54240 ) ( not ( = ?auto_54223 ?auto_54239 ) ) ( not ( = ?auto_54224 ?auto_54239 ) ) ( not ( = ?auto_54242 ?auto_54239 ) ) ( not ( = ?auto_54227 ?auto_54239 ) ) ( not ( = ?auto_54237 ?auto_54239 ) ) ( not ( = ?auto_54241 ?auto_54239 ) ) ( not ( = ?auto_54244 ?auto_54239 ) ) ( not ( = ?auto_54240 ?auto_54239 ) ) ( not ( = ?auto_54232 ?auto_54239 ) ) ( not ( = ?auto_54225 ?auto_54239 ) ) ( TRUCK-AT ?auto_54226 ?auto_54238 ) ( SURFACE-AT ?auto_54233 ?auto_54238 ) ( CLEAR ?auto_54233 ) ( IS-CRATE ?auto_54225 ) ( not ( = ?auto_54223 ?auto_54233 ) ) ( not ( = ?auto_54224 ?auto_54233 ) ) ( not ( = ?auto_54242 ?auto_54233 ) ) ( not ( = ?auto_54227 ?auto_54233 ) ) ( not ( = ?auto_54237 ?auto_54233 ) ) ( not ( = ?auto_54241 ?auto_54233 ) ) ( not ( = ?auto_54244 ?auto_54233 ) ) ( not ( = ?auto_54240 ?auto_54233 ) ) ( not ( = ?auto_54232 ?auto_54233 ) ) ( not ( = ?auto_54225 ?auto_54233 ) ) ( not ( = ?auto_54239 ?auto_54233 ) ) ( AVAILABLE ?auto_54236 ) ( IN ?auto_54225 ?auto_54226 ) )
    :subtasks
    ( ( !UNLOAD ?auto_54236 ?auto_54225 ?auto_54226 ?auto_54238 )
      ( MAKE-ON ?auto_54223 ?auto_54224 )
      ( MAKE-ON-VERIFY ?auto_54223 ?auto_54224 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54246 - SURFACE
      ?auto_54247 - SURFACE
    )
    :vars
    (
      ?auto_54259 - HOIST
      ?auto_54261 - PLACE
      ?auto_54251 - PLACE
      ?auto_54255 - HOIST
      ?auto_54258 - SURFACE
      ?auto_54254 - SURFACE
      ?auto_54253 - PLACE
      ?auto_54266 - HOIST
      ?auto_54265 - SURFACE
      ?auto_54267 - SURFACE
      ?auto_54252 - PLACE
      ?auto_54250 - HOIST
      ?auto_54268 - SURFACE
      ?auto_54262 - SURFACE
      ?auto_54248 - PLACE
      ?auto_54263 - HOIST
      ?auto_54260 - SURFACE
      ?auto_54256 - SURFACE
      ?auto_54264 - SURFACE
      ?auto_54249 - SURFACE
      ?auto_54257 - TRUCK
      ?auto_54269 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54259 ?auto_54261 ) ( IS-CRATE ?auto_54246 ) ( not ( = ?auto_54246 ?auto_54247 ) ) ( not ( = ?auto_54251 ?auto_54261 ) ) ( HOIST-AT ?auto_54255 ?auto_54251 ) ( not ( = ?auto_54259 ?auto_54255 ) ) ( AVAILABLE ?auto_54255 ) ( SURFACE-AT ?auto_54246 ?auto_54251 ) ( ON ?auto_54246 ?auto_54258 ) ( CLEAR ?auto_54246 ) ( not ( = ?auto_54246 ?auto_54258 ) ) ( not ( = ?auto_54247 ?auto_54258 ) ) ( IS-CRATE ?auto_54247 ) ( not ( = ?auto_54246 ?auto_54254 ) ) ( not ( = ?auto_54247 ?auto_54254 ) ) ( not ( = ?auto_54258 ?auto_54254 ) ) ( not ( = ?auto_54253 ?auto_54261 ) ) ( not ( = ?auto_54251 ?auto_54253 ) ) ( HOIST-AT ?auto_54266 ?auto_54253 ) ( not ( = ?auto_54259 ?auto_54266 ) ) ( not ( = ?auto_54255 ?auto_54266 ) ) ( SURFACE-AT ?auto_54247 ?auto_54253 ) ( ON ?auto_54247 ?auto_54265 ) ( CLEAR ?auto_54247 ) ( not ( = ?auto_54246 ?auto_54265 ) ) ( not ( = ?auto_54247 ?auto_54265 ) ) ( not ( = ?auto_54258 ?auto_54265 ) ) ( not ( = ?auto_54254 ?auto_54265 ) ) ( IS-CRATE ?auto_54254 ) ( not ( = ?auto_54246 ?auto_54267 ) ) ( not ( = ?auto_54247 ?auto_54267 ) ) ( not ( = ?auto_54258 ?auto_54267 ) ) ( not ( = ?auto_54254 ?auto_54267 ) ) ( not ( = ?auto_54265 ?auto_54267 ) ) ( not ( = ?auto_54252 ?auto_54261 ) ) ( not ( = ?auto_54251 ?auto_54252 ) ) ( not ( = ?auto_54253 ?auto_54252 ) ) ( HOIST-AT ?auto_54250 ?auto_54252 ) ( not ( = ?auto_54259 ?auto_54250 ) ) ( not ( = ?auto_54255 ?auto_54250 ) ) ( not ( = ?auto_54266 ?auto_54250 ) ) ( AVAILABLE ?auto_54250 ) ( SURFACE-AT ?auto_54254 ?auto_54252 ) ( ON ?auto_54254 ?auto_54268 ) ( CLEAR ?auto_54254 ) ( not ( = ?auto_54246 ?auto_54268 ) ) ( not ( = ?auto_54247 ?auto_54268 ) ) ( not ( = ?auto_54258 ?auto_54268 ) ) ( not ( = ?auto_54254 ?auto_54268 ) ) ( not ( = ?auto_54265 ?auto_54268 ) ) ( not ( = ?auto_54267 ?auto_54268 ) ) ( IS-CRATE ?auto_54267 ) ( not ( = ?auto_54246 ?auto_54262 ) ) ( not ( = ?auto_54247 ?auto_54262 ) ) ( not ( = ?auto_54258 ?auto_54262 ) ) ( not ( = ?auto_54254 ?auto_54262 ) ) ( not ( = ?auto_54265 ?auto_54262 ) ) ( not ( = ?auto_54267 ?auto_54262 ) ) ( not ( = ?auto_54268 ?auto_54262 ) ) ( not ( = ?auto_54248 ?auto_54261 ) ) ( not ( = ?auto_54251 ?auto_54248 ) ) ( not ( = ?auto_54253 ?auto_54248 ) ) ( not ( = ?auto_54252 ?auto_54248 ) ) ( HOIST-AT ?auto_54263 ?auto_54248 ) ( not ( = ?auto_54259 ?auto_54263 ) ) ( not ( = ?auto_54255 ?auto_54263 ) ) ( not ( = ?auto_54266 ?auto_54263 ) ) ( not ( = ?auto_54250 ?auto_54263 ) ) ( AVAILABLE ?auto_54263 ) ( SURFACE-AT ?auto_54267 ?auto_54248 ) ( ON ?auto_54267 ?auto_54260 ) ( CLEAR ?auto_54267 ) ( not ( = ?auto_54246 ?auto_54260 ) ) ( not ( = ?auto_54247 ?auto_54260 ) ) ( not ( = ?auto_54258 ?auto_54260 ) ) ( not ( = ?auto_54254 ?auto_54260 ) ) ( not ( = ?auto_54265 ?auto_54260 ) ) ( not ( = ?auto_54267 ?auto_54260 ) ) ( not ( = ?auto_54268 ?auto_54260 ) ) ( not ( = ?auto_54262 ?auto_54260 ) ) ( IS-CRATE ?auto_54262 ) ( not ( = ?auto_54246 ?auto_54256 ) ) ( not ( = ?auto_54247 ?auto_54256 ) ) ( not ( = ?auto_54258 ?auto_54256 ) ) ( not ( = ?auto_54254 ?auto_54256 ) ) ( not ( = ?auto_54265 ?auto_54256 ) ) ( not ( = ?auto_54267 ?auto_54256 ) ) ( not ( = ?auto_54268 ?auto_54256 ) ) ( not ( = ?auto_54262 ?auto_54256 ) ) ( not ( = ?auto_54260 ?auto_54256 ) ) ( AVAILABLE ?auto_54266 ) ( SURFACE-AT ?auto_54262 ?auto_54253 ) ( ON ?auto_54262 ?auto_54264 ) ( CLEAR ?auto_54262 ) ( not ( = ?auto_54246 ?auto_54264 ) ) ( not ( = ?auto_54247 ?auto_54264 ) ) ( not ( = ?auto_54258 ?auto_54264 ) ) ( not ( = ?auto_54254 ?auto_54264 ) ) ( not ( = ?auto_54265 ?auto_54264 ) ) ( not ( = ?auto_54267 ?auto_54264 ) ) ( not ( = ?auto_54268 ?auto_54264 ) ) ( not ( = ?auto_54262 ?auto_54264 ) ) ( not ( = ?auto_54260 ?auto_54264 ) ) ( not ( = ?auto_54256 ?auto_54264 ) ) ( SURFACE-AT ?auto_54249 ?auto_54261 ) ( CLEAR ?auto_54249 ) ( IS-CRATE ?auto_54256 ) ( not ( = ?auto_54246 ?auto_54249 ) ) ( not ( = ?auto_54247 ?auto_54249 ) ) ( not ( = ?auto_54258 ?auto_54249 ) ) ( not ( = ?auto_54254 ?auto_54249 ) ) ( not ( = ?auto_54265 ?auto_54249 ) ) ( not ( = ?auto_54267 ?auto_54249 ) ) ( not ( = ?auto_54268 ?auto_54249 ) ) ( not ( = ?auto_54262 ?auto_54249 ) ) ( not ( = ?auto_54260 ?auto_54249 ) ) ( not ( = ?auto_54256 ?auto_54249 ) ) ( not ( = ?auto_54264 ?auto_54249 ) ) ( AVAILABLE ?auto_54259 ) ( IN ?auto_54256 ?auto_54257 ) ( TRUCK-AT ?auto_54257 ?auto_54269 ) ( not ( = ?auto_54269 ?auto_54261 ) ) ( not ( = ?auto_54251 ?auto_54269 ) ) ( not ( = ?auto_54253 ?auto_54269 ) ) ( not ( = ?auto_54252 ?auto_54269 ) ) ( not ( = ?auto_54248 ?auto_54269 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_54257 ?auto_54269 ?auto_54261 )
      ( MAKE-ON ?auto_54246 ?auto_54247 )
      ( MAKE-ON-VERIFY ?auto_54246 ?auto_54247 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54270 - SURFACE
      ?auto_54271 - SURFACE
    )
    :vars
    (
      ?auto_54289 - HOIST
      ?auto_54285 - PLACE
      ?auto_54275 - PLACE
      ?auto_54292 - HOIST
      ?auto_54287 - SURFACE
      ?auto_54291 - SURFACE
      ?auto_54282 - PLACE
      ?auto_54283 - HOIST
      ?auto_54272 - SURFACE
      ?auto_54284 - SURFACE
      ?auto_54286 - PLACE
      ?auto_54280 - HOIST
      ?auto_54281 - SURFACE
      ?auto_54293 - SURFACE
      ?auto_54278 - PLACE
      ?auto_54290 - HOIST
      ?auto_54279 - SURFACE
      ?auto_54277 - SURFACE
      ?auto_54274 - SURFACE
      ?auto_54273 - SURFACE
      ?auto_54288 - TRUCK
      ?auto_54276 - PLACE
      ?auto_54294 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_54289 ?auto_54285 ) ( IS-CRATE ?auto_54270 ) ( not ( = ?auto_54270 ?auto_54271 ) ) ( not ( = ?auto_54275 ?auto_54285 ) ) ( HOIST-AT ?auto_54292 ?auto_54275 ) ( not ( = ?auto_54289 ?auto_54292 ) ) ( AVAILABLE ?auto_54292 ) ( SURFACE-AT ?auto_54270 ?auto_54275 ) ( ON ?auto_54270 ?auto_54287 ) ( CLEAR ?auto_54270 ) ( not ( = ?auto_54270 ?auto_54287 ) ) ( not ( = ?auto_54271 ?auto_54287 ) ) ( IS-CRATE ?auto_54271 ) ( not ( = ?auto_54270 ?auto_54291 ) ) ( not ( = ?auto_54271 ?auto_54291 ) ) ( not ( = ?auto_54287 ?auto_54291 ) ) ( not ( = ?auto_54282 ?auto_54285 ) ) ( not ( = ?auto_54275 ?auto_54282 ) ) ( HOIST-AT ?auto_54283 ?auto_54282 ) ( not ( = ?auto_54289 ?auto_54283 ) ) ( not ( = ?auto_54292 ?auto_54283 ) ) ( SURFACE-AT ?auto_54271 ?auto_54282 ) ( ON ?auto_54271 ?auto_54272 ) ( CLEAR ?auto_54271 ) ( not ( = ?auto_54270 ?auto_54272 ) ) ( not ( = ?auto_54271 ?auto_54272 ) ) ( not ( = ?auto_54287 ?auto_54272 ) ) ( not ( = ?auto_54291 ?auto_54272 ) ) ( IS-CRATE ?auto_54291 ) ( not ( = ?auto_54270 ?auto_54284 ) ) ( not ( = ?auto_54271 ?auto_54284 ) ) ( not ( = ?auto_54287 ?auto_54284 ) ) ( not ( = ?auto_54291 ?auto_54284 ) ) ( not ( = ?auto_54272 ?auto_54284 ) ) ( not ( = ?auto_54286 ?auto_54285 ) ) ( not ( = ?auto_54275 ?auto_54286 ) ) ( not ( = ?auto_54282 ?auto_54286 ) ) ( HOIST-AT ?auto_54280 ?auto_54286 ) ( not ( = ?auto_54289 ?auto_54280 ) ) ( not ( = ?auto_54292 ?auto_54280 ) ) ( not ( = ?auto_54283 ?auto_54280 ) ) ( AVAILABLE ?auto_54280 ) ( SURFACE-AT ?auto_54291 ?auto_54286 ) ( ON ?auto_54291 ?auto_54281 ) ( CLEAR ?auto_54291 ) ( not ( = ?auto_54270 ?auto_54281 ) ) ( not ( = ?auto_54271 ?auto_54281 ) ) ( not ( = ?auto_54287 ?auto_54281 ) ) ( not ( = ?auto_54291 ?auto_54281 ) ) ( not ( = ?auto_54272 ?auto_54281 ) ) ( not ( = ?auto_54284 ?auto_54281 ) ) ( IS-CRATE ?auto_54284 ) ( not ( = ?auto_54270 ?auto_54293 ) ) ( not ( = ?auto_54271 ?auto_54293 ) ) ( not ( = ?auto_54287 ?auto_54293 ) ) ( not ( = ?auto_54291 ?auto_54293 ) ) ( not ( = ?auto_54272 ?auto_54293 ) ) ( not ( = ?auto_54284 ?auto_54293 ) ) ( not ( = ?auto_54281 ?auto_54293 ) ) ( not ( = ?auto_54278 ?auto_54285 ) ) ( not ( = ?auto_54275 ?auto_54278 ) ) ( not ( = ?auto_54282 ?auto_54278 ) ) ( not ( = ?auto_54286 ?auto_54278 ) ) ( HOIST-AT ?auto_54290 ?auto_54278 ) ( not ( = ?auto_54289 ?auto_54290 ) ) ( not ( = ?auto_54292 ?auto_54290 ) ) ( not ( = ?auto_54283 ?auto_54290 ) ) ( not ( = ?auto_54280 ?auto_54290 ) ) ( AVAILABLE ?auto_54290 ) ( SURFACE-AT ?auto_54284 ?auto_54278 ) ( ON ?auto_54284 ?auto_54279 ) ( CLEAR ?auto_54284 ) ( not ( = ?auto_54270 ?auto_54279 ) ) ( not ( = ?auto_54271 ?auto_54279 ) ) ( not ( = ?auto_54287 ?auto_54279 ) ) ( not ( = ?auto_54291 ?auto_54279 ) ) ( not ( = ?auto_54272 ?auto_54279 ) ) ( not ( = ?auto_54284 ?auto_54279 ) ) ( not ( = ?auto_54281 ?auto_54279 ) ) ( not ( = ?auto_54293 ?auto_54279 ) ) ( IS-CRATE ?auto_54293 ) ( not ( = ?auto_54270 ?auto_54277 ) ) ( not ( = ?auto_54271 ?auto_54277 ) ) ( not ( = ?auto_54287 ?auto_54277 ) ) ( not ( = ?auto_54291 ?auto_54277 ) ) ( not ( = ?auto_54272 ?auto_54277 ) ) ( not ( = ?auto_54284 ?auto_54277 ) ) ( not ( = ?auto_54281 ?auto_54277 ) ) ( not ( = ?auto_54293 ?auto_54277 ) ) ( not ( = ?auto_54279 ?auto_54277 ) ) ( AVAILABLE ?auto_54283 ) ( SURFACE-AT ?auto_54293 ?auto_54282 ) ( ON ?auto_54293 ?auto_54274 ) ( CLEAR ?auto_54293 ) ( not ( = ?auto_54270 ?auto_54274 ) ) ( not ( = ?auto_54271 ?auto_54274 ) ) ( not ( = ?auto_54287 ?auto_54274 ) ) ( not ( = ?auto_54291 ?auto_54274 ) ) ( not ( = ?auto_54272 ?auto_54274 ) ) ( not ( = ?auto_54284 ?auto_54274 ) ) ( not ( = ?auto_54281 ?auto_54274 ) ) ( not ( = ?auto_54293 ?auto_54274 ) ) ( not ( = ?auto_54279 ?auto_54274 ) ) ( not ( = ?auto_54277 ?auto_54274 ) ) ( SURFACE-AT ?auto_54273 ?auto_54285 ) ( CLEAR ?auto_54273 ) ( IS-CRATE ?auto_54277 ) ( not ( = ?auto_54270 ?auto_54273 ) ) ( not ( = ?auto_54271 ?auto_54273 ) ) ( not ( = ?auto_54287 ?auto_54273 ) ) ( not ( = ?auto_54291 ?auto_54273 ) ) ( not ( = ?auto_54272 ?auto_54273 ) ) ( not ( = ?auto_54284 ?auto_54273 ) ) ( not ( = ?auto_54281 ?auto_54273 ) ) ( not ( = ?auto_54293 ?auto_54273 ) ) ( not ( = ?auto_54279 ?auto_54273 ) ) ( not ( = ?auto_54277 ?auto_54273 ) ) ( not ( = ?auto_54274 ?auto_54273 ) ) ( AVAILABLE ?auto_54289 ) ( TRUCK-AT ?auto_54288 ?auto_54276 ) ( not ( = ?auto_54276 ?auto_54285 ) ) ( not ( = ?auto_54275 ?auto_54276 ) ) ( not ( = ?auto_54282 ?auto_54276 ) ) ( not ( = ?auto_54286 ?auto_54276 ) ) ( not ( = ?auto_54278 ?auto_54276 ) ) ( HOIST-AT ?auto_54294 ?auto_54276 ) ( LIFTING ?auto_54294 ?auto_54277 ) ( not ( = ?auto_54289 ?auto_54294 ) ) ( not ( = ?auto_54292 ?auto_54294 ) ) ( not ( = ?auto_54283 ?auto_54294 ) ) ( not ( = ?auto_54280 ?auto_54294 ) ) ( not ( = ?auto_54290 ?auto_54294 ) ) )
    :subtasks
    ( ( !LOAD ?auto_54294 ?auto_54277 ?auto_54288 ?auto_54276 )
      ( MAKE-ON ?auto_54270 ?auto_54271 )
      ( MAKE-ON-VERIFY ?auto_54270 ?auto_54271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54295 - SURFACE
      ?auto_54296 - SURFACE
    )
    :vars
    (
      ?auto_54315 - HOIST
      ?auto_54318 - PLACE
      ?auto_54309 - PLACE
      ?auto_54314 - HOIST
      ?auto_54304 - SURFACE
      ?auto_54299 - SURFACE
      ?auto_54298 - PLACE
      ?auto_54300 - HOIST
      ?auto_54302 - SURFACE
      ?auto_54297 - SURFACE
      ?auto_54303 - PLACE
      ?auto_54305 - HOIST
      ?auto_54313 - SURFACE
      ?auto_54316 - SURFACE
      ?auto_54312 - PLACE
      ?auto_54319 - HOIST
      ?auto_54307 - SURFACE
      ?auto_54306 - SURFACE
      ?auto_54308 - SURFACE
      ?auto_54310 - SURFACE
      ?auto_54317 - TRUCK
      ?auto_54311 - PLACE
      ?auto_54301 - HOIST
      ?auto_54320 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54315 ?auto_54318 ) ( IS-CRATE ?auto_54295 ) ( not ( = ?auto_54295 ?auto_54296 ) ) ( not ( = ?auto_54309 ?auto_54318 ) ) ( HOIST-AT ?auto_54314 ?auto_54309 ) ( not ( = ?auto_54315 ?auto_54314 ) ) ( AVAILABLE ?auto_54314 ) ( SURFACE-AT ?auto_54295 ?auto_54309 ) ( ON ?auto_54295 ?auto_54304 ) ( CLEAR ?auto_54295 ) ( not ( = ?auto_54295 ?auto_54304 ) ) ( not ( = ?auto_54296 ?auto_54304 ) ) ( IS-CRATE ?auto_54296 ) ( not ( = ?auto_54295 ?auto_54299 ) ) ( not ( = ?auto_54296 ?auto_54299 ) ) ( not ( = ?auto_54304 ?auto_54299 ) ) ( not ( = ?auto_54298 ?auto_54318 ) ) ( not ( = ?auto_54309 ?auto_54298 ) ) ( HOIST-AT ?auto_54300 ?auto_54298 ) ( not ( = ?auto_54315 ?auto_54300 ) ) ( not ( = ?auto_54314 ?auto_54300 ) ) ( SURFACE-AT ?auto_54296 ?auto_54298 ) ( ON ?auto_54296 ?auto_54302 ) ( CLEAR ?auto_54296 ) ( not ( = ?auto_54295 ?auto_54302 ) ) ( not ( = ?auto_54296 ?auto_54302 ) ) ( not ( = ?auto_54304 ?auto_54302 ) ) ( not ( = ?auto_54299 ?auto_54302 ) ) ( IS-CRATE ?auto_54299 ) ( not ( = ?auto_54295 ?auto_54297 ) ) ( not ( = ?auto_54296 ?auto_54297 ) ) ( not ( = ?auto_54304 ?auto_54297 ) ) ( not ( = ?auto_54299 ?auto_54297 ) ) ( not ( = ?auto_54302 ?auto_54297 ) ) ( not ( = ?auto_54303 ?auto_54318 ) ) ( not ( = ?auto_54309 ?auto_54303 ) ) ( not ( = ?auto_54298 ?auto_54303 ) ) ( HOIST-AT ?auto_54305 ?auto_54303 ) ( not ( = ?auto_54315 ?auto_54305 ) ) ( not ( = ?auto_54314 ?auto_54305 ) ) ( not ( = ?auto_54300 ?auto_54305 ) ) ( AVAILABLE ?auto_54305 ) ( SURFACE-AT ?auto_54299 ?auto_54303 ) ( ON ?auto_54299 ?auto_54313 ) ( CLEAR ?auto_54299 ) ( not ( = ?auto_54295 ?auto_54313 ) ) ( not ( = ?auto_54296 ?auto_54313 ) ) ( not ( = ?auto_54304 ?auto_54313 ) ) ( not ( = ?auto_54299 ?auto_54313 ) ) ( not ( = ?auto_54302 ?auto_54313 ) ) ( not ( = ?auto_54297 ?auto_54313 ) ) ( IS-CRATE ?auto_54297 ) ( not ( = ?auto_54295 ?auto_54316 ) ) ( not ( = ?auto_54296 ?auto_54316 ) ) ( not ( = ?auto_54304 ?auto_54316 ) ) ( not ( = ?auto_54299 ?auto_54316 ) ) ( not ( = ?auto_54302 ?auto_54316 ) ) ( not ( = ?auto_54297 ?auto_54316 ) ) ( not ( = ?auto_54313 ?auto_54316 ) ) ( not ( = ?auto_54312 ?auto_54318 ) ) ( not ( = ?auto_54309 ?auto_54312 ) ) ( not ( = ?auto_54298 ?auto_54312 ) ) ( not ( = ?auto_54303 ?auto_54312 ) ) ( HOIST-AT ?auto_54319 ?auto_54312 ) ( not ( = ?auto_54315 ?auto_54319 ) ) ( not ( = ?auto_54314 ?auto_54319 ) ) ( not ( = ?auto_54300 ?auto_54319 ) ) ( not ( = ?auto_54305 ?auto_54319 ) ) ( AVAILABLE ?auto_54319 ) ( SURFACE-AT ?auto_54297 ?auto_54312 ) ( ON ?auto_54297 ?auto_54307 ) ( CLEAR ?auto_54297 ) ( not ( = ?auto_54295 ?auto_54307 ) ) ( not ( = ?auto_54296 ?auto_54307 ) ) ( not ( = ?auto_54304 ?auto_54307 ) ) ( not ( = ?auto_54299 ?auto_54307 ) ) ( not ( = ?auto_54302 ?auto_54307 ) ) ( not ( = ?auto_54297 ?auto_54307 ) ) ( not ( = ?auto_54313 ?auto_54307 ) ) ( not ( = ?auto_54316 ?auto_54307 ) ) ( IS-CRATE ?auto_54316 ) ( not ( = ?auto_54295 ?auto_54306 ) ) ( not ( = ?auto_54296 ?auto_54306 ) ) ( not ( = ?auto_54304 ?auto_54306 ) ) ( not ( = ?auto_54299 ?auto_54306 ) ) ( not ( = ?auto_54302 ?auto_54306 ) ) ( not ( = ?auto_54297 ?auto_54306 ) ) ( not ( = ?auto_54313 ?auto_54306 ) ) ( not ( = ?auto_54316 ?auto_54306 ) ) ( not ( = ?auto_54307 ?auto_54306 ) ) ( AVAILABLE ?auto_54300 ) ( SURFACE-AT ?auto_54316 ?auto_54298 ) ( ON ?auto_54316 ?auto_54308 ) ( CLEAR ?auto_54316 ) ( not ( = ?auto_54295 ?auto_54308 ) ) ( not ( = ?auto_54296 ?auto_54308 ) ) ( not ( = ?auto_54304 ?auto_54308 ) ) ( not ( = ?auto_54299 ?auto_54308 ) ) ( not ( = ?auto_54302 ?auto_54308 ) ) ( not ( = ?auto_54297 ?auto_54308 ) ) ( not ( = ?auto_54313 ?auto_54308 ) ) ( not ( = ?auto_54316 ?auto_54308 ) ) ( not ( = ?auto_54307 ?auto_54308 ) ) ( not ( = ?auto_54306 ?auto_54308 ) ) ( SURFACE-AT ?auto_54310 ?auto_54318 ) ( CLEAR ?auto_54310 ) ( IS-CRATE ?auto_54306 ) ( not ( = ?auto_54295 ?auto_54310 ) ) ( not ( = ?auto_54296 ?auto_54310 ) ) ( not ( = ?auto_54304 ?auto_54310 ) ) ( not ( = ?auto_54299 ?auto_54310 ) ) ( not ( = ?auto_54302 ?auto_54310 ) ) ( not ( = ?auto_54297 ?auto_54310 ) ) ( not ( = ?auto_54313 ?auto_54310 ) ) ( not ( = ?auto_54316 ?auto_54310 ) ) ( not ( = ?auto_54307 ?auto_54310 ) ) ( not ( = ?auto_54306 ?auto_54310 ) ) ( not ( = ?auto_54308 ?auto_54310 ) ) ( AVAILABLE ?auto_54315 ) ( TRUCK-AT ?auto_54317 ?auto_54311 ) ( not ( = ?auto_54311 ?auto_54318 ) ) ( not ( = ?auto_54309 ?auto_54311 ) ) ( not ( = ?auto_54298 ?auto_54311 ) ) ( not ( = ?auto_54303 ?auto_54311 ) ) ( not ( = ?auto_54312 ?auto_54311 ) ) ( HOIST-AT ?auto_54301 ?auto_54311 ) ( not ( = ?auto_54315 ?auto_54301 ) ) ( not ( = ?auto_54314 ?auto_54301 ) ) ( not ( = ?auto_54300 ?auto_54301 ) ) ( not ( = ?auto_54305 ?auto_54301 ) ) ( not ( = ?auto_54319 ?auto_54301 ) ) ( AVAILABLE ?auto_54301 ) ( SURFACE-AT ?auto_54306 ?auto_54311 ) ( ON ?auto_54306 ?auto_54320 ) ( CLEAR ?auto_54306 ) ( not ( = ?auto_54295 ?auto_54320 ) ) ( not ( = ?auto_54296 ?auto_54320 ) ) ( not ( = ?auto_54304 ?auto_54320 ) ) ( not ( = ?auto_54299 ?auto_54320 ) ) ( not ( = ?auto_54302 ?auto_54320 ) ) ( not ( = ?auto_54297 ?auto_54320 ) ) ( not ( = ?auto_54313 ?auto_54320 ) ) ( not ( = ?auto_54316 ?auto_54320 ) ) ( not ( = ?auto_54307 ?auto_54320 ) ) ( not ( = ?auto_54306 ?auto_54320 ) ) ( not ( = ?auto_54308 ?auto_54320 ) ) ( not ( = ?auto_54310 ?auto_54320 ) ) )
    :subtasks
    ( ( !LIFT ?auto_54301 ?auto_54306 ?auto_54320 ?auto_54311 )
      ( MAKE-ON ?auto_54295 ?auto_54296 )
      ( MAKE-ON-VERIFY ?auto_54295 ?auto_54296 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54321 - SURFACE
      ?auto_54322 - SURFACE
    )
    :vars
    (
      ?auto_54323 - HOIST
      ?auto_54345 - PLACE
      ?auto_54332 - PLACE
      ?auto_54324 - HOIST
      ?auto_54327 - SURFACE
      ?auto_54329 - SURFACE
      ?auto_54342 - PLACE
      ?auto_54330 - HOIST
      ?auto_54341 - SURFACE
      ?auto_54325 - SURFACE
      ?auto_54334 - PLACE
      ?auto_54340 - HOIST
      ?auto_54339 - SURFACE
      ?auto_54343 - SURFACE
      ?auto_54326 - PLACE
      ?auto_54346 - HOIST
      ?auto_54337 - SURFACE
      ?auto_54336 - SURFACE
      ?auto_54331 - SURFACE
      ?auto_54328 - SURFACE
      ?auto_54338 - PLACE
      ?auto_54333 - HOIST
      ?auto_54335 - SURFACE
      ?auto_54344 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54323 ?auto_54345 ) ( IS-CRATE ?auto_54321 ) ( not ( = ?auto_54321 ?auto_54322 ) ) ( not ( = ?auto_54332 ?auto_54345 ) ) ( HOIST-AT ?auto_54324 ?auto_54332 ) ( not ( = ?auto_54323 ?auto_54324 ) ) ( AVAILABLE ?auto_54324 ) ( SURFACE-AT ?auto_54321 ?auto_54332 ) ( ON ?auto_54321 ?auto_54327 ) ( CLEAR ?auto_54321 ) ( not ( = ?auto_54321 ?auto_54327 ) ) ( not ( = ?auto_54322 ?auto_54327 ) ) ( IS-CRATE ?auto_54322 ) ( not ( = ?auto_54321 ?auto_54329 ) ) ( not ( = ?auto_54322 ?auto_54329 ) ) ( not ( = ?auto_54327 ?auto_54329 ) ) ( not ( = ?auto_54342 ?auto_54345 ) ) ( not ( = ?auto_54332 ?auto_54342 ) ) ( HOIST-AT ?auto_54330 ?auto_54342 ) ( not ( = ?auto_54323 ?auto_54330 ) ) ( not ( = ?auto_54324 ?auto_54330 ) ) ( SURFACE-AT ?auto_54322 ?auto_54342 ) ( ON ?auto_54322 ?auto_54341 ) ( CLEAR ?auto_54322 ) ( not ( = ?auto_54321 ?auto_54341 ) ) ( not ( = ?auto_54322 ?auto_54341 ) ) ( not ( = ?auto_54327 ?auto_54341 ) ) ( not ( = ?auto_54329 ?auto_54341 ) ) ( IS-CRATE ?auto_54329 ) ( not ( = ?auto_54321 ?auto_54325 ) ) ( not ( = ?auto_54322 ?auto_54325 ) ) ( not ( = ?auto_54327 ?auto_54325 ) ) ( not ( = ?auto_54329 ?auto_54325 ) ) ( not ( = ?auto_54341 ?auto_54325 ) ) ( not ( = ?auto_54334 ?auto_54345 ) ) ( not ( = ?auto_54332 ?auto_54334 ) ) ( not ( = ?auto_54342 ?auto_54334 ) ) ( HOIST-AT ?auto_54340 ?auto_54334 ) ( not ( = ?auto_54323 ?auto_54340 ) ) ( not ( = ?auto_54324 ?auto_54340 ) ) ( not ( = ?auto_54330 ?auto_54340 ) ) ( AVAILABLE ?auto_54340 ) ( SURFACE-AT ?auto_54329 ?auto_54334 ) ( ON ?auto_54329 ?auto_54339 ) ( CLEAR ?auto_54329 ) ( not ( = ?auto_54321 ?auto_54339 ) ) ( not ( = ?auto_54322 ?auto_54339 ) ) ( not ( = ?auto_54327 ?auto_54339 ) ) ( not ( = ?auto_54329 ?auto_54339 ) ) ( not ( = ?auto_54341 ?auto_54339 ) ) ( not ( = ?auto_54325 ?auto_54339 ) ) ( IS-CRATE ?auto_54325 ) ( not ( = ?auto_54321 ?auto_54343 ) ) ( not ( = ?auto_54322 ?auto_54343 ) ) ( not ( = ?auto_54327 ?auto_54343 ) ) ( not ( = ?auto_54329 ?auto_54343 ) ) ( not ( = ?auto_54341 ?auto_54343 ) ) ( not ( = ?auto_54325 ?auto_54343 ) ) ( not ( = ?auto_54339 ?auto_54343 ) ) ( not ( = ?auto_54326 ?auto_54345 ) ) ( not ( = ?auto_54332 ?auto_54326 ) ) ( not ( = ?auto_54342 ?auto_54326 ) ) ( not ( = ?auto_54334 ?auto_54326 ) ) ( HOIST-AT ?auto_54346 ?auto_54326 ) ( not ( = ?auto_54323 ?auto_54346 ) ) ( not ( = ?auto_54324 ?auto_54346 ) ) ( not ( = ?auto_54330 ?auto_54346 ) ) ( not ( = ?auto_54340 ?auto_54346 ) ) ( AVAILABLE ?auto_54346 ) ( SURFACE-AT ?auto_54325 ?auto_54326 ) ( ON ?auto_54325 ?auto_54337 ) ( CLEAR ?auto_54325 ) ( not ( = ?auto_54321 ?auto_54337 ) ) ( not ( = ?auto_54322 ?auto_54337 ) ) ( not ( = ?auto_54327 ?auto_54337 ) ) ( not ( = ?auto_54329 ?auto_54337 ) ) ( not ( = ?auto_54341 ?auto_54337 ) ) ( not ( = ?auto_54325 ?auto_54337 ) ) ( not ( = ?auto_54339 ?auto_54337 ) ) ( not ( = ?auto_54343 ?auto_54337 ) ) ( IS-CRATE ?auto_54343 ) ( not ( = ?auto_54321 ?auto_54336 ) ) ( not ( = ?auto_54322 ?auto_54336 ) ) ( not ( = ?auto_54327 ?auto_54336 ) ) ( not ( = ?auto_54329 ?auto_54336 ) ) ( not ( = ?auto_54341 ?auto_54336 ) ) ( not ( = ?auto_54325 ?auto_54336 ) ) ( not ( = ?auto_54339 ?auto_54336 ) ) ( not ( = ?auto_54343 ?auto_54336 ) ) ( not ( = ?auto_54337 ?auto_54336 ) ) ( AVAILABLE ?auto_54330 ) ( SURFACE-AT ?auto_54343 ?auto_54342 ) ( ON ?auto_54343 ?auto_54331 ) ( CLEAR ?auto_54343 ) ( not ( = ?auto_54321 ?auto_54331 ) ) ( not ( = ?auto_54322 ?auto_54331 ) ) ( not ( = ?auto_54327 ?auto_54331 ) ) ( not ( = ?auto_54329 ?auto_54331 ) ) ( not ( = ?auto_54341 ?auto_54331 ) ) ( not ( = ?auto_54325 ?auto_54331 ) ) ( not ( = ?auto_54339 ?auto_54331 ) ) ( not ( = ?auto_54343 ?auto_54331 ) ) ( not ( = ?auto_54337 ?auto_54331 ) ) ( not ( = ?auto_54336 ?auto_54331 ) ) ( SURFACE-AT ?auto_54328 ?auto_54345 ) ( CLEAR ?auto_54328 ) ( IS-CRATE ?auto_54336 ) ( not ( = ?auto_54321 ?auto_54328 ) ) ( not ( = ?auto_54322 ?auto_54328 ) ) ( not ( = ?auto_54327 ?auto_54328 ) ) ( not ( = ?auto_54329 ?auto_54328 ) ) ( not ( = ?auto_54341 ?auto_54328 ) ) ( not ( = ?auto_54325 ?auto_54328 ) ) ( not ( = ?auto_54339 ?auto_54328 ) ) ( not ( = ?auto_54343 ?auto_54328 ) ) ( not ( = ?auto_54337 ?auto_54328 ) ) ( not ( = ?auto_54336 ?auto_54328 ) ) ( not ( = ?auto_54331 ?auto_54328 ) ) ( AVAILABLE ?auto_54323 ) ( not ( = ?auto_54338 ?auto_54345 ) ) ( not ( = ?auto_54332 ?auto_54338 ) ) ( not ( = ?auto_54342 ?auto_54338 ) ) ( not ( = ?auto_54334 ?auto_54338 ) ) ( not ( = ?auto_54326 ?auto_54338 ) ) ( HOIST-AT ?auto_54333 ?auto_54338 ) ( not ( = ?auto_54323 ?auto_54333 ) ) ( not ( = ?auto_54324 ?auto_54333 ) ) ( not ( = ?auto_54330 ?auto_54333 ) ) ( not ( = ?auto_54340 ?auto_54333 ) ) ( not ( = ?auto_54346 ?auto_54333 ) ) ( AVAILABLE ?auto_54333 ) ( SURFACE-AT ?auto_54336 ?auto_54338 ) ( ON ?auto_54336 ?auto_54335 ) ( CLEAR ?auto_54336 ) ( not ( = ?auto_54321 ?auto_54335 ) ) ( not ( = ?auto_54322 ?auto_54335 ) ) ( not ( = ?auto_54327 ?auto_54335 ) ) ( not ( = ?auto_54329 ?auto_54335 ) ) ( not ( = ?auto_54341 ?auto_54335 ) ) ( not ( = ?auto_54325 ?auto_54335 ) ) ( not ( = ?auto_54339 ?auto_54335 ) ) ( not ( = ?auto_54343 ?auto_54335 ) ) ( not ( = ?auto_54337 ?auto_54335 ) ) ( not ( = ?auto_54336 ?auto_54335 ) ) ( not ( = ?auto_54331 ?auto_54335 ) ) ( not ( = ?auto_54328 ?auto_54335 ) ) ( TRUCK-AT ?auto_54344 ?auto_54345 ) )
    :subtasks
    ( ( !DRIVE ?auto_54344 ?auto_54345 ?auto_54338 )
      ( MAKE-ON ?auto_54321 ?auto_54322 )
      ( MAKE-ON-VERIFY ?auto_54321 ?auto_54322 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54347 - SURFACE
      ?auto_54348 - SURFACE
    )
    :vars
    (
      ?auto_54357 - HOIST
      ?auto_54351 - PLACE
      ?auto_54356 - PLACE
      ?auto_54359 - HOIST
      ?auto_54361 - SURFACE
      ?auto_54371 - SURFACE
      ?auto_54369 - PLACE
      ?auto_54353 - HOIST
      ?auto_54368 - SURFACE
      ?auto_54360 - SURFACE
      ?auto_54363 - PLACE
      ?auto_54367 - HOIST
      ?auto_54366 - SURFACE
      ?auto_54370 - SURFACE
      ?auto_54354 - PLACE
      ?auto_54365 - HOIST
      ?auto_54349 - SURFACE
      ?auto_54362 - SURFACE
      ?auto_54372 - SURFACE
      ?auto_54364 - SURFACE
      ?auto_54350 - PLACE
      ?auto_54355 - HOIST
      ?auto_54358 - SURFACE
      ?auto_54352 - TRUCK
      ?auto_54373 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54357 ?auto_54351 ) ( IS-CRATE ?auto_54347 ) ( not ( = ?auto_54347 ?auto_54348 ) ) ( not ( = ?auto_54356 ?auto_54351 ) ) ( HOIST-AT ?auto_54359 ?auto_54356 ) ( not ( = ?auto_54357 ?auto_54359 ) ) ( AVAILABLE ?auto_54359 ) ( SURFACE-AT ?auto_54347 ?auto_54356 ) ( ON ?auto_54347 ?auto_54361 ) ( CLEAR ?auto_54347 ) ( not ( = ?auto_54347 ?auto_54361 ) ) ( not ( = ?auto_54348 ?auto_54361 ) ) ( IS-CRATE ?auto_54348 ) ( not ( = ?auto_54347 ?auto_54371 ) ) ( not ( = ?auto_54348 ?auto_54371 ) ) ( not ( = ?auto_54361 ?auto_54371 ) ) ( not ( = ?auto_54369 ?auto_54351 ) ) ( not ( = ?auto_54356 ?auto_54369 ) ) ( HOIST-AT ?auto_54353 ?auto_54369 ) ( not ( = ?auto_54357 ?auto_54353 ) ) ( not ( = ?auto_54359 ?auto_54353 ) ) ( SURFACE-AT ?auto_54348 ?auto_54369 ) ( ON ?auto_54348 ?auto_54368 ) ( CLEAR ?auto_54348 ) ( not ( = ?auto_54347 ?auto_54368 ) ) ( not ( = ?auto_54348 ?auto_54368 ) ) ( not ( = ?auto_54361 ?auto_54368 ) ) ( not ( = ?auto_54371 ?auto_54368 ) ) ( IS-CRATE ?auto_54371 ) ( not ( = ?auto_54347 ?auto_54360 ) ) ( not ( = ?auto_54348 ?auto_54360 ) ) ( not ( = ?auto_54361 ?auto_54360 ) ) ( not ( = ?auto_54371 ?auto_54360 ) ) ( not ( = ?auto_54368 ?auto_54360 ) ) ( not ( = ?auto_54363 ?auto_54351 ) ) ( not ( = ?auto_54356 ?auto_54363 ) ) ( not ( = ?auto_54369 ?auto_54363 ) ) ( HOIST-AT ?auto_54367 ?auto_54363 ) ( not ( = ?auto_54357 ?auto_54367 ) ) ( not ( = ?auto_54359 ?auto_54367 ) ) ( not ( = ?auto_54353 ?auto_54367 ) ) ( AVAILABLE ?auto_54367 ) ( SURFACE-AT ?auto_54371 ?auto_54363 ) ( ON ?auto_54371 ?auto_54366 ) ( CLEAR ?auto_54371 ) ( not ( = ?auto_54347 ?auto_54366 ) ) ( not ( = ?auto_54348 ?auto_54366 ) ) ( not ( = ?auto_54361 ?auto_54366 ) ) ( not ( = ?auto_54371 ?auto_54366 ) ) ( not ( = ?auto_54368 ?auto_54366 ) ) ( not ( = ?auto_54360 ?auto_54366 ) ) ( IS-CRATE ?auto_54360 ) ( not ( = ?auto_54347 ?auto_54370 ) ) ( not ( = ?auto_54348 ?auto_54370 ) ) ( not ( = ?auto_54361 ?auto_54370 ) ) ( not ( = ?auto_54371 ?auto_54370 ) ) ( not ( = ?auto_54368 ?auto_54370 ) ) ( not ( = ?auto_54360 ?auto_54370 ) ) ( not ( = ?auto_54366 ?auto_54370 ) ) ( not ( = ?auto_54354 ?auto_54351 ) ) ( not ( = ?auto_54356 ?auto_54354 ) ) ( not ( = ?auto_54369 ?auto_54354 ) ) ( not ( = ?auto_54363 ?auto_54354 ) ) ( HOIST-AT ?auto_54365 ?auto_54354 ) ( not ( = ?auto_54357 ?auto_54365 ) ) ( not ( = ?auto_54359 ?auto_54365 ) ) ( not ( = ?auto_54353 ?auto_54365 ) ) ( not ( = ?auto_54367 ?auto_54365 ) ) ( AVAILABLE ?auto_54365 ) ( SURFACE-AT ?auto_54360 ?auto_54354 ) ( ON ?auto_54360 ?auto_54349 ) ( CLEAR ?auto_54360 ) ( not ( = ?auto_54347 ?auto_54349 ) ) ( not ( = ?auto_54348 ?auto_54349 ) ) ( not ( = ?auto_54361 ?auto_54349 ) ) ( not ( = ?auto_54371 ?auto_54349 ) ) ( not ( = ?auto_54368 ?auto_54349 ) ) ( not ( = ?auto_54360 ?auto_54349 ) ) ( not ( = ?auto_54366 ?auto_54349 ) ) ( not ( = ?auto_54370 ?auto_54349 ) ) ( IS-CRATE ?auto_54370 ) ( not ( = ?auto_54347 ?auto_54362 ) ) ( not ( = ?auto_54348 ?auto_54362 ) ) ( not ( = ?auto_54361 ?auto_54362 ) ) ( not ( = ?auto_54371 ?auto_54362 ) ) ( not ( = ?auto_54368 ?auto_54362 ) ) ( not ( = ?auto_54360 ?auto_54362 ) ) ( not ( = ?auto_54366 ?auto_54362 ) ) ( not ( = ?auto_54370 ?auto_54362 ) ) ( not ( = ?auto_54349 ?auto_54362 ) ) ( AVAILABLE ?auto_54353 ) ( SURFACE-AT ?auto_54370 ?auto_54369 ) ( ON ?auto_54370 ?auto_54372 ) ( CLEAR ?auto_54370 ) ( not ( = ?auto_54347 ?auto_54372 ) ) ( not ( = ?auto_54348 ?auto_54372 ) ) ( not ( = ?auto_54361 ?auto_54372 ) ) ( not ( = ?auto_54371 ?auto_54372 ) ) ( not ( = ?auto_54368 ?auto_54372 ) ) ( not ( = ?auto_54360 ?auto_54372 ) ) ( not ( = ?auto_54366 ?auto_54372 ) ) ( not ( = ?auto_54370 ?auto_54372 ) ) ( not ( = ?auto_54349 ?auto_54372 ) ) ( not ( = ?auto_54362 ?auto_54372 ) ) ( IS-CRATE ?auto_54362 ) ( not ( = ?auto_54347 ?auto_54364 ) ) ( not ( = ?auto_54348 ?auto_54364 ) ) ( not ( = ?auto_54361 ?auto_54364 ) ) ( not ( = ?auto_54371 ?auto_54364 ) ) ( not ( = ?auto_54368 ?auto_54364 ) ) ( not ( = ?auto_54360 ?auto_54364 ) ) ( not ( = ?auto_54366 ?auto_54364 ) ) ( not ( = ?auto_54370 ?auto_54364 ) ) ( not ( = ?auto_54349 ?auto_54364 ) ) ( not ( = ?auto_54362 ?auto_54364 ) ) ( not ( = ?auto_54372 ?auto_54364 ) ) ( not ( = ?auto_54350 ?auto_54351 ) ) ( not ( = ?auto_54356 ?auto_54350 ) ) ( not ( = ?auto_54369 ?auto_54350 ) ) ( not ( = ?auto_54363 ?auto_54350 ) ) ( not ( = ?auto_54354 ?auto_54350 ) ) ( HOIST-AT ?auto_54355 ?auto_54350 ) ( not ( = ?auto_54357 ?auto_54355 ) ) ( not ( = ?auto_54359 ?auto_54355 ) ) ( not ( = ?auto_54353 ?auto_54355 ) ) ( not ( = ?auto_54367 ?auto_54355 ) ) ( not ( = ?auto_54365 ?auto_54355 ) ) ( AVAILABLE ?auto_54355 ) ( SURFACE-AT ?auto_54362 ?auto_54350 ) ( ON ?auto_54362 ?auto_54358 ) ( CLEAR ?auto_54362 ) ( not ( = ?auto_54347 ?auto_54358 ) ) ( not ( = ?auto_54348 ?auto_54358 ) ) ( not ( = ?auto_54361 ?auto_54358 ) ) ( not ( = ?auto_54371 ?auto_54358 ) ) ( not ( = ?auto_54368 ?auto_54358 ) ) ( not ( = ?auto_54360 ?auto_54358 ) ) ( not ( = ?auto_54366 ?auto_54358 ) ) ( not ( = ?auto_54370 ?auto_54358 ) ) ( not ( = ?auto_54349 ?auto_54358 ) ) ( not ( = ?auto_54362 ?auto_54358 ) ) ( not ( = ?auto_54372 ?auto_54358 ) ) ( not ( = ?auto_54364 ?auto_54358 ) ) ( TRUCK-AT ?auto_54352 ?auto_54351 ) ( SURFACE-AT ?auto_54373 ?auto_54351 ) ( CLEAR ?auto_54373 ) ( LIFTING ?auto_54357 ?auto_54364 ) ( IS-CRATE ?auto_54364 ) ( not ( = ?auto_54347 ?auto_54373 ) ) ( not ( = ?auto_54348 ?auto_54373 ) ) ( not ( = ?auto_54361 ?auto_54373 ) ) ( not ( = ?auto_54371 ?auto_54373 ) ) ( not ( = ?auto_54368 ?auto_54373 ) ) ( not ( = ?auto_54360 ?auto_54373 ) ) ( not ( = ?auto_54366 ?auto_54373 ) ) ( not ( = ?auto_54370 ?auto_54373 ) ) ( not ( = ?auto_54349 ?auto_54373 ) ) ( not ( = ?auto_54362 ?auto_54373 ) ) ( not ( = ?auto_54372 ?auto_54373 ) ) ( not ( = ?auto_54364 ?auto_54373 ) ) ( not ( = ?auto_54358 ?auto_54373 ) ) )
    :subtasks
    ( ( !DROP ?auto_54357 ?auto_54364 ?auto_54373 ?auto_54351 )
      ( MAKE-ON ?auto_54347 ?auto_54348 )
      ( MAKE-ON-VERIFY ?auto_54347 ?auto_54348 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54374 - SURFACE
      ?auto_54375 - SURFACE
    )
    :vars
    (
      ?auto_54392 - HOIST
      ?auto_54400 - PLACE
      ?auto_54398 - PLACE
      ?auto_54387 - HOIST
      ?auto_54395 - SURFACE
      ?auto_54377 - SURFACE
      ?auto_54379 - PLACE
      ?auto_54390 - HOIST
      ?auto_54385 - SURFACE
      ?auto_54396 - SURFACE
      ?auto_54389 - PLACE
      ?auto_54384 - HOIST
      ?auto_54383 - SURFACE
      ?auto_54378 - SURFACE
      ?auto_54386 - PLACE
      ?auto_54382 - HOIST
      ?auto_54393 - SURFACE
      ?auto_54397 - SURFACE
      ?auto_54381 - SURFACE
      ?auto_54376 - SURFACE
      ?auto_54391 - PLACE
      ?auto_54380 - HOIST
      ?auto_54399 - SURFACE
      ?auto_54388 - TRUCK
      ?auto_54394 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54392 ?auto_54400 ) ( IS-CRATE ?auto_54374 ) ( not ( = ?auto_54374 ?auto_54375 ) ) ( not ( = ?auto_54398 ?auto_54400 ) ) ( HOIST-AT ?auto_54387 ?auto_54398 ) ( not ( = ?auto_54392 ?auto_54387 ) ) ( AVAILABLE ?auto_54387 ) ( SURFACE-AT ?auto_54374 ?auto_54398 ) ( ON ?auto_54374 ?auto_54395 ) ( CLEAR ?auto_54374 ) ( not ( = ?auto_54374 ?auto_54395 ) ) ( not ( = ?auto_54375 ?auto_54395 ) ) ( IS-CRATE ?auto_54375 ) ( not ( = ?auto_54374 ?auto_54377 ) ) ( not ( = ?auto_54375 ?auto_54377 ) ) ( not ( = ?auto_54395 ?auto_54377 ) ) ( not ( = ?auto_54379 ?auto_54400 ) ) ( not ( = ?auto_54398 ?auto_54379 ) ) ( HOIST-AT ?auto_54390 ?auto_54379 ) ( not ( = ?auto_54392 ?auto_54390 ) ) ( not ( = ?auto_54387 ?auto_54390 ) ) ( SURFACE-AT ?auto_54375 ?auto_54379 ) ( ON ?auto_54375 ?auto_54385 ) ( CLEAR ?auto_54375 ) ( not ( = ?auto_54374 ?auto_54385 ) ) ( not ( = ?auto_54375 ?auto_54385 ) ) ( not ( = ?auto_54395 ?auto_54385 ) ) ( not ( = ?auto_54377 ?auto_54385 ) ) ( IS-CRATE ?auto_54377 ) ( not ( = ?auto_54374 ?auto_54396 ) ) ( not ( = ?auto_54375 ?auto_54396 ) ) ( not ( = ?auto_54395 ?auto_54396 ) ) ( not ( = ?auto_54377 ?auto_54396 ) ) ( not ( = ?auto_54385 ?auto_54396 ) ) ( not ( = ?auto_54389 ?auto_54400 ) ) ( not ( = ?auto_54398 ?auto_54389 ) ) ( not ( = ?auto_54379 ?auto_54389 ) ) ( HOIST-AT ?auto_54384 ?auto_54389 ) ( not ( = ?auto_54392 ?auto_54384 ) ) ( not ( = ?auto_54387 ?auto_54384 ) ) ( not ( = ?auto_54390 ?auto_54384 ) ) ( AVAILABLE ?auto_54384 ) ( SURFACE-AT ?auto_54377 ?auto_54389 ) ( ON ?auto_54377 ?auto_54383 ) ( CLEAR ?auto_54377 ) ( not ( = ?auto_54374 ?auto_54383 ) ) ( not ( = ?auto_54375 ?auto_54383 ) ) ( not ( = ?auto_54395 ?auto_54383 ) ) ( not ( = ?auto_54377 ?auto_54383 ) ) ( not ( = ?auto_54385 ?auto_54383 ) ) ( not ( = ?auto_54396 ?auto_54383 ) ) ( IS-CRATE ?auto_54396 ) ( not ( = ?auto_54374 ?auto_54378 ) ) ( not ( = ?auto_54375 ?auto_54378 ) ) ( not ( = ?auto_54395 ?auto_54378 ) ) ( not ( = ?auto_54377 ?auto_54378 ) ) ( not ( = ?auto_54385 ?auto_54378 ) ) ( not ( = ?auto_54396 ?auto_54378 ) ) ( not ( = ?auto_54383 ?auto_54378 ) ) ( not ( = ?auto_54386 ?auto_54400 ) ) ( not ( = ?auto_54398 ?auto_54386 ) ) ( not ( = ?auto_54379 ?auto_54386 ) ) ( not ( = ?auto_54389 ?auto_54386 ) ) ( HOIST-AT ?auto_54382 ?auto_54386 ) ( not ( = ?auto_54392 ?auto_54382 ) ) ( not ( = ?auto_54387 ?auto_54382 ) ) ( not ( = ?auto_54390 ?auto_54382 ) ) ( not ( = ?auto_54384 ?auto_54382 ) ) ( AVAILABLE ?auto_54382 ) ( SURFACE-AT ?auto_54396 ?auto_54386 ) ( ON ?auto_54396 ?auto_54393 ) ( CLEAR ?auto_54396 ) ( not ( = ?auto_54374 ?auto_54393 ) ) ( not ( = ?auto_54375 ?auto_54393 ) ) ( not ( = ?auto_54395 ?auto_54393 ) ) ( not ( = ?auto_54377 ?auto_54393 ) ) ( not ( = ?auto_54385 ?auto_54393 ) ) ( not ( = ?auto_54396 ?auto_54393 ) ) ( not ( = ?auto_54383 ?auto_54393 ) ) ( not ( = ?auto_54378 ?auto_54393 ) ) ( IS-CRATE ?auto_54378 ) ( not ( = ?auto_54374 ?auto_54397 ) ) ( not ( = ?auto_54375 ?auto_54397 ) ) ( not ( = ?auto_54395 ?auto_54397 ) ) ( not ( = ?auto_54377 ?auto_54397 ) ) ( not ( = ?auto_54385 ?auto_54397 ) ) ( not ( = ?auto_54396 ?auto_54397 ) ) ( not ( = ?auto_54383 ?auto_54397 ) ) ( not ( = ?auto_54378 ?auto_54397 ) ) ( not ( = ?auto_54393 ?auto_54397 ) ) ( AVAILABLE ?auto_54390 ) ( SURFACE-AT ?auto_54378 ?auto_54379 ) ( ON ?auto_54378 ?auto_54381 ) ( CLEAR ?auto_54378 ) ( not ( = ?auto_54374 ?auto_54381 ) ) ( not ( = ?auto_54375 ?auto_54381 ) ) ( not ( = ?auto_54395 ?auto_54381 ) ) ( not ( = ?auto_54377 ?auto_54381 ) ) ( not ( = ?auto_54385 ?auto_54381 ) ) ( not ( = ?auto_54396 ?auto_54381 ) ) ( not ( = ?auto_54383 ?auto_54381 ) ) ( not ( = ?auto_54378 ?auto_54381 ) ) ( not ( = ?auto_54393 ?auto_54381 ) ) ( not ( = ?auto_54397 ?auto_54381 ) ) ( IS-CRATE ?auto_54397 ) ( not ( = ?auto_54374 ?auto_54376 ) ) ( not ( = ?auto_54375 ?auto_54376 ) ) ( not ( = ?auto_54395 ?auto_54376 ) ) ( not ( = ?auto_54377 ?auto_54376 ) ) ( not ( = ?auto_54385 ?auto_54376 ) ) ( not ( = ?auto_54396 ?auto_54376 ) ) ( not ( = ?auto_54383 ?auto_54376 ) ) ( not ( = ?auto_54378 ?auto_54376 ) ) ( not ( = ?auto_54393 ?auto_54376 ) ) ( not ( = ?auto_54397 ?auto_54376 ) ) ( not ( = ?auto_54381 ?auto_54376 ) ) ( not ( = ?auto_54391 ?auto_54400 ) ) ( not ( = ?auto_54398 ?auto_54391 ) ) ( not ( = ?auto_54379 ?auto_54391 ) ) ( not ( = ?auto_54389 ?auto_54391 ) ) ( not ( = ?auto_54386 ?auto_54391 ) ) ( HOIST-AT ?auto_54380 ?auto_54391 ) ( not ( = ?auto_54392 ?auto_54380 ) ) ( not ( = ?auto_54387 ?auto_54380 ) ) ( not ( = ?auto_54390 ?auto_54380 ) ) ( not ( = ?auto_54384 ?auto_54380 ) ) ( not ( = ?auto_54382 ?auto_54380 ) ) ( AVAILABLE ?auto_54380 ) ( SURFACE-AT ?auto_54397 ?auto_54391 ) ( ON ?auto_54397 ?auto_54399 ) ( CLEAR ?auto_54397 ) ( not ( = ?auto_54374 ?auto_54399 ) ) ( not ( = ?auto_54375 ?auto_54399 ) ) ( not ( = ?auto_54395 ?auto_54399 ) ) ( not ( = ?auto_54377 ?auto_54399 ) ) ( not ( = ?auto_54385 ?auto_54399 ) ) ( not ( = ?auto_54396 ?auto_54399 ) ) ( not ( = ?auto_54383 ?auto_54399 ) ) ( not ( = ?auto_54378 ?auto_54399 ) ) ( not ( = ?auto_54393 ?auto_54399 ) ) ( not ( = ?auto_54397 ?auto_54399 ) ) ( not ( = ?auto_54381 ?auto_54399 ) ) ( not ( = ?auto_54376 ?auto_54399 ) ) ( TRUCK-AT ?auto_54388 ?auto_54400 ) ( SURFACE-AT ?auto_54394 ?auto_54400 ) ( CLEAR ?auto_54394 ) ( IS-CRATE ?auto_54376 ) ( not ( = ?auto_54374 ?auto_54394 ) ) ( not ( = ?auto_54375 ?auto_54394 ) ) ( not ( = ?auto_54395 ?auto_54394 ) ) ( not ( = ?auto_54377 ?auto_54394 ) ) ( not ( = ?auto_54385 ?auto_54394 ) ) ( not ( = ?auto_54396 ?auto_54394 ) ) ( not ( = ?auto_54383 ?auto_54394 ) ) ( not ( = ?auto_54378 ?auto_54394 ) ) ( not ( = ?auto_54393 ?auto_54394 ) ) ( not ( = ?auto_54397 ?auto_54394 ) ) ( not ( = ?auto_54381 ?auto_54394 ) ) ( not ( = ?auto_54376 ?auto_54394 ) ) ( not ( = ?auto_54399 ?auto_54394 ) ) ( AVAILABLE ?auto_54392 ) ( IN ?auto_54376 ?auto_54388 ) )
    :subtasks
    ( ( !UNLOAD ?auto_54392 ?auto_54376 ?auto_54388 ?auto_54400 )
      ( MAKE-ON ?auto_54374 ?auto_54375 )
      ( MAKE-ON-VERIFY ?auto_54374 ?auto_54375 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54401 - SURFACE
      ?auto_54402 - SURFACE
    )
    :vars
    (
      ?auto_54415 - HOIST
      ?auto_54404 - PLACE
      ?auto_54421 - PLACE
      ?auto_54403 - HOIST
      ?auto_54418 - SURFACE
      ?auto_54407 - SURFACE
      ?auto_54425 - PLACE
      ?auto_54417 - HOIST
      ?auto_54408 - SURFACE
      ?auto_54419 - SURFACE
      ?auto_54413 - PLACE
      ?auto_54424 - HOIST
      ?auto_54410 - SURFACE
      ?auto_54414 - SURFACE
      ?auto_54405 - PLACE
      ?auto_54411 - HOIST
      ?auto_54426 - SURFACE
      ?auto_54420 - SURFACE
      ?auto_54409 - SURFACE
      ?auto_54416 - SURFACE
      ?auto_54422 - PLACE
      ?auto_54423 - HOIST
      ?auto_54412 - SURFACE
      ?auto_54427 - SURFACE
      ?auto_54406 - TRUCK
      ?auto_54428 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54415 ?auto_54404 ) ( IS-CRATE ?auto_54401 ) ( not ( = ?auto_54401 ?auto_54402 ) ) ( not ( = ?auto_54421 ?auto_54404 ) ) ( HOIST-AT ?auto_54403 ?auto_54421 ) ( not ( = ?auto_54415 ?auto_54403 ) ) ( AVAILABLE ?auto_54403 ) ( SURFACE-AT ?auto_54401 ?auto_54421 ) ( ON ?auto_54401 ?auto_54418 ) ( CLEAR ?auto_54401 ) ( not ( = ?auto_54401 ?auto_54418 ) ) ( not ( = ?auto_54402 ?auto_54418 ) ) ( IS-CRATE ?auto_54402 ) ( not ( = ?auto_54401 ?auto_54407 ) ) ( not ( = ?auto_54402 ?auto_54407 ) ) ( not ( = ?auto_54418 ?auto_54407 ) ) ( not ( = ?auto_54425 ?auto_54404 ) ) ( not ( = ?auto_54421 ?auto_54425 ) ) ( HOIST-AT ?auto_54417 ?auto_54425 ) ( not ( = ?auto_54415 ?auto_54417 ) ) ( not ( = ?auto_54403 ?auto_54417 ) ) ( SURFACE-AT ?auto_54402 ?auto_54425 ) ( ON ?auto_54402 ?auto_54408 ) ( CLEAR ?auto_54402 ) ( not ( = ?auto_54401 ?auto_54408 ) ) ( not ( = ?auto_54402 ?auto_54408 ) ) ( not ( = ?auto_54418 ?auto_54408 ) ) ( not ( = ?auto_54407 ?auto_54408 ) ) ( IS-CRATE ?auto_54407 ) ( not ( = ?auto_54401 ?auto_54419 ) ) ( not ( = ?auto_54402 ?auto_54419 ) ) ( not ( = ?auto_54418 ?auto_54419 ) ) ( not ( = ?auto_54407 ?auto_54419 ) ) ( not ( = ?auto_54408 ?auto_54419 ) ) ( not ( = ?auto_54413 ?auto_54404 ) ) ( not ( = ?auto_54421 ?auto_54413 ) ) ( not ( = ?auto_54425 ?auto_54413 ) ) ( HOIST-AT ?auto_54424 ?auto_54413 ) ( not ( = ?auto_54415 ?auto_54424 ) ) ( not ( = ?auto_54403 ?auto_54424 ) ) ( not ( = ?auto_54417 ?auto_54424 ) ) ( AVAILABLE ?auto_54424 ) ( SURFACE-AT ?auto_54407 ?auto_54413 ) ( ON ?auto_54407 ?auto_54410 ) ( CLEAR ?auto_54407 ) ( not ( = ?auto_54401 ?auto_54410 ) ) ( not ( = ?auto_54402 ?auto_54410 ) ) ( not ( = ?auto_54418 ?auto_54410 ) ) ( not ( = ?auto_54407 ?auto_54410 ) ) ( not ( = ?auto_54408 ?auto_54410 ) ) ( not ( = ?auto_54419 ?auto_54410 ) ) ( IS-CRATE ?auto_54419 ) ( not ( = ?auto_54401 ?auto_54414 ) ) ( not ( = ?auto_54402 ?auto_54414 ) ) ( not ( = ?auto_54418 ?auto_54414 ) ) ( not ( = ?auto_54407 ?auto_54414 ) ) ( not ( = ?auto_54408 ?auto_54414 ) ) ( not ( = ?auto_54419 ?auto_54414 ) ) ( not ( = ?auto_54410 ?auto_54414 ) ) ( not ( = ?auto_54405 ?auto_54404 ) ) ( not ( = ?auto_54421 ?auto_54405 ) ) ( not ( = ?auto_54425 ?auto_54405 ) ) ( not ( = ?auto_54413 ?auto_54405 ) ) ( HOIST-AT ?auto_54411 ?auto_54405 ) ( not ( = ?auto_54415 ?auto_54411 ) ) ( not ( = ?auto_54403 ?auto_54411 ) ) ( not ( = ?auto_54417 ?auto_54411 ) ) ( not ( = ?auto_54424 ?auto_54411 ) ) ( AVAILABLE ?auto_54411 ) ( SURFACE-AT ?auto_54419 ?auto_54405 ) ( ON ?auto_54419 ?auto_54426 ) ( CLEAR ?auto_54419 ) ( not ( = ?auto_54401 ?auto_54426 ) ) ( not ( = ?auto_54402 ?auto_54426 ) ) ( not ( = ?auto_54418 ?auto_54426 ) ) ( not ( = ?auto_54407 ?auto_54426 ) ) ( not ( = ?auto_54408 ?auto_54426 ) ) ( not ( = ?auto_54419 ?auto_54426 ) ) ( not ( = ?auto_54410 ?auto_54426 ) ) ( not ( = ?auto_54414 ?auto_54426 ) ) ( IS-CRATE ?auto_54414 ) ( not ( = ?auto_54401 ?auto_54420 ) ) ( not ( = ?auto_54402 ?auto_54420 ) ) ( not ( = ?auto_54418 ?auto_54420 ) ) ( not ( = ?auto_54407 ?auto_54420 ) ) ( not ( = ?auto_54408 ?auto_54420 ) ) ( not ( = ?auto_54419 ?auto_54420 ) ) ( not ( = ?auto_54410 ?auto_54420 ) ) ( not ( = ?auto_54414 ?auto_54420 ) ) ( not ( = ?auto_54426 ?auto_54420 ) ) ( AVAILABLE ?auto_54417 ) ( SURFACE-AT ?auto_54414 ?auto_54425 ) ( ON ?auto_54414 ?auto_54409 ) ( CLEAR ?auto_54414 ) ( not ( = ?auto_54401 ?auto_54409 ) ) ( not ( = ?auto_54402 ?auto_54409 ) ) ( not ( = ?auto_54418 ?auto_54409 ) ) ( not ( = ?auto_54407 ?auto_54409 ) ) ( not ( = ?auto_54408 ?auto_54409 ) ) ( not ( = ?auto_54419 ?auto_54409 ) ) ( not ( = ?auto_54410 ?auto_54409 ) ) ( not ( = ?auto_54414 ?auto_54409 ) ) ( not ( = ?auto_54426 ?auto_54409 ) ) ( not ( = ?auto_54420 ?auto_54409 ) ) ( IS-CRATE ?auto_54420 ) ( not ( = ?auto_54401 ?auto_54416 ) ) ( not ( = ?auto_54402 ?auto_54416 ) ) ( not ( = ?auto_54418 ?auto_54416 ) ) ( not ( = ?auto_54407 ?auto_54416 ) ) ( not ( = ?auto_54408 ?auto_54416 ) ) ( not ( = ?auto_54419 ?auto_54416 ) ) ( not ( = ?auto_54410 ?auto_54416 ) ) ( not ( = ?auto_54414 ?auto_54416 ) ) ( not ( = ?auto_54426 ?auto_54416 ) ) ( not ( = ?auto_54420 ?auto_54416 ) ) ( not ( = ?auto_54409 ?auto_54416 ) ) ( not ( = ?auto_54422 ?auto_54404 ) ) ( not ( = ?auto_54421 ?auto_54422 ) ) ( not ( = ?auto_54425 ?auto_54422 ) ) ( not ( = ?auto_54413 ?auto_54422 ) ) ( not ( = ?auto_54405 ?auto_54422 ) ) ( HOIST-AT ?auto_54423 ?auto_54422 ) ( not ( = ?auto_54415 ?auto_54423 ) ) ( not ( = ?auto_54403 ?auto_54423 ) ) ( not ( = ?auto_54417 ?auto_54423 ) ) ( not ( = ?auto_54424 ?auto_54423 ) ) ( not ( = ?auto_54411 ?auto_54423 ) ) ( AVAILABLE ?auto_54423 ) ( SURFACE-AT ?auto_54420 ?auto_54422 ) ( ON ?auto_54420 ?auto_54412 ) ( CLEAR ?auto_54420 ) ( not ( = ?auto_54401 ?auto_54412 ) ) ( not ( = ?auto_54402 ?auto_54412 ) ) ( not ( = ?auto_54418 ?auto_54412 ) ) ( not ( = ?auto_54407 ?auto_54412 ) ) ( not ( = ?auto_54408 ?auto_54412 ) ) ( not ( = ?auto_54419 ?auto_54412 ) ) ( not ( = ?auto_54410 ?auto_54412 ) ) ( not ( = ?auto_54414 ?auto_54412 ) ) ( not ( = ?auto_54426 ?auto_54412 ) ) ( not ( = ?auto_54420 ?auto_54412 ) ) ( not ( = ?auto_54409 ?auto_54412 ) ) ( not ( = ?auto_54416 ?auto_54412 ) ) ( SURFACE-AT ?auto_54427 ?auto_54404 ) ( CLEAR ?auto_54427 ) ( IS-CRATE ?auto_54416 ) ( not ( = ?auto_54401 ?auto_54427 ) ) ( not ( = ?auto_54402 ?auto_54427 ) ) ( not ( = ?auto_54418 ?auto_54427 ) ) ( not ( = ?auto_54407 ?auto_54427 ) ) ( not ( = ?auto_54408 ?auto_54427 ) ) ( not ( = ?auto_54419 ?auto_54427 ) ) ( not ( = ?auto_54410 ?auto_54427 ) ) ( not ( = ?auto_54414 ?auto_54427 ) ) ( not ( = ?auto_54426 ?auto_54427 ) ) ( not ( = ?auto_54420 ?auto_54427 ) ) ( not ( = ?auto_54409 ?auto_54427 ) ) ( not ( = ?auto_54416 ?auto_54427 ) ) ( not ( = ?auto_54412 ?auto_54427 ) ) ( AVAILABLE ?auto_54415 ) ( IN ?auto_54416 ?auto_54406 ) ( TRUCK-AT ?auto_54406 ?auto_54428 ) ( not ( = ?auto_54428 ?auto_54404 ) ) ( not ( = ?auto_54421 ?auto_54428 ) ) ( not ( = ?auto_54425 ?auto_54428 ) ) ( not ( = ?auto_54413 ?auto_54428 ) ) ( not ( = ?auto_54405 ?auto_54428 ) ) ( not ( = ?auto_54422 ?auto_54428 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_54406 ?auto_54428 ?auto_54404 )
      ( MAKE-ON ?auto_54401 ?auto_54402 )
      ( MAKE-ON-VERIFY ?auto_54401 ?auto_54402 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54429 - SURFACE
      ?auto_54430 - SURFACE
    )
    :vars
    (
      ?auto_54453 - HOIST
      ?auto_54432 - PLACE
      ?auto_54446 - PLACE
      ?auto_54436 - HOIST
      ?auto_54431 - SURFACE
      ?auto_54441 - SURFACE
      ?auto_54452 - PLACE
      ?auto_54455 - HOIST
      ?auto_54450 - SURFACE
      ?auto_54444 - SURFACE
      ?auto_54440 - PLACE
      ?auto_54434 - HOIST
      ?auto_54435 - SURFACE
      ?auto_54449 - SURFACE
      ?auto_54439 - PLACE
      ?auto_54448 - HOIST
      ?auto_54443 - SURFACE
      ?auto_54445 - SURFACE
      ?auto_54456 - SURFACE
      ?auto_54433 - SURFACE
      ?auto_54447 - PLACE
      ?auto_54437 - HOIST
      ?auto_54451 - SURFACE
      ?auto_54442 - SURFACE
      ?auto_54438 - TRUCK
      ?auto_54454 - PLACE
      ?auto_54457 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_54453 ?auto_54432 ) ( IS-CRATE ?auto_54429 ) ( not ( = ?auto_54429 ?auto_54430 ) ) ( not ( = ?auto_54446 ?auto_54432 ) ) ( HOIST-AT ?auto_54436 ?auto_54446 ) ( not ( = ?auto_54453 ?auto_54436 ) ) ( AVAILABLE ?auto_54436 ) ( SURFACE-AT ?auto_54429 ?auto_54446 ) ( ON ?auto_54429 ?auto_54431 ) ( CLEAR ?auto_54429 ) ( not ( = ?auto_54429 ?auto_54431 ) ) ( not ( = ?auto_54430 ?auto_54431 ) ) ( IS-CRATE ?auto_54430 ) ( not ( = ?auto_54429 ?auto_54441 ) ) ( not ( = ?auto_54430 ?auto_54441 ) ) ( not ( = ?auto_54431 ?auto_54441 ) ) ( not ( = ?auto_54452 ?auto_54432 ) ) ( not ( = ?auto_54446 ?auto_54452 ) ) ( HOIST-AT ?auto_54455 ?auto_54452 ) ( not ( = ?auto_54453 ?auto_54455 ) ) ( not ( = ?auto_54436 ?auto_54455 ) ) ( SURFACE-AT ?auto_54430 ?auto_54452 ) ( ON ?auto_54430 ?auto_54450 ) ( CLEAR ?auto_54430 ) ( not ( = ?auto_54429 ?auto_54450 ) ) ( not ( = ?auto_54430 ?auto_54450 ) ) ( not ( = ?auto_54431 ?auto_54450 ) ) ( not ( = ?auto_54441 ?auto_54450 ) ) ( IS-CRATE ?auto_54441 ) ( not ( = ?auto_54429 ?auto_54444 ) ) ( not ( = ?auto_54430 ?auto_54444 ) ) ( not ( = ?auto_54431 ?auto_54444 ) ) ( not ( = ?auto_54441 ?auto_54444 ) ) ( not ( = ?auto_54450 ?auto_54444 ) ) ( not ( = ?auto_54440 ?auto_54432 ) ) ( not ( = ?auto_54446 ?auto_54440 ) ) ( not ( = ?auto_54452 ?auto_54440 ) ) ( HOIST-AT ?auto_54434 ?auto_54440 ) ( not ( = ?auto_54453 ?auto_54434 ) ) ( not ( = ?auto_54436 ?auto_54434 ) ) ( not ( = ?auto_54455 ?auto_54434 ) ) ( AVAILABLE ?auto_54434 ) ( SURFACE-AT ?auto_54441 ?auto_54440 ) ( ON ?auto_54441 ?auto_54435 ) ( CLEAR ?auto_54441 ) ( not ( = ?auto_54429 ?auto_54435 ) ) ( not ( = ?auto_54430 ?auto_54435 ) ) ( not ( = ?auto_54431 ?auto_54435 ) ) ( not ( = ?auto_54441 ?auto_54435 ) ) ( not ( = ?auto_54450 ?auto_54435 ) ) ( not ( = ?auto_54444 ?auto_54435 ) ) ( IS-CRATE ?auto_54444 ) ( not ( = ?auto_54429 ?auto_54449 ) ) ( not ( = ?auto_54430 ?auto_54449 ) ) ( not ( = ?auto_54431 ?auto_54449 ) ) ( not ( = ?auto_54441 ?auto_54449 ) ) ( not ( = ?auto_54450 ?auto_54449 ) ) ( not ( = ?auto_54444 ?auto_54449 ) ) ( not ( = ?auto_54435 ?auto_54449 ) ) ( not ( = ?auto_54439 ?auto_54432 ) ) ( not ( = ?auto_54446 ?auto_54439 ) ) ( not ( = ?auto_54452 ?auto_54439 ) ) ( not ( = ?auto_54440 ?auto_54439 ) ) ( HOIST-AT ?auto_54448 ?auto_54439 ) ( not ( = ?auto_54453 ?auto_54448 ) ) ( not ( = ?auto_54436 ?auto_54448 ) ) ( not ( = ?auto_54455 ?auto_54448 ) ) ( not ( = ?auto_54434 ?auto_54448 ) ) ( AVAILABLE ?auto_54448 ) ( SURFACE-AT ?auto_54444 ?auto_54439 ) ( ON ?auto_54444 ?auto_54443 ) ( CLEAR ?auto_54444 ) ( not ( = ?auto_54429 ?auto_54443 ) ) ( not ( = ?auto_54430 ?auto_54443 ) ) ( not ( = ?auto_54431 ?auto_54443 ) ) ( not ( = ?auto_54441 ?auto_54443 ) ) ( not ( = ?auto_54450 ?auto_54443 ) ) ( not ( = ?auto_54444 ?auto_54443 ) ) ( not ( = ?auto_54435 ?auto_54443 ) ) ( not ( = ?auto_54449 ?auto_54443 ) ) ( IS-CRATE ?auto_54449 ) ( not ( = ?auto_54429 ?auto_54445 ) ) ( not ( = ?auto_54430 ?auto_54445 ) ) ( not ( = ?auto_54431 ?auto_54445 ) ) ( not ( = ?auto_54441 ?auto_54445 ) ) ( not ( = ?auto_54450 ?auto_54445 ) ) ( not ( = ?auto_54444 ?auto_54445 ) ) ( not ( = ?auto_54435 ?auto_54445 ) ) ( not ( = ?auto_54449 ?auto_54445 ) ) ( not ( = ?auto_54443 ?auto_54445 ) ) ( AVAILABLE ?auto_54455 ) ( SURFACE-AT ?auto_54449 ?auto_54452 ) ( ON ?auto_54449 ?auto_54456 ) ( CLEAR ?auto_54449 ) ( not ( = ?auto_54429 ?auto_54456 ) ) ( not ( = ?auto_54430 ?auto_54456 ) ) ( not ( = ?auto_54431 ?auto_54456 ) ) ( not ( = ?auto_54441 ?auto_54456 ) ) ( not ( = ?auto_54450 ?auto_54456 ) ) ( not ( = ?auto_54444 ?auto_54456 ) ) ( not ( = ?auto_54435 ?auto_54456 ) ) ( not ( = ?auto_54449 ?auto_54456 ) ) ( not ( = ?auto_54443 ?auto_54456 ) ) ( not ( = ?auto_54445 ?auto_54456 ) ) ( IS-CRATE ?auto_54445 ) ( not ( = ?auto_54429 ?auto_54433 ) ) ( not ( = ?auto_54430 ?auto_54433 ) ) ( not ( = ?auto_54431 ?auto_54433 ) ) ( not ( = ?auto_54441 ?auto_54433 ) ) ( not ( = ?auto_54450 ?auto_54433 ) ) ( not ( = ?auto_54444 ?auto_54433 ) ) ( not ( = ?auto_54435 ?auto_54433 ) ) ( not ( = ?auto_54449 ?auto_54433 ) ) ( not ( = ?auto_54443 ?auto_54433 ) ) ( not ( = ?auto_54445 ?auto_54433 ) ) ( not ( = ?auto_54456 ?auto_54433 ) ) ( not ( = ?auto_54447 ?auto_54432 ) ) ( not ( = ?auto_54446 ?auto_54447 ) ) ( not ( = ?auto_54452 ?auto_54447 ) ) ( not ( = ?auto_54440 ?auto_54447 ) ) ( not ( = ?auto_54439 ?auto_54447 ) ) ( HOIST-AT ?auto_54437 ?auto_54447 ) ( not ( = ?auto_54453 ?auto_54437 ) ) ( not ( = ?auto_54436 ?auto_54437 ) ) ( not ( = ?auto_54455 ?auto_54437 ) ) ( not ( = ?auto_54434 ?auto_54437 ) ) ( not ( = ?auto_54448 ?auto_54437 ) ) ( AVAILABLE ?auto_54437 ) ( SURFACE-AT ?auto_54445 ?auto_54447 ) ( ON ?auto_54445 ?auto_54451 ) ( CLEAR ?auto_54445 ) ( not ( = ?auto_54429 ?auto_54451 ) ) ( not ( = ?auto_54430 ?auto_54451 ) ) ( not ( = ?auto_54431 ?auto_54451 ) ) ( not ( = ?auto_54441 ?auto_54451 ) ) ( not ( = ?auto_54450 ?auto_54451 ) ) ( not ( = ?auto_54444 ?auto_54451 ) ) ( not ( = ?auto_54435 ?auto_54451 ) ) ( not ( = ?auto_54449 ?auto_54451 ) ) ( not ( = ?auto_54443 ?auto_54451 ) ) ( not ( = ?auto_54445 ?auto_54451 ) ) ( not ( = ?auto_54456 ?auto_54451 ) ) ( not ( = ?auto_54433 ?auto_54451 ) ) ( SURFACE-AT ?auto_54442 ?auto_54432 ) ( CLEAR ?auto_54442 ) ( IS-CRATE ?auto_54433 ) ( not ( = ?auto_54429 ?auto_54442 ) ) ( not ( = ?auto_54430 ?auto_54442 ) ) ( not ( = ?auto_54431 ?auto_54442 ) ) ( not ( = ?auto_54441 ?auto_54442 ) ) ( not ( = ?auto_54450 ?auto_54442 ) ) ( not ( = ?auto_54444 ?auto_54442 ) ) ( not ( = ?auto_54435 ?auto_54442 ) ) ( not ( = ?auto_54449 ?auto_54442 ) ) ( not ( = ?auto_54443 ?auto_54442 ) ) ( not ( = ?auto_54445 ?auto_54442 ) ) ( not ( = ?auto_54456 ?auto_54442 ) ) ( not ( = ?auto_54433 ?auto_54442 ) ) ( not ( = ?auto_54451 ?auto_54442 ) ) ( AVAILABLE ?auto_54453 ) ( TRUCK-AT ?auto_54438 ?auto_54454 ) ( not ( = ?auto_54454 ?auto_54432 ) ) ( not ( = ?auto_54446 ?auto_54454 ) ) ( not ( = ?auto_54452 ?auto_54454 ) ) ( not ( = ?auto_54440 ?auto_54454 ) ) ( not ( = ?auto_54439 ?auto_54454 ) ) ( not ( = ?auto_54447 ?auto_54454 ) ) ( HOIST-AT ?auto_54457 ?auto_54454 ) ( LIFTING ?auto_54457 ?auto_54433 ) ( not ( = ?auto_54453 ?auto_54457 ) ) ( not ( = ?auto_54436 ?auto_54457 ) ) ( not ( = ?auto_54455 ?auto_54457 ) ) ( not ( = ?auto_54434 ?auto_54457 ) ) ( not ( = ?auto_54448 ?auto_54457 ) ) ( not ( = ?auto_54437 ?auto_54457 ) ) )
    :subtasks
    ( ( !LOAD ?auto_54457 ?auto_54433 ?auto_54438 ?auto_54454 )
      ( MAKE-ON ?auto_54429 ?auto_54430 )
      ( MAKE-ON-VERIFY ?auto_54429 ?auto_54430 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54458 - SURFACE
      ?auto_54459 - SURFACE
    )
    :vars
    (
      ?auto_54475 - HOIST
      ?auto_54480 - PLACE
      ?auto_54476 - PLACE
      ?auto_54479 - HOIST
      ?auto_54462 - SURFACE
      ?auto_54478 - SURFACE
      ?auto_54474 - PLACE
      ?auto_54466 - HOIST
      ?auto_54472 - SURFACE
      ?auto_54483 - SURFACE
      ?auto_54484 - PLACE
      ?auto_54486 - HOIST
      ?auto_54481 - SURFACE
      ?auto_54471 - SURFACE
      ?auto_54465 - PLACE
      ?auto_54470 - HOIST
      ?auto_54485 - SURFACE
      ?auto_54477 - SURFACE
      ?auto_54467 - SURFACE
      ?auto_54460 - SURFACE
      ?auto_54469 - PLACE
      ?auto_54464 - HOIST
      ?auto_54473 - SURFACE
      ?auto_54482 - SURFACE
      ?auto_54463 - TRUCK
      ?auto_54468 - PLACE
      ?auto_54461 - HOIST
      ?auto_54487 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54475 ?auto_54480 ) ( IS-CRATE ?auto_54458 ) ( not ( = ?auto_54458 ?auto_54459 ) ) ( not ( = ?auto_54476 ?auto_54480 ) ) ( HOIST-AT ?auto_54479 ?auto_54476 ) ( not ( = ?auto_54475 ?auto_54479 ) ) ( AVAILABLE ?auto_54479 ) ( SURFACE-AT ?auto_54458 ?auto_54476 ) ( ON ?auto_54458 ?auto_54462 ) ( CLEAR ?auto_54458 ) ( not ( = ?auto_54458 ?auto_54462 ) ) ( not ( = ?auto_54459 ?auto_54462 ) ) ( IS-CRATE ?auto_54459 ) ( not ( = ?auto_54458 ?auto_54478 ) ) ( not ( = ?auto_54459 ?auto_54478 ) ) ( not ( = ?auto_54462 ?auto_54478 ) ) ( not ( = ?auto_54474 ?auto_54480 ) ) ( not ( = ?auto_54476 ?auto_54474 ) ) ( HOIST-AT ?auto_54466 ?auto_54474 ) ( not ( = ?auto_54475 ?auto_54466 ) ) ( not ( = ?auto_54479 ?auto_54466 ) ) ( SURFACE-AT ?auto_54459 ?auto_54474 ) ( ON ?auto_54459 ?auto_54472 ) ( CLEAR ?auto_54459 ) ( not ( = ?auto_54458 ?auto_54472 ) ) ( not ( = ?auto_54459 ?auto_54472 ) ) ( not ( = ?auto_54462 ?auto_54472 ) ) ( not ( = ?auto_54478 ?auto_54472 ) ) ( IS-CRATE ?auto_54478 ) ( not ( = ?auto_54458 ?auto_54483 ) ) ( not ( = ?auto_54459 ?auto_54483 ) ) ( not ( = ?auto_54462 ?auto_54483 ) ) ( not ( = ?auto_54478 ?auto_54483 ) ) ( not ( = ?auto_54472 ?auto_54483 ) ) ( not ( = ?auto_54484 ?auto_54480 ) ) ( not ( = ?auto_54476 ?auto_54484 ) ) ( not ( = ?auto_54474 ?auto_54484 ) ) ( HOIST-AT ?auto_54486 ?auto_54484 ) ( not ( = ?auto_54475 ?auto_54486 ) ) ( not ( = ?auto_54479 ?auto_54486 ) ) ( not ( = ?auto_54466 ?auto_54486 ) ) ( AVAILABLE ?auto_54486 ) ( SURFACE-AT ?auto_54478 ?auto_54484 ) ( ON ?auto_54478 ?auto_54481 ) ( CLEAR ?auto_54478 ) ( not ( = ?auto_54458 ?auto_54481 ) ) ( not ( = ?auto_54459 ?auto_54481 ) ) ( not ( = ?auto_54462 ?auto_54481 ) ) ( not ( = ?auto_54478 ?auto_54481 ) ) ( not ( = ?auto_54472 ?auto_54481 ) ) ( not ( = ?auto_54483 ?auto_54481 ) ) ( IS-CRATE ?auto_54483 ) ( not ( = ?auto_54458 ?auto_54471 ) ) ( not ( = ?auto_54459 ?auto_54471 ) ) ( not ( = ?auto_54462 ?auto_54471 ) ) ( not ( = ?auto_54478 ?auto_54471 ) ) ( not ( = ?auto_54472 ?auto_54471 ) ) ( not ( = ?auto_54483 ?auto_54471 ) ) ( not ( = ?auto_54481 ?auto_54471 ) ) ( not ( = ?auto_54465 ?auto_54480 ) ) ( not ( = ?auto_54476 ?auto_54465 ) ) ( not ( = ?auto_54474 ?auto_54465 ) ) ( not ( = ?auto_54484 ?auto_54465 ) ) ( HOIST-AT ?auto_54470 ?auto_54465 ) ( not ( = ?auto_54475 ?auto_54470 ) ) ( not ( = ?auto_54479 ?auto_54470 ) ) ( not ( = ?auto_54466 ?auto_54470 ) ) ( not ( = ?auto_54486 ?auto_54470 ) ) ( AVAILABLE ?auto_54470 ) ( SURFACE-AT ?auto_54483 ?auto_54465 ) ( ON ?auto_54483 ?auto_54485 ) ( CLEAR ?auto_54483 ) ( not ( = ?auto_54458 ?auto_54485 ) ) ( not ( = ?auto_54459 ?auto_54485 ) ) ( not ( = ?auto_54462 ?auto_54485 ) ) ( not ( = ?auto_54478 ?auto_54485 ) ) ( not ( = ?auto_54472 ?auto_54485 ) ) ( not ( = ?auto_54483 ?auto_54485 ) ) ( not ( = ?auto_54481 ?auto_54485 ) ) ( not ( = ?auto_54471 ?auto_54485 ) ) ( IS-CRATE ?auto_54471 ) ( not ( = ?auto_54458 ?auto_54477 ) ) ( not ( = ?auto_54459 ?auto_54477 ) ) ( not ( = ?auto_54462 ?auto_54477 ) ) ( not ( = ?auto_54478 ?auto_54477 ) ) ( not ( = ?auto_54472 ?auto_54477 ) ) ( not ( = ?auto_54483 ?auto_54477 ) ) ( not ( = ?auto_54481 ?auto_54477 ) ) ( not ( = ?auto_54471 ?auto_54477 ) ) ( not ( = ?auto_54485 ?auto_54477 ) ) ( AVAILABLE ?auto_54466 ) ( SURFACE-AT ?auto_54471 ?auto_54474 ) ( ON ?auto_54471 ?auto_54467 ) ( CLEAR ?auto_54471 ) ( not ( = ?auto_54458 ?auto_54467 ) ) ( not ( = ?auto_54459 ?auto_54467 ) ) ( not ( = ?auto_54462 ?auto_54467 ) ) ( not ( = ?auto_54478 ?auto_54467 ) ) ( not ( = ?auto_54472 ?auto_54467 ) ) ( not ( = ?auto_54483 ?auto_54467 ) ) ( not ( = ?auto_54481 ?auto_54467 ) ) ( not ( = ?auto_54471 ?auto_54467 ) ) ( not ( = ?auto_54485 ?auto_54467 ) ) ( not ( = ?auto_54477 ?auto_54467 ) ) ( IS-CRATE ?auto_54477 ) ( not ( = ?auto_54458 ?auto_54460 ) ) ( not ( = ?auto_54459 ?auto_54460 ) ) ( not ( = ?auto_54462 ?auto_54460 ) ) ( not ( = ?auto_54478 ?auto_54460 ) ) ( not ( = ?auto_54472 ?auto_54460 ) ) ( not ( = ?auto_54483 ?auto_54460 ) ) ( not ( = ?auto_54481 ?auto_54460 ) ) ( not ( = ?auto_54471 ?auto_54460 ) ) ( not ( = ?auto_54485 ?auto_54460 ) ) ( not ( = ?auto_54477 ?auto_54460 ) ) ( not ( = ?auto_54467 ?auto_54460 ) ) ( not ( = ?auto_54469 ?auto_54480 ) ) ( not ( = ?auto_54476 ?auto_54469 ) ) ( not ( = ?auto_54474 ?auto_54469 ) ) ( not ( = ?auto_54484 ?auto_54469 ) ) ( not ( = ?auto_54465 ?auto_54469 ) ) ( HOIST-AT ?auto_54464 ?auto_54469 ) ( not ( = ?auto_54475 ?auto_54464 ) ) ( not ( = ?auto_54479 ?auto_54464 ) ) ( not ( = ?auto_54466 ?auto_54464 ) ) ( not ( = ?auto_54486 ?auto_54464 ) ) ( not ( = ?auto_54470 ?auto_54464 ) ) ( AVAILABLE ?auto_54464 ) ( SURFACE-AT ?auto_54477 ?auto_54469 ) ( ON ?auto_54477 ?auto_54473 ) ( CLEAR ?auto_54477 ) ( not ( = ?auto_54458 ?auto_54473 ) ) ( not ( = ?auto_54459 ?auto_54473 ) ) ( not ( = ?auto_54462 ?auto_54473 ) ) ( not ( = ?auto_54478 ?auto_54473 ) ) ( not ( = ?auto_54472 ?auto_54473 ) ) ( not ( = ?auto_54483 ?auto_54473 ) ) ( not ( = ?auto_54481 ?auto_54473 ) ) ( not ( = ?auto_54471 ?auto_54473 ) ) ( not ( = ?auto_54485 ?auto_54473 ) ) ( not ( = ?auto_54477 ?auto_54473 ) ) ( not ( = ?auto_54467 ?auto_54473 ) ) ( not ( = ?auto_54460 ?auto_54473 ) ) ( SURFACE-AT ?auto_54482 ?auto_54480 ) ( CLEAR ?auto_54482 ) ( IS-CRATE ?auto_54460 ) ( not ( = ?auto_54458 ?auto_54482 ) ) ( not ( = ?auto_54459 ?auto_54482 ) ) ( not ( = ?auto_54462 ?auto_54482 ) ) ( not ( = ?auto_54478 ?auto_54482 ) ) ( not ( = ?auto_54472 ?auto_54482 ) ) ( not ( = ?auto_54483 ?auto_54482 ) ) ( not ( = ?auto_54481 ?auto_54482 ) ) ( not ( = ?auto_54471 ?auto_54482 ) ) ( not ( = ?auto_54485 ?auto_54482 ) ) ( not ( = ?auto_54477 ?auto_54482 ) ) ( not ( = ?auto_54467 ?auto_54482 ) ) ( not ( = ?auto_54460 ?auto_54482 ) ) ( not ( = ?auto_54473 ?auto_54482 ) ) ( AVAILABLE ?auto_54475 ) ( TRUCK-AT ?auto_54463 ?auto_54468 ) ( not ( = ?auto_54468 ?auto_54480 ) ) ( not ( = ?auto_54476 ?auto_54468 ) ) ( not ( = ?auto_54474 ?auto_54468 ) ) ( not ( = ?auto_54484 ?auto_54468 ) ) ( not ( = ?auto_54465 ?auto_54468 ) ) ( not ( = ?auto_54469 ?auto_54468 ) ) ( HOIST-AT ?auto_54461 ?auto_54468 ) ( not ( = ?auto_54475 ?auto_54461 ) ) ( not ( = ?auto_54479 ?auto_54461 ) ) ( not ( = ?auto_54466 ?auto_54461 ) ) ( not ( = ?auto_54486 ?auto_54461 ) ) ( not ( = ?auto_54470 ?auto_54461 ) ) ( not ( = ?auto_54464 ?auto_54461 ) ) ( AVAILABLE ?auto_54461 ) ( SURFACE-AT ?auto_54460 ?auto_54468 ) ( ON ?auto_54460 ?auto_54487 ) ( CLEAR ?auto_54460 ) ( not ( = ?auto_54458 ?auto_54487 ) ) ( not ( = ?auto_54459 ?auto_54487 ) ) ( not ( = ?auto_54462 ?auto_54487 ) ) ( not ( = ?auto_54478 ?auto_54487 ) ) ( not ( = ?auto_54472 ?auto_54487 ) ) ( not ( = ?auto_54483 ?auto_54487 ) ) ( not ( = ?auto_54481 ?auto_54487 ) ) ( not ( = ?auto_54471 ?auto_54487 ) ) ( not ( = ?auto_54485 ?auto_54487 ) ) ( not ( = ?auto_54477 ?auto_54487 ) ) ( not ( = ?auto_54467 ?auto_54487 ) ) ( not ( = ?auto_54460 ?auto_54487 ) ) ( not ( = ?auto_54473 ?auto_54487 ) ) ( not ( = ?auto_54482 ?auto_54487 ) ) )
    :subtasks
    ( ( !LIFT ?auto_54461 ?auto_54460 ?auto_54487 ?auto_54468 )
      ( MAKE-ON ?auto_54458 ?auto_54459 )
      ( MAKE-ON-VERIFY ?auto_54458 ?auto_54459 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54488 - SURFACE
      ?auto_54489 - SURFACE
    )
    :vars
    (
      ?auto_54510 - HOIST
      ?auto_54507 - PLACE
      ?auto_54503 - PLACE
      ?auto_54506 - HOIST
      ?auto_54512 - SURFACE
      ?auto_54505 - SURFACE
      ?auto_54500 - PLACE
      ?auto_54511 - HOIST
      ?auto_54514 - SURFACE
      ?auto_54502 - SURFACE
      ?auto_54491 - PLACE
      ?auto_54498 - HOIST
      ?auto_54508 - SURFACE
      ?auto_54499 - SURFACE
      ?auto_54517 - PLACE
      ?auto_54501 - HOIST
      ?auto_54490 - SURFACE
      ?auto_54504 - SURFACE
      ?auto_54516 - SURFACE
      ?auto_54496 - SURFACE
      ?auto_54513 - PLACE
      ?auto_54492 - HOIST
      ?auto_54493 - SURFACE
      ?auto_54509 - SURFACE
      ?auto_54495 - PLACE
      ?auto_54494 - HOIST
      ?auto_54497 - SURFACE
      ?auto_54515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54510 ?auto_54507 ) ( IS-CRATE ?auto_54488 ) ( not ( = ?auto_54488 ?auto_54489 ) ) ( not ( = ?auto_54503 ?auto_54507 ) ) ( HOIST-AT ?auto_54506 ?auto_54503 ) ( not ( = ?auto_54510 ?auto_54506 ) ) ( AVAILABLE ?auto_54506 ) ( SURFACE-AT ?auto_54488 ?auto_54503 ) ( ON ?auto_54488 ?auto_54512 ) ( CLEAR ?auto_54488 ) ( not ( = ?auto_54488 ?auto_54512 ) ) ( not ( = ?auto_54489 ?auto_54512 ) ) ( IS-CRATE ?auto_54489 ) ( not ( = ?auto_54488 ?auto_54505 ) ) ( not ( = ?auto_54489 ?auto_54505 ) ) ( not ( = ?auto_54512 ?auto_54505 ) ) ( not ( = ?auto_54500 ?auto_54507 ) ) ( not ( = ?auto_54503 ?auto_54500 ) ) ( HOIST-AT ?auto_54511 ?auto_54500 ) ( not ( = ?auto_54510 ?auto_54511 ) ) ( not ( = ?auto_54506 ?auto_54511 ) ) ( SURFACE-AT ?auto_54489 ?auto_54500 ) ( ON ?auto_54489 ?auto_54514 ) ( CLEAR ?auto_54489 ) ( not ( = ?auto_54488 ?auto_54514 ) ) ( not ( = ?auto_54489 ?auto_54514 ) ) ( not ( = ?auto_54512 ?auto_54514 ) ) ( not ( = ?auto_54505 ?auto_54514 ) ) ( IS-CRATE ?auto_54505 ) ( not ( = ?auto_54488 ?auto_54502 ) ) ( not ( = ?auto_54489 ?auto_54502 ) ) ( not ( = ?auto_54512 ?auto_54502 ) ) ( not ( = ?auto_54505 ?auto_54502 ) ) ( not ( = ?auto_54514 ?auto_54502 ) ) ( not ( = ?auto_54491 ?auto_54507 ) ) ( not ( = ?auto_54503 ?auto_54491 ) ) ( not ( = ?auto_54500 ?auto_54491 ) ) ( HOIST-AT ?auto_54498 ?auto_54491 ) ( not ( = ?auto_54510 ?auto_54498 ) ) ( not ( = ?auto_54506 ?auto_54498 ) ) ( not ( = ?auto_54511 ?auto_54498 ) ) ( AVAILABLE ?auto_54498 ) ( SURFACE-AT ?auto_54505 ?auto_54491 ) ( ON ?auto_54505 ?auto_54508 ) ( CLEAR ?auto_54505 ) ( not ( = ?auto_54488 ?auto_54508 ) ) ( not ( = ?auto_54489 ?auto_54508 ) ) ( not ( = ?auto_54512 ?auto_54508 ) ) ( not ( = ?auto_54505 ?auto_54508 ) ) ( not ( = ?auto_54514 ?auto_54508 ) ) ( not ( = ?auto_54502 ?auto_54508 ) ) ( IS-CRATE ?auto_54502 ) ( not ( = ?auto_54488 ?auto_54499 ) ) ( not ( = ?auto_54489 ?auto_54499 ) ) ( not ( = ?auto_54512 ?auto_54499 ) ) ( not ( = ?auto_54505 ?auto_54499 ) ) ( not ( = ?auto_54514 ?auto_54499 ) ) ( not ( = ?auto_54502 ?auto_54499 ) ) ( not ( = ?auto_54508 ?auto_54499 ) ) ( not ( = ?auto_54517 ?auto_54507 ) ) ( not ( = ?auto_54503 ?auto_54517 ) ) ( not ( = ?auto_54500 ?auto_54517 ) ) ( not ( = ?auto_54491 ?auto_54517 ) ) ( HOIST-AT ?auto_54501 ?auto_54517 ) ( not ( = ?auto_54510 ?auto_54501 ) ) ( not ( = ?auto_54506 ?auto_54501 ) ) ( not ( = ?auto_54511 ?auto_54501 ) ) ( not ( = ?auto_54498 ?auto_54501 ) ) ( AVAILABLE ?auto_54501 ) ( SURFACE-AT ?auto_54502 ?auto_54517 ) ( ON ?auto_54502 ?auto_54490 ) ( CLEAR ?auto_54502 ) ( not ( = ?auto_54488 ?auto_54490 ) ) ( not ( = ?auto_54489 ?auto_54490 ) ) ( not ( = ?auto_54512 ?auto_54490 ) ) ( not ( = ?auto_54505 ?auto_54490 ) ) ( not ( = ?auto_54514 ?auto_54490 ) ) ( not ( = ?auto_54502 ?auto_54490 ) ) ( not ( = ?auto_54508 ?auto_54490 ) ) ( not ( = ?auto_54499 ?auto_54490 ) ) ( IS-CRATE ?auto_54499 ) ( not ( = ?auto_54488 ?auto_54504 ) ) ( not ( = ?auto_54489 ?auto_54504 ) ) ( not ( = ?auto_54512 ?auto_54504 ) ) ( not ( = ?auto_54505 ?auto_54504 ) ) ( not ( = ?auto_54514 ?auto_54504 ) ) ( not ( = ?auto_54502 ?auto_54504 ) ) ( not ( = ?auto_54508 ?auto_54504 ) ) ( not ( = ?auto_54499 ?auto_54504 ) ) ( not ( = ?auto_54490 ?auto_54504 ) ) ( AVAILABLE ?auto_54511 ) ( SURFACE-AT ?auto_54499 ?auto_54500 ) ( ON ?auto_54499 ?auto_54516 ) ( CLEAR ?auto_54499 ) ( not ( = ?auto_54488 ?auto_54516 ) ) ( not ( = ?auto_54489 ?auto_54516 ) ) ( not ( = ?auto_54512 ?auto_54516 ) ) ( not ( = ?auto_54505 ?auto_54516 ) ) ( not ( = ?auto_54514 ?auto_54516 ) ) ( not ( = ?auto_54502 ?auto_54516 ) ) ( not ( = ?auto_54508 ?auto_54516 ) ) ( not ( = ?auto_54499 ?auto_54516 ) ) ( not ( = ?auto_54490 ?auto_54516 ) ) ( not ( = ?auto_54504 ?auto_54516 ) ) ( IS-CRATE ?auto_54504 ) ( not ( = ?auto_54488 ?auto_54496 ) ) ( not ( = ?auto_54489 ?auto_54496 ) ) ( not ( = ?auto_54512 ?auto_54496 ) ) ( not ( = ?auto_54505 ?auto_54496 ) ) ( not ( = ?auto_54514 ?auto_54496 ) ) ( not ( = ?auto_54502 ?auto_54496 ) ) ( not ( = ?auto_54508 ?auto_54496 ) ) ( not ( = ?auto_54499 ?auto_54496 ) ) ( not ( = ?auto_54490 ?auto_54496 ) ) ( not ( = ?auto_54504 ?auto_54496 ) ) ( not ( = ?auto_54516 ?auto_54496 ) ) ( not ( = ?auto_54513 ?auto_54507 ) ) ( not ( = ?auto_54503 ?auto_54513 ) ) ( not ( = ?auto_54500 ?auto_54513 ) ) ( not ( = ?auto_54491 ?auto_54513 ) ) ( not ( = ?auto_54517 ?auto_54513 ) ) ( HOIST-AT ?auto_54492 ?auto_54513 ) ( not ( = ?auto_54510 ?auto_54492 ) ) ( not ( = ?auto_54506 ?auto_54492 ) ) ( not ( = ?auto_54511 ?auto_54492 ) ) ( not ( = ?auto_54498 ?auto_54492 ) ) ( not ( = ?auto_54501 ?auto_54492 ) ) ( AVAILABLE ?auto_54492 ) ( SURFACE-AT ?auto_54504 ?auto_54513 ) ( ON ?auto_54504 ?auto_54493 ) ( CLEAR ?auto_54504 ) ( not ( = ?auto_54488 ?auto_54493 ) ) ( not ( = ?auto_54489 ?auto_54493 ) ) ( not ( = ?auto_54512 ?auto_54493 ) ) ( not ( = ?auto_54505 ?auto_54493 ) ) ( not ( = ?auto_54514 ?auto_54493 ) ) ( not ( = ?auto_54502 ?auto_54493 ) ) ( not ( = ?auto_54508 ?auto_54493 ) ) ( not ( = ?auto_54499 ?auto_54493 ) ) ( not ( = ?auto_54490 ?auto_54493 ) ) ( not ( = ?auto_54504 ?auto_54493 ) ) ( not ( = ?auto_54516 ?auto_54493 ) ) ( not ( = ?auto_54496 ?auto_54493 ) ) ( SURFACE-AT ?auto_54509 ?auto_54507 ) ( CLEAR ?auto_54509 ) ( IS-CRATE ?auto_54496 ) ( not ( = ?auto_54488 ?auto_54509 ) ) ( not ( = ?auto_54489 ?auto_54509 ) ) ( not ( = ?auto_54512 ?auto_54509 ) ) ( not ( = ?auto_54505 ?auto_54509 ) ) ( not ( = ?auto_54514 ?auto_54509 ) ) ( not ( = ?auto_54502 ?auto_54509 ) ) ( not ( = ?auto_54508 ?auto_54509 ) ) ( not ( = ?auto_54499 ?auto_54509 ) ) ( not ( = ?auto_54490 ?auto_54509 ) ) ( not ( = ?auto_54504 ?auto_54509 ) ) ( not ( = ?auto_54516 ?auto_54509 ) ) ( not ( = ?auto_54496 ?auto_54509 ) ) ( not ( = ?auto_54493 ?auto_54509 ) ) ( AVAILABLE ?auto_54510 ) ( not ( = ?auto_54495 ?auto_54507 ) ) ( not ( = ?auto_54503 ?auto_54495 ) ) ( not ( = ?auto_54500 ?auto_54495 ) ) ( not ( = ?auto_54491 ?auto_54495 ) ) ( not ( = ?auto_54517 ?auto_54495 ) ) ( not ( = ?auto_54513 ?auto_54495 ) ) ( HOIST-AT ?auto_54494 ?auto_54495 ) ( not ( = ?auto_54510 ?auto_54494 ) ) ( not ( = ?auto_54506 ?auto_54494 ) ) ( not ( = ?auto_54511 ?auto_54494 ) ) ( not ( = ?auto_54498 ?auto_54494 ) ) ( not ( = ?auto_54501 ?auto_54494 ) ) ( not ( = ?auto_54492 ?auto_54494 ) ) ( AVAILABLE ?auto_54494 ) ( SURFACE-AT ?auto_54496 ?auto_54495 ) ( ON ?auto_54496 ?auto_54497 ) ( CLEAR ?auto_54496 ) ( not ( = ?auto_54488 ?auto_54497 ) ) ( not ( = ?auto_54489 ?auto_54497 ) ) ( not ( = ?auto_54512 ?auto_54497 ) ) ( not ( = ?auto_54505 ?auto_54497 ) ) ( not ( = ?auto_54514 ?auto_54497 ) ) ( not ( = ?auto_54502 ?auto_54497 ) ) ( not ( = ?auto_54508 ?auto_54497 ) ) ( not ( = ?auto_54499 ?auto_54497 ) ) ( not ( = ?auto_54490 ?auto_54497 ) ) ( not ( = ?auto_54504 ?auto_54497 ) ) ( not ( = ?auto_54516 ?auto_54497 ) ) ( not ( = ?auto_54496 ?auto_54497 ) ) ( not ( = ?auto_54493 ?auto_54497 ) ) ( not ( = ?auto_54509 ?auto_54497 ) ) ( TRUCK-AT ?auto_54515 ?auto_54507 ) )
    :subtasks
    ( ( !DRIVE ?auto_54515 ?auto_54507 ?auto_54495 )
      ( MAKE-ON ?auto_54488 ?auto_54489 )
      ( MAKE-ON-VERIFY ?auto_54488 ?auto_54489 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54518 - SURFACE
      ?auto_54519 - SURFACE
    )
    :vars
    (
      ?auto_54524 - HOIST
      ?auto_54521 - PLACE
      ?auto_54531 - PLACE
      ?auto_54522 - HOIST
      ?auto_54527 - SURFACE
      ?auto_54536 - SURFACE
      ?auto_54547 - PLACE
      ?auto_54526 - HOIST
      ?auto_54544 - SURFACE
      ?auto_54546 - SURFACE
      ?auto_54539 - PLACE
      ?auto_54537 - HOIST
      ?auto_54520 - SURFACE
      ?auto_54543 - SURFACE
      ?auto_54542 - PLACE
      ?auto_54538 - HOIST
      ?auto_54540 - SURFACE
      ?auto_54541 - SURFACE
      ?auto_54529 - SURFACE
      ?auto_54534 - SURFACE
      ?auto_54523 - PLACE
      ?auto_54533 - HOIST
      ?auto_54535 - SURFACE
      ?auto_54525 - SURFACE
      ?auto_54532 - PLACE
      ?auto_54530 - HOIST
      ?auto_54545 - SURFACE
      ?auto_54528 - TRUCK
      ?auto_54548 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54524 ?auto_54521 ) ( IS-CRATE ?auto_54518 ) ( not ( = ?auto_54518 ?auto_54519 ) ) ( not ( = ?auto_54531 ?auto_54521 ) ) ( HOIST-AT ?auto_54522 ?auto_54531 ) ( not ( = ?auto_54524 ?auto_54522 ) ) ( AVAILABLE ?auto_54522 ) ( SURFACE-AT ?auto_54518 ?auto_54531 ) ( ON ?auto_54518 ?auto_54527 ) ( CLEAR ?auto_54518 ) ( not ( = ?auto_54518 ?auto_54527 ) ) ( not ( = ?auto_54519 ?auto_54527 ) ) ( IS-CRATE ?auto_54519 ) ( not ( = ?auto_54518 ?auto_54536 ) ) ( not ( = ?auto_54519 ?auto_54536 ) ) ( not ( = ?auto_54527 ?auto_54536 ) ) ( not ( = ?auto_54547 ?auto_54521 ) ) ( not ( = ?auto_54531 ?auto_54547 ) ) ( HOIST-AT ?auto_54526 ?auto_54547 ) ( not ( = ?auto_54524 ?auto_54526 ) ) ( not ( = ?auto_54522 ?auto_54526 ) ) ( SURFACE-AT ?auto_54519 ?auto_54547 ) ( ON ?auto_54519 ?auto_54544 ) ( CLEAR ?auto_54519 ) ( not ( = ?auto_54518 ?auto_54544 ) ) ( not ( = ?auto_54519 ?auto_54544 ) ) ( not ( = ?auto_54527 ?auto_54544 ) ) ( not ( = ?auto_54536 ?auto_54544 ) ) ( IS-CRATE ?auto_54536 ) ( not ( = ?auto_54518 ?auto_54546 ) ) ( not ( = ?auto_54519 ?auto_54546 ) ) ( not ( = ?auto_54527 ?auto_54546 ) ) ( not ( = ?auto_54536 ?auto_54546 ) ) ( not ( = ?auto_54544 ?auto_54546 ) ) ( not ( = ?auto_54539 ?auto_54521 ) ) ( not ( = ?auto_54531 ?auto_54539 ) ) ( not ( = ?auto_54547 ?auto_54539 ) ) ( HOIST-AT ?auto_54537 ?auto_54539 ) ( not ( = ?auto_54524 ?auto_54537 ) ) ( not ( = ?auto_54522 ?auto_54537 ) ) ( not ( = ?auto_54526 ?auto_54537 ) ) ( AVAILABLE ?auto_54537 ) ( SURFACE-AT ?auto_54536 ?auto_54539 ) ( ON ?auto_54536 ?auto_54520 ) ( CLEAR ?auto_54536 ) ( not ( = ?auto_54518 ?auto_54520 ) ) ( not ( = ?auto_54519 ?auto_54520 ) ) ( not ( = ?auto_54527 ?auto_54520 ) ) ( not ( = ?auto_54536 ?auto_54520 ) ) ( not ( = ?auto_54544 ?auto_54520 ) ) ( not ( = ?auto_54546 ?auto_54520 ) ) ( IS-CRATE ?auto_54546 ) ( not ( = ?auto_54518 ?auto_54543 ) ) ( not ( = ?auto_54519 ?auto_54543 ) ) ( not ( = ?auto_54527 ?auto_54543 ) ) ( not ( = ?auto_54536 ?auto_54543 ) ) ( not ( = ?auto_54544 ?auto_54543 ) ) ( not ( = ?auto_54546 ?auto_54543 ) ) ( not ( = ?auto_54520 ?auto_54543 ) ) ( not ( = ?auto_54542 ?auto_54521 ) ) ( not ( = ?auto_54531 ?auto_54542 ) ) ( not ( = ?auto_54547 ?auto_54542 ) ) ( not ( = ?auto_54539 ?auto_54542 ) ) ( HOIST-AT ?auto_54538 ?auto_54542 ) ( not ( = ?auto_54524 ?auto_54538 ) ) ( not ( = ?auto_54522 ?auto_54538 ) ) ( not ( = ?auto_54526 ?auto_54538 ) ) ( not ( = ?auto_54537 ?auto_54538 ) ) ( AVAILABLE ?auto_54538 ) ( SURFACE-AT ?auto_54546 ?auto_54542 ) ( ON ?auto_54546 ?auto_54540 ) ( CLEAR ?auto_54546 ) ( not ( = ?auto_54518 ?auto_54540 ) ) ( not ( = ?auto_54519 ?auto_54540 ) ) ( not ( = ?auto_54527 ?auto_54540 ) ) ( not ( = ?auto_54536 ?auto_54540 ) ) ( not ( = ?auto_54544 ?auto_54540 ) ) ( not ( = ?auto_54546 ?auto_54540 ) ) ( not ( = ?auto_54520 ?auto_54540 ) ) ( not ( = ?auto_54543 ?auto_54540 ) ) ( IS-CRATE ?auto_54543 ) ( not ( = ?auto_54518 ?auto_54541 ) ) ( not ( = ?auto_54519 ?auto_54541 ) ) ( not ( = ?auto_54527 ?auto_54541 ) ) ( not ( = ?auto_54536 ?auto_54541 ) ) ( not ( = ?auto_54544 ?auto_54541 ) ) ( not ( = ?auto_54546 ?auto_54541 ) ) ( not ( = ?auto_54520 ?auto_54541 ) ) ( not ( = ?auto_54543 ?auto_54541 ) ) ( not ( = ?auto_54540 ?auto_54541 ) ) ( AVAILABLE ?auto_54526 ) ( SURFACE-AT ?auto_54543 ?auto_54547 ) ( ON ?auto_54543 ?auto_54529 ) ( CLEAR ?auto_54543 ) ( not ( = ?auto_54518 ?auto_54529 ) ) ( not ( = ?auto_54519 ?auto_54529 ) ) ( not ( = ?auto_54527 ?auto_54529 ) ) ( not ( = ?auto_54536 ?auto_54529 ) ) ( not ( = ?auto_54544 ?auto_54529 ) ) ( not ( = ?auto_54546 ?auto_54529 ) ) ( not ( = ?auto_54520 ?auto_54529 ) ) ( not ( = ?auto_54543 ?auto_54529 ) ) ( not ( = ?auto_54540 ?auto_54529 ) ) ( not ( = ?auto_54541 ?auto_54529 ) ) ( IS-CRATE ?auto_54541 ) ( not ( = ?auto_54518 ?auto_54534 ) ) ( not ( = ?auto_54519 ?auto_54534 ) ) ( not ( = ?auto_54527 ?auto_54534 ) ) ( not ( = ?auto_54536 ?auto_54534 ) ) ( not ( = ?auto_54544 ?auto_54534 ) ) ( not ( = ?auto_54546 ?auto_54534 ) ) ( not ( = ?auto_54520 ?auto_54534 ) ) ( not ( = ?auto_54543 ?auto_54534 ) ) ( not ( = ?auto_54540 ?auto_54534 ) ) ( not ( = ?auto_54541 ?auto_54534 ) ) ( not ( = ?auto_54529 ?auto_54534 ) ) ( not ( = ?auto_54523 ?auto_54521 ) ) ( not ( = ?auto_54531 ?auto_54523 ) ) ( not ( = ?auto_54547 ?auto_54523 ) ) ( not ( = ?auto_54539 ?auto_54523 ) ) ( not ( = ?auto_54542 ?auto_54523 ) ) ( HOIST-AT ?auto_54533 ?auto_54523 ) ( not ( = ?auto_54524 ?auto_54533 ) ) ( not ( = ?auto_54522 ?auto_54533 ) ) ( not ( = ?auto_54526 ?auto_54533 ) ) ( not ( = ?auto_54537 ?auto_54533 ) ) ( not ( = ?auto_54538 ?auto_54533 ) ) ( AVAILABLE ?auto_54533 ) ( SURFACE-AT ?auto_54541 ?auto_54523 ) ( ON ?auto_54541 ?auto_54535 ) ( CLEAR ?auto_54541 ) ( not ( = ?auto_54518 ?auto_54535 ) ) ( not ( = ?auto_54519 ?auto_54535 ) ) ( not ( = ?auto_54527 ?auto_54535 ) ) ( not ( = ?auto_54536 ?auto_54535 ) ) ( not ( = ?auto_54544 ?auto_54535 ) ) ( not ( = ?auto_54546 ?auto_54535 ) ) ( not ( = ?auto_54520 ?auto_54535 ) ) ( not ( = ?auto_54543 ?auto_54535 ) ) ( not ( = ?auto_54540 ?auto_54535 ) ) ( not ( = ?auto_54541 ?auto_54535 ) ) ( not ( = ?auto_54529 ?auto_54535 ) ) ( not ( = ?auto_54534 ?auto_54535 ) ) ( IS-CRATE ?auto_54534 ) ( not ( = ?auto_54518 ?auto_54525 ) ) ( not ( = ?auto_54519 ?auto_54525 ) ) ( not ( = ?auto_54527 ?auto_54525 ) ) ( not ( = ?auto_54536 ?auto_54525 ) ) ( not ( = ?auto_54544 ?auto_54525 ) ) ( not ( = ?auto_54546 ?auto_54525 ) ) ( not ( = ?auto_54520 ?auto_54525 ) ) ( not ( = ?auto_54543 ?auto_54525 ) ) ( not ( = ?auto_54540 ?auto_54525 ) ) ( not ( = ?auto_54541 ?auto_54525 ) ) ( not ( = ?auto_54529 ?auto_54525 ) ) ( not ( = ?auto_54534 ?auto_54525 ) ) ( not ( = ?auto_54535 ?auto_54525 ) ) ( not ( = ?auto_54532 ?auto_54521 ) ) ( not ( = ?auto_54531 ?auto_54532 ) ) ( not ( = ?auto_54547 ?auto_54532 ) ) ( not ( = ?auto_54539 ?auto_54532 ) ) ( not ( = ?auto_54542 ?auto_54532 ) ) ( not ( = ?auto_54523 ?auto_54532 ) ) ( HOIST-AT ?auto_54530 ?auto_54532 ) ( not ( = ?auto_54524 ?auto_54530 ) ) ( not ( = ?auto_54522 ?auto_54530 ) ) ( not ( = ?auto_54526 ?auto_54530 ) ) ( not ( = ?auto_54537 ?auto_54530 ) ) ( not ( = ?auto_54538 ?auto_54530 ) ) ( not ( = ?auto_54533 ?auto_54530 ) ) ( AVAILABLE ?auto_54530 ) ( SURFACE-AT ?auto_54534 ?auto_54532 ) ( ON ?auto_54534 ?auto_54545 ) ( CLEAR ?auto_54534 ) ( not ( = ?auto_54518 ?auto_54545 ) ) ( not ( = ?auto_54519 ?auto_54545 ) ) ( not ( = ?auto_54527 ?auto_54545 ) ) ( not ( = ?auto_54536 ?auto_54545 ) ) ( not ( = ?auto_54544 ?auto_54545 ) ) ( not ( = ?auto_54546 ?auto_54545 ) ) ( not ( = ?auto_54520 ?auto_54545 ) ) ( not ( = ?auto_54543 ?auto_54545 ) ) ( not ( = ?auto_54540 ?auto_54545 ) ) ( not ( = ?auto_54541 ?auto_54545 ) ) ( not ( = ?auto_54529 ?auto_54545 ) ) ( not ( = ?auto_54534 ?auto_54545 ) ) ( not ( = ?auto_54535 ?auto_54545 ) ) ( not ( = ?auto_54525 ?auto_54545 ) ) ( TRUCK-AT ?auto_54528 ?auto_54521 ) ( SURFACE-AT ?auto_54548 ?auto_54521 ) ( CLEAR ?auto_54548 ) ( LIFTING ?auto_54524 ?auto_54525 ) ( IS-CRATE ?auto_54525 ) ( not ( = ?auto_54518 ?auto_54548 ) ) ( not ( = ?auto_54519 ?auto_54548 ) ) ( not ( = ?auto_54527 ?auto_54548 ) ) ( not ( = ?auto_54536 ?auto_54548 ) ) ( not ( = ?auto_54544 ?auto_54548 ) ) ( not ( = ?auto_54546 ?auto_54548 ) ) ( not ( = ?auto_54520 ?auto_54548 ) ) ( not ( = ?auto_54543 ?auto_54548 ) ) ( not ( = ?auto_54540 ?auto_54548 ) ) ( not ( = ?auto_54541 ?auto_54548 ) ) ( not ( = ?auto_54529 ?auto_54548 ) ) ( not ( = ?auto_54534 ?auto_54548 ) ) ( not ( = ?auto_54535 ?auto_54548 ) ) ( not ( = ?auto_54525 ?auto_54548 ) ) ( not ( = ?auto_54545 ?auto_54548 ) ) )
    :subtasks
    ( ( !DROP ?auto_54524 ?auto_54525 ?auto_54548 ?auto_54521 )
      ( MAKE-ON ?auto_54518 ?auto_54519 )
      ( MAKE-ON-VERIFY ?auto_54518 ?auto_54519 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54549 - SURFACE
      ?auto_54550 - SURFACE
    )
    :vars
    (
      ?auto_54575 - HOIST
      ?auto_54567 - PLACE
      ?auto_54554 - PLACE
      ?auto_54566 - HOIST
      ?auto_54564 - SURFACE
      ?auto_54570 - SURFACE
      ?auto_54579 - PLACE
      ?auto_54555 - HOIST
      ?auto_54576 - SURFACE
      ?auto_54578 - SURFACE
      ?auto_54573 - PLACE
      ?auto_54571 - HOIST
      ?auto_54561 - SURFACE
      ?auto_54569 - SURFACE
      ?auto_54559 - PLACE
      ?auto_54572 - HOIST
      ?auto_54557 - SURFACE
      ?auto_54558 - SURFACE
      ?auto_54574 - SURFACE
      ?auto_54551 - SURFACE
      ?auto_54562 - PLACE
      ?auto_54552 - HOIST
      ?auto_54560 - SURFACE
      ?auto_54565 - SURFACE
      ?auto_54563 - PLACE
      ?auto_54568 - HOIST
      ?auto_54577 - SURFACE
      ?auto_54553 - TRUCK
      ?auto_54556 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54575 ?auto_54567 ) ( IS-CRATE ?auto_54549 ) ( not ( = ?auto_54549 ?auto_54550 ) ) ( not ( = ?auto_54554 ?auto_54567 ) ) ( HOIST-AT ?auto_54566 ?auto_54554 ) ( not ( = ?auto_54575 ?auto_54566 ) ) ( AVAILABLE ?auto_54566 ) ( SURFACE-AT ?auto_54549 ?auto_54554 ) ( ON ?auto_54549 ?auto_54564 ) ( CLEAR ?auto_54549 ) ( not ( = ?auto_54549 ?auto_54564 ) ) ( not ( = ?auto_54550 ?auto_54564 ) ) ( IS-CRATE ?auto_54550 ) ( not ( = ?auto_54549 ?auto_54570 ) ) ( not ( = ?auto_54550 ?auto_54570 ) ) ( not ( = ?auto_54564 ?auto_54570 ) ) ( not ( = ?auto_54579 ?auto_54567 ) ) ( not ( = ?auto_54554 ?auto_54579 ) ) ( HOIST-AT ?auto_54555 ?auto_54579 ) ( not ( = ?auto_54575 ?auto_54555 ) ) ( not ( = ?auto_54566 ?auto_54555 ) ) ( SURFACE-AT ?auto_54550 ?auto_54579 ) ( ON ?auto_54550 ?auto_54576 ) ( CLEAR ?auto_54550 ) ( not ( = ?auto_54549 ?auto_54576 ) ) ( not ( = ?auto_54550 ?auto_54576 ) ) ( not ( = ?auto_54564 ?auto_54576 ) ) ( not ( = ?auto_54570 ?auto_54576 ) ) ( IS-CRATE ?auto_54570 ) ( not ( = ?auto_54549 ?auto_54578 ) ) ( not ( = ?auto_54550 ?auto_54578 ) ) ( not ( = ?auto_54564 ?auto_54578 ) ) ( not ( = ?auto_54570 ?auto_54578 ) ) ( not ( = ?auto_54576 ?auto_54578 ) ) ( not ( = ?auto_54573 ?auto_54567 ) ) ( not ( = ?auto_54554 ?auto_54573 ) ) ( not ( = ?auto_54579 ?auto_54573 ) ) ( HOIST-AT ?auto_54571 ?auto_54573 ) ( not ( = ?auto_54575 ?auto_54571 ) ) ( not ( = ?auto_54566 ?auto_54571 ) ) ( not ( = ?auto_54555 ?auto_54571 ) ) ( AVAILABLE ?auto_54571 ) ( SURFACE-AT ?auto_54570 ?auto_54573 ) ( ON ?auto_54570 ?auto_54561 ) ( CLEAR ?auto_54570 ) ( not ( = ?auto_54549 ?auto_54561 ) ) ( not ( = ?auto_54550 ?auto_54561 ) ) ( not ( = ?auto_54564 ?auto_54561 ) ) ( not ( = ?auto_54570 ?auto_54561 ) ) ( not ( = ?auto_54576 ?auto_54561 ) ) ( not ( = ?auto_54578 ?auto_54561 ) ) ( IS-CRATE ?auto_54578 ) ( not ( = ?auto_54549 ?auto_54569 ) ) ( not ( = ?auto_54550 ?auto_54569 ) ) ( not ( = ?auto_54564 ?auto_54569 ) ) ( not ( = ?auto_54570 ?auto_54569 ) ) ( not ( = ?auto_54576 ?auto_54569 ) ) ( not ( = ?auto_54578 ?auto_54569 ) ) ( not ( = ?auto_54561 ?auto_54569 ) ) ( not ( = ?auto_54559 ?auto_54567 ) ) ( not ( = ?auto_54554 ?auto_54559 ) ) ( not ( = ?auto_54579 ?auto_54559 ) ) ( not ( = ?auto_54573 ?auto_54559 ) ) ( HOIST-AT ?auto_54572 ?auto_54559 ) ( not ( = ?auto_54575 ?auto_54572 ) ) ( not ( = ?auto_54566 ?auto_54572 ) ) ( not ( = ?auto_54555 ?auto_54572 ) ) ( not ( = ?auto_54571 ?auto_54572 ) ) ( AVAILABLE ?auto_54572 ) ( SURFACE-AT ?auto_54578 ?auto_54559 ) ( ON ?auto_54578 ?auto_54557 ) ( CLEAR ?auto_54578 ) ( not ( = ?auto_54549 ?auto_54557 ) ) ( not ( = ?auto_54550 ?auto_54557 ) ) ( not ( = ?auto_54564 ?auto_54557 ) ) ( not ( = ?auto_54570 ?auto_54557 ) ) ( not ( = ?auto_54576 ?auto_54557 ) ) ( not ( = ?auto_54578 ?auto_54557 ) ) ( not ( = ?auto_54561 ?auto_54557 ) ) ( not ( = ?auto_54569 ?auto_54557 ) ) ( IS-CRATE ?auto_54569 ) ( not ( = ?auto_54549 ?auto_54558 ) ) ( not ( = ?auto_54550 ?auto_54558 ) ) ( not ( = ?auto_54564 ?auto_54558 ) ) ( not ( = ?auto_54570 ?auto_54558 ) ) ( not ( = ?auto_54576 ?auto_54558 ) ) ( not ( = ?auto_54578 ?auto_54558 ) ) ( not ( = ?auto_54561 ?auto_54558 ) ) ( not ( = ?auto_54569 ?auto_54558 ) ) ( not ( = ?auto_54557 ?auto_54558 ) ) ( AVAILABLE ?auto_54555 ) ( SURFACE-AT ?auto_54569 ?auto_54579 ) ( ON ?auto_54569 ?auto_54574 ) ( CLEAR ?auto_54569 ) ( not ( = ?auto_54549 ?auto_54574 ) ) ( not ( = ?auto_54550 ?auto_54574 ) ) ( not ( = ?auto_54564 ?auto_54574 ) ) ( not ( = ?auto_54570 ?auto_54574 ) ) ( not ( = ?auto_54576 ?auto_54574 ) ) ( not ( = ?auto_54578 ?auto_54574 ) ) ( not ( = ?auto_54561 ?auto_54574 ) ) ( not ( = ?auto_54569 ?auto_54574 ) ) ( not ( = ?auto_54557 ?auto_54574 ) ) ( not ( = ?auto_54558 ?auto_54574 ) ) ( IS-CRATE ?auto_54558 ) ( not ( = ?auto_54549 ?auto_54551 ) ) ( not ( = ?auto_54550 ?auto_54551 ) ) ( not ( = ?auto_54564 ?auto_54551 ) ) ( not ( = ?auto_54570 ?auto_54551 ) ) ( not ( = ?auto_54576 ?auto_54551 ) ) ( not ( = ?auto_54578 ?auto_54551 ) ) ( not ( = ?auto_54561 ?auto_54551 ) ) ( not ( = ?auto_54569 ?auto_54551 ) ) ( not ( = ?auto_54557 ?auto_54551 ) ) ( not ( = ?auto_54558 ?auto_54551 ) ) ( not ( = ?auto_54574 ?auto_54551 ) ) ( not ( = ?auto_54562 ?auto_54567 ) ) ( not ( = ?auto_54554 ?auto_54562 ) ) ( not ( = ?auto_54579 ?auto_54562 ) ) ( not ( = ?auto_54573 ?auto_54562 ) ) ( not ( = ?auto_54559 ?auto_54562 ) ) ( HOIST-AT ?auto_54552 ?auto_54562 ) ( not ( = ?auto_54575 ?auto_54552 ) ) ( not ( = ?auto_54566 ?auto_54552 ) ) ( not ( = ?auto_54555 ?auto_54552 ) ) ( not ( = ?auto_54571 ?auto_54552 ) ) ( not ( = ?auto_54572 ?auto_54552 ) ) ( AVAILABLE ?auto_54552 ) ( SURFACE-AT ?auto_54558 ?auto_54562 ) ( ON ?auto_54558 ?auto_54560 ) ( CLEAR ?auto_54558 ) ( not ( = ?auto_54549 ?auto_54560 ) ) ( not ( = ?auto_54550 ?auto_54560 ) ) ( not ( = ?auto_54564 ?auto_54560 ) ) ( not ( = ?auto_54570 ?auto_54560 ) ) ( not ( = ?auto_54576 ?auto_54560 ) ) ( not ( = ?auto_54578 ?auto_54560 ) ) ( not ( = ?auto_54561 ?auto_54560 ) ) ( not ( = ?auto_54569 ?auto_54560 ) ) ( not ( = ?auto_54557 ?auto_54560 ) ) ( not ( = ?auto_54558 ?auto_54560 ) ) ( not ( = ?auto_54574 ?auto_54560 ) ) ( not ( = ?auto_54551 ?auto_54560 ) ) ( IS-CRATE ?auto_54551 ) ( not ( = ?auto_54549 ?auto_54565 ) ) ( not ( = ?auto_54550 ?auto_54565 ) ) ( not ( = ?auto_54564 ?auto_54565 ) ) ( not ( = ?auto_54570 ?auto_54565 ) ) ( not ( = ?auto_54576 ?auto_54565 ) ) ( not ( = ?auto_54578 ?auto_54565 ) ) ( not ( = ?auto_54561 ?auto_54565 ) ) ( not ( = ?auto_54569 ?auto_54565 ) ) ( not ( = ?auto_54557 ?auto_54565 ) ) ( not ( = ?auto_54558 ?auto_54565 ) ) ( not ( = ?auto_54574 ?auto_54565 ) ) ( not ( = ?auto_54551 ?auto_54565 ) ) ( not ( = ?auto_54560 ?auto_54565 ) ) ( not ( = ?auto_54563 ?auto_54567 ) ) ( not ( = ?auto_54554 ?auto_54563 ) ) ( not ( = ?auto_54579 ?auto_54563 ) ) ( not ( = ?auto_54573 ?auto_54563 ) ) ( not ( = ?auto_54559 ?auto_54563 ) ) ( not ( = ?auto_54562 ?auto_54563 ) ) ( HOIST-AT ?auto_54568 ?auto_54563 ) ( not ( = ?auto_54575 ?auto_54568 ) ) ( not ( = ?auto_54566 ?auto_54568 ) ) ( not ( = ?auto_54555 ?auto_54568 ) ) ( not ( = ?auto_54571 ?auto_54568 ) ) ( not ( = ?auto_54572 ?auto_54568 ) ) ( not ( = ?auto_54552 ?auto_54568 ) ) ( AVAILABLE ?auto_54568 ) ( SURFACE-AT ?auto_54551 ?auto_54563 ) ( ON ?auto_54551 ?auto_54577 ) ( CLEAR ?auto_54551 ) ( not ( = ?auto_54549 ?auto_54577 ) ) ( not ( = ?auto_54550 ?auto_54577 ) ) ( not ( = ?auto_54564 ?auto_54577 ) ) ( not ( = ?auto_54570 ?auto_54577 ) ) ( not ( = ?auto_54576 ?auto_54577 ) ) ( not ( = ?auto_54578 ?auto_54577 ) ) ( not ( = ?auto_54561 ?auto_54577 ) ) ( not ( = ?auto_54569 ?auto_54577 ) ) ( not ( = ?auto_54557 ?auto_54577 ) ) ( not ( = ?auto_54558 ?auto_54577 ) ) ( not ( = ?auto_54574 ?auto_54577 ) ) ( not ( = ?auto_54551 ?auto_54577 ) ) ( not ( = ?auto_54560 ?auto_54577 ) ) ( not ( = ?auto_54565 ?auto_54577 ) ) ( TRUCK-AT ?auto_54553 ?auto_54567 ) ( SURFACE-AT ?auto_54556 ?auto_54567 ) ( CLEAR ?auto_54556 ) ( IS-CRATE ?auto_54565 ) ( not ( = ?auto_54549 ?auto_54556 ) ) ( not ( = ?auto_54550 ?auto_54556 ) ) ( not ( = ?auto_54564 ?auto_54556 ) ) ( not ( = ?auto_54570 ?auto_54556 ) ) ( not ( = ?auto_54576 ?auto_54556 ) ) ( not ( = ?auto_54578 ?auto_54556 ) ) ( not ( = ?auto_54561 ?auto_54556 ) ) ( not ( = ?auto_54569 ?auto_54556 ) ) ( not ( = ?auto_54557 ?auto_54556 ) ) ( not ( = ?auto_54558 ?auto_54556 ) ) ( not ( = ?auto_54574 ?auto_54556 ) ) ( not ( = ?auto_54551 ?auto_54556 ) ) ( not ( = ?auto_54560 ?auto_54556 ) ) ( not ( = ?auto_54565 ?auto_54556 ) ) ( not ( = ?auto_54577 ?auto_54556 ) ) ( AVAILABLE ?auto_54575 ) ( IN ?auto_54565 ?auto_54553 ) )
    :subtasks
    ( ( !UNLOAD ?auto_54575 ?auto_54565 ?auto_54553 ?auto_54567 )
      ( MAKE-ON ?auto_54549 ?auto_54550 )
      ( MAKE-ON-VERIFY ?auto_54549 ?auto_54550 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54580 - SURFACE
      ?auto_54581 - SURFACE
    )
    :vars
    (
      ?auto_54594 - HOIST
      ?auto_54600 - PLACE
      ?auto_54589 - PLACE
      ?auto_54607 - HOIST
      ?auto_54608 - SURFACE
      ?auto_54603 - SURFACE
      ?auto_54598 - PLACE
      ?auto_54610 - HOIST
      ?auto_54595 - SURFACE
      ?auto_54597 - SURFACE
      ?auto_54606 - PLACE
      ?auto_54604 - HOIST
      ?auto_54590 - SURFACE
      ?auto_54602 - SURFACE
      ?auto_54593 - PLACE
      ?auto_54605 - HOIST
      ?auto_54592 - SURFACE
      ?auto_54587 - SURFACE
      ?auto_54599 - SURFACE
      ?auto_54582 - SURFACE
      ?auto_54584 - PLACE
      ?auto_54585 - HOIST
      ?auto_54586 - SURFACE
      ?auto_54609 - SURFACE
      ?auto_54588 - PLACE
      ?auto_54601 - HOIST
      ?auto_54596 - SURFACE
      ?auto_54591 - SURFACE
      ?auto_54583 - TRUCK
      ?auto_54611 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54594 ?auto_54600 ) ( IS-CRATE ?auto_54580 ) ( not ( = ?auto_54580 ?auto_54581 ) ) ( not ( = ?auto_54589 ?auto_54600 ) ) ( HOIST-AT ?auto_54607 ?auto_54589 ) ( not ( = ?auto_54594 ?auto_54607 ) ) ( AVAILABLE ?auto_54607 ) ( SURFACE-AT ?auto_54580 ?auto_54589 ) ( ON ?auto_54580 ?auto_54608 ) ( CLEAR ?auto_54580 ) ( not ( = ?auto_54580 ?auto_54608 ) ) ( not ( = ?auto_54581 ?auto_54608 ) ) ( IS-CRATE ?auto_54581 ) ( not ( = ?auto_54580 ?auto_54603 ) ) ( not ( = ?auto_54581 ?auto_54603 ) ) ( not ( = ?auto_54608 ?auto_54603 ) ) ( not ( = ?auto_54598 ?auto_54600 ) ) ( not ( = ?auto_54589 ?auto_54598 ) ) ( HOIST-AT ?auto_54610 ?auto_54598 ) ( not ( = ?auto_54594 ?auto_54610 ) ) ( not ( = ?auto_54607 ?auto_54610 ) ) ( SURFACE-AT ?auto_54581 ?auto_54598 ) ( ON ?auto_54581 ?auto_54595 ) ( CLEAR ?auto_54581 ) ( not ( = ?auto_54580 ?auto_54595 ) ) ( not ( = ?auto_54581 ?auto_54595 ) ) ( not ( = ?auto_54608 ?auto_54595 ) ) ( not ( = ?auto_54603 ?auto_54595 ) ) ( IS-CRATE ?auto_54603 ) ( not ( = ?auto_54580 ?auto_54597 ) ) ( not ( = ?auto_54581 ?auto_54597 ) ) ( not ( = ?auto_54608 ?auto_54597 ) ) ( not ( = ?auto_54603 ?auto_54597 ) ) ( not ( = ?auto_54595 ?auto_54597 ) ) ( not ( = ?auto_54606 ?auto_54600 ) ) ( not ( = ?auto_54589 ?auto_54606 ) ) ( not ( = ?auto_54598 ?auto_54606 ) ) ( HOIST-AT ?auto_54604 ?auto_54606 ) ( not ( = ?auto_54594 ?auto_54604 ) ) ( not ( = ?auto_54607 ?auto_54604 ) ) ( not ( = ?auto_54610 ?auto_54604 ) ) ( AVAILABLE ?auto_54604 ) ( SURFACE-AT ?auto_54603 ?auto_54606 ) ( ON ?auto_54603 ?auto_54590 ) ( CLEAR ?auto_54603 ) ( not ( = ?auto_54580 ?auto_54590 ) ) ( not ( = ?auto_54581 ?auto_54590 ) ) ( not ( = ?auto_54608 ?auto_54590 ) ) ( not ( = ?auto_54603 ?auto_54590 ) ) ( not ( = ?auto_54595 ?auto_54590 ) ) ( not ( = ?auto_54597 ?auto_54590 ) ) ( IS-CRATE ?auto_54597 ) ( not ( = ?auto_54580 ?auto_54602 ) ) ( not ( = ?auto_54581 ?auto_54602 ) ) ( not ( = ?auto_54608 ?auto_54602 ) ) ( not ( = ?auto_54603 ?auto_54602 ) ) ( not ( = ?auto_54595 ?auto_54602 ) ) ( not ( = ?auto_54597 ?auto_54602 ) ) ( not ( = ?auto_54590 ?auto_54602 ) ) ( not ( = ?auto_54593 ?auto_54600 ) ) ( not ( = ?auto_54589 ?auto_54593 ) ) ( not ( = ?auto_54598 ?auto_54593 ) ) ( not ( = ?auto_54606 ?auto_54593 ) ) ( HOIST-AT ?auto_54605 ?auto_54593 ) ( not ( = ?auto_54594 ?auto_54605 ) ) ( not ( = ?auto_54607 ?auto_54605 ) ) ( not ( = ?auto_54610 ?auto_54605 ) ) ( not ( = ?auto_54604 ?auto_54605 ) ) ( AVAILABLE ?auto_54605 ) ( SURFACE-AT ?auto_54597 ?auto_54593 ) ( ON ?auto_54597 ?auto_54592 ) ( CLEAR ?auto_54597 ) ( not ( = ?auto_54580 ?auto_54592 ) ) ( not ( = ?auto_54581 ?auto_54592 ) ) ( not ( = ?auto_54608 ?auto_54592 ) ) ( not ( = ?auto_54603 ?auto_54592 ) ) ( not ( = ?auto_54595 ?auto_54592 ) ) ( not ( = ?auto_54597 ?auto_54592 ) ) ( not ( = ?auto_54590 ?auto_54592 ) ) ( not ( = ?auto_54602 ?auto_54592 ) ) ( IS-CRATE ?auto_54602 ) ( not ( = ?auto_54580 ?auto_54587 ) ) ( not ( = ?auto_54581 ?auto_54587 ) ) ( not ( = ?auto_54608 ?auto_54587 ) ) ( not ( = ?auto_54603 ?auto_54587 ) ) ( not ( = ?auto_54595 ?auto_54587 ) ) ( not ( = ?auto_54597 ?auto_54587 ) ) ( not ( = ?auto_54590 ?auto_54587 ) ) ( not ( = ?auto_54602 ?auto_54587 ) ) ( not ( = ?auto_54592 ?auto_54587 ) ) ( AVAILABLE ?auto_54610 ) ( SURFACE-AT ?auto_54602 ?auto_54598 ) ( ON ?auto_54602 ?auto_54599 ) ( CLEAR ?auto_54602 ) ( not ( = ?auto_54580 ?auto_54599 ) ) ( not ( = ?auto_54581 ?auto_54599 ) ) ( not ( = ?auto_54608 ?auto_54599 ) ) ( not ( = ?auto_54603 ?auto_54599 ) ) ( not ( = ?auto_54595 ?auto_54599 ) ) ( not ( = ?auto_54597 ?auto_54599 ) ) ( not ( = ?auto_54590 ?auto_54599 ) ) ( not ( = ?auto_54602 ?auto_54599 ) ) ( not ( = ?auto_54592 ?auto_54599 ) ) ( not ( = ?auto_54587 ?auto_54599 ) ) ( IS-CRATE ?auto_54587 ) ( not ( = ?auto_54580 ?auto_54582 ) ) ( not ( = ?auto_54581 ?auto_54582 ) ) ( not ( = ?auto_54608 ?auto_54582 ) ) ( not ( = ?auto_54603 ?auto_54582 ) ) ( not ( = ?auto_54595 ?auto_54582 ) ) ( not ( = ?auto_54597 ?auto_54582 ) ) ( not ( = ?auto_54590 ?auto_54582 ) ) ( not ( = ?auto_54602 ?auto_54582 ) ) ( not ( = ?auto_54592 ?auto_54582 ) ) ( not ( = ?auto_54587 ?auto_54582 ) ) ( not ( = ?auto_54599 ?auto_54582 ) ) ( not ( = ?auto_54584 ?auto_54600 ) ) ( not ( = ?auto_54589 ?auto_54584 ) ) ( not ( = ?auto_54598 ?auto_54584 ) ) ( not ( = ?auto_54606 ?auto_54584 ) ) ( not ( = ?auto_54593 ?auto_54584 ) ) ( HOIST-AT ?auto_54585 ?auto_54584 ) ( not ( = ?auto_54594 ?auto_54585 ) ) ( not ( = ?auto_54607 ?auto_54585 ) ) ( not ( = ?auto_54610 ?auto_54585 ) ) ( not ( = ?auto_54604 ?auto_54585 ) ) ( not ( = ?auto_54605 ?auto_54585 ) ) ( AVAILABLE ?auto_54585 ) ( SURFACE-AT ?auto_54587 ?auto_54584 ) ( ON ?auto_54587 ?auto_54586 ) ( CLEAR ?auto_54587 ) ( not ( = ?auto_54580 ?auto_54586 ) ) ( not ( = ?auto_54581 ?auto_54586 ) ) ( not ( = ?auto_54608 ?auto_54586 ) ) ( not ( = ?auto_54603 ?auto_54586 ) ) ( not ( = ?auto_54595 ?auto_54586 ) ) ( not ( = ?auto_54597 ?auto_54586 ) ) ( not ( = ?auto_54590 ?auto_54586 ) ) ( not ( = ?auto_54602 ?auto_54586 ) ) ( not ( = ?auto_54592 ?auto_54586 ) ) ( not ( = ?auto_54587 ?auto_54586 ) ) ( not ( = ?auto_54599 ?auto_54586 ) ) ( not ( = ?auto_54582 ?auto_54586 ) ) ( IS-CRATE ?auto_54582 ) ( not ( = ?auto_54580 ?auto_54609 ) ) ( not ( = ?auto_54581 ?auto_54609 ) ) ( not ( = ?auto_54608 ?auto_54609 ) ) ( not ( = ?auto_54603 ?auto_54609 ) ) ( not ( = ?auto_54595 ?auto_54609 ) ) ( not ( = ?auto_54597 ?auto_54609 ) ) ( not ( = ?auto_54590 ?auto_54609 ) ) ( not ( = ?auto_54602 ?auto_54609 ) ) ( not ( = ?auto_54592 ?auto_54609 ) ) ( not ( = ?auto_54587 ?auto_54609 ) ) ( not ( = ?auto_54599 ?auto_54609 ) ) ( not ( = ?auto_54582 ?auto_54609 ) ) ( not ( = ?auto_54586 ?auto_54609 ) ) ( not ( = ?auto_54588 ?auto_54600 ) ) ( not ( = ?auto_54589 ?auto_54588 ) ) ( not ( = ?auto_54598 ?auto_54588 ) ) ( not ( = ?auto_54606 ?auto_54588 ) ) ( not ( = ?auto_54593 ?auto_54588 ) ) ( not ( = ?auto_54584 ?auto_54588 ) ) ( HOIST-AT ?auto_54601 ?auto_54588 ) ( not ( = ?auto_54594 ?auto_54601 ) ) ( not ( = ?auto_54607 ?auto_54601 ) ) ( not ( = ?auto_54610 ?auto_54601 ) ) ( not ( = ?auto_54604 ?auto_54601 ) ) ( not ( = ?auto_54605 ?auto_54601 ) ) ( not ( = ?auto_54585 ?auto_54601 ) ) ( AVAILABLE ?auto_54601 ) ( SURFACE-AT ?auto_54582 ?auto_54588 ) ( ON ?auto_54582 ?auto_54596 ) ( CLEAR ?auto_54582 ) ( not ( = ?auto_54580 ?auto_54596 ) ) ( not ( = ?auto_54581 ?auto_54596 ) ) ( not ( = ?auto_54608 ?auto_54596 ) ) ( not ( = ?auto_54603 ?auto_54596 ) ) ( not ( = ?auto_54595 ?auto_54596 ) ) ( not ( = ?auto_54597 ?auto_54596 ) ) ( not ( = ?auto_54590 ?auto_54596 ) ) ( not ( = ?auto_54602 ?auto_54596 ) ) ( not ( = ?auto_54592 ?auto_54596 ) ) ( not ( = ?auto_54587 ?auto_54596 ) ) ( not ( = ?auto_54599 ?auto_54596 ) ) ( not ( = ?auto_54582 ?auto_54596 ) ) ( not ( = ?auto_54586 ?auto_54596 ) ) ( not ( = ?auto_54609 ?auto_54596 ) ) ( SURFACE-AT ?auto_54591 ?auto_54600 ) ( CLEAR ?auto_54591 ) ( IS-CRATE ?auto_54609 ) ( not ( = ?auto_54580 ?auto_54591 ) ) ( not ( = ?auto_54581 ?auto_54591 ) ) ( not ( = ?auto_54608 ?auto_54591 ) ) ( not ( = ?auto_54603 ?auto_54591 ) ) ( not ( = ?auto_54595 ?auto_54591 ) ) ( not ( = ?auto_54597 ?auto_54591 ) ) ( not ( = ?auto_54590 ?auto_54591 ) ) ( not ( = ?auto_54602 ?auto_54591 ) ) ( not ( = ?auto_54592 ?auto_54591 ) ) ( not ( = ?auto_54587 ?auto_54591 ) ) ( not ( = ?auto_54599 ?auto_54591 ) ) ( not ( = ?auto_54582 ?auto_54591 ) ) ( not ( = ?auto_54586 ?auto_54591 ) ) ( not ( = ?auto_54609 ?auto_54591 ) ) ( not ( = ?auto_54596 ?auto_54591 ) ) ( AVAILABLE ?auto_54594 ) ( IN ?auto_54609 ?auto_54583 ) ( TRUCK-AT ?auto_54583 ?auto_54611 ) ( not ( = ?auto_54611 ?auto_54600 ) ) ( not ( = ?auto_54589 ?auto_54611 ) ) ( not ( = ?auto_54598 ?auto_54611 ) ) ( not ( = ?auto_54606 ?auto_54611 ) ) ( not ( = ?auto_54593 ?auto_54611 ) ) ( not ( = ?auto_54584 ?auto_54611 ) ) ( not ( = ?auto_54588 ?auto_54611 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_54583 ?auto_54611 ?auto_54600 )
      ( MAKE-ON ?auto_54580 ?auto_54581 )
      ( MAKE-ON-VERIFY ?auto_54580 ?auto_54581 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54612 - SURFACE
      ?auto_54613 - SURFACE
    )
    :vars
    (
      ?auto_54642 - HOIST
      ?auto_54619 - PLACE
      ?auto_54630 - PLACE
      ?auto_54636 - HOIST
      ?auto_54637 - SURFACE
      ?auto_54625 - SURFACE
      ?auto_54615 - PLACE
      ?auto_54639 - HOIST
      ?auto_54616 - SURFACE
      ?auto_54627 - SURFACE
      ?auto_54635 - PLACE
      ?auto_54626 - HOIST
      ?auto_54633 - SURFACE
      ?auto_54621 - SURFACE
      ?auto_54624 - PLACE
      ?auto_54614 - HOIST
      ?auto_54640 - SURFACE
      ?auto_54629 - SURFACE
      ?auto_54618 - SURFACE
      ?auto_54634 - SURFACE
      ?auto_54631 - PLACE
      ?auto_54622 - HOIST
      ?auto_54623 - SURFACE
      ?auto_54638 - SURFACE
      ?auto_54628 - PLACE
      ?auto_54620 - HOIST
      ?auto_54641 - SURFACE
      ?auto_54617 - SURFACE
      ?auto_54632 - TRUCK
      ?auto_54643 - PLACE
      ?auto_54644 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_54642 ?auto_54619 ) ( IS-CRATE ?auto_54612 ) ( not ( = ?auto_54612 ?auto_54613 ) ) ( not ( = ?auto_54630 ?auto_54619 ) ) ( HOIST-AT ?auto_54636 ?auto_54630 ) ( not ( = ?auto_54642 ?auto_54636 ) ) ( AVAILABLE ?auto_54636 ) ( SURFACE-AT ?auto_54612 ?auto_54630 ) ( ON ?auto_54612 ?auto_54637 ) ( CLEAR ?auto_54612 ) ( not ( = ?auto_54612 ?auto_54637 ) ) ( not ( = ?auto_54613 ?auto_54637 ) ) ( IS-CRATE ?auto_54613 ) ( not ( = ?auto_54612 ?auto_54625 ) ) ( not ( = ?auto_54613 ?auto_54625 ) ) ( not ( = ?auto_54637 ?auto_54625 ) ) ( not ( = ?auto_54615 ?auto_54619 ) ) ( not ( = ?auto_54630 ?auto_54615 ) ) ( HOIST-AT ?auto_54639 ?auto_54615 ) ( not ( = ?auto_54642 ?auto_54639 ) ) ( not ( = ?auto_54636 ?auto_54639 ) ) ( SURFACE-AT ?auto_54613 ?auto_54615 ) ( ON ?auto_54613 ?auto_54616 ) ( CLEAR ?auto_54613 ) ( not ( = ?auto_54612 ?auto_54616 ) ) ( not ( = ?auto_54613 ?auto_54616 ) ) ( not ( = ?auto_54637 ?auto_54616 ) ) ( not ( = ?auto_54625 ?auto_54616 ) ) ( IS-CRATE ?auto_54625 ) ( not ( = ?auto_54612 ?auto_54627 ) ) ( not ( = ?auto_54613 ?auto_54627 ) ) ( not ( = ?auto_54637 ?auto_54627 ) ) ( not ( = ?auto_54625 ?auto_54627 ) ) ( not ( = ?auto_54616 ?auto_54627 ) ) ( not ( = ?auto_54635 ?auto_54619 ) ) ( not ( = ?auto_54630 ?auto_54635 ) ) ( not ( = ?auto_54615 ?auto_54635 ) ) ( HOIST-AT ?auto_54626 ?auto_54635 ) ( not ( = ?auto_54642 ?auto_54626 ) ) ( not ( = ?auto_54636 ?auto_54626 ) ) ( not ( = ?auto_54639 ?auto_54626 ) ) ( AVAILABLE ?auto_54626 ) ( SURFACE-AT ?auto_54625 ?auto_54635 ) ( ON ?auto_54625 ?auto_54633 ) ( CLEAR ?auto_54625 ) ( not ( = ?auto_54612 ?auto_54633 ) ) ( not ( = ?auto_54613 ?auto_54633 ) ) ( not ( = ?auto_54637 ?auto_54633 ) ) ( not ( = ?auto_54625 ?auto_54633 ) ) ( not ( = ?auto_54616 ?auto_54633 ) ) ( not ( = ?auto_54627 ?auto_54633 ) ) ( IS-CRATE ?auto_54627 ) ( not ( = ?auto_54612 ?auto_54621 ) ) ( not ( = ?auto_54613 ?auto_54621 ) ) ( not ( = ?auto_54637 ?auto_54621 ) ) ( not ( = ?auto_54625 ?auto_54621 ) ) ( not ( = ?auto_54616 ?auto_54621 ) ) ( not ( = ?auto_54627 ?auto_54621 ) ) ( not ( = ?auto_54633 ?auto_54621 ) ) ( not ( = ?auto_54624 ?auto_54619 ) ) ( not ( = ?auto_54630 ?auto_54624 ) ) ( not ( = ?auto_54615 ?auto_54624 ) ) ( not ( = ?auto_54635 ?auto_54624 ) ) ( HOIST-AT ?auto_54614 ?auto_54624 ) ( not ( = ?auto_54642 ?auto_54614 ) ) ( not ( = ?auto_54636 ?auto_54614 ) ) ( not ( = ?auto_54639 ?auto_54614 ) ) ( not ( = ?auto_54626 ?auto_54614 ) ) ( AVAILABLE ?auto_54614 ) ( SURFACE-AT ?auto_54627 ?auto_54624 ) ( ON ?auto_54627 ?auto_54640 ) ( CLEAR ?auto_54627 ) ( not ( = ?auto_54612 ?auto_54640 ) ) ( not ( = ?auto_54613 ?auto_54640 ) ) ( not ( = ?auto_54637 ?auto_54640 ) ) ( not ( = ?auto_54625 ?auto_54640 ) ) ( not ( = ?auto_54616 ?auto_54640 ) ) ( not ( = ?auto_54627 ?auto_54640 ) ) ( not ( = ?auto_54633 ?auto_54640 ) ) ( not ( = ?auto_54621 ?auto_54640 ) ) ( IS-CRATE ?auto_54621 ) ( not ( = ?auto_54612 ?auto_54629 ) ) ( not ( = ?auto_54613 ?auto_54629 ) ) ( not ( = ?auto_54637 ?auto_54629 ) ) ( not ( = ?auto_54625 ?auto_54629 ) ) ( not ( = ?auto_54616 ?auto_54629 ) ) ( not ( = ?auto_54627 ?auto_54629 ) ) ( not ( = ?auto_54633 ?auto_54629 ) ) ( not ( = ?auto_54621 ?auto_54629 ) ) ( not ( = ?auto_54640 ?auto_54629 ) ) ( AVAILABLE ?auto_54639 ) ( SURFACE-AT ?auto_54621 ?auto_54615 ) ( ON ?auto_54621 ?auto_54618 ) ( CLEAR ?auto_54621 ) ( not ( = ?auto_54612 ?auto_54618 ) ) ( not ( = ?auto_54613 ?auto_54618 ) ) ( not ( = ?auto_54637 ?auto_54618 ) ) ( not ( = ?auto_54625 ?auto_54618 ) ) ( not ( = ?auto_54616 ?auto_54618 ) ) ( not ( = ?auto_54627 ?auto_54618 ) ) ( not ( = ?auto_54633 ?auto_54618 ) ) ( not ( = ?auto_54621 ?auto_54618 ) ) ( not ( = ?auto_54640 ?auto_54618 ) ) ( not ( = ?auto_54629 ?auto_54618 ) ) ( IS-CRATE ?auto_54629 ) ( not ( = ?auto_54612 ?auto_54634 ) ) ( not ( = ?auto_54613 ?auto_54634 ) ) ( not ( = ?auto_54637 ?auto_54634 ) ) ( not ( = ?auto_54625 ?auto_54634 ) ) ( not ( = ?auto_54616 ?auto_54634 ) ) ( not ( = ?auto_54627 ?auto_54634 ) ) ( not ( = ?auto_54633 ?auto_54634 ) ) ( not ( = ?auto_54621 ?auto_54634 ) ) ( not ( = ?auto_54640 ?auto_54634 ) ) ( not ( = ?auto_54629 ?auto_54634 ) ) ( not ( = ?auto_54618 ?auto_54634 ) ) ( not ( = ?auto_54631 ?auto_54619 ) ) ( not ( = ?auto_54630 ?auto_54631 ) ) ( not ( = ?auto_54615 ?auto_54631 ) ) ( not ( = ?auto_54635 ?auto_54631 ) ) ( not ( = ?auto_54624 ?auto_54631 ) ) ( HOIST-AT ?auto_54622 ?auto_54631 ) ( not ( = ?auto_54642 ?auto_54622 ) ) ( not ( = ?auto_54636 ?auto_54622 ) ) ( not ( = ?auto_54639 ?auto_54622 ) ) ( not ( = ?auto_54626 ?auto_54622 ) ) ( not ( = ?auto_54614 ?auto_54622 ) ) ( AVAILABLE ?auto_54622 ) ( SURFACE-AT ?auto_54629 ?auto_54631 ) ( ON ?auto_54629 ?auto_54623 ) ( CLEAR ?auto_54629 ) ( not ( = ?auto_54612 ?auto_54623 ) ) ( not ( = ?auto_54613 ?auto_54623 ) ) ( not ( = ?auto_54637 ?auto_54623 ) ) ( not ( = ?auto_54625 ?auto_54623 ) ) ( not ( = ?auto_54616 ?auto_54623 ) ) ( not ( = ?auto_54627 ?auto_54623 ) ) ( not ( = ?auto_54633 ?auto_54623 ) ) ( not ( = ?auto_54621 ?auto_54623 ) ) ( not ( = ?auto_54640 ?auto_54623 ) ) ( not ( = ?auto_54629 ?auto_54623 ) ) ( not ( = ?auto_54618 ?auto_54623 ) ) ( not ( = ?auto_54634 ?auto_54623 ) ) ( IS-CRATE ?auto_54634 ) ( not ( = ?auto_54612 ?auto_54638 ) ) ( not ( = ?auto_54613 ?auto_54638 ) ) ( not ( = ?auto_54637 ?auto_54638 ) ) ( not ( = ?auto_54625 ?auto_54638 ) ) ( not ( = ?auto_54616 ?auto_54638 ) ) ( not ( = ?auto_54627 ?auto_54638 ) ) ( not ( = ?auto_54633 ?auto_54638 ) ) ( not ( = ?auto_54621 ?auto_54638 ) ) ( not ( = ?auto_54640 ?auto_54638 ) ) ( not ( = ?auto_54629 ?auto_54638 ) ) ( not ( = ?auto_54618 ?auto_54638 ) ) ( not ( = ?auto_54634 ?auto_54638 ) ) ( not ( = ?auto_54623 ?auto_54638 ) ) ( not ( = ?auto_54628 ?auto_54619 ) ) ( not ( = ?auto_54630 ?auto_54628 ) ) ( not ( = ?auto_54615 ?auto_54628 ) ) ( not ( = ?auto_54635 ?auto_54628 ) ) ( not ( = ?auto_54624 ?auto_54628 ) ) ( not ( = ?auto_54631 ?auto_54628 ) ) ( HOIST-AT ?auto_54620 ?auto_54628 ) ( not ( = ?auto_54642 ?auto_54620 ) ) ( not ( = ?auto_54636 ?auto_54620 ) ) ( not ( = ?auto_54639 ?auto_54620 ) ) ( not ( = ?auto_54626 ?auto_54620 ) ) ( not ( = ?auto_54614 ?auto_54620 ) ) ( not ( = ?auto_54622 ?auto_54620 ) ) ( AVAILABLE ?auto_54620 ) ( SURFACE-AT ?auto_54634 ?auto_54628 ) ( ON ?auto_54634 ?auto_54641 ) ( CLEAR ?auto_54634 ) ( not ( = ?auto_54612 ?auto_54641 ) ) ( not ( = ?auto_54613 ?auto_54641 ) ) ( not ( = ?auto_54637 ?auto_54641 ) ) ( not ( = ?auto_54625 ?auto_54641 ) ) ( not ( = ?auto_54616 ?auto_54641 ) ) ( not ( = ?auto_54627 ?auto_54641 ) ) ( not ( = ?auto_54633 ?auto_54641 ) ) ( not ( = ?auto_54621 ?auto_54641 ) ) ( not ( = ?auto_54640 ?auto_54641 ) ) ( not ( = ?auto_54629 ?auto_54641 ) ) ( not ( = ?auto_54618 ?auto_54641 ) ) ( not ( = ?auto_54634 ?auto_54641 ) ) ( not ( = ?auto_54623 ?auto_54641 ) ) ( not ( = ?auto_54638 ?auto_54641 ) ) ( SURFACE-AT ?auto_54617 ?auto_54619 ) ( CLEAR ?auto_54617 ) ( IS-CRATE ?auto_54638 ) ( not ( = ?auto_54612 ?auto_54617 ) ) ( not ( = ?auto_54613 ?auto_54617 ) ) ( not ( = ?auto_54637 ?auto_54617 ) ) ( not ( = ?auto_54625 ?auto_54617 ) ) ( not ( = ?auto_54616 ?auto_54617 ) ) ( not ( = ?auto_54627 ?auto_54617 ) ) ( not ( = ?auto_54633 ?auto_54617 ) ) ( not ( = ?auto_54621 ?auto_54617 ) ) ( not ( = ?auto_54640 ?auto_54617 ) ) ( not ( = ?auto_54629 ?auto_54617 ) ) ( not ( = ?auto_54618 ?auto_54617 ) ) ( not ( = ?auto_54634 ?auto_54617 ) ) ( not ( = ?auto_54623 ?auto_54617 ) ) ( not ( = ?auto_54638 ?auto_54617 ) ) ( not ( = ?auto_54641 ?auto_54617 ) ) ( AVAILABLE ?auto_54642 ) ( TRUCK-AT ?auto_54632 ?auto_54643 ) ( not ( = ?auto_54643 ?auto_54619 ) ) ( not ( = ?auto_54630 ?auto_54643 ) ) ( not ( = ?auto_54615 ?auto_54643 ) ) ( not ( = ?auto_54635 ?auto_54643 ) ) ( not ( = ?auto_54624 ?auto_54643 ) ) ( not ( = ?auto_54631 ?auto_54643 ) ) ( not ( = ?auto_54628 ?auto_54643 ) ) ( HOIST-AT ?auto_54644 ?auto_54643 ) ( LIFTING ?auto_54644 ?auto_54638 ) ( not ( = ?auto_54642 ?auto_54644 ) ) ( not ( = ?auto_54636 ?auto_54644 ) ) ( not ( = ?auto_54639 ?auto_54644 ) ) ( not ( = ?auto_54626 ?auto_54644 ) ) ( not ( = ?auto_54614 ?auto_54644 ) ) ( not ( = ?auto_54622 ?auto_54644 ) ) ( not ( = ?auto_54620 ?auto_54644 ) ) )
    :subtasks
    ( ( !LOAD ?auto_54644 ?auto_54638 ?auto_54632 ?auto_54643 )
      ( MAKE-ON ?auto_54612 ?auto_54613 )
      ( MAKE-ON-VERIFY ?auto_54612 ?auto_54613 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54645 - SURFACE
      ?auto_54646 - SURFACE
    )
    :vars
    (
      ?auto_54660 - HOIST
      ?auto_54647 - PLACE
      ?auto_54663 - PLACE
      ?auto_54669 - HOIST
      ?auto_54662 - SURFACE
      ?auto_54674 - SURFACE
      ?auto_54651 - PLACE
      ?auto_54648 - HOIST
      ?auto_54657 - SURFACE
      ?auto_54675 - SURFACE
      ?auto_54668 - PLACE
      ?auto_54676 - HOIST
      ?auto_54666 - SURFACE
      ?auto_54677 - SURFACE
      ?auto_54673 - PLACE
      ?auto_54654 - HOIST
      ?auto_54650 - SURFACE
      ?auto_54670 - SURFACE
      ?auto_54659 - SURFACE
      ?auto_54667 - SURFACE
      ?auto_54664 - PLACE
      ?auto_54671 - HOIST
      ?auto_54672 - SURFACE
      ?auto_54649 - SURFACE
      ?auto_54655 - PLACE
      ?auto_54653 - HOIST
      ?auto_54652 - SURFACE
      ?auto_54658 - SURFACE
      ?auto_54665 - TRUCK
      ?auto_54661 - PLACE
      ?auto_54656 - HOIST
      ?auto_54678 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54660 ?auto_54647 ) ( IS-CRATE ?auto_54645 ) ( not ( = ?auto_54645 ?auto_54646 ) ) ( not ( = ?auto_54663 ?auto_54647 ) ) ( HOIST-AT ?auto_54669 ?auto_54663 ) ( not ( = ?auto_54660 ?auto_54669 ) ) ( AVAILABLE ?auto_54669 ) ( SURFACE-AT ?auto_54645 ?auto_54663 ) ( ON ?auto_54645 ?auto_54662 ) ( CLEAR ?auto_54645 ) ( not ( = ?auto_54645 ?auto_54662 ) ) ( not ( = ?auto_54646 ?auto_54662 ) ) ( IS-CRATE ?auto_54646 ) ( not ( = ?auto_54645 ?auto_54674 ) ) ( not ( = ?auto_54646 ?auto_54674 ) ) ( not ( = ?auto_54662 ?auto_54674 ) ) ( not ( = ?auto_54651 ?auto_54647 ) ) ( not ( = ?auto_54663 ?auto_54651 ) ) ( HOIST-AT ?auto_54648 ?auto_54651 ) ( not ( = ?auto_54660 ?auto_54648 ) ) ( not ( = ?auto_54669 ?auto_54648 ) ) ( SURFACE-AT ?auto_54646 ?auto_54651 ) ( ON ?auto_54646 ?auto_54657 ) ( CLEAR ?auto_54646 ) ( not ( = ?auto_54645 ?auto_54657 ) ) ( not ( = ?auto_54646 ?auto_54657 ) ) ( not ( = ?auto_54662 ?auto_54657 ) ) ( not ( = ?auto_54674 ?auto_54657 ) ) ( IS-CRATE ?auto_54674 ) ( not ( = ?auto_54645 ?auto_54675 ) ) ( not ( = ?auto_54646 ?auto_54675 ) ) ( not ( = ?auto_54662 ?auto_54675 ) ) ( not ( = ?auto_54674 ?auto_54675 ) ) ( not ( = ?auto_54657 ?auto_54675 ) ) ( not ( = ?auto_54668 ?auto_54647 ) ) ( not ( = ?auto_54663 ?auto_54668 ) ) ( not ( = ?auto_54651 ?auto_54668 ) ) ( HOIST-AT ?auto_54676 ?auto_54668 ) ( not ( = ?auto_54660 ?auto_54676 ) ) ( not ( = ?auto_54669 ?auto_54676 ) ) ( not ( = ?auto_54648 ?auto_54676 ) ) ( AVAILABLE ?auto_54676 ) ( SURFACE-AT ?auto_54674 ?auto_54668 ) ( ON ?auto_54674 ?auto_54666 ) ( CLEAR ?auto_54674 ) ( not ( = ?auto_54645 ?auto_54666 ) ) ( not ( = ?auto_54646 ?auto_54666 ) ) ( not ( = ?auto_54662 ?auto_54666 ) ) ( not ( = ?auto_54674 ?auto_54666 ) ) ( not ( = ?auto_54657 ?auto_54666 ) ) ( not ( = ?auto_54675 ?auto_54666 ) ) ( IS-CRATE ?auto_54675 ) ( not ( = ?auto_54645 ?auto_54677 ) ) ( not ( = ?auto_54646 ?auto_54677 ) ) ( not ( = ?auto_54662 ?auto_54677 ) ) ( not ( = ?auto_54674 ?auto_54677 ) ) ( not ( = ?auto_54657 ?auto_54677 ) ) ( not ( = ?auto_54675 ?auto_54677 ) ) ( not ( = ?auto_54666 ?auto_54677 ) ) ( not ( = ?auto_54673 ?auto_54647 ) ) ( not ( = ?auto_54663 ?auto_54673 ) ) ( not ( = ?auto_54651 ?auto_54673 ) ) ( not ( = ?auto_54668 ?auto_54673 ) ) ( HOIST-AT ?auto_54654 ?auto_54673 ) ( not ( = ?auto_54660 ?auto_54654 ) ) ( not ( = ?auto_54669 ?auto_54654 ) ) ( not ( = ?auto_54648 ?auto_54654 ) ) ( not ( = ?auto_54676 ?auto_54654 ) ) ( AVAILABLE ?auto_54654 ) ( SURFACE-AT ?auto_54675 ?auto_54673 ) ( ON ?auto_54675 ?auto_54650 ) ( CLEAR ?auto_54675 ) ( not ( = ?auto_54645 ?auto_54650 ) ) ( not ( = ?auto_54646 ?auto_54650 ) ) ( not ( = ?auto_54662 ?auto_54650 ) ) ( not ( = ?auto_54674 ?auto_54650 ) ) ( not ( = ?auto_54657 ?auto_54650 ) ) ( not ( = ?auto_54675 ?auto_54650 ) ) ( not ( = ?auto_54666 ?auto_54650 ) ) ( not ( = ?auto_54677 ?auto_54650 ) ) ( IS-CRATE ?auto_54677 ) ( not ( = ?auto_54645 ?auto_54670 ) ) ( not ( = ?auto_54646 ?auto_54670 ) ) ( not ( = ?auto_54662 ?auto_54670 ) ) ( not ( = ?auto_54674 ?auto_54670 ) ) ( not ( = ?auto_54657 ?auto_54670 ) ) ( not ( = ?auto_54675 ?auto_54670 ) ) ( not ( = ?auto_54666 ?auto_54670 ) ) ( not ( = ?auto_54677 ?auto_54670 ) ) ( not ( = ?auto_54650 ?auto_54670 ) ) ( AVAILABLE ?auto_54648 ) ( SURFACE-AT ?auto_54677 ?auto_54651 ) ( ON ?auto_54677 ?auto_54659 ) ( CLEAR ?auto_54677 ) ( not ( = ?auto_54645 ?auto_54659 ) ) ( not ( = ?auto_54646 ?auto_54659 ) ) ( not ( = ?auto_54662 ?auto_54659 ) ) ( not ( = ?auto_54674 ?auto_54659 ) ) ( not ( = ?auto_54657 ?auto_54659 ) ) ( not ( = ?auto_54675 ?auto_54659 ) ) ( not ( = ?auto_54666 ?auto_54659 ) ) ( not ( = ?auto_54677 ?auto_54659 ) ) ( not ( = ?auto_54650 ?auto_54659 ) ) ( not ( = ?auto_54670 ?auto_54659 ) ) ( IS-CRATE ?auto_54670 ) ( not ( = ?auto_54645 ?auto_54667 ) ) ( not ( = ?auto_54646 ?auto_54667 ) ) ( not ( = ?auto_54662 ?auto_54667 ) ) ( not ( = ?auto_54674 ?auto_54667 ) ) ( not ( = ?auto_54657 ?auto_54667 ) ) ( not ( = ?auto_54675 ?auto_54667 ) ) ( not ( = ?auto_54666 ?auto_54667 ) ) ( not ( = ?auto_54677 ?auto_54667 ) ) ( not ( = ?auto_54650 ?auto_54667 ) ) ( not ( = ?auto_54670 ?auto_54667 ) ) ( not ( = ?auto_54659 ?auto_54667 ) ) ( not ( = ?auto_54664 ?auto_54647 ) ) ( not ( = ?auto_54663 ?auto_54664 ) ) ( not ( = ?auto_54651 ?auto_54664 ) ) ( not ( = ?auto_54668 ?auto_54664 ) ) ( not ( = ?auto_54673 ?auto_54664 ) ) ( HOIST-AT ?auto_54671 ?auto_54664 ) ( not ( = ?auto_54660 ?auto_54671 ) ) ( not ( = ?auto_54669 ?auto_54671 ) ) ( not ( = ?auto_54648 ?auto_54671 ) ) ( not ( = ?auto_54676 ?auto_54671 ) ) ( not ( = ?auto_54654 ?auto_54671 ) ) ( AVAILABLE ?auto_54671 ) ( SURFACE-AT ?auto_54670 ?auto_54664 ) ( ON ?auto_54670 ?auto_54672 ) ( CLEAR ?auto_54670 ) ( not ( = ?auto_54645 ?auto_54672 ) ) ( not ( = ?auto_54646 ?auto_54672 ) ) ( not ( = ?auto_54662 ?auto_54672 ) ) ( not ( = ?auto_54674 ?auto_54672 ) ) ( not ( = ?auto_54657 ?auto_54672 ) ) ( not ( = ?auto_54675 ?auto_54672 ) ) ( not ( = ?auto_54666 ?auto_54672 ) ) ( not ( = ?auto_54677 ?auto_54672 ) ) ( not ( = ?auto_54650 ?auto_54672 ) ) ( not ( = ?auto_54670 ?auto_54672 ) ) ( not ( = ?auto_54659 ?auto_54672 ) ) ( not ( = ?auto_54667 ?auto_54672 ) ) ( IS-CRATE ?auto_54667 ) ( not ( = ?auto_54645 ?auto_54649 ) ) ( not ( = ?auto_54646 ?auto_54649 ) ) ( not ( = ?auto_54662 ?auto_54649 ) ) ( not ( = ?auto_54674 ?auto_54649 ) ) ( not ( = ?auto_54657 ?auto_54649 ) ) ( not ( = ?auto_54675 ?auto_54649 ) ) ( not ( = ?auto_54666 ?auto_54649 ) ) ( not ( = ?auto_54677 ?auto_54649 ) ) ( not ( = ?auto_54650 ?auto_54649 ) ) ( not ( = ?auto_54670 ?auto_54649 ) ) ( not ( = ?auto_54659 ?auto_54649 ) ) ( not ( = ?auto_54667 ?auto_54649 ) ) ( not ( = ?auto_54672 ?auto_54649 ) ) ( not ( = ?auto_54655 ?auto_54647 ) ) ( not ( = ?auto_54663 ?auto_54655 ) ) ( not ( = ?auto_54651 ?auto_54655 ) ) ( not ( = ?auto_54668 ?auto_54655 ) ) ( not ( = ?auto_54673 ?auto_54655 ) ) ( not ( = ?auto_54664 ?auto_54655 ) ) ( HOIST-AT ?auto_54653 ?auto_54655 ) ( not ( = ?auto_54660 ?auto_54653 ) ) ( not ( = ?auto_54669 ?auto_54653 ) ) ( not ( = ?auto_54648 ?auto_54653 ) ) ( not ( = ?auto_54676 ?auto_54653 ) ) ( not ( = ?auto_54654 ?auto_54653 ) ) ( not ( = ?auto_54671 ?auto_54653 ) ) ( AVAILABLE ?auto_54653 ) ( SURFACE-AT ?auto_54667 ?auto_54655 ) ( ON ?auto_54667 ?auto_54652 ) ( CLEAR ?auto_54667 ) ( not ( = ?auto_54645 ?auto_54652 ) ) ( not ( = ?auto_54646 ?auto_54652 ) ) ( not ( = ?auto_54662 ?auto_54652 ) ) ( not ( = ?auto_54674 ?auto_54652 ) ) ( not ( = ?auto_54657 ?auto_54652 ) ) ( not ( = ?auto_54675 ?auto_54652 ) ) ( not ( = ?auto_54666 ?auto_54652 ) ) ( not ( = ?auto_54677 ?auto_54652 ) ) ( not ( = ?auto_54650 ?auto_54652 ) ) ( not ( = ?auto_54670 ?auto_54652 ) ) ( not ( = ?auto_54659 ?auto_54652 ) ) ( not ( = ?auto_54667 ?auto_54652 ) ) ( not ( = ?auto_54672 ?auto_54652 ) ) ( not ( = ?auto_54649 ?auto_54652 ) ) ( SURFACE-AT ?auto_54658 ?auto_54647 ) ( CLEAR ?auto_54658 ) ( IS-CRATE ?auto_54649 ) ( not ( = ?auto_54645 ?auto_54658 ) ) ( not ( = ?auto_54646 ?auto_54658 ) ) ( not ( = ?auto_54662 ?auto_54658 ) ) ( not ( = ?auto_54674 ?auto_54658 ) ) ( not ( = ?auto_54657 ?auto_54658 ) ) ( not ( = ?auto_54675 ?auto_54658 ) ) ( not ( = ?auto_54666 ?auto_54658 ) ) ( not ( = ?auto_54677 ?auto_54658 ) ) ( not ( = ?auto_54650 ?auto_54658 ) ) ( not ( = ?auto_54670 ?auto_54658 ) ) ( not ( = ?auto_54659 ?auto_54658 ) ) ( not ( = ?auto_54667 ?auto_54658 ) ) ( not ( = ?auto_54672 ?auto_54658 ) ) ( not ( = ?auto_54649 ?auto_54658 ) ) ( not ( = ?auto_54652 ?auto_54658 ) ) ( AVAILABLE ?auto_54660 ) ( TRUCK-AT ?auto_54665 ?auto_54661 ) ( not ( = ?auto_54661 ?auto_54647 ) ) ( not ( = ?auto_54663 ?auto_54661 ) ) ( not ( = ?auto_54651 ?auto_54661 ) ) ( not ( = ?auto_54668 ?auto_54661 ) ) ( not ( = ?auto_54673 ?auto_54661 ) ) ( not ( = ?auto_54664 ?auto_54661 ) ) ( not ( = ?auto_54655 ?auto_54661 ) ) ( HOIST-AT ?auto_54656 ?auto_54661 ) ( not ( = ?auto_54660 ?auto_54656 ) ) ( not ( = ?auto_54669 ?auto_54656 ) ) ( not ( = ?auto_54648 ?auto_54656 ) ) ( not ( = ?auto_54676 ?auto_54656 ) ) ( not ( = ?auto_54654 ?auto_54656 ) ) ( not ( = ?auto_54671 ?auto_54656 ) ) ( not ( = ?auto_54653 ?auto_54656 ) ) ( AVAILABLE ?auto_54656 ) ( SURFACE-AT ?auto_54649 ?auto_54661 ) ( ON ?auto_54649 ?auto_54678 ) ( CLEAR ?auto_54649 ) ( not ( = ?auto_54645 ?auto_54678 ) ) ( not ( = ?auto_54646 ?auto_54678 ) ) ( not ( = ?auto_54662 ?auto_54678 ) ) ( not ( = ?auto_54674 ?auto_54678 ) ) ( not ( = ?auto_54657 ?auto_54678 ) ) ( not ( = ?auto_54675 ?auto_54678 ) ) ( not ( = ?auto_54666 ?auto_54678 ) ) ( not ( = ?auto_54677 ?auto_54678 ) ) ( not ( = ?auto_54650 ?auto_54678 ) ) ( not ( = ?auto_54670 ?auto_54678 ) ) ( not ( = ?auto_54659 ?auto_54678 ) ) ( not ( = ?auto_54667 ?auto_54678 ) ) ( not ( = ?auto_54672 ?auto_54678 ) ) ( not ( = ?auto_54649 ?auto_54678 ) ) ( not ( = ?auto_54652 ?auto_54678 ) ) ( not ( = ?auto_54658 ?auto_54678 ) ) )
    :subtasks
    ( ( !LIFT ?auto_54656 ?auto_54649 ?auto_54678 ?auto_54661 )
      ( MAKE-ON ?auto_54645 ?auto_54646 )
      ( MAKE-ON-VERIFY ?auto_54645 ?auto_54646 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54679 - SURFACE
      ?auto_54680 - SURFACE
    )
    :vars
    (
      ?auto_54709 - HOIST
      ?auto_54685 - PLACE
      ?auto_54705 - PLACE
      ?auto_54696 - HOIST
      ?auto_54697 - SURFACE
      ?auto_54690 - SURFACE
      ?auto_54681 - PLACE
      ?auto_54684 - HOIST
      ?auto_54686 - SURFACE
      ?auto_54691 - SURFACE
      ?auto_54695 - PLACE
      ?auto_54702 - HOIST
      ?auto_54693 - SURFACE
      ?auto_54703 - SURFACE
      ?auto_54689 - PLACE
      ?auto_54708 - HOIST
      ?auto_54682 - SURFACE
      ?auto_54704 - SURFACE
      ?auto_54698 - SURFACE
      ?auto_54694 - SURFACE
      ?auto_54706 - PLACE
      ?auto_54701 - HOIST
      ?auto_54688 - SURFACE
      ?auto_54683 - SURFACE
      ?auto_54699 - PLACE
      ?auto_54711 - HOIST
      ?auto_54687 - SURFACE
      ?auto_54707 - SURFACE
      ?auto_54710 - PLACE
      ?auto_54700 - HOIST
      ?auto_54712 - SURFACE
      ?auto_54692 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54709 ?auto_54685 ) ( IS-CRATE ?auto_54679 ) ( not ( = ?auto_54679 ?auto_54680 ) ) ( not ( = ?auto_54705 ?auto_54685 ) ) ( HOIST-AT ?auto_54696 ?auto_54705 ) ( not ( = ?auto_54709 ?auto_54696 ) ) ( AVAILABLE ?auto_54696 ) ( SURFACE-AT ?auto_54679 ?auto_54705 ) ( ON ?auto_54679 ?auto_54697 ) ( CLEAR ?auto_54679 ) ( not ( = ?auto_54679 ?auto_54697 ) ) ( not ( = ?auto_54680 ?auto_54697 ) ) ( IS-CRATE ?auto_54680 ) ( not ( = ?auto_54679 ?auto_54690 ) ) ( not ( = ?auto_54680 ?auto_54690 ) ) ( not ( = ?auto_54697 ?auto_54690 ) ) ( not ( = ?auto_54681 ?auto_54685 ) ) ( not ( = ?auto_54705 ?auto_54681 ) ) ( HOIST-AT ?auto_54684 ?auto_54681 ) ( not ( = ?auto_54709 ?auto_54684 ) ) ( not ( = ?auto_54696 ?auto_54684 ) ) ( SURFACE-AT ?auto_54680 ?auto_54681 ) ( ON ?auto_54680 ?auto_54686 ) ( CLEAR ?auto_54680 ) ( not ( = ?auto_54679 ?auto_54686 ) ) ( not ( = ?auto_54680 ?auto_54686 ) ) ( not ( = ?auto_54697 ?auto_54686 ) ) ( not ( = ?auto_54690 ?auto_54686 ) ) ( IS-CRATE ?auto_54690 ) ( not ( = ?auto_54679 ?auto_54691 ) ) ( not ( = ?auto_54680 ?auto_54691 ) ) ( not ( = ?auto_54697 ?auto_54691 ) ) ( not ( = ?auto_54690 ?auto_54691 ) ) ( not ( = ?auto_54686 ?auto_54691 ) ) ( not ( = ?auto_54695 ?auto_54685 ) ) ( not ( = ?auto_54705 ?auto_54695 ) ) ( not ( = ?auto_54681 ?auto_54695 ) ) ( HOIST-AT ?auto_54702 ?auto_54695 ) ( not ( = ?auto_54709 ?auto_54702 ) ) ( not ( = ?auto_54696 ?auto_54702 ) ) ( not ( = ?auto_54684 ?auto_54702 ) ) ( AVAILABLE ?auto_54702 ) ( SURFACE-AT ?auto_54690 ?auto_54695 ) ( ON ?auto_54690 ?auto_54693 ) ( CLEAR ?auto_54690 ) ( not ( = ?auto_54679 ?auto_54693 ) ) ( not ( = ?auto_54680 ?auto_54693 ) ) ( not ( = ?auto_54697 ?auto_54693 ) ) ( not ( = ?auto_54690 ?auto_54693 ) ) ( not ( = ?auto_54686 ?auto_54693 ) ) ( not ( = ?auto_54691 ?auto_54693 ) ) ( IS-CRATE ?auto_54691 ) ( not ( = ?auto_54679 ?auto_54703 ) ) ( not ( = ?auto_54680 ?auto_54703 ) ) ( not ( = ?auto_54697 ?auto_54703 ) ) ( not ( = ?auto_54690 ?auto_54703 ) ) ( not ( = ?auto_54686 ?auto_54703 ) ) ( not ( = ?auto_54691 ?auto_54703 ) ) ( not ( = ?auto_54693 ?auto_54703 ) ) ( not ( = ?auto_54689 ?auto_54685 ) ) ( not ( = ?auto_54705 ?auto_54689 ) ) ( not ( = ?auto_54681 ?auto_54689 ) ) ( not ( = ?auto_54695 ?auto_54689 ) ) ( HOIST-AT ?auto_54708 ?auto_54689 ) ( not ( = ?auto_54709 ?auto_54708 ) ) ( not ( = ?auto_54696 ?auto_54708 ) ) ( not ( = ?auto_54684 ?auto_54708 ) ) ( not ( = ?auto_54702 ?auto_54708 ) ) ( AVAILABLE ?auto_54708 ) ( SURFACE-AT ?auto_54691 ?auto_54689 ) ( ON ?auto_54691 ?auto_54682 ) ( CLEAR ?auto_54691 ) ( not ( = ?auto_54679 ?auto_54682 ) ) ( not ( = ?auto_54680 ?auto_54682 ) ) ( not ( = ?auto_54697 ?auto_54682 ) ) ( not ( = ?auto_54690 ?auto_54682 ) ) ( not ( = ?auto_54686 ?auto_54682 ) ) ( not ( = ?auto_54691 ?auto_54682 ) ) ( not ( = ?auto_54693 ?auto_54682 ) ) ( not ( = ?auto_54703 ?auto_54682 ) ) ( IS-CRATE ?auto_54703 ) ( not ( = ?auto_54679 ?auto_54704 ) ) ( not ( = ?auto_54680 ?auto_54704 ) ) ( not ( = ?auto_54697 ?auto_54704 ) ) ( not ( = ?auto_54690 ?auto_54704 ) ) ( not ( = ?auto_54686 ?auto_54704 ) ) ( not ( = ?auto_54691 ?auto_54704 ) ) ( not ( = ?auto_54693 ?auto_54704 ) ) ( not ( = ?auto_54703 ?auto_54704 ) ) ( not ( = ?auto_54682 ?auto_54704 ) ) ( AVAILABLE ?auto_54684 ) ( SURFACE-AT ?auto_54703 ?auto_54681 ) ( ON ?auto_54703 ?auto_54698 ) ( CLEAR ?auto_54703 ) ( not ( = ?auto_54679 ?auto_54698 ) ) ( not ( = ?auto_54680 ?auto_54698 ) ) ( not ( = ?auto_54697 ?auto_54698 ) ) ( not ( = ?auto_54690 ?auto_54698 ) ) ( not ( = ?auto_54686 ?auto_54698 ) ) ( not ( = ?auto_54691 ?auto_54698 ) ) ( not ( = ?auto_54693 ?auto_54698 ) ) ( not ( = ?auto_54703 ?auto_54698 ) ) ( not ( = ?auto_54682 ?auto_54698 ) ) ( not ( = ?auto_54704 ?auto_54698 ) ) ( IS-CRATE ?auto_54704 ) ( not ( = ?auto_54679 ?auto_54694 ) ) ( not ( = ?auto_54680 ?auto_54694 ) ) ( not ( = ?auto_54697 ?auto_54694 ) ) ( not ( = ?auto_54690 ?auto_54694 ) ) ( not ( = ?auto_54686 ?auto_54694 ) ) ( not ( = ?auto_54691 ?auto_54694 ) ) ( not ( = ?auto_54693 ?auto_54694 ) ) ( not ( = ?auto_54703 ?auto_54694 ) ) ( not ( = ?auto_54682 ?auto_54694 ) ) ( not ( = ?auto_54704 ?auto_54694 ) ) ( not ( = ?auto_54698 ?auto_54694 ) ) ( not ( = ?auto_54706 ?auto_54685 ) ) ( not ( = ?auto_54705 ?auto_54706 ) ) ( not ( = ?auto_54681 ?auto_54706 ) ) ( not ( = ?auto_54695 ?auto_54706 ) ) ( not ( = ?auto_54689 ?auto_54706 ) ) ( HOIST-AT ?auto_54701 ?auto_54706 ) ( not ( = ?auto_54709 ?auto_54701 ) ) ( not ( = ?auto_54696 ?auto_54701 ) ) ( not ( = ?auto_54684 ?auto_54701 ) ) ( not ( = ?auto_54702 ?auto_54701 ) ) ( not ( = ?auto_54708 ?auto_54701 ) ) ( AVAILABLE ?auto_54701 ) ( SURFACE-AT ?auto_54704 ?auto_54706 ) ( ON ?auto_54704 ?auto_54688 ) ( CLEAR ?auto_54704 ) ( not ( = ?auto_54679 ?auto_54688 ) ) ( not ( = ?auto_54680 ?auto_54688 ) ) ( not ( = ?auto_54697 ?auto_54688 ) ) ( not ( = ?auto_54690 ?auto_54688 ) ) ( not ( = ?auto_54686 ?auto_54688 ) ) ( not ( = ?auto_54691 ?auto_54688 ) ) ( not ( = ?auto_54693 ?auto_54688 ) ) ( not ( = ?auto_54703 ?auto_54688 ) ) ( not ( = ?auto_54682 ?auto_54688 ) ) ( not ( = ?auto_54704 ?auto_54688 ) ) ( not ( = ?auto_54698 ?auto_54688 ) ) ( not ( = ?auto_54694 ?auto_54688 ) ) ( IS-CRATE ?auto_54694 ) ( not ( = ?auto_54679 ?auto_54683 ) ) ( not ( = ?auto_54680 ?auto_54683 ) ) ( not ( = ?auto_54697 ?auto_54683 ) ) ( not ( = ?auto_54690 ?auto_54683 ) ) ( not ( = ?auto_54686 ?auto_54683 ) ) ( not ( = ?auto_54691 ?auto_54683 ) ) ( not ( = ?auto_54693 ?auto_54683 ) ) ( not ( = ?auto_54703 ?auto_54683 ) ) ( not ( = ?auto_54682 ?auto_54683 ) ) ( not ( = ?auto_54704 ?auto_54683 ) ) ( not ( = ?auto_54698 ?auto_54683 ) ) ( not ( = ?auto_54694 ?auto_54683 ) ) ( not ( = ?auto_54688 ?auto_54683 ) ) ( not ( = ?auto_54699 ?auto_54685 ) ) ( not ( = ?auto_54705 ?auto_54699 ) ) ( not ( = ?auto_54681 ?auto_54699 ) ) ( not ( = ?auto_54695 ?auto_54699 ) ) ( not ( = ?auto_54689 ?auto_54699 ) ) ( not ( = ?auto_54706 ?auto_54699 ) ) ( HOIST-AT ?auto_54711 ?auto_54699 ) ( not ( = ?auto_54709 ?auto_54711 ) ) ( not ( = ?auto_54696 ?auto_54711 ) ) ( not ( = ?auto_54684 ?auto_54711 ) ) ( not ( = ?auto_54702 ?auto_54711 ) ) ( not ( = ?auto_54708 ?auto_54711 ) ) ( not ( = ?auto_54701 ?auto_54711 ) ) ( AVAILABLE ?auto_54711 ) ( SURFACE-AT ?auto_54694 ?auto_54699 ) ( ON ?auto_54694 ?auto_54687 ) ( CLEAR ?auto_54694 ) ( not ( = ?auto_54679 ?auto_54687 ) ) ( not ( = ?auto_54680 ?auto_54687 ) ) ( not ( = ?auto_54697 ?auto_54687 ) ) ( not ( = ?auto_54690 ?auto_54687 ) ) ( not ( = ?auto_54686 ?auto_54687 ) ) ( not ( = ?auto_54691 ?auto_54687 ) ) ( not ( = ?auto_54693 ?auto_54687 ) ) ( not ( = ?auto_54703 ?auto_54687 ) ) ( not ( = ?auto_54682 ?auto_54687 ) ) ( not ( = ?auto_54704 ?auto_54687 ) ) ( not ( = ?auto_54698 ?auto_54687 ) ) ( not ( = ?auto_54694 ?auto_54687 ) ) ( not ( = ?auto_54688 ?auto_54687 ) ) ( not ( = ?auto_54683 ?auto_54687 ) ) ( SURFACE-AT ?auto_54707 ?auto_54685 ) ( CLEAR ?auto_54707 ) ( IS-CRATE ?auto_54683 ) ( not ( = ?auto_54679 ?auto_54707 ) ) ( not ( = ?auto_54680 ?auto_54707 ) ) ( not ( = ?auto_54697 ?auto_54707 ) ) ( not ( = ?auto_54690 ?auto_54707 ) ) ( not ( = ?auto_54686 ?auto_54707 ) ) ( not ( = ?auto_54691 ?auto_54707 ) ) ( not ( = ?auto_54693 ?auto_54707 ) ) ( not ( = ?auto_54703 ?auto_54707 ) ) ( not ( = ?auto_54682 ?auto_54707 ) ) ( not ( = ?auto_54704 ?auto_54707 ) ) ( not ( = ?auto_54698 ?auto_54707 ) ) ( not ( = ?auto_54694 ?auto_54707 ) ) ( not ( = ?auto_54688 ?auto_54707 ) ) ( not ( = ?auto_54683 ?auto_54707 ) ) ( not ( = ?auto_54687 ?auto_54707 ) ) ( AVAILABLE ?auto_54709 ) ( not ( = ?auto_54710 ?auto_54685 ) ) ( not ( = ?auto_54705 ?auto_54710 ) ) ( not ( = ?auto_54681 ?auto_54710 ) ) ( not ( = ?auto_54695 ?auto_54710 ) ) ( not ( = ?auto_54689 ?auto_54710 ) ) ( not ( = ?auto_54706 ?auto_54710 ) ) ( not ( = ?auto_54699 ?auto_54710 ) ) ( HOIST-AT ?auto_54700 ?auto_54710 ) ( not ( = ?auto_54709 ?auto_54700 ) ) ( not ( = ?auto_54696 ?auto_54700 ) ) ( not ( = ?auto_54684 ?auto_54700 ) ) ( not ( = ?auto_54702 ?auto_54700 ) ) ( not ( = ?auto_54708 ?auto_54700 ) ) ( not ( = ?auto_54701 ?auto_54700 ) ) ( not ( = ?auto_54711 ?auto_54700 ) ) ( AVAILABLE ?auto_54700 ) ( SURFACE-AT ?auto_54683 ?auto_54710 ) ( ON ?auto_54683 ?auto_54712 ) ( CLEAR ?auto_54683 ) ( not ( = ?auto_54679 ?auto_54712 ) ) ( not ( = ?auto_54680 ?auto_54712 ) ) ( not ( = ?auto_54697 ?auto_54712 ) ) ( not ( = ?auto_54690 ?auto_54712 ) ) ( not ( = ?auto_54686 ?auto_54712 ) ) ( not ( = ?auto_54691 ?auto_54712 ) ) ( not ( = ?auto_54693 ?auto_54712 ) ) ( not ( = ?auto_54703 ?auto_54712 ) ) ( not ( = ?auto_54682 ?auto_54712 ) ) ( not ( = ?auto_54704 ?auto_54712 ) ) ( not ( = ?auto_54698 ?auto_54712 ) ) ( not ( = ?auto_54694 ?auto_54712 ) ) ( not ( = ?auto_54688 ?auto_54712 ) ) ( not ( = ?auto_54683 ?auto_54712 ) ) ( not ( = ?auto_54687 ?auto_54712 ) ) ( not ( = ?auto_54707 ?auto_54712 ) ) ( TRUCK-AT ?auto_54692 ?auto_54685 ) )
    :subtasks
    ( ( !DRIVE ?auto_54692 ?auto_54685 ?auto_54710 )
      ( MAKE-ON ?auto_54679 ?auto_54680 )
      ( MAKE-ON-VERIFY ?auto_54679 ?auto_54680 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54713 - SURFACE
      ?auto_54714 - SURFACE
    )
    :vars
    (
      ?auto_54745 - HOIST
      ?auto_54727 - PLACE
      ?auto_54741 - PLACE
      ?auto_54733 - HOIST
      ?auto_54730 - SURFACE
      ?auto_54724 - SURFACE
      ?auto_54726 - PLACE
      ?auto_54738 - HOIST
      ?auto_54723 - SURFACE
      ?auto_54737 - SURFACE
      ?auto_54734 - PLACE
      ?auto_54715 - HOIST
      ?auto_54735 - SURFACE
      ?auto_54720 - SURFACE
      ?auto_54729 - PLACE
      ?auto_54744 - HOIST
      ?auto_54725 - SURFACE
      ?auto_54721 - SURFACE
      ?auto_54731 - SURFACE
      ?auto_54718 - SURFACE
      ?auto_54742 - PLACE
      ?auto_54716 - HOIST
      ?auto_54722 - SURFACE
      ?auto_54739 - SURFACE
      ?auto_54732 - PLACE
      ?auto_54719 - HOIST
      ?auto_54728 - SURFACE
      ?auto_54743 - SURFACE
      ?auto_54746 - PLACE
      ?auto_54717 - HOIST
      ?auto_54740 - SURFACE
      ?auto_54736 - TRUCK
      ?auto_54747 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54745 ?auto_54727 ) ( IS-CRATE ?auto_54713 ) ( not ( = ?auto_54713 ?auto_54714 ) ) ( not ( = ?auto_54741 ?auto_54727 ) ) ( HOIST-AT ?auto_54733 ?auto_54741 ) ( not ( = ?auto_54745 ?auto_54733 ) ) ( AVAILABLE ?auto_54733 ) ( SURFACE-AT ?auto_54713 ?auto_54741 ) ( ON ?auto_54713 ?auto_54730 ) ( CLEAR ?auto_54713 ) ( not ( = ?auto_54713 ?auto_54730 ) ) ( not ( = ?auto_54714 ?auto_54730 ) ) ( IS-CRATE ?auto_54714 ) ( not ( = ?auto_54713 ?auto_54724 ) ) ( not ( = ?auto_54714 ?auto_54724 ) ) ( not ( = ?auto_54730 ?auto_54724 ) ) ( not ( = ?auto_54726 ?auto_54727 ) ) ( not ( = ?auto_54741 ?auto_54726 ) ) ( HOIST-AT ?auto_54738 ?auto_54726 ) ( not ( = ?auto_54745 ?auto_54738 ) ) ( not ( = ?auto_54733 ?auto_54738 ) ) ( SURFACE-AT ?auto_54714 ?auto_54726 ) ( ON ?auto_54714 ?auto_54723 ) ( CLEAR ?auto_54714 ) ( not ( = ?auto_54713 ?auto_54723 ) ) ( not ( = ?auto_54714 ?auto_54723 ) ) ( not ( = ?auto_54730 ?auto_54723 ) ) ( not ( = ?auto_54724 ?auto_54723 ) ) ( IS-CRATE ?auto_54724 ) ( not ( = ?auto_54713 ?auto_54737 ) ) ( not ( = ?auto_54714 ?auto_54737 ) ) ( not ( = ?auto_54730 ?auto_54737 ) ) ( not ( = ?auto_54724 ?auto_54737 ) ) ( not ( = ?auto_54723 ?auto_54737 ) ) ( not ( = ?auto_54734 ?auto_54727 ) ) ( not ( = ?auto_54741 ?auto_54734 ) ) ( not ( = ?auto_54726 ?auto_54734 ) ) ( HOIST-AT ?auto_54715 ?auto_54734 ) ( not ( = ?auto_54745 ?auto_54715 ) ) ( not ( = ?auto_54733 ?auto_54715 ) ) ( not ( = ?auto_54738 ?auto_54715 ) ) ( AVAILABLE ?auto_54715 ) ( SURFACE-AT ?auto_54724 ?auto_54734 ) ( ON ?auto_54724 ?auto_54735 ) ( CLEAR ?auto_54724 ) ( not ( = ?auto_54713 ?auto_54735 ) ) ( not ( = ?auto_54714 ?auto_54735 ) ) ( not ( = ?auto_54730 ?auto_54735 ) ) ( not ( = ?auto_54724 ?auto_54735 ) ) ( not ( = ?auto_54723 ?auto_54735 ) ) ( not ( = ?auto_54737 ?auto_54735 ) ) ( IS-CRATE ?auto_54737 ) ( not ( = ?auto_54713 ?auto_54720 ) ) ( not ( = ?auto_54714 ?auto_54720 ) ) ( not ( = ?auto_54730 ?auto_54720 ) ) ( not ( = ?auto_54724 ?auto_54720 ) ) ( not ( = ?auto_54723 ?auto_54720 ) ) ( not ( = ?auto_54737 ?auto_54720 ) ) ( not ( = ?auto_54735 ?auto_54720 ) ) ( not ( = ?auto_54729 ?auto_54727 ) ) ( not ( = ?auto_54741 ?auto_54729 ) ) ( not ( = ?auto_54726 ?auto_54729 ) ) ( not ( = ?auto_54734 ?auto_54729 ) ) ( HOIST-AT ?auto_54744 ?auto_54729 ) ( not ( = ?auto_54745 ?auto_54744 ) ) ( not ( = ?auto_54733 ?auto_54744 ) ) ( not ( = ?auto_54738 ?auto_54744 ) ) ( not ( = ?auto_54715 ?auto_54744 ) ) ( AVAILABLE ?auto_54744 ) ( SURFACE-AT ?auto_54737 ?auto_54729 ) ( ON ?auto_54737 ?auto_54725 ) ( CLEAR ?auto_54737 ) ( not ( = ?auto_54713 ?auto_54725 ) ) ( not ( = ?auto_54714 ?auto_54725 ) ) ( not ( = ?auto_54730 ?auto_54725 ) ) ( not ( = ?auto_54724 ?auto_54725 ) ) ( not ( = ?auto_54723 ?auto_54725 ) ) ( not ( = ?auto_54737 ?auto_54725 ) ) ( not ( = ?auto_54735 ?auto_54725 ) ) ( not ( = ?auto_54720 ?auto_54725 ) ) ( IS-CRATE ?auto_54720 ) ( not ( = ?auto_54713 ?auto_54721 ) ) ( not ( = ?auto_54714 ?auto_54721 ) ) ( not ( = ?auto_54730 ?auto_54721 ) ) ( not ( = ?auto_54724 ?auto_54721 ) ) ( not ( = ?auto_54723 ?auto_54721 ) ) ( not ( = ?auto_54737 ?auto_54721 ) ) ( not ( = ?auto_54735 ?auto_54721 ) ) ( not ( = ?auto_54720 ?auto_54721 ) ) ( not ( = ?auto_54725 ?auto_54721 ) ) ( AVAILABLE ?auto_54738 ) ( SURFACE-AT ?auto_54720 ?auto_54726 ) ( ON ?auto_54720 ?auto_54731 ) ( CLEAR ?auto_54720 ) ( not ( = ?auto_54713 ?auto_54731 ) ) ( not ( = ?auto_54714 ?auto_54731 ) ) ( not ( = ?auto_54730 ?auto_54731 ) ) ( not ( = ?auto_54724 ?auto_54731 ) ) ( not ( = ?auto_54723 ?auto_54731 ) ) ( not ( = ?auto_54737 ?auto_54731 ) ) ( not ( = ?auto_54735 ?auto_54731 ) ) ( not ( = ?auto_54720 ?auto_54731 ) ) ( not ( = ?auto_54725 ?auto_54731 ) ) ( not ( = ?auto_54721 ?auto_54731 ) ) ( IS-CRATE ?auto_54721 ) ( not ( = ?auto_54713 ?auto_54718 ) ) ( not ( = ?auto_54714 ?auto_54718 ) ) ( not ( = ?auto_54730 ?auto_54718 ) ) ( not ( = ?auto_54724 ?auto_54718 ) ) ( not ( = ?auto_54723 ?auto_54718 ) ) ( not ( = ?auto_54737 ?auto_54718 ) ) ( not ( = ?auto_54735 ?auto_54718 ) ) ( not ( = ?auto_54720 ?auto_54718 ) ) ( not ( = ?auto_54725 ?auto_54718 ) ) ( not ( = ?auto_54721 ?auto_54718 ) ) ( not ( = ?auto_54731 ?auto_54718 ) ) ( not ( = ?auto_54742 ?auto_54727 ) ) ( not ( = ?auto_54741 ?auto_54742 ) ) ( not ( = ?auto_54726 ?auto_54742 ) ) ( not ( = ?auto_54734 ?auto_54742 ) ) ( not ( = ?auto_54729 ?auto_54742 ) ) ( HOIST-AT ?auto_54716 ?auto_54742 ) ( not ( = ?auto_54745 ?auto_54716 ) ) ( not ( = ?auto_54733 ?auto_54716 ) ) ( not ( = ?auto_54738 ?auto_54716 ) ) ( not ( = ?auto_54715 ?auto_54716 ) ) ( not ( = ?auto_54744 ?auto_54716 ) ) ( AVAILABLE ?auto_54716 ) ( SURFACE-AT ?auto_54721 ?auto_54742 ) ( ON ?auto_54721 ?auto_54722 ) ( CLEAR ?auto_54721 ) ( not ( = ?auto_54713 ?auto_54722 ) ) ( not ( = ?auto_54714 ?auto_54722 ) ) ( not ( = ?auto_54730 ?auto_54722 ) ) ( not ( = ?auto_54724 ?auto_54722 ) ) ( not ( = ?auto_54723 ?auto_54722 ) ) ( not ( = ?auto_54737 ?auto_54722 ) ) ( not ( = ?auto_54735 ?auto_54722 ) ) ( not ( = ?auto_54720 ?auto_54722 ) ) ( not ( = ?auto_54725 ?auto_54722 ) ) ( not ( = ?auto_54721 ?auto_54722 ) ) ( not ( = ?auto_54731 ?auto_54722 ) ) ( not ( = ?auto_54718 ?auto_54722 ) ) ( IS-CRATE ?auto_54718 ) ( not ( = ?auto_54713 ?auto_54739 ) ) ( not ( = ?auto_54714 ?auto_54739 ) ) ( not ( = ?auto_54730 ?auto_54739 ) ) ( not ( = ?auto_54724 ?auto_54739 ) ) ( not ( = ?auto_54723 ?auto_54739 ) ) ( not ( = ?auto_54737 ?auto_54739 ) ) ( not ( = ?auto_54735 ?auto_54739 ) ) ( not ( = ?auto_54720 ?auto_54739 ) ) ( not ( = ?auto_54725 ?auto_54739 ) ) ( not ( = ?auto_54721 ?auto_54739 ) ) ( not ( = ?auto_54731 ?auto_54739 ) ) ( not ( = ?auto_54718 ?auto_54739 ) ) ( not ( = ?auto_54722 ?auto_54739 ) ) ( not ( = ?auto_54732 ?auto_54727 ) ) ( not ( = ?auto_54741 ?auto_54732 ) ) ( not ( = ?auto_54726 ?auto_54732 ) ) ( not ( = ?auto_54734 ?auto_54732 ) ) ( not ( = ?auto_54729 ?auto_54732 ) ) ( not ( = ?auto_54742 ?auto_54732 ) ) ( HOIST-AT ?auto_54719 ?auto_54732 ) ( not ( = ?auto_54745 ?auto_54719 ) ) ( not ( = ?auto_54733 ?auto_54719 ) ) ( not ( = ?auto_54738 ?auto_54719 ) ) ( not ( = ?auto_54715 ?auto_54719 ) ) ( not ( = ?auto_54744 ?auto_54719 ) ) ( not ( = ?auto_54716 ?auto_54719 ) ) ( AVAILABLE ?auto_54719 ) ( SURFACE-AT ?auto_54718 ?auto_54732 ) ( ON ?auto_54718 ?auto_54728 ) ( CLEAR ?auto_54718 ) ( not ( = ?auto_54713 ?auto_54728 ) ) ( not ( = ?auto_54714 ?auto_54728 ) ) ( not ( = ?auto_54730 ?auto_54728 ) ) ( not ( = ?auto_54724 ?auto_54728 ) ) ( not ( = ?auto_54723 ?auto_54728 ) ) ( not ( = ?auto_54737 ?auto_54728 ) ) ( not ( = ?auto_54735 ?auto_54728 ) ) ( not ( = ?auto_54720 ?auto_54728 ) ) ( not ( = ?auto_54725 ?auto_54728 ) ) ( not ( = ?auto_54721 ?auto_54728 ) ) ( not ( = ?auto_54731 ?auto_54728 ) ) ( not ( = ?auto_54718 ?auto_54728 ) ) ( not ( = ?auto_54722 ?auto_54728 ) ) ( not ( = ?auto_54739 ?auto_54728 ) ) ( IS-CRATE ?auto_54739 ) ( not ( = ?auto_54713 ?auto_54743 ) ) ( not ( = ?auto_54714 ?auto_54743 ) ) ( not ( = ?auto_54730 ?auto_54743 ) ) ( not ( = ?auto_54724 ?auto_54743 ) ) ( not ( = ?auto_54723 ?auto_54743 ) ) ( not ( = ?auto_54737 ?auto_54743 ) ) ( not ( = ?auto_54735 ?auto_54743 ) ) ( not ( = ?auto_54720 ?auto_54743 ) ) ( not ( = ?auto_54725 ?auto_54743 ) ) ( not ( = ?auto_54721 ?auto_54743 ) ) ( not ( = ?auto_54731 ?auto_54743 ) ) ( not ( = ?auto_54718 ?auto_54743 ) ) ( not ( = ?auto_54722 ?auto_54743 ) ) ( not ( = ?auto_54739 ?auto_54743 ) ) ( not ( = ?auto_54728 ?auto_54743 ) ) ( not ( = ?auto_54746 ?auto_54727 ) ) ( not ( = ?auto_54741 ?auto_54746 ) ) ( not ( = ?auto_54726 ?auto_54746 ) ) ( not ( = ?auto_54734 ?auto_54746 ) ) ( not ( = ?auto_54729 ?auto_54746 ) ) ( not ( = ?auto_54742 ?auto_54746 ) ) ( not ( = ?auto_54732 ?auto_54746 ) ) ( HOIST-AT ?auto_54717 ?auto_54746 ) ( not ( = ?auto_54745 ?auto_54717 ) ) ( not ( = ?auto_54733 ?auto_54717 ) ) ( not ( = ?auto_54738 ?auto_54717 ) ) ( not ( = ?auto_54715 ?auto_54717 ) ) ( not ( = ?auto_54744 ?auto_54717 ) ) ( not ( = ?auto_54716 ?auto_54717 ) ) ( not ( = ?auto_54719 ?auto_54717 ) ) ( AVAILABLE ?auto_54717 ) ( SURFACE-AT ?auto_54739 ?auto_54746 ) ( ON ?auto_54739 ?auto_54740 ) ( CLEAR ?auto_54739 ) ( not ( = ?auto_54713 ?auto_54740 ) ) ( not ( = ?auto_54714 ?auto_54740 ) ) ( not ( = ?auto_54730 ?auto_54740 ) ) ( not ( = ?auto_54724 ?auto_54740 ) ) ( not ( = ?auto_54723 ?auto_54740 ) ) ( not ( = ?auto_54737 ?auto_54740 ) ) ( not ( = ?auto_54735 ?auto_54740 ) ) ( not ( = ?auto_54720 ?auto_54740 ) ) ( not ( = ?auto_54725 ?auto_54740 ) ) ( not ( = ?auto_54721 ?auto_54740 ) ) ( not ( = ?auto_54731 ?auto_54740 ) ) ( not ( = ?auto_54718 ?auto_54740 ) ) ( not ( = ?auto_54722 ?auto_54740 ) ) ( not ( = ?auto_54739 ?auto_54740 ) ) ( not ( = ?auto_54728 ?auto_54740 ) ) ( not ( = ?auto_54743 ?auto_54740 ) ) ( TRUCK-AT ?auto_54736 ?auto_54727 ) ( SURFACE-AT ?auto_54747 ?auto_54727 ) ( CLEAR ?auto_54747 ) ( LIFTING ?auto_54745 ?auto_54743 ) ( IS-CRATE ?auto_54743 ) ( not ( = ?auto_54713 ?auto_54747 ) ) ( not ( = ?auto_54714 ?auto_54747 ) ) ( not ( = ?auto_54730 ?auto_54747 ) ) ( not ( = ?auto_54724 ?auto_54747 ) ) ( not ( = ?auto_54723 ?auto_54747 ) ) ( not ( = ?auto_54737 ?auto_54747 ) ) ( not ( = ?auto_54735 ?auto_54747 ) ) ( not ( = ?auto_54720 ?auto_54747 ) ) ( not ( = ?auto_54725 ?auto_54747 ) ) ( not ( = ?auto_54721 ?auto_54747 ) ) ( not ( = ?auto_54731 ?auto_54747 ) ) ( not ( = ?auto_54718 ?auto_54747 ) ) ( not ( = ?auto_54722 ?auto_54747 ) ) ( not ( = ?auto_54739 ?auto_54747 ) ) ( not ( = ?auto_54728 ?auto_54747 ) ) ( not ( = ?auto_54743 ?auto_54747 ) ) ( not ( = ?auto_54740 ?auto_54747 ) ) )
    :subtasks
    ( ( !DROP ?auto_54745 ?auto_54743 ?auto_54747 ?auto_54727 )
      ( MAKE-ON ?auto_54713 ?auto_54714 )
      ( MAKE-ON-VERIFY ?auto_54713 ?auto_54714 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54748 - SURFACE
      ?auto_54749 - SURFACE
    )
    :vars
    (
      ?auto_54776 - HOIST
      ?auto_54771 - PLACE
      ?auto_54750 - PLACE
      ?auto_54763 - HOIST
      ?auto_54768 - SURFACE
      ?auto_54760 - SURFACE
      ?auto_54759 - PLACE
      ?auto_54777 - HOIST
      ?auto_54780 - SURFACE
      ?auto_54767 - SURFACE
      ?auto_54764 - PLACE
      ?auto_54781 - HOIST
      ?auto_54765 - SURFACE
      ?auto_54756 - SURFACE
      ?auto_54772 - PLACE
      ?auto_54775 - HOIST
      ?auto_54757 - SURFACE
      ?auto_54769 - SURFACE
      ?auto_54778 - SURFACE
      ?auto_54755 - SURFACE
      ?auto_54754 - PLACE
      ?auto_54758 - HOIST
      ?auto_54773 - SURFACE
      ?auto_54752 - SURFACE
      ?auto_54779 - PLACE
      ?auto_54770 - HOIST
      ?auto_54762 - SURFACE
      ?auto_54774 - SURFACE
      ?auto_54753 - PLACE
      ?auto_54761 - HOIST
      ?auto_54751 - SURFACE
      ?auto_54766 - TRUCK
      ?auto_54782 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54776 ?auto_54771 ) ( IS-CRATE ?auto_54748 ) ( not ( = ?auto_54748 ?auto_54749 ) ) ( not ( = ?auto_54750 ?auto_54771 ) ) ( HOIST-AT ?auto_54763 ?auto_54750 ) ( not ( = ?auto_54776 ?auto_54763 ) ) ( AVAILABLE ?auto_54763 ) ( SURFACE-AT ?auto_54748 ?auto_54750 ) ( ON ?auto_54748 ?auto_54768 ) ( CLEAR ?auto_54748 ) ( not ( = ?auto_54748 ?auto_54768 ) ) ( not ( = ?auto_54749 ?auto_54768 ) ) ( IS-CRATE ?auto_54749 ) ( not ( = ?auto_54748 ?auto_54760 ) ) ( not ( = ?auto_54749 ?auto_54760 ) ) ( not ( = ?auto_54768 ?auto_54760 ) ) ( not ( = ?auto_54759 ?auto_54771 ) ) ( not ( = ?auto_54750 ?auto_54759 ) ) ( HOIST-AT ?auto_54777 ?auto_54759 ) ( not ( = ?auto_54776 ?auto_54777 ) ) ( not ( = ?auto_54763 ?auto_54777 ) ) ( SURFACE-AT ?auto_54749 ?auto_54759 ) ( ON ?auto_54749 ?auto_54780 ) ( CLEAR ?auto_54749 ) ( not ( = ?auto_54748 ?auto_54780 ) ) ( not ( = ?auto_54749 ?auto_54780 ) ) ( not ( = ?auto_54768 ?auto_54780 ) ) ( not ( = ?auto_54760 ?auto_54780 ) ) ( IS-CRATE ?auto_54760 ) ( not ( = ?auto_54748 ?auto_54767 ) ) ( not ( = ?auto_54749 ?auto_54767 ) ) ( not ( = ?auto_54768 ?auto_54767 ) ) ( not ( = ?auto_54760 ?auto_54767 ) ) ( not ( = ?auto_54780 ?auto_54767 ) ) ( not ( = ?auto_54764 ?auto_54771 ) ) ( not ( = ?auto_54750 ?auto_54764 ) ) ( not ( = ?auto_54759 ?auto_54764 ) ) ( HOIST-AT ?auto_54781 ?auto_54764 ) ( not ( = ?auto_54776 ?auto_54781 ) ) ( not ( = ?auto_54763 ?auto_54781 ) ) ( not ( = ?auto_54777 ?auto_54781 ) ) ( AVAILABLE ?auto_54781 ) ( SURFACE-AT ?auto_54760 ?auto_54764 ) ( ON ?auto_54760 ?auto_54765 ) ( CLEAR ?auto_54760 ) ( not ( = ?auto_54748 ?auto_54765 ) ) ( not ( = ?auto_54749 ?auto_54765 ) ) ( not ( = ?auto_54768 ?auto_54765 ) ) ( not ( = ?auto_54760 ?auto_54765 ) ) ( not ( = ?auto_54780 ?auto_54765 ) ) ( not ( = ?auto_54767 ?auto_54765 ) ) ( IS-CRATE ?auto_54767 ) ( not ( = ?auto_54748 ?auto_54756 ) ) ( not ( = ?auto_54749 ?auto_54756 ) ) ( not ( = ?auto_54768 ?auto_54756 ) ) ( not ( = ?auto_54760 ?auto_54756 ) ) ( not ( = ?auto_54780 ?auto_54756 ) ) ( not ( = ?auto_54767 ?auto_54756 ) ) ( not ( = ?auto_54765 ?auto_54756 ) ) ( not ( = ?auto_54772 ?auto_54771 ) ) ( not ( = ?auto_54750 ?auto_54772 ) ) ( not ( = ?auto_54759 ?auto_54772 ) ) ( not ( = ?auto_54764 ?auto_54772 ) ) ( HOIST-AT ?auto_54775 ?auto_54772 ) ( not ( = ?auto_54776 ?auto_54775 ) ) ( not ( = ?auto_54763 ?auto_54775 ) ) ( not ( = ?auto_54777 ?auto_54775 ) ) ( not ( = ?auto_54781 ?auto_54775 ) ) ( AVAILABLE ?auto_54775 ) ( SURFACE-AT ?auto_54767 ?auto_54772 ) ( ON ?auto_54767 ?auto_54757 ) ( CLEAR ?auto_54767 ) ( not ( = ?auto_54748 ?auto_54757 ) ) ( not ( = ?auto_54749 ?auto_54757 ) ) ( not ( = ?auto_54768 ?auto_54757 ) ) ( not ( = ?auto_54760 ?auto_54757 ) ) ( not ( = ?auto_54780 ?auto_54757 ) ) ( not ( = ?auto_54767 ?auto_54757 ) ) ( not ( = ?auto_54765 ?auto_54757 ) ) ( not ( = ?auto_54756 ?auto_54757 ) ) ( IS-CRATE ?auto_54756 ) ( not ( = ?auto_54748 ?auto_54769 ) ) ( not ( = ?auto_54749 ?auto_54769 ) ) ( not ( = ?auto_54768 ?auto_54769 ) ) ( not ( = ?auto_54760 ?auto_54769 ) ) ( not ( = ?auto_54780 ?auto_54769 ) ) ( not ( = ?auto_54767 ?auto_54769 ) ) ( not ( = ?auto_54765 ?auto_54769 ) ) ( not ( = ?auto_54756 ?auto_54769 ) ) ( not ( = ?auto_54757 ?auto_54769 ) ) ( AVAILABLE ?auto_54777 ) ( SURFACE-AT ?auto_54756 ?auto_54759 ) ( ON ?auto_54756 ?auto_54778 ) ( CLEAR ?auto_54756 ) ( not ( = ?auto_54748 ?auto_54778 ) ) ( not ( = ?auto_54749 ?auto_54778 ) ) ( not ( = ?auto_54768 ?auto_54778 ) ) ( not ( = ?auto_54760 ?auto_54778 ) ) ( not ( = ?auto_54780 ?auto_54778 ) ) ( not ( = ?auto_54767 ?auto_54778 ) ) ( not ( = ?auto_54765 ?auto_54778 ) ) ( not ( = ?auto_54756 ?auto_54778 ) ) ( not ( = ?auto_54757 ?auto_54778 ) ) ( not ( = ?auto_54769 ?auto_54778 ) ) ( IS-CRATE ?auto_54769 ) ( not ( = ?auto_54748 ?auto_54755 ) ) ( not ( = ?auto_54749 ?auto_54755 ) ) ( not ( = ?auto_54768 ?auto_54755 ) ) ( not ( = ?auto_54760 ?auto_54755 ) ) ( not ( = ?auto_54780 ?auto_54755 ) ) ( not ( = ?auto_54767 ?auto_54755 ) ) ( not ( = ?auto_54765 ?auto_54755 ) ) ( not ( = ?auto_54756 ?auto_54755 ) ) ( not ( = ?auto_54757 ?auto_54755 ) ) ( not ( = ?auto_54769 ?auto_54755 ) ) ( not ( = ?auto_54778 ?auto_54755 ) ) ( not ( = ?auto_54754 ?auto_54771 ) ) ( not ( = ?auto_54750 ?auto_54754 ) ) ( not ( = ?auto_54759 ?auto_54754 ) ) ( not ( = ?auto_54764 ?auto_54754 ) ) ( not ( = ?auto_54772 ?auto_54754 ) ) ( HOIST-AT ?auto_54758 ?auto_54754 ) ( not ( = ?auto_54776 ?auto_54758 ) ) ( not ( = ?auto_54763 ?auto_54758 ) ) ( not ( = ?auto_54777 ?auto_54758 ) ) ( not ( = ?auto_54781 ?auto_54758 ) ) ( not ( = ?auto_54775 ?auto_54758 ) ) ( AVAILABLE ?auto_54758 ) ( SURFACE-AT ?auto_54769 ?auto_54754 ) ( ON ?auto_54769 ?auto_54773 ) ( CLEAR ?auto_54769 ) ( not ( = ?auto_54748 ?auto_54773 ) ) ( not ( = ?auto_54749 ?auto_54773 ) ) ( not ( = ?auto_54768 ?auto_54773 ) ) ( not ( = ?auto_54760 ?auto_54773 ) ) ( not ( = ?auto_54780 ?auto_54773 ) ) ( not ( = ?auto_54767 ?auto_54773 ) ) ( not ( = ?auto_54765 ?auto_54773 ) ) ( not ( = ?auto_54756 ?auto_54773 ) ) ( not ( = ?auto_54757 ?auto_54773 ) ) ( not ( = ?auto_54769 ?auto_54773 ) ) ( not ( = ?auto_54778 ?auto_54773 ) ) ( not ( = ?auto_54755 ?auto_54773 ) ) ( IS-CRATE ?auto_54755 ) ( not ( = ?auto_54748 ?auto_54752 ) ) ( not ( = ?auto_54749 ?auto_54752 ) ) ( not ( = ?auto_54768 ?auto_54752 ) ) ( not ( = ?auto_54760 ?auto_54752 ) ) ( not ( = ?auto_54780 ?auto_54752 ) ) ( not ( = ?auto_54767 ?auto_54752 ) ) ( not ( = ?auto_54765 ?auto_54752 ) ) ( not ( = ?auto_54756 ?auto_54752 ) ) ( not ( = ?auto_54757 ?auto_54752 ) ) ( not ( = ?auto_54769 ?auto_54752 ) ) ( not ( = ?auto_54778 ?auto_54752 ) ) ( not ( = ?auto_54755 ?auto_54752 ) ) ( not ( = ?auto_54773 ?auto_54752 ) ) ( not ( = ?auto_54779 ?auto_54771 ) ) ( not ( = ?auto_54750 ?auto_54779 ) ) ( not ( = ?auto_54759 ?auto_54779 ) ) ( not ( = ?auto_54764 ?auto_54779 ) ) ( not ( = ?auto_54772 ?auto_54779 ) ) ( not ( = ?auto_54754 ?auto_54779 ) ) ( HOIST-AT ?auto_54770 ?auto_54779 ) ( not ( = ?auto_54776 ?auto_54770 ) ) ( not ( = ?auto_54763 ?auto_54770 ) ) ( not ( = ?auto_54777 ?auto_54770 ) ) ( not ( = ?auto_54781 ?auto_54770 ) ) ( not ( = ?auto_54775 ?auto_54770 ) ) ( not ( = ?auto_54758 ?auto_54770 ) ) ( AVAILABLE ?auto_54770 ) ( SURFACE-AT ?auto_54755 ?auto_54779 ) ( ON ?auto_54755 ?auto_54762 ) ( CLEAR ?auto_54755 ) ( not ( = ?auto_54748 ?auto_54762 ) ) ( not ( = ?auto_54749 ?auto_54762 ) ) ( not ( = ?auto_54768 ?auto_54762 ) ) ( not ( = ?auto_54760 ?auto_54762 ) ) ( not ( = ?auto_54780 ?auto_54762 ) ) ( not ( = ?auto_54767 ?auto_54762 ) ) ( not ( = ?auto_54765 ?auto_54762 ) ) ( not ( = ?auto_54756 ?auto_54762 ) ) ( not ( = ?auto_54757 ?auto_54762 ) ) ( not ( = ?auto_54769 ?auto_54762 ) ) ( not ( = ?auto_54778 ?auto_54762 ) ) ( not ( = ?auto_54755 ?auto_54762 ) ) ( not ( = ?auto_54773 ?auto_54762 ) ) ( not ( = ?auto_54752 ?auto_54762 ) ) ( IS-CRATE ?auto_54752 ) ( not ( = ?auto_54748 ?auto_54774 ) ) ( not ( = ?auto_54749 ?auto_54774 ) ) ( not ( = ?auto_54768 ?auto_54774 ) ) ( not ( = ?auto_54760 ?auto_54774 ) ) ( not ( = ?auto_54780 ?auto_54774 ) ) ( not ( = ?auto_54767 ?auto_54774 ) ) ( not ( = ?auto_54765 ?auto_54774 ) ) ( not ( = ?auto_54756 ?auto_54774 ) ) ( not ( = ?auto_54757 ?auto_54774 ) ) ( not ( = ?auto_54769 ?auto_54774 ) ) ( not ( = ?auto_54778 ?auto_54774 ) ) ( not ( = ?auto_54755 ?auto_54774 ) ) ( not ( = ?auto_54773 ?auto_54774 ) ) ( not ( = ?auto_54752 ?auto_54774 ) ) ( not ( = ?auto_54762 ?auto_54774 ) ) ( not ( = ?auto_54753 ?auto_54771 ) ) ( not ( = ?auto_54750 ?auto_54753 ) ) ( not ( = ?auto_54759 ?auto_54753 ) ) ( not ( = ?auto_54764 ?auto_54753 ) ) ( not ( = ?auto_54772 ?auto_54753 ) ) ( not ( = ?auto_54754 ?auto_54753 ) ) ( not ( = ?auto_54779 ?auto_54753 ) ) ( HOIST-AT ?auto_54761 ?auto_54753 ) ( not ( = ?auto_54776 ?auto_54761 ) ) ( not ( = ?auto_54763 ?auto_54761 ) ) ( not ( = ?auto_54777 ?auto_54761 ) ) ( not ( = ?auto_54781 ?auto_54761 ) ) ( not ( = ?auto_54775 ?auto_54761 ) ) ( not ( = ?auto_54758 ?auto_54761 ) ) ( not ( = ?auto_54770 ?auto_54761 ) ) ( AVAILABLE ?auto_54761 ) ( SURFACE-AT ?auto_54752 ?auto_54753 ) ( ON ?auto_54752 ?auto_54751 ) ( CLEAR ?auto_54752 ) ( not ( = ?auto_54748 ?auto_54751 ) ) ( not ( = ?auto_54749 ?auto_54751 ) ) ( not ( = ?auto_54768 ?auto_54751 ) ) ( not ( = ?auto_54760 ?auto_54751 ) ) ( not ( = ?auto_54780 ?auto_54751 ) ) ( not ( = ?auto_54767 ?auto_54751 ) ) ( not ( = ?auto_54765 ?auto_54751 ) ) ( not ( = ?auto_54756 ?auto_54751 ) ) ( not ( = ?auto_54757 ?auto_54751 ) ) ( not ( = ?auto_54769 ?auto_54751 ) ) ( not ( = ?auto_54778 ?auto_54751 ) ) ( not ( = ?auto_54755 ?auto_54751 ) ) ( not ( = ?auto_54773 ?auto_54751 ) ) ( not ( = ?auto_54752 ?auto_54751 ) ) ( not ( = ?auto_54762 ?auto_54751 ) ) ( not ( = ?auto_54774 ?auto_54751 ) ) ( TRUCK-AT ?auto_54766 ?auto_54771 ) ( SURFACE-AT ?auto_54782 ?auto_54771 ) ( CLEAR ?auto_54782 ) ( IS-CRATE ?auto_54774 ) ( not ( = ?auto_54748 ?auto_54782 ) ) ( not ( = ?auto_54749 ?auto_54782 ) ) ( not ( = ?auto_54768 ?auto_54782 ) ) ( not ( = ?auto_54760 ?auto_54782 ) ) ( not ( = ?auto_54780 ?auto_54782 ) ) ( not ( = ?auto_54767 ?auto_54782 ) ) ( not ( = ?auto_54765 ?auto_54782 ) ) ( not ( = ?auto_54756 ?auto_54782 ) ) ( not ( = ?auto_54757 ?auto_54782 ) ) ( not ( = ?auto_54769 ?auto_54782 ) ) ( not ( = ?auto_54778 ?auto_54782 ) ) ( not ( = ?auto_54755 ?auto_54782 ) ) ( not ( = ?auto_54773 ?auto_54782 ) ) ( not ( = ?auto_54752 ?auto_54782 ) ) ( not ( = ?auto_54762 ?auto_54782 ) ) ( not ( = ?auto_54774 ?auto_54782 ) ) ( not ( = ?auto_54751 ?auto_54782 ) ) ( AVAILABLE ?auto_54776 ) ( IN ?auto_54774 ?auto_54766 ) )
    :subtasks
    ( ( !UNLOAD ?auto_54776 ?auto_54774 ?auto_54766 ?auto_54771 )
      ( MAKE-ON ?auto_54748 ?auto_54749 )
      ( MAKE-ON-VERIFY ?auto_54748 ?auto_54749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54783 - SURFACE
      ?auto_54784 - SURFACE
    )
    :vars
    (
      ?auto_54799 - HOIST
      ?auto_54810 - PLACE
      ?auto_54816 - PLACE
      ?auto_54815 - HOIST
      ?auto_54807 - SURFACE
      ?auto_54795 - SURFACE
      ?auto_54793 - PLACE
      ?auto_54800 - HOIST
      ?auto_54803 - SURFACE
      ?auto_54806 - SURFACE
      ?auto_54817 - PLACE
      ?auto_54796 - HOIST
      ?auto_54812 - SURFACE
      ?auto_54790 - SURFACE
      ?auto_54811 - PLACE
      ?auto_54798 - HOIST
      ?auto_54813 - SURFACE
      ?auto_54808 - SURFACE
      ?auto_54801 - SURFACE
      ?auto_54785 - SURFACE
      ?auto_54794 - PLACE
      ?auto_54814 - HOIST
      ?auto_54804 - SURFACE
      ?auto_54788 - SURFACE
      ?auto_54802 - PLACE
      ?auto_54809 - HOIST
      ?auto_54787 - SURFACE
      ?auto_54797 - SURFACE
      ?auto_54786 - PLACE
      ?auto_54789 - HOIST
      ?auto_54791 - SURFACE
      ?auto_54792 - SURFACE
      ?auto_54805 - TRUCK
      ?auto_54818 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54799 ?auto_54810 ) ( IS-CRATE ?auto_54783 ) ( not ( = ?auto_54783 ?auto_54784 ) ) ( not ( = ?auto_54816 ?auto_54810 ) ) ( HOIST-AT ?auto_54815 ?auto_54816 ) ( not ( = ?auto_54799 ?auto_54815 ) ) ( AVAILABLE ?auto_54815 ) ( SURFACE-AT ?auto_54783 ?auto_54816 ) ( ON ?auto_54783 ?auto_54807 ) ( CLEAR ?auto_54783 ) ( not ( = ?auto_54783 ?auto_54807 ) ) ( not ( = ?auto_54784 ?auto_54807 ) ) ( IS-CRATE ?auto_54784 ) ( not ( = ?auto_54783 ?auto_54795 ) ) ( not ( = ?auto_54784 ?auto_54795 ) ) ( not ( = ?auto_54807 ?auto_54795 ) ) ( not ( = ?auto_54793 ?auto_54810 ) ) ( not ( = ?auto_54816 ?auto_54793 ) ) ( HOIST-AT ?auto_54800 ?auto_54793 ) ( not ( = ?auto_54799 ?auto_54800 ) ) ( not ( = ?auto_54815 ?auto_54800 ) ) ( SURFACE-AT ?auto_54784 ?auto_54793 ) ( ON ?auto_54784 ?auto_54803 ) ( CLEAR ?auto_54784 ) ( not ( = ?auto_54783 ?auto_54803 ) ) ( not ( = ?auto_54784 ?auto_54803 ) ) ( not ( = ?auto_54807 ?auto_54803 ) ) ( not ( = ?auto_54795 ?auto_54803 ) ) ( IS-CRATE ?auto_54795 ) ( not ( = ?auto_54783 ?auto_54806 ) ) ( not ( = ?auto_54784 ?auto_54806 ) ) ( not ( = ?auto_54807 ?auto_54806 ) ) ( not ( = ?auto_54795 ?auto_54806 ) ) ( not ( = ?auto_54803 ?auto_54806 ) ) ( not ( = ?auto_54817 ?auto_54810 ) ) ( not ( = ?auto_54816 ?auto_54817 ) ) ( not ( = ?auto_54793 ?auto_54817 ) ) ( HOIST-AT ?auto_54796 ?auto_54817 ) ( not ( = ?auto_54799 ?auto_54796 ) ) ( not ( = ?auto_54815 ?auto_54796 ) ) ( not ( = ?auto_54800 ?auto_54796 ) ) ( AVAILABLE ?auto_54796 ) ( SURFACE-AT ?auto_54795 ?auto_54817 ) ( ON ?auto_54795 ?auto_54812 ) ( CLEAR ?auto_54795 ) ( not ( = ?auto_54783 ?auto_54812 ) ) ( not ( = ?auto_54784 ?auto_54812 ) ) ( not ( = ?auto_54807 ?auto_54812 ) ) ( not ( = ?auto_54795 ?auto_54812 ) ) ( not ( = ?auto_54803 ?auto_54812 ) ) ( not ( = ?auto_54806 ?auto_54812 ) ) ( IS-CRATE ?auto_54806 ) ( not ( = ?auto_54783 ?auto_54790 ) ) ( not ( = ?auto_54784 ?auto_54790 ) ) ( not ( = ?auto_54807 ?auto_54790 ) ) ( not ( = ?auto_54795 ?auto_54790 ) ) ( not ( = ?auto_54803 ?auto_54790 ) ) ( not ( = ?auto_54806 ?auto_54790 ) ) ( not ( = ?auto_54812 ?auto_54790 ) ) ( not ( = ?auto_54811 ?auto_54810 ) ) ( not ( = ?auto_54816 ?auto_54811 ) ) ( not ( = ?auto_54793 ?auto_54811 ) ) ( not ( = ?auto_54817 ?auto_54811 ) ) ( HOIST-AT ?auto_54798 ?auto_54811 ) ( not ( = ?auto_54799 ?auto_54798 ) ) ( not ( = ?auto_54815 ?auto_54798 ) ) ( not ( = ?auto_54800 ?auto_54798 ) ) ( not ( = ?auto_54796 ?auto_54798 ) ) ( AVAILABLE ?auto_54798 ) ( SURFACE-AT ?auto_54806 ?auto_54811 ) ( ON ?auto_54806 ?auto_54813 ) ( CLEAR ?auto_54806 ) ( not ( = ?auto_54783 ?auto_54813 ) ) ( not ( = ?auto_54784 ?auto_54813 ) ) ( not ( = ?auto_54807 ?auto_54813 ) ) ( not ( = ?auto_54795 ?auto_54813 ) ) ( not ( = ?auto_54803 ?auto_54813 ) ) ( not ( = ?auto_54806 ?auto_54813 ) ) ( not ( = ?auto_54812 ?auto_54813 ) ) ( not ( = ?auto_54790 ?auto_54813 ) ) ( IS-CRATE ?auto_54790 ) ( not ( = ?auto_54783 ?auto_54808 ) ) ( not ( = ?auto_54784 ?auto_54808 ) ) ( not ( = ?auto_54807 ?auto_54808 ) ) ( not ( = ?auto_54795 ?auto_54808 ) ) ( not ( = ?auto_54803 ?auto_54808 ) ) ( not ( = ?auto_54806 ?auto_54808 ) ) ( not ( = ?auto_54812 ?auto_54808 ) ) ( not ( = ?auto_54790 ?auto_54808 ) ) ( not ( = ?auto_54813 ?auto_54808 ) ) ( AVAILABLE ?auto_54800 ) ( SURFACE-AT ?auto_54790 ?auto_54793 ) ( ON ?auto_54790 ?auto_54801 ) ( CLEAR ?auto_54790 ) ( not ( = ?auto_54783 ?auto_54801 ) ) ( not ( = ?auto_54784 ?auto_54801 ) ) ( not ( = ?auto_54807 ?auto_54801 ) ) ( not ( = ?auto_54795 ?auto_54801 ) ) ( not ( = ?auto_54803 ?auto_54801 ) ) ( not ( = ?auto_54806 ?auto_54801 ) ) ( not ( = ?auto_54812 ?auto_54801 ) ) ( not ( = ?auto_54790 ?auto_54801 ) ) ( not ( = ?auto_54813 ?auto_54801 ) ) ( not ( = ?auto_54808 ?auto_54801 ) ) ( IS-CRATE ?auto_54808 ) ( not ( = ?auto_54783 ?auto_54785 ) ) ( not ( = ?auto_54784 ?auto_54785 ) ) ( not ( = ?auto_54807 ?auto_54785 ) ) ( not ( = ?auto_54795 ?auto_54785 ) ) ( not ( = ?auto_54803 ?auto_54785 ) ) ( not ( = ?auto_54806 ?auto_54785 ) ) ( not ( = ?auto_54812 ?auto_54785 ) ) ( not ( = ?auto_54790 ?auto_54785 ) ) ( not ( = ?auto_54813 ?auto_54785 ) ) ( not ( = ?auto_54808 ?auto_54785 ) ) ( not ( = ?auto_54801 ?auto_54785 ) ) ( not ( = ?auto_54794 ?auto_54810 ) ) ( not ( = ?auto_54816 ?auto_54794 ) ) ( not ( = ?auto_54793 ?auto_54794 ) ) ( not ( = ?auto_54817 ?auto_54794 ) ) ( not ( = ?auto_54811 ?auto_54794 ) ) ( HOIST-AT ?auto_54814 ?auto_54794 ) ( not ( = ?auto_54799 ?auto_54814 ) ) ( not ( = ?auto_54815 ?auto_54814 ) ) ( not ( = ?auto_54800 ?auto_54814 ) ) ( not ( = ?auto_54796 ?auto_54814 ) ) ( not ( = ?auto_54798 ?auto_54814 ) ) ( AVAILABLE ?auto_54814 ) ( SURFACE-AT ?auto_54808 ?auto_54794 ) ( ON ?auto_54808 ?auto_54804 ) ( CLEAR ?auto_54808 ) ( not ( = ?auto_54783 ?auto_54804 ) ) ( not ( = ?auto_54784 ?auto_54804 ) ) ( not ( = ?auto_54807 ?auto_54804 ) ) ( not ( = ?auto_54795 ?auto_54804 ) ) ( not ( = ?auto_54803 ?auto_54804 ) ) ( not ( = ?auto_54806 ?auto_54804 ) ) ( not ( = ?auto_54812 ?auto_54804 ) ) ( not ( = ?auto_54790 ?auto_54804 ) ) ( not ( = ?auto_54813 ?auto_54804 ) ) ( not ( = ?auto_54808 ?auto_54804 ) ) ( not ( = ?auto_54801 ?auto_54804 ) ) ( not ( = ?auto_54785 ?auto_54804 ) ) ( IS-CRATE ?auto_54785 ) ( not ( = ?auto_54783 ?auto_54788 ) ) ( not ( = ?auto_54784 ?auto_54788 ) ) ( not ( = ?auto_54807 ?auto_54788 ) ) ( not ( = ?auto_54795 ?auto_54788 ) ) ( not ( = ?auto_54803 ?auto_54788 ) ) ( not ( = ?auto_54806 ?auto_54788 ) ) ( not ( = ?auto_54812 ?auto_54788 ) ) ( not ( = ?auto_54790 ?auto_54788 ) ) ( not ( = ?auto_54813 ?auto_54788 ) ) ( not ( = ?auto_54808 ?auto_54788 ) ) ( not ( = ?auto_54801 ?auto_54788 ) ) ( not ( = ?auto_54785 ?auto_54788 ) ) ( not ( = ?auto_54804 ?auto_54788 ) ) ( not ( = ?auto_54802 ?auto_54810 ) ) ( not ( = ?auto_54816 ?auto_54802 ) ) ( not ( = ?auto_54793 ?auto_54802 ) ) ( not ( = ?auto_54817 ?auto_54802 ) ) ( not ( = ?auto_54811 ?auto_54802 ) ) ( not ( = ?auto_54794 ?auto_54802 ) ) ( HOIST-AT ?auto_54809 ?auto_54802 ) ( not ( = ?auto_54799 ?auto_54809 ) ) ( not ( = ?auto_54815 ?auto_54809 ) ) ( not ( = ?auto_54800 ?auto_54809 ) ) ( not ( = ?auto_54796 ?auto_54809 ) ) ( not ( = ?auto_54798 ?auto_54809 ) ) ( not ( = ?auto_54814 ?auto_54809 ) ) ( AVAILABLE ?auto_54809 ) ( SURFACE-AT ?auto_54785 ?auto_54802 ) ( ON ?auto_54785 ?auto_54787 ) ( CLEAR ?auto_54785 ) ( not ( = ?auto_54783 ?auto_54787 ) ) ( not ( = ?auto_54784 ?auto_54787 ) ) ( not ( = ?auto_54807 ?auto_54787 ) ) ( not ( = ?auto_54795 ?auto_54787 ) ) ( not ( = ?auto_54803 ?auto_54787 ) ) ( not ( = ?auto_54806 ?auto_54787 ) ) ( not ( = ?auto_54812 ?auto_54787 ) ) ( not ( = ?auto_54790 ?auto_54787 ) ) ( not ( = ?auto_54813 ?auto_54787 ) ) ( not ( = ?auto_54808 ?auto_54787 ) ) ( not ( = ?auto_54801 ?auto_54787 ) ) ( not ( = ?auto_54785 ?auto_54787 ) ) ( not ( = ?auto_54804 ?auto_54787 ) ) ( not ( = ?auto_54788 ?auto_54787 ) ) ( IS-CRATE ?auto_54788 ) ( not ( = ?auto_54783 ?auto_54797 ) ) ( not ( = ?auto_54784 ?auto_54797 ) ) ( not ( = ?auto_54807 ?auto_54797 ) ) ( not ( = ?auto_54795 ?auto_54797 ) ) ( not ( = ?auto_54803 ?auto_54797 ) ) ( not ( = ?auto_54806 ?auto_54797 ) ) ( not ( = ?auto_54812 ?auto_54797 ) ) ( not ( = ?auto_54790 ?auto_54797 ) ) ( not ( = ?auto_54813 ?auto_54797 ) ) ( not ( = ?auto_54808 ?auto_54797 ) ) ( not ( = ?auto_54801 ?auto_54797 ) ) ( not ( = ?auto_54785 ?auto_54797 ) ) ( not ( = ?auto_54804 ?auto_54797 ) ) ( not ( = ?auto_54788 ?auto_54797 ) ) ( not ( = ?auto_54787 ?auto_54797 ) ) ( not ( = ?auto_54786 ?auto_54810 ) ) ( not ( = ?auto_54816 ?auto_54786 ) ) ( not ( = ?auto_54793 ?auto_54786 ) ) ( not ( = ?auto_54817 ?auto_54786 ) ) ( not ( = ?auto_54811 ?auto_54786 ) ) ( not ( = ?auto_54794 ?auto_54786 ) ) ( not ( = ?auto_54802 ?auto_54786 ) ) ( HOIST-AT ?auto_54789 ?auto_54786 ) ( not ( = ?auto_54799 ?auto_54789 ) ) ( not ( = ?auto_54815 ?auto_54789 ) ) ( not ( = ?auto_54800 ?auto_54789 ) ) ( not ( = ?auto_54796 ?auto_54789 ) ) ( not ( = ?auto_54798 ?auto_54789 ) ) ( not ( = ?auto_54814 ?auto_54789 ) ) ( not ( = ?auto_54809 ?auto_54789 ) ) ( AVAILABLE ?auto_54789 ) ( SURFACE-AT ?auto_54788 ?auto_54786 ) ( ON ?auto_54788 ?auto_54791 ) ( CLEAR ?auto_54788 ) ( not ( = ?auto_54783 ?auto_54791 ) ) ( not ( = ?auto_54784 ?auto_54791 ) ) ( not ( = ?auto_54807 ?auto_54791 ) ) ( not ( = ?auto_54795 ?auto_54791 ) ) ( not ( = ?auto_54803 ?auto_54791 ) ) ( not ( = ?auto_54806 ?auto_54791 ) ) ( not ( = ?auto_54812 ?auto_54791 ) ) ( not ( = ?auto_54790 ?auto_54791 ) ) ( not ( = ?auto_54813 ?auto_54791 ) ) ( not ( = ?auto_54808 ?auto_54791 ) ) ( not ( = ?auto_54801 ?auto_54791 ) ) ( not ( = ?auto_54785 ?auto_54791 ) ) ( not ( = ?auto_54804 ?auto_54791 ) ) ( not ( = ?auto_54788 ?auto_54791 ) ) ( not ( = ?auto_54787 ?auto_54791 ) ) ( not ( = ?auto_54797 ?auto_54791 ) ) ( SURFACE-AT ?auto_54792 ?auto_54810 ) ( CLEAR ?auto_54792 ) ( IS-CRATE ?auto_54797 ) ( not ( = ?auto_54783 ?auto_54792 ) ) ( not ( = ?auto_54784 ?auto_54792 ) ) ( not ( = ?auto_54807 ?auto_54792 ) ) ( not ( = ?auto_54795 ?auto_54792 ) ) ( not ( = ?auto_54803 ?auto_54792 ) ) ( not ( = ?auto_54806 ?auto_54792 ) ) ( not ( = ?auto_54812 ?auto_54792 ) ) ( not ( = ?auto_54790 ?auto_54792 ) ) ( not ( = ?auto_54813 ?auto_54792 ) ) ( not ( = ?auto_54808 ?auto_54792 ) ) ( not ( = ?auto_54801 ?auto_54792 ) ) ( not ( = ?auto_54785 ?auto_54792 ) ) ( not ( = ?auto_54804 ?auto_54792 ) ) ( not ( = ?auto_54788 ?auto_54792 ) ) ( not ( = ?auto_54787 ?auto_54792 ) ) ( not ( = ?auto_54797 ?auto_54792 ) ) ( not ( = ?auto_54791 ?auto_54792 ) ) ( AVAILABLE ?auto_54799 ) ( IN ?auto_54797 ?auto_54805 ) ( TRUCK-AT ?auto_54805 ?auto_54818 ) ( not ( = ?auto_54818 ?auto_54810 ) ) ( not ( = ?auto_54816 ?auto_54818 ) ) ( not ( = ?auto_54793 ?auto_54818 ) ) ( not ( = ?auto_54817 ?auto_54818 ) ) ( not ( = ?auto_54811 ?auto_54818 ) ) ( not ( = ?auto_54794 ?auto_54818 ) ) ( not ( = ?auto_54802 ?auto_54818 ) ) ( not ( = ?auto_54786 ?auto_54818 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_54805 ?auto_54818 ?auto_54810 )
      ( MAKE-ON ?auto_54783 ?auto_54784 )
      ( MAKE-ON-VERIFY ?auto_54783 ?auto_54784 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54819 - SURFACE
      ?auto_54820 - SURFACE
    )
    :vars
    (
      ?auto_54853 - HOIST
      ?auto_54836 - PLACE
      ?auto_54821 - PLACE
      ?auto_54826 - HOIST
      ?auto_54839 - SURFACE
      ?auto_54834 - SURFACE
      ?auto_54851 - PLACE
      ?auto_54840 - HOIST
      ?auto_54828 - SURFACE
      ?auto_54832 - SURFACE
      ?auto_54830 - PLACE
      ?auto_54837 - HOIST
      ?auto_54823 - SURFACE
      ?auto_54841 - SURFACE
      ?auto_54824 - PLACE
      ?auto_54843 - HOIST
      ?auto_54845 - SURFACE
      ?auto_54827 - SURFACE
      ?auto_54822 - SURFACE
      ?auto_54833 - SURFACE
      ?auto_54850 - PLACE
      ?auto_54846 - HOIST
      ?auto_54829 - SURFACE
      ?auto_54849 - SURFACE
      ?auto_54825 - PLACE
      ?auto_54835 - HOIST
      ?auto_54847 - SURFACE
      ?auto_54844 - SURFACE
      ?auto_54842 - PLACE
      ?auto_54838 - HOIST
      ?auto_54854 - SURFACE
      ?auto_54848 - SURFACE
      ?auto_54831 - TRUCK
      ?auto_54852 - PLACE
      ?auto_54855 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_54853 ?auto_54836 ) ( IS-CRATE ?auto_54819 ) ( not ( = ?auto_54819 ?auto_54820 ) ) ( not ( = ?auto_54821 ?auto_54836 ) ) ( HOIST-AT ?auto_54826 ?auto_54821 ) ( not ( = ?auto_54853 ?auto_54826 ) ) ( AVAILABLE ?auto_54826 ) ( SURFACE-AT ?auto_54819 ?auto_54821 ) ( ON ?auto_54819 ?auto_54839 ) ( CLEAR ?auto_54819 ) ( not ( = ?auto_54819 ?auto_54839 ) ) ( not ( = ?auto_54820 ?auto_54839 ) ) ( IS-CRATE ?auto_54820 ) ( not ( = ?auto_54819 ?auto_54834 ) ) ( not ( = ?auto_54820 ?auto_54834 ) ) ( not ( = ?auto_54839 ?auto_54834 ) ) ( not ( = ?auto_54851 ?auto_54836 ) ) ( not ( = ?auto_54821 ?auto_54851 ) ) ( HOIST-AT ?auto_54840 ?auto_54851 ) ( not ( = ?auto_54853 ?auto_54840 ) ) ( not ( = ?auto_54826 ?auto_54840 ) ) ( SURFACE-AT ?auto_54820 ?auto_54851 ) ( ON ?auto_54820 ?auto_54828 ) ( CLEAR ?auto_54820 ) ( not ( = ?auto_54819 ?auto_54828 ) ) ( not ( = ?auto_54820 ?auto_54828 ) ) ( not ( = ?auto_54839 ?auto_54828 ) ) ( not ( = ?auto_54834 ?auto_54828 ) ) ( IS-CRATE ?auto_54834 ) ( not ( = ?auto_54819 ?auto_54832 ) ) ( not ( = ?auto_54820 ?auto_54832 ) ) ( not ( = ?auto_54839 ?auto_54832 ) ) ( not ( = ?auto_54834 ?auto_54832 ) ) ( not ( = ?auto_54828 ?auto_54832 ) ) ( not ( = ?auto_54830 ?auto_54836 ) ) ( not ( = ?auto_54821 ?auto_54830 ) ) ( not ( = ?auto_54851 ?auto_54830 ) ) ( HOIST-AT ?auto_54837 ?auto_54830 ) ( not ( = ?auto_54853 ?auto_54837 ) ) ( not ( = ?auto_54826 ?auto_54837 ) ) ( not ( = ?auto_54840 ?auto_54837 ) ) ( AVAILABLE ?auto_54837 ) ( SURFACE-AT ?auto_54834 ?auto_54830 ) ( ON ?auto_54834 ?auto_54823 ) ( CLEAR ?auto_54834 ) ( not ( = ?auto_54819 ?auto_54823 ) ) ( not ( = ?auto_54820 ?auto_54823 ) ) ( not ( = ?auto_54839 ?auto_54823 ) ) ( not ( = ?auto_54834 ?auto_54823 ) ) ( not ( = ?auto_54828 ?auto_54823 ) ) ( not ( = ?auto_54832 ?auto_54823 ) ) ( IS-CRATE ?auto_54832 ) ( not ( = ?auto_54819 ?auto_54841 ) ) ( not ( = ?auto_54820 ?auto_54841 ) ) ( not ( = ?auto_54839 ?auto_54841 ) ) ( not ( = ?auto_54834 ?auto_54841 ) ) ( not ( = ?auto_54828 ?auto_54841 ) ) ( not ( = ?auto_54832 ?auto_54841 ) ) ( not ( = ?auto_54823 ?auto_54841 ) ) ( not ( = ?auto_54824 ?auto_54836 ) ) ( not ( = ?auto_54821 ?auto_54824 ) ) ( not ( = ?auto_54851 ?auto_54824 ) ) ( not ( = ?auto_54830 ?auto_54824 ) ) ( HOIST-AT ?auto_54843 ?auto_54824 ) ( not ( = ?auto_54853 ?auto_54843 ) ) ( not ( = ?auto_54826 ?auto_54843 ) ) ( not ( = ?auto_54840 ?auto_54843 ) ) ( not ( = ?auto_54837 ?auto_54843 ) ) ( AVAILABLE ?auto_54843 ) ( SURFACE-AT ?auto_54832 ?auto_54824 ) ( ON ?auto_54832 ?auto_54845 ) ( CLEAR ?auto_54832 ) ( not ( = ?auto_54819 ?auto_54845 ) ) ( not ( = ?auto_54820 ?auto_54845 ) ) ( not ( = ?auto_54839 ?auto_54845 ) ) ( not ( = ?auto_54834 ?auto_54845 ) ) ( not ( = ?auto_54828 ?auto_54845 ) ) ( not ( = ?auto_54832 ?auto_54845 ) ) ( not ( = ?auto_54823 ?auto_54845 ) ) ( not ( = ?auto_54841 ?auto_54845 ) ) ( IS-CRATE ?auto_54841 ) ( not ( = ?auto_54819 ?auto_54827 ) ) ( not ( = ?auto_54820 ?auto_54827 ) ) ( not ( = ?auto_54839 ?auto_54827 ) ) ( not ( = ?auto_54834 ?auto_54827 ) ) ( not ( = ?auto_54828 ?auto_54827 ) ) ( not ( = ?auto_54832 ?auto_54827 ) ) ( not ( = ?auto_54823 ?auto_54827 ) ) ( not ( = ?auto_54841 ?auto_54827 ) ) ( not ( = ?auto_54845 ?auto_54827 ) ) ( AVAILABLE ?auto_54840 ) ( SURFACE-AT ?auto_54841 ?auto_54851 ) ( ON ?auto_54841 ?auto_54822 ) ( CLEAR ?auto_54841 ) ( not ( = ?auto_54819 ?auto_54822 ) ) ( not ( = ?auto_54820 ?auto_54822 ) ) ( not ( = ?auto_54839 ?auto_54822 ) ) ( not ( = ?auto_54834 ?auto_54822 ) ) ( not ( = ?auto_54828 ?auto_54822 ) ) ( not ( = ?auto_54832 ?auto_54822 ) ) ( not ( = ?auto_54823 ?auto_54822 ) ) ( not ( = ?auto_54841 ?auto_54822 ) ) ( not ( = ?auto_54845 ?auto_54822 ) ) ( not ( = ?auto_54827 ?auto_54822 ) ) ( IS-CRATE ?auto_54827 ) ( not ( = ?auto_54819 ?auto_54833 ) ) ( not ( = ?auto_54820 ?auto_54833 ) ) ( not ( = ?auto_54839 ?auto_54833 ) ) ( not ( = ?auto_54834 ?auto_54833 ) ) ( not ( = ?auto_54828 ?auto_54833 ) ) ( not ( = ?auto_54832 ?auto_54833 ) ) ( not ( = ?auto_54823 ?auto_54833 ) ) ( not ( = ?auto_54841 ?auto_54833 ) ) ( not ( = ?auto_54845 ?auto_54833 ) ) ( not ( = ?auto_54827 ?auto_54833 ) ) ( not ( = ?auto_54822 ?auto_54833 ) ) ( not ( = ?auto_54850 ?auto_54836 ) ) ( not ( = ?auto_54821 ?auto_54850 ) ) ( not ( = ?auto_54851 ?auto_54850 ) ) ( not ( = ?auto_54830 ?auto_54850 ) ) ( not ( = ?auto_54824 ?auto_54850 ) ) ( HOIST-AT ?auto_54846 ?auto_54850 ) ( not ( = ?auto_54853 ?auto_54846 ) ) ( not ( = ?auto_54826 ?auto_54846 ) ) ( not ( = ?auto_54840 ?auto_54846 ) ) ( not ( = ?auto_54837 ?auto_54846 ) ) ( not ( = ?auto_54843 ?auto_54846 ) ) ( AVAILABLE ?auto_54846 ) ( SURFACE-AT ?auto_54827 ?auto_54850 ) ( ON ?auto_54827 ?auto_54829 ) ( CLEAR ?auto_54827 ) ( not ( = ?auto_54819 ?auto_54829 ) ) ( not ( = ?auto_54820 ?auto_54829 ) ) ( not ( = ?auto_54839 ?auto_54829 ) ) ( not ( = ?auto_54834 ?auto_54829 ) ) ( not ( = ?auto_54828 ?auto_54829 ) ) ( not ( = ?auto_54832 ?auto_54829 ) ) ( not ( = ?auto_54823 ?auto_54829 ) ) ( not ( = ?auto_54841 ?auto_54829 ) ) ( not ( = ?auto_54845 ?auto_54829 ) ) ( not ( = ?auto_54827 ?auto_54829 ) ) ( not ( = ?auto_54822 ?auto_54829 ) ) ( not ( = ?auto_54833 ?auto_54829 ) ) ( IS-CRATE ?auto_54833 ) ( not ( = ?auto_54819 ?auto_54849 ) ) ( not ( = ?auto_54820 ?auto_54849 ) ) ( not ( = ?auto_54839 ?auto_54849 ) ) ( not ( = ?auto_54834 ?auto_54849 ) ) ( not ( = ?auto_54828 ?auto_54849 ) ) ( not ( = ?auto_54832 ?auto_54849 ) ) ( not ( = ?auto_54823 ?auto_54849 ) ) ( not ( = ?auto_54841 ?auto_54849 ) ) ( not ( = ?auto_54845 ?auto_54849 ) ) ( not ( = ?auto_54827 ?auto_54849 ) ) ( not ( = ?auto_54822 ?auto_54849 ) ) ( not ( = ?auto_54833 ?auto_54849 ) ) ( not ( = ?auto_54829 ?auto_54849 ) ) ( not ( = ?auto_54825 ?auto_54836 ) ) ( not ( = ?auto_54821 ?auto_54825 ) ) ( not ( = ?auto_54851 ?auto_54825 ) ) ( not ( = ?auto_54830 ?auto_54825 ) ) ( not ( = ?auto_54824 ?auto_54825 ) ) ( not ( = ?auto_54850 ?auto_54825 ) ) ( HOIST-AT ?auto_54835 ?auto_54825 ) ( not ( = ?auto_54853 ?auto_54835 ) ) ( not ( = ?auto_54826 ?auto_54835 ) ) ( not ( = ?auto_54840 ?auto_54835 ) ) ( not ( = ?auto_54837 ?auto_54835 ) ) ( not ( = ?auto_54843 ?auto_54835 ) ) ( not ( = ?auto_54846 ?auto_54835 ) ) ( AVAILABLE ?auto_54835 ) ( SURFACE-AT ?auto_54833 ?auto_54825 ) ( ON ?auto_54833 ?auto_54847 ) ( CLEAR ?auto_54833 ) ( not ( = ?auto_54819 ?auto_54847 ) ) ( not ( = ?auto_54820 ?auto_54847 ) ) ( not ( = ?auto_54839 ?auto_54847 ) ) ( not ( = ?auto_54834 ?auto_54847 ) ) ( not ( = ?auto_54828 ?auto_54847 ) ) ( not ( = ?auto_54832 ?auto_54847 ) ) ( not ( = ?auto_54823 ?auto_54847 ) ) ( not ( = ?auto_54841 ?auto_54847 ) ) ( not ( = ?auto_54845 ?auto_54847 ) ) ( not ( = ?auto_54827 ?auto_54847 ) ) ( not ( = ?auto_54822 ?auto_54847 ) ) ( not ( = ?auto_54833 ?auto_54847 ) ) ( not ( = ?auto_54829 ?auto_54847 ) ) ( not ( = ?auto_54849 ?auto_54847 ) ) ( IS-CRATE ?auto_54849 ) ( not ( = ?auto_54819 ?auto_54844 ) ) ( not ( = ?auto_54820 ?auto_54844 ) ) ( not ( = ?auto_54839 ?auto_54844 ) ) ( not ( = ?auto_54834 ?auto_54844 ) ) ( not ( = ?auto_54828 ?auto_54844 ) ) ( not ( = ?auto_54832 ?auto_54844 ) ) ( not ( = ?auto_54823 ?auto_54844 ) ) ( not ( = ?auto_54841 ?auto_54844 ) ) ( not ( = ?auto_54845 ?auto_54844 ) ) ( not ( = ?auto_54827 ?auto_54844 ) ) ( not ( = ?auto_54822 ?auto_54844 ) ) ( not ( = ?auto_54833 ?auto_54844 ) ) ( not ( = ?auto_54829 ?auto_54844 ) ) ( not ( = ?auto_54849 ?auto_54844 ) ) ( not ( = ?auto_54847 ?auto_54844 ) ) ( not ( = ?auto_54842 ?auto_54836 ) ) ( not ( = ?auto_54821 ?auto_54842 ) ) ( not ( = ?auto_54851 ?auto_54842 ) ) ( not ( = ?auto_54830 ?auto_54842 ) ) ( not ( = ?auto_54824 ?auto_54842 ) ) ( not ( = ?auto_54850 ?auto_54842 ) ) ( not ( = ?auto_54825 ?auto_54842 ) ) ( HOIST-AT ?auto_54838 ?auto_54842 ) ( not ( = ?auto_54853 ?auto_54838 ) ) ( not ( = ?auto_54826 ?auto_54838 ) ) ( not ( = ?auto_54840 ?auto_54838 ) ) ( not ( = ?auto_54837 ?auto_54838 ) ) ( not ( = ?auto_54843 ?auto_54838 ) ) ( not ( = ?auto_54846 ?auto_54838 ) ) ( not ( = ?auto_54835 ?auto_54838 ) ) ( AVAILABLE ?auto_54838 ) ( SURFACE-AT ?auto_54849 ?auto_54842 ) ( ON ?auto_54849 ?auto_54854 ) ( CLEAR ?auto_54849 ) ( not ( = ?auto_54819 ?auto_54854 ) ) ( not ( = ?auto_54820 ?auto_54854 ) ) ( not ( = ?auto_54839 ?auto_54854 ) ) ( not ( = ?auto_54834 ?auto_54854 ) ) ( not ( = ?auto_54828 ?auto_54854 ) ) ( not ( = ?auto_54832 ?auto_54854 ) ) ( not ( = ?auto_54823 ?auto_54854 ) ) ( not ( = ?auto_54841 ?auto_54854 ) ) ( not ( = ?auto_54845 ?auto_54854 ) ) ( not ( = ?auto_54827 ?auto_54854 ) ) ( not ( = ?auto_54822 ?auto_54854 ) ) ( not ( = ?auto_54833 ?auto_54854 ) ) ( not ( = ?auto_54829 ?auto_54854 ) ) ( not ( = ?auto_54849 ?auto_54854 ) ) ( not ( = ?auto_54847 ?auto_54854 ) ) ( not ( = ?auto_54844 ?auto_54854 ) ) ( SURFACE-AT ?auto_54848 ?auto_54836 ) ( CLEAR ?auto_54848 ) ( IS-CRATE ?auto_54844 ) ( not ( = ?auto_54819 ?auto_54848 ) ) ( not ( = ?auto_54820 ?auto_54848 ) ) ( not ( = ?auto_54839 ?auto_54848 ) ) ( not ( = ?auto_54834 ?auto_54848 ) ) ( not ( = ?auto_54828 ?auto_54848 ) ) ( not ( = ?auto_54832 ?auto_54848 ) ) ( not ( = ?auto_54823 ?auto_54848 ) ) ( not ( = ?auto_54841 ?auto_54848 ) ) ( not ( = ?auto_54845 ?auto_54848 ) ) ( not ( = ?auto_54827 ?auto_54848 ) ) ( not ( = ?auto_54822 ?auto_54848 ) ) ( not ( = ?auto_54833 ?auto_54848 ) ) ( not ( = ?auto_54829 ?auto_54848 ) ) ( not ( = ?auto_54849 ?auto_54848 ) ) ( not ( = ?auto_54847 ?auto_54848 ) ) ( not ( = ?auto_54844 ?auto_54848 ) ) ( not ( = ?auto_54854 ?auto_54848 ) ) ( AVAILABLE ?auto_54853 ) ( TRUCK-AT ?auto_54831 ?auto_54852 ) ( not ( = ?auto_54852 ?auto_54836 ) ) ( not ( = ?auto_54821 ?auto_54852 ) ) ( not ( = ?auto_54851 ?auto_54852 ) ) ( not ( = ?auto_54830 ?auto_54852 ) ) ( not ( = ?auto_54824 ?auto_54852 ) ) ( not ( = ?auto_54850 ?auto_54852 ) ) ( not ( = ?auto_54825 ?auto_54852 ) ) ( not ( = ?auto_54842 ?auto_54852 ) ) ( HOIST-AT ?auto_54855 ?auto_54852 ) ( LIFTING ?auto_54855 ?auto_54844 ) ( not ( = ?auto_54853 ?auto_54855 ) ) ( not ( = ?auto_54826 ?auto_54855 ) ) ( not ( = ?auto_54840 ?auto_54855 ) ) ( not ( = ?auto_54837 ?auto_54855 ) ) ( not ( = ?auto_54843 ?auto_54855 ) ) ( not ( = ?auto_54846 ?auto_54855 ) ) ( not ( = ?auto_54835 ?auto_54855 ) ) ( not ( = ?auto_54838 ?auto_54855 ) ) )
    :subtasks
    ( ( !LOAD ?auto_54855 ?auto_54844 ?auto_54831 ?auto_54852 )
      ( MAKE-ON ?auto_54819 ?auto_54820 )
      ( MAKE-ON-VERIFY ?auto_54819 ?auto_54820 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54856 - SURFACE
      ?auto_54857 - SURFACE
    )
    :vars
    (
      ?auto_54860 - HOIST
      ?auto_54880 - PLACE
      ?auto_54864 - PLACE
      ?auto_54887 - HOIST
      ?auto_54875 - SURFACE
      ?auto_54890 - SURFACE
      ?auto_54871 - PLACE
      ?auto_54876 - HOIST
      ?auto_54885 - SURFACE
      ?auto_54861 - SURFACE
      ?auto_54883 - PLACE
      ?auto_54873 - HOIST
      ?auto_54882 - SURFACE
      ?auto_54877 - SURFACE
      ?auto_54886 - PLACE
      ?auto_54879 - HOIST
      ?auto_54868 - SURFACE
      ?auto_54891 - SURFACE
      ?auto_54889 - SURFACE
      ?auto_54884 - SURFACE
      ?auto_54870 - PLACE
      ?auto_54863 - HOIST
      ?auto_54892 - SURFACE
      ?auto_54869 - SURFACE
      ?auto_54888 - PLACE
      ?auto_54881 - HOIST
      ?auto_54865 - SURFACE
      ?auto_54872 - SURFACE
      ?auto_54878 - PLACE
      ?auto_54874 - HOIST
      ?auto_54859 - SURFACE
      ?auto_54862 - SURFACE
      ?auto_54858 - TRUCK
      ?auto_54866 - PLACE
      ?auto_54867 - HOIST
      ?auto_54893 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54860 ?auto_54880 ) ( IS-CRATE ?auto_54856 ) ( not ( = ?auto_54856 ?auto_54857 ) ) ( not ( = ?auto_54864 ?auto_54880 ) ) ( HOIST-AT ?auto_54887 ?auto_54864 ) ( not ( = ?auto_54860 ?auto_54887 ) ) ( AVAILABLE ?auto_54887 ) ( SURFACE-AT ?auto_54856 ?auto_54864 ) ( ON ?auto_54856 ?auto_54875 ) ( CLEAR ?auto_54856 ) ( not ( = ?auto_54856 ?auto_54875 ) ) ( not ( = ?auto_54857 ?auto_54875 ) ) ( IS-CRATE ?auto_54857 ) ( not ( = ?auto_54856 ?auto_54890 ) ) ( not ( = ?auto_54857 ?auto_54890 ) ) ( not ( = ?auto_54875 ?auto_54890 ) ) ( not ( = ?auto_54871 ?auto_54880 ) ) ( not ( = ?auto_54864 ?auto_54871 ) ) ( HOIST-AT ?auto_54876 ?auto_54871 ) ( not ( = ?auto_54860 ?auto_54876 ) ) ( not ( = ?auto_54887 ?auto_54876 ) ) ( SURFACE-AT ?auto_54857 ?auto_54871 ) ( ON ?auto_54857 ?auto_54885 ) ( CLEAR ?auto_54857 ) ( not ( = ?auto_54856 ?auto_54885 ) ) ( not ( = ?auto_54857 ?auto_54885 ) ) ( not ( = ?auto_54875 ?auto_54885 ) ) ( not ( = ?auto_54890 ?auto_54885 ) ) ( IS-CRATE ?auto_54890 ) ( not ( = ?auto_54856 ?auto_54861 ) ) ( not ( = ?auto_54857 ?auto_54861 ) ) ( not ( = ?auto_54875 ?auto_54861 ) ) ( not ( = ?auto_54890 ?auto_54861 ) ) ( not ( = ?auto_54885 ?auto_54861 ) ) ( not ( = ?auto_54883 ?auto_54880 ) ) ( not ( = ?auto_54864 ?auto_54883 ) ) ( not ( = ?auto_54871 ?auto_54883 ) ) ( HOIST-AT ?auto_54873 ?auto_54883 ) ( not ( = ?auto_54860 ?auto_54873 ) ) ( not ( = ?auto_54887 ?auto_54873 ) ) ( not ( = ?auto_54876 ?auto_54873 ) ) ( AVAILABLE ?auto_54873 ) ( SURFACE-AT ?auto_54890 ?auto_54883 ) ( ON ?auto_54890 ?auto_54882 ) ( CLEAR ?auto_54890 ) ( not ( = ?auto_54856 ?auto_54882 ) ) ( not ( = ?auto_54857 ?auto_54882 ) ) ( not ( = ?auto_54875 ?auto_54882 ) ) ( not ( = ?auto_54890 ?auto_54882 ) ) ( not ( = ?auto_54885 ?auto_54882 ) ) ( not ( = ?auto_54861 ?auto_54882 ) ) ( IS-CRATE ?auto_54861 ) ( not ( = ?auto_54856 ?auto_54877 ) ) ( not ( = ?auto_54857 ?auto_54877 ) ) ( not ( = ?auto_54875 ?auto_54877 ) ) ( not ( = ?auto_54890 ?auto_54877 ) ) ( not ( = ?auto_54885 ?auto_54877 ) ) ( not ( = ?auto_54861 ?auto_54877 ) ) ( not ( = ?auto_54882 ?auto_54877 ) ) ( not ( = ?auto_54886 ?auto_54880 ) ) ( not ( = ?auto_54864 ?auto_54886 ) ) ( not ( = ?auto_54871 ?auto_54886 ) ) ( not ( = ?auto_54883 ?auto_54886 ) ) ( HOIST-AT ?auto_54879 ?auto_54886 ) ( not ( = ?auto_54860 ?auto_54879 ) ) ( not ( = ?auto_54887 ?auto_54879 ) ) ( not ( = ?auto_54876 ?auto_54879 ) ) ( not ( = ?auto_54873 ?auto_54879 ) ) ( AVAILABLE ?auto_54879 ) ( SURFACE-AT ?auto_54861 ?auto_54886 ) ( ON ?auto_54861 ?auto_54868 ) ( CLEAR ?auto_54861 ) ( not ( = ?auto_54856 ?auto_54868 ) ) ( not ( = ?auto_54857 ?auto_54868 ) ) ( not ( = ?auto_54875 ?auto_54868 ) ) ( not ( = ?auto_54890 ?auto_54868 ) ) ( not ( = ?auto_54885 ?auto_54868 ) ) ( not ( = ?auto_54861 ?auto_54868 ) ) ( not ( = ?auto_54882 ?auto_54868 ) ) ( not ( = ?auto_54877 ?auto_54868 ) ) ( IS-CRATE ?auto_54877 ) ( not ( = ?auto_54856 ?auto_54891 ) ) ( not ( = ?auto_54857 ?auto_54891 ) ) ( not ( = ?auto_54875 ?auto_54891 ) ) ( not ( = ?auto_54890 ?auto_54891 ) ) ( not ( = ?auto_54885 ?auto_54891 ) ) ( not ( = ?auto_54861 ?auto_54891 ) ) ( not ( = ?auto_54882 ?auto_54891 ) ) ( not ( = ?auto_54877 ?auto_54891 ) ) ( not ( = ?auto_54868 ?auto_54891 ) ) ( AVAILABLE ?auto_54876 ) ( SURFACE-AT ?auto_54877 ?auto_54871 ) ( ON ?auto_54877 ?auto_54889 ) ( CLEAR ?auto_54877 ) ( not ( = ?auto_54856 ?auto_54889 ) ) ( not ( = ?auto_54857 ?auto_54889 ) ) ( not ( = ?auto_54875 ?auto_54889 ) ) ( not ( = ?auto_54890 ?auto_54889 ) ) ( not ( = ?auto_54885 ?auto_54889 ) ) ( not ( = ?auto_54861 ?auto_54889 ) ) ( not ( = ?auto_54882 ?auto_54889 ) ) ( not ( = ?auto_54877 ?auto_54889 ) ) ( not ( = ?auto_54868 ?auto_54889 ) ) ( not ( = ?auto_54891 ?auto_54889 ) ) ( IS-CRATE ?auto_54891 ) ( not ( = ?auto_54856 ?auto_54884 ) ) ( not ( = ?auto_54857 ?auto_54884 ) ) ( not ( = ?auto_54875 ?auto_54884 ) ) ( not ( = ?auto_54890 ?auto_54884 ) ) ( not ( = ?auto_54885 ?auto_54884 ) ) ( not ( = ?auto_54861 ?auto_54884 ) ) ( not ( = ?auto_54882 ?auto_54884 ) ) ( not ( = ?auto_54877 ?auto_54884 ) ) ( not ( = ?auto_54868 ?auto_54884 ) ) ( not ( = ?auto_54891 ?auto_54884 ) ) ( not ( = ?auto_54889 ?auto_54884 ) ) ( not ( = ?auto_54870 ?auto_54880 ) ) ( not ( = ?auto_54864 ?auto_54870 ) ) ( not ( = ?auto_54871 ?auto_54870 ) ) ( not ( = ?auto_54883 ?auto_54870 ) ) ( not ( = ?auto_54886 ?auto_54870 ) ) ( HOIST-AT ?auto_54863 ?auto_54870 ) ( not ( = ?auto_54860 ?auto_54863 ) ) ( not ( = ?auto_54887 ?auto_54863 ) ) ( not ( = ?auto_54876 ?auto_54863 ) ) ( not ( = ?auto_54873 ?auto_54863 ) ) ( not ( = ?auto_54879 ?auto_54863 ) ) ( AVAILABLE ?auto_54863 ) ( SURFACE-AT ?auto_54891 ?auto_54870 ) ( ON ?auto_54891 ?auto_54892 ) ( CLEAR ?auto_54891 ) ( not ( = ?auto_54856 ?auto_54892 ) ) ( not ( = ?auto_54857 ?auto_54892 ) ) ( not ( = ?auto_54875 ?auto_54892 ) ) ( not ( = ?auto_54890 ?auto_54892 ) ) ( not ( = ?auto_54885 ?auto_54892 ) ) ( not ( = ?auto_54861 ?auto_54892 ) ) ( not ( = ?auto_54882 ?auto_54892 ) ) ( not ( = ?auto_54877 ?auto_54892 ) ) ( not ( = ?auto_54868 ?auto_54892 ) ) ( not ( = ?auto_54891 ?auto_54892 ) ) ( not ( = ?auto_54889 ?auto_54892 ) ) ( not ( = ?auto_54884 ?auto_54892 ) ) ( IS-CRATE ?auto_54884 ) ( not ( = ?auto_54856 ?auto_54869 ) ) ( not ( = ?auto_54857 ?auto_54869 ) ) ( not ( = ?auto_54875 ?auto_54869 ) ) ( not ( = ?auto_54890 ?auto_54869 ) ) ( not ( = ?auto_54885 ?auto_54869 ) ) ( not ( = ?auto_54861 ?auto_54869 ) ) ( not ( = ?auto_54882 ?auto_54869 ) ) ( not ( = ?auto_54877 ?auto_54869 ) ) ( not ( = ?auto_54868 ?auto_54869 ) ) ( not ( = ?auto_54891 ?auto_54869 ) ) ( not ( = ?auto_54889 ?auto_54869 ) ) ( not ( = ?auto_54884 ?auto_54869 ) ) ( not ( = ?auto_54892 ?auto_54869 ) ) ( not ( = ?auto_54888 ?auto_54880 ) ) ( not ( = ?auto_54864 ?auto_54888 ) ) ( not ( = ?auto_54871 ?auto_54888 ) ) ( not ( = ?auto_54883 ?auto_54888 ) ) ( not ( = ?auto_54886 ?auto_54888 ) ) ( not ( = ?auto_54870 ?auto_54888 ) ) ( HOIST-AT ?auto_54881 ?auto_54888 ) ( not ( = ?auto_54860 ?auto_54881 ) ) ( not ( = ?auto_54887 ?auto_54881 ) ) ( not ( = ?auto_54876 ?auto_54881 ) ) ( not ( = ?auto_54873 ?auto_54881 ) ) ( not ( = ?auto_54879 ?auto_54881 ) ) ( not ( = ?auto_54863 ?auto_54881 ) ) ( AVAILABLE ?auto_54881 ) ( SURFACE-AT ?auto_54884 ?auto_54888 ) ( ON ?auto_54884 ?auto_54865 ) ( CLEAR ?auto_54884 ) ( not ( = ?auto_54856 ?auto_54865 ) ) ( not ( = ?auto_54857 ?auto_54865 ) ) ( not ( = ?auto_54875 ?auto_54865 ) ) ( not ( = ?auto_54890 ?auto_54865 ) ) ( not ( = ?auto_54885 ?auto_54865 ) ) ( not ( = ?auto_54861 ?auto_54865 ) ) ( not ( = ?auto_54882 ?auto_54865 ) ) ( not ( = ?auto_54877 ?auto_54865 ) ) ( not ( = ?auto_54868 ?auto_54865 ) ) ( not ( = ?auto_54891 ?auto_54865 ) ) ( not ( = ?auto_54889 ?auto_54865 ) ) ( not ( = ?auto_54884 ?auto_54865 ) ) ( not ( = ?auto_54892 ?auto_54865 ) ) ( not ( = ?auto_54869 ?auto_54865 ) ) ( IS-CRATE ?auto_54869 ) ( not ( = ?auto_54856 ?auto_54872 ) ) ( not ( = ?auto_54857 ?auto_54872 ) ) ( not ( = ?auto_54875 ?auto_54872 ) ) ( not ( = ?auto_54890 ?auto_54872 ) ) ( not ( = ?auto_54885 ?auto_54872 ) ) ( not ( = ?auto_54861 ?auto_54872 ) ) ( not ( = ?auto_54882 ?auto_54872 ) ) ( not ( = ?auto_54877 ?auto_54872 ) ) ( not ( = ?auto_54868 ?auto_54872 ) ) ( not ( = ?auto_54891 ?auto_54872 ) ) ( not ( = ?auto_54889 ?auto_54872 ) ) ( not ( = ?auto_54884 ?auto_54872 ) ) ( not ( = ?auto_54892 ?auto_54872 ) ) ( not ( = ?auto_54869 ?auto_54872 ) ) ( not ( = ?auto_54865 ?auto_54872 ) ) ( not ( = ?auto_54878 ?auto_54880 ) ) ( not ( = ?auto_54864 ?auto_54878 ) ) ( not ( = ?auto_54871 ?auto_54878 ) ) ( not ( = ?auto_54883 ?auto_54878 ) ) ( not ( = ?auto_54886 ?auto_54878 ) ) ( not ( = ?auto_54870 ?auto_54878 ) ) ( not ( = ?auto_54888 ?auto_54878 ) ) ( HOIST-AT ?auto_54874 ?auto_54878 ) ( not ( = ?auto_54860 ?auto_54874 ) ) ( not ( = ?auto_54887 ?auto_54874 ) ) ( not ( = ?auto_54876 ?auto_54874 ) ) ( not ( = ?auto_54873 ?auto_54874 ) ) ( not ( = ?auto_54879 ?auto_54874 ) ) ( not ( = ?auto_54863 ?auto_54874 ) ) ( not ( = ?auto_54881 ?auto_54874 ) ) ( AVAILABLE ?auto_54874 ) ( SURFACE-AT ?auto_54869 ?auto_54878 ) ( ON ?auto_54869 ?auto_54859 ) ( CLEAR ?auto_54869 ) ( not ( = ?auto_54856 ?auto_54859 ) ) ( not ( = ?auto_54857 ?auto_54859 ) ) ( not ( = ?auto_54875 ?auto_54859 ) ) ( not ( = ?auto_54890 ?auto_54859 ) ) ( not ( = ?auto_54885 ?auto_54859 ) ) ( not ( = ?auto_54861 ?auto_54859 ) ) ( not ( = ?auto_54882 ?auto_54859 ) ) ( not ( = ?auto_54877 ?auto_54859 ) ) ( not ( = ?auto_54868 ?auto_54859 ) ) ( not ( = ?auto_54891 ?auto_54859 ) ) ( not ( = ?auto_54889 ?auto_54859 ) ) ( not ( = ?auto_54884 ?auto_54859 ) ) ( not ( = ?auto_54892 ?auto_54859 ) ) ( not ( = ?auto_54869 ?auto_54859 ) ) ( not ( = ?auto_54865 ?auto_54859 ) ) ( not ( = ?auto_54872 ?auto_54859 ) ) ( SURFACE-AT ?auto_54862 ?auto_54880 ) ( CLEAR ?auto_54862 ) ( IS-CRATE ?auto_54872 ) ( not ( = ?auto_54856 ?auto_54862 ) ) ( not ( = ?auto_54857 ?auto_54862 ) ) ( not ( = ?auto_54875 ?auto_54862 ) ) ( not ( = ?auto_54890 ?auto_54862 ) ) ( not ( = ?auto_54885 ?auto_54862 ) ) ( not ( = ?auto_54861 ?auto_54862 ) ) ( not ( = ?auto_54882 ?auto_54862 ) ) ( not ( = ?auto_54877 ?auto_54862 ) ) ( not ( = ?auto_54868 ?auto_54862 ) ) ( not ( = ?auto_54891 ?auto_54862 ) ) ( not ( = ?auto_54889 ?auto_54862 ) ) ( not ( = ?auto_54884 ?auto_54862 ) ) ( not ( = ?auto_54892 ?auto_54862 ) ) ( not ( = ?auto_54869 ?auto_54862 ) ) ( not ( = ?auto_54865 ?auto_54862 ) ) ( not ( = ?auto_54872 ?auto_54862 ) ) ( not ( = ?auto_54859 ?auto_54862 ) ) ( AVAILABLE ?auto_54860 ) ( TRUCK-AT ?auto_54858 ?auto_54866 ) ( not ( = ?auto_54866 ?auto_54880 ) ) ( not ( = ?auto_54864 ?auto_54866 ) ) ( not ( = ?auto_54871 ?auto_54866 ) ) ( not ( = ?auto_54883 ?auto_54866 ) ) ( not ( = ?auto_54886 ?auto_54866 ) ) ( not ( = ?auto_54870 ?auto_54866 ) ) ( not ( = ?auto_54888 ?auto_54866 ) ) ( not ( = ?auto_54878 ?auto_54866 ) ) ( HOIST-AT ?auto_54867 ?auto_54866 ) ( not ( = ?auto_54860 ?auto_54867 ) ) ( not ( = ?auto_54887 ?auto_54867 ) ) ( not ( = ?auto_54876 ?auto_54867 ) ) ( not ( = ?auto_54873 ?auto_54867 ) ) ( not ( = ?auto_54879 ?auto_54867 ) ) ( not ( = ?auto_54863 ?auto_54867 ) ) ( not ( = ?auto_54881 ?auto_54867 ) ) ( not ( = ?auto_54874 ?auto_54867 ) ) ( AVAILABLE ?auto_54867 ) ( SURFACE-AT ?auto_54872 ?auto_54866 ) ( ON ?auto_54872 ?auto_54893 ) ( CLEAR ?auto_54872 ) ( not ( = ?auto_54856 ?auto_54893 ) ) ( not ( = ?auto_54857 ?auto_54893 ) ) ( not ( = ?auto_54875 ?auto_54893 ) ) ( not ( = ?auto_54890 ?auto_54893 ) ) ( not ( = ?auto_54885 ?auto_54893 ) ) ( not ( = ?auto_54861 ?auto_54893 ) ) ( not ( = ?auto_54882 ?auto_54893 ) ) ( not ( = ?auto_54877 ?auto_54893 ) ) ( not ( = ?auto_54868 ?auto_54893 ) ) ( not ( = ?auto_54891 ?auto_54893 ) ) ( not ( = ?auto_54889 ?auto_54893 ) ) ( not ( = ?auto_54884 ?auto_54893 ) ) ( not ( = ?auto_54892 ?auto_54893 ) ) ( not ( = ?auto_54869 ?auto_54893 ) ) ( not ( = ?auto_54865 ?auto_54893 ) ) ( not ( = ?auto_54872 ?auto_54893 ) ) ( not ( = ?auto_54859 ?auto_54893 ) ) ( not ( = ?auto_54862 ?auto_54893 ) ) )
    :subtasks
    ( ( !LIFT ?auto_54867 ?auto_54872 ?auto_54893 ?auto_54866 )
      ( MAKE-ON ?auto_54856 ?auto_54857 )
      ( MAKE-ON-VERIFY ?auto_54856 ?auto_54857 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_54894 - SURFACE
      ?auto_54895 - SURFACE
    )
    :vars
    (
      ?auto_54904 - HOIST
      ?auto_54920 - PLACE
      ?auto_54922 - PLACE
      ?auto_54911 - HOIST
      ?auto_54915 - SURFACE
      ?auto_54897 - SURFACE
      ?auto_54926 - PLACE
      ?auto_54916 - HOIST
      ?auto_54909 - SURFACE
      ?auto_54901 - SURFACE
      ?auto_54907 - PLACE
      ?auto_54921 - HOIST
      ?auto_54906 - SURFACE
      ?auto_54917 - SURFACE
      ?auto_54910 - PLACE
      ?auto_54919 - HOIST
      ?auto_54927 - SURFACE
      ?auto_54896 - SURFACE
      ?auto_54905 - SURFACE
      ?auto_54908 - SURFACE
      ?auto_54899 - PLACE
      ?auto_54900 - HOIST
      ?auto_54902 - SURFACE
      ?auto_54923 - SURFACE
      ?auto_54912 - PLACE
      ?auto_54913 - HOIST
      ?auto_54898 - SURFACE
      ?auto_54903 - SURFACE
      ?auto_54918 - PLACE
      ?auto_54914 - HOIST
      ?auto_54924 - SURFACE
      ?auto_54925 - SURFACE
      ?auto_54929 - PLACE
      ?auto_54928 - HOIST
      ?auto_54931 - SURFACE
      ?auto_54930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54904 ?auto_54920 ) ( IS-CRATE ?auto_54894 ) ( not ( = ?auto_54894 ?auto_54895 ) ) ( not ( = ?auto_54922 ?auto_54920 ) ) ( HOIST-AT ?auto_54911 ?auto_54922 ) ( not ( = ?auto_54904 ?auto_54911 ) ) ( AVAILABLE ?auto_54911 ) ( SURFACE-AT ?auto_54894 ?auto_54922 ) ( ON ?auto_54894 ?auto_54915 ) ( CLEAR ?auto_54894 ) ( not ( = ?auto_54894 ?auto_54915 ) ) ( not ( = ?auto_54895 ?auto_54915 ) ) ( IS-CRATE ?auto_54895 ) ( not ( = ?auto_54894 ?auto_54897 ) ) ( not ( = ?auto_54895 ?auto_54897 ) ) ( not ( = ?auto_54915 ?auto_54897 ) ) ( not ( = ?auto_54926 ?auto_54920 ) ) ( not ( = ?auto_54922 ?auto_54926 ) ) ( HOIST-AT ?auto_54916 ?auto_54926 ) ( not ( = ?auto_54904 ?auto_54916 ) ) ( not ( = ?auto_54911 ?auto_54916 ) ) ( SURFACE-AT ?auto_54895 ?auto_54926 ) ( ON ?auto_54895 ?auto_54909 ) ( CLEAR ?auto_54895 ) ( not ( = ?auto_54894 ?auto_54909 ) ) ( not ( = ?auto_54895 ?auto_54909 ) ) ( not ( = ?auto_54915 ?auto_54909 ) ) ( not ( = ?auto_54897 ?auto_54909 ) ) ( IS-CRATE ?auto_54897 ) ( not ( = ?auto_54894 ?auto_54901 ) ) ( not ( = ?auto_54895 ?auto_54901 ) ) ( not ( = ?auto_54915 ?auto_54901 ) ) ( not ( = ?auto_54897 ?auto_54901 ) ) ( not ( = ?auto_54909 ?auto_54901 ) ) ( not ( = ?auto_54907 ?auto_54920 ) ) ( not ( = ?auto_54922 ?auto_54907 ) ) ( not ( = ?auto_54926 ?auto_54907 ) ) ( HOIST-AT ?auto_54921 ?auto_54907 ) ( not ( = ?auto_54904 ?auto_54921 ) ) ( not ( = ?auto_54911 ?auto_54921 ) ) ( not ( = ?auto_54916 ?auto_54921 ) ) ( AVAILABLE ?auto_54921 ) ( SURFACE-AT ?auto_54897 ?auto_54907 ) ( ON ?auto_54897 ?auto_54906 ) ( CLEAR ?auto_54897 ) ( not ( = ?auto_54894 ?auto_54906 ) ) ( not ( = ?auto_54895 ?auto_54906 ) ) ( not ( = ?auto_54915 ?auto_54906 ) ) ( not ( = ?auto_54897 ?auto_54906 ) ) ( not ( = ?auto_54909 ?auto_54906 ) ) ( not ( = ?auto_54901 ?auto_54906 ) ) ( IS-CRATE ?auto_54901 ) ( not ( = ?auto_54894 ?auto_54917 ) ) ( not ( = ?auto_54895 ?auto_54917 ) ) ( not ( = ?auto_54915 ?auto_54917 ) ) ( not ( = ?auto_54897 ?auto_54917 ) ) ( not ( = ?auto_54909 ?auto_54917 ) ) ( not ( = ?auto_54901 ?auto_54917 ) ) ( not ( = ?auto_54906 ?auto_54917 ) ) ( not ( = ?auto_54910 ?auto_54920 ) ) ( not ( = ?auto_54922 ?auto_54910 ) ) ( not ( = ?auto_54926 ?auto_54910 ) ) ( not ( = ?auto_54907 ?auto_54910 ) ) ( HOIST-AT ?auto_54919 ?auto_54910 ) ( not ( = ?auto_54904 ?auto_54919 ) ) ( not ( = ?auto_54911 ?auto_54919 ) ) ( not ( = ?auto_54916 ?auto_54919 ) ) ( not ( = ?auto_54921 ?auto_54919 ) ) ( AVAILABLE ?auto_54919 ) ( SURFACE-AT ?auto_54901 ?auto_54910 ) ( ON ?auto_54901 ?auto_54927 ) ( CLEAR ?auto_54901 ) ( not ( = ?auto_54894 ?auto_54927 ) ) ( not ( = ?auto_54895 ?auto_54927 ) ) ( not ( = ?auto_54915 ?auto_54927 ) ) ( not ( = ?auto_54897 ?auto_54927 ) ) ( not ( = ?auto_54909 ?auto_54927 ) ) ( not ( = ?auto_54901 ?auto_54927 ) ) ( not ( = ?auto_54906 ?auto_54927 ) ) ( not ( = ?auto_54917 ?auto_54927 ) ) ( IS-CRATE ?auto_54917 ) ( not ( = ?auto_54894 ?auto_54896 ) ) ( not ( = ?auto_54895 ?auto_54896 ) ) ( not ( = ?auto_54915 ?auto_54896 ) ) ( not ( = ?auto_54897 ?auto_54896 ) ) ( not ( = ?auto_54909 ?auto_54896 ) ) ( not ( = ?auto_54901 ?auto_54896 ) ) ( not ( = ?auto_54906 ?auto_54896 ) ) ( not ( = ?auto_54917 ?auto_54896 ) ) ( not ( = ?auto_54927 ?auto_54896 ) ) ( AVAILABLE ?auto_54916 ) ( SURFACE-AT ?auto_54917 ?auto_54926 ) ( ON ?auto_54917 ?auto_54905 ) ( CLEAR ?auto_54917 ) ( not ( = ?auto_54894 ?auto_54905 ) ) ( not ( = ?auto_54895 ?auto_54905 ) ) ( not ( = ?auto_54915 ?auto_54905 ) ) ( not ( = ?auto_54897 ?auto_54905 ) ) ( not ( = ?auto_54909 ?auto_54905 ) ) ( not ( = ?auto_54901 ?auto_54905 ) ) ( not ( = ?auto_54906 ?auto_54905 ) ) ( not ( = ?auto_54917 ?auto_54905 ) ) ( not ( = ?auto_54927 ?auto_54905 ) ) ( not ( = ?auto_54896 ?auto_54905 ) ) ( IS-CRATE ?auto_54896 ) ( not ( = ?auto_54894 ?auto_54908 ) ) ( not ( = ?auto_54895 ?auto_54908 ) ) ( not ( = ?auto_54915 ?auto_54908 ) ) ( not ( = ?auto_54897 ?auto_54908 ) ) ( not ( = ?auto_54909 ?auto_54908 ) ) ( not ( = ?auto_54901 ?auto_54908 ) ) ( not ( = ?auto_54906 ?auto_54908 ) ) ( not ( = ?auto_54917 ?auto_54908 ) ) ( not ( = ?auto_54927 ?auto_54908 ) ) ( not ( = ?auto_54896 ?auto_54908 ) ) ( not ( = ?auto_54905 ?auto_54908 ) ) ( not ( = ?auto_54899 ?auto_54920 ) ) ( not ( = ?auto_54922 ?auto_54899 ) ) ( not ( = ?auto_54926 ?auto_54899 ) ) ( not ( = ?auto_54907 ?auto_54899 ) ) ( not ( = ?auto_54910 ?auto_54899 ) ) ( HOIST-AT ?auto_54900 ?auto_54899 ) ( not ( = ?auto_54904 ?auto_54900 ) ) ( not ( = ?auto_54911 ?auto_54900 ) ) ( not ( = ?auto_54916 ?auto_54900 ) ) ( not ( = ?auto_54921 ?auto_54900 ) ) ( not ( = ?auto_54919 ?auto_54900 ) ) ( AVAILABLE ?auto_54900 ) ( SURFACE-AT ?auto_54896 ?auto_54899 ) ( ON ?auto_54896 ?auto_54902 ) ( CLEAR ?auto_54896 ) ( not ( = ?auto_54894 ?auto_54902 ) ) ( not ( = ?auto_54895 ?auto_54902 ) ) ( not ( = ?auto_54915 ?auto_54902 ) ) ( not ( = ?auto_54897 ?auto_54902 ) ) ( not ( = ?auto_54909 ?auto_54902 ) ) ( not ( = ?auto_54901 ?auto_54902 ) ) ( not ( = ?auto_54906 ?auto_54902 ) ) ( not ( = ?auto_54917 ?auto_54902 ) ) ( not ( = ?auto_54927 ?auto_54902 ) ) ( not ( = ?auto_54896 ?auto_54902 ) ) ( not ( = ?auto_54905 ?auto_54902 ) ) ( not ( = ?auto_54908 ?auto_54902 ) ) ( IS-CRATE ?auto_54908 ) ( not ( = ?auto_54894 ?auto_54923 ) ) ( not ( = ?auto_54895 ?auto_54923 ) ) ( not ( = ?auto_54915 ?auto_54923 ) ) ( not ( = ?auto_54897 ?auto_54923 ) ) ( not ( = ?auto_54909 ?auto_54923 ) ) ( not ( = ?auto_54901 ?auto_54923 ) ) ( not ( = ?auto_54906 ?auto_54923 ) ) ( not ( = ?auto_54917 ?auto_54923 ) ) ( not ( = ?auto_54927 ?auto_54923 ) ) ( not ( = ?auto_54896 ?auto_54923 ) ) ( not ( = ?auto_54905 ?auto_54923 ) ) ( not ( = ?auto_54908 ?auto_54923 ) ) ( not ( = ?auto_54902 ?auto_54923 ) ) ( not ( = ?auto_54912 ?auto_54920 ) ) ( not ( = ?auto_54922 ?auto_54912 ) ) ( not ( = ?auto_54926 ?auto_54912 ) ) ( not ( = ?auto_54907 ?auto_54912 ) ) ( not ( = ?auto_54910 ?auto_54912 ) ) ( not ( = ?auto_54899 ?auto_54912 ) ) ( HOIST-AT ?auto_54913 ?auto_54912 ) ( not ( = ?auto_54904 ?auto_54913 ) ) ( not ( = ?auto_54911 ?auto_54913 ) ) ( not ( = ?auto_54916 ?auto_54913 ) ) ( not ( = ?auto_54921 ?auto_54913 ) ) ( not ( = ?auto_54919 ?auto_54913 ) ) ( not ( = ?auto_54900 ?auto_54913 ) ) ( AVAILABLE ?auto_54913 ) ( SURFACE-AT ?auto_54908 ?auto_54912 ) ( ON ?auto_54908 ?auto_54898 ) ( CLEAR ?auto_54908 ) ( not ( = ?auto_54894 ?auto_54898 ) ) ( not ( = ?auto_54895 ?auto_54898 ) ) ( not ( = ?auto_54915 ?auto_54898 ) ) ( not ( = ?auto_54897 ?auto_54898 ) ) ( not ( = ?auto_54909 ?auto_54898 ) ) ( not ( = ?auto_54901 ?auto_54898 ) ) ( not ( = ?auto_54906 ?auto_54898 ) ) ( not ( = ?auto_54917 ?auto_54898 ) ) ( not ( = ?auto_54927 ?auto_54898 ) ) ( not ( = ?auto_54896 ?auto_54898 ) ) ( not ( = ?auto_54905 ?auto_54898 ) ) ( not ( = ?auto_54908 ?auto_54898 ) ) ( not ( = ?auto_54902 ?auto_54898 ) ) ( not ( = ?auto_54923 ?auto_54898 ) ) ( IS-CRATE ?auto_54923 ) ( not ( = ?auto_54894 ?auto_54903 ) ) ( not ( = ?auto_54895 ?auto_54903 ) ) ( not ( = ?auto_54915 ?auto_54903 ) ) ( not ( = ?auto_54897 ?auto_54903 ) ) ( not ( = ?auto_54909 ?auto_54903 ) ) ( not ( = ?auto_54901 ?auto_54903 ) ) ( not ( = ?auto_54906 ?auto_54903 ) ) ( not ( = ?auto_54917 ?auto_54903 ) ) ( not ( = ?auto_54927 ?auto_54903 ) ) ( not ( = ?auto_54896 ?auto_54903 ) ) ( not ( = ?auto_54905 ?auto_54903 ) ) ( not ( = ?auto_54908 ?auto_54903 ) ) ( not ( = ?auto_54902 ?auto_54903 ) ) ( not ( = ?auto_54923 ?auto_54903 ) ) ( not ( = ?auto_54898 ?auto_54903 ) ) ( not ( = ?auto_54918 ?auto_54920 ) ) ( not ( = ?auto_54922 ?auto_54918 ) ) ( not ( = ?auto_54926 ?auto_54918 ) ) ( not ( = ?auto_54907 ?auto_54918 ) ) ( not ( = ?auto_54910 ?auto_54918 ) ) ( not ( = ?auto_54899 ?auto_54918 ) ) ( not ( = ?auto_54912 ?auto_54918 ) ) ( HOIST-AT ?auto_54914 ?auto_54918 ) ( not ( = ?auto_54904 ?auto_54914 ) ) ( not ( = ?auto_54911 ?auto_54914 ) ) ( not ( = ?auto_54916 ?auto_54914 ) ) ( not ( = ?auto_54921 ?auto_54914 ) ) ( not ( = ?auto_54919 ?auto_54914 ) ) ( not ( = ?auto_54900 ?auto_54914 ) ) ( not ( = ?auto_54913 ?auto_54914 ) ) ( AVAILABLE ?auto_54914 ) ( SURFACE-AT ?auto_54923 ?auto_54918 ) ( ON ?auto_54923 ?auto_54924 ) ( CLEAR ?auto_54923 ) ( not ( = ?auto_54894 ?auto_54924 ) ) ( not ( = ?auto_54895 ?auto_54924 ) ) ( not ( = ?auto_54915 ?auto_54924 ) ) ( not ( = ?auto_54897 ?auto_54924 ) ) ( not ( = ?auto_54909 ?auto_54924 ) ) ( not ( = ?auto_54901 ?auto_54924 ) ) ( not ( = ?auto_54906 ?auto_54924 ) ) ( not ( = ?auto_54917 ?auto_54924 ) ) ( not ( = ?auto_54927 ?auto_54924 ) ) ( not ( = ?auto_54896 ?auto_54924 ) ) ( not ( = ?auto_54905 ?auto_54924 ) ) ( not ( = ?auto_54908 ?auto_54924 ) ) ( not ( = ?auto_54902 ?auto_54924 ) ) ( not ( = ?auto_54923 ?auto_54924 ) ) ( not ( = ?auto_54898 ?auto_54924 ) ) ( not ( = ?auto_54903 ?auto_54924 ) ) ( SURFACE-AT ?auto_54925 ?auto_54920 ) ( CLEAR ?auto_54925 ) ( IS-CRATE ?auto_54903 ) ( not ( = ?auto_54894 ?auto_54925 ) ) ( not ( = ?auto_54895 ?auto_54925 ) ) ( not ( = ?auto_54915 ?auto_54925 ) ) ( not ( = ?auto_54897 ?auto_54925 ) ) ( not ( = ?auto_54909 ?auto_54925 ) ) ( not ( = ?auto_54901 ?auto_54925 ) ) ( not ( = ?auto_54906 ?auto_54925 ) ) ( not ( = ?auto_54917 ?auto_54925 ) ) ( not ( = ?auto_54927 ?auto_54925 ) ) ( not ( = ?auto_54896 ?auto_54925 ) ) ( not ( = ?auto_54905 ?auto_54925 ) ) ( not ( = ?auto_54908 ?auto_54925 ) ) ( not ( = ?auto_54902 ?auto_54925 ) ) ( not ( = ?auto_54923 ?auto_54925 ) ) ( not ( = ?auto_54898 ?auto_54925 ) ) ( not ( = ?auto_54903 ?auto_54925 ) ) ( not ( = ?auto_54924 ?auto_54925 ) ) ( AVAILABLE ?auto_54904 ) ( not ( = ?auto_54929 ?auto_54920 ) ) ( not ( = ?auto_54922 ?auto_54929 ) ) ( not ( = ?auto_54926 ?auto_54929 ) ) ( not ( = ?auto_54907 ?auto_54929 ) ) ( not ( = ?auto_54910 ?auto_54929 ) ) ( not ( = ?auto_54899 ?auto_54929 ) ) ( not ( = ?auto_54912 ?auto_54929 ) ) ( not ( = ?auto_54918 ?auto_54929 ) ) ( HOIST-AT ?auto_54928 ?auto_54929 ) ( not ( = ?auto_54904 ?auto_54928 ) ) ( not ( = ?auto_54911 ?auto_54928 ) ) ( not ( = ?auto_54916 ?auto_54928 ) ) ( not ( = ?auto_54921 ?auto_54928 ) ) ( not ( = ?auto_54919 ?auto_54928 ) ) ( not ( = ?auto_54900 ?auto_54928 ) ) ( not ( = ?auto_54913 ?auto_54928 ) ) ( not ( = ?auto_54914 ?auto_54928 ) ) ( AVAILABLE ?auto_54928 ) ( SURFACE-AT ?auto_54903 ?auto_54929 ) ( ON ?auto_54903 ?auto_54931 ) ( CLEAR ?auto_54903 ) ( not ( = ?auto_54894 ?auto_54931 ) ) ( not ( = ?auto_54895 ?auto_54931 ) ) ( not ( = ?auto_54915 ?auto_54931 ) ) ( not ( = ?auto_54897 ?auto_54931 ) ) ( not ( = ?auto_54909 ?auto_54931 ) ) ( not ( = ?auto_54901 ?auto_54931 ) ) ( not ( = ?auto_54906 ?auto_54931 ) ) ( not ( = ?auto_54917 ?auto_54931 ) ) ( not ( = ?auto_54927 ?auto_54931 ) ) ( not ( = ?auto_54896 ?auto_54931 ) ) ( not ( = ?auto_54905 ?auto_54931 ) ) ( not ( = ?auto_54908 ?auto_54931 ) ) ( not ( = ?auto_54902 ?auto_54931 ) ) ( not ( = ?auto_54923 ?auto_54931 ) ) ( not ( = ?auto_54898 ?auto_54931 ) ) ( not ( = ?auto_54903 ?auto_54931 ) ) ( not ( = ?auto_54924 ?auto_54931 ) ) ( not ( = ?auto_54925 ?auto_54931 ) ) ( TRUCK-AT ?auto_54930 ?auto_54920 ) )
    :subtasks
    ( ( !DRIVE ?auto_54930 ?auto_54920 ?auto_54929 )
      ( MAKE-ON ?auto_54894 ?auto_54895 )
      ( MAKE-ON-VERIFY ?auto_54894 ?auto_54895 ) )
  )

)

