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
      ?auto_27469 - SURFACE
      ?auto_27470 - SURFACE
    )
    :vars
    (
      ?auto_27471 - HOIST
      ?auto_27472 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27471 ?auto_27472 ) ( SURFACE-AT ?auto_27470 ?auto_27472 ) ( CLEAR ?auto_27470 ) ( LIFTING ?auto_27471 ?auto_27469 ) ( IS-CRATE ?auto_27469 ) ( not ( = ?auto_27469 ?auto_27470 ) ) )
    :subtasks
    ( ( !DROP ?auto_27471 ?auto_27469 ?auto_27470 ?auto_27472 )
      ( MAKE-ON-VERIFY ?auto_27469 ?auto_27470 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27473 - SURFACE
      ?auto_27474 - SURFACE
    )
    :vars
    (
      ?auto_27476 - HOIST
      ?auto_27475 - PLACE
      ?auto_27477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27476 ?auto_27475 ) ( SURFACE-AT ?auto_27474 ?auto_27475 ) ( CLEAR ?auto_27474 ) ( IS-CRATE ?auto_27473 ) ( not ( = ?auto_27473 ?auto_27474 ) ) ( TRUCK-AT ?auto_27477 ?auto_27475 ) ( AVAILABLE ?auto_27476 ) ( IN ?auto_27473 ?auto_27477 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27476 ?auto_27473 ?auto_27477 ?auto_27475 )
      ( MAKE-ON ?auto_27473 ?auto_27474 )
      ( MAKE-ON-VERIFY ?auto_27473 ?auto_27474 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27478 - SURFACE
      ?auto_27479 - SURFACE
    )
    :vars
    (
      ?auto_27482 - HOIST
      ?auto_27481 - PLACE
      ?auto_27480 - TRUCK
      ?auto_27483 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27482 ?auto_27481 ) ( SURFACE-AT ?auto_27479 ?auto_27481 ) ( CLEAR ?auto_27479 ) ( IS-CRATE ?auto_27478 ) ( not ( = ?auto_27478 ?auto_27479 ) ) ( AVAILABLE ?auto_27482 ) ( IN ?auto_27478 ?auto_27480 ) ( TRUCK-AT ?auto_27480 ?auto_27483 ) ( not ( = ?auto_27483 ?auto_27481 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27480 ?auto_27483 ?auto_27481 )
      ( MAKE-ON ?auto_27478 ?auto_27479 )
      ( MAKE-ON-VERIFY ?auto_27478 ?auto_27479 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27484 - SURFACE
      ?auto_27485 - SURFACE
    )
    :vars
    (
      ?auto_27487 - HOIST
      ?auto_27489 - PLACE
      ?auto_27486 - TRUCK
      ?auto_27488 - PLACE
      ?auto_27490 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27487 ?auto_27489 ) ( SURFACE-AT ?auto_27485 ?auto_27489 ) ( CLEAR ?auto_27485 ) ( IS-CRATE ?auto_27484 ) ( not ( = ?auto_27484 ?auto_27485 ) ) ( AVAILABLE ?auto_27487 ) ( TRUCK-AT ?auto_27486 ?auto_27488 ) ( not ( = ?auto_27488 ?auto_27489 ) ) ( HOIST-AT ?auto_27490 ?auto_27488 ) ( LIFTING ?auto_27490 ?auto_27484 ) ( not ( = ?auto_27487 ?auto_27490 ) ) )
    :subtasks
    ( ( !LOAD ?auto_27490 ?auto_27484 ?auto_27486 ?auto_27488 )
      ( MAKE-ON ?auto_27484 ?auto_27485 )
      ( MAKE-ON-VERIFY ?auto_27484 ?auto_27485 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27491 - SURFACE
      ?auto_27492 - SURFACE
    )
    :vars
    (
      ?auto_27496 - HOIST
      ?auto_27494 - PLACE
      ?auto_27495 - TRUCK
      ?auto_27497 - PLACE
      ?auto_27493 - HOIST
      ?auto_27498 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27496 ?auto_27494 ) ( SURFACE-AT ?auto_27492 ?auto_27494 ) ( CLEAR ?auto_27492 ) ( IS-CRATE ?auto_27491 ) ( not ( = ?auto_27491 ?auto_27492 ) ) ( AVAILABLE ?auto_27496 ) ( TRUCK-AT ?auto_27495 ?auto_27497 ) ( not ( = ?auto_27497 ?auto_27494 ) ) ( HOIST-AT ?auto_27493 ?auto_27497 ) ( not ( = ?auto_27496 ?auto_27493 ) ) ( AVAILABLE ?auto_27493 ) ( SURFACE-AT ?auto_27491 ?auto_27497 ) ( ON ?auto_27491 ?auto_27498 ) ( CLEAR ?auto_27491 ) ( not ( = ?auto_27491 ?auto_27498 ) ) ( not ( = ?auto_27492 ?auto_27498 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27493 ?auto_27491 ?auto_27498 ?auto_27497 )
      ( MAKE-ON ?auto_27491 ?auto_27492 )
      ( MAKE-ON-VERIFY ?auto_27491 ?auto_27492 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27499 - SURFACE
      ?auto_27500 - SURFACE
    )
    :vars
    (
      ?auto_27503 - HOIST
      ?auto_27504 - PLACE
      ?auto_27505 - PLACE
      ?auto_27506 - HOIST
      ?auto_27501 - SURFACE
      ?auto_27502 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27503 ?auto_27504 ) ( SURFACE-AT ?auto_27500 ?auto_27504 ) ( CLEAR ?auto_27500 ) ( IS-CRATE ?auto_27499 ) ( not ( = ?auto_27499 ?auto_27500 ) ) ( AVAILABLE ?auto_27503 ) ( not ( = ?auto_27505 ?auto_27504 ) ) ( HOIST-AT ?auto_27506 ?auto_27505 ) ( not ( = ?auto_27503 ?auto_27506 ) ) ( AVAILABLE ?auto_27506 ) ( SURFACE-AT ?auto_27499 ?auto_27505 ) ( ON ?auto_27499 ?auto_27501 ) ( CLEAR ?auto_27499 ) ( not ( = ?auto_27499 ?auto_27501 ) ) ( not ( = ?auto_27500 ?auto_27501 ) ) ( TRUCK-AT ?auto_27502 ?auto_27504 ) )
    :subtasks
    ( ( !DRIVE ?auto_27502 ?auto_27504 ?auto_27505 )
      ( MAKE-ON ?auto_27499 ?auto_27500 )
      ( MAKE-ON-VERIFY ?auto_27499 ?auto_27500 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27509 - SURFACE
      ?auto_27510 - SURFACE
    )
    :vars
    (
      ?auto_27511 - HOIST
      ?auto_27512 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27511 ?auto_27512 ) ( SURFACE-AT ?auto_27510 ?auto_27512 ) ( CLEAR ?auto_27510 ) ( LIFTING ?auto_27511 ?auto_27509 ) ( IS-CRATE ?auto_27509 ) ( not ( = ?auto_27509 ?auto_27510 ) ) )
    :subtasks
    ( ( !DROP ?auto_27511 ?auto_27509 ?auto_27510 ?auto_27512 )
      ( MAKE-ON-VERIFY ?auto_27509 ?auto_27510 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27513 - SURFACE
      ?auto_27514 - SURFACE
    )
    :vars
    (
      ?auto_27516 - HOIST
      ?auto_27515 - PLACE
      ?auto_27517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27516 ?auto_27515 ) ( SURFACE-AT ?auto_27514 ?auto_27515 ) ( CLEAR ?auto_27514 ) ( IS-CRATE ?auto_27513 ) ( not ( = ?auto_27513 ?auto_27514 ) ) ( TRUCK-AT ?auto_27517 ?auto_27515 ) ( AVAILABLE ?auto_27516 ) ( IN ?auto_27513 ?auto_27517 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27516 ?auto_27513 ?auto_27517 ?auto_27515 )
      ( MAKE-ON ?auto_27513 ?auto_27514 )
      ( MAKE-ON-VERIFY ?auto_27513 ?auto_27514 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27518 - SURFACE
      ?auto_27519 - SURFACE
    )
    :vars
    (
      ?auto_27521 - HOIST
      ?auto_27522 - PLACE
      ?auto_27520 - TRUCK
      ?auto_27523 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27521 ?auto_27522 ) ( SURFACE-AT ?auto_27519 ?auto_27522 ) ( CLEAR ?auto_27519 ) ( IS-CRATE ?auto_27518 ) ( not ( = ?auto_27518 ?auto_27519 ) ) ( AVAILABLE ?auto_27521 ) ( IN ?auto_27518 ?auto_27520 ) ( TRUCK-AT ?auto_27520 ?auto_27523 ) ( not ( = ?auto_27523 ?auto_27522 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27520 ?auto_27523 ?auto_27522 )
      ( MAKE-ON ?auto_27518 ?auto_27519 )
      ( MAKE-ON-VERIFY ?auto_27518 ?auto_27519 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27524 - SURFACE
      ?auto_27525 - SURFACE
    )
    :vars
    (
      ?auto_27528 - HOIST
      ?auto_27529 - PLACE
      ?auto_27527 - TRUCK
      ?auto_27526 - PLACE
      ?auto_27530 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27528 ?auto_27529 ) ( SURFACE-AT ?auto_27525 ?auto_27529 ) ( CLEAR ?auto_27525 ) ( IS-CRATE ?auto_27524 ) ( not ( = ?auto_27524 ?auto_27525 ) ) ( AVAILABLE ?auto_27528 ) ( TRUCK-AT ?auto_27527 ?auto_27526 ) ( not ( = ?auto_27526 ?auto_27529 ) ) ( HOIST-AT ?auto_27530 ?auto_27526 ) ( LIFTING ?auto_27530 ?auto_27524 ) ( not ( = ?auto_27528 ?auto_27530 ) ) )
    :subtasks
    ( ( !LOAD ?auto_27530 ?auto_27524 ?auto_27527 ?auto_27526 )
      ( MAKE-ON ?auto_27524 ?auto_27525 )
      ( MAKE-ON-VERIFY ?auto_27524 ?auto_27525 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27531 - SURFACE
      ?auto_27532 - SURFACE
    )
    :vars
    (
      ?auto_27534 - HOIST
      ?auto_27536 - PLACE
      ?auto_27533 - TRUCK
      ?auto_27537 - PLACE
      ?auto_27535 - HOIST
      ?auto_27538 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27534 ?auto_27536 ) ( SURFACE-AT ?auto_27532 ?auto_27536 ) ( CLEAR ?auto_27532 ) ( IS-CRATE ?auto_27531 ) ( not ( = ?auto_27531 ?auto_27532 ) ) ( AVAILABLE ?auto_27534 ) ( TRUCK-AT ?auto_27533 ?auto_27537 ) ( not ( = ?auto_27537 ?auto_27536 ) ) ( HOIST-AT ?auto_27535 ?auto_27537 ) ( not ( = ?auto_27534 ?auto_27535 ) ) ( AVAILABLE ?auto_27535 ) ( SURFACE-AT ?auto_27531 ?auto_27537 ) ( ON ?auto_27531 ?auto_27538 ) ( CLEAR ?auto_27531 ) ( not ( = ?auto_27531 ?auto_27538 ) ) ( not ( = ?auto_27532 ?auto_27538 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27535 ?auto_27531 ?auto_27538 ?auto_27537 )
      ( MAKE-ON ?auto_27531 ?auto_27532 )
      ( MAKE-ON-VERIFY ?auto_27531 ?auto_27532 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27539 - SURFACE
      ?auto_27540 - SURFACE
    )
    :vars
    (
      ?auto_27542 - HOIST
      ?auto_27541 - PLACE
      ?auto_27543 - PLACE
      ?auto_27545 - HOIST
      ?auto_27546 - SURFACE
      ?auto_27544 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27542 ?auto_27541 ) ( SURFACE-AT ?auto_27540 ?auto_27541 ) ( CLEAR ?auto_27540 ) ( IS-CRATE ?auto_27539 ) ( not ( = ?auto_27539 ?auto_27540 ) ) ( AVAILABLE ?auto_27542 ) ( not ( = ?auto_27543 ?auto_27541 ) ) ( HOIST-AT ?auto_27545 ?auto_27543 ) ( not ( = ?auto_27542 ?auto_27545 ) ) ( AVAILABLE ?auto_27545 ) ( SURFACE-AT ?auto_27539 ?auto_27543 ) ( ON ?auto_27539 ?auto_27546 ) ( CLEAR ?auto_27539 ) ( not ( = ?auto_27539 ?auto_27546 ) ) ( not ( = ?auto_27540 ?auto_27546 ) ) ( TRUCK-AT ?auto_27544 ?auto_27541 ) )
    :subtasks
    ( ( !DRIVE ?auto_27544 ?auto_27541 ?auto_27543 )
      ( MAKE-ON ?auto_27539 ?auto_27540 )
      ( MAKE-ON-VERIFY ?auto_27539 ?auto_27540 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27547 - SURFACE
      ?auto_27548 - SURFACE
    )
    :vars
    (
      ?auto_27552 - HOIST
      ?auto_27549 - PLACE
      ?auto_27551 - PLACE
      ?auto_27554 - HOIST
      ?auto_27553 - SURFACE
      ?auto_27550 - TRUCK
      ?auto_27555 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27552 ?auto_27549 ) ( IS-CRATE ?auto_27547 ) ( not ( = ?auto_27547 ?auto_27548 ) ) ( not ( = ?auto_27551 ?auto_27549 ) ) ( HOIST-AT ?auto_27554 ?auto_27551 ) ( not ( = ?auto_27552 ?auto_27554 ) ) ( AVAILABLE ?auto_27554 ) ( SURFACE-AT ?auto_27547 ?auto_27551 ) ( ON ?auto_27547 ?auto_27553 ) ( CLEAR ?auto_27547 ) ( not ( = ?auto_27547 ?auto_27553 ) ) ( not ( = ?auto_27548 ?auto_27553 ) ) ( TRUCK-AT ?auto_27550 ?auto_27549 ) ( SURFACE-AT ?auto_27555 ?auto_27549 ) ( CLEAR ?auto_27555 ) ( LIFTING ?auto_27552 ?auto_27548 ) ( IS-CRATE ?auto_27548 ) ( not ( = ?auto_27547 ?auto_27555 ) ) ( not ( = ?auto_27548 ?auto_27555 ) ) ( not ( = ?auto_27553 ?auto_27555 ) ) )
    :subtasks
    ( ( !DROP ?auto_27552 ?auto_27548 ?auto_27555 ?auto_27549 )
      ( MAKE-ON ?auto_27547 ?auto_27548 )
      ( MAKE-ON-VERIFY ?auto_27547 ?auto_27548 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27556 - SURFACE
      ?auto_27557 - SURFACE
    )
    :vars
    (
      ?auto_27561 - HOIST
      ?auto_27559 - PLACE
      ?auto_27562 - PLACE
      ?auto_27563 - HOIST
      ?auto_27560 - SURFACE
      ?auto_27564 - TRUCK
      ?auto_27558 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27561 ?auto_27559 ) ( IS-CRATE ?auto_27556 ) ( not ( = ?auto_27556 ?auto_27557 ) ) ( not ( = ?auto_27562 ?auto_27559 ) ) ( HOIST-AT ?auto_27563 ?auto_27562 ) ( not ( = ?auto_27561 ?auto_27563 ) ) ( AVAILABLE ?auto_27563 ) ( SURFACE-AT ?auto_27556 ?auto_27562 ) ( ON ?auto_27556 ?auto_27560 ) ( CLEAR ?auto_27556 ) ( not ( = ?auto_27556 ?auto_27560 ) ) ( not ( = ?auto_27557 ?auto_27560 ) ) ( TRUCK-AT ?auto_27564 ?auto_27559 ) ( SURFACE-AT ?auto_27558 ?auto_27559 ) ( CLEAR ?auto_27558 ) ( IS-CRATE ?auto_27557 ) ( not ( = ?auto_27556 ?auto_27558 ) ) ( not ( = ?auto_27557 ?auto_27558 ) ) ( not ( = ?auto_27560 ?auto_27558 ) ) ( AVAILABLE ?auto_27561 ) ( IN ?auto_27557 ?auto_27564 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27561 ?auto_27557 ?auto_27564 ?auto_27559 )
      ( MAKE-ON ?auto_27556 ?auto_27557 )
      ( MAKE-ON-VERIFY ?auto_27556 ?auto_27557 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27565 - SURFACE
      ?auto_27566 - SURFACE
    )
    :vars
    (
      ?auto_27570 - HOIST
      ?auto_27571 - PLACE
      ?auto_27573 - PLACE
      ?auto_27568 - HOIST
      ?auto_27572 - SURFACE
      ?auto_27569 - SURFACE
      ?auto_27567 - TRUCK
      ?auto_27574 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27570 ?auto_27571 ) ( IS-CRATE ?auto_27565 ) ( not ( = ?auto_27565 ?auto_27566 ) ) ( not ( = ?auto_27573 ?auto_27571 ) ) ( HOIST-AT ?auto_27568 ?auto_27573 ) ( not ( = ?auto_27570 ?auto_27568 ) ) ( AVAILABLE ?auto_27568 ) ( SURFACE-AT ?auto_27565 ?auto_27573 ) ( ON ?auto_27565 ?auto_27572 ) ( CLEAR ?auto_27565 ) ( not ( = ?auto_27565 ?auto_27572 ) ) ( not ( = ?auto_27566 ?auto_27572 ) ) ( SURFACE-AT ?auto_27569 ?auto_27571 ) ( CLEAR ?auto_27569 ) ( IS-CRATE ?auto_27566 ) ( not ( = ?auto_27565 ?auto_27569 ) ) ( not ( = ?auto_27566 ?auto_27569 ) ) ( not ( = ?auto_27572 ?auto_27569 ) ) ( AVAILABLE ?auto_27570 ) ( IN ?auto_27566 ?auto_27567 ) ( TRUCK-AT ?auto_27567 ?auto_27574 ) ( not ( = ?auto_27574 ?auto_27571 ) ) ( not ( = ?auto_27573 ?auto_27574 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27567 ?auto_27574 ?auto_27571 )
      ( MAKE-ON ?auto_27565 ?auto_27566 )
      ( MAKE-ON-VERIFY ?auto_27565 ?auto_27566 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27575 - SURFACE
      ?auto_27576 - SURFACE
    )
    :vars
    (
      ?auto_27582 - HOIST
      ?auto_27577 - PLACE
      ?auto_27580 - PLACE
      ?auto_27581 - HOIST
      ?auto_27584 - SURFACE
      ?auto_27579 - SURFACE
      ?auto_27578 - TRUCK
      ?auto_27583 - PLACE
      ?auto_27585 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27582 ?auto_27577 ) ( IS-CRATE ?auto_27575 ) ( not ( = ?auto_27575 ?auto_27576 ) ) ( not ( = ?auto_27580 ?auto_27577 ) ) ( HOIST-AT ?auto_27581 ?auto_27580 ) ( not ( = ?auto_27582 ?auto_27581 ) ) ( AVAILABLE ?auto_27581 ) ( SURFACE-AT ?auto_27575 ?auto_27580 ) ( ON ?auto_27575 ?auto_27584 ) ( CLEAR ?auto_27575 ) ( not ( = ?auto_27575 ?auto_27584 ) ) ( not ( = ?auto_27576 ?auto_27584 ) ) ( SURFACE-AT ?auto_27579 ?auto_27577 ) ( CLEAR ?auto_27579 ) ( IS-CRATE ?auto_27576 ) ( not ( = ?auto_27575 ?auto_27579 ) ) ( not ( = ?auto_27576 ?auto_27579 ) ) ( not ( = ?auto_27584 ?auto_27579 ) ) ( AVAILABLE ?auto_27582 ) ( TRUCK-AT ?auto_27578 ?auto_27583 ) ( not ( = ?auto_27583 ?auto_27577 ) ) ( not ( = ?auto_27580 ?auto_27583 ) ) ( HOIST-AT ?auto_27585 ?auto_27583 ) ( LIFTING ?auto_27585 ?auto_27576 ) ( not ( = ?auto_27582 ?auto_27585 ) ) ( not ( = ?auto_27581 ?auto_27585 ) ) )
    :subtasks
    ( ( !LOAD ?auto_27585 ?auto_27576 ?auto_27578 ?auto_27583 )
      ( MAKE-ON ?auto_27575 ?auto_27576 )
      ( MAKE-ON-VERIFY ?auto_27575 ?auto_27576 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27586 - SURFACE
      ?auto_27587 - SURFACE
    )
    :vars
    (
      ?auto_27595 - HOIST
      ?auto_27589 - PLACE
      ?auto_27593 - PLACE
      ?auto_27591 - HOIST
      ?auto_27592 - SURFACE
      ?auto_27596 - SURFACE
      ?auto_27590 - TRUCK
      ?auto_27588 - PLACE
      ?auto_27594 - HOIST
      ?auto_27597 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27595 ?auto_27589 ) ( IS-CRATE ?auto_27586 ) ( not ( = ?auto_27586 ?auto_27587 ) ) ( not ( = ?auto_27593 ?auto_27589 ) ) ( HOIST-AT ?auto_27591 ?auto_27593 ) ( not ( = ?auto_27595 ?auto_27591 ) ) ( AVAILABLE ?auto_27591 ) ( SURFACE-AT ?auto_27586 ?auto_27593 ) ( ON ?auto_27586 ?auto_27592 ) ( CLEAR ?auto_27586 ) ( not ( = ?auto_27586 ?auto_27592 ) ) ( not ( = ?auto_27587 ?auto_27592 ) ) ( SURFACE-AT ?auto_27596 ?auto_27589 ) ( CLEAR ?auto_27596 ) ( IS-CRATE ?auto_27587 ) ( not ( = ?auto_27586 ?auto_27596 ) ) ( not ( = ?auto_27587 ?auto_27596 ) ) ( not ( = ?auto_27592 ?auto_27596 ) ) ( AVAILABLE ?auto_27595 ) ( TRUCK-AT ?auto_27590 ?auto_27588 ) ( not ( = ?auto_27588 ?auto_27589 ) ) ( not ( = ?auto_27593 ?auto_27588 ) ) ( HOIST-AT ?auto_27594 ?auto_27588 ) ( not ( = ?auto_27595 ?auto_27594 ) ) ( not ( = ?auto_27591 ?auto_27594 ) ) ( AVAILABLE ?auto_27594 ) ( SURFACE-AT ?auto_27587 ?auto_27588 ) ( ON ?auto_27587 ?auto_27597 ) ( CLEAR ?auto_27587 ) ( not ( = ?auto_27586 ?auto_27597 ) ) ( not ( = ?auto_27587 ?auto_27597 ) ) ( not ( = ?auto_27592 ?auto_27597 ) ) ( not ( = ?auto_27596 ?auto_27597 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27594 ?auto_27587 ?auto_27597 ?auto_27588 )
      ( MAKE-ON ?auto_27586 ?auto_27587 )
      ( MAKE-ON-VERIFY ?auto_27586 ?auto_27587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27598 - SURFACE
      ?auto_27599 - SURFACE
    )
    :vars
    (
      ?auto_27602 - HOIST
      ?auto_27605 - PLACE
      ?auto_27607 - PLACE
      ?auto_27608 - HOIST
      ?auto_27609 - SURFACE
      ?auto_27604 - SURFACE
      ?auto_27603 - PLACE
      ?auto_27600 - HOIST
      ?auto_27601 - SURFACE
      ?auto_27606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27602 ?auto_27605 ) ( IS-CRATE ?auto_27598 ) ( not ( = ?auto_27598 ?auto_27599 ) ) ( not ( = ?auto_27607 ?auto_27605 ) ) ( HOIST-AT ?auto_27608 ?auto_27607 ) ( not ( = ?auto_27602 ?auto_27608 ) ) ( AVAILABLE ?auto_27608 ) ( SURFACE-AT ?auto_27598 ?auto_27607 ) ( ON ?auto_27598 ?auto_27609 ) ( CLEAR ?auto_27598 ) ( not ( = ?auto_27598 ?auto_27609 ) ) ( not ( = ?auto_27599 ?auto_27609 ) ) ( SURFACE-AT ?auto_27604 ?auto_27605 ) ( CLEAR ?auto_27604 ) ( IS-CRATE ?auto_27599 ) ( not ( = ?auto_27598 ?auto_27604 ) ) ( not ( = ?auto_27599 ?auto_27604 ) ) ( not ( = ?auto_27609 ?auto_27604 ) ) ( AVAILABLE ?auto_27602 ) ( not ( = ?auto_27603 ?auto_27605 ) ) ( not ( = ?auto_27607 ?auto_27603 ) ) ( HOIST-AT ?auto_27600 ?auto_27603 ) ( not ( = ?auto_27602 ?auto_27600 ) ) ( not ( = ?auto_27608 ?auto_27600 ) ) ( AVAILABLE ?auto_27600 ) ( SURFACE-AT ?auto_27599 ?auto_27603 ) ( ON ?auto_27599 ?auto_27601 ) ( CLEAR ?auto_27599 ) ( not ( = ?auto_27598 ?auto_27601 ) ) ( not ( = ?auto_27599 ?auto_27601 ) ) ( not ( = ?auto_27609 ?auto_27601 ) ) ( not ( = ?auto_27604 ?auto_27601 ) ) ( TRUCK-AT ?auto_27606 ?auto_27605 ) )
    :subtasks
    ( ( !DRIVE ?auto_27606 ?auto_27605 ?auto_27603 )
      ( MAKE-ON ?auto_27598 ?auto_27599 )
      ( MAKE-ON-VERIFY ?auto_27598 ?auto_27599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27612 - SURFACE
      ?auto_27613 - SURFACE
    )
    :vars
    (
      ?auto_27614 - HOIST
      ?auto_27615 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27614 ?auto_27615 ) ( SURFACE-AT ?auto_27613 ?auto_27615 ) ( CLEAR ?auto_27613 ) ( LIFTING ?auto_27614 ?auto_27612 ) ( IS-CRATE ?auto_27612 ) ( not ( = ?auto_27612 ?auto_27613 ) ) )
    :subtasks
    ( ( !DROP ?auto_27614 ?auto_27612 ?auto_27613 ?auto_27615 )
      ( MAKE-ON-VERIFY ?auto_27612 ?auto_27613 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27616 - SURFACE
      ?auto_27617 - SURFACE
    )
    :vars
    (
      ?auto_27619 - HOIST
      ?auto_27618 - PLACE
      ?auto_27620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27619 ?auto_27618 ) ( SURFACE-AT ?auto_27617 ?auto_27618 ) ( CLEAR ?auto_27617 ) ( IS-CRATE ?auto_27616 ) ( not ( = ?auto_27616 ?auto_27617 ) ) ( TRUCK-AT ?auto_27620 ?auto_27618 ) ( AVAILABLE ?auto_27619 ) ( IN ?auto_27616 ?auto_27620 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27619 ?auto_27616 ?auto_27620 ?auto_27618 )
      ( MAKE-ON ?auto_27616 ?auto_27617 )
      ( MAKE-ON-VERIFY ?auto_27616 ?auto_27617 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27621 - SURFACE
      ?auto_27622 - SURFACE
    )
    :vars
    (
      ?auto_27624 - HOIST
      ?auto_27625 - PLACE
      ?auto_27623 - TRUCK
      ?auto_27626 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27624 ?auto_27625 ) ( SURFACE-AT ?auto_27622 ?auto_27625 ) ( CLEAR ?auto_27622 ) ( IS-CRATE ?auto_27621 ) ( not ( = ?auto_27621 ?auto_27622 ) ) ( AVAILABLE ?auto_27624 ) ( IN ?auto_27621 ?auto_27623 ) ( TRUCK-AT ?auto_27623 ?auto_27626 ) ( not ( = ?auto_27626 ?auto_27625 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27623 ?auto_27626 ?auto_27625 )
      ( MAKE-ON ?auto_27621 ?auto_27622 )
      ( MAKE-ON-VERIFY ?auto_27621 ?auto_27622 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27627 - SURFACE
      ?auto_27628 - SURFACE
    )
    :vars
    (
      ?auto_27631 - HOIST
      ?auto_27630 - PLACE
      ?auto_27632 - TRUCK
      ?auto_27629 - PLACE
      ?auto_27633 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27631 ?auto_27630 ) ( SURFACE-AT ?auto_27628 ?auto_27630 ) ( CLEAR ?auto_27628 ) ( IS-CRATE ?auto_27627 ) ( not ( = ?auto_27627 ?auto_27628 ) ) ( AVAILABLE ?auto_27631 ) ( TRUCK-AT ?auto_27632 ?auto_27629 ) ( not ( = ?auto_27629 ?auto_27630 ) ) ( HOIST-AT ?auto_27633 ?auto_27629 ) ( LIFTING ?auto_27633 ?auto_27627 ) ( not ( = ?auto_27631 ?auto_27633 ) ) )
    :subtasks
    ( ( !LOAD ?auto_27633 ?auto_27627 ?auto_27632 ?auto_27629 )
      ( MAKE-ON ?auto_27627 ?auto_27628 )
      ( MAKE-ON-VERIFY ?auto_27627 ?auto_27628 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27634 - SURFACE
      ?auto_27635 - SURFACE
    )
    :vars
    (
      ?auto_27637 - HOIST
      ?auto_27640 - PLACE
      ?auto_27638 - TRUCK
      ?auto_27639 - PLACE
      ?auto_27636 - HOIST
      ?auto_27641 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27637 ?auto_27640 ) ( SURFACE-AT ?auto_27635 ?auto_27640 ) ( CLEAR ?auto_27635 ) ( IS-CRATE ?auto_27634 ) ( not ( = ?auto_27634 ?auto_27635 ) ) ( AVAILABLE ?auto_27637 ) ( TRUCK-AT ?auto_27638 ?auto_27639 ) ( not ( = ?auto_27639 ?auto_27640 ) ) ( HOIST-AT ?auto_27636 ?auto_27639 ) ( not ( = ?auto_27637 ?auto_27636 ) ) ( AVAILABLE ?auto_27636 ) ( SURFACE-AT ?auto_27634 ?auto_27639 ) ( ON ?auto_27634 ?auto_27641 ) ( CLEAR ?auto_27634 ) ( not ( = ?auto_27634 ?auto_27641 ) ) ( not ( = ?auto_27635 ?auto_27641 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27636 ?auto_27634 ?auto_27641 ?auto_27639 )
      ( MAKE-ON ?auto_27634 ?auto_27635 )
      ( MAKE-ON-VERIFY ?auto_27634 ?auto_27635 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27642 - SURFACE
      ?auto_27643 - SURFACE
    )
    :vars
    (
      ?auto_27644 - HOIST
      ?auto_27647 - PLACE
      ?auto_27648 - PLACE
      ?auto_27646 - HOIST
      ?auto_27649 - SURFACE
      ?auto_27645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27644 ?auto_27647 ) ( SURFACE-AT ?auto_27643 ?auto_27647 ) ( CLEAR ?auto_27643 ) ( IS-CRATE ?auto_27642 ) ( not ( = ?auto_27642 ?auto_27643 ) ) ( AVAILABLE ?auto_27644 ) ( not ( = ?auto_27648 ?auto_27647 ) ) ( HOIST-AT ?auto_27646 ?auto_27648 ) ( not ( = ?auto_27644 ?auto_27646 ) ) ( AVAILABLE ?auto_27646 ) ( SURFACE-AT ?auto_27642 ?auto_27648 ) ( ON ?auto_27642 ?auto_27649 ) ( CLEAR ?auto_27642 ) ( not ( = ?auto_27642 ?auto_27649 ) ) ( not ( = ?auto_27643 ?auto_27649 ) ) ( TRUCK-AT ?auto_27645 ?auto_27647 ) )
    :subtasks
    ( ( !DRIVE ?auto_27645 ?auto_27647 ?auto_27648 )
      ( MAKE-ON ?auto_27642 ?auto_27643 )
      ( MAKE-ON-VERIFY ?auto_27642 ?auto_27643 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27650 - SURFACE
      ?auto_27651 - SURFACE
    )
    :vars
    (
      ?auto_27652 - HOIST
      ?auto_27657 - PLACE
      ?auto_27656 - PLACE
      ?auto_27654 - HOIST
      ?auto_27653 - SURFACE
      ?auto_27655 - TRUCK
      ?auto_27658 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27652 ?auto_27657 ) ( IS-CRATE ?auto_27650 ) ( not ( = ?auto_27650 ?auto_27651 ) ) ( not ( = ?auto_27656 ?auto_27657 ) ) ( HOIST-AT ?auto_27654 ?auto_27656 ) ( not ( = ?auto_27652 ?auto_27654 ) ) ( AVAILABLE ?auto_27654 ) ( SURFACE-AT ?auto_27650 ?auto_27656 ) ( ON ?auto_27650 ?auto_27653 ) ( CLEAR ?auto_27650 ) ( not ( = ?auto_27650 ?auto_27653 ) ) ( not ( = ?auto_27651 ?auto_27653 ) ) ( TRUCK-AT ?auto_27655 ?auto_27657 ) ( SURFACE-AT ?auto_27658 ?auto_27657 ) ( CLEAR ?auto_27658 ) ( LIFTING ?auto_27652 ?auto_27651 ) ( IS-CRATE ?auto_27651 ) ( not ( = ?auto_27650 ?auto_27658 ) ) ( not ( = ?auto_27651 ?auto_27658 ) ) ( not ( = ?auto_27653 ?auto_27658 ) ) )
    :subtasks
    ( ( !DROP ?auto_27652 ?auto_27651 ?auto_27658 ?auto_27657 )
      ( MAKE-ON ?auto_27650 ?auto_27651 )
      ( MAKE-ON-VERIFY ?auto_27650 ?auto_27651 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27659 - SURFACE
      ?auto_27660 - SURFACE
    )
    :vars
    (
      ?auto_27666 - HOIST
      ?auto_27661 - PLACE
      ?auto_27662 - PLACE
      ?auto_27664 - HOIST
      ?auto_27663 - SURFACE
      ?auto_27667 - TRUCK
      ?auto_27665 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27666 ?auto_27661 ) ( IS-CRATE ?auto_27659 ) ( not ( = ?auto_27659 ?auto_27660 ) ) ( not ( = ?auto_27662 ?auto_27661 ) ) ( HOIST-AT ?auto_27664 ?auto_27662 ) ( not ( = ?auto_27666 ?auto_27664 ) ) ( AVAILABLE ?auto_27664 ) ( SURFACE-AT ?auto_27659 ?auto_27662 ) ( ON ?auto_27659 ?auto_27663 ) ( CLEAR ?auto_27659 ) ( not ( = ?auto_27659 ?auto_27663 ) ) ( not ( = ?auto_27660 ?auto_27663 ) ) ( TRUCK-AT ?auto_27667 ?auto_27661 ) ( SURFACE-AT ?auto_27665 ?auto_27661 ) ( CLEAR ?auto_27665 ) ( IS-CRATE ?auto_27660 ) ( not ( = ?auto_27659 ?auto_27665 ) ) ( not ( = ?auto_27660 ?auto_27665 ) ) ( not ( = ?auto_27663 ?auto_27665 ) ) ( AVAILABLE ?auto_27666 ) ( IN ?auto_27660 ?auto_27667 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27666 ?auto_27660 ?auto_27667 ?auto_27661 )
      ( MAKE-ON ?auto_27659 ?auto_27660 )
      ( MAKE-ON-VERIFY ?auto_27659 ?auto_27660 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27668 - SURFACE
      ?auto_27669 - SURFACE
    )
    :vars
    (
      ?auto_27673 - HOIST
      ?auto_27674 - PLACE
      ?auto_27672 - PLACE
      ?auto_27676 - HOIST
      ?auto_27675 - SURFACE
      ?auto_27670 - SURFACE
      ?auto_27671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27673 ?auto_27674 ) ( IS-CRATE ?auto_27668 ) ( not ( = ?auto_27668 ?auto_27669 ) ) ( not ( = ?auto_27672 ?auto_27674 ) ) ( HOIST-AT ?auto_27676 ?auto_27672 ) ( not ( = ?auto_27673 ?auto_27676 ) ) ( AVAILABLE ?auto_27676 ) ( SURFACE-AT ?auto_27668 ?auto_27672 ) ( ON ?auto_27668 ?auto_27675 ) ( CLEAR ?auto_27668 ) ( not ( = ?auto_27668 ?auto_27675 ) ) ( not ( = ?auto_27669 ?auto_27675 ) ) ( SURFACE-AT ?auto_27670 ?auto_27674 ) ( CLEAR ?auto_27670 ) ( IS-CRATE ?auto_27669 ) ( not ( = ?auto_27668 ?auto_27670 ) ) ( not ( = ?auto_27669 ?auto_27670 ) ) ( not ( = ?auto_27675 ?auto_27670 ) ) ( AVAILABLE ?auto_27673 ) ( IN ?auto_27669 ?auto_27671 ) ( TRUCK-AT ?auto_27671 ?auto_27672 ) )
    :subtasks
    ( ( !DRIVE ?auto_27671 ?auto_27672 ?auto_27674 )
      ( MAKE-ON ?auto_27668 ?auto_27669 )
      ( MAKE-ON-VERIFY ?auto_27668 ?auto_27669 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27677 - SURFACE
      ?auto_27678 - SURFACE
    )
    :vars
    (
      ?auto_27682 - HOIST
      ?auto_27679 - PLACE
      ?auto_27685 - PLACE
      ?auto_27683 - HOIST
      ?auto_27680 - SURFACE
      ?auto_27684 - SURFACE
      ?auto_27681 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27682 ?auto_27679 ) ( IS-CRATE ?auto_27677 ) ( not ( = ?auto_27677 ?auto_27678 ) ) ( not ( = ?auto_27685 ?auto_27679 ) ) ( HOIST-AT ?auto_27683 ?auto_27685 ) ( not ( = ?auto_27682 ?auto_27683 ) ) ( SURFACE-AT ?auto_27677 ?auto_27685 ) ( ON ?auto_27677 ?auto_27680 ) ( CLEAR ?auto_27677 ) ( not ( = ?auto_27677 ?auto_27680 ) ) ( not ( = ?auto_27678 ?auto_27680 ) ) ( SURFACE-AT ?auto_27684 ?auto_27679 ) ( CLEAR ?auto_27684 ) ( IS-CRATE ?auto_27678 ) ( not ( = ?auto_27677 ?auto_27684 ) ) ( not ( = ?auto_27678 ?auto_27684 ) ) ( not ( = ?auto_27680 ?auto_27684 ) ) ( AVAILABLE ?auto_27682 ) ( TRUCK-AT ?auto_27681 ?auto_27685 ) ( LIFTING ?auto_27683 ?auto_27678 ) )
    :subtasks
    ( ( !LOAD ?auto_27683 ?auto_27678 ?auto_27681 ?auto_27685 )
      ( MAKE-ON ?auto_27677 ?auto_27678 )
      ( MAKE-ON-VERIFY ?auto_27677 ?auto_27678 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27686 - SURFACE
      ?auto_27687 - SURFACE
    )
    :vars
    (
      ?auto_27688 - HOIST
      ?auto_27691 - PLACE
      ?auto_27690 - PLACE
      ?auto_27692 - HOIST
      ?auto_27689 - SURFACE
      ?auto_27694 - SURFACE
      ?auto_27693 - TRUCK
      ?auto_27695 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27688 ?auto_27691 ) ( IS-CRATE ?auto_27686 ) ( not ( = ?auto_27686 ?auto_27687 ) ) ( not ( = ?auto_27690 ?auto_27691 ) ) ( HOIST-AT ?auto_27692 ?auto_27690 ) ( not ( = ?auto_27688 ?auto_27692 ) ) ( SURFACE-AT ?auto_27686 ?auto_27690 ) ( ON ?auto_27686 ?auto_27689 ) ( CLEAR ?auto_27686 ) ( not ( = ?auto_27686 ?auto_27689 ) ) ( not ( = ?auto_27687 ?auto_27689 ) ) ( SURFACE-AT ?auto_27694 ?auto_27691 ) ( CLEAR ?auto_27694 ) ( IS-CRATE ?auto_27687 ) ( not ( = ?auto_27686 ?auto_27694 ) ) ( not ( = ?auto_27687 ?auto_27694 ) ) ( not ( = ?auto_27689 ?auto_27694 ) ) ( AVAILABLE ?auto_27688 ) ( TRUCK-AT ?auto_27693 ?auto_27690 ) ( AVAILABLE ?auto_27692 ) ( SURFACE-AT ?auto_27687 ?auto_27690 ) ( ON ?auto_27687 ?auto_27695 ) ( CLEAR ?auto_27687 ) ( not ( = ?auto_27686 ?auto_27695 ) ) ( not ( = ?auto_27687 ?auto_27695 ) ) ( not ( = ?auto_27689 ?auto_27695 ) ) ( not ( = ?auto_27694 ?auto_27695 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27692 ?auto_27687 ?auto_27695 ?auto_27690 )
      ( MAKE-ON ?auto_27686 ?auto_27687 )
      ( MAKE-ON-VERIFY ?auto_27686 ?auto_27687 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27696 - SURFACE
      ?auto_27697 - SURFACE
    )
    :vars
    (
      ?auto_27705 - HOIST
      ?auto_27700 - PLACE
      ?auto_27701 - PLACE
      ?auto_27704 - HOIST
      ?auto_27698 - SURFACE
      ?auto_27699 - SURFACE
      ?auto_27702 - SURFACE
      ?auto_27703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27705 ?auto_27700 ) ( IS-CRATE ?auto_27696 ) ( not ( = ?auto_27696 ?auto_27697 ) ) ( not ( = ?auto_27701 ?auto_27700 ) ) ( HOIST-AT ?auto_27704 ?auto_27701 ) ( not ( = ?auto_27705 ?auto_27704 ) ) ( SURFACE-AT ?auto_27696 ?auto_27701 ) ( ON ?auto_27696 ?auto_27698 ) ( CLEAR ?auto_27696 ) ( not ( = ?auto_27696 ?auto_27698 ) ) ( not ( = ?auto_27697 ?auto_27698 ) ) ( SURFACE-AT ?auto_27699 ?auto_27700 ) ( CLEAR ?auto_27699 ) ( IS-CRATE ?auto_27697 ) ( not ( = ?auto_27696 ?auto_27699 ) ) ( not ( = ?auto_27697 ?auto_27699 ) ) ( not ( = ?auto_27698 ?auto_27699 ) ) ( AVAILABLE ?auto_27705 ) ( AVAILABLE ?auto_27704 ) ( SURFACE-AT ?auto_27697 ?auto_27701 ) ( ON ?auto_27697 ?auto_27702 ) ( CLEAR ?auto_27697 ) ( not ( = ?auto_27696 ?auto_27702 ) ) ( not ( = ?auto_27697 ?auto_27702 ) ) ( not ( = ?auto_27698 ?auto_27702 ) ) ( not ( = ?auto_27699 ?auto_27702 ) ) ( TRUCK-AT ?auto_27703 ?auto_27700 ) )
    :subtasks
    ( ( !DRIVE ?auto_27703 ?auto_27700 ?auto_27701 )
      ( MAKE-ON ?auto_27696 ?auto_27697 )
      ( MAKE-ON-VERIFY ?auto_27696 ?auto_27697 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27706 - SURFACE
      ?auto_27707 - SURFACE
    )
    :vars
    (
      ?auto_27714 - HOIST
      ?auto_27712 - PLACE
      ?auto_27710 - PLACE
      ?auto_27708 - HOIST
      ?auto_27715 - SURFACE
      ?auto_27713 - SURFACE
      ?auto_27711 - SURFACE
      ?auto_27709 - TRUCK
      ?auto_27716 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27714 ?auto_27712 ) ( IS-CRATE ?auto_27706 ) ( not ( = ?auto_27706 ?auto_27707 ) ) ( not ( = ?auto_27710 ?auto_27712 ) ) ( HOIST-AT ?auto_27708 ?auto_27710 ) ( not ( = ?auto_27714 ?auto_27708 ) ) ( SURFACE-AT ?auto_27706 ?auto_27710 ) ( ON ?auto_27706 ?auto_27715 ) ( CLEAR ?auto_27706 ) ( not ( = ?auto_27706 ?auto_27715 ) ) ( not ( = ?auto_27707 ?auto_27715 ) ) ( IS-CRATE ?auto_27707 ) ( not ( = ?auto_27706 ?auto_27713 ) ) ( not ( = ?auto_27707 ?auto_27713 ) ) ( not ( = ?auto_27715 ?auto_27713 ) ) ( AVAILABLE ?auto_27708 ) ( SURFACE-AT ?auto_27707 ?auto_27710 ) ( ON ?auto_27707 ?auto_27711 ) ( CLEAR ?auto_27707 ) ( not ( = ?auto_27706 ?auto_27711 ) ) ( not ( = ?auto_27707 ?auto_27711 ) ) ( not ( = ?auto_27715 ?auto_27711 ) ) ( not ( = ?auto_27713 ?auto_27711 ) ) ( TRUCK-AT ?auto_27709 ?auto_27712 ) ( SURFACE-AT ?auto_27716 ?auto_27712 ) ( CLEAR ?auto_27716 ) ( LIFTING ?auto_27714 ?auto_27713 ) ( IS-CRATE ?auto_27713 ) ( not ( = ?auto_27706 ?auto_27716 ) ) ( not ( = ?auto_27707 ?auto_27716 ) ) ( not ( = ?auto_27715 ?auto_27716 ) ) ( not ( = ?auto_27713 ?auto_27716 ) ) ( not ( = ?auto_27711 ?auto_27716 ) ) )
    :subtasks
    ( ( !DROP ?auto_27714 ?auto_27713 ?auto_27716 ?auto_27712 )
      ( MAKE-ON ?auto_27706 ?auto_27707 )
      ( MAKE-ON-VERIFY ?auto_27706 ?auto_27707 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27717 - SURFACE
      ?auto_27718 - SURFACE
    )
    :vars
    (
      ?auto_27720 - HOIST
      ?auto_27724 - PLACE
      ?auto_27723 - PLACE
      ?auto_27726 - HOIST
      ?auto_27721 - SURFACE
      ?auto_27722 - SURFACE
      ?auto_27719 - SURFACE
      ?auto_27725 - TRUCK
      ?auto_27727 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27720 ?auto_27724 ) ( IS-CRATE ?auto_27717 ) ( not ( = ?auto_27717 ?auto_27718 ) ) ( not ( = ?auto_27723 ?auto_27724 ) ) ( HOIST-AT ?auto_27726 ?auto_27723 ) ( not ( = ?auto_27720 ?auto_27726 ) ) ( SURFACE-AT ?auto_27717 ?auto_27723 ) ( ON ?auto_27717 ?auto_27721 ) ( CLEAR ?auto_27717 ) ( not ( = ?auto_27717 ?auto_27721 ) ) ( not ( = ?auto_27718 ?auto_27721 ) ) ( IS-CRATE ?auto_27718 ) ( not ( = ?auto_27717 ?auto_27722 ) ) ( not ( = ?auto_27718 ?auto_27722 ) ) ( not ( = ?auto_27721 ?auto_27722 ) ) ( AVAILABLE ?auto_27726 ) ( SURFACE-AT ?auto_27718 ?auto_27723 ) ( ON ?auto_27718 ?auto_27719 ) ( CLEAR ?auto_27718 ) ( not ( = ?auto_27717 ?auto_27719 ) ) ( not ( = ?auto_27718 ?auto_27719 ) ) ( not ( = ?auto_27721 ?auto_27719 ) ) ( not ( = ?auto_27722 ?auto_27719 ) ) ( TRUCK-AT ?auto_27725 ?auto_27724 ) ( SURFACE-AT ?auto_27727 ?auto_27724 ) ( CLEAR ?auto_27727 ) ( IS-CRATE ?auto_27722 ) ( not ( = ?auto_27717 ?auto_27727 ) ) ( not ( = ?auto_27718 ?auto_27727 ) ) ( not ( = ?auto_27721 ?auto_27727 ) ) ( not ( = ?auto_27722 ?auto_27727 ) ) ( not ( = ?auto_27719 ?auto_27727 ) ) ( AVAILABLE ?auto_27720 ) ( IN ?auto_27722 ?auto_27725 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27720 ?auto_27722 ?auto_27725 ?auto_27724 )
      ( MAKE-ON ?auto_27717 ?auto_27718 )
      ( MAKE-ON-VERIFY ?auto_27717 ?auto_27718 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27728 - SURFACE
      ?auto_27729 - SURFACE
    )
    :vars
    (
      ?auto_27735 - HOIST
      ?auto_27732 - PLACE
      ?auto_27730 - PLACE
      ?auto_27737 - HOIST
      ?auto_27736 - SURFACE
      ?auto_27734 - SURFACE
      ?auto_27738 - SURFACE
      ?auto_27733 - SURFACE
      ?auto_27731 - TRUCK
      ?auto_27739 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27735 ?auto_27732 ) ( IS-CRATE ?auto_27728 ) ( not ( = ?auto_27728 ?auto_27729 ) ) ( not ( = ?auto_27730 ?auto_27732 ) ) ( HOIST-AT ?auto_27737 ?auto_27730 ) ( not ( = ?auto_27735 ?auto_27737 ) ) ( SURFACE-AT ?auto_27728 ?auto_27730 ) ( ON ?auto_27728 ?auto_27736 ) ( CLEAR ?auto_27728 ) ( not ( = ?auto_27728 ?auto_27736 ) ) ( not ( = ?auto_27729 ?auto_27736 ) ) ( IS-CRATE ?auto_27729 ) ( not ( = ?auto_27728 ?auto_27734 ) ) ( not ( = ?auto_27729 ?auto_27734 ) ) ( not ( = ?auto_27736 ?auto_27734 ) ) ( AVAILABLE ?auto_27737 ) ( SURFACE-AT ?auto_27729 ?auto_27730 ) ( ON ?auto_27729 ?auto_27738 ) ( CLEAR ?auto_27729 ) ( not ( = ?auto_27728 ?auto_27738 ) ) ( not ( = ?auto_27729 ?auto_27738 ) ) ( not ( = ?auto_27736 ?auto_27738 ) ) ( not ( = ?auto_27734 ?auto_27738 ) ) ( SURFACE-AT ?auto_27733 ?auto_27732 ) ( CLEAR ?auto_27733 ) ( IS-CRATE ?auto_27734 ) ( not ( = ?auto_27728 ?auto_27733 ) ) ( not ( = ?auto_27729 ?auto_27733 ) ) ( not ( = ?auto_27736 ?auto_27733 ) ) ( not ( = ?auto_27734 ?auto_27733 ) ) ( not ( = ?auto_27738 ?auto_27733 ) ) ( AVAILABLE ?auto_27735 ) ( IN ?auto_27734 ?auto_27731 ) ( TRUCK-AT ?auto_27731 ?auto_27739 ) ( not ( = ?auto_27739 ?auto_27732 ) ) ( not ( = ?auto_27730 ?auto_27739 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27731 ?auto_27739 ?auto_27732 )
      ( MAKE-ON ?auto_27728 ?auto_27729 )
      ( MAKE-ON-VERIFY ?auto_27728 ?auto_27729 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27740 - SURFACE
      ?auto_27741 - SURFACE
    )
    :vars
    (
      ?auto_27744 - HOIST
      ?auto_27743 - PLACE
      ?auto_27749 - PLACE
      ?auto_27748 - HOIST
      ?auto_27751 - SURFACE
      ?auto_27742 - SURFACE
      ?auto_27747 - SURFACE
      ?auto_27746 - SURFACE
      ?auto_27745 - TRUCK
      ?auto_27750 - PLACE
      ?auto_27752 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27744 ?auto_27743 ) ( IS-CRATE ?auto_27740 ) ( not ( = ?auto_27740 ?auto_27741 ) ) ( not ( = ?auto_27749 ?auto_27743 ) ) ( HOIST-AT ?auto_27748 ?auto_27749 ) ( not ( = ?auto_27744 ?auto_27748 ) ) ( SURFACE-AT ?auto_27740 ?auto_27749 ) ( ON ?auto_27740 ?auto_27751 ) ( CLEAR ?auto_27740 ) ( not ( = ?auto_27740 ?auto_27751 ) ) ( not ( = ?auto_27741 ?auto_27751 ) ) ( IS-CRATE ?auto_27741 ) ( not ( = ?auto_27740 ?auto_27742 ) ) ( not ( = ?auto_27741 ?auto_27742 ) ) ( not ( = ?auto_27751 ?auto_27742 ) ) ( AVAILABLE ?auto_27748 ) ( SURFACE-AT ?auto_27741 ?auto_27749 ) ( ON ?auto_27741 ?auto_27747 ) ( CLEAR ?auto_27741 ) ( not ( = ?auto_27740 ?auto_27747 ) ) ( not ( = ?auto_27741 ?auto_27747 ) ) ( not ( = ?auto_27751 ?auto_27747 ) ) ( not ( = ?auto_27742 ?auto_27747 ) ) ( SURFACE-AT ?auto_27746 ?auto_27743 ) ( CLEAR ?auto_27746 ) ( IS-CRATE ?auto_27742 ) ( not ( = ?auto_27740 ?auto_27746 ) ) ( not ( = ?auto_27741 ?auto_27746 ) ) ( not ( = ?auto_27751 ?auto_27746 ) ) ( not ( = ?auto_27742 ?auto_27746 ) ) ( not ( = ?auto_27747 ?auto_27746 ) ) ( AVAILABLE ?auto_27744 ) ( TRUCK-AT ?auto_27745 ?auto_27750 ) ( not ( = ?auto_27750 ?auto_27743 ) ) ( not ( = ?auto_27749 ?auto_27750 ) ) ( HOIST-AT ?auto_27752 ?auto_27750 ) ( LIFTING ?auto_27752 ?auto_27742 ) ( not ( = ?auto_27744 ?auto_27752 ) ) ( not ( = ?auto_27748 ?auto_27752 ) ) )
    :subtasks
    ( ( !LOAD ?auto_27752 ?auto_27742 ?auto_27745 ?auto_27750 )
      ( MAKE-ON ?auto_27740 ?auto_27741 )
      ( MAKE-ON-VERIFY ?auto_27740 ?auto_27741 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27753 - SURFACE
      ?auto_27754 - SURFACE
    )
    :vars
    (
      ?auto_27764 - HOIST
      ?auto_27755 - PLACE
      ?auto_27760 - PLACE
      ?auto_27763 - HOIST
      ?auto_27756 - SURFACE
      ?auto_27765 - SURFACE
      ?auto_27759 - SURFACE
      ?auto_27758 - SURFACE
      ?auto_27757 - TRUCK
      ?auto_27761 - PLACE
      ?auto_27762 - HOIST
      ?auto_27766 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27764 ?auto_27755 ) ( IS-CRATE ?auto_27753 ) ( not ( = ?auto_27753 ?auto_27754 ) ) ( not ( = ?auto_27760 ?auto_27755 ) ) ( HOIST-AT ?auto_27763 ?auto_27760 ) ( not ( = ?auto_27764 ?auto_27763 ) ) ( SURFACE-AT ?auto_27753 ?auto_27760 ) ( ON ?auto_27753 ?auto_27756 ) ( CLEAR ?auto_27753 ) ( not ( = ?auto_27753 ?auto_27756 ) ) ( not ( = ?auto_27754 ?auto_27756 ) ) ( IS-CRATE ?auto_27754 ) ( not ( = ?auto_27753 ?auto_27765 ) ) ( not ( = ?auto_27754 ?auto_27765 ) ) ( not ( = ?auto_27756 ?auto_27765 ) ) ( AVAILABLE ?auto_27763 ) ( SURFACE-AT ?auto_27754 ?auto_27760 ) ( ON ?auto_27754 ?auto_27759 ) ( CLEAR ?auto_27754 ) ( not ( = ?auto_27753 ?auto_27759 ) ) ( not ( = ?auto_27754 ?auto_27759 ) ) ( not ( = ?auto_27756 ?auto_27759 ) ) ( not ( = ?auto_27765 ?auto_27759 ) ) ( SURFACE-AT ?auto_27758 ?auto_27755 ) ( CLEAR ?auto_27758 ) ( IS-CRATE ?auto_27765 ) ( not ( = ?auto_27753 ?auto_27758 ) ) ( not ( = ?auto_27754 ?auto_27758 ) ) ( not ( = ?auto_27756 ?auto_27758 ) ) ( not ( = ?auto_27765 ?auto_27758 ) ) ( not ( = ?auto_27759 ?auto_27758 ) ) ( AVAILABLE ?auto_27764 ) ( TRUCK-AT ?auto_27757 ?auto_27761 ) ( not ( = ?auto_27761 ?auto_27755 ) ) ( not ( = ?auto_27760 ?auto_27761 ) ) ( HOIST-AT ?auto_27762 ?auto_27761 ) ( not ( = ?auto_27764 ?auto_27762 ) ) ( not ( = ?auto_27763 ?auto_27762 ) ) ( AVAILABLE ?auto_27762 ) ( SURFACE-AT ?auto_27765 ?auto_27761 ) ( ON ?auto_27765 ?auto_27766 ) ( CLEAR ?auto_27765 ) ( not ( = ?auto_27753 ?auto_27766 ) ) ( not ( = ?auto_27754 ?auto_27766 ) ) ( not ( = ?auto_27756 ?auto_27766 ) ) ( not ( = ?auto_27765 ?auto_27766 ) ) ( not ( = ?auto_27759 ?auto_27766 ) ) ( not ( = ?auto_27758 ?auto_27766 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27762 ?auto_27765 ?auto_27766 ?auto_27761 )
      ( MAKE-ON ?auto_27753 ?auto_27754 )
      ( MAKE-ON-VERIFY ?auto_27753 ?auto_27754 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27767 - SURFACE
      ?auto_27768 - SURFACE
    )
    :vars
    (
      ?auto_27774 - HOIST
      ?auto_27770 - PLACE
      ?auto_27776 - PLACE
      ?auto_27780 - HOIST
      ?auto_27777 - SURFACE
      ?auto_27771 - SURFACE
      ?auto_27779 - SURFACE
      ?auto_27772 - SURFACE
      ?auto_27773 - PLACE
      ?auto_27778 - HOIST
      ?auto_27775 - SURFACE
      ?auto_27769 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27774 ?auto_27770 ) ( IS-CRATE ?auto_27767 ) ( not ( = ?auto_27767 ?auto_27768 ) ) ( not ( = ?auto_27776 ?auto_27770 ) ) ( HOIST-AT ?auto_27780 ?auto_27776 ) ( not ( = ?auto_27774 ?auto_27780 ) ) ( SURFACE-AT ?auto_27767 ?auto_27776 ) ( ON ?auto_27767 ?auto_27777 ) ( CLEAR ?auto_27767 ) ( not ( = ?auto_27767 ?auto_27777 ) ) ( not ( = ?auto_27768 ?auto_27777 ) ) ( IS-CRATE ?auto_27768 ) ( not ( = ?auto_27767 ?auto_27771 ) ) ( not ( = ?auto_27768 ?auto_27771 ) ) ( not ( = ?auto_27777 ?auto_27771 ) ) ( AVAILABLE ?auto_27780 ) ( SURFACE-AT ?auto_27768 ?auto_27776 ) ( ON ?auto_27768 ?auto_27779 ) ( CLEAR ?auto_27768 ) ( not ( = ?auto_27767 ?auto_27779 ) ) ( not ( = ?auto_27768 ?auto_27779 ) ) ( not ( = ?auto_27777 ?auto_27779 ) ) ( not ( = ?auto_27771 ?auto_27779 ) ) ( SURFACE-AT ?auto_27772 ?auto_27770 ) ( CLEAR ?auto_27772 ) ( IS-CRATE ?auto_27771 ) ( not ( = ?auto_27767 ?auto_27772 ) ) ( not ( = ?auto_27768 ?auto_27772 ) ) ( not ( = ?auto_27777 ?auto_27772 ) ) ( not ( = ?auto_27771 ?auto_27772 ) ) ( not ( = ?auto_27779 ?auto_27772 ) ) ( AVAILABLE ?auto_27774 ) ( not ( = ?auto_27773 ?auto_27770 ) ) ( not ( = ?auto_27776 ?auto_27773 ) ) ( HOIST-AT ?auto_27778 ?auto_27773 ) ( not ( = ?auto_27774 ?auto_27778 ) ) ( not ( = ?auto_27780 ?auto_27778 ) ) ( AVAILABLE ?auto_27778 ) ( SURFACE-AT ?auto_27771 ?auto_27773 ) ( ON ?auto_27771 ?auto_27775 ) ( CLEAR ?auto_27771 ) ( not ( = ?auto_27767 ?auto_27775 ) ) ( not ( = ?auto_27768 ?auto_27775 ) ) ( not ( = ?auto_27777 ?auto_27775 ) ) ( not ( = ?auto_27771 ?auto_27775 ) ) ( not ( = ?auto_27779 ?auto_27775 ) ) ( not ( = ?auto_27772 ?auto_27775 ) ) ( TRUCK-AT ?auto_27769 ?auto_27770 ) )
    :subtasks
    ( ( !DRIVE ?auto_27769 ?auto_27770 ?auto_27773 )
      ( MAKE-ON ?auto_27767 ?auto_27768 )
      ( MAKE-ON-VERIFY ?auto_27767 ?auto_27768 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27783 - SURFACE
      ?auto_27784 - SURFACE
    )
    :vars
    (
      ?auto_27785 - HOIST
      ?auto_27786 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27785 ?auto_27786 ) ( SURFACE-AT ?auto_27784 ?auto_27786 ) ( CLEAR ?auto_27784 ) ( LIFTING ?auto_27785 ?auto_27783 ) ( IS-CRATE ?auto_27783 ) ( not ( = ?auto_27783 ?auto_27784 ) ) )
    :subtasks
    ( ( !DROP ?auto_27785 ?auto_27783 ?auto_27784 ?auto_27786 )
      ( MAKE-ON-VERIFY ?auto_27783 ?auto_27784 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27787 - SURFACE
      ?auto_27788 - SURFACE
    )
    :vars
    (
      ?auto_27789 - HOIST
      ?auto_27790 - PLACE
      ?auto_27791 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27789 ?auto_27790 ) ( SURFACE-AT ?auto_27788 ?auto_27790 ) ( CLEAR ?auto_27788 ) ( IS-CRATE ?auto_27787 ) ( not ( = ?auto_27787 ?auto_27788 ) ) ( TRUCK-AT ?auto_27791 ?auto_27790 ) ( AVAILABLE ?auto_27789 ) ( IN ?auto_27787 ?auto_27791 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27789 ?auto_27787 ?auto_27791 ?auto_27790 )
      ( MAKE-ON ?auto_27787 ?auto_27788 )
      ( MAKE-ON-VERIFY ?auto_27787 ?auto_27788 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27792 - SURFACE
      ?auto_27793 - SURFACE
    )
    :vars
    (
      ?auto_27796 - HOIST
      ?auto_27794 - PLACE
      ?auto_27795 - TRUCK
      ?auto_27797 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27796 ?auto_27794 ) ( SURFACE-AT ?auto_27793 ?auto_27794 ) ( CLEAR ?auto_27793 ) ( IS-CRATE ?auto_27792 ) ( not ( = ?auto_27792 ?auto_27793 ) ) ( AVAILABLE ?auto_27796 ) ( IN ?auto_27792 ?auto_27795 ) ( TRUCK-AT ?auto_27795 ?auto_27797 ) ( not ( = ?auto_27797 ?auto_27794 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27795 ?auto_27797 ?auto_27794 )
      ( MAKE-ON ?auto_27792 ?auto_27793 )
      ( MAKE-ON-VERIFY ?auto_27792 ?auto_27793 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27798 - SURFACE
      ?auto_27799 - SURFACE
    )
    :vars
    (
      ?auto_27801 - HOIST
      ?auto_27800 - PLACE
      ?auto_27802 - TRUCK
      ?auto_27803 - PLACE
      ?auto_27804 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27801 ?auto_27800 ) ( SURFACE-AT ?auto_27799 ?auto_27800 ) ( CLEAR ?auto_27799 ) ( IS-CRATE ?auto_27798 ) ( not ( = ?auto_27798 ?auto_27799 ) ) ( AVAILABLE ?auto_27801 ) ( TRUCK-AT ?auto_27802 ?auto_27803 ) ( not ( = ?auto_27803 ?auto_27800 ) ) ( HOIST-AT ?auto_27804 ?auto_27803 ) ( LIFTING ?auto_27804 ?auto_27798 ) ( not ( = ?auto_27801 ?auto_27804 ) ) )
    :subtasks
    ( ( !LOAD ?auto_27804 ?auto_27798 ?auto_27802 ?auto_27803 )
      ( MAKE-ON ?auto_27798 ?auto_27799 )
      ( MAKE-ON-VERIFY ?auto_27798 ?auto_27799 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27805 - SURFACE
      ?auto_27806 - SURFACE
    )
    :vars
    (
      ?auto_27811 - HOIST
      ?auto_27810 - PLACE
      ?auto_27809 - TRUCK
      ?auto_27808 - PLACE
      ?auto_27807 - HOIST
      ?auto_27812 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27811 ?auto_27810 ) ( SURFACE-AT ?auto_27806 ?auto_27810 ) ( CLEAR ?auto_27806 ) ( IS-CRATE ?auto_27805 ) ( not ( = ?auto_27805 ?auto_27806 ) ) ( AVAILABLE ?auto_27811 ) ( TRUCK-AT ?auto_27809 ?auto_27808 ) ( not ( = ?auto_27808 ?auto_27810 ) ) ( HOIST-AT ?auto_27807 ?auto_27808 ) ( not ( = ?auto_27811 ?auto_27807 ) ) ( AVAILABLE ?auto_27807 ) ( SURFACE-AT ?auto_27805 ?auto_27808 ) ( ON ?auto_27805 ?auto_27812 ) ( CLEAR ?auto_27805 ) ( not ( = ?auto_27805 ?auto_27812 ) ) ( not ( = ?auto_27806 ?auto_27812 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27807 ?auto_27805 ?auto_27812 ?auto_27808 )
      ( MAKE-ON ?auto_27805 ?auto_27806 )
      ( MAKE-ON-VERIFY ?auto_27805 ?auto_27806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27813 - SURFACE
      ?auto_27814 - SURFACE
    )
    :vars
    (
      ?auto_27815 - HOIST
      ?auto_27820 - PLACE
      ?auto_27816 - PLACE
      ?auto_27819 - HOIST
      ?auto_27818 - SURFACE
      ?auto_27817 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27815 ?auto_27820 ) ( SURFACE-AT ?auto_27814 ?auto_27820 ) ( CLEAR ?auto_27814 ) ( IS-CRATE ?auto_27813 ) ( not ( = ?auto_27813 ?auto_27814 ) ) ( AVAILABLE ?auto_27815 ) ( not ( = ?auto_27816 ?auto_27820 ) ) ( HOIST-AT ?auto_27819 ?auto_27816 ) ( not ( = ?auto_27815 ?auto_27819 ) ) ( AVAILABLE ?auto_27819 ) ( SURFACE-AT ?auto_27813 ?auto_27816 ) ( ON ?auto_27813 ?auto_27818 ) ( CLEAR ?auto_27813 ) ( not ( = ?auto_27813 ?auto_27818 ) ) ( not ( = ?auto_27814 ?auto_27818 ) ) ( TRUCK-AT ?auto_27817 ?auto_27820 ) )
    :subtasks
    ( ( !DRIVE ?auto_27817 ?auto_27820 ?auto_27816 )
      ( MAKE-ON ?auto_27813 ?auto_27814 )
      ( MAKE-ON-VERIFY ?auto_27813 ?auto_27814 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27821 - SURFACE
      ?auto_27822 - SURFACE
    )
    :vars
    (
      ?auto_27825 - HOIST
      ?auto_27824 - PLACE
      ?auto_27826 - PLACE
      ?auto_27828 - HOIST
      ?auto_27823 - SURFACE
      ?auto_27827 - TRUCK
      ?auto_27829 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27825 ?auto_27824 ) ( IS-CRATE ?auto_27821 ) ( not ( = ?auto_27821 ?auto_27822 ) ) ( not ( = ?auto_27826 ?auto_27824 ) ) ( HOIST-AT ?auto_27828 ?auto_27826 ) ( not ( = ?auto_27825 ?auto_27828 ) ) ( AVAILABLE ?auto_27828 ) ( SURFACE-AT ?auto_27821 ?auto_27826 ) ( ON ?auto_27821 ?auto_27823 ) ( CLEAR ?auto_27821 ) ( not ( = ?auto_27821 ?auto_27823 ) ) ( not ( = ?auto_27822 ?auto_27823 ) ) ( TRUCK-AT ?auto_27827 ?auto_27824 ) ( SURFACE-AT ?auto_27829 ?auto_27824 ) ( CLEAR ?auto_27829 ) ( LIFTING ?auto_27825 ?auto_27822 ) ( IS-CRATE ?auto_27822 ) ( not ( = ?auto_27821 ?auto_27829 ) ) ( not ( = ?auto_27822 ?auto_27829 ) ) ( not ( = ?auto_27823 ?auto_27829 ) ) )
    :subtasks
    ( ( !DROP ?auto_27825 ?auto_27822 ?auto_27829 ?auto_27824 )
      ( MAKE-ON ?auto_27821 ?auto_27822 )
      ( MAKE-ON-VERIFY ?auto_27821 ?auto_27822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27830 - SURFACE
      ?auto_27831 - SURFACE
    )
    :vars
    (
      ?auto_27833 - HOIST
      ?auto_27834 - PLACE
      ?auto_27837 - PLACE
      ?auto_27832 - HOIST
      ?auto_27836 - SURFACE
      ?auto_27838 - TRUCK
      ?auto_27835 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27833 ?auto_27834 ) ( IS-CRATE ?auto_27830 ) ( not ( = ?auto_27830 ?auto_27831 ) ) ( not ( = ?auto_27837 ?auto_27834 ) ) ( HOIST-AT ?auto_27832 ?auto_27837 ) ( not ( = ?auto_27833 ?auto_27832 ) ) ( AVAILABLE ?auto_27832 ) ( SURFACE-AT ?auto_27830 ?auto_27837 ) ( ON ?auto_27830 ?auto_27836 ) ( CLEAR ?auto_27830 ) ( not ( = ?auto_27830 ?auto_27836 ) ) ( not ( = ?auto_27831 ?auto_27836 ) ) ( TRUCK-AT ?auto_27838 ?auto_27834 ) ( SURFACE-AT ?auto_27835 ?auto_27834 ) ( CLEAR ?auto_27835 ) ( IS-CRATE ?auto_27831 ) ( not ( = ?auto_27830 ?auto_27835 ) ) ( not ( = ?auto_27831 ?auto_27835 ) ) ( not ( = ?auto_27836 ?auto_27835 ) ) ( AVAILABLE ?auto_27833 ) ( IN ?auto_27831 ?auto_27838 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27833 ?auto_27831 ?auto_27838 ?auto_27834 )
      ( MAKE-ON ?auto_27830 ?auto_27831 )
      ( MAKE-ON-VERIFY ?auto_27830 ?auto_27831 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27839 - SURFACE
      ?auto_27840 - SURFACE
    )
    :vars
    (
      ?auto_27845 - HOIST
      ?auto_27841 - PLACE
      ?auto_27842 - PLACE
      ?auto_27844 - HOIST
      ?auto_27843 - SURFACE
      ?auto_27847 - SURFACE
      ?auto_27846 - TRUCK
      ?auto_27848 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27845 ?auto_27841 ) ( IS-CRATE ?auto_27839 ) ( not ( = ?auto_27839 ?auto_27840 ) ) ( not ( = ?auto_27842 ?auto_27841 ) ) ( HOIST-AT ?auto_27844 ?auto_27842 ) ( not ( = ?auto_27845 ?auto_27844 ) ) ( AVAILABLE ?auto_27844 ) ( SURFACE-AT ?auto_27839 ?auto_27842 ) ( ON ?auto_27839 ?auto_27843 ) ( CLEAR ?auto_27839 ) ( not ( = ?auto_27839 ?auto_27843 ) ) ( not ( = ?auto_27840 ?auto_27843 ) ) ( SURFACE-AT ?auto_27847 ?auto_27841 ) ( CLEAR ?auto_27847 ) ( IS-CRATE ?auto_27840 ) ( not ( = ?auto_27839 ?auto_27847 ) ) ( not ( = ?auto_27840 ?auto_27847 ) ) ( not ( = ?auto_27843 ?auto_27847 ) ) ( AVAILABLE ?auto_27845 ) ( IN ?auto_27840 ?auto_27846 ) ( TRUCK-AT ?auto_27846 ?auto_27848 ) ( not ( = ?auto_27848 ?auto_27841 ) ) ( not ( = ?auto_27842 ?auto_27848 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27846 ?auto_27848 ?auto_27841 )
      ( MAKE-ON ?auto_27839 ?auto_27840 )
      ( MAKE-ON-VERIFY ?auto_27839 ?auto_27840 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27849 - SURFACE
      ?auto_27850 - SURFACE
    )
    :vars
    (
      ?auto_27856 - HOIST
      ?auto_27851 - PLACE
      ?auto_27857 - PLACE
      ?auto_27852 - HOIST
      ?auto_27855 - SURFACE
      ?auto_27858 - SURFACE
      ?auto_27853 - TRUCK
      ?auto_27854 - PLACE
      ?auto_27859 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27856 ?auto_27851 ) ( IS-CRATE ?auto_27849 ) ( not ( = ?auto_27849 ?auto_27850 ) ) ( not ( = ?auto_27857 ?auto_27851 ) ) ( HOIST-AT ?auto_27852 ?auto_27857 ) ( not ( = ?auto_27856 ?auto_27852 ) ) ( AVAILABLE ?auto_27852 ) ( SURFACE-AT ?auto_27849 ?auto_27857 ) ( ON ?auto_27849 ?auto_27855 ) ( CLEAR ?auto_27849 ) ( not ( = ?auto_27849 ?auto_27855 ) ) ( not ( = ?auto_27850 ?auto_27855 ) ) ( SURFACE-AT ?auto_27858 ?auto_27851 ) ( CLEAR ?auto_27858 ) ( IS-CRATE ?auto_27850 ) ( not ( = ?auto_27849 ?auto_27858 ) ) ( not ( = ?auto_27850 ?auto_27858 ) ) ( not ( = ?auto_27855 ?auto_27858 ) ) ( AVAILABLE ?auto_27856 ) ( TRUCK-AT ?auto_27853 ?auto_27854 ) ( not ( = ?auto_27854 ?auto_27851 ) ) ( not ( = ?auto_27857 ?auto_27854 ) ) ( HOIST-AT ?auto_27859 ?auto_27854 ) ( LIFTING ?auto_27859 ?auto_27850 ) ( not ( = ?auto_27856 ?auto_27859 ) ) ( not ( = ?auto_27852 ?auto_27859 ) ) )
    :subtasks
    ( ( !LOAD ?auto_27859 ?auto_27850 ?auto_27853 ?auto_27854 )
      ( MAKE-ON ?auto_27849 ?auto_27850 )
      ( MAKE-ON-VERIFY ?auto_27849 ?auto_27850 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27860 - SURFACE
      ?auto_27861 - SURFACE
    )
    :vars
    (
      ?auto_27862 - HOIST
      ?auto_27865 - PLACE
      ?auto_27866 - PLACE
      ?auto_27863 - HOIST
      ?auto_27869 - SURFACE
      ?auto_27867 - SURFACE
      ?auto_27870 - TRUCK
      ?auto_27868 - PLACE
      ?auto_27864 - HOIST
      ?auto_27871 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27862 ?auto_27865 ) ( IS-CRATE ?auto_27860 ) ( not ( = ?auto_27860 ?auto_27861 ) ) ( not ( = ?auto_27866 ?auto_27865 ) ) ( HOIST-AT ?auto_27863 ?auto_27866 ) ( not ( = ?auto_27862 ?auto_27863 ) ) ( AVAILABLE ?auto_27863 ) ( SURFACE-AT ?auto_27860 ?auto_27866 ) ( ON ?auto_27860 ?auto_27869 ) ( CLEAR ?auto_27860 ) ( not ( = ?auto_27860 ?auto_27869 ) ) ( not ( = ?auto_27861 ?auto_27869 ) ) ( SURFACE-AT ?auto_27867 ?auto_27865 ) ( CLEAR ?auto_27867 ) ( IS-CRATE ?auto_27861 ) ( not ( = ?auto_27860 ?auto_27867 ) ) ( not ( = ?auto_27861 ?auto_27867 ) ) ( not ( = ?auto_27869 ?auto_27867 ) ) ( AVAILABLE ?auto_27862 ) ( TRUCK-AT ?auto_27870 ?auto_27868 ) ( not ( = ?auto_27868 ?auto_27865 ) ) ( not ( = ?auto_27866 ?auto_27868 ) ) ( HOIST-AT ?auto_27864 ?auto_27868 ) ( not ( = ?auto_27862 ?auto_27864 ) ) ( not ( = ?auto_27863 ?auto_27864 ) ) ( AVAILABLE ?auto_27864 ) ( SURFACE-AT ?auto_27861 ?auto_27868 ) ( ON ?auto_27861 ?auto_27871 ) ( CLEAR ?auto_27861 ) ( not ( = ?auto_27860 ?auto_27871 ) ) ( not ( = ?auto_27861 ?auto_27871 ) ) ( not ( = ?auto_27869 ?auto_27871 ) ) ( not ( = ?auto_27867 ?auto_27871 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27864 ?auto_27861 ?auto_27871 ?auto_27868 )
      ( MAKE-ON ?auto_27860 ?auto_27861 )
      ( MAKE-ON-VERIFY ?auto_27860 ?auto_27861 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27872 - SURFACE
      ?auto_27873 - SURFACE
    )
    :vars
    (
      ?auto_27875 - HOIST
      ?auto_27878 - PLACE
      ?auto_27879 - PLACE
      ?auto_27881 - HOIST
      ?auto_27880 - SURFACE
      ?auto_27877 - SURFACE
      ?auto_27876 - PLACE
      ?auto_27874 - HOIST
      ?auto_27882 - SURFACE
      ?auto_27883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27875 ?auto_27878 ) ( IS-CRATE ?auto_27872 ) ( not ( = ?auto_27872 ?auto_27873 ) ) ( not ( = ?auto_27879 ?auto_27878 ) ) ( HOIST-AT ?auto_27881 ?auto_27879 ) ( not ( = ?auto_27875 ?auto_27881 ) ) ( AVAILABLE ?auto_27881 ) ( SURFACE-AT ?auto_27872 ?auto_27879 ) ( ON ?auto_27872 ?auto_27880 ) ( CLEAR ?auto_27872 ) ( not ( = ?auto_27872 ?auto_27880 ) ) ( not ( = ?auto_27873 ?auto_27880 ) ) ( SURFACE-AT ?auto_27877 ?auto_27878 ) ( CLEAR ?auto_27877 ) ( IS-CRATE ?auto_27873 ) ( not ( = ?auto_27872 ?auto_27877 ) ) ( not ( = ?auto_27873 ?auto_27877 ) ) ( not ( = ?auto_27880 ?auto_27877 ) ) ( AVAILABLE ?auto_27875 ) ( not ( = ?auto_27876 ?auto_27878 ) ) ( not ( = ?auto_27879 ?auto_27876 ) ) ( HOIST-AT ?auto_27874 ?auto_27876 ) ( not ( = ?auto_27875 ?auto_27874 ) ) ( not ( = ?auto_27881 ?auto_27874 ) ) ( AVAILABLE ?auto_27874 ) ( SURFACE-AT ?auto_27873 ?auto_27876 ) ( ON ?auto_27873 ?auto_27882 ) ( CLEAR ?auto_27873 ) ( not ( = ?auto_27872 ?auto_27882 ) ) ( not ( = ?auto_27873 ?auto_27882 ) ) ( not ( = ?auto_27880 ?auto_27882 ) ) ( not ( = ?auto_27877 ?auto_27882 ) ) ( TRUCK-AT ?auto_27883 ?auto_27878 ) )
    :subtasks
    ( ( !DRIVE ?auto_27883 ?auto_27878 ?auto_27876 )
      ( MAKE-ON ?auto_27872 ?auto_27873 )
      ( MAKE-ON-VERIFY ?auto_27872 ?auto_27873 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27884 - SURFACE
      ?auto_27885 - SURFACE
    )
    :vars
    (
      ?auto_27890 - HOIST
      ?auto_27894 - PLACE
      ?auto_27886 - PLACE
      ?auto_27893 - HOIST
      ?auto_27889 - SURFACE
      ?auto_27887 - SURFACE
      ?auto_27891 - PLACE
      ?auto_27892 - HOIST
      ?auto_27895 - SURFACE
      ?auto_27888 - TRUCK
      ?auto_27896 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27890 ?auto_27894 ) ( IS-CRATE ?auto_27884 ) ( not ( = ?auto_27884 ?auto_27885 ) ) ( not ( = ?auto_27886 ?auto_27894 ) ) ( HOIST-AT ?auto_27893 ?auto_27886 ) ( not ( = ?auto_27890 ?auto_27893 ) ) ( AVAILABLE ?auto_27893 ) ( SURFACE-AT ?auto_27884 ?auto_27886 ) ( ON ?auto_27884 ?auto_27889 ) ( CLEAR ?auto_27884 ) ( not ( = ?auto_27884 ?auto_27889 ) ) ( not ( = ?auto_27885 ?auto_27889 ) ) ( IS-CRATE ?auto_27885 ) ( not ( = ?auto_27884 ?auto_27887 ) ) ( not ( = ?auto_27885 ?auto_27887 ) ) ( not ( = ?auto_27889 ?auto_27887 ) ) ( not ( = ?auto_27891 ?auto_27894 ) ) ( not ( = ?auto_27886 ?auto_27891 ) ) ( HOIST-AT ?auto_27892 ?auto_27891 ) ( not ( = ?auto_27890 ?auto_27892 ) ) ( not ( = ?auto_27893 ?auto_27892 ) ) ( AVAILABLE ?auto_27892 ) ( SURFACE-AT ?auto_27885 ?auto_27891 ) ( ON ?auto_27885 ?auto_27895 ) ( CLEAR ?auto_27885 ) ( not ( = ?auto_27884 ?auto_27895 ) ) ( not ( = ?auto_27885 ?auto_27895 ) ) ( not ( = ?auto_27889 ?auto_27895 ) ) ( not ( = ?auto_27887 ?auto_27895 ) ) ( TRUCK-AT ?auto_27888 ?auto_27894 ) ( SURFACE-AT ?auto_27896 ?auto_27894 ) ( CLEAR ?auto_27896 ) ( LIFTING ?auto_27890 ?auto_27887 ) ( IS-CRATE ?auto_27887 ) ( not ( = ?auto_27884 ?auto_27896 ) ) ( not ( = ?auto_27885 ?auto_27896 ) ) ( not ( = ?auto_27889 ?auto_27896 ) ) ( not ( = ?auto_27887 ?auto_27896 ) ) ( not ( = ?auto_27895 ?auto_27896 ) ) )
    :subtasks
    ( ( !DROP ?auto_27890 ?auto_27887 ?auto_27896 ?auto_27894 )
      ( MAKE-ON ?auto_27884 ?auto_27885 )
      ( MAKE-ON-VERIFY ?auto_27884 ?auto_27885 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27897 - SURFACE
      ?auto_27898 - SURFACE
    )
    :vars
    (
      ?auto_27903 - HOIST
      ?auto_27901 - PLACE
      ?auto_27906 - PLACE
      ?auto_27900 - HOIST
      ?auto_27907 - SURFACE
      ?auto_27899 - SURFACE
      ?auto_27909 - PLACE
      ?auto_27908 - HOIST
      ?auto_27904 - SURFACE
      ?auto_27902 - TRUCK
      ?auto_27905 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27903 ?auto_27901 ) ( IS-CRATE ?auto_27897 ) ( not ( = ?auto_27897 ?auto_27898 ) ) ( not ( = ?auto_27906 ?auto_27901 ) ) ( HOIST-AT ?auto_27900 ?auto_27906 ) ( not ( = ?auto_27903 ?auto_27900 ) ) ( AVAILABLE ?auto_27900 ) ( SURFACE-AT ?auto_27897 ?auto_27906 ) ( ON ?auto_27897 ?auto_27907 ) ( CLEAR ?auto_27897 ) ( not ( = ?auto_27897 ?auto_27907 ) ) ( not ( = ?auto_27898 ?auto_27907 ) ) ( IS-CRATE ?auto_27898 ) ( not ( = ?auto_27897 ?auto_27899 ) ) ( not ( = ?auto_27898 ?auto_27899 ) ) ( not ( = ?auto_27907 ?auto_27899 ) ) ( not ( = ?auto_27909 ?auto_27901 ) ) ( not ( = ?auto_27906 ?auto_27909 ) ) ( HOIST-AT ?auto_27908 ?auto_27909 ) ( not ( = ?auto_27903 ?auto_27908 ) ) ( not ( = ?auto_27900 ?auto_27908 ) ) ( AVAILABLE ?auto_27908 ) ( SURFACE-AT ?auto_27898 ?auto_27909 ) ( ON ?auto_27898 ?auto_27904 ) ( CLEAR ?auto_27898 ) ( not ( = ?auto_27897 ?auto_27904 ) ) ( not ( = ?auto_27898 ?auto_27904 ) ) ( not ( = ?auto_27907 ?auto_27904 ) ) ( not ( = ?auto_27899 ?auto_27904 ) ) ( TRUCK-AT ?auto_27902 ?auto_27901 ) ( SURFACE-AT ?auto_27905 ?auto_27901 ) ( CLEAR ?auto_27905 ) ( IS-CRATE ?auto_27899 ) ( not ( = ?auto_27897 ?auto_27905 ) ) ( not ( = ?auto_27898 ?auto_27905 ) ) ( not ( = ?auto_27907 ?auto_27905 ) ) ( not ( = ?auto_27899 ?auto_27905 ) ) ( not ( = ?auto_27904 ?auto_27905 ) ) ( AVAILABLE ?auto_27903 ) ( IN ?auto_27899 ?auto_27902 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27903 ?auto_27899 ?auto_27902 ?auto_27901 )
      ( MAKE-ON ?auto_27897 ?auto_27898 )
      ( MAKE-ON-VERIFY ?auto_27897 ?auto_27898 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27910 - SURFACE
      ?auto_27911 - SURFACE
    )
    :vars
    (
      ?auto_27912 - HOIST
      ?auto_27915 - PLACE
      ?auto_27919 - PLACE
      ?auto_27913 - HOIST
      ?auto_27916 - SURFACE
      ?auto_27918 - SURFACE
      ?auto_27921 - PLACE
      ?auto_27922 - HOIST
      ?auto_27920 - SURFACE
      ?auto_27917 - SURFACE
      ?auto_27914 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27912 ?auto_27915 ) ( IS-CRATE ?auto_27910 ) ( not ( = ?auto_27910 ?auto_27911 ) ) ( not ( = ?auto_27919 ?auto_27915 ) ) ( HOIST-AT ?auto_27913 ?auto_27919 ) ( not ( = ?auto_27912 ?auto_27913 ) ) ( AVAILABLE ?auto_27913 ) ( SURFACE-AT ?auto_27910 ?auto_27919 ) ( ON ?auto_27910 ?auto_27916 ) ( CLEAR ?auto_27910 ) ( not ( = ?auto_27910 ?auto_27916 ) ) ( not ( = ?auto_27911 ?auto_27916 ) ) ( IS-CRATE ?auto_27911 ) ( not ( = ?auto_27910 ?auto_27918 ) ) ( not ( = ?auto_27911 ?auto_27918 ) ) ( not ( = ?auto_27916 ?auto_27918 ) ) ( not ( = ?auto_27921 ?auto_27915 ) ) ( not ( = ?auto_27919 ?auto_27921 ) ) ( HOIST-AT ?auto_27922 ?auto_27921 ) ( not ( = ?auto_27912 ?auto_27922 ) ) ( not ( = ?auto_27913 ?auto_27922 ) ) ( AVAILABLE ?auto_27922 ) ( SURFACE-AT ?auto_27911 ?auto_27921 ) ( ON ?auto_27911 ?auto_27920 ) ( CLEAR ?auto_27911 ) ( not ( = ?auto_27910 ?auto_27920 ) ) ( not ( = ?auto_27911 ?auto_27920 ) ) ( not ( = ?auto_27916 ?auto_27920 ) ) ( not ( = ?auto_27918 ?auto_27920 ) ) ( SURFACE-AT ?auto_27917 ?auto_27915 ) ( CLEAR ?auto_27917 ) ( IS-CRATE ?auto_27918 ) ( not ( = ?auto_27910 ?auto_27917 ) ) ( not ( = ?auto_27911 ?auto_27917 ) ) ( not ( = ?auto_27916 ?auto_27917 ) ) ( not ( = ?auto_27918 ?auto_27917 ) ) ( not ( = ?auto_27920 ?auto_27917 ) ) ( AVAILABLE ?auto_27912 ) ( IN ?auto_27918 ?auto_27914 ) ( TRUCK-AT ?auto_27914 ?auto_27921 ) )
    :subtasks
    ( ( !DRIVE ?auto_27914 ?auto_27921 ?auto_27915 )
      ( MAKE-ON ?auto_27910 ?auto_27911 )
      ( MAKE-ON-VERIFY ?auto_27910 ?auto_27911 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27923 - SURFACE
      ?auto_27924 - SURFACE
    )
    :vars
    (
      ?auto_27933 - HOIST
      ?auto_27935 - PLACE
      ?auto_27930 - PLACE
      ?auto_27928 - HOIST
      ?auto_27927 - SURFACE
      ?auto_27926 - SURFACE
      ?auto_27931 - PLACE
      ?auto_27929 - HOIST
      ?auto_27934 - SURFACE
      ?auto_27925 - SURFACE
      ?auto_27932 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27933 ?auto_27935 ) ( IS-CRATE ?auto_27923 ) ( not ( = ?auto_27923 ?auto_27924 ) ) ( not ( = ?auto_27930 ?auto_27935 ) ) ( HOIST-AT ?auto_27928 ?auto_27930 ) ( not ( = ?auto_27933 ?auto_27928 ) ) ( AVAILABLE ?auto_27928 ) ( SURFACE-AT ?auto_27923 ?auto_27930 ) ( ON ?auto_27923 ?auto_27927 ) ( CLEAR ?auto_27923 ) ( not ( = ?auto_27923 ?auto_27927 ) ) ( not ( = ?auto_27924 ?auto_27927 ) ) ( IS-CRATE ?auto_27924 ) ( not ( = ?auto_27923 ?auto_27926 ) ) ( not ( = ?auto_27924 ?auto_27926 ) ) ( not ( = ?auto_27927 ?auto_27926 ) ) ( not ( = ?auto_27931 ?auto_27935 ) ) ( not ( = ?auto_27930 ?auto_27931 ) ) ( HOIST-AT ?auto_27929 ?auto_27931 ) ( not ( = ?auto_27933 ?auto_27929 ) ) ( not ( = ?auto_27928 ?auto_27929 ) ) ( SURFACE-AT ?auto_27924 ?auto_27931 ) ( ON ?auto_27924 ?auto_27934 ) ( CLEAR ?auto_27924 ) ( not ( = ?auto_27923 ?auto_27934 ) ) ( not ( = ?auto_27924 ?auto_27934 ) ) ( not ( = ?auto_27927 ?auto_27934 ) ) ( not ( = ?auto_27926 ?auto_27934 ) ) ( SURFACE-AT ?auto_27925 ?auto_27935 ) ( CLEAR ?auto_27925 ) ( IS-CRATE ?auto_27926 ) ( not ( = ?auto_27923 ?auto_27925 ) ) ( not ( = ?auto_27924 ?auto_27925 ) ) ( not ( = ?auto_27927 ?auto_27925 ) ) ( not ( = ?auto_27926 ?auto_27925 ) ) ( not ( = ?auto_27934 ?auto_27925 ) ) ( AVAILABLE ?auto_27933 ) ( TRUCK-AT ?auto_27932 ?auto_27931 ) ( LIFTING ?auto_27929 ?auto_27926 ) )
    :subtasks
    ( ( !LOAD ?auto_27929 ?auto_27926 ?auto_27932 ?auto_27931 )
      ( MAKE-ON ?auto_27923 ?auto_27924 )
      ( MAKE-ON-VERIFY ?auto_27923 ?auto_27924 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27936 - SURFACE
      ?auto_27937 - SURFACE
    )
    :vars
    (
      ?auto_27945 - HOIST
      ?auto_27941 - PLACE
      ?auto_27948 - PLACE
      ?auto_27938 - HOIST
      ?auto_27940 - SURFACE
      ?auto_27939 - SURFACE
      ?auto_27947 - PLACE
      ?auto_27946 - HOIST
      ?auto_27942 - SURFACE
      ?auto_27943 - SURFACE
      ?auto_27944 - TRUCK
      ?auto_27949 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27945 ?auto_27941 ) ( IS-CRATE ?auto_27936 ) ( not ( = ?auto_27936 ?auto_27937 ) ) ( not ( = ?auto_27948 ?auto_27941 ) ) ( HOIST-AT ?auto_27938 ?auto_27948 ) ( not ( = ?auto_27945 ?auto_27938 ) ) ( AVAILABLE ?auto_27938 ) ( SURFACE-AT ?auto_27936 ?auto_27948 ) ( ON ?auto_27936 ?auto_27940 ) ( CLEAR ?auto_27936 ) ( not ( = ?auto_27936 ?auto_27940 ) ) ( not ( = ?auto_27937 ?auto_27940 ) ) ( IS-CRATE ?auto_27937 ) ( not ( = ?auto_27936 ?auto_27939 ) ) ( not ( = ?auto_27937 ?auto_27939 ) ) ( not ( = ?auto_27940 ?auto_27939 ) ) ( not ( = ?auto_27947 ?auto_27941 ) ) ( not ( = ?auto_27948 ?auto_27947 ) ) ( HOIST-AT ?auto_27946 ?auto_27947 ) ( not ( = ?auto_27945 ?auto_27946 ) ) ( not ( = ?auto_27938 ?auto_27946 ) ) ( SURFACE-AT ?auto_27937 ?auto_27947 ) ( ON ?auto_27937 ?auto_27942 ) ( CLEAR ?auto_27937 ) ( not ( = ?auto_27936 ?auto_27942 ) ) ( not ( = ?auto_27937 ?auto_27942 ) ) ( not ( = ?auto_27940 ?auto_27942 ) ) ( not ( = ?auto_27939 ?auto_27942 ) ) ( SURFACE-AT ?auto_27943 ?auto_27941 ) ( CLEAR ?auto_27943 ) ( IS-CRATE ?auto_27939 ) ( not ( = ?auto_27936 ?auto_27943 ) ) ( not ( = ?auto_27937 ?auto_27943 ) ) ( not ( = ?auto_27940 ?auto_27943 ) ) ( not ( = ?auto_27939 ?auto_27943 ) ) ( not ( = ?auto_27942 ?auto_27943 ) ) ( AVAILABLE ?auto_27945 ) ( TRUCK-AT ?auto_27944 ?auto_27947 ) ( AVAILABLE ?auto_27946 ) ( SURFACE-AT ?auto_27939 ?auto_27947 ) ( ON ?auto_27939 ?auto_27949 ) ( CLEAR ?auto_27939 ) ( not ( = ?auto_27936 ?auto_27949 ) ) ( not ( = ?auto_27937 ?auto_27949 ) ) ( not ( = ?auto_27940 ?auto_27949 ) ) ( not ( = ?auto_27939 ?auto_27949 ) ) ( not ( = ?auto_27942 ?auto_27949 ) ) ( not ( = ?auto_27943 ?auto_27949 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27946 ?auto_27939 ?auto_27949 ?auto_27947 )
      ( MAKE-ON ?auto_27936 ?auto_27937 )
      ( MAKE-ON-VERIFY ?auto_27936 ?auto_27937 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27950 - SURFACE
      ?auto_27951 - SURFACE
    )
    :vars
    (
      ?auto_27956 - HOIST
      ?auto_27957 - PLACE
      ?auto_27963 - PLACE
      ?auto_27961 - HOIST
      ?auto_27959 - SURFACE
      ?auto_27960 - SURFACE
      ?auto_27962 - PLACE
      ?auto_27955 - HOIST
      ?auto_27953 - SURFACE
      ?auto_27954 - SURFACE
      ?auto_27958 - SURFACE
      ?auto_27952 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27956 ?auto_27957 ) ( IS-CRATE ?auto_27950 ) ( not ( = ?auto_27950 ?auto_27951 ) ) ( not ( = ?auto_27963 ?auto_27957 ) ) ( HOIST-AT ?auto_27961 ?auto_27963 ) ( not ( = ?auto_27956 ?auto_27961 ) ) ( AVAILABLE ?auto_27961 ) ( SURFACE-AT ?auto_27950 ?auto_27963 ) ( ON ?auto_27950 ?auto_27959 ) ( CLEAR ?auto_27950 ) ( not ( = ?auto_27950 ?auto_27959 ) ) ( not ( = ?auto_27951 ?auto_27959 ) ) ( IS-CRATE ?auto_27951 ) ( not ( = ?auto_27950 ?auto_27960 ) ) ( not ( = ?auto_27951 ?auto_27960 ) ) ( not ( = ?auto_27959 ?auto_27960 ) ) ( not ( = ?auto_27962 ?auto_27957 ) ) ( not ( = ?auto_27963 ?auto_27962 ) ) ( HOIST-AT ?auto_27955 ?auto_27962 ) ( not ( = ?auto_27956 ?auto_27955 ) ) ( not ( = ?auto_27961 ?auto_27955 ) ) ( SURFACE-AT ?auto_27951 ?auto_27962 ) ( ON ?auto_27951 ?auto_27953 ) ( CLEAR ?auto_27951 ) ( not ( = ?auto_27950 ?auto_27953 ) ) ( not ( = ?auto_27951 ?auto_27953 ) ) ( not ( = ?auto_27959 ?auto_27953 ) ) ( not ( = ?auto_27960 ?auto_27953 ) ) ( SURFACE-AT ?auto_27954 ?auto_27957 ) ( CLEAR ?auto_27954 ) ( IS-CRATE ?auto_27960 ) ( not ( = ?auto_27950 ?auto_27954 ) ) ( not ( = ?auto_27951 ?auto_27954 ) ) ( not ( = ?auto_27959 ?auto_27954 ) ) ( not ( = ?auto_27960 ?auto_27954 ) ) ( not ( = ?auto_27953 ?auto_27954 ) ) ( AVAILABLE ?auto_27956 ) ( AVAILABLE ?auto_27955 ) ( SURFACE-AT ?auto_27960 ?auto_27962 ) ( ON ?auto_27960 ?auto_27958 ) ( CLEAR ?auto_27960 ) ( not ( = ?auto_27950 ?auto_27958 ) ) ( not ( = ?auto_27951 ?auto_27958 ) ) ( not ( = ?auto_27959 ?auto_27958 ) ) ( not ( = ?auto_27960 ?auto_27958 ) ) ( not ( = ?auto_27953 ?auto_27958 ) ) ( not ( = ?auto_27954 ?auto_27958 ) ) ( TRUCK-AT ?auto_27952 ?auto_27957 ) )
    :subtasks
    ( ( !DRIVE ?auto_27952 ?auto_27957 ?auto_27962 )
      ( MAKE-ON ?auto_27950 ?auto_27951 )
      ( MAKE-ON-VERIFY ?auto_27950 ?auto_27951 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27964 - SURFACE
      ?auto_27965 - SURFACE
    )
    :vars
    (
      ?auto_27970 - HOIST
      ?auto_27977 - PLACE
      ?auto_27975 - PLACE
      ?auto_27969 - HOIST
      ?auto_27976 - SURFACE
      ?auto_27966 - SURFACE
      ?auto_27974 - PLACE
      ?auto_27971 - HOIST
      ?auto_27972 - SURFACE
      ?auto_27967 - SURFACE
      ?auto_27968 - SURFACE
      ?auto_27973 - TRUCK
      ?auto_27978 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27970 ?auto_27977 ) ( IS-CRATE ?auto_27964 ) ( not ( = ?auto_27964 ?auto_27965 ) ) ( not ( = ?auto_27975 ?auto_27977 ) ) ( HOIST-AT ?auto_27969 ?auto_27975 ) ( not ( = ?auto_27970 ?auto_27969 ) ) ( AVAILABLE ?auto_27969 ) ( SURFACE-AT ?auto_27964 ?auto_27975 ) ( ON ?auto_27964 ?auto_27976 ) ( CLEAR ?auto_27964 ) ( not ( = ?auto_27964 ?auto_27976 ) ) ( not ( = ?auto_27965 ?auto_27976 ) ) ( IS-CRATE ?auto_27965 ) ( not ( = ?auto_27964 ?auto_27966 ) ) ( not ( = ?auto_27965 ?auto_27966 ) ) ( not ( = ?auto_27976 ?auto_27966 ) ) ( not ( = ?auto_27974 ?auto_27977 ) ) ( not ( = ?auto_27975 ?auto_27974 ) ) ( HOIST-AT ?auto_27971 ?auto_27974 ) ( not ( = ?auto_27970 ?auto_27971 ) ) ( not ( = ?auto_27969 ?auto_27971 ) ) ( SURFACE-AT ?auto_27965 ?auto_27974 ) ( ON ?auto_27965 ?auto_27972 ) ( CLEAR ?auto_27965 ) ( not ( = ?auto_27964 ?auto_27972 ) ) ( not ( = ?auto_27965 ?auto_27972 ) ) ( not ( = ?auto_27976 ?auto_27972 ) ) ( not ( = ?auto_27966 ?auto_27972 ) ) ( IS-CRATE ?auto_27966 ) ( not ( = ?auto_27964 ?auto_27967 ) ) ( not ( = ?auto_27965 ?auto_27967 ) ) ( not ( = ?auto_27976 ?auto_27967 ) ) ( not ( = ?auto_27966 ?auto_27967 ) ) ( not ( = ?auto_27972 ?auto_27967 ) ) ( AVAILABLE ?auto_27971 ) ( SURFACE-AT ?auto_27966 ?auto_27974 ) ( ON ?auto_27966 ?auto_27968 ) ( CLEAR ?auto_27966 ) ( not ( = ?auto_27964 ?auto_27968 ) ) ( not ( = ?auto_27965 ?auto_27968 ) ) ( not ( = ?auto_27976 ?auto_27968 ) ) ( not ( = ?auto_27966 ?auto_27968 ) ) ( not ( = ?auto_27972 ?auto_27968 ) ) ( not ( = ?auto_27967 ?auto_27968 ) ) ( TRUCK-AT ?auto_27973 ?auto_27977 ) ( SURFACE-AT ?auto_27978 ?auto_27977 ) ( CLEAR ?auto_27978 ) ( LIFTING ?auto_27970 ?auto_27967 ) ( IS-CRATE ?auto_27967 ) ( not ( = ?auto_27964 ?auto_27978 ) ) ( not ( = ?auto_27965 ?auto_27978 ) ) ( not ( = ?auto_27976 ?auto_27978 ) ) ( not ( = ?auto_27966 ?auto_27978 ) ) ( not ( = ?auto_27972 ?auto_27978 ) ) ( not ( = ?auto_27967 ?auto_27978 ) ) ( not ( = ?auto_27968 ?auto_27978 ) ) )
    :subtasks
    ( ( !DROP ?auto_27970 ?auto_27967 ?auto_27978 ?auto_27977 )
      ( MAKE-ON ?auto_27964 ?auto_27965 )
      ( MAKE-ON-VERIFY ?auto_27964 ?auto_27965 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27979 - SURFACE
      ?auto_27980 - SURFACE
    )
    :vars
    (
      ?auto_27992 - HOIST
      ?auto_27993 - PLACE
      ?auto_27982 - PLACE
      ?auto_27984 - HOIST
      ?auto_27991 - SURFACE
      ?auto_27989 - SURFACE
      ?auto_27988 - PLACE
      ?auto_27985 - HOIST
      ?auto_27987 - SURFACE
      ?auto_27983 - SURFACE
      ?auto_27981 - SURFACE
      ?auto_27990 - TRUCK
      ?auto_27986 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27992 ?auto_27993 ) ( IS-CRATE ?auto_27979 ) ( not ( = ?auto_27979 ?auto_27980 ) ) ( not ( = ?auto_27982 ?auto_27993 ) ) ( HOIST-AT ?auto_27984 ?auto_27982 ) ( not ( = ?auto_27992 ?auto_27984 ) ) ( AVAILABLE ?auto_27984 ) ( SURFACE-AT ?auto_27979 ?auto_27982 ) ( ON ?auto_27979 ?auto_27991 ) ( CLEAR ?auto_27979 ) ( not ( = ?auto_27979 ?auto_27991 ) ) ( not ( = ?auto_27980 ?auto_27991 ) ) ( IS-CRATE ?auto_27980 ) ( not ( = ?auto_27979 ?auto_27989 ) ) ( not ( = ?auto_27980 ?auto_27989 ) ) ( not ( = ?auto_27991 ?auto_27989 ) ) ( not ( = ?auto_27988 ?auto_27993 ) ) ( not ( = ?auto_27982 ?auto_27988 ) ) ( HOIST-AT ?auto_27985 ?auto_27988 ) ( not ( = ?auto_27992 ?auto_27985 ) ) ( not ( = ?auto_27984 ?auto_27985 ) ) ( SURFACE-AT ?auto_27980 ?auto_27988 ) ( ON ?auto_27980 ?auto_27987 ) ( CLEAR ?auto_27980 ) ( not ( = ?auto_27979 ?auto_27987 ) ) ( not ( = ?auto_27980 ?auto_27987 ) ) ( not ( = ?auto_27991 ?auto_27987 ) ) ( not ( = ?auto_27989 ?auto_27987 ) ) ( IS-CRATE ?auto_27989 ) ( not ( = ?auto_27979 ?auto_27983 ) ) ( not ( = ?auto_27980 ?auto_27983 ) ) ( not ( = ?auto_27991 ?auto_27983 ) ) ( not ( = ?auto_27989 ?auto_27983 ) ) ( not ( = ?auto_27987 ?auto_27983 ) ) ( AVAILABLE ?auto_27985 ) ( SURFACE-AT ?auto_27989 ?auto_27988 ) ( ON ?auto_27989 ?auto_27981 ) ( CLEAR ?auto_27989 ) ( not ( = ?auto_27979 ?auto_27981 ) ) ( not ( = ?auto_27980 ?auto_27981 ) ) ( not ( = ?auto_27991 ?auto_27981 ) ) ( not ( = ?auto_27989 ?auto_27981 ) ) ( not ( = ?auto_27987 ?auto_27981 ) ) ( not ( = ?auto_27983 ?auto_27981 ) ) ( TRUCK-AT ?auto_27990 ?auto_27993 ) ( SURFACE-AT ?auto_27986 ?auto_27993 ) ( CLEAR ?auto_27986 ) ( IS-CRATE ?auto_27983 ) ( not ( = ?auto_27979 ?auto_27986 ) ) ( not ( = ?auto_27980 ?auto_27986 ) ) ( not ( = ?auto_27991 ?auto_27986 ) ) ( not ( = ?auto_27989 ?auto_27986 ) ) ( not ( = ?auto_27987 ?auto_27986 ) ) ( not ( = ?auto_27983 ?auto_27986 ) ) ( not ( = ?auto_27981 ?auto_27986 ) ) ( AVAILABLE ?auto_27992 ) ( IN ?auto_27983 ?auto_27990 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27992 ?auto_27983 ?auto_27990 ?auto_27993 )
      ( MAKE-ON ?auto_27979 ?auto_27980 )
      ( MAKE-ON-VERIFY ?auto_27979 ?auto_27980 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_27994 - SURFACE
      ?auto_27995 - SURFACE
    )
    :vars
    (
      ?auto_28002 - HOIST
      ?auto_28006 - PLACE
      ?auto_28007 - PLACE
      ?auto_28005 - HOIST
      ?auto_28003 - SURFACE
      ?auto_27998 - SURFACE
      ?auto_28001 - PLACE
      ?auto_27999 - HOIST
      ?auto_27997 - SURFACE
      ?auto_28000 - SURFACE
      ?auto_28008 - SURFACE
      ?auto_27996 - SURFACE
      ?auto_28004 - TRUCK
      ?auto_28009 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28002 ?auto_28006 ) ( IS-CRATE ?auto_27994 ) ( not ( = ?auto_27994 ?auto_27995 ) ) ( not ( = ?auto_28007 ?auto_28006 ) ) ( HOIST-AT ?auto_28005 ?auto_28007 ) ( not ( = ?auto_28002 ?auto_28005 ) ) ( AVAILABLE ?auto_28005 ) ( SURFACE-AT ?auto_27994 ?auto_28007 ) ( ON ?auto_27994 ?auto_28003 ) ( CLEAR ?auto_27994 ) ( not ( = ?auto_27994 ?auto_28003 ) ) ( not ( = ?auto_27995 ?auto_28003 ) ) ( IS-CRATE ?auto_27995 ) ( not ( = ?auto_27994 ?auto_27998 ) ) ( not ( = ?auto_27995 ?auto_27998 ) ) ( not ( = ?auto_28003 ?auto_27998 ) ) ( not ( = ?auto_28001 ?auto_28006 ) ) ( not ( = ?auto_28007 ?auto_28001 ) ) ( HOIST-AT ?auto_27999 ?auto_28001 ) ( not ( = ?auto_28002 ?auto_27999 ) ) ( not ( = ?auto_28005 ?auto_27999 ) ) ( SURFACE-AT ?auto_27995 ?auto_28001 ) ( ON ?auto_27995 ?auto_27997 ) ( CLEAR ?auto_27995 ) ( not ( = ?auto_27994 ?auto_27997 ) ) ( not ( = ?auto_27995 ?auto_27997 ) ) ( not ( = ?auto_28003 ?auto_27997 ) ) ( not ( = ?auto_27998 ?auto_27997 ) ) ( IS-CRATE ?auto_27998 ) ( not ( = ?auto_27994 ?auto_28000 ) ) ( not ( = ?auto_27995 ?auto_28000 ) ) ( not ( = ?auto_28003 ?auto_28000 ) ) ( not ( = ?auto_27998 ?auto_28000 ) ) ( not ( = ?auto_27997 ?auto_28000 ) ) ( AVAILABLE ?auto_27999 ) ( SURFACE-AT ?auto_27998 ?auto_28001 ) ( ON ?auto_27998 ?auto_28008 ) ( CLEAR ?auto_27998 ) ( not ( = ?auto_27994 ?auto_28008 ) ) ( not ( = ?auto_27995 ?auto_28008 ) ) ( not ( = ?auto_28003 ?auto_28008 ) ) ( not ( = ?auto_27998 ?auto_28008 ) ) ( not ( = ?auto_27997 ?auto_28008 ) ) ( not ( = ?auto_28000 ?auto_28008 ) ) ( SURFACE-AT ?auto_27996 ?auto_28006 ) ( CLEAR ?auto_27996 ) ( IS-CRATE ?auto_28000 ) ( not ( = ?auto_27994 ?auto_27996 ) ) ( not ( = ?auto_27995 ?auto_27996 ) ) ( not ( = ?auto_28003 ?auto_27996 ) ) ( not ( = ?auto_27998 ?auto_27996 ) ) ( not ( = ?auto_27997 ?auto_27996 ) ) ( not ( = ?auto_28000 ?auto_27996 ) ) ( not ( = ?auto_28008 ?auto_27996 ) ) ( AVAILABLE ?auto_28002 ) ( IN ?auto_28000 ?auto_28004 ) ( TRUCK-AT ?auto_28004 ?auto_28009 ) ( not ( = ?auto_28009 ?auto_28006 ) ) ( not ( = ?auto_28007 ?auto_28009 ) ) ( not ( = ?auto_28001 ?auto_28009 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28004 ?auto_28009 ?auto_28006 )
      ( MAKE-ON ?auto_27994 ?auto_27995 )
      ( MAKE-ON-VERIFY ?auto_27994 ?auto_27995 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28010 - SURFACE
      ?auto_28011 - SURFACE
    )
    :vars
    (
      ?auto_28018 - HOIST
      ?auto_28017 - PLACE
      ?auto_28015 - PLACE
      ?auto_28014 - HOIST
      ?auto_28022 - SURFACE
      ?auto_28024 - SURFACE
      ?auto_28021 - PLACE
      ?auto_28025 - HOIST
      ?auto_28016 - SURFACE
      ?auto_28020 - SURFACE
      ?auto_28023 - SURFACE
      ?auto_28013 - SURFACE
      ?auto_28012 - TRUCK
      ?auto_28019 - PLACE
      ?auto_28026 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28018 ?auto_28017 ) ( IS-CRATE ?auto_28010 ) ( not ( = ?auto_28010 ?auto_28011 ) ) ( not ( = ?auto_28015 ?auto_28017 ) ) ( HOIST-AT ?auto_28014 ?auto_28015 ) ( not ( = ?auto_28018 ?auto_28014 ) ) ( AVAILABLE ?auto_28014 ) ( SURFACE-AT ?auto_28010 ?auto_28015 ) ( ON ?auto_28010 ?auto_28022 ) ( CLEAR ?auto_28010 ) ( not ( = ?auto_28010 ?auto_28022 ) ) ( not ( = ?auto_28011 ?auto_28022 ) ) ( IS-CRATE ?auto_28011 ) ( not ( = ?auto_28010 ?auto_28024 ) ) ( not ( = ?auto_28011 ?auto_28024 ) ) ( not ( = ?auto_28022 ?auto_28024 ) ) ( not ( = ?auto_28021 ?auto_28017 ) ) ( not ( = ?auto_28015 ?auto_28021 ) ) ( HOIST-AT ?auto_28025 ?auto_28021 ) ( not ( = ?auto_28018 ?auto_28025 ) ) ( not ( = ?auto_28014 ?auto_28025 ) ) ( SURFACE-AT ?auto_28011 ?auto_28021 ) ( ON ?auto_28011 ?auto_28016 ) ( CLEAR ?auto_28011 ) ( not ( = ?auto_28010 ?auto_28016 ) ) ( not ( = ?auto_28011 ?auto_28016 ) ) ( not ( = ?auto_28022 ?auto_28016 ) ) ( not ( = ?auto_28024 ?auto_28016 ) ) ( IS-CRATE ?auto_28024 ) ( not ( = ?auto_28010 ?auto_28020 ) ) ( not ( = ?auto_28011 ?auto_28020 ) ) ( not ( = ?auto_28022 ?auto_28020 ) ) ( not ( = ?auto_28024 ?auto_28020 ) ) ( not ( = ?auto_28016 ?auto_28020 ) ) ( AVAILABLE ?auto_28025 ) ( SURFACE-AT ?auto_28024 ?auto_28021 ) ( ON ?auto_28024 ?auto_28023 ) ( CLEAR ?auto_28024 ) ( not ( = ?auto_28010 ?auto_28023 ) ) ( not ( = ?auto_28011 ?auto_28023 ) ) ( not ( = ?auto_28022 ?auto_28023 ) ) ( not ( = ?auto_28024 ?auto_28023 ) ) ( not ( = ?auto_28016 ?auto_28023 ) ) ( not ( = ?auto_28020 ?auto_28023 ) ) ( SURFACE-AT ?auto_28013 ?auto_28017 ) ( CLEAR ?auto_28013 ) ( IS-CRATE ?auto_28020 ) ( not ( = ?auto_28010 ?auto_28013 ) ) ( not ( = ?auto_28011 ?auto_28013 ) ) ( not ( = ?auto_28022 ?auto_28013 ) ) ( not ( = ?auto_28024 ?auto_28013 ) ) ( not ( = ?auto_28016 ?auto_28013 ) ) ( not ( = ?auto_28020 ?auto_28013 ) ) ( not ( = ?auto_28023 ?auto_28013 ) ) ( AVAILABLE ?auto_28018 ) ( TRUCK-AT ?auto_28012 ?auto_28019 ) ( not ( = ?auto_28019 ?auto_28017 ) ) ( not ( = ?auto_28015 ?auto_28019 ) ) ( not ( = ?auto_28021 ?auto_28019 ) ) ( HOIST-AT ?auto_28026 ?auto_28019 ) ( LIFTING ?auto_28026 ?auto_28020 ) ( not ( = ?auto_28018 ?auto_28026 ) ) ( not ( = ?auto_28014 ?auto_28026 ) ) ( not ( = ?auto_28025 ?auto_28026 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28026 ?auto_28020 ?auto_28012 ?auto_28019 )
      ( MAKE-ON ?auto_28010 ?auto_28011 )
      ( MAKE-ON-VERIFY ?auto_28010 ?auto_28011 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28027 - SURFACE
      ?auto_28028 - SURFACE
    )
    :vars
    (
      ?auto_28042 - HOIST
      ?auto_28037 - PLACE
      ?auto_28035 - PLACE
      ?auto_28038 - HOIST
      ?auto_28041 - SURFACE
      ?auto_28043 - SURFACE
      ?auto_28030 - PLACE
      ?auto_28033 - HOIST
      ?auto_28029 - SURFACE
      ?auto_28031 - SURFACE
      ?auto_28039 - SURFACE
      ?auto_28036 - SURFACE
      ?auto_28032 - TRUCK
      ?auto_28034 - PLACE
      ?auto_28040 - HOIST
      ?auto_28044 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28042 ?auto_28037 ) ( IS-CRATE ?auto_28027 ) ( not ( = ?auto_28027 ?auto_28028 ) ) ( not ( = ?auto_28035 ?auto_28037 ) ) ( HOIST-AT ?auto_28038 ?auto_28035 ) ( not ( = ?auto_28042 ?auto_28038 ) ) ( AVAILABLE ?auto_28038 ) ( SURFACE-AT ?auto_28027 ?auto_28035 ) ( ON ?auto_28027 ?auto_28041 ) ( CLEAR ?auto_28027 ) ( not ( = ?auto_28027 ?auto_28041 ) ) ( not ( = ?auto_28028 ?auto_28041 ) ) ( IS-CRATE ?auto_28028 ) ( not ( = ?auto_28027 ?auto_28043 ) ) ( not ( = ?auto_28028 ?auto_28043 ) ) ( not ( = ?auto_28041 ?auto_28043 ) ) ( not ( = ?auto_28030 ?auto_28037 ) ) ( not ( = ?auto_28035 ?auto_28030 ) ) ( HOIST-AT ?auto_28033 ?auto_28030 ) ( not ( = ?auto_28042 ?auto_28033 ) ) ( not ( = ?auto_28038 ?auto_28033 ) ) ( SURFACE-AT ?auto_28028 ?auto_28030 ) ( ON ?auto_28028 ?auto_28029 ) ( CLEAR ?auto_28028 ) ( not ( = ?auto_28027 ?auto_28029 ) ) ( not ( = ?auto_28028 ?auto_28029 ) ) ( not ( = ?auto_28041 ?auto_28029 ) ) ( not ( = ?auto_28043 ?auto_28029 ) ) ( IS-CRATE ?auto_28043 ) ( not ( = ?auto_28027 ?auto_28031 ) ) ( not ( = ?auto_28028 ?auto_28031 ) ) ( not ( = ?auto_28041 ?auto_28031 ) ) ( not ( = ?auto_28043 ?auto_28031 ) ) ( not ( = ?auto_28029 ?auto_28031 ) ) ( AVAILABLE ?auto_28033 ) ( SURFACE-AT ?auto_28043 ?auto_28030 ) ( ON ?auto_28043 ?auto_28039 ) ( CLEAR ?auto_28043 ) ( not ( = ?auto_28027 ?auto_28039 ) ) ( not ( = ?auto_28028 ?auto_28039 ) ) ( not ( = ?auto_28041 ?auto_28039 ) ) ( not ( = ?auto_28043 ?auto_28039 ) ) ( not ( = ?auto_28029 ?auto_28039 ) ) ( not ( = ?auto_28031 ?auto_28039 ) ) ( SURFACE-AT ?auto_28036 ?auto_28037 ) ( CLEAR ?auto_28036 ) ( IS-CRATE ?auto_28031 ) ( not ( = ?auto_28027 ?auto_28036 ) ) ( not ( = ?auto_28028 ?auto_28036 ) ) ( not ( = ?auto_28041 ?auto_28036 ) ) ( not ( = ?auto_28043 ?auto_28036 ) ) ( not ( = ?auto_28029 ?auto_28036 ) ) ( not ( = ?auto_28031 ?auto_28036 ) ) ( not ( = ?auto_28039 ?auto_28036 ) ) ( AVAILABLE ?auto_28042 ) ( TRUCK-AT ?auto_28032 ?auto_28034 ) ( not ( = ?auto_28034 ?auto_28037 ) ) ( not ( = ?auto_28035 ?auto_28034 ) ) ( not ( = ?auto_28030 ?auto_28034 ) ) ( HOIST-AT ?auto_28040 ?auto_28034 ) ( not ( = ?auto_28042 ?auto_28040 ) ) ( not ( = ?auto_28038 ?auto_28040 ) ) ( not ( = ?auto_28033 ?auto_28040 ) ) ( AVAILABLE ?auto_28040 ) ( SURFACE-AT ?auto_28031 ?auto_28034 ) ( ON ?auto_28031 ?auto_28044 ) ( CLEAR ?auto_28031 ) ( not ( = ?auto_28027 ?auto_28044 ) ) ( not ( = ?auto_28028 ?auto_28044 ) ) ( not ( = ?auto_28041 ?auto_28044 ) ) ( not ( = ?auto_28043 ?auto_28044 ) ) ( not ( = ?auto_28029 ?auto_28044 ) ) ( not ( = ?auto_28031 ?auto_28044 ) ) ( not ( = ?auto_28039 ?auto_28044 ) ) ( not ( = ?auto_28036 ?auto_28044 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28040 ?auto_28031 ?auto_28044 ?auto_28034 )
      ( MAKE-ON ?auto_28027 ?auto_28028 )
      ( MAKE-ON-VERIFY ?auto_28027 ?auto_28028 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28045 - SURFACE
      ?auto_28046 - SURFACE
    )
    :vars
    (
      ?auto_28057 - HOIST
      ?auto_28048 - PLACE
      ?auto_28049 - PLACE
      ?auto_28055 - HOIST
      ?auto_28050 - SURFACE
      ?auto_28054 - SURFACE
      ?auto_28059 - PLACE
      ?auto_28060 - HOIST
      ?auto_28062 - SURFACE
      ?auto_28052 - SURFACE
      ?auto_28056 - SURFACE
      ?auto_28061 - SURFACE
      ?auto_28058 - PLACE
      ?auto_28047 - HOIST
      ?auto_28051 - SURFACE
      ?auto_28053 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28057 ?auto_28048 ) ( IS-CRATE ?auto_28045 ) ( not ( = ?auto_28045 ?auto_28046 ) ) ( not ( = ?auto_28049 ?auto_28048 ) ) ( HOIST-AT ?auto_28055 ?auto_28049 ) ( not ( = ?auto_28057 ?auto_28055 ) ) ( AVAILABLE ?auto_28055 ) ( SURFACE-AT ?auto_28045 ?auto_28049 ) ( ON ?auto_28045 ?auto_28050 ) ( CLEAR ?auto_28045 ) ( not ( = ?auto_28045 ?auto_28050 ) ) ( not ( = ?auto_28046 ?auto_28050 ) ) ( IS-CRATE ?auto_28046 ) ( not ( = ?auto_28045 ?auto_28054 ) ) ( not ( = ?auto_28046 ?auto_28054 ) ) ( not ( = ?auto_28050 ?auto_28054 ) ) ( not ( = ?auto_28059 ?auto_28048 ) ) ( not ( = ?auto_28049 ?auto_28059 ) ) ( HOIST-AT ?auto_28060 ?auto_28059 ) ( not ( = ?auto_28057 ?auto_28060 ) ) ( not ( = ?auto_28055 ?auto_28060 ) ) ( SURFACE-AT ?auto_28046 ?auto_28059 ) ( ON ?auto_28046 ?auto_28062 ) ( CLEAR ?auto_28046 ) ( not ( = ?auto_28045 ?auto_28062 ) ) ( not ( = ?auto_28046 ?auto_28062 ) ) ( not ( = ?auto_28050 ?auto_28062 ) ) ( not ( = ?auto_28054 ?auto_28062 ) ) ( IS-CRATE ?auto_28054 ) ( not ( = ?auto_28045 ?auto_28052 ) ) ( not ( = ?auto_28046 ?auto_28052 ) ) ( not ( = ?auto_28050 ?auto_28052 ) ) ( not ( = ?auto_28054 ?auto_28052 ) ) ( not ( = ?auto_28062 ?auto_28052 ) ) ( AVAILABLE ?auto_28060 ) ( SURFACE-AT ?auto_28054 ?auto_28059 ) ( ON ?auto_28054 ?auto_28056 ) ( CLEAR ?auto_28054 ) ( not ( = ?auto_28045 ?auto_28056 ) ) ( not ( = ?auto_28046 ?auto_28056 ) ) ( not ( = ?auto_28050 ?auto_28056 ) ) ( not ( = ?auto_28054 ?auto_28056 ) ) ( not ( = ?auto_28062 ?auto_28056 ) ) ( not ( = ?auto_28052 ?auto_28056 ) ) ( SURFACE-AT ?auto_28061 ?auto_28048 ) ( CLEAR ?auto_28061 ) ( IS-CRATE ?auto_28052 ) ( not ( = ?auto_28045 ?auto_28061 ) ) ( not ( = ?auto_28046 ?auto_28061 ) ) ( not ( = ?auto_28050 ?auto_28061 ) ) ( not ( = ?auto_28054 ?auto_28061 ) ) ( not ( = ?auto_28062 ?auto_28061 ) ) ( not ( = ?auto_28052 ?auto_28061 ) ) ( not ( = ?auto_28056 ?auto_28061 ) ) ( AVAILABLE ?auto_28057 ) ( not ( = ?auto_28058 ?auto_28048 ) ) ( not ( = ?auto_28049 ?auto_28058 ) ) ( not ( = ?auto_28059 ?auto_28058 ) ) ( HOIST-AT ?auto_28047 ?auto_28058 ) ( not ( = ?auto_28057 ?auto_28047 ) ) ( not ( = ?auto_28055 ?auto_28047 ) ) ( not ( = ?auto_28060 ?auto_28047 ) ) ( AVAILABLE ?auto_28047 ) ( SURFACE-AT ?auto_28052 ?auto_28058 ) ( ON ?auto_28052 ?auto_28051 ) ( CLEAR ?auto_28052 ) ( not ( = ?auto_28045 ?auto_28051 ) ) ( not ( = ?auto_28046 ?auto_28051 ) ) ( not ( = ?auto_28050 ?auto_28051 ) ) ( not ( = ?auto_28054 ?auto_28051 ) ) ( not ( = ?auto_28062 ?auto_28051 ) ) ( not ( = ?auto_28052 ?auto_28051 ) ) ( not ( = ?auto_28056 ?auto_28051 ) ) ( not ( = ?auto_28061 ?auto_28051 ) ) ( TRUCK-AT ?auto_28053 ?auto_28048 ) )
    :subtasks
    ( ( !DRIVE ?auto_28053 ?auto_28048 ?auto_28058 )
      ( MAKE-ON ?auto_28045 ?auto_28046 )
      ( MAKE-ON-VERIFY ?auto_28045 ?auto_28046 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28065 - SURFACE
      ?auto_28066 - SURFACE
    )
    :vars
    (
      ?auto_28067 - HOIST
      ?auto_28068 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28067 ?auto_28068 ) ( SURFACE-AT ?auto_28066 ?auto_28068 ) ( CLEAR ?auto_28066 ) ( LIFTING ?auto_28067 ?auto_28065 ) ( IS-CRATE ?auto_28065 ) ( not ( = ?auto_28065 ?auto_28066 ) ) )
    :subtasks
    ( ( !DROP ?auto_28067 ?auto_28065 ?auto_28066 ?auto_28068 )
      ( MAKE-ON-VERIFY ?auto_28065 ?auto_28066 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28069 - SURFACE
      ?auto_28070 - SURFACE
    )
    :vars
    (
      ?auto_28071 - HOIST
      ?auto_28072 - PLACE
      ?auto_28073 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28071 ?auto_28072 ) ( SURFACE-AT ?auto_28070 ?auto_28072 ) ( CLEAR ?auto_28070 ) ( IS-CRATE ?auto_28069 ) ( not ( = ?auto_28069 ?auto_28070 ) ) ( TRUCK-AT ?auto_28073 ?auto_28072 ) ( AVAILABLE ?auto_28071 ) ( IN ?auto_28069 ?auto_28073 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28071 ?auto_28069 ?auto_28073 ?auto_28072 )
      ( MAKE-ON ?auto_28069 ?auto_28070 )
      ( MAKE-ON-VERIFY ?auto_28069 ?auto_28070 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28074 - SURFACE
      ?auto_28075 - SURFACE
    )
    :vars
    (
      ?auto_28078 - HOIST
      ?auto_28076 - PLACE
      ?auto_28077 - TRUCK
      ?auto_28079 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28078 ?auto_28076 ) ( SURFACE-AT ?auto_28075 ?auto_28076 ) ( CLEAR ?auto_28075 ) ( IS-CRATE ?auto_28074 ) ( not ( = ?auto_28074 ?auto_28075 ) ) ( AVAILABLE ?auto_28078 ) ( IN ?auto_28074 ?auto_28077 ) ( TRUCK-AT ?auto_28077 ?auto_28079 ) ( not ( = ?auto_28079 ?auto_28076 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28077 ?auto_28079 ?auto_28076 )
      ( MAKE-ON ?auto_28074 ?auto_28075 )
      ( MAKE-ON-VERIFY ?auto_28074 ?auto_28075 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28080 - SURFACE
      ?auto_28081 - SURFACE
    )
    :vars
    (
      ?auto_28082 - HOIST
      ?auto_28084 - PLACE
      ?auto_28085 - TRUCK
      ?auto_28083 - PLACE
      ?auto_28086 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28082 ?auto_28084 ) ( SURFACE-AT ?auto_28081 ?auto_28084 ) ( CLEAR ?auto_28081 ) ( IS-CRATE ?auto_28080 ) ( not ( = ?auto_28080 ?auto_28081 ) ) ( AVAILABLE ?auto_28082 ) ( TRUCK-AT ?auto_28085 ?auto_28083 ) ( not ( = ?auto_28083 ?auto_28084 ) ) ( HOIST-AT ?auto_28086 ?auto_28083 ) ( LIFTING ?auto_28086 ?auto_28080 ) ( not ( = ?auto_28082 ?auto_28086 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28086 ?auto_28080 ?auto_28085 ?auto_28083 )
      ( MAKE-ON ?auto_28080 ?auto_28081 )
      ( MAKE-ON-VERIFY ?auto_28080 ?auto_28081 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28087 - SURFACE
      ?auto_28088 - SURFACE
    )
    :vars
    (
      ?auto_28093 - HOIST
      ?auto_28092 - PLACE
      ?auto_28090 - TRUCK
      ?auto_28091 - PLACE
      ?auto_28089 - HOIST
      ?auto_28094 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28093 ?auto_28092 ) ( SURFACE-AT ?auto_28088 ?auto_28092 ) ( CLEAR ?auto_28088 ) ( IS-CRATE ?auto_28087 ) ( not ( = ?auto_28087 ?auto_28088 ) ) ( AVAILABLE ?auto_28093 ) ( TRUCK-AT ?auto_28090 ?auto_28091 ) ( not ( = ?auto_28091 ?auto_28092 ) ) ( HOIST-AT ?auto_28089 ?auto_28091 ) ( not ( = ?auto_28093 ?auto_28089 ) ) ( AVAILABLE ?auto_28089 ) ( SURFACE-AT ?auto_28087 ?auto_28091 ) ( ON ?auto_28087 ?auto_28094 ) ( CLEAR ?auto_28087 ) ( not ( = ?auto_28087 ?auto_28094 ) ) ( not ( = ?auto_28088 ?auto_28094 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28089 ?auto_28087 ?auto_28094 ?auto_28091 )
      ( MAKE-ON ?auto_28087 ?auto_28088 )
      ( MAKE-ON-VERIFY ?auto_28087 ?auto_28088 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28095 - SURFACE
      ?auto_28096 - SURFACE
    )
    :vars
    (
      ?auto_28097 - HOIST
      ?auto_28099 - PLACE
      ?auto_28102 - PLACE
      ?auto_28101 - HOIST
      ?auto_28098 - SURFACE
      ?auto_28100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28097 ?auto_28099 ) ( SURFACE-AT ?auto_28096 ?auto_28099 ) ( CLEAR ?auto_28096 ) ( IS-CRATE ?auto_28095 ) ( not ( = ?auto_28095 ?auto_28096 ) ) ( AVAILABLE ?auto_28097 ) ( not ( = ?auto_28102 ?auto_28099 ) ) ( HOIST-AT ?auto_28101 ?auto_28102 ) ( not ( = ?auto_28097 ?auto_28101 ) ) ( AVAILABLE ?auto_28101 ) ( SURFACE-AT ?auto_28095 ?auto_28102 ) ( ON ?auto_28095 ?auto_28098 ) ( CLEAR ?auto_28095 ) ( not ( = ?auto_28095 ?auto_28098 ) ) ( not ( = ?auto_28096 ?auto_28098 ) ) ( TRUCK-AT ?auto_28100 ?auto_28099 ) )
    :subtasks
    ( ( !DRIVE ?auto_28100 ?auto_28099 ?auto_28102 )
      ( MAKE-ON ?auto_28095 ?auto_28096 )
      ( MAKE-ON-VERIFY ?auto_28095 ?auto_28096 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28103 - SURFACE
      ?auto_28104 - SURFACE
    )
    :vars
    (
      ?auto_28109 - HOIST
      ?auto_28105 - PLACE
      ?auto_28107 - PLACE
      ?auto_28110 - HOIST
      ?auto_28108 - SURFACE
      ?auto_28106 - TRUCK
      ?auto_28111 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28109 ?auto_28105 ) ( IS-CRATE ?auto_28103 ) ( not ( = ?auto_28103 ?auto_28104 ) ) ( not ( = ?auto_28107 ?auto_28105 ) ) ( HOIST-AT ?auto_28110 ?auto_28107 ) ( not ( = ?auto_28109 ?auto_28110 ) ) ( AVAILABLE ?auto_28110 ) ( SURFACE-AT ?auto_28103 ?auto_28107 ) ( ON ?auto_28103 ?auto_28108 ) ( CLEAR ?auto_28103 ) ( not ( = ?auto_28103 ?auto_28108 ) ) ( not ( = ?auto_28104 ?auto_28108 ) ) ( TRUCK-AT ?auto_28106 ?auto_28105 ) ( SURFACE-AT ?auto_28111 ?auto_28105 ) ( CLEAR ?auto_28111 ) ( LIFTING ?auto_28109 ?auto_28104 ) ( IS-CRATE ?auto_28104 ) ( not ( = ?auto_28103 ?auto_28111 ) ) ( not ( = ?auto_28104 ?auto_28111 ) ) ( not ( = ?auto_28108 ?auto_28111 ) ) )
    :subtasks
    ( ( !DROP ?auto_28109 ?auto_28104 ?auto_28111 ?auto_28105 )
      ( MAKE-ON ?auto_28103 ?auto_28104 )
      ( MAKE-ON-VERIFY ?auto_28103 ?auto_28104 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28112 - SURFACE
      ?auto_28113 - SURFACE
    )
    :vars
    (
      ?auto_28117 - HOIST
      ?auto_28116 - PLACE
      ?auto_28115 - PLACE
      ?auto_28119 - HOIST
      ?auto_28120 - SURFACE
      ?auto_28118 - TRUCK
      ?auto_28114 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28117 ?auto_28116 ) ( IS-CRATE ?auto_28112 ) ( not ( = ?auto_28112 ?auto_28113 ) ) ( not ( = ?auto_28115 ?auto_28116 ) ) ( HOIST-AT ?auto_28119 ?auto_28115 ) ( not ( = ?auto_28117 ?auto_28119 ) ) ( AVAILABLE ?auto_28119 ) ( SURFACE-AT ?auto_28112 ?auto_28115 ) ( ON ?auto_28112 ?auto_28120 ) ( CLEAR ?auto_28112 ) ( not ( = ?auto_28112 ?auto_28120 ) ) ( not ( = ?auto_28113 ?auto_28120 ) ) ( TRUCK-AT ?auto_28118 ?auto_28116 ) ( SURFACE-AT ?auto_28114 ?auto_28116 ) ( CLEAR ?auto_28114 ) ( IS-CRATE ?auto_28113 ) ( not ( = ?auto_28112 ?auto_28114 ) ) ( not ( = ?auto_28113 ?auto_28114 ) ) ( not ( = ?auto_28120 ?auto_28114 ) ) ( AVAILABLE ?auto_28117 ) ( IN ?auto_28113 ?auto_28118 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28117 ?auto_28113 ?auto_28118 ?auto_28116 )
      ( MAKE-ON ?auto_28112 ?auto_28113 )
      ( MAKE-ON-VERIFY ?auto_28112 ?auto_28113 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28121 - SURFACE
      ?auto_28122 - SURFACE
    )
    :vars
    (
      ?auto_28124 - HOIST
      ?auto_28128 - PLACE
      ?auto_28123 - PLACE
      ?auto_28126 - HOIST
      ?auto_28125 - SURFACE
      ?auto_28129 - SURFACE
      ?auto_28127 - TRUCK
      ?auto_28130 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28124 ?auto_28128 ) ( IS-CRATE ?auto_28121 ) ( not ( = ?auto_28121 ?auto_28122 ) ) ( not ( = ?auto_28123 ?auto_28128 ) ) ( HOIST-AT ?auto_28126 ?auto_28123 ) ( not ( = ?auto_28124 ?auto_28126 ) ) ( AVAILABLE ?auto_28126 ) ( SURFACE-AT ?auto_28121 ?auto_28123 ) ( ON ?auto_28121 ?auto_28125 ) ( CLEAR ?auto_28121 ) ( not ( = ?auto_28121 ?auto_28125 ) ) ( not ( = ?auto_28122 ?auto_28125 ) ) ( SURFACE-AT ?auto_28129 ?auto_28128 ) ( CLEAR ?auto_28129 ) ( IS-CRATE ?auto_28122 ) ( not ( = ?auto_28121 ?auto_28129 ) ) ( not ( = ?auto_28122 ?auto_28129 ) ) ( not ( = ?auto_28125 ?auto_28129 ) ) ( AVAILABLE ?auto_28124 ) ( IN ?auto_28122 ?auto_28127 ) ( TRUCK-AT ?auto_28127 ?auto_28130 ) ( not ( = ?auto_28130 ?auto_28128 ) ) ( not ( = ?auto_28123 ?auto_28130 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28127 ?auto_28130 ?auto_28128 )
      ( MAKE-ON ?auto_28121 ?auto_28122 )
      ( MAKE-ON-VERIFY ?auto_28121 ?auto_28122 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28131 - SURFACE
      ?auto_28132 - SURFACE
    )
    :vars
    (
      ?auto_28140 - HOIST
      ?auto_28135 - PLACE
      ?auto_28138 - PLACE
      ?auto_28137 - HOIST
      ?auto_28134 - SURFACE
      ?auto_28136 - SURFACE
      ?auto_28133 - TRUCK
      ?auto_28139 - PLACE
      ?auto_28141 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28140 ?auto_28135 ) ( IS-CRATE ?auto_28131 ) ( not ( = ?auto_28131 ?auto_28132 ) ) ( not ( = ?auto_28138 ?auto_28135 ) ) ( HOIST-AT ?auto_28137 ?auto_28138 ) ( not ( = ?auto_28140 ?auto_28137 ) ) ( AVAILABLE ?auto_28137 ) ( SURFACE-AT ?auto_28131 ?auto_28138 ) ( ON ?auto_28131 ?auto_28134 ) ( CLEAR ?auto_28131 ) ( not ( = ?auto_28131 ?auto_28134 ) ) ( not ( = ?auto_28132 ?auto_28134 ) ) ( SURFACE-AT ?auto_28136 ?auto_28135 ) ( CLEAR ?auto_28136 ) ( IS-CRATE ?auto_28132 ) ( not ( = ?auto_28131 ?auto_28136 ) ) ( not ( = ?auto_28132 ?auto_28136 ) ) ( not ( = ?auto_28134 ?auto_28136 ) ) ( AVAILABLE ?auto_28140 ) ( TRUCK-AT ?auto_28133 ?auto_28139 ) ( not ( = ?auto_28139 ?auto_28135 ) ) ( not ( = ?auto_28138 ?auto_28139 ) ) ( HOIST-AT ?auto_28141 ?auto_28139 ) ( LIFTING ?auto_28141 ?auto_28132 ) ( not ( = ?auto_28140 ?auto_28141 ) ) ( not ( = ?auto_28137 ?auto_28141 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28141 ?auto_28132 ?auto_28133 ?auto_28139 )
      ( MAKE-ON ?auto_28131 ?auto_28132 )
      ( MAKE-ON-VERIFY ?auto_28131 ?auto_28132 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28142 - SURFACE
      ?auto_28143 - SURFACE
    )
    :vars
    (
      ?auto_28152 - HOIST
      ?auto_28150 - PLACE
      ?auto_28149 - PLACE
      ?auto_28147 - HOIST
      ?auto_28146 - SURFACE
      ?auto_28148 - SURFACE
      ?auto_28151 - TRUCK
      ?auto_28144 - PLACE
      ?auto_28145 - HOIST
      ?auto_28153 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28152 ?auto_28150 ) ( IS-CRATE ?auto_28142 ) ( not ( = ?auto_28142 ?auto_28143 ) ) ( not ( = ?auto_28149 ?auto_28150 ) ) ( HOIST-AT ?auto_28147 ?auto_28149 ) ( not ( = ?auto_28152 ?auto_28147 ) ) ( AVAILABLE ?auto_28147 ) ( SURFACE-AT ?auto_28142 ?auto_28149 ) ( ON ?auto_28142 ?auto_28146 ) ( CLEAR ?auto_28142 ) ( not ( = ?auto_28142 ?auto_28146 ) ) ( not ( = ?auto_28143 ?auto_28146 ) ) ( SURFACE-AT ?auto_28148 ?auto_28150 ) ( CLEAR ?auto_28148 ) ( IS-CRATE ?auto_28143 ) ( not ( = ?auto_28142 ?auto_28148 ) ) ( not ( = ?auto_28143 ?auto_28148 ) ) ( not ( = ?auto_28146 ?auto_28148 ) ) ( AVAILABLE ?auto_28152 ) ( TRUCK-AT ?auto_28151 ?auto_28144 ) ( not ( = ?auto_28144 ?auto_28150 ) ) ( not ( = ?auto_28149 ?auto_28144 ) ) ( HOIST-AT ?auto_28145 ?auto_28144 ) ( not ( = ?auto_28152 ?auto_28145 ) ) ( not ( = ?auto_28147 ?auto_28145 ) ) ( AVAILABLE ?auto_28145 ) ( SURFACE-AT ?auto_28143 ?auto_28144 ) ( ON ?auto_28143 ?auto_28153 ) ( CLEAR ?auto_28143 ) ( not ( = ?auto_28142 ?auto_28153 ) ) ( not ( = ?auto_28143 ?auto_28153 ) ) ( not ( = ?auto_28146 ?auto_28153 ) ) ( not ( = ?auto_28148 ?auto_28153 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28145 ?auto_28143 ?auto_28153 ?auto_28144 )
      ( MAKE-ON ?auto_28142 ?auto_28143 )
      ( MAKE-ON-VERIFY ?auto_28142 ?auto_28143 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28154 - SURFACE
      ?auto_28155 - SURFACE
    )
    :vars
    (
      ?auto_28164 - HOIST
      ?auto_28158 - PLACE
      ?auto_28165 - PLACE
      ?auto_28157 - HOIST
      ?auto_28162 - SURFACE
      ?auto_28160 - SURFACE
      ?auto_28156 - PLACE
      ?auto_28159 - HOIST
      ?auto_28163 - SURFACE
      ?auto_28161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28164 ?auto_28158 ) ( IS-CRATE ?auto_28154 ) ( not ( = ?auto_28154 ?auto_28155 ) ) ( not ( = ?auto_28165 ?auto_28158 ) ) ( HOIST-AT ?auto_28157 ?auto_28165 ) ( not ( = ?auto_28164 ?auto_28157 ) ) ( AVAILABLE ?auto_28157 ) ( SURFACE-AT ?auto_28154 ?auto_28165 ) ( ON ?auto_28154 ?auto_28162 ) ( CLEAR ?auto_28154 ) ( not ( = ?auto_28154 ?auto_28162 ) ) ( not ( = ?auto_28155 ?auto_28162 ) ) ( SURFACE-AT ?auto_28160 ?auto_28158 ) ( CLEAR ?auto_28160 ) ( IS-CRATE ?auto_28155 ) ( not ( = ?auto_28154 ?auto_28160 ) ) ( not ( = ?auto_28155 ?auto_28160 ) ) ( not ( = ?auto_28162 ?auto_28160 ) ) ( AVAILABLE ?auto_28164 ) ( not ( = ?auto_28156 ?auto_28158 ) ) ( not ( = ?auto_28165 ?auto_28156 ) ) ( HOIST-AT ?auto_28159 ?auto_28156 ) ( not ( = ?auto_28164 ?auto_28159 ) ) ( not ( = ?auto_28157 ?auto_28159 ) ) ( AVAILABLE ?auto_28159 ) ( SURFACE-AT ?auto_28155 ?auto_28156 ) ( ON ?auto_28155 ?auto_28163 ) ( CLEAR ?auto_28155 ) ( not ( = ?auto_28154 ?auto_28163 ) ) ( not ( = ?auto_28155 ?auto_28163 ) ) ( not ( = ?auto_28162 ?auto_28163 ) ) ( not ( = ?auto_28160 ?auto_28163 ) ) ( TRUCK-AT ?auto_28161 ?auto_28158 ) )
    :subtasks
    ( ( !DRIVE ?auto_28161 ?auto_28158 ?auto_28156 )
      ( MAKE-ON ?auto_28154 ?auto_28155 )
      ( MAKE-ON-VERIFY ?auto_28154 ?auto_28155 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28166 - SURFACE
      ?auto_28167 - SURFACE
    )
    :vars
    (
      ?auto_28177 - HOIST
      ?auto_28175 - PLACE
      ?auto_28170 - PLACE
      ?auto_28169 - HOIST
      ?auto_28168 - SURFACE
      ?auto_28176 - SURFACE
      ?auto_28171 - PLACE
      ?auto_28172 - HOIST
      ?auto_28173 - SURFACE
      ?auto_28174 - TRUCK
      ?auto_28178 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28177 ?auto_28175 ) ( IS-CRATE ?auto_28166 ) ( not ( = ?auto_28166 ?auto_28167 ) ) ( not ( = ?auto_28170 ?auto_28175 ) ) ( HOIST-AT ?auto_28169 ?auto_28170 ) ( not ( = ?auto_28177 ?auto_28169 ) ) ( AVAILABLE ?auto_28169 ) ( SURFACE-AT ?auto_28166 ?auto_28170 ) ( ON ?auto_28166 ?auto_28168 ) ( CLEAR ?auto_28166 ) ( not ( = ?auto_28166 ?auto_28168 ) ) ( not ( = ?auto_28167 ?auto_28168 ) ) ( IS-CRATE ?auto_28167 ) ( not ( = ?auto_28166 ?auto_28176 ) ) ( not ( = ?auto_28167 ?auto_28176 ) ) ( not ( = ?auto_28168 ?auto_28176 ) ) ( not ( = ?auto_28171 ?auto_28175 ) ) ( not ( = ?auto_28170 ?auto_28171 ) ) ( HOIST-AT ?auto_28172 ?auto_28171 ) ( not ( = ?auto_28177 ?auto_28172 ) ) ( not ( = ?auto_28169 ?auto_28172 ) ) ( AVAILABLE ?auto_28172 ) ( SURFACE-AT ?auto_28167 ?auto_28171 ) ( ON ?auto_28167 ?auto_28173 ) ( CLEAR ?auto_28167 ) ( not ( = ?auto_28166 ?auto_28173 ) ) ( not ( = ?auto_28167 ?auto_28173 ) ) ( not ( = ?auto_28168 ?auto_28173 ) ) ( not ( = ?auto_28176 ?auto_28173 ) ) ( TRUCK-AT ?auto_28174 ?auto_28175 ) ( SURFACE-AT ?auto_28178 ?auto_28175 ) ( CLEAR ?auto_28178 ) ( LIFTING ?auto_28177 ?auto_28176 ) ( IS-CRATE ?auto_28176 ) ( not ( = ?auto_28166 ?auto_28178 ) ) ( not ( = ?auto_28167 ?auto_28178 ) ) ( not ( = ?auto_28168 ?auto_28178 ) ) ( not ( = ?auto_28176 ?auto_28178 ) ) ( not ( = ?auto_28173 ?auto_28178 ) ) )
    :subtasks
    ( ( !DROP ?auto_28177 ?auto_28176 ?auto_28178 ?auto_28175 )
      ( MAKE-ON ?auto_28166 ?auto_28167 )
      ( MAKE-ON-VERIFY ?auto_28166 ?auto_28167 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28179 - SURFACE
      ?auto_28180 - SURFACE
    )
    :vars
    (
      ?auto_28189 - HOIST
      ?auto_28190 - PLACE
      ?auto_28181 - PLACE
      ?auto_28185 - HOIST
      ?auto_28191 - SURFACE
      ?auto_28184 - SURFACE
      ?auto_28186 - PLACE
      ?auto_28183 - HOIST
      ?auto_28187 - SURFACE
      ?auto_28188 - TRUCK
      ?auto_28182 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28189 ?auto_28190 ) ( IS-CRATE ?auto_28179 ) ( not ( = ?auto_28179 ?auto_28180 ) ) ( not ( = ?auto_28181 ?auto_28190 ) ) ( HOIST-AT ?auto_28185 ?auto_28181 ) ( not ( = ?auto_28189 ?auto_28185 ) ) ( AVAILABLE ?auto_28185 ) ( SURFACE-AT ?auto_28179 ?auto_28181 ) ( ON ?auto_28179 ?auto_28191 ) ( CLEAR ?auto_28179 ) ( not ( = ?auto_28179 ?auto_28191 ) ) ( not ( = ?auto_28180 ?auto_28191 ) ) ( IS-CRATE ?auto_28180 ) ( not ( = ?auto_28179 ?auto_28184 ) ) ( not ( = ?auto_28180 ?auto_28184 ) ) ( not ( = ?auto_28191 ?auto_28184 ) ) ( not ( = ?auto_28186 ?auto_28190 ) ) ( not ( = ?auto_28181 ?auto_28186 ) ) ( HOIST-AT ?auto_28183 ?auto_28186 ) ( not ( = ?auto_28189 ?auto_28183 ) ) ( not ( = ?auto_28185 ?auto_28183 ) ) ( AVAILABLE ?auto_28183 ) ( SURFACE-AT ?auto_28180 ?auto_28186 ) ( ON ?auto_28180 ?auto_28187 ) ( CLEAR ?auto_28180 ) ( not ( = ?auto_28179 ?auto_28187 ) ) ( not ( = ?auto_28180 ?auto_28187 ) ) ( not ( = ?auto_28191 ?auto_28187 ) ) ( not ( = ?auto_28184 ?auto_28187 ) ) ( TRUCK-AT ?auto_28188 ?auto_28190 ) ( SURFACE-AT ?auto_28182 ?auto_28190 ) ( CLEAR ?auto_28182 ) ( IS-CRATE ?auto_28184 ) ( not ( = ?auto_28179 ?auto_28182 ) ) ( not ( = ?auto_28180 ?auto_28182 ) ) ( not ( = ?auto_28191 ?auto_28182 ) ) ( not ( = ?auto_28184 ?auto_28182 ) ) ( not ( = ?auto_28187 ?auto_28182 ) ) ( AVAILABLE ?auto_28189 ) ( IN ?auto_28184 ?auto_28188 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28189 ?auto_28184 ?auto_28188 ?auto_28190 )
      ( MAKE-ON ?auto_28179 ?auto_28180 )
      ( MAKE-ON-VERIFY ?auto_28179 ?auto_28180 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28192 - SURFACE
      ?auto_28193 - SURFACE
    )
    :vars
    (
      ?auto_28198 - HOIST
      ?auto_28195 - PLACE
      ?auto_28197 - PLACE
      ?auto_28202 - HOIST
      ?auto_28200 - SURFACE
      ?auto_28201 - SURFACE
      ?auto_28204 - PLACE
      ?auto_28194 - HOIST
      ?auto_28203 - SURFACE
      ?auto_28199 - SURFACE
      ?auto_28196 - TRUCK
      ?auto_28205 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28198 ?auto_28195 ) ( IS-CRATE ?auto_28192 ) ( not ( = ?auto_28192 ?auto_28193 ) ) ( not ( = ?auto_28197 ?auto_28195 ) ) ( HOIST-AT ?auto_28202 ?auto_28197 ) ( not ( = ?auto_28198 ?auto_28202 ) ) ( AVAILABLE ?auto_28202 ) ( SURFACE-AT ?auto_28192 ?auto_28197 ) ( ON ?auto_28192 ?auto_28200 ) ( CLEAR ?auto_28192 ) ( not ( = ?auto_28192 ?auto_28200 ) ) ( not ( = ?auto_28193 ?auto_28200 ) ) ( IS-CRATE ?auto_28193 ) ( not ( = ?auto_28192 ?auto_28201 ) ) ( not ( = ?auto_28193 ?auto_28201 ) ) ( not ( = ?auto_28200 ?auto_28201 ) ) ( not ( = ?auto_28204 ?auto_28195 ) ) ( not ( = ?auto_28197 ?auto_28204 ) ) ( HOIST-AT ?auto_28194 ?auto_28204 ) ( not ( = ?auto_28198 ?auto_28194 ) ) ( not ( = ?auto_28202 ?auto_28194 ) ) ( AVAILABLE ?auto_28194 ) ( SURFACE-AT ?auto_28193 ?auto_28204 ) ( ON ?auto_28193 ?auto_28203 ) ( CLEAR ?auto_28193 ) ( not ( = ?auto_28192 ?auto_28203 ) ) ( not ( = ?auto_28193 ?auto_28203 ) ) ( not ( = ?auto_28200 ?auto_28203 ) ) ( not ( = ?auto_28201 ?auto_28203 ) ) ( SURFACE-AT ?auto_28199 ?auto_28195 ) ( CLEAR ?auto_28199 ) ( IS-CRATE ?auto_28201 ) ( not ( = ?auto_28192 ?auto_28199 ) ) ( not ( = ?auto_28193 ?auto_28199 ) ) ( not ( = ?auto_28200 ?auto_28199 ) ) ( not ( = ?auto_28201 ?auto_28199 ) ) ( not ( = ?auto_28203 ?auto_28199 ) ) ( AVAILABLE ?auto_28198 ) ( IN ?auto_28201 ?auto_28196 ) ( TRUCK-AT ?auto_28196 ?auto_28205 ) ( not ( = ?auto_28205 ?auto_28195 ) ) ( not ( = ?auto_28197 ?auto_28205 ) ) ( not ( = ?auto_28204 ?auto_28205 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28196 ?auto_28205 ?auto_28195 )
      ( MAKE-ON ?auto_28192 ?auto_28193 )
      ( MAKE-ON-VERIFY ?auto_28192 ?auto_28193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28206 - SURFACE
      ?auto_28207 - SURFACE
    )
    :vars
    (
      ?auto_28208 - HOIST
      ?auto_28218 - PLACE
      ?auto_28215 - PLACE
      ?auto_28219 - HOIST
      ?auto_28209 - SURFACE
      ?auto_28210 - SURFACE
      ?auto_28214 - PLACE
      ?auto_28211 - HOIST
      ?auto_28212 - SURFACE
      ?auto_28216 - SURFACE
      ?auto_28213 - TRUCK
      ?auto_28217 - PLACE
      ?auto_28220 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28208 ?auto_28218 ) ( IS-CRATE ?auto_28206 ) ( not ( = ?auto_28206 ?auto_28207 ) ) ( not ( = ?auto_28215 ?auto_28218 ) ) ( HOIST-AT ?auto_28219 ?auto_28215 ) ( not ( = ?auto_28208 ?auto_28219 ) ) ( AVAILABLE ?auto_28219 ) ( SURFACE-AT ?auto_28206 ?auto_28215 ) ( ON ?auto_28206 ?auto_28209 ) ( CLEAR ?auto_28206 ) ( not ( = ?auto_28206 ?auto_28209 ) ) ( not ( = ?auto_28207 ?auto_28209 ) ) ( IS-CRATE ?auto_28207 ) ( not ( = ?auto_28206 ?auto_28210 ) ) ( not ( = ?auto_28207 ?auto_28210 ) ) ( not ( = ?auto_28209 ?auto_28210 ) ) ( not ( = ?auto_28214 ?auto_28218 ) ) ( not ( = ?auto_28215 ?auto_28214 ) ) ( HOIST-AT ?auto_28211 ?auto_28214 ) ( not ( = ?auto_28208 ?auto_28211 ) ) ( not ( = ?auto_28219 ?auto_28211 ) ) ( AVAILABLE ?auto_28211 ) ( SURFACE-AT ?auto_28207 ?auto_28214 ) ( ON ?auto_28207 ?auto_28212 ) ( CLEAR ?auto_28207 ) ( not ( = ?auto_28206 ?auto_28212 ) ) ( not ( = ?auto_28207 ?auto_28212 ) ) ( not ( = ?auto_28209 ?auto_28212 ) ) ( not ( = ?auto_28210 ?auto_28212 ) ) ( SURFACE-AT ?auto_28216 ?auto_28218 ) ( CLEAR ?auto_28216 ) ( IS-CRATE ?auto_28210 ) ( not ( = ?auto_28206 ?auto_28216 ) ) ( not ( = ?auto_28207 ?auto_28216 ) ) ( not ( = ?auto_28209 ?auto_28216 ) ) ( not ( = ?auto_28210 ?auto_28216 ) ) ( not ( = ?auto_28212 ?auto_28216 ) ) ( AVAILABLE ?auto_28208 ) ( TRUCK-AT ?auto_28213 ?auto_28217 ) ( not ( = ?auto_28217 ?auto_28218 ) ) ( not ( = ?auto_28215 ?auto_28217 ) ) ( not ( = ?auto_28214 ?auto_28217 ) ) ( HOIST-AT ?auto_28220 ?auto_28217 ) ( LIFTING ?auto_28220 ?auto_28210 ) ( not ( = ?auto_28208 ?auto_28220 ) ) ( not ( = ?auto_28219 ?auto_28220 ) ) ( not ( = ?auto_28211 ?auto_28220 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28220 ?auto_28210 ?auto_28213 ?auto_28217 )
      ( MAKE-ON ?auto_28206 ?auto_28207 )
      ( MAKE-ON-VERIFY ?auto_28206 ?auto_28207 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28221 - SURFACE
      ?auto_28222 - SURFACE
    )
    :vars
    (
      ?auto_28231 - HOIST
      ?auto_28232 - PLACE
      ?auto_28229 - PLACE
      ?auto_28225 - HOIST
      ?auto_28228 - SURFACE
      ?auto_28224 - SURFACE
      ?auto_28235 - PLACE
      ?auto_28227 - HOIST
      ?auto_28226 - SURFACE
      ?auto_28233 - SURFACE
      ?auto_28230 - TRUCK
      ?auto_28223 - PLACE
      ?auto_28234 - HOIST
      ?auto_28236 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28231 ?auto_28232 ) ( IS-CRATE ?auto_28221 ) ( not ( = ?auto_28221 ?auto_28222 ) ) ( not ( = ?auto_28229 ?auto_28232 ) ) ( HOIST-AT ?auto_28225 ?auto_28229 ) ( not ( = ?auto_28231 ?auto_28225 ) ) ( AVAILABLE ?auto_28225 ) ( SURFACE-AT ?auto_28221 ?auto_28229 ) ( ON ?auto_28221 ?auto_28228 ) ( CLEAR ?auto_28221 ) ( not ( = ?auto_28221 ?auto_28228 ) ) ( not ( = ?auto_28222 ?auto_28228 ) ) ( IS-CRATE ?auto_28222 ) ( not ( = ?auto_28221 ?auto_28224 ) ) ( not ( = ?auto_28222 ?auto_28224 ) ) ( not ( = ?auto_28228 ?auto_28224 ) ) ( not ( = ?auto_28235 ?auto_28232 ) ) ( not ( = ?auto_28229 ?auto_28235 ) ) ( HOIST-AT ?auto_28227 ?auto_28235 ) ( not ( = ?auto_28231 ?auto_28227 ) ) ( not ( = ?auto_28225 ?auto_28227 ) ) ( AVAILABLE ?auto_28227 ) ( SURFACE-AT ?auto_28222 ?auto_28235 ) ( ON ?auto_28222 ?auto_28226 ) ( CLEAR ?auto_28222 ) ( not ( = ?auto_28221 ?auto_28226 ) ) ( not ( = ?auto_28222 ?auto_28226 ) ) ( not ( = ?auto_28228 ?auto_28226 ) ) ( not ( = ?auto_28224 ?auto_28226 ) ) ( SURFACE-AT ?auto_28233 ?auto_28232 ) ( CLEAR ?auto_28233 ) ( IS-CRATE ?auto_28224 ) ( not ( = ?auto_28221 ?auto_28233 ) ) ( not ( = ?auto_28222 ?auto_28233 ) ) ( not ( = ?auto_28228 ?auto_28233 ) ) ( not ( = ?auto_28224 ?auto_28233 ) ) ( not ( = ?auto_28226 ?auto_28233 ) ) ( AVAILABLE ?auto_28231 ) ( TRUCK-AT ?auto_28230 ?auto_28223 ) ( not ( = ?auto_28223 ?auto_28232 ) ) ( not ( = ?auto_28229 ?auto_28223 ) ) ( not ( = ?auto_28235 ?auto_28223 ) ) ( HOIST-AT ?auto_28234 ?auto_28223 ) ( not ( = ?auto_28231 ?auto_28234 ) ) ( not ( = ?auto_28225 ?auto_28234 ) ) ( not ( = ?auto_28227 ?auto_28234 ) ) ( AVAILABLE ?auto_28234 ) ( SURFACE-AT ?auto_28224 ?auto_28223 ) ( ON ?auto_28224 ?auto_28236 ) ( CLEAR ?auto_28224 ) ( not ( = ?auto_28221 ?auto_28236 ) ) ( not ( = ?auto_28222 ?auto_28236 ) ) ( not ( = ?auto_28228 ?auto_28236 ) ) ( not ( = ?auto_28224 ?auto_28236 ) ) ( not ( = ?auto_28226 ?auto_28236 ) ) ( not ( = ?auto_28233 ?auto_28236 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28234 ?auto_28224 ?auto_28236 ?auto_28223 )
      ( MAKE-ON ?auto_28221 ?auto_28222 )
      ( MAKE-ON-VERIFY ?auto_28221 ?auto_28222 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28237 - SURFACE
      ?auto_28238 - SURFACE
    )
    :vars
    (
      ?auto_28239 - HOIST
      ?auto_28249 - PLACE
      ?auto_28247 - PLACE
      ?auto_28250 - HOIST
      ?auto_28240 - SURFACE
      ?auto_28241 - SURFACE
      ?auto_28243 - PLACE
      ?auto_28245 - HOIST
      ?auto_28242 - SURFACE
      ?auto_28246 - SURFACE
      ?auto_28251 - PLACE
      ?auto_28248 - HOIST
      ?auto_28244 - SURFACE
      ?auto_28252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28239 ?auto_28249 ) ( IS-CRATE ?auto_28237 ) ( not ( = ?auto_28237 ?auto_28238 ) ) ( not ( = ?auto_28247 ?auto_28249 ) ) ( HOIST-AT ?auto_28250 ?auto_28247 ) ( not ( = ?auto_28239 ?auto_28250 ) ) ( AVAILABLE ?auto_28250 ) ( SURFACE-AT ?auto_28237 ?auto_28247 ) ( ON ?auto_28237 ?auto_28240 ) ( CLEAR ?auto_28237 ) ( not ( = ?auto_28237 ?auto_28240 ) ) ( not ( = ?auto_28238 ?auto_28240 ) ) ( IS-CRATE ?auto_28238 ) ( not ( = ?auto_28237 ?auto_28241 ) ) ( not ( = ?auto_28238 ?auto_28241 ) ) ( not ( = ?auto_28240 ?auto_28241 ) ) ( not ( = ?auto_28243 ?auto_28249 ) ) ( not ( = ?auto_28247 ?auto_28243 ) ) ( HOIST-AT ?auto_28245 ?auto_28243 ) ( not ( = ?auto_28239 ?auto_28245 ) ) ( not ( = ?auto_28250 ?auto_28245 ) ) ( AVAILABLE ?auto_28245 ) ( SURFACE-AT ?auto_28238 ?auto_28243 ) ( ON ?auto_28238 ?auto_28242 ) ( CLEAR ?auto_28238 ) ( not ( = ?auto_28237 ?auto_28242 ) ) ( not ( = ?auto_28238 ?auto_28242 ) ) ( not ( = ?auto_28240 ?auto_28242 ) ) ( not ( = ?auto_28241 ?auto_28242 ) ) ( SURFACE-AT ?auto_28246 ?auto_28249 ) ( CLEAR ?auto_28246 ) ( IS-CRATE ?auto_28241 ) ( not ( = ?auto_28237 ?auto_28246 ) ) ( not ( = ?auto_28238 ?auto_28246 ) ) ( not ( = ?auto_28240 ?auto_28246 ) ) ( not ( = ?auto_28241 ?auto_28246 ) ) ( not ( = ?auto_28242 ?auto_28246 ) ) ( AVAILABLE ?auto_28239 ) ( not ( = ?auto_28251 ?auto_28249 ) ) ( not ( = ?auto_28247 ?auto_28251 ) ) ( not ( = ?auto_28243 ?auto_28251 ) ) ( HOIST-AT ?auto_28248 ?auto_28251 ) ( not ( = ?auto_28239 ?auto_28248 ) ) ( not ( = ?auto_28250 ?auto_28248 ) ) ( not ( = ?auto_28245 ?auto_28248 ) ) ( AVAILABLE ?auto_28248 ) ( SURFACE-AT ?auto_28241 ?auto_28251 ) ( ON ?auto_28241 ?auto_28244 ) ( CLEAR ?auto_28241 ) ( not ( = ?auto_28237 ?auto_28244 ) ) ( not ( = ?auto_28238 ?auto_28244 ) ) ( not ( = ?auto_28240 ?auto_28244 ) ) ( not ( = ?auto_28241 ?auto_28244 ) ) ( not ( = ?auto_28242 ?auto_28244 ) ) ( not ( = ?auto_28246 ?auto_28244 ) ) ( TRUCK-AT ?auto_28252 ?auto_28249 ) )
    :subtasks
    ( ( !DRIVE ?auto_28252 ?auto_28249 ?auto_28251 )
      ( MAKE-ON ?auto_28237 ?auto_28238 )
      ( MAKE-ON-VERIFY ?auto_28237 ?auto_28238 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28253 - SURFACE
      ?auto_28254 - SURFACE
    )
    :vars
    (
      ?auto_28268 - HOIST
      ?auto_28263 - PLACE
      ?auto_28261 - PLACE
      ?auto_28265 - HOIST
      ?auto_28266 - SURFACE
      ?auto_28256 - SURFACE
      ?auto_28259 - PLACE
      ?auto_28257 - HOIST
      ?auto_28264 - SURFACE
      ?auto_28267 - SURFACE
      ?auto_28258 - PLACE
      ?auto_28260 - HOIST
      ?auto_28262 - SURFACE
      ?auto_28255 - TRUCK
      ?auto_28269 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28268 ?auto_28263 ) ( IS-CRATE ?auto_28253 ) ( not ( = ?auto_28253 ?auto_28254 ) ) ( not ( = ?auto_28261 ?auto_28263 ) ) ( HOIST-AT ?auto_28265 ?auto_28261 ) ( not ( = ?auto_28268 ?auto_28265 ) ) ( AVAILABLE ?auto_28265 ) ( SURFACE-AT ?auto_28253 ?auto_28261 ) ( ON ?auto_28253 ?auto_28266 ) ( CLEAR ?auto_28253 ) ( not ( = ?auto_28253 ?auto_28266 ) ) ( not ( = ?auto_28254 ?auto_28266 ) ) ( IS-CRATE ?auto_28254 ) ( not ( = ?auto_28253 ?auto_28256 ) ) ( not ( = ?auto_28254 ?auto_28256 ) ) ( not ( = ?auto_28266 ?auto_28256 ) ) ( not ( = ?auto_28259 ?auto_28263 ) ) ( not ( = ?auto_28261 ?auto_28259 ) ) ( HOIST-AT ?auto_28257 ?auto_28259 ) ( not ( = ?auto_28268 ?auto_28257 ) ) ( not ( = ?auto_28265 ?auto_28257 ) ) ( AVAILABLE ?auto_28257 ) ( SURFACE-AT ?auto_28254 ?auto_28259 ) ( ON ?auto_28254 ?auto_28264 ) ( CLEAR ?auto_28254 ) ( not ( = ?auto_28253 ?auto_28264 ) ) ( not ( = ?auto_28254 ?auto_28264 ) ) ( not ( = ?auto_28266 ?auto_28264 ) ) ( not ( = ?auto_28256 ?auto_28264 ) ) ( IS-CRATE ?auto_28256 ) ( not ( = ?auto_28253 ?auto_28267 ) ) ( not ( = ?auto_28254 ?auto_28267 ) ) ( not ( = ?auto_28266 ?auto_28267 ) ) ( not ( = ?auto_28256 ?auto_28267 ) ) ( not ( = ?auto_28264 ?auto_28267 ) ) ( not ( = ?auto_28258 ?auto_28263 ) ) ( not ( = ?auto_28261 ?auto_28258 ) ) ( not ( = ?auto_28259 ?auto_28258 ) ) ( HOIST-AT ?auto_28260 ?auto_28258 ) ( not ( = ?auto_28268 ?auto_28260 ) ) ( not ( = ?auto_28265 ?auto_28260 ) ) ( not ( = ?auto_28257 ?auto_28260 ) ) ( AVAILABLE ?auto_28260 ) ( SURFACE-AT ?auto_28256 ?auto_28258 ) ( ON ?auto_28256 ?auto_28262 ) ( CLEAR ?auto_28256 ) ( not ( = ?auto_28253 ?auto_28262 ) ) ( not ( = ?auto_28254 ?auto_28262 ) ) ( not ( = ?auto_28266 ?auto_28262 ) ) ( not ( = ?auto_28256 ?auto_28262 ) ) ( not ( = ?auto_28264 ?auto_28262 ) ) ( not ( = ?auto_28267 ?auto_28262 ) ) ( TRUCK-AT ?auto_28255 ?auto_28263 ) ( SURFACE-AT ?auto_28269 ?auto_28263 ) ( CLEAR ?auto_28269 ) ( LIFTING ?auto_28268 ?auto_28267 ) ( IS-CRATE ?auto_28267 ) ( not ( = ?auto_28253 ?auto_28269 ) ) ( not ( = ?auto_28254 ?auto_28269 ) ) ( not ( = ?auto_28266 ?auto_28269 ) ) ( not ( = ?auto_28256 ?auto_28269 ) ) ( not ( = ?auto_28264 ?auto_28269 ) ) ( not ( = ?auto_28267 ?auto_28269 ) ) ( not ( = ?auto_28262 ?auto_28269 ) ) )
    :subtasks
    ( ( !DROP ?auto_28268 ?auto_28267 ?auto_28269 ?auto_28263 )
      ( MAKE-ON ?auto_28253 ?auto_28254 )
      ( MAKE-ON-VERIFY ?auto_28253 ?auto_28254 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28270 - SURFACE
      ?auto_28271 - SURFACE
    )
    :vars
    (
      ?auto_28281 - HOIST
      ?auto_28276 - PLACE
      ?auto_28273 - PLACE
      ?auto_28275 - HOIST
      ?auto_28278 - SURFACE
      ?auto_28282 - SURFACE
      ?auto_28286 - PLACE
      ?auto_28283 - HOIST
      ?auto_28285 - SURFACE
      ?auto_28272 - SURFACE
      ?auto_28274 - PLACE
      ?auto_28280 - HOIST
      ?auto_28279 - SURFACE
      ?auto_28284 - TRUCK
      ?auto_28277 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28281 ?auto_28276 ) ( IS-CRATE ?auto_28270 ) ( not ( = ?auto_28270 ?auto_28271 ) ) ( not ( = ?auto_28273 ?auto_28276 ) ) ( HOIST-AT ?auto_28275 ?auto_28273 ) ( not ( = ?auto_28281 ?auto_28275 ) ) ( AVAILABLE ?auto_28275 ) ( SURFACE-AT ?auto_28270 ?auto_28273 ) ( ON ?auto_28270 ?auto_28278 ) ( CLEAR ?auto_28270 ) ( not ( = ?auto_28270 ?auto_28278 ) ) ( not ( = ?auto_28271 ?auto_28278 ) ) ( IS-CRATE ?auto_28271 ) ( not ( = ?auto_28270 ?auto_28282 ) ) ( not ( = ?auto_28271 ?auto_28282 ) ) ( not ( = ?auto_28278 ?auto_28282 ) ) ( not ( = ?auto_28286 ?auto_28276 ) ) ( not ( = ?auto_28273 ?auto_28286 ) ) ( HOIST-AT ?auto_28283 ?auto_28286 ) ( not ( = ?auto_28281 ?auto_28283 ) ) ( not ( = ?auto_28275 ?auto_28283 ) ) ( AVAILABLE ?auto_28283 ) ( SURFACE-AT ?auto_28271 ?auto_28286 ) ( ON ?auto_28271 ?auto_28285 ) ( CLEAR ?auto_28271 ) ( not ( = ?auto_28270 ?auto_28285 ) ) ( not ( = ?auto_28271 ?auto_28285 ) ) ( not ( = ?auto_28278 ?auto_28285 ) ) ( not ( = ?auto_28282 ?auto_28285 ) ) ( IS-CRATE ?auto_28282 ) ( not ( = ?auto_28270 ?auto_28272 ) ) ( not ( = ?auto_28271 ?auto_28272 ) ) ( not ( = ?auto_28278 ?auto_28272 ) ) ( not ( = ?auto_28282 ?auto_28272 ) ) ( not ( = ?auto_28285 ?auto_28272 ) ) ( not ( = ?auto_28274 ?auto_28276 ) ) ( not ( = ?auto_28273 ?auto_28274 ) ) ( not ( = ?auto_28286 ?auto_28274 ) ) ( HOIST-AT ?auto_28280 ?auto_28274 ) ( not ( = ?auto_28281 ?auto_28280 ) ) ( not ( = ?auto_28275 ?auto_28280 ) ) ( not ( = ?auto_28283 ?auto_28280 ) ) ( AVAILABLE ?auto_28280 ) ( SURFACE-AT ?auto_28282 ?auto_28274 ) ( ON ?auto_28282 ?auto_28279 ) ( CLEAR ?auto_28282 ) ( not ( = ?auto_28270 ?auto_28279 ) ) ( not ( = ?auto_28271 ?auto_28279 ) ) ( not ( = ?auto_28278 ?auto_28279 ) ) ( not ( = ?auto_28282 ?auto_28279 ) ) ( not ( = ?auto_28285 ?auto_28279 ) ) ( not ( = ?auto_28272 ?auto_28279 ) ) ( TRUCK-AT ?auto_28284 ?auto_28276 ) ( SURFACE-AT ?auto_28277 ?auto_28276 ) ( CLEAR ?auto_28277 ) ( IS-CRATE ?auto_28272 ) ( not ( = ?auto_28270 ?auto_28277 ) ) ( not ( = ?auto_28271 ?auto_28277 ) ) ( not ( = ?auto_28278 ?auto_28277 ) ) ( not ( = ?auto_28282 ?auto_28277 ) ) ( not ( = ?auto_28285 ?auto_28277 ) ) ( not ( = ?auto_28272 ?auto_28277 ) ) ( not ( = ?auto_28279 ?auto_28277 ) ) ( AVAILABLE ?auto_28281 ) ( IN ?auto_28272 ?auto_28284 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28281 ?auto_28272 ?auto_28284 ?auto_28276 )
      ( MAKE-ON ?auto_28270 ?auto_28271 )
      ( MAKE-ON-VERIFY ?auto_28270 ?auto_28271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28287 - SURFACE
      ?auto_28288 - SURFACE
    )
    :vars
    (
      ?auto_28303 - HOIST
      ?auto_28289 - PLACE
      ?auto_28291 - PLACE
      ?auto_28299 - HOIST
      ?auto_28301 - SURFACE
      ?auto_28296 - SURFACE
      ?auto_28294 - PLACE
      ?auto_28293 - HOIST
      ?auto_28297 - SURFACE
      ?auto_28298 - SURFACE
      ?auto_28300 - PLACE
      ?auto_28302 - HOIST
      ?auto_28290 - SURFACE
      ?auto_28295 - SURFACE
      ?auto_28292 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28303 ?auto_28289 ) ( IS-CRATE ?auto_28287 ) ( not ( = ?auto_28287 ?auto_28288 ) ) ( not ( = ?auto_28291 ?auto_28289 ) ) ( HOIST-AT ?auto_28299 ?auto_28291 ) ( not ( = ?auto_28303 ?auto_28299 ) ) ( AVAILABLE ?auto_28299 ) ( SURFACE-AT ?auto_28287 ?auto_28291 ) ( ON ?auto_28287 ?auto_28301 ) ( CLEAR ?auto_28287 ) ( not ( = ?auto_28287 ?auto_28301 ) ) ( not ( = ?auto_28288 ?auto_28301 ) ) ( IS-CRATE ?auto_28288 ) ( not ( = ?auto_28287 ?auto_28296 ) ) ( not ( = ?auto_28288 ?auto_28296 ) ) ( not ( = ?auto_28301 ?auto_28296 ) ) ( not ( = ?auto_28294 ?auto_28289 ) ) ( not ( = ?auto_28291 ?auto_28294 ) ) ( HOIST-AT ?auto_28293 ?auto_28294 ) ( not ( = ?auto_28303 ?auto_28293 ) ) ( not ( = ?auto_28299 ?auto_28293 ) ) ( AVAILABLE ?auto_28293 ) ( SURFACE-AT ?auto_28288 ?auto_28294 ) ( ON ?auto_28288 ?auto_28297 ) ( CLEAR ?auto_28288 ) ( not ( = ?auto_28287 ?auto_28297 ) ) ( not ( = ?auto_28288 ?auto_28297 ) ) ( not ( = ?auto_28301 ?auto_28297 ) ) ( not ( = ?auto_28296 ?auto_28297 ) ) ( IS-CRATE ?auto_28296 ) ( not ( = ?auto_28287 ?auto_28298 ) ) ( not ( = ?auto_28288 ?auto_28298 ) ) ( not ( = ?auto_28301 ?auto_28298 ) ) ( not ( = ?auto_28296 ?auto_28298 ) ) ( not ( = ?auto_28297 ?auto_28298 ) ) ( not ( = ?auto_28300 ?auto_28289 ) ) ( not ( = ?auto_28291 ?auto_28300 ) ) ( not ( = ?auto_28294 ?auto_28300 ) ) ( HOIST-AT ?auto_28302 ?auto_28300 ) ( not ( = ?auto_28303 ?auto_28302 ) ) ( not ( = ?auto_28299 ?auto_28302 ) ) ( not ( = ?auto_28293 ?auto_28302 ) ) ( AVAILABLE ?auto_28302 ) ( SURFACE-AT ?auto_28296 ?auto_28300 ) ( ON ?auto_28296 ?auto_28290 ) ( CLEAR ?auto_28296 ) ( not ( = ?auto_28287 ?auto_28290 ) ) ( not ( = ?auto_28288 ?auto_28290 ) ) ( not ( = ?auto_28301 ?auto_28290 ) ) ( not ( = ?auto_28296 ?auto_28290 ) ) ( not ( = ?auto_28297 ?auto_28290 ) ) ( not ( = ?auto_28298 ?auto_28290 ) ) ( SURFACE-AT ?auto_28295 ?auto_28289 ) ( CLEAR ?auto_28295 ) ( IS-CRATE ?auto_28298 ) ( not ( = ?auto_28287 ?auto_28295 ) ) ( not ( = ?auto_28288 ?auto_28295 ) ) ( not ( = ?auto_28301 ?auto_28295 ) ) ( not ( = ?auto_28296 ?auto_28295 ) ) ( not ( = ?auto_28297 ?auto_28295 ) ) ( not ( = ?auto_28298 ?auto_28295 ) ) ( not ( = ?auto_28290 ?auto_28295 ) ) ( AVAILABLE ?auto_28303 ) ( IN ?auto_28298 ?auto_28292 ) ( TRUCK-AT ?auto_28292 ?auto_28300 ) )
    :subtasks
    ( ( !DRIVE ?auto_28292 ?auto_28300 ?auto_28289 )
      ( MAKE-ON ?auto_28287 ?auto_28288 )
      ( MAKE-ON-VERIFY ?auto_28287 ?auto_28288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28304 - SURFACE
      ?auto_28305 - SURFACE
    )
    :vars
    (
      ?auto_28306 - HOIST
      ?auto_28310 - PLACE
      ?auto_28317 - PLACE
      ?auto_28316 - HOIST
      ?auto_28311 - SURFACE
      ?auto_28319 - SURFACE
      ?auto_28318 - PLACE
      ?auto_28308 - HOIST
      ?auto_28320 - SURFACE
      ?auto_28307 - SURFACE
      ?auto_28309 - PLACE
      ?auto_28314 - HOIST
      ?auto_28313 - SURFACE
      ?auto_28312 - SURFACE
      ?auto_28315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28306 ?auto_28310 ) ( IS-CRATE ?auto_28304 ) ( not ( = ?auto_28304 ?auto_28305 ) ) ( not ( = ?auto_28317 ?auto_28310 ) ) ( HOIST-AT ?auto_28316 ?auto_28317 ) ( not ( = ?auto_28306 ?auto_28316 ) ) ( AVAILABLE ?auto_28316 ) ( SURFACE-AT ?auto_28304 ?auto_28317 ) ( ON ?auto_28304 ?auto_28311 ) ( CLEAR ?auto_28304 ) ( not ( = ?auto_28304 ?auto_28311 ) ) ( not ( = ?auto_28305 ?auto_28311 ) ) ( IS-CRATE ?auto_28305 ) ( not ( = ?auto_28304 ?auto_28319 ) ) ( not ( = ?auto_28305 ?auto_28319 ) ) ( not ( = ?auto_28311 ?auto_28319 ) ) ( not ( = ?auto_28318 ?auto_28310 ) ) ( not ( = ?auto_28317 ?auto_28318 ) ) ( HOIST-AT ?auto_28308 ?auto_28318 ) ( not ( = ?auto_28306 ?auto_28308 ) ) ( not ( = ?auto_28316 ?auto_28308 ) ) ( AVAILABLE ?auto_28308 ) ( SURFACE-AT ?auto_28305 ?auto_28318 ) ( ON ?auto_28305 ?auto_28320 ) ( CLEAR ?auto_28305 ) ( not ( = ?auto_28304 ?auto_28320 ) ) ( not ( = ?auto_28305 ?auto_28320 ) ) ( not ( = ?auto_28311 ?auto_28320 ) ) ( not ( = ?auto_28319 ?auto_28320 ) ) ( IS-CRATE ?auto_28319 ) ( not ( = ?auto_28304 ?auto_28307 ) ) ( not ( = ?auto_28305 ?auto_28307 ) ) ( not ( = ?auto_28311 ?auto_28307 ) ) ( not ( = ?auto_28319 ?auto_28307 ) ) ( not ( = ?auto_28320 ?auto_28307 ) ) ( not ( = ?auto_28309 ?auto_28310 ) ) ( not ( = ?auto_28317 ?auto_28309 ) ) ( not ( = ?auto_28318 ?auto_28309 ) ) ( HOIST-AT ?auto_28314 ?auto_28309 ) ( not ( = ?auto_28306 ?auto_28314 ) ) ( not ( = ?auto_28316 ?auto_28314 ) ) ( not ( = ?auto_28308 ?auto_28314 ) ) ( SURFACE-AT ?auto_28319 ?auto_28309 ) ( ON ?auto_28319 ?auto_28313 ) ( CLEAR ?auto_28319 ) ( not ( = ?auto_28304 ?auto_28313 ) ) ( not ( = ?auto_28305 ?auto_28313 ) ) ( not ( = ?auto_28311 ?auto_28313 ) ) ( not ( = ?auto_28319 ?auto_28313 ) ) ( not ( = ?auto_28320 ?auto_28313 ) ) ( not ( = ?auto_28307 ?auto_28313 ) ) ( SURFACE-AT ?auto_28312 ?auto_28310 ) ( CLEAR ?auto_28312 ) ( IS-CRATE ?auto_28307 ) ( not ( = ?auto_28304 ?auto_28312 ) ) ( not ( = ?auto_28305 ?auto_28312 ) ) ( not ( = ?auto_28311 ?auto_28312 ) ) ( not ( = ?auto_28319 ?auto_28312 ) ) ( not ( = ?auto_28320 ?auto_28312 ) ) ( not ( = ?auto_28307 ?auto_28312 ) ) ( not ( = ?auto_28313 ?auto_28312 ) ) ( AVAILABLE ?auto_28306 ) ( TRUCK-AT ?auto_28315 ?auto_28309 ) ( LIFTING ?auto_28314 ?auto_28307 ) )
    :subtasks
    ( ( !LOAD ?auto_28314 ?auto_28307 ?auto_28315 ?auto_28309 )
      ( MAKE-ON ?auto_28304 ?auto_28305 )
      ( MAKE-ON-VERIFY ?auto_28304 ?auto_28305 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28321 - SURFACE
      ?auto_28322 - SURFACE
    )
    :vars
    (
      ?auto_28325 - HOIST
      ?auto_28327 - PLACE
      ?auto_28331 - PLACE
      ?auto_28326 - HOIST
      ?auto_28334 - SURFACE
      ?auto_28328 - SURFACE
      ?auto_28329 - PLACE
      ?auto_28332 - HOIST
      ?auto_28323 - SURFACE
      ?auto_28330 - SURFACE
      ?auto_28336 - PLACE
      ?auto_28324 - HOIST
      ?auto_28333 - SURFACE
      ?auto_28335 - SURFACE
      ?auto_28337 - TRUCK
      ?auto_28338 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28325 ?auto_28327 ) ( IS-CRATE ?auto_28321 ) ( not ( = ?auto_28321 ?auto_28322 ) ) ( not ( = ?auto_28331 ?auto_28327 ) ) ( HOIST-AT ?auto_28326 ?auto_28331 ) ( not ( = ?auto_28325 ?auto_28326 ) ) ( AVAILABLE ?auto_28326 ) ( SURFACE-AT ?auto_28321 ?auto_28331 ) ( ON ?auto_28321 ?auto_28334 ) ( CLEAR ?auto_28321 ) ( not ( = ?auto_28321 ?auto_28334 ) ) ( not ( = ?auto_28322 ?auto_28334 ) ) ( IS-CRATE ?auto_28322 ) ( not ( = ?auto_28321 ?auto_28328 ) ) ( not ( = ?auto_28322 ?auto_28328 ) ) ( not ( = ?auto_28334 ?auto_28328 ) ) ( not ( = ?auto_28329 ?auto_28327 ) ) ( not ( = ?auto_28331 ?auto_28329 ) ) ( HOIST-AT ?auto_28332 ?auto_28329 ) ( not ( = ?auto_28325 ?auto_28332 ) ) ( not ( = ?auto_28326 ?auto_28332 ) ) ( AVAILABLE ?auto_28332 ) ( SURFACE-AT ?auto_28322 ?auto_28329 ) ( ON ?auto_28322 ?auto_28323 ) ( CLEAR ?auto_28322 ) ( not ( = ?auto_28321 ?auto_28323 ) ) ( not ( = ?auto_28322 ?auto_28323 ) ) ( not ( = ?auto_28334 ?auto_28323 ) ) ( not ( = ?auto_28328 ?auto_28323 ) ) ( IS-CRATE ?auto_28328 ) ( not ( = ?auto_28321 ?auto_28330 ) ) ( not ( = ?auto_28322 ?auto_28330 ) ) ( not ( = ?auto_28334 ?auto_28330 ) ) ( not ( = ?auto_28328 ?auto_28330 ) ) ( not ( = ?auto_28323 ?auto_28330 ) ) ( not ( = ?auto_28336 ?auto_28327 ) ) ( not ( = ?auto_28331 ?auto_28336 ) ) ( not ( = ?auto_28329 ?auto_28336 ) ) ( HOIST-AT ?auto_28324 ?auto_28336 ) ( not ( = ?auto_28325 ?auto_28324 ) ) ( not ( = ?auto_28326 ?auto_28324 ) ) ( not ( = ?auto_28332 ?auto_28324 ) ) ( SURFACE-AT ?auto_28328 ?auto_28336 ) ( ON ?auto_28328 ?auto_28333 ) ( CLEAR ?auto_28328 ) ( not ( = ?auto_28321 ?auto_28333 ) ) ( not ( = ?auto_28322 ?auto_28333 ) ) ( not ( = ?auto_28334 ?auto_28333 ) ) ( not ( = ?auto_28328 ?auto_28333 ) ) ( not ( = ?auto_28323 ?auto_28333 ) ) ( not ( = ?auto_28330 ?auto_28333 ) ) ( SURFACE-AT ?auto_28335 ?auto_28327 ) ( CLEAR ?auto_28335 ) ( IS-CRATE ?auto_28330 ) ( not ( = ?auto_28321 ?auto_28335 ) ) ( not ( = ?auto_28322 ?auto_28335 ) ) ( not ( = ?auto_28334 ?auto_28335 ) ) ( not ( = ?auto_28328 ?auto_28335 ) ) ( not ( = ?auto_28323 ?auto_28335 ) ) ( not ( = ?auto_28330 ?auto_28335 ) ) ( not ( = ?auto_28333 ?auto_28335 ) ) ( AVAILABLE ?auto_28325 ) ( TRUCK-AT ?auto_28337 ?auto_28336 ) ( AVAILABLE ?auto_28324 ) ( SURFACE-AT ?auto_28330 ?auto_28336 ) ( ON ?auto_28330 ?auto_28338 ) ( CLEAR ?auto_28330 ) ( not ( = ?auto_28321 ?auto_28338 ) ) ( not ( = ?auto_28322 ?auto_28338 ) ) ( not ( = ?auto_28334 ?auto_28338 ) ) ( not ( = ?auto_28328 ?auto_28338 ) ) ( not ( = ?auto_28323 ?auto_28338 ) ) ( not ( = ?auto_28330 ?auto_28338 ) ) ( not ( = ?auto_28333 ?auto_28338 ) ) ( not ( = ?auto_28335 ?auto_28338 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28324 ?auto_28330 ?auto_28338 ?auto_28336 )
      ( MAKE-ON ?auto_28321 ?auto_28322 )
      ( MAKE-ON-VERIFY ?auto_28321 ?auto_28322 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28339 - SURFACE
      ?auto_28340 - SURFACE
    )
    :vars
    (
      ?auto_28345 - HOIST
      ?auto_28349 - PLACE
      ?auto_28347 - PLACE
      ?auto_28342 - HOIST
      ?auto_28352 - SURFACE
      ?auto_28355 - SURFACE
      ?auto_28350 - PLACE
      ?auto_28343 - HOIST
      ?auto_28348 - SURFACE
      ?auto_28341 - SURFACE
      ?auto_28353 - PLACE
      ?auto_28344 - HOIST
      ?auto_28356 - SURFACE
      ?auto_28346 - SURFACE
      ?auto_28354 - SURFACE
      ?auto_28351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28345 ?auto_28349 ) ( IS-CRATE ?auto_28339 ) ( not ( = ?auto_28339 ?auto_28340 ) ) ( not ( = ?auto_28347 ?auto_28349 ) ) ( HOIST-AT ?auto_28342 ?auto_28347 ) ( not ( = ?auto_28345 ?auto_28342 ) ) ( AVAILABLE ?auto_28342 ) ( SURFACE-AT ?auto_28339 ?auto_28347 ) ( ON ?auto_28339 ?auto_28352 ) ( CLEAR ?auto_28339 ) ( not ( = ?auto_28339 ?auto_28352 ) ) ( not ( = ?auto_28340 ?auto_28352 ) ) ( IS-CRATE ?auto_28340 ) ( not ( = ?auto_28339 ?auto_28355 ) ) ( not ( = ?auto_28340 ?auto_28355 ) ) ( not ( = ?auto_28352 ?auto_28355 ) ) ( not ( = ?auto_28350 ?auto_28349 ) ) ( not ( = ?auto_28347 ?auto_28350 ) ) ( HOIST-AT ?auto_28343 ?auto_28350 ) ( not ( = ?auto_28345 ?auto_28343 ) ) ( not ( = ?auto_28342 ?auto_28343 ) ) ( AVAILABLE ?auto_28343 ) ( SURFACE-AT ?auto_28340 ?auto_28350 ) ( ON ?auto_28340 ?auto_28348 ) ( CLEAR ?auto_28340 ) ( not ( = ?auto_28339 ?auto_28348 ) ) ( not ( = ?auto_28340 ?auto_28348 ) ) ( not ( = ?auto_28352 ?auto_28348 ) ) ( not ( = ?auto_28355 ?auto_28348 ) ) ( IS-CRATE ?auto_28355 ) ( not ( = ?auto_28339 ?auto_28341 ) ) ( not ( = ?auto_28340 ?auto_28341 ) ) ( not ( = ?auto_28352 ?auto_28341 ) ) ( not ( = ?auto_28355 ?auto_28341 ) ) ( not ( = ?auto_28348 ?auto_28341 ) ) ( not ( = ?auto_28353 ?auto_28349 ) ) ( not ( = ?auto_28347 ?auto_28353 ) ) ( not ( = ?auto_28350 ?auto_28353 ) ) ( HOIST-AT ?auto_28344 ?auto_28353 ) ( not ( = ?auto_28345 ?auto_28344 ) ) ( not ( = ?auto_28342 ?auto_28344 ) ) ( not ( = ?auto_28343 ?auto_28344 ) ) ( SURFACE-AT ?auto_28355 ?auto_28353 ) ( ON ?auto_28355 ?auto_28356 ) ( CLEAR ?auto_28355 ) ( not ( = ?auto_28339 ?auto_28356 ) ) ( not ( = ?auto_28340 ?auto_28356 ) ) ( not ( = ?auto_28352 ?auto_28356 ) ) ( not ( = ?auto_28355 ?auto_28356 ) ) ( not ( = ?auto_28348 ?auto_28356 ) ) ( not ( = ?auto_28341 ?auto_28356 ) ) ( SURFACE-AT ?auto_28346 ?auto_28349 ) ( CLEAR ?auto_28346 ) ( IS-CRATE ?auto_28341 ) ( not ( = ?auto_28339 ?auto_28346 ) ) ( not ( = ?auto_28340 ?auto_28346 ) ) ( not ( = ?auto_28352 ?auto_28346 ) ) ( not ( = ?auto_28355 ?auto_28346 ) ) ( not ( = ?auto_28348 ?auto_28346 ) ) ( not ( = ?auto_28341 ?auto_28346 ) ) ( not ( = ?auto_28356 ?auto_28346 ) ) ( AVAILABLE ?auto_28345 ) ( AVAILABLE ?auto_28344 ) ( SURFACE-AT ?auto_28341 ?auto_28353 ) ( ON ?auto_28341 ?auto_28354 ) ( CLEAR ?auto_28341 ) ( not ( = ?auto_28339 ?auto_28354 ) ) ( not ( = ?auto_28340 ?auto_28354 ) ) ( not ( = ?auto_28352 ?auto_28354 ) ) ( not ( = ?auto_28355 ?auto_28354 ) ) ( not ( = ?auto_28348 ?auto_28354 ) ) ( not ( = ?auto_28341 ?auto_28354 ) ) ( not ( = ?auto_28356 ?auto_28354 ) ) ( not ( = ?auto_28346 ?auto_28354 ) ) ( TRUCK-AT ?auto_28351 ?auto_28349 ) )
    :subtasks
    ( ( !DRIVE ?auto_28351 ?auto_28349 ?auto_28353 )
      ( MAKE-ON ?auto_28339 ?auto_28340 )
      ( MAKE-ON-VERIFY ?auto_28339 ?auto_28340 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28357 - SURFACE
      ?auto_28358 - SURFACE
    )
    :vars
    (
      ?auto_28370 - HOIST
      ?auto_28368 - PLACE
      ?auto_28369 - PLACE
      ?auto_28360 - HOIST
      ?auto_28372 - SURFACE
      ?auto_28366 - SURFACE
      ?auto_28365 - PLACE
      ?auto_28362 - HOIST
      ?auto_28371 - SURFACE
      ?auto_28364 - SURFACE
      ?auto_28367 - PLACE
      ?auto_28363 - HOIST
      ?auto_28359 - SURFACE
      ?auto_28374 - SURFACE
      ?auto_28361 - SURFACE
      ?auto_28373 - TRUCK
      ?auto_28375 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28370 ?auto_28368 ) ( IS-CRATE ?auto_28357 ) ( not ( = ?auto_28357 ?auto_28358 ) ) ( not ( = ?auto_28369 ?auto_28368 ) ) ( HOIST-AT ?auto_28360 ?auto_28369 ) ( not ( = ?auto_28370 ?auto_28360 ) ) ( AVAILABLE ?auto_28360 ) ( SURFACE-AT ?auto_28357 ?auto_28369 ) ( ON ?auto_28357 ?auto_28372 ) ( CLEAR ?auto_28357 ) ( not ( = ?auto_28357 ?auto_28372 ) ) ( not ( = ?auto_28358 ?auto_28372 ) ) ( IS-CRATE ?auto_28358 ) ( not ( = ?auto_28357 ?auto_28366 ) ) ( not ( = ?auto_28358 ?auto_28366 ) ) ( not ( = ?auto_28372 ?auto_28366 ) ) ( not ( = ?auto_28365 ?auto_28368 ) ) ( not ( = ?auto_28369 ?auto_28365 ) ) ( HOIST-AT ?auto_28362 ?auto_28365 ) ( not ( = ?auto_28370 ?auto_28362 ) ) ( not ( = ?auto_28360 ?auto_28362 ) ) ( AVAILABLE ?auto_28362 ) ( SURFACE-AT ?auto_28358 ?auto_28365 ) ( ON ?auto_28358 ?auto_28371 ) ( CLEAR ?auto_28358 ) ( not ( = ?auto_28357 ?auto_28371 ) ) ( not ( = ?auto_28358 ?auto_28371 ) ) ( not ( = ?auto_28372 ?auto_28371 ) ) ( not ( = ?auto_28366 ?auto_28371 ) ) ( IS-CRATE ?auto_28366 ) ( not ( = ?auto_28357 ?auto_28364 ) ) ( not ( = ?auto_28358 ?auto_28364 ) ) ( not ( = ?auto_28372 ?auto_28364 ) ) ( not ( = ?auto_28366 ?auto_28364 ) ) ( not ( = ?auto_28371 ?auto_28364 ) ) ( not ( = ?auto_28367 ?auto_28368 ) ) ( not ( = ?auto_28369 ?auto_28367 ) ) ( not ( = ?auto_28365 ?auto_28367 ) ) ( HOIST-AT ?auto_28363 ?auto_28367 ) ( not ( = ?auto_28370 ?auto_28363 ) ) ( not ( = ?auto_28360 ?auto_28363 ) ) ( not ( = ?auto_28362 ?auto_28363 ) ) ( SURFACE-AT ?auto_28366 ?auto_28367 ) ( ON ?auto_28366 ?auto_28359 ) ( CLEAR ?auto_28366 ) ( not ( = ?auto_28357 ?auto_28359 ) ) ( not ( = ?auto_28358 ?auto_28359 ) ) ( not ( = ?auto_28372 ?auto_28359 ) ) ( not ( = ?auto_28366 ?auto_28359 ) ) ( not ( = ?auto_28371 ?auto_28359 ) ) ( not ( = ?auto_28364 ?auto_28359 ) ) ( IS-CRATE ?auto_28364 ) ( not ( = ?auto_28357 ?auto_28374 ) ) ( not ( = ?auto_28358 ?auto_28374 ) ) ( not ( = ?auto_28372 ?auto_28374 ) ) ( not ( = ?auto_28366 ?auto_28374 ) ) ( not ( = ?auto_28371 ?auto_28374 ) ) ( not ( = ?auto_28364 ?auto_28374 ) ) ( not ( = ?auto_28359 ?auto_28374 ) ) ( AVAILABLE ?auto_28363 ) ( SURFACE-AT ?auto_28364 ?auto_28367 ) ( ON ?auto_28364 ?auto_28361 ) ( CLEAR ?auto_28364 ) ( not ( = ?auto_28357 ?auto_28361 ) ) ( not ( = ?auto_28358 ?auto_28361 ) ) ( not ( = ?auto_28372 ?auto_28361 ) ) ( not ( = ?auto_28366 ?auto_28361 ) ) ( not ( = ?auto_28371 ?auto_28361 ) ) ( not ( = ?auto_28364 ?auto_28361 ) ) ( not ( = ?auto_28359 ?auto_28361 ) ) ( not ( = ?auto_28374 ?auto_28361 ) ) ( TRUCK-AT ?auto_28373 ?auto_28368 ) ( SURFACE-AT ?auto_28375 ?auto_28368 ) ( CLEAR ?auto_28375 ) ( LIFTING ?auto_28370 ?auto_28374 ) ( IS-CRATE ?auto_28374 ) ( not ( = ?auto_28357 ?auto_28375 ) ) ( not ( = ?auto_28358 ?auto_28375 ) ) ( not ( = ?auto_28372 ?auto_28375 ) ) ( not ( = ?auto_28366 ?auto_28375 ) ) ( not ( = ?auto_28371 ?auto_28375 ) ) ( not ( = ?auto_28364 ?auto_28375 ) ) ( not ( = ?auto_28359 ?auto_28375 ) ) ( not ( = ?auto_28374 ?auto_28375 ) ) ( not ( = ?auto_28361 ?auto_28375 ) ) )
    :subtasks
    ( ( !DROP ?auto_28370 ?auto_28374 ?auto_28375 ?auto_28368 )
      ( MAKE-ON ?auto_28357 ?auto_28358 )
      ( MAKE-ON-VERIFY ?auto_28357 ?auto_28358 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28376 - SURFACE
      ?auto_28377 - SURFACE
    )
    :vars
    (
      ?auto_28391 - HOIST
      ?auto_28380 - PLACE
      ?auto_28393 - PLACE
      ?auto_28378 - HOIST
      ?auto_28386 - SURFACE
      ?auto_28387 - SURFACE
      ?auto_28382 - PLACE
      ?auto_28389 - HOIST
      ?auto_28381 - SURFACE
      ?auto_28392 - SURFACE
      ?auto_28384 - PLACE
      ?auto_28390 - HOIST
      ?auto_28385 - SURFACE
      ?auto_28394 - SURFACE
      ?auto_28388 - SURFACE
      ?auto_28379 - TRUCK
      ?auto_28383 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28391 ?auto_28380 ) ( IS-CRATE ?auto_28376 ) ( not ( = ?auto_28376 ?auto_28377 ) ) ( not ( = ?auto_28393 ?auto_28380 ) ) ( HOIST-AT ?auto_28378 ?auto_28393 ) ( not ( = ?auto_28391 ?auto_28378 ) ) ( AVAILABLE ?auto_28378 ) ( SURFACE-AT ?auto_28376 ?auto_28393 ) ( ON ?auto_28376 ?auto_28386 ) ( CLEAR ?auto_28376 ) ( not ( = ?auto_28376 ?auto_28386 ) ) ( not ( = ?auto_28377 ?auto_28386 ) ) ( IS-CRATE ?auto_28377 ) ( not ( = ?auto_28376 ?auto_28387 ) ) ( not ( = ?auto_28377 ?auto_28387 ) ) ( not ( = ?auto_28386 ?auto_28387 ) ) ( not ( = ?auto_28382 ?auto_28380 ) ) ( not ( = ?auto_28393 ?auto_28382 ) ) ( HOIST-AT ?auto_28389 ?auto_28382 ) ( not ( = ?auto_28391 ?auto_28389 ) ) ( not ( = ?auto_28378 ?auto_28389 ) ) ( AVAILABLE ?auto_28389 ) ( SURFACE-AT ?auto_28377 ?auto_28382 ) ( ON ?auto_28377 ?auto_28381 ) ( CLEAR ?auto_28377 ) ( not ( = ?auto_28376 ?auto_28381 ) ) ( not ( = ?auto_28377 ?auto_28381 ) ) ( not ( = ?auto_28386 ?auto_28381 ) ) ( not ( = ?auto_28387 ?auto_28381 ) ) ( IS-CRATE ?auto_28387 ) ( not ( = ?auto_28376 ?auto_28392 ) ) ( not ( = ?auto_28377 ?auto_28392 ) ) ( not ( = ?auto_28386 ?auto_28392 ) ) ( not ( = ?auto_28387 ?auto_28392 ) ) ( not ( = ?auto_28381 ?auto_28392 ) ) ( not ( = ?auto_28384 ?auto_28380 ) ) ( not ( = ?auto_28393 ?auto_28384 ) ) ( not ( = ?auto_28382 ?auto_28384 ) ) ( HOIST-AT ?auto_28390 ?auto_28384 ) ( not ( = ?auto_28391 ?auto_28390 ) ) ( not ( = ?auto_28378 ?auto_28390 ) ) ( not ( = ?auto_28389 ?auto_28390 ) ) ( SURFACE-AT ?auto_28387 ?auto_28384 ) ( ON ?auto_28387 ?auto_28385 ) ( CLEAR ?auto_28387 ) ( not ( = ?auto_28376 ?auto_28385 ) ) ( not ( = ?auto_28377 ?auto_28385 ) ) ( not ( = ?auto_28386 ?auto_28385 ) ) ( not ( = ?auto_28387 ?auto_28385 ) ) ( not ( = ?auto_28381 ?auto_28385 ) ) ( not ( = ?auto_28392 ?auto_28385 ) ) ( IS-CRATE ?auto_28392 ) ( not ( = ?auto_28376 ?auto_28394 ) ) ( not ( = ?auto_28377 ?auto_28394 ) ) ( not ( = ?auto_28386 ?auto_28394 ) ) ( not ( = ?auto_28387 ?auto_28394 ) ) ( not ( = ?auto_28381 ?auto_28394 ) ) ( not ( = ?auto_28392 ?auto_28394 ) ) ( not ( = ?auto_28385 ?auto_28394 ) ) ( AVAILABLE ?auto_28390 ) ( SURFACE-AT ?auto_28392 ?auto_28384 ) ( ON ?auto_28392 ?auto_28388 ) ( CLEAR ?auto_28392 ) ( not ( = ?auto_28376 ?auto_28388 ) ) ( not ( = ?auto_28377 ?auto_28388 ) ) ( not ( = ?auto_28386 ?auto_28388 ) ) ( not ( = ?auto_28387 ?auto_28388 ) ) ( not ( = ?auto_28381 ?auto_28388 ) ) ( not ( = ?auto_28392 ?auto_28388 ) ) ( not ( = ?auto_28385 ?auto_28388 ) ) ( not ( = ?auto_28394 ?auto_28388 ) ) ( TRUCK-AT ?auto_28379 ?auto_28380 ) ( SURFACE-AT ?auto_28383 ?auto_28380 ) ( CLEAR ?auto_28383 ) ( IS-CRATE ?auto_28394 ) ( not ( = ?auto_28376 ?auto_28383 ) ) ( not ( = ?auto_28377 ?auto_28383 ) ) ( not ( = ?auto_28386 ?auto_28383 ) ) ( not ( = ?auto_28387 ?auto_28383 ) ) ( not ( = ?auto_28381 ?auto_28383 ) ) ( not ( = ?auto_28392 ?auto_28383 ) ) ( not ( = ?auto_28385 ?auto_28383 ) ) ( not ( = ?auto_28394 ?auto_28383 ) ) ( not ( = ?auto_28388 ?auto_28383 ) ) ( AVAILABLE ?auto_28391 ) ( IN ?auto_28394 ?auto_28379 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28391 ?auto_28394 ?auto_28379 ?auto_28380 )
      ( MAKE-ON ?auto_28376 ?auto_28377 )
      ( MAKE-ON-VERIFY ?auto_28376 ?auto_28377 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28395 - SURFACE
      ?auto_28396 - SURFACE
    )
    :vars
    (
      ?auto_28412 - HOIST
      ?auto_28398 - PLACE
      ?auto_28408 - PLACE
      ?auto_28405 - HOIST
      ?auto_28402 - SURFACE
      ?auto_28400 - SURFACE
      ?auto_28409 - PLACE
      ?auto_28403 - HOIST
      ?auto_28401 - SURFACE
      ?auto_28406 - SURFACE
      ?auto_28399 - PLACE
      ?auto_28410 - HOIST
      ?auto_28397 - SURFACE
      ?auto_28407 - SURFACE
      ?auto_28413 - SURFACE
      ?auto_28404 - SURFACE
      ?auto_28411 - TRUCK
      ?auto_28414 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28412 ?auto_28398 ) ( IS-CRATE ?auto_28395 ) ( not ( = ?auto_28395 ?auto_28396 ) ) ( not ( = ?auto_28408 ?auto_28398 ) ) ( HOIST-AT ?auto_28405 ?auto_28408 ) ( not ( = ?auto_28412 ?auto_28405 ) ) ( AVAILABLE ?auto_28405 ) ( SURFACE-AT ?auto_28395 ?auto_28408 ) ( ON ?auto_28395 ?auto_28402 ) ( CLEAR ?auto_28395 ) ( not ( = ?auto_28395 ?auto_28402 ) ) ( not ( = ?auto_28396 ?auto_28402 ) ) ( IS-CRATE ?auto_28396 ) ( not ( = ?auto_28395 ?auto_28400 ) ) ( not ( = ?auto_28396 ?auto_28400 ) ) ( not ( = ?auto_28402 ?auto_28400 ) ) ( not ( = ?auto_28409 ?auto_28398 ) ) ( not ( = ?auto_28408 ?auto_28409 ) ) ( HOIST-AT ?auto_28403 ?auto_28409 ) ( not ( = ?auto_28412 ?auto_28403 ) ) ( not ( = ?auto_28405 ?auto_28403 ) ) ( AVAILABLE ?auto_28403 ) ( SURFACE-AT ?auto_28396 ?auto_28409 ) ( ON ?auto_28396 ?auto_28401 ) ( CLEAR ?auto_28396 ) ( not ( = ?auto_28395 ?auto_28401 ) ) ( not ( = ?auto_28396 ?auto_28401 ) ) ( not ( = ?auto_28402 ?auto_28401 ) ) ( not ( = ?auto_28400 ?auto_28401 ) ) ( IS-CRATE ?auto_28400 ) ( not ( = ?auto_28395 ?auto_28406 ) ) ( not ( = ?auto_28396 ?auto_28406 ) ) ( not ( = ?auto_28402 ?auto_28406 ) ) ( not ( = ?auto_28400 ?auto_28406 ) ) ( not ( = ?auto_28401 ?auto_28406 ) ) ( not ( = ?auto_28399 ?auto_28398 ) ) ( not ( = ?auto_28408 ?auto_28399 ) ) ( not ( = ?auto_28409 ?auto_28399 ) ) ( HOIST-AT ?auto_28410 ?auto_28399 ) ( not ( = ?auto_28412 ?auto_28410 ) ) ( not ( = ?auto_28405 ?auto_28410 ) ) ( not ( = ?auto_28403 ?auto_28410 ) ) ( SURFACE-AT ?auto_28400 ?auto_28399 ) ( ON ?auto_28400 ?auto_28397 ) ( CLEAR ?auto_28400 ) ( not ( = ?auto_28395 ?auto_28397 ) ) ( not ( = ?auto_28396 ?auto_28397 ) ) ( not ( = ?auto_28402 ?auto_28397 ) ) ( not ( = ?auto_28400 ?auto_28397 ) ) ( not ( = ?auto_28401 ?auto_28397 ) ) ( not ( = ?auto_28406 ?auto_28397 ) ) ( IS-CRATE ?auto_28406 ) ( not ( = ?auto_28395 ?auto_28407 ) ) ( not ( = ?auto_28396 ?auto_28407 ) ) ( not ( = ?auto_28402 ?auto_28407 ) ) ( not ( = ?auto_28400 ?auto_28407 ) ) ( not ( = ?auto_28401 ?auto_28407 ) ) ( not ( = ?auto_28406 ?auto_28407 ) ) ( not ( = ?auto_28397 ?auto_28407 ) ) ( AVAILABLE ?auto_28410 ) ( SURFACE-AT ?auto_28406 ?auto_28399 ) ( ON ?auto_28406 ?auto_28413 ) ( CLEAR ?auto_28406 ) ( not ( = ?auto_28395 ?auto_28413 ) ) ( not ( = ?auto_28396 ?auto_28413 ) ) ( not ( = ?auto_28402 ?auto_28413 ) ) ( not ( = ?auto_28400 ?auto_28413 ) ) ( not ( = ?auto_28401 ?auto_28413 ) ) ( not ( = ?auto_28406 ?auto_28413 ) ) ( not ( = ?auto_28397 ?auto_28413 ) ) ( not ( = ?auto_28407 ?auto_28413 ) ) ( SURFACE-AT ?auto_28404 ?auto_28398 ) ( CLEAR ?auto_28404 ) ( IS-CRATE ?auto_28407 ) ( not ( = ?auto_28395 ?auto_28404 ) ) ( not ( = ?auto_28396 ?auto_28404 ) ) ( not ( = ?auto_28402 ?auto_28404 ) ) ( not ( = ?auto_28400 ?auto_28404 ) ) ( not ( = ?auto_28401 ?auto_28404 ) ) ( not ( = ?auto_28406 ?auto_28404 ) ) ( not ( = ?auto_28397 ?auto_28404 ) ) ( not ( = ?auto_28407 ?auto_28404 ) ) ( not ( = ?auto_28413 ?auto_28404 ) ) ( AVAILABLE ?auto_28412 ) ( IN ?auto_28407 ?auto_28411 ) ( TRUCK-AT ?auto_28411 ?auto_28414 ) ( not ( = ?auto_28414 ?auto_28398 ) ) ( not ( = ?auto_28408 ?auto_28414 ) ) ( not ( = ?auto_28409 ?auto_28414 ) ) ( not ( = ?auto_28399 ?auto_28414 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28411 ?auto_28414 ?auto_28398 )
      ( MAKE-ON ?auto_28395 ?auto_28396 )
      ( MAKE-ON-VERIFY ?auto_28395 ?auto_28396 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28415 - SURFACE
      ?auto_28416 - SURFACE
    )
    :vars
    (
      ?auto_28418 - HOIST
      ?auto_28433 - PLACE
      ?auto_28434 - PLACE
      ?auto_28432 - HOIST
      ?auto_28423 - SURFACE
      ?auto_28427 - SURFACE
      ?auto_28429 - PLACE
      ?auto_28420 - HOIST
      ?auto_28426 - SURFACE
      ?auto_28424 - SURFACE
      ?auto_28417 - PLACE
      ?auto_28431 - HOIST
      ?auto_28425 - SURFACE
      ?auto_28422 - SURFACE
      ?auto_28430 - SURFACE
      ?auto_28428 - SURFACE
      ?auto_28419 - TRUCK
      ?auto_28421 - PLACE
      ?auto_28435 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28418 ?auto_28433 ) ( IS-CRATE ?auto_28415 ) ( not ( = ?auto_28415 ?auto_28416 ) ) ( not ( = ?auto_28434 ?auto_28433 ) ) ( HOIST-AT ?auto_28432 ?auto_28434 ) ( not ( = ?auto_28418 ?auto_28432 ) ) ( AVAILABLE ?auto_28432 ) ( SURFACE-AT ?auto_28415 ?auto_28434 ) ( ON ?auto_28415 ?auto_28423 ) ( CLEAR ?auto_28415 ) ( not ( = ?auto_28415 ?auto_28423 ) ) ( not ( = ?auto_28416 ?auto_28423 ) ) ( IS-CRATE ?auto_28416 ) ( not ( = ?auto_28415 ?auto_28427 ) ) ( not ( = ?auto_28416 ?auto_28427 ) ) ( not ( = ?auto_28423 ?auto_28427 ) ) ( not ( = ?auto_28429 ?auto_28433 ) ) ( not ( = ?auto_28434 ?auto_28429 ) ) ( HOIST-AT ?auto_28420 ?auto_28429 ) ( not ( = ?auto_28418 ?auto_28420 ) ) ( not ( = ?auto_28432 ?auto_28420 ) ) ( AVAILABLE ?auto_28420 ) ( SURFACE-AT ?auto_28416 ?auto_28429 ) ( ON ?auto_28416 ?auto_28426 ) ( CLEAR ?auto_28416 ) ( not ( = ?auto_28415 ?auto_28426 ) ) ( not ( = ?auto_28416 ?auto_28426 ) ) ( not ( = ?auto_28423 ?auto_28426 ) ) ( not ( = ?auto_28427 ?auto_28426 ) ) ( IS-CRATE ?auto_28427 ) ( not ( = ?auto_28415 ?auto_28424 ) ) ( not ( = ?auto_28416 ?auto_28424 ) ) ( not ( = ?auto_28423 ?auto_28424 ) ) ( not ( = ?auto_28427 ?auto_28424 ) ) ( not ( = ?auto_28426 ?auto_28424 ) ) ( not ( = ?auto_28417 ?auto_28433 ) ) ( not ( = ?auto_28434 ?auto_28417 ) ) ( not ( = ?auto_28429 ?auto_28417 ) ) ( HOIST-AT ?auto_28431 ?auto_28417 ) ( not ( = ?auto_28418 ?auto_28431 ) ) ( not ( = ?auto_28432 ?auto_28431 ) ) ( not ( = ?auto_28420 ?auto_28431 ) ) ( SURFACE-AT ?auto_28427 ?auto_28417 ) ( ON ?auto_28427 ?auto_28425 ) ( CLEAR ?auto_28427 ) ( not ( = ?auto_28415 ?auto_28425 ) ) ( not ( = ?auto_28416 ?auto_28425 ) ) ( not ( = ?auto_28423 ?auto_28425 ) ) ( not ( = ?auto_28427 ?auto_28425 ) ) ( not ( = ?auto_28426 ?auto_28425 ) ) ( not ( = ?auto_28424 ?auto_28425 ) ) ( IS-CRATE ?auto_28424 ) ( not ( = ?auto_28415 ?auto_28422 ) ) ( not ( = ?auto_28416 ?auto_28422 ) ) ( not ( = ?auto_28423 ?auto_28422 ) ) ( not ( = ?auto_28427 ?auto_28422 ) ) ( not ( = ?auto_28426 ?auto_28422 ) ) ( not ( = ?auto_28424 ?auto_28422 ) ) ( not ( = ?auto_28425 ?auto_28422 ) ) ( AVAILABLE ?auto_28431 ) ( SURFACE-AT ?auto_28424 ?auto_28417 ) ( ON ?auto_28424 ?auto_28430 ) ( CLEAR ?auto_28424 ) ( not ( = ?auto_28415 ?auto_28430 ) ) ( not ( = ?auto_28416 ?auto_28430 ) ) ( not ( = ?auto_28423 ?auto_28430 ) ) ( not ( = ?auto_28427 ?auto_28430 ) ) ( not ( = ?auto_28426 ?auto_28430 ) ) ( not ( = ?auto_28424 ?auto_28430 ) ) ( not ( = ?auto_28425 ?auto_28430 ) ) ( not ( = ?auto_28422 ?auto_28430 ) ) ( SURFACE-AT ?auto_28428 ?auto_28433 ) ( CLEAR ?auto_28428 ) ( IS-CRATE ?auto_28422 ) ( not ( = ?auto_28415 ?auto_28428 ) ) ( not ( = ?auto_28416 ?auto_28428 ) ) ( not ( = ?auto_28423 ?auto_28428 ) ) ( not ( = ?auto_28427 ?auto_28428 ) ) ( not ( = ?auto_28426 ?auto_28428 ) ) ( not ( = ?auto_28424 ?auto_28428 ) ) ( not ( = ?auto_28425 ?auto_28428 ) ) ( not ( = ?auto_28422 ?auto_28428 ) ) ( not ( = ?auto_28430 ?auto_28428 ) ) ( AVAILABLE ?auto_28418 ) ( TRUCK-AT ?auto_28419 ?auto_28421 ) ( not ( = ?auto_28421 ?auto_28433 ) ) ( not ( = ?auto_28434 ?auto_28421 ) ) ( not ( = ?auto_28429 ?auto_28421 ) ) ( not ( = ?auto_28417 ?auto_28421 ) ) ( HOIST-AT ?auto_28435 ?auto_28421 ) ( LIFTING ?auto_28435 ?auto_28422 ) ( not ( = ?auto_28418 ?auto_28435 ) ) ( not ( = ?auto_28432 ?auto_28435 ) ) ( not ( = ?auto_28420 ?auto_28435 ) ) ( not ( = ?auto_28431 ?auto_28435 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28435 ?auto_28422 ?auto_28419 ?auto_28421 )
      ( MAKE-ON ?auto_28415 ?auto_28416 )
      ( MAKE-ON-VERIFY ?auto_28415 ?auto_28416 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28436 - SURFACE
      ?auto_28437 - SURFACE
    )
    :vars
    (
      ?auto_28448 - HOIST
      ?auto_28454 - PLACE
      ?auto_28441 - PLACE
      ?auto_28456 - HOIST
      ?auto_28438 - SURFACE
      ?auto_28440 - SURFACE
      ?auto_28446 - PLACE
      ?auto_28443 - HOIST
      ?auto_28445 - SURFACE
      ?auto_28452 - SURFACE
      ?auto_28450 - PLACE
      ?auto_28451 - HOIST
      ?auto_28439 - SURFACE
      ?auto_28447 - SURFACE
      ?auto_28444 - SURFACE
      ?auto_28449 - SURFACE
      ?auto_28453 - TRUCK
      ?auto_28455 - PLACE
      ?auto_28442 - HOIST
      ?auto_28457 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28448 ?auto_28454 ) ( IS-CRATE ?auto_28436 ) ( not ( = ?auto_28436 ?auto_28437 ) ) ( not ( = ?auto_28441 ?auto_28454 ) ) ( HOIST-AT ?auto_28456 ?auto_28441 ) ( not ( = ?auto_28448 ?auto_28456 ) ) ( AVAILABLE ?auto_28456 ) ( SURFACE-AT ?auto_28436 ?auto_28441 ) ( ON ?auto_28436 ?auto_28438 ) ( CLEAR ?auto_28436 ) ( not ( = ?auto_28436 ?auto_28438 ) ) ( not ( = ?auto_28437 ?auto_28438 ) ) ( IS-CRATE ?auto_28437 ) ( not ( = ?auto_28436 ?auto_28440 ) ) ( not ( = ?auto_28437 ?auto_28440 ) ) ( not ( = ?auto_28438 ?auto_28440 ) ) ( not ( = ?auto_28446 ?auto_28454 ) ) ( not ( = ?auto_28441 ?auto_28446 ) ) ( HOIST-AT ?auto_28443 ?auto_28446 ) ( not ( = ?auto_28448 ?auto_28443 ) ) ( not ( = ?auto_28456 ?auto_28443 ) ) ( AVAILABLE ?auto_28443 ) ( SURFACE-AT ?auto_28437 ?auto_28446 ) ( ON ?auto_28437 ?auto_28445 ) ( CLEAR ?auto_28437 ) ( not ( = ?auto_28436 ?auto_28445 ) ) ( not ( = ?auto_28437 ?auto_28445 ) ) ( not ( = ?auto_28438 ?auto_28445 ) ) ( not ( = ?auto_28440 ?auto_28445 ) ) ( IS-CRATE ?auto_28440 ) ( not ( = ?auto_28436 ?auto_28452 ) ) ( not ( = ?auto_28437 ?auto_28452 ) ) ( not ( = ?auto_28438 ?auto_28452 ) ) ( not ( = ?auto_28440 ?auto_28452 ) ) ( not ( = ?auto_28445 ?auto_28452 ) ) ( not ( = ?auto_28450 ?auto_28454 ) ) ( not ( = ?auto_28441 ?auto_28450 ) ) ( not ( = ?auto_28446 ?auto_28450 ) ) ( HOIST-AT ?auto_28451 ?auto_28450 ) ( not ( = ?auto_28448 ?auto_28451 ) ) ( not ( = ?auto_28456 ?auto_28451 ) ) ( not ( = ?auto_28443 ?auto_28451 ) ) ( SURFACE-AT ?auto_28440 ?auto_28450 ) ( ON ?auto_28440 ?auto_28439 ) ( CLEAR ?auto_28440 ) ( not ( = ?auto_28436 ?auto_28439 ) ) ( not ( = ?auto_28437 ?auto_28439 ) ) ( not ( = ?auto_28438 ?auto_28439 ) ) ( not ( = ?auto_28440 ?auto_28439 ) ) ( not ( = ?auto_28445 ?auto_28439 ) ) ( not ( = ?auto_28452 ?auto_28439 ) ) ( IS-CRATE ?auto_28452 ) ( not ( = ?auto_28436 ?auto_28447 ) ) ( not ( = ?auto_28437 ?auto_28447 ) ) ( not ( = ?auto_28438 ?auto_28447 ) ) ( not ( = ?auto_28440 ?auto_28447 ) ) ( not ( = ?auto_28445 ?auto_28447 ) ) ( not ( = ?auto_28452 ?auto_28447 ) ) ( not ( = ?auto_28439 ?auto_28447 ) ) ( AVAILABLE ?auto_28451 ) ( SURFACE-AT ?auto_28452 ?auto_28450 ) ( ON ?auto_28452 ?auto_28444 ) ( CLEAR ?auto_28452 ) ( not ( = ?auto_28436 ?auto_28444 ) ) ( not ( = ?auto_28437 ?auto_28444 ) ) ( not ( = ?auto_28438 ?auto_28444 ) ) ( not ( = ?auto_28440 ?auto_28444 ) ) ( not ( = ?auto_28445 ?auto_28444 ) ) ( not ( = ?auto_28452 ?auto_28444 ) ) ( not ( = ?auto_28439 ?auto_28444 ) ) ( not ( = ?auto_28447 ?auto_28444 ) ) ( SURFACE-AT ?auto_28449 ?auto_28454 ) ( CLEAR ?auto_28449 ) ( IS-CRATE ?auto_28447 ) ( not ( = ?auto_28436 ?auto_28449 ) ) ( not ( = ?auto_28437 ?auto_28449 ) ) ( not ( = ?auto_28438 ?auto_28449 ) ) ( not ( = ?auto_28440 ?auto_28449 ) ) ( not ( = ?auto_28445 ?auto_28449 ) ) ( not ( = ?auto_28452 ?auto_28449 ) ) ( not ( = ?auto_28439 ?auto_28449 ) ) ( not ( = ?auto_28447 ?auto_28449 ) ) ( not ( = ?auto_28444 ?auto_28449 ) ) ( AVAILABLE ?auto_28448 ) ( TRUCK-AT ?auto_28453 ?auto_28455 ) ( not ( = ?auto_28455 ?auto_28454 ) ) ( not ( = ?auto_28441 ?auto_28455 ) ) ( not ( = ?auto_28446 ?auto_28455 ) ) ( not ( = ?auto_28450 ?auto_28455 ) ) ( HOIST-AT ?auto_28442 ?auto_28455 ) ( not ( = ?auto_28448 ?auto_28442 ) ) ( not ( = ?auto_28456 ?auto_28442 ) ) ( not ( = ?auto_28443 ?auto_28442 ) ) ( not ( = ?auto_28451 ?auto_28442 ) ) ( AVAILABLE ?auto_28442 ) ( SURFACE-AT ?auto_28447 ?auto_28455 ) ( ON ?auto_28447 ?auto_28457 ) ( CLEAR ?auto_28447 ) ( not ( = ?auto_28436 ?auto_28457 ) ) ( not ( = ?auto_28437 ?auto_28457 ) ) ( not ( = ?auto_28438 ?auto_28457 ) ) ( not ( = ?auto_28440 ?auto_28457 ) ) ( not ( = ?auto_28445 ?auto_28457 ) ) ( not ( = ?auto_28452 ?auto_28457 ) ) ( not ( = ?auto_28439 ?auto_28457 ) ) ( not ( = ?auto_28447 ?auto_28457 ) ) ( not ( = ?auto_28444 ?auto_28457 ) ) ( not ( = ?auto_28449 ?auto_28457 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28442 ?auto_28447 ?auto_28457 ?auto_28455 )
      ( MAKE-ON ?auto_28436 ?auto_28437 )
      ( MAKE-ON-VERIFY ?auto_28436 ?auto_28437 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28458 - SURFACE
      ?auto_28459 - SURFACE
    )
    :vars
    (
      ?auto_28461 - HOIST
      ?auto_28477 - PLACE
      ?auto_28471 - PLACE
      ?auto_28476 - HOIST
      ?auto_28468 - SURFACE
      ?auto_28478 - SURFACE
      ?auto_28463 - PLACE
      ?auto_28462 - HOIST
      ?auto_28474 - SURFACE
      ?auto_28473 - SURFACE
      ?auto_28472 - PLACE
      ?auto_28469 - HOIST
      ?auto_28466 - SURFACE
      ?auto_28470 - SURFACE
      ?auto_28479 - SURFACE
      ?auto_28465 - SURFACE
      ?auto_28467 - PLACE
      ?auto_28464 - HOIST
      ?auto_28460 - SURFACE
      ?auto_28475 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28461 ?auto_28477 ) ( IS-CRATE ?auto_28458 ) ( not ( = ?auto_28458 ?auto_28459 ) ) ( not ( = ?auto_28471 ?auto_28477 ) ) ( HOIST-AT ?auto_28476 ?auto_28471 ) ( not ( = ?auto_28461 ?auto_28476 ) ) ( AVAILABLE ?auto_28476 ) ( SURFACE-AT ?auto_28458 ?auto_28471 ) ( ON ?auto_28458 ?auto_28468 ) ( CLEAR ?auto_28458 ) ( not ( = ?auto_28458 ?auto_28468 ) ) ( not ( = ?auto_28459 ?auto_28468 ) ) ( IS-CRATE ?auto_28459 ) ( not ( = ?auto_28458 ?auto_28478 ) ) ( not ( = ?auto_28459 ?auto_28478 ) ) ( not ( = ?auto_28468 ?auto_28478 ) ) ( not ( = ?auto_28463 ?auto_28477 ) ) ( not ( = ?auto_28471 ?auto_28463 ) ) ( HOIST-AT ?auto_28462 ?auto_28463 ) ( not ( = ?auto_28461 ?auto_28462 ) ) ( not ( = ?auto_28476 ?auto_28462 ) ) ( AVAILABLE ?auto_28462 ) ( SURFACE-AT ?auto_28459 ?auto_28463 ) ( ON ?auto_28459 ?auto_28474 ) ( CLEAR ?auto_28459 ) ( not ( = ?auto_28458 ?auto_28474 ) ) ( not ( = ?auto_28459 ?auto_28474 ) ) ( not ( = ?auto_28468 ?auto_28474 ) ) ( not ( = ?auto_28478 ?auto_28474 ) ) ( IS-CRATE ?auto_28478 ) ( not ( = ?auto_28458 ?auto_28473 ) ) ( not ( = ?auto_28459 ?auto_28473 ) ) ( not ( = ?auto_28468 ?auto_28473 ) ) ( not ( = ?auto_28478 ?auto_28473 ) ) ( not ( = ?auto_28474 ?auto_28473 ) ) ( not ( = ?auto_28472 ?auto_28477 ) ) ( not ( = ?auto_28471 ?auto_28472 ) ) ( not ( = ?auto_28463 ?auto_28472 ) ) ( HOIST-AT ?auto_28469 ?auto_28472 ) ( not ( = ?auto_28461 ?auto_28469 ) ) ( not ( = ?auto_28476 ?auto_28469 ) ) ( not ( = ?auto_28462 ?auto_28469 ) ) ( SURFACE-AT ?auto_28478 ?auto_28472 ) ( ON ?auto_28478 ?auto_28466 ) ( CLEAR ?auto_28478 ) ( not ( = ?auto_28458 ?auto_28466 ) ) ( not ( = ?auto_28459 ?auto_28466 ) ) ( not ( = ?auto_28468 ?auto_28466 ) ) ( not ( = ?auto_28478 ?auto_28466 ) ) ( not ( = ?auto_28474 ?auto_28466 ) ) ( not ( = ?auto_28473 ?auto_28466 ) ) ( IS-CRATE ?auto_28473 ) ( not ( = ?auto_28458 ?auto_28470 ) ) ( not ( = ?auto_28459 ?auto_28470 ) ) ( not ( = ?auto_28468 ?auto_28470 ) ) ( not ( = ?auto_28478 ?auto_28470 ) ) ( not ( = ?auto_28474 ?auto_28470 ) ) ( not ( = ?auto_28473 ?auto_28470 ) ) ( not ( = ?auto_28466 ?auto_28470 ) ) ( AVAILABLE ?auto_28469 ) ( SURFACE-AT ?auto_28473 ?auto_28472 ) ( ON ?auto_28473 ?auto_28479 ) ( CLEAR ?auto_28473 ) ( not ( = ?auto_28458 ?auto_28479 ) ) ( not ( = ?auto_28459 ?auto_28479 ) ) ( not ( = ?auto_28468 ?auto_28479 ) ) ( not ( = ?auto_28478 ?auto_28479 ) ) ( not ( = ?auto_28474 ?auto_28479 ) ) ( not ( = ?auto_28473 ?auto_28479 ) ) ( not ( = ?auto_28466 ?auto_28479 ) ) ( not ( = ?auto_28470 ?auto_28479 ) ) ( SURFACE-AT ?auto_28465 ?auto_28477 ) ( CLEAR ?auto_28465 ) ( IS-CRATE ?auto_28470 ) ( not ( = ?auto_28458 ?auto_28465 ) ) ( not ( = ?auto_28459 ?auto_28465 ) ) ( not ( = ?auto_28468 ?auto_28465 ) ) ( not ( = ?auto_28478 ?auto_28465 ) ) ( not ( = ?auto_28474 ?auto_28465 ) ) ( not ( = ?auto_28473 ?auto_28465 ) ) ( not ( = ?auto_28466 ?auto_28465 ) ) ( not ( = ?auto_28470 ?auto_28465 ) ) ( not ( = ?auto_28479 ?auto_28465 ) ) ( AVAILABLE ?auto_28461 ) ( not ( = ?auto_28467 ?auto_28477 ) ) ( not ( = ?auto_28471 ?auto_28467 ) ) ( not ( = ?auto_28463 ?auto_28467 ) ) ( not ( = ?auto_28472 ?auto_28467 ) ) ( HOIST-AT ?auto_28464 ?auto_28467 ) ( not ( = ?auto_28461 ?auto_28464 ) ) ( not ( = ?auto_28476 ?auto_28464 ) ) ( not ( = ?auto_28462 ?auto_28464 ) ) ( not ( = ?auto_28469 ?auto_28464 ) ) ( AVAILABLE ?auto_28464 ) ( SURFACE-AT ?auto_28470 ?auto_28467 ) ( ON ?auto_28470 ?auto_28460 ) ( CLEAR ?auto_28470 ) ( not ( = ?auto_28458 ?auto_28460 ) ) ( not ( = ?auto_28459 ?auto_28460 ) ) ( not ( = ?auto_28468 ?auto_28460 ) ) ( not ( = ?auto_28478 ?auto_28460 ) ) ( not ( = ?auto_28474 ?auto_28460 ) ) ( not ( = ?auto_28473 ?auto_28460 ) ) ( not ( = ?auto_28466 ?auto_28460 ) ) ( not ( = ?auto_28470 ?auto_28460 ) ) ( not ( = ?auto_28479 ?auto_28460 ) ) ( not ( = ?auto_28465 ?auto_28460 ) ) ( TRUCK-AT ?auto_28475 ?auto_28477 ) )
    :subtasks
    ( ( !DRIVE ?auto_28475 ?auto_28477 ?auto_28467 )
      ( MAKE-ON ?auto_28458 ?auto_28459 )
      ( MAKE-ON-VERIFY ?auto_28458 ?auto_28459 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28482 - SURFACE
      ?auto_28483 - SURFACE
    )
    :vars
    (
      ?auto_28484 - HOIST
      ?auto_28485 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28484 ?auto_28485 ) ( SURFACE-AT ?auto_28483 ?auto_28485 ) ( CLEAR ?auto_28483 ) ( LIFTING ?auto_28484 ?auto_28482 ) ( IS-CRATE ?auto_28482 ) ( not ( = ?auto_28482 ?auto_28483 ) ) )
    :subtasks
    ( ( !DROP ?auto_28484 ?auto_28482 ?auto_28483 ?auto_28485 )
      ( MAKE-ON-VERIFY ?auto_28482 ?auto_28483 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28486 - SURFACE
      ?auto_28487 - SURFACE
    )
    :vars
    (
      ?auto_28489 - HOIST
      ?auto_28488 - PLACE
      ?auto_28490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28489 ?auto_28488 ) ( SURFACE-AT ?auto_28487 ?auto_28488 ) ( CLEAR ?auto_28487 ) ( IS-CRATE ?auto_28486 ) ( not ( = ?auto_28486 ?auto_28487 ) ) ( TRUCK-AT ?auto_28490 ?auto_28488 ) ( AVAILABLE ?auto_28489 ) ( IN ?auto_28486 ?auto_28490 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28489 ?auto_28486 ?auto_28490 ?auto_28488 )
      ( MAKE-ON ?auto_28486 ?auto_28487 )
      ( MAKE-ON-VERIFY ?auto_28486 ?auto_28487 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28491 - SURFACE
      ?auto_28492 - SURFACE
    )
    :vars
    (
      ?auto_28494 - HOIST
      ?auto_28495 - PLACE
      ?auto_28493 - TRUCK
      ?auto_28496 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28494 ?auto_28495 ) ( SURFACE-AT ?auto_28492 ?auto_28495 ) ( CLEAR ?auto_28492 ) ( IS-CRATE ?auto_28491 ) ( not ( = ?auto_28491 ?auto_28492 ) ) ( AVAILABLE ?auto_28494 ) ( IN ?auto_28491 ?auto_28493 ) ( TRUCK-AT ?auto_28493 ?auto_28496 ) ( not ( = ?auto_28496 ?auto_28495 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28493 ?auto_28496 ?auto_28495 )
      ( MAKE-ON ?auto_28491 ?auto_28492 )
      ( MAKE-ON-VERIFY ?auto_28491 ?auto_28492 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28497 - SURFACE
      ?auto_28498 - SURFACE
    )
    :vars
    (
      ?auto_28502 - HOIST
      ?auto_28501 - PLACE
      ?auto_28499 - TRUCK
      ?auto_28500 - PLACE
      ?auto_28503 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28502 ?auto_28501 ) ( SURFACE-AT ?auto_28498 ?auto_28501 ) ( CLEAR ?auto_28498 ) ( IS-CRATE ?auto_28497 ) ( not ( = ?auto_28497 ?auto_28498 ) ) ( AVAILABLE ?auto_28502 ) ( TRUCK-AT ?auto_28499 ?auto_28500 ) ( not ( = ?auto_28500 ?auto_28501 ) ) ( HOIST-AT ?auto_28503 ?auto_28500 ) ( LIFTING ?auto_28503 ?auto_28497 ) ( not ( = ?auto_28502 ?auto_28503 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28503 ?auto_28497 ?auto_28499 ?auto_28500 )
      ( MAKE-ON ?auto_28497 ?auto_28498 )
      ( MAKE-ON-VERIFY ?auto_28497 ?auto_28498 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28504 - SURFACE
      ?auto_28505 - SURFACE
    )
    :vars
    (
      ?auto_28506 - HOIST
      ?auto_28508 - PLACE
      ?auto_28507 - TRUCK
      ?auto_28510 - PLACE
      ?auto_28509 - HOIST
      ?auto_28511 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28506 ?auto_28508 ) ( SURFACE-AT ?auto_28505 ?auto_28508 ) ( CLEAR ?auto_28505 ) ( IS-CRATE ?auto_28504 ) ( not ( = ?auto_28504 ?auto_28505 ) ) ( AVAILABLE ?auto_28506 ) ( TRUCK-AT ?auto_28507 ?auto_28510 ) ( not ( = ?auto_28510 ?auto_28508 ) ) ( HOIST-AT ?auto_28509 ?auto_28510 ) ( not ( = ?auto_28506 ?auto_28509 ) ) ( AVAILABLE ?auto_28509 ) ( SURFACE-AT ?auto_28504 ?auto_28510 ) ( ON ?auto_28504 ?auto_28511 ) ( CLEAR ?auto_28504 ) ( not ( = ?auto_28504 ?auto_28511 ) ) ( not ( = ?auto_28505 ?auto_28511 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28509 ?auto_28504 ?auto_28511 ?auto_28510 )
      ( MAKE-ON ?auto_28504 ?auto_28505 )
      ( MAKE-ON-VERIFY ?auto_28504 ?auto_28505 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28512 - SURFACE
      ?auto_28513 - SURFACE
    )
    :vars
    (
      ?auto_28518 - HOIST
      ?auto_28519 - PLACE
      ?auto_28517 - PLACE
      ?auto_28515 - HOIST
      ?auto_28514 - SURFACE
      ?auto_28516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28518 ?auto_28519 ) ( SURFACE-AT ?auto_28513 ?auto_28519 ) ( CLEAR ?auto_28513 ) ( IS-CRATE ?auto_28512 ) ( not ( = ?auto_28512 ?auto_28513 ) ) ( AVAILABLE ?auto_28518 ) ( not ( = ?auto_28517 ?auto_28519 ) ) ( HOIST-AT ?auto_28515 ?auto_28517 ) ( not ( = ?auto_28518 ?auto_28515 ) ) ( AVAILABLE ?auto_28515 ) ( SURFACE-AT ?auto_28512 ?auto_28517 ) ( ON ?auto_28512 ?auto_28514 ) ( CLEAR ?auto_28512 ) ( not ( = ?auto_28512 ?auto_28514 ) ) ( not ( = ?auto_28513 ?auto_28514 ) ) ( TRUCK-AT ?auto_28516 ?auto_28519 ) )
    :subtasks
    ( ( !DRIVE ?auto_28516 ?auto_28519 ?auto_28517 )
      ( MAKE-ON ?auto_28512 ?auto_28513 )
      ( MAKE-ON-VERIFY ?auto_28512 ?auto_28513 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28520 - SURFACE
      ?auto_28521 - SURFACE
    )
    :vars
    (
      ?auto_28525 - HOIST
      ?auto_28522 - PLACE
      ?auto_28527 - PLACE
      ?auto_28523 - HOIST
      ?auto_28526 - SURFACE
      ?auto_28524 - TRUCK
      ?auto_28528 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28525 ?auto_28522 ) ( IS-CRATE ?auto_28520 ) ( not ( = ?auto_28520 ?auto_28521 ) ) ( not ( = ?auto_28527 ?auto_28522 ) ) ( HOIST-AT ?auto_28523 ?auto_28527 ) ( not ( = ?auto_28525 ?auto_28523 ) ) ( AVAILABLE ?auto_28523 ) ( SURFACE-AT ?auto_28520 ?auto_28527 ) ( ON ?auto_28520 ?auto_28526 ) ( CLEAR ?auto_28520 ) ( not ( = ?auto_28520 ?auto_28526 ) ) ( not ( = ?auto_28521 ?auto_28526 ) ) ( TRUCK-AT ?auto_28524 ?auto_28522 ) ( SURFACE-AT ?auto_28528 ?auto_28522 ) ( CLEAR ?auto_28528 ) ( LIFTING ?auto_28525 ?auto_28521 ) ( IS-CRATE ?auto_28521 ) ( not ( = ?auto_28520 ?auto_28528 ) ) ( not ( = ?auto_28521 ?auto_28528 ) ) ( not ( = ?auto_28526 ?auto_28528 ) ) )
    :subtasks
    ( ( !DROP ?auto_28525 ?auto_28521 ?auto_28528 ?auto_28522 )
      ( MAKE-ON ?auto_28520 ?auto_28521 )
      ( MAKE-ON-VERIFY ?auto_28520 ?auto_28521 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28529 - SURFACE
      ?auto_28530 - SURFACE
    )
    :vars
    (
      ?auto_28534 - HOIST
      ?auto_28535 - PLACE
      ?auto_28537 - PLACE
      ?auto_28536 - HOIST
      ?auto_28531 - SURFACE
      ?auto_28532 - TRUCK
      ?auto_28533 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28534 ?auto_28535 ) ( IS-CRATE ?auto_28529 ) ( not ( = ?auto_28529 ?auto_28530 ) ) ( not ( = ?auto_28537 ?auto_28535 ) ) ( HOIST-AT ?auto_28536 ?auto_28537 ) ( not ( = ?auto_28534 ?auto_28536 ) ) ( AVAILABLE ?auto_28536 ) ( SURFACE-AT ?auto_28529 ?auto_28537 ) ( ON ?auto_28529 ?auto_28531 ) ( CLEAR ?auto_28529 ) ( not ( = ?auto_28529 ?auto_28531 ) ) ( not ( = ?auto_28530 ?auto_28531 ) ) ( TRUCK-AT ?auto_28532 ?auto_28535 ) ( SURFACE-AT ?auto_28533 ?auto_28535 ) ( CLEAR ?auto_28533 ) ( IS-CRATE ?auto_28530 ) ( not ( = ?auto_28529 ?auto_28533 ) ) ( not ( = ?auto_28530 ?auto_28533 ) ) ( not ( = ?auto_28531 ?auto_28533 ) ) ( AVAILABLE ?auto_28534 ) ( IN ?auto_28530 ?auto_28532 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28534 ?auto_28530 ?auto_28532 ?auto_28535 )
      ( MAKE-ON ?auto_28529 ?auto_28530 )
      ( MAKE-ON-VERIFY ?auto_28529 ?auto_28530 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28538 - SURFACE
      ?auto_28539 - SURFACE
    )
    :vars
    (
      ?auto_28545 - HOIST
      ?auto_28544 - PLACE
      ?auto_28546 - PLACE
      ?auto_28541 - HOIST
      ?auto_28543 - SURFACE
      ?auto_28540 - SURFACE
      ?auto_28542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28545 ?auto_28544 ) ( IS-CRATE ?auto_28538 ) ( not ( = ?auto_28538 ?auto_28539 ) ) ( not ( = ?auto_28546 ?auto_28544 ) ) ( HOIST-AT ?auto_28541 ?auto_28546 ) ( not ( = ?auto_28545 ?auto_28541 ) ) ( AVAILABLE ?auto_28541 ) ( SURFACE-AT ?auto_28538 ?auto_28546 ) ( ON ?auto_28538 ?auto_28543 ) ( CLEAR ?auto_28538 ) ( not ( = ?auto_28538 ?auto_28543 ) ) ( not ( = ?auto_28539 ?auto_28543 ) ) ( SURFACE-AT ?auto_28540 ?auto_28544 ) ( CLEAR ?auto_28540 ) ( IS-CRATE ?auto_28539 ) ( not ( = ?auto_28538 ?auto_28540 ) ) ( not ( = ?auto_28539 ?auto_28540 ) ) ( not ( = ?auto_28543 ?auto_28540 ) ) ( AVAILABLE ?auto_28545 ) ( IN ?auto_28539 ?auto_28542 ) ( TRUCK-AT ?auto_28542 ?auto_28546 ) )
    :subtasks
    ( ( !DRIVE ?auto_28542 ?auto_28546 ?auto_28544 )
      ( MAKE-ON ?auto_28538 ?auto_28539 )
      ( MAKE-ON-VERIFY ?auto_28538 ?auto_28539 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28547 - SURFACE
      ?auto_28548 - SURFACE
    )
    :vars
    (
      ?auto_28555 - HOIST
      ?auto_28554 - PLACE
      ?auto_28550 - PLACE
      ?auto_28551 - HOIST
      ?auto_28553 - SURFACE
      ?auto_28549 - SURFACE
      ?auto_28552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28555 ?auto_28554 ) ( IS-CRATE ?auto_28547 ) ( not ( = ?auto_28547 ?auto_28548 ) ) ( not ( = ?auto_28550 ?auto_28554 ) ) ( HOIST-AT ?auto_28551 ?auto_28550 ) ( not ( = ?auto_28555 ?auto_28551 ) ) ( SURFACE-AT ?auto_28547 ?auto_28550 ) ( ON ?auto_28547 ?auto_28553 ) ( CLEAR ?auto_28547 ) ( not ( = ?auto_28547 ?auto_28553 ) ) ( not ( = ?auto_28548 ?auto_28553 ) ) ( SURFACE-AT ?auto_28549 ?auto_28554 ) ( CLEAR ?auto_28549 ) ( IS-CRATE ?auto_28548 ) ( not ( = ?auto_28547 ?auto_28549 ) ) ( not ( = ?auto_28548 ?auto_28549 ) ) ( not ( = ?auto_28553 ?auto_28549 ) ) ( AVAILABLE ?auto_28555 ) ( TRUCK-AT ?auto_28552 ?auto_28550 ) ( LIFTING ?auto_28551 ?auto_28548 ) )
    :subtasks
    ( ( !LOAD ?auto_28551 ?auto_28548 ?auto_28552 ?auto_28550 )
      ( MAKE-ON ?auto_28547 ?auto_28548 )
      ( MAKE-ON-VERIFY ?auto_28547 ?auto_28548 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28556 - SURFACE
      ?auto_28557 - SURFACE
    )
    :vars
    (
      ?auto_28562 - HOIST
      ?auto_28559 - PLACE
      ?auto_28560 - PLACE
      ?auto_28561 - HOIST
      ?auto_28563 - SURFACE
      ?auto_28558 - SURFACE
      ?auto_28564 - TRUCK
      ?auto_28565 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28562 ?auto_28559 ) ( IS-CRATE ?auto_28556 ) ( not ( = ?auto_28556 ?auto_28557 ) ) ( not ( = ?auto_28560 ?auto_28559 ) ) ( HOIST-AT ?auto_28561 ?auto_28560 ) ( not ( = ?auto_28562 ?auto_28561 ) ) ( SURFACE-AT ?auto_28556 ?auto_28560 ) ( ON ?auto_28556 ?auto_28563 ) ( CLEAR ?auto_28556 ) ( not ( = ?auto_28556 ?auto_28563 ) ) ( not ( = ?auto_28557 ?auto_28563 ) ) ( SURFACE-AT ?auto_28558 ?auto_28559 ) ( CLEAR ?auto_28558 ) ( IS-CRATE ?auto_28557 ) ( not ( = ?auto_28556 ?auto_28558 ) ) ( not ( = ?auto_28557 ?auto_28558 ) ) ( not ( = ?auto_28563 ?auto_28558 ) ) ( AVAILABLE ?auto_28562 ) ( TRUCK-AT ?auto_28564 ?auto_28560 ) ( AVAILABLE ?auto_28561 ) ( SURFACE-AT ?auto_28557 ?auto_28560 ) ( ON ?auto_28557 ?auto_28565 ) ( CLEAR ?auto_28557 ) ( not ( = ?auto_28556 ?auto_28565 ) ) ( not ( = ?auto_28557 ?auto_28565 ) ) ( not ( = ?auto_28563 ?auto_28565 ) ) ( not ( = ?auto_28558 ?auto_28565 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28561 ?auto_28557 ?auto_28565 ?auto_28560 )
      ( MAKE-ON ?auto_28556 ?auto_28557 )
      ( MAKE-ON-VERIFY ?auto_28556 ?auto_28557 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28566 - SURFACE
      ?auto_28567 - SURFACE
    )
    :vars
    (
      ?auto_28573 - HOIST
      ?auto_28572 - PLACE
      ?auto_28575 - PLACE
      ?auto_28569 - HOIST
      ?auto_28568 - SURFACE
      ?auto_28571 - SURFACE
      ?auto_28570 - SURFACE
      ?auto_28574 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28573 ?auto_28572 ) ( IS-CRATE ?auto_28566 ) ( not ( = ?auto_28566 ?auto_28567 ) ) ( not ( = ?auto_28575 ?auto_28572 ) ) ( HOIST-AT ?auto_28569 ?auto_28575 ) ( not ( = ?auto_28573 ?auto_28569 ) ) ( SURFACE-AT ?auto_28566 ?auto_28575 ) ( ON ?auto_28566 ?auto_28568 ) ( CLEAR ?auto_28566 ) ( not ( = ?auto_28566 ?auto_28568 ) ) ( not ( = ?auto_28567 ?auto_28568 ) ) ( SURFACE-AT ?auto_28571 ?auto_28572 ) ( CLEAR ?auto_28571 ) ( IS-CRATE ?auto_28567 ) ( not ( = ?auto_28566 ?auto_28571 ) ) ( not ( = ?auto_28567 ?auto_28571 ) ) ( not ( = ?auto_28568 ?auto_28571 ) ) ( AVAILABLE ?auto_28573 ) ( AVAILABLE ?auto_28569 ) ( SURFACE-AT ?auto_28567 ?auto_28575 ) ( ON ?auto_28567 ?auto_28570 ) ( CLEAR ?auto_28567 ) ( not ( = ?auto_28566 ?auto_28570 ) ) ( not ( = ?auto_28567 ?auto_28570 ) ) ( not ( = ?auto_28568 ?auto_28570 ) ) ( not ( = ?auto_28571 ?auto_28570 ) ) ( TRUCK-AT ?auto_28574 ?auto_28572 ) )
    :subtasks
    ( ( !DRIVE ?auto_28574 ?auto_28572 ?auto_28575 )
      ( MAKE-ON ?auto_28566 ?auto_28567 )
      ( MAKE-ON-VERIFY ?auto_28566 ?auto_28567 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28576 - SURFACE
      ?auto_28577 - SURFACE
    )
    :vars
    (
      ?auto_28581 - HOIST
      ?auto_28579 - PLACE
      ?auto_28578 - PLACE
      ?auto_28582 - HOIST
      ?auto_28583 - SURFACE
      ?auto_28585 - SURFACE
      ?auto_28580 - SURFACE
      ?auto_28584 - TRUCK
      ?auto_28586 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28581 ?auto_28579 ) ( IS-CRATE ?auto_28576 ) ( not ( = ?auto_28576 ?auto_28577 ) ) ( not ( = ?auto_28578 ?auto_28579 ) ) ( HOIST-AT ?auto_28582 ?auto_28578 ) ( not ( = ?auto_28581 ?auto_28582 ) ) ( SURFACE-AT ?auto_28576 ?auto_28578 ) ( ON ?auto_28576 ?auto_28583 ) ( CLEAR ?auto_28576 ) ( not ( = ?auto_28576 ?auto_28583 ) ) ( not ( = ?auto_28577 ?auto_28583 ) ) ( IS-CRATE ?auto_28577 ) ( not ( = ?auto_28576 ?auto_28585 ) ) ( not ( = ?auto_28577 ?auto_28585 ) ) ( not ( = ?auto_28583 ?auto_28585 ) ) ( AVAILABLE ?auto_28582 ) ( SURFACE-AT ?auto_28577 ?auto_28578 ) ( ON ?auto_28577 ?auto_28580 ) ( CLEAR ?auto_28577 ) ( not ( = ?auto_28576 ?auto_28580 ) ) ( not ( = ?auto_28577 ?auto_28580 ) ) ( not ( = ?auto_28583 ?auto_28580 ) ) ( not ( = ?auto_28585 ?auto_28580 ) ) ( TRUCK-AT ?auto_28584 ?auto_28579 ) ( SURFACE-AT ?auto_28586 ?auto_28579 ) ( CLEAR ?auto_28586 ) ( LIFTING ?auto_28581 ?auto_28585 ) ( IS-CRATE ?auto_28585 ) ( not ( = ?auto_28576 ?auto_28586 ) ) ( not ( = ?auto_28577 ?auto_28586 ) ) ( not ( = ?auto_28583 ?auto_28586 ) ) ( not ( = ?auto_28585 ?auto_28586 ) ) ( not ( = ?auto_28580 ?auto_28586 ) ) )
    :subtasks
    ( ( !DROP ?auto_28581 ?auto_28585 ?auto_28586 ?auto_28579 )
      ( MAKE-ON ?auto_28576 ?auto_28577 )
      ( MAKE-ON-VERIFY ?auto_28576 ?auto_28577 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28587 - SURFACE
      ?auto_28588 - SURFACE
    )
    :vars
    (
      ?auto_28593 - HOIST
      ?auto_28596 - PLACE
      ?auto_28595 - PLACE
      ?auto_28590 - HOIST
      ?auto_28589 - SURFACE
      ?auto_28594 - SURFACE
      ?auto_28597 - SURFACE
      ?auto_28592 - TRUCK
      ?auto_28591 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28593 ?auto_28596 ) ( IS-CRATE ?auto_28587 ) ( not ( = ?auto_28587 ?auto_28588 ) ) ( not ( = ?auto_28595 ?auto_28596 ) ) ( HOIST-AT ?auto_28590 ?auto_28595 ) ( not ( = ?auto_28593 ?auto_28590 ) ) ( SURFACE-AT ?auto_28587 ?auto_28595 ) ( ON ?auto_28587 ?auto_28589 ) ( CLEAR ?auto_28587 ) ( not ( = ?auto_28587 ?auto_28589 ) ) ( not ( = ?auto_28588 ?auto_28589 ) ) ( IS-CRATE ?auto_28588 ) ( not ( = ?auto_28587 ?auto_28594 ) ) ( not ( = ?auto_28588 ?auto_28594 ) ) ( not ( = ?auto_28589 ?auto_28594 ) ) ( AVAILABLE ?auto_28590 ) ( SURFACE-AT ?auto_28588 ?auto_28595 ) ( ON ?auto_28588 ?auto_28597 ) ( CLEAR ?auto_28588 ) ( not ( = ?auto_28587 ?auto_28597 ) ) ( not ( = ?auto_28588 ?auto_28597 ) ) ( not ( = ?auto_28589 ?auto_28597 ) ) ( not ( = ?auto_28594 ?auto_28597 ) ) ( TRUCK-AT ?auto_28592 ?auto_28596 ) ( SURFACE-AT ?auto_28591 ?auto_28596 ) ( CLEAR ?auto_28591 ) ( IS-CRATE ?auto_28594 ) ( not ( = ?auto_28587 ?auto_28591 ) ) ( not ( = ?auto_28588 ?auto_28591 ) ) ( not ( = ?auto_28589 ?auto_28591 ) ) ( not ( = ?auto_28594 ?auto_28591 ) ) ( not ( = ?auto_28597 ?auto_28591 ) ) ( AVAILABLE ?auto_28593 ) ( IN ?auto_28594 ?auto_28592 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28593 ?auto_28594 ?auto_28592 ?auto_28596 )
      ( MAKE-ON ?auto_28587 ?auto_28588 )
      ( MAKE-ON-VERIFY ?auto_28587 ?auto_28588 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28598 - SURFACE
      ?auto_28599 - SURFACE
    )
    :vars
    (
      ?auto_28600 - HOIST
      ?auto_28601 - PLACE
      ?auto_28605 - PLACE
      ?auto_28602 - HOIST
      ?auto_28604 - SURFACE
      ?auto_28606 - SURFACE
      ?auto_28608 - SURFACE
      ?auto_28603 - SURFACE
      ?auto_28607 - TRUCK
      ?auto_28609 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28600 ?auto_28601 ) ( IS-CRATE ?auto_28598 ) ( not ( = ?auto_28598 ?auto_28599 ) ) ( not ( = ?auto_28605 ?auto_28601 ) ) ( HOIST-AT ?auto_28602 ?auto_28605 ) ( not ( = ?auto_28600 ?auto_28602 ) ) ( SURFACE-AT ?auto_28598 ?auto_28605 ) ( ON ?auto_28598 ?auto_28604 ) ( CLEAR ?auto_28598 ) ( not ( = ?auto_28598 ?auto_28604 ) ) ( not ( = ?auto_28599 ?auto_28604 ) ) ( IS-CRATE ?auto_28599 ) ( not ( = ?auto_28598 ?auto_28606 ) ) ( not ( = ?auto_28599 ?auto_28606 ) ) ( not ( = ?auto_28604 ?auto_28606 ) ) ( AVAILABLE ?auto_28602 ) ( SURFACE-AT ?auto_28599 ?auto_28605 ) ( ON ?auto_28599 ?auto_28608 ) ( CLEAR ?auto_28599 ) ( not ( = ?auto_28598 ?auto_28608 ) ) ( not ( = ?auto_28599 ?auto_28608 ) ) ( not ( = ?auto_28604 ?auto_28608 ) ) ( not ( = ?auto_28606 ?auto_28608 ) ) ( SURFACE-AT ?auto_28603 ?auto_28601 ) ( CLEAR ?auto_28603 ) ( IS-CRATE ?auto_28606 ) ( not ( = ?auto_28598 ?auto_28603 ) ) ( not ( = ?auto_28599 ?auto_28603 ) ) ( not ( = ?auto_28604 ?auto_28603 ) ) ( not ( = ?auto_28606 ?auto_28603 ) ) ( not ( = ?auto_28608 ?auto_28603 ) ) ( AVAILABLE ?auto_28600 ) ( IN ?auto_28606 ?auto_28607 ) ( TRUCK-AT ?auto_28607 ?auto_28609 ) ( not ( = ?auto_28609 ?auto_28601 ) ) ( not ( = ?auto_28605 ?auto_28609 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28607 ?auto_28609 ?auto_28601 )
      ( MAKE-ON ?auto_28598 ?auto_28599 )
      ( MAKE-ON-VERIFY ?auto_28598 ?auto_28599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28610 - SURFACE
      ?auto_28611 - SURFACE
    )
    :vars
    (
      ?auto_28621 - HOIST
      ?auto_28616 - PLACE
      ?auto_28614 - PLACE
      ?auto_28620 - HOIST
      ?auto_28615 - SURFACE
      ?auto_28612 - SURFACE
      ?auto_28617 - SURFACE
      ?auto_28618 - SURFACE
      ?auto_28619 - TRUCK
      ?auto_28613 - PLACE
      ?auto_28622 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28621 ?auto_28616 ) ( IS-CRATE ?auto_28610 ) ( not ( = ?auto_28610 ?auto_28611 ) ) ( not ( = ?auto_28614 ?auto_28616 ) ) ( HOIST-AT ?auto_28620 ?auto_28614 ) ( not ( = ?auto_28621 ?auto_28620 ) ) ( SURFACE-AT ?auto_28610 ?auto_28614 ) ( ON ?auto_28610 ?auto_28615 ) ( CLEAR ?auto_28610 ) ( not ( = ?auto_28610 ?auto_28615 ) ) ( not ( = ?auto_28611 ?auto_28615 ) ) ( IS-CRATE ?auto_28611 ) ( not ( = ?auto_28610 ?auto_28612 ) ) ( not ( = ?auto_28611 ?auto_28612 ) ) ( not ( = ?auto_28615 ?auto_28612 ) ) ( AVAILABLE ?auto_28620 ) ( SURFACE-AT ?auto_28611 ?auto_28614 ) ( ON ?auto_28611 ?auto_28617 ) ( CLEAR ?auto_28611 ) ( not ( = ?auto_28610 ?auto_28617 ) ) ( not ( = ?auto_28611 ?auto_28617 ) ) ( not ( = ?auto_28615 ?auto_28617 ) ) ( not ( = ?auto_28612 ?auto_28617 ) ) ( SURFACE-AT ?auto_28618 ?auto_28616 ) ( CLEAR ?auto_28618 ) ( IS-CRATE ?auto_28612 ) ( not ( = ?auto_28610 ?auto_28618 ) ) ( not ( = ?auto_28611 ?auto_28618 ) ) ( not ( = ?auto_28615 ?auto_28618 ) ) ( not ( = ?auto_28612 ?auto_28618 ) ) ( not ( = ?auto_28617 ?auto_28618 ) ) ( AVAILABLE ?auto_28621 ) ( TRUCK-AT ?auto_28619 ?auto_28613 ) ( not ( = ?auto_28613 ?auto_28616 ) ) ( not ( = ?auto_28614 ?auto_28613 ) ) ( HOIST-AT ?auto_28622 ?auto_28613 ) ( LIFTING ?auto_28622 ?auto_28612 ) ( not ( = ?auto_28621 ?auto_28622 ) ) ( not ( = ?auto_28620 ?auto_28622 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28622 ?auto_28612 ?auto_28619 ?auto_28613 )
      ( MAKE-ON ?auto_28610 ?auto_28611 )
      ( MAKE-ON-VERIFY ?auto_28610 ?auto_28611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28623 - SURFACE
      ?auto_28624 - SURFACE
    )
    :vars
    (
      ?auto_28625 - HOIST
      ?auto_28634 - PLACE
      ?auto_28626 - PLACE
      ?auto_28628 - HOIST
      ?auto_28630 - SURFACE
      ?auto_28632 - SURFACE
      ?auto_28631 - SURFACE
      ?auto_28627 - SURFACE
      ?auto_28633 - TRUCK
      ?auto_28629 - PLACE
      ?auto_28635 - HOIST
      ?auto_28636 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28625 ?auto_28634 ) ( IS-CRATE ?auto_28623 ) ( not ( = ?auto_28623 ?auto_28624 ) ) ( not ( = ?auto_28626 ?auto_28634 ) ) ( HOIST-AT ?auto_28628 ?auto_28626 ) ( not ( = ?auto_28625 ?auto_28628 ) ) ( SURFACE-AT ?auto_28623 ?auto_28626 ) ( ON ?auto_28623 ?auto_28630 ) ( CLEAR ?auto_28623 ) ( not ( = ?auto_28623 ?auto_28630 ) ) ( not ( = ?auto_28624 ?auto_28630 ) ) ( IS-CRATE ?auto_28624 ) ( not ( = ?auto_28623 ?auto_28632 ) ) ( not ( = ?auto_28624 ?auto_28632 ) ) ( not ( = ?auto_28630 ?auto_28632 ) ) ( AVAILABLE ?auto_28628 ) ( SURFACE-AT ?auto_28624 ?auto_28626 ) ( ON ?auto_28624 ?auto_28631 ) ( CLEAR ?auto_28624 ) ( not ( = ?auto_28623 ?auto_28631 ) ) ( not ( = ?auto_28624 ?auto_28631 ) ) ( not ( = ?auto_28630 ?auto_28631 ) ) ( not ( = ?auto_28632 ?auto_28631 ) ) ( SURFACE-AT ?auto_28627 ?auto_28634 ) ( CLEAR ?auto_28627 ) ( IS-CRATE ?auto_28632 ) ( not ( = ?auto_28623 ?auto_28627 ) ) ( not ( = ?auto_28624 ?auto_28627 ) ) ( not ( = ?auto_28630 ?auto_28627 ) ) ( not ( = ?auto_28632 ?auto_28627 ) ) ( not ( = ?auto_28631 ?auto_28627 ) ) ( AVAILABLE ?auto_28625 ) ( TRUCK-AT ?auto_28633 ?auto_28629 ) ( not ( = ?auto_28629 ?auto_28634 ) ) ( not ( = ?auto_28626 ?auto_28629 ) ) ( HOIST-AT ?auto_28635 ?auto_28629 ) ( not ( = ?auto_28625 ?auto_28635 ) ) ( not ( = ?auto_28628 ?auto_28635 ) ) ( AVAILABLE ?auto_28635 ) ( SURFACE-AT ?auto_28632 ?auto_28629 ) ( ON ?auto_28632 ?auto_28636 ) ( CLEAR ?auto_28632 ) ( not ( = ?auto_28623 ?auto_28636 ) ) ( not ( = ?auto_28624 ?auto_28636 ) ) ( not ( = ?auto_28630 ?auto_28636 ) ) ( not ( = ?auto_28632 ?auto_28636 ) ) ( not ( = ?auto_28631 ?auto_28636 ) ) ( not ( = ?auto_28627 ?auto_28636 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28635 ?auto_28632 ?auto_28636 ?auto_28629 )
      ( MAKE-ON ?auto_28623 ?auto_28624 )
      ( MAKE-ON-VERIFY ?auto_28623 ?auto_28624 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28637 - SURFACE
      ?auto_28638 - SURFACE
    )
    :vars
    (
      ?auto_28646 - HOIST
      ?auto_28640 - PLACE
      ?auto_28650 - PLACE
      ?auto_28639 - HOIST
      ?auto_28642 - SURFACE
      ?auto_28649 - SURFACE
      ?auto_28648 - SURFACE
      ?auto_28641 - SURFACE
      ?auto_28647 - PLACE
      ?auto_28645 - HOIST
      ?auto_28643 - SURFACE
      ?auto_28644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28646 ?auto_28640 ) ( IS-CRATE ?auto_28637 ) ( not ( = ?auto_28637 ?auto_28638 ) ) ( not ( = ?auto_28650 ?auto_28640 ) ) ( HOIST-AT ?auto_28639 ?auto_28650 ) ( not ( = ?auto_28646 ?auto_28639 ) ) ( SURFACE-AT ?auto_28637 ?auto_28650 ) ( ON ?auto_28637 ?auto_28642 ) ( CLEAR ?auto_28637 ) ( not ( = ?auto_28637 ?auto_28642 ) ) ( not ( = ?auto_28638 ?auto_28642 ) ) ( IS-CRATE ?auto_28638 ) ( not ( = ?auto_28637 ?auto_28649 ) ) ( not ( = ?auto_28638 ?auto_28649 ) ) ( not ( = ?auto_28642 ?auto_28649 ) ) ( AVAILABLE ?auto_28639 ) ( SURFACE-AT ?auto_28638 ?auto_28650 ) ( ON ?auto_28638 ?auto_28648 ) ( CLEAR ?auto_28638 ) ( not ( = ?auto_28637 ?auto_28648 ) ) ( not ( = ?auto_28638 ?auto_28648 ) ) ( not ( = ?auto_28642 ?auto_28648 ) ) ( not ( = ?auto_28649 ?auto_28648 ) ) ( SURFACE-AT ?auto_28641 ?auto_28640 ) ( CLEAR ?auto_28641 ) ( IS-CRATE ?auto_28649 ) ( not ( = ?auto_28637 ?auto_28641 ) ) ( not ( = ?auto_28638 ?auto_28641 ) ) ( not ( = ?auto_28642 ?auto_28641 ) ) ( not ( = ?auto_28649 ?auto_28641 ) ) ( not ( = ?auto_28648 ?auto_28641 ) ) ( AVAILABLE ?auto_28646 ) ( not ( = ?auto_28647 ?auto_28640 ) ) ( not ( = ?auto_28650 ?auto_28647 ) ) ( HOIST-AT ?auto_28645 ?auto_28647 ) ( not ( = ?auto_28646 ?auto_28645 ) ) ( not ( = ?auto_28639 ?auto_28645 ) ) ( AVAILABLE ?auto_28645 ) ( SURFACE-AT ?auto_28649 ?auto_28647 ) ( ON ?auto_28649 ?auto_28643 ) ( CLEAR ?auto_28649 ) ( not ( = ?auto_28637 ?auto_28643 ) ) ( not ( = ?auto_28638 ?auto_28643 ) ) ( not ( = ?auto_28642 ?auto_28643 ) ) ( not ( = ?auto_28649 ?auto_28643 ) ) ( not ( = ?auto_28648 ?auto_28643 ) ) ( not ( = ?auto_28641 ?auto_28643 ) ) ( TRUCK-AT ?auto_28644 ?auto_28640 ) )
    :subtasks
    ( ( !DRIVE ?auto_28644 ?auto_28640 ?auto_28647 )
      ( MAKE-ON ?auto_28637 ?auto_28638 )
      ( MAKE-ON-VERIFY ?auto_28637 ?auto_28638 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28651 - SURFACE
      ?auto_28652 - SURFACE
    )
    :vars
    (
      ?auto_28661 - HOIST
      ?auto_28664 - PLACE
      ?auto_28663 - PLACE
      ?auto_28658 - HOIST
      ?auto_28660 - SURFACE
      ?auto_28657 - SURFACE
      ?auto_28659 - SURFACE
      ?auto_28653 - SURFACE
      ?auto_28655 - PLACE
      ?auto_28662 - HOIST
      ?auto_28654 - SURFACE
      ?auto_28656 - TRUCK
      ?auto_28665 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28661 ?auto_28664 ) ( IS-CRATE ?auto_28651 ) ( not ( = ?auto_28651 ?auto_28652 ) ) ( not ( = ?auto_28663 ?auto_28664 ) ) ( HOIST-AT ?auto_28658 ?auto_28663 ) ( not ( = ?auto_28661 ?auto_28658 ) ) ( SURFACE-AT ?auto_28651 ?auto_28663 ) ( ON ?auto_28651 ?auto_28660 ) ( CLEAR ?auto_28651 ) ( not ( = ?auto_28651 ?auto_28660 ) ) ( not ( = ?auto_28652 ?auto_28660 ) ) ( IS-CRATE ?auto_28652 ) ( not ( = ?auto_28651 ?auto_28657 ) ) ( not ( = ?auto_28652 ?auto_28657 ) ) ( not ( = ?auto_28660 ?auto_28657 ) ) ( AVAILABLE ?auto_28658 ) ( SURFACE-AT ?auto_28652 ?auto_28663 ) ( ON ?auto_28652 ?auto_28659 ) ( CLEAR ?auto_28652 ) ( not ( = ?auto_28651 ?auto_28659 ) ) ( not ( = ?auto_28652 ?auto_28659 ) ) ( not ( = ?auto_28660 ?auto_28659 ) ) ( not ( = ?auto_28657 ?auto_28659 ) ) ( IS-CRATE ?auto_28657 ) ( not ( = ?auto_28651 ?auto_28653 ) ) ( not ( = ?auto_28652 ?auto_28653 ) ) ( not ( = ?auto_28660 ?auto_28653 ) ) ( not ( = ?auto_28657 ?auto_28653 ) ) ( not ( = ?auto_28659 ?auto_28653 ) ) ( not ( = ?auto_28655 ?auto_28664 ) ) ( not ( = ?auto_28663 ?auto_28655 ) ) ( HOIST-AT ?auto_28662 ?auto_28655 ) ( not ( = ?auto_28661 ?auto_28662 ) ) ( not ( = ?auto_28658 ?auto_28662 ) ) ( AVAILABLE ?auto_28662 ) ( SURFACE-AT ?auto_28657 ?auto_28655 ) ( ON ?auto_28657 ?auto_28654 ) ( CLEAR ?auto_28657 ) ( not ( = ?auto_28651 ?auto_28654 ) ) ( not ( = ?auto_28652 ?auto_28654 ) ) ( not ( = ?auto_28660 ?auto_28654 ) ) ( not ( = ?auto_28657 ?auto_28654 ) ) ( not ( = ?auto_28659 ?auto_28654 ) ) ( not ( = ?auto_28653 ?auto_28654 ) ) ( TRUCK-AT ?auto_28656 ?auto_28664 ) ( SURFACE-AT ?auto_28665 ?auto_28664 ) ( CLEAR ?auto_28665 ) ( LIFTING ?auto_28661 ?auto_28653 ) ( IS-CRATE ?auto_28653 ) ( not ( = ?auto_28651 ?auto_28665 ) ) ( not ( = ?auto_28652 ?auto_28665 ) ) ( not ( = ?auto_28660 ?auto_28665 ) ) ( not ( = ?auto_28657 ?auto_28665 ) ) ( not ( = ?auto_28659 ?auto_28665 ) ) ( not ( = ?auto_28653 ?auto_28665 ) ) ( not ( = ?auto_28654 ?auto_28665 ) ) )
    :subtasks
    ( ( !DROP ?auto_28661 ?auto_28653 ?auto_28665 ?auto_28664 )
      ( MAKE-ON ?auto_28651 ?auto_28652 )
      ( MAKE-ON-VERIFY ?auto_28651 ?auto_28652 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28666 - SURFACE
      ?auto_28667 - SURFACE
    )
    :vars
    (
      ?auto_28678 - HOIST
      ?auto_28676 - PLACE
      ?auto_28677 - PLACE
      ?auto_28669 - HOIST
      ?auto_28679 - SURFACE
      ?auto_28670 - SURFACE
      ?auto_28675 - SURFACE
      ?auto_28671 - SURFACE
      ?auto_28672 - PLACE
      ?auto_28673 - HOIST
      ?auto_28680 - SURFACE
      ?auto_28668 - TRUCK
      ?auto_28674 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28678 ?auto_28676 ) ( IS-CRATE ?auto_28666 ) ( not ( = ?auto_28666 ?auto_28667 ) ) ( not ( = ?auto_28677 ?auto_28676 ) ) ( HOIST-AT ?auto_28669 ?auto_28677 ) ( not ( = ?auto_28678 ?auto_28669 ) ) ( SURFACE-AT ?auto_28666 ?auto_28677 ) ( ON ?auto_28666 ?auto_28679 ) ( CLEAR ?auto_28666 ) ( not ( = ?auto_28666 ?auto_28679 ) ) ( not ( = ?auto_28667 ?auto_28679 ) ) ( IS-CRATE ?auto_28667 ) ( not ( = ?auto_28666 ?auto_28670 ) ) ( not ( = ?auto_28667 ?auto_28670 ) ) ( not ( = ?auto_28679 ?auto_28670 ) ) ( AVAILABLE ?auto_28669 ) ( SURFACE-AT ?auto_28667 ?auto_28677 ) ( ON ?auto_28667 ?auto_28675 ) ( CLEAR ?auto_28667 ) ( not ( = ?auto_28666 ?auto_28675 ) ) ( not ( = ?auto_28667 ?auto_28675 ) ) ( not ( = ?auto_28679 ?auto_28675 ) ) ( not ( = ?auto_28670 ?auto_28675 ) ) ( IS-CRATE ?auto_28670 ) ( not ( = ?auto_28666 ?auto_28671 ) ) ( not ( = ?auto_28667 ?auto_28671 ) ) ( not ( = ?auto_28679 ?auto_28671 ) ) ( not ( = ?auto_28670 ?auto_28671 ) ) ( not ( = ?auto_28675 ?auto_28671 ) ) ( not ( = ?auto_28672 ?auto_28676 ) ) ( not ( = ?auto_28677 ?auto_28672 ) ) ( HOIST-AT ?auto_28673 ?auto_28672 ) ( not ( = ?auto_28678 ?auto_28673 ) ) ( not ( = ?auto_28669 ?auto_28673 ) ) ( AVAILABLE ?auto_28673 ) ( SURFACE-AT ?auto_28670 ?auto_28672 ) ( ON ?auto_28670 ?auto_28680 ) ( CLEAR ?auto_28670 ) ( not ( = ?auto_28666 ?auto_28680 ) ) ( not ( = ?auto_28667 ?auto_28680 ) ) ( not ( = ?auto_28679 ?auto_28680 ) ) ( not ( = ?auto_28670 ?auto_28680 ) ) ( not ( = ?auto_28675 ?auto_28680 ) ) ( not ( = ?auto_28671 ?auto_28680 ) ) ( TRUCK-AT ?auto_28668 ?auto_28676 ) ( SURFACE-AT ?auto_28674 ?auto_28676 ) ( CLEAR ?auto_28674 ) ( IS-CRATE ?auto_28671 ) ( not ( = ?auto_28666 ?auto_28674 ) ) ( not ( = ?auto_28667 ?auto_28674 ) ) ( not ( = ?auto_28679 ?auto_28674 ) ) ( not ( = ?auto_28670 ?auto_28674 ) ) ( not ( = ?auto_28675 ?auto_28674 ) ) ( not ( = ?auto_28671 ?auto_28674 ) ) ( not ( = ?auto_28680 ?auto_28674 ) ) ( AVAILABLE ?auto_28678 ) ( IN ?auto_28671 ?auto_28668 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28678 ?auto_28671 ?auto_28668 ?auto_28676 )
      ( MAKE-ON ?auto_28666 ?auto_28667 )
      ( MAKE-ON-VERIFY ?auto_28666 ?auto_28667 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28681 - SURFACE
      ?auto_28682 - SURFACE
    )
    :vars
    (
      ?auto_28684 - HOIST
      ?auto_28683 - PLACE
      ?auto_28694 - PLACE
      ?auto_28690 - HOIST
      ?auto_28695 - SURFACE
      ?auto_28688 - SURFACE
      ?auto_28685 - SURFACE
      ?auto_28687 - SURFACE
      ?auto_28692 - PLACE
      ?auto_28689 - HOIST
      ?auto_28691 - SURFACE
      ?auto_28693 - SURFACE
      ?auto_28686 - TRUCK
      ?auto_28696 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28684 ?auto_28683 ) ( IS-CRATE ?auto_28681 ) ( not ( = ?auto_28681 ?auto_28682 ) ) ( not ( = ?auto_28694 ?auto_28683 ) ) ( HOIST-AT ?auto_28690 ?auto_28694 ) ( not ( = ?auto_28684 ?auto_28690 ) ) ( SURFACE-AT ?auto_28681 ?auto_28694 ) ( ON ?auto_28681 ?auto_28695 ) ( CLEAR ?auto_28681 ) ( not ( = ?auto_28681 ?auto_28695 ) ) ( not ( = ?auto_28682 ?auto_28695 ) ) ( IS-CRATE ?auto_28682 ) ( not ( = ?auto_28681 ?auto_28688 ) ) ( not ( = ?auto_28682 ?auto_28688 ) ) ( not ( = ?auto_28695 ?auto_28688 ) ) ( AVAILABLE ?auto_28690 ) ( SURFACE-AT ?auto_28682 ?auto_28694 ) ( ON ?auto_28682 ?auto_28685 ) ( CLEAR ?auto_28682 ) ( not ( = ?auto_28681 ?auto_28685 ) ) ( not ( = ?auto_28682 ?auto_28685 ) ) ( not ( = ?auto_28695 ?auto_28685 ) ) ( not ( = ?auto_28688 ?auto_28685 ) ) ( IS-CRATE ?auto_28688 ) ( not ( = ?auto_28681 ?auto_28687 ) ) ( not ( = ?auto_28682 ?auto_28687 ) ) ( not ( = ?auto_28695 ?auto_28687 ) ) ( not ( = ?auto_28688 ?auto_28687 ) ) ( not ( = ?auto_28685 ?auto_28687 ) ) ( not ( = ?auto_28692 ?auto_28683 ) ) ( not ( = ?auto_28694 ?auto_28692 ) ) ( HOIST-AT ?auto_28689 ?auto_28692 ) ( not ( = ?auto_28684 ?auto_28689 ) ) ( not ( = ?auto_28690 ?auto_28689 ) ) ( AVAILABLE ?auto_28689 ) ( SURFACE-AT ?auto_28688 ?auto_28692 ) ( ON ?auto_28688 ?auto_28691 ) ( CLEAR ?auto_28688 ) ( not ( = ?auto_28681 ?auto_28691 ) ) ( not ( = ?auto_28682 ?auto_28691 ) ) ( not ( = ?auto_28695 ?auto_28691 ) ) ( not ( = ?auto_28688 ?auto_28691 ) ) ( not ( = ?auto_28685 ?auto_28691 ) ) ( not ( = ?auto_28687 ?auto_28691 ) ) ( SURFACE-AT ?auto_28693 ?auto_28683 ) ( CLEAR ?auto_28693 ) ( IS-CRATE ?auto_28687 ) ( not ( = ?auto_28681 ?auto_28693 ) ) ( not ( = ?auto_28682 ?auto_28693 ) ) ( not ( = ?auto_28695 ?auto_28693 ) ) ( not ( = ?auto_28688 ?auto_28693 ) ) ( not ( = ?auto_28685 ?auto_28693 ) ) ( not ( = ?auto_28687 ?auto_28693 ) ) ( not ( = ?auto_28691 ?auto_28693 ) ) ( AVAILABLE ?auto_28684 ) ( IN ?auto_28687 ?auto_28686 ) ( TRUCK-AT ?auto_28686 ?auto_28696 ) ( not ( = ?auto_28696 ?auto_28683 ) ) ( not ( = ?auto_28694 ?auto_28696 ) ) ( not ( = ?auto_28692 ?auto_28696 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28686 ?auto_28696 ?auto_28683 )
      ( MAKE-ON ?auto_28681 ?auto_28682 )
      ( MAKE-ON-VERIFY ?auto_28681 ?auto_28682 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28697 - SURFACE
      ?auto_28698 - SURFACE
    )
    :vars
    (
      ?auto_28705 - HOIST
      ?auto_28702 - PLACE
      ?auto_28706 - PLACE
      ?auto_28708 - HOIST
      ?auto_28707 - SURFACE
      ?auto_28709 - SURFACE
      ?auto_28710 - SURFACE
      ?auto_28701 - SURFACE
      ?auto_28703 - PLACE
      ?auto_28704 - HOIST
      ?auto_28699 - SURFACE
      ?auto_28711 - SURFACE
      ?auto_28712 - TRUCK
      ?auto_28700 - PLACE
      ?auto_28713 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28705 ?auto_28702 ) ( IS-CRATE ?auto_28697 ) ( not ( = ?auto_28697 ?auto_28698 ) ) ( not ( = ?auto_28706 ?auto_28702 ) ) ( HOIST-AT ?auto_28708 ?auto_28706 ) ( not ( = ?auto_28705 ?auto_28708 ) ) ( SURFACE-AT ?auto_28697 ?auto_28706 ) ( ON ?auto_28697 ?auto_28707 ) ( CLEAR ?auto_28697 ) ( not ( = ?auto_28697 ?auto_28707 ) ) ( not ( = ?auto_28698 ?auto_28707 ) ) ( IS-CRATE ?auto_28698 ) ( not ( = ?auto_28697 ?auto_28709 ) ) ( not ( = ?auto_28698 ?auto_28709 ) ) ( not ( = ?auto_28707 ?auto_28709 ) ) ( AVAILABLE ?auto_28708 ) ( SURFACE-AT ?auto_28698 ?auto_28706 ) ( ON ?auto_28698 ?auto_28710 ) ( CLEAR ?auto_28698 ) ( not ( = ?auto_28697 ?auto_28710 ) ) ( not ( = ?auto_28698 ?auto_28710 ) ) ( not ( = ?auto_28707 ?auto_28710 ) ) ( not ( = ?auto_28709 ?auto_28710 ) ) ( IS-CRATE ?auto_28709 ) ( not ( = ?auto_28697 ?auto_28701 ) ) ( not ( = ?auto_28698 ?auto_28701 ) ) ( not ( = ?auto_28707 ?auto_28701 ) ) ( not ( = ?auto_28709 ?auto_28701 ) ) ( not ( = ?auto_28710 ?auto_28701 ) ) ( not ( = ?auto_28703 ?auto_28702 ) ) ( not ( = ?auto_28706 ?auto_28703 ) ) ( HOIST-AT ?auto_28704 ?auto_28703 ) ( not ( = ?auto_28705 ?auto_28704 ) ) ( not ( = ?auto_28708 ?auto_28704 ) ) ( AVAILABLE ?auto_28704 ) ( SURFACE-AT ?auto_28709 ?auto_28703 ) ( ON ?auto_28709 ?auto_28699 ) ( CLEAR ?auto_28709 ) ( not ( = ?auto_28697 ?auto_28699 ) ) ( not ( = ?auto_28698 ?auto_28699 ) ) ( not ( = ?auto_28707 ?auto_28699 ) ) ( not ( = ?auto_28709 ?auto_28699 ) ) ( not ( = ?auto_28710 ?auto_28699 ) ) ( not ( = ?auto_28701 ?auto_28699 ) ) ( SURFACE-AT ?auto_28711 ?auto_28702 ) ( CLEAR ?auto_28711 ) ( IS-CRATE ?auto_28701 ) ( not ( = ?auto_28697 ?auto_28711 ) ) ( not ( = ?auto_28698 ?auto_28711 ) ) ( not ( = ?auto_28707 ?auto_28711 ) ) ( not ( = ?auto_28709 ?auto_28711 ) ) ( not ( = ?auto_28710 ?auto_28711 ) ) ( not ( = ?auto_28701 ?auto_28711 ) ) ( not ( = ?auto_28699 ?auto_28711 ) ) ( AVAILABLE ?auto_28705 ) ( TRUCK-AT ?auto_28712 ?auto_28700 ) ( not ( = ?auto_28700 ?auto_28702 ) ) ( not ( = ?auto_28706 ?auto_28700 ) ) ( not ( = ?auto_28703 ?auto_28700 ) ) ( HOIST-AT ?auto_28713 ?auto_28700 ) ( LIFTING ?auto_28713 ?auto_28701 ) ( not ( = ?auto_28705 ?auto_28713 ) ) ( not ( = ?auto_28708 ?auto_28713 ) ) ( not ( = ?auto_28704 ?auto_28713 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28713 ?auto_28701 ?auto_28712 ?auto_28700 )
      ( MAKE-ON ?auto_28697 ?auto_28698 )
      ( MAKE-ON-VERIFY ?auto_28697 ?auto_28698 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28714 - SURFACE
      ?auto_28715 - SURFACE
    )
    :vars
    (
      ?auto_28717 - HOIST
      ?auto_28716 - PLACE
      ?auto_28719 - PLACE
      ?auto_28729 - HOIST
      ?auto_28727 - SURFACE
      ?auto_28721 - SURFACE
      ?auto_28730 - SURFACE
      ?auto_28718 - SURFACE
      ?auto_28728 - PLACE
      ?auto_28725 - HOIST
      ?auto_28720 - SURFACE
      ?auto_28723 - SURFACE
      ?auto_28726 - TRUCK
      ?auto_28722 - PLACE
      ?auto_28724 - HOIST
      ?auto_28731 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28717 ?auto_28716 ) ( IS-CRATE ?auto_28714 ) ( not ( = ?auto_28714 ?auto_28715 ) ) ( not ( = ?auto_28719 ?auto_28716 ) ) ( HOIST-AT ?auto_28729 ?auto_28719 ) ( not ( = ?auto_28717 ?auto_28729 ) ) ( SURFACE-AT ?auto_28714 ?auto_28719 ) ( ON ?auto_28714 ?auto_28727 ) ( CLEAR ?auto_28714 ) ( not ( = ?auto_28714 ?auto_28727 ) ) ( not ( = ?auto_28715 ?auto_28727 ) ) ( IS-CRATE ?auto_28715 ) ( not ( = ?auto_28714 ?auto_28721 ) ) ( not ( = ?auto_28715 ?auto_28721 ) ) ( not ( = ?auto_28727 ?auto_28721 ) ) ( AVAILABLE ?auto_28729 ) ( SURFACE-AT ?auto_28715 ?auto_28719 ) ( ON ?auto_28715 ?auto_28730 ) ( CLEAR ?auto_28715 ) ( not ( = ?auto_28714 ?auto_28730 ) ) ( not ( = ?auto_28715 ?auto_28730 ) ) ( not ( = ?auto_28727 ?auto_28730 ) ) ( not ( = ?auto_28721 ?auto_28730 ) ) ( IS-CRATE ?auto_28721 ) ( not ( = ?auto_28714 ?auto_28718 ) ) ( not ( = ?auto_28715 ?auto_28718 ) ) ( not ( = ?auto_28727 ?auto_28718 ) ) ( not ( = ?auto_28721 ?auto_28718 ) ) ( not ( = ?auto_28730 ?auto_28718 ) ) ( not ( = ?auto_28728 ?auto_28716 ) ) ( not ( = ?auto_28719 ?auto_28728 ) ) ( HOIST-AT ?auto_28725 ?auto_28728 ) ( not ( = ?auto_28717 ?auto_28725 ) ) ( not ( = ?auto_28729 ?auto_28725 ) ) ( AVAILABLE ?auto_28725 ) ( SURFACE-AT ?auto_28721 ?auto_28728 ) ( ON ?auto_28721 ?auto_28720 ) ( CLEAR ?auto_28721 ) ( not ( = ?auto_28714 ?auto_28720 ) ) ( not ( = ?auto_28715 ?auto_28720 ) ) ( not ( = ?auto_28727 ?auto_28720 ) ) ( not ( = ?auto_28721 ?auto_28720 ) ) ( not ( = ?auto_28730 ?auto_28720 ) ) ( not ( = ?auto_28718 ?auto_28720 ) ) ( SURFACE-AT ?auto_28723 ?auto_28716 ) ( CLEAR ?auto_28723 ) ( IS-CRATE ?auto_28718 ) ( not ( = ?auto_28714 ?auto_28723 ) ) ( not ( = ?auto_28715 ?auto_28723 ) ) ( not ( = ?auto_28727 ?auto_28723 ) ) ( not ( = ?auto_28721 ?auto_28723 ) ) ( not ( = ?auto_28730 ?auto_28723 ) ) ( not ( = ?auto_28718 ?auto_28723 ) ) ( not ( = ?auto_28720 ?auto_28723 ) ) ( AVAILABLE ?auto_28717 ) ( TRUCK-AT ?auto_28726 ?auto_28722 ) ( not ( = ?auto_28722 ?auto_28716 ) ) ( not ( = ?auto_28719 ?auto_28722 ) ) ( not ( = ?auto_28728 ?auto_28722 ) ) ( HOIST-AT ?auto_28724 ?auto_28722 ) ( not ( = ?auto_28717 ?auto_28724 ) ) ( not ( = ?auto_28729 ?auto_28724 ) ) ( not ( = ?auto_28725 ?auto_28724 ) ) ( AVAILABLE ?auto_28724 ) ( SURFACE-AT ?auto_28718 ?auto_28722 ) ( ON ?auto_28718 ?auto_28731 ) ( CLEAR ?auto_28718 ) ( not ( = ?auto_28714 ?auto_28731 ) ) ( not ( = ?auto_28715 ?auto_28731 ) ) ( not ( = ?auto_28727 ?auto_28731 ) ) ( not ( = ?auto_28721 ?auto_28731 ) ) ( not ( = ?auto_28730 ?auto_28731 ) ) ( not ( = ?auto_28718 ?auto_28731 ) ) ( not ( = ?auto_28720 ?auto_28731 ) ) ( not ( = ?auto_28723 ?auto_28731 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28724 ?auto_28718 ?auto_28731 ?auto_28722 )
      ( MAKE-ON ?auto_28714 ?auto_28715 )
      ( MAKE-ON-VERIFY ?auto_28714 ?auto_28715 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28732 - SURFACE
      ?auto_28733 - SURFACE
    )
    :vars
    (
      ?auto_28742 - HOIST
      ?auto_28738 - PLACE
      ?auto_28736 - PLACE
      ?auto_28743 - HOIST
      ?auto_28741 - SURFACE
      ?auto_28739 - SURFACE
      ?auto_28748 - SURFACE
      ?auto_28735 - SURFACE
      ?auto_28734 - PLACE
      ?auto_28745 - HOIST
      ?auto_28740 - SURFACE
      ?auto_28737 - SURFACE
      ?auto_28749 - PLACE
      ?auto_28746 - HOIST
      ?auto_28747 - SURFACE
      ?auto_28744 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28742 ?auto_28738 ) ( IS-CRATE ?auto_28732 ) ( not ( = ?auto_28732 ?auto_28733 ) ) ( not ( = ?auto_28736 ?auto_28738 ) ) ( HOIST-AT ?auto_28743 ?auto_28736 ) ( not ( = ?auto_28742 ?auto_28743 ) ) ( SURFACE-AT ?auto_28732 ?auto_28736 ) ( ON ?auto_28732 ?auto_28741 ) ( CLEAR ?auto_28732 ) ( not ( = ?auto_28732 ?auto_28741 ) ) ( not ( = ?auto_28733 ?auto_28741 ) ) ( IS-CRATE ?auto_28733 ) ( not ( = ?auto_28732 ?auto_28739 ) ) ( not ( = ?auto_28733 ?auto_28739 ) ) ( not ( = ?auto_28741 ?auto_28739 ) ) ( AVAILABLE ?auto_28743 ) ( SURFACE-AT ?auto_28733 ?auto_28736 ) ( ON ?auto_28733 ?auto_28748 ) ( CLEAR ?auto_28733 ) ( not ( = ?auto_28732 ?auto_28748 ) ) ( not ( = ?auto_28733 ?auto_28748 ) ) ( not ( = ?auto_28741 ?auto_28748 ) ) ( not ( = ?auto_28739 ?auto_28748 ) ) ( IS-CRATE ?auto_28739 ) ( not ( = ?auto_28732 ?auto_28735 ) ) ( not ( = ?auto_28733 ?auto_28735 ) ) ( not ( = ?auto_28741 ?auto_28735 ) ) ( not ( = ?auto_28739 ?auto_28735 ) ) ( not ( = ?auto_28748 ?auto_28735 ) ) ( not ( = ?auto_28734 ?auto_28738 ) ) ( not ( = ?auto_28736 ?auto_28734 ) ) ( HOIST-AT ?auto_28745 ?auto_28734 ) ( not ( = ?auto_28742 ?auto_28745 ) ) ( not ( = ?auto_28743 ?auto_28745 ) ) ( AVAILABLE ?auto_28745 ) ( SURFACE-AT ?auto_28739 ?auto_28734 ) ( ON ?auto_28739 ?auto_28740 ) ( CLEAR ?auto_28739 ) ( not ( = ?auto_28732 ?auto_28740 ) ) ( not ( = ?auto_28733 ?auto_28740 ) ) ( not ( = ?auto_28741 ?auto_28740 ) ) ( not ( = ?auto_28739 ?auto_28740 ) ) ( not ( = ?auto_28748 ?auto_28740 ) ) ( not ( = ?auto_28735 ?auto_28740 ) ) ( SURFACE-AT ?auto_28737 ?auto_28738 ) ( CLEAR ?auto_28737 ) ( IS-CRATE ?auto_28735 ) ( not ( = ?auto_28732 ?auto_28737 ) ) ( not ( = ?auto_28733 ?auto_28737 ) ) ( not ( = ?auto_28741 ?auto_28737 ) ) ( not ( = ?auto_28739 ?auto_28737 ) ) ( not ( = ?auto_28748 ?auto_28737 ) ) ( not ( = ?auto_28735 ?auto_28737 ) ) ( not ( = ?auto_28740 ?auto_28737 ) ) ( AVAILABLE ?auto_28742 ) ( not ( = ?auto_28749 ?auto_28738 ) ) ( not ( = ?auto_28736 ?auto_28749 ) ) ( not ( = ?auto_28734 ?auto_28749 ) ) ( HOIST-AT ?auto_28746 ?auto_28749 ) ( not ( = ?auto_28742 ?auto_28746 ) ) ( not ( = ?auto_28743 ?auto_28746 ) ) ( not ( = ?auto_28745 ?auto_28746 ) ) ( AVAILABLE ?auto_28746 ) ( SURFACE-AT ?auto_28735 ?auto_28749 ) ( ON ?auto_28735 ?auto_28747 ) ( CLEAR ?auto_28735 ) ( not ( = ?auto_28732 ?auto_28747 ) ) ( not ( = ?auto_28733 ?auto_28747 ) ) ( not ( = ?auto_28741 ?auto_28747 ) ) ( not ( = ?auto_28739 ?auto_28747 ) ) ( not ( = ?auto_28748 ?auto_28747 ) ) ( not ( = ?auto_28735 ?auto_28747 ) ) ( not ( = ?auto_28740 ?auto_28747 ) ) ( not ( = ?auto_28737 ?auto_28747 ) ) ( TRUCK-AT ?auto_28744 ?auto_28738 ) )
    :subtasks
    ( ( !DRIVE ?auto_28744 ?auto_28738 ?auto_28749 )
      ( MAKE-ON ?auto_28732 ?auto_28733 )
      ( MAKE-ON-VERIFY ?auto_28732 ?auto_28733 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28750 - SURFACE
      ?auto_28751 - SURFACE
    )
    :vars
    (
      ?auto_28757 - HOIST
      ?auto_28760 - PLACE
      ?auto_28764 - PLACE
      ?auto_28766 - HOIST
      ?auto_28758 - SURFACE
      ?auto_28767 - SURFACE
      ?auto_28761 - SURFACE
      ?auto_28755 - SURFACE
      ?auto_28756 - PLACE
      ?auto_28753 - HOIST
      ?auto_28752 - SURFACE
      ?auto_28762 - SURFACE
      ?auto_28754 - PLACE
      ?auto_28759 - HOIST
      ?auto_28763 - SURFACE
      ?auto_28765 - TRUCK
      ?auto_28768 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28757 ?auto_28760 ) ( IS-CRATE ?auto_28750 ) ( not ( = ?auto_28750 ?auto_28751 ) ) ( not ( = ?auto_28764 ?auto_28760 ) ) ( HOIST-AT ?auto_28766 ?auto_28764 ) ( not ( = ?auto_28757 ?auto_28766 ) ) ( SURFACE-AT ?auto_28750 ?auto_28764 ) ( ON ?auto_28750 ?auto_28758 ) ( CLEAR ?auto_28750 ) ( not ( = ?auto_28750 ?auto_28758 ) ) ( not ( = ?auto_28751 ?auto_28758 ) ) ( IS-CRATE ?auto_28751 ) ( not ( = ?auto_28750 ?auto_28767 ) ) ( not ( = ?auto_28751 ?auto_28767 ) ) ( not ( = ?auto_28758 ?auto_28767 ) ) ( AVAILABLE ?auto_28766 ) ( SURFACE-AT ?auto_28751 ?auto_28764 ) ( ON ?auto_28751 ?auto_28761 ) ( CLEAR ?auto_28751 ) ( not ( = ?auto_28750 ?auto_28761 ) ) ( not ( = ?auto_28751 ?auto_28761 ) ) ( not ( = ?auto_28758 ?auto_28761 ) ) ( not ( = ?auto_28767 ?auto_28761 ) ) ( IS-CRATE ?auto_28767 ) ( not ( = ?auto_28750 ?auto_28755 ) ) ( not ( = ?auto_28751 ?auto_28755 ) ) ( not ( = ?auto_28758 ?auto_28755 ) ) ( not ( = ?auto_28767 ?auto_28755 ) ) ( not ( = ?auto_28761 ?auto_28755 ) ) ( not ( = ?auto_28756 ?auto_28760 ) ) ( not ( = ?auto_28764 ?auto_28756 ) ) ( HOIST-AT ?auto_28753 ?auto_28756 ) ( not ( = ?auto_28757 ?auto_28753 ) ) ( not ( = ?auto_28766 ?auto_28753 ) ) ( AVAILABLE ?auto_28753 ) ( SURFACE-AT ?auto_28767 ?auto_28756 ) ( ON ?auto_28767 ?auto_28752 ) ( CLEAR ?auto_28767 ) ( not ( = ?auto_28750 ?auto_28752 ) ) ( not ( = ?auto_28751 ?auto_28752 ) ) ( not ( = ?auto_28758 ?auto_28752 ) ) ( not ( = ?auto_28767 ?auto_28752 ) ) ( not ( = ?auto_28761 ?auto_28752 ) ) ( not ( = ?auto_28755 ?auto_28752 ) ) ( IS-CRATE ?auto_28755 ) ( not ( = ?auto_28750 ?auto_28762 ) ) ( not ( = ?auto_28751 ?auto_28762 ) ) ( not ( = ?auto_28758 ?auto_28762 ) ) ( not ( = ?auto_28767 ?auto_28762 ) ) ( not ( = ?auto_28761 ?auto_28762 ) ) ( not ( = ?auto_28755 ?auto_28762 ) ) ( not ( = ?auto_28752 ?auto_28762 ) ) ( not ( = ?auto_28754 ?auto_28760 ) ) ( not ( = ?auto_28764 ?auto_28754 ) ) ( not ( = ?auto_28756 ?auto_28754 ) ) ( HOIST-AT ?auto_28759 ?auto_28754 ) ( not ( = ?auto_28757 ?auto_28759 ) ) ( not ( = ?auto_28766 ?auto_28759 ) ) ( not ( = ?auto_28753 ?auto_28759 ) ) ( AVAILABLE ?auto_28759 ) ( SURFACE-AT ?auto_28755 ?auto_28754 ) ( ON ?auto_28755 ?auto_28763 ) ( CLEAR ?auto_28755 ) ( not ( = ?auto_28750 ?auto_28763 ) ) ( not ( = ?auto_28751 ?auto_28763 ) ) ( not ( = ?auto_28758 ?auto_28763 ) ) ( not ( = ?auto_28767 ?auto_28763 ) ) ( not ( = ?auto_28761 ?auto_28763 ) ) ( not ( = ?auto_28755 ?auto_28763 ) ) ( not ( = ?auto_28752 ?auto_28763 ) ) ( not ( = ?auto_28762 ?auto_28763 ) ) ( TRUCK-AT ?auto_28765 ?auto_28760 ) ( SURFACE-AT ?auto_28768 ?auto_28760 ) ( CLEAR ?auto_28768 ) ( LIFTING ?auto_28757 ?auto_28762 ) ( IS-CRATE ?auto_28762 ) ( not ( = ?auto_28750 ?auto_28768 ) ) ( not ( = ?auto_28751 ?auto_28768 ) ) ( not ( = ?auto_28758 ?auto_28768 ) ) ( not ( = ?auto_28767 ?auto_28768 ) ) ( not ( = ?auto_28761 ?auto_28768 ) ) ( not ( = ?auto_28755 ?auto_28768 ) ) ( not ( = ?auto_28752 ?auto_28768 ) ) ( not ( = ?auto_28762 ?auto_28768 ) ) ( not ( = ?auto_28763 ?auto_28768 ) ) )
    :subtasks
    ( ( !DROP ?auto_28757 ?auto_28762 ?auto_28768 ?auto_28760 )
      ( MAKE-ON ?auto_28750 ?auto_28751 )
      ( MAKE-ON-VERIFY ?auto_28750 ?auto_28751 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28769 - SURFACE
      ?auto_28770 - SURFACE
    )
    :vars
    (
      ?auto_28776 - HOIST
      ?auto_28785 - PLACE
      ?auto_28783 - PLACE
      ?auto_28787 - HOIST
      ?auto_28781 - SURFACE
      ?auto_28780 - SURFACE
      ?auto_28786 - SURFACE
      ?auto_28774 - SURFACE
      ?auto_28775 - PLACE
      ?auto_28782 - HOIST
      ?auto_28784 - SURFACE
      ?auto_28777 - SURFACE
      ?auto_28773 - PLACE
      ?auto_28771 - HOIST
      ?auto_28772 - SURFACE
      ?auto_28778 - TRUCK
      ?auto_28779 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28776 ?auto_28785 ) ( IS-CRATE ?auto_28769 ) ( not ( = ?auto_28769 ?auto_28770 ) ) ( not ( = ?auto_28783 ?auto_28785 ) ) ( HOIST-AT ?auto_28787 ?auto_28783 ) ( not ( = ?auto_28776 ?auto_28787 ) ) ( SURFACE-AT ?auto_28769 ?auto_28783 ) ( ON ?auto_28769 ?auto_28781 ) ( CLEAR ?auto_28769 ) ( not ( = ?auto_28769 ?auto_28781 ) ) ( not ( = ?auto_28770 ?auto_28781 ) ) ( IS-CRATE ?auto_28770 ) ( not ( = ?auto_28769 ?auto_28780 ) ) ( not ( = ?auto_28770 ?auto_28780 ) ) ( not ( = ?auto_28781 ?auto_28780 ) ) ( AVAILABLE ?auto_28787 ) ( SURFACE-AT ?auto_28770 ?auto_28783 ) ( ON ?auto_28770 ?auto_28786 ) ( CLEAR ?auto_28770 ) ( not ( = ?auto_28769 ?auto_28786 ) ) ( not ( = ?auto_28770 ?auto_28786 ) ) ( not ( = ?auto_28781 ?auto_28786 ) ) ( not ( = ?auto_28780 ?auto_28786 ) ) ( IS-CRATE ?auto_28780 ) ( not ( = ?auto_28769 ?auto_28774 ) ) ( not ( = ?auto_28770 ?auto_28774 ) ) ( not ( = ?auto_28781 ?auto_28774 ) ) ( not ( = ?auto_28780 ?auto_28774 ) ) ( not ( = ?auto_28786 ?auto_28774 ) ) ( not ( = ?auto_28775 ?auto_28785 ) ) ( not ( = ?auto_28783 ?auto_28775 ) ) ( HOIST-AT ?auto_28782 ?auto_28775 ) ( not ( = ?auto_28776 ?auto_28782 ) ) ( not ( = ?auto_28787 ?auto_28782 ) ) ( AVAILABLE ?auto_28782 ) ( SURFACE-AT ?auto_28780 ?auto_28775 ) ( ON ?auto_28780 ?auto_28784 ) ( CLEAR ?auto_28780 ) ( not ( = ?auto_28769 ?auto_28784 ) ) ( not ( = ?auto_28770 ?auto_28784 ) ) ( not ( = ?auto_28781 ?auto_28784 ) ) ( not ( = ?auto_28780 ?auto_28784 ) ) ( not ( = ?auto_28786 ?auto_28784 ) ) ( not ( = ?auto_28774 ?auto_28784 ) ) ( IS-CRATE ?auto_28774 ) ( not ( = ?auto_28769 ?auto_28777 ) ) ( not ( = ?auto_28770 ?auto_28777 ) ) ( not ( = ?auto_28781 ?auto_28777 ) ) ( not ( = ?auto_28780 ?auto_28777 ) ) ( not ( = ?auto_28786 ?auto_28777 ) ) ( not ( = ?auto_28774 ?auto_28777 ) ) ( not ( = ?auto_28784 ?auto_28777 ) ) ( not ( = ?auto_28773 ?auto_28785 ) ) ( not ( = ?auto_28783 ?auto_28773 ) ) ( not ( = ?auto_28775 ?auto_28773 ) ) ( HOIST-AT ?auto_28771 ?auto_28773 ) ( not ( = ?auto_28776 ?auto_28771 ) ) ( not ( = ?auto_28787 ?auto_28771 ) ) ( not ( = ?auto_28782 ?auto_28771 ) ) ( AVAILABLE ?auto_28771 ) ( SURFACE-AT ?auto_28774 ?auto_28773 ) ( ON ?auto_28774 ?auto_28772 ) ( CLEAR ?auto_28774 ) ( not ( = ?auto_28769 ?auto_28772 ) ) ( not ( = ?auto_28770 ?auto_28772 ) ) ( not ( = ?auto_28781 ?auto_28772 ) ) ( not ( = ?auto_28780 ?auto_28772 ) ) ( not ( = ?auto_28786 ?auto_28772 ) ) ( not ( = ?auto_28774 ?auto_28772 ) ) ( not ( = ?auto_28784 ?auto_28772 ) ) ( not ( = ?auto_28777 ?auto_28772 ) ) ( TRUCK-AT ?auto_28778 ?auto_28785 ) ( SURFACE-AT ?auto_28779 ?auto_28785 ) ( CLEAR ?auto_28779 ) ( IS-CRATE ?auto_28777 ) ( not ( = ?auto_28769 ?auto_28779 ) ) ( not ( = ?auto_28770 ?auto_28779 ) ) ( not ( = ?auto_28781 ?auto_28779 ) ) ( not ( = ?auto_28780 ?auto_28779 ) ) ( not ( = ?auto_28786 ?auto_28779 ) ) ( not ( = ?auto_28774 ?auto_28779 ) ) ( not ( = ?auto_28784 ?auto_28779 ) ) ( not ( = ?auto_28777 ?auto_28779 ) ) ( not ( = ?auto_28772 ?auto_28779 ) ) ( AVAILABLE ?auto_28776 ) ( IN ?auto_28777 ?auto_28778 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28776 ?auto_28777 ?auto_28778 ?auto_28785 )
      ( MAKE-ON ?auto_28769 ?auto_28770 )
      ( MAKE-ON-VERIFY ?auto_28769 ?auto_28770 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28788 - SURFACE
      ?auto_28789 - SURFACE
    )
    :vars
    (
      ?auto_28805 - HOIST
      ?auto_28790 - PLACE
      ?auto_28800 - PLACE
      ?auto_28792 - HOIST
      ?auto_28794 - SURFACE
      ?auto_28791 - SURFACE
      ?auto_28804 - SURFACE
      ?auto_28806 - SURFACE
      ?auto_28798 - PLACE
      ?auto_28802 - HOIST
      ?auto_28796 - SURFACE
      ?auto_28799 - SURFACE
      ?auto_28803 - PLACE
      ?auto_28793 - HOIST
      ?auto_28797 - SURFACE
      ?auto_28801 - SURFACE
      ?auto_28795 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28805 ?auto_28790 ) ( IS-CRATE ?auto_28788 ) ( not ( = ?auto_28788 ?auto_28789 ) ) ( not ( = ?auto_28800 ?auto_28790 ) ) ( HOIST-AT ?auto_28792 ?auto_28800 ) ( not ( = ?auto_28805 ?auto_28792 ) ) ( SURFACE-AT ?auto_28788 ?auto_28800 ) ( ON ?auto_28788 ?auto_28794 ) ( CLEAR ?auto_28788 ) ( not ( = ?auto_28788 ?auto_28794 ) ) ( not ( = ?auto_28789 ?auto_28794 ) ) ( IS-CRATE ?auto_28789 ) ( not ( = ?auto_28788 ?auto_28791 ) ) ( not ( = ?auto_28789 ?auto_28791 ) ) ( not ( = ?auto_28794 ?auto_28791 ) ) ( AVAILABLE ?auto_28792 ) ( SURFACE-AT ?auto_28789 ?auto_28800 ) ( ON ?auto_28789 ?auto_28804 ) ( CLEAR ?auto_28789 ) ( not ( = ?auto_28788 ?auto_28804 ) ) ( not ( = ?auto_28789 ?auto_28804 ) ) ( not ( = ?auto_28794 ?auto_28804 ) ) ( not ( = ?auto_28791 ?auto_28804 ) ) ( IS-CRATE ?auto_28791 ) ( not ( = ?auto_28788 ?auto_28806 ) ) ( not ( = ?auto_28789 ?auto_28806 ) ) ( not ( = ?auto_28794 ?auto_28806 ) ) ( not ( = ?auto_28791 ?auto_28806 ) ) ( not ( = ?auto_28804 ?auto_28806 ) ) ( not ( = ?auto_28798 ?auto_28790 ) ) ( not ( = ?auto_28800 ?auto_28798 ) ) ( HOIST-AT ?auto_28802 ?auto_28798 ) ( not ( = ?auto_28805 ?auto_28802 ) ) ( not ( = ?auto_28792 ?auto_28802 ) ) ( AVAILABLE ?auto_28802 ) ( SURFACE-AT ?auto_28791 ?auto_28798 ) ( ON ?auto_28791 ?auto_28796 ) ( CLEAR ?auto_28791 ) ( not ( = ?auto_28788 ?auto_28796 ) ) ( not ( = ?auto_28789 ?auto_28796 ) ) ( not ( = ?auto_28794 ?auto_28796 ) ) ( not ( = ?auto_28791 ?auto_28796 ) ) ( not ( = ?auto_28804 ?auto_28796 ) ) ( not ( = ?auto_28806 ?auto_28796 ) ) ( IS-CRATE ?auto_28806 ) ( not ( = ?auto_28788 ?auto_28799 ) ) ( not ( = ?auto_28789 ?auto_28799 ) ) ( not ( = ?auto_28794 ?auto_28799 ) ) ( not ( = ?auto_28791 ?auto_28799 ) ) ( not ( = ?auto_28804 ?auto_28799 ) ) ( not ( = ?auto_28806 ?auto_28799 ) ) ( not ( = ?auto_28796 ?auto_28799 ) ) ( not ( = ?auto_28803 ?auto_28790 ) ) ( not ( = ?auto_28800 ?auto_28803 ) ) ( not ( = ?auto_28798 ?auto_28803 ) ) ( HOIST-AT ?auto_28793 ?auto_28803 ) ( not ( = ?auto_28805 ?auto_28793 ) ) ( not ( = ?auto_28792 ?auto_28793 ) ) ( not ( = ?auto_28802 ?auto_28793 ) ) ( AVAILABLE ?auto_28793 ) ( SURFACE-AT ?auto_28806 ?auto_28803 ) ( ON ?auto_28806 ?auto_28797 ) ( CLEAR ?auto_28806 ) ( not ( = ?auto_28788 ?auto_28797 ) ) ( not ( = ?auto_28789 ?auto_28797 ) ) ( not ( = ?auto_28794 ?auto_28797 ) ) ( not ( = ?auto_28791 ?auto_28797 ) ) ( not ( = ?auto_28804 ?auto_28797 ) ) ( not ( = ?auto_28806 ?auto_28797 ) ) ( not ( = ?auto_28796 ?auto_28797 ) ) ( not ( = ?auto_28799 ?auto_28797 ) ) ( SURFACE-AT ?auto_28801 ?auto_28790 ) ( CLEAR ?auto_28801 ) ( IS-CRATE ?auto_28799 ) ( not ( = ?auto_28788 ?auto_28801 ) ) ( not ( = ?auto_28789 ?auto_28801 ) ) ( not ( = ?auto_28794 ?auto_28801 ) ) ( not ( = ?auto_28791 ?auto_28801 ) ) ( not ( = ?auto_28804 ?auto_28801 ) ) ( not ( = ?auto_28806 ?auto_28801 ) ) ( not ( = ?auto_28796 ?auto_28801 ) ) ( not ( = ?auto_28799 ?auto_28801 ) ) ( not ( = ?auto_28797 ?auto_28801 ) ) ( AVAILABLE ?auto_28805 ) ( IN ?auto_28799 ?auto_28795 ) ( TRUCK-AT ?auto_28795 ?auto_28803 ) )
    :subtasks
    ( ( !DRIVE ?auto_28795 ?auto_28803 ?auto_28790 )
      ( MAKE-ON ?auto_28788 ?auto_28789 )
      ( MAKE-ON-VERIFY ?auto_28788 ?auto_28789 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28807 - SURFACE
      ?auto_28808 - SURFACE
    )
    :vars
    (
      ?auto_28823 - HOIST
      ?auto_28824 - PLACE
      ?auto_28813 - PLACE
      ?auto_28821 - HOIST
      ?auto_28825 - SURFACE
      ?auto_28814 - SURFACE
      ?auto_28819 - SURFACE
      ?auto_28820 - SURFACE
      ?auto_28822 - PLACE
      ?auto_28811 - HOIST
      ?auto_28818 - SURFACE
      ?auto_28816 - SURFACE
      ?auto_28817 - PLACE
      ?auto_28809 - HOIST
      ?auto_28810 - SURFACE
      ?auto_28815 - SURFACE
      ?auto_28812 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28823 ?auto_28824 ) ( IS-CRATE ?auto_28807 ) ( not ( = ?auto_28807 ?auto_28808 ) ) ( not ( = ?auto_28813 ?auto_28824 ) ) ( HOIST-AT ?auto_28821 ?auto_28813 ) ( not ( = ?auto_28823 ?auto_28821 ) ) ( SURFACE-AT ?auto_28807 ?auto_28813 ) ( ON ?auto_28807 ?auto_28825 ) ( CLEAR ?auto_28807 ) ( not ( = ?auto_28807 ?auto_28825 ) ) ( not ( = ?auto_28808 ?auto_28825 ) ) ( IS-CRATE ?auto_28808 ) ( not ( = ?auto_28807 ?auto_28814 ) ) ( not ( = ?auto_28808 ?auto_28814 ) ) ( not ( = ?auto_28825 ?auto_28814 ) ) ( AVAILABLE ?auto_28821 ) ( SURFACE-AT ?auto_28808 ?auto_28813 ) ( ON ?auto_28808 ?auto_28819 ) ( CLEAR ?auto_28808 ) ( not ( = ?auto_28807 ?auto_28819 ) ) ( not ( = ?auto_28808 ?auto_28819 ) ) ( not ( = ?auto_28825 ?auto_28819 ) ) ( not ( = ?auto_28814 ?auto_28819 ) ) ( IS-CRATE ?auto_28814 ) ( not ( = ?auto_28807 ?auto_28820 ) ) ( not ( = ?auto_28808 ?auto_28820 ) ) ( not ( = ?auto_28825 ?auto_28820 ) ) ( not ( = ?auto_28814 ?auto_28820 ) ) ( not ( = ?auto_28819 ?auto_28820 ) ) ( not ( = ?auto_28822 ?auto_28824 ) ) ( not ( = ?auto_28813 ?auto_28822 ) ) ( HOIST-AT ?auto_28811 ?auto_28822 ) ( not ( = ?auto_28823 ?auto_28811 ) ) ( not ( = ?auto_28821 ?auto_28811 ) ) ( AVAILABLE ?auto_28811 ) ( SURFACE-AT ?auto_28814 ?auto_28822 ) ( ON ?auto_28814 ?auto_28818 ) ( CLEAR ?auto_28814 ) ( not ( = ?auto_28807 ?auto_28818 ) ) ( not ( = ?auto_28808 ?auto_28818 ) ) ( not ( = ?auto_28825 ?auto_28818 ) ) ( not ( = ?auto_28814 ?auto_28818 ) ) ( not ( = ?auto_28819 ?auto_28818 ) ) ( not ( = ?auto_28820 ?auto_28818 ) ) ( IS-CRATE ?auto_28820 ) ( not ( = ?auto_28807 ?auto_28816 ) ) ( not ( = ?auto_28808 ?auto_28816 ) ) ( not ( = ?auto_28825 ?auto_28816 ) ) ( not ( = ?auto_28814 ?auto_28816 ) ) ( not ( = ?auto_28819 ?auto_28816 ) ) ( not ( = ?auto_28820 ?auto_28816 ) ) ( not ( = ?auto_28818 ?auto_28816 ) ) ( not ( = ?auto_28817 ?auto_28824 ) ) ( not ( = ?auto_28813 ?auto_28817 ) ) ( not ( = ?auto_28822 ?auto_28817 ) ) ( HOIST-AT ?auto_28809 ?auto_28817 ) ( not ( = ?auto_28823 ?auto_28809 ) ) ( not ( = ?auto_28821 ?auto_28809 ) ) ( not ( = ?auto_28811 ?auto_28809 ) ) ( SURFACE-AT ?auto_28820 ?auto_28817 ) ( ON ?auto_28820 ?auto_28810 ) ( CLEAR ?auto_28820 ) ( not ( = ?auto_28807 ?auto_28810 ) ) ( not ( = ?auto_28808 ?auto_28810 ) ) ( not ( = ?auto_28825 ?auto_28810 ) ) ( not ( = ?auto_28814 ?auto_28810 ) ) ( not ( = ?auto_28819 ?auto_28810 ) ) ( not ( = ?auto_28820 ?auto_28810 ) ) ( not ( = ?auto_28818 ?auto_28810 ) ) ( not ( = ?auto_28816 ?auto_28810 ) ) ( SURFACE-AT ?auto_28815 ?auto_28824 ) ( CLEAR ?auto_28815 ) ( IS-CRATE ?auto_28816 ) ( not ( = ?auto_28807 ?auto_28815 ) ) ( not ( = ?auto_28808 ?auto_28815 ) ) ( not ( = ?auto_28825 ?auto_28815 ) ) ( not ( = ?auto_28814 ?auto_28815 ) ) ( not ( = ?auto_28819 ?auto_28815 ) ) ( not ( = ?auto_28820 ?auto_28815 ) ) ( not ( = ?auto_28818 ?auto_28815 ) ) ( not ( = ?auto_28816 ?auto_28815 ) ) ( not ( = ?auto_28810 ?auto_28815 ) ) ( AVAILABLE ?auto_28823 ) ( TRUCK-AT ?auto_28812 ?auto_28817 ) ( LIFTING ?auto_28809 ?auto_28816 ) )
    :subtasks
    ( ( !LOAD ?auto_28809 ?auto_28816 ?auto_28812 ?auto_28817 )
      ( MAKE-ON ?auto_28807 ?auto_28808 )
      ( MAKE-ON-VERIFY ?auto_28807 ?auto_28808 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28826 - SURFACE
      ?auto_28827 - SURFACE
    )
    :vars
    (
      ?auto_28834 - HOIST
      ?auto_28833 - PLACE
      ?auto_28831 - PLACE
      ?auto_28844 - HOIST
      ?auto_28842 - SURFACE
      ?auto_28832 - SURFACE
      ?auto_28830 - SURFACE
      ?auto_28835 - SURFACE
      ?auto_28840 - PLACE
      ?auto_28838 - HOIST
      ?auto_28837 - SURFACE
      ?auto_28839 - SURFACE
      ?auto_28828 - PLACE
      ?auto_28829 - HOIST
      ?auto_28836 - SURFACE
      ?auto_28841 - SURFACE
      ?auto_28843 - TRUCK
      ?auto_28845 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28834 ?auto_28833 ) ( IS-CRATE ?auto_28826 ) ( not ( = ?auto_28826 ?auto_28827 ) ) ( not ( = ?auto_28831 ?auto_28833 ) ) ( HOIST-AT ?auto_28844 ?auto_28831 ) ( not ( = ?auto_28834 ?auto_28844 ) ) ( SURFACE-AT ?auto_28826 ?auto_28831 ) ( ON ?auto_28826 ?auto_28842 ) ( CLEAR ?auto_28826 ) ( not ( = ?auto_28826 ?auto_28842 ) ) ( not ( = ?auto_28827 ?auto_28842 ) ) ( IS-CRATE ?auto_28827 ) ( not ( = ?auto_28826 ?auto_28832 ) ) ( not ( = ?auto_28827 ?auto_28832 ) ) ( not ( = ?auto_28842 ?auto_28832 ) ) ( AVAILABLE ?auto_28844 ) ( SURFACE-AT ?auto_28827 ?auto_28831 ) ( ON ?auto_28827 ?auto_28830 ) ( CLEAR ?auto_28827 ) ( not ( = ?auto_28826 ?auto_28830 ) ) ( not ( = ?auto_28827 ?auto_28830 ) ) ( not ( = ?auto_28842 ?auto_28830 ) ) ( not ( = ?auto_28832 ?auto_28830 ) ) ( IS-CRATE ?auto_28832 ) ( not ( = ?auto_28826 ?auto_28835 ) ) ( not ( = ?auto_28827 ?auto_28835 ) ) ( not ( = ?auto_28842 ?auto_28835 ) ) ( not ( = ?auto_28832 ?auto_28835 ) ) ( not ( = ?auto_28830 ?auto_28835 ) ) ( not ( = ?auto_28840 ?auto_28833 ) ) ( not ( = ?auto_28831 ?auto_28840 ) ) ( HOIST-AT ?auto_28838 ?auto_28840 ) ( not ( = ?auto_28834 ?auto_28838 ) ) ( not ( = ?auto_28844 ?auto_28838 ) ) ( AVAILABLE ?auto_28838 ) ( SURFACE-AT ?auto_28832 ?auto_28840 ) ( ON ?auto_28832 ?auto_28837 ) ( CLEAR ?auto_28832 ) ( not ( = ?auto_28826 ?auto_28837 ) ) ( not ( = ?auto_28827 ?auto_28837 ) ) ( not ( = ?auto_28842 ?auto_28837 ) ) ( not ( = ?auto_28832 ?auto_28837 ) ) ( not ( = ?auto_28830 ?auto_28837 ) ) ( not ( = ?auto_28835 ?auto_28837 ) ) ( IS-CRATE ?auto_28835 ) ( not ( = ?auto_28826 ?auto_28839 ) ) ( not ( = ?auto_28827 ?auto_28839 ) ) ( not ( = ?auto_28842 ?auto_28839 ) ) ( not ( = ?auto_28832 ?auto_28839 ) ) ( not ( = ?auto_28830 ?auto_28839 ) ) ( not ( = ?auto_28835 ?auto_28839 ) ) ( not ( = ?auto_28837 ?auto_28839 ) ) ( not ( = ?auto_28828 ?auto_28833 ) ) ( not ( = ?auto_28831 ?auto_28828 ) ) ( not ( = ?auto_28840 ?auto_28828 ) ) ( HOIST-AT ?auto_28829 ?auto_28828 ) ( not ( = ?auto_28834 ?auto_28829 ) ) ( not ( = ?auto_28844 ?auto_28829 ) ) ( not ( = ?auto_28838 ?auto_28829 ) ) ( SURFACE-AT ?auto_28835 ?auto_28828 ) ( ON ?auto_28835 ?auto_28836 ) ( CLEAR ?auto_28835 ) ( not ( = ?auto_28826 ?auto_28836 ) ) ( not ( = ?auto_28827 ?auto_28836 ) ) ( not ( = ?auto_28842 ?auto_28836 ) ) ( not ( = ?auto_28832 ?auto_28836 ) ) ( not ( = ?auto_28830 ?auto_28836 ) ) ( not ( = ?auto_28835 ?auto_28836 ) ) ( not ( = ?auto_28837 ?auto_28836 ) ) ( not ( = ?auto_28839 ?auto_28836 ) ) ( SURFACE-AT ?auto_28841 ?auto_28833 ) ( CLEAR ?auto_28841 ) ( IS-CRATE ?auto_28839 ) ( not ( = ?auto_28826 ?auto_28841 ) ) ( not ( = ?auto_28827 ?auto_28841 ) ) ( not ( = ?auto_28842 ?auto_28841 ) ) ( not ( = ?auto_28832 ?auto_28841 ) ) ( not ( = ?auto_28830 ?auto_28841 ) ) ( not ( = ?auto_28835 ?auto_28841 ) ) ( not ( = ?auto_28837 ?auto_28841 ) ) ( not ( = ?auto_28839 ?auto_28841 ) ) ( not ( = ?auto_28836 ?auto_28841 ) ) ( AVAILABLE ?auto_28834 ) ( TRUCK-AT ?auto_28843 ?auto_28828 ) ( AVAILABLE ?auto_28829 ) ( SURFACE-AT ?auto_28839 ?auto_28828 ) ( ON ?auto_28839 ?auto_28845 ) ( CLEAR ?auto_28839 ) ( not ( = ?auto_28826 ?auto_28845 ) ) ( not ( = ?auto_28827 ?auto_28845 ) ) ( not ( = ?auto_28842 ?auto_28845 ) ) ( not ( = ?auto_28832 ?auto_28845 ) ) ( not ( = ?auto_28830 ?auto_28845 ) ) ( not ( = ?auto_28835 ?auto_28845 ) ) ( not ( = ?auto_28837 ?auto_28845 ) ) ( not ( = ?auto_28839 ?auto_28845 ) ) ( not ( = ?auto_28836 ?auto_28845 ) ) ( not ( = ?auto_28841 ?auto_28845 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28829 ?auto_28839 ?auto_28845 ?auto_28828 )
      ( MAKE-ON ?auto_28826 ?auto_28827 )
      ( MAKE-ON-VERIFY ?auto_28826 ?auto_28827 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28846 - SURFACE
      ?auto_28847 - SURFACE
    )
    :vars
    (
      ?auto_28852 - HOIST
      ?auto_28854 - PLACE
      ?auto_28851 - PLACE
      ?auto_28858 - HOIST
      ?auto_28859 - SURFACE
      ?auto_28850 - SURFACE
      ?auto_28860 - SURFACE
      ?auto_28865 - SURFACE
      ?auto_28855 - PLACE
      ?auto_28853 - HOIST
      ?auto_28856 - SURFACE
      ?auto_28863 - SURFACE
      ?auto_28864 - PLACE
      ?auto_28848 - HOIST
      ?auto_28861 - SURFACE
      ?auto_28849 - SURFACE
      ?auto_28857 - SURFACE
      ?auto_28862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28852 ?auto_28854 ) ( IS-CRATE ?auto_28846 ) ( not ( = ?auto_28846 ?auto_28847 ) ) ( not ( = ?auto_28851 ?auto_28854 ) ) ( HOIST-AT ?auto_28858 ?auto_28851 ) ( not ( = ?auto_28852 ?auto_28858 ) ) ( SURFACE-AT ?auto_28846 ?auto_28851 ) ( ON ?auto_28846 ?auto_28859 ) ( CLEAR ?auto_28846 ) ( not ( = ?auto_28846 ?auto_28859 ) ) ( not ( = ?auto_28847 ?auto_28859 ) ) ( IS-CRATE ?auto_28847 ) ( not ( = ?auto_28846 ?auto_28850 ) ) ( not ( = ?auto_28847 ?auto_28850 ) ) ( not ( = ?auto_28859 ?auto_28850 ) ) ( AVAILABLE ?auto_28858 ) ( SURFACE-AT ?auto_28847 ?auto_28851 ) ( ON ?auto_28847 ?auto_28860 ) ( CLEAR ?auto_28847 ) ( not ( = ?auto_28846 ?auto_28860 ) ) ( not ( = ?auto_28847 ?auto_28860 ) ) ( not ( = ?auto_28859 ?auto_28860 ) ) ( not ( = ?auto_28850 ?auto_28860 ) ) ( IS-CRATE ?auto_28850 ) ( not ( = ?auto_28846 ?auto_28865 ) ) ( not ( = ?auto_28847 ?auto_28865 ) ) ( not ( = ?auto_28859 ?auto_28865 ) ) ( not ( = ?auto_28850 ?auto_28865 ) ) ( not ( = ?auto_28860 ?auto_28865 ) ) ( not ( = ?auto_28855 ?auto_28854 ) ) ( not ( = ?auto_28851 ?auto_28855 ) ) ( HOIST-AT ?auto_28853 ?auto_28855 ) ( not ( = ?auto_28852 ?auto_28853 ) ) ( not ( = ?auto_28858 ?auto_28853 ) ) ( AVAILABLE ?auto_28853 ) ( SURFACE-AT ?auto_28850 ?auto_28855 ) ( ON ?auto_28850 ?auto_28856 ) ( CLEAR ?auto_28850 ) ( not ( = ?auto_28846 ?auto_28856 ) ) ( not ( = ?auto_28847 ?auto_28856 ) ) ( not ( = ?auto_28859 ?auto_28856 ) ) ( not ( = ?auto_28850 ?auto_28856 ) ) ( not ( = ?auto_28860 ?auto_28856 ) ) ( not ( = ?auto_28865 ?auto_28856 ) ) ( IS-CRATE ?auto_28865 ) ( not ( = ?auto_28846 ?auto_28863 ) ) ( not ( = ?auto_28847 ?auto_28863 ) ) ( not ( = ?auto_28859 ?auto_28863 ) ) ( not ( = ?auto_28850 ?auto_28863 ) ) ( not ( = ?auto_28860 ?auto_28863 ) ) ( not ( = ?auto_28865 ?auto_28863 ) ) ( not ( = ?auto_28856 ?auto_28863 ) ) ( not ( = ?auto_28864 ?auto_28854 ) ) ( not ( = ?auto_28851 ?auto_28864 ) ) ( not ( = ?auto_28855 ?auto_28864 ) ) ( HOIST-AT ?auto_28848 ?auto_28864 ) ( not ( = ?auto_28852 ?auto_28848 ) ) ( not ( = ?auto_28858 ?auto_28848 ) ) ( not ( = ?auto_28853 ?auto_28848 ) ) ( SURFACE-AT ?auto_28865 ?auto_28864 ) ( ON ?auto_28865 ?auto_28861 ) ( CLEAR ?auto_28865 ) ( not ( = ?auto_28846 ?auto_28861 ) ) ( not ( = ?auto_28847 ?auto_28861 ) ) ( not ( = ?auto_28859 ?auto_28861 ) ) ( not ( = ?auto_28850 ?auto_28861 ) ) ( not ( = ?auto_28860 ?auto_28861 ) ) ( not ( = ?auto_28865 ?auto_28861 ) ) ( not ( = ?auto_28856 ?auto_28861 ) ) ( not ( = ?auto_28863 ?auto_28861 ) ) ( SURFACE-AT ?auto_28849 ?auto_28854 ) ( CLEAR ?auto_28849 ) ( IS-CRATE ?auto_28863 ) ( not ( = ?auto_28846 ?auto_28849 ) ) ( not ( = ?auto_28847 ?auto_28849 ) ) ( not ( = ?auto_28859 ?auto_28849 ) ) ( not ( = ?auto_28850 ?auto_28849 ) ) ( not ( = ?auto_28860 ?auto_28849 ) ) ( not ( = ?auto_28865 ?auto_28849 ) ) ( not ( = ?auto_28856 ?auto_28849 ) ) ( not ( = ?auto_28863 ?auto_28849 ) ) ( not ( = ?auto_28861 ?auto_28849 ) ) ( AVAILABLE ?auto_28852 ) ( AVAILABLE ?auto_28848 ) ( SURFACE-AT ?auto_28863 ?auto_28864 ) ( ON ?auto_28863 ?auto_28857 ) ( CLEAR ?auto_28863 ) ( not ( = ?auto_28846 ?auto_28857 ) ) ( not ( = ?auto_28847 ?auto_28857 ) ) ( not ( = ?auto_28859 ?auto_28857 ) ) ( not ( = ?auto_28850 ?auto_28857 ) ) ( not ( = ?auto_28860 ?auto_28857 ) ) ( not ( = ?auto_28865 ?auto_28857 ) ) ( not ( = ?auto_28856 ?auto_28857 ) ) ( not ( = ?auto_28863 ?auto_28857 ) ) ( not ( = ?auto_28861 ?auto_28857 ) ) ( not ( = ?auto_28849 ?auto_28857 ) ) ( TRUCK-AT ?auto_28862 ?auto_28854 ) )
    :subtasks
    ( ( !DRIVE ?auto_28862 ?auto_28854 ?auto_28864 )
      ( MAKE-ON ?auto_28846 ?auto_28847 )
      ( MAKE-ON-VERIFY ?auto_28846 ?auto_28847 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28866 - SURFACE
      ?auto_28867 - SURFACE
    )
    :vars
    (
      ?auto_28878 - HOIST
      ?auto_28883 - PLACE
      ?auto_28880 - PLACE
      ?auto_28882 - HOIST
      ?auto_28884 - SURFACE
      ?auto_28870 - SURFACE
      ?auto_28876 - SURFACE
      ?auto_28879 - SURFACE
      ?auto_28874 - PLACE
      ?auto_28881 - HOIST
      ?auto_28871 - SURFACE
      ?auto_28869 - SURFACE
      ?auto_28873 - PLACE
      ?auto_28885 - HOIST
      ?auto_28875 - SURFACE
      ?auto_28877 - SURFACE
      ?auto_28872 - SURFACE
      ?auto_28868 - TRUCK
      ?auto_28886 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28878 ?auto_28883 ) ( IS-CRATE ?auto_28866 ) ( not ( = ?auto_28866 ?auto_28867 ) ) ( not ( = ?auto_28880 ?auto_28883 ) ) ( HOIST-AT ?auto_28882 ?auto_28880 ) ( not ( = ?auto_28878 ?auto_28882 ) ) ( SURFACE-AT ?auto_28866 ?auto_28880 ) ( ON ?auto_28866 ?auto_28884 ) ( CLEAR ?auto_28866 ) ( not ( = ?auto_28866 ?auto_28884 ) ) ( not ( = ?auto_28867 ?auto_28884 ) ) ( IS-CRATE ?auto_28867 ) ( not ( = ?auto_28866 ?auto_28870 ) ) ( not ( = ?auto_28867 ?auto_28870 ) ) ( not ( = ?auto_28884 ?auto_28870 ) ) ( AVAILABLE ?auto_28882 ) ( SURFACE-AT ?auto_28867 ?auto_28880 ) ( ON ?auto_28867 ?auto_28876 ) ( CLEAR ?auto_28867 ) ( not ( = ?auto_28866 ?auto_28876 ) ) ( not ( = ?auto_28867 ?auto_28876 ) ) ( not ( = ?auto_28884 ?auto_28876 ) ) ( not ( = ?auto_28870 ?auto_28876 ) ) ( IS-CRATE ?auto_28870 ) ( not ( = ?auto_28866 ?auto_28879 ) ) ( not ( = ?auto_28867 ?auto_28879 ) ) ( not ( = ?auto_28884 ?auto_28879 ) ) ( not ( = ?auto_28870 ?auto_28879 ) ) ( not ( = ?auto_28876 ?auto_28879 ) ) ( not ( = ?auto_28874 ?auto_28883 ) ) ( not ( = ?auto_28880 ?auto_28874 ) ) ( HOIST-AT ?auto_28881 ?auto_28874 ) ( not ( = ?auto_28878 ?auto_28881 ) ) ( not ( = ?auto_28882 ?auto_28881 ) ) ( AVAILABLE ?auto_28881 ) ( SURFACE-AT ?auto_28870 ?auto_28874 ) ( ON ?auto_28870 ?auto_28871 ) ( CLEAR ?auto_28870 ) ( not ( = ?auto_28866 ?auto_28871 ) ) ( not ( = ?auto_28867 ?auto_28871 ) ) ( not ( = ?auto_28884 ?auto_28871 ) ) ( not ( = ?auto_28870 ?auto_28871 ) ) ( not ( = ?auto_28876 ?auto_28871 ) ) ( not ( = ?auto_28879 ?auto_28871 ) ) ( IS-CRATE ?auto_28879 ) ( not ( = ?auto_28866 ?auto_28869 ) ) ( not ( = ?auto_28867 ?auto_28869 ) ) ( not ( = ?auto_28884 ?auto_28869 ) ) ( not ( = ?auto_28870 ?auto_28869 ) ) ( not ( = ?auto_28876 ?auto_28869 ) ) ( not ( = ?auto_28879 ?auto_28869 ) ) ( not ( = ?auto_28871 ?auto_28869 ) ) ( not ( = ?auto_28873 ?auto_28883 ) ) ( not ( = ?auto_28880 ?auto_28873 ) ) ( not ( = ?auto_28874 ?auto_28873 ) ) ( HOIST-AT ?auto_28885 ?auto_28873 ) ( not ( = ?auto_28878 ?auto_28885 ) ) ( not ( = ?auto_28882 ?auto_28885 ) ) ( not ( = ?auto_28881 ?auto_28885 ) ) ( SURFACE-AT ?auto_28879 ?auto_28873 ) ( ON ?auto_28879 ?auto_28875 ) ( CLEAR ?auto_28879 ) ( not ( = ?auto_28866 ?auto_28875 ) ) ( not ( = ?auto_28867 ?auto_28875 ) ) ( not ( = ?auto_28884 ?auto_28875 ) ) ( not ( = ?auto_28870 ?auto_28875 ) ) ( not ( = ?auto_28876 ?auto_28875 ) ) ( not ( = ?auto_28879 ?auto_28875 ) ) ( not ( = ?auto_28871 ?auto_28875 ) ) ( not ( = ?auto_28869 ?auto_28875 ) ) ( IS-CRATE ?auto_28869 ) ( not ( = ?auto_28866 ?auto_28877 ) ) ( not ( = ?auto_28867 ?auto_28877 ) ) ( not ( = ?auto_28884 ?auto_28877 ) ) ( not ( = ?auto_28870 ?auto_28877 ) ) ( not ( = ?auto_28876 ?auto_28877 ) ) ( not ( = ?auto_28879 ?auto_28877 ) ) ( not ( = ?auto_28871 ?auto_28877 ) ) ( not ( = ?auto_28869 ?auto_28877 ) ) ( not ( = ?auto_28875 ?auto_28877 ) ) ( AVAILABLE ?auto_28885 ) ( SURFACE-AT ?auto_28869 ?auto_28873 ) ( ON ?auto_28869 ?auto_28872 ) ( CLEAR ?auto_28869 ) ( not ( = ?auto_28866 ?auto_28872 ) ) ( not ( = ?auto_28867 ?auto_28872 ) ) ( not ( = ?auto_28884 ?auto_28872 ) ) ( not ( = ?auto_28870 ?auto_28872 ) ) ( not ( = ?auto_28876 ?auto_28872 ) ) ( not ( = ?auto_28879 ?auto_28872 ) ) ( not ( = ?auto_28871 ?auto_28872 ) ) ( not ( = ?auto_28869 ?auto_28872 ) ) ( not ( = ?auto_28875 ?auto_28872 ) ) ( not ( = ?auto_28877 ?auto_28872 ) ) ( TRUCK-AT ?auto_28868 ?auto_28883 ) ( SURFACE-AT ?auto_28886 ?auto_28883 ) ( CLEAR ?auto_28886 ) ( LIFTING ?auto_28878 ?auto_28877 ) ( IS-CRATE ?auto_28877 ) ( not ( = ?auto_28866 ?auto_28886 ) ) ( not ( = ?auto_28867 ?auto_28886 ) ) ( not ( = ?auto_28884 ?auto_28886 ) ) ( not ( = ?auto_28870 ?auto_28886 ) ) ( not ( = ?auto_28876 ?auto_28886 ) ) ( not ( = ?auto_28879 ?auto_28886 ) ) ( not ( = ?auto_28871 ?auto_28886 ) ) ( not ( = ?auto_28869 ?auto_28886 ) ) ( not ( = ?auto_28875 ?auto_28886 ) ) ( not ( = ?auto_28877 ?auto_28886 ) ) ( not ( = ?auto_28872 ?auto_28886 ) ) )
    :subtasks
    ( ( !DROP ?auto_28878 ?auto_28877 ?auto_28886 ?auto_28883 )
      ( MAKE-ON ?auto_28866 ?auto_28867 )
      ( MAKE-ON-VERIFY ?auto_28866 ?auto_28867 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28887 - SURFACE
      ?auto_28888 - SURFACE
    )
    :vars
    (
      ?auto_28894 - HOIST
      ?auto_28901 - PLACE
      ?auto_28898 - PLACE
      ?auto_28899 - HOIST
      ?auto_28907 - SURFACE
      ?auto_28903 - SURFACE
      ?auto_28905 - SURFACE
      ?auto_28891 - SURFACE
      ?auto_28900 - PLACE
      ?auto_28893 - HOIST
      ?auto_28904 - SURFACE
      ?auto_28890 - SURFACE
      ?auto_28897 - PLACE
      ?auto_28892 - HOIST
      ?auto_28896 - SURFACE
      ?auto_28895 - SURFACE
      ?auto_28889 - SURFACE
      ?auto_28902 - TRUCK
      ?auto_28906 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28894 ?auto_28901 ) ( IS-CRATE ?auto_28887 ) ( not ( = ?auto_28887 ?auto_28888 ) ) ( not ( = ?auto_28898 ?auto_28901 ) ) ( HOIST-AT ?auto_28899 ?auto_28898 ) ( not ( = ?auto_28894 ?auto_28899 ) ) ( SURFACE-AT ?auto_28887 ?auto_28898 ) ( ON ?auto_28887 ?auto_28907 ) ( CLEAR ?auto_28887 ) ( not ( = ?auto_28887 ?auto_28907 ) ) ( not ( = ?auto_28888 ?auto_28907 ) ) ( IS-CRATE ?auto_28888 ) ( not ( = ?auto_28887 ?auto_28903 ) ) ( not ( = ?auto_28888 ?auto_28903 ) ) ( not ( = ?auto_28907 ?auto_28903 ) ) ( AVAILABLE ?auto_28899 ) ( SURFACE-AT ?auto_28888 ?auto_28898 ) ( ON ?auto_28888 ?auto_28905 ) ( CLEAR ?auto_28888 ) ( not ( = ?auto_28887 ?auto_28905 ) ) ( not ( = ?auto_28888 ?auto_28905 ) ) ( not ( = ?auto_28907 ?auto_28905 ) ) ( not ( = ?auto_28903 ?auto_28905 ) ) ( IS-CRATE ?auto_28903 ) ( not ( = ?auto_28887 ?auto_28891 ) ) ( not ( = ?auto_28888 ?auto_28891 ) ) ( not ( = ?auto_28907 ?auto_28891 ) ) ( not ( = ?auto_28903 ?auto_28891 ) ) ( not ( = ?auto_28905 ?auto_28891 ) ) ( not ( = ?auto_28900 ?auto_28901 ) ) ( not ( = ?auto_28898 ?auto_28900 ) ) ( HOIST-AT ?auto_28893 ?auto_28900 ) ( not ( = ?auto_28894 ?auto_28893 ) ) ( not ( = ?auto_28899 ?auto_28893 ) ) ( AVAILABLE ?auto_28893 ) ( SURFACE-AT ?auto_28903 ?auto_28900 ) ( ON ?auto_28903 ?auto_28904 ) ( CLEAR ?auto_28903 ) ( not ( = ?auto_28887 ?auto_28904 ) ) ( not ( = ?auto_28888 ?auto_28904 ) ) ( not ( = ?auto_28907 ?auto_28904 ) ) ( not ( = ?auto_28903 ?auto_28904 ) ) ( not ( = ?auto_28905 ?auto_28904 ) ) ( not ( = ?auto_28891 ?auto_28904 ) ) ( IS-CRATE ?auto_28891 ) ( not ( = ?auto_28887 ?auto_28890 ) ) ( not ( = ?auto_28888 ?auto_28890 ) ) ( not ( = ?auto_28907 ?auto_28890 ) ) ( not ( = ?auto_28903 ?auto_28890 ) ) ( not ( = ?auto_28905 ?auto_28890 ) ) ( not ( = ?auto_28891 ?auto_28890 ) ) ( not ( = ?auto_28904 ?auto_28890 ) ) ( not ( = ?auto_28897 ?auto_28901 ) ) ( not ( = ?auto_28898 ?auto_28897 ) ) ( not ( = ?auto_28900 ?auto_28897 ) ) ( HOIST-AT ?auto_28892 ?auto_28897 ) ( not ( = ?auto_28894 ?auto_28892 ) ) ( not ( = ?auto_28899 ?auto_28892 ) ) ( not ( = ?auto_28893 ?auto_28892 ) ) ( SURFACE-AT ?auto_28891 ?auto_28897 ) ( ON ?auto_28891 ?auto_28896 ) ( CLEAR ?auto_28891 ) ( not ( = ?auto_28887 ?auto_28896 ) ) ( not ( = ?auto_28888 ?auto_28896 ) ) ( not ( = ?auto_28907 ?auto_28896 ) ) ( not ( = ?auto_28903 ?auto_28896 ) ) ( not ( = ?auto_28905 ?auto_28896 ) ) ( not ( = ?auto_28891 ?auto_28896 ) ) ( not ( = ?auto_28904 ?auto_28896 ) ) ( not ( = ?auto_28890 ?auto_28896 ) ) ( IS-CRATE ?auto_28890 ) ( not ( = ?auto_28887 ?auto_28895 ) ) ( not ( = ?auto_28888 ?auto_28895 ) ) ( not ( = ?auto_28907 ?auto_28895 ) ) ( not ( = ?auto_28903 ?auto_28895 ) ) ( not ( = ?auto_28905 ?auto_28895 ) ) ( not ( = ?auto_28891 ?auto_28895 ) ) ( not ( = ?auto_28904 ?auto_28895 ) ) ( not ( = ?auto_28890 ?auto_28895 ) ) ( not ( = ?auto_28896 ?auto_28895 ) ) ( AVAILABLE ?auto_28892 ) ( SURFACE-AT ?auto_28890 ?auto_28897 ) ( ON ?auto_28890 ?auto_28889 ) ( CLEAR ?auto_28890 ) ( not ( = ?auto_28887 ?auto_28889 ) ) ( not ( = ?auto_28888 ?auto_28889 ) ) ( not ( = ?auto_28907 ?auto_28889 ) ) ( not ( = ?auto_28903 ?auto_28889 ) ) ( not ( = ?auto_28905 ?auto_28889 ) ) ( not ( = ?auto_28891 ?auto_28889 ) ) ( not ( = ?auto_28904 ?auto_28889 ) ) ( not ( = ?auto_28890 ?auto_28889 ) ) ( not ( = ?auto_28896 ?auto_28889 ) ) ( not ( = ?auto_28895 ?auto_28889 ) ) ( TRUCK-AT ?auto_28902 ?auto_28901 ) ( SURFACE-AT ?auto_28906 ?auto_28901 ) ( CLEAR ?auto_28906 ) ( IS-CRATE ?auto_28895 ) ( not ( = ?auto_28887 ?auto_28906 ) ) ( not ( = ?auto_28888 ?auto_28906 ) ) ( not ( = ?auto_28907 ?auto_28906 ) ) ( not ( = ?auto_28903 ?auto_28906 ) ) ( not ( = ?auto_28905 ?auto_28906 ) ) ( not ( = ?auto_28891 ?auto_28906 ) ) ( not ( = ?auto_28904 ?auto_28906 ) ) ( not ( = ?auto_28890 ?auto_28906 ) ) ( not ( = ?auto_28896 ?auto_28906 ) ) ( not ( = ?auto_28895 ?auto_28906 ) ) ( not ( = ?auto_28889 ?auto_28906 ) ) ( AVAILABLE ?auto_28894 ) ( IN ?auto_28895 ?auto_28902 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28894 ?auto_28895 ?auto_28902 ?auto_28901 )
      ( MAKE-ON ?auto_28887 ?auto_28888 )
      ( MAKE-ON-VERIFY ?auto_28887 ?auto_28888 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28908 - SURFACE
      ?auto_28909 - SURFACE
    )
    :vars
    (
      ?auto_28913 - HOIST
      ?auto_28927 - PLACE
      ?auto_28914 - PLACE
      ?auto_28928 - HOIST
      ?auto_28916 - SURFACE
      ?auto_28926 - SURFACE
      ?auto_28919 - SURFACE
      ?auto_28911 - SURFACE
      ?auto_28922 - PLACE
      ?auto_28924 - HOIST
      ?auto_28912 - SURFACE
      ?auto_28920 - SURFACE
      ?auto_28918 - PLACE
      ?auto_28925 - HOIST
      ?auto_28921 - SURFACE
      ?auto_28917 - SURFACE
      ?auto_28910 - SURFACE
      ?auto_28915 - SURFACE
      ?auto_28923 - TRUCK
      ?auto_28929 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28913 ?auto_28927 ) ( IS-CRATE ?auto_28908 ) ( not ( = ?auto_28908 ?auto_28909 ) ) ( not ( = ?auto_28914 ?auto_28927 ) ) ( HOIST-AT ?auto_28928 ?auto_28914 ) ( not ( = ?auto_28913 ?auto_28928 ) ) ( SURFACE-AT ?auto_28908 ?auto_28914 ) ( ON ?auto_28908 ?auto_28916 ) ( CLEAR ?auto_28908 ) ( not ( = ?auto_28908 ?auto_28916 ) ) ( not ( = ?auto_28909 ?auto_28916 ) ) ( IS-CRATE ?auto_28909 ) ( not ( = ?auto_28908 ?auto_28926 ) ) ( not ( = ?auto_28909 ?auto_28926 ) ) ( not ( = ?auto_28916 ?auto_28926 ) ) ( AVAILABLE ?auto_28928 ) ( SURFACE-AT ?auto_28909 ?auto_28914 ) ( ON ?auto_28909 ?auto_28919 ) ( CLEAR ?auto_28909 ) ( not ( = ?auto_28908 ?auto_28919 ) ) ( not ( = ?auto_28909 ?auto_28919 ) ) ( not ( = ?auto_28916 ?auto_28919 ) ) ( not ( = ?auto_28926 ?auto_28919 ) ) ( IS-CRATE ?auto_28926 ) ( not ( = ?auto_28908 ?auto_28911 ) ) ( not ( = ?auto_28909 ?auto_28911 ) ) ( not ( = ?auto_28916 ?auto_28911 ) ) ( not ( = ?auto_28926 ?auto_28911 ) ) ( not ( = ?auto_28919 ?auto_28911 ) ) ( not ( = ?auto_28922 ?auto_28927 ) ) ( not ( = ?auto_28914 ?auto_28922 ) ) ( HOIST-AT ?auto_28924 ?auto_28922 ) ( not ( = ?auto_28913 ?auto_28924 ) ) ( not ( = ?auto_28928 ?auto_28924 ) ) ( AVAILABLE ?auto_28924 ) ( SURFACE-AT ?auto_28926 ?auto_28922 ) ( ON ?auto_28926 ?auto_28912 ) ( CLEAR ?auto_28926 ) ( not ( = ?auto_28908 ?auto_28912 ) ) ( not ( = ?auto_28909 ?auto_28912 ) ) ( not ( = ?auto_28916 ?auto_28912 ) ) ( not ( = ?auto_28926 ?auto_28912 ) ) ( not ( = ?auto_28919 ?auto_28912 ) ) ( not ( = ?auto_28911 ?auto_28912 ) ) ( IS-CRATE ?auto_28911 ) ( not ( = ?auto_28908 ?auto_28920 ) ) ( not ( = ?auto_28909 ?auto_28920 ) ) ( not ( = ?auto_28916 ?auto_28920 ) ) ( not ( = ?auto_28926 ?auto_28920 ) ) ( not ( = ?auto_28919 ?auto_28920 ) ) ( not ( = ?auto_28911 ?auto_28920 ) ) ( not ( = ?auto_28912 ?auto_28920 ) ) ( not ( = ?auto_28918 ?auto_28927 ) ) ( not ( = ?auto_28914 ?auto_28918 ) ) ( not ( = ?auto_28922 ?auto_28918 ) ) ( HOIST-AT ?auto_28925 ?auto_28918 ) ( not ( = ?auto_28913 ?auto_28925 ) ) ( not ( = ?auto_28928 ?auto_28925 ) ) ( not ( = ?auto_28924 ?auto_28925 ) ) ( SURFACE-AT ?auto_28911 ?auto_28918 ) ( ON ?auto_28911 ?auto_28921 ) ( CLEAR ?auto_28911 ) ( not ( = ?auto_28908 ?auto_28921 ) ) ( not ( = ?auto_28909 ?auto_28921 ) ) ( not ( = ?auto_28916 ?auto_28921 ) ) ( not ( = ?auto_28926 ?auto_28921 ) ) ( not ( = ?auto_28919 ?auto_28921 ) ) ( not ( = ?auto_28911 ?auto_28921 ) ) ( not ( = ?auto_28912 ?auto_28921 ) ) ( not ( = ?auto_28920 ?auto_28921 ) ) ( IS-CRATE ?auto_28920 ) ( not ( = ?auto_28908 ?auto_28917 ) ) ( not ( = ?auto_28909 ?auto_28917 ) ) ( not ( = ?auto_28916 ?auto_28917 ) ) ( not ( = ?auto_28926 ?auto_28917 ) ) ( not ( = ?auto_28919 ?auto_28917 ) ) ( not ( = ?auto_28911 ?auto_28917 ) ) ( not ( = ?auto_28912 ?auto_28917 ) ) ( not ( = ?auto_28920 ?auto_28917 ) ) ( not ( = ?auto_28921 ?auto_28917 ) ) ( AVAILABLE ?auto_28925 ) ( SURFACE-AT ?auto_28920 ?auto_28918 ) ( ON ?auto_28920 ?auto_28910 ) ( CLEAR ?auto_28920 ) ( not ( = ?auto_28908 ?auto_28910 ) ) ( not ( = ?auto_28909 ?auto_28910 ) ) ( not ( = ?auto_28916 ?auto_28910 ) ) ( not ( = ?auto_28926 ?auto_28910 ) ) ( not ( = ?auto_28919 ?auto_28910 ) ) ( not ( = ?auto_28911 ?auto_28910 ) ) ( not ( = ?auto_28912 ?auto_28910 ) ) ( not ( = ?auto_28920 ?auto_28910 ) ) ( not ( = ?auto_28921 ?auto_28910 ) ) ( not ( = ?auto_28917 ?auto_28910 ) ) ( SURFACE-AT ?auto_28915 ?auto_28927 ) ( CLEAR ?auto_28915 ) ( IS-CRATE ?auto_28917 ) ( not ( = ?auto_28908 ?auto_28915 ) ) ( not ( = ?auto_28909 ?auto_28915 ) ) ( not ( = ?auto_28916 ?auto_28915 ) ) ( not ( = ?auto_28926 ?auto_28915 ) ) ( not ( = ?auto_28919 ?auto_28915 ) ) ( not ( = ?auto_28911 ?auto_28915 ) ) ( not ( = ?auto_28912 ?auto_28915 ) ) ( not ( = ?auto_28920 ?auto_28915 ) ) ( not ( = ?auto_28921 ?auto_28915 ) ) ( not ( = ?auto_28917 ?auto_28915 ) ) ( not ( = ?auto_28910 ?auto_28915 ) ) ( AVAILABLE ?auto_28913 ) ( IN ?auto_28917 ?auto_28923 ) ( TRUCK-AT ?auto_28923 ?auto_28929 ) ( not ( = ?auto_28929 ?auto_28927 ) ) ( not ( = ?auto_28914 ?auto_28929 ) ) ( not ( = ?auto_28922 ?auto_28929 ) ) ( not ( = ?auto_28918 ?auto_28929 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28923 ?auto_28929 ?auto_28927 )
      ( MAKE-ON ?auto_28908 ?auto_28909 )
      ( MAKE-ON-VERIFY ?auto_28908 ?auto_28909 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28930 - SURFACE
      ?auto_28931 - SURFACE
    )
    :vars
    (
      ?auto_28942 - HOIST
      ?auto_28933 - PLACE
      ?auto_28941 - PLACE
      ?auto_28934 - HOIST
      ?auto_28947 - SURFACE
      ?auto_28935 - SURFACE
      ?auto_28940 - SURFACE
      ?auto_28951 - SURFACE
      ?auto_28944 - PLACE
      ?auto_28949 - HOIST
      ?auto_28945 - SURFACE
      ?auto_28939 - SURFACE
      ?auto_28936 - PLACE
      ?auto_28946 - HOIST
      ?auto_28943 - SURFACE
      ?auto_28950 - SURFACE
      ?auto_28937 - SURFACE
      ?auto_28932 - SURFACE
      ?auto_28948 - TRUCK
      ?auto_28938 - PLACE
      ?auto_28952 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28942 ?auto_28933 ) ( IS-CRATE ?auto_28930 ) ( not ( = ?auto_28930 ?auto_28931 ) ) ( not ( = ?auto_28941 ?auto_28933 ) ) ( HOIST-AT ?auto_28934 ?auto_28941 ) ( not ( = ?auto_28942 ?auto_28934 ) ) ( SURFACE-AT ?auto_28930 ?auto_28941 ) ( ON ?auto_28930 ?auto_28947 ) ( CLEAR ?auto_28930 ) ( not ( = ?auto_28930 ?auto_28947 ) ) ( not ( = ?auto_28931 ?auto_28947 ) ) ( IS-CRATE ?auto_28931 ) ( not ( = ?auto_28930 ?auto_28935 ) ) ( not ( = ?auto_28931 ?auto_28935 ) ) ( not ( = ?auto_28947 ?auto_28935 ) ) ( AVAILABLE ?auto_28934 ) ( SURFACE-AT ?auto_28931 ?auto_28941 ) ( ON ?auto_28931 ?auto_28940 ) ( CLEAR ?auto_28931 ) ( not ( = ?auto_28930 ?auto_28940 ) ) ( not ( = ?auto_28931 ?auto_28940 ) ) ( not ( = ?auto_28947 ?auto_28940 ) ) ( not ( = ?auto_28935 ?auto_28940 ) ) ( IS-CRATE ?auto_28935 ) ( not ( = ?auto_28930 ?auto_28951 ) ) ( not ( = ?auto_28931 ?auto_28951 ) ) ( not ( = ?auto_28947 ?auto_28951 ) ) ( not ( = ?auto_28935 ?auto_28951 ) ) ( not ( = ?auto_28940 ?auto_28951 ) ) ( not ( = ?auto_28944 ?auto_28933 ) ) ( not ( = ?auto_28941 ?auto_28944 ) ) ( HOIST-AT ?auto_28949 ?auto_28944 ) ( not ( = ?auto_28942 ?auto_28949 ) ) ( not ( = ?auto_28934 ?auto_28949 ) ) ( AVAILABLE ?auto_28949 ) ( SURFACE-AT ?auto_28935 ?auto_28944 ) ( ON ?auto_28935 ?auto_28945 ) ( CLEAR ?auto_28935 ) ( not ( = ?auto_28930 ?auto_28945 ) ) ( not ( = ?auto_28931 ?auto_28945 ) ) ( not ( = ?auto_28947 ?auto_28945 ) ) ( not ( = ?auto_28935 ?auto_28945 ) ) ( not ( = ?auto_28940 ?auto_28945 ) ) ( not ( = ?auto_28951 ?auto_28945 ) ) ( IS-CRATE ?auto_28951 ) ( not ( = ?auto_28930 ?auto_28939 ) ) ( not ( = ?auto_28931 ?auto_28939 ) ) ( not ( = ?auto_28947 ?auto_28939 ) ) ( not ( = ?auto_28935 ?auto_28939 ) ) ( not ( = ?auto_28940 ?auto_28939 ) ) ( not ( = ?auto_28951 ?auto_28939 ) ) ( not ( = ?auto_28945 ?auto_28939 ) ) ( not ( = ?auto_28936 ?auto_28933 ) ) ( not ( = ?auto_28941 ?auto_28936 ) ) ( not ( = ?auto_28944 ?auto_28936 ) ) ( HOIST-AT ?auto_28946 ?auto_28936 ) ( not ( = ?auto_28942 ?auto_28946 ) ) ( not ( = ?auto_28934 ?auto_28946 ) ) ( not ( = ?auto_28949 ?auto_28946 ) ) ( SURFACE-AT ?auto_28951 ?auto_28936 ) ( ON ?auto_28951 ?auto_28943 ) ( CLEAR ?auto_28951 ) ( not ( = ?auto_28930 ?auto_28943 ) ) ( not ( = ?auto_28931 ?auto_28943 ) ) ( not ( = ?auto_28947 ?auto_28943 ) ) ( not ( = ?auto_28935 ?auto_28943 ) ) ( not ( = ?auto_28940 ?auto_28943 ) ) ( not ( = ?auto_28951 ?auto_28943 ) ) ( not ( = ?auto_28945 ?auto_28943 ) ) ( not ( = ?auto_28939 ?auto_28943 ) ) ( IS-CRATE ?auto_28939 ) ( not ( = ?auto_28930 ?auto_28950 ) ) ( not ( = ?auto_28931 ?auto_28950 ) ) ( not ( = ?auto_28947 ?auto_28950 ) ) ( not ( = ?auto_28935 ?auto_28950 ) ) ( not ( = ?auto_28940 ?auto_28950 ) ) ( not ( = ?auto_28951 ?auto_28950 ) ) ( not ( = ?auto_28945 ?auto_28950 ) ) ( not ( = ?auto_28939 ?auto_28950 ) ) ( not ( = ?auto_28943 ?auto_28950 ) ) ( AVAILABLE ?auto_28946 ) ( SURFACE-AT ?auto_28939 ?auto_28936 ) ( ON ?auto_28939 ?auto_28937 ) ( CLEAR ?auto_28939 ) ( not ( = ?auto_28930 ?auto_28937 ) ) ( not ( = ?auto_28931 ?auto_28937 ) ) ( not ( = ?auto_28947 ?auto_28937 ) ) ( not ( = ?auto_28935 ?auto_28937 ) ) ( not ( = ?auto_28940 ?auto_28937 ) ) ( not ( = ?auto_28951 ?auto_28937 ) ) ( not ( = ?auto_28945 ?auto_28937 ) ) ( not ( = ?auto_28939 ?auto_28937 ) ) ( not ( = ?auto_28943 ?auto_28937 ) ) ( not ( = ?auto_28950 ?auto_28937 ) ) ( SURFACE-AT ?auto_28932 ?auto_28933 ) ( CLEAR ?auto_28932 ) ( IS-CRATE ?auto_28950 ) ( not ( = ?auto_28930 ?auto_28932 ) ) ( not ( = ?auto_28931 ?auto_28932 ) ) ( not ( = ?auto_28947 ?auto_28932 ) ) ( not ( = ?auto_28935 ?auto_28932 ) ) ( not ( = ?auto_28940 ?auto_28932 ) ) ( not ( = ?auto_28951 ?auto_28932 ) ) ( not ( = ?auto_28945 ?auto_28932 ) ) ( not ( = ?auto_28939 ?auto_28932 ) ) ( not ( = ?auto_28943 ?auto_28932 ) ) ( not ( = ?auto_28950 ?auto_28932 ) ) ( not ( = ?auto_28937 ?auto_28932 ) ) ( AVAILABLE ?auto_28942 ) ( TRUCK-AT ?auto_28948 ?auto_28938 ) ( not ( = ?auto_28938 ?auto_28933 ) ) ( not ( = ?auto_28941 ?auto_28938 ) ) ( not ( = ?auto_28944 ?auto_28938 ) ) ( not ( = ?auto_28936 ?auto_28938 ) ) ( HOIST-AT ?auto_28952 ?auto_28938 ) ( LIFTING ?auto_28952 ?auto_28950 ) ( not ( = ?auto_28942 ?auto_28952 ) ) ( not ( = ?auto_28934 ?auto_28952 ) ) ( not ( = ?auto_28949 ?auto_28952 ) ) ( not ( = ?auto_28946 ?auto_28952 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28952 ?auto_28950 ?auto_28948 ?auto_28938 )
      ( MAKE-ON ?auto_28930 ?auto_28931 )
      ( MAKE-ON-VERIFY ?auto_28930 ?auto_28931 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28953 - SURFACE
      ?auto_28954 - SURFACE
    )
    :vars
    (
      ?auto_28966 - HOIST
      ?auto_28974 - PLACE
      ?auto_28959 - PLACE
      ?auto_28972 - HOIST
      ?auto_28964 - SURFACE
      ?auto_28973 - SURFACE
      ?auto_28969 - SURFACE
      ?auto_28965 - SURFACE
      ?auto_28968 - PLACE
      ?auto_28955 - HOIST
      ?auto_28956 - SURFACE
      ?auto_28971 - SURFACE
      ?auto_28975 - PLACE
      ?auto_28962 - HOIST
      ?auto_28967 - SURFACE
      ?auto_28960 - SURFACE
      ?auto_28970 - SURFACE
      ?auto_28961 - SURFACE
      ?auto_28957 - TRUCK
      ?auto_28958 - PLACE
      ?auto_28963 - HOIST
      ?auto_28976 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28966 ?auto_28974 ) ( IS-CRATE ?auto_28953 ) ( not ( = ?auto_28953 ?auto_28954 ) ) ( not ( = ?auto_28959 ?auto_28974 ) ) ( HOIST-AT ?auto_28972 ?auto_28959 ) ( not ( = ?auto_28966 ?auto_28972 ) ) ( SURFACE-AT ?auto_28953 ?auto_28959 ) ( ON ?auto_28953 ?auto_28964 ) ( CLEAR ?auto_28953 ) ( not ( = ?auto_28953 ?auto_28964 ) ) ( not ( = ?auto_28954 ?auto_28964 ) ) ( IS-CRATE ?auto_28954 ) ( not ( = ?auto_28953 ?auto_28973 ) ) ( not ( = ?auto_28954 ?auto_28973 ) ) ( not ( = ?auto_28964 ?auto_28973 ) ) ( AVAILABLE ?auto_28972 ) ( SURFACE-AT ?auto_28954 ?auto_28959 ) ( ON ?auto_28954 ?auto_28969 ) ( CLEAR ?auto_28954 ) ( not ( = ?auto_28953 ?auto_28969 ) ) ( not ( = ?auto_28954 ?auto_28969 ) ) ( not ( = ?auto_28964 ?auto_28969 ) ) ( not ( = ?auto_28973 ?auto_28969 ) ) ( IS-CRATE ?auto_28973 ) ( not ( = ?auto_28953 ?auto_28965 ) ) ( not ( = ?auto_28954 ?auto_28965 ) ) ( not ( = ?auto_28964 ?auto_28965 ) ) ( not ( = ?auto_28973 ?auto_28965 ) ) ( not ( = ?auto_28969 ?auto_28965 ) ) ( not ( = ?auto_28968 ?auto_28974 ) ) ( not ( = ?auto_28959 ?auto_28968 ) ) ( HOIST-AT ?auto_28955 ?auto_28968 ) ( not ( = ?auto_28966 ?auto_28955 ) ) ( not ( = ?auto_28972 ?auto_28955 ) ) ( AVAILABLE ?auto_28955 ) ( SURFACE-AT ?auto_28973 ?auto_28968 ) ( ON ?auto_28973 ?auto_28956 ) ( CLEAR ?auto_28973 ) ( not ( = ?auto_28953 ?auto_28956 ) ) ( not ( = ?auto_28954 ?auto_28956 ) ) ( not ( = ?auto_28964 ?auto_28956 ) ) ( not ( = ?auto_28973 ?auto_28956 ) ) ( not ( = ?auto_28969 ?auto_28956 ) ) ( not ( = ?auto_28965 ?auto_28956 ) ) ( IS-CRATE ?auto_28965 ) ( not ( = ?auto_28953 ?auto_28971 ) ) ( not ( = ?auto_28954 ?auto_28971 ) ) ( not ( = ?auto_28964 ?auto_28971 ) ) ( not ( = ?auto_28973 ?auto_28971 ) ) ( not ( = ?auto_28969 ?auto_28971 ) ) ( not ( = ?auto_28965 ?auto_28971 ) ) ( not ( = ?auto_28956 ?auto_28971 ) ) ( not ( = ?auto_28975 ?auto_28974 ) ) ( not ( = ?auto_28959 ?auto_28975 ) ) ( not ( = ?auto_28968 ?auto_28975 ) ) ( HOIST-AT ?auto_28962 ?auto_28975 ) ( not ( = ?auto_28966 ?auto_28962 ) ) ( not ( = ?auto_28972 ?auto_28962 ) ) ( not ( = ?auto_28955 ?auto_28962 ) ) ( SURFACE-AT ?auto_28965 ?auto_28975 ) ( ON ?auto_28965 ?auto_28967 ) ( CLEAR ?auto_28965 ) ( not ( = ?auto_28953 ?auto_28967 ) ) ( not ( = ?auto_28954 ?auto_28967 ) ) ( not ( = ?auto_28964 ?auto_28967 ) ) ( not ( = ?auto_28973 ?auto_28967 ) ) ( not ( = ?auto_28969 ?auto_28967 ) ) ( not ( = ?auto_28965 ?auto_28967 ) ) ( not ( = ?auto_28956 ?auto_28967 ) ) ( not ( = ?auto_28971 ?auto_28967 ) ) ( IS-CRATE ?auto_28971 ) ( not ( = ?auto_28953 ?auto_28960 ) ) ( not ( = ?auto_28954 ?auto_28960 ) ) ( not ( = ?auto_28964 ?auto_28960 ) ) ( not ( = ?auto_28973 ?auto_28960 ) ) ( not ( = ?auto_28969 ?auto_28960 ) ) ( not ( = ?auto_28965 ?auto_28960 ) ) ( not ( = ?auto_28956 ?auto_28960 ) ) ( not ( = ?auto_28971 ?auto_28960 ) ) ( not ( = ?auto_28967 ?auto_28960 ) ) ( AVAILABLE ?auto_28962 ) ( SURFACE-AT ?auto_28971 ?auto_28975 ) ( ON ?auto_28971 ?auto_28970 ) ( CLEAR ?auto_28971 ) ( not ( = ?auto_28953 ?auto_28970 ) ) ( not ( = ?auto_28954 ?auto_28970 ) ) ( not ( = ?auto_28964 ?auto_28970 ) ) ( not ( = ?auto_28973 ?auto_28970 ) ) ( not ( = ?auto_28969 ?auto_28970 ) ) ( not ( = ?auto_28965 ?auto_28970 ) ) ( not ( = ?auto_28956 ?auto_28970 ) ) ( not ( = ?auto_28971 ?auto_28970 ) ) ( not ( = ?auto_28967 ?auto_28970 ) ) ( not ( = ?auto_28960 ?auto_28970 ) ) ( SURFACE-AT ?auto_28961 ?auto_28974 ) ( CLEAR ?auto_28961 ) ( IS-CRATE ?auto_28960 ) ( not ( = ?auto_28953 ?auto_28961 ) ) ( not ( = ?auto_28954 ?auto_28961 ) ) ( not ( = ?auto_28964 ?auto_28961 ) ) ( not ( = ?auto_28973 ?auto_28961 ) ) ( not ( = ?auto_28969 ?auto_28961 ) ) ( not ( = ?auto_28965 ?auto_28961 ) ) ( not ( = ?auto_28956 ?auto_28961 ) ) ( not ( = ?auto_28971 ?auto_28961 ) ) ( not ( = ?auto_28967 ?auto_28961 ) ) ( not ( = ?auto_28960 ?auto_28961 ) ) ( not ( = ?auto_28970 ?auto_28961 ) ) ( AVAILABLE ?auto_28966 ) ( TRUCK-AT ?auto_28957 ?auto_28958 ) ( not ( = ?auto_28958 ?auto_28974 ) ) ( not ( = ?auto_28959 ?auto_28958 ) ) ( not ( = ?auto_28968 ?auto_28958 ) ) ( not ( = ?auto_28975 ?auto_28958 ) ) ( HOIST-AT ?auto_28963 ?auto_28958 ) ( not ( = ?auto_28966 ?auto_28963 ) ) ( not ( = ?auto_28972 ?auto_28963 ) ) ( not ( = ?auto_28955 ?auto_28963 ) ) ( not ( = ?auto_28962 ?auto_28963 ) ) ( AVAILABLE ?auto_28963 ) ( SURFACE-AT ?auto_28960 ?auto_28958 ) ( ON ?auto_28960 ?auto_28976 ) ( CLEAR ?auto_28960 ) ( not ( = ?auto_28953 ?auto_28976 ) ) ( not ( = ?auto_28954 ?auto_28976 ) ) ( not ( = ?auto_28964 ?auto_28976 ) ) ( not ( = ?auto_28973 ?auto_28976 ) ) ( not ( = ?auto_28969 ?auto_28976 ) ) ( not ( = ?auto_28965 ?auto_28976 ) ) ( not ( = ?auto_28956 ?auto_28976 ) ) ( not ( = ?auto_28971 ?auto_28976 ) ) ( not ( = ?auto_28967 ?auto_28976 ) ) ( not ( = ?auto_28960 ?auto_28976 ) ) ( not ( = ?auto_28970 ?auto_28976 ) ) ( not ( = ?auto_28961 ?auto_28976 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28963 ?auto_28960 ?auto_28976 ?auto_28958 )
      ( MAKE-ON ?auto_28953 ?auto_28954 )
      ( MAKE-ON-VERIFY ?auto_28953 ?auto_28954 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28977 - SURFACE
      ?auto_28978 - SURFACE
    )
    :vars
    (
      ?auto_28980 - HOIST
      ?auto_29000 - PLACE
      ?auto_28994 - PLACE
      ?auto_28999 - HOIST
      ?auto_28989 - SURFACE
      ?auto_28986 - SURFACE
      ?auto_28985 - SURFACE
      ?auto_28990 - SURFACE
      ?auto_28982 - PLACE
      ?auto_28992 - HOIST
      ?auto_28996 - SURFACE
      ?auto_28987 - SURFACE
      ?auto_28979 - PLACE
      ?auto_28983 - HOIST
      ?auto_28981 - SURFACE
      ?auto_28998 - SURFACE
      ?auto_28991 - SURFACE
      ?auto_28984 - SURFACE
      ?auto_28995 - PLACE
      ?auto_28997 - HOIST
      ?auto_28988 - SURFACE
      ?auto_28993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28980 ?auto_29000 ) ( IS-CRATE ?auto_28977 ) ( not ( = ?auto_28977 ?auto_28978 ) ) ( not ( = ?auto_28994 ?auto_29000 ) ) ( HOIST-AT ?auto_28999 ?auto_28994 ) ( not ( = ?auto_28980 ?auto_28999 ) ) ( SURFACE-AT ?auto_28977 ?auto_28994 ) ( ON ?auto_28977 ?auto_28989 ) ( CLEAR ?auto_28977 ) ( not ( = ?auto_28977 ?auto_28989 ) ) ( not ( = ?auto_28978 ?auto_28989 ) ) ( IS-CRATE ?auto_28978 ) ( not ( = ?auto_28977 ?auto_28986 ) ) ( not ( = ?auto_28978 ?auto_28986 ) ) ( not ( = ?auto_28989 ?auto_28986 ) ) ( AVAILABLE ?auto_28999 ) ( SURFACE-AT ?auto_28978 ?auto_28994 ) ( ON ?auto_28978 ?auto_28985 ) ( CLEAR ?auto_28978 ) ( not ( = ?auto_28977 ?auto_28985 ) ) ( not ( = ?auto_28978 ?auto_28985 ) ) ( not ( = ?auto_28989 ?auto_28985 ) ) ( not ( = ?auto_28986 ?auto_28985 ) ) ( IS-CRATE ?auto_28986 ) ( not ( = ?auto_28977 ?auto_28990 ) ) ( not ( = ?auto_28978 ?auto_28990 ) ) ( not ( = ?auto_28989 ?auto_28990 ) ) ( not ( = ?auto_28986 ?auto_28990 ) ) ( not ( = ?auto_28985 ?auto_28990 ) ) ( not ( = ?auto_28982 ?auto_29000 ) ) ( not ( = ?auto_28994 ?auto_28982 ) ) ( HOIST-AT ?auto_28992 ?auto_28982 ) ( not ( = ?auto_28980 ?auto_28992 ) ) ( not ( = ?auto_28999 ?auto_28992 ) ) ( AVAILABLE ?auto_28992 ) ( SURFACE-AT ?auto_28986 ?auto_28982 ) ( ON ?auto_28986 ?auto_28996 ) ( CLEAR ?auto_28986 ) ( not ( = ?auto_28977 ?auto_28996 ) ) ( not ( = ?auto_28978 ?auto_28996 ) ) ( not ( = ?auto_28989 ?auto_28996 ) ) ( not ( = ?auto_28986 ?auto_28996 ) ) ( not ( = ?auto_28985 ?auto_28996 ) ) ( not ( = ?auto_28990 ?auto_28996 ) ) ( IS-CRATE ?auto_28990 ) ( not ( = ?auto_28977 ?auto_28987 ) ) ( not ( = ?auto_28978 ?auto_28987 ) ) ( not ( = ?auto_28989 ?auto_28987 ) ) ( not ( = ?auto_28986 ?auto_28987 ) ) ( not ( = ?auto_28985 ?auto_28987 ) ) ( not ( = ?auto_28990 ?auto_28987 ) ) ( not ( = ?auto_28996 ?auto_28987 ) ) ( not ( = ?auto_28979 ?auto_29000 ) ) ( not ( = ?auto_28994 ?auto_28979 ) ) ( not ( = ?auto_28982 ?auto_28979 ) ) ( HOIST-AT ?auto_28983 ?auto_28979 ) ( not ( = ?auto_28980 ?auto_28983 ) ) ( not ( = ?auto_28999 ?auto_28983 ) ) ( not ( = ?auto_28992 ?auto_28983 ) ) ( SURFACE-AT ?auto_28990 ?auto_28979 ) ( ON ?auto_28990 ?auto_28981 ) ( CLEAR ?auto_28990 ) ( not ( = ?auto_28977 ?auto_28981 ) ) ( not ( = ?auto_28978 ?auto_28981 ) ) ( not ( = ?auto_28989 ?auto_28981 ) ) ( not ( = ?auto_28986 ?auto_28981 ) ) ( not ( = ?auto_28985 ?auto_28981 ) ) ( not ( = ?auto_28990 ?auto_28981 ) ) ( not ( = ?auto_28996 ?auto_28981 ) ) ( not ( = ?auto_28987 ?auto_28981 ) ) ( IS-CRATE ?auto_28987 ) ( not ( = ?auto_28977 ?auto_28998 ) ) ( not ( = ?auto_28978 ?auto_28998 ) ) ( not ( = ?auto_28989 ?auto_28998 ) ) ( not ( = ?auto_28986 ?auto_28998 ) ) ( not ( = ?auto_28985 ?auto_28998 ) ) ( not ( = ?auto_28990 ?auto_28998 ) ) ( not ( = ?auto_28996 ?auto_28998 ) ) ( not ( = ?auto_28987 ?auto_28998 ) ) ( not ( = ?auto_28981 ?auto_28998 ) ) ( AVAILABLE ?auto_28983 ) ( SURFACE-AT ?auto_28987 ?auto_28979 ) ( ON ?auto_28987 ?auto_28991 ) ( CLEAR ?auto_28987 ) ( not ( = ?auto_28977 ?auto_28991 ) ) ( not ( = ?auto_28978 ?auto_28991 ) ) ( not ( = ?auto_28989 ?auto_28991 ) ) ( not ( = ?auto_28986 ?auto_28991 ) ) ( not ( = ?auto_28985 ?auto_28991 ) ) ( not ( = ?auto_28990 ?auto_28991 ) ) ( not ( = ?auto_28996 ?auto_28991 ) ) ( not ( = ?auto_28987 ?auto_28991 ) ) ( not ( = ?auto_28981 ?auto_28991 ) ) ( not ( = ?auto_28998 ?auto_28991 ) ) ( SURFACE-AT ?auto_28984 ?auto_29000 ) ( CLEAR ?auto_28984 ) ( IS-CRATE ?auto_28998 ) ( not ( = ?auto_28977 ?auto_28984 ) ) ( not ( = ?auto_28978 ?auto_28984 ) ) ( not ( = ?auto_28989 ?auto_28984 ) ) ( not ( = ?auto_28986 ?auto_28984 ) ) ( not ( = ?auto_28985 ?auto_28984 ) ) ( not ( = ?auto_28990 ?auto_28984 ) ) ( not ( = ?auto_28996 ?auto_28984 ) ) ( not ( = ?auto_28987 ?auto_28984 ) ) ( not ( = ?auto_28981 ?auto_28984 ) ) ( not ( = ?auto_28998 ?auto_28984 ) ) ( not ( = ?auto_28991 ?auto_28984 ) ) ( AVAILABLE ?auto_28980 ) ( not ( = ?auto_28995 ?auto_29000 ) ) ( not ( = ?auto_28994 ?auto_28995 ) ) ( not ( = ?auto_28982 ?auto_28995 ) ) ( not ( = ?auto_28979 ?auto_28995 ) ) ( HOIST-AT ?auto_28997 ?auto_28995 ) ( not ( = ?auto_28980 ?auto_28997 ) ) ( not ( = ?auto_28999 ?auto_28997 ) ) ( not ( = ?auto_28992 ?auto_28997 ) ) ( not ( = ?auto_28983 ?auto_28997 ) ) ( AVAILABLE ?auto_28997 ) ( SURFACE-AT ?auto_28998 ?auto_28995 ) ( ON ?auto_28998 ?auto_28988 ) ( CLEAR ?auto_28998 ) ( not ( = ?auto_28977 ?auto_28988 ) ) ( not ( = ?auto_28978 ?auto_28988 ) ) ( not ( = ?auto_28989 ?auto_28988 ) ) ( not ( = ?auto_28986 ?auto_28988 ) ) ( not ( = ?auto_28985 ?auto_28988 ) ) ( not ( = ?auto_28990 ?auto_28988 ) ) ( not ( = ?auto_28996 ?auto_28988 ) ) ( not ( = ?auto_28987 ?auto_28988 ) ) ( not ( = ?auto_28981 ?auto_28988 ) ) ( not ( = ?auto_28998 ?auto_28988 ) ) ( not ( = ?auto_28991 ?auto_28988 ) ) ( not ( = ?auto_28984 ?auto_28988 ) ) ( TRUCK-AT ?auto_28993 ?auto_29000 ) )
    :subtasks
    ( ( !DRIVE ?auto_28993 ?auto_29000 ?auto_28995 )
      ( MAKE-ON ?auto_28977 ?auto_28978 )
      ( MAKE-ON-VERIFY ?auto_28977 ?auto_28978 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29003 - SURFACE
      ?auto_29004 - SURFACE
    )
    :vars
    (
      ?auto_29005 - HOIST
      ?auto_29006 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29005 ?auto_29006 ) ( SURFACE-AT ?auto_29004 ?auto_29006 ) ( CLEAR ?auto_29004 ) ( LIFTING ?auto_29005 ?auto_29003 ) ( IS-CRATE ?auto_29003 ) ( not ( = ?auto_29003 ?auto_29004 ) ) )
    :subtasks
    ( ( !DROP ?auto_29005 ?auto_29003 ?auto_29004 ?auto_29006 )
      ( MAKE-ON-VERIFY ?auto_29003 ?auto_29004 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29007 - SURFACE
      ?auto_29008 - SURFACE
    )
    :vars
    (
      ?auto_29010 - HOIST
      ?auto_29009 - PLACE
      ?auto_29011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29010 ?auto_29009 ) ( SURFACE-AT ?auto_29008 ?auto_29009 ) ( CLEAR ?auto_29008 ) ( IS-CRATE ?auto_29007 ) ( not ( = ?auto_29007 ?auto_29008 ) ) ( TRUCK-AT ?auto_29011 ?auto_29009 ) ( AVAILABLE ?auto_29010 ) ( IN ?auto_29007 ?auto_29011 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29010 ?auto_29007 ?auto_29011 ?auto_29009 )
      ( MAKE-ON ?auto_29007 ?auto_29008 )
      ( MAKE-ON-VERIFY ?auto_29007 ?auto_29008 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29012 - SURFACE
      ?auto_29013 - SURFACE
    )
    :vars
    (
      ?auto_29016 - HOIST
      ?auto_29015 - PLACE
      ?auto_29014 - TRUCK
      ?auto_29017 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29016 ?auto_29015 ) ( SURFACE-AT ?auto_29013 ?auto_29015 ) ( CLEAR ?auto_29013 ) ( IS-CRATE ?auto_29012 ) ( not ( = ?auto_29012 ?auto_29013 ) ) ( AVAILABLE ?auto_29016 ) ( IN ?auto_29012 ?auto_29014 ) ( TRUCK-AT ?auto_29014 ?auto_29017 ) ( not ( = ?auto_29017 ?auto_29015 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_29014 ?auto_29017 ?auto_29015 )
      ( MAKE-ON ?auto_29012 ?auto_29013 )
      ( MAKE-ON-VERIFY ?auto_29012 ?auto_29013 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29018 - SURFACE
      ?auto_29019 - SURFACE
    )
    :vars
    (
      ?auto_29021 - HOIST
      ?auto_29023 - PLACE
      ?auto_29022 - TRUCK
      ?auto_29020 - PLACE
      ?auto_29024 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29021 ?auto_29023 ) ( SURFACE-AT ?auto_29019 ?auto_29023 ) ( CLEAR ?auto_29019 ) ( IS-CRATE ?auto_29018 ) ( not ( = ?auto_29018 ?auto_29019 ) ) ( AVAILABLE ?auto_29021 ) ( TRUCK-AT ?auto_29022 ?auto_29020 ) ( not ( = ?auto_29020 ?auto_29023 ) ) ( HOIST-AT ?auto_29024 ?auto_29020 ) ( LIFTING ?auto_29024 ?auto_29018 ) ( not ( = ?auto_29021 ?auto_29024 ) ) )
    :subtasks
    ( ( !LOAD ?auto_29024 ?auto_29018 ?auto_29022 ?auto_29020 )
      ( MAKE-ON ?auto_29018 ?auto_29019 )
      ( MAKE-ON-VERIFY ?auto_29018 ?auto_29019 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29025 - SURFACE
      ?auto_29026 - SURFACE
    )
    :vars
    (
      ?auto_29027 - HOIST
      ?auto_29031 - PLACE
      ?auto_29029 - TRUCK
      ?auto_29030 - PLACE
      ?auto_29028 - HOIST
      ?auto_29032 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29027 ?auto_29031 ) ( SURFACE-AT ?auto_29026 ?auto_29031 ) ( CLEAR ?auto_29026 ) ( IS-CRATE ?auto_29025 ) ( not ( = ?auto_29025 ?auto_29026 ) ) ( AVAILABLE ?auto_29027 ) ( TRUCK-AT ?auto_29029 ?auto_29030 ) ( not ( = ?auto_29030 ?auto_29031 ) ) ( HOIST-AT ?auto_29028 ?auto_29030 ) ( not ( = ?auto_29027 ?auto_29028 ) ) ( AVAILABLE ?auto_29028 ) ( SURFACE-AT ?auto_29025 ?auto_29030 ) ( ON ?auto_29025 ?auto_29032 ) ( CLEAR ?auto_29025 ) ( not ( = ?auto_29025 ?auto_29032 ) ) ( not ( = ?auto_29026 ?auto_29032 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29028 ?auto_29025 ?auto_29032 ?auto_29030 )
      ( MAKE-ON ?auto_29025 ?auto_29026 )
      ( MAKE-ON-VERIFY ?auto_29025 ?auto_29026 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29033 - SURFACE
      ?auto_29034 - SURFACE
    )
    :vars
    (
      ?auto_29038 - HOIST
      ?auto_29035 - PLACE
      ?auto_29040 - PLACE
      ?auto_29037 - HOIST
      ?auto_29039 - SURFACE
      ?auto_29036 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29038 ?auto_29035 ) ( SURFACE-AT ?auto_29034 ?auto_29035 ) ( CLEAR ?auto_29034 ) ( IS-CRATE ?auto_29033 ) ( not ( = ?auto_29033 ?auto_29034 ) ) ( AVAILABLE ?auto_29038 ) ( not ( = ?auto_29040 ?auto_29035 ) ) ( HOIST-AT ?auto_29037 ?auto_29040 ) ( not ( = ?auto_29038 ?auto_29037 ) ) ( AVAILABLE ?auto_29037 ) ( SURFACE-AT ?auto_29033 ?auto_29040 ) ( ON ?auto_29033 ?auto_29039 ) ( CLEAR ?auto_29033 ) ( not ( = ?auto_29033 ?auto_29039 ) ) ( not ( = ?auto_29034 ?auto_29039 ) ) ( TRUCK-AT ?auto_29036 ?auto_29035 ) )
    :subtasks
    ( ( !DRIVE ?auto_29036 ?auto_29035 ?auto_29040 )
      ( MAKE-ON ?auto_29033 ?auto_29034 )
      ( MAKE-ON-VERIFY ?auto_29033 ?auto_29034 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29041 - SURFACE
      ?auto_29042 - SURFACE
    )
    :vars
    (
      ?auto_29046 - HOIST
      ?auto_29045 - PLACE
      ?auto_29048 - PLACE
      ?auto_29043 - HOIST
      ?auto_29047 - SURFACE
      ?auto_29044 - TRUCK
      ?auto_29049 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29046 ?auto_29045 ) ( IS-CRATE ?auto_29041 ) ( not ( = ?auto_29041 ?auto_29042 ) ) ( not ( = ?auto_29048 ?auto_29045 ) ) ( HOIST-AT ?auto_29043 ?auto_29048 ) ( not ( = ?auto_29046 ?auto_29043 ) ) ( AVAILABLE ?auto_29043 ) ( SURFACE-AT ?auto_29041 ?auto_29048 ) ( ON ?auto_29041 ?auto_29047 ) ( CLEAR ?auto_29041 ) ( not ( = ?auto_29041 ?auto_29047 ) ) ( not ( = ?auto_29042 ?auto_29047 ) ) ( TRUCK-AT ?auto_29044 ?auto_29045 ) ( SURFACE-AT ?auto_29049 ?auto_29045 ) ( CLEAR ?auto_29049 ) ( LIFTING ?auto_29046 ?auto_29042 ) ( IS-CRATE ?auto_29042 ) ( not ( = ?auto_29041 ?auto_29049 ) ) ( not ( = ?auto_29042 ?auto_29049 ) ) ( not ( = ?auto_29047 ?auto_29049 ) ) )
    :subtasks
    ( ( !DROP ?auto_29046 ?auto_29042 ?auto_29049 ?auto_29045 )
      ( MAKE-ON ?auto_29041 ?auto_29042 )
      ( MAKE-ON-VERIFY ?auto_29041 ?auto_29042 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29050 - SURFACE
      ?auto_29051 - SURFACE
    )
    :vars
    (
      ?auto_29056 - HOIST
      ?auto_29055 - PLACE
      ?auto_29053 - PLACE
      ?auto_29052 - HOIST
      ?auto_29058 - SURFACE
      ?auto_29054 - TRUCK
      ?auto_29057 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29056 ?auto_29055 ) ( IS-CRATE ?auto_29050 ) ( not ( = ?auto_29050 ?auto_29051 ) ) ( not ( = ?auto_29053 ?auto_29055 ) ) ( HOIST-AT ?auto_29052 ?auto_29053 ) ( not ( = ?auto_29056 ?auto_29052 ) ) ( AVAILABLE ?auto_29052 ) ( SURFACE-AT ?auto_29050 ?auto_29053 ) ( ON ?auto_29050 ?auto_29058 ) ( CLEAR ?auto_29050 ) ( not ( = ?auto_29050 ?auto_29058 ) ) ( not ( = ?auto_29051 ?auto_29058 ) ) ( TRUCK-AT ?auto_29054 ?auto_29055 ) ( SURFACE-AT ?auto_29057 ?auto_29055 ) ( CLEAR ?auto_29057 ) ( IS-CRATE ?auto_29051 ) ( not ( = ?auto_29050 ?auto_29057 ) ) ( not ( = ?auto_29051 ?auto_29057 ) ) ( not ( = ?auto_29058 ?auto_29057 ) ) ( AVAILABLE ?auto_29056 ) ( IN ?auto_29051 ?auto_29054 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29056 ?auto_29051 ?auto_29054 ?auto_29055 )
      ( MAKE-ON ?auto_29050 ?auto_29051 )
      ( MAKE-ON-VERIFY ?auto_29050 ?auto_29051 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29059 - SURFACE
      ?auto_29060 - SURFACE
    )
    :vars
    (
      ?auto_29063 - HOIST
      ?auto_29062 - PLACE
      ?auto_29067 - PLACE
      ?auto_29066 - HOIST
      ?auto_29061 - SURFACE
      ?auto_29064 - SURFACE
      ?auto_29065 - TRUCK
      ?auto_29068 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29063 ?auto_29062 ) ( IS-CRATE ?auto_29059 ) ( not ( = ?auto_29059 ?auto_29060 ) ) ( not ( = ?auto_29067 ?auto_29062 ) ) ( HOIST-AT ?auto_29066 ?auto_29067 ) ( not ( = ?auto_29063 ?auto_29066 ) ) ( AVAILABLE ?auto_29066 ) ( SURFACE-AT ?auto_29059 ?auto_29067 ) ( ON ?auto_29059 ?auto_29061 ) ( CLEAR ?auto_29059 ) ( not ( = ?auto_29059 ?auto_29061 ) ) ( not ( = ?auto_29060 ?auto_29061 ) ) ( SURFACE-AT ?auto_29064 ?auto_29062 ) ( CLEAR ?auto_29064 ) ( IS-CRATE ?auto_29060 ) ( not ( = ?auto_29059 ?auto_29064 ) ) ( not ( = ?auto_29060 ?auto_29064 ) ) ( not ( = ?auto_29061 ?auto_29064 ) ) ( AVAILABLE ?auto_29063 ) ( IN ?auto_29060 ?auto_29065 ) ( TRUCK-AT ?auto_29065 ?auto_29068 ) ( not ( = ?auto_29068 ?auto_29062 ) ) ( not ( = ?auto_29067 ?auto_29068 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_29065 ?auto_29068 ?auto_29062 )
      ( MAKE-ON ?auto_29059 ?auto_29060 )
      ( MAKE-ON-VERIFY ?auto_29059 ?auto_29060 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29069 - SURFACE
      ?auto_29070 - SURFACE
    )
    :vars
    (
      ?auto_29073 - HOIST
      ?auto_29071 - PLACE
      ?auto_29075 - PLACE
      ?auto_29078 - HOIST
      ?auto_29077 - SURFACE
      ?auto_29074 - SURFACE
      ?auto_29072 - TRUCK
      ?auto_29076 - PLACE
      ?auto_29079 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29073 ?auto_29071 ) ( IS-CRATE ?auto_29069 ) ( not ( = ?auto_29069 ?auto_29070 ) ) ( not ( = ?auto_29075 ?auto_29071 ) ) ( HOIST-AT ?auto_29078 ?auto_29075 ) ( not ( = ?auto_29073 ?auto_29078 ) ) ( AVAILABLE ?auto_29078 ) ( SURFACE-AT ?auto_29069 ?auto_29075 ) ( ON ?auto_29069 ?auto_29077 ) ( CLEAR ?auto_29069 ) ( not ( = ?auto_29069 ?auto_29077 ) ) ( not ( = ?auto_29070 ?auto_29077 ) ) ( SURFACE-AT ?auto_29074 ?auto_29071 ) ( CLEAR ?auto_29074 ) ( IS-CRATE ?auto_29070 ) ( not ( = ?auto_29069 ?auto_29074 ) ) ( not ( = ?auto_29070 ?auto_29074 ) ) ( not ( = ?auto_29077 ?auto_29074 ) ) ( AVAILABLE ?auto_29073 ) ( TRUCK-AT ?auto_29072 ?auto_29076 ) ( not ( = ?auto_29076 ?auto_29071 ) ) ( not ( = ?auto_29075 ?auto_29076 ) ) ( HOIST-AT ?auto_29079 ?auto_29076 ) ( LIFTING ?auto_29079 ?auto_29070 ) ( not ( = ?auto_29073 ?auto_29079 ) ) ( not ( = ?auto_29078 ?auto_29079 ) ) )
    :subtasks
    ( ( !LOAD ?auto_29079 ?auto_29070 ?auto_29072 ?auto_29076 )
      ( MAKE-ON ?auto_29069 ?auto_29070 )
      ( MAKE-ON-VERIFY ?auto_29069 ?auto_29070 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29080 - SURFACE
      ?auto_29081 - SURFACE
    )
    :vars
    (
      ?auto_29082 - HOIST
      ?auto_29087 - PLACE
      ?auto_29088 - PLACE
      ?auto_29084 - HOIST
      ?auto_29083 - SURFACE
      ?auto_29085 - SURFACE
      ?auto_29089 - TRUCK
      ?auto_29090 - PLACE
      ?auto_29086 - HOIST
      ?auto_29091 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29082 ?auto_29087 ) ( IS-CRATE ?auto_29080 ) ( not ( = ?auto_29080 ?auto_29081 ) ) ( not ( = ?auto_29088 ?auto_29087 ) ) ( HOIST-AT ?auto_29084 ?auto_29088 ) ( not ( = ?auto_29082 ?auto_29084 ) ) ( AVAILABLE ?auto_29084 ) ( SURFACE-AT ?auto_29080 ?auto_29088 ) ( ON ?auto_29080 ?auto_29083 ) ( CLEAR ?auto_29080 ) ( not ( = ?auto_29080 ?auto_29083 ) ) ( not ( = ?auto_29081 ?auto_29083 ) ) ( SURFACE-AT ?auto_29085 ?auto_29087 ) ( CLEAR ?auto_29085 ) ( IS-CRATE ?auto_29081 ) ( not ( = ?auto_29080 ?auto_29085 ) ) ( not ( = ?auto_29081 ?auto_29085 ) ) ( not ( = ?auto_29083 ?auto_29085 ) ) ( AVAILABLE ?auto_29082 ) ( TRUCK-AT ?auto_29089 ?auto_29090 ) ( not ( = ?auto_29090 ?auto_29087 ) ) ( not ( = ?auto_29088 ?auto_29090 ) ) ( HOIST-AT ?auto_29086 ?auto_29090 ) ( not ( = ?auto_29082 ?auto_29086 ) ) ( not ( = ?auto_29084 ?auto_29086 ) ) ( AVAILABLE ?auto_29086 ) ( SURFACE-AT ?auto_29081 ?auto_29090 ) ( ON ?auto_29081 ?auto_29091 ) ( CLEAR ?auto_29081 ) ( not ( = ?auto_29080 ?auto_29091 ) ) ( not ( = ?auto_29081 ?auto_29091 ) ) ( not ( = ?auto_29083 ?auto_29091 ) ) ( not ( = ?auto_29085 ?auto_29091 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29086 ?auto_29081 ?auto_29091 ?auto_29090 )
      ( MAKE-ON ?auto_29080 ?auto_29081 )
      ( MAKE-ON-VERIFY ?auto_29080 ?auto_29081 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29092 - SURFACE
      ?auto_29093 - SURFACE
    )
    :vars
    (
      ?auto_29101 - HOIST
      ?auto_29100 - PLACE
      ?auto_29102 - PLACE
      ?auto_29097 - HOIST
      ?auto_29096 - SURFACE
      ?auto_29099 - SURFACE
      ?auto_29098 - PLACE
      ?auto_29094 - HOIST
      ?auto_29103 - SURFACE
      ?auto_29095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29101 ?auto_29100 ) ( IS-CRATE ?auto_29092 ) ( not ( = ?auto_29092 ?auto_29093 ) ) ( not ( = ?auto_29102 ?auto_29100 ) ) ( HOIST-AT ?auto_29097 ?auto_29102 ) ( not ( = ?auto_29101 ?auto_29097 ) ) ( AVAILABLE ?auto_29097 ) ( SURFACE-AT ?auto_29092 ?auto_29102 ) ( ON ?auto_29092 ?auto_29096 ) ( CLEAR ?auto_29092 ) ( not ( = ?auto_29092 ?auto_29096 ) ) ( not ( = ?auto_29093 ?auto_29096 ) ) ( SURFACE-AT ?auto_29099 ?auto_29100 ) ( CLEAR ?auto_29099 ) ( IS-CRATE ?auto_29093 ) ( not ( = ?auto_29092 ?auto_29099 ) ) ( not ( = ?auto_29093 ?auto_29099 ) ) ( not ( = ?auto_29096 ?auto_29099 ) ) ( AVAILABLE ?auto_29101 ) ( not ( = ?auto_29098 ?auto_29100 ) ) ( not ( = ?auto_29102 ?auto_29098 ) ) ( HOIST-AT ?auto_29094 ?auto_29098 ) ( not ( = ?auto_29101 ?auto_29094 ) ) ( not ( = ?auto_29097 ?auto_29094 ) ) ( AVAILABLE ?auto_29094 ) ( SURFACE-AT ?auto_29093 ?auto_29098 ) ( ON ?auto_29093 ?auto_29103 ) ( CLEAR ?auto_29093 ) ( not ( = ?auto_29092 ?auto_29103 ) ) ( not ( = ?auto_29093 ?auto_29103 ) ) ( not ( = ?auto_29096 ?auto_29103 ) ) ( not ( = ?auto_29099 ?auto_29103 ) ) ( TRUCK-AT ?auto_29095 ?auto_29100 ) )
    :subtasks
    ( ( !DRIVE ?auto_29095 ?auto_29100 ?auto_29098 )
      ( MAKE-ON ?auto_29092 ?auto_29093 )
      ( MAKE-ON-VERIFY ?auto_29092 ?auto_29093 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29104 - SURFACE
      ?auto_29105 - SURFACE
    )
    :vars
    (
      ?auto_29111 - HOIST
      ?auto_29108 - PLACE
      ?auto_29107 - PLACE
      ?auto_29110 - HOIST
      ?auto_29109 - SURFACE
      ?auto_29115 - SURFACE
      ?auto_29106 - PLACE
      ?auto_29112 - HOIST
      ?auto_29113 - SURFACE
      ?auto_29114 - TRUCK
      ?auto_29116 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29111 ?auto_29108 ) ( IS-CRATE ?auto_29104 ) ( not ( = ?auto_29104 ?auto_29105 ) ) ( not ( = ?auto_29107 ?auto_29108 ) ) ( HOIST-AT ?auto_29110 ?auto_29107 ) ( not ( = ?auto_29111 ?auto_29110 ) ) ( AVAILABLE ?auto_29110 ) ( SURFACE-AT ?auto_29104 ?auto_29107 ) ( ON ?auto_29104 ?auto_29109 ) ( CLEAR ?auto_29104 ) ( not ( = ?auto_29104 ?auto_29109 ) ) ( not ( = ?auto_29105 ?auto_29109 ) ) ( IS-CRATE ?auto_29105 ) ( not ( = ?auto_29104 ?auto_29115 ) ) ( not ( = ?auto_29105 ?auto_29115 ) ) ( not ( = ?auto_29109 ?auto_29115 ) ) ( not ( = ?auto_29106 ?auto_29108 ) ) ( not ( = ?auto_29107 ?auto_29106 ) ) ( HOIST-AT ?auto_29112 ?auto_29106 ) ( not ( = ?auto_29111 ?auto_29112 ) ) ( not ( = ?auto_29110 ?auto_29112 ) ) ( AVAILABLE ?auto_29112 ) ( SURFACE-AT ?auto_29105 ?auto_29106 ) ( ON ?auto_29105 ?auto_29113 ) ( CLEAR ?auto_29105 ) ( not ( = ?auto_29104 ?auto_29113 ) ) ( not ( = ?auto_29105 ?auto_29113 ) ) ( not ( = ?auto_29109 ?auto_29113 ) ) ( not ( = ?auto_29115 ?auto_29113 ) ) ( TRUCK-AT ?auto_29114 ?auto_29108 ) ( SURFACE-AT ?auto_29116 ?auto_29108 ) ( CLEAR ?auto_29116 ) ( LIFTING ?auto_29111 ?auto_29115 ) ( IS-CRATE ?auto_29115 ) ( not ( = ?auto_29104 ?auto_29116 ) ) ( not ( = ?auto_29105 ?auto_29116 ) ) ( not ( = ?auto_29109 ?auto_29116 ) ) ( not ( = ?auto_29115 ?auto_29116 ) ) ( not ( = ?auto_29113 ?auto_29116 ) ) )
    :subtasks
    ( ( !DROP ?auto_29111 ?auto_29115 ?auto_29116 ?auto_29108 )
      ( MAKE-ON ?auto_29104 ?auto_29105 )
      ( MAKE-ON-VERIFY ?auto_29104 ?auto_29105 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29117 - SURFACE
      ?auto_29118 - SURFACE
    )
    :vars
    (
      ?auto_29129 - HOIST
      ?auto_29128 - PLACE
      ?auto_29119 - PLACE
      ?auto_29121 - HOIST
      ?auto_29120 - SURFACE
      ?auto_29123 - SURFACE
      ?auto_29127 - PLACE
      ?auto_29122 - HOIST
      ?auto_29124 - SURFACE
      ?auto_29125 - TRUCK
      ?auto_29126 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29129 ?auto_29128 ) ( IS-CRATE ?auto_29117 ) ( not ( = ?auto_29117 ?auto_29118 ) ) ( not ( = ?auto_29119 ?auto_29128 ) ) ( HOIST-AT ?auto_29121 ?auto_29119 ) ( not ( = ?auto_29129 ?auto_29121 ) ) ( AVAILABLE ?auto_29121 ) ( SURFACE-AT ?auto_29117 ?auto_29119 ) ( ON ?auto_29117 ?auto_29120 ) ( CLEAR ?auto_29117 ) ( not ( = ?auto_29117 ?auto_29120 ) ) ( not ( = ?auto_29118 ?auto_29120 ) ) ( IS-CRATE ?auto_29118 ) ( not ( = ?auto_29117 ?auto_29123 ) ) ( not ( = ?auto_29118 ?auto_29123 ) ) ( not ( = ?auto_29120 ?auto_29123 ) ) ( not ( = ?auto_29127 ?auto_29128 ) ) ( not ( = ?auto_29119 ?auto_29127 ) ) ( HOIST-AT ?auto_29122 ?auto_29127 ) ( not ( = ?auto_29129 ?auto_29122 ) ) ( not ( = ?auto_29121 ?auto_29122 ) ) ( AVAILABLE ?auto_29122 ) ( SURFACE-AT ?auto_29118 ?auto_29127 ) ( ON ?auto_29118 ?auto_29124 ) ( CLEAR ?auto_29118 ) ( not ( = ?auto_29117 ?auto_29124 ) ) ( not ( = ?auto_29118 ?auto_29124 ) ) ( not ( = ?auto_29120 ?auto_29124 ) ) ( not ( = ?auto_29123 ?auto_29124 ) ) ( TRUCK-AT ?auto_29125 ?auto_29128 ) ( SURFACE-AT ?auto_29126 ?auto_29128 ) ( CLEAR ?auto_29126 ) ( IS-CRATE ?auto_29123 ) ( not ( = ?auto_29117 ?auto_29126 ) ) ( not ( = ?auto_29118 ?auto_29126 ) ) ( not ( = ?auto_29120 ?auto_29126 ) ) ( not ( = ?auto_29123 ?auto_29126 ) ) ( not ( = ?auto_29124 ?auto_29126 ) ) ( AVAILABLE ?auto_29129 ) ( IN ?auto_29123 ?auto_29125 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29129 ?auto_29123 ?auto_29125 ?auto_29128 )
      ( MAKE-ON ?auto_29117 ?auto_29118 )
      ( MAKE-ON-VERIFY ?auto_29117 ?auto_29118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29130 - SURFACE
      ?auto_29131 - SURFACE
    )
    :vars
    (
      ?auto_29137 - HOIST
      ?auto_29142 - PLACE
      ?auto_29136 - PLACE
      ?auto_29135 - HOIST
      ?auto_29133 - SURFACE
      ?auto_29138 - SURFACE
      ?auto_29134 - PLACE
      ?auto_29140 - HOIST
      ?auto_29132 - SURFACE
      ?auto_29139 - SURFACE
      ?auto_29141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29137 ?auto_29142 ) ( IS-CRATE ?auto_29130 ) ( not ( = ?auto_29130 ?auto_29131 ) ) ( not ( = ?auto_29136 ?auto_29142 ) ) ( HOIST-AT ?auto_29135 ?auto_29136 ) ( not ( = ?auto_29137 ?auto_29135 ) ) ( AVAILABLE ?auto_29135 ) ( SURFACE-AT ?auto_29130 ?auto_29136 ) ( ON ?auto_29130 ?auto_29133 ) ( CLEAR ?auto_29130 ) ( not ( = ?auto_29130 ?auto_29133 ) ) ( not ( = ?auto_29131 ?auto_29133 ) ) ( IS-CRATE ?auto_29131 ) ( not ( = ?auto_29130 ?auto_29138 ) ) ( not ( = ?auto_29131 ?auto_29138 ) ) ( not ( = ?auto_29133 ?auto_29138 ) ) ( not ( = ?auto_29134 ?auto_29142 ) ) ( not ( = ?auto_29136 ?auto_29134 ) ) ( HOIST-AT ?auto_29140 ?auto_29134 ) ( not ( = ?auto_29137 ?auto_29140 ) ) ( not ( = ?auto_29135 ?auto_29140 ) ) ( AVAILABLE ?auto_29140 ) ( SURFACE-AT ?auto_29131 ?auto_29134 ) ( ON ?auto_29131 ?auto_29132 ) ( CLEAR ?auto_29131 ) ( not ( = ?auto_29130 ?auto_29132 ) ) ( not ( = ?auto_29131 ?auto_29132 ) ) ( not ( = ?auto_29133 ?auto_29132 ) ) ( not ( = ?auto_29138 ?auto_29132 ) ) ( SURFACE-AT ?auto_29139 ?auto_29142 ) ( CLEAR ?auto_29139 ) ( IS-CRATE ?auto_29138 ) ( not ( = ?auto_29130 ?auto_29139 ) ) ( not ( = ?auto_29131 ?auto_29139 ) ) ( not ( = ?auto_29133 ?auto_29139 ) ) ( not ( = ?auto_29138 ?auto_29139 ) ) ( not ( = ?auto_29132 ?auto_29139 ) ) ( AVAILABLE ?auto_29137 ) ( IN ?auto_29138 ?auto_29141 ) ( TRUCK-AT ?auto_29141 ?auto_29134 ) )
    :subtasks
    ( ( !DRIVE ?auto_29141 ?auto_29134 ?auto_29142 )
      ( MAKE-ON ?auto_29130 ?auto_29131 )
      ( MAKE-ON-VERIFY ?auto_29130 ?auto_29131 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29143 - SURFACE
      ?auto_29144 - SURFACE
    )
    :vars
    (
      ?auto_29151 - HOIST
      ?auto_29148 - PLACE
      ?auto_29145 - PLACE
      ?auto_29147 - HOIST
      ?auto_29146 - SURFACE
      ?auto_29150 - SURFACE
      ?auto_29154 - PLACE
      ?auto_29149 - HOIST
      ?auto_29155 - SURFACE
      ?auto_29152 - SURFACE
      ?auto_29153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29151 ?auto_29148 ) ( IS-CRATE ?auto_29143 ) ( not ( = ?auto_29143 ?auto_29144 ) ) ( not ( = ?auto_29145 ?auto_29148 ) ) ( HOIST-AT ?auto_29147 ?auto_29145 ) ( not ( = ?auto_29151 ?auto_29147 ) ) ( AVAILABLE ?auto_29147 ) ( SURFACE-AT ?auto_29143 ?auto_29145 ) ( ON ?auto_29143 ?auto_29146 ) ( CLEAR ?auto_29143 ) ( not ( = ?auto_29143 ?auto_29146 ) ) ( not ( = ?auto_29144 ?auto_29146 ) ) ( IS-CRATE ?auto_29144 ) ( not ( = ?auto_29143 ?auto_29150 ) ) ( not ( = ?auto_29144 ?auto_29150 ) ) ( not ( = ?auto_29146 ?auto_29150 ) ) ( not ( = ?auto_29154 ?auto_29148 ) ) ( not ( = ?auto_29145 ?auto_29154 ) ) ( HOIST-AT ?auto_29149 ?auto_29154 ) ( not ( = ?auto_29151 ?auto_29149 ) ) ( not ( = ?auto_29147 ?auto_29149 ) ) ( SURFACE-AT ?auto_29144 ?auto_29154 ) ( ON ?auto_29144 ?auto_29155 ) ( CLEAR ?auto_29144 ) ( not ( = ?auto_29143 ?auto_29155 ) ) ( not ( = ?auto_29144 ?auto_29155 ) ) ( not ( = ?auto_29146 ?auto_29155 ) ) ( not ( = ?auto_29150 ?auto_29155 ) ) ( SURFACE-AT ?auto_29152 ?auto_29148 ) ( CLEAR ?auto_29152 ) ( IS-CRATE ?auto_29150 ) ( not ( = ?auto_29143 ?auto_29152 ) ) ( not ( = ?auto_29144 ?auto_29152 ) ) ( not ( = ?auto_29146 ?auto_29152 ) ) ( not ( = ?auto_29150 ?auto_29152 ) ) ( not ( = ?auto_29155 ?auto_29152 ) ) ( AVAILABLE ?auto_29151 ) ( TRUCK-AT ?auto_29153 ?auto_29154 ) ( LIFTING ?auto_29149 ?auto_29150 ) )
    :subtasks
    ( ( !LOAD ?auto_29149 ?auto_29150 ?auto_29153 ?auto_29154 )
      ( MAKE-ON ?auto_29143 ?auto_29144 )
      ( MAKE-ON-VERIFY ?auto_29143 ?auto_29144 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29156 - SURFACE
      ?auto_29157 - SURFACE
    )
    :vars
    (
      ?auto_29158 - HOIST
      ?auto_29160 - PLACE
      ?auto_29162 - PLACE
      ?auto_29166 - HOIST
      ?auto_29165 - SURFACE
      ?auto_29167 - SURFACE
      ?auto_29164 - PLACE
      ?auto_29168 - HOIST
      ?auto_29163 - SURFACE
      ?auto_29159 - SURFACE
      ?auto_29161 - TRUCK
      ?auto_29169 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29158 ?auto_29160 ) ( IS-CRATE ?auto_29156 ) ( not ( = ?auto_29156 ?auto_29157 ) ) ( not ( = ?auto_29162 ?auto_29160 ) ) ( HOIST-AT ?auto_29166 ?auto_29162 ) ( not ( = ?auto_29158 ?auto_29166 ) ) ( AVAILABLE ?auto_29166 ) ( SURFACE-AT ?auto_29156 ?auto_29162 ) ( ON ?auto_29156 ?auto_29165 ) ( CLEAR ?auto_29156 ) ( not ( = ?auto_29156 ?auto_29165 ) ) ( not ( = ?auto_29157 ?auto_29165 ) ) ( IS-CRATE ?auto_29157 ) ( not ( = ?auto_29156 ?auto_29167 ) ) ( not ( = ?auto_29157 ?auto_29167 ) ) ( not ( = ?auto_29165 ?auto_29167 ) ) ( not ( = ?auto_29164 ?auto_29160 ) ) ( not ( = ?auto_29162 ?auto_29164 ) ) ( HOIST-AT ?auto_29168 ?auto_29164 ) ( not ( = ?auto_29158 ?auto_29168 ) ) ( not ( = ?auto_29166 ?auto_29168 ) ) ( SURFACE-AT ?auto_29157 ?auto_29164 ) ( ON ?auto_29157 ?auto_29163 ) ( CLEAR ?auto_29157 ) ( not ( = ?auto_29156 ?auto_29163 ) ) ( not ( = ?auto_29157 ?auto_29163 ) ) ( not ( = ?auto_29165 ?auto_29163 ) ) ( not ( = ?auto_29167 ?auto_29163 ) ) ( SURFACE-AT ?auto_29159 ?auto_29160 ) ( CLEAR ?auto_29159 ) ( IS-CRATE ?auto_29167 ) ( not ( = ?auto_29156 ?auto_29159 ) ) ( not ( = ?auto_29157 ?auto_29159 ) ) ( not ( = ?auto_29165 ?auto_29159 ) ) ( not ( = ?auto_29167 ?auto_29159 ) ) ( not ( = ?auto_29163 ?auto_29159 ) ) ( AVAILABLE ?auto_29158 ) ( TRUCK-AT ?auto_29161 ?auto_29164 ) ( AVAILABLE ?auto_29168 ) ( SURFACE-AT ?auto_29167 ?auto_29164 ) ( ON ?auto_29167 ?auto_29169 ) ( CLEAR ?auto_29167 ) ( not ( = ?auto_29156 ?auto_29169 ) ) ( not ( = ?auto_29157 ?auto_29169 ) ) ( not ( = ?auto_29165 ?auto_29169 ) ) ( not ( = ?auto_29167 ?auto_29169 ) ) ( not ( = ?auto_29163 ?auto_29169 ) ) ( not ( = ?auto_29159 ?auto_29169 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29168 ?auto_29167 ?auto_29169 ?auto_29164 )
      ( MAKE-ON ?auto_29156 ?auto_29157 )
      ( MAKE-ON-VERIFY ?auto_29156 ?auto_29157 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29170 - SURFACE
      ?auto_29171 - SURFACE
    )
    :vars
    (
      ?auto_29177 - HOIST
      ?auto_29181 - PLACE
      ?auto_29183 - PLACE
      ?auto_29172 - HOIST
      ?auto_29179 - SURFACE
      ?auto_29176 - SURFACE
      ?auto_29180 - PLACE
      ?auto_29174 - HOIST
      ?auto_29182 - SURFACE
      ?auto_29178 - SURFACE
      ?auto_29173 - SURFACE
      ?auto_29175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29177 ?auto_29181 ) ( IS-CRATE ?auto_29170 ) ( not ( = ?auto_29170 ?auto_29171 ) ) ( not ( = ?auto_29183 ?auto_29181 ) ) ( HOIST-AT ?auto_29172 ?auto_29183 ) ( not ( = ?auto_29177 ?auto_29172 ) ) ( AVAILABLE ?auto_29172 ) ( SURFACE-AT ?auto_29170 ?auto_29183 ) ( ON ?auto_29170 ?auto_29179 ) ( CLEAR ?auto_29170 ) ( not ( = ?auto_29170 ?auto_29179 ) ) ( not ( = ?auto_29171 ?auto_29179 ) ) ( IS-CRATE ?auto_29171 ) ( not ( = ?auto_29170 ?auto_29176 ) ) ( not ( = ?auto_29171 ?auto_29176 ) ) ( not ( = ?auto_29179 ?auto_29176 ) ) ( not ( = ?auto_29180 ?auto_29181 ) ) ( not ( = ?auto_29183 ?auto_29180 ) ) ( HOIST-AT ?auto_29174 ?auto_29180 ) ( not ( = ?auto_29177 ?auto_29174 ) ) ( not ( = ?auto_29172 ?auto_29174 ) ) ( SURFACE-AT ?auto_29171 ?auto_29180 ) ( ON ?auto_29171 ?auto_29182 ) ( CLEAR ?auto_29171 ) ( not ( = ?auto_29170 ?auto_29182 ) ) ( not ( = ?auto_29171 ?auto_29182 ) ) ( not ( = ?auto_29179 ?auto_29182 ) ) ( not ( = ?auto_29176 ?auto_29182 ) ) ( SURFACE-AT ?auto_29178 ?auto_29181 ) ( CLEAR ?auto_29178 ) ( IS-CRATE ?auto_29176 ) ( not ( = ?auto_29170 ?auto_29178 ) ) ( not ( = ?auto_29171 ?auto_29178 ) ) ( not ( = ?auto_29179 ?auto_29178 ) ) ( not ( = ?auto_29176 ?auto_29178 ) ) ( not ( = ?auto_29182 ?auto_29178 ) ) ( AVAILABLE ?auto_29177 ) ( AVAILABLE ?auto_29174 ) ( SURFACE-AT ?auto_29176 ?auto_29180 ) ( ON ?auto_29176 ?auto_29173 ) ( CLEAR ?auto_29176 ) ( not ( = ?auto_29170 ?auto_29173 ) ) ( not ( = ?auto_29171 ?auto_29173 ) ) ( not ( = ?auto_29179 ?auto_29173 ) ) ( not ( = ?auto_29176 ?auto_29173 ) ) ( not ( = ?auto_29182 ?auto_29173 ) ) ( not ( = ?auto_29178 ?auto_29173 ) ) ( TRUCK-AT ?auto_29175 ?auto_29181 ) )
    :subtasks
    ( ( !DRIVE ?auto_29175 ?auto_29181 ?auto_29180 )
      ( MAKE-ON ?auto_29170 ?auto_29171 )
      ( MAKE-ON-VERIFY ?auto_29170 ?auto_29171 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29184 - SURFACE
      ?auto_29185 - SURFACE
    )
    :vars
    (
      ?auto_29196 - HOIST
      ?auto_29194 - PLACE
      ?auto_29197 - PLACE
      ?auto_29186 - HOIST
      ?auto_29188 - SURFACE
      ?auto_29193 - SURFACE
      ?auto_29191 - PLACE
      ?auto_29189 - HOIST
      ?auto_29195 - SURFACE
      ?auto_29190 - SURFACE
      ?auto_29187 - SURFACE
      ?auto_29192 - TRUCK
      ?auto_29198 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29196 ?auto_29194 ) ( IS-CRATE ?auto_29184 ) ( not ( = ?auto_29184 ?auto_29185 ) ) ( not ( = ?auto_29197 ?auto_29194 ) ) ( HOIST-AT ?auto_29186 ?auto_29197 ) ( not ( = ?auto_29196 ?auto_29186 ) ) ( AVAILABLE ?auto_29186 ) ( SURFACE-AT ?auto_29184 ?auto_29197 ) ( ON ?auto_29184 ?auto_29188 ) ( CLEAR ?auto_29184 ) ( not ( = ?auto_29184 ?auto_29188 ) ) ( not ( = ?auto_29185 ?auto_29188 ) ) ( IS-CRATE ?auto_29185 ) ( not ( = ?auto_29184 ?auto_29193 ) ) ( not ( = ?auto_29185 ?auto_29193 ) ) ( not ( = ?auto_29188 ?auto_29193 ) ) ( not ( = ?auto_29191 ?auto_29194 ) ) ( not ( = ?auto_29197 ?auto_29191 ) ) ( HOIST-AT ?auto_29189 ?auto_29191 ) ( not ( = ?auto_29196 ?auto_29189 ) ) ( not ( = ?auto_29186 ?auto_29189 ) ) ( SURFACE-AT ?auto_29185 ?auto_29191 ) ( ON ?auto_29185 ?auto_29195 ) ( CLEAR ?auto_29185 ) ( not ( = ?auto_29184 ?auto_29195 ) ) ( not ( = ?auto_29185 ?auto_29195 ) ) ( not ( = ?auto_29188 ?auto_29195 ) ) ( not ( = ?auto_29193 ?auto_29195 ) ) ( IS-CRATE ?auto_29193 ) ( not ( = ?auto_29184 ?auto_29190 ) ) ( not ( = ?auto_29185 ?auto_29190 ) ) ( not ( = ?auto_29188 ?auto_29190 ) ) ( not ( = ?auto_29193 ?auto_29190 ) ) ( not ( = ?auto_29195 ?auto_29190 ) ) ( AVAILABLE ?auto_29189 ) ( SURFACE-AT ?auto_29193 ?auto_29191 ) ( ON ?auto_29193 ?auto_29187 ) ( CLEAR ?auto_29193 ) ( not ( = ?auto_29184 ?auto_29187 ) ) ( not ( = ?auto_29185 ?auto_29187 ) ) ( not ( = ?auto_29188 ?auto_29187 ) ) ( not ( = ?auto_29193 ?auto_29187 ) ) ( not ( = ?auto_29195 ?auto_29187 ) ) ( not ( = ?auto_29190 ?auto_29187 ) ) ( TRUCK-AT ?auto_29192 ?auto_29194 ) ( SURFACE-AT ?auto_29198 ?auto_29194 ) ( CLEAR ?auto_29198 ) ( LIFTING ?auto_29196 ?auto_29190 ) ( IS-CRATE ?auto_29190 ) ( not ( = ?auto_29184 ?auto_29198 ) ) ( not ( = ?auto_29185 ?auto_29198 ) ) ( not ( = ?auto_29188 ?auto_29198 ) ) ( not ( = ?auto_29193 ?auto_29198 ) ) ( not ( = ?auto_29195 ?auto_29198 ) ) ( not ( = ?auto_29190 ?auto_29198 ) ) ( not ( = ?auto_29187 ?auto_29198 ) ) )
    :subtasks
    ( ( !DROP ?auto_29196 ?auto_29190 ?auto_29198 ?auto_29194 )
      ( MAKE-ON ?auto_29184 ?auto_29185 )
      ( MAKE-ON-VERIFY ?auto_29184 ?auto_29185 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29199 - SURFACE
      ?auto_29200 - SURFACE
    )
    :vars
    (
      ?auto_29202 - HOIST
      ?auto_29203 - PLACE
      ?auto_29204 - PLACE
      ?auto_29211 - HOIST
      ?auto_29212 - SURFACE
      ?auto_29208 - SURFACE
      ?auto_29205 - PLACE
      ?auto_29206 - HOIST
      ?auto_29213 - SURFACE
      ?auto_29209 - SURFACE
      ?auto_29207 - SURFACE
      ?auto_29201 - TRUCK
      ?auto_29210 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29202 ?auto_29203 ) ( IS-CRATE ?auto_29199 ) ( not ( = ?auto_29199 ?auto_29200 ) ) ( not ( = ?auto_29204 ?auto_29203 ) ) ( HOIST-AT ?auto_29211 ?auto_29204 ) ( not ( = ?auto_29202 ?auto_29211 ) ) ( AVAILABLE ?auto_29211 ) ( SURFACE-AT ?auto_29199 ?auto_29204 ) ( ON ?auto_29199 ?auto_29212 ) ( CLEAR ?auto_29199 ) ( not ( = ?auto_29199 ?auto_29212 ) ) ( not ( = ?auto_29200 ?auto_29212 ) ) ( IS-CRATE ?auto_29200 ) ( not ( = ?auto_29199 ?auto_29208 ) ) ( not ( = ?auto_29200 ?auto_29208 ) ) ( not ( = ?auto_29212 ?auto_29208 ) ) ( not ( = ?auto_29205 ?auto_29203 ) ) ( not ( = ?auto_29204 ?auto_29205 ) ) ( HOIST-AT ?auto_29206 ?auto_29205 ) ( not ( = ?auto_29202 ?auto_29206 ) ) ( not ( = ?auto_29211 ?auto_29206 ) ) ( SURFACE-AT ?auto_29200 ?auto_29205 ) ( ON ?auto_29200 ?auto_29213 ) ( CLEAR ?auto_29200 ) ( not ( = ?auto_29199 ?auto_29213 ) ) ( not ( = ?auto_29200 ?auto_29213 ) ) ( not ( = ?auto_29212 ?auto_29213 ) ) ( not ( = ?auto_29208 ?auto_29213 ) ) ( IS-CRATE ?auto_29208 ) ( not ( = ?auto_29199 ?auto_29209 ) ) ( not ( = ?auto_29200 ?auto_29209 ) ) ( not ( = ?auto_29212 ?auto_29209 ) ) ( not ( = ?auto_29208 ?auto_29209 ) ) ( not ( = ?auto_29213 ?auto_29209 ) ) ( AVAILABLE ?auto_29206 ) ( SURFACE-AT ?auto_29208 ?auto_29205 ) ( ON ?auto_29208 ?auto_29207 ) ( CLEAR ?auto_29208 ) ( not ( = ?auto_29199 ?auto_29207 ) ) ( not ( = ?auto_29200 ?auto_29207 ) ) ( not ( = ?auto_29212 ?auto_29207 ) ) ( not ( = ?auto_29208 ?auto_29207 ) ) ( not ( = ?auto_29213 ?auto_29207 ) ) ( not ( = ?auto_29209 ?auto_29207 ) ) ( TRUCK-AT ?auto_29201 ?auto_29203 ) ( SURFACE-AT ?auto_29210 ?auto_29203 ) ( CLEAR ?auto_29210 ) ( IS-CRATE ?auto_29209 ) ( not ( = ?auto_29199 ?auto_29210 ) ) ( not ( = ?auto_29200 ?auto_29210 ) ) ( not ( = ?auto_29212 ?auto_29210 ) ) ( not ( = ?auto_29208 ?auto_29210 ) ) ( not ( = ?auto_29213 ?auto_29210 ) ) ( not ( = ?auto_29209 ?auto_29210 ) ) ( not ( = ?auto_29207 ?auto_29210 ) ) ( AVAILABLE ?auto_29202 ) ( IN ?auto_29209 ?auto_29201 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29202 ?auto_29209 ?auto_29201 ?auto_29203 )
      ( MAKE-ON ?auto_29199 ?auto_29200 )
      ( MAKE-ON-VERIFY ?auto_29199 ?auto_29200 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29214 - SURFACE
      ?auto_29215 - SURFACE
    )
    :vars
    (
      ?auto_29224 - HOIST
      ?auto_29222 - PLACE
      ?auto_29228 - PLACE
      ?auto_29220 - HOIST
      ?auto_29219 - SURFACE
      ?auto_29218 - SURFACE
      ?auto_29221 - PLACE
      ?auto_29223 - HOIST
      ?auto_29217 - SURFACE
      ?auto_29226 - SURFACE
      ?auto_29225 - SURFACE
      ?auto_29216 - SURFACE
      ?auto_29227 - TRUCK
      ?auto_29229 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29224 ?auto_29222 ) ( IS-CRATE ?auto_29214 ) ( not ( = ?auto_29214 ?auto_29215 ) ) ( not ( = ?auto_29228 ?auto_29222 ) ) ( HOIST-AT ?auto_29220 ?auto_29228 ) ( not ( = ?auto_29224 ?auto_29220 ) ) ( AVAILABLE ?auto_29220 ) ( SURFACE-AT ?auto_29214 ?auto_29228 ) ( ON ?auto_29214 ?auto_29219 ) ( CLEAR ?auto_29214 ) ( not ( = ?auto_29214 ?auto_29219 ) ) ( not ( = ?auto_29215 ?auto_29219 ) ) ( IS-CRATE ?auto_29215 ) ( not ( = ?auto_29214 ?auto_29218 ) ) ( not ( = ?auto_29215 ?auto_29218 ) ) ( not ( = ?auto_29219 ?auto_29218 ) ) ( not ( = ?auto_29221 ?auto_29222 ) ) ( not ( = ?auto_29228 ?auto_29221 ) ) ( HOIST-AT ?auto_29223 ?auto_29221 ) ( not ( = ?auto_29224 ?auto_29223 ) ) ( not ( = ?auto_29220 ?auto_29223 ) ) ( SURFACE-AT ?auto_29215 ?auto_29221 ) ( ON ?auto_29215 ?auto_29217 ) ( CLEAR ?auto_29215 ) ( not ( = ?auto_29214 ?auto_29217 ) ) ( not ( = ?auto_29215 ?auto_29217 ) ) ( not ( = ?auto_29219 ?auto_29217 ) ) ( not ( = ?auto_29218 ?auto_29217 ) ) ( IS-CRATE ?auto_29218 ) ( not ( = ?auto_29214 ?auto_29226 ) ) ( not ( = ?auto_29215 ?auto_29226 ) ) ( not ( = ?auto_29219 ?auto_29226 ) ) ( not ( = ?auto_29218 ?auto_29226 ) ) ( not ( = ?auto_29217 ?auto_29226 ) ) ( AVAILABLE ?auto_29223 ) ( SURFACE-AT ?auto_29218 ?auto_29221 ) ( ON ?auto_29218 ?auto_29225 ) ( CLEAR ?auto_29218 ) ( not ( = ?auto_29214 ?auto_29225 ) ) ( not ( = ?auto_29215 ?auto_29225 ) ) ( not ( = ?auto_29219 ?auto_29225 ) ) ( not ( = ?auto_29218 ?auto_29225 ) ) ( not ( = ?auto_29217 ?auto_29225 ) ) ( not ( = ?auto_29226 ?auto_29225 ) ) ( SURFACE-AT ?auto_29216 ?auto_29222 ) ( CLEAR ?auto_29216 ) ( IS-CRATE ?auto_29226 ) ( not ( = ?auto_29214 ?auto_29216 ) ) ( not ( = ?auto_29215 ?auto_29216 ) ) ( not ( = ?auto_29219 ?auto_29216 ) ) ( not ( = ?auto_29218 ?auto_29216 ) ) ( not ( = ?auto_29217 ?auto_29216 ) ) ( not ( = ?auto_29226 ?auto_29216 ) ) ( not ( = ?auto_29225 ?auto_29216 ) ) ( AVAILABLE ?auto_29224 ) ( IN ?auto_29226 ?auto_29227 ) ( TRUCK-AT ?auto_29227 ?auto_29229 ) ( not ( = ?auto_29229 ?auto_29222 ) ) ( not ( = ?auto_29228 ?auto_29229 ) ) ( not ( = ?auto_29221 ?auto_29229 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_29227 ?auto_29229 ?auto_29222 )
      ( MAKE-ON ?auto_29214 ?auto_29215 )
      ( MAKE-ON-VERIFY ?auto_29214 ?auto_29215 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29230 - SURFACE
      ?auto_29231 - SURFACE
    )
    :vars
    (
      ?auto_29233 - HOIST
      ?auto_29244 - PLACE
      ?auto_29238 - PLACE
      ?auto_29235 - HOIST
      ?auto_29243 - SURFACE
      ?auto_29241 - SURFACE
      ?auto_29240 - PLACE
      ?auto_29239 - HOIST
      ?auto_29245 - SURFACE
      ?auto_29242 - SURFACE
      ?auto_29237 - SURFACE
      ?auto_29232 - SURFACE
      ?auto_29236 - TRUCK
      ?auto_29234 - PLACE
      ?auto_29246 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29233 ?auto_29244 ) ( IS-CRATE ?auto_29230 ) ( not ( = ?auto_29230 ?auto_29231 ) ) ( not ( = ?auto_29238 ?auto_29244 ) ) ( HOIST-AT ?auto_29235 ?auto_29238 ) ( not ( = ?auto_29233 ?auto_29235 ) ) ( AVAILABLE ?auto_29235 ) ( SURFACE-AT ?auto_29230 ?auto_29238 ) ( ON ?auto_29230 ?auto_29243 ) ( CLEAR ?auto_29230 ) ( not ( = ?auto_29230 ?auto_29243 ) ) ( not ( = ?auto_29231 ?auto_29243 ) ) ( IS-CRATE ?auto_29231 ) ( not ( = ?auto_29230 ?auto_29241 ) ) ( not ( = ?auto_29231 ?auto_29241 ) ) ( not ( = ?auto_29243 ?auto_29241 ) ) ( not ( = ?auto_29240 ?auto_29244 ) ) ( not ( = ?auto_29238 ?auto_29240 ) ) ( HOIST-AT ?auto_29239 ?auto_29240 ) ( not ( = ?auto_29233 ?auto_29239 ) ) ( not ( = ?auto_29235 ?auto_29239 ) ) ( SURFACE-AT ?auto_29231 ?auto_29240 ) ( ON ?auto_29231 ?auto_29245 ) ( CLEAR ?auto_29231 ) ( not ( = ?auto_29230 ?auto_29245 ) ) ( not ( = ?auto_29231 ?auto_29245 ) ) ( not ( = ?auto_29243 ?auto_29245 ) ) ( not ( = ?auto_29241 ?auto_29245 ) ) ( IS-CRATE ?auto_29241 ) ( not ( = ?auto_29230 ?auto_29242 ) ) ( not ( = ?auto_29231 ?auto_29242 ) ) ( not ( = ?auto_29243 ?auto_29242 ) ) ( not ( = ?auto_29241 ?auto_29242 ) ) ( not ( = ?auto_29245 ?auto_29242 ) ) ( AVAILABLE ?auto_29239 ) ( SURFACE-AT ?auto_29241 ?auto_29240 ) ( ON ?auto_29241 ?auto_29237 ) ( CLEAR ?auto_29241 ) ( not ( = ?auto_29230 ?auto_29237 ) ) ( not ( = ?auto_29231 ?auto_29237 ) ) ( not ( = ?auto_29243 ?auto_29237 ) ) ( not ( = ?auto_29241 ?auto_29237 ) ) ( not ( = ?auto_29245 ?auto_29237 ) ) ( not ( = ?auto_29242 ?auto_29237 ) ) ( SURFACE-AT ?auto_29232 ?auto_29244 ) ( CLEAR ?auto_29232 ) ( IS-CRATE ?auto_29242 ) ( not ( = ?auto_29230 ?auto_29232 ) ) ( not ( = ?auto_29231 ?auto_29232 ) ) ( not ( = ?auto_29243 ?auto_29232 ) ) ( not ( = ?auto_29241 ?auto_29232 ) ) ( not ( = ?auto_29245 ?auto_29232 ) ) ( not ( = ?auto_29242 ?auto_29232 ) ) ( not ( = ?auto_29237 ?auto_29232 ) ) ( AVAILABLE ?auto_29233 ) ( TRUCK-AT ?auto_29236 ?auto_29234 ) ( not ( = ?auto_29234 ?auto_29244 ) ) ( not ( = ?auto_29238 ?auto_29234 ) ) ( not ( = ?auto_29240 ?auto_29234 ) ) ( HOIST-AT ?auto_29246 ?auto_29234 ) ( LIFTING ?auto_29246 ?auto_29242 ) ( not ( = ?auto_29233 ?auto_29246 ) ) ( not ( = ?auto_29235 ?auto_29246 ) ) ( not ( = ?auto_29239 ?auto_29246 ) ) )
    :subtasks
    ( ( !LOAD ?auto_29246 ?auto_29242 ?auto_29236 ?auto_29234 )
      ( MAKE-ON ?auto_29230 ?auto_29231 )
      ( MAKE-ON-VERIFY ?auto_29230 ?auto_29231 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29247 - SURFACE
      ?auto_29248 - SURFACE
    )
    :vars
    (
      ?auto_29251 - HOIST
      ?auto_29252 - PLACE
      ?auto_29257 - PLACE
      ?auto_29256 - HOIST
      ?auto_29263 - SURFACE
      ?auto_29262 - SURFACE
      ?auto_29260 - PLACE
      ?auto_29255 - HOIST
      ?auto_29259 - SURFACE
      ?auto_29253 - SURFACE
      ?auto_29258 - SURFACE
      ?auto_29249 - SURFACE
      ?auto_29261 - TRUCK
      ?auto_29254 - PLACE
      ?auto_29250 - HOIST
      ?auto_29264 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29251 ?auto_29252 ) ( IS-CRATE ?auto_29247 ) ( not ( = ?auto_29247 ?auto_29248 ) ) ( not ( = ?auto_29257 ?auto_29252 ) ) ( HOIST-AT ?auto_29256 ?auto_29257 ) ( not ( = ?auto_29251 ?auto_29256 ) ) ( AVAILABLE ?auto_29256 ) ( SURFACE-AT ?auto_29247 ?auto_29257 ) ( ON ?auto_29247 ?auto_29263 ) ( CLEAR ?auto_29247 ) ( not ( = ?auto_29247 ?auto_29263 ) ) ( not ( = ?auto_29248 ?auto_29263 ) ) ( IS-CRATE ?auto_29248 ) ( not ( = ?auto_29247 ?auto_29262 ) ) ( not ( = ?auto_29248 ?auto_29262 ) ) ( not ( = ?auto_29263 ?auto_29262 ) ) ( not ( = ?auto_29260 ?auto_29252 ) ) ( not ( = ?auto_29257 ?auto_29260 ) ) ( HOIST-AT ?auto_29255 ?auto_29260 ) ( not ( = ?auto_29251 ?auto_29255 ) ) ( not ( = ?auto_29256 ?auto_29255 ) ) ( SURFACE-AT ?auto_29248 ?auto_29260 ) ( ON ?auto_29248 ?auto_29259 ) ( CLEAR ?auto_29248 ) ( not ( = ?auto_29247 ?auto_29259 ) ) ( not ( = ?auto_29248 ?auto_29259 ) ) ( not ( = ?auto_29263 ?auto_29259 ) ) ( not ( = ?auto_29262 ?auto_29259 ) ) ( IS-CRATE ?auto_29262 ) ( not ( = ?auto_29247 ?auto_29253 ) ) ( not ( = ?auto_29248 ?auto_29253 ) ) ( not ( = ?auto_29263 ?auto_29253 ) ) ( not ( = ?auto_29262 ?auto_29253 ) ) ( not ( = ?auto_29259 ?auto_29253 ) ) ( AVAILABLE ?auto_29255 ) ( SURFACE-AT ?auto_29262 ?auto_29260 ) ( ON ?auto_29262 ?auto_29258 ) ( CLEAR ?auto_29262 ) ( not ( = ?auto_29247 ?auto_29258 ) ) ( not ( = ?auto_29248 ?auto_29258 ) ) ( not ( = ?auto_29263 ?auto_29258 ) ) ( not ( = ?auto_29262 ?auto_29258 ) ) ( not ( = ?auto_29259 ?auto_29258 ) ) ( not ( = ?auto_29253 ?auto_29258 ) ) ( SURFACE-AT ?auto_29249 ?auto_29252 ) ( CLEAR ?auto_29249 ) ( IS-CRATE ?auto_29253 ) ( not ( = ?auto_29247 ?auto_29249 ) ) ( not ( = ?auto_29248 ?auto_29249 ) ) ( not ( = ?auto_29263 ?auto_29249 ) ) ( not ( = ?auto_29262 ?auto_29249 ) ) ( not ( = ?auto_29259 ?auto_29249 ) ) ( not ( = ?auto_29253 ?auto_29249 ) ) ( not ( = ?auto_29258 ?auto_29249 ) ) ( AVAILABLE ?auto_29251 ) ( TRUCK-AT ?auto_29261 ?auto_29254 ) ( not ( = ?auto_29254 ?auto_29252 ) ) ( not ( = ?auto_29257 ?auto_29254 ) ) ( not ( = ?auto_29260 ?auto_29254 ) ) ( HOIST-AT ?auto_29250 ?auto_29254 ) ( not ( = ?auto_29251 ?auto_29250 ) ) ( not ( = ?auto_29256 ?auto_29250 ) ) ( not ( = ?auto_29255 ?auto_29250 ) ) ( AVAILABLE ?auto_29250 ) ( SURFACE-AT ?auto_29253 ?auto_29254 ) ( ON ?auto_29253 ?auto_29264 ) ( CLEAR ?auto_29253 ) ( not ( = ?auto_29247 ?auto_29264 ) ) ( not ( = ?auto_29248 ?auto_29264 ) ) ( not ( = ?auto_29263 ?auto_29264 ) ) ( not ( = ?auto_29262 ?auto_29264 ) ) ( not ( = ?auto_29259 ?auto_29264 ) ) ( not ( = ?auto_29253 ?auto_29264 ) ) ( not ( = ?auto_29258 ?auto_29264 ) ) ( not ( = ?auto_29249 ?auto_29264 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29250 ?auto_29253 ?auto_29264 ?auto_29254 )
      ( MAKE-ON ?auto_29247 ?auto_29248 )
      ( MAKE-ON-VERIFY ?auto_29247 ?auto_29248 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29265 - SURFACE
      ?auto_29266 - SURFACE
    )
    :vars
    (
      ?auto_29268 - HOIST
      ?auto_29269 - PLACE
      ?auto_29277 - PLACE
      ?auto_29270 - HOIST
      ?auto_29280 - SURFACE
      ?auto_29274 - SURFACE
      ?auto_29275 - PLACE
      ?auto_29281 - HOIST
      ?auto_29267 - SURFACE
      ?auto_29278 - SURFACE
      ?auto_29276 - SURFACE
      ?auto_29271 - SURFACE
      ?auto_29272 - PLACE
      ?auto_29279 - HOIST
      ?auto_29282 - SURFACE
      ?auto_29273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29268 ?auto_29269 ) ( IS-CRATE ?auto_29265 ) ( not ( = ?auto_29265 ?auto_29266 ) ) ( not ( = ?auto_29277 ?auto_29269 ) ) ( HOIST-AT ?auto_29270 ?auto_29277 ) ( not ( = ?auto_29268 ?auto_29270 ) ) ( AVAILABLE ?auto_29270 ) ( SURFACE-AT ?auto_29265 ?auto_29277 ) ( ON ?auto_29265 ?auto_29280 ) ( CLEAR ?auto_29265 ) ( not ( = ?auto_29265 ?auto_29280 ) ) ( not ( = ?auto_29266 ?auto_29280 ) ) ( IS-CRATE ?auto_29266 ) ( not ( = ?auto_29265 ?auto_29274 ) ) ( not ( = ?auto_29266 ?auto_29274 ) ) ( not ( = ?auto_29280 ?auto_29274 ) ) ( not ( = ?auto_29275 ?auto_29269 ) ) ( not ( = ?auto_29277 ?auto_29275 ) ) ( HOIST-AT ?auto_29281 ?auto_29275 ) ( not ( = ?auto_29268 ?auto_29281 ) ) ( not ( = ?auto_29270 ?auto_29281 ) ) ( SURFACE-AT ?auto_29266 ?auto_29275 ) ( ON ?auto_29266 ?auto_29267 ) ( CLEAR ?auto_29266 ) ( not ( = ?auto_29265 ?auto_29267 ) ) ( not ( = ?auto_29266 ?auto_29267 ) ) ( not ( = ?auto_29280 ?auto_29267 ) ) ( not ( = ?auto_29274 ?auto_29267 ) ) ( IS-CRATE ?auto_29274 ) ( not ( = ?auto_29265 ?auto_29278 ) ) ( not ( = ?auto_29266 ?auto_29278 ) ) ( not ( = ?auto_29280 ?auto_29278 ) ) ( not ( = ?auto_29274 ?auto_29278 ) ) ( not ( = ?auto_29267 ?auto_29278 ) ) ( AVAILABLE ?auto_29281 ) ( SURFACE-AT ?auto_29274 ?auto_29275 ) ( ON ?auto_29274 ?auto_29276 ) ( CLEAR ?auto_29274 ) ( not ( = ?auto_29265 ?auto_29276 ) ) ( not ( = ?auto_29266 ?auto_29276 ) ) ( not ( = ?auto_29280 ?auto_29276 ) ) ( not ( = ?auto_29274 ?auto_29276 ) ) ( not ( = ?auto_29267 ?auto_29276 ) ) ( not ( = ?auto_29278 ?auto_29276 ) ) ( SURFACE-AT ?auto_29271 ?auto_29269 ) ( CLEAR ?auto_29271 ) ( IS-CRATE ?auto_29278 ) ( not ( = ?auto_29265 ?auto_29271 ) ) ( not ( = ?auto_29266 ?auto_29271 ) ) ( not ( = ?auto_29280 ?auto_29271 ) ) ( not ( = ?auto_29274 ?auto_29271 ) ) ( not ( = ?auto_29267 ?auto_29271 ) ) ( not ( = ?auto_29278 ?auto_29271 ) ) ( not ( = ?auto_29276 ?auto_29271 ) ) ( AVAILABLE ?auto_29268 ) ( not ( = ?auto_29272 ?auto_29269 ) ) ( not ( = ?auto_29277 ?auto_29272 ) ) ( not ( = ?auto_29275 ?auto_29272 ) ) ( HOIST-AT ?auto_29279 ?auto_29272 ) ( not ( = ?auto_29268 ?auto_29279 ) ) ( not ( = ?auto_29270 ?auto_29279 ) ) ( not ( = ?auto_29281 ?auto_29279 ) ) ( AVAILABLE ?auto_29279 ) ( SURFACE-AT ?auto_29278 ?auto_29272 ) ( ON ?auto_29278 ?auto_29282 ) ( CLEAR ?auto_29278 ) ( not ( = ?auto_29265 ?auto_29282 ) ) ( not ( = ?auto_29266 ?auto_29282 ) ) ( not ( = ?auto_29280 ?auto_29282 ) ) ( not ( = ?auto_29274 ?auto_29282 ) ) ( not ( = ?auto_29267 ?auto_29282 ) ) ( not ( = ?auto_29278 ?auto_29282 ) ) ( not ( = ?auto_29276 ?auto_29282 ) ) ( not ( = ?auto_29271 ?auto_29282 ) ) ( TRUCK-AT ?auto_29273 ?auto_29269 ) )
    :subtasks
    ( ( !DRIVE ?auto_29273 ?auto_29269 ?auto_29272 )
      ( MAKE-ON ?auto_29265 ?auto_29266 )
      ( MAKE-ON-VERIFY ?auto_29265 ?auto_29266 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29283 - SURFACE
      ?auto_29284 - SURFACE
    )
    :vars
    (
      ?auto_29297 - HOIST
      ?auto_29293 - PLACE
      ?auto_29290 - PLACE
      ?auto_29291 - HOIST
      ?auto_29294 - SURFACE
      ?auto_29287 - SURFACE
      ?auto_29285 - PLACE
      ?auto_29299 - HOIST
      ?auto_29286 - SURFACE
      ?auto_29288 - SURFACE
      ?auto_29295 - SURFACE
      ?auto_29298 - SURFACE
      ?auto_29296 - PLACE
      ?auto_29289 - HOIST
      ?auto_29300 - SURFACE
      ?auto_29292 - TRUCK
      ?auto_29301 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29297 ?auto_29293 ) ( IS-CRATE ?auto_29283 ) ( not ( = ?auto_29283 ?auto_29284 ) ) ( not ( = ?auto_29290 ?auto_29293 ) ) ( HOIST-AT ?auto_29291 ?auto_29290 ) ( not ( = ?auto_29297 ?auto_29291 ) ) ( AVAILABLE ?auto_29291 ) ( SURFACE-AT ?auto_29283 ?auto_29290 ) ( ON ?auto_29283 ?auto_29294 ) ( CLEAR ?auto_29283 ) ( not ( = ?auto_29283 ?auto_29294 ) ) ( not ( = ?auto_29284 ?auto_29294 ) ) ( IS-CRATE ?auto_29284 ) ( not ( = ?auto_29283 ?auto_29287 ) ) ( not ( = ?auto_29284 ?auto_29287 ) ) ( not ( = ?auto_29294 ?auto_29287 ) ) ( not ( = ?auto_29285 ?auto_29293 ) ) ( not ( = ?auto_29290 ?auto_29285 ) ) ( HOIST-AT ?auto_29299 ?auto_29285 ) ( not ( = ?auto_29297 ?auto_29299 ) ) ( not ( = ?auto_29291 ?auto_29299 ) ) ( SURFACE-AT ?auto_29284 ?auto_29285 ) ( ON ?auto_29284 ?auto_29286 ) ( CLEAR ?auto_29284 ) ( not ( = ?auto_29283 ?auto_29286 ) ) ( not ( = ?auto_29284 ?auto_29286 ) ) ( not ( = ?auto_29294 ?auto_29286 ) ) ( not ( = ?auto_29287 ?auto_29286 ) ) ( IS-CRATE ?auto_29287 ) ( not ( = ?auto_29283 ?auto_29288 ) ) ( not ( = ?auto_29284 ?auto_29288 ) ) ( not ( = ?auto_29294 ?auto_29288 ) ) ( not ( = ?auto_29287 ?auto_29288 ) ) ( not ( = ?auto_29286 ?auto_29288 ) ) ( AVAILABLE ?auto_29299 ) ( SURFACE-AT ?auto_29287 ?auto_29285 ) ( ON ?auto_29287 ?auto_29295 ) ( CLEAR ?auto_29287 ) ( not ( = ?auto_29283 ?auto_29295 ) ) ( not ( = ?auto_29284 ?auto_29295 ) ) ( not ( = ?auto_29294 ?auto_29295 ) ) ( not ( = ?auto_29287 ?auto_29295 ) ) ( not ( = ?auto_29286 ?auto_29295 ) ) ( not ( = ?auto_29288 ?auto_29295 ) ) ( IS-CRATE ?auto_29288 ) ( not ( = ?auto_29283 ?auto_29298 ) ) ( not ( = ?auto_29284 ?auto_29298 ) ) ( not ( = ?auto_29294 ?auto_29298 ) ) ( not ( = ?auto_29287 ?auto_29298 ) ) ( not ( = ?auto_29286 ?auto_29298 ) ) ( not ( = ?auto_29288 ?auto_29298 ) ) ( not ( = ?auto_29295 ?auto_29298 ) ) ( not ( = ?auto_29296 ?auto_29293 ) ) ( not ( = ?auto_29290 ?auto_29296 ) ) ( not ( = ?auto_29285 ?auto_29296 ) ) ( HOIST-AT ?auto_29289 ?auto_29296 ) ( not ( = ?auto_29297 ?auto_29289 ) ) ( not ( = ?auto_29291 ?auto_29289 ) ) ( not ( = ?auto_29299 ?auto_29289 ) ) ( AVAILABLE ?auto_29289 ) ( SURFACE-AT ?auto_29288 ?auto_29296 ) ( ON ?auto_29288 ?auto_29300 ) ( CLEAR ?auto_29288 ) ( not ( = ?auto_29283 ?auto_29300 ) ) ( not ( = ?auto_29284 ?auto_29300 ) ) ( not ( = ?auto_29294 ?auto_29300 ) ) ( not ( = ?auto_29287 ?auto_29300 ) ) ( not ( = ?auto_29286 ?auto_29300 ) ) ( not ( = ?auto_29288 ?auto_29300 ) ) ( not ( = ?auto_29295 ?auto_29300 ) ) ( not ( = ?auto_29298 ?auto_29300 ) ) ( TRUCK-AT ?auto_29292 ?auto_29293 ) ( SURFACE-AT ?auto_29301 ?auto_29293 ) ( CLEAR ?auto_29301 ) ( LIFTING ?auto_29297 ?auto_29298 ) ( IS-CRATE ?auto_29298 ) ( not ( = ?auto_29283 ?auto_29301 ) ) ( not ( = ?auto_29284 ?auto_29301 ) ) ( not ( = ?auto_29294 ?auto_29301 ) ) ( not ( = ?auto_29287 ?auto_29301 ) ) ( not ( = ?auto_29286 ?auto_29301 ) ) ( not ( = ?auto_29288 ?auto_29301 ) ) ( not ( = ?auto_29295 ?auto_29301 ) ) ( not ( = ?auto_29298 ?auto_29301 ) ) ( not ( = ?auto_29300 ?auto_29301 ) ) )
    :subtasks
    ( ( !DROP ?auto_29297 ?auto_29298 ?auto_29301 ?auto_29293 )
      ( MAKE-ON ?auto_29283 ?auto_29284 )
      ( MAKE-ON-VERIFY ?auto_29283 ?auto_29284 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29302 - SURFACE
      ?auto_29303 - SURFACE
    )
    :vars
    (
      ?auto_29308 - HOIST
      ?auto_29309 - PLACE
      ?auto_29317 - PLACE
      ?auto_29312 - HOIST
      ?auto_29307 - SURFACE
      ?auto_29314 - SURFACE
      ?auto_29310 - PLACE
      ?auto_29306 - HOIST
      ?auto_29313 - SURFACE
      ?auto_29315 - SURFACE
      ?auto_29318 - SURFACE
      ?auto_29319 - SURFACE
      ?auto_29304 - PLACE
      ?auto_29316 - HOIST
      ?auto_29311 - SURFACE
      ?auto_29320 - TRUCK
      ?auto_29305 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29308 ?auto_29309 ) ( IS-CRATE ?auto_29302 ) ( not ( = ?auto_29302 ?auto_29303 ) ) ( not ( = ?auto_29317 ?auto_29309 ) ) ( HOIST-AT ?auto_29312 ?auto_29317 ) ( not ( = ?auto_29308 ?auto_29312 ) ) ( AVAILABLE ?auto_29312 ) ( SURFACE-AT ?auto_29302 ?auto_29317 ) ( ON ?auto_29302 ?auto_29307 ) ( CLEAR ?auto_29302 ) ( not ( = ?auto_29302 ?auto_29307 ) ) ( not ( = ?auto_29303 ?auto_29307 ) ) ( IS-CRATE ?auto_29303 ) ( not ( = ?auto_29302 ?auto_29314 ) ) ( not ( = ?auto_29303 ?auto_29314 ) ) ( not ( = ?auto_29307 ?auto_29314 ) ) ( not ( = ?auto_29310 ?auto_29309 ) ) ( not ( = ?auto_29317 ?auto_29310 ) ) ( HOIST-AT ?auto_29306 ?auto_29310 ) ( not ( = ?auto_29308 ?auto_29306 ) ) ( not ( = ?auto_29312 ?auto_29306 ) ) ( SURFACE-AT ?auto_29303 ?auto_29310 ) ( ON ?auto_29303 ?auto_29313 ) ( CLEAR ?auto_29303 ) ( not ( = ?auto_29302 ?auto_29313 ) ) ( not ( = ?auto_29303 ?auto_29313 ) ) ( not ( = ?auto_29307 ?auto_29313 ) ) ( not ( = ?auto_29314 ?auto_29313 ) ) ( IS-CRATE ?auto_29314 ) ( not ( = ?auto_29302 ?auto_29315 ) ) ( not ( = ?auto_29303 ?auto_29315 ) ) ( not ( = ?auto_29307 ?auto_29315 ) ) ( not ( = ?auto_29314 ?auto_29315 ) ) ( not ( = ?auto_29313 ?auto_29315 ) ) ( AVAILABLE ?auto_29306 ) ( SURFACE-AT ?auto_29314 ?auto_29310 ) ( ON ?auto_29314 ?auto_29318 ) ( CLEAR ?auto_29314 ) ( not ( = ?auto_29302 ?auto_29318 ) ) ( not ( = ?auto_29303 ?auto_29318 ) ) ( not ( = ?auto_29307 ?auto_29318 ) ) ( not ( = ?auto_29314 ?auto_29318 ) ) ( not ( = ?auto_29313 ?auto_29318 ) ) ( not ( = ?auto_29315 ?auto_29318 ) ) ( IS-CRATE ?auto_29315 ) ( not ( = ?auto_29302 ?auto_29319 ) ) ( not ( = ?auto_29303 ?auto_29319 ) ) ( not ( = ?auto_29307 ?auto_29319 ) ) ( not ( = ?auto_29314 ?auto_29319 ) ) ( not ( = ?auto_29313 ?auto_29319 ) ) ( not ( = ?auto_29315 ?auto_29319 ) ) ( not ( = ?auto_29318 ?auto_29319 ) ) ( not ( = ?auto_29304 ?auto_29309 ) ) ( not ( = ?auto_29317 ?auto_29304 ) ) ( not ( = ?auto_29310 ?auto_29304 ) ) ( HOIST-AT ?auto_29316 ?auto_29304 ) ( not ( = ?auto_29308 ?auto_29316 ) ) ( not ( = ?auto_29312 ?auto_29316 ) ) ( not ( = ?auto_29306 ?auto_29316 ) ) ( AVAILABLE ?auto_29316 ) ( SURFACE-AT ?auto_29315 ?auto_29304 ) ( ON ?auto_29315 ?auto_29311 ) ( CLEAR ?auto_29315 ) ( not ( = ?auto_29302 ?auto_29311 ) ) ( not ( = ?auto_29303 ?auto_29311 ) ) ( not ( = ?auto_29307 ?auto_29311 ) ) ( not ( = ?auto_29314 ?auto_29311 ) ) ( not ( = ?auto_29313 ?auto_29311 ) ) ( not ( = ?auto_29315 ?auto_29311 ) ) ( not ( = ?auto_29318 ?auto_29311 ) ) ( not ( = ?auto_29319 ?auto_29311 ) ) ( TRUCK-AT ?auto_29320 ?auto_29309 ) ( SURFACE-AT ?auto_29305 ?auto_29309 ) ( CLEAR ?auto_29305 ) ( IS-CRATE ?auto_29319 ) ( not ( = ?auto_29302 ?auto_29305 ) ) ( not ( = ?auto_29303 ?auto_29305 ) ) ( not ( = ?auto_29307 ?auto_29305 ) ) ( not ( = ?auto_29314 ?auto_29305 ) ) ( not ( = ?auto_29313 ?auto_29305 ) ) ( not ( = ?auto_29315 ?auto_29305 ) ) ( not ( = ?auto_29318 ?auto_29305 ) ) ( not ( = ?auto_29319 ?auto_29305 ) ) ( not ( = ?auto_29311 ?auto_29305 ) ) ( AVAILABLE ?auto_29308 ) ( IN ?auto_29319 ?auto_29320 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29308 ?auto_29319 ?auto_29320 ?auto_29309 )
      ( MAKE-ON ?auto_29302 ?auto_29303 )
      ( MAKE-ON-VERIFY ?auto_29302 ?auto_29303 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29321 - SURFACE
      ?auto_29322 - SURFACE
    )
    :vars
    (
      ?auto_29324 - HOIST
      ?auto_29328 - PLACE
      ?auto_29323 - PLACE
      ?auto_29326 - HOIST
      ?auto_29335 - SURFACE
      ?auto_29334 - SURFACE
      ?auto_29339 - PLACE
      ?auto_29331 - HOIST
      ?auto_29327 - SURFACE
      ?auto_29329 - SURFACE
      ?auto_29338 - SURFACE
      ?auto_29332 - SURFACE
      ?auto_29337 - PLACE
      ?auto_29333 - HOIST
      ?auto_29330 - SURFACE
      ?auto_29325 - SURFACE
      ?auto_29336 - TRUCK
      ?auto_29340 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29324 ?auto_29328 ) ( IS-CRATE ?auto_29321 ) ( not ( = ?auto_29321 ?auto_29322 ) ) ( not ( = ?auto_29323 ?auto_29328 ) ) ( HOIST-AT ?auto_29326 ?auto_29323 ) ( not ( = ?auto_29324 ?auto_29326 ) ) ( AVAILABLE ?auto_29326 ) ( SURFACE-AT ?auto_29321 ?auto_29323 ) ( ON ?auto_29321 ?auto_29335 ) ( CLEAR ?auto_29321 ) ( not ( = ?auto_29321 ?auto_29335 ) ) ( not ( = ?auto_29322 ?auto_29335 ) ) ( IS-CRATE ?auto_29322 ) ( not ( = ?auto_29321 ?auto_29334 ) ) ( not ( = ?auto_29322 ?auto_29334 ) ) ( not ( = ?auto_29335 ?auto_29334 ) ) ( not ( = ?auto_29339 ?auto_29328 ) ) ( not ( = ?auto_29323 ?auto_29339 ) ) ( HOIST-AT ?auto_29331 ?auto_29339 ) ( not ( = ?auto_29324 ?auto_29331 ) ) ( not ( = ?auto_29326 ?auto_29331 ) ) ( SURFACE-AT ?auto_29322 ?auto_29339 ) ( ON ?auto_29322 ?auto_29327 ) ( CLEAR ?auto_29322 ) ( not ( = ?auto_29321 ?auto_29327 ) ) ( not ( = ?auto_29322 ?auto_29327 ) ) ( not ( = ?auto_29335 ?auto_29327 ) ) ( not ( = ?auto_29334 ?auto_29327 ) ) ( IS-CRATE ?auto_29334 ) ( not ( = ?auto_29321 ?auto_29329 ) ) ( not ( = ?auto_29322 ?auto_29329 ) ) ( not ( = ?auto_29335 ?auto_29329 ) ) ( not ( = ?auto_29334 ?auto_29329 ) ) ( not ( = ?auto_29327 ?auto_29329 ) ) ( AVAILABLE ?auto_29331 ) ( SURFACE-AT ?auto_29334 ?auto_29339 ) ( ON ?auto_29334 ?auto_29338 ) ( CLEAR ?auto_29334 ) ( not ( = ?auto_29321 ?auto_29338 ) ) ( not ( = ?auto_29322 ?auto_29338 ) ) ( not ( = ?auto_29335 ?auto_29338 ) ) ( not ( = ?auto_29334 ?auto_29338 ) ) ( not ( = ?auto_29327 ?auto_29338 ) ) ( not ( = ?auto_29329 ?auto_29338 ) ) ( IS-CRATE ?auto_29329 ) ( not ( = ?auto_29321 ?auto_29332 ) ) ( not ( = ?auto_29322 ?auto_29332 ) ) ( not ( = ?auto_29335 ?auto_29332 ) ) ( not ( = ?auto_29334 ?auto_29332 ) ) ( not ( = ?auto_29327 ?auto_29332 ) ) ( not ( = ?auto_29329 ?auto_29332 ) ) ( not ( = ?auto_29338 ?auto_29332 ) ) ( not ( = ?auto_29337 ?auto_29328 ) ) ( not ( = ?auto_29323 ?auto_29337 ) ) ( not ( = ?auto_29339 ?auto_29337 ) ) ( HOIST-AT ?auto_29333 ?auto_29337 ) ( not ( = ?auto_29324 ?auto_29333 ) ) ( not ( = ?auto_29326 ?auto_29333 ) ) ( not ( = ?auto_29331 ?auto_29333 ) ) ( AVAILABLE ?auto_29333 ) ( SURFACE-AT ?auto_29329 ?auto_29337 ) ( ON ?auto_29329 ?auto_29330 ) ( CLEAR ?auto_29329 ) ( not ( = ?auto_29321 ?auto_29330 ) ) ( not ( = ?auto_29322 ?auto_29330 ) ) ( not ( = ?auto_29335 ?auto_29330 ) ) ( not ( = ?auto_29334 ?auto_29330 ) ) ( not ( = ?auto_29327 ?auto_29330 ) ) ( not ( = ?auto_29329 ?auto_29330 ) ) ( not ( = ?auto_29338 ?auto_29330 ) ) ( not ( = ?auto_29332 ?auto_29330 ) ) ( SURFACE-AT ?auto_29325 ?auto_29328 ) ( CLEAR ?auto_29325 ) ( IS-CRATE ?auto_29332 ) ( not ( = ?auto_29321 ?auto_29325 ) ) ( not ( = ?auto_29322 ?auto_29325 ) ) ( not ( = ?auto_29335 ?auto_29325 ) ) ( not ( = ?auto_29334 ?auto_29325 ) ) ( not ( = ?auto_29327 ?auto_29325 ) ) ( not ( = ?auto_29329 ?auto_29325 ) ) ( not ( = ?auto_29338 ?auto_29325 ) ) ( not ( = ?auto_29332 ?auto_29325 ) ) ( not ( = ?auto_29330 ?auto_29325 ) ) ( AVAILABLE ?auto_29324 ) ( IN ?auto_29332 ?auto_29336 ) ( TRUCK-AT ?auto_29336 ?auto_29340 ) ( not ( = ?auto_29340 ?auto_29328 ) ) ( not ( = ?auto_29323 ?auto_29340 ) ) ( not ( = ?auto_29339 ?auto_29340 ) ) ( not ( = ?auto_29337 ?auto_29340 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_29336 ?auto_29340 ?auto_29328 )
      ( MAKE-ON ?auto_29321 ?auto_29322 )
      ( MAKE-ON-VERIFY ?auto_29321 ?auto_29322 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29341 - SURFACE
      ?auto_29342 - SURFACE
    )
    :vars
    (
      ?auto_29358 - HOIST
      ?auto_29352 - PLACE
      ?auto_29360 - PLACE
      ?auto_29351 - HOIST
      ?auto_29350 - SURFACE
      ?auto_29357 - SURFACE
      ?auto_29354 - PLACE
      ?auto_29347 - HOIST
      ?auto_29343 - SURFACE
      ?auto_29346 - SURFACE
      ?auto_29359 - SURFACE
      ?auto_29356 - SURFACE
      ?auto_29345 - PLACE
      ?auto_29353 - HOIST
      ?auto_29355 - SURFACE
      ?auto_29348 - SURFACE
      ?auto_29349 - TRUCK
      ?auto_29344 - PLACE
      ?auto_29361 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29358 ?auto_29352 ) ( IS-CRATE ?auto_29341 ) ( not ( = ?auto_29341 ?auto_29342 ) ) ( not ( = ?auto_29360 ?auto_29352 ) ) ( HOIST-AT ?auto_29351 ?auto_29360 ) ( not ( = ?auto_29358 ?auto_29351 ) ) ( AVAILABLE ?auto_29351 ) ( SURFACE-AT ?auto_29341 ?auto_29360 ) ( ON ?auto_29341 ?auto_29350 ) ( CLEAR ?auto_29341 ) ( not ( = ?auto_29341 ?auto_29350 ) ) ( not ( = ?auto_29342 ?auto_29350 ) ) ( IS-CRATE ?auto_29342 ) ( not ( = ?auto_29341 ?auto_29357 ) ) ( not ( = ?auto_29342 ?auto_29357 ) ) ( not ( = ?auto_29350 ?auto_29357 ) ) ( not ( = ?auto_29354 ?auto_29352 ) ) ( not ( = ?auto_29360 ?auto_29354 ) ) ( HOIST-AT ?auto_29347 ?auto_29354 ) ( not ( = ?auto_29358 ?auto_29347 ) ) ( not ( = ?auto_29351 ?auto_29347 ) ) ( SURFACE-AT ?auto_29342 ?auto_29354 ) ( ON ?auto_29342 ?auto_29343 ) ( CLEAR ?auto_29342 ) ( not ( = ?auto_29341 ?auto_29343 ) ) ( not ( = ?auto_29342 ?auto_29343 ) ) ( not ( = ?auto_29350 ?auto_29343 ) ) ( not ( = ?auto_29357 ?auto_29343 ) ) ( IS-CRATE ?auto_29357 ) ( not ( = ?auto_29341 ?auto_29346 ) ) ( not ( = ?auto_29342 ?auto_29346 ) ) ( not ( = ?auto_29350 ?auto_29346 ) ) ( not ( = ?auto_29357 ?auto_29346 ) ) ( not ( = ?auto_29343 ?auto_29346 ) ) ( AVAILABLE ?auto_29347 ) ( SURFACE-AT ?auto_29357 ?auto_29354 ) ( ON ?auto_29357 ?auto_29359 ) ( CLEAR ?auto_29357 ) ( not ( = ?auto_29341 ?auto_29359 ) ) ( not ( = ?auto_29342 ?auto_29359 ) ) ( not ( = ?auto_29350 ?auto_29359 ) ) ( not ( = ?auto_29357 ?auto_29359 ) ) ( not ( = ?auto_29343 ?auto_29359 ) ) ( not ( = ?auto_29346 ?auto_29359 ) ) ( IS-CRATE ?auto_29346 ) ( not ( = ?auto_29341 ?auto_29356 ) ) ( not ( = ?auto_29342 ?auto_29356 ) ) ( not ( = ?auto_29350 ?auto_29356 ) ) ( not ( = ?auto_29357 ?auto_29356 ) ) ( not ( = ?auto_29343 ?auto_29356 ) ) ( not ( = ?auto_29346 ?auto_29356 ) ) ( not ( = ?auto_29359 ?auto_29356 ) ) ( not ( = ?auto_29345 ?auto_29352 ) ) ( not ( = ?auto_29360 ?auto_29345 ) ) ( not ( = ?auto_29354 ?auto_29345 ) ) ( HOIST-AT ?auto_29353 ?auto_29345 ) ( not ( = ?auto_29358 ?auto_29353 ) ) ( not ( = ?auto_29351 ?auto_29353 ) ) ( not ( = ?auto_29347 ?auto_29353 ) ) ( AVAILABLE ?auto_29353 ) ( SURFACE-AT ?auto_29346 ?auto_29345 ) ( ON ?auto_29346 ?auto_29355 ) ( CLEAR ?auto_29346 ) ( not ( = ?auto_29341 ?auto_29355 ) ) ( not ( = ?auto_29342 ?auto_29355 ) ) ( not ( = ?auto_29350 ?auto_29355 ) ) ( not ( = ?auto_29357 ?auto_29355 ) ) ( not ( = ?auto_29343 ?auto_29355 ) ) ( not ( = ?auto_29346 ?auto_29355 ) ) ( not ( = ?auto_29359 ?auto_29355 ) ) ( not ( = ?auto_29356 ?auto_29355 ) ) ( SURFACE-AT ?auto_29348 ?auto_29352 ) ( CLEAR ?auto_29348 ) ( IS-CRATE ?auto_29356 ) ( not ( = ?auto_29341 ?auto_29348 ) ) ( not ( = ?auto_29342 ?auto_29348 ) ) ( not ( = ?auto_29350 ?auto_29348 ) ) ( not ( = ?auto_29357 ?auto_29348 ) ) ( not ( = ?auto_29343 ?auto_29348 ) ) ( not ( = ?auto_29346 ?auto_29348 ) ) ( not ( = ?auto_29359 ?auto_29348 ) ) ( not ( = ?auto_29356 ?auto_29348 ) ) ( not ( = ?auto_29355 ?auto_29348 ) ) ( AVAILABLE ?auto_29358 ) ( TRUCK-AT ?auto_29349 ?auto_29344 ) ( not ( = ?auto_29344 ?auto_29352 ) ) ( not ( = ?auto_29360 ?auto_29344 ) ) ( not ( = ?auto_29354 ?auto_29344 ) ) ( not ( = ?auto_29345 ?auto_29344 ) ) ( HOIST-AT ?auto_29361 ?auto_29344 ) ( LIFTING ?auto_29361 ?auto_29356 ) ( not ( = ?auto_29358 ?auto_29361 ) ) ( not ( = ?auto_29351 ?auto_29361 ) ) ( not ( = ?auto_29347 ?auto_29361 ) ) ( not ( = ?auto_29353 ?auto_29361 ) ) )
    :subtasks
    ( ( !LOAD ?auto_29361 ?auto_29356 ?auto_29349 ?auto_29344 )
      ( MAKE-ON ?auto_29341 ?auto_29342 )
      ( MAKE-ON-VERIFY ?auto_29341 ?auto_29342 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29362 - SURFACE
      ?auto_29363 - SURFACE
    )
    :vars
    (
      ?auto_29377 - HOIST
      ?auto_29381 - PLACE
      ?auto_29376 - PLACE
      ?auto_29369 - HOIST
      ?auto_29379 - SURFACE
      ?auto_29378 - SURFACE
      ?auto_29374 - PLACE
      ?auto_29364 - HOIST
      ?auto_29365 - SURFACE
      ?auto_29371 - SURFACE
      ?auto_29375 - SURFACE
      ?auto_29380 - SURFACE
      ?auto_29370 - PLACE
      ?auto_29366 - HOIST
      ?auto_29382 - SURFACE
      ?auto_29372 - SURFACE
      ?auto_29368 - TRUCK
      ?auto_29373 - PLACE
      ?auto_29367 - HOIST
      ?auto_29383 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29377 ?auto_29381 ) ( IS-CRATE ?auto_29362 ) ( not ( = ?auto_29362 ?auto_29363 ) ) ( not ( = ?auto_29376 ?auto_29381 ) ) ( HOIST-AT ?auto_29369 ?auto_29376 ) ( not ( = ?auto_29377 ?auto_29369 ) ) ( AVAILABLE ?auto_29369 ) ( SURFACE-AT ?auto_29362 ?auto_29376 ) ( ON ?auto_29362 ?auto_29379 ) ( CLEAR ?auto_29362 ) ( not ( = ?auto_29362 ?auto_29379 ) ) ( not ( = ?auto_29363 ?auto_29379 ) ) ( IS-CRATE ?auto_29363 ) ( not ( = ?auto_29362 ?auto_29378 ) ) ( not ( = ?auto_29363 ?auto_29378 ) ) ( not ( = ?auto_29379 ?auto_29378 ) ) ( not ( = ?auto_29374 ?auto_29381 ) ) ( not ( = ?auto_29376 ?auto_29374 ) ) ( HOIST-AT ?auto_29364 ?auto_29374 ) ( not ( = ?auto_29377 ?auto_29364 ) ) ( not ( = ?auto_29369 ?auto_29364 ) ) ( SURFACE-AT ?auto_29363 ?auto_29374 ) ( ON ?auto_29363 ?auto_29365 ) ( CLEAR ?auto_29363 ) ( not ( = ?auto_29362 ?auto_29365 ) ) ( not ( = ?auto_29363 ?auto_29365 ) ) ( not ( = ?auto_29379 ?auto_29365 ) ) ( not ( = ?auto_29378 ?auto_29365 ) ) ( IS-CRATE ?auto_29378 ) ( not ( = ?auto_29362 ?auto_29371 ) ) ( not ( = ?auto_29363 ?auto_29371 ) ) ( not ( = ?auto_29379 ?auto_29371 ) ) ( not ( = ?auto_29378 ?auto_29371 ) ) ( not ( = ?auto_29365 ?auto_29371 ) ) ( AVAILABLE ?auto_29364 ) ( SURFACE-AT ?auto_29378 ?auto_29374 ) ( ON ?auto_29378 ?auto_29375 ) ( CLEAR ?auto_29378 ) ( not ( = ?auto_29362 ?auto_29375 ) ) ( not ( = ?auto_29363 ?auto_29375 ) ) ( not ( = ?auto_29379 ?auto_29375 ) ) ( not ( = ?auto_29378 ?auto_29375 ) ) ( not ( = ?auto_29365 ?auto_29375 ) ) ( not ( = ?auto_29371 ?auto_29375 ) ) ( IS-CRATE ?auto_29371 ) ( not ( = ?auto_29362 ?auto_29380 ) ) ( not ( = ?auto_29363 ?auto_29380 ) ) ( not ( = ?auto_29379 ?auto_29380 ) ) ( not ( = ?auto_29378 ?auto_29380 ) ) ( not ( = ?auto_29365 ?auto_29380 ) ) ( not ( = ?auto_29371 ?auto_29380 ) ) ( not ( = ?auto_29375 ?auto_29380 ) ) ( not ( = ?auto_29370 ?auto_29381 ) ) ( not ( = ?auto_29376 ?auto_29370 ) ) ( not ( = ?auto_29374 ?auto_29370 ) ) ( HOIST-AT ?auto_29366 ?auto_29370 ) ( not ( = ?auto_29377 ?auto_29366 ) ) ( not ( = ?auto_29369 ?auto_29366 ) ) ( not ( = ?auto_29364 ?auto_29366 ) ) ( AVAILABLE ?auto_29366 ) ( SURFACE-AT ?auto_29371 ?auto_29370 ) ( ON ?auto_29371 ?auto_29382 ) ( CLEAR ?auto_29371 ) ( not ( = ?auto_29362 ?auto_29382 ) ) ( not ( = ?auto_29363 ?auto_29382 ) ) ( not ( = ?auto_29379 ?auto_29382 ) ) ( not ( = ?auto_29378 ?auto_29382 ) ) ( not ( = ?auto_29365 ?auto_29382 ) ) ( not ( = ?auto_29371 ?auto_29382 ) ) ( not ( = ?auto_29375 ?auto_29382 ) ) ( not ( = ?auto_29380 ?auto_29382 ) ) ( SURFACE-AT ?auto_29372 ?auto_29381 ) ( CLEAR ?auto_29372 ) ( IS-CRATE ?auto_29380 ) ( not ( = ?auto_29362 ?auto_29372 ) ) ( not ( = ?auto_29363 ?auto_29372 ) ) ( not ( = ?auto_29379 ?auto_29372 ) ) ( not ( = ?auto_29378 ?auto_29372 ) ) ( not ( = ?auto_29365 ?auto_29372 ) ) ( not ( = ?auto_29371 ?auto_29372 ) ) ( not ( = ?auto_29375 ?auto_29372 ) ) ( not ( = ?auto_29380 ?auto_29372 ) ) ( not ( = ?auto_29382 ?auto_29372 ) ) ( AVAILABLE ?auto_29377 ) ( TRUCK-AT ?auto_29368 ?auto_29373 ) ( not ( = ?auto_29373 ?auto_29381 ) ) ( not ( = ?auto_29376 ?auto_29373 ) ) ( not ( = ?auto_29374 ?auto_29373 ) ) ( not ( = ?auto_29370 ?auto_29373 ) ) ( HOIST-AT ?auto_29367 ?auto_29373 ) ( not ( = ?auto_29377 ?auto_29367 ) ) ( not ( = ?auto_29369 ?auto_29367 ) ) ( not ( = ?auto_29364 ?auto_29367 ) ) ( not ( = ?auto_29366 ?auto_29367 ) ) ( AVAILABLE ?auto_29367 ) ( SURFACE-AT ?auto_29380 ?auto_29373 ) ( ON ?auto_29380 ?auto_29383 ) ( CLEAR ?auto_29380 ) ( not ( = ?auto_29362 ?auto_29383 ) ) ( not ( = ?auto_29363 ?auto_29383 ) ) ( not ( = ?auto_29379 ?auto_29383 ) ) ( not ( = ?auto_29378 ?auto_29383 ) ) ( not ( = ?auto_29365 ?auto_29383 ) ) ( not ( = ?auto_29371 ?auto_29383 ) ) ( not ( = ?auto_29375 ?auto_29383 ) ) ( not ( = ?auto_29380 ?auto_29383 ) ) ( not ( = ?auto_29382 ?auto_29383 ) ) ( not ( = ?auto_29372 ?auto_29383 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29367 ?auto_29380 ?auto_29383 ?auto_29373 )
      ( MAKE-ON ?auto_29362 ?auto_29363 )
      ( MAKE-ON-VERIFY ?auto_29362 ?auto_29363 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29384 - SURFACE
      ?auto_29385 - SURFACE
    )
    :vars
    (
      ?auto_29397 - HOIST
      ?auto_29398 - PLACE
      ?auto_29394 - PLACE
      ?auto_29391 - HOIST
      ?auto_29388 - SURFACE
      ?auto_29400 - SURFACE
      ?auto_29386 - PLACE
      ?auto_29404 - HOIST
      ?auto_29390 - SURFACE
      ?auto_29401 - SURFACE
      ?auto_29389 - SURFACE
      ?auto_29399 - SURFACE
      ?auto_29387 - PLACE
      ?auto_29395 - HOIST
      ?auto_29405 - SURFACE
      ?auto_29403 - SURFACE
      ?auto_29392 - PLACE
      ?auto_29393 - HOIST
      ?auto_29402 - SURFACE
      ?auto_29396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29397 ?auto_29398 ) ( IS-CRATE ?auto_29384 ) ( not ( = ?auto_29384 ?auto_29385 ) ) ( not ( = ?auto_29394 ?auto_29398 ) ) ( HOIST-AT ?auto_29391 ?auto_29394 ) ( not ( = ?auto_29397 ?auto_29391 ) ) ( AVAILABLE ?auto_29391 ) ( SURFACE-AT ?auto_29384 ?auto_29394 ) ( ON ?auto_29384 ?auto_29388 ) ( CLEAR ?auto_29384 ) ( not ( = ?auto_29384 ?auto_29388 ) ) ( not ( = ?auto_29385 ?auto_29388 ) ) ( IS-CRATE ?auto_29385 ) ( not ( = ?auto_29384 ?auto_29400 ) ) ( not ( = ?auto_29385 ?auto_29400 ) ) ( not ( = ?auto_29388 ?auto_29400 ) ) ( not ( = ?auto_29386 ?auto_29398 ) ) ( not ( = ?auto_29394 ?auto_29386 ) ) ( HOIST-AT ?auto_29404 ?auto_29386 ) ( not ( = ?auto_29397 ?auto_29404 ) ) ( not ( = ?auto_29391 ?auto_29404 ) ) ( SURFACE-AT ?auto_29385 ?auto_29386 ) ( ON ?auto_29385 ?auto_29390 ) ( CLEAR ?auto_29385 ) ( not ( = ?auto_29384 ?auto_29390 ) ) ( not ( = ?auto_29385 ?auto_29390 ) ) ( not ( = ?auto_29388 ?auto_29390 ) ) ( not ( = ?auto_29400 ?auto_29390 ) ) ( IS-CRATE ?auto_29400 ) ( not ( = ?auto_29384 ?auto_29401 ) ) ( not ( = ?auto_29385 ?auto_29401 ) ) ( not ( = ?auto_29388 ?auto_29401 ) ) ( not ( = ?auto_29400 ?auto_29401 ) ) ( not ( = ?auto_29390 ?auto_29401 ) ) ( AVAILABLE ?auto_29404 ) ( SURFACE-AT ?auto_29400 ?auto_29386 ) ( ON ?auto_29400 ?auto_29389 ) ( CLEAR ?auto_29400 ) ( not ( = ?auto_29384 ?auto_29389 ) ) ( not ( = ?auto_29385 ?auto_29389 ) ) ( not ( = ?auto_29388 ?auto_29389 ) ) ( not ( = ?auto_29400 ?auto_29389 ) ) ( not ( = ?auto_29390 ?auto_29389 ) ) ( not ( = ?auto_29401 ?auto_29389 ) ) ( IS-CRATE ?auto_29401 ) ( not ( = ?auto_29384 ?auto_29399 ) ) ( not ( = ?auto_29385 ?auto_29399 ) ) ( not ( = ?auto_29388 ?auto_29399 ) ) ( not ( = ?auto_29400 ?auto_29399 ) ) ( not ( = ?auto_29390 ?auto_29399 ) ) ( not ( = ?auto_29401 ?auto_29399 ) ) ( not ( = ?auto_29389 ?auto_29399 ) ) ( not ( = ?auto_29387 ?auto_29398 ) ) ( not ( = ?auto_29394 ?auto_29387 ) ) ( not ( = ?auto_29386 ?auto_29387 ) ) ( HOIST-AT ?auto_29395 ?auto_29387 ) ( not ( = ?auto_29397 ?auto_29395 ) ) ( not ( = ?auto_29391 ?auto_29395 ) ) ( not ( = ?auto_29404 ?auto_29395 ) ) ( AVAILABLE ?auto_29395 ) ( SURFACE-AT ?auto_29401 ?auto_29387 ) ( ON ?auto_29401 ?auto_29405 ) ( CLEAR ?auto_29401 ) ( not ( = ?auto_29384 ?auto_29405 ) ) ( not ( = ?auto_29385 ?auto_29405 ) ) ( not ( = ?auto_29388 ?auto_29405 ) ) ( not ( = ?auto_29400 ?auto_29405 ) ) ( not ( = ?auto_29390 ?auto_29405 ) ) ( not ( = ?auto_29401 ?auto_29405 ) ) ( not ( = ?auto_29389 ?auto_29405 ) ) ( not ( = ?auto_29399 ?auto_29405 ) ) ( SURFACE-AT ?auto_29403 ?auto_29398 ) ( CLEAR ?auto_29403 ) ( IS-CRATE ?auto_29399 ) ( not ( = ?auto_29384 ?auto_29403 ) ) ( not ( = ?auto_29385 ?auto_29403 ) ) ( not ( = ?auto_29388 ?auto_29403 ) ) ( not ( = ?auto_29400 ?auto_29403 ) ) ( not ( = ?auto_29390 ?auto_29403 ) ) ( not ( = ?auto_29401 ?auto_29403 ) ) ( not ( = ?auto_29389 ?auto_29403 ) ) ( not ( = ?auto_29399 ?auto_29403 ) ) ( not ( = ?auto_29405 ?auto_29403 ) ) ( AVAILABLE ?auto_29397 ) ( not ( = ?auto_29392 ?auto_29398 ) ) ( not ( = ?auto_29394 ?auto_29392 ) ) ( not ( = ?auto_29386 ?auto_29392 ) ) ( not ( = ?auto_29387 ?auto_29392 ) ) ( HOIST-AT ?auto_29393 ?auto_29392 ) ( not ( = ?auto_29397 ?auto_29393 ) ) ( not ( = ?auto_29391 ?auto_29393 ) ) ( not ( = ?auto_29404 ?auto_29393 ) ) ( not ( = ?auto_29395 ?auto_29393 ) ) ( AVAILABLE ?auto_29393 ) ( SURFACE-AT ?auto_29399 ?auto_29392 ) ( ON ?auto_29399 ?auto_29402 ) ( CLEAR ?auto_29399 ) ( not ( = ?auto_29384 ?auto_29402 ) ) ( not ( = ?auto_29385 ?auto_29402 ) ) ( not ( = ?auto_29388 ?auto_29402 ) ) ( not ( = ?auto_29400 ?auto_29402 ) ) ( not ( = ?auto_29390 ?auto_29402 ) ) ( not ( = ?auto_29401 ?auto_29402 ) ) ( not ( = ?auto_29389 ?auto_29402 ) ) ( not ( = ?auto_29399 ?auto_29402 ) ) ( not ( = ?auto_29405 ?auto_29402 ) ) ( not ( = ?auto_29403 ?auto_29402 ) ) ( TRUCK-AT ?auto_29396 ?auto_29398 ) )
    :subtasks
    ( ( !DRIVE ?auto_29396 ?auto_29398 ?auto_29392 )
      ( MAKE-ON ?auto_29384 ?auto_29385 )
      ( MAKE-ON-VERIFY ?auto_29384 ?auto_29385 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29406 - SURFACE
      ?auto_29407 - SURFACE
    )
    :vars
    (
      ?auto_29408 - HOIST
      ?auto_29427 - PLACE
      ?auto_29412 - PLACE
      ?auto_29416 - HOIST
      ?auto_29411 - SURFACE
      ?auto_29409 - SURFACE
      ?auto_29410 - PLACE
      ?auto_29419 - HOIST
      ?auto_29422 - SURFACE
      ?auto_29413 - SURFACE
      ?auto_29421 - SURFACE
      ?auto_29414 - SURFACE
      ?auto_29424 - PLACE
      ?auto_29426 - HOIST
      ?auto_29420 - SURFACE
      ?auto_29418 - SURFACE
      ?auto_29425 - PLACE
      ?auto_29423 - HOIST
      ?auto_29417 - SURFACE
      ?auto_29415 - TRUCK
      ?auto_29428 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29408 ?auto_29427 ) ( IS-CRATE ?auto_29406 ) ( not ( = ?auto_29406 ?auto_29407 ) ) ( not ( = ?auto_29412 ?auto_29427 ) ) ( HOIST-AT ?auto_29416 ?auto_29412 ) ( not ( = ?auto_29408 ?auto_29416 ) ) ( AVAILABLE ?auto_29416 ) ( SURFACE-AT ?auto_29406 ?auto_29412 ) ( ON ?auto_29406 ?auto_29411 ) ( CLEAR ?auto_29406 ) ( not ( = ?auto_29406 ?auto_29411 ) ) ( not ( = ?auto_29407 ?auto_29411 ) ) ( IS-CRATE ?auto_29407 ) ( not ( = ?auto_29406 ?auto_29409 ) ) ( not ( = ?auto_29407 ?auto_29409 ) ) ( not ( = ?auto_29411 ?auto_29409 ) ) ( not ( = ?auto_29410 ?auto_29427 ) ) ( not ( = ?auto_29412 ?auto_29410 ) ) ( HOIST-AT ?auto_29419 ?auto_29410 ) ( not ( = ?auto_29408 ?auto_29419 ) ) ( not ( = ?auto_29416 ?auto_29419 ) ) ( SURFACE-AT ?auto_29407 ?auto_29410 ) ( ON ?auto_29407 ?auto_29422 ) ( CLEAR ?auto_29407 ) ( not ( = ?auto_29406 ?auto_29422 ) ) ( not ( = ?auto_29407 ?auto_29422 ) ) ( not ( = ?auto_29411 ?auto_29422 ) ) ( not ( = ?auto_29409 ?auto_29422 ) ) ( IS-CRATE ?auto_29409 ) ( not ( = ?auto_29406 ?auto_29413 ) ) ( not ( = ?auto_29407 ?auto_29413 ) ) ( not ( = ?auto_29411 ?auto_29413 ) ) ( not ( = ?auto_29409 ?auto_29413 ) ) ( not ( = ?auto_29422 ?auto_29413 ) ) ( AVAILABLE ?auto_29419 ) ( SURFACE-AT ?auto_29409 ?auto_29410 ) ( ON ?auto_29409 ?auto_29421 ) ( CLEAR ?auto_29409 ) ( not ( = ?auto_29406 ?auto_29421 ) ) ( not ( = ?auto_29407 ?auto_29421 ) ) ( not ( = ?auto_29411 ?auto_29421 ) ) ( not ( = ?auto_29409 ?auto_29421 ) ) ( not ( = ?auto_29422 ?auto_29421 ) ) ( not ( = ?auto_29413 ?auto_29421 ) ) ( IS-CRATE ?auto_29413 ) ( not ( = ?auto_29406 ?auto_29414 ) ) ( not ( = ?auto_29407 ?auto_29414 ) ) ( not ( = ?auto_29411 ?auto_29414 ) ) ( not ( = ?auto_29409 ?auto_29414 ) ) ( not ( = ?auto_29422 ?auto_29414 ) ) ( not ( = ?auto_29413 ?auto_29414 ) ) ( not ( = ?auto_29421 ?auto_29414 ) ) ( not ( = ?auto_29424 ?auto_29427 ) ) ( not ( = ?auto_29412 ?auto_29424 ) ) ( not ( = ?auto_29410 ?auto_29424 ) ) ( HOIST-AT ?auto_29426 ?auto_29424 ) ( not ( = ?auto_29408 ?auto_29426 ) ) ( not ( = ?auto_29416 ?auto_29426 ) ) ( not ( = ?auto_29419 ?auto_29426 ) ) ( AVAILABLE ?auto_29426 ) ( SURFACE-AT ?auto_29413 ?auto_29424 ) ( ON ?auto_29413 ?auto_29420 ) ( CLEAR ?auto_29413 ) ( not ( = ?auto_29406 ?auto_29420 ) ) ( not ( = ?auto_29407 ?auto_29420 ) ) ( not ( = ?auto_29411 ?auto_29420 ) ) ( not ( = ?auto_29409 ?auto_29420 ) ) ( not ( = ?auto_29422 ?auto_29420 ) ) ( not ( = ?auto_29413 ?auto_29420 ) ) ( not ( = ?auto_29421 ?auto_29420 ) ) ( not ( = ?auto_29414 ?auto_29420 ) ) ( IS-CRATE ?auto_29414 ) ( not ( = ?auto_29406 ?auto_29418 ) ) ( not ( = ?auto_29407 ?auto_29418 ) ) ( not ( = ?auto_29411 ?auto_29418 ) ) ( not ( = ?auto_29409 ?auto_29418 ) ) ( not ( = ?auto_29422 ?auto_29418 ) ) ( not ( = ?auto_29413 ?auto_29418 ) ) ( not ( = ?auto_29421 ?auto_29418 ) ) ( not ( = ?auto_29414 ?auto_29418 ) ) ( not ( = ?auto_29420 ?auto_29418 ) ) ( not ( = ?auto_29425 ?auto_29427 ) ) ( not ( = ?auto_29412 ?auto_29425 ) ) ( not ( = ?auto_29410 ?auto_29425 ) ) ( not ( = ?auto_29424 ?auto_29425 ) ) ( HOIST-AT ?auto_29423 ?auto_29425 ) ( not ( = ?auto_29408 ?auto_29423 ) ) ( not ( = ?auto_29416 ?auto_29423 ) ) ( not ( = ?auto_29419 ?auto_29423 ) ) ( not ( = ?auto_29426 ?auto_29423 ) ) ( AVAILABLE ?auto_29423 ) ( SURFACE-AT ?auto_29414 ?auto_29425 ) ( ON ?auto_29414 ?auto_29417 ) ( CLEAR ?auto_29414 ) ( not ( = ?auto_29406 ?auto_29417 ) ) ( not ( = ?auto_29407 ?auto_29417 ) ) ( not ( = ?auto_29411 ?auto_29417 ) ) ( not ( = ?auto_29409 ?auto_29417 ) ) ( not ( = ?auto_29422 ?auto_29417 ) ) ( not ( = ?auto_29413 ?auto_29417 ) ) ( not ( = ?auto_29421 ?auto_29417 ) ) ( not ( = ?auto_29414 ?auto_29417 ) ) ( not ( = ?auto_29420 ?auto_29417 ) ) ( not ( = ?auto_29418 ?auto_29417 ) ) ( TRUCK-AT ?auto_29415 ?auto_29427 ) ( SURFACE-AT ?auto_29428 ?auto_29427 ) ( CLEAR ?auto_29428 ) ( LIFTING ?auto_29408 ?auto_29418 ) ( IS-CRATE ?auto_29418 ) ( not ( = ?auto_29406 ?auto_29428 ) ) ( not ( = ?auto_29407 ?auto_29428 ) ) ( not ( = ?auto_29411 ?auto_29428 ) ) ( not ( = ?auto_29409 ?auto_29428 ) ) ( not ( = ?auto_29422 ?auto_29428 ) ) ( not ( = ?auto_29413 ?auto_29428 ) ) ( not ( = ?auto_29421 ?auto_29428 ) ) ( not ( = ?auto_29414 ?auto_29428 ) ) ( not ( = ?auto_29420 ?auto_29428 ) ) ( not ( = ?auto_29418 ?auto_29428 ) ) ( not ( = ?auto_29417 ?auto_29428 ) ) )
    :subtasks
    ( ( !DROP ?auto_29408 ?auto_29418 ?auto_29428 ?auto_29427 )
      ( MAKE-ON ?auto_29406 ?auto_29407 )
      ( MAKE-ON-VERIFY ?auto_29406 ?auto_29407 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29429 - SURFACE
      ?auto_29430 - SURFACE
    )
    :vars
    (
      ?auto_29441 - HOIST
      ?auto_29437 - PLACE
      ?auto_29444 - PLACE
      ?auto_29433 - HOIST
      ?auto_29432 - SURFACE
      ?auto_29443 - SURFACE
      ?auto_29431 - PLACE
      ?auto_29442 - HOIST
      ?auto_29439 - SURFACE
      ?auto_29449 - SURFACE
      ?auto_29445 - SURFACE
      ?auto_29440 - SURFACE
      ?auto_29450 - PLACE
      ?auto_29436 - HOIST
      ?auto_29451 - SURFACE
      ?auto_29446 - SURFACE
      ?auto_29435 - PLACE
      ?auto_29434 - HOIST
      ?auto_29447 - SURFACE
      ?auto_29448 - TRUCK
      ?auto_29438 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29441 ?auto_29437 ) ( IS-CRATE ?auto_29429 ) ( not ( = ?auto_29429 ?auto_29430 ) ) ( not ( = ?auto_29444 ?auto_29437 ) ) ( HOIST-AT ?auto_29433 ?auto_29444 ) ( not ( = ?auto_29441 ?auto_29433 ) ) ( AVAILABLE ?auto_29433 ) ( SURFACE-AT ?auto_29429 ?auto_29444 ) ( ON ?auto_29429 ?auto_29432 ) ( CLEAR ?auto_29429 ) ( not ( = ?auto_29429 ?auto_29432 ) ) ( not ( = ?auto_29430 ?auto_29432 ) ) ( IS-CRATE ?auto_29430 ) ( not ( = ?auto_29429 ?auto_29443 ) ) ( not ( = ?auto_29430 ?auto_29443 ) ) ( not ( = ?auto_29432 ?auto_29443 ) ) ( not ( = ?auto_29431 ?auto_29437 ) ) ( not ( = ?auto_29444 ?auto_29431 ) ) ( HOIST-AT ?auto_29442 ?auto_29431 ) ( not ( = ?auto_29441 ?auto_29442 ) ) ( not ( = ?auto_29433 ?auto_29442 ) ) ( SURFACE-AT ?auto_29430 ?auto_29431 ) ( ON ?auto_29430 ?auto_29439 ) ( CLEAR ?auto_29430 ) ( not ( = ?auto_29429 ?auto_29439 ) ) ( not ( = ?auto_29430 ?auto_29439 ) ) ( not ( = ?auto_29432 ?auto_29439 ) ) ( not ( = ?auto_29443 ?auto_29439 ) ) ( IS-CRATE ?auto_29443 ) ( not ( = ?auto_29429 ?auto_29449 ) ) ( not ( = ?auto_29430 ?auto_29449 ) ) ( not ( = ?auto_29432 ?auto_29449 ) ) ( not ( = ?auto_29443 ?auto_29449 ) ) ( not ( = ?auto_29439 ?auto_29449 ) ) ( AVAILABLE ?auto_29442 ) ( SURFACE-AT ?auto_29443 ?auto_29431 ) ( ON ?auto_29443 ?auto_29445 ) ( CLEAR ?auto_29443 ) ( not ( = ?auto_29429 ?auto_29445 ) ) ( not ( = ?auto_29430 ?auto_29445 ) ) ( not ( = ?auto_29432 ?auto_29445 ) ) ( not ( = ?auto_29443 ?auto_29445 ) ) ( not ( = ?auto_29439 ?auto_29445 ) ) ( not ( = ?auto_29449 ?auto_29445 ) ) ( IS-CRATE ?auto_29449 ) ( not ( = ?auto_29429 ?auto_29440 ) ) ( not ( = ?auto_29430 ?auto_29440 ) ) ( not ( = ?auto_29432 ?auto_29440 ) ) ( not ( = ?auto_29443 ?auto_29440 ) ) ( not ( = ?auto_29439 ?auto_29440 ) ) ( not ( = ?auto_29449 ?auto_29440 ) ) ( not ( = ?auto_29445 ?auto_29440 ) ) ( not ( = ?auto_29450 ?auto_29437 ) ) ( not ( = ?auto_29444 ?auto_29450 ) ) ( not ( = ?auto_29431 ?auto_29450 ) ) ( HOIST-AT ?auto_29436 ?auto_29450 ) ( not ( = ?auto_29441 ?auto_29436 ) ) ( not ( = ?auto_29433 ?auto_29436 ) ) ( not ( = ?auto_29442 ?auto_29436 ) ) ( AVAILABLE ?auto_29436 ) ( SURFACE-AT ?auto_29449 ?auto_29450 ) ( ON ?auto_29449 ?auto_29451 ) ( CLEAR ?auto_29449 ) ( not ( = ?auto_29429 ?auto_29451 ) ) ( not ( = ?auto_29430 ?auto_29451 ) ) ( not ( = ?auto_29432 ?auto_29451 ) ) ( not ( = ?auto_29443 ?auto_29451 ) ) ( not ( = ?auto_29439 ?auto_29451 ) ) ( not ( = ?auto_29449 ?auto_29451 ) ) ( not ( = ?auto_29445 ?auto_29451 ) ) ( not ( = ?auto_29440 ?auto_29451 ) ) ( IS-CRATE ?auto_29440 ) ( not ( = ?auto_29429 ?auto_29446 ) ) ( not ( = ?auto_29430 ?auto_29446 ) ) ( not ( = ?auto_29432 ?auto_29446 ) ) ( not ( = ?auto_29443 ?auto_29446 ) ) ( not ( = ?auto_29439 ?auto_29446 ) ) ( not ( = ?auto_29449 ?auto_29446 ) ) ( not ( = ?auto_29445 ?auto_29446 ) ) ( not ( = ?auto_29440 ?auto_29446 ) ) ( not ( = ?auto_29451 ?auto_29446 ) ) ( not ( = ?auto_29435 ?auto_29437 ) ) ( not ( = ?auto_29444 ?auto_29435 ) ) ( not ( = ?auto_29431 ?auto_29435 ) ) ( not ( = ?auto_29450 ?auto_29435 ) ) ( HOIST-AT ?auto_29434 ?auto_29435 ) ( not ( = ?auto_29441 ?auto_29434 ) ) ( not ( = ?auto_29433 ?auto_29434 ) ) ( not ( = ?auto_29442 ?auto_29434 ) ) ( not ( = ?auto_29436 ?auto_29434 ) ) ( AVAILABLE ?auto_29434 ) ( SURFACE-AT ?auto_29440 ?auto_29435 ) ( ON ?auto_29440 ?auto_29447 ) ( CLEAR ?auto_29440 ) ( not ( = ?auto_29429 ?auto_29447 ) ) ( not ( = ?auto_29430 ?auto_29447 ) ) ( not ( = ?auto_29432 ?auto_29447 ) ) ( not ( = ?auto_29443 ?auto_29447 ) ) ( not ( = ?auto_29439 ?auto_29447 ) ) ( not ( = ?auto_29449 ?auto_29447 ) ) ( not ( = ?auto_29445 ?auto_29447 ) ) ( not ( = ?auto_29440 ?auto_29447 ) ) ( not ( = ?auto_29451 ?auto_29447 ) ) ( not ( = ?auto_29446 ?auto_29447 ) ) ( TRUCK-AT ?auto_29448 ?auto_29437 ) ( SURFACE-AT ?auto_29438 ?auto_29437 ) ( CLEAR ?auto_29438 ) ( IS-CRATE ?auto_29446 ) ( not ( = ?auto_29429 ?auto_29438 ) ) ( not ( = ?auto_29430 ?auto_29438 ) ) ( not ( = ?auto_29432 ?auto_29438 ) ) ( not ( = ?auto_29443 ?auto_29438 ) ) ( not ( = ?auto_29439 ?auto_29438 ) ) ( not ( = ?auto_29449 ?auto_29438 ) ) ( not ( = ?auto_29445 ?auto_29438 ) ) ( not ( = ?auto_29440 ?auto_29438 ) ) ( not ( = ?auto_29451 ?auto_29438 ) ) ( not ( = ?auto_29446 ?auto_29438 ) ) ( not ( = ?auto_29447 ?auto_29438 ) ) ( AVAILABLE ?auto_29441 ) ( IN ?auto_29446 ?auto_29448 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29441 ?auto_29446 ?auto_29448 ?auto_29437 )
      ( MAKE-ON ?auto_29429 ?auto_29430 )
      ( MAKE-ON-VERIFY ?auto_29429 ?auto_29430 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29452 - SURFACE
      ?auto_29453 - SURFACE
    )
    :vars
    (
      ?auto_29454 - HOIST
      ?auto_29472 - PLACE
      ?auto_29468 - PLACE
      ?auto_29464 - HOIST
      ?auto_29460 - SURFACE
      ?auto_29474 - SURFACE
      ?auto_29455 - PLACE
      ?auto_29466 - HOIST
      ?auto_29473 - SURFACE
      ?auto_29471 - SURFACE
      ?auto_29459 - SURFACE
      ?auto_29456 - SURFACE
      ?auto_29469 - PLACE
      ?auto_29458 - HOIST
      ?auto_29461 - SURFACE
      ?auto_29470 - SURFACE
      ?auto_29465 - PLACE
      ?auto_29462 - HOIST
      ?auto_29457 - SURFACE
      ?auto_29467 - SURFACE
      ?auto_29463 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29454 ?auto_29472 ) ( IS-CRATE ?auto_29452 ) ( not ( = ?auto_29452 ?auto_29453 ) ) ( not ( = ?auto_29468 ?auto_29472 ) ) ( HOIST-AT ?auto_29464 ?auto_29468 ) ( not ( = ?auto_29454 ?auto_29464 ) ) ( AVAILABLE ?auto_29464 ) ( SURFACE-AT ?auto_29452 ?auto_29468 ) ( ON ?auto_29452 ?auto_29460 ) ( CLEAR ?auto_29452 ) ( not ( = ?auto_29452 ?auto_29460 ) ) ( not ( = ?auto_29453 ?auto_29460 ) ) ( IS-CRATE ?auto_29453 ) ( not ( = ?auto_29452 ?auto_29474 ) ) ( not ( = ?auto_29453 ?auto_29474 ) ) ( not ( = ?auto_29460 ?auto_29474 ) ) ( not ( = ?auto_29455 ?auto_29472 ) ) ( not ( = ?auto_29468 ?auto_29455 ) ) ( HOIST-AT ?auto_29466 ?auto_29455 ) ( not ( = ?auto_29454 ?auto_29466 ) ) ( not ( = ?auto_29464 ?auto_29466 ) ) ( SURFACE-AT ?auto_29453 ?auto_29455 ) ( ON ?auto_29453 ?auto_29473 ) ( CLEAR ?auto_29453 ) ( not ( = ?auto_29452 ?auto_29473 ) ) ( not ( = ?auto_29453 ?auto_29473 ) ) ( not ( = ?auto_29460 ?auto_29473 ) ) ( not ( = ?auto_29474 ?auto_29473 ) ) ( IS-CRATE ?auto_29474 ) ( not ( = ?auto_29452 ?auto_29471 ) ) ( not ( = ?auto_29453 ?auto_29471 ) ) ( not ( = ?auto_29460 ?auto_29471 ) ) ( not ( = ?auto_29474 ?auto_29471 ) ) ( not ( = ?auto_29473 ?auto_29471 ) ) ( AVAILABLE ?auto_29466 ) ( SURFACE-AT ?auto_29474 ?auto_29455 ) ( ON ?auto_29474 ?auto_29459 ) ( CLEAR ?auto_29474 ) ( not ( = ?auto_29452 ?auto_29459 ) ) ( not ( = ?auto_29453 ?auto_29459 ) ) ( not ( = ?auto_29460 ?auto_29459 ) ) ( not ( = ?auto_29474 ?auto_29459 ) ) ( not ( = ?auto_29473 ?auto_29459 ) ) ( not ( = ?auto_29471 ?auto_29459 ) ) ( IS-CRATE ?auto_29471 ) ( not ( = ?auto_29452 ?auto_29456 ) ) ( not ( = ?auto_29453 ?auto_29456 ) ) ( not ( = ?auto_29460 ?auto_29456 ) ) ( not ( = ?auto_29474 ?auto_29456 ) ) ( not ( = ?auto_29473 ?auto_29456 ) ) ( not ( = ?auto_29471 ?auto_29456 ) ) ( not ( = ?auto_29459 ?auto_29456 ) ) ( not ( = ?auto_29469 ?auto_29472 ) ) ( not ( = ?auto_29468 ?auto_29469 ) ) ( not ( = ?auto_29455 ?auto_29469 ) ) ( HOIST-AT ?auto_29458 ?auto_29469 ) ( not ( = ?auto_29454 ?auto_29458 ) ) ( not ( = ?auto_29464 ?auto_29458 ) ) ( not ( = ?auto_29466 ?auto_29458 ) ) ( AVAILABLE ?auto_29458 ) ( SURFACE-AT ?auto_29471 ?auto_29469 ) ( ON ?auto_29471 ?auto_29461 ) ( CLEAR ?auto_29471 ) ( not ( = ?auto_29452 ?auto_29461 ) ) ( not ( = ?auto_29453 ?auto_29461 ) ) ( not ( = ?auto_29460 ?auto_29461 ) ) ( not ( = ?auto_29474 ?auto_29461 ) ) ( not ( = ?auto_29473 ?auto_29461 ) ) ( not ( = ?auto_29471 ?auto_29461 ) ) ( not ( = ?auto_29459 ?auto_29461 ) ) ( not ( = ?auto_29456 ?auto_29461 ) ) ( IS-CRATE ?auto_29456 ) ( not ( = ?auto_29452 ?auto_29470 ) ) ( not ( = ?auto_29453 ?auto_29470 ) ) ( not ( = ?auto_29460 ?auto_29470 ) ) ( not ( = ?auto_29474 ?auto_29470 ) ) ( not ( = ?auto_29473 ?auto_29470 ) ) ( not ( = ?auto_29471 ?auto_29470 ) ) ( not ( = ?auto_29459 ?auto_29470 ) ) ( not ( = ?auto_29456 ?auto_29470 ) ) ( not ( = ?auto_29461 ?auto_29470 ) ) ( not ( = ?auto_29465 ?auto_29472 ) ) ( not ( = ?auto_29468 ?auto_29465 ) ) ( not ( = ?auto_29455 ?auto_29465 ) ) ( not ( = ?auto_29469 ?auto_29465 ) ) ( HOIST-AT ?auto_29462 ?auto_29465 ) ( not ( = ?auto_29454 ?auto_29462 ) ) ( not ( = ?auto_29464 ?auto_29462 ) ) ( not ( = ?auto_29466 ?auto_29462 ) ) ( not ( = ?auto_29458 ?auto_29462 ) ) ( AVAILABLE ?auto_29462 ) ( SURFACE-AT ?auto_29456 ?auto_29465 ) ( ON ?auto_29456 ?auto_29457 ) ( CLEAR ?auto_29456 ) ( not ( = ?auto_29452 ?auto_29457 ) ) ( not ( = ?auto_29453 ?auto_29457 ) ) ( not ( = ?auto_29460 ?auto_29457 ) ) ( not ( = ?auto_29474 ?auto_29457 ) ) ( not ( = ?auto_29473 ?auto_29457 ) ) ( not ( = ?auto_29471 ?auto_29457 ) ) ( not ( = ?auto_29459 ?auto_29457 ) ) ( not ( = ?auto_29456 ?auto_29457 ) ) ( not ( = ?auto_29461 ?auto_29457 ) ) ( not ( = ?auto_29470 ?auto_29457 ) ) ( SURFACE-AT ?auto_29467 ?auto_29472 ) ( CLEAR ?auto_29467 ) ( IS-CRATE ?auto_29470 ) ( not ( = ?auto_29452 ?auto_29467 ) ) ( not ( = ?auto_29453 ?auto_29467 ) ) ( not ( = ?auto_29460 ?auto_29467 ) ) ( not ( = ?auto_29474 ?auto_29467 ) ) ( not ( = ?auto_29473 ?auto_29467 ) ) ( not ( = ?auto_29471 ?auto_29467 ) ) ( not ( = ?auto_29459 ?auto_29467 ) ) ( not ( = ?auto_29456 ?auto_29467 ) ) ( not ( = ?auto_29461 ?auto_29467 ) ) ( not ( = ?auto_29470 ?auto_29467 ) ) ( not ( = ?auto_29457 ?auto_29467 ) ) ( AVAILABLE ?auto_29454 ) ( IN ?auto_29470 ?auto_29463 ) ( TRUCK-AT ?auto_29463 ?auto_29465 ) )
    :subtasks
    ( ( !DRIVE ?auto_29463 ?auto_29465 ?auto_29472 )
      ( MAKE-ON ?auto_29452 ?auto_29453 )
      ( MAKE-ON-VERIFY ?auto_29452 ?auto_29453 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29475 - SURFACE
      ?auto_29476 - SURFACE
    )
    :vars
    (
      ?auto_29494 - HOIST
      ?auto_29480 - PLACE
      ?auto_29492 - PLACE
      ?auto_29483 - HOIST
      ?auto_29487 - SURFACE
      ?auto_29497 - SURFACE
      ?auto_29491 - PLACE
      ?auto_29495 - HOIST
      ?auto_29477 - SURFACE
      ?auto_29490 - SURFACE
      ?auto_29482 - SURFACE
      ?auto_29496 - SURFACE
      ?auto_29486 - PLACE
      ?auto_29484 - HOIST
      ?auto_29488 - SURFACE
      ?auto_29489 - SURFACE
      ?auto_29485 - PLACE
      ?auto_29493 - HOIST
      ?auto_29481 - SURFACE
      ?auto_29479 - SURFACE
      ?auto_29478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29494 ?auto_29480 ) ( IS-CRATE ?auto_29475 ) ( not ( = ?auto_29475 ?auto_29476 ) ) ( not ( = ?auto_29492 ?auto_29480 ) ) ( HOIST-AT ?auto_29483 ?auto_29492 ) ( not ( = ?auto_29494 ?auto_29483 ) ) ( AVAILABLE ?auto_29483 ) ( SURFACE-AT ?auto_29475 ?auto_29492 ) ( ON ?auto_29475 ?auto_29487 ) ( CLEAR ?auto_29475 ) ( not ( = ?auto_29475 ?auto_29487 ) ) ( not ( = ?auto_29476 ?auto_29487 ) ) ( IS-CRATE ?auto_29476 ) ( not ( = ?auto_29475 ?auto_29497 ) ) ( not ( = ?auto_29476 ?auto_29497 ) ) ( not ( = ?auto_29487 ?auto_29497 ) ) ( not ( = ?auto_29491 ?auto_29480 ) ) ( not ( = ?auto_29492 ?auto_29491 ) ) ( HOIST-AT ?auto_29495 ?auto_29491 ) ( not ( = ?auto_29494 ?auto_29495 ) ) ( not ( = ?auto_29483 ?auto_29495 ) ) ( SURFACE-AT ?auto_29476 ?auto_29491 ) ( ON ?auto_29476 ?auto_29477 ) ( CLEAR ?auto_29476 ) ( not ( = ?auto_29475 ?auto_29477 ) ) ( not ( = ?auto_29476 ?auto_29477 ) ) ( not ( = ?auto_29487 ?auto_29477 ) ) ( not ( = ?auto_29497 ?auto_29477 ) ) ( IS-CRATE ?auto_29497 ) ( not ( = ?auto_29475 ?auto_29490 ) ) ( not ( = ?auto_29476 ?auto_29490 ) ) ( not ( = ?auto_29487 ?auto_29490 ) ) ( not ( = ?auto_29497 ?auto_29490 ) ) ( not ( = ?auto_29477 ?auto_29490 ) ) ( AVAILABLE ?auto_29495 ) ( SURFACE-AT ?auto_29497 ?auto_29491 ) ( ON ?auto_29497 ?auto_29482 ) ( CLEAR ?auto_29497 ) ( not ( = ?auto_29475 ?auto_29482 ) ) ( not ( = ?auto_29476 ?auto_29482 ) ) ( not ( = ?auto_29487 ?auto_29482 ) ) ( not ( = ?auto_29497 ?auto_29482 ) ) ( not ( = ?auto_29477 ?auto_29482 ) ) ( not ( = ?auto_29490 ?auto_29482 ) ) ( IS-CRATE ?auto_29490 ) ( not ( = ?auto_29475 ?auto_29496 ) ) ( not ( = ?auto_29476 ?auto_29496 ) ) ( not ( = ?auto_29487 ?auto_29496 ) ) ( not ( = ?auto_29497 ?auto_29496 ) ) ( not ( = ?auto_29477 ?auto_29496 ) ) ( not ( = ?auto_29490 ?auto_29496 ) ) ( not ( = ?auto_29482 ?auto_29496 ) ) ( not ( = ?auto_29486 ?auto_29480 ) ) ( not ( = ?auto_29492 ?auto_29486 ) ) ( not ( = ?auto_29491 ?auto_29486 ) ) ( HOIST-AT ?auto_29484 ?auto_29486 ) ( not ( = ?auto_29494 ?auto_29484 ) ) ( not ( = ?auto_29483 ?auto_29484 ) ) ( not ( = ?auto_29495 ?auto_29484 ) ) ( AVAILABLE ?auto_29484 ) ( SURFACE-AT ?auto_29490 ?auto_29486 ) ( ON ?auto_29490 ?auto_29488 ) ( CLEAR ?auto_29490 ) ( not ( = ?auto_29475 ?auto_29488 ) ) ( not ( = ?auto_29476 ?auto_29488 ) ) ( not ( = ?auto_29487 ?auto_29488 ) ) ( not ( = ?auto_29497 ?auto_29488 ) ) ( not ( = ?auto_29477 ?auto_29488 ) ) ( not ( = ?auto_29490 ?auto_29488 ) ) ( not ( = ?auto_29482 ?auto_29488 ) ) ( not ( = ?auto_29496 ?auto_29488 ) ) ( IS-CRATE ?auto_29496 ) ( not ( = ?auto_29475 ?auto_29489 ) ) ( not ( = ?auto_29476 ?auto_29489 ) ) ( not ( = ?auto_29487 ?auto_29489 ) ) ( not ( = ?auto_29497 ?auto_29489 ) ) ( not ( = ?auto_29477 ?auto_29489 ) ) ( not ( = ?auto_29490 ?auto_29489 ) ) ( not ( = ?auto_29482 ?auto_29489 ) ) ( not ( = ?auto_29496 ?auto_29489 ) ) ( not ( = ?auto_29488 ?auto_29489 ) ) ( not ( = ?auto_29485 ?auto_29480 ) ) ( not ( = ?auto_29492 ?auto_29485 ) ) ( not ( = ?auto_29491 ?auto_29485 ) ) ( not ( = ?auto_29486 ?auto_29485 ) ) ( HOIST-AT ?auto_29493 ?auto_29485 ) ( not ( = ?auto_29494 ?auto_29493 ) ) ( not ( = ?auto_29483 ?auto_29493 ) ) ( not ( = ?auto_29495 ?auto_29493 ) ) ( not ( = ?auto_29484 ?auto_29493 ) ) ( SURFACE-AT ?auto_29496 ?auto_29485 ) ( ON ?auto_29496 ?auto_29481 ) ( CLEAR ?auto_29496 ) ( not ( = ?auto_29475 ?auto_29481 ) ) ( not ( = ?auto_29476 ?auto_29481 ) ) ( not ( = ?auto_29487 ?auto_29481 ) ) ( not ( = ?auto_29497 ?auto_29481 ) ) ( not ( = ?auto_29477 ?auto_29481 ) ) ( not ( = ?auto_29490 ?auto_29481 ) ) ( not ( = ?auto_29482 ?auto_29481 ) ) ( not ( = ?auto_29496 ?auto_29481 ) ) ( not ( = ?auto_29488 ?auto_29481 ) ) ( not ( = ?auto_29489 ?auto_29481 ) ) ( SURFACE-AT ?auto_29479 ?auto_29480 ) ( CLEAR ?auto_29479 ) ( IS-CRATE ?auto_29489 ) ( not ( = ?auto_29475 ?auto_29479 ) ) ( not ( = ?auto_29476 ?auto_29479 ) ) ( not ( = ?auto_29487 ?auto_29479 ) ) ( not ( = ?auto_29497 ?auto_29479 ) ) ( not ( = ?auto_29477 ?auto_29479 ) ) ( not ( = ?auto_29490 ?auto_29479 ) ) ( not ( = ?auto_29482 ?auto_29479 ) ) ( not ( = ?auto_29496 ?auto_29479 ) ) ( not ( = ?auto_29488 ?auto_29479 ) ) ( not ( = ?auto_29489 ?auto_29479 ) ) ( not ( = ?auto_29481 ?auto_29479 ) ) ( AVAILABLE ?auto_29494 ) ( TRUCK-AT ?auto_29478 ?auto_29485 ) ( LIFTING ?auto_29493 ?auto_29489 ) )
    :subtasks
    ( ( !LOAD ?auto_29493 ?auto_29489 ?auto_29478 ?auto_29485 )
      ( MAKE-ON ?auto_29475 ?auto_29476 )
      ( MAKE-ON-VERIFY ?auto_29475 ?auto_29476 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29498 - SURFACE
      ?auto_29499 - SURFACE
    )
    :vars
    (
      ?auto_29504 - HOIST
      ?auto_29512 - PLACE
      ?auto_29506 - PLACE
      ?auto_29520 - HOIST
      ?auto_29516 - SURFACE
      ?auto_29503 - SURFACE
      ?auto_29505 - PLACE
      ?auto_29502 - HOIST
      ?auto_29501 - SURFACE
      ?auto_29518 - SURFACE
      ?auto_29508 - SURFACE
      ?auto_29500 - SURFACE
      ?auto_29517 - PLACE
      ?auto_29509 - HOIST
      ?auto_29515 - SURFACE
      ?auto_29514 - SURFACE
      ?auto_29507 - PLACE
      ?auto_29519 - HOIST
      ?auto_29513 - SURFACE
      ?auto_29510 - SURFACE
      ?auto_29511 - TRUCK
      ?auto_29521 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29504 ?auto_29512 ) ( IS-CRATE ?auto_29498 ) ( not ( = ?auto_29498 ?auto_29499 ) ) ( not ( = ?auto_29506 ?auto_29512 ) ) ( HOIST-AT ?auto_29520 ?auto_29506 ) ( not ( = ?auto_29504 ?auto_29520 ) ) ( AVAILABLE ?auto_29520 ) ( SURFACE-AT ?auto_29498 ?auto_29506 ) ( ON ?auto_29498 ?auto_29516 ) ( CLEAR ?auto_29498 ) ( not ( = ?auto_29498 ?auto_29516 ) ) ( not ( = ?auto_29499 ?auto_29516 ) ) ( IS-CRATE ?auto_29499 ) ( not ( = ?auto_29498 ?auto_29503 ) ) ( not ( = ?auto_29499 ?auto_29503 ) ) ( not ( = ?auto_29516 ?auto_29503 ) ) ( not ( = ?auto_29505 ?auto_29512 ) ) ( not ( = ?auto_29506 ?auto_29505 ) ) ( HOIST-AT ?auto_29502 ?auto_29505 ) ( not ( = ?auto_29504 ?auto_29502 ) ) ( not ( = ?auto_29520 ?auto_29502 ) ) ( SURFACE-AT ?auto_29499 ?auto_29505 ) ( ON ?auto_29499 ?auto_29501 ) ( CLEAR ?auto_29499 ) ( not ( = ?auto_29498 ?auto_29501 ) ) ( not ( = ?auto_29499 ?auto_29501 ) ) ( not ( = ?auto_29516 ?auto_29501 ) ) ( not ( = ?auto_29503 ?auto_29501 ) ) ( IS-CRATE ?auto_29503 ) ( not ( = ?auto_29498 ?auto_29518 ) ) ( not ( = ?auto_29499 ?auto_29518 ) ) ( not ( = ?auto_29516 ?auto_29518 ) ) ( not ( = ?auto_29503 ?auto_29518 ) ) ( not ( = ?auto_29501 ?auto_29518 ) ) ( AVAILABLE ?auto_29502 ) ( SURFACE-AT ?auto_29503 ?auto_29505 ) ( ON ?auto_29503 ?auto_29508 ) ( CLEAR ?auto_29503 ) ( not ( = ?auto_29498 ?auto_29508 ) ) ( not ( = ?auto_29499 ?auto_29508 ) ) ( not ( = ?auto_29516 ?auto_29508 ) ) ( not ( = ?auto_29503 ?auto_29508 ) ) ( not ( = ?auto_29501 ?auto_29508 ) ) ( not ( = ?auto_29518 ?auto_29508 ) ) ( IS-CRATE ?auto_29518 ) ( not ( = ?auto_29498 ?auto_29500 ) ) ( not ( = ?auto_29499 ?auto_29500 ) ) ( not ( = ?auto_29516 ?auto_29500 ) ) ( not ( = ?auto_29503 ?auto_29500 ) ) ( not ( = ?auto_29501 ?auto_29500 ) ) ( not ( = ?auto_29518 ?auto_29500 ) ) ( not ( = ?auto_29508 ?auto_29500 ) ) ( not ( = ?auto_29517 ?auto_29512 ) ) ( not ( = ?auto_29506 ?auto_29517 ) ) ( not ( = ?auto_29505 ?auto_29517 ) ) ( HOIST-AT ?auto_29509 ?auto_29517 ) ( not ( = ?auto_29504 ?auto_29509 ) ) ( not ( = ?auto_29520 ?auto_29509 ) ) ( not ( = ?auto_29502 ?auto_29509 ) ) ( AVAILABLE ?auto_29509 ) ( SURFACE-AT ?auto_29518 ?auto_29517 ) ( ON ?auto_29518 ?auto_29515 ) ( CLEAR ?auto_29518 ) ( not ( = ?auto_29498 ?auto_29515 ) ) ( not ( = ?auto_29499 ?auto_29515 ) ) ( not ( = ?auto_29516 ?auto_29515 ) ) ( not ( = ?auto_29503 ?auto_29515 ) ) ( not ( = ?auto_29501 ?auto_29515 ) ) ( not ( = ?auto_29518 ?auto_29515 ) ) ( not ( = ?auto_29508 ?auto_29515 ) ) ( not ( = ?auto_29500 ?auto_29515 ) ) ( IS-CRATE ?auto_29500 ) ( not ( = ?auto_29498 ?auto_29514 ) ) ( not ( = ?auto_29499 ?auto_29514 ) ) ( not ( = ?auto_29516 ?auto_29514 ) ) ( not ( = ?auto_29503 ?auto_29514 ) ) ( not ( = ?auto_29501 ?auto_29514 ) ) ( not ( = ?auto_29518 ?auto_29514 ) ) ( not ( = ?auto_29508 ?auto_29514 ) ) ( not ( = ?auto_29500 ?auto_29514 ) ) ( not ( = ?auto_29515 ?auto_29514 ) ) ( not ( = ?auto_29507 ?auto_29512 ) ) ( not ( = ?auto_29506 ?auto_29507 ) ) ( not ( = ?auto_29505 ?auto_29507 ) ) ( not ( = ?auto_29517 ?auto_29507 ) ) ( HOIST-AT ?auto_29519 ?auto_29507 ) ( not ( = ?auto_29504 ?auto_29519 ) ) ( not ( = ?auto_29520 ?auto_29519 ) ) ( not ( = ?auto_29502 ?auto_29519 ) ) ( not ( = ?auto_29509 ?auto_29519 ) ) ( SURFACE-AT ?auto_29500 ?auto_29507 ) ( ON ?auto_29500 ?auto_29513 ) ( CLEAR ?auto_29500 ) ( not ( = ?auto_29498 ?auto_29513 ) ) ( not ( = ?auto_29499 ?auto_29513 ) ) ( not ( = ?auto_29516 ?auto_29513 ) ) ( not ( = ?auto_29503 ?auto_29513 ) ) ( not ( = ?auto_29501 ?auto_29513 ) ) ( not ( = ?auto_29518 ?auto_29513 ) ) ( not ( = ?auto_29508 ?auto_29513 ) ) ( not ( = ?auto_29500 ?auto_29513 ) ) ( not ( = ?auto_29515 ?auto_29513 ) ) ( not ( = ?auto_29514 ?auto_29513 ) ) ( SURFACE-AT ?auto_29510 ?auto_29512 ) ( CLEAR ?auto_29510 ) ( IS-CRATE ?auto_29514 ) ( not ( = ?auto_29498 ?auto_29510 ) ) ( not ( = ?auto_29499 ?auto_29510 ) ) ( not ( = ?auto_29516 ?auto_29510 ) ) ( not ( = ?auto_29503 ?auto_29510 ) ) ( not ( = ?auto_29501 ?auto_29510 ) ) ( not ( = ?auto_29518 ?auto_29510 ) ) ( not ( = ?auto_29508 ?auto_29510 ) ) ( not ( = ?auto_29500 ?auto_29510 ) ) ( not ( = ?auto_29515 ?auto_29510 ) ) ( not ( = ?auto_29514 ?auto_29510 ) ) ( not ( = ?auto_29513 ?auto_29510 ) ) ( AVAILABLE ?auto_29504 ) ( TRUCK-AT ?auto_29511 ?auto_29507 ) ( AVAILABLE ?auto_29519 ) ( SURFACE-AT ?auto_29514 ?auto_29507 ) ( ON ?auto_29514 ?auto_29521 ) ( CLEAR ?auto_29514 ) ( not ( = ?auto_29498 ?auto_29521 ) ) ( not ( = ?auto_29499 ?auto_29521 ) ) ( not ( = ?auto_29516 ?auto_29521 ) ) ( not ( = ?auto_29503 ?auto_29521 ) ) ( not ( = ?auto_29501 ?auto_29521 ) ) ( not ( = ?auto_29518 ?auto_29521 ) ) ( not ( = ?auto_29508 ?auto_29521 ) ) ( not ( = ?auto_29500 ?auto_29521 ) ) ( not ( = ?auto_29515 ?auto_29521 ) ) ( not ( = ?auto_29514 ?auto_29521 ) ) ( not ( = ?auto_29513 ?auto_29521 ) ) ( not ( = ?auto_29510 ?auto_29521 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29519 ?auto_29514 ?auto_29521 ?auto_29507 )
      ( MAKE-ON ?auto_29498 ?auto_29499 )
      ( MAKE-ON-VERIFY ?auto_29498 ?auto_29499 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29522 - SURFACE
      ?auto_29523 - SURFACE
    )
    :vars
    (
      ?auto_29527 - HOIST
      ?auto_29539 - PLACE
      ?auto_29544 - PLACE
      ?auto_29530 - HOIST
      ?auto_29545 - SURFACE
      ?auto_29536 - SURFACE
      ?auto_29541 - PLACE
      ?auto_29537 - HOIST
      ?auto_29540 - SURFACE
      ?auto_29528 - SURFACE
      ?auto_29531 - SURFACE
      ?auto_29533 - SURFACE
      ?auto_29529 - PLACE
      ?auto_29534 - HOIST
      ?auto_29532 - SURFACE
      ?auto_29543 - SURFACE
      ?auto_29525 - PLACE
      ?auto_29524 - HOIST
      ?auto_29526 - SURFACE
      ?auto_29535 - SURFACE
      ?auto_29542 - SURFACE
      ?auto_29538 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29527 ?auto_29539 ) ( IS-CRATE ?auto_29522 ) ( not ( = ?auto_29522 ?auto_29523 ) ) ( not ( = ?auto_29544 ?auto_29539 ) ) ( HOIST-AT ?auto_29530 ?auto_29544 ) ( not ( = ?auto_29527 ?auto_29530 ) ) ( AVAILABLE ?auto_29530 ) ( SURFACE-AT ?auto_29522 ?auto_29544 ) ( ON ?auto_29522 ?auto_29545 ) ( CLEAR ?auto_29522 ) ( not ( = ?auto_29522 ?auto_29545 ) ) ( not ( = ?auto_29523 ?auto_29545 ) ) ( IS-CRATE ?auto_29523 ) ( not ( = ?auto_29522 ?auto_29536 ) ) ( not ( = ?auto_29523 ?auto_29536 ) ) ( not ( = ?auto_29545 ?auto_29536 ) ) ( not ( = ?auto_29541 ?auto_29539 ) ) ( not ( = ?auto_29544 ?auto_29541 ) ) ( HOIST-AT ?auto_29537 ?auto_29541 ) ( not ( = ?auto_29527 ?auto_29537 ) ) ( not ( = ?auto_29530 ?auto_29537 ) ) ( SURFACE-AT ?auto_29523 ?auto_29541 ) ( ON ?auto_29523 ?auto_29540 ) ( CLEAR ?auto_29523 ) ( not ( = ?auto_29522 ?auto_29540 ) ) ( not ( = ?auto_29523 ?auto_29540 ) ) ( not ( = ?auto_29545 ?auto_29540 ) ) ( not ( = ?auto_29536 ?auto_29540 ) ) ( IS-CRATE ?auto_29536 ) ( not ( = ?auto_29522 ?auto_29528 ) ) ( not ( = ?auto_29523 ?auto_29528 ) ) ( not ( = ?auto_29545 ?auto_29528 ) ) ( not ( = ?auto_29536 ?auto_29528 ) ) ( not ( = ?auto_29540 ?auto_29528 ) ) ( AVAILABLE ?auto_29537 ) ( SURFACE-AT ?auto_29536 ?auto_29541 ) ( ON ?auto_29536 ?auto_29531 ) ( CLEAR ?auto_29536 ) ( not ( = ?auto_29522 ?auto_29531 ) ) ( not ( = ?auto_29523 ?auto_29531 ) ) ( not ( = ?auto_29545 ?auto_29531 ) ) ( not ( = ?auto_29536 ?auto_29531 ) ) ( not ( = ?auto_29540 ?auto_29531 ) ) ( not ( = ?auto_29528 ?auto_29531 ) ) ( IS-CRATE ?auto_29528 ) ( not ( = ?auto_29522 ?auto_29533 ) ) ( not ( = ?auto_29523 ?auto_29533 ) ) ( not ( = ?auto_29545 ?auto_29533 ) ) ( not ( = ?auto_29536 ?auto_29533 ) ) ( not ( = ?auto_29540 ?auto_29533 ) ) ( not ( = ?auto_29528 ?auto_29533 ) ) ( not ( = ?auto_29531 ?auto_29533 ) ) ( not ( = ?auto_29529 ?auto_29539 ) ) ( not ( = ?auto_29544 ?auto_29529 ) ) ( not ( = ?auto_29541 ?auto_29529 ) ) ( HOIST-AT ?auto_29534 ?auto_29529 ) ( not ( = ?auto_29527 ?auto_29534 ) ) ( not ( = ?auto_29530 ?auto_29534 ) ) ( not ( = ?auto_29537 ?auto_29534 ) ) ( AVAILABLE ?auto_29534 ) ( SURFACE-AT ?auto_29528 ?auto_29529 ) ( ON ?auto_29528 ?auto_29532 ) ( CLEAR ?auto_29528 ) ( not ( = ?auto_29522 ?auto_29532 ) ) ( not ( = ?auto_29523 ?auto_29532 ) ) ( not ( = ?auto_29545 ?auto_29532 ) ) ( not ( = ?auto_29536 ?auto_29532 ) ) ( not ( = ?auto_29540 ?auto_29532 ) ) ( not ( = ?auto_29528 ?auto_29532 ) ) ( not ( = ?auto_29531 ?auto_29532 ) ) ( not ( = ?auto_29533 ?auto_29532 ) ) ( IS-CRATE ?auto_29533 ) ( not ( = ?auto_29522 ?auto_29543 ) ) ( not ( = ?auto_29523 ?auto_29543 ) ) ( not ( = ?auto_29545 ?auto_29543 ) ) ( not ( = ?auto_29536 ?auto_29543 ) ) ( not ( = ?auto_29540 ?auto_29543 ) ) ( not ( = ?auto_29528 ?auto_29543 ) ) ( not ( = ?auto_29531 ?auto_29543 ) ) ( not ( = ?auto_29533 ?auto_29543 ) ) ( not ( = ?auto_29532 ?auto_29543 ) ) ( not ( = ?auto_29525 ?auto_29539 ) ) ( not ( = ?auto_29544 ?auto_29525 ) ) ( not ( = ?auto_29541 ?auto_29525 ) ) ( not ( = ?auto_29529 ?auto_29525 ) ) ( HOIST-AT ?auto_29524 ?auto_29525 ) ( not ( = ?auto_29527 ?auto_29524 ) ) ( not ( = ?auto_29530 ?auto_29524 ) ) ( not ( = ?auto_29537 ?auto_29524 ) ) ( not ( = ?auto_29534 ?auto_29524 ) ) ( SURFACE-AT ?auto_29533 ?auto_29525 ) ( ON ?auto_29533 ?auto_29526 ) ( CLEAR ?auto_29533 ) ( not ( = ?auto_29522 ?auto_29526 ) ) ( not ( = ?auto_29523 ?auto_29526 ) ) ( not ( = ?auto_29545 ?auto_29526 ) ) ( not ( = ?auto_29536 ?auto_29526 ) ) ( not ( = ?auto_29540 ?auto_29526 ) ) ( not ( = ?auto_29528 ?auto_29526 ) ) ( not ( = ?auto_29531 ?auto_29526 ) ) ( not ( = ?auto_29533 ?auto_29526 ) ) ( not ( = ?auto_29532 ?auto_29526 ) ) ( not ( = ?auto_29543 ?auto_29526 ) ) ( SURFACE-AT ?auto_29535 ?auto_29539 ) ( CLEAR ?auto_29535 ) ( IS-CRATE ?auto_29543 ) ( not ( = ?auto_29522 ?auto_29535 ) ) ( not ( = ?auto_29523 ?auto_29535 ) ) ( not ( = ?auto_29545 ?auto_29535 ) ) ( not ( = ?auto_29536 ?auto_29535 ) ) ( not ( = ?auto_29540 ?auto_29535 ) ) ( not ( = ?auto_29528 ?auto_29535 ) ) ( not ( = ?auto_29531 ?auto_29535 ) ) ( not ( = ?auto_29533 ?auto_29535 ) ) ( not ( = ?auto_29532 ?auto_29535 ) ) ( not ( = ?auto_29543 ?auto_29535 ) ) ( not ( = ?auto_29526 ?auto_29535 ) ) ( AVAILABLE ?auto_29527 ) ( AVAILABLE ?auto_29524 ) ( SURFACE-AT ?auto_29543 ?auto_29525 ) ( ON ?auto_29543 ?auto_29542 ) ( CLEAR ?auto_29543 ) ( not ( = ?auto_29522 ?auto_29542 ) ) ( not ( = ?auto_29523 ?auto_29542 ) ) ( not ( = ?auto_29545 ?auto_29542 ) ) ( not ( = ?auto_29536 ?auto_29542 ) ) ( not ( = ?auto_29540 ?auto_29542 ) ) ( not ( = ?auto_29528 ?auto_29542 ) ) ( not ( = ?auto_29531 ?auto_29542 ) ) ( not ( = ?auto_29533 ?auto_29542 ) ) ( not ( = ?auto_29532 ?auto_29542 ) ) ( not ( = ?auto_29543 ?auto_29542 ) ) ( not ( = ?auto_29526 ?auto_29542 ) ) ( not ( = ?auto_29535 ?auto_29542 ) ) ( TRUCK-AT ?auto_29538 ?auto_29539 ) )
    :subtasks
    ( ( !DRIVE ?auto_29538 ?auto_29539 ?auto_29525 )
      ( MAKE-ON ?auto_29522 ?auto_29523 )
      ( MAKE-ON-VERIFY ?auto_29522 ?auto_29523 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29546 - SURFACE
      ?auto_29547 - SURFACE
    )
    :vars
    (
      ?auto_29549 - HOIST
      ?auto_29563 - PLACE
      ?auto_29561 - PLACE
      ?auto_29557 - HOIST
      ?auto_29562 - SURFACE
      ?auto_29556 - SURFACE
      ?auto_29560 - PLACE
      ?auto_29567 - HOIST
      ?auto_29559 - SURFACE
      ?auto_29555 - SURFACE
      ?auto_29552 - SURFACE
      ?auto_29553 - SURFACE
      ?auto_29569 - PLACE
      ?auto_29548 - HOIST
      ?auto_29558 - SURFACE
      ?auto_29551 - SURFACE
      ?auto_29564 - PLACE
      ?auto_29554 - HOIST
      ?auto_29566 - SURFACE
      ?auto_29568 - SURFACE
      ?auto_29550 - SURFACE
      ?auto_29565 - TRUCK
      ?auto_29570 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29549 ?auto_29563 ) ( IS-CRATE ?auto_29546 ) ( not ( = ?auto_29546 ?auto_29547 ) ) ( not ( = ?auto_29561 ?auto_29563 ) ) ( HOIST-AT ?auto_29557 ?auto_29561 ) ( not ( = ?auto_29549 ?auto_29557 ) ) ( AVAILABLE ?auto_29557 ) ( SURFACE-AT ?auto_29546 ?auto_29561 ) ( ON ?auto_29546 ?auto_29562 ) ( CLEAR ?auto_29546 ) ( not ( = ?auto_29546 ?auto_29562 ) ) ( not ( = ?auto_29547 ?auto_29562 ) ) ( IS-CRATE ?auto_29547 ) ( not ( = ?auto_29546 ?auto_29556 ) ) ( not ( = ?auto_29547 ?auto_29556 ) ) ( not ( = ?auto_29562 ?auto_29556 ) ) ( not ( = ?auto_29560 ?auto_29563 ) ) ( not ( = ?auto_29561 ?auto_29560 ) ) ( HOIST-AT ?auto_29567 ?auto_29560 ) ( not ( = ?auto_29549 ?auto_29567 ) ) ( not ( = ?auto_29557 ?auto_29567 ) ) ( SURFACE-AT ?auto_29547 ?auto_29560 ) ( ON ?auto_29547 ?auto_29559 ) ( CLEAR ?auto_29547 ) ( not ( = ?auto_29546 ?auto_29559 ) ) ( not ( = ?auto_29547 ?auto_29559 ) ) ( not ( = ?auto_29562 ?auto_29559 ) ) ( not ( = ?auto_29556 ?auto_29559 ) ) ( IS-CRATE ?auto_29556 ) ( not ( = ?auto_29546 ?auto_29555 ) ) ( not ( = ?auto_29547 ?auto_29555 ) ) ( not ( = ?auto_29562 ?auto_29555 ) ) ( not ( = ?auto_29556 ?auto_29555 ) ) ( not ( = ?auto_29559 ?auto_29555 ) ) ( AVAILABLE ?auto_29567 ) ( SURFACE-AT ?auto_29556 ?auto_29560 ) ( ON ?auto_29556 ?auto_29552 ) ( CLEAR ?auto_29556 ) ( not ( = ?auto_29546 ?auto_29552 ) ) ( not ( = ?auto_29547 ?auto_29552 ) ) ( not ( = ?auto_29562 ?auto_29552 ) ) ( not ( = ?auto_29556 ?auto_29552 ) ) ( not ( = ?auto_29559 ?auto_29552 ) ) ( not ( = ?auto_29555 ?auto_29552 ) ) ( IS-CRATE ?auto_29555 ) ( not ( = ?auto_29546 ?auto_29553 ) ) ( not ( = ?auto_29547 ?auto_29553 ) ) ( not ( = ?auto_29562 ?auto_29553 ) ) ( not ( = ?auto_29556 ?auto_29553 ) ) ( not ( = ?auto_29559 ?auto_29553 ) ) ( not ( = ?auto_29555 ?auto_29553 ) ) ( not ( = ?auto_29552 ?auto_29553 ) ) ( not ( = ?auto_29569 ?auto_29563 ) ) ( not ( = ?auto_29561 ?auto_29569 ) ) ( not ( = ?auto_29560 ?auto_29569 ) ) ( HOIST-AT ?auto_29548 ?auto_29569 ) ( not ( = ?auto_29549 ?auto_29548 ) ) ( not ( = ?auto_29557 ?auto_29548 ) ) ( not ( = ?auto_29567 ?auto_29548 ) ) ( AVAILABLE ?auto_29548 ) ( SURFACE-AT ?auto_29555 ?auto_29569 ) ( ON ?auto_29555 ?auto_29558 ) ( CLEAR ?auto_29555 ) ( not ( = ?auto_29546 ?auto_29558 ) ) ( not ( = ?auto_29547 ?auto_29558 ) ) ( not ( = ?auto_29562 ?auto_29558 ) ) ( not ( = ?auto_29556 ?auto_29558 ) ) ( not ( = ?auto_29559 ?auto_29558 ) ) ( not ( = ?auto_29555 ?auto_29558 ) ) ( not ( = ?auto_29552 ?auto_29558 ) ) ( not ( = ?auto_29553 ?auto_29558 ) ) ( IS-CRATE ?auto_29553 ) ( not ( = ?auto_29546 ?auto_29551 ) ) ( not ( = ?auto_29547 ?auto_29551 ) ) ( not ( = ?auto_29562 ?auto_29551 ) ) ( not ( = ?auto_29556 ?auto_29551 ) ) ( not ( = ?auto_29559 ?auto_29551 ) ) ( not ( = ?auto_29555 ?auto_29551 ) ) ( not ( = ?auto_29552 ?auto_29551 ) ) ( not ( = ?auto_29553 ?auto_29551 ) ) ( not ( = ?auto_29558 ?auto_29551 ) ) ( not ( = ?auto_29564 ?auto_29563 ) ) ( not ( = ?auto_29561 ?auto_29564 ) ) ( not ( = ?auto_29560 ?auto_29564 ) ) ( not ( = ?auto_29569 ?auto_29564 ) ) ( HOIST-AT ?auto_29554 ?auto_29564 ) ( not ( = ?auto_29549 ?auto_29554 ) ) ( not ( = ?auto_29557 ?auto_29554 ) ) ( not ( = ?auto_29567 ?auto_29554 ) ) ( not ( = ?auto_29548 ?auto_29554 ) ) ( SURFACE-AT ?auto_29553 ?auto_29564 ) ( ON ?auto_29553 ?auto_29566 ) ( CLEAR ?auto_29553 ) ( not ( = ?auto_29546 ?auto_29566 ) ) ( not ( = ?auto_29547 ?auto_29566 ) ) ( not ( = ?auto_29562 ?auto_29566 ) ) ( not ( = ?auto_29556 ?auto_29566 ) ) ( not ( = ?auto_29559 ?auto_29566 ) ) ( not ( = ?auto_29555 ?auto_29566 ) ) ( not ( = ?auto_29552 ?auto_29566 ) ) ( not ( = ?auto_29553 ?auto_29566 ) ) ( not ( = ?auto_29558 ?auto_29566 ) ) ( not ( = ?auto_29551 ?auto_29566 ) ) ( IS-CRATE ?auto_29551 ) ( not ( = ?auto_29546 ?auto_29568 ) ) ( not ( = ?auto_29547 ?auto_29568 ) ) ( not ( = ?auto_29562 ?auto_29568 ) ) ( not ( = ?auto_29556 ?auto_29568 ) ) ( not ( = ?auto_29559 ?auto_29568 ) ) ( not ( = ?auto_29555 ?auto_29568 ) ) ( not ( = ?auto_29552 ?auto_29568 ) ) ( not ( = ?auto_29553 ?auto_29568 ) ) ( not ( = ?auto_29558 ?auto_29568 ) ) ( not ( = ?auto_29551 ?auto_29568 ) ) ( not ( = ?auto_29566 ?auto_29568 ) ) ( AVAILABLE ?auto_29554 ) ( SURFACE-AT ?auto_29551 ?auto_29564 ) ( ON ?auto_29551 ?auto_29550 ) ( CLEAR ?auto_29551 ) ( not ( = ?auto_29546 ?auto_29550 ) ) ( not ( = ?auto_29547 ?auto_29550 ) ) ( not ( = ?auto_29562 ?auto_29550 ) ) ( not ( = ?auto_29556 ?auto_29550 ) ) ( not ( = ?auto_29559 ?auto_29550 ) ) ( not ( = ?auto_29555 ?auto_29550 ) ) ( not ( = ?auto_29552 ?auto_29550 ) ) ( not ( = ?auto_29553 ?auto_29550 ) ) ( not ( = ?auto_29558 ?auto_29550 ) ) ( not ( = ?auto_29551 ?auto_29550 ) ) ( not ( = ?auto_29566 ?auto_29550 ) ) ( not ( = ?auto_29568 ?auto_29550 ) ) ( TRUCK-AT ?auto_29565 ?auto_29563 ) ( SURFACE-AT ?auto_29570 ?auto_29563 ) ( CLEAR ?auto_29570 ) ( LIFTING ?auto_29549 ?auto_29568 ) ( IS-CRATE ?auto_29568 ) ( not ( = ?auto_29546 ?auto_29570 ) ) ( not ( = ?auto_29547 ?auto_29570 ) ) ( not ( = ?auto_29562 ?auto_29570 ) ) ( not ( = ?auto_29556 ?auto_29570 ) ) ( not ( = ?auto_29559 ?auto_29570 ) ) ( not ( = ?auto_29555 ?auto_29570 ) ) ( not ( = ?auto_29552 ?auto_29570 ) ) ( not ( = ?auto_29553 ?auto_29570 ) ) ( not ( = ?auto_29558 ?auto_29570 ) ) ( not ( = ?auto_29551 ?auto_29570 ) ) ( not ( = ?auto_29566 ?auto_29570 ) ) ( not ( = ?auto_29568 ?auto_29570 ) ) ( not ( = ?auto_29550 ?auto_29570 ) ) )
    :subtasks
    ( ( !DROP ?auto_29549 ?auto_29568 ?auto_29570 ?auto_29563 )
      ( MAKE-ON ?auto_29546 ?auto_29547 )
      ( MAKE-ON-VERIFY ?auto_29546 ?auto_29547 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29571 - SURFACE
      ?auto_29572 - SURFACE
    )
    :vars
    (
      ?auto_29584 - HOIST
      ?auto_29587 - PLACE
      ?auto_29580 - PLACE
      ?auto_29582 - HOIST
      ?auto_29586 - SURFACE
      ?auto_29593 - SURFACE
      ?auto_29589 - PLACE
      ?auto_29578 - HOIST
      ?auto_29579 - SURFACE
      ?auto_29581 - SURFACE
      ?auto_29585 - SURFACE
      ?auto_29590 - SURFACE
      ?auto_29573 - PLACE
      ?auto_29594 - HOIST
      ?auto_29591 - SURFACE
      ?auto_29592 - SURFACE
      ?auto_29576 - PLACE
      ?auto_29588 - HOIST
      ?auto_29577 - SURFACE
      ?auto_29574 - SURFACE
      ?auto_29583 - SURFACE
      ?auto_29575 - TRUCK
      ?auto_29595 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29584 ?auto_29587 ) ( IS-CRATE ?auto_29571 ) ( not ( = ?auto_29571 ?auto_29572 ) ) ( not ( = ?auto_29580 ?auto_29587 ) ) ( HOIST-AT ?auto_29582 ?auto_29580 ) ( not ( = ?auto_29584 ?auto_29582 ) ) ( AVAILABLE ?auto_29582 ) ( SURFACE-AT ?auto_29571 ?auto_29580 ) ( ON ?auto_29571 ?auto_29586 ) ( CLEAR ?auto_29571 ) ( not ( = ?auto_29571 ?auto_29586 ) ) ( not ( = ?auto_29572 ?auto_29586 ) ) ( IS-CRATE ?auto_29572 ) ( not ( = ?auto_29571 ?auto_29593 ) ) ( not ( = ?auto_29572 ?auto_29593 ) ) ( not ( = ?auto_29586 ?auto_29593 ) ) ( not ( = ?auto_29589 ?auto_29587 ) ) ( not ( = ?auto_29580 ?auto_29589 ) ) ( HOIST-AT ?auto_29578 ?auto_29589 ) ( not ( = ?auto_29584 ?auto_29578 ) ) ( not ( = ?auto_29582 ?auto_29578 ) ) ( SURFACE-AT ?auto_29572 ?auto_29589 ) ( ON ?auto_29572 ?auto_29579 ) ( CLEAR ?auto_29572 ) ( not ( = ?auto_29571 ?auto_29579 ) ) ( not ( = ?auto_29572 ?auto_29579 ) ) ( not ( = ?auto_29586 ?auto_29579 ) ) ( not ( = ?auto_29593 ?auto_29579 ) ) ( IS-CRATE ?auto_29593 ) ( not ( = ?auto_29571 ?auto_29581 ) ) ( not ( = ?auto_29572 ?auto_29581 ) ) ( not ( = ?auto_29586 ?auto_29581 ) ) ( not ( = ?auto_29593 ?auto_29581 ) ) ( not ( = ?auto_29579 ?auto_29581 ) ) ( AVAILABLE ?auto_29578 ) ( SURFACE-AT ?auto_29593 ?auto_29589 ) ( ON ?auto_29593 ?auto_29585 ) ( CLEAR ?auto_29593 ) ( not ( = ?auto_29571 ?auto_29585 ) ) ( not ( = ?auto_29572 ?auto_29585 ) ) ( not ( = ?auto_29586 ?auto_29585 ) ) ( not ( = ?auto_29593 ?auto_29585 ) ) ( not ( = ?auto_29579 ?auto_29585 ) ) ( not ( = ?auto_29581 ?auto_29585 ) ) ( IS-CRATE ?auto_29581 ) ( not ( = ?auto_29571 ?auto_29590 ) ) ( not ( = ?auto_29572 ?auto_29590 ) ) ( not ( = ?auto_29586 ?auto_29590 ) ) ( not ( = ?auto_29593 ?auto_29590 ) ) ( not ( = ?auto_29579 ?auto_29590 ) ) ( not ( = ?auto_29581 ?auto_29590 ) ) ( not ( = ?auto_29585 ?auto_29590 ) ) ( not ( = ?auto_29573 ?auto_29587 ) ) ( not ( = ?auto_29580 ?auto_29573 ) ) ( not ( = ?auto_29589 ?auto_29573 ) ) ( HOIST-AT ?auto_29594 ?auto_29573 ) ( not ( = ?auto_29584 ?auto_29594 ) ) ( not ( = ?auto_29582 ?auto_29594 ) ) ( not ( = ?auto_29578 ?auto_29594 ) ) ( AVAILABLE ?auto_29594 ) ( SURFACE-AT ?auto_29581 ?auto_29573 ) ( ON ?auto_29581 ?auto_29591 ) ( CLEAR ?auto_29581 ) ( not ( = ?auto_29571 ?auto_29591 ) ) ( not ( = ?auto_29572 ?auto_29591 ) ) ( not ( = ?auto_29586 ?auto_29591 ) ) ( not ( = ?auto_29593 ?auto_29591 ) ) ( not ( = ?auto_29579 ?auto_29591 ) ) ( not ( = ?auto_29581 ?auto_29591 ) ) ( not ( = ?auto_29585 ?auto_29591 ) ) ( not ( = ?auto_29590 ?auto_29591 ) ) ( IS-CRATE ?auto_29590 ) ( not ( = ?auto_29571 ?auto_29592 ) ) ( not ( = ?auto_29572 ?auto_29592 ) ) ( not ( = ?auto_29586 ?auto_29592 ) ) ( not ( = ?auto_29593 ?auto_29592 ) ) ( not ( = ?auto_29579 ?auto_29592 ) ) ( not ( = ?auto_29581 ?auto_29592 ) ) ( not ( = ?auto_29585 ?auto_29592 ) ) ( not ( = ?auto_29590 ?auto_29592 ) ) ( not ( = ?auto_29591 ?auto_29592 ) ) ( not ( = ?auto_29576 ?auto_29587 ) ) ( not ( = ?auto_29580 ?auto_29576 ) ) ( not ( = ?auto_29589 ?auto_29576 ) ) ( not ( = ?auto_29573 ?auto_29576 ) ) ( HOIST-AT ?auto_29588 ?auto_29576 ) ( not ( = ?auto_29584 ?auto_29588 ) ) ( not ( = ?auto_29582 ?auto_29588 ) ) ( not ( = ?auto_29578 ?auto_29588 ) ) ( not ( = ?auto_29594 ?auto_29588 ) ) ( SURFACE-AT ?auto_29590 ?auto_29576 ) ( ON ?auto_29590 ?auto_29577 ) ( CLEAR ?auto_29590 ) ( not ( = ?auto_29571 ?auto_29577 ) ) ( not ( = ?auto_29572 ?auto_29577 ) ) ( not ( = ?auto_29586 ?auto_29577 ) ) ( not ( = ?auto_29593 ?auto_29577 ) ) ( not ( = ?auto_29579 ?auto_29577 ) ) ( not ( = ?auto_29581 ?auto_29577 ) ) ( not ( = ?auto_29585 ?auto_29577 ) ) ( not ( = ?auto_29590 ?auto_29577 ) ) ( not ( = ?auto_29591 ?auto_29577 ) ) ( not ( = ?auto_29592 ?auto_29577 ) ) ( IS-CRATE ?auto_29592 ) ( not ( = ?auto_29571 ?auto_29574 ) ) ( not ( = ?auto_29572 ?auto_29574 ) ) ( not ( = ?auto_29586 ?auto_29574 ) ) ( not ( = ?auto_29593 ?auto_29574 ) ) ( not ( = ?auto_29579 ?auto_29574 ) ) ( not ( = ?auto_29581 ?auto_29574 ) ) ( not ( = ?auto_29585 ?auto_29574 ) ) ( not ( = ?auto_29590 ?auto_29574 ) ) ( not ( = ?auto_29591 ?auto_29574 ) ) ( not ( = ?auto_29592 ?auto_29574 ) ) ( not ( = ?auto_29577 ?auto_29574 ) ) ( AVAILABLE ?auto_29588 ) ( SURFACE-AT ?auto_29592 ?auto_29576 ) ( ON ?auto_29592 ?auto_29583 ) ( CLEAR ?auto_29592 ) ( not ( = ?auto_29571 ?auto_29583 ) ) ( not ( = ?auto_29572 ?auto_29583 ) ) ( not ( = ?auto_29586 ?auto_29583 ) ) ( not ( = ?auto_29593 ?auto_29583 ) ) ( not ( = ?auto_29579 ?auto_29583 ) ) ( not ( = ?auto_29581 ?auto_29583 ) ) ( not ( = ?auto_29585 ?auto_29583 ) ) ( not ( = ?auto_29590 ?auto_29583 ) ) ( not ( = ?auto_29591 ?auto_29583 ) ) ( not ( = ?auto_29592 ?auto_29583 ) ) ( not ( = ?auto_29577 ?auto_29583 ) ) ( not ( = ?auto_29574 ?auto_29583 ) ) ( TRUCK-AT ?auto_29575 ?auto_29587 ) ( SURFACE-AT ?auto_29595 ?auto_29587 ) ( CLEAR ?auto_29595 ) ( IS-CRATE ?auto_29574 ) ( not ( = ?auto_29571 ?auto_29595 ) ) ( not ( = ?auto_29572 ?auto_29595 ) ) ( not ( = ?auto_29586 ?auto_29595 ) ) ( not ( = ?auto_29593 ?auto_29595 ) ) ( not ( = ?auto_29579 ?auto_29595 ) ) ( not ( = ?auto_29581 ?auto_29595 ) ) ( not ( = ?auto_29585 ?auto_29595 ) ) ( not ( = ?auto_29590 ?auto_29595 ) ) ( not ( = ?auto_29591 ?auto_29595 ) ) ( not ( = ?auto_29592 ?auto_29595 ) ) ( not ( = ?auto_29577 ?auto_29595 ) ) ( not ( = ?auto_29574 ?auto_29595 ) ) ( not ( = ?auto_29583 ?auto_29595 ) ) ( AVAILABLE ?auto_29584 ) ( IN ?auto_29574 ?auto_29575 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29584 ?auto_29574 ?auto_29575 ?auto_29587 )
      ( MAKE-ON ?auto_29571 ?auto_29572 )
      ( MAKE-ON-VERIFY ?auto_29571 ?auto_29572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29596 - SURFACE
      ?auto_29597 - SURFACE
    )
    :vars
    (
      ?auto_29603 - HOIST
      ?auto_29616 - PLACE
      ?auto_29614 - PLACE
      ?auto_29600 - HOIST
      ?auto_29599 - SURFACE
      ?auto_29609 - SURFACE
      ?auto_29602 - PLACE
      ?auto_29612 - HOIST
      ?auto_29604 - SURFACE
      ?auto_29618 - SURFACE
      ?auto_29613 - SURFACE
      ?auto_29611 - SURFACE
      ?auto_29615 - PLACE
      ?auto_29608 - HOIST
      ?auto_29606 - SURFACE
      ?auto_29607 - SURFACE
      ?auto_29619 - PLACE
      ?auto_29620 - HOIST
      ?auto_29617 - SURFACE
      ?auto_29598 - SURFACE
      ?auto_29601 - SURFACE
      ?auto_29610 - SURFACE
      ?auto_29605 - TRUCK
      ?auto_29621 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29603 ?auto_29616 ) ( IS-CRATE ?auto_29596 ) ( not ( = ?auto_29596 ?auto_29597 ) ) ( not ( = ?auto_29614 ?auto_29616 ) ) ( HOIST-AT ?auto_29600 ?auto_29614 ) ( not ( = ?auto_29603 ?auto_29600 ) ) ( AVAILABLE ?auto_29600 ) ( SURFACE-AT ?auto_29596 ?auto_29614 ) ( ON ?auto_29596 ?auto_29599 ) ( CLEAR ?auto_29596 ) ( not ( = ?auto_29596 ?auto_29599 ) ) ( not ( = ?auto_29597 ?auto_29599 ) ) ( IS-CRATE ?auto_29597 ) ( not ( = ?auto_29596 ?auto_29609 ) ) ( not ( = ?auto_29597 ?auto_29609 ) ) ( not ( = ?auto_29599 ?auto_29609 ) ) ( not ( = ?auto_29602 ?auto_29616 ) ) ( not ( = ?auto_29614 ?auto_29602 ) ) ( HOIST-AT ?auto_29612 ?auto_29602 ) ( not ( = ?auto_29603 ?auto_29612 ) ) ( not ( = ?auto_29600 ?auto_29612 ) ) ( SURFACE-AT ?auto_29597 ?auto_29602 ) ( ON ?auto_29597 ?auto_29604 ) ( CLEAR ?auto_29597 ) ( not ( = ?auto_29596 ?auto_29604 ) ) ( not ( = ?auto_29597 ?auto_29604 ) ) ( not ( = ?auto_29599 ?auto_29604 ) ) ( not ( = ?auto_29609 ?auto_29604 ) ) ( IS-CRATE ?auto_29609 ) ( not ( = ?auto_29596 ?auto_29618 ) ) ( not ( = ?auto_29597 ?auto_29618 ) ) ( not ( = ?auto_29599 ?auto_29618 ) ) ( not ( = ?auto_29609 ?auto_29618 ) ) ( not ( = ?auto_29604 ?auto_29618 ) ) ( AVAILABLE ?auto_29612 ) ( SURFACE-AT ?auto_29609 ?auto_29602 ) ( ON ?auto_29609 ?auto_29613 ) ( CLEAR ?auto_29609 ) ( not ( = ?auto_29596 ?auto_29613 ) ) ( not ( = ?auto_29597 ?auto_29613 ) ) ( not ( = ?auto_29599 ?auto_29613 ) ) ( not ( = ?auto_29609 ?auto_29613 ) ) ( not ( = ?auto_29604 ?auto_29613 ) ) ( not ( = ?auto_29618 ?auto_29613 ) ) ( IS-CRATE ?auto_29618 ) ( not ( = ?auto_29596 ?auto_29611 ) ) ( not ( = ?auto_29597 ?auto_29611 ) ) ( not ( = ?auto_29599 ?auto_29611 ) ) ( not ( = ?auto_29609 ?auto_29611 ) ) ( not ( = ?auto_29604 ?auto_29611 ) ) ( not ( = ?auto_29618 ?auto_29611 ) ) ( not ( = ?auto_29613 ?auto_29611 ) ) ( not ( = ?auto_29615 ?auto_29616 ) ) ( not ( = ?auto_29614 ?auto_29615 ) ) ( not ( = ?auto_29602 ?auto_29615 ) ) ( HOIST-AT ?auto_29608 ?auto_29615 ) ( not ( = ?auto_29603 ?auto_29608 ) ) ( not ( = ?auto_29600 ?auto_29608 ) ) ( not ( = ?auto_29612 ?auto_29608 ) ) ( AVAILABLE ?auto_29608 ) ( SURFACE-AT ?auto_29618 ?auto_29615 ) ( ON ?auto_29618 ?auto_29606 ) ( CLEAR ?auto_29618 ) ( not ( = ?auto_29596 ?auto_29606 ) ) ( not ( = ?auto_29597 ?auto_29606 ) ) ( not ( = ?auto_29599 ?auto_29606 ) ) ( not ( = ?auto_29609 ?auto_29606 ) ) ( not ( = ?auto_29604 ?auto_29606 ) ) ( not ( = ?auto_29618 ?auto_29606 ) ) ( not ( = ?auto_29613 ?auto_29606 ) ) ( not ( = ?auto_29611 ?auto_29606 ) ) ( IS-CRATE ?auto_29611 ) ( not ( = ?auto_29596 ?auto_29607 ) ) ( not ( = ?auto_29597 ?auto_29607 ) ) ( not ( = ?auto_29599 ?auto_29607 ) ) ( not ( = ?auto_29609 ?auto_29607 ) ) ( not ( = ?auto_29604 ?auto_29607 ) ) ( not ( = ?auto_29618 ?auto_29607 ) ) ( not ( = ?auto_29613 ?auto_29607 ) ) ( not ( = ?auto_29611 ?auto_29607 ) ) ( not ( = ?auto_29606 ?auto_29607 ) ) ( not ( = ?auto_29619 ?auto_29616 ) ) ( not ( = ?auto_29614 ?auto_29619 ) ) ( not ( = ?auto_29602 ?auto_29619 ) ) ( not ( = ?auto_29615 ?auto_29619 ) ) ( HOIST-AT ?auto_29620 ?auto_29619 ) ( not ( = ?auto_29603 ?auto_29620 ) ) ( not ( = ?auto_29600 ?auto_29620 ) ) ( not ( = ?auto_29612 ?auto_29620 ) ) ( not ( = ?auto_29608 ?auto_29620 ) ) ( SURFACE-AT ?auto_29611 ?auto_29619 ) ( ON ?auto_29611 ?auto_29617 ) ( CLEAR ?auto_29611 ) ( not ( = ?auto_29596 ?auto_29617 ) ) ( not ( = ?auto_29597 ?auto_29617 ) ) ( not ( = ?auto_29599 ?auto_29617 ) ) ( not ( = ?auto_29609 ?auto_29617 ) ) ( not ( = ?auto_29604 ?auto_29617 ) ) ( not ( = ?auto_29618 ?auto_29617 ) ) ( not ( = ?auto_29613 ?auto_29617 ) ) ( not ( = ?auto_29611 ?auto_29617 ) ) ( not ( = ?auto_29606 ?auto_29617 ) ) ( not ( = ?auto_29607 ?auto_29617 ) ) ( IS-CRATE ?auto_29607 ) ( not ( = ?auto_29596 ?auto_29598 ) ) ( not ( = ?auto_29597 ?auto_29598 ) ) ( not ( = ?auto_29599 ?auto_29598 ) ) ( not ( = ?auto_29609 ?auto_29598 ) ) ( not ( = ?auto_29604 ?auto_29598 ) ) ( not ( = ?auto_29618 ?auto_29598 ) ) ( not ( = ?auto_29613 ?auto_29598 ) ) ( not ( = ?auto_29611 ?auto_29598 ) ) ( not ( = ?auto_29606 ?auto_29598 ) ) ( not ( = ?auto_29607 ?auto_29598 ) ) ( not ( = ?auto_29617 ?auto_29598 ) ) ( AVAILABLE ?auto_29620 ) ( SURFACE-AT ?auto_29607 ?auto_29619 ) ( ON ?auto_29607 ?auto_29601 ) ( CLEAR ?auto_29607 ) ( not ( = ?auto_29596 ?auto_29601 ) ) ( not ( = ?auto_29597 ?auto_29601 ) ) ( not ( = ?auto_29599 ?auto_29601 ) ) ( not ( = ?auto_29609 ?auto_29601 ) ) ( not ( = ?auto_29604 ?auto_29601 ) ) ( not ( = ?auto_29618 ?auto_29601 ) ) ( not ( = ?auto_29613 ?auto_29601 ) ) ( not ( = ?auto_29611 ?auto_29601 ) ) ( not ( = ?auto_29606 ?auto_29601 ) ) ( not ( = ?auto_29607 ?auto_29601 ) ) ( not ( = ?auto_29617 ?auto_29601 ) ) ( not ( = ?auto_29598 ?auto_29601 ) ) ( SURFACE-AT ?auto_29610 ?auto_29616 ) ( CLEAR ?auto_29610 ) ( IS-CRATE ?auto_29598 ) ( not ( = ?auto_29596 ?auto_29610 ) ) ( not ( = ?auto_29597 ?auto_29610 ) ) ( not ( = ?auto_29599 ?auto_29610 ) ) ( not ( = ?auto_29609 ?auto_29610 ) ) ( not ( = ?auto_29604 ?auto_29610 ) ) ( not ( = ?auto_29618 ?auto_29610 ) ) ( not ( = ?auto_29613 ?auto_29610 ) ) ( not ( = ?auto_29611 ?auto_29610 ) ) ( not ( = ?auto_29606 ?auto_29610 ) ) ( not ( = ?auto_29607 ?auto_29610 ) ) ( not ( = ?auto_29617 ?auto_29610 ) ) ( not ( = ?auto_29598 ?auto_29610 ) ) ( not ( = ?auto_29601 ?auto_29610 ) ) ( AVAILABLE ?auto_29603 ) ( IN ?auto_29598 ?auto_29605 ) ( TRUCK-AT ?auto_29605 ?auto_29621 ) ( not ( = ?auto_29621 ?auto_29616 ) ) ( not ( = ?auto_29614 ?auto_29621 ) ) ( not ( = ?auto_29602 ?auto_29621 ) ) ( not ( = ?auto_29615 ?auto_29621 ) ) ( not ( = ?auto_29619 ?auto_29621 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_29605 ?auto_29621 ?auto_29616 )
      ( MAKE-ON ?auto_29596 ?auto_29597 )
      ( MAKE-ON-VERIFY ?auto_29596 ?auto_29597 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29622 - SURFACE
      ?auto_29623 - SURFACE
    )
    :vars
    (
      ?auto_29637 - HOIST
      ?auto_29628 - PLACE
      ?auto_29624 - PLACE
      ?auto_29632 - HOIST
      ?auto_29635 - SURFACE
      ?auto_29638 - SURFACE
      ?auto_29627 - PLACE
      ?auto_29640 - HOIST
      ?auto_29641 - SURFACE
      ?auto_29643 - SURFACE
      ?auto_29646 - SURFACE
      ?auto_29630 - SURFACE
      ?auto_29625 - PLACE
      ?auto_29626 - HOIST
      ?auto_29636 - SURFACE
      ?auto_29631 - SURFACE
      ?auto_29644 - PLACE
      ?auto_29645 - HOIST
      ?auto_29642 - SURFACE
      ?auto_29647 - SURFACE
      ?auto_29634 - SURFACE
      ?auto_29633 - SURFACE
      ?auto_29629 - TRUCK
      ?auto_29639 - PLACE
      ?auto_29648 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29637 ?auto_29628 ) ( IS-CRATE ?auto_29622 ) ( not ( = ?auto_29622 ?auto_29623 ) ) ( not ( = ?auto_29624 ?auto_29628 ) ) ( HOIST-AT ?auto_29632 ?auto_29624 ) ( not ( = ?auto_29637 ?auto_29632 ) ) ( AVAILABLE ?auto_29632 ) ( SURFACE-AT ?auto_29622 ?auto_29624 ) ( ON ?auto_29622 ?auto_29635 ) ( CLEAR ?auto_29622 ) ( not ( = ?auto_29622 ?auto_29635 ) ) ( not ( = ?auto_29623 ?auto_29635 ) ) ( IS-CRATE ?auto_29623 ) ( not ( = ?auto_29622 ?auto_29638 ) ) ( not ( = ?auto_29623 ?auto_29638 ) ) ( not ( = ?auto_29635 ?auto_29638 ) ) ( not ( = ?auto_29627 ?auto_29628 ) ) ( not ( = ?auto_29624 ?auto_29627 ) ) ( HOIST-AT ?auto_29640 ?auto_29627 ) ( not ( = ?auto_29637 ?auto_29640 ) ) ( not ( = ?auto_29632 ?auto_29640 ) ) ( SURFACE-AT ?auto_29623 ?auto_29627 ) ( ON ?auto_29623 ?auto_29641 ) ( CLEAR ?auto_29623 ) ( not ( = ?auto_29622 ?auto_29641 ) ) ( not ( = ?auto_29623 ?auto_29641 ) ) ( not ( = ?auto_29635 ?auto_29641 ) ) ( not ( = ?auto_29638 ?auto_29641 ) ) ( IS-CRATE ?auto_29638 ) ( not ( = ?auto_29622 ?auto_29643 ) ) ( not ( = ?auto_29623 ?auto_29643 ) ) ( not ( = ?auto_29635 ?auto_29643 ) ) ( not ( = ?auto_29638 ?auto_29643 ) ) ( not ( = ?auto_29641 ?auto_29643 ) ) ( AVAILABLE ?auto_29640 ) ( SURFACE-AT ?auto_29638 ?auto_29627 ) ( ON ?auto_29638 ?auto_29646 ) ( CLEAR ?auto_29638 ) ( not ( = ?auto_29622 ?auto_29646 ) ) ( not ( = ?auto_29623 ?auto_29646 ) ) ( not ( = ?auto_29635 ?auto_29646 ) ) ( not ( = ?auto_29638 ?auto_29646 ) ) ( not ( = ?auto_29641 ?auto_29646 ) ) ( not ( = ?auto_29643 ?auto_29646 ) ) ( IS-CRATE ?auto_29643 ) ( not ( = ?auto_29622 ?auto_29630 ) ) ( not ( = ?auto_29623 ?auto_29630 ) ) ( not ( = ?auto_29635 ?auto_29630 ) ) ( not ( = ?auto_29638 ?auto_29630 ) ) ( not ( = ?auto_29641 ?auto_29630 ) ) ( not ( = ?auto_29643 ?auto_29630 ) ) ( not ( = ?auto_29646 ?auto_29630 ) ) ( not ( = ?auto_29625 ?auto_29628 ) ) ( not ( = ?auto_29624 ?auto_29625 ) ) ( not ( = ?auto_29627 ?auto_29625 ) ) ( HOIST-AT ?auto_29626 ?auto_29625 ) ( not ( = ?auto_29637 ?auto_29626 ) ) ( not ( = ?auto_29632 ?auto_29626 ) ) ( not ( = ?auto_29640 ?auto_29626 ) ) ( AVAILABLE ?auto_29626 ) ( SURFACE-AT ?auto_29643 ?auto_29625 ) ( ON ?auto_29643 ?auto_29636 ) ( CLEAR ?auto_29643 ) ( not ( = ?auto_29622 ?auto_29636 ) ) ( not ( = ?auto_29623 ?auto_29636 ) ) ( not ( = ?auto_29635 ?auto_29636 ) ) ( not ( = ?auto_29638 ?auto_29636 ) ) ( not ( = ?auto_29641 ?auto_29636 ) ) ( not ( = ?auto_29643 ?auto_29636 ) ) ( not ( = ?auto_29646 ?auto_29636 ) ) ( not ( = ?auto_29630 ?auto_29636 ) ) ( IS-CRATE ?auto_29630 ) ( not ( = ?auto_29622 ?auto_29631 ) ) ( not ( = ?auto_29623 ?auto_29631 ) ) ( not ( = ?auto_29635 ?auto_29631 ) ) ( not ( = ?auto_29638 ?auto_29631 ) ) ( not ( = ?auto_29641 ?auto_29631 ) ) ( not ( = ?auto_29643 ?auto_29631 ) ) ( not ( = ?auto_29646 ?auto_29631 ) ) ( not ( = ?auto_29630 ?auto_29631 ) ) ( not ( = ?auto_29636 ?auto_29631 ) ) ( not ( = ?auto_29644 ?auto_29628 ) ) ( not ( = ?auto_29624 ?auto_29644 ) ) ( not ( = ?auto_29627 ?auto_29644 ) ) ( not ( = ?auto_29625 ?auto_29644 ) ) ( HOIST-AT ?auto_29645 ?auto_29644 ) ( not ( = ?auto_29637 ?auto_29645 ) ) ( not ( = ?auto_29632 ?auto_29645 ) ) ( not ( = ?auto_29640 ?auto_29645 ) ) ( not ( = ?auto_29626 ?auto_29645 ) ) ( SURFACE-AT ?auto_29630 ?auto_29644 ) ( ON ?auto_29630 ?auto_29642 ) ( CLEAR ?auto_29630 ) ( not ( = ?auto_29622 ?auto_29642 ) ) ( not ( = ?auto_29623 ?auto_29642 ) ) ( not ( = ?auto_29635 ?auto_29642 ) ) ( not ( = ?auto_29638 ?auto_29642 ) ) ( not ( = ?auto_29641 ?auto_29642 ) ) ( not ( = ?auto_29643 ?auto_29642 ) ) ( not ( = ?auto_29646 ?auto_29642 ) ) ( not ( = ?auto_29630 ?auto_29642 ) ) ( not ( = ?auto_29636 ?auto_29642 ) ) ( not ( = ?auto_29631 ?auto_29642 ) ) ( IS-CRATE ?auto_29631 ) ( not ( = ?auto_29622 ?auto_29647 ) ) ( not ( = ?auto_29623 ?auto_29647 ) ) ( not ( = ?auto_29635 ?auto_29647 ) ) ( not ( = ?auto_29638 ?auto_29647 ) ) ( not ( = ?auto_29641 ?auto_29647 ) ) ( not ( = ?auto_29643 ?auto_29647 ) ) ( not ( = ?auto_29646 ?auto_29647 ) ) ( not ( = ?auto_29630 ?auto_29647 ) ) ( not ( = ?auto_29636 ?auto_29647 ) ) ( not ( = ?auto_29631 ?auto_29647 ) ) ( not ( = ?auto_29642 ?auto_29647 ) ) ( AVAILABLE ?auto_29645 ) ( SURFACE-AT ?auto_29631 ?auto_29644 ) ( ON ?auto_29631 ?auto_29634 ) ( CLEAR ?auto_29631 ) ( not ( = ?auto_29622 ?auto_29634 ) ) ( not ( = ?auto_29623 ?auto_29634 ) ) ( not ( = ?auto_29635 ?auto_29634 ) ) ( not ( = ?auto_29638 ?auto_29634 ) ) ( not ( = ?auto_29641 ?auto_29634 ) ) ( not ( = ?auto_29643 ?auto_29634 ) ) ( not ( = ?auto_29646 ?auto_29634 ) ) ( not ( = ?auto_29630 ?auto_29634 ) ) ( not ( = ?auto_29636 ?auto_29634 ) ) ( not ( = ?auto_29631 ?auto_29634 ) ) ( not ( = ?auto_29642 ?auto_29634 ) ) ( not ( = ?auto_29647 ?auto_29634 ) ) ( SURFACE-AT ?auto_29633 ?auto_29628 ) ( CLEAR ?auto_29633 ) ( IS-CRATE ?auto_29647 ) ( not ( = ?auto_29622 ?auto_29633 ) ) ( not ( = ?auto_29623 ?auto_29633 ) ) ( not ( = ?auto_29635 ?auto_29633 ) ) ( not ( = ?auto_29638 ?auto_29633 ) ) ( not ( = ?auto_29641 ?auto_29633 ) ) ( not ( = ?auto_29643 ?auto_29633 ) ) ( not ( = ?auto_29646 ?auto_29633 ) ) ( not ( = ?auto_29630 ?auto_29633 ) ) ( not ( = ?auto_29636 ?auto_29633 ) ) ( not ( = ?auto_29631 ?auto_29633 ) ) ( not ( = ?auto_29642 ?auto_29633 ) ) ( not ( = ?auto_29647 ?auto_29633 ) ) ( not ( = ?auto_29634 ?auto_29633 ) ) ( AVAILABLE ?auto_29637 ) ( TRUCK-AT ?auto_29629 ?auto_29639 ) ( not ( = ?auto_29639 ?auto_29628 ) ) ( not ( = ?auto_29624 ?auto_29639 ) ) ( not ( = ?auto_29627 ?auto_29639 ) ) ( not ( = ?auto_29625 ?auto_29639 ) ) ( not ( = ?auto_29644 ?auto_29639 ) ) ( HOIST-AT ?auto_29648 ?auto_29639 ) ( LIFTING ?auto_29648 ?auto_29647 ) ( not ( = ?auto_29637 ?auto_29648 ) ) ( not ( = ?auto_29632 ?auto_29648 ) ) ( not ( = ?auto_29640 ?auto_29648 ) ) ( not ( = ?auto_29626 ?auto_29648 ) ) ( not ( = ?auto_29645 ?auto_29648 ) ) )
    :subtasks
    ( ( !LOAD ?auto_29648 ?auto_29647 ?auto_29629 ?auto_29639 )
      ( MAKE-ON ?auto_29622 ?auto_29623 )
      ( MAKE-ON-VERIFY ?auto_29622 ?auto_29623 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29649 - SURFACE
      ?auto_29650 - SURFACE
    )
    :vars
    (
      ?auto_29674 - HOIST
      ?auto_29672 - PLACE
      ?auto_29651 - PLACE
      ?auto_29660 - HOIST
      ?auto_29673 - SURFACE
      ?auto_29668 - SURFACE
      ?auto_29658 - PLACE
      ?auto_29653 - HOIST
      ?auto_29655 - SURFACE
      ?auto_29662 - SURFACE
      ?auto_29665 - SURFACE
      ?auto_29659 - SURFACE
      ?auto_29671 - PLACE
      ?auto_29666 - HOIST
      ?auto_29657 - SURFACE
      ?auto_29656 - SURFACE
      ?auto_29663 - PLACE
      ?auto_29664 - HOIST
      ?auto_29661 - SURFACE
      ?auto_29654 - SURFACE
      ?auto_29669 - SURFACE
      ?auto_29652 - SURFACE
      ?auto_29670 - TRUCK
      ?auto_29667 - PLACE
      ?auto_29675 - HOIST
      ?auto_29676 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29674 ?auto_29672 ) ( IS-CRATE ?auto_29649 ) ( not ( = ?auto_29649 ?auto_29650 ) ) ( not ( = ?auto_29651 ?auto_29672 ) ) ( HOIST-AT ?auto_29660 ?auto_29651 ) ( not ( = ?auto_29674 ?auto_29660 ) ) ( AVAILABLE ?auto_29660 ) ( SURFACE-AT ?auto_29649 ?auto_29651 ) ( ON ?auto_29649 ?auto_29673 ) ( CLEAR ?auto_29649 ) ( not ( = ?auto_29649 ?auto_29673 ) ) ( not ( = ?auto_29650 ?auto_29673 ) ) ( IS-CRATE ?auto_29650 ) ( not ( = ?auto_29649 ?auto_29668 ) ) ( not ( = ?auto_29650 ?auto_29668 ) ) ( not ( = ?auto_29673 ?auto_29668 ) ) ( not ( = ?auto_29658 ?auto_29672 ) ) ( not ( = ?auto_29651 ?auto_29658 ) ) ( HOIST-AT ?auto_29653 ?auto_29658 ) ( not ( = ?auto_29674 ?auto_29653 ) ) ( not ( = ?auto_29660 ?auto_29653 ) ) ( SURFACE-AT ?auto_29650 ?auto_29658 ) ( ON ?auto_29650 ?auto_29655 ) ( CLEAR ?auto_29650 ) ( not ( = ?auto_29649 ?auto_29655 ) ) ( not ( = ?auto_29650 ?auto_29655 ) ) ( not ( = ?auto_29673 ?auto_29655 ) ) ( not ( = ?auto_29668 ?auto_29655 ) ) ( IS-CRATE ?auto_29668 ) ( not ( = ?auto_29649 ?auto_29662 ) ) ( not ( = ?auto_29650 ?auto_29662 ) ) ( not ( = ?auto_29673 ?auto_29662 ) ) ( not ( = ?auto_29668 ?auto_29662 ) ) ( not ( = ?auto_29655 ?auto_29662 ) ) ( AVAILABLE ?auto_29653 ) ( SURFACE-AT ?auto_29668 ?auto_29658 ) ( ON ?auto_29668 ?auto_29665 ) ( CLEAR ?auto_29668 ) ( not ( = ?auto_29649 ?auto_29665 ) ) ( not ( = ?auto_29650 ?auto_29665 ) ) ( not ( = ?auto_29673 ?auto_29665 ) ) ( not ( = ?auto_29668 ?auto_29665 ) ) ( not ( = ?auto_29655 ?auto_29665 ) ) ( not ( = ?auto_29662 ?auto_29665 ) ) ( IS-CRATE ?auto_29662 ) ( not ( = ?auto_29649 ?auto_29659 ) ) ( not ( = ?auto_29650 ?auto_29659 ) ) ( not ( = ?auto_29673 ?auto_29659 ) ) ( not ( = ?auto_29668 ?auto_29659 ) ) ( not ( = ?auto_29655 ?auto_29659 ) ) ( not ( = ?auto_29662 ?auto_29659 ) ) ( not ( = ?auto_29665 ?auto_29659 ) ) ( not ( = ?auto_29671 ?auto_29672 ) ) ( not ( = ?auto_29651 ?auto_29671 ) ) ( not ( = ?auto_29658 ?auto_29671 ) ) ( HOIST-AT ?auto_29666 ?auto_29671 ) ( not ( = ?auto_29674 ?auto_29666 ) ) ( not ( = ?auto_29660 ?auto_29666 ) ) ( not ( = ?auto_29653 ?auto_29666 ) ) ( AVAILABLE ?auto_29666 ) ( SURFACE-AT ?auto_29662 ?auto_29671 ) ( ON ?auto_29662 ?auto_29657 ) ( CLEAR ?auto_29662 ) ( not ( = ?auto_29649 ?auto_29657 ) ) ( not ( = ?auto_29650 ?auto_29657 ) ) ( not ( = ?auto_29673 ?auto_29657 ) ) ( not ( = ?auto_29668 ?auto_29657 ) ) ( not ( = ?auto_29655 ?auto_29657 ) ) ( not ( = ?auto_29662 ?auto_29657 ) ) ( not ( = ?auto_29665 ?auto_29657 ) ) ( not ( = ?auto_29659 ?auto_29657 ) ) ( IS-CRATE ?auto_29659 ) ( not ( = ?auto_29649 ?auto_29656 ) ) ( not ( = ?auto_29650 ?auto_29656 ) ) ( not ( = ?auto_29673 ?auto_29656 ) ) ( not ( = ?auto_29668 ?auto_29656 ) ) ( not ( = ?auto_29655 ?auto_29656 ) ) ( not ( = ?auto_29662 ?auto_29656 ) ) ( not ( = ?auto_29665 ?auto_29656 ) ) ( not ( = ?auto_29659 ?auto_29656 ) ) ( not ( = ?auto_29657 ?auto_29656 ) ) ( not ( = ?auto_29663 ?auto_29672 ) ) ( not ( = ?auto_29651 ?auto_29663 ) ) ( not ( = ?auto_29658 ?auto_29663 ) ) ( not ( = ?auto_29671 ?auto_29663 ) ) ( HOIST-AT ?auto_29664 ?auto_29663 ) ( not ( = ?auto_29674 ?auto_29664 ) ) ( not ( = ?auto_29660 ?auto_29664 ) ) ( not ( = ?auto_29653 ?auto_29664 ) ) ( not ( = ?auto_29666 ?auto_29664 ) ) ( SURFACE-AT ?auto_29659 ?auto_29663 ) ( ON ?auto_29659 ?auto_29661 ) ( CLEAR ?auto_29659 ) ( not ( = ?auto_29649 ?auto_29661 ) ) ( not ( = ?auto_29650 ?auto_29661 ) ) ( not ( = ?auto_29673 ?auto_29661 ) ) ( not ( = ?auto_29668 ?auto_29661 ) ) ( not ( = ?auto_29655 ?auto_29661 ) ) ( not ( = ?auto_29662 ?auto_29661 ) ) ( not ( = ?auto_29665 ?auto_29661 ) ) ( not ( = ?auto_29659 ?auto_29661 ) ) ( not ( = ?auto_29657 ?auto_29661 ) ) ( not ( = ?auto_29656 ?auto_29661 ) ) ( IS-CRATE ?auto_29656 ) ( not ( = ?auto_29649 ?auto_29654 ) ) ( not ( = ?auto_29650 ?auto_29654 ) ) ( not ( = ?auto_29673 ?auto_29654 ) ) ( not ( = ?auto_29668 ?auto_29654 ) ) ( not ( = ?auto_29655 ?auto_29654 ) ) ( not ( = ?auto_29662 ?auto_29654 ) ) ( not ( = ?auto_29665 ?auto_29654 ) ) ( not ( = ?auto_29659 ?auto_29654 ) ) ( not ( = ?auto_29657 ?auto_29654 ) ) ( not ( = ?auto_29656 ?auto_29654 ) ) ( not ( = ?auto_29661 ?auto_29654 ) ) ( AVAILABLE ?auto_29664 ) ( SURFACE-AT ?auto_29656 ?auto_29663 ) ( ON ?auto_29656 ?auto_29669 ) ( CLEAR ?auto_29656 ) ( not ( = ?auto_29649 ?auto_29669 ) ) ( not ( = ?auto_29650 ?auto_29669 ) ) ( not ( = ?auto_29673 ?auto_29669 ) ) ( not ( = ?auto_29668 ?auto_29669 ) ) ( not ( = ?auto_29655 ?auto_29669 ) ) ( not ( = ?auto_29662 ?auto_29669 ) ) ( not ( = ?auto_29665 ?auto_29669 ) ) ( not ( = ?auto_29659 ?auto_29669 ) ) ( not ( = ?auto_29657 ?auto_29669 ) ) ( not ( = ?auto_29656 ?auto_29669 ) ) ( not ( = ?auto_29661 ?auto_29669 ) ) ( not ( = ?auto_29654 ?auto_29669 ) ) ( SURFACE-AT ?auto_29652 ?auto_29672 ) ( CLEAR ?auto_29652 ) ( IS-CRATE ?auto_29654 ) ( not ( = ?auto_29649 ?auto_29652 ) ) ( not ( = ?auto_29650 ?auto_29652 ) ) ( not ( = ?auto_29673 ?auto_29652 ) ) ( not ( = ?auto_29668 ?auto_29652 ) ) ( not ( = ?auto_29655 ?auto_29652 ) ) ( not ( = ?auto_29662 ?auto_29652 ) ) ( not ( = ?auto_29665 ?auto_29652 ) ) ( not ( = ?auto_29659 ?auto_29652 ) ) ( not ( = ?auto_29657 ?auto_29652 ) ) ( not ( = ?auto_29656 ?auto_29652 ) ) ( not ( = ?auto_29661 ?auto_29652 ) ) ( not ( = ?auto_29654 ?auto_29652 ) ) ( not ( = ?auto_29669 ?auto_29652 ) ) ( AVAILABLE ?auto_29674 ) ( TRUCK-AT ?auto_29670 ?auto_29667 ) ( not ( = ?auto_29667 ?auto_29672 ) ) ( not ( = ?auto_29651 ?auto_29667 ) ) ( not ( = ?auto_29658 ?auto_29667 ) ) ( not ( = ?auto_29671 ?auto_29667 ) ) ( not ( = ?auto_29663 ?auto_29667 ) ) ( HOIST-AT ?auto_29675 ?auto_29667 ) ( not ( = ?auto_29674 ?auto_29675 ) ) ( not ( = ?auto_29660 ?auto_29675 ) ) ( not ( = ?auto_29653 ?auto_29675 ) ) ( not ( = ?auto_29666 ?auto_29675 ) ) ( not ( = ?auto_29664 ?auto_29675 ) ) ( AVAILABLE ?auto_29675 ) ( SURFACE-AT ?auto_29654 ?auto_29667 ) ( ON ?auto_29654 ?auto_29676 ) ( CLEAR ?auto_29654 ) ( not ( = ?auto_29649 ?auto_29676 ) ) ( not ( = ?auto_29650 ?auto_29676 ) ) ( not ( = ?auto_29673 ?auto_29676 ) ) ( not ( = ?auto_29668 ?auto_29676 ) ) ( not ( = ?auto_29655 ?auto_29676 ) ) ( not ( = ?auto_29662 ?auto_29676 ) ) ( not ( = ?auto_29665 ?auto_29676 ) ) ( not ( = ?auto_29659 ?auto_29676 ) ) ( not ( = ?auto_29657 ?auto_29676 ) ) ( not ( = ?auto_29656 ?auto_29676 ) ) ( not ( = ?auto_29661 ?auto_29676 ) ) ( not ( = ?auto_29654 ?auto_29676 ) ) ( not ( = ?auto_29669 ?auto_29676 ) ) ( not ( = ?auto_29652 ?auto_29676 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29675 ?auto_29654 ?auto_29676 ?auto_29667 )
      ( MAKE-ON ?auto_29649 ?auto_29650 )
      ( MAKE-ON-VERIFY ?auto_29649 ?auto_29650 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29677 - SURFACE
      ?auto_29678 - SURFACE
    )
    :vars
    (
      ?auto_29682 - HOIST
      ?auto_29695 - PLACE
      ?auto_29698 - PLACE
      ?auto_29688 - HOIST
      ?auto_29696 - SURFACE
      ?auto_29699 - SURFACE
      ?auto_29691 - PLACE
      ?auto_29687 - HOIST
      ?auto_29703 - SURFACE
      ?auto_29683 - SURFACE
      ?auto_29684 - SURFACE
      ?auto_29697 - SURFACE
      ?auto_29694 - PLACE
      ?auto_29679 - HOIST
      ?auto_29685 - SURFACE
      ?auto_29692 - SURFACE
      ?auto_29689 - PLACE
      ?auto_29702 - HOIST
      ?auto_29686 - SURFACE
      ?auto_29690 - SURFACE
      ?auto_29700 - SURFACE
      ?auto_29701 - SURFACE
      ?auto_29681 - PLACE
      ?auto_29680 - HOIST
      ?auto_29704 - SURFACE
      ?auto_29693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29682 ?auto_29695 ) ( IS-CRATE ?auto_29677 ) ( not ( = ?auto_29677 ?auto_29678 ) ) ( not ( = ?auto_29698 ?auto_29695 ) ) ( HOIST-AT ?auto_29688 ?auto_29698 ) ( not ( = ?auto_29682 ?auto_29688 ) ) ( AVAILABLE ?auto_29688 ) ( SURFACE-AT ?auto_29677 ?auto_29698 ) ( ON ?auto_29677 ?auto_29696 ) ( CLEAR ?auto_29677 ) ( not ( = ?auto_29677 ?auto_29696 ) ) ( not ( = ?auto_29678 ?auto_29696 ) ) ( IS-CRATE ?auto_29678 ) ( not ( = ?auto_29677 ?auto_29699 ) ) ( not ( = ?auto_29678 ?auto_29699 ) ) ( not ( = ?auto_29696 ?auto_29699 ) ) ( not ( = ?auto_29691 ?auto_29695 ) ) ( not ( = ?auto_29698 ?auto_29691 ) ) ( HOIST-AT ?auto_29687 ?auto_29691 ) ( not ( = ?auto_29682 ?auto_29687 ) ) ( not ( = ?auto_29688 ?auto_29687 ) ) ( SURFACE-AT ?auto_29678 ?auto_29691 ) ( ON ?auto_29678 ?auto_29703 ) ( CLEAR ?auto_29678 ) ( not ( = ?auto_29677 ?auto_29703 ) ) ( not ( = ?auto_29678 ?auto_29703 ) ) ( not ( = ?auto_29696 ?auto_29703 ) ) ( not ( = ?auto_29699 ?auto_29703 ) ) ( IS-CRATE ?auto_29699 ) ( not ( = ?auto_29677 ?auto_29683 ) ) ( not ( = ?auto_29678 ?auto_29683 ) ) ( not ( = ?auto_29696 ?auto_29683 ) ) ( not ( = ?auto_29699 ?auto_29683 ) ) ( not ( = ?auto_29703 ?auto_29683 ) ) ( AVAILABLE ?auto_29687 ) ( SURFACE-AT ?auto_29699 ?auto_29691 ) ( ON ?auto_29699 ?auto_29684 ) ( CLEAR ?auto_29699 ) ( not ( = ?auto_29677 ?auto_29684 ) ) ( not ( = ?auto_29678 ?auto_29684 ) ) ( not ( = ?auto_29696 ?auto_29684 ) ) ( not ( = ?auto_29699 ?auto_29684 ) ) ( not ( = ?auto_29703 ?auto_29684 ) ) ( not ( = ?auto_29683 ?auto_29684 ) ) ( IS-CRATE ?auto_29683 ) ( not ( = ?auto_29677 ?auto_29697 ) ) ( not ( = ?auto_29678 ?auto_29697 ) ) ( not ( = ?auto_29696 ?auto_29697 ) ) ( not ( = ?auto_29699 ?auto_29697 ) ) ( not ( = ?auto_29703 ?auto_29697 ) ) ( not ( = ?auto_29683 ?auto_29697 ) ) ( not ( = ?auto_29684 ?auto_29697 ) ) ( not ( = ?auto_29694 ?auto_29695 ) ) ( not ( = ?auto_29698 ?auto_29694 ) ) ( not ( = ?auto_29691 ?auto_29694 ) ) ( HOIST-AT ?auto_29679 ?auto_29694 ) ( not ( = ?auto_29682 ?auto_29679 ) ) ( not ( = ?auto_29688 ?auto_29679 ) ) ( not ( = ?auto_29687 ?auto_29679 ) ) ( AVAILABLE ?auto_29679 ) ( SURFACE-AT ?auto_29683 ?auto_29694 ) ( ON ?auto_29683 ?auto_29685 ) ( CLEAR ?auto_29683 ) ( not ( = ?auto_29677 ?auto_29685 ) ) ( not ( = ?auto_29678 ?auto_29685 ) ) ( not ( = ?auto_29696 ?auto_29685 ) ) ( not ( = ?auto_29699 ?auto_29685 ) ) ( not ( = ?auto_29703 ?auto_29685 ) ) ( not ( = ?auto_29683 ?auto_29685 ) ) ( not ( = ?auto_29684 ?auto_29685 ) ) ( not ( = ?auto_29697 ?auto_29685 ) ) ( IS-CRATE ?auto_29697 ) ( not ( = ?auto_29677 ?auto_29692 ) ) ( not ( = ?auto_29678 ?auto_29692 ) ) ( not ( = ?auto_29696 ?auto_29692 ) ) ( not ( = ?auto_29699 ?auto_29692 ) ) ( not ( = ?auto_29703 ?auto_29692 ) ) ( not ( = ?auto_29683 ?auto_29692 ) ) ( not ( = ?auto_29684 ?auto_29692 ) ) ( not ( = ?auto_29697 ?auto_29692 ) ) ( not ( = ?auto_29685 ?auto_29692 ) ) ( not ( = ?auto_29689 ?auto_29695 ) ) ( not ( = ?auto_29698 ?auto_29689 ) ) ( not ( = ?auto_29691 ?auto_29689 ) ) ( not ( = ?auto_29694 ?auto_29689 ) ) ( HOIST-AT ?auto_29702 ?auto_29689 ) ( not ( = ?auto_29682 ?auto_29702 ) ) ( not ( = ?auto_29688 ?auto_29702 ) ) ( not ( = ?auto_29687 ?auto_29702 ) ) ( not ( = ?auto_29679 ?auto_29702 ) ) ( SURFACE-AT ?auto_29697 ?auto_29689 ) ( ON ?auto_29697 ?auto_29686 ) ( CLEAR ?auto_29697 ) ( not ( = ?auto_29677 ?auto_29686 ) ) ( not ( = ?auto_29678 ?auto_29686 ) ) ( not ( = ?auto_29696 ?auto_29686 ) ) ( not ( = ?auto_29699 ?auto_29686 ) ) ( not ( = ?auto_29703 ?auto_29686 ) ) ( not ( = ?auto_29683 ?auto_29686 ) ) ( not ( = ?auto_29684 ?auto_29686 ) ) ( not ( = ?auto_29697 ?auto_29686 ) ) ( not ( = ?auto_29685 ?auto_29686 ) ) ( not ( = ?auto_29692 ?auto_29686 ) ) ( IS-CRATE ?auto_29692 ) ( not ( = ?auto_29677 ?auto_29690 ) ) ( not ( = ?auto_29678 ?auto_29690 ) ) ( not ( = ?auto_29696 ?auto_29690 ) ) ( not ( = ?auto_29699 ?auto_29690 ) ) ( not ( = ?auto_29703 ?auto_29690 ) ) ( not ( = ?auto_29683 ?auto_29690 ) ) ( not ( = ?auto_29684 ?auto_29690 ) ) ( not ( = ?auto_29697 ?auto_29690 ) ) ( not ( = ?auto_29685 ?auto_29690 ) ) ( not ( = ?auto_29692 ?auto_29690 ) ) ( not ( = ?auto_29686 ?auto_29690 ) ) ( AVAILABLE ?auto_29702 ) ( SURFACE-AT ?auto_29692 ?auto_29689 ) ( ON ?auto_29692 ?auto_29700 ) ( CLEAR ?auto_29692 ) ( not ( = ?auto_29677 ?auto_29700 ) ) ( not ( = ?auto_29678 ?auto_29700 ) ) ( not ( = ?auto_29696 ?auto_29700 ) ) ( not ( = ?auto_29699 ?auto_29700 ) ) ( not ( = ?auto_29703 ?auto_29700 ) ) ( not ( = ?auto_29683 ?auto_29700 ) ) ( not ( = ?auto_29684 ?auto_29700 ) ) ( not ( = ?auto_29697 ?auto_29700 ) ) ( not ( = ?auto_29685 ?auto_29700 ) ) ( not ( = ?auto_29692 ?auto_29700 ) ) ( not ( = ?auto_29686 ?auto_29700 ) ) ( not ( = ?auto_29690 ?auto_29700 ) ) ( SURFACE-AT ?auto_29701 ?auto_29695 ) ( CLEAR ?auto_29701 ) ( IS-CRATE ?auto_29690 ) ( not ( = ?auto_29677 ?auto_29701 ) ) ( not ( = ?auto_29678 ?auto_29701 ) ) ( not ( = ?auto_29696 ?auto_29701 ) ) ( not ( = ?auto_29699 ?auto_29701 ) ) ( not ( = ?auto_29703 ?auto_29701 ) ) ( not ( = ?auto_29683 ?auto_29701 ) ) ( not ( = ?auto_29684 ?auto_29701 ) ) ( not ( = ?auto_29697 ?auto_29701 ) ) ( not ( = ?auto_29685 ?auto_29701 ) ) ( not ( = ?auto_29692 ?auto_29701 ) ) ( not ( = ?auto_29686 ?auto_29701 ) ) ( not ( = ?auto_29690 ?auto_29701 ) ) ( not ( = ?auto_29700 ?auto_29701 ) ) ( AVAILABLE ?auto_29682 ) ( not ( = ?auto_29681 ?auto_29695 ) ) ( not ( = ?auto_29698 ?auto_29681 ) ) ( not ( = ?auto_29691 ?auto_29681 ) ) ( not ( = ?auto_29694 ?auto_29681 ) ) ( not ( = ?auto_29689 ?auto_29681 ) ) ( HOIST-AT ?auto_29680 ?auto_29681 ) ( not ( = ?auto_29682 ?auto_29680 ) ) ( not ( = ?auto_29688 ?auto_29680 ) ) ( not ( = ?auto_29687 ?auto_29680 ) ) ( not ( = ?auto_29679 ?auto_29680 ) ) ( not ( = ?auto_29702 ?auto_29680 ) ) ( AVAILABLE ?auto_29680 ) ( SURFACE-AT ?auto_29690 ?auto_29681 ) ( ON ?auto_29690 ?auto_29704 ) ( CLEAR ?auto_29690 ) ( not ( = ?auto_29677 ?auto_29704 ) ) ( not ( = ?auto_29678 ?auto_29704 ) ) ( not ( = ?auto_29696 ?auto_29704 ) ) ( not ( = ?auto_29699 ?auto_29704 ) ) ( not ( = ?auto_29703 ?auto_29704 ) ) ( not ( = ?auto_29683 ?auto_29704 ) ) ( not ( = ?auto_29684 ?auto_29704 ) ) ( not ( = ?auto_29697 ?auto_29704 ) ) ( not ( = ?auto_29685 ?auto_29704 ) ) ( not ( = ?auto_29692 ?auto_29704 ) ) ( not ( = ?auto_29686 ?auto_29704 ) ) ( not ( = ?auto_29690 ?auto_29704 ) ) ( not ( = ?auto_29700 ?auto_29704 ) ) ( not ( = ?auto_29701 ?auto_29704 ) ) ( TRUCK-AT ?auto_29693 ?auto_29695 ) )
    :subtasks
    ( ( !DRIVE ?auto_29693 ?auto_29695 ?auto_29681 )
      ( MAKE-ON ?auto_29677 ?auto_29678 )
      ( MAKE-ON-VERIFY ?auto_29677 ?auto_29678 ) )
  )

)

