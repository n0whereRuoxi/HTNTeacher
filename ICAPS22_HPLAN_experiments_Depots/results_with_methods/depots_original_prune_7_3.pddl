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
      ?auto_10379 - SURFACE
      ?auto_10380 - SURFACE
    )
    :vars
    (
      ?auto_10381 - HOIST
      ?auto_10382 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10381 ?auto_10382 ) ( SURFACE-AT ?auto_10380 ?auto_10382 ) ( CLEAR ?auto_10380 ) ( LIFTING ?auto_10381 ?auto_10379 ) ( IS-CRATE ?auto_10379 ) ( not ( = ?auto_10379 ?auto_10380 ) ) )
    :subtasks
    ( ( !DROP ?auto_10381 ?auto_10379 ?auto_10380 ?auto_10382 )
      ( MAKE-ON-VERIFY ?auto_10379 ?auto_10380 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10383 - SURFACE
      ?auto_10384 - SURFACE
    )
    :vars
    (
      ?auto_10385 - HOIST
      ?auto_10386 - PLACE
      ?auto_10387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10385 ?auto_10386 ) ( SURFACE-AT ?auto_10384 ?auto_10386 ) ( CLEAR ?auto_10384 ) ( IS-CRATE ?auto_10383 ) ( not ( = ?auto_10383 ?auto_10384 ) ) ( TRUCK-AT ?auto_10387 ?auto_10386 ) ( AVAILABLE ?auto_10385 ) ( IN ?auto_10383 ?auto_10387 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10385 ?auto_10383 ?auto_10387 ?auto_10386 )
      ( MAKE-ON ?auto_10383 ?auto_10384 )
      ( MAKE-ON-VERIFY ?auto_10383 ?auto_10384 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10388 - SURFACE
      ?auto_10389 - SURFACE
    )
    :vars
    (
      ?auto_10391 - HOIST
      ?auto_10390 - PLACE
      ?auto_10392 - TRUCK
      ?auto_10393 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10391 ?auto_10390 ) ( SURFACE-AT ?auto_10389 ?auto_10390 ) ( CLEAR ?auto_10389 ) ( IS-CRATE ?auto_10388 ) ( not ( = ?auto_10388 ?auto_10389 ) ) ( AVAILABLE ?auto_10391 ) ( IN ?auto_10388 ?auto_10392 ) ( TRUCK-AT ?auto_10392 ?auto_10393 ) ( not ( = ?auto_10393 ?auto_10390 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10392 ?auto_10393 ?auto_10390 )
      ( MAKE-ON ?auto_10388 ?auto_10389 )
      ( MAKE-ON-VERIFY ?auto_10388 ?auto_10389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10394 - SURFACE
      ?auto_10395 - SURFACE
    )
    :vars
    (
      ?auto_10396 - HOIST
      ?auto_10397 - PLACE
      ?auto_10398 - TRUCK
      ?auto_10399 - PLACE
      ?auto_10400 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10396 ?auto_10397 ) ( SURFACE-AT ?auto_10395 ?auto_10397 ) ( CLEAR ?auto_10395 ) ( IS-CRATE ?auto_10394 ) ( not ( = ?auto_10394 ?auto_10395 ) ) ( AVAILABLE ?auto_10396 ) ( TRUCK-AT ?auto_10398 ?auto_10399 ) ( not ( = ?auto_10399 ?auto_10397 ) ) ( HOIST-AT ?auto_10400 ?auto_10399 ) ( LIFTING ?auto_10400 ?auto_10394 ) ( not ( = ?auto_10396 ?auto_10400 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10400 ?auto_10394 ?auto_10398 ?auto_10399 )
      ( MAKE-ON ?auto_10394 ?auto_10395 )
      ( MAKE-ON-VERIFY ?auto_10394 ?auto_10395 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10401 - SURFACE
      ?auto_10402 - SURFACE
    )
    :vars
    (
      ?auto_10403 - HOIST
      ?auto_10407 - PLACE
      ?auto_10405 - TRUCK
      ?auto_10406 - PLACE
      ?auto_10404 - HOIST
      ?auto_10408 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10403 ?auto_10407 ) ( SURFACE-AT ?auto_10402 ?auto_10407 ) ( CLEAR ?auto_10402 ) ( IS-CRATE ?auto_10401 ) ( not ( = ?auto_10401 ?auto_10402 ) ) ( AVAILABLE ?auto_10403 ) ( TRUCK-AT ?auto_10405 ?auto_10406 ) ( not ( = ?auto_10406 ?auto_10407 ) ) ( HOIST-AT ?auto_10404 ?auto_10406 ) ( not ( = ?auto_10403 ?auto_10404 ) ) ( AVAILABLE ?auto_10404 ) ( SURFACE-AT ?auto_10401 ?auto_10406 ) ( ON ?auto_10401 ?auto_10408 ) ( CLEAR ?auto_10401 ) ( not ( = ?auto_10401 ?auto_10408 ) ) ( not ( = ?auto_10402 ?auto_10408 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10404 ?auto_10401 ?auto_10408 ?auto_10406 )
      ( MAKE-ON ?auto_10401 ?auto_10402 )
      ( MAKE-ON-VERIFY ?auto_10401 ?auto_10402 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10409 - SURFACE
      ?auto_10410 - SURFACE
    )
    :vars
    (
      ?auto_10416 - HOIST
      ?auto_10412 - PLACE
      ?auto_10415 - PLACE
      ?auto_10413 - HOIST
      ?auto_10411 - SURFACE
      ?auto_10414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10416 ?auto_10412 ) ( SURFACE-AT ?auto_10410 ?auto_10412 ) ( CLEAR ?auto_10410 ) ( IS-CRATE ?auto_10409 ) ( not ( = ?auto_10409 ?auto_10410 ) ) ( AVAILABLE ?auto_10416 ) ( not ( = ?auto_10415 ?auto_10412 ) ) ( HOIST-AT ?auto_10413 ?auto_10415 ) ( not ( = ?auto_10416 ?auto_10413 ) ) ( AVAILABLE ?auto_10413 ) ( SURFACE-AT ?auto_10409 ?auto_10415 ) ( ON ?auto_10409 ?auto_10411 ) ( CLEAR ?auto_10409 ) ( not ( = ?auto_10409 ?auto_10411 ) ) ( not ( = ?auto_10410 ?auto_10411 ) ) ( TRUCK-AT ?auto_10414 ?auto_10412 ) )
    :subtasks
    ( ( !DRIVE ?auto_10414 ?auto_10412 ?auto_10415 )
      ( MAKE-ON ?auto_10409 ?auto_10410 )
      ( MAKE-ON-VERIFY ?auto_10409 ?auto_10410 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10457 - SURFACE
      ?auto_10458 - SURFACE
    )
    :vars
    (
      ?auto_10464 - HOIST
      ?auto_10462 - PLACE
      ?auto_10461 - PLACE
      ?auto_10463 - HOIST
      ?auto_10459 - SURFACE
      ?auto_10460 - TRUCK
      ?auto_10465 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10464 ?auto_10462 ) ( IS-CRATE ?auto_10457 ) ( not ( = ?auto_10457 ?auto_10458 ) ) ( not ( = ?auto_10461 ?auto_10462 ) ) ( HOIST-AT ?auto_10463 ?auto_10461 ) ( not ( = ?auto_10464 ?auto_10463 ) ) ( AVAILABLE ?auto_10463 ) ( SURFACE-AT ?auto_10457 ?auto_10461 ) ( ON ?auto_10457 ?auto_10459 ) ( CLEAR ?auto_10457 ) ( not ( = ?auto_10457 ?auto_10459 ) ) ( not ( = ?auto_10458 ?auto_10459 ) ) ( TRUCK-AT ?auto_10460 ?auto_10462 ) ( SURFACE-AT ?auto_10465 ?auto_10462 ) ( CLEAR ?auto_10465 ) ( LIFTING ?auto_10464 ?auto_10458 ) ( IS-CRATE ?auto_10458 ) ( not ( = ?auto_10457 ?auto_10465 ) ) ( not ( = ?auto_10458 ?auto_10465 ) ) ( not ( = ?auto_10459 ?auto_10465 ) ) )
    :subtasks
    ( ( !DROP ?auto_10464 ?auto_10458 ?auto_10465 ?auto_10462 )
      ( MAKE-ON ?auto_10457 ?auto_10458 )
      ( MAKE-ON-VERIFY ?auto_10457 ?auto_10458 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10466 - SURFACE
      ?auto_10467 - SURFACE
    )
    :vars
    (
      ?auto_10469 - HOIST
      ?auto_10471 - PLACE
      ?auto_10468 - PLACE
      ?auto_10470 - HOIST
      ?auto_10474 - SURFACE
      ?auto_10472 - TRUCK
      ?auto_10473 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10469 ?auto_10471 ) ( IS-CRATE ?auto_10466 ) ( not ( = ?auto_10466 ?auto_10467 ) ) ( not ( = ?auto_10468 ?auto_10471 ) ) ( HOIST-AT ?auto_10470 ?auto_10468 ) ( not ( = ?auto_10469 ?auto_10470 ) ) ( AVAILABLE ?auto_10470 ) ( SURFACE-AT ?auto_10466 ?auto_10468 ) ( ON ?auto_10466 ?auto_10474 ) ( CLEAR ?auto_10466 ) ( not ( = ?auto_10466 ?auto_10474 ) ) ( not ( = ?auto_10467 ?auto_10474 ) ) ( TRUCK-AT ?auto_10472 ?auto_10471 ) ( SURFACE-AT ?auto_10473 ?auto_10471 ) ( CLEAR ?auto_10473 ) ( IS-CRATE ?auto_10467 ) ( not ( = ?auto_10466 ?auto_10473 ) ) ( not ( = ?auto_10467 ?auto_10473 ) ) ( not ( = ?auto_10474 ?auto_10473 ) ) ( AVAILABLE ?auto_10469 ) ( IN ?auto_10467 ?auto_10472 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10469 ?auto_10467 ?auto_10472 ?auto_10471 )
      ( MAKE-ON ?auto_10466 ?auto_10467 )
      ( MAKE-ON-VERIFY ?auto_10466 ?auto_10467 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10475 - SURFACE
      ?auto_10476 - SURFACE
    )
    :vars
    (
      ?auto_10481 - HOIST
      ?auto_10479 - PLACE
      ?auto_10482 - PLACE
      ?auto_10478 - HOIST
      ?auto_10477 - SURFACE
      ?auto_10483 - SURFACE
      ?auto_10480 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10481 ?auto_10479 ) ( IS-CRATE ?auto_10475 ) ( not ( = ?auto_10475 ?auto_10476 ) ) ( not ( = ?auto_10482 ?auto_10479 ) ) ( HOIST-AT ?auto_10478 ?auto_10482 ) ( not ( = ?auto_10481 ?auto_10478 ) ) ( AVAILABLE ?auto_10478 ) ( SURFACE-AT ?auto_10475 ?auto_10482 ) ( ON ?auto_10475 ?auto_10477 ) ( CLEAR ?auto_10475 ) ( not ( = ?auto_10475 ?auto_10477 ) ) ( not ( = ?auto_10476 ?auto_10477 ) ) ( SURFACE-AT ?auto_10483 ?auto_10479 ) ( CLEAR ?auto_10483 ) ( IS-CRATE ?auto_10476 ) ( not ( = ?auto_10475 ?auto_10483 ) ) ( not ( = ?auto_10476 ?auto_10483 ) ) ( not ( = ?auto_10477 ?auto_10483 ) ) ( AVAILABLE ?auto_10481 ) ( IN ?auto_10476 ?auto_10480 ) ( TRUCK-AT ?auto_10480 ?auto_10482 ) )
    :subtasks
    ( ( !DRIVE ?auto_10480 ?auto_10482 ?auto_10479 )
      ( MAKE-ON ?auto_10475 ?auto_10476 )
      ( MAKE-ON-VERIFY ?auto_10475 ?auto_10476 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10484 - SURFACE
      ?auto_10485 - SURFACE
    )
    :vars
    (
      ?auto_10486 - HOIST
      ?auto_10492 - PLACE
      ?auto_10490 - PLACE
      ?auto_10488 - HOIST
      ?auto_10489 - SURFACE
      ?auto_10487 - SURFACE
      ?auto_10491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10486 ?auto_10492 ) ( IS-CRATE ?auto_10484 ) ( not ( = ?auto_10484 ?auto_10485 ) ) ( not ( = ?auto_10490 ?auto_10492 ) ) ( HOIST-AT ?auto_10488 ?auto_10490 ) ( not ( = ?auto_10486 ?auto_10488 ) ) ( SURFACE-AT ?auto_10484 ?auto_10490 ) ( ON ?auto_10484 ?auto_10489 ) ( CLEAR ?auto_10484 ) ( not ( = ?auto_10484 ?auto_10489 ) ) ( not ( = ?auto_10485 ?auto_10489 ) ) ( SURFACE-AT ?auto_10487 ?auto_10492 ) ( CLEAR ?auto_10487 ) ( IS-CRATE ?auto_10485 ) ( not ( = ?auto_10484 ?auto_10487 ) ) ( not ( = ?auto_10485 ?auto_10487 ) ) ( not ( = ?auto_10489 ?auto_10487 ) ) ( AVAILABLE ?auto_10486 ) ( TRUCK-AT ?auto_10491 ?auto_10490 ) ( LIFTING ?auto_10488 ?auto_10485 ) )
    :subtasks
    ( ( !LOAD ?auto_10488 ?auto_10485 ?auto_10491 ?auto_10490 )
      ( MAKE-ON ?auto_10484 ?auto_10485 )
      ( MAKE-ON-VERIFY ?auto_10484 ?auto_10485 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10493 - SURFACE
      ?auto_10494 - SURFACE
    )
    :vars
    (
      ?auto_10500 - HOIST
      ?auto_10498 - PLACE
      ?auto_10499 - PLACE
      ?auto_10495 - HOIST
      ?auto_10497 - SURFACE
      ?auto_10501 - SURFACE
      ?auto_10496 - TRUCK
      ?auto_10502 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10500 ?auto_10498 ) ( IS-CRATE ?auto_10493 ) ( not ( = ?auto_10493 ?auto_10494 ) ) ( not ( = ?auto_10499 ?auto_10498 ) ) ( HOIST-AT ?auto_10495 ?auto_10499 ) ( not ( = ?auto_10500 ?auto_10495 ) ) ( SURFACE-AT ?auto_10493 ?auto_10499 ) ( ON ?auto_10493 ?auto_10497 ) ( CLEAR ?auto_10493 ) ( not ( = ?auto_10493 ?auto_10497 ) ) ( not ( = ?auto_10494 ?auto_10497 ) ) ( SURFACE-AT ?auto_10501 ?auto_10498 ) ( CLEAR ?auto_10501 ) ( IS-CRATE ?auto_10494 ) ( not ( = ?auto_10493 ?auto_10501 ) ) ( not ( = ?auto_10494 ?auto_10501 ) ) ( not ( = ?auto_10497 ?auto_10501 ) ) ( AVAILABLE ?auto_10500 ) ( TRUCK-AT ?auto_10496 ?auto_10499 ) ( AVAILABLE ?auto_10495 ) ( SURFACE-AT ?auto_10494 ?auto_10499 ) ( ON ?auto_10494 ?auto_10502 ) ( CLEAR ?auto_10494 ) ( not ( = ?auto_10493 ?auto_10502 ) ) ( not ( = ?auto_10494 ?auto_10502 ) ) ( not ( = ?auto_10497 ?auto_10502 ) ) ( not ( = ?auto_10501 ?auto_10502 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10495 ?auto_10494 ?auto_10502 ?auto_10499 )
      ( MAKE-ON ?auto_10493 ?auto_10494 )
      ( MAKE-ON-VERIFY ?auto_10493 ?auto_10494 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10503 - SURFACE
      ?auto_10504 - SURFACE
    )
    :vars
    (
      ?auto_10505 - HOIST
      ?auto_10506 - PLACE
      ?auto_10510 - PLACE
      ?auto_10512 - HOIST
      ?auto_10511 - SURFACE
      ?auto_10507 - SURFACE
      ?auto_10508 - SURFACE
      ?auto_10509 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10505 ?auto_10506 ) ( IS-CRATE ?auto_10503 ) ( not ( = ?auto_10503 ?auto_10504 ) ) ( not ( = ?auto_10510 ?auto_10506 ) ) ( HOIST-AT ?auto_10512 ?auto_10510 ) ( not ( = ?auto_10505 ?auto_10512 ) ) ( SURFACE-AT ?auto_10503 ?auto_10510 ) ( ON ?auto_10503 ?auto_10511 ) ( CLEAR ?auto_10503 ) ( not ( = ?auto_10503 ?auto_10511 ) ) ( not ( = ?auto_10504 ?auto_10511 ) ) ( SURFACE-AT ?auto_10507 ?auto_10506 ) ( CLEAR ?auto_10507 ) ( IS-CRATE ?auto_10504 ) ( not ( = ?auto_10503 ?auto_10507 ) ) ( not ( = ?auto_10504 ?auto_10507 ) ) ( not ( = ?auto_10511 ?auto_10507 ) ) ( AVAILABLE ?auto_10505 ) ( AVAILABLE ?auto_10512 ) ( SURFACE-AT ?auto_10504 ?auto_10510 ) ( ON ?auto_10504 ?auto_10508 ) ( CLEAR ?auto_10504 ) ( not ( = ?auto_10503 ?auto_10508 ) ) ( not ( = ?auto_10504 ?auto_10508 ) ) ( not ( = ?auto_10511 ?auto_10508 ) ) ( not ( = ?auto_10507 ?auto_10508 ) ) ( TRUCK-AT ?auto_10509 ?auto_10506 ) )
    :subtasks
    ( ( !DRIVE ?auto_10509 ?auto_10506 ?auto_10510 )
      ( MAKE-ON ?auto_10503 ?auto_10504 )
      ( MAKE-ON-VERIFY ?auto_10503 ?auto_10504 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10577 - SURFACE
      ?auto_10578 - SURFACE
    )
    :vars
    (
      ?auto_10579 - HOIST
      ?auto_10584 - PLACE
      ?auto_10582 - PLACE
      ?auto_10583 - HOIST
      ?auto_10580 - SURFACE
      ?auto_10581 - TRUCK
      ?auto_10585 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10579 ?auto_10584 ) ( SURFACE-AT ?auto_10578 ?auto_10584 ) ( CLEAR ?auto_10578 ) ( IS-CRATE ?auto_10577 ) ( not ( = ?auto_10577 ?auto_10578 ) ) ( AVAILABLE ?auto_10579 ) ( not ( = ?auto_10582 ?auto_10584 ) ) ( HOIST-AT ?auto_10583 ?auto_10582 ) ( not ( = ?auto_10579 ?auto_10583 ) ) ( AVAILABLE ?auto_10583 ) ( SURFACE-AT ?auto_10577 ?auto_10582 ) ( ON ?auto_10577 ?auto_10580 ) ( CLEAR ?auto_10577 ) ( not ( = ?auto_10577 ?auto_10580 ) ) ( not ( = ?auto_10578 ?auto_10580 ) ) ( TRUCK-AT ?auto_10581 ?auto_10585 ) ( not ( = ?auto_10585 ?auto_10584 ) ) ( not ( = ?auto_10582 ?auto_10585 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10581 ?auto_10585 ?auto_10584 )
      ( MAKE-ON ?auto_10577 ?auto_10578 )
      ( MAKE-ON-VERIFY ?auto_10577 ?auto_10578 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10592 - SURFACE
      ?auto_10593 - SURFACE
    )
    :vars
    (
      ?auto_10594 - HOIST
      ?auto_10595 - PLACE
      ?auto_10598 - PLACE
      ?auto_10597 - HOIST
      ?auto_10596 - SURFACE
      ?auto_10599 - TRUCK
      ?auto_10600 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10594 ?auto_10595 ) ( SURFACE-AT ?auto_10593 ?auto_10595 ) ( CLEAR ?auto_10593 ) ( IS-CRATE ?auto_10592 ) ( not ( = ?auto_10592 ?auto_10593 ) ) ( not ( = ?auto_10598 ?auto_10595 ) ) ( HOIST-AT ?auto_10597 ?auto_10598 ) ( not ( = ?auto_10594 ?auto_10597 ) ) ( AVAILABLE ?auto_10597 ) ( SURFACE-AT ?auto_10592 ?auto_10598 ) ( ON ?auto_10592 ?auto_10596 ) ( CLEAR ?auto_10592 ) ( not ( = ?auto_10592 ?auto_10596 ) ) ( not ( = ?auto_10593 ?auto_10596 ) ) ( TRUCK-AT ?auto_10599 ?auto_10595 ) ( LIFTING ?auto_10594 ?auto_10600 ) ( IS-CRATE ?auto_10600 ) ( not ( = ?auto_10592 ?auto_10600 ) ) ( not ( = ?auto_10593 ?auto_10600 ) ) ( not ( = ?auto_10596 ?auto_10600 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10594 ?auto_10600 ?auto_10599 ?auto_10595 )
      ( MAKE-ON ?auto_10592 ?auto_10593 )
      ( MAKE-ON-VERIFY ?auto_10592 ?auto_10593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10701 - SURFACE
      ?auto_10702 - SURFACE
    )
    :vars
    (
      ?auto_10704 - HOIST
      ?auto_10709 - PLACE
      ?auto_10710 - PLACE
      ?auto_10703 - HOIST
      ?auto_10706 - SURFACE
      ?auto_10705 - SURFACE
      ?auto_10708 - SURFACE
      ?auto_10707 - TRUCK
      ?auto_10711 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10704 ?auto_10709 ) ( IS-CRATE ?auto_10701 ) ( not ( = ?auto_10701 ?auto_10702 ) ) ( not ( = ?auto_10710 ?auto_10709 ) ) ( HOIST-AT ?auto_10703 ?auto_10710 ) ( not ( = ?auto_10704 ?auto_10703 ) ) ( SURFACE-AT ?auto_10701 ?auto_10710 ) ( ON ?auto_10701 ?auto_10706 ) ( CLEAR ?auto_10701 ) ( not ( = ?auto_10701 ?auto_10706 ) ) ( not ( = ?auto_10702 ?auto_10706 ) ) ( IS-CRATE ?auto_10702 ) ( not ( = ?auto_10701 ?auto_10705 ) ) ( not ( = ?auto_10702 ?auto_10705 ) ) ( not ( = ?auto_10706 ?auto_10705 ) ) ( AVAILABLE ?auto_10703 ) ( SURFACE-AT ?auto_10702 ?auto_10710 ) ( ON ?auto_10702 ?auto_10708 ) ( CLEAR ?auto_10702 ) ( not ( = ?auto_10701 ?auto_10708 ) ) ( not ( = ?auto_10702 ?auto_10708 ) ) ( not ( = ?auto_10706 ?auto_10708 ) ) ( not ( = ?auto_10705 ?auto_10708 ) ) ( TRUCK-AT ?auto_10707 ?auto_10709 ) ( SURFACE-AT ?auto_10711 ?auto_10709 ) ( CLEAR ?auto_10711 ) ( LIFTING ?auto_10704 ?auto_10705 ) ( IS-CRATE ?auto_10705 ) ( not ( = ?auto_10701 ?auto_10711 ) ) ( not ( = ?auto_10702 ?auto_10711 ) ) ( not ( = ?auto_10706 ?auto_10711 ) ) ( not ( = ?auto_10705 ?auto_10711 ) ) ( not ( = ?auto_10708 ?auto_10711 ) ) )
    :subtasks
    ( ( !DROP ?auto_10704 ?auto_10705 ?auto_10711 ?auto_10709 )
      ( MAKE-ON ?auto_10701 ?auto_10702 )
      ( MAKE-ON-VERIFY ?auto_10701 ?auto_10702 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_10953 - SURFACE
      ?auto_10954 - SURFACE
    )
    :vars
    (
      ?auto_10957 - HOIST
      ?auto_10959 - PLACE
      ?auto_10960 - TRUCK
      ?auto_10956 - PLACE
      ?auto_10955 - HOIST
      ?auto_10958 - SURFACE
      ?auto_10961 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10957 ?auto_10959 ) ( SURFACE-AT ?auto_10954 ?auto_10959 ) ( CLEAR ?auto_10954 ) ( IS-CRATE ?auto_10953 ) ( not ( = ?auto_10953 ?auto_10954 ) ) ( AVAILABLE ?auto_10957 ) ( TRUCK-AT ?auto_10960 ?auto_10956 ) ( not ( = ?auto_10956 ?auto_10959 ) ) ( HOIST-AT ?auto_10955 ?auto_10956 ) ( not ( = ?auto_10957 ?auto_10955 ) ) ( SURFACE-AT ?auto_10953 ?auto_10956 ) ( ON ?auto_10953 ?auto_10958 ) ( CLEAR ?auto_10953 ) ( not ( = ?auto_10953 ?auto_10958 ) ) ( not ( = ?auto_10954 ?auto_10958 ) ) ( LIFTING ?auto_10955 ?auto_10961 ) ( IS-CRATE ?auto_10961 ) ( not ( = ?auto_10953 ?auto_10961 ) ) ( not ( = ?auto_10954 ?auto_10961 ) ) ( not ( = ?auto_10958 ?auto_10961 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10955 ?auto_10961 ?auto_10960 ?auto_10956 )
      ( MAKE-ON ?auto_10953 ?auto_10954 )
      ( MAKE-ON-VERIFY ?auto_10953 ?auto_10954 ) )
  )

)

